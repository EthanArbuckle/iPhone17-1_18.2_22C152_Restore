@interface RTPersistenceStore
+ (id)storeBaseName:(id)a3;
- (BOOL)addToCoordinator:(id)a3 lightweightMigration:(BOOL)a4 vacuum:(BOOL)a5 allowMirroring:(BOOL)a6 error:(id *)a7;
- (BOOL)destroyWithCoordinator:(id)a3 error:(id *)a4;
- (BOOL)error:(id *)a3 code:(unint64_t)a4;
- (BOOL)error:(id *)a3 inError:(id)a4;
- (BOOL)openWithCoordinator:(id)a3 configuration:(id)a4 error:(id *)a5;
- (BOOL)performVacuumWithCoordinator:(id)a3 error:(id *)a4;
- (BOOL)rekeyWithCoordinator:(id)a3 keyData:(id)a4 error:(id *)a5;
- (BOOL)removeFromCoordinator:(id)a3 error:(id *)a4;
- (BOOL)removeStoreAtURL:(id)a3 error:(id *)a4;
- (BOOL)updateMetadata:(id)a3 context:(id)a4 coordinator:(id)a5 error:(id *)a6;
- (BOOL)updateMetadata:(id)a3 coordinator:(id)a4 error:(id *)a5;
- (NSCloudKitMirroringDelegate)mirroringDelegate;
- (NSCloudKitMirroringDelegateOptions)mirroringDelegateOptions;
- (NSMutableDictionary)userInfo;
- (NSPersistentStoreDescription)storeDescription;
- (NSURL)URL;
- (RTPersistenceMigrator)migrator;
- (RTPersistenceStore)init;
- (RTPersistenceStore)initWithStoreDescription:(id)a3;
- (id)_normalizeError:(id)a3 storeDescription:(id)a4;
- (id)_validateKeys:(id)a3;
- (id)cachedModelWithError:(id *)a3;
- (id)retrieveMetadataWithCoordinator:(id)a3 error:(id *)a4;
- (id)storeBaseName;
- (id)storeName;
- (id)storeURLsMatchingStoreName;
- (id)storeURLsMatchingStoreNameAtURL:(id)a3;
- (int64_t)mirroringDelegateState;
- (unint64_t)state;
- (void)dealloc;
- (void)onMirroringDelegateInitialization:(id)a3;
- (void)setMigrator:(id)a3;
- (void)setMirroringDelegate:(id)a3;
- (void)setMirroringDelegateOptions:(id)a3;
- (void)setMirroringDelegateState:(int64_t)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation RTPersistenceStore

- (RTPersistenceStore)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithStoreDescription_);
}

- (RTPersistenceStore)initWithStoreDescription:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 shouldAddStoreAsynchronously])
    {
      v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[RTPersistenceStore initWithStoreDescription:]";
        __int16 v20 = 1024;
        int v21 = 53;
        _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !storeDescription.shouldAddStoreAsynchronously (in %s:%d)", buf, 0x12u);
      }
    }
    if ([v5 shouldMigrateStoreAutomatically])
    {
      v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[RTPersistenceStore initWithStoreDescription:]";
        __int16 v20 = 1024;
        int v21 = 54;
        _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !storeDescription.shouldMigrateStoreAutomatically (in %s:%d)", buf, 0x12u);
      }
    }
    if ([v5 shouldInferMappingModelAutomatically])
    {
      v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[RTPersistenceStore initWithStoreDescription:]";
        __int16 v20 = 1024;
        int v21 = 55;
        _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !storeDescription.shouldInferMappingModelAutomatically (in %s:%d)", buf, 0x12u);
      }
    }
    v17.receiver = self;
    v17.super_class = (Class)RTPersistenceStore;
    v9 = [(RTPersistenceStore *)&v17 init];
    if (v9)
    {
      uint64_t v10 = [v5 copy];
      storeDescription = v9->_storeDescription;
      v9->_storeDescription = (NSPersistentStoreDescription *)v10;

      [(NSPersistentStoreDescription *)v9->_storeDescription setShouldAddStoreAsynchronously:0];
      [(NSPersistentStoreDescription *)v9->_storeDescription setShouldMigrateStoreAutomatically:0];
      [(NSPersistentStoreDescription *)v9->_storeDescription setShouldInferMappingModelAutomatically:0];
      v9->_state = 0;
      uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
      userInfo = v9->_userInfo;
      v9->_userInfo = (NSMutableDictionary *)v12;

      v9->_mirroringDelegateState = 0;
    }
    self = v9;
    v14 = self;
  }
  else
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: storeDescription", buf, 2u);
    }

    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RTPersistenceStore;
  [(RTPersistenceStore *)&v4 dealloc];
}

- (NSURL)URL
{
  return [(NSPersistentStoreDescription *)self->_storeDescription URL];
}

- (id)storeName
{
  uint64_t v2 = [(NSPersistentStoreDescription *)self->_storeDescription URL];
  v3 = [v2 lastPathComponent];

  return v3;
}

- (BOOL)error:(id *)a3 code:(unint64_t)a4
{
  if (a3)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:a4 userInfo:0];
  }
  return 0;
}

- (BOOL)error:(id *)a3 inError:(id)a4
{
  if (a3 && a4) {
    *a3 = a4;
  }
  return a4 == 0;
}

- (id)_normalizeError:(id)a3 storeDescription:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 domain];
  uint64_t v8 = *MEMORY[0x1E4F1BF50];
  int v9 = [v7 isEqualToString:*MEMORY[0x1E4F1BF50]];

  if (v9)
  {
    uint64_t v10 = [NSNumber numberWithInteger:[v5 code]];
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = [v5 userInfo];
    uint64_t v10 = [v12 objectForKeyedSubscript:v8];

    if (v10)
    {
LABEL_3:
      int v11 = [v10 intValue];
      if (v11 != 11)
      {
        if (v11 != 23)
        {
          if (v11 == 26) {
            goto LABEL_16;
          }
          goto LABEL_13;
        }
LABEL_17:
        v28 = NSString;
        v29 = [v6 URL];
        v30 = [v29 path];
        v19 = [v28 stringWithFormat:@"Unable to add persistent store, %@, reason, unavailable", v30];

        uint64_t v20 = 1;
        goto LABEL_18;
      }
LABEL_16:
      v25 = NSString;
      v26 = [v6 URL];
      v27 = [v26 path];
      v19 = [v25 stringWithFormat:@"Unable to add persistent store, %@, reason, corrupt", v27];

      uint64_t v20 = 3;
      goto LABEL_18;
    }
  }
  v13 = [v5 domain];
  int v14 = [v13 isEqualToString:*MEMORY[0x1E4F281F8]];

  if (v14)
  {
    uint64_t v15 = [v5 code];
    switch(v15)
    {
      case 259:
        goto LABEL_16;
      case 134090:
        goto LABEL_17;
      case 134100:
        v16 = NSString;
        objc_super v17 = [v6 URL];
        v18 = [v17 path];
        v19 = [v16 stringWithFormat:@"Unable to add persistent store, %@, reason, incompatible", v18];

        uint64_t v20 = 2;
        goto LABEL_18;
    }
  }
LABEL_13:
  int v21 = NSString;
  uint64_t v22 = [v6 URL];
  v23 = [v22 path];
  v19 = [v21 stringWithFormat:@"Unable to add persistent store, %@, error, %@", v23, v5];

  v24 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v19;
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  uint64_t v20 = 0;
LABEL_18:
  v31 = objc_opt_new();
  [v31 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  [v31 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  v32 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:v20 userInfo:v31];

  return v32;
}

- (BOOL)openWithCoordinator:(id)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 name];
  [(NSPersistentStoreDescription *)self->_storeDescription setConfiguration:v10];

  uint64_t v11 = [v9 isReadOnly];
  [(NSPersistentStoreDescription *)self->_storeDescription setReadOnly:v11];
  unint64_t state = self->_state;
  if (state > 2)
  {
LABEL_11:
    if (state == 4)
    {
LABEL_12:
      uint64_t v15 = self;
      v16 = a5;
      uint64_t v17 = 0;
LABEL_13:
      BOOL v18 = [(RTPersistenceStore *)v15 error:v16 code:v17];
      goto LABEL_31;
    }
LABEL_14:
    id v28 = 0;
    BOOL v19 = [(RTPersistenceStore *)self addToCoordinator:v8 lightweightMigration:0 vacuum:0 allowMirroring:1 error:&v28];
    id v20 = v28;
    int v21 = v20;
    BOOL v18 = v20 == 0;
    if (!v19 || v20)
    {
      uint64_t v23 = [v20 code];
      if ((unint64_t)(v23 - 2) >= 2 && v23)
      {
        if (v23 != 1)
        {
LABEL_28:
          if (a5) {
            *a5 = v21;
          }

          goto LABEL_31;
        }
        p_super = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
        {
          v24 = [(RTPersistenceStore *)self storeName];
          *(_DWORD *)buf = 138412290;
          v30 = v24;
          _os_log_impl(&dword_1D9BFA000, p_super, OS_LOG_TYPE_INFO, "store, %@, is currently unavailable", buf, 0xCu);
        }
      }
      else
      {
        v25 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = [(RTPersistenceStore *)self storeName];
          *(_DWORD *)buf = 138412290;
          v30 = v26;
          _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "store, %@, couldn't be opened", buf, 0xCu);
        }
        p_super = [(RTPersistenceMigrator *)self->_migrator delegate];
        if (objc_opt_respondsToSelector()) {
          [p_super persistenceStore:self failedWithError:v21];
        }
        self->_unint64_t state = 4;
      }
    }
    else
    {
      self->_unint64_t state = 5;
      p_super = &self->_migrator->super;
      self->_migrator = 0;
    }

    goto LABEL_28;
  }
  self->_unint64_t state = 1;
  if (!self->_migrator)
  {
LABEL_7:
    self->_unint64_t state = 4;
    goto LABEL_12;
  }
  v13 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = [(RTPersistenceStore *)self storeName];
    *(_DWORD *)buf = 138412290;
    v30 = v14;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "store, %@, running migrator", buf, 0xCu);
  }
  switch([(RTPersistenceMigrator *)self->_migrator run])
  {
    case 0uLL:
      uint64_t v15 = self;
      v16 = a5;
      uint64_t v17 = 1;
      goto LABEL_13;
    case 1uLL:
      BOOL v18 = 0;
      self->_unint64_t state = 2;
      break;
    case 2uLL:
      self->_unint64_t state = 3;
      goto LABEL_14;
    case 3uLL:
      goto LABEL_7;
    default:
      unint64_t state = self->_state;
      goto LABEL_11;
  }
LABEL_31:

  return v18;
}

- (BOOL)addToCoordinator:(id)a3 lightweightMigration:(BOOL)a4 vacuum:(BOOL)a5 allowMirroring:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  int v14 = [(RTPersistenceStore *)self storeDescription];
  int v15 = [v14 shouldAddStoreAsynchronously];

  if (v15)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTPersistenceStore addToCoordinator:lightweightMigration:vacuum:allowMirroring:error:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 289;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Expected shouldAddStoreAsynchronously to be NO (in %s:%d)", buf, 0x12u);
    }
  }
  uint64_t v17 = [(RTPersistenceStore *)self storeDescription];
  int v18 = [v17 shouldAddStoreAsynchronously];

  if (v18)
  {
    BOOL v19 = [(RTPersistenceStore *)self storeDescription];
    [v19 setShouldAddStoreAsynchronously:0];
  }
  id v20 = [(RTPersistenceStore *)self storeDescription];
  int v21 = (void *)[v20 copy];

  [v21 setShouldMigrateStoreAutomatically:v10];
  [v21 setShouldInferMappingModelAutomatically:v10];
  [v21 setValue:&unk_1F3451C20 forPragmaNamed:@"cache_spill"];
  if (v8)
  {
    uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "allowing mirroring", buf, 2u);
    }

    if (self->_mirroringDelegateOptions)
    {
      uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "mirroring options are set", buf, 2u);
      }

      v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v24 addObserver:self selector:sel_onMirroringDelegateInitialization_ name:@"NSPersistentCloudKitContainerEventChangedNotification" object:0];

      mirroringDelegate = self->_mirroringDelegate;
      if (!mirroringDelegate)
      {
        v26 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "creating a new mirroring delegate", buf, 2u);
        }

        v27 = (NSCloudKitMirroringDelegate *)[objc_alloc(MEMORY[0x1E4F1C050]) initWithOptions:self->_mirroringDelegateOptions];
        id v28 = self->_mirroringDelegate;
        self->_mirroringDelegate = v27;

        mirroringDelegate = self->_mirroringDelegate;
      }
      [v21 setOption:mirroringDelegate forMirroringKey:*MEMORY[0x1E4F1BED0]];
    }
  }
  if (v9) {
    [v21 setOption:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1BF58]];
  }
  v29 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v21;
    _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "add persistent store with description, %@", buf, 0xCu);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v45 = __Block_byref_object_copy__111;
  v46 = __Block_byref_object_dispose__111;
  id v47 = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __88__RTPersistenceStore_addToCoordinator_lightweightMigration_vacuum_allowMirroring_error___block_invoke;
  v39[3] = &unk_1E6B99E90;
  v39[4] = buf;
  [v13 addPersistentStoreWithDescription:v21 completionHandler:v39];
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    v30 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v35 = NSStringFromSelector(a2);
      uint64_t v36 = *(void **)(*(void *)&buf[8] + 40);
      *(_DWORD *)v40 = 138412546;
      id v41 = v35;
      __int16 v42 = 2112;
      v43 = v36;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "%@ failed, error, %@", v40, 0x16u);
    }
    uint64_t v31 = [(RTPersistenceStore *)self _normalizeError:*(void *)(*(void *)&buf[8] + 40) storeDescription:v21];
    v32 = *(NSObject **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v31;
  }
  else
  {
    v32 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      v38 = [v21 URL];
      *(_DWORD *)v40 = 138412546;
      id v41 = v37;
      __int16 v42 = 2112;
      v43 = v38;
      _os_log_debug_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_DEBUG, "%@ success, added, %@", v40, 0x16u);
    }
  }

  BOOL v33 = [(RTPersistenceStore *)self error:a7 inError:*(void *)(*(void *)&buf[8] + 40)];
  _Block_object_dispose(buf, 8);

  return v33;
}

void __88__RTPersistenceStore_addToCoordinator_lightweightMigration_vacuum_allowMirroring_error___block_invoke(uint64_t a1, int a2, id obj)
{
}

- (BOOL)removeStoreAtURL:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "remove store at URL, %@", buf, 0xCu);
    }

    BOOL v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v28 = 0;
    [v8 removeItemAtURL:v6 error:&v28];
    id v9 = v28;

    BOOL v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v11 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v12 = [v6 path];
    id v13 = [v12 stringByAppendingString:@"-wal"];
    int v14 = [v11 fileURLWithPath:v13];
    id v27 = 0;
    [v10 removeItemAtURL:v14 error:&v27];
    id v15 = v27;

    v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v17 = (void *)MEMORY[0x1E4F1CB10];
    int v18 = [v6 path];
    BOOL v19 = [v18 stringByAppendingString:@"-shm"];
    id v20 = [v17 fileURLWithPath:v19];
    id v26 = 0;
    [v16 removeItemAtURL:v20 error:&v26];
    id v21 = v26;

    uint64_t v22 = _RTSafeArray();

    uint64_t v23 = _RTMultiErrorCreate();

    BOOL v24 = -[RTPersistenceStore error:inError:](self, "error:inError:", a4, v23, v15, v21, 1);
  }
  else
  {
    BOOL v24 = 1;
  }

  return v24;
}

- (BOOL)removeFromCoordinator:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = [(RTPersistenceStore *)self storeDescription];
  id v9 = [v8 URL];
  BOOL v10 = [v7 persistentStoreForURL:v9];

  if (v10)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v8;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "remove from coordinator, %@", buf, 0xCu);
    }

    id v21 = 0;
    int v12 = [v7 removePersistentStore:v10 error:&v21];
    id v13 = v21;
    int v14 = v13;
    if (!v12 || (id v15 = 0, v13))
    {
      v16 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v20 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        uint64_t v23 = v20;
        __int16 v24 = 2112;
        v25 = v14;
        _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@ failed, error, %@", buf, 0x16u);
      }
      id v15 = [(RTPersistenceStore *)self _normalizeError:v14 storeDescription:v8];
    }
    mirroringDelegate = self->_mirroringDelegate;
    self->_mirroringDelegate = 0;

    BOOL v18 = [(RTPersistenceStore *)self error:a4 inError:v15];
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (BOOL)destroyWithCoordinator:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = [(RTPersistenceStore *)self storeDescription];
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v8;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "destroy with coordinator, %@", buf, 0xCu);
  }

  BOOL v10 = [v8 URL];
  uint64_t v11 = [v8 type];
  int v12 = [v8 options];
  id v21 = 0;
  int v13 = [v7 destroyPersistentStoreAtURL:v10 withType:v11 options:v12 error:&v21];

  id v14 = v21;
  if (!v13 || (id v15 = 0, v14))
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v20;
      __int16 v24 = 2112;
      id v25 = v14;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@ failed, error, %@", buf, 0x16u);
    }
    id v15 = [(RTPersistenceStore *)self _normalizeError:v14 storeDescription:v8];
  }
  mirroringDelegate = self->_mirroringDelegate;
  self->_mirroringDelegate = 0;

  BOOL v18 = [(RTPersistenceStore *)self error:a4 inError:v15];
  return v18;
}

- (BOOL)rekeyWithCoordinator:(id)a3 keyData:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (!v9)
  {
    uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: coordinator", buf, 2u);
    }

    if (a5)
    {
      uint64_t v23 = @"coordinator";
LABEL_19:
      _RTErrorInvalidParameterCreate((uint64_t)v23);
      BOOL v21 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_20:
    BOOL v21 = 0;
    goto LABEL_21;
  }
  if (!v10)
  {
    __int16 v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keyData", buf, 2u);
    }

    if (a5)
    {
      uint64_t v23 = @"keyData";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  aSelector = a2;
  int v12 = [(RTPersistenceStore *)self storeDescription];
  int v13 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v12;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "rekey with coordinator, %@", buf, 0xCu);
  }

  id v14 = [v12 URL];
  id v15 = [v12 type];
  v16 = [v12 options];
  id v28 = 0;
  int v17 = [v9 _rekeyPersistentStoreAtURL:v14 type:v15 options:v16 withKey:v11 error:&v28];
  id v18 = v28;

  if (!v17 || (BOOL v19 = 0, v18))
  {
    id v20 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412546;
      id v30 = v26;
      __int16 v31 = 2112;
      id v32 = v18;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "%@ failed, error, %@", buf, 0x16u);
    }
    BOOL v19 = [(RTPersistenceStore *)self _normalizeError:v18 storeDescription:v12];
  }
  BOOL v21 = [(RTPersistenceStore *)self error:a5 inError:v19];

LABEL_21:
  return v21;
}

- (id)cachedModelWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = [(RTPersistenceStore *)self storeDescription];
  id v7 = (void *)MEMORY[0x1E4F1C180];
  BOOL v8 = [v6 URL];
  id v9 = [v6 options];
  id v19 = 0;
  id v10 = [v7 cachedModelForPersistentStoreWithURL:v8 options:v9 error:&v19];
  id v11 = v19;

  int v12 = 0;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13)
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      BOOL v21 = v18;
      __int16 v22 = 2112;
      id v23 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@ failed, error, %@", buf, 0x16u);
    }
    int v12 = [(RTPersistenceStore *)self _normalizeError:v11 storeDescription:v6];
  }
  if ([(RTPersistenceStore *)self error:a3 inError:v12]) {
    id v15 = v10;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  return v16;
}

- (BOOL)performVacuumWithCoordinator:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v32 = COERCE_DOUBLE("-[RTPersistenceStore performVacuumWithCoordinator:error:]");
      __int16 v33 = 1024;
      int v34 = 478;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: coordinator (in %s:%d)", buf, 0x12u);
    }
  }
  BOOL v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [(RTPersistenceStore *)self URL];
    double v10 = [v9 lastPathComponent];
    *(_DWORD *)buf = 138412290;
    double v32 = v10;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "vacuuming store %@", buf, 0xCu);
  }
  id v11 = [MEMORY[0x1E4F1C9C8] date];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  if (v6)
  {
    id v14 = [(RTPersistenceStore *)self URL];
    id v15 = [v6 persistentStoreForURL:v14];

    if (v15)
    {
      id v28 = 0;
      BOOL v16 = [(RTPersistenceStore *)self removeFromCoordinator:v6 error:&v28];
      id v17 = v28;
      id v18 = v17;
      if (!v16 || v17) {
        goto LABEL_18;
      }
    }
    id v27 = 0;
    BOOL v16 = [(RTPersistenceStore *)self addToCoordinator:v6 lightweightMigration:0 vacuum:1 allowMirroring:0 error:&v27];
    id v19 = v27;
    id v18 = v19;
    if (!v16
      || v19
      || (id v26 = 0,
          BOOL v16 = [(RTPersistenceStore *)self removeFromCoordinator:v6 error:&v26],
          id v20 = v26,
          id v18 = v20,
          !v16)
      || v20)
    {
LABEL_18:
      if (a4)
      {
        id v18 = v18;
        *a4 = v18;
      }
    }
    else
    {
      BOOL v21 = [MEMORY[0x1E4F1C9C8] date];
      [v21 timeIntervalSinceReferenceDate];
      double v23 = v22;

      uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v32 = v23 - v13;
        _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "vacuum duration, %lf", buf, 0xCu);
      }

      id v18 = 0;
      LOBYTE(v16) = 1;
    }
  }
  else
  {
    if (!a4)
    {
      LOBYTE(v16) = 0;
      goto LABEL_24;
    }
    uint64_t v29 = *MEMORY[0x1E4F28568];
    id v30 = @"Must pass a valid non-nil coordinator.";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:1 userInfo:v18];
    LOBYTE(v16) = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_24:
  return v16;
}

- (id)_validateKeys:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasPrefix:", @"RT", (void)v12) & 1) == 0) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)retrieveMetadataWithCoordinator:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v26 = "-[RTPersistenceStore retrieveMetadataWithCoordinator:error:]";
      __int16 v27 = 1024;
      int v28 = 554;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: coordinator (in %s:%d)", buf, 0x12u);
    }
  }
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [(RTPersistenceStore *)self URL];
    double v10 = [v9 lastPathComponent];
    *(_DWORD *)buf = 138412290;
    id v26 = v10;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "retrieving metadata of store %@", buf, 0xCu);
  }
  if (v6)
  {
    id v11 = [(RTPersistenceStore *)self URL];
    long long v12 = [v6 persistentStoreForURL:v11];

    if (v12) {
      goto LABEL_13;
    }
    long long v13 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      long long v14 = [(RTPersistenceStore *)self URL];
      long long v15 = [v14 lastPathComponent];
      *(_DWORD *)buf = 138412290;
      id v26 = v15;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "Coordinator did not have any persistent stores with URL %@, adding store", buf, 0xCu);
    }
    id v22 = 0;
    BOOL v16 = [(RTPersistenceStore *)self addToCoordinator:v6 lightweightMigration:0 vacuum:0 allowMirroring:0 error:&v22];
    id v17 = v22;
    id v18 = v17;
    if (v16 && !v17)
    {
LABEL_13:
      id v19 = [v6 metadataForPersistentStore:v12];
    }
    else
    {
      if (a4) {
        *a4 = v17;
      }

      long long v12 = 0;
      id v19 = 0;
    }
  }
  else
  {
    id v20 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Must pass a valid non-nil coordinator, returning nil.", buf, 2u);
    }

    if (!a4)
    {
      id v19 = 0;
      goto LABEL_23;
    }
    uint64_t v23 = *MEMORY[0x1E4F28568];
    uint64_t v24 = @"Must pass a valid non-nil coordinator.";
    long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:1 userInfo:v12];
    id v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_23:

  return v19;
}

- (BOOL)updateMetadata:(id)a3 context:(id)a4 coordinator:(id)a5 error:(id *)a6
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    long long v14 = [(RTPersistenceStore *)self URL];
    long long v15 = [v14 lastPathComponent];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "updating metadata %@ of store %@", buf, 0x16u);
  }
  if (!v10)
  {
    BOOL v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTPersistenceStore updateMetadata:context:coordinator:error:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 600;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keysAndValues (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v11)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTPersistenceStore updateMetadata:context:coordinator:error:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 601;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v12)
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTPersistenceStore updateMetadata:context:coordinator:error:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 602;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: coordinator (in %s:%d)", buf, 0x12u);
    }
  }
  if ([v10 count])
  {
    if (v11)
    {
      if (v12)
      {
        if ([MEMORY[0x1E4F28F98] propertyList:v10 isValidForFormat:200])
        {
          id v19 = [v10 allKeys];
          id v20 = [(RTPersistenceStore *)self _validateKeys:v19];

          if ([v20 count])
          {
            BOOL v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v20;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "-[RTPersistenceStore updateMetadata:context:coordinator:error:]";
              *(_WORD *)&buf[22] = 1024;
              LODWORD(v60) = 652;
              _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Trying to update store metadata with keys that are not owned by you.  Keys: %@ (in %s:%d)", buf, 0x1Cu);
            }
          }
          if ([v20 count])
          {
            id v22 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v20;
              _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Error updating metadata, caller passed bad keys, %@", buf, 0xCu);
            }

            if (a6)
            {
              uint64_t v65 = *MEMORY[0x1E4F28568];
              uint64_t v23 = [NSString stringWithFormat:@"Trying to update store metadata with keys that are not owned by you.  Keys: %@", v20];
              v66 = v23;
              id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];

              [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:0 userInfo:v24];
              BOOL v25 = 0;
              *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_61:

              goto LABEL_62;
            }
            BOOL v25 = 0;
LABEL_62:

            goto LABEL_63;
          }
          id v30 = [(RTPersistenceStore *)self URL];
          __int16 v31 = [v12 persistentStoreForURL:v30];

          if (!v31)
          {
            int v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              v44 = [(RTPersistenceStore *)self URL];
              v45 = [v44 lastPathComponent];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v45;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "-[RTPersistenceStore updateMetadata:context:coordinator:error:]";
              *(_WORD *)&buf[22] = 1024;
              LODWORD(v60) = 667;
              _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "Coordinator did not have any persistent stores with URL %@ (in %s:%d)", buf, 0x1Cu);
            }
            uint64_t v35 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              v46 = [(RTPersistenceStore *)self URL];
              id v47 = [v46 lastPathComponent];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v47;
              _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Coordinator did not have any persistent stores with URL %@, returning nil", buf, 0xCu);
            }
            if (a6)
            {
              uint64_t v63 = *MEMORY[0x1E4F28568];
              uint64_t v36 = NSString;
              id v37 = [(RTPersistenceStore *)self URL];
              v38 = [v37 lastPathComponent];
              v39 = [v36 stringWithFormat:@"Coordinator did not have any persistent stores with URL %@", v38];
              v64 = v39;
              v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];

              *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:0 userInfo:v40];
            }
            id v24 = 0;
            BOOL v25 = 0;
            goto LABEL_61;
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v60 = __Block_byref_object_copy__111;
          v61 = __Block_byref_object_dispose__111;
          id v62 = 0;
          uint64_t v55 = 0;
          v56 = &v55;
          uint64_t v57 = 0x2020000000;
          char v58 = 0;
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __63__RTPersistenceStore_updateMetadata_context_coordinator_error___block_invoke;
          v48[3] = &unk_1E6B9A008;
          v48[4] = self;
          id v49 = v12;
          v53 = buf;
          id v50 = v10;
          id v24 = v31;
          id v51 = v24;
          id v52 = v11;
          v54 = &v55;
          [v49 performBlockAndWait:v48];
          if (*((unsigned char *)v56 + 24) && !*(void *)(*(void *)&buf[8] + 40))
          {
            BOOL v25 = 1;
            goto LABEL_60;
          }
          if (a6)
          {
            double v32 = [*(id *)(*(void *)&buf[8] + 40) domain];
            char v33 = [v32 isEqualToString:@"RTPersistenceErrorDomain"];

            if (v33)
            {
              BOOL v25 = 0;
              *a6 = *(id *)(*(void *)&buf[8] + 40);
LABEL_60:

              _Block_object_dispose(&v55, 8);
              _Block_object_dispose(buf, 8);

              goto LABEL_61;
            }
            id v41 = (void *)MEMORY[0x1E4F28C58];
            __int16 v42 = [*(id *)(*(void *)&buf[8] + 40) userInfo];
            *a6 = [v41 errorWithDomain:@"RTPersistenceErrorDomain" code:0 userInfo:v42];
          }
          BOOL v25 = 0;
          goto LABEL_60;
        }
        uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "An object or key in the metadata is invalid for serialization to store metadata.", buf, 2u);
        }

        if (a6)
        {
          uint64_t v67 = *MEMORY[0x1E4F28568];
          v68 = @"An object or key in the metadata is invalid for serialization to store metadata.";
          id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
          id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:0 userInfo:v20];
          goto LABEL_41;
        }
        goto LABEL_42;
      }
      int v28 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Error updating metadata, caller must pass a valid non-nil coordinator.", buf, 2u);
      }

      if (a6)
      {
        uint64_t v69 = *MEMORY[0x1E4F28568];
        v70 = @"Must pass a valid non-nil coordinator.";
        id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
        id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:1 userInfo:v20];
        goto LABEL_41;
      }
    }
    else
    {
      id v26 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Error updating metadata, caller must pass a valid non-nil context.", buf, 2u);
      }

      if (a6)
      {
        uint64_t v71 = *MEMORY[0x1E4F28568];
        v72[0] = @"Must pass a valid non-nil context.";
        id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:&v71 count:1];
        id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:1 userInfo:v20];
LABEL_41:
        BOOL v25 = 0;
        *a6 = v27;
        goto LABEL_62;
      }
    }
LABEL_42:
    BOOL v25 = 0;
    goto LABEL_63;
  }
  BOOL v25 = 1;
LABEL_63:

  return v25;
}

void __63__RTPersistenceStore_updateMetadata_context_coordinator_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
  id v24 = *(id *)(v4 + 40);
  id v5 = [v2 retrieveMetadataWithCoordinator:v3 error:&v24];
  objc_storeStrong((id *)(v4 + 40), v24);
  id v6 = (void *)[v5 mutableCopy];

  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    [v6 addEntriesFromDictionary:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) setMetadata:v6 forPersistentStore:*(void *)(a1 + 56)];
    uint64_t v7 = objc_opt_new();
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    BOOL v21 = __Block_byref_object_copy__111;
    id v22 = __Block_byref_object_dispose__111;
    id v23 = 0;
    uint64_t v8 = *(void **)(a1 + 64);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__RTPersistenceStore_updateMetadata_context_coordinator_error___block_invoke_2;
    v12[3] = &unk_1E6B96FC8;
    BOOL v16 = &v18;
    id v13 = *(id *)(a1 + 40);
    id v9 = v7;
    id v14 = v9;
    id v10 = *(id *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 72);
    id v15 = v10;
    uint64_t v17 = v11;
    [v8 performBlockAndWait:v12];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v19[5] != 0;

    _Block_object_dispose(&v18, 8);
  }
}

void __63__RTPersistenceStore_updateMetadata_context_coordinator_error___block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 executeRequest:v3 withContext:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[7] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (BOOL)updateMetadata:(id)a3 coordinator:(id)a4 error:(id *)a5
{
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F1C110];
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[[v8 alloc] initWithConcurrencyType:1];
  [v11 setPersistentStoreCoordinator:v9];
  id v12 = [MEMORY[0x1E4F28F80] processInfo];
  id v13 = [v12 processName];
  [v11 setTransactionAuthor:v13];

  LOBYTE(a5) = [(RTPersistenceStore *)self updateMetadata:v10 context:v11 coordinator:v9 error:a5];
  return (char)a5;
}

- (void)onMirroringDelegateInitialization:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [v4 name];
    int v20 = 138412290;
    BOOL v21 = v6;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "onMirroringDelegateInitialization: notification name, %@", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v7 = [v4 name];
  int v8 = [v7 isEqual:@"NSPersistentCloudKitContainerEventChangedNotification"];

  if (v8)
  {
    id v9 = [v4 userInfo];
    id v10 = [v9 objectForKey:*MEMORY[0x1E4F1BE60]];

    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [v4 name];
      int v20 = 138412546;
      BOOL v21 = v12;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "notification name, %@, event, %@", (uint8_t *)&v20, 0x16u);
    }
    if (![v10 type])
    {
      id v13 = [v10 endDate];

      if (v13)
      {
        int v14 = [v10 succeeded];
        id v15 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        BOOL v16 = v15;
        if (v14)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            LOWORD(v20) = 0;
            _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "mirroring delegate did initialize", (uint8_t *)&v20, 2u);
          }

          [(RTPersistenceStore *)self setMirroringDelegateState:1];
          uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v18 = [v4 userInfo];
          id v19 = @"RTPersistenceStoreMirroringDelegateDidInitializeNotificationName";
        }
        else
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v20) = 0;
            _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "mirroring delegate failed to initialize", (uint8_t *)&v20, 2u);
          }

          [(RTPersistenceStore *)self setMirroringDelegateState:2];
          uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v18 = [v4 userInfo];
          id v19 = @"RTPersistenceStoreMirroringDelegateFailedToInitializeNotificationName";
        }
        [v17 postNotificationName:v19 object:self userInfo:v18];
      }
    }
  }
}

- (id)storeURLsMatchingStoreName
{
  uint64_t v3 = [(RTPersistenceStore *)self URL];
  id v4 = [(RTPersistenceStore *)self storeURLsMatchingStoreNameAtURL:v3];

  return v4;
}

- (id)storeURLsMatchingStoreNameAtURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    char v6 = [v4 hasDirectoryPath];
    uint64_t v7 = v5;
    int v8 = v7;
    id v9 = v7;
    if ((v6 & 1) == 0)
    {
      id v9 = [v7 URLByDeletingLastPathComponent];
    }
    id v10 = [MEMORY[0x1E4F28CB8] sortedContentsOfDirectoryAtURL:v9 withExtension:@"sqlite"];
    uint64_t v11 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __54__RTPersistenceStore_storeURLsMatchingStoreNameAtURL___block_invoke;
    uint64_t v18 = &unk_1E6B9A030;
    id v19 = self;
    int v20 = v8;
    id v12 = [v11 predicateWithBlock:&v15];
    id v13 = [v10 filteredArrayUsingPredicate:v12, v15, v16, v17, v18, v19];
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fileSystemURL", buf, 2u);
    }
    id v13 = 0;
  }

  return v13;
}

uint64_t __54__RTPersistenceStore_storeURLsMatchingStoreNameAtURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RTPersistenceStore storeBaseName:v3];
  uint64_t v5 = [*(id *)(a1 + 32) storeBaseName];
  int v6 = [v4 isEqualToString:v5];

  if (v6
    && ([v3 lastPathComponent],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 containsString:@".bak"],
        v7,
        (v8 & 1) == 0))
  {
    id v10 = [v3 lastPathComponent];
    uint64_t v11 = [*(id *)(a1 + 40) lastPathComponent];
    int v12 = [v10 isEqual:v11];

    uint64_t v9 = v12 ^ 1u;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)storeBaseName
{
  uint64_t v2 = [(RTPersistenceStore *)self URL];
  id v3 = +[RTPersistenceStore storeBaseName:v2];

  return v3;
}

+ (id)storeBaseName:(id)a3
{
  if (a3)
  {
    id v3 = [a3 lastPathComponent];
    id v4 = [v3 stringByDeletingPathExtension];
    uint64_t v5 = [v4 rangeOfString:@"-V"];
    uint64_t v7 = v6;

    if (v5 != 0x7FFFFFFFFFFFFFFFLL || v7)
    {
      uint64_t v8 = [v3 substringWithRange:0, v5];
    }
    else
    {
      uint64_t v8 = [v3 stringByDeletingPathExtension];
    }
    id v10 = (void *)v8;
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v12 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: storeURL", v12, 2u);
    }

    id v10 = 0;
  }

  return v10;
}

- (RTPersistenceMigrator)migrator
{
  return self->_migrator;
}

- (void)setMigrator:(id)a3
{
}

- (NSPersistentStoreDescription)storeDescription
{
  return (NSPersistentStoreDescription *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableDictionary)userInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSCloudKitMirroringDelegate)mirroringDelegate
{
  return self->_mirroringDelegate;
}

- (void)setMirroringDelegate:(id)a3
{
}

- (NSCloudKitMirroringDelegateOptions)mirroringDelegateOptions
{
  return self->_mirroringDelegateOptions;
}

- (void)setMirroringDelegateOptions:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (int64_t)mirroringDelegateState
{
  return self->_mirroringDelegateState;
}

- (void)setMirroringDelegateState:(int64_t)a3
{
  self->_mirroringDelegateState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroringDelegateOptions, 0);
  objc_storeStrong((id *)&self->_mirroringDelegate, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_migrator, 0);

  objc_storeStrong((id *)&self->_storeDescription, 0);
}

@end