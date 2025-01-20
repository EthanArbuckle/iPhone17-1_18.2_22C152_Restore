@interface STNotificationsUsageGroupSpecifierProvider
- (BBSettingsGateway)notificationSettingsGateway;
- (NSMutableDictionary)notificationSectionByBundleID;
- (OS_dispatch_queue)notificationSettingsGatewayQueue;
- (STNotificationsUsageGroupSpecifierProvider)init;
- (id)_usageDetailsCoordinator:(id)a3;
- (id)getNotificationsInfo:(id)a3;
- (id)newSpecifierWithUsageItem:(id)a3;
- (void)_selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4;
- (void)_specifierIdentifierDidChange:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCoordinator:(id)a3;
- (void)updateSpecifier:(id)a3 usageItem:(id)a4;
@end

@implementation STNotificationsUsageGroupSpecifierProvider

- (STNotificationsUsageGroupSpecifierProvider)init
{
  v16.receiver = self;
  v16.super_class = (Class)STNotificationsUsageGroupSpecifierProvider;
  v2 = [(STShowMoreUsageGroupSpecifierProvider *)&v16 init];
  v3 = (void *)MEMORY[0x263F5FC40];
  v4 = +[STScreenTimeSettingsUIBundle bundle];
  v5 = [v4 localizedStringForKey:@"NotificationsGroupName" value:&stru_26D9391A8 table:0];
  v6 = [v3 groupSpecifierWithName:v5];
  [(STGroupSpecifierProvider *)v2 setGroupSpecifier:v6];

  v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Notifications Summary" target:v2 set:0 get:sel__usageDetailsCoordinator_ detail:0 cell:-1 edit:0];
  [v7 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
  [(STShowMoreUsageGroupSpecifierProvider *)v2 setSummarySpecifier:v7];
  uint64_t v8 = objc_opt_new();
  notificationSectionByBundleID = v2->_notificationSectionByBundleID;
  v2->_notificationSectionByBundleID = (NSMutableDictionary *)v8;

  dispatch_queue_t v10 = dispatch_queue_create("com.apple.screentime.notification-settings-gateway", 0);
  notificationSettingsGatewayQueue = v2->_notificationSettingsGatewayQueue;
  v2->_notificationSettingsGatewayQueue = (OS_dispatch_queue *)v10;

  uint64_t v12 = [objc_alloc(MEMORY[0x263F2BCC0]) initWithQueue:v2->_notificationSettingsGatewayQueue];
  notificationSettingsGateway = v2->_notificationSettingsGateway;
  v2->_notificationSettingsGateway = (BBSettingsGateway *)v12;

  v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 addObserver:v2 selector:sel__specifierIdentifierDidChange_ name:0x26D93E8C8 object:0];

  return v2;
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(STUsageGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.hasUsageData" context:"KVOContextNotificationUsageGroupSpecifierProvider"];
  [v5 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedUsageReport" context:"KVOContextNotificationUsageGroupSpecifierProvider"];
  v6.receiver = self;
  v6.super_class = (Class)STNotificationsUsageGroupSpecifierProvider;
  [(STUsageGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.hasUsageData" options:5 context:"KVOContextNotificationUsageGroupSpecifierProvider"];
  [v4 addObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedUsageReport" options:7 context:"KVOContextNotificationUsageGroupSpecifierProvider"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6 == "KVOContextNotificationUsageGroupSpecifierProvider")
  {
    [(STUsageGroupSpecifierProvider *)self coordinator];

    if ([v10 isEqualToString:@"usageDetailsCoordinator.viewModel.hasUsageData"])
    {
      uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v13 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v13)
      {

        uint64_t v12 = 0;
      }
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", [v12 BOOLValue] ^ 1);
    }
    else
    {
      [(STUsageGroupSpecifierProvider *)self coordinator];

      if (![v10 isEqualToString:@"usageDetailsCoordinator.viewModel.selectedUsageReport"])goto LABEL_14; {
      uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      }
      v14 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v14)
      {

        uint64_t v12 = 0;
      }
      v15 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      objc_super v16 = [MEMORY[0x263EFF9D0] null];

      if (v15 == v16)
      {

        v15 = 0;
      }
      [(STNotificationsUsageGroupSpecifierProvider *)self _selectedUsageReportDidChangeFrom:v12 to:v15];
    }
    goto LABEL_14;
  }
  v17.receiver = self;
  v17.super_class = (Class)STNotificationsUsageGroupSpecifierProvider;
  [(STNotificationsUsageGroupSpecifierProvider *)&v17 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
LABEL_14:
}

- (void)_selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6 != v7 && ([v6 isEqual:v7] & 1) == 0)
  {
    id v45 = v6;
    uint64_t v8 = [v6 type];
    BOOL v9 = v8 == [v7 type];
    id v10 = [(STShowMoreUsageGroupSpecifierProvider *)self summarySpecifier];
    [(STGroupSpecifierProvider *)self reloadSpecifier:v10 animated:v9];

    id v11 = [(STNotificationsUsageGroupSpecifierProvider *)self notificationSectionByBundleID];
    uint64_t v12 = [v7 notificationsByTrustIdentifier];
    v13 = [v12 allKeys];
    uint64_t v14 = [v13 valueForKeyPath:@"identifier"];

    v42 = (void *)v14;
    v15 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v14];
    objc_super v16 = (void *)MEMORY[0x263EFFA08];
    objc_super v17 = [(STNotificationsUsageGroupSpecifierProvider *)self notificationSectionByBundleID];
    v18 = [v17 allKeys];
    v19 = [v16 setWithArray:v18];
    [v15 minusSet:v19];

    v46 = v15;
    if ([v15 count])
    {
      v20 = [(STNotificationsUsageGroupSpecifierProvider *)self notificationSettingsGateway];
      v21 = [v20 sectionInfoForSectionIDs:v15];

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v52 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            v28 = [v27 sectionID];
            [v11 setObject:v27 forKeyedSubscript:v28];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v51 objects:v56 count:16];
        }
        while (v24);
      }
    }
    v43 = self;
    v29 = [(STUsageGroupSpecifierProvider *)self coordinator];
    v30 = [v29 viewModel];
    v31 = [v30 installedBundleIDs];

    id v44 = v7;
    v32 = [v7 notifications];
    v33 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v32, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v34 = v32;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v48 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          v40 = [v39 budgetItemIdentifier];
          int v41 = [v31 containsObject:v40];

          if (v41) {
            [v33 addObject:v39];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v36);
    }

    [(STShowMoreUsageGroupSpecifierProvider *)v43 setUsageItems:v33];
    id v7 = v44;
    id v6 = v45;
  }
}

- (id)newSpecifierWithUsageItem:(id)a3
{
  id v4 = a3;
  v5 = [(STNotificationsUsageGroupSpecifierProvider *)self notificationSectionByBundleID];
  id v6 = [v4 budgetItemIdentifier];
  id v7 = [v5 objectForKeyedSubscript:v6];

  uint64_t v8 = (void *)MEMORY[0x263F5FC40];
  BOOL v9 = [v4 displayName];
  if (v7)
  {
    if ([v7 suppressFromSettings]) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = 2;
    }
  }
  else
  {
    uint64_t v10 = -1;
  }
  id v11 = [v8 preferenceSpecifierNamed:v9 target:self set:0 get:sel_getNotificationsInfo_ detail:0 cell:v10 edit:0];

  uint64_t v12 = PSBundlePathForPreferenceBundle();
  [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x263F60180]];

  [v11 setObject:*MEMORY[0x263F67448] forKeyedSubscript:*MEMORY[0x263F60080]];
  [v11 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FF60]];
  [v11 setControllerLoadAction:sel_lazyLoadBundle_];
  [v11 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  v13 = [MEMORY[0x263F825C8] systemGray4Color];
  [v11 setObject:v13 forKeyedSubscript:0x26D942068];

  [v11 setObject:v7 forKeyedSubscript:*MEMORY[0x263F67458]];
  [v11 setUserInfo:v4];
  uint64_t v14 = [v7 sectionID];
  if (v14)
  {
    [v11 setIdentifier:v14];
  }
  else
  {
    v15 = [v4 identifier];
    [v11 setIdentifier:v15];
  }
  return v11;
}

- (void)updateSpecifier:(id)a3 usageItem:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [v15 userInfo];

  if (v7 != v6)
  {
    uint64_t v8 = [v6 displayName];
    [v15 setName:v8];

    [v15 setUserInfo:v6];
    BOOL v9 = [(STNotificationsUsageGroupSpecifierProvider *)self notificationSectionByBundleID];
    uint64_t v10 = [v6 budgetItemIdentifier];
    id v11 = [v9 objectForKeyedSubscript:v10];

    uint64_t v12 = [v11 sectionID];
    if (v12)
    {
      [v15 setIdentifier:v12];
    }
    else
    {
      v13 = [v6 identifier];
      [v15 setIdentifier:v13];
    }
    if (v11) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = -1;
    }
    [v15 setCellType:v14];
    [v15 setObject:v11 forKeyedSubscript:*MEMORY[0x263F67458]];
  }
}

- (id)_usageDetailsCoordinator:(id)a3
{
  v3 = [(STUsageGroupSpecifierProvider *)self coordinator];
  id v4 = [v3 usageDetailsCoordinator];

  return v4;
}

- (id)getNotificationsInfo:(id)a3
{
  return (id)[a3 userInfo];
}

- (void)_specifierIdentifierDidChange:(id)a3
{
  id v6 = [a3 userInfo];
  id v4 = [v6 objectForKeyedSubscript:0x26D93E8E8];
  v5 = [(STShowMoreUsageGroupSpecifierProvider *)self summarySpecifier];
  [v5 setIdentifier:v4];
}

- (NSMutableDictionary)notificationSectionByBundleID
{
  return self->_notificationSectionByBundleID;
}

- (BBSettingsGateway)notificationSettingsGateway
{
  return self->_notificationSettingsGateway;
}

- (OS_dispatch_queue)notificationSettingsGatewayQueue
{
  return self->_notificationSettingsGatewayQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSettingsGatewayQueue, 0);
  objc_storeStrong((id *)&self->_notificationSettingsGateway, 0);

  objc_storeStrong((id *)&self->_notificationSectionByBundleID, 0);
}

@end