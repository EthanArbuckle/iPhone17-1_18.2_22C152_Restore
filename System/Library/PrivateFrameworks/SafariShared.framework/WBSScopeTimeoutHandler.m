@interface WBSScopeTimeoutHandler
- (WBSScopeTimeoutHandler)init;
- (WBSScopeTimeoutHandler)initWithTimeout:(double)a3 autoBugCaptureDomain:(id)a4 detectedProcess:(id)a5 context:(id)a6;
- (WBSScopeTimeoutHandler)initWithTimeout:(double)a3 handler:(id)a4;
- (void)dealloc;
@end

@implementation WBSScopeTimeoutHandler

- (void).cxx_destruct
{
}

- (WBSScopeTimeoutHandler)initWithTimeout:(double)a3 autoBugCaptureDomain:(id)a4 detectedProcess:(id)a5 context:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__WBSScopeTimeoutHandler_initWithTimeout_autoBugCaptureDomain_detectedProcess_context___block_invoke;
  v18[3] = &unk_1E5C8CD20;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  v16 = [(WBSScopeTimeoutHandler *)self initWithTimeout:v18 handler:a3];

  return v16;
}

- (WBSScopeTimeoutHandler)initWithTimeout:(double)a3 handler:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WBSScopeTimeoutHandler;
  v7 = [(WBSScopeTimeoutHandler *)&v14 init];
  if (v7)
  {
    dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v6);
    id handler = v7->_handler;
    v7->_id handler = v8;

    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    id v11 = dispatch_get_global_queue(9, 0);
    dispatch_after(v10, v11, v7->_handler);

    id v12 = v7;
  }

  return v7;
}

- (void)dealloc
{
  dispatch_block_cancel(self->_handler);
  v3.receiver = self;
  v3.super_class = (Class)WBSScopeTimeoutHandler;
  [(WBSScopeTimeoutHandler *)&v3 dealloc];
}

- (WBSScopeTimeoutHandler)init
{
  return 0;
}

void __87__WBSScopeTimeoutHandler_initWithTimeout_autoBugCaptureDomain_detectedProcess_context___block_invoke(void *a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAutoBugCapture();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __87__WBSScopeTimeoutHandler_initWithTimeout_autoBugCaptureDomain_detectedProcess_context___block_invoke_cold_1(a1, v2);
  }
  objc_super v3 = +[WBSAutomaticBugCaptureManager sharedManager];
  [v3 capturePerformanceTimeoutWithDomain:a1[4] detectedProcess:a1[5] context:a1[6]];
}

void __87__WBSScopeTimeoutHandler_initWithTimeout_autoBugCaptureDomain_detectedProcess_context___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  int v5 = 138543874;
  uint64_t v6 = v2;
  __int16 v7 = 2114;
  uint64_t v8 = v3;
  __int16 v9 = 2114;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Timeout in domain %{public}@, process %{public}@, context %{public}@", (uint8_t *)&v5, 0x20u);
}

@end