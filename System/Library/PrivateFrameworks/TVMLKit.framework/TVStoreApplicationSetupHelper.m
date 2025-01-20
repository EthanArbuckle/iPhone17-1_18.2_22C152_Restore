@interface TVStoreApplicationSetupHelper
+ (id)_parsedQueryParametersForURL:(id)a3;
+ (id)bootURLWithBagBootURL:(id)a3 defaultBootURL:(id)a4;
+ (id)defaultBagBootLaunchContextWithOptions:(id)a3 useCache:(BOOL)a4;
+ (id)fallbackBootURL;
+ (id)launchContextWithLaunchOptions:(id)a3 bagBootURLKey:(id)a4 useCache:(BOOL)a5;
+ (id)launchContextWithLaunchOptions:(id)a3 bootURL:(id)a4;
+ (id)launchContextWithLaunchOptions:(id)a3 bootURL:(id)a4 appLocalBootURL:(id)a5;
+ (id)launchContextWithLaunchOptions:(id)a3 bootURL:(id)a4 bagBootURLKey:(id)a5 useCache:(BOOL)a6;
+ (id)launchContextWithLaunchOptions:(id)a3 bootURL:(id)a4 useCache:(BOOL)a5;
+ (id)preferredBootURL;
- (IKURLBagCache)bagCache;
- (NSURL)defaultBootURL;
- (TVStoreApplicationSetupHelper)init;
- (TVStoreApplicationSetupHelper)initWithDefaultBootURL:(id)a3;
- (TVStoreApplicationSetupHelper)initWithDefaultBootURL:(id)a3 bagCache:(id)a4;
- (void)obtainBootURLWithCompletion:(id)a3;
- (void)setDefaultBootURL:(id)a3;
@end

@implementation TVStoreApplicationSetupHelper

- (TVStoreApplicationSetupHelper)init
{
  return [(TVStoreApplicationSetupHelper *)self initWithDefaultBootURL:0];
}

- (TVStoreApplicationSetupHelper)initWithDefaultBootURL:(id)a3
{
  return [(TVStoreApplicationSetupHelper *)self initWithDefaultBootURL:a3 bagCache:0];
}

- (TVStoreApplicationSetupHelper)initWithDefaultBootURL:(id)a3 bagCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TVStoreApplicationSetupHelper;
  v8 = [(TVStoreApplicationSetupHelper *)&v14 init];
  if (v8)
  {
    if (v7)
    {
      v9 = (IKURLBagCache *)v7;
    }
    else
    {
      v9 = [MEMORY[0x263F4B4B8] sharedCache];
    }
    bagCache = v8->_bagCache;
    v8->_bagCache = v9;

    uint64_t v11 = [v6 copy];
    defaultBootURL = v8->_defaultBootURL;
    v8->_defaultBootURL = (NSURL *)v11;
  }
  return v8;
}

- (void)obtainBootURLWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(TVStoreApplicationSetupHelper *)self bagCache];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__TVStoreApplicationSetupHelper_obtainBootURLWithCompletion___block_invoke;
  v7[3] = &unk_264BA67B8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 loadValueForKey:@"itml-app-url" completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__TVStoreApplicationSetupHelper_obtainBootURLWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [NSURL URLWithString:v5];
    }
    else
    {
      id v9 = (id)TVMLKitLogObject;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __61__TVStoreApplicationSetupHelper_obtainBootURLWithCompletion___block_invoke_cold_1((uint64_t)v5, (uint64_t)v6, v9);
      }

      id v8 = 0;
    }
    v10 = objc_opt_class();
    uint64_t v11 = [WeakRetained defaultBootURL];
    v12 = [v10 bootURLWithBagBootURL:v8 defaultBootURL:v11];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (id)defaultBagBootLaunchContextWithOptions:(id)a3 useCache:(BOOL)a4
{
  return (id)[a1 launchContextWithLaunchOptions:a3 bagBootURLKey:@"itml-app-url" useCache:a4];
}

+ (id)launchContextWithLaunchOptions:(id)a3 bagBootURLKey:(id)a4 useCache:(BOOL)a5
{
  return (id)[a1 launchContextWithLaunchOptions:a3 bootURL:0 bagBootURLKey:a4 useCache:a5];
}

+ (id)launchContextWithLaunchOptions:(id)a3 bootURL:(id)a4 useCache:(BOOL)a5
{
  return (id)[a1 launchContextWithLaunchOptions:a3 bootURL:a4 bagBootURLKey:0 useCache:a5];
}

+ (id)launchContextWithLaunchOptions:(id)a3 bootURL:(id)a4 bagBootURLKey:(id)a5 useCache:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  v13 = objc_alloc_init(TVApplicationControllerContext);
  [(TVApplicationControllerContext *)v13 setBagBootURLKey:v11];

  [(TVApplicationControllerContext *)v13 setJavaScriptApplicationURL:v10];
  objc_super v14 = (void *)[v12 mutableCopy];
  v15 = [MEMORY[0x263F086E0] mainBundle];
  v16 = [v15 bundleIdentifier];
  [v14 setObject:v16 forKey:@"reqApp"];

  v17 = [v12 objectForKey:*MEMORY[0x263F1D078]];

  if (v17) {
    [v14 setObject:v17 forKey:@"refApp"];
  }
  v18 = [a1 _parsedQueryParametersForURL:v10];
  if ([v18 count]) {
    [v14 setObject:v18 forKey:@"query"];
  }
  v19 = (void *)[v14 copy];
  [(TVApplicationControllerContext *)v13 setLaunchOptions:v19];

  if (v6)
  {
    v20 = [MEMORY[0x263F086E0] mainBundle];
    v21 = [v20 bundleIdentifier];

    v22 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v23 = [v22 firstObject];
    v24 = [v23 stringByAppendingPathComponent:v21];

    v25 = [NSURL fileURLWithPath:v24];
    [(TVApplicationControllerContext *)v13 setAppJSCachePath:v25];
  }
  return v13;
}

+ (id)launchContextWithLaunchOptions:(id)a3 bootURL:(id)a4
{
  return (id)[a1 launchContextWithLaunchOptions:a3 bootURL:a4 useCache:0];
}

+ (id)launchContextWithLaunchOptions:(id)a3 bootURL:(id)a4 appLocalBootURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR)) {
    +[TVStoreApplicationSetupHelper launchContextWithLaunchOptions:bootURL:appLocalBootURL:](v10);
  }
  id v11 = [a1 launchContextWithLaunchOptions:v8 bootURL:v9 useCache:a5 != 0];

  return v11;
}

+ (id)preferredBootURL
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 stringForKey:@"boot-url"];

  id v4 = [NSURL URLWithString:v3];

  return v4;
}

+ (id)fallbackBootURL
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 infoDictionary];

  id v4 = [v3 objectForKey:@"TVBootURL"];
  if ([v4 length])
  {
    id v5 = [NSURL URLWithString:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)bootURLWithBagBootURL:(id)a3 defaultBootURL:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [(id)objc_opt_class() preferredBootURL];
  if (v7)
  {
    id v8 = (id)v7;
    id v9 = TVMLKitLogObject;
    if (!os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int v13 = 138412290;
    id v14 = v8;
    id v10 = "Started application with defaults boot-url: %@";
LABEL_7:
    _os_log_impl(&dword_230B4C000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);
    goto LABEL_8;
  }
  id v11 = v5;
  if (v11)
  {
    id v8 = v11;
    id v9 = TVMLKitLogObject;
    if (!os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int v13 = 138412290;
    id v14 = v8;
    id v10 = "Started application with URLBag boot-url: %@";
    goto LABEL_7;
  }
  id v8 = [(id)objc_opt_class() fallbackBootURL];
  if (!v8) {
    id v8 = v6;
  }
LABEL_8:

  return v8;
}

+ (id)_parsedQueryParametersForURL:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [a3 query];
  id v4 = [v3 componentsSeparatedByString:@"&"];

  uint64_t v5 = [v4 count];
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v5];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "stringByRemovingPercentEncoding", (void)v18);
          int v13 = [v12 componentsSeparatedByString:@"="];

          if ([v13 count] == 2)
          {
            id v14 = [v13 objectAtIndex:1];
            uint64_t v15 = [v13 objectAtIndex:0];
            [v6 setObject:v14 forKey:v15];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    v16 = (void *)[v6 copy];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSURL)defaultBootURL
{
  return self->_defaultBootURL;
}

- (void)setDefaultBootURL:(id)a3
{
}

- (IKURLBagCache)bagCache
{
  return self->_bagCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagCache, 0);
  objc_storeStrong((id *)&self->_defaultBootURL, 0);
}

void __61__TVStoreApplicationSetupHelper_obtainBootURLWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v7 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v7);
  }
  else
  {
    id v6 = 0;
  }
  int v8 = 138412546;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_230B4C000, log, OS_LOG_TYPE_ERROR, "Unexpected type for bagBootURL -> %@: %@", (uint8_t *)&v8, 0x16u);
  if (a1) {
}
  }

+ (void)launchContextWithLaunchOptions:(os_log_t)log bootURL:appLocalBootURL:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_230B4C000, log, OS_LOG_TYPE_ERROR, "appLocalBootURL is no longer in use!", v1, 2u);
}

@end