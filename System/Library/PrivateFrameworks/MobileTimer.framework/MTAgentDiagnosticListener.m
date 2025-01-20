@interface MTAgentDiagnosticListener
- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4;
- (MTAgentDiagnosticDelegate)delegate;
- (MTAgentDiagnosticListener)initWithDelegate:(id)a3;
- (void)_addStateHandler;
- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation MTAgentDiagnosticListener

- (MTAgentDiagnosticListener)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTAgentDiagnosticListener;
  v5 = [(MTAgentDiagnosticListener *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    [(MTAgentDiagnosticListener *)v6 _addStateHandler];
  }

  return v6;
}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  return objc_msgSend(a3, "isEqualToString:", @"com.apple.mobiletimerd.diagnostics", a4);
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  v6 = [(MTAgentDiagnosticListener *)self delegate];
  [v6 printDiagnostics];

  v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v7 = v8;
  }
}

- (void)_addStateHandler
{
  v2 = dispatch_get_global_queue(0, 0);
  os_state_add_handler();
}

_DWORD *__45__MTAgentDiagnosticListener__addStateHandler__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a2 + 16) != 3) {
    return 0;
  }
  v3 = MTLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v4;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Processing os_state handler", buf, 0xCu);
  }

  v6 = *(void **)(a1 + 32);
  v5 = (id *)(a1 + 32);
  v7 = [v6 delegate];
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0) {
    return 0;
  }
  v9 = [*v5 delegate];
  v10 = [v9 gatherDiagnostics];

  v11 = MTLogForCategory(1);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

  if (v12)
  {
    v13 = MTLogForCategory(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __45__MTAgentDiagnosticListener__addStateHandler__block_invoke_cold_2((uint64_t)v10, v13);
    }
  }
  id v22 = 0;
  v14 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:200 options:0 error:&v22];
  id v15 = v22;
  unsigned int v16 = [v14 length];
  if (v15)
  {
    v17 = MTLogForCategory(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __45__MTAgentDiagnosticListener__addStateHandler__block_invoke_cold_1((uint64_t *)v5, (uint64_t)v15, v17);
    }

    v18 = 0;
  }
  else
  {
    unsigned int v19 = v16;
    size_t v20 = v16;
    v18 = malloc_type_calloc(1uLL, v16 + 200, 0x65D451B2uLL);
    _DWORD *v18 = 1;
    v18[1] = v19;
    __strlcpy_chk();
    memcpy(v18 + 50, (const void *)[v14 bytes], v20);
  }

  return v18;
}

- (MTAgentDiagnosticDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MTAgentDiagnosticDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

void __45__MTAgentDiagnosticListener__addStateHandler__block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%{public}@ Error serializing state data: %{public}@", (uint8_t *)&v4, 0x16u);
}

void __45__MTAgentDiagnosticListener__addStateHandler__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19CC95000, a2, OS_LOG_TYPE_DEBUG, "State: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end