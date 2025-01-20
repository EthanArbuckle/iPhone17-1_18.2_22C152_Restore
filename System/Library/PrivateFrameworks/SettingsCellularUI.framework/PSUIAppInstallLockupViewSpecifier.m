@interface PSUIAppInstallLockupViewSpecifier
- (PSUIAppInstallLockupViewSpecifier)initWithFailureHandler:(id)a3 diagCode:(id)a4 OpenAppURL:(id)a5 appId:(id)a6 AnalyticsEventForApp:(id)a7;
- (id)loadingFailureHandler;
- (void)handleLockupViewFailure:(id)a3;
- (void)setLoadingFailureHandler:(id)a3;
@end

@implementation PSUIAppInstallLockupViewSpecifier

- (PSUIAppInstallLockupViewSpecifier)initWithFailureHandler:(id)a3 diagCode:(id)a4 OpenAppURL:(id)a5 appId:(id)a6 AnalyticsEventForApp:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PSUIAppInstallLockupViewSpecifier;
  v17 = [(PSUIAppInstallLockupViewSpecifier *)&v21 initWithName:&stru_26D410CA0 target:self set:0 get:0 detail:0 cell:4 edit:0];
  v18 = v17;
  if (v17)
  {
    [(PSUIAppInstallLockupViewSpecifier *)v17 setLoadingFailureHandler:v12];
    v19 = [NSNumber numberWithDouble:*MEMORY[0x263F839B8]];
    [(PSUIAppInstallLockupViewSpecifier *)v18 setProperty:v19 forKey:*MEMORY[0x263F602A8]];

    [(PSUIAppInstallLockupViewSpecifier *)v18 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [(PSUIAppInstallLockupViewSpecifier *)v18 setProperty:@"AppInstallLockupView" forKey:*MEMORY[0x263F60138]];
    [(PSUIAppInstallLockupViewSpecifier *)v18 setProperty:v14 forKey:0x26D415060];
    [(PSUIAppInstallLockupViewSpecifier *)v18 setProperty:v15 forKey:0x26D415080];
    [(PSUIAppInstallLockupViewSpecifier *)v18 setProperty:v16 forKey:0x26D4150A0];
    [(PSUIAppInstallLockupViewSpecifier *)v18 setProperty:v13 forKey:0x26D4150C0];
  }

  return v18;
}

- (void)handleLockupViewFailure:(id)a3
{
  id v6 = a3;
  v4 = [(PSUIAppInstallLockupViewSpecifier *)self loadingFailureHandler];

  if (v4)
  {
    v5 = [(PSUIAppInstallLockupViewSpecifier *)self loadingFailureHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)loadingFailureHandler
{
  return self->_loadingFailureHandler;
}

- (void)setLoadingFailureHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end