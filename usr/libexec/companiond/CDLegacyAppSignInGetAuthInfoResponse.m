@interface CDLegacyAppSignInGetAuthInfoResponse
- (AKCredentialRequestContext)credentialRequest;
- (CDLegacyAppSignInGetAuthInfoResponse)initWithRapportDictionary:(id)a3;
- (NSString)description;
- (id)makeRapportDictionary;
- (void)setCredentialRequest:(id)a3;
@end

@implementation CDLegacyAppSignInGetAuthInfoResponse

- (CDLegacyAppSignInGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CDLegacyAppSignInGetAuthInfoResponse;
  v5 = [(CDLegacyAppSignInGetAuthInfoResponse *)&v10 init];
  if (v5)
  {
    v6 = self;
    uint64_t v7 = sub_10001CD14(v4, @"CredentialRequest", (uint64_t)v6);
    credentialRequest = v5->_credentialRequest;
    v5->_credentialRequest = (AKCredentialRequestContext *)v7;
  }
  return v5;
}

- (id)makeRapportDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = sub_10001D014((uint64_t)self->_credentialRequest);
  [v3 setObject:v4 forKeyedSubscript:@"CredentialRequest"];

  id v5 = [v3 copy];

  return v5;
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_credentialRequest withName:@"credentialRequest" skipIfNil:1];
  id v5 = [v3 build];

  return (NSString *)v5;
}

- (AKCredentialRequestContext)credentialRequest
{
  return self->_credentialRequest;
}

- (void)setCredentialRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end