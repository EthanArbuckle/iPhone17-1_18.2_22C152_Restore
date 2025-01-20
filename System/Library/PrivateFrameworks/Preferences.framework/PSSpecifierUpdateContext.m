@interface PSSpecifierUpdateContext
+ (PSSpecifierUpdateContext)contextWithUserInfo:(id)a3;
+ (id)context;
- (BOOL)animated;
- (BOOL)updateModelOnly;
- (NSDictionary)userInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAnimated:(BOOL)a3;
- (void)setUpdateModelOnly:(BOOL)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation PSSpecifierUpdateContext

+ (id)context
{
  return (id)[a1 contextWithUserInfo:0];
}

+ (PSSpecifierUpdateContext)contextWithUserInfo:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setUserInfo:v3];

  return (PSSpecifierUpdateContext *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  [v4 setAnimated:self->_animated];
  [v4 setUpdateModelOnly:self->_updateModelOnly];
  [v4 setUserInfo:self->_userInfo];
  return v4;
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PSSpecifierUpdateContext;
  v4 = [(PSSpecifierUpdateContext *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ animated: %d, updateModelOnly: %d, userInfo: %@", v4, self->_animated, self->_updateModelOnly, self->_userInfo];

  return v5;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (BOOL)updateModelOnly
{
  return self->_updateModelOnly;
}

- (void)setUpdateModelOnly:(BOOL)a3
{
  self->_updateModelOnly = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end