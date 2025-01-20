@interface PBFComplicationSnapshotterOperation
- (NSString)description;
- (PBFComplicationSnapshotRequest)request;
- (PBFComplicationSnapshotter)snapshotter;
- (PBFComplicationSnapshotterOperation)initWithRequest:(id)a3 snapshotter:(id)a4;
- (int64_t)attempt;
- (int64_t)maxNumberOfAttempts;
- (void)_leaveMainGroup;
- (void)_snapshotterDidStart;
- (void)cancel;
- (void)dealloc;
- (void)setAttempt:(int64_t)a3;
- (void)setMaxNumberOfAttempts:(int64_t)a3;
@end

@implementation PBFComplicationSnapshotterOperation

- (PBFComplicationSnapshotterOperation)initWithRequest:(id)a3 snapshotter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  NSClassFromString(&cfstr_Pbfcomplicatio_1.isa);
  if (!v9)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFComplicationSnapshotterOperation initWithRequest:snapshotter:]();
    }
LABEL_19:
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D320BA7CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFComplicationSnapshotRequestClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFComplicationSnapshotterOperation initWithRequest:snapshotter:].cold.4();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D320BAE0);
  }

  id v10 = v8;
  NSClassFromString(&cfstr_Pbfcomplicatio_3.isa);
  if (!v10)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFComplicationSnapshotterOperation initWithRequest:snapshotter:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D320BB44);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFComplicationSnapshotterClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFComplicationSnapshotterOperation initWithRequest:snapshotter:]();
    }
    goto LABEL_19;
  }

  v25.receiver = self;
  v25.super_class = (Class)PBFComplicationSnapshotterOperation;
  v11 = [(NSBlockOperation *)&v25 init];
  v12 = v11;
  if (v11)
  {
    v11->_lock = 0;
    objc_storeStrong((id *)&v11->_request, a3);
    objc_storeStrong((id *)&v12->_snapshotter, a4);
    [(PBFComplicationSnapshotter *)v12->_snapshotter addObserver:v12];
    dispatch_group_t v13 = dispatch_group_create();
    objc_storeStrong((id *)&v12->_lock_group, v13);
    objc_initWeak(&location, v12);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __67__PBFComplicationSnapshotterOperation_initWithRequest_snapshotter___block_invoke;
    v19[3] = &unk_1E6981F50;
    objc_copyWeak(&v23, &location);
    v14 = v13;
    v20 = v14;
    id v21 = v10;
    id v22 = v9;
    [(NSBlockOperation *)v12 addExecutionBlock:v19];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v12;
}

void __67__PBFComplicationSnapshotterOperation_initWithRequest_snapshotter___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0 && (objc_msgSend(v3, "isFinished") & 1) == 0)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    [*(id *)(a1 + 40) start];
    [v3 _snapshotterDidStart];
    v4 = *(NSObject **)(a1 + 32);
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(60.0 * 1000000000.0));
    if (dispatch_group_wait(v4, v5))
    {
      v6 = *(void **)(a1 + 40);
      id v7 = [NSString stringWithFormat:@"ComplicationSnapshotter timedout waiting for request: %@", *(void *)(a1 + 48)];
      [v6 cancelWithReason:v7];
    }
    else
    {
      id v8 = PBFLogSnapshotter();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v11 = v9;
        __int16 v12 = 2114;
        dispatch_group_t v13 = v3;
        _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_DEFAULT, "ComplicationSnapshotterOperation finished successfully %{public}@/%{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)dealloc
{
  [(PBFComplicationSnapshotter *)self->_snapshotter removeObserver:self];
  snapshotter = self->_snapshotter;
  self->_snapshotter = 0;

  v4.receiver = self;
  v4.super_class = (Class)PBFComplicationSnapshotterOperation;
  [(NSBlockOperation *)&v4 dealloc];
}

- (void)cancel
{
  v3 = [(PBFComplicationSnapshotterOperation *)self snapshotter];
  [v3 cancelWithReason:@"NSOperation was cancelled"];

  v4.receiver = self;
  v4.super_class = (Class)PBFComplicationSnapshotterOperation;
  [(PBFComplicationSnapshotterOperation *)&v4 cancel];
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_request withName:@"request"];
  [(PBFComplicationSnapshotter *)self->_snapshotter elapsedTime];
  id v5 = (id)objc_msgSend(v3, "appendFloat:withName:", @"elapsedTime");
  id v6 = (id)objc_msgSend(v3, "appendInteger:withName:", -[PBFComplicationSnapshotterOperation attempt](self, "attempt"), @"attempt");
  id v7 = [v3 build];

  return (NSString *)v7;
}

- (void)_snapshotterDidStart
{
  os_unfair_recursive_lock_lock_with_options();
  self->_lock_snapshotterDidStart = 1;
  os_unfair_recursive_lock_unlock();
}

- (void)_leaveMainGroup
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 296);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_ERROR, "Snapshotter did not start: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (PBFComplicationSnapshotRequest)request
{
  return self->_request;
}

- (PBFComplicationSnapshotter)snapshotter
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
  OUTLINED_FUNCTION_3_1();
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
  OUTLINED_FUNCTION_2_0();
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
  OUTLINED_FUNCTION_2_0();
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
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end