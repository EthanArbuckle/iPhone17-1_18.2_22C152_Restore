@interface FCAssetKeyService
- (void)executeRequest:(void *)a3 callbackQueue:(void *)a4 completion:;
- (void)fetchWrappingKeysWithIDs:(id)a3 completionHandler:(id)a4;
- (void)initWithConfigurationManager:(void *)a1;
@end

@implementation FCAssetKeyService

- (void)initWithConfigurationManager:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)FCAssetKeyService;
    a1 = objc_msgSendSuper2(&v14, sel_init);
    if (a1)
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F81BD0]) initWithConstructor:&__block_literal_global_60];
      v5 = (void *)a1[1];
      a1[1] = v4;

      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F81BD0]) initWithConstructor:&__block_literal_global_6_0];
      v7 = (void *)a1[2];
      a1[2] = v6;

      id v8 = objc_alloc(MEMORY[0x1E4F81BF0]);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __50__FCAssetKeyService_initWithConfigurationManager___block_invoke_3;
      v12[3] = &unk_1E5B4EEF0;
      id v13 = v3;
      uint64_t v9 = [v8 initWithResolver:v12];
      v10 = (void *)a1[3];
      a1[3] = v9;
    }
  }

  return a1;
}

void __50__FCAssetKeyService_initWithConfigurationManager___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  v5 = +[FCBaseURLConfiguration CAPIBaseURLForConfiguration:a2];
  uint64_t v6 = [v5 URLByAppendingPathComponent:@"asset/wrappingkey"];
  if (v6) {
    v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else {
    v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

void __50__FCAssetKeyService_initWithConfigurationManager___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__FCAssetKeyService_initWithConfigurationManager___block_invoke_4;
  v10[3] = &unk_1E5B50128;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 fetchConfigurationIfNeededWithCompletion:v10];
}

id __50__FCAssetKeyService_initWithConfigurationManager___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F4DE70]);
  [v0 setAllowedStatusCodes:0];
  [v0 setAllowedContentTypes:0];
  id v1 = objc_alloc(MEMORY[0x1E4F4DE88]);
  v2 = [MEMORY[0x1E4F18DD0] ephemeralSessionConfiguration];
  id v3 = (void *)[v1 initWithConfiguration:v2];

  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F4DE80]) initWithTrustMode:0];
  [v3 setSecurityPolicy:v4];

  [v3 setResponseDecoder:v0];
  return v3;
}

id __50__FCAssetKeyService_initWithConfigurationManager___block_invoke_2()
{
  id v0 = objc_alloc(MEMORY[0x1E4F4DE68]);
  id v1 = +[FCAMSBag bag];
  v2 = (void *)[v0 initWithBag:v1];

  id v3 = +[FCAppleAccount sharedAccount];
  uint64_t v4 = [v3 activeiTunesAccount];
  [v2 setAccount:v4];

  [v2 setUrlKnownToBeTrusted:1];
  [v2 setMescalType:0];
  return v2;
}

- (void)fetchWrappingKeysWithIDs:(id)a3 completionHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F82C68]);
  id v9 = (void *)[v6 mutableCopy];
  [v8 setWrappingKeyIds:v9];

  v10 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v6 count];
    _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "Asset key service will request %lu keys", (uint8_t *)&buf, 0xCu);
  }
  id v12 = [v8 data];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke;
  v26[3] = &unk_1E5B53D30;
  id v27 = v6;
  id v28 = v7;
  id v25 = v7;
  id v13 = v6;
  id v14 = v12;
  v15 = v26;
  if (self)
  {
    v16 = dispatch_get_global_queue(17, 0);
    v17 = self->_endpointURLPromise;
    v18 = zalgo();
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v33 = __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke;
    v34 = &unk_1E5B53D80;
    id v35 = v14;
    v19 = v15;
    id v38 = v19;
    id v20 = v16;
    id v36 = v20;
    v37 = self;
    v21 = [(NFPromise *)v17 thenOn:v18 then:&buf];
    v22 = zalgo();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke_31;
    v29[3] = &unk_1E5B4E7A8;
    v31 = v19;

    id v30 = v20;
    id v23 = v20;
    id v24 = (id)[v21 errorOn:v22 error:v29];
  }
}

void __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_2;
    v39[3] = &unk_1E5B4E088;
    id v40 = *(id *)(a1 + 32);
    id v41 = v9;
    id v42 = *(id *)(a1 + 40);
    __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_2(v39);

    id v10 = v40;
  }
  else if ([v8 statusCode] == 200)
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F82C70]) initWithData:v7];
    if (v11)
    {
      id v10 = v11;
      id v12 = (void *)FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = v12;
        id v14 = [v10 wrappingKeyMapEntries];
        uint64_t v15 = [v14 count];
        uint64_t v16 = [*(id *)(a1 + 32) count];
        *(_DWORD *)long long buf = 134218240;
        uint64_t v45 = v15;
        __int16 v46 = 2048;
        uint64_t v47 = v16;
        _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "Asset key service successfully fetched %lu of %lu keys", buf, 0x16u);
      }
      v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v8, v7);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v18 = [v10 wrappingKeyMapEntries];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v43 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v29 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            id v24 = [v23 wrappingKey];
            id v25 = [v23 wrappingKeyId];
            objc_msgSend(v17, "fc_safelySetObject:forKey:", v24, v25);
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v43 count:16];
        }
        while (v20);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      id v8 = v26;
      id v7 = v27;
    }
    else
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_21;
      v32[3] = &unk_1E5B4C7C0;
      id v34 = *(id *)(a1 + 40);
      id v33 = v8;
      __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_21((uint64_t)v32);

      id v10 = 0;
    }
  }
  else
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_17;
    v35[3] = &unk_1E5B4E088;
    id v36 = v8;
    id v37 = *(id *)(a1 + 32);
    id v38 = *(id *)(a1 + 40);
    __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_17((uint64_t)v35);

    id v10 = v36;
  }
}

uint64_t __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = (void *)a1[4];
    id v5 = v2;
    uint64_t v6 = [v4 count];
    uint64_t v7 = a1[5];
    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Asset key service failed to fetch %lu keys with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_17(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) statusCode] == 401 || objc_msgSend(*(id *)(a1 + 32), "statusCode") == 403)
  {
    v2 = (void *)FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = *(void **)(a1 + 40);
      uint64_t v11 = v2;
      int v16 = 134217984;
      uint64_t v17 = [v10 count];
      _os_log_error_impl(&dword_1A460D000, v11, OS_LOG_TYPE_ERROR, "Asset key service got unauthorized response for %lu keys", (uint8_t *)&v16, 0xCu);
    }
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = [*(id *)(a1 + 40) firstObject];
    uint64_t v6 = objc_msgSend(v3, "fc_unauthorizedAssetKeyErrorWithWrappingKeyID:", v5);
  }
  else
  {
    uint64_t v7 = (void *)FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void **)(a1 + 32);
      id v13 = v7;
      uint64_t v14 = [v12 statusCode];
      uint64_t v15 = [*(id *)(a1 + 40) count];
      int v16 = 134218240;
      uint64_t v17 = v14;
      __int16 v18 = 2048;
      uint64_t v19 = v15;
      _os_log_error_impl(&dword_1A460D000, v13, OS_LOG_TYPE_ERROR, "Asset key service got error status code %ld for %lu keys", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v8 = [*(id *)(a1 + 32) statusCode];
    id v5 = [*(id *)(a1 + 32) URL];
    uint64_t v6 = +[FCEndpointConnection errorForStatus:v8 url:v5];
  }
  uint64_t v9 = (void *)v6;
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 16))(v4, 0, v6);
}

void __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_21(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Asset key service failed to parse response", v8, 2u);
  }
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F289D0];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) URL];
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v3 errorWithDomain:@"FCEndpointConnectionErrorDomain" code:500 userInfo:v6];
  (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v7);
}

uint64_t __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F18D50] requestWithURL:a2];
  [v3 setHTTPBody:*(void *)(a1 + 32)];
  [v3 setHTTPMethod:@"POST"];
  [v3 addValue:@"application/x-protobuf" forHTTPHeaderField:@"Content-Type"];
  uint64_t v4 = +[FCAppleAccount sharedAccount];
  id v5 = [v4 endpointConnectionClientID];
  [v3 addValue:v5 forHTTPHeaderField:@"X-CLIENT-ID"];

  uint64_t v6 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "Asset key service will generate Mescal signature", buf, 2u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke_27;
  v10[3] = &unk_1E5B53D58;
  id v14 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  id v12 = v3;
  uint64_t v13 = *(void *)(a1 + 48);
  id v8 = v3;
  +[FCMescalSignature signatureFromData:v7 completion:v10];

  return 0;
}

void __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "Asset key service failed to sign analytics data with Mescal", buf, 2u);
    }
    id v8 = *(void **)(a1 + 56);
    if (v8)
    {
      uint64_t v9 = *(NSObject **)(a1 + 32);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke_28;
      v12[3] = &unk_1E5B4C7C0;
      id v14 = v8;
      id v13 = v6;
      dispatch_async(v9, v12);
    }
  }
  else
  {
    __int16 v10 = FCDefaultLog;
    BOOL v11 = os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v11)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "Asset key service will construct request with mescal signature", buf, 2u);
      }
      [*(id *)(a1 + 40) setValue:v5 forHTTPHeaderField:@"X-Apple-ActionSignature"];
    }
    else if (v11)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "Asset key service will construct request", buf, 2u);
    }
    -[FCAssetKeyService executeRequest:callbackQueue:completion:](*(void *)(a1 + 48), *(void **)(a1 + 40), *(void **)(a1 + 32), *(void **)(a1 + 56));
  }
}

uint64_t __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (void)executeRequest:(void *)a3 callbackQueue:(void *)a4 completion:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    uint64_t v9 = *(void **)(a1 + 16);
    id v10 = a2;
    BOOL v11 = [v9 value];
    id v12 = [v11 requestByEncodingRequest:v10 parameters:0];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke;
    v13[3] = &unk_1E5B53DA8;
    id v16 = v8;
    id v14 = v7;
    uint64_t v15 = a1;
    [v12 addFinishBlock:v13];
  }
}

void __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke_2;
    v6[3] = &unk_1E5B4C7C0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_2;
    v17[3] = &unk_1E5B4EFB8;
    id v18 = v6;
    id v20 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 32);
    __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_2((uint64_t)v17);

    id v8 = v18;
  }
  else
  {
    uint64_t v9 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "Asset key service did construct request", buf, 2u);
    }
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      BOOL v11 = *(void **)(v10 + 8);
    }
    else {
      BOOL v11 = 0;
    }
    id v12 = [v11 value];
    id v8 = [v12 dataTaskPromiseWithRequest:v5];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_34;
    v13[3] = &unk_1E5B4F0F8;
    id v15 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 32);
    [v8 addFinishBlock:v13];
  }
}

void __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v10 = v5;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Asset key service failed to construct request with error: %{public}@", buf, 0xCu);
  }
  id v3 = *(void **)(a1 + 48);
  if (v3)
  {
    uint64_t v4 = *(NSObject **)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_33;
    v6[3] = &unk_1E5B4C7C0;
    id v8 = v3;
    id v7 = *(id *)(a1 + 32);
    dispatch_async(v4, v6);
  }
}

uint64_t __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_34(uint64_t a1, void *a2, void *a3)
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
    v12[2] = __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_2_36;
    v12[3] = &unk_1E5B4F0D0;
    id v16 = v10;
    id v13 = v5;
    id v14 = v9;
    id v15 = v6;
    dispatch_async(v11, v12);
  }
}

void __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_2_36(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  id v3 = [*(id *)(a1 + 32) data];
  (*(void (**)(uint64_t, id, void, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointURLPromise, 0);
  objc_storeStrong((id *)&self->_requestEncoder, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end