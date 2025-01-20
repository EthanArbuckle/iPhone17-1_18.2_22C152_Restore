@interface SSVPlatformRequestOperation
- (BOOL)shouldSuppressCookies;
- (BOOL)shouldSuppressUserInfo;
- (NSArray)bundleIdentifiers;
- (NSArray)itemIdentifiers;
- (NSNumber)timeoutInterval;
- (NSString)imageProfile;
- (NSString)keyProfile;
- (NSString)storeFrontSuffix;
- (NSURL)mainDocumentURL;
- (SSBag)bag;
- (SSVPlatformRequestOperation)init;
- (SSVPlatformRequestOperation)initWithPlatformContext:(id)a3;
- (id)_URLBagContext;
- (id)_callerValue;
- (id)_lookupWithRequest:(id)a3 error:(id *)a4;
- (id)responseBlock;
- (id)valueForHTTPHeaderField:(id)a3;
- (id)valueForRequestParameter:(id)a3;
- (int64_t)personalizationStyle;
- (unint64_t)attribution;
- (void)_enumerateQueryParametersUsingBlock:(id)a3;
- (void)_makeLocalJSSignRequest;
- (void)_makeLocalMescalRequest;
- (void)_makeLookupRequestWithPersonalizationStyle:(int64_t)a3;
- (void)_setCaller:(id)a3;
- (void)_setUserAgent:(id)a3;
- (void)main;
- (void)setAttribution:(unint64_t)a3;
- (void)setBag:(id)a3;
- (void)setBundleIdentifiers:(id)a3;
- (void)setImageProfile:(id)a3;
- (void)setItemIdentifiers:(id)a3;
- (void)setKeyProfile:(id)a3;
- (void)setMainDocumentURL:(id)a3;
- (void)setPersonalizationStyle:(int64_t)a3;
- (void)setResponseBlock:(id)a3;
- (void)setShouldSuppressCookies:(BOOL)a3;
- (void)setShouldSuppressUserInfo:(BOOL)a3;
- (void)setStoreFrontSuffix:(id)a3;
- (void)setTimeoutInterval:(id)a3;
- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4;
- (void)setValue:(id)a3 forRequestParameter:(id)a4;
@end

@implementation SSVPlatformRequestOperation

- (SSVPlatformRequestOperation)init
{
  return [(SSVPlatformRequestOperation *)self initWithPlatformContext:0];
}

- (SSVPlatformRequestOperation)initWithPlatformContext:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SSVPlatformRequestOperation;
  v5 = [(SSVPlatformRequestOperation *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    context = v5->_context;
    v5->_context = (SSVPlatformContext *)v6;

    v5->_personalizationStyle = 2;
    v5->_shouldSuppressUserInfo = 0;
    v5->_shouldSuppressCookies = 0;
    v5->_attribution = 0;
    id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.StoreServices.SSVPlatformRequestOperation.%p", v5);
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v9;
  }
  return v5;
}

- (NSString)imageProfile
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy__76;
  v10 = __Block_byref_object_dispose__76;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SSVPlatformRequestOperation_imageProfile__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __43__SSVPlatformRequestOperation_imageProfile__block_invoke(uint64_t a1)
{
}

- (NSArray)itemIdentifiers
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy__76;
  v10 = __Block_byref_object_dispose__76;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__SSVPlatformRequestOperation_itemIdentifiers__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __46__SSVPlatformRequestOperation_itemIdentifiers__block_invoke(uint64_t a1)
{
}

- (NSArray)bundleIdentifiers
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy__76;
  v10 = __Block_byref_object_dispose__76;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__SSVPlatformRequestOperation_bundleIdentifiers__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __48__SSVPlatformRequestOperation_bundleIdentifiers__block_invoke(uint64_t a1)
{
}

- (NSString)keyProfile
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy__76;
  v10 = __Block_byref_object_dispose__76;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__SSVPlatformRequestOperation_keyProfile__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __41__SSVPlatformRequestOperation_keyProfile__block_invoke(uint64_t a1)
{
}

- (id)responseBlock
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy__5_0;
  v10 = __Block_byref_object_dispose__6_0;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SSVPlatformRequestOperation_responseBlock__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (void *)MEMORY[0x1A6268200](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__SSVPlatformRequestOperation_responseBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1A6268200](*(void *)(*(void *)(a1 + 32) + 328));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (int64_t)personalizationStyle
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SSVPlatformRequestOperation_personalizationStyle__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__SSVPlatformRequestOperation_personalizationStyle__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 320);
  return result;
}

- (void)setImageProfile:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SSVPlatformRequestOperation_setImageProfile___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __47__SSVPlatformRequestOperation_setImageProfile___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 304) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 304);
    *(void *)(v5 + 304) = v4;
  }
}

- (void)setItemIdentifiers:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SSVPlatformRequestOperation_setItemIdentifiers___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __50__SSVPlatformRequestOperation_setItemIdentifiers___block_invoke(uint64_t a1)
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

- (void)setBundleIdentifiers:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SSVPlatformRequestOperation_setBundleIdentifiers___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __52__SSVPlatformRequestOperation_setBundleIdentifiers___block_invoke(uint64_t a1)
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

- (void)setKeyProfile:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SSVPlatformRequestOperation_setKeyProfile___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __45__SSVPlatformRequestOperation_setKeyProfile___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 312) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 312);
    *(void *)(v5 + 312) = v4;
  }
}

- (void)setPersonalizationStyle:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__SSVPlatformRequestOperation_setPersonalizationStyle___block_invoke;
  v4[3] = &unk_1E5BA8DA8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __55__SSVPlatformRequestOperation_setPersonalizationStyle___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 320) = *(void *)(result + 40);
  return result;
}

- (void)setResponseBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SSVPlatformRequestOperation_setResponseBlock___block_invoke;
  v7[3] = &unk_1E5BA7350;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __48__SSVPlatformRequestOperation_setResponseBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 328) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 328);
    *(void *)(v5 + 328) = v4;
  }
}

- (void)setStoreFrontSuffix:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SSVPlatformRequestOperation_setStoreFrontSuffix___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __51__SSVPlatformRequestOperation_setStoreFrontSuffix___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 336) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 336);
    *(void *)(v5 + 336) = v4;
  }
}

- (void)setTimeoutInterval:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SSVPlatformRequestOperation_setTimeoutInterval___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __50__SSVPlatformRequestOperation_setTimeoutInterval___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 344) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 344);
    *(void *)(v5 + 344) = v4;
  }
}

- (void)setValue:(id)a3 forRequestParameter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SSVPlatformRequestOperation_setValue_forRequestParameter___block_invoke;
  block[3] = &unk_1E5BA7068;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __60__SSVPlatformRequestOperation_setValue_forRequestParameter___block_invoke(void *a1)
{
  if (!*(void *)(a1[4] + 256))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v3 = a1[4];
    uint64_t v4 = *(void **)(v3 + 256);
    *(void *)(v3 + 256) = v2;
  }
  uint64_t v5 = *(void **)(a1[4] + 256);
  uint64_t v6 = a1[6];
  if (a1[5])
  {
    return objc_msgSend(v5, "setObject:forKey:");
  }
  else
  {
    uint64_t v8 = a1[6];
    return objc_msgSend(v5, "removeObjectForKey:", v8, v6);
  }
}

- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SSVPlatformRequestOperation_setValue_forHTTPHeaderField___block_invoke;
  block[3] = &unk_1E5BA7068;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __59__SSVPlatformRequestOperation_setValue_forHTTPHeaderField___block_invoke(void *a1)
{
  if (!*(void *)(a1[4] + 248))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v3 = a1[4];
    uint64_t v4 = *(void **)(v3 + 248);
    *(void *)(v3 + 248) = v2;
  }
  uint64_t v5 = *(void **)(a1[4] + 248);
  uint64_t v6 = a1[6];
  if (a1[5])
  {
    return objc_msgSend(v5, "setObject:forKey:");
  }
  else
  {
    uint64_t v8 = a1[6];
    return objc_msgSend(v5, "removeObjectForKey:", v8, v6);
  }
}

- (NSString)storeFrontSuffix
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__76;
  id v10 = __Block_byref_object_dispose__76;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SSVPlatformRequestOperation_storeFrontSuffix__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __47__SSVPlatformRequestOperation_storeFrontSuffix__block_invoke(uint64_t a1)
{
}

- (NSNumber)timeoutInterval
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__76;
  id v10 = __Block_byref_object_dispose__76;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__SSVPlatformRequestOperation_timeoutInterval__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __46__SSVPlatformRequestOperation_timeoutInterval__block_invoke(uint64_t a1)
{
}

- (id)valueForRequestParameter:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__76;
  dispatchQueue = self->_dispatchQueue;
  v16 = __Block_byref_object_dispose__76;
  id v17 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SSVPlatformRequestOperation_valueForRequestParameter___block_invoke;
  block[3] = &unk_1E5BA6F80;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __56__SSVPlatformRequestOperation_valueForRequestParameter___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 256) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)valueForHTTPHeaderField:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__76;
  dispatchQueue = self->_dispatchQueue;
  v16 = __Block_byref_object_dispose__76;
  id v17 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SSVPlatformRequestOperation_valueForHTTPHeaderField___block_invoke;
  block[3] = &unk_1E5BA6F80;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__SSVPlatformRequestOperation_valueForHTTPHeaderField___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 248) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)main
{
  uint64_t v3 = [(SSVPlatformContext *)self->_context SAPContext];

  if (v3)
  {
    [(SSVPlatformRequestOperation *)self _makeLocalMescalRequest];
  }
  else
  {
    int64_t v4 = [(SSVPlatformRequestOperation *)self personalizationStyle];
    if (v4 == 2)
    {
      [(SSVPlatformRequestOperation *)self _makeLocalJSSignRequest];
    }
    else
    {
      [(SSVPlatformRequestOperation *)self _makeLookupRequestWithPersonalizationStyle:v4];
    }
  }
}

- (void)_setCaller:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SSVPlatformRequestOperation__setCaller___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __42__SSVPlatformRequestOperation__setCaller___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 264) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 264);
    *(void *)(v5 + 264) = v4;
  }
}

- (void)_setUserAgent:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SSVPlatformRequestOperation__setUserAgent___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __45__SSVPlatformRequestOperation__setUserAgent___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 352) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 352);
    *(void *)(v5 + 352) = v4;
  }
}

- (id)_callerValue
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__76;
  id v17 = __Block_byref_object_dispose__76;
  id v18 = 0;
  dispatchQueue = self->_dispatchQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__SSVPlatformRequestOperation__callerValue__block_invoke;
  v12[3] = &unk_1E5BA6F30;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(dispatchQueue, v12);
  uint64_t v3 = (void *)v14[5];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v5 = [v4 bundleIdentifier];
    id v6 = (void *)v14[5];
    v14[5] = v5;

    uint64_t v3 = (void *)v14[5];
    if (!v3)
    {
      id v7 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v8 = [v7 processName];
      id v9 = (void *)v14[5];
      v14[5] = v8;

      uint64_t v3 = (void *)v14[5];
    }
  }
  id v10 = v3;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __43__SSVPlatformRequestOperation__callerValue__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 264));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 256) objectForKey:@"caller"];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (void)_enumerateQueryParametersUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, __CFString *, void *, void))a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v5 = [(SSVPlatformRequestOperation *)self _callerValue];
  if (v5) {
    v4[2](v4, @"caller", v5, v18[3]++);
  }
  id v6 = [(SSVPlatformRequestOperation *)self itemIdentifiers];
  id v7 = [v6 componentsJoinedByString:@","];

  if (v7) {
    v4[2](v4, @"id", v7, v18[3]++);
  }
  uint64_t v8 = [(SSVPlatformRequestOperation *)self bundleIdentifiers];
  id v9 = [v8 componentsJoinedByString:@","];

  if (v9) {
    v4[2](v4, @"bundleId", v9, v18[3]++);
  }
  id v10 = [(SSVPlatformRequestOperation *)self keyProfile];
  if (v10) {
    v4[2](v4, @"p", v10, v18[3]++);
  }
  id v11 = [(SSVPlatformRequestOperation *)self imageProfile];
  if (v11) {
    v4[2](v4, @"artwork", v11, v18[3]++);
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SSVPlatformRequestOperation__enumerateQueryParametersUsingBlock___block_invoke;
  block[3] = &unk_1E5BAE4E0;
  block[4] = self;
  id v15 = v4;
  v16 = &v17;
  uint64_t v13 = v4;
  dispatch_sync(dispatchQueue, block);

  _Block_object_dispose(&v17, 8);
}

void __67__SSVPlatformRequestOperation__enumerateQueryParametersUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 256);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__SSVPlatformRequestOperation__enumerateQueryParametersUsingBlock___block_invoke_2;
  v5[3] = &unk_1E5BAE4B8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void __67__SSVPlatformRequestOperation__enumerateQueryParametersUsingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([v6 isEqualToString:@"caller"] & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (id)_lookupWithRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__76;
  v32 = __Block_byref_object_dispose__76;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__76;
  v26 = __Block_byref_object_dispose__76;
  id v27 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SSVPlatformRequestOperation__lookupWithRequest_error___block_invoke;
  block[3] = &unk_1E5BA7018;
  block[4] = self;
  id v8 = v6;
  id v21 = v8;
  dispatch_sync(dispatchQueue, block);
  id v9 = [[SSVLoadURLOperation alloc] initWithURLRequest:v8];
  id v10 = +[SSVURLDataConsumer consumer];
  [(SSVLoadURLOperation *)v9 setDataConsumer:v10];

  [(SSVLoadURLOperation *)v9 setITunesStoreRequest:1];
  id v11 = [(SSVPlatformRequestOperation *)self storeFrontSuffix];
  [(SSVLoadURLOperation *)v9 setStoreFrontSuffix:v11];

  [(SSVLoadURLOperation *)v9 setShouldSuppressUserInfo:[(SSVPlatformRequestOperation *)self shouldSuppressUserInfo]];
  [(SSVLoadURLOperation *)v9 setShouldSuppressCookies:[(SSVPlatformRequestOperation *)self shouldSuppressCookies]];
  [(SSVLoadURLOperation *)v9 setAttribution:[(SSVPlatformRequestOperation *)self attribution]];
  uint64_t v12 = [(SSVPlatformRequestOperation *)self mainDocumentURL];

  if (v12)
  {
    uint64_t v13 = [(SSVPlatformRequestOperation *)self mainDocumentURL];
    [(SSVLoadURLOperation *)v9 setMainDocumentURL:v13];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__SSVPlatformRequestOperation__lookupWithRequest_error___block_invoke_3;
  v19[3] = &unk_1E5BAE508;
  v19[4] = &v22;
  v19[5] = &v28;
  [(SSVLoadURLOperation *)v9 setOutputBlock:v19];
  [(SSVLoadURLOperation *)v9 main];
  uint64_t v14 = (void *)v23[5];
  id v15 = [(SSVLoadURLOperation *)v9 metricsPageEvent];
  [v14 _setMetricsPageEvent:v15];

  v16 = (void *)v23[5];
  if (a4 && !v16)
  {
    *a4 = (id) v29[5];
    v16 = (void *)v23[5];
  }
  id v17 = v16;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v17;
}

void __56__SSVPlatformRequestOperation__lookupWithRequest_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 352);
  if (v3)
  {
    [*(id *)(a1 + 40) setValue:v3 forHTTPHeaderField:@"User-Agent"];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v4 = *(void **)(v2 + 248);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__SSVPlatformRequestOperation__lookupWithRequest_error___block_invoke_2;
  v5[3] = &unk_1E5BA8D80;
  id v6 = *(id *)(a1 + 40);
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

uint64_t __56__SSVPlatformRequestOperation__lookupWithRequest_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

void __56__SSVPlatformRequestOperation__lookupWithRequest_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [[SSLookupResponse alloc] initWithResponseDictionary:v11];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (void)_makeLocalJSSignRequest
{
  v60[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SSVPlatformContext *)self->_context unpersonalizedLookupURLString];
  id v4 = (id)[v3 mutableCopy];

  if (v4) {
    goto LABEL_6;
  }
  bag = self->_bag;
  if (bag)
  {
    id v6 = [(SSBag *)bag stringForKey:@"storeplatform-lookup-url-unpersonalized" error:0];
    id v4 = (id)[v6 mutableCopy];
  }
  else
  {
    uint64_t v7 = [(SSVPlatformRequestOperation *)self _URLBagContext];
    id v6 = +[SSURLBag URLBagForContext:v7];

    id v8 = [v6 valueForKey:@"storeplatform-lookup-url-unpersonalized" error:0];
    id v4 = (id)[v8 mutableCopy];
  }
  if (v4)
  {
LABEL_6:
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F28E88]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    [v4 appendString:@"?"];
    uint64_t v13 = [(SSVPlatformRequestOperation *)self timeoutInterval];
    uint64_t v14 = v13;
    if (v13)
    {
      [v13 doubleValue];
      objc_msgSend(v11, "setTimeoutInterval:");
    }
    id v15 = [MEMORY[0x1E4F1C9C8] date];
    [v15 timeIntervalSince1970];
    uint64_t v17 = v16;

    objc_msgSend(v12, "appendFormat:", @"%.0f", v17);
    id v18 = objc_msgSend(NSString, "stringWithFormat:", @"X-JS-TIMESTAMP=%.0f", v17);
    [v9 addObject:v18];

    uint64_t v19 = +[SSAccountStore defaultStore];
    uint64_t v20 = [v19 activeAccount];
    id v21 = SSVStoreFrontIdentifierForAccount(v20);

    if (v21)
    {
      uint64_t v22 = [(SSVPlatformRequestOperation *)self storeFrontSuffix];
      if (v22)
      {
        uint64_t v23 = [v21 stringByAppendingString:v22];

        id v21 = (void *)v23;
      }
      [v12 appendString:v21];
    }
    v49 = v14;
    v50 = v9;
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __54__SSVPlatformRequestOperation__makeLocalJSSignRequest__block_invoke;
    v56[3] = &unk_1E5BAE530;
    id v4 = v4;
    id v57 = v4;
    id v24 = v10;
    id v58 = v24;
    [(SSVPlatformRequestOperation *)self _enumerateQueryParametersUsingBlock:v56];
    v25 = [v24 objectForKey:@"version"];

    if (!v25) {
      [v4 appendString:@"&version=1"];
    }
    v60[0] = @"caller";
    v60[1] = @"id";
    v60[2] = @"p";
    [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:3];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = [v26 countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v53 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [v24 objectForKey:*(void *)(*((void *)&v52 + 1) + 8 * i)];
          if (v31) {
            [v12 appendString:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v52 objects:v59 count:16];
      }
      while (v28);
    }

    id v32 = v12;
    uint64_t v33 = [v32 UTF8String];
    if (v33)
    {
      v34 = (const void *)v33;
      v35 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:20];
      CC_LONG v36 = [v32 length];
      id v37 = v35;
      CC_SHA1(v34, v36, (unsigned __int8 *)[v37 mutableBytes]);
      [v37 setLength:16];
      id v38 = v37;
      fd3fa4R8(3, [v38 mutableBytes]);
      v39 = [v38 base64EncodedStringWithOptions:0];
      if (v39)
      {
        v40 = [NSString stringWithFormat:@"X-JS-SP-TOKEN=%@", v39, v49];
        [v50 addObject:v40];
      }
    }
    if ([v50 count])
    {
      v41 = [v50 componentsJoinedByString:@"; "];
      [v11 setValue:v41 forHTTPHeaderField:@"Cookie"];
    }
    v42 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
    [v11 setURL:v42];

    v43 = [(SSVPlatformRequestOperation *)self mainDocumentURL];

    if (v43)
    {
      v44 = [(SSVPlatformRequestOperation *)self mainDocumentURL];
      [v11 setMainDocumentURL:v44];
    }
    objc_msgSend(v11, "setAttribution:", -[SSVPlatformRequestOperation attribution](self, "attribution"));
    id v51 = 0;
    v45 = [(SSVPlatformRequestOperation *)self _lookupWithRequest:v11 error:&v51];
    id v46 = v51;
  }
  else
  {
    SSError(@"SSErrorDomain", 124, 0, 0);
    id v46 = (id)objc_claimAutoreleasedReturnValue();
    v45 = 0;
  }
  uint64_t v47 = [(SSVPlatformRequestOperation *)self responseBlock];
  v48 = (void *)v47;
  if (v47)
  {
    (*(void (**)(uint64_t, void *, id))(v47 + 16))(v47, v45, v46);
    [(SSVPlatformRequestOperation *)self setResponseBlock:0];
  }
}

void __54__SSVPlatformRequestOperation__makeLocalJSSignRequest__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v10 = a2;
  id v7 = a3;
  if (a4) {
    [*(id *)(a1 + 32) appendString:@"&"];
  }
  [*(id *)(a1 + 40) setObject:v7 forKey:v10];
  id v8 = *(void **)(a1 + 32);
  id v9 = URLEscapedQueryParameter(v7);
  [v8 appendFormat:@"%@=%@", v10, v9];
}

- (void)_makeLocalMescalRequest
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E88]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [(SSVPlatformRequestOperation *)self timeoutInterval];
  id v7 = v6;
  if (v6)
  {
    [v6 doubleValue];
    objc_msgSend(v3, "setTimeoutInterval:");
  }
  v50 = v7;
  id v8 = [(SSVPlatformContext *)self->_context lookupURLString];
  id v9 = (void *)[v8 mutableCopy];

  [v9 appendString:@"?"];
  id v10 = +[SSAccountStore defaultStore];
  id v11 = [v10 activeAccount];

  id v12 = [v11 uniqueIdentifier];
  uint64_t v13 = [v12 stringValue];

  id v51 = (void *)v13;
  if (v13 && ![(SSVPlatformRequestOperation *)self shouldSuppressUserInfo])
  {
    uint64_t v14 = [@"X-Dsid" lowercaseString];
    [v4 setObject:v51 forKey:v14];

    [v3 setValue:v51 forHTTPHeaderField:@"X-Dsid"];
  }
  uint64_t v15 = SSVStoreFrontIdentifierForAccount(v11);
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    uint64_t v17 = [(SSVPlatformRequestOperation *)self storeFrontSuffix];
    if (v17)
    {
      uint64_t v18 = [v16 stringByAppendingString:v17];

      uint64_t v16 = (void *)v18;
    }
    uint64_t v19 = [@"X-Apple-Store-Front" lowercaseString];
    [v4 setObject:v16 forKey:v19];

    [v3 setValue:v16 forHTTPHeaderField:@"X-Apple-Store-Front"];
  }
  v49 = v11;
  id v20 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v20 setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZ"];
  id v21 = [MEMORY[0x1E4F1C9C8] date];
  v48 = v20;
  uint64_t v22 = [v20 stringFromDate:v21];

  if (v22)
  {
    [v4 setObject:v22 forKey:@"x-request-timestamp"];
    [v3 setValue:v22 forHTTPHeaderField:@"X-Request-TimeStamp"];
  }
  uint64_t v47 = (void *)v22;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __54__SSVPlatformRequestOperation__makeLocalMescalRequest__block_invoke;
  v63[3] = &unk_1E5BAE530;
  id v53 = v9;
  id v64 = v53;
  id v23 = v5;
  id v65 = v23;
  [(SSVPlatformRequestOperation *)self _enumerateQueryParametersUsingBlock:v63];
  id v24 = [v23 objectForKey:@"version"];

  if (!v24) {
    [v53 appendString:@"&version=1"];
  }
  long long v52 = v3;
  id v25 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v26 = [(SSVPlatformContext *)self->_context signedHeaders];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v60 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = [v4 objectForKey:*(void *)(*((void *)&v59 + 1) + 8 * i)];
        if (v31) {
          [v25 appendString:v31];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v28);
  }
  id v32 = [(SSVPlatformContext *)self->_context signedQueryParameters];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v55 objects:v66 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v56 != v35) {
          objc_enumerationMutation(v32);
        }
        id v37 = [v23 objectForKey:*(void *)(*((void *)&v55 + 1) + 8 * j)];
        if (v37) {
          [v25 appendString:v37];
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v55 objects:v66 count:16];
    }
    while (v34);
  }
  id v38 = [v25 dataUsingEncoding:4];
  if (v38)
  {
    v39 = [(SSVPlatformContext *)self->_context SAPContext];
    v40 = [v39 signatureWithData:v38 error:0];

    v41 = [v40 base64EncodedStringWithOptions:0];
    if (v41) {
      [v52 setValue:v41 forHTTPHeaderField:@"X-Apple-ActionSignature"];
    }
  }
  v42 = [MEMORY[0x1E4F1CB10] URLWithString:v53];
  [v52 setURL:v42];

  id v54 = 0;
  v43 = [(SSVPlatformRequestOperation *)self _lookupWithRequest:v52 error:&v54];
  id v44 = v54;
  uint64_t v45 = [(SSVPlatformRequestOperation *)self responseBlock];
  id v46 = (void *)v45;
  if (v45)
  {
    (*(void (**)(uint64_t, void *, id))(v45 + 16))(v45, v43, v44);
    [(SSVPlatformRequestOperation *)self setResponseBlock:0];
  }
}

void __54__SSVPlatformRequestOperation__makeLocalMescalRequest__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v10 = a2;
  id v7 = a3;
  if (a4) {
    [*(id *)(a1 + 32) appendString:@"&"];
  }
  id v8 = *(void **)(a1 + 32);
  id v9 = URLEscapedQueryParameter(v7);
  [v8 appendFormat:@"%@=%@", v10, v9];

  [*(id *)(a1 + 40) setObject:v7 forKey:v10];
}

- (void)_makeLookupRequestWithPersonalizationStyle:(int64_t)a3
{
  id v5 = objc_alloc_init(SSLookupRequest);
  id v6 = [(SSVPlatformRequestOperation *)self keyProfile];
  [(SSLookupRequest *)v5 setKeyProfile:v6];

  [(SSLookupRequest *)v5 setPersonalizationStyle:a3];
  id v7 = [(SSVPlatformRequestOperation *)self timeoutInterval];
  [(SSLookupRequest *)v5 _setTimeoutInterval:v7];

  id v8 = [(SSVPlatformRequestOperation *)self itemIdentifiers];
  [(SSLookupRequest *)v5 setValue:v8 forRequestParameter:@"id"];

  additionalParameters = self->_additionalParameters;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __74__SSVPlatformRequestOperation__makeLookupRequestWithPersonalizationStyle___block_invoke;
  v34[3] = &unk_1E5BA8D80;
  id v10 = v5;
  uint64_t v35 = v10;
  [(NSMutableDictionary *)additionalParameters enumerateKeysAndObjectsUsingBlock:v34];
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__76;
  id v32 = __Block_byref_object_dispose__76;
  id v33 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__76;
  id v26 = __Block_byref_object_dispose__76;
  id v27 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __74__SSVPlatformRequestOperation__makeLookupRequestWithPersonalizationStyle___block_invoke_2;
  uint64_t v18 = &unk_1E5BAE558;
  id v20 = &v28;
  id v21 = &v22;
  id v12 = v11;
  uint64_t v19 = v12;
  [(SSLookupRequest *)v10 startWithLookupBlock:&v15];
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v13 = [(SSVPlatformRequestOperation *)self responseBlock];
  uint64_t v14 = (void *)v13;
  if (v13)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v13, v23[5], v29[5]);
    [(SSVPlatformRequestOperation *)self setResponseBlock:0];
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
}

uint64_t __74__SSVPlatformRequestOperation__makeLookupRequestWithPersonalizationStyle___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forRequestParameter:a2];
}

void __74__SSVPlatformRequestOperation__makeLookupRequestWithPersonalizationStyle___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_URLBagContext
{
  id v3 = +[SSURLBagContext contextWithBagType:0];
  uint64_t v10 = 0;
  dispatch_semaphore_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__76;
  uint64_t v14 = __Block_byref_object_dispose__76;
  id v15 = 0;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__SSVPlatformRequestOperation__URLBagContext__block_invoke;
  v9[3] = &unk_1E5BA6F30;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(dispatchQueue, v9);
  uint64_t v5 = v11[5];
  if (!v5)
  {
    uint64_t v6 = SSVDefaultUserAgent();
    id v7 = (void *)v11[5];
    v11[5] = v6;

    uint64_t v5 = v11[5];
  }
  [v3 setValue:v5 forHTTPHeaderField:@"User-Agent"];
  _Block_object_dispose(&v10, 8);

  return v3;
}

void __45__SSVPlatformRequestOperation__URLBagContext__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 352) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)shouldSuppressCookies
{
  return self->_shouldSuppressCookies;
}

- (void)setShouldSuppressCookies:(BOOL)a3
{
  self->_shouldSuppressCookies = a3;
}

- (BOOL)shouldSuppressUserInfo
{
  return self->_shouldSuppressUserInfo;
}

- (void)setShouldSuppressUserInfo:(BOOL)a3
{
  self->_shouldSuppressUserInfo = a3;
}

- (NSURL)mainDocumentURL
{
  return (NSURL *)objc_getProperty(self, a2, 368, 1);
}

- (void)setMainDocumentURL:(id)a3
{
}

- (unint64_t)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(unint64_t)a3
{
  self->_attribution = a3;
}

- (SSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_mainDocumentURL, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_timeoutInterval, 0);
  objc_storeStrong((id *)&self->_storeFrontSuffix, 0);
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong((id *)&self->_keyProfile, 0);
  objc_storeStrong((id *)&self->_imageProfile, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_additionalParameters, 0);
  objc_storeStrong((id *)&self->_additionalHeaderFields, 0);
}

@end