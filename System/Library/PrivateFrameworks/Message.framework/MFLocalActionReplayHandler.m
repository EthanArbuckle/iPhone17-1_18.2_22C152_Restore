@interface MFLocalActionReplayHandler
+ (OS_os_log)log;
- (BOOL)needToCheckForNewActions;
- (BOOL)replayingActions;
- (EFScheduler)replayScheduler;
- (MFLocalActionReplayHandler)initWithLibrary:(id)a3 account:(id)a4;
- (MFMailMessageLibrary)library;
- (MailAccount)account;
- (NSMutableArray)actionsToReplay;
- (NSString)ef_publicDescription;
- (void)_checkForNewActions;
- (void)_replayAllActions;
- (void)addNewAction:(id)a3;
- (void)connectionEstablished;
- (void)newActionsAdded;
- (void)setAccount:(id)a3;
- (void)setActionsToReplay:(id)a3;
- (void)setLibrary:(id)a3;
- (void)setNeedToCheckForNewActions:(BOOL)a3;
- (void)setReplayingActions:(BOOL)a3;
@end

@implementation MFLocalActionReplayHandler

- (MFLocalActionReplayHandler)initWithLibrary:(id)a3 account:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MFLocalActionReplayHandler;
  v9 = [(MFLocalActionReplayHandler *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_library, a3);
    objc_storeWeak((id *)&v10->_account, v8);
    uint64_t v11 = objc_opt_new();
    actionsToReplay = v10->_actionsToReplay;
    v10->_actionsToReplay = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.localActionReplayScheduler" qualityOfService:25];
    replayScheduler = v10->_replayScheduler;
    v10->_replayScheduler = (EFScheduler *)v13;
  }
  v15 = +[MFLocalActionReplayHandler log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [v8 identifier];
    *(_DWORD *)buf = 138543618;
    v20 = v10;
    __int16 v21 = 2114;
    v22 = v16;
    _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_DEFAULT, "Created %{public}@ for account %{public}@", buf, 0x16u);
  }
  return v10;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MFLocalActionReplayHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_13 != -1) {
    dispatch_once(&log_onceToken_13, block);
  }
  v2 = (void *)log_log_13;
  return (OS_os_log *)v2;
}

void __33__MFLocalActionReplayHandler_log__block_invoke(uint64_t a1)
{
  v2 = (const char *)[(id)*MEMORY[0x1E4F77E48] UTF8String];
  NSStringFromClass(*(Class *)(a1 + 32));
  id v5 = objc_claimAutoreleasedReturnValue();
  os_log_t v3 = os_log_create(v2, (const char *)[v5 UTF8String]);
  v4 = (void *)log_log_13;
  log_log_13 = (uint64_t)v3;
}

- (void)connectionEstablished
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  os_log_t v3 = +[MFLocalActionReplayHandler log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MFLocalActionReplayHandler *)self ef_publicDescription];
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ connection established", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(MFLocalActionReplayHandler *)self actionsToReplay];
  objc_sync_enter(v5);
  if (![(MFLocalActionReplayHandler *)self replayingActions])
  {
    [(MFLocalActionReplayHandler *)self setNeedToCheckForNewActions:1];
    [(MFLocalActionReplayHandler *)self _replayAllActions];
  }
  objc_sync_exit(v5);
}

- (void)newActionsAdded
{
  id obj = [(MFLocalActionReplayHandler *)self actionsToReplay];
  objc_sync_enter(obj);
  [(MFLocalActionReplayHandler *)self setNeedToCheckForNewActions:1];
  if (![(MFLocalActionReplayHandler *)self replayingActions]) {
    [(MFLocalActionReplayHandler *)self _replayAllActions];
  }
  objc_sync_exit(obj);
}

- (void)addNewAction:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MFLocalActionReplayHandler *)self actionsToReplay];
  objc_sync_enter(v5);
  int v6 = +[MFLocalActionReplayHandler log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(MFLocalActionReplayHandler *)self ef_publicDescription];
    int v9 = 138543618;
    v10 = v7;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ added action %{public}@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = [(MFLocalActionReplayHandler *)self actionsToReplay];
  [v8 addObject:v4];

  if (![(MFLocalActionReplayHandler *)self replayingActions]) {
    [(MFLocalActionReplayHandler *)self _replayAllActions];
  }
  objc_sync_exit(v5);
}

- (void)_replayAllActions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  os_log_t v3 = [(MFLocalActionReplayHandler *)self actionsToReplay];
  objc_sync_enter(v3);
  id v4 = [(MFLocalActionReplayHandler *)self actionsToReplay];
  uint64_t v5 = [v4 count];

  objc_sync_exit(v3);
  int v6 = +[MFLocalActionReplayHandler log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(MFLocalActionReplayHandler *)self ef_publicDescription];
    *(_DWORD *)buf = 138412546;
    v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v5;
    _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "Replaying all actions %@: %ld action(s) to replay", buf, 0x16u);
  }
  [(MFLocalActionReplayHandler *)self setReplayingActions:1];
  uint64_t v8 = [MEMORY[0x1E4F60E10] transactionWithDescription:@"com.apple.mobilemail.localActionReplayScheduler"];
  int v9 = [(MFLocalActionReplayHandler *)self replayScheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__MFLocalActionReplayHandler__replayAllActions__block_invoke;
  v11[3] = &unk_1E5D3B6E0;
  v11[4] = self;
  id v10 = v8;
  id v12 = v10;
  [v9 performBlock:v11];
}

void __47__MFLocalActionReplayHandler__replayAllActions__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) library];
  os_log_t v3 = [v2 persistence];
  id v4 = [v3 messageChangeManager];

  *(void *)&long long v5 = 138543874;
  long long v25 = v5;
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_checkForNewActions", v25);
    int v6 = [*(id *)(a1 + 32) actionsToReplay];
    objc_sync_enter(v6);
    id v7 = [*(id *)(a1 + 32) actionsToReplay];
    uint64_t v8 = [v7 firstObject];

    objc_sync_exit(v6);
    if (!v8) {
      break;
    }
    int v9 = +[MFLocalActionReplayHandler log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      *(_DWORD *)buf = 138543618;
      v27 = v10;
      __int16 v28 = 2114;
      uint64_t v29 = (uint64_t)v8;
      _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ replaying action %{public}@", buf, 0x16u);
    }
    __int16 v11 = [*(id *)(a1 + 32) account];
    id v12 = [v11 replayAction:v8];

    if (!v12)
    {
      objc_super v18 = +[MFLocalActionReplayHandler log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
        *(_DWORD *)buf = 138543618;
        v27 = v19;
        __int16 v28 = 2114;
        uint64_t v29 = (uint64_t)v8;
        _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Did not get results back for action: %{public}@. Will stop replaying actions.", buf, 0x16u);
      }
      break;
    }
    int v13 = [v4 persistResults:v12 forAction:v8];
    v14 = +[MFLocalActionReplayHandler log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      *(_DWORD *)buf = v25;
      v27 = v15;
      __int16 v28 = 2114;
      uint64_t v29 = (uint64_t)v8;
      __int16 v30 = 1024;
      int v31 = v13;
      _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ action %{public}@ finished, needToReplayAction = %d", buf, 0x1Cu);
    }
    if ((v13 & 1) == 0)
    {
      uint64_t v16 = [*(id *)(a1 + 32) actionsToReplay];
      objc_sync_enter(v16);
      uint64_t v17 = [*(id *)(a1 + 32) actionsToReplay];
      [v17 removeObject:v8];

      objc_sync_exit(v16);
    }
  }
  v20 = [*(id *)(a1 + 32) actionsToReplay];
  objc_sync_enter(v20);
  [*(id *)(a1 + 32) setReplayingActions:0];
  if ([*(id *)(a1 + 32) needToCheckForNewActions]) {
    [*(id *)(a1 + 32) _replayAllActions];
  }
  __int16 v21 = +[MFLocalActionReplayHandler log];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
    uint64_t v23 = [*(id *)(a1 + 32) actionsToReplay];
    uint64_t v24 = [v23 count];
    *(_DWORD *)buf = 138543618;
    v27 = v22;
    __int16 v28 = 2048;
    uint64_t v29 = v24;
    _os_log_impl(&dword_1A7EFF000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished replaying actions. %ld action(s) left to replay", buf, 0x16u);
  }
  objc_sync_exit(v20);

  [*(id *)(a1 + 40) invalidate];
}

- (void)_checkForNewActions
{
  os_log_t v3 = [(MFLocalActionReplayHandler *)self actionsToReplay];
  objc_sync_enter(v3);
  BOOL v4 = [(MFLocalActionReplayHandler *)self needToCheckForNewActions];
  [(MFLocalActionReplayHandler *)self setNeedToCheckForNewActions:0];
  objc_sync_exit(v3);

  if (v4)
  {
    long long v5 = [(MFLocalActionReplayHandler *)self actionsToReplay];
    int v6 = [v5 lastObject];
    id v7 = [v6 persistentID];
    uint64_t v8 = [v7 databaseID];

    int v9 = [(MFLocalActionReplayHandler *)self library];
    id v10 = [v9 persistence];
    __int16 v11 = [v10 localActionPersistence];
    id v12 = [(MFLocalActionReplayHandler *)self account];
    int v13 = [v12 URLString];
    id v16 = [v11 messageActionsForAccountURL:v13 previousActionID:v8];

    v14 = [(MFLocalActionReplayHandler *)self actionsToReplay];
    objc_sync_enter(v14);
    __int16 v15 = [(MFLocalActionReplayHandler *)self actionsToReplay];
    [v15 addObjectsFromArray:v16];

    objc_sync_exit(v14);
  }
}

- (NSString)ef_publicDescription
{
  os_log_t v3 = NSString;
  BOOL v4 = [(MFLocalActionReplayHandler *)self account];
  long long v5 = objc_msgSend(v4, "ef_publicDescription");
  int v6 = [v3 stringWithFormat:@"%@ for account: %@", self, v5];

  return (NSString *)v6;
}

- (BOOL)replayingActions
{
  return self->_replayingActions;
}

- (void)setReplayingActions:(BOOL)a3
{
  self->_replayingActions = a3;
}

- (MFMailMessageLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
}

- (MailAccount)account
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_account);
  return (MailAccount *)WeakRetained;
}

- (void)setAccount:(id)a3
{
}

- (NSMutableArray)actionsToReplay
{
  return self->_actionsToReplay;
}

- (void)setActionsToReplay:(id)a3
{
}

- (EFScheduler)replayScheduler
{
  return self->_replayScheduler;
}

- (BOOL)needToCheckForNewActions
{
  return self->_needToCheckForNewActions;
}

- (void)setNeedToCheckForNewActions:(BOOL)a3
{
  self->_needToCheckForNewActions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replayScheduler, 0);
  objc_storeStrong((id *)&self->_actionsToReplay, 0);
  objc_destroyWeak((id *)&self->_account);
  objc_storeStrong((id *)&self->_library, 0);
}

@end