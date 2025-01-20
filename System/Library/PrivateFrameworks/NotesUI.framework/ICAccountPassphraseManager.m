@interface ICAccountPassphraseManager
- (BOOL)removePassphrase;
- (BOOL)setPassphrase:(id)a3 hint:(id)a4;
- (BOOL)setPassphrase:(id)a3 hint:(id)a4 isReset:(BOOL)a5;
- (ICAccount)account;
- (ICAccountPassphraseManager)initWithAccount:(id)a3;
- (UIWindow)window;
- (void)applicationDidEnterBackground:(id)a3;
- (void)changePassphrase:(id)a3 toPassphrase:(id)a4 hint:(id)a5 completion:(id)a6;
- (void)removePassphrase;
- (void)setWindow:(id)a3;
- (void)updateDivergedNotesFromPassphrase:(id)a3 toAccountPassphrase:(id)a4 completion:(id)a5;
- (void)updateDivergedNotesWithConfiguration:(id)a3 completion:(id)a4;
@end

@implementation ICAccountPassphraseManager

- (ICAccountPassphraseManager)initWithAccount:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICAccountPassphraseManager;
  v6 = [(ICAccountPassphraseManager *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];
  }
  return v7;
}

- (BOOL)setPassphrase:(id)a3 hint:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ICAccountPassphraseManager setPassphrase:hint:](self, v6, v8);
  }

  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v10 = *MEMORY[0x1E4F82FE0];
  v11 = [(ICAccountPassphraseManager *)self account];
  [v9 postNotificationName:v10 object:v11];

  v12 = [MEMORY[0x1E4F83428] sharedContext];
  v13 = [v12 crossProcessChangeCoordinator];
  [v13 postCrossProcessNotificationName:v10];

  LOBYTE(v12) = [(ICAccountPassphraseManager *)self setPassphrase:v7 hint:v6 isReset:1];
  v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v15 = *MEMORY[0x1E4F82FC0];
  v16 = [(ICAccountPassphraseManager *)self account];
  [v14 postNotificationName:v15 object:v16];

  v17 = [MEMORY[0x1E4F83428] sharedContext];
  v18 = [v17 crossProcessChangeCoordinator];
  [v18 postCrossProcessNotificationName:v15];

  return (char)v12;
}

- (BOOL)setPassphrase:(id)a3 hint:(id)a4 isReset:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(ICAccountPassphraseManager *)self account];
  v11 = [v10 cryptoStrategy];
  char v12 = [v11 hasPassphraseSet];

  v13 = [MEMORY[0x1E4F83338] sharedController];
  [v13 cancelAndWaitWithReason:@"Setting passphrase"];

  v14 = [(ICAccountPassphraseManager *)self account];
  LODWORD(v11) = [v14 isPassphraseCorrect:v8];

  if (v11)
  {
    uint64_t v15 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[ICAccountPassphraseManager setPassphrase:hint:isReset:](self);
    }
    char v16 = 1;
LABEL_13:
    v22 = v15;
    goto LABEL_18;
  }
  v17 = [(ICAccountPassphraseManager *)self account];
  v18 = [v17 cryptoStrategy];
  char v19 = [v18 setPassphrase:v8 hint:v9];

  if ((v19 & 1) == 0)
  {
    uint64_t v15 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ICAccountPassphraseManager setPassphrase:hint:isReset:].cold.4(self, v15);
    }
    char v16 = 0;
    goto LABEL_13;
  }
  v20 = os_log_create("com.apple.notes", "Analytics");
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v21) {
      -[ICAccountPassphraseManager setPassphrase:hint:isReset:](self, v5, v20);
    }

    [MEMORY[0x1E4F833A8] incrementRecentPasswordChangeCountAsReset:v5];
  }
  else
  {
    if (v21) {
      -[ICAccountPassphraseManager setPassphrase:hint:isReset:](self);
    }
  }
  v23 = [MEMORY[0x1E4F83478] sharedController];
  v24 = [(ICAccountPassphraseManager *)self account];
  [v23 enrollInReaskForAccount:v24];

  v22 = [(ICAccountPassphraseManager *)self account];
  uint64_t v15 = [v22 managedObjectContext];
  char v16 = [v15 ic_saveWithLogDescription:@"Set account passphrase"];
LABEL_18:

  return v16;
}

- (void)changePassphrase:(id)a3 toPassphrase:(id)a4 hint:(id)a5 completion:(id)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v48 = a5;
  id v12 = a6;
  v13 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v44 = [(ICAccountPassphraseManager *)self account];
    v45 = [v44 shortLoggingDescription];
    v46 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "length") != 0);
    v47 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v48, "length") != 0);
    *(_DWORD *)location = 138413314;
    *(void *)&location[4] = v45;
    __int16 v53 = 2112;
    v54 = v46;
    __int16 v55 = 2112;
    __int16 v57 = 2080;
    v56 = v47;
    v58 = "-[ICAccountPassphraseManager changePassphrase:toPassphrase:hint:completion:]";
    __int16 v59 = 1024;
    int v60 = 104;
    _os_log_debug_impl(&dword_1B08EB000, v13, OS_LOG_TYPE_DEBUG, "Changing passphrase for account… {account: %@, hasDivergedKey: %@, hasHint: %@}%s:%d", location, 0x30u);
  }
  v14 = [(ICAccountPassphraseManager *)self window];
  BOOL v15 = v14 == 0;

  if (v15) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.window) != nil)", "-[ICAccountPassphraseManager changePassphrase:toPassphrase:hint:completion:]", 1, 0, @"Expected non-nil value for '%s'", "self.window");
  }
  if (v10
    && ([(ICAccountPassphraseManager *)self account],
        char v16 = objc_claimAutoreleasedReturnValue(),
        [v16 cryptoStrategy],
        v17 = objc_claimAutoreleasedReturnValue(),
        char v18 = [v17 authenticateWithPassphrase:v10],
        v17,
        v16,
        (v18 & 1) == 0))
  {
    v38 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      -[ICAccountPassphraseManager changePassphrase:toPassphrase:hint:completion:](self);
    }

    if (v12) {
      goto LABEL_13;
    }
  }
  else
  {
    char v19 = [(ICAccountPassphraseManager *)self account];
    char v20 = [v19 isAuthenticated];

    if (v20)
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4F83340]);
      [v21 setPassphrase:v11];
      [v21 setDivergedPassphrase:v10];
      v22 = [MEMORY[0x1E4F832F8] sharedState];
      v23 = [(ICAccountPassphraseManager *)self account];
      v24 = [v23 identifier];
      v25 = [v22 cachedMainKeyForIdentifier:v24];
      [v21 setDivergedV1MainKey:v25];

      v26 = [MEMORY[0x1E4F832F8] sharedState];
      v27 = [(ICAccountPassphraseManager *)self account];
      v28 = [v27 accountDataCreateIfNecessary];
      v29 = [v28 identifier];
      v30 = [v26 cachedMainKeyForIdentifier:v29];
      [v21 setDivergedV1NeoMainKey:v30];

      [v21 setIncludeAllAuthenticatedObjects:1];
      [v21 setUserInitiated:1];
      v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v32 = [(ICAccountPassphraseManager *)self account];
      uint64_t v33 = *MEMORY[0x1E4F82FE0];
      [v31 postNotificationName:*MEMORY[0x1E4F82FE0] object:v32];

      v34 = [MEMORY[0x1E4F83428] sharedContext];
      v35 = [v34 crossProcessChangeCoordinator];
      [v35 postCrossProcessNotificationName:v33];

      if ([(ICAccountPassphraseManager *)self setPassphrase:v11 hint:v48 isReset:0])
      {
        v36 = [(ICAccountPassphraseManager *)self account];
        objc_initWeak((id *)location, v36);

        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __76__ICAccountPassphraseManager_changePassphrase_toPassphrase_hint_completion___block_invoke;
        v49[3] = &unk_1E5FDD930;
        objc_copyWeak(&v51, (id *)location);
        id v50 = v12;
        [(ICAccountPassphraseManager *)self updateDivergedNotesWithConfiguration:v21 completion:v49];

        objc_destroyWeak(&v51);
        objc_destroyWeak((id *)location);
      }
      else
      {
        v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v40 = [(ICAccountPassphraseManager *)self account];
        uint64_t v41 = *MEMORY[0x1E4F82FC0];
        [v39 postNotificationName:*MEMORY[0x1E4F82FC0] object:v40];

        v42 = [MEMORY[0x1E4F83428] sharedContext];
        v43 = [v42 crossProcessChangeCoordinator];
        [v43 postCrossProcessNotificationName:v41];

        if (v12) {
          (*((void (**)(id, void))v12 + 2))(v12, 0);
        }
      }

      goto LABEL_21;
    }
    v37 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      -[ICAccountPassphraseManager changePassphrase:toPassphrase:hint:completion:](self);
    }

    if (v12) {
LABEL_13:
    }
      (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
LABEL_21:
}

uint64_t __76__ICAccountPassphraseManager_changePassphrase_toPassphrase_hint_completion___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F82FC0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v2 postNotificationName:v3 object:WeakRetained];

  BOOL v5 = [MEMORY[0x1E4F83428] sharedContext];
  id v6 = [v5 crossProcessChangeCoordinator];
  [v6 postCrossProcessNotificationName:v3];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (BOOL)removePassphrase
{
  uint64_t v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[ICAccountPassphraseManager removePassphrase](self);
  }

  v4 = [MEMORY[0x1E4F83338] sharedController];
  [v4 cancelAndWaitWithReason:@"Removing passphrase"];

  BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4F82FE0];
  id v7 = [(ICAccountPassphraseManager *)self account];
  [v5 postNotificationName:v6 object:v7];

  id v8 = [MEMORY[0x1E4F83428] sharedContext];
  id v9 = [v8 crossProcessChangeCoordinator];
  [v9 postCrossProcessNotificationName:v6];

  id v10 = [(ICAccountPassphraseManager *)self account];
  id v11 = [v10 cryptoStrategy];
  [v11 removePassphrase];

  id v12 = [(ICAccountPassphraseManager *)self account];
  v13 = [v12 managedObjectContext];
  LOBYTE(v10) = objc_msgSend(v13, "ic_saveWithLogDescription:", @"Removed account passphrase");

  v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v15 = *MEMORY[0x1E4F82FC0];
  char v16 = [(ICAccountPassphraseManager *)self account];
  [v14 postNotificationName:v15 object:v16];

  v17 = [MEMORY[0x1E4F83428] sharedContext];
  char v18 = [v17 crossProcessChangeCoordinator];
  [v18 postCrossProcessNotificationName:v15];

  return (char)v10;
}

- (void)updateDivergedNotesFromPassphrase:(id)a3 toAccountPassphrase:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ICAccountPassphraseManager updateDivergedNotesFromPassphrase:toAccountPassphrase:completion:](self);
  }

  id v12 = [(ICAccountPassphraseManager *)self window];

  if (!v12) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.window) != nil)", "-[ICAccountPassphraseManager updateDivergedNotesFromPassphrase:toAccountPassphrase:completion:]", 1, 0, @"Expected non-nil value for '%s'", "self.window");
  }
  v13 = [(ICAccountPassphraseManager *)self account];
  v14 = [v13 cryptoStrategy];
  char v15 = [v14 authenticateWithPassphrase:v9];

  if (v15)
  {
    char v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v17 = *MEMORY[0x1E4F82FE0];
    char v18 = [(ICAccountPassphraseManager *)self account];
    [v16 postNotificationName:v17 object:v18];

    char v19 = [MEMORY[0x1E4F83428] sharedContext];
    char v20 = [v19 crossProcessChangeCoordinator];
    [v20 postCrossProcessNotificationName:v17];

    id v21 = objc_alloc_init(MEMORY[0x1E4F83340]);
    [v21 setPassphrase:v9];
    [v21 setDivergedPassphrase:v8];
    [v21 setIncludeAllAuthenticatedObjects:1];
    [v21 setUserInitiated:1];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __95__ICAccountPassphraseManager_updateDivergedNotesFromPassphrase_toAccountPassphrase_completion___block_invoke;
    v23[3] = &unk_1E5FDC8F8;
    v23[4] = self;
    id v24 = v10;
    [(ICAccountPassphraseManager *)self updateDivergedNotesWithConfiguration:v21 completion:v23];
  }
  else
  {
    v22 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[ICAccountPassphraseManager updateDivergedNotesFromPassphrase:toAccountPassphrase:completion:](self);
    }

    if (v10) {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

uint64_t __95__ICAccountPassphraseManager_updateDivergedNotesFromPassphrase_toAccountPassphrase_completion___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F82FC0];
  v4 = [*(id *)(a1 + 32) account];
  [v2 postNotificationName:v3 object:v4];

  BOOL v5 = [MEMORY[0x1E4F83428] sharedContext];
  uint64_t v6 = [v5 crossProcessChangeCoordinator];
  [v6 postCrossProcessNotificationName:v3];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (void)updateDivergedNotesWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)*MEMORY[0x1E4FB2608];
  id v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  uint64_t v11 = [v8 beginBackgroundTaskWithName:v10 expirationHandler:&__block_literal_global_71];

  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  id v12 = [(ICAccountPassphraseManager *)self account];
  v13 = [v12 objectID];

  v14 = [ICLongRunningTaskController alloc];
  char v15 = [(ICAccountPassphraseManager *)self window];
  char v16 = [(ICLongRunningTaskController *)v14 initWithWindow:v15 intervalBeforeOpeningProgressDialog:1.0];

  uint64_t v17 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Changing Password…" value:@"Changing Password…" table:0 allowSiri:1];
  [(ICLongRunningTaskController *)v16 setProgressString:v17];

  [(ICLongRunningTaskController *)v16 setIndeterminate:1];
  [(ICLongRunningTaskController *)v16 setShouldShowCircularProgress:1];
  char v18 = [(ICAccountPassphraseManager *)self window];
  char v19 = [v18 rootViewController];
  char v20 = objc_msgSend(v19, "ic_topViewController");
  [(ICLongRunningTaskController *)v16 setViewControllerToPresentFrom:v20];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __78__ICAccountPassphraseManager_updateDivergedNotesWithConfiguration_completion___block_invoke_44;
  v28[3] = &unk_1E5FDD958;
  v31 = v32;
  id v21 = v13;
  id v29 = v21;
  id v22 = v6;
  id v30 = v22;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __78__ICAccountPassphraseManager_updateDivergedNotesWithConfiguration_completion___block_invoke_2;
  v24[3] = &unk_1E5FDD980;
  uint64_t v27 = v11;
  id v23 = v7;
  id v25 = v23;
  v26 = v32;
  [(ICLongRunningTaskController *)v16 startTask:v28 completionBlock:v24];

  _Block_object_dispose(v32, 8);
}

void __78__ICAccountPassphraseManager_updateDivergedNotesWithConfiguration_completion___block_invoke()
{
  v0 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __78__ICAccountPassphraseManager_updateDivergedNotesWithConfiguration_completion___block_invoke_cold_1(v0);
  }
}

void __78__ICAccountPassphraseManager_updateDivergedNotesWithConfiguration_completion___block_invoke_44(void *a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F83338];
  id v4 = a2;
  id v5 = [v3 sharedController];
  LOBYTE(v3) = [v5 convergeNotesInAccountWithID:a1[4] configuration:a1[5] progress:v4];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)v3;
}

uint64_t __78__ICAccountPassphraseManager_updateDivergedNotesWithConfiguration_completion___block_invoke_2(uint64_t a1)
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

- (void)applicationDidEnterBackground:(id)a3
{
  uint64_t v3 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v3, &__block_literal_global_47);
}

void __60__ICAccountPassphraseManager_applicationDidEnterBackground___block_invoke()
{
  id v0 = [MEMORY[0x1E4F83338] sharedController];
  [v0 cancelAndWaitWithReason:@"Application entered background"];
}

- (ICAccount)account
{
  return self->_account;
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
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)setPassphrase:(NSObject *)a3 hint:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 account];
  id v6 = [v5 shortLoggingDescription];
  id v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a2, "length") != 0);
  int v8 = 138413058;
  id v9 = v6;
  __int16 v10 = 2112;
  __int16 v12 = 2080;
  uint64_t v11 = v7;
  v13 = "-[ICAccountPassphraseManager setPassphrase:hint:]";
  __int16 v14 = 1024;
  int v15 = 45;
  _os_log_debug_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_DEBUG, "Setting passphrase for account… {account: %@, hasHint: %@}%s:%d", (uint8_t *)&v8, 0x26u);
}

- (void)setPassphrase:(void *)a1 hint:isReset:.cold.1(void *a1)
{
  v1 = [a1 account];
  v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v3, v4, "Not setting passphrase because it is the same as the current passphrase {account: %@}", v5, v6, v7, v8, v9);
}

- (void)setPassphrase:(void *)a1 hint:(char)a2 isReset:(NSObject *)a3 .cold.2(void *a1, char a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 account];
  uint64_t v6 = [v5 shortLoggingDescription];
  uint64_t v7 = [NSNumber numberWithBool:a2 & 1];
  int v8 = 138412546;
  uint8_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_debug_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_DEBUG, "Incrementing password change count {account: %@, isReset: %@}", (uint8_t *)&v8, 0x16u);
}

- (void)setPassphrase:(void *)a1 hint:isReset:.cold.3(void *a1)
{
  v1 = [a1 account];
  v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v3, v4, "Not incrementing passphrase change count for initial passphrase {account: %@}", v5, v6, v7, v8, v9);
}

- (void)setPassphrase:(void *)a1 hint:(NSObject *)a2 isReset:.cold.4(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 account];
  uint64_t v4 = [v3 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Cannot set passphrase for account {account: %@}", v5, 0xCu);
}

- (void)changePassphrase:(void *)a1 toPassphrase:hint:completion:.cold.1(void *a1)
{
  v1 = [a1 account];
  v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_2(&dword_1B08EB000, v3, v4, "Not setting passphrase because account is not authenticated {account: %@}", v5, v6, v7, v8, v9);
}

- (void)changePassphrase:(void *)a1 toPassphrase:hint:completion:.cold.2(void *a1)
{
  v1 = [a1 account];
  v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_2(&dword_1B08EB000, v3, v4, "Not setting passphrase because diverged passphrase does not authenticate account {account: %@}", v5, v6, v7, v8, v9);
}

- (void)removePassphrase
{
  v1 = [a1 account];
  v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1B08EB000, v3, v4, "Removing passphrase for account… {account: %@}%s:%d", v5, v6, v7, v8, 2u);
}

- (void)updateDivergedNotesFromPassphrase:(void *)a1 toAccountPassphrase:completion:.cold.1(void *a1)
{
  v1 = [a1 account];
  v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v3, v4, "Not updating passphrase for diverged notes because account is not authenticated {account: %@}", v5, v6, v7, v8, v9);
}

- (void)updateDivergedNotesFromPassphrase:(void *)a1 toAccountPassphrase:completion:.cold.2(void *a1)
{
  v1 = [a1 account];
  v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1B08EB000, v3, v4, "Updating passphrase for diverged notes in account… {account: %@}%s:%d", v5, v6, v7, v8, 2u);
}

void __78__ICAccountPassphraseManager_updateDivergedNotesWithConfiguration_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Background task for notes convergence expired", v1, 2u);
}

@end