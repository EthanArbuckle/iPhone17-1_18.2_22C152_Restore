@interface YahooDoppelganger
+ (BOOL)canHandleRequest:(id)a3;
+ (BOOL)waitForAllDoppelgangersUpToTimeout:(double)a3;
+ (id)newDoppelgangerMatchingRequestPattern:(id)a3;
+ (id)prepDoppelgangerForChartResponseWithSymbol:(id)a3 numberOfDataPoints:(int64_t)a4;
+ (id)prepDoppelgangerForNewsResponseWithSymbol:(id)a3 numberOfNewsItems:(int64_t)a4;
+ (id)prepDoppelgangerForQuotesResponseWithSymbols:(id)a3 includeMetdata:(BOOL)a4;
+ (id)prepDoppelgangerWithRequestPattern:(id)a3 response:(id)a4;
+ (void)_doppelgangerFinished:(id)a3;
+ (void)_spewDoppelgangerArray:(id)a3 named:(id)a4;
+ (void)clearDoppelgangerData;
+ (void)hookIntoYQLRequestIfNeeded;
+ (void)setTestHarness:(id)a3;
+ (void)spewDoppelgangerData;
- (BOOL)matchesRequest:(id)a3;
- (NSData)response;
- (NSString)expectedRequestPattern;
- (NSURLSessionDataDelegate)delegate;
- (YahooDoppelganger)init;
- (id)description;
- (unint64_t)responseChunkDelay;
- (unint64_t)responseChunkInitialDelay;
- (unint64_t)responseChunkSize;
- (void)_relayDataChunk;
- (void)cancel;
- (void)setDelegate:(id)a3;
- (void)setExpectedRequestPattern:(id)a3;
- (void)setResponse:(id)a3;
- (void)setResponseChunkDelay:(unint64_t)a3;
- (void)setResponseChunkInitialDelay:(unint64_t)a3;
- (void)setResponseChunkSize:(unint64_t)a3;
- (void)start;
@end

@implementation YahooDoppelganger

+ (void)hookIntoYQLRequestIfNeeded
{
  if ((hookIntoYQLRequestIfNeeded_swizzled & 1) == 0)
  {
    v2 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v2, sel_taskForRequest_delegate_);
    method_setImplementation(InstanceMethod, (IMP)[(objc_class *)v2 instanceMethodForSelector:sel__yahooDoppelganger_taskForRequest_delegate_]);
    hookIntoYQLRequestIfNeeded_swizzled = 1;
  }
}

+ (void)setTestHarness:(id)a3
{
}

+ (id)newDoppelgangerMatchingRequestPattern:(id)a3
{
  id v3 = a3;
  if (!preppedDoppelgangers)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    v5 = (void *)preppedDoppelgangers;
    preppedDoppelgangers = (uint64_t)v4;
  }
  v6 = objc_opt_new();
  [v6 setExpectedRequestPattern:v3];
  [(id)preppedDoppelgangers addObject:v6];

  return v6;
}

+ (id)prepDoppelgangerWithRequestPattern:(id)a3 response:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [a1 hookIntoYQLRequestIfNeeded];
  v8 = (void *)[a1 newDoppelgangerMatchingRequestPattern:v7];

  v9 = [v6 dataUsingEncoding:4];

  [v8 setResponse:v9];

  return v8;
}

+ (id)prepDoppelgangerForQuotesResponseWithSymbols:(id)a3 includeMetdata:(BOOL)a4
{
  BOOL v29 = a4;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a3;
  srandom(4u);
  [a1 hookIntoYQLRequestIfNeeded];
  v26 = (void *)[a1 newDoppelgangerMatchingRequestPattern:@".*getquotes.*"];
  id v6 = [MEMORY[0x263F089D8] stringWithString:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?><response><result type=\"getquotes\" timestamp=\"0\">"];
  objc_msgSend(v6, "appendFormat:", @"<list count=\"%lu\" total=\"%lu\">", objc_msgSend(v5, "count"), objc_msgSend(v5, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v5;
  uint64_t v30 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v41;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v7;
        uint64_t v8 = *(void *)(*((void *)&v40 + 1) + 8 * v7);
        [v6 appendString:@"<quote>"];
        [v6 appendFormat:@"<symbol>%@</symbol>", v8];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v9 = [&unk_26D5E9750 countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v37 != v11) {
                objc_enumerationMutation(&unk_26D5E9750);
              }
              uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * i);
              v14 = objc_msgSend(NSString, "stringWithFormat:", @"%f", (float)((float)((float)random() / 214750000.0) + 0.0));
              [v6 appendFormat:@"<%@>%@</%@>", v13, v14, v13];
            }
            uint64_t v10 = [&unk_26D5E9750 countByEnumeratingWithState:&v36 objects:v45 count:16];
          }
          while (v10);
        }
        v15 = objc_msgSend(NSString, "stringWithFormat:", @"%f", (float)((float)((float)random() / 214750000.0) + 0.0));
        [v6 appendFormat:@"<marketcap>%@</marketcap>", v15];

        [v6 appendString:@"<status>1</status>"];
        if (v29)
        {
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          uint64_t v16 = [&unk_26D5E9768 countByEnumeratingWithState:&v32 objects:v44 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v33;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v33 != v18) {
                  objc_enumerationMutation(&unk_26D5E9768);
                }
                uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8 * j);
                v21 = objc_msgSend(NSString, "stringWithFormat:", @"%f", (float)((float)((float)random() / 214750000.0) + 0.0));
                [v6 appendFormat:@"<%@>%@</%@>", v20, v21, v20];
              }
              uint64_t v17 = [&unk_26D5E9768 countByEnumeratingWithState:&v32 objects:v44 count:16];
            }
            while (v17);
          }
          v22 = objc_msgSend(NSString, "stringWithFormat:", @"%f", (float)((float)((float)random() / 214750000.0) + 0.0));
          v23 = objc_msgSend(NSString, "stringWithFormat:", @"%f", (float)((float)((float)random() / 214750000.0) + 0.0));
          [v6 appendFormat:@"<yearrange>%@ - %@</yearrange>", v22, v23];
        }
        [v6 appendString:@"</quote>"];
        uint64_t v7 = v31 + 1;
      }
      while (v31 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v30);
  }

  [v6 appendString:@"</list></result></response>"];
  v24 = [v6 dataUsingEncoding:4];
  [v26 setResponse:v24];

  return v26;
}

+ (id)prepDoppelgangerForNewsResponseWithSymbol:(id)a3 numberOfNewsItems:(int64_t)a4
{
  id v6 = a3;
  srandom(4u);
  [a1 hookIntoYQLRequestIfNeeded];
  uint64_t v7 = (void *)[a1 newDoppelgangerMatchingRequestPattern:@".*getnews.*"];
  uint64_t v8 = (void *)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response;
  if (!prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response)
  {
    v19 = v7;
    uint64_t v9 = [MEMORY[0x263F089D8] stringWithString:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?><response><result type=\"getnews\" timestamp=\"0\"><list count=\"1\" total=\"1\">"];
    uint64_t v10 = (void *)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response;
    prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response = v9;

    [(id)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response appendFormat:@"<feed><symbol>%@</symbol><timestamp>0</timestamp><expires></expires><list count=\"%lu\">", v6, a4];
    if (a4 >= 1)
    {
      do
      {
        [(id)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response appendString:@"<item>"];
        uint64_t v11 = (void *)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response;
        v12 = randomStringOfLength(20, 1);
        [v11 appendFormat:@"<id>%@</id>", v12];

        [(id)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response appendString:@"<timestamp>0</timestamp>"];
        [(id)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response appendString:@"<link>http://apple.com</link>"];
        uint64_t v13 = (void *)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response;
        v14 = randomStringOfLength(40, 1);
        [v13 appendFormat:@"<title>%@</title>", v14];

        v15 = (void *)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response;
        uint64_t v16 = randomStringOfLength(200, 1);
        [v15 appendFormat:@"<summary>%@</summary>", v16];

        [(id)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response appendString:@"</item>"];
        --a4;
      }
      while (a4);
    }
    [(id)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response appendString:@"</list></feed></list></result></response>"];
    uint64_t v8 = (void *)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response;
    uint64_t v7 = v19;
  }
  uint64_t v17 = [v8 dataUsingEncoding:4];
  [v7 setResponse:v17];

  return v7;
}

+ (id)prepDoppelgangerForChartResponseWithSymbol:(id)a3 numberOfDataPoints:(int64_t)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  srandom(4u);
  [a1 hookIntoYQLRequestIfNeeded];
  uint64_t v7 = (void *)[a1 newDoppelgangerMatchingRequestPattern:@".*getchart.*"];
  uint64_t v8 = (void *)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response;
  if (!prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response)
  {
    v21 = v7;
    uint64_t v9 = [MEMORY[0x263F089D8] stringWithString:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?><response><result type=\"getchart\" timestamp=\"0\">"];
    uint64_t v10 = (void *)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response;
    prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response = v9;

    objc_msgSend((id)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response, "appendFormat:", @"<list count=\"%li\" total=\"%li\">", a4, a4);
    id v22 = v6;
    [(id)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response appendFormat:@"<meta><symbol>%@</symbol><marketopen>0</marketopen><marketclose>0</marketclose><gmtoffset>0</gmtoffset></meta>", v6];
    if (a4 >= 1)
    {
      uint64_t v11 = 0;
      int64_t v23 = a4;
      do
      {
        uint64_t v24 = v11;
        [(id)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response appendString:@"<point"];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v12 = [&unk_26D5E9780 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v26 != v14) {
                objc_enumerationMutation(&unk_26D5E9780);
              }
              uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
              uint64_t v17 = (void *)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response;
              uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%f", (float)((float)((float)random() / 214750000.0) + 0.0));
              [v17 appendFormat:@" %@=\"%@\"", v16, v18];
            }
            uint64_t v13 = [&unk_26D5E9780 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v13);
        }
        objc_msgSend((id)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response, "appendFormat:", @" timestamp=\"%li\"></point>", 86400 * v24);
        uint64_t v11 = v24 + 1;
      }
      while (v24 + 1 != v23);
    }
    [(id)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response appendString:@"</list></result></response>"];
    uint64_t v8 = (void *)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response;
    uint64_t v7 = v21;
    id v6 = v22;
  }
  v19 = [v8 dataUsingEncoding:4];
  [v7 setResponse:v19];

  return v7;
}

+ (void)_doppelgangerFinished:(id)a3
{
  id v3 = a3;
  id v6 = v3;
  if (!finishedDoppelgangers)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v5 = (void *)finishedDoppelgangers;
    finishedDoppelgangers = (uint64_t)v4;

    id v3 = v6;
  }
  [(id)activeDoppelgangers removeObject:v3];
  [(id)finishedDoppelgangers addObject:v6];
}

+ (void)_spewDoppelgangerArray:(id)a3 named:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v6;
      _os_log_impl(&dword_222ED9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "  %@", buf, 0xCu);
    }
    id v18 = v6;
    id v19 = v5;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      uint64_t v11 = &_os_log_internal;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v26 = v13;
            _os_log_impl(&dword_222ED9000, v11, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);
          }
          uint64_t v14 = objc_msgSend(v13, "response", v18, v19);

          if (v14 && os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = [NSString alloc];
            uint64_t v16 = [v13 response];
            uint64_t v17 = (void *)[v15 initWithData:v16 encoding:4];
            *(_DWORD *)buf = 138412290;
            id v26 = v17;
            _os_log_impl(&dword_222ED9000, v11, OS_LOG_TYPE_DEFAULT, "      Response: %@", buf, 0xCu);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    id v6 = v18;
    id v5 = v19;
  }
}

+ (void)spewDoppelgangerData
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222ED9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "** Beginning YahooDoppelganger dump **", buf, 2u);
  }
  [a1 _spewDoppelgangerArray:preppedDoppelgangers named:@"Doppelgangers that have not received a request"];
  [a1 _spewDoppelgangerArray:activeDoppelgangers named:@"Doppelgangers actively sending data"];
  [a1 _spewDoppelgangerArray:finishedDoppelgangers named:@"Doppelgangers finished sending data"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_222ED9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "** YahooDoppelganger dump complete **", v3, 2u);
  }
}

+ (void)clearDoppelgangerData
{
  v2 = (void *)preppedDoppelgangers;
  preppedDoppelgangers = 0;

  id v3 = (void *)activeDoppelgangers;
  activeDoppelgangers = 0;

  id v4 = (void *)finishedDoppelgangers;
  finishedDoppelgangers = 0;
}

- (BOOL)matchesRequest:(id)a3
{
  id v4 = [a3 URL];
  id v5 = [v4 absoluteString];

  id v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"self matches %@", self->_expectedRequestPattern];
  LOBYTE(v4) = [v6 evaluateWithObject:v5];

  return (char)v4;
}

- (YahooDoppelganger)init
{
  v3.receiver = self;
  v3.super_class = (Class)YahooDoppelganger;
  result = [(YahooDoppelganger *)&v3 init];
  if (result) {
    result->_responseChunkSize = -1;
  }
  return result;
}

- (void)setResponseChunkSize:(unint64_t)a3
{
  self->_responseChunkSize = a3;
}

+ (BOOL)waitForAllDoppelgangersUpToTimeout:(double)a3
{
  float v4 = 0.0;
  do
  {
    uint64_t v5 = [(id)activeDoppelgangers count];
    if (!v5) {
      break;
    }
    id v6 = [MEMORY[0x263EFF9F0] currentRunLoop];
    id v7 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.100000001];
    [v6 runUntilDate:v7];

    float v4 = v4 + 0.1;
  }
  while (v4 < a3);
  return v5 == 0;
}

- (void)_relayDataChunk
{
  if (!self->_cancelled)
  {
    unint64_t responseChunkSize = self->_responseChunkSize;
    NSUInteger v4 = [(NSData *)self->_response length];
    unint64_t responseOffset = self->_responseOffset;
    if (responseChunkSize >= v4 - responseOffset) {
      unint64_t v6 = v4 - responseOffset;
    }
    else {
      unint64_t v6 = responseChunkSize;
    }
    id v7 = -[NSData subdataWithRange:](self->_response, "subdataWithRange:");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 URLSession:self->_session dataTask:self->_dataTask didReceiveData:v7];
    }
    unint64_t v11 = self->_responseOffset + v6;
    self->_unint64_t responseOffset = v11;
    if (v11 == [(NSData *)self->_response length])
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        id v14 = objc_loadWeakRetained((id *)&self->_delegate);
        [v14 URLSession:self->_session task:self->_dataTask didCompleteWithError:0];
      }
      [(id)objc_opt_class() _doppelgangerFinished:self];
    }
    else
    {
      dispatch_time_t v15 = dispatch_time(0, 1000000 * self->_responseChunkDelay);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __36__YahooDoppelganger__relayDataChunk__block_invoke;
      block[3] = &unk_26467D130;
      block[4] = self;
      dispatch_after(v15, MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __36__YahooDoppelganger__relayDataChunk__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _relayDataChunk];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<YahooDoppelganger at %p for pattern: %@>", self, self->_expectedRequestPattern];
}

- (void)start
{
  dispatch_time_t v3 = dispatch_time(0, 1000000 * self->_responseChunkInitialDelay);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__YahooDoppelganger_start__block_invoke;
  block[3] = &unk_26467D130;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

uint64_t __26__YahooDoppelganger_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _relayDataChunk];
}

- (void)cancel
{
  self->_cancelled = 1;
}

+ (BOOL)canHandleRequest:(id)a3
{
  return 1;
}

- (NSString)expectedRequestPattern
{
  return self->_expectedRequestPattern;
}

- (void)setExpectedRequestPattern:(id)a3
{
}

- (NSData)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (unint64_t)responseChunkSize
{
  return self->_responseChunkSize;
}

- (unint64_t)responseChunkDelay
{
  return self->_responseChunkDelay;
}

- (void)setResponseChunkDelay:(unint64_t)a3
{
  self->_responseChunkDelay = a3;
}

- (unint64_t)responseChunkInitialDelay
{
  return self->_responseChunkInitialDelay;
}

- (void)setResponseChunkInitialDelay:(unint64_t)a3
{
  self->_responseChunkInitialDelay = a3;
}

- (NSURLSessionDataDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NSURLSessionDataDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_expectedRequestPattern, 0);
}

@end