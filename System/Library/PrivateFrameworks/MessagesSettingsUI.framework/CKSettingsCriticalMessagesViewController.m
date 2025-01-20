@interface CKSettingsCriticalMessagesViewController
- (CKSettingsCriticalMessagesAppManager)appManager;
- (CKSettingsCriticalMessagesViewController)init;
- (id)_specifierForApp:(id)a3;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (void)setAppManager:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKSettingsCriticalMessagesViewController

- (CKSettingsCriticalMessagesViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CKSettingsCriticalMessagesViewController;
  v2 = [(CKSettingsCriticalMessagesViewController *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_criticalAppsDidChange_ name:@"CKSettingsCriticalMessagesAppsChangedNotification" object:0];

    v4 = objc_alloc_init(CKSettingsCriticalMessagesAppManager);
    appManager = v2->_appManager;
    v2->_appManager = v4;
  }
  return v2;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CKSettingsCriticalMessagesViewController;
  [(CKSettingsCriticalMessagesViewController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"CRITICAL_MESSAGES" value:&stru_2704C4418 table:@"CriticalMessagesSettings"];
  [(CKSettingsCriticalMessagesViewController *)self setTitle:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKSettingsCriticalMessagesViewController;
  [(CKSettingsCriticalMessagesViewController *)&v7 viewWillAppear:a3];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 localizedStringForKey:@"CRITICAL_MESSAGES" value:&stru_2704C4418 table:@"CriticalMessagesSettings"];
  v6 = [(CKSettingsCriticalMessagesViewController *)self navigationItem];
  [v6 setTitle:v5];
}

- (id)specifiers
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"apps" name:&stru_2704C4418];
    objc_super v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"CRITICAL_MESSAGES_FOOTER" value:&stru_2704C4418 table:@"CriticalMessagesSettings"];
    [v6 setProperty:v8 forKey:*MEMORY[0x263F600F8]];

    [v5 addObject:v6];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v9 = [(CKSettingsCriticalMessagesAppManager *)self->_appManager criticalMessagesApps];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [(CKSettingsCriticalMessagesViewController *)self _specifierForApp:*(void *)(*((void *)&v17 + 1) + 8 * v13)];
          [v5 addObject:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_specifierForApp:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F5FC40];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v4 bundleID];
  [v5 setIdentifier:v6];

  objc_super v7 = [v4 displayName];
  [v5 setName:v7];

  v8 = [v4 activeNumberCountLocalizedString];
  [v5 setProperty:v8 forKey:*MEMORY[0x263F602C8]];

  v9 = [v4 bundleID];

  [v5 setProperty:v9 forKey:*MEMORY[0x263F60188]];
  [v5 setProperty:@"YES" forKey:*MEMORY[0x263F601A8]];
  [v5 setCellType:2];
  [v5 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v5 setDetailControllerClass:objc_opt_class()];
  return v5;
}

- (id)selectSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CKSettingsCriticalMessagesDetailViewController);
  [(CKSettingsCriticalMessagesDetailViewController *)v5 setParentController:self];
  v6 = [(CKSettingsCriticalMessagesViewController *)self rootController];
  [(CKSettingsCriticalMessagesDetailViewController *)v5 setRootController:v6];

  [(CKSettingsCriticalMessagesDetailViewController *)v5 setSpecifier:v4];
  [(CKSettingsCriticalMessagesDetailViewController *)v5 setAppManager:self->_appManager];
  return v5;
}

- (CKSettingsCriticalMessagesAppManager)appManager
{
  return self->_appManager;
}

- (void)setAppManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end