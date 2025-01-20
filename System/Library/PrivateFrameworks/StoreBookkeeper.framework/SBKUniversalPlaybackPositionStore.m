@interface SBKUniversalPlaybackPositionStore
+ (id)keyValueStoreItemIdentifierForItem:(id)a3;
- (BOOL)_automaticallySynchronizeLocalChangesOnResignActive;
- (BOOL)_automaticallySynchronizeOnBecomeActive;
- (BOOL)_timerIsStopped;
- (BOOL)hasLocalChangesToSync;
- (NSDate)dateToFireNextTimer;
- (NSTimer)timer;
- (SBKAsynchronousTask)bagLookupTask;
- (SBKAsynchronousTask)currentTask;
- (SBKAsynchronousTask)lookupDomainVersionTask;
- (SBKRequestHandler)currentTaskRequestHandler;
- (SBKUniversalPlaybackPositionDataSource)dataSource;
- (SBKUniversalPlaybackPositionStore)init;
- (SBKUniversalPlaybackPositionStore)initWithDomain:(id)a3 dataSource:(id)a4 automaticSynchronizeOptions:(unint64_t)a5 accountIdentifier:(id)a6 isActive:(BOOL)a7;
- (SBKUniversalPlaybackPositionStore)initWithDomain:(id)a3 dataSource:(id)a4 automaticSynchronizeOptions:(unint64_t)a5 isActive:(BOOL)a6;
- (SBKUniversalPlaybackPositionStore)initWithInitialUpdateDelay:(double)a3;
- (double)_effectiveAutorefreshRate;
- (id)_accountForSyncing;
- (unint64_t)automaticSynchronizeOptions;
- (void)_onQueueLoadBagContextWithCompletionHandler:(id)a3;
- (void)_onQueueLoadRemoteDomainVersionWithCompletionBlock:(id)a3;
- (void)_onQueuePullMetadataItemWithItemIdentifier:(id)a3 completionBlock:(id)a4;
- (void)_onQueuePushMetadataItem:(id)a3 completionBlock:(id)a4;
- (void)_onQueueResumeTimer;
- (void)_onQueueRunNextPendingTaskBlock;
- (void)_onQueueRunTaskWithName:(id)a3 taskCompletionHandler:(id)a4 runTaskBlock:(id)a5;
- (void)_onQueueScheduleTimer;
- (void)_onQueueStartNewTimer;
- (void)_onQueueStartNewTimerWithTimeIntervalSinceNow:(double)a3;
- (void)_onQueueStopTimer;
- (void)_onQueueSuspendTimer;
- (void)_onQueueSynchronizeImmediatelyWithCompletionHandler:(id)a3;
- (void)_onQueueSynchronizeWithAutosynchronizeMask:(unint64_t)a3 withCompletionBlock:(id)a4;
- (void)_onQueueUpdateTimerForActiveChanges;
- (void)_onQueueUpdateTimerForAutomaticSyncOptionChanges;
- (void)_timerFired:(id)a3;
- (void)_updateAutorefreshRateSettingAndRestartTimer:(BOOL)a3;
- (void)_updateForStoreAccountsChange;
- (void)_updateSettingsFromLoadedBagContext:(id)a3;
- (void)becomeActive;
- (void)checkForAvailabilityWithCompletionBlock:(id)a3;
- (void)dealloc;
- (void)deprecated_setDataSource:(id)a3;
- (void)loadBagContextWithCompletionBlock:(id)a3;
- (void)loadRemoteDomainVersionWithCompletionBlock:(id)a3;
- (void)pullMetadataItemWithItemIdentifier:(id)a3 completionBlock:(id)a4;
- (void)pushMetadataItem:(id)a3 completionBlock:(id)a4;
- (void)resignActive;
- (void)setAutomaticSynchronizeOptions:(unint64_t)a3;
- (void)setAutomaticallySynchronizeLocalChangesOnResignActive:(BOOL)a3;
- (void)setAutomaticallySynchronizeOnBecomeActive:(BOOL)a3;
- (void)setBagLookupTask:(id)a3;
- (void)setCurrentTask:(id)a3;
- (void)setCurrentTaskRequestHandler:(id)a3;
- (void)setDateToFireNextTimer:(id)a3;
- (void)setHasLocalChangesToSync:(BOOL)a3;
- (void)setLookupDomainVersionTask:(id)a3;
- (void)setTimer:(id)a3;
- (void)synchronizeImmediatelyWithCompletionBlock:(id)a3;
- (void)synchronizeImmediatelyWithCompletionHandler:(id)a3;
@end

@implementation SBKUniversalPlaybackPositionStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_dateToFireNextTimer, 0);
  objc_storeStrong((id *)&self->_currentTaskRequestHandler, 0);
  objc_storeStrong((id *)&self->_bagLookupTask, 0);
  objc_storeStrong((id *)&self->_lookupDomainVersionTask, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong(&self->_prefsObserver, 0);
  objc_storeStrong(&self->_accountsObserver, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_pendingTaskBlocks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setTimer:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setDateToFireNextTimer:(id)a3
{
}

- (NSDate)dateToFireNextTimer
{
  return self->_dateToFireNextTimer;
}

- (void)setCurrentTaskRequestHandler:(id)a3
{
}

- (SBKRequestHandler)currentTaskRequestHandler
{
  return self->_currentTaskRequestHandler;
}

- (void)setBagLookupTask:(id)a3
{
}

- (SBKAsynchronousTask)bagLookupTask
{
  return self->_bagLookupTask;
}

- (void)setLookupDomainVersionTask:(id)a3
{
}

- (SBKAsynchronousTask)lookupDomainVersionTask
{
  return self->_lookupDomainVersionTask;
}

- (void)setCurrentTask:(id)a3
{
}

- (SBKAsynchronousTask)currentTask
{
  return self->_currentTask;
}

- (SBKUniversalPlaybackPositionDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SBKUniversalPlaybackPositionDataSource *)WeakRetained;
}

- (void)_onQueueStartNewTimerWithTimeIntervalSinceNow:(double)a3
{
  [(SBKUniversalPlaybackPositionStore *)self _onQueueStopTimer];
  if (a3 >= 31536000.0)
  {
    id v6 = [MEMORY[0x263EFF910] distantFuture];
    [(SBKUniversalPlaybackPositionStore *)self setDateToFireNextTimer:v6];
  }
  else
  {
    v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a3];
    [(SBKUniversalPlaybackPositionStore *)self setDateToFireNextTimer:v5];

    [(SBKUniversalPlaybackPositionStore *)self _onQueueResumeTimer];
  }
}

- (void)_onQueueStartNewTimer
{
}

- (void)_onQueueStopTimer
{
  v3 = [MEMORY[0x263EFF910] distantFuture];
  [(SBKUniversalPlaybackPositionStore *)self setDateToFireNextTimer:v3];

  [(SBKUniversalPlaybackPositionStore *)self _onQueueSuspendTimer];
}

- (void)_onQueueResumeTimer
{
  if (self->_isActive
    && !self->_refreshTimerActive
    && ![(SBKUniversalPlaybackPositionStore *)self _timerIsStopped])
  {
    [(SBKUniversalPlaybackPositionStore *)self _onQueueScheduleTimer];
  }
}

- (void)_onQueueSuspendTimer
{
  if (self->_refreshTimerActive)
  {
    v3 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_22B807000, v3, OS_LOG_TYPE_DEFAULT, "suspending update timer", v4, 2u);
    }

    [(NSTimer *)self->_timer invalidate];
    [(SBKUniversalPlaybackPositionStore *)self setTimer:0];
    self->_refreshTimerActive = 0;
  }
}

- (void)_onQueueScheduleTimer
{
  if (!self->_refreshTimerActive)
  {
    self->_refreshTimerActive = 1;
    v3 = [(SBKUniversalPlaybackPositionStore *)self dateToFireNextTimer];
    [v3 timeIntervalSinceNow];
    uint64_t v5 = v4;

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__SBKUniversalPlaybackPositionStore__onQueueScheduleTimer__block_invoke;
    v6[3] = &unk_2648AF4C0;
    v6[5] = v5;
    v6[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

void __58__SBKUniversalPlaybackPositionStore__onQueueScheduleTimer__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  double v2 = *(double *)(a1 + 40);
  if (v2 >= 0.0)
  {
    if (v2 < 31536000.0)
    {
      uint64_t v4 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:*(double *)(a1 + 40)];
        id v6 = [MEMORY[0x263EFF910] date];
        [v5 timeIntervalSinceNow];
        double v8 = v7;
        [v6 timeIntervalSinceNow];
        double v10 = v8 - v9;
        if (v10 <= 60.0) {
          [NSString stringWithFormat:@"%.2f seconds", *(void *)&v10, v16];
        }
        else {
        v11 = [NSString stringWithFormat:@"%lld minutes, %lld seconds", (uint64_t)v10 / 60, (uint64_t)v10 % 60];
        }
        v12 = [NSString stringWithFormat:@"%@ (%@ from now)", v5, v11];

        *(_DWORD *)buf = 138412290;
        v18 = v12;
        _os_log_impl(&dword_22B807000, v4, OS_LOG_TYPE_DEFAULT, "scheduling next timer update at %@", buf, 0xCu);
      }
      uint64_t v13 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel__timerFired_ selector:0 userInfo:0 repeats:*(double *)(a1 + 40)];
      uint64_t v14 = *(void *)(a1 + 32);
      v15 = *(void **)(v14 + 152);
      *(void *)(v14 + 152) = v13;
    }
  }
  else
  {
    v3 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22B807000, v3, OS_LOG_TYPE_DEFAULT, "scheduled timer date already passed.  Firing immediately", buf, 2u);
    }

    [*(id *)(a1 + 32) _timerFired:0];
  }
}

- (BOOL)_timerIsStopped
{
  double v2 = [(SBKUniversalPlaybackPositionStore *)self dateToFireNextTimer];
  v3 = [MEMORY[0x263EFF910] distantFuture];
  char v4 = [v2 isEqualToDate:v3];

  return v4;
}

- (void)_timerFired:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SBKUniversalPlaybackPositionStore__timerFired___block_invoke;
  block[3] = &unk_2648AF920;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __49__SBKUniversalPlaybackPositionStore__timerFired___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueSynchronizeWithAutosynchronizeMask:3 withCompletionBlock:0];
}

- (void)_updateAutorefreshRateSettingAndRestartTimer:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __82__SBKUniversalPlaybackPositionStore__updateAutorefreshRateSettingAndRestartTimer___block_invoke;
  v4[3] = &unk_2648AF248;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __82__SBKUniversalPlaybackPositionStore__updateAutorefreshRateSettingAndRestartTimer___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _effectiveAutorefreshRate];
  *(void *)(*(void *)(a1 + 32) + 72) = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    char v4 = *(void **)(a1 + 32);
    return [v4 _onQueueStartNewTimer];
  }
  return result;
}

- (double)_effectiveAutorefreshRate
{
  if ((self->_automaticSynchronizeOptions & 1) == 0) {
    return 31536000.0;
  }
  double v4 = self->_pollingLimitFromBag / 60.0;
  BOOL v5 = +[SBKPreferences storeBookkeeperPreferences];
  id v6 = [NSNumber numberWithDouble:self->_pollingLimitFromBag];
  double v7 = [v5 objectForKey:@"AutoSyncRateInMinutes" withDefaultValue:v6];
  [v7 floatValue];
  double v9 = v8;

  if (v4 != v9) {
    return v9 * 60.0;
  }
  double result = self->_pollingLimitFromBag;
  if (result == 31536000.0 || result <= 0.00000011920929) {
    return 31536000.0;
  }
  return result;
}

- (void)_updateForStoreAccountsChange
{
  uint64_t v3 = [(SBKUniversalPlaybackPositionStore *)self _accountForSyncing];

  queue = self->_queue;
  if (v3)
  {
    BOOL v5 = v8;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    id v6 = __66__SBKUniversalPlaybackPositionStore__updateForStoreAccountsChange__block_invoke;
  }
  else
  {
    BOOL v5 = v7;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    id v6 = __66__SBKUniversalPlaybackPositionStore__updateForStoreAccountsChange__block_invoke_2;
  }
  v5[2] = v6;
  v5[3] = &unk_2648AF920;
  v5[4] = self;
  dispatch_async(queue, v5);
}

uint64_t __66__SBKUniversalPlaybackPositionStore__updateForStoreAccountsChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueResumeTimer];
}

uint64_t __66__SBKUniversalPlaybackPositionStore__updateForStoreAccountsChange__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueSuspendTimer];
}

- (void)_onQueueLoadBagContextWithCompletionHandler:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke;
  v37[3] = &unk_2648AF2E8;
  v37[4] = self;
  id v5 = v4;
  id v38 = v5;
  id v6 = (void *)MEMORY[0x230F4DE10](v37);
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier && ![(NSNumber *)accountIdentifier isEqual:&unk_26DF16B78])
  {
    if (self->_bagLookupTask)
    {
      uint64_t v13 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B807000, v13, OS_LOG_TYPE_DEFAULT, "_onQueueLoadBag - load bag already in progress.  pending our completion block to be notified when it completes.", buf, 2u);
      }

      [(SBKAsynchronousTask *)self->_bagLookupTask addTaskCompletionBlock:v6];
    }
    else
    {
      uint64_t v14 = [[SBKAsynchronousTask alloc] initWithHandlerQueue:self->_queue timeout:@"SBKUPPStore Load Bag" debugDescription:20.0];
      bagLookupTask = self->_bagLookupTask;
      self->_bagLookupTask = v14;

      [(SBKAsynchronousTask *)self->_bagLookupTask addTaskCompletionBlock:v6];
      uint64_t v16 = self;
      v17 = self->_bagLookupTask;
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_123;
      v32[3] = &unk_2648AF920;
      v18 = v16;
      v33 = v18;
      [(SBKAsynchronousTask *)v17 setExpirationHandler:v32];
      uint64_t v19 = self->_bagLookupTask;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_2;
      v30[3] = &unk_2648AF920;
      v20 = v18;
      v31 = v20;
      [(SBKAsynchronousTask *)v19 setFinishedHandler:v30];
      [(SBKAsynchronousTask *)self->_bagLookupTask beginTaskOperation];
      v21 = (void *)MEMORY[0x263F7B350];
      v22 = [MEMORY[0x263F7B358] contextWithBagType:0];
      v23 = [v21 URLBagForContext:v22];

      if (v23)
      {
        v24 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B807000, v24, OS_LOG_TYPE_DEFAULT, "_onQueueLoadBag - load bag operation beginning...", buf, 2u);
        }

        domain = v20->_domain;
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_131;
        v28[3] = &unk_2648AF358;
        v29 = v20;
        +[SBKStoreURLBagContext loadBagContextFromURLBag:v23 domain:domain completionBlock:v28];
        v26 = v29;
      }
      else
      {
        v27 = self->_bagLookupTask;
        v26 = +[SBKStoreError keyValueStoreDisabledErrorWithTransaction:0 underlyingError:0];
        [(SBKAsynchronousTask *)v27 finishTaskOperationWithResult:0 error:v26];
      }
    }
  }
  else
  {
    float v8 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = [(NSNumber *)self->_accountIdentifier description];
      *(_DWORD *)buf = 138412290;
      v40 = v9;
      _os_log_impl(&dword_22B807000, v8, OS_LOG_TYPE_DEFAULT, "_onQueueLoadBag - skipping bag load: _accountIdentifier=%@ [no valid account identifier]", buf, 0xCu);
    }
    double v10 = [MEMORY[0x263F087E8] errorWithDomain:@"SBKStoreErrorDomain" code:-1001 userInfo:0];
    v11 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_119;
    block[3] = &unk_2648AF858;
    id v35 = v10;
    id v36 = v6;
    id v12 = v10;
    dispatch_async(v11, block);
  }
}

void __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) _updateSettingsFromLoadedBagContext:v12];
  if (*(void *)(a1 + 40))
  {
    if (v12)
    {
      if (![v12 domainDisabled])
      {
LABEL_7:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_8;
      }
      id v6 = (void *)MEMORY[0x263F087E8];
      double v7 = ErrorInfoWithUnderlyingError_925(v5);
      float v8 = v6;
      uint64_t v9 = -2007;
    }
    else
    {
      double v10 = (void *)MEMORY[0x263F087E8];
      double v7 = ErrorInfoWithUnderlyingError_925(v5);
      float v8 = v10;
      uint64_t v9 = -2008;
    }
    uint64_t v11 = [v8 errorWithDomain:@"SBKStoreErrorDomain" code:v9 userInfo:v7];

    id v5 = (id)v11;
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_119(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_123(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) finishTaskOperationWithResult:0 error:0];
}

void __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 128);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 128);
  *(void *)(v3 + 128) = 0;

  id v5 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v2 error];
    if (v6)
    {
      double v7 = NSString;
      float v8 = [v2 error];
      uint64_t v9 = [v8 localizedDescription];
      [v7 stringWithFormat:@" ERROR = '%@'.", v9];
      double v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      id v12 = v10;
      _os_log_impl(&dword_22B807000, v5, OS_LOG_TYPE_DEFAULT, "_onQueueLoadBag - load bag completed.%@", buf, 0xCu);
    }
    else
    {
      *(_DWORD *)buf = 138412290;
      id v12 = &stru_26DF10968;
      _os_log_impl(&dword_22B807000, v5, OS_LOG_TYPE_DEFAULT, "_onQueueLoadBag - load bag completed.%@", buf, 0xCu);
    }
  }
  [v2 invokeTaskCompletionBlocksWithBlock:&__block_literal_global_126];
}

void __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_131(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = *(void **)(a1 + 32);
  float v8 = v7[1];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_2_132;
  block[3] = &unk_2648AF7A8;
  id v12 = v7;
  id v13 = v5;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

uint64_t __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_2_132(void *a1)
{
  return [*(id *)(a1[4] + 128) finishTaskOperationWithResult:a1[5] error:a1[6]];
}

void __81__SBKUniversalPlaybackPositionStore__onQueueLoadBagContextWithCompletionHandler___block_invoke_124(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  float v8 = (void (**)(id, id, id))MEMORY[0x230F4DE10](a2);
  v8[2](v8, v7, v6);
}

- (void)_updateSettingsFromLoadedBagContext:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__SBKUniversalPlaybackPositionStore__updateSettingsFromLoadedBagContext___block_invoke;
  v6[3] = &unk_2648AF8A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __73__SBKUniversalPlaybackPositionStore__updateSettingsFromLoadedBagContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 40) pollingIntervalInSeconds];
  *(void *)(*(void *)(a1 + 32) + 64) = v2;
  [*(id *)(a1 + 32) _effectiveAutorefreshRate];
  id v4 = *(double **)(a1 + 32);
  BOOL v5 = v4[7] == 31536000.0 && v3 != v4[9];
  return [v4 _updateAutorefreshRateSettingAndRestartTimer:v5];
}

- (id)_accountForSyncing
{
  double v3 = [MEMORY[0x263F7B0E8] defaultStore];
  id v4 = [v3 accountWithUniqueIdentifier:self->_accountIdentifier];

  return v4;
}

- (void)_onQueuePullMetadataItemWithItemIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__926;
  v18[4] = __Block_byref_object_dispose__927;
  id v19 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __96__SBKUniversalPlaybackPositionStore__onQueuePullMetadataItemWithItemIdentifier_completionBlock___block_invoke;
  v15[3] = &unk_2648AF448;
  v17 = v18;
  id v8 = v7;
  id v16 = v8;
  id v9 = (void *)MEMORY[0x230F4DE10](v15);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __96__SBKUniversalPlaybackPositionStore__onQueuePullMetadataItemWithItemIdentifier_completionBlock___block_invoke_2;
  v11[3] = &unk_2648AF498;
  id v14 = v18;
  id v10 = v6;
  id v12 = v10;
  id v13 = self;
  [(SBKUniversalPlaybackPositionStore *)self _onQueueRunTaskWithName:@"GET value" taskCompletionHandler:v9 runTaskBlock:v11];

  _Block_object_dispose(v18, 8);
}

void __96__SBKUniversalPlaybackPositionStore__onQueuePullMetadataItemWithItemIdentifier_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v5 = a3;
  id v6 = [v4 resultItemPayloadPair];
  id v7 = [v6 kvsKey];
  id v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) resultItemPayloadPair];
  id v9 = [v8 kvsPayload];
  id v12 = +[SBKUniversalPlaybackPositionMetadata metadataWithItemIdentifier:v7 keyValueStorePayload:v9];

  id v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) resultItemVersionAnchor];
  uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) resultDomainVersion];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__SBKUniversalPlaybackPositionStore__onQueuePullMetadataItemWithItemIdentifier_completionBlock___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[SBKPullValueTransaction alloc] initWithStoreBagContext:v6 requestedKey:a1[4] clientItemPayloadPair:0 clientItemVersionAnchor:0];
  uint64_t v8 = *(void *)(a1[6] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = [[SBKSimpleTransactionRequestHandler alloc] initWithBagContext:v6];
  uint64_t v11 = a1[5];
  id v12 = *(void **)(v11 + 136);
  *(void *)(v11 + 136) = v10;
  id v13 = v10;

  id v14 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B807000, v14, OS_LOG_TYPE_DEFAULT, "_onQueueSync - pull value operation beginning...", buf, 2u);
  }

  uint64_t v15 = *(void *)(*(void *)(a1[6] + 8) + 40);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __96__SBKUniversalPlaybackPositionStore__onQueuePullMetadataItemWithItemIdentifier_completionBlock___block_invoke_117;
  v17[3] = &unk_2648AF470;
  id v18 = v5;
  id v16 = v5;
  [(SBKSimpleTransactionRequestHandler *)v13 scheduleTransaction:v15 finishedBlock:v17];
}

uint64_t __96__SBKUniversalPlaybackPositionStore__onQueuePullMetadataItemWithItemIdentifier_completionBlock___block_invoke_117(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_onQueuePushMetadataItem:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__926;
  v18[4] = __Block_byref_object_dispose__927;
  id v19 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__SBKUniversalPlaybackPositionStore__onQueuePushMetadataItem_completionBlock___block_invoke;
  v15[3] = &unk_2648AF448;
  v17 = v18;
  id v8 = v7;
  id v16 = v8;
  id v9 = (void *)MEMORY[0x230F4DE10](v15);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__SBKUniversalPlaybackPositionStore__onQueuePushMetadataItem_completionBlock___block_invoke_2;
  v11[3] = &unk_2648AF498;
  id v14 = v18;
  id v10 = v6;
  id v12 = v10;
  id v13 = self;
  [(SBKUniversalPlaybackPositionStore *)self _onQueueRunTaskWithName:@"PUT value" taskCompletionHandler:v9 runTaskBlock:v11];

  _Block_object_dispose(v18, 8);
}

void __78__SBKUniversalPlaybackPositionStore__onQueuePushMetadataItem_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v5 = a3;
  id v6 = [v4 resultItemPayloadPair];
  id v7 = [v6 kvsKey];
  id v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) resultItemPayloadPair];
  id v9 = [v8 kvsPayload];
  id v12 = +[SBKUniversalPlaybackPositionMetadata metadataWithItemIdentifier:v7 keyValueStorePayload:v9];

  id v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) resultItemVersionAnchor];
  uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) resultDomainVersion];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__SBKUniversalPlaybackPositionStore__onQueuePushMetadataItem_completionBlock___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[SBKPushValueTransaction alloc] initWithStoreBagContext:v6 clientItemPayloadPair:a1[4] clientItemVersionAnchor:0];
  uint64_t v8 = *(void *)(a1[6] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = [[SBKSimpleTransactionRequestHandler alloc] initWithBagContext:v6];
  uint64_t v11 = a1[5];
  id v12 = *(void **)(v11 + 136);
  *(void *)(v11 + 136) = v10;
  id v13 = v10;

  id v14 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B807000, v14, OS_LOG_TYPE_DEFAULT, "_onQueueSync - push value operation beginning...", buf, 2u);
  }

  uint64_t v15 = *(void *)(*(void *)(a1[6] + 8) + 40);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __78__SBKUniversalPlaybackPositionStore__onQueuePushMetadataItem_completionBlock___block_invoke_111;
  v17[3] = &unk_2648AF470;
  id v18 = v5;
  id v16 = v5;
  [(SBKSimpleTransactionRequestHandler *)v13 scheduleTransaction:v15 finishedBlock:v17];
}

uint64_t __78__SBKUniversalPlaybackPositionStore__onQueuePushMetadataItem_completionBlock___block_invoke_111(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_onQueueSynchronizeImmediatelyWithCompletionHandler:(id)a3
{
  if (self->_currentTask)
  {
    id v4 = a3;
    id v5 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22B807000, v5, OS_LOG_TYPE_DEFAULT, "_onQueueSync - synchronize already in progress.  pending our completion block to be notified when it completes.", buf, 2u);
    }

    [(SBKAsynchronousTask *)self->_currentTask addTaskCompletionBlock:v4];
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __89__SBKUniversalPlaybackPositionStore__onQueueSynchronizeImmediatelyWithCompletionHandler___block_invoke;
    v6[3] = &unk_2648AF420;
    v6[4] = self;
    id v4 = a3;
    [(SBKUniversalPlaybackPositionStore *)self _onQueueRunTaskWithName:@"synchronize" taskCompletionHandler:v4 runTaskBlock:v6];
  }
}

void __89__SBKUniversalPlaybackPositionStore__onQueueSynchronizeImmediatelyWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [SBKPlaybackPositionSyncRequestHandler alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
  id v9 = [(SBKPlaybackPositionSyncRequestHandler *)v7 initWithDataSource:WeakRetained bagContext:v6 accountIdentifier:*(void *)(*(void *)(a1 + 32) + 40)];

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 136);
  *(void *)(v10 + 136) = v9;
  id v12 = v9;

  id v13 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B807000, v13, OS_LOG_TYPE_DEFAULT, "_onQueueSync - synchronize operation beginning...", buf, 2u);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __89__SBKUniversalPlaybackPositionStore__onQueueSynchronizeImmediatelyWithCompletionHandler___block_invoke_104;
  v15[3] = &unk_2648AF298;
  id v16 = v5;
  id v14 = v5;
  [(SBKPlaybackPositionSyncRequestHandler *)v12 synchronizeWithCompletionHandler:v15];
}

uint64_t __89__SBKUniversalPlaybackPositionStore__onQueueSynchronizeImmediatelyWithCompletionHandler___block_invoke_104(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_onQueueRunTaskWithName:(id)a3 taskCompletionHandler:(id)a4 runTaskBlock:(id)a5
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SBKUniversalPlaybackPositionStore *)self _accountForSyncing];

  if (v11)
  {
    if (self->_currentTask)
    {
      objc_initWeak(location, self);
      pendingTaskBlocks = self->_pendingTaskBlocks;
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_2;
      v34[3] = &unk_2648AF380;
      objc_copyWeak(&v38, location);
      id v35 = v8;
      id v36 = v9;
      id v37 = v10;
      id v13 = (void *)MEMORY[0x230F4DE10](v34);
      [(NSMutableArray *)pendingTaskBlocks addObject:v13];

      objc_destroyWeak(&v38);
      objc_destroyWeak(location);
    }
    else
    {
      self->_initialAutosyncInterval = 31536000.0;
      id v18 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v8;
        _os_log_impl(&dword_22B807000, v18, OS_LOG_TYPE_DEFAULT, "_onQueueSync - beginning %@ operation...", (uint8_t *)location, 0xCu);
      }

      [(SBKUniversalPlaybackPositionStore *)self _onQueueStopTimer];
      id v19 = [[SBKAsynchronousTask alloc] initWithHandlerQueue:self->_queue timeout:@"SBKUPPStore Synchronize" debugDescription:20.0];
      p_currentTask = &self->_currentTask;
      currentTask = self->_currentTask;
      self->_currentTask = v19;

      [(SBKAsynchronousTask *)self->_currentTask addTaskCompletionBlock:v9];
      v22 = self;
      v23 = self->_currentTask;
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_93;
      v32[3] = &unk_2648AF920;
      v24 = v22;
      v33 = v24;
      [(SBKAsynchronousTask *)v23 setExpirationHandler:v32];
      v25 = *p_currentTask;
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_2_94;
      v29[3] = &unk_2648AF8A8;
      v30 = v24;
      id v31 = v8;
      v26 = v24;
      [(SBKAsynchronousTask *)v25 setFinishedHandler:v29];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_2_98;
      v27[3] = &unk_2648AF2E8;
      v27[4] = v26;
      id v28 = v10;
      [(SBKUniversalPlaybackPositionStore *)v26 _onQueueLoadBagContextWithCompletionHandler:v27];
    }
  }
  else
  {
    id v14 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v8;
      _os_log_impl(&dword_22B807000, v14, OS_LOG_TYPE_DEFAULT, "_onQueueRunTaskWithName %@ - short circuiting. _accountForSyncing=nil", (uint8_t *)location, 0xCu);
    }

    uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:@"SBKStoreErrorDomain" code:-1001 userInfo:0];
    id v16 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke;
    block[3] = &unk_2648AF858;
    id v40 = v15;
    id v41 = v9;
    id v17 = v15;
    dispatch_async(v16, block);
  }
}

uint64_t __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _onQueueRunTaskWithName:*(void *)(a1 + 32) taskCompletionHandler:*(void *)(a1 + 40) runTaskBlock:*(void *)(a1 + 48)];
}

uint64_t __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_93(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 112) cancelType];
  double v3 = *(void **)(*(void *)(a1 + 32) + 136);
  if (v2 == 2)
  {
    return [v3 timeout];
  }
  else
  {
    return [v3 cancel];
  }
}

uint64_t __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_2_94(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = *(id *)(*(void *)(a1 + 32) + 112);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 17))
  {
    id v8 = [v4 result];
    *(unsigned char *)(*(void *)(a1 + 32) + 17) = [v8 BOOLValue] ^ 1;
  }
  else
  {
    *(unsigned char *)(v7 + 17) = 0;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 136);
  *(void *)(v9 + 136) = 0;

  uint64_t v11 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = [v4 error];
    if (v13)
    {
      id v14 = NSString;
      v1 = [v4 error];
      int v2 = [v1 localizedDescription];
      [v14 stringWithFormat:@" ERROR = '%@'.", v2];
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v15 = &stru_26DF10968;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_22B807000, v11, OS_LOG_TYPE_DEFAULT, "_onQueueSync - %@ completed. %@", buf, 0x16u);
    if (v13)
    {
    }
  }

  [v4 invokeTaskCompletionBlocksWithBlock:&__block_literal_global_97];
  id v16 = [MEMORY[0x263F08A00] defaultCenter];
  [v16 postNotificationName:@"SBKUniversalPlaybackPositionStoreDidSynchronizeNotification" object:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) _onQueueStartNewTimer];
  return [*(id *)(a1 + 32) _onQueueRunNextPendingTaskBlock];
}

void __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_2_98(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 8);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_3;
  v11[3] = &unk_2648AF3F8;
  id v12 = v6;
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 40);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_3(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    id v5 = *(void **)(a1 + 40);
    if (!v5)
    {
      id v8 = (void *)MEMORY[0x263F087E8];
      id v9 = ErrorInfoWithUnderlyingError_925(*(void **)(a1 + 32));
      id v10 = [v8 errorWithDomain:@"SBKStoreErrorDomain" code:-2008 userInfo:v9];

      id v2 = v10;
      if (v10) {
        goto LABEL_2;
      }
      id v5 = *(void **)(a1 + 40);
    }
    if (!objc_msgSend(v5, "domainDisabled", v10)
      || (id v6 = (void *)MEMORY[0x263F087E8],
          ErrorInfoWithUnderlyingError_925(*(void **)(a1 + 32)),
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          [v6 errorWithDomain:@"SBKStoreErrorDomain" code:-2007 userInfo:v7],
          id v12 = (id)objc_claimAutoreleasedReturnValue(),
          v7,
          (id v2 = v12) == 0))
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 48) + 112), "beginTaskOperation", v12);
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      return;
    }
  }
LABEL_2:
  double v3 = *(void **)(*(void *)(a1 + 48) + 112);
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", 0, v2);
  [v3 finishTaskOperationWithResult:v4 error:v11];
}

void __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_5;
  block[3] = &unk_2648AF3A8;
  char v11 = a2;
  void block[4] = v6;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_5(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 112);
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  [v2 finishTaskOperationWithResult:v3 error:*(void *)(a1 + 40)];
}

void __96__SBKUniversalPlaybackPositionStore__onQueueRunTaskWithName_taskCompletionHandler_runTaskBlock___block_invoke_95(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v6 = (void (**)(id, BOOL, id))MEMORY[0x230F4DE10](a2);
  v6[2](v6, v5 == 0, v5);
}

- (void)_onQueueRunNextPendingTaskBlock
{
  id v3 = [(NSMutableArray *)self->_pendingTaskBlocks firstObject];
  if (v3)
  {
    [(NSMutableArray *)self->_pendingTaskBlocks removeObjectAtIndex:0];
    v3[2]();
  }
}

- (void)_onQueueLoadRemoteDomainVersionWithCompletionBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  lookupDomainVersionTask = self->_lookupDomainVersionTask;
  id v5 = (SBKUniversalPlaybackPositionStore *)a3;
  uint64_t v6 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (lookupDomainVersionTask)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[SBKUniversalPlaybackPositionStore _onQueueLoadRemoteDomainVersionWithCompletionBlock:]";
      __int16 v19 = 2112;
      __int16 v20 = @"domain version lookup";
      _os_log_impl(&dword_22B807000, v6, OS_LOG_TYPE_DEFAULT, "%s - %@ already in progress.  pending our completion block to be notified when it completes.", buf, 0x16u);
    }

    [(SBKAsynchronousTask *)self->_lookupDomainVersionTask addTaskCompletionBlock:v5];
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[SBKUniversalPlaybackPositionStore _onQueueLoadRemoteDomainVersionWithCompletionBlock:]";
      __int16 v19 = 2112;
      __int16 v20 = @"domain version lookup";
      _os_log_impl(&dword_22B807000, v6, OS_LOG_TYPE_DEFAULT, "%s - beginning %@...", buf, 0x16u);
    }

    id v8 = [[SBKAsynchronousTask alloc] initWithHandlerQueue:self->_queue timeout:@"SBKUPPStore LookupDomainVersion" debugDescription:20.0];
    id v9 = self->_lookupDomainVersionTask;
    self->_lookupDomainVersionTask = v8;

    [(SBKAsynchronousTask *)self->_lookupDomainVersionTask addTaskCompletionBlock:v5];
    id v10 = self;
    [(SBKAsynchronousTask *)self->_lookupDomainVersionTask setExpirationHandler:&__block_literal_global_71];
    char v11 = self->_lookupDomainVersionTask;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_2;
    v13[3] = &unk_2648AF7A8;
    uint64_t v14 = v10;
    id v15 = v10;
    id v16 = @"domain version lookup";
    id v5 = v10;
    [(SBKAsynchronousTask *)v11 setFinishedHandler:v13];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_2_83;
    v12[3] = &unk_2648AF358;
    v12[4] = v5;
    [(SBKUniversalPlaybackPositionStore *)v5 _onQueueLoadBagContextWithCompletionHandler:v12];
  }
}

void __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_2(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = *(id *)(a1[4] + 120);
  uint64_t v5 = a1[5];
  uint64_t v6 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = 0;

  [v4 setFinishedHandler:0];
  BOOL v7 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = a1[6];
    id v9 = [v4 error];
    if (v9)
    {
      id v10 = NSString;
      v1 = [v4 error];
      id v2 = [v1 localizedDescription];
      [v10 stringWithFormat:@" ERROR = '%@'.", v2];
      char v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v11 = &stru_26DF10968;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v11;
    _os_log_impl(&dword_22B807000, v7, OS_LOG_TYPE_DEFAULT, "_onQueueSync - %@ completed. %@", buf, 0x16u);
    if (v9)
    {
    }
  }

  [v4 invokeTaskCompletionBlocksWithBlock:&__block_literal_global_82];
}

void __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_2_83(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_3;
  block[3] = &unk_2648AF7A8;
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[4];
  id v3 = *(void **)(a1[5] + 120);
  if (v2)
  {
    objc_msgSend(v3, "finishTaskOperationWithResult:error:", &unk_26DF16B78);
  }
  else
  {
    [v3 beginTaskOperation];
    id v4 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22B807000, v4, OS_LOG_TYPE_DEFAULT, "_onQueueSync - synchronize operation beginning...", buf, 2u);
    }

    id v5 = [(SBKSyncRequestHandler *)[SBKLoadDomainVersionRequestHandler alloc] initWithBagContext:a1[6]];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_86;
    v7[3] = &unk_2648AF330;
    v7[4] = a1[5];
    uint64_t v8 = v5;
    id v6 = v5;
    [(SBKLoadDomainVersionRequestHandler *)v6 runWithCompletionHandler:v7];
  }
}

void __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_86(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_2_87;
  block[3] = &unk_2648AF7A8;
  void block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

void __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_2_87(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 120);
  id v3 = [*(id *)(a1 + 40) responseDomainVersion];
  [v2 finishTaskOperationWithResult:v3 error:*(void *)(a1 + 48)];
}

void __88__SBKUniversalPlaybackPositionStore__onQueueLoadRemoteDomainVersionWithCompletionBlock___block_invoke_79(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void (**)(id, id, id))MEMORY[0x230F4DE10](a2);
  v8[2](v8, v7, v6);
}

- (void)_onQueueSynchronizeWithAutosynchronizeMask:(unint64_t)a3 withCompletionBlock:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __100__SBKUniversalPlaybackPositionStore__onQueueSynchronizeWithAutosynchronizeMask_withCompletionBlock___block_invoke;
  v7[3] = &unk_2648AF298;
  id v8 = v5;
  id v6 = v5;
  [(SBKUniversalPlaybackPositionStore *)self _onQueueSynchronizeImmediatelyWithCompletionHandler:v7];
}

uint64_t __100__SBKUniversalPlaybackPositionStore__onQueueSynchronizeWithAutosynchronizeMask_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadBagContextWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __71__SBKUniversalPlaybackPositionStore_loadBagContextWithCompletionBlock___block_invoke;
    v7[3] = &unk_2648AF858;
    void v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

void __71__SBKUniversalPlaybackPositionStore_loadBagContextWithCompletionBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __71__SBKUniversalPlaybackPositionStore_loadBagContextWithCompletionBlock___block_invoke_2;
  v2[3] = &unk_2648AF2E8;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _onQueueLoadBagContextWithCompletionHandler:v2];
}

void __71__SBKUniversalPlaybackPositionStore_loadBagContextWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6 && ([v6 domainDisabled] & 1) == 0)
  {
    [*(id *)(a1 + 32) _accountForSyncing];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)loadRemoteDomainVersionWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __80__SBKUniversalPlaybackPositionStore_loadRemoteDomainVersionWithCompletionBlock___block_invoke;
    v7[3] = &unk_2648AF858;
    void v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

void __80__SBKUniversalPlaybackPositionStore_loadRemoteDomainVersionWithCompletionBlock___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __80__SBKUniversalPlaybackPositionStore_loadRemoteDomainVersionWithCompletionBlock___block_invoke_2;
  v2[3] = &unk_2648AF2C0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _onQueueLoadRemoteDomainVersionWithCompletionBlock:v2];
}

uint64_t __80__SBKUniversalPlaybackPositionStore_loadRemoteDomainVersionWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkForAvailabilityWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __77__SBKUniversalPlaybackPositionStore_checkForAvailabilityWithCompletionBlock___block_invoke;
    v7[3] = &unk_2648AF858;
    void v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

void __77__SBKUniversalPlaybackPositionStore_checkForAvailabilityWithCompletionBlock___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __77__SBKUniversalPlaybackPositionStore_checkForAvailabilityWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_2648AF2E8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _onQueueLoadBagContextWithCompletionHandler:v4];
}

void __77__SBKUniversalPlaybackPositionStore_checkForAvailabilityWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v8 && ![v8 domainDisabled])
  {
    id v7 = [*(id *)(a1 + 32) _accountForSyncing];
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v7 != 0);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

- (void)synchronizeImmediatelyWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__SBKUniversalPlaybackPositionStore_synchronizeImmediatelyWithCompletionBlock___block_invoke;
  v11[3] = &unk_2648AF298;
  id v12 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x230F4DE10](v11);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__SBKUniversalPlaybackPositionStore_synchronizeImmediatelyWithCompletionBlock___block_invoke_2;
  block[3] = &unk_2648AF858;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(queue, block);
}

uint64_t __79__SBKUniversalPlaybackPositionStore_synchronizeImmediatelyWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __79__SBKUniversalPlaybackPositionStore_synchronizeImmediatelyWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueSynchronizeImmediatelyWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)pullMetadataItemWithItemIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__SBKUniversalPlaybackPositionStore_pullMetadataItemWithItemIdentifier_completionBlock___block_invoke;
  block[3] = &unk_2648AF270;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __88__SBKUniversalPlaybackPositionStore_pullMetadataItemWithItemIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueuePullMetadataItemWithItemIdentifier:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];
}

- (void)pushMetadataItem:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__SBKUniversalPlaybackPositionStore_pushMetadataItem_completionBlock___block_invoke;
  block[3] = &unk_2648AF270;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __70__SBKUniversalPlaybackPositionStore_pushMetadataItem_completionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueuePushMetadataItem:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];
}

- (void)synchronizeImmediatelyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__SBKUniversalPlaybackPositionStore_synchronizeImmediatelyWithCompletionHandler___block_invoke;
  v7[3] = &unk_2648AF858;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __81__SBKUniversalPlaybackPositionStore_synchronizeImmediatelyWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueSynchronizeImmediatelyWithCompletionHandler:*(void *)(a1 + 40)];
}

- (BOOL)_automaticallySynchronizeOnBecomeActive
{
  return ([(SBKUniversalPlaybackPositionStore *)self automaticSynchronizeOptions] >> 1) & 1;
}

- (void)setAutomaticallySynchronizeOnBecomeActive:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(SBKUniversalPlaybackPositionStore *)self automaticSynchronizeOptions] & 0xFFFFFFFFFFFFFFFDLL;
  uint64_t v6 = 2;
  if (!v3) {
    uint64_t v6 = 0;
  }
  [(SBKUniversalPlaybackPositionStore *)self setAutomaticSynchronizeOptions:v5 | v6];
}

- (BOOL)_automaticallySynchronizeLocalChangesOnResignActive
{
  return ([(SBKUniversalPlaybackPositionStore *)self automaticSynchronizeOptions] >> 2) & 1;
}

- (void)setAutomaticallySynchronizeLocalChangesOnResignActive:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(SBKUniversalPlaybackPositionStore *)self automaticSynchronizeOptions] & 0xFFFFFFFFFFFFFFFBLL;
  uint64_t v6 = 4;
  if (!v3) {
    uint64_t v6 = 0;
  }
  [(SBKUniversalPlaybackPositionStore *)self setAutomaticSynchronizeOptions:v5 | v6];
}

- (BOOL)hasLocalChangesToSync
{
  return self->_hasLocalChangesToSync;
}

- (void)setHasLocalChangesToSync:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__SBKUniversalPlaybackPositionStore_setHasLocalChangesToSync___block_invoke;
  v4[3] = &unk_2648AF248;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __62__SBKUniversalPlaybackPositionStore_setHasLocalChangesToSync___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 17) = *(unsigned char *)(result + 40);
  return result;
}

- (unint64_t)automaticSynchronizeOptions
{
  return self->_automaticSynchronizeOptions;
}

- (void)setAutomaticSynchronizeOptions:(unint64_t)a3
{
  unint64_t automaticSynchronizeOptions = self->_automaticSynchronizeOptions;
  if (automaticSynchronizeOptions != a3)
  {
    self->_unint64_t automaticSynchronizeOptions = a3;
    if ((automaticSynchronizeOptions ^ a3)) {
      [(SBKUniversalPlaybackPositionStore *)self _onQueueUpdateTimerForAutomaticSyncOptionChanges];
    }
  }
}

- (void)resignActive
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SBKUniversalPlaybackPositionStore_resignActive__block_invoke;
  block[3] = &unk_2648AF920;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __49__SBKUniversalPlaybackPositionStore_resignActive__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 16))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 16) = 0;
    [*(id *)(result + 32) _onQueueUpdateTimerForActiveChanges];
    uint64_t result = *(void *)(v2 + 32);
    if (*(unsigned char *)(result + 17))
    {
      uint64_t result = [(id)result _automaticallySynchronizeLocalChangesOnResignActive];
      if (result)
      {
        BOOL v3 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v4 = 0;
          _os_log_impl(&dword_22B807000, v3, OS_LOG_TYPE_DEFAULT, "starting synchronizing changes for resignActive", v4, 2u);
        }

        return [*(id *)(v2 + 32) _onQueueSynchronizeWithAutosynchronizeMask:4 withCompletionBlock:&__block_literal_global_948];
      }
    }
  }
  return result;
}

void __49__SBKUniversalPlaybackPositionStore_resignActive__block_invoke_59()
{
  v0 = os_log_create("com.apple.amp.StoreBookkeeper", "UPP");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_22B807000, v0, OS_LOG_TYPE_DEFAULT, "finished synchronizing changes for resignActive", v1, 2u);
  }
}

- (void)becomeActive
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SBKUniversalPlaybackPositionStore_becomeActive__block_invoke;
  block[3] = &unk_2648AF920;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __49__SBKUniversalPlaybackPositionStore_becomeActive__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 16))
  {
    *(unsigned char *)(v1 + 16) = 1;
    return [*(id *)(result + 32) _onQueueUpdateTimerForActiveChanges];
  }
  return result;
}

- (void)_onQueueUpdateTimerForAutomaticSyncOptionChanges
{
  if (self->_isActive && (self->_automaticSynchronizeOptions & 3) != 0) {
    [(SBKUniversalPlaybackPositionStore *)self _onQueueResumeTimer];
  }
  else {
    [(SBKUniversalPlaybackPositionStore *)self _onQueueSuspendTimer];
  }
}

- (void)_onQueueUpdateTimerForActiveChanges
{
  if (self->_isActive && (self->_automaticSynchronizeOptions & 2) != 0)
  {
    if ([(SBKUniversalPlaybackPositionStore *)self _automaticallySynchronizeOnBecomeActive])
    {
      double initialAutosyncInterval = self->_initialAutosyncInterval;
      if (initialAutosyncInterval == 31536000.0) {
        double initialAutosyncInterval = 2.0;
      }
      [(SBKUniversalPlaybackPositionStore *)self _onQueueStartNewTimerWithTimeIntervalSinceNow:initialAutosyncInterval];
    }
    else
    {
      [(SBKUniversalPlaybackPositionStore *)self _onQueueResumeTimer];
    }
  }
  else
  {
    [(SBKUniversalPlaybackPositionStore *)self _onQueueSuspendTimer];
  }
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_accountsObserver];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self->_prefsObserver];

  BOOL v5 = [(SBKUniversalPlaybackPositionStore *)self bagLookupTask];
  [v5 invalidate];

  uint64_t v6 = [(SBKUniversalPlaybackPositionStore *)self currentTask];
  [v6 invalidate];

  id v7 = [(SBKUniversalPlaybackPositionStore *)self lookupDomainVersionTask];
  [v7 invalidate];

  id v8 = [(SBKUniversalPlaybackPositionStore *)self timer];
  [v8 invalidate];

  [(SBKUniversalPlaybackPositionStore *)self _onQueueSuspendTimer];
  v9.receiver = self;
  v9.super_class = (Class)SBKUniversalPlaybackPositionStore;
  [(SBKUniversalPlaybackPositionStore *)&v9 dealloc];
}

- (SBKUniversalPlaybackPositionStore)initWithInitialUpdateDelay:(double)a3
{
  id v4 = [(SBKUniversalPlaybackPositionStore *)self init];
  BOOL v5 = v4;
  if (v4)
  {
    if (a3 <= 0.0) {
      double v6 = 31536000.0;
    }
    else {
      double v6 = a3;
    }
    v4->_double initialAutosyncInterval = v6;
    v4->_unint64_t automaticSynchronizeOptions = 6;
    [(SBKUniversalPlaybackPositionStore *)v4 _updateAutorefreshRateSettingAndRestartTimer:0];
    if (v5->_initialAutosyncInterval != 31536000.0)
    {
      queue = v5->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __64__SBKUniversalPlaybackPositionStore_initWithInitialUpdateDelay___block_invoke;
      block[3] = &unk_2648AF920;
      id v10 = v5;
      dispatch_sync(queue, block);
    }
  }
  return v5;
}

uint64_t __64__SBKUniversalPlaybackPositionStore_initWithInitialUpdateDelay___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _onQueueStopTimer];
  uint64_t v2 = *(double **)(a1 + 32);
  double v3 = v2[7];
  return [v2 _onQueueStartNewTimerWithTimeIntervalSinceNow:v3];
}

- (SBKUniversalPlaybackPositionStore)init
{
  return [(SBKUniversalPlaybackPositionStore *)self initWithInitialUpdateDelay:-1.0];
}

- (SBKUniversalPlaybackPositionStore)initWithDomain:(id)a3 dataSource:(id)a4 automaticSynchronizeOptions:(unint64_t)a5 accountIdentifier:(id)a6 isActive:(BOOL)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  if (!v14)
  {
    v32 = [MEMORY[0x263F08690] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"SBKUniversalPlaybackPositionStore.m" lineNumber:100 description:@"Invalid paramter.  no domain specified"];
  }
  v38.receiver = self;
  v38.super_class = (Class)SBKUniversalPlaybackPositionStore;
  id v17 = [(SBKUniversalPlaybackPositionStore *)&v38 init];
  if (v17)
  {
    dispatch_queue_t v18 = dispatch_queue_create("SBKUniversalPlaybackPositionStore.queue", 0);
    __int16 v19 = (void *)*((void *)v17 + 1);
    *((void *)v17 + 1) = v18;

    v17[16] = a7;
    objc_storeStrong((id *)v17 + 4, a3);
    objc_storeWeak((id *)v17 + 13, v15);
    objc_storeStrong((id *)v17 + 5, a6);
    *((void *)v17 + 6) = a5;
    *(int64x2_t *)(v17 + 56) = vdupq_n_s64(0x417E133800000000uLL);
    uint64_t v20 = [MEMORY[0x263EFF980] array];
    uint64_t v21 = (void *)*((void *)v17 + 3);
    *((void *)v17 + 3) = v20;

    uint64_t v22 = [MEMORY[0x263EFF910] distantFuture];
    [v17 setDateToFireNextTimer:v22];

    [v17 _updateAutorefreshRateSettingAndRestartTimer:0];
    if (v17[48]) {
      [v17 _onQueueLoadBagContextWithCompletionHandler:0];
    }
    v23 = [MEMORY[0x263F08A00] defaultCenter];
    objc_initWeak(&location, v17);
    v24 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v25 = *MEMORY[0x263F7B440];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __118__SBKUniversalPlaybackPositionStore_initWithDomain_dataSource_automaticSynchronizeOptions_accountIdentifier_isActive___block_invoke;
    v35[3] = &unk_2648AF218;
    objc_copyWeak(&v36, &location);
    uint64_t v26 = [v23 addObserverForName:v25 object:0 queue:v24 usingBlock:v35];
    v27 = (void *)*((void *)v17 + 11);
    *((void *)v17 + 11) = v26;

    id v28 = [MEMORY[0x263F08A48] mainQueue];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __118__SBKUniversalPlaybackPositionStore_initWithDomain_dataSource_automaticSynchronizeOptions_accountIdentifier_isActive___block_invoke_2;
    v33[3] = &unk_2648AF218;
    objc_copyWeak(&v34, &location);
    uint64_t v29 = [v23 addObserverForName:@"SBKPreferencesDidChangeNotification" object:0 queue:v28 usingBlock:v33];
    v30 = (void *)*((void *)v17 + 12);
    *((void *)v17 + 12) = v29;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  return (SBKUniversalPlaybackPositionStore *)v17;
}

void __118__SBKUniversalPlaybackPositionStore_initWithDomain_dataSource_automaticSynchronizeOptions_accountIdentifier_isActive___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateForStoreAccountsChange];
    id WeakRetained = v2;
  }
}

void __118__SBKUniversalPlaybackPositionStore_initWithDomain_dataSource_automaticSynchronizeOptions_accountIdentifier_isActive___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateAutorefreshRateSettingAndRestartTimer:1];
    id WeakRetained = v2;
  }
}

- (SBKUniversalPlaybackPositionStore)initWithDomain:(id)a3 dataSource:(id)a4 automaticSynchronizeOptions:(unint64_t)a5 isActive:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = SBKStoreAccount();
  id v13 = [v12 uniqueIdentifier];
  id v14 = [(SBKUniversalPlaybackPositionStore *)self initWithDomain:v11 dataSource:v10 automaticSynchronizeOptions:a5 accountIdentifier:v13 isActive:v6];

  return v14;
}

- (void)deprecated_setDataSource:(id)a3
{
}

+ (id)keyValueStoreItemIdentifierForItem:(id)a3
{
  return +[SBKUniversalPlaybackPositionMetadata keyValueStoreItemIdentifierForItem:a3];
}

@end