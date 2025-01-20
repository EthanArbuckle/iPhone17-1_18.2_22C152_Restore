@interface PBFPosterExtensionDataStoreMigrator
+ (BOOL)migrateDataStoreAtBaseURL:(id)a3 fromVersion:(unint64_t)a4 toVersion:(unint64_t)a5 cleanupAfterMigrationSucceeds:(BOOL)a6 error:(id *)a7;
- (BOOL)isDataStoreUpToDateForCurrentVersion;
- (BOOL)shouldCleanupAfterMigration;
- (BOOL)validateDataStoreIntegrity:(id *)a3;
- (NSIndexSet)availableDataStoreVersions;
- (NSURL)baseURL;
- (PBFPosterExtensionDataStoreMigrator)initWithBaseURL:(id)a3;
- (unint64_t)_mostUpToDateValidDataStoreToMigrateFrom;
- (unint64_t)migrateDataStoreToCurrentVersion:(id *)a3;
- (void)archiveDataStoresBeforeCurrentDataStoreVersion;
- (void)markDataStoreArchivesAsPurgable;
- (void)removeArchivedDataStores;
- (void)removeDataStoresBeforeCurrentDataStoreVersion;
- (void)setShouldCleanupAfterMigration:(BOOL)a3;
@end

@implementation PBFPosterExtensionDataStoreMigrator

- (PBFPosterExtensionDataStoreMigrator)initWithBaseURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PBFPosterExtensionDataStoreMigrator;
  v5 = [(PBFPosterExtensionDataStoreMigrator *)&v10 init];
  if (v5)
  {
    v6 = [v4 standardizedURL];
    uint64_t v7 = [v6 copy];
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v7;

    v5->_shouldCleanupAfterMigration = 0;
  }

  return v5;
}

- (BOOL)validateDataStoreIntegrity:(id *)a3
{
  unint64_t v5 = +[PBFPosterExtensionDataStore dataStoreVersion];
  v6 = [(PBFPosterExtensionDataStoreMigrator *)self baseURL];
  LOBYTE(a3) = _PBFDetermineDataStoreViabilityForVersionWithinBaseURL(v6, v5, a3);

  return (char)a3;
}

- (BOOL)isDataStoreUpToDateForCurrentVersion
{
  unint64_t v3 = +[PBFPosterExtensionDataStore dataStoreVersion];
  id v4 = [(PBFPosterExtensionDataStoreMigrator *)self baseURL];
  if (_PBFDetermineDataStoreViabilityForVersionWithinBaseURL(v4, v3, 0))
  {
    unint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreSQLiteDatabaseURLForBaseURL:version:", v4, v3);
    v6 = [[PBFPosterExtensionDataStoreSQLiteDatabase alloc] initWithURL:v5 options:4 error:0];
    BOOL v7 = [(PBFPosterExtensionDataStoreSQLiteDatabase *)v6 version] == 2;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)migrateDataStoreToCurrentVersion:(id *)a3
{
  v36[2] = *MEMORY[0x1E4F143B8];
  if (![(PBFPosterExtensionDataStoreMigrator *)self isDataStoreUpToDateForCurrentVersion])
  {
    int64_t v6 = +[PBFPosterExtensionDataStore minimumDataStoreVersion];
    int64_t v7 = +[PBFPosterExtensionDataStore dataStoreVersion];
    v8 = [(PBFPosterExtensionDataStoreMigrator *)self baseURL];
    v9 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreVersionContainingURLForBaseURL:", v8);
    objc_super v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    v11 = [v9 path];
    int v12 = [v10 fileExistsAtPath:v11 isDirectory:0];

    if (!v12)
    {
LABEL_6:
      if ([(PBFPosterExtensionDataStoreMigrator *)self isDataStoreUpToDateForCurrentVersion])
      {
        unint64_t v5 = 2;
LABEL_30:

        return v5;
      }
      unint64_t v20 = [(PBFPosterExtensionDataStoreMigrator *)self _mostUpToDateValidDataStoreToMigrateFrom];
      if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v21 = v6;
      }
      else {
        unint64_t v21 = v20;
      }
      v22 = (void *)MEMORY[0x1D9433EF0]();
      id v29 = 0;
      BOOL v23 = +[PBFPosterExtensionDataStoreMigrator migrateDataStoreAtBaseURL:v8 fromVersion:v21 toVersion:v7 cleanupAfterMigrationSucceeds:[(PBFPosterExtensionDataStoreMigrator *)self shouldCleanupAfterMigration] error:&v29];
      id v19 = v29;
      if (v23)
      {
        unint64_t v5 = 4;
      }
      else
      {
        unint64_t v5 = 0;
        if (a3 && v19)
        {
          unint64_t v5 = 0;
          *a3 = v19;
        }
      }
LABEL_29:

      goto LABEL_30;
    }
    int64_t v28 = v7;
    uint64_t v13 = *MEMORY[0x1E4F1C598];
    uint64_t v14 = *MEMORY[0x1E4F1C668];
    v35[0] = *MEMORY[0x1E4F1C590];
    v35[1] = v14;
    v36[0] = v13;
    v36[1] = MEMORY[0x1E4F1CC38];
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
    id v31 = 0;
    id v32 = 0;
    char v16 = objc_msgSend(v9, "pbf_recursivelyValidateContentsAreReachableAndConformToResourceValues:URLsNotConformingToAttributes:error:", v15, &v32, &v31);
    id v17 = v32;
    id v18 = v31;
    id v19 = v18;
    if (v16)
    {
LABEL_5:

      int64_t v7 = v28;
      goto LABEL_6;
    }
    if (v18)
    {
      v24 = PBFLogMigration();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStoreMigrator migrateDataStoreToCurrentVersion:]();
      }
    }
    else
    {
      id v30 = 0;
      char v25 = objc_msgSend(v8, "pbf_recursivelyUpdateResourceValues:error:", v15, &v30);
      id v19 = v30;
      v26 = PBFLogMigration();
      v24 = v26;
      if (v25)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v34 = v8;
          _os_log_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_INFO, "Success updating file attributes for URL '%{public}@'", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        -[PBFPosterExtensionDataStoreMigrator migrateDataStoreToCurrentVersion:]();
      }
    }

    if (a3 && v19)
    {
      *a3 = v19;
    }
    else if (!v19)
    {
      goto LABEL_5;
    }

    unint64_t v5 = 1;
    goto LABEL_29;
  }
  return 3;
}

- (unint64_t)_mostUpToDateValidDataStoreToMigrateFrom
{
  v2 = [(PBFPosterExtensionDataStoreMigrator *)self baseURL];
  unint64_t v3 = +[PBFPosterExtensionDataStore minimumDataStoreVersion];
  unint64_t v4 = +[PBFPosterExtensionDataStore dataStoreVersion];
  if (v4 < v3)
  {
LABEL_5:
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v5 = v4;
    while ((_PBFDetermineDataStoreViabilityForVersionWithinBaseURL(v2, v5, 0) & 1) == 0)
    {
      if (--v5 < v3) {
        goto LABEL_5;
      }
    }
  }

  return v5;
}

- (NSIndexSet)availableDataStoreVersions
{
  unint64_t v3 = objc_opt_new();
  unint64_t v4 = [(PBFPosterExtensionDataStoreMigrator *)self baseURL];
  unint64_t v5 = +[PBFPosterExtensionDataStore minimumDataStoreVersion];
  unint64_t v6 = +[PBFPosterExtensionDataStore dataStoreVersion];
  if (v6 >= v5)
  {
    unint64_t v7 = v6;
    do
    {
      if (_PBFDetermineDataStoreViabilityForVersionWithinBaseURL(v4, v7, 0)) {
        [v3 addIndex:v7];
      }
      --v7;
    }
    while (v7 >= v5);
  }

  return (NSIndexSet *)v3;
}

- (void)removeDataStoresBeforeCurrentDataStoreVersion
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  unint64_t v4 = [(PBFPosterExtensionDataStoreMigrator *)self baseURL];
  if (objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_keynoteModeEnabled"))
  {
    unint64_t v5 = PBFLogMigration();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "Keynote mode; not cleaning up old data stores.", buf, 2u);
    }
  }
  else
  {
    unint64_t v6 = +[PBFPosterExtensionDataStore minimumDataStoreVersion];
    unint64_t v7 = +[PBFPosterExtensionDataStore dataStoreVersion]
       - 1;
    if (v7 >= v6)
    {
      *(void *)&long long v8 = 138543618;
      long long v14 = v8;
      do
      {
        v9 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreURLForBaseURL:version:", v4, v7, v14);
        if ([v9 checkResourceIsReachableAndReturnError:0])
        {
          id v15 = 0;
          int v10 = [v3 removeItemAtURL:v9 error:&v15];
          id v11 = v15;
          int v12 = PBFLogMigration();
          uint64_t v13 = v12;
          if (v10)
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v17 = v9;
              _os_log_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_DEFAULT, "Cleaned up abandoned data store url '%{public}@'", buf, 0xCu);
            }
          }
          else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            id v17 = v9;
            __int16 v18 = 2114;
            id v19 = v11;
            _os_log_error_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_ERROR, "Error cleaning up abandoned data store url %{public}@, error:%{public}@", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v13 = PBFLogMigration();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v17 = v9;
            _os_log_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_DEFAULT, "No data store @ '%{public}@'", buf, 0xCu);
          }
          id v11 = 0;
        }

        --v7;
      }
      while (v7 >= v6);
    }
  }
}

- (void)archiveDataStoresBeforeCurrentDataStoreVersion
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [(PBFPosterExtensionDataStoreMigrator *)self baseURL];
  int v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_keynoteModeEnabled");
  unint64_t v4 = PBFLogMigration();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "Keynote mode; not archiving old data stores.", buf, 2u);
    }
    goto LABEL_17;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "Archived data store directory is ready...", buf, 2u);
  }

  unint64_t v6 = [PBFDataStoreArchiveAdjudicator alloc];
  unint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_archivedDataStoreBaseURL");
  unint64_t v4 = [(PBFDataStoreArchiveAdjudicator *)v6 initWithDataStoreBaseURL:v2 archiveBaseURL:v7];

  unint64_t v8 = +[PBFPosterExtensionDataStore minimumDataStoreVersion];
  unint64_t v9 = +[PBFPosterExtensionDataStore dataStoreVersion]
     - 1;
  if (v9 >= v8)
  {
    *(void *)&long long v10 = 134218242;
    long long v19 = v10;
    while (1)
    {
      id v11 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreURLForBaseURL:version:", v2, v9, v19);
      if ([v11 checkResourceIsReachableAndReturnError:0]) {
        break;
      }
LABEL_16:

      if (--v9 < v8) {
        goto LABEL_17;
      }
    }
    id v20 = 0;
    int v12 = [v4 archiveDataStoreVersion:v9 name:@"ArchiveDataStoresBeforeCurrentDataStoreVersion" options:0 removeAfterSuccess:1 error:&v20];
    id v13 = v20;

    long long v14 = PBFLogMigration();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v15)
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v22 = v9;
        char v16 = v14;
        id v17 = "Successfully archived data store %lu";
        uint32_t v18 = 12;
LABEL_14:
        _os_log_impl(&dword_1D31CE000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, v18);
      }
    }
    else if (v15)
    {
      *(_DWORD *)buf = v19;
      unint64_t v22 = v9;
      __int16 v23 = 2114;
      id v24 = v13;
      char v16 = v14;
      id v17 = "Failed to archive data store %lu: %{public}@";
      uint32_t v18 = 22;
      goto LABEL_14;
    }

    goto LABEL_16;
  }
LABEL_17:
}

- (void)markDataStoreArchivesAsPurgable
{
  int v3 = PBFLogMigration();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v8 = 0;
    _os_log_impl(&dword_1D31CE000, v3, OS_LOG_TYPE_DEFAULT, "marking archives as purgable", v8, 2u);
  }

  unint64_t v4 = [(PBFPosterExtensionDataStoreMigrator *)self baseURL];
  BOOL v5 = [PBFDataStoreArchiveAdjudicator alloc];
  unint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_archivedDataStoreBaseURL");
  unint64_t v7 = [(PBFDataStoreArchiveAdjudicator *)v5 initWithDataStoreBaseURL:v4 archiveBaseURL:v6];

  [(PBFDataStoreArchiveAdjudicator *)v7 markArchivesAsPurgable:0];
}

- (void)removeArchivedDataStores
{
  int v3 = PBFLogMigration();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v8 = 0;
    _os_log_impl(&dword_1D31CE000, v3, OS_LOG_TYPE_DEFAULT, "purging archived data stores", v8, 2u);
  }

  unint64_t v4 = [(PBFPosterExtensionDataStoreMigrator *)self baseURL];
  BOOL v5 = [PBFDataStoreArchiveAdjudicator alloc];
  unint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_archivedDataStoreBaseURL");
  unint64_t v7 = [(PBFDataStoreArchiveAdjudicator *)v5 initWithDataStoreBaseURL:v4 archiveBaseURL:v6];

  [(PBFDataStoreArchiveAdjudicator *)v7 markArchivesAsPurgable:0];
}

+ (BOOL)migrateDataStoreAtBaseURL:(id)a3 fromVersion:(unint64_t)a4 toVersion:(unint64_t)a5 cleanupAfterMigrationSucceeds:(BOOL)a6 error:(id *)a7
{
  BOOL v7 = a6;
  v248[3] = *MEMORY[0x1E4F143B8];
  long long v10 = (uint64_t (*)(uint64_t, uint64_t))a3;
  unint64_t v157 = +[PBFPosterExtensionDataStore minimumDataStoreVersion];
  unint64_t v159 = +[PBFPosterExtensionDataStore dataStoreVersion];
  unint64_t v161 = a4;
  v170 = v10;
  if (a4 == a5 && a5 >= 0x3D)
  {
    id v11 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreSQLiteDatabaseURLForBaseURL:version:", v10, a4);
    int v12 = [[PBFPosterExtensionDataStoreSQLiteDatabase alloc] initWithURL:v11 options:8 error:a7];
    BOOL v13 = v12 != 0;
    [(PBFPosterExtensionDataStoreSQLiteDatabase *)v12 invalidate];

    goto LABEL_209;
  }
  if (v157 <= a4 && v159 >= a5)
  {
    BOOL v151 = v7;
    uint64_t v232 = 0;
    v233[0] = &v232;
    v233[1] = 0x3032000000;
    v233[2] = __Block_byref_object_copy__4;
    v233[3] = __Block_byref_object_dispose__4;
    id v234 = 0;
    uint64_t v228 = 0;
    v229 = &v228;
    uint64_t v230 = 0x2020000000;
    char v231 = 0;
    v171 = [MEMORY[0x1E4F28CB8] defaultManager];
    v153 = objc_opt_new();
    v154 = objc_opt_new();
    if (a4 > a5) {
      goto LABEL_168;
    }
    *(void *)&long long v20 = 134217984;
    long long v148 = v20;
    unint64_t v21 = a4;
    while (1)
    {
      unint64_t v22 = PBFLogMigration();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        _os_log_impl(&dword_1D31CE000, v22, OS_LOG_TYPE_DEFAULT, "Beginning migration to Version %lu (%@)", buf, 0x16u);
      }
      unint64_t v166 = v21;

      unint64_t v23 = v21;
      unint64_t v24 = v21 - 1;
      uint64_t v25 = v170;
      v163 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreURLForBaseURL:version:", v170, v24);
      v165 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreURLForBaseURL:version:", v170, v23);
      if (v23 != v159) {
        [v153 addObject:v165];
      }
      if (v23 != v161) {
        [v154 addObject:v165];
      }
      if (_PBFDetermineDataStoreViabilityForVersionWithinBaseURL(v170, v23, 0))
      {
        v26 = v229 + 3;
        goto LABEL_65;
      }
      if ([v163 checkResourceIsReachableAndReturnError:0])
      {
        [v171 removeItemAtURL:v165 error:0];
        if (([v171 copyItemAtURL:v163 toURL:v165 error:a7] & 1) == 0) {
          goto LABEL_167;
        }
      }
      else
      {
        v172 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreExtensionContainerURLForBaseURL:version:", v170, v23);
        uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_galleryCacheURLForBaseURL:version:", v170, v23);
        v246[0] = v165;
        v246[1] = v172;
        v168 = (void *)v27;
        v246[2] = v27;
        int64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v246 count:3];
        long long v226 = 0u;
        long long v227 = 0u;
        long long v224 = 0u;
        long long v225 = 0u;
        id v29 = v28;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v224 objects:v245 count:16];
        if (v30)
        {
          uint64_t v31 = *(void *)v225;
LABEL_25:
          uint64_t v32 = 0;
          while (1)
          {
            if (*(void *)v225 != v31) {
              objc_enumerationMutation(v29);
            }
            v33 = *(void **)(*((void *)&v224 + 1) + 8 * v32);
            if ((objc_msgSend(v33, "checkResourceIsReachableAndReturnError:", 0, v148) & 1) == 0)
            {
              v34 = PFFileProtectionNoneAttributes();
              v35 = (id *)(v233[0] + 40);
              obuint64_t j = *(id *)(v233[0] + 40);
              char v36 = [v171 createDirectoryAtURL:v33 withIntermediateDirectories:1 attributes:v34 error:&obj];
              objc_storeStrong(v35, obj);

              if ((v36 & 1) == 0) {
                break;
              }
            }
            v37 = PFPosterPathURLResourceValues();
            objc_msgSend(v33, "pbf_recursivelyUpdateResourceValues:error:", v37, 0);

            if (v30 == ++v32)
            {
              uint64_t v30 = [v29 countByEnumeratingWithState:&v224 objects:v245 count:16];
              if (v30) {
                goto LABEL_25;
              }
              break;
            }
          }
        }

        char v38 = _PBFDetermineDataStoreViabilityForVersionWithinBaseURL(v170, v166, 0);
        *((unsigned char *)v229 + 24) = v38;

        uint64_t v25 = v170;
        unint64_t v23 = v166;
      }
      if (v23 == 60) {
        break;
      }
      if (v23 == 61)
      {
        v39 = PBFLogMigration();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D31CE000, v39, OS_LOG_TYPE_DEFAULT, "Kicking off 61 migration", buf, 2u);
        }

        v155 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreSQLiteDatabaseURLForBaseURL:version:", v170, 61);
        v40 = [PBFPosterExtensionDataStoreSQLiteDatabase alloc];
        uint64_t v41 = v233[0];
        id v222 = 0;
        v169 = [(PBFPosterExtensionDataStoreSQLiteDatabase *)v40 initWithURL:v155 options:9 error:&v222];
        objc_storeStrong((id *)(v41 + 40), v222);
        if (v169 && !*(void *)(v233[0] + 40))
        {
          v42 = objc_opt_new();
          v43 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreExtensionContainerURLForBaseURL:version:", v170, 61);
          v44 = _PBFExtensionStoreCoordinatorsForDataStoreExtensionContainerURL(v43, 0);

          v45 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
          v220[0] = MEMORY[0x1E4F143A8];
          v220[1] = 3221225472;
          v220[2] = __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke;
          v220[3] = &unk_1E6982C70;
          id v46 = v45;
          id v221 = v46;
          [v44 enumerateObjectsUsingBlock:v220];
          long long v218 = 0u;
          long long v219 = 0u;
          long long v216 = 0u;
          long long v217 = 0u;
          id v47 = v44;
          uint64_t v48 = [v47 countByEnumeratingWithState:&v216 objects:v244 count:16];
          if (v48)
          {
            uint64_t v49 = *(void *)v217;
            do
            {
              for (uint64_t i = 0; i != v48; ++i)
              {
                if (*(void *)v217 != v49) {
                  objc_enumerationMutation(v47);
                }
                v51 = *(void **)(*((void *)&v216 + 1) + 8 * i);
                objc_msgSend(v51, "enumerateDescriptorStoreCoordinators:", &__block_literal_global_41, v148);
                [v51 enumerateConfigurationStoreCoordinators:&__block_literal_global_43];
                v52 = PBFLogMigration();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D31CE000, v52, OS_LOG_TYPE_DEFAULT, "Begin attribute migration", buf, 2u);
                }

                *(void *)buf = 0;
                *(void *)&buf[8] = buf;
                *(void *)&buf[16] = 0x3032000000;
                v241 = __Block_byref_object_copy__4;
                v242 = __Block_byref_object_dispose__4;
                id v243 = 0;
                v207[0] = MEMORY[0x1E4F143A8];
                v207[1] = 3221225472;
                v207[2] = __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_44;
                v207[3] = &unk_1E6982D00;
                v208 = v169;
                id v209 = v42;
                id v210 = v46;
                unint64_t v214 = a5;
                uint64_t v215 = 61;
                v211 = v170;
                v212 = &v228;
                v213 = buf;
                [v51 enumerateConfigurationStoreCoordinators:v207];
                v53 = *(void **)(*(void *)&buf[8] + 40);
                if (v53)
                {
                  objc_storeStrong((id *)(v233[0] + 40), v53);
                  v54 = PBFLogMigration();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
                    +[PBFPosterExtensionDataStoreMigrator migrateDataStoreAtBaseURL:fromVersion:toVersion:cleanupAfterMigrationSucceeds:error:]();
                  }
                }
                _Block_object_dispose(buf, 8);
              }
              uint64_t v48 = [v47 countByEnumeratingWithState:&v216 objects:v244 count:16];
            }
            while (v48);
          }

LABEL_61:
LABEL_62:

          uint64_t v25 = v170;
          unint64_t v23 = v166;
          goto LABEL_63;
        }
LABEL_60:
        *((unsigned char *)v229 + 24) = 0;
        goto LABEL_61;
      }
LABEL_63:
      if (*(void *)(v233[0] + 40) || (v26 = v229 + 3, !*((unsigned char *)v229 + 24)))
      {
        v125 = PBFLogMigration();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          *(void *)&uint8_t buf[4] = a5;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v23;
          *(_WORD *)&buf[22] = 2112;
          v241 = v25;
          _os_log_impl(&dword_1D31CE000, v125, OS_LOG_TYPE_DEFAULT, "Failed to migrate to Version %lu from %lu (%@)", buf, 0x20u);
        }

        *((unsigned char *)v229 + 24) = 0;
LABEL_167:

        long long v10 = v170;
LABEL_168:
        if (*(void *)(v233[0] + 40))
        {
          v126 = PBFLogMigration();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR)) {
            +[PBFPosterExtensionDataStoreMigrator migrateDataStoreAtBaseURL:fromVersion:toVersion:cleanupAfterMigrationSucceeds:error:]((uint64_t)v10, (uint64_t)v233, v126);
          }
        }
        else
        {
          v126 = PBFLogMigration();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v10;
            _os_log_impl(&dword_1D31CE000, v126, OS_LOG_TYPE_DEFAULT, "Successfuly setup data store @ baseURL '%@'", buf, 0xCu);
          }
        }

        if (*(void *)(v233[0] + 40))
        {
          long long v181 = 0u;
          long long v182 = 0u;
          long long v179 = 0u;
          long long v180 = 0u;
          id v127 = v154;
          uint64_t v128 = [v127 countByEnumeratingWithState:&v179 objects:v236 count:16];
          if (v128)
          {
            uint64_t v129 = *(void *)v180;
            do
            {
              for (uint64_t j = 0; j != v128; ++j)
              {
                if (*(void *)v180 != v129) {
                  objc_enumerationMutation(v127);
                }
                uint64_t v131 = *(void *)(*((void *)&v179 + 1) + 8 * j);
                v132 = PBFLogMigration();
                if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v131;
                  _os_log_impl(&dword_1D31CE000, v132, OS_LOG_TYPE_DEFAULT, "Cleaning up failed data store URL '%@'", buf, 0xCu);
                }

                [v171 removeItemAtURL:v131 error:0];
              }
              uint64_t v128 = [v127 countByEnumeratingWithState:&v179 objects:v236 count:16];
            }
            while (v128);
          }

          v133 = PBFLogMigration();
          if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v170;
            v134 = "Cleaned up failed data store URL '%@'";
            v135 = v133;
            uint32_t v136 = 12;
            goto LABEL_204;
          }
        }
        else if (v151)
        {
          v137 = PBFLogMigration();
          if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v170;
            _os_log_impl(&dword_1D31CE000, v137, OS_LOG_TYPE_DEFAULT, "Cleaned up after successful data store migration '%@'", buf, 0xCu);
          }

          long long v177 = 0u;
          long long v178 = 0u;
          long long v175 = 0u;
          long long v176 = 0u;
          v133 = v153;
          uint64_t v138 = [v133 countByEnumeratingWithState:&v175 objects:v235 count:16];
          if (v138)
          {
            uint64_t v139 = *(void *)v176;
            do
            {
              for (uint64_t k = 0; k != v138; ++k)
              {
                if (*(void *)v176 != v139) {
                  objc_enumerationMutation(v133);
                }
                uint64_t v141 = *(void *)(*((void *)&v175 + 1) + 8 * k);
                v142 = PBFLogMigration();
                if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v141;
                  _os_log_impl(&dword_1D31CE000, v142, OS_LOG_TYPE_DEFAULT, "Cleaning up successful data store URL '%@'", buf, 0xCu);
                }

                id v174 = 0;
                char v143 = [v171 removeItemAtURL:v141 error:&v174];
                id v144 = v174;
                if ((v143 & 1) == 0)
                {
                  v145 = PBFLogMigration();
                  if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = v141;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v144;
                    _os_log_error_impl(&dword_1D31CE000, v145, OS_LOG_TYPE_ERROR, "Failed to cleanup after '%@': %@", buf, 0x16u);
                  }
                }
              }
              uint64_t v138 = [v133 countByEnumeratingWithState:&v175 objects:v235 count:16];
            }
            while (v138);
          }
        }
        else
        {
          v133 = PBFLogMigration();
          if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v134 = "Not cleaning up after successful data store migration.";
            v135 = v133;
            uint32_t v136 = 2;
LABEL_204:
            _os_log_impl(&dword_1D31CE000, v135, OS_LOG_TYPE_DEFAULT, v134, buf, v136);
          }
        }

        if (a7)
        {
          v146 = *(void **)(v233[0] + 40);
          if (v146) {
            *a7 = v146;
          }
        }
        BOOL v13 = *((unsigned char *)v229 + 24) != 0;

        _Block_object_dispose(&v228, 8);
        _Block_object_dispose(&v232, 8);

LABEL_209:
        long long v10 = v170;
        goto LABEL_210;
      }
LABEL_65:
      unsigned char *v26 = 1;

      unint64_t v21 = v166 + 1;
      long long v10 = v170;
      if (v166 + 1 > a5) {
        goto LABEL_168;
      }
    }
    v55 = PBFLogMigration();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v55, OS_LOG_TYPE_DEFAULT, "Kicking off 60 migration", buf, 2u);
    }

    v155 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreSQLiteDatabaseURLForBaseURL:version:", v170, 60);
    v56 = [PBFPosterExtensionDataStoreSQLiteDatabase alloc];
    uint64_t v57 = v233[0];
    id v206 = 0;
    v169 = [(PBFPosterExtensionDataStoreSQLiteDatabase *)v56 initWithURL:v155 options:10 error:&v206];
    objc_storeStrong((id *)(v57 + 40), v206);
    if (!v169 || *(void *)(v233[0] + 40))
    {
      v58 = PBFLogMigration();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        +[PBFPosterExtensionDataStoreMigrator migrateDataStoreAtBaseURL:fromVersion:toVersion:cleanupAfterMigrationSucceeds:error:]();
      }

      goto LABEL_60;
    }
    v59 = PBFLogMigration();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v59, OS_LOG_TYPE_DEFAULT, "Setting up poster configurations for lock screen role", buf, 2u);
    }

    v60 = v170;
    v61 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_switcherConfigurationOrderingURLForBaseURL:version:", v170, 60);
    v152 = v61;
    if ([v61 checkResourceIsReachableAndReturnError:0])
    {
      v62 = PBFLogMigration();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D31CE000, v62, OS_LOG_TYPE_DEFAULT, "going w/ existing poster uuid ordering file", buf, 2u);
      }
    }
    else
    {
      if (v157 > 0x3B)
      {
LABEL_84:
        v68 = (void *)MEMORY[0x1E4F1CAA0];
        v69 = objc_msgSend(v61, "pf_loadFromPlistWithError:", 0, v148);
        uint64_t v70 = objc_opt_class();
        id v71 = v69;
        if (v70)
        {
          if (objc_opt_isKindOfClass()) {
            v72 = v71;
          }
          else {
            v72 = 0;
          }
        }
        else
        {
          v72 = 0;
        }
        id v73 = v72;

        if (v73) {
          id v74 = v73;
        }
        else {
          id v74 = (id)MEMORY[0x1E4F1CBF0];
        }
        v164 = [v68 orderedSetWithArray:v74];

        v75 = PBFLogMigration();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v164;
          _os_log_impl(&dword_1D31CE000, v75, OS_LOG_TYPE_DEFAULT, "posterUUIDOrdering: %{public}@", buf, 0xCu);
        }

        v76 = v170;
        v77 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_switcherSelectedConfigurationURLForBaseURL:version:", v170, 60);
        char v78 = [v77 checkResourceIsReachableAndReturnError:0];
        v150 = v77;
        if (v24 < v157) {
          char v79 = 1;
        }
        else {
          char v79 = v78;
        }
        if ((v79 & 1) == 0)
        {
          while (1)
          {
            v80 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_switcherSelectedConfigurationURLForBaseURL:version:", v76, v24);
            if ([v80 checkResourceIsReachableAndReturnError:0]) {
              break;
            }

            --v24;
            v76 = v170;
            if (v24 < v157) {
              goto LABEL_107;
            }
          }
          v81 = [MEMORY[0x1E4F28CB8] defaultManager];
          int v82 = [v81 copyItemAtURL:v80 toURL:v150 error:0];

          if (v82)
          {
            v83 = PBFLogMigration();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v148;
              *(void *)&uint8_t buf[4] = v24;
              _os_log_impl(&dword_1D31CE000, v83, OS_LOG_TYPE_DEFAULT, "restored selected poster uuid ordering from %lu", buf, 0xCu);
            }
          }
          else
          {
            v83 = PBFLogMigration();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218242;
              *(void *)&uint8_t buf[4] = v24;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = 0;
              _os_log_error_impl(&dword_1D31CE000, v83, OS_LOG_TYPE_ERROR, "FAILED restored selected poster uuid from %lu: %{public}@", buf, 0x16u);
            }
          }
        }
LABEL_107:
        v84 = objc_msgSend(v150, "pf_loadFromPlistWithError:", 0);
        uint64_t v85 = objc_opt_class();
        id v86 = v84;
        if (v85)
        {
          if (objc_opt_isKindOfClass()) {
            v87 = v86;
          }
          else {
            v87 = 0;
          }
        }
        else
        {
          v87 = 0;
        }
        id v88 = v87;

        v149 = [v88 objectForKey:@"selectedConfigurationIdentifier"];

        v89 = PBFLogMigration();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v149;
          _os_log_impl(&dword_1D31CE000, v89, OS_LOG_TYPE_DEFAULT, "selected poster uuid: %{public}@", buf, 0xCu);
        }

        uint64_t v90 = [v164 count];
        v91 = v170;
        if (!v90)
        {
          v92 = PBFLogMigration();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D31CE000, v92, OS_LOG_TYPE_DEFAULT, "posterUUIDOrdering is empty; building a new one from the date added of each CSC",
              buf,
              2u);
          }

          v93 = objc_opt_new();
          v173 = objc_opt_new();
          v94 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreExtensionContainerURLForBaseURL:version:", v170, 60);
          v95 = _PBFExtensionStoreCoordinatorsForDataStoreExtensionContainerURL(v94, 0);

          long long v203 = 0u;
          long long v204 = 0u;
          long long v201 = 0u;
          long long v202 = 0u;
          id v156 = v95;
          uint64_t v162 = [v156 countByEnumeratingWithState:&v201 objects:v239 count:16];
          if (v162)
          {
            uint64_t v160 = *(void *)v202;
            do
            {
              for (uint64_t m = 0; m != v162; ++m)
              {
                if (*(void *)v202 != v160) {
                  objc_enumerationMutation(v156);
                }
                v96 = *(void **)(*((void *)&v201 + 1) + 8 * m);
                long long v197 = 0u;
                long long v198 = 0u;
                long long v199 = 0u;
                long long v200 = 0u;
                v97 = [v96 configurationStoreCoordinatorsWithError:0];
                uint64_t v98 = [v97 countByEnumeratingWithState:&v197 objects:v238 count:16];
                if (v98)
                {
                  uint64_t v99 = *(void *)v198;
                  do
                  {
                    for (uint64_t n = 0; n != v98; ++n)
                    {
                      if (*(void *)v198 != v99) {
                        objc_enumerationMutation(v97);
                      }
                      v101 = *(void **)(*((void *)&v197 + 1) + 8 * n);
                      v102 = [v101 objectForKeyedSubscript:@"kConfigurationAssociatedPosterUUIDKey"];
                      if (!v102)
                      {
                        v103 = [v101 posterUUID];
                        v104 = [v103 UUIDString];

                        if (v104)
                        {
                          [v173 addObject:v104];
                          [v93 setObject:v101 forKey:v104];
                        }
                      }
                    }
                    uint64_t v98 = [v97 countByEnumeratingWithState:&v197 objects:v238 count:16];
                  }
                  while (v98);
                }
              }
              uint64_t v162 = [v156 countByEnumeratingWithState:&v201 objects:v239 count:16];
            }
            while (v162);
          }

          v195[0] = MEMORY[0x1E4F143A8];
          v195[1] = 3221225472;
          v195[2] = __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_57;
          v195[3] = &unk_1E6982D28;
          id v105 = v93;
          id v196 = v105;
          [v173 sortUsingComparator:v195];
          if ([v173 count])
          {
            v106 = (void *)[v164 mutableCopy];
            v107 = v106;
            if (v106)
            {
              v108 = v106;
            }
            else
            {
              v108 = (id)objc_opt_new();
            }
            long long v193 = 0u;
            long long v194 = 0u;
            long long v191 = 0u;
            long long v192 = 0u;
            id v109 = v173;
            uint64_t v110 = [v109 countByEnumeratingWithState:&v191 objects:v237 count:16];
            if (v110)
            {
              uint64_t v111 = *(void *)v192;
              do
              {
                for (iuint64_t i = 0; ii != v110; ++ii)
                {
                  if (*(void *)v192 != v111) {
                    objc_enumerationMutation(v109);
                  }
                  uint64_t v113 = *(void *)(*((void *)&v191 + 1) + 8 * ii);
                  if (([v164 containsObject:v113] & 1) == 0)
                  {
                    v114 = PBFLogMigration();
                    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      *(void *)&uint8_t buf[4] = v113;
                      _os_log_impl(&dword_1D31CE000, v114, OS_LOG_TYPE_DEFAULT, "Recovering posterUUID %{public}@", buf, 0xCu);
                    }

                    [v108 addObject:v113];
                  }
                }
                uint64_t v110 = [v109 countByEnumeratingWithState:&v191 objects:v237 count:16];
              }
              while (v110);
            }

            v189[0] = MEMORY[0x1E4F143A8];
            v189[1] = 3221225472;
            v189[2] = __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_59;
            v189[3] = &unk_1E6982D28;
            id v190 = v105;
            [v108 sortUsingComparator:v189];
            v115 = PBFLogMigration();
            if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v108;
              _os_log_impl(&dword_1D31CE000, v115, OS_LOG_TYPE_DEFAULT, "posterUUIDOrdering replaced with new %{public}@", buf, 0xCu);
            }

            uint64_t v116 = [v108 copy];
            v164 = (void *)v116;
          }
          else
          {
            v108 = PBFLogMigration();
            if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D31CE000, v108, OS_LOG_TYPE_DEFAULT, "no posters to restore; maybe not upgrading",
                buf,
                2u);
            }
          }

          v91 = v170;
        }
        v117 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreExtensionContainerURLForBaseURL:version:", v91, 60);
        v118 = _PBFProvidersForPosterUUIDFromDataStoreExtensionContainerURL(v117);

        v184[0] = MEMORY[0x1E4F143A8];
        v184[1] = 3221225472;
        v184[2] = __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_60;
        v184[3] = &unk_1E6982D50;
        id v119 = v164;
        id v185 = v119;
        id v120 = v118;
        id v186 = v120;
        v188 = &v232;
        id v121 = v149;
        id v187 = v121;
        id v183 = 0;
        [(PBFPosterExtensionDataStoreSQLiteDatabase *)v169 performChanges:v184 error:&v183];
        id v122 = v183;
        id v123 = v183;
        if (v123 && !*(void *)(v233[0] + 40))
        {
          objc_storeStrong((id *)(v233[0] + 40), v122);
        }
        else
        {
          v124 = PBFLogMigration();
          if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D31CE000, v124, OS_LOG_TYPE_INFO, "cleaning up poster configuration ordering url / poster selected configuration identifier plist url", buf, 2u);
          }

          [v171 removeItemAtURL:v152 error:0];
          [v171 removeItemAtURL:v150 error:0];
        }
        [(PBFPosterExtensionDataStoreSQLiteDatabase *)v169 invalidate];

        goto LABEL_62;
      }
      unint64_t v63 = 59;
      while (1)
      {
        v62 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_switcherConfigurationOrderingURLForBaseURL:version:", v60, v63, v148);
        if ([v62 checkResourceIsReachableAndReturnError:0])break; {

        }
        --v63;
        v60 = v170;
        v61 = v152;
        if (v63 < v157) {
          goto LABEL_84;
        }
      }
      v64 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v205 = 0;
      int v65 = [v64 copyItemAtURL:v62 toURL:v152 error:&v205];
      id v66 = v205;

      if (v65)
      {
        v67 = PBFLogMigration();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v148;
          *(void *)&uint8_t buf[4] = v63;
          _os_log_impl(&dword_1D31CE000, v67, OS_LOG_TYPE_DEFAULT, "restored poster uuid ordering from %lu", buf, 0xCu);
        }
      }
      else
      {
        v67 = PBFLogMigration();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = v63;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v66;
          _os_log_error_impl(&dword_1D31CE000, v67, OS_LOG_TYPE_ERROR, "FAILED restored poster uuid ordering from %lu: %{public}@", buf, 0x16u);
        }
      }
    }
    v61 = v152;
    goto LABEL_84;
  }
  if (a7)
  {
    BOOL v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28588];
    v248[0] = @"fromVersion < minimumDataStoreVersion || toVersion > currentDataStoreVersion";
    v247[0] = v16;
    v247[1] = @"fromVersion";
    id v17 = [NSNumber numberWithUnsignedInteger:a4];
    v248[1] = v17;
    v247[2] = @"toVersion";
    uint32_t v18 = [NSNumber numberWithUnsignedInteger:a5];
    v248[2] = v18;
    long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v248 forKeys:v247 count:3];
    objc_msgSend(v15, "pbf_generalErrorWithCode:userInfo:", 1, v19);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v13 = 0;
    goto LABEL_209;
  }
  BOOL v13 = 0;
LABEL_210:

  return v13;
}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_2;
  v3[3] = &unk_1E6982C48;
  id v4 = *(id *)(a1 + 32);
  [a2 enumerateConfigurationStoreCoordinators:v3];
}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  int v3 = [v4 objectForKeyedSubscript:@"kConfigurationAssociatedPosterUUIDKey"];
  if (v3) {
    [*(id *)(a1 + 32) setObject:v4 forKey:v3];
  }
}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 reapEverythingExceptLatestVersion];
  [v2 reapSnapshots];
}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 reapEverythingExceptLatestVersion];
  [v2 reapSnapshots];
}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_44(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  BOOL v5 = (void *)MEMORY[0x1D9433EF0]();
  unint64_t v6 = [v4 posterUUID];
  BOOL v7 = [v4 pathOfLatestVersion];
  if (v7)
  {
    unint64_t v8 = [v4 objectForKeyedSubscript:@"kConfigurationAssociatedPosterUUIDKey"];
    if (!v8)
    {
      unint64_t v9 = *(void **)(a1 + 32);
      long long v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
      LODWORD(v9) = [v9 checkIfPosterUUIDs:v10 belongToRole:*MEMORY[0x1E4F92790] error:0];

      if (v9)
      {
        [*(id *)(a1 + 40) removeAllObjects];
        v55 = [*(id *)(a1 + 48) objectForKey:v6];
        if (v55)
        {
          id v11 = objc_alloc(MEMORY[0x1E4F92550]);
          int v12 = [v55 posterUUID];
          BOOL v13 = [MEMORY[0x1E4F1C9C8] date];
          long long v14 = [v55 extensionIdentifier];
          BOOL v15 = (void *)[v11 initWithChildPosterUUID:v12 dateCreated:v13 providerIdentifier:v14];

          uint64_t v16 = *(void **)(a1 + 40);
          id v17 = [v15 encodeJSON];
          uint32_t v18 = [v15 attributeType];
          [v16 setObject:v17 forKey:v18];

          long long v19 = PBFLogMigration();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            long long v20 = [v55 posterUUID];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = 0;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v20;
            _os_log_impl(&dword_1D31CE000, v19, OS_LOG_TYPE_DEFAULT, "Setup child poster attribute for parent %{public}@ -> child %{public}@", buf, 0x16u);
          }
        }
        id v66 = 0;
        unint64_t v21 = [MEMORY[0x1E4F926B0] loadFocusConfigurationForPath:v7 error:&v66];
        id v53 = v66;
        if (v53 || !v21)
        {
          unint64_t v22 = PBFLogMigration();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_44_cold_4();
          }
        }
        else
        {
          unint64_t v22 = [v21 encodeJSON];
          if ([v22 length]) {
            [*(id *)(a1 + 40) setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F92760]];
          }
          unint64_t v23 = PBFLogMigration();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D31CE000, v23, OS_LOG_TYPE_DEFAULT, "ported focus configuration to attribute", buf, 2u);
          }
        }
        id v65 = 0;
        v56 = [MEMORY[0x1E4F926B0] loadSuggestionMetadataForPath:v7 error:&v65];
        id v52 = v65;
        if (v52 || !v56)
        {
          unint64_t v24 = PBFLogMigration();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_44_cold_3();
          }
        }
        else
        {
          unint64_t v24 = [v56 encodeJSON];
          if ([v24 length]) {
            [*(id *)(a1 + 40) setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F92778]];
          }
          uint64_t v25 = PBFLogMigration();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D31CE000, v25, OS_LOG_TYPE_DEFAULT, "ported suggestion metadata to attribute", buf, 2u);
          }
        }
        v26 = objc_opt_new();
        v54 = [v4 objectForKeyedSubscript:@"kConfigurationLastUseDateKey"];
        if (v54)
        {
          uint64_t v27 = objc_msgSend(v26, "usageMetadataForUpdatedLastActivatedDate:");

          v26 = (void *)v27;
        }
        int64_t v28 = [v56 lastModifiedDate];

        if (v28)
        {
          id v29 = [v56 lastModifiedDate];
          uint64_t v30 = [v26 usageMetadataForUpdatedLastModifiedDate:v29];

          v26 = (void *)v30;
        }
        uint64_t v31 = *(void **)(a1 + 40);
        uint64_t v32 = [v26 encodeJSON];
        v33 = [v26 attributeType];
        [v31 setObject:v32 forKey:v33];

        id v64 = 0;
        v34 = [MEMORY[0x1E4F926B0] loadOtherMetadataForPath:v7 error:&v64];
        id v51 = v64;
        if (v51 || !v34)
        {
          v35 = PBFLogMigration();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_44_cold_2();
          }
        }
        else
        {
          v35 = [v34 encodeJSON];
          if ([v35 length]) {
            [*(id *)(a1 + 40) setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F92770]];
          }
          char v36 = PBFLogMigration();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D31CE000, v36, OS_LOG_TYPE_DEFAULT, "ported other metadata to attribute", buf, 2u);
          }
        }
        id v63 = 0;
        v37 = [MEMORY[0x1E4F926B0] loadHomeScreenConfigurationForPath:v7 error:&v63];
        id v50 = v63;
        if (v50 || !v37)
        {
          char v38 = PBFLogMigration();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_44_cold_1();
          }
        }
        else
        {
          char v38 = [v37 encodeJSON];
          if ([v38 length]) {
            [*(id *)(a1 + 40) setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F92768]];
          }
          v39 = PBFLogMigration();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D31CE000, v39, OS_LOG_TYPE_DEFAULT, "ported home screen config to attribute", buf, 2u);
          }
        }
        if ([*(id *)(a1 + 40) count])
        {
          v40 = PBFLogMigration();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v6;
            _os_log_impl(&dword_1D31CE000, v40, OS_LOG_TYPE_DEFAULT, "updating attributes for poster %{public}@", buf, 0xCu);
          }

          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v68 = __Block_byref_object_copy__4;
          v69 = __Block_byref_object_dispose__4;
          id v70 = 0;
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_50;
          v59[3] = &unk_1E6982CD8;
          uint64_t v41 = *(void **)(a1 + 32);
          id v60 = *(id *)(a1 + 40);
          id v61 = v6;
          v62 = buf;
          id v58 = 0;
          char v42 = [v41 performChanges:v59 error:&v58];
          id v43 = v58;
          unint64_t v44 = (unint64_t)v43;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v42;
          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
            || v43
            || *(void *)(*(void *)&buf[8] + 40))
          {
            uint64_t v45 = *(void *)(*(void *)(a1 + 72) + 8);
            uint64_t v47 = *(void *)(v45 + 40);
            id v46 = (id *)(v45 + 40);
            if (!v47)
            {
              uint64_t v48 = *(void *)(*(void *)&buf[8] + 40);
              if (v44 | v48)
              {
                if (v48) {
                  uint64_t v49 = *(void **)(*(void *)&buf[8] + 40);
                }
                else {
                  uint64_t v49 = (void *)v44;
                }
                objc_storeStrong(v46, v49);
              }
            }
            *a3 = 1;

            _Block_object_dispose(buf, 8);
          }
          else
          {

            _Block_object_dispose(buf, 8);
          }
        }
      }
    }
  }
}

uint64_t __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_50(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [*(id *)(a1 + 32) keyEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = *MEMORY[0x1E4F92790];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
        uint64_t v12 = *(void *)(a1 + 40);
        BOOL v13 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        obuint64_t j = 0;
        LODWORD(v10) = [v3 mutateAttributeForPoster:v12 roleId:v8 attributeId:v10 attributePayload:v11 error:&obj];
        objc_storeStrong(v13, obj);
        if (!v10 || *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
        {

          uint64_t v14 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v14 = 1;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v14 = 1;
  }
LABEL_13:

  return v14;
}

uint64_t __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_57(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:a2];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  unint64_t v9 = [v7 identifierURL];
  uint64_t v10 = objc_msgSend(v9, "pbf_creationDate");

  id v11 = [v8 identifierURL];
  uint64_t v12 = objc_msgSend(v11, "pbf_creationDate");

  uint64_t v13 = [v10 compare:v12];
  return v13;
}

uint64_t __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_59(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:a2];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  unint64_t v9 = [v7 identifierURL];
  uint64_t v10 = objc_msgSend(v9, "pbf_creationDate");

  id v11 = [v8 identifierURL];
  uint64_t v12 = objc_msgSend(v11, "pbf_creationDate");

  uint64_t v13 = [v10 compare:v12];
  return v13;
}

uint64_t __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_60(uint64_t a1, void *a2)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v51 objects:v59 count:16];
  id v6 = (uint64_t *)MEMORY[0x1E4F92790];
  uint64_t v47 = v5;
  if (!v5) {
    goto LABEL_23;
  }
  uint64_t v7 = *(void *)v52;
  uint64_t v8 = *MEMORY[0x1E4F92790];
  id v46 = v4;
  while (2)
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v52 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = *(NSObject **)(*((void *)&v51 + 1) + 8 * v9);
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
      if (!v11)
      {
        uint64_t v12 = PBFLogMigration();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v56 = v10;
          _os_log_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_DEFAULT, "Unable to create UUID from posterUUIDString: %{public}@; not-fatal; continuing.",
            buf,
            0xCu);
        }
        goto LABEL_48;
      }
      uint64_t v12 = v11;
      uint64_t v13 = [v3 sortedPosterUUIDsForRole:v8 error:0];
      int v14 = [v13 containsObject:v12];

      if (!v14)
      {
        BOOL v15 = [*(id *)(a1 + 40) objectForKey:v10];
        if (!v15)
        {
          unint64_t v21 = PBFLogMigration();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v56 = v10;
            _os_log_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_DEFAULT, "Unable to find provider for posterUUID: %{public}@; not-fatal; continuing.",
              buf,
              0xCu);
          }
LABEL_20:

          goto LABEL_21;
        }
        id v50 = 0;
        char v16 = [v3 addPosterUUID:v12 provider:v15 error:&v50];
        long long v17 = v50;
        long long v18 = v17;
        if (v16)
        {
          long long v19 = PBFLogMigration();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v56 = v12;
            _os_log_impl(&dword_1D31CE000, v19, OS_LOG_TYPE_INFO, "poster uuid %{public}@  added", buf, 0xCu);
          }

          id v49 = 0;
          char v20 = [v3 assignPosterUUID:v12 toRole:v8 error:&v49];
          unint64_t v21 = v49;

          if ((v20 & 1) == 0)
          {
            uint64_t v40 = *(void *)(*(void *)(a1 + 56) + 8);
            uint64_t v41 = *(NSObject **)(v40 + 40);
            char v38 = (void **)(v40 + 40);
            v37 = v41;
            if (!v41) {
              v37 = v21;
            }
            long long v18 = v21;
            id v4 = v46;
            goto LABEL_47;
          }
          uint64_t v22 = PBFLogMigration();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v56 = v12;
            _os_log_impl(&dword_1D31CE000, v22, OS_LOG_TYPE_INFO, "poster uuid %{public}@ assigned to lock screen", buf, 0xCu);
          }

          id v4 = v46;
          goto LABEL_20;
        }
        uint64_t v36 = *(void *)(*(void *)(a1 + 56) + 8);
        v39 = *(NSObject **)(v36 + 40);
        char v38 = (void **)(v36 + 40);
        v37 = v39;
        if (!v39) {
          v37 = v17;
        }
LABEL_47:
        char v42 = v37;
        id v43 = *v38;
        *char v38 = v42;

LABEL_48:
        uint64_t v44 = 0;
        goto LABEL_54;
      }
      BOOL v15 = PBFLogMigration();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v56 = v12;
        _os_log_impl(&dword_1D31CE000, v15, OS_LOG_TYPE_DEFAULT, "poster uuid %{public}@ already added; continuing",
          buf,
          0xCu);
      }
LABEL_21:

      ++v9;
    }
    while (v47 != v9);
    uint64_t v23 = [v4 countByEnumeratingWithState:&v51 objects:v59 count:16];
    id v6 = (uint64_t *)MEMORY[0x1E4F92790];
    uint64_t v47 = v23;
    if (v23) {
      continue;
    }
    break;
  }
LABEL_23:

  if (*(void *)(a1 + 48)) {
    unint64_t v24 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(a1 + 48)];
  }
  else {
    unint64_t v24 = 0;
  }
  uint64_t v25 = *v6;
  v26 = [v3 sortedPosterUUIDsForRole:*v6 error:0];
  uint64_t v27 = v26;
  if (v24 && ([v26 containsObject:v24] & 1) != 0)
  {
    uint64_t v12 = v24;
    goto LABEL_36;
  }
  int64_t v28 = PBFLogMigration();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v56 = v24;
    __int16 v57 = 2114;
    id v58 = v27;
    _os_log_impl(&dword_1D31CE000, v28, OS_LOG_TYPE_DEFAULT, "selected posterUUID not valid (%{public}@); current posters: %{public}@",
      buf,
      0x16u);
  }

  uint64_t v12 = [v27 firstObject];

  id v29 = PBFLogMigration();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v56 = v12;
    _os_log_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_INFO, "replacing selected posterUUID w/ first poster uuid %{public}@", buf, 0xCu);
  }

  if (v12)
  {
LABEL_36:
    id v48 = 0;
    char v30 = [v3 markPosterUUIDAsSelected:v12 roleId:v25 error:&v48];
    id v4 = v48;
    if ((v30 & 1) == 0)
    {
      uint64_t v31 = PBFLogMigration();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_60_cold_1();
      }

      uint64_t v32 = PBFLogMigration();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v33 = "Migration will continue.";
        v34 = v32;
        uint32_t v35 = 2;
        goto LABEL_52;
      }
      goto LABEL_53;
    }
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v32 = PBFLogMigration();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v56 = v12;
    v33 = "successfully selected posterUUID %{public}@";
    v34 = v32;
    uint32_t v35 = 12;
LABEL_52:
    _os_log_impl(&dword_1D31CE000, v34, OS_LOG_TYPE_INFO, v33, buf, v35);
  }
LABEL_53:

  uint64_t v44 = 1;
LABEL_54:

  return v44;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (BOOL)shouldCleanupAfterMigration
{
  return self->_shouldCleanupAfterMigration;
}

- (void)setShouldCleanupAfterMigration:(BOOL)a3
{
  self->_shouldCleanupAfterMigratiouint64_t n = a3;
}

- (void).cxx_destruct
{
}

- (void)migrateDataStoreToCurrentVersion:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "Error updating file attributes for URL '%{public}@': %{public}@");
}

- (void)migrateDataStoreToCurrentVersion:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "Error validating file attributes for URL '%{public}@': %{public}@");
}

+ (void)migrateDataStoreAtBaseURL:(NSObject *)a3 fromVersion:toVersion:cleanupAfterMigrationSucceeds:error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(*(void *)a2 + 40);
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, a2, a3, "Cleaning up failed data store @ baseURL '%@': %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

+ (void)migrateDataStoreAtBaseURL:fromVersion:toVersion:cleanupAfterMigrationSucceeds:error:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  *uint64_t v0 = 138543362;
  *os_log_t v1 = v2;
  _os_log_error_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_ERROR, "error updating to 61: %{public}@", v3, 0xCu);
}

+ (void)migrateDataStoreAtBaseURL:fromVersion:toVersion:cleanupAfterMigrationSucceeds:error:.cold.3()
{
  OUTLINED_FUNCTION_5_0();
  *uint64_t v0 = 138543362;
  *os_log_t v1 = v2;
  _os_log_error_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_ERROR, "no database? %{public}@", v3, 0xCu);
}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_44_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_6(&dword_1D31CE000, v0, v1, "Failed to migrate to Version %lu from %lu (%@); PRPosterHomeScreenConfiguration conversion to attributedProperties f"
    "ailed with error: %{public}@");
}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_44_cold_2()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_6(&dword_1D31CE000, v0, v1, "Failed to migrate to Version %lu from %lu (%@); PRPosterMetadata conversion to attributedProperties failed with error: %{public}@");
}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_44_cold_3()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_6(&dword_1D31CE000, v0, v1, "Failed to migrate to Version %lu from %lu (%@); PRPosterSuggestionMetadata conversion to attributedProperties failed"
    " with error: %{public}@");
}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_44_cold_4()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_6(&dword_1D31CE000, v0, v1, "Failed to migrate to Version %lu from %lu (%@); PRPosterFocusConfiguration conversion to attributedProperties failed"
    " with error: %{public}@");
}

void __123__PBFPosterExtensionDataStoreMigrator_migrateDataStoreAtBaseURL_fromVersion_toVersion_cleanupAfterMigrationSucceeds_error___block_invoke_60_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "Unable to mark poster '%{public}@' as selected: %{public}@");
}

@end