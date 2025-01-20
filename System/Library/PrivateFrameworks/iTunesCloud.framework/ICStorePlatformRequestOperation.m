@interface ICStorePlatformRequestOperation
- (ICStorePlatformRequest)platformRequest;
- (ICStorePlatformRequestOperation)initWithPlatformRequest:(id)a3;
- (ICStorePlatformRequestOperation)initWithPlatformRequest:(id)a3 usingURLSession:(id)a4;
- (id)_URLRequestWithBaseURL:(id)a3;
- (id)_requestContext;
- (id)responseHandler;
- (void)_enqueueDataRequest:(id)a3;
- (void)_executePersonalized;
- (void)_executeUnpersonalized;
- (void)_finishWithResponse:(id)a3 error:(id)a4;
- (void)cancel;
- (void)execute;
- (void)finishWithError:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation ICStorePlatformRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_platformRequest, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_activeURLRequest, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (ICStorePlatformRequest)platformRequest
{
  return self->_platformRequest;
}

- (id)_URLRequestWithBaseURL:(id)a3
{
  id v4 = a3;
  v5 = [(ICStorePlatformRequest *)self->_platformRequest queryItems];
  v6 = (void *)[v5 mutableCopy];

  if ([(ICStorePlatformRequest *)self->_platformRequest shouldIgnoreCache])
  {
    v7 = [MEMORY[0x1E4F29128] UUID];
    v8 = [v7 UUIDString];

    v9 = [MEMORY[0x1E4F290C8] queryItemWithName:@"buster" value:v8];
    [v6 addObject:v9];
  }
  v10 = objc_msgSend(v4, "ic_URLByAppendingQueryItems:", v6);
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v10];
  v12 = [(ICStorePlatformRequest *)self->_platformRequest HTTPHeaders];
  [v11 setAllHTTPHeaderFields:v12];

  [(ICStorePlatformRequest *)self->_platformRequest timeoutInterval];
  objc_msgSend(v11, "setTimeoutInterval:");

  return v11;
}

- (id)_requestContext
{
  int64_t v3 = [(ICStorePlatformRequest *)self->_platformRequest personalizationStyle];
  switch(v3)
  {
    case 0:
      v6 = objc_alloc_init(ICURLResponseAuthenticationProvider);
LABEL_8:
      v7 = v6;
      goto LABEL_10;
    case 1:
      id v4 = [ICStoreURLResponseAuthenticationProvider alloc];
      uint64_t v5 = 1;
      goto LABEL_7;
    case 2:
      id v4 = [ICStoreURLResponseAuthenticationProvider alloc];
      uint64_t v5 = 2;
LABEL_7:
      v6 = [(ICURLResponseAuthenticationProvider *)v4 initWithUserInteractionLevel:v5];
      goto LABEL_8;
  }
  v7 = 0;
LABEL_10:
  v8 = [(ICStorePlatformRequest *)self->_platformRequest requestContext];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__ICStorePlatformRequestOperation__requestContext__block_invoke;
  v12[3] = &unk_1E5ACC698;
  v13 = v7;
  v9 = v7;
  v10 = (void *)[v8 copyWithBlock:v12];

  return v10;
}

uint64_t __50__ICStorePlatformRequestOperation__requestContext__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAuthenticationProvider:*(void *)(a1 + 32)];
}

- (void)_finishWithResponse:(id)a3 error:(id)a4
{
  id v6 = a4;
  responseHandler = (void (**)(id, id, id))self->_responseHandler;
  id v9 = v6;
  if (responseHandler)
  {
    responseHandler[2](responseHandler, a3, v6);
    id v8 = self->_responseHandler;
    self->_responseHandler = 0;

    id v6 = v9;
  }
  [(ICStorePlatformRequestOperation *)self finishWithError:v6];
}

- (void)_executeUnpersonalized
{
  int64_t v3 = [(ICStorePlatformRequestOperation *)self _requestContext];
  id v4 = +[ICURLBagProvider sharedBagProvider];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__ICStorePlatformRequestOperation__executeUnpersonalized__block_invoke;
  v5[3] = &unk_1E5ACAFC8;
  v5[4] = self;
  v5[5] = v3;
  [v4 getBagForRequestContext:v3 withCompletionHandler:v5];
}

void __57__ICStorePlatformRequestOperation__executeUnpersonalized__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = [a2 urlForBagKey:@"storeplatform-lookup-url-unpersonalized"];
    id v13 = (id)v4;
    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) _URLRequestWithBaseURL:v4];
      id v6 = [NSString alloc];
      v7 = [MEMORY[0x1E4F1C9C8] date];
      [v7 timeIntervalSince1970];
      id v9 = objc_msgSend(v6, "initWithFormat:", @"%.0f", v8);

      [v5 setValue:v9 forHTTPHeaderField:@"X-JS-TIMESTAMP"];
      v10 = [[ICStoreURLRequest alloc] initWithURLRequest:v5 requestContext:*(void *)(a1 + 40)];
      v11 = +[ICJSSignConfiguration storePlatformConfiguration];
      [(ICStoreURLRequest *)v10 setJSSignConfiguration:v11];

      [(ICStoreURLRequest *)v10 setShouldUseMescalSigning:0];
      [*(id *)(a1 + 32) _enqueueDataRequest:v10];
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      [*(id *)(a1 + 32) _finishWithResponse:0 error:v5];
    }
  }
  else
  {
    v12 = *(void **)(a1 + 32);
    [v12 _finishWithResponse:0 error:a3];
  }
}

- (void)_executePersonalized
{
  int64_t v3 = [(ICStorePlatformRequestOperation *)self _requestContext];
  uint64_t v4 = +[ICURLBagProvider sharedBagProvider];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__ICStorePlatformRequestOperation__executePersonalized__block_invoke;
  v5[3] = &unk_1E5ACAFC8;
  v5[4] = self;
  v5[5] = v3;
  [v4 getBagForRequestContext:v3 withCompletionHandler:v5];
}

void __55__ICStorePlatformRequestOperation__executePersonalized__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = [a2 urlForBagKey:@"storeplatform-lookup-url"];
    id v9 = (id)v4;
    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) _URLRequestWithBaseURL:v4];
      id v6 = [[ICStoreURLRequest alloc] initWithURLRequest:v5 requestContext:*(void *)(a1 + 40)];
      v7 = [NSString stringWithFormat:@"storePlatform/%@", @"storeplatform-lookup-url"];
      [(ICURLRequest *)v6 enableLoadURLMetricsWithRequestName:v7];

      [*(id *)(a1 + 32) _enqueueDataRequest:v6];
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      [*(id *)(a1 + 32) _finishWithResponse:0 error:v5];
    }
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    [v8 _finishWithResponse:0 error:a3];
  }
}

- (void)_enqueueDataRequest:(id)a3
{
  id v4 = a3;
  [(ICStorePlatformRequest *)self->_platformRequest retryDelay];
  objc_msgSend(v4, "setRetryDelay:");
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ICStorePlatformRequestOperation__enqueueDataRequest___block_invoke;
  block[3] = &unk_1E5ACD4C8;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_barrier_async(accessQueue, block);
  urlSession = self->_urlSession;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__ICStorePlatformRequestOperation__enqueueDataRequest___block_invoke_2;
  v9[3] = &unk_1E5ACAF80;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(ICURLSession *)urlSession enqueueDataRequest:v8 withCompletionHandler:v9];
}

void __55__ICStorePlatformRequestOperation__enqueueDataRequest___block_invoke(uint64_t a1)
{
}

void __55__ICStorePlatformRequestOperation__enqueueDataRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 288);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __55__ICStorePlatformRequestOperation__enqueueDataRequest___block_invoke_3;
  v16 = &unk_1E5ACD4C8;
  uint64_t v17 = v7;
  id v18 = *(id *)(a1 + 40);
  dispatch_barrier_async(v8, &v13);
  if (v5)
  {
    id v9 = [ICStorePlatformResponse alloc];
    id v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 320), "itemIdentifiers", v13, v14, v15, v16, v17);
    v11 = [(ICStorePlatformResponse *)v9 initWithURLResponse:v5 requestedItemIdentifiers:v10];

    if (v11)
    {
      id v12 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -7102, v6, @"Failed to run SP lookup");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v12 = v6;
    v11 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_finishWithResponse:error:", v11, v12, v13, v14, v15, v16, v17);
}

void __55__ICStorePlatformRequestOperation__enqueueDataRequest___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  int64_t v3 = *(void **)(v1 + 296);
  if (v3 == v2)
  {
    *(void *)(v1 + 296) = 0;
  }
}

- (void)finishWithError:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICStorePlatformRequestOperation;
  [(ICAsyncOperation *)&v5 finishWithError:a3];
  strongSelf = self->_strongSelf;
  self->_strongSelf = 0;
}

- (void)execute
{
  if ([(ICStorePlatformRequestOperation *)self isCancelled])
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7004 userInfo:0];
    [(ICStorePlatformRequestOperation *)self _finishWithResponse:0 error:v4];
  }
  else
  {
    objc_storeStrong((id *)&self->_strongSelf, self);
    int64_t v3 = [(ICStorePlatformRequest *)self->_platformRequest personalizationStyle];
    if ((unint64_t)(v3 - 1) >= 2)
    {
      if (!v3)
      {
        [(ICStorePlatformRequestOperation *)self _executeUnpersonalized];
      }
    }
    else
    {
      [(ICStorePlatformRequestOperation *)self _executePersonalized];
    }
  }
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)ICStorePlatformRequestOperation;
  [(ICStorePlatformRequestOperation *)&v5 cancel];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ICStorePlatformRequestOperation_cancel__block_invoke;
  block[3] = &unk_1E5ACD750;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __41__ICStorePlatformRequestOperation_cancel__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 296)) {
    return objc_msgSend(*(id *)(v1 + 312), "cancelRequest:");
  }
  return result;
}

- (ICStorePlatformRequestOperation)initWithPlatformRequest:(id)a3 usingURLSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICStorePlatformRequestOperation;
  id v8 = [(ICAsyncOperation *)&v14 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.iTunesCloud.ICStorePlatformRequestOperation.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [v6 copy];
    platformRequest = v8->_platformRequest;
    v8->_platformRequest = (ICStorePlatformRequest *)v11;

    objc_storeStrong((id *)&v8->_urlSession, a4);
    -[ICStorePlatformRequestOperation setQualityOfService:](v8, "setQualityOfService:", [v6 qualityOfService]);
  }

  return v8;
}

- (ICStorePlatformRequestOperation)initWithPlatformRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[ICURLSessionManager defaultSession];
  id v6 = [(ICStorePlatformRequestOperation *)self initWithPlatformRequest:v4 usingURLSession:v5];

  return v6;
}

@end