@interface BKMigrator
- (BOOL)_moveRestoredFileAtPath:(id)a3;
- (void)_migrateBackBoard;
- (void)_removeUnusedFiles;
- (void)migrateIfNecessary;
@end

@implementation BKMigrator

- (BOOL)_moveRestoredFileAtPath:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  v5 = [v3 stringByDeletingPathExtension];
  if ([v4 fileExistsAtPath:v3])
  {
    v6 = BKLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v13 = v3;
      __int16 v14 = 2114;
      v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Moving restored file into place from %{public}@ to %{public}@", buf, 0x16u);
    }

    [v4 removeItemAtPath:v5 error:0];
    id v11 = 0;
    unsigned __int8 v7 = [v4 moveItemAtPath:v3 toPath:v5 error:&v11];
    id v8 = v11;
    if ((v7 & 1) == 0)
    {
      v9 = BKLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v13 = v3;
        __int16 v14 = 2114;
        v15 = v5;
        __int16 v16 = 2114;
        id v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unable to move file at path %{public}@ to %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)_removeUnusedFiles
{
  int v3 = open((const char *)[@"/tmp/RestoreRunning" fileSystemRepresentation], 36);
  if (v3 != -1)
  {
    close(v3);
    goto LABEL_6;
  }
  if (*__error() != 35)
  {
LABEL_6:
    v4 = +[NSArray arrayWithObjects:@"~/Library/Calendar/Calendar.sqlitedb.restored", @"~/Library/AddressBook/AddressBook.sqlitedb.restored", @"~/Library/AddressBook/AddressBookImages.sqlitedb.restored", @"~/Library/SpringBoard/IconState.plist.restored", @"~/Library/Preferences/com.apple.springboard.plist.restored", 0];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = [*(id *)(*((void *)&v10 + 1) + 8 * i) stringByExpandingTildeInPath];
          [(BKMigrator *)self _moveRestoredFileAtPath:v9];
        }
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v6);
    }
    goto LABEL_13;
  }
  v4 = BKLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "A restore is currently running. Waiting to move restored preferences into place until later", buf, 2u);
  }
LABEL_13:
}

- (void)_migrateBackBoard
{
  [(BKMigrator *)self _removeUnusedFiles];
  id v2 = +[BKSDefaults localDefaults];
  [v2 migrateDefaultsIfNecessary];
}

- (void)migrateIfNecessary
{
  DMProgressHostIsReady();
  [(BKMigrator *)self _migrateBackBoard];
  BSContinuousMachTimeNow();
  double v4 = v3;
  DMPerformMigrationIfNeeded();
  id v5 = BKLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BSContinuousMachTimeNow();
    int v7 = 134217984;
    double v8 = v6 - v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Migration complete (if performed). (Elapsed time: %.2f seconds)", (uint8_t *)&v7, 0xCu);
  }
}

@end