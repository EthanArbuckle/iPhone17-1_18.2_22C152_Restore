@interface ICBuyProductRequest
- (ICBuyProductRequest)initWithRequestContext:(id)a3 buyParameters:(id)a4 includeKeybagSyncData:(BOOL)a5;
- (ICBuyProductRequest)initWithRequestContext:(id)a3 buyParametersString:(id)a4 includeKeybagSyncData:(BOOL)a5;
- (void)cancel;
- (void)execute;
- (void)performRequestWithResponseHandler:(id)a3;
@end

@implementation ICBuyProductRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_parsedResponse, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_storeURLRequest, 0);

  objc_storeStrong((id *)&self->_requestContext, 0);
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)ICBuyProductRequest;
  [(ICBuyProductRequest *)&v4 cancel];
  v3 = +[ICURLSessionManager highPrioritySession];
  [v3 cancelRequest:self->_storeURLRequest];
}

- (void)execute
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    buyParameters = self->_buyParameters;
    *(_DWORD *)buf = 138543618;
    v9 = self;
    __int16 v10 = 2114;
    v11 = buyParameters;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing BuyProdcut request with params %{public}@", buf, 0x16u);
  }

  v5 = +[ICURLBagProvider sharedBagProvider];
  requestContext = self->_requestContext;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__ICBuyProductRequest_execute__block_invoke;
  v7[3] = &unk_1E5ACD950;
  v7[4] = self;
  [v5 getBagForRequestContext:requestContext withCompletionHandler:v7];
}

void __30__ICBuyProductRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v8;
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load url bag. err=%{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    v9 = [v5 urlForBagKey:@"buyProduct"];
    if (v9)
    {
      __int16 v10 = [*(id *)(*(void *)(a1 + 32) + 304) identityStore];
      v11 = [*(id *)(*(void *)(a1 + 32) + 304) identity];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __30__ICBuyProductRequest_execute__block_invoke_4;
      v16[3] = &unk_1E5ACAE00;
      v16[4] = *(void *)(a1 + 32);
      id v17 = v9;
      id v18 = v5;
      [v10 getPropertiesForUserIdentity:v11 completionHandler:v16];
    }
    else
    {
      uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v20 = v13;
        _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Missing buyProduct url in bag - skipping", buf, 0xCu);
      }

      v14 = *(void **)(a1 + 32);
      v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      [v14 finishWithError:v15];
    }
  }
}

void __30__ICBuyProductRequest_execute__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v44 = v8;
      __int16 v45 = 2114;
      id v46 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load identity properties. err=%{public}@", buf, 0x16u);
    }

    v9 = *(void **)(a1 + 32);
    __int16 v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
    [v9 finishWithError:v10];
    goto LABEL_30;
  }
  __int16 v10 = [MEMORY[0x1E4F18D50] requestWithURL:*(void *)(a1 + 40)];
  [v10 setHTTPMethod:@"POST"];
  [v10 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  v11 = +[ICDeviceInfo currentDeviceInfo];
  if ([v11 isWatch])
  {
    uint64_t v12 = +[ICEnvironmentMonitor sharedMonitor];
    uint64_t v13 = [v12 networkType];

    if (v13 == 500) {
      [v10 setValue:@"WiFi" forHTTPHeaderField:@"X-Apple-Connection-Type"];
    }
  }
  else
  {
  }
  v14 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(*(void *)(a1 + 32) + 320)];
  v15 = [*(id *)(*(void *)(a1 + 32) + 304) deviceInfo];
  v16 = [v15 deviceGUID];

  if (v16)
  {
    id v17 = [*(id *)(*(void *)(a1 + 32) + 304) deviceInfo];
    id v18 = [v17 deviceGUID];
    [v14 setObject:v18 forKey:@"guid"];
  }
  v19 = [*(id *)(*(void *)(a1 + 32) + 304) deviceInfo];
  int v20 = [v19 isWatch];

  if (v20)
  {
    __int16 v21 = +[ICNanoPairedDeviceStatusMonitor sharedMonitor];
    id v22 = [v21 pairedDeviceMediaGUID];

    if (v22) {
      [v14 setObject:v22 forKey:@"companion-guid"];
    }
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 328) && [*(id *)(a1 + 48) canPostKeybagSyncData])
  {
    uint64_t v23 = [v5 DSID];
    id v41 = 0;
    id v42 = 0;
    BOOL v24 = ICFairPlayCopyKeyBagSyncData([v23 unsignedLongLongValue], 1, &v42, &v41);
    id v25 = v42;
    id v26 = v41;

    if (v24)
    {
      if (!v25)
      {
LABEL_24:

        goto LABEL_25;
      }
      v27 = [v25 base64EncodedStringWithOptions:0];
      if (v27) {
        [v14 setObject:v27 forKey:@"kbsync"];
      }
    }
    else
    {
      v27 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v44 = v28;
        __int16 v45 = 2114;
        id v46 = v26;
        _os_log_impl(&dword_1A2D01000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to copy keybag sync data. err=%{public}@", buf, 0x16u);
      }
    }

    goto LABEL_24;
  }
LABEL_25:
  v29 = +[ICDeviceInfo currentDeviceInfo];
  int v30 = [v29 isWatch];

  if (v30) {
    [v14 setObject:@"true" forKey:@"wasWarnedOverLimitBuyOnCellular"];
  }
  v31 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v14 format:100 options:0 error:0];
  if (v31) {
    [v10 setHTTPBody:v31];
  }
  v32 = [[ICStoreURLRequest alloc] initWithURLRequest:v10 requestContext:*(void *)(*(void *)(a1 + 32) + 304)];
  uint64_t v33 = *(void *)(a1 + 32);
  v34 = *(void **)(v33 + 312);
  *(void *)(v33 + 312) = v32;

  v35 = [*(id *)(a1 + 32) progress];
  v36 = [*(id *)(*(void *)(a1 + 32) + 312) progress];
  [v35 addChild:v36 withPendingUnitCount:100];

  v37 = +[ICURLSessionManager highPrioritySession];
  uint64_t v38 = *(void *)(a1 + 32);
  uint64_t v39 = *(void *)(v38 + 312);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __30__ICBuyProductRequest_execute__block_invoke_32;
  v40[3] = &unk_1E5ACD928;
  v40[4] = v38;
  [v37 enqueueDataRequest:v39 withCompletionHandler:v40];

LABEL_30:
}

void __30__ICBuyProductRequest_execute__block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v14 = 138543618;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      id v17 = v5;
      uint64_t v8 = "%{public}@ buyProduct request failed. err=%{public}@";
LABEL_6:
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    uint64_t v9 = [a2 parsedBody];
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 336);
    *(void *)(v10 + 336) = v9;

    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void **)(v12 + 336);
      int v14 = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 2114;
      id v17 = v13;
      uint64_t v8 = "%{public}@ buyProduct request returned response %{public}@";
      goto LABEL_6;
    }
  }

  [*(id *)(a1 + 32) finishWithError:v5];
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F28F08], "ic_sharedRequestOperationQueueWithQualityOfService:", 25);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__ICBuyProductRequest_performRequestWithResponseHandler___block_invoke;
  v7[3] = &unk_1E5ACD8E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ICRequestOperation *)self performRequestOnOperationQueue:v5 withCompletionHandler:v7];
}

uint64_t __57__ICBuyProductRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 336), a2);
}

- (ICBuyProductRequest)initWithRequestContext:(id)a3 buyParametersString:(id)a4 includeKeybagSyncData:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (void *)MEMORY[0x1E4F1CB10];
  id v9 = a3;
  uint64_t v10 = objc_msgSend(v8, "ic_queryParametersDictionaryFromString:", a4);
  v11 = [(ICBuyProductRequest *)self initWithRequestContext:v9 buyParameters:v10 includeKeybagSyncData:v5];

  return v11;
}

- (ICBuyProductRequest)initWithRequestContext:(id)a3 buyParameters:(id)a4 includeKeybagSyncData:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(ICRequestOperation *)self init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestContext, a3);
    objc_storeStrong((id *)&v12->_buyParameters, a4);
    v12->_includeKeybagSyncData = a5;
  }

  return v12;
}

@end