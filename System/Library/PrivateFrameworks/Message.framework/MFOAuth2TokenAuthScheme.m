@interface MFOAuth2TokenAuthScheme
- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4;
- (Class)authenticatorClass;
- (id)authenticatorForAccount:(id)a3 connection:(id)a4;
- (id)humanReadableName;
- (id)name;
@end

@implementation MFOAuth2TokenAuthScheme

- (id)authenticatorForAccount:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 authenticationMechanisms];
  if ([v8 containsObject:@"XOAUTH2"])
  {
    v9 = [v6 oauth2Token];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      v14.receiver = self;
      v14.super_class = (Class)MFOAuth2TokenAuthScheme;
      v11 = [(ECAuthenticationScheme *)&v14 authenticatorForAccount:v6 connection:v7];
      goto LABEL_6;
    }
  }
  else
  {
  }
  v12 = [MEMORY[0x1E4F607C8] schemeWithName:@"PLAIN-CLIENTTOKEN"];
  v11 = [v12 authenticatorForAccount:v6 connection:v7];

LABEL_6:
  return v11;
}

- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4
{
  id v6 = a4;
  int v7 = [(objc_class *)a3 conformsToProtocol:&unk_1EFF55B90];
  v9.receiver = self;
  v9.super_class = (Class)MFOAuth2TokenAuthScheme;
  LODWORD(a3) = v7 & [(ECAuthenticationScheme *)&v9 canAuthenticateAccountClass:a3 connection:v6];

  return (char)a3;
}

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
}

- (id)name
{
  return @"XOAUTH2";
}

- (id)humanReadableName
{
  return MFLookupLocalizedString(@"MESSAGE_AUTH_OAUTH2TOKEN", @"OAuth 2.0 Token", @"Delayed");
}

@end