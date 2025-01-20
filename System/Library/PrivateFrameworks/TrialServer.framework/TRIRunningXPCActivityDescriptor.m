@interface TRIRunningXPCActivityDescriptor
- (NSString)name;
- (OS_xpc_object)activity;
- (TRIRunningXPCActivityDescriptor)initWithActivity:(id)a3 capabilities:(unint64_t)a4 name:(id)a5;
- (id)completion;
- (id)description;
- (id)initForImmediateWorkWithCapabilities:(unint64_t)a3;
- (id)shouldDefer;
- (unint64_t)capabilities;
- (unsigned)generationCount;
- (void)setCompletion:(id)a3;
- (void)setShouldDefer:(id)a3;
@end

@implementation TRIRunningXPCActivityDescriptor

- (TRIRunningXPCActivityDescriptor)initWithActivity:(id)a3 capabilities:(unint64_t)a4 name:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"TRIXPCActivitySupport.m", 41, @"Invalid parameter not satisfying: %@", @"activity" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"TRIXPCActivitySupport.m", 42, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

LABEL_3:
  v34.receiver = self;
  v34.super_class = (Class)TRIRunningXPCActivityDescriptor;
  v13 = [(TRIRunningXPCActivityDescriptor *)&v34 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_activity, a3);
    objc_storeStrong((id *)&v14->_name, a5);
    v14->_capabilities = a4;
    v14->_generationCount = atomic_fetch_add(nextActivityGenerationCount, 1u);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __70__TRIRunningXPCActivityDescriptor_initWithActivity_capabilities_name___block_invoke;
    v31[3] = &unk_1E6BBDD90;
    id v15 = v10;
    id v32 = v15;
    id v16 = v12;
    id v33 = v16;
    uint64_t v17 = MEMORY[0x1E016EA80](v31);
    id shouldDefer = v14->_shouldDefer;
    v14->_id shouldDefer = (id)v17;

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __70__TRIRunningXPCActivityDescriptor_initWithActivity_capabilities_name___block_invoke_17;
    v28[3] = &unk_1E6BB9140;
    id v29 = v15;
    id v19 = v16;
    id v30 = v19;
    uint64_t v20 = MEMORY[0x1E016EA80](v28);
    id completion = v14->_completion;
    v14->_id completion = (id)v20;

    if (![v19 UTF8String])
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2, v14, @"TRIXPCActivitySupport.m", 84, @"Invalid parameter not satisfying: %@", @"txnName" object file lineNumber description];
    }
    uint64_t v22 = os_transaction_create();
    txn = v14->_txn;
    v14->_txn = (OS_os_transaction *)v22;
  }
  return v14;
}

BOOL __70__TRIRunningXPCActivityDescriptor_initWithActivity_capabilities_name___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL should_defer = xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32));
  if (should_defer)
  {
    v3 = TRILogCategory_Server();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v6 = 138543362;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1DA291000, v3, OS_LOG_TYPE_DEFAULT, "Deferral requested for activity %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  return should_defer;
}

void __70__TRIRunningXPCActivityDescriptor_initWithActivity_capabilities_name___block_invoke_17(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  xpc_activity_state_t state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
  if (a2) {
    xpc_activity_state_t v5 = 5;
  }
  else {
    xpc_activity_state_t v5 = 3;
  }
  BOOL v6 = xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), v5);
  uint64_t v7 = TRILogCategory_Server();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = +[TRIXPCActivitySupport nameForActivityState:v5];
      int v14 = 138543618;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "XPC activity %{public}@ completion with state %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    v12 = +[TRIXPCActivitySupport nameForActivityState:state];
    v13 = +[TRIXPCActivitySupport nameForActivityState:v5];
    int v14 = 138543874;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    uint64_t v17 = v12;
    __int16 v18 = 2114;
    id v19 = v13;
    _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "XPC activity %{public}@ completion: unable to transition state %{public}@ --> %{public}@", (uint8_t *)&v14, 0x20u);
  }
}

- (id)initForImmediateWorkWithCapabilities:(unint64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)TRIRunningXPCActivityDescriptor;
  xpc_activity_state_t v5 = [(TRIRunningXPCActivityDescriptor *)&v18 init];
  if (v5)
  {
    BOOL v6 = NSString;
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v8 = [v7 UUIDString];
    uint64_t v9 = [v6 stringWithFormat:@"com.apple.triald.immediate.%@", v8];
    name = v5->_name;
    v5->_name = (NSString *)v9;

    activity = v5->_activity;
    v5->_activity = 0;

    id shouldDefer = v5->_shouldDefer;
    v5->_id shouldDefer = &__block_literal_global_30;

    id completion = v5->_completion;
    v5->_id completion = &__block_literal_global_29;

    v5->_capabilities = a3;
    if (![(NSString *)v5->_name UTF8String])
    {
      uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, v5, @"TRIXPCActivitySupport.m", 105, @"Invalid parameter not satisfying: %@", @"txnName" object file lineNumber description];
    }
    uint64_t v14 = os_transaction_create();
    txn = v5->_txn;
    v5->_txn = (OS_os_transaction *)v14;
  }
  return v5;
}

uint64_t __72__TRIRunningXPCActivityDescriptor_initForImmediateWorkWithCapabilities___block_invoke()
{
  return 0;
}

void __72__TRIRunningXPCActivityDescriptor_initForImmediateWorkWithCapabilities___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = TRILogCategory_Server();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DA291000, v3, OS_LOG_TYPE_DEFAULT, "internal testing activity completing with status %tu", (uint8_t *)&v4, 0xCu);
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %@, %llu>", objc_opt_class(), self->_name, self->_capabilities];
}

- (NSString)name
{
  return self->_name;
}

- (id)shouldDefer
{
  return self->_shouldDefer;
}

- (void)setShouldDefer:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (unsigned)generationCount
{
  return self->_generationCount;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_shouldDefer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_txn, 0);
}

@end