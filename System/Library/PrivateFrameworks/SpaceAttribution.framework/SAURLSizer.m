@interface SAURLSizer
- (BOOL)alreadyObservingURLs;
- (BOOL)alreadyReportedXPCError;
- (NSUUID)sizerID;
- (SADaemonXPC)xpcOut;
- (SAReplyController)sarc;
- (SAURLSizer)init;
- (void)callHandlerWithError:(id)a3;
- (void)invalidateConnection;
- (void)setAlreadyObservingURLs:(BOOL)a3;
- (void)setAlreadyReportedXPCError:(BOOL)a3;
- (void)setSarc:(id)a3;
- (void)setSizerID:(id)a3;
- (void)setXpcOut:(id)a3;
- (void)startObservingURLs:(id)a3 updateHandler:(id)a4;
- (void)stopObserving;
@end

@implementation SAURLSizer

- (SAURLSizer)init
{
  v3.receiver = self;
  v3.super_class = (Class)SAURLSizer;
  result = [(SAURLSizer *)&v3 init];
  if (result) {
    *(_WORD *)&result->_alreadyObservingURLs = 0;
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
    [(SAReplyController *)sarc callURLSizerHandlerWithError:v4];
    v6 = self->_sarc;
    self->_sarc = 0;

    [(SAURLSizer *)self invalidateConnection];
  }
  MEMORY[0x270F9A758]();
}

- (void)startObservingURLs:(id)a3 updateHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void, NSObject *))a4;
  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    if (v8->_alreadyObservingURLs)
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s can't be called more than once per URLSizer instance", "-[SAURLSizer startObservingURLs:updateHandler:]");
      v10 = SALog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SAURLSizer startObservingURLs:updateHandler:]([v9 UTF8String], buf, v10);
      }

      v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v37 = *MEMORY[0x263F08338];
      v38 = v9;
      v12 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      v13 = [v11 errorWithDomain:*MEMORY[0x263F08438] code:17 userInfo:v12];

      v7[2](v7, 0, v13);
    }
    else
    {
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke;
      v36[3] = &unk_26551E648;
      v36[4] = v8;
      v21 = +[SADaemonXPC newWithInvalidationHandler:v36];
      xpcOut = v8->_xpcOut;
      v8->_xpcOut = v21;

      uint64_t v23 = objc_opt_new();
      sarc = v8->_sarc;
      v8->_sarc = (SAReplyController *)v23;

      [(SAReplyController *)v8->_sarc setUrlSizerUpdateHandler:v7];
      v8->_alreadyReportedXPCError = 0;
      v25 = v8->_xpcOut;
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_2;
      v34[3] = &unk_26551E670;
      v34[4] = v8;
      id v35 = 0;
      v26 = [(SADaemonXPC *)v25 synchronousRemoteObjectProxyWithErrorHandler:v34];
      v27 = v8->_sarc;
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_3;
      v33[3] = &unk_26551E698;
      v33[4] = v8;
      [v26 addURLSizerHandler:v27 withURLs:v6 reply:v33];

      v8->_alreadyObservingURLs = 1;
      v28 = v8->_xpcOut;
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_4;
      v32[3] = &unk_26551E648;
      v32[4] = v8;
      v29 = [(SADaemonXPC *)v28 remoteObjectProxyWithErrorHandler:v32];
      sizerID = v8->_sizerID;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_5;
      v31[3] = &unk_26551E648;
      v31[4] = v8;
      [v29 runURLSizerWithID:sizerID reply:v31];

      v9 = 0;
      v13 = 0;
    }
    objc_sync_exit(v8);
  }
  else
  {
    v13 = SALog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SAURLSizer startObservingURLs:updateHandler:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

uint64_t __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callHandlerWithError:a2];
}

uint64_t __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) callHandlerWithError:*(void *)(a1 + 40)];
}

void __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 16) setControllerID:v3];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v3;
}

uint64_t __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callHandlerWithError:a2];
}

void __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = SALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_5_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }

    [*(id *)(*(void *)(a1 + 32) + 16) callURLSizerHandlerWithError:v3];
  }
}

- (void)stopObserving
{
}

void __27__SAURLSizer_stopObserving__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = SALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __27__SAURLSizer_stopObserving__block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }

    [*(id *)(a1 + 32) callHandlerWithError:v3];
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

- (NSUUID)sizerID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSizerID:(id)a3
{
}

- (BOOL)alreadyObservingURLs
{
  return self->_alreadyObservingURLs;
}

- (void)setAlreadyObservingURLs:(BOOL)a3
{
  self->_alreadyObservingURLs = a3;
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
  objc_storeStrong((id *)&self->_sizerID, 0);
  objc_storeStrong((id *)&self->_xpcOut, 0);
  objc_storeStrong((id *)&self->_sarc, 0);
}

- (void)startObservingURLs:(uint64_t)a3 updateHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startObservingURLs:(os_log_t)log updateHandler:.cold.2(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_25E2BB000, log, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
}

void __47__SAURLSizer_startObservingURLs_updateHandler___block_invoke_5_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __27__SAURLSizer_stopObserving__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end