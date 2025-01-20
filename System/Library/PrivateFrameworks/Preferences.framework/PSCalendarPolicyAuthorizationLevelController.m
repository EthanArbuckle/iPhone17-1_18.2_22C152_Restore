@interface PSCalendarPolicyAuthorizationLevelController
+ (int64_t)cellStyle;
- (NSString)displayName;
- (NSString)serviceKey;
- (id)footerStringForSpecifiers:(id)a3;
- (id)specifiers;
- (void)_handleUpgradePromptNotification:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setServiceKey:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation PSCalendarPolicyAuthorizationLevelController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PSCalendarPolicyAuthorizationLevelController;
  [(PSListItemsController *)&v4 viewDidLoad];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleUpgradePromptNotification_ name:@"PSCalendarPrivacyUpgradePromptCompletedNotification" object:0];
}

- (void)_handleUpgradePromptNotification:(id)a3
{
  objc_super v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"PSCalendarPrivacyUpgradePromptAppIdentifierKey"];
  int v6 = [v5 isEqualToString:self->_clientIdentifier];

  if (v6)
  {
    dispatch_time_t v7 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__PSCalendarPolicyAuthorizationLevelController__handleUpgradePromptNotification___block_invoke;
    block[3] = &unk_1E5C5D680;
    block[4] = self;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __81__PSCalendarPolicyAuthorizationLevelController__handleUpgradePromptNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)setSpecifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PSCalendarPolicyAuthorizationLevelController;
  id v4 = a3;
  [(PSListController *)&v9 setSpecifier:v4];
  objc_msgSend(v4, "identifier", v9.receiver, v9.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceKey = self->_serviceKey;
  self->_serviceKey = v5;

  dispatch_time_t v7 = [v4 propertyForKey:@"BUNDLE_ID"];

  clientIdentifier = self->_clientIdentifier;
  self->_clientIdentifier = v7;
}

- (id)specifiers
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->super.super._specifiers)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v10.receiver = v2;
    v10.super_class = (Class)PSCalendarPolicyAuthorizationLevelController;
    id v4 = [(PSListItemsController *)&v10 specifiers];
    [(NSArray *)v3 addObjectsFromArray:v4];

    v5 = [(NSArray *)v3 firstObject];
    int v6 = [(PSCalendarPolicyAuthorizationLevelController *)v2 footerStringForSpecifiers:v3];
    if (v6) {
      [v5 setProperty:v6 forKey:@"footerText"];
    }
    specifiers = v2->super.super._specifiers;
    v2->super.super._specifiers = v3;
  }
  objc_sync_exit(v2);

  v8 = v2->super.super._specifiers;
  return v8;
}

- (id)footerStringForSpecifiers:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v25 = self;
    uint64_t v7 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_super v10 = [v9 values];
        v11 = [v10 firstObject];
        char v12 = [v11 isEqual:&unk_1EFB73DF0];

        v13 = [v9 values];
        v14 = [v13 firstObject];
        int v15 = [v14 isEqual:&unk_1EFB73E08];

        if ((v12 & 1) != 0 || v15)
        {

          v18 = (void *)MEMORY[0x1E4F223C8];
          v19 = [(PSCalendarPolicyAuthorizationLevelController *)v25 serviceKey];
          v17 = [v18 bundleRecordWithApplicationIdentifier:v19 error:0];

          v20 = [v17 localizedName];
          v21 = +[PSCalendarPolicyController loadPrivacySettingsBundle];
          v22 = v21;
          if (v20) {
            v23 = @"CALENDARS_AUTH_EVENTKIT_FOOTER";
          }
          else {
            v23 = @"CALENDARS_AUTH_EVENTKIT_FOOTER_NO_APP_NAME";
          }
          v16 = [v21 localizedStringForKey:v23 value:&stru_1EFB51FD0 table:@"Privacy"];

          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
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

+ (int64_t)cellStyle
{
  return 1;
}

- (NSString)serviceKey
{
  return self->_serviceKey;
}

- (void)setServiceKey:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_serviceKey, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end