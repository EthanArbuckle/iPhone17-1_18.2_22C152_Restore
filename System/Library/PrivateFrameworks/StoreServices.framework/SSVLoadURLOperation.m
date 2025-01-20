@interface SSVLoadURLOperation
+ (id)currentAcceptLanguage;
- (BOOL)_shouldRetryAfterMachineDataRequest:(id)a3;
- (BOOL)isITunesStoreRequest;
- (BOOL)recordsMetrics;
- (BOOL)shouldSuppressCookies;
- (BOOL)shouldSuppressUserInfo;
- (NSCachedURLResponse)cachedURLResponse;
- (NSData)rawResponseData;
- (NSHTTPURLResponse)URLResponse;
- (NSNumber)metricsLoadURLSamplingPercentage;
- (NSNumber)metricsLoadURLSamplingPercentageCachedResponses;
- (NSNumber)metricsLoadURLSessionDuration;
- (NSString)referrerApplicationName;
- (NSString)referrerURLString;
- (NSString)storeFrontSuffix;
- (NSURL)URL;
- (NSURL)mainDocumentURL;
- (NSURLRequest)URLRequest;
- (SSBag)bag;
- (SSMetricsPageEvent)metricsPageEvent;
- (SSURLRequestProperties)requestProperties;
- (SSVFairPlaySAPSession)SAPSession;
- (SSVLoadURLOperation)initWithData:(id)a3 fromOperation:(id)a4;
- (SSVLoadURLOperation)initWithURL:(id)a3;
- (SSVLoadURLOperation)initWithURLRequest:(id)a3;
- (SSVLoadURLOperation)initWithURLRequestProperties:(id)a3;
- (SSVLoadURLOperationDelegate)delegate;
- (SSVSAPSignaturePolicy)SAPSignaturePolicy;
- (SSVURLDataConsumer)dataConsumer;
- (id)_dataForCachedResponse:(_CFCachedURLResponse *)a3;
- (id)_initSSVLoadURLOperation;
- (id)_newURLRequestWithRedirectURL:(id)a3;
- (id)_outputForData:(id)a3 error:(id *)a4;
- (id)expiredOutputBlock;
- (id)outputBlock;
- (id)prepareRequestBlock;
- (int)_runRunLoopUntilStopped;
- (int64_t)machineDataStyle;
- (unint64_t)attribution;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithEvent:(id)a5 error:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_addMachineDataHeadersToRequest:(id)a3 withAccountIdentifier:(id)a4;
- (void)_addSAPSignatureToRequest:(id)a3;
- (void)_applyResponseToMetrics:(id)a3;
- (void)_configureWithURLBagInterpreter:(id)a3;
- (void)_createAuthKitSession;
- (void)_finishWithData:(id)a3;
- (void)_finishWithOutput:(id)a3 error:(id)a4;
- (void)_loadURLBagInterpreter;
- (void)_releaseOutputBlocks;
- (void)_runOnce;
- (void)_stopIfCancelled;
- (void)_stopRunLoop;
- (void)cancel;
- (void)configureWithURLBag:(id)a3;
- (void)configureWithURLBagDictionary:(id)a3;
- (void)dispatchAsync:(id)a3;
- (void)dispatchSync:(id)a3;
- (void)main;
- (void)setAttribution:(unint64_t)a3;
- (void)setBag:(id)a3;
- (void)setDataConsumer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setITunesStoreRequest:(BOOL)a3;
- (void)setMachineDataStyle:(int64_t)a3;
- (void)setMainDocumentURL:(id)a3;
- (void)setOutputBlock:(id)a3;
- (void)setPrepareRequestBlock:(id)a3;
- (void)setRecordsMetrics:(BOOL)a3;
- (void)setReferrerApplicationName:(id)a3;
- (void)setReferrerURLString:(id)a3;
- (void)setSAPSession:(id)a3;
- (void)setSAPSignaturePolicy:(id)a3;
- (void)setShouldSuppressCookies:(BOOL)a3;
- (void)setShouldSuppressUserInfo:(BOOL)a3;
- (void)setStoreFrontSuffix:(id)a3;
@end

@implementation SSVLoadURLOperation

- (id)_initSSVLoadURLOperation
{
  v6.receiver = self;
  v6.super_class = (Class)SSVLoadURLOperation;
  v2 = [(SSVLoadURLOperation *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreServices.SSVLoadURLOperation", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_iTunesStoreRequest = 1;
    v2->_shouldSuppressCookies = 0;
    v2->_shouldSuppressUserInfo = 0;
    v2->_attribution = 0;
    v2->_recordsMetrics = 1;
  }
  return v2;
}

- (SSVLoadURLOperation)initWithData:(id)a3 fromOperation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(SSVLoadURLOperation *)self _initSSVLoadURLOperation];
  v10 = (SSVLoadURLOperation *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 35, a3);
    v10->_iTunesStoreRequest = [v8 isITunesStoreRequest];
    v10->_shouldSuppressCookies = [v8 shouldSuppressCookies];
    v10->_shouldSuppressUserInfo = [v8 shouldSuppressUserInfo];
    uint64_t v11 = [v8 metricsPageEvent];
    metricsPageEvent = v10->_metricsPageEvent;
    v10->_metricsPageEvent = (SSMetricsPageEvent *)v11;

    v10->_recordsMetrics = [v8 recordsMetrics];
    uint64_t v13 = [v8 storeFrontSuffix];
    storeFrontSuffix = v10->_storeFrontSuffix;
    v10->_storeFrontSuffix = (NSString *)v13;

    uint64_t v15 = [v8 URLRequest];
    urlRequest = v10->_urlRequest;
    v10->_urlRequest = (NSURLRequest *)v15;
  }
  return v10;
}

- (SSVLoadURLOperation)initWithURL:(id)a3
{
  v4 = [MEMORY[0x1E4F290D0] requestWithURL:a3];
  v5 = [(SSVLoadURLOperation *)self initWithURLRequest:v4];

  return v5;
}

- (SSVLoadURLOperation)initWithURLRequest:(id)a3
{
  id v4 = a3;
  v5 = [(SSVLoadURLOperation *)self _initSSVLoadURLOperation];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    urlRequest = v5->_urlRequest;
    v5->_urlRequest = (NSURLRequest *)v6;
  }
  return v5;
}

- (SSVLoadURLOperation)initWithURLRequestProperties:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F28E88]);
  id v7 = [v5 URL];
  uint64_t v8 = [v5 cachePolicy];
  [v5 timeoutInterval];
  v9 = objc_msgSend(v6, "initWithURL:cachePolicy:timeoutInterval:", v7, v8);

  v10 = [v5 HTTPBody];
  [v9 setHTTPBody:v10];

  uint64_t v11 = [v5 HTTPMethod];
  [v9 setHTTPMethod:v11];

  objc_msgSend(v9, "setNetworkServiceType:", objc_msgSend(v5, "networkServiceType"));
  v12 = [v5 HTTPHeaders];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__SSVLoadURLOperation_initWithURLRequestProperties___block_invoke;
  v16[3] = &unk_1E5BA8D80;
  id v13 = v9;
  id v17 = v13;
  [v12 enumerateKeysAndObjectsUsingBlock:v16];
  if (objc_opt_respondsToSelector())
  {
    [v13 _CFURLRequest];
    if (([v5 shouldDecodeResponse] & 1) == 0) {
      _CFURLRequestSetProtocolProperty();
    }
  }
  v14 = [(SSVLoadURLOperation *)self initWithURLRequest:v13];
  if (v14)
  {
    -[SSVLoadURLOperation setITunesStoreRequest:](v14, "setITunesStoreRequest:", [v5 isITunesStoreRequest]);
    -[SSVLoadURLOperation setMachineDataStyle:](v14, "setMachineDataStyle:", [v5 machineDataStyle]);
    objc_storeStrong((id *)&v14->_requestProperties, a3);
  }

  return v14;
}

uint64_t __52__SSVLoadURLOperation_initWithURLRequestProperties___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (NSCachedURLResponse)cachedURLResponse
{
  id v2 = [(SSVLoadURLOperation *)self _newURLRequestWithRedirectURL:0];
  dispatch_queue_t v3 = [MEMORY[0x1E4F29078] sharedURLCache];
  id v4 = [v3 cachedResponseForRequest:v2];

  return (NSCachedURLResponse *)v4;
}

- (void)configureWithURLBag:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__SSVLoadURLOperation_configureWithURLBag___block_invoke;
  v6[3] = &unk_1E5BA7018;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVLoadURLOperation *)self dispatchAsync:v6];
}

void __43__SSVLoadURLOperation_configureWithURLBag___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 432), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = *(void **)(v2 + 440);
  *(void *)(v2 + 440) = 0;
}

- (void)configureWithURLBagDictionary:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SSVLoadURLOperation_configureWithURLBagDictionary___block_invoke;
  v6[3] = &unk_1E5BA7018;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVLoadURLOperation *)self dispatchAsync:v6];
}

void __53__SSVLoadURLOperation_configureWithURLBagDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = *(void **)(v2 + 432);
  *(void *)(v2 + 432) = 0;

  id v4 = [[SSVURLBagInterpreter alloc] initWithURLBagDictionary:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 440);
  *(void *)(v5 + 440) = v4;
}

+ (id)currentAcceptLanguage
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!+[SSDevice deviceIsAudioAccessory]) {
    goto LABEL_26;
  }
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  dispatch_queue_t v3 = [v2 objectForKey:@"AppleLanguageCodeSetup"];

  uint64_t v4 = +[SSLogConfig sharedConfig];
  uint64_t v5 = (void *)v4;
  if (!v3)
  {
    if (!v4)
    {
      uint64_t v5 = +[SSLogConfig sharedConfig];
    }
    int v18 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    v20 = [v5 OSLogObject];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
      v19 &= 2u;
    }
    if (v19)
    {
      *(_DWORD *)v35 = 138543362;
      *(void *)&v35[4] = objc_opt_class();
      id v21 = *(id *)&v35[4];
      LODWORD(v34) = 12;
      v33 = v35;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_25:

LABEL_26:
        v29 = objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", v33);
        uint64_t v5 = [v29 objectForKey:@"AppleLanguages"];

        dispatch_queue_t v3 = [v5 firstObject];
        goto LABEL_27;
      }
      v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, v35, v34, *(_OWORD *)v35);
      free(v22);
      SSFileLog(v5, @"%@", v23, v24, v25, v26, v27, v28, (uint64_t)v20);
    }

    goto LABEL_25;
  }
  if (!v4)
  {
    uint64_t v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  uint64_t v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (v7)
  {
    v9 = objc_opt_class();
    id v10 = v9;
    SSHashIfNeeded(v3);
    *(_DWORD *)v35 = 138543618;
    *(void *)&v35[4] = v9;
    *(void *)&v35[14] = *(_WORD *)&v35[12] = 2114;
    LODWORD(v34) = 22;
    uint64_t v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_27;
    }
    uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, v35, v34);
    free(v11);
    SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v8);
  }

LABEL_27:
  if (v3) {
    v30 = v3;
  }
  else {
    v30 = @"en";
  }
  v31 = v30;

  return v31;
}

- (SSVURLDataConsumer)dataConsumer
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__SSVLoadURLOperation_dataConsumer__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVLoadURLOperation *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SSVURLDataConsumer *)v2;
}

void __35__SSVLoadURLOperation_dataConsumer__block_invoke(uint64_t a1)
{
}

- (void)dispatchAsync:(id)a3
{
}

- (void)dispatchSync:(id)a3
{
}

- (id)expiredOutputBlock
{
  return 0;
}

- (BOOL)isITunesStoreRequest
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__SSVLoadURLOperation_isITunesStoreRequest__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVLoadURLOperation *)self dispatchSync:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __43__SSVLoadURLOperation_isITunesStoreRequest__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 288);
  return result;
}

- (int64_t)machineDataStyle
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__SSVLoadURLOperation_machineDataStyle__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVLoadURLOperation *)self dispatchSync:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __39__SSVLoadURLOperation_machineDataStyle__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 304);
  return result;
}

- (SSMetricsPageEvent)metricsPageEvent
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__SSVLoadURLOperation_metricsPageEvent__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVLoadURLOperation *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SSMetricsPageEvent *)v2;
}

void __39__SSVLoadURLOperation_metricsPageEvent__block_invoke(uint64_t a1)
{
}

- (id)outputBlock
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__28;
  v9 = __Block_byref_object_dispose__29;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__SSVLoadURLOperation_outputBlock__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVLoadURLOperation *)self dispatchSync:v4];
  id v2 = (void *)MEMORY[0x1A6268200](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __34__SSVLoadURLOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 320) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)prepareRequestBlock
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__28;
  v9 = __Block_byref_object_dispose__29;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__SSVLoadURLOperation_prepareRequestBlock__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVLoadURLOperation *)self dispatchSync:v4];
  uint64_t v2 = (void *)MEMORY[0x1A6268200](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__SSVLoadURLOperation_prepareRequestBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 328) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)recordsMetrics
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__SSVLoadURLOperation_recordsMetrics__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVLoadURLOperation *)self dispatchSync:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __37__SSVLoadURLOperation_recordsMetrics__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 344);
  return result;
}

- (NSString)referrerApplicationName
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__SSVLoadURLOperation_referrerApplicationName__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVLoadURLOperation *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __46__SSVLoadURLOperation_referrerApplicationName__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 360) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)referrerURLString
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__SSVLoadURLOperation_referrerURLString__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVLoadURLOperation *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __40__SSVLoadURLOperation_referrerURLString__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 368) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (SSVFairPlaySAPSession)SAPSession
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__SSVLoadURLOperation_SAPSession__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVLoadURLOperation *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SSVFairPlaySAPSession *)v2;
}

void __33__SSVLoadURLOperation_SAPSession__block_invoke(uint64_t a1)
{
}

- (SSVSAPSignaturePolicy)SAPSignaturePolicy
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__SSVLoadURLOperation_SAPSignaturePolicy__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVLoadURLOperation *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SSVSAPSignaturePolicy *)v2;
}

void __41__SSVLoadURLOperation_SAPSignaturePolicy__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 400) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setDataConsumer:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__SSVLoadURLOperation_setDataConsumer___block_invoke;
  v6[3] = &unk_1E5BA7018;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVLoadURLOperation *)self dispatchAsync:v6];
}

void __39__SSVLoadURLOperation_setDataConsumer___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  uint64_t v2 = (id *)(*(void *)(a1 + 32) + 264);
  if (*v2 != v1) {
    objc_storeStrong(v2, v1);
  }
}

- (void)setITunesStoreRequest:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__SSVLoadURLOperation_setITunesStoreRequest___block_invoke;
  v3[3] = &unk_1E5BA8060;
  v3[4] = self;
  BOOL v4 = a3;
  [(SSVLoadURLOperation *)self dispatchAsync:v3];
}

uint64_t __45__SSVLoadURLOperation_setITunesStoreRequest___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 288) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setMachineDataStyle:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__SSVLoadURLOperation_setMachineDataStyle___block_invoke;
  v3[3] = &unk_1E5BA8DA8;
  v3[4] = self;
  void v3[5] = a3;
  [(SSVLoadURLOperation *)self dispatchAsync:v3];
}

uint64_t __43__SSVLoadURLOperation_setMachineDataStyle___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 304) = *(void *)(result + 40);
  return result;
}

- (void)setOutputBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__SSVLoadURLOperation_setOutputBlock___block_invoke;
  v6[3] = &unk_1E5BA7350;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVLoadURLOperation *)self dispatchAsync:v6];
}

void __38__SSVLoadURLOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 320) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(void **)(v5 + 320);
    *(void *)(v5 + 320) = v4;
  }
}

- (void)setPrepareRequestBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__SSVLoadURLOperation_setPrepareRequestBlock___block_invoke;
  v6[3] = &unk_1E5BA7350;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVLoadURLOperation *)self dispatchAsync:v6];
}

void __46__SSVLoadURLOperation_setPrepareRequestBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 328) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(void **)(v5 + 328);
    *(void *)(v5 + 328) = v4;
  }
}

- (void)setRecordsMetrics:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__SSVLoadURLOperation_setRecordsMetrics___block_invoke;
  v3[3] = &unk_1E5BA8060;
  v3[4] = self;
  BOOL v4 = a3;
  [(SSVLoadURLOperation *)self dispatchAsync:v3];
}

uint64_t __41__SSVLoadURLOperation_setRecordsMetrics___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 344) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setReferrerApplicationName:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SSVLoadURLOperation_setReferrerApplicationName___block_invoke;
  v6[3] = &unk_1E5BA7018;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVLoadURLOperation *)self dispatchAsync:v6];
}

void __50__SSVLoadURLOperation_setReferrerApplicationName___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 360) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(void **)(v5 + 360);
    *(void *)(v5 + 360) = v4;
  }
}

- (void)setReferrerURLString:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__SSVLoadURLOperation_setReferrerURLString___block_invoke;
  v6[3] = &unk_1E5BA7018;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVLoadURLOperation *)self dispatchAsync:v6];
}

void __44__SSVLoadURLOperation_setReferrerURLString___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 368) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(void **)(v5 + 368);
    *(void *)(v5 + 368) = v4;
  }
}

- (void)setSAPSession:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__SSVLoadURLOperation_setSAPSession___block_invoke;
  v6[3] = &unk_1E5BA7018;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVLoadURLOperation *)self dispatchAsync:v6];
}

void __37__SSVLoadURLOperation_setSAPSession___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  uint64_t v2 = (id *)(*(void *)(a1 + 32) + 392);
  if (*v2 != v1) {
    objc_storeStrong(v2, v1);
  }
}

- (void)setSAPSignaturePolicy:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__SSVLoadURLOperation_setSAPSignaturePolicy___block_invoke;
  v6[3] = &unk_1E5BA7018;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVLoadURLOperation *)self dispatchAsync:v6];
}

void __45__SSVLoadURLOperation_setSAPSignaturePolicy___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 400) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(void **)(v5 + 400);
    *(void *)(v5 + 400) = v4;
  }
}

- (void)setStoreFrontSuffix:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__SSVLoadURLOperation_setStoreFrontSuffix___block_invoke;
  v6[3] = &unk_1E5BA7018;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVLoadURLOperation *)self dispatchAsync:v6];
}

void __43__SSVLoadURLOperation_setStoreFrontSuffix___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 416) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(void **)(v5 + 416);
    *(void *)(v5 + 416) = v4;
  }
}

- (NSString)storeFrontSuffix
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__SSVLoadURLOperation_storeFrontSuffix__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVLoadURLOperation *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __39__SSVLoadURLOperation_storeFrontSuffix__block_invoke(uint64_t a1)
{
}

- (NSURL)URL
{
  return [(NSURLRequest *)self->_urlRequest URL];
}

- (NSURLRequest)URLRequest
{
  return self->_urlRequest;
}

- (NSHTTPURLResponse)URLResponse
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__SSVLoadURLOperation_URLResponse__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVLoadURLOperation *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSHTTPURLResponse *)v2;
}

void __34__SSVLoadURLOperation_URLResponse__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 376) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)SSVLoadURLOperation;
  [(SSVLoadURLOperation *)&v3 cancel];
  [(SSVLoadURLOperation *)self _stopRunLoop];
}

- (void)main
{
  if (self->_inputData)
  {
    -[SSVLoadURLOperation _finishWithData:](self, "_finishWithData:");
  }
  else
  {
    uint64_t v3 = [(SSVLoadURLOperation *)self shouldSuppressUserInfo];
    if ((v3 & 1) == 0) {
      uint64_t v3 = [(SSVLoadURLOperation *)self _createAuthKitSession];
    }
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x2020000000;
    char v9 = 1;
    while (*((unsigned char *)v7 + 24))
    {
      uint64_t v4 = (void *)MEMORY[0x1A6267F60](v3);
      [(SSVLoadURLOperation *)self _runOnce];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __27__SSVLoadURLOperation_main__block_invoke;
      v5[3] = &unk_1E5BA6F30;
      v5[4] = self;
      v5[5] = &v6;
      [(SSVLoadURLOperation *)self dispatchSync:v5];
    }
    _Block_object_dispose(&v6, 8);
  }
  [(SSVLoadURLOperation *)self setPrepareRequestBlock:0];
}

uint64_t __27__SSVLoadURLOperation_main__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 408);
  return result;
}

- (NSNumber)metricsLoadURLSessionDuration
{
  uint64_t v3 = [(SSVLoadURLOperation *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(SSVLoadURLOperation *)self delegate];
    uint64_t v6 = [v5 metricsLoadURLSessionDuration];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (NSNumber *)v6;
}

- (NSNumber)metricsLoadURLSamplingPercentage
{
  uint64_t v3 = [(SSVLoadURLOperation *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(SSVLoadURLOperation *)self delegate];
    uint64_t v6 = [v5 metricsLoadURLSamplingPercentage];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (NSNumber *)v6;
}

- (NSNumber)metricsLoadURLSamplingPercentageCachedResponses
{
  uint64_t v3 = [(SSVLoadURLOperation *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(SSVLoadURLOperation *)self delegate];
    uint64_t v6 = [v5 metricsLoadURLSamplingPercentageCachedResponses];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (NSNumber *)v6;
}

- (SSURLRequestProperties)requestProperties
{
  return self->_requestProperties;
}

- (NSData)rawResponseData
{
  return (NSData *)self->_dataBuffer;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithEvent:(id)a5 error:(id)a6
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v60 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    [(SSVLoadURLOperation *)self _finishWithOutput:0 error:v12];
    [(SSVLoadURLOperation *)self _stopRunLoop];
    goto LABEL_41;
  }
  id v13 = v10;
  uint64_t v105 = 0;
  v106 = &v105;
  uint64_t v107 = 0x3032000000;
  v108 = __Block_byref_object_copy__10;
  v109 = __Block_byref_object_dispose__10;
  id v110 = 0;
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x2020000000;
  char v104 = 0;
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__10;
  v99 = __Block_byref_object_dispose__10;
  id v100 = 0;
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x3032000000;
  v92 = __Block_byref_object_copy__10;
  v93 = __Block_byref_object_dispose__10;
  id v94 = 0;
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__10;
  v87 = __Block_byref_object_dispose__10;
  id v88 = 0;
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__10;
  v81 = __Block_byref_object_dispose__10;
  id v82 = 0;
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __66__SSVLoadURLOperation_URLSession_task_didCompleteWithEvent_error___block_invoke;
  v69[3] = &unk_1E5BA8DD0;
  v69[4] = self;
  id v70 = v11;
  v71 = &v105;
  v72 = &v101;
  v73 = &v95;
  v74 = &v89;
  v75 = &v83;
  v76 = &v77;
  [(SSVLoadURLOperation *)self dispatchSync:v69];
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  BOOL shouldRetry = self->_shouldRetry;
  if (v96[5])
  {
    if (v84[5])
    {
      uint64_t v14 = [(id)v78[5] allHeaderFields];
      uint64_t v15 = HeaderValueForKey(v14, @"X-Apple-ActionSignature");

      if (!v15
        || ([(id)v84[5] dataToSignWithURLResponse:v78[5] responseData:v90[5]],
            uint64_t v16 = objc_claimAutoreleasedReturnValue(),
            uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v15 options:0], v18 = objc_msgSend((id)v96[5], "verifyData:withSignature:error:", v16, v17, 0), v17, v16, v15, (v18 & 1) == 0))
      {
        SSError(@"SSErrorDomain", 122, 0, 0);
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        id v38 = 0;
        *((unsigned char *)v66 + 24) = 0;
        goto LABEL_38;
      }
    }
  }
  int v19 = (void *)v78[5];
  if (v19 && *((unsigned char *)v102 + 24))
  {
    v58 = [v19 allHeaderFields];
    v59 = HeaderValueForKey(v58, @"X-Set-Apple-Store-Front");
    if (![v59 length]) {
      goto LABEL_25;
    }
    v20 = +[SSLogConfig sharedAccountsConfig];
    if (!v20)
    {
      v20 = +[SSLogConfig sharedConfig];
    }
    int v21 = [v20 shouldLog];
    int v22 = [v20 shouldLogToDisk];
    uint64_t v23 = [v20 OSLogObject];
    uint64_t v24 = v23;
    if (v22) {
      int v25 = v21 | 2;
    }
    else {
      int v25 = v21;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      int v26 = v25;
    }
    else {
      int v26 = v25 & 2;
    }
    if (v26)
    {
      id v10 = v13;
      id v27 = (id)objc_opt_class();
      id v57 = [(id)v78[5] URL];
      v56 = +[SSAccountStore defaultStore];
      v55 = [v56 activeAccount];
      id v28 = [v55 hashedDescription];
      v29 = SSHashIfNeeded(v59);
      int v111 = 138544130;
      id v112 = v27;
      __int16 v113 = 2114;
      id v114 = v57;
      __int16 v115 = 2114;
      id v116 = v28;
      __int16 v117 = 2114;
      v118 = v29;
      LODWORD(v54) = 42;
      v53 = &v111;
      v30 = (void *)_os_log_send_and_compose_impl();

      if (!v30)
      {
LABEL_24:

        v39 = +[SSDevice currentDevice];
        v40 = [v60 originalRequest];
        uint64_t v41 = v78[5];
        v42 = +[SSAccountStore defaultStore];
        v43 = [v42 activeAccount];
        [v39 setStoreFrontIdentifier:v59 forRequest:v40 response:v41 account:v43];

LABEL_25:
        v44 = [SSMachineDataRequest alloc];
        v45 = [(SSMachineDataRequest *)v44 initWithURLResponse:v78[5]];
        if (v45
          && [(SSVLoadURLOperation *)self _shouldRetryAfterMachineDataRequest:v45])
        {
          v46 = [(id)v78[5] URL];
          redirectURL = self->_redirectURL;
          self->_redirectURL = v46;

          *((unsigned char *)v66 + 24) = 1;
          self->_BOOL shouldRetry = 1;
        }

        goto LABEL_29;
      }
      uint64_t v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v30, 4, &v111, v54);
      free(v30);
      SSFileLog(v20, @"%@", v31, v32, v33, v34, v35, v36, (uint64_t)v24);
    }
    else
    {
      id v10 = v13;
    }

    goto LABEL_24;
  }
LABEL_29:
  v48 = (void *)v106[5];
  v49 = (void *)v90[5];
  if (v48)
  {
    uint64_t v50 = v78[5];
    id v64 = 0;
    id v38 = [v48 objectForData:v49 response:v50 error:&v64];
    id v37 = v64;
    if (!v38) {
      goto LABEL_33;
    }
  }
  else
  {
    id v38 = v49;
    id v37 = 0;
    if (!v38)
    {
LABEL_33:
      if (*((unsigned char *)v102 + 24))
      {
        v51 = SSVProtocolRedirectURLForResponse((void *)v78[5], (void *)v90[5]);
        v52 = v51;
        if (v51)
        {
          v61[0] = MEMORY[0x1E4F143A8];
          v61[1] = 3221225472;
          v61[2] = __66__SSVLoadURLOperation_URLSession_task_didCompleteWithEvent_error___block_invoke_42;
          v61[3] = &unk_1E5BA8DF8;
          v61[4] = self;
          id v62 = v51;
          v63 = &v65;
          [(SSVLoadURLOperation *)self dispatchSync:v61];
        }
      }
      id v38 = 0;
    }
  }
LABEL_38:
  if (!*((unsigned char *)v66 + 24)) {
    [(SSVLoadURLOperation *)self _finishWithOutput:v38 error:v37];
  }
  [(SSVLoadURLOperation *)self _stopRunLoop];
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v83, 8);

  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(&v95, 8);

  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v105, 8);

LABEL_41:
}

void __66__SSVLoadURLOperation_URLSession_task_didCompleteWithEvent_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 312);
  if (v3)
  {
    [v3 setReferringAppName:*(void *)(v2 + 360)];
    [*(id *)(*(void *)(a1 + 32) + 312) setReferringURL:*(void *)(*(void *)(a1 + 32) + 368)];
    char v4 = *(void **)(*(void *)(a1 + 32) + 312);
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    [v5 timeIntervalSince1970];
    objc_msgSend(v4, "setResponseEndTime:");

    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    if (v6)
    {
      objc_msgSend(*(id *)(v2 + 312), "setCachedResponse:", objc_msgSend(v6, "cachedResponse"));
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 312), "setConnectionReused:", objc_msgSend(*(id *)(a1 + 40), "connectionReused"));
      uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 312);
      uint64_t v8 = [*(id *)(a1 + 40) clientCorrelationKey];
      [v7 setClientCorrelationKey:v8];

      char v9 = *(void **)(*(void *)(a1 + 32) + 312);
      [*(id *)(a1 + 40) connectionEndTime];
      objc_msgSend(v9, "setConnectionEndTime:");
      id v10 = *(void **)(*(void *)(a1 + 32) + 312);
      [*(id *)(a1 + 40) connectionStartTime];
      objc_msgSend(v10, "setConnectionStartTime:");
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 312), "setConnectionStartNStatRXBytes:", objc_msgSend(*(id *)(a1 + 40), "connectionStartNStatRXBytes"));
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 312), "setConnectionStartNStatTXBytes:", objc_msgSend(*(id *)(a1 + 40), "connectionStartNStatTXBytes"));
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 312), "setConnectionStopNStatRXBytes:", objc_msgSend(*(id *)(a1 + 40), "connectionStopNStatRXBytes"));
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 312), "setConnectionStopNStatTXBytes:", objc_msgSend(*(id *)(a1 + 40), "connectionStopNStatTXBytes"));
      id v11 = *(void **)(*(void *)(a1 + 32) + 312);
      [*(id *)(a1 + 40) domainLookupEndTime];
      objc_msgSend(v11, "setDomainLookupEndTime:");
      id v12 = *(void **)(*(void *)(a1 + 32) + 312);
      [*(id *)(a1 + 40) domainLookupStartTime];
      objc_msgSend(v12, "setDomainLookupStartTime:");
      id v13 = *(void **)(*(void *)(a1 + 32) + 312);
      [*(id *)(a1 + 40) fetchStartTime];
      objc_msgSend(v13, "setFetchStartTime:");
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 312), "setRedirectCount:", objc_msgSend(*(id *)(a1 + 40), "redirectCount"));
      uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 312);
      [*(id *)(a1 + 40) redirectEndTime];
      objc_msgSend(v14, "setRedirectEndTime:");
      uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 312);
      [*(id *)(a1 + 40) redirectStartTime];
      objc_msgSend(v15, "setRedirectStartTime:");
      uint64_t v16 = *(void **)(*(void *)(a1 + 32) + 312);
      [*(id *)(a1 + 40) requestStartTime];
      objc_msgSend(v16, "setRequestStartTime:");
      uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 312);
      [*(id *)(a1 + 40) responseEndTime];
      objc_msgSend(v17, "setResponseEndTime:");
      char v18 = *(void **)(*(void *)(a1 + 32) + 312);
      [*(id *)(a1 + 40) responseStartTime];
      objc_msgSend(v18, "setResponseStartTime:");
      int v19 = *(void **)(*(void *)(a1 + 32) + 312);
      [*(id *)(a1 + 40) secureConnectionStartTime];
      objc_msgSend(v19, "setSecureConnectionStartTime:");
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 312), "setXPSamplingForced:", objc_msgSend(*(id *)(a1 + 40), "xpSamplingForced"));
      v20 = *(void **)(*(void *)(a1 + 32) + 312);
      [*(id *)(a1 + 40) xpSessionDuration];
      objc_msgSend(v20, "setXPSessionDuration:");
      int v21 = *(void **)(*(void *)(a1 + 32) + 312);
      [*(id *)(a1 + 40) xpSamplingPercentageUsers];
      objc_msgSend(v21, "setXPSamplingPercentageUsers:");
      int v22 = *(void **)(*(void *)(a1 + 32) + 312);
      [*(id *)(a1 + 40) xpSamplingPercentageCachedResponses];
      objc_msgSend(v22, "setXPSamplingPercentageCachedResponses:");
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(v2 + 264));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 288);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 392));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 256));
  uint64_t v23 = *(void *)(a1 + 32);
  uint64_t v24 = *(void **)(v23 + 440);
  int v25 = [*(id *)(v23 + 376) URL];
  uint64_t v26 = [v24 mescalSignaturePolicyForResponseURL:v25];
  uint64_t v27 = *(void *)(*(void *)(a1 + 80) + 8);
  id v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = v26;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 376));
  uint64_t v29 = *(void *)(a1 + 32);
  v30 = *(void **)(v29 + 256);
  *(void *)(v29 + 256) = 0;
}

void __66__SSVLoadURLOperation_URLSession_task_didCompleteWithEvent_error___block_invoke_42(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 336);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 336);
    *(void *)(v4 + 336) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 336);
  }
  if ((unint64_t)[v2 count] <= 4
    && ([*(id *)(*(void *)(a1 + 32) + 336) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 336) addObject:*(void *)(a1 + 40)];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 352), *(id *)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(void *)(v6 + 352))
    {
      *(unsigned char *)(v6 + 408) = 1;
      uint64_t v6 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(v6 + 408);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v15 = a5;
  uint64_t v8 = (void (**)(id, uint64_t, void *))a6;
  char v9 = [v15 protectionSpace];
  id v10 = [v9 authenticationMethod];

  if (![(SSVLoadURLOperation *)self isITunesStoreRequest]
    || ![v10 isEqualToString:*MEMORY[0x1E4F28988]])
  {
    id v12 = [v15 sender];
    id v13 = 0;
    uint64_t v14 = objc_opt_respondsToSelector() & 1;
    goto LABEL_8;
  }
  if (([MEMORY[0x1E4F4DC40] QAMode] & 1) != 0
    || ([MEMORY[0x1E4F4DC40] ignoreServerTrustEvaluation] & 1) != 0
    || SSDebugShouldIgnoreExtendedValidation())
  {
    id v11 = (void *)MEMORY[0x1E4F29098];
    id v12 = [v15 protectionSpace];
    id v13 = objc_msgSend(v11, "credentialForTrust:", objc_msgSend(v12, "serverTrust"));
    uint64_t v14 = 0;
LABEL_8:

    goto LABEL_9;
  }
  id v13 = 0;
  uint64_t v14 = 1;
LABEL_9:
  v8[2](v8, v14, v13);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, id))a7;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __95__SSVLoadURLOperation_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
  v22[3] = &unk_1E5BA6FC8;
  v22[4] = self;
  v22[5] = &v23;
  [(SSVLoadURLOperation *)self dispatchSync:v22];
  if (v14)
  {
    if (*((unsigned char *)v24 + 24))
    {
      uint64_t v17 = +[SSAccountStore defaultStore];
      char v18 = [v17 activeAccount];

      int v19 = +[SSVCookieStorage sharedStorage];
      [v19 setCookiesForHTTPResponse:v14 account:v18];
    }
    v20 = [v15 URL];
    id v21 = [(SSVLoadURLOperation *)self _newURLRequestWithRedirectURL:v20];

    id v15 = v21;
  }
  v16[2](v16, v15);
  _Block_object_dispose(&v23, 8);
}

void __95__SSVLoadURLOperation_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 312);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSince1970];
    objc_msgSend(v3, "setRequestStartTime:");

    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(v2 + 288);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__SSVLoadURLOperation_URLSession_dataTask_didReceiveData___block_invoke;
  v8[3] = &unk_1E5BA7018;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(SSVLoadURLOperation *)self dispatchSync:v8];
}

uint64_t __58__SSVLoadURLOperation_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 256) appendData:*(void *)(a1 + 40)];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  id v9 = (void (**)(id, uint64_t))a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v8;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __80__SSVLoadURLOperation_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v22[3] = &unk_1E5BA7018;
  v22[4] = self;
  id v12 = v11;
  id v23 = v12;
  [(SSVLoadURLOperation *)self dispatchAsync:v22];
  if ([(SSVLoadURLOperation *)self isITunesStoreRequest])
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    char v18 = __80__SSVLoadURLOperation_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2;
    int v19 = &unk_1E5BA7018;
    v20 = self;
    id v21 = v8;
    [(SSVLoadURLOperation *)self dispatchAsync:&v16];
    id v13 = +[SSAccountStore defaultStore];
    id v14 = [v13 activeAccount];

    id v15 = +[SSVCookieStorage sharedStorage];
    [v15 setCookiesForHTTPResponse:v12 account:v14];
  }
  v9[2](v9, 1);
}

void __80__SSVLoadURLOperation_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  if (v2[39])
  {
    [v2 _applyResponseToMetrics:*(void *)(a1 + 40)];
    id v3 = *(void **)(*(void *)(a1 + 32) + 312);
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSince1970];
    objc_msgSend(v3, "setResponseStartTime:");

    uint64_t v2 = *(id **)(a1 + 32);
  }
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = v2 + 47;
  objc_storeStrong(v6, v5);
}

void *__80__SSVLoadURLOperation_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  result = *(void **)(v2 + 248);
  if (result)
  {
    char v4 = 0;
    result = (void *)[result handleResponse:*(void *)(a1 + 40) forRequest:*(void *)(v2 + 456) shouldRetry:&v4];
    if (v4) {
      *(unsigned char *)(*(void *)(a1 + 32) + 408) = 1;
    }
  }
  return result;
}

- (void)_configureWithURLBagInterpreter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SSVLoadURLOperation__configureWithURLBagInterpreter___block_invoke;
  v6[3] = &unk_1E5BA7018;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVLoadURLOperation *)self dispatchAsync:v6];
}

void __55__SSVLoadURLOperation__configureWithURLBagInterpreter___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 440) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 440);
    *(void *)(v5 + 440) = v4;

    uint64_t v7 = *(void *)(a1 + 32);
    if (!*(void *)(v7 + 416))
    {
      uint64_t v8 = [*(id *)(v7 + 440) storeFrontSuffix];
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 416);
      *(void *)(v9 + 416) = v8;
    }
  }
}

- (void)_addMachineDataHeadersToRequest:(id)a3 withAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__SSVLoadURLOperation__addMachineDataHeadersToRequest_withAccountIdentifier___block_invoke;
  v10[3] = &unk_1E5BA7068;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(SSVLoadURLOperation *)self dispatchSync:v10];
}

void __77__SSVLoadURLOperation__addMachineDataHeadersToRequest_withAccountIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 304);
  if (v3 == 3)
  {
LABEL_7:
    id v7 = *(void **)(a1 + 48);
    uint64_t v6 = -1;
    goto LABEL_8;
  }
  if (v3 == 2)
  {
    id v8 = *(void **)(v2 + 440);
    id v9 = [*(id *)(a1 + 48) URL];
    LODWORD(v8) = [v8 shouldSendAnonymousMachineIdentifierForURL:v9];

    if (!v8) {
      return;
    }
    goto LABEL_7;
  }
  if (v3 != 1) {
    return;
  }
  uint64_t v4 = *(void **)(a1 + 40);
  if (!v4) {
    return;
  }
  uint64_t v5 = *(void **)(a1 + 48);
  uint64_t v6 = [v4 unsignedLongLongValue];
  id v7 = v5;
LABEL_8:
  SSVAnisetteAddHeadersToURLRequest(v7, v6, 0);
}

- (void)_addSAPSignatureToRequest:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__10;
  id v28 = __Block_byref_object_dispose__10;
  id v29 = 0;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__10;
  int v22 = __Block_byref_object_dispose__10;
  id v23 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __49__SSVLoadURLOperation__addSAPSignatureToRequest___block_invoke;
  id v13 = &unk_1E5BA8E20;
  id v14 = self;
  uint64_t v16 = &v24;
  id v5 = v4;
  id v15 = v5;
  uint64_t v17 = &v18;
  [(SSVLoadURLOperation *)self dispatchSync:&v10];
  uint64_t v6 = (void *)v25[5];
  if (v6 && v19[5])
  {
    id v7 = objc_msgSend(v6, "dataToSignWithURLRequest:", v5, v10, v11, v12, v13, v14);
    if (v7)
    {
      id v8 = [(id)v19[5] signatureWithData:v7 error:0];
      id v9 = [v8 base64EncodedStringWithOptions:0];
      if (v9) {
        [v5 setValue:v9 forHTTPHeaderField:@"X-Apple-ActionSignature"];
      }
    }
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
}

void __49__SSVLoadURLOperation__addSAPSignatureToRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 400);
  if (!v2) {
    return;
  }
  uint64_t v3 = [v2 policyType];
  if (v3 == 2)
  {
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 400) copy];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
    goto LABEL_6;
  }
  if (v3 == 1)
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 440);
    id v5 = [*(id *)(a1 + 40) URL];
    uint64_t v6 = [v4 mescalSignaturePolicyForRequestURL:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

LABEL_6:
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    return;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 392);
  if (v12)
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id v14 = v12;
    id v15 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v14;
  }
  else
  {
    if (!*(void *)(v11 + 440)) {
      return;
    }
    uint64_t v16 = +[SSVFairPlaySAPSession sharedDefaultSession];
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    id v15 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
}

- (void)_applyResponseToMetrics:(id)a3
{
  id v4 = a3;
  id v12 = [v4 allHeaderFields];
  metricsPageEvent = self->_metricsPageEvent;
  uint64_t v6 = [v4 URL];

  uint64_t v7 = [v6 absoluteString];
  [(SSMetricsBaseEvent *)metricsPageEvent setPageURL:v7];

  id v8 = self->_metricsPageEvent;
  uint64_t v9 = HeaderValueForKey(v12, @"X-Apple-Application-Instance");
  [(SSMetricsPageEvent *)v8 setServerApplicationInstance:v9];

  uint64_t v10 = self->_metricsPageEvent;
  uint64_t v11 = HeaderValueForKey(v12, @"Apple-Timing-App");
  [(SSMetricsPageEvent *)v10 setServerTiming:v11];
}

- (void)_createAuthKitSession
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__SSVLoadURLOperation__createAuthKitSession__block_invoke;
  v2[3] = &unk_1E5BA7040;
  v2[4] = self;
  [(SSVLoadURLOperation *)self dispatchSync:v2];
}

void __44__SSVLoadURLOperation__createAuthKitSession__block_invoke(uint64_t a1)
{
  uint64_t v2 = SSVAuthKitFramework();
  id v3 = objc_alloc_init((Class)SSVWeakLinkedClassForString(&cfstr_Akappleidsessi.isa, v2));
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 248);
  *(void *)(v4 + 248) = v3;
}

- (id)_dataForCachedResponse:(_CFCachedURLResponse *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)CFCachedURLResponseCopyReceiverDataArray();
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      id v4 = [v3 objectAtIndex:0];
    }
    else
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v5 = v3;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(v4, "appendData:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v7);
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_finishWithData:(id)a3
{
  id v6 = 0;
  id v4 = [(SSVLoadURLOperation *)self _outputForData:a3 error:&v6];
  id v5 = v6;
  [(SSVLoadURLOperation *)self _finishWithOutput:v4 error:v5];
}

- (void)_finishWithOutput:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(SSVLoadURLOperation *)self outputBlock];
  uint64_t v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v9, v6);
    [(SSVLoadURLOperation *)self _releaseOutputBlocks];
  }
}

- (void)_loadURLBagInterpreter
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(SSVLoadURLOperation *)self bag];

  if (v3)
  {
    id v4 = [(SSVLoadURLOperation *)self bag];
    id v5 = [[SSVURLBagInterpreter alloc] initWithSSBag:v4];
    goto LABEL_17;
  }
  id v4 = self->_urlBag;
  if (!v4)
  {
    id v6 = +[SSURLBagContext contextWithBagType:0];
    id v4 = [[SSURLBag alloc] initWithURLBagContext:v6];
    uint64_t v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7)
    {
      uint64_t v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    uint64_t v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      LODWORD(v21) = 138412290;
      *(void *)((char *)&v21 + 4) = objc_opt_class();
      id v11 = *(id *)((char *)&v21 + 4);
      LODWORD(v20) = 12;
      long long v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v21, v20, v21);
      free(v12);
      SSFileLog(v7, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

    goto LABEL_15;
  }
LABEL_16:
  id v5 = [[SSVURLBagInterpreter alloc] initWithURLBag:v4];
LABEL_17:
  int v19 = v5;

  if (v19) {
    [(SSVLoadURLOperation *)self _configureWithURLBagInterpreter:v19];
  }
}

- (id)_newURLRequestWithRedirectURL:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[(NSURLRequest *)self->_urlRequest mutableCopy];
  [v5 setHTTPShouldUsePipelining:1];
  if (v4) {
    [v5 setURL:v4];
  }
  id v6 = v5;
  [v6 _CFURLRequest];
  CFURLRequestSetShouldStartSynchronously();
  uint64_t v7 = [v6 valueForHTTPHeaderField:@"Accept-Language"];

  if (!v7)
  {
    int v8 = [(id)objc_opt_class() currentAcceptLanguage];
    [v6 setValue:v8 forHTTPHeaderField:@"Accept-Language"];
  }
  int v9 = [v6 valueForHTTPHeaderField:@"User-Agent"];

  if (!v9)
  {
    uint64_t v10 = SSVDefaultUserAgent();
    if (v10) {
      [v6 setValue:v10 forHTTPHeaderField:@"User-Agent"];
    }
  }
  uint64_t v11 = SSViTunesStoreFramework();
  long long v12 = objc_msgSend(SSVWeakLinkedClassForString(&cfstr_Isnetworkobser.isa, v11), "sharedInstance");
  uint64_t v13 = [v12 connectionTypeHeader];

  if ([v13 length]) {
    [v6 setValue:v13 forHTTPHeaderField:@"X-Apple-Connection-Type"];
  }
  if ([(SSVLoadURLOperation *)self isITunesStoreRequest])
  {
    if ([(SSVLoadURLOperation *)self shouldSuppressUserInfo])
    {
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v15 = +[SSAccountStore defaultStore];
      uint64_t v14 = [v15 activeAccount];
    }
    uint64_t v16 = [v14 uniqueIdentifier];
    if (![(SSVLoadURLOperation *)self shouldSuppressUserInfo])
    {
      uint64_t v17 = [v6 valueForHTTPHeaderField:@"X-Dsid"];

      if (!v17 && v16)
      {
        uint64_t v18 = [v16 stringValue];
        [v6 setValue:v18 forHTTPHeaderField:@"X-Dsid"];
      }
      int v19 = [v6 valueForHTTPHeaderField:@"iCloud-DSID"];

      if (!v19)
      {
        uint64_t v20 = +[SSVAppleAccountStore sharedAccountStore];
        long long v21 = [v20 primaryAppleAccount];

        uint64_t v22 = objc_msgSend(v21, "aa_personID");
        if (v22) {
          [v6 setValue:v22 forHTTPHeaderField:@"iCloud-DSID"];
        }
      }
    }
    if ([v14 isNewCustomer])
    {
      id v23 = [v6 URL];
      uint64_t v24 = URLByAppendingQueryParameter(v23, @"newCustomer", @"true");

      [v6 setURL:v24];
    }
    if (SSDebugShouldSendCacheBuster())
    {
      uint64_t v25 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v26 = [v25 UUIDString];

      if (v26)
      {
        uint64_t v27 = [v6 URL];
        id v28 = URLByAppendingQueryParameter(v27, @"buster", v26);

        [v6 setURL:v28];
      }
    }
    if (![(SSVLoadURLOperation *)self shouldSuppressCookies])
    {
      id v29 = +[SSVCookieStorage sharedStorage];
      v30 = [v6 URL];
      uint64_t v31 = [v29 cookieHeadersForURL:v30 account:v14];

      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __53__SSVLoadURLOperation__newURLRequestWithRedirectURL___block_invoke;
      v60[3] = &unk_1E5BA8D80;
      id v61 = v6;
      [v31 enumerateKeysAndObjectsUsingBlock:v60];
    }
    [v6 setHTTPShouldHandleCookies:0];
    uint64_t v32 = [v6 valueForHTTPHeaderField:@"X-Apple-Store-Front"];

    if (!v32)
    {
      uint64_t v33 = SSVStoreFrontIdentifierForAccount(v14);
      if (v33)
      {
        uint64_t v34 = (void *)v33;
        uint64_t v35 = [(SSVLoadURLOperation *)self storeFrontSuffix];
        if (v35)
        {
          uint64_t v36 = [v34 stringByAppendingString:v35];

          uint64_t v34 = (void *)v36;
        }
        [v6 setValue:v34 forHTTPHeaderField:@"X-Apple-Store-Front"];
      }
    }
    if ((SSIsAppStoreDaemon() & 1) == 0)
    {
      id v37 = +[SSDevice currentDevice];
      id v38 = [v6 valueForHTTPHeaderField:@"X-Apple-Software-Cuid"];

      if (!v38)
      {
        v39 = [v37 softwareLibraryIdentifier];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v6 setValue:v39 forHTTPHeaderField:@"X-Apple-Software-Cuid"];
        }
      }
    }
    authKitSession = self->_authKitSession;
    if (authKitSession)
    {
      uint64_t v54 = v16;
      id v55 = v4;
      uint64_t v41 = v14;
      v42 = [(AKAppleIDSession *)authKitSession appleIDHeadersForRequest:v6];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v56 objects:v62 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v44; ++i)
          {
            if (*(void *)v57 != v45) {
              objc_enumerationMutation(v42);
            }
            uint64_t v47 = *(void *)(*((void *)&v56 + 1) + 8 * i);
            v48 = [v42 objectForKeyedSubscript:v47];
            [v6 setValue:v48 forHTTPHeaderField:v47];
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v56 objects:v62 count:16];
        }
        while (v44);
      }

      uint64_t v14 = v41;
      uint64_t v16 = v54;
      id v4 = v55;
    }
    [(SSVLoadURLOperation *)self _addMachineDataHeadersToRequest:v6 withAccountIdentifier:v16];
    [(SSVLoadURLOperation *)self _addSAPSignatureToRequest:v6];
    v49 = [(SSVLoadURLOperation *)self mainDocumentURL];

    if (v49)
    {
      uint64_t v50 = [(SSVLoadURLOperation *)self mainDocumentURL];
      [v6 setMainDocumentURL:v50];
    }
    objc_msgSend(v6, "setAttribution:", -[SSVLoadURLOperation attribution](self, "attribution"));
  }
  uint64_t v51 = [(SSVLoadURLOperation *)self prepareRequestBlock];
  v52 = (void *)v51;
  if (v51) {
    (*(void (**)(uint64_t, id))(v51 + 16))(v51, v6);
  }

  return v6;
}

void __53__SSVLoadURLOperation__newURLRequestWithRedirectURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) valueForHTTPHeaderField:v9];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 stringByAppendingFormat:@"; %@", v5];

    id v5 = (id)v8;
  }
  [*(id *)(a1 + 32) setValue:v5 forHTTPHeaderField:v9];
}

- (id)_outputForData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [(SSVLoadURLOperation *)self dataConsumer];
    if (v7)
    {
      uint64_t v14 = 0;
      uint64_t v15 = &v14;
      uint64_t v16 = 0x3032000000;
      uint64_t v17 = __Block_byref_object_copy__10;
      uint64_t v18 = __Block_byref_object_dispose__10;
      id v19 = 0;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __44__SSVLoadURLOperation__outputForData_error___block_invoke;
      v13[3] = &unk_1E5BA6F30;
      v13[4] = self;
      v13[5] = &v14;
      [(SSVLoadURLOperation *)self dispatchSync:v13];
      uint64_t v8 = v15[5];
      id v12 = 0;
      id v9 = [v7 objectForData:v6 response:v8 error:&v12];
      id v10 = v12;
      _Block_object_dispose(&v14, 8);
    }
    else
    {
      id v9 = v6;
      id v10 = 0;
    }

    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
    id v9 = 0;
    id v10 = 0;
    if (!a4) {
      goto LABEL_10;
    }
  }
  if (!v9) {
    *a4 = v10;
  }
LABEL_10:

  return v9;
}

void __44__SSVLoadURLOperation__outputForData_error___block_invoke(uint64_t a1)
{
}

- (void)_releaseOutputBlocks
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__SSVLoadURLOperation__releaseOutputBlocks__block_invoke;
  v2[3] = &unk_1E5BA7040;
  v2[4] = self;
  [(SSVLoadURLOperation *)self dispatchAsync:v2];
}

void __43__SSVLoadURLOperation__releaseOutputBlocks__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 320);
  *(void *)(v1 + 320) = 0;
}

- (void)_runOnce
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__10;
  uint64_t v20 = __Block_byref_object_dispose__10;
  id v21 = 0;
  id v3 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __31__SSVLoadURLOperation__runOnce__block_invoke;
  v11[3] = &unk_1E5BA8E48;
  v11[4] = self;
  id v4 = v3;
  id v12 = v4;
  uint64_t v13 = &v24;
  uint64_t v14 = &v16;
  uint64_t v15 = v22;
  [(SSVLoadURLOperation *)self dispatchSync:v11];
  if (*((unsigned char *)v25 + 24)) {
    [(SSVLoadURLOperation *)self _loadURLBagInterpreter];
  }
  id v5 = [(SSVLoadURLOperation *)self _newURLRequestWithRedirectURL:v17[5]];
  id v6 = +[SSURLSessionManager sharedManager];
  uint64_t v7 = [v6 dataTaskWithRequest:v5 delegate:self];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __31__SSVLoadURLOperation__runOnce__block_invoke_2;
  v10[3] = &unk_1E5BA7040;
  v10[4] = self;
  [(SSVLoadURLOperation *)self dispatchSync:v10];
  uint64_t v8 = dispatch_get_global_queue(0, 0);
  dispatch_async(v8, &__block_literal_global_4);
  [v7 resume];
  [(SSVLoadURLOperation *)self performSelector:sel__stopIfCancelled withObject:0 afterDelay:0.0];
  [(SSVLoadURLOperation *)self _runRunLoopUntilStopped];
  [v7 cancel];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__stopIfCancelled object:0];
  dispatch_async(v8, &__block_literal_global_94);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__SSVLoadURLOperation__runOnce__block_invoke_5;
  v9[3] = &unk_1E5BA7040;
  v9[4] = self;
  [(SSVLoadURLOperation *)self dispatchSync:v9];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);
}

void __31__SSVLoadURLOperation__runOnce__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 256);
  *(void *)(v3 + 256) = v2;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 384), *(id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v5 + 288) || *(void *)(v5 + 440)) {
    goto LABEL_10;
  }
  if (*(void *)(v5 + 304) == 2) {
    goto LABEL_4;
  }
  id v6 = *(void **)(v5 + 400);
  if (v6)
  {
    uint64_t v7 = [v6 policyType];
    if (v7 == 2)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 392) == 0;
    }
    else if (v7 == 1)
    {
LABEL_4:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
LABEL_10:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 352));
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 352);
  *(void *)(v8 + 352) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 408) = 0;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 344))
  {
    id v10 = objc_alloc_init(SSMetricsPageEvent);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 312);
    *(void *)(v11 + 312) = v10;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
}

void __31__SSVLoadURLOperation__runOnce__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 312);
  if (v1)
  {
    id v2 = [MEMORY[0x1E4F1C9C8] date];
    [v2 timeIntervalSince1970];
    objc_msgSend(v1, "setRequestStartTime:");
  }
}

void __31__SSVLoadURLOperation__runOnce__block_invoke_3()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"SSVNetworkingDidStartNotification" object:0];
}

void __31__SSVLoadURLOperation__runOnce__block_invoke_4()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"SSVNetworkingDidStopNotification" object:0];
}

void __31__SSVLoadURLOperation__runOnce__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 256);
  *(void *)(v2 + 256) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 384);
  *(void *)(v4 + 384) = 0;
}

- (int)_runRunLoopUntilStopped
{
  uint64_t v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__keepAliveTimer_ selector:0 userInfo:0 repeats:1.79769313e308];
  self->_stopped = 0;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D418];
  do
  {
    uint64_t v5 = (void *)MEMORY[0x1A6267F60]();
    CFRunLoopRunResult v6 = CFRunLoopRunInMode(v4, 10.0, 0);
  }
  while (!self->_stopped && (v6 - 1) > 1);
  [v3 invalidate];

  return v6;
}

- (BOOL)_shouldRetryAfterMachineDataRequest:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  if (v4)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    char v18 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__SSVLoadURLOperation__shouldRetryAfterMachineDataRequest___block_invoke;
    v14[3] = &unk_1E5BA8E70;
    uint64_t v16 = v17;
    CFRunLoopRunResult v6 = v5;
    uint64_t v15 = v6;
    [v4 startWithCompletionBlock:v14];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__SSVLoadURLOperation__shouldRetryAfterMachineDataRequest___block_invoke_2;
    v9[3] = &unk_1E5BA8E98;
    id v12 = v17;
    uint64_t v13 = &v19;
    id v10 = v4;
    uint64_t v11 = self;
    [(SSVLoadURLOperation *)self dispatchSync:v9];

    _Block_object_dispose(v17, 8);
    BOOL v7 = *((unsigned char *)v20 + 24) != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v7;
}

intptr_t __59__SSVLoadURLOperation__shouldRetryAfterMachineDataRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __59__SSVLoadURLOperation__shouldRetryAfterMachineDataRequest___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v2 = [*(id *)(a1 + 32) actionName];
    int v3 = [v2 isEqualToString:@"RP"];

    uint64_t v4 = *(void *)(a1 + 40);
    if (v3)
    {
      *(void *)(v4 + 296) = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      ++*(void *)(v4 + 296);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(void *)(*(void *)(a1 + 40) + 296) < 2;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  uint64_t result = [*(id *)(a1 + 32) protocolVersion];
  if (result)
  {
    if (result != 1) {
      return result;
    }
    uint64_t v6 = 3;
  }
  else
  {
    uint64_t v6 = 1;
  }
  *(void *)(*(void *)(a1 + 40) + 304) = v6;
  return result;
}

- (void)_stopIfCancelled
{
  if ([(SSVLoadURLOperation *)self isCancelled])
  {
    [(SSVLoadURLOperation *)self _stopRunLoop];
  }
}

- (void)_stopRunLoop
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__10;
  id v12 = __Block_byref_object_dispose__10;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__SSVLoadURLOperation__stopRunLoop__block_invoke;
  v7[3] = &unk_1E5BA6F30;
  v7[4] = self;
  v7[5] = &v8;
  [(SSVLoadURLOperation *)self dispatchSync:v7];
  int v3 = (void *)v9[5];
  if (v3)
  {
    uint64_t v4 = (__CFRunLoop *)[v3 getCFRunLoop];
    dispatch_semaphore_t v5 = (const void *)*MEMORY[0x1E4F1D418];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__SSVLoadURLOperation__stopRunLoop__block_invoke_2;
    block[3] = &unk_1E5BA7040;
    block[4] = self;
    CFRunLoopPerformBlock(v4, v5, block);
    CFRunLoopWakeUp(v4);
    CFRunLoopStop(v4);
  }
  _Block_object_dispose(&v8, 8);
}

void __35__SSVLoadURLOperation__stopRunLoop__block_invoke(uint64_t a1)
{
}

uint64_t __35__SSVLoadURLOperation__stopRunLoop__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 424) = 1;
  return result;
}

- (SSVLoadURLOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SSVLoadURLOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
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
  return (NSURL *)objc_getProperty(self, a2, 488, 1);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainDocumentURL, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_urlBagInterpreter, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_storeFrontSuffix, 0);
  objc_storeStrong((id *)&self->_sapSignaturePolicy, 0);
  objc_storeStrong((id *)&self->_sapSession, 0);
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_referrerURLString, 0);
  objc_storeStrong((id *)&self->_referrerApplicationName, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_protocolRedirectURLs, 0);
  objc_storeStrong(&self->_prepareRequestBlock, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_metricsPageEvent, 0);
  objc_storeStrong((id *)&self->_inputData, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
  objc_storeStrong((id *)&self->_dataBuffer, 0);
  objc_storeStrong((id *)&self->_authKitSession, 0);
}

@end