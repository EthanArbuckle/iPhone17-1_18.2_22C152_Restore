@interface SBBackgroundFetchTask
+ (int)_nextSequenceNumber;
- (id)description;
- (id)initForAppInfo:(void *)a3 withCompletion:;
- (void)dealloc;
- (void)execute;
- (void)finishWithResult:(uint64_t)a1;
@end

@implementation SBBackgroundFetchTask

- (id)initForAppInfo:(void *)a3 withCompletion:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)SBBackgroundFetchTask;
    v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      *((_DWORD *)v8 + 2) = 0;
      uint64_t v9 = [v7 copy];
      id v10 = a1[5];
      a1[5] = (id)v9;

      objc_storeStrong(a1 + 2, a2);
      *((_DWORD *)a1 + 6) = +[SBBackgroundFetchTask _nextSequenceNumber];
    }
  }

  return a1;
}

- (void)execute
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_finished && !self->_lock_assertion)
  {
    v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = self;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Executing %{public}@", buf, 0xCu);
    }

    v5 = (void *)MEMORY[0x1E4F96478];
    id v6 = [(FBSApplicationInfo *)self->_appInfo processIdentity];
    v22 = [v5 targetWithProcessIdentity:v6];

    v21 = objc_msgSend(NSString, "stringWithFormat:", @"Background Content Fetching (%d)", self->_sequenceNumber);
    id v20 = objc_alloc(MEMORY[0x1E4F96318]);
    v23 = [MEMORY[0x1E4F96470] withReason:10006];
    v29[0] = v23;
    id v7 = [MEMORY[0x1E4F96338] grantUserInitiated];
    v29[1] = v7;
    v8 = [MEMORY[0x1E4F96380] grant];
    v29[2] = v8;
    uint64_t v9 = [MEMORY[0x1E4F963B8] grant];
    v29[3] = v9;
    id v10 = [MEMORY[0x1E4F96390] grantWithBackgroundPriority];
    v29[4] = v10;
    v11 = [MEMORY[0x1E4F96460] grantWithResistance:30];
    v29[5] = v11;
    objc_super v12 = [MEMORY[0x1E4F96368] terminateAfterInterval:30.0];
    v29[6] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:7];
    v14 = (RBSAssertion *)[v20 initWithExplanation:v21 target:v22 attributes:v13];
    lock_assertion = self->_lock_assertion;
    self->_lock_assertion = v14;

    objc_initWeak((id *)buf, self);
    v16 = self->_lock_assertion;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __32__SBBackgroundFetchTask_execute__block_invoke;
    v27[3] = &unk_1E6B0E288;
    objc_copyWeak(&v28, (id *)buf);
    [(RBSAssertion *)v16 setInvalidationHandler:v27];
    v17 = self->_lock_assertion;
    v18 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__SBBackgroundFetchTask_execute__block_invoke_13;
    block[3] = &unk_1E6AF5290;
    v25 = v17;
    v26 = self;
    v19 = v17;
    dispatch_async(v18, block);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  os_unfair_lock_unlock(p_lock);
}

void __32__SBBackgroundFetchTask_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __32__SBBackgroundFetchTask_execute__block_invoke_cold_1((uint64_t)WeakRetained, (uint64_t)v4, v6);
    }

    -[SBBackgroundFetchTask finishWithResult:]((uint64_t)WeakRetained, 3uLL);
  }
}

- (void)finishWithResult:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (*(unsigned char *)(a1 + 48))
    {
      os_unfair_lock_unlock(v4);
    }
    else
    {
      v5 = SBLogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        if (a2 >= 6)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown - %lu)", a2);
          id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v6 = off_1E6B0E2D0[a2];
        }
        *(_DWORD *)buf = 138543618;
        uint64_t v11 = a1;
        __int16 v12 = 2114;
        v13 = v6;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Finished %{public}@ with result: %{public}@", buf, 0x16u);
      }
      *(unsigned char *)(a1 + 48) = 1;
      [*(id *)(a1 + 32) invalidate];
      id v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;

      v8 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](*(void *)(a1 + 40));
      uint64_t v9 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;

      os_unfair_lock_unlock(v4);
      if (v8)
      {
        v8[2](v8, a1, a2);
      }
    }
  }
}

void __32__SBBackgroundFetchTask_execute__block_invoke_13(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = 0;
  char v3 = [v2 acquireWithError:&v6];
  id v4 = v6;
  if ((v3 & 1) == 0)
  {
    v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __32__SBBackgroundFetchTask_execute__block_invoke_13_cold_1(a1, (uint64_t)v4, v5);
    }

    -[SBBackgroundFetchTask finishWithResult:](*(void *)(a1 + 40), 3uLL);
  }
}

- (void)dealloc
{
  if (!self->_lock_finished)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"SBBackgroundMultitaskingManager.m", 135, @"deallocated without being finished: %@", self object file lineNumber description];
  }
  [(RBSAssertion *)self->_lock_assertion invalidate];
  v5.receiver = self;
  v5.super_class = (Class)SBBackgroundFetchTask;
  [(SBBackgroundFetchTask *)&v5 dealloc];
}

- (id)description
{
  char v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(FBSApplicationInfo *)self->_appInfo processIdentity];
  id v6 = [v3 stringWithFormat:@"<%@: %@; seq: %d>", v4, v5, self->_sequenceNumber];

  return v6;
}

+ (int)_nextSequenceNumber
{
  return _nextSequenceNumber_sequenceNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_completionHandler, 0);
  objc_storeStrong((id *)&self->_lock_assertion, 0);
  objc_storeStrong((id *)&self->_appInfo, 0);
}

void __32__SBBackgroundFetchTask_execute__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)char v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3(&dword_1D85BA000, a2, a3, "Assertion for %{public}@ was invalidated: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __32__SBBackgroundFetchTask_execute__block_invoke_13_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)char v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3(&dword_1D85BA000, a2, a3, "Error acquiring assertion for %{public}@: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end