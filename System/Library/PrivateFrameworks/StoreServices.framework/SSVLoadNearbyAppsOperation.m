@interface SSVLoadNearbyAppsOperation
- (CLLocation)location;
- (NSString)pointOfInterestIdentifier;
- (NSString)pointOfInterestProviderIdentifier;
- (NSString)pointOfInterestProviderURL;
- (NSString)storeFrontSuffix;
- (NSString)userAgent;
- (SSVLoadNearbyAppsOperation)initWithBaseURL:(id)a3 location:(id)a4;
- (id)_lookupWithRequest:(id)a3 error:(id *)a4;
- (id)_storeFrontSuffix;
- (id)responseBlock;
- (void)main;
- (void)setPointOfInterestIdentifier:(id)a3;
- (void)setPointOfInterestProviderIdentifier:(id)a3;
- (void)setPointOfInterestProviderURL:(id)a3;
- (void)setResponseBlock:(id)a3;
- (void)setStoreFrontSuffix:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation SSVLoadNearbyAppsOperation

- (SSVLoadNearbyAppsOperation)initWithBaseURL:(id)a3 location:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SSVLoadNearbyAppsOperation;
  v8 = [(SSVLoadNearbyAppsOperation *)&v25 init];
  if (v8)
  {
    id v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.StoreServices.SSVLoadNearbyAppsOperation.%p", v8);
    dispatch_queue_t v10 = dispatch_queue_create((const char *)[v9 UTF8String], 0);
    dispatchQueue = v8->_dispatchQueue;
    v8->_dispatchQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [v6 copy];
    baseURLString = v8->_baseURLString;
    v8->_baseURLString = (NSString *)v12;

    objc_storeStrong((id *)&v8->_location, a4);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    parameters = v8->_parameters;
    v8->_parameters = v14;

    v16 = v8->_parameters;
    v17 = NSString;
    [(CLLocation *)v8->_location coordinate];
    v19 = objc_msgSend(v17, "stringWithFormat:", @"%.4f", v18);
    [(NSMutableDictionary *)v16 setObject:v19 forKey:@"lat"];

    v20 = v8->_parameters;
    v21 = NSString;
    [(CLLocation *)v8->_location coordinate];
    v23 = objc_msgSend(v21, "stringWithFormat:", @"%.4f", v22);
    [(NSMutableDictionary *)v20 setObject:v23 forKey:@"lon"];
  }
  return v8;
}

- (NSString)pointOfInterestIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__23;
  dispatch_queue_t v10 = __Block_byref_object_dispose__23;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__SSVLoadNearbyAppsOperation_pointOfInterestIdentifier__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __55__SSVLoadNearbyAppsOperation_pointOfInterestIdentifier__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 272) objectForKey:@"poi"];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)pointOfInterestProviderIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__23;
  dispatch_queue_t v10 = __Block_byref_object_dispose__23;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__SSVLoadNearbyAppsOperation_pointOfInterestProviderIdentifier__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __63__SSVLoadNearbyAppsOperation_pointOfInterestProviderIdentifier__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 272) objectForKey:@"poiProvider"];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)pointOfInterestProviderURL
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__23;
  dispatch_queue_t v10 = __Block_byref_object_dispose__23;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__SSVLoadNearbyAppsOperation_pointOfInterestProviderURL__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __56__SSVLoadNearbyAppsOperation_pointOfInterestProviderURL__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 272) objectForKey:@"poiURL"];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)responseBlock
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__21;
  dispatch_queue_t v10 = __Block_byref_object_dispose__22;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SSVLoadNearbyAppsOperation_responseBlock__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  uint64_t v3 = (void *)MEMORY[0x1A6268200](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__SSVLoadNearbyAppsOperation_responseBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1A6268200](*(void *)(*(void *)(a1 + 32) + 280));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setPointOfInterestIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SSVLoadNearbyAppsOperation_setPointOfInterestIdentifier___block_invoke;
  v7[3] = &unk_1E5BA7018;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __59__SSVLoadNearbyAppsOperation_setPointOfInterestIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = (id)[v2 copy];
    [*(id *)(*(void *)(a1 + 40) + 272) setObject:v4 forKey:@"poi"];
  }
  else
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 272);
    [v3 removeObjectForKey:@"poi"];
  }
}

- (void)setPointOfInterestProviderIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SSVLoadNearbyAppsOperation_setPointOfInterestProviderIdentifier___block_invoke;
  v7[3] = &unk_1E5BA7018;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __67__SSVLoadNearbyAppsOperation_setPointOfInterestProviderIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = (id)[v2 copy];
    [*(id *)(*(void *)(a1 + 40) + 272) setObject:v4 forKey:@"poiProvider"];
  }
  else
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 272);
    [v3 removeObjectForKey:@"poiProvider"];
  }
}

- (void)setPointOfInterestProviderURL:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SSVLoadNearbyAppsOperation_setPointOfInterestProviderURL___block_invoke;
  v7[3] = &unk_1E5BA7018;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __60__SSVLoadNearbyAppsOperation_setPointOfInterestProviderURL___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = (id)[v2 copy];
    [*(id *)(*(void *)(a1 + 40) + 272) setObject:v4 forKey:@"poiURL"];
  }
  else
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 272);
    [v3 removeObjectForKey:@"poiURL"];
  }
}

- (void)setResponseBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SSVLoadNearbyAppsOperation_setResponseBlock___block_invoke;
  v7[3] = &unk_1E5BA7350;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __47__SSVLoadNearbyAppsOperation_setResponseBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 280) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 280);
    *(void *)(v5 + 280) = v4;
  }
}

- (void)setStoreFrontSuffix:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SSVLoadNearbyAppsOperation_setStoreFrontSuffix___block_invoke;
  v7[3] = &unk_1E5BA7018;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __50__SSVLoadNearbyAppsOperation_setStoreFrontSuffix___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 288) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 288);
    *(void *)(v5 + 288) = v4;
  }
}

- (void)setUserAgent:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SSVLoadNearbyAppsOperation_setUserAgent___block_invoke;
  v7[3] = &unk_1E5BA7018;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __43__SSVLoadNearbyAppsOperation_setUserAgent___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 296) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 296);
    *(void *)(v5 + 296) = v4;
  }
}

- (NSString)storeFrontSuffix
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__23;
  dispatch_queue_t v10 = __Block_byref_object_dispose__23;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__SSVLoadNearbyAppsOperation_storeFrontSuffix__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __46__SSVLoadNearbyAppsOperation_storeFrontSuffix__block_invoke(uint64_t a1)
{
}

- (NSString)userAgent
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__23;
  dispatch_queue_t v10 = __Block_byref_object_dispose__23;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SSVLoadNearbyAppsOperation_userAgent__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __39__SSVLoadNearbyAppsOperation_userAgent__block_invoke(uint64_t a1)
{
}

- (void)main
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E88]);
  [v3 setCachePolicy:1];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v5 = (void *)[(NSString *)self->_baseURLString mutableCopy];
  [v5 appendString:@"?"];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSince1970];
  uint64_t v8 = v7;

  objc_msgSend(v4, "appendFormat:", @"%.0f", v8);
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%.0f", v8);
  [v3 setValue:v9 forHTTPHeaderField:@"X-JS-TIMESTAMP"];

  dispatch_queue_t v10 = +[SSAccountStore defaultStore];
  id v11 = [v10 activeAccount];
  uint64_t v12 = SSVStoreFrontIdentifierForAccount(v11);

  if (v12)
  {
    v13 = [(SSVLoadNearbyAppsOperation *)self _storeFrontSuffix];
    if (v13)
    {
      uint64_t v14 = [v12 stringByAppendingString:v13];

      uint64_t v12 = (void *)v14;
    }
    [v4 appendString:v12];
    [v3 setValue:v12 forHTTPHeaderField:@"X-Apple-Store-Front"];
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SSVLoadNearbyAppsOperation_main__block_invoke;
  block[3] = &unk_1E5BA7068;
  block[4] = self;
  id v16 = v5;
  id v35 = v16;
  id v17 = v4;
  id v36 = v17;
  dispatch_sync(dispatchQueue, block);
  id v18 = v17;
  uint64_t v19 = [v18 UTF8String];
  if (v19)
  {
    v20 = (const void *)v19;
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:20];
    CC_LONG v22 = [v18 length];
    id v23 = v21;
    CC_SHA1(v20, v22, (unsigned __int8 *)[v23 mutableBytes]);
    [v23 setLength:16];
    id v24 = v23;
    fd3fa4R8(3, [v24 mutableBytes]);
    objc_super v25 = [v24 base64EncodedStringWithOptions:0];
    if (v25) {
      [v3 setValue:v25 forHTTPHeaderField:@"X-JS-SP-TOKEN"];
    }
  }
  v26 = [(SSVLoadNearbyAppsOperation *)self userAgent];
  if (!v26)
  {
    v27 = +[SSDevice currentDevice];
    v26 = [v27 userAgentWithClientName:@"AppStore" version:@"2.0"];
  }
  [v3 setValue:v26 forHTTPHeaderField:@"User-Agent"];
  v28 = [MEMORY[0x1E4F1CB10] URLWithString:v16];
  [v3 setURL:v28];

  id v33 = 0;
  v29 = [(SSVLoadNearbyAppsOperation *)self _lookupWithRequest:v3 error:&v33];
  id v30 = v33;
  uint64_t v31 = [(SSVLoadNearbyAppsOperation *)self responseBlock];
  v32 = (void *)v31;
  if (v31) {
    (*(void (**)(uint64_t, void *, id))(v31 + 16))(v31, v29, v30);
  }
}

void __34__SSVLoadNearbyAppsOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 272) mutableCopy];
  uint64_t v3 = 0;
  v16[0] = xmmword_1E5BAA840;
  v16[1] = *(_OWORD *)off_1E5BAA850;
  id v17 = @"lon";
  do
  {
    uint64_t v4 = *(void *)((char *)v16 + v3);
    uint64_t v5 = [v2 objectForKey:v4];
    if (v5)
    {
      if (v13[3]) {
        [*(id *)(a1 + 40) appendString:@"&"];
      }
      [*(id *)(a1 + 48) appendString:v5];
      uint64_t v6 = *(void **)(a1 + 40);
      uint64_t v7 = URLEscapedQueryParameter(v5);
      [v6 appendFormat:@"%@=%@", v4, v7];

      [v2 removeObjectForKey:v4];
      ++v13[3];
    }

    v3 += 8;
  }
  while (v3 != 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__SSVLoadNearbyAppsOperation_main__block_invoke_2;
  v9[3] = &unk_1E5BAA870;
  id v11 = &v12;
  id v10 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v9];

  for (uint64_t i = 32; i != -8; i -= 8)
  _Block_object_dispose(&v12, 8);
}

void __34__SSVLoadNearbyAppsOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [*(id *)(a1 + 32) appendString:@"&"];
  }
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = URLEscapedQueryParameter(v5);
  [v6 appendFormat:@"%@=%@", v8, v7];

  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (id)_lookupWithRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  objc_super v25 = __Block_byref_object_copy__23;
  v26 = __Block_byref_object_dispose__23;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__23;
  v20 = __Block_byref_object_dispose__23;
  id v21 = 0;
  uint64_t v7 = [[SSVLoadURLOperation alloc] initWithURLRequest:v6];
  id v8 = +[SSVURLDataConsumer consumer];
  [(SSVLoadURLOperation *)v7 setDataConsumer:v8];

  [(SSVLoadURLOperation *)v7 setITunesStoreRequest:1];
  [(SSVLoadURLOperation *)v7 setRecordsMetrics:1];
  id v9 = [(SSVLoadNearbyAppsOperation *)self _storeFrontSuffix];
  [(SSVLoadURLOperation *)v7 setStoreFrontSuffix:v9];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__SSVLoadNearbyAppsOperation__lookupWithRequest_error___block_invoke;
  v15[3] = &unk_1E5BAA898;
  v15[4] = &v16;
  v15[5] = &v22;
  [(SSVLoadURLOperation *)v7 setOutputBlock:v15];
  [(SSVLoadURLOperation *)v7 main];
  id v10 = (void *)v17[5];
  id v11 = [(SSVLoadURLOperation *)v7 metricsPageEvent];
  [v10 _setMetricsPageEvent:v11];

  uint64_t v12 = (void *)v17[5];
  if (a4 && !v12)
  {
    *a4 = (id) v23[5];
    uint64_t v12 = (void *)v17[5];
  }
  id v13 = v12;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v13;
}

void __55__SSVLoadNearbyAppsOperation__lookupWithRequest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_storeFrontSuffix
{
  uint64_t v2 = [(SSVLoadNearbyAppsOperation *)self storeFrontSuffix];
  if (!v2) {
    uint64_t v2 = @" t:native";
  }
  return v2;
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 264, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_storeFrontSuffix, 0);
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_baseURLString, 0);
}

@end