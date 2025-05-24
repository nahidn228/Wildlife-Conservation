🔶 ১. What is PostgreSQL?

PostgreSQL (পোস্টগ্রে-এসকিউএল) হলো একটি শক্তিশালী ডেটাবেজ ম্যানেজমেন্ট সিস্টেম বা  সফটওয়্যার, যা আমাদের ডেটা সংরক্ষণ ও পরিচালনা করতে সাহায্য করে।
এটি দিয়ে বড় বড় ওয়েবসাইট বা অ্যাপ্লিকেশনের ডেটা সেভ, আপডেট, ডিলিট ও খুঁজে পাওয়া যায়।
যেমন: কোনো স্কুল, হাসপাতাল বা অনলাইন শপে যত রকম তথ্য থাকে—সব কিছু একটি সিস্টেমে গুছিয়ে রাখার জন্য PostgreSQL ব্যবহার করা হয়।


🔶 ২. What is the purpose of a database schema in PostgreSQL?
Schema হচ্ছে ডেটাবেসের ভিতরে আলাদা আলাদা ড্রয়ার বা ফোল্ডার, যেখানে টেবিল, ভিউ, ফাংশন ইত্যাদি গুছিয়ে রাখা যায়। এটি ডেটাবেসকে পরিষ্কার ও সংগঠিত রাখে।
এটি security and maintanance  আরও সহজ করে

CREATE SCHEMA wildlife;
CREATE SCHEMA forest_security;

🔶 ৩. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
✅ Primary Key:
টেবিলের প্রতিটি রেকর্ডকে আলাদা আলাদা চিহ্নিত করতে ব্যবহার হয়।
একটি টেবিলে শুধুমাত্র একটি প্রাইমারি কি থাকতে পারে এবং এর মান কখনো NULL হতে পারে না বা ডুপ্লিকেট হতে পারে না।

✅ Foreign Key:
এটি এমন একটি কলাম যা অন্য টেবিলের প্রাইমারি কি-কে রেফারেন্স করে। 
এটি অন্য একটি টেবিলের Primary Key এর সঙ্গে সম্পর্ক তৈরি করে।
এর মাধ্যমে দুটি টেবিলের মধ্যে সম্পর্ক তৈরি হয় এবং রেফারেন্স করা ডেটার data integrity বজায় থাকে। 


🎯  উদাহরণ:
CREATE TABLE rangers(
  ranger_id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE sightings(
  sighting_id SERIAL PRIMARY KEY,
  ranger_id INT,
  FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id)
);

এখানে ranger_id হলো Primary Key, rangers টেবিলে।
 আর একই ranger_id, sightings টেবিলে Foreign Key হিসেবে এসেছে।

🔶 ৪. What is the difference between VARCHAR and CHAR data types?
✅ VARCHAR কী?
VARCHAR মানে হচ্ছে Variable Character। এটা এমন একটা ডেটা টাইপ যেটাতে আমরা যত অক্ষরের কিছু লিখি, ঠিক ততটুকু জায়গা নেয়।
যেমনঃ VARCHAR(20) দিয়ে যদি "Cat" লিখি, তাহলে শুধু ৩ অক্ষরই ব্যবহার হবে।

 যখন ইনপুট ছোট-বড় হতে পারে তখন আমরা এটা use করি।  যেমনঃ কারো নাম, ঠিকানা বা ইমেইল।

✅ CHAR কী?
CHAR মানে হচ্ছে Fixed Length Character। এটা সবসময় নির্দিষ্ট সাইজের জায়গা নেয়।
যেমনঃ CHAR(5) দিয়ে যদি "Dog" লিখি, তাহলে ওটা "Dog " হিসেবে ৫টা অক্ষরই নিয়ে ফেলে (শেষের স্পেসসহ)।


🔶 ৫. Explain the purpose of the WHERE clause in a SELECT statement.
WHERE ব্যবহার করা হয় কোনো শর্ত দিয়ে ডেটা খুঁজে বের করতে।

🎯 উদাহরণ: SELECT * FROM rangers WHERE region = 'Northern Hills';
এই কোডটি শুধু সেই রেঞ্জারদের দেখাবে যারা ‘Northern Hills’ অঞ্চলে কাজ করে।


