@interface REMDatabaseMigrationContext
- (BOOL)_cleanLocalDatabases:(id *)a3;
- (BOOL)ensureAccountsExist:(id *)a3;
- (BOOL)ensureAccountsExist:(id)a3 error:(id *)a4;
- (BOOL)ensureAccountsExistWithMigrationAccountInfos:(id)a3 error:(id *)a4;
- (BOOL)hasPerformedEnsureAccountsExist;
- (BOOL)isDatabaseMigrated;
- (BOOL)shouldDeleteMigratedData;
- (NSDate)migrationStartDate;
- (NSError)lastReportedError;
- (NSString)lastReportedErrorIdentifier;
- (REMDatabaseMigrationContext)init;
- (REMDatabaseMigrationContext)initWithSandboxDatabaseEnabled:(BOOL)a3;
- (REMStore)cachedStore;
- (REMStoreContainerToken)containerToken;
- (id)_migrationAccountInfosFromDEPRECATEDInfoDictionaryList:(id)a3;
- (id)remStore;
- (unint64_t)lastReportedErrorStage;
- (void)_diagnosticReportWithStage:(unint64_t)a3 failureIdentifier:(id)a4 error:(id)a5;
- (void)_postMigrationLocalAccountCleanup;
- (void)dealloc;
- (void)destroySandboxContainerIfNecessary;
- (void)reportMigrationDidFinishWithSuccess:(BOOL)a3;
- (void)reportMigrationErrorWithIdentifier:(id)a3 atStage:(unint64_t)a4 error:(id)a5 objectLocator:(id)a6;
- (void)reportMigrationWillBegin;
- (void)setCachedStore:(id)a3;
- (void)setContainerToken:(id)a3;
- (void)setHasPerformedEnsureAccountsExist:(BOOL)a3;
- (void)setIsDatabaseMigrated:(BOOL)a3;
- (void)setLastReportedError:(id)a3;
- (void)setLastReportedErrorIdentifier:(id)a3;
- (void)setLastReportedErrorStage:(unint64_t)a3;
- (void)setMigrationStartDate:(id)a3;
- (void)setShouldDataAccessStopSyncingReminders:(BOOL)a3;
@end

@implementation REMDatabaseMigrationContext

- (REMDatabaseMigrationContext)init
{
  v3 = +[REMUserDefaults daemonUserDefaults];
  uint64_t v4 = [v3 databaseMigrationTestModeEnabled];

  return [(REMDatabaseMigrationContext *)self initWithSandboxDatabaseEnabled:v4];
}

- (REMDatabaseMigrationContext)initWithSandboxDatabaseEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)REMDatabaseMigrationContext;
  uint64_t v4 = [(REMDatabaseMigrationContext *)&v13 init];
  if (v4) {
    BOOL v5 = !v3;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    goto LABEL_7;
  }
  id v12 = 0;
  uint64_t v6 = +[REMStore createIsolatedStoreContainerWithError:&v12];
  id v7 = v12;
  containerToken = v4->_containerToken;
  v4->_containerToken = (REMStoreContainerToken *)v6;

  if (v4->_containerToken)
  {

LABEL_7:
    v9 = v4;
    goto LABEL_8;
  }
  v11 = +[REMLogStore write];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[REMDatabaseMigrationContext initWithSandboxDatabaseEnabled:]();
  }

  v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)shouldDeleteMigratedData
{
  v2 = [(REMDatabaseMigrationContext *)self containerToken];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)isDatabaseMigrated
{
  v2 = [(REMDatabaseMigrationContext *)self containerToken];

  if (v2)
  {
    BOOL v3 = +[REMSystemUtilities systemBuildVersion];
    uint64_t v4 = +[REMUserDefaults daemonUserDefaults];
    BOOL v5 = [v4 lastDatabaseMigrationSystemBuildVersion];
    char v6 = [v3 isEqual:v5];
  }
  else
  {
    BOOL v3 = +[REMUserDefaults daemonUserDefaults];
    char v6 = [v3 isDatabaseMigrated];
  }

  return v6;
}

- (void)setIsDatabaseMigrated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(REMDatabaseMigrationContext *)self containerToken];

  if (!v4)
  {
    id v5 = +[REMUserDefaults daemonUserDefaults];
    [v5 setIsDatabaseMigrated:v3];
  }
}

- (void)setShouldDataAccessStopSyncingReminders:(BOOL)a3
{
  BOOL v3 = [(REMDatabaseMigrationContext *)self containerToken];

  if (!v3)
  {
    id v4 = +[REMUserDefaults daemonUserDefaults];
    [v4 dataaccessDaemonStopSyncingReminders];
  }
}

- (id)remStore
{
  BOOL v3 = [(REMDatabaseMigrationContext *)self cachedStore];
  if (!v3)
  {
    id v4 = [(REMDatabaseMigrationContext *)self containerToken];
    if (v4)
    {
      id v5 = [REMStore alloc];
      char v6 = [(REMDatabaseMigrationContext *)self containerToken];
      BOOL v3 = [(REMStore *)v5 initWithStoreContainerToken:v6];
    }
    else
    {
      BOOL v3 = objc_alloc_init(REMStore);
    }

    [(REMStore *)v3 setMode:1];
    [(REMDatabaseMigrationContext *)self setCachedStore:v3];
  }
  id v7 = v3;

  return v7;
}

- (void)destroySandboxContainerIfNecessary
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Failed to destroy isolated store container for database migration {error: %{public}@}", v2, v3, v4, v5, v6);
}

- (void)dealloc
{
  [(REMDatabaseMigrationContext *)self destroySandboxContainerIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)REMDatabaseMigrationContext;
  [(REMDatabaseMigrationContext *)&v3 dealloc];
}

- (void)reportMigrationWillBegin
{
  objc_super v3 = +[REMLogStore write];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1B9AA2000, v3, OS_LOG_TYPE_DEFAULT, "Database Migration will begin", v5, 2u);
  }

  AnalyticsSendEvent();
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  [(REMDatabaseMigrationContext *)self setMigrationStartDate:v4];
}

- (void)reportMigrationErrorWithIdentifier:(id)a3 atStage:(unint64_t)a4 error:(id)a5 objectLocator:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = +[REMLogStore OVERSIZED];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    if (a4 - 1 > 5) {
      v14 = @"REMDatabaseMigrationContextStageUnknown";
    }
    else {
      v14 = off_1E61DD7C8[a4 - 1];
    }
    v15 = [v10 userInfo];
    v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F28228]];
    *(_DWORD *)buf = 138544130;
    id v20 = v9;
    __int16 v21 = 2114;
    v22 = v14;
    __int16 v23 = 2114;
    id v24 = v10;
    __int16 v25 = 2112;
    v26 = v16;
    _os_log_error_impl(&dword_1B9AA2000, v11, OS_LOG_TYPE_ERROR, "Migration Error {identifier: %{public}@, stage: %{public}@, error: %{public}@, error.debugDescription: %@}", buf, 0x2Au);
  }
  v18 = v10;
  v17 = v9;
  id v12 = v10;
  id v13 = v9;
  AnalyticsSendEventLazy();
  [(REMDatabaseMigrationContext *)self setLastReportedErrorIdentifier:v13];
  [(REMDatabaseMigrationContext *)self setLastReportedError:v12];
  [(REMDatabaseMigrationContext *)self setLastReportedErrorStage:a4];
}

id __94__REMDatabaseMigrationContext_reportMigrationErrorWithIdentifier_atStage_error_objectLocator___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"identifier"];
  objc_super v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  [v2 setObject:v3 forKeyedSubscript:@"stage"];

  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = [v4 domain];
    [v2 setObject:v5 forKeyedSubscript:@"errorDomain"];

    uint8_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
    [v2 setObject:v6 forKeyedSubscript:@"errorCode"];
  }

  return v2;
}

- (void)_postMigrationLocalAccountCleanup
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "_postMigrationLocalAccountCleanup: Failed to save account objects for local migration {error: %{public}@}", v2, v3, v4, v5, v6);
}

- (void)reportMigrationDidFinishWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(REMDatabaseMigrationContext *)self migrationStartDate];
  [v5 timeIntervalSinceNow];
  uint64_t v7 = v6;

  v8 = +[REMLogStore write];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    BOOL v21 = v3;
    __int16 v22 = 2048;
    uint64_t v23 = v7;
    _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_DEFAULT, "Database Migration did finish {success: %d, duration: %.2f}", buf, 0x12u);
  }

  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __67__REMDatabaseMigrationContext_reportMigrationDidFinishWithSuccess___block_invoke;
  v17 = &__block_descriptor_41_e19___NSDictionary_8__0l;
  LOBYTE(v19) = v3;
  uint64_t v18 = v7;
  AnalyticsSendEventLazy();
  if (!v3)
  {
    unint64_t v9 = [(REMDatabaseMigrationContext *)self lastReportedErrorStage];
    id v10 = [(REMDatabaseMigrationContext *)self lastReportedErrorIdentifier];
    v11 = [(REMDatabaseMigrationContext *)self lastReportedError];
    [(REMDatabaseMigrationContext *)self _diagnosticReportWithStage:v9 failureIdentifier:v10 error:v11];
  }
  -[REMDatabaseMigrationContext setIsDatabaseMigrated:](self, "setIsDatabaseMigrated:", 1, v14, v15, v16, v17, v18, v19);
  [(REMDatabaseMigrationContext *)self setShouldDataAccessStopSyncingReminders:1];
  id v12 = +[REMUserDefaults daemonUserDefaults];
  id v13 = +[REMSystemUtilities systemBuildVersion];
  [v12 setLastDatabaseMigrationSystemBuildVersion:v13];

  [(REMDatabaseMigrationContext *)self _postMigrationLocalAccountCleanup];
}

id __67__REMDatabaseMigrationContext_reportMigrationDidFinishWithSuccess___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"success";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v6[1] = @"duration";
  v7[0] = v2;
  BOOL v3 = [NSNumber numberWithDouble:fabs(*(double *)(a1 + 32))];
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)_diagnosticReportWithStage:(unint64_t)a3 failureIdentifier:(id)a4 error:(id)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  v8 = (objc_class *)MEMORY[0x1E4FA8AF0];
  id v9 = a4;
  id v10 = objc_alloc_init(v8);
  if (a3 - 1 > 5) {
    v11 = @"REMDatabaseMigrationContextStageUnknown";
  }
  else {
    v11 = off_1E61DD7C8[a3 - 1];
  }
  id v12 = [MEMORY[0x1E4F28F80] processInfo];
  id v13 = [v12 processName];
  uint64_t v14 = [v10 signatureWithDomain:@"ReminderKit" type:@"EventKitMigration" subType:v11 subtypeContext:v9 detectedProcess:v13 triggerThresholdValues:0];

  if (v7)
  {
    v18[0] = @"errorDomain";
    uint64_t v15 = [v7 domain];
    v18[1] = @"errorCode";
    v19[0] = v15;
    v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "code"));
    v19[1] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    v17 = 0;
  }
  [v10 snapshotWithSignature:v14 duration:v17 event:0 payload:&__block_literal_global_18 reply:0.0];
}

void __82__REMDatabaseMigrationContext__diagnosticReportWithStage_failureIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = +[REMLogStore write];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1B9AA2000, v3, OS_LOG_TYPE_DEFAULT, "AutoBugCapture did reply {response: %@}", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)ensureAccountsExistWithMigrationAccountInfos:(id)a3 error:(id *)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(REMDatabaseMigrationContext *)self hasPerformedEnsureAccountsExist])
  {
    BOOL v7 = 1;
    goto LABEL_49;
  }
  if ([(REMDatabaseMigrationContext *)self isDatabaseMigrated])
  {
    v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v9 = "ensureAccountsExist: There is no need to clean local database before we ensure accounts exist for local migration.";
LABEL_8:
      _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
    }
  }
  else
  {
    [(REMDatabaseMigrationContext *)self _cleanLocalDatabases:a4];
    v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v9 = "ensureAccountsExist: Finished calling [_cleanLocalDatabases]";
      goto LABEL_8;
    }
  }

  [(REMDatabaseMigrationContext *)self setHasPerformedEnsureAccountsExist:1];
  if ([v6 count])
  {
    v39 = a4;
    id v10 = [(REMDatabaseMigrationContext *)self remStore];
    v42 = [[REMSaveRequest alloc] initWithStore:v10];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v40 = v6;
    id obj = v6;
    uint64_t v11 = [obj countByEnumeratingWithState:&v49 objects:v62 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v50;
      uint64_t v44 = *(void *)v50;
      v41 = v10;
      do
      {
        uint64_t v14 = 0;
        uint64_t v45 = v12;
        do
        {
          if (*(void *)v50 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v49 + 1) + 8 * v14);
          uint64_t v16 = [v15 type];
          v17 = +[REMLogStore write];
          BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
          if (v16 == 1)
          {
            if (v18)
            {
              uint64_t v19 = [v15 identifier];
              id v20 = [v15 name];
              *(_DWORD *)buf = 138543618;
              v57 = v19;
              __int16 v58 = 2112;
              v59 = v20;
              _os_log_impl(&dword_1B9AA2000, v17, OS_LOG_TYPE_INFO, "ensureAccountsExist: Local account is ignored {accountID: %{public}@, name: %@}", buf, 0x16u);
            }
          }
          else
          {
            if (v18)
            {
              BOOL v21 = [v15 identifier];
              __int16 v22 = [v15 name];
              uint64_t v23 = [v15 type];
              *(_DWORD *)buf = 138543874;
              v57 = v21;
              __int16 v58 = 2112;
              v59 = v22;
              __int16 v60 = 2048;
              uint64_t v61 = v23;
              _os_log_impl(&dword_1B9AA2000, v17, OS_LOG_TYPE_INFO, "ensureAccountsExist: About to add account per request {accountID: %{public}@, name: %@, type: %ld}", buf, 0x20u);

              uint64_t v13 = v44;
            }

            uint64_t v24 = [v15 identifier];
            id v48 = 0;
            __int16 v25 = v10;
            v26 = [v10 fetchAccountWithExternalIdentifier:v24 error:&v48];
            v17 = v48;

            if (v26)
            {
              uint64_t v27 = +[REMLogStore write];
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                -[REMDatabaseMigrationContext ensureAccountsExistWithMigrationAccountInfos:error:].cold.4((uint64_t)v55, (uint64_t)v15);
              }
            }
            else
            {
              uint64_t v27 = [v15 name];
              id v28 = objc_alloc(MEMORY[0x1E4F29128]);
              v29 = [v15 identifier];
              v30 = (void *)[v28 initWithUUIDString:v29];

              if (v30)
              {
                v43 = v30;
                v31 = +[REMAccount objectIDWithUUID:v30];
                v32 = -[REMSaveRequest __addAccountWithType:name:accountObjectID:](v42, "__addAccountWithType:name:accountObjectID:", [v15 type], v27, v31);
                if ([v15 isCloudKit])
                {
                  v33 = +[REMLogStore write];
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                    -[REMDatabaseMigrationContext ensureAccountsExistWithMigrationAccountInfos:error:]((uint64_t)v53, (uint64_t)v15);
                  }
                }
                else
                {
                  v33 = [v15 identifier];
                  [v32 setExternalIdentifier:v33];
                }

                __int16 v25 = v41;
                uint64_t v13 = v44;
                v30 = v43;
              }
              else
              {
                v31 = +[REMLogStore write];
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                  -[REMDatabaseMigrationContext ensureAccountsExistWithMigrationAccountInfos:error:]((uint64_t)v54, (uint64_t)v15);
                }
                uint64_t v13 = v44;
              }
            }
            uint64_t v12 = v45;
            id v10 = v25;
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [obj countByEnumeratingWithState:&v49 objects:v62 count:16];
      }
      while (v12);
    }

    v34 = +[REMLogStore write];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9AA2000, v34, OS_LOG_TYPE_INFO, "ensureAccountsExist: About to save pending changes to our database", buf, 2u);
    }

    id v47 = 0;
    [(REMSaveRequest *)v42 saveSynchronouslyWithError:&v47];
    id v35 = v47;
    v36 = v35;
    BOOL v7 = v35 == 0;
    if (v35)
    {
      if (v39) {
        id *v39 = v35;
      }
      v37 = +[REMLogStore write];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        -[REMDatabaseMigrationContext ensureAccountsExistWithMigrationAccountInfos:error:]();
      }
    }
    id v6 = v40;
  }
  else
  {
    id v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9AA2000, v10, OS_LOG_TYPE_DEFAULT, "ensureAccountsExist: There's no input account info. There's nothing we need to do.", buf, 2u);
    }
    BOOL v7 = 1;
  }

LABEL_49:
  return v7;
}

- (BOOL)ensureAccountsExist:(id)a3 error:(id *)a4
{
  id v6 = [(REMDatabaseMigrationContext *)self _migrationAccountInfosFromDEPRECATEDInfoDictionaryList:a3];
  LOBYTE(a4) = [(REMDatabaseMigrationContext *)self ensureAccountsExistWithMigrationAccountInfos:v6 error:a4];

  return (char)a4;
}

- (BOOL)ensureAccountsExist:(id *)a3
{
  BOOL v3 = +[REMLogStore write];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[REMDatabaseMigrationContext ensureAccountsExist:](v3);
  }

  return 0;
}

- (id)_migrationAccountInfosFromDEPRECATEDInfoDictionaryList:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    uint64_t v26 = 1;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v27 + 1) + 8 * v7);
        uint64_t v9 = objc_opt_class();
        id v10 = [v8 objectForKey:@"identifier"];
        uint64_t v11 = REMDynamicCast(v9, (uint64_t)v10);

        uint64_t v12 = objc_opt_class();
        uint64_t v13 = [v8 objectForKey:@"name"];
        uint64_t v14 = REMDynamicCast(v12, (uint64_t)v13);

        uint64_t v15 = objc_opt_class();
        uint64_t v16 = [v8 objectForKey:@"type"];
        v17 = REMDynamicCast(v15, (uint64_t)v16);

        if (!v11)
        {
          BOOL v18 = +[REMLogStore write];
          if (!os_log_type_enabled(&v18->super, OS_LOG_TYPE_ERROR)) {
            goto LABEL_12;
          }
          uint64_t v19 = [NSNumber numberWithUnsignedInteger:v26];
          *(_DWORD *)buf = 138543618;
          v32 = v19;
          __int16 v33 = 2112;
          v34 = v8;
          p_super = &v18->super;
          BOOL v21 = "ensureAccountsExist: Given account info #(%{public}@) does not contain an identifier: %@";
          goto LABEL_15;
        }
        if (v17)
        {
          BOOL v18 = -[REMDatabaseMigrationAccountInfo initWithAccountType:identifier:name:]([REMDatabaseMigrationAccountInfo alloc], "initWithAccountType:identifier:name:", [v17 unsignedIntegerValue], v11, v14);
          [v24 addObject:v18];
          ++v26;
          goto LABEL_12;
        }
        BOOL v18 = +[REMLogStore write];
        if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = [NSNumber numberWithUnsignedInteger:v26];
          *(_DWORD *)buf = 138543618;
          v32 = v19;
          __int16 v33 = 2112;
          v34 = v8;
          p_super = &v18->super;
          BOOL v21 = "ensureAccountsExist: Given account info #(%{public}@) does not contain an account type: %@";
LABEL_15:
          _os_log_error_impl(&dword_1B9AA2000, p_super, OS_LOG_TYPE_ERROR, v21, buf, 0x16u);
        }
LABEL_12:

        ++v7;
      }
      while (v5 != v7);
      uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
      uint64_t v5 = v22;
    }
    while (v22);
  }

  return v24;
}

- (BOOL)_cleanLocalDatabases:(id *)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(REMDatabaseMigrationContext *)self remStore];
  id v60 = 0;
  uint64_t v5 = [v4 fetchAccountsIncludingInactive:1 error:&v60];
  id v6 = v60;
  if (v6)
  {
    uint64_t v7 = v6;
    if (a3) {
      *a3 = v6;
    }
    long long v49 = +[REMLogStore write];
    if (os_log_type_enabled(&v49->super, OS_LOG_TYPE_ERROR)) {
      -[REMDatabaseMigrationContext _cleanLocalDatabases:]();
    }
    BOOL v8 = 0;
    goto LABEL_47;
  }
  long long v49 = [[REMSaveRequest alloc] initWithStore:v4];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v56 objects:v69 count:16];
  BOOL v8 = v10 == 0;
  if (!v10)
  {
    id v38 = 0;
    goto LABEL_45;
  }
  id v40 = a3;
  BOOL v41 = v10 == 0;
  v42 = v5;
  v43 = v4;
  char v11 = 0;
  uint64_t v7 = 0;
  uint64_t v12 = *(void *)v57;
  uint64_t v13 = &off_1E61DB000;
  uint64_t v14 = v10;
  uint64_t v44 = *(void *)v57;
  uint64_t v45 = v9;
  do
  {
    uint64_t v15 = 0;
    uint64_t v46 = v14;
    do
    {
      if (*(void *)v57 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v48 = v15;
      uint64_t v16 = *(void **)(*((void *)&v56 + 1) + 8 * v15);
      v17 = [v16 accountTypeHost];
      BOOL v18 = v17;
      if (([v17 isCalDav] & 1) != 0 || objc_msgSend(v17, "isExchange"))
      {
        uint64_t v19 = [v13[258] write];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v32 = [v16 name];
          __int16 v33 = [v16 objectID];
          v34 = [v16 externalIdentifier];
          *(_DWORD *)buf = 138412802;
          v64 = v32;
          __int16 v65 = 2114;
          v66 = v33;
          __int16 v67 = 2114;
          v68 = v34;
          _os_log_error_impl(&dword_1B9AA2000, v19, OS_LOG_TYPE_ERROR, "REMDatabaseMigrationContext found existing CalDAV account locally before migration, deleting store: {name: %@, id: %{public}@, externalIdentifier: %{public}@}", buf, 0x20u);

          v17 = v18;
          uint64_t v14 = v46;
        }

        id v20 = [(REMSaveRequest *)v49 updateAccount:v16];
        [v20 removeFromStore];
        char v11 = 1;
LABEL_17:

        goto LABEL_18;
      }
      if ([v17 isLocal])
      {
        BOOL v21 = [v13[258] write];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[REMDatabaseMigrationContext _cleanLocalDatabases:]((uint64_t)v62, (uint64_t)v16);
        }

        id v55 = v7;
        uint64_t v22 = [v16 fetchListsWithError:&v55];
        id v47 = v55;

        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v20 = v22;
        uint64_t v23 = [v20 countByEnumeratingWithState:&v51 objects:v61 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v52 != v25) {
                objc_enumerationMutation(v20);
              }
              long long v27 = *(void **)(*((void *)&v51 + 1) + 8 * i);
              long long v28 = [v27 objectID];
              long long v29 = +[REMList localAccountDefaultListID];
              char v30 = [v28 isEqual:v29];

              if ((v30 & 1) == 0)
              {
                v31 = [(REMSaveRequest *)v49 updateList:v27];
                [v31 removeFromParent];

                char v11 = 1;
              }
            }
            v17 = v18;
            uint64_t v24 = [v20 countByEnumeratingWithState:&v51 objects:v61 count:16];
          }
          while (v24);
        }

        uint64_t v14 = v46;
        uint64_t v7 = v47;
        uint64_t v13 = &off_1E61DB000;
        uint64_t v12 = v44;
        uint64_t v9 = v45;
        goto LABEL_17;
      }
LABEL_18:

      uint64_t v15 = v48 + 1;
    }
    while (v48 + 1 != v14);
    uint64_t v35 = [v9 countByEnumeratingWithState:&v56 objects:v69 count:16];
    uint64_t v14 = v35;
  }
  while (v35);

  if (v11)
  {
    uint64_t v36 = [v13[258] write];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9AA2000, v36, OS_LOG_TYPE_INFO, "_cleanLocalDatabases saving changes", buf, 2u);
    }

    id v50 = v7;
    BOOL v37 = [(REMSaveRequest *)v49 saveSynchronouslyWithError:&v50];
    id v38 = v50;

    uint64_t v5 = v42;
    uint64_t v4 = v43;
    BOOL v8 = v41;
    if (v37)
    {
      BOOL v8 = 1;
      goto LABEL_46;
    }
    if (v40) {
      *id v40 = v38;
    }
    uint64_t v9 = +[REMLogStore write];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[REMDatabaseMigrationContext _cleanLocalDatabases:]();
    }
LABEL_45:

LABEL_46:
    uint64_t v7 = v38;
  }
  else
  {
    BOOL v8 = 1;
    uint64_t v5 = v42;
    uint64_t v4 = v43;
  }
LABEL_47:

  return v8;
}

- (REMStoreContainerToken)containerToken
{
  return self->_containerToken;
}

- (void)setContainerToken:(id)a3
{
}

- (REMStore)cachedStore
{
  return self->_cachedStore;
}

- (void)setCachedStore:(id)a3
{
}

- (NSDate)migrationStartDate
{
  return self->_migrationStartDate;
}

- (void)setMigrationStartDate:(id)a3
{
}

- (BOOL)hasPerformedEnsureAccountsExist
{
  return self->_hasPerformedEnsureAccountsExist;
}

- (void)setHasPerformedEnsureAccountsExist:(BOOL)a3
{
  self->_hasPerformedEnsureAccountsExist = a3;
}

- (NSString)lastReportedErrorIdentifier
{
  return self->_lastReportedErrorIdentifier;
}

- (void)setLastReportedErrorIdentifier:(id)a3
{
}

- (unint64_t)lastReportedErrorStage
{
  return self->_lastReportedErrorStage;
}

- (void)setLastReportedErrorStage:(unint64_t)a3
{
  self->_lastReportedErrorStage = a3;
}

- (NSError)lastReportedError
{
  return self->_lastReportedError;
}

- (void)setLastReportedError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReportedError, 0);
  objc_storeStrong((id *)&self->_lastReportedErrorIdentifier, 0);
  objc_storeStrong((id *)&self->_migrationStartDate, 0);
  objc_storeStrong((id *)&self->_cachedStore, 0);

  objc_storeStrong((id *)&self->_containerToken, 0);
}

- (void)initWithSandboxDatabaseEnabled:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Failed to create isolated store container for database migration {error: %{public}@}", v2, v3, v4, v5, v6);
}

- (void)ensureAccountsExistWithMigrationAccountInfos:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Failed to save account objects for local migration {error: %{public}@}", v2, v3, v4, v5, v6);
}

- (void)ensureAccountsExistWithMigrationAccountInfos:(uint64_t)a1 error:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(a1, a2), "identifier");
  OUTLINED_FUNCTION_4_4((uint64_t)v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_4(&dword_1B9AA2000, v3, v4, "ensureAccountsExist: Invalid UUID. Skip. {uuid: %{public}@}");
}

- (void)ensureAccountsExistWithMigrationAccountInfos:(uint64_t)a1 error:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(a1, a2), "identifier");
  OUTLINED_FUNCTION_4_4((uint64_t)v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_4(&dword_1B9AA2000, v3, v4, "ensureAccountsExist: CloudKit account type is not expected. {uuid: %{public}@}");
}

- (void)ensureAccountsExistWithMigrationAccountInfos:(uint64_t)a1 error:(uint64_t)a2 .cold.4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(a1, a2), "identifier");
  OUTLINED_FUNCTION_4_4((uint64_t)v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_4(&dword_1B9AA2000, v3, v4, "ensureAccountsExist: Found unexpected existing account with external identifier we are about to use for creating new account {uuid: %{public}@}");
}

- (void)ensureAccountsExist:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "ensureAccountsExist: Decommissioned [REMDatabaseMigrationContext ensureAccountsExist:] called. Migration will not work.", v1, 2u);
}

- (void)_cleanLocalDatabases:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Failed to remove existing accounts when trying to clear local database before we can create clean ones for local migration {error: %{public}@}", v2, v3, v4, v5, v6);
}

- (void)_cleanLocalDatabases:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(a1, a2), "objectID");
  OUTLINED_FUNCTION_4_4((uint64_t)v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_4(&dword_1B9AA2000, v3, v4, "REMDatabaseMigrationContext found existing local account locally before migration, emptying content: {id: %{public}@}");
}

- (void)_cleanLocalDatabases:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Failed to fetch existing accounts when trying to clear local database before we can create clean ones for local migration {error: %{public}@}", v2, v3, v4, v5, v6);
}

@end