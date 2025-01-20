@interface PLBackgroundJobService
+ (BOOL)_stateIsReadyForRegistration:(unint64_t)a3;
+ (BOOL)_stateIsReadyToRun:(unint64_t)a3;
+ (BOOL)_verifyActivityHandlerInvokedWithCorrectIdentifier:(id)a3 forCriteria:(id)a4;
+ (BOOL)verifyStateTransitionFromState:(unint64_t)a3 toState:(unint64_t)a4;
+ (void)_removeAllBundlesFromUserDefaultsWithoutLocking;
- (BOOL)_activityIsRegisteredForCriteria:(id)a3;
- (BOOL)_signalNeededOnBundle:(id)a3;
- (NSDictionary)statusCenterDump;
- (NSPointerArray)observers;
- (PLBackgroundJobService)init;
- (PLBackgroundJobService)initWithLibraryCoordinator:(id)a3;
- (PLBackgroundJobService)initWithLibraryCoordinator:(id)a3 statusCenter:(id)a4;
- (id)_bundlesToProcessByCriteriaShortCodesAsPathStrings;
- (id)_bundlesToProcessByCriteriaShortCodesAsPathStringsAlreadyLocked;
- (id)_getBundleRecordsFromProcessingSetForAllCriterias;
- (id)_getBundleRecordsFromProcessingSetForCriteriaShortCode:(id)a3;
- (id)stateCaptureDictionary;
- (unint64_t)serviceState;
- (void)_appendBundleRecordsToProcessingSet:(id)a3 criteriaShortCode:(id)a4;
- (void)_fireWatchdogTimerWithStartTime:(id)a3 startingPushBackTimeInterval:(double)a4 sourceDescription:(id)a5;
- (void)_invalidateSignalNeededForCrashRecoveryOnBundle:(id)a3;
- (void)_loadBundleRecordsDictionaryFromUserDefaults;
- (void)_noteSignalNeededForCrashRecoveryOnBundle:(id)a3;
- (void)_persistBundleRecordsDictionaryToUserDefaults;
- (void)_registerActivityIfNecessaryOnBundles:(id)a3;
- (void)_registerActivityWithCriteria:(id)a3;
- (void)_registerActivityWithoutCoalescingIfNecessaryOnBundle:(id)a3;
- (void)_registerBackgroundProcessingNeededForBundles:(id)a3 context:(id)a4;
- (void)_removeAllBundlesFromProcessingSet;
- (void)_removeAllBundlesFromProcessingSetForCriteriaShortCode:(id)a3;
- (void)_removeBundleRecordFromProcessingSet:(id)a3 criteriaShortCode:(id)a4;
- (void)_removeRegisteredActivityForCriteria:(id)a3;
- (void)_runActivity:(id)a3 withCriteria:(id)a4;
- (void)_setRegisteredActivityForCriteria:(id)a3;
- (void)_setRunningCriteria:(id)a3;
- (void)_setServiceState:(unint64_t)a3;
- (void)_setServiceStateOnQueue:(unint64_t)a3;
- (void)_shutdown;
- (void)_simulateXPCShouldDefer:(BOOL)a3;
- (void)_startPollingForActivityStatus;
- (void)_startPollingForActivityStatusOnQueue;
- (void)_startRunningBackgroundJobsWithCriteria:(id)a3;
- (void)_startRunningBackgroundJobsWithCriteriaOnQueue:(id)a3;
- (void)_stopPollingForActivityStatus;
- (void)_stopRunningBackgroundJobs;
- (void)_unregisterActivityIfNeededShouldConsiderDeferring:(BOOL)a3;
- (void)_unregisterActivityIfNeededShouldConsiderDeferring_enqueue:(BOOL)a3;
- (void)_updateCameraForegroundState:(BOOL)a3;
- (void)cameraWatcherDidChangeState:(id)a3;
- (void)invalidateLibraryBundle:(id)a3 completion:(id)a4;
- (void)libraryCoordinatorFinishedJobsOnAllSubmittedBundles;
- (void)libraryCoordinatorFinishedJobsOnSubmittedBundle:(id)a3 withCriteria:(id)a4;
- (void)performCrashRecoveryIfNeededOnBundle:(id)a3;
- (void)setObservers:(id)a3;
- (void)signalBackgroundProcessingNeededOnBundle:(id)a3;
- (void)signalBackgroundProcessingNeededOnLibrary:(id)a3;
- (void)startWatchdogTimerIfNeededWithSourceDescription:(id)a3;
@end

@implementation PLBackgroundJobService

- (void)_fireWatchdogTimerWithStartTime:(id)a3 startingPushBackTimeInterval:(double)a4 sourceDescription:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__33963;
  v19 = __Block_byref_object_dispose__33964;
  id v20 = 0;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  PLSafeRunWithUnfairLock();
  if (objc_msgSend(v8, "isEqual:", v16[5], v14, 3221225472, __105__PLBackgroundJobService__fireWatchdogTimerWithStartTime_startingPushBackTimeInterval_sourceDescription___block_invoke, &unk_1E5875E68, self, &v15))
  {
    v10 = [MEMORY[0x1E4F1C9C8] now];
    [v10 timeIntervalSinceDate:v8];
    uint64_t v12 = v11;

    v13 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v22 = v9;
      __int16 v23 = 2114;
      id v24 = v8;
      __int16 v25 = 2048;
      uint64_t v26 = v12;
      __int16 v27 = 2048;
      double v28 = a4;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_FAULT, "Background job service has not responded to signal from %{public}@ at %{public}@, %.1f seconds elapsed, push back interval was %.1f seconds", buf, 0x2Au);
    }
  }
  _Block_object_dispose(&v15, 8);
}

uint64_t __38__PLBackgroundJobService_serviceState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

void __105__PLBackgroundJobService__fireWatchdogTimerWithStartTime_startingPushBackTimeInterval_sourceDescription___block_invoke(uint64_t a1)
{
}

uint64_t __74__PLBackgroundJobService_startWatchdogTimerIfNeededWithSourceDescription___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fireWatchdogTimerWithStartTime:*(void *)(a1 + 40) startingPushBackTimeInterval:*(void *)(a1 + 48) sourceDescription:*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
}

- (void)cameraWatcherDidChangeState:(id)a3
{
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  uint64_t v6 = [v5 isCameraRunning];

  [(PLBackgroundJobService *)self _updateCameraForegroundState:v6];
}

- (void)_updateCameraForegroundState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  self->_BOOL cameraForeground = v3;
  unint64_t v5 = [(PLBackgroundJobService *)self serviceState];
  BOOL cameraForeground = self->_cameraForeground;
  v7 = PLBackgroundJobServiceGetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (cameraForeground)
  {
    if (v8)
    {
      if (v5 - 1 > 9) {
        id v9 = @"Unknown";
      }
      else {
        id v9 = off_1E5868998[v5 - 1];
      }
      int v16 = 138543362;
      uint64_t v17 = v9;
      uint64_t v11 = "Camera is in foreground (state: %{public}@";
LABEL_12:
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0xCu);
    }
  }
  else if (v8)
  {
    if (v5 - 1 > 9) {
      v10 = @"Unknown";
    }
    else {
      v10 = off_1E5868998[v5 - 1];
    }
    int v16 = 138543362;
    uint64_t v17 = v10;
    uint64_t v11 = "Camera is in background (state: %{public}@";
    goto LABEL_12;
  }

  if (v3 || v5 != 5)
  {
    if (v3 && v5 == 6)
    {
      BOOL deferringService = self->_deferringService;
      uint64_t v14 = PLBackgroundJobServiceGetLog();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (deferringService)
      {
        if (v15)
        {
          int v16 = 138543362;
          uint64_t v17 = @"Running";
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Not pausing even though we're in %{public}@ state and Camera came to foreground because _deferringService is set which indicates that we're already in the middle of pausing", (uint8_t *)&v16, 0xCu);
        }
      }
      else
      {
        if (v15)
        {
          int v16 = 138543362;
          uint64_t v17 = @"Running";
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Pausing since we're in %{public}@ state and Camera came to foreground. Going to defer by calling _stopRunningBackgroundJobs", (uint8_t *)&v16, 0xCu);
        }

        [(PLBackgroundJobService *)self _stopRunningBackgroundJobs];
      }
    }
  }
  else
  {
    uint64_t v12 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Calling register again since we were paused before Camera went to background", (uint8_t *)&v16, 2u);
    }

    [(PLBackgroundJobService *)self _registerActivityWithCriteria:self->_pausedCriteria];
  }
}

- (unint64_t)serviceState
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  PLRunWithUnfairLock();
  unint64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_watchdogTimerLock_watchdogTimerSourceDescription, 0);
  objc_storeStrong((id *)&self->_watchdogTimerLock_dateOfWatchdogTimerStart, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandler, 0);
  objc_storeStrong((id *)&self->_simulateXpcActivityDeferring, 0);
  objc_storeStrong((id *)&self->_runningXPCActivityDeferTimer, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_bundlesToProcessByCriteriaShortCode, 0);
  objc_storeStrong((id *)&self->_libraryInvalidationCompletionHandlerByLibraryURL, 0);
  objc_storeStrong((id *)&self->_cameraWatcher, 0);
  objc_storeStrong((id *)&self->_registrationCoalescer, 0);
  objc_storeStrong((id *)&self->_pausedCriteria, 0);
  objc_storeStrong((id *)&self->_runningCriteria, 0);
  objc_storeStrong((id *)&self->_libraryCoordinator, 0);
  objc_storeStrong((id *)&self->_statusCenter, 0);
  objc_storeStrong((id *)&self->_runningXPCActivity, 0);
  objc_storeStrong((id *)&self->_registeredXPCActivities, 0);
}

- (void)setObservers:(id)a3
{
}

- (NSPointerArray)observers
{
  return self->_observers;
}

- (id)stateCaptureDictionary
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = [(PLBackgroundJobService *)self statusCenterDump];
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v4 = +[PLBackgroundJobCriteria allKnownCriterias];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v4);
        }
        BOOL v8 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v9 = [v8 shortCode];
        v10 = [(PLBackgroundJobService *)self _getBundleRecordsFromProcessingSetForCriteriaShortCode:v9];

        uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        uint64_t v12 = [v8 name];
        [v3 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v5);
  }

  uint64_t v24 = 0;
  __int16 v25 = &v24;
  uint64_t v26 = 0x3032000000;
  __int16 v27 = __Block_byref_object_copy__33963;
  double v28 = __Block_byref_object_dispose__33964;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__33963;
  id v22 = __Block_byref_object_dispose__33964;
  id v23 = 0;
  PLSafeRunWithUnfairLock();
  unint64_t v13 = [(PLBackgroundJobService *)self serviceState];
  uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
  [v14 setObject:v17 forKeyedSubscript:@"statusCenter"];
  if (v13 - 1 > 9) {
    BOOL v15 = @"Unknown";
  }
  else {
    BOOL v15 = off_1E5868998[v13 - 1];
  }
  [v14 setObject:v15 forKeyedSubscript:@"state"];
  [v14 setObject:v3 forKeyedSubscript:@"criteria"];
  [v14 setObject:v25[5] forKeyedSubscript:@"watchdogTimerStartDate"];
  [v14 setObject:v19[5] forKeyedSubscript:@"watchdogTimerSource"];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __48__PLBackgroundJobService_stateCaptureDictionary__block_invoke(void *a1)
{
  v1 = *(void **)(a1[4] + 168);
  if (v1)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v1);
    BOOL v3 = *(void **)(a1[4] + 184);
    uint64_t v4 = (id *)(*(void *)(a1[6] + 8) + 40);
    objc_storeStrong(v4, v3);
  }
}

- (void)libraryCoordinatorFinishedJobsOnAllSubmittedBundles
{
  BOOL v3 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Library coordinator reported all background jobs finished running on all bundles", buf, 2u);
  }

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PLBackgroundJobService_libraryCoordinatorFinishedJobsOnAllSubmittedBundles__block_invoke;
  block[3] = &unk_1E5875CE0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

void __77__PLBackgroundJobService_libraryCoordinatorFinishedJobsOnAllSubmittedBundles__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _setServiceStateOnQueue:7];
  unint64_t v2 = [*(id *)(a1 + 32) _getBundleRecordsFromProcessingSetForAllCriterias];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 128))
  {
    int v4 = [*(id *)(v3 + 48) shouldDeferActivity];
    uint64_t v3 = *(void *)(a1 + 32);
    if (v4)
    {
      [(id)v3 _stopPollingForActivityStatus];
      *(unsigned char *)(*(void *)(a1 + 32) + 128) = 1;
      uint64_t v5 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "_libraryCoordinator says we should defer but _deferringService flag NOT set! Going to set _deferringService & immediately shutting down...", buf, 2u);
      }

      uint64_t v3 = *(void *)(a1 + 32);
    }
  }
  if (*(unsigned char *)(v3 + 128))
  {
    uint64_t v6 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "_deferringService flag set! NOT removing any bundle records & immediately shutting down...", buf, 2u);
    }

LABEL_10:
    [*(id *)(a1 + 32) _shutdown];
    goto LABEL_38;
  }
  uint64_t v7 = [v2 count];
  BOOL v8 = PLBackgroundJobServiceGetLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Processing bundle set is empty, shutting down...", buf, 2u);
    }

    [*(id *)(a1 + 32) _removeAllBundlesFromProcessingSet];
    goto LABEL_10;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Checking all bundles if they have more work to do before considering shutdown", buf, 2u);
  }

  [*(id *)(a1 + 32) _stopPollingForActivityStatus];
  v10 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Removing all bundles from processing set", buf, 2u);
  }

  [*(id *)(a1 + 32) _removeAllBundlesFromProcessingSet];
  uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 48) pendingJobsOnBundles:v2];
  if ([v11 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          if (objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "isEqual:", *(void *)(*(void *)(a1 + 32) + 56), (void)v24))
          {

            v19 = PLBackgroundJobServiceGetLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v20 = [*(id *)(*(void *)(a1 + 32) + 56) name];
              *(_DWORD *)buf = 138543362;
              id v29 = v20;
              _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Bundle has more work to do at the same criteria %{public}@. Calling _startRunningBackgroundJobsWithCriteriaAlreadyLocked right away!", buf, 0xCu);
            }
            [*(id *)(a1 + 32) _startPollingForActivityStatusOnQueue];
            v21 = *(id **)(a1 + 32);
            id v22 = [v21[7] shortCode];
            [v21 _appendBundleRecordsToProcessingSet:v2 criteriaShortCode:v22];

            [*(id *)(a1 + 32) _startRunningBackgroundJobsWithCriteriaOnQueue:*(void *)(*(void *)(a1 + 32) + 56)];
            goto LABEL_37;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    uint64_t v17 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 56) name];
      *(_DWORD *)buf = 138543362;
      id v29 = v18;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Bundle has more work to do but we're currently running at %{public}@ criteria and the new work is at another criteria. Unregistering current activity and calling _registerActivityIfNecessaryOnBundles", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _unregisterActivityIfNeededShouldConsiderDeferring:0];
    [*(id *)(a1 + 32) _removeRegisteredActivityForCriteria:*(void *)(*(void *)(a1 + 32) + 56)];
    [*(id *)(a1 + 32) _registerActivityIfNecessaryOnBundles:v2];
  }
  else
  {
    id v23 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "All bundles report no further work to do. Really shutting down...", buf, 2u);
    }

    [*(id *)(a1 + 32) _shutdown];
  }
LABEL_37:

LABEL_38:
}

- (void)libraryCoordinatorFinishedJobsOnSubmittedBundle:(id)a3 withCriteria:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [v7 name];
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Library coordinator reported all background jobs finished on bundle %@ with criteria %{public}@", buf, 0x16u);
  }
  isolationQueue = self->_isolationQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__PLBackgroundJobService_libraryCoordinatorFinishedJobsOnSubmittedBundle_withCriteria___block_invoke;
  v12[3] = &unk_1E5875E18;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  dispatch_async(isolationQueue, v12);
}

void __87__PLBackgroundJobService_libraryCoordinatorFinishedJobsOnSubmittedBundle_withCriteria___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = *(void **)(*(void *)(a1 + 32) + 88);
  uint64_t v3 = [*(id *)(a1 + 40) libraryURL];
  int v4 = [v2 objectForKeyedSubscript:v3];

  if ([v4 count])
  {
    uint64_t v5 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v6;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Calling library invalidation completionHandler(s) for bundle %@", buf, 0xCu);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v17 + 1) + 8 * v11));
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    id v12 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "mutableCopy", (void)v17);
    id v13 = [*(id *)(a1 + 40) libraryURL];
    [v12 setObject:0 forKeyedSubscript:v13];

    uint64_t v14 = [v12 copy];
    uint64_t v15 = *(void *)(a1 + 32);
    __int16 v16 = *(void **)(v15 + 88);
    *(void *)(v15 + 88) = v14;
  }
}

- (id)_getBundleRecordsFromProcessingSetForAllCriterias
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_bundlesToProcessByCriteriaShortCodeLock = &self->_bundlesToProcessByCriteriaShortCodeLock;
  os_unfair_lock_lock(&self->_bundlesToProcessByCriteriaShortCodeLock);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = +[PLBackgroundJobCriteria allKnownShortCodes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [(NSDictionary *)self->_bundlesToProcessByCriteriaShortCode objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        uint64_t v11 = [v10 allObjects];
        [v4 addObjectsFromArray:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_bundlesToProcessByCriteriaShortCodeLock);
  id v12 = (void *)[v4 copy];

  return v12;
}

- (id)_getBundleRecordsFromProcessingSetForCriteriaShortCode:(id)a3
{
  p_bundlesToProcessByCriteriaShortCodeLock = &self->_bundlesToProcessByCriteriaShortCodeLock;
  id v5 = a3;
  os_unfair_lock_lock(p_bundlesToProcessByCriteriaShortCodeLock);
  LogBundlesToProcessByCriteria(self->_bundlesToProcessByCriteriaShortCode, 0);
  uint64_t v6 = [(NSDictionary *)self->_bundlesToProcessByCriteriaShortCode objectForKeyedSubscript:v5];

  uint64_t v7 = (void *)[v6 copy];
  os_unfair_lock_unlock(p_bundlesToProcessByCriteriaShortCodeLock);
  return v7;
}

- (void)_removeAllBundlesFromProcessingSet
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_bundlesToProcessByCriteriaShortCodeLock = &self->_bundlesToProcessByCriteriaShortCodeLock;
  os_unfair_lock_lock(&self->_bundlesToProcessByCriteriaShortCodeLock);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = +[PLBackgroundJobCriteria allKnownShortCodes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        [v4 setObject:v11 forKeyedSubscript:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = (NSDictionary *)[v4 copy];
  bundlesToProcessByCriteriaShortCode = self->_bundlesToProcessByCriteriaShortCode;
  self->_bundlesToProcessByCriteriaShortCode = v12;

  LogBundlesToProcessByCriteria(self->_bundlesToProcessByCriteriaShortCode, 0);
  [(PLBackgroundJobService *)self _persistBundleRecordsDictionaryToUserDefaults];
  os_unfair_lock_unlock(p_bundlesToProcessByCriteriaShortCodeLock);
}

- (void)_removeAllBundlesFromProcessingSetForCriteriaShortCode:(id)a3
{
  p_bundlesToProcessByCriteriaShortCodeLock = &self->_bundlesToProcessByCriteriaShortCodeLock;
  id v5 = a3;
  os_unfair_lock_lock(p_bundlesToProcessByCriteriaShortCodeLock);
  id v6 = [(NSDictionary *)self->_bundlesToProcessByCriteriaShortCode objectForKeyedSubscript:v5];

  [v6 removeAllObjects];
  LogBundlesToProcessByCriteria(self->_bundlesToProcessByCriteriaShortCode, 0);
  [(PLBackgroundJobService *)self _persistBundleRecordsDictionaryToUserDefaults];
  os_unfair_lock_unlock(p_bundlesToProcessByCriteriaShortCodeLock);
}

- (void)_removeBundleRecordFromProcessingSet:(id)a3 criteriaShortCode:(id)a4
{
  p_bundlesToProcessByCriteriaShortCodeLock = &self->_bundlesToProcessByCriteriaShortCodeLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_bundlesToProcessByCriteriaShortCodeLock);
  id v9 = [(NSDictionary *)self->_bundlesToProcessByCriteriaShortCode objectForKeyedSubscript:v7];

  [v9 removeObject:v8];
  LogBundlesToProcessByCriteria(self->_bundlesToProcessByCriteriaShortCode, 0);
  [(PLBackgroundJobService *)self _persistBundleRecordsDictionaryToUserDefaults];
  os_unfair_lock_unlock(p_bundlesToProcessByCriteriaShortCodeLock);
}

- (void)_appendBundleRecordsToProcessingSet:(id)a3 criteriaShortCode:(id)a4
{
  p_bundlesToProcessByCriteriaShortCodeLock = &self->_bundlesToProcessByCriteriaShortCodeLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_bundlesToProcessByCriteriaShortCodeLock);
  id v9 = [(NSDictionary *)self->_bundlesToProcessByCriteriaShortCode objectForKeyedSubscript:v7];

  [v9 unionSet:v8];
  LogBundlesToProcessByCriteria(self->_bundlesToProcessByCriteriaShortCode, 0);
  [(PLBackgroundJobService *)self _persistBundleRecordsDictionaryToUserDefaults];
  os_unfair_lock_unlock(p_bundlesToProcessByCriteriaShortCodeLock);
}

- (void)_loadBundleRecordsDictionaryFromUserDefaults
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_t lock = &self->_bundlesToProcessByCriteriaShortCodeLock;
  os_unfair_lock_lock(&self->_bundlesToProcessByCriteriaShortCodeLock);
  unint64_t v2 = +[PLPhotoLibraryBundleController sharedBundleController];
  uint64_t v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70__PLBackgroundJobService__loadBundleRecordsDictionaryFromUserDefaults__block_invoke;
  v24[3] = &unk_1E5868978;
  id v15 = v2;
  id v25 = v15;
  uint64_t v3 = (void (**)(void, void))MEMORY[0x19F38D650](v24);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = +[PLBackgroundJobCriteria allKnownShortCodes];
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v10 = [NSString stringWithFormat:@"%@%@", @"PLBackgroundJobServiceBundleRecordsKeyWithShortCode", v9];
        id v11 = [v19 objectForKey:v10];
        id v12 = ((void (**)(void, void *))v3)[2](v3, v11);

        [v4 setObject:v12 forKeyedSubscript:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }

  id v13 = (NSDictionary *)[v4 copy];
  bundlesToProcessByCriteriaShortCode = self->_bundlesToProcessByCriteriaShortCode;
  self->_bundlesToProcessByCriteriaShortCode = v13;

  os_unfair_lock_unlock(lock);
}

id __70__PLBackgroundJobService__loadBundleRecordsDictionaryFromUserDefaults__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", *(void *)(*((void *)&v13 + 1) + 8 * i), 1, (void)v13);
        id v11 = [*(id *)(a1 + 32) bundleForLibraryURL:v10];
        if (v11) {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_persistBundleRecordsDictionaryToUserDefaults
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_bundlesToProcessByCriteriaShortCodeLock);
  id v3 = [(PLBackgroundJobService *)self _bundlesToProcessByCriteriaShortCodesAsPathStringsAlreadyLocked];
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = +[PLBackgroundJobCriteria allKnownShortCodes];
  uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [NSString stringWithFormat:@"%@%@", @"PLBackgroundJobServiceBundleRecordsKeyWithShortCode", v9];
        id v11 = [v3 objectForKeyedSubscript:v9];
        id v12 = [v11 allObjects];
        [v4 setObject:v12 forKey:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (id)_bundlesToProcessByCriteriaShortCodesAsPathStringsAlreadyLocked
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_bundlesToProcessByCriteriaShortCodeLock);
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = +[PLBackgroundJobCriteria allKnownShortCodes];
  uint64_t v2 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v6 = [(NSDictionary *)self->_bundlesToProcessByCriteriaShortCode objectForKeyedSubscript:v5];
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v29;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v29 != v11) {
                objc_enumerationMutation(v8);
              }
              long long v13 = *(void **)(*((void *)&v28 + 1) + 8 * j);
              long long v14 = [v13 libraryURL];

              if (v14)
              {
                long long v15 = [v13 libraryURL];
                long long v16 = [v15 path];
                [v7 addObject:v16];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
          }
          while (v10);
        }

        long long v17 = (void *)[v7 copy];
        [v23 setObject:v17 forKeyedSubscript:v5];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v3);
  }

  uint64_t v18 = (void *)[v23 copy];
  return v18;
}

- (id)_bundlesToProcessByCriteriaShortCodesAsPathStrings
{
  p_bundlesToProcessByCriteriaShortCodeLock = &self->_bundlesToProcessByCriteriaShortCodeLock;
  os_unfair_lock_lock(&self->_bundlesToProcessByCriteriaShortCodeLock);
  id v4 = [(PLBackgroundJobService *)self _bundlesToProcessByCriteriaShortCodesAsPathStringsAlreadyLocked];
  os_unfair_lock_unlock(p_bundlesToProcessByCriteriaShortCodeLock);
  return v4;
}

- (void)_startRunningBackgroundJobsWithCriteriaOnQueue:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  [(PLBackgroundJobService *)self _setServiceStateOnQueue:6];
  uint64_t v5 = [v4 shortCode];
  id v6 = [(PLBackgroundJobService *)self _getBundleRecordsFromProcessingSetForCriteriaShortCode:v5];

  id v7 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v4 name];
    int v9 = 138543618;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Running criteria %{public}@ background jobs on bundles %@", (uint8_t *)&v9, 0x16u);
  }
  [(PLBackgroundJobLibraryCoordinator *)self->_libraryCoordinator startBackgroundJobsOnBundles:v6 withCriteria:v4];
}

- (void)_startRunningBackgroundJobsWithCriteria:(id)a3
{
  id v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PLBackgroundJobService__startRunningBackgroundJobsWithCriteria___block_invoke;
  v7[3] = &unk_1E5875E18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(isolationQueue, v7);
}

uint64_t __66__PLBackgroundJobService__startRunningBackgroundJobsWithCriteria___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startRunningBackgroundJobsWithCriteriaOnQueue:*(void *)(a1 + 40)];
}

- (void)_stopPollingForActivityStatus
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  runningXPCActivityDeferTimer = self->_runningXPCActivityDeferTimer;
  if (runningXPCActivityDeferTimer)
  {
    if (self->_deferringService)
    {
      dispatch_resume(runningXPCActivityDeferTimer);
      runningXPCActivityDeferTimer = self->_runningXPCActivityDeferTimer;
    }
    dispatch_source_cancel(runningXPCActivityDeferTimer);
    id v4 = self->_runningXPCActivityDeferTimer;
    self->_runningXPCActivityDeferTimer = 0;
  }
}

- (void)_stopRunningBackgroundJobs
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  self->_BOOL deferringService = 1;
  runningXPCActivityDeferTimer = self->_runningXPCActivityDeferTimer;
  if (runningXPCActivityDeferTimer) {
    dispatch_suspend(runningXPCActivityDeferTimer);
  }
  if ((MEMORY[0x19F38C0C0]() & 1) == 0) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  }
  id v4 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Trying to stop running background jobs on all bundles", v5, 2u);
  }

  [(PLBackgroundJobLibraryCoordinator *)self->_libraryCoordinator stopBackgroundJobsOnAllBundles];
}

- (void)_startPollingForActivityStatusOnQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (self->_runningXPCActivityDeferTimer)
  {
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PLBackgroundJobService.m" lineNumber:785 description:@"timer is not nil"];
  }
  if (self->_simulateXpcActivityDeferring
    || (runningXPCActivity = self->_runningXPCActivity) != 0 && xpc_activity_get_state(runningXPCActivity) == 4)
  {
    id v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_isolationQueue);
    runningXPCActivityDeferTimer = self->_runningXPCActivityDeferTimer;
    self->_runningXPCActivityDeferTimer = v4;

    dispatch_source_set_timer((dispatch_source_t)self->_runningXPCActivityDeferTimer, 0, 0x77359400uLL, 0x77359400uLL);
    id v6 = self->_runningXPCActivityDeferTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __63__PLBackgroundJobService__startPollingForActivityStatusOnQueue__block_invoke;
    handler[3] = &unk_1E5875CE0;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume((dispatch_object_t)self->_runningXPCActivityDeferTimer);
  }
  else
  {
    id v8 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "_startPollingForActivityStatus called with nil _runningXPCActivity or an _xpcActivity is non-Continue state. Ignoring.", buf, 2u);
    }
  }
}

uint64_t __63__PLBackgroundJobService__startPollingForActivityStatusOnQueue__block_invoke(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 128)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = *(_xpc_activity_s **)(v1 + 16);
  if (!v3)
  {
    if ([*(id *)(v1 + 136) BOOLValue]) {
      goto LABEL_4;
    }
LABEL_6:
    result = [*(id *)(*(void *)(v2 + 32) + 48) shouldDeferActivity];
    if (!result) {
      return result;
    }
    id v4 = @"Worker";
    goto LABEL_8;
  }
  if (!xpc_activity_should_defer(v3)) {
    goto LABEL_6;
  }
LABEL_4:
  id v4 = @"DAS";
LABEL_8:
  uint64_t v5 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Calling _stopRunningBackgroundJobs because %{public}@ told us to defer!", (uint8_t *)&v6, 0xCu);
  }

  return [*(id *)(v2 + 32) _stopRunningBackgroundJobs];
}

- (void)_startPollingForActivityStatus
{
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PLBackgroundJobService__startPollingForActivityStatus__block_invoke;
  block[3] = &unk_1E5875CE0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

uint64_t __56__PLBackgroundJobService__startPollingForActivityStatus__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startPollingForActivityStatusOnQueue];
}

- (void)_unregisterActivityIfNeededShouldConsiderDeferring:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (v3 && self->_deferringService)
  {
    runningXPCActivity = self->_runningXPCActivity;
    if (runningXPCActivity && !xpc_activity_set_state(runningXPCActivity, 3))
    {
      int v6 = (void *)xpc_activity_copy_identifier();
      id v7 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136446210;
        __int16 v11 = v6;
        uint64_t v8 = "Unable to update background job service activity %{public}s state to defer";
LABEL_11:
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v10, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    int v9 = self->_runningXPCActivity;
    if (v9 && !xpc_activity_set_state(v9, 5))
    {
      int v6 = (void *)xpc_activity_copy_identifier();
      id v7 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136446210;
        __int16 v11 = v6;
        uint64_t v8 = "Unable to update background job service activity %{public}s state to done";
        goto LABEL_11;
      }
LABEL_12:

      free(v6);
    }
  }
}

- (void)_unregisterActivityIfNeededShouldConsiderDeferring_enqueue:(BOOL)a3
{
  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__PLBackgroundJobService__unregisterActivityIfNeededShouldConsiderDeferring_enqueue___block_invoke;
  v4[3] = &unk_1E58748B0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(isolationQueue, v4);
}

uint64_t __85__PLBackgroundJobService__unregisterActivityIfNeededShouldConsiderDeferring_enqueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unregisterActivityIfNeededShouldConsiderDeferring:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_runActivity:(id)a3 withCriteria:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = (_xpc_activity_s *)a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  xpc_activity_state_t state = xpc_activity_get_state(v7);
  if (state == 2)
  {
    xpc_object_t v12 = xpc_activity_copy_criteria(v7);
    string = xpc_dictionary_get_string(v12, (const char *)*MEMORY[0x1E4F142C8]);

    long long v14 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = [v8 name];
      qos_class_self();
      long long v16 = PLStringFromQoSClass();
      int v35 = 138543874;
      uint64_t v36 = (uint64_t)v15;
      __int16 v37 = 2082;
      v38 = (void *)string;
      __int16 v39 = 2114;
      v40 = v16;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Background Job Service asked to run criteria %{public}@ at priority %{public}s, QOS %{public}@", (uint8_t *)&v35, 0x20u);
    }
    unint64_t v17 = [(PLBackgroundJobService *)self serviceState];
    int v18 = [(id)objc_opt_class() _verifyActivityHandlerInvokedWithCorrectIdentifier:v7 forCriteria:v8];
    int v19 = [(id)objc_opt_class() _stateIsReadyToRun:v17];
    long long v20 = [v8 shortCode];
    uint64_t v21 = [(PLBackgroundJobService *)self _getBundleRecordsFromProcessingSetForCriteriaShortCode:v20];

    if (v18)
    {
      BOOL cameraForeground = self->_cameraForeground;
      if (self->_cameraForeground) {
        int v23 = 0;
      }
      else {
        int v23 = v19;
      }
      if (v23 == 1)
      {
        if ([v21 count])
        {
          self->_BOOL deferringService = 0;
          if (MEMORY[0x19F38C0C0]())
          {
LABEL_50:

            goto LABEL_51;
          }
          if (xpc_activity_set_state(v7, 4))
          {
            [(PLBackgroundJobService *)self _removeRegisteredActivityForCriteria:v8];
            objc_storeStrong((id *)&self->_runningXPCActivity, a3);
            objc_storeStrong((id *)&self->_runningCriteria, a4);
            [(PLBackgroundJobService *)self _startPollingForActivityStatusOnQueue];
            [(PLBackgroundJobService *)self _startRunningBackgroundJobsWithCriteriaOnQueue:v8];
            goto LABEL_50;
          }
          long long v26 = PLBackgroundJobServiceGetLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v35) = 0;
            long long v27 = "Unable to update background job service activity state to continue";
            goto LABEL_30;
          }
LABEL_31:

          goto LABEL_50;
        }
        BOOL cameraForeground = self->_cameraForeground;
      }
      if (cameraForeground)
      {
        long long v28 = PLBackgroundJobServiceGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "Telling XPC we're done because Camera is active", (uint8_t *)&v35, 2u);
        }

        if (!xpc_activity_set_state(v7, 5))
        {
          [(PLBackgroundJobService *)self _removeRegisteredActivityForCriteria:v8];
          long long v29 = PLBackgroundJobServiceGetLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v35) = 0;
            _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Unable to update background job service activity state to done", (uint8_t *)&v35, 2u);
          }
        }
        [(PLBackgroundJobService *)self _setServiceStateOnQueue:5];
        objc_storeStrong((id *)&self->_pausedCriteria, a4);
      }
      else
      {
        [(PLBackgroundJobService *)self _removeRegisteredActivityForCriteria:v8];
        long long v30 = PLBackgroundJobServiceGetLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          uint64_t v31 = [v8 name];
          long long v32 = (void *)v31;
          if (v17 - 1 > 9) {
            long long v33 = @"Unknown";
          }
          else {
            long long v33 = off_1E5868998[v17 - 1];
          }
          int v35 = 138543618;
          uint64_t v36 = v31;
          __int16 v37 = 2114;
          v38 = v33;
          _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "Background Job Service is not in a runnable state for criteria %{public}@. It's in %{public}@. Skipping calls to _startRunningBackgroundJobs for this activity. XPC Activity execution ends here for this activity. Removing all bundles from processing set for this criteria", (uint8_t *)&v35, 0x16u);
        }
        if ((MEMORY[0x19F38C0C0]() & 1) == 0)
        {
          uint64_t v34 = [v8 shortCode];
          [(PLBackgroundJobService *)self _removeAllBundlesFromProcessingSetForCriteriaShortCode:v34];
        }
      }
      goto LABEL_50;
    }
    if (xpc_activity_set_state(v7, 5))
    {
      [(PLBackgroundJobService *)self _removeRegisteredActivityForCriteria:v8];
      long long v26 = PLBackgroundJobServiceGetLog();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      LOWORD(v35) = 0;
      long long v27 = "Setting activity state to DONE from RUN state because activity is not valid at this time";
    }
    else
    {
      long long v26 = PLBackgroundJobServiceGetLog();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      LOWORD(v35) = 0;
      long long v27 = "Unable to update background job service activity state to done";
    }
LABEL_30:
    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v35, 2u);
    goto LABEL_31;
  }
  xpc_activity_state_t v10 = state;
  if (state)
  {
    __int16 v11 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      long long v24 = [v8 name];
      int v35 = 134218242;
      uint64_t v36 = v10;
      __int16 v37 = 2114;
      v38 = v24;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_FAULT, "Unexpected XPC activity state: %ld for job %{public}@", (uint8_t *)&v35, 0x16u);
    }
    goto LABEL_27;
  }
  [(PLBackgroundJobService *)self _setRegisteredActivityForCriteria:v8];
  if (![(id)objc_opt_class() _verifyActivityHandlerInvokedWithCorrectIdentifier:v7 forCriteria:v8])
  {
    if (xpc_activity_set_state(v7, 5))
    {
      [(PLBackgroundJobService *)self _removeRegisteredActivityForCriteria:v8];
      __int16 v11 = PLBackgroundJobServiceGetLog();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      LOWORD(v35) = 0;
      long long v25 = "Setting activity state to DONE at CHECK_IN because activity is not valid at this time";
    }
    else
    {
      __int16 v11 = PLBackgroundJobServiceGetLog();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      LOWORD(v35) = 0;
      long long v25 = "Unable to update background job service activity state to done";
    }
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v35, 2u);
    goto LABEL_27;
  }
  __int16 v11 = [v8 xpcCriteria];
  xpc_activity_set_criteria(v7, v11);
LABEL_27:

LABEL_51:
}

- (void)_registerBackgroundProcessingNeededForBundles:(id)a3 context:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v8 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Registration coalescer action handler called", buf, 2u);
  }

  uint64_t v40 = MEMORY[0x1E4F143A8];
  uint64_t v41 = 3221225472;
  v42 = __80__PLBackgroundJobService__registerBackgroundProcessingNeededForBundles_context___block_invoke;
  v43 = &unk_1E5875CE0;
  v44 = self;
  PLSafeRunWithUnfairLock();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v37;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v9);
        }
        [(PLBackgroundJobService *)self _noteSignalNeededForCrashRecoveryOnBundle:*(void *)(*((void *)&v36 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v10);
  }

  unint64_t v13 = [(PLBackgroundJobService *)self serviceState];
  if ([(id)objc_opt_class() _stateIsReadyForRegistration:v13])
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    long long v33 = __80__PLBackgroundJobService__registerBackgroundProcessingNeededForBundles_context___block_invoke_2;
    uint64_t v34 = &unk_1E5875CE0;
    int v35 = self;
    PLSafeRunWithUnfairLock();
    [(PLBackgroundJobService *)self _registerActivityIfNecessaryOnBundles:v9];
    [v7 delayNextInvocationByTimeInterval:2.0];
  }
  else
  {
    *(void *)buf = 0;
    long long v28 = buf;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    int v23 = __80__PLBackgroundJobService__registerBackgroundProcessingNeededForBundles_context___block_invoke_3;
    long long v24 = &unk_1E5875E68;
    long long v25 = self;
    long long v26 = buf;
    PLSafeRunWithUnfairLock();
    if (fabs(*((double *)v28 + 3) + -4096.0) < 2.22044605e-16)
    {
      long long v14 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        if (v13 - 1 > 9) {
          long long v15 = @"Unknown";
        }
        else {
          long long v15 = off_1E5868998[v13 - 1];
        }
        *(_DWORD *)v45 = 138543362;
        v46 = v15;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_FAULT, "Coalescer wants to register but service has been stuck in %{public}@ state for too long", v45, 0xCu);
      }
    }
    long long v16 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if (v13 - 1 > 9) {
        unint64_t v17 = @"Unknown";
      }
      else {
        unint64_t v17 = off_1E5868998[v13 - 1];
      }
      uint64_t v18 = *((void *)v28 + 3);
      *(_DWORD *)v45 = 138543618;
      v46 = v17;
      __int16 v47 = 2048;
      uint64_t v48 = v18;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Coalescer told us to register but we're still in %{public}@. Telling Coalescer to push back for %.1f seconds", v45, 0x16u);
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__PLBackgroundJobService__registerBackgroundProcessingNeededForBundles_context___block_invoke_121;
    v19[3] = &unk_1E5868928;
    id v20 = v9;
    [v7 pushBack:v19];
    [v7 delayNextInvocationByTimeInterval:*((double *)v28 + 3)];
    [(PLBackgroundJobService *)self startWatchdogTimerIfNeededWithSourceDescription:@"push back"];

    _Block_object_dispose(buf, 8);
  }
}

void __80__PLBackgroundJobService__registerBackgroundProcessingNeededForBundles_context___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 168);
  *(void *)(v1 + 168) = 0;
}

uint64_t __80__PLBackgroundJobService__registerBackgroundProcessingNeededForBundles_context___block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 176) = 0x4000000000000000;
  return result;
}

double __80__PLBackgroundJobService__registerBackgroundProcessingNeededForBundles_context___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 176);
  uint64_t v1 = *(void *)(a1 + 32);
  double result = *(double *)(v1 + 176);
  if (result < 4096.0)
  {
    double result = result + result;
    *(double *)(v1 + 176) = result;
  }
  return result;
}

uint64_t __80__PLBackgroundJobService__registerBackgroundProcessingNeededForBundles_context___block_invoke_121(uint64_t a1, void *a2)
{
  return [a2 unionSet:*(void *)(a1 + 32)];
}

- (void)_registerActivityWithCriteria:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if ([(PLBackgroundJobService *)self _activityIsRegisteredForCriteria:v4]
    || MEMORY[0x19F38C0C0]())
  {
    if (MEMORY[0x19F38C0C0]())
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      BOOL v5 = self->_observers;
      uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v26 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              uint64_t v11 = [v4 shortCode];
              [v10 backgroundJobServiceDidRegisterCriteriaShortCode:v11];
            }
          }
          uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v25 objects:v31 count:16];
        }
        while (v7);
      }
    }
    else
    {
      PLBackgroundJobServiceGetLog();
      BOOL v5 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = [v4 name];
        *(_DWORD *)buf = 138543362;
        uint64_t v30 = v12;
        _os_log_impl(&dword_19B3C7000, &v5->super, OS_LOG_TYPE_DEBUG, "Skip registering %{public}@ criteria since this activity is already registered according to _registeredXPCActivities", buf, 0xCu);
      }
    }

    [(PLBackgroundJobService *)self _setServiceStateOnQueue:4];
  }
  else
  {
    unint64_t v13 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = [v4 name];
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v14;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Registering %{public}@ background job xpc activity", buf, 0xCu);
    }
    id v15 = [v4 activityIdentifier];
    long long v16 = (const char *)[v15 UTF8String];

    unint64_t v17 = (void *)*MEMORY[0x1E4F14158];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __56__PLBackgroundJobService__registerActivityWithCriteria___block_invoke;
    uint64_t v22 = &unk_1E5868950;
    int v23 = self;
    id v18 = v4;
    id v24 = v18;
    xpc_activity_register(v16, v17, &v19);
    -[PLBackgroundJobStatusCenter recordActivityRegisteredWithCriteria:](self->_statusCenter, "recordActivityRegisteredWithCriteria:", v18, v19, v20, v21, v22, v23);
    [(PLBackgroundJobService *)self _setServiceStateOnQueue:4];
  }
}

void __56__PLBackgroundJobService__registerActivityWithCriteria___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(NSObject **)(v4 + 112);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PLBackgroundJobService__registerActivityWithCriteria___block_invoke_2;
  block[3] = &unk_1E5873A50;
  block[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_sync(v5, block);
}

uint64_t __56__PLBackgroundJobService__registerActivityWithCriteria___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runActivity:*(void *)(a1 + 40) withCriteria:*(void *)(a1 + 48)];
}

- (void)_registerActivityIfNecessaryOnBundles:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  BOOL v5 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "-[PLBackgroundJobService _registerActivityIfNecessaryOnBundles:]";
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "%s called", buf, 0xCu);
  }

  [(PLBackgroundJobService *)self _setServiceStateOnQueue:2];
  id v6 = [(PLBackgroundJobLibraryCoordinator *)self->_libraryCoordinator pendingJobsOnBundles:v4];
  if ([v6 count])
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v45 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v44 + 1) + 8 * i) shortCode];
          [(PLBackgroundJobService *)self _appendBundleRecordsToProcessingSet:v4 criteriaShortCode:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v50 count:16];
      }
      while (v9);
    }
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v13 = +[PLBackgroundJobCriteria allKnownCriterias];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (!v14)
  {

LABEL_32:
    long long v28 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "No work to do at any criteria. Removing all bundles from processing set.", buf, 2u);
    }

    [(PLBackgroundJobService *)self _setServiceStateOnQueue:3];
    [(PLBackgroundJobService *)self _removeAllBundlesFromProcessingSet];
    goto LABEL_35;
  }
  uint64_t v15 = v14;
  id v34 = v4;
  int v35 = v6;
  char v16 = 0;
  uint64_t v17 = *(void *)v41;
  do
  {
    for (uint64_t j = 0; j != v15; ++j)
    {
      if (*(void *)v41 != v17) {
        objc_enumerationMutation(v13);
      }
      uint64_t v19 = *(void **)(*((void *)&v40 + 1) + 8 * j);
      uint64_t v20 = objc_msgSend(v19, "shortCode", v34, v35);
      uint64_t v21 = [(PLBackgroundJobService *)self _getBundleRecordsFromProcessingSetForCriteriaShortCode:v20];

      if ([v21 count])
      {
        [(PLBackgroundJobService *)self _registerActivityWithCriteria:v19];
        char v16 = 1;
      }
      else if (self->_needsActivityUnregistrationOnFirstLaunch)
      {
        uint64_t v22 = PLBackgroundJobServiceGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = [v19 name];
          *(_DWORD *)buf = 138543362;
          v52 = v23;
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Unregistering %{public}@ background job since it has no work to do on first launch", buf, 0xCu);
        }
        id v24 = [v19 activityIdentifier];
        xpc_activity_unregister((const char *)[v24 UTF8String]);

        self->_needsActivityUnregistrationOnFirstLaunch = 0;
      }
      else if ([(PLBackgroundJobService *)self _activityIsRegisteredForCriteria:v19])
      {
        long long v25 = PLBackgroundJobServiceGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          long long v26 = [v19 name];
          *(_DWORD *)buf = 138543362;
          v52 = v26;
          _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "Unregistering %{public}@ background job since it has no work to do and an activity has been registered", buf, 0xCu);
        }
        id v27 = [v19 activityIdentifier];
        xpc_activity_unregister((const char *)[v27 UTF8String]);

        [(PLBackgroundJobService *)self _removeRegisteredActivityForCriteria:v19];
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v49 count:16];
  }
  while (v15);

  id v4 = v34;
  id v6 = v35;
  if ((v16 & 1) == 0) {
    goto LABEL_32;
  }
LABEL_35:
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v29 = v4;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(v29);
        }
        [(PLBackgroundJobService *)self _invalidateSignalNeededForCrashRecoveryOnBundle:*(void *)(*((void *)&v36 + 1) + 8 * k)];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v31);
  }
}

- (void)_registerActivityWithoutCoalescingIfNecessaryOnBundle:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  BOOL v5 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[PLBackgroundJobService _registerActivityWithoutCoalescingIfNecessaryOnBundle:]";
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "%s called", buf, 0xCu);
  }

  isolationQueue = self->_isolationQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__PLBackgroundJobService__registerActivityWithoutCoalescingIfNecessaryOnBundle___block_invoke;
  v8[3] = &unk_1E5875E18;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(isolationQueue, v8);
}

void __80__PLBackgroundJobService__registerActivityWithoutCoalescingIfNecessaryOnBundle___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
  [v1 _registerActivityIfNecessaryOnBundles:v2];
}

- (void)startWatchdogTimerIfNeededWithSourceDescription:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v23 = 0;
  id v24 = (double *)&v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  char v16 = __74__PLBackgroundJobService_startWatchdogTimerIfNeededWithSourceDescription___block_invoke;
  uint64_t v17 = &unk_1E586C518;
  id v18 = self;
  id v6 = v5;
  id v19 = v6;
  id v7 = v4;
  id v20 = v7;
  uint64_t v21 = &v27;
  uint64_t v22 = &v23;
  PLSafeRunWithUnfairLock();
  if (*((unsigned char *)v28 + 24))
  {
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)((v24[3] + 600.0) * 1000000000.0));
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PLBackgroundJobService_startWatchdogTimerIfNeededWithSourceDescription___block_invoke_2;
    block[3] = &unk_1E5875368;
    block[4] = self;
    id v11 = v6;
    unint64_t v13 = &v23;
    id v12 = v7;
    dispatch_after(v8, isolationQueue, block);
  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

double __74__PLBackgroundJobService_startWatchdogTimerIfNeededWithSourceDescription___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 168))
  {
    objc_storeStrong((id *)(v2 + 168), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), *(id *)(a1 + 48));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  double result = *(double *)(v2 + 176);
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  return result;
}

- (void)signalBackgroundProcessingNeededOnBundle:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  BOOL v5 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [MEMORY[0x1E4F29060] callStackSymbols];
      *(_DWORD *)buf = 136315394;
      unint64_t v13 = "-[PLBackgroundJobService signalBackgroundProcessingNeededOnBundle:]";
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "%s called by stack %@", buf, 0x16u);
    }
  }
  [(PLBackgroundJobService *)self startWatchdogTimerIfNeededWithSourceDescription:@"bundle"];
  registrationCoalescer = self->_registrationCoalescer;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__PLBackgroundJobService_signalBackgroundProcessingNeededOnBundle___block_invoke;
  v10[3] = &unk_1E5868928;
  id v11 = v4;
  id v9 = v4;
  [(PFCoalescer *)registrationCoalescer update:v10];
}

uint64_t __67__PLBackgroundJobService_signalBackgroundProcessingNeededOnBundle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (void)signalBackgroundProcessingNeededOnLibrary:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  BOOL v5 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v12 = 136315394;
      unint64_t v13 = "-[PLBackgroundJobService signalBackgroundProcessingNeededOnLibrary:]";
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "%s called by stack %@", (uint8_t *)&v12, 0x16u);
    }
  }
  dispatch_time_t v8 = [v4 managedObjectContext];
  if ([v8 hasChanges])
  {
    id v9 = [v4 managedObjectContext];
    [v9 recordNeedsBackgroundJobProcessing];

    [(PLBackgroundJobService *)self startWatchdogTimerIfNeededWithSourceDescription:@"library"];
  }
  else
  {
    uint64_t v10 = [v4 libraryServicesManager];
    id v11 = [v10 libraryBundle];
    [(PLBackgroundJobService *)self signalBackgroundProcessingNeededOnBundle:v11];
  }
}

- (void)performCrashRecoveryIfNeededOnBundle:(id)a3
{
  id v4 = a3;
  if (-[PLBackgroundJobService _signalNeededOnBundle:](self, "_signalNeededOnBundle:")) {
    [(PLBackgroundJobService *)self signalBackgroundProcessingNeededOnBundle:v4];
  }
}

- (BOOL)_signalNeededOnBundle:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLBackgroundJobService _signalNeededOnBundle:]", a3);
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 globalValues];
    char v6 = [v5 backgroundJobServiceNeedsProcessing];
  }
  else
  {
    id v7 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[PLBackgroundJobService _signalNeededOnBundle:]";
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failed to initialize photolibrary in %s", (uint8_t *)&v9, 0xCu);
    }

    char v6 = 0;
  }

  return v6;
}

- (void)_invalidateSignalNeededForCrashRecoveryOnBundle:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLBackgroundJobService _invalidateSignalNeededForCrashRecoveryOnBundle:]", a3);
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 globalValues];
    [v5 setBackgroundJobServiceNeedsProcessing:0];
  }
  else
  {
    BOOL v5 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      id v7 = "-[PLBackgroundJobService _invalidateSignalNeededForCrashRecoveryOnBundle:]";
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize photolibrary in %s", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_noteSignalNeededForCrashRecoveryOnBundle:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLBackgroundJobService _noteSignalNeededForCrashRecoveryOnBundle:]", a3);
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 globalValues];
    [v5 setBackgroundJobServiceNeedsProcessing:1];
  }
  else
  {
    BOOL v5 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      id v7 = "-[PLBackgroundJobService _noteSignalNeededForCrashRecoveryOnBundle:]";
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize photolibrary in %s", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_removeRegisteredActivityForCriteria:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  registeredXPCActivities = self->_registeredXPCActivities;
  int v6 = [v4 shortCode];
  [(NSMutableSet *)registeredXPCActivities removeObject:v6];

  id v7 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v4 name];
    int v9 = self->_registeredXPCActivities;
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    unint64_t v13 = v9;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Removed criteria %{public}@, currently registered criteria short codes: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)_setRegisteredActivityForCriteria:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  registeredXPCActivities = self->_registeredXPCActivities;
  int v6 = [v4 shortCode];
  [(NSMutableSet *)registeredXPCActivities addObject:v6];

  id v7 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v4 name];
    int v9 = self->_registeredXPCActivities;
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    unint64_t v13 = v9;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Added criteria %{public}@, currently registered criteria short codes: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (BOOL)_activityIsRegisteredForCriteria:(id)a3
{
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  registeredXPCActivities = self->_registeredXPCActivities;
  id v7 = [v5 shortCode];

  LOBYTE(registeredXPCActivities) = [(NSMutableSet *)registeredXPCActivities containsObject:v7];
  return (char)registeredXPCActivities;
}

- (void)_setServiceStateOnQueue:(unint64_t)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __50__PLBackgroundJobService__setServiceStateOnQueue___block_invoke;
  uint64_t v26 = &unk_1E5873ED8;
  uint64_t v27 = self;
  long long v28 = &v30;
  unint64_t v29 = a3;
  uint64_t v5 = PLRunWithUnfairLock();
  if (MEMORY[0x19F38BDA0](v5)
    && ([(id)objc_opt_class() verifyStateTransitionFromState:v31[3] toState:a3] & 1) == 0)
  {
    int v6 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      unint64_t v7 = v31[3] - 1;
      if (v7 > 9) {
        uint64_t v8 = @"Unknown";
      }
      else {
        uint64_t v8 = off_1E5868998[v7];
      }
      if (a3 - 1 > 9) {
        int v9 = @"Unknown";
      }
      else {
        int v9 = off_1E5868998[a3 - 1];
      }
      *(_DWORD *)buf = 138543618;
      long long v36 = v8;
      __int16 v37 = 2114;
      long long v38 = v9;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_FAULT, "Unexpected state transition detected from %{public}@ to %{public}@", buf, 0x16u);
    }
  }
  int v10 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v11 = v31[3] - 1;
    if (v11 > 9) {
      __int16 v12 = @"Unknown";
    }
    else {
      __int16 v12 = off_1E5868998[v11];
    }
    if (a3 - 1 > 9) {
      unint64_t v13 = @"Unknown";
    }
    else {
      unint64_t v13 = off_1E5868998[a3 - 1];
    }
    *(_DWORD *)buf = 138543618;
    long long v36 = v12;
    __int16 v37 = 2114;
    long long v38 = v13;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Background Job Service state change from %{public}@ to %{public}@", buf, 0x16u);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v14 = self->_observers;
  uint64_t v15 = [(NSPointerArray *)v14 countByEnumeratingWithState:&v19 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = *(void **)(*((void *)&v19 + 1) + 8 * v17);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v18, "backgroundJobServiceDidChangeStateFrom:to:", v31[3], a3, (void)v19);
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSPointerArray *)v14 countByEnumeratingWithState:&v19 objects:v34 count:16];
    }
    while (v15);
  }

  _Block_object_dispose(&v30, 8);
}

void *__50__PLBackgroundJobService__setServiceStateOnQueue___block_invoke(void *result)
{
  *(void *)(*(void *)(result[5] + 8) + 24) = *(void *)(result[4] + 32);
  *(void *)(result[4] + 32) = result[6];
  return result;
}

- (void)_setServiceState:(unint64_t)a3
{
  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__PLBackgroundJobService__setServiceState___block_invoke;
  v4[3] = &unk_1E5873348;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(isolationQueue, v4);
}

uint64_t __43__PLBackgroundJobService__setServiceState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setServiceStateOnQueue:*(void *)(a1 + 40)];
}

- (void)_setRunningCriteria:(id)a3
{
  id v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PLBackgroundJobService__setRunningCriteria___block_invoke;
  v7[3] = &unk_1E5875E18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(isolationQueue, v7);
}

void __46__PLBackgroundJobService__setRunningCriteria___block_invoke(uint64_t a1)
{
}

- (NSDictionary)statusCenterDump
{
  return [(PLBackgroundJobStatusCenter *)self->_statusCenter statusDumpDictionary];
}

- (void)invalidateLibraryBundle:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v6 libraryURL];
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v9;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Invalidate library called on bundle: %@", buf, 0xCu);
  }
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PLBackgroundJobService_invalidateLibraryBundle_completion___block_invoke;
  block[3] = &unk_1E5874868;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(isolationQueue, block);
}

void __61__PLBackgroundJobService_invalidateLibraryBundle_completion___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) serviceState];
  if (v2 != 6)
  {
    id v3 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "System is not in running state, no work to invalidate", buf, 2u);
    }
  }
  id v4 = [*(id *)(a1 + 32) _getBundleRecordsFromProcessingSetForAllCriterias];
  uint64_t v5 = v4;
  if (v2 != 6) {
    goto LABEL_27;
  }
  char v6 = [v4 containsObject:*(void *)(a1 + 40)];
  id v7 = PLBackgroundJobServiceGetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) == 0)
  {
    if (v8)
    {
      long long v28 = *(__CFString **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      int v35 = v28;
      __int16 v36 = 2112;
      __int16 v37 = v5;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Bundle %@ is not in processing queue %@, no work to invalidate", buf, 0x16u);
    }

LABEL_27:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_32;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Calling _stopRunningBackgroundJobs in response to library invalidation", buf, 2u);
  }

  int v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 88) mutableCopy];
  int v10 = [*(id *)(a1 + 40) libraryURL];
  id v11 = [v9 objectForKeyedSubscript:v10];
  id v12 = (id)[v11 mutableCopy];

  if (!v12) {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  unint64_t v13 = (void *)MEMORY[0x19F38D650](*(void *)(a1 + 48));
  [v12 addObject:v13];

  id v14 = [*(id *)(a1 + 40) libraryURL];
  [v9 setObject:v12 forKeyedSubscript:v14];

  uint64_t v15 = [v9 copy];
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void **)(v16 + 88);
  *(void *)(v16 + 88) = v15;

  uint64_t v18 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    long long v19 = *(__CFString **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    int v35 = v19;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Removing bundle from processing sets: %@", buf, 0xCu);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v20 = +[PLBackgroundJobCriteria allKnownShortCodes];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(a1 + 32) _removeBundleRecordFromProcessingSet:*(void *)(a1 + 40) criteriaShortCode:*(void *)(*((void *)&v29 + 1) + 8 * v24++)];
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v22);
  }

  int v25 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 128);
  uint64_t v26 = PLBackgroundJobServiceGetLog();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      *(_DWORD *)buf = 138412290;
      int v35 = @"Running";
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "Not calling _stopRunningBackgroundJobs even though we're in invalidateLibraryBundle because _deferringService is set which indicates that we're already in the middle of stopping. State: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v27)
    {
      *(_DWORD *)buf = 138412290;
      int v35 = @"Running";
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "Going to call _stopRunningBackgroundJobs during library invalidation. State: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) _stopRunningBackgroundJobs];
  }

LABEL_32:
}

- (void)_shutdown
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  [(PLBackgroundJobService *)self _setServiceStateOnQueue:8];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionary];
  libraryInvalidationCompletionHandlerByLibraryURL = self->_libraryInvalidationCompletionHandlerByLibraryURL;
  self->_libraryInvalidationCompletionHandlerByLibraryURL = v3;

  [(PLBackgroundJobService *)self _stopPollingForActivityStatus];
  [(PLBackgroundJobService *)self _unregisterActivityIfNeededShouldConsiderDeferring:1];
  if (self->_deferringService) {
    uint64_t v5 = 9;
  }
  else {
    uint64_t v5 = 10;
  }
  [(PLBackgroundJobService *)self _setServiceStateOnQueue:v5];
  char v6 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Successfully shutdown BackgroundJobService", buf, 2u);
  }

  self->_BOOL deferringService = 0;
  simulateXpcActivityDeferring = self->_simulateXpcActivityDeferring;
  self->_simulateXpcActivityDeferring = 0;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v8 = self->_observers;
  uint64_t v9 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v13, "backgroundJobServiceDidShutdown", (void)v14);
        }
      }
      uint64_t v10 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)_simulateXPCShouldDefer:(BOOL)a3
{
  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PLBackgroundJobService__simulateXPCShouldDefer___block_invoke;
  v4[3] = &unk_1E58748B0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(isolationQueue, v4);
}

void __50__PLBackgroundJobService__simulateXPCShouldDefer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 136);
  *(void *)(v3 + 136) = v2;
}

- (PLBackgroundJobService)initWithLibraryCoordinator:(id)a3 statusCenter:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)PLBackgroundJobService;
  uint64_t v10 = [(PLBackgroundJobService *)&v36 init];
  if (v10)
  {
    if ((PLIsAssetsd() & 1) == 0 && (MEMORY[0x19F38C0C0]() & 1) == 0)
    {
      uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
      id v34 = NSStringFromSelector(a2);
      [v33 handleFailureInMethod:a2, v10, @"PLBackgroundJobService.m", 116, @"%@ can only be called from assetsd", v34 object file lineNumber description];
    }
    uint64_t v11 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "BackgroundJobService starting up", buf, 2u);
    }

    id v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    registeredXPCActivities = v10->_registeredXPCActivities;
    v10->_registeredXPCActivities = v12;

    v10->_stateLock._os_unfair_lock_opaque = 0;
    v10->_stateLock_xpc_activity_state_t state = 1;
    v10->_needsActivityUnregistrationOnFirstLaunch = 1;
    objc_storeStrong((id *)&v10->_libraryCoordinator, a3);
    [(PLBackgroundJobLibraryCoordinator *)v10->_libraryCoordinator setDelegate:v10];
    objc_storeStrong((id *)&v10->_statusCenter, a4);
    uint64_t v14 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    observers = v10->_observers;
    v10->_observers = (NSPointerArray *)v14;

    if (MEMORY[0x19F38BDA0]()) {
      [(NSPointerArray *)v10->_observers addPointer:v10->_statusCenter];
    }
    v10->_bundlesToProcessByCriteriaShortCodeLock._os_unfair_lock_opaque = 0;
    long long v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.photos.backgroundjobservice.isolationqueue", v17);
    isolationQueue = v10->_isolationQueue;
    v10->_isolationQueue = (OS_dispatch_queue *)v18;

    v10->_watchdogTimerLock_registrationCoalescerPushBackTimeInterval = 2.0;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionary];
    libraryInvalidationCompletionHandlerByLibraryURL = v10->_libraryInvalidationCompletionHandlerByLibraryURL;
    v10->_libraryInvalidationCompletionHandlerByLibraryURL = (NSDictionary *)v20;

    [(PLBackgroundJobService *)v10 _loadBundleRecordsDictionaryFromUserDefaults];
    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileslideshow"];
    uint64_t v23 = [v22 BOOLForKey:@"AllowBackgroundWorkWithForegroundCamera"];
    if ((v23 & 1) == 0)
    {
      uint64_t v24 = [objc_alloc(MEMORY[0x1E4F8CBE8]) initWithDispatchQueue:v10->_isolationQueue delegate:v10];
      cameraWatcher = v10->_cameraWatcher;
      v10->_cameraWatcher = (PFCameraViewfinderSessionWatcher *)v24;

      uint64_t v23 = [(PFCameraViewfinderSessionWatcher *)v10->_cameraWatcher startWatching];
    }
    if (!MEMORY[0x19F38BDA0](v23)
      || ([MEMORY[0x1E4F1CB18] standardUserDefaults],
          uint64_t v26 = objc_claimAutoreleasedReturnValue(),
          char v27 = [v26 BOOLForKey:@"PLDisableBackgroundJobServiceActivityRegistration"],
          v26,
          (v27 & 1) == 0))
    {
      uint64_t v28 = [MEMORY[0x1E4F8A220] setCoalescerWithLabel:@"com.apple.photos.backgroundjobservice.registrationcoalescer" target:v10 queue:v10->_isolationQueue action:&__block_literal_global_34140];
      registrationCoalescer = v10->_registrationCoalescer;
      v10->_registrationCoalescer = (PFCoalescer *)v28;
    }
    v10->_watchdogTimerLock._os_unfair_lock_opaque = 0;
    uint64_t v30 = [objc_alloc(MEMORY[0x1E4F8A228]) initWithProvider:v10];
    stateCaptureHandler = v10->_stateCaptureHandler;
    v10->_stateCaptureHandler = (PFStateCaptureHandler *)v30;
  }
  return v10;
}

uint64_t __66__PLBackgroundJobService_initWithLibraryCoordinator_statusCenter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_registerBackgroundProcessingNeededForBundles:context:");
}

- (PLBackgroundJobService)initWithLibraryCoordinator:(id)a3
{
  return [(PLBackgroundJobService *)self initWithLibraryCoordinator:a3 statusCenter:0];
}

- (PLBackgroundJobService)init
{
  if (MEMORY[0x19F38BDA0](self, a2)) {
    uint64_t v3 = objc_alloc_init(PLBackgroundJobStatusCenter);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = [[PLBackgroundJobLibraryCoordinator alloc] initWithStatusCenter:v3];
  BOOL v5 = [(PLBackgroundJobService *)self initWithLibraryCoordinator:v4 statusCenter:v3];

  return v5;
}

+ (void)_removeAllBundlesFromUserDefaultsWithoutLocking
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = +[PLBackgroundJobCriteria allKnownShortCodes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [NSString stringWithFormat:@"%@%@", @"PLBackgroundJobServiceBundleRecordsKeyWithShortCode", *(void *)(*((void *)&v9 + 1) + 8 * v7)];
        [v2 removeObjectForKey:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

+ (BOOL)_verifyActivityHandlerInvokedWithCorrectIdentifier:(id)a3 forCriteria:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  uint64_t v5 = (void *)xpc_activity_copy_identifier();
  uint64_t v6 = [NSString stringWithUTF8String:v5];
  free(v5);
  uint64_t v7 = [v4 activityIdentifier];

  char v8 = [v7 isEqualToString:v6];
  if ((v8 & 1) == 0)
  {
    long long v9 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543618;
      long long v12 = v6;
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Told to run activity %{public}@ but we were expecting criteria %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  return v8;
}

+ (BOOL)_stateIsReadyToRun:(unint64_t)a3
{
  return (a3 > 0xA) | (0x210u >> a3) & 1;
}

+ (BOOL)_stateIsReadyForRegistration:(unint64_t)a3
{
  return (a3 < 0xB) & (0x63Au >> a3);
}

+ (BOOL)verifyStateTransitionFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  switch(a3)
  {
    case 0uLL:
      BOOL v4 = a4 == 1;
      goto LABEL_29;
    case 1uLL:
      BOOL v4 = (a4 & 0xFFFFFFFFFFFFFFFBLL) == 2;
      goto LABEL_29;
    case 2uLL:
      unint64_t v6 = a4 - 3;
      goto LABEL_21;
    case 3uLL:
      BOOL v4 = a4 == 8 || a4 == 2;
      goto LABEL_29;
    case 4uLL:
      BOOL v4 = a4 == 2 || (a4 & 0xFFFFFFFFFFFFFFFDLL) == 4 || a4 == 5;
      goto LABEL_29;
    case 5uLL:
      BOOL v4 = a4 == 4;
      goto LABEL_29;
    case 6uLL:
      BOOL v4 = a4 == 7;
      goto LABEL_29;
    case 7uLL:
      BOOL v4 = a4 == 8 || (a4 & 0xFFFFFFFFFFFFFFFBLL) == 2;
      goto LABEL_29;
    case 8uLL:
      unint64_t v6 = a4 - 9;
LABEL_21:
      BOOL v8 = v6 >= 2;
      goto LABEL_25;
    case 9uLL:
      BOOL v8 = a4 != 2 && a4 - 5 >= 2;
LABEL_25:
      BOOL result = !v8;
      break;
    case 0xAuLL:
      BOOL v4 = a4 == 2;
LABEL_29:
      BOOL result = v4;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

@end