@interface MFNewcastleAuthScheme
+ (void)initialize;
- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4;
- (BOOL)requiresPassword;
- (Class)authenticatorClass;
- (id)humanReadableName;
- (id)name;
@end

@implementation MFNewcastleAuthScheme

+ (void)initialize
{
  v3 = [MEMORY[0x1E4F607C8] schemeWithName:@"ATOKEN"];

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E4F607C8];
    [v4 registerSchemeClass:a1];
  }
}

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
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
  v10.super_class = (Class)MFNewcastleAuthScheme;
  if ((v7 & -[ECAuthenticationScheme canAuthenticateAccountClass:connection:](&v10, sel_canAuthenticateAccountClass_connection_, a3, v6)) == 1)int v8 = [v6 loginDisabled] ^ 1; {
  else
  }
    LOBYTE(v8) = 0;

  return v8;
}

- (id)name
{
  return @"ATOKEN";
}

- (id)humanReadableName
{
  return MFLookupLocalizedString(@"MESSAGE_AUTH_ATOKEN", @"Apple Token", @"Delayed");
}

- (BOOL)requiresPassword
{
  return 0;
}

@end