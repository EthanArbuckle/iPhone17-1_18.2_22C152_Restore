@interface PLModelMigrationAction_RepairUnknownAssetTypeAndUnsupportedPlaybackStyle
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RepairUnknownAssetTypeAndUnsupportedPlaybackStyle

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v114[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v76 = 1;
  uint64_t v67 = 0;
  v68 = (id *)&v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__23954;
  v71 = __Block_byref_object_dispose__23955;
  id v72 = 0;
  v7 = +[PLManagedAsset fetchRequest];
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d || %K == %d", @"kind", 3, @"playbackStyle", 0);
  [v7 setPredicate:v8];

  v114[0] = @"master";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:1];
  [v7 setRelationshipKeyPathsForPrefetching:v9];

  [v7 setFetchBatchSize:100];
  v10 = v68 + 5;
  id obj = v68[5];
  v11 = [v6 executeFetchRequest:v7 error:&obj];
  objc_storeStrong(v10, obj);
  if ([v11 count])
  {
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x2020000000;
    uint64_t v65 = 0;
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    uint64_t v61 = 0;
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x2020000000;
    uint64_t v57 = 0;
    v12 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v11 count], 0);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __120__PLModelMigrationAction_RepairUnknownAssetTypeAndUnsupportedPlaybackStyle_performActionWithManagedObjectContext_error___block_invoke;
    v47[3] = &unk_1E5867410;
    v50 = &v54;
    v51 = &v58;
    v49 = &v62;
    v47[4] = self;
    v52 = &v67;
    v53 = &v73;
    id v13 = v12;
    id v48 = v13;
    v14 = [v6 enumerateWithIncrementalSaveUsingObjects:v11 withBlock:v47];
    if (v14 && !v68[5])
    {
      objc_storeStrong(v68 + 5, v14);
      v74[3] = 3;
    }
    if (v74[3] == 1)
    {
      v15 = PLMigrationGetLog();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (v16)
      {
        v17 = [(PLModelMigrationActionCore *)self logger];
        BOOL v18 = v17 == 0;

        if (!v18)
        {
          long long v112 = 0u;
          long long v113 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
          long long v108 = 0u;
          long long v109 = 0u;
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
          memset(buf, 0, sizeof(buf));
          v19 = PLMigrationGetLog();
          os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
          v20 = (void *)v59[3];
          v21 = (void *)v63[3];
          uint64_t v22 = v55[3];
          int v77 = 134218496;
          v78 = v20;
          __int16 v79 = 2048;
          id v80 = v21;
          __int16 v81 = 2048;
          uint64_t v82 = v22;
          LODWORD(v46) = 32;
          v23 = (uint8_t *)_os_log_send_and_compose_impl();

          v24 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v24, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActions_16000.m", 664, 0);

          goto LABEL_14;
        }
        v34 = PLMigrationGetLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v35 = v59[3];
          uint64_t v36 = v63[3];
          uint64_t v37 = v55[3];
          *(_DWORD *)buf = 134218496;
          *(void *)&buf[4] = v35;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v36;
          *(_WORD *)&buf[22] = 2048;
          *(void *)&buf[24] = v37;
          _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEFAULT, "Fixed %lu unsupported playback style, %lu unknown kind, failed to fix %lu unknown kind", buf, 0x20u);
        }
LABEL_21:
      }
    }
    else
    {
      v25 = PLMigrationGetLog();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

      if (v26)
      {
        v27 = [(PLModelMigrationActionCore *)self logger];
        BOOL v28 = v27 == 0;

        if (!v28)
        {
          long long v112 = 0u;
          long long v113 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
          long long v108 = 0u;
          long long v109 = 0u;
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
          memset(buf, 0, sizeof(buf));
          v29 = PLMigrationGetLog();
          os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
          v30 = (objc_class *)objc_opt_class();
          v31 = NSStringFromClass(v30);
          id v32 = v68[5];
          int v77 = 138543618;
          v78 = v31;
          __int16 v79 = 2114;
          id v80 = v32;
          LODWORD(v46) = 22;
          v23 = (uint8_t *)_os_log_send_and_compose_impl();

          v33 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActions_16000.m", 666, 16);

LABEL_14:
          if (v23 != buf) {
            free(v23);
          }
          goto LABEL_22;
        }
        v34 = PLMigrationGetLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v38 = (objc_class *)objc_opt_class();
          v39 = NSStringFromClass(v38);
          id v40 = v68[5];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v39;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v40;
          _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Failed to save managed object context for %{public}@. Error: %{public}@", buf, 0x16u);
        }
        goto LABEL_21;
      }
    }
LABEL_22:

    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
    goto LABEL_23;
  }
  if (!v11) {
    v74[3] = 3;
  }
LABEL_23:
  [(PLModelMigrationActionCore *)self finalizeProgress];
  uint64_t v41 = v74[3];
  id v42 = v68[5];
  v43 = v42;
  if (v41 != 1 && a4) {
    *a4 = v42;
  }

  int64_t v44 = v74[3];
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v73, 8);
  return v44;
}

@end