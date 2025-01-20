@interface FCAVAssetKeyFetchOperation
- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4;
- (unint64_t)maxRetries;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)resetForRetry;
@end

@implementation FCAVAssetKeyFetchOperation

- (void)performOperation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = (id)FCOperationLog;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(FCOperation *)self shortOperationDescription];
    if (self) {
      keyURI = self->_keyURI;
    }
    else {
      keyURI = 0;
    }
    v6 = keyURI;
    v7 = [(NSURL *)v6 absoluteString];
    *(_DWORD *)buf = 138543618;
    v23 = v4;
    __int16 v24 = 2114;
    v25 = v7;
    _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch AV content key for %{public}@", buf, 0x16u);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke;
  v21[3] = &unk_1E5B4E758;
  v21[4] = self;
  v8 = [MEMORY[0x1E4F81BF0] firstly:v21];
  v9 = zalgo();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke_2;
  v20[3] = &unk_1E5B55100;
  v20[4] = self;
  v10 = [v8 thenOn:v9 then:v20];
  v11 = zalgo();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke_3;
  v19[3] = &unk_1E5B55100;
  v19[4] = self;
  v12 = [v10 thenOn:v11 then:v19];
  v13 = zalgo();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke_4;
  v18[3] = &unk_1E5B55100;
  v18[4] = self;
  v14 = [v12 thenOn:v13 then:v18];
  v15 = zalgo();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke_5;
  v17[3] = &unk_1E5B4FD28;
  v17[4] = self;
  id v16 = (id)[v14 errorOn:v15 error:v17];
}

id __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__FCAVAssetKeyFetchOperation__promiseAppCertificate__block_invoke;
    v5[3] = &unk_1E5B4EEF0;
    v5[4] = v1;
    v3 = (void *)[v2 initWithResolver:v5];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void *__46__FCAVAssetKeyFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = (void *)v3[48];
    v5 = (void *)v3[49];
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  id v6 = v4;
  id v7 = v5;
  id v8 = a2;
  if (v3)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__FCAVAssetKeyFetchOperation__promiseSPCDataForKeyRequest_keyURI_appCertificate___block_invoke;
    v11[3] = &unk_1E5B507A0;
    id v12 = v7;
    id v13 = v6;
    id v14 = v8;
    v3 = (void *)[v9 initWithResolver:v11];
  }
  return v3;
}

id __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    v4 = *(void **)(v3 + 384);
    v5 = *(void **)(v3 + 392);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  id v6 = v4;
  id v7 = v5;
  id v8 = a2;
  if (v3)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__FCAVAssetKeyFetchOperation__promiseContentKeyForKeyRequest_keyURI_spcData___block_invoke;
    v12[3] = &unk_1E5B5A7C8;
    v12[4] = v3;
    id v13 = v7;
    id v14 = v8;
    id v15 = v6;
    v10 = (void *)[v9 initWithResolver:v12];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 368), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];

  return 0;
}

uint64_t __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  if (self)
  {
    fetchCompletionHandler = (void (**)(id, NSData *))self->_fetchCompletionHandler;
    if (fetchCompletionHandler)
    {
      id v6 = v4;
      fetchCompletionHandler[2](fetchCompletionHandler, self->_resultCKCData);
      id v4 = v6;
    }
  }
}

- (unint64_t)maxRetries
{
  return 1;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 domain];
  if (![v6 isEqualToString:@"FCErrorDomain"])
  {

    goto LABEL_5;
  }
  uint64_t v7 = [v5 code];

  if (v7 != 38)
  {
LABEL_5:
    BOOL v8 = 0;
    goto LABEL_6;
  }
  *a4 = (id)objc_opt_new();
  BOOL v8 = 1;
LABEL_6:

  return v8;
}

- (void)resetForRetry
{
  if (self) {
    self = (FCAVAssetKeyFetchOperation *)self->_cache;
  }
  [(FCAVAssetKeyFetchOperation *)self clearKeyServerCertificate];
}

void __52__FCAVAssetKeyFetchOperation__promiseAppCertificate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7) {
    uint64_t v7 = (void *)v7[51];
  }
  BOOL v8 = v7;
  id v9 = [v8 keyServerCertificate];

  if (v9)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __52__FCAVAssetKeyFetchOperation__promiseAppCertificate__block_invoke_2;
    v23 = &unk_1E5B4C7C0;
    v10 = &v25;
    id v25 = v5;
    id v24 = v9;
    v11 = (void (**)(id, id))v5;
    v11[2](v11, v24);
    id v12 = v24;
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      id v14 = *(void **)(v13 + 400);
    }
    else {
      id v14 = 0;
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__FCAVAssetKeyFetchOperation__promiseAppCertificate__block_invoke_3;
    v17[3] = &unk_1E5B5B178;
    v10 = &v18;
    id v15 = v6;
    v17[4] = *(void *)(a1 + 32);
    id v18 = v15;
    id v19 = v5;
    id v16 = v5;
    [v14 fetchAppCertificateWithCompletionHandler:v17];
    id v12 = v19;
  }
}

uint64_t __52__FCAVAssetKeyFetchOperation__promiseAppCertificate__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __52__FCAVAssetKeyFetchOperation__promiseAppCertificate__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v10 = (void (**)(id, id))*(id *)(a1 + 40);
    id v9 = v6;
    v10[2](v10, v9);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      BOOL v8 = *(void **)(v7 + 408);
    }
    else {
      BOOL v8 = 0;
    }
    [v8 saveKeyServerCertificate:v5];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __52__FCAVAssetKeyFetchOperation__promiseAppCertificate__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __81__FCAVAssetKeyFetchOperation__promiseSPCDataForKeyRequest_keyURI_appCertificate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) host];
  BOOL v8 = [v7 dataUsingEncoding:4];

  if (v8)
  {
    v10 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__FCAVAssetKeyFetchOperation__promiseSPCDataForKeyRequest_keyURI_appCertificate___block_invoke_3;
    v14[3] = &unk_1E5B5ABD8;
    v11 = &v15;
    id v15 = v6;
    id v16 = v5;
    id v12 = v6;
    [v10 makeStreamingContentKeyRequestDataForApp:v9 contentIdentifier:v8 options:0 completionHandler:v14];
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __81__FCAVAssetKeyFetchOperation__promiseSPCDataForKeyRequest_keyURI_appCertificate___block_invoke_2;
    v17[3] = &unk_1E5B4CA88;
    v11 = &v18;
    id v18 = v6;
    id v13 = v6;
    __81__FCAVAssetKeyFetchOperation__promiseSPCDataForKeyRequest_keyURI_appCertificate___block_invoke_2((uint64_t)v17);
  }
}

void __81__FCAVAssetKeyFetchOperation__promiseSPCDataForKeyRequest_keyURI_appCertificate___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_invalidAVAssetKeyURIError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __81__FCAVAssetKeyFetchOperation__promiseSPCDataForKeyRequest_keyURI_appCertificate___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v6 = (void (**)(id, id))*(id *)(a1 + 32);
    id v5 = v4;
    v6[2](v6, v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __81__FCAVAssetKeyFetchOperation__promiseSPCDataForKeyRequest_keyURI_appCertificate___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __77__FCAVAssetKeyFetchOperation__promiseContentKeyForKeyRequest_keyURI_spcData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    uint64_t v9 = *(void **)(v8 + 400);
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__FCAVAssetKeyFetchOperation__promiseContentKeyForKeyRequest_keyURI_spcData___block_invoke_2;
  v17[3] = &unk_1E5B5B1A0;
  id v21 = v6;
  id v12 = *(id *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(void **)(a1 + 40);
  id v18 = v12;
  uint64_t v19 = v13;
  id v20 = v14;
  id v22 = v5;
  id v15 = v5;
  id v16 = v7;
  [v9 fetchContentKeyWithURI:v10 spcData:v11 completionHandler:v17];
}

void __77__FCAVAssetKeyFetchOperation__promiseContentKeyForKeyRequest_keyURI_spcData___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v21[1] = (id)MEMORY[0x1E4F143A8];
    v21[2] = (id)3221225472;
    v21[3] = __77__FCAVAssetKeyFetchOperation__promiseContentKeyForKeyRequest_keyURI_spcData___block_invoke_3;
    v21[4] = &unk_1E5B4C7C0;
    v23 = (void (**)(id, id))*(id *)(a1 + 56);
    id v22 = v8;
    v23[2](v23, v22);

    uint64_t v9 = v23;
  }
  else
  {
    uint64_t v10 = *(void **)(a1 + 32);
    v21[0] = 0;
    uint64_t v11 = [v10 persistableContentKeyFromKeyVendorResponse:a2 options:0 error:v21];
    uint64_t v9 = (void (**)(id, id))v21[0];
    if (v11)
    {
      id v12 = *(void **)(a1 + 40);
      if (v12) {
        id v12 = (void *)v12[51];
      }
      uint64_t v13 = (void *)MEMORY[0x1E4F1C9C8];
      id v14 = v12;
      id v15 = [v13 date];
      [v14 saveAssetKeyData:v11 creationDate:v15 expirationDate:v7 forURI:*(void *)(a1 + 48)];

      id v16 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    else
    {
      v17 = (void *)FCAVAssetLog;
      if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
      {
        id v18 = *(void **)(a1 + 48);
        uint64_t v19 = v17;
        id v20 = [v18 absoluteString];
        *(_DWORD *)buf = 138543618;
        id v25 = v20;
        __int16 v26 = 2114;
        v27 = v9;
        _os_log_error_impl(&dword_1A460D000, v19, OS_LOG_TYPE_ERROR, "failed to generate persistable AV content key for %{public}@ with error: %{public}@", buf, 0x16u);
      }
      id v16 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    v16();
  }
}

uint64_t __77__FCAVAssetKeyFetchOperation__promiseContentKeyForKeyRequest_keyURI_spcData___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_keyURI, 0);
  objc_storeStrong((id *)&self->_keyRequest, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_resultCKCData, 0);
}

@end