@interface MFPlainAuthScheme
- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4;
- (Class)authenticatorClass;
- (id)authenticatorForAccount:(id)a3 connection:(id)a4;
- (id)humanReadableName;
- (id)name;
@end

@implementation MFPlainAuthScheme

- (id)name
{
  return &stru_1F265CF90;
}

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
}

- (id)authenticatorForAccount:(id)a3 connection:(id)a4
{
  v7 = (void *)[(id)objc_opt_class() saslProfileName];
  if ([v7 isEqualToString:@"imap"]) {
    return 0;
  }
  if ([v7 isEqualToString:@"pop"]) {
    return 0;
  }
  v8 = (void *)[a4 authenticationMechanisms];
  if ([v8 indexOfObject:@"PLAIN"] == 0x7FFFFFFFFFFFFFFFLL
    && [v8 indexOfObject:@"LOGIN"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    return 0;
  }
  v9 = (objc_class *)objc_opt_class();
  if (!v9) {
    return 0;
  }
  v10 = (void *)[[v9 alloc] initWithAuthScheme:self account:a3 connection:a4];
  return v10;
}

- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MFPlainAuthScheme;
  unsigned int v5 = -[MFAuthScheme canAuthenticateAccountClass:connection:](&v7, sel_canAuthenticateAccountClass_connection_, a3);
  if (v5) {
    LOBYTE(v5) = [a4 loginDisabled] ^ 1;
  }
  return v5;
}

- (id)humanReadableName
{
  return (id)MFLookupLocalizedString(@"MESSAGE_AUTH_PLAIN_TEXT", @"Password", @"Delayed");
}

@end