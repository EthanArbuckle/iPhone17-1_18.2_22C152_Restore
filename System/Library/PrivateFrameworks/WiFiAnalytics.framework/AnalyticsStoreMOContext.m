@interface AnalyticsStoreMOContext
+ (id)sharedManagedObjectModel:(id)a3;
- (AnalyticsPersistenceManager)persistenceManager;
- (AnalyticsStoreDescriptor)storeDescriptor;
- (AnalyticsStoreMOContext)initWithStoreDescriptor:(id)a3;
- (BOOL)storeNeedsImmediatePruning:(unint64_t)a3;
- (NSManagedObjectModel)managedObjectModel;
- (NSManagedObjectModel)sharedManagedObjectModel;
- (void)setPersistenceManager:(id)a3;
- (void)setSharedManagedObjectModel:(id)a3;
- (void)setStoreDescriptor:(id)a3;
@end

@implementation AnalyticsStoreMOContext

+ (id)sharedManagedObjectModel:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__AnalyticsStoreMOContext_sharedManagedObjectModel___block_invoke;
  block[3] = &unk_264466048;
  id v9 = v3;
  uint64_t v4 = qword_26AA93D10;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_26AA93D10, block);
  }
  id v6 = (id)_MergedGlobals_5;

  return v6;
}

void __52__AnalyticsStoreMOContext_sharedManagedObjectModel___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v3 = [*(id *)(a1 + 32) path];
    int v6 = 136446722;
    v7 = "+[AnalyticsStoreMOContext sharedManagedObjectModel:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 31;
    __int16 v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_21D96D000, v2, OS_LOG_TYPE_ERROR, "%{public}s::%d:NSManagedObjectModel doesn't exist yet for this process, alloc and init instance for URL: %@", (uint8_t *)&v6, 0x1Cu);
  }
  uint64_t v4 = [objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:*(void *)(a1 + 32)];
  id v5 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = v4;
}

- (AnalyticsStoreMOContext)initWithStoreDescriptor:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AnalyticsStoreMOContext;
  int v6 = [(AnalyticsStoreMOContext *)&v16 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_15;
  }
  if (!v5)
  {
    int v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[AnalyticsStoreMOContext initWithStoreDescriptor:]";
      __int16 v19 = 1024;
      int v20 = 49;
      v13 = "%{public}s::%d:storeDescriptor is nil";
LABEL_10:
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, v13, buf, 0x12u);
    }
LABEL_14:

LABEL_15:
    persistenceManager = v7->_persistenceManager;
    v7->_persistenceManager = 0;

    int v9 = 0;
    v7 = 0;
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v6->_storeDescriptor, a3);
  __int16 v8 = [v5 modelURL];
  int v9 = +[AnalyticsStoreMOContext sharedManagedObjectModel:v8];

  if (!v9)
  {
    int v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[AnalyticsStoreMOContext initWithStoreDescriptor:]";
      __int16 v19 = 1024;
      int v20 = 55;
      v13 = "%{public}s::%d:failed to create managedObjectModel";
      goto LABEL_10;
    }
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v7->_managedObjectModel, v9);
  __int16 v10 = [[AnalyticsPersistenceManager alloc] initWithManagedObjectModel:v9 storeDescriptor:v7->_storeDescriptor];
  v11 = v7->_persistenceManager;
  v7->_persistenceManager = v10;

  if (!v7->_persistenceManager)
  {
    v14 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[AnalyticsStoreMOContext initWithStoreDescriptor:]";
      __int16 v19 = 1024;
      int v20 = 60;
      _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to create persistence manager", buf, 0x12u);
    }

    goto LABEL_14;
  }
LABEL_5:

  return v7;
}

- (BOOL)storeNeedsImmediatePruning:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(AnalyticsStoreMOContext *)self storeDescriptor];
  id v5 = [v4 storeURL];
  int v6 = [v5 path];

  v7 = [MEMORY[0x263F08850] defaultManager];
  id v16 = 0;
  __int16 v8 = [v7 attributesOfItemAtPath:v6 error:&v16];
  id v9 = v16;

  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10)
  {
    v11 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v18 = "-[AnalyticsStoreMOContext storeNeedsImmediatePruning:]";
      __int16 v19 = 1024;
      int v20 = 80;
      __int16 v21 = 2112;
      unint64_t v22 = (unint64_t)v9;
      _os_log_impl(&dword_21D96D000, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to get attributes for storeURL with error %@", buf, 0x1Cu);
    }
  }
  uint64_t v12 = [v8 objectForKey:*MEMORY[0x263F080B8]];
  unint64_t v13 = [v12 unsignedLongLongValue];
  if (v13 > a3)
  {
    v14 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "-[AnalyticsStoreMOContext storeNeedsImmediatePruning:]";
      __int16 v19 = 1024;
      int v20 = 89;
      __int16 v21 = 2048;
      unint64_t v22 = v13;
      __int16 v23 = 2048;
      unint64_t v24 = a3;
      _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Store size %llu bytes exceeds %llu bytes", buf, 0x26u);
    }
  }
  return v13 > a3;
}

- (AnalyticsPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (AnalyticsStoreDescriptor)storeDescriptor
{
  return self->_storeDescriptor;
}

- (void)setStoreDescriptor:(id)a3
{
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (NSManagedObjectModel)sharedManagedObjectModel
{
  return self->_sharedManagedObjectModel;
}

- (void)setSharedManagedObjectModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedManagedObjectModel, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_storeDescriptor, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
}

@end