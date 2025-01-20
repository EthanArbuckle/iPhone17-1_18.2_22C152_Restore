@interface TRITaskQueue
- ($A5A652246548B43F8BC05201A1C72A70)_addTask:(id)a3 options:(id)a4 guardedData:(id)a5 taskId:(id *)a6 tryRunningEligibleTasksImmediately:(BOOL)a7;
- ($A5A652246548B43F8BC05201A1C72A70)_addTask:(id)a3 options:(id)a4 guardedData:(id)a5 taskIdOut:(id *)a6 accumulatedNewTaskRecords:(id)a7;
- ($A5A652246548B43F8BC05201A1C72A70)_addTask:(id)a3 options:(id)a4 taskId:(id *)a5 tryRunningEligibleTasksImmediately:(BOOL)a6;
- ($A5A652246548B43F8BC05201A1C72A70)addTask:(id)a3 options:(id)a4;
- ($A5A652246548B43F8BC05201A1C72A70)addTask:(id)a3 options:(id)a4 taskId:(id *)a5;
- (BOOL)_cancelDependenciesAndTaskWithId:(id)a3 guardedData:(id)a4;
- (BOOL)_cancelTask:(id)a3 guardedData:(id)a4;
- (BOOL)_cancelTaskWithId:(id)a3 guardedData:(id)a4 persistCancel:(BOOL)a5;
- (BOOL)_isTaskWithId:(id)a3 inTaskGroup:(id)a4 runnableGivenCapabilities:(unint64_t)a5 atDate:(id)a6 cachedRunnability:(id)a7 visitedPath:(id)a8 topoSortedRunnable:(id)a9 allowOnlyRootTasksRunnable:(BOOL)a10;
- (BOOL)_removeTaskWithId:(id)a3 guardedData:(id)a4 persistRemove:(BOOL)a5;
- (BOOL)cancelTask:(id)a3;
- (BOOL)cancelTasksWithTag:(id)a3;
- (BOOL)cancelTasksWithTag:(id)a3 excludingTasks:(id)a4;
- (BOOL)enumerateTasksWithTagsIntersectingTagSet:(id)a3 block:(id)a4;
- (BOOL)finishXPCActivitiesWithGuardedData:(id)a3;
- (BOOL)ifNotPresentAddTask:(id)a3;
- (BOOL)updateActivity:(id)a3 withStartDate:(id)a4;
- (TRITaskQueue)initWithServerContext:(id)a3 operationQueue:(id)a4 operationGroup:(id)a5 asyncQueue:(id)a6;
- (id)_addTask:(id)a3 withDependencies:(id)a4 guardedData:(id)a5;
- (id)_createOperationWithTask:(id)a3 withId:(id)a4 dependencies:(id)a5 taskMap:(id)a6;
- (id)_earliestStartDateFromTaskList:(id)a3;
- (id)_runTask:(id)a3;
- (id)activeActivityDescriptorGrantingCapability:(unint64_t)a3;
- (id)activeActivityGrantingCapability:(unint64_t)a3;
- (id)debugDescription;
- (unint64_t)count;
- (void)_evaluateRunConditionsWithGuardedData:(id)a3 shouldContinueWork:(BOOL *)a4;
- (void)_finalizeTask:(id)a3 withId:(id)a4 runResult:(id)a5;
- (void)_partitionTaskGroup:(id)a3 byRunnabilityGivenCapabilities:(unint64_t)a4 runnableAtDate:(id)a5 topoSortedCurrentlyRunnable:(id *)a6 blocked:(id *)a7 allowOnlyRootTasksRunnable:(BOOL)a8;
- (void)_registerRetryActivityForDate:(id)a3;
- (void)_registerTaskQueueActivityForDate:(id)a3;
- (void)_scheduleFutureActivitiesWithGuardedData:(id)a3;
- (void)_startImmediateTasksIfNotAlreadyQueued:(id)a3 guardedData:(id)a4 didStartNewWork:(BOOL *)a5;
- (void)_startRunnableTasksIfNecessaryWithGuardedData:(id)a3;
- (void)registerFinalizeBlock:(id)a3;
- (void)registerFinalizeBlockToRetryWithBlock:(id)a3;
- (void)resumeWithXPCActivityDescriptor:(id)a3 executeWhenSuspended:(id)a4;
- (void)waitForAsyncQueue;
@end

@implementation TRITaskQueue

- (TRITaskQueue)initWithServerContext:(id)a3 operationQueue:(id)a4 operationGroup:(id)a5 asyncQueue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"TRITaskQueue.m", 106, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    if (v13)
    {
LABEL_3:
      if (v12) {
        goto LABEL_4;
      }
LABEL_10:
      v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:a2, self, @"TRITaskQueue.m", 108, @"Invalid parameter not satisfying: %@", @"operationQueue" object file lineNumber description];

      if (v14) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2, self, @"TRITaskQueue.m", 107, @"Invalid parameter not satisfying: %@", @"operationGroup" object file lineNumber description];

  if (!v12) {
    goto LABEL_10;
  }
LABEL_4:
  if (v14) {
    goto LABEL_5;
  }
LABEL_11:
  v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"TRITaskQueue.m", 109, @"Invalid parameter not satisfying: %@", @"asyncQueue" object file lineNumber description];

LABEL_5:
  v35.receiver = self;
  v35.super_class = (Class)TRITaskQueue;
  v15 = [(TRITaskQueue *)&v35 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_serverContext, v11);
    objc_storeStrong((id *)&v16->_opQueue, a4);
    objc_storeStrong((id *)&v16->_opGroup, a5);
    objc_storeStrong((id *)&v16->_asyncQueue, a6);
    uint64_t v17 = objc_opt_new();
    *(unsigned char *)(v17 + 8) = 0;
    uint64_t v18 = [v11 taskDatabase];
    v19 = *(void **)(v17 + 16);
    *(void *)(v17 + 16) = v18;

    uint64_t v20 = objc_opt_new();
    v21 = *(void **)(v17 + 24);
    *(void *)(v17 + 24) = v20;

    uint64_t v22 = objc_opt_new();
    v23 = *(void **)(v17 + 48);
    *(void *)(v17 + 48) = v22;

    *(void *)(v17 + 40) = 0;
    uint64_t v24 = objc_opt_new();
    v25 = *(void **)(v17 + 64);
    *(void *)(v17 + 64) = v24;

    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v17];
    lock = v16->_lock;
    v16->_lock = (_PASLock *)v26;

    uint64_t v28 = [v11 client];
    client = v16->_client;
    v16->_client = (TRIClient *)v28;
  }
  return v16;
}

- (void)registerFinalizeBlock:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__TRITaskQueue_registerFinalizeBlock___block_invoke;
  v7[3] = &unk_1E6BBC490;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __38__TRITaskQueue_registerFinalizeBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 64);
  id v3 = (id)MEMORY[0x1E016EA80](*(void *)(a1 + 32));
  [v2 addObject:v3];
}

- (BOOL)finishXPCActivitiesWithGuardedData:(id)a3
{
  id v4 = (id *)a3;
  uint64_t v5 = [v4[3] count];
  id v6 = TRILogCategory_Server();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "handleQueueEmptyNotificationWithGuardedData called but queue not complete processing work", buf, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "task queue has completed", buf, 2u);
    }

    notify_post("com.apple.trial.TaskQueueComplete");
    id v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "Remove all finalizeBlocks", buf, 2u);
    }

    [v4[8] removeAllObjects];
    id v9 = (id)[(TRIClient *)self->_client _refresh:0];
    id v10 = v4[6];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__TRITaskQueue_finishXPCActivitiesWithGuardedData___block_invoke;
    v12[3] = &unk_1E6BBC4B8;
    v12[4] = self;
    [v10 enumerateKeysAndObjectsUsingBlock:v12];
    v4[5] = 0;
    [v4[6] removeAllObjects];
    [(TRITaskQueue *)self _scheduleFutureActivitiesWithGuardedData:v4];
  }

  return v5 == 0;
}

void __51__TRITaskQueue_finishXPCActivitiesWithGuardedData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 futureCompletionStatus];
  BOOL v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__TRITaskQueue_finishXPCActivitiesWithGuardedData___block_invoke_2;
  v9[3] = &unk_1E6BB8450;
  id v10 = v5;
  uint64_t v11 = v6;
  id v8 = v5;
  dispatch_async(v7, v9);
}

void __51__TRITaskQueue_finishXPCActivitiesWithGuardedData___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completion];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)_scheduleFutureActivitiesWithGuardedData:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = +[TRILaunchDaemonActivityDescriptor taskQueueDescriptor];
  v29[0] = v5;
  uint64_t v6 = +[TRILaunchDaemonActivityDescriptor retryFailuresDescriptor];
  v29[1] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];

  id obj = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v13 = (void *)v4[2];
        uint64_t v14 = [v12 supportedTaskCapabilities];
        v15 = [MEMORY[0x1E4F1C9C8] distantFuture];
        v16 = [v13 dependencyFreeTasksForAllowedCapabilities:v14 dateForRunnability:v15];

        id v23 = 0;
        id v24 = 0;
        if (v16)
        {
          uint64_t v17 = [v12 supportedTaskCapabilities];
          uint64_t v18 = [MEMORY[0x1E4F1C9C8] distantFuture];
          [(TRITaskQueue *)self _partitionTaskGroup:v16 byRunnabilityGivenCapabilities:v17 runnableAtDate:v18 topoSortedCurrentlyRunnable:&v24 blocked:&v23 allowOnlyRootTasksRunnable:1];

          if ([v24 count])
          {
            v19 = [(TRITaskQueue *)self _earliestStartDateFromTaskList:v24];
            uint64_t v20 = +[TRILaunchDaemonActivityDescriptor taskQueueDescriptor];
            int v21 = [v12 isEqualToLaunchDaemonActivityDescriptor:v20];

            if (v21) {
              [(TRITaskQueue *)self _registerTaskQueueActivityForDate:v19];
            }
            else {
              [(TRITaskQueue *)self _registerRetryActivityForDate:v19];
            }
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }
}

- (id)_earliestStartDateFromTaskList:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) startDate];
        if (v9)
        {
          if (!v6
            || ([v6 timeIntervalSinceReferenceDate],
                double v11 = v10,
                [v9 timeIntervalSinceReferenceDate],
                v11 > v12))
          {
            id v13 = v9;

            uint64_t v6 = v13;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_evaluateRunConditionsWithGuardedData:(id)a3 shouldContinueWork:(BOOL *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (id *)a3;
  if (!*((unsigned char *)v5 + 8))
  {
    objc_super v35 = a4;
    *a4 = 1;
    uint64_t v6 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v7 = v5[6];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v13 = [v12 shouldDefer];
          int v14 = v13[2]();

          if (v14)
          {
            long long v15 = TRILogCategory_Server();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              long long v16 = [v12 name];
              *(_DWORD *)buf = 138543362;
              v45 = v16;
              _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "Deferral requested for activity %{public}@", buf, 0xCu);
            }
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v9);
    }

    if ([v6 count])
    {
      uint64_t v17 = [v6 count];
      if (v17 == [v5[6] count]) {
        *objc_super v35 = 0;
      }
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v18 = v6;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * j);
          id v24 = [v5[6] objectForKeyedSubscript:v23];
          long long v25 = (void *)[v24 copyWithReplacementFutureCompletionStatus:0];
          [v5[6] setObject:v25 forKeyedSubscript:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v48 count:16];
      }
      while (v20);
    }

    if (!*v35) {
      goto LABEL_48;
    }
    if (qword_1EA8D80A8 != -1) {
      dispatch_once(&qword_1EA8D80A8, &__block_literal_global_21);
    }
    id v26 = (id)_MergedGlobals_40;
    long long v27 = [v26 objectForKey:@"com.apple.triald.tests.taskQueueDeferralSequence"];
    if (v27)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (![v27 count]) {
          goto LABEL_47;
        }
        long long v28 = [v27 firstObject];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v29 = [v28 BOOLValue];
          v30 = TRILogCategory_Server();
          BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
          if (v29)
          {
            if (v31)
            {
              *(_DWORD *)buf = 138412546;
              v45 = @"com.apple.triald.tests.taskQueueDeferralSequence";
              __int16 v46 = 2112;
              v47 = v28;
              _os_log_impl(&dword_1DA291000, v30, OS_LOG_TYPE_DEFAULT, "Requesting task queue deferral due to NSUserDefaults %@[0] ==> %@", buf, 0x16u);
            }

            *objc_super v35 = 0;
          }
          else
          {
            if (v31)
            {
              *(_DWORD *)buf = 138412546;
              v45 = @"com.apple.triald.tests.taskQueueDeferralSequence";
              __int16 v46 = 2112;
              v47 = v28;
              _os_log_impl(&dword_1DA291000, v30, OS_LOG_TYPE_DEFAULT, "Omitting task queue deferral due to NSUserDefaults %@[0] ==> %@", buf, 0x16u);
            }
          }
          if ((unint64_t)[v27 count] < 2)
          {
            [v26 removeObjectForKey:@"com.apple.triald.tests.taskQueueDeferralSequence"];
          }
          else
          {
            v33 = (void *)MEMORY[0x1E016E7F0]();
            v34 = objc_msgSend(v27, "subarrayWithRange:", 1, objc_msgSend(v27, "count") - 1);
            [v26 setObject:v34 forKey:@"com.apple.triald.tests.taskQueueDeferralSequence"];
          }
        }
        else
        {
          v32 = TRILogCategory_Server();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v45 = @"com.apple.triald.tests.taskQueueDeferralSequence";
            _os_log_error_impl(&dword_1DA291000, v32, OS_LOG_TYPE_ERROR, "Expected NSNumber inside NSArray under NSUserDefaults %@", buf, 0xCu);
          }
        }
      }
      else
      {
        long long v28 = TRILogCategory_Server();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v45 = @"com.apple.triald.tests.taskQueueDeferralSequence";
          _os_log_error_impl(&dword_1DA291000, v28, OS_LOG_TYPE_ERROR, "Expected NSArray<NSNumber*> under NSUserDefaults %@", buf, 0xCu);
        }
      }
    }
LABEL_47:

    if (*v35) {
      goto LABEL_49;
    }
LABEL_48:
    *((unsigned char *)v5 + 8) = 1;
    [v5[3] enumerateKeysAndObjectsUsingBlock:&__block_literal_global_85];
    goto LABEL_49;
  }
  *a4 = 0;
LABEL_49:
}

void __73__TRITaskQueue__evaluateRunConditionsWithGuardedData_shouldContinueWork___block_invoke()
{
  v0 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v2 = (void *)_MergedGlobals_40;
  _MergedGlobals_40 = v1;
}

uint64_t __73__TRITaskQueue__evaluateRunConditionsWithGuardedData_shouldContinueWork___block_invoke_82(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cancel];
}

- (void)resumeWithXPCActivityDescriptor:(id)a3 executeWhenSuspended:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__TRITaskQueue_resumeWithXPCActivityDescriptor_executeWhenSuspended___block_invoke;
  v11[3] = &unk_1E6BBC548;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(_PASLock *)lock runWithLockAcquired:v11];
}

void __69__TRITaskQueue_resumeWithXPCActivityDescriptor_executeWhenSuspended___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __69__TRITaskQueue_resumeWithXPCActivityDescriptor_executeWhenSuspended___block_invoke_2;
  v41[3] = &unk_1E6BB82F8;
  v41[4] = *(void *)(a1 + 32);
  uint64_t v4 = (void (**)(void))MEMORY[0x1E016EA80](v41);
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
  id v6 = (void *)*((void *)v3 + 2);
  uint64_t v7 = *((void *)v3 + 5);
  uint64_t v8 = [*(id *)(a1 + 40) capabilities];
  id v9 = objc_opt_new();
  id v10 = [v6 dependencyFreeTasksForAllowedCapabilities:v8 | v7 dateForRunnability:v9];

  if ([v10 count] || objc_msgSend(*((id *)v3 + 3), "count"))
  {
    double v11 = [v10 allKeys];
    objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_89);
    id v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

    id v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v10 count];
      uint64_t v15 = *((void *)v3 + 5);
      uint64_t v16 = [*(id *)(a1 + 40) capabilities];
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v14;
      __int16 v43 = 2048;
      uint64_t v44 = v16 | v15;
      __int16 v45 = 2112;
      __int16 v46 = v12;
      _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Found %lu dependency-free tasks to consider resuming the task queue with for capability %llu: %@", buf, 0x20u);
    }

    uint64_t v17 = TRILogCategory_Server();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEFAULT, "resuming task queue with activity %{public}@", buf, 0xCu);
    }
    uint64_t v36 = *((void *)v3 + 5);
    uint64_t v19 = [*(id *)(a1 + 40) capabilities];
    uint64_t v20 = *((void *)v3 + 5) | v19;
    *((void *)v3 + 5) = v20;
    *(void *)buf = 0;
    id v40 = 0;
    uint64_t v21 = *(void **)(a1 + 32);
    uint64_t v22 = [MEMORY[0x1E4F1C9C8] now];
    if (v10) {
      uint64_t v23 = v10;
    }
    else {
      uint64_t v23 = (void *)MEMORY[0x1E4F1CC08];
    }
    [v21 _partitionTaskGroup:v23 byRunnabilityGivenCapabilities:v20 runnableAtDate:v22 topoSortedCurrentlyRunnable:buf blocked:&v40 allowOnlyRootTasksRunnable:0];

    id v24 = *((id *)v3 + 3);
    long long v25 = *(void **)buf;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __69__TRITaskQueue_resumeWithXPCActivityDescriptor_executeWhenSuspended___block_invoke_94;
    v38[3] = &unk_1E6BBC520;
    id v26 = v24;
    id v39 = v26;
    long long v27 = objc_msgSend(v25, "_pas_filteredArrayWithTest:", v38);
    if ([v27 count] || objc_msgSend(v26, "count"))
    {
      *((unsigned char *)v3 + 8) = 0;
      if (*(void *)(a1 + 40))
      {
        long long v28 = +[TRIXPCActivityState xPCActivityStateWithFutureCompletionStatus:1 capabilities:v19];
        [*((id *)v3 + 6) setObject:v28 forKeyedSubscript:*(void *)(a1 + 40)];
      }
      if ([v27 count])
      {
        v37[0] = 0;
        [*(id *)(a1 + 32) _startImmediateTasksIfNotAlreadyQueued:*(void *)buf guardedData:v3 didStartNewWork:v37];
        if (!v37[0] && ![v26 count])
        {
          *((void *)v3 + 5) = v36;
          if (*(void *)(a1 + 40))
          {
            int v29 = objc_msgSend(*((id *)v3 + 6), "objectForKeyedSubscript:");
            v30 = [*(id *)(a1 + 40) completion];
            v30[2](v30, [v29 futureCompletionStatus]);

            [*((id *)v3 + 6) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
          }
        }
      }
    }
    else
    {
      v33 = TRILogCategory_Server();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v37 = 0;
        _os_log_impl(&dword_1DA291000, v33, OS_LOG_TYPE_DEFAULT, "task queue has no new work or work pending", v37, 2u);
      }

      *((void *)v3 + 5) = v36;
      v34 = *(void **)(a1 + 40);
      if (v34)
      {
        objc_super v35 = [v34 completion];
        v35[2](v35, 1);
      }
      [*(id *)(a1 + 32) _scheduleFutureActivitiesWithGuardedData:v3];
    }

    goto LABEL_31;
  }
  BOOL v31 = TRILogCategory_Server();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v31, OS_LOG_TYPE_DEFAULT, "task queue has no prior or pending tasks to resume", buf, 2u);
  }

  v32 = *(void **)(a1 + 40);
  if (v32)
  {
    id v12 = [v32 completion];
    v12[2](v12, 1);
LABEL_31:
  }
  if (v4) {
    v4[2](v4);
  }
}

void __69__TRITaskQueue_resumeWithXPCActivityDescriptor_executeWhenSuspended___block_invoke_2(uint64_t a1)
{
}

id __69__TRITaskQueue_resumeWithXPCActivityDescriptor_executeWhenSuspended___block_invoke_86(uint64_t a1, void *a2)
{
  v2 = (objc_class *)NSString;
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithFormat:@"[tid:%@]", v3];

  return v4;
}

BOOL __69__TRITaskQueue_resumeWithXPCActivityDescriptor_executeWhenSuspended___block_invoke_94(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 taskId];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = v4 == 0;

  return v5;
}

- (void)_finalizeTask:(id)a3 withId:(id)a4 runResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__TRITaskQueue__finalizeTask_withId_runResult___block_invoke;
  v15[3] = &unk_1E6BBC5C0;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  uint64_t v19 = self;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [(_PASLock *)lock runWithLockAcquired:v15];
}

void __47__TRITaskQueue__finalizeTask_withId_runResult___block_invoke(id *a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)os_transaction_create();
  int v5 = [a1[4] runStatus];
  id v6 = [a1[4] nextTasks];
  if (v5 == 3)
  {
LABEL_20:
    uint64_t v20 = [v3[2] tasksDependentOnTask:a1[6]];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __47__TRITaskQueue__finalizeTask_withId_runResult___block_invoke_196;
    v49[3] = &unk_1E6BBC570;
    v49[4] = a1[7];
    uint64_t v50 = v3;
    id v51 = a1[5];
    id v52 = a1[6];
    [v20 enumerateObjectsUsingBlock:v49];

    int v5 = 3;
    goto LABEL_21;
  }
  if (v5 == 1)
  {
    if ([a1[5] conformsToProtocol:&unk_1F3483128]
      && (int)[a1[5] retryCount] <= 2)
    {
      id v7 = a1[5];
      [v3[3] setObject:0 forKeyedSubscript:a1[6]];
      id v8 = [v3[2] tasksDependentOnTask:a1[6]];
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v53 objects:v64 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v54 != v11) {
              objc_enumerationMutation(v8);
            }
            [a1[7] _cancelTaskWithId:*(void *)(*((void *)&v53 + 1) + 8 * i) guardedData:v3 persistCancel:0];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v53 objects:v64 count:16];
        }
        while (v10);
      }
      id v13 = [a1[4] earliestRetryDate];
      id v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        id v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:43200.0];
      }
      v30 = v15;

      if ([a1[5] wasDeferred])
      {
        uint64_t v36 = TRILogCategory_Server();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          id v37 = a1[6];
          *(_DWORD *)buf = 138412290;
          uint64_t v59 = (uint64_t)v37;
          _os_log_impl(&dword_1DA291000, v36, OS_LOG_TYPE_DEFAULT, "Not incrementing retry count for task [tid:%@] since it was just deferred.", buf, 0xCu);
        }
      }
      else
      {
        objc_msgSend(v7, "setRetryCount:", objc_msgSend(v7, "retryCount") + 1);
        objc_msgSend(v3[2], "updateTaskWithTaskId:capabilities:task:", a1[6], objc_msgSend(a1[5], "requiredCapabilities"), a1[5]);
      }
      [v3[2] updateTaskWithTaskId:a1[6] startDate:v30 task:v7];
      [a1[7] _registerRetryActivityForDate:v30];

      goto LABEL_34;
    }
    char v16 = [a1[5] conformsToProtocol:&unk_1F3483128];
    id v17 = TRILogCategory_Server();
    id v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = a1[6];
        *(_DWORD *)buf = 138412290;
        uint64_t v59 = (uint64_t)v19;
        _os_log_impl(&dword_1DA291000, v18, OS_LOG_TYPE_DEFAULT, "task [tid:%@] exceeded maximum retry count, failing", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v40 = a1[6];
      *(_DWORD *)buf = 138412290;
      uint64_t v59 = (uint64_t)v40;
      _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "task [tid:%@] finished with TRITaskRunStatus_RETRY but not retryable; failing instead",
        buf,
        0xCu);
    }

    goto LABEL_20;
  }
LABEL_21:
  char v21 = [a1[7] _removeTaskWithId:a1[6] guardedData:v3 persistRemove:1];
  uint64_t v22 = TRILogCategory_Server();
  uint64_t v23 = v22;
  if (v21)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      id v24 = a1[5];
      id v25 = a1[6];
      *(_DWORD *)buf = 138543618;
      uint64_t v59 = (uint64_t)v24;
      __int16 v60 = 2112;
      id v61 = v25;
      _os_log_debug_impl(&dword_1DA291000, v23, OS_LOG_TYPE_DEBUG, "removing task from DB: %{public}@ [tid:%@]", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    id v38 = a1[5];
    id v39 = a1[6];
    *(_DWORD *)buf = 138543618;
    uint64_t v59 = (uint64_t)v38;
    __int16 v60 = 2112;
    id v61 = v39;
    _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "failed to remove task from DB: %{public}@ [tid:%@]", buf, 0x16u);
  }

  if (v6 && [v6 count])
  {
    id v26 = TRILogCategory_Server();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [v6 count];
      id v28 = a1[5];
      id v29 = a1[6];
      *(_DWORD *)buf = 134218498;
      uint64_t v59 = v27;
      __int16 v60 = 2114;
      id v61 = v28;
      __int16 v62 = 2112;
      id v63 = v29;
      _os_log_impl(&dword_1DA291000, v26, OS_LOG_TYPE_DEFAULT, "adding %lu follow-up tasks for %{public}@ [tid:%@]", buf, 0x20u);
    }

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __47__TRITaskQueue__finalizeTask_withId_runResult___block_invoke_198;
    v45[3] = &unk_1E6BBC598;
    v45[4] = a1[7];
    __int16 v46 = v3;
    id v47 = a1[5];
    id v48 = a1[6];
    [v6 enumerateObjectsUsingBlock:v45];
  }
  if (v5 == 2) {
    [a1[7] _startRunnableTasksIfNecessaryWithGuardedData:v3];
  }
  v30 = 0;
LABEL_34:
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v31 = v3[8];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v41 objects:v57 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(v31);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v41 + 1) + 8 * j) + 16))(*(void *)(*((void *)&v41 + 1) + 8 * j));
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v41 objects:v57 count:16];
    }
    while (v33);
  }
}

void __47__TRITaskQueue__finalizeTask_withId_runResult___block_invoke_196(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) _cancelTaskWithId:v3 guardedData:*(void *)(a1 + 40) persistCancel:1];
  int v5 = TRILogCategory_Server();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      int v11 = 138543874;
      id v12 = v3;
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_debug_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEBUG, "removed downstream task %{public}@ of task %{public}@ [tid:%@]", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    int v11 = 138543874;
    id v12 = v3;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "failed to remove downstream task %{public}@ of task %{public}@ [tid:%@]", (uint8_t *)&v11, 0x20u);
  }
}

void __47__TRITaskQueue__finalizeTask_withId_runResult___block_invoke_198(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [[TRITaskQueuingOptions alloc] initWithDuplicateTaskResolution:1];

    char v4 = v5;
  }
  id v12 = 0;
  int v6 = [*(id *)(a1 + 32) _addTask:v3 options:v4 guardedData:*(void *)(a1 + 40) taskId:&v12 tryRunningEligibleTasksImmediately:1];
  uint64_t v7 = TRILogCategory_Server();
  uint64_t v8 = v7;
  if (v6 == 2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void **)(a1 + 48);
      uint64_t v10 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "failed to add follow-up task for %{public}@ [tid:%@]", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    id v14 = v3;
    __int16 v15 = 2112;
    id v16 = v12;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "enqueued follow-up task %{public}@ [tid:%@] after execution of [tid:%@]", buf, 0x20u);
  }
}

- (id)_runTask:(id)a3
{
  id v4 = a3;
  int v5 = (void *)os_transaction_create();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverContext);
  uint64_t v7 = [v4 runUsingContext:WeakRetained withTaskQueue:self];

  return v7;
}

- (id)_createOperationWithTask:(id)a3 withId:(id)a4 dependencies:(id)a5 taskMap:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v24 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_opt_new();
  [v12 setTask:v9];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v18 = [v11 objectForKeyedSubscript:v17];
        if (!v18)
        {
          uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
          [v19 handleFailureInMethod:a2, self, @"TRITaskQueue.m", 481, @"Creating operation for task %@ with unknown dependency id %@", v9, v17 object file lineNumber description];
        }
        [v12 addDependency:v18];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v14);
  }

  objc_initWeak(&location, v12);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __69__TRITaskQueue__createOperationWithTask_withId_dependencies_taskMap___block_invoke;
  v26[3] = &unk_1E6BBC5E8;
  objc_copyWeak(&v30, &location);
  id v20 = v9;
  id v27 = v20;
  id v21 = v24;
  id v28 = v21;
  id v29 = self;
  [v12 addExecutionBlock:v26];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  return v12;
}

void __69__TRITaskQueue__createOperationWithTask_withId_dependencies_taskMap___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v2 = (void *)os_transaction_create();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v4 = [WeakRetained isCancelled];
  int v5 = TRILogCategory_Server();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      long long v43 = v7;
      __int16 v44 = 2112;
      __int16 v45 = v8;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [tid:%@] was cancelled", buf, 0x16u);
    }

    id v9 = +[TRITaskRunResult resultWithRunStatus:3 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
  }
  else
  {
    if (v6)
    {
      id v10 = *(void **)(a1 + 32);
      id v11 = *(void **)(a1 + 40);
      id v12 = [v10 tags];
      uint64_t v13 = [v12 componentsJoinedByString:@","];
      uint64_t v14 = (void *)v13;
      uint64_t v15 = &stru_1F3455898;
      *(_DWORD *)buf = 138543874;
      if (v13) {
        uint64_t v15 = (__CFString *)v13;
      }
      long long v43 = v10;
      __int16 v44 = 2112;
      __int16 v45 = v11;
      __int16 v46 = 2114;
      id v47 = v15;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ [tid:%@] with tags {%{public}@}", buf, 0x20u);
    }
    [*(id *)(a1 + 32) setStateProvider:*(void *)(a1 + 48)];
    id v9 = [*(id *)(a1 + 48) _runTask:*(void *)(a1 + 32)];
    if (([v9 reportResultToServer] & 1) == 0)
    {
      id v16 = TRILogCategory_Server();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        id v39 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        long long v43 = v39;
        __int16 v44 = 2112;
        __int16 v45 = v9;
        _os_log_debug_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEBUG, "Asked not to report telemetry for task %@ with result %@", buf, 0x16u);
      }
    }
    if ([v9 reportResultToServer]
      && [*(id *)(*(void *)(a1 + 48) + 48) shouldLogAtLevel:20])
    {
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4FB05A8], "metricWithName:integerValue:", @"task_status", (int)objc_msgSend(v9, "runStatus"));
      long long v41 = v17;
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
      uint64_t v19 = (void *)[v18 mutableCopy];

      if ([(id)objc_opt_class() conformsToProtocol:&unk_1F3483128])
      {
        if ([v9 runStatus] != 1)
        {
          int v20 = [*(id *)(a1 + 32) retryCount];
          if (v20 >= 1)
          {
            id v21 = [MEMORY[0x1E4FB05A8] metricWithName:@"retry_count" integerValue:v20];
            [v19 addObject:v21];
          }
        }
      }
      uint64_t v22 = objc_opt_new();
      uint64_t v23 = [*(id *)(a1 + 32) taskName];
      [v22 setTrialdTaskName:v23];

      id v40 = v2;
      if ([*(id *)(*(void *)(a1 + 48) + 48) shouldLogAtLevel:20 withPrivacyRadar:54260918]&& objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1F3482928))
      {
        id v24 = [*(id *)(a1 + 32) dimensions];
        id v25 = [*(id *)(a1 + 32) metrics];
        if (v25) {
          [v19 addObjectsFromArray:v25];
        }
        id v26 = [*(id *)(a1 + 32) trialSystemTelemetry];
        if (v26) {
          [v22 mergeFrom:v26];
        }
        id v27 = v22;
        id v28 = v19;
      }
      else
      {
        id v27 = v22;
        id v28 = v19;
        id v24 = 0;
      }
      id v29 = [*(id *)(*(void *)(a1 + 48) + 48) logger];
      id v30 = [*(id *)(*(void *)(a1 + 48) + 48) trackingId];
      id v31 = (void *)MEMORY[0x1E4FB0620];
      id v32 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 16));
      long long v33 = [v31 fullSystemDimensions:v32];
      [v29 logWithTrackingId:v30 metrics:v28 dimensions:v24 systemDimensions:v33 trialSystemTelemetry:v27];

      v2 = v40;
    }
    long long v34 = TRILogCategory_Server();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = *(void **)(a1 + 32);
      long long v35 = *(void **)(a1 + 40);
      uint64_t v37 = [v9 runStatus];
      if (v37 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v37);
        id v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v38 = off_1E6BBC918[(int)v37];
      }
      *(_DWORD *)buf = 138543874;
      long long v43 = v36;
      __int16 v44 = 2112;
      __int16 v45 = v35;
      __int16 v46 = 2112;
      id v47 = v38;
      _os_log_impl(&dword_1DA291000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ [tid:%@] finished with status %@", buf, 0x20u);
    }
    if ([v9 runStatus] != 2) {
      [WeakRetained cancel];
    }
  }
  [*(id *)(a1 + 48) _finalizeTask:*(void *)(a1 + 32) withId:*(void *)(a1 + 40) runResult:v9];
}

- (void)_startImmediateTasksIfNotAlreadyQueued:(id)a3 guardedData:(id)a4 didStartNewWork:(BOOL *)a5
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = a4;
  buf[0] = 0;
  v57 = self;
  [(TRITaskQueue *)self _evaluateRunConditionsWithGuardedData:v8 shouldContinueWork:buf];
  if (buf[0])
  {
    id v51 = (void *)os_transaction_create();
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v10 = v9;
    v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v52 = v7;
    id obj = v7;
    uint64_t v11 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v70;
      uint64_t v54 = *(void *)v70;
      do
      {
        uint64_t v14 = 0;
        uint64_t v55 = v12;
        do
        {
          if (*(void *)v70 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v69 + 1) + 8 * v14);
          id v16 = (void *)MEMORY[0x1E016E7F0]();
          uint64_t v17 = (void *)v8[3];
          uint64_t v18 = [v15 taskId];
          uint64_t v19 = [v17 objectForKeyedSubscript:v18];

          if (v19)
          {
            int v20 = [v15 taskId];
            [v58 setObject:v19 forKeyedSubscript:v20];
          }
          else
          {
            int v20 = (void *)[v15 copy];
            id v21 = [v15 startDate];
            uint64_t v22 = v21;
            if (v21)
            {
              [v21 timeIntervalSinceReferenceDate];
              if (v23 > v10)
              {
                id v24 = TRILogCategory_Server();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  id v29 = [v15 taskId];
                  *(_DWORD *)buf = 138412546;
                  v75 = v29;
                  __int16 v76 = 2112;
                  v77 = v22;
                  _os_log_error_impl(&dword_1DA291000, v24, OS_LOG_TYPE_ERROR, "asked to start task [tid:%@] with future start date %@", buf, 0x16u);
                }
              }
            }
            id v25 = [v20 task];
            id v26 = [v20 taskId];
            id v27 = [v20 dependencies];
            uint64_t v19 = [(TRITaskQueue *)v57 _createOperationWithTask:v25 withId:v26 dependencies:v27 taskMap:v58];

            id v28 = [v20 taskId];
            [v58 setObject:v19 forKeyedSubscript:v28];

            uint64_t v13 = v54;
            uint64_t v12 = v55;
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
      }
      while (v12);
    }

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v30 = obj;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v65 objects:v73 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v66 != v33) {
            objc_enumerationMutation(v30);
          }
          long long v35 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          uint64_t v36 = (void *)v8[3];
          uint64_t v37 = [v35 taskId];
          id v38 = [v36 objectForKeyedSubscript:v37];

          if (!v38)
          {
            id v39 = [v35 taskId];
            id v40 = [v58 objectForKeyedSubscript:v39];

            if (v40)
            {
              if (a5) {
                *a5 = 1;
              }
              long long v41 = (void *)v8[3];
              long long v42 = [v35 taskId];
              [v41 setObject:v40 forKeyedSubscript:v42];

              long long v43 = TRILogCategory_Server();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v44 = [v35 task];
                __int16 v45 = [v35 taskId];
                *(_DWORD *)buf = 138543618;
                v75 = v44;
                __int16 v76 = 2112;
                v77 = v45;
                _os_log_impl(&dword_1DA291000, v43, OS_LOG_TYPE_DEFAULT, "Enqueueing eligible task %{public}@ [tid:%@]", buf, 0x16u);
              }
              opQueue = v57->_opQueue;
              opGroup = v57->_opGroup;
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke;
              block[3] = &unk_1E6BB8D68;
              id v62 = v40;
              id v63 = v57;
              v64 = v35;
              dispatch_group_async(opGroup, opQueue, block);
              if (!v8[7])
              {
                v59[0] = MEMORY[0x1E4F143A8];
                v59[1] = 3221225472;
                v59[2] = __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke_3;
                v59[3] = &unk_1E6BB82A8;
                v59[4] = v57;
                __int16 v60 = v8;
                uint64_t v48 = (void (**)(void))MEMORY[0x1E016EA80](v59);
                uint64_t v49 = [v48 copy];
                uint64_t v50 = (void *)v8[7];
                v8[7] = v49;

                v48[2](v48);
              }
            }
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v65 objects:v73 count:16];
      }
      while (v32);
    }

    id v7 = v52;
  }
}

uint64_t __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCancelled])
  {
    v2 = *(void **)(*(void *)(a1 + 40) + 8);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke_2;
    v5[3] = &unk_1E6BBC610;
    v5[4] = *(void *)(a1 + 48);
    return [v2 runWithLockAcquired:v5];
  }
  else
  {
    [*(id *)(a1 + 32) setInProgress:1];
    [*(id *)(a1 + 32) main];
    int v4 = *(void **)(a1 + 32);
    return [v4 setInProgress:0];
  }
}

void __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 24);
  id v3 = [*(id *)(a1 + 32) taskId];
  [v2 setObject:0 forKeyedSubscript:v3];
}

void __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke_3(uint64_t a1)
{
  v2 = TRILogCategory_Server();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v2, OS_LOG_TYPE_DEFAULT, "setting up task queue completion block", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(NSObject **)(v3 + 32);
  int v5 = *(NSObject **)(v3 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke_226;
  v6[3] = &unk_1E6BB82A8;
  v6[4] = v3;
  id v7 = *(id *)(a1 + 40);
  dispatch_group_notify(v4, v5, v6);
}

void __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke_226(uint64_t a1)
{
  v2 = TRILogCategory_Server();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v2, OS_LOG_TYPE_DEFAULT, "task queue completion block called", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 8);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke_227;
  v5[3] = &unk_1E6BBC638;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  [v4 runWithLockAcquired:v5];
}

void __83__TRITaskQueue__startImmediateTasksIfNotAlreadyQueued_guardedData_didStartNewWork___block_invoke_227(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) finishXPCActivitiesWithGuardedData:a2])
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = 0;
  }
  else
  {
    int v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "task queue not complete yet", v6, 2u);
    }

    (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 56) + 16))();
  }
}

- (BOOL)_removeTaskWithId:(id)a3 guardedData:(id)a4 persistRemove:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  double v9 = (id *)a4;
  double v10 = TRILogCategory_Server();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v8;
    _os_log_debug_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEBUG, "removing task with [tid:%@]", buf, 0xCu);
  }

  [v9[3] setObject:0 forKeyedSubscript:v8];
  if (v5)
  {
    id v11 = v9[2];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__TRITaskQueue__removeTaskWithId_guardedData_persistRemove___block_invoke;
    v14[3] = &unk_1E6BBC660;
    id v15 = v8;
    id v16 = self;
    char v12 = [v11 removeTaskWithId:v15 cleanupBlock:v14];
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

void __60__TRITaskQueue__removeTaskWithId_guardedData_persistRemove___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_debug_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEBUG, "Running dequeue handler for %@ [tid:%@]", (uint8_t *)&v7, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
  [v3 runDequeueHandlerUsingContext:WeakRetained];
}

- ($A5A652246548B43F8BC05201A1C72A70)addTask:(id)a3 options:(id)a4
{
  return ($A5A652246548B43F8BC05201A1C72A70)[(TRITaskQueue *)self addTask:a3 options:a4 taskId:0];
}

- ($A5A652246548B43F8BC05201A1C72A70)addTask:(id)a3 options:(id)a4 taskId:(id *)a5
{
  return ($A5A652246548B43F8BC05201A1C72A70)[(TRITaskQueue *)self _addTask:a3 options:a4 taskId:a5 tryRunningEligibleTasksImmediately:1];
}

- ($A5A652246548B43F8BC05201A1C72A70)_addTask:(id)a3 options:(id)a4 taskId:(id *)a5 tryRunningEligibleTasksImmediately:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  char v12 = (void *)os_transaction_create();
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2810000000;
  id v27 = "";
  char v28 = 2;
  lock = self->_lock;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__TRITaskQueue__addTask_options_taskId_tryRunningEligibleTasksImmediately___block_invoke;
  v18[3] = &unk_1E6BBC688;
  id v21 = &v24;
  v18[4] = self;
  id v14 = v10;
  id v19 = v14;
  id v15 = v11;
  id v20 = v15;
  uint64_t v22 = a5;
  BOOL v23 = a6;
  [(_PASLock *)lock runWithLockAcquired:v18];
  v16.var0 = *((unsigned char *)v25 + 32);

  _Block_object_dispose(&v24, 8);
  return v16;
}

uint64_t __75__TRITaskQueue__addTask_options_taskId_tryRunningEligibleTasksImmediately___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _addTask:*(void *)(a1 + 40) options:*(void *)(a1 + 48) guardedData:a2 taskId:*(void *)(a1 + 64) tryRunningEligibleTasksImmediately:*(unsigned __int8 *)(a1 + 72)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = result;
  return result;
}

- ($A5A652246548B43F8BC05201A1C72A70)_addTask:(id)a3 options:(id)a4 guardedData:(id)a5 taskId:(id *)a6 tryRunningEligibleTasksImmediately:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = (void *)os_transaction_create();
  $A5A652246548B43F8BC05201A1C72A70 v16 = objc_opt_new();
  id obj = 0;
  v17.var0 = [(TRITaskQueue *)self _addTask:v14 options:v13 guardedData:v12 taskIdOut:&obj accumulatedNewTaskRecords:v16];

  if (v17.var0 != 2 && [v16 count] && v7) {
    [(TRITaskQueue *)self _startRunnableTasksIfNecessaryWithGuardedData:v12];
  }
  if (a6) {
    objc_storeStrong(a6, obj);
  }

  return v17;
}

- (void)_startRunnableTasksIfNecessaryWithGuardedData:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v4 = a3;
  BOOL v5 = (void *)v4[2];
  uint64_t v6 = v4[5];
  BOOL v7 = objc_opt_new();
  id v8 = [v5 dependencyFreeTasksForAllowedCapabilities:v6 dateForRunnability:v7];

  __int16 v9 = [v8 allKeys];
  id v10 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_232);

  id v11 = TRILogCategory_Server();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v8 count];
    uint64_t v13 = v4[5];
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v12;
    __int16 v18 = 2048;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEFAULT, "Found %lu dependency-free tasks to consider starting for capability %llu: %@", buf, 0x20u);
  }

  if (v8)
  {
    id v16 = 0;
    *(void *)buf = 0;
    uint64_t v14 = v4[5];
    id v15 = [MEMORY[0x1E4F1C9C8] now];
    [(TRITaskQueue *)self _partitionTaskGroup:v8 byRunnabilityGivenCapabilities:v14 runnableAtDate:v15 topoSortedCurrentlyRunnable:buf blocked:&v16 allowOnlyRootTasksRunnable:1];

    [(TRITaskQueue *)self _startImmediateTasksIfNotAlreadyQueued:*(void *)buf guardedData:v4 didStartNewWork:0];
  }
}

id __62__TRITaskQueue__startRunnableTasksIfNecessaryWithGuardedData___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)NSString;
  id v3 = a2;
  int v4 = (void *)[[v2 alloc] initWithFormat:@"[tid:%@]", v3];

  return v4;
}

- (BOOL)_isTaskWithId:(id)a3 inTaskGroup:(id)a4 runnableGivenCapabilities:(unint64_t)a5 atDate:(id)a6 cachedRunnability:(id)a7 visitedPath:(id)a8 topoSortedRunnable:(id)a9 allowOnlyRootTasksRunnable:(BOOL)a10
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v63 = a4;
  __int16 v18 = v17;
  id v61 = a6;
  id v19 = a7;
  id v20 = a8;
  id v62 = a9;
  id v21 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v22 = [v19 objectForKeyedSubscript:v17];
  BOOL v23 = v22;
  if (!v22)
  {
    if ([v20 containsObject:v17])
    {
      long long v56 = [MEMORY[0x1E4F28B00] currentHandler];
      [v56 handleFailureInMethod:a2 object:self file:@"TRITaskQueue.m" lineNumber:746 description:@"Dependency graph contains a cycle"];
    }
    id v25 = [v20 setByAddingObject:v17];

    uint64_t v59 = v18;
    uint64_t v26 = [v63 objectForKeyedSubscript:v18];
    if (!v26)
    {
      v57 = [MEMORY[0x1E4F28B00] currentHandler];
      [v57 handleFailureInMethod:a2, self, @"TRITaskQueue.m", 750, @"Invalid parameter not satisfying: %@", @"record" object file lineNumber description];
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    __int16 v60 = v26;
    id v27 = [v26 dependencies];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v64 objects:v74 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v65;
      while (2)
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v65 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          LOBYTE(v58) = a10;
          if (![(TRITaskQueue *)self _isTaskWithId:v32 inTaskGroup:v63 runnableGivenCapabilities:a5 atDate:v61 cachedRunnability:v19 visitedPath:v25 topoSortedRunnable:v62 allowOnlyRootTasksRunnable:v58])
          {
            id v40 = TRILogCategory_Server();
            uint64_t v33 = v60;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              long long v41 = [v60 task];
              *(_DWORD *)buf = 138543618;
              long long v69 = v41;
              __int16 v70 = 2112;
              uint64_t v71 = (uint64_t)v32;
              _os_log_impl(&dword_1DA291000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ not runnable, dependency with [tid:%@] is not runnable", buf, 0x16u);
            }
            __int16 v18 = v59;
            [v19 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v59];

            goto LABEL_23;
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v64 objects:v74 count:16];
        if (v29) {
          continue;
        }
        break;
      }
    }

    uint64_t v33 = v60;
    if (a10)
    {
      long long v34 = [v60 dependencies];
      uint64_t v35 = [v34 count];

      if (v35)
      {
        uint64_t v36 = TRILogCategory_Server();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v37 = [v60 task];
          id v38 = [v60 dependencies];
          uint64_t v39 = [v38 count];
          *(_DWORD *)buf = 138543618;
          long long v69 = v37;
          __int16 v70 = 2048;
          uint64_t v71 = v39;
          _os_log_impl(&dword_1DA291000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ not runnable, waiting on %tu dependency/dependencies", buf, 0x16u);
        }
        __int16 v18 = v59;
        [v19 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v59];
LABEL_23:
        char v24 = 0;
        goto LABEL_24;
      }
    }
    long long v43 = [v60 task];
    uint64_t v44 = [v43 requiredCapabilities];

    if (+[TRITaskCapabilityUtilities requiredCapabilities:v44 areSupportedByAllowedCapabilities:a5])
    {
      uint64_t v45 = [v60 startDate];
      __int16 v18 = v59;
      if (!v45) {
        goto LABEL_34;
      }
      __int16 v46 = (void *)v45;
      id v47 = [v60 startDate];
      [v47 timeIntervalSinceReferenceDate];
      double v49 = v48;
      [v61 timeIntervalSinceReferenceDate];
      double v51 = v50;

      if (v49 <= v51)
      {
LABEL_34:
        [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v59];
        [v62 addObject:v60];
        char v24 = 1;
        goto LABEL_24;
      }
      id v52 = TRILogCategory_Server();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        long long v53 = [v60 task];
        uint64_t v54 = [v60 startDate];
        *(_DWORD *)buf = 138543618;
        long long v69 = v53;
        __int16 v70 = 2112;
        uint64_t v71 = (uint64_t)v54;
        _os_log_impl(&dword_1DA291000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ not runnable, start date %@ in the future", buf, 0x16u);
      }
    }
    else
    {
      id v52 = TRILogCategory_Server();
      __int16 v18 = v59;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v55 = [v60 task];
        *(_DWORD *)buf = 138543874;
        long long v69 = v55;
        __int16 v70 = 2048;
        uint64_t v71 = v44;
        __int16 v72 = 2048;
        unint64_t v73 = a5;
        _os_log_impl(&dword_1DA291000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ not runnable, capabilities required: %llu, supported: %llu", buf, 0x20u);
      }
    }

    [v19 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v18];
    char v24 = 0;
LABEL_24:

    BOOL v23 = 0;
    goto LABEL_25;
  }
  char v24 = [v22 BOOLValue];
  id v25 = v20;
LABEL_25:

  return v24;
}

- (void)_partitionTaskGroup:(id)a3 byRunnabilityGivenCapabilities:(unint64_t)a4 runnableAtDate:(id)a5 topoSortedCurrentlyRunnable:(id *)a6 blocked:(id *)a7 allowOnlyRootTasksRunnable:(BOOL)a8
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  context = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v14 = objc_opt_new();
  id v15 = objc_opt_new();
  id v16 = objc_opt_new();
  id v17 = objc_opt_new();
  __int16 v18 = TRILogCategory_Server();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v48 = a4;
    _os_log_impl(&dword_1DA291000, v18, OS_LOG_TYPE_DEFAULT, "Partitioning task group into runnable/blocked for capabilities %llu", buf, 0xCu);
  }

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __145__TRITaskQueue__partitionTaskGroup_byRunnabilityGivenCapabilities_runnableAtDate_topoSortedCurrentlyRunnable_blocked_allowOnlyRootTasksRunnable___block_invoke;
  v38[3] = &unk_1E6BBC6B0;
  void v38[4] = self;
  id v19 = v12;
  id v39 = v19;
  unint64_t v45 = a4;
  id v20 = v13;
  id v40 = v20;
  id v41 = v14;
  id v42 = v17;
  id v21 = v15;
  id v43 = v21;
  BOOL v46 = a8;
  id v22 = v16;
  id v44 = v22;
  id v23 = v17;
  id v24 = v14;
  [v19 enumerateKeysAndObjectsUsingBlock:v38];
  id v25 = objc_msgSend(v21, "_pas_mappedArrayWithTransform:", &__block_literal_global_244);
  uint64_t v26 = objc_msgSend(v22, "_pas_mappedArrayWithTransform:", &__block_literal_global_246);
  id v27 = TRILogCategory_Server();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = [v25 count];
    *(_DWORD *)buf = 134218242;
    unint64_t v48 = v28;
    __int16 v49 = 2114;
    double v50 = v25;
    _os_log_impl(&dword_1DA291000, v27, OS_LOG_TYPE_DEFAULT, "Found %lu runnable tasks: %{public}@", buf, 0x16u);
  }

  uint64_t v29 = TRILogCategory_Server();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = [v26 count];
    *(_DWORD *)buf = 134218242;
    unint64_t v48 = v30;
    __int16 v49 = 2114;
    double v50 = v26;
    _os_log_impl(&dword_1DA291000, v29, OS_LOG_TYPE_DEFAULT, "Found %lu blocked tasks: %{public}@", buf, 0x16u);
  }

  id v31 = *a6;
  *a6 = v21;
  id v32 = v21;

  id v33 = *a7;
  *a7 = v22;
  id v34 = v22;
}

void __145__TRITaskQueue__partitionTaskGroup_byRunnabilityGivenCapabilities_runnableAtDate_topoSortedCurrentlyRunnable_blocked_allowOnlyRootTasksRunnable___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  LOBYTE(v5) = *(unsigned char *)(a1 + 96);
  if (([*(id *)(a1 + 32) _isTaskWithId:a2 inTaskGroup:*(void *)(a1 + 40) runnableGivenCapabilities:*(void *)(a1 + 88) atDate:*(void *)(a1 + 48) cachedRunnability:*(void *)(a1 + 56) visitedPath:*(void *)(a1 + 64) topoSortedRunnable:*(void *)(a1 + 72) allowOnlyRootTasksRunnable:v5] & 1) == 0)objc_msgSend(*(id *)(a1 + 80), "addObject:", v6); {
}
  }

id __145__TRITaskQueue__partitionTaskGroup_byRunnabilityGivenCapabilities_runnableAtDate_topoSortedCurrentlyRunnable_blocked_allowOnlyRootTasksRunnable___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 taskId];

  id v6 = (void *)[v4 initWithFormat:@"[tid:%@]", v5];
  return v6;
}

id __145__TRITaskQueue__partitionTaskGroup_byRunnabilityGivenCapabilities_runnableAtDate_topoSortedCurrentlyRunnable_blocked_allowOnlyRootTasksRunnable___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 taskId];

  id v6 = (void *)[v4 initWithFormat:@"[tid:%@]", v5];
  return v6;
}

- ($A5A652246548B43F8BC05201A1C72A70)_addTask:(id)a3 options:(id)a4 guardedData:(id)a5 taskIdOut:(id *)a6 accumulatedNewTaskRecords:(id)a7
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (id *)a5;
  id v48 = a7;
  id v15 = [v14[2] idForTask:v12];
  if (!v15) {
    goto LABEL_17;
  }
  uint64_t v16 = [v13 duplicateTaskResolution];
  if (v16 == 1)
  {
    __int16 v18 = [v14[3] objectForKeyedSubscript:v15];
    id v19 = v18;
    if (v18 && [v18 inProgress])
    {
      id v20 = TRILogCategory_Server();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v15;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_impl(&dword_1DA291000, v20, OS_LOG_TYPE_DEFAULT, "task with [tid:%@] is already running. Not replacing it with: %@", buf, 0x16u);
      }

      goto LABEL_12;
    }
    id v23 = TRILogCategory_Server();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_1DA291000, v23, OS_LOG_TYPE_DEFAULT, "replacing existing task with [tid:%@]: %@", buf, 0x16u);
    }

    [(TRITaskQueue *)self _cancelDependenciesAndTaskWithId:v15 guardedData:v14];
LABEL_17:
    id v24 = TRILogCategory_Server();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl(&dword_1DA291000, v24, OS_LOG_TYPE_DEFAULT, "adding task to task queue: %@", buf, 0xCu);
    }

    uint64_t v25 = [v12 dependencies];
    uint64_t v26 = (void *)v25;
    id v27 = (void *)MEMORY[0x1E4F1CBF0];
    if (v25) {
      id v27 = (void *)v25;
    }
    id v28 = v27;

    uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v28, "count"));
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    char v66 = 1;
    if ([v28 count])
    {
      uint64_t v30 = TRILogCategory_Server();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v61 = 138412290;
        uint64_t v62 = (uint64_t)v12;
        _os_log_debug_impl(&dword_1DA291000, v30, OS_LOG_TYPE_DEBUG, "checking dependencies for task: %@", v61, 0xCu);
      }

      id v31 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __81__TRITaskQueue__addTask_options_guardedData_taskIdOut_accumulatedNewTaskRecords___block_invoke;
      v53[3] = &unk_1E6BBC6F8;
      v53[4] = self;
      id v32 = v31;
      uint64_t v54 = v32;
      uint64_t v55 = v14;
      id v56 = v48;
      SEL v60 = a2;
      id v57 = v29;
      uint64_t v59 = buf;
      id v58 = v12;
      [v28 enumerateObjectsUsingBlock:v53];
    }
    else
    {
      id v32 = TRILogCategory_Server();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v61 = 138412290;
        uint64_t v62 = (uint64_t)v12;
        _os_log_debug_impl(&dword_1DA291000, v32, OS_LOG_TYPE_DEBUG, "task %@ has no dependencies", v61, 0xCu);
      }
    }

    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      id v33 = TRILogCategory_Server();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = [v29 count];
        *(_DWORD *)id v61 = 134218242;
        uint64_t v62 = v34;
        __int16 v63 = 2112;
        id v64 = v12;
        _os_log_impl(&dword_1DA291000, v33, OS_LOG_TYPE_DEFAULT, "adding task with %tu dependencies to task queue: %@", v61, 0x16u);
      }

      uint64_t v35 = [(TRITaskQueue *)self _addTask:v12 withDependencies:v29 guardedData:v14];

      if (v35)
      {
        uint64_t v36 = [TRITaskRecord alloc];
        uint64_t v37 = [v12 startTime];
        uint64_t v38 = [v12 requiredCapabilities];
        uint64_t v39 = [v12 tags];
        id v40 = (void *)v39;
        if (v39) {
          uint64_t v41 = v39;
        }
        else {
          uint64_t v41 = MEMORY[0x1E4F1CBF0];
        }
        id v42 = [(TRITaskRecord *)v36 initWithTaskId:v35 task:v12 startDate:v37 dependencies:v29 capabilities:v38 tags:v41];

        [v48 addObject:v42];
        v21.var0 = 0;
      }
      else
      {
        v21.var0 = 2;
      }
      id v15 = v35;
      id v45 = *a6;
      *a6 = v15;
    }
    else
    {
      if (![v29 count])
      {
        v21.var0 = 2;
        goto LABEL_42;
      }
      id v43 = TRILogCategory_Server();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = [v29 count];
        *(_DWORD *)id v61 = 134218242;
        uint64_t v62 = v44;
        __int16 v63 = 2112;
        id v64 = v12;
        _os_log_impl(&dword_1DA291000, v43, OS_LOG_TYPE_DEFAULT, "cancelling %tu dependencies of task: %@", v61, 0x16u);
      }

      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __81__TRITaskQueue__addTask_options_guardedData_taskIdOut_accumulatedNewTaskRecords___block_invoke_253;
      v49[3] = &unk_1E6BBC328;
      id v50 = v12;
      uint64_t v51 = self;
      id v52 = v14;
      [v29 enumerateObjectsUsingBlock:v49];

      v21.var0 = 2;
      id v45 = v50;
    }

LABEL_42:
    _Block_object_dispose(buf, 8);

    goto LABEL_43;
  }
  if (v16)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRITaskQueue.m", 865, @"failed to handle duplicate task resolution: %u", objc_msgSend(v13, "duplicateTaskResolution"));

    goto LABEL_17;
  }
  id v17 = TRILogCategory_Server();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v12;
    _os_log_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEFAULT, "task already exists with id [tid:%@]: %@", buf, 0x16u);
  }

  objc_storeStrong(a6, v15);
LABEL_12:
  v21.var0 = 1;
LABEL_43:

  return v21;
}

void __81__TRITaskQueue__addTask_options_guardedData_taskIdOut_accumulatedNewTaskRecords___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v10 = 0;
  if ([*(id *)(a1 + 32) _addTask:v6 options:*(void *)(a1 + 40) guardedData:*(void *)(a1 + 48) taskIdOut:&v10 accumulatedNewTaskRecords:*(void *)(a1 + 56)] == 2)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    BOOL v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "failed to add dependency %@ for task: %@", buf, 0x16u);
    }
  }
  else
  {
    if (!v10)
    {
      __int16 v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:*(void *)(a1 + 88), *(void *)(a1 + 32), @"TRITaskQueue.m", 888, @"Invalid parameter not satisfying: %@", @"depTaskId != nil" object file lineNumber description];
    }
    objc_msgSend(*(id *)(a1 + 64), "addObject:");
  }
}

void __81__TRITaskQueue__addTask_options_guardedData_taskIdOut_accumulatedNewTaskRecords___block_invoke_253(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "cancelling dependency task [tid:%@] of task %@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) _cancelTaskWithId:v3 guardedData:*(void *)(a1 + 48) persistCancel:1];
}

- (id)_addTask:(id)a3 withDependencies:(id)a4 guardedData:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = a5;
  id v10 = a4;
  id v11 = [v8 tags];
  id v12 = [v8 startTime];
  __int16 v13 = (void *)v9[2];

  id v20 = 0;
  uint64_t v14 = [v13 addTask:v8 startTime:v12 tags:v11 dependencies:v10 error:&v20];

  id v15 = v20;
  if (!v14) {
    goto LABEL_5;
  }
  uint64_t v16 = TRILogCategory_Server();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v14;
    _os_log_debug_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEBUG, "Running enqueue handler for %@ [tid:%@]", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverContext);
  [v8 runEnqueueHandlerUsingContext:WeakRetained];

  if (v15)
  {
LABEL_5:
    __int16 v18 = TRILogCategory_Server();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v12;
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "failed to add %@ with start time %@: %@", buf, 0x20u);
    }

    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)_cancelTaskWithId:(id)a3 guardedData:(id)a4 persistCancel:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (id *)a4;
  id v10 = TRILogCategory_Server();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v8;
    _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "canceling task with [tid:%@]", (uint8_t *)&v18, 0xCu);
  }

  id v11 = [v9[3] objectForKeyedSubscript:v8];
  id v12 = [v11 task];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    uint64_t v14 = [v11 task];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_serverContext);
    [v14 willBeCancelledByTaskQueue:self withContext:WeakRetained];
  }
  if (v11) {
    [v11 cancel];
  }
  BOOL v16 = [(TRITaskQueue *)self _removeTaskWithId:v8 guardedData:v9 persistRemove:v5];

  return v16;
}

- (BOOL)cancelTask:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __27__TRITaskQueue_cancelTask___block_invoke;
  v8[3] = &unk_1E6BBC748;
  id v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(_PASLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

uint64_t __27__TRITaskQueue_cancelTask___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _cancelTask:*(void *)(a1 + 40) guardedData:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_cancelDependenciesAndTaskWithId:(id)a3 guardedData:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (id *)a4;
  id v8 = [v7[2] tasksDependentOnTask:v6];
  id v9 = v8;
  if (v8 && [v8 count])
  {
    id v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v6;
      __int16 v24 = 2112;
      __int16 v25 = v9;
      _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "cannot cancel task with [tid:%@] since other tasks depend on it: %@", buf, 0x16u);
    }
    BOOL v11 = 0;
  }
  else
  {
    id v10 = [v7[2] directDependenciesOfTaskWithId:v6];
    BOOL v11 = [(TRITaskQueue *)self _cancelTaskWithId:v6 guardedData:v7 persistCancel:1];
    if (v10)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v10 = v10;
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v10);
            }
            -[TRITaskQueue _cancelDependenciesAndTaskWithId:guardedData:](self, "_cancelDependenciesAndTaskWithId:guardedData:", *(void *)(*((void *)&v17 + 1) + 8 * i), v7, (void)v17);
          }
          uint64_t v13 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v13);
      }
    }
  }

  return v11;
}

- (BOOL)_cancelTask:(id)a3 guardedData:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (id *)a4;
  id v8 = [v7[2] idForTask:v6];
  if (!v8)
  {
    id v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_debug_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEBUG, "cannot cancel task since it is not queued: %@", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_7;
  }
  BOOL v9 = [(TRITaskQueue *)self _cancelDependenciesAndTaskWithId:v8 guardedData:v7];
  id v10 = TRILogCategory_Server();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "cancelled task with [tid:%@]: %@", (uint8_t *)&v14, 0x16u);
    }
LABEL_7:
    BOOL v12 = 1;
    goto LABEL_11;
  }
  if (v11)
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "could not cancel task with [tid:%@]: %@", (uint8_t *)&v14, 0x16u);
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)cancelTasksWithTag:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__TRITaskQueue_cancelTasksWithTag___block_invoke;
  v8[3] = &unk_1E6BBC748;
  id v6 = v4;
  id v9 = v6;
  id v10 = self;
  BOOL v11 = &v12;
  [(_PASLock *)lock runWithLockAcquired:v8];
  LOBYTE(self) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

void __35__TRITaskQueue_cancelTasksWithTag___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3[2] taskIdsWithTag:a1[4]];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__TRITaskQueue_cancelTasksWithTag___block_invoke_2;
  v7[3] = &unk_1E6BBC720;
  uint64_t v5 = a1[6];
  void v7[4] = a1[5];
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  [v4 enumerateObjectsUsingBlock:v7];
}

uint64_t __35__TRITaskQueue_cancelTasksWithTag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _cancelTaskWithId:a2 guardedData:*(void *)(a1 + 40) persistCancel:1];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v4 + 24)) {
    char v5 = result;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)(v4 + 24) = v5;
  return result;
}

- (BOOL)cancelTasksWithTag:(id)a3 excludingTasks:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_259);
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  lock = self->_lock;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__TRITaskQueue_cancelTasksWithTag_excludingTasks___block_invoke_2;
  v14[3] = &unk_1E6BBC7B8;
  id v11 = v6;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  id v17 = self;
  uint64_t v18 = &v19;
  [(_PASLock *)lock runWithLockAcquired:v14];
  LOBYTE(self) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)self;
}

uint64_t __50__TRITaskQueue_cancelTasksWithTag_excludingTasks___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serialize];
}

void __50__TRITaskQueue_cancelTasksWithTag_excludingTasks___block_invoke_2(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  char v5 = (void *)v3[2];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v18[0] = *(void *)(a1 + 32);
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v8 = [v6 setWithArray:v7];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__TRITaskQueue_cancelTasksWithTag_excludingTasks___block_invoke_3;
  v15[3] = &unk_1E6BBC790;
  id v16 = *(id *)(a1 + 40);
  id v17 = v4;
  id v9 = v4;
  [v5 enumerateTasksWithTagsIntersectingTagSet:v8 block:v15];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__TRITaskQueue_cancelTasksWithTag_excludingTasks___block_invoke_4;
  v12[3] = &unk_1E6BBC720;
  uint64_t v10 = *(void *)(a1 + 56);
  v12[4] = *(void *)(a1 + 48);
  id v13 = v3;
  uint64_t v14 = v10;
  id v11 = v3;
  [v9 enumerateObjectsUsingBlock:v12];
}

void __50__TRITaskQueue_cancelTasksWithTag_excludingTasks___block_invoke_3(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 task];
  uint64_t v4 = [v3 serialize];
  if (([*(id *)(a1 + 32) containsObject:v4] & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_5;
    }
    char v5 = [v3 lastTask];
    if (!v5
      || (id v6 = v5,
          id v7 = *(void **)(a1 + 32),
          [v5 serialize],
          id v8 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(v7) = [v7 containsObject:v8],
          v8,
          v6,
          (v7 & 1) == 0))
    {
LABEL_5:
      id v9 = *(void **)(a1 + 40);
      uint64_t v10 = [v11 taskId];
      [v9 addObject:v10];
    }
  }
}

uint64_t __50__TRITaskQueue_cancelTasksWithTag_excludingTasks___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _cancelTaskWithId:a2 guardedData:*(void *)(a1 + 40) persistCancel:1];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v4 + 24)) {
    char v5 = result;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)(v4 + 24) = v5;
  return result;
}

- (BOOL)enumerateTasksWithTagsIntersectingTagSet:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __63__TRITaskQueue_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke;
  v26[3] = &unk_1E6BBC790;
  void v26[4] = self;
  id v9 = v8;
  id v27 = v9;
  uint64_t v10 = (void *)MEMORY[0x1E016EA80](v26);
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  lock = self->_lock;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __63__TRITaskQueue_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke_2;
  v18[3] = &unk_1E6BBC808;
  uint64_t v21 = &v22;
  id v12 = v6;
  id v19 = v12;
  id v13 = v10;
  id v20 = v13;
  [(_PASLock *)lock runWithLockAcquired:v18];
  if (*((unsigned char *)v23 + 24))
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__TRITaskQueue_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke_3;
    v16[3] = &unk_1E6BBC830;
    id v17 = v7;
    [v9 enumerateObjectsUsingBlock:v16];

    BOOL v14 = *((unsigned char *)v23 + 24) != 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __63__TRITaskQueue_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__33;
  id v17 = __Block_byref_object_dispose__33;
  id v18 = 0;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __63__TRITaskQueue_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke_262;
  uint64_t v10 = &unk_1E6BBC7E0;
  id v12 = &v13;
  id v5 = v3;
  id v11 = v5;
  [v4 runWithLockAcquired:&v7];
  if (v14[5])
  {
    uint64_t v6 = objc_msgSend(v5, "copyWithReplacementTask:", v7, v8, v9, v10);

    id v5 = (id)v6;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5, v7, v8, v9, v10);

  _Block_object_dispose(&v13, 8);
}

void __63__TRITaskQueue_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke_262(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a2 + 24);
  id v8 = [*(id *)(a1 + 32) taskId];
  uint64_t v4 = [v3 objectForKeyedSubscript:v8];
  uint64_t v5 = [v4 task];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __63__TRITaskQueue_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a2 + 16) enumerateTasksWithTagsIntersectingTagSet:a1[4] block:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __63__TRITaskQueue_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __21__TRITaskQueue_count__block_invoke;
  v5[3] = &unk_1E6BBC858;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __21__TRITaskQueue_count__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a2 + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)updateActivity:(id)a3 withStartDate:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = (_xpc_activity_s *)a3;
  xpc_object_t v7 = xpc_activity_copy_criteria(v6);
  if (!v7) {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  }
  uint64_t v8 = objc_opt_new();
  [v5 timeIntervalSinceDate:v8];
  double v10 = v9;

  if ((uint64_t)v10 <= 10) {
    int64_t v11 = 10;
  }
  else {
    int64_t v11 = (uint64_t)v10;
  }
  xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E4F142F8], 0);
  xpc_dictionary_set_int64(v7, (const char *)*MEMORY[0x1E4F14170], v11);
  xpc_dictionary_set_int64(v7, (const char *)*MEMORY[0x1E4F141A8], 1800);
  xpc_activity_set_criteria(v6, v7);
  xpc_activity_state_t state = xpc_activity_get_state(v6);

  uint64_t v13 = TRILogCategory_Server();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218496;
    int64_t v16 = v11;
    __int16 v17 = 2048;
    uint64_t v18 = 1800;
    __int16 v19 = 2048;
    xpc_activity_state_t v20 = state;
    _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "set activity delay %lld [+%lld] (state %ld)", (uint8_t *)&v15, 0x20u);
  }

  return 1;
}

- (void)_registerRetryActivityForDate:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "no date specified to retry, defaulting to 24 hours", buf, 2u);
    }

    id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:86400.0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverContext);
  xpc_object_t v7 = [WeakRetained keyValueStore];
  id v23 = 0;
  uint64_t v8 = +[TRISetupAssistantFetchUtils getValueInKeyValueStore:v7 key:@"post-upgrade-activity-in-progress" error:&v23];
  id v9 = v23;

  double v10 = [WeakRetained keyValueStore];
  id v22 = v9;
  int64_t v11 = +[TRISetupAssistantFetchUtils getValueInKeyValueStore:v10 key:@"post-upgrade-require-inexpensive-networking-activity-in-progress" error:&v22];
  id v12 = v22;

  if (([v8 isEqualToNumber:&unk_1F347BA38] & 1) != 0
    || [v11 isEqualToNumber:&unk_1F347BA38])
  {
    [v4 timeIntervalSinceNow];
    if (v13 > 7200.0)
    {
      BOOL v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v25 = v4;
        __int16 v26 = 2048;
        uint64_t v27 = 7200;
        _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "One of the tasks enqueued during post upgrade resulted in a retry. The original retry date is set to: %@. Modifying it to be %lld seconds from now", buf, 0x16u);
      }

      uint64_t v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:7200.0];

      id v4 = (id)v15;
    }
  }
  int64_t v16 = TRILogCategory_Server();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v4;
    _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "registering retry activity for date: %@", buf, 0xCu);
  }

  asyncQueue = self->_asyncQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __46__TRITaskQueue__registerRetryActivityForDate___block_invoke;
  v19[3] = &unk_1E6BB82A8;
  id v20 = v4;
  uint64_t v21 = self;
  id v18 = v4;
  dispatch_async(asyncQueue, v19);
}

void __46__TRITaskQueue__registerRetryActivityForDate___block_invoke(uint64_t a1)
{
  v2 = +[TRILaunchDaemonActivityDescriptor retryFailuresDescriptor];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__TRITaskQueue__registerRetryActivityForDate___block_invoke_2;
  v4[3] = &unk_1E6BB81D8;
  id v5 = *(id *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__TRITaskQueue__registerRetryActivityForDate___block_invoke_3;
  v3[3] = &unk_1E6BB8200;
  v3[4] = *(void *)(a1 + 40);
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:v2 checkInBlock:v4 asyncHandler:v3];
}

void __46__TRITaskQueue__registerRetryActivityForDate___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = a2;
  xpc_object_t xdict = xpc_activity_copy_criteria(v3);
  id v4 = *(void **)(a1 + 32);
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  [v4 timeIntervalSinceDate:v5];
  uint64_t v7 = (uint64_t)v6;

  int64_t v8 = v7 + 5;
  if (xdict && xpc_dictionary_get_count(xdict))
  {
    xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F14170], v8);
  }
  else
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);

    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x1E4F142F8], 0);
    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x1E4F14138], 0);
    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x1E4F14320], 1);
    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x1E4F14330], 1);
    xpc_dictionary_set_string(v9, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
    xpc_dictionary_set_int64(v9, (const char *)*MEMORY[0x1E4F141A8], 1800);
    xpc_dictionary_set_int64(v9, (const char *)*MEMORY[0x1E4F14170], v8);
    xpc_object_t xdict = v9;
  }
  xpc_activity_set_criteria(v3, xdict);
}

void __46__TRITaskQueue__registerRetryActivityForDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  notify_post((const char *)[@"com.apple.trial.Server.test.retries-networking" cStringUsingEncoding:4]);
  [*(id *)(a1 + 32) resumeWithXPCActivityDescriptor:v3 executeWhenSuspended:0];
}

- (void)_registerTaskQueueActivityForDate:(id)a3
{
  id v4 = a3;
  asyncQueue = self->_asyncQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__TRITaskQueue__registerTaskQueueActivityForDate___block_invoke;
  v7[3] = &unk_1E6BB82A8;
  id v8 = v4;
  xpc_object_t v9 = self;
  id v6 = v4;
  dispatch_async(asyncQueue, v7);
}

void __50__TRITaskQueue__registerTaskQueueActivityForDate___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = TRILogCategory_Server();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1DA291000, v2, OS_LOG_TYPE_DEFAULT, "registering TaskQueue activity for date: %@", buf, 0xCu);
  }

  id v4 = *(void **)(*(void *)(a1 + 40) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__TRITaskQueue__registerTaskQueueActivityForDate___block_invoke_269;
  v7[3] = &unk_1E6BBC638;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  [v4 runWithLockAcquired:v7];
}

void __50__TRITaskQueue__registerTaskQueueActivityForDate___block_invoke_269(int8x16_t *a1, void *a2)
{
  uint64_t v3 = a2;
  id v4 = v3;
  id v5 = (void *)a1[2].i64[0];
  if (v5)
  {
    if (!v3[4])
    {
LABEL_5:
      objc_storeStrong(v4 + 4, v5);
      uint64_t v6 = +[TRILaunchDaemonActivityDescriptor taskQueueDescriptor];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __50__TRITaskQueue__registerTaskQueueActivityForDate___block_invoke_2;
      v10[3] = &unk_1E6BBC880;
      int8x16_t v8 = a1[2];
      id v7 = (id)v8.i64[0];
      int8x16_t v11 = vextq_s8(v8, v8, 8uLL);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __50__TRITaskQueue__registerTaskQueueActivityForDate___block_invoke_270;
      v9[3] = &unk_1E6BB8200;
      void v9[4] = a1[2].i64[1];
      +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:v6 checkInBlock:v10 asyncHandler:v9];

      goto LABEL_6;
    }
    if (objc_msgSend((id)a1[2].i64[0], "compare:") != 1)
    {
      id v5 = (void *)a1[2].i64[0];
      goto LABEL_5;
    }
  }
LABEL_6:
}

void __50__TRITaskQueue__registerTaskQueueActivityForDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "TaskQueue checking in", v5, 2u);
  }

  [*(id *)(a1 + 32) updateActivity:v3 withStartDate:*(void *)(a1 + 40)];
}

void __50__TRITaskQueue__registerTaskQueueActivityForDate___block_invoke_270(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "TaskQueue running activity", v5, 2u);
  }

  [*(id *)(a1 + 32) resumeWithXPCActivityDescriptor:v3 executeWhenSuspended:0];
}

- (void)registerFinalizeBlockToRetryWithBlock:(id)a3
{
  id v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __54__TRITaskQueue_registerFinalizeBlockToRetryWithBlock___block_invoke;
  double v10 = &unk_1E6BBC8A8;
  uint64_t v12 = v13;
  id v5 = v4;
  id v11 = v5;
  uint64_t v6 = (void *)MEMORY[0x1E016EA80](&v7);
  -[TRITaskQueue registerFinalizeBlock:](self, "registerFinalizeBlock:", v6, v7, v8, v9, v10);

  _Block_object_dispose(v13, 8);
}

void __54__TRITaskQueue_registerFinalizeBlockToRetryWithBlock___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  if (a3 == 1
    && [v8 conformsToProtocol:&unk_1F3483128]
    && !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if ((int)[v8 retryCount] > 2)
    {
      id v11 = TRILogCategory_Server();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEFAULT, "finalizeBlock: exceeded the number of retry counts. Not doing anything", v12, 2u);
      }
    }
    else
    {
      if (v9) {
        [v9 timeIntervalSinceNow];
      }
      else {
        v10.n128_u64[0] = 0;
      }
      (*(void (**)(__n128))(*(void *)(a1 + 32) + 16))(v10);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

- (id)debugDescription
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__33;
  uint64_t v12 = __Block_byref_object_dispose__33;
  id v13 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__TRITaskQueue_debugDescription__block_invoke;
  v7[3] = &unk_1E6BBC858;
  void v7[4] = &v8;
  [(_PASLock *)lock runWithLockAcquired:v7];
  id v3 = objc_msgSend((id)v9[5], "_pas_mappedArrayWithTransform:", &__block_literal_global_275);
  id v4 = [v3 componentsJoinedByString:@"\n"];

  id v5 = [NSString stringWithFormat:@"TaskQueue with %lu tasks:\n%@", objc_msgSend((id)v9[5], "count"), v4];

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __32__TRITaskQueue_debugDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a2 + 16) allTasks];
  id v3 = [v7 allValues];
  uint64_t v4 = [v3 sortedArrayUsingSelector:sel_taskId];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

id __32__TRITaskQueue_debugDescription__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 dependencies];
  uint64_t v4 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_277);
  uint64_t v5 = [v4 componentsJoinedByString:@","];

  uint64_t v6 = NSString;
  id v7 = [v2 taskId];
  uint64_t v8 = [v7 intValue];
  id v9 = [v2 task];

  uint64_t v10 = [v6 stringWithFormat:@"%5d|%@ : %@", v8, v5, v9];

  return v10;
}

uint64_t __32__TRITaskQueue_debugDescription__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 stringValue];
}

- (id)activeActivityGrantingCapability:(unint64_t)a3
{
  id v3 = [(TRITaskQueue *)self activeActivityDescriptorGrantingCapability:a3];
  uint64_t v4 = [v3 activity];

  return v4;
}

- (id)activeActivityDescriptorGrantingCapability:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__33;
  char v14 = __Block_byref_object_dispose__33;
  id v15 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__TRITaskQueue_activeActivityDescriptorGrantingCapability___block_invoke;
  v9[3] = &unk_1E6BBC8F8;
  void v9[4] = &v10;
  void v9[5] = a3;
  [(_PASLock *)lock runWithLockAcquired:v9];
  if (v11[5])
  {
    uint64_t v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(id)v11[5] name];
      *(_DWORD *)buf = 134218242;
      unint64_t v17 = a3;
      __int16 v18 = 2114;
      __int16 v19 = v6;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Found Active XPC activity with capability %llu: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v17 = a3;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "No active XPC activity with capability %llu", buf, 0xCu);
    }
  }

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __59__TRITaskQueue_activeActivityDescriptorGrantingCapability___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  int v11 = 0;
  uint64_t v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [v3[6] allKeys];
    *(_DWORD *)buf = 134218242;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Looking for XPC activity granting capability %llu. Currently active activities: %{public}@", buf, 0x16u);
  }
  id v7 = v3[6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__TRITaskQueue_activeActivityDescriptorGrantingCapability___block_invoke_287;
  v9[3] = &unk_1E6BBC8D0;
  uint64_t v8 = *(void *)(a1 + 40);
  void v9[5] = *(void *)(a1 + 32);
  void v9[6] = v8;
  void v9[4] = v10;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
  _Block_object_dispose(v10, 8);
}

void __59__TRITaskQueue_activeActivityDescriptorGrantingCapability___block_invoke_287(void *a1, void *a2, void *a3)
{
  id v10 = a2;
  if (+[TRITaskCapabilityUtilities requiredCapabilities:areSupportedByAllowedCapabilities:](TRITaskCapabilityUtilities, "requiredCapabilities:areSupportedByAllowedCapabilities:", a1[6], [a3 capabilities]))
  {
    uint64_t v6 = [v10 activity];
    if (v6)
    {
      id v7 = (void *)v6;
      unsigned int v8 = [v10 generationCount];
      unsigned int v9 = *(_DWORD *)(*(void *)(a1[4] + 8) + 24);

      if (v8 >= v9)
      {
        *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = [v10 generationCount];
        objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
      }
    }
  }
}

- (void)waitForAsyncQueue
{
  dispatch_sync((dispatch_queue_t)self->_asyncQueue, &__block_literal_global_289);
  asyncQueue = self->_asyncQueue;
  dispatch_sync(asyncQueue, &__block_literal_global_291);
}

- (BOOL)ifNotPresentAddTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
  LODWORD(self) = [(TRITaskQueue *)self _addTask:v4 options:v5 taskId:0 tryRunningEligibleTasksImmediately:0];

  return self != 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_asyncQueue, 0);
  objc_storeStrong((id *)&self->_opGroup, 0);
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_destroyWeak((id *)&self->_serverContext);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end