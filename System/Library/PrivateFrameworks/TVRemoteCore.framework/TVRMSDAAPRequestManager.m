@interface TVRMSDAAPRequestManager
- (NSString)homeSharingGroupKey;
- (NSString)hostName;
- (NSString)pairingGUID;
- (TVRMSDAAPRequestManager)init;
- (TVRMSDAAPRequestManagerDelegate)delegate;
- (TVRMSFairPlaySession)fairPlaySession;
- (id)requestControlCommand:(id)a3 text:(id)a4 data:(id)a5 controlValue:(int64_t)a6 promptRevision:(int64_t)a7 completionHandler:(id)a8;
- (id)requestControlCommand:(id)a3 text:(id)a4 promptRevision:(int64_t)a5 completionHandler:(id)a6;
- (id)requestWithPath:(id)a3 method:(id)a4 postData:(id)a5 queryArgs:(id)a6 completionHandler:(id)a7;
- (int64_t)port;
- (int64_t)sessionIdentifier;
- (void)setDelegate:(id)a3;
- (void)setFairPlaySession:(id)a3;
- (void)setHomeSharingGroupKey:(id)a3;
- (void)setHostName:(id)a3;
- (void)setPairingGUID:(id)a3;
- (void)setPort:(int64_t)a3;
- (void)setSessionIdentifier:(int64_t)a3;
@end

@implementation TVRMSDAAPRequestManager

- (TVRMSDAAPRequestManager)init
{
  v15[5] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)TVRMSDAAPRequestManager;
  v2 = [(TVRMSDAAPRequestManager *)&v13 init];
  if (v2)
  {
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d.%d", 3, 12);
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld", 3, 10);
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld", 1, 2);
    v6 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
    v14[0] = @"Accept-Encoding";
    v14[1] = @"Viewer-Only-Client";
    v15[0] = @"gzip";
    v15[1] = @"1";
    v14[2] = @"Client-DAAP-Version";
    v14[3] = @"Client-iTunes-Sharing-Version";
    v15[2] = v3;
    v15[3] = v4;
    v14[4] = @"Client-ATV-Sharing-Version";
    v15[4] = v5;
    v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];
    [v6 setHTTPAdditionalHeaders:v7];

    v8 = (void *)MEMORY[0x263F08BF8];
    v9 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v10 = [v8 sessionWithConfiguration:v6 delegate:0 delegateQueue:v9];
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v10;
  }
  return v2;
}

- (id)requestWithPath:(id)a3 method:(id)a4 postData:(id)a5 queryArgs:(id)a6 completionHandler:(id)a7
{
  v68[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__0;
  v57 = __Block_byref_object_dispose__0;
  id v58 = (id)objc_opt_new();
  [(id)v54[5] setScheme:@"http"];
  [(id)v54[5] setHost:self->_hostName];
  v17 = [NSNumber numberWithInteger:self->_port];
  [(id)v54[5] setPort:v17];

  v18 = [NSString stringWithFormat:@"/%@", v12];
  [(id)v54[5] setPath:v18];

  if (self->_sessionIdentifier)
  {
    v19 = (void *)v54[5];
    v67 = @"session-id";
    v20 = objc_msgSend(NSNumber, "numberWithInteger:");
    v68[0] = v20;
    v21 = [NSDictionary dictionaryWithObjects:v68 forKeys:&v67 count:1];
    uint64_t v22 = objc_msgSend(v19, "rms_componentsByAddingQueryParameters:", v21);
    v23 = (void *)v54[5];
    v54[5] = v22;
  }
  homeSharingGroupKey = self->_homeSharingGroupKey;
  if (homeSharingGroupKey)
  {
    v25 = (void *)v54[5];
    v65 = @"hsgid";
    v66 = homeSharingGroupKey;
    v26 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    uint64_t v27 = objc_msgSend(v25, "rms_componentsByAddingQueryParameters:", v26);
    v28 = (void *)v54[5];
    v54[5] = v27;
  }
  pairingGUID = self->_pairingGUID;
  if (pairingGUID)
  {
    v30 = (void *)v54[5];
    v63 = @"pairing-guid";
    v64 = pairingGUID;
    v31 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
    uint64_t v32 = objc_msgSend(v30, "rms_componentsByAddingQueryParameters:", v31);
    v33 = (void *)v54[5];
    v54[5] = v32;
  }
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __87__TVRMSDAAPRequestManager_requestWithPath_method_postData_queryArgs_completionHandler___block_invoke;
  v52[3] = &unk_2647AEDD8;
  v52[4] = &v53;
  [v15 enumerateKeysAndObjectsUsingBlock:v52];
  v34 = (void *)MEMORY[0x263F089E0];
  v35 = [(id)v54[5] URL];
  v36 = [v34 requestWithURL:v35];

  [v36 setHTTPMethod:v13];
  [v36 setHTTPBody:v14];
  if ([(TVRMSFairPlaySession *)self->_fairPlaySession isHandshakeComplete])
  {
    fairPlaySession = self->_fairPlaySession;
    v38 = [(id)v54[5] URL];
    v39 = [(TVRMSFairPlaySession *)fairPlaySession headerForURL:v38];

    [v36 addValue:v39 forHTTPHeaderField:@"Client-DAAP-Validation"];
  }
  v40 = _TVRCRMSLog();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = [(id)v54[5] URL];
    v42 = [v41 absoluteString];
    *(_DWORD *)buf = 138412546;
    id v60 = v13;
    __int16 v61 = 2112;
    v62 = v42;
    _os_log_impl(&dword_2266D3000, v40, OS_LOG_TYPE_DEFAULT, "%@/ %@", buf, 0x16u);
  }
  urlSession = self->_urlSession;
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __87__TVRMSDAAPRequestManager_requestWithPath_method_postData_queryArgs_completionHandler___block_invoke_51;
  v48[3] = &unk_2647AEE00;
  id v44 = v12;
  id v49 = v44;
  id v45 = v16;
  v50 = self;
  id v51 = v45;
  v46 = [(NSURLSession *)urlSession dataTaskWithRequest:v36 completionHandler:v48];
  [v46 resume];

  _Block_object_dispose(&v53, 8);

  return v46;
}

void __87__TVRMSDAAPRequestManager_requestWithPath_method_postData_queryArgs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v13 = a2;
  v14[0] = a3;
  v6 = NSDictionary;
  id v7 = a3;
  id v8 = a2;
  v9 = [v6 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v10 = objc_msgSend(v5, "rms_componentsByAddingQueryParameters:", v9);
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void __87__TVRMSDAAPRequestManager_requestWithPath_method_postData_queryArgs_completionHandler___block_invoke_51(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  if (v9)
  {
    uint64_t v11 = [v9 code];
    if (v11 != -1001)
    {
      if (v11 == -999)
      {
        WeakRetained = _TVRCRMSLog();
        if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = a1[4];
          int v27 = 138412290;
          uint64_t v28 = v13;
          _os_log_impl(&dword_2266D3000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Request was cancelled: %@", (uint8_t *)&v27, 0xCu);
        }
      }
      else
      {
        uint64_t v22 = _TVRCRMSLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = a1[4];
          int v27 = 138412546;
          uint64_t v28 = (uint64_t)v9;
          __int16 v29 = 2112;
          uint64_t v30 = v23;
          _os_log_impl(&dword_2266D3000, v22, OS_LOG_TYPE_DEFAULT, "Unexpected error [%@]: %@", (uint8_t *)&v27, 0x16u);
        }

        uint64_t v24 = a1[6];
        if (v24) {
          (*(void (**)(uint64_t, uint64_t, void))(v24 + 16))(v24, -1, 0);
        }
        WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 56));
        [WeakRetained requestManagerFailedWithUnknownError:a1[5]];
      }
LABEL_27:

      goto LABEL_28;
    }
    v19 = _TVRCRMSLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = a1[4];
      int v27 = 138412290;
      uint64_t v28 = v20;
      _os_log_impl(&dword_2266D3000, v19, OS_LOG_TYPE_DEFAULT, "Request timed out: %@", (uint8_t *)&v27, 0xCu);
    }

    uint64_t v21 = a1[6];
    if (v21)
    {
      v18 = *(void (**)(void))(v21 + 16);
      goto LABEL_15;
    }
  }
  else
  {
    id v14 = _TVRCRMSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v10 statusCode];
      uint64_t v16 = a1[4];
      int v27 = 134218242;
      uint64_t v28 = v15;
      __int16 v29 = 2112;
      uint64_t v30 = v16;
      _os_log_impl(&dword_2266D3000, v14, OS_LOG_TYPE_DEFAULT, "HTTP response code [%td] for [%@]", (uint8_t *)&v27, 0x16u);
    }

    if ([v10 statusCode] > 299)
    {
      if ([v10 statusCode] == 401
        || [v10 statusCode] == 403
        || [v10 statusCode] == 503)
      {
        uint64_t v25 = a1[6];
        if (v25) {
          (*(void (**)(uint64_t, uint64_t, id))(v25 + 16))(v25, -2, v7);
        }
        WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 56));
        [WeakRetained requestManagerFailedWithUnauthorizedError:a1[5]];
        goto LABEL_27;
      }
      uint64_t v26 = a1[6];
      if (!v26) {
        goto LABEL_28;
      }
      v18 = *(void (**)(void))(v26 + 16);
      goto LABEL_15;
    }
    uint64_t v17 = a1[6];
    if (v17)
    {
      v18 = *(void (**)(void))(v17 + 16);
LABEL_15:
      v18();
    }
  }
LABEL_28:
}

- (id)requestControlCommand:(id)a3 text:(id)a4 promptRevision:(int64_t)a5 completionHandler:(id)a6
{
  return [(TVRMSDAAPRequestManager *)self requestControlCommand:a3 text:a4 data:0 controlValue:0 promptRevision:a5 completionHandler:a6];
}

- (id)requestControlCommand:(id)a3 text:(id)a4 data:(id)a5 controlValue:(int64_t)a6 promptRevision:(int64_t)a7 completionHandler:(id)a8
{
  v33[1] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s/1/%s", "ctrl-int", "controlpromptentry");
  v18 = objc_opt_new();
  v19 = v18;
  if (v13) {
    [v18 encodeString:v13 forCode:1668112997];
  }
  if (v14) {
    [v19 encodeString:v14 forCode:1668117605];
  }
  __int16 v29 = v13;
  if (v15) {
    [v19 encodeData:v15 forCode:1668112741];
  }
  uint64_t v20 = [NSNumber numberWithInteger:a6];
  uint64_t v21 = [v20 stringValue];

  [v19 encodeString:v21 forCode:1668113251];
  uint64_t v22 = [v19 data];
  uint64_t v32 = @"prompt-id";
  uint64_t v23 = [NSNumber numberWithInteger:a7];
  v33[0] = v23;
  uint64_t v24 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __105__TVRMSDAAPRequestManager_requestControlCommand_text_data_controlValue_promptRevision_completionHandler___block_invoke;
  v30[3] = &unk_2647AE990;
  id v31 = v16;
  id v25 = v16;
  uint64_t v26 = [(TVRMSDAAPRequestManager *)self requestWithPath:v17 method:@"POST" postData:v22 queryArgs:v24 completionHandler:v30];

  return v26;
}

uint64_t __105__TVRMSDAAPRequestManager_requestControlCommand_text_data_controlValue_promptRevision_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (NSString)hostName
{
  return self->_hostName;
}

- (void)setHostName:(id)a3
{
}

- (NSString)pairingGUID
{
  return self->_pairingGUID;
}

- (void)setPairingGUID:(id)a3
{
}

- (NSString)homeSharingGroupKey
{
  return self->_homeSharingGroupKey;
}

- (void)setHomeSharingGroupKey:(id)a3
{
}

- (int64_t)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(int64_t)a3
{
  self->_sessionIdentifier = a3;
}

- (int64_t)port
{
  return self->_port;
}

- (void)setPort:(int64_t)a3
{
  self->_port = a3;
}

- (TVRMSDAAPRequestManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRMSDAAPRequestManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVRMSFairPlaySession)fairPlaySession
{
  return self->_fairPlaySession;
}

- (void)setFairPlaySession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fairPlaySession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeSharingGroupKey, 0);
  objc_storeStrong((id *)&self->_pairingGUID, 0);
  objc_storeStrong((id *)&self->_hostName, 0);

  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end