@interface TUVouchingEnablementImpl
- (BOOL)isEnabled;
- (BOOL)serverBagValueForKey:(id)a3 withDefault:(BOOL)a4;
- (BOOL)shouldForceVerificationFailures;
- (FTServerBag)serverBag;
- (NSUserDefaults)userDefaults;
- (TUVouchingEnablementImpl)init;
- (TUVouchingEnablementImpl)initWithUserDefaults:(id)a3 serverBag:(id)a4;
- (void)setServerBag:(id)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation TUVouchingEnablementImpl

- (TUVouchingEnablementImpl)init
{
  v3 = [(id)CUTWeakLinkClass() sharedInstance];
  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5 = [(TUVouchingEnablementImpl *)self initWithUserDefaults:v4 serverBag:v3];

  return v5;
}

- (TUVouchingEnablementImpl)initWithUserDefaults:(id)a3 serverBag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUVouchingEnablementImpl;
  v9 = [(TUVouchingEnablementImpl *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userDefaults, a3);
    objc_storeStrong((id *)&v10->_serverBag, a4);
  }

  return v10;
}

- (BOOL)isEnabled
{
  return [(TUVouchingEnablementImpl *)self serverBagValueForKey:@"vouching-enabled" withDefault:1];
}

- (BOOL)shouldForceVerificationFailures
{
  int v3 = _TUIsInternalInstall();
  if (v3)
  {
    userDefaults = self->_userDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)userDefaults BOOLForKey:@"ForceVoucherVerificationFailures" withDefault:0];
  }
  return v3;
}

- (BOOL)serverBagValueForKey:(id)a3 withDefault:(BOOL)a4
{
  v5 = [(FTServerBag *)self->_serverBag objectForKey:a3];
  v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (FTServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverBag, 0);

  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end