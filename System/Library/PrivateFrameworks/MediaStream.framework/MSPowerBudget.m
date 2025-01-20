@interface MSPowerBudget
- (BOOL)hasActiveTimers;
- (BOOL)hasForegroundFocus;
- (BOOL)isFileTransferAllowed;
- (BOOL)workQueueIsExternalPowered;
- (BOOL)workQueueIsFileTransferAllowed;
- (BOOL)workQueueIsForeground;
- (MSPBTimerContext)workQueueGlobalResetSyncTimerContext;
- (MSPBTimerContext)workQueuePostForegroundTimerContext;
- (MSPBTimerContext)workQueuePushTimerContext;
- (MSPowerBudget)init;
- (MSPowerBudgetDelegate)delegate;
- (NSString)focusAlbumGUID;
- (NSString)focusAssetCollectionGUID;
- (NSString)personID;
- (OS_dispatch_queue)workQueue;
- (double)maxActiveTimeAfterGlobalResetSync;
- (double)maxActiveTimeAfterLossOfForeground;
- (double)maxActiveTimeAfterPush;
- (double)workQueueMaxActiveTimeAfterGlobalResetSync;
- (double)workQueueMaxActiveTimeAfterLossOfForeground;
- (double)workQueueMaxActiveTimeAfterPush;
- (void)_globalResetSyncTimerDidExpire:(id)a3;
- (void)_postForegroundTimerDidExpire:(id)a3;
- (void)didBeginExternalPower;
- (void)didBeginForegroundFocus;
- (void)didEndExternalPower;
- (void)didEndForegroundFocus;
- (void)didReceiveGlobalResetSync;
- (void)didReceivePushNotification;
- (void)setDelegate:(id)a3;
- (void)setFocusAlbumGUID:(id)a3;
- (void)setFocusAssetCollectionGUID:(id)a3;
- (void)setIsFileTransferAllowed:(BOOL)a3;
- (void)setMaxActiveTimeAfterGlobalResetSync:(double)a3;
- (void)setMaxActiveTimeAfterLossOfForeground:(double)a3;
- (void)setMaxActiveTimeAfterPush:(double)a3;
- (void)setPersonID:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)setWorkQueueGlobalResetSyncTimerContext:(id)a3;
- (void)setWorkQueuePostForegroundTimerContext:(id)a3;
- (void)setWorkQueuePushTimerContext:(id)a3;
- (void)shutDown;
- (void)workQueueCommitPersistedValues;
- (void)workQueueRecomputeFileTransferAllowed;
- (void)workQueueSetExternalPowered:(BOOL)a3;
- (void)workQueueSetFileTransferAllowed:(BOOL)a3;
- (void)workQueueSetForeground:(BOOL)a3;
- (void)workQueueSetGlobalResetSyncTimerDate:(id)a3;
- (void)workQueueSetIsFileTransferAllowed:(BOOL)a3;
- (void)workQueueSetPostForegroundTimerDate:(id)a3;
- (void)workQueueSetPushTimerDate:(id)a3;
@end

@implementation MSPowerBudget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_workQueueGlobalResetSyncTimerContext, 0);
  objc_storeStrong((id *)&self->_workQueuePostForegroundTimerContext, 0);
  objc_storeStrong((id *)&self->_workQueuePushTimerContext, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_focusAssetCollectionGUID, 0);
  objc_storeStrong((id *)&self->_focusAlbumGUID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueueGlobalResetSyncTimerContext:(id)a3
{
}

- (MSPBTimerContext)workQueueGlobalResetSyncTimerContext
{
  return self->_workQueueGlobalResetSyncTimerContext;
}

- (void)setWorkQueuePostForegroundTimerContext:(id)a3
{
}

- (MSPBTimerContext)workQueuePostForegroundTimerContext
{
  return self->_workQueuePostForegroundTimerContext;
}

- (void)setWorkQueuePushTimerContext:(id)a3
{
}

- (MSPBTimerContext)workQueuePushTimerContext
{
  return self->_workQueuePushTimerContext;
}

- (void)workQueueSetForeground:(BOOL)a3
{
  self->_workQueueIsForeground = a3;
}

- (BOOL)workQueueIsForeground
{
  return self->_workQueueIsForeground;
}

- (void)workQueueSetExternalPowered:(BOOL)a3
{
  self->_workQueueIsExternalPowered = a3;
}

- (BOOL)workQueueIsExternalPowered
{
  return self->_workQueueIsExternalPowered;
}

- (void)workQueueSetFileTransferAllowed:(BOOL)a3
{
  self->_workQueueIsFileTransferAllowed = a3;
}

- (BOOL)workQueueIsFileTransferAllowed
{
  return self->_workQueueIsFileTransferAllowed;
}

- (void)setPersonID:(id)a3
{
}

- (NSString)personID
{
  return self->_personID;
}

- (NSString)focusAssetCollectionGUID
{
  return self->_focusAssetCollectionGUID;
}

- (NSString)focusAlbumGUID
{
  return self->_focusAlbumGUID;
}

- (MSPowerBudgetDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSPowerBudgetDelegate *)WeakRetained;
}

- (void)_globalResetSyncTimerDidExpire:(id)a3
{
  v4 = [(MSPowerBudget *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MSPowerBudget__globalResetSyncTimerDidExpire___block_invoke;
  block[3] = &unk_1E6CFCBF0;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __48__MSPowerBudget__globalResetSyncTimerDidExpire___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@: Global reset sync timer expired.", (uint8_t *)&v4, 0xCu);
  }
  [*(id *)(a1 + 32) workQueueSetGlobalResetSyncTimerDate:0];
  return [*(id *)(a1 + 32) workQueueRecomputeFileTransferAllowed];
}

- (void)_postForegroundTimerDidExpire:(id)a3
{
  int v4 = [(MSPowerBudget *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MSPowerBudget__postForegroundTimerDidExpire___block_invoke;
  block[3] = &unk_1E6CFCBF0;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __47__MSPowerBudget__postForegroundTimerDidExpire___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v2;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Post-foreground timer expired.", (uint8_t *)&v4, 0xCu);
  }
  [*(id *)(a1 + 32) workQueueSetPostForegroundTimerDate:0];
  return [*(id *)(a1 + 32) workQueueRecomputeFileTransferAllowed];
}

- (void)setFocusAssetCollectionGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSPowerBudget *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__MSPowerBudget_setFocusAssetCollectionGUID___block_invoke;
  v7[3] = &unk_1E6CFCE40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__MSPowerBudget_setFocusAssetCollectionGUID___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v2;
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: UI focus on asset collection GUID: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  id v4 = [*(id *)(a1 + 32) focusAssetCollectionGUID];
  char v5 = [v4 isEqual:*(void *)(a1 + 40)];

  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
    [*(id *)(a1 + 32) workQueueRecomputeFileTransferAllowed];
  }
}

- (void)setFocusAlbumGUID:(id)a3
{
  id v4 = a3;
  char v5 = [(MSPowerBudget *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__MSPowerBudget_setFocusAlbumGUID___block_invoke;
  v7[3] = &unk_1E6CFCE40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __35__MSPowerBudget_setFocusAlbumGUID___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v2;
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: UI focus on album GUID: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  id v4 = [*(id *)(a1 + 32) focusAlbumGUID];
  char v5 = [v4 isEqual:*(void *)(a1 + 40)];

  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
    [*(id *)(a1 + 32) workQueueRecomputeFileTransferAllowed];
  }
}

- (void)didEndExternalPower
{
  uint64_t v3 = [(MSPowerBudget *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MSPowerBudget_didEndExternalPower__block_invoke;
  block[3] = &unk_1E6CFCBF0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __36__MSPowerBudget_didEndExternalPower__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@: Unplugged from external power.", (uint8_t *)&v4, 0xCu);
  }
  [*(id *)(a1 + 32) workQueueSetExternalPowered:0];
  return [*(id *)(a1 + 32) workQueueRecomputeFileTransferAllowed];
}

- (void)didBeginExternalPower
{
  uint64_t v3 = [(MSPowerBudget *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MSPowerBudget_didBeginExternalPower__block_invoke;
  block[3] = &unk_1E6CFCBF0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __38__MSPowerBudget_didBeginExternalPower__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@: Plugged in to external power. Allowing file transfers.", (uint8_t *)&v4, 0xCu);
  }
  [*(id *)(a1 + 32) workQueueSetExternalPowered:1];
  return [*(id *)(a1 + 32) workQueueRecomputeFileTransferAllowed];
}

- (void)didReceiveGlobalResetSync
{
  uint64_t v3 = [(MSPowerBudget *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MSPowerBudget_didReceiveGlobalResetSync__block_invoke;
  block[3] = &unk_1E6CFCBF0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __42__MSPowerBudget_didReceiveGlobalResetSync__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    [v2 workQueueMaxActiveTimeAfterGlobalResetSync];
    int v7 = 138412546;
    __int16 v8 = v2;
    __int16 v9 = 2048;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@: Global reset sync received. Allowing file transfers to continue for %0.2f seconds.", (uint8_t *)&v7, 0x16u);
  }
  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9C8];
  [v4 workQueueMaxActiveTimeAfterGlobalResetSync];
  uint64_t v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
  [v4 workQueueSetGlobalResetSyncTimerDate:v6];
}

- (void)didEndForegroundFocus
{
  uint64_t v3 = [(MSPowerBudget *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MSPowerBudget_didEndForegroundFocus__block_invoke;
  block[3] = &unk_1E6CFCBF0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __38__MSPowerBudget_didEndForegroundFocus__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    [v2 workQueueMaxActiveTimeAfterLossOfForeground];
    int v8 = 138412546;
    __int16 v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@: UI no longer foregrounded. Allowing file transfers to continue for %0.2f seconds.", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) workQueueSetForeground:0];
  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9C8];
  [v4 workQueueMaxActiveTimeAfterLossOfForeground];
  uint64_t v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
  [v4 workQueueSetPostForegroundTimerDate:v6];

  return [*(id *)(a1 + 32) workQueueRecomputeFileTransferAllowed];
}

- (void)didBeginForegroundFocus
{
  uint64_t v3 = [(MSPowerBudget *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MSPowerBudget_didBeginForegroundFocus__block_invoke;
  block[3] = &unk_1E6CFCBF0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __40__MSPowerBudget_didBeginForegroundFocus__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v2;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: UI foregrounded. Allowing file transfers.", (uint8_t *)&v7, 0xCu);
  }
  char v3 = [*(id *)(a1 + 32) workQueueIsForeground];
  int v4 = *(void **)(a1 + 32);
  if (v3)
  {
    [v4 workQueueSetForeground:1];
    [*(id *)(a1 + 32) workQueueSetPostForegroundTimerDate:0];
    [*(id *)(a1 + 32) workQueueRecomputeFileTransferAllowed];
  }
  else
  {
    int v5 = [v4 workQueueIsExternalPowered];
    [*(id *)(a1 + 32) workQueueSetForeground:1];
    [*(id *)(a1 + 32) workQueueSetPostForegroundTimerDate:0];
    [*(id *)(a1 + 32) workQueueRecomputeFileTransferAllowed];
    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) delegate];
      [v6 MSPowerBudgetGotSignificantEvent:*(void *)(a1 + 32)];
    }
  }
}

- (void)didReceivePushNotification
{
  char v3 = [(MSPowerBudget *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MSPowerBudget_didReceivePushNotification__block_invoke;
  block[3] = &unk_1E6CFCBF0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __43__MSPowerBudget_didReceivePushNotification__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    [v2 workQueueMaxActiveTimeAfterPush];
    int v8 = 138412546;
    uint64_t v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@: Push received. Allowing file transfers to continue for %0.2f seconds", (uint8_t *)&v8, 0x16u);
  }
  int v4 = *(void **)(a1 + 32);
  int v5 = (void *)MEMORY[0x1E4F1C9C8];
  [v4 workQueueMaxActiveTimeAfterPush];
  uint64_t v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
  [v4 workQueueSetPushTimerDate:v6];

  return [*(id *)(a1 + 32) workQueueRecomputeFileTransferAllowed];
}

- (void)workQueueCommitPersistedValues
{
  id v13 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [(MSPowerBudget *)self workQueuePushTimerContext];

  if (v3)
  {
    int v4 = [(MSPowerBudget *)self workQueuePushTimerContext];
    int v5 = [v4 date];
    [v13 setObject:v5 forKey:@"pushTimerDate"];
  }
  uint64_t v6 = [(MSPowerBudget *)self workQueuePostForegroundTimerContext];

  if (v6)
  {
    int v7 = [(MSPowerBudget *)self workQueuePostForegroundTimerContext];
    int v8 = [v7 date];
    [v13 setObject:v8 forKey:@"postForegroundTimerDate"];
  }
  uint64_t v9 = [(MSPowerBudget *)self workQueueGlobalResetSyncTimerContext];

  if (v9)
  {
    __int16 v10 = [(MSPowerBudget *)self workQueueGlobalResetSyncTimerContext];
    uint64_t v11 = [v10 date];
    [v13 setObject:v11 forKey:@"globalResetSyncTimerDate"];
  }
  uint64_t v12 = [(MSPowerBudget *)self delegate];
  [v12 MSPowerBudget:self didRequestStorageOfPersistedValues:v13];
}

- (void)setIsFileTransferAllowed:(BOOL)a3
{
  int v5 = [(MSPowerBudget *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__MSPowerBudget_setIsFileTransferAllowed___block_invoke;
  v6[3] = &unk_1E6CFCC68;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __42__MSPowerBudget_setIsFileTransferAllowed___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(v1 + 8);
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v2 != v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = v1;
      __int16 v11 = 1024;
      int v12 = v3;
      _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Setting file transfers allowed = %d", buf, 0x12u);
      uint64_t v1 = *(void *)(a1 + 32);
      int v2 = *(unsigned __int8 *)(v1 + 8);
      LOBYTE(v3) = *(unsigned char *)(a1 + 40);
    }
    *(unsigned char *)(v1 + 8) = v3;
    if (v2)
    {
      if (*(unsigned char *)(a1 + 40)) {
        return;
      }
      int v5 = v8;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      uint64_t v6 = __42__MSPowerBudget_setIsFileTransferAllowed___block_invoke_36;
    }
    else
    {
      if (!*(unsigned char *)(a1 + 40)) {
        return;
      }
      int v5 = v7;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      uint64_t v6 = __42__MSPowerBudget_setIsFileTransferAllowed___block_invoke_2;
    }
    v5[2] = v6;
    v5[3] = &unk_1E6CFCBF0;
    v5[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __42__MSPowerBudget_setIsFileTransferAllowed___block_invoke_36(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MSPowerBudgetDidEndAllowingFileTransferNotification" object:*(void *)(a1 + 32)];
}

void __42__MSPowerBudget_setIsFileTransferAllowed___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MSPowerBudgetDidBeginAllowingFileTransferNotification" object:*(void *)(a1 + 32)];
}

- (void)workQueueSetIsFileTransferAllowed:(BOOL)a3
{
  self->_workQueueIsFileTransferAllowed = a3;
}

- (BOOL)hasActiveTimers
{
  id v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  int v3 = [(MSPowerBudget *)self workQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__MSPowerBudget_hasActiveTimers__block_invoke;
  v5[3] = &unk_1E6CFCC18;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __32__MSPowerBudget_hasActiveTimers__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) workQueuePushTimerContext];
  if (v2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    int v3 = [*(id *)(a1 + 32) workQueuePostForegroundTimerContext];
    if (v3)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      int v4 = [*(id *)(a1 + 32) workQueueGlobalResetSyncTimerContext];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 != 0;
    }
    id v2 = 0;
  }
}

- (BOOL)hasForegroundFocus
{
  id v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  int v3 = [(MSPowerBudget *)self workQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__MSPowerBudget_hasForegroundFocus__block_invoke;
  v5[3] = &unk_1E6CFCC18;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __35__MSPowerBudget_hasForegroundFocus__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) workQueueIsForeground];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isFileTransferAllowed
{
  id v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  int v3 = [(MSPowerBudget *)self workQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__MSPowerBudget_isFileTransferAllowed__block_invoke;
  v5[3] = &unk_1E6CFCC18;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __38__MSPowerBudget_isFileTransferAllowed__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)workQueueRecomputeFileTransferAllowed
{
  if ([(MSPowerBudget *)self workQueueIsExternalPowered]
    || [(MSPowerBudget *)self workQueueIsForeground])
  {
    BOOL v3 = 1;
  }
  else
  {
    int v4 = [(MSPowerBudget *)self workQueuePushTimerContext];
    if (v4)
    {
      BOOL v3 = 1;
    }
    else
    {
      int v5 = [(MSPowerBudget *)self workQueuePostForegroundTimerContext];
      if (v5)
      {
        BOOL v3 = 1;
      }
      else
      {
        uint64_t v6 = [(MSPowerBudget *)self workQueueGlobalResetSyncTimerContext];
        BOOL v3 = v6 != 0;
      }
    }
  }

  [(MSPowerBudget *)self setIsFileTransferAllowed:v3];
}

- (double)workQueueMaxActiveTimeAfterLossOfForeground
{
  return self->_maxActiveTimeAfterLossOfForeground;
}

- (void)setMaxActiveTimeAfterLossOfForeground:(double)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v8 = self;
    __int16 v9 = 2048;
    double v10 = a3;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Setting max active time after loss of foreground to %0.2f seconds.", buf, 0x16u);
  }
  int v5 = [(MSPowerBudget *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__MSPowerBudget_setMaxActiveTimeAfterLossOfForeground___block_invoke;
  v6[3] = &unk_1E6CFCC40;
  v6[4] = self;
  *(double *)&void v6[5] = a3;
  dispatch_async(v5, v6);
}

double __55__MSPowerBudget_setMaxActiveTimeAfterLossOfForeground___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 32) = result;
  return result;
}

- (double)maxActiveTimeAfterLossOfForeground
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  BOOL v3 = [(MSPowerBudget *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__MSPowerBudget_maxActiveTimeAfterLossOfForeground__block_invoke;
  v6[3] = &unk_1E6CFCC18;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

double __51__MSPowerBudget_maxActiveTimeAfterLossOfForeground__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 32);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)workQueueMaxActiveTimeAfterGlobalResetSync
{
  return self->_maxActiveTimeAfterGlobalResetSync;
}

- (void)setMaxActiveTimeAfterGlobalResetSync:(double)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v8 = self;
    __int16 v9 = 2048;
    double v10 = a3;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Setting max active time after global reset sync to %0.2f seconds.", buf, 0x16u);
  }
  int v5 = [(MSPowerBudget *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__MSPowerBudget_setMaxActiveTimeAfterGlobalResetSync___block_invoke;
  v6[3] = &unk_1E6CFCC40;
  v6[4] = self;
  *(double *)&void v6[5] = a3;
  dispatch_async(v5, v6);
}

double __54__MSPowerBudget_setMaxActiveTimeAfterGlobalResetSync___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 40) = result;
  return result;
}

- (double)maxActiveTimeAfterGlobalResetSync
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  BOOL v3 = [(MSPowerBudget *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__MSPowerBudget_maxActiveTimeAfterGlobalResetSync__block_invoke;
  v6[3] = &unk_1E6CFCC18;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

double __50__MSPowerBudget_maxActiveTimeAfterGlobalResetSync__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 40);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)workQueueMaxActiveTimeAfterPush
{
  return self->_maxActiveTimeAfterPush;
}

- (void)setMaxActiveTimeAfterPush:(double)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v8 = self;
    __int16 v9 = 2048;
    double v10 = a3;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Setting max active time after push to %0.2f seconds.", buf, 0x16u);
  }
  int v5 = [(MSPowerBudget *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__MSPowerBudget_setMaxActiveTimeAfterPush___block_invoke;
  v6[3] = &unk_1E6CFCC40;
  v6[4] = self;
  *(double *)&void v6[5] = a3;
  dispatch_async(v5, v6);
}

double __43__MSPowerBudget_setMaxActiveTimeAfterPush___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 24) = result;
  return result;
}

- (double)maxActiveTimeAfterPush
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  BOOL v3 = [(MSPowerBudget *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__MSPowerBudget_maxActiveTimeAfterPush__block_invoke;
  v6[3] = &unk_1E6CFCC18;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

double __39__MSPowerBudget_maxActiveTimeAfterPush__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 24);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)shutDown
{
  BOOL v3 = [(MSPowerBudget *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__MSPowerBudget_shutDown__block_invoke;
  block[3] = &unk_1E6CFCBF0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __25__MSPowerBudget_shutDown__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) workQueueSetPushTimerDate:0];
  [*(id *)(a1 + 32) workQueueSetPostForegroundTimerDate:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 workQueueSetGlobalResetSyncTimerDate:0];
}

- (void)workQueueSetGlobalResetSyncTimerDate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(MSPowerBudget *)self workQueueGlobalResetSyncTimerContext];

  if (v5)
  {
    uint64_t v6 = [(MSPowerBudget *)self workQueueGlobalResetSyncTimerContext];
    [v6 setIsValid:0];

    [(MSPowerBudget *)self setWorkQueueGlobalResetSyncTimerContext:0];
    if (!v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v17 = self;
        _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Stopping global reset sync timer.", buf, 0xCu);
      }
      [(MSPowerBudget *)self workQueueCommitPersistedValues];
      [(MSPowerBudget *)self workQueueRecomputeFileTransferAllowed];
      goto LABEL_10;
    }
  }
  else if (!v4)
  {
    goto LABEL_10;
  }
  [v4 timeIntervalSinceNow];
  double v8 = v7;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    __int16 v18 = 2048;
    double v19 = v8;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Setting global reset sync timer to fire in %0.2f seconds.", buf, 0x16u);
  }
  uint64_t v9 = +[MSPBTimerContext contextWithDate:v4];
  [(MSPowerBudget *)self setWorkQueueGlobalResetSyncTimerContext:v9];
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  uint64_t v11 = [(MSPowerBudget *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__MSPowerBudget_workQueueSetGlobalResetSyncTimerDate___block_invoke;
  v13[3] = &unk_1E6CFCE40;
  id v14 = v9;
  v15 = self;
  id v12 = v9;
  dispatch_after(v10, v11, v13);

LABEL_10:
}

uint64_t __54__MSPowerBudget_workQueueSetGlobalResetSyncTimerDate___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isValid];
  if (result)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v4 = 138543362;
      uint64_t v5 = v3;
      _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Global reset sync timer fired.", (uint8_t *)&v4, 0xCu);
    }
    [*(id *)(a1 + 40) setWorkQueueGlobalResetSyncTimerContext:0];
    [*(id *)(a1 + 40) workQueueCommitPersistedValues];
    return [*(id *)(a1 + 40) workQueueRecomputeFileTransferAllowed];
  }
  return result;
}

- (void)workQueueSetPostForegroundTimerDate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MSPowerBudget *)self workQueuePostForegroundTimerContext];

  if (v5)
  {
    uint64_t v6 = [(MSPowerBudget *)self workQueuePostForegroundTimerContext];
    [v6 setIsValid:0];

    [(MSPowerBudget *)self setWorkQueuePostForegroundTimerContext:0];
    if (!v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v17 = self;
        _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Stopping post-foreground timer.", buf, 0xCu);
      }
      [(MSPowerBudget *)self workQueueCommitPersistedValues];
      [(MSPowerBudget *)self workQueueRecomputeFileTransferAllowed];
      goto LABEL_10;
    }
  }
  else if (!v4)
  {
    goto LABEL_10;
  }
  [v4 timeIntervalSinceNow];
  double v8 = v7;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    __int16 v18 = 2048;
    double v19 = v8;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Setting post-foreground timer to fire in %0.2f seconds.", buf, 0x16u);
  }
  uint64_t v9 = +[MSPBTimerContext contextWithDate:v4];
  [(MSPowerBudget *)self setWorkQueuePostForegroundTimerContext:v9];
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  uint64_t v11 = [(MSPowerBudget *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__MSPowerBudget_workQueueSetPostForegroundTimerDate___block_invoke;
  v13[3] = &unk_1E6CFCE40;
  id v14 = v9;
  v15 = self;
  id v12 = v9;
  dispatch_after(v10, v11, v13);

LABEL_10:
}

uint64_t __53__MSPowerBudget_workQueueSetPostForegroundTimerDate___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isValid];
  if (result)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v4 = 138543362;
      uint64_t v5 = v3;
      _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Post-foreground timer fired.", (uint8_t *)&v4, 0xCu);
    }
    [*(id *)(a1 + 40) setWorkQueuePostForegroundTimerContext:0];
    [*(id *)(a1 + 40) workQueueCommitPersistedValues];
    return [*(id *)(a1 + 40) workQueueRecomputeFileTransferAllowed];
  }
  return result;
}

- (void)workQueueSetPushTimerDate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MSPowerBudget *)self workQueuePushTimerContext];

  if (v5)
  {
    uint64_t v6 = [(MSPowerBudget *)self workQueuePushTimerContext];
    [v6 setIsValid:0];

    [(MSPowerBudget *)self setWorkQueuePushTimerContext:0];
    if (!v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v17 = self;
        _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Stopping push timer.", buf, 0xCu);
      }
      notify_post((const char *)*MEMORY[0x1E4F5C480]);
      [(MSPowerBudget *)self workQueueCommitPersistedValues];
      [(MSPowerBudget *)self workQueueRecomputeFileTransferAllowed];
      goto LABEL_12;
    }
  }
  else if (!v4)
  {
    goto LABEL_12;
  }
  [v4 timeIntervalSinceNow];
  double v8 = v7;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    __int16 v18 = 2048;
    double v19 = v8;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Setting push timer to fire in %0.2f seconds.", buf, 0x16u);
  }
  if (!v5) {
    notify_post((const char *)*MEMORY[0x1E4F5C488]);
  }
  uint64_t v9 = +[MSPBTimerContext contextWithDate:v4];
  [(MSPowerBudget *)self setWorkQueuePushTimerContext:v9];
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  uint64_t v11 = [(MSPowerBudget *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__MSPowerBudget_workQueueSetPushTimerDate___block_invoke;
  v13[3] = &unk_1E6CFCE40;
  id v14 = v9;
  v15 = self;
  id v12 = v9;
  dispatch_after(v10, v11, v13);

LABEL_12:
}

uint64_t __43__MSPowerBudget_workQueueSetPushTimerDate___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isValid];
  if (result)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v4 = 138543362;
      uint64_t v5 = v3;
      _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Push timer fired.", (uint8_t *)&v4, 0xCu);
    }
    notify_post((const char *)*MEMORY[0x1E4F5C480]);
    [*(id *)(a1 + 40) setWorkQueuePushTimerContext:0];
    [*(id *)(a1 + 40) workQueueCommitPersistedValues];
    return [*(id *)(a1 + 40) workQueueRecomputeFileTransferAllowed];
  }
  return result;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSPowerBudget *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__MSPowerBudget_setDelegate___block_invoke;
  v7[3] = &unk_1E6CFCE40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __29__MSPowerBudget_setDelegate___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) delegate];
  id v9 = [v2 MSPowerBudgetDidRequestPersistedValues:*(void *)(a1 + 32)];

  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [v9 objectForKey:@"pushTimerDate"];
  [v3 workQueueSetPushTimerDate:v4];

  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [v9 objectForKey:@"postForegroundTimerDate"];
  [v5 workQueueSetPostForegroundTimerDate:v6];

  double v7 = *(void **)(a1 + 32);
  id v8 = [v9 objectForKey:@"globalResetSyncTimerDate"];
  [v7 workQueueSetGlobalResetSyncTimerDate:v8];

  [*(id *)(a1 + 32) workQueueRecomputeFileTransferAllowed];
}

- (MSPowerBudget)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSPowerBudget;
  id v2 = [(MSPowerBudget *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MSPowerBudget work queue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end