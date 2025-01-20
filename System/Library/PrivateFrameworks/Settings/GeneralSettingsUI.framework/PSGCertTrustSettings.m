@interface PSGCertTrustSettings
- (id)isFullTrustEnabled:(id)a3;
- (id)profileListChangedNotificationObserver;
- (id)specifierForTrustSettings:(__SecCertificate *)a3 isRestricted:(BOOL)a4;
- (id)specifiers;
- (id)trustAssetVersionString:(id)a3;
- (id)trustVersionString:(id)a3;
- (void)setFullTrustEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setProfileListChangedNotificationObserver:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PSGCertTrustSettings

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PSGCertTrustSettings;
  [(PSGCertTrustSettings *)&v14 viewWillAppear:a3];
  objc_initWeak(&location, self);
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  v5 = [MEMORY[0x263F08A48] mainQueue];
  uint64_t v6 = *MEMORY[0x263F53B18];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __39__PSGCertTrustSettings_viewWillAppear___block_invoke;
  v11 = &unk_264E8C808;
  objc_copyWeak(&v12, &location);
  v7 = [v4 addObserverForName:v6 object:0 queue:v5 usingBlock:&v8];
  -[PSGCertTrustSettings setProfileListChangedNotificationObserver:](self, "setProfileListChangedNotificationObserver:", v7, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __39__PSGCertTrustSettings_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSGCertTrustSettings;
  [(PSGCertTrustSettings *)&v6 viewDidDisappear:a3];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  v5 = [(PSGCertTrustSettings *)self profileListChangedNotificationObserver];
  [v4 removeObserver:v5];

  [(PSGCertTrustSettings *)self setProfileListChangedNotificationObserver:0];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_super v6 = [MEMORY[0x263F53C50] sharedConnection];
    id v34 = 0;
    v7 = [v6 lockedDownRootCertificatesWithOutLocalizedSourceDescription:&v34];
    id v8 = v34;

    uint64_t v9 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v33 = v8;
    [v9 setProperty:v8 forKey:*MEMORY[0x263F600F8]];
    [v5 addObject:v9];
    id v10 = v9;
    v11 = PSG_BundleForGeneralSettingsUIFramework();
    id v12 = (id)[v11 localizedStringForKey:&stru_26F0FADC0 value:&stru_26F0FADC0 table:0];

    v13 = PSG_BundleForGeneralSettingsUIFramework();
    uint64_t v14 = [v13 localizedStringForKey:@"TRUST_STORE_VERSION" value:&stru_26F0FADC0 table:0];

    v32 = (void *)v14;
    v15 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v14 target:self set:0 get:sel_trustVersionString_ detail:0 cell:4 edit:0];
    uint64_t v16 = *MEMORY[0x263F60138];
    [v15 setProperty:@"TRUST_STORE_VERSION" forKey:*MEMORY[0x263F60138]];
    v31 = v15;
    [v5 addObject:v15];
    v17 = (void *)MEMORY[0x263F5FC40];
    v18 = PSG_LocalizedStringForGeneral(@"TRUST_ASSET_VERSION");
    v19 = [v17 preferenceSpecifierNamed:v18 target:self set:0 get:sel_trustAssetVersionString_ detail:0 cell:4 edit:0];

    v20 = v19;
    [v19 setProperty:@"TRUST_ASSET_VERSION" forKey:v16];
    [v5 addObject:v19];
    SecTrustStoreForDomain();
    SecTrustStoreCopyAll();
    v21 = PSG_LocalizedStringForGeneral(@"TRUST_STORE_ABOUT");
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    [v10 setProperty:v23 forKey:*MEMORY[0x263F600C0]];

    [v10 setProperty:v21 forKey:*MEMORY[0x263F600E8]];
    v36.length = [v21 length];
    v36.id location = 0;
    v24 = NSStringFromRange(v36);
    [v10 setProperty:v24 forKey:*MEMORY[0x263F600D0]];

    v25 = NSURL;
    v26 = PSG_LocalizedStringForGeneral(@"TRUST_STORE_URL");
    v27 = [v25 URLWithString:v26];
    [v10 setProperty:v27 forKey:*MEMORY[0x263F600F0]];

    v28 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;
    id v29 = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)isFullTrustEnabled:(id)a3
{
  [a3 propertyForKey:@"certName"];
  SecTrustStoreForDomain();
  SecTrustStoreCopyUsageConstraints();
  uint64_t v3 = [NSNumber numberWithBool:0];
  return v3;
}

- (void)setFullTrustEnabled:(id)a3 forSpecifier:(id)a4
{
  v35[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 propertyForKey:@"certName"];
  int v9 = [v7 intValue];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x263F82418];
    v11 = PSG_LocalizedStringForGeneral(@"ROOT_CERTIFICATE");
    id v12 = PSG_LocalizedStringForGeneral(@"ROOT_CERTIFICATE_MESSAGE");
    v13 = [v10 alertControllerWithTitle:v11 message:v12 preferredStyle:1];

    uint64_t v14 = (void *)MEMORY[0x263F82400];
    v15 = PSG_LocalizedStringForGeneral(@"CONTINUE");
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __57__PSGCertTrustSettings_setFullTrustEnabled_forSpecifier___block_invoke;
    v30[3] = &__block_descriptor_40_e23_v16__0__UIAlertAction_8l;
    v30[4] = v8;
    uint64_t v16 = [v14 actionWithTitle:v15 style:0 handler:v30];
    [v13 addAction:v16];

    v17 = (void *)MEMORY[0x263F82400];
    v18 = PSG_LocalizedStringForGeneral(@"CANCEL");
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __57__PSGCertTrustSettings_setFullTrustEnabled_forSpecifier___block_invoke_2;
    v27 = &unk_264E8C850;
    v28 = self;
    id v29 = v6;
    v19 = [v17 actionWithTitle:v18 style:1 handler:&v24];
    objc_msgSend(v13, "addAction:", v19, v24, v25, v26, v27, v28);

    [(PSGCertTrustSettings *)self presentViewController:v13 animated:1 completion:0];
LABEL_5:

    goto LABEL_6;
  }
  SecPolicyRef SSL = SecPolicyCreateSSL(1u, 0);
  if (SSL)
  {
    SecPolicyRef v21 = SSL;
    v33[0] = @"kSecTrustSettingsPolicy";
    v33[1] = @"kSecTrustSettingsResult";
    v34[0] = SSL;
    v34[1] = &unk_26F1039E8;
    v22 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    v35[0] = v22;
    v31 = @"kSecTrustSettingsResult";
    v32 = &unk_26F103A00;
    v23 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v35[1] = v23;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];

    SecTrustStoreForDomain();
    SecTrustStoreSetTrustSettings();
    CFRelease(v21);
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __57__PSGCertTrustSettings_setFullTrustEnabled_forSpecifier___block_invoke()
{
  SecTrustStoreForDomain();
  return SecTrustStoreSetTrustSettings();
}

uint64_t __57__PSGCertTrustSettings_setFullTrustEnabled_forSpecifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
}

- (id)specifierForTrustSettings:(__SecCertificate *)a3 isRestricted:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (void *)SecCertificateCopyCommonNames();
  if ([v7 count] && (objc_msgSend(v7, "firstObject"), (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v9 = (void *)v8;
    id v10 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v8 target:self set:sel_setFullTrustEnabled_forSpecifier_ get:sel_isFullTrustEnabled_ detail:0 cell:6 edit:0];
    [v10 setProperty:a3 forKey:@"certName"];
    v11 = [NSNumber numberWithInt:!v4];
    [v10 setProperty:v11 forKey:*MEMORY[0x263F600A8]];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)trustVersionString:(id)a3
{
  if (SecTrustStoreGetSettingsVersionNumber())
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%u", 0);
  }
  return v3;
}

- (id)trustAssetVersionString:(id)a3
{
  if (SecTrustStoreGetSettingsAssetVersionNumber())
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%u", 0);
  }
  return v3;
}

- (id)profileListChangedNotificationObserver
{
  return self->_profileListChangedNotificationObserver;
}

- (void)setProfileListChangedNotificationObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end