@interface STYDiagnosticsCollector
+ (id)sharedDiagnosticsCollector;
- (OS_dispatch_queue)serialUtilityQueue;
- (OS_os_log)logger;
- (void)collectTailspinForScenarioReport:(id)a3 tailspinFileDescriptor:(int)a4 completionHandler:(id)a5;
- (void)setLogger:(id)a3;
- (void)setSerialUtilityQueue:(id)a3;
@end

@implementation STYDiagnosticsCollector

+ (id)sharedDiagnosticsCollector
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__STYDiagnosticsCollector_sharedDiagnosticsCollector__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDiagnosticsCollector_onceToken != -1) {
    dispatch_once(&sharedDiagnosticsCollector_onceToken, block);
  }
  v2 = (void *)sharedDiagnosticsCollector_sharedDiagnosticCollector;
  return v2;
}

void __53__STYDiagnosticsCollector_sharedDiagnosticsCollector__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedDiagnosticsCollector_sharedDiagnosticCollector;
  sharedDiagnosticsCollector_sharedDiagnosticCollector = (uint64_t)v1;

  if (sharedDiagnosticsCollector_sharedDiagnosticCollector)
  {
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -15);
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Sentry.Frameworking.framework.STYDiagnosticsCollector", v4);
    [(id)sharedDiagnosticsCollector_sharedDiagnosticCollector setSerialUtilityQueue:v3];
  }
}

- (void)collectTailspinForScenarioReport:(id)a3 tailspinFileDescriptor:(int)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, void, uint64_t, id, void *))a5;
  if (fcntl(v6, 1))
  {
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v9 = [MEMORY[0x1E4F28B50] mainBundle];
    v10 = [v9 localizedStringForKey:@"File descriptor check via fcntl failed" value:&stru_1F2A289A0 table:0];
    v20[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];

    v12 = [MEMORY[0x1E4F28C58] errorWithDomain:STYDiagnosticsCollectorErrorDomain code:-1001 userInfo:v11];
    v13 = +[STYDiagCollectorLogger sharedLogger];
    v14 = [v13 logHandle];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[STYDiagnosticsCollector collectTailspinForScenarioReport:tailspinFileDescriptor:completionHandler:](v14);
    }

    v8[2](v8, 0, v6, v7, v12);
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __101__STYDiagnosticsCollector_collectTailspinForScenarioReport_tailspinFileDescriptor_completionHandler___block_invoke;
    v15[3] = &unk_1E6971768;
    v17 = v8;
    int v18 = v6;
    id v16 = v7;
    v11 = (void *)MEMORY[0x1D942F890](v15);
    tailspin_dump_output();

    v12 = v17;
  }
}

void __101__STYDiagnosticsCollector_collectTailspinForScenarioReport_tailspinFileDescriptor_completionHandler___block_invoke(uint64_t a1, char a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    dispatch_queue_t v3 = 0;
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v4 = [MEMORY[0x1E4F28B50] mainBundle];
    v5 = [v4 localizedStringForKey:@"Error dumping tailspin" value:&stru_1F2A289A0 table:0];
    v10[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

    dispatch_queue_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:STYDiagnosticsCollectorErrorDomain code:-1002 userInfo:v6];
    id v7 = +[STYDiagCollectorLogger sharedLogger];
    v8 = [v7 logHandle];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __101__STYDiagnosticsCollector_collectTailspinForScenarioReport_tailspinFileDescriptor_completionHandler___block_invoke_cold_1(v8);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (OS_dispatch_queue)serialUtilityQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSerialUtilityQueue:(id)a3
{
}

- (OS_os_log)logger
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_serialUtilityQueue, 0);
}

- (void)collectTailspinForScenarioReport:(os_log_t)log tailspinFileDescriptor:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1D3037000, log, OS_LOG_TYPE_ERROR, "Invalid file descriptor supplied for tailspin.", v1, 2u);
}

void __101__STYDiagnosticsCollector_collectTailspinForScenarioReport_tailspinFileDescriptor_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1D3037000, log, OS_LOG_TYPE_ERROR, "Tailspin dump failed.", v1, 2u);
}

@end