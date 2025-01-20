@interface TVPSecureKeyDeliveryCoordinator
+ (BOOL)isSecureKeyDeliveryRequest:(id)a3;
+ (void)initialize;
- (BOOL)certFetchInProgress;
- (NSData)certificateData;
- (NSMutableSet)requestsAwaitingCertFetch;
- (TVPPlaybackReportingEventCollection)eventCollection;
- (TVPSecureKeyDeliveryCoordinator)init;
- (TVPSecureKeyDeliveryCoordinator)initWithSecureKeyLoader:(id)a3;
- (TVPSecureKeyDeliveryCoordinatorDelegate)delegate;
- (TVPSecureKeyLoader)secureKeyLoader;
- (void)_finishLoadingWithError:(id)a3 forRequest:(id)a4;
- (void)_loadSecureKeyRequest:(id)a3 sendStartReportingEvent:(BOOL)a4;
- (void)loadSecureKeyRequest:(id)a3;
- (void)secureKeyLoader:(id)a3 didFailWithError:(id)a4 forRequest:(id)a5;
- (void)secureKeyLoader:(id)a3 didLoadCertificateData:(id)a4 forRequest:(id)a5;
- (void)secureKeyLoader:(id)a3 didLoadContentIdentifierData:(id)a4 forRequest:(id)a5;
- (void)secureKeyLoader:(id)a3 didLoadKeyResponseData:(id)a4 renewalDate:(id)a5 forRequest:(id)a6;
- (void)secureKeyLoader:(id)a3 didReceiveUpdatedRentalExpirationDate:(id)a4;
- (void)secureKeyLoader:(id)a3 didReceiveUpdatedRentalExpirationDate:(id)a4 playbackStartDate:(id)a5;
- (void)secureKeyLoader:(id)a3 didReceiveUpdatedRentalPlaybackStartDate:(id)a4;
- (void)sendStopRequest;
- (void)setCertFetchInProgress:(BOOL)a3;
- (void)setCertificateData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEventCollection:(id)a3;
- (void)setRequestsAwaitingCertFetch:(id)a3;
- (void)setSecureKeyLoader:(id)a3;
@end

@implementation TVPSecureKeyDeliveryCoordinator

+ (void)initialize
{
  if (initialize_onceToken_7 != -1) {
    dispatch_once(&initialize_onceToken_7, &__block_literal_global_16);
  }
}

uint64_t __45__TVPSecureKeyDeliveryCoordinator_initialize__block_invoke()
{
  sDeliveryCoordinatorLogObject = (uint64_t)os_log_create("com.apple.AppleTV.playback", "SecureKeyDelivery");
  return MEMORY[0x270F9A758]();
}

+ (BOOL)isSecureKeyDeliveryRequest:(id)a3
{
  v3 = [a3 URL];
  v4 = [v3 scheme];

  LOBYTE(v3) = [v4 isEqualToString:@"skd"];
  return (char)v3;
}

- (TVPSecureKeyDeliveryCoordinator)initWithSecureKeyLoader:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Argument passed to -initWithSecureKeyLoader: must be non-nil." userInfo:0];
    objc_exception_throw(v11);
  }
  v6 = v5;
  v12.receiver = self;
  v12.super_class = (Class)TVPSecureKeyDeliveryCoordinator;
  v7 = [(TVPSecureKeyDeliveryCoordinator *)&v12 init];
  if (v7)
  {
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    requestsAwaitingCertFetch = v7->_requestsAwaitingCertFetch;
    v7->_requestsAwaitingCertFetch = v8;

    objc_storeStrong((id *)&v7->_secureKeyLoader, a3);
    [(TVPSecureKeyLoader *)v7->_secureKeyLoader setDelegate:v7];
  }

  return v7;
}

- (void)loadSecureKeyRequest:(id)a3
{
  id v6 = a3;
  v4 = [(TVPSecureKeyDeliveryCoordinator *)self eventCollection];
  [v6 setEventCollection:v4];

  id v5 = [MEMORY[0x263EFF910] date];
  [v6 setRequestStartDate:v5];

  [(TVPSecureKeyDeliveryCoordinator *)self _loadSecureKeyRequest:v6 sendStartReportingEvent:1];
}

- (void)sendStopRequest
{
  id v2 = [(TVPSecureKeyDeliveryCoordinator *)self secureKeyLoader];
  [v2 sendStopRequest];
}

- (void)setEventCollection:(id)a3
{
  objc_storeStrong((id *)&self->_eventCollection, a3);
  id v5 = a3;
  id v6 = [(TVPSecureKeyDeliveryCoordinator *)self secureKeyLoader];
  [v6 setEventCollection:v5];
}

- (void)secureKeyLoader:(id)a3 didLoadCertificateData:(id)a4 forRequest:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v8 = a4;
  id v9 = a5;
  [(TVPSecureKeyDeliveryCoordinator *)self setCertFetchInProgress:0];
  v10 = (void *)sDeliveryCoordinatorLogObject;
  if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    *(_DWORD *)buf = 134218240;
    uint64_t v39 = [v9 requestID];
    __int16 v40 = 2048;
    uint64_t v41 = [v8 length];
    _os_log_impl(&dword_236FC5000, v11, OS_LOG_TYPE_DEFAULT, "Cert fetch complete for request %lu.  Cert length is %lu", buf, 0x16u);
  }
  v30 = v9;
  if ([v8 length]) {
    [(TVPSecureKeyDeliveryCoordinator *)self setCertificateData:v8];
  }
  objc_super v12 = [(TVPSecureKeyDeliveryCoordinator *)self requestsAwaitingCertFetch];
  v13 = (void *)[v12 copy];

  v14 = [(TVPSecureKeyDeliveryCoordinator *)self requestsAwaitingCertFetch];
  [v14 removeAllObjects];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v13;
  uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v20 = [(TVPSecureKeyDeliveryCoordinator *)self eventCollection];
        v21 = TVPPlaybackReportingEventFPSCertFetch;
        v22 = NSString;
        v23 = [v19 reportingID];
        v24 = [v22 stringWithFormat:@"%@%@", v21, v23];
        [v20 addEndEventWithName:v21 identifier:v24];

        v25 = (void *)sDeliveryCoordinatorLogObject;
        if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT))
        {
          v26 = v25;
          uint64_t v27 = [v19 requestID];
          *(_DWORD *)buf = 134217984;
          uint64_t v39 = v27;
          _os_log_impl(&dword_236FC5000, v26, OS_LOG_TYPE_DEFAULT, "After cert fetch completion, continuing request %lu", buf, 0xCu);
        }
        if (![v8 length])
        {
          v29 = TVPSKDErrorWithCode(-345003);
          [(TVPSecureKeyDeliveryCoordinator *)self secureKeyLoader:v31 didFailWithError:v29 forRequest:v19];

          goto LABEL_17;
        }
        [v19 setCertificateData:v8];
        v28 = [(TVPSecureKeyDeliveryCoordinator *)self secureKeyLoader];
        [v28 startLoadingContentIdentifierDataForRequest:v19];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_17:
}

- (void)secureKeyLoader:(id)a3 didLoadContentIdentifierData:(id)a4 forRequest:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 length])
  {
    [v10 setContentIdentifierData:v9];
    objc_initWeak(&location, self);
    id v11 = (id)sDeliveryCoordinatorLogObject;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v10 requestID];
      *(_DWORD *)buf = 134217984;
      uint64_t v25 = v12;
      _os_log_impl(&dword_236FC5000, v11, OS_LOG_TYPE_DEFAULT, "Loading key request data for id %lu", buf, 0xCu);
    }

    v13 = [(TVPSecureKeyDeliveryCoordinator *)self eventCollection];
    v14 = TVPPlaybackReportingEventFPSRequestDataGeneration;
    uint64_t v15 = NSString;
    uint64_t v16 = [v10 reportingID];
    uint64_t v17 = [v15 stringWithFormat:@"%@%@", v14, v16];
    [v13 addStartEventWithName:v14 identifier:v17];

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __91__TVPSecureKeyDeliveryCoordinator_secureKeyLoader_didLoadContentIdentifierData_forRequest___block_invoke;
    v19[3] = &unk_264CC6740;
    objc_copyWeak(&v22, &location);
    id v20 = v10;
    id v21 = v8;
    [v20 loadKeyRequestDataAsynchronouslyWithCompletion:v19];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    v18 = TVPSKDErrorWithCode(-345006);
    [(TVPSecureKeyDeliveryCoordinator *)self secureKeyLoader:v8 didFailWithError:v18 forRequest:v10];
  }
}

void __91__TVPSecureKeyDeliveryCoordinator_secureKeyLoader_didLoadContentIdentifierData_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [WeakRetained eventCollection];
  id v6 = TVPPlaybackReportingEventFPSRequestDataGeneration;
  v7 = NSString;
  id v8 = [*(id *)(a1 + 32) reportingID];
  id v9 = [v7 stringWithFormat:@"%@%@", v6, v8];
  [v5 addEndEventWithName:v6 identifier:v9];

  id v10 = (void *)sDeliveryCoordinatorLogObject;
  if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = v10;
    *(_DWORD *)buf = 134217984;
    uint64_t v27 = [v11 requestID];
    _os_log_impl(&dword_236FC5000, v12, OS_LOG_TYPE_DEFAULT, "Done loading key request data for id %lu", buf, 0xCu);
  }
  v13 = [*(id *)(a1 + 32) keyRequestData];

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v15 = [v14 eventCollection];
    uint64_t v16 = TVPPlaybackReportingEventFPSServerKeyFetch;
    uint64_t v17 = NSString;
    v18 = [*(id *)(a1 + 32) reportingID];
    v19 = [v17 stringWithFormat:@"%@%@", v16, v18];
    [v15 addStartEventWithName:v16 identifier:v19];

    id v20 = (void *)sDeliveryCoordinatorLogObject;
    if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = *(void **)(a1 + 32);
      id v22 = v20;
      uint64_t v23 = [v21 requestID];
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = v23;
      _os_log_impl(&dword_236FC5000, v22, OS_LOG_TYPE_DEFAULT, "Fetching FPS key for id %lu", buf, 0xCu);
    }
    id v24 = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v25 = [v24 secureKeyLoader];
    [v25 startLoadingKeyResponseDataForRequest:*(void *)(a1 + 32)];
  }
  else
  {
    if (!v3) {
      id v3 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.ATV.secureKeyDelivery" code:-345007 userInfo:0];
    }
    id v24 = objc_loadWeakRetained((id *)(a1 + 48));
    [v24 secureKeyLoader:*(void *)(a1 + 40) didFailWithError:v3 forRequest:*(void *)(a1 + 32)];
  }
}

- (void)secureKeyLoader:(id)a3 didLoadKeyResponseData:(id)a4 renewalDate:(id)a5 forRequest:(id)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)sDeliveryCoordinatorLogObject;
  if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v14;
    *(_DWORD *)buf = 134217984;
    uint64_t v45 = [v13 requestID];
    _os_log_impl(&dword_236FC5000, v15, OS_LOG_TYPE_DEFAULT, "FPS key fetch complete for id %lu", buf, 0xCu);
  }
  uint64_t v16 = [MEMORY[0x263EFF910] date];
  [v13 setRequestEndDate:v16];

  if ([v11 length])
  {
    id v42 = v12;
    uint64_t v17 = [(TVPSecureKeyDeliveryCoordinator *)self eventCollection];
    v18 = TVPPlaybackReportingEventFPSServerKeyFetch;
    v19 = NSString;
    id v20 = [v13 reportingID];
    id v21 = [v19 stringWithFormat:@"%@%@", v18, v20];
    id v22 = [v13 requestCompletionTime];
    [v17 addEndEventWithName:v18 identifier:v21 timestamp:v22];

    uint64_t v23 = [(TVPSecureKeyDeliveryCoordinator *)self delegate];
    [v23 secureKeyDeliveryCoordinatorWillSucceed:self];

    id v24 = [(TVPSecureKeyDeliveryCoordinator *)self delegate];
    LOBYTE(v18) = objc_opt_respondsToSelector();

    if (v18)
    {
      uint64_t v25 = [(TVPSecureKeyDeliveryCoordinator *)self delegate];
      [v25 secureKeyDeliveryCoordinatorWillSucceed:self forKeyRequest:v13];
    }
    uint64_t v26 = [(TVPSecureKeyDeliveryCoordinator *)self eventCollection];
    uint64_t v27 = TVPPlaybackReportingEventFPSOverallFetch;
    uint64_t v28 = NSString;
    v29 = [v13 reportingID];
    v30 = [v28 stringWithFormat:@"%@%@", v27, v29];
    id v31 = [v13 requestCompletionTime];
    [v26 addEndEventWithName:v27 identifier:v30 timestamp:v31];

    if ([v13 retrievesOfflineKeys])
    {
      v32 = (void *)sDeliveryCoordinatorLogObject;
      if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT))
      {
        long long v33 = v32;
        uint64_t v34 = [v13 requestID];
        *(_DWORD *)buf = 134217984;
        uint64_t v45 = v34;
        _os_log_impl(&dword_236FC5000, v33, OS_LOG_TYPE_DEFAULT, "Converting key response data to offline key data for id %lu", buf, 0xCu);
      }
      id v43 = 0;
      long long v35 = [v13 offlineKeyDataForResponseData:v11 error:&v43];
      id v36 = v43;

      if ([v35 length])
      {
        v37 = [(TVPSecureKeyDeliveryCoordinator *)self delegate];
        char v38 = objc_opt_respondsToSelector();

        if (v38)
        {
          uint64_t v39 = [(TVPSecureKeyDeliveryCoordinator *)self delegate];
          [v39 secureKeyDeliveryCoordinator:self didReceiveOfflineKeyData:v35 forKeyRequest:v13];
        }
        id v12 = v42;
        [v13 finishLoadingWithResponseData:v35 renewalDate:v42 keyType:2];
      }
      else
      {
        uint64_t v41 = sDeliveryCoordinatorLogObject;
        if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_ERROR)) {
          -[TVPSecureKeyDeliveryCoordinator secureKeyLoader:didLoadKeyResponseData:renewalDate:forRequest:]((uint64_t)v36, v41);
        }
        [(TVPSecureKeyDeliveryCoordinator *)self _finishLoadingWithError:v36 forRequest:v13];
        id v12 = v42;
      }
    }
    else
    {
      id v12 = v42;
      [v13 finishLoadingWithResponseData:v11 renewalDate:v42 keyType:1];
      long long v35 = v11;
    }
  }
  else
  {
    __int16 v40 = TVPSKDErrorWithCode(-345009);
    [(TVPSecureKeyDeliveryCoordinator *)self secureKeyLoader:v10 didFailWithError:v40 forRequest:v13];

    long long v35 = v11;
  }
}

- (void)secureKeyLoader:(id)a3 didReceiveUpdatedRentalExpirationDate:(id)a4
{
  id v5 = a4;
  id v6 = [(TVPSecureKeyDeliveryCoordinator *)self delegate];
  [v6 secureKeyDeliveryCoordinator:self didReceiveUpdatedRentalExpirationDate:v5];
}

- (void)secureKeyLoader:(id)a3 didReceiveUpdatedRentalPlaybackStartDate:(id)a4
{
  id v8 = a4;
  id v5 = [(TVPSecureKeyDeliveryCoordinator *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(TVPSecureKeyDeliveryCoordinator *)self delegate];
    [v7 secureKeyDeliveryCoordinator:self didReceiveUpdatedRentalPlaybackStartDate:v8];
  }
}

- (void)secureKeyLoader:(id)a3 didReceiveUpdatedRentalExpirationDate:(id)a4 playbackStartDate:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(TVPSecureKeyDeliveryCoordinator *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(TVPSecureKeyDeliveryCoordinator *)self delegate];
    [v10 secureKeyDeliveryCoordinator:self didReceiveUpdatedRentalExpirationDate:v11 playbackStartDate:v7];
  }
}

- (void)secureKeyLoader:(id)a3 didFailWithError:(id)a4 forRequest:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sDeliveryCoordinatorLogObject;
  if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_ERROR)) {
    -[TVPSecureKeyDeliveryCoordinator secureKeyLoader:didFailWithError:forRequest:]((uint64_t)v9, v11);
  }
  id v12 = [MEMORY[0x263EFF910] date];
  [v10 setRequestEndDate:v12];

  if ([(TVPSecureKeyDeliveryCoordinator *)self certFetchInProgress])
  {
    id v33 = v10;
    id v34 = v8;
    id v13 = [(TVPSecureKeyDeliveryCoordinator *)self requestsAwaitingCertFetch];
    id v14 = (void *)[v13 copy];

    [(TVPSecureKeyDeliveryCoordinator *)self setCertFetchInProgress:0];
    uint64_t v15 = [(TVPSecureKeyDeliveryCoordinator *)self requestsAwaitingCertFetch];
    [v15 removeAllObjects];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v14;
    uint64_t v16 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v37 = *(void *)v43;
      uint64_t v36 = *MEMORY[0x263F08608];
      id v38 = v9;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v43 != v37) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if (v9)
          {
            uint64_t v48 = v36;
            id v49 = v9;
            id v20 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          }
          else
          {
            id v20 = 0;
          }
          id v21 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.ATV.secureKeyDelivery" code:-345001 userInfo:v20];
          id v22 = [(TVPSecureKeyDeliveryCoordinator *)self eventCollection];
          uint64_t v23 = TVPPlaybackReportingEventFPSCertFetch;
          id v24 = NSString;
          uint64_t v25 = [v19 reportingID];
          uint64_t v26 = [v24 stringWithFormat:@"%@%@", v23, v25];
          [v22 addEndEventWithName:v23 identifier:v26];

          uint64_t v27 = (void *)sDeliveryCoordinatorLogObject;
          if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v28 = v27;
            uint64_t v29 = [v19 requestID];
            *(_DWORD *)buf = 134217984;
            uint64_t v47 = v29;
            _os_log_impl(&dword_236FC5000, v28, OS_LOG_TYPE_DEFAULT, "After cert fetch failure, failing request %lu", buf, 0xCu);
          }
          [(TVPSecureKeyDeliveryCoordinator *)self _finishLoadingWithError:v21 forRequest:v19];

          id v9 = v38;
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v17);
    }

    id v10 = v33;
    id v8 = v34;
  }
  else
  {
    char IsFatalSKDError = TVPErrorIsFatalSKDError(v9);
    objc_msgSend(v10, "setRetryCount:", objc_msgSend(v10, "retryCount") + 1);
    if ((IsFatalSKDError & 1) != 0 || (unint64_t)[v10 retryCount] > 1)
    {
      [(TVPSecureKeyDeliveryCoordinator *)self _finishLoadingWithError:v9 forRequest:v10];
    }
    else
    {
      id v31 = sDeliveryCoordinatorLogObject;
      if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_ERROR)) {
        -[TVPSecureKeyDeliveryCoordinator secureKeyLoader:didFailWithError:forRequest:](v31);
      }
      objc_initWeak((id *)buf, self);
      dispatch_time_t v32 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __79__TVPSecureKeyDeliveryCoordinator_secureKeyLoader_didFailWithError_forRequest___block_invoke;
      block[3] = &unk_264CC5100;
      objc_copyWeak(&v41, (id *)buf);
      id v40 = v10;
      dispatch_after(v32, MEMORY[0x263EF83A0], block);

      objc_destroyWeak(&v41);
      objc_destroyWeak((id *)buf);
    }
  }
}

uint64_t __79__TVPSecureKeyDeliveryCoordinator_secureKeyLoader_didFailWithError_forRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (([*(id *)(a1 + 32) isCancelled] & 1) == 0) {
      [v4 _loadSecureKeyRequest:*(void *)(a1 + 32) sendStartReportingEvent:0];
    }
  }
  return MEMORY[0x270F9A758]();
}

- (TVPSecureKeyDeliveryCoordinator)init
{
  return 0;
}

- (void)_loadSecureKeyRequest:(id)a3 sendStartReportingEvent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v4)
  {
    id v7 = [(TVPSecureKeyDeliveryCoordinator *)self eventCollection];
    id v8 = TVPPlaybackReportingEventFPSOverallFetch;
    id v9 = NSString;
    id v10 = [v6 reportingID];
    id v11 = [v9 stringWithFormat:@"%@%@", v8, v10];
    [v7 addStartEventWithName:v8 identifier:v11];
  }
  id v12 = [(TVPSecureKeyDeliveryCoordinator *)self eventCollection];
  id v13 = TVPPlaybackReportingEventFPSCertFetch;
  id v14 = NSString;
  uint64_t v15 = [v6 reportingID];
  uint64_t v16 = [v14 stringWithFormat:@"%@%@", v13, v15];
  [v12 addStartEventWithName:v13 identifier:v16];

  uint64_t v17 = [(TVPSecureKeyDeliveryCoordinator *)self certificateData];

  if (v17)
  {
    v18 = (void *)sDeliveryCoordinatorLogObject;
    if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = [v6 requestID];
      _os_log_impl(&dword_236FC5000, v19, OS_LOG_TYPE_DEFAULT, "Using cached cert data for request %lu", buf, 0xCu);
    }
    id v20 = [(TVPSecureKeyDeliveryCoordinator *)self eventCollection];
    id v21 = TVPPlaybackReportingEventFPSCertFetch;
    id v22 = NSString;
    uint64_t v23 = [v6 reportingID];
    id v24 = [v22 stringWithFormat:@"%@%@", v21, v23];
    [v20 addEndEventWithName:v21 identifier:v24];

    uint64_t v25 = [(TVPSecureKeyDeliveryCoordinator *)self certificateData];
    [v6 setCertificateData:v25];

    uint64_t v26 = [(TVPSecureKeyDeliveryCoordinator *)self secureKeyLoader];
    [v26 startLoadingContentIdentifierDataForRequest:v6];
    goto LABEL_13;
  }
  uint64_t v27 = [(TVPSecureKeyDeliveryCoordinator *)self requestsAwaitingCertFetch];
  [v27 addObject:v6];

  BOOL v28 = [(TVPSecureKeyDeliveryCoordinator *)self certFetchInProgress];
  uint64_t v29 = (void *)sDeliveryCoordinatorLogObject;
  BOOL v30 = os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT);
  if (!v28)
  {
    if (v30)
    {
      id v31 = v29;
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = [v6 requestID];
      _os_log_impl(&dword_236FC5000, v31, OS_LOG_TYPE_DEFAULT, "No cached cert data exists in coordinator for request %lu.  Starting cert fetch", buf, 0xCu);
    }
    [(TVPSecureKeyDeliveryCoordinator *)self setCertFetchInProgress:1];
    uint64_t v26 = [(TVPSecureKeyDeliveryCoordinator *)self secureKeyLoader];
    [v26 startLoadingCertificateDataForRequest:v6];
    goto LABEL_13;
  }
  if (v30)
  {
    uint64_t v26 = v29;
    *(_DWORD *)buf = 134217984;
    uint64_t v33 = [v6 requestID];
    _os_log_impl(&dword_236FC5000, v26, OS_LOG_TYPE_DEFAULT, "No cached cert data exists in coordinator for request %lu.  Waiting for cert fetch already in progress to complete", buf, 0xCu);
LABEL_13:
  }
}

- (void)_finishLoadingWithError:(id)a3 forRequest:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [(TVPSecureKeyDeliveryCoordinator *)self delegate];
  [v7 secureKeyDeliveryCoordinator:self willFailWithError:v18];

  id v8 = [(TVPSecureKeyDeliveryCoordinator *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(TVPSecureKeyDeliveryCoordinator *)self delegate];
    [v10 secureKeyDeliveryCoordinator:self willFailWithError:v18 forKeyRequest:v6];
  }
  id v11 = [(TVPSecureKeyDeliveryCoordinator *)self eventCollection];
  id v12 = TVPPlaybackReportingEventFPSOverallFetch;
  id v13 = NSString;
  id v14 = [v6 reportingID];
  uint64_t v15 = [v13 stringWithFormat:@"%@%@", v12, v14];
  [v11 addEndEventWithName:v12 identifier:v15];

  uint64_t v16 = [(TVPSecureKeyDeliveryCoordinator *)self eventCollection];
  [v16 addSingleShotEventWithName:TVPPlaybackReportingEventError value:v18];

  uint64_t v17 = [(TVPSecureKeyDeliveryCoordinator *)self eventCollection];
  [v17 addSingleShotEventWithName:TVPPlaybackReportingEventErrorEvent value:TVPPlaybackReportingEventFPSOverallFetch];

  [v6 finishLoadingWithError:v18];
}

- (TVPSecureKeyDeliveryCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVPSecureKeyDeliveryCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVPPlaybackReportingEventCollection)eventCollection
{
  return self->_eventCollection;
}

- (TVPSecureKeyLoader)secureKeyLoader
{
  return self->_secureKeyLoader;
}

- (void)setSecureKeyLoader:(id)a3
{
}

- (NSData)certificateData
{
  return self->_certificateData;
}

- (void)setCertificateData:(id)a3
{
}

- (BOOL)certFetchInProgress
{
  return self->_certFetchInProgress;
}

- (void)setCertFetchInProgress:(BOOL)a3
{
  self->_certFetchInProgress = a3;
}

- (NSMutableSet)requestsAwaitingCertFetch
{
  return self->_requestsAwaitingCertFetch;
}

- (void)setRequestsAwaitingCertFetch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestsAwaitingCertFetch, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_secureKeyLoader, 0);
  objc_storeStrong((id *)&self->_eventCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)secureKeyLoader:(uint64_t)a1 didLoadKeyResponseData:(NSObject *)a2 renewalDate:forRequest:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_236FC5000, a2, OS_LOG_TYPE_ERROR, "Error converting to offline key data: %@", (uint8_t *)&v2, 0xCu);
}

- (void)secureKeyLoader:(os_log_t)log didFailWithError:forRequest:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_236FC5000, log, OS_LOG_TYPE_ERROR, "Unable to load secure key request.  Retrying in a few seconds.", v1, 2u);
}

- (void)secureKeyLoader:(uint64_t)a1 didFailWithError:(NSObject *)a2 forRequest:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_236FC5000, a2, OS_LOG_TYPE_ERROR, "Secure Key Delivery failed with error: %@", (uint8_t *)&v2, 0xCu);
}

@end