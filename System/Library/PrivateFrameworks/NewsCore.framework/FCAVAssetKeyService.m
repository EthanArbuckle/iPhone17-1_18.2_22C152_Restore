@interface FCAVAssetKeyService
- (FCAVAssetKeyService)init;
- (void)_performHTTPRequest:(void *)a3 keyURI:(void *)a4 completion:;
- (void)executeRequest:(void *)a3 keyURI:(void *)a4 callbackQueue:(void *)a5 completion:;
- (void)fetchAppCertificateWithCompletionHandler:(id)a3;
- (void)fetchContentKeyWithURI:(id)a3 spcData:(id)a4 completionHandler:(id)a5;
- (void)initWithConfigurationManager:(void *)a1;
@end

@implementation FCAVAssetKeyService

- (void)initWithConfigurationManager:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)FCAVAssetKeyService;
    a1 = objc_msgSendSuper2(&v14, sel_init);
    if (a1)
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F81BD0]) initWithConstructor:&__block_literal_global_21];
      v5 = (void *)a1[1];
      a1[1] = v4;

      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F81BD0]) initWithConstructor:&__block_literal_global_18_0];
      v7 = (void *)a1[2];
      a1[2] = v6;

      id v8 = objc_alloc(MEMORY[0x1E4F81BF0]);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __52__FCAVAssetKeyService_initWithConfigurationManager___block_invoke_3;
      v12[3] = &unk_1E5B4EEF0;
      id v13 = v3;
      uint64_t v9 = [v8 initWithResolver:v12];
      v10 = (void *)a1[3];
      a1[3] = v9;
    }
  }

  return a1;
}

void __52__FCAVAssetKeyService_initWithConfigurationManager___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[FCBaseURLConfiguration fairPlayBaseURLForConfiguration:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __52__FCAVAssetKeyService_initWithConfigurationManager___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__FCAVAssetKeyService_initWithConfigurationManager___block_invoke_4;
  v6[3] = &unk_1E5B4EEC8;
  id v7 = v3;
  id v5 = v3;
  [v4 fetchConfigurationIfNeededWithCompletion:v6];
}

- (FCAVAssetKeyService)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCAVAssetKeyService init]";
    __int16 v9 = 2080;
    v10 = "FCAVAssetKeyService.m";
    __int16 v11 = 1024;
    int v12 = 40;
    __int16 v13 = 2114;
    objc_super v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCAVAssetKeyService init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

id __52__FCAVAssetKeyService_initWithConfigurationManager___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F4DE70]);
  [v0 setAllowedStatusCodes:0];
  [v0 setAllowedContentTypes:0];
  id v1 = objc_alloc(MEMORY[0x1E4F4DE88]);
  uint64_t v2 = [MEMORY[0x1E4F18DD0] ephemeralSessionConfiguration];
  id v3 = (void *)[v1 initWithConfiguration:v2];

  [v3 setResponseDecoder:v0];
  return v3;
}

id __52__FCAVAssetKeyService_initWithConfigurationManager___block_invoke_2()
{
  id v0 = objc_alloc(MEMORY[0x1E4F4DE68]);
  id v1 = +[FCAMSBag bag];
  uint64_t v2 = (void *)[v0 initWithBag:v1];

  id v3 = +[FCAppleAccount sharedAccount];
  uint64_t v4 = [v3 activeiTunesAccount];
  [v2 setAccount:v4];

  [v2 setUrlKnownToBeTrusted:1];
  [v2 setMescalType:0];
  return v2;
}

- (void)fetchAppCertificateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self) {
    fairPlayBaseURLPromise = self->_fairPlayBaseURLPromise;
  }
  else {
    fairPlayBaseURLPromise = 0;
  }
  id v6 = fairPlayBaseURLPromise;
  id v7 = zalgo();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E5B4EF40;
  v15[4] = self;
  id v8 = v4;
  id v16 = v8;
  __int16 v9 = [(NFPromise *)v6 thenOn:v7 then:v15];
  v10 = zalgo();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_39;
  v13[3] = &unk_1E5B4EF68;

  id v14 = v8;
  id v11 = v8;
  id v12 = (id)[v9 errorOn:v10 error:v13];
}

uint64_t __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 URLByAppendingPathComponent:@"certificate"];
  id v4 = [MEMORY[0x1E4F18D50] requestWithURL:v3];
  [v4 setHTTPMethod:@"GET"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E5B4EF18;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  -[FCAVAssetKeyService _performHTTPRequest:keyURI:completion:](v5, v4, 0, v7);

  return 0;
}

void __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v9)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_3;
    v30[3] = &unk_1E5B4CC80;
    id v31 = v9;
    id v32 = *(id *)(a1 + 32);
    __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_3((uint64_t)v30);

    id v11 = v31;
  }
  else if ([v8 statusCode] == 200)
  {
    id v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:0];
    id v11 = v12;
    if (v12)
    {
      __int16 v13 = [v12 objectForKeyedSubscript:@"certificate"];
      if (v13)
      {
        id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v13 options:0];
        if (v14)
        {
          id v15 = v14;
          id v16 = FCAVAssetLog;
          if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v17 = 0;
            _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "AV asset key service successfully fetched certificate", v17, 2u);
          }
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        }
        else
        {
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_36;
          v18[3] = &unk_1E5B4C7C0;
          id v20 = *(id *)(a1 + 32);
          id v19 = v8;
          __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_36((uint64_t)v18);

          id v15 = 0;
        }
      }
      else
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_34;
        v21[3] = &unk_1E5B4C7C0;
        id v23 = *(id *)(a1 + 32);
        id v22 = v8;
        __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_34((uint64_t)v21);

        id v15 = v23;
      }
    }
    else
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_32;
      v24[3] = &unk_1E5B4C7C0;
      id v26 = *(id *)(a1 + 32);
      id v25 = v8;
      __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_32((uint64_t)v24);

      __int16 v13 = v26;
    }
  }
  else
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_28;
    v27[3] = &unk_1E5B4CC80;
    id v28 = v8;
    id v29 = *(id *)(a1 + 32);
    __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_28((uint64_t)v27);

    id v11 = v28;
  }
}

uint64_t __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "AV asset key service failed to fetch certificate with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_28(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) statusCode] == 401 || objc_msgSend(*(id *)(a1 + 32), "statusCode") == 403)
  {
    uint64_t v2 = FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "AV asset key service got unauthorized response for certificate request", (uint8_t *)&v11, 2u);
    }
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_unauthorizedAVAssetCertificateError");
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
  else
  {
    int v5 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
    {
      id v9 = *(void **)(a1 + 32);
      v10 = v5;
      int v11 = 134217984;
      uint64_t v12 = [v9 statusCode];
      _os_log_error_impl(&dword_1A460D000, v10, OS_LOG_TYPE_ERROR, "AV asset key service got error status code %ld for certificate request", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 32) statusCode];
    uint64_t v4 = [*(id *)(a1 + 32) URL];
    id v8 = +[FCEndpointConnection errorForStatus:v7 url:v4];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v8);
  }
}

void __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_32(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v8 = 0;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "AV asset key service failed to parse response for certificate request", v8, 2u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F289D0];
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = [*(id *)(a1 + 32) URL];
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v3 errorWithDomain:@"FCEndpointConnectionErrorDomain" code:500 userInfo:v6];
  (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v7);
}

void __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_34(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v8 = 0;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "AV asset key service failed to find certificate in response for certificate request", v8, 2u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F289D0];
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = [*(id *)(a1 + 32) URL];
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v3 errorWithDomain:@"FCEndpointConnectionErrorDomain" code:500 userInfo:v6];
  (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v7);
}

void __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_36(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v8 = 0;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "AV asset key service failed to decode certificate base64 for certificate request", v8, 2u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F289D0];
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = [*(id *)(a1 + 32) URL];
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v3 errorWithDomain:@"FCEndpointConnectionErrorDomain" code:500 userInfo:v6];
  (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v7);
}

- (void)_performHTTPRequest:(void *)a3 keyURI:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v10 = dispatch_get_global_queue(17, 0);
    uint64_t v31 = 0;
    id v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__14;
    v35 = __Block_byref_object_dispose__14;
    id v36 = (id)[v7 mutableCopy];
    int v11 = [(id)v32[5] HTTPBody];

    if (v11)
    {
      uint64_t v12 = FCAVAssetLog;
      if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "AV asset key service will generate Mescal signature", buf, 2u);
      }
      uint64_t v13 = [(id)v32[5] HTTPBody];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_67;
      v15[3] = &unk_1E5B4F0A8;
      id v19 = v9;
      id v16 = v10;
      uint64_t v17 = a1;
      id v20 = &v31;
      id v18 = v8;
      +[FCMescalSignature signatureFromData:v13 completion:v15];

      id v14 = v19;
    }
    else
    {
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke;
      id v25 = &unk_1E5B4F058;
      uint64_t v26 = a1;
      v30 = &v31;
      id v27 = v8;
      id v28 = v10;
      id v29 = v9;
      -[FCAVAssetKeyService executeRequest:keyURI:callbackQueue:completion:](a1, (void *)v32[5], v27, v28, v29);

      id v14 = v27;
    }

    _Block_object_dispose(&v31, 8);
  }
}

uint64_t __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_39(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)fetchContentKeyWithURI:(id)a3 spcData:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self) {
    fairPlayBaseURLPromise = self->_fairPlayBaseURLPromise;
  }
  else {
    fairPlayBaseURLPromise = 0;
  }
  uint64_t v12 = fairPlayBaseURLPromise;
  uint64_t v13 = zalgo();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke;
  v23[3] = &unk_1E5B4F030;
  id v24 = v9;
  id v25 = v8;
  uint64_t v26 = self;
  id v14 = v10;
  id v27 = v14;
  id v15 = v8;
  id v16 = v9;
  uint64_t v17 = [(NFPromise *)v12 thenOn:v13 then:v23];
  id v18 = zalgo();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_65;
  v21[3] = &unk_1E5B4EF68;

  id v22 = v14;
  id v19 = v14;
  id v20 = (id)[v17 errorOn:v18 error:v21];
}

uint64_t __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [*(id *)(a1 + 32) base64EncodedStringWithOptions:0];
  [v5 setObject:v6 forKey:@"spcBase64"];

  id v7 = [*(id *)(a1 + 40) absoluteString];
  [v5 setObject:v7 forKey:@"m3u8URI"];

  id v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:0];
  id v9 = [v4 URLByAppendingPathComponent:@"contentKey"];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v9];
  [v10 setHTTPMethod:@"POST"];
  [v10 setHTTPBody:v8];
  [v10 addValue:@"application/json" forHTTPHeaderField:@"Accept"];
  [v10 addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  int v11 = +[FCAppleAccount sharedAccount];
  uint64_t v12 = [v11 endpointConnectionClientID];
  [v10 addValue:v12 forHTTPHeaderField:@"X-CLIENT-ID"];

  uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
  id v14 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_2;
  v19[3] = &unk_1E5B4F008;
  id v20 = v14;
  id v16 = *(id *)(a1 + 56);
  id v22 = v13;
  id v23 = v16;
  uint64_t v21 = *(void *)(a1 + 48);
  id v17 = v13;
  -[FCAVAssetKeyService _performHTTPRequest:keyURI:completion:](v15, v10, v20, v19);

  return 0;
}

void __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_3;
    v49[3] = &unk_1E5B4E088;
    id v50 = *(id *)(a1 + 32);
    id v51 = v9;
    id v52 = *(id *)(a1 + 56);
    __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_3(v49);

    id v10 = v50;
  }
  else if ([v8 statusCode] == 200)
  {
    int v11 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:0];
    if (v11)
    {
      id v10 = v11;
      objc_opt_class();
      uint64_t v12 = [v10 objectForKeyedSubscript:@"ckc"];
      if (v12)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
      }
      else
      {
        uint64_t v13 = 0;
      }
      id v16 = v13;

      if (v16)
      {
        id v17 = v16;
        id v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v17 options:0];
        id v19 = v18;
        if (v18)
        {
          uint64_t v26 = v18;
          id v20 = v18;
          uint64_t v21 = (void *)FCAVAssetLog;
          if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = *(void **)(a1 + 32);
            id v23 = v21;
            id v24 = [v22 absoluteString];
            *(_DWORD *)buf = 138543362;
            v54 = v24;
            _os_log_impl(&dword_1A460D000, v23, OS_LOG_TYPE_DEFAULT, "AV asset key service successfully fetched key %{public}@", buf, 0xCu);
          }
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_59;
          v27[3] = &unk_1E5B4EFE0;
          id v28 = v10;
          id v29 = *(id *)(a1 + 32);
          id v30 = *(id *)(a1 + 48);
          id v25 = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_59((uint64_t)v27);
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

          id v19 = v26;
        }
        else
        {
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_58;
          v31[3] = &unk_1E5B4EFB8;
          id v32 = *(id *)(a1 + 32);
          id v34 = *(id *)(a1 + 56);
          id v33 = v8;
          __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_58((uint64_t)v31);

          id v20 = v32;
        }
      }
      else
      {
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_57;
        v35[3] = &unk_1E5B4EFB8;
        id v36 = *(id *)(a1 + 32);
        id v38 = *(id *)(a1 + 56);
        id v37 = v8;
        __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_57((uint64_t)v35);

        id v17 = v36;
      }
    }
    else
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_53;
      v39[3] = &unk_1E5B4EFB8;
      id v40 = *(id *)(a1 + 32);
      id v42 = *(id *)(a1 + 56);
      id v41 = v8;
      __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_53((uint64_t)v39);

      id v10 = 0;
    }
  }
  else
  {
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_52;
    v43[3] = &unk_1E5B4EF90;
    id v44 = v8;
    id v45 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 40);
    id v48 = v14;
    uint64_t v46 = v15;
    id v47 = v7;
    __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_52((uint64_t)v43);

    id v10 = v44;
  }
}

uint64_t __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_3(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    id v4 = (void *)a1[4];
    id v5 = v2;
    uint64_t v6 = [v4 absoluteString];
    uint64_t v7 = a1[5];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "AV asset key service failed to fetch key %{public}@ with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_52(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) statusCode];
  if (v2 == 400)
  {
    uint64_t v6 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
    {
      id v27 = *(void **)(a1 + 40);
      id v28 = v6;
      id v29 = [v27 absoluteString];
      *(_DWORD *)id v34 = 138543362;
      *(void *)&v34[4] = v29;
      _os_log_error_impl(&dword_1A460D000, v28, OS_LOG_TYPE_ERROR, "AV asset key service got bad request response for key %{public}@", v34, 0xCu);
    }
    int v8 = *(void **)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 48);
    id v5 = [*(id *)(a1 + 32) URL];
    id v10 = v8;
    if (v9)
    {
      uint64_t v11 = +[FCEndpointConnection errorForStatus:400 url:v5];
      uint64_t v12 = v11;
      if (v10)
      {
        uint64_t v13 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v10 options:0 error:0];
        id v14 = v13;
        if (v13)
        {
          uint64_t v15 = [v13 objectForKeyedSubscript:@"diagnosis"];
          id v16 = v15;
          if (v15)
          {
            id v17 = objc_msgSend(v15, "fc_arrayByTransformingWithBlock:", &__block_literal_global_91);
            if ([v17 containsObject:@"INVALID_CERTIFICATE_HASH"])
            {
              objc_msgSend(MEMORY[0x1E4F28C58], "fc_expiredAVAssetCertificateError");
              id v18 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v18 = v12;
            }
            id v23 = v18;
          }
          else
          {
            *(void *)id v34 = MEMORY[0x1E4F143A8];
            *(void *)&v34[8] = 3221225472;
            *(void *)&v34[16] = __63__FCAVAssetKeyService__errorForBadRequestWithResponseData_URL___block_invoke_3;
            v35 = &unk_1E5B4C840;
            id v36 = v12;
            id v23 = v36;
          }
        }
        else
        {
          *(void *)id v34 = MEMORY[0x1E4F143A8];
          *(void *)&v34[8] = 3221225472;
          *(void *)&v34[16] = __63__FCAVAssetKeyService__errorForBadRequestWithResponseData_URL___block_invoke_2;
          v35 = &unk_1E5B4C840;
          id v36 = v12;
          id v16 = v36;
          id v23 = v16;
        }
      }
      else
      {
        *(void *)id v34 = MEMORY[0x1E4F143A8];
        *(void *)&v34[8] = 3221225472;
        *(void *)&v34[16] = __63__FCAVAssetKeyService__errorForBadRequestWithResponseData_URL___block_invoke;
        v35 = &unk_1E5B4C840;
        id v36 = v11;
        id v14 = v36;
        id v23 = v14;
      }
    }
    else
    {
      id v23 = 0;
    }

    (*(void (**)(uint64_t, void, void, id))(v7 + 16))(v7, 0, 0, v23);
  }
  else if (v2 == 403 || v2 == 401)
  {
    uint64_t v3 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
    {
      id v24 = *(void **)(a1 + 40);
      id v25 = v3;
      uint64_t v26 = [v24 absoluteString];
      *(_DWORD *)id v34 = 138543362;
      *(void *)&v34[4] = v26;
      _os_log_error_impl(&dword_1A460D000, v25, OS_LOG_TYPE_ERROR, "AV asset key service got unauthorized response for key %{public}@", v34, 0xCu);
    }
    uint64_t v4 = *(void *)(a1 + 64);
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_unauthorizedAVAssetKeyErrorWithKeyURI:", *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v5);
  }
  else
  {
    id v19 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
    {
      id v30 = *(void **)(a1 + 32);
      uint64_t v31 = v19;
      uint64_t v32 = [v30 statusCode];
      id v33 = [*(id *)(a1 + 40) absoluteString];
      *(_DWORD *)id v34 = 134218242;
      *(void *)&v34[4] = v32;
      *(_WORD *)&v34[12] = 2114;
      *(void *)&v34[14] = v33;
      _os_log_error_impl(&dword_1A460D000, v31, OS_LOG_TYPE_ERROR, "AV asset key service got error status code %ld for key %{public}@", v34, 0x16u);
    }
    uint64_t v20 = *(void *)(a1 + 64);
    uint64_t v21 = [*(id *)(a1 + 32) statusCode];
    id v5 = [*(id *)(a1 + 32) URL];
    id v22 = +[FCEndpointConnection errorForStatus:v21 url:v5];
    (*(void (**)(uint64_t, void, void, void *))(v20 + 16))(v20, 0, 0, v22);
  }
}

void __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_53(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    int v8 = *(void **)(a1 + 32);
    uint64_t v9 = v2;
    id v10 = [v8 absoluteString];
    *(_DWORD *)buf = 138543362;
    id v14 = v10;
    _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, "AV asset key service failed to parse response for key %{public}@", buf, 0xCu);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F289D0];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = objc_msgSend(*(id *)(a1 + 40), "URL", v11);
  uint64_t v12 = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  uint64_t v7 = [v3 errorWithDomain:@"FCEndpointConnectionErrorDomain" code:500 userInfo:v6];
  (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v7);
}

void __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_57(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    int v8 = *(void **)(a1 + 32);
    uint64_t v9 = v2;
    id v10 = [v8 absoluteString];
    *(_DWORD *)buf = 138543362;
    id v14 = v10;
    _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, "AV asset key service failed to find CKC in response for key %{public}@", buf, 0xCu);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F289D0];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = objc_msgSend(*(id *)(a1 + 40), "URL", v11);
  uint64_t v12 = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  uint64_t v7 = [v3 errorWithDomain:@"FCEndpointConnectionErrorDomain" code:500 userInfo:v6];
  (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v7);
}

void __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_58(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    int v8 = *(void **)(a1 + 32);
    uint64_t v9 = v2;
    id v10 = [v8 absoluteString];
    *(_DWORD *)buf = 138543362;
    id v14 = v10;
    _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, "AV asset key service failed to decode CKC base64 for key %{public}@", buf, 0xCu);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F289D0];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = objc_msgSend(*(id *)(a1 + 40), "URL", v11);
  uint64_t v12 = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  uint64_t v7 = [v3 errorWithDomain:@"FCEndpointConnectionErrorDomain" code:500 userInfo:v6];
  (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v7);
}

id __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_59(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"assetValidityDurationInSeconds"];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = *(void **)(a1 + 48);
    [v2 doubleValue];
    id v5 = objc_msgSend(v4, "dateByAddingTimeInterval:");
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_2_63;
    v7[3] = &unk_1E5B4C840;
    id v8 = *(id *)(a1 + 40);
    id v5 = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_2_63((uint64_t)v7);
  }
  return v5;
}

uint64_t __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_2_63(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = v2;
    uint64_t v6 = [v4 absoluteString];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "AV asset key service failed to find TTL in response for key %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_65(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

void __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke(uint64_t a1)
{
}

- (void)executeRequest:(void *)a3 keyURI:(void *)a4 callbackQueue:(void *)a5 completion:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    uint64_t v13 = FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "AV asset key service will construct AMS request", buf, 2u);
    }
    id v14 = [*(id *)(a1 + 16) value];
    uint64_t v15 = [v14 requestByEncodingRequest:v9 parameters:0];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke;
    v16[3] = &unk_1E5B4F120;
    id v20 = v12;
    id v17 = v11;
    id v18 = v10;
    uint64_t v19 = a1;
    [v15 addFinishBlock:v16];
  }
}

void __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_2;
    v17[3] = &unk_1E5B4F080;
    id v20 = *(id *)(a1 + 56);
    id v18 = *(id *)(a1 + 32);
    id v19 = v6;
    __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_2((uint64_t)v17);

    int v7 = v20;
LABEL_3:

    goto LABEL_8;
  }
  if (!v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_2_69;
    v12[3] = &unk_1E5B4F058;
    uint64_t v9 = *(void *)(a1 + 64);
    id v10 = *(void **)(a1 + 48);
    void v12[4] = *(void *)(a1 + 40);
    uint64_t v16 = v9;
    id v13 = v10;
    id v14 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 56);
    __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_2_69((uint64_t)v12);

    int v7 = v13;
    goto LABEL_3;
  }
  id v8 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "AV asset key service will attach mescal signature to request", v11, 2u);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setValue:v5 forHTTPHeaderField:@"X-Apple-ActionSignature"];
  -[FCAVAssetKeyService executeRequest:keyURI:callbackQueue:completion:](*(void *)(a1 + 40), *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(void **)(a1 + 48), *(void **)(a1 + 32), *(void **)(a1 + 56));
LABEL_8:
}

void __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "AV asset key service failed to generate mescal signature", buf, 2u);
  }
  uint64_t v3 = *(void **)(a1 + 48);
  if (v3)
  {
    uint64_t v4 = *(NSObject **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_68;
    v5[3] = &unk_1E5B4C7C0;
    id v7 = v3;
    id v6 = *(id *)(a1 + 40);
    dispatch_async(v4, v5);
  }
}

uint64_t __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_2_69(uint64_t a1)
{
  uint64_t v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "AV asset key service generated nil mescal signature", v3, 2u);
  }
  -[FCAVAssetKeyService executeRequest:keyURI:callbackQueue:completion:](*(void *)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

void __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_2;
    v23[3] = &unk_1E5B4EFB8;
    id v24 = v6;
    id v26 = *(id *)(a1 + 56);
    id v25 = *(id *)(a1 + 32);
    __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_2((uint64_t)v23);

    id v8 = v24;
  }
  else
  {
    uint64_t v9 = FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "AV asset key service did construct AMS request", buf, 2u);
    }
    id v10 = [*(id *)(a1 + 40) host];
    int v11 = [v10 hasPrefix:@"newsP"];

    if (v11)
    {
      id v12 = [v5 allHTTPHeaderFields];
      id v13 = [v12 objectForKeyedSubscript:@"X-DSID"];

      if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        id v17 = [NSString alloc];
        id v18 = [*(id *)(a1 + 40) absoluteString];
        id v19 = (void *)[v17 initWithFormat:@"Missing X-DSID header on AV asset key request with URI: %@", v18];
        *(_DWORD *)buf = 136315906;
        id v28 = "-[FCAVAssetKeyService executeRequest:keyURI:callbackQueue:completion:]_block_invoke";
        __int16 v29 = 2080;
        id v30 = "FCAVAssetKeyService.m";
        __int16 v31 = 1024;
        int v32 = 294;
        __int16 v33 = 2114;
        id v34 = v19;
        _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingDSID) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14) {
      id v15 = *(void **)(v14 + 8);
    }
    else {
      id v15 = 0;
    }
    uint64_t v16 = [v15 value];
    id v8 = [v16 dataTaskPromiseWithRequest:v5];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_81;
    v20[3] = &unk_1E5B4F0F8;
    id v22 = *(id *)(a1 + 56);
    id v21 = *(id *)(a1 + 32);
    [v8 addFinishBlock:v20];
  }
}

void __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v5;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "AV asset key service failed to construct AMS request with error: %{public}@", buf, 0xCu);
  }
  uint64_t v3 = *(void **)(a1 + 48);
  if (v3)
  {
    uint64_t v4 = *(NSObject **)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_71;
    v6[3] = &unk_1E5B4C7C0;
    id v8 = v3;
    id v7 = *(id *)(a1 + 32);
    dispatch_async(v4, v6);
  }
}

uint64_t __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_71(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_81(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  id v7 = [v5 response];
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = *(void **)(a1 + 40);
  if (v10)
  {
    uint64_t v11 = *(NSObject **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_2_83;
    v12[3] = &unk_1E5B4F0D0;
    id v16 = v10;
    id v13 = v5;
    id v14 = v9;
    id v15 = v6;
    dispatch_async(v11, v12);
  }
}

void __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_2_83(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  id v3 = [*(id *)(a1 + 32) data];
  (*(void (**)(uint64_t, id, void, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

id __63__FCAVAssetKeyService__errorForBadRequestWithResponseData_URL___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __63__FCAVAssetKeyService__errorForBadRequestWithResponseData_URL___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __63__FCAVAssetKeyService__errorForBadRequestWithResponseData_URL___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __63__FCAVAssetKeyService__errorForBadRequestWithResponseData_URL___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v3 = [v2 objectForKeyedSubscript:@"code"];
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v4 = v3;
      }
      else {
        uint64_t v4 = 0;
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fairPlayBaseURLPromise, 0);
  objc_storeStrong((id *)&self->_requestEncoder, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end