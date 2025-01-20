@interface WRWorkflowProvider
+ (id)providerForAllWorkflowsWithQueue:(id)a3 callback:(id)a4;
+ (id)providerForWorkflowWithName:(id)a3 queue:(id)a4 callback:(id)a5;
- (WRWorkflowProvider)initWithQueue:(id)a3;
- (uint64_t)taskingNotifyToken;
- (uint64_t)wrSettingsChangedNotifyToken;
- (void)dealloc;
- (void)handleSettingsChanged:(BOOL)a3;
- (void)registerNotification;
@end

@implementation WRWorkflowProvider

- (void)handleSettingsChanged:(BOOL)a3
{
  int v3 = *__error();
  v4 = _wrlog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[WRWorkflowProvider handleSettingsChanged:]();
  }

  *__error() = v3;
}

- (void)registerNotification
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_261964000, a2, OS_LOG_TYPE_FAULT, "Unable to register for tasking updated notifications: %d", (uint8_t *)v2, 8u);
}

void __42__WRWorkflowProvider_registerNotification__block_invoke(uint64_t a1)
{
  int v2 = *__error();
  uint64_t v3 = _wrlog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __42__WRWorkflowProvider_registerNotification__block_invoke_cold_1();
  }

  *__error() = v2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleSettingsChanged:0];
}

void __42__WRWorkflowProvider_registerNotification__block_invoke_214(uint64_t a1)
{
  int v2 = *__error();
  uint64_t v3 = _wrlog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __42__WRWorkflowProvider_registerNotification__block_invoke_214_cold_1();
  }

  *__error() = v2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleSettingsChanged:0];
}

- (WRWorkflowProvider)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WRWorkflowProvider;
  v6 = [(WRWorkflowProvider *)&v9 init];
  v7 = v6;
  if (v6)
  {
    *(void *)&v6->_taskingNotifyToken = -1;
    objc_storeStrong((id *)&v6->_callbackQueue, a3);
  }

  return v7;
}

- (void)dealloc
{
  if (!self)
  {
    notify_cancel(0);
    int wrSettingsChangedNotifyToken = 0;
LABEL_5:
    notify_cancel(wrSettingsChangedNotifyToken);
    goto LABEL_6;
  }
  int taskingNotifyToken = self->_taskingNotifyToken;
  if (taskingNotifyToken != -1) {
    notify_cancel(taskingNotifyToken);
  }
  int wrSettingsChangedNotifyToken = self->_wrSettingsChangedNotifyToken;
  if (wrSettingsChangedNotifyToken != -1) {
    goto LABEL_5;
  }
LABEL_6:
  v5.receiver = self;
  v5.super_class = (Class)WRWorkflowProvider;
  [(WRWorkflowProvider *)&v5 dealloc];
}

- (uint64_t)taskingNotifyToken
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

- (uint64_t)wrSettingsChangedNotifyToken
{
  if (result) {
    return *(unsigned int *)(result + 12);
  }
  return result;
}

+ (id)providerForAllWorkflowsWithQueue:(id)a3 callback:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[WRWorkflowProviderAllWorkflows alloc] initWithQueue:v6 callback:v5];

  -[WRWorkflowProvider registerNotification](v7);

  return v7;
}

+ (id)providerForWorkflowWithName:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[WRWorkflowProviderSingleWorkflow alloc] initWithWorkflowName:v9 queue:v8 callback:v7];

  -[WRWorkflowProvider registerNotification](v10);

  return v10;
}

- (void).cxx_destruct
{
}

- (void)handleSettingsChanged:.cold.1()
{
  OUTLINED_FUNCTION_7_0();
  _os_log_fault_impl(&dword_261964000, v0, OS_LOG_TYPE_FAULT, "handleSettingsChanged must be overridden by subclass", v1, 2u);
}

void __42__WRWorkflowProvider_registerNotification__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(&dword_261964000, v0, v1, "Received com.apple.da.tasking_changed", v2, v3, v4, v5, v6);
}

void __42__WRWorkflowProvider_registerNotification__block_invoke_214_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(&dword_261964000, v0, v1, "Received com.apple.workflow_responsiveness.settings_changed", v2, v3, v4, v5, v6);
}

@end