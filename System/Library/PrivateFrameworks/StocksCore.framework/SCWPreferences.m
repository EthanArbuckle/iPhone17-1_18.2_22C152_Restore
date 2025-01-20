@interface SCWPreferences
+ (id)sharedPreferences;
+ (void)clearSharedPreferences;
- (NSString)UUID;
- (NSString)acceptLanguageCode;
- (NSString)requestCountryCode;
- (NSString)requestLanguageCode;
- (SCWPreferences)init;
- (id)_stocksAcceptLanguage;
- (id)_stocksUserAgent;
- (id)signedRequestForURL:(id)a3 parameters:(id)a4;
- (id)stocksCountryCode;
- (id)stocksLanguageCode;
- (id)stocksLanguageCodeForLanguage:(id)a3;
- (id)stocksYQLBaseURL;
- (void)resetLocale;
- (void)setAcceptLanguageCode:(id)a3;
- (void)setRequestCountryCode:(id)a3;
- (void)setRequestLanguageCode:(id)a3;
@end

@implementation SCWPreferences

- (id)stocksLanguageCode
{
  v3 = [(SCWPreferences *)self requestLanguageCode];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CA20];
    v7 = [MEMORY[0x1E4F1CA20] systemLanguages];
    v8 = [v6 mostPreferredLanguageOf:v7 forUsage:1 options:0];

    if (![v8 length])
    {
      v9 = [MEMORY[0x1E4F1CA20] currentLocale];
      uint64_t v10 = [v9 languageCode];

      v8 = (void *)v10;
    }
    id v5 = [(SCWPreferences *)self stocksLanguageCodeForLanguage:v8];
  }

  return v5;
}

- (id)stocksLanguageCodeForLanguage:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWPreferences *)self requestLanguageCode];

  if (!v5) {
    [(SCWPreferences *)self setRequestLanguageCode:v4];
  }
  v6 = [(SCWPreferences *)self requestLanguageCode];

  return v6;
}

- (NSString)requestLanguageCode
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_requestLanguageCode;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRequestLanguageCode:(id)a3
{
  id v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  requestLanguageCode = obj->_requestLanguageCode;
  obj->_requestLanguageCode = v4;

  objc_sync_exit(obj);
}

- (id)stocksCountryCode
{
  v3 = [(SCWPreferences *)self requestCountryCode];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v5 = [v4 objectForKey:*MEMORY[0x1E4F1C400]];

    if (v5) {
      uint64_t v6 = (uint64_t)v5;
    }
    else {
      uint64_t v6 = DefaultStocksCountryCode;
    }
    [(SCWPreferences *)self setRequestCountryCode:v6];
  }

  return [(SCWPreferences *)self requestCountryCode];
}

- (NSString)requestCountryCode
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_requestCountryCode;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRequestCountryCode:(id)a3
{
  id v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  requestCountryCode = obj->_requestCountryCode;
  obj->_requestCountryCode = v4;

  objc_sync_exit(obj);
}

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
  id v4 = (void *)_instance;

  return v4;
}

- (SCWPreferences)init
{
  v15.receiver = self;
  v15.super_class = (Class)SCWPreferences;
  id v2 = [(SCWPreferences *)&v15 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/mobile/Library/Preferences/com.apple.stocks.plist"];
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3];
    id v5 = +[SCWSharedPreferences sharedPreferences];
    uint64_t v6 = [v5 objectForKey:@"UUID"];
    UUID = v2->_UUID;
    v2->_UUID = (NSString *)v6;

    if (!v2->_UUID)
    {
      v8 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v9 = [v8 UUIDString];
      uint64_t v10 = v2->_UUID;
      v2->_UUID = (NSString *)v9;

      v11 = +[SCWSharedPreferences sharedPreferences];
      [v11 setObject:v2->_UUID forKey:@"UUID"];
      v12 = [MEMORY[0x1E4F1C9C8] date];
      [v11 setObject:v12 forKey:@"UUIDTimestamp"];

      [v11 synchronize];
    }
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v2 selector:sel_resetLocale name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v2;
}

+ (void)clearSharedPreferences
{
  os_unfair_lock_lock((os_unfair_lock_t)&_accessLock);
  id v2 = (void *)_instance;
  _instance = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_accessLock);
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
  id v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  acceptLanguageCode = obj->_acceptLanguageCode;
  obj->_acceptLanguageCode = v4;

  objc_sync_exit(obj);
}

- (void)resetLocale
{
  [(SCWPreferences *)self setRequestCountryCode:0];
  [(SCWPreferences *)self setRequestLanguageCode:0];

  [(SCWPreferences *)self setAcceptLanguageCode:0];
}

- (id)_stocksAcceptLanguage
{
  v3 = [(SCWPreferences *)self acceptLanguageCode];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    id v5 = [v4 objectAtIndex:0];
    if ([v5 length])
    {
      uint64_t v6 = [v5 stringByAppendingString:@", *"];
      [(SCWPreferences *)self setAcceptLanguageCode:v6];
    }
    else
    {
      [(SCWPreferences *)self setAcceptLanguageCode:@"en, *"];
    }
  }

  return [(SCWPreferences *)self acceptLanguageCode];
}

- (id)_stocksUserAgent
{
  if (_stocksUserAgent_onceToken != -1) {
    dispatch_once(&_stocksUserAgent_onceToken, &__block_literal_global_0);
  }
  id v2 = (void *)_stocksUserAgent_stocksUserAgent;

  return v2;
}

void __34__SCWPreferences__stocksUserAgent__block_invoke()
{
  v0 = NSString;
  id v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v6 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D020]];
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
  uint64_t v4 = [v0 stringWithFormat:@"AppleStocks/%@ Version/%@", v1, v3];
  id v5 = (void *)_stocksUserAgent_stocksUserAgent;
  _stocksUserAgent_stocksUserAgent = v4;
}

- (id)stocksYQLBaseURL
{
  int v2 = MGGetBoolAnswer();
  v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/mobile/Library/Preferences/com.apple.stocks.plist"];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3];
  id v5 = [NSNumber numberWithBool:0];
  if (v4)
  {
    uint64_t v6 = [v4 objectForKey:@"staging"];

    id v5 = (void *)v6;
  }
  if (v2 && ([v5 BOOLValue] & 1) != 0) {
    v7 = @"https://staging-apple-finance.query.yahoo.com/v1/yql";
  }
  else {
    v7 = @"https://apple-finance.query.yahoo.com/v1/yql";
  }
  v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];

  return v8;
}

- (id)signedRequestForURL:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = NSString;
  uint64_t v9 = [v6 absoluteString];
  uint64_t v10 = ParameterString(v7);
  v11 = [v8 stringWithFormat:@"%@?%@", v9, v10];

  v12 = (void *)MEMORY[0x1E4F28E88];
  v13 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
  v14 = [v12 requestWithURL:v13];

  [v14 setHTTPMethod:@"GET"];
  [v14 setHTTPShouldHandleCookies:0];
  objc_super v15 = [(SCWPreferences *)self UUID];
  [v14 setValue:v15 forHTTPHeaderField:@"X-Client-UUID"];

  v16 = ClientInfo();
  v17 = DeviceInfo();
  if (![v16 length] || !objc_msgSend(v17, "length"))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SCWPreferences signedRequestForURL:parameters:]();
    }
    __assert_rtn("-[SCWPreferences signedRequestForURL:parameters:]", "SCWPreferences.m", 328, "0");
  }
  [v14 setValue:v16 forHTTPHeaderField:@"X-Client-Info"];
  [v14 setValue:v17 forHTTPHeaderField:@"X-Device-Info"];
  v18 = [(SCWPreferences *)self _stocksUserAgent];
  [v14 setValue:v18 forHTTPHeaderField:@"User-Agent"];

  v19 = CreateCredential();
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F83918]) initWithCredential:v19];
  v21 = [v20 signedURLRequestWithRequest:v14];

  return v21;
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
}

- (void)signedRequestForURL:parameters:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1AFD01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "#SCWPreferences Warning: You must define Client and Device Info.", v0, 2u);
}

@end