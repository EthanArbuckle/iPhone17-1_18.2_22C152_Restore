@interface TVPStoreFPSKeyLoader
+ (void)initialize;
+ (void)preFetchFPSCertificate;
- (BOOL)didSkipRentalCheckout;
- (BOOL)holdKeyResponses;
- (BOOL)includeGUID;
- (BOOL)requiresExternalEntitlementCheck;
- (NSError)error;
- (NSMutableArray)pendingKeyRequests;
- (NSNumber)rentalID;
- (NSString)serviceProviderID;
- (NSURL)certificateDataURL;
- (NSURL)keyDataURL;
- (TVPPlaybackReportingEventCollection)eventCollection;
- (TVPSecureKeyDeliveryCoordinator)secureKeyDeliveryCoordinator;
- (TVPSecureKeyStandardLoader)fpsCertLoader;
- (TVPSecureKeyStandardLoader)secureKeyStandardLoader;
- (TVPStoreFPSKeyLoader)initWithCertificateDataURL:(id)a3 keyDataURL:(id)a4;
- (TVPStoreFPSKeyLoaderDelegate)delegate;
- (void)_failPendingKeyRequestsWithError:(id)a3;
- (void)_preFetchFPSCertificate;
- (void)loadSecureKeyRequest:(id)a3;
- (void)secureKeyDeliveryCoordinator:(id)a3 didReceiveOfflineKeyData:(id)a4 forKeyRequest:(id)a5;
- (void)secureKeyDeliveryCoordinator:(id)a3 didReceiveUpdatedRentalExpirationDate:(id)a4;
- (void)secureKeyDeliveryCoordinator:(id)a3 didReceiveUpdatedRentalExpirationDate:(id)a4 playbackStartDate:(id)a5;
- (void)secureKeyDeliveryCoordinator:(id)a3 didReceiveUpdatedRentalPlaybackStartDate:(id)a4;
- (void)secureKeyDeliveryCoordinator:(id)a3 willFailWithError:(id)a4 forKeyRequest:(id)a5;
- (void)secureKeyDeliveryCoordinatorWillSucceed:(id)a3 forKeyRequest:(id)a4;
- (void)secureKeyLoader:(id)a3 didFailWithError:(id)a4 forRequest:(id)a5;
- (void)secureKeyLoader:(id)a3 didLoadCertificateData:(id)a4 forRequest:(id)a5;
- (void)sendStopRequest;
- (void)setCertificateDataURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidSkipRentalCheckout:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setEventCollection:(id)a3;
- (void)setFpsCertLoader:(id)a3;
- (void)setHoldKeyResponses:(BOOL)a3;
- (void)setIncludeGUID:(BOOL)a3;
- (void)setKeyDataURL:(id)a3;
- (void)setPendingKeyRequests:(id)a3;
- (void)setRentalID:(id)a3;
- (void)setRequiresExternalEntitlementCheck:(BOOL)a3;
- (void)setSecureKeyDeliveryCoordinator:(id)a3;
- (void)setSecureKeyStandardLoader:(id)a3;
- (void)setServiceProviderID:(id)a3;
@end

@implementation TVPStoreFPSKeyLoader

+ (void)initialize
{
  if (initialize_onceToken_2 != -1) {
    dispatch_once(&initialize_onceToken_2, &__block_literal_global_6);
  }
}

uint64_t __34__TVPStoreFPSKeyLoader_initialize__block_invoke()
{
  sLogObject_1 = (uint64_t)os_log_create("com.apple.AppleTV.playback", "SecureKeyDelivery");
  return MEMORY[0x270F9A758]();
}

+ (void)preFetchFPSCertificate
{
  if (!sCertLoader)
  {
    v2 = objc_alloc_init(TVPStoreFPSKeyLoader);
    v3 = (void *)sCertLoader;
    sCertLoader = (uint64_t)v2;

    v4 = (void *)sCertLoader;
    [v4 _preFetchFPSCertificate];
  }
}

- (TVPStoreFPSKeyLoader)initWithCertificateDataURL:(id)a3 keyDataURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TVPStoreFPSKeyLoader;
  v8 = [(TVPStoreFPSKeyLoader *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    certificateDataURL = v8->_certificateDataURL;
    v8->_certificateDataURL = (NSURL *)v9;

    uint64_t v11 = [v7 copy];
    keyDataURL = v8->_keyDataURL;
    v8->_keyDataURL = (NSURL *)v11;
  }
  return v8;
}

- (void)loadSecureKeyRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = [(TVPStoreFPSKeyLoader *)self secureKeyDeliveryCoordinator];

    if (v5)
    {
      id v6 = [(TVPStoreFPSKeyLoader *)self secureKeyDeliveryCoordinator];
      [v6 loadSecureKeyRequest:v4];
    }
    else
    {
      id v7 = [(TVPStoreFPSKeyLoader *)self pendingKeyRequests];

      if (!v7)
      {
        id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
        [(TVPStoreFPSKeyLoader *)self setPendingKeyRequests:v8];
      }
      uint64_t v9 = [(TVPStoreFPSKeyLoader *)self pendingKeyRequests];
      [v9 addObject:v4];

      v10 = (void *)sLogObject_1;
      if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = v10;
        *(_DWORD *)buf = 134217984;
        uint64_t v16 = [v4 requestID];
        _os_log_impl(&dword_236FC5000, v11, OS_LOG_TYPE_DEFAULT, "Waiting for URL bag fetch before handling keyRequest %lu", buf, 0xCu);
      }
      objc_initWeak((id *)buf, self);
      v12 = [MEMORY[0x263F89548] sharedBagLoadingController];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke;
      v13[3] = &unk_264CC5388;
      objc_copyWeak(&v14, (id *)buf);
      [v12 requestAccessToBagUsingBlock:v13];

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke_2;
  v8[3] = &unk_264CC5100;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v7 = v5;
  id v9 = v7;
  TVPPerformBlockOnMainThreadIfNeeded(v8);

  objc_destroyWeak(&v10);
}

void __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained secureKeyDeliveryCoordinator];

    if (!v4)
    {
      id v5 = sLogObject_1;
      if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "URL bag dictionary fetched", buf, 2u);
      }
      if (!*(void *)(a1 + 32))
      {
        v32 = sLogObject_1;
        if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_ERROR)) {
          __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke_2_cold_1(v32, v33, v34, v35, v36, v37, v38, v39);
        }
        id v6 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.ATV.secureKeyDelivery" code:-345020 userInfo:0];
        [v3 _failPendingKeyRequestsWithError:v6];
        goto LABEL_38;
      }
      id v6 = (void *)[objc_alloc(MEMORY[0x263F7B3F8]) initWithURLBagDictionary:*(void *)(a1 + 32)];
      id v7 = [v3 certificateDataURL];
      uint64_t v8 = [v3 keyDataURL];
      id v9 = (void *)v8;
      if (!v7 || !v8)
      {
        uint64_t v10 = [v6 pastisCertificateURL];

        uint64_t v11 = [v6 pastisKeyServerURL];

        id v9 = (void *)v11;
        id v7 = (void *)v10;
      }
      if (v7 && v9)
      {
        v60 = v6;
        v12 = sLogObject_1;
        if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_236FC5000, v12, OS_LOG_TYPE_DEFAULT, "Certificate and key server URLs available; creating loader objects",
            buf,
            2u);
        }
        v59 = v7;
        v13 = [[TVPSecureKeyStandardLoader alloc] initWithCertificateDataURL:v7 keyDataURL:v9];
        id v14 = objc_alloc_init(TVPSecureKeyStandardConnector);
        [(TVPSecureKeyStandardLoader *)v13 setRequestGenerator:v14];
        v57 = v14;
        [(TVPSecureKeyStandardLoader *)v13 setConnectionHandler:v14];
        -[TVPSecureKeyStandardLoader setHoldKeyResponses:](v13, "setHoldKeyResponses:", [v3 holdKeyResponses]);
        -[TVPSecureKeyStandardLoader setDidSkipRentalCheckout:](v13, "setDidSkipRentalCheckout:", [v3 didSkipRentalCheckout]);
        -[TVPSecureKeyStandardLoader setIncludeGUID:](v13, "setIncludeGUID:", [v3 includeGUID]);
        -[TVPSecureKeyStandardLoader setRequiresExternalEntitlementCheck:](v13, "setRequiresExternalEntitlementCheck:", [v3 requiresExternalEntitlementCheck]);
        v15 = [v3 serviceProviderID];
        [(TVPSecureKeyStandardLoader *)v13 setServiceProviderID:v15];

        uint64_t v16 = [v3 rentalID];
        [(TVPSecureKeyStandardLoader *)v13 setRentalID:v16];

        [v3 setSecureKeyStandardLoader:v13];
        v58 = v13;
        uint64_t v17 = [[TVPSecureKeyDeliveryCoordinator alloc] initWithSecureKeyLoader:v13];
        [(TVPSecureKeyDeliveryCoordinator *)v17 setDelegate:v3];
        v18 = [v3 eventCollection];
        [(TVPSecureKeyDeliveryCoordinator *)v17 setEventCollection:v18];

        [v3 setSecureKeyDeliveryCoordinator:v17];
        v19 = [v3 pendingKeyRequests];
        v20 = (void *)[v19 copy];

        v61 = v3;
        v21 = [v3 pendingKeyRequests];
        [v21 removeAllObjects];

        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v22 = v20;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v62 objects:v68 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v63 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = *(void **)(*((void *)&v62 + 1) + 8 * i);
              if ([v27 isCancelled])
              {
                v28 = (void *)sLogObject_1;
                if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
                {
                  v29 = v28;
                  uint64_t v30 = [v27 requestID];
                  *(_DWORD *)buf = 134217984;
                  uint64_t v67 = v30;
                  _os_log_impl(&dword_236FC5000, v29, OS_LOG_TYPE_DEFAULT, "Not loading request %lu since it has been cancelled", buf, 0xCu);
                }
              }
              else
              {
                [(TVPSecureKeyDeliveryCoordinator *)v17 loadSecureKeyRequest:v27];
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v62 objects:v68 count:16];
          }
          while (v24);
        }

        id v6 = v60;
        v3 = v61;
        id v7 = v59;
        v31 = v58;
      }
      else
      {
        if (!v7)
        {
          v40 = sLogObject_1;
          if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_ERROR)) {
            __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke_2_cold_3(v40, v41, v42, v43, v44, v45, v46, v47);
          }
          v48 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.ATV.secureKeyDelivery" code:-345021 userInfo:0];
          [v3 _failPendingKeyRequestsWithError:v48];
        }
        if (v9) {
          goto LABEL_37;
        }
        v49 = sLogObject_1;
        if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_ERROR)) {
          __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke_2_cold_2(v49, v50, v51, v52, v53, v54, v55, v56);
        }
        v31 = (TVPSecureKeyStandardLoader *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.ATV.secureKeyDelivery" code:-345022 userInfo:0];
        [v3 _failPendingKeyRequestsWithError:v31];
      }

LABEL_37:
LABEL_38:
    }
  }
}

- (void)setEventCollection:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_eventCollection, a3);
  id v5 = [(TVPStoreFPSKeyLoader *)self secureKeyDeliveryCoordinator];

  if (v5)
  {
    id v6 = [(TVPStoreFPSKeyLoader *)self secureKeyDeliveryCoordinator];
    [v6 setEventCollection:v7];
  }
}

- (void)setHoldKeyResponses:(BOOL)a3
{
  BOOL v3 = a3;
  self->_holdKeyResponses = a3;
  id v4 = [(TVPStoreFPSKeyLoader *)self secureKeyStandardLoader];
  [v4 setHoldKeyResponses:v3];
}

- (void)setDidSkipRentalCheckout:(BOOL)a3
{
  BOOL v3 = a3;
  self->_didSkipRentalCheckout = a3;
  id v4 = [(TVPStoreFPSKeyLoader *)self secureKeyStandardLoader];
  [v4 setDidSkipRentalCheckout:v3];
}

- (void)setIncludeGUID:(BOOL)a3
{
  BOOL v3 = a3;
  self->_includeGUID = a3;
  id v4 = [(TVPStoreFPSKeyLoader *)self secureKeyStandardLoader];
  [v4 setIncludeGUID:v3];
}

- (void)setRequiresExternalEntitlementCheck:(BOOL)a3
{
  BOOL v3 = a3;
  self->_requiresExternalEntitlementCheck = a3;
  id v4 = [(TVPStoreFPSKeyLoader *)self secureKeyStandardLoader];
  [v4 setRequiresExternalEntitlementCheck:v3];
}

- (void)setServiceProviderID:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProviderID, a3);
  id v5 = a3;
  id v6 = [(TVPStoreFPSKeyLoader *)self secureKeyStandardLoader];
  [v6 setServiceProviderID:v5];
}

- (void)setRentalID:(id)a3
{
  objc_storeStrong((id *)&self->_rentalID, a3);
  id v5 = a3;
  id v6 = [(TVPStoreFPSKeyLoader *)self secureKeyStandardLoader];
  [v6 setRentalID:v5];
}

- (void)sendStopRequest
{
  id v2 = [(TVPStoreFPSKeyLoader *)self secureKeyDeliveryCoordinator];
  [v2 sendStopRequest];
}

- (void)secureKeyDeliveryCoordinatorWillSucceed:(id)a3 forKeyRequest:(id)a4
{
  id v8 = a4;
  [(TVPStoreFPSKeyLoader *)self setError:0];
  id v5 = [(TVPStoreFPSKeyLoader *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(TVPStoreFPSKeyLoader *)self delegate];
    [v7 storeFPSKeyLoaderWillSucceed:self forKeyRequest:v8];
  }
}

- (void)secureKeyDeliveryCoordinator:(id)a3 willFailWithError:(id)a4 forKeyRequest:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  id v8 = [(TVPStoreFPSKeyLoader *)self error];

  if (!v8) {
    [(TVPStoreFPSKeyLoader *)self setError:v12];
  }
  id v9 = [(TVPStoreFPSKeyLoader *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(TVPStoreFPSKeyLoader *)self delegate];
    [v11 storeFPSKeyLoader:self willFailWithError:v12 forKeyRequest:v7];
  }
}

- (void)secureKeyDeliveryCoordinator:(id)a3 didReceiveUpdatedRentalExpirationDate:(id)a4
{
  id v8 = a4;
  id v5 = [(TVPStoreFPSKeyLoader *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(TVPStoreFPSKeyLoader *)self delegate];
    [v7 storeFPSKeyLoader:self didReceiveUpdatedRentalExpirationDate:v8];
  }
}

- (void)secureKeyDeliveryCoordinator:(id)a3 didReceiveUpdatedRentalPlaybackStartDate:(id)a4
{
  id v8 = a4;
  id v5 = [(TVPStoreFPSKeyLoader *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(TVPStoreFPSKeyLoader *)self delegate];
    [v7 storeFPSKeyLoader:self didReceiveUpdatedRentalPlaybackStartDate:v8];
  }
}

- (void)secureKeyDeliveryCoordinator:(id)a3 didReceiveOfflineKeyData:(id)a4 forKeyRequest:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(TVPStoreFPSKeyLoader *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(TVPStoreFPSKeyLoader *)self delegate];
    [v10 storeFPSKeyLoader:self didLoadOfflineKeyData:v11 forKeyRequest:v7];
  }
}

- (void)secureKeyDeliveryCoordinator:(id)a3 didReceiveUpdatedRentalExpirationDate:(id)a4 playbackStartDate:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(TVPStoreFPSKeyLoader *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(TVPStoreFPSKeyLoader *)self delegate];
    [v10 storeFPSKeyLoader:self didReceiveUpdatedRentalExpirationDate:v11 playbackStartDate:v7];
  }
}

- (void)secureKeyLoader:(id)a3 didFailWithError:(id)a4 forRequest:(id)a5
{
  id v5 = (void *)sCertLoader;
  sCertLoader = 0;
}

- (void)secureKeyLoader:(id)a3 didLoadCertificateData:(id)a4 forRequest:(id)a5
{
  id v5 = (void *)sCertLoader;
  sCertLoader = 0;
}

- (void)_preFetchFPSCertificate
{
  objc_initWeak(&location, self);
  id v2 = [MEMORY[0x263F89548] sharedBagLoadingController];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__TVPStoreFPSKeyLoader__preFetchFPSCertificate__block_invoke;
  v3[3] = &unk_264CC5388;
  objc_copyWeak(&v4, &location);
  [v2 requestAccessToBagUsingBlock:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __47__TVPStoreFPSKeyLoader__preFetchFPSCertificate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__TVPStoreFPSKeyLoader__preFetchFPSCertificate__block_invoke_2;
  v8[3] = &unk_264CC5100;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v7 = v5;
  id v9 = v7;
  TVPPerformBlockOnMainThreadIfNeeded(v8);

  objc_destroyWeak(&v10);
}

void __47__TVPStoreFPSKeyLoader__preFetchFPSCertificate__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v10 = WeakRetained;
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x263F7B3F8]) initWithURLBagDictionary:*(void *)(a1 + 32)];
    id v4 = [v3 pastisCertificateURL];
    uint64_t v5 = [v3 pastisKeyServerURL];
    id v6 = (void *)v5;
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      id v8 = [[TVPSecureKeyStandardLoader alloc] initWithCertificateDataURL:v4 keyDataURL:v5];
      id v9 = objc_alloc_init(TVPSecureKeyStandardConnector);
      [(TVPSecureKeyStandardLoader *)v8 setRequestGenerator:v9];
      [(TVPSecureKeyStandardLoader *)v8 setConnectionHandler:v9];
      [(TVPSecureKeyLoader *)v8 setDelegate:v10];
      [v10 setFpsCertLoader:v8];
      [(TVPSecureKeyStandardLoader *)v8 startLoadingCertificateDataForRequest:0];
    }
    id WeakRetained = v10;
  }
}

- (void)_failPendingKeyRequestsWithError:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(TVPStoreFPSKeyLoader *)self pendingKeyRequests];
  id v6 = (void *)[v5 copy];

  BOOL v7 = [(TVPStoreFPSKeyLoader *)self pendingKeyRequests];
  [v7 removeAllObjects];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v20;
    *(void *)&long long v10 = 134217984;
    long long v18 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v14, "isCancelled", v18, (void)v19))
        {
          v15 = (void *)sLogObject_1;
          if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = v15;
            uint64_t v17 = [v14 requestID];
            *(_DWORD *)buf = v18;
            uint64_t v24 = v17;
            _os_log_impl(&dword_236FC5000, v16, OS_LOG_TYPE_DEFAULT, "Not failing request %lu since it has been cancelled", buf, 0xCu);
          }
        }
        else
        {
          [v14 finishLoadingWithError:v4];
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v11);
  }
}

- (TVPStoreFPSKeyLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVPStoreFPSKeyLoaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (TVPPlaybackReportingEventCollection)eventCollection
{
  return self->_eventCollection;
}

- (BOOL)holdKeyResponses
{
  return self->_holdKeyResponses;
}

- (BOOL)didSkipRentalCheckout
{
  return self->_didSkipRentalCheckout;
}

- (BOOL)includeGUID
{
  return self->_includeGUID;
}

- (BOOL)requiresExternalEntitlementCheck
{
  return self->_requiresExternalEntitlementCheck;
}

- (NSString)serviceProviderID
{
  return self->_serviceProviderID;
}

- (NSNumber)rentalID
{
  return self->_rentalID;
}

- (TVPSecureKeyDeliveryCoordinator)secureKeyDeliveryCoordinator
{
  return self->_secureKeyDeliveryCoordinator;
}

- (void)setSecureKeyDeliveryCoordinator:(id)a3
{
}

- (TVPSecureKeyStandardLoader)secureKeyStandardLoader
{
  return self->_secureKeyStandardLoader;
}

- (void)setSecureKeyStandardLoader:(id)a3
{
}

- (NSMutableArray)pendingKeyRequests
{
  return self->_pendingKeyRequests;
}

- (void)setPendingKeyRequests:(id)a3
{
}

- (TVPSecureKeyStandardLoader)fpsCertLoader
{
  return self->_fpsCertLoader;
}

- (void)setFpsCertLoader:(id)a3
{
}

- (NSURL)certificateDataURL
{
  return self->_certificateDataURL;
}

- (void)setCertificateDataURL:(id)a3
{
}

- (NSURL)keyDataURL
{
  return self->_keyDataURL;
}

- (void)setKeyDataURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyDataURL, 0);
  objc_storeStrong((id *)&self->_certificateDataURL, 0);
  objc_storeStrong((id *)&self->_fpsCertLoader, 0);
  objc_storeStrong((id *)&self->_pendingKeyRequests, 0);
  objc_storeStrong((id *)&self->_secureKeyStandardLoader, 0);
  objc_storeStrong((id *)&self->_secureKeyDeliveryCoordinator, 0);
  objc_storeStrong((id *)&self->_rentalID, 0);
  objc_storeStrong((id *)&self->_serviceProviderID, 0);
  objc_storeStrong((id *)&self->_eventCollection, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke_2_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end