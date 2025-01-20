@interface SPParsecDatastore
+ (void)initialize;
- (BOOL)activated;
- (BOOL)available;
- (BOOL)parsecEnabled;
- (NSArray)excludedDomainIdentifiers;
- (NSSet)appBlocklist;
- (NSString)applicationNameForUserAgent;
- (OS_dispatch_queue)queue;
- (PRSMapsParsecRanker)mapsParsecRanker;
- (PRSSearchSession)session;
- (SDNetworkQualityInquiry)networkConditions;
- (SPParsecDatastore)init;
- (SSPlistDataReader)cannedCEPValues;
- (SSPlistDataReader)cepDictionary;
- (__MDSimpleQueryEvaluator)queryEval;
- (double)computeTimeout:(double)a3;
- (double)searchTimeOut;
- (double)sessionStartTime;
- (double)suggestionTimeOut;
- (double)timeOut:(BOOL)a3;
- (id)createResultObject;
- (id)feedbackListeners;
- (id)performQuery:(id)a3;
- (unint64_t)lastKnownQuality;
- (unint64_t)quality;
- (unsigned)domain;
- (void)activate;
- (void)checkParsecState;
- (void)deactivate;
- (void)getFTEStringsWithReply:(id)a3;
- (void)preheat;
- (void)sessionReceivedBagWithEnabledDomains:(id)a3;
- (void)setActivated:(BOOL)a3;
- (void)setExcludedDomainIdentifiers:(id)a3;
- (void)setLastKnownQuality:(unint64_t)a3;
- (void)setNetworkConditions:(id)a3;
- (void)setParsecEnabled:(BOOL)a3;
- (void)setParsecFeedbackAllowed:(BOOL)a3;
- (void)setParsecState:(BOOL)a3;
- (void)setQuality:(unint64_t)a3;
- (void)setQueryEval:(__MDSimpleQueryEvaluator *)a3;
- (void)setQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionStartTime:(double)a3;
- (void)setupSearchSession;
- (void)updateCorrectionDict:(id)a3;
- (void)updateParsecBeyondTimeoutCount:(BOOL)a3;
@end

@implementation SPParsecDatastore

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    SPLogInit();
    v3 = +[NSBundle bundleForClass:a1];
    v4 = [v3 infoDictionary];
    id v8 = [v4 objectForKeyedSubscript:@"CFBundleVersion"];

    uint64_t v5 = +[NSString stringWithFormat:@"Spotlight/%@", v8];
    v6 = (void *)qword_1000A93F8;
    qword_1000A93F8 = v5;

    char v7 = PRSRankingSDEnabledFlagState();
    if ((v7 & 4) != 0) {
      byte_1000A93F0 = 1;
    }
    if ((v7 & 8) != 0) {
      byte_1000A9400 = 1;
    }
  }
}

- (void)updateParsecBeyondTimeoutCount:(BOOL)a3
{
  if (a3) {
    self->_withinThreshold = 1;
  }
}

- (SPParsecDatastore)init
{
  v12.receiver = self;
  v12.super_class = (Class)SPParsecDatastore;
  v2 = [(SPParsecDatastore *)&v12 init];
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);

  dispatch_queue_t v5 = dispatch_queue_create(0, v4);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v5;

  v2->_sessionStartTime = CFAbsoluteTimeGetCurrent();
  uint64_t v7 = +[SDNetworkQualityInquiry sharedInstance];
  networkConditions = v2->_networkConditions;
  v2->_networkConditions = (SDNetworkQualityInquiry *)v7;

  uint64_t v9 = objc_opt_new();
  mapsParsecRanker = v2->_mapsParsecRanker;
  v2->_mapsParsecRanker = (PRSMapsParsecRanker *)v9;

  [(SPParsecDatastore *)v2 checkParsecState];
  return v2;
}

- (NSString)applicationNameForUserAgent
{
  return (NSString *)(id)qword_1000A93F8;
}

- (id)createResultObject
{
  id v2 = objc_alloc_init((Class)SFSearchResult_Compatibility);

  return v2;
}

- (BOOL)available
{
  BOOL v2 = !self->_parsecEnabled || byte_1000A9401 == 0;
  return !v2 && self->_session != 0;
}

- (void)setupSearchSession
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_parsecEnabled
    && !obj->_session
    && (BOOL v2 = (PRSSearchSession *)[objc_alloc((Class)PRSSearchSession) initWithClient:obj clientQueue:obj->_queue], session = obj->_session, obj->_session = v2, session, (v4 = obj->_session) != 0))
  {
    dispatch_queue_t v5 = [(PRSSearchSession *)v4 listener];
    [(SPParsecFeedbackProxy *)obj->_listener setListener:v5];

    [(PRSSearchSession *)obj->_session setParsecFeedbackAllowed:byte_1000A9401];
    objc_sync_exit(obj);

    +[SPFeedbackSender updateFeedbackListeners];
  }
  else
  {
    objc_sync_exit(obj);
  }
}

- (void)checkParsecState
{
  SPGetDisabledDomainSet();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  self->_parsecEnabled = [v5 containsObject:@"DOMAIN_PARSEC"] ^ 1;
  v3 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v4 = [v3 isSpotlightInternetResultsAllowed];

  if ((v4 & 1) == 0) {
    self->_parsecEnabled = 0;
  }
}

- (id)performQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = si_tracing_current_span();
  long long v37 = *(_OWORD *)v5;
  long long v39 = *(_OWORD *)(v5 + 16);
  uint64_t v41 = *(void *)(v5 + 32);
  uint64_t v6 = *(void *)v5;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v5 + 8);
  *(void *)uint64_t v5 = v6;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = v8;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "-[SPParsecDatastore performQuery:]";
  si_tracing_log_span_begin();
  if (([v4 isPeopleSearch] & 1) != 0
    || [v4 isScopedAppSearch])
  {
    if (objc_msgSend(v4, "isPeopleSearch", v37, v39, v41))
    {
      __uint64_t v9 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      v10 = "people";
    }
    else
    {
      __uint64_t v9 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      v10 = "appscoped";
    }
    sub_1000190D4(v4, v10, "parsec", v9);
    v11 = 0;
    goto LABEL_34;
  }
  [v4 externalID];
  kdebug_trace();
  objc_super v12 = SPLogForSPLogCategoryTelemetry();
  unsigned int v13 = [v4 externalID];
  if (v13 && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "parsecLatency", " enableTelemetry=YES ", buf, 2u);
  }

  __uint64_t v14 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v15 = SPLogForSPLogCategoryDefault();
  os_log_type_t v16 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v15, v16))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "#query parsec start", buf, 2u);
  }

  if (!atomic_fetch_add(dword_1000A93C8, 1u)) {
    [(SPParsecDatastore *)self preheat];
  }
  v17 = objc_msgSend(v4, "queryContext", v37, v39, v41);
  v18 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = (id)objc_opt_class();
    v20 = [v17 searchString];
    *(_DWORD *)buf = 138412546;
    id v44 = v19;
    __int16 v45 = 2112;
    v46 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@ Perform query %@", buf, 0x16u);
  }
  v21 = [v17 disabledDomains];
  unsigned __int8 v22 = [v21 containsObject:&off_100098BA0];

  if (v22)
  {
    v23 = 0;
  }
  else
  {
    v23 = [[SPParsecQueryTask alloc] initWithStore:self resultPipe:v4 queue:self->_queue visibleApps:self->_setOfVisibleApps hiddenApps:self->_setOfHiddenApps];
    [(SPParsecQueryTask *)v23 setStartTime:v14];
    pthread_mutex_lock(&v23->_mutex);
    if (byte_1000A9400 == 1)
    {
      pthread_mutex_unlock(&v23->_mutex);
      v33 = [v17 searchString];
      uint64_t v34 = [(SPParsecQueryTask *)v23 unarchiveWithQuery:v33];
      v35 = (void *)qword_1000A9408;
      qword_1000A9408 = v34;

      v36 = [(id)qword_1000A9408 query];
      [(SPParsecQueryTask *)v23 setParsecQuery:v36];

      [(SPParsecQueryTask *)v23 resumeWithArchive:qword_1000A9408];
      goto LABEL_33;
    }
    if (self->_parsecEnabled)
    {
      if (!self->_session)
      {
        [(SPParsecDatastore *)self setupSearchSession];
        if (!self->_session) {
          sub_1000190D4(v4, "failed", "parsec", v14);
        }
      }
      v24 = [v17 searchEntities];
      if ([v24 count])
      {
        v25 = [v17 searchEntities];
        v26 = [v25 lastObject];
        v27 = [v26 currentSearchString];
      }
      else
      {
        v27 = [v17 searchString];
      }

      v28 = -[PRSSearchSession queryTaskWithString:externalId:handler:queryContext:queryIdent:](self->_session, "queryTaskWithString:externalId:handler:queryContext:queryIdent:", v27, [v4 externalID], v23, v17, objc_msgSend(v4, "queryIdent"));
      if (v28)
      {
        v29 = SPLogForSPLogCategoryDefault();
        os_log_type_t v30 = 2 * (gSPLogDebugAsDefault == 0);
        if (os_log_type_enabled(v29, v30))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, v30, "#query parsec start - parsec", buf, 2u);
        }

        [v28 setParsecState:self->_parsecEnabled];
        [(SPParsecQueryTask *)v23 setParsecQuery:v28];
        [v28 setRepresentedObject:v4];
      }
    }
    pthread_mutex_unlock(&v23->_mutex);
  }
  v31 = [(SPParsecDatastore *)self session];
  [v31 searchRenderTimeout];
  [(SPParsecQueryTask *)v23 resumeWithTimeout:"resumeWithTimeout:"];

LABEL_33:
  v11 = v23;

LABEL_34:
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v5 = v38;
  *(_OWORD *)(v5 + 16) = v40;
  *(void *)(v5 + 32) = v42;

  return v11;
}

- (void)activate
{
  v3 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100066388((uint64_t)self, v3);
  }

  if (!atomic_fetch_add(dword_1000A93C8, 1u)) {
    [(SPParsecDatastore *)self preheat];
  }
  self->_sessionStartTime = CFAbsoluteTimeGetCurrent();
  id v4 = [(SDNetworkQualityInquiry *)self->_networkConditions getNetworkQuality];
  self->_quality = (unint64_t)v4;
  if (self->_lastKnownQuality != v4) {
    self->_parsecBeyondTimeoutRequestCount = 0;
  }
  self->_lastKnownQuality = (unint64_t)v4;
  session = self->_session;
  if (!session)
  {
    if (self->_parsecEnabled)
    {
      [(SPParsecDatastore *)self setupSearchSession];
      session = self->_session;
    }
    else
    {
      session = 0;
    }
  }
  [(PRSSearchSession *)session activate];
  [(SPParsecDatastore *)self checkParsecState];
  SPCopyVisibleApps();
  uint64_t v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
  setOfVisibleApps = self->_setOfVisibleApps;
  self->_setOfVisibleApps = v6;

  SPFastHiddenAppsGetNoBuild();
  uint64_t v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  setOfHiddenApps = self->_setOfHiddenApps;
  self->_setOfHiddenApps = v8;
}

- (void)deactivate
{
  id v3 = [(SPParsecDatastore *)self session];
  [v3 deactivate];
  self->_activated = 0;
  atomic_fetch_add(dword_1000A93C8, 0xFFFFFFFF);
  self->_sessionStartTime = 0.0;
}

- (void)preheat
{
  if (self->_parsecEnabled)
  {
    if (!self->_session) {
      [(SPParsecDatastore *)self setupSearchSession];
    }
    if (!self->_activated)
    {
      [(PRSSearchSession *)self->_session activate];
      self->_activated = 1;
    }
  }
}

- (unsigned)domain
{
  return 2;
}

- (double)computeTimeout:(double)a3
{
  unint64_t quality = self->_quality;
  if ((quality & 0xFFFFFFFFFFFFFFFELL) != 2
    || self->_parsecBeyondTimeoutRequestCount < 4
    || self->_lastKnownQuality != quality)
  {
    goto LABEL_11;
  }
  BOOL withinThreshold = self->_withinThreshold;
  uint64_t v6 = SPLogForSPLogCategoryDefault();
  os_log_type_t v7 = 2 * (gSPLogDebugAsDefault == 0);
  BOOL v8 = os_log_type_enabled(v6, v7);
  if (withinThreshold)
  {
    a3 = a3 + 0.05;
    if (v8)
    {
      __int16 v13 = 0;
      __uint64_t v9 = "[Parsec] Increased timeout";
      v10 = (uint8_t *)&v13;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v6, v7, v9, v10, 2u);
    }
  }
  else
  {
    a3 = a3 * 0.5;
    if (v8)
    {
      __int16 v12 = 0;
      __uint64_t v9 = "[Parsec] Cut down timeout";
      v10 = (uint8_t *)&v12;
      goto LABEL_9;
    }
  }

LABEL_11:
  double result = 0.2;
  if (a3 > 0.0) {
    return a3;
  }
  return result;
}

- (double)searchTimeOut
{
  id v3 = [(SPParsecDatastore *)self session];
  if (v3)
  {
    id v4 = [(SPParsecDatastore *)self session];
    [v4 searchRenderTimeout];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.2;
  }

  [(SPParsecDatastore *)self computeTimeout:v6];
  return result;
}

- (double)suggestionTimeOut
{
  id v3 = [(SPParsecDatastore *)self session];
  [v3 suggestionsRenderTimeout];
  double v5 = v4;

  [(SPParsecDatastore *)self computeTimeout:v5];
  return result;
}

- (double)timeOut:(BOOL)a3
{
  if (a3) {
    [(SPParsecDatastore *)self suggestionTimeOut];
  }
  else {
    [(SPParsecDatastore *)self searchTimeOut];
  }
  return result;
}

- (void)sessionReceivedBagWithEnabledDomains:(id)a3
{
  id v4 = a3;
  double v5 = SPLogForSPLogCategoryDefault();
  os_log_type_t v6 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v5, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Received bag with enabled domains: %@", (uint8_t *)&v12, 0xCu);
  }

  [v4 count];
  SPSetInternetDomainsAvailable();
  id v7 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.searchd"];
  unsigned int v8 = [v7 BOOLForKey:@"disableAsTypedSuggestion"];
  __uint64_t v9 = [(SPParsecDatastore *)self session];
  unsigned int v10 = [v9 disableAsTypedSuggestion];

  if (v8 != v10)
  {
    v11 = [(SPParsecDatastore *)self session];
    objc_msgSend(v7, "setBool:forKey:", objc_msgSend(v11, "disableAsTypedSuggestion"), @"disableAsTypedSuggestion");

    [v7 synchronize];
  }
}

- (void)updateCorrectionDict:(id)a3
{
  id v3 = a3;
  id v4 = +[SPCorrectionHandler sharedHandler];
  [v4 updateWithFileHandle:v3];
}

- (void)getFTEStringsWithReply:(id)a3
{
  id v4 = a3;
  session = self->_session;
  if (session) {
    goto LABEL_5;
  }
  os_log_type_t v6 = SPLogForSPLogCategoryDefault();
  os_log_type_t v7 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v6, v7))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Parsec session is nil in FTE. Trying to create one.", buf, 2u);
  }

  [(SPParsecDatastore *)self setupSearchSession];
  session = self->_session;
  if (session)
  {
LABEL_5:
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100062688;
    v9[3] = &unk_100093CF0;
    v9[4] = self;
    id v10 = v4;
    [(PRSSearchSession *)session getFTEStringsWithReply:v9];
  }
  else
  {
    unsigned int v8 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10006641C(v8);
    }

    (*((void (**)(id, void, void, void, void))v4 + 2))(v4, 0, 0, 0, 0);
  }
}

- (SSPlistDataReader)cannedCEPValues
{
  if (byte_1000A9400) {
    p_session = (PRSSearchSession **)&qword_1000A9408;
  }
  else {
    p_session = &self->_session;
  }
  id v3 = [(PRSSearchSession *)*p_session cannedCEPValues];

  return (SSPlistDataReader *)v3;
}

- (SSPlistDataReader)cepDictionary
{
  if (byte_1000A9400) {
    p_session = (PRSSearchSession **)&qword_1000A9408;
  }
  else {
    p_session = &self->_session;
  }
  id v3 = [(PRSSearchSession *)*p_session cepDictionary];

  return (SSPlistDataReader *)v3;
}

- (NSSet)appBlocklist
{
  return (NSSet *)[(PRSSearchSession *)self->_session appBlocklist];
}

- (id)feedbackListeners
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000629E4;
  block[3] = &unk_1000921B0;
  block[4] = self;
  if (qword_1000A9410 != -1) {
    dispatch_once(&qword_1000A9410, block);
  }
  id v3 = self->_listener;
  xpc_object_t v4 = xpc_BOOL_create(self->_session != 0);
  double v5 = sub_100062A60("parsecPresent", v4);
  analytics_send_event();

  if (v3)
  {
    __uint64_t v9 = v3;
    os_log_type_t v6 = +[NSArray arrayWithObjects:&v9 count:1];
  }
  else
  {
    os_log_type_t v6 = &__NSArray0__struct;
  }

  return v6;
}

- (void)setParsecState:(BOOL)a3
{
  self->_parsecEnabled = a3;
  xpc_object_t v4 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v5 = [v4 isSpotlightInternetResultsAllowed];

  if ((v5 & 1) == 0) {
    self->_parsecEnabled = 0;
  }
}

- (void)setParsecFeedbackAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = SPLogForSPLogCategoryDefault();
  os_log_type_t v6 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v5, v6))
  {
    int v16 = 67109120;
    LODWORD(v17) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "[FEEDBACK-DEBUG] (SPParsecDatastore setParsecFeedbackAllowed) allowed: %d, ", (uint8_t *)&v16, 8u);
  }

  os_log_type_t v7 = SPLogForSPLogCategoryDefault();
  os_log_type_t v8 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v7, v8))
  {
    __uint64_t v9 = [(SPParsecDatastore *)self session];
    int v16 = 138412290;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[FEEDBACK-DEBUG] (SPParsecDatastore setParsecFeedbackAllowed) self.session: %@, ", (uint8_t *)&v16, 0xCu);
  }
  id v10 = self;
  objc_sync_enter(v10);
  v11 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = "allowed";
    if (!v3) {
      int v12 = "forbidden";
    }
    int v16 = 136315138;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Parsec feedback %s", (uint8_t *)&v16, 0xCu);
  }

  xpc_object_t v13 = xpc_BOOL_create(v3);
  __uint64_t v14 = sub_100062A60("allowed", v13);
  analytics_send_event();

  byte_1000A9401 = v3;
  v15 = [(SPParsecDatastore *)v10 session];
  [v15 setParsecFeedbackAllowed:byte_1000A9401];

  objc_sync_exit(v10);
  +[SPFeedbackSender updateFeedbackListeners];
}

- (PRSMapsParsecRanker)mapsParsecRanker
{
  return self->_mapsParsecRanker;
}

- (BOOL)parsecEnabled
{
  return self->_parsecEnabled;
}

- (void)setParsecEnabled:(BOOL)a3
{
  self->_parsecEnabled = a3;
}

- (NSArray)excludedDomainIdentifiers
{
  return self->_excludedDomainIdentifiers;
}

- (void)setExcludedDomainIdentifiers:(id)a3
{
}

- (PRSSearchSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (__MDSimpleQueryEvaluator)queryEval
{
  return self->_queryEval;
}

- (void)setQueryEval:(__MDSimpleQueryEvaluator *)a3
{
  self->_queryEval = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (double)sessionStartTime
{
  return self->_sessionStartTime;
}

- (void)setSessionStartTime:(double)a3
{
  self->_sessionStartTime = a3;
}

- (SDNetworkQualityInquiry)networkConditions
{
  return (SDNetworkQualityInquiry *)objc_getProperty(self, a2, 104, 1);
}

- (void)setNetworkConditions:(id)a3
{
}

- (unint64_t)quality
{
  return self->_quality;
}

- (void)setQuality:(unint64_t)a3
{
  self->_unint64_t quality = a3;
}

- (unint64_t)lastKnownQuality
{
  return self->_lastKnownQuality;
}

- (void)setLastKnownQuality:(unint64_t)a3
{
  self->_lastKnownQuality = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkConditions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_excludedDomainIdentifiers, 0);
  objc_storeStrong((id *)&self->_mapsParsecRanker, 0);
  objc_storeStrong((id *)&self->_setOfHiddenApps, 0);
  objc_storeStrong((id *)&self->_setOfVisibleApps, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end