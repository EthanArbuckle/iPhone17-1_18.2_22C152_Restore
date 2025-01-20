@interface MapsSiriAction
- (MapsSiriAction)initWithTitle:(id)a3 userInfo:(id)a4;
- (NSDictionary)userInfo;
- (NSString)title;
- (void)setTitle:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation MapsSiriAction

- (MapsSiriAction)initWithTitle:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MapsSiriAction;
  v8 = [(MapsSiriAction *)&v12 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    title = v8->_title;
    v8->_title = v9;

    objc_storeStrong((id *)&v8->_userInfo, a4);
  }

  return v8;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end