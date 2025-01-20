@interface CKSettingsCriticalMessagesDetailViewController
- (CKSettingsCriticalMessagesApp)currentApp;
- (CKSettingsCriticalMessagesAppManager)appManager;
- (CKSettingsCriticalMessagesDetailViewController)init;
- (id)_titleFromSpecifier;
- (id)numberActive:(id)a3;
- (id)specifiers;
- (void)criticalAppsDidChange:(id)a3;
- (void)setAppManager:(id)a3;
- (void)setCurrentApp:(id)a3;
- (void)setNumberActive:(id)a3 specifier:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKSettingsCriticalMessagesDetailViewController

- (CKSettingsCriticalMessagesDetailViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKSettingsCriticalMessagesDetailViewController;
  v2 = [(CKSettingsCriticalMessagesDetailViewController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_criticalAppsDidChange_ name:@"CKSettingsCriticalMessagesAppsChangedNotification" object:0];
  }
  return v2;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CKSettingsCriticalMessagesDetailViewController;
  [(CKSettingsCriticalMessagesDetailViewController *)&v4 viewDidLoad];
  v3 = [(CKSettingsCriticalMessagesDetailViewController *)self _titleFromSpecifier];
  [(CKSettingsCriticalMessagesDetailViewController *)self setTitle:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKSettingsCriticalMessagesDetailViewController;
  [(CKSettingsCriticalMessagesDetailViewController *)&v6 viewWillAppear:a3];
  objc_super v4 = [(CKSettingsCriticalMessagesDetailViewController *)self _titleFromSpecifier];
  objc_super v5 = [(CKSettingsCriticalMessagesDetailViewController *)self navigationItem];
  [v5 setTitle:v4];
}

- (id)_titleFromSpecifier
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"CRITICAL_MESSAGES" value:&stru_2704C4418 table:@"CriticalMessagesSettings"];

  objc_super v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) name];
  objc_super v6 = v5;
  if (!v5) {
    objc_super v5 = v4;
  }
  id v7 = v5;

  return v7;
}

- (id)specifiers
{
  v2 = self;
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v45 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v48 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_super v6 = (void *)MEMORY[0x263F5FC40];
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"CRITICAL_MESSAGES_DETAIL_HEADER" value:&stru_2704C4418 table:@"CriticalMessagesSettings"];
    v9 = [v6 groupSpecifierWithID:@"numbers" name:v8];

    id WeakRetained = objc_loadWeakRetained((id *)&v2->_appManager);
    v11 = [*(id *)((char *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) identifier];
    v12 = [WeakRetained criticalMessagesAppForBundleID:v11];

    objc_storeStrong((id *)&v2->_currentApp, v12);
    if (v12)
    {
      uint64_t v42 = v3;
      v39 = v12;
      v13 = [v12 recipients];
      uint64_t v14 = [v13 count];
      v15 = NSString;
      v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v17 = v16;
      v47 = v2;
      if (v14 == 1) {
        v18 = @"CRITICAL_MESSAGES_DETAIL_SINGULAR";
      }
      else {
        v18 = @"CRITICAL_MESSAGES_DETAIL_PLURAL";
      }
      v19 = [v16 localizedStringForKey:v18 value:&stru_2704C4418 table:@"CriticalMessagesSettings"];
      v20 = [(CKSettingsCriticalMessagesDetailViewController *)v2 _titleFromSpecifier];
      uint64_t v21 = objc_msgSend(v15, "stringWithFormat:", v19, v20);

      v38 = (void *)v21;
      [v9 setProperty:v21 forKey:*MEMORY[0x263F600F8]];
      v40 = v9;
      id v41 = v5;
      [v5 addObject:v9];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id obj = v13;
      uint64_t v22 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v46 = *(void *)v50;
        uint64_t v24 = *MEMORY[0x263F5FFE0];
        uint64_t v44 = *MEMORY[0x263F602C8];
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v50 != v46) {
              objc_enumerationMutation(obj);
            }
            v26 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            v27 = [v26 formattedPhoneNumber];
            v28 = [v26 getIMRecipient];
            v29 = [v28 displayName];
            char v30 = [v29 isEqualToString:&stru_2704C4418];

            if (v30)
            {
              v31 = v27;
              v27 = 0;
            }
            else
            {
              v31 = [v28 displayName];
            }
            v32 = (void *)[objc_alloc(MEMORY[0x263F5FC40]) initWithName:v31 target:v47 set:sel_setNumberActive_specifier_ get:sel_numberActive_ detail:0 cell:6 edit:0];
            [v32 setProperty:objc_opt_class() forKey:v24];
            v33 = [v26 number];
            [v32 setProperty:v33 forKey:@"unformattedNumber"];

            v34 = v48;
            if (v27)
            {
              [v32 setProperty:v27 forKey:v44];
              v34 = v45;
            }
            [v34 addObject:v32];
          }
          uint64_t v23 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
        }
        while (v23);
      }

      v2 = v47;
      id v5 = v41;
      uint64_t v3 = v42;
      v12 = v39;
      v9 = v40;
    }
    [v5 addObjectsFromArray:v45];
    [v5 addObjectsFromArray:v48];
    uint64_t v35 = [v5 copy];
    v36 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&v2->super.super.super.super.super.isa + v3) = (Class)v35;

    objc_super v4 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)setNumberActive:(id)a3 specifier:(id)a4
{
  id v12 = a3;
  uint64_t v6 = [a4 propertyForKey:@"unformattedNumber"];
  id v7 = (void *)v6;
  if (self->_currentApp) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appManager);
    uint64_t v10 = [v12 BOOLValue];
    v11 = [(CKSettingsCriticalMessagesApp *)self->_currentApp bundleID];
    [WeakRetained setActive:v10 forPhoneNumber:v7 inAppForBundle:v11];
  }
}

- (id)numberActive:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_super v4 = [a3 propertyForKey:@"unformattedNumber"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [(CKSettingsCriticalMessagesApp *)self->_currentApp recipients];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      v9 = (void *)MEMORY[0x263EFFA80];
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v12 = [v11 number];
          char v13 = [v12 isEqual:v4];

          if (v13)
          {
            v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "isActive"));
            goto LABEL_15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      v9 = (void *)MEMORY[0x263EFFA80];
    }
LABEL_15:
  }
  else
  {
    v9 = (void *)MEMORY[0x263EFFA80];
  }

  return v9;
}

- (void)criticalAppsDidChange:(id)a3
{
  [(CKSettingsCriticalMessagesDetailViewController *)self reloadSpecifiers];
  if (!self->_currentApp)
  {
    id v5 = [(CKSettingsCriticalMessagesDetailViewController *)self navigationController];
    id v4 = (id)[v5 popViewControllerAnimated:1];
  }
}

- (CKSettingsCriticalMessagesAppManager)appManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appManager);
  return (CKSettingsCriticalMessagesAppManager *)WeakRetained;
}

- (void)setAppManager:(id)a3
{
}

- (CKSettingsCriticalMessagesApp)currentApp
{
  return self->_currentApp;
}

- (void)setCurrentApp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentApp, 0);
  objc_destroyWeak((id *)&self->_appManager);
}

@end