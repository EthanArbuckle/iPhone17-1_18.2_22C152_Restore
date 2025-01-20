@interface ICDelegateAccountStore
+ (void)openWithOptions:(id)a3 completionHandler:(id)a4;
- (BOOL)_resetCorruptionUsingSQL;
- (BOOL)connectionNeedsResetForCorruption:(id)a3;
- (NSString)databasePath;
- (id)_initWithValidatedOptions:(id)a3;
- (id)_popConnection;
- (id)initSingleWriterWithOptions:(id)a3 error:(id *)a4;
- (void)_openWithXPCWriter:(id)a3 completionHandler:(id)a4;
- (void)_postDidChangeNotification;
- (void)_recycleConnection:(id)a3;
- (void)_resetCorruptionUsingXPC;
- (void)_writeSQLUsingBlock:(id)a3;
- (void)_writeUsingBlock:(id)a3;
- (void)_writeXPCUsingBlock:(id)a3;
- (void)addDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
- (void)close;
- (void)readUsingBlock:(id)a3;
- (void)removeAllTokensWithCompletionHandler:(id)a3;
- (void)removeDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
- (void)removeIdentityPropertiesForUserIdentity:(id)a3 completionHandler:(id)a4;
- (void)removeTokenForUserIdentity:(id)a3 completionHandler:(id)a4;
- (void)removeTokensExpiringBeforeDate:(id)a3 completionHandler:(id)a4;
- (void)setIdentityProperties:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
- (void)setToken:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5;
@end

@implementation ICDelegateAccountStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcWriter, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_connectionPool, 0);
}

- (void)_writeXPCUsingBlock:(id)a3
{
  v5 = (void (**)(id, ICDelegateAccountStoreXPCWriter *))a3;
  v4 = self->_xpcWriter;
  v5[2](v5, v4);
}

- (void)_writeUsingBlock:(id)a3
{
  id v4 = a3;
  if (!self->_isOpen) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Cannot use a closed delegate account store: %@", self format];
  }
  if ([(ICDelegateAccountStoreOptions *)self->_options isSingleWriter]) {
    [(ICDelegateAccountStore *)self _writeSQLUsingBlock:v4];
  }
  else {
    [(ICDelegateAccountStore *)self _writeXPCUsingBlock:v4];
  }
}

- (void)_writeSQLUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(ICDelegateAccountStore *)self _popConnection];
  v6 = [[ICDelegateAccountStoreReader alloc] initWithConnection:v5];
  v7 = [[ICDelegateAccountStoreSQLWriter alloc] initWithConnection:v5];
  v8 = [(ICDelegateAccountStoreReader *)v6 lastExpirationPruningDate];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__ICDelegateAccountStore__writeSQLUsingBlock___block_invoke;
  v9[3] = &unk_1E5AC7C18;
  v9[4] = v8;
  v10 = v7;
  id v11 = v4;
  [v5 performTransaction:v9];

  [(ICDelegateAccountStoreReader *)v6 invalidate];
  [(ICDelegateAccountStoreSQLWriter *)v7 invalidate];

  [(ICDelegateAccountStore *)self _recycleConnection:v5];
}

uint64_t __46__ICDelegateAccountStore__writeSQLUsingBlock___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  v3 = v2;
  if (!*(void *)(a1 + 32) || (objc_msgSend(v2, "timeIntervalSinceDate:"), v4 >= 43200.0)) {
    [*(id *)(a1 + 40) removeTokensExpiringBeforeDate:v3 completionHandler:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  return 1;
}

- (void)_resetCorruptionUsingXPC
{
  xpcWriter = self->_xpcWriter;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__ICDelegateAccountStore__resetCorruptionUsingXPC__block_invoke;
  v3[3] = &unk_1E5ACAE28;
  v3[4] = self;
  [(ICDelegateAccountStoreXPCWriter *)xpcWriter recreateWithCompletionHandler:v3];
}

void __50__ICDelegateAccountStore__resetCorruptionUsingXPC__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _postDidChangeNotification];
  }
  else
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_FAULT, "Could not recreate delegate account store: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (BOOL)_resetCorruptionUsingSQL
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = __SQLiteOptionsWithAccountStoreOptions(self->_options);
  double v4 = [[ICSQLiteConnection alloc] initWithOptions:v3];
  if (![(ICSQLiteConnection *)v4 truncate])
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_FAULT, "Could not truncate delegate account store for reset", buf, 2u);
    }
    goto LABEL_9;
  }
  id v10 = 0;
  BOOL v5 = __SetupSingleWriterWithConnection(v4, &v10);
  v6 = v10;
  if (!v5)
  {
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_FAULT, "Could not setup delegate account store for reset: %{public}@", buf, 0xCu);
    }

LABEL_9:
    BOOL v7 = 0;
    goto LABEL_10;
  }
  [(ICSQLiteConnection *)v4 setDelegate:self];
  [(ICDelegateAccountStore *)self _recycleConnection:v4];
  [(ICDelegateAccountStore *)self _postDidChangeNotification];
  BOOL v7 = 1;
LABEL_10:

  return v7;
}

- (void)_recycleConnection:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)[(NSMutableArray *)self->_connectionPool count] > 2)
  {
    os_unfair_lock_unlock(&self->_lock);
    [v4 close];
  }
  else
  {
    [(NSMutableArray *)self->_connectionPool addObject:v4];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_postDidChangeNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"ICDelegateAccountStoreDidChangeNotification" object:self];
}

- (id)_popConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableArray *)self->_connectionPool count])
  {
    id v4 = [(NSMutableArray *)self->_connectionPool objectAtIndex:0];
    [(NSMutableArray *)self->_connectionPool removeObjectAtIndex:0];
    os_unfair_lock_unlock(p_lock);
    if (v4) {
      goto LABEL_6;
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
  BOOL v5 = __SQLiteOptionsWithAccountStoreOptions(self->_options);
  objc_msgSend(v5, "setReadOnly:", -[ICDelegateAccountStoreOptions isSingleWriter](self->_options, "isSingleWriter") ^ 1);
  id v4 = [[ICSQLiteConnection alloc] initWithOptions:v5];
  [(ICSQLiteConnection *)v4 setDelegate:self];

LABEL_6:

  return v4;
}

- (void)_openWithXPCWriter:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_xpcWriter, a3);
  objc_initWeak(&location, self);
  xpcWriter = self->_xpcWriter;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__ICDelegateAccountStore__openWithXPCWriter_completionHandler___block_invoke;
  v14[3] = &unk_1E5ACD778;
  objc_copyWeak(&v15, &location);
  [(ICDelegateAccountStoreXPCWriter *)xpcWriter setExternalChangeHandler:v14];
  id v10 = self->_xpcWriter;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__ICDelegateAccountStore__openWithXPCWriter_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5AC7BF0;
  v12[4] = self;
  id v11 = v8;
  id v13 = v11;
  [(ICDelegateAccountStoreXPCWriter *)v10 openWithCompletionHandler:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __63__ICDelegateAccountStore__openWithXPCWriter_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _postDidChangeNotification];
    id WeakRetained = v2;
  }
}

void __63__ICDelegateAccountStore__openWithXPCWriter_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v14 = a4;
  v6 = *(void **)(*(void *)(a1 + 32) + 24);
  if (a3)
  {
    [v6 setDatabasePath:a3];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = [v6 XPCServiceName];
    uint64_t v8 = [v7 length];

    if (v8
      && [v14 code] == -7003
      && ([v14 domain],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 isEqualToString:@"ICError"],
          v9,
          v10))
    {
      id v11 = +[ICDelegateAccountStoreSchema defaultDatabasePath];
    }
    else
    {
      id v11 = 0;
    }
    uint64_t v12 = [v11 length];
    id v13 = *(id **)(a1 + 32);
    if (v12) {
      [v13[3] setDatabasePath:v11];
    }
    else {
      [v13 close];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)connectionNeedsResetForCorruption:(id)a3
{
  if ([(ICDelegateAccountStoreOptions *)self->_options isSingleWriter])
  {
    return [(ICDelegateAccountStore *)self _resetCorruptionUsingSQL];
  }
  else
  {
    [(ICDelegateAccountStore *)self _resetCorruptionUsingXPC];
    return 0;
  }
}

- (void)setToken:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__ICDelegateAccountStore_setToken_forUserIdentity_completionHandler___block_invoke;
  v14[3] = &unk_1E5AC7B78;
  id v15 = v8;
  id v16 = v9;
  v17 = self;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(ICDelegateAccountStore *)self _writeUsingBlock:v14];
}

void __69__ICDelegateAccountStore_setToken_forUserIdentity_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__ICDelegateAccountStore_setToken_forUserIdentity_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5ACCD60;
  BOOL v5 = (void *)a1[7];
  v6[4] = a1[6];
  id v7 = v5;
  [a2 setToken:v3 forUserIdentity:v4 completionHandler:v6];
}

uint64_t __69__ICDelegateAccountStore_setToken_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (a2) {
    objc_msgSend(*(id *)(a1 + 32), "_postDidChangeNotification", v5);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
  }

  return MEMORY[0x1F4181820]();
}

- (void)setIdentityProperties:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__ICDelegateAccountStore_setIdentityProperties_forUserIdentity_completionHandler___block_invoke;
  v14[3] = &unk_1E5AC7B78;
  id v15 = v8;
  id v16 = v9;
  v17 = self;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(ICDelegateAccountStore *)self _writeUsingBlock:v14];
}

void __82__ICDelegateAccountStore_setIdentityProperties_forUserIdentity_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__ICDelegateAccountStore_setIdentityProperties_forUserIdentity_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5ACCD60;
  id v5 = (void *)a1[7];
  v6[4] = a1[6];
  id v7 = v5;
  [a2 setIdentityProperties:v3 forUserIdentity:v4 completionHandler:v6];
}

uint64_t __82__ICDelegateAccountStore_setIdentityProperties_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (a2) {
    objc_msgSend(*(id *)(a1 + 32), "_postDidChangeNotification", v5);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
  }

  return MEMORY[0x1F4181820]();
}

- (void)removeTokensExpiringBeforeDate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__ICDelegateAccountStore_removeTokensExpiringBeforeDate_completionHandler___block_invoke;
  v10[3] = &unk_1E5AC7BC8;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ICDelegateAccountStore *)self _writeUsingBlock:v10];
}

void __75__ICDelegateAccountStore_removeTokensExpiringBeforeDate_completionHandler___block_invoke(void *a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__ICDelegateAccountStore_removeTokensExpiringBeforeDate_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5ACCD60;
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)a1[6];
  v5[4] = a1[5];
  id v6 = v4;
  [a2 removeTokensExpiringBeforeDate:v3 completionHandler:v5];
}

uint64_t __75__ICDelegateAccountStore_removeTokensExpiringBeforeDate_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (a2) {
    objc_msgSend(*(id *)(a1 + 32), "_postDidChangeNotification", v5);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
  }

  return MEMORY[0x1F4181820]();
}

- (void)removeTokenForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__ICDelegateAccountStore_removeTokenForUserIdentity_completionHandler___block_invoke;
  v10[3] = &unk_1E5AC7BC8;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ICDelegateAccountStore *)self _writeUsingBlock:v10];
}

void __71__ICDelegateAccountStore_removeTokenForUserIdentity_completionHandler___block_invoke(void *a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__ICDelegateAccountStore_removeTokenForUserIdentity_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5ACCD60;
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)a1[6];
  v5[4] = a1[5];
  id v6 = v4;
  [a2 removeTokenForUserIdentity:v3 completionHandler:v5];
}

uint64_t __71__ICDelegateAccountStore_removeTokenForUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (a2) {
    objc_msgSend(*(id *)(a1 + 32), "_postDidChangeNotification", v5);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
  }

  return MEMORY[0x1F4181820]();
}

- (void)removeIdentityPropertiesForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__ICDelegateAccountStore_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke;
  v10[3] = &unk_1E5AC7BC8;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ICDelegateAccountStore *)self _writeUsingBlock:v10];
}

void __84__ICDelegateAccountStore_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke(void *a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__ICDelegateAccountStore_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5ACCD60;
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)a1[6];
  v5[4] = a1[5];
  id v6 = v4;
  [a2 removeIdentityPropertiesForUserIdentity:v3 completionHandler:v5];
}

uint64_t __84__ICDelegateAccountStore_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (a2) {
    objc_msgSend(*(id *)(a1 + 32), "_postDidChangeNotification", v5);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
  }

  return MEMORY[0x1F4181820]();
}

- (void)removeDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__ICDelegateAccountStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke;
  v14[3] = &unk_1E5AC7B78;
  id v15 = v8;
  id v16 = v9;
  v17 = self;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(ICDelegateAccountStore *)self _writeUsingBlock:v14];
}

void __82__ICDelegateAccountStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__ICDelegateAccountStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5ACCD60;
  id v5 = (void *)a1[7];
  v6[4] = a1[6];
  id v7 = v5;
  [a2 removeDelegationUUIDs:v3 forUserIdentity:v4 completionHandler:v6];
}

uint64_t __82__ICDelegateAccountStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (a2) {
    objc_msgSend(*(id *)(a1 + 32), "_postDidChangeNotification", v5);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
  }

  return MEMORY[0x1F4181820]();
}

- (void)removeAllTokensWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__ICDelegateAccountStore_removeAllTokensWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5AC7BA0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICDelegateAccountStore *)self _writeUsingBlock:v6];
}

void __63__ICDelegateAccountStore_removeAllTokensWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__ICDelegateAccountStore_removeAllTokensWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5ACCD60;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 removeAllTokensWithCompletionHandler:v4];
}

uint64_t __63__ICDelegateAccountStore_removeAllTokensWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (a2) {
    objc_msgSend(*(id *)(a1 + 32), "_postDidChangeNotification", v5);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
  }

  return MEMORY[0x1F4181820]();
}

- (void)addDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__ICDelegateAccountStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke;
  v14[3] = &unk_1E5AC7B78;
  id v15 = v8;
  id v16 = v9;
  v17 = self;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(ICDelegateAccountStore *)self _writeUsingBlock:v14];
}

void __79__ICDelegateAccountStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__ICDelegateAccountStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5ACCD60;
  id v5 = (void *)a1[7];
  v6[4] = a1[6];
  id v7 = v5;
  [a2 addDelegationUUIDs:v3 forUserIdentity:v4 completionHandler:v6];
}

uint64_t __79__ICDelegateAccountStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (a2) {
    objc_msgSend(*(id *)(a1 + 32), "_postDidChangeNotification", v5);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
  }

  return MEMORY[0x1F4181820]();
}

- (void)readUsingBlock:(id)a3
{
  uint64_t v6 = (void (**)(id, ICDelegateAccountStoreReader *))a3;
  if (!self->_isOpen) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Cannot use a closed delegate account store: %@", self format];
  }
  uint64_t v4 = [(ICDelegateAccountStore *)self _popConnection];
  id v5 = [[ICDelegateAccountStoreReader alloc] initWithConnection:v4];
  v6[2](v6, v5);
  [(ICDelegateAccountStoreReader *)v5 invalidate];

  [(ICDelegateAccountStore *)self _recycleConnection:v4];
}

- (NSString)databasePath
{
  return [(ICDelegateAccountStoreOptions *)self->_options databasePath];
}

- (void)close
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = self->_connectionPool;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "setDelegate:", 0, (void)v11);
        [v8 close];
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  connectionPool = self->_connectionPool;
  self->_connectionPool = 0;

  [(ICDelegateAccountStoreXPCWriter *)self->_xpcWriter invalidate];
  self->_isOpen = 0;
  strongSelf = self->_strongSelf;
  self->_strongSelf = 0;
}

- (id)initSingleWriterWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (([v6 isSingleWriter] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"options not single-writer"];
  }
  id v7 = __SQLiteOptionsWithAccountStoreOptions(v6);
  id v8 = [[ICSQLiteConnection alloc] initWithOptions:v7];
  id v14 = 0;
  BOOL v9 = __SetupSingleWriterWithConnection(v8, &v14);
  id v10 = v14;
  if (v9)
  {
    long long v11 = [(ICDelegateAccountStore *)self _initWithValidatedOptions:v6];
    if (v11)
    {
      long long v12 = v11;
      [(ICSQLiteConnection *)v8 setDelegate:v11];
      [v12[1] addObject:v8];
      goto LABEL_9;
    }
  }
  else
  {
  }
  long long v12 = 0;
  if (a4) {
    *a4 = v10;
  }
LABEL_9:

  return v12;
}

- (id)_initWithValidatedOptions:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDelegateAccountStore;
  uint64_t v5 = [(ICDelegateAccountStore *)&v11 init];
  if (v5)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    connectionPool = v5->_connectionPool;
    v5->_connectionPool = v6;

    v5->_isOpen = 1;
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [v4 copy];
    options = v5->_options;
    v5->_options = (ICDelegateAccountStoreOptions *)v8;

    objc_storeStrong((id *)&v5->_strongSelf, v5);
  }

  return v5;
}

+ (void)openWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  if ([v6 isSingleWriter])
  {
    id v12 = 0;
    uint64_t v8 = (void *)[objc_alloc((Class)a1) initSingleWriterWithOptions:v6 error:&v12];
    id v9 = v12;
    v7[2](v7, v8, v9);
  }
  else
  {
    id v10 = [[ICDelegateAccountStoreXPCWriter alloc] initWithAccountStoreOptions:v6];
    if (v10)
    {
      objc_super v11 = (void *)[objc_alloc((Class)a1) _initWithValidatedOptions:v6];
      [v11 _openWithXPCWriter:v10 completionHandler:v7];
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid XPC options"];
      v7[2](v7, 0, 0);
    }
  }
}

@end