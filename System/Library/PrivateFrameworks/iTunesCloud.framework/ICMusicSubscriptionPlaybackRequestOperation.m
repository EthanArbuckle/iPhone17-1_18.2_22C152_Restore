@interface ICMusicSubscriptionPlaybackRequestOperation
- (BOOL)isDelegatedPlayback;
- (BOOL)isFollowUp;
- (ICMusicSubscriptionPlaybackRequestOperation)init;
- (ICStoreRequestContext)requestContext;
- (NSString)assetSourceStorefrontID;
- (NSString)cloudUniversalLibraryID;
- (id)responseHandler;
- (id)willBeginExecutionHandler;
- (int64_t)requestType;
- (int64_t)storePurchasedAdamID;
- (int64_t)storeSubscriptionAdamID;
- (unint64_t)storeCloudID;
- (void)cancel;
- (void)setAssetSourceStorefrontID:(id)a3;
- (void)setCloudUniversalLibraryID:(id)a3;
- (void)setDelegatedPlayback:(BOOL)a3;
- (void)setFollowUp:(BOOL)a3;
- (void)setRequestContext:(id)a3;
- (void)setRequestType:(int64_t)a3;
- (void)setResponseHandler:(id)a3;
- (void)setStoreCloudID:(unint64_t)a3;
- (void)setStorePurchasedAdamID:(int64_t)a3;
- (void)setStoreSubscriptionAdamID:(int64_t)a3;
- (void)setWillBeginExecutionHandler:(id)a3;
- (void)start;
@end

@implementation ICMusicSubscriptionPlaybackRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudUniversalLibraryID, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong(&self->_willBeginExecutionHandler, 0);
  objc_storeStrong((id *)&self->_assetSourceStorefrontID, 0);
  objc_storeStrong((id *)&self->_activeURLRequest, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)setFollowUp:(BOOL)a3
{
  self->_followUp = a3;
}

- (BOOL)isFollowUp
{
  return self->_followUp;
}

- (void)setCloudUniversalLibraryID:(id)a3
{
}

- (NSString)cloudUniversalLibraryID
{
  return self->_cloudUniversalLibraryID;
}

- (void)setStorePurchasedAdamID:(int64_t)a3
{
  self->_storePurchasedAdamID = a3;
}

- (int64_t)storePurchasedAdamID
{
  return self->_storePurchasedAdamID;
}

- (void)setStoreSubscriptionAdamID:(int64_t)a3
{
  self->_storeSubscriptionAdamID = a3;
}

- (int64_t)storeSubscriptionAdamID
{
  return self->_storeSubscriptionAdamID;
}

- (void)setStoreCloudID:(unint64_t)a3
{
  self->_storeCloudID = a3;
}

- (unint64_t)storeCloudID
{
  return self->_storeCloudID;
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setRequestContext:(id)a3
{
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setWillBeginExecutionHandler:(id)a3
{
}

- (id)willBeginExecutionHandler
{
  return self->_willBeginExecutionHandler;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setDelegatedPlayback:(BOOL)a3
{
  self->_delegatedPlayback = a3;
}

- (BOOL)isDelegatedPlayback
{
  return self->_delegatedPlayback;
}

- (void)setAssetSourceStorefrontID:(id)a3
{
}

- (NSString)assetSourceStorefrontID
{
  return self->_assetSourceStorefrontID;
}

- (void)start
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  willBeginExecutionHandler = (void (**)(id, ICMusicSubscriptionPlaybackRequestOperation *))self->_willBeginExecutionHandler;
  if (willBeginExecutionHandler)
  {
    willBeginExecutionHandler[2](willBeginExecutionHandler, self);
    id v4 = self->_willBeginExecutionHandler;
    self->_willBeginExecutionHandler = 0;
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke;
  v29[3] = &unk_1E5AC7A38;
  v29[4] = self;
  v5 = (void *)MEMORY[0x1A6240BF0](v29, a2);
  id v6 = objc_alloc(MEMORY[0x1E4F77968]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_2;
  v27[3] = &unk_1E5AC7A60;
  v27[4] = self;
  id v7 = v5;
  id v28 = v7;
  v8 = (void *)[v6 initWithTimeout:v27 interruptionHandler:60.0];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_19;
  v24[3] = &unk_1E5AC7A88;
  id v9 = v8;
  id v25 = v9;
  id v10 = v7;
  id v26 = v10;
  v11 = (void (**)(void, void, void, void, void))MEMORY[0x1A6240BF0](v24);
  v12 = [(ICStoreRequestContext *)self->_requestContext identity];
  v13 = +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:v12];
  int v14 = [v13 privacyAcknowledgementRequiredForMusic];

  if (v14)
  {
    v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7007 userInfo:0];
    ((void (**)(void, void, void, void, void *))v11)[2](v11, 0, 0, 0, v15);
  }
  else
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__6279;
    v22[4] = __Block_byref_object_dispose__6280;
    id v23 = 0;
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = self;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching bag", buf, 0xCu);
    }

    v17 = +[ICURLBagProvider sharedBagProvider];
    requestContext = self->_requestContext;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_22;
    v19[3] = &unk_1E5AC7B50;
    v21 = v22;
    v19[4] = self;
    v20 = v11;
    [v17 getBagAndURLMetricsForRequestContext:requestContext forceRefetch:0 withCompletionHandler:v19];

    _Block_object_dispose(v22, 8);
  }
}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = v10[43];
  id v14 = v9;
  if (v11)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, id))(v11 + 16))(v11, a2, a3, a4, v9);
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 344);
    *(void *)(v12 + 344) = 0;

    id v9 = v14;
    id v10 = *(void **)(a1 + 32);
  }
  [v10 finishWithError:v9];
}

uint64_t __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_ERROR, "%{public}@ execution timed out", buf, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  v5 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7003, @"ICMusicSubscriptionPlaybackRequestOperation timed out");
  (*(void (**)(uint64_t, void, void, void, void *))(v4 + 16))(v4, 0, 0, 0, v5);

  return [MEMORY[0x1E4F77950] snapshotWithDomain:*MEMORY[0x1E4F778D8] type:@"Timeout" subType:@"SubPlaybackDispatchTimedOut" context:&stru_1EF5F5C40 triggerThresholdValues:0 events:0 completion:0];
}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_19(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v12 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_22(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = +[ICURLAggregatedPerformanceMetrics aggregatedMetricsFromAggregatedMetrics:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addingAggregatedMetrics:a3];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if (!v8)
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 304)) {
      id v14 = @"delegatePlayback";
    }
    else {
      id v14 = @"subDownload";
    }
    v15 = v14;
    v16 = [v7 urlForBagKey:v15];
    if (!v16)
    {
      v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v66 = v21;
        _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_ERROR, "%{public}@ playback endpoing missing from bag - treating as an error", buf, 0xCu);
      }

      uint64_t v22 = *(void *)(a1 + 40);
      uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v63 = *MEMORY[0x1E4F28228];
      id v25 = [NSString stringWithFormat:@"Missing bag key '%@'", v15];
      v64 = v25;
      id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      v27 = [v24 errorWithDomain:@"ICError" code:-7201 userInfo:v26];
      (*(void (**)(uint64_t, void, void, uint64_t, void *))(v22 + 16))(v22, 0, 0, v23, v27);

      goto LABEL_27;
    }
    if ([*(id *)(a1 + 32) isCancelled])
    {
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7004 userInfo:0];
      (*(void (**)(uint64_t, void, void, uint64_t, void *))(v17 + 16))(v17, 0, 0, v18, v19);

LABEL_27:
      goto LABEL_28;
    }
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_29;
    v55[3] = &unk_1E5AC7B00;
    v55[4] = *(void *)(a1 + 32);
    id v56 = v16;
    v57 = v15;
    uint64_t v60 = *(void *)(a1 + 48);
    id v28 = v7;
    id v58 = v28;
    id v59 = *(id *)(a1 + 40);
    v29 = (void (**)(void, void, void))MEMORY[0x1A6240BF0](v55);
    v30 = +[ICDeviceInfo currentDeviceInfo];
    if ([v30 isMac])
    {
      uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 320);

      if (v31 != 3)
      {
        uint64_t v32 = [v28 urlForBagKey:@"fps-cert"];
        v33 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        v34 = v33;
        if (v32)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v35 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543362;
            uint64_t v66 = v35;
            _os_log_impl(&dword_1A2D01000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching certificate", buf, 0xCu);
          }

          v36 = [[ICStoreURLRequest alloc] initWithURL:v32 requestContext:*(void *)(*(void *)(a1 + 32) + 336)];
          [(ICStoreURLRequest *)v36 setShouldParseBodyData:0];
          uint64_t v37 = *(void *)(a1 + 32);
          v38 = *(NSObject **)(v37 + 288);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_59;
          block[3] = &unk_1E5ACD4C8;
          block[4] = v37;
          v54 = v36;
          v39 = v36;
          dispatch_barrier_async(v38, block);
          v40 = +[ICURLSessionManager unlimitedHighPrioritySession];
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_2_60;
          v49[3] = &unk_1E5AC7B28;
          v42 = *(void **)(a1 + 40);
          uint64_t v41 = *(void *)(a1 + 48);
          v49[4] = *(void *)(a1 + 32);
          uint64_t v52 = v41;
          id v50 = v42;
          v51 = v29;
          [v40 enqueueDataRequest:v39 withCompletionHandler:v49];
        }
        else
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            uint64_t v43 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543362;
            uint64_t v66 = v43;
            _os_log_impl(&dword_1A2D01000, v34, OS_LOG_TYPE_ERROR, "%{public}@ certificate url missing from bag - treating as an error", buf, 0xCu);
          }

          uint64_t v44 = *(void *)(a1 + 40);
          uint64_t v48 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          v45 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v61 = *MEMORY[0x1E4F28228];
          v39 = [NSString stringWithFormat:@"Missing bag key '%@'", @"fps-cert"];
          v62 = v39;
          v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
          v47 = [v45 errorWithDomain:@"ICError" code:-7201 userInfo:v46];
          (*(void (**)(uint64_t, void, void, uint64_t, void *))(v44 + 16))(v44, 0, 0, v48, v47);
        }
        goto LABEL_26;
      }
    }
    else
    {
    }
    v29[2](v29, 0, 0);
LABEL_26:

    goto LABEL_27;
  }
  id v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v66 = v13;
    __int16 v67 = 2114;
    id v68 = v8;
    _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load bag. err=%{public}@", buf, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_28:
}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v33 = v8;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting playback request", buf, 0xCu);
  }

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:*(void *)(a1 + 40)];
  [v9 setHTTPMethod:@"POST"];
  uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v10 = [(ICStoreURLRequest *)[ICMusicSubscriptionPlaybackURLRequest alloc] initWithURLRequest:v9 requestContext:*(void *)(*(void *)(a1 + 32) + 336)];
  [(ICMusicSubscriptionPlaybackURLRequest *)v10 setAssetSourceStorefrontID:*(void *)(*(void *)(a1 + 32) + 312)];
  [(ICMusicSubscriptionPlaybackURLRequest *)v10 setRequestType:*(void *)(*(void *)(a1 + 32) + 320)];
  [(ICMusicSubscriptionPlaybackURLRequest *)v10 setStoreCloudID:*(void *)(*(void *)(a1 + 32) + 352)];
  [(ICMusicSubscriptionPlaybackURLRequest *)v10 setStorePurchasedAdamID:*(void *)(*(void *)(a1 + 32) + 368)];
  [(ICMusicSubscriptionPlaybackURLRequest *)v10 setStoreSubscriptionAdamID:*(void *)(*(void *)(a1 + 32) + 360)];
  [(ICMusicSubscriptionPlaybackURLRequest *)v10 setDelegatedPlayback:*(unsigned __int8 *)(*(void *)(a1 + 32) + 304)];
  [(ICMusicSubscriptionPlaybackURLRequest *)v10 setCloudUniversalLibraryID:*(void *)(*(void *)(a1 + 32) + 376)];
  [(ICMusicSubscriptionPlaybackURLRequest *)v10 setLeaseCertificateData:v6];

  [(ICMusicSubscriptionPlaybackURLRequest *)v10 setLeaseAssetIDData:v5];
  id v11 = [NSString stringWithFormat:@"subPlaybackDispatch/%@", *(void *)(a1 + 48)];
  [(ICURLRequest *)v10 enableLoadURLMetricsWithRequestName:v11];

  uint64_t v12 = *(void *)(a1 + 32);
  if (*(void *)(v12 + 320) != 1)
  {
    [(ICURLRequest *)v10 setRetryDelay:1.0];
    uint64_t v12 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v12 + 305))
  {
    uint64_t v13 = [MEMORY[0x1E4F290C8] queryItemWithName:@"followup" value:@"1"];
    uint64_t v31 = v13;
    id v14 = &v31;
LABEL_7:
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [(ICStoreURLRequest *)v10 setAdditionalQueryItems:v15];

    goto LABEL_12;
  }
  if (!*(void *)(v12 + 352)
    && !*(void *)(v12 + 368)
    && !*(void *)(v12 + 360)
    && ![*(id *)(v12 + 376) length])
  {
    uint64_t v13 = [MEMORY[0x1E4F290C8] queryItemWithName:@"lease-only" value:@"1"];
    v30 = v13;
    id v14 = &v30;
    goto LABEL_7;
  }
LABEL_12:
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(NSObject **)(v16 + 288);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_50;
  block[3] = &unk_1E5ACD4C8;
  block[4] = v16;
  v29 = v10;
  uint64_t v18 = v10;
  dispatch_barrier_async(v17, block);
  v19 = +[ICURLSessionManager unlimitedHighPrioritySession];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_2_51;
  v23[3] = &unk_1E5AC7AD8;
  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v27 = *(void *)(a1 + 72);
  v23[4] = v20;
  id v24 = v22;
  id v25 = *(id *)(a1 + 56);
  id v26 = *(id *)(a1 + 64);
  id v21 = v22;
  [v19 enqueueDataRequest:v18 withCompletionHandler:v23];
}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_59(uint64_t a1)
{
}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_2_60(void *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  uint64_t v8 = *(NSObject **)(v7 + 288);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_3_61;
  block[3] = &unk_1E5ACD750;
  block[4] = v7;
  dispatch_barrier_async(v8, block);
  uint64_t v9 = *(void *)(*(void *)(a1[7] + 8) + 40);
  uint64_t v10 = [v5 aggregatedPerformanceMetrics];
  uint64_t v11 = +[ICURLAggregatedPerformanceMetrics aggregatedMetricsFromAggregatedMetrics:v9 addingAggregatedMetrics:v10];
  uint64_t v12 = *(void *)(a1[7] + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  if (v6)
  {
    id v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = a1[4];
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v15;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load certificate data. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    uint64_t v16 = [v5 bodyData];
    if (v16)
    {
      uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:"lease" length:5];
      (*(void (**)(void))(a1[6] + 16))();
    }
    else
    {
      uint64_t v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = a1[4];
        *(_DWORD *)buf = 138543362;
        uint64_t v24 = v19;
        _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_ERROR, "%{public}@ No certificate data in response - treating as an error", buf, 0xCu);
      }

      uint64_t v20 = a1[5];
      uint64_t v21 = *(void *)(*(void *)(a1[7] + 8) + 40);
      uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
      (*(void (**)(uint64_t, void, void, uint64_t, void *))(v20 + 16))(v20, 0, 0, v21, v17);
    }
  }
}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_3_61(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 296);
  *(void *)(v1 + 296) = 0;
}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_50(uint64_t a1)
{
}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_2_51(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 288);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_3;
  block[3] = &unk_1E5ACD750;
  block[4] = v6;
  id v8 = a2;
  dispatch_barrier_async(v7, block);
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v10 = [v8 aggregatedPerformanceMetrics];
  uint64_t v11 = +[ICURLAggregatedPerformanceMetrics aggregatedMetricsFromAggregatedMetrics:v9 addingAggregatedMetrics:v10];
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  id v14 = [v8 parsedBodyDictionary];

  if (v14)
  {
    uint64_t v15 = [[ICMusicSubscriptionPlaybackResponse alloc] initWithResponseDictionary:v14 requestDate:*(void *)(a1 + 40) urlBag:*(void *)(a1 + 48)];
    uint64_t v16 = [(ICMusicSubscriptionPlaybackResponse *)v15 leaseInfoData];
    uint64_t v17 = [(ICMusicSubscriptionPlaybackResponse *)v15 subscriptionKeyBagData];
    if (v16 | v17)
    {
      uint64_t v18 = +[ICMusicSubscriptionFairPlayController sharedController];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_4;
      v21[3] = &unk_1E5AC7AB0;
      id v23 = *(id *)(a1 + 56);
      uint64_t v19 = v15;
      uint64_t v20 = *(void *)(a1 + 64);
      uint64_t v22 = v19;
      uint64_t v24 = v20;
      [v18 importSubscriptionKeyBagData:v17 leaseInfoData:v16 completionHandler:v21];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    uint64_t v15 = (ICMusicSubscriptionPlaybackResponse *)v5;
    if (!v15)
    {
      uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 296);
  *(void *)(v1 + 296) = 0;
}

uint64_t __52__ICMusicSubscriptionPlaybackRequestOperation_start__block_invoke_4(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, void, uint64_t))(a1[5] + 16))(a1[5], a1[4], a2, *(void *)(*(void *)(a1[6] + 8) + 40), a3);
}

- (void)cancel
{
  v12.receiver = self;
  v12.super_class = (Class)ICMusicSubscriptionPlaybackRequestOperation;
  [(ICMusicSubscriptionPlaybackRequestOperation *)&v12 cancel];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6279;
  uint64_t v10 = __Block_byref_object_dispose__6280;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__ICMusicSubscriptionPlaybackRequestOperation_cancel__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  if (v7[5])
  {
    uint64_t v4 = +[ICURLSessionManager unlimitedHighPrioritySession];
    [v4 cancelRequest:v7[5]];
  }
  _Block_object_dispose(&v6, 8);
}

void __53__ICMusicSubscriptionPlaybackRequestOperation_cancel__block_invoke(uint64_t a1)
{
}

- (ICMusicSubscriptionPlaybackRequestOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICMusicSubscriptionPlaybackRequestOperation;
  v2 = [(ICAsyncOperation *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionPlaybackRequestOperation.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end