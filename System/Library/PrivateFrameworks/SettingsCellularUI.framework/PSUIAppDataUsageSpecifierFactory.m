@interface PSUIAppDataUsageSpecifierFactory
- (NSArray)bundleIDs;
- (NSArray)savedHeaderSpecifiers;
- (NSString)groupSpecifierTitle;
- (PSAppCellularUsageSpecifierDelegate)policySpecifierDelegate;
- (PSBillingPeriodSelectorSpecifier)billingPeriodSelectorSpecifier;
- (PSBillingPeriodSelectorSpecifierDelegate)billingCycleDelegate;
- (PSCellularManagementCache)managementCache;
- (PSDataUsageStatisticsCache)statisticsCache;
- (PSUIAppDataUsageSpecifierFactory)initWithGroupSpecifierTitle:(id)a3 managementCache:(id)a4 statisticsCache:(id)a5 carrierSpaceManager:(id)a6 billingCycleDelegate:(id)a7 policySpecifierDelegate:(id)a8;
- (PSUICarrierSpaceManager)carrierSpaceManager;
- (PSUICellularUsageContentSpecifiers)savedContentSpecifiers;
- (PSUITotalCellularUsageSubgroup)totalUsageSubgroup;
- (id)contentSpecifiers;
- (id)getLogger;
- (id)headerSpecifiers;
- (void)addAppUsageSpecifiersToContentSpecifiers:(id)a3;
- (void)addLeadingSpecifiersToContentSpecifiers:(id)a3;
- (void)addTrailingSpecifiersToContentSpecifiers:(id)a3;
- (void)refreshOrderingOfContentSpecifiers;
- (void)setBillingCycleDelegate:(id)a3;
- (void)setBillingPeriodSelectorSpecifier:(id)a3;
- (void)setBundleIDs:(id)a3;
- (void)setCarrierSpaceManager:(id)a3;
- (void)setGroupSpecifierTitle:(id)a3;
- (void)setManagementCache:(id)a3;
- (void)setPolicySpecifierDelegate:(id)a3;
- (void)setSavedContentSpecifiers:(id)a3;
- (void)setSavedHeaderSpecifiers:(id)a3;
- (void)setStatisticsCache:(id)a3;
- (void)setTotalUsageSubgroup:(id)a3;
@end

@implementation PSUIAppDataUsageSpecifierFactory

- (PSUIAppDataUsageSpecifierFactory)initWithGroupSpecifierTitle:(id)a3 managementCache:(id)a4 statisticsCache:(id)a5 carrierSpaceManager:(id)a6 billingCycleDelegate:(id)a7 policySpecifierDelegate:(id)a8
{
  id v23 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PSUIAppDataUsageSpecifierFactory;
  v20 = [(PSUIAppDataUsageSpecifierFactory *)&v24 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_managementCache, a4);
    objc_storeStrong((id *)&v21->_statisticsCache, a5);
    objc_storeStrong((id *)&v21->_carrierSpaceManager, a6);
    objc_storeWeak((id *)&v21->_billingCycleDelegate, v18);
    objc_storeWeak((id *)&v21->_policySpecifierDelegate, v19);
    objc_storeStrong((id *)&v21->_groupSpecifierTitle, a3);
  }

  return v21;
}

- (id)headerSpecifiers
{
  savedHeaderSpecifiers = self->_savedHeaderSpecifiers;
  if (!savedHeaderSpecifiers)
  {
    v4 = (NSArray *)objc_opt_new();
    if ([(PSCellularManagementCache *)self->_managementCache hasManagedCellularData])
    {
      v5 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DATA_USAGE_MANAGED_GROUP"];
      v6 = [(PSCellularManagementCache *)self->_managementCache mdmName];
      v7 = NSString;
      v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v9 = [v8 localizedStringForKey:@"APP_DATA_USAGE_MANAGED" value:&stru_26D410CA0 table:@"Cellular"];
      v10 = objc_msgSend(v7, "stringWithFormat:", v9, v6);
      [v5 setProperty:v10 forKey:*MEMORY[0x263F600F8]];

      [(NSArray *)v4 addObject:v5];
    }
    v11 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"APP_DATA_USAGE" name:self->_groupSpecifierTitle];
    [(NSArray *)v4 addObject:v11];
    v12 = self->_savedHeaderSpecifiers;
    self->_savedHeaderSpecifiers = v4;

    savedHeaderSpecifiers = self->_savedHeaderSpecifiers;
  }
  return savedHeaderSpecifiers;
}

- (id)contentSpecifiers
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_savedContentSpecifiers)
  {
    if ([(PSDataUsageStatisticsCache *)v2->_statisticsCache billingCycleSupported])[(PSBillingPeriodSelectorSpecifier *)v2->_billingPeriodSelectorSpecifier refreshSelectorWithStatisticsCache:v2->_statisticsCache]; {
  }
    }
  else
  {
    v3 = [(PSUIAppDataUsageSpecifierFactory *)v2 getLogger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Creating app usage specifiers", buf, 2u);
    }

    v4 = objc_alloc_init(PSUICellularUsageContentSpecifiers);
    [(PSUIAppDataUsageSpecifierFactory *)v2 addLeadingSpecifiersToContentSpecifiers:v4];
    [(PSUIAppDataUsageSpecifierFactory *)v2 addAppUsageSpecifiersToContentSpecifiers:v4];
    [(PSUIAppDataUsageSpecifierFactory *)v2 addTrailingSpecifiersToContentSpecifiers:v4];
    savedContentSpecifiers = v2->_savedContentSpecifiers;
    v2->_savedContentSpecifiers = v4;
  }
  objc_sync_exit(v2);

  v6 = [(PSUIAppDataUsageSpecifierFactory *)v2 getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "Returning saved specifiers", v9, 2u);
  }

  v7 = [(PSUICellularUsageContentSpecifiers *)v2->_savedContentSpecifiers specifiers];
  return v7;
}

- (void)addLeadingSpecifiersToContentSpecifiers:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  int v6 = [(PSDataUsageStatisticsCache *)self->_statisticsCache billingCycleSupported];
  v7 = [(PSUIAppDataUsageSpecifierFactory *)self getLogger];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Billing cycle supported, adding billing period selector.", buf, 2u);
    }

    if (!self->_billingPeriodSelectorSpecifier)
    {
      v9 = (PSBillingPeriodSelectorSpecifier *)[objc_alloc(MEMORY[0x263F67EC8]) initWithStatisticsCache:self->_statisticsCache];
      billingPeriodSelectorSpecifier = self->_billingPeriodSelectorSpecifier;
      self->_billingPeriodSelectorSpecifier = v9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_billingCycleDelegate);
    [(PSBillingPeriodSelectorSpecifier *)self->_billingPeriodSelectorSpecifier setDelegate:WeakRetained];

    [v5 insertObject:self->_billingPeriodSelectorSpecifier atIndex:0];
    if ([(PSDataUsageStatisticsCache *)self->_statisticsCache useCalendarMonthBillingCycle])
    {
      v12 = [(PSUIAppDataUsageSpecifierFactory *)self getLogger];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, "Using calendar month billing cycle and adding total usage subgroup", v29, 2u);
      }

      p_totalUsageSubgroup = &self->_totalUsageSubgroup;
      totalUsageSubgroup = self->_totalUsageSubgroup;
      if (totalUsageSubgroup)
      {
        id v15 = self->_billingPeriodSelectorSpecifier;
LABEL_18:
        [(PSUITotalCellularUsageSubgroup *)totalUsageSubgroup setBillingPeriodSource:v15];
LABEL_22:
        objc_super v24 = [(PSUITotalCellularUsageSubgroup *)*p_totalUsageSubgroup specifiers];
        [v5 addObjectsFromArray:v24];

        goto LABEL_23;
      }
      id v19 = [PSUITotalCellularUsageSubgroup alloc];
      statisticsCache = self->_statisticsCache;
      v21 = self->_billingPeriodSelectorSpecifier;
      goto LABEL_21;
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Billing cycle not supported, adding standard total app usage headers.", v28, 2u);
    }

    id v16 = [(PSUICarrierSpaceManager *)self->_carrierSpaceManager capabilities];
    char v17 = [v16 supportsUsage];

    if ((v17 & 1) == 0)
    {
      id v18 = [(PSUIAppDataUsageSpecifierFactory *)self getLogger];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_221B17000, v18, OS_LOG_TYPE_DEFAULT, "carrier space usage not supported, adding local total usage headers", v27, 2u);
      }

      p_totalUsageSubgroup = &self->_totalUsageSubgroup;
      totalUsageSubgroup = self->_totalUsageSubgroup;
      if (totalUsageSubgroup)
      {
        id v15 = 0;
        goto LABEL_18;
      }
      id v19 = [PSUITotalCellularUsageSubgroup alloc];
      statisticsCache = self->_statisticsCache;
      v21 = 0;
LABEL_21:
      v22 = [(PSUITotalCellularUsageSubgroup *)v19 initWithStatisticsCache:statisticsCache andBillingPeriodSource:v21];
      id v23 = self->_totalUsageSubgroup;
      self->_totalUsageSubgroup = v22;

      goto LABEL_22;
    }
  }
LABEL_23:
  v25 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Sort options" target:0 set:0 get:0 detail:0 cell:4 edit:0];
  [v25 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v5 addObject:v25];
  v26 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
  [v4 setLeadingContentSpecifiers:v26];
}

- (void)addAppUsageSpecifiersToContentSpecifiers:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v23 = a3;
  objc_super v24 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [PSUIAppsAndCategoriesDataUsageSubgroup alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_policySpecifierDelegate);
  int v6 = [(PSUIAppsAndCategoriesDataUsageSubgroup *)v4 initWithPolicySpecifierDelegate:WeakRetained statisticsCache:self->_statisticsCache];

  v7 = +[CTUIDataUsageSorting userSelectedComparator];
  v22 = v6;
  BOOL v8 = [(PSUIAppsAndCategoriesDataUsageSubgroup *)v6 specifiersWithSortComparator:v7];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v14 setBillingPeriodSource:self->_billingPeriodSelectorSpecifier];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v15 = [v14 subcategorySpecifiers];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v26;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v26 != v18) {
                  objc_enumerationMutation(v15);
                }
                [*(id *)(*((void *)&v25 + 1) + 8 * j) setBillingPeriodSource:self->_billingPeriodSelectorSpecifier];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v17);
          }
        }
        else
        {
          id v15 = [v14 bundleID];
          [(NSArray *)v24 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }

  v20 = [MEMORY[0x263EFF980] arrayWithArray:v9];
  [v23 setAppSpecifiers:v20];

  bundleIDs = self->_bundleIDs;
  self->_bundleIDs = v24;
}

- (void)addTrailingSpecifiersToContentSpecifiers:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  int v6 = [v4 appSpecifiers];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    BOOL v8 = [(PSUIAppDataUsageSpecifierFactory *)self getLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "No app usage specifiers, adding No Usage specifier", buf, 2u);
    }

    id v9 = [MEMORY[0x263F82670] currentDevice];
    int v10 = objc_msgSend(v9, "sf_isChinaRegionCellularDevice");
    uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v12 = v11;
    if (v10) {
      v13 = @"APPS_APPEAR_AFTER_WIRELESS_DATA_USAGE";
    }
    else {
      v13 = @"APPS_APPEAR_AFTER_CELLULAR_USAGE";
    }
    v14 = [v11 localizedStringForKey:v13 value:&stru_26D410CA0 table:@"Cellular"];

    id v15 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v14 target:0 set:0 get:0 detail:0 cell:3 edit:0];
    [v15 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
    [v5 addObject:v15];
  }
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
  [v4 setTrailingContentSpecifiers:v16];
}

- (void)refreshOrderingOfContentSpecifiers
{
  v3 = [(PSUIAppDataUsageSpecifierFactory *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Sorting app specifiers", v6, 2u);
  }

  id v4 = [(PSUICellularUsageContentSpecifiers *)self->_savedContentSpecifiers appSpecifiers];
  v5 = +[CTUIDataUsageSorting userSelectedComparator];
  [v4 sortUsingComparator:v5];
}

- (void)setGroupSpecifierTitle:(id)a3
{
  objc_storeStrong((id *)&self->_groupSpecifierTitle, a3);
  id v7 = a3;
  savedContentSpecifiers = self->_savedContentSpecifiers;
  self->_savedContentSpecifiers = 0;

  savedHeaderSpecifiers = self->_savedHeaderSpecifiers;
  self->_savedHeaderSpecifiers = 0;
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"PSUICellularUsageLayoutGroup"];
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

- (PSBillingPeriodSelectorSpecifierDelegate)billingCycleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_billingCycleDelegate);
  return (PSBillingPeriodSelectorSpecifierDelegate *)WeakRetained;
}

- (void)setBillingCycleDelegate:(id)a3
{
}

- (PSAppCellularUsageSpecifierDelegate)policySpecifierDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_policySpecifierDelegate);
  return (PSAppCellularUsageSpecifierDelegate *)WeakRetained;
}

- (void)setPolicySpecifierDelegate:(id)a3
{
}

- (NSString)groupSpecifierTitle
{
  return self->_groupSpecifierTitle;
}

- (NSArray)savedHeaderSpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSavedHeaderSpecifiers:(id)a3
{
}

- (PSUICellularUsageContentSpecifiers)savedContentSpecifiers
{
  return (PSUICellularUsageContentSpecifiers *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSavedContentSpecifiers:(id)a3
{
}

- (PSUITotalCellularUsageSubgroup)totalUsageSubgroup
{
  return self->_totalUsageSubgroup;
}

- (void)setTotalUsageSubgroup:(id)a3
{
}

- (PSBillingPeriodSelectorSpecifier)billingPeriodSelectorSpecifier
{
  return self->_billingPeriodSelectorSpecifier;
}

- (void)setBillingPeriodSelectorSpecifier:(id)a3
{
}

- (void)setBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_billingPeriodSelectorSpecifier, 0);
  objc_storeStrong((id *)&self->_totalUsageSubgroup, 0);
  objc_storeStrong((id *)&self->_savedContentSpecifiers, 0);
  objc_storeStrong((id *)&self->_savedHeaderSpecifiers, 0);
  objc_storeStrong((id *)&self->_groupSpecifierTitle, 0);
  objc_destroyWeak((id *)&self->_policySpecifierDelegate);
  objc_destroyWeak((id *)&self->_billingCycleDelegate);
  objc_storeStrong((id *)&self->_carrierSpaceManager, 0);
  objc_storeStrong((id *)&self->_statisticsCache, 0);
  objc_storeStrong((id *)&self->_managementCache, 0);
}

@end