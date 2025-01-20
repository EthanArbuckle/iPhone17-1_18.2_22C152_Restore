@interface ML3DatabaseValidation
- (BOOL)_internalUserAgreesToRebuildUnmigratableDatabase;
- (BOOL)_performDatabasePreprocessingWithLibrary:(id)a3 error:(id *)a4;
- (BOOL)_performSchemaUpgradeWithLibrary:(id)a3 error:(id *)a4;
- (BOOL)_truncateDatabaseFileForLibrary:(id)a3 withError:(id *)a4;
- (BOOL)_validateLibraryDatabaseIfNecessary:(id)a3 withError:(id *)a4;
- (BOOL)truncateBeforeValidating;
- (ML3DatabaseValidation)initWithLibrary:(id)a3 delegate:(id)a4 completion:(id)a5;
- (ML3DatabaseValidationDelegate)delegate;
- (ML3MusicLibrary)library;
- (id)completionHandler;
- (void)_logDatabasePathDirectoryAttributes;
- (void)runValidation;
- (void)setCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTruncateBeforeValidating:(BOOL)a3;
@end

@implementation ML3DatabaseValidation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_library, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setDelegate:(id)a3
{
}

- (ML3DatabaseValidationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ML3DatabaseValidationDelegate *)WeakRetained;
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (void)setTruncateBeforeValidating:(BOOL)a3
{
  self->_truncateBeforeValidating = a3;
}

- (BOOL)truncateBeforeValidating
{
  return self->_truncateBeforeValidating;
}

- (void)_logDatabasePathDirectoryAttributes
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [(ML3DatabaseValidation *)self library];
  v3 = [v2 databasePath];

  v4 = MLMobileUserHomeDirectory();
  v5 = [v4 stringByAppendingPathComponent:@"Media"];

  v6 = [v3 stringByDeletingLastPathComponent];

  if ([v6 hasPrefix:v5])
  {
    *(void *)&long long v7 = 138543362;
    long long v17 = v7;
    v8 = v6;
    do
    {
      char v9 = objc_msgSend(v8, "isEqualToString:", v5, v17);
      v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v11 = [v10 fileExistsAtPath:v8];

      if (v11)
      {
        v12 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v18 = 0;
        v13 = [v12 attributesOfItemAtPath:v8 error:&v18];
        v14 = v18;

        v15 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v20 = v13;
          __int16 v21 = 2114;
          v22 = v14;
          __int16 v23 = 2114;
          v24 = v8;
          _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "finished loading fileSystemAttributes=%{public}@ with error=%{public}@ for path=%{public}@", buf, 0x20u);
        }
      }
      else
      {
        v14 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v17;
          v20 = v8;
          _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_ERROR, "Directory does not exist at path %{public}@", buf, 0xCu);
        }
      }

      v6 = [v8 stringByDeletingLastPathComponent];

      v8 = v6;
    }
    while ((v9 & 1) == 0);
  }
  else
  {
    v16 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v20 = v6;
      __int16 v21 = 2114;
      v22 = v5;
      _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_ERROR, "database at %{public}@ is not a subdirectory of %{public}@", buf, 0x16u);
    }
  }
}

- (BOOL)_internalUserAgreesToRebuildUnmigratableDatabase
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if (ML3IsProcessRunning(@"com.apple.SpringBoard") && !ML3IsProcessRunning(@"com.apple.datamigrator"))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F77A20]);
    [v2 setAlertHeader:@"Unmigratable Media Library"];
    [v2 setAlertMessage:@"The media library service has detected that this device has been downgraded from a newer operating system version. The service does not support migration back to previous versions.\n\nPlease either erase-install the desired version of the operating system, or select the option to let the service rebuild your media library database. This WILL erase your media library on this device.\n\n[This dialog is shown for internal users only.]"];
    [v2 setDefaultButtonTitle:@"Rebuild Library"];
    [v2 setAlternateButtonTitle:@"Ignore"];
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F77A18]) initWithOptions:v2];
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__ML3DatabaseValidation__internalUserAgreesToRebuildUnmigratableDatabase__block_invoke;
    v8[3] = &unk_1E5FB4F38;
    v10 = &v11;
    v5 = v4;
    char v9 = v5;
    [v3 presentWithCompletion:v8];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  }
  char v6 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v6;
}

intptr_t __73__ML3DatabaseValidation__internalUserAgreesToRebuildUnmigratableDatabase__block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 buttonIdentifier] == 1;
  v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

- (BOOL)_performDatabasePreprocessingWithLibrary:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  char v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    long long v7 = [v5 databasePath];
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "Preprocessing database for library at path %{public}@", buf, 0xCu);
  }
  int v8 = [v5 coerceValidDatabaseWithError:a4];
  *((unsigned char *)v15 + 24) = v8;
  if (v8)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__ML3DatabaseValidation__performDatabasePreprocessingWithLibrary_error___block_invoke;
    v11[3] = &unk_1E5FB4F10;
    uint64_t v13 = &v14;
    id v12 = v5;
    [v12 performDatabaseTransactionWithBlock:v11];

    BOOL v9 = *((unsigned char *)v15 + 24) != 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  _Block_object_dispose(&v14, 8);

  return v9;
}

uint64_t __72__ML3DatabaseValidation__performDatabasePreprocessingWithLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) updateSortMap];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    __int16 v11 = 0;
    char v6 = "[Preprocessing] Failed to update sort map.";
    long long v7 = (uint8_t *)&v11;
LABEL_11:
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_ERROR, v6, v7, 2u);
    goto LABEL_12;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) createIndexes];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    __int16 v10 = 0;
    char v6 = "[Preprocessing] Failed to create indexes.";
    long long v7 = (uint8_t *)&v10;
    goto LABEL_11;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) updateSystemPlaylistNamesForCurrentLanguageUsingConnection:v3];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __int16 v9 = 0;
      char v6 = "[Preprocessing] Failed to update system playlist names for current language.";
      long long v7 = (uint8_t *)&v9;
      goto LABEL_11;
    }
LABEL_12:

    uint64_t v4 = 0;
    goto LABEL_13;
  }
  uint64_t v4 = 1;
LABEL_13:

  return v4;
}

- (BOOL)_performSchemaUpgradeWithLibrary:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    long long v7 = [v5 databasePath];
    int v10 = 138543362;
    __int16 v11 = v7;
    _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "Upgrading schema for library at path %{public}@", (uint8_t *)&v10, 0xCu);
  }
  char v8 = [v5 coerceValidDatabaseWithError:a4];

  return v8;
}

- (BOOL)_validateLibraryDatabaseIfNecessary:(id)a3 withError:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__ML3DatabaseValidation__validateLibraryDatabaseIfNecessary_withError___block_invoke;
  v20[3] = &unk_1E5FB4EE8;
  v22 = &v28;
  id v7 = v6;
  id v21 = v7;
  __int16 v23 = &v24;
  [v7 databaseConnectionAllowingWrites:0 withBlock:v20];
  char v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *((unsigned __int8 *)v29 + 24);
    int v10 = *((unsigned __int8 *)v25 + 24);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v33 = v9;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = v10;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "validateLibraryDatabaseIfNecessary requiresNonSchemaUpdates=%{BOOL}u, requiresSchemaOnlyUpdates=%{BOOL}u", buf, 0xEu);
  }

  if (*((unsigned char *)v29 + 24))
  {
    __int16 v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v7 databasePath];
      *(_DWORD *)buf = 138543362;
      *(void *)v33 = v12;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "Database requires preprocessing before schema updates for library at path %{public}@", buf, 0xCu);
    }
    BOOL v13 = [(ML3DatabaseValidation *)self _performDatabasePreprocessingWithLibrary:v7 error:a4];
  }
  else
  {
    if (!*((unsigned char *)v25 + 24)) {
      goto LABEL_12;
    }
    uint64_t v14 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v7 databasePath];
      *(_DWORD *)buf = 138543362;
      *(void *)v33 = v15;
      _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_DEFAULT, "Database requires schema upgrades for library at path %{public}@", buf, 0xCu);
    }
    BOOL v13 = [(ML3DatabaseValidation *)self _performSchemaUpgradeWithLibrary:v7 error:a4];
  }
  if (!v13)
  {
    BOOL v16 = 0;
    goto LABEL_16;
  }
LABEL_12:
  if (([v7 isHomeSharingLibrary] & 1) == 0)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__ML3DatabaseValidation__validateLibraryDatabaseIfNecessary_withError___block_invoke_16;
    v18[3] = &unk_1E5FB8420;
    id v19 = v7;
    [v19 databaseConnectionAllowingWrites:1 withBlock:v18];
  }
  BOOL v16 = 1;
LABEL_16:

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

void __71__ML3DatabaseValidation__validateLibraryDatabaseIfNecessary_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 requiresNonSchemaUpdatesOnConnection:v4];
  LOBYTE(v3) = [*(id *)(a1 + 32) requiresSchemaOnlyUpdatesOnConnection:v4];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)v3;
}

void __71__ML3DatabaseValidation__validateLibraryDatabaseIfNecessary_withError___block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 validateSortMapUnicodeVersionOnConnection:v3];
  [v3 executeUpdate:@"DELETE FROM entity_revision WHERE entity_pid=0"];
}

- (BOOL)_truncateDatabaseFileForLibrary:(id)a3 withError:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 databasePath];
    int v18 = 138543362;
    id v19 = v7;
    _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "*** Truncating database files at path: %{public}@ ***", (uint8_t *)&v18, 0xCu);
  }
  char v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "Closing all local database connections...", (uint8_t *)&v18, 2u);
  }

  int v9 = [v5 connectionPool];
  [v9 closeAllConnections];
  int v10 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "Notifying other clients about database deletion...", (uint8_t *)&v18, 2u);
  }

  notify_post((const char *)[@"MLMediaLibraryWillDeleteDatabaseNotification" UTF8String]);
  sleep(2u);
  __int16 v11 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "Performing truncation...", (uint8_t *)&v18, 2u);
  }

  uint64_t v12 = [v5 databasePath];
  BOOL v13 = ML3TruncateDatabase(v12, 1);

  uint64_t v14 = os_log_create("com.apple.amp.medialibrary", "Default");
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "Truncation successful", (uint8_t *)&v18, 2u);
    }

    BOOL v16 = 0;
    if (!a4) {
      goto LABEL_18;
    }
LABEL_17:
    *a4 = v16;
    goto LABEL_18;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_ERROR, "Failed to truncate database files.", (uint8_t *)&v18, 2u);
  }

  BOOL v16 = +[ML3MediaLibraryWriter writerErrorWithCode:301 description:@"failed to truncate database files"];
  if (a4) {
    goto LABEL_17;
  }
LABEL_18:

  return v13;
}

- (void)runValidation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(ML3DatabaseValidation *)self library];
  id v4 = [(ML3DatabaseValidation *)self delegate];
  id v5 = v4;
  if (!v4)
  {
    [(ML3DatabaseValidation *)self truncateBeforeValidating];
LABEL_8:
    if (![(ML3DatabaseValidation *)self truncateBeforeValidating]) {
      goto LABEL_39;
    }
    id v23 = 0;
    BOOL v9 = [(ML3DatabaseValidation *)self _truncateDatabaseFileForLibrary:v3 withError:&v23];
    id v10 = v23;
    if (!v10 && v9) {
      goto LABEL_39;
    }
    id v8 = v10;
    v15 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v8;
      _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_ERROR, "Truncation failed with error=%{public}@", buf, 0xCu);
    }

    if (!v8)
    {
LABEL_39:
      uint64_t v12 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = [v3 databasePath];
        *(_DWORD *)buf = 138543362;
        id v25 = v13;
        _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "Starting validation at path=%{public}@", buf, 0xCu);
      }
      id v22 = 0;
      BOOL v14 = [(ML3DatabaseValidation *)self _validateLibraryDatabaseIfNecessary:v3 withError:&v22];
      id v8 = v22;
      BOOL v9 = v14;
      if (!v8) {
        goto LABEL_32;
      }
    }
    if ([v8 code] == 3 && MSVDeviceOSIsInternalInstall())
    {
      BOOL v16 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_DEFAULT, "Device is running an internal install. Asking user for permission to rebuild.", buf, 2u);
      }

      BOOL v17 = [(ML3DatabaseValidation *)self _internalUserAgreesToRebuildUnmigratableDatabase];
      int v18 = os_log_create("com.apple.amp.medialibrary", "Default");
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v17)
      {
        if (v19)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_DEFAULT, "User agrees to rebuild. Deleting database and re-attempting validation.", buf, 2u);
        }

        [v3 databaseConnectionAllowingWrites:1 withBlock:&__block_literal_global_8982];
        id v21 = 0;
        BOOL v9 = [(ML3DatabaseValidation *)self _validateLibraryDatabaseIfNecessary:v3 withError:&v21];
        id v8 = v21;
        goto LABEL_32;
      }
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_DEFAULT, "User did not want to rebuild database. Preparing for nuclear meltdown.", buf, 2u);
      }
    }
    else
    {
      int v18 = [v8 domain];
      if ([v18 isEqualToString:*MEMORY[0x1E4F281F8]]
        && [v8 code] == 513)
      {
        [(ML3DatabaseValidation *)self _logDatabasePathDirectoryAttributes];
      }
    }

LABEL_32:
    uint64_t v20 = [(ML3DatabaseValidation *)self completionHandler];
    ((void (**)(void, BOOL, id))v20)[2](v20, v9, v8);

    goto LABEL_33;
  }
  char v6 = [v4 shouldValidateDatabaseForLibrary:v3];
  if ([(ML3DatabaseValidation *)self truncateBeforeValidating] || (v6 & 1) != 0) {
    goto LABEL_8;
  }
  id v7 = os_log_create("com.apple.amp.medialibrary", "Service");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "Database already validated. Returning immediately.", buf, 2u);
  }

  id v8 = [(ML3DatabaseValidation *)self completionHandler];
  (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 1, 0);
LABEL_33:
}

uint64_t __38__ML3DatabaseValidation_runValidation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 deleteDatabase];
}

- (ML3DatabaseValidation)initWithLibrary:(id)a3 delegate:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ML3DatabaseValidation;
  uint64_t v12 = [(ML3DatabaseValidation *)&v17 init];
  BOOL v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_library, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    v13->_truncateBeforeValidating = 0;
    uint64_t v14 = [v11 copy];
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = (id)v14;
  }
  return v13;
}

@end