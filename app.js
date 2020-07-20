let express = require('express');
let mysql = require('mysql');
let bcrypt = require('bcryptjs');
let bodyParser = require('body-parser');
let app = express();



app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + "/public"));

var connection = mysql.createConnection({
    host        : 'localhost',
    user        : 'root',
    password    : 'cupcake',
    database    : 'join_us',
    multipleStatements: true,
});

connection.connect();


app.get("/users", (req, res) => {
    // GET ALL USERS

    const query = "SELECT * FROM users JOIN user_info ui on users.id = ui.user_id";
    //const query = "SELECT * FROM users";

    connection.query(query, (error, results, fields)=>{
        if (error) throw error;
        console.log(results);
        // res.send(results);
        res.render("pages/users", {results});
    })
});

app.get("/advertisers", (req, res) => {
   // GET ALL advertisers

    let query = new Promise((resolve, reject) => {
        const q = "select * from advertisers_info join advertisers a on advertisers_info.advertiser_id = a.id";

       connection.query(q,( err, res) =>{
          if(err){
              return reject("db", `${err.message}`);
          }
          //console.log(res);
          resolve(res);
       });
   })

    query.then((results)=>{
        console.log(results);
        // res.send(results);
        res.render("pages/advertisers", {results});
    })

});

/**
 *
 */
app.get("/advertiser/:id", (req, res) =>{

        let query = new Promise((resolve, reject) => {

            const q = `SELECT  * FROM advertisers
                    JOIN advertisers_info ON advertisers.id = advertisers_info.advertiser_id
                    where advertiser_id= ${req.params.id}`;

            connection.query(q,( err, res) =>{
                if(err){
                    return reject("db", `${err.message}`);
                }
                console.log(res);
                resolve(res);
            });
        })
        query.then((results)=>{
            let query_two = new Promise((resolve, reject) => {
                const q2 = `SELECT * from campaigns
                                join tags t on campaigns.id = t.campaign_id
                                where advertiser_id=${req.params.id}`;
                connection.query(q2, (err, res)=>{
                    if(err){
                        return reject("db", `${err.message}`);
                    }
                    //console.log(res);
                    resolve(res);
                })
            });

            query_two.then((data)=>{
                console.log(results);
                //res.send( {advertiser: results[0], campaign: data, photo_id: req.params.id});
                res.render("pages/advertiser", {advertiser: results[0], campaign: data, photo_id: req.params.id});
            })

        })
})

app.get("/likes", (req, res) =>{
    let query = new Promise((resolve, reject) => {

        const q = 'select photo_id, COUNT(*) as frequency, image_url, p.user_id from likes join photos p on likes.photo_id = p.id group by photo_id order by frequency desc';

        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            resolve(res);
        });
    })
    query.then((results)=>{
        console.log(results);
        res.send(results);
        //res.render("pages/advertiser", {results, photo_id: req.params.id});
    })
})



app.get("/photos", (req, res) => {
    let query = new Promise((resolve, reject) => {
        const q = "SELECT * from photos";
        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            resolve(res);
        });
    })
    query.then((results)=>{
        // res.send(results);
        res.render("pages/photos", {results});
    })
});

app.get("/photo/:id", (req, res) =>{
    let query = new Promise((resolve, reject) => {
        const q =`SELECT comment_text, photo_id, comments.user_id AS user_ID, username, comments.created_at, image_url, 
                    comments.id AS comment_id from comments join users u on comments.user_id = u.id 
                    join photos p on comments.photo_id = p.id WHERE photo_id=${req.params.id}`;
        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            // console.log(res);
            resolve(res);
        });
    })
    query.then((results)=>{
        let query_two = new Promise((resolve, reject) => {
            const q2 = `select Count(*) as likes from likes where photo_id=${req.params.id}`;
            connection.query(q2, (err, res)=>{
                if(err){
                    return reject("db", `${err.message}`);
                }
                //console.log(res);
                resolve(res);
            })
        })

        query_two.then((answers) =>{

            let query_three = new Promise((resolve, reject) => {
                const q3 = `SELECT * from photo_tags join tags t on photo_tags.tag_id = t.id where photo_id=${req.params.id}`;
                connection.query(q3, (err, res)=>{
                    if(err){
                        return reject("db", `${err.message}`);
                    }
                    //console.log(res);
                    resolve(res);
                })
            })

            query_three.then((data)=>{
                const {likes} = answers[0];
                console.log(results[0]);
                let output = results.map(result =>{
                    return {
                        created_at: result['created_at'],
                        username: result['username'],
                        comment: result['comment_text'],
                        user_id: result['user_ID'],
                        comment_id: result['comment_id']
                    }
                });
                // res.send({
                //     photo_id: req.params.id,
                //     image_url: results[0].image_url,
                //     'results': output,
                //     likes,
                //     tags: data
                // });
                res.render("pages/photo", {
                    photo_id: req.params.id,
                    image_url: results[0].image_url,
                    'results': output,
                    likes,
                    tags: data
                });
            })


        })
    })
});

app.get("/profiles", (req, res) => {
    let query = new Promise((resolve, reject) => {
        const q = "SELECT * from users join user_info ui on users.id = ui.user_id";
        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            //console.log(res);
            resolve(res);
        });
    })

    query.then((results)=>{
        console.log(results);
        res.render("pages/profiles", {results});
    })
});

app.get("/profile/:id", (req, res) => {
    let query = new Promise((resolve, reject) => {
        const q = `SELECT users.id AS user_id, username, image_url, email, phone, users.created_at, set_child_friendly, disable_account from users join user_info ui on users.id = ui.user_id join user_setting us on users.id = us.user_id where users.id=${req.params.id}`;
        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            //console.log(res);
            resolve(res);
        });
    })

    query.then((results)=>{

        let query_two = new Promise((resolve, reject) => {
            const q2 = `SELECT COUNT(*) AS followers from follows where followee_id=${req.params.id}`;
            connection.query(q2, (err, res)=>{
                if(err){
                    return reject("db", `${err.message}`);
                }
                //console.log(res);
                resolve(res);
            })
        })

        query_two.then((followers) =>{
            const profile = {
                ...results[0],
                followers : followers[0].followers
            };
            // console.log(profile);
            //res.send(profile);
            res.render("pages/profile", {profile});
        });
    });

});

app.get("/edit/:id", (req, res)=>{
    const {id} = req.params;
    let query = new Promise((resolve, reject) => {
        const q = `SELECT users.id AS user_id, username, image_url, email, phone, users.created_at, set_child_friendly, 
        disable_account from users join user_info ui on users.id = ui.user_id join user_setting us on users.id = us.user_id where users.id=${id}`;
        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            //console.log(res);
            resolve(res);
        });
    })

    query.then((results)=>{

        let query_two = new Promise((resolve, reject) => {
            const q2 = `SELECT COUNT(*) AS followers from follows where followee_id=${req.params.id}`;
            connection.query(q2, (err, res)=>{
                if(err){
                    return reject("db", `${err.message}`);
                }
                //console.log(res);
                resolve(res);
            })
        })

        query_two.then((followers) =>{
            const profile = {
                ...results[0],
                followers : followers[0].followers
            };
            // console.log(profile);
            //res.send(profile);
            res.render("pages/edit-profile", {profile});
        });


    });
})

app.post('/update/:id', (req, res) =>{
    const {id} = req.params;
    const {username, email, imageURL, phone, parentalCheck, disabledCheck} = req.body;
    console.log(username, email, imageURL, phone, parentalCheck, disabledCheck);
    console.log(id);
    const parentalCode = parentalCheck === 'on'? 1 : 0;
    const disabledCode = disabledCheck === 'on'? 1: 0;

    // UPDATE USERNAME

    let query = new Promise((resolve, reject) => {
        const q = `update users set username='${username}' where id=${id}`;
        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            //console.log(res);
            resolve(res);
        });
    })
    query.then(data1=> {
        console.log(data1);
        // UPDATE user info: email, imageURL, phone
        let query_two = new Promise((resolve, reject) => {
            const q = `update user_info set image_url='${imageURL}', email='${email}', phone=${phone} where user_id=${id}`;
            connection.query(q,( err, res) =>{
                if(err){
                    return reject("db", `${err.message}`);
                }
                //console.log(res);
                resolve(res);
            });
        })
        query_two.then(data2=>{
            console.log(data2);
            let query_three = new Promise((resolve, reject) => {
                const q = `update user_setting set set_child_friendly=${parentalCode}, disable_account=${disabledCode} where user_id=${id}`;
                connection.query(q,( err, res) =>{
                    if(err){
                        return reject("db", `${err.message}`);
                    }
                    //console.log(res);
                    resolve(res);
                });
            })

            query_three.then(data3 => {
                console.log(data3);
                return res.redirect(`/profile/${id}`);
            })



        })
    })
})

app.get("/tags", (req, res) => {
    let query = new Promise((resolve, reject) => {
        const q = "select tag_name, Count(*) as freq from photo_tags join tags t on photo_tags.tag_id = t.id join photos p on photo_tags.photo_id = p.id group by tag_name";

        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            //console.log(res);
            resolve(res);
        });
    })

    query.then((results)=>{
        //console.log(results);
        res.send(results);
        //res.render("pages/advertisers", {results});
    })
});

app.get("/", (req, res) =>{
    let query = new Promise((resolve, reject) => {
        const q = 'SELECT users.id AS ID, username,  caption, photos.created_at AS created_At, photos.image_url, photos.id AS photo_id, ui.image_url AS profile_url  FROM users join photos on users.id = photos.user_id join user_info ui on users.id = ui.user_id';

        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            resolve(res);
        });
    })
    query.then((results)=>{

        let query_two = new Promise((resolve, reject) => {
            const q2 = 'SELECT photo_id, COUNT(*) AS FREQ FROM likes group by photo_id';
            connection.query(q2, (err, res)=>{
                if(err){
                    return reject("db", `${err.message}`);
                }
                resolve(res);
            })
        })

        query_two.then((answers) =>{
            let output = results.map(result =>{
                const f = answers.find(answer => answer.photo_id === result.photo_id)
                return {
                    ...result,
                    freq : f
                }
            });
            let query_three = new Promise((resolve, reject) => {
                const q3 = 'SELECT photos.id AS photo_id, comment_text, photos.created_at, c.user_id, username, ui.image_url from photos join comments c on photos.id = c.photo_id join users u on photos.user_id = u.id join user_info ui on u.id = ui.user_id;\n';

                connection.query(q3, (err, res) =>{
                    if (err) {
                        return reject("db", `${err.message}`);
                    }
                    //console.log(res);
                    resolve(res);
                })
            })

            query_three.then((response) => {
                let result = output.map(el =>{
                    const commentArray = response.filter(obj => obj.photo_id === el.photo_id);
                    return {
                        ...el,
                        comments: commentArray
                    }
                })

                res.render("pages/home",{
                    result,
                    output,
                    response
                })
                // res.send({
                //     result,
                //     output,
                //     response
                // })
            })

        })

    })
})

app.get("/campaigns", (req, res) => {
    let query = new Promise((resolve, reject) => {
        //const q = "SELECT photos.id, photos.image_url AS image_url, users.id, photos.caption AS caption,photos.created_at AS created_at, users.username AS username from photos join users on photos.user_id = users.id";
        const q = "SELECT * FROM campaigns";
        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            resolve(res);
        });
    })
    query.then((results)=>{
        //console.log(results);
        res.send(results);
        //res.render("pages/photos", {results});
    })
});

app.get('/followers', (req, res) => {
    let query = new Promise((resolve, reject) => {

        const q = "select username, followee_id, COUNT(*) as no_followers from follows join users u on follows.followee_id = u.id group by followee_id order by no_followers desc";
        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            resolve(res);
        });
    })
    query.then((results)=>{
        //console.log(results);
        res.send(results);
        // res.render("pages/photos", {results});
    })
});

app.get('/adjudicate/comment', (req, res) => {
    let query = new Promise((resolve, reject) => {

        const q = "SELECT adjudicate_comment.id as ac_id, reason, adjudicate_comment.created_at as ac_created_at, c.id as comment_id, " +
            "comment_text, user_id, username from adjudicate_comment join comments c on adjudicate_comment.comment_id = c.id join users u on c.user_id = u.id";
        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            resolve(res);
        });
    });
    query.then((results)=>{
       //console.log(results);
       res.render('pages/review-comment', {results});
    });
});

app.get('/adjudicate/photo', (req, res) => {
    let query = new Promise((resolve, reject) => {

        const q = "SELECT adjudicate_photo.id AS ap_id, reason, adjudicate_photo.created_at AS ap_created_at,p.id as photo_id," +
            "p.image_url as photo_url, p.caption as photo_caption, username from adjudicate_photo " +
            "join photos p on adjudicate_photo.photo_id = p.id join users u on p.user_id = u.id";
        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            resolve(res);
        });
    });
    query.then((results)=>{
        // console.log(results);
        //res.send(results);
        res.render('pages/review-photo', {results});
    });

})

app.get("/create/profile", (req, res)=> {

    res.render('pages/new-profile');
})

app.post('/profile', (req, res)=> {

    const {username, email, imageURL, phone, password, parentalCheck}  = req.body;

    if (!username || !email || !imageURL) {
        return res.send('Missing info')
    }

    let query = new Promise((resolve, reject) => {

        const q =`INSERT INTO users (username) values ('${username}')`;
        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            resolve(res);
        });
    })

    query.then(()=>{
        //get ID
        let query_two = new Promise((resolve, reject) => {
            const q2 ='SELECT LAST_INSERT_ID()';
            connection.query(q2,( err, res) =>{
                if(err){
                    return reject("db", `${err.message}`);
                }
                resolve(res);
            });
        });

        query_two.then(data2 => {
            const id = data2[0]['LAST_INSERT_ID()'];
            // INSERT to user_info
            let query_three = new Promise((resolve, reject) => {
                const phone_num = phone || 0000000000;
                const q3 =`INSERT INTO user_info (image_url, email, phone, user_id) VALUES
                            ('${imageURL}', '${email}', ${phone_num}, ${id} )`;
                connection.query(q3,( err, res) =>{
                    if(err){
                        return reject("db", `${err.message}`);
                    }
                    resolve(res);
                });
            });
            query_three.then(()=>{
                // INSERT INTO user settings

                let query_four = new Promise((resolve, reject) => {
                    // Hash password
                    const hash_password = bcrypt.hashSync(password, 8);
                    const child_settings = parentalCheck === 'on'? 1: 0;

                    const q4 =`INSERT INTO user_setting (set_child_friendly, user_id, password, disable_account) VALUES
                            (${child_settings}, ${id},  '${hash_password}', 0)`;
                    connection.query(q4,( err, res) =>{
                        if(err){
                            return reject("db", `${err.message}`);
                        }
                        resolve(res);
                    });
                });

                query_four.then(()=>{
                    // go to profiles page
                    res.redirect('/profiles');
                })

            });
        })
    })


    // res.redirect('/profiles');
})


app.get("/metrics", (req, res)=>{

    let query = new Promise((resolve, reject) => {

        const q = "SELECT users.id, users.username, COUNT(*) AS followers from users join follows f on users.id = f.followee_id group by followee_id order by followers desc limit 5";
        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            resolve(res);
        });
    })
    query.then((results)=>{
        const names = results.map(result => result.username);
        const freq = results.map(result => result.followers);

        let query_two = new Promise((resolve, reject) => {
            const q2 = 'select p.user_id,u.username, photo_id, Count(*) as total_likes from likes join photos p on likes.photo_id = p.id join users u on p.user_id = u.id group by photo_id order by total_likes desc limit 5';

            connection.query(q2,( err, res) =>{
                if(err){
                    return reject("db", `${err.message}`);
                }
                resolve(res);
            });
        });

        query_two.then(results2 =>{
            const most_like_names = results2.map(el => el.username);
            const most_like_count = results2.map(el => el.total_likes);

            let query_three = new Promise((resolve, reject) => {
                const q3 = 'SELECT tag_id,tag_name, COUNT(*) as freq from photo_tags join tags t on photo_tags.tag_id = t.id group by tag_id';

                connection.query(q3,( err, res) =>{
                    if(err){
                        return reject("db", `${err.message}`);
                    }
                    resolve(res);
                });
            })

            query_three.then(results3 =>{
                const list_tag_names = results3.map(el => el['tag_name'].trim());
                const list_tag_freq = results3.map(el => el.freq);
                res.render('pages/metrics', {
                    names,
                    freq,
                    most_like_count,
                    most_like_names,
                    list_tag_names,
                    list_tag_freq
                });
            })
        })
    })

})

app.post('/ad', (req, res) =>{

    const {action} = req.body;
    const [route, ...rest] = action.split('-');
    const ids = rest.map(el=>{
        const [key, value] = el.split('/');
        return {
            'type': key,
            'value' : parseInt(value, 10)
        }
    })

    const adjudicate = ids.filter(el => el.type === 'ac')[0];
    const comment = ids.filter(el => el.type === 'cm')[0];


    // REMOVE Adjudicate comment

    let query = new Promise((resolve, reject) => {

        const q = `DELETE from adjudicate_comment where id=${adjudicate.value}`;
        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            resolve(res);
        });
    })

    query.then(()=>{
        if(route === 'reject'){
            return res.redirect('/adjudicate/comment');
        }

        let query_two = new Promise((resolve, reject) => {

            const q = `DELETE from comments where id=${comment.value}`;
            connection.query(q,( err, res) =>{
                if(err){
                    return reject("db", `${err.message}`);
                }
                resolve(res);
            });
        });

        query_two.then(()=> {;
            res.redirect('/adjudicate/comment');
        });

    })
})

app.post('/ad2', (req, res) =>{
    const {action} = req.body;
    const [route, ...rest] = action.split('-');
    const ids = rest.map(el=>{
        const [key, value] = el.split('/');
        return {
            'type': key,
            'value' : parseInt(value, 10)
        }
    })
    const adjudicate = ids.filter(el => el.type === 'ap')[0];
    const photo = ids.filter(el => el.type === 'ph')[0];

    // REMOVE Adjudicate comment
    let query = new Promise((resolve, reject) => {

        const q = `DELETE from adjudicate_photo where id=${adjudicate.value}`;
        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            resolve(res);
        });
    })

    query.then(() => {
        if(route === 'reject'){
            return res.redirect('/adjudicate/photo');
        }
        let query_two = new Promise((resolve, reject) => {

            const q = `DELETE from photos where id=${photo.value}`;
            connection.query(q,( err, res) =>{
                if(err){
                    return reject("db", `${err.message}`);
                }
                resolve(res);
            });
        });

        query_two.then(()=> {;
            res.redirect('/adjudicate/photo');
        });
    })
})

app.post('/report', (req, res) => {

   const {action} = req.body;
   const [reason_key, id] =action.split('-');
   const REASONS_REMOVAL = {
        SEXUAL: 'Sexual conduct and not appropriate.',
        RUDE: 'Unacceptable bullying behavior.',
        OTHER: 'Other reason, needs investigation.'
   };
   const reason = REASONS_REMOVAL[reason_key];
    const args = `('${reason}', ${id})`;
    const q = `insert into adjudicate_comment (reason, comment_id) VALUES ${args}`;

    let query = new Promise((resolve, reject) => {
        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            resolve(res);
        });
    })

    query.then(() =>{
        res.redirect('/adjudicate/comment');
    })
});

app.post('/report-photo', (req, res) => {
    const {action} = req.body;
    const [reason_key, id] =action.split('-');
    const REASONS_REMOVAL = {
        SEXUAL: 'Sexual conduct and not appropriate.',
        RUDE: 'Unacceptable bullying behavior.',
        OTHER: 'Other reason, needs investigation.'
    };
    const reason = REASONS_REMOVAL[reason_key];
    const args = `('${reason}', ${id})`;
    const q = `insert into adjudicate_photo (reason, photo_id) values ${args}`;
    let query = new Promise((resolve, reject) => {
        connection.query(q,( err, res) =>{
            if(err){
                return reject("db", `${err.message}`);
            }
            resolve(res);
        });
    })

    query.then(() =>{
        res.redirect('/adjudicate/photo');
    })
});

app.post('/register', (req, res) =>{
    const person = {
        email: req.body.email
    };

    connection.query('INSERT INTO users SET ?', person, function(error, results, fields){
        if (error) throw error;

        res.redirect("/");
    });

});


app.listen(8080, () =>{
    console.log('App listening on port 8080!');
})
