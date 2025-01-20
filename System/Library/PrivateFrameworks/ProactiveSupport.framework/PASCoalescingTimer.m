@interface PASCoalescingTimer
@end

@implementation PASCoalescingTimer

void __63___PASCoalescingTimer__replaceCoalescingTimerUsingLockWitness___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__2386;
    v11[4] = __Block_byref_object_dispose__2387;
    id v12 = 0;
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    v4 = (void *)WeakRetained[5];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63___PASCoalescingTimer__replaceCoalescingTimerUsingLockWitness___block_invoke_2;
    v6[3] = &unk_1E5AEB0F8;
    uint64_t v5 = *(void *)(a1 + 40);
    v6[5] = v11;
    v6[6] = v5;
    v6[4] = &v7;
    [v4 runWithLockAcquired:v6];
    if (*((unsigned char *)v8 + 24)) {
      (*(void (**)(void))(v3[4] + 16))();
    }
    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(v11, 8);
  }
}

void __72___PASCoalescingTimer_processData_afterDelaySeconds_coalescingBehavior___block_invoke(uint64_t a1, void *a2)
{
  v16 = a2;
  uint64_t v3 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
  id v4 = v16[6];
  v16[6] = (id)v3;

  v6 = v16 + 3;
  id v5 = v16[3];
  uint64_t v7 = *(void **)(a1 + 48);
  if (v5)
  {
    uint64_t v8 = [v5 compare:v7];
    if (v8 == -1) {
      uint64_t v9 = v16 + 3;
    }
    else {
      uint64_t v9 = (id *)(a1 + 48);
    }
    if (v8 == -1) {
      char v10 = (id *)(a1 + 48);
    }
    else {
      char v10 = v16 + 3;
    }
    id v11 = *v9;
    id v12 = *v10;
    v13 = v12;
    v14 = v11;
    if (*(unsigned char *)(a1 + 56))
    {
      if (*(unsigned char *)(a1 + 56) != 1)
      {
LABEL_12:

        goto LABEL_14;
      }
      v14 = v12;
    }
    objc_storeStrong(v6, v14);
    goto LABEL_12;
  }
  id v15 = v7;
  id v11 = *v6;
  id *v6 = v15;
LABEL_14:

  [*(id *)(a1 + 32) _replaceCoalescingTimerUsingLockWitness:v16];
}

void __63___PASCoalescingTimer__replaceCoalescingTimerUsingLockWitness___block_invoke_2(void *a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a1[6] == *(void *)(a2 + 16);
  if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    uint64_t v3 = *(void *)(a1[5] + 8);
    id v4 = *(id *)(a2 + 48);
    id v5 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v4;
    uint64_t v8 = (id)a2;

    v6 = *(void **)(a2 + 48);
    *(void *)(a2 + 48) = 0;

    uint64_t v7 = (void *)v8[3];
    v8[3] = 0;
  }
}

void __46___PASCoalescingTimer_cancelPendingOperations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = *((void *)v2 + 1);
  if (v3)
  {
    dispatch_source_cancel(v3);
    id v4 = (void *)*((void *)v2 + 1);
  }
  else
  {
    id v4 = 0;
  }
  *((void *)v2 + 1) = 0;

  id v5 = (void *)*((void *)v2 + 3);
  ++*((void *)v2 + 2);
  *((void *)v2 + 3) = 0;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *((id *)v2 + 4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  objc_msgSend(*((id *)v2 + 4), "removeAllObjects", (void)v12);
  id v11 = (void *)*((void *)v2 + 6);
  ++*((void *)v2 + 5);
  *((void *)v2 + 6) = 0;
}

void __59___PASCoalescingTimer_processData_afterStrictDelaySeconds___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
  id v5 = (void *)*((void *)v3 + 6);
  *((void *)v3 + 6) = v4;

  dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v7 = (void *)*((void *)v3 + 5);
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  long long v13 = __59___PASCoalescingTimer_processData_afterStrictDelaySeconds___block_invoke_2;
  long long v14 = &unk_1E5AEB0A8;
  objc_copyWeak(v16, &location);
  v16[1] = v7;
  uint64_t v8 = v6;
  long long v15 = v8;
  dispatch_source_set_event_handler(v8, &v11);
  dispatch_time_t v9 = +[_PASDispatch dispatchTimeWithSecondsFromNow:](_PASDispatch, "dispatchTimeWithSecondsFromNow:", *(double *)(a1 + 48), v11, v12, v13, v14);
  if (v9 == -1)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"_PASCoalescingTimer.m" lineNumber:149 description:@"delaySeconds is too large!"];
  }
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(*(double *)(*(void *)(a1 + 32) + 16) * 1000000000.0));
  dispatch_resume(v8);
  [*((id *)v3 + 4) addObject:v8];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __59___PASCoalescingTimer_processData_afterStrictDelaySeconds___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__2386;
    v21 = __Block_byref_object_dispose__2387;
    id v22 = 0;
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    uint64_t v4 = (void *)WeakRetained[5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59___PASCoalescingTimer_processData_afterStrictDelaySeconds___block_invoke_18;
    v8[3] = &unk_1E5AEB080;
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v11 = &v17;
    uint64_t v12 = v5;
    uint64_t v10 = &v13;
    id v9 = *(id *)(a1 + 32);
    [v4 runWithLockAcquired:v8];
    if (*((unsigned char *)v14 + 24)) {
      (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v3[4] + 16))(v3[4], v18[5], v6, v7);
    }

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }
}

void __59___PASCoalescingTimer_processData_afterStrictDelaySeconds___block_invoke_18(void *a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a1[7] == *(void *)(a2 + 40);
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v4 = *(void *)(a1[6] + 8);
    id v5 = *(id *)(a2 + 48);
    uint64_t v6 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v5;
    uint64_t v8 = (id *)(id)a2;

    uint64_t v7 = *(void **)(a2 + 48);
    *(void *)(a2 + 48) = 0;

    [v8[4] removeObject:a1[4]];
  }
}

@end