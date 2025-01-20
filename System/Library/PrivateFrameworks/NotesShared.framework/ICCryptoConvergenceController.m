@interface ICCryptoConvergenceController
+ (ICCryptoConvergenceController)sharedController;
+ (void)setSharedController:(id)a3;
- (BOOL)convergeAttachmentsInNoteWithID:(id)a3 configuration:(id)a4;
- (BOOL)convergeNotesInAccountWithID:(id)a3 configuration:(id)a4 progress:(id)a5;
- (BOOL)unsafelyConvergeAttachment:(id)a3 configuration:(id)a4;
- (BOOL)unsafelyConvergeAttachmentsInNote:(id)a3 configuration:(id)a4;
- (BOOL)unsafelyConvergeNote:(id)a3 configuration:(id)a4;
- (BOOL)unsafelyConvergeNotesInAccount:(id)a3 configuration:(id)a4;
- (ICCryptoConvergenceController)initWithWorkerContext:(id)a3;
- (NSManagedObjectContext)workerContext;
- (NSProgress)progress;
- (void)authenticationStateDidDeauthenticate:(id)a3;
- (void)cancelAndWaitWithReason:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation ICCryptoConvergenceController

- (ICCryptoConvergenceController)initWithWorkerContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICCryptoConvergenceController;
  v6 = [(ICCryptoConvergenceController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workerContext, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9 = +[ICAuthenticationState sharedState];
    [v8 addObserver:v7 selector:sel_authenticationStateDidDeauthenticate_ name:@"ICAuthenticationStateDidDeauthenticateNotification" object:v9];
  }
  return v7;
}

+ (ICCryptoConvergenceController)sharedController
{
  BOOL v2 = +[ICNoteContext hasSharedContext];
  v3 = (void *)_sharedController;
  if (v2 && _sharedController == 0)
  {
    if (sharedController_onceToken_0 != -1) {
      dispatch_once(&sharedController_onceToken_0, &__block_literal_global_16);
    }
    v3 = (void *)_sharedController;
  }
  return (ICCryptoConvergenceController *)v3;
}

void __49__ICCryptoConvergenceController_sharedController__block_invoke()
{
  v0 = +[ICNoteContext sharedContext];
  id v3 = [v0 workerManagedObjectContext];

  v1 = [[ICCryptoConvergenceController alloc] initWithWorkerContext:v3];
  BOOL v2 = (void *)_sharedController;
  _sharedController = (uint64_t)v1;
}

+ (void)setSharedController:(id)a3
{
}

- (BOOL)convergeNotesInAccountWithID:(id)a3 configuration:(id)a4 progress:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)[a4 copy];
  objc_super v11 = self;
  objc_sync_enter(v11);
  v12 = [(ICCryptoConvergenceController *)v11 progress];
  if (v12 && (char v13 = [v10 isUserInitiated], v12, (v13 & 1) == 0))
  {
    objc_sync_exit(v11);

    BOOL v18 = 0;
  }
  else
  {
    v14 = [(ICCryptoConvergenceController *)v11 progress];

    if (v14) {
      [(ICCryptoConvergenceController *)v11 cancelAndWaitWithReason:@"User-initiated operation"];
    }
    v15 = [(ICCryptoConvergenceController *)v11 progress];

    if (v15) {
      objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.progress) == nil)", "-[ICCryptoConvergenceController convergeNotesInAccountWithID:configuration:progress:]", 1, 0, @"Expected nil value for '%s'", "self.progress");
    }
    id v16 = v9;
    if (!v9) {
      id v16 = objc_alloc_init(MEMORY[0x1E4F28F90]);
    }
    [(ICCryptoConvergenceController *)v11 setProgress:v16];
    if (!v9) {

    }
    objc_sync_exit(v11);
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    v17 = [(ICCryptoConvergenceController *)v11 workerContext];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __85__ICCryptoConvergenceController_convergeNotesInAccountWithID_configuration_progress___block_invoke;
    v20[3] = &unk_1E64A5820;
    v20[4] = v11;
    id v21 = v8;
    id v22 = v10;
    v23 = &v24;
    [v17 performBlockAndWait:v20];

    BOOL v18 = *((unsigned char *)v25 + 24) != 0;
    _Block_object_dispose(&v24, 8);
  }

  return v18;
}

void __85__ICCryptoConvergenceController_convergeNotesInAccountWithID_configuration_progress___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) workerContext];
  [v2 refreshAllObjects];

  objc_opt_class();
  id v3 = [*(id *)(a1 + 32) workerContext];
  v4 = objc_msgSend(v3, "ic_existingObjectWithID:", *(void *)(a1 + 40));
  id v5 = ICCheckedDynamicCast();

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) unsafelyConvergeNotesInAccount:v5 configuration:*(void *)(a1 + 48)];
    v6 = [*(id *)(a1 + 32) workerContext];
    [v6 refreshAllObjects];

    v7 = [*(id *)(a1 + 32) progress];

    if (!v7) {
      objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.progress) != nil)", "-[ICCryptoConvergenceController convergeNotesInAccountWithID:configuration:progress:]_block_invoke", 1, 0, @"Expected non-nil value for '%s'", "self.progress");
    }
    [*(id *)(a1 + 32) setProgress:0];
  }
  else
  {
    id v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __85__ICCryptoConvergenceController_convergeNotesInAccountWithID_configuration_progress___block_invoke_cold_1((uint64_t *)(a1 + 40), a1, v8);
    }
  }
}

- (BOOL)unsafelyConvergeNotesInAccount:(id)a3 configuration:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ICCryptoConvergenceController unsafelyConvergeNotesInAccount:configuration:].cold.5(v6);
  }

  if (([v6 isAuthenticated] & 1) == 0)
  {
    id v9 = [v7 passphrase];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      objc_super v11 = +[ICAuthenticationState sharedState];
      [v11 beginBlockingDeauthentication];

      v12 = [v6 cryptoStrategy];
      char v13 = [v7 passphrase];
      [v12 authenticateWithPassphrase:v13];

      v14 = +[ICAuthenticationState sharedState];
      [v14 endBlockingDeauthentication];
    }
  }
  v15 = [v7 v1MainKey];
  if (v15)
  {
    [v7 setV1MainKey:v15];
  }
  else
  {
    id v16 = +[ICAuthenticationState sharedState];
    v17 = [v6 identifier];
    BOOL v18 = [v16 cachedMainKeyForIdentifier:v17];
    [v7 setV1MainKey:v18];
  }
  v19 = [v7 v1NeoMainKey];
  if (v19)
  {
    [v7 setV1NeoMainKey:v19];
  }
  else
  {
    v20 = +[ICAuthenticationState sharedState];
    id v21 = [v6 accountData];
    id v22 = [v21 identifier];
    v23 = [v20 cachedMainKeyForIdentifier:v22];
    [v7 setV1NeoMainKey:v23];
  }
  uint64_t v24 = [v7 v1MainKey];
  if (v24)
  {
  }
  else
  {
    v25 = [v7 v1NeoMainKey];

    if (!v25)
    {
      v50 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
        -[ICCryptoConvergenceController unsafelyConvergeNotesInAccount:configuration:](v6);
      }
      char v32 = 0;
      obj = v50;
      goto LABEL_38;
    }
  }
  uint64_t v26 = [v6 passwordProtectedNotes];
  uint64_t v27 = [v26 count];
  v28 = [(ICCryptoConvergenceController *)self progress];
  [v28 setTotalUnitCount:v27];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obj = v26;
  uint64_t v29 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (!v29)
  {
    char v32 = 1;
    goto LABEL_35;
  }
  uint64_t v30 = v29;
  uint64_t v31 = *(void *)v54;
  char v32 = 1;
  while (2)
  {
    id v33 = v7;
    for (uint64_t i = 0; i != v30; ++i)
    {
      if (*(void *)v54 != v31) {
        objc_enumerationMutation(obj);
      }
      v35 = *(void **)(*((void *)&v53 + 1) + 8 * i);
      v36 = [(ICCryptoConvergenceController *)self progress];
      int v37 = [v36 isCancelled];

      if (v37)
      {
        v49 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
          -[ICCryptoConvergenceController unsafelyConvergeNotesInAccount:configuration:](v6);
        }

        id v7 = v33;
        goto LABEL_35;
      }
      v38 = +[ICAuthenticationState sharedState];
      [v38 beginBlockingDeauthentication];

      v39 = +[ICAuthenticationState sharedState];
      int v40 = [v39 isAuthenticated];

      if (v40)
      {
        BOOL v41 = [(ICCryptoConvergenceController *)self unsafelyConvergeNote:v35 configuration:v33];
        v42 = +[ICAuthenticationState sharedState];
        [v42 endBlockingDeauthentication];

        if (v41)
        {
          v43 = [(ICCryptoConvergenceController *)self workerContext];
          v44 = [v35 shortLoggingDescription];
          char v45 = objc_msgSend(v43, "ic_saveWithLogDescription:", @"Saved after converging note {note: %@}", v44);

          goto LABEL_28;
        }
      }
      else
      {
        v46 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
          [(ICCryptoConvergenceController *)v57 unsafelyConvergeNotesInAccount:&v58 configuration:v46];
        }

        v47 = +[ICAuthenticationState sharedState];
        [v47 endBlockingDeauthentication];
      }
      v43 = [(ICCryptoConvergenceController *)self workerContext];
      [v43 rollback];
      char v45 = 0;
LABEL_28:

      v32 &= v45;
      v48 = [(ICCryptoConvergenceController *)self progress];
      objc_msgSend(v48, "setCompletedUnitCount:", objc_msgSend(v48, "completedUnitCount") + 1);
    }
    uint64_t v30 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
    id v7 = v33;
    if (v30) {
      continue;
    }
    break;
  }
LABEL_35:

  v50 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
    -[ICCryptoConvergenceController unsafelyConvergeNotesInAccount:configuration:](v6, v32 & 1);
  }

LABEL_38:
  return v32 & 1;
}

- (BOOL)unsafelyConvergeNote:(id)a3 configuration:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int64_t v7 = +[ICCryptoStrategyFactory cipherVersionForObject:v5];
  unint64_t v8 = 0x1E4F28000uLL;
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v10 = *MEMORY[0x1E4F1BE28];
  objc_super v11 = [v5 managedObjectContext];
  v12 = [v9 addObserverForName:v10 object:v11 queue:0 usingBlock:&__block_literal_global_28];

  uint64_t v13 = [v6 passphrase];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [v6 v1MainKey];
    if (!v15 || v7) {
      goto LABEL_6;
    }
    id v16 = [v6 passphrase];
    if ([v5 isPassphraseCorrect:v16])
    {

LABEL_6:
      goto LABEL_7;
    }
    char v32 = [v5 cryptoStrategy];
    id v33 = [v6 v1MainKey];
    int v34 = [v32 mainKeyDecryptsPrimaryData:v33];

    unint64_t v8 = 0x1E4F28000;
    if (v34)
    {
      v35 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = [v5 shortLoggingDescription];
        int v52 = 138412290;
        long long v53 = v36;
        _os_log_impl(&dword_1C3A61000, v35, OS_LOG_TYPE_INFO, "Fixing v1 note crypto goo using account main key… {note: %@}", (uint8_t *)&v52, 0xCu);
      }
      int v37 = [v6 v1MainKey];
      v38 = [v37 metadata];
      v39 = [v38 passphraseSalt];
      [v5 setCryptoSalt:v39];

      int v40 = [v6 v1MainKey];
      BOOL v41 = [v40 metadata];
      objc_msgSend(v5, "setCryptoIterationCount:", objc_msgSend(v41, "passphraseIterationCount"));

      v42 = [v6 v1MainKey];
      v43 = [v42 metadata];
      v44 = [v43 passphraseHint];
      [v5 setPasswordHint:v44];

      [v5 updateChangeCountWithReason:@"Fixed v1 Crypto Goo"];
    }
  }
LABEL_7:
  if ([v6 shouldConvergeObject:v5])
  {
    v17 = [v6 v1MainKey];
    BOOL v18 = v17;
    if (!v17 || v7)
    {
    }
    else
    {
      v19 = [v5 cryptoStrategy];
      v20 = [v6 v1MainKey];
      char v21 = [v19 mainKeyDecryptsPrimaryData:v20];

      if ((v21 & 1) == 0)
      {
        objc_opt_class();
        id v22 = [v5 cryptoStrategy];
        v23 = ICCheckedDynamicCast();
        uint64_t v24 = [v6 v1MainKey];
        int v25 = [v23 rewrapWithMainKey:v24];

        uint64_t v26 = os_log_create("com.apple.notes", "Crypto");
        uint64_t v27 = v26;
        if (v25)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            -[ICCryptoConvergenceController unsafelyConvergeNote:configuration:](v5);
          }
LABEL_26:
          BOOL v28 = 1;
LABEL_32:

LABEL_33:
          goto LABEL_34;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[ICCryptoConvergenceController unsafelyConvergeNote:configuration:].cold.4(v5);
        }
        goto LABEL_31;
      }
    }
    uint64_t v27 = [v6 v1NeoMainKey];
    BOOL v28 = 1;
    if (!v27 || v7 != 2) {
      goto LABEL_33;
    }
    uint64_t v29 = [v5 cryptoStrategy];
    uint64_t v30 = [v6 v1NeoMainKey];
    char v31 = [v29 mainKeyDecryptsPrimaryData:v30];

    if ((v31 & 1) == 0)
    {
      objc_opt_class();
      char v45 = [v5 cryptoStrategy];
      v46 = ICCheckedDynamicCast();
      v47 = [v6 v1NeoMainKey];
      int v48 = [v46 rewrapWithMainKey:v47];

      v49 = os_log_create("com.apple.notes", "Crypto");
      uint64_t v27 = v49;
      if (v48)
      {
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
          -[ICCryptoConvergenceController unsafelyConvergeNote:configuration:](v5);
        }
        goto LABEL_26;
      }
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        -[ICCryptoConvergenceController unsafelyConvergeNote:configuration:](v5);
      }
LABEL_31:
      BOOL v28 = 0;
      goto LABEL_32;
    }
  }
  BOOL v28 = 1;
LABEL_34:
  v50 = [*(id *)(v8 + 3768) defaultCenter];
  [v50 removeObserver:v12];

  return v28;
}

uint64_t __68__ICCryptoConvergenceController_unsafelyConvergeNote_configuration___block_invoke()
{
  return [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCryptoConvergenceController unsafelyConvergeNote:configuration:]_block_invoke" simulateCrash:1 showAlert:1 format:@"Saved while converging note"];
}

- (BOOL)convergeAttachmentsInNoteWithID:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  unint64_t v8 = [(ICCryptoConvergenceController *)self workerContext];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__ICCryptoConvergenceController_convergeAttachmentsInNoteWithID_configuration___block_invoke;
  v12[3] = &unk_1E64A5868;
  v12[4] = self;
  id v9 = v6;
  id v13 = v9;
  v15 = &v16;
  id v10 = v7;
  id v14 = v10;
  [v8 performBlockAndWait:v12];

  LOBYTE(v8) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v8;
}

void __79__ICCryptoConvergenceController_convergeAttachmentsInNoteWithID_configuration___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) workerContext];
  [v2 refreshAllObjects];

  objc_opt_class();
  id v3 = [*(id *)(a1 + 32) workerContext];
  v4 = (uint64_t *)(a1 + 40);
  id v5 = objc_msgSend(v3, "ic_existingObjectWithID:", *(void *)(a1 + 40));
  id v6 = ICCheckedDynamicCast();

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) unsafelyConvergeAttachmentsInNote:v6 configuration:*(void *)(a1 + 48)];
    id v7 = [*(id *)(a1 + 32) workerContext];
    [v7 refreshAllObjects];
  }
  else
  {
    id v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __79__ICCryptoConvergenceController_convergeAttachmentsInNoteWithID_configuration___block_invoke_cold_1(v4, v7);
    }
  }
}

- (BOOL)unsafelyConvergeAttachmentsInNote:(id)a3 configuration:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ICCryptoConvergenceController unsafelyConvergeAttachmentsInNote:configuration:](v6);
  }

  if (([v6 isPasswordProtected] & 1) == 0)
  {
    char v19 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ICCryptoConvergenceController unsafelyConvergeAttachmentsInNote:configuration:](v6);
    }

    goto LABEL_12;
  }
  id v9 = +[ICAuthenticationState sharedState];
  [v9 beginBlockingDeauthentication];

  if (([v6 isAuthenticated] & 1) == 0)
  {
    id v10 = [v7 passphrase];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      v12 = [v6 cryptoStrategy];
      id v13 = [v7 passphrase];
      char v14 = [v12 authenticateWithPassphrase:v13];

      if ((v14 & 1) == 0)
      {
        char v19 = +[ICAuthenticationState sharedState];
        [v19 endBlockingDeauthentication];
LABEL_12:
        LOBYTE(v20) = 0;
        goto LABEL_38;
      }
    }
  }
  v15 = +[ICAuthenticationState sharedState];
  uint64_t v16 = [v6 identifier];
  v17 = [v15 cachedMainKeyForIdentifier:v16];

  uint64_t v18 = [v7 v1MainKey];
  if (v18)
  {
    [v7 setV1MainKey:v18];
  }
  else
  {
    char v21 = [v17 metadata];
    if ([v21 cipherVersion]) {
      id v22 = 0;
    }
    else {
      id v22 = v17;
    }
    [v7 setV1MainKey:v22];
  }
  v23 = [v7 v1NeoMainKey];
  if (v23)
  {
    [v7 setV1NeoMainKey:v23];
  }
  else
  {
    uint64_t v24 = [v17 metadata];
    if ([v24 cipherVersion] == 2) {
      int v25 = v17;
    }
    else {
      int v25 = 0;
    }
    [v7 setV1NeoMainKey:v25];
  }
  v46 = v17;

  uint64_t v26 = [v6 attachments];
  uint64_t v27 = (void *)[v26 copy];
  BOOL v28 = [v6 inlineAttachments];
  uint64_t v29 = (void *)[v28 copy];
  uint64_t v30 = [v27 setByAddingObjectsFromSet:v29];

  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __81__ICCryptoConvergenceController_unsafelyConvergeAttachmentsInNote_configuration___block_invoke;
  v53[3] = &unk_1E64A5890;
  id v47 = v7;
  id v31 = v7;
  id v54 = v31;
  char v45 = v30;
  char v32 = objc_msgSend(v30, "ic_objectsPassingTest:", v53);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v49 objects:v55 count:16];
  int v48 = v6;
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v50;
    int v20 = 1;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v50 != v35) {
          objc_enumerationMutation(v32);
        }
        int v37 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        BOOL v38 = [(ICCryptoConvergenceController *)self unsafelyConvergeAttachment:v37 configuration:v31];
        v39 = [(ICCryptoConvergenceController *)self workerContext];
        int v40 = v39;
        if (v38)
        {
          BOOL v41 = [v37 shortLoggingDescription];
          v20 &= objc_msgSend(v40, "ic_saveWithLogDescription:", @"Saved after converging attachment {attachment: %@}", v41);
        }
        else
        {
          [v39 rollback];
          int v20 = 0;
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v34);
  }
  else
  {
    LOBYTE(v20) = 1;
  }
  v42 = +[ICAuthenticationState sharedState];
  [v42 endBlockingDeauthentication];

  v43 = os_log_create("com.apple.notes", "Crypto");
  id v6 = v48;
  char v19 = v46;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    -[ICCryptoConvergenceController unsafelyConvergeAttachmentsInNote:configuration:](v48, v20);
  }

  id v7 = v47;
LABEL_38:

  return v20;
}

uint64_t __81__ICCryptoConvergenceController_unsafelyConvergeAttachmentsInNote_configuration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 parentAttachment];
  if (v4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [*(id *)(a1 + 32) shouldConvergeObject:v3];
  }

  return v5;
}

- (BOOL)unsafelyConvergeAttachment:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int64_t v7 = +[ICCryptoStrategyFactory cipherVersionForObject:v5];
  unint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = *MEMORY[0x1E4F1BE28];
  id v10 = [v5 managedObjectContext];
  uint64_t v11 = [v8 addObserverForName:v9 object:v10 queue:0 usingBlock:&__block_literal_global_44];

  v12 = [v6 v1MainKey];
  id v13 = v12;
  if (!v12 || v7)
  {
  }
  else
  {
    char v14 = [v5 cryptoStrategy];
    v15 = [v6 v1MainKey];
    char v16 = [v14 mainKeyDecryptsPrimaryData:v15];

    if ((v16 & 1) == 0)
    {
      objc_opt_class();
      v17 = [v5 cryptoStrategy];
      uint64_t v18 = ICCheckedDynamicCast();
      char v19 = [v6 v1MainKey];
      int v20 = [v18 rewrapWithMainKey:v19];

      char v21 = os_log_create("com.apple.notes", "Crypto");
      id v22 = v21;
      if (v20)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[ICCryptoConvergenceController unsafelyConvergeAttachment:configuration:](v5);
        }
LABEL_14:

        goto LABEL_16;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[ICCryptoConvergenceController unsafelyConvergeAttachment:configuration:].cold.4(v5);
      }
      goto LABEL_21;
    }
  }
  v23 = [v6 v1NeoMainKey];
  uint64_t v24 = v23;
  if (!v23 || v7 != 2)
  {

    goto LABEL_16;
  }
  int v25 = [v5 cryptoStrategy];
  uint64_t v26 = [v6 v1NeoMainKey];
  char v27 = [v25 mainKeyDecryptsPrimaryData:v26];

  if ((v27 & 1) == 0)
  {
    objc_opt_class();
    BOOL v28 = [v5 cryptoStrategy];
    uint64_t v29 = ICCheckedDynamicCast();
    uint64_t v30 = [v6 v1NeoMainKey];
    int v31 = [v29 rewrapWithMainKey:v30];

    char v32 = os_log_create("com.apple.notes", "Crypto");
    id v22 = v32;
    if (v31)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[ICCryptoConvergenceController unsafelyConvergeAttachment:configuration:](v5);
      }
      goto LABEL_14;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[ICCryptoConvergenceController unsafelyConvergeAttachment:configuration:](v5);
    }
LABEL_21:

    BOOL v33 = 0;
    goto LABEL_22;
  }
LABEL_16:
  BOOL v33 = 1;
LABEL_22:
  uint64_t v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v34 removeObserver:v11];

  return v33;
}

uint64_t __74__ICCryptoConvergenceController_unsafelyConvergeAttachment_configuration___block_invoke()
{
  return [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCryptoConvergenceController unsafelyConvergeAttachment:configuration:]_block_invoke" simulateCrash:1 showAlert:1 format:@"Saved while converging diverged attachment"];
}

- (void)cancelAndWaitWithReason:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v12 = v4;
    __int16 v13 = 2080;
    char v14 = "-[ICCryptoConvergenceController cancelAndWaitWithReason:]";
    __int16 v15 = 1024;
    int v16 = 347;
    _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling converging notes… {reason: %@}%s:%d", buf, 0x1Cu);
  }

  id v6 = [(ICCryptoConvergenceController *)self progress];
  [v6 cancel];

  int64_t v7 = [(ICCryptoConvergenceController *)self workerContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__ICCryptoConvergenceController_cancelAndWaitWithReason___block_invoke;
  v9[3] = &unk_1E64A4240;
  id v10 = v4;
  id v8 = v4;
  [v7 performBlockAndWait:v9];
}

void __57__ICCryptoConvergenceController_cancelAndWaitWithReason___block_invoke(uint64_t a1)
{
  BOOL v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __57__ICCryptoConvergenceController_cancelAndWaitWithReason___block_invoke_cold_1(a1, v2);
  }
}

- (void)authenticationStateDidDeauthenticate:(id)a3
{
  id v3 = +[ICAuthenticationState sharedState];
  char v4 = [v3 isAuthenticated];

  if ((v4 & 1) == 0)
  {
    id v5 = dispatch_get_global_queue(-32768, 0);
    dispatch_async(v5, &__block_literal_global_51);
  }
}

void __70__ICCryptoConvergenceController_authenticationStateDidDeauthenticate___block_invoke()
{
  id v0 = +[ICCryptoConvergenceController sharedController];
  [v0 cancelAndWaitWithReason:@"Notes was deauthenticated"];
}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_workerContext, 0);
}

void __85__ICCryptoConvergenceController_convergeNotesInAccountWithID_configuration_progress___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(a2 + 48);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Cannot fetch account for converging notes {accountID: %@, configuration: %@}", (uint8_t *)&v5, 0x16u);
}

- (void)unsafelyConvergeNotesInAccount:(void *)a1 configuration:.cold.1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not converging notes because there are no account main keys {account: %@}", v4, v5, v6, v7, v8);
}

- (void)unsafelyConvergeNotesInAccount:(void *)a1 configuration:(char)a2 .cold.2(void *a1, char a2)
{
  uint64_t v3 = [a1 shortLoggingDescription];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a2 & 1];
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_3_5(&dword_1C3A61000, v5, v6, "Converged notes in account {account: %@, success: %@}%s:%d", v7, v8, v9, v10, v11);
}

- (void)unsafelyConvergeNotesInAccount:(void *)a1 configuration:.cold.3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Cancelled converging notes {account: %@}", v4, v5, v6, v7, v8);
}

- (void)unsafelyConvergeNotesInAccount:(void *)a3 configuration:(NSObject *)a4 .cold.4(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 shortLoggingDescription];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1C3A61000, a4, OS_LOG_TYPE_DEBUG, "Not converging note because Notes is not authenticated {account: %@}", a1, 0xCu);
}

- (void)unsafelyConvergeNotesInAccount:(void *)a1 configuration:.cold.5(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_3_5(&dword_1C3A61000, v2, v3, "Converging notes in account… {account: %@, configuration: %@}%s:%d", v4, v5, v6, v7, v8);
}

- (void)unsafelyConvergeNote:(void *)a1 configuration:.cold.1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Converged v1 Neo note {note: %@}", v4, v5, v6, v7, v8);
}

- (void)unsafelyConvergeNote:(void *)a1 configuration:.cold.2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot converge v1 Neo note {note: %@}", v4, v5, v6, v7, v8);
}

- (void)unsafelyConvergeNote:(void *)a1 configuration:.cold.3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Converged v1 note {note: %@}", v4, v5, v6, v7, v8);
}

- (void)unsafelyConvergeNote:(void *)a1 configuration:.cold.4(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot converge v1 note {note: %@}", v4, v5, v6, v7, v8);
}

void __79__ICCryptoConvergenceController_convergeAttachmentsInNoteWithID_configuration___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Cannot fetch note for converging attachments {noteID: %@}", (uint8_t *)&v3, 0xCu);
}

- (void)unsafelyConvergeAttachmentsInNote:(void *)a1 configuration:(char)a2 .cold.1(void *a1, char a2)
{
  int v3 = [a1 shortLoggingDescription];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a2 & 1];
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_3_5(&dword_1C3A61000, v5, v6, "Converged attachments in note {note: %@, success: %@}%s:%d", v7, v8, v9, v10, v11);
}

- (void)unsafelyConvergeAttachmentsInNote:(void *)a1 configuration:.cold.2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot converge note that is not password-protected {note: %@}", v4, v5, v6, v7, v8);
}

- (void)unsafelyConvergeAttachmentsInNote:(void *)a1 configuration:.cold.3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_3_5(&dword_1C3A61000, v2, v3, "Converging attachments in note… {note: %@, configuration: %@}%s:%d", v4, v5, v6, v7, v8);
}

- (void)unsafelyConvergeAttachment:(void *)a1 configuration:.cold.1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Converged v1 Neo diverged attachment {attachment: %@}", v4, v5, v6, v7, v8);
}

- (void)unsafelyConvergeAttachment:(void *)a1 configuration:.cold.2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot converge v1 Neo diverged attachment {attachment: %@}", v4, v5, v6, v7, v8);
}

- (void)unsafelyConvergeAttachment:(void *)a1 configuration:.cold.3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Converged v1 diverged attachment {attachment: %@}", v4, v5, v6, v7, v8);
}

- (void)unsafelyConvergeAttachment:(void *)a1 configuration:.cold.4(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot converge v1 diverged attachment {attachment: %@}", v4, v5, v6, v7, v8);
}

void __57__ICCryptoConvergenceController_cancelAndWaitWithReason___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Cancelled converging notes {reason: %@}", (uint8_t *)&v3, 0xCu);
}

@end