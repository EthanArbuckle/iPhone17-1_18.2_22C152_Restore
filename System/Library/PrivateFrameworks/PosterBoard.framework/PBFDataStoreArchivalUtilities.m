@interface PBFDataStoreArchivalUtilities
+ (BOOL)transformDataStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)fileManager;
@end

@implementation PBFDataStoreArchivalUtilities

+ (id)fileManager
{
  if (fileManager_onceToken_108 != -1) {
    dispatch_once(&fileManager_onceToken_108, &__block_literal_global_110);
  }
  v2 = (void *)fileManager_fileManager_107;
  return v2;
}

void __44__PBFDataStoreArchivalUtilities_fileManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)fileManager_fileManager_107;
  fileManager_fileManager_107 = v0;
}

+ (BOOL)transformDataStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v49 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreExtensionContainerURLForVersionDataStoreURL:", a3);
  uint64_t v8 = [v7 stripScreenshots];
  int v9 = [v7 stripDescriptors];
  int v10 = [v7 stripContentsOfConfigurations];
  v48 = v7;
  int v11 = [v7 reapNonLatestEntries];
  v12 = [a1 fileManager];
  if ((v8 & 1) == 0 && (v9 & 1) == 0 && (v10 & 1) == 0 && !v11) {
    goto LABEL_54;
  }
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  _PBFExtensionStoreCoordinatorsForDataStoreExtensionContainerURL(v49, 0);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v57 = [obj countByEnumeratingWithState:&v81 objects:v91 count:16];
  if (!v57) {
    goto LABEL_53;
  }
  uint64_t v56 = *(void *)v82;
  int v51 = v9;
  unsigned int v52 = v8;
  int v55 = v10;
  int v50 = v11;
  while (2)
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v82 != v56) {
        objc_enumerationMutation(obj);
      }
      v60 = *(void **)(*((void *)&v81 + 1) + 8 * v13);
      uint64_t v14 = [v60 setupEnvironmentIfNecessary];
      if (v14)
      {
        v41 = (void *)v14;
        v42 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v43 = *MEMORY[0x1E4F28588];
        v90[0] = @"PBFPosterExtensionStoreCoordinator could not be setup; cannot archive something we cannot read.";
        uint64_t v44 = *MEMORY[0x1E4F289B0];
        v89[0] = v43;
        v89[1] = v44;
        v45 = [v60 containerURL];
        v89[2] = *MEMORY[0x1E4F28A50];
        v90[1] = v45;
        v90[2] = v41;
        v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:3];
        objc_msgSend(v42, "pbf_generalErrorWithCode:userInfo:", 7, v46);
        id v38 = (id)objc_claimAutoreleasedReturnValue();

        BOOL v39 = v38 == 0;
        if (a5 && v38)
        {
          id v38 = v38;
          BOOL v39 = 0;
          *a5 = v38;
        }
        goto LABEL_55;
      }
      if (v11)
      {
        [v60 reapEverythingExceptLatestVersion];
        if (!v9)
        {
LABEL_13:
          if (!v10) {
            goto LABEL_14;
          }
          goto LABEL_27;
        }
      }
      else if (!v9)
      {
        goto LABEL_13;
      }
      uint64_t v15 = v8;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      v16 = [v60 dynamicDescriptorStoreCoordinatorsWithError:0];
      v17 = (void *)[v16 copy];

      uint64_t v18 = [v17 countByEnumeratingWithState:&v77 objects:v88 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v78;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v78 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = [*(id *)(*((void *)&v77 + 1) + 8 * i) posterUUID];
            [v60 teardownDynamicDescriptorStoreCoordinatorForPosterUUID:v22 error:0];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v77 objects:v88 count:16];
        }
        while (v19);
      }

      [v60 teardownAllStaticDescriptorStoreCoordinators];
      uint64_t v8 = v15;
      int v10 = v55;
      if (!v55)
      {
LABEL_14:
        if (!v8) {
          goto LABEL_16;
        }
LABEL_15:
        [v60 enumerateDescriptorStoreCoordinators:&__block_literal_global_116_0];
        [v60 enumerateConfigurationStoreCoordinators:&__block_literal_global_118];
        goto LABEL_16;
      }
LABEL_27:
      uint64_t v54 = v13;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v58 = [v60 configurationStoreCoordinatorsWithError:0];
      uint64_t v61 = [v58 countByEnumeratingWithState:&v73 objects:v87 count:16];
      if (v61)
      {
        uint64_t v59 = *(void *)v74;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v74 != v59) {
              objc_enumerationMutation(v58);
            }
            uint64_t v62 = v23;
            v24 = *(void **)(*((void *)&v73 + 1) + 8 * v23);
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            id v63 = [v24 allPosterPaths];
            uint64_t v25 = [v63 countByEnumeratingWithState:&v69 objects:v86 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v64 = *(void *)v70;
              do
              {
                for (uint64_t j = 0; j != v26; ++j)
                {
                  if (*(void *)v70 != v64) {
                    objc_enumerationMutation(v63);
                  }
                  v28 = *(void **)(*((void *)&v69 + 1) + 8 * j);
                  v29 = [v28 contentsURL];
                  v30 = [MEMORY[0x1E4F926B0] expectedConfigurationFilesForPath:v28];
                  v31 = [v12 enumeratorAtURL:v29 includingPropertiesForKeys:0 options:1 errorHandler:0];
                  long long v65 = 0u;
                  long long v66 = 0u;
                  long long v67 = 0u;
                  long long v68 = 0u;
                  uint64_t v32 = [v31 countByEnumeratingWithState:&v65 objects:v85 count:16];
                  if (v32)
                  {
                    uint64_t v33 = v32;
                    uint64_t v34 = *(void *)v66;
                    do
                    {
                      for (uint64_t k = 0; k != v33; ++k)
                      {
                        if (*(void *)v66 != v34) {
                          objc_enumerationMutation(v31);
                        }
                        uint64_t v36 = *(void *)(*((void *)&v65 + 1) + 8 * k);
                        if (([v30 containsObject:v36] & 1) == 0) {
                          [v12 removeItemAtURL:v36 error:0];
                        }
                      }
                      uint64_t v33 = [v31 countByEnumeratingWithState:&v65 objects:v85 count:16];
                    }
                    while (v33);
                  }
                }
                uint64_t v26 = [v63 countByEnumeratingWithState:&v69 objects:v86 count:16];
              }
              while (v26);
            }

            uint64_t v23 = v62 + 1;
          }
          while (v62 + 1 != v61);
          uint64_t v61 = [v58 countByEnumeratingWithState:&v73 objects:v87 count:16];
        }
        while (v61);
      }

      int v9 = v51;
      uint64_t v8 = v52;
      int v10 = v55;
      int v11 = v50;
      uint64_t v13 = v54;
      if (v52) {
        goto LABEL_15;
      }
LABEL_16:
      [v60 invalidate];
      ++v13;
    }
    while (v13 != v57);
    uint64_t v37 = [obj countByEnumeratingWithState:&v81 objects:v91 count:16];
    uint64_t v57 = v37;
    if (v37) {
      continue;
    }
    break;
  }
LABEL_53:

LABEL_54:
  id v38 = 0;
  BOOL v39 = 1;
LABEL_55:

  return v39;
}

uint64_t __71__PBFDataStoreArchivalUtilities_transformDataStoreAtURL_options_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reapSnapshots];
}

uint64_t __71__PBFDataStoreArchivalUtilities_transformDataStoreAtURL_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 reapSnapshots];
}

@end