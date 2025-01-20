@interface PBFDataStoreArchiveAdjudicator
- (BOOL)deleteArchive:(id)a3 error:(id *)a4;
- (BOOL)markArchivesAsPurgable:(id *)a3;
- (BOOL)removeArchives:(id *)a3;
- (BOOL)restoreArchive:(id)a3 backupExistingDataStoreIfPossible:(BOOL)a4 error:(id *)a5;
- (NSArray)archiveNames;
- (NSArray)archives;
- (NSURL)archiveBaseURL;
- (NSURL)dataStoreBaseURL;
- (PBFDataStoreArchiveAdjudicator)initWithDataStoreBaseURL:(id)a3 archiveBaseURL:(id)a4;
- (id)archiveDataStoreVersion:(unint64_t)a3 name:(id)a4 options:(id)a5 removeAfterSuccess:(BOOL)a6 error:(id *)a7;
- (id)archiveDataStoreVersion:(unint64_t)a3 toURL:(id)a4 options:(id)a5 removeAfterSuccess:(BOOL)a6 error:(id *)a7;
- (id)archiveForName:(id)a3;
@end

@implementation PBFDataStoreArchiveAdjudicator

- (PBFDataStoreArchiveAdjudicator)initWithDataStoreBaseURL:(id)a3 archiveBaseURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PBFDataStoreArchiveAdjudicator;
  v8 = [(PBFDataStoreArchiveAdjudicator *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    dataStoreBaseURL = v8->_dataStoreBaseURL;
    v8->_dataStoreBaseURL = (NSURL *)v9;

    uint64_t v11 = [v7 copy];
    archiveBaseURL = v8->_archiveBaseURL;
    v8->_archiveBaseURL = (NSURL *)v11;
  }
  return v8;
}

- (NSArray)archives
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [v3 contentsOfDirectoryAtURL:self->_archiveBaseURL includingPropertiesForKeys:0 options:0 error:0];
  v5 = objc_msgSend(v4, "bs_filter:", &__block_literal_global_21);
  id v6 = objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_28);
  id v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_32];

  return (NSArray *)v7;
}

uint64_t __42__PBFDataStoreArchiveAdjudicator_archives__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isFileURL])
  {
    v3 = [v2 pathExtension];
    uint64_t v4 = [v3 isEqualToString:@"pbds"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

PBFDataStoreArchiveMetadata *__42__PBFDataStoreArchiveAdjudicator_archives__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PBFDataStoreArchiveMetadata alloc] initWithURL:v2];

  return v3;
}

uint64_t __42__PBFDataStoreArchiveAdjudicator_archives__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 creationDate];
  id v6 = [v4 creationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSArray)archiveNames
{
  id v2 = [(PBFDataStoreArchiveAdjudicator *)self archives];
  v3 = objc_msgSend(v2, "bs_mapNoNulls:", &__block_literal_global_35);

  return (NSArray *)v3;
}

id __46__PBFDataStoreArchiveAdjudicator_archiveNames__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 archiveURL];
  v3 = [v2 lastPathComponent];
  id v4 = [v3 stringByDeletingPathExtension];

  return v4;
}

- (id)archiveForName:(id)a3
{
  id v4 = a3;
  v5 = [(PBFDataStoreArchiveAdjudicator *)self archives];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__PBFDataStoreArchiveAdjudicator_archiveForName___block_invoke;
  v9[3] = &unk_1E6983598;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __49__PBFDataStoreArchiveAdjudicator_archiveForName___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 archiveURL];
  id v4 = [v3 lastPathComponent];
  v5 = [v4 stringByDeletingPathExtension];
  uint64_t v6 = [v5 isEqual:*(void *)(a1 + 32)];

  return v6;
}

- (id)archiveDataStoreVersion:(unint64_t)a3 toURL:(id)a4 options:(id)a5 removeAfterSuccess:(BOOL)a6 error:(id *)a7
{
  BOOL v7 = a6;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_super v14 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreURLForBaseURL:version:", self->_dataStoreBaseURL, a3);
  v15 = 0;
  if ([v14 checkResourceIsReachableAndReturnError:0])
  {
    v16 = [[PBFDataStoreArchiver alloc] initWithDataStoreAtURL:v14];
    [(PBFDataStoreArchiver *)v16 setOptions:v12];
    id v22 = 0;
    BOOL v17 = [(PBFDataStoreArchiver *)v16 archiveToFileAtURL:v11 error:&v22];
    id v18 = v22;
    v19 = PBFLogMigration();
    v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        unint64_t v24 = a3;
        __int16 v25 = 2114;
        id v26 = v11;
        _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEFAULT, "Archived data store version %lu to %{public}@", buf, 0x16u);
      }

      if (v7) {
        [v13 removeItemAtURL:v14 error:0];
      }
      v15 = [[PBFDataStoreArchiveMetadata alloc] initWithURL:v11];
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[PBFDataStoreArchiveAdjudicator archiveDataStoreVersion:toURL:options:removeAfterSuccess:error:]((uint64_t)v18, a3, v20);
      }

      v15 = 0;
    }
  }
  return v15;
}

- (id)archiveDataStoreVersion:(unint64_t)a3 name:(id)a4 options:(id)a5 removeAfterSuccess:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  archiveBaseURL = self->_archiveBaseURL;
  v13 = (void *)MEMORY[0x1E4F1C9C8];
  id v14 = a5;
  id v15 = a4;
  v16 = [v13 date];
  BOOL v17 = [(PBFDataStoreArchiveAdjudicator *)self archives];
  id v18 = _PBFArchiveBuildNewFileName(v15, a3, v16, v17);

  v19 = [(NSURL *)archiveBaseURL URLByAppendingPathComponent:v18];

  v20 = [(PBFDataStoreArchiveAdjudicator *)self archiveDataStoreVersion:a3 toURL:v19 options:v14 removeAfterSuccess:v8 error:a7];

  return v20;
}

- (BOOL)deleteArchive:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [v6 archiveURL];
  int v8 = [v7 checkResourceIsReachableAndReturnError:a4];

  if (!v8) {
    goto LABEL_6;
  }
  uint64_t v9 = [(PBFDataStoreArchiveAdjudicator *)self archives];
  char v10 = [v9 containsObject:v6];

  if ((v10 & 1) == 0)
  {
    if (!a4) {
      goto LABEL_7;
    }
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28588];
    v17[0] = @"no idea what this data store is";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    objc_msgSend(v13, "pbf_generalErrorWithCode:userInfo:", 1, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = [v6 archiveURL];
  LOBYTE(a4) = [v11 removeItemAtURL:v12 error:a4];

LABEL_7:
  return (char)a4;
}

- (BOOL)restoreArchive:(id)a3 backupExistingDataStoreIfPossible:(BOOL)a4 error:(id *)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = v8;
  if (v8)
  {
    char v10 = [v8 archiveURL];
    int v11 = [v10 checkResourceIsReachableAndReturnError:a5];

    if (v11)
    {
      id v12 = [(PBFDataStoreArchiveAdjudicator *)self archives];
      char v13 = [v12 containsObject:v9];

      if (v13)
      {
        unint64_t v14 = +[PBFPosterExtensionDataStore minimumDataStoreVersion];
        unint64_t v15 = +[PBFPosterExtensionDataStore dataStoreVersion];
        unint64_t v16 = [v9 version];
        BOOL v17 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreURLForBaseURL:version:", self->_dataStoreBaseURL, v16);
        uint64_t v18 = [(PBFDataStoreArchiveAdjudicator *)self archiveDataStoreVersion:v15 name:@"BackupExistingDataStore" options:0 removeAfterSuccess:1 error:a5];
        v19 = (void *)v18;
        if (v18)
        {
          if (v16 >= v14 && v16 <= v15)
          {
            v32 = (void *)v18;
            do
            {
              v20 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreURLForBaseURL:version:", self->_dataStoreBaseURL, v14);
              v21 = [MEMORY[0x1E4F28CB8] defaultManager];
              [v21 removeItemAtURL:v20 error:0];

              ++v14;
            }
            while (v14 <= v15);
            id v22 = [v9 archiveURL];
            v23 = [[PBFDataStoreUnarchiver alloc] initWithArchivedDataStoreURL:v22];
            [(PBFDataStoreUnarchiver *)v23 setRemapFocusConfigurations:1];
            if ([(PBFDataStoreUnarchiver *)v23 unarchiveToDirectoryAtURL:v17 error:a5])
            {

              v19 = v32;
              if (!a4) {
                [(PBFDataStoreArchiveAdjudicator *)self deleteArchive:v32 error:0];
              }
              BOOL v24 = 1;
              goto LABEL_23;
            }
            v19 = v32;
            [(PBFDataStoreArchiveAdjudicator *)self restoreArchive:v32 backupExistingDataStoreIfPossible:0 error:0];
          }
          if (!*a5)
          {
            v29 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v33 = *MEMORY[0x1E4F28588];
            v34 = @"unknown error unarchiving data store";
            v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
            objc_msgSend(v29, "pbf_generalErrorWithCode:userInfo:", 1, v30);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        BOOL v24 = 0;
LABEL_23:

        goto LABEL_24;
      }
      if (a5)
      {
        __int16 v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v35 = *MEMORY[0x1E4F28588];
        v36 = @"no idea what this data store is";
        id v26 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v27 = &v36;
        v28 = &v35;
        goto LABEL_17;
      }
    }
  }
  else if (a5)
  {
    __int16 v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = *MEMORY[0x1E4F28588];
    v38[0] = @"No archive was specified.";
    id v26 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v27 = (__CFString **)v38;
    v28 = &v37;
LABEL_17:
    BOOL v17 = [v26 dictionaryWithObjects:v27 forKeys:v28 count:1];
    objc_msgSend(v25, "pbf_generalErrorWithCode:userInfo:", 1, v17);
    BOOL v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

    goto LABEL_25;
  }
  BOOL v24 = 0;
LABEL_25:

  return v24;
}

- (BOOL)markArchivesAsPurgable:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = [(PBFDataStoreArchiveAdjudicator *)self archives];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) archiveURL];
        id v22 = 0;
        objc_msgSend(v10, "pbf_setPurgable:error:", 1, &v22);
        id v11 = v22;
        if (v11)
        {
          [v4 addObject:v11];
          id v12 = PBFLogMigration();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v30 = v10;
            __int16 v31 = 2114;
            id v32 = v11;
            _os_log_error_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_ERROR, "*FAILED* to mark archived data store @ %{public}@: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          id v12 = PBFLogMigration();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v30 = v10;
            _os_log_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_DEFAULT, "Marked archived data store @ %{public}@ as purgable", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v7);
  }

  uint64_t v13 = [v4 count];
  uint64_t v14 = v13;
  if (a3 && v13)
  {
    unint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28588];
    v28[0] = @"unknown error unarchiving data store";
    uint64_t v17 = *MEMORY[0x1E4F28750];
    v27[0] = v16;
    v27[1] = v17;
    uint64_t v18 = (void *)[v4 copy];
    v28[1] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
    objc_msgSend(v15, "pbf_generalErrorWithCode:userInfo:", 1, v19);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v14 == 0;
}

- (BOOL)removeArchives:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = [(PBFDataStoreArchiveAdjudicator *)self archives];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) archiveURL];
        id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v22 = 0;
        [v11 removeItemAtURL:v10 error:&v22];
        id v12 = v22;

        if (v12)
        {
          [v4 addObject:v12];
          uint64_t v13 = PBFLogMigration();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v30 = v10;
            __int16 v31 = 2114;
            id v32 = v12;
            _os_log_error_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_ERROR, "*FAILED* to remove archived data store @ %{public}@: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v13 = PBFLogMigration();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v30 = v10;
            _os_log_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_DEFAULT, "Deleted archived data store @ %{public}@ ", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v7);
  }

  uint64_t v14 = [v4 count];
  if (a3 && v14)
  {
    unint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28588];
    v28[0] = @"unknown error removing archived data data stores";
    uint64_t v17 = *MEMORY[0x1E4F28750];
    v27[0] = v16;
    v27[1] = v17;
    uint64_t v18 = (void *)[v4 copy];
    v28[1] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
    objc_msgSend(v15, "pbf_generalErrorWithCode:userInfo:", 1, v19);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 1;
}

- (NSURL)dataStoreBaseURL
{
  return self->_dataStoreBaseURL;
}

- (NSURL)archiveBaseURL
{
  return self->_archiveBaseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveBaseURL, 0);
  objc_storeStrong((id *)&self->_dataStoreBaseURL, 0);
}

- (void)archiveDataStoreVersion:(os_log_t)log toURL:options:removeAfterSuccess:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_1D31CE000, log, OS_LOG_TYPE_ERROR, "Unable to archive data store version %lu: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end