@interface CDAppSignInDidFinishAuthRequest
- (AKAuthorization)appleIDAuthorization;
- (ASCPlatformPublicKeyCredentialAssertion)platformKeyCredentialAssertion;
- (ASCPlatformPublicKeyCredentialRegistration)platformKeyCredentialRegistration;
- (CASPasswordCredential)passwordCredential;
- (CDAppSignInDidFinishAuthRequest)initWithRapportDictionary:(id)a3;
- (NSError)error;
- (NSString)description;
- (NSURL)webCallbackURL;
- (id)makeRapportDictionary;
- (void)setAppleIDAuthorization:(id)a3;
- (void)setError:(id)a3;
- (void)setPasswordCredential:(id)a3;
- (void)setPlatformKeyCredentialAssertion:(id)a3;
- (void)setPlatformKeyCredentialRegistration:(id)a3;
- (void)setWebCallbackURL:(id)a3;
@end

@implementation CDAppSignInDidFinishAuthRequest

- (CDAppSignInDidFinishAuthRequest)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CDAppSignInDidFinishAuthRequest;
  v5 = [(CDAppSignInDidFinishAuthRequest *)&v25 init];
  if (v5)
  {
    v6 = self;
    uint64_t v7 = sub_10001CD14(v4, @"appleIDAuthorization", (uint64_t)v6);
    appleIDAuthorization = v5->_appleIDAuthorization;
    v5->_appleIDAuthorization = (AKAuthorization *)v7;

    v9 = self;
    uint64_t v10 = sub_10001CD14(v4, @"authError", (uint64_t)v9);
    error = v5->_error;
    v5->_error = (NSError *)v10;

    v12 = self;
    uint64_t v13 = sub_10001CD14(v4, @"passwordCredential", (uint64_t)v12);
    passwordCredential = v5->_passwordCredential;
    v5->_passwordCredential = (CASPasswordCredential *)v13;

    v15 = self;
    uint64_t v16 = sub_10001CD14(v4, @"webCallbackURL", (uint64_t)v15);
    webCallbackURL = v5->_webCallbackURL;
    v5->_webCallbackURL = (NSURL *)v16;

    v18 = self;
    uint64_t v19 = sub_10001CD14(v4, @"platformKeyCredentialAssertion", (uint64_t)v18);
    platformKeyCredentialAssertion = v5->_platformKeyCredentialAssertion;
    v5->_platformKeyCredentialAssertion = (ASCPlatformPublicKeyCredentialAssertion *)v19;

    v21 = self;
    uint64_t v22 = sub_10001CD14(v4, @"platformKeyCredentialRegistration", (uint64_t)v21);
    platformKeyCredentialRegistration = v5->_platformKeyCredentialRegistration;
    v5->_platformKeyCredentialRegistration = (ASCPlatformPublicKeyCredentialRegistration *)v22;
  }
  return v5;
}

- (id)makeRapportDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = sub_10001D014((uint64_t)self->_appleIDAuthorization);
  [v3 setObject:v4 forKeyedSubscript:@"appleIDAuthorization"];

  v5 = sub_10001D014((uint64_t)self->_error);
  [v3 setObject:v5 forKeyedSubscript:@"authError"];

  v6 = sub_10001D014((uint64_t)self->_passwordCredential);
  [v3 setObject:v6 forKeyedSubscript:@"passwordCredential"];

  uint64_t v7 = sub_10001D014((uint64_t)self->_webCallbackURL);
  [v3 setObject:v7 forKeyedSubscript:@"webCallbackURL"];

  v8 = sub_10001D014((uint64_t)self->_platformKeyCredentialAssertion);
  [v3 setObject:v8 forKeyedSubscript:@"platformKeyCredentialAssertion"];

  v9 = sub_10001D014((uint64_t)self->_platformKeyCredentialRegistration);
  [v3 setObject:v9 forKeyedSubscript:@"platformKeyCredentialRegistration"];

  id v10 = [v3 copy];

  return v10;
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_appleIDAuthorization withName:@"appleIDAuthorization" skipIfNil:1];
  id v5 = [v3 appendObject:self->_error withName:@"error" skipIfNil:1];
  id v6 = [v3 appendObject:self->_passwordCredential withName:@"passwordCredential" skipIfNil:1];
  if (self->_webCallbackURL)
  {
    uint64_t v7 = CUPrintNSObjectMasked();
    [v3 appendString:v7 withName:@"webCallbackURL"];
  }
  id v8 = [v3 appendObject:self->_platformKeyCredentialAssertion withName:@"platformKeyCredentialAssertion" skipIfNil:1];
  id v9 = [v3 appendObject:self->_platformKeyCredentialRegistration withName:@"platformKeyCredentialRegistration" skipIfNil:1];
  id v10 = [v3 build];

  return (NSString *)v10;
}

- (AKAuthorization)appleIDAuthorization
{
  return self->_appleIDAuthorization;
}

- (void)setAppleIDAuthorization:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (CASPasswordCredential)passwordCredential
{
  return self->_passwordCredential;
}

- (void)setPasswordCredential:(id)a3
{
}

- (NSURL)webCallbackURL
{
  return self->_webCallbackURL;
}

- (void)setWebCallbackURL:(id)a3
{
}

- (ASCPlatformPublicKeyCredentialAssertion)platformKeyCredentialAssertion
{
  return self->_platformKeyCredentialAssertion;
}

- (void)setPlatformKeyCredentialAssertion:(id)a3
{
}

- (ASCPlatformPublicKeyCredentialRegistration)platformKeyCredentialRegistration
{
  return self->_platformKeyCredentialRegistration;
}

- (void)setPlatformKeyCredentialRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformKeyCredentialRegistration, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialAssertion, 0);
  objc_storeStrong((id *)&self->_webCallbackURL, 0);
  objc_storeStrong((id *)&self->_passwordCredential, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_appleIDAuthorization, 0);
}

@end