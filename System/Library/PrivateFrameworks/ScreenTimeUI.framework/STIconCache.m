@interface STIconCache
+ (STIconCache)sharedCache;
- (CNMonogrammer)monogrammer;
- (NSMutableSet)bundleIdentifiersWithPendingRequests;
- (NSPersonNameComponentsFormatter)personNameComponentsFormatter;
- (NSURLSession)urlSession;
- (OS_dispatch_queue)lookupQueue;
- (STIconCache)init;
- (UIImage)imageForBlankApplicationIcon;
- (id)_newCircleImageWithFillColor:(id)a3 fillDiameter:(double)a4 outlineColor:(id)a5 outlineWidth:(double)a6;
- (id)_personImageWithDSID:(id)a3 fullName:(id)a4 appleID:(id)a5 forceFetch:(BOOL)a6 completionHandler:(id)a7;
- (id)blankSpaceImageWithSize:(CGSize)a3;
- (id)circleImageWithFillColor:(id)a3 fillDiameter:(double)a4 outlineColor:(id)a5 outlineWidth:(double)a6;
- (id)imageForBundleIdentifier:(id)a3;
- (id)imageForCategoryIdentifier:(id)a3;
- (id)monogramImageForInitial:(id)a3 useDarkColors:(BOOL)a4;
- (id)monogramImageForNameComponents:(id)a3;
- (id)personImageWithDSID:(id)a3 fullName:(id)a4;
- (id)roundedImageForImageWithName:(id)a3;
- (void)_fetchFamilyPhotoWithDSID:(id)a3 fullName:(id)a4 appleID:(id)a5 completionHandler:(id)a6;
- (void)_fetchImageForAppInfoIfNeeded:(id)a3;
- (void)_fetchImageForAppInfoIfNeeded:(id)a3 completionHandler:(id)a4;
- (void)_handleiTunesResponseForAppInfo:(id)a3 response:(id)a4 data:(id)a5 error:(id)a6;
- (void)_handleiTunesResponseForAppInfo:(id)a3 response:(id)a4 data:(id)a5 error:(id)a6 completionHandler:(id)a7;
- (void)_updateCacheWithImage:(id)a3 bundleIdentifier:(id)a4;
- (void)_updateCacheWithImage:(id)a3 dsid:(id)a4;
- (void)addObserver:(id)a3 selector:(SEL)a4 bundleIdentifier:(id)a5;
- (void)dealloc;
- (void)fetchPersonImageWithDSID:(id)a3 fullName:(id)a4 appleID:(id)a5 forceFetch:(BOOL)a6 completionHandler:(id)a7;
- (void)imageForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeObserver:(id)a3 bundleIdentifier:(id)a4;
- (void)setMonogrammer:(id)a3;
- (void)setPersonNameComponentsFormatter:(id)a3;
@end

@implementation STIconCache

+ (STIconCache)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedCache_sharedCache;

  return (STIconCache *)v2;
}

uint64_t __26__STIconCache_sharedCache__block_invoke()
{
  sharedCache_sharedCache = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (STIconCache)init
{
  v19.receiver = self;
  v19.super_class = (Class)STIconCache;
  v2 = [(STIconCache *)&v19 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    iconByKeyCache = v2->_iconByKeyCache;
    v2->_iconByKeyCache = (NSCache *)v3;

    [(NSCache *)v2->_iconByKeyCache setName:@"com.apple.screentime.icon-cache"];
    uint64_t v5 = objc_opt_new();
    bundleIdentifiersWithPendingRequests = v2->_bundleIdentifiersWithPendingRequests;
    v2->_bundleIdentifiersWithPendingRequests = (NSMutableSet *)v5;

    v7 = (const char *)[@"com.apple.screentime.icon-cache" UTF8String];
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create(v7, v9);
    lookupQueue = v2->_lookupQueue;
    v2->_lookupQueue = (OS_dispatch_queue *)v10;

    v12 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
    v13 = [MEMORY[0x263F08B98] sharedURLCache];
    [v12 setURLCache:v13];

    [v12 setRequestCachePolicy:2];
    [v12 setHTTPShouldUsePipelining:1];
    v14 = objc_opt_new();
    [v14 setName:@"com.apple.screentime.icon-cache"];
    [v14 setUnderlyingQueue:v2->_lookupQueue];
    uint64_t v15 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v12 delegate:0 delegateQueue:v14];
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v15;

    v17 = [v14 name];
    [(NSURLSession *)v2->_urlSession setSessionDescription:v17];
  }
  return v2;
}

- (void)dealloc
{
  [(NSURLSession *)self->_urlSession invalidateAndCancel];
  v3.receiver = self;
  v3.super_class = (Class)STIconCache;
  [(STIconCache *)&v3 dealloc];
}

- (UIImage)imageForBlankApplicationIcon
{
  objc_super v3 = [(NSCache *)self->_iconByKeyCache objectForKey:@"blank-app-icon"];
  if (!v3)
  {
    objc_super v3 = [MEMORY[0x263F1C6B0] blankIcon];
    [(NSCache *)self->_iconByKeyCache setObject:v3 forKey:@"blank-app-icon" cost:0];
  }

  return (UIImage *)v3;
}

- (void)imageForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = [NSString stringWithFormat:@"bundle-id.%@", v6];
  uint64_t v9 = [(NSCache *)self->_iconByKeyCache objectForKey:v8];
  if (!v9)
  {
    v11 = [MEMORY[0x263F670A8] sharedCache];
    v12 = [v11 appInfoForBundleIdentifier:v6];

    uint64_t v13 = [v12 platform];
    if ([v6 isEqualToString:@"com.apple.compass"]) {
      goto LABEL_9;
    }
    if ([v12 source] == 2)
    {
      v14 = (void *)MEMORY[0x263F1C6B0];
      uint64_t v15 = [v12 bundleIdentifier];
      dispatch_queue_t v10 = [v14 iconWithAppBundleID:v15];

      if (!v10)
      {
        v16 = [MEMORY[0x263F671D8] appInfo];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[STIconCache imageForBundleIdentifier:completionHandler:]();
        }
LABEL_25:

        dispatch_queue_t v10 = [(STIconCache *)self imageForBlankApplicationIcon];
      }
LABEL_10:
      [(NSCache *)self->_iconByKeyCache setObject:v10 forKey:v8 cost:10];
      v7[2](v7, v10);
LABEL_11:

      goto LABEL_12;
    }
    if ([v12 source] == 1)
    {
LABEL_9:
      v17 = (void *)MEMORY[0x263F1C6B0];
      v18 = +[STScreenTimeUIBundle bundle];
      objc_super v19 = [v17 imageNamed:v6 inBundle:v18];
      dispatch_queue_t v10 = [v19 iconFromPrecomposedImage:0 platform:v13];

      goto LABEL_10;
    }
    if ([v12 source] == 3)
    {
      v20 = [v12 artworkURL];

      if (!v20)
      {
        v16 = [MEMORY[0x263F671D8] appInfo];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[STIconCache imageForBundleIdentifier:completionHandler:]();
        }
        goto LABEL_25;
      }
      objc_initWeak(&location, self);
      v21 = [(STIconCache *)self lookupQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__STIconCache_imageForBundleIdentifier_completionHandler___block_invoke;
      block[3] = &unk_26449B520;
      objc_copyWeak(&v37, &location);
      id v35 = v12;
      v36 = v7;
      dispatch_async(v21, block);

      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);
LABEL_22:
      dispatch_queue_t v10 = 0;
      goto LABEL_11;
    }
    if ([v12 source] != 4) {
      goto LABEL_22;
    }
    v22 = [v12 artworkData];
    if (v22)
    {
      v23 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) _initWithData:v22 preserveScale:1];
      dispatch_queue_t v10 = [v23 iconFromPrecomposedImage:0 platform:v13];

      if (v10)
      {
LABEL_32:
        [(NSCache *)self->_iconByKeyCache setObject:v10 forKey:v8 cost:10];
        v7[2](v7, v10);

        goto LABEL_11;
      }
      v24 = [MEMORY[0x263F671D8] appInfo];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[STIconCache imageForBundleIdentifier:completionHandler:].cold.4();
      }
    }
    else
    {
      uint64_t v25 = [v12 artworkURL];
      if (v25)
      {
        v26 = (void *)v25;
        int v27 = _os_feature_enabled_impl();

        if (v27)
        {
          objc_initWeak(&location, self);
          v28 = [(STIconCache *)self lookupQueue];
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __58__STIconCache_imageForBundleIdentifier_completionHandler___block_invoke_62;
          v30[3] = &unk_26449B520;
          objc_copyWeak(&v33, &location);
          id v31 = v12;
          v32 = v7;
          dispatch_async(v28, v30);

          objc_destroyWeak(&v33);
          objc_destroyWeak(&location);
        }
      }
    }
    v29 = [MEMORY[0x263F671D8] appInfo];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[STIconCache imageForBundleIdentifier:completionHandler:]();
    }

    dispatch_queue_t v10 = [(STIconCache *)self imageForBlankApplicationIcon];
    goto LABEL_32;
  }
  dispatch_queue_t v10 = (void *)v9;
  v7[2](v7, (void *)v9);
LABEL_12:
}

void __58__STIconCache_imageForBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _fetchImageForAppInfoIfNeeded:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

void __58__STIconCache_imageForBundleIdentifier_completionHandler___block_invoke_62(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _fetchImageForAppInfoIfNeeded:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

- (void)_fetchImageForAppInfoIfNeeded:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(STIconCache *)self lookupQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v6 artworkURL];
  objc_initWeak(&location, self);
  dispatch_queue_t v10 = [(STIconCache *)self urlSession];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __63__STIconCache__fetchImageForAppInfoIfNeeded_completionHandler___block_invoke;
  v17 = &unk_26449B548;
  objc_copyWeak(&v20, &location);
  id v11 = v6;
  id v18 = v11;
  id v12 = v7;
  id v19 = v12;
  uint64_t v13 = [v10 dataTaskWithURL:v9 completionHandler:&v14];

  objc_msgSend(v13, "resume", v14, v15, v16, v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __63__STIconCache__fetchImageForAppInfoIfNeeded_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = (id *)(a1 + 48);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained _handleiTunesResponseForAppInfo:*(void *)(a1 + 32) response:v9 data:v10 error:v8 completionHandler:*(void *)(a1 + 40)];
}

- (void)_handleiTunesResponseForAppInfo:(id)a3 response:(id)a4 data:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = [(STIconCache *)self lookupQueue];
  dispatch_assert_queue_V2(v15);

  v16 = [v11 bundleIdentifier];
  v17 = [NSString stringWithFormat:@"bundle-id.%@", v16];
  if (!v12 || v13)
  {
    v21 = [MEMORY[0x263F671D8] appInfo];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[STIconCache _handleiTunesResponseForAppInfo:response:data:error:completionHandler:]();
    }

    v22 = [(STIconCache *)self imageForBlankApplicationIcon];
    [(NSCache *)self->_iconByKeyCache setObject:v22 forKey:v17 cost:10];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__STIconCache__handleiTunesResponseForAppInfo_response_data_error_completionHandler___block_invoke;
    block[3] = &unk_26449B570;
    id v35 = v14;
    id v23 = v22;
    id v34 = v23;
    id v24 = v14;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v18 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v12];
    if (v18)
    {
      id v19 = v18;
      id v20 = objc_msgSend(v18, "iconFromPrecomposedImage:platform:", 0, objc_msgSend(v11, "platform"));
    }
    else
    {
      uint64_t v25 = [MEMORY[0x263F671D8] appInfo];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[STIconCache _handleiTunesResponseForAppInfo:response:data:error:completionHandler:]();
      }

      id v20 = [(STIconCache *)self imageForBlankApplicationIcon];
    }
    [(NSCache *)self->_iconByKeyCache setObject:v20 forKey:v17 cost:15];
    v26 = [MEMORY[0x263F671D8] appInfo];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v16;
      _os_log_impl(&dword_21E199000, v26, OS_LOG_TYPE_INFO, "Added an icon for %@ to the cache", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __85__STIconCache__handleiTunesResponseForAppInfo_response_data_error_completionHandler___block_invoke_64;
    v28[3] = &unk_26449B598;
    id v31 = v14;
    id v23 = v20;
    id v29 = v23;
    id v27 = v14;
    objc_copyWeak(&v32, (id *)buf);
    id v30 = v16;
    dispatch_async(MEMORY[0x263EF83A0], v28);

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __85__STIconCache__handleiTunesResponseForAppInfo_response_data_error_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __85__STIconCache__handleiTunesResponseForAppInfo_response_data_error_completionHandler___block_invoke_64(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _updateCacheWithImage:*(void *)(a1 + 32) bundleIdentifier:*(void *)(a1 + 40)];
}

- (id)imageForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v6 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = [NSString stringWithFormat:@"bundle-id.%@", v4];
  id v6 = [(NSCache *)self->_iconByKeyCache objectForKey:v5];
  if (!v6)
  {
    id v7 = [MEMORY[0x263F670A8] sharedCache];
    id v8 = [v7 appInfoForBundleIdentifier:v4];

    uint64_t v9 = [v8 platform];
    if ([v4 isEqualToString:@"com.apple.compass"]) {
      goto LABEL_11;
    }
    if ([v8 source] == 2)
    {
      id v10 = (void *)MEMORY[0x263F1C6B0];
      id v11 = [v8 bundleIdentifier];
      id v6 = [v10 iconWithAppBundleID:v11];

      if (!v6)
      {
        id v12 = [MEMORY[0x263F671D8] appInfo];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[STIconCache imageForBundleIdentifier:completionHandler:]();
        }

        id v6 = [(STIconCache *)self imageForBlankApplicationIcon];
      }
      goto LABEL_12;
    }
    if ([v8 source] == 1)
    {
LABEL_11:
      id v13 = (void *)MEMORY[0x263F1C6B0];
      id v14 = +[STScreenTimeUIBundle bundle];
      uint64_t v15 = [v13 imageNamed:v4 inBundle:v14];
      id v6 = [v15 iconFromPrecomposedImage:0 platform:v9];

LABEL_12:
      [(NSCache *)self->_iconByKeyCache setObject:v6 forKey:v5 cost:10];
LABEL_13:

      goto LABEL_14;
    }
    if ([v8 source] == 3)
    {
      v17 = [v8 artworkURL];

      if (!v17)
      {
        v22 = [MEMORY[0x263F671D8] appInfo];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[STIconCache imageForBundleIdentifier:completionHandler:]();
        }

        id v6 = [(STIconCache *)self imageForBlankApplicationIcon];
        if (_os_feature_enabled_impl()) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      objc_initWeak(&location, self);
      id v18 = [(STIconCache *)self lookupQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __40__STIconCache_imageForBundleIdentifier___block_invoke;
      block[3] = &unk_26449B5C0;
      objc_copyWeak(&v33, &location);
      id v32 = v8;
      dispatch_async(v18, block);

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
LABEL_27:
      id v6 = 0;
      goto LABEL_13;
    }
    if ([v8 source] != 4) {
      goto LABEL_27;
    }
    id v19 = [v8 artworkData];
    if (v19)
    {
      id v20 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) _initWithData:v19 preserveScale:1];
      id v6 = [v20 iconFromPrecomposedImage:0 platform:v9];

      if (v6)
      {
LABEL_38:
        [(NSCache *)self->_iconByKeyCache setObject:v6 forKey:v5 cost:10];

        goto LABEL_13;
      }
      v21 = [MEMORY[0x263F671D8] appInfo];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[STIconCache imageForBundleIdentifier:completionHandler:].cold.4();
      }
    }
    else
    {
      uint64_t v23 = [v8 artworkURL];
      if (v23)
      {
        id v24 = (void *)v23;
        int v25 = _os_feature_enabled_impl();

        if (v25)
        {
          objc_initWeak(&location, self);
          v26 = [(STIconCache *)self lookupQueue];
          v28[0] = MEMORY[0x263EF8330];
          v28[1] = 3221225472;
          v28[2] = __40__STIconCache_imageForBundleIdentifier___block_invoke_65;
          v28[3] = &unk_26449B5C0;
          objc_copyWeak(&v30, &location);
          id v29 = v8;
          dispatch_async(v26, v28);

          objc_destroyWeak(&v30);
          objc_destroyWeak(&location);
        }
      }
    }
    id v27 = [MEMORY[0x263F671D8] appInfo];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[STIconCache imageForBundleIdentifier:completionHandler:]();
    }

    id v6 = [(STIconCache *)self imageForBlankApplicationIcon];
    goto LABEL_38;
  }
LABEL_14:

LABEL_15:

  return v6;
}

void __40__STIconCache_imageForBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _fetchImageForAppInfoIfNeeded:*(void *)(a1 + 32)];
}

void __40__STIconCache_imageForBundleIdentifier___block_invoke_65(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _fetchImageForAppInfoIfNeeded:*(void *)(a1 + 32)];
}

- (void)_fetchImageForAppInfoIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STIconCache *)self lookupQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 bundleIdentifier];
  id v7 = [v4 artworkURL];
  id v8 = [(STIconCache *)self bundleIdentifiersWithPendingRequests];
  if (([v8 containsObject:v6] & 1) == 0 && v7)
  {
    [v8 addObject:v6];
    objc_initWeak(&location, self);
    uint64_t v9 = [(STIconCache *)self urlSession];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __45__STIconCache__fetchImageForAppInfoIfNeeded___block_invoke;
    v11[3] = &unk_26449B5E8;
    objc_copyWeak(&v13, &location);
    id v12 = v4;
    id v10 = [v9 dataTaskWithURL:v7 completionHandler:v11];

    [v10 resume];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __45__STIconCache__fetchImageForAppInfoIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = (id *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained _handleiTunesResponseForAppInfo:*(void *)(a1 + 32) response:v9 data:v10 error:v8];
}

- (void)_handleiTunesResponseForAppInfo:(id)a3 response:(id)a4 data:(id)a5 error:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(STIconCache *)self lookupQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = [v9 bundleIdentifier];
  id v14 = [(STIconCache *)self bundleIdentifiersWithPendingRequests];
  [v14 removeObject:v13];

  if (!v10 || v11)
  {
    v16 = [MEMORY[0x263F671D8] appInfo];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[STIconCache _handleiTunesResponseForAppInfo:response:data:error:completionHandler:]();
    }
  }
  else
  {
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v10];
    v16 = [NSString stringWithFormat:@"bundle-id.%@", v13];
    if (v15)
    {
      v17 = objc_msgSend(v15, "iconFromPrecomposedImage:platform:", 0, objc_msgSend(v9, "platform"));
    }
    else
    {
      id v18 = [MEMORY[0x263F671D8] appInfo];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[STIconCache _handleiTunesResponseForAppInfo:response:data:error:completionHandler:]();
      }

      v17 = [(STIconCache *)self imageForBlankApplicationIcon];
    }
    [(NSCache *)self->_iconByKeyCache setObject:v17 forKey:v16 cost:15];
    id v19 = [MEMORY[0x263F671D8] appInfo];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      _os_log_impl(&dword_21E199000, v19, OS_LOG_TYPE_INFO, "Added an icon for %@ to the cache", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__STIconCache__handleiTunesResponseForAppInfo_response_data_error___block_invoke;
    block[3] = &unk_26449B610;
    objc_copyWeak(&v24, (id *)buf);
    id v22 = v17;
    id v23 = v13;
    id v20 = v17;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
}

void __67__STIconCache__handleiTunesResponseForAppInfo_response_data_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateCacheWithImage:*(void *)(a1 + 32) bundleIdentifier:*(void *)(a1 + 40)];
}

- (id)imageForCategoryIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [NSString stringWithFormat:@"category.%@", v4];
  id v6 = [(NSCache *)self->_iconByKeyCache objectForKey:v5];
  if (!v6)
  {
    if ([v4 isEqualToString:*MEMORY[0x263F31828]])
    {
      id v7 = @"Games";
    }
    else if ([v4 isEqualToString:*MEMORY[0x263F31858]])
    {
      id v7 = @"SocialNetworking";
    }
    else if ([v4 isEqualToString:*MEMORY[0x263F31820]])
    {
      id v7 = @"Entertainment";
    }
    else if ([v4 isEqualToString:*MEMORY[0x263F31810]])
    {
      id v7 = @"Creativity";
    }
    else if ([v4 isEqualToString:*MEMORY[0x263F31840]])
    {
      id v7 = @"Productivity";
    }
    else if ([v4 isEqualToString:*MEMORY[0x263F31818]])
    {
      id v7 = @"Education";
    }
    else if ([v4 isEqualToString:*MEMORY[0x263F31848]])
    {
      id v7 = @"BooksNewsInformation";
    }
    else if ([v4 isEqualToString:*MEMORY[0x263F31830]])
    {
      id v7 = @"HealthFitness";
    }
    else if ([v4 isEqualToString:*MEMORY[0x263F31880]])
    {
      id v7 = @"Utilities";
    }
    else if ([v4 isEqualToString:*MEMORY[0x263F31850]])
    {
      id v7 = @"ShoppingAndFood";
    }
    else if ([v4 isEqualToString:*MEMORY[0x263F31878]])
    {
      id v7 = @"Travel";
    }
    else if ([v4 isEqualToString:*MEMORY[0x263F31838]])
    {
      id v7 = @"Other";
    }
    else if (([v4 isEqualToString:*MEMORY[0x263F673D8]] & 1) != 0 {
           || ([v4 isEqualToString:*MEMORY[0x263F673E8]] & 1) != 0
    }
           || ([v4 isEqualToString:*MEMORY[0x263F673E0]] & 1) != 0)
    {
      id v7 = @"AllApps";
    }
    else
    {
      if (![v4 isEqualToString:*MEMORY[0x263F673F0]])
      {
        id v6 = -[STIconCache blankSpaceImageWithSize:](self, "blankSpaceImageWithSize:", 29.0, 29.0);
        iconByKeyCache = self->_iconByKeyCache;
        id v11 = v6;
        id v12 = v5;
        uint64_t v13 = 0;
        goto LABEL_31;
      }
      id v7 = @"Websites";
    }
    id v8 = (void *)MEMORY[0x263F1C6B0];
    id v9 = +[STScreenTimeUIBundle bundle];
    id v6 = [v8 imageNamed:v7 inBundle:v9];

    iconByKeyCache = self->_iconByKeyCache;
    id v11 = v6;
    id v12 = v5;
    uint64_t v13 = 10;
LABEL_31:
    [(NSCache *)iconByKeyCache setObject:v11 forKey:v12 cost:v13];
  }

  return v6;
}

- (void)addObserver:(id)a3 selector:(SEL)a4 bundleIdentifier:(id)a5
{
  id v12 = a5;
  id v8 = (void *)MEMORY[0x263F08A00];
  id v9 = a3;
  id v10 = [v8 defaultCenter];
  id v11 = [NSString stringWithFormat:@"IconCacheDidUpdateApplicationImage-%@", v12];
  [v10 addObserver:v9 selector:a4 name:v11 object:self];
}

- (void)removeObserver:(id)a3 bundleIdentifier:(id)a4
{
  id v10 = a4;
  id v6 = (void *)MEMORY[0x263F08A00];
  id v7 = a3;
  id v8 = [v6 defaultCenter];
  id v9 = [NSString stringWithFormat:@"IconCacheDidUpdateApplicationImage-%@", v10];
  [v8 removeObserver:v7 name:v9 object:self];
}

- (id)blankSpaceImageWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = NSString;
  id v7 = NSStringFromSize(a3);
  id v8 = [v6 stringWithFormat:@"blank-image.%@", v7];

  id v9 = [(NSCache *)self->_iconByKeyCache objectForKey:v8];
  if (!v9)
  {
    id v9 = objc_msgSend(MEMORY[0x263F1C6B0], "blankSpaceImageWithSize:", width, height);
    [(NSCache *)self->_iconByKeyCache setObject:v9 forKey:v8 cost:0];
  }

  return v9;
}

- (void)_updateCacheWithImage:(id)a3 dsid:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[STIconCache _updateCacheWithImage:dsid:]();
  }
  id v8 = [NSString stringWithFormat:@"person-icon.%@", v6];
  [(NSCache *)self->_iconByKeyCache setObject:v7 forKey:v8 cost:15];
  v12[0] = @"STIconCacheUpdateDSIDKey";
  v12[1] = @"STIconCacheUpdateImageKey";
  v13[0] = v6;
  v13[1] = v7;
  id v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:@"STIconCacheDidUpdatePersonImageNotificationName" object:self userInfo:v9];

  id v11 = [MEMORY[0x263F08A00] defaultCenter];

  [v11 postNotificationName:@"STIconCacheDidUpdateNotificationName" object:self userInfo:0];
}

- (void)_updateCacheWithImage:(id)a3 bundleIdentifier:(id)a4
{
  v15[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v8 = [MEMORY[0x263F671D8] appInfo];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[STIconCache _updateCacheWithImage:bundleIdentifier:]();
  }

  id v9 = [NSString stringWithFormat:@"bundle-id.%@", v7];
  [(NSCache *)self->_iconByKeyCache setObject:v6 forKey:v9 cost:15];
  v14[0] = @"STIconCacheUpdateBundleIdentifierKey";
  v14[1] = @"STIconCacheUpdateImageKey";
  v15[0] = v7;
  v15[1] = v6;
  id v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  id v11 = [MEMORY[0x263F08A00] defaultCenter];
  id v12 = [NSString stringWithFormat:@"IconCacheDidUpdateApplicationImage-%@", v7];
  [v11 postNotificationName:v12 object:self userInfo:v10];

  uint64_t v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 postNotificationName:@"STIconCacheDidUpdateNotificationName" object:self userInfo:0];
}

- (id)circleImageWithFillColor:(id)a3 fillDiameter:(double)a4 outlineColor:(id)a5 outlineWidth:(double)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [NSString stringWithFormat:@"circle-image.%@-%f-%@-%f", v10, *(void *)&a4, v11, *(void *)&a6];
  id v13 = [(NSCache *)self->_iconByKeyCache objectForKey:v12];
  if (!v13)
  {
    id v13 = [(STIconCache *)self _newCircleImageWithFillColor:v10 fillDiameter:v11 outlineColor:a4 outlineWidth:a6];
    [(NSCache *)self->_iconByKeyCache setObject:v13 forKey:v12 cost:0];
  }

  return v13;
}

- (id)_newCircleImageWithFillColor:(id)a3 fillDiameter:(double)a4 outlineColor:(id)a5 outlineWidth:(double)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:", a4 + a6 * 2.0, a4 + a6 * 2.0);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __83__STIconCache__newCircleImageWithFillColor_fillDiameter_outlineColor_outlineWidth___block_invoke;
  v16[3] = &unk_26449B638;
  double v19 = a6;
  double v20 = a4;
  id v17 = v9;
  id v18 = v10;
  double v21 = a4 + a6 * 2.0;
  id v12 = v10;
  id v13 = v9;
  id v14 = [v11 imageWithActions:v16];

  return v14;
}

void __83__STIconCache__newCircleImageWithFillColor_fillDiameter_outlineColor_outlineWidth___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (CGContext *)[a2 CGContext];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[*(id *)(a1 + 32) CGColor]);
  v10.origin.x = *(CGFloat *)(a1 + 48);
  v10.size.double width = *(CGFloat *)(a1 + 56);
  v10.origin.y = v10.origin.x;
  v10.size.double height = v10.size.width;
  CGContextFillEllipseInRect(v3, v10);
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    CGContextSetStrokeColorWithColor(v3, (CGColorRef)[v4 CGColor]);
    CGContextSetLineWidth(v3, *(CGFloat *)(a1 + 48));
    double v5 = *(double *)(a1 + 48) * 0.5;
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = 0;
    uint64_t v8 = v6;
    CGContextStrokeEllipseInRect(v3, *(CGRect *)&v5);
  }
}

- (id)roundedImageForImageWithName:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  uint64_t v6 = [v4 stringWithFormat:@"rounded-image.%@", v5];
  uint64_t v7 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v7 imageNamed:v5 inBundle:v8];

  CGRect v10 = [v9 iconFromPrecomposedImage:1 platform:2];
  [(NSCache *)self->_iconByKeyCache setObject:v10 forKey:v6 cost:10];

  return v10;
}

- (id)personImageWithDSID:(id)a3 fullName:(id)a4
{
  return [(STIconCache *)self _personImageWithDSID:a3 fullName:a4 appleID:0 forceFetch:0 completionHandler:0];
}

- (void)fetchPersonImageWithDSID:(id)a3 fullName:(id)a4 appleID:(id)a5 forceFetch:(BOOL)a6 completionHandler:(id)a7
{
  id v7 = [(STIconCache *)self _personImageWithDSID:a3 fullName:a4 appleID:a5 forceFetch:a6 completionHandler:a7];
}

- (id)_personImageWithDSID:(id)a3 fullName:(id)a4 appleID:(id)a5 forceFetch:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = (void (**)(id, uint64_t))a7;
  v16 = [NSString stringWithFormat:@"person-icon.%@", v12];
  uint64_t v17 = [(NSCache *)self->_iconByKeyCache objectForKey:v16];
  if (!v17)
  {
    double v19 = [NSString stringWithFormat:@"monogram-icon.%@", v13];
    id v18 = [(NSCache *)self->_iconByKeyCache objectForKey:v19];
    if (!v18)
    {
      double v20 = [(STIconCache *)self personNameComponentsFormatter];
      double v21 = [v20 personNameComponentsFromString:v13];

      id v18 = [(STIconCache *)self monogramImageForNameComponents:v21];
      [(NSCache *)self->_iconByKeyCache setObject:v18 forKey:v19 cost:5];
    }
    goto LABEL_9;
  }
  id v18 = (id)v17;
  if (v15) {
    v15[2](v15, v17);
  }
  if (v8)
  {
LABEL_9:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[STIconCache _personImageWithDSID:fullName:appleID:forceFetch:completionHandler:]();
    }
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __82__STIconCache__personImageWithDSID_fullName_appleID_forceFetch_completionHandler___block_invoke;
    v23[3] = &unk_26449B660;
    BOOL v26 = v15 != 0;
    int v25 = v15;
    id v18 = v18;
    id v24 = v18;
    [(STIconCache *)self _fetchFamilyPhotoWithDSID:v12 fullName:v13 appleID:v14 completionHandler:v23];
  }

  return v18;
}

uint64_t __82__STIconCache__personImageWithDSID_fullName_appleID_forceFetch_completionHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(result + 48))
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)(result + 40);
    if (!a2) {
      a2 = *(void *)(v2 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  }
  return result;
}

- (void)_fetchFamilyPhotoWithDSID:(id)a3 fullName:(id)a4 appleID:(id)a5 completionHandler:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  CGRect v10 = (void *)[objc_alloc(MEMORY[0x263F3BF58]) initWithFamilyMemberDSID:v8 size:1 localFallback:1];
  [v10 setMonogramDiameter:40.0];
  [v10 setBackgroundType:1];
  [v10 setUseMonogramAsLastResort:0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76__STIconCache__fetchFamilyPhotoWithDSID_fullName_appleID_completionHandler___block_invoke;
  void v13[3] = &unk_26449B6D8;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 startRequestWithCompletionHandler:v13];
}

void __76__STIconCache__fetchFamilyPhotoWithDSID_fullName_appleID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138478083;
      uint64_t v31 = v8;
      __int16 v32 = 2112;
      id v33 = v7;
      id v9 = &_os_log_internal;
      CGRect v10 = "failed to retrieve image for %{private}@: %@";
      uint32_t v11 = 22;
LABEL_16:
      _os_log_impl(&dword_21E199000, v9, OS_LOG_TYPE_INFO, v10, buf, v11);
    }
LABEL_17:
    id v13 = 0;
    goto LABEL_18;
  }
  if (!v6)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      goto LABEL_17;
    }
    uint64_t v18 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138477827;
    uint64_t v31 = v18;
    id v9 = &_os_log_internal;
    CGRect v10 = "there was no image for %{private}@";
LABEL_15:
    uint32_t v11 = 12;
    goto LABEL_16;
  }
  id v12 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v6];
  if (!v12)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      goto LABEL_17;
    }
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138477827;
    uint64_t v31 = v19;
    id v9 = &_os_log_internal;
    CGRect v10 = "unable to deserialize the image for %{private}@";
    goto LABEL_15;
  }
  id v13 = v12;
  [v12 size];
  if (v15 != 40.0 || v14 != 40.0)
  {
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:", 40.0, 40.0);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __76__STIconCache__fetchFamilyPhotoWithDSID_fullName_appleID_completionHandler___block_invoke_133;
    v28[3] = &unk_26449B688;
    id v29 = v13;
    id v13 = [v17 imageWithActions:v28];
  }
LABEL_18:
  double v20 = [MEMORY[0x263F08A48] mainQueue];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __76__STIconCache__fetchFamilyPhotoWithDSID_fullName_appleID_completionHandler___block_invoke_2;
  v24[3] = &unk_26449B6B0;
  id v25 = v13;
  int8x16_t v23 = *(int8x16_t *)(a1 + 32);
  id v21 = (id)v23.i64[0];
  int8x16_t v26 = vextq_s8(v23, v23, 8uLL);
  id v27 = *(id *)(a1 + 48);
  id v22 = v13;
  [v20 addOperationWithBlock:v24];
}

uint64_t __76__STIconCache__fetchFamilyPhotoWithDSID_fullName_appleID_completionHandler___block_invoke_133(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, 40.0, 40.0);
}

uint64_t __76__STIconCache__fetchFamilyPhotoWithDSID_fullName_appleID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    [*(id *)(a1 + 40) _updateCacheWithImage:v2 dsid:*(void *)(a1 + 48)];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v3();
}

- (CNMonogrammer)monogrammer
{
  monogrammer = self->_monogrammer;
  if (!monogrammer)
  {
    id v4 = (CNMonogrammer *)[objc_alloc(MEMORY[0x263EFEC20]) initWithStyle:0 diameter:40.0];
    id v5 = self->_monogrammer;
    self->_monogrammer = v4;

    monogrammer = self->_monogrammer;
  }
  id v6 = monogrammer;

  return v6;
}

- (NSPersonNameComponentsFormatter)personNameComponentsFormatter
{
  personNameComponentsFormatter = self->_personNameComponentsFormatter;
  if (!personNameComponentsFormatter)
  {
    id v4 = (NSPersonNameComponentsFormatter *)objc_opt_new();
    id v5 = self->_personNameComponentsFormatter;
    self->_personNameComponentsFormatter = v4;

    [(NSPersonNameComponentsFormatter *)self->_personNameComponentsFormatter set_ignoresFallbacks:1];
    [(NSPersonNameComponentsFormatter *)self->_personNameComponentsFormatter setStyle:4];
    personNameComponentsFormatter = self->_personNameComponentsFormatter;
  }
  id v6 = personNameComponentsFormatter;

  return v6;
}

- (id)monogramImageForNameComponents:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(STIconCache *)self personNameComponentsFormatter];
    id v6 = [v5 stringFromPersonNameComponents:v4];
  }
  else
  {
    id v6 = 0;
  }
  if ([v6 length])
  {
    id v7 = [NSString stringWithFormat:@"monogram-icon.%@", v6];
    uint64_t v8 = [(NSCache *)self->_iconByKeyCache objectForKey:v7];
    if (!v8)
    {
      id v9 = [(STIconCache *)self monogrammer];
      CGRect v10 = [v4 givenName];
      uint32_t v11 = [v4 familyName];
      id v12 = [v9 monogramForPersonWithFirstName:v10 lastName:v11];
      id v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        double v15 = [(STIconCache *)self monogrammer];
        id v14 = [v15 silhouetteMonogram];
      }
      [(NSCache *)self->_iconByKeyCache setObject:v14 forKey:v7 cost:5];
      goto LABEL_12;
    }
  }
  else
  {
    id v7 = [(STIconCache *)self monogrammer];
    uint64_t v8 = [v7 silhouetteMonogram];
  }
  id v14 = (id)v8;
LABEL_12:

  return v14;
}

- (id)monogramImageForInitial:(id)a3 useDarkColors:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 length])
  {
    id v7 = @"light";
    if (v4) {
      id v7 = @"dark";
    }
    uint64_t v8 = [NSString stringWithFormat:@"monogram-icon.%@.%@", v6, v7];
    if (v8)
    {
      uint64_t v9 = [(NSCache *)self->_iconByKeyCache objectForKey:v8];
      if (v9)
      {
        CGRect v10 = (void *)v9;
LABEL_12:

        goto LABEL_16;
      }
    }
    if (v4) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 2;
    }
    id v12 = (void *)[objc_alloc(MEMORY[0x263EFEC20]) initWithStyle:v11 diameter:29.0];
    uint64_t v13 = [v12 monogramForPersonWithFirstName:v6 lastName:&stru_26CF0D240];
    if (v13)
    {
      CGRect v10 = (void *)v13;
      [(NSCache *)self->_iconByKeyCache setObject:v13 forKey:v8 cost:5];

      goto LABEL_12;
    }
  }
  CGRect v10 = [(STIconCache *)self imageForBlankApplicationIcon];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[STIconCache monogramImageForInitial:useDarkColors:]();
  }
LABEL_16:

  return v10;
}

- (void)setMonogrammer:(id)a3
{
}

- (void)setPersonNameComponentsFormatter:(id)a3
{
}

- (OS_dispatch_queue)lookupQueue
{
  return self->_lookupQueue;
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (NSMutableSet)bundleIdentifiersWithPendingRequests
{
  return self->_bundleIdentifiersWithPendingRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiersWithPendingRequests, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_lookupQueue, 0);
  objc_storeStrong((id *)&self->_personNameComponentsFormatter, 0);
  objc_storeStrong((id *)&self->_monogrammer, 0);

  objc_storeStrong((id *)&self->_iconByKeyCache, 0);
}

- (void)imageForBundleIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "STIconCache failed to get icon from launch services for app %@ ; using blank image",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)imageForBundleIdentifier:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "STIconCache found no artworkURL for App Store app %@ ; using blank image",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)imageForBundleIdentifier:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "STIconCache failed to get icon for synced app %@ ; using blank image",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)imageForBundleIdentifier:completionHandler:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "STIconCache failed to get icon from artworkData for synced app %@", v2, v3, v4, v5, v6);
}

- (void)_handleiTunesResponseForAppInfo:response:data:error:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21E199000, v0, v1, "Artwork lookup of %@ from store failed: %{public}@");
}

- (void)_handleiTunesResponseForAppInfo:response:data:error:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "Artwork lookup of %@ from store failed", v2, v3, v4, v5, v6);
}

- (void)_updateCacheWithImage:dsid:.cold.1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_21E199000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "successfully retrieved image for %{private}@", v0, 0xCu);
}

- (void)_updateCacheWithImage:bundleIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_21E199000, v0, OS_LOG_TYPE_DEBUG, "successfully retrieved image for %{public}@", v1, 0xCu);
}

- (void)_personImageWithDSID:fullName:appleID:forceFetch:completionHandler:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  __int16 v2 = 2113;
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_21E199000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "no entry for %{private}@ (%{private}@), queueing one up", v1, 0x16u);
}

- (void)monogramImageForInitial:useDarkColors:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, &_os_log_internal, v0, "Failed to provide monogram for initial: %@. Returning blank icon.", v1, v2, v3, v4, v5);
}

@end