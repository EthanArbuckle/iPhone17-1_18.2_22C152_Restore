@interface PSUITopAppUsageGroup
- (BOOL)specifierCreationInProgress;
- (NSArray)createdSpecifiers;
- (NSString)groupSpecifierTitle;
- (PSCellularManagementCache)managementCache;
- (PSDataUsageStatisticsCache)statisticsCache;
- (PSListController)hostController;
- (PSSpecifier)loadingGroupSpecifier;
- (PSSpecifier)spinnerSpecifier;
- (PSUIAppsAndCategoriesDataUsageSubgroup)appsAndCategoriesSubgroup;
- (PSUICarrierSpaceManager)carrierSpaceManager;
- (PSUITopAppUsageGroup)initWithHostController:(id)a3 cellularManagementCache:(id)a4 dataUsageStatisticsCache:(id)a5 carrierSpaceManager:(id)a6 appsAndCategoriesSubgroup:(id)a7;
- (PSUITotalCellularUsageSubgroup)totalUsageSubgroup;
- (id)getLogger;
- (id)specifiers;
- (void)clearStoredSpecifiers;
- (void)createSpecifiers;
- (void)setAppsAndCategoriesSubgroup:(id)a3;
- (void)setCarrierSpaceManager:(id)a3;
- (void)setCreatedSpecifiers:(id)a3;
- (void)setGroupSpecifierTitle:(id)a3;
- (void)setHostController:(id)a3;
- (void)setLoadingGroupSpecifier:(id)a3;
- (void)setManagementCache:(id)a3;
- (void)setSpecifierCreationInProgress:(BOOL)a3;
- (void)setSpinnerSpecifier:(id)a3;
- (void)setStatisticsCache:(id)a3;
- (void)setTotalUsageSubgroup:(id)a3;
@end

@implementation PSUITopAppUsageGroup

- (PSUITopAppUsageGroup)initWithHostController:(id)a3 cellularManagementCache:(id)a4 dataUsageStatisticsCache:(id)a5 carrierSpaceManager:(id)a6 appsAndCategoriesSubgroup:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v27 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PSUITopAppUsageGroup;
  v17 = [(PSUITopAppUsageGroup *)&v28 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_hostController, a3);
    objc_storeStrong((id *)&v18->_managementCache, a4);
    objc_storeStrong((id *)&v18->_statisticsCache, a5);
    objc_storeStrong((id *)&v18->_carrierSpaceManager, a6);
    objc_storeStrong((id *)&v18->_appsAndCategoriesSubgroup, a7);
    v19 = (void *)MEMORY[0x263F5FC40];
    v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"APP_DATA_USAGE" value:&stru_26D410CA0 table:@"Cellular"];
    uint64_t v22 = [v19 groupSpecifierWithID:@"APP_DATA_USAGE" name:v21];
    loadingGroupSpecifier = v18->_loadingGroupSpecifier;
    v18->_loadingGroupSpecifier = (PSSpecifier *)v22;

    uint64_t v24 = [objc_alloc(MEMORY[0x263F5FC40]) initWithName:&stru_26D410CA0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
    spinnerSpecifier = v18->_spinnerSpecifier;
    v18->_spinnerSpecifier = (PSSpecifier *)v24;

    v18->_specifierCreationInProgress = 0;
  }

  return v18;
}

- (id)specifiers
{
  v7[2] = *MEMORY[0x263EF8340];
  createdSpecifiers = self->_createdSpecifiers;
  if (createdSpecifiers && [(NSArray *)createdSpecifiers count])
  {
    v4 = self->_createdSpecifiers;
  }
  else
  {
    [(PSUITopAppUsageGroup *)self createSpecifiers];
    spinnerSpecifier = self->_spinnerSpecifier;
    v7[0] = self->_loadingGroupSpecifier;
    v7[1] = spinnerSpecifier;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  }
  return v4;
}

- (void)createSpecifiers
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_specifierCreationInProgress)
  {
    v3 = [(PSUITopAppUsageGroup *)v2 getLogger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Refresh already in progress", buf, 2u);
    }

    objc_sync_exit(v2);
  }
  else
  {
    v2->_specifierCreationInProgress = 1;
    objc_sync_exit(v2);

    *(void *)buf = 0;
    objc_initWeak((id *)buf, v2);
    v4 = dispatch_get_global_queue(25, 0);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __40__PSUITopAppUsageGroup_createSpecifiers__block_invoke;
    v5[3] = &unk_2645E0E68;
    objc_copyWeak(&v6, (id *)buf);
    v5[4] = v2;
    dispatch_async(v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

void __40__PSUITopAppUsageGroup_createSpecifiers__block_invoke(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    v4 = [WeakRetained managementCache];
    int v5 = [v4 hasManagedCellularData];

    if (v5)
    {
      id v6 = objc_loadWeakRetained(v1);
      v7 = [v6 getLogger];

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEBUG, "Cellular Data is Managed, showing MDM Management Explanation group.", buf, 2u);
      }

      v8 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DATA_USAGE_MANAGED_GROUP"];
      v9 = [WeakRetained managementCache];
      v10 = [v9 mdmName];

      v11 = NSString;
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v13 = [v12 localizedStringForKey:@"APP_DATA_USAGE_MANAGED" value:&stru_26D410CA0 table:@"Cellular"];
      id v14 = objc_msgSend(v11, "stringWithFormat:", v13, v10);
      [v8 setProperty:v14 forKey:*MEMORY[0x263F600F8]];

      [v3 addObject:v8];
    }
    id v15 = [WeakRetained groupSpecifierTitle];

    if (!v15)
    {
      id v16 = [MEMORY[0x263F82670] currentDevice];
      int v17 = objc_msgSend(v16, "sf_isChinaRegionCellularDevice");
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = v18;
      if (v17) {
        v20 = @"APP_WIRELESS_DATA_USAGE";
      }
      else {
        v20 = @"APP_DATA_USAGE";
      }
      v21 = [v18 localizedStringForKey:v20 value:&stru_26D410CA0 table:@"Cellular"];
      [WeakRetained setGroupSpecifierTitle:v21];
    }
    uint64_t v22 = (void *)MEMORY[0x263F5FC40];
    v23 = [WeakRetained groupSpecifierTitle];
    uint64_t v24 = [v22 groupSpecifierWithID:@"APP_DATA_USAGE" name:v23];

    [v3 addObject:v24];
    v25 = [WeakRetained statisticsCache];
    if ([v25 useCalendarMonthBillingCycle])
    {
    }
    else
    {
      v32 = [WeakRetained statisticsCache];
      if ([v32 billingCycleSupported])
      {
LABEL_19:

        goto LABEL_20;
      }
      v48 = [WeakRetained carrierSpaceManager];
      v49 = [v48 capabilities];
      char v50 = [v49 supportsUsage];

      if (v50)
      {
LABEL_20:
        v33 = [WeakRetained appsAndCategoriesSubgroup];
        v34 = +[CTUIDataUsageSorting usageComparator];
        v35 = [v33 specifiersWithSortComparator:v34];

        unint64_t v36 = [v35 count];
        if (v36 < 5)
        {
          unint64_t v41 = v36;
          id v42 = objc_loadWeakRetained(v1);
          v43 = [v42 getLogger];

          if (!v41)
          {
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_221B17000, v43, OS_LOG_TYPE_DEFAULT, "No app usage specifiers, adding No Usage specifier", buf, 2u);
            }

            v51 = [MEMORY[0x263F82670] currentDevice];
            int v52 = objc_msgSend(v51, "sf_isChinaRegionCellularDevice");
            v53 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v54 = v53;
            if (v52) {
              v55 = @"APPS_APPEAR_AFTER_WIRELESS_DATA_USAGE";
            }
            else {
              v55 = @"APPS_APPEAR_AFTER_CELLULAR_USAGE";
            }
            v47 = [v53 localizedStringForKey:v55 value:&stru_26D410CA0 table:@"Cellular"];

            v56 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v47 target:0 set:0 get:0 detail:0 cell:3 edit:0];
            [v56 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
            [v3 addObject:v56];
            [WeakRetained setCreatedSpecifiers:v3];
            [WeakRetained setSpecifierCreationInProgress:0];
            v60[0] = MEMORY[0x263EF8330];
            v60[1] = 3221225472;
            v60[2] = __40__PSUITopAppUsageGroup_createSpecifiers__block_invoke_29;
            v60[3] = &unk_2645E0E68;
            objc_copyWeak(&v62, v1);
            id v61 = WeakRetained;
            dispatch_async(MEMORY[0x263EF83A0], v60);

            objc_destroyWeak(&v62);
            goto LABEL_31;
          }
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v64 = v41;
            _os_log_debug_impl(&dword_221B17000, v43, OS_LOG_TYPE_DEBUG, "Adding %lu app specifiers", buf, 0xCu);
          }

          [v3 addObjectsFromArray:v35];
        }
        else
        {
          id v37 = objc_loadWeakRetained(v1);
          v38 = [v37 getLogger];

          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v64 = 5;
            _os_log_debug_impl(&dword_221B17000, v38, OS_LOG_TYPE_DEBUG, "Adding %lu app specifiers", buf, 0xCu);
          }

          for (uint64_t i = 0; i != 5; ++i)
          {
            v40 = [v35 objectAtIndexedSubscript:i];
            [v3 addObject:v40];
          }
        }
        v44 = (void *)MEMORY[0x263F5FC40];
        v45 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v46 = [v45 localizedStringForKey:@"SHOW_ALL" value:&stru_26D410CA0 table:@"Cellular"];
        v47 = [v44 preferenceSpecifierNamed:v46 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

        [v47 setIdentifier:@"SHOW_ALL"];
        [v3 addObject:v47];
        [WeakRetained setCreatedSpecifiers:v3];
        [WeakRetained setSpecifierCreationInProgress:0];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __40__PSUITopAppUsageGroup_createSpecifiers__block_invoke_35;
        block[3] = &unk_2645E0E68;
        objc_copyWeak(&v59, v1);
        id v58 = WeakRetained;
        dispatch_async(MEMORY[0x263EF83A0], block);

        objc_destroyWeak(&v59);
LABEL_31:

        goto LABEL_32;
      }
    }
    id v26 = objc_loadWeakRetained(v1);
    id v27 = [v26 getLogger];

    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_221B17000, v27, OS_LOG_TYPE_DEBUG, "Adding Total Usage specifiers", buf, 2u);
    }

    objc_super v28 = [WeakRetained totalUsageSubgroup];

    if (!v28)
    {
      v29 = [PSUITotalCellularUsageSubgroup alloc];
      v30 = [WeakRetained statisticsCache];
      v31 = [(PSUITotalCellularUsageSubgroup *)v29 initWithStatisticsCache:v30 andBillingPeriodSource:0];
      [WeakRetained setTotalUsageSubgroup:v31];
    }
    v25 = [WeakRetained totalUsageSubgroup];
    v32 = [v25 specifiers];
    [v3 addObjectsFromArray:v32];
    goto LABEL_19;
  }
LABEL_32:
}

void __40__PSUITopAppUsageGroup_createSpecifiers__block_invoke_29(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained getLogger];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Top App Usage Group specifier creation complete, asking host to reload.", v5, 2u);
  }

  v4 = [*(id *)(a1 + 32) hostController];
  [v4 reloadSpecifiers];
}

void __40__PSUITopAppUsageGroup_createSpecifiers__block_invoke_35(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained getLogger];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Top App Usage Group specifier creation complete, asking host to reload.", v5, 2u);
  }

  v4 = [*(id *)(a1 + 32) hostController];
  [v4 reloadSpecifiers];
}

- (void)clearStoredSpecifiers
{
  self->_createdSpecifiers = 0;
  MEMORY[0x270F9A758]();
}

- (void)setGroupSpecifierTitle:(id)a3
{
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"PSUITopAppUsageGroup"];
}

- (PSListController)hostController
{
  return self->_hostController;
}

- (void)setHostController:(id)a3
{
}

- (PSCellularManagementCache)managementCache
{
  return self->_managementCache;
}

- (void)setManagementCache:(id)a3
{
}

- (PSDataUsageStatisticsCache)statisticsCache
{
  return self->_statisticsCache;
}

- (void)setStatisticsCache:(id)a3
{
}

- (PSUICarrierSpaceManager)carrierSpaceManager
{
  return self->_carrierSpaceManager;
}

- (void)setCarrierSpaceManager:(id)a3
{
}

- (PSUITotalCellularUsageSubgroup)totalUsageSubgroup
{
  return self->_totalUsageSubgroup;
}

- (void)setTotalUsageSubgroup:(id)a3
{
}

- (PSUIAppsAndCategoriesDataUsageSubgroup)appsAndCategoriesSubgroup
{
  return self->_appsAndCategoriesSubgroup;
}

- (void)setAppsAndCategoriesSubgroup:(id)a3
{
}

- (NSString)groupSpecifierTitle
{
  return self->_groupSpecifierTitle;
}

- (PSSpecifier)loadingGroupSpecifier
{
  return self->_loadingGroupSpecifier;
}

- (void)setLoadingGroupSpecifier:(id)a3
{
}

- (PSSpecifier)spinnerSpecifier
{
  return self->_spinnerSpecifier;
}

- (void)setSpinnerSpecifier:(id)a3
{
}

- (NSArray)createdSpecifiers
{
  return self->_createdSpecifiers;
}

- (void)setCreatedSpecifiers:(id)a3
{
}

- (BOOL)specifierCreationInProgress
{
  return self->_specifierCreationInProgress;
}

- (void)setSpecifierCreationInProgress:(BOOL)a3
{
  self->_specifierCreationInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdSpecifiers, 0);
  objc_storeStrong((id *)&self->_spinnerSpecifier, 0);
  objc_storeStrong((id *)&self->_loadingGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifierTitle, 0);
  objc_storeStrong((id *)&self->_appsAndCategoriesSubgroup, 0);
  objc_storeStrong((id *)&self->_totalUsageSubgroup, 0);
  objc_storeStrong((id *)&self->_carrierSpaceManager, 0);
  objc_storeStrong((id *)&self->_statisticsCache, 0);
  objc_storeStrong((id *)&self->_managementCache, 0);
  objc_storeStrong((id *)&self->_hostController, 0);
}

@end