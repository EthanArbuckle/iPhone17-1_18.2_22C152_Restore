@interface OACredential
- (NSString)consumerKey;
- (NSString)consumerSecret;
- (NSString)oauthToken;
- (NSString)oauthTokenSecret;
- (id)signingKey;
- (void)dealloc;
- (void)setConsumerKey:(id)a3;
- (void)setConsumerSecret:(id)a3;
- (void)setOauthToken:(id)a3;
- (void)setOauthTokenSecret:(id)a3;
@end

@implementation OACredential

- (void)setConsumerKey:(id)a3
{
}

- (void)setConsumerSecret:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OACredential;
  [(OACredential *)&v3 dealloc];
}

- (id)signingKey
{
  if ([(OACredential *)self consumerSecret]
    && [(OACredential *)self oauthTokenSecret])
  {
    return (id)[NSString stringWithFormat:@"%@&%@", -[OACredential consumerSecret](self, "consumerSecret"), -[OACredential oauthTokenSecret](self, "oauthTokenSecret")];
  }
  id result = [(OACredential *)self consumerSecret];
  if (result) {
    return (id)[NSString stringWithFormat:@"%@&", -[OACredential consumerSecret](self, "consumerSecret"), v4];
  }
  return result;
}

- (NSString)consumerKey
{
  return self->_consumerKey;
}

- (NSString)consumerSecret
{
  return self->_consumerSecret;
}

- (NSString)oauthToken
{
  return self->_oauthToken;
}

- (void)setOauthToken:(id)a3
{
}

- (NSString)oauthTokenSecret
{
  return self->_oauthTokenSecret;
}

- (void)setOauthTokenSecret:(id)a3
{
}

@end