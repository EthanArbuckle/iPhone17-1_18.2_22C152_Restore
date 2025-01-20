@interface _MFPlainAuthenticator
- (BOOL)justSentPlainTextPassword;
- (id)responseForServerData:(id)a3;
- (id)saslName;
@end

@implementation _MFPlainAuthenticator

- (id)saslName
{
  return @"PLAIN";
}

- (id)responseForServerData:(id)a3
{
  v4 = objc_msgSend((id)objc_msgSend(-[MFSASLAuthenticator account](self, "account", a3), "username"), "dataUsingEncoding:", 4);
  v5 = objc_msgSend((id)objc_msgSend(-[MFSASLAuthenticator account](self, "account"), "password"), "dataUsingEncoding:", 4);
  if (!v5)
  {
    [(MFSASLAuthenticator *)self setMissingPasswordError];
    return 0;
  }
  if (!v4) {
    return 0;
  }
  v6 = v5;
  char v9 = 0;
  v7 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", objc_msgSend(v4, "length") + objc_msgSend(v5, "length") + 2);
  [v7 appendBytes:&v9 length:1];
  [v7 appendData:v4];
  [v7 appendBytes:&v9 length:1];
  [v7 appendData:v6];
  return v7;
}

- (BOOL)justSentPlainTextPassword
{
  return 1;
}

@end