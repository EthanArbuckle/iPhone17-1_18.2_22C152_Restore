@interface VSApplicationControllerAlertAction
+ (int64_t)styleFromString:(id)a3;
- (NSString)title;
- (id)callback;
- (int64_t)style;
- (void)setCallback:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation VSApplicationControllerAlertAction

+ (int64_t)styleFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"cancel"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqual:@"destructive"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end