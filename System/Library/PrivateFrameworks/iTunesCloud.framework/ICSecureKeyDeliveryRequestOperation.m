@interface ICSecureKeyDeliveryRequestOperation
- (ICSecureKeyDeliveryRequest)request;
- (id)_createDefaultProtocolRequestBodyUsingPlaybackContextData:(id)a3;
- (id)_createPodcastLicenseProtocolRequestBodyUsingPlaybackContextData:(id)a3;
- (id)_createSimplifiedProtocolRequestBodyUsingPlaybackContextData:(id)a3;
- (id)responseHandler;
- (void)_createServerPlaybackContextWithCompletion:(id)a3;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation ICSecureKeyDeliveryRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setRequest:(id)a3
{
}

- (ICSecureKeyDeliveryRequest)request
{
  return self->_request;
}

- (void)_createServerPlaybackContextWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  v5 = [(ICSecureKeyDeliveryRequest *)self->_request serverPlaybackContextData];

  if (v5)
  {
    v6 = [(ICSecureKeyDeliveryRequest *)self->_request serverPlaybackContextData];
    v4[2](v4, v6, 0);
  }
  else
  {
    v6 = [(ICSecureKeyDeliveryRequest *)self->_request requestContext];
    [(ICSecureKeyDeliveryRequest *)self->_request isITunesStoreRequest];
    v7 = (objc_class *)objc_opt_class();
    v8 = [(ICSecureKeyDeliveryRequest *)self->_request certificateURL];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v8];
    [v9 setHTTPMethod:@"GET"];
    v10 = (void *)[[v7 alloc] initWithURLRequest:v9 requestContext:v6];
    [v10 enableLoadURLMetricsWithRequestName:@"skd/certificate"];
    v11 = +[ICURLSessionManager highPrioritySession];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__ICSecureKeyDeliveryRequestOperation__createServerPlaybackContextWithCompletion___block_invoke;
    v12[3] = &unk_1E5ACD400;
    v12[4] = self;
    v13 = v4;
    [v11 enqueueDataRequest:v10 withCompletionHandler:v12];
  }
}

void __82__ICSecureKeyDeliveryRequestOperation__createServerPlaybackContextWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a2 bodyData];
  if ([v6 length])
  {
    v7 = [*(id *)(*(void *)(a1 + 32) + 288) contentKeyRequest];
    v8 = [*(id *)(*(void *)(a1 + 32) + 288) resourceLoadingRequest];
    v9 = v8;
    if (v7)
    {
      v10 = [v7 identifier];
      v11 = [v10 dataUsingEncoding:4];

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __82__ICSecureKeyDeliveryRequestOperation__createServerPlaybackContextWithCompletion___block_invoke_114;
      v30[3] = &unk_1E5ACD3D8;
      v12 = *(void **)(a1 + 40);
      v30[4] = *(void *)(a1 + 32);
      id v31 = v12;
      [v7 makeStreamingContentKeyRequestDataForApp:v6 contentIdentifier:v11 options:MEMORY[0x1E4F1CC08] completionHandler:v30];
      v13 = v31;
    }
    else
    {
      if (!v8)
      {
        v25 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          uint64_t v26 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          uint64_t v33 = v26;
          _os_log_impl(&dword_1A2D01000, v25, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - No contentKeyRequest or resourceLoadingRequest provided", buf, 0xCu);
        }

        uint64_t v27 = *(void *)(a1 + 40);
        v11 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7101, @"No contentKeyRequest or resourceLoadingRequest provided");
        (*(void (**)(uint64_t, void, void *))(v27 + 16))(v27, 0, v11);
        goto LABEL_18;
      }
      v17 = [v8 request];
      v11 = [v17 URL];

      v28 = [v11 host];
      v18 = [v28 dataUsingEncoding:4];
      id v29 = 0;
      v19 = [v9 streamingContentKeyRequestDataForApp:v6 contentIdentifier:v18 options:0 error:&v29];
      id v20 = v29;
      if (v20)
      {
        v21 = v20;
        v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v33 = v23;
          __int16 v34 = 2114;
          id v35 = v21;
          _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Failed to create content key request data. err=%{public}@", buf, 0x16u);
        }

        v24 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", 0, v21, @"Failed to create content key request data");
      }
      else
      {
        v24 = 0;
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

      v13 = v28;
    }

LABEL_18:
    goto LABEL_19;
  }
  v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = v15;
    __int16 v34 = 2114;
    id v35 = v5;
    _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Failed to load certificate data with error: %{public}@", buf, 0x16u);
  }

  uint64_t v16 = *(void *)(a1 + 40);
  v7 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -7300, v5, @"Failed to load certificate data");
  (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v7);
LABEL_19:
}

void __82__ICSecureKeyDeliveryRequestOperation__createServerPlaybackContextWithCompletion___block_invoke_114(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Failed to create content key request data. err=%{public}@", (uint8_t *)&v10, 0x16u);
    }

    v9 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", 0, v6, @"Failed to create content key request data");
  }
  else
  {
    v9 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_createPodcastLicenseProtocolRequestBodyUsingPlaybackContextData:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICSecureKeyDeliveryRequestOperation *)self request];
  id v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:8];
  if ([v4 length])
  {
    v7 = [v4 base64EncodedStringWithOptions:0];
    if ([v7 length]) {
      [v6 setObject:v7 forKey:@"spc"];
    }
  }
  uint64_t v8 = [v5 contentURI];
  if (v8) {
    [v6 setObject:v8 forKey:@"uri"];
  }
  v9 = [v5 adamID];
  if (v9) {
    [v6 setObject:v9 forKey:@"adam-id"];
  }
  [v6 setObject:&unk_1EF640B70 forKey:@"id"];
  v14[1] = @"license-requests";
  v15[0] = &unk_1EF640B70;
  id v13 = v6;
  v14[0] = @"version";
  int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v15[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v11;
}

- (id)_createSimplifiedProtocolRequestBodyUsingPlaybackContextData:(id)a3
{
  id v4 = a3;
  id v5 = [(ICSecureKeyDeliveryRequestOperation *)self request];
  id v6 = [v5 requestContext];
  v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:8];
  if ([v4 length])
  {
    uint64_t v8 = [v4 base64EncodedStringWithOptions:0];
    if ([v8 length]) {
      [v7 setObject:v8 forKey:@"spc"];
    }
  }
  if ([v5 shouldIncludeDeviceGUID])
  {
    v9 = [v6 deviceInfo];
    int v10 = [v9 deviceGUID];

    if (v10) {
      [v7 setObject:v10 forKey:@"guid"];
    }
  }
  uint64_t v11 = [v5 contentURI];
  if (v11) {
    [v7 setObject:v11 forKey:@"keyUri"];
  }
  __int16 v12 = [v5 adamID];
  if (v12) {
    [v7 setObject:v12 forKey:@"adamId"];
  }
  if ([v5 isOfflineDownload]) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKey:@"offline"];
  }

  return v7;
}

- (id)_createDefaultProtocolRequestBodyUsingPlaybackContextData:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICSecureKeyDeliveryRequestOperation *)self request];
  id v6 = [v5 requestContext];
  v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:8];
  if ([v4 length])
  {
    uint64_t v8 = [v4 base64EncodedStringWithOptions:0];
    if ([v8 length]) {
      [v7 setObject:v8 forKey:@"spc"];
    }
  }
  if ([v5 shouldIncludeDeviceGUID])
  {
    v9 = [v6 deviceInfo];
    int v10 = [v9 deviceGUID];

    if (v10) {
      [v7 setObject:v10 forKey:@"guid"];
    }
  }
  [v7 setObject:&unk_1EF640B58 forKey:@"id"];
  uint64_t v11 = [v5 contentURI];
  if (v11) {
    [v7 setObject:v11 forKey:@"uri"];
  }
  uint64_t v12 = [v5 rentalID];
  if (v12)
  {
    id v13 = [NSNumber numberWithLongLong:v12];
    [v7 setObject:v13 forKey:@"rental-id"];
  }
  if ([v5 skippedRentalCheckout]) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKey:@"skipped-rental-checkout"];
  }
  unint64_t v14 = [v5 leaseActionType] - 1;
  if (v14 <= 2) {
    [v7 setObject:off_1E5ACD420[v14] forKey:@"lease-action"];
  }
  v22 = @"fairplay-streaming-request";
  v20[1] = @"streaming-keys";
  v21[0] = &unk_1EF640B70;
  v19 = v7;
  v20[0] = @"version";
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v21[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v23[0] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];

  return v17;
}

- (void)execute
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __46__ICSecureKeyDeliveryRequestOperation_execute__block_invoke;
  v28[3] = &unk_1E5ACD348;
  v28[4] = self;
  v3 = (void (**)(void, void, void))MEMORY[0x1A6240BF0](v28, a2);
  id v4 = [(ICSecureKeyDeliveryRequestOperation *)self request];
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v30 = self;
    __int16 v31 = 2114;
    v32 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Executing request %{public}@", buf, 0x16u);
  }

  id v6 = [v4 certificateURL];
  uint64_t v7 = [v4 keyServerURL];
  uint64_t v8 = (void *)v7;
  if (v6 && v7)
  {
    v9 = [v4 resourceLoadingRequest];
    if (v9 || ([v4 contentKeyRequest], (v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {

      goto LABEL_8;
    }
    v19 = [v4 serverPlaybackContextData];

    if (v19)
    {
LABEL_8:
      int v10 = [v4 isITunesStoreRequest];
      uint64_t v11 = [v4 requestContext];
      if (v11)
      {
        if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          uint64_t v12 = +[ICURLSessionManager highPrioritySession];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          void v21[2] = __46__ICSecureKeyDeliveryRequestOperation_execute__block_invoke_7;
          v21[3] = &unk_1E5ACD3B0;
          v21[4] = self;
          uint64_t v26 = v3;
          id v22 = v4;
          id v23 = v8;
          char v27 = v10;
          id v24 = v11;
          id v25 = v12;
          id v13 = v12;
          [(ICSecureKeyDeliveryRequestOperation *)self _createServerPlaybackContextWithCompletion:v21];

LABEL_22:
          goto LABEL_23;
        }
        v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v30 = self;
          v18 = "[%{public}@]: [SKD] - Requesting iTunes Store content with a non-store request context.";
          goto LABEL_20;
        }
      }
      else
      {
        v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v30 = self;
          v18 = "[%{public}@]: [SKD] - Missing request context.";
LABEL_20:
          _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
        }
      }

      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7101 userInfo:0];
      ((void (**)(void, void, id))v3)[2](v3, 0, v13);
      goto LABEL_22;
    }
    id v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = self;
      _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@]: [SKD] - Missing content key request data", buf, 0xCu);
    }

    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = @"Missing content key request data";
  }
  else
  {
    unint64_t v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v30 = self;
      __int16 v31 = 2114;
      v32 = v6;
      __int16 v33 = 2114;
      __int16 v34 = v8;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]: [SKD] - Missing certificate URL: %{public}@ or key server URL: %{public}@", buf, 0x20u);
    }

    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = @"Missing certificate URL or key server URL";
  }
  uint64_t v11 = objc_msgSend(v15, "msv_errorWithDomain:code:debugDescription:", @"ICError", -7101, v16);
  ((void (**)(void, void, void *))v3)[2](v3, 0, v11);
LABEL_23:
}

void __46__ICSecureKeyDeliveryRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ [SKD] - Finished with error %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v9 = *(void **)(a1 + 32);
  uint64_t v10 = v9[37];
  if (v10)
  {
    (*(void (**)(void, id, id))(v10 + 16))(v9[37], v5, v6);
    v9 = *(void **)(a1 + 32);
  }
  [v9 finishWithError:v6];
}

void __46__ICSecureKeyDeliveryRequestOperation_execute__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 40) requestProtocolType];
    if (v7 == 2)
    {
      uint64_t v8 = [*(id *)(a1 + 32) _createPodcastLicenseProtocolRequestBodyUsingPlaybackContextData:v5];
    }
    else
    {
      if (v7 == 1) {
        [*(id *)(a1 + 32) _createSimplifiedProtocolRequestBodyUsingPlaybackContextData:v5];
      }
      else {
      uint64_t v8 = [*(id *)(a1 + 32) _createDefaultProtocolRequestBodyUsingPlaybackContextData:v5];
      }
    }
    uint64_t v12 = (void *)v8;
    id v37 = 0;
    __int16 v13 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:0 error:&v37];
    id v14 = v37;
    uint64_t v15 = v14;
    if (!v13 || v14)
    {
      v28 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v39 = v29;
        __int16 v40 = 2114;
        id v41 = v15;
        _os_log_impl(&dword_1A2D01000, v28, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Failed to serialize key server request data with error: %{public}@", buf, 0x16u);
      }

      uint64_t v30 = *(void *)(a1 + 72);
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -7101, v15, @"Failed to serialize key server request data");
      (*(void (**)(uint64_t, void, void *))(v30 + 16))(v30, 0, v16);
    }
    else
    {
      id v32 = v6;
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:*(void *)(a1 + 48)];
      __int16 v31 = v13;
      [v16 setHTTPBody:v13];
      [v16 setHTTPMethod:@"POST"];
      [v16 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      if ([*(id *)(a1 + 40) requestProtocolType] == 2
        && [*(id *)(a1 + 40) leaseActionType] == 3)
      {
        v17 = [*(id *)(a1 + 40) accountDSID];

        if (v17)
        {
          v18 = [*(id *)(a1 + 40) accountDSID];
          v19 = [v18 stringValue];
          [v16 setValue:v19 forHTTPHeaderField:@"X-Secure-Invalidation-Dsid"];
        }
      }
      id v20 = (void *)[objc_alloc((Class)objc_opt_class()) initWithURLRequest:v16 requestContext:*(void *)(a1 + 56)];
      v21 = NSString;
      id v22 = [*(id *)(a1 + 32) request];
      id v23 = [v22 adamID];
      BOOL v24 = [v23 longLongValue] == 0;
      id v25 = [*(id *)(a1 + 32) request];
      uint64_t v26 = objc_msgSend(v21, "stringWithFormat:", @"skd/key?shared=%d&persistent=%d", v24, objc_msgSend(v25, "isOfflineDownload"));

      [v20 enableLoadURLMetricsWithRequestName:v26];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __46__ICSecureKeyDeliveryRequestOperation_execute__block_invoke_25;
      v33[3] = &unk_1E5ACD388;
      v33[4] = *(void *)(a1 + 32);
      char v27 = *(void **)(a1 + 64);
      id v36 = *(id *)(a1 + 72);
      id v34 = *(id *)(a1 + 40);
      id v35 = v5;
      [v27 enqueueDataRequest:v20 withCompletionHandler:v33];

      __int16 v13 = v31;
      id v6 = v32;
      uint64_t v15 = 0;
    }
  }
  else
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v39 = v10;
      __int16 v40 = 2114;
      id v41 = v6;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Failed to generate server playback context data with error: %{public}@", buf, 0x16u);
    }

    uint64_t v11 = *(void *)(a1 + 72);
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -7101, v6, @"Failed to generate server playback context data");
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
  }
}

void __46__ICSecureKeyDeliveryRequestOperation_execute__block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a2 parsedBodyDictionary];
  if ([v6 count])
  {
    uint64_t v7 = [*(id *)(a1 + 40) requestProtocolType];
    if (v7 == 2)
    {
      uint64_t v16 = objc_msgSend(v6, "ic_arrayValueForKey:", @"license-responses");
      v17 = v16;
      if (v16)
      {
        id v8 = [v16 objectAtIndexedSubscript:0];
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      if (v7 == 1)
      {
        id v8 = v6;
        if (!v8)
        {
LABEL_5:
          v9 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            uint64_t v43 = v10;
            __int16 v44 = 2114;
            id v45 = 0;
            _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: [SKD] - Missing key dictionary in response: %{public}@", buf, 0x16u);
          }

          uint64_t v11 = *(void *)(a1 + 56);
          uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
          (*(void (**)(uint64_t, void, ICSecureKeyDeliveryResponse *))(v11 + 16))(v11, 0, v12);
          goto LABEL_38;
        }
LABEL_28:
        uint64_t v12 = [[ICSecureKeyDeliveryResponse alloc] initWithResponseDictionary:v8 serverPlaybackContextData:*(void *)(a1 + 48)];
        if ([(ICSecureKeyDeliveryResponse *)v12 status])
        {
          id v23 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            uint64_t v43 = v24;
            __int16 v44 = 2114;
            id v45 = v8;
            _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Received non-zero status in response: %{public}@", buf, 0x16u);
          }

          uint64_t v25 = *(void *)(a1 + 56);
          uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v27 = [(ICSecureKeyDeliveryResponse *)v12 status];
          v28 = @"ICKeyServerError";
          uint64_t v29 = @"Key server returned non-zero status in response";
          uint64_t v30 = v26;
        }
        else
        {
          if ([*(id *)(a1 + 40) leaseActionType] == 3
            || ([(ICSecureKeyDeliveryResponse *)v12 contentKeyContextData],
                id v32 = objc_claimAutoreleasedReturnValue(),
                v32,
                v32))
          {
            __int16 v33 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v34 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 138543362;
              uint64_t v43 = v34;
              _os_log_impl(&dword_1A2D01000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@]: [SKD] - Loaded successfully.", buf, 0xCu);
            }

            (*(void (**)(void, ICSecureKeyDeliveryResponse *, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v12, 0);
            goto LABEL_38;
          }
          id v35 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            uint64_t v36 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            uint64_t v43 = v36;
            __int16 v44 = 2114;
            id v45 = v8;
            _os_log_impl(&dword_1A2D01000, v35, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Missing content key context data in response: %{public}@", buf, 0x16u);
          }

          uint64_t v25 = *(void *)(a1 + 56);
          uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
          v28 = @"ICError";
          uint64_t v29 = @"Missing content key context data in response";
          uint64_t v27 = -7102;
        }
        __int16 v31 = objc_msgSend(v30, "msv_errorWithDomain:code:debugDescription:", v28, v27, v29, (void)v37);
        (*(void (**)(uint64_t, void, void *))(v25 + 16))(v25, 0, v31);

LABEL_38:
        goto LABEL_39;
      }
      v18 = objc_msgSend(v6, "ic_dictionaryValueForKey:", @"fairplay-streaming-response");
      v17 = v18;
      if (v18)
      {
        v18 = objc_msgSend(v18, "ic_arrayValueForKey:", @"streaming-keys");
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v19 = v18;
      id v8 = (id)[v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v8)
      {
        uint64_t v20 = *(void *)v38;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v38 != v20) {
              objc_enumerationMutation(v19);
            }
            id v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if (_NSIsNSDictionary())
            {
              id v8 = v22;
              goto LABEL_25;
            }
          }
          id v8 = (id)[v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_25:
    }
    if (!v8) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
  __int16 v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v43 = v14;
    __int16 v44 = 2114;
    id v45 = v5;
    _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Key server request returned error: %{public}@.", buf, 0x16u);
  }

  uint64_t v15 = *(void *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -7102, v5, @"Key server request returned error");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v8);
LABEL_39:
}

@end