@interface SSVCookieKey
+ (id)keyWithIdentifier:(id)a3 scope:(int64_t)a4;
- (NSNumber)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)scope;
- (void)setIdentifier:(id)a3;
- (void)setScope:(int64_t)a3;
@end

@implementation SSVCookieKey

+ (id)keyWithIdentifier:(id)a3 scope:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)objc_opt_class());
  [v6 setIdentifier:v5];

  if (v5) {
    [v6 setScope:a4];
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    id v6 = [(SSVCookieKey *)self identifier];
    v7 = (void *)[v6 copyWithZone:a3];
    [v5 setIdentifier:v7];

    objc_msgSend(v5, "setScope:", -[SSVCookieKey scope](self, "scope"));
  }
  return v5;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (void).cxx_destruct
{
}

@end