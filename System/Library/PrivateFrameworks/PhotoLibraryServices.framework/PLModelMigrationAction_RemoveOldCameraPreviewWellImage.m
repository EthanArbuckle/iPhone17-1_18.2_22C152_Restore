@interface PLModelMigrationAction_RemoveOldCameraPreviewWellImage
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RemoveOldCameraPreviewWellImage

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = 1;
  v8 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:1 pendingParentUnitCount:1];
  [v8 becomeCurrentWithPendingUnitCount:1];
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  v10 = [MEMORY[0x1E4F8B840] photoDataMiscDirectory];
  v11 = [v10 stringByAppendingPathComponent:@"PreviewWellImage.tiff"];

  if ([v9 fileExistsAtPath:v11])
  {
    id v31 = 0;
    char v12 = [v9 removeItemAtPath:v11 error:&v31];
    id v13 = v31;
    if (v12)
    {
      char v14 = 1;
      int64_t v7 = 1;
    }
    else
    {
      v15 = PLMigrationGetLog();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (v16)
      {
        v17 = [(PLModelMigrationActionCore *)self logger];

        if (v17)
        {
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
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          memset(buf, 0, sizeof(buf));
          v18 = PLMigrationGetLog();
          os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
          v19 = (objc_class *)objc_opt_class();
          v20 = NSStringFromClass(v19);
          int v32 = 138543618;
          v33 = v20;
          __int16 v34 = 2112;
          id v35 = v13;
          LODWORD(v30) = 22;
          v21 = (uint8_t *)_os_log_send_and_compose_impl();

          v22 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v22, "logWithMessage:fromCodeLocation:type:", v21, "PLModelMigrationActions_18000.m", 520, 16);

          if (v21 != buf) {
            free(v21);
          }
        }
        else
        {
          v23 = PLMigrationGetLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = (objc_class *)objc_opt_class();
            v25 = NSStringFromClass(v24);
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v25;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v13;
            _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Failed to delete existing camera preview well image %{public}@. Error: %@", buf, 0x16u);
          }
        }
      }
      char v14 = 0;
      int64_t v7 = 3;
    }
  }
  else
  {
    id v13 = 0;
    char v14 = 1;
  }
  v26 = objc_alloc_init(PLCameraPreviewWellManager);
  [(PLCameraPreviewWellManager *)v26 refreshPreviewWellImageWithContext:v6 avoidNotificationIfLinkIsAlreadySet:0];

  [v8 resignCurrent];
  id v27 = v13;
  v28 = v27;
  if ((v14 & 1) == 0 && a4) {
    *a4 = v27;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  return v7;
}

@end