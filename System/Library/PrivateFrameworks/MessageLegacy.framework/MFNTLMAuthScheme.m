@interface MFNTLMAuthScheme
- (BOOL)hasEncryption;
- (BOOL)sendsPlainTextPasswords;
- (Class)authenticatorClass;
- (id)humanReadableName;
- (id)name;
@end

@implementation MFNTLMAuthScheme

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
}

- (id)name
{
  return @"NTLM";
}

- (id)humanReadableName
{
  return (id)MFLookupLocalizedString(@"MESSAGE_AUTH_NTLM", @"NTLM", @"Delayed");
}

- (BOOL)sendsPlainTextPasswords
{
  return 0;
}

- (BOOL)hasEncryption
{
  return 1;
}

@end