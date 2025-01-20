@interface ICSuzeLeaseSession
- (ICSuzeLeaseSession)initWithConfiguration:(id)a3;
- (ICSuzeLeaseSessionConfiguration)configuration;
- (ICSuzeLeaseSessionDelegate)delegate;
- (id)_newSuzeLeaseRequestWithType:(int64_t)a3 clientData:(id)a4;
- (void)_renewLeaseTimerAction;
- (void)_updateRenewalTimer;
- (void)_updateRenewalTimerWithResponse:(id)a3;
- (void)beginAutomaticallyRefreshingLease;
- (void)dealloc;
- (void)endAutomaticallyRefreshingLease;
- (void)setDelegate:(id)a3;
- (void)startLeaseSessionWithCompletionHandler:(id)a3;
- (void)stopLeaseSessionWithCompletionHandler:(id)a3;
@end

@implementation ICSuzeLeaseSession

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_leaseSyncSession, 0);
  objc_storeStrong((id *)&self->_leaseRenewTimer, 0);
  objc_storeStrong((id *)&self->_leaseExpirationDate, 0);

  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (ICSuzeLeaseSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICSuzeLeaseSessionDelegate *)WeakRetained;
}

- (ICSuzeLeaseSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)_updateRenewalTimerWithResponse:(id)a3
{
  v4 = [a3 leaseExpirationDate];
  leaseExpirationDate = self->_leaseExpirationDate;
  self->_leaseExpirationDate = v4;

  [(ICSuzeLeaseSession *)self _updateRenewalTimer];
}

- (void)_updateRenewalTimer
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  leaseRenewTimer = self->_leaseRenewTimer;
  if (leaseRenewTimer)
  {
    dispatch_source_cancel(leaseRenewTimer);
    v4 = self->_leaseRenewTimer;
    self->_leaseRenewTimer = 0;
  }
  if (self->_automaticRefreshCount && (v5 = self->_leaseExpirationDate) != 0 && self->_isRunning)
  {
    [(NSDate *)v5 timeIntervalSinceNow];
    double v7 = fmax(v6 + -30.0, 30.0);
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      leaseExpirationDate = self->_leaseExpirationDate;
      *(_DWORD *)buf = 138543874;
      v22 = self;
      __int16 v23 = 2048;
      double v24 = v7;
      __int16 v25 = 2114;
      v26 = leaseExpirationDate;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling lease renewal in %f seconds with expiration date of: %{public}@.", buf, 0x20u);
    }

    v10 = dispatch_get_global_queue(0, 0);
    v11 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v10);

    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(v7 * 0.01 * 1000000000.0));
    objc_initWeak((id *)buf, self);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __41__ICSuzeLeaseSession__updateRenewalTimer__block_invoke;
    handler[3] = &unk_1E5ACD778;
    objc_copyWeak(&v20, (id *)buf);
    dispatch_source_set_event_handler(v11, handler);
    v13 = self->_leaseRenewTimer;
    self->_leaseRenewTimer = (OS_dispatch_source *)v11;
    v14 = v11;

    dispatch_resume(v14);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int64_t automaticRefreshCount = self->_automaticRefreshCount;
      v17 = self->_leaseExpirationDate;
      if (self->_isRunning) {
        v18 = @"YES";
      }
      else {
        v18 = @"NO";
      }
      *(_DWORD *)buf = 138544130;
      v22 = self;
      __int16 v23 = 2048;
      double v24 = *(double *)&automaticRefreshCount;
      __int16 v25 = 2114;
      v26 = v17;
      __int16 v27 = 2114;
      v28 = v18;
      _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping renewal timer scheduling with automatic refresh count: %li, leaseExpirationDate: %{public}@, isRunning: %{public}@", buf, 0x2Au);
    }
  }
}

void __41__ICSuzeLeaseSession__updateRenewalTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _renewLeaseTimerAction];
}

- (void)_renewLeaseTimerAction
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Lease renew timer fired.", buf, 0xCu);
  }

  v4 = [ICAsyncBlockOperation alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__ICSuzeLeaseSession__renewLeaseTimerAction__block_invoke;
  v6[3] = &unk_1E5ACA1A0;
  v6[4] = self;
  v5 = [(ICAsyncBlockOperation *)v4 initWithStartHandler:v6];
  [(NSOperationQueue *)self->_operationQueue addOperation:v5];
}

void __44__ICSuzeLeaseSession__renewLeaseTimerAction__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __44__ICSuzeLeaseSession__renewLeaseTimerAction__block_invoke_2;
  v21[3] = &unk_1E5ACB668;
  v21[4] = *(void *)(a1 + 32);
  id v4 = v3;
  id v22 = v4;
  v5 = (void (**)(void, void, void))MEMORY[0x1A6240BF0](v21);
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 24))
  {
    double v7 = *(void **)(v6 + 48);
    id v19 = 0;
    id v20 = 0;
    int v8 = [v7 getLeaseSyncRenewRequestData:&v20 error:&v19];
    id v9 = v20;
    id v10 = v19;
    if (v8)
    {
      v11 = (void *)[*(id *)(a1 + 32) _newSuzeLeaseRequestWithType:2 clientData:v9];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __44__ICSuzeLeaseSession__renewLeaseTimerAction__block_invoke_4;
      v17[3] = &unk_1E5AC8BC8;
      v17[4] = *(void *)(a1 + 32);
      v18 = v5;
      [v11 performWithResponseHandler:v17];
    }
    else
    {
      v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v24 = v15;
        __int16 v25 = 2114;
        id v26 = v10;
        _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Renew: Failed to generate renew request data with error: %{public}@", buf, 0x16u);
      }

      if (v10)
      {
        ((void (**)(void, void, id))v5)[2](v5, 0, v10);
      }
      else
      {
        v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7502 userInfo:0];
        ((void (**)(void, void, void *))v5)[2](v5, 0, v16);
      }
    }
  }
  else
  {
    dispatch_time_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v13;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Lease renew invalid because the session is no longer running.", buf, 0xCu);
    }

    v5[2](v5, 1, 0);
  }
}

void __44__ICSuzeLeaseSession__renewLeaseTimerAction__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(NSObject **)(v7 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__ICSuzeLeaseSession__renewLeaseTimerAction__block_invoke_3;
    block[3] = &unk_1E5ACD5C8;
    id v11 = WeakRetained;
    uint64_t v12 = v7;
    id v13 = v5;
    id v9 = WeakRetained;
    dispatch_async(v8, block);
  }
  [*(id *)(a1 + 40) finishWithError:v5];
}

void __44__ICSuzeLeaseSession__renewLeaseTimerAction__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v7 && !v9)
  {
    id v11 = [v7 clientData];
    if (!v11)
    {
      v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v22;
        _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Renew: No client data in response, treating as successful.", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_24;
    }
    uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 48);
    id v26 = 0;
    char v13 = [v12 processRenewResponseData:v11 error:&v26];
    id v14 = v26;
    uint64_t v15 = v14;
    if ((v13 & 1) == 0)
    {
      if ([v14 code] != -42564)
      {
        __int16 v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v28 = v24;
          __int16 v29 = 2114;
          v30 = v15;
          _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Renew: Failed to process response data with error: %{public}@.", buf, 0x16u);
        }

        uint64_t v25 = *(void *)(a1 + 40);
        if (!v15)
        {
          uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7502 userInfo:0];
        }
        (*(void (**)(uint64_t, void, void *))(v25 + 16))(v25, 0, v15);
        goto LABEL_23;
      }

      uint64_t v15 = 0;
    }
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v17;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Renew: Successfully processed renew response data.", buf, 0xCu);
    }

    [*(id *)(a1 + 32) _updateRenewalTimerWithResponse:v7];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_23:

    goto LABEL_24;
  }
  v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v19;
    __int16 v29 = 2114;
    v30 = v10;
    _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Renew: Response failed with error: %{public}@", buf, 0x16u);
  }

  uint64_t v20 = *(void *)(a1 + 40);
  if (!v10)
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v11);
LABEL_24:

    goto LABEL_25;
  }
  (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v10);
LABEL_25:
}

void __44__ICSuzeLeaseSession__renewLeaseTimerAction__block_invoke_3(void *a1)
{
  if (objc_opt_respondsToSelector())
  {
    v2 = (void *)a1[4];
    uint64_t v3 = a1[5];
    if (a1[6])
    {
      id v4 = (void *)a1[4];
      uint64_t v5 = a1[5];
      objc_msgSend(v4, "suzeLeaseSession:leaseRenewalDidFailWithError:", v5);
    }
    else
    {
      id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
      [v2 suzeLeaseSession:v3 leaseRenewalDidFailWithError:v6];
    }
  }
}

- (id)_newSuzeLeaseRequestWithType:(int64_t)a3 clientData:(id)a4
{
  id v6 = a4;
  id v7 = [ICSuzeLeaseRequest alloc];
  id v8 = [(ICSuzeLeaseSessionConfiguration *)self->_configuration requestContext];
  id v9 = [(ICSuzeLeaseSessionConfiguration *)self->_configuration leaseID];
  id v10 = [(ICSuzeLeaseRequest *)v7 initWithRequestContext:v8 requestType:a3 leaseID:v9 mediaType:[(ICSuzeLeaseSessionConfiguration *)self->_configuration mediaType] clientData:v6];

  [(ICSuzeLeaseRequest *)v10 setQualityOfService:[(NSOperationQueue *)self->_operationQueue qualityOfService]];
  return v10;
}

- (void)stopLeaseSessionWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping lease session...", buf, 0xCu);
  }

  id v6 = [ICAsyncBlockOperation alloc];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __60__ICSuzeLeaseSession_stopLeaseSessionWithCompletionHandler___block_invoke;
  uint64_t v12 = &unk_1E5ACB5A0;
  char v13 = self;
  id v14 = v4;
  id v7 = v4;
  id v8 = [(ICAsyncBlockOperation *)v6 initWithStartHandler:&v9];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v8, v9, v10, v11, v12, v13);
}

void __60__ICSuzeLeaseSession_stopLeaseSessionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __60__ICSuzeLeaseSession_stopLeaseSessionWithCompletionHandler___block_invoke_2;
  v22[3] = &unk_1E5ACC6E8;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v24 = v4;
  v22[4] = v5;
  id v6 = v3;
  id v23 = v6;
  id v7 = (void (**)(void, void, void))MEMORY[0x1A6240BF0](v22);
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v8 + 24))
  {
    *(unsigned char *)(v8 + 24) = 0;
    [*(id *)(a1 + 32) _updateRenewalTimer];
    id v9 = *(id *)(*(void *)(a1 + 32) + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 48);
    *(void *)(v10 + 48) = 0;

    id v21 = 0;
    int v12 = [v9 endLeaseSyncAndReturnError:&v21];
    id v13 = v21;
    id v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v15)
      {
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v16;
        _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Stop: Successfully ended lease sync.", buf, 0xCu);
      }

      v7[2](v7, 1, 0);
    }
    else
    {
      if (v15)
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v19;
        __int16 v27 = 2114;
        id v28 = v13;
        _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Stop: FairPlay failed ending lease sync with error: %{public}@.", buf, 0x16u);
      }

      if (v13)
      {
        ((void (**)(void, void, id))v7)[2](v7, 0, v13);
      }
      else
      {
        uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7502 userInfo:0];
        ((void (**)(void, void, void *))v7)[2](v7, 0, v20);
      }
    }
  }
  else
  {
    uint64_t v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v18;
      _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Lease session already stopped, returning success.", buf, 0xCu);
    }

    v7[2](v7, 1, 0);
  }
}

void __60__ICSuzeLeaseSession_stopLeaseSessionWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 48);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__ICSuzeLeaseSession_stopLeaseSessionWithCompletionHandler___block_invoke_3;
    block[3] = &unk_1E5ACD008;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
  [*(id *)(a1 + 40) finishWithError:v5];
}

uint64_t __60__ICSuzeLeaseSession_stopLeaseSessionWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)startLeaseSessionWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = self;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting lease session...", buf, 0xCu);
  }

  id v6 = [ICAsyncBlockOperation alloc];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  char v11 = __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke;
  int v12 = &unk_1E5ACB5A0;
  id v13 = self;
  id v14 = v4;
  id v7 = v4;
  uint64_t v8 = [(ICAsyncBlockOperation *)v6 initWithStartHandler:&v9];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v8, v9, v10, v11, v12, v13);
}

void __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke_2;
  v17[3] = &unk_1E5AC8B78;
  id v4 = *(void **)(a1 + 40);
  v17[4] = *(void *)(a1 + 32);
  id v19 = v4;
  id v5 = v3;
  id v18 = v5;
  id v6 = (void (**)(void, void, void, void))MEMORY[0x1A6240BF0](v17);
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 24))
  {
    uint64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v9;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Start: Lease session already started.", buf, 0xCu);
    }

    v6[2](v6, 1, 0, 0);
  }
  else
  {
    uint64_t v10 = [*(id *)(v7 + 64) requestContext];
    char v11 = [v10 identityStore];
    int v12 = [v10 identity];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke_4;
    v14[3] = &unk_1E5AC8BA0;
    v14[4] = *(void *)(a1 + 32);
    id v15 = v10;
    uint64_t v16 = v6;
    id v13 = v10;
    [v11 getPropertiesForUserIdentity:v12 completionHandler:v14];
  }
}

void __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke_3;
  uint64_t v16 = &unk_1E5ACCFB8;
  id v10 = *(id *)(a1 + 48);
  id v18 = v8;
  id v19 = v10;
  char v20 = a2;
  id v17 = v7;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, &v13);
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v11, v13, v14, v15, v16);
}

void __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke_4(id *a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 DSID];
  uint64_t v5 = [v4 unsignedLongLongValue];

  if (v5)
  {
    id v6 = [*((id *)a1[4] + 8) leaseID];
    unint64_t v7 = [*((id *)a1[4] + 8) mediaType] - 1;
    if (v7 > 6) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = dword_1A3032C7C[v7];
    }
    id v29 = 0;
    id v30 = 0;
    id v17 = +[ICFPLeaseSyncSession leaseSyncSessionWithID:v6 accountID:v5 mediaKind:v8 returningLeaseSyncRequestData:&v30 error:&v29];
    id v14 = v30;
    id v16 = v29;

    if (v17) {
      BOOL v18 = v14 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18)
    {
      id v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = a1[4];
        *(_DWORD *)buf = 138543618;
        id v34 = v20;
        __int16 v35 = 2114;
        id v36 = v16;
        _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Start: Failed to generate FairPlay sync session with error: %{public}@", buf, 0x16u);
      }

      id v21 = a1[6];
      if (v16)
      {
        (*((void (**)(id, void, void, id))v21 + 2))(v21, 0, 0, v16);
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
      (*((void (**)(id, void, void, void *))v21 + 2))(v21, 0, 0, v22);
    }
    else
    {
      uint64_t v22 = (void *)[a1[4] _newSuzeLeaseRequestWithType:1 clientData:v14];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke_5;
      v25[3] = &unk_1E5AC9BC0;
      id v23 = v17;
      id v24 = a1[4];
      id v26 = v23;
      id v27 = v24;
      id v28 = a1[6];
      [v22 performWithResponseHandler:v25];
    }
    goto LABEL_19;
  }
  uint64_t v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = a1[4];
    *(_DWORD *)buf = 138543362;
    id v34 = v10;
    _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Start: Failed to retrieve a valid DSID from the identity store.", buf, 0xCu);
  }

  uint64_t v31 = *MEMORY[0x1E4F28228];
  id v11 = NSString;
  id v12 = [a1[5] identity];
  uint64_t v13 = [v11 stringWithFormat:@"Unable to start lease session [no valid DSID for user identity] - userIdentity=%@ - properties=%@", v12, v3];
  v32 = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];

  id v15 = a1[6];
  id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7400 userInfo:v14];
  (*((void (**)(id, void, void, id))v15 + 2))(v15, 0, 0, v16);
LABEL_20:
}

void __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v7 && !v9)
  {
    id v11 = [v7 clientData];
    if ([v11 length])
    {
      id v12 = *(void **)(a1 + 32);
      id v30 = 0;
      int v13 = [v12 importLeaseSyncResponseData:v11 error:&v30];
      id v14 = v30;
      id v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      id v16 = v15;
      if (!v13)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          uint64_t v32 = v27;
          __int16 v33 = 2114;
          id v34 = v14;
          _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Start: Failed to import lease response data with error: %{public}@", buf, 0x16u);
        }

        uint64_t v28 = *(void *)(a1 + 48);
        if (v14)
        {
          (*(void (**)(uint64_t, void, id, id))(v28 + 16))(v28, 0, v8, v14);
        }
        else
        {
          id v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
          (*(void (**)(uint64_t, void, id, void *))(v28 + 16))(v28, 0, v8, v29);

          id v14 = 0;
        }
        goto LABEL_22;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v32 = v17;
        _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Start: Successfully started.", buf, 0xCu);
      }

      *(unsigned char *)(*(void *)(a1 + 40) + 24) = 1;
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 48), *(id *)(a1 + 32));
      [*(id *)(a1 + 40) _updateRenewalTimerWithResponse:v7];
      BOOL v18 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      id v23 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = *(void *)(a1 + 40);
        uint64_t v25 = [v7 responseDictionary];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v24;
        __int16 v33 = 2114;
        id v34 = v25;
        _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_ERROR, "%{public}@: Start: Client data missing from response: %{public}@", buf, 0x16u);
      }
      uint64_t v26 = *(void *)(a1 + 48);
      id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
      BOOL v18 = *(void (**)(void))(v26 + 16);
    }
    v18();
LABEL_22:

    goto LABEL_23;
  }
  id v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v32 = v20;
    __int16 v33 = 2114;
    id v34 = v10;
    _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Start: Received response error: %{public}@", buf, 0x16u);
  }

  uint64_t v21 = *(void *)(a1 + 48);
  if (v10)
  {
    (*(void (**)(void, void, id, void *))(v21 + 16))(*(void *)(a1 + 48), 0, v8, v10);
  }
  else
  {
    uint64_t v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, id, void *))(v21 + 16))(v21, 0, v8, v22);
  }
LABEL_23:
}

uint64_t __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)endAutomaticallyRefreshingLease
{
  operationQueue = self->_operationQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__ICSuzeLeaseSession_endAutomaticallyRefreshingLease__block_invoke;
  v3[3] = &unk_1E5ACD750;
  v3[4] = self;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v3];
}

void *__53__ICSuzeLeaseSession_endAutomaticallyRefreshingLease__block_invoke(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 8);
  result = *(void **)(a1 + 32);
  if (!result[1]) {
    return (void *)[result _updateRenewalTimer];
  }
  return result;
}

- (void)beginAutomaticallyRefreshingLease
{
  operationQueue = self->_operationQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__ICSuzeLeaseSession_beginAutomaticallyRefreshingLease__block_invoke;
  v3[3] = &unk_1E5ACD750;
  v3[4] = self;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v3];
}

void *__55__ICSuzeLeaseSession_beginAutomaticallyRefreshingLease__block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 8);
  result = *(void **)(a1 + 32);
  if (result[1] == 1) {
    return (void *)[result _updateRenewalTimer];
  }
  return result;
}

- (void)dealloc
{
  leaseRenewTimer = self->_leaseRenewTimer;
  if (leaseRenewTimer) {
    dispatch_source_cancel(leaseRenewTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)ICSuzeLeaseSession;
  [(ICSuzeLeaseSession *)&v4 dealloc];
}

- (ICSuzeLeaseSession)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICSuzeLeaseSession;
  uint64_t v5 = [(ICSuzeLeaseSession *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (ICSuzeLeaseSessionConfiguration *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.iTunesCloud.ICSuzeLeaseSession.calloutQueue", 0);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v8;

    id v10 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v10;

    [(NSOperationQueue *)v5->_operationQueue setName:@"com.apple.iTunesCloud.ICSuzeLeaseSession.operationQueue"];
    [(NSOperationQueue *)v5->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v5->_operationQueue setQualityOfService:25];
  }

  return v5;
}

@end