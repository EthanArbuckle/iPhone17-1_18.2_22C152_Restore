@interface _MFLoginAuthenticator
- (BOOL)justSentPlainTextPassword;
- (id)responseForServerData:(id)a3;
- (id)saslName;
@end

@implementation _MFLoginAuthenticator

- (id)saslName
{
  return @"LOGIN";
}

- (id)responseForServerData:(id)a3
{
  *((unsigned char *)&self->super._authenticationState + 4) = 0;
  if (!a3) {
    return 0;
  }
  v5 = (const char *)[a3 bytes];
  if ((unint64_t)[a3 length] < 4) {
    return 0;
  }
  if (!strncasecmp(v5, "user", 4uLL))
  {
    v7 = objc_msgSend(-[MFSASLAuthenticator account](self, "account"), "username");
  }
  else
  {
    if (strncasecmp(v5, "pass", 4uLL)) {
      return 0;
    }
    *((unsigned char *)&self->super._authenticationState + 4) = 1;
    v7 = objc_msgSend(-[MFSASLAuthenticator account](self, "account"), "password");
  }
  return (id)[v7 dataUsingEncoding:4];
}

- (BOOL)justSentPlainTextPassword
{
  return *((unsigned char *)&self->super._authenticationState + 4);
}

@end