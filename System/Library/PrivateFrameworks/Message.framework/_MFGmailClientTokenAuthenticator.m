@interface _MFGmailClientTokenAuthenticator
- (BOOL)justSentPlainTextPassword;
- (BOOL)supportsInitialClientResponse;
- (id)responseForServerData:(id)a3;
- (id)saslName;
@end

@implementation _MFGmailClientTokenAuthenticator

- (id)saslName
{
  return @"PLAIN-CLIENTTOKEN";
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
  if ([(ECSASLAuthenticator *)self authenticationState] == 4) {
    goto LABEL_4;
  }
  if (self->_sentResponse)
  {
    [(ECSASLAuthenticator *)self setAuthenticationState:3];
LABEL_4:
    v4 = 0;
    goto LABEL_5;
  }
  v6 = [(ECSASLAuthenticator *)self account];
  if ([v6 conformsToProtocol:&unk_1EFF5CB00])
  {
    v7 = [v6 username];
    v8 = [v6 password];
    uint64_t v9 = [v6 clientToken];
    v10 = (void *)v9;
    if (v7 && v8 && v9)
    {
      v4 = [MEMORY[0x1E4F1CA58] data];
      char v14 = 0;
      [v4 appendBytes:&v14 length:1];
      v11 = [v7 dataUsingEncoding:4];
      [v4 appendData:v11];

      [v4 appendBytes:&v14 length:1];
      v12 = [v8 dataUsingEncoding:4];
      [v4 appendData:v12];

      [v4 appendBytes:&v14 length:1];
      v13 = [v10 dataUsingEncoding:4];
      [v4 appendData:v13];

      self->_sentResponse = 1;
    }
    else
    {
      [(ECSASLAuthenticator *)self setMissingPasswordError];
      [(ECSASLAuthenticator *)self setAuthenticationState:2];
      v4 = 0;
    }
  }
  else
  {
    [(ECSASLAuthenticator *)self setAuthenticationState:3];
    v4 = 0;
  }

LABEL_5:
  return v4;
}

@end