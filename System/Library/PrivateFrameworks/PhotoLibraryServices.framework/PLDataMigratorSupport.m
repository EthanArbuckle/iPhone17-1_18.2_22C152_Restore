@interface PLDataMigratorSupport
- (PLDataMigratorSupport)initWithPathManager:(id)a3;
- (PLPhotoLibraryPathManager)pathManager;
- (void)recordDataMigrationInfo:(id)a3;
- (void)removeAsidePhotosDatabase;
- (void)removeInternalMemoriesRelatedSnapshotDirectory;
- (void)removeLegacyMetadataFiles;
- (void)removeModelInterestDatabase;
@end

@implementation PLDataMigratorSupport

- (void).cxx_destruct
{
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (void)removeLegacyMetadataFiles
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [(PLPhotoLibraryPathManager *)self->_pathManager privateDirectoryWithSubType:5 createIfNeeded:0 error:0];
  v3 = [v2 stringByAppendingPathComponent:@"NVP_HIDDENFACES.hiddenfacemetadata"];
  v4 = [MEMORY[0x1E4F8B908] fileManager];
  if ([v4 fileExistsAtPath:v3])
  {
    id v8 = 0;
    char v5 = [v4 removeItemAtPath:v3 error:&v8];
    id v6 = v8;
    if ((v5 & 1) == 0)
    {
      v7 = PLMigrationGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v10 = v6;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failed to remove hidden faces metadata file with error: %{public}@", buf, 0xCu);
      }
    }
  }
}

- (void)removeAsidePhotosDatabase
{
  id v2 = [(PLPhotoLibraryPathManager *)self->_pathManager photosAsideDatabasePath];
  [MEMORY[0x1E4F8B908] removeDisconnectedSQLiteDatabaseFileWithPath:v2 error:0];
}

- (void)removeInternalMemoriesRelatedSnapshotDirectory
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [(PLPhotoLibraryPathManager *)self->_pathManager legacyMemoriesRelatedSnapshotDirectory];
  v3 = [MEMORY[0x1E4F8B908] fileManager];
  v4 = v3;
  char v12 = 0;
  if (v2)
  {
    if ([v3 fileExistsAtPath:v2 isDirectory:&v12] && v12 != 0)
    {
      id v11 = 0;
      int v6 = [v4 removeItemAtPath:v2 error:&v11];
      id v7 = v11;
      id v8 = v7;
      if (v6) {
        BOOL v9 = v7 == 0;
      }
      else {
        BOOL v9 = 0;
      }
      if (!v9)
      {
        id v10 = PLMigrationGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v14 = v2;
          __int16 v15 = 2112;
          v16 = v8;
          _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Failed to clean up %@ [%@]", buf, 0x16u);
        }
      }
    }
  }
}

- (void)removeModelInterestDatabase
{
  id v2 = [(PLPhotoLibraryPathManager *)self->_pathManager legacyModelInterestDatabasePath];
  [MEMORY[0x1E4F8B908] removeDisconnectedSQLiteDatabaseFileWithPath:v2 error:0];
}

- (void)recordDataMigrationInfo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(PLPhotoLibraryPathManager *)self->_pathManager photoDirectoryWithType:6];
  id v21 = 0;
  char v6 = [MEMORY[0x1E4F8B908] createDirectoryAtPath:v5 error:&v21];
  id v7 = v21;
  if ((v6 & 1) == 0)
  {
    id v8 = PLMigrationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v23 = v5;
      __int16 v24 = 2114;
      id v25 = v7;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Unable to create directory: %{public}@, reason: %{public}@", buf, 0x16u);
    }
  }
  BOOL v9 = [v5 stringByAppendingPathComponent:*MEMORY[0x1E4F8C2F8]];
  id v20 = 0;
  id v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:100 options:0 error:&v20];
  id v11 = v20;

  if (v10)
  {
    id v19 = v11;
    char v12 = [v10 writeToFile:v9 options:1073741825 error:&v19];
    id v13 = v19;

    if (v12) {
      goto LABEL_13;
    }
    v14 = PLMigrationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v23 = v4;
      __int16 v24 = 2114;
      id v25 = v9;
      __int16 v26 = 2114;
      id v27 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Unable to write info dictionary: %{public}@ to %{public}@, reason: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    v14 = PLMigrationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v23 = v4;
      __int16 v24 = 2114;
      id v25 = v11;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Unable to create data from info dictionary: %{public}@, reason: %{public}@", buf, 0x16u);
    }
    id v13 = v11;
  }

LABEL_13:
  id v18 = v13;
  char v15 = [MEMORY[0x1E4F8B908] changeFileOwnerToMobileAtPath:v9 error:&v18];
  id v16 = v18;

  if ((v15 & 1) == 0)
  {
    uint64_t v17 = PLMigrationGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v23 = v9;
      __int16 v24 = 2114;
      id v25 = v16;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Unable to change owner of file at path: %{public}@, reason: %{public}@", buf, 0x16u);
    }
  }
}

- (PLDataMigratorSupport)initWithPathManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLDataMigratorSupport;
  char v6 = [(PLDataMigratorSupport *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pathManager, a3);
  }

  return v7;
}

@end