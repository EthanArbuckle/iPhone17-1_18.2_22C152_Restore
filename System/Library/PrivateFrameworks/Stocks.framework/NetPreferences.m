@interface NetPreferences
+ (id)sharedPreferences;
+ (void)clearSharedPreferences;
- (BOOL)isNetworkReachable;
- (BOOL)serviceDebugging;
- (NSString)UUID;
- (NSString)acceptLanguageCode;
- (NSString)requestCountryCode;
- (NSString)requestLanguageCode;
- (NetPreferences)init;
- (id)_cacheDirectoryPath;
- (id)_stocksAcceptLanguage;
- (id)_stocksUserAgent;
- (id)_urlStringWithHost:(id)a3;
- (id)backsideLogoURL;
- (id)defaultBacksideLogoURL;
- (id)financeRequestAttributes;
- (id)fullQuoteURLOverrideForStock:(id)a3;
- (id)logoBacksideImage;
- (id)logoButtonImage;
- (id)serviceDebuggingPath;
- (id)signedRequestForURL:(id)a3 parameters:(id)a4;
- (id)stocksCountryCode;
- (id)stocksLanguageCode;
- (id)stocksLanguageCodeForLanguage:(id)a3;
- (id)stocksYQLBaseURL;
- (void)addStocksHeadersToPostRequest:(id)a3;
- (void)resetLocale;
- (void)setAcceptLanguageCode:(id)a3;
- (void)setNetworkReachable:(BOOL)a3;
- (void)setRequestCountryCode:(id)a3;
- (void)setRequestLanguageCode:(id)a3;
@end

@implementation NetPreferences

+ (id)sharedPreferences
{
  os_unfair_lock_lock((os_unfair_lock_t)&_accessLock);
  if (!_instance)
  {
    id v2 = objc_alloc_init((Class)objc_opt_class());
    v3 = (void *)_instance;
    _instance = (uint64_t)v2;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_accessLock);
  v4 = (void *)_instance;

  return v4;
}

+ (void)clearSharedPreferences
{
  os_unfair_lock_lock((os_unfair_lock_t)&_accessLock);
  id v2 = (void *)_instance;
  _instance = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_accessLock);
}

- (NetPreferences)init
{
  v22.receiver = self;
  v22.super_class = (Class)NetPreferences;
  id v2 = [(NetPreferences *)&v22 init];
  if (v2)
  {
    v3 = [NSURL fileURLWithPath:@"/private/var/mobile/Library/Preferences/com.apple.stocks.plist"];
    v4 = [NSDictionary dictionaryWithContentsOfURL:v3];
    v5 = [NSNumber numberWithBool:0];
    if (v4)
    {
      uint64_t v6 = [v4 objectForKey:@"ServiceDebugging"];

      v5 = (void *)v6;
    }
    v2->_serviceDebugging = [v5 BOOLValue];
    v7 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
    uint64_t v8 = [v7 objectForKey:@"ProductVersion"];
    productVersion = v2->_productVersion;
    v2->_productVersion = (NSString *)v8;

    uint64_t v10 = [v7 objectForKey:@"ProductBuildVersion"];
    buildVersion = v2->_buildVersion;
    v2->_buildVersion = (NSString *)v10;

    v12 = +[StocksPreferences sharedPreferences];
    uint64_t v13 = [v12 objectForKey:@"UUID"];
    UUID = v2->_UUID;
    v2->_UUID = (NSString *)v13;

    if (!v2->_UUID)
    {
      v15 = [MEMORY[0x263F08C38] UUID];
      uint64_t v16 = [v15 UUIDString];
      v17 = v2->_UUID;
      v2->_UUID = (NSString *)v16;

      v18 = +[StocksPreferences sharedPreferences];
      [v18 setObject:v2->_UUID forKey:@"UUID"];
      v19 = [MEMORY[0x263EFF910] date];
      [v18 setObject:v19 forKey:@"UUIDTimestamp"];

      [v18 synchronize];
    }
    v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 addObserver:v2 selector:sel_resetLocale name:*MEMORY[0x263EFF458] object:0];
  }
  return v2;
}

- (NSString)requestCountryCode
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_requestCountryCode;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRequestCountryCode:(id)a3
{
  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  requestCountryCode = obj->_requestCountryCode;
  obj->_requestCountryCode = v4;

  objc_sync_exit(obj);
}

- (NSString)requestLanguageCode
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_requestLanguageCode;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRequestLanguageCode:(id)a3
{
  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  requestLanguageCode = obj->_requestLanguageCode;
  obj->_requestLanguageCode = v4;

  objc_sync_exit(obj);
}

- (NSString)acceptLanguageCode
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_acceptLanguageCode;
  objc_sync_exit(v2);

  return v3;
}

- (void)setAcceptLanguageCode:(id)a3
{
  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  acceptLanguageCode = obj->_acceptLanguageCode;
  obj->_acceptLanguageCode = v4;

  objc_sync_exit(obj);
}

- (void)resetLocale
{
  [(NetPreferences *)self setRequestCountryCode:0];
  [(NetPreferences *)self setRequestLanguageCode:0];

  [(NetPreferences *)self setAcceptLanguageCode:0];
}

- (BOOL)isNetworkReachable
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = StocksLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isNetworkReachable) {
      v4 = "YES";
    }
    else {
      v4 = "NO";
    }
    v5 = [MEMORY[0x263F255C0] sharedNetworkObserver];
    if ([v5 isNetworkReachable]) {
      uint64_t v6 = "YES";
    }
    else {
      uint64_t v6 = "NO";
    }
    int v10 = 136315394;
    v11 = v4;
    __int16 v12 = 2080;
    uint64_t v13 = v6;
    _os_log_impl(&dword_222ED9000, v3, OS_LOG_TYPE_DEFAULT, "#NetPreferences isNetworkReachable (host reachable: %s) (any reachable: %s)", (uint8_t *)&v10, 0x16u);
  }
  if (self->_isNetworkReachable) {
    return 1;
  }
  uint64_t v8 = [MEMORY[0x263F255C0] sharedNetworkObserver];
  char v7 = [v8 isNetworkReachable];

  return v7;
}

- (void)setNetworkReachable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  self->_isNetworkReachable = a3;
  v4 = StocksLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "NO";
    if (v3) {
      v5 = "YES";
    }
    int v6 = 136315138;
    char v7 = v5;
    _os_log_impl(&dword_222ED9000, v4, OS_LOG_TYPE_DEFAULT, "#NetPreferences setNetworkReachable: %s", (uint8_t *)&v6, 0xCu);
  }
}

- (id)_stocksUserAgent
{
  if (_stocksUserAgent_onceToken != -1) {
    dispatch_once(&_stocksUserAgent_onceToken, &__block_literal_global_5);
  }
  id v2 = (void *)_stocksUserAgent_stocksUserAgent;

  return v2;
}

void __34__NetPreferences__stocksUserAgent__block_invoke()
{
  v0 = NSString;
  id v6 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v6 objectForInfoDictionaryKey:*MEMORY[0x263EFFB70]];
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  BOOL v3 = [v2 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
  uint64_t v4 = [v0 stringWithFormat:@"AppleStocks/%@ Version/%@", v1, v3];
  v5 = (void *)_stocksUserAgent_stocksUserAgent;
  _stocksUserAgent_stocksUserAgent = v4;
}

- (id)stocksCountryCode
{
  BOOL v3 = [(NetPreferences *)self requestCountryCode];

  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF960] currentLocale];
    v5 = [v4 objectForKey:*MEMORY[0x263EFF4D0]];

    if (v5) {
      uint64_t v6 = (uint64_t)v5;
    }
    else {
      uint64_t v6 = DefaultStocksCountryCode;
    }
    [(NetPreferences *)self setRequestCountryCode:v6];
  }

  return [(NetPreferences *)self requestCountryCode];
}

- (id)stocksLanguageCode
{
  BOOL v3 = [(NetPreferences *)self requestLanguageCode];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263EFF960];
    char v7 = [MEMORY[0x263EFF960] systemLanguages];
    uint64_t v8 = [v6 mostPreferredLanguageOf:v7 forUsage:1 options:0];

    if (![v8 length])
    {
      v9 = [MEMORY[0x263EFF960] currentLocale];
      uint64_t v10 = [v9 languageCode];

      uint64_t v8 = (void *)v10;
    }
    id v5 = [(NetPreferences *)self stocksLanguageCodeForLanguage:v8];
  }

  return v5;
}

- (id)stocksLanguageCodeForLanguage:(id)a3
{
  id v4 = a3;
  id v5 = [(NetPreferences *)self requestLanguageCode];

  if (!v5) {
    [(NetPreferences *)self setRequestLanguageCode:v4];
  }
  uint64_t v6 = [(NetPreferences *)self requestLanguageCode];

  return v6;
}

- (id)_stocksAcceptLanguage
{
  BOOL v3 = [(NetPreferences *)self acceptLanguageCode];

  if (!v3)
  {
    id v4 = [MEMORY[0x263EFF960] preferredLanguages];
    id v5 = [v4 objectAtIndex:0];
    if ([v5 length])
    {
      uint64_t v6 = [v5 stringByAppendingString:@", *"];
      [(NetPreferences *)self setAcceptLanguageCode:v6];
    }
    else
    {
      [(NetPreferences *)self setAcceptLanguageCode:@"en, *"];
    }
  }

  return [(NetPreferences *)self acceptLanguageCode];
}

- (void)addStocksHeadersToPostRequest:(id)a3
{
  id v7 = a3;
  [v7 setHTTPMethod:@"POST"];
  [v7 setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
  id v4 = [(NetPreferences *)self _stocksUserAgent];
  [v7 setValue:v4 forHTTPHeaderField:@"User-Agent"];

  id v5 = [(NetPreferences *)self stocksCountryCode];
  [v7 setValue:v5 forHTTPHeaderField:@"X-Country-Code"];

  uint64_t v6 = [(NetPreferences *)self _stocksAcceptLanguage];
  [v7 setValue:v6 forHTTPHeaderField:@"Accept-Language"];

  [v7 setHTTPShouldHandleCookies:0];
}

- (id)financeRequestAttributes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__NetPreferences_financeRequestAttributes__block_invoke;
  block[3] = &unk_26467D130;
  block[4] = self;
  if (financeRequestAttributes_onceToken != -1) {
    dispatch_once(&financeRequestAttributes_onceToken, block);
  }
  return (id)financeRequestAttributes_RequestAttr;
}

void __42__NetPreferences_financeRequestAttributes__block_invoke(uint64_t a1)
{
  id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "length")+ 2 * objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "length")+ 155);
  [v4 appendString:@"devtype=\"Apple iPhone v"];
  [v4 appendString:*(void *)(*(void *)(a1 + 32) + 16)];
  [v4 appendString:@"\" deployver=\"Apple iPhone v"];
  [v4 appendString:*(void *)(*(void *)(a1 + 32) + 16)];
  [v4 appendString:@"\" app=\"YGoiPhoneClient\" appver=\"1.0.1."];
  [v4 appendString:*(void *)(*(void *)(a1 + 32) + 8)];
  [v4 appendString:@"\" api=\"finance\" apiver=\"1.0.1\" acknotification=\"0000\""];
  uint64_t v2 = [v4 copy];
  BOOL v3 = (void *)financeRequestAttributes_RequestAttr;
  financeRequestAttributes_RequestAttr = v2;
}

- (id)_urlStringWithHost:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F08708] URLHostAllowedCharacterSet];
  uint64_t v6 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v5];
  id v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  else {
    uint64_t v8 = v4;
  }
  id v9 = v8;

  uint64_t v10 = [(NetPreferences *)self UUID];
  v11 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  __int16 v12 = [v10 stringByAddingPercentEncodingWithAllowedCharacters:v11];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [(NetPreferences *)self UUID];
  }
  v15 = v14;

  uint64_t v16 = [NSString stringWithFormat:@"http://%@/dgw?imei=%@&apptype=finance", v9, v15];

  return v16;
}

- (id)fullQuoteURLOverrideForStock:(id)a3
{
  id v3 = a3;
  id v4 = +[StocksPreferences sharedPreferences];
  id v5 = [v4 objectForKey:@"FullQuoteURLOverridePrefix"];

  uint64_t v6 = +[StocksPreferences sharedPreferences];
  id v7 = [v6 objectForKey:@"FullQuoteURLOverrideSuffix"];

  if ([v5 length])
  {
    uint64_t v8 = [v3 symbol];
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithCapacity:", objc_msgSend(v8, "length") + objc_msgSend(v5, "length") + objc_msgSend(v7, "length"));
    [v9 setString:v5];
    [v9 appendString:v8];
    if ([v7 length]) {
      [v9 appendString:v7];
    }
    uint64_t v10 = objc_msgSend(NSURL, "stocks_sanitizedURLFromString:", v9);
    if (!v10)
    {
      uint64_t v10 = [NSURL URLWithString:v9];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)defaultBacksideLogoURL
{
  uint64_t v2 = [MEMORY[0x263EFF960] currentLocale];
  id v3 = [v2 objectForKey:*MEMORY[0x263EFF500]];
  id v4 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  id v5 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v4];

  uint64_t v6 = [@"http://m.yahoo.com/apple/finance?pintl=" stringByAppendingString:v5];
  id v7 = [NSURL URLWithString:v6];

  return v7;
}

- (id)backsideLogoURL
{
  uint64_t v2 = NSURL;
  id v3 = +[StocksPreferences sharedPreferences];
  id v4 = [v3 objectForKey:@"LogoURL"];
  id v5 = objc_msgSend(v2, "stocks_sanitizedURLFromString:", v4);

  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF960] currentLocale];
    id v7 = [v6 objectForKey:*MEMORY[0x263EFF500]];
    uint64_t v8 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
    id v9 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v8];

    uint64_t v10 = NSURL;
    v11 = [@"http://m.yahoo.com/apple/finance?pintl=" stringByAppendingString:v9];
    id v5 = [v10 URLWithString:v11];
  }

  return v5;
}

- (id)_cacheDirectoryPath
{
  if (_cacheDirectoryPath_onceToken != -1) {
    dispatch_once(&_cacheDirectoryPath_onceToken, &__block_literal_global_121);
  }
  uint64_t v2 = (void *)_cacheDirectoryPath_CacheDirectoryPath;

  return v2;
}

void __37__NetPreferences__cacheDirectoryPath__block_invoke()
{
  id v3 = [MEMORY[0x263F1C408] sharedApplication];
  v0 = [v3 userLibraryDirectory];
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"Caches/Stocks"];
  uint64_t v2 = (void *)_cacheDirectoryPath_CacheDirectoryPath;
  _cacheDirectoryPath_CacheDirectoryPath = v1;
}

- (id)logoButtonImage
{
  uint64_t v2 = (void *)MEMORY[0x263F1C6B0];
  id v3 = +[StocksBundles getBundle:1];
  id v4 = [v2 imageNamed:@"yahooAttributionLogo" inBundle:v3];

  return v4;
}

- (id)logoBacksideImage
{
  uint64_t v2 = (void *)MEMORY[0x263F1C6B0];
  id v3 = +[StocksBundles getBundle:1];
  id v4 = [v2 imageNamed:@"YahooLogo" inBundle:v3];

  return v4;
}

- (BOOL)serviceDebugging
{
  return self->_serviceDebugging;
}

- (id)serviceDebuggingPath
{
  if (serviceDebuggingPath_onceToken != -1) {
    dispatch_once(&serviceDebuggingPath_onceToken, &__block_literal_global_135);
  }
  uint64_t v2 = (void *)serviceDebuggingPath_DebuggingPath;

  return v2;
}

void __38__NetPreferences_serviceDebuggingPath__block_invoke()
{
  v0 = [(id)*MEMORY[0x263F1D020] userLibraryDirectory];
  id v6 = [v0 stringByAppendingPathComponent:@"Stocks"];

  uint64_t v1 = [MEMORY[0x263F08850] defaultManager];
  objc_msgSend(v1, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v6, 0);

  uint64_t v2 = [v6 stringByAppendingPathComponent:@"ServiceDebugging"];
  id v3 = [v2 stringByResolvingSymlinksInPath];
  uint64_t v4 = [v3 copy];
  id v5 = (void *)serviceDebuggingPath_DebuggingPath;
  serviceDebuggingPath_DebuggingPath = v4;
}

- (id)stocksYQLBaseURL
{
  int v2 = MGGetBoolAnswer();
  id v3 = [NSURL fileURLWithPath:@"/private/var/mobile/Library/Preferences/com.apple.stocks.plist"];
  uint64_t v4 = [NSDictionary dictionaryWithContentsOfURL:v3];
  id v5 = [NSNumber numberWithBool:0];
  if (v4)
  {
    uint64_t v6 = [v4 objectForKey:@"staging"];

    id v5 = (void *)v6;
  }
  if (v2 && ([v5 BOOLValue] & 1) != 0) {
    id v7 = @"https://staging-apple-finance.query.yahoo.com/v1/yql";
  }
  else {
    id v7 = @"https://apple-finance.query.yahoo.com/v1/yql";
  }
  uint64_t v8 = [NSURL URLWithString:v7];

  return v8;
}

- (id)signedRequestForURL:(id)a3 parameters:(id)a4
{
  uint64_t v6 = NSString;
  id v7 = a4;
  uint64_t v8 = [a3 absoluteString];
  id v9 = ParameterString(v7);

  uint64_t v10 = [v6 stringWithFormat:@"%@?%@", v8, v9];

  v11 = (void *)MEMORY[0x263EFC5E8];
  __int16 v12 = [NSURL URLWithString:v10];
  uint64_t v13 = [v11 requestWithURL:v12];

  [v13 setHTTPMethod:@"GET"];
  [v13 setHTTPShouldHandleCookies:0];
  id v14 = [(NetPreferences *)self UUID];
  [v13 setValue:v14 forHTTPHeaderField:@"X-Client-UUID"];

  v15 = ClientInfo();
  uint64_t v16 = DeviceInfo();
  if ((![v15 length] || !objc_msgSend(v16, "length"))
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NetPreferences signedRequestForURL:parameters:]();
  }
  [v13 setValue:v15 forHTTPHeaderField:@"X-Client-Info"];
  [v13 setValue:v16 forHTTPHeaderField:@"X-Device-Info"];
  v17 = [(NetPreferences *)self _stocksUserAgent];
  [v13 setValue:v17 forHTTPHeaderField:@"User-Agent"];

  v18 = CreateCredential();
  v19 = (void *)[objc_alloc(MEMORY[0x263F5B5B8]) initWithCredential:v18];
  v20 = [v19 signedURLRequestWithRequest:v13];

  return v20;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_acceptLanguageCode, 0);
  objc_storeStrong((id *)&self->_requestLanguageCode, 0);
  objc_storeStrong((id *)&self->_requestCountryCode, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);

  objc_storeStrong((id *)&self->_buildVersion, 0);
}

- (void)signedRequestForURL:parameters:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_222ED9000, &_os_log_internal, OS_LOG_TYPE_ERROR, "#NetPreferences Warning: You must define Client and Device Info.", v0, 2u);
}

@end