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
  id v4 = a3;
  v5 = v4;
  self->_justSentPassword = 0;
  if (!v4) {
    goto LABEL_5;
  }
  id v6 = v4;
  v7 = (const char *)[v6 bytes];
  if ((unint64_t)[v6 length] < 4) {
    goto LABEL_5;
  }
  if (!strncasecmp(v7, "user", 4uLL))
  {
    v10 = [(ECSASLAuthenticator *)self account];
    v11 = [v10 username];
    uint64_t v12 = [v11 dataUsingEncoding:4];
  }
  else
  {
    if (strncasecmp(v7, "pass", 4uLL))
    {
LABEL_5:
      v8 = 0;
      goto LABEL_6;
    }
    self->_justSentPassword = 1;
    v10 = [(ECSASLAuthenticator *)self account];
    v11 = [v10 password];
    uint64_t v12 = [v11 dataUsingEncoding:4];
  }
  v8 = (void *)v12;

LABEL_6:
  return v8;
}

- (BOOL)justSentPlainTextPassword
{
  return self->_justSentPassword;
}

@end