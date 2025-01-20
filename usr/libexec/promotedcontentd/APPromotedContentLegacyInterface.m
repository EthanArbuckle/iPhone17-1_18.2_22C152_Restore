@interface APPromotedContentLegacyInterface
+ (id)sharedInstance;
- (APPromotedContentLegacyInterface)init;
- (APRateLimits)rateLimits;
- (APUnfairLock)adRequesterLock;
- (APUnfairLock)rateLimitLock;
- (NSMutableDictionary)adRequesters;
- (OS_dispatch_queue)queue;
- (double)rateLimitsLastUpdatedOn;
- (id)_currentRateLimits;
- (id)_loadRateLimitsFromUserDefaults;
- (id)_rateLimitPlacementTypes:(id)a3 context:(id)a4 token:(id)a5 completionHandler:(id)a6;
- (void)_handleAdRequesterResponseForToken:(id)a3 internalContent:(id)a4 completionHandler:(id)a5;
- (void)_loadRateLimitSettings;
- (void)requestPromotedContentOfTypes:(id)a3 forContext:(id)a4 withToken:(id)a5 andBundleID:(id)a6 clientInfo:(id)a7 idAccount:(id)a8 completionHandler:(id)a9;
- (void)requestPromotedContentOfTypesAccumulating:(id)a3 forContext:(id)a4 withToken:(id)a5 andBundleID:(id)a6 clientInfo:(id)a7 idAccount:(id)a8 completionHandler:(id)a9;
- (void)requestPromotedContentOfTypesWithoutAccumulating:(id)a3 forContext:(id)a4 withToken:(id)a5 andBundleID:(id)a6 clientInfo:(id)a7 idAccount:(id)a8 completionHandler:(id)a9;
- (void)setAdRequesterLock:(id)a3;
- (void)setAdRequesters:(id)a3;
- (void)setRateLimitRequestsInFeed:(float)a3 inArticle:(float)a4 betweenArticle:(float)a5 videoInArticle:(float)a6 nativeInFeed:(float)a7 nativeInArticle:(float)a8;
- (void)setRateLimits:(id)a3;
- (void)setRateLimitsLastUpdatedOn:(double)a3;
@end

@implementation APPromotedContentLegacyInterface

+ (id)sharedInstance
{
  if (qword_100289888 != -1) {
    dispatch_once(&qword_100289888, &stru_1002352C8);
  }
  v2 = (void *)qword_100289880;

  return v2;
}

- (APPromotedContentLegacyInterface)init
{
  v8.receiver = self;
  v8.super_class = (Class)APPromotedContentLegacyInterface;
  v2 = [(APPromotedContentLegacyInterface *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ap.pclegacyinterface", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (APUnfairLock *)[objc_alloc((Class)APUnfairLock) initWithOptions:1];
    rateLimitLock = v2->_rateLimitLock;
    v2->_rateLimitLock = v5;

    [(APPromotedContentLegacyInterface *)v2 _loadRateLimitSettings];
  }
  return v2;
}

- (void)requestPromotedContentOfTypes:(id)a3 forContext:(id)a4 withToken:(id)a5 andBundleID:(id)a6 clientInfo:(id)a7 idAccount:(id)a8 completionHandler:(id)a9
{
}

- (void)requestPromotedContentOfTypesWithoutAccumulating:(id)a3 forContext:(id)a4 withToken:(id)a5 andBundleID:(id)a6 clientInfo:(id)a7 idAccount:(id)a8 completionHandler:(id)a9
{
  id v14 = a3;
  id v41 = a4;
  id v42 = a6;
  id v15 = a7;
  id v16 = a8;
  id v40 = a9;
  v17 = APLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = [v41 identifier];
    *(_DWORD *)buf = 136315650;
    v49 = "-[APPromotedContentLegacyInterface requestPromotedContentOfTypesWithoutAccumulating:forContext:withToken:andBu"
          "ndleID:clientInfo:idAccount:completionHandler:]";
    __int16 v50 = 2114;
    v51 = v18;
    __int16 v52 = 2114;
    id v53 = v42;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s: bundleID for context %{public}@ is %{public}@.", buf, 0x20u);
  }
  if ([v14 count])
  {
    v37 = self;
    id v38 = v15;
    v19 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v14 count]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v39 = v14;
    id v20 = v14;
    id v21 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v44;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v44 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v26 = [APAdRequestParameters alloc];
          v27 = +[NSUUID UUID];
          v28 = -[APAdRequestParameters initWithContext:bundleID:identifier:placement:completionHandler:](v26, "initWithContext:bundleID:identifier:placement:completionHandler:", v41, v42, v27, [v25 integerValue], v40);

          [v19 addObject:v28];
        }
        id v22 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v22);
    }

    v29 = [(APPromotedContentLegacyInterface *)v37 adRequesterLock];
    [v29 lock];

    v30 = [(APPromotedContentLegacyInterface *)v37 adRequesters];
    v31 = [v30 objectForKeyedSubscript:v42];

    id v15 = v38;
    if (!v31)
    {
      v32 = [APAdRequester alloc];
      v33 = +[NSUUID UUID];
      v31 = [(APAdRequester *)v32 initWithBundleID:v42 identifier:v33 clientInfo:v38 idAccount:v16 accumulateRequests:0];

      v34 = [(APPromotedContentLegacyInterface *)v37 adRequesters];
      [v34 setObject:v31 forKeyedSubscript:v42];
    }
    v35 = [(APPromotedContentLegacyInterface *)v37 adRequesterLock];
    [v35 unlock];

    id v36 = [v19 copy];
    [(APAdRequester *)v31 requestAds:v36];

    id v14 = v39;
  }
  else
  {
    v19 = APLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Placement types list is empty, nothing to request.", buf, 2u);
    }
  }
}

- (void)requestPromotedContentOfTypesAccumulating:(id)a3 forContext:(id)a4 withToken:(id)a5 andBundleID:(id)a6 clientInfo:(id)a7 idAccount:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v49 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = APLogForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v22 = [v49 identifier];
    *(_DWORD *)buf = 136315650;
    v57 = "-[APPromotedContentLegacyInterface requestPromotedContentOfTypesAccumulating:forContext:withToken:andBundleID:"
          "clientInfo:idAccount:completionHandler:]";
    __int16 v58 = 2114;
    v59 = v22;
    __int16 v60 = 2114;
    id v61 = v17;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s: bundleID for context %{public}@ is %{public}@.", buf, 0x20u);
  }
  if ([v15 count])
  {
    uint64_t v23 = [(APPromotedContentLegacyInterface *)self _rateLimitPlacementTypes:v15 context:v49 token:v16 completionHandler:v20];
    if ([v23 count])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000AD520;
      block[3] = &unk_100233D50;
      block[4] = self;
      v48 = v23;
      if (qword_100289890 != -1) {
        dispatch_once(&qword_100289890, block);
      }
      v24 = [(APPromotedContentLegacyInterface *)self adRequesterLock];
      [v24 lock];

      v25 = [(APPromotedContentLegacyInterface *)self adRequesters];
      v26 = [v25 objectForKeyedSubscript:v17];

      if (!v26)
      {
        if (!v17)
        {
          long long v43 = [(APPromotedContentLegacyInterface *)self adRequesterLock];
          [v43 unlock];

          long long v44 = [v49 identifier];
          id v39 = +[NSString stringWithFormat:@"Request from context %@ is missing the bundle identifier. Cannot create ad requester.", v44];

          APSimulateCrash();
          (*((void (**)(id, void, void))v20 + 2))(v20, 0, 0);
LABEL_18:

          uint64_t v23 = v48;
          goto LABEL_24;
        }
        v27 = [APAdRequester alloc];
        v28 = +[NSUUID UUID];
        v26 = [(APAdRequester *)v27 initWithBundleID:v17 identifier:v28 clientInfo:v18 idAccount:v19 accumulateRequests:1];

        v29 = [(APPromotedContentLegacyInterface *)self adRequesters];
        [v29 setObject:v26 forKeyedSubscript:v17];
      }
      long long v45 = v26;
      id v46 = v18;
      v30 = [(APPromotedContentLegacyInterface *)self adRequesterLock];
      [v30 unlock];

      v31 = +[NSMutableArray array];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v47 = v15;
      id v32 = v15;
      id v33 = [v32 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v51;
        do
        {
          for (i = 0; i != v34; i = (char *)i + 1)
          {
            if (*(void *)v51 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = -[APAdRequestParameters initWithContext:bundleID:identifier:placement:completionHandler:]([APAdRequestParameters alloc], "initWithContext:bundleID:identifier:placement:completionHandler:", v49, v17, v16, [*(id *)(*((void *)&v50 + 1) + 8 * i) unsignedIntValue], v20);
            [v31 addObject:v37];
          }
          id v34 = [v32 countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v34);
      }

      id v38 = [v31 copy];
      id v39 = v45;
      [(APAdRequester *)v45 accumulateAdRequests:v38];

      id v18 = v46;
      id v15 = v47;
      goto LABEL_18;
    }
    id v40 = APLogForCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      [v49 identifier];
      id v41 = v23;
      id v42 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v42;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "All content types filtered out for context %{public}@", buf, 0xCu);

      uint64_t v23 = v41;
    }
  }
  else
  {
    uint64_t v23 = APLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Placement types list is empty, nothing to request.", buf, 2u);
    }
  }
LABEL_24:
}

- (void)_handleAdRequesterResponseForToken:(id)a3 internalContent:(id)a4 completionHandler:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  v9 = (void (**)(id, id))a5;
  v10 = self;
  objc_sync_enter(v10);
  v9[2](v9, v8);
  objc_sync_exit(v10);
}

- (void)setRateLimitRequestsInFeed:(float)a3 inArticle:(float)a4 betweenArticle:(float)a5 videoInArticle:(float)a6 nativeInFeed:(float)a7 nativeInArticle:(float)a8
{
  if (+[APSystemInternal isAppleInternalInstall])
  {
    id v15 = [(APPromotedContentLegacyInterface *)self rateLimitLock];
    [v15 lock];
    [(APPromotedContentLegacyInterface *)self setRateLimits:v21];
    id v16 = +[NSDate now];
    [v16 timeIntervalSince1970];
    -[APPromotedContentLegacyInterface setRateLimitsLastUpdatedOn:](self, "setRateLimitsLastUpdatedOn:");

    [v15 unlock];
  }
  else
  {
    id v17 = [APRateLimits alloc];
    *(float *)&double v18 = a3;
    id v21 = sub_10009851C((id *)&v17->super.isa, v18, a4, a5, a6, a7, a8);
    id v15 = +[NSDate now];
    id v19 = [(APPromotedContentLegacyInterface *)self rateLimitLock];
    [v19 lock];
    id v20 = objc_alloc_init(APRateLimitSettings);
    [(APRateLimitSettings *)v20 setLastUpdated:v15];
    [(APRateLimitSettings *)v20 setRateLimitsObject:v21];
    [v15 timeIntervalSince1970];
    -[APPromotedContentLegacyInterface setRateLimitsLastUpdatedOn:](self, "setRateLimitsLastUpdatedOn:");
    [(APPromotedContentLegacyInterface *)self setRateLimits:v21];
    [v19 unlock];
  }
}

- (id)_loadRateLimitsFromUserDefaults
{
  id v2 = objc_alloc((Class)NSUserDefaults);
  id v3 = [v2 initWithSuiteName:APDefaultsBundleID];
  v4 = [v3 dictionaryForKey:@"RateLimits"];
  if (v4)
  {
    v12[0] = kAPMetricInternalMessageInFeedRateKey;
    v12[1] = kAPMetricInternalMessageInArticleRateKey;
    v13[0] = &off_100249350;
    v13[1] = &off_100249368;
    v12[2] = kAPMetricInternalMessageBetweenArticleRateKey;
    v12[3] = kAPMetricInternalMessageVideoInArticleRateKey;
    v13[2] = &off_100249380;
    v13[3] = &off_100249398;
    v12[4] = kAPMetricInternalMessageNativeInFeedRateKey;
    v12[5] = kAPMetricInternalMessageNativeInArticleRateKey;
    v13[4] = &off_1002493B0;
    v13[5] = &off_1002493C8;
    v5 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:6];
    +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v5 count]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000AD9EC;
    v9[3] = &unk_1002352F0;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v4;
    id v6 = v10;
    [v5 enumerateKeysAndObjectsUsingBlock:v9];
    v7 = sub_1000986E8((id *)[APRateLimits alloc], v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_loadRateLimitSettings
{
  if (+[APSystemInternal isAppleInternalInstall])
  {
    rateLimits = self->_rateLimits;
    self->_rateLimits = v3;
    v5 = v3;

    v13 = +[NSDate now];

    [(APRateLimitSettings *)v13 timeIntervalSince1970];
    self->_rateLimitsLastUpdatedOn = v6;
  }
  else
  {
    v13 = objc_alloc_init(APRateLimitSettings);
    v7 = [(APRateLimitSettings *)v13 lastUpdated];
    if (v7)
    {
      id v8 = +[NSDate now];
      [v8 timeIntervalSinceDate:v7];
      double v10 = v9;

      if (v10 <= 86400.0)
      {
        id v11 = [(APRateLimitSettings *)v13 rateLimitsObject];
        if (v13)
        {
          objc_storeStrong((id *)&self->_rateLimits, v11);
          [v7 timeIntervalSince1970];
          self->_rateLimitsLastUpdatedOn = v12;
        }
      }
      else
      {
        [(APRateLimitSettings *)v13 setLastUpdated:0];
        [(APRateLimitSettings *)v13 setRateLimitsObject:0];
      }
    }
  }
}

- (id)_currentRateLimits
{
  id v3 = +[NSDate now];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  double v6 = [(APPromotedContentLegacyInterface *)self rateLimitLock];
  [v6 lock];
  [(APPromotedContentLegacyInterface *)self rateLimitsLastUpdatedOn];
  double v8 = v7;
  double v9 = [(APPromotedContentLegacyInterface *)self rateLimits];
  if (!v9 || v8 == 0.0)
  {
  }
  else
  {

    if (v5 - v8 > 86400.0)
    {
      double v10 = objc_alloc_init(APRateLimitSettings);
      [(APRateLimitSettings *)v10 setLastUpdated:0];
      [(APRateLimitSettings *)v10 setRateLimitsObject:0];
      [(APPromotedContentLegacyInterface *)self setRateLimits:0];
      [(APPromotedContentLegacyInterface *)self setRateLimitsLastUpdatedOn:0.0];
      id v11 = APLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Rate limit was expired. Setting it to 1.0.", v14, 2u);
      }
    }
  }
  double v12 = [(APPromotedContentLegacyInterface *)self rateLimits];
  [v6 unlock];

  return v12;
}

- (id)_rateLimitPlacementTypes:(id)a3 context:(id)a4 token:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  double v38 = COERCE_DOUBLE(a5);
  id v37 = a6;
  double v12 = [(APPromotedContentLegacyInterface *)self _currentRateLimits];
  if (!v12)
  {
    id v32 = APLogForCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 141558274;
      uint64_t v49 = 1752392040;
      __int16 v50 = 2112;
      double v51 = v38;
      id v33 = "No rate limits set, sending all requests. Token: %{mask.hash}@";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, v33, buf, 0x16u);
    }
LABEL_26:

    id v31 = v10;
    goto LABEL_27;
  }
  id v13 = [v11 adPosition];
  float v14 = sub_100098790(v12, (uint64_t)v13);
  if (v14 >= 1.0)
  {
    id v32 = APLogForCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 141558274;
      uint64_t v49 = 1752392040;
      __int16 v50 = 2112;
      double v51 = v38;
      id v33 = "Rate limit is 1.0, sending all requests. Token: %{mask.hash}@";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  uint64_t v35 = v12;
  if (v14 >= 0.0) {
    float v15 = v14;
  }
  else {
    float v15 = 0.0;
  }
  id v16 = APLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [v10 count];
    double v18 = adPositionToString((unint64_t)v13);
    *(_DWORD *)buf = 134219010;
    uint64_t v49 = (uint64_t)v17;
    __int16 v50 = 2048;
    double v51 = v15;
    __int16 v52 = 2114;
    uint64_t v53 = (uint64_t)v18;
    __int16 v54 = 2160;
    uint64_t v55 = 1752392040;
    __int16 v56 = 2112;
    double v57 = v38;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Rate limiting %lu request(s) using %f rate. Ad position: %{public}@. Token: %{mask.hash}@", buf, 0x34u);
  }
  id v19 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v10 count]];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v36 = v10;
  id v20 = v10;
  id v21 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v44;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        if (arc4random_uniform(0x3E8u) >= (float)(v15 * 1000.0))
        {
          v26 = [(APPromotedContentLegacyInterface *)self queue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000AE214;
          block[3] = &unk_100235318;
          block[4] = v25;
          id v40 = v11;
          id v41 = *(id *)&v38;
          id v42 = v37;
          dispatch_async(v26, block);
        }
        else
        {
          [v19 addObject:v25];
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v22);
  }

  v27 = APLogForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = [v20 count];
    uint64_t v29 = v28 - (unsigned char *)[v19 count];
    double v30 = COERCE_DOUBLE([v19 count]);
    *(_DWORD *)buf = 134218754;
    uint64_t v49 = v29;
    __int16 v50 = 2048;
    double v51 = v30;
    __int16 v52 = 2160;
    uint64_t v53 = 1752392040;
    __int16 v54 = 2112;
    uint64_t v55 = *(void *)&v38;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Rate limited: %ld request(s). Going to send: %ld request(s). Token: %{mask.hash}@", buf, 0x2Au);
  }

  id v31 = [v19 copy];
  id v10 = v36;
  double v12 = v35;
LABEL_27:

  return v31;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (APUnfairLock)rateLimitLock
{
  return self->_rateLimitLock;
}

- (APRateLimits)rateLimits
{
  return self->_rateLimits;
}

- (void)setRateLimits:(id)a3
{
}

- (double)rateLimitsLastUpdatedOn
{
  return self->_rateLimitsLastUpdatedOn;
}

- (void)setRateLimitsLastUpdatedOn:(double)a3
{
  self->_rateLimitsLastUpdatedOn = a3;
}

- (NSMutableDictionary)adRequesters
{
  return self->_adRequesters;
}

- (void)setAdRequesters:(id)a3
{
}

- (APUnfairLock)adRequesterLock
{
  return self->_adRequesterLock;
}

- (void)setAdRequesterLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adRequesterLock, 0);
  objc_storeStrong((id *)&self->_adRequesters, 0);
  objc_storeStrong((id *)&self->_rateLimits, 0);
  objc_storeStrong((id *)&self->_rateLimitLock, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end