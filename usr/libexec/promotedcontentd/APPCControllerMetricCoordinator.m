@interface APPCControllerMetricCoordinator
+ (void)startWithLegacyInterface:(id)a3;
+ (void)stop;
- (APMetricClientConnection)clientConnection;
- (APMetricsLegacyInterface)legacyMetrics;
- (APPCControllerMetricCoordinator)initWithTokens:(id)a3 legacyInterface:(id)a4;
- (BOOL)_processContentIdOverrideIfNecessaryForMetric:(id)a3;
- (NSArray)registrationTokens;
- (NSString)host;
- (id)_loadOverrideContextForMetric:(id)a3;
- (id)_provideEnvironmentForMetric:(id)a3;
- (void)_setRateLimit:(id)a3;
- (void)handleMetricForTesting:(id)a3;
- (void)internalMetricReceived:(id)a3;
- (void)internalSignalReceived:(id)a3;
- (void)metricReceived:(id)a3;
- (void)processInternalMetric:(id)a3;
- (void)processMetric:(id)a3;
- (void)setClientConnection:(id)a3;
- (void)setHost:(id)a3;
- (void)setLegacyMetrics:(id)a3;
- (void)setRegistrationTokens:(id)a3;
@end

@implementation APPCControllerMetricCoordinator

+ (void)startWithLegacyInterface:(id)a3
{
  id v3 = a3;
  v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting APPCMetricCoordinator interface handler", buf, 2u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100187944;
  v18[3] = &unk_100238D68;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v19 = v5;
  v6 = objc_retainBlock(v18);
  ((void (*)(void *, uint64_t, Block_layout *))v6[2])(v6, 100, &stru_100238D88);
  ((void (*)(void *, uint64_t, Block_layout *))v6[2])(v6, -1, &stru_100238DA8);
  ((void (*)(void *, uint64_t, Block_layout *))v6[2])(v6, 101, &stru_100238DC8);
  ((void (*)(void *, uint64_t, Block_layout *))v6[2])(v6, -104, &stru_100238DE8);
  if (+[APSystemInternal isAppleInternalInstall])
  {
    id v7 = objc_alloc((Class)NSUserDefaults);
    id v8 = [v7 initWithSuiteName:APDefaultsBundleID];
    v9 = [v8 objectForKey:@"APMetricListener.enableConnection"];
    if (v9)
    {
      ((void (*)(void *, uint64_t, Block_layout *))v6[2])(v6, 100, &stru_100238E28);
      ((void (*)(void *, uint64_t, Block_layout *))v6[2])(v6, 1234, &stru_100238E48);
      dispatch_queue_t v10 = dispatch_queue_create("com.apple.ap.promotedcontent.metrics.clientConnection", 0);
      v11 = (void *)qword_10028D270;
      qword_10028D270 = (uint64_t)v10;
    }
  }
  v12 = [APPCControllerMetricCoordinator alloc];
  v13 = +[NSArray arrayWithArray:v5];
  v14 = [(APPCControllerMetricCoordinator *)v12 initWithTokens:v13 legacyInterface:v3];

  v15 = (void *)qword_10028D260;
  qword_10028D260 = (uint64_t)v14;

  dispatch_queue_t v16 = dispatch_queue_create("com.apple.ap.promotedcontent.legacyinterface.metrics", 0);
  v17 = (void *)qword_10028D268;
  qword_10028D268 = (uint64_t)v16;
}

+ (void)stop
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [qword_10028D260 registrationTokens];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v6);
        id v8 = +[MetricsModule storage];
        v9 = [v8 notificationRegistrar];
        [v9 removeHandlerWithIdentifier:[v7 integerValue]];

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  dispatch_queue_t v10 = (void *)qword_10028D260;
  qword_10028D260 = 0;

  v11 = (void *)qword_10028D268;
  qword_10028D268 = 0;
}

- (APPCControllerMetricCoordinator)initWithTokens:(id)a3 legacyInterface:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)APPCControllerMetricCoordinator;
  v9 = [(APPCControllerMetricCoordinator *)&v12 init];
  dispatch_queue_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_registrationTokens, a3);
    objc_storeStrong((id *)&v10->_legacyMetrics, a4);
  }

  return v10;
}

- (void)internalMetricReceived:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)os_transaction_create();
  v6 = qword_10028D268;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100187D20;
  block[3] = &unk_100236608;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)metricReceived:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)os_transaction_create();
  v6 = qword_10028D268;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100187DF8;
  block[3] = &unk_100236608;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)internalSignalReceived:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)os_transaction_create();
  v6 = qword_10028D268;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100187ED0;
  block[3] = &unk_100236608;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)handleMetricForTesting:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)os_transaction_create();
  v6 = [(APPCControllerMetricCoordinator *)self host];

  if (!v6)
  {
    id v7 = objc_alloc((Class)NSUserDefaults);
    id v8 = [v7 initWithSuiteName:APDefaultsBundleID];
    v9 = [v8 objectForKey:@"APMetricListener.enableConnection"];
    [(APPCControllerMetricCoordinator *)self setHost:v9];
  }
  id v10 = [(APPCControllerMetricCoordinator *)self host];
  id v11 = [v10 componentsSeparatedByString:@":"];

  if ((unint64_t)[v11 count] > 1)
  {
    long long v13 = qword_10028D270;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001880A8;
    v14[3] = &unk_100238E70;
    v14[4] = self;
    id v15 = v11;
    id v16 = v4;
    id v17 = v5;
    dispatch_async(v13, v14);
  }
  else
  {
    objc_super v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error extracting host and port. The format should be host:port", buf, 2u);
    }
  }
}

- (void)processInternalMetric:(id)a3
{
  id v4 = a3;
  if ([v4 metric] == (id)77000) {
    [(APPCControllerMetricCoordinator *)self _setRateLimit:v4];
  }
  uint64_t v5 = [(APPCControllerMetricCoordinator *)self legacyMetrics];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001883A4;
  v7[3] = &unk_100238E98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 processMetric:v6 environmentProvider:v7];
}

- (id)_provideEnvironmentForMetric:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 internalProperties];
  id v6 = [v5 objectForKeyedSubscript:kAPMetricClientInfoKey];

  if (v6) {
    id v7 = v6;
  }
  id v8 = [v4 contextIdentifier];

  if (v8
    && ([v4 contextIdentifier],
        v9 = objc_claimAutoreleasedReturnValue(),
        +[APManagedContext findManagedContextByFingerprint:v9], id v10 = objc_claimAutoreleasedReturnValue(), v9, v10))
  {
    id v11 = APLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v12 = [v4 contextIdentifier];
      long long v13 = [v4 contentIdentifier];
      int v40 = 138543618;
      id v41 = v12;
      __int16 v42 = 2114;
      v43 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Successfully retrieved cached context data %{public}@ for content identifier %{public}@.", (uint8_t *)&v40, 0x16u);
    }
    int v14 = 0;
  }
  else
  {
    id v11 = APLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v4 contextIdentifier];
      id v16 = [v4 contentIdentifier];
      int v40 = 138543618;
      id v41 = v15;
      __int16 v42 = 2114;
      v43 = v16;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unable to find context with identifier %{public}@ for content %{public}@. Metric may not contain all required fields.", (uint8_t *)&v40, 0x16u);
    }
    id v10 = 0;
    int v14 = 1;
  }

  id v17 = [v10 idAccount];
  if (!v17)
  {
    id v17 = +[APIDAccountProvider privateUserAccount];
  }
  v18 = [v4 contentIdentifier];
  id v19 = +[APManagedContentData findById:v18];

  if (!v19)
  {
    v20 = [v4 handle];
    id v19 = +[APManagedContentData findById:v20];

    if (!v19)
    {
      if (!-[APPCControllerMetricCoordinator _processContentIdOverrideIfNecessaryForMetric:](self, "_processContentIdOverrideIfNecessaryForMetric:", v4)|| ([v4 contentIdentifier], v31 = objc_claimAutoreleasedReturnValue(), +[APManagedContentData findById:](APManagedContentData, "findById:", v31), id v19 = objc_claimAutoreleasedReturnValue(), v31, !v19))
      {
        v32 = APLogForCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = [v4 contentIdentifier];
          int v40 = 138543362;
          id v41 = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "No managed content found for content identifier %{public}@. Assuming there was no response from server for ad request with that identifier.", (uint8_t *)&v40, 0xCu);
        }
        if (v14)
        {
          APLogForCategory();
          v26 = (APContentDataInternal *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v26->super, OS_LOG_TYPE_ERROR))
          {
            v34 = [v4 contextIdentifier];
            v35 = [v4 contentIdentifier];
            int v40 = 138543618;
            id v41 = v34;
            __int16 v42 = 2114;
            v43 = v35;
            _os_log_impl((void *)&_mh_execute_header, &v26->super, OS_LOG_TYPE_ERROR, "Unable to find managed context %{public}@ for content %{public}@. Cannot continue, metric ignored.", (uint8_t *)&v40, 0x16u);
          }
          v27 = 0;
          goto LABEL_28;
        }
        id v22 = objc_alloc_init((Class)APContentData);
        v36 = [v4 contentIdentifier];
        [v22 setIdentifier:v36];

        id v37 = objc_alloc((Class)NSUUID);
        v38 = [v4 contextIdentifier];
        id v39 = [v37 initWithUUIDString:v38];
        [v22 setContextIdentifier:v39];

        [v22 setServerUnfilledReason:1010];
        v21 = [[APContentDataInternal alloc] initWithContent:v22];
        id v19 = [v10 addContentData:v21];
        goto LABEL_17;
      }
    }
  }
  APLogForCategory();
  v21 = (APContentDataInternal *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v21->super, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [v4 contentIdentifier];
    int v40 = 138543362;
    id v41 = v22;
    _os_log_impl((void *)&_mh_execute_header, &v21->super, OS_LOG_TYPE_DEFAULT, "Successfully retrieved cached content data for identifier %{public}@.", (uint8_t *)&v40, 0xCu);
LABEL_17:
  }
  v23 = [(APPCControllerMetricCoordinator *)self _loadOverrideContextForMetric:v4];
  if (v23)
  {
    v24 = APLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = [v4 contentIdentifier];
      int v40 = 138543362;
      id v41 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Successfully loaded override context for metric %{public}@", (uint8_t *)&v40, 0xCu);
    }
  }
  v26 = [[APContentDataInternal alloc] initWithContentDataProvider:v19];
  v27 = objc_alloc_init(APMetricEnvironment);
  [(APMetricEnvironment *)v27 setInternalContent:v26];
  if (v23)
  {
    [(APMetricEnvironment *)v27 setContext:v23];
  }
  else
  {
    v28 = [v10 context];
    [(APMetricEnvironment *)v27 setContext:v28];
  }
  [(APMetricEnvironment *)v27 setClientInfo:v6];
  [(APMetricEnvironment *)v27 setIdAccount:v17];
  v29 = [(APMetricEnvironment *)v27 idAccount];

  if (!v29) {
    CreateDiagnosticReport();
  }

LABEL_28:

  return v27;
}

- (void)processMetric:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(APPCControllerMetricCoordinator *)self legacyMetrics];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100188AB8;
  v7[3] = &unk_100238E98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 processMetric:v6 environmentProvider:v7];
}

- (void)_setRateLimit:(id)a3
{
  id v4 = a3;
  id v17 = +[APPromotedContentLegacyInterface sharedInstance];
  uint64_t v5 = [v4 properties];

  float v6 = sub_100188AC4((uint64_t)self, kAPMetricInternalMessageInFeedRateKey, v5);
  float v7 = sub_100188AC4((uint64_t)self, kAPMetricInternalMessageInArticleRateKey, v5);
  float v8 = sub_100188AC4((uint64_t)self, kAPMetricInternalMessageBetweenArticleRateKey, v5);
  float v9 = sub_100188AC4((uint64_t)self, kAPMetricInternalMessageVideoInArticleRateKey, v5);
  float v10 = sub_100188AC4((uint64_t)self, kAPMetricInternalMessageNativeInFeedRateKey, v5);
  LODWORD(v11) = sub_100188AC4((uint64_t)self, kAPMetricInternalMessageNativeInArticleRateKey, v5);
  *(float *)&double v12 = v6;
  *(float *)&double v13 = v7;
  *(float *)&double v14 = v8;
  *(float *)&double v15 = v9;
  *(float *)&double v16 = v10;
  [v17 setRateLimitRequestsInFeed:v12 inArticle:v13 betweenArticle:v14 videoInArticle:v15 nativeInFeed:v16 nativeInArticle:v11];
}

- (BOOL)_processContentIdOverrideIfNecessaryForMetric:(id)a3
{
  id v3 = a3;
  id v4 = [v3 internalProperties];
  uint64_t v5 = [v4 objectForKeyedSubscript:kAPOriginalContentIdentifier];

  float v6 = [v3 internalProperties];
  float v7 = [v6 objectForKeyedSubscript:kAPServerUnfilledReason];

  if ([v5 length])
  {
    float v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 138543362;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Processing a special case for originalContentId: %{public}@.", (uint8_t *)&v19, 0xCu);
    }

    float v9 = objc_alloc_init(APSponsorshipAdTransformer);
    float v10 = [v3 contentIdentifier];
    LOBYTE(v11) = [(APSponsorshipAdTransformer *)v9 copyContentDataId:v5 toNewContentDataId:v10];

    if (v11) {
      goto LABEL_9;
    }
    double v12 = APLogForCategory();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

LABEL_9:
      goto LABEL_10;
    }
    LOWORD(v19) = 0;
    double v13 = "Content override was requested but the copy operation has failed.";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v19, 2u);
    goto LABEL_8;
  }
  if (!v7)
  {
    LOBYTE(v11) = 0;
    goto LABEL_10;
  }
  double v15 = [v3 contextIdentifier];
  id v11 = [v15 length];

  if (v11)
  {
    double v16 = APLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 138543362;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Processing a special case for serverUnfilledReason: %{public}@", (uint8_t *)&v19, 0xCu);
    }

    float v9 = objc_alloc_init(APSponsorshipAdTransformer);
    id v17 = [v3 contextIdentifier];
    v18 = [v3 contentIdentifier];
    LOBYTE(v11) = -[APSponsorshipAdTransformer createContentDataForContextId:contentId:withServerUnfilledReason:](v9, "createContentDataForContextId:contentId:withServerUnfilledReason:", v17, v18, (int)[v7 intValue]);

    if (v11) {
      goto LABEL_9;
    }
    double v12 = APLogForCategory();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    LOWORD(v19) = 0;
    double v13 = "Server unfilled reason was requested but the operation has failed.";
    goto LABEL_7;
  }
LABEL_10:

  return (char)v11;
}

- (id)_loadOverrideContextForMetric:(id)a3
{
  id v3 = a3;
  id v4 = [v3 internalProperties];
  uint64_t v5 = [v4 objectForKeyedSubscript:kAPSupplementalContext];

  if (!v5)
  {
    id v12 = 0;
    goto LABEL_11;
  }
  float v6 = [v3 contextIdentifier];
  id v7 = [v6 length];

  if (!v7) {
    goto LABEL_9;
  }
  id v8 = objc_alloc((Class)NSUUID);
  float v9 = [v3 contextIdentifier];
  id v10 = [v8 initWithUUIDString:v9];

  if (!v10)
  {
    double v13 = APLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      double v14 = [v3 contextIdentifier];
      int v17 = 138543362;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Metric context ID has invalid format. %{public}@", (uint8_t *)&v17, 0xCu);
    }
LABEL_9:
    id v15 = objc_alloc((Class)APContext);
    id v10 = +[NSUUID UUID];
    id v11 = v15;
    goto LABEL_10;
  }
  id v11 = objc_alloc((Class)APContext);
LABEL_10:
  id v12 = [v11 initWithIdentifier:v10 maxSize:0 requestedAdIdentifier:0 currentContent:0 adjacentContent:0 supplementalContext:v5];

LABEL_11:

  return v12;
}

- (APMetricsLegacyInterface)legacyMetrics
{
  return (APMetricsLegacyInterface *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLegacyMetrics:(id)a3
{
}

- (NSArray)registrationTokens
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRegistrationTokens:(id)a3
{
}

- (APMetricClientConnection)clientConnection
{
  return (APMetricClientConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClientConnection:(id)a3
{
}

- (NSString)host
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_registrationTokens, 0);

  objc_storeStrong((id *)&self->_legacyMetrics, 0);
}

@end