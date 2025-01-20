@interface PBFPosterExtensionDataStorePrewarmHelper
- (NSString)activePhase;
- (PBFPosterExtensionDataStorePrewarmHelper)initWithPlan:(id)a3;
- (PBFPosterExtensionDataStorePrewarmPlan)plan;
- (id)_executePhase:(id)a3 executionBlock:(id)a4 context:(id)a5 timeout:(double)a6;
- (void)_fireCompletionHandler:(id)a3 reason:(id)a4;
- (void)_markAsDoneAndFireCompletionHandlers;
- (void)appendCompletionObserver:(id)a3;
- (void)dealloc;
- (void)executePrewarmWithExecutor:(id)a3 completion:(id)a4;
- (void)finishedWithError:(id)a3;
- (void)invalidate;
- (void)noteNonFatalError:(id)a3;
- (void)setActivePhase:(id)a3;
@end

@implementation PBFPosterExtensionDataStorePrewarmHelper

- (PBFPosterExtensionDataStorePrewarmHelper)initWithPlan:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"plan"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStorePrewarmHelper initWithPlan:](a2);
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32999F4);
  }
  v6 = v5;
  v42.receiver = self;
  v42.super_class = (Class)PBFPosterExtensionDataStorePrewarmHelper;
  v7 = [(PBFPosterExtensionDataStorePrewarmHelper *)&v42 init];
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v9 = [v6 copy];
    plan = v8->_plan;
    v8->_plan = (PBFPosterExtensionDataStorePrewarmPlan *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
    invalidationFlag = v8->_invalidationFlag;
    v8->_invalidationFlag = (BSAtomicFlag *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
    finishedFlag = v8->_finishedFlag;
    v8->_finishedFlag = (BSAtomicFlag *)v13;

    uint64_t v15 = objc_opt_new();
    lock_fatalErrorForPhase = v8->_lock_fatalErrorForPhase;
    v8->_lock_fatalErrorForPhase = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    lock_nonFatalErrorsForPhase = v8->_lock_nonFatalErrorsForPhase;
    v8->_lock_nonFatalErrorsForPhase = (NSMutableDictionary *)v17;

    v19 = objc_opt_new();
    v20 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v37 = v6;
    v21 = [v6 prewarmPhasePlan];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v39;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v39 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v38 + 1) + 8 * v25);
          dispatch_group_t v27 = dispatch_group_create();
          [v19 setObject:v27 forKeyedSubscript:v26];

          v28 = objc_opt_new();
          [v20 setObject:v28 forKeyedSubscript:v26];

          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v23);
    }

    uint64_t v29 = [v19 copy];
    dispatchGroupForPhase = v8->_dispatchGroupForPhase;
    v8->_dispatchGroupForPhase = (NSDictionary *)v29;

    uint64_t v31 = [v20 copy];
    completionFlagForPhase = v8->_completionFlagForPhase;
    v8->_completionFlagForPhase = (NSDictionary *)v31;

    [(PBFPosterExtensionDataStorePrewarmHelper *)v8 setActivePhase:@"PBFPrewarmPhaseNull"];
    dispatch_workloop_t inactive = dispatch_workloop_create_inactive("com.apple.PosterBoard.prewarmWorkloop");
    workloop = v8->_workloop;
    v8->_workloop = (OS_dispatch_workloop *)inactive;

    dispatch_workloop_set_autorelease_frequency((dispatch_workloop_t)v8->_workloop, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = v37;
  }

  return v8;
}

- (void)dealloc
{
  [(PBFPosterExtensionDataStorePrewarmHelper *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PBFPosterExtensionDataStorePrewarmHelper;
  [(PBFPosterExtensionDataStorePrewarmHelper *)&v3 dealloc];
}

- (void)executePrewarmWithExecutor:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    v8 = [(PBFPosterExtensionDataStorePrewarmHelper *)self plan];
    uint64_t v9 = [(PBFPosterExtensionDataStorePrewarmHelper *)self activePhase];
    char v10 = [v9 isEqual:@"PBFPrewarmPhaseNull"];

    if (v10)
    {
      uint64_t v11 = [v8 prewarmPhasePlan];
      uint64_t v12 = [v11 count];

      if (!v12)
      {
        if (v7) {
          (*((void (**)(id, uint64_t, void, void))v7 + 2))(v7, 1, 0, 0);
        }
        goto LABEL_16;
      }
      os_unfair_lock_lock(&self->_lock);
      uint64_t v13 = (void *)[v7 copy];
      id lock_completion = self->_lock_completion;
      self->_id lock_completion = v13;

      BSAbsoluteMachTimeNow();
      self->_lock_startTime = v15;
      os_unfair_lock_unlock(&self->_lock);
      v16 = PBFLogPrewarm();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v8 identifier];
        *(_DWORD *)buf = 138543362;
        v33 = v17;
        _os_log_impl(&dword_1D31CE000, v16, OS_LOG_TYPE_DEFAULT, "(%{public}@) Executing prewarm", buf, 0xCu);
      }
      v18 = PBFLogPrewarm();
      os_signpost_id_t v19 = os_signpost_id_generate(v18);

      v20 = PBFLogPrewarm();
      v21 = v20;
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        uint64_t v22 = [v8 prewarmPhasePlan];
        *(_DWORD *)buf = 138543362;
        v33 = v22;
        _os_signpost_emit_with_name_impl(&dword_1D31CE000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "ExecutePrewarm", "Phases: %{public}@", buf, 0xCu);
      }
      uint64_t v23 = self->_invalidationFlag;
      uint64_t v24 = self->_workloop;
      dispatch_activate((dispatch_object_t)v24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __82__PBFPosterExtensionDataStorePrewarmHelper_executePrewarmWithExecutor_completion___block_invoke;
      block[3] = &unk_1E6984230;
      id v27 = v8;
      v28 = v23;
      os_signpost_id_t v31 = v19;
      uint64_t v29 = self;
      id v30 = v6;
      uint64_t v25 = v23;
      dispatch_async((dispatch_queue_t)v24, block);
    }
    else
    {
      if (!v7)
      {
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v25 = [MEMORY[0x1E4F28C58] errorWithDomain:PBFPosterExtensionDataStorePrewarmHelperErrorDomain code:-31339 userInfo:0];
      (*((void (**)(id, void, void, BSAtomicFlag *))v7 + 2))(v7, 0, 0, v25);
    }

    goto LABEL_16;
  }
  if (v7)
  {
    v8 = [MEMORY[0x1E4F28C58] errorWithDomain:PBFPosterExtensionDataStorePrewarmHelperErrorDomain code:-31342 userInfo:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v8);
    goto LABEL_16;
  }
LABEL_17:
}

void __82__PBFPosterExtensionDataStorePrewarmHelper_executePrewarmWithExecutor_completion___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v2 = _os_activity_create(&dword_1D31CE000, "prewarm", MEMORY[0x1E4F144F8], OS_ACTIVITY_FLAG_DETACHED);
  long long v39 = objc_opt_new();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [*(id *)(a1 + 32) prewarmPhasePlan];
  uint64_t v3 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v41;
    v37 = v2;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v41 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v8 = PBFLogPrewarm();
        uint64_t v9 = v8;
        os_signpost_id_t v10 = *(void *)(a1 + 64);
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
        {
          *(_DWORD *)buf = 138543362;
          v46 = v7;
          _os_signpost_emit_with_name_impl(&dword_1D31CE000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ExecutePrewarmPhase", "Phase: %{public}@", buf, 0xCu);
        }

        BSAbsoluteMachTimeNow();
        double v12 = v11;
        uint64_t v13 = PBFLogPrewarm();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = [*(id *)(a1 + 32) identifier];
          *(_DWORD *)buf = 138543618;
          v46 = v14;
          __int16 v47 = 2114;
          v48 = v7;
          _os_log_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@) Start phase %{public}@", buf, 0x16u);
        }
        if ([*(id *)(a1 + 40) getFlag])
        {
          os_signpost_id_t v19 = PBFLogPrewarm();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v28 = [*(id *)(a1 + 32) identifier];
            *(_DWORD *)buf = 138543618;
            v46 = v28;
            __int16 v47 = 2114;
            v48 = v7;
            _os_log_impl(&dword_1D31CE000, v19, OS_LOG_TYPE_DEFAULT, "(%{public}@) Prewarm invalidated @ phase %{public}@", buf, 0x16u);
          }
          v2 = v37;
          goto LABEL_34;
        }
        [*(id *)(a1 + 48) setActivePhase:v7];
        [*(id *)(a1 + 32) timeoutIntervalForPhase:v7];
        double v16 = v15;
        uint64_t v17 = [*(id *)(a1 + 32) executionBlockForPhase:v7];
        v18 = v17;
        if (!v17) {
          uint64_t v17 = *(void **)(a1 + 56);
        }
        os_signpost_id_t v19 = _Block_copy(v17);

        double v20 = [*(id *)(a1 + 48) _executePhase:v7 executionBlock:v19 context:v39 timeout:v16];
        BSAbsoluteMachTimeNow();
        double v22 = v21;
        uint64_t v23 = PBFLogPrewarm();
        uint64_t v24 = v23;
        os_signpost_id_t v25 = *(void *)(a1 + 64);
        if (v20 != 0.0)
        {
          if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
          {
            *(_DWORD *)buf = 138543362;
            v46 = v7;
            _os_signpost_emit_with_name_impl(&dword_1D31CE000, v24, OS_SIGNPOST_INTERVAL_END, v25, "ExecutePrewarmPhase", "Phase: %{public}@", buf, 0xCu);
          }

          uint64_t v29 = PBFLogPrewarm();
          v2 = v37;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v36 = [*(id *)(a1 + 32) identifier];
            *(_DWORD *)buf = 138543874;
            v46 = v36;
            __int16 v47 = 2114;
            v48 = v7;
            __int16 v49 = 2114;
            double v50 = v20;
            _os_log_error_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_ERROR, "(%{public}@) Fatal error @ phase %{public}@: %{public}@", buf, 0x20u);
          }
          id v30 = PBFLogPrewarm();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            os_signpost_id_t v31 = [*(id *)(a1 + 32) identifier];
            *(_DWORD *)buf = 138543874;
            v46 = v31;
            __int16 v47 = 2114;
            v48 = v7;
            __int16 v49 = 2048;
            double v50 = v22 - v12;
            _os_log_impl(&dword_1D31CE000, v30, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ execution time: %f seconds", buf, 0x20u);
          }
LABEL_34:

          goto LABEL_35;
        }
        if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
        {
          *(_DWORD *)buf = 138543362;
          v46 = v7;
          _os_signpost_emit_with_name_impl(&dword_1D31CE000, v24, OS_SIGNPOST_INTERVAL_END, v25, "ExecutePrewarmPhase", "Phase: %{public}@", buf, 0xCu);
        }

        uint64_t v26 = PBFLogPrewarm();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = [*(id *)(a1 + 32) identifier];
          *(_DWORD *)buf = 138543874;
          v46 = v27;
          __int16 v47 = 2114;
          v48 = v7;
          __int16 v49 = 2048;
          double v50 = v22 - v12;
          _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@) Finished phase %{public}@; execution time: %f seconds",
            buf,
            0x20u);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
      v2 = v37;
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_35:

  [*(id *)(a1 + 48) setActivePhase:@"PBFPrewarmPhaseNull"];
  [*(id *)(a1 + 48) _markAsDoneAndFireCompletionHandlers];
  os_activity_scope_leave(&state);
  v32 = PBFLogPrewarm();
  v33 = v32;
  os_signpost_id_t v34 = *(void *)(a1 + 64);
  if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    v35 = [*(id *)(a1 + 32) prewarmPhasePlan];
    *(_DWORD *)buf = 138543362;
    v46 = v35;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v33, OS_SIGNPOST_INTERVAL_END, v34, "ExecutePrewarm", "Phases: %{public}@", buf, 0xCu);
  }
}

- (void)appendCompletionObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if ([(BSAtomicFlag *)self->_finishedFlag getFlag])
    {
      os_unfair_lock_unlock(&self->_lock);
      id v6 = PBFLogPrewarm();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [(PBFPosterExtensionDataStorePrewarmPlan *)self->_plan identifier];
        int v13 = 138543362;
        v14 = v7;
        _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) Firing completion observer after finish", (uint8_t *)&v13, 0xCu);
      }
      [(PBFPosterExtensionDataStorePrewarmHelper *)self _fireCompletionHandler:v4 reason:@"Post finish fire completion handler for prewarmer"];
    }
    else
    {
      lock_completionObservers = self->_lock_completionObservers;
      if (!lock_completionObservers)
      {
        uint64_t v9 = (NSMutableArray *)objc_opt_new();
        os_signpost_id_t v10 = self->_lock_completionObservers;
        self->_lock_completionObservers = v9;

        lock_completionObservers = self->_lock_completionObservers;
      }
      double v11 = (void *)[v4 copy];
      double v12 = _Block_copy(v11);
      [(NSMutableArray *)lock_completionObservers bs_safeAddObject:v12];

      os_unfair_lock_unlock(p_lock);
    }
  }
}

- (id)_executePhase:(id)a3 executionBlock:(id)a4 context:(id)a5 timeout:(double)a6
{
  v55[1] = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v10 = (__CFString *)a3;
  double v11 = (void (**)(id, id, id, PBFPosterExtensionDataStorePrewarmHelper *))a4;
  id v12 = a5;
  if (v10 && v11)
  {
    int v13 = [(NSDictionary *)self->_dispatchGroupForPhase objectForKeyedSubscript:v10];
    dispatch_group_enter(v13);
    v14 = v11[2](v11, v10, v12, self);
    uint64_t v15 = (void *)[v14 copy];

    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v17 = _Block_copy(v15);
    id lock_cancellationHandlerForCurrentPhase = self->_lock_cancellationHandlerForCurrentPhase;
    self->_id lock_cancellationHandlerForCurrentPhase = v17;

    os_unfair_lock_unlock(&self->_lock);
    dispatch_time_t v19 = dispatch_time(0, (uint64_t)(a6 * 1000000000.0));
    if (dispatch_group_wait(v13, v19))
    {
      if (v15)
      {
        double v20 = [(NSDictionary *)self->_completionFlagForPhase objectForKeyedSubscript:v10];
        char v21 = [v20 getFlag];

        if ((v21 & 1) == 0)
        {
          uint64_t block = MEMORY[0x1E4F143A8];
          uint64_t v42 = 3221225472;
          long long v43 = __89__PBFPosterExtensionDataStorePrewarmHelper__executePhase_executionBlock_context_timeout___block_invoke;
          uint64_t v44 = &unk_1E69830B8;
          id v45 = v15;
          dispatch_async(MEMORY[0x1E4F14428], &block);
        }
      }
      double v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = PBFPosterExtensionDataStorePrewarmHelperErrorDomain;
      uint64_t v52 = @"phase";
      v53 = v10;
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      os_signpost_id_t v25 = [v22 errorWithDomain:v23 code:-31340 userInfo:v24];
      [(PBFPosterExtensionDataStorePrewarmHelper *)self noteNonFatalError:v25];

      uint64_t v26 = PBFLogPrewarm();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      id v27 = [(PBFPosterExtensionDataStorePrewarmPlan *)self->_plan identifier];
      *(_DWORD *)buf = 138543874;
      __int16 v47 = v27;
      __int16 v48 = 2114;
      __int16 v49 = v10;
      __int16 v50 = 2048;
      double v51 = a6;
      _os_log_error_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_ERROR, "(%{public}@) phase %{public}@ exceeded timeout of %f seconds", buf, 0x20u);
    }
    else
    {
      uint64_t v26 = PBFLogPrewarm();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
LABEL_18:

        os_unfair_lock_lock(&self->_lock);
        id v33 = self->_lock_cancellationHandlerForCurrentPhase;
        self->_id lock_cancellationHandlerForCurrentPhase = 0;

        v32 = [(NSMutableDictionary *)self->_lock_fatalErrorForPhase objectForKeyedSubscript:v10];
        os_signpost_id_t v34 = [(NSMutableDictionary *)self->_lock_nonFatalErrorsForPhase objectForKey:v10];
        if ([v34 count])
        {
          v35 = PBFLogPrewarm();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            [(PBFPosterExtensionDataStorePrewarmPlan *)self->_plan identifier];
            id v40 = v12;
            v37 = v36 = v15;
            *(_DWORD *)buf = 138543874;
            __int16 v47 = v37;
            __int16 v48 = 2114;
            __int16 v49 = v10;
            __int16 v50 = 2114;
            double v51 = *(double *)&v34;
            _os_log_impl(&dword_1D31CE000, v35, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ received non fatal errors: %{public}@", buf, 0x20u);

            uint64_t v15 = v36;
            id v12 = v40;
          }
        }
        long long v38 = -[NSDictionary objectForKeyedSubscript:](self->_completionFlagForPhase, "objectForKeyedSubscript:", v10, v40, block, v42, v43, v44);
        [v38 setFlag:1];

        os_unfair_lock_unlock(p_lock);
        goto LABEL_23;
      }
      id v27 = [(PBFPosterExtensionDataStorePrewarmPlan *)self->_plan identifier];
      *(_DWORD *)buf = 138543618;
      __int16 v47 = v27;
      __int16 v48 = 2114;
      __int16 v49 = v10;
      _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ received completion", buf, 0x16u);
    }

    goto LABEL_18;
  }
  v28 = PBFLogPrewarm();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[PBFPosterExtensionDataStorePrewarmHelper _executePhase:executionBlock:context:timeout:]();
  }

  uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v30 = PBFPosterExtensionDataStorePrewarmHelperErrorDomain;
  if (v10) {
    os_signpost_id_t v31 = v10;
  }
  else {
    os_signpost_id_t v31 = @"(unknown phase)";
  }
  v54 = @"phase";
  v55[0] = v31;
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
  v32 = [v29 errorWithDomain:v30 code:-31341 userInfo:v13];
LABEL_23:

  return v32;
}

uint64_t __89__PBFPosterExtensionDataStorePrewarmHelper__executePhase_executionBlock_context_timeout___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_markAsDoneAndFireCompletionHandlers
{
  OUTLINED_FUNCTION_7_3();
  v1 = [*v0 identifier];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_17(&dword_1D31CE000, v2, v3, "(%{public}@) populating finalized error: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_fireCompletionHandler:(id)a3 reason:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    p_lock = &self->_lock;
    id v8 = a4;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v9 = self->_lock_finalizedAmalgamtedNonfatalErrors;
    os_signpost_id_t v10 = self->_lock_finalizedError;
    os_unfair_lock_unlock(p_lock);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__PBFPosterExtensionDataStorePrewarmHelper__fireCompletionHandler_reason___block_invoke;
    v13[3] = &unk_1E6981090;
    uint64_t v15 = v9;
    id v16 = v6;
    v14 = v10;
    double v11 = v9;
    id v12 = v10;
    PBFDispatchAsyncWithString(v8, QOS_CLASS_USER_INITIATED, v13);
  }
}

uint64_t __74__PBFPosterExtensionDataStorePrewarmHelper__fireCompletionHandler_reason___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, BOOL, void))(a1[6] + 16))(a1[6], a1[4] == 0, a1[5]);
}

- (void)invalidate
{
  uint64_t v3 = [(id)OUTLINED_FUNCTION_6_2(a1) identifier];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_ERROR, "(%{public}@) Invalidation *ALREADY* received; bailing.",
    (uint8_t *)&v4,
    0xCu);
}

uint64_t __54__PBFPosterExtensionDataStorePrewarmHelper_invalidate__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)noteNonFatalError:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v6 = [(PBFPosterExtensionDataStorePrewarmHelper *)self activePhase];
    char v7 = [(BSAtomicFlag *)self->_invalidationFlag getFlag];
    id v8 = PBFLogPrewarm();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v9)
      {
        os_signpost_id_t v10 = [(PBFPosterExtensionDataStorePrewarmPlan *)self->_plan identifier];
        int v16 = 138543874;
        uint64_t v17 = v10;
        __int16 v18 = 2114;
        dispatch_time_t v19 = v6;
        __int16 v20 = 2114;
        id v21 = v4;
        _os_log_error_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_ERROR, "(%{public}@) Received non fatal error after invalidation for phase %{public}@: %{public}@", (uint8_t *)&v16, 0x20u);
      }
    }
    else
    {
      if (v9)
      {
        uint64_t v15 = [(PBFPosterExtensionDataStorePrewarmPlan *)self->_plan identifier];
        int v16 = 138543874;
        uint64_t v17 = v15;
        __int16 v18 = 2114;
        dispatch_time_t v19 = v6;
        __int16 v20 = 2114;
        id v21 = v4;
        _os_log_error_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_ERROR, "(%{public}@) Received non fatal error for phase %{public}@: %{public}@", (uint8_t *)&v16, 0x20u);
      }
      double v11 = [(NSDictionary *)self->_completionFlagForPhase objectForKeyedSubscript:v6];
      char v12 = [v11 getFlag];

      if (v12) {
        goto LABEL_12;
      }
      int v13 = [(NSMutableDictionary *)self->_lock_nonFatalErrorsForPhase objectForKeyedSubscript:v6];

      if (!v13)
      {
        v14 = objc_opt_new();
        [(NSMutableDictionary *)self->_lock_nonFatalErrorsForPhase setObject:v14 forKeyedSubscript:v6];
      }
      id v8 = [(NSMutableDictionary *)self->_lock_nonFatalErrorsForPhase objectForKeyedSubscript:v6];
      [v8 addObject:v4];
    }

LABEL_12:
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)finishedWithError:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(PBFPosterExtensionDataStorePrewarmHelper *)self activePhase];
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    char v7 = PBFLogPrewarm();
    id v8 = v7;
    if (v4)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        BOOL v9 = [(PBFPosterExtensionDataStorePrewarmPlan *)self->_plan identifier];
        int v16 = 138543874;
        uint64_t v17 = v9;
        __int16 v18 = 2114;
        dispatch_time_t v19 = v6;
        __int16 v20 = 2114;
        id v21 = v4;
        _os_log_error_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_ERROR, "(%{public}@) Received fatal error after invalidation for phase %{public}@: %{public}@", (uint8_t *)&v16, 0x20u);
LABEL_13:
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(PBFPosterExtensionDataStorePrewarmPlan *)self->_plan identifier];
      int v16 = 138543618;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      dispatch_time_t v19 = v6;
      _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@) Finished %{public}@ but prewarmer was invalidated", (uint8_t *)&v16, 0x16u);
      goto LABEL_13;
    }

    goto LABEL_15;
  }
  os_signpost_id_t v10 = [(NSDictionary *)self->_completionFlagForPhase objectForKeyedSubscript:v6];
  int v11 = [v10 setFlag:1];

  if (!v11)
  {
LABEL_15:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_16;
  }
  if (v4) {
    [(NSMutableDictionary *)self->_lock_fatalErrorForPhase setObject:v4 forKeyedSubscript:v6];
  }
  char v12 = [(NSDictionary *)self->_dispatchGroupForPhase objectForKeyedSubscript:v6];
  int v13 = PBFLogPrewarm();
  v14 = v13;
  if (v4)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStorePrewarmHelper finishedWithError:]();
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [(PBFPosterExtensionDataStorePrewarmPlan *)self->_plan identifier];
    int v16 = 138543618;
    uint64_t v17 = v15;
    __int16 v18 = 2114;
    dispatch_time_t v19 = v6;
    _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) received finish for phase %{public}@", (uint8_t *)&v16, 0x16u);
  }
  os_unfair_lock_unlock(p_lock);
  if (v12)
  {
    dispatch_group_leave(v12);
  }
LABEL_16:
}

- (PBFPosterExtensionDataStorePrewarmPlan)plan
{
  return (PBFPosterExtensionDataStorePrewarmPlan *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)activePhase
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setActivePhase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePhase, 0);
  objc_storeStrong((id *)&self->_plan, 0);
  objc_storeStrong((id *)&self->_lock_finalizedAmalgamtedNonfatalErrors, 0);
  objc_storeStrong((id *)&self->_lock_finalizedError, 0);
  objc_storeStrong(&self->_lock_cancellationHandlerForCurrentPhase, 0);
  objc_storeStrong((id *)&self->_lock_fatalErrorForPhase, 0);
  objc_storeStrong((id *)&self->_lock_nonFatalErrorsForPhase, 0);
  objc_storeStrong(&self->_lock_completion, 0);
  objc_storeStrong((id *)&self->_lock_completionObservers, 0);
  objc_storeStrong((id *)&self->_dispatchGroupForPhase, 0);
  objc_storeStrong((id *)&self->_completionFlagForPhase, 0);
  objc_storeStrong((id *)&self->_finishedFlag, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
}

- (void)initWithPlan:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_executePhase:executionBlock:context:timeout:.cold.1()
{
  OUTLINED_FUNCTION_7_3();
  v1 = [(id)OUTLINED_FUNCTION_6_2(v0) identifier];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_17(&dword_1D31CE000, v2, v3, "(%{public}@) phase %{public}@ failed to execute; no execution block or phase is unknown? ",
    v4,
    v5,
    v6,
    v7,
    v8);
}

- (void)finishedWithError:.cold.1()
{
  OUTLINED_FUNCTION_7_3();
  v1 = [(id)OUTLINED_FUNCTION_6_2(v0) identifier];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_17(&dword_1D31CE000, v2, v3, "(%{public}@) received finish for phase %{public}@", v4, v5, v6, v7, v8);
}

@end