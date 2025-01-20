@interface PLModelMigrationAction_FixBadExtendedAttribute
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_FixBadExtendedAttribute

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int64_t v6 = 1;
  v7 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:1 pendingParentUnitCount:0];
  v8 = [(PLModelMigrationActionCore *)self pathManager];
  int v9 = [v8 isSystemPhotoLibraryPathManager];

  id v10 = 0;
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v12 = [(PLModelMigrationActionCore *)self pathManager];
    v13 = [(id)v12 photoDirectoryWithType:2];
    int64_t v6 = 1;
    v14 = [v11 fileURLWithPath:v13 isDirectory:1];

    id v17 = 0;
    LOBYTE(v12) = [MEMORY[0x1E4F8B988] setTimeMachineExclusionAttribute:0 url:v14 error:&v17];
    id v10 = v17;
    if ((v12 & 1) == 0)
    {
      v15 = PLMigrationGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v19 = "-[PLModelMigrationAction_FixBadExtendedAttribute performActionWithManagedObjectContext:error:]";
        __int16 v20 = 2112;
        id v21 = v10;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "%{public}s: Failed to remove the exclusion attribute: %@", buf, 0x16u);
      }

      int64_t v6 = 3;
    }
  }
  objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v7, "completedUnitCount") + 1);
  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4) {
    *a4 = v10;
  }

  return v6;
}

@end