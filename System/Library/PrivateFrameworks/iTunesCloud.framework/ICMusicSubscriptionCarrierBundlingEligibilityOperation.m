@interface ICMusicSubscriptionCarrierBundlingEligibilityOperation
- (BOOL)isDeepLink;
- (ICMusicSubscriptionCarrierBundlingEligibilityOperation)initWithRequestContext:(id)a3;
- (ICStoreRequestContext)requestContext;
- (id)_newDefaultRequestBodyDictionary;
- (id)_newDefaultRequestBodyDictionaryWithResponseCode:(int64_t)a3 error:(id)a4;
- (id)responseHandler;
- (void)_finishEnrichmentWithBodyDictionary:(id)a3 completionHandler:(id)a4;
- (void)_sendEnrichmentRequestWithURL:(id)a3 preflightResponse:(id)a4 completionHandler:(id)a5;
- (void)_sendPreflightRequestWithCompletionHandler:(id)a3;
- (void)_sendSilentSMSRequestWithMessage:(id)a3 number:(id)a4 preflightResponse:(id)a5 completionHandler:(id)a6;
- (void)execute;
- (void)setDeepLink:(BOOL)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation ICMusicSubscriptionCarrierBundlingEligibilityOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_IMEI, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_mobileSubscriberNetworkCode, 0);
  objc_storeStrong((id *)&self->_mobileSubscriberCountryCode, 0);

  objc_storeStrong((id *)&self->_cellularProviderName, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setDeepLink:(BOOL)a3
{
  self->_deepLink = a3;
}

- (BOOL)isDeepLink
{
  return self->_deepLink;
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)_sendSilentSMSRequestWithMessage:(id)a3 number:(id)a4 preflightResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[ICTelephonyController sharedController];
  id v36 = 0;
  int v15 = [v14 sendSMSWithText:v10 toPhoneNumber:v11 error:&v36];
  id v16 = v36;

  v17 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  v18 = v17;
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v38 = self;
      _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_INFO, "%{public}@ Silent SMS succeeded.", buf, 0xCu);
    }
    uint64_t v19 = 200;
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      requestContext = self->_requestContext;
      *(_DWORD *)buf = 138543618;
      v38 = self;
      __int16 v39 = 2114;
      v40 = requestContext;
      _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send silent SMS for %{public}@.", buf, 0x16u);
    }
    uint64_t v19 = 460;
  }

  v21 = self->_requestContext;
  v22 = [v12 headerEnrichmentSessionIdentifier];
  id v23 = [(ICMusicSubscriptionCarrierBundlingEligibilityOperation *)self _newDefaultRequestBodyDictionaryWithResponseCode:v19 error:v16];
  v24 = v23;
  if (v22) {
    [v23 setObject:v22 forKey:@"sessionId"];
  }
  if (self->_deepLink) {
    [v24 setObject:@"true" forKey:@"deepLink"];
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __134__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendSilentSMSRequestWithMessage_number_preflightResponse_completionHandler___block_invoke;
  v30[3] = &unk_1E5AC9390;
  v30[4] = self;
  v31 = v21;
  id v32 = v10;
  id v33 = v11;
  id v34 = v12;
  id v35 = v13;
  id v25 = v12;
  id v26 = v11;
  id v27 = v10;
  id v28 = v13;
  v29 = v21;
  [(ICMusicSubscriptionCarrierBundlingEligibilityOperation *)self _finishEnrichmentWithBodyDictionary:v24 completionHandler:v30];
}

void __134__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendSilentSMSRequestWithMessage_number_preflightResponse_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
LABEL_6:
    uint64_t v12 = *(void *)(a1 + 72);
    if (v12) {
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v7);
    }
    goto LABEL_15;
  }
  uint64_t v8 = [v5 error];
  if (v8)
  {
    v7 = (void *)v8;
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      double v11 = *(double *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v10;
      __int16 v28 = 2114;
      double v29 = v11;
      __int16 v30 = 2114;
      v31 = v7;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to error in response body: %{public}@", buf, 0x20u);
    }

    goto LABEL_6;
  }
  id v13 = v5;
  if ([v13 needsSilentSMS])
  {
    [v13 delayInterval];
    double v15 = v14;
    id v16 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v17;
      __int16 v28 = 2050;
      double v29 = v15;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_INFO, "%{public}@ Performing delayed retry after %{public}f seconds: still needs silent SMS.", buf, 0x16u);
    }

    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
    uint64_t v19 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __134__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendSilentSMSRequestWithMessage_number_preflightResponse_completionHandler___block_invoke_105;
    block[3] = &unk_1E5ACA5D0;
    block[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 48);
    id v23 = *(id *)(a1 + 56);
    id v24 = *(id *)(a1 + 64);
    id v25 = *(id *)(a1 + 72);
    dispatch_after(v18, v19, block);
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 72);
    if (v20) {
      (*(void (**)(uint64_t, id, void))(v20 + 16))(v20, v13, 0);
    }
  }

  v7 = 0;
LABEL_15:
}

uint64_t __134__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendSilentSMSRequestWithMessage_number_preflightResponse_completionHandler___block_invoke_105(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendSilentSMSRequestWithMessage:*(void *)(a1 + 40) number:*(void *)(a1 + 48) preflightResponse:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

- (void)_sendPreflightRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ICMusicSubscriptionCarrierBundlingEligibilityOperation *)self _newDefaultRequestBodyDictionary];
  id v6 = v5;
  phoneNumber = self->_phoneNumber;
  if (phoneNumber) {
    [v5 setObject:phoneNumber forKey:@"phoneNumber"];
  }
  if (self->_deepLink) {
    [v6 setObject:@"true" forKey:@"deepLink"];
  }
  uint64_t v8 = self->_requestContext;
  v9 = self->_cellularProviderName;
  uint64_t v10 = self->_phoneNumber;
  double v11 = +[ICURLBagProvider sharedBagProvider];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __101__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendPreflightRequestWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E5AC92D0;
  v17[4] = self;
  dispatch_time_t v18 = v8;
  id v19 = v6;
  uint64_t v20 = v9;
  v21 = v10;
  id v22 = v4;
  uint64_t v12 = v10;
  id v13 = v9;
  id v14 = v6;
  id v15 = v4;
  id v16 = v8;
  [v11 getBagForRequestContext:v16 withCompletionHandler:v17];
}

void __101__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendPreflightRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    double v11 = @"fuseHeaderEnrichment";
    uint64_t v12 = [v5 urlForBagKey:@"fuseHeaderEnrichment"];
    if (v12)
    {
      uint64_t v13 = *(void *)(a1 + 48);
      id v34 = 0;
      id v14 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v13 options:0 error:&v34];
      id v15 = v34;
      id v16 = v15;
      if (!v14 || v15)
      {
        uint64_t v17 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          uint64_t v36 = v18;
          __int16 v37 = 2114;
          v38 = @"fuseHeaderEnrichment";
          __int16 v39 = 2114;
          id v40 = v16;
          _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error trying to serialize body data for %{public}@: %{public}@.", buf, 0x20u);
        }
      }
      id v19 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v12];
      [v19 setHTTPMethod:@"POST"];
      [v19 setHTTPBody:v14];
      [v19 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      uint64_t v20 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v36 = v21;
        _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_INFO, "%{public}@ Sending preflight request.", buf, 0xCu);
      }

      id v22 = [[ICStoreURLRequest alloc] initWithURLRequest:v19 requestContext:*(void *)(a1 + 40)];
      [(ICStoreURLRequest *)v22 setAnisetteVersion:2];
      [(ICURLRequest *)v22 setMaxRetryCount:0];
      id v23 = +[ICURLSessionManager highPrioritySession];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __101__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendPreflightRequestWithCompletionHandler___block_invoke_103;
      v28[3] = &unk_1E5AC9368;
      id v24 = *(void **)(a1 + 40);
      v28[4] = *(void *)(a1 + 32);
      id v29 = v24;
      id v33 = *(id *)(a1 + 72);
      __int16 v30 = @"fuseHeaderEnrichment";
      id v31 = *(id *)(a1 + 56);
      id v32 = *(id *)(a1 + 64);
      [v23 enqueueDataRequest:v22 withCompletionHandler:v28];
    }
    else
    {
      id v25 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        uint64_t v27 = *(__CFString **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v36 = v26;
        __int16 v37 = 2114;
        v38 = v27;
        _os_log_impl(&dword_1A2D01000, v25, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to missing the key in the bag.", buf, 0x16u);
      }

      if (!*(void *)(a1 + 72)) {
        goto LABEL_20;
      }
      id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }

LABEL_20:
    goto LABEL_21;
  }
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(__CFString **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v36 = v8;
    __int16 v37 = 2114;
    v38 = v9;
    __int16 v39 = 2114;
    id v40 = v6;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to URL bag load failure: %{public}@", buf, 0x20u);
  }

  uint64_t v10 = *(void *)(a1 + 72);
  if (v10) {
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v6);
  }
LABEL_21:
}

void __101__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendPreflightRequestWithCompletionHandler___block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    double v11 = [v5 parsedBodyDictionary];
    uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    uint64_t v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        uint64_t v27 = v14;
        __int16 v28 = 2114;
        uint64_t v29 = v15;
        __int16 v30 = 2114;
        id v31 = v11;
        _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Got carrier bundling response for %{public}@ with body: %{public}@", buf, 0x20u);
      }

      id v16 = [[ICMusicSubscriptionCarrierBundlingEligibilityResponse alloc] initWithEligibilityDictionary:v11 cellularProviderName:*(void *)(a1 + 56) phoneNumber:*(void *)(a1 + 64)];
      if ([(ICMusicSubscriptionCarrierBundlingEligibilityResponse *)v16 wantsDelayedRetry])
      {
        [(ICMusicSubscriptionCarrierBundlingEligibilityResponse *)v16 delayInterval];
        dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
        id v19 = dispatch_get_global_queue(0, 0);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __101__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendPreflightRequestWithCompletionHandler___block_invoke_104;
        v24[3] = &unk_1E5ACD2F0;
        v24[4] = *(void *)(a1 + 32);
        id v25 = *(id *)(a1 + 72);
        dispatch_after(v18, v19, v24);

LABEL_18:
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v23 = *(void *)(a1 + 72);
      if (!v23) {
        goto LABEL_18;
      }
      id v22 = *(void (**)(void))(v23 + 16);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        uint64_t v21 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v27 = v20;
        __int16 v28 = 2114;
        uint64_t v29 = v21;
        _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to invalid response.", buf, 0x16u);
      }

      if (!*(void *)(a1 + 72)) {
        goto LABEL_19;
      }
      id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
      id v22 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    }
    v22();
    goto LABEL_18;
  }
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v27 = v8;
    __int16 v28 = 2114;
    uint64_t v29 = v9;
    __int16 v30 = 2114;
    id v31 = v6;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ error while issuing preflight request: %{public}@", buf, 0x20u);
  }

  uint64_t v10 = *(void *)(a1 + 72);
  if (v10) {
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v6);
  }
LABEL_20:
}

uint64_t __101__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendPreflightRequestWithCompletionHandler___block_invoke_104(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendPreflightRequestWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_sendEnrichmentRequestWithURL:(id)a3 preflightResponse:(id)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = self->_requestContext;
  BOOL deepLink = self->_deepLink;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v8];
  [v13 setHTTPMethod:@"POST"];
  [v13 setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
  [v13 setValue:@"ValidateMobile" forHTTPHeaderField:@"SOAPAction"];
  uint64_t v14 = [v9 headerEnrichmentMessage];
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = [v14 dataUsingEncoding:4];
    [v13 setHTTPBody:v16];
  }
  double v17 = +[ICURLSessionManager sharedSessionManager];
  dispatch_time_t v18 = [v17 sessionWithIdentifier:@"com.apple.iTunesCloud.ICMusicSubscriptionCarrierBundlingEligibilityOperation" creationBlock:&__block_literal_global_16805];

  id v19 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v33 = self;
    _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_INFO, "%{public}@ Sending header enrichment request.", buf, 0xCu);
  }

  uint64_t v20 = [[ICURLRequest alloc] initWithURLRequest:v13 requestContext:v11];
  [(ICURLRequest *)v20 setCancelOnHTTPErrors:0];
  [(ICURLRequest *)v20 setMaxRetryCount:0];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __124__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendEnrichmentRequestWithURL_preflightResponse_completionHandler___block_invoke_81;
  v25[3] = &unk_1E5AC9340;
  id v26 = v8;
  uint64_t v27 = self;
  id v29 = v9;
  id v30 = v10;
  __int16 v28 = v11;
  BOOL v31 = deepLink;
  id v21 = v9;
  id v22 = v10;
  uint64_t v23 = v11;
  id v24 = v8;
  [v18 enqueueDataRequest:v20 withCompletionHandler:v25];
}

void __124__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendEnrichmentRequestWithURL_preflightResponse_completionHandler___block_invoke_81(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 urlResponse];
  if (v7)
  {
    id v8 = (id)v7;
    id v9 = 0;
LABEL_3:
    id v10 = [*(id *)(a1 + 56) headerEnrichmentSessionIdentifier];
    double v11 = [v5 bodyData];
    if (v11) {
      uint64_t v12 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
    }
    else {
      uint64_t v12 = 0;
    }
    id v16 = objc_msgSend(*(id *)(a1 + 40), "_newDefaultRequestBodyDictionaryWithResponseCode:error:", objc_msgSend(v8, "statusCode"), v9);
    double v17 = v16;
    if (v12) {
      [v16 setObject:v12 forKey:@"responseMessage"];
    }
    if (v10) {
      [v17 setObject:v10 forKey:@"sessionId"];
    }
    if (*(unsigned char *)(a1 + 72)) {
      [v17 setObject:@"true" forKey:@"deepLink"];
    }
    dispatch_time_t v18 = *(void **)(a1 + 40);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __124__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendEnrichmentRequestWithURL_preflightResponse_completionHandler___block_invoke_98;
    v28[3] = &unk_1E5AC9318;
    v28[4] = v18;
    id v29 = *(id *)(a1 + 48);
    id v32 = *(id *)(a1 + 64);
    id v30 = *(id *)(a1 + 32);
    id v31 = *(id *)(a1 + 56);
    [v18 _finishEnrichmentWithBodyDictionary:v17 completionHandler:v28];

    goto LABEL_16;
  }
  uint64_t v13 = [v6 domain];
  uint64_t v14 = *MEMORY[0x1E4F289A0];
  int v15 = [v13 isEqualToString:*MEMORY[0x1E4F289A0]];

  if (v15)
  {
    id v9 = (void *)[v6 copy];
    if (!v9) {
      goto LABEL_23;
    }
  }
  else
  {
    id v19 = [v6 userInfo];
    uint64_t v20 = [v19 objectForKey:*MEMORY[0x1E4F28A50]];

    id v21 = [v20 domain];
    int v22 = [v21 isEqualToString:v14];

    if (v22) {
      id v9 = (void *)[v20 copy];
    }
    else {
      id v9 = 0;
    }

    if (!v9) {
      goto LABEL_23;
    }
  }
  uint64_t v23 = [objc_alloc(MEMORY[0x1E4F18D40]) initWithURL:*(void *)(a1 + 32) statusCode:400 HTTPVersion:@"HTTP/1.1" headerFields:0];
  if (v23)
  {
    id v8 = (id)v23;
    goto LABEL_3;
  }
LABEL_23:
  id v8 = v6;
  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7601 userInfo:0];
  }
  id v24 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = *(void *)(a1 + 40);
    uint64_t v26 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    uint64_t v34 = v25;
    __int16 v35 = 2114;
    uint64_t v36 = v26;
    __int16 v37 = 2114;
    id v38 = v8;
    _os_log_impl(&dword_1A2D01000, v24, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ because header enrichment failed with error: %{public}@.", buf, 0x20u);
  }

  uint64_t v27 = *(void *)(a1 + 64);
  if (v27) {
    (*(void (**)(uint64_t, void, id))(v27 + 16))(v27, 0, v8);
  }
LABEL_16:
}

void __124__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendEnrichmentRequestWithURL_preflightResponse_completionHandler___block_invoke_98(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
LABEL_6:
    uint64_t v12 = *(void *)(a1 + 64);
    if (v12) {
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v7);
    }
    goto LABEL_15;
  }
  uint64_t v8 = [v5 error];
  if (v8)
  {
    uint64_t v7 = (void *)v8;
    id v9 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      double v11 = *(double *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v10;
      __int16 v27 = 2114;
      double v28 = v11;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to error in response body: %{public}@", buf, 0x20u);
    }

    goto LABEL_6;
  }
  id v13 = v5;
  if ([v13 needsHeaderEnrichment])
  {
    [v13 delayInterval];
    double v15 = v14;
    id v16 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v17;
      __int16 v27 = 2050;
      double v28 = v15;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_INFO, "%{public}@ Performing delayed retry after %{public}f seconds: still needs header enrichment.", buf, 0x16u);
    }

    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
    id v19 = dispatch_get_global_queue(0, 0);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __124__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendEnrichmentRequestWithURL_preflightResponse_completionHandler___block_invoke_99;
    v21[3] = &unk_1E5ACD2A0;
    v21[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 48);
    id v23 = *(id *)(a1 + 56);
    id v24 = *(id *)(a1 + 64);
    dispatch_after(v18, v19, v21);
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 64);
    if (v20) {
      (*(void (**)(uint64_t, id, void))(v20 + 16))(v20, v13, 0);
    }
  }

  uint64_t v7 = 0;
LABEL_15:
}

uint64_t __124__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendEnrichmentRequestWithURL_preflightResponse_completionHandler___block_invoke_99(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendEnrichmentRequestWithURL:*(void *)(a1 + 40) preflightResponse:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

ICURLSession *__124__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendEnrichmentRequestWithURL_preflightResponse_completionHandler___block_invoke()
{
  v0 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  [v0 setHTTPShouldSetCookies:1];
  [v0 setHTTPShouldUsePipelining:1];
  objc_msgSend(v0, "set_CTDataConnectionServiceType:", *MEMORY[0x1E4F23D58]);
  [v0 setAllowsCellularAccess:1];
  v1 = [[ICURLSession alloc] initWithConfiguration:v0];

  return v1;
}

- (id)_newDefaultRequestBodyDictionaryWithResponseCode:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = [(ICMusicSubscriptionCarrierBundlingEligibilityOperation *)self _newDefaultRequestBodyDictionary];
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
  [v7 setObject:v8 forKey:@"responseCode"];

  if (v6)
  {
    id v9 = [v6 domain];
    if (v9) {
      [v7 setObject:v9 forKey:@"error-domain"];
    }
    uint64_t v10 = [v6 code];
    if (v10)
    {
      double v11 = [NSNumber numberWithInteger:v10];
      [v7 setObject:v11 forKey:@"error-code"];
    }
    uint64_t v12 = [v6 userInfo];
    id v13 = [v12 objectForKey:*MEMORY[0x1E4F28568]];
    if (v13) {
      [v7 setObject:v13 forKey:@"error-title"];
    }
    double v14 = [v12 objectForKey:*MEMORY[0x1E4F28588]];
    if (v14) {
      [v7 setObject:v14 forKey:@"error-message"];
    }
    double v15 = [v12 objectForKey:*MEMORY[0x1E4F28A50]];
    if (v15)
    {
      id v16 = [NSString stringWithFormat:@"%@", v15];
      [v7 setObject:v16 forKey:@"error-underlying"];
    }
  }

  return v7;
}

- (id)_newDefaultRequestBodyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(ICRequestContext *)self->_requestContext deviceInfo];
  id v5 = [v4 deviceGUID];

  if (v5) {
    [v3 setObject:v5 forKey:@"guid"];
  }
  cellularProviderName = self->_cellularProviderName;
  if (cellularProviderName) {
    [v3 setObject:cellularProviderName forKey:@"carrier"];
  }
  mobileSubscriberCountryCode = self->_mobileSubscriberCountryCode;
  if (mobileSubscriberCountryCode) {
    [v3 setObject:mobileSubscriberCountryCode forKey:@"MCC"];
  }
  mobileSubscriberNetworkCode = self->_mobileSubscriberNetworkCode;
  if (mobileSubscriberNetworkCode) {
    [v3 setObject:mobileSubscriberNetworkCode forKey:@"MNC"];
  }
  IMEI = self->_IMEI;
  if (IMEI) {
    [v3 setObject:IMEI forKey:@"IMEI"];
  }

  return v3;
}

- (void)_finishEnrichmentWithBodyDictionary:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_requestContext;
  id v9 = self->_cellularProviderName;
  uint64_t v10 = self->_phoneNumber;
  double v11 = +[ICURLBagProvider sharedBagProvider];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __112__ICMusicSubscriptionCarrierBundlingEligibilityOperation__finishEnrichmentWithBodyDictionary_completionHandler___block_invoke;
  v17[3] = &unk_1E5AC92D0;
  v17[4] = self;
  dispatch_time_t v18 = v8;
  id v19 = v6;
  uint64_t v20 = v9;
  id v21 = v10;
  id v22 = v7;
  uint64_t v12 = v10;
  id v13 = v9;
  id v14 = v6;
  id v15 = v7;
  id v16 = v8;
  [v11 getBagForRequestContext:v16 withCompletionHandler:v17];
}

void __112__ICMusicSubscriptionCarrierBundlingEligibilityOperation__finishEnrichmentWithBodyDictionary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    double v11 = @"fuseHeaderEnrichmentResponse";
    uint64_t v12 = [v5 urlForBagKey:@"fuseHeaderEnrichmentResponse"];
    if (v12)
    {
      uint64_t v13 = *(void *)(a1 + 48);
      id v35 = 0;
      id v14 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v13 options:0 error:&v35];
      id v15 = v35;
      id v16 = v15;
      if (!v14 || v15)
      {
        uint64_t v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          uint64_t v37 = v18;
          __int16 v38 = 2114;
          uint64_t v39 = @"fuseHeaderEnrichmentResponse";
          __int16 v40 = 2114;
          id v41 = v16;
          _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error trying to serialize body data for %{public}@: %{public}@.", buf, 0x20u);
        }
      }
      id v19 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v12];
      [v19 setHTTPMethod:@"POST"];
      [v19 setHTTPBody:v14];
      [v19 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      uint64_t v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v37 = v21;
        _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_INFO, "%{public}@ Sending header enrichment response.", buf, 0xCu);
      }

      id v22 = [[ICStoreURLRequest alloc] initWithURLRequest:v19 requestContext:*(void *)(a1 + 40)];
      [(ICURLRequest *)v22 setMaxRetryCount:0];
      id v23 = +[ICURLSessionManager highPrioritySession];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __112__ICMusicSubscriptionCarrierBundlingEligibilityOperation__finishEnrichmentWithBodyDictionary_completionHandler___block_invoke_21;
      v28[3] = &unk_1E5AC92A8;
      id v24 = *(void **)(a1 + 40);
      v28[4] = *(void *)(a1 + 32);
      id v29 = v24;
      id v34 = *(id *)(a1 + 72);
      id v30 = @"fuseHeaderEnrichmentResponse";
      id v31 = *(id *)(a1 + 56);
      id v32 = *(id *)(a1 + 64);
      id v33 = *(id *)(a1 + 48);
      [v23 enqueueDataRequest:v22 withCompletionHandler:v28];
    }
    else
    {
      uint64_t v25 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        __int16 v27 = *(__CFString **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = v26;
        __int16 v38 = 2114;
        uint64_t v39 = v27;
        _os_log_impl(&dword_1A2D01000, v25, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to missing the key in the bag.", buf, 0x16u);
      }

      if (!*(void *)(a1 + 72)) {
        goto LABEL_20;
      }
      id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }

LABEL_20:
    goto LABEL_21;
  }
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(__CFString **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v37 = v8;
    __int16 v38 = 2114;
    uint64_t v39 = v9;
    __int16 v40 = 2114;
    id v41 = v6;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to URL bag load failure: %{public}@", buf, 0x20u);
  }

  uint64_t v10 = *(void *)(a1 + 72);
  if (v10) {
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v6);
  }
LABEL_21:
}

void __112__ICMusicSubscriptionCarrierBundlingEligibilityOperation__finishEnrichmentWithBodyDictionary_completionHandler___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    double v11 = [v5 parsedBodyDictionary];
    uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    uint64_t v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        uint64_t v31 = v14;
        __int16 v32 = 2114;
        uint64_t v33 = v15;
        __int16 v34 = 2114;
        id v35 = v11;
        _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Got carrier bundling response for %{public}@ with body: %{public}@", buf, 0x20u);
      }

      id v16 = [[ICMusicSubscriptionCarrierBundlingEligibilityResponse alloc] initWithEligibilityDictionary:v11 cellularProviderName:*(void *)(a1 + 56) phoneNumber:*(void *)(a1 + 64)];
      if ([(ICMusicSubscriptionCarrierBundlingEligibilityResponse *)v16 wantsDelayedRetry])
      {
        [(ICMusicSubscriptionCarrierBundlingEligibilityResponse *)v16 delayInterval];
        dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
        id v19 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __112__ICMusicSubscriptionCarrierBundlingEligibilityOperation__finishEnrichmentWithBodyDictionary_completionHandler___block_invoke_23;
        block[3] = &unk_1E5ACD250;
        block[4] = *(void *)(a1 + 32);
        id v28 = *(id *)(a1 + 72);
        id v29 = *(id *)(a1 + 80);
        dispatch_after(v18, v19, block);
      }
      else
      {
        id v22 = [(ICMusicSubscriptionCarrierBundlingEligibilityResponse *)v16 error];
        if (v22)
        {
          id v23 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = *(void *)(a1 + 32);
            uint64_t v25 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138543874;
            uint64_t v31 = v24;
            __int16 v32 = 2114;
            uint64_t v33 = v25;
            __int16 v34 = 2114;
            id v35 = v22;
            _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to error in response body: %{public}@", buf, 0x20u);
          }

          id v16 = 0;
        }
        uint64_t v26 = *(void *)(a1 + 80);
        if (v26) {
          (*(void (**)(uint64_t, ICMusicSubscriptionCarrierBundlingEligibilityResponse *, void *))(v26 + 16))(v26, v16, v22);
        }
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        uint64_t v21 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v20;
        __int16 v32 = 2114;
        uint64_t v33 = v21;
        _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to invalid response.", buf, 0x16u);
      }

      if (!*(void *)(a1 + 80)) {
        goto LABEL_23;
      }
      id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    }

LABEL_23:
    goto LABEL_24;
  }
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v31 = v8;
    __int16 v32 = 2114;
    uint64_t v33 = v9;
    __int16 v34 = 2114;
    id v35 = v6;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ error while sending header enrichment response: %{public}@", buf, 0x20u);
  }

  uint64_t v10 = *(void *)(a1 + 80);
  if (v10) {
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v6);
  }
LABEL_24:
}

uint64_t __112__ICMusicSubscriptionCarrierBundlingEligibilityOperation__finishEnrichmentWithBodyDictionary_completionHandler___block_invoke_23(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishEnrichmentWithBodyDictionary:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)execute
{
  id v4 = +[ICDeviceInfo currentDeviceInfo];
  int v5 = [v4 isPhoneNumberAccessRestricted];

  if (v5)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"ICMusicSubscriptionCarrierBundlingEligibilityOperation.m" lineNumber:47 description:@"Phone number access is restricted."];
  }
  id v6 = self->_requestContext;
  id v7 = (void *)MEMORY[0x1A6240BF0](self->_responseHandler);
  uint64_t v8 = +[ICTelephonyController sharedController];
  uint64_t v9 = [v8 providerName];
  cellularProviderName = self->_cellularProviderName;
  self->_cellularProviderName = v9;

  double v11 = [v8 mobileSubscriberCountryCode];
  mobileSubscriberCountryCode = self->_mobileSubscriberCountryCode;
  self->_mobileSubscriberCountryCode = v11;

  uint64_t v13 = [v8 mobileSubscriberNetworkCode];
  mobileSubscriberNetworkCode = self->_mobileSubscriberNetworkCode;
  self->_mobileSubscriberNetworkCode = v13;

  uint64_t v15 = [v8 phoneNumber];
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = v15;

  double v17 = [v8 IMEI];
  IMEI = self->_IMEI;
  self->_IMEI = v17;

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke;
  v22[3] = &unk_1E5AC9280;
  v22[4] = self;
  id v23 = v6;
  id v24 = v7;
  id v19 = v7;
  uint64_t v20 = v6;
  [(ICMusicSubscriptionCarrierBundlingEligibilityOperation *)self _sendPreflightRequestWithCompletionHandler:v22];
}

void __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v60 = 0;
  v61 = (id *)&v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__16882;
  v64 = __Block_byref_object_dispose__16883;
  id v65 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__16882;
  v58 = __Block_byref_object_dispose__16883;
  id v7 = a3;
  id v59 = v7;
  id v8 = v7;
  if (!v7)
  {
    uint64_t v10 = [v6 error];
    double v11 = (void *)v55[5];
    v55[5] = v10;

    if (!v55[5]) {
      goto LABEL_9;
    }
    uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = v55[5];
      *(_DWORD *)buf = 138543874;
      uint64_t v67 = v13;
      __int16 v68 = 2114;
      uint64_t v69 = v14;
      __int16 v70 = 2114;
      uint64_t v71 = v15;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to error in response body: %{public}@", buf, 0x20u);
    }

    id v8 = (id)v55[5];
    if (!v8)
    {
LABEL_9:
      if ((unint64_t)([v6 carrierBundlingStatusType] - 1) < 4) {
        objc_storeStrong(v61 + 5, a2);
      }
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke_6;
      v52[3] = &unk_1E5AC9230;
      id v16 = v6;
      id v53 = v16;
      double v17 = (void (**)(void, void))MEMORY[0x1A6240BF0](v52);
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke_2;
      v47[3] = &unk_1E5AC9258;
      uint64_t v18 = *(void *)(a1 + 32);
      id v19 = *(void **)(a1 + 40);
      v50 = &v54;
      v47[4] = v18;
      id v48 = v19;
      v51 = &v60;
      id v49 = *(id *)(a1 + 48);
      uint64_t v20 = (void (**)(void, void, void))MEMORY[0x1A6240BF0](v47);
      if ([v16 needsHeaderEnrichment])
      {
        uint64_t v21 = [v16 headerEnrichmentURL];
        if (v21)
        {
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke_10;
          v43[3] = &unk_1E5ACD2A0;
          v43[4] = *(void *)(a1 + 32);
          id v22 = v21;
          id v44 = v22;
          id v45 = v16;
          v46 = v20;
          ((void (**)(void, void *))v17)[2](v17, v43);
        }
        else
        {
          uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7601 userInfo:0];
          __int16 v27 = (void *)v55[5];
          v55[5] = v26;

          id v28 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            uint64_t v29 = *(void *)(a1 + 32);
            uint64_t v30 = *(void *)(a1 + 40);
            uint64_t v31 = v55[5];
            *(_DWORD *)buf = 138543874;
            uint64_t v67 = v29;
            __int16 v68 = 2114;
            uint64_t v69 = v30;
            __int16 v70 = 2114;
            uint64_t v71 = v31;
            _os_log_impl(&dword_1A2D01000, v28, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to missing header enrichment URL in response body: %{public}@", buf, 0x20u);
          }

          v20[2](v20, 0, v55[5]);
          id v22 = 0;
        }
      }
      else
      {
        if (![v16 needsSilentSMS])
        {
          uint64_t v25 = *(void *)(a1 + 48);
          if (v25) {
            (*(void (**)(uint64_t, id, void))(v25 + 16))(v25, v61[5], 0);
          }
          [*(id *)(a1 + 32) finishWithError:0];
          goto LABEL_29;
        }
        id v22 = [v16 silentSMSMessage];
        uint64_t v23 = [v16 silentSMSNumber];
        id v24 = (void *)v23;
        if (v22 && v23)
        {
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke_12;
          v38[3] = &unk_1E5ACA5D0;
          v38[4] = *(void *)(a1 + 32);
          id v39 = v22;
          id v40 = v24;
          id v41 = v16;
          uint64_t v42 = v20;
          ((void (**)(void, void *))v17)[2](v17, v38);
        }
        else
        {
          uint64_t v32 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7601 userInfo:0];
          uint64_t v33 = (void *)v55[5];
          v55[5] = v32;

          __int16 v34 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            uint64_t v35 = *(void *)(a1 + 32);
            uint64_t v36 = *(void *)(a1 + 40);
            uint64_t v37 = v55[5];
            *(_DWORD *)buf = 138543874;
            uint64_t v67 = v35;
            __int16 v68 = 2114;
            uint64_t v69 = v36;
            __int16 v70 = 2114;
            uint64_t v71 = v37;
            _os_log_impl(&dword_1A2D01000, v34, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to missing silent SMS message or number in response body: %{public}@", buf, 0x20u);
          }

          v20[2](v20, 0, v55[5]);
        }
      }
LABEL_29:

      goto LABEL_30;
    }
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9)
  {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v8);
    id v8 = (id)v55[5];
  }
  [*(id *)(a1 + 32) finishWithError:v8];
LABEL_30:
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
}

void __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke_6(uint64_t a1, void *a2)
{
  block = a2;
  [*(id *)(a1 + 32) delayInterval];
  if (v3 <= 0.00000011920929)
  {
    block[2]();
  }
  else
  {
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    int v5 = dispatch_get_global_queue(0, 0);
    dispatch_after(v4, v5, block);
  }
}

void __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  uint64_t v8 = *(void *)(a1 + 56);
  if (!*(void *)(*(void *)(v8 + 8) + 40))
  {
    uint64_t v9 = [v6 error];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    double v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      goto LABEL_6;
    }
    uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v17 = 138543874;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      uint64_t v22 = v15;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to error in response body: %{public}@", (uint8_t *)&v17, 0x20u);
    }

    uint64_t v8 = *(void *)(a1 + 56);
    if (!*(void *)(*(void *)(v8 + 8) + 40))
    {
LABEL_6:
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
      uint64_t v8 = *(void *)(a1 + 56);
    }
  }
  uint64_t v16 = *(void *)(a1 + 48);
  if (v16)
  {
    (*(void (**)(uint64_t, void, void))(v16 + 16))(v16, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(void *)(*(void *)(v8 + 8) + 40));
    uint64_t v8 = *(void *)(a1 + 56);
  }
  [*(id *)(a1 + 32) finishWithError:*(void *)(*(void *)(v8 + 8) + 40)];
}

uint64_t __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendEnrichmentRequestWithURL:*(void *)(a1 + 40) preflightResponse:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

uint64_t __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendSilentSMSRequestWithMessage:*(void *)(a1 + 40) number:*(void *)(a1 + 48) preflightResponse:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

- (ICMusicSubscriptionCarrierBundlingEligibilityOperation)initWithRequestContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICMusicSubscriptionCarrierBundlingEligibilityOperation;
  id v6 = [(ICAsyncOperation *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_requestContext, a3);
  }

  return v7;
}

@end