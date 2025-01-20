@interface WAAnalyticsAccess
+ (id)accessWithOptions:(unint64_t)a3;
+ (id)sharedWAAnalyticsAccess;
+ (void)initialize;
- (AnalyticsStoreMOContext)storeMOContext;
- (AnalyticsStoreMOHandler)moHandler;
- (BOOL)save;
- (NSError)persistentStoreError;
- (NSManagedObjectContext)mainObjectContext;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (WAAnalyticsAccess)initWithOptions:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)options;
- (void)reset;
- (void)setMoHandler:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPersistentStoreError:(id)a3;
@end

@implementation WAAnalyticsAccess

+ (id)sharedWAAnalyticsAccess
{
  if (qword_26AA93D20 != -1) {
    dispatch_once(&qword_26AA93D20, &__block_literal_global_5);
  }
  v2 = (void *)_MergedGlobals_6;
  return v2;
}

void __44__WAAnalyticsAccess_sharedWAAnalyticsAccess__block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    v4 = "+[WAAnalyticsAccess sharedWAAnalyticsAccess]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 65;
    _os_log_impl(&dword_21D96D000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:sharedWAAnalyticsAccess doesn't exist yet for this process, alloc and init instance", (uint8_t *)&v3, 0x12u);
  }

  v1 = objc_alloc_init(WAAnalyticsAccess);
  v2 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = (uint64_t)v1;
}

+ (void)initialize
{
  registry = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  MEMORY[0x270F9A758]();
}

+ (id)accessWithOptions:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (a3)
    {
      __int16 v5 = @"WAAccessReadOnly";
    }
    else
    {
      v4 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136446722;
        v11 = "+[WAAnalyticsAccess accessWithOptions:]";
        __int16 v12 = 1024;
        int v13 = 90;
        __int16 v14 = 2048;
        unint64_t v15 = a3;
        _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unhandled options %lu", (uint8_t *)&v10, 0x1Cu);
      }

      __int16 v5 = 0;
    }
  }
  else
  {
    __int16 v5 = @"WAAccessReadWrite";
  }
  id v6 = (id)registry;
  objc_sync_enter(v6);
  uint64_t v7 = [(id)registry objectForKey:v5];
  if (!v7)
  {
    uint64_t v7 = [[WAAnalyticsAccess alloc] initWithOptions:a3];
    [(id)registry setObject:v7 forKey:v5];
  }
  objc_sync_exit(v6);

  v8 = (void *)[(WAAnalyticsAccess *)v7 copy];
  return v8;
}

- (WAAnalyticsAccess)initWithOptions:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WAAnalyticsAccess;
  result = [(WAAnalyticsAccess *)&v5 init];
  if (result) {
    result->_options = a3;
  }
  return result;
}

- (NSManagedObjectContext)mainObjectContext
{
  return [(AnalyticsStoreMOHandler *)self->__moHandler managedObjectContext];
}

- (void)reset
{
  id v2 = [(WAAnalyticsAccess *)self mainObjectContext];
  [v2 reset];
}

- (BOOL)save
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v3 = [(WAAnalyticsAccess *)self persistentStoreCoordinator];

  if (v3)
  {
    v4 = [(WAAnalyticsAccess *)self mainObjectContext];
    int v5 = [v4 hasChanges];

    if (!v5) {
      return 1;
    }
    id v6 = [(WAAnalyticsAccess *)self mainObjectContext];
    uint64_t v10 = 0;
    char v7 = [v6 save:&v10];

    if (v7) {
      return 1;
    }
    v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v12 = "-[WAAnalyticsAccess save]";
      __int16 v13 = 1024;
      int v14 = 164;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error saving moc", buf, 0x12u);
    }
  }
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v4 = objc_alloc_init(WAAnalyticsAccess);
  v4->_unint64_t options = [(WAAnalyticsAccess *)self options];
  uint64_t v5 = +[AnalyticsStoreMOHandler sharedAnalyticsStoreMOHandlerWithPersist];
  moHandler = v4->__moHandler;
  v4->__moHandler = (AnalyticsStoreMOHandler *)v5;

  uint64_t v7 = [(WAAnalyticsAccess *)self persistentStoreCoordinator];
  persistentStoreCoordinator = v4->__persistentStoreCoordinator;
  v4->__persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v7;

  v9 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t options = v4->_options;
    BOOL v11 = v4->__moHandler != 0;
    BOOL v12 = v4->__persistentStoreCoordinator != 0;
    int v14 = 136447234;
    uint64_t v15 = "-[WAAnalyticsAccess copyWithZone:]";
    __int16 v16 = 1024;
    int v17 = 181;
    __int16 v18 = 2048;
    unint64_t v19 = options;
    __int16 v20 = 1024;
    BOOL v21 = v11;
    __int16 v22 = 1024;
    BOOL v23 = v12;
    _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WAAnalyticsAccess copyWithZone unint64_t options = %lu, moHandler exists = %d, psc exists = %d", (uint8_t *)&v14, 0x28u);
  }

  return v4;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_options)
  {
    int v3 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136446466;
      int v14 = "-[WAAnalyticsAccess persistentStoreCoordinator]";
      __int16 v15 = 1024;
      int v16 = 190;
      _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Return no persistentStoreCoordinator for WAAccessReadOnly", (uint8_t *)&v13, 0x12u);
    }
    BOOL v11 = 0;
  }
  else
  {
    int v3 = (id)registry;
    objc_sync_enter(v3);
    persistentStoreCoordinator = self->__persistentStoreCoordinator;
    if (!persistentStoreCoordinator)
    {
      uint64_t v5 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136446466;
        int v14 = "-[WAAnalyticsAccess persistentStoreCoordinator]";
        __int16 v15 = 1024;
        int v16 = 199;
        _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Copying persistenceCoordinator from AnalyticsStoreMOHandler", (uint8_t *)&v13, 0x12u);
      }

      id v6 = +[AnalyticsStoreMOHandler sharedAnalyticsStoreMOHandlerWithPersist];
      uint64_t v7 = [v6 persistenceManager];
      v8 = [v7 persistenceCoordinator];
      v9 = self->__persistentStoreCoordinator;
      self->__persistentStoreCoordinator = v8;

      persistentStoreError = self->_persistentStoreError;
      self->_persistentStoreError = 0;

      persistentStoreCoordinator = self->__persistentStoreCoordinator;
    }
    BOOL v11 = persistentStoreCoordinator;
    objc_sync_exit(v3);
  }

  return v11;
}

- (AnalyticsStoreMOContext)storeMOContext
{
  return self->__storeMOContext;
}

- (AnalyticsStoreMOHandler)moHandler
{
  return self->__moHandler;
}

- (void)setMoHandler:(id)a3
{
}

- (NSError)persistentStoreError
{
  return self->_persistentStoreError;
}

- (void)setPersistentStoreError:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_unint64_t options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStoreError, 0);
  objc_storeStrong((id *)&self->__moHandler, 0);
  objc_storeStrong((id *)&self->__storeMOContext, 0);
  objc_storeStrong((id *)&self->__persistentStoreCoordinator, 0);
}

@end