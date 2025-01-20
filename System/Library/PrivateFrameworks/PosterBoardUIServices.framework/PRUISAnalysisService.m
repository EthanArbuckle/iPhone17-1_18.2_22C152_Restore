@interface PRUISAnalysisService
+ (id)secureCodableRequestClasses;
+ (id)secureCodableResponseClasses;
- (PRUISAnalysisService)init;
- (PRUISAnalysisService)initWithUnderlyingConnection:(id)a3;
- (id)executeAnalysisRequest:(id)a3 completion:(id)a4;
- (id)executeAnalysisRequest:(id)a3 error:(id *)a4;
- (void)cancelRequest:(id)a3;
@end

@implementation PRUISAnalysisService

+ (id)secureCodableRequestClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 setWithObject:v3];
}

+ (id)secureCodableResponseClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (PRUISAnalysisService)init
{
  uint64_t v3 = [MEMORY[0x263F5BB38] defaultConnection];
  v4 = [(PRUISAnalysisService *)self initWithUnderlyingConnection:v3];

  return v4;
}

- (PRUISAnalysisService)initWithUnderlyingConnection:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRUISAnalysisService;
  v6 = [(PRUISAnalysisService *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingConnection, a3);
    uint64_t Serial = BSDispatchQueueCreateSerial();
    timeoutQueue = v7->_timeoutQueue;
    v7->_timeoutQueue = (OS_dispatch_queue *)Serial;
  }
  return v7;
}

- (id)executeAnalysisRequest:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = PRUISLogAnalysisService();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PRUISAnalysisService executeAnalysisRequest:error:](a2, (uint64_t)v7, v8);
  }

  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  id v32 = 0;
  underlyingConnection = self->_underlyingConnection;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __53__PRUISAnalysisService_executeAnalysisRequest_error___block_invoke;
  v26[3] = &unk_26546B2F0;
  v26[4] = &v27;
  v10 = [(PBUIRemoteRendererXPCConnection *)underlyingConnection remoteObjectProxyWithErrorHandler:v26];
  objc_super v11 = v10;
  uint64_t v12 = v28[5];
  if (v10)
  {
    if (!v12)
    {
      id v25 = 0;
      v13 = [v10 executeAnalysisRequest:v7 error:&v25];
      v14 = v25;
      v15 = v14;
      if (v14)
      {
        if (a4) {
          *a4 = v14;
        }
        v16 = PRUISLogAnalysisService();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v24 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          v34 = v24;
          __int16 v35 = 2114;
          id v36 = v7;
          __int16 v37 = 2114;
          v38 = v15;
          _os_log_error_impl(&dword_25A03F000, v16, OS_LOG_TYPE_ERROR, "Fail %{public}@:%{public}@: %{public}@", buf, 0x20u);
        }
      }
      v17 = PRUISLogAnalysisService();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = NSStringFromSelector(a2);
        [(PRUISAnalysisService *)v18 executeAnalysisRequest:buf error:v17];
      }

      goto LABEL_21;
    }
  }
  else if (!v12)
  {
    uint64_t v19 = [MEMORY[0x263F087E8] errorWithDomain:@"_PRUISAnalysisServiceXPCConnection" code:-1 userInfo:0];
    v20 = (void *)v28[5];
    v28[5] = v19;
  }
  if (a4) {
    *a4 = (id) v28[5];
  }
  v15 = PRUISLogAnalysisService();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v22 = NSStringFromSelector(a2);
    v23 = v28[5];
    *(_DWORD *)buf = 138543874;
    v34 = v22;
    __int16 v35 = 2114;
    id v36 = v7;
    __int16 v37 = 2114;
    v38 = v23;
    _os_log_error_impl(&dword_25A03F000, v15, OS_LOG_TYPE_ERROR, "Fail %{public}@:%{public}@: %{public}@", buf, 0x20u);
  }
  v13 = 0;
LABEL_21:

  _Block_object_dispose(&v27, 8);

  return v13;
}

void __53__PRUISAnalysisService_executeAnalysisRequest_error___block_invoke(uint64_t a1, void *a2)
{
}

- (id)executeAnalysisRequest:(id)a3 completion:(id)a4
{
  v50[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = NSStringFromSelector(a2);
  v10 = PRUISLogAnalysisService();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PRUISAnalysisService executeAnalysisRequest:completion:]();
  }

  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__1;
  v47 = __Block_byref_object_dispose__1;
  id v48 = 0;
  objc_super v11 = objc_opt_new();
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__10;
  v41[4] = __Block_byref_object_dispose__11;
  id v42 = (id)[v8 copy];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __58__PRUISAnalysisService_executeAnalysisRequest_completion___block_invoke;
  v35[3] = &unk_26546B448;
  id v12 = v11;
  id v36 = v12;
  id v13 = v9;
  id v37 = v13;
  id v14 = v7;
  id v38 = v14;
  uint64_t v39 = v41;
  v40 = &v43;
  v15 = (void *)MEMORY[0x25A2F4350](v35);
  underlyingConnection = self->_underlyingConnection;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __58__PRUISAnalysisService_executeAnalysisRequest_completion___block_invoke_13;
  v33[3] = &unk_26546B470;
  id v17 = v15;
  id v34 = v17;
  uint64_t v18 = [(PBUIRemoteRendererXPCConnection *)underlyingConnection remoteObjectProxyWithErrorHandler:v33];
  uint64_t v19 = (void *)v44[5];
  v44[5] = v18;

  if (v44[5])
  {
    dispatch_time_t v20 = dispatch_time(0, 10000000000);
    timeoutQueue = self->_timeoutQueue;
    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    v30 = __58__PRUISAnalysisService_executeAnalysisRequest_completion___block_invoke_2;
    v31 = &unk_26546B368;
    id v22 = v17;
    id v32 = v22;
    dispatch_after(v20, timeoutQueue, &v28);
    v23 = objc_msgSend((id)v44[5], "executeAnalysisRequest:reply:", v14, v22, v28, v29, v30, v31);
    v24 = v32;
  }
  else
  {
    id v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v49 = *MEMORY[0x263F08338];
    v50[0] = @"service could not be started";
    v24 = [NSDictionary dictionaryWithObjects:v50 forKeys:&v49 count:1];
    v26 = [v25 errorWithDomain:@"_PRUISAnalysisServiceXPCConnection" code:-2 userInfo:v24];
    (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v26);

    v23 = 0;
  }

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);

  return v23;
}

void __58__PRUISAnalysisService_executeAnalysisRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) signal])
  {
    id v7 = PRUISLogAnalysisService();
    id v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __58__PRUISAnalysisService_executeAnalysisRequest_completion___block_invoke_cold_2();
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      __58__PRUISAnalysisService_executeAnalysisRequest_completion___block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v9)
    {
      (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      objc_super v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = 0;
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;
  }
}

uint64_t __58__PRUISAnalysisService_executeAnalysisRequest_completion___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__PRUISAnalysisService_executeAnalysisRequest_completion___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F08338];
  v6[0] = @"Timed out!";
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  v4 = [v2 errorWithDomain:@"_PRUISAnalysisServiceXPCConnection" code:-1 userInfo:v3];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v4);
}

- (void)cancelRequest:(id)a3
{
  underlyingConnection = self->_underlyingConnection;
  id v4 = a3;
  id v5 = [(PBUIRemoteRendererXPCConnection *)underlyingConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_5];
  [v5 cancelRequest:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutQueue, 0);

  objc_storeStrong((id *)&self->_underlyingConnection, 0);
}

- (void)executeAnalysisRequest:(uint8_t *)buf error:(os_log_t)log .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_25A03F000, log, OS_LOG_TYPE_DEBUG, "Finish %{public}@:%{public}@", buf, 0x16u);
}

- (void)executeAnalysisRequest:(NSObject *)a3 error:.cold.2(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_25A03F000, a3, OS_LOG_TYPE_DEBUG, "Start %{public}@:%{public}@", v6, 0x16u);
}

- (void)executeAnalysisRequest:completion:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_25A03F000, v1, OS_LOG_TYPE_DEBUG, "Start %{public}@:%{public}@", v2, 0x16u);
}

void __58__PRUISAnalysisService_executeAnalysisRequest_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_25A03F000, v0, OS_LOG_TYPE_DEBUG, "Success %{public}@:%{public}@: %{public}@", v1, 0x20u);
}

void __58__PRUISAnalysisService_executeAnalysisRequest_completion___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_25A03F000, v0, OS_LOG_TYPE_ERROR, "Fail %{public}@:%{public}@: %{public}@", v1, 0x20u);
}

@end