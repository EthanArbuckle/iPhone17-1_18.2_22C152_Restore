@interface TUINetworkMonitor
- (BOOL)hasActiveConnection;
- (OS_dispatch_queue)networkMonitorQueue;
- (OS_nw_path_monitor)networkPathMonitor;
- (TUINetworkMonitor)init;
- (TUINetworkMonitorDelegate)delegate;
- (void)_setNetworkMonitorUpdateHandlerWithPath:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)init;
- (void)setDelegate:(id)a3;
- (void)setUpNetworkPathMonitor;
@end

@implementation TUINetworkMonitor

- (TUINetworkMonitor)init
{
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23, &__block_literal_global_24);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23, OS_LOG_TYPE_DEBUG)) {
    -[TUINetworkMonitor init]();
  }
  v10.receiver = self;
  v10.super_class = (Class)TUINetworkMonitor;
  v3 = [(TUINetworkMonitor *)&v10 init];
  if (v3)
  {
    nw_path_monitor_t v4 = nw_path_monitor_create();
    networkPathMonitor = v3->_networkPathMonitor;
    v3->_networkPathMonitor = (OS_nw_path_monitor *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.TransparencyUI.network.monitor", v6);
    networkMonitorQueue = v3->_networkMonitorQueue;
    v3->_networkMonitorQueue = (OS_dispatch_queue *)v7;
  }
  return v3;
}

uint64_t __25__TUINetworkMonitor_init__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __28__TUINetworkMonitor_dealloc__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)setUpNetworkPathMonitor
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __44__TUINetworkMonitor_setUpNetworkPathMonitor__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __44__TUINetworkMonitor_setUpNetworkPathMonitor__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *(void *)location = 0;
    objc_initWeak((id *)location, WeakRetained);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __44__TUINetworkMonitor_setUpNetworkPathMonitor__block_invoke_13;
    v6[3] = &unk_265553128;
    objc_copyWeak(&v7, (id *)location);
    [WeakRetained _setNetworkMonitorUpdateHandlerWithPath:v3 completion:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)location);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23, &__block_literal_global_12_0);
    }
    uint64_t v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315138;
      *(void *)&location[4] = "-[TUINetworkMonitor setUpNetworkPathMonitor]_block_invoke";
      _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", location, 0xCu);
    }
  }
}

uint64_t __44__TUINetworkMonitor_setUpNetworkPathMonitor__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __44__TUINetworkMonitor_setUpNetworkPathMonitor__block_invoke_13(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained delegate];
    [v3 activeConnectionChanged];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23, &__block_literal_global_16_0);
    }
    uint64_t v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      v6 = "-[TUINetworkMonitor setUpNetworkPathMonitor]_block_invoke";
      _os_log_impl(&dword_260338000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t __44__TUINetworkMonitor_setUpNetworkPathMonitor__block_invoke_2_14()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_setNetworkMonitorUpdateHandlerWithPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23, &__block_literal_global_19_1);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23, OS_LOG_TYPE_DEBUG)) {
    -[TUINetworkMonitor _setNetworkMonitorUpdateHandlerWithPath:completion:]();
  }
  id location = 0;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__TUINetworkMonitor__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke_20;
  v10[3] = &unk_265553AD0;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

uint64_t __72__TUINetworkMonitor__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __72__TUINetworkMonitor__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke_20(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    WeakRetained[8] = nw_path_get_status(*(nw_path_t *)(a1 + 32)) == nw_path_status_satisfied;
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23, &__block_literal_global_25_0);
    }
    id v3 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23, OS_LOG_TYPE_DEBUG)) {
      __72__TUINetworkMonitor__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke_20_cold_1(v3, WeakRetained, (uint64_t)WeakRetained);
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23, &__block_literal_global_22_0);
    }
    uint64_t v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[TUINetworkMonitor _setNetworkMonitorUpdateHandlerWithPath:completion:]_block_invoke";
      _os_log_impl(&dword_260338000, v4, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", (uint8_t *)&v7, 0xCu);
    }
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23, &__block_literal_global_28_0);
    }
    int v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[TUINetworkMonitor _setNetworkMonitorUpdateHandlerWithPath:completion:]_block_invoke_2";
      _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_ERROR, "%s, block self is nil", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

uint64_t __72__TUINetworkMonitor__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __72__TUINetworkMonitor__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke_23()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __72__TUINetworkMonitor__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke_26()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (TUINetworkMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TUINetworkMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasActiveConnection
{
  return self->_hasActiveConnection;
}

- (OS_nw_path_monitor)networkPathMonitor
{
  return self->_networkPathMonitor;
}

- (OS_dispatch_queue)networkMonitorQueue
{
  return self->_networkMonitorQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMonitorQueue, 0);
  objc_storeStrong((id *)&self->_networkPathMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)init
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_setNetworkMonitorUpdateHandlerWithPath:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

void __72__TUINetworkMonitor__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke_20_cold_1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  int v6 = 138543618;
  uint64_t v7 = a3;
  __int16 v8 = 1024;
  int v9 = [a2 hasActiveConnection];
  _os_log_debug_impl(&dword_260338000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ hasActiveConnection = %d", (uint8_t *)&v6, 0x12u);
}

@end