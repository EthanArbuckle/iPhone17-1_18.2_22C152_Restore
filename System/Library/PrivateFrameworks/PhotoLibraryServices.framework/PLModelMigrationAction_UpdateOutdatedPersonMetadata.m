@interface PLModelMigrationAction_UpdateOutdatedPersonMetadata
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_UpdateOutdatedPersonMetadata

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(PLModelMigrationActionCore *)self pathManager];
  v7 = +[PLPersistedPersonMetadata urlsForPersistedPersonsInMetadataDirectoryWithPathManager:v6];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v81 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v43;
    v12 = off_1E585F000;
    uint64_t v38 = 0;
    uint64_t v39 = *(void *)v43;
    do
    {
      uint64_t v13 = 0;
      uint64_t v40 = v9;
      do
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v42 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x19F38D3B0]();
        v16 = (void *)[objc_alloc(v12[121]) initWithPersistedDataAtURL:v14 cplEnabled:0];
        if (([v16 matchesEntityInLibraryBackedByManagedObjectContext:v5 diff:0] & 1) == 0)
        {
          v17 = [v16 personUUID];
          v18 = +[PLPerson personWithUUID:v17 inManagedObjectContext:v5];

          if (v18 && [v18 verifiedType])
          {
            id v19 = objc_alloc(v12[121]);
            v20 = [(PLModelMigrationActionCore *)self pathManager];
            v21 = (void *)[v19 initWithPLPerson:v18 pathManager:v20];

            [v21 writePersistedData];
            ++v38;
          }
          else
          {
            v22 = v12[121];
            v23 = [v16 personUUID];
            [(PLModelMigrationActionCore *)self pathManager];
            uint64_t v24 = v10;
            id v25 = v5;
            v27 = v26 = self;
            [(__objc2_class *)v22 deleteMetadataFileForPersonUUID:v23 pathManager:v27];

            self = v26;
            id v5 = v25;
            uint64_t v28 = v24;
            v12 = off_1E585F000;

            uint64_t v10 = v28 + 1;
          }

          uint64_t v11 = v39;
          uint64_t v9 = v40;
        }

        ++v13;
      }
      while (v9 != v13);
      uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v81 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v38 = 0;
    uint64_t v10 = 0;
  }

  v29 = PLMigrationGetLog();
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);

  if (v30)
  {
    v31 = [(PLModelMigrationActionCore *)self logger];

    if (v31)
    {
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      memset(buf, 0, sizeof(buf));
      v32 = PLMigrationGetLog();
      os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
      int v46 = 134218240;
      uint64_t v47 = v38;
      __int16 v48 = 2048;
      uint64_t v49 = v10;
      LODWORD(v37) = 22;
      v33 = (uint8_t *)_os_log_send_and_compose_impl();

      v34 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v33, "PLModelMigrationActions_18000.m", 1740, 1);

      if (v33 != buf) {
        free(v33);
      }
    }
    else
    {
      v35 = PLMigrationGetLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v10;
        _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_INFO, "Updated %lu person metadata files and deleted %lu person metadata files", buf, 0x16u);
      }
    }
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];

  return 1;
}

+ (int64_t)actionProgressWeight
{
  return 400;
}

@end