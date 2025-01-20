@interface PLPhotoLibraryPathManager(SQLError)
- (id)_rebuildDateFormatter;
- (id)recordRebuildReason;
- (uint64_t)_createSqliteErrorIndicatorFileWithRebuildReason:()SQLError;
- (uint64_t)lastRebuildReason;
- (uint64_t)sqliteErrorIndicatorFileExists;
- (void)_abortWithRebuildReasonPLRebuildReasonBackgroundMigration;
- (void)_abortWithRebuildReasonPLRebuildReasonCorruption;
- (void)_abortWithRebuildReasonPLRebuildReasonDatabaseCorruption;
- (void)_abortWithRebuildReasonPLRebuildReasonExcessiveOrphanedSceneClassifications;
- (void)_abortWithRebuildReasonPLRebuildReasonExcessivePersistentHistorySize;
- (void)_abortWithRebuildReasonPLRebuildReasonExcessiveRecoveryAttempts;
- (void)_abortWithRebuildReasonPLRebuildReasonLightweightMigration;
- (void)_abortWithRebuildReasonPLRebuildReasonMPSPathCorruption;
- (void)_abortWithRebuildReasonPLRebuildReasonMPSUUIDCorruption;
- (void)_abortWithRebuildReasonPLRebuildReasonPathCorruption;
- (void)_abortWithRebuildReasonPLRebuildReasonPersonUUIDCorruption;
- (void)_abortWithRebuildReasonPLRebuildReasonSharedAlbumPathCorruption;
- (void)_abortWithRebuildReasonPLRebuildReasonSharedAlbumUUIDCorruption;
- (void)_abortWithRebuildReasonPLRebuildReasonSimulatedCorruption;
- (void)_abortWithRebuildReasonPLRebuildReasonStagedDemoContentInstallation;
- (void)_abortWithRebuildReasonPLRebuildReasonTooManyOrphanedRecords;
- (void)_abortWithRebuildReasonPLRebuildReasonTooManyThumbnailRebuilds;
- (void)_abortWithRebuildReasonPLRebuildReasonUUIDCorruption;
- (void)_abortWithRebuildReasonPLRebuildReasonUnknown;
- (void)_abortWithRebuildReasonPLRebuildReasonUnknownAssetColumnTriggerCorruption;
- (void)_abortWithRebuildReasonPLRebuildReasonUpgradeForceRebuild;
- (void)removeSqliteErrorIndicatorFile;
- (void)setSqliteErrorForRebuildReason:()SQLError allowsExit:;
@end

@implementation PLPhotoLibraryPathManager(SQLError)

- (uint64_t)sqliteErrorIndicatorFileExists
{
  v1 = [a1 sqliteErrorIndicatorFilePath];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [v2 fileExistsAtPath:v1];

  return v3;
}

- (id)recordRebuildReason
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v2 = PLMigrationGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Recording rebuild reason", buf, 2u);
  }

  uint64_t v3 = [a1 sqliteErrorIndicatorFilePath];
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  if (!v5)
  {
    v7 = 0;
    goto LABEL_17;
  }
  v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3];
  id v30 = 0;
  v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:&v30];
  id v8 = v30;
  if (!v7)
  {
    v23 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v29 = 0;
    v24 = [v23 attributesOfItemAtPath:v3 error:&v29];
    id v9 = v29;

    if (!v24)
    {
      v10 = PLMigrationGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v32 = v3;
        __int16 v33 = 2112;
        id v34 = v9;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Unable to get attributes for %@: %@", buf, 0x16u);
      }
      v7 = 0;
      goto LABEL_15;
    }
    v25 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F282C0]];
    if (v25)
    {
      v26 = [a1 _rebuildDateFormatter];
      v27 = [v26 stringFromDate:v25];

      v35 = v27;
      v36[0] = &unk_1EEBEFCD8;
      v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    }
    else
    {
      v7 = 0;
    }

    if (!v7) {
      goto LABEL_16;
    }
  }
  PLRecordRebuildHistory(v7);
  id v9 = [a1 rebuildHistoryFilePath];
  v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v12 = [v11 fileExistsAtPath:v9];

  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v9];

    v10 = v13;
  }
  [v10 addEntriesFromDictionary:v7];
  v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];
  id v28 = 0;
  int v15 = [v10 writeToURL:v14 error:&v28];
  id v16 = v28;

  v17 = PLMigrationGetLog();
  v18 = v17;
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = v7;
      __int16 v33 = 2112;
      id v34 = v9;
      v19 = "Added last rebuild %@ to rebuild history file %@";
      v20 = v18;
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
      _os_log_impl(&dword_19B3C7000, v20, v21, v19, buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v32 = v9;
    __int16 v33 = 2112;
    id v34 = v16;
    v19 = "Failed to update rebuild history file %@: %@";
    v20 = v18;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    goto LABEL_13;
  }

LABEL_15:
LABEL_16:

LABEL_17:
  return v7;
}

- (uint64_t)lastRebuildReason
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![a1 sqliteErrorIndicatorFileExists]) {
    return 0;
  }
  v2 = [a1 sqliteErrorIndicatorFilePath];
  uint64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v2];
  id v12 = 0;
  v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v12];
  id v5 = v12;
  if (v4)
  {
    v6 = [v4 allKeys];
    v7 = [v6 sortedArrayUsingSelector:sel_compare_];

    id v8 = [v7 lastObject];
    id v9 = [v4 objectForKeyedSubscript:v8];
    uint64_t v10 = [v9 integerValue];
  }
  else
  {
    v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failed to deserialize sqliteerror. Error: %@", buf, 0xCu);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)setSqliteErrorForRebuildReason:()SQLError allowsExit:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a1, "_createSqliteErrorIndicatorFileWithRebuildReason:"))
  {
    switch((unint64_t)a3)
    {
      case 0uLL:
      case 1uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
      case 0xFuLL:
      case 0x13uLL:
      case 0x14uLL:
      case 0x15uLL:
        v7 = PLBackendGetLog();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_6;
        }
        *(_DWORD *)buf = 134217984;
        id v29 = a3;
        id v8 = "Handling corrupt database due to rebuild reason %ld... killing all photos clients";
        id v9 = v7;
        uint32_t v10 = 12;
        goto LABEL_5;
      case 2uLL:
        v7 = PLBackendGetLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          id v8 = "Forcing all photos clients to exit to simulate a corrupt database...";
          id v9 = v7;
          uint32_t v10 = 2;
LABEL_5:
          _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
        }
LABEL_6:
        int v11 = 1;
        goto LABEL_28;
      case 3uLL:
        v7 = PLBackendGetLog();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        *(_WORD *)buf = 0;
        id v14 = "Forcing all photos clients to exit to install staged demo content...";
        goto LABEL_25;
      case 4uLL:
        v7 = PLBackendGetLog();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        *(_WORD *)buf = 0;
        id v14 = "Creating sqlite error file before lightweight migration";
        goto LABEL_20;
      case 0x10uLL:
        v7 = PLBackendGetLog();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        *(_WORD *)buf = 0;
        id v14 = "Creating sqlite error file for excessive persistent history size";
LABEL_20:
        uint64_t v15 = v7;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_26;
      case 0x11uLL:
        v7 = PLBackendGetLog();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        *(_WORD *)buf = 0;
        id v14 = "User requested force rebuild from Settings";
        goto LABEL_25;
      case 0x12uLL:
        v7 = PLBackendGetLog();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        *(_WORD *)buf = 0;
        id v14 = "Creating sqlite error file for background Migration failure";
LABEL_25:
        uint64_t v15 = v7;
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_26:
        _os_log_impl(&dword_19B3C7000, v15, v16, v14, buf, 2u);
LABEL_27:
        int v11 = 0;
LABEL_28:

        if (a4)
        {
LABEL_29:
          v17 = objc_opt_class();
          v18 = [a1 libraryURL];
          LODWORD(v17) = [v17 isSystemPhotoLibraryURL:v18];

          if (v17)
          {
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            v20 = &PLPhotoLibraryCorruptNotification;
            if (!v11) {
              v20 = &PLPhotoLibraryForceClientExitNotification;
            }
            CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*v20, 0, 0, 0);
          }
          if ((PLIsAssetsd() & 1) == 0)
          {
            os_log_type_t v21 = [a1 libraryURL];
            v22 = +[PLPhotoLibraryBundleController sharedAssetsdClientForPhotoLibraryURL:v21];
            v23 = [v22 libraryClient];
            id v27 = 0;
            char v24 = [v23 validateOrRebuildPhotoLibraryDatabaseWithError:&v27];
            id v25 = v27;

            if ((v24 & 1) == 0)
            {
              v26 = PLBackendGetLog();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v29 = v25;
                _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Error asking assetsd to rebuild photo library: %@", buf, 0xCu);
              }
            }
          }
          if (v11)
          {
            switch((unint64_t)a3)
            {
              case 0uLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonUnknown];
                break;
              case 1uLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonCorruption];
                break;
              case 2uLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonSimulatedCorruption];
                break;
              case 3uLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonStagedDemoContentInstallation];
                break;
              case 4uLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonLightweightMigration];
                break;
              case 5uLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonTooManyOrphanedRecords];
                break;
              case 6uLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonUUIDCorruption];
                break;
              case 7uLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonPathCorruption];
                break;
              case 8uLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonDatabaseCorruption];
                break;
              case 9uLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonTooManyThumbnailRebuilds];
                break;
              case 0xAuLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonUpgradeForceRebuild];
                break;
              case 0xBuLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonExcessiveRecoveryAttempts];
                break;
              case 0xCuLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonMPSPathCorruption];
                break;
              case 0xDuLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonSharedAlbumPathCorruption];
                break;
              case 0xEuLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonMPSUUIDCorruption];
                break;
              case 0xFuLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonSharedAlbumUUIDCorruption];
                break;
              case 0x10uLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonExcessivePersistentHistorySize];
                break;
              case 0x12uLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonBackgroundMigration];
                break;
              case 0x13uLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonPersonUUIDCorruption];
                break;
              case 0x14uLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonExcessiveOrphanedSceneClassifications];
                break;
              case 0x15uLL:
                [a1 _abortWithRebuildReasonPLRebuildReasonUnknownAssetColumnTriggerCorruption];
                break;
              default:
                return;
            }
          }
          else if (a3 != (void *)17)
          {
            if (a3 != (void *)3) {
              exit(1);
            }
            PLAbortWithReason();
          }
        }
        break;
      default:
        int v11 = 0;
        if (!a4) {
          return;
        }
        goto LABEL_29;
    }
  }
  else
  {
    id v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [a1 sqliteErrorIndicatorFilePath];
      *(_DWORD *)buf = 138412290;
      id v29 = v13;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Failed to create sqlite error file %@.", buf, 0xCu);
    }
  }
}

- (void)_abortWithRebuildReasonPLRebuildReasonUnknownAssetColumnTriggerCorruption
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonExcessiveOrphanedSceneClassifications
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonPersonUUIDCorruption
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonBackgroundMigration
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonExcessivePersistentHistorySize
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonSharedAlbumUUIDCorruption
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonMPSUUIDCorruption
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonSharedAlbumPathCorruption
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonMPSPathCorruption
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonUpgradeForceRebuild
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonTooManyThumbnailRebuilds
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonDatabaseCorruption
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonPathCorruption
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonUUIDCorruption
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonTooManyOrphanedRecords
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonExcessiveRecoveryAttempts
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonCorruption
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonUnknown
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonLightweightMigration
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonStagedDemoContentInstallation
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonSimulatedCorruption
{
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)removeSqliteErrorIndicatorFile
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v1 = [a1 sqliteErrorIndicatorFilePath];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = 0;
  int v3 = [v2 removeItemAtPath:v1 error:&v12];
  id v4 = v12;

  if (v3)
  {
    int v5 = PLMigrationGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v1;
      v6 = "Removed sqliteErrorIndicatorFile %@";
LABEL_8:
      id v9 = v5;
      os_log_type_t v10 = OS_LOG_TYPE_INFO;
      uint32_t v11 = 12;
LABEL_11:
      _os_log_impl(&dword_19B3C7000, v9, v10, v6, buf, v11);
    }
  }
  else if ([v4 code] == 4 {
         && ([v4 domain],
  }
             v7 = objc_claimAutoreleasedReturnValue(),
             int v8 = [v7 isEqualToString:*MEMORY[0x1E4F281F8]],
             v7,
             v8))
  {
    int v5 = PLMigrationGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v1;
      v6 = "sqliteErrorIndicatorFile does not exist at %@";
      goto LABEL_8;
    }
  }
  else
  {
    int v5 = PLMigrationGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v1;
      __int16 v15 = 2112;
      id v16 = v4;
      v6 = "Failed to remove sqliteErrorIndicatorFile %@, %@";
      id v9 = v5;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 22;
      goto LABEL_11;
    }
  }
}

- (uint64_t)_createSqliteErrorIndicatorFileWithRebuildReason:()SQLError
{
  v35[1] = *MEMORY[0x1E4F143B8];
  int v5 = [a1 sqliteErrorIndicatorFilePath];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = open((const char *)[v7 fileSystemRepresentation], 2689, 438);
    if ((v8 & 0x80000000) == 0)
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v8 closeOnDealloc:1];
      os_log_type_t v10 = [a1 _rebuildDateFormatter];
      uint32_t v11 = [MEMORY[0x1E4F1C9C8] date];
      id v12 = [v10 stringFromDate:v11];

      id v34 = v12;
      uint64_t v13 = [NSNumber numberWithInteger:a3];
      v35[0] = v13;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];

      id v27 = 0;
      __int16 v15 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v14 format:200 options:0 error:&v27];
      id v16 = v27;
      if (!v15)
      {
        v18 = PLBackendGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v29 = v14;
          __int16 v30 = 2112;
          id v31 = v16;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to archive %@: %@", buf, 0x16u);
        }
        uint64_t v17 = 0;
        goto LABEL_15;
      }
      id v26 = 0;
      uint64_t v17 = [v9 writeData:v15 error:&v26];
      v18 = v26;
      v19 = PLBackendGetLog();
      v20 = v19;
      if (v17)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v29 = v14;
          __int16 v30 = 2112;
          id v31 = v7;
          os_log_type_t v21 = "Written %@ to %@";
          v22 = v20;
          os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
          uint32_t v24 = 22;
LABEL_13:
          _os_log_impl(&dword_19B3C7000, v22, v23, v21, buf, v24);
        }
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v29 = v14;
        __int16 v30 = 2112;
        id v31 = v7;
        __int16 v32 = 2112;
        __int16 v33 = v18;
        os_log_type_t v21 = "Failed to write %@ to %@: %@";
        v22 = v20;
        os_log_type_t v23 = OS_LOG_TYPE_ERROR;
        uint32_t v24 = 32;
        goto LABEL_13;
      }

LABEL_15:
      goto LABEL_16;
    }
  }
  uint64_t v17 = 0;
LABEL_16:

  return v17;
}

- (id)_rebuildDateFormatter
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v0 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSZZZZZ"];
  v1 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
  [v0 setLocale:v1];

  return v0;
}

@end