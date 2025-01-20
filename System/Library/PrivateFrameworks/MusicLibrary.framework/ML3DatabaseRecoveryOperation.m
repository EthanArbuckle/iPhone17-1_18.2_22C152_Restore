@interface ML3DatabaseRecoveryOperation
- (ML3DatabaseRecoveryOperation)initWithDatabaseFilePath:(id)a3;
- (NSError)error;
- (NSString)path;
- (id)_createSQLiteErrorWithCode:(int)a3 description:(id)a4;
- (id)_lastCorruptionRestoreAttemptDate;
- (void)_recreateDatabaseWithCompletion:(id)a3;
- (void)_updateLastCorruptionRestoreAttemptDate;
- (void)main;
@end

@implementation ML3DatabaseRecoveryOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

- (NSError)error
{
  return self->_error;
}

- (NSString)path
{
  return self->_path;
}

- (void)_recreateDatabaseWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "Asking service to recreate database...", buf, 2u);
  }

  v6 = +[MLMediaLibraryService sharedMediaLibraryService];
  path = self->_path;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__ML3DatabaseRecoveryOperation__recreateDatabaseWithCompletion___block_invoke;
  v9[3] = &unk_1E5FB7390;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v6 recreateDatabaseAtPath:path withCompletionHandler:v9];
}

void __64__ML3DatabaseRecoveryOperation__recreateDatabaseWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      id v8 = *(void **)(*(void *)(a1 + 32) + 248);
      int v10 = 138543362;
      id v11 = v8;
      v9 = "[ML3DatabaseRecoveryOperation] Successfully recreated database at path %{public}@";
LABEL_6:
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (v7)
  {
    int v10 = 138543362;
    id v11 = v5;
    v9 = "[ML3DatabaseRecoveryOperation] Failed to recreate database. %{public}@";
    goto LABEL_6;
  }

  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2);
}

- (void)_updateLastCorruptionRestoreAttemptDate
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v3 setObject:v2 forKey:@"LastCorruptionRestoreAttempt"];
}

- (id)_lastCorruptionRestoreAttemptDate
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"LastCorruptionRestoreAttempt"];

  return v3;
}

- (id)_createSQLiteErrorWithCode:(int)a3 description:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = a3;
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [v4 errorWithDomain:@"NSSQLiteErrorDomain" code:v5 userInfo:v8];

  return v9;
}

- (void)main
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "[ML3DatabaseRecoveryOperation] Starting recovery operation...", buf, 2u);
  }

  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v4 fileExistsAtPath:self->_path] && MSVDeviceOSIsInternalInstall())
  {
    uint64_t v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "[ML3DatabaseRecoveryOperation] Internal device. Backing up database file for analysis...", buf, 2u);
    }

    v6 = [(NSString *)self->_path stringByAppendingPathExtension:@"bak"];
    path = self->_path;
    id v14 = 0;
    ML3CopyDatabase(path, v6, &v14);
    id v8 = v14;
    v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v8;
        uint64_t v11 = "[ML3DatabaseRecoveryOperation] Error backing up database file: %{public}@";
LABEL_12:
        _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
      }
    }
    else if (v10)
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      uint64_t v11 = "[ML3DatabaseRecoveryOperation] Successfully backed up database file to %{public}@";
      goto LABEL_12;
    }
  }
  [(ML3DatabaseRecoveryOperation *)self _recreateDatabaseWithCompletion:&__block_literal_global_21081];

  uint64_t v12 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = 0;
    _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "[ML3DatabaseRecoveryOperation] Recovery operation complete. err=%{public}@", buf, 0xCu);
  }

  error = self->_error;
  self->_error = 0;
}

- (ML3DatabaseRecoveryOperation)initWithDatabaseFilePath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3DatabaseRecoveryOperation;
  uint64_t v5 = [(ML3DatabaseRecoveryOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    path = v5->_path;
    v5->_path = (NSString *)v6;
  }
  return v5;
}

@end