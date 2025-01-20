@interface MFCRAM_MD5AuthScheme
- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4;
- (BOOL)hasEncryption;
- (BOOL)sendsPlainTextPasswords;
- (Class)authenticatorClass;
- (id)humanReadableName;
- (id)name;
@end

@implementation MFCRAM_MD5AuthScheme

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
}

- (id)name
{
  return (id)*MEMORY[0x1E4F605F0];
}

- (id)humanReadableName
{
  return MFLookupLocalizedString(@"MESSAGE_AUTH_CRAM_MD5", @"MD5 Challenge-Response", @"Delayed");
}

- (BOOL)sendsPlainTextPasswords
{
  return 0;
}

- (BOOL)hasEncryption
{
  return 0;
}

- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MFCRAM_MD5AuthScheme;
  return [(ECAuthenticationScheme *)&v5 canAuthenticateAccountClass:a3 connection:a4];
}

@end