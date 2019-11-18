DROP TABLE IF EXISTS followers;
DROP TABLE IF EXISTS comment_likes;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS post_likes;
DROP TABLE IF EXISTS insta_posts;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER NOT NULL AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  active BOOLEAN NOT NULL DEFAULT true,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  PRIMARY KEY (id)
);

CREATE TABLE insta_posts (
  id INTEGER NOT NULL AUTO_INCREMENT,
  user_id INTEGER NOT NULL,
  image_url VARCHAR(255) NOT NULL,
  message VARCHAR(255) NOT NULL,
  active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT,
  PRIMARY KEY (id)
);

CREATE TABLE post_likes (
  id INTEGER NOT NULL AUTO_INCREMENT,
  user_id INTEGER NOT NULL,
  post_id INTEGER NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT,
  FOREIGN KEY (post_id) REFERENCES insta_posts(id) ON DELETE RESTRICT,
  PRIMARY KEY (id)
);

CREATE TABLE comments (
  id INTEGER NOT NULL AUTO_INCREMENT,
  user_id INTEGER NOT NULL,
  post_id INTEGER NOT NULL,
  message VARCHAR(255) NOT NULL,
  active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT,
  FOREIGN KEY (post_id) REFERENCES insta_posts(id) ON DELETE RESTRICT,
  PRIMARY KEY (id)
);

CREATE TABLE comment_likes (
  id INTEGER NOT NULL AUTO_INCREMENT,
  user_id INTEGER NOT NULL,
  comment_id INTEGER NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT,
  FOREIGN KEY (comment_id) REFERENCES comments(id) ON DELETE RESTRICT,
  PRIMARY KEY (id)
);

CREATE TABLE followers (
  id INTEGER NOT NULL AUTO_INCREMENT,
  follower_id INTEGER NOT NULL,
  following_id INTEGER NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  FOREIGN KEY (follower_id) REFERENCES users(id) ON DELETE RESTRICT,
  FOREIGN KEY (following_id) REFERENCES users(id) ON DELETE RESTRICT,
  PRIMARY KEY (id)
);