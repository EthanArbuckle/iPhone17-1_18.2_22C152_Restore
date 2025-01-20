@interface ISURLOperation
+ (_CFURLCache)sharedCFURLCache;
+ (__CFURLStorageSession)_sharedCacheStorageSession;
+ (id)copyUserAgent;
- (BOOL)_isExternalURL:(id)a3;
- (BOOL)_isPassThroughStatus:(int64_t)a3;
- (BOOL)_loadsHTTPFailures;
- (BOOL)_processResponseData:(id)a3 error:(id *)a4;
- (BOOL)_runRequestWithURL:(id)a3 dataConnectionServiceType:(__CFString *)a4;
- (BOOL)_shouldFollowRedirectWithRequest:(id)a3 error:(id *)a4;
- (BOOL)_shouldSetCookies;
- (BOOL)_usesPrivateCookieStore;
- (BOOL)_validateContentLength:(int64_t)a3 error:(id *)a4;
- (BOOL)handleRedirectFromDataProvider:(id)a3 error:(id *)a4;
- (BOOL)isUploadProgressRequested;
- (BOOL)shouldDisableCellular;
- (BOOL)shouldFollowRedirectWithRequest:(id)a3 returningError:(id *)a4;
- (BOOL)shouldRequireCellular;
- (BOOL)shouldSetCookies;
- (BOOL)tracksPerformanceMetrics;
- (ISDataProvider)dataProvider;
- (ISURLOperation)init;
- (ISURLOperation)initWithSessionManager:(id)a3;
- (ISURLRequestPerformance)performanceMetrics;
- (NSArray)passThroughErrors;
- (NSData)rawResponseData;
- (NSData)sourceAppAuditTokenData;
- (NSNumber)_accountDSIDOverride;
- (NSNumber)metricsLoadURLSamplingPercentage;
- (NSNumber)metricsLoadURLSamplingPercentageCachedResponses;
- (NSNumber)metricsLoadURLSessionDuration;
- (NSString)URLCacheID;
- (NSString)logKey;
- (NSString)sourceAppBundleID;
- (NSURLCache)URLCache;
- (NSURLRequest)_activeURLRequest;
- (NSURLRequest)activeURLRequest;
- (NSURLResponse)response;
- (SSAuthenticationContext)authenticationContext;
- (SSHTTPArchive)HTTPArchive;
- (SSURLRequestProperties)requestProperties;
- (id)URLSession:(id)a3 task:(id)a4 decodedDataForResponseData:(id)a5;
- (id)_accountIdentifier;
- (id)_activeURL;
- (id)_copyAuthenticationContext;
- (id)_copyConnectionPropertiesWithDataConnectionServiceType:(__CFString *)a3;
- (id)_copyQueryStringDictionaryForRedirect:(id)a3;
- (id)_decodedDataForData:(id)a3;
- (id)_errorWithDefaultStringsForError:(id)a3;
- (id)_errorWithDomain:(id)a3 code:(int64_t)a4;
- (id)_handleRedirectRequest:(id)a3 response:(id)a4;
- (id)_requestProperties;
- (id)_sanitizedDescriptionForObject:(id)a3;
- (id)_sanitizedStringForString:(id)a3;
- (id)_sanitizedURLForURL:(id)a3;
- (id)_stringForCachePolicy:(unint64_t)a3;
- (id)newRequestWithURL:(id)a3;
- (id)request;
- (int64_t)_defaultAuthChallengeDispositionForChallenge:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithEvent:(id)a5 error:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCreatingHTTPArchive:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_handleFinishedLoading;
- (void)_handleReceivedData:(id)a3;
- (void)_handleReceivedResponse:(id)a3;
- (void)_logRequest:(id)a3;
- (void)_logResponseBody:(id)a3;
- (void)_performDefaultHandlingForAuthenticationChallenge:(id)a3;
- (void)_retry;
- (void)_run;
- (void)_sendContentLengthToDelegate:(int64_t)a3;
- (void)_sendOutputToDelegate:(id)a3;
- (void)_sendRequestToDelegate:(id)a3;
- (void)_sendResponseToDelegate:(id)a3;
- (void)_setAccountDSIDOverride:(id)a3;
- (void)_setActiveURLRequest:(id)a3;
- (void)_setLoadsHTTPFailures:(BOOL)a3;
- (void)_setShouldSetCookies:(BOOL)a3;
- (void)_setUsesPrivateCookieStore:(BOOL)a3;
- (void)_stopConnection;
- (void)_stopIfCancelled;
- (void)_updateProgress;
- (void)dealloc;
- (void)run;
- (void)setAuthenticationContext:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setPassThroughErrors:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestProperties:(id)a3;
- (void)setResponse:(id)a3;
- (void)setTracksPerformanceMetrics:(BOOL)a3;
- (void)setUploadProgressRequested:(BOOL)a3;
@end

@implementation ISURLOperation

- (ISURLOperation)init
{
  v3 = [MEMORY[0x263F7B370] sharedManager];
  v4 = [(ISURLOperation *)self initWithSessionManager:v3];

  return v4;
}

- (ISURLOperation)initWithSessionManager:(id)a3
{
  id v5 = a3;
  __ISRecordSPIClassUsage(self);
  v14.receiver = self;
  v14.super_class = (Class)ISURLOperation;
  v6 = [(ISOperation *)&v14 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.iTunesStore.ISURLOperation", 0);
    dataBufferAccessQueue = v6->_dataBufferAccessQueue;
    v6->_dataBufferAccessQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = SSGenerateLogCorrelationString();
    logKey = v6->_logKey;
    v6->_logKey = (NSString *)v9;

    v11 = (SSMutableURLRequestProperties *)objc_alloc_init(MEMORY[0x263F7B290]);
    requestProperties = v6->_requestProperties;
    v6->_requestProperties = v11;

    v6->_shouldSetCookies = 1;
    objc_storeStrong((id *)&v6->_urlSessionManager, a3);
    v6->_usesPrivateCookieStore = 1;
  }

  return v6;
}

- (void)dealloc
{
  [(ISDataProvider *)self->_dataProvider setParentOperation:0];
  v3.receiver = self;
  v3.super_class = (Class)ISURLOperation;
  [(ISURLOperation *)&v3 dealloc];
}

- (SSAuthenticationContext)authenticationContext
{
  [(ISOperation *)self lock];
  objc_super v3 = self->_authenticationContext;
  [(ISOperation *)self unlock];

  return v3;
}

+ (id)copyUserAgent
{
  if (copyUserAgent_sUserAgentGuard != -1) {
    dispatch_once(&copyUserAgent_sUserAgentGuard, &__block_literal_global_3);
  }
  v2 = (void *)copyUserAgent_sUserAgent;

  return v2;
}

void __31__ISURLOperation_copyUserAgent__block_invoke()
{
  id v2 = [MEMORY[0x263F7B148] currentDevice];
  uint64_t v0 = [v2 userAgent];
  v1 = (void *)copyUserAgent_sUserAgent;
  copyUserAgent_sUserAgent = v0;
}

- (id)request
{
  [(ISOperation *)self lock];
  objc_super v3 = [[ISURLRequest alloc] initWithRequestProperties:self->_requestProperties];
  [(ISOperation *)self unlock];

  return v3;
}

- (SSURLRequestProperties)requestProperties
{
  [(ISOperation *)self lock];
  objc_super v3 = (void *)[(SSMutableURLRequestProperties *)self->_requestProperties copy];
  [(ISOperation *)self unlock];

  return (SSURLRequestProperties *)v3;
}

- (void)setAuthenticationContext:(id)a3
{
  id v8 = a3;
  [(ISOperation *)self lock];
  objc_storeStrong((id *)&self->_authenticationContext, a3);
  id v5 = [v8 logUUID];

  if (v5)
  {
    v6 = [v8 logUUID];
    logKey = self->_logKey;
    self->_logKey = v6;
  }
  [(ISOperation *)self unlock];
}

- (void)setRequest:(id)a3
{
  id v4 = a3;
  [(ISOperation *)self lock];
  id v5 = [v4 requestProperties];

  v6 = (SSMutableURLRequestProperties *)[v5 mutableCopy];
  requestProperties = self->_requestProperties;
  self->_requestProperties = v6;

  [(ISOperation *)self unlock];
}

- (void)setRequestProperties:(id)a3
{
  v6 = (SSMutableURLRequestProperties *)a3;
  [(ISOperation *)self lock];
  if (self->_requestProperties != v6)
  {
    id v4 = (SSMutableURLRequestProperties *)[(SSMutableURLRequestProperties *)v6 mutableCopy];
    requestProperties = self->_requestProperties;
    self->_requestProperties = v4;
  }
  [(ISOperation *)self unlock];
}

- (void)run
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v28 = [(ISURLOperation *)self _copyAuthenticationContext];
  objc_super v3 = [(ISURLOperation *)self dataProvider];
  id v4 = [(ISOperation *)self copySerializationLocks];
  id v5 = v4;
  if (v4)
  {
    [v4 makeObjectsPerformSelector:sel_lock];
    v6 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v6)
    {
      v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    uint64_t v9 = [v6 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      int v10 = v8;
    }
    else {
      int v10 = v8 & 2;
    }
    if (v10)
    {
      v11 = objc_opt_class();
      id v12 = v11;
      v13 = [(ISOperation *)self serializationLockIdentifiers];
      int v29 = 138412546;
      id v30 = v11;
      __int16 v31 = 2112;
      v32 = v13;
      LODWORD(v27) = 22;
      v26 = &v29;
      objc_super v14 = (void *)_os_log_send_and_compose_impl();

      if (v14)
      {
        objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v29, v27);
        v15 = (int *)objc_claimAutoreleasedReturnValue();
        free(v14);
        v26 = v15;
        SSFileLog();
      }
    }
    else
    {
    }
    [(ISOperation *)self sendDidTakeSerializationLocks];
  }
  v16 = +[ISNetworkObserver sharedInstance];
  [v16 beginUsingNetwork];
  [v3 setAuthenticationContext:v28];
  [v3 setParentOperation:self];
  [(ISURLOperation *)self _run];
  [v3 setParentOperation:0];
  if (-[ISURLOperation isCancelled](self, "isCancelled") && [v3 isStream]) {
    [v3 streamCancelled];
  }
  [v16 endUsingNetwork];
  if (v5)
  {
    v17 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v17)
    {
      v17 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v18 = [v17 shouldLog];
    int v19 = [v17 shouldLogToDisk];
    v20 = [v17 OSLogObject];
    v21 = v20;
    if (v19) {
      v18 |= 2u;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
      int v22 = v18;
    }
    else {
      int v22 = v18 & 2;
    }
    if (v22)
    {
      id v23 = (id)objc_opt_class();
      v24 = [(ISOperation *)self serializationLockIdentifiers];
      int v29 = 138412546;
      id v30 = v23;
      __int16 v31 = 2112;
      v32 = v24;
      LODWORD(v27) = 22;
      v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_30:

        [v5 makeObjectsPerformSelector:sel_unlock];
        goto LABEL_31;
      }
      v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v29, v27);
      free(v25);
      SSFileLog();
    }

    goto LABEL_30;
  }
LABEL_31:
}

- (BOOL)handleRedirectFromDataProvider:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = [a3 redirectURL];
  v6 = [v5 schemeSwizzledURL];

  int v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v7)
  {
    int v7 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  int v10 = [v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    int v11 = v9;
  }
  else {
    int v11 = v9 & 2;
  }
  if (v11)
  {
    id v12 = objc_opt_class();
    id v13 = v12;
    objc_super v14 = [(ISURLOperation *)self _activeURL];
    v15 = [(ISURLOperation *)self _sanitizedURLForURL:v14];
    v16 = [(ISURLOperation *)self _sanitizedURLForURL:v6];
    int v27 = 138412802;
    id v28 = v12;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 2112;
    v32 = v16;
    LODWORD(v26) = 32;
    v25 = &v27;
    v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17) {
      goto LABEL_13;
    }
    int v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v27, v26);
    free(v17);
    v25 = (int *)v10;
    SSFileLog();
  }

LABEL_13:
  redirectURLs = self->_redirectURLs;
  if (!redirectURLs)
  {
    int v19 = (NSCountedSet *)objc_alloc_init(MEMORY[0x263F08760]);
    v20 = self->_redirectURLs;
    self->_redirectURLs = v19;

    redirectURLs = self->_redirectURLs;
  }
  -[NSCountedSet addObject:](redirectURLs, "addObject:", v6, v25);
  v21 = [(ISURLOperation *)self _requestProperties];
  id v22 = [(ISURLOperation *)self _copyQueryStringDictionaryForRedirect:v6];
  [v21 setRequestParameters:v22];
  id v23 = [(ISURLOperation *)self newRequestWithURL:v6];
  [(ISURLOperation *)self _setActiveURLRequest:v23];

  return 1;
}

- (id)newRequestWithURL:(id)a3
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ISURLOperation *)self _requestProperties];
  v6 = [v4 scheme];
  uint64_t v7 = [v6 caseInsensitiveCompare:@"data"];

  v82 = self;
  if (!v7)
  {
    id v15 = objc_alloc(MEMORY[0x263F089E0]);
    [v5 timeoutInterval];
    v16 = objc_msgSend(v15, "initWithURL:cachePolicy:timeoutInterval:", v4, 1);
    goto LABEL_43;
  }
  uint64_t v8 = [v5 HTTPBody];
  uint64_t v9 = [v5 HTTPBodyStream];
  v79 = [v5 HTTPHeaders];
  int v10 = [v5 HTTPMethod];
  int v11 = [v5 requestParameters];
  if ([v11 count])
  {
    if (!(v8 | v9))
    {
      if ([v10 isEqualToString:@"POST"])
      {
        id v12 = ISDictionaryValueForCaseInsensitiveString(v79, @"Content-Type");
        int v13 = [v12 isEqualToString:@"application/json"];

        if (v13) {
          [MEMORY[0x263F08900] dataWithJSONObject:v11 options:0 error:0];
        }
        else {
        uint64_t v14 = [MEMORY[0x263F08AC0] dataWithPropertyList:v11 format:100 options:0 error:0];
        }
        uint64_t v8 = 0;
        if (v14)
        {
          v17 = v11;
          int v11 = 0;
          uint64_t v8 = v14;
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    if (v11)
    {
      uint64_t v18 = [v4 urlBySettingQueryStringDictionary:v11];
      v17 = v4;
      id v4 = (id)v18;
      goto LABEL_14;
    }
  }
LABEL_15:
  [v5 timeoutInterval];
  double v19 = 10.0;
  if (v20 > 10.0)
  {
    [v5 timeoutInterval];
    double v19 = v21;
  }
  v16 = objc_msgSend(objc_alloc(MEMORY[0x263F089E0]), "initWithURL:cachePolicy:timeoutInterval:", v4, objc_msgSend(v5, "cachePolicy"), v19);
  [v16 setHTTPShouldUsePipelining:1];
  objc_msgSend(v16, "setNetworkServiceType:", objc_msgSend(v5, "networkServiceType"));
  if (objc_opt_respondsToSelector())
  {
    [v16 _CFURLRequest];
    CFURLRequestSetShouldStartSynchronously();
    if (([v5 shouldDecodeResponse] & 1) == 0) {
      _CFURLRequestSetProtocolProperty();
    }
  }
  BOOL v22 = [(ISURLOperation *)self _usesPrivateCookieStore];
  [v16 setHTTPShouldHandleCookies:!v22];
  if (v8) {
    [v16 setHTTPBody:v8];
  }
  if (v9) {
    [v16 setHTTPBodyStream:v9];
  }
  v78 = (void *)v9;
  if (v10) {
    [v16 setHTTPMethod:v10];
  }
  v76 = v11;
  v77 = v10;
  id v80 = v4;
  if (v22)
  {
    id v23 = [(ISURLOperation *)self _requestProperties];
    [v23 URLBagType];
    uint64_t v24 = SSAccountScopeForURLBagType();

    v25 = [MEMORY[0x263F7B380] sharedStorage];
    uint64_t v26 = [(ISURLOperation *)v82 _accountIdentifier];
    int v27 = [v25 cookieHeadersForURL:v4 userIdentifier:v26 scope:v24];

    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v28 = v27;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v88 objects:v99 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v89;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v89 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v88 + 1) + 8 * i);
          v34 = [v28 objectForKey:v33];
          v35 = (void *)[v34 copy];
          [v16 addValue:v35 forHTTPHeaderField:v33];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v88 objects:v99 count:16];
      }
      while (v30);
    }
  }
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v36 = v79;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v84 objects:v98 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v85;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v85 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void *)(*((void *)&v84 + 1) + 8 * j);
        v42 = [v36 objectForKey:v41];
        v43 = (void *)[v42 copy];
        [v16 setValue:v43 forHTTPHeaderField:v41];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v84 objects:v98 count:16];
    }
    while (v38);
  }

  id v4 = v80;
  self = v82;
LABEL_43:
  uint64_t v44 = *MEMORY[0x263F7B788];
  v45 = [v16 valueForHTTPHeaderField:*MEMORY[0x263F7B788]];
  if (v45
    || (+[ISClient currentClient],
        v46 = objc_claimAutoreleasedReturnValue(),
        [v46 userAgent],
        v45 = objc_claimAutoreleasedReturnValue(),
        v46,
        v45)
    || (v45 = (void *)[(id)objc_opt_class() copyUserAgent]) != 0)
  {
    v47 = [v5 userAgentComponents];
    v48 = (void *)[v47 mutableCopy];

    if ([v48 count])
    {
      [v48 insertObject:v45 atIndex:0];
      uint64_t v49 = [v48 componentsJoinedByString:@" "];

      v45 = (void *)v49;
    }
    v50 = (void *)[v45 copy];
    [v16 setValue:v50 forHTTPHeaderField:v44];
  }
  if (MGGetBoolAnswer())
  {
    v51 = [MEMORY[0x263F086E0] mainBundle];
    v52 = [v51 bundleIdentifier];
    [v16 setValue:v52 forHTTPHeaderField:@"X-Apple-Issuing-Process"];

    v53 = [v5 clientBundleIdentifier];
    v54 = (void *)[v53 copy];
    [v16 setValue:v54 forHTTPHeaderField:@"X-Apple-Requesting-Process"];

    v55 = -[ISURLOperation _stringForCachePolicy:](self, "_stringForCachePolicy:", [v5 cachePolicy]);
    v56 = (void *)[v55 copy];
    [v16 setValue:v56 forHTTPHeaderField:@"X-Apple-NSURLCachePolicy"];
  }
  v57 = [MEMORY[0x263F7B3A0] currentAcceptLanguage];
  v58 = (void *)[v57 copy];
  [v16 setValue:v58 forHTTPHeaderField:@"Accept-Language"];

  v59 = [MEMORY[0x263EFFA18] localTimeZone];
  uint64_t v60 = [v59 secondsFromGMT];
  v61 = [NSNumber numberWithDouble:(double)v60];
  v62 = [v61 stringValue];
  [v16 setValue:v62 forHTTPHeaderField:@"X-Apple-Tz"];

  v63 = [(ISURLOperation *)self dataProvider];
  if ([v63 isStream])
  {
    [v63 setup];
    uint64_t v64 = [v63 streamedBytes];
    if (v64 >= 1)
    {
      uint64_t v65 = v64;
      v66 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v66)
      {
        v66 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v67 = [v66 shouldLog];
      if ([v66 shouldLogToDisk]) {
        v67 |= 2u;
      }
      v68 = [v66 OSLogObject];
      if (!os_log_type_enabled(v68, OS_LOG_TYPE_INFO)) {
        v67 &= 2u;
      }
      if (v67)
      {
        id v81 = v4;
        v69 = objc_opt_class();
        id v83 = v69;
        v70 = objc_opt_class();
        int v92 = 138412802;
        v93 = v69;
        __int16 v94 = 2112;
        v95 = v70;
        __int16 v96 = 2048;
        uint64_t v97 = v65;
        id v71 = v70;
        LODWORD(v75) = 32;
        v72 = (void *)_os_log_send_and_compose_impl();

        id v4 = v81;
        if (!v72)
        {
LABEL_63:

          v73 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=%lld-", v65);
          [v16 setValue:v73 forHTTPHeaderField:@"Range"];

          goto LABEL_64;
        }
        v68 = objc_msgSend(NSString, "stringWithCString:encoding:", v72, 4, &v92, v75);
        free(v72);
        SSFileLog();
      }

      goto LABEL_63;
    }
  }
LABEL_64:

  return v16;
}

- (BOOL)shouldFollowRedirectWithRequest:(id)a3 returningError:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

- (NSNumber)metricsLoadURLSessionDuration
{
  objc_super v3 = [(ISOperation *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(ISOperation *)self delegate];
    v6 = [v5 metricsLoadURLSessionDuration];
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSNumber)metricsLoadURLSamplingPercentage
{
  objc_super v3 = [(ISOperation *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(ISOperation *)self delegate];
    v6 = [v5 metricsLoadURLSamplingPercentage];
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSNumber)metricsLoadURLSamplingPercentageCachedResponses
{
  objc_super v3 = [(ISOperation *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(ISOperation *)self delegate];
    v6 = [v5 metricsLoadURLSamplingPercentageCachedResponses];
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSData)rawResponseData
{
  return (NSData *)self->_dataBuffer;
}

- (BOOL)shouldDisableCellular
{
  id v2 = [(ISURLOperation *)self _requestProperties];
  char v3 = [v2 shouldDisableCellular];

  return v3;
}

- (BOOL)shouldRequireCellular
{
  id v2 = [(ISURLOperation *)self _requestProperties];
  char v3 = [v2 requiresCellularDataNetwork];

  return v3;
}

- (BOOL)shouldSetCookies
{
  return self->_shouldSetCookies;
}

- (NSData)sourceAppAuditTokenData
{
  id v2 = [(ISURLOperation *)self _requestProperties];
  char v3 = [v2 clientAuditTokenData];

  return (NSData *)v3;
}

- (NSString)sourceAppBundleID
{
  id v2 = [(ISURLOperation *)self _requestProperties];
  char v3 = [v2 clientAuditBundleIdentifier];

  return (NSString *)v3;
}

- (NSURLCache)URLCache
{
  char v3 = [(ISOperation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [(ISOperation *)self delegate];
    id v5 = [v4 URLCache];

    if (v5)
    {
      v6 = [(ISOperation *)self delegate];
      id v7 = [v6 URLCache];

      goto LABEL_8;
    }
  }
  else
  {
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__ISURLOperation_URLCache__block_invoke;
  block[3] = &unk_264260B08;
  block[4] = self;
  if (URLCache_onceToken != -1) {
    dispatch_once(&URLCache_onceToken, block);
  }
  id v7 = (id)URLCache_sURLCache;
LABEL_8:

  return (NSURLCache *)v7;
}

uint64_t __26__ISURLOperation_URLCache__block_invoke()
{
  uint64_t result = [(id)objc_opt_class() _sharedCacheStorageSession];
  if (result)
  {
    URLCache_sURLCache = objc_msgSend(objc_alloc(MEMORY[0x263F08B98]), "_initWithExistingCFURLCache:", objc_msgSend((id)objc_opt_class(), "sharedCFURLCache"));
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (NSString)URLCacheID
{
  char v3 = [(ISOperation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [(ISOperation *)self delegate];
    id v5 = [v4 URLCacheID];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      id v7 = [(ISOperation *)self delegate];
      id v8 = [v7 URLCacheID];

      goto LABEL_8;
    }
  }
  else
  {
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__ISURLOperation_URLCacheID__block_invoke;
  block[3] = &unk_264260B08;
  block[4] = self;
  if (URLCacheID_onceToken != -1) {
    dispatch_once(&URLCacheID_onceToken, block);
  }
  id v8 = (id)URLCacheID_sURLCacheID;
LABEL_8:

  return (NSString *)v8;
}

uint64_t __28__ISURLOperation_URLCacheID__block_invoke()
{
  uint64_t result = [(id)objc_opt_class() _sharedCacheStorageSession];
  if (result)
  {
    URLCacheID_sURLCacheID = _CFURLStorageSessionCopyIdentifier();
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (id)URLSession:(id)a3 task:(id)a4 decodedDataForResponseData:(id)a5
{
  return -[ISURLOperation _decodedDataForData:](self, "_decodedDataForData:", a5, a4);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithEvent:(id)a5 error:(id)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a6;
  if (([v8 isEqual:self->_urlSessionTask] & 1) == 0)
  {
    double v21 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v21)
    {
      double v21 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v22 = [v21 shouldLog];
    if ([v21 shouldLogToDisk]) {
      int v23 = v22 | 2;
    }
    else {
      int v23 = v22;
    }
    uint64_t v24 = [v21 OSLogObject];
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      v23 &= 2u;
    }
    if (v23)
    {
      v25 = objc_opt_class();
      urlSessionTask = self->_urlSessionTask;
      int v31 = 138413058;
      v32 = v25;
      __int16 v33 = 2114;
      id v34 = v8;
      __int16 v35 = 2114;
      id v36 = urlSessionTask;
      __int16 v37 = 2114;
      id v38 = v9;
      id v27 = v25;
      LODWORD(v29) = 42;
      id v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_27:

        goto LABEL_29;
      }
      uint64_t v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v31, v29);
      free(v28);
      SSFileLog();
    }

    goto LABEL_27;
  }
  if (!v9)
  {
    [(ISURLOperation *)self _handleFinishedLoading];
    goto LABEL_29;
  }
  int v10 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v10)
  {
    int v10 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v11 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  int v13 = [v10 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
    int v14 = v12;
  }
  else {
    int v14 = v12 & 2;
  }
  if (!v14) {
    goto LABEL_14;
  }
  id v15 = objc_opt_class();
  id v30 = v15;
  v16 = [(ISURLOperation *)self _sanitizedDescriptionForObject:v9];
  v17 = [(ISURLOperation *)self _activeURL];
  [(ISURLOperation *)self _sanitizedURLForURL:v17];
  int v31 = 138412802;
  v32 = v15;
  __int16 v33 = 2112;
  id v34 = v16;
  __int16 v35 = 2112;
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = 32;
  uint64_t v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    int v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v31, v29);
    free(v18);
    SSFileLog();
LABEL_14:
  }
  double v19 = ISErrorWithExternalError(v9);
  double v20 = [(ISURLOperation *)self _errorWithDefaultStringsForError:v19];
  [(ISOperation *)self setError:v20];

  [(ISURLOperation *)self _stopConnection];
LABEL_29:
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCreatingHTTPArchive:(id)a5
{
  uint64_t v6 = (SSHTTPArchive *)a5;
  [(ISOperation *)self lock];
  httpArchive = self->_httpArchive;
  self->_httpArchive = v6;

  [(ISOperation *)self unlock];
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = (void (**)(id, uint64_t, void *))a6;
  [(ISOperation *)self lock];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  if (objc_opt_respondsToSelector())
  {
  }
  else
  {
    id v11 = objc_loadWeakRetained((id *)&self->super._delegate);
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0)
    {
      [(ISOperation *)self unlock];
      id v13 = 0;
      goto LABEL_9;
    }
  }
  id v13 = objc_loadWeakRetained((id *)&self->super._delegate);
  [(ISOperation *)self unlock];
  if (!v13 || (objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_9:
    v16 = [v8 protectionSpace];
    v17 = [v16 authenticationMethod];
    if ([v17 isEqualToString:*MEMORY[0x263F08528]])
    {
      uint64_t v15 = [(ISURLOperation *)self _defaultAuthChallengeDispositionForChallenge:v8];
      uint64_t v18 = 0;
LABEL_48:

      goto LABEL_49;
    }
    double v19 = [(ISURLOperation *)self _requestProperties];
    if ([v19 isITunesStoreRequest])
    {

LABEL_14:
      if (([MEMORY[0x263F27BE0] QAMode] & 1) != 0
        || ([MEMORY[0x263F27BE0] ignoreServerTrustEvaluation] & 1) != 0
        || SSDebugShouldIgnoreExtendedValidation())
      {
        uint64_t v18 = objc_msgSend(MEMORY[0x263F08BB8], "credentialForTrust:", objc_msgSend(v16, "serverTrust"));
        uint64_t v15 = 0;
      }
      else
      {
        uint64_t v18 = 0;
        uint64_t v15 = 1;
      }
      goto LABEL_48;
    }
    char v20 = [v17 isEqualToString:*MEMORY[0x263F08560]];

    if (v20) {
      goto LABEL_14;
    }
    double v21 = objc_alloc_init(ISAuthenticationChallengeOperation);
    v42 = [[ISURLAuthenticationChallenge alloc] initWithAuthenticationChallenge:v8];
    v43 = v21;
    -[ISAuthenticationChallengeOperation setChallenge:](v21, "setChallenge:");
    int v22 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v22)
    {
      int v22 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v23 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      v23 |= 2u;
    }
    uint64_t v24 = [v22 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
      int v25 = v23;
    }
    else {
      int v25 = v23 & 2;
    }
    if (v25)
    {
      int v45 = 138412290;
      id v46 = (id)objc_opt_class();
      id v40 = v46;
      LODWORD(v39) = 12;
      id v38 = &v45;
      uint64_t v26 = (void *)_os_log_send_and_compose_impl();

      if (!v26) {
        goto LABEL_29;
      }
      uint64_t v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v45, v39);
      free(v26);
      id v38 = (int *)v24;
      SSFileLog();
    }

LABEL_29:
    id v44 = 0;
    id v27 = v43;
    BOOL v28 = [(ISOperation *)self runSubOperation:v43 returningError:&v44];
    id v29 = v44;
    id v30 = v29;
    if (v28)
    {
      uint64_t v18 = [(ISAuthenticationChallengeOperation *)v43 credential];
      uint64_t v15 = 2 * (v18 == 0);
LABEL_44:

      goto LABEL_48;
    }
    id v41 = v29;
    int v31 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v31)
    {
      int v31 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v32 = objc_msgSend(v31, "shouldLog", v38);
    if ([v31 shouldLogToDisk]) {
      v32 |= 2u;
    }
    __int16 v33 = [v31 OSLogObject];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      v32 &= 2u;
    }
    if (v32)
    {
      id v34 = objc_opt_class();
      int v45 = 138412290;
      id v46 = v34;
      id v35 = v34;
      LODWORD(v39) = 12;
      id v36 = (void *)_os_log_send_and_compose_impl();

      id v27 = v43;
      if (!v36)
      {
LABEL_43:

        id v30 = v41;
        __int16 v37 = [(ISURLOperation *)self _errorWithDefaultStringsForError:v41];
        [(ISOperation *)self setError:v37];

        uint64_t v15 = [(ISURLOperation *)self _defaultAuthChallengeDispositionForChallenge:v8];
        uint64_t v18 = 0;
        goto LABEL_44;
      }
      __int16 v33 = objc_msgSend(NSString, "stringWithCString:encoding:", v36, 4, &v45, v39);
      free(v36);
      SSFileLog();
    }

    goto LABEL_43;
  }
  uint64_t v14 = [v13 operation:self dispositionForAuthenticationChallenge:v8];
  if (v14)
  {
    uint64_t v15 = v14;
LABEL_46:
    uint64_t v18 = 0;
    goto LABEL_49;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v15 = 0;
    goto LABEL_46;
  }
  uint64_t v18 = [v13 operation:self credentialForAuthenticationChallenge:v8];
  uint64_t v15 = 0;
LABEL_49:
  v9[2](v9, v15, v18);
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([(ISURLOperation *)self isUploadProgressRequested])
  {
    [(ISOperation *)self lock];
    progress = self->super._progress;
    if (!progress)
    {
      char v12 = (SSOperationProgress *)objc_alloc_init(MEMORY[0x263F7B2A0]);
      id v13 = self->super._progress;
      self->super._progress = v12;

      progress = self->super._progress;
    }
    BOOL v14 = [(SSOperationProgress *)progress operationType] != 3
       || [(SSOperationProgress *)self->super._progress maxValue] != a7;
    [(SSOperationProgress *)self->super._progress setCanPause:0];
    [(SSOperationProgress *)self->super._progress resetSnapshots];
    [(SSOperationProgress *)self->super._progress setMaxValue:a7];
    [(SSOperationProgress *)self->super._progress setCurrentValue:a6];
    [(SSOperationProgress *)self->super._progress setOperationType:3];
    [(SSOperationProgress *)self->super._progress setUnits:1];
    uint64_t v15 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v15)
    {
      uint64_t v15 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    uint64_t v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      v17 &= 2u;
    }
    if (v17)
    {
      *(_DWORD *)int v23 = 138413058;
      *(void *)&v23[4] = objc_opt_class();
      *(_WORD *)&v23[12] = 2048;
      *(void *)&v23[14] = a5;
      *(_WORD *)&v23[22] = 2048;
      int64_t v24 = a6;
      LOWORD(v25) = 2048;
      *(void *)((char *)&v25 + 2) = a7;
      id v19 = *(id *)&v23[4];
      LODWORD(v22) = 42;
      char v20 = (void *)_os_log_send_and_compose_impl();

      if (v20)
      {
        double v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, v23, v22, *(_OWORD *)v23, *(void *)&v23[16], v24, v25);
        free(v20);
        SSFileLog();
      }
    }
    else
    {
    }
    [(ISOperation *)self unlock];
    if (v14) {
      [(ISURLOperation *)self _updateProgress];
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = (void (**)(id, void *))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  char v10 = objc_opt_respondsToSelector();

  unint64_t v11 = 0x263F7B000uLL;
  if ((v10 & 1) == 0 || (id v12 = objc_loadWeakRetained((id *)&self->super._delegate)) == 0)
  {
    long long v25 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v25)
    {
      long long v25 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v26 = [v25 shouldLog];
    if ([v25 shouldLogToDisk]) {
      int v27 = v26 | 2;
    }
    else {
      int v27 = v26;
    }
    BOOL v28 = [v25 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      int v29 = v27;
    }
    else {
      int v29 = v27 & 2;
    }
    if (v29)
    {
      id v30 = objc_opt_class();
      id v31 = v30;
      id v32 = objc_loadWeakRetained((id *)&self->super._delegate);
      int v45 = 138412546;
      id v46 = v30;
      __int16 v47 = 2112;
      id v48 = (id)objc_opt_class();
      id v33 = v48;
      LODWORD(v43) = 22;
      v42 = &v45;
      id v34 = (void *)_os_log_send_and_compose_impl();

      unint64_t v11 = 0x263F7B000uLL;
      if (!v34)
      {
LABEL_29:

        id v13 = 0;
        goto LABEL_30;
      }
      BOOL v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v34, 4, &v45, v43);
      free(v34);
      v42 = (int *)v28;
      SSFileLog();
    }

    goto LABEL_29;
  }
  id v13 = v12;
  BOOL v14 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v14)
  {
    BOOL v14 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v15 = [v14 shouldLog];
  if ([v14 shouldLogToDisk]) {
    int v16 = v15 | 2;
  }
  else {
    int v16 = v15;
  }
  int v17 = [v14 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
    int v18 = v16;
  }
  else {
    int v18 = v16 & 2;
  }
  if (v18)
  {
    id v19 = objc_opt_class();
    id v44 = v19;
    id v20 = objc_loadWeakRetained((id *)&self->super._delegate);
    int v45 = 138412546;
    id v46 = v19;
    __int16 v47 = 2112;
    id v48 = (id)objc_opt_class();
    id v21 = v48;
    LODWORD(v43) = 22;
    v42 = &v45;
    uint64_t v22 = (void *)_os_log_send_and_compose_impl();

    unint64_t v11 = 0x263F7B000;
    if (!v22) {
      goto LABEL_15;
    }
    int v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v45, v43);
    free(v22);
    v42 = (int *)v17;
    SSFileLog();
  }

LABEL_15:
  int v23 = [v7 currentRequest];
  int64_t v24 = [v13 operation:self needNewBodyStream:v23];

  if (!v24)
  {
LABEL_30:
    id v35 = objc_msgSend(*(id *)(v11 + 504), "sharediTunesStoreConfig", v42);
    if (!v35)
    {
      id v35 = [*(id *)(v11 + 504) sharedConfig];
    }
    int v36 = [v35 shouldLog];
    if ([v35 shouldLogToDisk]) {
      int v37 = v36 | 2;
    }
    else {
      int v37 = v36;
    }
    id v38 = [v35 OSLogObject];
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      v37 &= 2u;
    }
    if (v37)
    {
      uint64_t v39 = objc_opt_class();
      int v45 = 138412290;
      id v46 = v39;
      id v40 = v39;
      LODWORD(v43) = 12;
      id v41 = (void *)_os_log_send_and_compose_impl();

      if (!v41)
      {
LABEL_41:

        [v7 cancel];
        int64_t v24 = 0;
        goto LABEL_42;
      }
      id v38 = objc_msgSend(NSString, "stringWithCString:encoding:", v41, 4, &v45, v43);
      free(v41);
      SSFileLog();
    }

    goto LABEL_41;
  }
LABEL_42:
  v8[2](v8, v24);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = (void (**)(id, id))a7;
  if (v10)
  {
    id v13 = v10;
    int v14 = [v13 statusCode];
    if ((SSIsInternalBuild() & 1) != 0 || SSIsSeedBuild())
    {
      int v15 = [v13 allHeaderFields];
      v69 = [v15 objectForKey:*MEMORY[0x263F7B7D0]];
    }
    else
    {
      v69 = 0;
    }
    id v66 = v10;
    int v16 = [v13 allHeaderFields];
    v68 = [v16 objectForKey:@"X-Apple-Application-Site"];

    unint64_t v17 = 0x263F7B000uLL;
    int v18 = [MEMORY[0x263F7B1F8] sharedConfig];
    if (!v18)
    {
      int v18 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v19 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    id v21 = [v18 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      int v22 = v20;
    }
    else {
      int v22 = v20 & 2;
    }
    id v67 = v13;
    if (v22)
    {
      int v23 = objc_opt_class();
      id v24 = v23;
      long long v25 = [(ISURLOperation *)self logKey];
      int v71 = 138544386;
      v72 = v23;
      __int16 v73 = 2114;
      v74 = v25;
      __int16 v75 = 2048;
      v76 = (void *)v14;
      __int16 v77 = 2114;
      v78 = v69;
      __int16 v79 = 2114;
      id v13 = v67;
      id v80 = v68;
      LODWORD(v61) = 52;
      uint64_t v60 = &v71;
      int v26 = (void *)_os_log_send_and_compose_impl();

      unint64_t v17 = 0x263F7B000;
      if (v26)
      {
        objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v71, v61);
        int v27 = (int *)objc_claimAutoreleasedReturnValue();
        free(v26);
        uint64_t v60 = v27;
        SSFileLog();
      }
    }
    else
    {
    }
    if (!SSIsInternalBuild())
    {
LABEL_31:
      id v70 = 0;
      BOOL v41 = -[ISURLOperation _shouldFollowRedirectWithRequest:error:](self, "_shouldFollowRedirectWithRequest:error:", v11, &v70, v60);
      id v42 = v70;
      if (v41)
      {
        if ([(ISURLOperation *)self _shouldSetCookies]
          && [(ISURLOperation *)self _usesPrivateCookieStore])
        {
          uint64_t v43 = [(ISURLOperation *)self _requestProperties];
          [v43 URLBagType];
          id v44 = v12;
          uint64_t v45 = SSAccountScopeForURLBagType();

          id v46 = [MEMORY[0x263F7B380] sharedStorage];
          __int16 v47 = [(ISURLOperation *)self _accountIdentifier];
          uint64_t v48 = v45;
          id v12 = v44;
          [v46 setCookiesForHTTPResponse:v13 userIdentifier:v47 scope:v48];
        }
        uint64_t v49 = [(ISURLOperation *)self _handleRedirectRequest:v11 response:v13];
        goto LABEL_48;
      }
      v50 = [*(id *)(v17 + 504) sharediTunesStoreConfig];
      if (!v50)
      {
        v50 = [*(id *)(v17 + 504) sharedConfig];
      }
      int v51 = [v50 shouldLog];
      if ([v50 shouldLogToDisk]) {
        v51 |= 2u;
      }
      v52 = [v50 OSLogObject];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
        int v53 = v51;
      }
      else {
        int v53 = v51 & 2;
      }
      if (v53)
      {
        v54 = objc_opt_class();
        id v65 = v54;
        [(ISURLOperation *)self logKey];
        v56 = v55 = v12;
        v57 = [(ISURLOperation *)self _sanitizedDescriptionForObject:v42];
        int v71 = 138543874;
        v72 = v54;
        __int16 v73 = 2114;
        v74 = v56;
        __int16 v75 = 2112;
        v76 = v57;
        LODWORD(v61) = 32;
        v58 = (void *)_os_log_send_and_compose_impl();

        id v12 = v55;
        if (!v58)
        {
LABEL_47:

          v59 = [(ISURLOperation *)self _errorWithDefaultStringsForError:v42];
          [(ISOperation *)self setError:v59];

          [(ISOperation *)self cancel];
          uint64_t v49 = 0;
          id v13 = v67;
LABEL_48:

          id v11 = (id)v49;
          id v10 = v66;
          goto LABEL_49;
        }
        v52 = objc_msgSend(NSString, "stringWithCString:encoding:", v58, 4, &v71, v61);
        free(v58);
        SSFileLog();
      }

      goto LABEL_47;
    }
    BOOL v28 = [v13 allHeaderFields];
    int v29 = [v28 description];

    id v30 = [*(id *)(v17 + 504) sharediTunesStoreConfigOversize];
    if (!v30)
    {
      id v30 = [*(id *)(v17 + 504) sharedConfig];
    }
    int v31 = objc_msgSend(v30, "shouldLog", v60);
    if ([v30 shouldLogToDisk]) {
      v31 |= 2u;
    }
    id v32 = [v30 OSLogObject];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      int v33 = v31;
    }
    else {
      int v33 = v31 & 2;
    }
    if (v33)
    {
      id v34 = objc_opt_class();
      id v62 = v34;
      [(ISURLOperation *)self logKey];
      v35 = uint64_t v64 = v11;
      int v36 = [v64 URL];
      [(ISURLOperation *)self _sanitizedURLForURL:v36];
      v38 = int v37 = v29;
      [(ISURLOperation *)self _sanitizedStringForString:v37];
      uint64_t v39 = v63 = v12;
      int v71 = 138544130;
      v72 = v34;
      __int16 v73 = 2114;
      v74 = v35;
      __int16 v75 = 2114;
      v76 = v38;
      __int16 v77 = 2114;
      v78 = v39;
      LODWORD(v61) = 42;
      uint64_t v60 = &v71;
      id v40 = (void *)_os_log_send_and_compose_impl();

      unint64_t v17 = 0x263F7B000uLL;
      id v12 = v63;

      int v29 = v37;
      id v11 = v64;
      id v13 = v67;

      if (!v40)
      {
LABEL_30:

        goto LABEL_31;
      }
      id v32 = objc_msgSend(NSString, "stringWithCString:encoding:", v40, 4, &v71, v61);
      free(v40);
      uint64_t v60 = (int *)v32;
      SSFileLog();
    }

    goto LABEL_30;
  }
LABEL_49:
  v12[2](v12, v11);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  [(ISURLOperation *)self _handleReceivedData:a5];
  id v9 = [(ISURLOperation *)self dataProvider];
  int v10 = [v9 isStream];

  if (v10)
  {
    id v11 = [(ISURLOperation *)self dataProvider];
    int v12 = [v11 isStreamComplete];

    if (v12)
    {
      [v8 cancel];
      id v13 = (void *)MEMORY[0x263F7B370];
      int v14 = [v8 _timingData];
      int v15 = [v13 eventFromTimingData:v14 delegate:self session:v16 task:v8 error:0];

      [(ISURLOperation *)self URLSession:v16 task:v8 didCompleteWithEvent:v15 error:0];
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8 = (void (**)(id, uint64_t))a6;
  [(ISURLOperation *)self _handleReceivedResponse:a5];
  v8[2](v8, 1);
}

+ (_CFURLCache)sharedCFURLCache
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__ISURLOperation_sharedCFURLCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCFURLCache_sOnce != -1) {
    dispatch_once(&sharedCFURLCache_sOnce, block);
  }
  return (_CFURLCache *)sharedCFURLCache__shared;
}

uint64_t __34__ISURLOperation_sharedCFURLCache__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _sharedCacheStorageSession])
  {
    uint64_t result = _CFURLStorageSessionCopyCache();
    if (!result) {
      return result;
    }
    uint64_t v2 = result;
    CFURLCacheSetDiskCapacity();
    uint64_t result = CFURLCacheSetMemoryCapacity();
  }
  else
  {
    uint64_t result = CFURLCacheCopySharedURLCache();
    uint64_t v2 = result;
  }
  sharedCFURLCache__shared = v2;
  return result;
}

- (SSHTTPArchive)HTTPArchive
{
  [(ISOperation *)self lock];
  char v3 = self->_httpArchive;
  [(ISOperation *)self unlock];

  return v3;
}

- (ISURLRequestPerformance)performanceMetrics
{
  [(ISOperation *)self lock];
  char v3 = self->_performanceMetrics;
  [(ISOperation *)self unlock];

  return v3;
}

- (void)setTracksPerformanceMetrics:(BOOL)a3
{
  BOOL v3 = a3;
  [(ISOperation *)self lock];
  performanceMetrics = self->_performanceMetrics;
  if (v3)
  {
    if (performanceMetrics) {
      goto LABEL_6;
    }
    uint64_t v6 = objc_alloc_init(ISURLRequestPerformance);
    performanceMetrics = self->_performanceMetrics;
  }
  else
  {
    uint64_t v6 = 0;
  }
  self->_performanceMetrics = v6;

LABEL_6:

  [(ISOperation *)self unlock];
}

- (BOOL)tracksPerformanceMetrics
{
  [(ISOperation *)self lock];
  BOOL v3 = self->_performanceMetrics != 0;
  [(ISOperation *)self unlock];
  return v3;
}

- (id)_accountIdentifier
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  BOOL v3 = [(ISURLOperation *)self logKey];
  char v4 = [MEMORY[0x263F7B1F8] sharedAccountsConfig];
  if (!v4)
  {
    char v4 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    int v8 = v6;
  }
  else {
    int v8 = v6 & 2;
  }
  if (!v8) {
    goto LABEL_12;
  }
  id v9 = objc_opt_class();
  id v10 = v9;
  id v11 = [(ISURLOperation *)self requestProperties];
  int v12 = [v11 URL];
  *(_DWORD *)id v62 = 138543874;
  *(void *)&v62[4] = v9;
  *(_WORD *)&v62[12] = 2114;
  *(void *)&v62[14] = v3;
  *(_WORD *)&v62[22] = 2114;
  v63 = v12;
  LODWORD(v61) = 32;
  uint64_t v60 = v62;
  id v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, v62, v61);
    free(v13);
    uint64_t v60 = v7;
    SSFileLog();
LABEL_12:
  }
  uint64_t v14 = [(ISURLOperation *)self _accountDSIDOverride];
  if (v14)
  {
    int v15 = (void *)v14;
    id v16 = [(ISURLOperation *)self _accountDSIDOverride];
    char v17 = [v16 isEqualToNumber:&unk_26C6B0578];

    if ((v17 & 1) == 0)
    {
      id v38 = [MEMORY[0x263F7B1F8] sharedAccountsConfig];
      if (!v38)
      {
        id v38 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v39 = objc_msgSend(v38, "shouldLog", v60);
      if ([v38 shouldLogToDisk]) {
        int v40 = v39 | 2;
      }
      else {
        int v40 = v39;
      }
      BOOL v41 = [v38 OSLogObject];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
        int v42 = v40;
      }
      else {
        int v42 = v40 & 2;
      }
      if (v42)
      {
        uint64_t v43 = objc_opt_class();
        id v44 = v43;
        uint64_t v45 = [(ISURLOperation *)self _accountDSIDOverride];
        id v46 = [v45 stringValue];
        __int16 v47 = SSHashIfNeeded();
        *(_DWORD *)id v62 = 138543874;
        *(void *)&v62[4] = v43;
        *(_WORD *)&v62[12] = 2114;
        *(void *)&v62[14] = v3;
        *(_WORD *)&v62[22] = 2114;
        v63 = v47;
        LODWORD(v61) = 32;
        uint64_t v48 = (void *)_os_log_send_and_compose_impl();

        if (!v48)
        {
LABEL_53:

          int v37 = [(ISURLOperation *)self _accountDSIDOverride];
          goto LABEL_79;
        }
        BOOL v41 = objc_msgSend(NSString, "stringWithCString:encoding:", v48, 4, v62, v61);
        free(v48);
        SSFileLog();
      }

      goto LABEL_53;
    }
  }
  int v18 = [(ISOperation *)self authenticatedAccountDSID];
  id v19 = v18;
  if (!v18 || ![v18 unsignedLongLongValue])
  {
    int v29 = [(ISURLOperation *)self authenticationContext];
    id v30 = [v29 requiredUniqueIdentifier];

    if (v30 && [v30 unsignedLongLongValue])
    {
      int v20 = [MEMORY[0x263F7B1F8] sharedAccountsConfig];
      if (!v20)
      {
        int v20 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v31 = [v20 shouldLog];
      if ([v20 shouldLogToDisk]) {
        v31 |= 2u;
      }
      int v23 = [v20 OSLogObject];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        v31 &= 2u;
      }
      if (v31)
      {
        id v32 = objc_opt_class();
        id v33 = v32;
        id v34 = [v30 stringValue];
        id v35 = SSHashIfNeeded();
        *(_DWORD *)id v62 = 138543874;
        *(void *)&v62[4] = v32;
        *(_WORD *)&v62[12] = 2114;
        *(void *)&v62[14] = v3;
        *(_WORD *)&v62[22] = 2114;
        v63 = v35;
        LODWORD(v61) = 32;
        int v36 = (void *)_os_log_send_and_compose_impl();

        if (!v36)
        {
          id v19 = v30;
          goto LABEL_40;
        }
        int v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v36, 4, v62, v61);
        free(v36);
        SSFileLog();
      }
      id v19 = v30;
      goto LABEL_39;
    }
    uint64_t v49 = [(ISURLOperation *)self _requestProperties];
    [v49 URLBagType];
    uint64_t v50 = SSAccountScopeForURLBagType();

    int v51 = [MEMORY[0x263F7B0E8] defaultStore];
    v52 = v51;
    if (v50 == 1)
    {
      int v53 = [v51 activeSandboxAccount];
      id v19 = [v53 uniqueIdentifier];

      if (v19 && [v19 unsignedLongLongValue])
      {
        int v20 = [MEMORY[0x263F7B1F8] sharedAccountsConfig];
        if (!v20)
        {
          int v20 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v54 = [v20 shouldLog];
        if ([v20 shouldLogToDisk]) {
          int v55 = v54 | 2;
        }
        else {
          int v55 = v54;
        }
        int v23 = [v20 OSLogObject];
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
          v55 &= 2u;
        }
        if (!v55) {
          goto LABEL_39;
        }
        goto LABEL_25;
      }
    }
    else
    {
      v56 = [v51 activeAccount];
      id v19 = [v56 uniqueIdentifier];

      if (v19 && [v19 unsignedLongLongValue])
      {
        int v20 = [MEMORY[0x263F7B1F8] sharedAccountsConfig];
        if (!v20)
        {
          int v20 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v57 = [v20 shouldLog];
        if ([v20 shouldLogToDisk]) {
          int v58 = v57 | 2;
        }
        else {
          int v58 = v57;
        }
        int v23 = [v20 OSLogObject];
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
          v58 &= 2u;
        }
        if (!v58) {
          goto LABEL_39;
        }
        goto LABEL_25;
      }
    }
    int v37 = 0;
    goto LABEL_78;
  }
  int v20 = [MEMORY[0x263F7B1F8] sharedAccountsConfig];
  if (!v20)
  {
    int v20 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v21 = [v20 shouldLog];
  if ([v20 shouldLogToDisk]) {
    int v22 = v21 | 2;
  }
  else {
    int v22 = v21;
  }
  int v23 = [v20 OSLogObject];
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
    v22 &= 2u;
  }
  if (!v22) {
    goto LABEL_39;
  }
LABEL_25:
  id v24 = objc_opt_class();
  id v25 = v24;
  int v26 = [v19 stringValue];
  int v27 = SSHashIfNeeded();
  *(_DWORD *)id v62 = 138543874;
  *(void *)&v62[4] = v24;
  *(_WORD *)&v62[12] = 2114;
  *(void *)&v62[14] = v3;
  *(_WORD *)&v62[22] = 2114;
  v63 = v27;
  LODWORD(v61) = 32;
  BOOL v28 = (void *)_os_log_send_and_compose_impl();

  if (v28)
  {
    int v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, v62, v61, *(_OWORD *)v62, *(void *)&v62[16], v63);
    free(v28);
    SSFileLog();
LABEL_39:
  }
LABEL_40:

  id v19 = v19;
  int v37 = v19;
LABEL_78:

LABEL_79:

  return v37;
}

- (NSURLRequest)_activeURLRequest
{
  return self->_activeURLRequest;
}

- (id)_copyAuthenticationContext
{
  uint64_t v2 = [(ISURLOperation *)self authenticationContext];
  BOOL v3 = (void *)[v2 mutableCopy];

  return v3;
}

- (BOOL)_processResponseData:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

- (id)_requestProperties
{
  [(ISOperation *)self lock];
  BOOL v3 = self->_requestProperties;
  [(ISOperation *)self unlock];

  return v3;
}

- (id)_sanitizedDescriptionForObject:(id)a3
{
  char v4 = [a3 description];
  int v5 = [(ISURLOperation *)self _sanitizedStringForString:v4];

  return v5;
}

- (id)_sanitizedStringForString:(id)a3
{
  id v4 = a3;
  [(ISOperation *)self lock];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  char v6 = objc_opt_respondsToSelector();

  id v7 = v4;
  if (v6)
  {
    id v8 = objc_loadWeakRetained((id *)&self->super._delegate);
    id v7 = [v8 operation:self sanitizedStringForString:v4];
  }
  [(ISOperation *)self unlock];

  return v7;
}

- (id)_sanitizedURLForURL:(id)a3
{
  id v4 = a3;
  [(ISOperation *)self lock];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  char v6 = objc_opt_respondsToSelector();

  id v7 = v4;
  if (v6)
  {
    id v8 = objc_loadWeakRetained((id *)&self->super._delegate);
    id v9 = [v4 absoluteString];
    id v7 = [v8 operation:self sanitizedStringForString:v9];
  }
  [(ISOperation *)self unlock];

  return v7;
}

- (void)_handleFinishedLoading
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  [(ISOperation *)self lock];
  if (self->_performanceMetrics)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    -[ISURLRequestPerformance setFinishTime:](self->_performanceMetrics, "setFinishTime:");
    id v4 = self->_performanceMetrics;
  }
  else
  {
    id v4 = 0;
    CFAbsoluteTime Current = 0.0;
  }
  [(ISOperation *)self unlock];
  if ([(ISURLOperation *)self isCancelled]) {
    goto LABEL_71;
  }
  uint64_t v5 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  char v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      char v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    id v9 = [v6 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      int v10 = v8;
    }
    else {
      int v10 = v8 & 2;
    }
    if (v10)
    {
      id v11 = objc_opt_class();
      id v12 = v11;
      id v13 = [(ISURLOperation *)self logKey];
      [(ISURLRequestPerformance *)v4 finishInterval];
      uint64_t v15 = v14;
      id v16 = [(ISURLOperation *)self _activeURL];
      char v17 = [(ISURLOperation *)self _sanitizedURLForURL:v16];
      *(_DWORD *)v82 = 138544386;
      *(void *)&v82[4] = v11;
      *(_WORD *)&v82[12] = 2114;
      *(void *)&v82[14] = v13;
      *(_WORD *)&v82[22] = 2048;
      id v83 = *(uint64_t (**)(uint64_t, uint64_t))&Current;
      *(_WORD *)long long v84 = 2048;
      *(void *)&v84[2] = v15;
      *(_WORD *)&v84[10] = 2112;
      *(void *)&v84[12] = v17;
      LODWORD(v60) = 52;
      v59 = (int *)v82;
      int v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18) {
        goto LABEL_29;
      }
      goto LABEL_16;
    }
    goto LABEL_28;
  }
  if (!v5)
  {
    char v6 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v20 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v21 = v20 | 2;
  }
  else {
    int v21 = v20;
  }
  id v9 = [v6 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    int v22 = v21;
  }
  else {
    int v22 = v21 & 2;
  }
  if (!v22)
  {
LABEL_28:

    goto LABEL_29;
  }
  int v23 = objc_opt_class();
  id v24 = v23;
  id v25 = [(ISURLOperation *)self logKey];
  int v26 = [(ISURLOperation *)self _activeURL];
  int v27 = [(ISURLOperation *)self _sanitizedURLForURL:v26];
  *(_DWORD *)v82 = 138543874;
  *(void *)&v82[4] = v23;
  *(_WORD *)&v82[12] = 2114;
  *(void *)&v82[14] = v25;
  *(_WORD *)&v82[22] = 2112;
  id v83 = v27;
  LODWORD(v60) = 32;
  v59 = (int *)v82;
  int v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
LABEL_16:
    objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, v82, v60);
    id v19 = (int *)objc_claimAutoreleasedReturnValue();
    free(v18);
    v59 = v19;
    SSFileLog();
  }
LABEL_29:

  BOOL v28 = [(ISURLOperation *)self dataProvider];
  *(void *)v82 = 0;
  *(void *)&v82[8] = v82;
  *(void *)&v82[16] = 0x3032000000;
  id v83 = __Block_byref_object_copy__2;
  *(void *)long long v84 = __Block_byref_object_dispose__2;
  *(void *)&v84[8] = 0;
  uint64_t v72 = 0;
  __int16 v73 = &v72;
  uint64_t v74 = 0x3032000000;
  __int16 v75 = __Block_byref_object_copy__2;
  v76 = __Block_byref_object_dispose__2;
  id v77 = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 1;
  dataBufferAccessQueue = self->_dataBufferAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__ISURLOperation__handleFinishedLoading__block_invoke;
  block[3] = &unk_264260CA8;
  id v65 = v82;
  id v30 = v28;
  id v63 = v30;
  uint64_t v64 = self;
  id v66 = &v68;
  id v67 = &v72;
  dispatch_sync(dataBufferAccessQueue, block);
  BOOL v31 = *((unsigned char *)v69 + 24) == 0;
  if (!*((unsigned char *)v69 + 24))
  {
    if ([v30 errorHandlerResponseType] == 2)
    {
      id v46 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v46)
      {
        id v46 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v47 = objc_msgSend(v46, "shouldLog", v59);
      int v48 = [v46 shouldLogToDisk];
      uint64_t v49 = [v46 OSLogObject];
      uint64_t v50 = v49;
      if (v48) {
        v47 |= 2u;
      }
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        int v51 = v47;
      }
      else {
        int v51 = v47 & 2;
      }
      if (v51)
      {
        id v52 = (id)objc_opt_class();
        int v53 = [(ISURLOperation *)self _sanitizedDescriptionForObject:*(void *)(*(void *)&v82[8] + 40)];
        int v78 = 138412546;
        id v79 = v52;
        __int16 v80 = 2112;
        uint64_t v81 = v53;
        LODWORD(v60) = 22;
        v59 = &v78;
        int v54 = (void *)_os_log_send_and_compose_impl();

        if (!v54) {
          goto LABEL_56;
        }
        uint64_t v50 = objc_msgSend(NSString, "stringWithCString:encoding:", v54, 4, &v78, v60);
        free(v54);
        v59 = (int *)v50;
        SSFileLog();
      }

      goto LABEL_56;
    }
    if (SSDebugShouldLogResponseBodies())
    {
      int v57 = [(ISURLOperation *)self response];
      [(ISURLOperation *)self _logResponseBody:v57];
    }
    -[ISOperation setError:](self, "setError:", *(void *)(*(void *)&v82[8] + 40), v59);
    goto LABEL_68;
  }
  id v32 = [v30 redirectURL];
  BOOL v33 = v32 == 0;

  if (v33)
  {
    if (v30)
    {
      int v55 = [v30 output];
      [(ISURLOperation *)self _sendOutputToDelegate:v55];
    }
    else
    {
      [(ISURLOperation *)self _sendOutputToDelegate:v73[5]];
    }
    if (SSDebugShouldLogResponseBodies() && ([v30 isStream] & 1) == 0)
    {
      int v58 = [(ISURLOperation *)self response];
      [(ISURLOperation *)self _logResponseBody:v58];
    }
    -[ISOperation setSuccess:](self, "setSuccess:", 1, v59);
LABEL_68:
    BOOL v31 = 0;
    goto LABEL_69;
  }
  redirectURLs = self->_redirectURLs;
  id v35 = [v30 redirectURL];
  LODWORD(redirectURLs) = [(NSCountedSet *)redirectURLs countForObject:v35] > 4;

  if (redirectURLs)
  {
    int v36 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v36)
    {
      int v36 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v37 = objc_msgSend(v36, "shouldLog", v59);
    int v38 = [v36 shouldLogToDisk];
    int v39 = [v36 OSLogObject];
    int v40 = v39;
    if (v38) {
      v37 |= 2u;
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
      int v41 = v37;
    }
    else {
      int v41 = v37 & 2;
    }
    if (v41)
    {
      id v42 = (id)objc_opt_class();
      uint64_t v43 = [v30 redirectURL];
      id v44 = [(ISURLOperation *)self _sanitizedURLForURL:v43];
      int v78 = 138412546;
      id v79 = v42;
      __int16 v80 = 2112;
      uint64_t v81 = v44;
      LODWORD(v60) = 22;
      v59 = &v78;
      uint64_t v45 = (void *)_os_log_send_and_compose_impl();

      if (!v45)
      {
LABEL_43:

        id v46 = [(ISURLOperation *)self _errorWithDomain:*MEMORY[0x263F7B758] code:109];
        [(ISOperation *)self setError:v46];
LABEL_56:

        goto LABEL_69;
      }
      int v40 = objc_msgSend(NSString, "stringWithCString:encoding:", v45, 4, &v78, v60);
      free(v45);
      v59 = (int *)v40;
      SSFileLog();
    }

    goto LABEL_43;
  }
  uint64_t v56 = *(void *)&v82[8];
  obuint64_t j = *(id *)(*(void *)&v82[8] + 40);
  BOOL v31 = [(ISURLOperation *)self handleRedirectFromDataProvider:v30 error:&obj];
  objc_storeStrong((id *)(v56 + 40), obj);
  [(ISOperation *)self setError:*(void *)(*(void *)&v82[8] + 40)];
LABEL_69:

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);

  _Block_object_dispose(v82, 8);
  if (!v31)
  {
LABEL_71:
    [(ISOperation *)self stopRunLoop];
    goto LABEL_72;
  }
  [(ISURLOperation *)self _retry];
LABEL_72:
}

void __40__ISURLOperation__handleFinishedLoading__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) closeStream];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 40) error];

    if (!v5) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v9 = *(void **)(a1 + 32);
    if (v9)
    {
      if (([v9 isStream] & 1) == 0)
      {
        int v10 = *(void **)(a1 + 40);
        uint64_t v11 = v10[43];
        uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
        obuint64_t j = *(id *)(v12 + 40);
        char v13 = [v10 _processResponseData:v11 error:&obj];
        objc_storeStrong((id *)(v12 + 40), obj);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v13;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
        {
          [*(id *)(a1 + 40) lock];
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 248));
          char v15 = objc_opt_respondsToSelector();

          id v16 = *(id **)(a1 + 40);
          if (v15)
          {
            id v17 = objc_loadWeakRetained(v16 + 31);
            [*(id *)(a1 + 40) unlock];
            if (v17)
            {
              uint64_t v18 = *(void *)(a1 + 40);
              uint64_t v19 = *(void *)(v18 + 344);
              uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
              id v31 = *(id *)(v20 + 40);
              char v21 = [v17 operation:v18 processData:v19 error:&v31];
              objc_storeStrong((id *)(v20 + 40), v31);
              *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v21;
            }
          }
          else
          {
            [v16 unlock];
          }
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
          {
            uint64_t v22 = [*(id *)(a1 + 40) _decodedDataForData:*(void *)(*(void *)(a1 + 40) + 344)];
            uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
            id v24 = *(void **)(v23 + 40);
            *(void *)(v23 + 40) = v22;

            id v25 = *(void **)(a1 + 32);
            int v26 = [*(id *)(a1 + 40) response];
            [v25 setResponse:v26];

            int v27 = *(void **)(a1 + 32);
            uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
            uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
            id v30 = *(id *)(v29 + 40);
            LOBYTE(v26) = [v27 parseData:v28 returningError:&v30];
            objc_storeStrong((id *)(v29 + 40), v30);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)v26;
          }
        }
      }
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 344) copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)_handleReceivedData:(id)a3
{
  id v4 = a3;
  if (([(ISURLOperation *)self isCancelled] & 1) == 0)
  {
    uint64_t v5 = [(ISURLOperation *)self dataProvider];
    if ([v5 isStream])
    {
      id v10 = 0;
      char v6 = [v5 parseData:v4 returningError:&v10];
      id v7 = v10;
      if ((v6 & 1) == 0)
      {
        int v8 = [(ISURLOperation *)self _errorWithDefaultStringsForError:v7];
        [(ISOperation *)self setError:v8];

        [(ISURLOperation *)self _stopConnection];
      }
    }
    else
    {
      dataBufferAccessQueue = self->_dataBufferAccessQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __38__ISURLOperation__handleReceivedData___block_invoke;
      block[3] = &unk_264260B58;
      id v12 = v4;
      char v13 = self;
      dispatch_sync(dataBufferAccessQueue, block);
      id v7 = v12;
    }
  }
}

uint64_t __38__ISURLOperation__handleReceivedData___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(*(void *)(result + 40) + 344), "appendData:");
  }
  return result;
}

- (void)_handleReceivedResponse:(id)a3
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  [(ISOperation *)self lock];
  [(ISURLRequestPerformance *)self->_performanceMetrics setReceivedResponseTime:CFAbsoluteTimeGetCurrent()];
  [(ISURLRequestPerformance *)self->_performanceMetrics setURLResponse:v4];
  id v7 = self->_performanceMetrics;
  [(ISOperation *)self unlock];
  if (!v6)
  {
    uint64_t v8 = 200;
    goto LABEL_52;
  }
  uint64_t v8 = [v6 statusCode];
  if ((SSIsInternalBuild() & 1) != 0 || SSIsSeedBuild())
  {
    id v9 = objc_msgSend(v4, "itunes_allHeaderFields");
    long long v90 = [v9 objectForKey:*MEMORY[0x263F7B7D0]];
  }
  else
  {
    long long v90 = 0;
  }
  id v10 = [v6 allHeaderFields];
  long long v89 = [v10 objectForKey:@"X-Apple-Application-Site"];

  unint64_t v11 = 0x263F7B000uLL;
  uint64_t v12 = [MEMORY[0x263F7B1F8] sharedConfig];
  char v13 = (void *)v12;
  long long v87 = v7;
  if (v7)
  {
    if (!v12)
    {
      char v13 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      v14 |= 2u;
    }
    char v15 = [v13 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      int v16 = v14;
    }
    else {
      int v16 = v14 & 2;
    }
    if (v16)
    {
      id v17 = objc_opt_class();
      id v18 = v17;
      [(ISURLOperation *)self logKey];
      v20 = uint64_t v19 = v8;
      [(ISURLRequestPerformance *)v87 receivedResponseInterval];
      int v95 = 138544642;
      __int16 v96 = v17;
      __int16 v97 = 2114;
      *(void *)v98 = v20;
      *(_WORD *)&v98[8] = 2048;
      *(void *)&v98[10] = v21;
      __int16 v99 = 2048;
      uint64_t v100 = v19;
      __int16 v101 = 2114;
      v102 = v90;
      __int16 v103 = 2114;
      v104 = v89;
      LODWORD(v80) = 62;
      int v78 = &v95;
      uint64_t v22 = (void *)_os_log_send_and_compose_impl();

      if (v22)
      {
        objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v95, v80);
        uint64_t v23 = (int *)objc_claimAutoreleasedReturnValue();
        free(v22);
        int v78 = v23;
        SSFileLog();
      }
      uint64_t v8 = v19;
LABEL_32:
      unint64_t v11 = 0x263F7B000;
      goto LABEL_34;
    }
  }
  else
  {
    if (!v12)
    {
      char v13 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v24 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      v24 |= 2u;
    }
    char v15 = [v13 OSLogObject];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      v24 &= 2u;
    }
    if (v24)
    {
      id v25 = objc_opt_class();
      id v26 = v25;
      uint64_t v27 = [(ISURLOperation *)self logKey];
      uint64_t v28 = v8;
      uint64_t v29 = (void *)v27;
      int v95 = 138544386;
      __int16 v96 = v25;
      __int16 v97 = 2114;
      *(void *)v98 = v27;
      *(_WORD *)&v98[8] = 2048;
      uint64_t v30 = v28;
      *(void *)&v98[10] = v28;
      __int16 v99 = 2114;
      uint64_t v100 = (uint64_t)v90;
      __int16 v101 = 2114;
      v102 = v89;
      LODWORD(v80) = 52;
      int v78 = &v95;
      id v31 = (void *)_os_log_send_and_compose_impl();

      if (v31)
      {
        objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, &v95, v80);
        id v32 = (int *)objc_claimAutoreleasedReturnValue();
        free(v31);
        int v78 = v32;
        SSFileLog();
      }
      uint64_t v8 = v30;
      goto LABEL_32;
    }
  }

LABEL_34:
  if (!SSIsInternalBuild()) {
    goto LABEL_48;
  }
  uint64_t v83 = v8;
  BOOL v33 = [v6 allHeaderFields];
  id v34 = [v33 description];

  id v35 = [*(id *)(v11 + 504) sharediTunesStoreConfig];
  if (!v35)
  {
    id v35 = [*(id *)(v11 + 504) sharedConfig];
  }
  int v36 = objc_msgSend(v35, "shouldLog", v78);
  if ([v35 shouldLogToDisk]) {
    int v37 = v36 | 2;
  }
  else {
    int v37 = v36;
  }
  int v38 = [v35 OSLogObject];
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
    int v39 = v37;
  }
  else {
    int v39 = v37 & 2;
  }
  if (!v39) {
    goto LABEL_46;
  }
  int v40 = objc_opt_class();
  id v81 = v40;
  [(ISURLOperation *)self logKey];
  int v41 = v82 = v34;
  id v42 = [v4 URL];
  uint64_t v43 = [(ISURLOperation *)self _sanitizedURLForURL:v42];
  [(ISURLOperation *)self _sanitizedStringForString:v82];
  id v44 = v84 = v6;
  int v95 = 138544130;
  __int16 v96 = v40;
  __int16 v97 = 2114;
  *(void *)v98 = v41;
  *(_WORD *)&v98[8] = 2112;
  *(void *)&v98[10] = v43;
  __int16 v99 = 2112;
  uint64_t v100 = (uint64_t)v44;
  LODWORD(v80) = 42;
  int v78 = &v95;
  uint64_t v45 = (void *)_os_log_send_and_compose_impl();

  id v6 = v84;
  id v34 = v82;

  if (v45)
  {
    int v38 = objc_msgSend(NSString, "stringWithCString:encoding:", v45, 4, &v95, v80);
    free(v45);
    int v78 = (int *)v38;
    SSFileLog();
LABEL_46:
  }
  uint64_t v8 = v83;
LABEL_48:
  id v7 = v87;
  if ([(ISURLOperation *)self _shouldSetCookies]
    && [(ISURLOperation *)self _usesPrivateCookieStore])
  {
    id v46 = [(ISURLOperation *)self _requestProperties];
    [v46 URLBagType];
    uint64_t v47 = SSAccountScopeForURLBagType();

    int v48 = [MEMORY[0x263F7B380] sharedStorage];
    [(ISURLOperation *)self _accountIdentifier];
    v50 = id v49 = v6;
    [v48 setCookiesForHTTPResponse:v49 userIdentifier:v50 scope:v47];

    id v6 = v49;
  }

LABEL_52:
  [(ISURLOperation *)self setResponse:v4];
  dataBufferAccessQueue = self->_dataBufferAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__ISURLOperation__handleReceivedResponse___block_invoke;
  block[3] = &unk_264260B08;
  void block[4] = self;
  dispatch_sync(dataBufferAccessQueue, block);
  [(ISURLOperation *)self handleResponse:v4];
  [(ISURLOperation *)self _sendResponseToDelegate:v4];
  if (![(ISURLOperation *)self _isPassThroughStatus:v8]
    && v8 != 416
    && (unint64_t)(v8 - 1000) >= 0xFFFFFFFFFFFFFDA8
    && ![(ISURLOperation *)self _loadsHTTPFailures])
  {
    int v53 = [(ISURLOperation *)self _errorWithDomain:*MEMORY[0x263F7B758] code:109];
    uint64_t v56 = [NSNumber numberWithInteger:v8];
    int v57 = SSErrorBySettingUserInfoValue();
    [(ISOperation *)self setError:v57];

    [(ISURLOperation *)self _stopConnection];
LABEL_95:

    goto LABEL_96;
  }
  if (([(ISURLOperation *)self isCancelled] & 1) == 0)
  {
    uint64_t v52 = objc_msgSend(v4, "itunes_maxExpectedContentLength");
    int v53 = [(ISURLOperation *)self dataProvider];
    [v53 setContentLength:v52];
    int v54 = [v4 MIMEType];
    [v53 setContentType:v54];

    [v53 setup];
    if (v8 == 416)
    {
      uint64_t v52 = [v53 streamedBytes];
LABEL_59:
      int v55 = 1;
      goto LABEL_78;
    }
    if ([v53 isStream] && v52 > 0 && objc_msgSend(v53, "streamedBytes") == v52) {
      goto LABEL_59;
    }
    int v55 = 0;
    if ([v53 streamedBytes] < 1 || v8 == 206)
    {
LABEL_78:
      -[ISURLOperation _sendContentLengthToDelegate:](self, "_sendContentLengthToDelegate:", v52, v78);
      [(SSOperationProgress *)self->super._progress setCanPause:1];
      [(SSOperationProgress *)self->super._progress resetSnapshots];
      [(SSOperationProgress *)self->super._progress setMaxValue:v52];
      [(SSOperationProgress *)self->super._progress setOperationType:2];
      [(SSOperationProgress *)self->super._progress setUnits:1];
      [(ISURLOperation *)self _updateProgress];
      if (!v55)
      {
        id v93 = 0;
        int v76 = [(ISURLOperation *)self _validateContentLength:v52 error:&v93];
        id v75 = v93;
        if (v76)
        {
LABEL_94:

          goto LABEL_95;
        }
        id v77 = [(ISURLOperation *)self _errorWithDefaultStringsForError:v75];
        [(ISOperation *)self setError:v77];

LABEL_93:
        [(ISURLOperation *)self _stopConnection];
        goto LABEL_94;
      }
      id v86 = v6;
      id v66 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v66)
      {
        id v66 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v67 = [v66 shouldLog];
      if ([v66 shouldLogToDisk]) {
        v67 |= 2u;
      }
      uint64_t v68 = [v66 OSLogObject];
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO)) {
        int v69 = v67;
      }
      else {
        int v69 = v67 & 2;
      }
      if (v69)
      {
        uint64_t v70 = objc_opt_class();
        id v92 = v70;
        [v4 URL];
        v72 = char v71 = v7;
        __int16 v73 = [(ISURLOperation *)self _sanitizedURLForURL:v72];
        int v95 = 138412546;
        __int16 v96 = v70;
        __int16 v97 = 2112;
        *(void *)v98 = v73;
        LODWORD(v80) = 22;
        id v79 = &v95;
        uint64_t v74 = (void *)_os_log_send_and_compose_impl();

        id v7 = v71;
        if (!v74)
        {
LABEL_90:

          [(ISOperation *)self setSuccess:1];
          id v75 = 0;
          id v6 = v86;
          goto LABEL_93;
        }
        uint64_t v68 = objc_msgSend(NSString, "stringWithCString:encoding:", v74, 4, &v95, v80);
        free(v74);
        id v79 = (int *)v68;
        SSFileLog();
      }

      goto LABEL_90;
    }
    id v85 = v6;
    long long v88 = v7;
    int v58 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v58)
    {
      int v58 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v59 = [v58 shouldLog];
    if ([v58 shouldLogToDisk]) {
      v59 |= 2u;
    }
    uint64_t v60 = [v58 OSLogObject];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT)) {
      int v61 = v59;
    }
    else {
      int v61 = v59 & 2;
    }
    if (v61)
    {
      id v62 = objc_opt_class();
      id v91 = v62;
      id v63 = [v4 URL];
      uint64_t v64 = [(ISURLOperation *)self _sanitizedURLForURL:v63];
      int v95 = 138412802;
      __int16 v96 = v62;
      __int16 v97 = 1024;
      *(_DWORD *)v98 = 206;
      *(_WORD *)&v98[4] = 2112;
      *(void *)&v98[6] = v64;
      LODWORD(v80) = 28;
      int v78 = &v95;
      id v65 = (void *)_os_log_send_and_compose_impl();

      if (!v65)
      {
LABEL_77:

        [v53 resetStream];
        int v55 = 0;
        id v6 = v85;
        id v7 = v88;
        goto LABEL_78;
      }
      uint64_t v60 = objc_msgSend(NSString, "stringWithCString:encoding:", v65, 4, &v95, v80);
      free(v65);
      int v78 = (int *)v60;
      SSFileLog();
    }

    goto LABEL_77;
  }
LABEL_96:
}

uint64_t __42__ISURLOperation__handleReceivedResponse___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 344) = objc_alloc_init(MEMORY[0x263EFF990]);

  return MEMORY[0x270F9A758]();
}

- (id)_handleRedirectRequest:(id)a3 response:(id)a4
{
  v40[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_activeURLRequest;
  id v9 = (void *)[v6 mutableCopy];
  BOOL v10 = [(ISURLOperation *)self _usesPrivateCookieStore];
  [v9 setHTTPShouldHandleCookies:!v10];
  unint64_t v11 = [(NSURLRequest *)v8 HTTPBody];
  if (v11) {
    [v9 setHTTPBody:v11];
  }
  id v34 = v7;
  uint64_t v12 = [(NSURLRequest *)v8 HTTPMethod];

  if (v12) {
    [v9 setHTTPMethod:v12];
  }
  BOOL v33 = v8;
  char v13 = [(NSURLRequest *)v8 allHTTPHeaderFields];
  v40[0] = @"Content-Type";
  uint64_t v14 = 0;
  v40[1] = (id)*MEMORY[0x263F7B7B0];
  v40[2] = @"X-Apple-Client-Address";
  do
  {
    char v15 = v12;
    int v16 = (void *)v40[v14];
    uint64_t v12 = ISDictionaryValueForCaseInsensitiveString(v13, v16);

    if (v12) {
      [v9 setValue:v12 forHTTPHeaderField:v16];
    }
    ++v14;
  }
  while (v14 != 3);
  if (v10)
  {
    id v17 = [(ISURLOperation *)self _requestProperties];
    [v17 URLBagType];
    uint64_t v18 = SSAccountScopeForURLBagType();

    uint64_t v19 = [MEMORY[0x263F7B380] sharedStorage];
    id v32 = v6;
    uint64_t v20 = [v6 URL];
    uint64_t v21 = [(ISURLOperation *)self _accountIdentifier];
    uint64_t v22 = [v19 cookieHeadersForURL:v20 userIdentifier:v21 scope:v18];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v29 = [v23 objectForKey:v28];
          [v9 setValue:v29 forHTTPHeaderField:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v25);
    }

    id v6 = v32;
  }
  [(ISURLOperation *)self _willSendRequest:v9];
  [(ISURLOperation *)self _setActiveURLRequest:v9];
  [(ISURLOperation *)self setResponse:v34];
  for (uint64_t j = 2; j != -1; --j)

  return v9;
}

- (id)_activeURL
{
  return [(NSURLRequest *)self->_activeURLRequest URL];
}

- (id)_copyConnectionPropertiesWithDataConnectionServiceType:(__CFString *)a3
{
  id v5 = objc_alloc(NSDictionary);
  id v6 = [NSNumber numberWithInteger:0x40000];
  uint64_t v7 = *MEMORY[0x263EFC890];
  uint64_t v8 = [NSNumber numberWithBool:0];
  id v9 = objc_msgSend(v5, "initWithObjectsAndKeys:", v6, v7, v8, *MEMORY[0x263EFC880], 0);

  BOOL v10 = [(ISURLOperation *)self _requestProperties];
  char v11 = [v10 shouldDisableCellular];
  uint64_t v12 = (void *)MEMORY[0x263EFFB40];
  if (v11)
  {
    char v13 = (void *)MEMORY[0x263EFC7D8];
    uint64_t v14 = (void *)MEMORY[0x263EFFB40];
  }
  else
  {
    if (![v10 shouldDisableCellularFallback])
    {
      if (([v10 isLargeDownload] & 1) == 0)
      {
        if (!a3)
        {
          id v15 = 0;
          goto LABEL_17;
        }
        goto LABEL_15;
      }
LABEL_9:
      id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      goto LABEL_10;
    }
    char v13 = (void *)MEMORY[0x263EFC750];
    uint64_t v14 = (void *)MEMORY[0x263EFFB38];
  }
  id v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", *v14, *v13, 0);
  if (([v10 isLargeDownload] & 1) == 0) {
    goto LABEL_11;
  }
  if (!v15) {
    goto LABEL_9;
  }
LABEL_10:
  [v15 setObject:*v12 forKey:*MEMORY[0x263EFC690]];
LABEL_11:
  if (a3)
  {
    if (v15)
    {
LABEL_16:
      [v15 setObject:a3 forKey:*MEMORY[0x263EFC770]];
      [v15 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFC778]];
      goto LABEL_17;
    }
LABEL_15:
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    goto LABEL_16;
  }
LABEL_17:
  int v16 = [v10 clientAuditBundleIdentifier];
  id v17 = [v10 clientAuditTokenData];
  uint64_t v18 = v17;
  if (v16 || [v17 length] == 32)
  {
    if (v15) {
      uint64_t v19 = (void *)[v15 mutableCopy];
    }
    else {
      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
    }
    uint64_t v20 = v19;
    if (v16)
    {
      uint64_t v21 = *MEMORY[0x263EFC810];
      uint64_t v22 = v16;
    }
    else
    {
      uint64_t v21 = *MEMORY[0x263EFC808];
      uint64_t v22 = v18;
    }
    [v19 setObject:v22 forKey:v21];
  }
  else
  {
    uint64_t v20 = v15;
  }
  id v23 = objc_alloc(NSDictionary);
  uint64_t v24 = objc_msgSend(v23, "initWithObjectsAndKeys:", v9, *MEMORY[0x263EFC898], v20, *MEMORY[0x263EFC888], 0);

  return v24;
}

- (id)_copyQueryStringDictionaryForRedirect:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ISURLOperation *)self _requestProperties];
  id v6 = [v5 requestParameters];
  uint64_t v7 = (void *)[v6 mutableCopy];

  if ([v7 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = (id)[v4 copyQueryStringDictionaryWithUnescapedValues:0];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v7, "removeObjectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * v12++), (void)v14);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  return v7;
}

- (id)_decodedDataForData:(id)a3
{
  id v4 = a3;
  id v5 = [(ISURLOperation *)self _requestProperties];
  char v6 = [v5 shouldDecodeResponse];

  id v7 = v4;
  if ((v6 & 1) == 0)
  {
    id v8 = [(ISURLOperation *)self response];
    uint64_t v9 = objc_msgSend(v8, "_iTunesStore_valueForHTTPHeader:", @"Content-Encoding");
    uint64_t v10 = v9;
    id v7 = v4;
    if (v9)
    {
      id v7 = v4;
      if (![v9 caseInsensitiveCompare:@"gzip"])
      {
        id v11 = ISCopyDecompressedGZipDataForData();
        uint64_t v12 = v11;
        id v7 = v4;
        if (v11)
        {
          id v7 = v11;
        }
      }
    }
  }

  return v7;
}

- (int64_t)_defaultAuthChallengeDispositionForChallenge:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 sender];
  char v6 = objc_opt_respondsToSelector();
  uint64_t v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  id v8 = (void *)v7;
  if ((v6 & 1) == 0)
  {
    if (!v7)
    {
      id v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v16 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    uint64_t v18 = [v8 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      uint64_t v19 = objc_opt_class();
      id v20 = v19;
      [(ISURLOperation *)self _sanitizedDescriptionForObject:v4];
      int v23 = 138412546;
      uint64_t v24 = v19;
      __int16 v25 = 2112;
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = 22;
      int64_t v15 = _os_log_send_and_compose_impl();

      if (!v15) {
        goto LABEL_25;
      }
      uint64_t v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v23, v22);
      free((void *)v15);
      SSFileLog();
    }

    int64_t v15 = 0;
    goto LABEL_25;
  }
  if (!v7)
  {
    id v8 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  id v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v12 = objc_opt_class();
  id v13 = v12;
  [(ISURLOperation *)self _sanitizedDescriptionForObject:v4];
  int v23 = 138412546;
  uint64_t v24 = v12;
  __int16 v25 = 2112;
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 22;
  long long v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v23, v22);
    free(v14);
    SSFileLog();
LABEL_12:
  }
  int64_t v15 = 1;
LABEL_25:

  return v15;
}

- (id)_errorWithDefaultStringsForError:(id)a3
{
  id v4 = a3;
  id v5 = SSError();
  char v6 = [v5 localizedDescription];
  uint64_t v7 = [v4 localizedDescription];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    int v9 = [v4 domain];
    int v10 = -[ISURLOperation _errorWithDomain:code:](self, "_errorWithDomain:code:", v9, [v4 code]);

    id v11 = [v10 localizedDescription];
    uint64_t v12 = SSErrorBySettingUserInfoValue();

    id v5 = v10;
  }
  else
  {
    uint64_t v12 = v4;
  }

  return v12;
}

- (id)_errorWithDomain:(id)a3 code:(int64_t)a4
{
  id v5 = a3;
  char v6 = [(ISURLOperation *)self _requestProperties];
  if ([v6 isITunesStoreRequest])
  {
    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v8 = [v7 localizedStringForKey:@"DEFAULT_ERROR_TITLE" value:&stru_26C6A2310 table:0];
LABEL_5:
    id v13 = SSError();
    goto LABEL_7;
  }
  int v9 = [(ISURLOperation *)self _activeURL];
  uint64_t v7 = [v9 host];

  if ([v7 length])
  {
    id v10 = [NSString alloc];
    id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v12 = [v11 localizedStringForKey:@"CANNOT_CONNECT_TO_HOST_%@" value:&stru_26C6A2310 table:0];
    int v8 = objc_msgSend(v10, "initWithFormat:", v12, v7);

    goto LABEL_5;
  }
  int v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  long long v14 = [v8 localizedStringForKey:@"CANNOT_CONNECT" value:&stru_26C6A2310 table:0];
  id v13 = SSError();

LABEL_7:

  return v13;
}

- (BOOL)_isExternalURL:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [[ISURLResolverOperation alloc] initWithURL:v4];
  [(ISOperation *)self runSubOperation:v5 returningError:0];
  if ([(ISOperation *)v5 success])
  {
    [(ISURLResolverOperation *)v5 resolvedAddresses];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      BOOL v11 = 1;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v13 = SCNetworkReachabilityCreateWithAddress(v10, (const sockaddr *)[*(id *)(*((void *)&v18 + 1) + 8 * v12) bytes]);
        if (v13)
        {
          long long v14 = v13;
          SCNetworkReachabilityFlags flags = 0;
          SCNetworkReachabilityGetFlags(v13, &flags);
          BOOL v11 = (flags & 0x10000) == 0;
          CFRelease(v14);
        }
        if (!v11) {
          break;
        }
        if (v8 == ++v12)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    else
    {
      BOOL v11 = 1;
    }

    BOOL v15 = v11;
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (BOOL)_isPassThroughStatus:(int64_t)a3
{
  id v5 = [(ISURLOperation *)self passThroughErrors];

  if (!v5) {
    return 0;
  }
  id v6 = [NSNumber numberWithInteger:a3];
  uint64_t v7 = [(ISURLOperation *)self passThroughErrors];
  char v8 = [v7 containsObject:v6];

  return v8;
}

- (void)_logRequest:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((SSDebugShouldLogOutgoingHeaders() & 1) != 0 || SSDebugShouldLogResponseBodies())
  {
    id v5 = [v4 allHTTPHeaderFields];
    if (SSIsInternalBuild() && [v5 count])
    {
      id v6 = [v5 description];
      uint64_t v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfigOversize];
      if (!v7)
      {
        uint64_t v7 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v8 = [v7 shouldLog];
      if ([v7 shouldLogToDisk]) {
        int v9 = v8 | 2;
      }
      else {
        int v9 = v8;
      }
      CFAllocatorRef v10 = [v7 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        int v11 = v9;
      }
      else {
        int v11 = v9 & 2;
      }
      if (v11)
      {
        uint64_t v12 = objc_opt_class();
        id v34 = v12;
        [(ISURLOperation *)self logKey];
        long long v38 = v5;
        long long v14 = v13 = self;
        [v4 URL];
        BOOL v15 = v36 = v6;
        int v16 = [(ISURLOperation *)v13 _sanitizedURLForURL:v15];
        int v17 = [(ISURLOperation *)v13 _sanitizedStringForString:v36];
        int v40 = 138544130;
        int v41 = v12;
        __int16 v42 = 2114;
        uint64_t v43 = v14;
        __int16 v44 = 2112;
        uint64_t v45 = v16;
        __int16 v46 = 2112;
        uint64_t v47 = v17;
        LODWORD(v33) = 42;
        id v32 = &v40;
        long long v18 = (void *)_os_log_send_and_compose_impl();

        id v6 = v36;
        self = v13;
        id v5 = v38;

        if (v18)
        {
          objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v40, v33);
          long long v19 = (int *)objc_claimAutoreleasedReturnValue();
          free(v18);
          id v32 = v19;
          SSFileLog();
        }
      }
      else
      {
      }
    }
    if (!SSDebugShouldLogResponseBodies()) {
      goto LABEL_33;
    }
    long long v20 = [v4 HTTPBody];
    if (![v20 length])
    {
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    long long v21 = (void *)[[NSString alloc] initWithData:v20 encoding:4];
    uint64_t v22 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfigOversize];
    if (!v22)
    {
      uint64_t v22 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v23 = objc_msgSend(v22, "shouldLog", v32);
    if ([v22 shouldLogToDisk]) {
      v23 |= 2u;
    }
    uint64_t v24 = [v22 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      int v25 = v23;
    }
    else {
      int v25 = v23 & 2;
    }
    if (v25)
    {
      id v26 = objc_opt_class();
      id v35 = v26;
      uint64_t v27 = [v4 URL];
      [(ISURLOperation *)self _sanitizedURLForURL:v27];
      long long v37 = v20;
      v29 = uint64_t v28 = v21;
      [(ISURLOperation *)self _sanitizedStringForString:v28];
      uint64_t v30 = v39 = v5;
      int v40 = 138412802;
      int v41 = v26;
      __int16 v42 = 2112;
      uint64_t v43 = v29;
      __int16 v44 = 2112;
      uint64_t v45 = v30;
      LODWORD(v33) = 32;
      id v31 = (void *)_os_log_send_and_compose_impl();

      id v5 = v39;
      long long v21 = v28;
      long long v20 = v37;

      if (!v31)
      {
LABEL_31:

        goto LABEL_32;
      }
      uint64_t v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, &v40, v33);
      free(v31);
      SSFileLog();
    }

    goto LABEL_31;
  }
LABEL_34:
}

- (void)_logResponseBody:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 MIMEType];
  if ([v5 rangeOfString:@"text" options:1] != 0x7FFFFFFFFFFFFFFFLL
    || [v5 rangeOfString:@"plist" options:1] != 0x7FFFFFFFFFFFFFFFLL
    || [v5 rangeOfString:@"json" options:1] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v22 = 0;
    int v23 = &v22;
    uint64_t v24 = 0x3032000000;
    int v25 = __Block_byref_object_copy__2;
    id v26 = __Block_byref_object_dispose__2;
    id v27 = 0;
    dataBufferAccessQueue = self->_dataBufferAccessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__ISURLOperation__logResponseBody___block_invoke;
    block[3] = &unk_264260BB0;
    void block[4] = self;
    void block[5] = &v22;
    dispatch_sync(dataBufferAccessQueue, block);
    id v7 = [NSString alloc];
    long long v20 = (void *)[v7 initWithData:v23[5] encoding:4];
    int v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfigOversize];
    if (!v8)
    {
      int v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v9 = [v8 shouldLog];
    int v10 = [v8 shouldLogToDisk];
    int v11 = [v8 OSLogObject];
    uint64_t v12 = v11;
    if (v10) {
      v9 |= 2u;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      int v13 = v9;
    }
    else {
      int v13 = v9 & 2;
    }
    if (v13)
    {
      id v14 = (id)objc_opt_class();
      BOOL v15 = [v4 URL];
      id v16 = [(ISURLOperation *)self _sanitizedURLForURL:v15];
      int v17 = [(ISURLOperation *)self _sanitizedStringForString:v20];
      int v28 = 138412802;
      id v29 = v14;
      __int16 v30 = 2112;
      id v31 = v16;
      __int16 v32 = 2112;
      uint64_t v33 = v17;
      LODWORD(v19) = 32;
      long long v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_15:

        _Block_object_dispose(&v22, 8);
        goto LABEL_16;
      }
      uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v28, v19);
      free(v18);
      SSFileLog();
    }

    goto LABEL_15;
  }
LABEL_16:
}

uint64_t __35__ISURLOperation__logResponseBody___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 344) copy];

  return MEMORY[0x270F9A758]();
}

- (void)_performDefaultHandlingForAuthenticationChallenge:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 sender];
  char v6 = objc_opt_respondsToSelector();
  uint64_t v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  int v8 = (void *)v7;
  if ((v6 & 1) == 0)
  {
    if (!v7)
    {
      int v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v15 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    int v17 = [v8 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (v16)
    {
      long long v18 = objc_opt_class();
      id v19 = v18;
      [(ISURLOperation *)self _sanitizedDescriptionForObject:v4];
      int v22 = 138412546;
      int v23 = v18;
      __int16 v24 = 2112;
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v21) = 22;
      long long v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_25:

        [v5 continueWithoutCredentialForAuthenticationChallenge:v4];
        goto LABEL_26;
      }
      int v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v22, v21);
      free(v20);
      SSFileLog();
    }

    goto LABEL_25;
  }
  if (!v7)
  {
    int v8 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  int v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v12 = objc_opt_class();
  id v13 = v12;
  [(ISURLOperation *)self _sanitizedDescriptionForObject:v4];
  int v22 = 138412546;
  int v23 = v12;
  __int16 v24 = 2112;
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = 22;
  id v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    int v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v22, v21);
    free(v14);
    SSFileLog();
LABEL_12:
  }
  [v5 performDefaultHandlingForAuthenticationChallenge:v4];
LABEL_26:
}

- (void)_retry
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  [(NSURLSessionTask *)self->_urlSessionTask cancel];
  urlSessionTask = self->_urlSessionTask;
  self->_urlSessionTask = 0;

  id v4 = (void *)[(NSURLRequest *)self->_activeURLRequest mutableCopy];
  if (v4)
  {
    [(ISURLOperation *)self _setActiveURLRequest:v4];
    [(ISURLOperation *)self _sendRequestToDelegate:v4];
    id v5 = [(SSURLSessionManager *)self->_urlSessionManager dataTaskWithRequest:v4 delegate:self];
    char v6 = self->_urlSessionTask;
    self->_urlSessionTask = v5;

    [(NSURLSessionTask *)self->_urlSessionTask resume];
  }
  uint64_t v7 = self->_urlSessionTask;
  uint64_t v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  int v9 = (void *)v8;
  if (!v7)
  {
    if (!v8)
    {
      int v9 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v19 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    uint64_t v21 = [v9 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      int v22 = v20;
    }
    else {
      int v22 = v20 & 2;
    }
    if (v22)
    {
      int v23 = objc_opt_class();
      id v24 = v23;
      id v25 = [(ISURLOperation *)self logKey];
      uint64_t v26 = [(ISURLOperation *)self _activeURL];
      [(ISURLOperation *)self _sanitizedURLForURL:v26];
      int v30 = 138543874;
      id v31 = v23;
      __int16 v32 = 2114;
      uint64_t v33 = v25;
      __int16 v34 = 2112;
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v29) = 32;
      id v27 = (void *)_os_log_send_and_compose_impl();

      if (!v27)
      {
LABEL_29:

        int v28 = [(ISURLOperation *)self _errorWithDomain:*MEMORY[0x263F7B758] code:109];
        [(ISOperation *)self setError:v28];

        [(ISOperation *)self stopRunLoop];
        goto LABEL_30;
      }
      uint64_t v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v27, 4, &v30, v29);
      free(v27);
      SSFileLog();
    }

    goto LABEL_29;
  }
  if (!v8)
  {
    int v9 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  uint64_t v12 = [v9 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    int v13 = v11;
  }
  else {
    int v13 = v11 & 2;
  }
  if (!v13) {
    goto LABEL_15;
  }
  id v14 = objc_opt_class();
  id v15 = v14;
  int v16 = [(ISURLOperation *)self logKey];
  int v17 = [(ISURLOperation *)self _activeURL];
  [(ISURLOperation *)self _sanitizedURLForURL:v17];
  int v30 = 138543874;
  id v31 = v14;
  __int16 v32 = 2114;
  uint64_t v33 = v16;
  __int16 v34 = 2112;
  id v35 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = 32;
  long long v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v30, v29);
    free(v18);
    SSFileLog();
LABEL_15:
  }
  [(ISURLOperation *)self _logRequest:v4];
LABEL_30:
}

- (void)_run
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ISURLOperation *)self _requestProperties];
  [(ISOperation *)self lock];
  if (self->_performanceMetrics)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    -[ISURLRequestPerformance setStartTime:](self->_performanceMetrics, "setStartTime:");
    [(ISOperation *)self unlock];
    id v5 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v5)
    {
      id v5 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    uint64_t v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v10 = objc_opt_class();
      id v22 = v10;
      int v11 = [(ISURLOperation *)self logKey];
      uint64_t v12 = [v3 URL];
      int v13 = [(ISURLOperation *)self _sanitizedURLForURL:v12];
      int v28 = 138544130;
      uint64_t v29 = v10;
      __int16 v30 = 2114;
      id v31 = v11;
      __int16 v32 = 2048;
      CFAbsoluteTime v33 = Current;
      __int16 v34 = 2112;
      id v35 = v13;
      LODWORD(v21) = 42;
      int v20 = &v28;
      id v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_14:

        goto LABEL_16;
      }
      uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v28, v21);
      free(v14);
      int v20 = (int *)v8;
      SSFileLog();
    }

    goto LABEL_14;
  }
  [(ISOperation *)self unlock];
LABEL_16:
  objc_msgSend(v3, "URLs", v20);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
LABEL_18:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v24 != v18) {
        objc_enumerationMutation(v15);
      }
      if ([(ISURLOperation *)self _runRequestWithURL:*(void *)(*((void *)&v23 + 1) + 8 * v19) dataConnectionServiceType:0])
      {
        break;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v17) {
          goto LABEL_18;
        }
        break;
      }
    }
  }
}

- (BOOL)_runRequestWithURL:(id)a3 dataConnectionServiceType:(__CFString *)a4
{
  uint64_t v158 = *MEMORY[0x263EF8340];
  id v147 = a3;
  v148 = [(ISURLOperation *)self _requestProperties];
  uint64_t v140 = [v148 allowedRetryCount];
  self->_int64_t networkRetryCount = 0;
  uint64_t v141 = *MEMORY[0x263F7B758];
  CFStringRef mode = (const __CFString *)*MEMORY[0x263EFFE88];
  unint64_t v5 = 0x263F7B000uLL;
  uint64_t v142 = *MEMORY[0x263F08570];
  v143 = self;
  while (1)
  {
    int v6 = (void *)MEMORY[0x2166C7A20]();
    id v7 = [(ISURLOperation *)self newRequestWithURL:v147];
    if (!v7)
    {
      id v22 = self;
      uint64_t v23 = v141;
      uint64_t v24 = 109;
LABEL_57:
      int v55 = -[ISURLOperation _errorWithDomain:code:](v22, "_errorWithDomain:code:", v23, v24, v128);
      [(ISOperation *)self setError:v55];

      goto LABEL_64;
    }
    if ([v148 requiresExternal]
      && ![(ISURLOperation *)self _isExternalURL:v147])
    {
      uint64_t v47 = [*(id *)(v5 + 504) sharediTunesStoreConfig];
      if (!v47)
      {
        uint64_t v47 = [*(id *)(v5 + 504) sharedConfig];
      }
      int v48 = [v47 shouldLog];
      if ([v47 shouldLogToDisk]) {
        int v49 = v48 | 2;
      }
      else {
        int v49 = v48;
      }
      uint64_t v50 = [v47 OSLogObject];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
        int v51 = v49;
      }
      else {
        int v51 = v49 & 2;
      }
      if (v51)
      {
        uint64_t v52 = objc_opt_class();
        int v150 = 138412290;
        v151 = v52;
        id v53 = v52;
        LODWORD(v130) = 12;
        v128 = &v150;
        int v54 = (void *)_os_log_send_and_compose_impl();

        if (!v54)
        {
LABEL_56:

          id v22 = self;
          uint64_t v23 = v141;
          uint64_t v24 = 107;
          goto LABEL_57;
        }
        uint64_t v50 = objc_msgSend(NSString, "stringWithCString:encoding:", v54, 4, &v150, v130);
        free(v54);
        v128 = (int *)v50;
        SSFileLog();
      }

      goto LABEL_56;
    }
    if (![v148 requiresHTTPS]
      || ([v7 URL],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          [v8 scheme],
          int v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 caseInsensitiveCompare:@"https"],
          v9,
          v8,
          !v10))
    {
      [(ISURLOperation *)self _setActiveURLRequest:v7];
      [(ISURLOperation *)self _sendRequestToDelegate:v7];
      long long v25 = [*(id *)(v5 + 504) sharedConfig];
      if (!v25)
      {
        long long v25 = [*(id *)(v5 + 504) sharedConfig];
      }
      v137 = v6;
      int v26 = [v25 shouldLog];
      if ([v25 shouldLogToDisk]) {
        int v27 = v26 | 2;
      }
      else {
        int v27 = v26;
      }
      int v28 = [v25 OSLogObject];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        int v29 = v27;
      }
      else {
        int v29 = v27 & 2;
      }
      if (v29)
      {
        __int16 v30 = objc_opt_class();
        id v31 = v30;
        __int16 v32 = [(ISURLOperation *)self logKey];
        [v7 URL];
        v34 = id v33 = v7;
        int v150 = 138543874;
        v151 = v30;
        __int16 v152 = 2114;
        int64_t v153 = (int64_t)v32;
        __int16 v154 = 2112;
        uint64_t v155 = (uint64_t)v34;
        LODWORD(v130) = 32;
        v128 = &v150;
        id v35 = (void *)_os_log_send_and_compose_impl();

        id v7 = v33;
        if (!v35) {
          goto LABEL_33;
        }
        int v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v35, 4, &v150, v130);
        free(v35);
        v128 = (int *)v28;
        SSFileLog();
      }

LABEL_33:
      uint64_t v36 = [(SSURLSessionManager *)self->_urlSessionManager dataTaskWithRequest:v7 delegate:self];
      urlSessionTask = self->_urlSessionTask;
      self->_urlSessionTask = v36;

      if (!self->_urlSessionTask)
      {
        uint64_t v56 = [(ISURLOperation *)self _errorWithDomain:v141 code:109];
        [(ISOperation *)self setError:v56];

LABEL_63:
        int v6 = v137;
        goto LABEL_64;
      }
      long long v38 = [*(id *)(v5 + 504) sharediTunesStoreConfig];
      if (!v38)
      {
        long long v38 = [*(id *)(v5 + 504) sharedConfig];
      }
      int v39 = objc_msgSend(v38, "shouldLog", v128);
      if ([v38 shouldLogToDisk]) {
        v39 |= 2u;
      }
      int v40 = [v38 OSLogObject];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
        int v41 = v39;
      }
      else {
        int v41 = v39 & 2;
      }
      if (v41)
      {
        __int16 v42 = objc_opt_class();
        id v135 = v42;
        uint64_t v43 = [v7 HTTPMethod];
        uint64_t v132 = [v7 networkServiceType];
        __int16 v44 = [v7 URL];
        uint64_t v45 = [(ISURLOperation *)self _sanitizedURLForURL:v44];
        int v150 = 138413058;
        v151 = v42;
        __int16 v152 = 2112;
        int64_t v153 = (int64_t)v43;
        __int16 v154 = 2048;
        uint64_t v155 = v132;
        __int16 v156 = 2112;
        v157 = v45;
        LODWORD(v130) = 42;
        v129 = &v150;
        __int16 v46 = (void *)_os_log_send_and_compose_impl();

        if (!v46)
        {
LABEL_60:

          [(ISURLOperation *)self _logRequest:v7];
          [(ISURLOperation *)self performSelector:sel__stopIfCancelled withObject:0 afterDelay:0.0];
          [(NSURLSessionTask *)self->_urlSessionTask resume];
          [(ISOperation *)self runRunLoopUntilStopped];
          if ([(ISURLOperation *)self isCancelled])
          {
            [(NSURLSessionTask *)self->_urlSessionTask cancel];
            CFRunLoopRunInMode(mode, 0.0, 1u);
          }
          objc_msgSend(MEMORY[0x263F8C6D0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__stopIfCancelled, 0, v129);
          unint64_t v5 = 0x263F7B000uLL;
          goto LABEL_63;
        }
        int v40 = objc_msgSend(NSString, "stringWithCString:encoding:", v46, 4, &v150, v130);
        free(v46);
        v129 = (int *)v40;
        SSFileLog();
      }

      goto LABEL_60;
    }
    int v11 = [*(id *)(v5 + 504) sharediTunesStoreConfig];
    if (!v11)
    {
      int v11 = [*(id *)(v5 + 504) sharedConfig];
    }
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    id v14 = [v11 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      int v15 = v13;
    }
    else {
      int v15 = v13 & 2;
    }
    id v133 = v7;
    if (!v15) {
      goto LABEL_18;
    }
    uint64_t v16 = objc_opt_class();
    id v17 = v16;
    uint64_t v18 = [v7 URL];
    uint64_t v19 = [v18 scheme];
    int v150 = 138412546;
    v151 = v16;
    __int16 v152 = 2112;
    int64_t v153 = (int64_t)v19;
    LODWORD(v130) = 22;
    v128 = &v150;
    int v20 = (void *)_os_log_send_and_compose_impl();

    if (v20)
    {
      id v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v150, v130);
      free(v20);
      v128 = (int *)v14;
      SSFileLog();
LABEL_18:
    }
    uint64_t v21 = [(ISURLOperation *)self _errorWithDomain:v141 code:128];
    [(ISOperation *)self setError:v21];

    id v7 = v133;
LABEL_64:
    objc_msgSend(MEMORY[0x263F8C6D0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateProgress, 0, v128);
    [(ISURLOperation *)self _setActiveURLRequest:0];
    dataBufferAccessQueue = self->_dataBufferAccessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__ISURLOperation__runRequestWithURL_dataConnectionServiceType___block_invoke;
    block[3] = &unk_264260B08;
    void block[4] = self;
    dispatch_sync(dataBufferAccessQueue, block);
    [(NSURLSessionTask *)self->_urlSessionTask cancel];
    int v58 = self->_urlSessionTask;
    self->_urlSessionTask = 0;

    redirectURLs = self->_redirectURLs;
    self->_redirectURLs = 0;

    if ([(ISOperation *)self success] || ([(ISURLOperation *)self isCancelled] & 1) != 0) {
      goto LABEL_122;
    }
    uint64_t v60 = [(ISOperation *)self error];
    int v61 = +[ISNetworkObserver sharedInstance];
    id v62 = [v60 domain];
    int v63 = [v62 isEqualToString:v142];

    if (!v63) {
      goto LABEL_82;
    }
    if (![v61 networkType])
    {
      __int16 v103 = [*(id *)(v5 + 504) sharediTunesStoreConfig];
      if (!v103)
      {
        __int16 v103 = [*(id *)(v5 + 504) sharedConfig];
      }
      int v104 = [v103 shouldLog];
      if ([v103 shouldLogToDisk]) {
        v104 |= 2u;
      }
      uint64_t v105 = [v103 OSLogObject];
      if (!os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT)) {
        v104 &= 2u;
      }
      if (v104)
      {
        v106 = objc_opt_class();
        id v144 = v106;
        [v148 URL];
        v146 = v61;
        v108 = id v107 = v7;
        v109 = [(ISURLOperation *)self _sanitizedURLForURL:v108];
        int v150 = 138412546;
        v151 = v106;
        __int16 v152 = 2112;
        int64_t v153 = (int64_t)v109;
        LODWORD(v130) = 22;
        v128 = &v150;
        v110 = (void *)_os_log_send_and_compose_impl();

        id v7 = v107;
        int v61 = v146;

        if (v110)
        {
          uint64_t v105 = objc_msgSend(NSString, "stringWithCString:encoding:", v110, 4, &v150, v130);
          free(v110);
          v128 = (int *)v105;
          SSFileLog();
          goto LABEL_117;
        }
      }
      else
      {
LABEL_117:
      }
      id v81 = [(ISURLOperation *)self _errorWithDomain:v141 code:110];
      __int16 v96 = SSErrorBySettingUserInfoValue();
      [(ISOperation *)self setError:v96];
      unint64_t v5 = 0x263F7B000uLL;
      goto LABEL_119;
    }
    double Current = CFAbsoluteTimeGetCurrent();
    [v61 lastNetworkTypeChangeTime];
    if (Current - v65 < 5.0)
    {
      id v66 = [*(id *)(v5 + 504) sharediTunesStoreConfig];
      if (!v66)
      {
        id v66 = [*(id *)(v5 + 504) sharedConfig];
      }
      int v67 = [v66 shouldLog];
      if ([v66 shouldLogToDisk]) {
        int v68 = v67 | 2;
      }
      else {
        int v68 = v67;
      }
      int v69 = [v66 OSLogObject];
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT)) {
        int v70 = v68;
      }
      else {
        int v70 = v68 & 2;
      }
      if (v70)
      {
        char v71 = objc_opt_class();
        id v138 = v71;
        [v148 URL];
        uint64_t v72 = v60;
        v74 = id v73 = v7;
        [(ISURLOperation *)v143 _sanitizedURLForURL:v74];
        id v75 = v61;
        id v77 = v76 = v6;
        int v150 = 138412546;
        v151 = v71;
        __int16 v152 = 2112;
        int64_t v153 = (int64_t)v77;
        LODWORD(v130) = 22;
        v128 = &v150;
        int v78 = (void *)_os_log_send_and_compose_impl();

        id v7 = v73;
        uint64_t v60 = v72;
        self = v143;

        int v6 = v76;
        int v61 = v75;

        unint64_t v5 = 0x263F7B000;
        if (!v78)
        {
LABEL_81:

          self->_int64_t networkRetryCount = 0;
          goto LABEL_97;
        }
        int v69 = objc_msgSend(NSString, "stringWithCString:encoding:", v78, 4, &v150, v130);
        free(v78);
        v128 = (int *)v69;
        SSFileLog();
      }

      goto LABEL_81;
    }
LABEL_82:
    if (!ISErrorIndicatesSlowNetwork(v60)) {
      goto LABEL_121;
    }
    int64_t networkRetryCount = self->_networkRetryCount;
    self->_int64_t networkRetryCount = networkRetryCount + 1;
    uint64_t v80 = [*(id *)(v5 + 504) sharediTunesStoreConfig];
    id v81 = (void *)v80;
    if (networkRetryCount >= v140) {
      break;
    }
    if (!v80)
    {
      id v81 = [*(id *)(v5 + 504) sharedConfig];
    }
    int v82 = [v81 shouldLog];
    if ([v81 shouldLogToDisk]) {
      int v83 = v82 | 2;
    }
    else {
      int v83 = v82;
    }
    id v84 = [v81 OSLogObject];
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT)) {
      int v85 = v83;
    }
    else {
      int v85 = v83 & 2;
    }
    if (!v85) {
      goto LABEL_95;
    }
    id v86 = objc_opt_class();
    long long v87 = v6;
    long long v88 = v61;
    int64_t v89 = self->_networkRetryCount;
    id v136 = v86;
    [v148 URL];
    v139 = v60;
    v91 = long long v90 = v87;
    [(ISURLOperation *)v143 _sanitizedURLForURL:v91];
    v93 = id v92 = v7;
    int v150 = 138412802;
    v151 = v86;
    __int16 v152 = 2048;
    int64_t v153 = v89;
    int v61 = v88;
    __int16 v154 = 2112;
    uint64_t v155 = (uint64_t)v93;
    LODWORD(v130) = 32;
    v128 = &v150;
    __int16 v94 = (void *)_os_log_send_and_compose_impl();

    int v6 = v90;
    uint64_t v60 = v139;
    self = v143;

    id v7 = v92;
    unint64_t v5 = 0x263F7B000;

    if (v94)
    {
      id v84 = objc_msgSend(NSString, "stringWithCString:encoding:", v94, 4, &v150, v130);
      free(v94);
      v128 = (int *)v84;
      SSFileLog();
LABEL_95:
    }
LABEL_97:
    objc_msgSend(MEMORY[0x263F08B88], "sleepForTimeInterval:", 5.0, v128);
    if ([(ISURLOperation *)self isCancelled]) {
      goto LABEL_121;
    }
    [(ISOperation *)self setError:0];
  }
  if (!v80)
  {
    id v81 = [*(id *)(v5 + 504) sharedConfig];
  }
  int v95 = [v81 shouldLog];
  if ([v81 shouldLogToDisk]) {
    v95 |= 2u;
  }
  __int16 v96 = [v81 OSLogObject];
  if (!os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT)) {
    v95 &= 2u;
  }
  if (!v95) {
    goto LABEL_119;
  }
  v145 = v61;
  id v134 = v7;
  __int16 v97 = v6;
  v98 = objc_opt_class();
  id v99 = v98;
  uint64_t v100 = [v148 URL];
  __int16 v101 = [(ISURLOperation *)self _sanitizedURLForURL:v100];
  int v150 = 138412546;
  v151 = v98;
  __int16 v152 = 2112;
  int64_t v153 = (int64_t)v101;
  LODWORD(v130) = 22;
  v128 = &v150;
  v102 = (void *)_os_log_send_and_compose_impl();

  if (v102)
  {
    __int16 v96 = objc_msgSend(NSString, "stringWithCString:encoding:", v102, 4, &v150, v130);
    free(v102);
    v128 = (int *)v96;
    SSFileLog();
    unint64_t v5 = 0x263F7B000;
    int v6 = v97;
    id v7 = v134;
    int v61 = v145;
LABEL_119:

    goto LABEL_120;
  }
  unint64_t v5 = 0x263F7B000;
  int v6 = v97;
  id v7 = v134;
  int v61 = v145;
LABEL_120:

LABEL_121:
LABEL_122:

  v111 = [(ISOperation *)self error];
  if (v111)
  {

    goto LABEL_133;
  }
  if ([(ISOperation *)self success])
  {
    uint64_t v112 = [*(id *)(v5 + 504) sharedConfig];
    unint64_t v113 = v5;
    v114 = (void *)v112;
    if (!v112)
    {
      v114 = [*(id *)(v113 + 504) sharedConfig];
    }
    int v115 = objc_msgSend(v114, "shouldLog", v128);
    if ([v114 shouldLogToDisk]) {
      v115 |= 2u;
    }
    v116 = [v114 OSLogObject];
    if (!os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT)) {
      v115 &= 2u;
    }
    if (v115)
    {
      v117 = objc_opt_class();
      id v118 = v117;
      v119 = [(ISURLOperation *)self logKey];
      int v150 = 138543618;
      v151 = v117;
      __int16 v152 = 2114;
      int64_t v153 = (int64_t)v119;
      LODWORD(v130) = 22;
      v120 = (void *)_os_log_send_and_compose_impl();
      goto LABEL_141;
    }
LABEL_143:
  }
  else
  {
LABEL_133:
    uint64_t v121 = objc_msgSend(*(id *)(v5 + 504), "sharedConfig", v128);
    unint64_t v122 = v5;
    v114 = (void *)v121;
    if (!v121)
    {
      v114 = [*(id *)(v122 + 504) sharedConfig];
    }
    int v123 = [v114 shouldLog];
    if ([v114 shouldLogToDisk]) {
      v123 |= 2u;
    }
    v116 = [v114 OSLogObject];
    if (!os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
      v123 &= 2u;
    }
    if (!v123) {
      goto LABEL_143;
    }
    v124 = objc_opt_class();
    id v118 = v124;
    v119 = [(ISURLOperation *)self logKey];
    v125 = [(ISOperation *)self error];
    int v150 = 138543874;
    v151 = v124;
    __int16 v152 = 2114;
    int64_t v153 = (int64_t)v119;
    __int16 v154 = 2114;
    uint64_t v155 = (uint64_t)v125;
    LODWORD(v130) = 32;
    v120 = (void *)_os_log_send_and_compose_impl();

LABEL_141:
    if (v120)
    {
      v116 = objc_msgSend(NSString, "stringWithCString:encoding:", v120, 4, &v150, v130);
      free(v120);
      SSFileLog();
      goto LABEL_143;
    }
  }

  BOOL v126 = [(ISOperation *)self success];
  return v126;
}

void __63__ISURLOperation__runRequestWithURL_dataConnectionServiceType___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 344);
  *(void *)(v1 + 344) = 0;
}

- (void)_sendContentLengthToDelegate:(int64_t)a3
{
  unint64_t v5 = [(ISOperation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v6 = (void *)[objc_alloc(NSNumber) initWithLongLong:a3];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__ISURLOperation__sendContentLengthToDelegate___block_invoke;
    v8[3] = &unk_264260B80;
    id v9 = v5;
    uint64_t v10 = self;
    id v11 = v6;
    id v7 = v6;
    [(ISOperation *)self delegateDispatch:v8];
  }
}

uint64_t __47__ISURLOperation__sendContentLengthToDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) operation:*(void *)(a1 + 40) didDiscoverContentLength:*(void *)(a1 + 48)];
}

- (void)_sendOutputToDelegate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ISOperation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__ISURLOperation__sendOutputToDelegate___block_invoke;
    v6[3] = &unk_264260B80;
    id v7 = v5;
    uint64_t v8 = self;
    id v9 = v4;
    [(ISOperation *)self delegateDispatch:v6];
  }
}

uint64_t __40__ISURLOperation__sendOutputToDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) operation:*(void *)(a1 + 40) finishedWithOutput:*(void *)(a1 + 48)];
}

- (void)_sendRequestToDelegate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ISOperation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __41__ISURLOperation__sendRequestToDelegate___block_invoke;
    v6[3] = &unk_264260B80;
    id v7 = v5;
    uint64_t v8 = self;
    id v9 = v4;
    [(ISOperation *)self delegateDispatch:v6];
  }
  [(ISURLOperation *)self _willSendRequest:v4];
}

uint64_t __41__ISURLOperation__sendRequestToDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) operation:*(void *)(a1 + 40) willSendRequest:*(void *)(a1 + 48)];
}

- (void)_sendResponseToDelegate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ISOperation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __42__ISURLOperation__sendResponseToDelegate___block_invoke;
    v6[3] = &unk_264260B80;
    id v7 = v5;
    uint64_t v8 = self;
    id v9 = v4;
    [(ISOperation *)self delegateDispatch:v6];
  }
}

uint64_t __42__ISURLOperation__sendResponseToDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) operation:*(void *)(a1 + 40) didReceiveResponse:*(void *)(a1 + 48)];
}

- (void)_setActiveURLRequest:(id)a3
{
  if (self->_activeURLRequest != a3)
  {
    self->_activeURLRequest = (NSURLRequest *)[a3 copy];
    MEMORY[0x270F9A758]();
  }
}

+ (__CFURLStorageSession)_sharedCacheStorageSession
{
  if (_sharedCacheStorageSession_sOnce != -1) {
    dispatch_once(&_sharedCacheStorageSession_sOnce, &__block_literal_global_158);
  }
  return (__CFURLStorageSession *)_sharedCacheStorageSession_storageSession;
}

void __44__ISURLOperation__sharedCacheStorageSession__block_invoke()
{
  v7[5] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x2166C7A20]();
  if (MGGetSInt32Answer() != 4)
  {
    uint64_t v1 = NSString;
    v7[0] = CPSharedResourcesDirectory();
    v7[1] = @"Library";
    v7[2] = @"Caches";
    v7[3] = @"sharedCaches";
    v7[4] = @"com.apple.iTunesStore.NSURLCache";
    uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:5];
    uint64_t v3 = [v1 pathWithComponents:v2];

    id v4 = [MEMORY[0x263F08850] defaultManager];
    [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];

    if (SSFileIsLocalWritable())
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      int v6 = (const void *)*MEMORY[0x263EFFB40];
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263EFC6E8], (const void *)*MEMORY[0x263EFFB40]);
      CFDictionarySetValue(Mutable, @"kCFURLStorageSessionEnableVaryHeaderSupport", v6);
      _sharedCacheStorageSession_storageSession = _CFURLStorageSessionCreate();
      CFRelease(Mutable);
    }
  }
}

- (BOOL)_shouldFollowRedirectWithRequest:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 URL];
  uint64_t v8 = [v7 scheme];

  id v9 = [(ISURLOperation *)self _requestProperties];
  if ([v9 requiresHTTPS])
  {
    uint64_t v10 = [v8 caseInsensitiveCompare:@"https"];

    if (v10)
    {
      id v11 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v11)
      {
        id v11 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v12 = [v11 shouldLog];
      if ([v11 shouldLogToDisk]) {
        int v13 = v12 | 2;
      }
      else {
        int v13 = v12;
      }
      id v14 = [v11 OSLogObject];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        v13 &= 2u;
      }
      if (v13)
      {
        int v23 = 138412546;
        id v24 = (id)objc_opt_class();
        __int16 v25 = 2112;
        int v26 = v8;
        id v15 = v24;
        LODWORD(v21) = 22;
        uint64_t v16 = (void *)_os_log_send_and_compose_impl();

        if (!v16)
        {
LABEL_14:

          id v17 = [(ISURLOperation *)self _errorWithDomain:*MEMORY[0x263F7B758] code:128];
          goto LABEL_18;
        }
        id v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v23, v21);
        free(v16);
        SSFileLog();
      }

      goto LABEL_14;
    }
  }
  else
  {
  }
  id v22 = 0;
  BOOL v18 = [(ISURLOperation *)self shouldFollowRedirectWithRequest:v6 returningError:&v22];
  id v17 = v22;
  if (v18)
  {
    BOOL v19 = 1;
    goto LABEL_21;
  }
LABEL_18:
  if (*a4)
  {
    id v17 = v17;
    BOOL v19 = 0;
    *a4 = v17;
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_21:

  return v19;
}

- (void)_stopConnection
{
  uint64_t v3 = [(ISURLOperation *)self dataProvider];
  int v4 = [v3 isStream];

  if (v4)
  {
    unint64_t v5 = [(ISOperation *)self error];

    id v6 = [(ISURLOperation *)self dataProvider];
    id v7 = v6;
    if (v5)
    {
      uint64_t v8 = [(ISOperation *)self error];
      [v7 streamDidFailWithError:v8];
    }
    else
    {
      id v9 = (id)[v6 closeStream];
    }
  }
  [(NSURLSessionTask *)self->_urlSessionTask cancel];

  [(ISOperation *)self stopRunLoop];
}

- (void)_stopIfCancelled
{
  if ([(ISURLOperation *)self isCancelled])
  {
    [(ISOperation *)self stopRunLoop];
  }
}

- (id)_stringForCachePolicy:(unint64_t)a3
{
  if (a3 > 5) {
    return @"Unknown";
  }
  else {
    return off_264260CF0[a3];
  }
}

- (void)_updateProgress
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  progress = self->super._progress;
  if (progress)
  {
    if ([(SSOperationProgress *)progress operationType] == 2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = &v9;
      uint64_t v11 = 0x2020000000;
      uint64_t v12 = 0;
      unint64_t v5 = [(ISURLOperation *)self dataProvider];
      if ([v5 isStream])
      {
        uint64_t v6 = [v5 streamedBytes];
        v10[3] = v6;
      }
      else
      {
        dataBufferAccessQueue = self->_dataBufferAccessQueue;
        v8[0] = MEMORY[0x263EF8330];
        v8[1] = 3221225472;
        v8[2] = __33__ISURLOperation__updateProgress__block_invoke;
        v8[3] = &unk_264260CD0;
        void v8[4] = self;
        v8[5] = &v9;
        dispatch_sync(dataBufferAccessQueue, v8);
        uint64_t v6 = v10[3];
      }
      [(SSOperationProgress *)self->super._progress setCurrentValue:v6];

      _Block_object_dispose(&v9, 8);
    }
    [(SSOperationProgress *)self->super._progress snapshot];
    [(ISOperation *)self sendProgressToDelegate];
    [(ISURLOperation *)self performSelector:a2 withObject:0 afterDelay:*MEMORY[0x263F7BDC0]];
  }
}

void *__33__ISURLOperation__updateProgress__block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(*(void *)(a1 + 32) + 344);
  if (result)
  {
    uint64_t result = (void *)[result length];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (BOOL)_validateContentLength:(int64_t)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v6 = [(ISURLOperation *)self dataProvider];
  id v7 = v6;
  if (v6 && [v6 isStream])
  {
    id v20 = 0;
    char v8 = [v7 canStreamContentLength:a3 error:&v20];
    id v9 = v20;
    if ((v8 & 1) == 0)
    {
      uint64_t v10 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v10)
      {
        uint64_t v10 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v11 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v12 = v11 | 2;
      }
      else {
        int v12 = v11;
      }
      int v13 = [v10 OSLogObject];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        v12 &= 2u;
      }
      if (v12)
      {
        id v14 = objc_opt_class();
        int v21 = 138412546;
        id v22 = v14;
        __int16 v23 = 2048;
        int64_t v24 = a3;
        id v15 = v14;
        LODWORD(v19) = 22;
        uint64_t v16 = (void *)_os_log_send_and_compose_impl();

        if (!v16) {
          goto LABEL_15;
        }
        int v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v21, v19);
        free(v16);
        SSFileLog();
      }

LABEL_15:
      BOOL v17 = 0;
      if (!a4) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else
  {
    id v9 = 0;
  }
  BOOL v17 = 1;
  if (a4) {
LABEL_19:
  }
    *a4 = v9;
LABEL_20:

  return v17;
}

- (NSURLRequest)activeURLRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 424, 1);
}

- (ISDataProvider)dataProvider
{
  return (ISDataProvider *)objc_getProperty(self, a2, 352, 1);
}

- (void)setDataProvider:(id)a3
{
}

- (BOOL)_loadsHTTPFailures
{
  return self->_loadsHTTPFailures;
}

- (void)_setLoadsHTTPFailures:(BOOL)a3
{
  self->_loadsHTTPFailures = a3;
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 384, 1);
}

- (void)setResponse:(id)a3
{
}

- (BOOL)_shouldSetCookies
{
  return self->_shouldSetCookies;
}

- (void)_setShouldSetCookies:(BOOL)a3
{
  self->_shouldSetCookies = a3;
}

- (BOOL)_usesPrivateCookieStore
{
  return self->_usesPrivateCookieStore;
}

- (void)_setUsesPrivateCookieStore:(BOOL)a3
{
  self->_usesPrivateCookieStore = a3;
}

- (BOOL)isUploadProgressRequested
{
  return self->_uploadProgressRequested;
}

- (void)setUploadProgressRequested:(BOOL)a3
{
  self->_uploadProgressRequested = a3;
}

- (NSString)logKey
{
  return (NSString *)objc_getProperty(self, a2, 464, 1);
}

- (void)setLogKey:(id)a3
{
}

- (NSArray)passThroughErrors
{
  return self->_passThroughErrors;
}

- (void)setPassThroughErrors:(id)a3
{
}

- (NSNumber)_accountDSIDOverride
{
  return self->__accountDSIDOverride;
}

- (void)_setAccountDSIDOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accountDSIDOverride, 0);
  objc_storeStrong((id *)&self->_passThroughErrors, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_httpArchive, 0);
  objc_storeStrong((id *)&self->_dataBufferAccessQueue, 0);
  objc_storeStrong((id *)&self->_activeURLRequest, 0);
  objc_storeStrong((id *)&self->_urlSessionTask, 0);
  objc_storeStrong((id *)&self->_urlSessionManager, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_redirectURLs, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_dataBuffer, 0);

  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end