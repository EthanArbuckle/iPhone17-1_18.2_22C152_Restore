@interface MFDigestMD5AuthScheme
- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4;
- (BOOL)hasEncryption;
- (Class)authenticatorClass;
- (id)humanReadableName;
- (id)name;
@end

@implementation MFDigestMD5AuthScheme

- (id)name
{
  return @"DIGEST-MD5";
}

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
}

- (id)humanReadableName
{
  return @"HTTP MD5 Digest";
}

- (BOOL)hasEncryption
{
  return 0;
}

- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MFDigestMD5AuthScheme;
  return [(MFAuthScheme *)&v5 canAuthenticateAccountClass:a3 connection:a4];
}

@end