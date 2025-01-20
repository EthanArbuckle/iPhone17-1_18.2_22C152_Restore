@interface AnalyticsPersistenceManager
+ (BOOL)isStoreCompatibleAtURL:(id)a3 withModel:(id)a4;
+ (id)sharedWAPersistenceCoordinatorWithMOM:(id)a3;
- (AnalyticsPersistenceManager)initWithManagedObjectModel:(id)a3 storeDescriptor:(id)a4;
- (NSManagedObjectModel)managedObjectModel;
- (NSPersistentStoreCoordinator)persistenceCoordinator;
- (NSXPCStoreServer)xpcStoreServer;
- (void)setXpcStoreServer:(id)a3;
@end

@implementation AnalyticsPersistenceManager

+ (id)sharedWAPersistenceCoordinatorWithMOM:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__AnalyticsPersistenceManager_sharedWAPersistenceCoordinatorWithMOM___block_invoke;
  block[3] = &unk_264466048;
  id v9 = v3;
  uint64_t v4 = qword_26AA93D30;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_26AA93D30, block);
  }
  id v6 = (id)_MergedGlobals_7;

  return v6;
}

void __69__AnalyticsPersistenceManager_sharedWAPersistenceCoordinatorWithMOM___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136446466;
    id v6 = "+[AnalyticsPersistenceManager sharedWAPersistenceCoordinatorWithMOM:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 42;
    _os_log_impl(&dword_21D96D000, v2, OS_LOG_TYPE_ERROR, "%{public}s::%d:NSPersistentStoreCoordinator doesn't exist yet for this process, alloc and init instance", (uint8_t *)&v5, 0x12u);
  }

  uint64_t v3 = [objc_alloc(MEMORY[0x263EFF320]) initWithManagedObjectModel:*(void *)(a1 + 32)];
  uint64_t v4 = (void *)_MergedGlobals_7;
  _MergedGlobals_7 = v3;
}

- (AnalyticsPersistenceManager)initWithManagedObjectModel:(id)a3 storeDescriptor:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  v50.receiver = self;
  v50.super_class = (Class)AnalyticsPersistenceManager;
  uint64_t v9 = [(AnalyticsPersistenceManager *)&v50 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_41;
  }
  if (!v7)
  {
    v46 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v56 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]";
      __int16 v57 = 1024;
      int v58 = 57;
      _os_log_impl(&dword_21D96D000, v46, OS_LOG_TYPE_ERROR, "%{public}s::%d:managed object model is nil", buf, 0x12u);
    }

    goto LABEL_41;
  }
  p_managedObjectModel = &v9->_managedObjectModel;
  objc_storeStrong((id *)&v9->_managedObjectModel, a3);
  if ([v8 type]) {
    LODWORD(v48) = 0;
  }
  else {
    unint64_t v48 = ((unint64_t)[v8 analyticsStoreOptions] >> 1) & 1;
  }
  v12 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v12))
  {
    uint64_t v13 = [v8 type];
    *(_DWORD *)buf = 134218240;
    v56 = (const char *)v13;
    __int16 v57 = 1024;
    int v58 = v48;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsPersistenceManager Init", "type %lu migrateOpt %d", buf, 0x12u);
  }

  v14 = [MEMORY[0x263F08850] defaultManager];
  v15 = [v8 storeURL];
  v16 = [v15 path];
  if (([v14 fileExistsAtPath:v16] & 1) == 0)
  {

LABEL_16:
    goto LABEL_17;
  }
  v17 = [v8 storeURL];
  BOOL v18 = +[AnalyticsPersistenceManager isStoreCompatibleAtURL:v17 withModel:*p_managedObjectModel];

  if (!v18)
  {
    v19 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = [v8 storeURL];
      *(_DWORD *)buf = 136446722;
      v56 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]";
      __int16 v57 = 1024;
      int v58 = 68;
      __int16 v59 = 2112;
      v60 = v20;
      _os_log_impl(&dword_21D96D000, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:Store at URL %@ may need migration", buf, 0x1Cu);
    }
    v21 = WALogCategoryDeviceStoreHandle();
    v14 = v21;
    if (v48)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v8 storeURL];
        *(_DWORD *)buf = 136446722;
        v56 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]";
        __int16 v57 = 1024;
        int v58 = 70;
        __int16 v59 = 2112;
        v60 = v22;
        _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attempting to migrate incompatible store at URL %@", buf, 0x1Cu);
      }
      goto LABEL_16;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v56 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]";
      __int16 v57 = 1024;
      int v58 = 69;
      _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Migration not enabled on this process.. bailing!", buf, 0x12u);
    }

LABEL_41:
    LODWORD(v48) = 0;
    goto LABEL_33;
  }
LABEL_17:
  v23 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsPersistenceManager PersistentStoreCoordinatorInit", "", buf, 2u);
  }

  uint64_t v24 = +[AnalyticsPersistenceManager sharedWAPersistenceCoordinatorWithMOM:*p_managedObjectModel];
  persistenceCoordinator = v10->_persistenceCoordinator;
  v10->_persistenceCoordinator = (NSPersistentStoreCoordinator *)v24;

  if (v10->_persistenceCoordinator)
  {
    v26 = (void *)MEMORY[0x223C0F2E0]();
    v27 = v10->_persistenceCoordinator;
    v28 = [v8 storeDescription];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __74__AnalyticsPersistenceManager_initWithManagedObjectModel_storeDescriptor___block_invoke;
    v49[3] = &unk_264467810;
    v49[4] = &v51;
    [(NSPersistentStoreCoordinator *)v27 addPersistentStoreWithDescription:v28 completionHandler:v49];

    LODWORD(v28) = *((unsigned __int8 *)v52 + 24);
    v29 = WALogCategoryDeviceStoreHandle();
    v30 = v29;
    if (v28)
    {
      if (os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21D96D000, v30, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsPersistenceManager PersistentStoreCoordinatorInit", "", buf, 2u);
      }

      if (![v8 type] && (objc_msgSend(v8, "analyticsStoreOptions") & 1) != 0)
      {
        v31 = WALogCategoryDeviceStoreHandle();
        if (os_signpost_enabled(v31))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21D96D000, v31, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsPersistenceManager XPCStoreInit", "", buf, 2u);
        }

        v32 = objc_opt_new();
        v33 = (void *)MEMORY[0x223C0F2E0]();
        id v34 = objc_alloc(MEMORY[0x263EFF358]);
        v35 = [v8 storeURL];
        v36 = [v8 modelURL];
        v37 = [v8 remoteStoreOptions];
        uint64_t v38 = [v34 initForStoreWithURL:v35 usingModelAtURL:v36 options:v37 policy:v32];
        xpcStoreServer = v10->_xpcStoreServer;
        v10->_xpcStoreServer = (NSXPCStoreServer *)v38;

        [(NSXPCStoreServer *)v10->_xpcStoreServer startListening];
        v40 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v41 = v10->_xpcStoreServer;
          *(_DWORD *)buf = 136446722;
          v56 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]";
          __int16 v57 = 1024;
          int v58 = 105;
          __int16 v59 = 2112;
          v60 = v41;
          _os_log_impl(&dword_21D96D000, v40, OS_LOG_TYPE_INFO, "%{public}s::%d:initialized remote server %@", buf, 0x1Cu);
        }

        v42 = WALogCategoryDeviceStoreHandle();
        if (os_signpost_enabled(v42))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21D96D000, v42, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsPersistenceManager XPCStoreInit", "", buf, 2u);
        }
      }
      *((unsigned char *)v52 + 24) = 1;
    }
    else
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v56 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]";
        __int16 v57 = 1024;
        int v58 = 89;
        _os_log_impl(&dword_21D96D000, v30, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to add persistent store", buf, 0x12u);
      }
    }
  }
  else
  {
    v47 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v56 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]";
      __int16 v57 = 1024;
      int v58 = 76;
      _os_log_impl(&dword_21D96D000, v47, OS_LOG_TYPE_ERROR, "%{public}s::%d:_persistenceCoordinator is nil", buf, 0x12u);
    }
  }
LABEL_33:
  if (!*((unsigned char *)v52 + 24))
  {

    v10 = 0;
  }
  v43 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v43))
  {
    uint64_t v44 = [v8 type];
    *(_DWORD *)buf = 134218240;
    v56 = (const char *)v44;
    __int16 v57 = 1024;
    int v58 = v48;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v43, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsPersistenceManager Init", "type %lu migrateOpt %d", buf, 0x12u);
  }

  _Block_object_dispose(&v51, 8);
  return v10;
}

void __74__AnalyticsPersistenceManager_initWithManagedObjectModel_storeDescriptor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = WALogCategoryDeviceStoreHandle();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446978;
      v10 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 82;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:error %@ adding persistent store %@", (uint8_t *)&v9, 0x26u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 136446722;
      v10 = "-[AnalyticsPersistenceManager initWithManagedObjectModel:storeDescriptor:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 84;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_INFO, "%{public}s::%d:added persistent store with description %@", (uint8_t *)&v9, 0x1Cu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

+ (BOOL)isStoreCompatibleAtURL:(id)a3 withModel:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v7 = MEMORY[0x223C0F2E0]();
  id v24 = 0;
  char v8 = [v5 checkResourceIsReachableAndReturnError:&v24];
  id v9 = v24;
  v10 = WALogCategoryDeviceStoreHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      *(_DWORD *)buf = 136446466;
      v30 = "+[AnalyticsPersistenceManager isStoreCompatibleAtURL:withModel:]";
      __int16 v31 = 1024;
      int v32 = 129;
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Getting NSPersistentStoreCoordinator metadataForPersistentStoreOfType", buf, 0x12u);
    }

    uint64_t v12 = *MEMORY[0x263EFF168];
    id v23 = v9;
    __int16 v13 = [MEMORY[0x263EFF320] metadataForPersistentStoreOfType:v12 URL:v5 options:0 error:&v23];
    id v14 = v23;

    if (v14)
    {
      id v16 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v30 = "+[AnalyticsPersistenceManager isStoreCompatibleAtURL:withModel:]";
        __int16 v31 = 1024;
        int v32 = 134;
        __int16 v33 = 2112;
        id v34 = v14;
        v19 = "%{public}s::%d:ERROR NSPersistentStoreCoordinator metadataForPersistentStoreOfType returned error %@";
        v20 = v16;
        uint32_t v21 = 28;
LABEL_20:
        _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
      }
    }
    else
    {
      if (v13)
      {
        char v15 = [v6 isConfiguration:0 compatibleWithStoreMetadata:v13];
        *((unsigned char *)v26 + 24) = v15;
        id v16 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          v30 = "+[AnalyticsPersistenceManager isStoreCompatibleAtURL:withModel:]";
          __int16 v31 = 1024;
          int v32 = 139;
          __int16 v33 = 2112;
          id v34 = v13;
          _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:NSPersistentStoreCoordinator metadataForPersistentStoreOfType metadata is %@", buf, 0x1Cu);
        }
        int v17 = 0;
        goto LABEL_9;
      }
      id v16 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v30 = "+[AnalyticsPersistenceManager isStoreCompatibleAtURL:withModel:]";
        __int16 v31 = 1024;
        int v32 = 135;
        v19 = "%{public}s::%d:ERROR NSPersistentStoreCoordinator metadataForPersistentStoreOfType failed to alloc";
        v20 = v16;
        uint32_t v21 = 18;
        goto LABEL_20;
      }
    }
    int v17 = 4;
LABEL_9:

    id v9 = v14;
    goto LABEL_10;
  }
  if (v11)
  {
    *(_DWORD *)buf = 136446466;
    v30 = "+[AnalyticsPersistenceManager isStoreCompatibleAtURL:withModel:]";
    __int16 v31 = 1024;
    int v32 = 127;
    _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Store does not exist on this device.", buf, 0x12u);
  }

  *((unsigned char *)v26 + 24) = 1;
  int v17 = 4;
LABEL_10:

  if ((v17 | 4) == 4)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __64__AnalyticsPersistenceManager_isStoreCompatibleAtURL_withModel___block_invoke;
    v22[3] = &unk_264465F80;
    v22[4] = &v25;
    +[WAUtil getLazyNSNumberPreference:@"isStoreCompatible" domain:@"com.apple.wifi.analytics" exists:v22];
    LOBYTE(v7) = *((unsigned char *)v26 + 24) != 0;
  }
  _Block_object_dispose(&v25, 8);

  return v7 & 1;
}

void __64__AnalyticsPersistenceManager_isStoreCompatibleAtURL_withModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446978;
    id v6 = "+[AnalyticsPersistenceManager isStoreCompatibleAtURL:withModel:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 149;
    __int16 v9 = 2080;
    v10 = "+[AnalyticsPersistenceManager isStoreCompatibleAtURL:withModel:]_block_invoke";
    __int16 v11 = 1024;
    int v12 = [v3 BOOLValue];
    _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: OVERRIDING isStoreCompatible to %u", (uint8_t *)&v5, 0x22u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 BOOLValue];
}

- (NSPersistentStoreCoordinator)persistenceCoordinator
{
  return self->_persistenceCoordinator;
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (NSXPCStoreServer)xpcStoreServer
{
  return self->_xpcStoreServer;
}

- (void)setXpcStoreServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcStoreServer, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_persistenceCoordinator, 0);
}

@end