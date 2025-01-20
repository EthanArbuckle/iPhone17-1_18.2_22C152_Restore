@interface PLPhotoLibraryOpener
+ (BOOL)_validateUniqueLibraryIdentifierUUIDWithCreationOptions:(id)a3;
+ (BOOL)canAutomaticallyCreateLibrary;
+ (BOOL)deleteLibraryFromFilesystemAtURL:(id)a3 error:(id *)a4;
+ (id)_resolvePhotoLibraryBundleURLWithOptions:(id)a3 error:(id *)a4;
+ (id)createManagedPhotoLibraryOnFilesystemWithOptions:(id)a3 error:(id *)a4;
- (BOOL)createPhotoLibraryDatabaseWithOptions:(id)a3 error:(id *)a4;
- (BOOL)lightweightPermissionCheckWithError:(id *)a3;
- (BOOL)lightweightPermissionCheckWithPath:(id)a3 isDir:(BOOL)a4 error:(id *)a5;
- (BOOL)openPhotoLibraryDatabaseWithAutoUpgrade:(BOOL)a3 autoCreate:(BOOL)a4 error:(id *)a5;
- (PLLibraryServicesManager)libraryServicesManager;
- (PLPhotoLibraryOpener)initWithLibraryServicesManager:(id)a3 reportInProgressUpgrades:(BOOL)a4;
@end

@implementation PLPhotoLibraryOpener

- (void).cxx_destruct
{
}

- (PLLibraryServicesManager)libraryServicesManager
{
  return (PLLibraryServicesManager *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)lightweightPermissionCheckWithPath:(id)a3 isDir:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"PLPhotoLibraryOpener.m", 331, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:v6];
  id v59 = 0;
  int v11 = [v10 checkResourceIsReachableAndReturnError:&v59];
  id v12 = v59;
  if (v11)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v14 = MEMORY[0x1E4F1CC38];
    [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1C668]];
    [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F1C6A8]];
    uint64_t v15 = *MEMORY[0x1E4F1C860];
    [v13 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F1C860]];
    if (v6) {
      [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1C640]];
    }
    v53 = v13;
    v16 = [v13 allKeys];
    id v58 = v12;
    v17 = [v10 resourceValuesForKeys:v16 error:&v58];
    id v18 = v58;

    if (v17)
    {
      uint64_t v48 = v15;
      v50 = a5;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v19 = [v17 keyEnumerator];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v62 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        v46 = self;
        v47 = v10;
        id v49 = v18;
        id v51 = v9;
        uint64_t v22 = *(void *)v55;
        char v52 = 1;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v55 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            v25 = [v17 objectForKeyedSubscript:v24];
            int v26 = [v25 BOOLValue];
            v27 = [v53 objectForKeyedSubscript:v24];
            int v28 = [v27 BOOLValue];

            if (v26 != v28)
            {
              v29 = PLBackendGetLog();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v64 = v51;
                __int16 v65 = 2112;
                id v66 = v24;
                _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager %@ has incorrect permissions for %@", buf, 0x16u);
              }

              char v52 = 0;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v54 objects:v62 count:16];
        }
        while (v21);

        int v30 = v52 & 1;
        id v9 = v51;
        if (!v50)
        {
          v10 = v47;
          id v18 = v49;
          goto LABEL_33;
        }
        v10 = v47;
        id v18 = v49;
        if (v52)
        {
LABEL_33:

          BOOL v43 = v30 != 0;
          goto LABEL_34;
        }
        v31 = [v17 objectForKeyedSubscript:v48];
        int v32 = [v31 BOOLValue];

        if (v32) {
          uint64_t v33 = 46105;
        }
        else {
          uint64_t v33 = 46104;
        }
        v34 = @"Path is on read-only volume";
        if (!v32) {
          v34 = @"Error accessing path";
        }
        uint64_t v35 = *MEMORY[0x1E4F28328];
        v60[0] = *MEMORY[0x1E4F28228];
        v60[1] = v35;
        v61[0] = v34;
        v61[1] = v51;
        v60[2] = *MEMORY[0x1E4F289D0];
        v36 = v34;
        v37 = [(PLPhotoLibraryOpener *)v46 libraryServicesManager];
        v38 = [v37 pathManager];
        v39 = [v38 libraryURL];
        v61[2] = v39;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:3];

        id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
        char v41 = v52;
        id v18 = v49;
        id *v50 = (id)[v40 initWithDomain:*MEMORY[0x1E4F8C500] code:v33 userInfo:v19];
LABEL_32:

        int v30 = v41 & 1;
        goto LABEL_33;
      }
    }
    else
    {
      v19 = PLBackendGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v64 = v9;
        __int16 v65 = 2112;
        id v66 = v18;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager failed to access resource values for path: %@. Error: %@", buf, 0x16u);
      }
    }
    char v41 = 1;
    goto LABEL_32;
  }
  v42 = PLBackendGetLog();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v64 = v9;
    _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager %@ is not reachable", buf, 0xCu);
  }

  BOOL v43 = 1;
  id v18 = v12;
LABEL_34:

  return v43;
}

- (BOOL)lightweightPermissionCheckWithError:(id *)a3
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v5 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
  BOOL v6 = [v5 pathManager];
  v7 = [v6 photoDirectoryWithType:2];
  v30[0] = v7;
  v31[0] = MEMORY[0x1E4F1CC38];
  v8 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
  id v9 = [v8 pathManager];
  v10 = [v9 photosDatabasePath];
  v30[1] = v10;
  v31[1] = MEMORY[0x1E4F1CC28];
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v18 = [v12 objectForKeyedSubscript:v17];
        uint64_t v19 = [v18 BOOLValue];
        id v24 = 0;
        BOOL v20 = [(PLPhotoLibraryOpener *)self lightweightPermissionCheckWithPath:v17 isDir:v19 error:&v24];
        id v21 = v24;

        if (!v20)
        {
          if (a3) {
            *a3 = v21;
          }

          BOOL v22 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v22 = 1;
LABEL_13:

  return v22;
}

- (BOOL)openPhotoLibraryDatabaseWithAutoUpgrade:(BOOL)a3 autoCreate:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  v10 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
  int v11 = [v10 pathManager];
  id v12 = [v11 libraryURL];

  uint64_t v13 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
  uint64_t v14 = [v13 state];

  if (v14 != 7)
  {
    v68 = a5;
    v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    unsigned __int8 v73 = 0;
    uint64_t v17 = [v12 path];
    id v18 = v16;
    int v19 = [v16 fileExistsAtPath:v17 isDirectory:&v73];
    int v20 = v73;

    if (v19 && v20)
    {
      id v21 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
      BOOL v22 = [v21 modelMigrator];
      id v72 = 0;
      int v23 = [v22 isPhotoLibraryDatabaseReadyForOpen:&v72];
      id v24 = (PLLibraryOpenerCreationOptions *)v72;

      if (v23)
      {

        long long v25 = v18;
        long long v26 = v68;
        goto LABEL_7;
      }
      id v71 = 0;
      int v40 = [(PLPhotoLibraryOpener *)self lightweightPermissionCheckWithError:&v71];
      id v38 = v71;
      if (v40)
      {
        char v41 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
        int v42 = [v41 isCreateMode];

        if (v42)
        {
          BOOL v43 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
          v44 = [v43 openerCreationOptions];

          if (!v44)
          {
            __int16 v65 = [MEMORY[0x1E4F28B00] currentHandler];
            [v65 handleFailureInMethod:a2, self, @"PLPhotoLibraryOpener.m", 248, @"Invalid parameter not satisfying: %@", @"openerCreationOptions != nil" object file lineNumber description];
          }
          BOOL v15 = [(PLPhotoLibraryOpener *)self createPhotoLibraryDatabaseWithOptions:v44 error:v68];

          long long v25 = v18;
          goto LABEL_32;
        }
        if (a3)
        {
          uint64_t v47 = 0;
        }
        else
        {
          long long v57 = PLLibraryServicesGetLog();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            id v58 = [v12 path];
            *(_DWORD *)buf = 138412290;
            v81 = v58;
            _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_ERROR, "Unable to open photo library because it requires upgrading: %@", buf, 0xCu);
          }
          id v66 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v67 = *MEMORY[0x1E4F8C500];
          v78[0] = *MEMORY[0x1E4F28328];
          id v59 = [v12 path];
          v79[0] = v59;
          v78[1] = *MEMORY[0x1E4F28228];
          v60 = [NSString stringWithFormat:@"Schema versions: library=%d, %s=%d", -[PLLibraryOpenerCreationOptions intValue](v24, "intValue"), "assetsd", +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion")];
          v79[1] = v60;
          v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:2];
          uint64_t v47 = [v66 errorWithDomain:v67 code:41013 userInfo:v61];
        }
        v62 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
        v63 = [v62 migrationServiceProxy];
        [v63 boost];

        long long v25 = v18;
LABEL_28:
        long long v26 = v68;

        id v24 = (PLLibraryOpenerCreationOptions *)v47;
        if (v47) {
          goto LABEL_29;
        }
        if (v14 >= 1 && PLHasPathFromSourceStateToTargetState() && self->_reportInProgressUpgrades)
        {
          id v49 = PLLibraryServicesGetLog();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            v50 = [v12 path];
            *(_DWORD *)buf = 138412290;
            v81 = v50;
            _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_ERROR, "Unable to open photo library because it is already being upgraded: %@", buf, 0xCu);
          }
          id v51 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v52 = *MEMORY[0x1E4F8C500];
          uint64_t v74 = *MEMORY[0x1E4F28328];
          v53 = [v12 path];
          v75 = v53;
          long long v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
          id v24 = [v51 errorWithDomain:v52 code:41013 userInfo:v54];

          long long v55 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
          long long v56 = [v55 migrationServiceProxy];
          [v56 boost];

          if (v24)
          {
LABEL_29:
            if (v26)
            {
              id v24 = v24;
              BOOL v15 = 0;
              *long long v26 = v24;
            }
            else
            {
              BOOL v15 = 0;
            }
LABEL_32:

            goto LABEL_33;
          }
        }
LABEL_7:
        long long v27 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
        id v70 = 0;
        int v28 = [v27 activate:&v70];
        id v24 = (PLLibraryOpenerCreationOptions *)v70;

        if (v28)
        {
          v29 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
          v69 = v24;
          [v29 awaitLibraryState:7 error:&v69];
          int v30 = v69;

          id v24 = v30;
        }
        if (!v24)
        {
          BOOL v15 = 1;
LABEL_33:

          goto LABEL_34;
        }
        goto LABEL_29;
      }
      v45 = PLLibraryServicesGetLog();
      long long v25 = v18;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = [v12 path];
        *(_DWORD *)buf = 138412546;
        v81 = v46;
        __int16 v82 = 2112;
        id v83 = v38;
        _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_ERROR, "Unable to open photo library because of insufficient permissions: %@, %@", buf, 0x16u);
      }
      id v39 = v38;
      id v38 = v39;
    }
    else
    {
      if (v6)
      {
        v31 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
        id v24 = [v31 openerCreationOptions];

        long long v25 = v18;
        if (!v24)
        {
          int v32 = [PLLibraryOpenerCreationOptions alloc];
          uint64_t v33 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
          id v24 = -[PLLibraryOpenerCreationOptions initWithWellKnownLibraryIdentifier:](v32, "initWithWellKnownLibraryIdentifier:", [v33 wellKnownPhotoLibraryIdentifier]);

          if (!v24)
          {
            id v64 = [MEMORY[0x1E4F28B00] currentHandler];
            [v64 handleFailureInMethod:a2, self, @"PLPhotoLibraryOpener.m", 270, @"Invalid parameter not satisfying: %@", @"openerCreationOptions != nil" object file lineNumber description];
          }
        }
        BOOL v15 = [(PLPhotoLibraryOpener *)self createPhotoLibraryDatabaseWithOptions:v24 error:v68];
        goto LABEL_32;
      }
      v34 = PLLibraryServicesGetLog();
      long long v25 = v18;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = [v12 path];
        *(_DWORD *)buf = 138412290;
        v81 = v35;
        _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Unable to open photo library because it does not exist at path %@.", buf, 0xCu);
      }
      v36 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F8C500];
      uint64_t v76 = *MEMORY[0x1E4F28328];
      id v24 = [v12 path];
      v77 = v24;
      id v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      id v39 = [v36 errorWithDomain:v37 code:41015 userInfo:v38];
    }
    uint64_t v47 = (uint64_t)v39;
    goto LABEL_28;
  }
  BOOL v15 = 1;
LABEL_34:

  return v15;
}

- (BOOL)createPhotoLibraryDatabaseWithOptions:(id)a3 error:(id *)a4
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    id v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"PLPhotoLibraryOpener.m", 155, @"Invalid parameter not satisfying: %@", @"PLIsAssetsd()" object file lineNumber description];
  }
  v8 = [MEMORY[0x1E4F8B908] fileManager];
  unsigned __int8 v46 = 0;
  id v9 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
  v10 = [v9 pathManager];
  int v11 = [v10 libraryURL];

  id v12 = [v11 path];
  LODWORD(v10) = [v8 fileExistsAtPath:v12 isDirectory:&v46];
  int v13 = v46;

  if (v10 && v13)
  {
    if ([(id)objc_opt_class() canAutomaticallyCreateLibrary]) {
      goto LABEL_16;
    }
    uint64_t v14 = [v8 contentsOfDirectoryAtURL:v11 includingPropertiesForKeys:0 options:0 error:0];
    if ([v14 count])
    {
      BOOL v15 = a4;
      v16 = PLLibraryServicesGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [v11 path];
        *(_DWORD *)buf = 138412290;
        uint64_t v48 = v17;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "It is forbidden to create a photo library where one already exists at path %@.", buf, 0xCu);
      }
      id v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F8C500];
      uint64_t v51 = *MEMORY[0x1E4F28328];
      int v20 = [v11 path];
      v52[0] = v20;
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
      id v22 = [v18 errorWithDomain:v19 code:41005 userInfo:v21];

      a4 = v15;
    }
    else
    {
      id v22 = 0;
    }
  }
  else
  {
    id v45 = 0;
    char v23 = [v8 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v45];
    id v22 = v45;
    if (v23) {
      goto LABEL_15;
    }
    uint64_t v14 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v24 = [v11 path];
      *(_DWORD *)buf = 138412546;
      uint64_t v48 = v24;
      __int16 v49 = 2112;
      id v50 = v22;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "PLPhotoLibraryOpener createPhotoLibraryDatabaseWithOptions failed to create directory at %@ : %@", buf, 0x16u);
    }
  }

LABEL_15:
  if (v22) {
    goto LABEL_26;
  }
LABEL_16:
  int v40 = v8;
  char v41 = a4;
  long long v25 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
  [v25 setCreateMode:1 options:v7];

  long long v26 = [v7 libraryName];
  if (!v26)
  {
    long long v27 = [v11 lastPathComponent];
    long long v26 = [v27 stringByDeletingPathExtension];
  }
  int v28 = [v7 containerIdentifier];
  v29 = [v7 uuid];
  int v30 = [v7 userDescription];
  id v44 = 0;
  v31 = +[PLPhotoLibraryIdentifier createPhotoLibraryIdentifierWithPhotoLibraryURL:v11 containerIdentifier:v28 uuid:v29 name:v26 userDescription:v30 error:&v44];
  id v32 = v44;

  if (!v31)
  {
    uint64_t v35 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v48 = v11;
      __int16 v49 = 2112;
      id v50 = v32;
      _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "Error creating library identifier for %@ %@", buf, 0x16u);
    }
    goto LABEL_23;
  }
  uint64_t v33 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
  id v43 = v32;
  int v34 = [v33 activate:&v43];
  id v22 = v43;

  if (v34)
  {
    uint64_t v35 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
    id v42 = v22;
    [v35 awaitLibraryState:7 error:&v42];
    id v32 = v42;

LABEL_23:
    v8 = v40;

    id v22 = v32;
    goto LABEL_25;
  }
  v8 = v40;
LABEL_25:
  v36 = [(PLPhotoLibraryOpener *)self libraryServicesManager];
  [v36 setCreateMode:0 options:0];

  a4 = v41;
  if (!v22)
  {
    BOOL v37 = 1;
    goto LABEL_30;
  }
LABEL_26:
  if (a4)
  {
    id v22 = v22;
    BOOL v37 = 0;
    *a4 = v22;
  }
  else
  {
    BOOL v37 = 0;
  }
LABEL_30:

  return v37;
}

- (PLPhotoLibraryOpener)initWithLibraryServicesManager:(id)a3 reportInProgressUpgrades:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLPhotoLibraryOpener;
  v8 = [(PLPhotoLibraryOpener *)&v12 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_libraryServicesManager, a3);
    v9->_reportInProgressUpgrades = a4;
    v10 = v9;
  }

  return v9;
}

+ (BOOL)deleteLibraryFromFilesystemAtURL:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    int v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, a1, @"PLPhotoLibraryOpener.m", 376, @"Invalid parameter not satisfying: %@", @"PLIsAssetsd()" object file lineNumber description];
  }
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v36 = 0;
  char v9 = [v8 removeItemAtURL:v7 error:&v36];
  id v10 = v36;

  char v40 = v9;
  if (!*((unsigned char *)v38 + 24))
  {
    int v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v42 = v7;
      __int16 v43 = 2112;
      id v44 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Error removing photo library at %@ : %@", buf, 0x16u);
    }

    if ([v10 code] == 513)
    {
      objc_super v12 = [v10 domain];
      int v13 = [v12 isEqualToString:*MEMORY[0x1E4F281F8]];

      if (v13)
      {
        uint64_t v14 = [v10 userInfo];
        BOOL v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

        if ([v15 code] == 66)
        {
          v16 = [v15 domain];
          int v17 = [v16 isEqualToString:*MEMORY[0x1E4F28798]];

          if (v17)
          {
            id v18 = [MEMORY[0x1E4F28CB8] defaultManager];
            uint64_t v19 = [v7 path];
            id v35 = 0;
            int v20 = [v18 subpathsOfDirectoryAtPath:v19 error:&v35];
            id v21 = v35;

            if (v20)
            {
              id v22 = PLBackendGetLog();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                char v23 = [v20 componentsJoinedByString:@", "];
                *(_DWORD *)buf = 138412290;
                id v42 = v23;
                _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Photo library bundle still contains:%@", buf, 0xCu);
              }
              id v24 = [v20 sortedArrayUsingComparator:&__block_literal_global_69546];
              dispatch_time_t v25 = dispatch_time(0, 3000000000);
              long long v26 = dispatch_get_global_queue(21, 0);
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __63__PLPhotoLibraryOpener_deleteLibraryFromFilesystemAtURL_error___block_invoke_2;
              block[3] = &unk_1E5875340;
              id v32 = v24;
              id v33 = v7;
              int v34 = &v37;
              long long v27 = v24;
              dispatch_after(v25, v26, block);
            }
            else
            {
              long long v27 = PLBackendGetLog();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v42 = v21;
                _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Cannot get library bundle contents:%@", buf, 0xCu);
              }
            }
          }
        }
      }
    }
  }
  if (*((unsigned char *)v38 + 24))
  {
    BOOL v28 = 1;
  }
  else
  {
    BOOL v28 = 0;
    if (a4 && v10)
    {
      *a4 = v10;
      BOOL v28 = *((unsigned char *)v38 + 24) != 0;
    }
  }
  _Block_object_dispose(&v37, 8);

  return v28;
}

void __63__PLPhotoLibraryOpener_deleteLibraryFromFilesystemAtURL_error___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v25;
    *(void *)&long long v4 = 67109378;
    long long v22 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        char v9 = objc_msgSend(*(id *)(a1 + 40), "path", v22);
        id v10 = [v9 stringByAppendingPathComponent:v8];

        unsigned __int8 v23 = 0;
        int v11 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v12 = [v11 fileExistsAtPath:v10 isDirectory:&v23];
        int v13 = v23;

        id v14 = v10;
        BOOL v15 = (const char *)[v14 fileSystemRepresentation];
        if (v12) {
          BOOL v16 = v13 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (v16)
        {
          if (unlink(v15))
          {
            int v17 = PLBackendGetLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              int v18 = *__error();
              *(_DWORD *)buf = v22;
              int v29 = v18;
              __int16 v30 = 2112;
              id v31 = v14;
              uint64_t v19 = v17;
              int v20 = "unlink failed with errno %d for path %@";
              goto LABEL_17;
            }
LABEL_18:

            goto LABEL_20;
          }
        }
        else if (rmdir(v15))
        {
          int v17 = PLBackendGetLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            int v21 = *__error();
            *(_DWORD *)buf = v22;
            int v29 = v21;
            __int16 v30 = 2112;
            id v31 = v14;
            uint64_t v19 = v17;
            int v20 = "rmdir failed with errno %d for path %@";
LABEL_17:
            _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x12u);
          }
          goto LABEL_18;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_20:
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v5);
  }
}

uint64_t __63__PLPhotoLibraryOpener_deleteLibraryFromFilesystemAtURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 length];
  if (v6 <= [v5 length])
  {
    uint64_t v8 = [v4 length];
    uint64_t v7 = v8 != [v5 length];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

+ (id)createManagedPhotoLibraryOnFilesystemWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PLPhotoLibraryOpener.m", 116, @"Invalid parameter not satisfying: %@", @"PLIsAssetsd()" object file lineNumber description];
  }
  id v7 = v6;
  uint64_t v8 = PLSafeResultWithUnfairLock();

  return v8;
}

id __79__PLPhotoLibraryOpener_createManagedPhotoLibraryOnFilesystemWithOptions_error___block_invoke(uint64_t a1)
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  id v32 = 0;
  id v4 = [v2 _resolvePhotoLibraryBundleURLWithOptions:v3 error:&v32];
  id v5 = v32;
  if (!v4)
  {
LABEL_14:
    long long v22 = *(void **)(a1 + 48);
    id v23 = v5;
    id v4 = 0;
    if (v22) {
      goto LABEL_12;
    }
LABEL_15:
    id v7 = 0;
    goto LABEL_16;
  }
  if ([*(id *)(a1 + 32) hasCustomUUID]
    && ([*(id *)(a1 + 40) _validateUniqueLibraryIdentifierUUIDWithCreationOptions:*(void *)(a1 + 32)] & 1) == 0)
  {

    long long v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F8C500];
    uint64_t v39 = *MEMORY[0x1E4F28A50];
    long long v26 = [MEMORY[0x1E4F28C58] errorWithDomain:v25 code:46110 userInfo:0];
    v40[0] = v26;
    long long v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    uint64_t v28 = [v24 errorWithDomain:v25 code:46018 userInfo:v27];

    id v5 = (id)v28;
    goto LABEL_14;
  }
  id v6 = +[PLPhotoLibraryBundleController sharedBundleController];
  id v7 = [v6 lookupOrCreateBundleForLibraryURL:v4];

  uint64_t v8 = [v7 libraryServicesManager];
  char v9 = [[PLPhotoLibraryOpener alloc] initWithLibraryServicesManager:v8 reportInProgressUpgrades:0];
  uint64_t v10 = *(void *)(a1 + 32);
  id v31 = v5;
  BOOL v11 = [(PLPhotoLibraryOpener *)v9 createPhotoLibraryDatabaseWithOptions:v10 error:&v31];
  id v12 = v31;

  if (!v11)
  {
    int v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F8C500];
    uint64_t v15 = *MEMORY[0x1E4F28A50];
    v37[0] = *MEMORY[0x1E4F289D0];
    v37[1] = v15;
    v38[0] = v4;
    v38[1] = v12;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
    int v17 = [v13 errorWithDomain:v14 code:46018 userInfo:v16];

    int v18 = [v7 bundleController];
    [v18 shutdownBundle:v7 reason:v17];

    uint64_t v19 = *(void **)(a1 + 40);
    id v30 = 0;
    LOBYTE(v16) = [v19 deleteLibraryFromFilesystemAtURL:v4 error:&v30];
    id v20 = v30;
    if ((v16 & 1) == 0)
    {
      int v21 = PLLibraryServicesGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        int v34 = v4;
        __int16 v35 = 2112;
        id v36 = v20;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to cleanup after failed library creation with URL: %@  error %@", buf, 0x16u);
      }
    }
    id v7 = 0;
  }

  long long v22 = *(void **)(a1 + 48);
  id v23 = v12;
  if (!v7)
  {
    if (v22)
    {
LABEL_12:
      id v23 = v23;
      id v7 = 0;
      *long long v22 = v23;
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_16:

  return v7;
}

+ (id)_resolvePhotoLibraryBundleURLWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 internalTestOptions];
  id v6 = [v4 libraryBundleURL];
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F8B980], "rootURLForPhotoLibraryDomain:", objc_msgSend(v4, "domain"));
    if (v5)
    {
      uint64_t v9 = *MEMORY[0x1E4F8C4C0];
      uint64_t v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8C4C0]];

      if (v10)
      {
        uint64_t v11 = [v5 objectForKeyedSubscript:v9];

        uint64_t v8 = (void *)v11;
      }
    }
    id v12 = [v4 containerIdentifier];
    int v13 = [v8 URLByAppendingPathComponent:v12];

    uint64_t v14 = [v4 uuid];
    uint64_t v15 = [v13 URLByAppendingPathComponent:v14];
    uint64_t v16 = [MEMORY[0x1E4F8B980] photosLibraryExtension];
    int v17 = [v15 URLByAppendingPathExtension:v16];

    int v18 = [MEMORY[0x1E4F8B908] fileManager];
    uint64_t v19 = [v17 path];
    int v20 = [v18 fileExistsAtPath:v19 isDirectory:0];

    if (v20)
    {
      int v21 = [MEMORY[0x1E4F29128] UUID];
      long long v22 = [v21 UUIDString];

      id v23 = PLLibraryServicesGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        long long v24 = [v4 uuid];
        uint64_t v25 = [MEMORY[0x1E4F8B980] photosLibraryExtension];
        int v30 = 138543874;
        id v31 = v24;
        __int16 v32 = 2114;
        uint64_t v33 = v22;
        __int16 v34 = 2114;
        __int16 v35 = v25;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Failed to create photo library bundle with name matching identifier UUID %{public}@, renamed as %{public}@.%{public}@", (uint8_t *)&v30, 0x20u);
      }
      long long v26 = [v13 URLByAppendingPathComponent:v22];
      long long v27 = [MEMORY[0x1E4F8B980] photosLibraryExtension];
      uint64_t v28 = [v26 URLByAppendingPathExtension:v27];

      int v17 = (void *)v28;
    }
    else
    {
      long long v22 = v14;
    }
    id v7 = v17;
  }
  return v7;
}

+ (BOOL)_validateUniqueLibraryIdentifierUUIDWithCreationOptions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(PLPhotoLibrarySearchCriteria);
  id v5 = [v3 uuid];
  [(PLPhotoLibrarySearchCriteria *)v4 setUuid:v5];

  -[PLPhotoLibrarySearchCriteria setDomain:](v4, "setDomain:", [v3 domain]);
  id v6 = [v3 containerIdentifier];
  [(PLPhotoLibrarySearchCriteria *)v4 setContainerIdentifier:v6];

  id v7 = [v3 internalTestOptions];
  [(PLPhotoLibrarySearchCriteria *)v4 setInternalTestOptions:v7];

  uint64_t v8 = [[PLPhotoLibraryFinder alloc] initWithSearchCriteria:v4];
  uint64_t v9 = [(PLPhotoLibraryFinder *)v8 findMatchingPhotoLibraryIdentifiersWithOptions:1 error:0];
  uint64_t v10 = [v9 count];
  if (v10)
  {
    uint64_t v11 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v3 uuid];
      int v14 = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      int v17 = v9;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Library identifier %{public}@ already exists: %@", (uint8_t *)&v14, 0x16u);
    }
  }

  return v10 == 0;
}

+ (BOOL)canAutomaticallyCreateLibrary
{
  return 1;
}

@end