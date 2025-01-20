@interface NMCUISpecifierController
+ (id)settingSpecifierWithTarget:(id)a3 set:(SEL)a4 get:(SEL)a5;
+ (id)titleSettingSpecifier;
- (BOOL)hasCloudNotificationAccounts;
- (BOOL)isTinker;
- (NMCUICloudNotificationAccountDataSource)dataSource;
- (NMCUISpecifierController)initWithListController:(id)a3 dataSource:(id)a4 isTinker:(BOOL)a5;
- (PSListController)listController;
- (id)_cloudNotificationsEnabled:(id)a3;
- (id)groupSpecifierForTinker:(BOOL)a3;
- (id)specifierForAccount:(id)a3 onTap:(SEL)a4;
- (id)specifiers;
- (void)_accountSpecifierTapped:(id)a3;
- (void)_setCloudNotificationsEnabled:(id)a3 withSpecifier:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setIsTinker:(BOOL)a3;
- (void)setListController:(id)a3;
@end

@implementation NMCUISpecifierController

- (NMCUISpecifierController)initWithListController:(id)a3 dataSource:(id)a4 isTinker:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NMCUISpecifierController;
  v10 = [(NMCUISpecifierController *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(NMCUISpecifierController *)v10 setListController:v8];
    [(NMCUISpecifierController *)v11 setDataSource:v9];
    [(NMCUISpecifierController *)v11 setIsTinker:v5];
  }

  return v11;
}

+ (id)settingSpecifierWithTarget:(id)a3 set:(SEL)a4 get:(SEL)a5
{
  v7 = (void *)MEMORY[0x263F5FC40];
  id v8 = (void *)MEMORY[0x263F086E0];
  id v9 = a3;
  v10 = [v8 bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
  v11 = [v10 localizedStringForKey:@"CLOUD_NOTIFICATIONS_TITLE" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
  v12 = [v7 preferenceSpecifierNamed:v11 target:v9 set:a4 get:a5 detail:0 cell:6 edit:0];

  return v12;
}

+ (id)titleSettingSpecifier
{
  v2 = (void *)MEMORY[0x263F5FC40];
  v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
  v4 = [v3 localizedStringForKey:@"CLOUD_NOTIFICATIONS_TITLE" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
  BOOL v5 = [v2 preferenceSpecifierNamed:v4 target:0 set:0 get:0 detail:0 cell:4 edit:0];

  return v5;
}

- (id)groupSpecifierForTinker:(BOOL)a3
{
  BOOL v5 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"cloud-notifications"];
  if (!a3)
  {
    v6 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
    v7 = [v6 localizedStringForKey:@"STANDALONE_HEADER_TITLE" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
    [v5 setName:v7];
  }
  if ([(NMCUISpecifierController *)self hasCloudNotificationAccounts])
  {
    id v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
    id v9 = [v8 localizedStringForKey:@"CLOUD_NOTIFICATIONS_FOOTER_DESCRIPTION" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
    [v5 setProperty:v9 forKey:*MEMORY[0x263F600F8]];
  }

  return v5;
}

- (id)specifierForAccount:(id)a3 onTap:(SEL)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263F5FC40];
  id v8 = [v6 displayName];
  id v9 = [v7 preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:4 edit:0];

  [v9 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  v10 = (__CFString *)*MEMORY[0x263F600A8];
  [v9 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
  v11 = [(NMCUISpecifierController *)self dataSource];
  int v12 = [v11 accountIsPending:v6];

  if (v12)
  {
    objc_super v13 = @"MFNanoSettingsSpecifierLoadingKey";
    uint64_t v14 = MEMORY[0x263EFFA88];
    v15 = v9;
LABEL_3:
    [v15 setObject:v14 forKeyedSubscript:v13];
    goto LABEL_7;
  }
  v16 = [(NMCUISpecifierController *)self dataSource];
  if ([v16 cloudNotificationsEnabled]
    && !+[NMCUICloudNotificationAccountDataSource accountHasCredentials:v6])
  {

    if (a4)
    {
      [v9 setButtonAction:a4];
      uint64_t v19 = MEMORY[0x263EFFA88];
      [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"MFNanoSettingsSpecifierWarningKey"];
      v15 = v9;
      uint64_t v14 = v19;
      objc_super v13 = v10;
      goto LABEL_3;
    }
  }
  else
  {
  }
LABEL_7:
  v17 = [v6 username];
  [v9 setObject:v17 forKeyedSubscript:@"MFNanoSettingsSpecifierDetailKey"];

  [v9 setProperty:v6 forKey:@"NMCUISettingsSpecifierAccountKey"];

  return v9;
}

- (id)specifiers
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = [(NMCUISpecifierController *)self dataSource];
  int v4 = [v3 showsAlerts];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = [(NMCUISpecifierController *)self groupSpecifierForTinker:[(NMCUISpecifierController *)self isTinker]];
    [v5 addObject:v7];

    if ([(NMCUISpecifierController *)self hasCloudNotificationAccounts]) {
      +[NMCUISpecifierController settingSpecifierWithTarget:self set:sel__setCloudNotificationsEnabled_withSpecifier_ get:sel__cloudNotificationsEnabled_];
    }
    else {
    id v9 = +[NMCUISpecifierController titleSettingSpecifier];
    }
    v22 = v5;
    [v5 addObject:v9];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v10 = [(NMCUISpecifierController *)self dataSource];
    v11 = [v10 accounts];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v16 directPushNotificationsSupported])
          {
            v17 = 0;
LABEL_13:
            v18 = [(NMCUISpecifierController *)self specifierForAccount:v16 onTap:v17];
            [v6 addObject:v18];
LABEL_17:

            continue;
          }
          v18 = [(NMCUISpecifierController *)self dataSource];
          if (![v18 deviceSupportsCloudNotifications]) {
            goto LABEL_17;
          }
          BOOL v19 = +[NMCUICloudNotificationAccountDataSource accountSupportsNotifications:v16];

          v17 = sel__accountSpecifierTapped_;
          if (v19) {
            goto LABEL_13;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    if ([v6 count])
    {
      v20 = v22;
      id v8 = [v22 arrayByAddingObjectsFromArray:v6];
    }
    else
    {
      id v8 = (void *)MEMORY[0x263EFFA68];
      v20 = v22;
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

- (BOOL)hasCloudNotificationAccounts
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(NMCUISpecifierController *)self dataSource];
  int v4 = [v3 deviceSupportsCloudNotifications];

  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [(NMCUISpecifierController *)self dataSource];
    id v6 = [v5 accounts];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          if (+[NMCUICloudNotificationAccountDataSource accountSupportsNotifications:*(void *)(*((void *)&v11 + 1) + 8 * i)])
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)_setCloudNotificationsEnabled:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 BOOLValue])
  {
    objc_initWeak(&location, self);
    uint64_t v8 = [NMCUICloudNotificationOnboardingViewController alloc];
    id v9 = [(NMCUISpecifierController *)self dataSource];
    v10 = [v9 accounts];
    long long v11 = [(NMCUISpecifierController *)self dataSource];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    BOOL v19 = __72__NMCUISpecifierController__setCloudNotificationsEnabled_withSpecifier___block_invoke;
    v20 = &unk_264B99118;
    objc_copyWeak(&v21, &location);
    long long v12 = [(NMCUICloudNotificationOnboardingViewController *)v8 initWithAccounts:v10 dataSource:v11 completion:&v17];

    long long v13 = [(NMCUISpecifierController *)self listController];
    [v13 presentViewController:v12 animated:1 completion:0];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v14 = [v6 BOOLValue];
    v15 = [(NMCUISpecifierController *)self dataSource];
    [v15 setCloudNotificationsEnabled:v14];
  }
  uint64_t v16 = [(NMCUISpecifierController *)self listController];
  [v16 reloadSpecifiers];
}

void __72__NMCUISpecifierController__setCloudNotificationsEnabled_withSpecifier___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__NMCUISpecifierController__setCloudNotificationsEnabled_withSpecifier___block_invoke_2;
  block[3] = &unk_264B99118;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __72__NMCUISpecifierController__setCloudNotificationsEnabled_withSpecifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained listController];
  [v1 reloadSpecifiers];
}

- (id)_cloudNotificationsEnabled:(id)a3
{
  v3 = NSNumber;
  int v4 = [(NMCUISpecifierController *)self dataSource];
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "cloudNotificationsEnabled"));

  return v5;
}

- (void)_accountSpecifierTapped:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:@"NMCUISettingsSpecifierAccountKey"];
  if (v5)
  {
    objc_initWeak(&location, self);
    id v6 = [(NMCUISpecifierController *)self dataSource];
    id v7 = [(NMCUISpecifierController *)self listController];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __52__NMCUISpecifierController__accountSpecifierTapped___block_invoke;
    v8[3] = &unk_264B99118;
    objc_copyWeak(&v9, &location);
    [v6 handleAccountAuthenication:v5 viewController:v7 stateUpdateHandler:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __52__NMCUISpecifierController__accountSpecifierTapped___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__NMCUISpecifierController__accountSpecifierTapped___block_invoke_2;
  block[3] = &unk_264B99118;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __52__NMCUISpecifierController__accountSpecifierTapped___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained listController];
  [v1 reloadSpecifiers];
}

- (PSListController)listController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);

  return (PSListController *)WeakRetained;
}

- (void)setListController:(id)a3
{
}

- (NMCUICloudNotificationAccountDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)isTinker
{
  return self->_isTinker;
}

- (void)setIsTinker:(BOOL)a3
{
  self->_isTinker = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_destroyWeak((id *)&self->_listController);
}

@end