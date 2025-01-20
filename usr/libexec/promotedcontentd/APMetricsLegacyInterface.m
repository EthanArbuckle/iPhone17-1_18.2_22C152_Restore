@interface APMetricsLegacyInterface
- (APDatabaseManager)databaseManager;
- (APLegacyMetricRetryManagerProtocol)metricRetryManager;
- (APMetricsLegacyInterface)init;
- (APMetricsLegacyInterface)initWithRetryManager:(id)a3;
- (APMetricsLegacyInterface)initWithRetryManager:(id)a3 databaseManager:(id)a4;
- (APUnfairRecursiveLock)confirmedClickLock;
- (APUnfairRecursiveLock)delayedRequestLock;
- (BOOL)handleExpandedPlaceholderWithUnfilledReason:(int)a3 metric:(id)a4 internalContent:(id)a5 context:(id)a6 idAccount:(id)a7;
- (BOOL)shouldIgnoreMetric:(id)a3;
- (NSMutableDictionary)pendingDelayedRequests;
- (NSSet)bundleIdentifierAllowList;
- (NSSet)ignoredClientIdentifierSuffixes;
- (NSSet)ignoredClientIdentifiers;
- (id)_confirmed50PercentImpressionRequest:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7 forClickInteraction:(BOOL)a8;
- (id)_confirmedImpressionRequest:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7 forClickInteraction:(BOOL)a8;
- (id)_unconfirmedImpressionRequest:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7;
- (id)baseHandleInterfaceOnScreen:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6;
- (id)handleArticleLoadFailure:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6;
- (id)handleClientDiscarded:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6;
- (id)handleDaemonRequestFailed:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6;
- (id)handleInterfaceExceededContainer:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6;
- (id)handleInterfaceInteracted:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7;
- (id)handleInterfaceOffScreen:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7;
- (id)handleInterfaceOnScreen:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6;
- (id)handleInterfaceReady:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7;
- (id)handleInterfaceReplaced:(id)a3 metricEnvironment:(id)a4;
- (id)handleInterfaceVisible:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7;
- (id)handleLoadFailed:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6;
- (id)handleMediaComplete:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7;
- (id)handlePrivacyAdMetric:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7;
- (id)handleQuickReturn:(id)a3 internalContent:(id)a4 context:(id)a5;
- (id)handleSubscription:(id)a3;
- (id)handleValidationFailed:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6;
- (id)handleVideoMetric:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7;
- (id)pendingRequestsForContent:(id)a3 filterPredicate:(id)a4;
- (id)timeSpentProcessor;
- (void)processMetric:(id)a3 environmentProvider:(id)a4;
- (void)removeDelayedRequest:(id)a3 cancel:(BOOL)a4;
- (void)sendLegacyMetric:(id)a3;
- (void)sendLegacyMetricWithDelay:(double)a3 legacyMetric:(id)a4 requestSentHandler:(id)a5;
@end

@implementation APMetricsLegacyInterface

- (APMetricsLegacyInterface)init
{
  v7.receiver = self;
  v7.super_class = (Class)APMetricsLegacyInterface;
  v2 = [(APMetricsLegacyInterface *)&v7 init];
  if (v2)
  {
    v3 = +[NSProcessInfo processInfo];
    unsigned __int8 v4 = [v3 isRunningTests];

    if ((v4 & 1) == 0)
    {
      v5 = objc_alloc_init(APLegacyMetricRetryManager);
      v2 = [(APMetricsLegacyInterface *)v2 initWithRetryManager:v5];
    }
  }
  return v2;
}

- (APMetricsLegacyInterface)initWithRetryManager:(id)a3
{
  id v4 = a3;
  v5 = +[APDatabaseManager mainDatabase];
  v6 = [(APMetricsLegacyInterface *)self initWithRetryManager:v4 databaseManager:v5];

  return v6;
}

- (APMetricsLegacyInterface)initWithRetryManager:(id)a3 databaseManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)APMetricsLegacyInterface;
  v9 = [(APMetricsLegacyInterface *)&v19 init];
  if (v9)
  {
    uint64_t v10 = +[NSMutableDictionary dictionary];
    pendingDelayedRequests = v9->_pendingDelayedRequests;
    v9->_pendingDelayedRequests = (NSMutableDictionary *)v10;

    v12 = (APUnfairRecursiveLock *)objc_alloc_init((Class)APUnfairRecursiveLock);
    delayedRequestLock = v9->_delayedRequestLock;
    v9->_delayedRequestLock = v12;

    v14 = (APUnfairRecursiveLock *)objc_alloc_init((Class)APUnfairRecursiveLock);
    confirmedClickLock = v9->_confirmedClickLock;
    v9->_confirmedClickLock = v14;

    uint64_t v16 = +[NSSet setWithObjects:@"com.apple.news", @"com.apple.stocks", @"com.apple.ap.promotedcontentd", 0];
    bundleIdentifierAllowList = v9->_bundleIdentifierAllowList;
    v9->_bundleIdentifierAllowList = (NSSet *)v16;

    objc_storeStrong((id *)&v9->_metricRetryManager, a3);
    [(APLegacyMetricRetryManagerProtocol *)v9->_metricRetryManager start];
    objc_storeStrong((id *)&v9->_databaseManager, a4);
  }

  return v9;
}

- (id)timeSpentProcessor
{
  v3 = [APTimeSpentLegacyInterface alloc];
  id v4 = [(APMetricsLegacyInterface *)self databaseManager];
  v5 = [(APMetricsLegacyInterface *)self metricRetryManager];
  v6 = [(APTimeSpentLegacyInterface *)v3 initWithDbManager:v4 retryManager:v5];

  return v6;
}

- (void)sendLegacyMetric:(id)a3
{
  id v4 = a3;
  v5 = [(APMetricsLegacyInterface *)self metricRetryManager];
  [v4 setRetryManager:v5];

  v6 = [v4 internalContent];
  [v6 eventSent];

  objc_initWeak(&location, self);
  id v7 = (void *)os_transaction_create();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000C519C;
  v10[3] = &unk_100235820;
  objc_copyWeak(&v13, &location);
  id v8 = v4;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [v8 makeRequest:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)sendLegacyMetricWithDelay:(double)a3 legacyMetric:(id)a4 requestSentHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = APLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v8 metric];
    *(_DWORD *)buf = 134218242;
    *(double *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Delaying send of metric by %.2f seconds for metric:\n%{public}@", buf, 0x16u);
  }
  id v12 = [(APMetricsLegacyInterface *)self delayedRequestLock];
  [v12 lock];

  id v13 = [(APMetricsLegacyInterface *)self pendingDelayedRequests];
  v14 = [v8 requestIdentifier];
  [v13 setObject:v8 forKey:v14];

  v15 = [(APMetricsLegacyInterface *)self delayedRequestLock];
  [v15 unlock];

  uint64_t v16 = [(APMetricsLegacyInterface *)self metricRetryManager];
  [v8 setRetryManager:v16];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v27 = sub_1000C54EC;
  v28 = sub_1000C54FC;
  id v29 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000C5504;
  v22[3] = &unk_100235848;
  v22[4] = self;
  id v23 = v8;
  v25 = buf;
  id v17 = v9;
  id v24 = v17;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000C55AC;
  v19[3] = &unk_100235870;
  v19[4] = self;
  id v18 = v23;
  id v20 = v18;
  v21 = buf;
  [v18 makeDelayedRequest:v22 requestSentHandler:v19 responseCallback:a3];

  _Block_object_dispose(buf, 8);
}

- (void)removeDelayedRequest:(id)a3 cancel:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  v6 = [(APMetricsLegacyInterface *)self delayedRequestLock];
  [v6 lock];

  if (v4)
  {
    id v7 = [(APMetricsLegacyInterface *)self pendingDelayedRequests];
    id v8 = [v7 objectForKeyedSubscript:v11];

    [v8 cancelDelayedRequest];
  }
  id v9 = [(APMetricsLegacyInterface *)self pendingDelayedRequests];
  [v9 removeObjectForKey:v11];

  uint64_t v10 = [(APMetricsLegacyInterface *)self delayedRequestLock];
  [v10 unlock];
}

- (id)pendingRequestsForContent:(id)a3 filterPredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(APMetricsLegacyInterface *)self delayedRequestLock];
  [v8 lock];

  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1000C54EC;
  id v23 = sub_1000C54FC;
  id v24 = 0;
  id v9 = [(APMetricsLegacyInterface *)self pendingDelayedRequests];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000C58C0;
  v15[3] = &unk_100235898;
  id v10 = v6;
  id v16 = v10;
  id v18 = &v19;
  id v11 = v7;
  id v17 = v11;
  [v9 enumerateKeysAndObjectsUsingBlock:v15];

  id v12 = [(APMetricsLegacyInterface *)self delayedRequestLock];
  [v12 unlock];

  id v13 = [(id)v20[5] copy];
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (void)processMetric:(id)a3 environmentProvider:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  unsigned int v8 = [(APMetricsLegacyInterface *)self shouldIgnoreMetric:v6];
  id v9 = APLogForCategory();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      id v11 = [v6 bundleIdentifier];
      int v55 = 138412290;
      id v56 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Ignoring metric from client %@", (uint8_t *)&v55, 0xCu);
    }
    goto LABEL_72;
  }
  if (v10)
  {
    id v12 = [v6 metric];
    id v13 = [v6 handle];
    v14 = [v6 contentIdentifier];
    int v55 = 134218498;
    id v56 = v12;
    __int16 v57 = 2114;
    v58 = v13;
    __int16 v59 = 2114;
    v60 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Received metric %ld with ID %{public}@ for adOpID %{public}@ from PCCD", (uint8_t *)&v55, 0x20u);
  }
  v15 = metricPropertyValue(v6, (void *)0x13);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = metricPropertyValue(v6, (void *)0x13);
    unsigned int v17 = [v16 BOOLValue];

    if (!v17) {
      goto LABEL_12;
    }
  }
  else
  {
    id v18 = [v6 contentIdentifier];
    unsigned __int8 v19 = +[APContentDataInternal isPlaceholderIdentifier:v18];

    if ((v19 & 1) == 0) {
      goto LABEL_12;
    }
  }
  if ([v6 metric] != (id)1405 && objc_msgSend(v6, "metric") != (id)1202)
  {
    id v9 = APLogForCategory();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
LABEL_72:

      goto LABEL_73;
    }
    id v31 = [v6 metric];
    id v29 = [v6 contentIdentifier];
    v32 = [v6 contextIdentifier];
    int v55 = 134218498;
    id v56 = v31;
    __int16 v57 = 2114;
    v58 = v29;
    __int16 v59 = 2114;
    v60 = v32;
    v33 = "A placeholder APContentData is reporting metric %ld and will not be processed. content: %{public}@ context: %{public}@.";
    v34 = v9;
    uint32_t v35 = 32;
    goto LABEL_70;
  }
LABEL_12:
  if ([v6 purpose] != (id)100)
  {
    if ([v6 purpose] == (id)101)
    {
      id v21 = [v6 metric];
      if (v21 == (id)2503)
      {
LABEL_42:
        v37 = v7[2](v7);
        if (v37)
        {
          id v9 = v37;
          id v23 = [v37 internalContent];
          id v24 = [v9 context];
          v25 = [v9 clientInfo];
          v38 = [v9 idAccount];
          uint64_t v39 = [(APMetricsLegacyInterface *)self handleVideoMetric:v6 internalContent:v23 context:v24 clientInfo:v25 idAccount:v38];
LABEL_44:
          id v29 = v39;

LABEL_64:
LABEL_65:

LABEL_66:
          if (v29)
          {
            [(APMetricsLegacyInterface *)self sendLegacyMetric:v29];
            goto LABEL_71;
          }
LABEL_68:
          id v29 = APLogForCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            id v50 = [v6 metric];
            v32 = [v6 contentIdentifier];
            int v55 = 134218242;
            id v56 = v50;
            __int16 v57 = 2114;
            v58 = v32;
            v33 = "Metric %ld for content %{public}@ does not send a metric request.";
            v34 = v29;
            uint32_t v35 = 22;
LABEL_70:
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, v33, (uint8_t *)&v55, v35);
          }
LABEL_71:

          goto LABEL_72;
        }
        goto LABEL_73;
      }
      if (v21 != (id)2501)
      {
LABEL_58:
        id v9 = 0;
        goto LABEL_68;
      }
      v22 = v7[2](v7);
      if (!v22) {
        goto LABEL_73;
      }
      id v9 = v22;
      id v23 = [v22 internalContent];
      id v24 = [v9 context];
      v25 = [v9 idAccount];
      uint64_t v26 = [(APMetricsLegacyInterface *)self handleLoadFailed:v6 internalContent:v23 context:v24 idAccount:v25];
    }
    else
    {
      if ([v6 purpose] == (id)-1)
      {
        switch((unint64_t)[v6 metric])
        {
          case 0x12CC9uLL:
            v36 = v7[2](v7);
            if (!v36) {
              goto LABEL_73;
            }
            id v9 = v36;
            id v23 = [v36 internalContent];
            id v24 = [v9 context];
            v25 = [v9 idAccount];
            uint64_t v26 = [(APMetricsLegacyInterface *)self handleArticleLoadFailure:v6 internalContent:v23 context:v24 idAccount:v25];
            goto LABEL_63;
          case 0x12CCAuLL:
            id v29 = [(APMetricsLegacyInterface *)self handleSubscription:v6];
            id v9 = 0;
            goto LABEL_66;
          case 0x12CCBuLL:
            v41 = v7[2](v7);
            if (!v41) {
              goto LABEL_73;
            }
            id v9 = v41;
            id v23 = [v41 internalContent];
            id v24 = [v9 context];
            v25 = [v9 clientInfo];
            v38 = [v9 idAccount];
            uint64_t v39 = [(APMetricsLegacyInterface *)self handleMediaComplete:v6 internalContent:v23 context:v24 clientInfo:v25 idAccount:v38];
            goto LABEL_44;
          case 0x12CCCuLL:
            v43 = v7[2](v7);
            if (!v43) {
              goto LABEL_73;
            }
            id v9 = v43;
            id v23 = [v43 internalContent];
            id v24 = [v9 context];
            v25 = [v9 idAccount];
            uint64_t v26 = [(APMetricsLegacyInterface *)self handleInterfaceExceededContainer:v6 internalContent:v23 context:v24 idAccount:v25];
            goto LABEL_63;
          case 0x12CCDuLL:
            v42 = v7[2](v7);
            if (!v42) {
              goto LABEL_73;
            }
            id v9 = v42;
            id v23 = [v42 internalContent];
            id v24 = [v9 context];
            v25 = [v9 idAccount];
            uint64_t v26 = [(APMetricsLegacyInterface *)self handleInterstitialOnScreen:v6 internalContent:v23 context:v24 idAccount:v25];
            goto LABEL_63;
          default:
            goto LABEL_58;
        }
      }
      if ([v6 purpose] != (id)-105 || objc_msgSend(v6, "metric") != (id)77500) {
        goto LABEL_58;
      }
      v27 = v7[2](v7);
      if (!v27) {
        goto LABEL_73;
      }
      id v9 = v27;
      id v23 = [v27 internalContent];
      id v24 = [v9 context];
      v25 = [v9 idAccount];
      uint64_t v26 = [(APMetricsLegacyInterface *)self handleValidationFailed:v6 internalContent:v23 context:v24 idAccount:v25];
    }
LABEL_63:
    id v29 = v26;
    goto LABEL_64;
  }
  uint64_t v20 = (uint64_t)[v6 metric];
  id v9 = 0;
  if (v20 > 1201)
  {
    switch(v20)
    {
      case 1400:
      case 1402:
      case 1403:
      case 1410:
      case 1411:
        goto LABEL_68;
      case 1401:
        uint64_t v28 = v7[2](v7);
        if (!v28) {
          goto LABEL_73;
        }
        id v9 = v28;
        id v29 = [(APMetricsLegacyInterface *)self handleInterfaceReplaced:v6 metricEnvironment:v28];
        goto LABEL_66;
      case 1404:
        v48 = v7[2](v7);
        if (!v48) {
          goto LABEL_73;
        }
        id v9 = v48;
        id v23 = [v48 internalContent];
        id v24 = [v9 context];
        v25 = [v9 clientInfo];
        v38 = [v9 idAccount];
        uint64_t v39 = [(APMetricsLegacyInterface *)self handleInterfaceReady:v6 internalContent:v23 context:v24 clientInfo:v25 idAccount:v38];
        goto LABEL_44;
      case 1405:
        v49 = v7[2](v7);
        if (!v49) {
          goto LABEL_73;
        }
        id v9 = v49;
        id v23 = [v49 internalContent];
        id v24 = [v9 context];
        v25 = [v9 idAccount];
        uint64_t v26 = [(APMetricsLegacyInterface *)self handleInterfaceOnScreen:v6 internalContent:v23 context:v24 idAccount:v25];
        goto LABEL_63;
      case 1406:
        v51 = v7[2](v7);
        if (!v51) {
          goto LABEL_73;
        }
        id v9 = v51;
        id v23 = [v51 internalContent];
        id v24 = [v9 context];
        v25 = [v9 clientInfo];
        v38 = [v9 idAccount];
        uint64_t v39 = [(APMetricsLegacyInterface *)self handleInterfaceVisible:v6 internalContent:v23 context:v24 clientInfo:v25 idAccount:v38];
        goto LABEL_44;
      case 1407:
        v52 = v7[2](v7);
        if (!v52) {
          goto LABEL_73;
        }
        id v9 = v52;
        id v23 = [v52 internalContent];
        id v24 = [v9 context];
        v25 = [v9 clientInfo];
        v38 = [v9 idAccount];
        uint64_t v39 = [(APMetricsLegacyInterface *)self handleInterfaceOffScreen:v6 internalContent:v23 context:v24 clientInfo:v25 idAccount:v38];
        goto LABEL_44;
      case 1408:
        v53 = v7[2](v7);
        if (!v53) {
          goto LABEL_73;
        }
        id v9 = v53;
        id v23 = [v53 internalContent];
        id v24 = [v9 context];
        v25 = [v9 clientInfo];
        v38 = [v9 idAccount];
        uint64_t v39 = [(APMetricsLegacyInterface *)self handleInterfaceInteracted:v6 internalContent:v23 context:v24 clientInfo:v25 idAccount:v38];
        goto LABEL_44;
      case 1409:
        v54 = v7[2](v7);
        if (!v54) {
          goto LABEL_73;
        }
        id v9 = v54;
        id v23 = [v54 internalContent];
        id v24 = [v9 context];
        id v29 = [(APMetricsLegacyInterface *)self handleQuickReturn:v6 internalContent:v23 context:v24];
        goto LABEL_65;
      default:
        if ((unint64_t)(v20 - 1600) <= 9 && v20 != 1601) {
          goto LABEL_42;
        }
        if (v20 != 1202) {
          goto LABEL_55;
        }
        goto LABEL_68;
    }
  }
  if (v20 <= 1003)
  {
    if ((unint64_t)(v20 - 1000) < 4) {
      goto LABEL_68;
    }
LABEL_55:
    v44 = APLogForCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      id v45 = [v6 metric];
      v46 = [v6 contentIdentifier];
      v47 = [v6 bundleIdentifier];
      int v55 = 134218498;
      id v56 = v45;
      __int16 v57 = 2114;
      v58 = v46;
      __int16 v59 = 2114;
      v60 = v47;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Ignoring metric %ld for Content %{public}@ received from %{public}@", (uint8_t *)&v55, 0x20u);
    }
    goto LABEL_58;
  }
  switch(v20)
  {
    case 1004:
      v40 = v7[2](v7);
      if (v40)
      {
        id v9 = v40;
        id v23 = [v40 internalContent];
        id v24 = [v9 context];
        v25 = [v9 idAccount];
        uint64_t v26 = [(APMetricsLegacyInterface *)self handleDaemonRequestFailed:v6 internalContent:v23 context:v24 idAccount:v25];
        goto LABEL_63;
      }
      break;
    case 1200:
      goto LABEL_68;
    case 1201:
      v30 = v7[2](v7);
      if (v30)
      {
        id v9 = v30;
        id v23 = [v30 internalContent];
        id v24 = [v9 context];
        v25 = [v9 idAccount];
        uint64_t v26 = [(APMetricsLegacyInterface *)self handleClientDiscarded:v6 internalContent:v23 context:v24 idAccount:v25];
        goto LABEL_63;
      }
      break;
    default:
      goto LABEL_55;
  }
LABEL_73:
}

- (BOOL)shouldIgnoreMetric:(id)a3
{
  id v4 = a3;
  v5 = [(APMetricsLegacyInterface *)self bundleIdentifierAllowList];
  id v6 = [v4 bundleIdentifier];

  LOBYTE(v4) = [v5 containsObject:v6] ^ 1;
  return (char)v4;
}

- (id)handleClientDiscarded:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v10 properties];
  v15 = [v14 objectForKeyedSubscript:@"code"];

  if (v15)
  {
    signed int v16 = [v15 intValue];
    v46 = (void *)v16;
    v44 = self;
    switch(v16)
    {
      case 2601:
        int v17 = 0;
        int v18 = 0;
        int v19 = 0;
        uint64_t v45 = 3007;
        int v20 = 1;
        break;
      case 2602:
        int v20 = 0;
        int v18 = 0;
        int v19 = 0;
        uint64_t v45 = 3008;
        int v17 = 1;
        break;
      case 2603:
        int v20 = 0;
        int v17 = 0;
        int v19 = 0;
        uint64_t v45 = 3009;
        int v18 = 1;
        break;
      case 2604:
        int v20 = 0;
        int v17 = 0;
        int v18 = 0;
        uint64_t v45 = 3010;
        int v19 = 1;
        break;
      default:
        int v20 = 0;
        int v17 = 0;
        int v18 = 0;
        int v19 = 0;
        uint64_t v45 = 0xFFFFFFFFLL;
        break;
    }
    id v24 = APLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      [v11 content];
      id v42 = v11;
      v43 = v15;
      uint64_t v26 = v25 = v20;
      [v26 identifier];
      int v27 = v19;
      int v28 = v18;
      int v29 = v17;
      id v30 = v13;
      id v31 = v10;
      v33 = id v32 = v12;
      *(_DWORD *)buf = 138543618;
      v48 = v33;
      __int16 v49 = 2048;
      id v50 = v46;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Content %{public}@ is being discarded with reason code %ld.", buf, 0x16u);

      id v12 = v32;
      id v10 = v31;
      id v13 = v30;
      int v17 = v29;
      int v18 = v28;
      int v19 = v27;

      int v20 = v25;
      id v11 = v42;
      v15 = v43;
    }

    if ((v20 | v17 | v18 | v19) == 1)
    {
      v34 = APLogForCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        id v35 = v13;
        id v36 = v12;
        v37 = [v11 content];
        v38 = [v37 identifier];
        if ((v45 - 3000) >= 0xB)
        {
          uint64_t v39 = +[NSString stringWithFormat:@"(unknown: %i)", v45];
        }
        else
        {
          uint64_t v39 = *(&off_1002359F0 + (int)v45 - 3000);
        }
        *(_DWORD *)buf = 138543874;
        v48 = v38;
        __int16 v49 = 2114;
        id v50 = v39;
        __int16 v51 = 2048;
        v52 = v46;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Content %{public}@ is allowed to send %{public}@ for discard code %ld.", buf, 0x20u);

        id v12 = v36;
        id v13 = v35;
      }

      v40 = [[APAdSpaceEventRequester alloc] initWithMetric:v10 internalContent:v11 andContext:v12 idAccount:v13];
      [(APAdSpaceEventRequester *)v40 setStatusCode:v45];
      [(APMetricsLegacyInterface *)v44 sendLegacyMetric:v40];
    }
    [v11 discarded];
  }
  else
  {
    id v21 = APLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = [v11 content];
      id v23 = [v22 identifier];
      *(_DWORD *)buf = 138543362;
      v48 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Content %{public}@ is reporting clientDiscarded with no discard code. No ASE sent.", buf, 0xCu);
    }
  }

  return 0;
}

- (id)handleInterfaceReady:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v12 = a4;
  id v13 = [(APMetricsLegacyInterface *)self _unconfirmedImpressionRequest:a3 internalContent:v12 context:a5 clientInfo:a6 idAccount:a7];
  [v12 interfaceReady];

  return v13;
}

- (id)handleInterfaceInteracted:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v11 = (__CFString *)a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  signed int v16 = metricPropertyValue(v11, (void *)0x2F);
  objc_opt_class();
  double v17 = -1.0;
  double v18 = -1.0;
  if (objc_opt_isKindOfClass())
  {
    int v19 = metricPropertyValue(v11, (void *)0x2F);
    [v19 doubleValue];
    double v18 = v20;
  }
  id v21 = metricPropertyValue(v11, (void *)0x30);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = metricPropertyValue(v11, (void *)0x30);
    [v22 doubleValue];
    double v17 = v23;
  }
  id v24 = metricPropertyValue(v11, (void *)9);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v25 = metricPropertyValue(v11, (void *)9);
    uint64_t v26 = (uint64_t)[v25 intValue];
  }
  else
  {
    uint64_t v26 = 0xFFFFFFFFLL;
  }

  int v27 = metricPropertyValue(v11, (void *)0x1A);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    metricPropertyValue(v11, (void *)0x1A);
    int v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v28 = 0;
  }

  int v29 = metricPropertyValue(v11, (void *)0x29);
  objc_opt_class();
  id v85 = v13;
  if (objc_opt_isKindOfClass())
  {
    id v30 = metricPropertyValue(v11, (void *)0x29);
    unsigned int v31 = [v30 intValue];

    BOOL v32 = v31 == 7302;
    id v13 = v85;
    if (v32)
    {
      id v33 = [(APMetricsLegacyInterface *)self handlePrivacyAdMetric:v11 internalContent:v12 context:v85 clientInfo:v14 idAccount:v15];
      goto LABEL_61;
    }
  }
  else
  {
  }
  id v84 = v14;
  v82 = v28;
  if (!v28)
  {
    v34 = APLogForCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v37 = [v12 content];
      v38 = [v37 identifier];
      *(_DWORD *)buf = 138543618;
      CFStringRef v90 = v38;
      __int16 v91 = 2114;
      CFStringRef v92 = v11;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "RepresentationIdentifier missing for content %{public}@ in metric %{public}@", buf, 0x16u);
    }
    goto LABEL_28;
  }
  v34 = [objc_alloc((Class)NSUUID) initWithUUIDString:v28];
  if (v34)
  {
    id v35 = [v12 content];
    id v36 = [v35 representationWithIdentifier:v34];

    if (v36) {
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v39 = APLogForCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = [v12 content];
      v41 = [v40 identifier];
      *(_DWORD *)buf = 138543618;
      CFStringRef v90 = v28;
      __int16 v91 = 2114;
      CFStringRef v92 = v41;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Representation %{public}@ for content %{public}@ is not a valid UUID.", buf, 0x16u);

      id v13 = v85;
    }
  }
  id v42 = [v12 content];
  id v36 = [v42 getRepresentation];

  if (!v36)
  {
LABEL_28:

    double v44 = -1.0;
    double v46 = -1.0;
    goto LABEL_29;
  }
LABEL_26:
  [v36 size];
  double v44 = v18 * v43;
  [v36 size];
  double v46 = v17 * v45;
  uint64_t v47 = [v36 tapAction];

  if (!v47)
  {
LABEL_29:
    id v49 = v84;
    id v50 = APLogForCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      __int16 v51 = [v12 content];
      v52 = [v51 identifier];
      *(_DWORD *)buf = 138543618;
      CFStringRef v90 = v28;
      __int16 v91 = 2114;
      CFStringRef v92 = v52;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Representation %{public}@ in content %{public}@ has no tap action.", buf, 0x16u);

      id v13 = v85;
    }

    v81 = 0;
    int v48 = 1;
    goto LABEL_32;
  }
  v81 = (void *)v47;
  int v48 = 0;
  id v49 = v84;
LABEL_32:
  if (v44 < 0.0 || v46 < 0.0)
  {
    double v44 = 0.0;
    double v46 = 0.0;
  }
  v53 = [v12 privateContent];
  unsigned int v54 = [v53 isCarouselAd];

  if (v54) {
    [v12 carouselElementClicked:v26 element:v44];
  }
  else {
    [v12 clicked:v44, v46];
  }
  v83 = [(APMetricsLegacyInterface *)self _confirmedImpressionRequest:v11 internalContent:v12 context:v13 clientInfo:v49 idAccount:v15 forClickInteraction:1];
  if (v83)
  {
    int v55 = APLogForCategory();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "APMetricsLegacyInterface sending impression request due to interaction event.", buf, 2u);
    }

    [(APMetricsLegacyInterface *)self sendLegacyMetric:v83];
  }
  id v56 = [(APMetricsLegacyInterface *)self _confirmed50PercentImpressionRequest:v11 internalContent:v12 context:v13 clientInfo:v49 idAccount:v15 forClickInteraction:1];
  if (v56)
  {
    __int16 v57 = APLogForCategory();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "APMetricsLegacyInterface sending impression request due to interaction event.", buf, 2u);
    }

    [(APMetricsLegacyInterface *)self sendLegacyMetric:v56];
  }
  v58 = [(APMetricsLegacyInterface *)self confirmedClickLock];
  [v58 lock];

  __int16 v59 = [v12 transientContent];
  unsigned int v60 = [v59 pendingConfirmedClick];

  v61 = [v12 transientContent];
  unsigned int v62 = [v61 hasConfirmedClick];

  v63 = APLogForCategory();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v64 = @"YES";
    if (v48) {
      CFStringRef v65 = @"NO";
    }
    else {
      CFStringRef v65 = @"YES";
    }
    if (v60) {
      CFStringRef v66 = @"YES";
    }
    else {
      CFStringRef v66 = @"NO";
    }
    *(_DWORD *)buf = 138543874;
    CFStringRef v90 = v65;
    __int16 v91 = 2114;
    CFStringRef v92 = v66;
    if (!v62) {
      CFStringRef v64 = @"NO";
    }
    __int16 v93 = 2114;
    CFStringRef v94 = v64;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "Action exists: %{public}@, pending confirmed click: %{public}@, confirmed click: %{public}@", buf, 0x20u);
  }

  if ((v48 | v60 | v62))
  {
    v67 = [(APMetricsLegacyInterface *)self confirmedClickLock];
    [v67 unlock];

    p_super = APLogForCategory();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
    {
      v69 = [v12 content];
      v70 = [v69 identifier];
      *(_DWORD *)buf = 138543362;
      CFStringRef v90 = v70;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, "%{public}@ already has a confirmed click or a pending confirmed click request. Not posting another one.", buf, 0xCu);

      id v14 = v84;
      v71 = v85;
      v72 = v81;
      p_superclass = (__objc2_class **)(APPBLogAnalyticsRequest + 8);
    }
    else
    {
      id v14 = v84;
      v71 = v85;
      v72 = v81;
      p_superclass = APPBLogAnalyticsRequest.superclass;
    }
  }
  else
  {
    id v14 = v84;
    v71 = v85;
    v74 = [(APLegacyMetricRequester *)[APLogSysEventRequester alloc] initWithMetric:v11 internalContent:v12 andContext:v85 clientInfo:v84 idAccount:v15];
    [(APLogSysEventRequester *)v74 setEventType:6];
    v75 = [(APLegacyMetricRequester *)v74 internalContent];
    [v75 pendingConfirmedClick:1];

    v76 = [(APMetricsLegacyInterface *)self confirmedClickLock];
    [v76 unlock];

    v72 = v81;
    [v81 confirmedClickInterval];
    double v78 = v77;
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_1000C7508;
    v87[3] = &unk_1002358C0;
    v87[4] = self;
    v88 = v74;
    v79 = v74;
    p_superclass = APPBLogAnalyticsRequest.superclass;
    p_super = &v79->super.super.super;
    [(APMetricsLegacyInterface *)self sendLegacyMetricWithDelay:v79 legacyMetric:v87 requestSentHandler:v78];
  }
  id v33 = [objc_alloc((Class)(p_superclass + 439)) initWithMetric:v11 internalContent:v12 andContext:v71 clientInfo:v14 idAccount:v15];
  [v33 setEventType:1];

  id v13 = v71;
  int v28 = v82;
LABEL_61:

  return v33;
}

- (id)handleQuickReturn:(id)a3 internalContent:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = metricPropertyValue(v7, (void *)0x1B);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = metricPropertyValue(v7, (void *)0x1B);
    uint64_t v30 = (int)[v10 intValue];

    if ((unint64_t)(v30 - 8101) <= 4)
    {
      id v29 = v7;
      id v11 = [v8 content];
      id v12 = [v11 identifier];
      id v13 = [(APMetricsLegacyInterface *)self pendingRequestsForContent:v12 filterPredicate:&stru_100235900];

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v14 = v13;
      id v15 = [v14 countByEnumeratingWithState:&v31 objects:v41 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v32;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v32 != v17) {
              objc_enumerationMutation(v14);
            }
            int v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            double v20 = APLogForCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              id v21 = [v8 content];
              v22 = [v21 identifier];
              *(_DWORD *)buf = 138412802;
              id v36 = v19;
              __int16 v37 = 2112;
              uint64_t v38 = (uint64_t)v22;
              __int16 v39 = 2048;
              uint64_t v40 = v30;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Cancelling LogSysEventRequest %@ for content %@ due to quick return time %lu.", buf, 0x20u);
            }
            [v19 cancelDelayedRequest];
            double v23 = [(APMetricsLegacyInterface *)self confirmedClickLock];
            [v23 lock];

            id v24 = [v19 internalContent];
            [v24 pendingConfirmedClick:0];

            int v25 = [(APMetricsLegacyInterface *)self confirmedClickLock];
            [v25 unlock];
          }
          id v16 = [v14 countByEnumeratingWithState:&v31 objects:v41 count:16];
        }
        while (v16);
      }

      id v7 = v29;
      goto LABEL_16;
    }
  }
  else
  {

    uint64_t v30 = 10;
  }
  id v14 = APLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v26 = [v8 content];
    int v27 = [v26 identifier];
    *(_DWORD *)buf = 138412546;
    id v36 = v27;
    __int16 v37 = 2048;
    uint64_t v38 = v30;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Ignoring quick return metric for content %@ due to quick return time %lu. Confirmed click was already sent.", buf, 0x16u);
  }
LABEL_16:

  return 0;
}

- (id)handleInterfaceOnScreen:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 internalProperties];
  id v15 = [v14 objectForKeyedSubscript:@"type"];

  id v16 = [v10 internalProperties];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"reason"];

  if ([v15 intValue] != 1) {
    goto LABEL_4;
  }
  double v18 = [v11 content];
  if ([v18 serverUnfilledReason])
  {

LABEL_4:
    int v19 = [(APMetricsLegacyInterface *)self baseHandleInterfaceOnScreen:v10 internalContent:v11 context:v12 idAccount:v13];
    goto LABEL_5;
  }
  if (v17)
  {
    id v21 = [v17 count];

    if (v21) {
      goto LABEL_4;
    }
  }
  else
  {
  }
  int v19 = 0;
LABEL_5:

  return v19;
}

- (id)baseHandleInterfaceOnScreen:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    id v14 = [v11 content];

    if (v14)
    {
      id v15 = self;
      objc_sync_enter(v15);
      id v16 = [v11 content];
      uint64_t v17 = (uint64_t)[v16 serverUnfilledReason];

      if ((unint64_t)(v17 - 1021) < 3)
      {
        double v18 = 0;
        int v19 = 1;
        goto LABEL_101;
      }
      double v23 = [v10 properties];
      id v24 = [v23 objectForKeyedSubscript:@"collapsed"];

      if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        long long v33 = [v10 contentIdentifier];
        uint64_t v26 = +[NSString stringWithFormat:@"OnScreen metric with content identifier %@ does not have a valid collapsed property %@.", v33, v24];

        long long v34 = APLogForCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v106 = (uint64_t)v26;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        if (+[APSystemInternal isAppleInternalInstall])APSimulateCrash(); {
        double v18 = 0;
        }
        int v19 = 1;
        goto LABEL_100;
      }
      int v25 = [v10 internalProperties];
      uint64_t v26 = [v25 objectForKeyedSubscript:@"placeholder"];

      if (!v26 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v35 = [v10 contentIdentifier];
        v99 = +[NSString stringWithFormat:@"OnScreen metric with content identifier %@ does not have a valid placeholder value %@.", v35, v26];

        id v36 = APLogForCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v106 = (uint64_t)v99;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        if (+[APSystemInternal isAppleInternalInstall])APSimulateCrash(); {
        goto LABEL_97;
        }
      }
      unsigned int v91 = [v24 BOOLValue];
      unsigned int v89 = [v26 BOOLValue];
      int v27 = [v10 internalProperties];
      v99 = [v27 objectForKeyedSubscript:@"type"];

      if (v17 >= 1)
      {
        uint64_t v95 = +[APLegacyTypeTranslator unfilledReasonCodeToASEStatusCode:v17];
        if (v95 == 3001) {
          unsigned int v28 = 0;
        }
        else {
          unsigned int v28 = v89;
        }
        if (v28 == 1)
        {
          id v29 = [v10 contentIdentifier];
          uint64_t v30 = +[NSString stringWithFormat:@"OnScreen metric with content identifier %@ for placeholder is not reporting AdNotAvailable (ASE 3001)! Instead is ASE: %d Unfilled Reason: %ld", v29, v95, v17];

          long long v31 = APLogForCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v106 = (uint64_t)v30;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }

          if (+[APSystemInternal isAppleInternalInstall])APSimulateCrash(); {
          int v32 = 0;
          }
LABEL_41:
          if (((v91 | v32) & 1) == 0)
          {
            if ([(APMetricsLegacyInterface *)v15 handleExpandedPlaceholderWithUnfilledReason:v95 metric:v10 internalContent:v11 context:v12 idAccount:v13])
            {
              __int16 v39 = APLogForCategory();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                id v42 = [v11 content];
                double v43 = [v42 identifier];
                *(_DWORD *)buf = 138543362;
                uint64_t v106 = (uint64_t)v43;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Delaying ASE AdNotAvailable for preroll video placeholder %{public}@, waiting for preroll timeout before sending.", buf, 0xCu);
              }
              goto LABEL_96;
            }
            v97 = [v10 contentIdentifier];
            int v55 = [v11 content];
            id v56 = [v55 identifier];
            __int16 v39 = +[NSString stringWithFormat:@"OnScreen metric %@ for expanded placeholder %@ with unfilled reason code %ld is in an unexpected state", v97, v56, v17];

            __int16 v57 = APLogForCategory();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v106 = (uint64_t)v39;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
            }

            if (!+[APSystemInternal isAppleInternalInstall])goto LABEL_96; {
LABEL_58:
            }
            APSimulateCrash();
LABEL_96:

            goto LABEL_97;
          }
LABEL_80:
          v69 = [v11 privateContent];
          unsigned int v70 = [v69 isCarouselAd];

          if (v70)
          {
            v71 = [v11 content];
            v72 = [v71 identifier];
            v73 = [(APMetricsLegacyInterface *)v15 pendingRequestsForContent:v72 filterPredicate:&stru_100235920];

            __int16 v93 = v26;
            long long v102 = 0u;
            long long v103 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            id v74 = v73;
            id v75 = [v74 countByEnumeratingWithState:&v100 objects:v104 count:16];
            if (v75)
            {
              uint64_t v76 = *(void *)v101;
              do
              {
                for (i = 0; i != v75; i = (char *)i + 1)
                {
                  if (*(void *)v101 != v76) {
                    objc_enumerationMutation(v74);
                  }
                  [*(id *)(*((void *)&v100 + 1) + 8 * i) cancelDelayedRequest];
                }
                id v75 = [v74 countByEnumeratingWithState:&v100 objects:v104 count:16];
              }
              while (v75);
            }

            uint64_t v26 = v93;
          }
          if (![v11 shouldSendAdSpaceStatusEvent:v95])
          {
            int v19 = 0;
            double v18 = 0;
LABEL_99:

LABEL_100:
LABEL_101:
            objc_sync_exit(v15);

            if (v19) {
              v22 = v18;
            }
            else {
              v22 = 0;
            }
            goto LABEL_104;
          }
          [v11 appearedOnScreenWithStatus:v95];
          double v18 = [[APAdSpaceEventRequester alloc] initWithMetric:v10 internalContent:v11 andContext:v12 idAccount:v13];
          [(APAdSpaceEventRequester *)v18 setStatusCode:v95];
LABEL_98:
          int v19 = 1;
          goto LABEL_99;
        }
        int v32 = v89 ^ 1;
        if ((v89 & 1) != 0 || v95 != 3001 || v17 == 1010) {
          goto LABEL_41;
        }
        uint64_t v38 = [v10 contentIdentifier];
        __int16 v39 = +[NSString stringWithFormat:@"OnScreen metric with content identifier %@ for non-placeholder that was not an unfilled network error is reporting AdNotAvailable (ASE 3001)! Instead is ASE %d Unfilled Reason: %ld", v38, 3001, v17];

        uint64_t v40 = APLogForCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v106 = (uint64_t)v39;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        if (+[APSystemInternal isAppleInternalInstall])APSimulateCrash(); {
        uint64_t v41 = 3001;
        }
        goto LABEL_78;
      }
      __int16 v37 = [v11 transientContent];
      if ([v37 interfaceReady])
      {
      }
      else
      {
        double v44 = [v11 privateContent];
        unsigned __int8 v96 = [v44 isClientRenderedAd];

        if ((v96 & 1) == 0)
        {
          if ((v91 & 1) == 0)
          {
            __int16 v39 = APLogForCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v68 = [v10 contentIdentifier];
              *(_DWORD *)buf = 138543362;
              uint64_t v106 = (uint64_t)v68;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "OnScreen metric with content identifier %{public}@ is reporting as expanded but a ready metric has not been received.", buf, 0xCu);
            }
            uint64_t v41 = 10;
LABEL_78:
            uint64_t v95 = v41;
LABEL_79:

            goto LABEL_80;
          }
          uint64_t v54 = 10;
LABEL_61:
          uint64_t v95 = v54;
          goto LABEL_80;
        }
      }
      if (v91)
      {
        double v45 = [v11 transientContent];
        unsigned int v46 = [v45 interfaceReady];

        if (!v46)
        {
          v88 = [v10 contentIdentifier];
          if (v89) {
            CFStringRef v58 = @"YES";
          }
          else {
            CFStringRef v58 = @"NO";
          }
          CFStringRef v86 = v58;
          v98 = [v11 transientContent];
          unsigned int v59 = [v98 interfaceReady];
          CFStringRef v60 = @"YES";
          if (!v59) {
            CFStringRef v60 = @"NO";
          }
          CFStringRef v85 = v60;
          CFStringRef v92 = [v11 privateContent];
          unsigned int v61 = [v92 isClientRenderedAd];
          CFStringRef v62 = @"YES";
          if (!v61) {
            CFStringRef v62 = @"NO";
          }
          CFStringRef v84 = v62;
          CFStringRef v90 = [v11 privateContent];
          unsigned int v63 = [v90 isNativeAd];
          CFStringRef v64 = @"YES";
          if (!v63) {
            CFStringRef v64 = @"NO";
          }
          CFStringRef v83 = v64;
          v87 = [v10 description];
          CFStringRef v65 = [v11 content];
          CFStringRef v66 = [v65 uniqueIdentifier];
          __int16 v39 = +[NSString stringWithFormat:@"__O.[Diagnostic].OnScreen metric with content identifier %@ occurred without reporting an ASE. collapsed: %@ placeholder: %@ unfilled reason: %ld ready: %@ client rendered: %@ is Native ad: %@ metric: %@ ad identifier: %@", v88, @"YES", v86, v17, v85, v84, v83, v87, v66];

          v67 = APLogForCategory();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v106 = (uint64_t)v39;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }

          if (!+[APSystemInternal isAppleInternalInstall])goto LABEL_96; {
          goto LABEL_58;
          }
        }
        uint64_t v47 = [v10 internalProperties];
        __int16 v39 = [v47 objectForKeyedSubscript:@"reason"];

        if (v39 && [v39 count])
        {
          int v48 = [v10 contentIdentifier];
          id v49 = +[NSString stringWithFormat:@"_OnScreen metric with content identifier %@ for placeholder is reporting AdNotAvailable (ASE 3001)!", v48];

          id v50 = APLogForCategory();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v106 = (uint64_t)v49;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }
          uint64_t v51 = 3001;
        }
        else
        {
          if ([v99 intValue] == 7)
          {
            double v78 = [v10 contentIdentifier];
            v79 = +[NSString stringWithFormat:@"_OnScreen metric with content identifier %@ for sponsorship Ad is attempting to report onScreen but is collapsed.", v78];

            v80 = APLogForCategory();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v106 = (uint64_t)v79;
              _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
            }

            goto LABEL_96;
          }
          v82 = [v10 contentIdentifier];
          uint64_t v94 = +[NSString stringWithFormat:@"__*.[Diagnostic].3004 OnScreen metric with content identifier %@ is reporting on screen and ready but is still collapsed!", v82];

          id v50 = APLogForCategory();
          id v49 = (void *)v94;
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v106 = v94;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }
          uint64_t v51 = 3004;
        }
        uint64_t v95 = v51;

        goto LABEL_79;
      }
      v52 = [v11 privateContent];
      unsigned int v53 = [v52 isPrerollVideo];

      if (((v53 ^ 1 | v89) & 1) == 0)
      {
LABEL_97:
        double v18 = 0;
        goto LABEL_98;
      }
      uint64_t v54 = 3000;
      goto LABEL_61;
    }
  }
  double v20 = APLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    id v21 = [v10 contentIdentifier];
    *(_DWORD *)buf = 138543362;
    uint64_t v106 = (uint64_t)v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Missing required parameters to handle on screen for content identifier %{public}@!", buf, 0xCu);
  }
  v22 = 0;
LABEL_104:

  return v22;
}

- (id)handleInterfaceExceededContainer:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = self;
  objc_sync_enter(v14);
  if (([v11 shouldSendAdSpaceStatusEvent:3005] & 1) != 0
    || ([v11 transientContent],
        id v15 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v16 = [v15 hasBeenOnScreen],
        v15,
        (v16 & 1) == 0))
  {
    [v11 appearedOnScreenWithStatus:3005];
    uint64_t v17 = [[APAdSpaceEventRequester alloc] initWithMetric:v10 internalContent:v11 andContext:v12 idAccount:v13];
    [(APAdSpaceEventRequester *)v17 setStatusCode:3005];
  }
  else
  {
    uint64_t v17 = 0;
  }
  objc_sync_exit(v14);

  return v17;
}

- (id)handleInterfaceReplaced:(id)a3 metricEnvironment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = metricPropertyValue(v6, (void *)0x14);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_25:
    id v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v42 = [v6 contentIdentifier];
      *(_DWORD *)buf = 138543362;
      CFStringRef v60 = v42;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "InterfaceReplaced metric sent for content %{public}@ with no placeholder. Ignoring.", buf, 0xCu);
    }
    goto LABEL_27;
  }
  id v9 = metricPropertyValue(v6, (void *)0x14);

  if (!v9) {
    goto LABEL_25;
  }
  id v10 = APLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v7 internalContent];
    id v12 = [v11 content];
    id v13 = [v12 identifier];
    *(_DWORD *)buf = 138543618;
    CFStringRef v60 = v9;
    __int16 v61 = 2114;
    id v62 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Replacing %{public}@ with %{public}@", buf, 0x16u);
  }
  id v14 = [v7 findInternalContentDataById:v9];
  [v14 interfaceReplaced];
  id v15 = [v7 internalContent];
  unsigned __int8 v16 = [v15 privateContent];
  unsigned int v17 = [v16 isPrerollVideo];

  if (v17)
  {
    id v49 = v14;
    id v50 = v9;
    id v51 = v6;
    [(APMetricsLegacyInterface *)self pendingRequestsForContent:v9 filterPredicate:&stru_100235940];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v18 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v53 = *(void *)v55;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v55 != v53) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          v22 = APLogForCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            double v23 = [v7 internalContent];
            id v24 = [v23 content];
            int v25 = [v24 identifier];
            uint64_t v26 = [v7 internalContent];
            int v27 = [v26 content];
            id v28 = [v27 serverUnfilledReason];
            *(_DWORD *)buf = 138543618;
            CFStringRef v60 = v25;
            __int16 v61 = 2048;
            id v62 = v28;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Content %{public}@: has unfilled reason code %ld", buf, 0x16u);
          }
          [v21 cancelDelayedRequest];
          id v29 = [v7 internalContent];
          uint64_t v30 = [v29 content];
          if ((uint64_t)[v30 serverUnfilledReason] <= 200)
          {
          }
          else
          {
            long long v31 = [v29 content];
            uint64_t v32 = (uint64_t)[v31 serverUnfilledReason];

            if (v32 <= 205)
            {
              long long v33 = APLogForCategory();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                long long v34 = [v7 internalContent];
                id v35 = [v34 content];
                id v36 = [v35 identifier];
                __int16 v37 = [v7 internalContent];
                uint64_t v38 = [v37 content];
                id v39 = [v38 serverUnfilledReason];
                *(_DWORD *)buf = 138543618;
                CFStringRef v60 = v36;
                __int16 v61 = 2048;
                id v62 = v39;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Content %{public}@: has unfilled reason code %ld. Sending an ASE with the unfilled reason code.", buf, 0x16u);
              }
              uint64_t v40 = [v29 content];
              uint64_t v41 = +[APLegacyTypeTranslator AdDataUnfilledReasonCodeToASECode:](APLegacyTypeTranslator, "AdDataUnfilledReasonCodeToASECode:", [v40 serverUnfilledReason]);

              if ([v29 shouldSendAdSpaceStatusEvent:v41])
              {
                [v29 appearedOnScreenWithStatus:v41];
                double v44 = [APAdSpaceEventRequester alloc];
                double v45 = [v7 context];
                unsigned int v46 = [v7 idAccount];
                uint64_t v47 = v44;
                id v6 = v51;
                int v48 = [(APAdSpaceEventRequester *)v47 initWithMetric:v51 internalContent:v29 andContext:v45 idAccount:v46];

                [(APAdSpaceEventRequester *)v48 setStatusCode:v41];
                id v9 = v50;
                goto LABEL_28;
              }
            }
          }
        }
        id v19 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v19);
    }

    id v9 = v50;
    id v6 = v51;
    id v14 = v49;
  }

LABEL_27:
  int v48 = 0;
LABEL_28:

  return v48;
}

- (id)handleInterfaceVisible:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  unsigned int v17 = metricPropertyValue(v12, (void *)5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  id v18 = metricPropertyValue(v12, (void *)5);
  unsigned __int8 v19 = [v18 BOOLValue];

  if (v19)
  {
LABEL_6:
    double v23 = APLogForCategory();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      int v27 = 0;
      goto LABEL_10;
    }
    id v24 = [v13 content];
    int v25 = [v24 identifier];
    *(_DWORD *)buf = 138543362;
    CFStringRef v64 = v25;
    uint64_t v26 = "Content %{public}@ reporting visible but is collapsed.";
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, v26, buf, 0xCu);

    goto LABEL_9;
  }
  double v20 = metricPropertyValue(v12, (void *)0x12);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = metricPropertyValue(v12, (void *)0x12);
    int v22 = [v21 intValue];
    uint64_t v60 = v22;
  }
  else
  {
    uint64_t v60 = 0;
    int v22 = 0;
  }

  id v29 = metricPropertyValue(v12, (void *)8);
  objc_opt_class();
  double v30 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    long long v31 = metricPropertyValue(v12, (void *)8);
    [v31 doubleValue];
    double v30 = v32;
  }
  if (v22 >= 100) {
    [v13 wasFullyVisible];
  }
  int v62 = v22;
  double v33 = v30 / 1000.0;
  long long v34 = [v13 privateContent:v60];
  unsigned int v35 = [v34 isCarouselAd];

  if (v35)
  {
    id v36 = metricPropertyValue(v12, (void *)0xB);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      metricPropertyValue(v12, (void *)0xB);
      __int16 v37 = (APTimeSpentStoreDatabase *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __int16 v37 = 0;
    }

    double v43 = metricPropertyValue(v12, (void *)0xA);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v42 = metricPropertyValue(v12, (void *)0xA);
    }
    else
    {
      id v42 = 0;
    }

    [v13 carouselVisibleStateChanged:v61 duration:v37 elements:v42 partialElements:v33];
    goto LABEL_28;
  }
  [v13 visibleStateChanged:v61 duration:v33];
  uint64_t v38 = [v13 privateContent];
  unsigned int v39 = [v38 isSponsorshipAd];

  if (v39)
  {
    uint64_t v40 = [APTimeSpentStoreDatabase alloc];
    uint64_t v41 = [(APMetricsLegacyInterface *)self databaseManager];
    __int16 v37 = [(APTimeSpentStoreDatabase *)v40 initWithDatabase:v41];

    id v42 = [v12 contentIdentifier];
    [(APTimeSpentStoreDatabase *)v37 storeEntryForContentId:v42];
LABEL_28:
  }
  double v44 = [v13 privateContent];
  unsigned int v45 = [v44 isVideo];

  if (v45 && v62 == 50)
  {
    unsigned int v46 = metricPropertyValue(v12, (void *)0x1E);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v47 = metricPropertyValue(v12, (void *)0x1E);
    }
    else
    {
      uint64_t v47 = 0;
    }

    int v48 = [[APLogVideoAnalyticsEventRequester alloc] initWithMetric:v12 internalContent:v13 andContext:v14 clientInfo:v15 idAccount:v16];
    id v49 = [v13 transientContent];
    unsigned int v50 = [v49 wasFullyVisible];

    double v51 = 0.51;
    if (v50) {
      double v51 = 1.0;
    }
    [(APLogVideoAnalyticsEventRequester *)v48 setVideoVisibility:v51];
    [v47 timeIntervalSince1970];
    -[APLogVideoAnalyticsEventRequester setVisibilityTimestamp:](v48, "setVisibilityTimestamp:");
    [(APMetricsLegacyInterface *)self sendLegacyMetric:v48];
    v52 = [[APLogVideoAnalyticsEventRequester alloc] initWithMetric:v12 internalContent:v13 andContext:v14 clientInfo:v15 idAccount:v16];
    [(APLogVideoAnalyticsEventRequester *)v52 setVideoVisibility:0.49];
    uint64_t v53 = [v47 dateByAddingTimeInterval:v33];
    [v53 timeIntervalSince1970];
    -[APLogVideoAnalyticsEventRequester setVisibilityTimestamp:](v52, "setVisibilityTimestamp:");
    [(APMetricsLegacyInterface *)self sendLegacyMetric:v52];
  }
  long long v54 = [v13 transientContent];
  unsigned int v55 = [v54 playbackInProgress];

  if (v55)
  {
    double v23 = APLogForCategory();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    id v24 = [v13 content];
    int v25 = [v24 identifier];
    *(_DWORD *)buf = 138543362;
    CFStringRef v64 = v25;
    uint64_t v26 = "Ignoring impression request for %{public}@: playback is in progress.";
    goto LABEL_8;
  }
  if (v62 >= 50)
  {
    long long v56 = [(APMetricsLegacyInterface *)self _confirmed50PercentImpressionRequest:v12 internalContent:v13 context:v14 clientInfo:v15 idAccount:v16 forClickInteraction:0];
    if (v56)
    {
      long long v57 = APLogForCategory();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        CFStringRef v58 = [v13 content];
        unsigned int v59 = [v58 identifier];
        *(_DWORD *)buf = 138543362;
        CFStringRef v64 = v59;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "Sending 50%% impression request for %{public}@", buf, 0xCu);
      }
      [(APMetricsLegacyInterface *)self sendLegacyMetric:v56];
    }
  }
  int v27 = [(APMetricsLegacyInterface *)self _confirmedImpressionRequest:v12 internalContent:v13 context:v14 clientInfo:v15 idAccount:v16 forClickInteraction:0];
LABEL_10:

  return v27;
}

- (id)handleInterfaceOffScreen:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  unsigned int v17 = [v13 privateContent];
  unsigned int v18 = [v17 isCarouselAd];

  if (v18)
  {
    unsigned __int8 v19 = [v13 transientContent];
    if ([v19 hasConfirmedImpression])
    {
      double v20 = [v13 transientContent];
      unsigned __int8 v21 = [v20 carouselFinishedSent];

      if ((v21 & 1) == 0)
      {
        int v22 = [v13 transientContent];
        [v22 carouselVisibleTime];
        double v24 = v23;

        double v25 = floor(v24 * 10.0 + 0.5) / 10.0;
        if (v25 <= 30.0) {
          double v26 = v25;
        }
        else {
          double v26 = 30.0;
        }
        int v27 = [(APLegacyMetricRequester *)[APLogSysEventRequester alloc] initWithMetric:v12 internalContent:v13 andContext:v14 clientInfo:v15 idAccount:v16];
        [(APLogSysEventRequester *)v27 setEventType:908];
        id v28 = [(APLegacyMetricRequester *)v27 logMetadata];
        [v28 setTimeSinceAppResume:v26];

        id v29 = [v13 transientContent];
        uint64_t v60 = [v29 carouselElementsVisible];

        if (!v60)
        {
          double v30 = APLogForCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            long long v31 = [v13 content];
            double v32 = [v31 identifier];
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v32;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "carouselElementsVisible is nil for content %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
        double v33 = [v13 transientContent];
        unsigned int v59 = [v33 carouselElementsPartiallyVisible];

        if (!v59)
        {
          long long v34 = APLogForCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            unsigned int v35 = [v13 content];
            id v36 = [v35 identifier];
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v36;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "carouselElementsPartiallyVisible is nil for content %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v68 = 0x3032000000;
        v69 = sub_1000C54EC;
        unsigned int v70 = sub_1000C54FC;
        id v71 = objc_alloc_init((Class)NSMutableData);
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472;
        v64[2] = sub_1000C9D88;
        v64[3] = &unk_100235968;
        v64[4] = &buf;
        long long v57 = objc_retainBlock(v64);
        if (v60)
        {
          [v60 enumerateObjectsUsingBlock:v57];
          id v37 = [*(id *)(*((void *)&buf + 1) + 40) copy];
          uint64_t v38 = [(APLegacyMetricRequester *)v27 logMetadata];
          [v38 setTiltStationBlob:v37];

          unsigned int v39 = [(APLegacyMetricRequester *)v27 logMetadata];
          uint64_t v40 = [v39 tiltStationBlob];
          LODWORD(v38) = v40 == 0;

          if (v38)
          {
            uint64_t v41 = APLogForCategory();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              id v42 = [v13 content];
              double v43 = [v42 identifier];
              *(_DWORD *)CFStringRef v65 = 138543362;
              CFStringRef v66 = v43;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "tiltStationBlob is nil for content %{public}@", v65, 0xCu);
            }
          }
        }
        id v44 = objc_alloc_init((Class)NSMutableData);
        unsigned int v45 = *(void **)(*((void *)&buf + 1) + 40);
        *(void *)(*((void *)&buf + 1) + 40) = v44;

        if (v59)
        {
          [v59 enumerateObjectsUsingBlock:v57];
          unsigned int v46 = [(APLegacyMetricRequester *)v27 logMetadata];
          id v47 = [*(id *)(*((void *)&buf + 1) + 40) copy];
          [v46 addTiltTrackBlob:v47];

          int v48 = [(APLegacyMetricRequester *)v27 logMetadata];
          id v49 = [v48 tiltTrackBlobs];
          LODWORD(v47) = v49 == 0;

          if (v47)
          {
            unsigned int v50 = APLogForCategory();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              double v51 = [v13 content];
              v52 = [v51 identifier];
              *(_DWORD *)CFStringRef v65 = 138543362;
              CFStringRef v66 = v52;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "tiltTrackBlobs is nil for content after checking partially visible cells %{public}@", v65, 0xCu);
            }
          }
        }
        double v53 = 30.0;
        if (+[APSystemInternal isAppleInternalInstall])
        {
          long long v54 = +[NSProcessInfo processInfo];
          unsigned int v55 = [v54 isRunningTests];

          if (v55) {
            double v53 = 1.0;
          }
          else {
            double v53 = 30.0;
          }
        }
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_1000C9DD4;
        v61[3] = &unk_100235990;
        id v62 = v13;
        double v63 = v53;
        [(APMetricsLegacyInterface *)self sendLegacyMetricWithDelay:v27 legacyMetric:v61 requestSentHandler:v53];

        _Block_object_dispose(&buf, 8);
      }
    }
    else
    {
    }
  }

  return 0;
}

- (id)_unconfirmedImpressionRequest:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(APLegacyMetricRequester *)[APLogImpressionRequester alloc] initWithMetric:v15 internalContent:v14 andContext:v13 clientInfo:v12 idAccount:v11];

  [(APLogImpressionRequester *)v16 setType:1];

  return v16;
}

- (id)_confirmedImpressionRequest:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7 forClickInteraction:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if ([v14 canSendImpression:v8])
  {
    [v14 confirmImpression];
    unsigned int v18 = [(APLegacyMetricRequester *)[APLogImpressionRequester alloc] initWithMetric:v13 internalContent:v14 andContext:v15 clientInfo:v16 idAccount:v17];
    [(APLogImpressionRequester *)v18 setType:2];
  }
  else
  {
    unsigned int v18 = 0;
  }

  return v18;
}

- (id)_confirmed50PercentImpressionRequest:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7 forClickInteraction:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if ([v14 canSend50PercentImpression:v8])
  {
    [v14 confirm50PercentImpression];
    unsigned int v18 = [(APLegacyMetricRequester *)[APLogImpressionRequester alloc] initWithMetric:v13 internalContent:v14 andContext:v15 clientInfo:v16 idAccount:v17];
    [(APLogImpressionRequester *)v18 setType:3];
  }
  else
  {
    unsigned int v18 = 0;
  }

  return v18;
}

- (id)handleLoadFailed:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = metricPropertyValue(v9, (void *)0x32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v16 = 0;
    goto LABEL_6;
  }
  id v14 = metricPropertyValue(v9, (void *)0x32);
  unsigned int v15 = [v14 BOOLValue];

  if (v15 && [v10 shouldSendAdSpaceStatusEvent:8])
  {
    [v10 loadFailed];
    id v16 = [[APAdSpaceEventRequester alloc] initWithMetric:v9 internalContent:v10 andContext:v11 idAccount:v12];
    id v13 = [v10 transientContent];
    -[APAdSpaceEventRequester setStatusCode:](v16, "setStatusCode:", [v13 lastStatusCode]);
LABEL_6:

    goto LABEL_8;
  }
  id v16 = 0;
LABEL_8:

  return v16;
}

- (id)handleVideoMetric:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a6;
  id v17 = [v13 privateContent];
  if ([(APAdSpaceEventRequester *)v17 isPrerollVideo])
  {
    if ([v12 metric] == (id)1600)
    {
    }
    else
    {
      id v18 = [v12 metric];

      if (v18 != (id)2503) {
        goto LABEL_11;
      }
    }
    if ([v12 metric] == (id)1600) {
      uint64_t v19 = 3000;
    }
    else {
      uint64_t v19 = 3013;
    }
    if (![v13 shouldSendAdSpaceStatusEvent:v19]) {
      goto LABEL_11;
    }
    id v17 = [[APAdSpaceEventRequester alloc] initWithMetric:v12 internalContent:v13 andContext:v14 idAccount:v15];
    [(APAdSpaceEventRequester *)v17 setStatusCode:v19];
    [(APMetricsLegacyInterface *)self sendLegacyMetric:v17];
  }

LABEL_11:
  double v20 = [[APLogVideoAnalyticsEventRequester alloc] initWithMetric:v12 internalContent:v13 andContext:v14 clientInfo:v16 idAccount:v15];

  return v20;
}

- (id)handlePrivacyAdMetric:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(APLegacyMetricRequester *)[APLogSysEventRequester alloc] initWithMetric:v15 internalContent:v14 andContext:v13 clientInfo:v12 idAccount:v11];

  [(APLogSysEventRequester *)v16 setEventType:900];

  return v16;
}

- (id)handleValidationFailed:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [APServerErrorRequester alloc];
  id v15 = [v11 content];
  id v16 = [v15 error];
  id v17 = [(APServerErrorRequester *)v14 initWithMetric:v10 internalContent:v11 context:v12 idAccount:v13 error:v16];

  [(APMetricsLegacyInterface *)self sendLegacyMetric:v17];
  if ([v11 shouldSendAdSpaceStatusEvent:9])
  {
    id v18 = [[APAdSpaceEventRequester alloc] initWithMetric:v10 internalContent:v11 andContext:v12 idAccount:v13];
    [(APAdSpaceEventRequester *)v18 setStatusCode:9];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (id)handleDaemonRequestFailed:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = metricPropertyValue(v10, (void *)4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v17 = -1;
LABEL_6:
    double v23 = APLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v25 = 134217984;
      uint64_t v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Unexpected APJourneyMetricRequestFailedReasonCode: %ld", (uint8_t *)&v25, 0xCu);
    }

    goto LABEL_9;
  }
  id v15 = metricPropertyValue(v10, (void *)4);
  signed int v16 = [v15 intValue];

  if (v16 != 3300)
  {
    uint64_t v17 = v16;
    if ((unint64_t)(v16 - 3303) > 0xFFFFFFFFFFFFFFFDLL)
    {
      id v18 = [APServerErrorRequester alloc];
      uint64_t v19 = [v11 content];
      double v20 = [v19 error];
      unsigned __int8 v21 = [(APServerErrorRequester *)v18 initWithMetric:v10 internalContent:v11 context:v12 idAccount:v13 error:v20];

      [(APMetricsLegacyInterface *)self sendLegacyMetric:v21];
      int v22 = [[APAdSpaceEventRequester alloc] initWithMetric:v10 internalContent:v11 andContext:v12 idAccount:v13];
      [(APAdSpaceEventRequester *)v22 setStatusCode:1];

      goto LABEL_10;
    }
    goto LABEL_6;
  }
LABEL_9:
  int v22 = 0;
LABEL_10:

  return v22;
}

- (id)handleArticleLoadFailure:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v10 shouldSendAdSpaceStatusEvent:3012])
  {
    id v13 = [[APAdSpaceEventRequester alloc] initWithMetric:v9 internalContent:v10 andContext:v11 idAccount:v12];
    [(APAdSpaceEventRequester *)v13 setStatusCode:3012];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)handleMediaComplete:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [v12 internalProperties];
  id v18 = [v17 objectForKeyedSubscript:@"type"];

  uint64_t v19 = [v13 privateContent];
  unsigned int v20 = [v19 isVideo];

  if (v20)
  {
    unsigned __int8 v21 = [[APLogVideoAnalyticsEventRequester alloc] initWithMetric:v12 internalContent:v13 andContext:v14 clientInfo:v15 idAccount:v16];
    goto LABEL_8;
  }
  if ([v18 intValue] == 7)
  {
    int v22 = +[APConfigurationMediator configurationForClass:objc_opt_class() usingCache:1];
    double v23 = [v22 sendTimeSpentMetric];
    unsigned int v24 = [v23 BOOLValue];

    if (v24)
    {
      double v33 = [APTimeSpentEventRequester alloc];
      unsigned int v39 = [v12 bundleIdentifier];
      uint64_t v38 = [v12 contentIdentifier];
      id v37 = [v12 contextIdentifier];
      unsigned int v35 = [v13 privateContent];
      id v36 = [v35 adResponseIdentifier];
      long long v34 = [v13 privateContent];
      long long v31 = [v34 batchResponseID];
      double v32 = [v13 privateContent];
      double v30 = [v32 impressionIdentifier];
      int v25 = [v13 transientContent];
      [v25 timeSpent];
      double v27 = v26;
      id v28 = [(APMetricsLegacyInterface *)self databaseManager];
      unsigned __int8 v21 = [(APTimeSpentEventRequester *)v33 initWithBundleID:v39 idAccount:v16 contentId:v38 contextId:v37 adDataResponseIdentifier:v36 batchId:v31 impressionIdentifierData:v27 timeSpent:v30 databaseManager:v28];

      goto LABEL_8;
    }
  }
  unsigned __int8 v21 = 0;
LABEL_8:

  return v21;
}

- (id)handleSubscription:(id)a3
{
  id v3 = a3;
  id v4 = [APLogSubscriptionEventRequester alloc];
  v5 = [v3 bundleIdentifier];
  id v6 = [(APLogSubscriptionEventRequester *)v4 initWithMetric:v3 bundleID:v5];

  return v6;
}

- (BOOL)handleExpandedPlaceholderWithUnfilledReason:(int)a3 metric:(id)a4 internalContent:(id)a5 context:(id)a6 idAccount:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [v12 internalProperties];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"type"];

  BOOL v18 = 0;
  if (a3 == 3001 && v17)
  {
    if ([v17 intValue] == 3)
    {
      uint64_t v19 = [v13 transientContent];
      unsigned int v20 = [v19 hasBeenOnScreen];

      if (v20)
      {
        unsigned __int8 v21 = APLogForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v22 = [v13 content];
          double v23 = [v22 identifier];
          int v26 = 138543362;
          double v27 = v23;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Not queuing delayed AdNotAvailable ASE for content %{public}@, it has previously been on screen.", (uint8_t *)&v26, 0xCu);
        }
      }
      else
      {
        [v13 appearedOnScreenWithStatus:3001];
        unsigned int v24 = [[APAdSpaceEventRequester alloc] initWithMetric:v12 internalContent:v13 andContext:v14 idAccount:v15];
        [(APAdSpaceEventRequester *)v24 setStatusCode:3001];
        [(APMetricsLegacyInterface *)self sendLegacyMetricWithDelay:v24 legacyMetric:&stru_1002359D0 requestSentHandler:2.0];
      }
      BOOL v18 = 1;
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (NSMutableDictionary)pendingDelayedRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (APUnfairRecursiveLock)delayedRequestLock
{
  return (APUnfairRecursiveLock *)objc_getProperty(self, a2, 16, 1);
}

- (APUnfairRecursiveLock)confirmedClickLock
{
  return (APUnfairRecursiveLock *)objc_getProperty(self, a2, 24, 1);
}

- (APLegacyMetricRetryManagerProtocol)metricRetryManager
{
  return (APLegacyMetricRetryManagerProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (NSSet)bundleIdentifierAllowList
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (NSSet)ignoredClientIdentifierSuffixes
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (NSSet)ignoredClientIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (APDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_ignoredClientIdentifiers, 0);
  objc_storeStrong((id *)&self->_ignoredClientIdentifierSuffixes, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierAllowList, 0);
  objc_storeStrong((id *)&self->_metricRetryManager, 0);
  objc_storeStrong((id *)&self->_confirmedClickLock, 0);
  objc_storeStrong((id *)&self->_delayedRequestLock, 0);

  objc_storeStrong((id *)&self->_pendingDelayedRequests, 0);
}

@end