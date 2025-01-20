@interface _MFOAuth2TokenAuthenticator
- (BOOL)justSentPlainTextPassword;
- (BOOL)supportsInitialClientResponse;
- (id)responseForServerData:(id)a3;
- (id)saslName;
@end

@implementation _MFOAuth2TokenAuthenticator

- (id)saslName
{
  return @"XOAUTH2";
}

- (BOOL)supportsInitialClientResponse
{
  return 1;
}

- (BOOL)justSentPlainTextPassword
{
  return 1;
}

- (id)responseForServerData:(id)a3
{
  id v4 = a3;
  if ([(ECSASLAuthenticator *)self authenticationState] > 1)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (self->_sentResponse)
  {
    v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 3;
    }
    [(ECSASLAuthenticator *)self setAuthenticationState:v6];

    goto LABEL_7;
  }
  v9 = [(ECSASLAuthenticator *)self account];
  if ([v9 conformsToProtocol:&unk_1EFF55B90])
  {
    v10 = [v9 username];
    uint64_t v11 = [v9 oauth2Token];
    v12 = (void *)v11;
    if (v10 && v11)
    {
      v7 = [MEMORY[0x1E4F1CA58] data];
      char v17 = 1;
      v13 = [NSString stringWithFormat:@"user=%@", v10];
      v14 = [v13 dataUsingEncoding:4];
      [v7 appendData:v14];

      [v7 appendBytes:&v17 length:1];
      v15 = [NSString stringWithFormat:@"auth=Bearer %@", v12];
      v16 = [v15 dataUsingEncoding:4];
      [v7 appendData:v16];

      [v7 appendBytes:&v17 length:1];
      [v7 appendBytes:&v17 length:1];
      self->_sentResponse = 1;
    }
    else
    {
      [(ECSASLAuthenticator *)self setMissingPasswordError];
      v7 = 0;
    }
  }
  else
  {
    [(ECSASLAuthenticator *)self setAuthenticationState:3];
    v7 = 0;
  }

LABEL_8:
  return v7;
}

@end