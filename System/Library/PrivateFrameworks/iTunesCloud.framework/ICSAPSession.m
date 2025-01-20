@interface ICSAPSession
+ (id)sharedSAPSessionWithVersion:(unsigned int)a3 URLBag:(id)a4 requestContext:(id)a5;
- (ICFPSAPContext)_sapContext;
- (ICStoreRequestContext)_requestContext;
- (NSOperationQueue)_prepareFairPlayContextOperationQueue;
- (NSURL)_certificateURL;
- (NSURL)_setupURL;
- (id)_initWithVersion:(unsigned int)a3 certificateURL:(id)a4 setupURL:(id)a5 requestContext:(id)a6;
- (unsigned)sapVersion;
- (void)_setSAPContext:(id)a3;
- (void)signData:(id)a3 withCompletionHandler:(id)a4;
- (void)verifySignatureData:(id)a3 forData:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation ICSAPSession

void __66__ICSAPSession_verifySignatureData_forData_withCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ICSAPSession_verifySignatureData_forData_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5ACD008;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __72__ICSAPSession__initWithVersion_certificateURL_setupURL_requestContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPersonalizationStyle:2];
}

- (ICFPSAPContext)_sapContext
{
  return self->_sapContext;
}

- (unsigned)sapVersion
{
  return self->_sapVersion;
}

void __47__ICSAPSession_signData_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ICSAPSession_signData_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5ACD250;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

- (ICStoreRequestContext)_requestContext
{
  return self->_requestContext;
}

uint64_t __47__ICSAPSession_signData_withCompletionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __66__ICSAPSession_sharedSAPSessionWithVersion_URLBag_requestContext___block_invoke_2_4(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v5 = [[ICSAPSession alloc] _initWithVersion:*(unsigned int *)(a1 + 72) certificateURL:*(void *)(a1 + 32) setupURL:*(void *)(a1 + 40) requestContext:*(void *)(a1 + 48)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = (void *)sharedSAPSessionWithVersion_URLBag_requestContext__sAvailableSessions;
    if (!sharedSAPSessionWithVersion_URLBag_requestContext__sAvailableSessions)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v10 = (void *)sharedSAPSessionWithVersion_URLBag_requestContext__sAvailableSessions;
      sharedSAPSessionWithVersion_URLBag_requestContext__sAvailableSessions = (uint64_t)v9;

      id v8 = (void *)sharedSAPSessionWithVersion_URLBag_requestContext__sAvailableSessions;
    }
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    [v8 addObject:v11];
  }
}

uint64_t __66__ICSAPSession_sharedSAPSessionWithVersion_URLBag_requestContext___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return MEMORY[0x1F41817F8]();
}

id __66__ICSAPSession_sharedSAPSessionWithVersion_URLBag_requestContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v8, "sapVersion", (void)v14) == *(_DWORD *)(a1 + 48))
        {
          id v9 = [v8 _certificateURL];
          if ([v9 isEqual:*(void *)(a1 + 32)])
          {
            id v10 = [v8 _setupURL];
            int v11 = [v10 isEqual:*(void *)(a1 + 40)];

            if (v11)
            {
              id v12 = v8;
              goto LABEL_14;
            }
          }
          else
          {
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  id v12 = 0;
LABEL_14:

  return v12;
}

- (NSURL)_setupURL
{
  return self->_setupURL;
}

- (NSURL)_certificateURL
{
  return self->_certificateURL;
}

- (id)_initWithVersion:(unsigned int)a3 certificateURL:(id)a4 setupURL:(id)a5 requestContext:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v27.receiver = self;
  v27.super_class = (Class)ICSAPSession;
  id v13 = [(ICSAPSession *)&v27 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    certificateURL = v13->_certificateURL;
    v13->_certificateURL = (NSURL *)v14;

    uint64_t v16 = [v11 copy];
    setupURL = v13->_setupURL;
    v13->_setupURL = (NSURL *)v16;

    uint64_t v18 = [v12 copyWithBlock:&__block_literal_global_8];
    requestContext = v13->_requestContext;
    v13->_requestContext = (ICStoreRequestContext *)v18;

    v13->_sapVersion = a3;
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.iTunesCloud.ICSAPSession.calloutQueue", 0);
    calloutQueue = v13->_calloutQueue;
    v13->_calloutQueue = (OS_dispatch_queue *)v20;

    v22 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    prepareFairPlayContextOperationQueue = v13->_prepareFairPlayContextOperationQueue;
    v13->_prepareFairPlayContextOperationQueue = v22;

    [(NSOperationQueue *)v13->_prepareFairPlayContextOperationQueue setName:@"com.apple.iTunesCloud.ICSAPSession.prepareFairPlayContextOperationQueue"];
    [(NSOperationQueue *)v13->_prepareFairPlayContextOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v13->_prepareFairPlayContextOperationQueue setQualityOfService:25];
    v24 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v13->_operationQueue;
    v13->_operationQueue = v24;

    [(NSOperationQueue *)v13->_operationQueue setName:@"com.apple.iTunesCloud.ICSAPSession.prepareFairPlayContextOperationQueue"];
    [(NSOperationQueue *)v13->_operationQueue setMaxConcurrentOperationCount:3];
    [(NSOperationQueue *)v13->_operationQueue setQualityOfService:25];
  }

  return v13;
}

+ (id)sharedSAPSessionWithVersion:(unsigned int)a3 URLBag:(id)a4 requestContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [v8 urlForBagKey:@"sign-sap-setup-cert"];
  id v10 = [v8 urlForBagKey:@"sign-sap-setup"];

  id v11 = 0;
  if (v9 && v10)
  {
    if (sharedSAPSessionWithVersion_URLBag_requestContext__sOnceToken != -1) {
      dispatch_once(&sharedSAPSessionWithVersion_URLBag_requestContext__sOnceToken, &__block_literal_global_323);
    }
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __66__ICSAPSession_sharedSAPSessionWithVersion_URLBag_requestContext___block_invoke_2;
    v36[3] = &unk_1E5AC6CF8;
    unsigned int v39 = a3;
    id v12 = v9;
    id v37 = v12;
    id v13 = v10;
    id v38 = v13;
    uint64_t v14 = (void *)MEMORY[0x1A6240BF0](v36);
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__324;
    v34 = __Block_byref_object_dispose__325;
    id v35 = 0;
    long long v15 = sSharedAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__ICSAPSession_sharedSAPSessionWithVersion_URLBag_requestContext___block_invoke_3;
    block[3] = &unk_1E5ACC428;
    v29 = &v30;
    id v16 = v14;
    id v28 = v16;
    dispatch_sync(v15, block);
    long long v17 = (void *)v31[5];
    if (!v17)
    {
      uint64_t v18 = sSharedAccessQueue;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __66__ICSAPSession_sharedSAPSessionWithVersion_URLBag_requestContext___block_invoke_2_4;
      v20[3] = &unk_1E5AC6D20;
      v25 = &v30;
      id v24 = v16;
      unsigned int v26 = a3;
      id v21 = v12;
      id v22 = v13;
      id v23 = v7;
      dispatch_barrier_sync(v18, v20);

      long long v17 = (void *)v31[5];
    }
    id v11 = v17;

    _Block_object_dispose(&v30, 8);
  }

  return v11;
}

- (void)verifySignatureData:(id)a3 forData:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(ICSAPSessionVerifySignatureOperation);
  [(ICSAPSessionAbstractOperation *)v11 setSapSession:self];
  [(ICSAPSessionVerifySignatureOperation *)v11 setData:v9];

  [(ICSAPSessionVerifySignatureOperation *)v11 setSignatureData:v10];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  long long v15 = __66__ICSAPSession_verifySignatureData_forData_withCompletionHandler___block_invoke;
  id v16 = &unk_1E5ACCD60;
  long long v17 = self;
  id v18 = v8;
  id v12 = v8;
  [(ICSAPSessionVerifySignatureOperation *)v11 setResponseHandler:&v13];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v11, v13, v14, v15, v16, v17);
}

- (void)signData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(ICSAPSessionSignDataOperation);
  [(ICSAPSessionAbstractOperation *)v8 setSapSession:self];
  [(ICSAPSessionSignDataOperation *)v8 setData:v7];

  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __47__ICSAPSession_signData_withCompletionHandler___block_invoke;
  uint64_t v13 = &unk_1E5ACD3D8;
  uint64_t v14 = self;
  id v15 = v6;
  id v9 = v6;
  [(ICSAPSessionSignDataOperation *)v8 setResponseHandler:&v10];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v8, v10, v11, v12, v13, v14);
}

- (NSOperationQueue)_prepareFairPlayContextOperationQueue
{
  return self->_prepareFairPlayContextOperationQueue;
}

- (void)_setSAPContext:(id)a3
{
}

uint64_t __66__ICSAPSession_sharedSAPSessionWithVersion_URLBag_requestContext___block_invoke()
{
  sSharedAccessQueue = (uint64_t)dispatch_queue_create("com.apple.iTunesCloud.ICSAPSession.SharedAccessQueue", MEMORY[0x1E4F14430]);

  return MEMORY[0x1F41817F8]();
}

uint64_t __66__ICSAPSession_verifySignatureData_forData_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_prepareFairPlayContextOperationQueue, 0);
  objc_storeStrong((id *)&self->_sapContext, 0);
  objc_storeStrong((id *)&self->_setupURL, 0);
  objc_storeStrong((id *)&self->_certificateURL, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

@end