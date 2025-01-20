@interface PRSSearchSession
- (BOOL)configuredSession;
- (BOOL)disableAsTypedSuggestion;
- (NSArray)supportedServices;
- (NSSet)appBlocklist;
- (NSString)modelL2Version;
- (NSString)userAgent;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_source)quiescenceTimer;
- (PARSession)session;
- (PRSSearchSession)initWithClient:(id)a3 clientQueue:(id)a4;
- (PRSSearchSession)initWithClient:(id)a3 clientQueue:(id)a4 config:(id)a5 session:(id)a6;
- (SFFeedbackListener)listener;
- (SSPlistDataReader)cannedCEPValues;
- (SSPlistDataReader)cepDictionary;
- (double)retryAfter;
- (double)searchRenderTimeout;
- (double)sessionStartTime;
- (double)suggestionsRenderTimeout;
- (id)feedbackListener;
- (id)getQueryTaskForHandler:(id)a3 scaleFactor:(double)a4 whyQuery:(unint64_t)a5;
- (id)queryTaskWithEngagedSuggestion:(id)a3 externalId:(unsigned int)a4 handler:(id)a5 queryContext:(id)a6 queryIdent:(unint64_t)a7;
- (id)queryTaskWithString:(id)a3 externalId:(unsigned int)a4 handler:(id)a5 queryContext:(id)a6 queryIdent:(unint64_t)a7;
- (void)activate;
- (void)deactivate;
- (void)getCachedQueries:(id *)a3 results:(id *)a4 webSearch:(BOOL)a5;
- (void)getFTEStringsWithReply:(id)a3;
- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5;
- (void)setClientQueue:(id)a3;
- (void)setConfiguredSession:(BOOL)a3;
- (void)setFeedbackStartTime;
- (void)setParsecFeedbackAllowed:(BOOL)a3;
- (void)setQueryLanguage:(id)a3;
- (void)setQuiescenceTimer:(id)a3;
- (void)setRetryAfter:(double)a3;
- (void)setSession:(id)a3;
- (void)setSessionStartTime:(double)a3;
- (void)setUserAgent:(id)a3;
- (void)setUserAgentString:(id)a3;
@end

@implementation PRSSearchSession

- (SFFeedbackListener)listener
{
  return (SFFeedbackListener *)self->_listener;
}

- (PRSSearchSession)initWithClient:(id)a3 clientQueue:(id)a4 config:(id)a5 session:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = +[PRSBagHandler sharedHandler];
  objc_storeStrong((id *)&self->_client, a3);
  objc_storeStrong((id *)&self->_clientQueue, a4);
  [(PRSSearchSession *)self setFeedbackStartTime];
  kdebug_trace();
  v14 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[PRSSearchSession initWithClient:clientQueue:config:session:](v14, v15, v16, v17, v18, v19, v20, v21);
  }

  v22 = [v12 bag];
  if (v22)
  {
    v23 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[PRSSearchSession initWithClient:clientQueue:config:session:](v23, v24, v25, v26, v27, v28, v29, v30);
    }

    v31 = +[PRSBagHandler sharedHandler];
    [v31 updateFromSession:v12 bag:v22 forClient:self->_client error:0];
  }
  v32 = objc_alloc_init(PRSFeedbackProxy);
  [(PRSFeedbackProxy *)v32 setListener:v12];
  listener = self->_listener;
  self->_listener = v32;
  v34 = v32;

  session = self->_session;
  self->_session = (PARSession *)v12;

  return self;
}

- (PRSSearchSession)initWithClient:(id)a3 clientQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 conformsToProtocol:&unk_1F1893BB0]) {
    v8 = v6;
  }
  else {
    v8 = 0;
  }
  v9 = (objc_class *)MEMORY[0x1E4F5CBE0];
  id v10 = v8;
  id v11 = [v9 alloc];
  id v12 = [v6 applicationNameForUserAgent];
  id v13 = (void *)[v11 initWithId:@"com.apple.spotlight" userAgent:v12 factory:v10];

  v14 = [MEMORY[0x1E4F5CBD8] sessionWithConfiguration:v13 delegate:self startImmediately:1];
  uint64_t v15 = [(PRSSearchSession *)self initWithClient:v6 clientQueue:v7 config:v13 session:v14];

  if (v15) {
    [(PRSSearchSession *)v15 setConfiguredSession:1];
  }

  return v15;
}

- (void)setParsecFeedbackAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "forbidden";
    if (v3) {
      id v6 = "allowed";
    }
    int v10 = 136315138;
    id v11 = v6;
    _os_log_impl(&dword_1BDB2A000, v5, OS_LOG_TYPE_DEFAULT, "Parsec feedback %s", (uint8_t *)&v10, 0xCu);
  }

  id v7 = [(PRSSearchSession *)self session];
  v8 = [v7 configuration];
  [v8 setParsecEnabled:v3];

  self->_parsecFeedbackAllowed = v3;
  if (v3) {
    session = self->_session;
  }
  else {
    session = 0;
  }
  [(PRSFeedbackProxy *)self->_listener setListener:session];
}

- (id)feedbackListener
{
  return self->_listener;
}

- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PRSSearchSession session:bag:didLoadWithError:](v9, v10, v11, v12, v13, v14, v15, v16);
  }

  uint64_t v17 = +[PRSBagHandler sharedHandler];
  [v17 updateFromSession:self->_session bag:v8 forClient:self->_client error:v7];
}

- (id)queryTaskWithString:(id)a3 externalId:(unsigned int)a4 handler:(id)a5 queryContext:(id)a6 queryIdent:(unint64_t)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  uint64_t v14 = [PRSCoreParsecQueryTask alloc];
  session = self->_session;
  uint64_t v16 = [(PRSSearchSession *)self clientQueue];
  uint64_t v17 = [(PRSCoreParsecQueryTask *)v14 initWithSession:self parsecSession:session handler:v12 queue:v16 queryContext:v11 queryIdent:a7];

  [(PRSQueryTask *)v17 setQueryString:v13];
  return v17;
}

- (id)queryTaskWithEngagedSuggestion:(id)a3 externalId:(unsigned int)a4 handler:(id)a5 queryContext:(id)a6 queryIdent:(unint64_t)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  uint64_t v14 = [PRSCoreParsecQueryTask alloc];
  session = self->_session;
  uint64_t v16 = [(PRSSearchSession *)self clientQueue];
  uint64_t v17 = [(PRSCoreParsecQueryTask *)v14 initWithSession:self parsecSession:session handler:v12 queue:v16 queryContext:v11 queryIdent:a7];

  [(PRSCoreParsecQueryTask *)v17 setSuggestionResult:v13];
  uint64_t v18 = [v13 suggestion];

  uint64_t v19 = [v18 query];
  [(PRSQueryTask *)v17 setQueryString:v19];

  return v17;
}

- (id)getQueryTaskForHandler:(id)a3 scaleFactor:(double)a4 whyQuery:(unint64_t)a5
{
  id v5 = a3;
  __assert_rtn("-[PRSSearchSession getQueryTaskForHandler:scaleFactor:whyQuery:]", "PRSSearchSession.m", 503, "0");
}

- (void)activate
{
  if (!self->_session)
  {
    if ([(PRSSessionController *)self->_client conformsToProtocol:&unk_1F1893BB0]) {
      client = self->_client;
    }
    else {
      client = 0;
    }
    v4 = client;
    id v5 = objc_alloc(MEMORY[0x1E4F5CBE0]);
    id v6 = [(PRSSessionController *)self->_client applicationNameForUserAgent];
    id v7 = (void *)[v5 initWithId:@"com.apple.spotlight" userAgent:v6 factory:v4];

    id v8 = [MEMORY[0x1E4F5CBD8] sessionWithConfiguration:v7 delegate:self startImmediately:1];
    session = self->_session;
    self->_session = v8;

    if (self->_parsecFeedbackAllowed) {
      [(PRSFeedbackProxy *)self->_listener setListener:self->_session];
    }
  }
  uint64_t v10 = +[PRSBagHandler sharedHandler];
  [v10 setActive:1];

  [(PRSSearchSession *)self warmup];
  quiescenceTimer = self->_quiescenceTimer;
  if (quiescenceTimer) {
    dispatch_suspend(quiescenceTimer);
  }
  [(PRSSessionController *)self->_client sessionStartTime];
  if (Current == 0.0) {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  self->_sessionStartTime = Current;
  [(PARSession *)self->_session start];
  id v15 = +[PRSModelManager sharedModelManager];
  id v13 = [v15 getL2ModelVersionForClientBundle:0];
  modelL2Version = self->_modelL2Version;
  self->_modelL2Version = v13;
}

- (void)deactivate
{
  if ([(PRSSearchSession *)self configuredSession])
  {
    BOOL v3 = +[PRSBagHandler sharedHandler];
    int v4 = [v3 active];

    if (v4)
    {
      quiescenceTimer = self->_quiescenceTimer;
      if (!quiescenceTimer)
      {
        id v6 = [(PRSSearchSession *)self clientQueue];
        id v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 1uLL, 0, v6);
        id v8 = self->_quiescenceTimer;
        self->_quiescenceTimer = v7;

        id location = 0;
        objc_initWeak(&location, self);
        v9 = self->_quiescenceTimer;
        uint64_t v13 = MEMORY[0x1E4F143A8];
        uint64_t v14 = 3221225472;
        id v15 = __30__PRSSearchSession_deactivate__block_invoke;
        uint64_t v16 = &unk_1E635B148;
        objc_copyWeak(&v17, &location);
        dispatch_source_set_event_handler(v9, &v13);
        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
        quiescenceTimer = self->_quiescenceTimer;
      }
      dispatch_time_t v10 = dispatch_time(0, 120000000000);
      dispatch_source_set_timer(quiescenceTimer, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_resume((dispatch_object_t)self->_quiescenceTimer);
    }
  }
  id v11 = +[PRSBagHandler sharedHandler];
  [v11 setActive:0];

  [(PRSSessionController *)self->_client sessionStartTime];
  if (Current == 0.0) {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  self->_sessionStartTime = Current;
}

void __30__PRSSearchSession_deactivate__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained setSession:0];
    [v2[9] setListener:0];
    WeakRetained = v2;
  }
}

- (void)setFeedbackStartTime
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(v2, "setDouble:forKey:", @"startTime");
}

- (void)setUserAgentString:(id)a3
{
}

- (void)setQueryLanguage:(id)a3
{
}

- (void)getFTEStringsWithReply:(id)a3
{
  id v3 = a3;
  id v4 = +[PRSBagHandler sharedHandler];
  [v4 getFTEStringsWithReply:v3];
}

- (double)searchRenderTimeout
{
  id v2 = +[PRSBagHandler sharedHandler];
  [v2 searchRenderTimeout];
  double v4 = v3;

  return v4;
}

- (double)suggestionsRenderTimeout
{
  id v2 = +[PRSBagHandler sharedHandler];
  [v2 suggestionsRenderTimeout];
  double v4 = v3;

  return v4;
}

- (void)getCachedQueries:(id *)a3 results:(id *)a4 webSearch:(BOOL)a5
{
  id v5 = (void *)MEMORY[0x1E4F1CBF0];
  *a4 = (id)MEMORY[0x1E4F1CBF0];
  *a3 = v5;
}

- (NSSet)appBlocklist
{
  id v2 = +[PRSBagHandler sharedHandler];
  double v3 = [v2 appBlocklist];

  return (NSSet *)v3;
}

- (SSPlistDataReader)cepDictionary
{
  id v2 = +[PRSBagHandler sharedHandler];
  double v3 = objc_msgSend(v2, "cep_server_values");

  return (SSPlistDataReader *)v3;
}

- (SSPlistDataReader)cannedCEPValues
{
  return (SSPlistDataReader *)+[SSLocalCEP getCEPValuesForCurrentLocale];
}

- (BOOL)disableAsTypedSuggestion
{
  id v2 = +[PRSBagHandler sharedHandler];
  char v3 = [v2 disableAsTypedSuggestion];

  return v3;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (double)sessionStartTime
{
  return self->_sessionStartTime;
}

- (void)setSessionStartTime:(double)a3
{
  self->_sessionStartTime = a3;
}

- (NSArray)supportedServices
{
  return self->_supportedServices;
}

- (NSString)modelL2Version
{
  return self->_modelL2Version;
}

- (PARSession)session
{
  return (PARSession *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSession:(id)a3
{
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUserAgent:(id)a3
{
}

- (BOOL)configuredSession
{
  return self->_configuredSession;
}

- (void)setConfiguredSession:(BOOL)a3
{
  self->_configuredSession = a3;
}

- (OS_dispatch_source)quiescenceTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 128, 1);
}

- (void)setQuiescenceTimer:(id)a3
{
}

- (double)retryAfter
{
  return self->_retryAfter;
}

- (void)setRetryAfter:(double)a3
{
  self->_retryAfter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quiescenceTimer, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_modelL2Version, 0);
  objc_storeStrong((id *)&self->_supportedServices, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_serverFeatures, 0);
  objc_storeStrong((id *)&self->_sqfData, 0);
  objc_storeStrong((id *)&self->_queryLanguage, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
}

- (void)initWithClient:(uint64_t)a3 clientQueue:(uint64_t)a4 config:(uint64_t)a5 session:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithClient:(uint64_t)a3 clientQueue:(uint64_t)a4 config:(uint64_t)a5 session:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)session:(uint64_t)a3 bag:(uint64_t)a4 didLoadWithError:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end