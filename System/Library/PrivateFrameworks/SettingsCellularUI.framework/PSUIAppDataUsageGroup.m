@interface PSUIAppDataUsageGroup
- (CTUIListLoadingGroup)loadingGroup;
- (PSListController)hostController;
- (PSSpecifier)groupSpecifier;
- (PSUIAppDataUsageGroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (id)getLogger;
- (id)specifiers;
- (void)calculateUsage;
- (void)didFailToSetPolicyForSpecifier:(id)a3;
- (void)prefetchResourcesFor:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setHostController:(id)a3;
- (void)setLoadingGroup:(id)a3;
@end

@implementation PSUIAppDataUsageGroup

- (PSUIAppDataUsageGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PSUIAppDataUsageGroup;
  v8 = [(PSUIAppDataUsageGroup *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_hostController, v6);
    objc_storeWeak((id *)&v9->_groupSpecifier, v7);
    v10 = [[CTUIListLoadingGroup alloc] initWithHostController:v6 groupSpecifier:v7];
    loadingGroup = v9->_loadingGroup;
    v9->_loadingGroup = v10;
  }
  return v9;
}

- (id)specifiers
{
  v2 = [(PSUIAppDataUsageGroup *)self loadingGroup];
  v3 = [v2 specifiers];

  return v3;
}

- (void)prefetchResourcesFor:(id)a3
{
  id v3 = (id)[a3 performGetter];
}

- (void)didFailToSetPolicyForSpecifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__PSUIAppDataUsageGroup_didFailToSetPolicyForSpecifier___block_invoke;
  v6[3] = &unk_2645E0B60;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __56__PSUIAppDataUsageGroup_didFailToSetPolicyForSpecifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) hostController];
  [v2 reloadSpecifier:*(void *)(a1 + 40)];
}

- (void)calculateUsage
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x263F67EE0] sharedInstance];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__PSUIAppDataUsageGroup_calculateUsage__block_invoke;
  v4[3] = &unk_2645E0BD8;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  [v3 fetchDeviceDataUsageWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __39__PSUIAppDataUsageGroup_calculateUsage__block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[PSUIAppDataUsageGroup calculateUsage]_block_invoke";
    _os_log_impl(&dword_221B17000, v2, OS_LOG_TYPE_DEFAULT, "%s creating specifiers", (uint8_t *)&buf, 0xCu);
  }

  id v3 = [PSUIAppsAndCategoriesDataUsageSubgroup alloc];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [MEMORY[0x263F67EE0] sharedInstance];
  id v6 = [(PSUIAppsAndCategoriesDataUsageSubgroup *)v3 initWithPolicySpecifierDelegate:v4 statisticsCache:v5];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  id v7 = +[CTUIDataUsageSorting userSelectedComparator];
  id v33 = [(PSUIAppsAndCategoriesDataUsageSubgroup *)v6 specifiersWithSortComparator:v7];

  v8 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v27 = 136315138;
    v28 = "-[PSUIAppDataUsageGroup calculateUsage]_block_invoke";
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "%s prefetching policies", v27, 0xCu);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = *(id *)(*((void *)&buf + 1) + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * v12);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        [WeakRetained prefetchResourcesFor:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  uint64_t v15 = [*(id *)(*((void *)&buf + 1) + 40) count];
  v16 = *(void **)(a1 + 32);
  if (v15)
  {
    v17 = [v16 getLogger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 136315138;
      v28 = "-[PSUIAppDataUsageGroup calculateUsage]_block_invoke_2";
      _os_log_impl(&dword_221B17000, v17, OS_LOG_TYPE_DEFAULT, "%s dispatching app specifiers update to main thread", v27, 0xCu);
    }

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __39__PSUIAppDataUsageGroup_calculateUsage__block_invoke_14;
    v19[3] = &unk_2645E0BB0;
    v19[4] = *(void *)(a1 + 32);
    v19[5] = &buf;
    objc_copyWeak(&v20, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x263EF83A0], v19);
    objc_destroyWeak(&v20);
  }
  else
  {
    v18 = [v16 getLogger];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 136315138;
      v28 = "-[PSUIAppDataUsageGroup calculateUsage]_block_invoke";
      _os_log_impl(&dword_221B17000, v18, OS_LOG_TYPE_DEFAULT, "%s no apps to show", v27, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__PSUIAppDataUsageGroup_calculateUsage__block_invoke_4;
    block[3] = &unk_2645E0B88;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  _Block_object_dispose(&buf, 8);
}

void __39__PSUIAppDataUsageGroup_calculateUsage__block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) groupSpecifier];
  [v2 setName:&stru_26D410CA0];

  id v5 = [*(id *)(a1 + 32) groupSpecifier];
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"APPS_APPEAR_AFTER_WIRELESS_DATA_USAGE" value:&stru_26D410CA0 table:@"Cellular"];
  [v5 setProperty:v4 forKey:*MEMORY[0x263F600F8]];
}

void __39__PSUIAppDataUsageGroup_calculateUsage__block_invoke_14(uint64_t a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Sort options" target:0 set:0 get:0 detail:0 cell:4 edit:0];
  [v2 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  v15[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  uint64_t v4 = [v3 arrayByAddingObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"USE_WIRELESS_DATA" value:&stru_26D410CA0 table:@"Cellular"];
  id v9 = [*(id *)(a1 + 32) groupSpecifier];
  [v9 setName:v8];

  uint64_t v10 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v14 = "-[PSUIAppDataUsageGroup calculateUsage]_block_invoke";
    _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "%s updating app specifiers on main thread", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v12 = [WeakRetained loadingGroup];
  [v12 setSpecifiers:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"AppDataUsageGroup"];
}

- (PSListController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (PSListController *)WeakRetained;
}

- (void)setHostController:(id)a3
{
}

- (PSSpecifier)groupSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  return (PSSpecifier *)WeakRetained;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (CTUIListLoadingGroup)loadingGroup
{
  return self->_loadingGroup;
}

- (void)setLoadingGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingGroup, 0);
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end