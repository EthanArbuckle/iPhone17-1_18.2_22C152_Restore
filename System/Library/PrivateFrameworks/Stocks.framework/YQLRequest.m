@interface YQLRequest
+ (BOOL)shouldGenerateOfflineData;
+ (void)saveDebugString;
+ (void)setShouldGenerateOfflineData:(BOOL)a3;
- (BOOL)isLoading;
- (YQLRequest)init;
- (id)YQLCountryCode;
- (id)YQLLanguageCode;
- (id)_yahooDoppelganger_taskForRequest:(id)a3 delegate:(id)a4;
- (id)taskForRequest:(id)a3 delegate:(id)a4;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_createDefaultSession;
- (void)_loadDefaultSessionIfNeeded;
- (void)cancel;
- (void)cancelAndInvalidate;
- (void)dealloc;
- (void)didParseData;
- (void)failToParseWithData:(id)a3;
- (void)failToParseWithDataSeriesDictionary:(id)a3;
- (void)failWithError:(id)a3;
- (void)loadRequest:(id)a3;
- (void)parseData:(id)a3;
@end

@implementation YQLRequest

- (id)_yahooDoppelganger_taskForRequest:(id)a3 delegate:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (!activeDoppelgangers)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    v8 = (void *)activeDoppelgangers;
    activeDoppelgangers = (uint64_t)v7;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = (id)preppedDoppelgangers;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v22;
    while (2)
    {
      uint64_t v14 = 0;
      v15 = v12;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v9);
        }
        id v12 = *(id *)(*((void *)&v21 + 1) + 8 * v14);

        if ([v12 matchesRequest:v5])
        {
          [(id)activeDoppelgangers addObject:v12];
          [(id)preppedDoppelgangers removeObject:v12];
          if (v6) {
            [v12 setDelegate:v6];
          }
          [v12 start];
          id v18 = v12;
          v19 = v18;
          goto LABEL_16;
        }
        ++v14;
        v15 = v12;
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  v16 = (void *)testHarness;
  v17 = NSString;
  id v18 = [v5 HTTPBodyString];
  id v9 = [v17 stringWithFormat:@"YahooDoppelganger had no prepared response for the request %@", v18];
  [v16 assertTrue:0 withMessage:v9];
  v19 = 0;
LABEL_16:

  return v19;
}

- (YQLRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)YQLRequest;
  v2 = [(YQLRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(YQLRequest *)v2 _createDefaultSession];
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  defaultSession = self->_defaultSession;
  self->_defaultSession = 0;

  v4.receiver = self;
  v4.super_class = (Class)YQLRequest;
  [(YQLRequest *)&v4 dealloc];
}

- (void)_createDefaultSession
{
  id v7 = [MEMORY[0x263EFC648] defaultSessionConfiguration];
  [v7 setSharedContainerIdentifier:@"group.com.apple.stocks"];
  v3 = (void *)MEMORY[0x263EFC640];
  objc_super v4 = [MEMORY[0x263F08A48] mainQueue];
  id v5 = [v3 sessionWithConfiguration:v7 delegate:self delegateQueue:v4];
  defaultSession = self->_defaultSession;
  self->_defaultSession = v5;
}

- (void)_loadDefaultSessionIfNeeded
{
  if (!self->_defaultSession) {
    [(YQLRequest *)self _createDefaultSession];
  }
}

- (id)taskForRequest:(id)a3 delegate:(id)a4
{
  id v5 = a3;
  [(YQLRequest *)self _loadDefaultSessionIfNeeded];
  objc_super v6 = [(NSURLSession *)self->_defaultSession dataTaskWithRequest:v5];

  return v6;
}

- (void)loadRequest:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_request = &self->_request;
  objc_storeStrong((id *)&self->_request, a3);
  id v7 = [(YQLRequest *)self taskForRequest:self->_request delegate:self];
  dataTask = self->_dataTask;
  self->_dataTask = v7;

  [(NSURLSessionTask *)self->_dataTask resume];
  id v9 = [NSString alloc];
  uint64_t v10 = [(NSURLRequest *)self->_request HTTPBody];
  uint64_t v11 = (void *)[v9 initWithData:v10 encoding:4];

  id v12 = StocksLogForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [(NSURLSessionTask *)self->_dataTask description];
    int v16 = 136315394;
    v17 = "-[YQLRequest loadRequest:]";
    __int16 v18 = 2114;
    v19 = v13;
    _os_log_impl(&dword_222ED9000, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v14 = StocksLogForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[YQLRequest loadRequest:]((id *)p_request, v14);
  }

  v15 = StocksLogForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[YQLRequest loadRequest:]((uint64_t)v11, v15);
  }
}

- (BOOL)isLoading
{
  return self->_dataTask != 0;
}

- (void)parseData:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_222ED9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s to be implemented by subclass", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didParseData
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_222ED9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s to be implemented by subclass", (uint8_t *)&v3, 0xCu);
  }
}

- (void)failWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = StocksLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    [(YQLRequest *)(uint64_t)self failWithError:v5];
  }

  [(YQLRequest *)self cancel];
}

- (void)failToParseWithData:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.stocks" code:4 userInfo:0];
  [(YQLRequest *)self failWithError:v5];

  uint64_t v6 = StocksLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl(&dword_222ED9000, v6, OS_LOG_TYPE_DEFAULT, "#YQLRequest Attempted to parse %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)failToParseWithDataSeriesDictionary:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"error"];
  if (v5)
  {
    id v12 = @"error";
    uint64_t v6 = [v4 objectForKeyedSubscript:@"error"];
    v13[0] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  }
  else
  {
    id v7 = 0;
  }

  int v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.stocks" code:4 userInfo:v7];
  [(YQLRequest *)self failWithError:v8];

  id v9 = StocksLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_222ED9000, v9, OS_LOG_TYPE_DEFAULT, "#YQLRequest Attempted to parse %@", (uint8_t *)&v10, 0xCu);
  }
}

- (void)cancel
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v3 = StocksLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(NSURLSessionTask *)self->_dataTask description];
    int v8 = 136315394;
    id v9 = "-[YQLRequest cancel]";
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_222ED9000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [(NSURLSessionTask *)self->_dataTask cancel];
  dataTask = self->_dataTask;
  self->_dataTask = 0;

  request = self->_request;
  self->_request = 0;

  rawData = self->_rawData;
  self->_rawData = 0;
}

- (void)cancelAndInvalidate
{
  [(NSURLSession *)self->_defaultSession invalidateAndCancel];
  defaultSession = self->_defaultSession;
  self->_defaultSession = 0;
}

+ (void)saveDebugString
{
  v2 = +[NetPreferences sharedPreferences];
  id v4 = [v2 serviceDebuggingPath];

  int v3 = [MEMORY[0x263F08850] defaultManager];
  objc_msgSend(v3, "_web_removeFileOnlyAtPath:", v4);
}

- (id)YQLCountryCode
{
  v2 = +[NetPreferences sharedPreferences];
  int v3 = [v2 stocksCountryCode];

  return v3;
}

- (id)YQLLanguageCode
{
  v2 = +[NetPreferences sharedPreferences];
  int v3 = [v2 stocksLanguageCode];

  return v3;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  rawData = self->_rawData;
  if (rawData)
  {
    id v11 = (NSMutableData *)a5;
    [(NSMutableData *)rawData appendData:v11];
    uint64_t v6 = v11;
  }
  else
  {
    int v8 = (objc_class *)MEMORY[0x263EFF990];
    id v9 = a5;
    __int16 v10 = (NSMutableData *)[[v8 alloc] initWithData:v9];

    uint64_t v6 = self->_rawData;
    self->_rawData = v10;
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = StocksLogForCategory(0);
  __int16 v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[YQLRequest URLSession:task:didCompleteWithError:](v8, v7, v10);
    }

    [(YQLRequest *)self failWithError:v8];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v7 description];
      int v17 = 136315394;
      __int16 v18 = "-[YQLRequest URLSession:task:didCompleteWithError:]";
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      _os_log_impl(&dword_222ED9000, v10, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v17, 0x16u);
    }
    rawData = self->_rawData;
    dataTask = self->_dataTask;
    self->_dataTask = 0;
    uint64_t v14 = rawData;

    request = self->_request;
    self->_request = 0;

    int v16 = self->_rawData;
    self->_rawData = 0;

    [(YQLRequest *)self parseData:v14];
  }
  [(YQLRequest *)self cancelAndInvalidate];
}

+ (void)setShouldGenerateOfflineData:(BOOL)a3
{
  __shouldGenerateOfflineData = a3;
}

+ (BOOL)shouldGenerateOfflineData
{
  return __shouldGenerateOfflineData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawData, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);

  objc_storeStrong((id *)&self->_defaultSession, 0);
}

- (void)loadRequest:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_222ED9000, a2, OS_LOG_TYPE_DEBUG, "#YQLRequest body\n%@", (uint8_t *)&v2, 0xCu);
}

- (void)loadRequest:(id *)a1 .cold.2(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 allHTTPHeaderFields];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_222ED9000, a2, OS_LOG_TYPE_DEBUG, "#YQLRequest headers\n%@", (uint8_t *)&v4, 0xCu);
}

- (void)failWithError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  id v7 = [a2 localizedDescription];
  int v8 = 138412546;
  id v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  _os_log_error_impl(&dword_222ED9000, a3, OS_LOG_TYPE_ERROR, "#%@ failWithError %@", (uint8_t *)&v8, 0x16u);
}

- (void)URLSession:(void *)a1 task:(void *)a2 didCompleteWithError:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v5 = [a1 code];
  uint64_t v6 = [a2 description];
  int v7 = 136315650;
  int v8 = "-[YQLRequest URLSession:task:didCompleteWithError:]";
  __int16 v9 = 1024;
  int v10 = v5;
  __int16 v11 = 2114;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_222ED9000, a3, OS_LOG_TYPE_ERROR, "%s %{errno}d %{public}@", (uint8_t *)&v7, 0x1Cu);
}

@end