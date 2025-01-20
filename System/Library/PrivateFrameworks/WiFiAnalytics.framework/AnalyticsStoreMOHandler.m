@interface AnalyticsStoreMOHandler
+ (BOOL)isStoreCompatible;
+ (id)sharedAnalyticsStoreMOHandlerWithPersist;
- (AnalyticsPersistenceManager)persistenceManager;
- (AnalyticsStoreMOContext)storeMOContext;
- (AnalyticsStoreMOHandler)initWithContext:(id)a3;
- (AnalyticsStoreMOHandler)initWithType:(unint64_t)a3 options:(unint64_t)a4;
- (BOOL)setBssManagedObjectPropertyValueForKeyWithoutSave:(id)a3 forKey:(id)a4 withValue:(id)a5;
- (BOOL)setNetworkManagedObjectPropertyValueForKeyWithoutSave:(id)a3 forKey:(id)a4 withValue:(id)a5;
- (NSManagedObjectContext)managedObjectContext;
- (unint64_t)storeType;
- (void)ageOutManagedObjectsOlderThan:(double)a3;
- (void)contextDidSave:(id)a3;
- (void)dealloc;
- (void)performBlockOnManagedObjectContext:(id)a3 block:(id)a4;
- (void)performBlockOnManagedObjectContextForNSData:(id)a3 withDate:(id)a4 block:(id)a5;
- (void)performPruneBasedOnStoreSizeAndSave;
- (void)pruneManagedObjects;
- (void)pruneTestBSSes:(id)a3;
- (void)saveManagedObjectContext;
- (void)setManagedObjectContext:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setStoreMOContext:(id)a3;
- (void)setStoreType:(unint64_t)a3;
- (void)updateManagedObjectContextWithoutSave;
@end

@implementation AnalyticsStoreMOHandler

- (NSManagedObjectContext)managedObjectContext
{
  managedObjectContext = self->__managedObjectContext;
  if (managedObjectContext)
  {
    v3 = managedObjectContext;
  }
  else
  {
    v5 = [(AnalyticsStoreMOHandler *)self persistenceManager];
    v6 = [v5 persistenceCoordinator];

    if (v6)
    {
      v7 = (NSManagedObjectContext *)[objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:1];
      v8 = [MEMORY[0x263EFF2B0] mergeByPropertyObjectTrumpMergePolicy];
      [(NSManagedObjectContext *)v7 setMergePolicy:v8];

      [(NSManagedObjectContext *)v7 setPersistentStoreCoordinator:v6];
      v9 = [MEMORY[0x263F08AB0] processInfo];
      v10 = [v9 processName];
      [(NSManagedObjectContext *)v7 setTransactionAuthor:v10];

      v11 = self->__managedObjectContext;
      self->__managedObjectContext = v7;
    }
    v3 = self->__managedObjectContext;
  }
  return v3;
}

+ (id)sharedAnalyticsStoreMOHandlerWithPersist
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (+[WAUtil isAnalyticsProcessorAllowed])
  {
    if (qword_26AA93CE0 != -1) {
      dispatch_once(&qword_26AA93CE0, &__block_literal_global_2);
    }
    v2 = (void *)_MergedGlobals_2;
    if (!_MergedGlobals_2)
    {
      v3 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446466;
        v8 = "+[AnalyticsStoreMOHandler sharedAnalyticsStoreMOHandlerWithPersist]";
        __int16 v9 = 1024;
        int v10 = 55;
        _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:AnalyticsStoreMOHandler failed initWithType -- Store unavailable to this process until reboot", (uint8_t *)&v7, 0x12u);
      }

      v2 = (void *)_MergedGlobals_2;
    }
    id v4 = v2;
  }
  else
  {
    v6 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446466;
      v8 = "+[AnalyticsStoreMOHandler sharedAnalyticsStoreMOHandlerWithPersist]";
      __int16 v9 = 1024;
      int v10 = 45;
      _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Writing in the WiFi Analytics Store is disabled on this platform", (uint8_t *)&v7, 0x12u);
    }

    id v4 = 0;
  }
  return v4;
}

uint64_t __67__AnalyticsStoreMOHandler_sharedAnalyticsStoreMOHandlerWithPersist__block_invoke()
{
  _MergedGlobals_2 = [[AnalyticsStoreMOHandler alloc] initWithType:1 options:0];
  return MEMORY[0x270F9A758]();
}

+ (BOOL)isStoreCompatible
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = +[AnalyticsStoreDescriptor defaultPersistentStoreURL];
  v3 = +[AnalyticsStoreDescriptor defaultModelURL];
  id v4 = +[AnalyticsStoreMOContext sharedManagedObjectModel:v3];
  BOOL v5 = +[AnalyticsPersistenceManager isStoreCompatibleAtURL:v2 withModel:v4];

  v6 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446722;
    __int16 v9 = "+[AnalyticsStoreMOHandler isStoreCompatible]";
    __int16 v10 = 1024;
    int v11 = 69;
    __int16 v12 = 1024;
    BOOL v13 = v5;
    _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AnalyticsStoreMOHandler isStoreCompatibleAtURL is %d", (uint8_t *)&v8, 0x18u);
  }

  return v5;
}

- (AnalyticsStoreMOHandler)initWithType:(unint64_t)a3 options:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)AnalyticsStoreMOHandler;
  v6 = [(AnalyticsStoreMOHandler *)&v20 init];
  if (!v6)
  {
    v16 = 0;
    int v8 = 0;
    BOOL v13 = 0;
    goto LABEL_11;
  }
  if (MEMORY[0x263F55A28] && !MKBUserUnlockedSinceBoot())
  {
    int v8 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136446466;
    v22 = "-[AnalyticsStoreMOHandler initWithType:options:]";
    __int16 v23 = 1024;
    int v24 = 82;
    __int16 v9 = "%{public}s::%d:Device has not been unlocked since boot";
LABEL_20:
    __int16 v10 = v8;
    uint32_t v11 = 18;
    goto LABEL_21;
  }
  if (a3 == 1)
  {
    uint64_t v7 = v4 & 3;
    int v8 = +[AnalyticsStoreDescriptor serverStoreDescriptor:v7];
    if (!v8)
    {
      int v8 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v22 = "-[AnalyticsStoreMOHandler initWithType:options:]";
        __int16 v23 = 1024;
        int v24 = 94;
        __int16 v25 = 2048;
        uint64_t v26 = v7;
        __int16 v9 = "%{public}s::%d:Error creating server store descriptor with options: %lu";
        __int16 v10 = v8;
        uint32_t v11 = 28;
LABEL_21:
        _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
      }
LABEL_22:

      int v8 = 0;
      BOOL v13 = 0;
      v16 = v6;
      v6 = 0;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  int v8 = +[AnalyticsStoreDescriptor directStoreDescriptor];
  if (!v8)
  {
    int v8 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136446466;
    v22 = "-[AnalyticsStoreMOHandler initWithType:options:]";
    __int16 v23 = 1024;
    int v24 = 97;
    __int16 v9 = "%{public}s::%d:Error creating direct store descriptor";
    goto LABEL_20;
  }
LABEL_9:
  v6->_storeType = a3;
  __int16 v12 = [[AnalyticsStoreMOContext alloc] initWithStoreDescriptor:v8];
  if (!v12)
  {
    v19 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v22 = "-[AnalyticsStoreMOHandler initWithType:options:]";
      __int16 v23 = 1024;
      int v24 = 103;
      _os_log_impl(&dword_21D96D000, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating store controller", buf, 0x12u);
    }

    goto LABEL_22;
  }
  BOOL v13 = v12;
  objc_storeStrong((id *)&v6->_storeMOContext, v12);
  uint64_t v14 = [(AnalyticsStoreMOContext *)v6->_storeMOContext persistenceManager];
  persistenceManager = v6->_persistenceManager;
  v6->_persistenceManager = (AnalyticsPersistenceManager *)v14;

  v16 = [MEMORY[0x263F08A00] defaultCenter];
  [v16 addObserver:v6 selector:sel_contextDidSave_ name:*MEMORY[0x263EFF040] object:0];
LABEL_11:

  v17 = v6;
  return v17;
}

- (AnalyticsStoreMOHandler)initWithContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AnalyticsStoreMOHandler;
  v6 = [(AnalyticsStoreMOHandler *)&v15 init];
  if (!v6) {
    goto LABEL_13;
  }
  if (MEMORY[0x263F55A28] && !MKBUserUnlockedSinceBoot())
  {
    __int16 v12 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[AnalyticsStoreMOHandler initWithContext:]";
      __int16 v18 = 1024;
      int v19 = 128;
      BOOL v13 = "%{public}s::%d:Device has not been unlocked since boot";
      goto LABEL_11;
    }
LABEL_12:

LABEL_13:
    persistenceManager = v6->_persistenceManager;
    v6->_persistenceManager = 0;

    __int16 v10 = v6;
    v6 = 0;
    goto LABEL_6;
  }
  if (!v5)
  {
    __int16 v12 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[AnalyticsStoreMOHandler initWithContext:]";
      __int16 v18 = 1024;
      int v19 = 130;
      BOOL v13 = "%{public}s::%d:Error given store controller";
LABEL_11:
      _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x12u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v6->_storeMOContext, a3);
  uint64_t v7 = [(AnalyticsStoreMOContext *)v6->_storeMOContext persistenceManager];
  int v8 = v6->_persistenceManager;
  v6->_persistenceManager = (AnalyticsPersistenceManager *)v7;

  __int16 v9 = [(AnalyticsStoreMOContext *)v6->_storeMOContext storeDescriptor];
  v6->_storeType = [v9 type];

  __int16 v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:v6 selector:sel_contextDidSave_ name:*MEMORY[0x263EFF040] object:0];
LABEL_6:

  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AnalyticsStoreMOHandler;
  [(AnalyticsStoreMOHandler *)&v4 dealloc];
}

- (void)performBlockOnManagedObjectContext:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler performBlock", "", buf, 2u);
  }

  __int16 v9 = [(AnalyticsStoreMOHandler *)self managedObjectContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__AnalyticsStoreMOHandler_performBlockOnManagedObjectContext_block___block_invoke;
  v13[3] = &unk_2644670E0;
  id v14 = v6;
  id v15 = v7;
  id v10 = v6;
  id v11 = v7;
  [v9 performBlockAndWait:v13];

  __int16 v12 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler performBlock", "", buf, 2u);
  }
}

uint64_t __68__AnalyticsStoreMOHandler_performBlockOnManagedObjectContext_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)performBlockOnManagedObjectContextForNSData:(id)a3 withDate:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler performBlockNSData", "", buf, 2u);
  }

  __int16 v12 = [(AnalyticsStoreMOHandler *)self managedObjectContext];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __86__AnalyticsStoreMOHandler_performBlockOnManagedObjectContextForNSData_withDate_block___block_invoke;
  v17[3] = &unk_264467108;
  id v19 = v9;
  id v20 = v10;
  id v18 = v8;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  [v12 performBlockAndWait:v17];

  v16 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler performBlockNSData", "", buf, 2u);
  }
}

uint64_t __86__AnalyticsStoreMOHandler_performBlockOnManagedObjectContextForNSData_withDate_block___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)saveManagedObjectContext
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler saveManagedObjectContext", "", buf, 2u);
  }

  objc_super v4 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v12 = "-[AnalyticsStoreMOHandler saveManagedObjectContext]";
    __int16 v13 = 1024;
    int v14 = 196;
    _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Attempting Save MOC with save", buf, 0x12u);
  }

  id v5 = [(AnalyticsStoreMOHandler *)self managedObjectContext];
  char v6 = [v5 hasChanges];

  if (v6)
  {
    id v7 = [(AnalyticsStoreMOHandler *)self managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__AnalyticsStoreMOHandler_saveManagedObjectContext__block_invoke;
    v10[3] = &unk_264466048;
    v10[4] = self;
    [v7 performBlockAndWait:v10];
  }
  else
  {
    id v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v12 = "-[AnalyticsStoreMOHandler saveManagedObjectContext]";
      __int16 v13 = 1024;
      int v14 = 198;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:No changes to be saved", buf, 0x12u);
    }
  }
  id v8 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler saveManagedObjectContext", "", buf, 2u);
  }
}

void __51__AnalyticsStoreMOHandler_saveManagedObjectContext__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler save", "", buf, 2u);
  }

  v3 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v14 = "-[AnalyticsStoreMOHandler saveManagedObjectContext]_block_invoke";
    __int16 v15 = 1024;
    int v16 = 206;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Save MOC, calling save", buf, 0x12u);
  }

  objc_super v4 = [*(id *)(a1 + 32) managedObjectContext];
  id v12 = 0;
  int v5 = [v4 save:&v12];
  id v6 = v12;

  id v7 = WALogCategoryDeviceStoreHandle();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v14 = "-[AnalyticsStoreMOHandler saveManagedObjectContext]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 212;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Saved context", buf, 0x12u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v9 = [v6 localizedDescription];
    id v10 = [v6 userInfo];
    *(_DWORD *)buf = 136446978;
    int v14 = "-[AnalyticsStoreMOHandler saveManagedObjectContext]_block_invoke";
    __int16 v15 = 1024;
    int v16 = 210;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error saving context: %@ %@", buf, 0x26u);
  }
  id v11 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v14) = v5;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler save", "success:%d", buf, 8u);
  }
}

- (void)updateManagedObjectContextWithoutSave
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler updateManagedObjectContextWithoutSave", "", buf, 2u);
  }

  objc_super v4 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    id v9 = "-[AnalyticsStoreMOHandler updateManagedObjectContextWithoutSave]";
    __int16 v10 = 1024;
    int v11 = 245;
    _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Attempting Update MOC without save", buf, 0x12u);
  }

  int v5 = [(AnalyticsStoreMOHandler *)self managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__AnalyticsStoreMOHandler_updateManagedObjectContextWithoutSave__block_invoke;
  v7[3] = &unk_264466048;
  v7[4] = self;
  [v5 performBlockAndWait:v7];

  id v6 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler updateManagedObjectContextWithoutSave", "", buf, 2u);
  }
}

void __64__AnalyticsStoreMOHandler_updateManagedObjectContextWithoutSave__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    int v5 = "-[AnalyticsStoreMOHandler updateManagedObjectContextWithoutSave]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 249;
    _os_log_impl(&dword_21D96D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Update MOC without save, calling processPendingChanges", (uint8_t *)&v4, 0x12u);
  }

  v3 = [*(id *)(a1 + 32) managedObjectContext];
  [v3 processPendingChanges];
}

- (void)contextDidSave:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136446466;
    int v5 = "-[AnalyticsStoreMOHandler contextDidSave:]";
    __int16 v6 = 1024;
    int v7 = 261;
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Notification contextDidSave NSManagedObjectContextDidSaveNotification", (uint8_t *)&v4, 0x12u);
  }
}

- (void)performPruneBasedOnStoreSizeAndSave
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v3))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler performPruneBasedOnStoreSizeAndSave", "", (uint8_t *)&v8, 2u);
  }

  int v4 = [(AnalyticsStoreMOHandler *)self storeMOContext];
  int v5 = [v4 storeNeedsImmediatePruning:104857600];

  if (v5)
  {
    __int16 v6 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136446466;
      id v9 = "-[AnalyticsStoreMOHandler performPruneBasedOnStoreSizeAndSave]";
      __int16 v10 = 1024;
      int v11 = 269;
      _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:storeNeedsImmediatePruning returned true, calling pruneManagedObjects", (uint8_t *)&v8, 0x12u);
    }

    [(AnalyticsStoreMOHandler *)self pruneManagedObjects];
  }
  [(AnalyticsStoreMOHandler *)self saveManagedObjectContext];
  int v7 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler performPruneBasedOnStoreSizeAndSave", "", (uint8_t *)&v8, 2u);
  }
}

- (void)pruneManagedObjects
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v3 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler pruneManagedObjects", "", buf, 2u);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  unint64_t v4 = 0x264465000uLL;
  id obj = +[AnalyticsStoreProxy analyticsStoreEntityNames];
  uint64_t v5 = [obj countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v34;
    *(void *)&long long v6 = 136446978;
    long long v30 = v6;
    uint64_t v31 = *(void *)v34;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * v9);
        int v11 = objc_msgSend(*(id *)(v4 + 2520), "analyticsStoreEntitiesWithDate", v30);
        int v12 = [v11 containsObject:v10];

        if (v12)
        {
          __int16 v13 = *(void **)(v4 + 2520);
          int v14 = [(AnalyticsStoreMOHandler *)self managedObjectContext];
          unint64_t v15 = [v13 entityCount:v10 withPredicate:0 moc:v14];

          if (v15)
          {
            int v16 = WALogCategoryDeviceStoreHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v30;
              v39 = "-[AnalyticsStoreMOHandler pruneManagedObjects]";
              __int16 v40 = 1024;
              int v41 = 288;
              __int16 v42 = 2112;
              uint64_t v43 = v10;
              __int16 v44 = 2048;
              unint64_t v45 = v15;
              _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Total objects for %@:%lu", buf, 0x26u);
            }

            unint64_t v17 = v15 >> 1;
            id v18 = (void *)[objc_alloc(MEMORY[0x263EFF260]) initWithEntityName:v10];
            __int16 v19 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:1];
            v37 = v19;
            id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
            [v18 setSortDescriptors:v20];

            [v18 setFetchLimit:v17];
            uint64_t v21 = *(void **)(v4 + 2520);
            v22 = [(AnalyticsStoreMOHandler *)self managedObjectContext];
            [v21 batchDelete:v10 withPredicate:0 withFetchRequest:v18 moc:v22];

            unint64_t v23 = v4;
            int v24 = *(void **)(v4 + 2520);
            __int16 v25 = self;
            uint64_t v26 = [(AnalyticsStoreMOHandler *)self managedObjectContext];
            uint64_t v27 = [v24 entityCount:v10 withPredicate:0 moc:v26];

            v28 = WALogCategoryDeviceStoreHandle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v30;
              v39 = "-[AnalyticsStoreMOHandler pruneManagedObjects]";
              __int16 v40 = 1024;
              int v41 = 298;
              __int16 v42 = 2112;
              uint64_t v43 = v10;
              __int16 v44 = 2048;
              unint64_t v45 = v27;
              _os_log_impl(&dword_21D96D000, v28, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Total objects for %@:%lu", buf, 0x26u);
            }

            self = v25;
            unint64_t v4 = v23;
            uint64_t v8 = v31;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v7);
  }

  v29 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler pruneManagedObjects", "", buf, 2u);
  }
}

- (void)pruneTestBSSes:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[BSSMO entityName];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF.bssid == %@", *(void *)(*((void *)&v19 + 1) + 8 * i)];
        int v11 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = [v10 description];
          *(_DWORD *)buf = 136446978;
          int v24 = "-[AnalyticsStoreMOHandler pruneTestBSSes:]";
          __int16 v25 = 1024;
          int v26 = 310;
          __int16 v27 = 2112;
          v28 = v5;
          __int16 v29 = 2112;
          long long v30 = v12;
          _os_log_impl(&dword_21D96D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Deleting all %@ where %@", buf, 0x26u);
        }
        __int16 v13 = [(AnalyticsStoreMOHandler *)self managedObjectContext];
        +[AnalyticsStoreProxy batchDelete:v5 withPredicate:v10 withFetchRequest:0 moc:v13];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v31 count:16];
    }
    while (v7);
  }

  int v14 = +[NetworkMO entityName];

  unint64_t v15 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v24 = "-[AnalyticsStoreMOHandler pruneTestBSSes:]";
    __int16 v25 = 1024;
    int v26 = 315;
    __int16 v27 = 2112;
    v28 = v14;
    _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Deleting all %@ with no BSSes", buf, 0x1Cu);
  }

  int v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"numBSS == 0"];
  unint64_t v17 = [(AnalyticsStoreMOHandler *)self managedObjectContext];
  +[AnalyticsStoreProxy batchDelete:v14 withPredicate:v16 withFetchRequest:0 moc:v17];
}

- (void)ageOutManagedObjectsOlderThan:(double)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v5 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler ageOutManagedObjectsOlderThan", "", buf, 2u);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v6 = +[AnalyticsStoreProxy analyticsStoreEntityNames];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v31;
    *(void *)&long long v8 = 136446722;
    long long v29 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
        __int16 v13 = +[BSSMO entityName];
        int v14 = [v12 isEqual:v13];

        if (v14)
        {
          unint64_t v15 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446978;
            long long v35 = "-[AnalyticsStoreMOHandler ageOutManagedObjectsOlderThan:]";
            __int16 v36 = 1024;
            int v37 = 325;
            __int16 v38 = 2112;
            v39 = v12;
            __int16 v40 = 2048;
            uint64_t v41 = (uint64_t)(a3 / 86400.0);
            _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Deleting all %@ older than %ld days", buf, 0x26u);
          }

          int v16 = v12;
          unint64_t v17 = @"lastSeen";
          goto LABEL_12;
        }
        long long v19 = +[NetworkMO entityName];
        int v20 = [v12 isEqual:v19];

        if (v20)
        {
          long long v21 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v29;
            long long v35 = "-[AnalyticsStoreMOHandler ageOutManagedObjectsOlderThan:]";
            __int16 v36 = 1024;
            int v37 = 330;
            __int16 v38 = 2112;
            v39 = v12;
            _os_log_impl(&dword_21D96D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Deleting all %@ with no BSSes", buf, 0x1Cu);
          }

          uint64_t v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"numBSS == 0"];
          goto LABEL_17;
        }
        int v24 = +[AnalyticsStoreProxy analyticsStoreEntitiesWithDate];
        int v25 = [v24 containsObject:v12];

        if (v25)
        {
          int v26 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446978;
            long long v35 = "-[AnalyticsStoreMOHandler ageOutManagedObjectsOlderThan:]";
            __int16 v36 = 1024;
            int v37 = 334;
            __int16 v38 = 2112;
            v39 = v12;
            __int16 v40 = 2048;
            uint64_t v41 = (uint64_t)(a3 / 86400.0);
            _os_log_impl(&dword_21D96D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Deleting all %@ older than:%ld days", buf, 0x26u);
          }

          int v16 = v12;
          unint64_t v17 = @"date";
LABEL_12:
          uint64_t v18 = +[AnalyticsStoreProxy predicateForEntityWithAgeOlderThan:v16 dateAttribute:v17 olderThan:a3];
LABEL_17:
          long long v22 = (void *)v18;
          unint64_t v23 = [(AnalyticsStoreMOHandler *)self managedObjectContext];
          +[AnalyticsStoreProxy batchDelete:v12 withPredicate:v22 withFetchRequest:0 moc:v23];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v27 = [v6 countByEnumeratingWithState:&v30 objects:v42 count:16];
      uint64_t v9 = v27;
    }
    while (v27);
  }

  v28 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v28, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreMOHandler ageOutManagedObjectsOlderThan", "", buf, 2u);
  }
}

- (BOOL)setBssManagedObjectPropertyValueForKeyWithoutSave:(id)a3 forKey:(id)a4 withValue:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x223C0F2E0]();
  BOOL v12 = +[BSSMO setBssManagedObjectPropertyValueForKey:v8 forKey:v9 withValue:v10];
  if (v12)
  {
    [(AnalyticsStoreMOHandler *)self updateManagedObjectContextWithoutSave];
    __int16 v13 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v14 = [v8 bssid];
      unint64_t v15 = [v8 network];
      int v16 = [v15 ssid];
      int v18 = 136447490;
      long long v19 = "-[AnalyticsStoreMOHandler setBssManagedObjectPropertyValueForKeyWithoutSave:forKey:withValue:]";
      __int16 v20 = 1024;
      int v21 = 353;
      __int16 v22 = 2112;
      id v23 = v9;
      __int16 v24 = 2112;
      int v25 = v14;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Updated BSSMO unparsedBeacon property for key:%@ for bssid:%@ ssid:%@ value:%@", (uint8_t *)&v18, 0x3Au);
    }
  }
  else
  {
    __int16 v13 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446466;
      long long v19 = "-[AnalyticsStoreMOHandler setBssManagedObjectPropertyValueForKeyWithoutSave:forKey:withValue:]";
      __int16 v20 = 1024;
      int v21 = 349;
      _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed", (uint8_t *)&v18, 0x12u);
    }
  }

  return v12;
}

- (BOOL)setNetworkManagedObjectPropertyValueForKeyWithoutSave:(id)a3 forKey:(id)a4 withValue:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x223C0F2E0]();
  BOOL v12 = +[NetworkMO setNetworkManagedObjectPropertyValueForKey:v8 forKey:v9 withValue:v10];
  if (v12)
  {
    [(AnalyticsStoreMOHandler *)self updateManagedObjectContextWithoutSave];
    __int16 v13 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v14 = [v8 ssid];
      int v16 = 136447234;
      unint64_t v17 = "-[AnalyticsStoreMOHandler setNetworkManagedObjectPropertyValueForKeyWithoutSave:forKey:withValue:]";
      __int16 v18 = 1024;
      int v19 = 367;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v14;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Updated NetworkMO channels property for key:%@ ssid:%@ value:%@", (uint8_t *)&v16, 0x30u);
    }
  }
  else
  {
    __int16 v13 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446466;
      unint64_t v17 = "-[AnalyticsStoreMOHandler setNetworkManagedObjectPropertyValueForKeyWithoutSave:forKey:withValue:]";
      __int16 v18 = 1024;
      int v19 = 363;
      _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed", (uint8_t *)&v16, 0x12u);
    }
  }

  return v12;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (AnalyticsPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (AnalyticsStoreMOContext)storeMOContext
{
  return self->_storeMOContext;
}

- (void)setStoreMOContext:(id)a3
{
}

- (unint64_t)storeType
{
  return self->_storeType;
}

- (void)setStoreType:(unint64_t)a3
{
  self->_storeType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeMOContext, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->__managedObjectContext, 0);
}

@end