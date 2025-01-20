@interface PBFDataStoreUnarchiver
+ (BOOL)unarchiveDataStoreAtURL:(id)a3 toURL:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)fileManager;
- (BOOL)_focusActivityExistsForUUID:(id)a3;
- (BOOL)remapFocusConfigurations;
- (BOOL)unarchiveToDirectoryAtURL:(id)a3 error:(id *)a4;
- (NSURL)archivedDataStoreURL;
- (PBFDataStoreUnarchiver)initWithArchivedDataStoreURL:(id)a3;
- (PRSDataStoreArchiveConfiguration)options;
- (id)_activityForIdentifier:(id)a3;
- (id)_availableActivities;
- (void)setOptions:(id)a3;
- (void)setRemapFocusConfigurations:(BOOL)a3;
@end

@implementation PBFDataStoreUnarchiver

+ (id)fileManager
{
  if (fileManager_onceToken_64 != -1) {
    dispatch_once(&fileManager_onceToken_64, &__block_literal_global_66_0);
  }
  v2 = (void *)fileManager_fileManager_63;
  return v2;
}

void __37__PBFDataStoreUnarchiver_fileManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)fileManager_fileManager_63;
  fileManager_fileManager_63 = v0;
}

+ (BOOL)unarchiveDataStoreAtURL:(id)a3 toURL:(id)a4 options:(id)a5 error:(id *)a6
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [a1 fileManager];
  v14 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_temporaryDirectoryURL");
  v15 = [MEMORY[0x1E4F29128] UUID];
  v16 = [v15 UUIDString];
  v17 = [v14 URLByAppendingPathComponent:v16];

  if (![v13 createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:a6])
  {
LABEL_10:
    char v21 = 0;
    goto LABEL_13;
  }
  if (!PBFAppleArchiveDecompress(v10, v17))
  {
    if (a6)
    {
      v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F289B0];
      v29[0] = *MEMORY[0x1E4F28588];
      v29[1] = v23;
      v24 = @"(NULL archiveURL)";
      if (v10) {
        v24 = v10;
      }
      v30[0] = @"Unable to decompress data store url";
      v30[1] = v24;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
      objc_msgSend(v22, "pbf_generalErrorWithCode:userInfo:", 7, v25);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    [v13 removeItemAtURL:v17 error:0];
    goto LABEL_10;
  }
  uint64_t v18 = *MEMORY[0x1E4F1C598];
  uint64_t v19 = *MEMORY[0x1E4F1C668];
  v27[0] = *MEMORY[0x1E4F1C590];
  v27[1] = v19;
  v28[0] = v18;
  v28[1] = MEMORY[0x1E4F1CC38];
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  objc_msgSend(v17, "pbf_recursivelyUpdateResourceValues:error:", v20, 0);
  if (+[PBFDataStoreArchivalUtilities transformDataStoreAtURL:v17 options:v12 error:a6])
  {
    char v21 = [v13 moveItemAtURL:v17 toURL:v11 error:a6];
  }
  else
  {
    [v13 removeItemAtURL:v17 error:0];
    char v21 = 0;
  }

LABEL_13:
  return v21;
}

- (PBFDataStoreUnarchiver)initWithArchivedDataStoreURL:(id)a3
{
  id v4 = a3;
  if ([v4 checkResourceIsReachableAndReturnError:0])
  {
    v10.receiver = self;
    v10.super_class = (Class)PBFDataStoreUnarchiver;
    v5 = [(PBFDataStoreUnarchiver *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      archivedDataStoreURL = v5->_archivedDataStoreURL;
      v5->_archivedDataStoreURL = (NSURL *)v6;

      v5->_remapFocusConfigurations = 1;
    }

    return v5;
  }
  else
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[archivedDataStoreURL checkResourceIsReachableAndReturnError:nil]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFDataStoreUnarchiver initWithArchivedDataStoreURL:]();
    }
    [v9 UTF8String];
    result = (PBFDataStoreUnarchiver *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)unarchiveToDirectoryAtURL:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(NSURL *)self->_archivedDataStoreURL checkResourceIsReachableAndReturnError:a4])
  {
    v7 = [(id)objc_opt_class() fileManager];
    v8 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_temporaryDirectoryURL");
    v9 = [MEMORY[0x1E4F29128] UUID];
    objc_super v10 = [v9 UUIDString];
    id v11 = [v8 URLByAppendingPathComponent:v10];

    uint64_t v12 = objc_opt_class();
    archivedDataStoreURL = self->_archivedDataStoreURL;
    v14 = [(PBFDataStoreUnarchiver *)self options];
    LOBYTE(v12) = [(id)v12 unarchiveDataStoreAtURL:archivedDataStoreURL toURL:v11 options:v14 error:a4];

    if (v12)
    {
      if ([(PBFDataStoreUnarchiver *)self remapFocusConfigurations])
      {
        v25 = a4;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        v15 = _PBFExtensionStoreCoordinatorsForDataStoreExtensionContainerURL(v11, 0);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v28;
          while (2)
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v28 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              char v21 = [v20 setupEnvironmentIfNecessary];
              if (v21)
              {
                uint64_t v23 = v21;
                if (v25) {
                  id *v25 = v21;
                }
                [v7 removeItemAtURL:v11 error:0];

                char v22 = 0;
                goto LABEL_19;
              }
              v26[0] = MEMORY[0x1E4F143A8];
              v26[1] = 3221225472;
              v26[2] = __58__PBFDataStoreUnarchiver_unarchiveToDirectoryAtURL_error___block_invoke;
              v26[3] = &unk_1E6982C48;
              v26[4] = self;
              [v20 enumerateConfigurationStoreCoordinators:v26];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }

        a4 = v25;
      }
      char v22 = [v7 moveItemAtURL:v11 toURL:v6 error:a4];
    }
    else
    {
      [v7 removeItemAtURL:v11 error:0];
      char v22 = 0;
    }
LABEL_19:
  }
  else
  {
    char v22 = 0;
  }

  return v22;
}

void __58__PBFDataStoreUnarchiver_unarchiveToDirectoryAtURL_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v3 = [a2 allPosterPaths];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    unint64_t v7 = 0x1E4F92000uLL;
    v24 = v3;
    uint64_t v25 = a1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        objc_super v10 = objc_msgSend(*(id *)(v7 + 1712), "loadFocusConfigurationForPath:error:", v9, 0, v24, v25);
        id v11 = v10;
        if (v10)
        {
          uint64_t v12 = *(void **)(a1 + 32);
          v13 = [v10 activityUUID];
          LOBYTE(v12) = [v12 _focusActivityExistsForUUID:v13];

          if ((v12 & 1) == 0)
          {
            v14 = *(void **)(a1 + 32);
            v15 = [v11 activityIdentifier];
            uint64_t v16 = [v14 _activityForIdentifier:v15];

            if (v16)
            {
              id v17 = objc_alloc(MEMORY[0x1E4F92668]);
              uint64_t v18 = [v16 activityIdentifier];
              [v16 activityUniqueIdentifier];
              uint64_t v19 = v5;
              unint64_t v20 = v7;
              v22 = uint64_t v21 = v6;
              uint64_t v23 = (void *)[v17 initWithActivityIdentifier:v18 activityUUID:v22];

              uint64_t v6 = v21;
              unint64_t v7 = v20;
              uint64_t v5 = v19;

              v3 = v24;
              a1 = v25;
              [*(id *)(v7 + 1712) storeFocusConfigurationForPath:v9 focusConfiguration:v23 error:0];
            }
            else
            {
              [*(id *)(v7 + 1712) removeFocusConfigurationForPath:v9 error:0];
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v5);
  }
}

- (id)_availableActivities
{
  v2 = [MEMORY[0x1E4F62278] sharedActivityManager];
  v3 = [v2 availableActivities];

  return v3;
}

- (BOOL)_focusActivityExistsForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PBFDataStoreUnarchiver *)self _availableActivities];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__PBFDataStoreUnarchiver__focusActivityExistsForUUID___block_invoke;
  v9[3] = &unk_1E6980808;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "bs_containsObjectPassingTest:", v9);

  return v7;
}

uint64_t __54__PBFDataStoreUnarchiver__focusActivityExistsForUUID___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 activityUniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_activityForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PBFDataStoreUnarchiver *)self _availableActivities];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__PBFDataStoreUnarchiver__activityForIdentifier___block_invoke;
  v9[3] = &unk_1E6980808;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __49__PBFDataStoreUnarchiver__activityForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 activityIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (NSURL)archivedDataStoreURL
{
  return self->_archivedDataStoreURL;
}

- (PRSDataStoreArchiveConfiguration)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  self->_options = (PRSDataStoreArchiveConfiguration *)a3;
}

- (BOOL)remapFocusConfigurations
{
  return self->_remapFocusConfigurations;
}

- (void)setRemapFocusConfigurations:(BOOL)a3
{
  self->_remapFocusConfigurations = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithArchivedDataStoreURL:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end