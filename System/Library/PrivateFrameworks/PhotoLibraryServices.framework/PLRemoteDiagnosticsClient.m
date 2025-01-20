@interface PLRemoteDiagnosticsClient
+ (id)_connectionForListenerEndpoint:(id)a3;
+ (id)diagnosticsAgentWithErrorHandler:(id)a3;
@end

@implementation PLRemoteDiagnosticsClient

+ (id)_connectionForListenerEndpoint:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F29268];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithListenerEndpoint:v4];

  v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EECD1AB8];
  [v5 setRemoteObjectInterface:v6];

  [v5 resume];
  return v5;
}

+ (id)diagnosticsAgentWithErrorHandler:(id)a3
{
  id v4 = a3;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __62__PLRemoteDiagnosticsClient_diagnosticsAgentWithErrorHandler___block_invoke;
  v21[3] = &unk_1E5874D70;
  id v5 = v4;
  id v22 = v5;
  v6 = (void (**)(void, void))MEMORY[0x19F38D650](v21);
  id v7 = objc_alloc_init(MEMORY[0x1E4F8B968]);
  v8 = [v7 nonBindingDebugClient];
  id v19 = 0;
  id v20 = 0;
  int v9 = [v8 getPhotosXPCEndpoint:&v20 error:&v19];
  id v10 = v20;
  id v11 = v19;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PXRemoteDiagnosticsService" code:-36 userInfo:0];
    ((void (**)(void, id))v6)[2](v6, v13);
    v15 = 0;
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F292A0]);
    [v13 _setEndpoint:v10];
    v14 = [a1 _connectionForListenerEndpoint:v13];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__PLRemoteDiagnosticsClient_diagnosticsAgentWithErrorHandler___block_invoke_2;
    v17[3] = &unk_1E5874D70;
    v18 = v6;
    v15 = [v14 remoteObjectProxyWithErrorHandler:v17];
  }
  return v15;
}

void __62__PLRemoteDiagnosticsClient_diagnosticsAgentWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    id v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "error getting remote object proxy: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t __62__PLRemoteDiagnosticsClient_diagnosticsAgentWithErrorHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end