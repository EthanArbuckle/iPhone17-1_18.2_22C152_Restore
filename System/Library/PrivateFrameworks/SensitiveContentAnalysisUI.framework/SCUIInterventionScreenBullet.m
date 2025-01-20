@interface SCUIInterventionScreenBullet
+ (id)bullet:(id)a3 imageName:(id)a4 emoji:(id)a5;
- (NSString)emoji;
- (NSString)imageName;
- (NSString)text;
- (void)setEmoji:(id)a3;
- (void)setImageName:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SCUIInterventionScreenBullet

+ (id)bullet:(id)a3 imageName:(id)a4 emoji:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setText:v9];

  [v10 setImageName:v8];
  [v10 setEmoji:v7];

  return v10;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (NSString)emoji
{
  return self->_emoji;
}

- (void)setEmoji:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emoji, 0);
  objc_storeStrong((id *)&self->_imageName, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end