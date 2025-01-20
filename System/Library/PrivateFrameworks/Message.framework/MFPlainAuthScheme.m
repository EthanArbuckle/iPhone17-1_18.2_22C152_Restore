@interface MFPlainAuthScheme
- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4;
- (Class)authenticatorClass;
- (id)authenticatorForAccount:(id)a3 connection:(id)a4;
- (id)humanReadableName;
- (id)name;
@end

@implementation MFPlainAuthScheme

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
}

- (id)authenticatorForAccount:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() saslProfileName];
  if ([v8 isEqualToString:@"pop"]) {
    goto LABEL_8;
  }
  v9 = [v7 authenticationMechanisms];
  if ([v9 indexOfObject:*MEMORY[0x1E4F607A8]] == 0x7FFFFFFFFFFFFFFFLL
    || (v10 = (objc_class *)objc_opt_class()) == 0)
  {
    if ([v8 isEqualToString:@"smtp"]
      && [v9 indexOfObject:*MEMORY[0x1E4F607A0]] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (objc_class *)objc_opt_class();

      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
    }
LABEL_8:
    v11 = 0;
    goto LABEL_11;
  }

LABEL_10:
  v11 = (void *)[[v10 alloc] initWithAuthenticationScheme:self account:v6 connection:v7];
LABEL_11:

  return v11;
}

- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)MFPlainAuthScheme;
  if ([(ECAuthenticationScheme *)&v9 canAuthenticateAccountClass:a3 connection:v6])
  {
    int v7 = [v6 loginDisabled] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)name
{
  return (id)*MEMORY[0x1E4F607A8];
}

- (id)humanReadableName
{
  return MFLookupLocalizedString(@"MESSAGE_AUTH_PLAIN_TEXT", @"Password", @"Delayed");
}

@end