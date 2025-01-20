@interface PSCellularManagementCache
+ (id)sharedInstance;
- (BOOL)hasManagedCellularData;
- (BOOL)isGlobalDataModificationRestricted;
- (BOOL)isManaged:(id)a3;
- (NSSet)managedCellDataAppCache;
- (NSString)mdmName;
- (PSCellularManagementCache)init;
- (id)getLogger;
- (id)initPrivate;
- (id)managedAppBundleIDs;
- (id)managedCellDataAppBundleIDs;
- (void)clearCache;
- (void)managedConfigurationProfileListDidChange;
- (void)managedConfigurationSettingsDidChange;
- (void)setManagedCellDataAppCache:(id)a3;
- (void)willEnterForeground;
@end

@implementation PSCellularManagementCache

+ (id)sharedInstance
{
  if (qword_26AC32868 != -1) {
    dispatch_once(&qword_26AC32868, &__block_literal_global);
  }
  v2 = (void *)_MergedGlobals_2;
  return v2;
}

uint64_t __43__PSCellularManagementCache_sharedInstance__block_invoke()
{
  _MergedGlobals_2 = [[PSCellularManagementCache alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  v9.receiver = self;
  v9.super_class = (Class)PSCellularManagementCache;
  v2 = [(PSCellularManagementCache *)&v9 init];
  v3 = v2;
  if (v2)
  {
    managedCellDataAppCache = v2->_managedCellDataAppCache;
    v2->_managedCellDataAppCache = 0;

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v3 selector:sel_willEnterForeground name:*MEMORY[0x263F1D0D0] object:0];

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v3 selector:sel_managedConfigurationSettingsDidChange name:*MEMORY[0x263F536E0] object:0];

    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v3 selector:sel_managedConfigurationProfileListDidChange name:*MEMORY[0x263F53B18] object:0];
  }
  return v3;
}

- (PSCellularManagementCache)init
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = [(PSCellularManagementCache *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    v4 = "-[PSCellularManagementCache init]";
    _os_log_error_impl(&dword_2247E9000, v2, OS_LOG_TYPE_ERROR, "unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void)clearCache
{
  int v3 = [(PSCellularManagementCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Clearing cellular management cache", v4, 2u);
  }

  [(PSCellularManagementCache *)self setManagedCellDataAppCache:0];
}

- (void)willEnterForeground
{
  int v3 = [(PSCellularManagementCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Received willEnterForeground notification", v4, 2u);
  }

  [(PSCellularManagementCache *)self clearCache];
}

- (void)managedConfigurationSettingsDidChange
{
  int v3 = [(PSCellularManagementCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Received managedConfigurationSettingsDidChange notification", v4, 2u);
  }

  [(PSCellularManagementCache *)self clearCache];
}

- (void)managedConfigurationProfileListDidChange
{
  int v3 = [(PSCellularManagementCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2247E9000, v3, OS_LOG_TYPE_DEFAULT, "Received managedConfigurationProfileListDidChange notification", v4, 2u);
  }

  [(PSCellularManagementCache *)self clearCache];
}

- (BOOL)isGlobalDataModificationRestricted
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F53748]] == 2;

  return v3;
}

- (NSString)mdmName
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 installedMDMProfileIdentifier];

  v4 = [MEMORY[0x263F53C50] sharedConnection];
  uint64_t v5 = [v4 installedProfileWithIdentifier:v3];

  v6 = [v5 friendlyName];

  return (NSString *)v6;
}

- (id)managedAppBundleIDs
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 managedAppIDs];

  return v3;
}

- (id)managedCellDataAppBundleIDs
{
  v2 = self;
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v3 = [(PSCellularManagementCache *)self managedCellDataAppCache];

  if (!v3)
  {
    v4 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v16 = v2;
    uint64_t v5 = [(PSCellularManagementCache *)v2 managedAppBundleIDs];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * v9);
          v11 = +[PSAppDataUsagePolicyCache sharedInstance];
          v12 = [v11 policiesFor:v10];
          int v13 = [v12 isManaged];

          if (v13) {
            [v4 addObject:v10];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    v2 = v16;
    [(PSCellularManagementCache *)v16 setManagedCellDataAppCache:v4];
  }
  v14 = [(PSCellularManagementCache *)v2 managedCellDataAppCache];
  return v14;
}

- (BOOL)hasManagedCellularData
{
  v2 = [(PSCellularManagementCache *)self managedCellDataAppBundleIDs];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isManaged:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(PSCellularManagementCache *)self managedCellDataAppBundleIDs];
  int v6 = [v5 containsObject:v4];

  uint64_t v7 = [(PSCellularManagementCache *)self getLogger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = @"is not managed";
    if (v6) {
      uint64_t v8 = @"is managed";
    }
    int v10 = 138543618;
    id v11 = v4;
    __int16 v12 = 2112;
    int v13 = v8;
    _os_log_impl(&dword_2247E9000, v7, OS_LOG_TYPE_INFO, "For %{public}@, policy: %@", (uint8_t *)&v10, 0x16u);
  }

  return v6;
}

- (id)getLogger
{
  return +[Logger loggerWithCategory:@"CellularManagement"];
}

- (NSSet)managedCellDataAppCache
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setManagedCellDataAppCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end