@interface MFSASLAuthenticator
- (BOOL)base64EncodeResponseData;
- (BOOL)couldRetry;
- (BOOL)isUsingSSL;
- (BOOL)justSentPlainTextPassword;
- (BOOL)supportsInitialClientResponse;
- (MFSASLAuthenticator)initWithAuthScheme:(id)a3 account:(id)a4 connection:(id)a5;
- (id)account;
- (id)authScheme;
- (id)responseForServerData:(id)a3;
- (id)saslName;
- (id)securityLayer;
- (int)authenticationState;
- (void)dealloc;
- (void)setAuthenticationState:(int)a3;
- (void)setMissingPasswordError;
@end

@implementation MFSASLAuthenticator

- (MFSASLAuthenticator)initWithAuthScheme:(id)a3 account:(id)a4 connection:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MFSASLAuthenticator;
  v8 = [(MFSASLAuthenticator *)&v10 init];
  if (v8)
  {
    v8->_authScheme = (MFAuthScheme *)a3;
    v8->_account = (MFAccount *)a4;
    v8->_connection = (MFConnection *)a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFSASLAuthenticator;
  [(MFSASLAuthenticator *)&v3 dealloc];
}

- (id)authScheme
{
  return self->_authScheme;
}

- (id)account
{
  return self->_account;
}

- (id)saslName
{
  return [(MFAuthScheme *)self->_authScheme name];
}

- (BOOL)supportsInitialClientResponse
{
  return 0;
}

- (id)responseForServerData:(id)a3
{
  return 0;
}

- (int)authenticationState
{
  return self->_authenticationState;
}

- (void)setAuthenticationState:(int)a3
{
  self->_authenticationState = a3;
}

- (BOOL)justSentPlainTextPassword
{
  return 0;
}

- (id)securityLayer
{
  return 0;
}

- (BOOL)isUsingSSL
{
  v2 = [(MFConnection *)self->_connection securityProtocol];
  if (v2) {
    LOBYTE(v2) = [(NSString *)v2 caseInsensitiveCompare:*MEMORY[0x1E4F1D4C0]] != NSOrderedSame;
  }
  return (char)v2;
}

- (BOOL)base64EncodeResponseData
{
  return 1;
}

- (BOOL)couldRetry
{
  return 0;
}

- (void)setMissingPasswordError
{
  uint64_t v2 = objc_msgSend(-[MFSASLAuthenticator account](self, "account"), "missingPasswordErrorWithTitle:", 0);
  id v3 = +[MFActivityMonitor currentMonitor];
  [v3 setError:v2];
}

@end