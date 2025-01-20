@interface SBBackgroundFetchExternalRequest
- (UIFetchContentInBackgroundAction)action;
- (id)initForAppInfo:(id)a3;
- (void)dealloc;
- (void)execute;
@end

@implementation SBBackgroundFetchExternalRequest

- (id)initForAppInfo:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBBackgroundMultitaskingManager.m", 254, @"Invalid parameter not satisfying: %@", @"appInfo != nil" object file lineNumber description];
  }
  v24.receiver = self;
  v24.super_class = (Class)SBBackgroundFetchExternalRequest;
  v6 = [(SBBackgroundFetchExternalRequest *)&v24 init];
  if (v6)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__129;
    v22 = __Block_byref_object_dispose__129;
    id v23 = objc_alloc(MEMORY[0x1E4F42A08]);
    v7 = +[SBBackgroundMultitaskingManager sharedInstance];
    v8 = [v7 _createBackgroundFetchTaskForAppInfo:v5];

    objc_storeStrong((id *)&v6->_task, v8);
    id v9 = (id)v19[5];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__SBBackgroundFetchExternalRequest_initForAppInfo___block_invoke;
    v15[3] = &unk_1E6AFFD88;
    id v10 = v8;
    id v16 = v10;
    v17 = &v18;
    uint64_t v11 = [v9 initWithHandler:v15];
    action = v6->_action;
    v6->_action = (UIFetchContentInBackgroundAction *)v11;

    _Block_object_dispose(&v18, 8);
  }

  return v6;
}

void __51__SBBackgroundFetchExternalRequest_initForAppInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 result];
    uint64_t v5 = 4;
    if (v4 == 1) {
      uint64_t v5 = 2;
    }
    if (v4) {
      unint64_t v6 = v5;
    }
    else {
      unint64_t v6 = 1;
    }
  }
  else
  {
    v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __51__SBBackgroundFetchExternalRequest_initForAppInfo___block_invoke_cold_1(a1, v7);
    }

    unint64_t v6 = 4;
  }
  -[SBBackgroundFetchTask finishWithResult:](*(void *)(a1 + 32), v6);
}

- (void)dealloc
{
  -[SBBackgroundFetchTask finishWithResult:]((uint64_t)self->_task, 4uLL);
  [(UIFetchContentInBackgroundAction *)self->_action invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBBackgroundFetchExternalRequest;
  [(SBBackgroundFetchExternalRequest *)&v3 dealloc];
}

- (void)execute
{
  [(SBBackgroundFetchTask *)self->_task execute];
  task = self->_task;
  self->_task = 0;

  action = self->_action;
  self->_action = 0;
}

- (UIFetchContentInBackgroundAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

void __51__SBBackgroundFetchExternalRequest_initForAppInfo___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Error completing %{public}@: invalid response (the process probably exited)", (uint8_t *)&v3, 0xCu);
}

@end