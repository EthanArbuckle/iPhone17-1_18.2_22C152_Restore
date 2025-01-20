@interface ICMusicSubscriptionLeaseSession
+ (id)_sharedOperationQueue;
- (BOOL)isAutomaticallyRefreshingLease;
- (BOOL)isDelegatedLeaseSession;
- (ICMusicSubscriptionLeaseSessionDelegate)delegate;
- (ICMusicSubscriptionLeaseStatus)leaseStatus;
- (ICStoreRequestContext)requestContext;
- (NSDate)lastPlaybackRequestDate;
- (NSDate)leaseExpirationDate;
- (id)_initWithRequestContext:(id)a3 isDelegatedLeaseSession:(BOOL)a4 delegate:(id)a5 leaseStatus:(id)a6;
- (id)_newOperationForPlaybackRequest:(id)a3 completionHandler:(id)a4;
- (id)description;
- (id)performPlaybackRequest:(id)a3 completionHandler:(id)a4;
- (void)_handlePlaybackLeaseDidEndPushNotification;
- (void)_handleRemoteServerDidBecomeLikelyReachable;
- (void)_locked_handlePendingPlaybackLeaseDidEndPushNotificationIfReady;
- (void)_locked_performAutomaticRefresh;
- (void)_locked_setLeaseStatus:(id)a3 updatedLeaseExpirationDate:(id)a4;
- (void)_locked_updateAutomaticRefreshProperties;
- (void)_receivedUserInteractionEvent;
- (void)_setLeaseStatus:(id)a3 updatedLeaseExpirationDate:(id)a4;
- (void)beginAutomaticallyRefreshingLease;
- (void)dealloc;
- (void)endAutomaticallyRefreshingLease;
- (void)reloadFairPlayKeyStatusWithCompletionHandler:(id)a3;
@end

@implementation ICMusicSubscriptionLeaseSession

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_leaseExpirationDate, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_lastLeaseAcquisitionAttempt, 0);
  objc_storeStrong((id *)&self->_lastPlaybackRequestDate, 0);
  objc_storeStrong((id *)&self->_leaseStatus, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_automaticRefreshTimerSource, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (ICMusicSubscriptionLeaseSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICMusicSubscriptionLeaseSessionDelegate *)WeakRetained;
}

- (NSDate)leaseExpirationDate
{
  return self->_leaseExpirationDate;
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (BOOL)isDelegatedLeaseSession
{
  return self->_delegatedLeaseSession;
}

- (void)_locked_handlePendingPlaybackLeaseDidEndPushNotificationIfReady
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_hasPendingLeaseDidEndPushNotification)
  {
    if (self->_automaticRefreshCount)
    {
      if ([(ICMusicSubscriptionLeaseStatus *)self->_leaseStatus hasInflightLeaseAcquisition])
      {
        v3 = (ICMusicSubscriptionLeasePlaybackRequest *)os_log_create("com.apple.amp.iTunesCloud", "Subscription");
        if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v10 = self;
          v4 = "[Lease] - [%{public}@] - PlaybackLeaseDidEndPushNotification - Deferred until the in-flight lease acquisi"
               "tion completed [hasInflightLeaseAcquisition:YES]";
LABEL_16:
          _os_log_impl(&dword_1A2D01000, &v3->super, OS_LOG_TYPE_DEFAULT, v4, buf, 0xCu);
        }
      }
      else
      {
        self->_hasPendingLeaseDidEndPushNotification = 0;
        if ([(ICMusicSubscriptionLeaseStatus *)self->_leaseStatus hasOnlinePlaybackKeys])
        {
          v3 = [[ICMusicSubscriptionLeasePlaybackRequest alloc] initWithRequestContext:self->_requestContext];
          [(ICMusicSubscriptionLeasePlaybackRequest *)v3 setShouldPreventLeaseAcquisition:1];
          [(ICMusicSubscriptionLeasePlaybackRequest *)v3 setTriggeredByLeasePrevention:1];
          v5 = [(id)objc_opt_class() _sharedOperationQueue];
          v8[0] = MEMORY[0x1E4F143A8];
          v8[1] = 3221225472;
          v8[2] = __98__ICMusicSubscriptionLeaseSession__locked_handlePendingPlaybackLeaseDidEndPushNotificationIfReady__block_invoke;
          v8[3] = &unk_1E5ACA558;
          v8[4] = self;
          id v6 = [(ICMusicSubscriptionLeaseSession *)self _newOperationForPlaybackRequest:v3 completionHandler:v8];
          [v5 addOperation:v6];
          v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v10 = self;
            _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - PlaybackLeaseDidEndPushNotification - Handled", buf, 0xCu);
          }
        }
        else
        {
          v3 = (ICMusicSubscriptionLeasePlaybackRequest *)os_log_create("com.apple.amp.iTunesCloud", "Subscription");
          if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v10 = self;
            v4 = "[Lease] - [%{public}@] - PlaybackLeaseDidEndPushNotification - Dropped [hasOnlinePlaybackKeys:NO]";
            goto LABEL_16;
          }
        }
      }
    }
    else
    {
      v3 = (ICMusicSubscriptionLeasePlaybackRequest *)os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v10 = self;
        v4 = "[Lease] - [%{public}@] - PlaybackLeaseDidEndPushNotification - Deferred until refresh timer gets activated "
             "[_automaticRefreshCount:0]";
        goto LABEL_16;
      }
    }
  }
  else
  {
    v3 = (ICMusicSubscriptionLeasePlaybackRequest *)os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = self;
      v4 = "[Lease] - [%{public}@] - PlaybackLeaseDidEndPushNotification - Dropped [_hasPendingLeaseDidEndPushNotification:NO]";
      goto LABEL_16;
    }
  }
}

void __98__ICMusicSubscriptionLeaseSession__locked_handlePendingPlaybackLeaseDidEndPushNotificationIfReady__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      v9 = objc_msgSend(v5, "msv_description");
      int v11 = 138543618;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "[Lease] - [%{public}@] - PlaybackLeaseDidEndPushNotification - Completed error=%{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138543362;
    uint64_t v12 = v10;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - PlaybackLeaseDidEndPushNotification - Completed", (uint8_t *)&v11, 0xCu);
  }
}

- (void)_locked_updateAutomaticRefreshProperties
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  automaticRefreshTimerSource = self->_automaticRefreshTimerSource;
  if (automaticRefreshTimerSource)
  {
    dispatch_source_cancel((dispatch_source_t)self->_automaticRefreshTimerSource);
    v4 = self->_automaticRefreshTimerSource;
    self->_automaticRefreshTimerSource = 0;
  }
  if (self->_automaticRefreshCount >= 1
    && [(ICMusicSubscriptionLeaseStatus *)self->_leaseStatus hasOnlinePlaybackKeys]
    && (leaseExpirationDate = self->_leaseExpirationDate) != 0)
  {
    [(NSDate *)leaseExpirationDate timeIntervalSinceNow];
    double v7 = v6;
    uint64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = self;
      __int16 v24 = 2048;
      double v25 = v7;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - Automatic lease refresh timer enabled with time left: %f.", buf, 0x16u);
    }

    if (v7 < 1.0)
    {
      if (self->_lastLeaseAcquisitionAttempt)
      {
        v9 = [MEMORY[0x1E4F1C9C8] now];
        [v9 timeIntervalSinceDate:self->_lastLeaseAcquisitionAttempt];
        double v11 = v10;

        if (v11 < 120.0)
        {
          double v7 = 120.0 - v11;
          uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v23 = self;
            __int16 v24 = 2048;
            double v25 = 120.0 - v11;
            _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - Delaying lease refresh for %fs due to recent attempts", buf, 0x16u);
          }
        }
      }
    }
    if (v7 >= 1.0)
    {
      if (!self->_isPerformingAutomaticRefresh)
      {
        v14 = dispatch_get_global_queue(0, 0);
        uint64_t v15 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v14);
        v16 = self->_automaticRefreshTimerSource;
        self->_automaticRefreshTimerSource = v15;

        v17 = self->_automaticRefreshTimerSource;
        dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
        dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
        objc_initWeak((id *)buf, self);
        v19 = self->_automaticRefreshTimerSource;
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __75__ICMusicSubscriptionLeaseSession__locked_updateAutomaticRefreshProperties__block_invoke;
        handler[3] = &unk_1E5ACD778;
        objc_copyWeak(&v21, (id *)buf);
        dispatch_source_set_event_handler(v19, handler);
        dispatch_resume((dispatch_object_t)self->_automaticRefreshTimerSource);
        objc_destroyWeak(&v21);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      [(ICMusicSubscriptionLeaseSession *)self _locked_performAutomaticRefresh];
    }
  }
  else if (automaticRefreshTimerSource)
  {
    __int16 v13 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = self;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - Automatic lease refresh timer disabled.", buf, 0xCu);
    }
  }
}

void __75__ICMusicSubscriptionLeaseSession__locked_updateAutomaticRefreshProperties__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[1] lock];
    objc_msgSend(v2, "_locked_updateAutomaticRefreshProperties");
    [v2[1] unlock];
    id WeakRetained = v2;
  }
}

- (void)_locked_setLeaseStatus:(id)a3 updatedLeaseExpirationDate:(id)a4
{
  double v7 = (ICMusicSubscriptionLeaseStatus *)a3;
  id v8 = a4;
  leaseStatus = self->_leaseStatus;
  if (leaseStatus == v7 || [(ICMusicSubscriptionLeaseStatus *)leaseStatus isEqual:v7])
  {
    int v10 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_leaseStatus, a3);
    int v10 = 1;
  }
  if ([(ICMusicSubscriptionLeaseStatus *)self->_leaseStatus hasOnlinePlaybackKeys])
  {
    if (!v8) {
      goto LABEL_10;
    }
    double v11 = (NSDate *)[v8 copy];
    leaseExpirationDate = self->_leaseExpirationDate;
    self->_leaseExpirationDate = v11;
  }
  else
  {
    leaseExpirationDate = self->_leaseExpirationDate;
    self->_leaseExpirationDate = 0;
  }

LABEL_10:
  [(ICMusicSubscriptionLeaseSession *)self _locked_updateAutomaticRefreshProperties];
  if (v10)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__ICMusicSubscriptionLeaseSession__locked_setLeaseStatus_updatedLeaseExpirationDate___block_invoke;
    block[3] = &unk_1E5ACD750;
    block[4] = self;
    dispatch_async(calloutQueue, block);
  }
}

void __85__ICMusicSubscriptionLeaseSession__locked_setLeaseStatus_updatedLeaseExpirationDate___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:ICMusicSubscriptionLeaseSessionLeaseStatusDidChangeNotification object:*(void *)(a1 + 32)];
}

- (void)_locked_performAutomaticRefresh
{
  if (!self->_isPerformingAutomaticRefresh)
  {
    automaticRefreshTimerSource = self->_automaticRefreshTimerSource;
    if (automaticRefreshTimerSource)
    {
      dispatch_source_cancel(automaticRefreshTimerSource);
      v4 = self->_automaticRefreshTimerSource;
      self->_automaticRefreshTimerSource = 0;
    }
    objc_initWeak(&location, self);
    self->_isPerformingAutomaticRefresh = 1;
    id v5 = [ICMusicSubscriptionLeasePlaybackRequest alloc];
    double v6 = [(ICMusicSubscriptionLeaseSession *)self requestContext];
    double v7 = [(ICMusicSubscriptionLeasePlaybackRequest *)v5 initWithRequestContext:v6];

    [(ICMusicSubscriptionLeasePlaybackRequest *)v7 setShouldPreventLeaseAcquisition:1];
    id v8 = [(id)objc_opt_class() _sharedOperationQueue];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __66__ICMusicSubscriptionLeaseSession__locked_performAutomaticRefresh__block_invoke;
    __int16 v13 = &unk_1E5ACA530;
    objc_copyWeak(&v14, &location);
    id v9 = [(ICMusicSubscriptionLeaseSession *)self _newOperationForPlaybackRequest:v7 completionHandler:&v10];
    objc_msgSend(v8, "addOperation:", v9, v10, v11, v12, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __66__ICMusicSubscriptionLeaseSession__locked_performAutomaticRefresh__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[1] lock];
    *((unsigned char *)v2 + 40) = 0;
    objc_msgSend(v2, "_locked_updateAutomaticRefreshProperties");
    [v2[1] unlock];
    id WeakRetained = v2;
  }
}

- (id)_newOperationForPlaybackRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  double v7 = (void *)[a3 copy];
  id v8 = [ICAsyncBlockOperation alloc];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E5ACC0B0;
  id v14 = v7;
  uint64_t v15 = self;
  id v16 = v6;
  id v9 = v6;
  id v10 = v7;
  uint64_t v11 = [(ICAsyncBlockOperation *)v8 initWithStartHandler:v13];

  return v11;
}

void __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke(id *a1, void *a2)
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isCancelled])
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = a1[4];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "[AL] - ICMusicSubscriptionPlaybackRequestOperation canceled - request: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v60 = *MEMORY[0x1E4F28228];
    v61[0] = @"Playback request operation was canceled";
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
    id v8 = [v6 errorWithDomain:@"ICError" code:-7004 userInfo:v7];

    id v9 = *((void *)a1[5] + 4);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_29;
    block[3] = &unk_1E5ACD2F0;
    id v10 = a1[6];
    id v55 = v8;
    id v56 = v10;
    id v11 = v8;
    dispatch_async(v9, block);
    [v3 finishWithError:v11];

    uint64_t v12 = &v56;
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    id v14 = [MEMORY[0x1E4F29060] currentThread];
    objc_msgSend(v13, "setQualityOfService:", objc_msgSend(v14, "qualityOfService"));

    [v13 setName:@"com.apple.iTunesCloud.ICMusicSubscriptionLeaseSession.innerOperationQueue"];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_2;
    v50[3] = &unk_1E5ACA490;
    id v15 = a1[6];
    id v16 = a1[5];
    id v53 = v15;
    v50[4] = v16;
    id v17 = v3;
    id v51 = v17;
    id v11 = v13;
    id v52 = v11;
    dispatch_time_t v18 = (void *)MEMORY[0x1A6240BF0](v50);
    uint64_t v19 = [MEMORY[0x1E4F1C9C8] now];
    v20 = (void *)*((void *)a1[5] + 11);
    *((void *)a1[5] + 11) = v19;

    id v21 = objc_alloc_init(ICMusicSubscriptionPlaybackRequestOperation);
    v22 = [a1[4] assetSourceStorefrontID];
    [(ICMusicSubscriptionPlaybackRequestOperation *)v21 setAssetSourceStorefrontID:v22];

    -[ICMusicSubscriptionPlaybackRequestOperation setStoreCloudID:](v21, "setStoreCloudID:", [a1[4] storeCloudID]);
    -[ICMusicSubscriptionPlaybackRequestOperation setStoreSubscriptionAdamID:](v21, "setStoreSubscriptionAdamID:", [a1[4] storeSubscriptionAdamID]);
    -[ICMusicSubscriptionPlaybackRequestOperation setStorePurchasedAdamID:](v21, "setStorePurchasedAdamID:", [a1[4] storePurchasedAdamID]);
    v23 = [a1[4] cloudUniversalLibraryID];
    [(ICMusicSubscriptionPlaybackRequestOperation *)v21 setCloudUniversalLibraryID:v23];

    [(ICMusicSubscriptionPlaybackRequestOperation *)v21 setDelegatedPlayback:*((unsigned __int8 *)a1[5] + 96)];
    -[ICMusicSubscriptionPlaybackRequestOperation setFollowUp:](v21, "setFollowUp:", [a1[4] isFollowUp]);
    __int16 v24 = [a1[4] requestContext];
    [(ICMusicSubscriptionPlaybackRequestOperation *)v21 setRequestContext:v24];

    objc_initWeak(&location, a1[5]);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v58 = 0x2020000000;
    uint64_t v59 = 0;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_4;
    v44[3] = &unk_1E5ACA4B8;
    id v45 = a1[4];
    objc_copyWeak(&v48, &location);
    id v46 = a1[5];
    p_long long buf = &buf;
    [(ICMusicSubscriptionPlaybackRequestOperation *)v21 setWillBeginExecutionHandler:v44];
    objc_initWeak(&from, v21);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_36;
    v35[3] = &unk_1E5ACA508;
    id v25 = v17;
    id v36 = v25;
    objc_copyWeak(&v41, &from);
    objc_copyWeak(&v42, &location);
    id v26 = a1[4];
    v40 = &buf;
    id v27 = a1[5];
    id v37 = v26;
    id v38 = v27;
    id v28 = v18;
    id v39 = v28;
    [(ICMusicSubscriptionPlaybackRequestOperation *)v21 setResponseHandler:v35];
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_40;
    v33 = &unk_1E5ACD750;
    v29 = v21;
    v34 = v29;
    [v25 setCancellationHandler:&v30];
    objc_msgSend(v11, "addOperation:", v29, v30, v31, v32, v33);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&v41);

    objc_destroyWeak(&from);
    objc_destroyWeak(&v48);

    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(&location);

    uint64_t v12 = &v53;
  }
}

uint64_t __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 56);
  if (v10)
  {
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_3;
    id v15 = &unk_1E5ACD2A0;
    id v19 = v10;
    id v16 = v7;
    id v17 = v8;
    id v18 = v9;
    dispatch_async(v11, &v12);
  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v9, v12, v13, v14, v15);
}

void __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([*(id *)(a1 + 32) shouldPreventLeaseAcquisition] & 1) != 0
    || (id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56))) == 0)
  {
    uint64_t v7 = 1;
  }
  else
  {
    id v5 = WeakRetained;
    [WeakRetained[1] lock];
    int v6 = [v5[6] hasPendingLeaseAcquisition];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5[7];
    [v5[1] unlock];

    if (v6) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
  }
  [v3 setRequestType:v7];
  id v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = a1 + 32;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(v11 + 8);
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 2048;
    uint64_t v17 = [v3 requestType];
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - _newOperationForPlaybackRequest - Will start playback request operation - Request: %{public}@ - Type: %ld", (uint8_t *)&v12, 0x20u);
  }
}

void __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_36(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [*(id *)(a1 + 32) setCancellationHandler:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v14 = [WeakRetained requestType];

  id v15 = objc_loadWeakRetained((id *)(a1 + 80));
  __int16 v16 = [v15 delegate];
  if (v16)
  {
    uint64_t v23 = *(void *)(a1 + 40);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_2_37;
    v24[3] = &unk_1E5ACA4E0;
    id v25 = v15;
    id v17 = v10;
    id v18 = v9;
    uint64_t v19 = *(void *)(a1 + 64);
    id v26 = v18;
    uint64_t v31 = v19;
    uint64_t v32 = v14;
    int8x16_t v22 = *(int8x16_t *)(a1 + 40);
    id v20 = (id)v22.i64[0];
    int8x16_t v27 = vextq_s8(v22, v22, 8uLL);
    id v30 = *(id *)(a1 + 56);
    id v28 = v11;
    id v29 = v12;
    id v21 = v18;
    id v10 = v17;
    [v16 musicLeaseSession:v25 didFinishPlaybackRequest:v23 withPlaybackResponse:v21 responseError:v29 updatedFairPlayKeyStatusList:v17 completionHandler:v24];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_40(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_2_37(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = (void *)[a2 copy];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    [*(id *)(v7 + 8) lock];
    if (*(void *)(a1 + 40))
    {
      if (*(void *)(a1 + 96) == 2)
      {
        uint64_t v8 = *(void *)(a1 + 32);
        if (*(void *)(v8 + 56) == *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
        {
          if ([*(id *)(v8 + 48) hasPendingLeaseAcquisition]) {
            [v6 setHasPendingLeaseAcquisition:0];
          }
        }
      }
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 64);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    if (v9 <= v10) {
      [v6 setHasInflightLeaseAcquisition:0];
    }
    id v11 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void *)(a1 + 96);
      int v15 = 138544130;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      uint64_t v18 = v13;
      __int16 v19 = 2048;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      int8x16_t v22 = v6;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - _newOperationForPlaybackRequest - Completed playback request operation - Request: %{public}@ - Type: %ld - status: %{public}@", (uint8_t *)&v15, 0x2Au);
    }

    objc_msgSend(*(id *)(a1 + 32), "_locked_setLeaseStatus:updatedLeaseExpirationDate:", v6, v5);
    if (v9 <= v10) {
      objc_msgSend(*(id *)(a1 + 32), "_locked_handlePendingPlaybackLeaseDidEndPushNotificationIfReady");
    }
    [*(id *)(*(void *)(a1 + 32) + 8) unlock];
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

uint64_t __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)_setLeaseStatus:(id)a3 updatedLeaseExpirationDate:(id)a4
{
  id v6 = a4;
  id v7 = (id)[a3 copy];
  [(NSRecursiveLock *)self->_lock lock];
  [(ICMusicSubscriptionLeaseSession *)self _locked_setLeaseStatus:v7 updatedLeaseExpirationDate:v6];

  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)_receivedUserInteractionEvent
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_lock lock];
  leaseStatus = self->_leaseStatus;
  ++self->_pendingLeaseAcquisitionRevisionID;
  if (![(ICMusicSubscriptionLeaseStatus *)leaseStatus hasPendingLeaseAcquisition])
  {
    v4 = (void *)[(ICMusicSubscriptionLeaseStatus *)self->_leaseStatus copy];
    [v4 setHasPendingLeaseAcquisition:1];
    [(ICMusicSubscriptionLeaseSession *)self _locked_setLeaseStatus:v4 updatedLeaseExpirationDate:0];
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543618;
      id v7 = self;
      __int16 v8 = 2114;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - _receivedUserInteractionEvent - leaseStatus: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)_handleRemoteServerDidBecomeLikelyReachable
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(ICMusicSubscriptionLeaseSession *)self isAutomaticallyRefreshingLease]) {
    return;
  }
  id v3 = [(ICMusicSubscriptionLeaseSession *)self leaseStatus];
  v4 = +[ICDeviceInfo currentDeviceInfo];
  if (([v4 isWatch] & 1) == 0)
  {

    goto LABEL_6;
  }
  id v5 = [MEMORY[0x1E4F28F80] processInfo];
  int v6 = [v5 isLowPowerModeEnabled];

  if (!v6)
  {
LABEL_6:
    BOOL v7 = 1;
    goto LABEL_7;
  }
  BOOL v7 = [v3 leaseState] == 0;
LABEL_7:
  __int16 v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = "skipping";
    if (v7) {
      uint64_t v9 = "performing";
    }
    int v13 = 138543618;
    uint64_t v14 = self;
    __int16 v15 = 2082;
    uint64_t v16 = v9;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - _handleRemoteServerDidBecomeLikelyReachable: %{public}s renewal", (uint8_t *)&v13, 0x16u);
  }

  if (v7)
  {
    uint64_t v10 = [[ICMusicSubscriptionLeasePlaybackRequest alloc] initWithRequestContext:self->_requestContext];
    id v11 = [(id)objc_opt_class() _sharedOperationQueue];
    id v12 = [(ICMusicSubscriptionLeaseSession *)self _newOperationForPlaybackRequest:v10 completionHandler:&__block_literal_global_26106];
    [v11 addOperation:v12];
  }
}

- (void)_handlePlaybackLeaseDidEndPushNotification
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_lock lock];
  self->_BOOL hasPendingLeaseDidEndPushNotification = 1;
  [(NSDate *)self->_leaseExpirationDate timeIntervalSinceNow];
  if (v3 >= 0.0)
  {
    v4 = [MEMORY[0x1E4F1C9C8] date];
    leaseExpirationDate = self->_leaseExpirationDate;
    self->_leaseExpirationDate = v4;
  }
  int v6 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL hasPendingLeaseDidEndPushNotification = self->_hasPendingLeaseDidEndPushNotification;
    int v8 = 138543618;
    uint64_t v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = hasPendingLeaseDidEndPushNotification;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - _handlePlaybackLeaseDidEndPushNotification - _hasPendingLeaseDidEndPushNotification: %{BOOL}u", (uint8_t *)&v8, 0x12u);
  }

  [(ICMusicSubscriptionLeaseSession *)self _locked_handlePendingPlaybackLeaseDidEndPushNotificationIfReady];
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)reloadFairPlayKeyStatusWithCompletionHandler:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained musicLeaseSession:self requestsFairPlayKeyStatusUpdateWithCompletion:v5];
}

- (id)performPlaybackRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  [(NSRecursiveLock *)self->_lock lock];
  if ([v6 shouldRequireLeaseAcquisition]) {
    int v9 = ![(ICMusicSubscriptionLeaseStatus *)self->_leaseStatus hasPendingLeaseAcquisition];
  }
  else {
    int v9 = 0;
  }
  if ([v6 shouldPreventLeaseAcquisition])
  {
    [(NSRecursiveLock *)self->_lock unlock];
    if (!v9)
    {
LABEL_13:
      uint64_t v14 = [(id)objc_opt_class() _sharedOperationQueue];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __76__ICMusicSubscriptionLeaseSession_performPlaybackRequest_completionHandler___block_invoke;
      v25[3] = &unk_1E5ACA448;
      id v15 = v8;
      id v26 = v15;
      id v27 = v7;
      id v16 = [(ICMusicSubscriptionLeaseSession *)self _newOperationForPlaybackRequest:v6 completionHandler:v25];
      [v15 setCancellable:1];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __76__ICMusicSubscriptionLeaseSession_performPlaybackRequest_completionHandler___block_invoke_2;
      v23[3] = &unk_1E5ACD750;
      id v17 = v16;
      id v24 = v17;
      [v15 setCancellationHandler:v23];
      [v14 addOperation:v17];
      uint64_t v18 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [v14 operationCount];
        *(_DWORD *)long long buf = 138543874;
        id v29 = self;
        __int16 v30 = 2114;
        id v31 = v17;
        __int16 v32 = 2048;
        uint64_t v33 = v19;
        _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - performPlaybackRequest - enqueued operation: %{public}@ - operation count: %ld", buf, 0x20u);
      }

      [(NSRecursiveLock *)self->_lock lock];
      uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
      lastPlaybackRequestDate = self->_lastPlaybackRequestDate;
      self->_lastPlaybackRequestDate = v20;

      [(NSRecursiveLock *)self->_lock unlock];
      goto LABEL_16;
    }
  }
  else
  {
    BOOL v10 = [(ICMusicSubscriptionLeaseStatus *)self->_leaseStatus hasPendingLeaseAcquisition];
    [(NSRecursiveLock *)self->_lock unlock];
    if ((v9 & 1) == 0)
    {
      if (v10)
      {
        leaseStatus = self->_leaseStatus;
        self->_startedLeaseAcquisitionRevisionID = self->_pendingLeaseAcquisitionRevisionID;
        if (![(ICMusicSubscriptionLeaseStatus *)leaseStatus hasInflightLeaseAcquisition])
        {
          int v13 = (void *)[(ICMusicSubscriptionLeaseStatus *)self->_leaseStatus copy];
          [v13 setHasInflightLeaseAcquisition:1];
          [(NSRecursiveLock *)self->_lock lock];
          [(ICMusicSubscriptionLeaseSession *)self _locked_setLeaseStatus:v13 updatedLeaseExpirationDate:0];
          [(NSRecursiveLock *)self->_lock unlock];
        }
      }
      goto LABEL_13;
    }
  }
  [v8 setCompletedUnitCount:1];
  if (v7)
  {
    BOOL v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7600 userInfo:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v11);
  }
LABEL_16:

  return v8;
}

void __76__ICMusicSubscriptionLeaseSession_performPlaybackRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  [v7 setCompletedUnitCount:1];
  [*(id *)(a1 + 32) setCancellationHandler:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __76__ICMusicSubscriptionLeaseSession_performPlaybackRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (NSDate)lastPlaybackRequestDate
{
  [(NSRecursiveLock *)self->_lock lock];
  double v3 = self->_lastPlaybackRequestDate;
  [(NSRecursiveLock *)self->_lock unlock];

  return v3;
}

- (BOOL)isAutomaticallyRefreshingLease
{
  id v2 = self;
  [(NSRecursiveLock *)self->_lock lock];
  lock = v2->_lock;
  LOBYTE(v2) = v2->_automaticRefreshCount > 0;
  [(NSRecursiveLock *)lock unlock];
  return (char)v2;
}

- (void)endAutomaticallyRefreshingLease
{
  [(NSRecursiveLock *)self->_lock lock];
  int64_t v3 = self->_automaticRefreshCount - 1;
  self->_automaticRefreshCount = v3;
  if (!v3) {
    [(ICMusicSubscriptionLeaseSession *)self _locked_updateAutomaticRefreshProperties];
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)beginAutomaticallyRefreshingLease
{
  [(NSRecursiveLock *)self->_lock lock];
  int64_t automaticRefreshCount = self->_automaticRefreshCount;
  self->_int64_t automaticRefreshCount = automaticRefreshCount + 1;
  if (!automaticRefreshCount)
  {
    [(ICMusicSubscriptionLeaseSession *)self _locked_updateAutomaticRefreshProperties];
    [(ICMusicSubscriptionLeaseSession *)self _locked_handlePendingPlaybackLeaseDidEndPushNotificationIfReady];
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (ICMusicSubscriptionLeaseStatus)leaseStatus
{
  [(NSRecursiveLock *)self->_lock lock];
  int64_t v3 = self->_leaseStatus;
  [(NSRecursiveLock *)self->_lock unlock];

  return v3;
}

- (id)description
{
  int64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  requestContext = self->_requestContext;
  id v7 = [(ICMusicSubscriptionLeaseSession *)self leaseStatus];
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p requestContext: %@; leaseStatus: %@>",
    v5,
    self,
    requestContext,
  id v8 = v7);

  return v8;
}

- (void)dealloc
{
  [(NSRecursiveLock *)self->_lock lock];
  automaticRefreshTimerSource = self->_automaticRefreshTimerSource;
  if (automaticRefreshTimerSource)
  {
    dispatch_source_cancel(automaticRefreshTimerSource);
    v4 = self->_automaticRefreshTimerSource;
    self->_automaticRefreshTimerSource = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];
  v5.receiver = self;
  v5.super_class = (Class)ICMusicSubscriptionLeaseSession;
  [(ICMusicSubscriptionLeaseSession *)&v5 dealloc];
}

- (id)_initWithRequestContext:(id)a3 isDelegatedLeaseSession:(BOOL)a4 delegate:(id)a5 leaseStatus:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ICMusicSubscriptionLeaseSession;
  int v13 = [(ICMusicSubscriptionLeaseSession *)&v21 init];
  if (v13)
  {
    uint64_t v14 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    lock = v13->_lock;
    v13->_lock = v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionLease.calloutQueue", MEMORY[0x1E4F14430]);
    calloutQueue = v13->_calloutQueue;
    v13->_calloutQueue = (OS_dispatch_queue *)v16;

    v13->_delegatedLeaseSession = a4;
    uint64_t v18 = [v10 copy];
    requestContext = v13->_requestContext;
    v13->_requestContext = (ICStoreRequestContext *)v18;

    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_storeStrong((id *)&v13->_leaseStatus, a6);
  }

  return v13;
}

+ (id)_sharedOperationQueue
{
  if (_sharedOperationQueue_sOnceToken != -1) {
    dispatch_once(&_sharedOperationQueue_sOnceToken, &__block_literal_global_19_26123);
  }
  id v2 = (void *)_sharedOperationQueue_sOperationQueue;

  return v2;
}

uint64_t __56__ICMusicSubscriptionLeaseSession__sharedOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)_sharedOperationQueue_sOperationQueue;
  _sharedOperationQueue_sOperationQueue = (uint64_t)v0;

  [(id)_sharedOperationQueue_sOperationQueue setMaxConcurrentOperationCount:1];
  [(id)_sharedOperationQueue_sOperationQueue setName:@"com.apple.iTunesCloud.ICMusicSubscriptionLeaseSession.operationQueue"];
  id v2 = (void *)_sharedOperationQueue_sOperationQueue;

  return [v2 setQualityOfService:25];
}

@end