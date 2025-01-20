@interface PLModelMigrationAction_RelocateBundleScopeData
- (id)legacyPrefixPathWithType:(unsigned __int8)a3;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
- (int64_t)renameWithDestinationPath:(unsigned __int8)a3 error:(id *)a4;
- (int64_t)updateResourceFilePathWithManagedObjectContext:(id)a3 bundleScope:(unsigned __int16)a4 progress:(id)a5 error:(id *)a6;
@end

@implementation PLModelMigrationAction_RelocateBundleScopeData

- (id)legacyPrefixPathWithType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v5 = [(PLModelMigrationActionCore *)self pathManager];
  v6 = [v5 photoDirectoryWithType:v3];

  v7 = [(PLModelMigrationActionCore *)self pathManager];
  v8 = [v7 photoDirectoryWithType:7];

  v9 = [v6 lastPathComponent];
  v10 = [v8 stringByAppendingPathComponent:v9];

  return v10;
}

- (int64_t)updateResourceFilePathWithManagedObjectContext:(id)a3 bundleScope:(unsigned __int16)a4 progress:(id)a5 error:(id *)a6
{
  uint64_t v8 = a4;
  v43[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v32 = a5;
  if (v8 > 4 || ((1 << v8) & 0x1A) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLModelMigrationActions_15000.m", 519, @"Invalid parameter not satisfying: %@", @"scope == PLBundleScopeCMM || scope == PLBundleScopeSyndication || scope == PLBundleScopeLocked" object file lineNumber description];
  }
  v13 = (void *)MEMORY[0x1E4F1C0D0];
  v14 = +[PLInternalResource entityName];
  v15 = [v13 fetchRequestWithEntityName:v14];

  v16 = (void *)MEMORY[0x1E4F28BA0];
  v17 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", @"dataStoreKeyData");
  v43[0] = v17;
  v18 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"asset.bundleScope", v8);
  v43[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  v20 = [v16 andPredicateWithSubpredicates:v19];
  [v15 setPredicate:v20];

  v42 = @"asset";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  [v15 setRelationshipKeyPathsForPrefetching:v21];

  [v15 setFetchBatchSize:100];
  id v37 = 0;
  v22 = [v11 executeFetchRequest:v15 error:&v37];
  id v23 = v37;
  if (v22)
  {
    *(void *)v40 = 0;
    *(void *)&v40[8] = v40;
    *(void *)&v40[16] = 0x2020000000;
    uint64_t v41 = 0;
    v24 = [(PLModelMigrationActionCore *)self pathManager];
    int v25 = [v24 photoLibraryPathTypeForBundleScope:v8];

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __124__PLModelMigrationAction_RelocateBundleScopeData_updateResourceFilePathWithManagedObjectContext_bundleScope_progress_error___block_invoke;
    v33[3] = &unk_1E586B318;
    char v36 = v25;
    v33[4] = self;
    v35 = v40;
    id v34 = v32;
    v26 = [v11 enumerateWithIncrementalSaveUsingObjects:v22 withBlock:v33];

    if (v26)
    {
      v27 = PLMigrationGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)v39 = "-[PLModelMigrationAction_RelocateBundleScopeData updateResourceFilePathWithManagedObjectContext"
                         ":bundleScope:progress:error:]";
        *(_WORD *)&v39[8] = 2112;
        *(void *)&v39[10] = v26;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "%{public}s: enumerate with incremental save failed: %@", buf, 0x16u);
      }
      int64_t v28 = 3;
    }
    else
    {
      v27 = PLMigrationGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = *(void *)(*(void *)&v40[8] + 24);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v39 = v25;
        *(_WORD *)&v39[4] = 2048;
        *(void *)&v39[6] = v30;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "Updated file key paths for type %d. %ld assets updated.", buf, 0x12u);
      }
      int64_t v28 = 1;
    }

    _Block_object_dispose(v40, 8);
    if (a6) {
LABEL_17:
    }
      *a6 = v26;
  }
  else
  {
    v29 = PLMigrationGetLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v40 = 136446466;
      *(void *)&v40[4] = "-[PLModelMigrationAction_RelocateBundleScopeData updateResourceFilePathWithManagedObjectConte"
                           "xt:bundleScope:progress:error:]";
      *(_WORD *)&v40[12] = 2112;
      *(void *)&v40[14] = v23;
      _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "%{public}s: resource fetch failed: %@", v40, 0x16u);
    }

    int64_t v28 = 3;
    v26 = v23;
    if (a6) {
      goto LABEL_17;
    }
  }

  return v28;
}

- (int64_t)renameWithDestinationPath:(unsigned __int8)a3 error:(id *)a4
{
  uint64_t v5 = a3;
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  v7 = [(PLModelMigrationActionCore *)self pathManager];
  uint64_t v8 = [v7 photoDirectoryWithType:v5];

  id v9 = [(PLModelMigrationAction_RelocateBundleScopeData *)self legacyPrefixPathWithType:v5];
  v10 = (const std::__fs::filesystem::path *)[v9 fileSystemRepresentation];
  id v11 = v8;
  v12 = (const std::__fs::filesystem::path *)[v11 fileSystemRepresentation];
  rename(v10, v12, v13);
  if (v14)
  {
    if (*__error() != 2)
    {
      v57 = a4;
      v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28798];
      uint64_t v24 = *__error();
      uint64_t v68 = *MEMORY[0x1E4F28568];
      uint64_t v25 = v68;
      v26 = NSString;
      v27 = __error();
      int64_t v28 = [v26 stringWithUTF8String:strerror(*v27)];
      v69 = v28;
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      uint64_t v30 = [v22 errorWithDomain:v23 code:v24 userInfo:v29];

      v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *MEMORY[0x1E4F8C500];
      uint64_t v33 = *MEMORY[0x1E4F28A50];
      v66[0] = v25;
      v66[1] = v33;
      v67[0] = @"Failed to relocate bundle directory";
      v67[1] = v30;
      id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];
      v35 = [v31 errorWithDomain:v32 code:46003 userInfo:v34];

      char v36 = PLMigrationGetLog();
      LODWORD(v34) = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);

      if (v34)
      {
        id v37 = [(PLModelMigrationActionCore *)self logger];

        if (v37)
        {
          long long v98 = 0u;
          long long v99 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          long long v71 = 0u;
          memset(buf, 0, sizeof(buf));
          v38 = PLMigrationGetLog();
          os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
          v39 = [v9 lastPathComponent];
          v40 = [v11 lastPathComponent];
          int v41 = *__error();
          v42 = __error();
          v43 = strerror(*v42);
          int v58 = 138544130;
          v59 = v39;
          __int16 v60 = 2114;
          v61 = v40;
          __int16 v62 = 1024;
          int v63 = v41;
          __int16 v64 = 2082;
          v65 = v43;
          LODWORD(v56) = 38;
          v44 = (uint8_t *)_os_log_send_and_compose_impl();

          v45 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v45, "logWithMessage:fromCodeLocation:type:", v44, "PLModelMigrationActions_15000.m", 509, 16);

          if (v44 != buf) {
            free(v44);
          }
        }
        else
        {
          v50 = PLMigrationGetLog();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            v51 = [v9 lastPathComponent];
            v52 = [v11 lastPathComponent];
            int v53 = *__error();
            v54 = __error();
            v55 = strerror(*v54);
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v51;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v52;
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = v53;
            *(_WORD *)&buf[28] = 2082;
            *(void *)&buf[30] = v55;
            _os_log_impl(&dword_19B3C7000, v50, OS_LOG_TYPE_ERROR, "rename failed: From filename %{public}@ to %{public}@. Error: (%d) %{public}s", buf, 0x26u);
          }
        }
      }

      int64_t v48 = 3;
      a4 = v57;
      if (v57) {
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    v15 = PLMigrationGetLog();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      v17 = [(PLModelMigrationActionCore *)self logger];

      if (v17)
      {
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v71 = 0u;
        memset(buf, 0, sizeof(buf));
        v18 = PLMigrationGetLog();
        os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        v19 = [v9 lastPathComponent];
        int v58 = 138543362;
        v59 = v19;
        LODWORD(v56) = 12;
        v20 = (uint8_t *)_os_log_send_and_compose_impl();

        v21 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v21, "logWithMessage:fromCodeLocation:type:", v20, "PLModelMigrationActions_15000.m", 502, 0);

        if (v20 != buf) {
          free(v20);
        }
      }
      else
      {
        v46 = PLMigrationGetLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v47 = [v9 lastPathComponent];
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v47;
          _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_DEFAULT, "skipping rename of filename %{public}@", buf, 0xCu);
        }
      }
    }
  }
  v35 = 0;
  int64_t v48 = 1;
  if (a4) {
LABEL_15:
  }
    *a4 = v35;
LABEL_16:

  return v48;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v109[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PLModelMigrationActionCore *)self pathManager];
  int v8 = [v7 isUBF];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F1C0D0];
    v10 = +[PLInternalResource entityName];
    id v11 = [v9 fetchRequestWithEntityName:v10];

    v12 = (void *)MEMORY[0x1E4F28BA0];
    v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", @"dataStoreKeyData");
    v109[0] = v13;
    int v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"asset.bundleScope", &unk_1EEBF1EB0];
    v109[1] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:2];
    BOOL v16 = [v12 andPredicateWithSubpredicates:v15];
    [v11 setPredicate:v16];

    id v71 = 0;
    __int16 v62 = v11;
    uint64_t v17 = [v6 countForFetchRequest:v11 error:&v71];
    id v18 = v71;
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = PLMigrationGetLog();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (v20)
      {
        v21 = [(PLModelMigrationActionCore *)self logger];

        if (v21)
        {
          long long v106 = 0u;
          long long v107 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          *(_OWORD *)buf = 0u;
          long long v77 = 0u;
          v22 = PLMigrationGetLog();
          os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
          int v74 = 138412290;
          id v75 = v18;
          LODWORD(v60) = 12;
          uint64_t v23 = (uint8_t *)_os_log_send_and_compose_impl();

          uint64_t v24 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v24, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActions_15000.m", 479, 16);

          if (v23 != buf) {
            free(v23);
          }
        }
        else
        {
          uint64_t v56 = PLMigrationGetLog();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v18;
            _os_log_impl(&dword_19B3C7000, v56, OS_LOG_TYPE_ERROR, "Failed to obtain count of bundle scoped items. Error: %@", buf, 0xCu);
          }
        }
      }
      int64_t v41 = 3;
    }
    else
    {
      uint64_t v33 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [&unk_1EEBF1EC8 count] + v17, 0);
      id v34 = [(PLModelMigrationActionCore *)self pathManager];
      uint64_t v35 = *MEMORY[0x1E4F8C530];
      id v70 = v18;
      char v36 = [v34 photoDirectoryWithType:1 leafType:1 additionalPathComponents:v35 createIfNeeded:1 error:&v70];
      id v37 = v70;

      id v63 = v6;
      if (v36)
      {
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        uint64_t v38 = [&unk_1EEBF1EC8 countByEnumeratingWithState:&v66 objects:v108 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v67;
          int64_t v41 = 1;
          v61 = a4;
          while (2)
          {
            for (uint64_t i = 0; i != v39; ++i)
            {
              if (*(void *)v67 != v40) {
                objc_enumerationMutation(&unk_1EEBF1EC8);
              }
              unsigned __int16 v43 = [*(id *)(*((void *)&v66 + 1) + 8 * i) unsignedIntValue];
              v44 = [(PLModelMigrationActionCore *)self pathManager];
              uint64_t v45 = [v44 photoLibraryPathTypeForBundleScope:v43];

              id v65 = v37;
              int64_t v46 = [(PLModelMigrationAction_RelocateBundleScopeData *)self renameWithDestinationPath:v45 error:&v65];
              id v47 = v65;

              if (v46 != 1 || v43 == 2)
              {
                id v37 = v47;
              }
              else
              {
                id v64 = v47;
                int64_t v46 = [(PLModelMigrationAction_RelocateBundleScopeData *)self updateResourceFilePathWithManagedObjectContext:v63 bundleScope:v43 progress:v33 error:&v64];
                id v37 = v64;
              }
              objc_msgSend(v33, "setCompletedUnitCount:", objc_msgSend(v33, "completedUnitCount") + 1);
              if (v46 != 1)
              {
                int64_t v41 = v46;
                a4 = v61;
                goto LABEL_45;
              }
            }
            uint64_t v39 = [&unk_1EEBF1EC8 countByEnumeratingWithState:&v66 objects:v108 count:16];
            a4 = v61;
            if (v39) {
              continue;
            }
            break;
          }
        }
        else
        {
          int64_t v41 = 1;
        }
      }
      else
      {
        v50 = PLMigrationGetLog();
        BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);

        if (v51)
        {
          v52 = [(PLModelMigrationActionCore *)self logger];

          if (v52)
          {
            long long v106 = 0u;
            long long v107 = 0u;
            long long v104 = 0u;
            long long v105 = 0u;
            long long v102 = 0u;
            long long v103 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            long long v98 = 0u;
            long long v99 = 0u;
            long long v96 = 0u;
            long long v97 = 0u;
            long long v94 = 0u;
            long long v95 = 0u;
            long long v92 = 0u;
            long long v93 = 0u;
            long long v90 = 0u;
            long long v91 = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            long long v84 = 0u;
            long long v85 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            *(_OWORD *)buf = 0u;
            long long v77 = 0u;
            int v53 = PLMigrationGetLog();
            os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
            int v74 = 138412290;
            id v75 = v37;
            LODWORD(v60) = 12;
            v54 = (uint8_t *)_os_log_send_and_compose_impl();

            v55 = [(PLModelMigrationActionCore *)self logger];
            objc_msgSend(v55, "logWithMessage:fromCodeLocation:type:", v54, "PLModelMigrationActions_15000.m", 475, 16);

            if (v54 != buf) {
              free(v54);
            }
          }
          else
          {
            v57 = PLMigrationGetLog();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v37;
              _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_ERROR, "Failed to create scoped directory. Error: %@", buf, 0xCu);
            }
          }
        }
        int64_t v41 = 3;
      }
LABEL_45:

      id v18 = v37;
      id v6 = v63;
    }
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F8C500];
    uint64_t v72 = *MEMORY[0x1E4F28568];
    long long v73 = @"Unexpected attempt to relocate scoped paths for DCIM";
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    id v18 = [v25 errorWithDomain:v26 code:46003 userInfo:v27];

    int64_t v28 = PLMigrationGetLog();
    LODWORD(v26) = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

    if (v26)
    {
      v29 = [(PLModelMigrationActionCore *)self logger];

      if (v29)
      {
        long long v106 = 0u;
        long long v107 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        *(_OWORD *)buf = 0u;
        long long v77 = 0u;
        uint64_t v30 = PLMigrationGetLog();
        os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
        LOWORD(v74) = 0;
        LODWORD(v59) = 2;
        v31 = (uint8_t *)_os_log_send_and_compose_impl();

        uint64_t v32 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v32, "logWithMessage:fromCodeLocation:type:", v31, "PLModelMigrationActions_15000.m", 485, 16);

        if (v31 != buf) {
          free(v31);
        }
      }
      else
      {
        v49 = PLMigrationGetLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_ERROR, "Unexpected attempt to relocate scoped paths for DCIM", buf, 2u);
        }
      }
    }
    int64_t v41 = 3;
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4) {
    *a4 = v18;
  }

  return v41;
}

@end