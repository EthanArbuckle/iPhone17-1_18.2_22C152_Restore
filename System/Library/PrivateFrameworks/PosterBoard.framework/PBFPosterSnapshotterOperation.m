@interface PBFPosterSnapshotterOperation
- (NSString)debugDescription;
- (NSString)description;
- (PBFPosterSnapshotRequest)request;
- (PBFPosterSnapshotter)snapshotter;
- (PBFPosterSnapshotterOperation)initWithRequest:(id)a3 snapshotter:(id)a4;
- (int64_t)attempt;
- (int64_t)maxNumberOfAttempts;
- (unint64_t)advisoryQueuePriority;
- (void)_leaveMainGroup;
- (void)_snapshotterDidStart;
- (void)cancel;
- (void)dealloc;
- (void)setAdvisoryQueuePriority:(unint64_t)a3;
- (void)setAttempt:(int64_t)a3;
- (void)setMaxNumberOfAttempts:(int64_t)a3;
@end

@implementation PBFPosterSnapshotterOperation

- (PBFPosterSnapshotterOperation)initWithRequest:(id)a3 snapshotter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  NSClassFromString(&cfstr_Pbfpostersnaps_1.isa);
  if (!v9)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotterOperation initWithRequest:snapshotter:]();
    }
LABEL_19:
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323D614);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFPosterSnapshotRequestClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotterOperation initWithRequest:snapshotter:].cold.4();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323D678);
  }

  id v10 = v8;
  NSClassFromString(&cfstr_Pbfpostersnaps_3.isa);
  if (!v10)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotterOperation initWithRequest:snapshotter:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323D6DCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFPosterSnapshotterClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotterOperation initWithRequest:snapshotter:]();
    }
    goto LABEL_19;
  }

  v25.receiver = self;
  v25.super_class = (Class)PBFPosterSnapshotterOperation;
  v11 = [(NSBlockOperation *)&v25 init];
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    dispatch_group_t v13 = dispatch_group_create();
    objc_storeStrong((id *)&v12->_lock_group, v13);
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v12->_snapshotter, a4);
    [(PBFPosterSnapshotter *)v12->_snapshotter addObserver:v12];
    objc_initWeak(&location, v12);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __61__PBFPosterSnapshotterOperation_initWithRequest_snapshotter___block_invoke;
    v19[3] = &unk_1E6981F50;
    objc_copyWeak(&v23, &location);
    id v20 = v10;
    v14 = v13;
    v21 = v14;
    id v22 = v9;
    [(NSBlockOperation *)v12 addExecutionBlock:v19];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v12;
}

void __61__PBFPosterSnapshotterOperation_initWithRequest_snapshotter___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0 && (objc_msgSend(v4, "isFinished") & 1) == 0)
  {
    v5 = (id *)(a1 + 32);
    if (![*(id *)(a1 + 32) start] || (objc_msgSend(*v5, "isFinished") & 1) != 0)
    {
      v6 = [*v5 error];

      id v7 = PBFLogSnapshotter();
      id v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __61__PBFPosterSnapshotterOperation_initWithRequest_snapshotter___block_invoke_cold_1(v5, v2, v8);
        }
        goto LABEL_16;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = *v5;
        id v10 = objc_loadWeakRetained(v2);
        *(_DWORD *)buf = 138543618;
        id v18 = v9;
        __int16 v19 = 2114;
        id v20 = v10;
        v11 = "SnapshotterOperation finished %{public}@/%{public}@";
LABEL_15:
        _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_DEFAULT, v11, buf, 0x16u);

        goto LABEL_16;
      }
      goto LABEL_16;
    }
    [v4 _snapshotterDidStart];
    v12 = *(NSObject **)(a1 + 40);
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(20.0 * 1000000000.0));
    if (!dispatch_group_wait(v12, v13))
    {
      id v8 = PBFLogSnapshotter();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = *v5;
        id v10 = objc_loadWeakRetained(v2);
        *(_DWORD *)buf = 138543618;
        id v18 = v16;
        __int16 v19 = 2114;
        id v20 = v10;
        v11 = "SnapshotterOperation finished successfully %{public}@/%{public}@";
        goto LABEL_15;
      }
LABEL_16:

      goto LABEL_17;
    }
    v14 = *(void **)(a1 + 32);
    v15 = [NSString stringWithFormat:@"Snapshotter timedout waiting for request: %@", *(void *)(a1 + 48)];
    [v14 cancelWithReason:v15];
  }
LABEL_17:
}

- (void)dealloc
{
  [(PBFPosterSnapshotter *)self->_snapshotter removeObserver:self];
  snapshotter = self->_snapshotter;
  self->_snapshotter = 0;

  v4.receiver = self;
  v4.super_class = (Class)PBFPosterSnapshotterOperation;
  [(NSBlockOperation *)&v4 dealloc];
}

- (void)cancel
{
  v3 = [(PBFPosterSnapshotterOperation *)self snapshotter];
  [v3 cancelWithReason:@"NSOperation was cancelled"];

  v4.receiver = self;
  v4.super_class = (Class)PBFPosterSnapshotterOperation;
  [(PBFPosterSnapshotterOperation *)&v4 cancel];
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_request withName:@"request"];
  [(PBFPosterSnapshotter *)self->_snapshotter elapsedTime];
  id v5 = (id)objc_msgSend(v3, "appendFloat:withName:", @"elapsedTime");
  id v6 = (id)objc_msgSend(v3, "appendInteger:withName:", -[PBFPosterSnapshotterOperation attempt](self, "attempt"), @"attempt");
  id v7 = [v3 build];

  return (NSString *)v7;
}

- (NSString)debugDescription
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendSuper];
  id v5 = [(PBFPosterSnapshotRequest *)self->_request path];
  id v6 = (id)[v3 appendObject:v5 withName:@"path"];

  id v7 = [(PBFPosterSnapshotRequest *)self->_request definitions];
  id v8 = (id)[v3 appendObject:v7 withName:@"definitions"];

  [(PBFPosterSnapshotter *)self->_snapshotter elapsedTime];
  id v9 = (id)objc_msgSend(v3, "appendFloat:withName:", @"elapsedTime");
  id v10 = (id)objc_msgSend(v3, "appendInteger:withName:", -[PBFPosterSnapshotterOperation attempt](self, "attempt"), @"attempt");
  id v11 = (id)objc_msgSend(v3, "appendInteger:withName:", -[PBFPosterSnapshotterOperation queuePriority](self, "queuePriority"), @"queuePriority");
  id v12 = (id)objc_msgSend(v3, "appendInteger:withName:", -[PBFPosterSnapshotterOperation advisoryQueuePriority](self, "advisoryQueuePriority"), @"advisoryQueuePriority");
  dispatch_time_t v13 = [v3 build];

  return (NSString *)v13;
}

- (void)_snapshotterDidStart
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_snapshotterDidStart = 1;
  dispatch_group_enter((dispatch_group_t)self->_lock_group);
  os_unfair_lock_unlock(p_lock);
}

- (void)_leaveMainGroup
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 296);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_ERROR, "Snapshotter did not start: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (unint64_t)advisoryQueuePriority
{
  return self->_advisoryQueuePriority;
}

- (void)setAdvisoryQueuePriority:(unint64_t)a3
{
  self->_advisoryQueuePriority = a3;
}

- (PBFPosterSnapshotRequest)request
{
  return self->_request;
}

- (PBFPosterSnapshotter)snapshotter
{
  return self->_snapshotter;
}

- (int64_t)attempt
{
  return self->_attempt;
}

- (void)setAttempt:(int64_t)a3
{
  self->_attempt = a3;
}

- (int64_t)maxNumberOfAttempts
{
  return self->_maxNumberOfAttempts;
}

- (void)setMaxNumberOfAttempts:(int64_t)a3
{
  self->_maxNumberOfAttempts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotter, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_lock_group, 0);
}

- (void)initWithRequest:snapshotter:.cold.1()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithRequest:snapshotter:.cold.2()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithRequest:snapshotter:.cold.3()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithRequest:snapshotter:.cold.4()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __61__PBFPosterSnapshotterOperation_initWithRequest_snapshotter___block_invoke_cold_1(id *a1, id *location, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = *a1;
  id WeakRetained = objc_loadWeakRetained(location);
  uint64_t v7 = [*a1 error];
  int v8 = 138543874;
  id v9 = v5;
  __int16 v10 = 2114;
  id v11 = WeakRetained;
  __int16 v12 = 2114;
  dispatch_time_t v13 = v7;
  _os_log_error_impl(&dword_1D31CE000, a3, OS_LOG_TYPE_ERROR, "SnapshotterOperation failed %{public}@/%{public}@: %{public}@", (uint8_t *)&v8, 0x20u);
}

@end