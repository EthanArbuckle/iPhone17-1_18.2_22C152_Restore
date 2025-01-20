@interface PSUIAppInstallController
+ (id)iconLocalCacheURLFromKey:(id)a3;
+ (id)loadIconFromURL:(id)a3 session:(id)a4;
+ (id)lookupAppDescriptionForInstalledApp:(id)a3;
+ (id)tryLoadAppDescriptionFromCacheForBundleId:(id)a3;
+ (void)lookupAppFromStore:(id)a3 completionHandler:(id)a4;
+ (void)saveAppDescriptionToCache:(id)a3;
- (BOOL)moreAppsAvailable;
- (BOOL)overrideLocalAppDescription;
- (NSString)appID;
- (NSString)bundleID;
- (NSURL)installURL;
- (NSURL)moreAppsURL;
- (NSURL)openAppURL;
- (PSUIAppDescription)appDescription;
- (PSUIAppInstallController)initWithAppID:(id)a3 carrierMoreAppsURL:(id)a4;
- (PSUIAppInstallController)initWithBundleID:(id)a3;
- (PSUIAppInstallController)initWithBundleIDAndOpenAppURL:(id)a3 openAppURL:(id)a4;
- (id)getLogger;
- (id)loadTextForPublisher:(id)a3;
- (id)loadingCompletionBlock;
- (id)specifierWithDescriptionParameters:(id)a3 completion:(id)a4;
- (id)tryLoadSubTitleForBundleId:(id)a3;
- (int)installState;
- (void)installButtonTapped:(id)a3;
- (void)load;
- (void)moreAppsButtonTapped:(id)a3;
- (void)setAppDescription:(id)a3;
- (void)setInstallURL:(id)a3;
- (void)setLoadingCompletionBlock:(id)a3;
- (void)setMoreAppsURL:(id)a3;
- (void)setOpenAppURL:(id)a3;
- (void)setOverrideLocalAppDescription:(BOOL)a3;
@end

@implementation PSUIAppInstallController

- (PSUIAppInstallController)initWithAppID:(id)a3 carrierMoreAppsURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 componentsSeparatedByString:@"."];
  v10 = (void *)[v9 mutableCopy];

  if ([v10 count])
  {
    [v10 removeObjectAtIndex:0];
    v11 = [v10 componentsJoinedByString:@"."];
  }
  else
  {
    v11 = 0;
  }
  objc_storeStrong((id *)&self->_appID, a3);
  v12 = [NSURL URLWithString:v8];

  v13 = [v12 scheme];
  if ([v13 isEqualToString:@"http"])
  {
    v14 = v12;
    moreAppsURL = self->_moreAppsURL;
    self->_moreAppsURL = v14;
  }
  else
  {
    moreAppsURL = [v12 scheme];
    if ([moreAppsURL isEqualToString:@"https"]) {
      v16 = v12;
    }
    else {
      v16 = 0;
    }
    v17 = self->_moreAppsURL;
    self->_moreAppsURL = v16;
  }
  v18 = [(PSUIAppInstallController *)self initWithBundleID:v11];

  return v18;
}

- (PSUIAppInstallController)initWithBundleIDAndOpenAppURL:(id)a3 openAppURL:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = [NSURL URLWithString:a4];
    openAppURL = self->_openAppURL;
    self->_openAppURL = v7;
  }
  v9 = [(PSUIAppInstallController *)self initWithBundleID:v6];

  return v9;
}

- (PSUIAppInstallController)initWithBundleID:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PSUIAppInstallController;
  id v6 = [(PSUIAppInstallController *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleID, a3);
    v7->_overrideLocalAppDescription = 1;
    id v8 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    [v8 setTimeoutIntervalForRequest:4.0];
    [v8 setTimeoutIntervalForResource:4.0];
    uint64_t v9 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v8];
    session = v7->_session;
    v7->_session = (NSURLSession *)v9;
  }
  return v7;
}

- (void)setOverrideLocalAppDescription:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_overrideLocalAppDescription = a3;
  objc_sync_exit(obj);
}

- (void)load
{
  v3 = self->_bundleID;
  v4 = [(id)objc_opt_class() lookupAppDescriptionForInstalledApp:v3];
  id v5 = self;
  objc_sync_enter(v5);
  p_appDescription = (id *)&v5->_appDescription;
  if (v5->_appDescription && v5->_installState == (v4 != 0))
  {
LABEL_7:
    objc_sync_exit(v5);

    goto LABEL_11;
  }
  objc_sync_exit(v5);

  if (v4)
  {
    id v5 = v5;
    objc_sync_enter(v5);
    if (v5->_overrideLocalAppDescription) {
      objc_storeStrong(p_appDescription, v4);
    }
    v5->_installState = 1;
    goto LABEL_7;
  }
  id v7 = [(PSUIAppInstallController *)v5 getLogger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Attempt to load from app store", buf, 2u);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, v5);
  id v8 = objc_opt_class();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __32__PSUIAppInstallController_load__block_invoke;
  v9[3] = &unk_2645E0F98;
  v9[4] = v5;
  objc_copyWeak(&v10, (id *)buf);
  [v8 lookupAppFromStore:v3 completionHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
LABEL_11:
}

void __32__PSUIAppInstallController_load__block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  if (v15)
  {
    v4 = objc_opt_class();
    id v5 = [v15 iconURL];
    id v6 = [v4 loadIconFromURL:v5 session:*(void *)(*(void *)(a1 + 32) + 8)];
    [v15 setIcon:v6];

    id v7 = *(id *)(a1 + 32);
    objc_sync_enter(v7);
    *(_DWORD *)(*(void *)(a1 + 32) + 20) = 0;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a2);
    uint64_t v8 = [v15 installURL];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 48);
    *(void *)(v9 + 48) = v8;

    [(id)objc_opt_class() saveAppDescriptionToCache:*(void *)(*(void *)(a1 + 32) + 40)];
    objc_sync_exit(v7);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v12 = WeakRetained;
  if (WeakRetained)
  {
    v13 = [WeakRetained loadingCompletionBlock];

    if (v13)
    {
      v14 = [v12 loadingCompletionBlock];
      ((void (**)(void, BOOL))v14)[2](v14, v15 != 0);
    }
  }
}

+ (id)lookupAppDescriptionForInstalledApp:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  v4 = [MEMORY[0x263F67EB0] loggerWithCategory:@"AppInstallController"];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "+[PSUIAppInstallController lookupAppDescriptionForInstalledApp:]";
    __int16 v27 = 2112;
    id v28 = v3;
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "%s requesting launch services bundle enumeration for %@", buf, 0x16u);
  }

  id v5 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __64__PSUIAppInstallController_lookupAppDescriptionForInstalledApp___block_invoke;
  v16 = &unk_2645E0FC0;
  id v6 = v3;
  id v17 = v6;
  v18 = &v19;
  [v5 enumerateBundlesOfType:1 block:&v13];

  if (v20[5])
  {
    id v7 = objc_alloc_init(PSUIAppDescription);
    uint64_t v8 = objc_msgSend((id)v20[5], "localizedNameForContext:", 0, v13, v14, v15, v16);
    [(PSUIAppDescription *)v7 setName:v8];

    uint64_t v9 = [(id)v20[5] vendorName];
    [(PSUIAppDescription *)v7 setPublisher:v9];

    [(PSUIAppDescription *)v7 setBundleID:v6];
    id v10 = (void *)MEMORY[0x263F827E8];
    ScreenScale();
    v11 = objc_msgSend(v10, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 2);
    [(PSUIAppDescription *)v7 setIcon:v11];
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x263F67EB0], "loggerWithCategory:", @"AppInstallController", v13, v14, v15, v16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "+[PSUIAppInstallController lookupAppDescriptionForInstalledApp:]";
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_221B17000, v11, OS_LOG_TYPE_DEFAULT, "%s failed to retrieve bundle enumeration for %@", buf, 0x16u);
    }
    id v7 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return v7;
}

void __64__PSUIAppInstallController_lookupAppDescriptionForInstalledApp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 bundleIdentifier];
    int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263F67EB0] loggerWithCategory:@"AppInstallController"];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v10 = 136315394;
        v11 = "+[PSUIAppInstallController lookupAppDescriptionForInstalledApp:]_block_invoke";
        __int16 v12 = 2112;
        uint64_t v13 = v9;
        _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "%s successfully retrieved bundle enumeration for %@", (uint8_t *)&v10, 0x16u);
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
  }
}

+ (void)lookupAppFromStore:(id)a3 completionHandler:(id)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  int v7 = (void *)MEMORY[0x263F27B28];
  uint64_t v8 = [MEMORY[0x263F27D18] bagSubProfile];
  uint64_t v9 = [MEMORY[0x263F27D18] bagSubProfileVersion];
  int v10 = [v7 bagForProfile:v8 profileVersion:v9];

  v11 = (void *)[objc_alloc(MEMORY[0x263F27D18]) initWithType:0 clientIdentifier:@"com.apple.telephony.CellularSettings" clientVersion:@"1" bag:v10];
  v24[0] = v5;
  __int16 v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  [v11 setBundleIdentifiers:v12];

  uint64_t v13 = [MEMORY[0x263F67EB0] loggerWithCategory:@"AppInstallController"];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = "+[PSUIAppInstallController lookupAppFromStore:completionHandler:]";
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEFAULT, "%s requesting store info for %@", buf, 0x16u);
  }

  uint64_t v14 = [v11 perform];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__PSUIAppInstallController_lookupAppFromStore_completionHandler___block_invoke;
  v17[3] = &unk_2645E0FE8;
  id v18 = v5;
  id v19 = v6;
  id v15 = v6;
  id v16 = v5;
  [v14 addFinishBlock:v17];
}

void __65__PSUIAppInstallController_lookupAppFromStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = [MEMORY[0x263F67EB0] loggerWithCategory:@"AppInstallController"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v14 = 136315650;
      id v15 = "+[PSUIAppInstallController lookupAppFromStore:completionHandler:]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%s failed to retrieve store info for %@ (error = %@)", (uint8_t *)&v14, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = [a2 responseDataItems];
    if ([v8 count])
    {
      uint64_t v9 = [PSUIAppDescription alloc];
      int v10 = [v8 firstObject];
      v11 = [(PSUIAppDescription *)v9 initWithAMSMediaResponseDictionary:v10];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      __int16 v12 = [MEMORY[0x263F67EB0] loggerWithCategory:@"AppInstallController"];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v14 = 136315394;
        id v15 = "+[PSUIAppInstallController lookupAppFromStore:completionHandler:]_block_invoke";
        __int16 v16 = 2112;
        uint64_t v17 = v13;
        _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, "%s failed to retrieve store info for %@ (No error, but no items returned.)", (uint8_t *)&v14, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

+ (id)loadIconFromURL:(id)a3 session:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v8 = [MEMORY[0x263F08BD8] requestWithURL:v5 cachePolicy:2 timeoutInterval:20.0];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy__0;
  id v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__PSUIAppInstallController_loadIconFromURL_session___block_invoke;
  v15[3] = &unk_2645E1010;
  id v9 = v5;
  id v16 = v9;
  __int16 v18 = &v19;
  int v10 = v7;
  uint64_t v17 = v10;
  v11 = [v6 dataTaskWithRequest:v8 completionHandler:v15];
  __int16 v12 = [MEMORY[0x263F67EB0] loggerWithCategory:@"AppInstallController"];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "+[PSUIAppInstallController loadIconFromURL:session:]";
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, "%s requesting app icon from %@", buf, 0x16u);
  }

  [v11 resume];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __52__PSUIAppInstallController_loadIconFromURL_session___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F67EB0] loggerWithCategory:@"AppInstallController"];
  id v9 = v8;
  if (!v6 || v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = 136315650;
      __int16 v18 = "+[PSUIAppInstallController loadIconFromURL:session:]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_error_impl(&dword_221B17000, v9, OS_LOG_TYPE_ERROR, "%s failed to retrieve app icon from %@ (error = %@)", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v17 = 136315394;
      __int16 v18 = "+[PSUIAppInstallController loadIconFromURL:session:]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      _os_log_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEFAULT, "%s successfully retrieved app icon from %@", (uint8_t *)&v17, 0x16u);
    }

    v11 = (void *)MEMORY[0x263F827E8];
    id v9 = [MEMORY[0x263F82B60] mainScreen];
    [v9 scale];
    __int16 v12 = objc_msgSend(v11, "imageWithData:scale:", v6);
    uint64_t v13 = [v12 _applicationIconImageForFormat:2 precomposed:0];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)iconLocalCacheURLFromKey:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  id v6 = [v5 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:0];

  id v7 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v8 = [v7 bundleIdentifier];
  id v9 = [v6 URLByAppendingPathComponent:v8];

  uint64_t v10 = [NSString stringWithFormat:@"CarrierAppIcon-%@", v4];

  v11 = [v9 URLByAppendingPathComponent:v10];

  return v11;
}

+ (void)saveAppDescriptionToCache:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  if (v4 && ([v4 bundleID], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    id v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v8 = [v4 bundleID];
    id v9 = [v8 stringByAppendingString:@"_AppDescription"];

    uint64_t v10 = [v7 dictionaryForKey:v9];
    v11 = [MEMORY[0x263F08C38] UUID];
    __int16 v12 = [v11 UUIDString];

    if (v10)
    {
      uint64_t v13 = [v10 objectForKey:@"AppIconFilenameKey"];

      if (v13)
      {
        uint64_t v14 = objc_opt_class();
        id v15 = [v7 stringForKey:@"AppIconFilenameKey"];
        uint64_t v16 = [v14 iconLocalCacheURLFromKey:v15];

        int v17 = [MEMORY[0x263F08850] defaultManager];
        [v17 removeItemAtURL:v16 error:0];
      }
    }
    __int16 v18 = [(id)objc_opt_class() iconLocalCacheURLFromKey:v12];
    __int16 v19 = [v4 icon];
    uint64_t v20 = UIImagePNGRepresentation(v19);
    [v20 writeToURL:v18 atomically:1];

    id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v22 = [v4 name];

    if (v22)
    {
      uint64_t v23 = [v4 name];
      [v21 setObject:v23 forKeyedSubscript:@"AppNameKey"];
    }
    id v24 = [v4 publisher];

    if (v24)
    {
      v25 = [v4 publisher];
      [v21 setObject:v25 forKeyedSubscript:@"AppPublisherKey"];
    }
    v26 = [v4 bundleID];

    if (v26)
    {
      __int16 v27 = [v4 bundleID];
      [v21 setObject:v27 forKeyedSubscript:@"AppBundleIDKey"];
    }
    if (v12) {
      [v21 setObject:v12 forKeyedSubscript:@"AppIconFilenameKey"];
    }
    id v28 = [v4 subtitle];

    if (v28)
    {
      uint64_t v29 = [v4 subtitle];
      [v21 setObject:v29 forKeyedSubscript:@"AppSubtitleKey"];
    }
    [v7 setObject:v21 forKey:v9];
    v30 = [MEMORY[0x263F67EB0] loggerWithCategory:@"AppInstallController"];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315906;
      v32 = "+[PSUIAppInstallController saveAppDescriptionToCache:]";
      __int16 v33 = 2112;
      v34 = v9;
      __int16 v35 = 2112;
      id v36 = v21;
      __int16 v37 = 2112;
      v38 = v18;
      _os_log_impl(&dword_221B17000, v30, OS_LOG_TYPE_DEFAULT, "%s writing to cache, %@: %@, icon filename: %@", (uint8_t *)&v31, 0x2Au);
    }
  }
  else
  {
    id v7 = [MEMORY[0x263F67EB0] loggerWithCategory:@"AppInstallController"];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v31) = 0;
      _os_log_error_impl(&dword_221B17000, v7, OS_LOG_TYPE_ERROR, "Null description!!", (uint8_t *)&v31, 2u);
    }
  }

  objc_sync_exit(v5);
}

+ (id)tryLoadAppDescriptionFromCacheForBundleId:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = (PSUIAppDescription *)a3;
  id v5 = a1;
  objc_sync_enter(v5);
  id v28 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v6 = [(PSUIAppDescription *)v4 stringByAppendingString:@"_AppDescription"];
  id v7 = [v28 dictionaryForKey:v6];
  if (v7)
  {
    uint64_t v8 = objc_alloc_init(PSUIAppDescription);
    id v9 = [v7 objectForKey:@"AppNameKey"];
    [(PSUIAppDescription *)v8 setName:v9];

    uint64_t v10 = [v7 objectForKey:@"AppPublisherKey"];
    [(PSUIAppDescription *)v8 setPublisher:v10];

    v11 = [v7 objectForKey:@"AppBundleIDKey"];
    [(PSUIAppDescription *)v8 setBundleID:v11];

    __int16 v12 = [v7 objectForKey:@"AppIconFilenameKey"];
    if (v12)
    {
      uint64_t v13 = [MEMORY[0x263F67EB0] loggerWithCategory:@"AppInstallController"];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [(id)objc_opt_class() iconLocalCacheURLFromKey:v12];
        id v15 = [v14 path];
        *(_DWORD *)buf = 136315650;
        v30 = "+[PSUIAppInstallController tryLoadAppDescriptionFromCacheForBundleId:]";
        __int16 v31 = 2112;
        v32 = v8;
        __int16 v33 = 2112;
        v34 = v15;
        _os_log_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEFAULT, "%s reading from cache, app description: %@, icon filename: %@", buf, 0x20u);
      }
      uint64_t v16 = (void *)MEMORY[0x263F827E8];
      int v17 = [(id)objc_opt_class() iconLocalCacheURLFromKey:v12];
      __int16 v18 = [v17 path];
      __int16 v19 = [v16 imageWithContentsOfFile:v18];
      uint64_t v20 = [v19 _applicationIconImageForFormat:2 precomposed:0];
      [(PSUIAppDescription *)v8 setIcon:v20];

      id v21 = [v7 objectForKey:@"AppSubtitleKey"];
      [(PSUIAppDescription *)v8 setSubtitle:v21];

      id v22 = [(PSUIAppDescription *)v8 name];
      if (!v22) {
        goto LABEL_16;
      }
      uint64_t v23 = [(PSUIAppDescription *)v8 publisher];
      if (v23)
      {
        id v24 = [(PSUIAppDescription *)v8 bundleID];
        if (v24)
        {
          v25 = [(PSUIAppDescription *)v8 icon];
          BOOL v26 = v25 == 0;

          if (!v26)
          {
            id v22 = v8;
LABEL_16:

            goto LABEL_17;
          }
        }
        else
        {
        }
      }
      else
      {
      }
    }
    id v22 = 0;
    goto LABEL_16;
  }
  uint64_t v8 = [MEMORY[0x263F67EB0] loggerWithCategory:@"AppInstallController"];
  if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "+[PSUIAppInstallController tryLoadAppDescriptionFromCacheForBundleId:]";
    __int16 v31 = 2112;
    v32 = v4;
    _os_log_impl(&dword_221B17000, &v8->super, OS_LOG_TYPE_DEFAULT, "%s could not find info from cache for bundleid: %@", buf, 0x16u);
  }
  id v22 = 0;
LABEL_17:

  objc_sync_exit(v5);
  return v22;
}

- (void)installButtonTapped:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  int installState = v5->_installState;
  id v7 = v5->_appDescription;
  uint64_t v8 = v5->_installURL;
  objc_sync_exit(v5);

  BOOL v9 = installState == 1;
  uint64_t v10 = [(PSUIAppInstallController *)v5 getLogger];
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[PSUIAppInstallController installButtonTapped:]";
      _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "%s Open button pressed", (uint8_t *)&buf, 0xCu);
    }

    PSAnalyticsSendEvent(@"com.apple.Preferences.CarrierSpaceServicesAppOpenEvent");
    id v12 = [(PSUIAppDescription *)v7 bundleID];

    if (!MobileStoreUILibraryCore())
    {
      uint64_t v20 = [(PSUIAppInstallController *)v5 getLogger];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_221B17000, v20, OS_LOG_TYPE_ERROR, "MobileStoreUI Framework unavailable. Not sending app launch metric.", (uint8_t *)&buf, 2u);
      }

      goto LABEL_22;
    }
    if (v5->_openAppURL)
    {
      uint64_t v13 = [(PSUIAppInstallController *)v5 getLogger];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [(NSURL *)v5->_openAppURL absoluteString];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEFAULT, "Launch app with URL: %@", (uint8_t *)&buf, 0xCu);
      }
      openAppURL = v5->_openAppURL;
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x2020000000;
      uint64_t v16 = off_26AC32298;
      __int16 v27 = off_26AC32298;
      if (!off_26AC32298)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v29 = __getSUUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptionsSymbolLoc_block_invoke;
        v30 = &unk_2645E0D98;
        __int16 v31 = &v24;
        int v17 = (void *)MobileStoreUILibrary();
        __int16 v18 = dlsym(v17, "SUUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptions");
        *(void *)(v31[1] + 24) = v18;
        off_26AC32298 = *(_UNKNOWN **)(v31[1] + 24);
        uint64_t v16 = (void *)v25[3];
      }
      _Block_object_dispose(&v24, 8);
      if (v16)
      {
        ((void (*)(id, NSURL *, void, void, void))v16)(v12, openAppURL, 0, 0, 0);
LABEL_22:
        CFRelease(v12);
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x2020000000;
      id v21 = (void (*)(id, void))off_26AC32290;
      __int16 v27 = off_26AC32290;
      if (!off_26AC32290)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v29 = __getSUUIMetricsLaunchApplicationWithIdentifierSymbolLoc_block_invoke;
        v30 = &unk_2645E0D98;
        __int16 v31 = &v24;
        id v22 = (void *)MobileStoreUILibrary();
        uint64_t v23 = dlsym(v22, "SUUIMetricsLaunchApplicationWithIdentifier");
        *(void *)(v31[1] + 24) = v23;
        off_26AC32290 = *(_UNKNOWN **)(v31[1] + 24);
        id v21 = (void (*)(id, void))v25[3];
      }
      _Block_object_dispose(&v24, 8);
      if (v21)
      {
        v21(v12, 0);
        goto LABEL_22;
      }
    }
    dlerror();
    abort_report_np();
    __break(1u);
  }
  if (v11)
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[PSUIAppInstallController installButtonTapped:]";
    _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "%s Install button pressed", (uint8_t *)&buf, 0xCu);
  }

  PSAnalyticsSendEvent(@"com.apple.Preferences.CarrierSpaceServicesAppInstallEvent");
  __int16 v19 = [MEMORY[0x263F82438] sharedApplication];
  [v19 openURL:v8 options:MEMORY[0x263EFFA78] completionHandler:0];

LABEL_23:
}

- (BOOL)moreAppsAvailable
{
  return self->_moreAppsURL != 0;
}

- (void)moreAppsButtonTapped:(id)a3
{
  objc_msgSend(MEMORY[0x263F82438], "sharedApplication", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 openURL:self->_moreAppsURL options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (id)specifierWithDescriptionParameters:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(PSUIAppInstallController *)self setLoadingCompletionBlock:a4];
  [(PSUIAppInstallController *)self load];
  id v7 = self->_appDescription;
  if (v7)
  {
    if (!v6)
    {
LABEL_23:
      [(PSUIAppDescription *)v7 setInstalled:self->_installState == 1];
      __int16 v19 = +[PSUIAppInstallCell specifierForAppWithDescription:v7 target:self action:sel_installButtonTapped_];
      goto LABEL_24;
    }
LABEL_3:
    uint64_t v8 = [(PSUIAppInstallController *)self getLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Update description with override text", (uint8_t *)&v25, 2u);
    }

    BOOL v9 = [v6 publisher];
    int v10 = [v9 isEqualToString:&stru_26D410CA0];

    if (v10)
    {
      uint64_t v11 = [(PSUIAppInstallController *)self loadTextForPublisher:v7];
    }
    else
    {
      uint64_t v20 = [v6 publisher];

      if (!v20) {
        goto LABEL_21;
      }
      uint64_t v11 = [v6 publisher];
    }
    id v21 = (void *)v11;
    [(PSUIAppDescription *)v7 setPublisher:v11];

LABEL_21:
    id v22 = [v6 installedLabel];

    if (v22)
    {
      uint64_t v23 = [v6 installedLabel];
      [(PSUIAppDescription *)v7 setInstalledLabel:v23];
    }
    goto LABEL_23;
  }
  id v12 = self->_bundleID;
  uint64_t v13 = [(PSUIAppInstallController *)self getLogger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEFAULT, "App description not yet loaded from app store, attempt to load from cache.", (uint8_t *)&v25, 2u);
  }

  uint64_t v14 = [(id)objc_opt_class() tryLoadAppDescriptionFromCacheForBundleId:v12];
  id v7 = v14;
  if (v14)
  {
    id v15 = [(PSUIAppDescription *)v14 bundleID];
    int v16 = [v15 isEqualToString:self->_bundleID];

    if (v16)
    {
      int v17 = [(PSUIAppInstallController *)self getLogger];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138412290;
        uint64_t v26 = v7;
        _os_log_impl(&dword_221B17000, v17, OS_LOG_TYPE_DEFAULT, "App description found in cache; using cached description: %@",
          (uint8_t *)&v25,
          0xCu);
      }

      if (!v6) {
        goto LABEL_23;
      }
      goto LABEL_3;
    }
  }
  __int16 v18 = [(PSUIAppInstallController *)self getLogger];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_221B17000, v18, OS_LOG_TYPE_DEFAULT, "Failed to find app description in cache.", (uint8_t *)&v25, 2u);
  }

  __int16 v19 = 0;
LABEL_24:

  return v19;
}

- (id)loadTextForPublisher:(id)a3
{
  id v4 = a3;
  id v5 = [v4 subtitle];
  if (!v5)
  {
    id v6 = [v4 bundleID];
    id v5 = [(PSUIAppInstallController *)self tryLoadSubTitleForBundleId:v6];

    if (!v5)
    {
      id v5 = [v4 publisher];
    }
  }

  return v5;
}

- (id)tryLoadSubTitleForBundleId:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v7 = [v4 stringByAppendingString:@"_AppDescription"];
  uint64_t v8 = [v6 dictionaryForKey:v7];
  BOOL v9 = v8;
  if (v8)
  {
    int v10 = [v8 objectForKey:@"AppSubtitleKey"];
  }
  else
  {
    int v10 = 0;
  }

  objc_sync_exit(v5);
  return v10;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"AppInstallController"];
}

- (NSString)appID
{
  return self->_appID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int)installState
{
  return self->_installState;
}

- (PSUIAppDescription)appDescription
{
  return (PSUIAppDescription *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAppDescription:(id)a3
{
}

- (NSURL)installURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInstallURL:(id)a3
{
}

- (NSURL)openAppURL
{
  return self->_openAppURL;
}

- (void)setOpenAppURL:(id)a3
{
}

- (NSURL)moreAppsURL
{
  return self->_moreAppsURL;
}

- (void)setMoreAppsURL:(id)a3
{
}

- (BOOL)overrideLocalAppDescription
{
  return self->_overrideLocalAppDescription;
}

- (id)loadingCompletionBlock
{
  return self->_loadingCompletionBlock;
}

- (void)setLoadingCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadingCompletionBlock, 0);
  objc_storeStrong((id *)&self->_moreAppsURL, 0);
  objc_storeStrong((id *)&self->_openAppURL, 0);
  objc_storeStrong((id *)&self->_installURL, 0);
  objc_storeStrong((id *)&self->_appDescription, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end