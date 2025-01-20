@interface VUIJSNetworkInterface
- (BOOL)suppressServerConfigNotifications;
- (VUIJSNetworkInterface)initWithAppContext:(id)a3;
- (id)_createURLRequestFromJSOptionsDictionary:(id)a3;
- (id)makeMediaApiRequest:(id)a3 :(id)a4;
- (id)makeRequest:(id)a3 :(id)a4;
- (id)makeStoreRequest:(id)a3 :(id)a4;
- (int64_t)_requestOptionsFromJSOptions:(id)a3;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)_enqueueNetworkOp:(id)a3 withJSCallbackUUID:(id)a4;
- (void)_handleServerConfigChange:(id)a3;
- (void)cancelRequest:(id)a3;
- (void)dealloc;
- (void)fetchConfiguration:(BOOL)a3 :(id)a4;
- (void)setSuppressServerConfigNotifications:(BOOL)a3;
- (void)upNextItemsReceived:(id)a3 :(id)a4;
@end

@implementation VUIJSNetworkInterface

- (VUIJSNetworkInterface)initWithAppContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUIJSNetworkInterface;
  v3 = [(VUIJSObject *)&v6 initWithAppContext:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__handleServerConfigChange_ name:*MEMORY[0x1E4FB5208] object:0];
  }
  return v3;
}

void __45__VUIJSNetworkInterface_fetchConfiguration::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - initconfig: WLK returned", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = [WeakRetained appContext];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__VUIJSNetworkInterface_fetchConfiguration::__block_invoke_109;
  v12[3] = &unk_1E6DF80B8;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  id v13 = *(id *)(a1 + 32);
  id v10 = v5;
  id v14 = v10;
  id v11 = v6;
  id v15 = v11;
  [v9 evaluate:v12];

  objc_destroyWeak(&v16);
}

- (void)fetchConfiguration:(BOOL)a3 :(id)a4
{
  id v6 = a4;
  v7 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - Begin initconfig", (uint8_t *)buf, 2u);
  }

  v8 = [MEMORY[0x1E4F29128] UUID];
  v9 = [v8 UUIDString];

  [(VUIJSObject *)self setJSValue:v6 forProperty:v9];
  if (a3)
  {
    uint64_t v10 = 3;
  }
  else
  {
    id v11 = +[VUIFeaturesConfiguration sharedInstance];
    v12 = [v11 launchConfig];
    int v13 = [v12 useConfigCacheIgnoreExpiry];

    if (v13) {
      uint64_t v10 = 5;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  [(VUIJSNetworkInterface *)self setSuppressServerConfigNotifications:1];
  objc_initWeak(buf, self);
  id v14 = [MEMORY[0x1E4FB5088] sharedInstance];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__VUIJSNetworkInterface_fetchConfiguration::__block_invoke;
  v16[3] = &unk_1E6DF80E0;
  objc_copyWeak(&v18, buf);
  id v15 = v9;
  id v17 = v15;
  [v14 fetchConfigurationWithOptions:0 cachePolicy:v10 queryParameters:0 completion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(buf);
}

- (void)setSuppressServerConfigNotifications:(BOOL)a3
{
  self->_suppressServerConfigNotifications = a3;
}

- (id)makeRequest:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!+[VUIJSThreadUtils isVideosUICoreJSThread])
  {
    v8 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - makeRequest must be on JS Thread", (uint8_t *)buf, 2u);
    }
  }
  v9 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v10 = [v9 UUIDString];

  v35 = v7;
  v37 = (void *)v10;
  [(VUIJSObject *)self setJSValue:v7 forProperty:v10];
  uint64_t v11 = objc_msgSend(v6, "wlk_stringForKey:", @"endpoint");
  uint64_t v12 = objc_msgSend(v6, "wlk_stringForKey:", @"serverRoute");
  uint64_t v13 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"headers");
  uint64_t v14 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"queryParameters");
  uint64_t v15 = objc_msgSend(v6, "wlk_stringForKey:", @"httpMethod");
  v31 = objc_msgSend(v6, "wlk_stringForKey:", @"postBody");
  uint64_t v16 = [v31 dataUsingEncoding:4];
  uint64_t v17 = objc_msgSend(v6, "wlk_numberForKey:", @"timeout");
  uint64_t v18 = objc_msgSend(v6, "wlk_stringForKey:", @"caller");
  v36 = objc_msgSend(v6, "wlk_numberForKey:", @"networkActivity");
  val = self;
  int64_t v19 = [(VUIJSNetworkInterface *)self _requestOptionsFromJSOptions:v6];
  v33 = (void *)v12;
  v34 = (void *)v11;
  v32 = (void *)v13;
  v40 = (void *)v14;
  v41 = (void *)v16;
  v39 = (void *)v17;
  v30 = (void *)v15;
  if (v11)
  {
    v20 = objc_msgSend(v6, "wlk_numberForKey:", @"apiVersion");
    v21 = objc_msgSend(MEMORY[0x1E4FB5188], "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", v11, v14, v15, v16, v13, v18, v17, v20, v19, v15);

LABEL_7:
    v22 = (void *)v18;
    goto LABEL_10;
  }
  if (!v12)
  {
    v21 = 0;
    goto LABEL_7;
  }
  v22 = (void *)v18;
  v21 = [MEMORY[0x1E4FB5188] requestPropertiesWithServerRoute:v12 queryParameters:v40 httpMethod:v15 httpBody:v16 headers:v13 caller:v18 timeout:v17 options:v19];
LABEL_10:
  objc_initWeak(buf, val);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __38__VUIJSNetworkInterface_makeRequest::__block_invoke;
  v42[3] = &unk_1E6DF8040;
  objc_copyWeak(&v45, buf);
  id v23 = v36;
  id v43 = v23;
  id v24 = v37;
  id v44 = v24;
  +[VUIJSNetworkProxy makeNetworkRequestOperation:v21 completionHandler:v42];
  v25 = (void *)MEMORY[0x1E4F30938];
  v26 = [(VUIJSObject *)val appContext];
  v27 = [v26 jsContext];
  v28 = [v25 valueWithObject:&stru_1F3E921E0 inContext:v27];

  objc_destroyWeak(&v45);
  objc_destroyWeak(buf);

  return v28;
}

- (int64_t)_requestOptionsFromJSOptions:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"suppressAuthentication"];
  id v5 = [v3 objectForKey:@"encodeQueryParams"];
  id v6 = [v3 objectForKey:@"nonPersonalized"];
  id v7 = [v3 objectForKey:@"ignoreLocalCache"];

  if (v4)
  {
    int64_t v8 = [v4 BOOLValue];
    if (!v5) {
      goto LABEL_5;
    }
  }
  else
  {
    int64_t v8 = 0;
    if (!v5) {
      goto LABEL_5;
    }
  }
  if (![v5 BOOLValue]) {
    v8 |= 2uLL;
  }
LABEL_5:
  if ([v6 BOOLValue]) {
    v8 |= 0x10uLL;
  }
  if ([v7 BOOLValue]) {
    v8 |= 8uLL;
  }

  return v8;
}

void __38__VUIJSNetworkInterface_makeRequest::__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [v5 setAuthenticationDelegate:WeakRetained];
    if (*(void *)(a1 + 32))
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB50D8]), "initWithLabel:", objc_msgSend(*(id *)(a1 + 32), "unsignedIntValue"));
      [v5 setNwactivity:v4];
    }
    [WeakRetained _enqueueNetworkOp:v5 withJSCallbackUUID:*(void *)(a1 + 40)];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIJSNetworkInterface;
  [(VUIJSNetworkInterface *)&v4 dealloc];
}

- (id)makeStoreRequest:(id)a3 :(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (!+[VUIJSThreadUtils isVideosUICoreJSThread])
  {
    int64_t v8 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - makeStoreRequest must be on JS Thread", v20, 2u);
    }
  }
  v9 = [(VUIJSNetworkInterface *)self _createURLRequestFromJSOptionsDictionary:v7];
  int64_t v10 = [(VUIJSNetworkInterface *)self _requestOptionsFromJSOptions:v7];

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB50E0]) initWithURLRequest:v9 options:v10];
  [v11 setAuthenticationDelegate:self];
  uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v13 = [v12 UUIDString];

  [(VUIJSObject *)self setJSValue:v6 forProperty:v13];
  [(VUIJSNetworkInterface *)self _enqueueNetworkOp:v11 withJSCallbackUUID:v13];
  uint64_t v14 = (void *)MEMORY[0x1E4F30938];
  uint64_t v15 = [v11 identifier];
  uint64_t v16 = [(VUIJSObject *)self appContext];
  uint64_t v17 = [v16 jsContext];
  uint64_t v18 = [v14 valueWithObject:v15 inContext:v17];

  return v18;
}

- (id)makeMediaApiRequest:(id)a3 :(id)a4
{
  id v6 = a4;
  id v7 = [(VUIJSNetworkInterface *)self _createURLRequestFromJSOptionsDictionary:a3];
  int64_t v8 = [MEMORY[0x1E4F29128] UUID];
  v9 = [v8 UUIDString];

  int64_t v10 = [(VUIJSObject *)self appContext];
  if (v7)
  {
    +[VUIMediaAPIClient initializeWithAppleTVClientIdentifier];
    uint64_t v11 = +[VUIMediaAPIClient sharedInstance];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __46__VUIJSNetworkInterface_makeMediaApiRequest::__block_invoke;
    int64_t v19 = &unk_1E6DF8090;
    id v20 = v10;
    id v21 = v6;
    [v11 fetchContentForUrl:v7 completion:&v16];
  }
  -[VUIJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v6, v9, v16, v17, v18, v19);
  uint64_t v12 = (void *)MEMORY[0x1E4F30938];
  uint64_t v13 = [v10 jsContext];
  uint64_t v14 = [v12 valueWithObject:v9 inContext:v13];

  return v14;
}

void __46__VUIJSNetworkInterface_makeMediaApiRequest::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__VUIJSNetworkInterface_makeMediaApiRequest::__block_invoke_2;
  v10[3] = &unk_1E6DF8068;
  id v11 = v5;
  id v12 = v6;
  id v7 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 32);
  id v8 = v6;
  id v9 = v5;
  [v7 evaluate:v10];
}

void __46__VUIJSNetworkInterface_makeMediaApiRequest::__block_invoke_2(id *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithCapacity:3];
  id v6 = [a1[4] response];
  id v7 = v6;
  if (v6) {
    uint64_t v8 = [v6 statusCode];
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v26 = v8;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - VUIJSNetworkInterface::Media API response returned with statusCode %ld", buf, 0xCu);
  }

  if (a1[5])
  {
    int64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    id v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(a1[5], "code"));
    [v10 setObject:v11 forKey:@"code"];

    id v12 = [a1[5] domain];
    [v10 setObject:v12 forKey:@"domain"];

    id v13 = [a1[5] debugDescription];
    [v10 setObject:v13 forKey:@"description"];

    [v5 setObject:v10 forKey:@"error"];
LABEL_8:

    id v14 = 0;
    goto LABEL_9;
  }
  uint64_t v16 = [a1[4] object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int64_t v10 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - VUIJSNetworkInterface::Parsing Media API Fetch with no object dictionary", buf, 2u);
    }
    goto LABEL_8;
  }
  id v14 = [a1[4] object];
LABEL_9:
  uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:v8];
  [v5 setObject:v15 forKey:@"statusCode"];

  if (v14)
  {
    [v5 setObject:v14 forKey:@"response"];
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
    [v5 setObject:v18 forKey:@"response"];
  }
  id v19 = [a1[6] context];
  int v20 = [a1[7] isValid];

  if (v20 && v19 == v4)
  {
    id v21 = a1[6];
    id v24 = v5;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    id v23 = (id)[v21 callWithArguments:v22];
  }
}

- (void)upNextItemsReceived:(id)a3 :(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v7 postNotificationName:*MEMORY[0x1E4FB5218] object:0];

  uint64_t v8 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2048;
    uint64_t v16 = [v5 count];
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - Received UpNext update: donating media items [from %@, %ld items]", buf, 0x16u);
  }

  id v9 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VUIJSNetworkInterface_upNextItemsReceived::__block_invoke;
  block[3] = &unk_1E6DF3D58;
  id v12 = v5;
  id v10 = v5;
  dispatch_async(v9, block);
}

void __46__VUIJSNetworkInterface_upNextItemsReceived::__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        id v9 = objc_alloc(MEMORY[0x1E4FB5090]);
        id v10 = objc_msgSend(v9, "initWithDictionary:context:", v8, 0, (void)v11);
        [v2 addObject:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  [MEMORY[0x1E4FB5098] donateMediaItems:v2];
}

- (void)cancelRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28F08], "wlkDefaultConcurrentQueue", 0);
  uint64_t v5 = [v4 operations];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          long long v11 = [v10 identifier];
          int v12 = [v11 isEqualToString:v3];

          if (v12) {
            [v10 cancel];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

void __45__VUIJSNetworkInterface_fetchConfiguration::__block_invoke_109(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained jsValueForProperty:*(void *)(a1 + 32)];
    uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    uint64_t v6 = [*(id *)(a1 + 40) responseDictionary];
    uint64_t v7 = WLKNetworkingLogObject();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - initconfig success.", (uint8_t *)&v12, 2u);
      }

      [v5 addObject:v6];
    }
    else
    {
      if (v8)
      {
        uint64_t v9 = *(void *)(a1 + 48);
        int v12 = 138412290;
        uint64_t v13 = v9;
        _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - initconfig error. %@", (uint8_t *)&v12, 0xCu);
      }
    }
    id v10 = (id)[v4 callWithArguments:v5];
    [v3 setJSValue:0 forProperty:*(void *)(a1 + 32)];
    [v3 setSuppressServerConfigNotifications:0];
    long long v11 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - End initconfig", (uint8_t *)&v12, 2u);
    }
  }
}

- (void)_enqueueNetworkOp:(id)a3 withJSCallbackUUID:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - Request start: %@ %p", buf, 0x16u);
  }

  uint64_t v9 = [v6 identifier];
  id v10 = objc_msgSend(v9, "substringToIndex:", (int)fmin((double)(unint64_t)(objc_msgSend(v9, "length") - 1), 7.0));
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__10;
  v28 = __Block_byref_object_dispose__10;
  long long v11 = [VUIScopedBackgroundTask alloc];
  int v12 = [NSString stringWithFormat:@"VUIJSNetOp-%@", v10];
  v29 = [(VUIScopedBackgroundTask *)v11 initWithIdentifier:v12 expirationHandler:0];

  uint64_t v13 = WLKNetworkSignpostLogObject();
  uint64_t v14 = (char *)os_signpost_id_make_with_pointer(v13, v9);

  long long v15 = WLKNetworkSignpostLogObject();
  long long v16 = v15;
  if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(v25[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v14, "WLKUIRequest.total", "", (uint8_t *)v25, 2u);
  }

  objc_initWeak(v25, self);
  objc_initWeak(&location, v6);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__VUIJSNetworkInterface__enqueueNetworkOp_withJSCallbackUUID___block_invoke;
  v19[3] = &unk_1E6DF8130;
  id v21 = buf;
  v23[1] = v14;
  objc_copyWeak(&v22, v25);
  objc_copyWeak(v23, &location);
  id v17 = v7;
  id v20 = v17;
  [v6 setCompletionBlock:v19];
  uint64_t v18 = [MEMORY[0x1E4F28F08] wlkDefaultConcurrentQueue];
  [v18 addOperation:v6];

  objc_destroyWeak(v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(v25);
  _Block_object_dispose(buf, 8);
}

void __62__VUIJSNetworkInterface__enqueueNetworkOp_withJSCallbackUUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v5 = WLKNetworkSignpostLogObject();
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 64);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "WLKUIRequest.bridge", "", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v9 = [WeakRetained appContext];
  if ([v9 isValid])
  {
    id v10 = objc_loadWeakRetained((id *)(a1 + 56));
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__VUIJSNetworkInterface__enqueueNetworkOp_withJSCallbackUUID___block_invoke_117;
    v12[3] = &unk_1E6DF8108;
    v16[1] = *(id *)(a1 + 64);
    long long v11 = v10;
    uint64_t v13 = v11;
    id v14 = v4;
    objc_copyWeak(v16, (id *)(a1 + 48));
    id v15 = *(id *)(a1 + 32);
    [v9 evaluate:v12];

    objc_destroyWeak(v16);
  }
  else
  {
    long long v11 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - VUIAppContext is not valid. Process stopped calling appContext completionBlock", buf, 2u);
    }
  }
}

void __62__VUIJSNetworkInterface__enqueueNetworkOp_withJSCallbackUUID___block_invoke_117(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = WLKNetworkSignpostLogObject();
  uint64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 64);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v5, OS_SIGNPOST_INTERVAL_END, v6, "WLKUIRequest.bridge", "", buf, 2u);
  }

  os_signpost_id_t v7 = [MEMORY[0x1E4F1C9C8] now];
  BOOL v8 = [*(id *)(a1 + 32) error];
  uint64_t v9 = [*(id *)(a1 + 32) httpResponse];
  id v10 = [*(id *)(a1 + 32) data];
  id v11 = objc_alloc_init(MEMORY[0x1E4FB50A0]);
  int v12 = [v11 processResponseData:v10 error:0];
  id v43 = v11;
  id v44 = v3;
  if (!v12 && v10) {
    int v12 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
  }
  v47 = [v9 allHeaderFields];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
  id v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "responseStatusCode"));
  [v13 setObject:v14 forKey:@"statusCode"];

  if (v12)
  {
    [v13 setObject:v12 forKey:@"response"];
  }
  else
  {
    id v15 = [MEMORY[0x1E4F1CA98] null];
    [v13 setObject:v15 forKey:@"response"];
  }
  if (v47)
  {
    [v13 setObject:v47 forKey:@"headers"];
  }
  else
  {
    long long v16 = [MEMORY[0x1E4F1CA98] null];
    [v13 setObject:v16 forKey:@"headers"];
  }
  [*(id *)(a1 + 40) timeIntervalSince1970];
  uint64_t v18 = (uint64_t)(v17 * 1000.0);
  v46 = v7;
  [v7 timeIntervalSince1970];
  uint64_t v20 = (uint64_t)(v19 * 1000.0);
  id v21 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v18];
  [v13 setObject:v21 forKey:@"primaryDataResponseStartTime"];

  id v22 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v20];
  [v13 setObject:v22 forKey:@"primaryDataResponseEndTime"];

  id v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "resourceFetchType") == 3);
  [v13 setObject:v23 forKey:@"isPrimaryDataResponseCached"];

  if (!v9 && v8)
  {
    id v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    v25 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v8, "code"));
    [v24 setObject:v25 forKey:@"code"];

    uint64_t v26 = [v8 domain];
    [v24 setObject:v26 forKey:@"domain"];

    uint64_t v27 = [v8 debugDescription];
    [v24 setObject:v27 forKey:@"description"];

    [v13 setObject:v24 forKey:@"error"];
  }
  id v45 = v8;
  v28 = v9;
  v29 = WLKNetworkSignpostLogObject();
  uint64_t v30 = v29;
  os_signpost_id_t v31 = *(void *)(a1 + 64);
  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v30, OS_SIGNPOST_INTERVAL_END, v31, "WLKUIRequest.total", "", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v33 = [WeakRetained jsValueForProperty:*(void *)(a1 + 48)];
  v34 = [v33 context];
  v35 = [WeakRetained appContext];
  int v36 = [v35 isValid];

  v37 = WLKNetworkingLogObject();
  BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
  if (!v36 || v34 != v44)
  {
    if (v36)
    {
      if (!v38) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      v42 = "VUIJSNetworkInterface - context of localCallBack does not match with context of AppContext";
    }
    else
    {
      if (!v38) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      v42 = "VUIJSNetworkInterface - VUIAppContext is not valid inside AppContext evalue completionBlock";
    }
    _os_log_impl(&dword_1E2BD7000, v37, OS_LOG_TYPE_DEFAULT, v42, buf, 2u);
    goto LABEL_30;
  }
  if (v38)
  {
    uint64_t v39 = *(void *)(a1 + 32);
    uint64_t v40 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    uint64_t v50 = v39;
    __int16 v51 = 2048;
    uint64_t v52 = v40;
    _os_log_impl(&dword_1E2BD7000, v37, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - Request end: %@ %p", buf, 0x16u);
  }

  v48 = v13;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  id v41 = (id)[v33 callWithArguments:v37];
LABEL_30:

  [WeakRetained setJSValue:0 forProperty:*(void *)(a1 + 48)];
}

- (id)_createURLRequestFromJSOptionsDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "wlk_stringForKey:", @"url");
  uint64_t v5 = objc_msgSend(v3, "wlk_stringForKey:", @"httpMethod");
  os_signpost_id_t v6 = objc_msgSend(v3, "wlk_stringForKey:", @"postBody");
  os_signpost_id_t v7 = objc_msgSend(v3, "wlk_dictionaryForKey:", @"headers");
  BOOL v8 = objc_msgSend(v3, "wlk_dictionaryForKey:", @"queryParameters");
  uint64_t v9 = objc_msgSend(v3, "wlk_numberForKey:", @"timeout");
  int v10 = [v5 isEqualToString:@"POST"];
  int v11 = objc_msgSend(v3, "wlk_BOOLForKey:defaultValue:", @"encodeQueryParams", 1);

  if (v4 && ([MEMORY[0x1E4F1CB10] URLWithString:v4], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v13 = (void *)v12;
    id v24 = v7;
    id v14 = v6;
    id v15 = objc_msgSend(MEMORY[0x1E4F1CB10], "vui_sortedQueryItemsFromDictionary:", v8);
    long long v16 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v13 resolvingAgainstBaseURL:0];
    v25 = v15;
    if ([v15 count])
    {
      if (v11) {
        [v16 setPercentEncodedQueryItems:v15];
      }
      else {
        [v16 setQueryItems:v15];
      }
      os_signpost_id_t v6 = v14;
      uint64_t v18 = [v16 URL];

      uint64_t v13 = (void *)v18;
    }
    else
    {
      os_signpost_id_t v6 = v14;
    }
    os_signpost_id_t v7 = v24;
    id v19 = objc_alloc(MEMORY[0x1E4F28E88]);
    [v9 doubleValue];
    uint64_t v20 = objc_msgSend(v19, "initWithURL:cachePolicy:timeoutInterval:", v13, 0);
    id v21 = v20;
    if (v5) {
      [v20 setHTTPMethod:v5];
    }
    if (v10)
    {
      id v22 = [v6 dataUsingEncoding:4];
      [v21 setHTTPBody:v22];
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __66__VUIJSNetworkInterface__createURLRequestFromJSOptionsDictionary___block_invoke;
    v26[3] = &unk_1E6DF8158;
    id v17 = v21;
    id v27 = v17;
    [v24 enumerateKeysAndObjectsUsingBlock:v26];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

uint64_t __66__VUIJSNetworkInterface__createURLRequestFromJSOptionsDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v7 = a5;
  id v8 = a6;
  uint64_t v9 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - AMSURLProtocolDelegate handleDialogRequest begin", buf, 2u);
  }

  int v10 = +[VUIApplicationRouter topMostVisibleViewController];
  if (v10)
  {
    int v11 = [objc_alloc(MEMORY[0x1E4F4DF28]) initWithRequest:v7 presentingViewController:v10];
    uint64_t v12 = [v11 present];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __75__VUIJSNetworkInterface_AMSURLSession_task_handleDialogRequest_completion___block_invoke;
    v13[3] = &unk_1E6DF59C0;
    id v14 = v8;
    [v12 addFinishBlock:v13];
  }
  else
  {
    int v11 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - failed to handle dialog request because there is no presenting view controller", buf, 2u);
    }
  }
}

void __75__VUIJSNetworkInterface_AMSURLSession_task_handleDialogRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - AMSURLProtocolDelegate handleDialogRequest end", v9, 2u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v7 = a5;
  id v8 = a6;
  uint64_t v9 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - AMSURLProtocolDelegate handleAuthenticateRequest begin", buf, 2u);
  }

  int v10 = +[VUIApplicationRouter topMostVisibleViewController];
  if (v10)
  {
    int v11 = [objc_alloc(MEMORY[0x1E4F4DF30]) initWithRequest:v7 presentingViewController:v10];
    uint64_t v12 = [v11 performAuthentication];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__VUIJSNetworkInterface_AMSURLSession_task_handleAuthenticateRequest_completion___block_invoke;
    v13[3] = &unk_1E6DF5998;
    id v14 = v8;
    [v12 addFinishBlock:v13];
  }
  else
  {
    int v11 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - failed to handle authenticate request because there is no presenting view controller", buf, 2u);
    }
  }
}

void __81__VUIJSNetworkInterface_AMSURLSession_task_handleAuthenticateRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - AMSURLProtocolDelegate handleAuthenticateRequest end", v9, 2u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)_handleServerConfigChange:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_Vuijsnetworkin.isa);
  if (self->_suppressServerConfigNotifications)
  {
    NSLog(&cfstr_Vuijsnetworkin_0.isa);
  }
  else
  {
    id v5 = [(VUIJSObject *)self appContext];
    objc_initWeak(&location, v5);

    objc_initWeak(&from, self);
    id v6 = objc_loadWeakRetained(&location);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__VUIJSNetworkInterface__handleServerConfigChange___block_invoke;
    v7[3] = &unk_1E6DF6D10;
    objc_copyWeak(&v9, &from);
    id v8 = v4;
    [v6 evaluate:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __51__VUIJSNetworkInterface__handleServerConfigChange___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [MEMORY[0x1E4F30938] valueWithObject:WeakRetained inContext:v4];

  if ([v6 hasProperty:@"onConfigurationChange"])
  {
    NSLog(&cfstr_Vuijsnetworkin_1.isa);
    id v7 = [*(id *)(a1 + 32) object];
    id v8 = v7;
    if (!v7)
    {
      id v8 = [MEMORY[0x1E4F1CA98] null];
    }
    v11[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    if (!v7) {

    }
    id v10 = (id)[v6 invokeMethod:@"onConfigurationChange" withArguments:v9];
  }
}

- (BOOL)suppressServerConfigNotifications
{
  return self->_suppressServerConfigNotifications;
}

@end