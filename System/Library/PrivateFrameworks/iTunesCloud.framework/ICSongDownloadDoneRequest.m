@interface ICSongDownloadDoneRequest
- (ICSongDownloadDoneRequest)initWithRequestContext:(id)a3 downloadIdentifier:(id)a4 songID:(unint64_t)a5;
- (void)cancel;
- (void)execute;
- (void)performRequestWithResponseHandler:(id)a3;
@end

@implementation ICSongDownloadDoneRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeURLRequest, 0);
  objc_storeStrong((id *)&self->_downloadIdentifier, 0);

  objc_storeStrong((id *)&self->_requestContext, 0);
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)ICSongDownloadDoneRequest;
  [(ICSongDownloadDoneRequest *)&v4 cancel];
  v3 = +[ICURLSessionManager defaultSession];
  [v3 cancelRequest:self->_storeURLRequest];
}

- (void)execute
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    downloadIdentifier = self->_downloadIdentifier;
    unint64_t songID = self->_songID;
    *(_DWORD *)buf = 138543618;
    v10 = downloadIdentifier;
    __int16 v11 = 2048;
    unint64_t v12 = songID;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "performing songDownloadDone request. downloadID=%{public}@, songID=%llu", buf, 0x16u);
  }

  v6 = +[ICURLBagProvider sharedBagProvider];
  requestContext = self->_requestContext;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__ICSongDownloadDoneRequest_execute__block_invoke;
  v8[3] = &unk_1E5ACD950;
  v8[4] = self;
  [v6 getBagForRequestContext:requestContext withCompletionHandler:v8];
}

void __36__ICSongDownloadDoneRequest_execute__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_super v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "finishWithError:");
  }
  else
  {
    uint64_t v5 = [a2 urlForBagKey:@"songDownloadDone"];
    if (v5)
    {
      v6 = (void *)v5;
      v24[0] = @"download-id";
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(v7 + 312);
      v24[1] = @"songId";
      v25[0] = v8;
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", *(void *)(v7 + 320));
      v25[1] = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
      __int16 v11 = objc_msgSend(v6, "ic_URLByAppendingQueryParameters:", v10);

      unint64_t v12 = [MEMORY[0x1E4F18D50] requestWithURL:v11];
      uint64_t v13 = [[ICStoreURLRequest alloc] initWithURLRequest:v12 requestContext:*(void *)(*(void *)(a1 + 32) + 304)];
      uint64_t v14 = *(void *)(a1 + 32);
      v15 = *(void **)(v14 + 328);
      *(void *)(v14 + 328) = v13;

      v16 = [*(id *)(a1 + 32) progress];
      v17 = [*(id *)(*(void *)(a1 + 32) + 328) progress];
      [v16 addChild:v17 withPendingUnitCount:100];

      v18 = +[ICURLSessionManager defaultSession];
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = *(void *)(v19 + 328);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __36__ICSongDownloadDoneRequest_execute__block_invoke_2;
      v23[3] = &unk_1E5ACD928;
      v23[4] = v19;
      [v18 enqueueDataRequest:v20 withCompletionHandler:v23];
    }
    else
    {
      v21 = *(void **)(a1 + 32);
      id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      objc_msgSend(v21, "finishWithError:");
    }
  }
}

uint64_t __36__ICSongDownloadDoneRequest_execute__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__ICSongDownloadDoneRequest_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E5ACD8E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICRequestOperation *)self performRequestWithCompletionHandler:v6];
}

void __63__ICSongDownloadDoneRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 328);
  *(void *)(v2 + 328) = 0;
}

- (ICSongDownloadDoneRequest)initWithRequestContext:(id)a3 downloadIdentifier:(id)a4 songID:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICSongDownloadDoneRequest;
  __int16 v11 = [(ICRequestOperation *)&v14 init];
  unint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestContext, a3);
    objc_storeStrong((id *)&v12->_downloadIdentifier, a4);
    v12->_unint64_t songID = a5;
  }

  return v12;
}

@end