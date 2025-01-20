@interface MFGmailClientTokenAuthScheme
- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4;
- (Class)authenticatorClass;
- (id)authenticatorForAccount:(id)a3 connection:(id)a4;
- (id)humanReadableName;
- (id)name;
@end

@implementation MFGmailClientTokenAuthScheme

- (id)authenticatorForAccount:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 authenticationMechanisms];
  int v9 = [v8 containsObject:@"PLAIN-CLIENTTOKEN"];

  if (v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)MFGmailClientTokenAuthScheme;
    v10 = [(ECAuthenticationScheme *)&v13 authenticatorForAccount:v6 connection:v7];
  }
  else
  {
    v11 = [MEMORY[0x1E4F607C8] schemeWithName:&stru_1EFF11268];
    v10 = [v11 authenticatorForAccount:v6 connection:v7];
  }
  return v10;
}

- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4
{
  id v6 = a4;
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()]) {
    int v7 = 1;
  }
  else {
    int v7 = [(objc_class *)a3 isSubclassOfClass:objc_opt_class()];
  }
  v10.receiver = self;
  v10.super_class = (Class)MFGmailClientTokenAuthScheme;
  unsigned int v8 = v7 & [(ECAuthenticationScheme *)&v10 canAuthenticateAccountClass:a3 connection:v6];

  return v8;
}

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
}

- (id)name
{
  return @"PLAIN-CLIENTTOKEN";
}

- (id)humanReadableName
{
  return MFLookupLocalizedString(@"MESSAGE_AUTH_GMAIL_CLIENTTOKEN", @"Gmail Client Token", @"Delayed");
}

@end