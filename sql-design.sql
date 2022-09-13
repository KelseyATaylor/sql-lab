demo
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(30),
  password TEXT,
  email VARCHAR(50)
  );
  
  CREATE TABLE posts (
  post_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(user_id),
  timestamp TIMESTAMP,
  text VARCHAR(255)
  );


CREATE TABLE likes (
  like_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(user_id),
  post_id INTEGER REFERENCES posts(post_id)
  );

CREATE TABLE verified (
	verified_id SERIAL PRIMARY KEY,
  user_id INTEGER UNIQUE REFERENCES users(user_id),
  date DATE
);

INSERT INTO users (username, email, password)
VALUES ('Alec', 'a@gmail.com', 'abc');

INSERT INTO verified (user_id, date)
VALUES (1, '09/13/22');

SELECT * FROM verified;