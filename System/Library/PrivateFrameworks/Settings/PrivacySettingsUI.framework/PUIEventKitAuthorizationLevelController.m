@interface PUIEventKitAuthorizationLevelController
- (NSBundle)entityBundle;
- (NSDictionary)details;
- (NSString)displayName;
- (NSString)serviceKey;
- (id)footerStringForSpecifiers:(id)a3;
- (id)specifiers;
- (void)_handleUpgradePromptNotification:(id)a3;
- (void)setDetails:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEntityBundle:(id)a3;
- (void)setServiceKey:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation PUIEventKitAuthorizationLevelController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PUIEventKitAuthorizationLevelController;
  [(PSListItemsController *)&v4 viewDidLoad];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleUpgradePromptNotification_ name:@"PUICalendarPrivacyUpgradePromptCompletedNotification" object:0];
}

- (void)_handleUpgradePromptNotification:(id)a3
{
  objc_super v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"PUICalendarPrivacyUpgradePromptAppIdentifierKey"];
  int v6 = [v5 isEqualToString:self->_clientIdentifier];

  if (v6)
  {
    dispatch_time_t v7 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__PUIEventKitAuthorizationLevelController__handleUpgradePromptNotification___block_invoke;
    block[3] = &unk_1E6E9C758;
    block[4] = self;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __76__PUIEventKitAuthorizationLevelController__handleUpgradePromptNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)setSpecifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUIEventKitAuthorizationLevelController;
  id v4 = a3;
  [(PUIEventKitAuthorizationLevelController *)&v9 setSpecifier:v4];
  objc_msgSend(v4, "identifier", v9.receiver, v9.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceKey = self->_serviceKey;
  self->_serviceKey = v5;

  dispatch_time_t v7 = [v4 propertyForKey:@"appBundleID"];

  clientIdentifier = self->_clientIdentifier;
  self->_clientIdentifier = v7;
}

- (id)specifiers
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  if (!*(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3))
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v11.receiver = v2;
    v11.super_class = (Class)PUIEventKitAuthorizationLevelController;
    v5 = [(PSListItemsController *)&v11 specifiers];
    [v4 addObjectsFromArray:v5];

    int v6 = [v4 firstObject];
    dispatch_time_t v7 = [(PUIEventKitAuthorizationLevelController *)v2 footerStringForSpecifiers:v4];
    if (v7) {
      [v6 setProperty:v7 forKey:*MEMORY[0x1E4F93170]];
    }
    v8 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3) = (Class)v4;
  }
  objc_sync_exit(v2);

  objc_super v9 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3);
  return v9;
}

- (id)footerStringForSpecifiers:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v24 = self;
    uint64_t v7 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v10 = [v9 values];
        objc_super v11 = [v10 firstObject];
        char v12 = [v11 isEqual:&unk_1F4080398];

        v13 = [v9 values];
        v14 = [v13 firstObject];
        int v15 = [v14 isEqual:&unk_1F40803B0];

        if ((v12 & 1) != 0 || v15)
        {

          v18 = (void *)MEMORY[0x1E4F223C8];
          v19 = [(PUIEventKitAuthorizationLevelController *)v24 serviceKey];
          v17 = [v18 bundleRecordWithApplicationIdentifier:v19 error:0];

          v20 = [v17 localizedName];
          if (v20)
          {
            v21 = NSString;
            v22 = PUI_LocalizedStringForPrivacy(@"CALENDARS_AUTH_EVENTKIT_FOOTER");
            v16 = objc_msgSend(v21, "stringWithFormat:", v22, v20);
          }
          else
          {
            v16 = PUI_LocalizedStringForPrivacy(@"CALENDARS_AUTH_EVENTKIT_FOOTER_NO_APP_NAME");
          }

          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v16 = 0;
  v17 = v4;
LABEL_15:

  return v16;
}

- (NSString)serviceKey
{
  return self->_serviceKey;
}

- (void)setServiceKey:(id)a3
{
}

- (NSDictionary)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSBundle)entityBundle
{
  return self->_entityBundle;
}

- (void)setEntityBundle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityBundle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_serviceKey, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end