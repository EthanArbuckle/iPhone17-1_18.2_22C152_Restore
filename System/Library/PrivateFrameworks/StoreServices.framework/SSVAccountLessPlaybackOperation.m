@interface SSVAccountLessPlaybackOperation
- (NSDictionary)HTTPHeaderFields;
- (NSString)assetStoreFrontIdentifier;
- (NSString)itemIdentifier;
- (id)_requestBodyData;
- (id)responseBlock;
- (id)valueForHTTPHeaderField:(id)a3;
- (void)main;
- (void)setAssetStoreFrontIdentifier:(id)a3;
- (void)setHTTPHeaderFields:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setResponseBlock:(id)a3;
- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4;
@end

@implementation SSVAccountLessPlaybackOperation

- (NSString)assetStoreFrontIdentifier
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__69;
  v9 = __Block_byref_object_dispose__69;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__SSVAccountLessPlaybackOperation_assetStoreFrontIdentifier__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVOperation *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __60__SSVAccountLessPlaybackOperation_assetStoreFrontIdentifier__block_invoke(uint64_t a1)
{
}

- (NSDictionary)HTTPHeaderFields
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__69;
  v9 = __Block_byref_object_dispose__69;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__SSVAccountLessPlaybackOperation_HTTPHeaderFields__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVOperation *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

void __51__SSVAccountLessPlaybackOperation_HTTPHeaderFields__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 320) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)itemIdentifier
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__69;
  v9 = __Block_byref_object_dispose__69;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SSVAccountLessPlaybackOperation_itemIdentifier__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVOperation *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __49__SSVAccountLessPlaybackOperation_itemIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 328) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)responseBlock
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1_0;
  v9 = __Block_byref_object_dispose__2_0;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SSVAccountLessPlaybackOperation_responseBlock__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVOperation *)self dispatchSync:v4];
  uint64_t v2 = (void *)MEMORY[0x1A6268200](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __48__SSVAccountLessPlaybackOperation_responseBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 336) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setAssetStoreFrontIdentifier:(id)a3
{
  v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__SSVAccountLessPlaybackOperation_setAssetStoreFrontIdentifier___block_invoke;
  v6[3] = &unk_1E5BA7018;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVOperation *)self dispatchAsync:v6];
}

void __64__SSVAccountLessPlaybackOperation_setAssetStoreFrontIdentifier___block_invoke(uint64_t a1)
{
}

- (void)setItemIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SSVAccountLessPlaybackOperation_setItemIdentifier___block_invoke;
  v6[3] = &unk_1E5BA7018;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVOperation *)self dispatchAsync:v6];
}

void __53__SSVAccountLessPlaybackOperation_setItemIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 328) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 328);
    *(void *)(v5 + 328) = v4;
  }
}

- (void)setResponseBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SSVAccountLessPlaybackOperation_setResponseBlock___block_invoke;
  v6[3] = &unk_1E5BA7350;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVOperation *)self dispatchAsync:v6];
}

void __52__SSVAccountLessPlaybackOperation_setResponseBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 336) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 336);
    *(void *)(v5 + 336) = v4;
  }
}

- (void)setHTTPHeaderFields:(id)a3
{
  uint64_t v4 = (void *)[a3 mutableCopy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SSVAccountLessPlaybackOperation_setHTTPHeaderFields___block_invoke;
  v6[3] = &unk_1E5BA7018;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVOperation *)self dispatchAsync:v6];
}

void __55__SSVAccountLessPlaybackOperation_setHTTPHeaderFields___block_invoke(uint64_t a1)
{
}

- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__SSVAccountLessPlaybackOperation_setValue_forHTTPHeaderField___block_invoke;
  v10[3] = &unk_1E5BA7068;
  id v11 = v6;
  v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SSVOperation *)self dispatchAsync:v10];
}

uint64_t __63__SSVAccountLessPlaybackOperation_setValue_forHTTPHeaderField___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void **)(a1[5] + 320);
  if (v2)
  {
    if (!v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v5 = a1[5];
      id v6 = *(void **)(v5 + 320);
      *(void *)(v5 + 320) = v4;

      uint64_t v2 = a1[4];
      uint64_t v3 = *(void **)(a1[5] + 320);
    }
    uint64_t v7 = a1[6];
    return [v3 setObject:v2 forKey:v7];
  }
  else
  {
    uint64_t v9 = a1[6];
    return [v3 removeObjectForKey:v9];
  }
}

- (id)valueForHTTPHeaderField:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__69;
  v15 = __Block_byref_object_dispose__69;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__SSVAccountLessPlaybackOperation_valueForHTTPHeaderField___block_invoke;
  v8[3] = &unk_1E5BA6F80;
  id v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(SSVOperation *)self dispatchSync:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __59__SSVAccountLessPlaybackOperation_valueForHTTPHeaderField___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 320) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)main
{
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__69;
  v46 = __Block_byref_object_dispose__69;
  id v47 = 0;
  uint64_t v3 = [(SSVComplexOperation *)self URLBagDictionary];
  id v4 = [v3 objectForKey:@"subDownload"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__69;
    v40 = __Block_byref_object_dispose__69;
    id v41 = 0;
    v31 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v4];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v31];
    [v5 setHTTPMethod:@"POST"];
    [v5 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    id v6 = [(SSVAccountLessPlaybackOperation *)self HTTPHeaderFields];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __39__SSVAccountLessPlaybackOperation_main__block_invoke;
    v34[3] = &unk_1E5BA8D80;
    id v7 = v5;
    id v35 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v34];
    v28 = v6;
    id v8 = [(SSVComplexOperation *)self newLoadURLOperationWithRequest:v7];
    id v9 = +[SSVURLDataConsumer consumer];
    [v8 setDataConsumer:v9];

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __39__SSVAccountLessPlaybackOperation_main__block_invoke_2;
    v33[3] = &unk_1E5BACC90;
    v33[4] = &v42;
    v33[5] = &v36;
    [v8 setOutputBlock:v33];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __39__SSVAccountLessPlaybackOperation_main__block_invoke_3;
    v32[3] = &unk_1E5BADFB8;
    v32[4] = self;
    [v8 setPrepareRequestBlock:v32];
    [(SSVOperation *)self runChildOperation:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v29 = [(id)v37[5] objectForKey:@"keybag"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        SSVFairPlayContextIdentifier();
        id v10 = v29;
        [v10 bytes];
        [v10 length];
        lCUad();
      }
      uint64_t v11 = [(id)v37[5] objectForKey:@"failureType"];
      if (v11)
      {
        v12 = (SSVURLBagInterpreter *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v13 = [(id)v37[5] objectForKey:@"dialog"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(SSVURLBagInterpreter *)v12 setObject:v13 forKey:@"SSVPlaybackResponseErrorUserInfoKeyDialogDictionary"];
        }
        if (![(SSVURLBagInterpreter *)v12 count])
        {

          v12 = 0;
        }
        v14 = (void *)MEMORY[0x1E4F28C58];
        if (objc_opt_respondsToSelector()) {
          uint64_t v15 = [v11 integerValue];
        }
        else {
          uint64_t v15 = 0;
        }
        uint64_t v24 = [v14 errorWithDomain:@"SSServerErrorDomain" code:v15 userInfo:v12];
        v25 = (void *)v43[5];
        v43[5] = v24;

        v18 = 0;
      }
      else
      {
        v20 = [SSVPlaybackResponse alloc];
        uint64_t v21 = v37[5];
        v22 = [v8 URLResponse];
        v18 = [(SSVPlaybackResponse *)v20 initWithDictionary:v21 URLResponse:v22];

        v12 = [[SSVURLBagInterpreter alloc] initWithURLBagDictionary:v3];
        v23 = [(SSVURLBagInterpreter *)v12 pastisCertificateURL];
        [(SSVPlaybackResponse *)v18 setFallbackStreamingKeyCertificateURL:v23];

        uint64_t v13 = [(SSVURLBagInterpreter *)v12 pastisKeyServerURL];
        [(SSVPlaybackResponse *)v18 setFallbackStreamingKeyServerURL:v13];
      }
    }
    else if (v43[5])
    {
      v18 = 0;
    }
    else
    {
      uint64_t v19 = SSError(@"SSErrorDomain", 100, 0, 0);
      v18 = 0;
      id v30 = (id)v43[5];
      v43[5] = v19;
    }
    _Block_object_dispose(&v36, 8);
  }
  else
  {
    uint64_t v16 = SSError(@"SSErrorDomain", 124, 0, 0);
    v17 = (void *)v43[5];
    v43[5] = v16;

    v18 = 0;
  }
  uint64_t v26 = [(SSVAccountLessPlaybackOperation *)self responseBlock];
  v27 = (void *)v26;
  if (v26) {
    (*(void (**)(uint64_t, SSVPlaybackResponse *, uint64_t))(v26 + 16))(v26, v18, v43[5]);
  }

  _Block_object_dispose(&v42, 8);
}

uint64_t __39__SSVAccountLessPlaybackOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

void __39__SSVAccountLessPlaybackOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __39__SSVAccountLessPlaybackOperation_main__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _requestBodyData];
  [v3 setHTTPBody:v4];
}

- (id)_requestBodyData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = +[SSDevice currentDevice];
  id v5 = [v4 uniqueDeviceIdentifier];

  if (v5) {
    [v3 setObject:v5 forKey:@"guid"];
  }
  uint64_t v6 = [(SSVAccountLessPlaybackOperation *)self itemIdentifier];

  if (v6) {
    [v3 setObject:v6 forKey:@"salableAdamId"];
  }
  [v3 setObject:@"accountless-streaming" forKey:@"action"];
  id v7 = [(SSVAccountLessPlaybackOperation *)self assetStoreFrontIdentifier];

  if (v7) {
    [v3 setObject:v7 forKey:@"assetStoreFront"];
  }
  uint64_t v16 = 0;
  unsigned int v15 = 0;
  uint64_t v8 = SSVFairPlayContextIdentifier();
  Mt76Vq80ux(v8, -1, 0, 309, (uint64_t)&v16, (uint64_t)&v15);
  if (!v9 && v16)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v11 = (void *)[v10 initWithBytesNoCopy:v16 length:v15 freeWhenDone:0];
    v12 = [v11 base64EncodedStringWithOptions:0];
    if (v12) {
      [v3 setObject:v12 forKey:@"kbsync"];
    }
    jEHf8Xzsv8K(v16);
  }
  uint64_t v13 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:0];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_httpHeaderFields, 0);
  objc_storeStrong((id *)&self->_assetStoreFrontIdentifier, 0);
}

@end