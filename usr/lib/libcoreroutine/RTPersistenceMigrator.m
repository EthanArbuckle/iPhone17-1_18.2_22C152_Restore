@interface RTPersistenceMigrator
- (BOOL)didVacuumStore;
- (NSDate)migrationEndDate;
- (NSDate)migrationStartDate;
- (NSManagedObjectModel)nextModel;
- (RTPersistenceDelegate)delegate;
- (RTPersistenceMigrator)init;
- (RTPersistenceMigrator)initWithStore:(id)a3 modelProvider:(id)a4 delegate:(id)a5;
- (RTPersistenceModelProvider)modelProvider;
- (RTPersistenceStore)store;
- (id)__findCandidateStoresForImportStepWithStore:(id)a3;
- (id)_coordinatorForModel:(id)a3;
- (unint64_t)__executeImportStepWithSourceStore:(id)a3 sourceCoordinator:(id)a4 destinationStore:(id)a5 destinationCoordinator:(id)a6 model:(id)a7;
- (unint64_t)__executeVacuumStepWithStore:(id)a3 coordinator:(id)a4 delegate:(id)a5 vacuumDate:(id)a6;
- (unint64_t)__prepareImportStepWithSourceStore:(id)a3 sourceCoordinator:(id)a4 destinationStore:(id)a5 destinationCoordinator:(id)a6 model:(id)a7 allowMigration:(BOOL)a8;
- (unint64_t)_executeCacheStep;
- (unint64_t)_executeDestroyStep;
- (unint64_t)_executeImportStep;
- (unint64_t)_executeMigrateStep;
- (unint64_t)_executeOpenStep;
- (unint64_t)_executePrepareStep;
- (unint64_t)_executeRecreateStep;
- (unint64_t)_executeRekeyStep;
- (unint64_t)_executeVacuumStep;
- (unint64_t)run;
- (unint64_t)state;
- (unint64_t)status;
- (void)__cleanupAfterImportWithStore:(id)a3 coordinator:(id)a4;
- (void)_attemptMigration;
- (void)_executeSingleMigrationStep;
- (void)setNextModel:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation RTPersistenceMigrator

- (RTPersistenceMigrator)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithStore_modelProvider_delegate_);
}

- (RTPersistenceMigrator)initWithStore:(id)a3 modelProvider:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v8)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: store";
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_14;
  }
  if (!v9)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: modelProvider";
    goto LABEL_13;
  }
  if (!v10)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v16 = "Invalid parameter not satisfying: delegate";
      goto LABEL_13;
    }
LABEL_14:

    v14 = 0;
    goto LABEL_15;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTPersistenceMigrator;
  v12 = [(RTPersistenceMigrator *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_store, v8);
    objc_storeWeak((id *)&v13->_modelProvider, v9);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v13->_state = 0;
    v13->_didVacuumStore = 0;
  }
  self = v13;
  v14 = self;
LABEL_15:

  return v14;
}

- (unint64_t)status
{
  if (([(RTPersistenceMigrator *)self state] & 0x8000000000000000) != 0) {
    return 1;
  }
  unint64_t v3 = [(RTPersistenceMigrator *)self state];
  if (v3 == 10) {
    return 3;
  }
  else {
    return 2 * (v3 == 9);
  }
}

- (unint64_t)run
{
  [(RTPersistenceMigrator *)self _attemptMigration];

  return [(RTPersistenceMigrator *)self status];
}

- (id)_coordinatorForModel:(id)a3
{
  id v4 = a3;
  v5 = [(NSPersistentStoreCoordinator *)self->_cachedCoordinator managedObjectModel];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    v7 = (NSPersistentStoreCoordinator *)[objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v4];
    cachedCoordinator = self->_cachedCoordinator;
    self->_cachedCoordinator = v7;
  }
  id v9 = self->_cachedCoordinator;

  return v9;
}

- (void)_attemptMigration
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (![(RTPersistenceMigrator *)self status] || [(RTPersistenceMigrator *)self status] == 1)
  {
    self->_state &= ~0x8000000000000000;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v4 = objc_loadWeakRetained((id *)&self->_store);
    if (!v4)
    {
      v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315394;
        objc_super v18 = "-[RTPersistenceMigrator _attemptMigration]";
        __int16 v19 = 1024;
        int v20 = 116;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Migrator cannot run without a store. (in %s:%d)", (uint8_t *)&v17, 0x12u);
      }

      if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:-10000 userInfo:0];
        [WeakRetained persistenceStore:0 failedWithError:v14];
      }
      [(RTPersistenceMigrator *)self setState:10];
      goto LABEL_30;
    }
    id v5 = objc_loadWeakRetained((id *)&self->_modelProvider);
    if (v5)
    {
      if (WeakRetained)
      {
        char v6 = [MEMORY[0x1E4F1C9C8] date];
        migrationStartDate = self->_migrationStartDate;
        self->_migrationStartDate = v6;

        if (objc_opt_respondsToSelector()) {
          [WeakRetained persistenceMigrator:self didStartMigratingStore:v4 withModelProvider:v5];
        }
        unint64_t state = self->_state;
        do
        {
          [(RTPersistenceMigrator *)self _executeSingleMigrationStep];
          unint64_t v9 = self->_state;
          if ((v9 & 0x8000000000000000) != 0) {
            break;
          }
          BOOL v10 = v9 == state;
          unint64_t state = self->_state;
        }
        while (!v10);
        v11 = [MEMORY[0x1E4F1C9C8] date];
        migrationEndDate = self->_migrationEndDate;
        self->_migrationEndDate = v11;

        if (objc_opt_respondsToSelector()) {
          [WeakRetained persistenceMigrator:self didFinishMigratingStore:v4 withModelProvider:v5];
        }
        goto LABEL_29;
      }
      v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315394;
        objc_super v18 = "-[RTPersistenceMigrator _attemptMigration]";
        __int16 v19 = 1024;
        int v20 = 142;
        _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Migrator cannot run without a delegate. (in %s:%d)", (uint8_t *)&v17, 0x12u);
      }
    }
    else
    {
      v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315394;
        objc_super v18 = "-[RTPersistenceMigrator _attemptMigration]";
        __int16 v19 = 1024;
        int v20 = 130;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Migrator cannot run without a modelProvider. (in %s:%d)", (uint8_t *)&v17, 0x12u);
      }

      if (!WeakRetained || (objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_28;
      }
      v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:-9999 userInfo:0];
      [WeakRetained persistenceStore:v4 failedWithError:v16];
    }

LABEL_28:
    [(RTPersistenceMigrator *)self setState:10];
LABEL_29:

LABEL_30:
  }
}

- (void)_executeSingleMigrationStep
{
  switch([(RTPersistenceMigrator *)self state])
  {
    case 0uLL:
      unint64_t v3 = [(RTPersistenceMigrator *)self _executeOpenStep];
      goto LABEL_13;
    case 1uLL:
      unint64_t v3 = [(RTPersistenceMigrator *)self _executeVacuumStep];
      goto LABEL_13;
    case 2uLL:
      unint64_t v3 = [(RTPersistenceMigrator *)self _executePrepareStep];
      goto LABEL_13;
    case 3uLL:
      unint64_t v3 = [(RTPersistenceMigrator *)self _executeCacheStep];
      goto LABEL_13;
    case 4uLL:
      unint64_t v3 = [(RTPersistenceMigrator *)self _executeMigrateStep];
      goto LABEL_13;
    case 5uLL:
      unint64_t v3 = [(RTPersistenceMigrator *)self _executeDestroyStep];
      goto LABEL_13;
    case 6uLL:
      unint64_t v3 = [(RTPersistenceMigrator *)self _executeRecreateStep];
      goto LABEL_13;
    case 7uLL:
      unint64_t v3 = [(RTPersistenceMigrator *)self _executeRekeyStep];
      goto LABEL_13;
    case 8uLL:
      unint64_t v3 = [(RTPersistenceMigrator *)self _executeImportStep];
      goto LABEL_13;
    case 9uLL:
    case 10uLL:
      unint64_t v3 = [(RTPersistenceMigrator *)self state];
LABEL_13:
      unint64_t v4 = v3;
      break;
    default:
      unint64_t v4 = 0;
      break;
  }

  [(RTPersistenceMigrator *)self setState:v4];
}

- (unint64_t)_executeOpenStep
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  id v4 = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = [WeakRetained URL];
    v7 = [v6 lastPathComponent];
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = (uint64_t)v7;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "store, %@, migration step, open", buf, 0xCu);
  }
  id v8 = objc_loadWeakRetained((id *)&self->_modelProvider);
  unint64_t v9 = [v8 latestModel];

  BOOL v10 = [(RTPersistenceMigrator *)self _coordinatorForModel:v9];
  id v17 = 0;
  [WeakRetained addToCoordinator:v10 lightweightMigration:0 vacuum:0 allowMirroring:0 error:&v17];
  id v11 = v17;
  v12 = v11;
  if (v11)
  {
    unint64_t v13 = 0;
    switch([v11 code])
    {
      case 0:
      case 3:
        unint64_t v13 = 0x8000000000000005;
        if (objc_opt_respondsToSelector()) {
          [v4 persistenceStore:WeakRetained failedWithError:v12];
        }
        break;
      case 1:
        break;
      case 2:
        unint64_t v13 = 0x8000000000000003;
        break;
      default:
        v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = [v12 code];
          *(_DWORD *)buf = 134218498;
          uint64_t v19 = v16;
          __int16 v20 = 2080;
          uint64_t v21 = "-[RTPersistenceMigrator _executeOpenStep]";
          __int16 v22 = 1024;
          int v23 = 249;
          _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
        }

        unint64_t v13 = 0x8000000000000000;
        break;
    }
  }
  else
  {
    unint64_t v13 = 0x8000000000000001;
  }

  return v13;
}

- (unint64_t)_executeVacuumStep
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  id v4 = objc_loadWeakRetained((id *)&self->_modelProvider);
  id v5 = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [WeakRetained URL];
    id v8 = [v7 lastPathComponent];
    *(_DWORD *)buf = 138412290;
    uint64_t v50 = (uint64_t)v8;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "store, %@, migration step, vacuum", buf, 0xCu);
  }
  unint64_t v9 = [v4 latestModel];
  BOOL v10 = [(RTPersistenceMigrator *)self _coordinatorForModel:v9];
  id v46 = 0;
  id v11 = [WeakRetained retrieveMetadataWithCoordinator:v10 error:&v46];
  id v12 = v46;
  if (v11) {
    unint64_t v13 = v11;
  }
  else {
    unint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  v14 = (void *)[v13 mutableCopy];

  if (!v12)
  {
    objc_super v18 = [v14 objectForKeyedSubscript:@"RTPersistentStoreMetadataStoreCorruptKey"];
    int v19 = [v18 BOOLValue];

    if (v19)
    {
      id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:3 userInfo:0];
LABEL_15:
      if (objc_opt_respondsToSelector()) {
        [v5 persistenceStore:WeakRetained failedWithError:v12];
      }
      goto LABEL_23;
    }
    __int16 v20 = [v14 objectForKeyedSubscript:@"RTPersistentStoreMetadataStoreTransactionHistorySizeExceededKey"];
    int v21 = [v20 BOOLValue];

    if (v21)
    {
      __int16 v22 = NSString;
      int v23 = [(RTPersistenceMigrator *)self store];
      uint64_t v24 = [v23 storeBaseName];
      v25 = [v22 stringWithFormat:@"Store %@ exceeded maximum transaction history size.", v24];

      v26 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v50 = (uint64_t)v25;
        _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }

      uint64_t v47 = *MEMORY[0x1E4F28568];
      v48 = v25;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:-9997 userInfo:v27];
      if (objc_opt_respondsToSelector()) {
        [v5 persistenceStore:WeakRetained failedWithError:v12];
      }

      goto LABEL_23;
    }
    if (v5)
    {
      if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        v29 = [WeakRetained storeBaseName];
        int v30 = [v29 isEqualToString:@"Cloud"];

        if (v30)
        {
          v31 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            int v32 = [v5 shouldResetCloudStore];
            v33 = @"NO";
            if (v32) {
              v33 = @"YES";
            }
            *(_DWORD *)buf = 138412290;
            uint64_t v50 = (uint64_t)v33;
            _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_DEFAULT, "force destroy the cloud store for testing only, %@", buf, 0xCu);
          }

          if ([v5 shouldResetCloudStore])
          {
            [v5 setShouldResetCloudStore:0];
            id v12 = 0;
LABEL_23:
            unint64_t v16 = 5;
            goto LABEL_24;
          }
        }
      }
    }
    v34 = [v14 objectForKeyedSubscript:@"RTPersistentStoreMetadataLastVacuumDateKey"];
    if (!v34)
    {
      v35 = [MEMORY[0x1E4F1C9C8] date];
      unint64_t v16 = [(RTPersistenceMigrator *)self __executeVacuumStepWithStore:WeakRetained coordinator:v10 delegate:v5 vacuumDate:v35];
      id v12 = 0;
      goto LABEL_52;
    }
    v35 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1209600.0];
    v45 = v34;
    v36 = [v34 earlierDate:v35];
    char v37 = [v36 isEqualToDate:v35];

    if (v37)
    {
      id v12 = 0;
      unint64_t v16 = 8;
      v34 = v45;
LABEL_52:

      goto LABEL_24;
    }
    v44 = (void *)[objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v9];
    [WeakRetained performVacuumWithCoordinator:error:];
    id v38 = 0;
    id v12 = v38;
    if (v38)
    {
      uint64_t v39 = [v38 code];
      v34 = v45;
      if ((unint64_t)(v39 - 2) < 2)
      {
LABEL_43:
        if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v5 persistenceStore:WeakRetained failedWithError:v12];
        }
        unint64_t v16 = 5;
        goto LABEL_51;
      }
      unint64_t v16 = v39;
      if (v39 != 1)
      {
        if (v39)
        {
          v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            uint64_t v43 = [v12 code];
            *(_DWORD *)buf = 134218498;
            uint64_t v50 = v43;
            __int16 v51 = 2080;
            v52 = "-[RTPersistenceMigrator _executeVacuumStep]";
            __int16 v53 = 1024;
            int v54 = 356;
            _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
          }

          unint64_t v16 = 1;
          goto LABEL_51;
        }
        goto LABEL_43;
      }
    }
    else
    {
      self->_didVacuumStore = 1;
      v40 = [MEMORY[0x1E4F1C9C8] date];
      unint64_t v16 = [(RTPersistenceMigrator *)self __executeVacuumStepWithStore:WeakRetained coordinator:v10 delegate:v5 vacuumDate:v40];

      v34 = v45;
    }
LABEL_51:

    goto LABEL_52;
  }
  uint64_t v15 = [v12 code];
  if ((unint64_t)(v15 - 2) < 2) {
    goto LABEL_15;
  }
  unint64_t v16 = v15;
  if (v15 == 1) {
    goto LABEL_24;
  }
  if (!v15) {
    goto LABEL_15;
  }
  id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v41 = [v12 code];
    *(_DWORD *)buf = 134218498;
    uint64_t v50 = v41;
    __int16 v51 = 2080;
    v52 = "-[RTPersistenceMigrator _executeVacuumStep]";
    __int16 v53 = 1024;
    int v54 = 285;
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
  }

  unint64_t v16 = 1;
LABEL_24:

  return v16;
}

- (unint64_t)__executeVacuumStepWithStore:(id)a3 coordinator:(id)a4 delegate:(id)a5 vacuumDate:(id)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unint64_t v13 = v12;
  if (!v9)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    int v19 = "Invalid parameter not satisfying: store";
LABEL_15:
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_16;
  }
  if (!v10)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    int v19 = "Invalid parameter not satisfying: coordinator";
    goto LABEL_15;
  }
  if (!v11)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    int v19 = "Invalid parameter not satisfying: delegate";
    goto LABEL_15;
  }
  if (v12)
  {
    v31 = @"RTPersistentStoreMetadataLastVacuumDateKey";
    v32[0] = v12;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v24 = 0;
    char v15 = [v9 updateMetadata:v14 coordinator:v10 error:&v24];
    unint64_t v16 = v24;
    id v17 = v16;
    if (v15)
    {
      unint64_t v18 = 8;
LABEL_27:

      goto LABEL_17;
    }
    uint64_t v21 = [v16 code];
    if ((unint64_t)(v21 - 2) >= 2)
    {
      unint64_t v18 = v21;
      if (v21 == 1) {
        goto LABEL_27;
      }
      if (v21)
      {
        __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = [v17 code];
          *(_DWORD *)buf = 134218498;
          uint64_t v26 = v23;
          __int16 v27 = 2080;
          v28 = "-[RTPersistenceMigrator __executeVacuumStepWithStore:coordinator:delegate:vacuumDate:]";
          __int16 v29 = 1024;
          int v30 = 402;
          _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
        }

        unint64_t v18 = 1;
        goto LABEL_27;
      }
    }
    if (objc_opt_respondsToSelector()) {
      [v11 persistenceStore:v9 failedWithError:v17];
    }
    unint64_t v18 = 5;
    goto LABEL_27;
  }
  id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    int v19 = "Invalid parameter not satisfying: vacuumDate";
    goto LABEL_15;
  }
LABEL_16:
  unint64_t v18 = 8;
LABEL_17:

  return v18;
}

- (unint64_t)_executePrepareStep
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  id v4 = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = [WeakRetained URL];
    v7 = [v6 lastPathComponent];
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = (uint64_t)v7;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "store, %@, migration step, prepare", buf, 0xCu);
  }
  id v8 = objc_loadWeakRetained((id *)&self->_modelProvider);
  id v9 = [v8 latestModel];

  id v10 = [(RTPersistenceMigrator *)self _coordinatorForModel:v9];
  id v31 = 0;
  id v11 = [WeakRetained retrieveMetadataWithCoordinator:v10 error:&v31];
  id v12 = v31;
  if (!v12)
  {
    unint64_t v16 = [v11 objectForKeyedSubscript:@"RTPersistentStoreMetadataAppleIDsKey"];
    if (objc_opt_respondsToSelector())
    {
      id v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v16];
      char v18 = [v4 store:WeakRetained validateAppleIDs:v17];

      if (v18)
      {
        int v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
        [v19 setPersistentStoreCoordinator:v10];
        __int16 v20 = [MEMORY[0x1E4F28F80] processInfo];
        uint64_t v21 = [v20 processName];
        [v19 setName:v21];

        __int16 v22 = [MEMORY[0x1E4F28F80] processInfo];
        uint64_t v23 = [v22 processName];
        [v19 setTransactionAuthor:v23];

        if (objc_opt_respondsToSelector())
        {
          id v30 = 0;
          int v24 = [v4 prepareStore:WeakRetained withContext:v19 error:&v30];
          id v25 = v30;
          unint64_t v13 = v25;
          if (!v24 || v25)
          {
            if (!v4 || (objc_opt_respondsToSelector() & 1) == 0)
            {
              unint64_t v15 = 5;
              goto LABEL_29;
            }
            uint64_t v26 = v13;
            goto LABEL_21;
          }
        }
        else
        {
          unint64_t v13 = 0;
        }
        unint64_t v15 = 7;
        goto LABEL_29;
      }
    }
    if (!v4 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      unint64_t v13 = 0;
      unint64_t v15 = 5;
LABEL_30:

      goto LABEL_31;
    }
    unint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:-9998 userInfo:0];
    uint64_t v26 = 0;
    int v19 = v13;
LABEL_21:
    [v4 persistenceStore:WeakRetained failedWithError:v13];
    unint64_t v15 = 5;
    unint64_t v13 = v26;
LABEL_29:

    goto LABEL_30;
  }
  unint64_t v13 = v12;
  uint64_t v14 = [v12 code];
  if ((unint64_t)(v14 - 2) >= 2)
  {
    if (v14 != 1)
    {
      if (!v14) {
        goto LABEL_7;
      }
      __int16 v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = [v13 code];
        *(_DWORD *)buf = 134218498;
        uint64_t v33 = v29;
        __int16 v34 = 2080;
        v35 = "-[RTPersistenceMigrator _executePrepareStep]";
        __int16 v36 = 1024;
        int v37 = 437;
        _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
      }
    }
    unint64_t v15 = 2;
    goto LABEL_31;
  }
LABEL_7:
  if (objc_opt_respondsToSelector()) {
    [v4 persistenceStore:WeakRetained failedWithError:v13];
  }
  unint64_t v15 = 5;
LABEL_31:

  return v15;
}

- (unint64_t)_executeRekeyStep
{
  return 9;
}

- (unint64_t)_executeCacheStep
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  id v4 = objc_loadWeakRetained((id *)&self->_modelProvider);
  id v5 = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [WeakRetained URL];
    id v8 = [v7 lastPathComponent];
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = (uint64_t)v8;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "store, %@, migration step, cache", buf, 0xCu);
  }
  id v21 = 0;
  id v9 = [WeakRetained cachedModelWithError:&v21];
  id v10 = v21;
  id v11 = v10;
  if (v9)
  {
    id v12 = [v4 modelFollowingModel:v9];
    unint64_t v13 = v12;
    if (v12)
    {
      uint64_t v14 = v12;
    }
    else
    {
      uint64_t v14 = [v4 latestModel];
    }
    nextModel = self->_nextModel;
    self->_nextModel = v14;

    unint64_t v16 = 4;
    goto LABEL_14;
  }
  uint64_t v15 = [v10 code];
  if ((unint64_t)(v15 - 2) >= 2)
  {
    if (v15 != 1)
    {
      if (!v15) {
        goto LABEL_9;
      }
      int v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = [v11 code];
        *(_DWORD *)buf = 134218498;
        uint64_t v23 = v20;
        __int16 v24 = 2080;
        id v25 = "-[RTPersistenceMigrator _executeCacheStep]";
        __int16 v26 = 1024;
        int v27 = 579;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
      }
    }
    unint64_t v16 = 3;
    goto LABEL_14;
  }
LABEL_9:
  if (objc_opt_respondsToSelector()) {
    [v5 persistenceStore:WeakRetained failedWithError:v11];
  }
  unint64_t v16 = 5;
LABEL_14:

  return v16;
}

- (unint64_t)_executeMigrateStep
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  id v4 = objc_loadWeakRetained((id *)&self->_modelProvider);
  id v5 = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [WeakRetained URL];
    id v8 = [v7 lastPathComponent];
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = (uint64_t)v8;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "store, %@, migration step, migrate", buf, 0xCu);
  }
  if (!self->_nextModel)
  {
    id v10 = 0;
    id v9 = 0;
    unint64_t v11 = 1;
    goto LABEL_23;
  }
  id v9 = 0;
  id v10 = 0;
  unint64_t v11 = 1;
  while (1)
  {
    id v12 = v10;
    unint64_t v13 = v9;
    id v9 = -[RTPersistenceMigrator _coordinatorForModel:](self, "_coordinatorForModel:");

    id v22 = v12;
    char v14 = [WeakRetained addToCoordinator:v9 lightweightMigration:1 vacuum:0 allowMirroring:0 error:&v22];
    id v10 = v22;

    if ((v14 & 1) == 0) {
      break;
    }
    uint64_t v15 = [v4 modelFollowingModel:self->_nextModel];
    nextModel = self->_nextModel;
    self->_nextModel = v15;

    if (!self->_nextModel) {
      goto LABEL_23;
    }
  }
  if (!v10) {
    goto LABEL_22;
  }
  id v17 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = (uint64_t)v10;
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "error while adding store to coordinator during migrate step, %@", buf, 0xCu);
  }

  uint64_t v18 = [v10 code];
  if ((unint64_t)(v18 - 2) < 2) {
    goto LABEL_15;
  }
  if (v18 == 1)
  {
LABEL_22:
    unint64_t v11 = 4;
    goto LABEL_23;
  }
  if (v18)
  {
    int v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = [v10 code];
      *(_DWORD *)buf = 134218498;
      uint64_t v24 = v21;
      __int16 v25 = 2080;
      __int16 v26 = "-[RTPersistenceMigrator _executeMigrateStep]";
      __int16 v27 = 1024;
      int v28 = 624;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
    }

    goto LABEL_22;
  }
LABEL_15:
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 persistenceStore:WeakRetained failedWithError:v10];
  }
  unint64_t v11 = 5;
LABEL_23:

  return v11;
}

- (unint64_t)_executeDestroyStep
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  id v4 = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = [WeakRetained URL];
    v7 = [v6 lastPathComponent];
    *(_DWORD *)buf = 138412290;
    uint64_t v36 = (uint64_t)v7;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "store, %@, migration step, destroy", buf, 0xCu);
  }
  id v8 = objc_loadWeakRetained((id *)&self->_modelProvider);
  id v9 = [v8 latestModel];

  id v10 = [(RTPersistenceMigrator *)self _coordinatorForModel:v9];
  id v34 = 0;
  int v11 = [WeakRetained removeFromCoordinator:v10 error:&v34];
  id v12 = v34;
  unint64_t v13 = v12;
  if (v11 && !v12)
  {
    if (objc_opt_respondsToSelector())
    {
      id v33 = 0;
      [v4 backupPersistenceStore:WeakRetained error:&v33];
      id v14 = v33;
      if (v14)
      {
        uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v36 = (uint64_t)v14;
          _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "error while backing up store files, %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v14 = 0;
    }
    id v32 = 0;
    int v18 = [WeakRetained destroyWithCoordinator:v10 error:&v32];
    id v19 = v32;
    uint64_t v20 = v19;
    if (!v18 || v19)
    {
      uint64_t v21 = [v19 code];
      if ((unint64_t)(v21 - 2) >= 2 && v21)
      {
        if (v21 == 1)
        {
          if (objc_opt_respondsToSelector()) {
            [v4 persistenceStore:WeakRetained failedWithError:v20];
          }
        }
        else
        {
          __int16 v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            uint64_t v30 = [v20 code];
            *(_DWORD *)buf = 134218498;
            uint64_t v36 = v30;
            __int16 v37 = 2080;
            uint64_t v38 = "-[RTPersistenceMigrator _executeDestroyStep]";
            __int16 v39 = 1024;
            int v40 = 721;
            _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
          }
        }
        unint64_t v17 = 5;
      }
      else
      {
        id v22 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v36 = (uint64_t)v20;
          _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "error while attempting to destroy with coordinator, %@", buf, 0xCu);
        }

        if (objc_opt_respondsToSelector()) {
          [v4 persistenceStore:WeakRetained failedWithError:v20];
        }
        uint64_t v23 = [WeakRetained URL];
        id v31 = 0;
        [WeakRetained removeStoreAtURL:v23 error:&v31];
        id v24 = v31;

        if (v24 && [v24 code] != 0x7FFFFFFFFFFFFFFFLL)
        {
          __int16 v27 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v36 = (uint64_t)v24;
            _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "error while forcing file unlink, %@", buf, 0xCu);
          }

          if (objc_opt_respondsToSelector()) {
            [v4 persistenceStore:WeakRetained failedWithError:v24];
          }
          unint64_t v17 = 10;
        }
        else
        {
          unint64_t v17 = 6;
        }
      }
    }
    else
    {
      unint64_t v17 = 6;
    }

    goto LABEL_47;
  }
  uint64_t v16 = [v12 code];
  if ((unint64_t)(v16 - 2) >= 2)
  {
    if (v16 != 1)
    {
      if (!v16) {
        goto LABEL_13;
      }
      __int16 v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = [v13 code];
        *(_DWORD *)buf = 134218498;
        uint64_t v36 = v29;
        __int16 v37 = 2080;
        uint64_t v38 = "-[RTPersistenceMigrator _executeDestroyStep]";
        __int16 v39 = 1024;
        int v40 = 664;
        _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
      }
    }
    unint64_t v17 = 5;
    goto LABEL_47;
  }
LABEL_13:
  if (objc_opt_respondsToSelector()) {
    [v4 persistenceStore:WeakRetained failedWithError:v13];
  }
  unint64_t v17 = 10;
LABEL_47:

  return v17;
}

- (unint64_t)_executeRecreateStep
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  id v4 = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = [WeakRetained URL];
    v7 = [v6 lastPathComponent];
    *(_DWORD *)buf = 138412290;
    uint64_t v32 = (uint64_t)v7;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "store, %@, migration step, recreate", buf, 0xCu);
  }
  id v8 = objc_loadWeakRetained((id *)&self->_modelProvider);
  id v9 = [v8 latestModel];

  id v10 = [(RTPersistenceMigrator *)self _coordinatorForModel:v9];
  id v30 = 0;
  int v11 = [WeakRetained addToCoordinator:v10 lightweightMigration:0 vacuum:0 allowMirroring:0 error:&v30];
  id v12 = v30;
  unint64_t v13 = v12;
  if (v11 && !v12)
  {
    id v14 = [MEMORY[0x1E4F1CA60] dictionary];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = [v4 appleIDsForStore:WeakRetained];
      uint64_t v16 = [v15 allObjects];

      if ([v16 count]) {
        [v14 setObject:v16 forKeyedSubscript:@"RTPersistentStoreMetadataAppleIDsKey"];
      }
    }
    unint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
    [v14 setObject:v17 forKeyedSubscript:@"RTPersistentStoreMetadataLastVacuumDateKey"];

    id v29 = 0;
    int v18 = [WeakRetained updateMetadata:v14 coordinator:v10 error:&v29];
    id v19 = v29;
    uint64_t v20 = v19;
    if (v18 && !v19)
    {
      unint64_t v21 = 8;
LABEL_33:

      goto LABEL_34;
    }
    uint64_t v23 = [v19 code];
    if ((unint64_t)(v23 - 2) >= 2)
    {
      if (v23 != 1)
      {
        if (!v23) {
          goto LABEL_21;
        }
        __int16 v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = [v20 code];
          *(_DWORD *)buf = 134218498;
          uint64_t v32 = v28;
          __int16 v33 = 2080;
          id v34 = "-[RTPersistenceMigrator _executeRecreateStep]";
          __int16 v35 = 1024;
          int v36 = 792;
          _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
        }
      }
      unint64_t v21 = 6;
      goto LABEL_33;
    }
LABEL_21:
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v4 persistenceStore:WeakRetained failedWithError:v20];
    }
    unint64_t v21 = 10;
    goto LABEL_33;
  }
  uint64_t v22 = [v12 code];
  if ((unint64_t)(v22 - 2) < 2) {
    goto LABEL_15;
  }
  if (v22 == 1)
  {
LABEL_28:
    unint64_t v21 = 6;
    goto LABEL_34;
  }
  if (v22)
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = [v13 code];
      *(_DWORD *)buf = 134218498;
      uint64_t v32 = v27;
      __int16 v33 = 2080;
      id v34 = "-[RTPersistenceMigrator _executeRecreateStep]";
      __int16 v35 = 1024;
      int v36 = 759;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
    }

    goto LABEL_28;
  }
LABEL_15:
  if (objc_opt_respondsToSelector()) {
    [v4 persistenceStore:WeakRetained failedWithError:v13];
  }
  unint64_t v21 = 10;
LABEL_34:

  return v21;
}

- (unint64_t)_executeImportStep
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  id v4 = objc_loadWeakRetained((id *)&self->_modelProvider);
  id v5 = [v4 latestModel];
  char v6 = [(RTPersistenceMigrator *)self _coordinatorForModel:v5];
  id v73 = 0;
  v7 = [WeakRetained retrieveMetadataWithCoordinator:v6 error:&v73];
  id v8 = v73;
  if (v8)
  {
    id v9 = v8;
    unint64_t v10 = [v8 code];
    if (v10 >= 4)
    {
      id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = [v9 code];
        *(_DWORD *)buf = 134218498;
        uint64_t v77 = v35;
        __int16 v78 = 2080;
        v79 = "-[RTPersistenceMigrator _executeImportStep]";
        __int16 v80 = 1024;
        int v81 = 824;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
      }

      unint64_t v11 = 8;
    }
    else
    {
      unint64_t v11 = qword_1DA0FF5D8[v10];
    }
    goto LABEL_46;
  }
  id v12 = [v7 objectForKey:@"RTPersistentStoreMetadataStoreImportKey"];
  char v13 = [v12 BOOLValue];

  if ((v13 & 1) == 0)
  {
    id v9 = [(RTPersistenceMigrator *)self __findCandidateStoresForImportStepWithStore:WeakRetained];
    if (!v9)
    {
      unint64_t v11 = 2;
LABEL_47:

      goto LABEL_48;
    }
    v63 = v6;
    id v66 = v4;
    uint64_t v15 = [WeakRetained storeDescription];
    uint64_t v16 = (void *)[v15 copy];

    [v16 setURL:v9];
    v65 = v16;
    unint64_t v17 = [[RTPersistenceStore alloc] initWithStoreDescription:v16];
    v68 = (void *)[objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v5];
    int v18 = [WeakRetained storeDescription];
    id v19 = (void *)[v18 copy];

    uint64_t v20 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v21 = [v20 UUIDString];

    uint64_t v22 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v23 = NSTemporaryDirectory();
    id v24 = [v22 fileURLWithPath:v23];
    v62 = (void *)v21;
    __int16 v25 = [v24 URLByAppendingPathComponent:v21];
    __int16 v26 = [v25 URLByAppendingPathExtension:@"sqlite"];
    [v19 setURL:v26];

    v67 = v19;
    uint64_t v27 = [[RTPersistenceStore alloc] initWithStoreDescription:v19];
    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v5];
    id v29 = v17;
    unint64_t v30 = [(RTPersistenceMigrator *)self __prepareImportStepWithSourceStore:v17 sourceCoordinator:v68 destinationStore:v27 destinationCoordinator:v28 model:v5 allowMigration:1];
    v64 = v17;
    if (v30 != 0x8000000000000008)
    {
      unint64_t v11 = v30;
      if (v30 == 8)
      {
        id v31 = v27;
        id v4 = v66;
        uint64_t v32 = v68;
      }
      else
      {
        uint64_t v32 = v68;
        [(RTPersistenceMigrator *)self __cleanupAfterImportWithStore:v17 coordinator:v68];
        [(RTPersistenceMigrator *)self __cleanupAfterImportWithStore:v27 coordinator:v28];
        id v31 = v27;
        id v4 = v66;
      }
      id v34 = v62;
      char v6 = v63;
      goto LABEL_45;
    }
    v60 = v28;
    unint64_t v33 = [(RTPersistenceMigrator *)self __executeImportStepWithSourceStore:v17 sourceCoordinator:v68 destinationStore:v27 destinationCoordinator:v28 model:v5];
    if (v33 != 0x8000000000000008)
    {
      unint64_t v11 = v33;
      char v6 = v63;
      if (v33 != 8)
      {
        v45 = v29;
        uint64_t v32 = v68;
        [(RTPersistenceMigrator *)self __cleanupAfterImportWithStore:v45 coordinator:v68];
        [(RTPersistenceMigrator *)self __cleanupAfterImportWithStore:v27 coordinator:v28];
        id v31 = v27;
        id v4 = v66;
        id v34 = v62;
LABEL_45:

        v7 = v65;
LABEL_46:

        goto LABEL_47;
      }
      id v31 = v27;
      id v4 = v66;
      uint64_t v32 = v68;
      id v34 = v62;
LABEL_44:
      uint64_t v28 = v60;
      goto LABEL_45;
    }
    id v72 = 0;
    char v6 = v63;
    [WeakRetained removeFromCoordinator:v63 error:&v72];
    id v58 = v72;
    int v54 = [WeakRetained URL];
    v57 = [WeakRetained storeDescription];
    __int16 v53 = [v57 options];
    v52 = [v67 URL];
    int v36 = [v67 options];
    uint64_t v37 = *MEMORY[0x1E4F1BF70];
    id v71 = 0;
    v59 = v27;
    int v56 = [v68 replacePersistentStoreAtURL:v54 destinationOptions:v53 withPersistentStoreFromURL:v52 sourceOptions:v36 storeType:v37 error:&v71];
    id v55 = v71;

    [(RTPersistenceMigrator *)self __cleanupAfterImportWithStore:v29 coordinator:v68];
    [(RTPersistenceMigrator *)self __cleanupAfterImportWithStore:v27 coordinator:v28];
    unint64_t v11 = 0;
    if (v56)
    {
      id v4 = v66;
      uint64_t v38 = v55;
      if (!v55)
      {
        id v70 = 0;
        int v39 = [WeakRetained addToCoordinator:v63 lightweightMigration:0 vacuum:0 allowMirroring:0 error:&v70];
        id v40 = v70;
        uint64_t v41 = v40;
        if (!v39 || v40)
        {
          uint64_t v46 = [v40 code];
          uint64_t v47 = (const char *)v46;
          if ((unint64_t)(v46 - 2) < 2) {
            goto LABEL_34;
          }
          if (v46 == 1)
          {
            unint64_t v11 = 0;
LABEL_42:

            goto LABEL_43;
          }
          if (v46)
          {
            uint64_t v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              uint64_t v51 = [v41 code];
              *(_DWORD *)buf = 134218498;
              uint64_t v77 = v51;
              __int16 v78 = 2080;
              v79 = "-[RTPersistenceMigrator _executeImportStep]";
              __int16 v80 = 1024;
              int v81 = 946;
              _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
            }
            unint64_t v11 = 8;
          }
          else
          {
LABEL_34:
            uint64_t v43 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              v61 = [WeakRetained URL];
              v48 = [v61 lastPathComponent];
              *(_DWORD *)buf = 138412546;
              uint64_t v77 = (uint64_t)v48;
              __int16 v78 = 2048;
              v79 = v47;
              _os_log_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_INFO, "store %@, could not be opened after import, code, %ld", buf, 0x16u);
            }
            unint64_t v11 = 5;
          }
        }
        else
        {
          v74 = @"RTPersistentStoreMetadataStoreImportKey";
          uint64_t v75 = MEMORY[0x1E4F1CC38];
          v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
          id v69 = 0;
          [WeakRetained updateMetadata:v42 coordinator:v63 error:&v69];
          uint64_t v43 = v69;

          if (v43 && (unint64_t)[v43 code] >= 4)
          {
            v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              uint64_t v50 = [v43 code];
              *(_DWORD *)buf = 134218498;
              uint64_t v77 = v50;
              __int16 v78 = 2080;
              v79 = "-[RTPersistenceMigrator _executeImportStep]";
              __int16 v80 = 1024;
              int v81 = 965;
              _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
            }
          }
          unint64_t v11 = 2;
        }

        id v4 = v66;
        goto LABEL_42;
      }
    }
    else
    {
      id v4 = v66;
      uint64_t v38 = v55;
    }
LABEL_43:

    uint64_t v32 = v68;
    id v34 = v62;
    id v31 = v59;
    goto LABEL_44;
  }
  unint64_t v11 = 2;
LABEL_48:

  return v11;
}

- (id)__findCandidateStoresForImportStepWithStore:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [v3 URL];
      char v6 = [v5 lastPathComponent];
      *(_DWORD *)buf = 138412290;
      uint64_t v46 = v6;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "store, %@, migration step, import", buf, 0xCu);
    }
    v7 = [v3 storeURLsMatchingStoreName];
    id v8 = [MEMORY[0x1E4F28CB8] sortFilesByName:v7];

    if ([v8 count])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v39 = v8;
        id v40 = v3;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v42 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                uint64_t v16 = [v14 path];
                unint64_t v17 = [v16 lastPathComponent];
                *(_DWORD *)buf = 138412290;
                uint64_t v46 = v17;
                _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "import candidate found, %@", buf, 0xCu);
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v41 objects:v50 count:16];
          }
          while (v11);
        }

        id v8 = v39;
        id v3 = v40;
      }
      int v18 = [v8 lastObject];
      id v19 = (void *)MEMORY[0x1E4F28CB8];
      v49[0] = v18;
      uint64_t v20 = [v3 URL];
      v49[1] = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
      uint64_t v22 = [v19 sortFilesByName:v21];

      uint64_t v23 = [v22 lastObject];
      id v24 = [v3 URL];
      char v25 = [v23 isEqual:v24];

      __int16 v26 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
      if (v25)
      {
        if (v27)
        {
          uint64_t v28 = [v18 path];
          id v29 = [v28 lastPathComponent];
          *(_DWORD *)buf = 138412290;
          uint64_t v46 = v29;
          _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "choosing store with path %@ to import", buf, 0xCu);
        }
        unint64_t v30 = v18;
      }
      else
      {
        if (v27)
        {
          unint64_t v33 = [v18 path];
          id v34 = [v33 lastPathComponent];
          uint64_t v35 = [v3 URL];
          int v36 = [v35 path];
          uint64_t v37 = [v36 lastPathComponent];
          *(_DWORD *)buf = 138412546;
          uint64_t v46 = v34;
          __int16 v47 = 2112;
          v48 = v37;
          _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "import candidate, %@ is a later version that the current version, %@, skipping import.", buf, 0x16u);
        }
        unint64_t v30 = 0;
      }
    }
    else
    {
      int v18 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v31 = [v3 URL];
        uint64_t v32 = [v31 lastPathComponent];
        *(_DWORD *)buf = 138412290;
        uint64_t v46 = v32;
        _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "no import candidates found for store, %@", buf, 0xCu);
      }
      unint64_t v30 = 0;
    }
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationStore", buf, 2u);
    }
    unint64_t v30 = 0;
  }

  return v30;
}

- (unint64_t)__prepareImportStepWithSourceStore:(id)a3 sourceCoordinator:(id)a4 destinationStore:(id)a5 destinationCoordinator:(id)a6 model:(id)a7 allowMigration:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  int v18 = v17;
  if (!v13)
  {
    uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v26 = "Invalid parameter not satisfying: sourceStore";
      goto LABEL_44;
    }
LABEL_20:
    unint64_t v25 = 2;
    goto LABEL_21;
  }
  if (!v14)
  {
    uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v26 = "Invalid parameter not satisfying: sourceCoordinator";
      goto LABEL_44;
    }
    goto LABEL_20;
  }
  if (!v15)
  {
    uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v26 = "Invalid parameter not satisfying: destinationStore";
      goto LABEL_44;
    }
    goto LABEL_20;
  }
  if (!v16)
  {
    uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v26 = "Invalid parameter not satisfying: destinationCoordinator";
      goto LABEL_44;
    }
    goto LABEL_20;
  }
  if (!v17)
  {
    uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    __int16 v26 = "Invalid parameter not satisfying: model";
LABEL_44:
    unint64_t v25 = 2;
    _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_21;
  }
  id v40 = 0;
  int v19 = [v13 addToCoordinator:v14 lightweightMigration:v8 vacuum:0 allowMirroring:0 error:&v40];
  uint64_t v20 = v40;
  uint64_t v21 = v20;
  if (v19 && !v20)
  {
    id v39 = 0;
    int v22 = [v15 addToCoordinator:v16 lightweightMigration:v8 vacuum:0 allowMirroring:0 error:&v39];
    uint64_t v23 = v39;
    id v24 = v23;
    if (v22 && !v23)
    {
      unint64_t v25 = 0x8000000000000008;
LABEL_42:

      goto LABEL_21;
    }
    uint64_t v32 = [v23 code];
    unint64_t v33 = (const char *)v32;
    if ((unint64_t)(v32 - 2) < 2) {
      goto LABEL_31;
    }
    if (v32 != 1)
    {
      if (v32)
      {
        id v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = [v24 code];
          *(_DWORD *)buf = 134218498;
          uint64_t v42 = v37;
          __int16 v43 = 2080;
          long long v44 = "-[RTPersistenceMigrator __prepareImportStepWithSourceStore:sourceCoordinator:destinationStore:destinatio"
                "nCoordinator:model:allowMigration:]";
          __int16 v45 = 1024;
          int v46 = 1083;
          _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
        }
        unint64_t v25 = 8;
        goto LABEL_41;
      }
LABEL_31:
      id v34 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        uint64_t v38 = [v13 URL];
        uint64_t v35 = [v38 lastPathComponent];
        *(_DWORD *)buf = 138412546;
        uint64_t v42 = (uint64_t)v35;
        __int16 v43 = 2048;
        long long v44 = v33;
        _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "destination store %@, could not be prepared for import, code, %ld", buf, 0x16u);
      }
      unint64_t v25 = 2;
LABEL_41:

      goto LABEL_42;
    }
LABEL_37:
    unint64_t v25 = 8;
    goto LABEL_42;
  }
  uint64_t v28 = [v20 code];
  id v29 = (const char *)v28;
  if ((unint64_t)(v28 - 2) < 2)
  {
LABEL_25:
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      unint64_t v30 = [v13 URL];
      id v31 = [v30 lastPathComponent];
      *(_DWORD *)buf = 138412546;
      uint64_t v42 = (uint64_t)v31;
      __int16 v43 = 2048;
      long long v44 = v29;
      _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "source store %@, could not be prepared for import, code, %ld", buf, 0x16u);
    }
    unint64_t v25 = 2;
    goto LABEL_42;
  }
  if (v28 != 1)
  {
    if (v28)
    {
      id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = [v21 code];
        *(_DWORD *)buf = 134218498;
        uint64_t v42 = v36;
        __int16 v43 = 2080;
        long long v44 = "-[RTPersistenceMigrator __prepareImportStepWithSourceStore:sourceCoordinator:destinationStore:destinationC"
              "oordinator:model:allowMigration:]";
        __int16 v45 = 1024;
        int v46 = 1052;
        _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
      }
      goto LABEL_37;
    }
    goto LABEL_25;
  }
  unint64_t v25 = 8;
LABEL_21:

  return v25;
}

- (unint64_t)__executeImportStepWithSourceStore:(id)a3 sourceCoordinator:(id)a4 destinationStore:(id)a5 destinationCoordinator:(id)a6 model:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v16;
  if (!v12)
  {
    id WeakRetained = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v24 = "Invalid parameter not satisfying: sourceStore";
      goto LABEL_25;
    }
LABEL_18:
    unint64_t v23 = 2;
    goto LABEL_19;
  }
  if (!v13)
  {
    id WeakRetained = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v24 = "Invalid parameter not satisfying: sourceCoordinator";
      goto LABEL_25;
    }
    goto LABEL_18;
  }
  if (!v14)
  {
    id WeakRetained = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v24 = "Invalid parameter not satisfying: destinationStore";
      goto LABEL_25;
    }
    goto LABEL_18;
  }
  if (!v15)
  {
    id WeakRetained = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v24 = "Invalid parameter not satisfying: destinationCoordinator";
      goto LABEL_25;
    }
    goto LABEL_18;
  }
  if (!v16)
  {
    id WeakRetained = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    id v24 = "Invalid parameter not satisfying: model";
LABEL_25:
    unint64_t v23 = 2;
    _os_log_error_impl(&dword_1D9BFA000, WeakRetained, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_19;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v19 = [v12 storeDescription];
  uint64_t v20 = [v19 configuration];
  id v27 = 0;
  int v21 = [WeakRetained importSourceStore:v12 sourceCoordinator:v13 destinationStore:v14 destinationCoordinator:v15 managedObjectModel:v17 configuration:v20 error:&v27];
  id v22 = v27;

  if (!v21 || v22)
  {
    __int16 v26 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v22;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "error during database import, %@", buf, 0xCu);
    }

    unint64_t v23 = 2;
  }
  else
  {
    unint64_t v23 = 0x8000000000000008;
  }

LABEL_19:
  return v23;
}

- (void)__cleanupAfterImportWithStore:(id)a3 coordinator:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v15 = 0;
  id v5 = a3;
  int v6 = [v5 removeFromCoordinator:a4 error:&v15];
  id v7 = v15;
  BOOL v8 = v7;
  if (!v6 || v7)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "error attempting to remove store from coordinator, %@", buf, 0xCu);
    }
  }
  uint64_t v10 = [v5 URL];
  id v14 = 0;
  int v11 = [v5 removeStoreAtURL:v10 error:&v14];

  id v12 = v14;
  if (!v11 || v12)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "error attempting to remove store from disk, %@", buf, 0xCu);
    }
  }
}

- (NSDate)migrationStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)migrationEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)didVacuumStore
{
  return self->_didVacuumStore;
}

- (RTPersistenceStore)store
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);

  return (RTPersistenceStore *)WeakRetained;
}

- (RTPersistenceModelProvider)modelProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modelProvider);

  return (RTPersistenceModelProvider *)WeakRetained;
}

- (RTPersistenceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RTPersistenceDelegate *)WeakRetained;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (NSManagedObjectModel)nextModel
{
  return self->_nextModel;
}

- (void)setNextModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_modelProvider);
  objc_destroyWeak((id *)&self->_store);
  objc_storeStrong((id *)&self->_migrationEndDate, 0);
  objc_storeStrong((id *)&self->_migrationStartDate, 0);

  objc_storeStrong((id *)&self->_cachedCoordinator, 0);
}

@end