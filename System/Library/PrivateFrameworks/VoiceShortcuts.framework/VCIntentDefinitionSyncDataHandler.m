@interface VCIntentDefinitionSyncDataHandler
+ (int)messageType;
- (BOOL)applyChanges:(id)a3 fromSyncService:(id)a4 error:(id *)a5;
- (BOOL)deleteSyncedData:(id *)a3;
- (BOOL)markChangesAsSynced:(id)a3 withSyncService:(id)a4 metadata:(id)a5 error:(id *)a6;
- (BOOL)resetSyncStateForService:(id)a3 error:(id *)a4;
- (SwiftVCDaemonXPCEventHandler)eventHandler;
- (VCIntentDefinitionSyncDataHandler)initWithEventHandler:(id)a3;
- (id)unsyncedChangesForSyncService:(id)a3 metadata:(id *)a4 error:(id *)a5;
- (void)dealloc;
- (void)installedApplicationsDidChange:(id)a3;
@end

@implementation VCIntentDefinitionSyncDataHandler

- (void).cxx_destruct
{
}

- (SwiftVCDaemonXPCEventHandler)eventHandler
{
  return self->_eventHandler;
}

- (BOOL)deleteSyncedData:(id *)a3
{
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = WFSyncedDefinitionDirectoryURL();
  id v10 = 0;
  char v6 = [v4 removeItemAtURL:v5 error:&v10];
  id v7 = v10;

  if (v6) {
    goto LABEL_7;
  }
  if (objc_msgSend(v7, "vc_isFileNotFound"))
  {

    id v7 = 0;
LABEL_7:
    BOOL v8 = 1;
    goto LABEL_8;
  }
  if (!v7) {
    goto LABEL_7;
  }
  if (a3)
  {
    id v7 = v7;
    BOOL v8 = 0;
    *a3 = v7;
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_8:

  return v8;
}

- (BOOL)applyChanges:(id)a3 fromSyncService:(id)a4 error:(id *)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v60 objects:v73 count:16];
  if (!v9)
  {
    char v52 = 1;
    goto LABEL_45;
  }
  uint64_t v11 = v9;
  uint64_t v12 = *(void *)v61;
  char v52 = 1;
  *(void *)&long long v10 = 136315394;
  long long v43 = v10;
  id v45 = v8;
  v46 = a5;
  v49 = v7;
  uint64_t v44 = *(void *)v61;
  do
  {
    uint64_t v13 = 0;
    uint64_t v47 = v11;
    do
    {
      if (*(void *)v61 != v12) {
        objc_enumerationMutation(v8);
      }
      v14 = *(void **)(*((void *)&v60 + 1) + 8 * v13);
      uint64_t v15 = WFSyncedDefinitionDirectoryURL();
      v16 = [v14 objectIdentifier];
      v17 = WFDefinitionDirectoryURLForBundleIdentifier();

      id v59 = 0;
      LOBYTE(v15) = [v7 removeItemAtURL:v17 error:&v59];
      id v18 = v59;
      id v19 = v18;
      if ((v15 & 1) == 0)
      {
        if (objc_msgSend(v18, "vc_isFileNotFound"))
        {

          id v19 = 0;
        }
        else if (v19)
        {
          v20 = getWFWatchSyncLogObject();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v43;
            v65 = "-[VCIntentDefinitionSyncDataHandler applyChanges:fromSyncService:error:]";
            __int16 v66 = 2114;
            v67 = v14;
            _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_ERROR, "%s Could not delete directory for change: %{public}@", buf, 0x16u);
          }

          if (a5)
          {
            id v19 = v19;
            char v52 = 0;
            *a5 = v19;
          }
          else
          {
            char v52 = 0;
          }
          goto LABEL_39;
        }
      }
      if (objc_msgSend(v14, "changeType", v43) == 1 || objc_msgSend(v14, "changeType") == 2)
      {
        id v58 = 0;
        char v21 = [v7 createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:&v58];
        id v22 = v58;
        if ((v21 & 1) != 0 || !v22)
        {
          id v50 = v22;
          id v51 = v19;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          v48 = v14;
          v27 = [v14 files];
          uint64_t v28 = [v27 countByEnumeratingWithState:&v54 objects:v72 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v55;
            while (2)
            {
              for (uint64_t i = 0; i != v29; ++i)
              {
                if (*(void *)v55 != v30) {
                  objc_enumerationMutation(v27);
                }
                v32 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                v33 = [v32 filename];
                v34 = [v17 URLByAppendingPathComponent:v33];

                id v53 = 0;
                char v35 = [v32 writeToFileURL:v34 overwriting:1 error:&v53];
                id v36 = v53;
                v37 = v36;
                if ((v35 & 1) == 0)
                {
                  v38 = getWFWatchSyncLogObject();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    v39 = [v32 filename];
                    *(_DWORD *)buf = 136315906;
                    v65 = "-[VCIntentDefinitionSyncDataHandler applyChanges:fromSyncService:error:]";
                    __int16 v66 = 2114;
                    v67 = v39;
                    __int16 v68 = 2114;
                    v69 = v48;
                    __int16 v70 = 2114;
                    v71 = v37;
                    _os_log_impl(&dword_1C7D7E000, v38, OS_LOG_TYPE_ERROR, "%s Could not write %{public}@ for %{public}@: %{public}@", buf, 0x2Au);
                  }
                  a5 = v46;
                  uint64_t v11 = v47;
                  uint64_t v12 = v44;
                  if (v46) {
                    id *v46 = v37;
                  }

                  char v52 = 0;
                  id v7 = v49;
                  id v8 = v45;
                  goto LABEL_36;
                }
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v54 objects:v72 count:16];
              if (v29) {
                continue;
              }
              break;
            }
            id v8 = v45;
            a5 = v46;
            id v7 = v49;
            uint64_t v12 = v44;
            uint64_t v11 = v47;
          }
LABEL_36:
          id v19 = v51;

          v40 = v50;
        }
        else
        {
          uint64_t v23 = v12;
          id v24 = v8;
          v25 = v22;
          v26 = getWFWatchSyncLogObject();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v65 = "-[VCIntentDefinitionSyncDataHandler applyChanges:fromSyncService:error:]";
            __int16 v66 = 2114;
            v67 = v14;
            __int16 v68 = 2114;
            v69 = v25;
            _os_log_impl(&dword_1C7D7E000, v26, OS_LOG_TYPE_ERROR, "%s Could not create intent definition directory for %{public}@: %{public}@", buf, 0x20u);
          }

          char v52 = 0;
          if (a5) {
            *a5 = v25;
          }
          v40 = v25;
          id v8 = v24;
          uint64_t v12 = v23;
          id v7 = v49;
        }
      }
LABEL_39:

      ++v13;
    }
    while (v13 != v11);
    uint64_t v41 = [v8 countByEnumeratingWithState:&v60 objects:v73 count:16];
    uint64_t v11 = v41;
  }
  while (v41);
LABEL_45:

  return v52 & 1;
}

- (BOOL)resetSyncStateForService:(id)a3 error:(id *)a4
{
  return VCClearSyncServiceState(a3, @"IntentDefinitions.plist", a4);
}

- (BOOL)markChangesAsSynced:(id)a3 withSyncService:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__VCIntentDefinitionSyncDataHandler_markChangesAsSynced_withSyncService_metadata_error___block_invoke;
  aBlock[3] = &unk_1E6540D50;
  id v18 = v10;
  id v19 = v11;
  v20 = self;
  id v12 = v11;
  id v13 = v10;
  id v14 = a4;
  uint64_t v15 = _Block_copy(aBlock);
  LOBYTE(a6) = VCAccessSyncServiceIntentDefinitionState(v14, v15, (NSObject **)a6);

  return (char)a6;
}

uint64_t __88__VCIntentDefinitionSyncDataHandler_markChangesAsSynced_withSyncService_metadata_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 applications];
  v5 = (void *)[v4 mutableCopy];
  id v6 = v5;
  v37 = v3;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  id v8 = v7;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v36 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v14 = (void *)MEMORY[0x1C87C4C10]();
        if ([v13 changeType] == 3)
        {
          id v15 = [v13 objectIdentifier];
          [v8 removeObjectForKey:v15];
        }
        else
        {
          id v16 = objc_alloc(MEMORY[0x1E4F223C8]);
          v17 = [v13 objectIdentifier];
          id v39 = 0;
          id v18 = (void *)[v16 initWithBundleIdentifier:v17 allowPlaceholder:0 error:&v39];
          id v15 = v39;

          if (!v18)
          {
            id v19 = getWFWatchSyncLogObject();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v20 = [v13 objectIdentifier];
              *(_DWORD *)buf = 136315651;
              id v45 = "-[VCIntentDefinitionSyncDataHandler markChangesAsSynced:withSyncService:metadata:error:]_block_invoke";
              __int16 v46 = 2113;
              uint64_t v47 = v20;
              __int16 v48 = 2112;
              id v49 = v15;
              _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_ERROR, "%s Could not get LSApplicationRecord for bundle ID %{private}@: %@", buf, 0x20u);
            }
          }
          char v21 = objc_opt_new();
          id v22 = [v18 registrationDate];
          [v21 setRegisteredDate:v22];

          uint64_t v23 = [v13 checksum];
          [v21 setChecksum:v23];

          id v24 = [v13 objectIdentifier];
          [v8 setObject:v21 forKey:v24];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v10);
  }

  [v37 setApplications:v8];
  v25 = *(void **)(v36 + 40);
  if (v25)
  {
    v26 = [v25 objectForKeyedSubscript:@"LSDatabaseUUID"];
    if (v26)
    {
      id v27 = objc_alloc(MEMORY[0x1E4F29128]);
      uint64_t v28 = [*(id *)(v36 + 40) objectForKeyedSubscript:@"LSDatabaseUUID"];
      uint64_t v29 = (void *)[v27 initWithUUIDString:v28];
    }
    else
    {
      uint64_t v29 = 0;
    }

    uint64_t v30 = [*(id *)(v36 + 40) objectForKeyedSubscript:@"LSDatabaseSequenceNumber"];
    v31 = (void *)v30;
    if (v29 && v30)
    {
      v32 = getWFWatchSyncLogObject();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = (objc_class *)objc_opt_class();
        v34 = NSStringFromClass(v33);
        *(_DWORD *)buf = 136315394;
        id v45 = "-[VCIntentDefinitionSyncDataHandler markChangesAsSynced:withSyncService:metadata:error:]_block_invoke";
        __int16 v46 = 2114;
        uint64_t v47 = v34;
        _os_log_impl(&dword_1C7D7E000, v32, OS_LOG_TYPE_INFO, "%s %{public}@ completed syncing entire changeset, ratcheting database sequence number", buf, 0x16u);
      }
      [v37 setDatabaseUUID:v29];
      [v37 setSequenceNumber:v31];
    }
  }
  return 1;
}

- (id)unsyncedChangesForSyncService:(id)a3 metadata:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(id)objc_opt_class() changeClass];
  uint64_t v10 = objc_opt_new();
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4151;
  id v27 = __Block_byref_object_dispose__4152;
  id v28 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __82__VCIntentDefinitionSyncDataHandler_unsyncedChangesForSyncService_metadata_error___block_invoke;
  id v18 = &unk_1E6540D28;
  uint64_t v22 = v9;
  id v11 = v10;
  id v19 = v11;
  v20 = self;
  char v21 = &v23;
  id v12 = _Block_copy(&v15);
  VCAccessSyncServiceIntentDefinitionState(v8, v12, (NSObject **)a5);
  *a4 = (id) v24[5];
  id v13 = objc_msgSend(v11, "allObjects", v15, v16, v17, v18);

  _Block_object_dispose(&v23, 8);
  return v13;
}

uint64_t __82__VCIntentDefinitionSyncDataHandler_unsyncedChangesForSyncService_metadata_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v65 = 0;
  id v66 = 0;
  [v4 getKnowledgeUUID:&v66 andSequenceNumber:&v65];
  id v5 = v66;
  id v6 = v65;
  id v7 = [v3 databaseUUID];
  if ([v7 isEqual:v5])
  {
    id v8 = [v3 sequenceNumber];
    int v9 = [v8 isEqualToNumber:v6];

    if (v9)
    {
      uint64_t v10 = getWFWatchSyncLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v70 = "-[VCIntentDefinitionSyncDataHandler unsyncedChangesForSyncService:metadata:error:]_block_invoke";
        _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_INFO, "%s LaunchServices database is unchanged, therefore there are no intent definition changes", buf, 0xCu);
      }
      uint64_t v11 = 0;
      goto LABEL_40;
    }
  }
  else
  {
  }
  id v51 = v6;
  char v52 = v5;
  id v53 = v4;
  long long v56 = objc_opt_new();
  WFInstalledAppsEnumerator();
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [obj countByEnumeratingWithState:&v61 objects:v74 count:16];
  long long v55 = v3;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v62 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1C87C4C10]();
        id v18 = (void *)[objc_alloc(*(Class *)(a1 + 56)) initWithApplicationRecord:v16 changeType:2];
        if (v18)
        {
          id v19 = [v16 bundleIdentifier];
          [v56 addObject:v19];

          v20 = [v3 applications];
          char v21 = [v18 objectIdentifier];
          uint64_t v22 = [v20 objectForKeyedSubscript:v21];

          uint64_t v23 = [v22 registeredDate];
          id v24 = [v16 registrationDate];
          char v25 = [v23 isEqual:v24];

          if ((v25 & 1) == 0)
          {
            v26 = [v18 checksum];
            id v27 = [v22 checksum];
            char v28 = [v26 isEqual:v27];

            if ((v28 & 1) == 0)
            {
              if (!v22) {
                [v18 setChangeType:1];
              }
              objc_msgSend(*(id *)(a1 + 32), "addObject:", v18, v51, v52);
            }
          }

          id v3 = v55;
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v61 objects:v74 count:16];
    }
    while (v13);
  }

  uint64_t v29 = [v3 applications];
  if (v29)
  {
    id v30 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v31 = [v3 applications];
    v32 = [v31 allKeys];
    v33 = (void *)[v30 initWithArray:v32];
  }
  else
  {
    v33 = 0;
  }
  id v6 = v51;
  id v5 = v52;

  [v33 minusSet:v56];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v34 = v33;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v57 objects:v73 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v58 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = *(void *)(*((void *)&v57 + 1) + 8 * j);
        long long v40 = (void *)MEMORY[0x1C87C4C10]();
        long long v41 = *(void **)(a1 + 32);
        long long v42 = (void *)[objc_alloc(*(Class *)(a1 + 56)) initWithObjectIdentifier:v39 changeType:3];
        [v41 addObject:v42];
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v57 objects:v73 count:16];
    }
    while (v36);
  }

  uint64_t v11 = 0;
  if (v52)
  {
    id v3 = v55;
    uint64_t v10 = v56;
    v4 = v53;
    if (v51)
    {
      if ([*(id *)(a1 + 32) count])
      {
        v67[0] = @"LSDatabaseUUID";
        long long v43 = [v52 UUIDString];
        v67[1] = @"LSDatabaseSequenceNumber";
        v68[0] = v43;
        v68[1] = v51;
        uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:2];
        uint64_t v45 = *(void *)(*(void *)(a1 + 48) + 8);
        __int16 v46 = *(void **)(v45 + 40);
        *(void *)(v45 + 40) = v44;

        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v47 = getWFWatchSyncLogObject();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          __int16 v48 = (objc_class *)objc_opt_class();
          id v49 = NSStringFromClass(v48);
          *(_DWORD *)buf = 136315394;
          __int16 v70 = "-[VCIntentDefinitionSyncDataHandler unsyncedChangesForSyncService:metadata:error:]_block_invoke";
          __int16 v71 = 2114;
          v72 = v49;
          _os_log_impl(&dword_1C7D7E000, v47, OS_LOG_TYPE_INFO, "%s %{public}@ found no changes to sync, ratcheting database sequence number", buf, 0x16u);
        }
        [v55 setDatabaseUUID:v52];
        [v55 setSequenceNumber:v51];
        uint64_t v11 = 1;
      }
    }
  }
  else
  {
    id v3 = v55;
    uint64_t v10 = v56;
    v4 = v53;
  }

LABEL_40:
  return v11;
}

- (void)installedApplicationsDidChange:(id)a3
{
  v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"isPlaceholder"];

  id v9 = v5;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v9;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 BOOLValue];
  if ((v8 & 1) == 0) {
    [(VCSyncDataHandler *)self requestSync];
  }
}

- (void)dealloc
{
  id v3 = [(VCIntentDefinitionSyncDataHandler *)self eventHandler];
  [v3 removeObserver:self name:@"ApplicationRegistered"];

  v4 = [(VCIntentDefinitionSyncDataHandler *)self eventHandler];
  [v4 removeObserver:self name:@"ApplicationUnregistered"];

  id v5 = [(VCIntentDefinitionSyncDataHandler *)self eventHandler];
  [v5 removeObserver:self name:@"ApplicationStateChanged"];

  v6.receiver = self;
  v6.super_class = (Class)VCIntentDefinitionSyncDataHandler;
  [(VCIntentDefinitionSyncDataHandler *)&v6 dealloc];
}

- (VCIntentDefinitionSyncDataHandler)initWithEventHandler:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"VCIntentDefinitionSyncDataHandler.m", 69, @"Invalid parameter not satisfying: %@", @"eventHandler" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)VCIntentDefinitionSyncDataHandler;
  id v7 = [(VCSyncDataHandler *)&v15 init];
  char v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_eventHandler, a3);
    id v9 = [(VCIntentDefinitionSyncDataHandler *)v8 eventHandler];
    [v9 addObserver:v8 selector:sel_installedApplicationsDidChange_ name:@"ApplicationRegistered"];

    uint64_t v10 = [(VCIntentDefinitionSyncDataHandler *)v8 eventHandler];
    [v10 addObserver:v8 selector:sel_installedApplicationsDidChange_ name:@"ApplicationUnregistered"];

    uint64_t v11 = [(VCIntentDefinitionSyncDataHandler *)v8 eventHandler];
    [v11 addObserver:v8 selector:sel_installedApplicationsDidChange_ name:@"ApplicationStateChanged"];

    uint64_t v12 = v8;
  }

  return v8;
}

+ (int)messageType
{
  return 1;
}

@end