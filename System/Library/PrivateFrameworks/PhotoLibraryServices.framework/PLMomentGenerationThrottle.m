@interface PLMomentGenerationThrottle
- (BOOL)isIdle;
- (BOOL)singleThreaded;
- (PLMomentGenerationThrottle)initWithName:(id)a3 canDelayAnyQOS:(BOOL)a4 singleThreadedMode:(BOOL)a5 timeProvider:(id)a6 targetQueue:(id)a7 target:(id)a8;
- (PLMomentGenerationThrottleTimeProvider)timeProvider;
- (void)_doAsyncUpdateWithCompletionBlock:(id)a3 tryAgainLaterBlock:(id)a4 tryAgainAfterCurrentExecutionBlock:(id)a5;
- (void)setSingleThreaded:(BOOL)a3;
- (void)update;
@end

@implementation PLMomentGenerationThrottle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_targetBlock, 0);
}

- (void)setSingleThreaded:(BOOL)a3
{
  self->_singleThreaded = a3;
}

- (BOOL)singleThreaded
{
  return self->_singleThreaded;
}

- (PLMomentGenerationThrottleTimeProvider)timeProvider
{
  return self->_timeProvider;
}

- (BOOL)isIdle
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isExecutingOrConsideringExecution);
  BOOL result = (v2 & 1) == 0
        && (unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_shouldRunAgain), (v3 & 1) == 0)
        && self->_nextExpectedRun == 0.0;
  return result;
}

- (void)update
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __36__PLMomentGenerationThrottle_update__block_invoke;
  v26[3] = &unk_1E586EC20;
  v26[4] = self;
  unsigned __int8 v3 = (void *)MEMORY[0x19F38D650](v26, a2);
  if (self->_singleThreaded)
  {
    if (atomic_exchange((atomic_uchar *volatile)&self->_isExecutingOrConsideringExecution, 1u))
    {
LABEL_13:
      v13 = PLMomentsGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        *(_DWORD *)buf = 138543362;
        v28 = name;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "[MomentGenerationThrottle] %{public}@ running sync: will check again when done...", buf, 0xCu);
      }

      atomic_store(1u, (unsigned __int8 *)&self->_shouldRunAgain);
    }
    else
    {
      *(void *)&long long v4 = 138543362;
      long long v21 = v4;
      while (1)
      {
        [(PLMomentGenerationThrottleTimeProvider *)self->_timeProvider currentTime];
        double lastRunEndTime = self->_lastRunEndTime;
        if (lastRunEndTime != 0.0 && vabdd_f64(v5, lastRunEndTime) > 300.0)
        {
          self->_lastRunDuration = 0.0;
          self->_double lastRunEndTime = 0.0;
          self->_nextExpectedRun = 0.0;
        }
        v7 = PLMomentsGetLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v8 = self->_name;
          *(_DWORD *)buf = v21;
          v28 = v8;
          _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "[MomentGenerationThrottle] %{public}@ running sync now...", buf, 0xCu);
        }

        self->_nextExpectedRun = 0.0;
        (*((void (**)(void))self->_targetBlock + 2))();
        unsigned __int8 v9 = atomic_exchange((atomic_uchar *volatile)&self->_shouldRunAgain, 0);
        v10 = PLMomentsGetLog();
        v11 = v10;
        if ((v9 & 1) == 0) {
          break;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v12 = self->_name;
          *(_DWORD *)buf = v21;
          v28 = v12;
          _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "[MomentGenerationThrottle] %{public}@ targetBlock executed, calling again (shouldRunAgain==YES)...", buf, 0xCu);
        }

        if (atomic_exchange((atomic_uchar *volatile)&self->_isExecutingOrConsideringExecution, 1u)) {
          goto LABEL_13;
        }
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v20 = self->_name;
        *(_DWORD *)buf = v21;
        v28 = v20;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "[MomentGenerationThrottle] %{public}@ done with sync update.", buf, 0xCu);
      }
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F8BA48] transaction:"-[PLMomentGenerationThrottle update]"];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __36__PLMomentGenerationThrottle_update__block_invoke_61;
    v24[3] = &unk_1E5875E18;
    v24[4] = self;
    id v16 = v15;
    id v25 = v16;
    v17 = (void *)MEMORY[0x19F38D650](v24);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __36__PLMomentGenerationThrottle_update__block_invoke_2;
    v22[3] = &unk_1E5875E18;
    v22[4] = self;
    id v23 = v16;
    id v18 = v16;
    v19 = (void *)MEMORY[0x19F38D650](v22);
    [(PLMomentGenerationThrottle *)self _doAsyncUpdateWithCompletionBlock:v3 tryAgainLaterBlock:v17 tryAgainAfterCurrentExecutionBlock:v19];
  }
}

void __36__PLMomentGenerationThrottle_update__block_invoke(uint64_t a1, double a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 32) currentTime];
  *(double *)(*(void *)(a1 + 32) + 64) = fmax(v4 - a2, 0.0);
  *(double *)(*(void *)(a1 + 32) + 72) = v4;
  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 57));
  double v5 = PLMomentsGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "[MomentGenerationThrottle] %{public}@ completion called.", (uint8_t *)&v7, 0xCu);
  }
}

uint64_t __36__PLMomentGenerationThrottle_update__block_invoke_61(uint64_t a1)
{
  [*(id *)(a1 + 32) update];
  unsigned __int8 v2 = *(void **)(a1 + 40);
  return [v2 stillAlive];
}

uint64_t __36__PLMomentGenerationThrottle_update__block_invoke_2(uint64_t a1)
{
  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 56));
  [*(id *)(a1 + 32) update];
  unsigned __int8 v2 = *(void **)(a1 + 40);
  return [v2 stillAlive];
}

- (void)_doAsyncUpdateWithCompletionBlock:(id)a3 tryAgainLaterBlock:(id)a4 tryAgainAfterCurrentExecutionBlock:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = 1;
  if (!self->_canDelayAnyQOS) {
    BOOL v11 = qos_class_self() < 0x16;
  }
  if (atomic_exchange((atomic_uchar *volatile)&self->_isExecutingOrConsideringExecution, 1u))
  {
    if ((atomic_exchange((atomic_uchar *volatile)&self->_shouldRunAgain, 1u) & 1) == 0)
    {
      if (v11) {
        int64_t v25 = 1000000000;
      }
      else {
        int64_t v25 = 100000000;
      }
      v26 = PLMomentsGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        name = self->_name;
        int v31 = 138543618;
        v32 = name;
        __int16 v33 = 2048;
        uint64_t v34 = 0x3FF0000000000000;
        _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEBUG, "[MomentGenerationThrottle] %{public}@ scheduling a check again after interval: %f", (uint8_t *)&v31, 0x16u);
      }

      dispatch_time_t v28 = dispatch_time(0, v25);
      dispatch_after(v28, (dispatch_queue_t)self->_targetQueue, v10);
    }
  }
  else
  {
    [(PLMomentGenerationThrottleTimeProvider *)self->_timeProvider currentTime];
    double v13 = v12;
    double lastRunEndTime = self->_lastRunEndTime;
    if (lastRunEndTime != 0.0 && vabdd_f64(v13, lastRunEndTime) > 300.0)
    {
      self->_double lastRunDuration = 0.0;
      self->_double lastRunEndTime = 0.0;
      self->_double nextExpectedRun = 0.0;
    }
    double lastRunDuration = self->_lastRunDuration;
    double nextExpectedRun = self->_nextExpectedRun;
    BOOL v17 = nextExpectedRun <= 0.0;
    BOOL v18 = vabdd_f64(nextExpectedRun, v13) <= 60.0 || nextExpectedRun <= 0.0;
    if (lastRunDuration == 0.0) {
      BOOL v18 = 0;
    }
    if (nextExpectedRun >= v13) {
      BOOL v17 = 1;
    }
    if (v11 && v17 && v18)
    {
      if (nextExpectedRun == 0.0)
      {
        double v19 = fmax(fmin(lastRunDuration, 60.0), 1.0);
        v20 = PLMomentsGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          long long v21 = self->_name;
          double v23 = self->_lastRunDuration;
          double v22 = self->_lastRunEndTime;
          int v31 = 138544130;
          v32 = v21;
          __int16 v33 = 2048;
          uint64_t v34 = *(void *)&v19;
          __int16 v35 = 2048;
          double v36 = v22;
          __int16 v37 = 2048;
          double v38 = v23;
          _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "[MomentGenerationThrottle] %{public}@ delaying execution for %.2f sec, last end time: %f, last duration: %f", (uint8_t *)&v31, 0x2Au);
        }

        self->_double nextExpectedRun = v13 + v19;
        dispatch_time_t v24 = dispatch_time(0, (uint64_t)(v19 * 1000000000.0));
        dispatch_after(v24, (dispatch_queue_t)self->_targetQueue, v9);
      }
      atomic_store(0, (unsigned __int8 *)&self->_isExecutingOrConsideringExecution);
    }
    else
    {
      uint64_t v29 = PLMomentsGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v30 = self->_name;
        int v31 = 138543362;
        v32 = v30;
        _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEBUG, "[MomentGenerationThrottle] %{public}@ running now...", (uint8_t *)&v31, 0xCu);
      }

      self->_double nextExpectedRun = 0.0;
      (*((void (**)(void))self->_targetBlock + 2))();
    }
  }
}

- (PLMomentGenerationThrottle)initWithName:(id)a3 canDelayAnyQOS:(BOOL)a4 singleThreadedMode:(BOOL)a5 timeProvider:(id)a6 targetQueue:(id)a7 target:(id)a8
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)PLMomentGenerationThrottle;
  double v19 = [(PLMomentGenerationThrottle *)&v30 init];
  if (!v19) {
    goto LABEL_9;
  }
  if (v18)
  {
    if (v15) {
      goto LABEL_4;
    }
LABEL_11:
    dispatch_time_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, v19, @"PLMomentGenerationThrottle.m", 60, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v17) {
      goto LABEL_5;
    }
LABEL_12:
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, v19, @"PLMomentGenerationThrottle.m", 61, @"Invalid parameter not satisfying: %@", @"targetQueue" object file lineNumber description];

    goto LABEL_5;
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, v19, @"PLMomentGenerationThrottle.m", 59, @"Invalid parameter not satisfying: %@", @"targetBlock" object file lineNumber description];

  if (!v15) {
    goto LABEL_11;
  }
LABEL_4:
  if (!v17) {
    goto LABEL_12;
  }
LABEL_5:
  uint64_t v20 = [v15 copy];
  name = v19->_name;
  v19->_name = (NSString *)v20;

  objc_storeStrong((id *)&v19->_targetQueue, a7);
  uint64_t v22 = [v18 copy];
  id targetBlock = v19->_targetBlock;
  v19->_id targetBlock = (id)v22;

  v19->_canDelayAnyQOS = a4;
  v19->_singleThreaded = a5;
  if (v16) {
    dispatch_time_t v24 = (PLMomentGenerationThrottleDefaultTimeProvider *)v16;
  }
  else {
    dispatch_time_t v24 = objc_alloc_init(PLMomentGenerationThrottleDefaultTimeProvider);
  }
  timeProvider = v19->_timeProvider;
  v19->_timeProvider = (PLMomentGenerationThrottleTimeProvider *)v24;

LABEL_9:
  return v19;
}

@end