@interface ICMediaRedownloadRequest
- (BOOL)includeKeybagSyncData;
- (BOOL)includeSubscriptionKeybagSyncData;
- (BOOL)isPlaybackRequest;
- (BOOL)isStreamingRental;
- (BOOL)usePrioritizedURLSession;
- (ICMediaRedownloadRequest)init;
- (ICMediaRedownloadRequest)initWithRequestContext:(id)a3 redownloadParameters:(id)a4;
- (ICMediaRedownloadRequest)initWithRequestContext:(id)a3 redownloadParametersString:(id)a4;
- (ICStoreRequestContext)requestContext;
- (ICURLSession)urlSession;
- (NSDictionary)redownloadParameters;
- (NSString)requestURLBagKey;
- (void)_executeWithActiveICloudAccountProperties:(id)a3;
- (void)cancel;
- (void)execute;
- (void)performRequestWithResponseHandler:(id)a3;
- (void)setIncludeKeybagSyncData:(BOOL)a3;
- (void)setIncludeSubscriptionKeybagSyncData:(BOOL)a3;
- (void)setPlaybackRequest:(BOOL)a3;
- (void)setRedownloadParameters:(id)a3;
- (void)setRequestContext:(id)a3;
- (void)setRequestURLBagKey:(id)a3;
- (void)setStreamingRental:(BOOL)a3;
- (void)setUrlSession:(id)a3;
- (void)setUsePrioritizedURLSession:(BOOL)a3;
@end

@implementation ICMediaRedownloadRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestURLBagKey, 0);
  objc_storeStrong((id *)&self->_redownloadParameters, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_urlMetrics, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_storeURLRequest, 0);
  objc_storeStrong((id *)&self->_redownloadResponse, 0);

  objc_storeStrong((id *)&self->_requestContext, 0);
}

- (void)setIncludeSubscriptionKeybagSyncData:(BOOL)a3
{
  self->_includeSubscriptionKeybagSyncData = a3;
}

- (BOOL)includeSubscriptionKeybagSyncData
{
  return self->_includeSubscriptionKeybagSyncData;
}

- (void)setIncludeKeybagSyncData:(BOOL)a3
{
  self->_includeKeybagSyncData = a3;
}

- (BOOL)includeKeybagSyncData
{
  return self->_includeKeybagSyncData;
}

- (void)setRequestURLBagKey:(id)a3
{
}

- (NSString)requestURLBagKey
{
  return self->_requestURLBagKey;
}

- (void)setRedownloadParameters:(id)a3
{
}

- (NSDictionary)redownloadParameters
{
  return self->_redownloadParameters;
}

- (void)setRequestContext:(id)a3
{
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setUrlSession:(id)a3
{
}

- (ICURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUsePrioritizedURLSession:(BOOL)a3
{
  self->_usePrioritizedURLSession = a3;
}

- (BOOL)usePrioritizedURLSession
{
  return self->_usePrioritizedURLSession;
}

- (void)setStreamingRental:(BOOL)a3
{
  self->_streamingRental = a3;
}

- (BOOL)isStreamingRental
{
  return self->_streamingRental;
}

- (void)setPlaybackRequest:(BOOL)a3
{
  self->_playbackRequest = a3;
}

- (BOOL)isPlaybackRequest
{
  return self->_playbackRequest;
}

- (void)_executeWithActiveICloudAccountProperties:(id)a3
{
  id v4 = a3;
  v5 = +[ICURLBagProvider sharedBagProvider];
  requestContext = self->_requestContext;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__ICMediaRedownloadRequest__executeWithActiveICloudAccountProperties___block_invoke;
  v8[3] = &unk_1E5AC8C18;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 getBagAndURLMetricsForRequestContext:requestContext forceRefetch:0 withCompletionHandler:v8];
}

void __70__ICMediaRedownloadRequest__executeWithActiveICloudAccountProperties___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 336), a3);
  }
  if (v9)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v95 = v11;
      __int16 v96 = 2114;
      id v97 = v9;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load url bag. err=%{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithError:v9];
    goto LABEL_61;
  }
  if (![*(id *)(a1 + 32) isCancelled])
  {
    v16 = [v7 urlForBagKey:*(void *)(*(void *)(a1 + 32) + 368)];
    if (!v16)
    {
      v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = *(void **)(a1 + 32);
        v23 = (void *)v22[46];
        *(_DWORD *)buf = 138543618;
        id v95 = v22;
        __int16 v96 = 2114;
        id v97 = v23;
        _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Failing due to missing bag key '%{public}@", buf, 0x16u);
      }

      v24 = *(void **)(a1 + 32);
      v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      [v24 finishWithError:v25];

      goto LABEL_60;
    }
    v17 = [MEMORY[0x1E4F18D50] requestWithURL:v16];
    [v17 setHTTPMethod:@"POST"];
    v76 = v17;
    [v17 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
    v18 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(*(void *)(a1 + 32) + 360)];
    v19 = [*(id *)(*(void *)(a1 + 32) + 304) deviceInfo];
    uint64_t v20 = [v19 deviceGUID];

    v77 = (void *)v20;
    if (v20)
    {
      [v18 setObject:v20 forKey:@"guid"];
    }
    else
    {
      v26 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        id v95 = v27;
        _os_log_impl(&dword_1A2D01000, v26, OS_LOG_TYPE_ERROR, "%{public}@ Error getting deviceGUID", buf, 0xCu);
      }
    }
    v28 = [*(id *)(*(void *)(a1 + 32) + 304) deviceInfo];
    int v29 = [v28 isWatch];

    if (v29)
    {
      v30 = +[ICNanoPairedDeviceStatusMonitor sharedMonitor];
      v31 = [v30 pairedDeviceMediaGUID];

      if (v31) {
        [v18 setObject:v31 forKey:@"companion-guid"];
      }
    }
    v32 = [*(id *)(*(void *)(a1 + 32) + 304) deviceInfo];
    char v33 = [v32 isAppleTV];

    if ((v33 & 1) == 0 && [*(id *)(a1 + 40) isCloudBackupEnabled]) {
      [v18 setObject:@"1" forKey:@"icloud-backup-enabled"];
    }
    uint64_t v34 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v34 + 344))
    {
      [v18 setObject:@"1" forKey:@"lightweight"];
      [v18 setObject:@"1" forKey:@"playback"];
      uint64_t v34 = *(void *)(a1 + 32);
    }
    if (*(unsigned char *)(v34 + 345))
    {
      [v18 setObject:@"1" forKey:@"streamingRental"];
      uint64_t v34 = *(void *)(a1 + 32);
    }
    v78 = v18;
    v35 = [*(id *)(v34 + 304) identityStore];
    v36 = [*(id *)(*(void *)(a1 + 32) + 304) identity];
    id v91 = 0;
    v37 = [v35 getPropertiesForUserIdentity:v36 error:&v91];
    id v38 = v91;

    if (v38)
    {
      v39 = v37;
      v40 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      v41 = v77;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v42 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        id v95 = v42;
        __int16 v96 = 2114;
        id v97 = v38;
        _os_log_impl(&dword_1A2D01000, v40, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve user account properties. err='%{public}@", buf, 0x16u);
      }

      [*(id *)(a1 + 32) finishWithError:v38];
      v43 = v76;
LABEL_59:

LABEL_60:
      goto LABEL_61;
    }
    v75 = v16;
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 347) || ![v7 canPostKeybagSyncData])
    {
LABEL_46:
      if (*(unsigned char *)(*(void *)(a1 + 32) + 348))
      {
        uint64_t v51 = [v37 DSID];
        uint64_t v52 = [(id)v51 unsignedLongLongValue];

        id v87 = 0;
        id v88 = 0;
        LOBYTE(v51) = +[ICADIUtilities generateMachineDataForAccountID:-1 returningMachineIDData:&v88 otpData:0 error:&v87];
        id v73 = v88;
        id v53 = v87;
        if (v51)
        {
          dispatch_semaphore_t v54 = dispatch_semaphore_create(0);
          +[ICMusicSubscriptionFairPlayController sharedController];
          v55 = id v71 = v53;
          v84[0] = MEMORY[0x1E4F143A8];
          v84[1] = 3221225472;
          v84[2] = __70__ICMediaRedownloadRequest__executeWithActiveICloudAccountProperties___block_invoke_39;
          v84[3] = &unk_1E5AC8BF0;
          v84[4] = *(void *)(a1 + 32);
          id v85 = v78;
          dispatch_semaphore_t v86 = v54;
          v56 = v54;
          uint64_t v57 = v52;
          v58 = v56;
          v59 = v73;
          [v55 generateSubscriptionBagRequestWithAccountUniqueIdentifier:v57 transactionType:312 machineIDData:v73 completionHandler:v84];

          id v53 = v71;
          dispatch_semaphore_wait(v58, 0xFFFFFFFFFFFFFFFFLL);
        }
        else
        {
          v59 = v73;
          v58 = _ICLogCategoryDefault();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v95 = v53;
            _os_log_impl(&dword_1A2D01000, v58, OS_LOG_TYPE_DEFAULT, "failed to generate machine data for download request. err=%{public}@", buf, 0xCu);
          }
        }
      }
      id v83 = 0;
      v60 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v78 format:100 options:0 error:&v83];
      id v61 = v83;
      v62 = v61;
      if (!v60 || v61)
      {
        v74 = v60;
        v39 = v37;
        v65 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          v66 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          id v95 = v66;
          __int16 v96 = 2114;
          id v97 = v62;
          __int16 v98 = 2114;
          v99 = v78;
          _os_log_impl(&dword_1A2D01000, v65, OS_LOG_TYPE_ERROR, "%{public}@ failed to serialize body data. err=%{public}@, bodyDictionary=%{public}@", buf, 0x20u);
        }

        v67 = *(void **)(a1 + 32);
        v68 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v92 = *MEMORY[0x1E4F28A50];
        v93 = v62;
        v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
        v70 = [v68 errorWithDomain:@"ICError" code:-7005 userInfo:v69];
        [v67 finishWithError:v70];

        v43 = v76;
        v60 = v74;
      }
      else
      {
        v39 = v37;
        uint64_t v63 = *(void *)(a1 + 32);
        v64 = *(void **)(v63 + 328);
        v79[0] = MEMORY[0x1E4F143A8];
        v79[1] = 3221225472;
        v79[2] = __70__ICMediaRedownloadRequest__executeWithActiveICloudAccountProperties___block_invoke_46;
        v79[3] = &unk_1E5ACD640;
        v79[4] = v63;
        v43 = v76;
        id v80 = v76;
        id v81 = v60;
        id v82 = v7;
        [v64 lockWithBlock:v79];
      }
      v16 = v75;
      v41 = v77;
      goto LABEL_59;
    }
    v44 = [v37 DSID];
    id v89 = 0;
    id v90 = 0;
    BOOL v45 = ICFairPlayCopyKeyBagSyncData([v44 unsignedLongLongValue], 1, &v90, &v89);
    id v46 = v90;
    id v72 = v89;

    if (v45)
    {
      v47 = v72;
      v48 = v46;
      if (!v46)
      {
LABEL_45:

        goto LABEL_46;
      }
      v49 = [v46 base64EncodedStringWithOptions:0];
      if (v49) {
        [v78 setObject:v49 forKey:@"kbsync"];
      }
    }
    else
    {
      v48 = v46;
      v49 = _ICLogCategoryDefault();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        id v95 = v50;
        __int16 v96 = 2114;
        v47 = v72;
        id v97 = v72;
        _os_log_impl(&dword_1A2D01000, v49, OS_LOG_TYPE_ERROR, "%{public}@ failed to copy keybag sync data. err=%{public}@", buf, 0x16u);
      }
      else
      {
        v47 = v72;
      }
    }

    goto LABEL_45;
  }
  v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    id v95 = v13;
    _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@ stopping because the operation was cancelled", buf, 0xCu);
  }

  v14 = *(void **)(a1 + 32);
  v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7004 userInfo:0];
  [v14 finishWithError:v15];

LABEL_61:
}

void __70__ICMediaRedownloadRequest__executeWithActiveICloudAccountProperties___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "%{public}@ failed to generate subscription sync data. err=%{public}@", (uint8_t *)&v9, 0x16u);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (v5)
  {
    id v7 = [v5 base64EncodedStringWithOptions:0];
    if (v7) {
      [*(id *)(a1 + 40) setObject:v7 forKey:@"sbsync"];
    }
    goto LABEL_7;
  }
LABEL_8:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __70__ICMediaRedownloadRequest__executeWithActiveICloudAccountProperties___block_invoke_46(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isCancelled])
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v3;
      _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_ERROR, "%{public}@ stopping because the operation was cancelled", buf, 0xCu);
    }

    id v4 = *(void **)(a1 + 32);
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7004 userInfo:0];
    [v4 finishWithError:v5];
  }
  else
  {
    [*(id *)(a1 + 40) setHTTPBody:*(void *)(a1 + 48)];
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    id v7 = [[ICStoreURLRequest alloc] initWithURLRequest:*(void *)(a1 + 40) requestContext:*(void *)(*(void *)(a1 + 32) + 304)];
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(void **)(v8 + 320);
    *(void *)(v8 + 320) = v7;

    uint64_t v10 = *(void *)(a1 + 32);
    __int16 v11 = *(void **)(v10 + 320);
    id v12 = [NSString stringWithFormat:@"mediaRedownload/%@", *(void *)(v10 + 368)];
    [v11 enableLoadURLMetricsWithRequestName:v12];

    uint64_t v13 = [*(id *)(a1 + 32) progress];
    v14 = [*(id *)(*(void *)(a1 + 32) + 320) progress];
    [v13 addChild:v14 withPendingUnitCount:100];

    uint64_t v15 = *(void *)(a1 + 32);
    v16 = *(void **)(v15 + 352);
    if (v16)
    {
      id v17 = v16;
    }
    else
    {
      if (*(unsigned char *)(v15 + 346)) {
        +[ICURLSessionManager highPrioritySession];
      }
      else {
      id v17 = +[ICURLSessionManager defaultSession];
      }
    }
    v18 = v17;
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(void *)(v19 + 320);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __70__ICMediaRedownloadRequest__executeWithActiveICloudAccountProperties___block_invoke_53;
    v21[3] = &unk_1E5AC8C90;
    v21[4] = v19;
    id v22 = v6;
    id v23 = *(id *)(a1 + 56);
    id v5 = v6;
    [v18 enqueueDataRequest:v20 withCompletionHandler:v21];
  }
}

void __70__ICMediaRedownloadRequest__executeWithActiveICloudAccountProperties___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v20 = 138543618;
    uint64_t v21 = v8;
    __int16 v22 = 2114;
    id v23 = v5;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Request completed with error %{public}@", (uint8_t *)&v20, 0x16u);
  }

  [*(id *)(*(void *)(a1 + 32) + 328) lock];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 320);
  *(void *)(v9 + 320) = 0;

  [*(id *)(*(void *)(a1 + 32) + 328) unlock];
  __int16 v11 = [v6 parsedBodyDictionary];
  id v12 = [[ICMediaRedownloadResponse alloc] initWithResponseDictionary:v11 requestDate:*(void *)(a1 + 40) urlBag:*(void *)(a1 + 48)];
  uint64_t v13 = *(void *)(a1 + 32);
  v14 = *(void **)(v13 + 312);
  *(void *)(v13 + 312) = v12;

  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 336);
  v16 = [v6 aggregatedPerformanceMetrics];

  uint64_t v17 = +[ICURLAggregatedPerformanceMetrics aggregatedMetricsFromAggregatedMetrics:v15 addingAggregatedMetrics:v16];
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void **)(v18 + 336);
  *(void *)(v18 + 336) = v17;

  [*(id *)(a1 + 32) finishWithError:v5];
}

- (void)cancel
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__ICMediaRedownloadRequest_cancel__block_invoke;
  v3[3] = &unk_1E5ACD750;
  v3[4] = self;
  [(ICUnfairLock *)lock lockWithBlock:v3];
}

void __34__ICMediaRedownloadRequest_cancel__block_invoke(uint64_t a1)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ICMediaRedownloadRequest;
  objc_msgSendSuper2(&v4, sel_cancel);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 320))
  {
    if (*(unsigned char *)(v2 + 346)) {
      +[ICURLSessionManager highPrioritySession];
    }
    else {
    uint64_t v3 = +[ICURLSessionManager defaultSession];
    }
    [v3 cancelRequest:*(void *)(*(void *)(a1 + 32) + 320)];
  }
}

- (void)execute
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting", buf, 0xCu);
  }

  objc_super v4 = [(ICRequestContext *)self->_requestContext deviceInfo];
  char v5 = [v4 isAppleTV];

  if (v5)
  {
    [(ICMediaRedownloadRequest *)self _executeWithActiveICloudAccountProperties:0];
  }
  else
  {
    id v6 = [(ICStoreRequestContext *)self->_requestContext identityStore];
    id v10 = 0;
    id v7 = [v6 getPropertiesForActiveICloudAccountReturningError:&v10];
    id v8 = v10;

    if (v8)
    {
      uint64_t v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v12 = self;
        __int16 v13 = 2114;
        id v14 = v8;
        _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load icloud account properties. err=%{public}@", buf, 0x16u);
      }
    }
    [(ICMediaRedownloadRequest *)self _executeWithActiveICloudAccountProperties:v7];
  }
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  if (self->_usePrioritizedURLSession) {
    uint64_t v5 = 25;
  }
  else {
    uint64_t v5 = -1;
  }
  id v6 = objc_msgSend(MEMORY[0x1E4F28F08], "ic_sharedRequestOperationQueueWithQualityOfService:", v5);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__ICMediaRedownloadRequest_performRequestWithResponseHandler___block_invoke;
  v8[3] = &unk_1E5ACD8E0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(ICRequestOperation *)self performRequestOnOperationQueue:v6 withCompletionHandler:v8];
}

void __62__ICMediaRedownloadRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 312);
  *(void *)(v2 + 312) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 336);
  *(void *)(v4 + 336) = 0;
}

- (ICMediaRedownloadRequest)initWithRequestContext:(id)a3 redownloadParametersString:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CB10];
  id v7 = a3;
  id v8 = objc_msgSend(v6, "ic_queryParametersDictionaryFromString:", a4);
  id v9 = [(ICMediaRedownloadRequest *)self initWithRequestContext:v7 redownloadParameters:v8];

  return v9;
}

- (ICMediaRedownloadRequest)initWithRequestContext:(id)a3 redownloadParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(ICMediaRedownloadRequest *)self init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestContext, a3);
    objc_storeStrong((id *)&v10->_redownloadParameters, a4);
  }

  return v10;
}

- (ICMediaRedownloadRequest)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICMediaRedownloadRequest;
  uint64_t v2 = [(ICRequestOperation *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_requestURLBagKey, @"redownloadProduct");
    v3->_includeKeybagSyncData = 1;
    v3->_includeSubscriptionKeybagSyncData = 0;
    v3->_usePrioritizedURLSession = 0;
    uint64_t v4 = objc_alloc_init(ICUnfairLock);
    lock = v3->_lock;
    v3->_lock = v4;
  }
  return v3;
}

@end