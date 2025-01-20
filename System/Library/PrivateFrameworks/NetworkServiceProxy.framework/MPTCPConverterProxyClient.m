@interface MPTCPConverterProxyClient
+ (id)getServerConnection;
+ (void)startProxyToMPTCPConverterProxyWithCompletionHandler:(id)a3 completionHandler:(id)a4;
+ (void)stopProxyToMPTCPConverterProxyWithCompletionHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation MPTCPConverterProxyClient

+ (id)getServerConnection
{
  if (qword_1EB53BDE0 != -1) {
    dispatch_once(&qword_1EB53BDE0, &__block_literal_global_9);
  }
  v2 = (void *)_MergedGlobals_37;
  return v2;
}

uint64_t __48__MPTCPConverterProxyClient_getServerConnection__block_invoke()
{
  id v0 = -[NSPServerClient initWithCallbackQueue:]([NSPServerClient alloc], 0);
  uint64_t v1 = _MergedGlobals_37;
  _MergedGlobals_37 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)startProxyToMPTCPConverterProxyWithCompletionHandler:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[MPTCPConverterProxyClient getServerConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __100__MPTCPConverterProxyClient_startProxyToMPTCPConverterProxyWithCompletionHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E5A3B7B8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 startProxyToMPTCPConverterProxyWithCompletionHandler:v10];
}

void __100__MPTCPConverterProxyClient_startProxyToMPTCPConverterProxyWithCompletionHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __100__MPTCPConverterProxyClient_startProxyToMPTCPConverterProxyWithCompletionHandler_completionHandler___block_invoke_2;
      v6[3] = &unk_1E5A3B790;
      id v8 = v5;
      id v7 = v3;
      dispatch_async(v4, v6);
    }
  }
}

uint64_t __100__MPTCPConverterProxyClient_startProxyToMPTCPConverterProxyWithCompletionHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)stopProxyToMPTCPConverterProxyWithCompletionHandler:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MPTCPConverterProxyClient getServerConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__MPTCPConverterProxyClient_stopProxyToMPTCPConverterProxyWithCompletionHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E5A3B7B8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 stopProxyToMPTCPConverterProxyWithCompletionHandler:v10];
}

void __99__MPTCPConverterProxyClient_stopProxyToMPTCPConverterProxyWithCompletionHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __99__MPTCPConverterProxyClient_stopProxyToMPTCPConverterProxyWithCompletionHandler_completionHandler___block_invoke_2;
      v6[3] = &unk_1E5A3B790;
      id v8 = v5;
      id v7 = v3;
      dispatch_async(v4, v6);
    }
  }
}

uint64_t __99__MPTCPConverterProxyClient_stopProxyToMPTCPConverterProxyWithCompletionHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end