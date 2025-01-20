@interface VUIStoreFPSKeyLoader
+ (unint64_t)maximumRequestBatchSize;
+ (void)_loadAndCacheCertificateDataForValidURL:(id)a3 completion:(id)a4;
+ (void)_loadFPSURLsFromStoreBagWithCompletion:(id)a3;
+ (void)initialize;
+ (void)preFetchFPSCertificate;
- (BOOL)didSkipRentalCheckout;
- (BOOL)sendsLocationWhenOptedIn;
- (BOOL)sendsMescalHeader;
- (BOOL)usesKeyIdentifierPenaltyBox;
- (NSData)certificateData;
- (NSDate)keyExpirationDate;
- (NSDate)rentalPlaybackStartDate;
- (NSMutableArray)requestsAwaitingCertFetch;
- (NSMutableDictionary)keyIdentifierPenaltyBox;
- (NSNumber)rentalID;
- (NSNumber)secureInvalidationDSID;
- (NSURL)certificateURL;
- (NSURL)keyServerURL;
- (NSURL)secureInvalidationNonceURL;
- (TVPContentKeyRequest)savedStreamingKeyRequestToUseForStopping;
- (TVPContentKeySession)contentKeySession;
- (TVPPlaybackReportingEventCollection)eventCollection;
- (VUIStoreFPSKeyLoader)initWithCertificateURL:(id)a3 keyServerURL:(id)a4;
- (VUIStoreFPSKeyLoaderDelegate)delegate;
- (double)availabilityPeriodOverrideInSeconds;
- (double)downloadExpirationPeriodOverrideInSeconds;
- (id)_bodyDictionaryForRequests:(id)a3 isStopRequest:(BOOL)a4 locationAuthorizationStatus:(int64_t)a5;
- (id)_errorForStoreResponseStatus:(int64_t)a3 deviceLimit:(id)a4;
- (id)_jsonDictionaryForRequest:(id)a3 isStopRequest:(BOOL)a4 locationAuthorizationStatus:(int64_t)a5;
- (int64_t)state;
- (void)_failKeyRequests:(id)a3 withError:(id)a4;
- (void)_generateKeyRequestDataForKeyRequests:(id)a3 completion:(id)a4;
- (void)_generateSecureInvalidationDataForFirstRequest:(id)a3 completion:(id)a4;
- (void)_handleResponseDict:(id)a3 forKeyRequest:(id)a4 completion:(id)a5;
- (void)_handleResponseDicts:(id)a3 forKeyRequests:(id)a4 completion:(id)a5;
- (void)_handleResponseForKeyRequests:(id)a3 responseData:(id)a4 URLResponse:(id)a5 error:(id)a6 completion:(id)a7;
- (void)_initiateKeyRequests:(id)a3 completion:(id)a4;
- (void)_invalidateValidKeyRequestsInBatches:(id)a3 completion:(id)a4;
- (void)_loadCertificateDataWithCompletion:(id)a3;
- (void)_loadNonceDataForRequests:(id)a3 completion:(id)a4;
- (void)_sendKeyRequestsToServer:(id)a3 isStopRequest:(BOOL)a4 isSecureInvalidationRequest:(BOOL)a5 completion:(id)a6;
- (void)_startKeyRequests:(id)a3 completion:(id)a4;
- (void)_startKeyRequestsInBatches:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)invalidateKeysWithRequests:(id)a3 completion:(id)a4;
- (void)loadFairPlayStreamingKeyRequests:(id)a3 completion:(id)a4;
- (void)removeAllEntriesFromKeyIdentifierPenaltyBox;
- (void)sendStreamingStopRequestIfNecessary;
- (void)setAvailabilityPeriodOverrideInSeconds:(double)a3;
- (void)setCertificateData:(id)a3;
- (void)setCertificateURL:(id)a3;
- (void)setContentKeySession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidSkipRentalCheckout:(BOOL)a3;
- (void)setDownloadExpirationPeriodOverrideInSeconds:(double)a3;
- (void)setEventCollection:(id)a3;
- (void)setKeyExpirationDate:(id)a3;
- (void)setKeyIdentifierPenaltyBox:(id)a3;
- (void)setKeyServerURL:(id)a3;
- (void)setRentalID:(id)a3;
- (void)setRentalPlaybackStartDate:(id)a3;
- (void)setRequestsAwaitingCertFetch:(id)a3;
- (void)setSavedStreamingKeyRequestToUseForStopping:(id)a3;
- (void)setSecureInvalidationDSID:(id)a3;
- (void)setSecureInvalidationNonceURL:(id)a3;
- (void)setSendsLocationWhenOptedIn:(BOOL)a3;
- (void)setSendsMescalHeader:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setUsesKeyIdentifierPenaltyBox:(BOOL)a3;
@end

@implementation VUIStoreFPSKeyLoader

+ (void)preFetchFPSCertificate
{
  v2 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "Prefetching store FPS certificate", v3, 2u);
  }
  +[VUIStoreFPSKeyLoader _loadFPSURLsFromStoreBagWithCompletion:&__block_literal_global_8];
}

+ (void)_loadFPSURLsFromStoreBagWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Retrieving certificate URL and key server URL from store bag", buf, 2u);
  }
  v5 = [MEMORY[0x1E4FA9C70] app];
  v6 = [v5 stringForKey:@"fps-cert"];

  v7 = [MEMORY[0x1E4FA9C70] app];
  v8 = [v7 stringForKey:@"fps-request"];

  if ([v6 length])
  {
    v9 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  }
  else
  {
    v9 = 0;
  }
  if ([v8 length])
  {
    v10 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
  }
  else
  {
    v10 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__VUIStoreFPSKeyLoader__loadFPSURLsFromStoreBagWithCompletion___block_invoke;
  block[3] = &unk_1E6DF4510;
  id v15 = v9;
  id v16 = v10;
  id v17 = v3;
  id v11 = v3;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_6);
  }
}

uint64_t __63__VUIStoreFPSKeyLoader__loadFPSURLsFromStoreBagWithCompletion___block_invoke(void *a1)
{
  if (a1[4] && a1[5])
  {
    v2 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "Finished retrieving certificate URL and key server URL from store bag", v4, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
  {
    __63__VUIStoreFPSKeyLoader__loadFPSURLsFromStoreBagWithCompletion___block_invoke_cold_1();
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __46__VUIStoreFPSKeyLoader_preFetchFPSCertificate__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return +[VUIStoreFPSKeyLoader _loadAndCacheCertificateDataForValidURL:a2 completion:0];
  }
  return result;
}

+ (void)_loadAndCacheCertificateDataForValidURL:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v5];
  [v7 setHTTPMethod:@"GET"];
  [v7 setTimeoutInterval:30.0];
  v8 = [MEMORY[0x1E4F290E0] sharedSession];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __75__VUIStoreFPSKeyLoader__loadAndCacheCertificateDataForValidURL_completion___block_invoke;
  id v15 = &unk_1E6DF4560;
  id v16 = v5;
  id v17 = v6;
  id v9 = v6;
  id v10 = v5;
  id v11 = [v8 dataTaskWithURL:v10 completionHandler:&v12];

  objc_msgSend(v11, "resume", v12, v13, v14, v15);
}

void __34__VUIStoreFPSKeyLoader_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "SecureKeyDelivery");
  v1 = (void *)sLogObject_0;
  sLogObject_0 = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  id v3 = (void *)sOperationQueue;
  sOperationQueue = (uint64_t)v2;

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = (void *)sCachedCertData;
  sCachedCertData = (uint64_t)v4;
}

void __75__VUIStoreFPSKeyLoader__loadAndCacheCertificateDataForValidURL_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__VUIStoreFPSKeyLoader__loadAndCacheCertificateDataForValidURL_completion___block_invoke_2;
  v10[3] = &unk_1E6DF4538;
  id v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v13 = v7;
  id v14 = *(id *)(a1 + 40);
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __75__VUIStoreFPSKeyLoader__loadAndCacheCertificateDataForValidURL_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) length];
  id v3 = sLogObject_0;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v4;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "Updating cached cert data for URL %@", buf, 0xCu);
    }
    [(id)sCachedCertData setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
    id v5 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
      __75__VUIStoreFPSKeyLoader__loadAndCacheCertificateDataForValidURL_completion___block_invoke_2_cold_1(a1, v3, v6, v7, v8, v9, v10, v11);
    }
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      uint64_t v16 = *MEMORY[0x1E4F28A50];
      uint64_t v17 = v12;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    }
    else
    {
      id v13 = 0;
    }
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v5 = (void *)[v14 initWithDomain:*MEMORY[0x1E4FAA418] code:-345001 userInfo:v13];
  }
  uint64_t v15 = *(void *)(a1 + 56);
  if (v15) {
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, *(void *)(a1 + 32), v5);
  }
}

+ (unint64_t)maximumRequestBatchSize
{
  return 20;
}

- (VUIStoreFPSKeyLoader)initWithCertificateURL:(id)a3 keyServerURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)VUIStoreFPSKeyLoader;
  uint64_t v8 = [(VUIStoreFPSKeyLoader *)&v22 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    certificateURL = v8->_certificateURL;
    v8->_certificateURL = (NSURL *)v9;

    uint64_t v11 = [v7 copy];
    keyServerURL = v8->_keyServerURL;
    v8->_keyServerURL = (NSURL *)v11;

    id v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    requestsAwaitingCertFetch = v8->_requestsAwaitingCertFetch;
    v8->_requestsAwaitingCertFetch = v13;

    v8->_usesKeyIdentifierPenaltyBox = 1;
    uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    keyIdentifierPenaltyBox = v8->_keyIdentifierPenaltyBox;
    v8->_keyIdentifierPenaltyBox = v15;

    v8->_state = 0;
    uint64_t v17 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v17 doubleForKey:*MEMORY[0x1E4FB3DB0]];
    v8->_downloadExpirationPeriodOverrideInSeconds = v18;

    uint64_t v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v19 doubleForKey:*MEMORY[0x1E4FB3DA0]];
    v8->_availabilityPeriodOverrideInSeconds = v20;
  }
  return v8;
}

- (void)dealloc
{
  id v3 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIStoreFPSKeyLoader deallocated", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)VUIStoreFPSKeyLoader;
  [(VUIStoreFPSKeyLoader *)&v4 dealloc];
}

- (void)loadFairPlayStreamingKeyRequests:(id)a3 completion:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v49 = (void (**)(void))a4;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v67 objects:v73 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v68;
    objc_super v4 = @"%@%@";
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v68 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        uint64_t v11 = [(VUIStoreFPSKeyLoader *)self eventCollection];
        uint64_t v12 = *MEMORY[0x1E4FAA2F0];
        id v13 = NSString;
        id v14 = [v10 eventReportingID];
        uint64_t v15 = [v13 stringWithFormat:@"%@%@", v12, v14];
        [v11 addStartEventWithName:v12 identifier:v15];

        uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
        [v10 setRequestStartDate:v16];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v67 objects:v73 count:16];
    }
    while (v7);
  }
  if ([(VUIStoreFPSKeyLoader *)self state])
  {
    int64_t v17 = [(VUIStoreFPSKeyLoader *)self state];
    double v18 = sLogObject_0;
    BOOL v19 = os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT);
    if (v17 == 1)
    {
      if (v19)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, "Certificate data loading in progress.  Waiting for certificate data before continuing requests", (uint8_t *)buf, 2u);
      }
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v50 = v6;
      uint64_t v20 = [v50 countByEnumeratingWithState:&v54 objects:v71 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v55;
        objc_super v22 = (uint64_t *)MEMORY[0x1E4FAA2E8];
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v55 != v21) {
              objc_enumerationMutation(v50);
            }
            v24 = *(void **)(*((void *)&v54 + 1) + 8 * j);
            v25 = [(VUIStoreFPSKeyLoader *)self requestsAwaitingCertFetch];
            [v25 addObject:v24];

            v26 = [(VUIStoreFPSKeyLoader *)self eventCollection];
            uint64_t v27 = *v22;
            v28 = NSString;
            v29 = [v24 eventReportingID];
            v30 = [v28 stringWithFormat:@"%@%@", v27, v29];
            [v26 addStartEventWithName:v27 identifier:v30];
          }
          uint64_t v20 = [v50 countByEnumeratingWithState:&v54 objects:v71 count:16];
        }
        while (v20);
      }
    }
    else
    {
      if (v19)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, "Certificate data already loaded.  Loading key requests immediately", (uint8_t *)buf, 2u);
      }
      [(VUIStoreFPSKeyLoader *)self _initiateKeyRequests:v6 completion:v49];
    }
    goto LABEL_48;
  }
  v31 = [(VUIStoreFPSKeyLoader *)self certificateURL];
  if (!v31)
  {
    objc_super v4 = [(VUIStoreFPSKeyLoader *)self keyServerURL];
    if (!v4) {
      goto LABEL_34;
    }
  }
  v32 = [(VUIStoreFPSKeyLoader *)self certificateURL];
  if (v32)
  {
    v33 = [(VUIStoreFPSKeyLoader *)self keyServerURL];

    if (v31) {
    else
    }

    if (v33)
    {
LABEL_34:
      [(VUIStoreFPSKeyLoader *)self setState:1];
      v35 = [(VUIStoreFPSKeyLoader *)self requestsAwaitingCertFetch];
      [v35 addObjectsFromArray:v6];

      objc_initWeak(buf, self);
      v36 = sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v65 = 0;
        _os_log_impl(&dword_1E2BD7000, v36, OS_LOG_TYPE_DEFAULT, "Starting certificate data loading.  Waiting for certificate data before continuing requests", v65, 2u);
      }
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v51 = v6;
      uint64_t v37 = [v51 countByEnumeratingWithState:&v61 objects:v72 count:16];
      if (v37)
      {
        uint64_t v38 = *(void *)v62;
        v39 = (uint64_t *)MEMORY[0x1E4FAA2E8];
        do
        {
          for (uint64_t k = 0; k != v37; ++k)
          {
            if (*(void *)v62 != v38) {
              objc_enumerationMutation(v51);
            }
            v41 = *(void **)(*((void *)&v61 + 1) + 8 * k);
            v42 = [(VUIStoreFPSKeyLoader *)self eventCollection];
            uint64_t v43 = *v39;
            v44 = NSString;
            v45 = [v41 eventReportingID];
            v46 = [v44 stringWithFormat:@"%@%@", v43, v45];
            [v42 addStartEventWithName:v43 identifier:v46];
          }
          uint64_t v37 = [v51 countByEnumeratingWithState:&v61 objects:v72 count:16];
        }
        while (v37);
      }

      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __68__VUIStoreFPSKeyLoader_loadFairPlayStreamingKeyRequests_completion___block_invoke;
      v58[3] = &unk_1E6DF4470;
      objc_copyWeak(&v60, buf);
      v59 = v49;
      [(VUIStoreFPSKeyLoader *)self _loadCertificateDataWithCompletion:v58];

      objc_destroyWeak(&v60);
      objc_destroyWeak(buf);
      goto LABEL_48;
    }
  }
  else
  {

    if (v31) {
      v34 = v31;
    }
    else {
      v34 = v4;
    }
  }
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
    -[VUIStoreFPSKeyLoader loadFairPlayStreamingKeyRequests:completion:]();
  }
  id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
  v48 = (void *)[v47 initWithDomain:*MEMORY[0x1E4FAA418] code:-345002 userInfo:0];
  [(VUIStoreFPSKeyLoader *)self _failKeyRequests:v6 withError:v48];

  if (v49) {
    v49[2]();
  }
LABEL_48:
}

void __68__VUIStoreFPSKeyLoader_loadFairPlayStreamingKeyRequests_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v26 = a2;
  uint64_t v24 = a1;
  id v25 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained requestsAwaitingCertFetch];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [WeakRetained requestsAwaitingCertFetch];
  [v8 removeAllObjects];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [WeakRetained eventCollection];
        v16 = id v15 = WeakRetained;
        uint64_t v17 = *MEMORY[0x1E4FAA2E8];
        double v18 = NSString;
        BOOL v19 = [v14 eventReportingID];
        uint64_t v20 = [v18 stringWithFormat:@"%@%@", v17, v19];
        [v16 addEndEventWithName:v17 identifier:v20];

        id WeakRetained = v15;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }

  if ([v26 length])
  {
    uint64_t v21 = sLogObject_0;
    objc_super v22 = v25;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_DEFAULT, "Certificate data has valid length.  Continuing key request loading for pending requests", buf, 2u);
    }
    [WeakRetained setState:2];
    [WeakRetained setCertificateData:v26];
    [WeakRetained _initiateKeyRequests:v9 completion:*(void *)(v24 + 32)];
  }
  else
  {
    [WeakRetained setState:0];
    objc_super v22 = v25;
    [WeakRetained _failKeyRequests:v9 withError:v25];
    uint64_t v23 = *(void *)(v24 + 32);
    if (v23) {
      (*(void (**)(void))(v23 + 16))();
    }
  }
}

- (void)invalidateKeysWithRequests:(id)a3 completion:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v8 = [(VUIStoreFPSKeyLoader *)self secureInvalidationNonceURL];
  if (v8)
  {
    id v9 = (void *)v8;
    uint64_t v10 = [(VUIStoreFPSKeyLoader *)self keyServerURL];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = [(VUIStoreFPSKeyLoader *)self secureInvalidationDSID];

      if (v12)
      {
        uint64_t v33 = v7;
        id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v34 = v6;
        id v13 = v6;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v45 count:16];
        id v15 = (NSObject **)&unk_1EBFC8000;
        if (!v14) {
          goto LABEL_21;
        }
        uint64_t v16 = v14;
        uint64_t v17 = *(void *)v39;
        unint64_t v18 = 0x1E4F1C000;
        while (1)
        {
          uint64_t v19 = 0;
          uint64_t v36 = v16;
          do
          {
            if (*(void *)v39 != v17) {
              objc_enumerationMutation(v13);
            }
            uint64_t v20 = *(void **)(*((void *)&v38 + 1) + 8 * v19);
            uint64_t v21 = objc_msgSend(v20, "offlineKeyData", v33);
            if (![v21 length]) {
              goto LABEL_15;
            }
            uint64_t v22 = [v20 keyIdentifier];
            if (!v22) {
              goto LABEL_15;
            }
            uint64_t v23 = (void *)v22;
            uint64_t v24 = [v20 additionalRequestParams];
            if (![v24 count])
            {

              unint64_t v18 = 0x1E4F1C000uLL;
LABEL_15:

              goto LABEL_16;
            }
            [v20 contentID];
            uint64_t v25 = v17;
            id v26 = v15;
            uint64_t v27 = self;
            v29 = id v28 = v13;
            uint64_t v37 = [v29 length];

            id v13 = v28;
            self = v27;
            id v15 = v26;
            uint64_t v17 = v25;
            uint64_t v16 = v36;

            unint64_t v18 = 0x1E4F1C000;
            if (v37)
            {
              [v35 addObject:v20];
              goto LABEL_19;
            }
LABEL_16:
            long long v30 = v15[320];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v20;
              _os_log_error_impl(&dword_1E2BD7000, v30, OS_LOG_TYPE_ERROR, "Param error invalidating key request: %@", buf, 0xCu);
            }
            v42 = v20;
            long long v31 = [*(id *)(v18 + 2424) arrayWithObjects:&v42 count:1];
            [(VUIStoreFPSKeyLoader *)self _failKeyRequests:v31 withError:0];

LABEL_19:
            ++v19;
          }
          while (v16 != v19);
          uint64_t v16 = [v13 countByEnumeratingWithState:&v38 objects:v45 count:16];
          if (!v16)
          {
LABEL_21:

            if ([v35 count])
            {
              uint64_t v7 = v33;
              [(VUIStoreFPSKeyLoader *)self _invalidateValidKeyRequestsInBatches:v35 completion:v33];
              id v6 = v34;
            }
            else
            {
              v32 = v15[320];
              uint64_t v7 = v33;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1E2BD7000, v32, OS_LOG_TYPE_DEFAULT, "No key requests to invalidate.", buf, 2u);
              }
              id v6 = v34;
              if (v33) {
                v33[2](v33);
              }
            }

            goto LABEL_33;
          }
        }
      }
    }
    else
    {
    }
  }
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
    -[VUIStoreFPSKeyLoader invalidateKeysWithRequests:completion:]();
  }
  [(VUIStoreFPSKeyLoader *)self _failKeyRequests:v6 withError:0];
  if (v7) {
    v7[2](v7);
  }
LABEL_33:
}

- (void)sendStreamingStopRequestIfNecessary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VUIStoreFPSKeyLoader *)self savedStreamingKeyRequestToUseForStopping];
  objc_super v4 = (void *)v3;
  if (v3)
  {
    v6[0] = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [(VUIStoreFPSKeyLoader *)self _sendKeyRequestsToServer:v5 isStopRequest:1 isSecureInvalidationRequest:0 completion:0];

    [(VUIStoreFPSKeyLoader *)self setSavedStreamingKeyRequestToUseForStopping:0];
  }
}

- (void)removeAllEntriesFromKeyIdentifierPenaltyBox
{
  uint64_t v3 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "Removing all entries from key identifier penalty box", v5, 2u);
  }
  objc_super v4 = [(VUIStoreFPSKeyLoader *)self keyIdentifierPenaltyBox];
  [v4 removeAllObjects];
}

- (void)_loadCertificateDataWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__VUIStoreFPSKeyLoader__loadCertificateDataWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6DF44C0;
  objc_copyWeak(&v16, &location);
  id v5 = v4;
  id v15 = v5;
  id v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v7 = [(VUIStoreFPSKeyLoader *)self certificateURL];

  if (v7)
  {
    uint64_t v8 = [(VUIStoreFPSKeyLoader *)self certificateURL];
    v6[2](v6, v8);
  }
  else
  {
    id v9 = [(VUIStoreFPSKeyLoader *)self eventCollection];
    [v9 addStartEventWithName:*MEMORY[0x1E4FAA310]];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__VUIStoreFPSKeyLoader__loadCertificateDataWithCompletion___block_invoke_2;
    v10[3] = &unk_1E6DF44E8;
    objc_copyWeak(&v13, &location);
    uint64_t v11 = v6;
    id v12 = v5;
    +[VUIStoreFPSKeyLoader _loadFPSURLsFromStoreBagWithCompletion:v10];

    objc_destroyWeak(&v13);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __59__VUIStoreFPSKeyLoader__loadCertificateDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [(id)sCachedCertData objectForKey:v3];
  uint64_t v6 = [v5 length];
  uint64_t v7 = sLogObject_0;
  BOOL v8 = os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v3;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Using cached cert data for %@.  Refreshing cert data, but not waiting for response", buf, 0xCu);
    }
    id v9 = [WeakRetained eventCollection];
    [v9 addSingleShotEventWithName:*MEMORY[0x1E4FAA318] value:MEMORY[0x1E4F1CC38]];

    +[VUIStoreFPSKeyLoader _loadAndCacheCertificateDataForValidURL:v3 completion:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v3;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "No cached cert data available for %@.  Fetching cert data and waiting for response", buf, 0xCu);
    }
    uint64_t v10 = [WeakRetained eventCollection];
    [v10 addSingleShotEventWithName:*MEMORY[0x1E4FAA318] value:MEMORY[0x1E4F1CC28]];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__VUIStoreFPSKeyLoader__loadCertificateDataWithCompletion___block_invoke_21;
    v11[3] = &unk_1E6DF4498;
    id v12 = *(id *)(a1 + 32);
    +[VUIStoreFPSKeyLoader _loadAndCacheCertificateDataForValidURL:v3 completion:v11];
  }
}

uint64_t __59__VUIStoreFPSKeyLoader__loadCertificateDataWithCompletion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__VUIStoreFPSKeyLoader__loadCertificateDataWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setCertificateURL:v7];
  [WeakRetained setKeyServerURL:v9];

  uint64_t v11 = [WeakRetained eventCollection];
  [v11 addEndEventWithName:*MEMORY[0x1E4FAA310]];

  if (v7 && v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v8)
    {
      uint64_t v16 = *MEMORY[0x1E4F28A50];
      v17[0] = v8;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    }
    else
    {
      id v12 = 0;
    }
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = (void *)[v14 initWithDomain:*MEMORY[0x1E4FAA418] code:-345002 userInfo:v12];
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v15);
  }
}

- (void)_invalidateValidKeyRequestsInBatches:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([v6 count])
  {
    objc_initWeak(&location, self);
    unint64_t v8 = [v6 count];
    if (v8 >= 0x14) {
      uint64_t v9 = 20;
    }
    else {
      uint64_t v9 = v8;
    }
    uint64_t v10 = objc_msgSend(v6, "subarrayWithRange:", 0, v9);
    uint64_t v11 = objc_msgSend(v6, "subarrayWithRange:", v9, objc_msgSend(v6, "count") - v9);
    id v12 = (id)sLogObject_0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v10 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v25 = v13;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Starting batch of %lu invalidation requests", buf, 0xCu);
    }

    id v14 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "Loading nonce data from server", buf, 2u);
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__VUIStoreFPSKeyLoader__invalidateValidKeyRequestsInBatches_completion___block_invoke;
    v18[3] = &unk_1E6DF4588;
    objc_copyWeak(&v22, &location);
    id v15 = v10;
    id v19 = v15;
    id v16 = v11;
    id v20 = v16;
    uint64_t v21 = v7;
    [(VUIStoreFPSKeyLoader *)self _loadNonceDataForRequests:v15 completion:v18];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v17 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "Done with all invalidation key request batches", buf, 2u);
    }
    if (v7) {
      v7[2](v7);
    }
  }
}

void __72__VUIStoreFPSKeyLoader__invalidateValidKeyRequestsInBatches_completion___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v18 = a1;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
        uint64_t v10 = [v9 secureInvalidationNonceData];
        uint64_t v11 = [v10 length];

        if (v11)
        {
          id v12 = [WeakRetained delegate];
          if ((objc_opt_respondsToSelector() & 1) != 0
            && ![v12 storeFPSKeyLoader:WeakRetained shouldKeyRequestContinueInvalidationAfterLoadingNonce:v9])
          {
            uint64_t v13 = sLogObject_0;
            if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v29 = (uint64_t)v9;
              _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Delegate disallowed invalidation after nonce retrieval for key request %@", buf, 0xCu);
            }
          }
          else
          {
            [v3 addObject:v9];
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v14 = [v4 countByEnumeratingWithState:&v24 objects:v30 count:16];
      uint64_t v6 = v14;
    }
    while (v14);
  }

  id v15 = (void *)sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v15;
    uint64_t v17 = [v3 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v29 = v17;
    _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "%lu request(s) have nonce data", buf, 0xCu);
  }
  if ([v3 count])
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__VUIStoreFPSKeyLoader__invalidateValidKeyRequestsInBatches_completion___block_invoke_40;
    v19[3] = &unk_1E6DF4538;
    id v20 = v3;
    id v21 = WeakRetained;
    id v22 = *(id *)(v18 + 40);
    id v23 = *(id *)(v18 + 48);
    [WeakRetained _generateSecureInvalidationDataForRequests:v20 completion:v19];
  }
  else
  {
    [WeakRetained _invalidateValidKeyRequestsInBatches:*(void *)(v18 + 40) completion:*(void *)(v18 + 48)];
  }
}

void __72__VUIStoreFPSKeyLoader__invalidateValidKeyRequestsInBatches_completion___block_invoke_40(id *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = a1[4];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = [v8 keyRequestData];
        uint64_t v10 = [v9 length];

        if (v10) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  uint64_t v11 = [v2 count];
  id v12 = a1[5];
  if (v11)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__VUIStoreFPSKeyLoader__invalidateValidKeyRequestsInBatches_completion___block_invoke_2;
    v13[3] = &unk_1E6DF4510;
    v13[4] = v12;
    id v14 = a1[6];
    id v15 = a1[7];
    [v12 _sendKeyRequestsToServer:v2 isStopRequest:1 isSecureInvalidationRequest:1 completion:v13];
  }
  else
  {
    [a1[5] _invalidateValidKeyRequestsInBatches:a1[6] completion:a1[7]];
  }
}

uint64_t __72__VUIStoreFPSKeyLoader__invalidateValidKeyRequestsInBatches_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateValidKeyRequestsInBatches:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_loadNonceDataForRequests:(id)a3 completion:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v35 = (void (**)(void))a4;
  id v7 = objc_alloc(MEMORY[0x1E4F29088]);
  val = self;
  uint64_t v8 = [(VUIStoreFPSKeyLoader *)self secureInvalidationNonceURL];
  uint64_t v9 = (void *)[v7 initWithURL:v8 resolvingAgainstBaseURL:0];

  uint64_t v37 = v9;
  uint64_t v10 = [v9 queryItems];
  uint64_t v11 = [v10 mutableCopy];

  id v39 = (id)v11;
  if (!v11) {
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  long long v51 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v48 = 0u;
  obuint64_t j = v6;
  uint64_t v12 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        id v16 = objc_alloc(MEMORY[0x1E4F290C8]);
        long long v17 = NSString;
        long long v18 = [v15 contentID];
        long long v19 = [v17 stringWithFormat:@"%@", v18];
        id v20 = (void *)[v16 initWithName:@"contentId" value:v19];

        if (v20) {
          [v39 addObject:v20];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v12);
  }

  [v37 setQueryItems:v39];
  uint64_t v21 = [v37 URL];
  if (v21)
  {
    objc_initWeak(&location, val);
    id v22 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v21];
    [v22 setHTTPMethod:@"GET"];
    id v23 = [(VUIStoreFPSKeyLoader *)val secureInvalidationDSID];
    long long v24 = [v23 stringValue];
    [v22 setValue:v24 forHTTPHeaderField:@"X-Secure-Invalidation-Dsid"];

    [v22 setTimeoutInterval:30.0];
    long long v25 = objc_msgSend(MEMORY[0x1E4F4DBD8], "vui_defaultBag");
    long long v26 = (void *)[objc_alloc(MEMORY[0x1E4F4DE68]) initWithBag:v25];
    [v26 setAnisetteType:2];
    long long v27 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    id v28 = objc_msgSend(v27, "ams_activeiTunesAccountForMediaType:", *MEMORY[0x1E4F4D9F8]);

    uint64_t v29 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = obj;
      _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "Waiting for account promise for nonce requests: %@", buf, 0xCu);
    }
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke;
    v40[3] = &unk_1E6DF4628;
    id v41 = obj;
    id v30 = v26;
    id v42 = v30;
    id v31 = v22;
    id v43 = v31;
    objc_copyWeak(&v46, &location);
    v44 = val;
    v45 = v35;
    [v28 addFinishBlock:v40];

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
  }
  else
  {
    v32 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v32, OS_LOG_TYPE_DEFAULT, "Unable to construct valid nonce URL", buf, 2u);
    }
    id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v34 = (void *)[v33 initWithDomain:*MEMORY[0x1E4FAA418] code:-345007 userInfo:0];
    [(VUIStoreFPSKeyLoader *)val _failKeyRequests:obj withError:v34];

    if (v35) {
      v35[2]();
    }
  }
}

void __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v8;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Account promise completed for nonce requests.  Waiting for URL request promise for nonce requests: %@", buf, 0xCu);
  }
  [*(id *)(a1 + 40) setAccount:v5];
  uint64_t v9 = [*(id *)(a1 + 40) requestByEncodingRequest:*(void *)(a1 + 48) parameters:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_55;
  v11[3] = &unk_1E6DF4600;
  id v12 = *(id *)(a1 + 32);
  objc_copyWeak(&v15, (id *)(a1 + 72));
  id v10 = *(id *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 56);
  id v14 = v10;
  [v9 addFinishBlock:v11];

  objc_destroyWeak(&v15);
}

void __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_55(id *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = a1[4];
    *(_DWORD *)buf = 138412802;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v5;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "URL request promise completed for nonce requests: %@ with URL request %@ error %@", buf, 0x20u);
  }
  if (!v5 || v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_2;
    block[3] = &unk_1E6DF45D8;
    int8x16_t v12 = *((int8x16_t *)a1 + 2);
    id v11 = (id)v12.i64[0];
    int8x16_t v14 = vextq_s8(v12, v12, 8uLL);
    id v15 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F4DE88] defaultSession];
    id v10 = [v9 dataTaskPromiseWithRequest:v5];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_57;
    v16[3] = &unk_1E6DF45B0;
    objc_copyWeak(&v19, a1 + 7);
    id v17 = a1[4];
    id v18 = a1[6];
    [v10 addFinishBlock:v16];

    objc_destroyWeak(&v19);
  }
}

void __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_57(id *a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v8 = [v5 data];
  uint64_t v9 = (void *)v8;
  if (v6 || !v8)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
      __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_57_cold_2();
    }
    [WeakRetained _failKeyRequests:a1[4] withError:v6];
  }
  else
  {
    id v54 = 0;
    id v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:&v54];
    id v36 = v54;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v33 = v10;
      long long v38 = WeakRetained;
      id v35 = v5;
      id v41 = objc_msgSend(v10, "vui_arrayForKey:", @"nonces");
      id v11 = (void *)sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        int8x16_t v12 = v11;
        uint64_t v13 = [v41 count];
        uint64_t v14 = [a1[4] count];
        *(_DWORD *)buf = 134218240;
        uint64_t v59 = v13;
        __int16 v60 = 2048;
        uint64_t v61 = v14;
        _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Received %lu nonce(s) for %lu request(s)s", buf, 0x16u);
      }
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v34 = a1;
      obuint64_t j = a1[4];
      uint64_t v42 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
      if (v42)
      {
        uint64_t v40 = *(void *)v51;
        uint64_t v37 = *MEMORY[0x1E4FAA418];
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v51 != v40) {
              objc_enumerationMutation(obj);
            }
            id v43 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            id v16 = [v43 contentID];
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v17 = v41;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v46 objects:v56 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v47;
              while (2)
              {
                for (uint64_t j = 0; j != v19; ++j)
                {
                  if (*(void *)v47 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  __int16 v22 = *(void **)(*((void *)&v46 + 1) + 8 * j);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v23 = v22;
                    __int16 v24 = objc_msgSend(v23, "vui_stringForKey:", @"content-id");
                    id v25 = v24;
                    if (v16 && v24 && ([v24 isEqualToString:v16] & 1) != 0)
                    {
                      uint64_t v26 = objc_msgSend(v23, "vui_stringForKey:", @"nonce");
                      long long v27 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v26 options:0];
                      [v43 setSecureInvalidationNonceData:v27];

                      goto LABEL_25;
                    }
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v46 objects:v56 count:16];
                if (v19) {
                  continue;
                }
                break;
              }
            }
LABEL_25:

            id v28 = [v43 secureInvalidationNonceData];
            uint64_t v29 = [v28 length];

            if (!v29)
            {
              uint64_t v55 = v43;
              id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
              id v31 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:v37 code:-345007 userInfo:0];
              [v38 _failKeyRequests:v30 withError:v31];
            }
          }
          uint64_t v42 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
        }
        while (v42);
      }

      id v6 = 0;
      id v5 = v35;
      id WeakRetained = v38;
      a1 = v34;
      id v10 = v33;
      v32 = v36;
    }
    else
    {
      v32 = v36;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
        __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_57_cold_1();
      }
      [WeakRetained _failKeyRequests:a1[4] withError:v36];
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_69;
  block[3] = &unk_1E6DF3DD0;
  id v45 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_69(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _failKeyRequests:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

- (void)_generateSecureInvalidationDataForFirstRequest:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([v6 count])
  {
    uint64_t v8 = [v6 firstObject];
    objc_initWeak(&location, self);
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FA9D50]) initWithContentKeyLoader:0 avAsset:0];
    [(VUIStoreFPSKeyLoader *)self setContentKeySession:v9];

    id v10 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v8;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Generating secure invalidation data for %@", buf, 0xCu);
    }
    id v11 = [(VUIStoreFPSKeyLoader *)self contentKeySession];
    int8x16_t v12 = [v8 offlineKeyData];
    uint64_t v13 = [v8 secureInvalidationNonceData];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82__VUIStoreFPSKeyLoader__generateSecureInvalidationDataForFirstRequest_completion___block_invoke;
    v16[3] = &unk_1E6DF4650;
    objc_copyWeak(&v20, &location);
    id v14 = v8;
    id v17 = v14;
    id v18 = v6;
    uint64_t v19 = v7;
    [v11 makeSecureInvalidationDataForOfflineKeyData:v12 nonceData:v13 completion:v16];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    id v15 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Done generating secure invalidation data", buf, 2u);
    }
    if (v7) {
      v7[2](v7);
    }
  }
}

void __82__VUIStoreFPSKeyLoader__generateSecureInvalidationDataForFirstRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ([v5 length])
  {
    [*(id *)(a1 + 32) setKeyRequestData:v5];
    uint64_t v8 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Secure invalidation data successfully generated for %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    [WeakRetained _failKeyRequests:v10 withError:v6];

    id v11 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
      __82__VUIStoreFPSKeyLoader__generateSecureInvalidationDataForFirstRequest_completion___block_invoke_cold_1((void *)(a1 + 32), (uint64_t)v6, v11);
    }
  }
  [WeakRetained setContentKeySession:0];
  int8x16_t v12 = objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 40), "count") - 1);
  [WeakRetained _generateSecureInvalidationDataForFirstRequest:v12 completion:*(void *)(a1 + 48)];
}

- (void)_initiateKeyRequests:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v11 firstObject];
  uint64_t v8 = [v7 contentID];

  if (v8)
  {
    uint64_t v9 = [v11 sortedArrayUsingComparator:&__block_literal_global_76];

    id v10 = (id)v9;
  }
  else
  {
    id v10 = v11;
  }
  id v12 = v10;
  [(VUIStoreFPSKeyLoader *)self _startKeyRequestsInBatches:v10 completion:v6];
}

uint64_t __56__VUIStoreFPSKeyLoader__initiateKeyRequests_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 contentID];
  id v6 = [v4 contentID];

  if (v5 && v6)
  {
    uint64_t v7 = [v5 compare:v6];
  }
  else
  {
    if (v6) {
      uint64_t v8 = -1;
    }
    else {
      uint64_t v8 = 0;
    }
    if (v5) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v8;
    }
  }

  return v7;
}

- (void)_startKeyRequestsInBatches:(id)a3 completion:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  id v36 = v5;
  if ([v5 count])
  {
    id v34 = v6;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obuint64_t j = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v45 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = [*(id *)(*((void *)&v44 + 1) + 8 * i) contentID];
          if (v11) {
            id v12 = (__CFString *)v11;
          }
          else {
            id v12 = &stru_1F3E921E0;
          }
          uint64_t v13 = objc_msgSend(v7, "objectForKey:", v12, v34, v36);
          id v14 = v13;
          if (v7)
          {
            uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v13, "unsignedIntegerValue") + 1);
          }
          else
          {
            uint64_t v15 = &unk_1F3F3C3B0;
          }

          [v7 setObject:v15 forKey:v12];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
      }
      while (v8);
    }

    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([obj count])
    {
      unint64_t v17 = 0;
      do
      {
        id v18 = objc_msgSend(obj, "objectAtIndex:", v17, v34);
        uint64_t v19 = [v18 contentID];
        if (v19) {
          id v20 = (__CFString *)v19;
        }
        else {
          id v20 = &stru_1F3E921E0;
        }
        id v21 = [v7 objectForKey:v20];
        uint64_t v22 = [v21 integerValue];

        if (v22)
        {
          if ((unint64_t)([v16 count] + v22) < 0x15)
          {
            uint64_t v24 = objc_msgSend(obj, "subarrayWithRange:", v17, v22);
            [v16 addObjectsFromArray:v24];

            v17 += v22;
          }
          else
          {
            if (v17)
            {

              break;
            }
            id v23 = objc_msgSend(obj, "subarrayWithRange:", 0, 20);
            [v16 addObjectsFromArray:v23];

            unint64_t v17 = 20;
          }
        }
        else
        {
          ++v17;
        }
      }
      while (v17 < [obj count]);
    }
    uint64_t v26 = objc_msgSend(v16, "count", v34);
    if (!v26)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
        -[VUIStoreFPSKeyLoader _startKeyRequestsInBatches:completion:]();
      }
      unint64_t v27 = [obj count];
      if (v27 >= 0x14) {
        uint64_t v26 = 20;
      }
      else {
        uint64_t v26 = v27;
      }
      id v28 = objc_msgSend(obj, "subarrayWithRange:", 0, v26);
      uint64_t v29 = [v28 mutableCopy];

      id v16 = (id)v29;
    }
    id v30 = objc_msgSend(obj, "subarrayWithRange:", v26, objc_msgSend(obj, "count") - v26);
    objc_initWeak(&location, self);
    id v31 = (id)sLogObject_0;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = [v16 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v49 = v32;
      _os_log_impl(&dword_1E2BD7000, v31, OS_LOG_TYPE_DEFAULT, "Starting batch of %lu key requests", buf, 0xCu);
    }

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __62__VUIStoreFPSKeyLoader__startKeyRequestsInBatches_completion___block_invoke;
    v39[3] = &unk_1E6DF43D0;
    objc_copyWeak(&v42, &location);
    id v33 = v30;
    id v40 = v33;
    id v41 = v35;
    [(VUIStoreFPSKeyLoader *)self _startKeyRequests:v16 completion:v39];

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);

    id v6 = (void (**)(void))v35;
  }
  else
  {
    id v25 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "Done with all key request batches", buf, 2u);
    }
    if (v6) {
      v6[2](v6);
    }
  }
}

void __62__VUIStoreFPSKeyLoader__startKeyRequestsInBatches_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _startKeyRequestsInBatches:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)_startKeyRequests:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v22 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v13 = [v12 keyIdentifier];
        id v14 = [(VUIStoreFPSKeyLoader *)self keyIdentifierPenaltyBox];
        uint64_t v15 = [v14 objectForKey:v13];

        if (v13) {
          BOOL v16 = v15 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (v16)
        {
          [v7 addObject:v12];
        }
        else
        {
          unint64_t v17 = sLogObject_0;
          if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v33 = v12;
            _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "Automatically failing key request %@ since it is in the penalty box", buf, 0xCu);
          }
          id v31 = v12;
          uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
          [(VUIStoreFPSKeyLoader *)self _failKeyRequests:v19 withError:v15];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v9);
  }

  objc_initWeak((id *)buf, self);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __53__VUIStoreFPSKeyLoader__startKeyRequests_completion___block_invoke;
  v23[3] = &unk_1E6DF43D0;
  objc_copyWeak(&v26, (id *)buf);
  id v20 = v7;
  id v24 = v20;
  id v21 = v22;
  id v25 = v21;
  [(VUIStoreFPSKeyLoader *)self _generateKeyRequestDataForKeyRequests:v20 completion:v23];

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

void __53__VUIStoreFPSKeyLoader__startKeyRequests_completion___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v17 = a1;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    uint64_t v18 = *MEMORY[0x1E4FAA418];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v9, "isCancelled", v17))
        {
          uint64_t v10 = sLogObject_0;
          if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v9;
            _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Stopping further key loading since request is cancelled or failed: %@", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v11 = [v9 keyRequestData];
          uint64_t v12 = [v11 length];

          if (v12)
          {
            [v3 addObject:v9];
          }
          else
          {
            uint64_t v13 = [v9 error];
            if (!v13) {
              uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:v18 code:-345007 userInfo:0];
            }
            id v25 = v9;
            id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
            [WeakRetained _failKeyRequests:v14 withError:v13];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v26 count:16];
    }
    while (v6);
  }

  uint64_t v15 = [v3 count];
  uint64_t v16 = *(void *)(v17 + 40);
  if (v15)
  {
    [WeakRetained _sendKeyRequestsToServer:v3 isStopRequest:0 isSecureInvalidationRequest:0 completion:v16];
  }
  else if (v16)
  {
    (*(void (**)(void))(v16 + 16))(*(void *)(v17 + 40));
  }
}

- (void)_generateKeyRequestDataForKeyRequests:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v24 = a4;
  group = dispatch_group_create();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        char v11 = [v10 isCancelled];
        uint64_t v12 = sLogObject_0;
        BOOL v13 = os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT);
        if (v11)
        {
          if (v13)
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v37 = v10;
            _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Stopping further key loading since request is cancelled or failed: %@", buf, 0xCu);
          }
        }
        else
        {
          if (v13)
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v37 = v10;
            _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Generating key request data for %@", buf, 0xCu);
          }
          id v14 = [(VUIStoreFPSKeyLoader *)self eventCollection];
          uint64_t v15 = *MEMORY[0x1E4FAA2F8];
          uint64_t v16 = NSString;
          uint64_t v17 = [v10 eventReportingID];
          uint64_t v18 = [v16 stringWithFormat:@"%@%@", v15, v17];
          [v14 addStartEventWithName:v15 identifier:v18];

          long long v19 = [v10 keyIdentifier];
          long long v20 = [v19 absoluteString];
          long long v21 = [v20 dataUsingEncoding:4];

          objc_initWeak((id *)buf, self);
          dispatch_group_enter(group);
          long long v22 = [(VUIStoreFPSKeyLoader *)self certificateData];
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __73__VUIStoreFPSKeyLoader__generateKeyRequestDataForKeyRequests_completion___block_invoke;
          v29[3] = &unk_1E6DF4698;
          objc_copyWeak(&v31, (id *)buf);
          v29[4] = v10;
          long long v30 = group;
          [v10 makeKeyRequestDataForCertificateData:v22 assetIDData:v21 completion:v29];

          objc_destroyWeak(&v31);
          objc_destroyWeak((id *)buf);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v7);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__VUIStoreFPSKeyLoader__generateKeyRequestDataForKeyRequests_completion___block_invoke_82;
  block[3] = &unk_1E6DF3DD0;
  id v28 = v24;
  id v23 = v24;
  dispatch_group_notify(group, MEMORY[0x1E4F14428], block);
}

void __73__VUIStoreFPSKeyLoader__generateKeyRequestDataForKeyRequests_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (id *)(a1 + 48);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v9 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Key request data generated for %@", buf, 0xCu);
  }
  char v11 = [WeakRetained eventCollection];
  uint64_t v12 = *MEMORY[0x1E4FAA2F8];
  BOOL v13 = NSString;
  id v14 = [*(id *)(a1 + 32) eventReportingID];
  uint64_t v15 = [v13 stringWithFormat:@"%@%@", v12, v14];
  [v11 addEndEventWithName:v12 identifier:v15];

  [*(id *)(a1 + 32) setKeyRequestData:v7];
  [*(id *)(a1 + 32) setError:v6];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __73__VUIStoreFPSKeyLoader__generateKeyRequestDataForKeyRequests_completion___block_invoke_82(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_sendKeyRequestsToServer:(id)a3 isStopRequest:(BOOL)a4 isSecureInvalidationRequest:(BOOL)a5 completion:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v29 = a6;
  long long v30 = [MEMORY[0x1E4F1C9C8] date];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(obj);
        }
        BOOL v13 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if ((![v13 type] || objc_msgSend(v13, "type") == 1) && !a4)
        {
          id v14 = [(VUIStoreFPSKeyLoader *)self savedStreamingKeyRequestToUseForStopping];
          BOOL v15 = v14 == 0;

          if (v15) {
            [(VUIStoreFPSKeyLoader *)self setSavedStreamingKeyRequestToUseForStopping:v13];
          }
        }
        uint64_t v16 = [(VUIStoreFPSKeyLoader *)self eventCollection];
        uint64_t v17 = *MEMORY[0x1E4FAA320];
        uint64_t v18 = NSString;
        long long v19 = [v13 eventReportingID];
        long long v20 = [v18 stringWithFormat:@"%@%@", v17, v19];
        [v16 addStartEventWithName:v17 identifier:v20];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v10);
  }

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke;
  aBlock[3] = &unk_1E6DF4760;
  id v21 = obj;
  id v37 = v21;
  long long v38 = self;
  id v22 = v30;
  id v39 = v22;
  BOOL v42 = a4;
  BOOL v43 = a5;
  objc_copyWeak(&v41, &location);
  id v23 = v29;
  id v40 = v23;
  id v24 = _Block_copy(aBlock);
  BOOL v25 = [(VUIStoreFPSKeyLoader *)self sendsLocationWhenOptedIn];
  id v26 = sLogObject_0;
  BOOL v27 = os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v26, OS_LOG_TYPE_DEFAULT, "Fetching location authorization status", buf, 2u);
    }
    id v28 = [MEMORY[0x1E4FB50C8] defaultLocationManager];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_96;
    v33[3] = &unk_1E6DF47B0;
    id v34 = v24;
    [v28 fetchAuthorizationStatus:v33];
  }
  else
  {
    if (v27)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v26, OS_LOG_TYPE_DEFAULT, "Skipping location authorization status fetch", buf, 2u);
    }
    (*((void (**)(void *, uint64_t))v24 + 2))(v24, -1);
  }

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

void __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v2)
  {
    uint64_t v39 = *(void *)v53;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v53 != v39) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v52 + 1) + 8 * v3);
        uint64_t v5 = [*(id *)(a1 + 40) eventCollection];
        uint64_t v6 = *MEMORY[0x1E4FAA320];
        id v7 = NSString;
        uint64_t v8 = [v4 eventReportingID];
        id v9 = [v7 stringWithFormat:@"%@%@", v6, v8];
        [v5 addEndEventWithName:v6 identifier:v9];

        [v4 setServerRequestStartDate:*(void *)(a1 + 48)];
        uint64_t v10 = [*(id *)(a1 + 40) eventCollection];
        uint64_t v11 = *MEMORY[0x1E4FAA300];
        uint64_t v12 = NSString;
        BOOL v13 = [v4 eventReportingID];
        id v14 = [v12 stringWithFormat:@"%@%@", v11, v13];
        [v10 addStartEventWithName:v11 identifier:v14];

        ++v3;
      }
      while (v2 != v3);
      uint64_t v2 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v2);
  }

  BOOL v15 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 72)) {
      uint64_t v17 = @"stop ";
    }
    else {
      uint64_t v17 = &stru_1F3E921E0;
    }
    *(_DWORD *)buf = 138412546;
    long long v57 = v17;
    __int16 v58 = 2112;
    uint64_t v59 = v16;
    _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Sending %@requests to server: %@", buf, 0x16u);
  }
  uint64_t v18 = [*(id *)(a1 + 40) _bodyDictionaryForRequests:*(void *)(a1 + 32) isStopRequest:*(unsigned __int8 *)(a1 + 72) locationAuthorizationStatus:a2];
  id v19 = objc_alloc(MEMORY[0x1E4F28E88]);
  long long v20 = [*(id *)(a1 + 40) keyServerURL];
  id v21 = (void *)[v19 initWithURL:v20];

  [v21 setHTTPMethod:@"POST"];
  [v21 setTimeoutInterval:30.0];
  if (*(unsigned char *)(a1 + 73))
  {
    id v22 = [*(id *)(a1 + 40) secureInvalidationDSID];
    id v23 = v22;
    if (v22)
    {
      id v24 = [v22 stringValue];
      [v21 setValue:v24 forHTTPHeaderField:@"X-Secure-Invalidation-Dsid"];
    }
  }
  BOOL v25 = objc_msgSend(MEMORY[0x1E4F4DBD8], "vui_defaultBag");
  id v26 = (void *)[objc_alloc(MEMORY[0x1E4F4DE68]) initWithBag:v25];
  char v27 = [*(id *)(a1 + 40) sendsMescalHeader];
  [v26 setRequestEncoding:3];
  [v26 setMescalType:0];
  id v28 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v29 = objc_msgSend(v28, "ams_activeiTunesAccountForMediaType:", *MEMORY[0x1E4F4D9F8]);

  long long v30 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    id v31 = *(__CFString **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    long long v57 = v31;
    _os_log_impl(&dword_1E2BD7000, v30, OS_LOG_TYPE_DEFAULT, "Waiting for account promise for key requests: %@", buf, 0xCu);
  }
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_89;
  v41[3] = &unk_1E6DF4738;
  id v42 = *(id *)(a1 + 32);
  id v32 = v26;
  id v43 = v32;
  id v33 = v21;
  id v44 = v33;
  id v34 = v18;
  id v45 = v34;
  char v50 = v27;
  id v35 = v25;
  id v46 = v35;
  objc_copyWeak(&v49, (id *)(a1 + 64));
  __int16 v51 = *(_WORD *)(a1 + 72);
  id v36 = *(id *)(a1 + 56);
  uint64_t v47 = *(void *)(a1 + 40);
  id v48 = v36;
  [v29 addFinishBlock:v41];

  objc_destroyWeak(&v49);
}

void __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v8;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Account promise completed for key requests.  Waiting for URL request promise for key requests: %@", buf, 0xCu);
  }
  [*(id *)(a1 + 40) setAccount:v5];
  id v9 = [*(id *)(a1 + 40) requestByEncodingRequest:*(void *)(a1 + 48) parameters:*(void *)(a1 + 56)];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_90;
  v11[3] = &unk_1E6DF4710;
  id v12 = *(id *)(a1 + 32);
  char v17 = *(unsigned char *)(a1 + 96);
  id v13 = *(id *)(a1 + 64);
  objc_copyWeak(&v16, (id *)(a1 + 88));
  __int16 v18 = *(_WORD *)(a1 + 97);
  id v10 = *(id *)(a1 + 80);
  uint64_t v14 = *(void *)(a1 + 72);
  id v15 = v10;
  [v9 addFinishBlock:v11];

  objc_destroyWeak(&v16);
}

void __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_90(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v29 = v8;
    __int16 v30 = 2112;
    id v31 = v5;
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "URL request promise completed for key requests: %@ with URL request %@ error %@", buf, 0x20u);
  }
  if (!v5 || v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_3;
    block[3] = &unk_1E6DF4538;
    void block[4] = *(void *)(a1 + 48);
    id v19 = *(id *)(a1 + 32);
    id v20 = v6;
    id v21 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (*(unsigned char *)(a1 + 72))
    {
      id v9 = [v5 HTTPBody];
      if (v9)
      {
        uint64_t v10 = *(void *)(a1 + 40);
        id v27 = 0;
        uint64_t v11 = [MEMORY[0x1E4F4DD50] signatureFromData:v9 type:1 bag:v10 error:&v27];
        id v12 = v27;
        id v13 = sLogObject_0;
        if (v11)
        {
          if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Manually adding mescal signature header to request", buf, 2u);
          }
          uint64_t v14 = [v11 base64EncodedStringWithOptions:0];
          [v5 setValue:v14 forHTTPHeaderField:*MEMORY[0x1E4F4DA68]];
        }
        else if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
        {
          __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_90_cold_2();
        }
      }
      else if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
      {
        __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_90_cold_1();
      }
    }
    else
    {
      id v15 = sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Not sending mescal header", buf, 2u);
      }
    }
    id v16 = [MEMORY[0x1E4F4DE88] defaultSession];
    char v17 = [v16 dataTaskPromiseWithRequest:v5];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_92;
    v22[3] = &unk_1E6DF46E8;
    objc_copyWeak(&v25, (id *)(a1 + 64));
    id v23 = *(id *)(a1 + 32);
    __int16 v26 = *(_WORD *)(a1 + 73);
    id v24 = *(id *)(a1 + 56);
    [v17 addFinishBlock:v22];

    objc_destroyWeak(&v25);
  }
}

void __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_2;
  v10[3] = &unk_1E6DF46C0;
  objc_copyWeak(&v15, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 32);
  __int16 v16 = *(_WORD *)(a1 + 56);
  id v11 = v7;
  id v12 = v5;
  id v13 = v6;
  id v14 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v15);
}

void __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v17 = a1;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v8 = [WeakRetained eventCollection];
        uint64_t v9 = *MEMORY[0x1E4FAA300];
        uint64_t v10 = NSString;
        id v11 = [v7 eventReportingID];
        id v12 = [v10 stringWithFormat:@"%@%@", v9, v11];
        [v8 addEndEventWithName:v9 identifier:v12];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
  }

  if (*(unsigned char *)(v17 + 72) && !*(unsigned char *)(v17 + 73))
  {
    uint64_t v16 = *(void *)(v17 + 56);
    if (v16) {
      (*(void (**)(void))(v16 + 16))();
    }
  }
  else
  {
    id v13 = [*(id *)(v17 + 40) data];
    id v14 = [*(id *)(v17 + 40) response];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = [*(id *)(v17 + 40) response];
    }
    else
    {
      id v15 = 0;
    }

    [WeakRetained _handleResponseForKeyRequests:*(void *)(v17 + 32) responseData:v13 URLResponse:v15 error:*(void *)(v17 + 48) completion:*(void *)(v17 + 56)];
  }
}

uint64_t __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _failKeyRequests:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_96(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  uint64_t v4 = __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_2_97;
  uint64_t v5 = &unk_1E6DF4788;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = a2;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v3[0], 3221225472)) {
    v4((uint64_t)v3);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v3);
  }
}

uint64_t __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_2_97(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)_handleResponseForKeyRequests:(id)a3 responseData:(id)a4 URLResponse:(id)a5 error:(id)a6 completion:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(void))a7;
  uint64_t v17 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v12;
    _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "Received response for requests: %@", buf, 0xCu);
  }
  __int16 v18 = [v14 allHeaderFields];
  uint64_t v19 = objc_msgSend(v18, "tvp_appleTimingAppHeaderValue");

  if (v19 >= 1)
  {
    long long v20 = [(VUIStoreFPSKeyLoader *)self eventCollection];
    uint64_t v21 = *MEMORY[0x1E4FAA308];
    long long v22 = [MEMORY[0x1E4F28ED0] numberWithInteger:v19];
    [v20 addSingleShotEventWithName:v21 value:v22];
  }
  if (v14) {
    uint64_t v23 = [v14 statusCode];
  }
  else {
    uint64_t v23 = WLKHTTPStatusCodeForAMSError();
  }
  uint64_t v24 = v23;
  if (v23 != 200)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
      -[VUIStoreFPSKeyLoader _handleResponseForKeyRequests:responseData:URLResponse:error:completion:]();
    }
    if ((v24 & 0xFFFFFFFFFFFFFFFDLL) == 0x191) {
      goto LABEL_20;
    }
  }
  if (!v13)
  {
    [(VUIStoreFPSKeyLoader *)self _failKeyRequests:v12 withError:v15];
    goto LABEL_21;
  }
  if (![v13 length])
  {
LABEL_20:
    __int16 v30 = TVPSKDErrorWithCode();
    [(VUIStoreFPSKeyLoader *)self _failKeyRequests:v12 withError:v30];

LABEL_21:
    char v29 = 0;
    if (!v16) {
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  id v34 = 0;
  id v25 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v13 options:0 error:&v34];
  id v33 = v34;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v26 = objc_msgSend(v25, "vui_dictionaryForKey:", @"fairplay-streaming-response");
    __int16 v32 = objc_msgSend(v26, "vui_numberForKey:", @"version");
    id v27 = objc_msgSend(v26, "vui_arrayForKey:", @"streaming-keys");
    id v28 = v27;
    if (v26 && v32 && [v27 count])
    {
      [(VUIStoreFPSKeyLoader *)self _handleResponseDicts:v28 forKeyRequests:v12 completion:v16];
      char v29 = 1;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
        -[VUIStoreFPSKeyLoader _handleResponseForKeyRequests:responseData:URLResponse:error:completion:]();
      }
      id v31 = TVPSKDErrorWithCode();
      [(VUIStoreFPSKeyLoader *)self _failKeyRequests:v12 withError:v31];

      char v29 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
      -[VUIStoreFPSKeyLoader _handleResponseForKeyRequests:responseData:URLResponse:error:completion:]();
    }
    __int16 v26 = TVPSKDErrorWithCode();
    [(VUIStoreFPSKeyLoader *)self _failKeyRequests:v12 withError:v26];
    char v29 = 0;
  }

  if (v16)
  {
LABEL_31:
    if ((v29 & 1) == 0) {
      v16[2](v16);
    }
  }
LABEL_33:
}

- (void)_handleResponseDicts:(id)a3 forKeyRequests:(id)a4 completion:(id)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  if ([v9 count])
  {
    id v11 = [v9 firstObject];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __71__VUIStoreFPSKeyLoader__handleResponseDicts_forKeyRequests_completion___block_invoke;
    v23[3] = &unk_1E6DF47D8;
    id v12 = v11;
    id v24 = v12;
    uint64_t v13 = [v8 indexOfObjectPassingTest:v23];
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
        -[VUIStoreFPSKeyLoader _handleResponseDicts:forKeyRequests:completion:]();
      }
      v25[0] = v12;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      id v15 = TVPSKDErrorWithCode();
      [(VUIStoreFPSKeyLoader *)self _failKeyRequests:v14 withError:v15];

      uint64_t v16 = objc_msgSend(v9, "subarrayWithRange:", 1, objc_msgSend(v9, "count") - 1);
      [(VUIStoreFPSKeyLoader *)self _handleResponseDicts:v8 forKeyRequests:v16 completion:v10];
    }
    else
    {
      uint64_t v16 = [v8 objectAtIndex:v13];
      objc_initWeak(&location, self);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      void v17[2] = __71__VUIStoreFPSKeyLoader__handleResponseDicts_forKeyRequests_completion___block_invoke_111;
      v17[3] = &unk_1E6DF4588;
      objc_copyWeak(&v21, &location);
      id v18 = v8;
      id v19 = v9;
      long long v20 = v10;
      [(VUIStoreFPSKeyLoader *)self _handleResponseDict:v16 forKeyRequest:v12 completion:v17];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
  else if (v10)
  {
    v10[2](v10);
  }
}

uint64_t __71__VUIStoreFPSKeyLoader__handleResponseDicts_forKeyRequests_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
      __71__VUIStoreFPSKeyLoader__handleResponseDicts_forKeyRequests_completion___block_invoke_cold_2();
    }
    goto LABEL_10;
  }
  uint64_t v4 = objc_msgSend(v3, "vui_numberForKey:", @"id");
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
      __71__VUIStoreFPSKeyLoader__handleResponseDicts_forKeyRequests_completion___block_invoke_cold_1();
    }
    goto LABEL_9;
  }
  uint64_t v5 = [*(id *)(a1 + 32) requestID];
  if (v5 != [v4 unsignedIntegerValue])
  {
LABEL_9:

LABEL_10:
    uint64_t v6 = 0;
    goto LABEL_11;
  }

  uint64_t v6 = 1;
LABEL_11:

  return v6;
}

void __71__VUIStoreFPSKeyLoader__handleResponseDicts_forKeyRequests_completion___block_invoke_111(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 40), "count") - 1);
  [WeakRetained _handleResponseDicts:v2 forKeyRequests:v3 completion:*(void *)(a1 + 48)];
}

- (void)_handleResponseDict:(id)a3 forKeyRequest:(id)a4 completion:(id)a5
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  id v11 = objc_msgSend(v8, "vui_numberForKey:", @"status");
  id v12 = v11;
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
      -[VUIStoreFPSKeyLoader _handleResponseDict:forKeyRequest:completion:]();
    }
    id v88 = v9;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
    v81 = TVPSKDErrorWithCode();
    [(VUIStoreFPSKeyLoader *)self _failKeyRequests:v16 withError:v81];
    goto LABEL_9;
  }
  uint64_t v13 = [v11 integerValue];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
      -[VUIStoreFPSKeyLoader _handleResponseDict:forKeyRequest:completion:]((uint64_t)v9, v14, v15);
    }
    uint64_t v16 = objc_msgSend(v8, "vui_numberForKey:", @"device-limit");
    id v89 = v9;
    v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
    uint64_t v17 = [(VUIStoreFPSKeyLoader *)self _errorForStoreResponseStatus:v14 deviceLimit:v16];
    [(VUIStoreFPSKeyLoader *)self _failKeyRequests:v81 withError:v17];

LABEL_9:
    char v18 = 0;
    goto LABEL_71;
  }
  uint64_t v16 = objc_msgSend(v8, "vui_stringForKey:", @"ckc");
  if ([v16 length] || objc_msgSend(v9, "type") == 3)
  {
    if ([v16 length]) {
      v81 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v16 options:1];
    }
    else {
      v81 = 0;
    }
    v79 = objc_msgSend(v8, "vui_numberForKey:", @"renew-after");
    v76 = objc_msgSend(v8, "vui_numberForKey:", @"expiration-time");
    v75 = objc_msgSend(v8, "vui_numberForKey:", @"availability-ending-time");
    uint64_t v74 = objc_msgSend(v8, "vui_numberForKey:", @"playback-start-time");
    v72 = objc_msgSend(v8, "vui_stringForKey:", @"content-id");
    uint64_t v19 = objc_msgSend(v8, "vui_BOOLForKey:defaultValue:", @"is-low-value", 0);
    v78 = objc_msgSend(v8, "vui_numberForKey:", @"playback-duration");
    uint64_t v20 = objc_msgSend(v8, "vui_BOOLForKey:defaultValue:", @"allow-manual-renewal", 0);
    v71 = objc_msgSend(v8, "vui_dictionaryForKey:", @"extra-server-parameters");
    v77 = objc_msgSend(v8, "vui_stringForKey:", @"offline-key-renewal-policy");
    v73 = objc_msgSend(v8, "vui_stringForKey:", @"stkn");
    id v21 = [(VUIStoreFPSKeyLoader *)self savedStreamingKeyRequestToUseForStopping];

    if (v21 && v73)
    {
      long long v22 = [(VUIStoreFPSKeyLoader *)self savedStreamingKeyRequestToUseForStopping];
      uint64_t v23 = [v22 userInfo];
      [v23 setObject:v73 forKey:@"stkn"];
    }
    [v9 setContentID:v72];
    [v9 setIsLowValueKey:v19];
    [v9 setAllowManualRenewal:v20];
    [v9 setAdditionalRequestParamsFromResponse:v71];
    if (v79)
    {
      id v24 = [v9 serverRequestStartDate];
      id v25 = v24;
      if (v24)
      {
        id v26 = v24;
      }
      else
      {
        id v26 = [MEMORY[0x1E4F1C9C8] date];
      }
      id v27 = v26;

      [v79 doubleValue];
      objc_msgSend(v27, "dateByAddingTimeInterval:");
      double v28 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      char v29 = sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v92 = v28;
        _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "Key renewal date: %@", buf, 0xCu);
      }
      [v9 setRenewalDate:*(void *)&v28];
      [v9 setRenewalInterval:v79];
    }
    if (v76)
    {
      id v30 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v76 doubleValue];
      double v32 = COERCE_DOUBLE([v30 initWithTimeIntervalSince1970:v31 / 1000.0]);
      if (v32 != 0.0)
      {
        [(VUIStoreFPSKeyLoader *)self downloadExpirationPeriodOverrideInSeconds];
        double v34 = v33;
        if (v33 > 0.0)
        {
          id v35 = sLogObject_0;
          if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            double v92 = v34;
            _os_log_impl(&dword_1E2BD7000, v35, OS_LOG_TYPE_DEFAULT, "Overriding key expiration to %.0f seconds from now", buf, 0xCu);
          }
          uint64_t v36 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v34];

          double v32 = *(double *)&v36;
        }
      }
      uint64_t v37 = sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v92 = v32;
        _os_log_impl(&dword_1E2BD7000, v37, OS_LOG_TYPE_DEFAULT, "Key expiration date: %@", buf, 0xCu);
      }
      [v9 setExpirationDate:*(void *)&v32];
      long long v38 = [(VUIStoreFPSKeyLoader *)self keyExpirationDate];
      int v39 = [*(id *)&v32 isEqualToDate:v38];

      if ((v39 & 1) == 0) {
        [(VUIStoreFPSKeyLoader *)self setKeyExpirationDate:*(void *)&v32];
      }

      int v70 = v39 ^ 1;
    }
    else
    {
      int v70 = 0;
    }
    if (v75)
    {
      id v40 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v75 doubleValue];
      double v41 = COERCE_DOUBLE(objc_msgSend(v40, "initWithTimeIntervalSince1970:"));
      [(VUIStoreFPSKeyLoader *)self availabilityPeriodOverrideInSeconds];
      double v43 = v42;
      if (v42 > 0.0)
      {
        id v44 = sLogObject_0;
        if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          double v92 = v43;
          _os_log_impl(&dword_1E2BD7000, v44, OS_LOG_TYPE_DEFAULT, "Overriding availability end to %.0f seconds from now", buf, 0xCu);
        }
        uint64_t v45 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v43];

        double v41 = *(double *)&v45;
      }
      id v46 = sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v92 = v41;
        _os_log_impl(&dword_1E2BD7000, v46, OS_LOG_TYPE_DEFAULT, "Availability end date: %@", buf, 0xCu);
      }
      [v9 setAvailabilityEndDate:*(void *)&v41];
    }
    if (v74)
    {
      id v47 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v74 doubleValue];
      double v49 = COERCE_DOUBLE([v47 initWithTimeIntervalSince1970:v48 / 1000.0]);
      char v50 = sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v92 = v49;
        _os_log_impl(&dword_1E2BD7000, v50, OS_LOG_TYPE_DEFAULT, "Rental playback start date: %@", buf, 0xCu);
      }
      __int16 v51 = [(VUIStoreFPSKeyLoader *)self rentalPlaybackStartDate];
      int v52 = [*(id *)&v49 isEqualToDate:v51];

      if ((v52 & 1) == 0) {
        [(VUIStoreFPSKeyLoader *)self setRentalPlaybackStartDate:*(void *)&v49];
      }

      int v53 = v52 ^ 1;
    }
    else
    {
      int v53 = 0;
    }
    if (v78)
    {
      long long v54 = (void *)sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        long long v55 = v54;
        [v78 doubleValue];
        *(_DWORD *)buf = 134217984;
        double v92 = v56;
        _os_log_impl(&dword_1E2BD7000, v55, OS_LOG_TYPE_DEFAULT, "Playback duration: %f", buf, 0xCu);
      }
      [v9 setPlaybackDuration:v78];
    }
    if ([v77 isEqualToString:@"auto"])
    {
      uint64_t v57 = 1;
    }
    else if ([v77 isEqualToString:@"manual"])
    {
      uint64_t v57 = 2;
    }
    else if ([v77 isEqualToString:@"no-renew"])
    {
      uint64_t v57 = 3;
    }
    else
    {
      uint64_t v57 = 0;
    }
    [v9 setOfflineKeyRenewalPolicy:v57];
    if ((v70 | v53) == 1)
    {
      __int16 v58 = [(VUIStoreFPSKeyLoader *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v59 = [(VUIStoreFPSKeyLoader *)self keyExpirationDate];
        __int16 v60 = [(VUIStoreFPSKeyLoader *)self rentalPlaybackStartDate];
        [v58 storeFPSKeyLoader:self didReceiveUpdatedRentalExpirationDate:v59 playbackStartDate:v60];
      }
    }
    uint64_t v61 = [(VUIStoreFPSKeyLoader *)self eventCollection];
    uint64_t v62 = *MEMORY[0x1E4FAA2F0];
    long long v63 = NSString;
    long long v64 = [v9 eventReportingID];
    v65 = [v63 stringWithFormat:@"%@%@", v62, v64];
    [v61 addEndEventWithName:v62 identifier:v65];

    v66 = [MEMORY[0x1E4F1C9C8] date];
    [v9 setRequestEndDate:v66];

    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__VUIStoreFPSKeyLoader__handleResponseDict_forKeyRequest_completion___block_invoke;
    aBlock[3] = &unk_1E6DF4800;
    objc_copyWeak(&v87, (id *)buf);
    id v67 = v9;
    id v85 = v67;
    v86 = v10;
    long long v68 = _Block_copy(aBlock);
    if ([v67 type] == 2)
    {
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __69__VUIStoreFPSKeyLoader__handleResponseDict_forKeyRequest_completion___block_invoke_160;
      v82[3] = &unk_1E6DF4498;
      id v83 = v68;
      [v67 offlineKeyDataFromServerKeyData:v81 completion:v82];
    }
    else
    {
      (*((void (**)(void *, void *, void))v68 + 2))(v68, v81, 0);
    }

    objc_destroyWeak(&v87);
    objc_destroyWeak((id *)buf);

    char v18 = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
      -[VUIStoreFPSKeyLoader _handleResponseDict:forKeyRequest:completion:]();
    }
    id v90 = v9;
    v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
    v80 = TVPSKDErrorWithCode();
    [(VUIStoreFPSKeyLoader *)self _failKeyRequests:v81 withError:v80];
    char v18 = 0;
  }
LABEL_71:

  if (v10) {
    char v69 = v18;
  }
  else {
    char v69 = 1;
  }
  if ((v69 & 1) == 0) {
    v10[2](v10);
  }
}

void __69__VUIStoreFPSKeyLoader__handleResponseDict_forKeyRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [*(id *)(a1 + 32) setKeyResponseData:v5];
  if ([*(id *)(a1 + 32) type] == 2 && objc_msgSend(v5, "length"))
  {
    id v8 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 storeFPSKeyLoader:WeakRetained didLoadOfflineKeyData:v5 forKeyRequest:*(void *)(a1 + 32)];
    }
  }
  if ([v5 length] || objc_msgSend(*(id *)(a1 + 32), "type") == 3)
  {
    id v9 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v9 storeFPSKeyLoader:WeakRetained willSucceedForKeyRequest:*(void *)(a1 + 32)];
    }
    [*(id *)(a1 + 32) finish];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR)) {
      __69__VUIStoreFPSKeyLoader__handleResponseDict_forKeyRequest_completion___block_invoke_cold_1();
    }
    v11[0] = *(void *)(a1 + 32);
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [WeakRetained _failKeyRequests:v9 withError:v6];
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

uint64_t __69__VUIStoreFPSKeyLoader__handleResponseDict_forKeyRequest_completion___block_invoke_160(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_errorForStoreResponseStatus:(int64_t)a3 deviceLimit:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = v5;
  switch(a3)
  {
    case -1017:
    case -1016:
    case -1013:
    case -1009:
    case -1008:
    case -1002:
      goto LABEL_12;
    case -1015:
      if (v5)
      {
        uint64_t v18 = *MEMORY[0x1E4FAA410];
        id v19 = v5;
        uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      }
      else
      {
        uint64_t v7 = 0;
      }
      id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v15 = *MEMORY[0x1E4FAA418];
      uint64_t v16 = -345026;
      goto LABEL_19;
    case -1014:
      if (v5)
      {
        uint64_t v20 = *MEMORY[0x1E4FAA410];
        id v21 = v5;
        uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      }
      else
      {
        uint64_t v7 = 0;
      }
      id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v15 = *MEMORY[0x1E4FAA418];
      uint64_t v16 = -345025;
      goto LABEL_19;
    case -1012:
    case -1011:
    case -1010:
    case -1007:
    case -1006:
    case -1005:
    case -1003:
      goto LABEL_5;
    case -1004:
      if (v5)
      {
        uint64_t v22 = *MEMORY[0x1E4FAA410];
        v23[0] = v5;
        uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      }
      else
      {
        uint64_t v7 = 0;
      }
      id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v15 = *MEMORY[0x1E4FAA418];
      uint64_t v16 = -345014;
LABEL_19:
      uint64_t v13 = (void *)[v14 initWithDomain:v15 code:v16 userInfo:v7];
      goto LABEL_20;
    default:
      if (a3 == -42606 || a3 == -42585)
      {
LABEL_12:
        uint64_t v13 = TVPSKDErrorWithCode();
      }
      else
      {
LABEL_5:
        uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.fpsRequest" code:a3 userInfo:0];
        id v8 = TVPSKDErrorWithCode();
        id v9 = [v8 userInfo];
        uint64_t v10 = (void *)[v9 mutableCopy];

        [v10 setObject:v7 forKey:*MEMORY[0x1E4F28A50]];
        id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v12 = [v8 domain];
        uint64_t v13 = objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, objc_msgSend(v8, "code"), v10);

LABEL_20:
      }

      return v13;
  }
}

- (void)_failKeyRequests:(id)a3 withError:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (uint64_t *)MEMORY[0x1E4FAA418];
  if (!v7) {
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:*MEMORY[0x1E4FAA418] code:-345007 userInfo:0];
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v6;
  uint64_t v30 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v30)
  {
    uint64_t v28 = *v8;
    uint64_t v29 = *(void *)v32;
    id v9 = (uint64_t *)MEMORY[0x1E4FAA2F0];
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v12 = [v7 domain];
        if ([v12 isEqualToString:v28])
        {
          uint64_t v13 = [v7 code];

          if (v13 != -345015) {
            goto LABEL_17;
          }
          id v12 = [v11 keyIdentifier];
          if (v12)
          {
            if ([(VUIStoreFPSKeyLoader *)self usesKeyIdentifierPenaltyBox])
            {
              id v14 = [(VUIStoreFPSKeyLoader *)self keyIdentifierPenaltyBox];
              uint64_t v15 = [v14 objectForKey:v12];

              if (!v15)
              {
                uint64_t v16 = sLogObject_0;
                if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v36 = v12;
                  _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "Adding key identifier [%@] to penalty box since it is not owned or entitled", buf, 0xCu);
                }
                uint64_t v17 = [(VUIStoreFPSKeyLoader *)self keyIdentifierPenaltyBox];
                [v17 setObject:v7 forKey:v12];
              }
            }
          }
        }

LABEL_17:
        [v11 setError:v7];
        uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
        [v11 setRequestEndDate:v18];

        id v19 = [(VUIStoreFPSKeyLoader *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v19 storeFPSKeyLoader:self willFailWithError:v7 forKeyRequest:v11];
        }
        uint64_t v20 = [(VUIStoreFPSKeyLoader *)self eventCollection];
        uint64_t v21 = *v9;
        uint64_t v22 = NSString;
        uint64_t v23 = [v11 eventReportingID];
        id v24 = [v22 stringWithFormat:@"%@%@", v21, v23];
        [v20 addEndEventWithName:v21 identifier:v24];

        id v25 = [(VUIStoreFPSKeyLoader *)self eventCollection];
        [v25 addSingleShotEventWithName:*MEMORY[0x1E4FAA2D8] value:v7];

        id v26 = [(VUIStoreFPSKeyLoader *)self eventCollection];
        [v26 addSingleShotEventWithName:*MEMORY[0x1E4FAA2E0] value:*v9];

        [v11 finish];
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v30);
  }
}

- (id)_bodyDictionaryForRequests:(id)a3 isStopRequest:(BOOL)a4 locationAuthorizationStatus:(int64_t)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = -[VUIStoreFPSKeyLoader _jsonDictionaryForRequest:isStopRequest:locationAuthorizationStatus:](self, "_jsonDictionaryForRequest:isStopRequest:locationAuthorizationStatus:", *(void *)(*((void *)&v19 + 1) + 8 * i), v6, a5, (void)v19);
        if (v15) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v16 setObject:&unk_1F3F3C3B0 forKey:@"version"];
  [v16 setObject:v9 forKey:@"streaming-keys"];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v17 setObject:v16 forKey:@"fairplay-streaming-request"];

  return v17;
}

- (id)_jsonDictionaryForRequest:(id)a3 isStopRequest:(BOOL)a4 locationAuthorizationStatus:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = [v8 keyRequestData];
  uint64_t v11 = [v10 base64EncodedStringWithOptions:0];

  if (v11) {
    [v9 setObject:v11 forKey:@"spc"];
  }
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v8, "requestID"));
  [v9 setObject:v12 forKey:@"id"];

  uint64_t v13 = [v8 keyIdentifier];
  id v14 = [v13 absoluteString];

  if (v14) {
    [v9 setObject:v14 forKey:@"uri"];
  }
  uint64_t v15 = [(VUIStoreFPSKeyLoader *)self rentalID];
  if (v15) {
    [v9 setObject:v15 forKey:@"rental-id"];
  }
  if (v6)
  {
    [v9 setObject:@"stop" forKey:@"lease-action"];
    id v16 = [v8 userInfo];
    id v17 = [v16 objectForKey:@"stkn"];

    if (v17) {
      [v9 setObject:v17 forKey:@"stkn"];
    }
  }
  else
  {
    if ([v8 isRenewal]) {
      uint64_t v18 = @"renew";
    }
    else {
      uint64_t v18 = @"start";
    }
    [v9 setObject:v18 forKey:@"lease-action"];
  }
  if ([(VUIStoreFPSKeyLoader *)self didSkipRentalCheckout]) {
    [v9 setObject:MEMORY[0x1E4F1CC38] forKey:@"skipped-rental-checkout"];
  }
  if ([v8 type] == 2 || objc_msgSend(v8, "type") == 3) {
    [v9 setObject:MEMORY[0x1E4F1CC38] forKey:@"offline"];
  }
  if (a5 == 1)
  {
    long long v19 = [MEMORY[0x1E4FB50C8] defaultLocationManager];
    long long v20 = [v19 lastKnownLocation];

    long long v21 = [v20 objectForKey:*MEMORY[0x1E4FB5238]];
    uint64_t v22 = [v20 objectForKey:*MEMORY[0x1E4FB5240]];
    uint64_t v23 = (void *)v22;
    if (v21 && v22)
    {
      [v9 setObject:v21 forKey:@"lat"];
      [v9 setObject:v23 forKey:@"long"];
    }
  }
  uint64_t v24 = [v8 additionalRequestParams];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    id v26 = [v8 additionalRequestParams];
    [v9 addEntriesFromDictionary:v26];
  }
  id v27 = [v9 objectForKey:@"adamId"];
  if (!v27)
  {
    uint64_t v28 = [v8 adamID];
    uint64_t v29 = [v28 length];

    if (!v29) {
      goto LABEL_31;
    }
    id v27 = [v8 adamID];
    [v9 setObject:v27 forKey:@"adamId"];
  }

LABEL_31:
  return v9;
}

- (NSURL)secureInvalidationNonceURL
{
  return self->_secureInvalidationNonceURL;
}

- (void)setSecureInvalidationNonceURL:(id)a3
{
}

- (NSNumber)secureInvalidationDSID
{
  return self->_secureInvalidationDSID;
}

- (void)setSecureInvalidationDSID:(id)a3
{
}

- (VUIStoreFPSKeyLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIStoreFPSKeyLoaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVPPlaybackReportingEventCollection)eventCollection
{
  return self->_eventCollection;
}

- (void)setEventCollection:(id)a3
{
}

- (NSNumber)rentalID
{
  return self->_rentalID;
}

- (void)setRentalID:(id)a3
{
}

- (BOOL)didSkipRentalCheckout
{
  return self->_didSkipRentalCheckout;
}

- (void)setDidSkipRentalCheckout:(BOOL)a3
{
  self->_didSkipRentalCheckout = a3;
}

- (BOOL)usesKeyIdentifierPenaltyBox
{
  return self->_usesKeyIdentifierPenaltyBox;
}

- (void)setUsesKeyIdentifierPenaltyBox:(BOOL)a3
{
  self->_usesKeyIdentifierPenaltyBox = a3;
}

- (BOOL)sendsLocationWhenOptedIn
{
  return self->_sendsLocationWhenOptedIn;
}

- (void)setSendsLocationWhenOptedIn:(BOOL)a3
{
  self->_sendsLocationWhenOptedIn = a3;
}

- (BOOL)sendsMescalHeader
{
  return self->_sendsMescalHeader;
}

- (void)setSendsMescalHeader:(BOOL)a3
{
  self->_sendsMescalHeader = a3;
}

- (NSURL)certificateURL
{
  return self->_certificateURL;
}

- (void)setCertificateURL:(id)a3
{
}

- (NSURL)keyServerURL
{
  return self->_keyServerURL;
}

- (void)setKeyServerURL:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSData)certificateData
{
  return self->_certificateData;
}

- (void)setCertificateData:(id)a3
{
}

- (NSMutableArray)requestsAwaitingCertFetch
{
  return self->_requestsAwaitingCertFetch;
}

- (void)setRequestsAwaitingCertFetch:(id)a3
{
}

- (TVPContentKeyRequest)savedStreamingKeyRequestToUseForStopping
{
  return self->_savedStreamingKeyRequestToUseForStopping;
}

- (void)setSavedStreamingKeyRequestToUseForStopping:(id)a3
{
}

- (NSDate)keyExpirationDate
{
  return self->_keyExpirationDate;
}

- (void)setKeyExpirationDate:(id)a3
{
}

- (NSDate)rentalPlaybackStartDate
{
  return self->_rentalPlaybackStartDate;
}

- (void)setRentalPlaybackStartDate:(id)a3
{
}

- (TVPContentKeySession)contentKeySession
{
  return self->_contentKeySession;
}

- (void)setContentKeySession:(id)a3
{
}

- (NSMutableDictionary)keyIdentifierPenaltyBox
{
  return self->_keyIdentifierPenaltyBox;
}

- (void)setKeyIdentifierPenaltyBox:(id)a3
{
}

- (double)downloadExpirationPeriodOverrideInSeconds
{
  return self->_downloadExpirationPeriodOverrideInSeconds;
}

- (void)setDownloadExpirationPeriodOverrideInSeconds:(double)a3
{
  self->_downloadExpirationPeriodOverrideInSeconds = a3;
}

- (double)availabilityPeriodOverrideInSeconds
{
  return self->_availabilityPeriodOverrideInSeconds;
}

- (void)setAvailabilityPeriodOverrideInSeconds:(double)a3
{
  self->_availabilityPeriodOverrideInSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifierPenaltyBox, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
  objc_storeStrong((id *)&self->_rentalPlaybackStartDate, 0);
  objc_storeStrong((id *)&self->_keyExpirationDate, 0);
  objc_storeStrong((id *)&self->_savedStreamingKeyRequestToUseForStopping, 0);
  objc_storeStrong((id *)&self->_requestsAwaitingCertFetch, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_certificateURL, 0);
  objc_storeStrong((id *)&self->_rentalID, 0);
  objc_storeStrong((id *)&self->_eventCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secureInvalidationDSID, 0);
  objc_storeStrong((id *)&self->_secureInvalidationNonceURL, 0);
}

- (void)loadFairPlayStreamingKeyRequests:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Either certificate URL or key server URL was not provided", v2, v3, v4, v5, v6);
}

- (void)invalidateKeysWithRequests:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Param error invalidating key requests", v2, v3, v4, v5, v6);
}

void __63__VUIStoreFPSKeyLoader__loadFPSURLsFromStoreBagWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Error retrieving URLs from bag", v2, v3, v4, v5, v6);
}

void __75__VUIStoreFPSKeyLoader__loadAndCacheCertificateDataForValidURL_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_57_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "Top-level json object is not of type dictionary.  Error is %@", v2, v3, v4, v5, v6);
}

void __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_57_cold_2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "Nonce response is not of type NSData, or error occurred: %@", v2, v3, v4, v5, v6);
}

void __82__VUIStoreFPSKeyLoader__generateSecureInvalidationDataForFirstRequest_completion___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_4_13(&dword_1E2BD7000, a2, a3, "Error generating secure invalidation data for %@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_startKeyRequestsInBatches:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Batch size is zero.  This should never happen.", v2, v3, v4, v5, v6);
}

void __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_90_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Body data is nil; unable to sign using Mescal", v2, v3, v4, v5, v6);
}

void __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_90_cold_2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "Signature data is nil due to error %@; unable to sign using mescal",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_handleResponseForKeyRequests:responseData:URLResponse:error:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Response is missing fairplay-streaming-response, version or streaming-keys", v2, v3, v4, v5, v6);
}

- (void)_handleResponseForKeyRequests:responseData:URLResponse:error:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Top-level json object is not of type dictionary", v2, v3, v4, v5, v6);
}

- (void)_handleResponseForKeyRequests:responseData:URLResponse:error:completion:.cold.3()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "Received http %ld status code", v2, v3, v4, v5, v6);
}

- (void)_handleResponseDicts:forKeyRequests:completion:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "Response dict for key request could not be found: %@", v2, v3, v4, v5, v6);
}

void __71__VUIStoreFPSKeyLoader__handleResponseDicts_forKeyRequests_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Key info dict is missing id", v2, v3, v4, v5, v6);
}

void __71__VUIStoreFPSKeyLoader__handleResponseDicts_forKeyRequests_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Key info object is not a dictionary", v2, v3, v4, v5, v6);
}

- (void)_handleResponseDict:forKeyRequest:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Key info dict is missing status", v2, v3, v4, v5, v6);
}

- (void)_handleResponseDict:forKeyRequest:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Key info dict has a status of 0 but is missing ckc", v2, v3, v4, v5, v6);
}

- (void)_handleResponseDict:(uint64_t)a1 forKeyRequest:(uint64_t)a2 completion:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_4_13(&dword_1E2BD7000, a2, a3, "Received FPS response error status of %ld for %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __69__VUIStoreFPSKeyLoader__handleResponseDict_forKeyRequest_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Key response data has zero length", v2, v3, v4, v5, v6);
}

@end