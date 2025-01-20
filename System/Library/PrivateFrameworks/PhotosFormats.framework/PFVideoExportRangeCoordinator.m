@interface PFVideoExportRangeCoordinator
- (BOOL)cancelled;
- (BOOL)waitForAvailabilityOfRange:(_NSRange)a3 timeout:(unint64_t)a4 error:(id *)a5;
- (NSMutableArray)waitingCallers;
- (OS_dispatch_queue)rangeCoordinatorStateQueue;
- (PFVideoExportRangeCoordinator)init;
- (_NSRange)availableRange;
- (void)cancel;
- (void)setAvailableRange:(_NSRange)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setRangeCoordinatorStateQueue:(id)a3;
- (void)setWaitingCallers:(id)a3;
- (void)updateAvailableRange:(_NSRange)a3;
@end

@implementation PFVideoExportRangeCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeCoordinatorStateQueue, 0);

  objc_storeStrong((id *)&self->_waitingCallers, 0);
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setRangeCoordinatorStateQueue:(id)a3
{
}

- (OS_dispatch_queue)rangeCoordinatorStateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWaitingCallers:(id)a3
{
}

- (NSMutableArray)waitingCallers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAvailableRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_availableRange, &v3, 16, 1, 0);
}

- (_NSRange)availableRange
{
  objc_copyStruct(v4, &self->_availableRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)cancel
{
  rangeCoordinatorStateQueue = self->_rangeCoordinatorStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PFVideoExportRangeCoordinator_cancel__block_invoke;
  block[3] = &unk_1E5B2F5F0;
  block[4] = self;
  dispatch_sync(rangeCoordinatorStateQueue, block);
}

uint64_t __39__PFVideoExportRangeCoordinator_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) enumerateObjectsUsingBlock:&__block_literal_global_11500];
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  NSUInteger v2 = *(void **)(a1 + 32);

  return [v2 setCancelled:1];
}

void __39__PFVideoExportRangeCoordinator_cancel__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setCancelled:1];
  [v2 resume];
}

- (BOOL)waitForAvailabilityOfRange:(_NSRange)a3 timeout:(unint64_t)a4 error:(id *)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__11503;
  v38 = __Block_byref_object_dispose__11504;
  id v39 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  rangeCoordinatorStateQueue = self->_rangeCoordinatorStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PFVideoExportRangeCoordinator_waitForAvailabilityOfRange_timeout_error___block_invoke;
  block[3] = &unk_1E5B2F048;
  _NSRange v29 = a3;
  block[4] = self;
  void block[5] = &v30;
  block[6] = &v34;
  dispatch_sync(rangeCoordinatorStateQueue, block);
  if (!*((unsigned char *)v31 + 24))
  {
    if (v35[5])
    {
      __uint64_t v15 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      [(id)v35[5] waitWithTimeout:a4];
      __uint64_t v16 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      v17 = self->_rangeCoordinatorStateQueue;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __74__PFVideoExportRangeCoordinator_waitForAvailabilityOfRange_timeout_error___block_invoke_235;
      v27[3] = &unk_1E5B2F690;
      v27[4] = self;
      v27[5] = &v34;
      dispatch_sync(v17, v27);
      if ([(id)v35[5] cancelled])
      {
        v18 = MEMORY[0x1E4F14500];
        id v19 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v48.NSUInteger location = location;
          v48.NSUInteger length = length;
          v24 = NSStringFromRange(v48);
          *(_DWORD *)buf = 138543618;
          v41 = v24;
          __int16 v42 = 2048;
          *(double *)&NSUInteger v43 = (double)(v16 - v15) / 1000000000.0;
          _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Request for range %{public}@ cancelled after %.3fs", buf, 0x16u);
        }
        if (a5)
        {
          id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PFVideoExportErrorDomain" code:5 userInfo:0];
          goto LABEL_6;
        }
LABEL_22:
        BOOL v14 = 0;
        goto LABEL_23;
      }
      char v20 = [(id)v35[5] requestedRangeIsAvailable];
      id v21 = MEMORY[0x1E4F14500];
      if ((v20 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v50.NSUInteger location = location;
          v50.NSUInteger length = length;
          v26 = NSStringFromRange(v50);
          *(_DWORD *)buf = 138543874;
          v41 = v26;
          __int16 v42 = 2048;
          NSUInteger v43 = location + length;
          __int16 v44 = 2048;
          double v45 = (double)(v16 - v15) / 1000000000.0;
          _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Video export range coordinator: request for range %{public}@ (= file size %lu) timed out after %.3fs", buf, 0x20u);
        }
        if (a5)
        {
          id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PFVideoExportErrorDomain" code:4 userInfo:0];
          goto LABEL_6;
        }
        goto LABEL_22;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        v49.NSUInteger location = location;
        v49.NSUInteger length = length;
        v25 = NSStringFromRange(v49);
        *(_DWORD *)buf = 138543618;
        v41 = v25;
        __int16 v42 = 2048;
        *(double *)&NSUInteger v43 = (double)(v16 - v15) / 1000000000.0;
        _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Video export range coordinator: request for range %{public}@ unblocked after %.3fs, range available", buf, 0x16u);
      }
    }
    BOOL v14 = 1;
    goto LABEL_23;
  }
  v11 = MEMORY[0x1E4F14500];
  id v12 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v47.NSUInteger location = location;
    v47.NSUInteger length = length;
    v23 = NSStringFromRange(v47);
    *(_DWORD *)buf = 138543362;
    v41 = v23;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Request for range %{public}@ rejected in cancelled state", buf, 0xCu);
  }
  if (!a5) {
    goto LABEL_22;
  }
  id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PFVideoExportErrorDomain" code:5 userInfo:0];
LABEL_6:
  BOOL v14 = 0;
  *a5 = v13;
LABEL_23:
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v14;
}

uint64_t __74__PFVideoExportRangeCoordinator_waitForAvailabilityOfRange_timeout_error___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  NSRange v2 = NSIntersectionRange(*(NSRange *)(a1 + 56), *(NSRange *)(*(void *)(a1 + 32) + 32));
  uint64_t result = [*(id *)(a1 + 32) cancelled];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    NSUInteger v4 = *(void *)(a1 + 56);
    NSUInteger v5 = *(void *)(a1 + 64);
    if (v4 != v2.location || v5 != v2.length)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        v20.NSUInteger location = v4;
        v20.NSUInteger length = v5;
        v10 = NSStringFromRange(v20);
        v11 = NSStringFromRange(*(NSRange *)(*(void *)(a1 + 32) + 32));
        id v12 = NSStringFromRange(v2);
        int v13 = 138543874;
        BOOL v14 = v10;
        __int16 v15 = 2114;
        __uint64_t v16 = v11;
        __int16 v17 = 2114;
        v18 = v12;
        _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Video export range coordinator range unavailable: requested range %{public}@, available range %{public}@, intersection %{public}@", (uint8_t *)&v13, 0x20u);

        NSUInteger v4 = *(void *)(a1 + 56);
        NSUInteger v5 = *(void *)(a1 + 64);
      }
      uint64_t v7 = +[PFVideoExportRangeWaitingCaller waitingCallerWithRequestedRange:](PFVideoExportRangeWaitingCaller, "waitingCallerWithRequestedRange:", v4, v5);
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    }
  }
  return result;
}

uint64_t __74__PFVideoExportRangeCoordinator_waitForAvailabilityOfRange_timeout_error___block_invoke_235(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  if (result)
  {
    NSUInteger v3 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return [v3 removeObject:v4];
  }
  return result;
}

- (void)updateAvailableRange:(_NSRange)a3
{
  rangeCoordinatorStateQueue = self->_rangeCoordinatorStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PFVideoExportRangeCoordinator_updateAvailableRange___block_invoke;
  block[3] = &unk_1E5B2F020;
  block[4] = self;
  _NSRange v5 = a3;
  dispatch_sync(rangeCoordinatorStateQueue, block);
}

void __54__PFVideoExportRangeCoordinator_updateAvailableRange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAvailableRange:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__11503;
  v9 = __Block_byref_object_dispose__11504;
  id v10 = 0;
  NSRange v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__PFVideoExportRangeCoordinator_updateAvailableRange___block_invoke_229;
  v3[3] = &unk_1E5B2EFF8;
  long long v4 = *(_OWORD *)(a1 + 40);
  v3[4] = &v5;
  [v2 enumerateObjectsUsingBlock:v3];
  if (v6[5]) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "removeObjectsAtIndexes:");
  }
  _Block_object_dispose(&v5, 8);
}

void __54__PFVideoExportRangeCoordinator_updateAvailableRange___block_invoke_229(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (objc_msgSend(v5, "canResumeForRange:", *(void *)(a1 + 40), *(void *)(a1 + 48)))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    if (v7)
    {
      id v8 = v7;
      v9 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v8;
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28E60] indexSet];
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      v9 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addIndex:a3];
    [v5 setRequestedRangeIsAvailable:1];
    [v5 resume];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      id v12 = NSStringFromRange(*(NSRange *)(a1 + 40));
      uint64_t v13 = *(void *)(a1 + 48) + *(void *)(a1 + 40);
      int v14 = 138543874;
      __int16 v15 = v12;
      __int16 v16 = 2048;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Range coordinator added range %{public}@ (= file size %lu bytes), unblocked waiting caller %@", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (PFVideoExportRangeCoordinator)init
{
  v9.receiver = self;
  v9.super_class = (Class)PFVideoExportRangeCoordinator;
  NSRange v2 = [(PFVideoExportRangeCoordinator *)&v9 init];
  if (v2)
  {
    NSUInteger v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.pfvideoexport.range-coordinator", v3);
    rangeCoordinatorStateQueue = v2->_rangeCoordinatorStateQueue;
    v2->_rangeCoordinatorStateQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    waitingCallers = v2->_waitingCallers;
    v2->_waitingCallers = (NSMutableArray *)v6;

    v2->_availableRange.NSUInteger location = 0;
    v2->_availableRange.NSUInteger length = 0;
  }
  return v2;
}

@end