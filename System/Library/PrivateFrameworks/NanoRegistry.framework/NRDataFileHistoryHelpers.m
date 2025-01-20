@interface NRDataFileHistoryHelpers
+ (BOOL)archiveDeviceHistory:(id)a3;
+ (BOOL)archiveSecureProperties:(id)a3;
+ (BOOL)createMissingDates:(id)a3;
+ (id)unarchiveDeviceHistory;
+ (id)unarchiveSecureProperties;
@end

@implementation NRDataFileHistoryHelpers

+ (id)unarchiveDeviceHistory
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28DC0];
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v4 = +[NRDataFilePaths pathToNanoRegistryHistoryFile];
  v5 = objc_msgSend(v2, "nr_secureUnarchiveObjectOfClasses:withFile:", v3, v4);

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = nr_daemon_log();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (v7)
      {
        v8 = nr_daemon_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v10 = +[NRDataFilePaths pathToNanoRegistryHistoryFile];
          v11 = (objc_class *)objc_opt_class();
          v12 = NSStringFromClass(v11);
          int v13 = 138543618;
          v14 = v10;
          __int16 v15 = 2114;
          v16 = v12;
          _os_log_error_impl(&dword_1A356E000, v8, OS_LOG_TYPE_ERROR, "Failure loading history file %{public}@: File has incorrect object %{public}@.", (uint8_t *)&v13, 0x16u);
        }
      }

      v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)archiveDeviceHistory:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[NRDataFilePaths pathToNanoRegistryHistoryFile];
  if ([v3 dirty])
  {
    v5 = (void *)MEMORY[0x1A624A5B0]();
    v6 = objc_msgSend(MEMORY[0x1E4F28DB0], "nr_secureArchivedDataWithRootObject:", v3);
    BOOL v7 = v6;
    if (v6)
    {
      id v15 = 0;
      char v8 = [v6 writeToFile:v4 options:268435457 error:&v15];
      id v9 = v15;
      if (v8)
      {
        LOBYTE(v10) = 1;
LABEL_15:

        goto LABEL_16;
      }
      v12 = nr_daemon_log();
      LODWORD(v10) = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

      if (!v10) {
        goto LABEL_15;
      }
      v10 = nr_daemon_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = objc_msgSend(v9, "nr_safeDescription");
        *(_DWORD *)buf = 138543618;
        uint64_t v17 = v4;
        __int16 v18 = 2114;
        v19 = v14;
        _os_log_error_impl(&dword_1A356E000, v10, OS_LOG_TYPE_ERROR, "Failure saving active state machine file %{public}@: writeToFile returned \"NO\" %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v11 = nr_daemon_log();
      LODWORD(v10) = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

      if (!v10)
      {
        id v9 = 0;
        goto LABEL_15;
      }
      v10 = nr_daemon_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v4;
        _os_log_error_impl(&dword_1A356E000, v10, OS_LOG_TYPE_ERROR, "Failure saving history file %{public}@: Archiver returned \"nil\"", buf, 0xCu);
      }
      id v9 = 0;
    }

    LOBYTE(v10) = 0;
    goto LABEL_15;
  }
  id v9 = 0;
  LOBYTE(v10) = 1;
LABEL_16:

  return (char)v10;
}

void __64__NRDataFileHistoryHelpers_findPairedDateForDeviceID_inHistory___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  if ([a2 isEqual:*(void *)(a1 + 32)]
    && [v9 isEqual:MEMORY[0x1E4F1CC38]])
  {
    uint64_t v6 = [*(id *)(a1 + 40) date];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    char v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

+ (BOOL)createMissingDates:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  v43 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = [v49 deviceCollection];
  uint64_t v47 = [obj countByEnumeratingWithState:&v62 objects:v86 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v63;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v63 != v46)
        {
          uint64_t v4 = v3;
          objc_enumerationMutation(obj);
          uint64_t v3 = v4;
        }
        uint64_t v48 = v3;
        v51 = *(void **)(*((void *)&v62 + 1) + 8 * v3);
        v5 = [v49 deviceCollection];
        v53 = [v5 objectForKeyedSubscript:v51];

        v52 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v6 = [v53 objectForKeyedSubscript:@"isPaired"];
        uint64_t v7 = [v6 value];
        int v8 = [v7 BOOLValue];

        if (v8)
        {
          id v9 = [v53 objectForKeyedSubscript:@"pairedDate"];
          v50 = [v9 value];

          objc_opt_class();
          int isKindOfClass = objc_opt_isKindOfClass();
          v10 = (void *)MEMORY[0x1E4F1C9C8];
          if (isKindOfClass)
          {
            [v50 doubleValue];
            objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
            id v11 = (id)objc_claimAutoreleasedReturnValue();
            if (!v11) {
              goto LABEL_12;
            }
LABEL_29:
            v28 = [NRDevicePropertyDiffType alloc];
            v29 = [[NRDevicePropertyDiff alloc] initWithValue:v11];
            v30 = [(NRDevicePropertyDiffType *)v28 initWithDiff:v29 andChangeType:1];

            [v52 setObject:v30 forKeyedSubscript:@"pairedDate"];
            if (v11)
            {
LABEL_30:
              v31 = [v53 objectForKeyedSubscript:@"lastActiveDate"];
              uint64_t v32 = [v31 value];

              if (v32)
              {
                v50 = (void *)v32;
              }
              else
              {
                v33 = [NRDevicePropertyDiffType alloc];
                v34 = [[NRDevicePropertyDiff alloc] initWithValue:v11];
                v35 = [(NRDevicePropertyDiffType *)v33 initWithDiff:v34 andChangeType:1];

                [v52 setObject:v35 forKeyedSubscript:@"lastActiveDate"];
                v50 = 0;
              }
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v11 = v50;
              if (v11) {
                goto LABEL_30;
              }
            }
LABEL_12:
            id v56 = v51;
            id v12 = v49;
            self;
            uint64_t v76 = 0;
            v77 = &v76;
            uint64_t v78 = 0x3032000000;
            v79 = __Block_byref_object_copy__6;
            v80 = __Block_byref_object_dispose__6;
            id v81 = 0;
            long long v72 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            id v54 = v12;
            uint64_t v57 = [v54 countByEnumeratingWithState:&v72 objects:v87 count:16];
            if (v57)
            {
              uint64_t v55 = *(void *)v73;
              do
              {
                for (uint64_t i = 0; i != v57; ++i)
                {
                  if (*(void *)v73 != v55) {
                    objc_enumerationMutation(v54);
                  }
                  int v13 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                  v14 = [v13 diff];
                  v66[0] = MEMORY[0x1E4F143A8];
                  v66[1] = 3221225472;
                  v67 = __64__NRDataFileHistoryHelpers_findPairedDateForDeviceID_inHistory___block_invoke;
                  v68 = &unk_1E5B01AE0;
                  id v15 = v56;
                  v70 = v13;
                  v71 = &v76;
                  id v69 = v15;
                  id v16 = v14;
                  v61 = @"isPaired";
                  v59 = v66;
                  self;
                  long long v84 = 0u;
                  long long v85 = 0u;
                  long long v82 = 0u;
                  long long v83 = 0u;
                  id v17 = v16;
                  uint64_t v18 = [v17 countByEnumeratingWithState:&v82 objects:v88 count:16];
                  if (v18)
                  {
                    uint64_t v60 = *(void *)v83;
                    do
                    {
                      for (uint64_t j = 0; j != v18; ++j)
                      {
                        if (*(void *)v83 != v60) {
                          objc_enumerationMutation(v17);
                        }
                        uint64_t v20 = *(void **)(*((void *)&v82 + 1) + 8 * j);
                        v21 = [v17 objectForKeyedSubscript:v20];
                        v22 = [v21 diff];
                        v23 = [v22 objectForKeyedSubscript:v61];
                        v24 = v23;
                        if (v23)
                        {
                          uint64_t v25 = [v23 changeType];
                          v26 = [v24 diff];
                          v27 = [v26 value];
                          v67((uint64_t)v59, v20, v25, v27);
                        }
                      }
                      uint64_t v18 = [v17 countByEnumeratingWithState:&v82 objects:v88 count:16];
                    }
                    while (v18);
                  }
                }
                uint64_t v57 = [v54 countByEnumeratingWithState:&v72 objects:v87 count:16];
              }
              while (v57);
            }

            id v11 = (id)v77[5];
            _Block_object_dispose(&v76, 8);

            if (((v11 == 0) & ~isKindOfClass) == 0) {
              goto LABEL_29;
            }
            id v11 = 0;
          }
        }
        if ([v52 count])
        {
          v36 = [[NRDeviceDiff alloc] initWithDiffPropertyDiffs:v52];
          v37 = [[NRDeviceDiffType alloc] initWithDiff:v36 andChangeType:1];
          [v43 setObject:v37 forKeyedSubscript:v51];
        }
        uint64_t v3 = v48 + 1;
      }
      while (v48 + 1 != v47);
      uint64_t v47 = [obj countByEnumeratingWithState:&v62 objects:v86 count:16];
    }
    while (v47);
  }

  if ([v43 count])
  {
    v38 = [[NRDeviceCollectionDiff alloc] initWithDeviceCollectionDiffDeviceDiffs:v43];
    v39 = [v49 deviceCollection];
    id v40 = (id)[v39 applyDiff:v38];
  }
  if ([v49 dirty]) {
    BOOL v41 = +[NRDataFileHistoryHelpers archiveDeviceHistory:v49];
  }
  else {
    BOOL v41 = 1;
  }

  return v41;
}

+ (BOOL)archiveSecureProperties:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 dirty]
    && (uint64_t v4 = (void *)MEMORY[0x1E4F28DB0],
        +[NRDataFilePaths pathToNanoRegistryHistorySecurePropertiesFile](NRDataFilePaths, "pathToNanoRegistryHistorySecurePropertiesFile"), v5 = objc_claimAutoreleasedReturnValue(), LOBYTE(v4) = objc_msgSend(v4, "nr_secureArchiveRootObject:toFile:", v3, v5), v5, (v4 & 1) == 0))
  {
    int v8 = nr_daemon_log();
    LODWORD(v6) = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      uint64_t v6 = nr_daemon_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v9 = +[NRDataFilePaths pathToNanoRegistryHistorySecurePropertiesFile];
        int v10 = 138543362;
        id v11 = v9;
        _os_log_error_impl(&dword_1A356E000, v6, OS_LOG_TYPE_ERROR, "Failure saving secure properties file %{public}@: Archiver returned \"NO\"", (uint8_t *)&v10, 0xCu);
      }
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return (char)v6;
}

+ (id)unarchiveSecureProperties
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28DC0];
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  uint64_t v4 = +[NRDataFilePaths pathToNanoRegistryHistorySecurePropertiesFile];
  v5 = objc_msgSend(v2, "nr_secureUnarchiveObjectOfClasses:withFile:", v3, v4);

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = nr_daemon_log();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (v7)
      {
        int v8 = nr_daemon_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v10 = +[NRDataFilePaths pathToNanoRegistryHistorySecurePropertiesFile];
          id v11 = (objc_class *)objc_opt_class();
          uint64_t v12 = NSStringFromClass(v11);
          int v13 = 138543618;
          v14 = v10;
          __int16 v15 = 2114;
          id v16 = v12;
          _os_log_error_impl(&dword_1A356E000, v8, OS_LOG_TYPE_ERROR, "Failure loading secure properties file %{public}@: File has incorrect object %{public}@.", (uint8_t *)&v13, 0x16u);
        }
      }

      v5 = 0;
    }
  }

  return v5;
}

@end