@interface ICAuthorizeMachineRequest
- (ICAuthorizeMachineRequest)initWithRequestContext:(id)a3;
- (ICStoreRequestContext)requestContext;
- (NSData)tokenData;
- (NSString)keybagPath;
- (NSString)reason;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)qualityOfService;
- (void)performWithResponseHandler:(id)a3;
- (void)setKeybagPath:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setReason:(id)a3;
- (void)setRequestContext:(id)a3;
- (void)setTokenData:(id)a3;
@end

@implementation ICAuthorizeMachineRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenData, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_keybagPath, 0);
}

- (void)setTokenData:(id)a3
{
}

- (NSData)tokenData
{
  return self->_tokenData;
}

- (void)setRequestContext:(id)a3
{
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setReason:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setKeybagPath:(id)a3
{
}

- (NSString)keybagPath
{
  return self->_keybagPath;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = [ICAsyncBlockOperation alloc];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __56__ICAuthorizeMachineRequest_performWithResponseHandler___block_invoke;
  v12 = &unk_1E5ACB5A0;
  v13 = self;
  id v14 = v4;
  id v6 = v4;
  v7 = [(ICAsyncBlockOperation *)v5 initWithStartHandler:&v9];
  v8 = objc_msgSend(MEMORY[0x1E4F28F08], "ic_sharedRequestOperationQueueWithQualityOfService:", self->_qualityOfService, v9, v10, v11, v12, v13);
  [v8 addOperation:v7];
}

void __56__ICAuthorizeMachineRequest_performWithResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__ICAuthorizeMachineRequest_performWithResponseHandler___block_invoke_2;
  v13[3] = &unk_1E5AC9E08;
  id v4 = *(id *)(a1 + 40);
  id v14 = v3;
  id v15 = v4;
  id v5 = v3;
  id v6 = (void *)MEMORY[0x1A6240BF0](v13);
  v7 = +[ICURLBagProvider sharedBagProvider];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__ICAuthorizeMachineRequest_performWithResponseHandler___block_invoke_3;
  v11[3] = &unk_1E5AC9E30;
  v11[4] = v8;
  id v12 = v6;
  id v10 = v6;
  [v7 getBagForRequestContext:v9 withCompletionHandler:v11];
}

void __56__ICAuthorizeMachineRequest_performWithResponseHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t, uint64_t, id))(v5 + 16);
  id v7 = a3;
  v6(v5, a2, v7);
  [*(id *)(a1 + 32) finishWithError:v7];
}

void __56__ICAuthorizeMachineRequest_performWithResponseHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [a2 urlForBagKey:@"authorizeMachine"];
    if (v6)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v6];
      uint64_t v8 = [(ICStoreURLRequest *)[ICAuthorizeMachineURLRequest alloc] initWithURLRequest:v7 requestContext:*(void *)(*(void *)(a1 + 32) + 32)];
      [(ICAuthorizeMachineURLRequest *)v8 setReason:*(void *)(*(void *)(a1 + 32) + 24)];
      [(ICAuthorizeMachineURLRequest *)v8 setTokenData:*(void *)(*(void *)(a1 + 32) + 40)];
      [(ICAuthorizeMachineURLRequest *)v8 setKeybagPath:*(void *)(*(void *)(a1 + 32) + 8)];
      uint64_t v9 = +[ICURLSessionManager defaultSession];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __56__ICAuthorizeMachineRequest_performWithResponseHandler___block_invoke_4;
      v17[3] = &unk_1E5ACD400;
      id v10 = *(void **)(a1 + 40);
      v17[4] = *(void *)(a1 + 32);
      id v18 = v10;
      [v9 enqueueDataRequest:v8 withCompletionHandler:v17];
    }
    else
    {
      id v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v20 = v15;
        _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Missing authorize machine URL bag key", buf, 0xCu);
      }

      uint64_t v16 = *(void *)(a1 + 40);
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v7);
    }

    goto LABEL_12;
  }
  v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v12;
    __int16 v21 = 2114;
    id v22 = v5;
    _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to load URL bag with error: %{public}@", buf, 0x16u);
  }

  uint64_t v13 = *(void *)(a1 + 40);
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7200 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v6);
LABEL_12:

    goto LABEL_13;
  }
  (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v5);
LABEL_13:
}

void __56__ICAuthorizeMachineRequest_performWithResponseHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    uint64_t v8 = [v5 parsedBodyDictionary];
    if (!v8)
    {
      v27 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v39 = v28;
        _os_log_impl(&dword_1A2D01000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Response has invalid format", buf, 0xCu);
      }

      uint64_t v29 = *(void *)(a1 + 40);
      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
      (*(void (**)(uint64_t, void, ICAuthorizeMachineResponse *))(v29 + 16))(v29, 0, v9);
      goto LABEL_29;
    }
    uint64_t v9 = [[ICAuthorizeMachineResponse alloc] initWithResponseDictionary:v8];
    id v10 = [(ICAuthorizeMachineResponse *)v9 keybagData];
    if (!v10)
    {
LABEL_26:
      v32 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v39 = v33;
        _os_log_impl(&dword_1A2D01000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finishing.", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_29:

      goto LABEL_30;
    }
    unsigned int v37 = 0;
    v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    if (([v11 fileExistsAtPath:*(void *)(*(void *)(a1 + 32) + 8)] & 1) == 0) {
      [v11 createDirectoryAtPath:*(void *)(*(void *)(a1 + 32) + 8) withIntermediateDirectories:1 attributes:0 error:0];
    }
    uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 8);
    id v36 = 0;
    int ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(v12, &v37, &v36);
    id v14 = v36;
    uint64_t v15 = v14;
    if (!ContextIdentifierForFolderPath)
    {
      id v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v39 = v30;
        __int16 v40 = 2114;
        id v41 = v15;
        _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting context ID failed with error: %{public}@", buf, 0x16u);
      }
      id v17 = v15;
      goto LABEL_25;
    }
    v34 = v11;
    id v35 = v14;
    BOOL v16 = ICFairPlayImportKeybagDataWithContextID(v37, v10, &v35);
    id v17 = v35;

    id v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      v11 = v34;
      if (v19)
      {
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v39 = v20;
        __int16 v21 = "[%{public}@] Imported keybag data.";
        id v22 = v18;
        uint32_t v23 = 12;
LABEL_24:
        _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
    }
    else
    {
      v11 = v34;
      if (v19)
      {
        uint64_t v31 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v39 = v31;
        __int16 v40 = 2114;
        id v41 = v17;
        __int16 v21 = "[%{public}@] Importing keybag data failed with error: %{public}@";
        id v22 = v18;
        uint32_t v23 = 22;
        goto LABEL_24;
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v39 = v25;
    __int16 v40 = 2114;
    id v41 = v7;
    _os_log_impl(&dword_1A2D01000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Response returned error: %{public}@", buf, 0x16u);
  }

  uint64_t v26 = *(void *)(a1 + 40);
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v26 + 16))(v26, 0, v8);
LABEL_30:

    goto LABEL_31;
  }
  (*(void (**)(uint64_t, void, void *))(v26 + 16))(v26, 0, v7);
LABEL_31:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRequestContext:self->_requestContext];
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_reason copyWithZone:a3];
    id v7 = (void *)v5[3];
    v5[3] = v6;

    uint64_t v8 = [(NSData *)self->_tokenData copyWithZone:a3];
    uint64_t v9 = (void *)v5[5];
    v5[5] = v8;

    uint64_t v10 = [(NSString *)self->_keybagPath copyWithZone:a3];
    v11 = (void *)v5[1];
    v5[1] = v10;

    v5[2] = self->_qualityOfService;
  }
  return v5;
}

- (ICAuthorizeMachineRequest)initWithRequestContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICAuthorizeMachineRequest;
  id v5 = [(ICAuthorizeMachineRequest *)&v10 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_qualityOfService = 17;
    uint64_t v7 = [v4 copy];
    requestContext = v6->_requestContext;
    v6->_requestContext = (ICStoreRequestContext *)v7;
  }
  return v6;
}

@end