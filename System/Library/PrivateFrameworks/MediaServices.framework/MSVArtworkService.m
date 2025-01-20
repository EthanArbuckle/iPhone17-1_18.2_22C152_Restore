@interface MSVArtworkService
+ (id)sharedService;
- (MSVArtworkService)init;
- (NSOperationQueue)serviceColorAnalysisOperationQueue;
- (NSOperationQueue)serviceThrottlingOperationQueue;
- (NSXPCConnection)serverConnection;
- (void)dealloc;
- (void)sendRequest:(id)a3 completion:(id)a4;
- (void)sendRequest:(id)a3 completionHandler:(id)a4;
- (void)setServerConnection:(id)a3;
- (void)setServiceColorAnalysisOperationQueue:(id)a3;
- (void)setServiceThrottlingOperationQueue:(id)a3;
@end

@implementation MSVArtworkService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_serviceColorAnalysisOperationQueue, 0);
  objc_storeStrong((id *)&self->_serviceThrottlingOperationQueue, 0);
}

- (void)setServerConnection:(id)a3
{
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServiceColorAnalysisOperationQueue:(id)a3
{
}

- (NSOperationQueue)serviceColorAnalysisOperationQueue
{
  return self->_serviceColorAnalysisOperationQueue;
}

- (void)setServiceThrottlingOperationQueue:(id)a3
{
}

- (NSOperationQueue)serviceThrottlingOperationQueue
{
  return self->_serviceThrottlingOperationQueue;
}

- (void)sendRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MSVAsyncBlockOperation alloc];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__MSVArtworkService_sendRequest_completion___block_invoke;
  v13[3] = &unk_1E5ADA0C8;
  id v14 = v6;
  id v15 = v7;
  v13[4] = self;
  id v9 = v6;
  id v10 = v7;
  v11 = [(MSVAsyncBlockOperation *)v8 initWithStartHandler:v13];
  v12 = [(MSVArtworkService *)self serviceColorAnalysisOperationQueue];
  [v12 addOperation:v11];
}

void __44__MSVArtworkService_sendRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) serverConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__MSVArtworkService_sendRequest_completion___block_invoke_2;
  v13[3] = &unk_1E5ADA0A0;
  id v15 = *(id *)(a1 + 48);
  id v5 = v3;
  id v14 = v5;
  id v6 = [v4 remoteObjectProxyWithErrorHandler:v13];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__MSVArtworkService_sendRequest_completion___block_invoke_3;
  v10[3] = &unk_1E5ADA0F0;
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  [v6 processArtworkColorAnalysisRequest:v7 withReply:v10];
}

void __44__MSVArtworkService_sendRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v3);
    id v3 = v5;
  }
  [*(id *)(a1 + 32) finishWithError:v3];
}

void __44__MSVArtworkService_sendRequest_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
    id v5 = v7;
  }
  [*(id *)(a1 + 32) finishWithError:v5];
}

- (void)sendRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MSVAsyncBlockOperation alloc];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__MSVArtworkService_sendRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E5ADA0C8;
  id v14 = v6;
  id v15 = v7;
  void v13[4] = self;
  id v9 = v6;
  id v10 = v7;
  id v11 = [(MSVAsyncBlockOperation *)v8 initWithStartHandler:v13];
  id v12 = [(MSVArtworkService *)self serviceThrottlingOperationQueue];
  [v12 addOperation:v11];
}

void __51__MSVArtworkService_sendRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) serverConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__MSVArtworkService_sendRequest_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5ADA0A0;
  id v15 = *(id *)(a1 + 48);
  id v5 = v3;
  id v14 = v5;
  id v6 = [v4 remoteObjectProxyWithErrorHandler:v13];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__MSVArtworkService_sendRequest_completionHandler___block_invoke_3;
  v10[3] = &unk_1E5ADA0A0;
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  [v6 processArtworkRequest:v7 completionHandler:v10];
}

void __51__MSVArtworkService_sendRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = v3;
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    id v3 = v5;
  }
  [*(id *)(a1 + 32) finishWithError:v3];
}

void __51__MSVArtworkService_sendRequest_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = v3;
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    id v3 = v5;
  }
  [*(id *)(a1 + 32) finishWithError:v3];
}

- (void)dealloc
{
  id v3 = [(MSVArtworkService *)self serverConnection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)MSVArtworkService;
  [(MSVArtworkService *)&v4 dealloc];
}

- (MSVArtworkService)init
{
  v13.receiver = self;
  v13.super_class = (Class)MSVArtworkService;
  v2 = [(MSVArtworkService *)&v13 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [(MSVArtworkService *)v2 setServiceThrottlingOperationQueue:v3];

    objc_super v4 = [(MSVArtworkService *)v2 serviceThrottlingOperationQueue];
    [v4 setMaxConcurrentOperationCount:5];

    id v5 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [(MSVArtworkService *)v2 setServiceColorAnalysisOperationQueue:v5];

    id v6 = [(MSVArtworkService *)v2 serviceColorAnalysisOperationQueue];
    [v6 setMaxConcurrentOperationCount:5];

    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mediaartworkd.xpc" options:0];
    [(MSVArtworkService *)v2 setServerConnection:v7];

    id v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF662A08];
    id v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v8 setClasses:v9 forSelector:sel_processArtworkColorAnalysisRequest_withReply_ argumentIndex:0 ofReply:1];

    id v10 = [(MSVArtworkService *)v2 serverConnection];
    [v10 setRemoteObjectInterface:v8];

    id v11 = [(MSVArtworkService *)v2 serverConnection];
    [v11 resume];
  }
  return v2;
}

+ (id)sharedService
{
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, &__block_literal_global_3207);
  }
  v2 = (void *)sharedService___sharedService;
  return v2;
}

uint64_t __34__MSVArtworkService_sharedService__block_invoke()
{
  sharedService___sharedService = objc_alloc_init(MSVArtworkService);
  return MEMORY[0x1F41817F8]();
}

@end