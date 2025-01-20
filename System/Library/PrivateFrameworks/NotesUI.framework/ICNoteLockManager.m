@interface ICNoteLockManager
- (ICAccount)account;
- (ICNote)note;
- (ICNote)updatedNote;
- (ICNoteLockManager)initWithNote:(id)a3;
- (UIWindow)window;
- (void)addLockWithCompletionHandler:(id)a3;
- (void)removeLockWithCompletionHandler:(id)a3;
- (void)setUpdatedNote:(id)a3;
- (void)setWindow:(id)a3;
- (void)toggleLockWithCompletionHandler:(id)a3;
- (void)unsafelyToggleLockWithCompletionHandler:(id)a3;
- (void)updateDivergedAttachmentsWithConfiguration:(id)a3 completion:(id)a4;
- (void)updateDivergedAttachmentsWithPassphrase:(id)a3 completion:(id)a4;
@end

@implementation ICNoteLockManager

- (ICNoteLockManager)initWithNote:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICNoteLockManager;
  v6 = [(ICNoteLockManager *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 account];
    account = v6->_account;
    v6->_account = (ICAccount *)v7;

    objc_storeStrong((id *)&v6->_note, a3);
    v9 = [(ICNoteLockManager *)v6 account];

    if (!v9) {
      objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.account) != nil)", "-[ICNoteLockManager initWithNote:]", 1, 0, @"Expected non-nil value for '%s'", "self.account");
    }
  }

  return v6;
}

- (void)toggleLockWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICNoteLockManager toggleLockWithCompletionHandler:](self, v5);
  }

  v6 = [(ICNoteLockManager *)self note];
  int v7 = [v6 isPasswordProtected];

  if (v7) {
    [(ICNoteLockManager *)self removeLockWithCompletionHandler:v4];
  }
  else {
    [(ICNoteLockManager *)self addLockWithCompletionHandler:v4];
  }
}

- (void)addLockWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICNoteLockManager addLockWithCompletionHandler:](self, v5);
  }

  v6 = [(ICNoteLockManager *)self window];

  if (!v6) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.window) != nil)", "-[ICNoteLockManager addLockWithCompletionHandler:]", 1, 0, @"Expected non-nil value for '%s'", "self.window");
  }
  int v7 = [(ICNoteLockManager *)self note];
  int v8 = [v7 isPasswordProtected];

  if (v8)
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteLockManager addLockWithCompletionHandler:](v9);
    }

    if (v4) {
      v4[2](v4, 0);
    }
  }
  else
  {
    v10 = [(ICNoteLockManager *)self note];
    uint64_t v11 = [v10 preventLockReason];

    if (v11)
    {
      v12 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[ICNoteLockManager addLockWithCompletionHandler:](self);
      }

      v13 = [(ICNoteLockManager *)self note];
      v14 = +[ICAuthenticationAlert cannotLockInfoAlertWithReason:](ICAuthenticationAlert, "cannotLockInfoAlertWithReason:", [v13 preventLockReason]);

      v15 = [(ICNoteLockManager *)self window];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke;
      v23[3] = &unk_1E5FD9320;
      v24 = v4;
      [v14 presentInWindow:v15 completionHandler:v23];
    }
    else
    {
      objc_initWeak(&location, self);
      v16 = +[ICLockedNotesModeMigrator sharedMigrator];
      v17 = [(ICNoteLockManager *)self account];
      v18 = [(ICNoteLockManager *)self window];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke_2;
      v19[3] = &unk_1E5FDDF10;
      objc_copyWeak(&v21, &location);
      v20 = v4;
      [v16 presentLockedNotesMigrationPromptIfNeededForAccount:v17 window:v18 completionHandler:v19];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (a2 && WeakRetained)
  {
    id v6 = objc_loadWeakRetained(v4);
    int v7 = [v6 account];
    int v8 = [v7 resolvedLockedNotesMode];
    id v9 = objc_loadWeakRetained(v4);
    v10 = v9;
    if (v8 == a2)
    {
      uint64_t v11 = [v9 note];
      +[ICAuthenticationPrompt promptForIntent:2 object:v11];
    }
    else
    {
      uint64_t v11 = [v9 account];
      +[ICAuthenticationPrompt promptForChangingMode:a2 account:v11];
    v14 = };

    v15 = +[ICAuthentication shared];
    id v16 = objc_loadWeakRetained(v4);
    v17 = [v16 window];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke_3;
    v19[3] = &unk_1E5FDDEE8;
    objc_copyWeak(&v22, v4);
    id v18 = v14;
    id v20 = v18;
    __int16 v23 = a2;
    id v21 = *(id *)(a1 + 32);
    [v15 authenticateWithPrompt:v18 displayWindow:v17 completionHandler:v19];

    objc_destroyWeak(&v22);
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12)
    {
      v13 = *(void (**)(void))(v12 + 16);
      v13();
    }
  }
}

void __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (a2 == 2 && WeakRetained)
  {
    uint64_t v7 = [*(id *)(a1 + 32) intent];

    if (v7 == 7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F833B0]);
      id v9 = objc_loadWeakRetained(v4);
      v10 = [v9 account];
      uint64_t v11 = [v10 accountData];
      objc_msgSend(v8, "setLockedNotesMode:", objc_msgSend(v11, "lockedNotesMode"));

      uint64_t v12 = (void *)MEMORY[0x1E4F83418];
      id v13 = objc_loadWeakRetained(v4);
      v14 = [v13 account];
      if ([v12 countOfVisiblePasswordProtectedNotesInAccount:v14]) {
        uint64_t v15 = 4;
      }
      else {
        uint64_t v15 = 3;
      }
      [v8 setContextPath:v15];

      id v16 = (void *)MEMORY[0x1E4F833A8];
      id v17 = objc_loadWeakRetained(v4);
      id v18 = [v17 account];
      [v16 addRecentPasswordMode:v8 forAccount:v18];

      v19 = +[ICLockedNotesModeMigrator sharedMigrator];
      id v20 = objc_loadWeakRetained(v4);
      id v21 = [v20 account];
      uint64_t v22 = *(__int16 *)(a1 + 56);
      id v23 = objc_loadWeakRetained(v4);
      v24 = [v23 window];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke_4;
      v29[3] = &unk_1E5FDDEC0;
      objc_copyWeak(&v31, v4);
      id v30 = *(id *)(a1 + 40);
      [v19 migrateLockedNotesInAccount:v21 toMode:v22 window:v24 completionHandler:v29];

      objc_destroyWeak(&v31);
      return;
    }
  }
  else
  {
  }
  id v25 = objc_loadWeakRetained(v4);

  if (a2 == 2 && v25)
  {
    id v28 = objc_loadWeakRetained(v4);
    [v28 unsafelyToggleLockWithCompletionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v26 = *(void *)(a1 + 40);
    if (v26)
    {
      v27 = *(void (**)(void))(v26 + 16);
      v27();
    }
  }
}

void __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 isCancelled] & 1) != 0 || !objc_msgSend(v3, "completedUnitCount"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained unsafelyToggleLockWithCompletionHandler:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = [v4 account];
    id v6 = +[ICAuthenticationAlert switchedModeInfoAlertWithAccount:v5];

    v14[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = [v8 window];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke_5;
    v11[3] = &unk_1E5FDD438;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    id v12 = *(id *)(a1 + 32);
    +[ICAuthenticationAlert presentAlertsIfNeeded:v7 window:v9 completionHandler:v11];

    objc_destroyWeak(&v13);
  }
}

void __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained unsafelyToggleLockWithCompletionHandler:*(void *)(a1 + 32)];
}

- (void)removeLockWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICNoteLockManager removeLockWithCompletionHandler:](self, v5);
  }

  id v6 = [(ICNoteLockManager *)self window];

  if (!v6) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.window) != nil)", "-[ICNoteLockManager removeLockWithCompletionHandler:]", 1, 0, @"Expected non-nil value for '%s'", "self.window");
  }
  uint64_t v7 = [(ICNoteLockManager *)self note];
  char v8 = [v7 isPasswordProtected];

  if (v8)
  {
    objc_initWeak(&location, self);
    id v9 = [(ICNoteLockManager *)self note];
    v10 = +[ICAuthenticationPrompt promptForIntent:3 object:v9];

    uint64_t v11 = +[ICAuthentication shared];
    id v12 = [(ICNoteLockManager *)self window];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __53__ICNoteLockManager_removeLockWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E5FDDF38;
    objc_copyWeak(&v16, &location);
    id v15 = v4;
    [v11 authenticateWithPrompt:v10 displayWindow:v12 completionHandler:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    id v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteLockManager removeLockWithCompletionHandler:](v13);
    }

    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __53__ICNoteLockManager_removeLockWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained unsafelyToggleLockWithCompletionHandler:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
}

- (void)unsafelyToggleLockWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"ICNoteLockManagerWillToggleLock" object:self];

  id v6 = [(ICNoteLockManager *)self note];
  [v6 persistPendingChangesRecursively];

  uint64_t v7 = [(ICNoteLockManager *)self note];
  char v8 = [v7 managedObjectContext];
  objc_msgSend(v8, "ic_saveWithLogDescription:", @"Saving before toggling lock");

  id v9 = [(ICNoteLockManager *)self note];
  if ([v9 isPasswordProtected]) {
    v10 = @"Removing Lock…";
  }
  else {
    v10 = @"Adding Lock…";
  }
  uint64_t v11 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v10 value:v10 table:0 allowSiri:1];

  objc_initWeak(&location, self);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__71;
  v22[4] = __Block_byref_object_dispose__71;
  id v23 = 0;
  id v12 = [ICLongRunningTaskController alloc];
  id v13 = [(ICNoteLockManager *)self window];
  v14 = [(ICLongRunningTaskController *)v12 initWithWindow:v13 intervalBeforeOpeningProgressDialog:1.0];

  [(ICLongRunningTaskController *)v14 setIndeterminate:1];
  [(ICLongRunningTaskController *)v14 setProgressString:v11];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__ICNoteLockManager_unsafelyToggleLockWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E5FDDF88;
  objc_copyWeak(&v21, &location);
  v20[4] = v22;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__ICNoteLockManager_unsafelyToggleLockWithCompletionHandler___block_invoke_3;
  v16[3] = &unk_1E5FDDFB0;
  objc_copyWeak(&v19, &location);
  id v18 = v22;
  id v15 = v4;
  id v17 = v15;
  [(ICLongRunningTaskController *)v14 startTask:v20 completionBlock:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);

  _Block_object_dispose(v22, 8);
  objc_destroyWeak(&location);
}

void __61__ICNoteLockManager_unsafelyToggleLockWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F83428] sharedContext];
  id v5 = [v4 workerManagedObjectContext];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__ICNoteLockManager_unsafelyToggleLockWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E5FDDF60;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  [v6 performBlockAndWait:v8];

  objc_destroyWeak(&v11);
}

void __61__ICNoteLockManager_unsafelyToggleLockWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_opt_class();
    v2 = *(void **)(a1 + 32);
    id v3 = [WeakRetained note];
    id v4 = [v3 objectID];
    id v5 = [v2 objectWithID:v4];
    id v6 = ICCheckedDynamicCast();

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F83418], "duplicateNote:isPasswordProtected:removeOriginalNote:", v6, objc_msgSend(v6, "isPasswordProtected") ^ 1, 1);
    uint64_t v8 = [v7 objectID];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

void __61__ICNoteLockManager_unsafelyToggleLockWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      objc_opt_class();
      id v3 = [WeakRetained note];
      id v4 = [v3 managedObjectContext];
      id v5 = [v4 objectWithID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      id v6 = ICCheckedDynamicCast();
      [WeakRetained setUpdatedNote:v6];
    }
    else
    {
      uint64_t v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __61__ICNoteLockManager_unsafelyToggleLockWithCompletionHandler___block_invoke_3_cold_1(WeakRetained, v7);
      }
    }
    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"ICNoteLockManagerDidToggleLock" object:WeakRetained];

    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      uint64_t v10 = [WeakRetained updatedNote];
      if (v10) {
        uint64_t v11 = 2;
      }
      else {
        uint64_t v11 = 1;
      }
      (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v11);
    }
  }
}

- (void)updateDivergedAttachmentsWithPassphrase:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ICNoteLockManager updateDivergedAttachmentsWithPassphrase:completion:](self, v8);
  }

  uint64_t v9 = [(ICNoteLockManager *)self window];

  if (!v9) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.window) != nil)", "-[ICNoteLockManager updateDivergedAttachmentsWithPassphrase:completion:]", 1, 0, @"Expected non-nil value for '%s'", "self.window");
  }
  uint64_t v10 = [(ICNoteLockManager *)self note];
  char v11 = [v10 isAuthenticated];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = *MEMORY[0x1E4F82FE0];
    v14 = [(ICNoteLockManager *)self account];
    [v12 postNotificationName:v13 object:v14];

    id v15 = [MEMORY[0x1E4F83428] sharedContext];
    id v16 = [v15 crossProcessChangeCoordinator];
    [v16 postCrossProcessNotificationName:v13];

    id v17 = objc_alloc_init(MEMORY[0x1E4F83340]);
    [v17 setDivergedPassphrase:v6];
    [v17 setUserInitiated:1];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__ICNoteLockManager_updateDivergedAttachmentsWithPassphrase_completion___block_invoke;
    v19[3] = &unk_1E5FDC8F8;
    void v19[4] = self;
    id v20 = v7;
    [(ICNoteLockManager *)self updateDivergedAttachmentsWithConfiguration:v17 completion:v19];
  }
  else
  {
    id v18 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteLockManager updateDivergedAttachmentsWithPassphrase:completion:](self);
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

uint64_t __72__ICNoteLockManager_updateDivergedAttachmentsWithPassphrase_completion___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F82FC0];
  id v4 = [*(id *)(a1 + 32) account];
  [v2 postNotificationName:v3 object:v4];

  id v5 = [MEMORY[0x1E4F83428] sharedContext];
  id v6 = [v5 crossProcessChangeCoordinator];
  [v6 postCrossProcessNotificationName:v3];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (void)updateDivergedAttachmentsWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)*MEMORY[0x1E4FB2608];
  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  uint64_t v11 = [v8 beginBackgroundTaskWithName:v10 expirationHandler:&__block_literal_global_81];

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  id v12 = [ICLongRunningTaskController alloc];
  uint64_t v13 = [(ICNoteLockManager *)self window];
  v14 = [(ICLongRunningTaskController *)v12 initWithWindow:v13 intervalBeforeOpeningProgressDialog:1.0];

  id v15 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Changing Password…" value:@"Changing Password…" table:0 allowSiri:1];
  [(ICLongRunningTaskController *)v14 setProgressString:v15];

  [(ICLongRunningTaskController *)v14 setIndeterminate:1];
  [(ICLongRunningTaskController *)v14 setShouldShowCircularProgress:1];
  id v16 = [(ICNoteLockManager *)self window];
  id v17 = [v16 rootViewController];
  id v18 = objc_msgSend(v17, "ic_topViewController");
  [(ICLongRunningTaskController *)v14 setViewControllerToPresentFrom:v18];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __75__ICNoteLockManager_updateDivergedAttachmentsWithConfiguration_completion___block_invoke_55;
  v25[3] = &unk_1E5FDD958;
  v27 = v28;
  v25[4] = self;
  id v19 = v6;
  id v26 = v19;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__ICNoteLockManager_updateDivergedAttachmentsWithConfiguration_completion___block_invoke_2;
  v21[3] = &unk_1E5FDD980;
  uint64_t v24 = v11;
  id v20 = v7;
  id v22 = v20;
  id v23 = v28;
  [(ICLongRunningTaskController *)v14 startTask:v25 completionBlock:v21];

  _Block_object_dispose(v28, 8);
}

void __75__ICNoteLockManager_updateDivergedAttachmentsWithConfiguration_completion___block_invoke()
{
  v0 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __75__ICNoteLockManager_updateDivergedAttachmentsWithConfiguration_completion___block_invoke_cold_1(v0);
  }
}

void __75__ICNoteLockManager_updateDivergedAttachmentsWithConfiguration_completion___block_invoke_55(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F83338] sharedController];
  v2 = [*(id *)(a1 + 32) note];
  uint64_t v3 = [v2 objectID];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 convergeAttachmentsInNoteWithID:v3 configuration:*(void *)(a1 + 40)];
}

uint64_t __75__ICNoteLockManager_updateDivergedAttachmentsWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (ICAccount)account
{
  return self->_account;
}

- (ICNote)note
{
  return self->_note;
}

- (ICNote)updatedNote
{
  return self->_updatedNote;
}

- (void)setUpdatedNote:(id)a3
{
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  return (UIWindow *)WeakRetained;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_updatedNote, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)toggleLockWithCompletionHandler:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 note];
  id v4 = [v3 shortLoggingDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
  int v7 = 59;
  OUTLINED_FUNCTION_2_3(&dword_1B08EB000, a2, v5, "Toggling lock for note… {note: %@}%s:%d", v6);
}

- (void)addLockWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Cannot add lock because note already has a lock — canceling", v1, 2u);
}

- (void)addLockWithCompletionHandler:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 note];
  v2 = NSStringFromNotePreventLockReason([v1 preventLockReason]);
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v3, v4, "Cannot add lock — failing {reason: %@}", v5, v6, v7, v8, 2u);
}

- (void)addLockWithCompletionHandler:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 note];
  uint64_t v4 = [v3 shortLoggingDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
  int v7 = 71;
  OUTLINED_FUNCTION_2_3(&dword_1B08EB000, a2, v5, "Adding lock to note… {note: %@}%s:%d", v6);
}

- (void)removeLockWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Cannot remove lock because note doesn't have one — canceling", v1, 2u);
}

- (void)removeLockWithCompletionHandler:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 note];
  uint64_t v4 = [v3 shortLoggingDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
  int v7 = 139;
  OUTLINED_FUNCTION_2_3(&dword_1B08EB000, a2, v5, "Removing lock from note… {note: %@}%s:%d", v6);
}

void __61__ICNoteLockManager_unsafelyToggleLockWithCompletionHandler___block_invoke_3_cold_1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 note];
  uint64_t v4 = [v3 shortLoggingDescription];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Cannot change lock for note {note: %@}", (uint8_t *)&v5, 0xCu);
}

- (void)updateDivergedAttachmentsWithPassphrase:(void *)a1 completion:.cold.1(void *a1)
{
  v1 = [a1 note];
  v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v3, v4, "Not updating passphrase for diverged attachments because note is not authenticated {note: %@}", v5, v6, v7, v8, 2u);
}

- (void)updateDivergedAttachmentsWithPassphrase:(void *)a1 completion:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 note];
  uint64_t v4 = [v3 shortLoggingDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
  int v7 = 217;
  OUTLINED_FUNCTION_2_3(&dword_1B08EB000, a2, v5, "Updating passphrase for diverged attachments in note… {note: %@}%s:%d", v6);
}

void __75__ICNoteLockManager_updateDivergedAttachmentsWithConfiguration_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Background task for attachments convergence expired", v1, 2u);
}

@end