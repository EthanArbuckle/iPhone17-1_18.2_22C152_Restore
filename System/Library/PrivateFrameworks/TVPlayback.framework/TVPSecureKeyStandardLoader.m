@interface TVPSecureKeyStandardLoader
+ (void)initialize;
- (BOOL)didSkipRentalCheckout;
- (BOOL)holdKeyResponses;
- (BOOL)includeGUID;
- (BOOL)requiresExternalEntitlementCheck;
- (NSDate)rentalExpirationDate;
- (NSDate)rentalPlaybackStartDate;
- (NSMutableArray)pendingKeyResponses;
- (NSNumber)rentalID;
- (NSString)serviceProviderID;
- (NSURL)certificateDataURL;
- (NSURL)keyDataURL;
- (TVPSecureKeyRequest)savedRequestToUseForStopping;
- (TVPSecureKeyStandardLoader)init;
- (TVPSecureKeyStandardLoader)initWithCertificateDataURL:(id)a3 keyDataURL:(id)a4;
- (TVPSecureKeyStandardLoaderConnectionHandling)connectionHandler;
- (TVPSecureKeyStandardLoaderRequestGenerating)requestGenerator;
- (id)_assetIdentifierForKeyRequest:(id)a3;
- (id)_bodyJSONDataForRequest:(id)a3 forceStop:(BOOL)a4;
- (void)sendStopRequest;
- (void)setCertificateDataURL:(id)a3;
- (void)setConnectionHandler:(id)a3;
- (void)setDidSkipRentalCheckout:(BOOL)a3;
- (void)setHoldKeyResponses:(BOOL)a3;
- (void)setIncludeGUID:(BOOL)a3;
- (void)setKeyDataURL:(id)a3;
- (void)setPendingKeyResponses:(id)a3;
- (void)setRentalExpirationDate:(id)a3;
- (void)setRentalID:(id)a3;
- (void)setRentalPlaybackStartDate:(id)a3;
- (void)setRequestGenerator:(id)a3;
- (void)setRequiresExternalEntitlementCheck:(BOOL)a3;
- (void)setSavedRequestToUseForStopping:(id)a3;
- (void)setServiceProviderID:(id)a3;
- (void)startLoadingCertificateDataForRequest:(id)a3;
- (void)startLoadingContentIdentifierDataForRequest:(id)a3;
- (void)startLoadingKeyResponseDataForRequest:(id)a3;
@end

@implementation TVPSecureKeyStandardLoader

+ (void)initialize
{
  if (initialize_onceToken_1 != -1) {
    dispatch_once(&initialize_onceToken_1, &__block_literal_global_5);
  }
}

uint64_t __40__TVPSecureKeyStandardLoader_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "SecureKeyDelivery");
  v1 = (void *)sStandardLoaderLogObject;
  sStandardLoaderLogObject = (uint64_t)v0;

  sCachedCertData = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

- (TVPSecureKeyStandardLoader)initWithCertificateDataURL:(id)a3 keyDataURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TVPSecureKeyStandardLoader;
  v9 = [(TVPSecureKeyStandardLoader *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_certificateDataURL, a3);
    objc_storeStrong((id *)&v10->_keyDataURL, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingKeyResponses = v10->_pendingKeyResponses;
    v10->_pendingKeyResponses = v11;
  }
  return v10;
}

- (void)setHoldKeyResponses:(BOOL)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (self->_holdKeyResponses != a3)
  {
    BOOL v3 = a3;
    self->_holdKeyResponses = a3;
    v5 = sStandardLoaderLogObject;
    BOOL v6 = os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "Holding subsequent key responses", buf, 2u);
      }
    }
    else
    {
      if (v6)
      {
        id v7 = v5;
        id v8 = [(TVPSecureKeyStandardLoader *)self pendingKeyResponses];
        *(_DWORD *)buf = 134217984;
        uint64_t v28 = [v8 count];
        _os_log_impl(&dword_236FC5000, v7, OS_LOG_TYPE_DEFAULT, "No longer holding key responses.  Sending responses for %lu pending responses", buf, 0xCu);
      }
      v9 = [(TVPSecureKeyStandardLoader *)self pendingKeyResponses];
      v10 = (void *)[v9 copy];

      v11 = [(TVPSecureKeyStandardLoader *)self pendingKeyResponses];
      [v11 removeAllObjects];

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v22 + 1) + 8 * v16);
            v18 = [(TVPSecureKeyLoader *)self delegate];
            v19 = [v17 keyData];
            v20 = [v17 renewalDate];
            v21 = [v17 request];
            [v18 secureKeyLoader:self didLoadKeyResponseData:v19 renewalDate:v20 forRequest:v21];

            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v14);
      }
    }
  }
}

- (id)_assetIdentifierForKeyRequest:(id)a3
{
  BOOL v3 = [a3 URL];
  v4 = [v3 host];

  return v4;
}

- (id)_bodyJSONDataForRequest:(id)a3 forceStop:(BOOL)a4
{
  id v6 = a3;
  id v7 = [v6 keyRequestData];
  id v8 = [v7 base64EncodedStringWithOptions:0];

  v9 = [MEMORY[0x263EFF9A0] dictionary];
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "requestID"));
  [v9 setObject:v10 forKey:@"id"];

  if (v8) {
    [v9 setObject:v8 forKey:@"spc"];
  }
  v11 = [v6 URL];
  id v12 = [v11 absoluteString];

  if (v12) {
    [v9 setObject:v12 forKey:@"uri"];
  }
  if ([(TVPSecureKeyStandardLoader *)self includeGUID])
  {
    uint64_t v13 = [MEMORY[0x263F27BF8] deviceGUID];
    if (v13) {
      [v9 setObject:v13 forKey:@"guid"];
    }
  }
  uint64_t v14 = [(TVPSecureKeyStandardLoader *)self rentalID];
  if (v14 || ([v6 rentalID], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v9 setObject:v14 forKey:@"rental-id"];
  }
  if ([(TVPSecureKeyStandardLoader *)self requiresExternalEntitlementCheck]) {
    [v9 setObject:MEMORY[0x263EFFA88] forKey:@"isExternal"];
  }
  uint64_t v15 = [(TVPSecureKeyStandardLoader *)self serviceProviderID];
  uint64_t v16 = [v15 length];

  if (v16)
  {
    v17 = [(TVPSecureKeyStandardLoader *)self serviceProviderID];
    [v9 setObject:v17 forKey:@"svcId"];
  }
  if (a4)
  {
    v18 = @"stop";
  }
  else if ([v6 isRenewal])
  {
    v18 = @"renew";
  }
  else
  {
    v18 = @"start";
  }
  [v9 setObject:v18 forKey:@"lease-action"];
  if ([(TVPSecureKeyStandardLoader *)self didSkipRentalCheckout]) {
    [v9 setObject:MEMORY[0x263EFFA88] forKey:@"skipped-rental-checkout"];
  }
  if ([v6 retrievesOfflineKeys]) {
    [v9 setObject:MEMORY[0x263EFFA88] forKey:@"offline"];
  }
  v19 = [MEMORY[0x263EFF980] array];
  [v19 addObject:v9];
  v20 = [MEMORY[0x263EFF9A0] dictionary];
  [v20 setObject:&unk_26EA25C18 forKey:@"version"];
  [v20 setObject:v19 forKey:@"streaming-keys"];
  v21 = [MEMORY[0x263EFF9A0] dictionary];
  [v21 setObject:v20 forKey:@"fairplay-streaming-request"];
  long long v22 = [MEMORY[0x263F08900] dataWithJSONObject:v21 options:0 error:0];

  return v22;
}

- (TVPSecureKeyStandardLoader)init
{
  return 0;
}

- (void)startLoadingCertificateDataForRequest:(id)a3
{
  id v4 = a3;
  v5 = [(TVPSecureKeyStandardLoader *)self certificateDataURL];
  id v6 = [(id)sCachedCertData objectForKey:v5];
  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __68__TVPSecureKeyStandardLoader_startLoadingCertificateDataForRequest___block_invoke;
  v23[3] = &unk_264CC52F0;
  id v7 = v4;
  id v24 = v7;
  objc_copyWeak(&v25, &location);
  id v8 = (void (**)(void, void, void))MEMORY[0x237E144A0](v23);
  if (v5)
  {
    uint64_t v9 = [v6 length];
    if (v9)
    {
      v10 = sStandardLoaderLogObject;
      if (os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_236FC5000, v10, OS_LOG_TYPE_DEFAULT, "Returning cached cert data.  Refreshing cert data, but not waiting for response", buf, 2u);
      }
      v11 = [(TVPSecureKeyLoader *)self eventCollection];
      [v11 addSingleShotEventWithName:TVPPlaybackReportingEventFPSUsingCachedCertData value:MEMORY[0x263EFFA88]];

      ((void (**)(void, void *, void))v8)[2](v8, v6, 0);
    }
    else
    {
      uint64_t v13 = [(TVPSecureKeyLoader *)self eventCollection];
      [v13 addSingleShotEventWithName:TVPPlaybackReportingEventFPSUsingCachedCertData value:MEMORY[0x263EFFA80]];

      uint64_t v14 = sStandardLoaderLogObject;
      if (os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_236FC5000, v14, OS_LOG_TYPE_DEFAULT, "No cached cert data available.  Fetching cert data and waiting for response", buf, 2u);
      }
    }
    uint64_t v15 = [(TVPSecureKeyStandardLoader *)self requestGenerator];
    uint64_t v16 = [(TVPSecureKeyStandardLoader *)self certificateDataURL];
    id v12 = [v15 secureKeyStandardLoader:self requestForFetchingDataFromURL:v16];

    v17 = [(TVPSecureKeyStandardLoader *)self connectionHandler];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __68__TVPSecureKeyStandardLoader_startLoadingCertificateDataForRequest___block_invoke_77;
    v18[3] = &unk_264CC5318;
    id v19 = v5;
    BOOL v21 = v9 == 0;
    v20 = v8;
    [v17 secureKeyStandardLoader:self sendAsynchronousRequest:v12 completionHandler:v18];
  }
  else
  {
    id v12 = TVPSKDErrorWithCode(-345021);
    ((void (**)(void, void, void *))v8)[2](v8, 0, v12);
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __68__TVPSecureKeyStandardLoader_startLoadingCertificateDataForRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = [WeakRetained delegate];
    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v9 = *(void *)(a1 + 32);
    if (v10) {
      [v7 secureKeyLoader:v8 didLoadCertificateData:v10 forRequest:v9];
    }
    else {
      [v7 secureKeyLoader:v8 didFailWithError:v5 forRequest:v9];
    }
  }
}

void __68__TVPSecureKeyStandardLoader_startLoadingCertificateDataForRequest___block_invoke_77(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 length] && *(void *)(a1 + 32))
  {
    id v8 = sStandardLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236FC5000, v8, OS_LOG_TYPE_DEFAULT, "Updating cached cert data", buf, 2u);
    }
    [(id)sCachedCertData setObject:v6 forKey:*(void *)(a1 + 32)];
  }
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v9 = sStandardLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "Returning newly fetched cert data", v10, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)startLoadingContentIdentifierDataForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(TVPSecureKeyStandardLoader *)self _assetIdentifierForKeyRequest:v4];
  id v8 = v5;
  if (v5)
  {
    id v6 = [v5 dataUsingEncoding:4];
    id v7 = [(TVPSecureKeyLoader *)self delegate];
    [v7 secureKeyLoader:self didLoadContentIdentifierData:v6 forRequest:v4];
  }
  else
  {
    id v6 = TVPSKDErrorWithCode(-345005);
    id v7 = [(TVPSecureKeyLoader *)self delegate];
    [v7 secureKeyLoader:self didFailWithError:v6 forRequest:v4];
  }
}

- (void)startLoadingKeyResponseDataForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(TVPSecureKeyStandardLoader *)self savedRequestToUseForStopping];

  if (!v5) {
    [(TVPSecureKeyStandardLoader *)self setSavedRequestToUseForStopping:v4];
  }
  id v6 = [(TVPSecureKeyStandardLoader *)self keyDataURL];
  if (v6)
  {
    id v7 = [(TVPSecureKeyStandardLoader *)self _bodyJSONDataForRequest:v4 forceStop:0];
    id v8 = [(TVPSecureKeyStandardLoader *)self requestGenerator];
    uint64_t v9 = [v8 secureKeyStandardLoader:self requestForPostingData:v7 toURL:v6];

    objc_initWeak(&location, self);
    id v10 = [(TVPSecureKeyStandardLoader *)self connectionHandler];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68__TVPSecureKeyStandardLoader_startLoadingKeyResponseDataForRequest___block_invoke;
    v11[3] = &unk_264CC5340;
    id v12 = v4;
    objc_copyWeak(&v13, &location);
    [v10 secureKeyStandardLoader:self sendAsynchronousRequest:v9 completionHandler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    id v7 = [(TVPSecureKeyLoader *)self delegate];
    uint64_t v9 = TVPSKDErrorWithCode(-345022);
    [v7 secureKeyLoader:self didFailWithError:v9 forRequest:v4];
  }
}

void __68__TVPSecureKeyStandardLoader_startLoadingKeyResponseDataForRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 statusCode] == 403)
    {
      uint64_t v10 = -345018;
LABEL_28:
      v33 = TVPSKDErrorWithCode(v10);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      v35 = [WeakRetained delegate];
      id v36 = objc_loadWeakRetained((id *)(a1 + 40));
      [v35 secureKeyLoader:v36 didFailWithError:v33 forRequest:*(void *)(a1 + 32)];

      goto LABEL_62;
    }
    if (v7)
    {
      if (![v7 length])
      {
        uint64_t v10 = -345009;
        goto LABEL_28;
      }
      id v111 = *(id *)(a1 + 32);
      *(void *)buf = 0;
      v11 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:buf];
      id v107 = *(id *)buf;
      v109 = v11;
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        TVPSKDErrorWithCode(-345008);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = 0;
        id v29 = 0;
        id v30 = 0;
        id v31 = 0;
        char v32 = 0;
        goto LABEL_35;
      }
      uint64_t v12 = [v11 objectForKey:@"fairplay-streaming-response"];
      v105 = (void *)v12;
      if (!v12 || (id v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        TVPSKDErrorWithCode(-345008);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = 0;
        id v29 = 0;
        id v30 = 0;
        id v31 = 0;
        char v32 = 0;
LABEL_34:

LABEL_35:
        id v108 = v28;
        id v106 = v29;
        id v37 = v30;
        id v112 = v31;
        id v38 = v27;
        v110 = v37;
        if ((v32 & 1) == 0)
        {
          v49 = (TVPSecureKeyResponse *)objc_loadWeakRetained((id *)(a1 + 40));
          v50 = [(TVPSecureKeyResponse *)v49 delegate];
          v51 = objc_loadWeakRetained((id *)(a1 + 40));
          [v50 secureKeyLoader:v51 didFailWithError:v38 forRequest:*(void *)(a1 + 32)];
          v53 = v106;
          v52 = v108;
LABEL_61:

          goto LABEL_62;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v39 = [v8 allHeaderFields];
          uint64_t v40 = objc_msgSend(v39, "tvp_appleTimingAppHeaderValue");

          if (v40 >= 1)
          {
            id v41 = objc_loadWeakRetained((id *)(a1 + 40));
            v42 = [v41 eventCollection];
            v43 = TVPPlaybackReportingEventFPSServerProcessingTimeMS;
            v44 = [NSNumber numberWithInteger:v40];
            [v42 addSingleShotEventWithName:v43 value:v44];
          }
        }
        if (v37)
        {
          v45 = sStandardLoaderLogObject;
          if (os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v37;
            _os_log_impl(&dword_236FC5000, v45, OS_LOG_TYPE_DEFAULT, "Rental expiration date: %@", buf, 0xCu);
          }
          id v46 = objc_loadWeakRetained((id *)(a1 + 40));
          v47 = [v46 rentalExpirationDate];
          char v48 = [v37 isEqualToDate:v47];

          if (v48)
          {
            LODWORD(v37) = 0;
          }
          else
          {
            id v54 = objc_loadWeakRetained((id *)(a1 + 40));
            [v54 setRentalExpirationDate:v37];

            id v55 = objc_loadWeakRetained((id *)(a1 + 40));
            v56 = [v55 delegate];
            id v57 = objc_loadWeakRetained((id *)(a1 + 40));
            [v56 secureKeyLoader:v57 didReceiveUpdatedRentalExpirationDate:v37];

            LODWORD(v37) = 1;
          }
        }
        if (!v112) {
          goto LABEL_50;
        }
        v58 = sStandardLoaderLogObject;
        if (os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v112;
          _os_log_impl(&dword_236FC5000, v58, OS_LOG_TYPE_DEFAULT, "Rental playback start date: %@", buf, 0xCu);
        }
        id v59 = objc_loadWeakRetained((id *)(a1 + 40));
        v60 = [v59 rentalPlaybackStartDate];
        char v61 = [v112 isEqualToDate:v60];

        if ((v61 & 1) == 0)
        {
          id v62 = objc_loadWeakRetained((id *)(a1 + 40));
          [v62 setRentalPlaybackStartDate:v112];

          id v63 = objc_loadWeakRetained((id *)(a1 + 40));
          v64 = [v63 delegate];
          char v65 = objc_opt_respondsToSelector();

          if (v65)
          {
            id v66 = objc_loadWeakRetained((id *)(a1 + 40));
            v67 = [v66 delegate];
            id v68 = objc_loadWeakRetained((id *)(a1 + 40));
            [v67 secureKeyLoader:v68 didReceiveUpdatedRentalPlaybackStartDate:v112];
          }
        }
        else
        {
LABEL_50:
          if (!v37)
          {
LABEL_56:
            id v75 = objc_loadWeakRetained((id *)(a1 + 40));
            int v76 = [v75 holdKeyResponses];

            if (v76)
            {
              v77 = (void *)sStandardLoaderLogObject;
              v52 = v108;
              if (os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_DEFAULT))
              {
                v78 = *(void **)(a1 + 32);
                v79 = v77;
                uint64_t v80 = [v78 requestID];
                *(_DWORD *)buf = 134217984;
                *(void *)&uint8_t buf[4] = v80;
                _os_log_impl(&dword_236FC5000, v79, OS_LOG_TYPE_DEFAULT, "Adding FPS key response to pending responses for id %lu", buf, 0xCu);
              }
              v81 = *(void **)(a1 + 32);
              v82 = NSNumber;
              [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
              v83 = objc_msgSend(v82, "numberWithDouble:");
              [v81 setRequestCompletionTime:v83];

              v49 = objc_alloc_init(TVPSecureKeyResponse);
              [(TVPSecureKeyResponse *)v49 setKeyData:v108];
              v53 = v106;
              [(TVPSecureKeyResponse *)v49 setRenewalDate:v106];
              [(TVPSecureKeyResponse *)v49 setRequest:*(void *)(a1 + 32)];
              v50 = objc_loadWeakRetained((id *)(a1 + 40));
              v51 = [v50 pendingKeyResponses];
              [v51 addObject:v49];
            }
            else
            {
              v49 = (TVPSecureKeyResponse *)objc_loadWeakRetained((id *)(a1 + 40));
              v50 = [(TVPSecureKeyResponse *)v49 delegate];
              v51 = objc_loadWeakRetained((id *)(a1 + 40));
              v53 = v106;
              v52 = v108;
              [v50 secureKeyLoader:v51 didLoadKeyResponseData:v108 renewalDate:v106 forRequest:*(void *)(a1 + 32)];
            }
            goto LABEL_61;
          }
        }
        id v69 = objc_loadWeakRetained((id *)(a1 + 40));
        v70 = [v69 delegate];
        char v71 = objc_opt_respondsToSelector();

        if (v71)
        {
          id v72 = objc_loadWeakRetained((id *)(a1 + 40));
          v73 = [v72 delegate];
          id v74 = objc_loadWeakRetained((id *)(a1 + 40));
          [v73 secureKeyLoader:v74 didReceiveUpdatedRentalExpirationDate:v110 playbackStartDate:v112];
        }
        goto LABEL_56;
      }
      v104 = [v13 objectForKey:@"version"];
      if (!v104 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        TVPSKDErrorWithCode(-345008);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = 0;
        id v29 = 0;
        id v30 = 0;
        id v31 = 0;
        char v32 = 0;
LABEL_33:

        goto LABEL_34;
      }
      uint64_t v14 = [v13 objectForKey:@"streaming-keys"];
      v103 = (void *)v14;
      if (!v14
        || (uint64_t v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || ![v15 count])
      {
        TVPSKDErrorWithCode(-345008);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = 0;
        id v29 = 0;
        id v30 = 0;
        id v31 = 0;
        char v32 = 0;
LABEL_32:

        goto LABEL_33;
      }
      uint64_t v16 = [v15 objectAtIndex:0];
      v102 = (void *)v16;
      if (!v16 || (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        TVPSKDErrorWithCode(-345008);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = 0;
        id v29 = 0;
        id v30 = 0;
        id v31 = 0;
        char v32 = 0;
LABEL_68:

        goto LABEL_32;
      }
      uint64_t v18 = [v17 objectForKey:@"status"];
      v101 = (void *)v18;
      if (v18 && (id v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v20 = [v19 integerValue];
        if (!v20)
        {
          v100 = [v102 objectForKey:@"ckc"];
          if (v100 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v100 length])
          {
            v84 = [v102 objectForKey:@"renew-after"];
            if (v84 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v85 = [v111 startDate];
              [v84 doubleValue];
              objc_msgSend(v85, "dateByAddingTimeInterval:");
              id v29 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v29 = 0;
            }

            v94 = [v102 objectForKey:@"expiration-time"];
            if (v94 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v95 = objc_alloc(MEMORY[0x263EFF910]);
              [v94 doubleValue];
              id v30 = (id)[v95 initWithTimeIntervalSince1970:v96 / 1000.0];
            }
            else
            {
              id v30 = 0;
            }

            v97 = [v102 objectForKey:@"playback-start-time"];
            if (v97 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v98 = objc_alloc(MEMORY[0x263EFF910]);
              [v97 doubleValue];
              id v31 = (id)[v98 initWithTimeIntervalSince1970:v99 / 1000.0];
            }
            else
            {
              id v31 = 0;
            }

            char v32 = 1;
            v86 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v100 options:1];
            id v27 = 0;
            uint64_t v28 = v86;
          }
          else
          {
            v86 = TVPSKDErrorWithCode(-345008);
            uint64_t v28 = 0;
            id v29 = 0;
            id v30 = 0;
            id v31 = 0;
            char v32 = 0;
            id v27 = v86;
          }
          id v87 = v86;

          goto LABEL_67;
        }
        uint64_t v21 = v20;
        long long v22 = sStandardLoaderLogObject;
        if (os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_ERROR)) {
          __68__TVPSecureKeyStandardLoader_startLoadingKeyResponseDataForRequest___block_invoke_cold_1(v21, v22);
        }
        switch(v21)
        {
          case -1009:
            uint64_t v23 = -345017;
            goto LABEL_65;
          case -1008:
            uint64_t v23 = -345016;
            goto LABEL_65;
          case -1004:
            uint64_t v23 = -345014;
            goto LABEL_65;
          case -1002:
            uint64_t v23 = -345015;
            goto LABEL_65;
          default:
            v88 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.fpsRequest" code:v21 userInfo:0];
            v89 = TVPSKDErrorWithCode(-345013);
            v90 = [v89 userInfo];
            v91 = (void *)[v90 mutableCopy];

            [v91 setObject:v88 forKey:*MEMORY[0x263F08608]];
            id v92 = objc_alloc(MEMORY[0x263F087E8]);
            v93 = [v89 domain];
            id v27 = (id)objc_msgSend(v92, "initWithDomain:code:userInfo:", v93, objc_msgSend(v89, "code"), v91);

            break;
        }
      }
      else
      {
        uint64_t v23 = -345008;
LABEL_65:
        TVPSKDErrorWithCode(v23);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v28 = 0;
      id v29 = 0;
      id v30 = 0;
      id v31 = 0;
      char v32 = 0;
LABEL_67:

      goto LABEL_68;
    }
    id v24 = objc_loadWeakRetained((id *)(a1 + 40));
    id v25 = [v24 delegate];
    id v26 = objc_loadWeakRetained((id *)(a1 + 40));
    [v25 secureKeyLoader:v26 didFailWithError:v9 forRequest:*(void *)(a1 + 32)];
  }
LABEL_62:
}

- (void)sendStopRequest
{
  BOOL v3 = [(TVPSecureKeyStandardLoader *)self savedRequestToUseForStopping];

  if (v3)
  {
    id v9 = [(TVPSecureKeyStandardLoader *)self keyDataURL];
    if (v9)
    {
      id v4 = [(TVPSecureKeyStandardLoader *)self savedRequestToUseForStopping];
      id v5 = [(TVPSecureKeyStandardLoader *)self _bodyJSONDataForRequest:v4 forceStop:1];

      id v6 = [(TVPSecureKeyStandardLoader *)self requestGenerator];
      id v7 = [v6 secureKeyStandardLoader:self requestForPostingData:v5 toURL:v9];

      id v8 = [(TVPSecureKeyStandardLoader *)self connectionHandler];
      [v8 secureKeyStandardLoader:self sendAsynchronousRequest:v7 completionHandler:&__block_literal_global_87];
    }
    [(TVPSecureKeyStandardLoader *)self setSavedRequestToUseForStopping:0];
  }
}

- (TVPSecureKeyStandardLoaderRequestGenerating)requestGenerator
{
  return self->_requestGenerator;
}

- (void)setRequestGenerator:(id)a3
{
}

- (TVPSecureKeyStandardLoaderConnectionHandling)connectionHandler
{
  return self->_connectionHandler;
}

- (void)setConnectionHandler:(id)a3
{
}

- (BOOL)holdKeyResponses
{
  return self->_holdKeyResponses;
}

- (BOOL)didSkipRentalCheckout
{
  return self->_didSkipRentalCheckout;
}

- (void)setDidSkipRentalCheckout:(BOOL)a3
{
  self->_didSkipRentalCheckout = a3;
}

- (BOOL)includeGUID
{
  return self->_includeGUID;
}

- (void)setIncludeGUID:(BOOL)a3
{
  self->_includeGUID = a3;
}

- (BOOL)requiresExternalEntitlementCheck
{
  return self->_requiresExternalEntitlementCheck;
}

- (void)setRequiresExternalEntitlementCheck:(BOOL)a3
{
  self->_requiresExternalEntitlementCheck = a3;
}

- (NSString)serviceProviderID
{
  return self->_serviceProviderID;
}

- (void)setServiceProviderID:(id)a3
{
}

- (NSNumber)rentalID
{
  return self->_rentalID;
}

- (void)setRentalID:(id)a3
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

- (TVPSecureKeyRequest)savedRequestToUseForStopping
{
  return self->_savedRequestToUseForStopping;
}

- (void)setSavedRequestToUseForStopping:(id)a3
{
}

- (NSMutableArray)pendingKeyResponses
{
  return self->_pendingKeyResponses;
}

- (void)setPendingKeyResponses:(id)a3
{
}

- (NSDate)rentalExpirationDate
{
  return self->_rentalExpirationDate;
}

- (void)setRentalExpirationDate:(id)a3
{
}

- (NSDate)rentalPlaybackStartDate
{
  return self->_rentalPlaybackStartDate;
}

- (void)setRentalPlaybackStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rentalPlaybackStartDate, 0);
  objc_storeStrong((id *)&self->_rentalExpirationDate, 0);
  objc_storeStrong((id *)&self->_pendingKeyResponses, 0);
  objc_storeStrong((id *)&self->_savedRequestToUseForStopping, 0);
  objc_storeStrong((id *)&self->_keyDataURL, 0);
  objc_storeStrong((id *)&self->_certificateDataURL, 0);
  objc_storeStrong((id *)&self->_rentalID, 0);
  objc_storeStrong((id *)&self->_serviceProviderID, 0);
  objc_storeStrong((id *)&self->_connectionHandler, 0);
  objc_storeStrong((id *)&self->_requestGenerator, 0);
}

void __68__TVPSecureKeyStandardLoader_startLoadingKeyResponseDataForRequest___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_236FC5000, a2, OS_LOG_TYPE_ERROR, "Received FPS response error status of %ld", (uint8_t *)&v2, 0xCu);
}

@end