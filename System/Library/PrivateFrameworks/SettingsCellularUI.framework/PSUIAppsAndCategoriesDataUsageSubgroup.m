@interface PSUIAppsAndCategoriesDataUsageSubgroup
- (PSAppCellularUsageSpecifierDelegate)specifierDelegate;
- (PSDataUsageStatisticsCache)statisticsCache;
- (PSUIAppsAndCategoriesDataUsageSubgroup)initWithPolicySpecifierDelegate:(id)a3 statisticsCache:(id)a4;
- (id)getLogger;
- (id)specifiersWithSortComparator:(id)a3;
- (id)usageSpecifiersForAppType:(unint64_t)a3 bundleIDs:(id)a4;
- (void)addDataUsageCategorySpecifierToSpecifiers:(id)a3 appType:(unint64_t)a4;
- (void)setSpecifierDelegate:(id)a3;
- (void)setStatisticsCache:(id)a3;
@end

@implementation PSUIAppsAndCategoriesDataUsageSubgroup

- (PSUIAppsAndCategoriesDataUsageSubgroup)initWithPolicySpecifierDelegate:(id)a3 statisticsCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PSUIAppsAndCategoriesDataUsageSubgroup;
  v8 = [(PSUIAppsAndCategoriesDataUsageSubgroup *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_specifierDelegate, v6);
    objc_storeStrong((id *)&v9->_statisticsCache, a4);
  }

  return v9;
}

- (id)specifiersWithSortComparator:(id)a3
{
  id v4 = a3;
  v5 = [(PSDataUsageStatisticsCache *)self->_statisticsCache bundleIDsForAppType:0];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count") + 4);
  id v7 = [(PSUIAppsAndCategoriesDataUsageSubgroup *)self usageSpecifiersForAppType:0 bundleIDs:v5];
  [v6 addObjectsFromArray:v7];

  [(PSUIAppsAndCategoriesDataUsageSubgroup *)self addDataUsageCategorySpecifierToSpecifiers:v6 appType:2];
  [(PSUIAppsAndCategoriesDataUsageSubgroup *)self addDataUsageCategorySpecifierToSpecifiers:v6 appType:3];
  [(PSUIAppsAndCategoriesDataUsageSubgroup *)self addDataUsageCategorySpecifierToSpecifiers:v6 appType:1];
  [(PSUIAppsAndCategoriesDataUsageSubgroup *)self addDataUsageCategorySpecifierToSpecifiers:v6 appType:4];
  if (v4) {
    [v6 sortUsingComparator:v4];
  }

  return v6;
}

- (void)addDataUsageCategorySpecifierToSpecifiers:(id)a3 appType:(unint64_t)a4
{
  id v9 = a3;
  id v6 = [(PSDataUsageStatisticsCache *)self->_statisticsCache bundleIDsForAppType:a4];
  id v7 = [(PSUIAppsAndCategoriesDataUsageSubgroup *)self usageSpecifiersForAppType:a4 bundleIDs:v6];
  if ([v7 count])
  {
    v8 = [[PSUIDataUsageCategorySpecifier alloc] initWithType:a4 subSpecifiers:v7];
    [v9 addObject:v8];
  }
}

- (id)usageSpecifiersForAppType:(unint64_t)a3 bundleIDs:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([v6 count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v8 = [(PSDataUsageStatisticsCache *)self->_statisticsCache displayNamesForBundleIDs:v6 appType:a3];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v34 = v6;
    id obj = v6;
    uint64_t v42 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v42)
    {
      uint64_t v9 = *(void *)v44;
      uint64_t v40 = *(void *)v44;
      unint64_t v36 = a3;
      v37 = self;
      v35 = v7;
      v38 = v8;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v44 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v12 = [v8 objectForKey:v11];
          v13 = (void *)v12;
          v14 = &stru_26D410CA0;
          if (v12) {
            v14 = (__CFString *)v12;
          }
          v15 = v14;

          switch(a3)
          {
            case 0uLL:
              v16 = [MEMORY[0x263F67EB8] appSpecifierWithBundleID:v11 name:v15 statisticsCache:self->_statisticsCache];
              v17 = [(PSUIAppsAndCategoriesDataUsageSubgroup *)self specifierDelegate];
              [v16 setDelegate:v17];

              break;
            case 1uLL:
              v16 = (void *)[objc_alloc(MEMORY[0x263F67ED8]) initWithType:1 bundleID:v11 name:v15 statisticsCache:self->_statisticsCache];
              v18 = [(PSDataUsageStatisticsCache *)self->_statisticsCache usageForBundleID:v11 inPeriod:0];
              v19 = v18;
              if (v18)
              {
                v39 = [v18 native];
                uint64_t v20 = [v39 cellularHome];
                v21 = [v19 native];
                uint64_t v22 = [v21 cellularRoaming] + v20;
                v23 = [v19 proxied];
                uint64_t v24 = [v23 cellularHome];
                v25 = [v19 proxied];
                uint64_t v26 = v22 + v24 + [v25 cellularRoaming];

                self = v37;
                v27 = [(PSUIAppsAndCategoriesDataUsageSubgroup *)v37 getLogger];
                BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
                if (v26)
                {
                  uint64_t v9 = v40;
                  if (v28)
                  {
                    *(_DWORD *)buf = 138478083;
                    uint64_t v48 = v11;
                    __int16 v49 = 2048;
                    uint64_t v50 = v26;
                    _os_log_impl(&dword_221B17000, v27, OS_LOG_TYPE_DEFAULT, "%{private}@ is an uninstalled app using %zu bytes", buf, 0x16u);
                  }
                  id v7 = v35;
                  a3 = v36;
                }
                else
                {
                  id v7 = v35;
                  uint64_t v9 = v40;
                  if (v28)
                  {
                    *(_DWORD *)buf = 138477827;
                    uint64_t v48 = v11;
                    _os_log_impl(&dword_221B17000, v27, OS_LOG_TYPE_DEFAULT, "%{private}@ is an uninstalled app using zero bytes", buf, 0xCu);
                  }
                  a3 = v36;
                }
              }
              else
              {
                v27 = [(PSUIAppsAndCategoriesDataUsageSubgroup *)self getLogger];
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138477827;
                  uint64_t v48 = v11;
                  _os_log_error_impl(&dword_221B17000, v27, OS_LOG_TYPE_ERROR, "%{private}@ is an uninstalled app without usage?", buf, 0xCu);
                }
              }

              v8 = v38;
              break;
            case 2uLL:
              v16 = [MEMORY[0x263F67EF8] appSpecifierWithBundleID:v11 name:v15 statisticsCache:self->_statisticsCache];
              v29 = [(PSUIAppsAndCategoriesDataUsageSubgroup *)self specifierDelegate];
              [v16 setDelegate:v29];

              uint64_t v9 = v40;
              break;
            case 3uLL:
              id v30 = objc_alloc(MEMORY[0x263F67ED8]);
              statisticsCache = self->_statisticsCache;
              uint64_t v32 = 3;
              goto LABEL_19;
            case 4uLL:
              id v30 = objc_alloc(MEMORY[0x263F67ED8]);
              statisticsCache = self->_statisticsCache;
              uint64_t v32 = 4;
LABEL_19:
              v16 = (void *)[v30 initWithType:v32 bundleID:v11 name:v15 statisticsCache:statisticsCache];
              break;
            default:
              v16 = 0;
              break;
          }
          [v7 addObject:v16];
        }
        uint64_t v42 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v42);
    }

    id v6 = v34;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"AppsAndCategoriesDataUsage"];
}

- (PSAppCellularUsageSpecifierDelegate)specifierDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_specifierDelegate);
  return (PSAppCellularUsageSpecifierDelegate *)WeakRetained;
}

- (void)setSpecifierDelegate:(id)a3
{
}

- (PSDataUsageStatisticsCache)statisticsCache
{
  return self->_statisticsCache;
}

- (void)setStatisticsCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsCache, 0);
  objc_destroyWeak((id *)&self->_specifierDelegate);
}

@end