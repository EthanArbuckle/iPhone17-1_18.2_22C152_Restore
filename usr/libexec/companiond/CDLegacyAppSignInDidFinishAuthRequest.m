@interface CDLegacyAppSignInDidFinishAuthRequest
- (AKAuthorization)authorization;
- (CDLegacyAppSignInDidFinishAuthRequest)initWithRapportDictionary:(id)a3;
- (NSError)error;
- (NSString)description;
- (id)makeRapportDictionary;
- (void)setAuthorization:(id)a3;
- (void)setError:(id)a3;
@end

@implementation CDLegacyAppSignInDidFinishAuthRequest

- (CDLegacyAppSignInDidFinishAuthRequest)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CDLegacyAppSignInDidFinishAuthRequest;
  v5 = [(CDLegacyAppSignInDidFinishAuthRequest *)&v13 init];
  if (v5)
  {
    v6 = self;
    uint64_t v7 = sub_10001CD14(v4, @"Authorization", (uint64_t)v6);
    authorization = v5->_authorization;
    v5->_authorization = (AKAuthorization *)v7;

    v9 = self;
    uint64_t v10 = sub_10001CD14(v4, @"Error", (uint64_t)v9);
    error = v5->_error;
    v5->_error = (NSError *)v10;
  }
  return v5;
}

- (id)makeRapportDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = sub_10001D014((uint64_t)self->_authorization);
  [v3 setObject:v4 forKeyedSubscript:@"Authorization"];

  v5 = sub_10001D014((uint64_t)self->_error);
  [v3 setObject:v5 forKeyedSubscript:@"Error"];

  id v6 = [v3 copy];

  return v6;
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_authorization withName:@"authorization" skipIfNil:1];
  id v5 = [v3 appendObject:self->_error withName:@"error" skipIfNil:1];
  id v6 = [v3 build];

  return (NSString *)v6;
}

- (AKAuthorization)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_authorization, 0);
}

@end