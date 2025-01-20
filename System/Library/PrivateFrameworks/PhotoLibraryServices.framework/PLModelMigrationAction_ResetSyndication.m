@interface PLModelMigrationAction_ResetSyndication
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ResetSyndication

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F8B980];
  v8 = [(PLModelMigrationActionCore *)self pathManager];
  v9 = [v8 libraryURL];
  uint64_t v10 = [v7 wellKnownPhotoLibraryIdentifierForURL:v9];

  v11 = PLStringFromWellKnownPhotoLibraryIdentifier();
  v12 = PLMigrationGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v11;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Resetting syndication for library identifier %{public}@", buf, 0xCu);
  }

  v13 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:1 pendingParentUnitCount:0];
  [v13 becomeCurrentWithPendingUnitCount:1];
  v14 = [(PLModelMigrationActionCore *)self pathManager];
  if (v10 == 3)
  {
    id v24 = 0;
    char v15 = PLResetSyndicationLibraryWithManagedObjectContext(v6, v14, &v24);
    id v16 = v24;

    [v13 resignCurrent];
    if (v15)
    {
      int64_t v17 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    id v23 = 0;
    int64_t v17 = 1;
    BOOL v20 = PLDeleteGuestAssetsInLibraryWithManagedObjectContext(v6, v14, v19, 1, &v23);
    id v16 = v23;

    [v13 resignCurrent];
    if (v20) {
      goto LABEL_10;
    }
  }
  v21 = PLMigrationGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v11;
    _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to reset syndication for library identifier %{public}@", buf, 0xCu);
  }

  int64_t v17 = 3;
LABEL_10:
  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4) {
    *a4 = v16;
  }

  return v17;
}

@end