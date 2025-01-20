@interface ICLockedNotesModeMigrator
+ (ICLockedNotesModeMigrator)sharedMigrator;
- (BOOL)account:(id)a3 hasNotesLockedWithMode:(signed __int16)a4;
- (BOOL)account:(id)a3 supportsMode:(signed __int16)a4;
- (ICLockedNotesModeMigrator)initWithWorkerContext:(id)a3;
- (NSDate)authenticatedAt;
- (NSManagedObjectContext)workerContext;
- (OS_dispatch_queue)queue;
- (id)lockedNotesInAccount:(id)a3;
- (id)unsafelyMigrateNote:(id)a3;
- (id)unsafelyMigrateNotes:(id)a3 progress:(id)a4;
- (void)authenticationStateDidAuthenticate:(id)a3;
- (void)authenticationStateDidDeauthenticate:(id)a3;
- (void)migrateLockedNotesInAccount:(id)a3 toMode:(signed __int16)a4 window:(id)a5 completionHandler:(id)a6;
- (void)migrateNote:(id)a3 completionHandler:(id)a4;
- (void)migrateNoteToV1NeoIfNeeded:(id)a3 completionHandler:(id)a4;
- (void)presentBackwardsCompatibilityAlertIfNeededForAccount:(id)a3 mode:(signed __int16)a4 window:(id)a5 confirmHandler:(id)a6 cancelHandler:(id)a7;
- (void)presentDivergedModeAlertForNote:(id)a3 mode:(signed __int16)a4 window:(id)a5 completionHandler:(id)a6;
- (void)presentLockedNotesLearnMoreViewForAccount:(id)a3 window:(id)a4;
- (void)presentLockedNotesMigrationPromptIfNeededForAccount:(id)a3 window:(id)a4 completionHandler:(id)a5;
- (void)presentLockedNotesSwitchMigrationPromptIfSupportedForAccount:(id)a3 window:(id)a4 completionHandler:(id)a5;
- (void)presentLockedNotesWelcomeMigrationPromptIfSupportedForAccount:(id)a3 window:(id)a4 completionHandler:(id)a5;
- (void)setAuthenticatedAt:(id)a3;
- (void)showMigrationPromptAndMigrateIfNeededForAccount:(id)a3 window:(id)a4;
@end

@implementation ICLockedNotesModeMigrator

- (ICLockedNotesModeMigrator)initWithWorkerContext:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICLockedNotesModeMigrator;
  v6 = [(ICLockedNotesModeMigrator *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workerContext, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.notes.locked-notes-mode-migrator", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = *MEMORY[0x1E4F830B0];
    v14 = [MEMORY[0x1E4F832F8] sharedState];
    [v12 addObserver:v7 selector:sel_authenticationStateDidAuthenticate_ name:v13 object:v14];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v16 = *MEMORY[0x1E4F830B8];
    v17 = [MEMORY[0x1E4F832F8] sharedState];
    [v15 addObserver:v7 selector:sel_authenticationStateDidDeauthenticate_ name:v16 object:v17];
  }
  return v7;
}

+ (ICLockedNotesModeMigrator)sharedMigrator
{
  if (sharedMigrator_onceToken != -1) {
    dispatch_once(&sharedMigrator_onceToken, &__block_literal_global_66);
  }
  v2 = (void *)sharedMigrator_sharedMigrator;
  return (ICLockedNotesModeMigrator *)v2;
}

void __43__ICLockedNotesModeMigrator_sharedMigrator__block_invoke()
{
  v0 = [MEMORY[0x1E4F83428] sharedContext];
  id v3 = [v0 workerManagedObjectContext];

  v1 = [[ICLockedNotesModeMigrator alloc] initWithWorkerContext:v3];
  v2 = (void *)sharedMigrator_sharedMigrator;
  sharedMigrator_sharedMigrator = (uint64_t)v1;
}

- (void)migrateLockedNotesInAccount:(id)a3 toMode:(signed __int16)a4 window:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[ICLockedNotesModeMigrator migrateLockedNotesInAccount:toMode:window:completionHandler:](v10);
  }

  if (v8)
  {
    [v10 setResolvedLockedNotesMode:v8];
    v14 = [v10 managedObjectContext];
    objc_msgSend(v14, "ic_saveWithLogDescription:", @"Saved after setting locked notes mode");

    v15 = [[ICLongRunningTaskController alloc] initWithWindow:v11 intervalBeforeOpeningProgressDialog:1.0];
    uint64_t v16 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Changing Method…" value:@"Changing Method…" table:0 allowSiri:1];
    [(ICLongRunningTaskController *)v15 setProgressString:v16];

    [(ICLongRunningTaskController *)v15 setIndeterminate:1];
    [(ICLongRunningTaskController *)v15 setShouldShowCircularProgress:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __89__ICLockedNotesModeMigrator_migrateLockedNotesInAccount_toMode_window_completionHandler___block_invoke;
    v20[3] = &unk_1E5FD9398;
    v20[4] = self;
    id v21 = v10;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __89__ICLockedNotesModeMigrator_migrateLockedNotesInAccount_toMode_window_completionHandler___block_invoke_4;
    v18[3] = &unk_1E5FD9DC8;
    id v19 = v12;
    [(ICLongRunningTaskController *)v15 startTask:v20 completionBlock:v18];
  }
  else
  {
    v17 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ICLockedNotesModeMigrator migrateLockedNotesInAccount:toMode:window:completionHandler:](v10);
    }

    v15 = (ICLongRunningTaskController *)objc_alloc_init(MEMORY[0x1E4F28F90]);
    if (v12) {
      (*((void (**)(id, ICLongRunningTaskController *))v12 + 2))(v12, v15);
    }
  }
}

void __89__ICLockedNotesModeMigrator_migrateLockedNotesInAccount_toMode_window_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__ICLockedNotesModeMigrator_migrateLockedNotesInAccount_toMode_window_completionHandler___block_invoke_2;
  block[3] = &unk_1E5FD8FE8;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v3;
  id v7 = v3;
  dispatch_sync(v4, block);
}

void __89__ICLockedNotesModeMigrator_migrateLockedNotesInAccount_toMode_window_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectID];
  id v3 = [*(id *)(a1 + 40) workerContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__ICLockedNotesModeMigrator_migrateLockedNotesInAccount_toMode_window_completionHandler___block_invoke_3;
  v6[3] = &unk_1E5FD8FE8;
  v4 = *(void **)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  [v3 performBlockAndWait:v6];
}

void __89__ICLockedNotesModeMigrator_migrateLockedNotesInAccount_toMode_window_completionHandler___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) workerContext];
  [v2 refreshAllObjects];

  id v3 = [*(id *)(a1 + 32) workerContext];
  id v7 = [v3 objectWithID:*(void *)(a1 + 40)];

  v4 = [*(id *)(a1 + 32) lockedNotesInAccount:v7];
  id v5 = (id)[*(id *)(a1 + 32) unsafelyMigrateNotes:v4 progress:*(void *)(a1 + 48)];
  uint64_t v6 = [*(id *)(a1 + 32) workerContext];
  objc_msgSend(v6, "ic_saveWithLogDescription:", @"Saved after migrating notes");
}

uint64_t __89__ICLockedNotesModeMigrator_migrateLockedNotesInAccount_toMode_window_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)migrateNote:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ICLockedNotesModeMigrator migrateNote:completionHandler:](v6);
  }

  id v9 = [(ICLockedNotesModeMigrator *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ICLockedNotesModeMigrator_migrateNote_completionHandler___block_invoke;
  block[3] = &unk_1E5FDBB10;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __59__ICLockedNotesModeMigrator_migrateNote_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectID];
  id v3 = [*(id *)(a1 + 40) workerContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__ICLockedNotesModeMigrator_migrateNote_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5FDBB10;
  v4 = *(void **)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  [v3 performBlockAndWait:v6];
}

void __59__ICLockedNotesModeMigrator_migrateNote_completionHandler___block_invoke_2(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) workerContext];
  [v2 refreshAllObjects];

  id v3 = [*(id *)(a1 + 32) workerContext];
  v4 = [v3 objectWithID:*(void *)(a1 + 40)];

  id v5 = *(void **)(a1 + 32);
  v11[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v7 = [v5 unsafelyMigrateNotes:v6 progress:0];

  id v8 = [*(id *)(a1 + 32) workerContext];
  objc_msgSend(v8, "ic_saveWithLogDescription:", @"Saved after migrating note");

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9)
  {
    id v10 = [v7 firstObject];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

- (void)migrateNoteToV1NeoIfNeeded:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ICLockedNotesModeMigrator migrateNoteToV1NeoIfNeeded:completionHandler:].cold.5(v6);
  }

  if (([v6 isPasswordProtected] & 1) == 0)
  {
    uint64_t v16 = os_log_create("com.apple.notes", "Crypto");
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    v17 = [v6 shortLoggingDescription];
    int v30 = 138412290;
    v31 = v17;
    v18 = "Not migrating note to v1 Neo because it's not password-protected {note: %@}";
LABEL_15:
    _os_log_impl(&dword_1B08EB000, v16, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v30, 0xCu);

    goto LABEL_16;
  }
  uint64_t v9 = [v6 account];
  id v10 = [v9 accountData];
  char v11 = [v10 supportsV1Neo];

  if ((v11 & 1) == 0)
  {
    uint64_t v16 = os_log_create("com.apple.notes", "Crypto");
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    v17 = [v6 shortLoggingDescription];
    int v30 = 138412290;
    v31 = v17;
    v18 = "Not migrating note to v1 Neo because its account doesn't support it {note: %@}";
    goto LABEL_15;
  }
  id v12 = [v6 account];
  id v13 = [v12 cryptoStrategy];
  v14 = [v13 v1NeoStrategy];
  char v15 = [v14 isAuthenticated];

  if ((v15 & 1) == 0)
  {
    uint64_t v16 = os_log_create("com.apple.notes", "Crypto");
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    v17 = [v6 shortLoggingDescription];
    int v30 = 138412290;
    v31 = v17;
    v18 = "Not migrating note to v1 Neo because its account isn't authenticated for v1 Neo {note: %@}";
    goto LABEL_15;
  }
  if ([MEMORY[0x1E4F83348] cipherVersionForObject:v6])
  {
    uint64_t v16 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[ICLockedNotesModeMigrator migrateNoteToV1NeoIfNeeded:completionHandler:].cold.4(v6);
    }
  }
  else
  {
    id v19 = [v6 account];
    v20 = [v19 cryptoStrategy];
    char v21 = [v20 hasSameKeyAsObject:v6];

    if (v21)
    {
      v22 = [v6 attachments];
      int v23 = objc_msgSend(v22, "ic_containsObjectPassingTest:", &__block_literal_global_41_2);

      if (!v23)
      {
        v24 = [(ICLockedNotesModeMigrator *)self authenticatedAt];
        v25 = [v6 modificationDate];
        int v26 = objc_msgSend(v24, "ic_isLaterThanDate:", v25);

        v27 = os_log_create("com.apple.notes", "Crypto");
        v28 = v27;
        if (v26)
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            -[ICLockedNotesModeMigrator migrateNoteToV1NeoIfNeeded:completionHandler:](v6);
          }

          if (v7) {
            goto LABEL_17;
          }
        }
        else
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v29 = [v6 shortLoggingDescription];
            int v30 = 138412290;
            v31 = v29;
            _os_log_impl(&dword_1B08EB000, v28, OS_LOG_TYPE_INFO, "Migrating note to v1 Neo… {note: %@}", (uint8_t *)&v30, 0xCu);
          }
          [(ICLockedNotesModeMigrator *)self migrateNote:v6 completionHandler:v7];
        }
        goto LABEL_18;
      }
      uint64_t v16 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[ICLockedNotesModeMigrator migrateNoteToV1NeoIfNeeded:completionHandler:](v6);
      }
    }
    else
    {
      uint64_t v16 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[ICLockedNotesModeMigrator migrateNoteToV1NeoIfNeeded:completionHandler:](v6);
      }
    }
  }
LABEL_16:

  if (v7) {
LABEL_17:
  }
    v7[2](v7, 0);
LABEL_18:
}

uint64_t __74__ICLockedNotesModeMigrator_migrateNoteToV1NeoIfNeeded_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAuthenticated] ^ 1;
}

- (id)unsafelyMigrateNotes:(id)a3 progress:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)*MEMORY[0x1E4FB2608];
  uint64_t v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  uint64_t v33 = [v8 beginBackgroundTaskWithName:v10 expirationHandler:&__block_literal_global_43_1];

  char v11 = [MEMORY[0x1E4F832F8] sharedState];
  [v11 beginBlockingDeauthentication];

  v35 = [MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v7, "setTotalUnitCount:", objc_msgSend(v6, "count"));
  id v12 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    *(_DWORD *)buf = 138412290;
    v41 = v13;
    _os_log_impl(&dword_1B08EB000, v12, OS_LOG_TYPE_INFO, "Migrating locked notes… {#notes: %@}", buf, 0xCu);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v37;
    id obj = v14;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v20 = [(ICLockedNotesModeMigrator *)self unsafelyMigrateNote:v19];
        objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v7, "completedUnitCount") + 1);
        if (v20)
        {
          [v35 addObject:v20];
          char v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v21 postNotificationName:@"ICLockedNotesModeMigratorDidMigrateNote" object:self];

          v22 = [MEMORY[0x1E4F83428] sharedContext];
          int v23 = [v22 crossProcessChangeCoordinator];
          [v23 postCrossProcessNotificationName:@"ICLockedNotesModeMigratorDidMigrateNote"];
        }
        v24 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = [v19 shortLoggingDescription];
          int v26 = [v20 shortLoggingDescription];
          *(_DWORD *)buf = 138412802;
          v41 = v25;
          __int16 v42 = 2112;
          v43 = v26;
          __int16 v44 = 2112;
          id v45 = v7;
          _os_log_impl(&dword_1B08EB000, v24, OS_LOG_TYPE_INFO, "Migrated note {note: %@, newNote: %@, progress: %@}", buf, 0x20u);
        }
      }
      id v14 = obj;
      uint64_t v16 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v16);
  }

  v27 = [MEMORY[0x1E4F832F8] sharedState];
  [v27 endBlockingDeauthentication];

  [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:v33];
  v28 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
    int v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v35, "count"));
    *(_DWORD *)buf = 138412546;
    v41 = v29;
    __int16 v42 = 2112;
    v43 = v30;
    _os_log_impl(&dword_1B08EB000, v28, OS_LOG_TYPE_INFO, "Migrated locked notes {#notes: %@, #migratedNotes: %@}", buf, 0x16u);
  }
  v31 = (void *)[v35 copy];

  return v31;
}

void __59__ICLockedNotesModeMigrator_unsafelyMigrateNotes_progress___block_invoke()
{
  v0 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __59__ICLockedNotesModeMigrator_unsafelyMigrateNotes_progress___block_invoke_cold_1();
  }

  v1 = [MEMORY[0x1E4F832F8] sharedState];
  [v1 endBlockingDeauthentication];
}

- (id)unsafelyMigrateNote:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ICLockedNotesModeMigrator unsafelyMigrateNote:](v3);
  }

  uint64_t v5 = [MEMORY[0x1E4F83348] cipherVersionForObject:v3];
  uint64_t v6 = [MEMORY[0x1E4F83348] userSelectedCipherVersionForObject:v3];
  if (([v3 isPasswordProtected] & 1) == 0)
  {
    id v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v3 shortLoggingDescription];
      int v18 = 138412290;
      id v19 = v8;
      uint64_t v9 = "Cannot migrate note because it's not password-protected — skipping {note: %@}";
      goto LABEL_17;
    }
LABEL_18:

    id v14 = 0;
    goto LABEL_19;
  }
  if (v6 == v5)
  {
    id v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v3 shortLoggingDescription];
      int v18 = 138412290;
      id v19 = v8;
      uint64_t v9 = "Note doesn't require migration — skipping {note: %@}";
LABEL_17:
      _os_log_impl(&dword_1B08EB000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v18, 0xCu);

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (([v3 isAuthenticated] & 1) == 0)
  {
    id v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v3 shortLoggingDescription];
      int v18 = 138412290;
      id v19 = v8;
      uint64_t v9 = "Cannot migrate note because it's not authenticated — skipping {note: %@}";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  id v10 = [v3 account];
  char v11 = [v10 isAuthenticated];

  if ((v11 & 1) == 0)
  {
    id v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v3 shortLoggingDescription];
      int v18 = 138412290;
      id v19 = v8;
      uint64_t v9 = "Cannot migrate note because its account is not authenticated — skipping {note: %@}";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  id v12 = (void *)MEMORY[0x1B3E9ED80]();
  id v13 = [MEMORY[0x1E4F83418] duplicateNote:v3 isPasswordProtected:1 removeOriginalNote:1];
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    uint64_t v17 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ICLockedNotesModeMigrator unsafelyMigrateNote:](v3);
    }
  }
LABEL_19:

  return v14;
}

- (BOOL)account:(id)a3 supportsMode:(signed __int16)a4
{
  unsigned int v4 = a4;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v4 >= 2)
  {
    if (v4 != 2) {
      goto LABEL_9;
    }
    if (![v5 canPasswordProtectNotes])
    {
      LOBYTE(v4) = 0;
      goto LABEL_9;
    }
    if ([v6 accountType] == 3)
    {
      LOBYTE(v4) = 1;
      goto LABEL_9;
    }
    char v7 = [v6 isPrimaryiCloudAccount];
  }
  else
  {
    char v7 = [v5 canPasswordProtectNotes];
  }
  LOBYTE(v4) = v7;
LABEL_9:

  return v4 & 1;
}

- (BOOL)account:(id)a3 hasNotesLockedWithMode:(signed __int16)a4
{
  id v5 = [(ICLockedNotesModeMigrator *)self lockedNotesInAccount:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__ICLockedNotesModeMigrator_account_hasNotesLockedWithMode___block_invoke;
  v7[3] = &__block_descriptor_34_e23_B32__0__ICNote_8Q16_B24l;
  signed __int16 v8 = a4;
  LOBYTE(a4) = objc_msgSend(v5, "ic_containsObjectPassingTest:", v7);

  return a4;
}

BOOL __60__ICLockedNotesModeMigrator_account_hasNotesLockedWithMode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([MEMORY[0x1E4F83348] shouldAuthenticateWithCustomPasswordForObject:v3]
    && *(_WORD *)(a1 + 32) == 1)
  {
    BOOL v4 = 1;
  }
  else if ([MEMORY[0x1E4F83348] shouldAuthenticateWithDevicePasswordForObject:v3])
  {
    BOOL v4 = *(unsigned __int16 *)(a1 + 32) == 2;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)lockedNotesInAccount:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  BOOL v4 = (void *)MEMORY[0x1E4F83328];
  id v5 = a3;
  uint64_t v6 = [v4 predicateForVisibleObjects];
  char v7 = objc_msgSend(MEMORY[0x1E4F83328], "predicateForPasswordProtectedObjects", v6);
  v17[1] = v7;
  signed __int16 v8 = (void *)MEMORY[0x1E4F83418];
  uint64_t v9 = [v5 identifier];
  id v10 = [v8 predicateForNotesInAccountWithIdentifier:v9];
  v17[2] = v10;
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  id v12 = [v3 andPredicateWithSubpredicates:v11];

  id v13 = (void *)MEMORY[0x1E4F83418];
  id v14 = [v5 managedObjectContext];

  id v15 = [v13 notesMatchingPredicate:v12 context:v14];

  return v15;
}

- (void)presentBackwardsCompatibilityAlertIfNeededForAccount:(id)a3 mode:(signed __int16)a4 window:(id)a5 confirmHandler:(id)a6 cancelHandler:(id)a7
{
  int v10 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ICLockedNotesModeMigrator presentBackwardsCompatibilityAlertIfNeededForAccount:mode:window:confirmHandler:cancelHandler:](v11);
  }

  if (v10 == 2)
  {
    uint64_t v17 = [MEMORY[0x1E4F83330] sharedController];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __123__ICLockedNotesModeMigrator_presentBackwardsCompatibilityAlertIfNeededForAccount_mode_window_confirmHandler_cancelHandler___block_invoke;
    v19[3] = &unk_1E5FDD5C8;
    id v20 = v11;
    id v22 = v13;
    id v23 = v14;
    id v21 = v12;
    [v17 messageForAccount:v20 minimumNotesVersion:9 completionHandler:v19];
  }
  else if (v10 == 1)
  {
    uint64_t v16 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[ICLockedNotesModeMigrator presentBackwardsCompatibilityAlertIfNeededForAccount:mode:window:confirmHandler:cancelHandler:]();
    }

    if (v13) {
      (*((void (**)(id, id))v13 + 2))(v13, v12);
    }
  }
  else
  {
    int v18 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ICLockedNotesModeMigrator presentBackwardsCompatibilityAlertIfNeededForAccount:mode:window:confirmHandler:cancelHandler:]();
    }

    if (v14) {
      (*((void (**)(id, id))v14 + 2))(v14, v12);
    }
  }
}

void __123__ICLockedNotesModeMigrator_presentBackwardsCompatibilityAlertIfNeededForAccount_mode_window_confirmHandler_cancelHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1[4];
  id v7 = a1[6];
  id v8 = a1[7];
  id v6 = a1[5];
  id v4 = v3;
  performBlockOnMainThread();
}

void __123__ICLockedNotesModeMigrator_presentBackwardsCompatibilityAlertIfNeededForAccount_mode_window_confirmHandler_cancelHandler___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  id v3 = os_log_create("com.apple.notes", "Crypto");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4) {
      __123__ICLockedNotesModeMigrator_presentBackwardsCompatibilityAlertIfNeededForAccount_mode_window_confirmHandler_cancelHandler___block_invoke_2_cold_2();
    }

    id v5 = +[ICAuthenticationAlert devicePasswordIncompatibleConfirmationAlertWithAccount:a1[5] incompatibilityMessage:a1[4]];
    [v5 setActionHandler:a1[7]];
    [v5 setDismissHandler:a1[8]];
    [v5 presentInWindow:a1[6] completionHandler:0];
  }
  else
  {
    if (v4) {
      __123__ICLockedNotesModeMigrator_presentBackwardsCompatibilityAlertIfNeededForAccount_mode_window_confirmHandler_cancelHandler___block_invoke_2_cold_1();
    }

    uint64_t v6 = a1[7];
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, a1[6]);
    }
  }
}

- (void)presentDivergedModeAlertForNote:(id)a3 mode:(signed __int16)a4 window:(id)a5 completionHandler:(id)a6
{
  int v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(void))a6;
  id v12 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ICLockedNotesModeMigrator presentDivergedModeAlertForNote:mode:window:completionHandler:](v9);
  }

  if (v8 == 2)
  {
    uint64_t v16 = [MEMORY[0x1E4F83330] sharedController];
    uint64_t v17 = [v9 account];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __91__ICLockedNotesModeMigrator_presentDivergedModeAlertForNote_mode_window_completionHandler___block_invoke;
    v19[3] = &unk_1E5FD9D50;
    id v20 = v9;
    id v21 = v10;
    id v22 = v11;
    [v16 messageForAccount:v17 minimumNotesVersion:9 completionHandler:v19];
  }
  else if (v8 == 1)
  {
    id v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[ICLockedNotesModeMigrator presentDivergedModeAlertForNote:mode:window:completionHandler:]();
    }

    id v14 = [v9 account];
    id v15 = +[ICAuthenticationAlert updateDivergedDevicePasswordModeActionAlertWithAccount:v14];

    [v15 presentInWindow:v10 completionHandler:v11];
  }
  else
  {
    int v18 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ICLockedNotesModeMigrator presentDivergedModeAlertForNote:mode:window:completionHandler:]();
    }

    if (v11) {
      v11[2](v11);
    }
  }
}

void __91__ICLockedNotesModeMigrator_presentDivergedModeAlertForNote_mode_window_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1[4];
  id v6 = a1[5];
  id v7 = a1[6];
  id v4 = v3;
  performBlockOnMainThread();
}

void __91__ICLockedNotesModeMigrator_presentDivergedModeAlertForNote_mode_window_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __91__ICLockedNotesModeMigrator_presentDivergedModeAlertForNote_mode_window_completionHandler___block_invoke_2_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) account];
  id v4 = +[ICAuthenticationAlert updateDivergedCustomPasswordModeActionAlertWithAccount:v3 incompatibilityMessage:*(void *)(a1 + 40)];

  [v4 presentInWindow:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)presentLockedNotesWelcomeMigrationPromptIfSupportedForAccount:(id)a3 window:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  id v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ICLockedNotesModeMigrator presentLockedNotesWelcomeMigrationPromptIfSupportedForAccount:window:completionHandler:](v8);
  }

  if ([(ICLockedNotesModeMigrator *)self account:v8 supportsMode:2])
  {
    [NSClassFromString(&cfstr_Iclockednotesw.isa) presentForAccount:v8 skipsAlerts:1 window:v9 completion:v10];
  }
  else
  {
    id v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ICLockedNotesModeMigrator presentLockedNotesWelcomeMigrationPromptIfSupportedForAccount:window:completionHandler:]();
    }

    if (v10) {
      v10[2](v10, [v8 resolvedLockedNotesMode]);
    }
  }
}

- (void)presentLockedNotesSwitchMigrationPromptIfSupportedForAccount:(id)a3 window:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  id v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ICLockedNotesModeMigrator presentLockedNotesSwitchMigrationPromptIfSupportedForAccount:window:completionHandler:](v8);
  }

  if ([(ICLockedNotesModeMigrator *)self account:v8 supportsMode:2])
  {
    [NSClassFromString(&cfstr_Iclockednotess.isa) presentForAccount:v8 skipsAlerts:1 window:v9 completion:v10];
  }
  else
  {
    id v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ICLockedNotesModeMigrator presentLockedNotesSwitchMigrationPromptIfSupportedForAccount:window:completionHandler:]();
    }

    if (v10) {
      v10[2](v10, [v8 resolvedLockedNotesMode]);
    }
  }
}

- (void)presentLockedNotesMigrationPromptIfNeededForAccount:(id)a3 window:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ICLockedNotesModeMigrator presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:].cold.6(v8);
  }

  if (![(ICLockedNotesModeMigrator *)self account:v8 supportsMode:2])
  {
    id v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[ICLockedNotesModeMigrator presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:].cold.5();
    }
    goto LABEL_9;
  }
  id v12 = [v8 accountData];
  int v13 = [v12 lockedNotesMode];

  if (!v13)
  {
    if ([MEMORY[0x1E4F83418] countOfVisiblePasswordProtectedNotesInAccount:v8]
      || [v8 hasPassphraseSet])
    {
      if (!+[ICAuthenticationAlert shouldPresentSwitchToDevicePasswordPromptForAccount:v8])
      {
        id v14 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[ICLockedNotesModeMigrator presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:]();
        }
        goto LABEL_9;
      }
      +[ICAuthenticationAlert markSwitchToDevicePasswordPromptPresentedForAccount:v8];
      id v15 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[ICLockedNotesModeMigrator presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:]();
      }

      Class v16 = NSClassFromString(&cfstr_Iclockednotess.isa);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __106__ICLockedNotesModeMigrator_presentLockedNotesMigrationPromptIfNeededForAccount_window_completionHandler___block_invoke;
      v22[3] = &unk_1E5FDD5F0;
      id v23 = v10;
      [(objc_class *)v16 presentForAccount:v8 skipsAlerts:0 window:v9 completion:v22];
      uint64_t v17 = v23;
    }
    else
    {
      int v18 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[ICLockedNotesModeMigrator presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:]();
      }

      Class v19 = NSClassFromString(&cfstr_Iclockednotesw.isa);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __106__ICLockedNotesModeMigrator_presentLockedNotesMigrationPromptIfNeededForAccount_window_completionHandler___block_invoke_60;
      v20[3] = &unk_1E5FDD5F0;
      id v21 = v10;
      [(objc_class *)v19 presentForAccount:v8 skipsAlerts:0 window:v9 completion:v20];
      uint64_t v17 = v21;
    }

    goto LABEL_11;
  }
  id v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ICLockedNotesModeMigrator presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:].cold.4();
  }
LABEL_9:

  if (v10) {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, [v8 resolvedLockedNotesMode]);
  }
LABEL_11:
}

uint64_t __106__ICLockedNotesModeMigrator_presentLockedNotesMigrationPromptIfNeededForAccount_window_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __106__ICLockedNotesModeMigrator_presentLockedNotesMigrationPromptIfNeededForAccount_window_completionHandler___block_invoke_60(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)showMigrationPromptAndMigrateIfNeededForAccount:(id)a3 window:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__ICLockedNotesModeMigrator_showMigrationPromptAndMigrateIfNeededForAccount_window___block_invoke;
  v10[3] = &unk_1E5FDD640;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(ICLockedNotesModeMigrator *)self presentLockedNotesMigrationPromptIfNeededForAccount:v8 window:v9 completionHandler:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __84__ICLockedNotesModeMigrator_showMigrationPromptAndMigrateIfNeededForAccount_window___block_invoke(id *a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (a2 == 2 && WeakRetained)
  {
    id v10 = WeakRetained;
    id v5 = [a1[4] accountData];
    int v6 = [v5 lockedNotesMode];

    if (!v6)
    {
      id v7 = +[ICAuthenticationPrompt promptForChangingMode:2 account:a1[4]];
      id v8 = +[ICAuthentication shared];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __84__ICLockedNotesModeMigrator_showMigrationPromptAndMigrateIfNeededForAccount_window___block_invoke_2;
      v11[3] = &unk_1E5FDD618;
      id v9 = a1[5];
      id v12 = a1[4];
      __int16 v14 = 2;
      id v13 = a1[5];
      [v8 authenticateWithPrompt:v7 displayWindow:v9 completionHandler:v11];
    }
  }
  else
  {
  }
}

void __84__ICLockedNotesModeMigrator_showMigrationPromptAndMigrateIfNeededForAccount_window___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    uint64_t v12 = v2;
    uint64_t v13 = v3;
    id v5 = +[ICLockedNotesModeMigrator sharedMigrator];
    uint64_t v6 = *(__int16 *)(a1 + 48);
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__ICLockedNotesModeMigrator_showMigrationPromptAndMigrateIfNeededForAccount_window___block_invoke_3;
    v9[3] = &unk_1E5FD9398;
    id v10 = v7;
    id v11 = *(id *)(a1 + 40);
    [v5 migrateLockedNotesInAccount:v10 toMode:v6 window:v8 completionHandler:v9];
  }
}

void __84__ICLockedNotesModeMigrator_showMigrationPromptAndMigrateIfNeededForAccount_window___block_invoke_3(uint64_t a1)
{
  id v2 = +[ICAuthenticationAlert switchedModeInfoAlertWithAccount:*(void *)(a1 + 32)];
  [v2 presentInWindow:*(void *)(a1 + 40) completionHandler:0];
}

- (void)presentLockedNotesLearnMoreViewForAccount:(id)a3 window:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ICLockedNotesModeMigrator presentLockedNotesLearnMoreViewForAccount:window:]();
  }

  [NSClassFromString(&cfstr_Iclockednotesl.isa) presentForAccount:v6 window:v5];
}

- (void)authenticationStateDidAuthenticate:(id)a3
{
  id v4 = [(ICLockedNotesModeMigrator *)self authenticatedAt];

  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] now];
    [(ICLockedNotesModeMigrator *)self setAuthenticatedAt:v5];
  }
}

- (void)authenticationStateDidDeauthenticate:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F832F8], "sharedState", a3);
  char v5 = [v4 isAuthenticated];

  if ((v5 & 1) == 0)
  {
    [(ICLockedNotesModeMigrator *)self setAuthenticatedAt:0];
  }
}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSDate)authenticatedAt
{
  return self->_authenticatedAt;
}

- (void)setAuthenticatedAt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatedAt, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workerContext, 0);
}

- (void)migrateLockedNotesInAccount:(void *)a1 toMode:window:completionHandler:.cold.1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1B08EB000, v2, v3, "Cannot migrate locked notes to unknown mode {account: %@}", v4, v5, v6, v7, v8);
}

- (void)migrateLockedNotesInAccount:(void *)a1 toMode:window:completionHandler:.cold.2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  uint64_t v2 = NSStringFromAccountDataLockedNotesMode();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7(&dword_1B08EB000, v3, v4, "Migrating locked notes… {account: %@, mode: %@}%s:%d", v5, v6, v7, v8, v9);
}

- (void)migrateNote:(void *)a1 completionHandler:.cold.1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1B08EB000, v2, v3, "Migrating locked note if needed… {note: %@}%s:%d", v4, v5, v6, v7, v8);
}

- (void)migrateNoteToV1NeoIfNeeded:(void *)a1 completionHandler:.cold.1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Not migrating note to v1 Neo because it has an unauthenticated attachment {note: %@}", v4, v5, v6, v7, v8);
}

- (void)migrateNoteToV1NeoIfNeeded:(void *)a1 completionHandler:.cold.2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Not migrating note to v1 Neo because it wasn't modified during the current authentication session {note: %@}", v4, v5, v6, v7, v8);
}

- (void)migrateNoteToV1NeoIfNeeded:(void *)a1 completionHandler:.cold.3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Not migrating note to v1 Neo because its password is different from the account {note: %@}", v4, v5, v6, v7, v8);
}

- (void)migrateNoteToV1NeoIfNeeded:(void *)a1 completionHandler:.cold.4(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Not migrating note to v1 Neo because it's not a v1 note {note: %@}", v4, v5, v6, v7, v8);
}

- (void)migrateNoteToV1NeoIfNeeded:(void *)a1 completionHandler:.cold.5(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1B08EB000, v2, v3, "Migrating locked note to v1 Neo if needed… {note: %@}%s:%d", v4, v5, v6, v7, v8);
}

void __59__ICLockedNotesModeMigrator_unsafelyMigrateNotes_progress___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B08EB000, v0, v1, "Background task for locked notes migration expired", v2, v3, v4, v5, v6);
}

- (void)unsafelyMigrateNote:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1B08EB000, v2, v3, "Failed to migrate note — skipping {note: %@}", v4, v5, v6, v7, v8);
}

- (void)unsafelyMigrateNote:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1B08EB000, v2, v3, "Migrating note… {note: %@}%s:%d", v4, v5, v6, v7, v8);
}

- (void)presentBackwardsCompatibilityAlertIfNeededForAccount:mode:window:confirmHandler:cancelHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B08EB000, v0, v1, "Not showing backwards compatibility alert for unknown password mode", v2, v3, v4, v5, v6);
}

- (void)presentBackwardsCompatibilityAlertIfNeededForAccount:mode:window:confirmHandler:cancelHandler:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Not showing backwards compatibility for custom password mode", v2, v3, v4, v5, v6);
}

- (void)presentBackwardsCompatibilityAlertIfNeededForAccount:(void *)a1 mode:window:confirmHandler:cancelHandler:.cold.3(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  uint64_t v2 = NSStringFromAccountDataLockedNotesMode();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7(&dword_1B08EB000, v3, v4, "Presenting locked notes account backwards compatibility alert if needed… {account: %@, mode: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __123__ICLockedNotesModeMigrator_presentBackwardsCompatibilityAlertIfNeededForAccount_mode_window_confirmHandler_cancelHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Not showing backwards compatibility alert for device password mode", v2, v3, v4, v5, v6);
}

void __123__ICLockedNotesModeMigrator_presentBackwardsCompatibilityAlertIfNeededForAccount_mode_window_confirmHandler_cancelHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Showing backwards compatibility alert for device password mode…", v2, v3, v4, v5, v6);
}

- (void)presentDivergedModeAlertForNote:mode:window:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B08EB000, v0, v1, "Not showing diverged mode alert for unknown password mode", v2, v3, v4, v5, v6);
}

- (void)presentDivergedModeAlertForNote:mode:window:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Showing diverged mode alert for custom password mode…", v2, v3, v4, v5, v6);
}

- (void)presentDivergedModeAlertForNote:(void *)a1 mode:window:completionHandler:.cold.3(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  uint64_t v2 = NSStringFromAccountDataLockedNotesMode();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7(&dword_1B08EB000, v3, v4, "Presenting locked notes note diverged mode alert… {note: %@, mode: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __91__ICLockedNotesModeMigrator_presentDivergedModeAlertForNote_mode_window_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Showing diverged mode alert for device password mode…", v2, v3, v4, v5, v6);
}

- (void)presentLockedNotesWelcomeMigrationPromptIfSupportedForAccount:window:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Not presenting locked notes welcome migration prompt because account is unsupported", v2, v3, v4, v5, v6);
}

- (void)presentLockedNotesWelcomeMigrationPromptIfSupportedForAccount:(void *)a1 window:completionHandler:.cold.2(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1B08EB000, v2, v3, "Presenting locked notes welcome migration prompt… {account: %@}%s:%d", v4, v5, v6, v7, v8);
}

- (void)presentLockedNotesSwitchMigrationPromptIfSupportedForAccount:window:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Not presenting locked notes switch migration prompt because account is unsupported", v2, v3, v4, v5, v6);
}

- (void)presentLockedNotesSwitchMigrationPromptIfSupportedForAccount:(void *)a1 window:completionHandler:.cold.2(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1B08EB000, v2, v3, "Presenting locked notes switch migration prompt… {account: %@}%s:%d", v4, v5, v6, v7, v8);
}

- (void)presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Presenting locked notes switch migration prompt…", v2, v3, v4, v5, v6);
}

- (void)presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Not presenting locked notes migration prompt because it has been presented the maximum number of times", v2, v3, v4, v5, v6);
}

- (void)presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Presenting locked notes welcome migration prompt…", v2, v3, v4, v5, v6);
}

- (void)presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:.cold.4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Not presenting locked notes migration prompt because account has a locked notes mode", v2, v3, v4, v5, v6);
}

- (void)presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:.cold.5()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Not presenting locked notes migration prompt because account is unsupported", v2, v3, v4, v5, v6);
}

- (void)presentLockedNotesMigrationPromptIfNeededForAccount:(void *)a1 window:completionHandler:.cold.6(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1B08EB000, v2, v3, "Presenting locked notes migration prompt if needed… {account: %@}%s:%d", v4, v5, v6, v7, v8);
}

- (void)presentLockedNotesLearnMoreViewForAccount:window:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Presenting locked notes learn more view…", v2, v3, v4, v5, v6);
}

@end