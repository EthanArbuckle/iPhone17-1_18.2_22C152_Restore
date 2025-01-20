@interface SAAppSizer
- (BOOL)alreadyReportedXPCError;
- (BOOL)handlerAlreadyRegistered;
- (SAAppSizer)init;
- (SADaemonXPC)xpcOut;
- (SAReplyController)sarc;
- (void)callHandlerWithError:(id)a3;
- (void)invalidateConnection;
- (void)setAlreadyReportedXPCError:(BOOL)a3;
- (void)setHandlerAlreadyRegistered:(BOOL)a3;
- (void)setSarc:(id)a3;
- (void)setXpcOut:(id)a3;
- (void)startObservingWithScanOptions:(unint64_t)a3 updateHandler:(id)a4;
- (void)startObservingWithUpdateHandler:(id)a3;
- (void)stopObserving;
@end

@implementation SAAppSizer

- (SAAppSizer)init
{
  v3.receiver = self;
  v3.super_class = (Class)SAAppSizer;
  result = [(SAAppSizer *)&v3 init];
  if (result) {
    *(_WORD *)&result->_handlerAlreadyRegistered = 0;
  }
  return result;
}

- (void)invalidateConnection
{
  [(SADaemonXPC *)self->_xpcOut invalidate];
  xpcOut = self->_xpcOut;
  self->_xpcOut = 0;
}

- (void)callHandlerWithError:(id)a3
{
  id v4 = a3;
  sarc = self->_sarc;
  if (sarc && !self->_alreadyReportedXPCError)
  {
    self->_alreadyReportedXPCError = 1;
    [(SAReplyController *)sarc callAppSizerHandlerWithError:v4];
    v6 = self->_sarc;
    self->_sarc = 0;

    [(SAAppSizer *)self invalidateConnection];
  }
  MEMORY[0x270F9A758]();
}

- (void)startObservingWithUpdateHandler:(id)a3
{
}

- (void)startObservingWithScanOptions:(unint64_t)a3 updateHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, void, NSObject *))a4;
  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    if (v7->_handlerAlreadyRegistered)
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s can't be called more than once per AppSizer instance", "-[SAAppSizer startObservingWithScanOptions:updateHandler:]");
      v9 = SALog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SAURLSizer startObservingURLs:updateHandler:]([v8 UTF8String], buf, v9);
      }

      v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v32 = *MEMORY[0x263F08338];
      v33 = v8;
      v11 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      v12 = [v10 errorWithDomain:*MEMORY[0x263F08438] code:17 userInfo:v11];

      v6[2](v6, 0, v12);
    }
    else
    {
      v7->_alreadyReportedXPCError = 0;
      uint64_t v20 = objc_opt_new();
      sarc = v7->_sarc;
      v7->_sarc = (SAReplyController *)v20;

      [(SAReplyController *)v7->_sarc setAppSizerUpdateHandler:v6];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __58__SAAppSizer_startObservingWithScanOptions_updateHandler___block_invoke;
      v31[3] = &unk_26551E648;
      v31[4] = v7;
      v22 = +[SADaemonXPC newWithInvalidationHandler:v31];
      xpcOut = v7->_xpcOut;
      v7->_xpcOut = v22;

      v24 = v7->_xpcOut;
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __58__SAAppSizer_startObservingWithScanOptions_updateHandler___block_invoke_2;
      v29[3] = &unk_26551E670;
      v29[4] = v7;
      id v30 = 0;
      v25 = [(SADaemonXPC *)v24 remoteObjectProxyWithErrorHandler:v29];
      v26 = v7->_sarc;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __58__SAAppSizer_startObservingWithScanOptions_updateHandler___block_invoke_3;
      v28[3] = &unk_26551E698;
      v28[4] = v7;
      [v25 addAppSizerHandler:v26 reply:v28];
      v7->_handlerAlreadyRegistered = 1;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __58__SAAppSizer_startObservingWithScanOptions_updateHandler___block_invoke_4;
      v27[3] = &unk_26551E648;
      v27[4] = v7;
      [v25 runAppSizerWithScanOptions:a3 reply:v27];

      v8 = 0;
      v12 = 0;
    }
    objc_sync_exit(v7);
  }
  else
  {
    v12 = SALog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SAAppSizer startObservingWithScanOptions:updateHandler:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __58__SAAppSizer_startObservingWithScanOptions_updateHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callHandlerWithError:a2];
}

uint64_t __58__SAAppSizer_startObservingWithScanOptions_updateHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) callHandlerWithError:*(void *)(a1 + 40)];
}

uint64_t __58__SAAppSizer_startObservingWithScanOptions_updateHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setControllerID:a2];
}

void __58__SAAppSizer_startObservingWithScanOptions_updateHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = SALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_25E2BB000, v4, OS_LOG_TYPE_DEFAULT, "remoteObjectProxyWithErrorHandler repliedkey: bundleID, value: AppPath with err %@", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 16) callAppSizerHandlerWithError:v3];
  }
}

- (void)stopObserving
{
}

void __27__SAAppSizer_stopObserving__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) callHandlerWithError:v3];
  id v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __27__SAAppSizer_stopObserving__block_invoke_cold_1();
  }
}

- (SAReplyController)sarc
{
  return (SAReplyController *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSarc:(id)a3
{
}

- (SADaemonXPC)xpcOut
{
  return (SADaemonXPC *)objc_getProperty(self, a2, 24, 1);
}

- (void)setXpcOut:(id)a3
{
}

- (BOOL)handlerAlreadyRegistered
{
  return self->_handlerAlreadyRegistered;
}

- (void)setHandlerAlreadyRegistered:(BOOL)a3
{
  self->_handlerAlreadyRegistered = a3;
}

- (BOOL)alreadyReportedXPCError
{
  return self->_alreadyReportedXPCError;
}

- (void)setAlreadyReportedXPCError:(BOOL)a3
{
  self->_alreadyReportedXPCError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcOut, 0);
  objc_storeStrong((id *)&self->_sarc, 0);
}

- (void)startObservingWithScanOptions:(uint64_t)a3 updateHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __27__SAAppSizer_stopObserving__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_25E2BB000, v0, v1, "%s: remoteObjectProxyWithErrorHandler called with %@", v2, v3, v4, v5, 2u);
}

@end