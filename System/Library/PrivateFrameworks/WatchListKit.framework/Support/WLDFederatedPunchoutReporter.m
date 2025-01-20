@interface WLDFederatedPunchoutReporter
+ (id)sharedFederatedPunchoutReporter;
- (NSMutableDictionary)ledger;
- (NSOperationQueue)queue;
- (OS_dispatch_source)timer;
- (WLDFederatedPunchoutReporter)init;
- (id)_metadataForEventWithPunchout:(id)a3 playbackSummary:(id)a4;
- (void)_configureTimerWithDate:(id)a3;
- (void)_reportPunchoutEvent:(id)a3 withPlaybackSummary:(id)a4;
- (void)recordPlaybackSummary:(id)a3;
- (void)recordPunchout:(id)a3;
- (void)setLedger:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation WLDFederatedPunchoutReporter

+ (id)sharedFederatedPunchoutReporter
{
  if (sharedFederatedPunchoutReporter_token != -1) {
    dispatch_once(&sharedFederatedPunchoutReporter_token, &__block_literal_global_1);
  }
  v2 = (void *)sharedFederatedPunchoutReporter_sharedFederatedPunchoutReporter;

  return v2;
}

void __63__WLDFederatedPunchoutReporter_sharedFederatedPunchoutReporter__block_invoke(id a1)
{
  sharedFederatedPunchoutReporter_sharedFederatedPunchoutReporter = objc_alloc_init(WLDFederatedPunchoutReporter);

  _objc_release_x1();
}

- (WLDFederatedPunchoutReporter)init
{
  v10.receiver = self;
  v10.super_class = (Class)WLDFederatedPunchoutReporter;
  v2 = [(WLDFederatedPunchoutReporter *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    ledger = v2->_ledger;
    v2->_ledger = v3;

    v5 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    [(NSOperationQueue *)v5 setMaxConcurrentOperationCount:1];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [(NSOperationQueue *)v5 setName:v7];

    queue = v2->_queue;
    v2->_queue = v5;
  }
  return v2;
}

- (void)recordPunchout:(id)a3
{
  id v4 = a3;
  v5 = [(WLDFederatedPunchoutReporter *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __47__WLDFederatedPunchoutReporter_recordPunchout___block_invoke;
  v7[3] = &unk_100044E28;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __47__WLDFederatedPunchoutReporter_recordPunchout___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) channelID];
  id v4 = [*v2 canonicalID];
  if (v3)
  {
    v5 = [*(id *)(a1 + 40) ledger];
    id v6 = [v5 objectForKey:v3];

    if (v6)
    {
      v7 = [v6 canonicalID];
      unsigned int v8 = [v7 isEqual:v4];

      if (v8) {
        uint64_t v9 = 3;
      }
      else {
        uint64_t v9 = 2;
      }
      [v6 setFailureReason:v9];
      objc_super v10 = WLKPushNotificationsLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 134217984;
        uint64_t v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "WLDFederatedPunchoutReporter - Recorded punchout that matches existing one in ledger. reporting back with failure reason %lu", (uint8_t *)&v19, 0xCu);
      }

      [*(id *)(a1 + 40) _reportPunchoutEvent:v6 withPlaybackSummary:0];
      v11 = [*(id *)(a1 + 40) ledger];
      [v11 removeObjectForKey:v3];
    }
    v12 = +[TVAppBag app];
    v13 = [v12 integerForKey:@"tvFederatedPunchoutTTL"];

    if (!v13)
    {
      v13 = +[NSNumber numberWithInt:60];
    }
    objc_msgSend(*v2, "setTtl:", objc_msgSend(v13, "unsignedIntegerValue"));
    v14 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = *v2;
      int v19 = 138412290;
      uint64_t v20 = (uint64_t)v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "WLDFederatedPunchoutReporter - Adding punchout to ledger: %@", (uint8_t *)&v19, 0xCu);
    }

    v16 = [*(id *)(a1 + 40) ledger];
    [v16 setObject:*(void *)(a1 + 32) forKey:v3];

    v17 = *(void **)(a1 + 40);
    v18 = [*(id *)(a1 + 32) expiry];
    [v17 _configureTimerWithDate:v18];
  }
  else
  {
    id v6 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __47__WLDFederatedPunchoutReporter_recordPunchout___block_invoke_cold_1((uint64_t *)v2, v6);
    }
  }
}

- (void)recordPlaybackSummary:(id)a3
{
  id v4 = a3;
  v5 = [(WLDFederatedPunchoutReporter *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __54__WLDFederatedPunchoutReporter_recordPlaybackSummary___block_invoke;
  v7[3] = &unk_100044E28;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __54__WLDFederatedPunchoutReporter_recordPlaybackSummary___block_invoke(uint64_t a1)
{
  v2 = +[WLKChannelUtilities sharedInstanceFiltered];
  v3 = [*(id *)(a1 + 32) bundleID];
  id v4 = [v2 channelForBundleID:v3];

  if (v4 && ([v4 channelID], v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = [v4 channelID];
    v7 = [*(id *)(a1 + 40) ledger];
    id v8 = [v7 objectForKey:v6];

    if (v8)
    {
      uint64_t v9 = WLKPushNotificationsLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 138412290;
        v38 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WLDFederatedPunchoutReporter - found matching punchout for reported playback summary: %@", (uint8_t *)&v37, 0xCu);
      }

      objc_super v10 = [v8 externalContentID];
      v11 = [*(id *)(a1 + 32) contentID];
      unsigned __int8 v12 = [v10 isEqual:v11];

      v13 = WLKPushNotificationsLogObject();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          LOWORD(v37) = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "WLDFederatedPunchoutReporter - Playback summary matches pending punchout.", (uint8_t *)&v37, 2u);
        }

        id v15 = +[TVAppBag app];
        v16 = [v15 integerForKey:@"tvFederatedPunchoutResumeTimeEpsilon"];

        if (!v16)
        {
          v16 = +[NSNumber numberWithInt:10];
        }
        v17 = [*(id *)(a1 + 32) elapsedTime];
        v18 = [v17 integerValue];

        int v19 = [v8 resumeTimeSeconds];
        uint64_t v20 = v19;
        if (v18 - v19 >= 0) {
          int64_t v21 = v18 - v19;
        }
        else {
          int64_t v21 = v19 - v18;
        }
        id v22 = [v16 integerValue];
        v23 = WLKPushNotificationsLogObject();
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if (v21 <= (uint64_t)v22)
        {
          if (v24)
          {
            id v35 = [v16 integerValue];
            int v37 = 134218496;
            v38 = v18;
            __int16 v39 = 2048;
            id v40 = v35;
            __int16 v41 = 2048;
            v42 = v20;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "WLDFederatedPunchoutReporter - Playback summary elapsed time of %ld is within %ld second epsilon from resume time %ld", (uint8_t *)&v37, 0x20u);
          }

          v36 = +[NSDate now];
          [v8 setMatchTime:v36];

          [v8 setFailureReason:0];
          [*(id *)(a1 + 40) _reportPunchoutEvent:v8 withPlaybackSummary:*(void *)(a1 + 32)];
          v28 = [*(id *)(a1 + 40) ledger];
          [v28 removeObjectForKey:v6];
        }
        else
        {
          if (v24)
          {
            id v25 = [v16 integerValue];
            int v37 = 134218496;
            v38 = v18;
            __int16 v39 = 2048;
            id v40 = v25;
            __int16 v41 = 2048;
            v42 = v20;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "WLDFederatedPunchoutReporter - Playback summary elapsed time of %ld is greater than %ld second epsilon from resume time %ld", (uint8_t *)&v37, 0x20u);
          }

          [v8 setFailureReason:4];
          v26 = (char *)[v8 ttl];
          v27 = +[TVAppBag app];
          v28 = [v27 integerForKey:@"tvFederatedPunchoutExtensionTTL"];

          if (!v28)
          {
            v28 = +[NSNumber numberWithInt:10];
          }
          objc_msgSend(v8, "setTtl:", &v26[(void)objc_msgSend(v28, "unsignedIntegerValue")]);
          v29 = *(void **)(a1 + 40);
          v30 = [v8 expiry];
          [v29 _configureTimerWithDate:v30];
        }
      }
      else
      {
        if (v14)
        {
          LOWORD(v37) = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "WLDFederatedPunchoutReporter - playback summary is from expected channel but not the expected playable.", (uint8_t *)&v37, 2u);
        }

        [v8 setFailureReason:5];
        v32 = (char *)[v8 ttl];
        v33 = +[TVAppBag app];
        v16 = [v33 integerForKey:@"tvFederatedPunchoutExtensionTTL"];

        if (!v16)
        {
          v16 = +[NSNumber numberWithInt:10];
        }
        objc_msgSend(v8, "setTtl:", &v32[(void)objc_msgSend(v16, "unsignedIntegerValue")]);
        v34 = *(void **)(a1 + 40);
        v28 = [v8 expiry];
        [v34 _configureTimerWithDate:v28];
      }
    }
  }
  else
  {
    id v6 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [*(id *)(a1 + 32) bundleID];
      int v37 = 138412290;
      v38 = v31;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WLDFederatedPunchoutReporter - No matching channel for bundle ID %@", (uint8_t *)&v37, 0xCu);
    }
  }
}

- (void)_reportPunchoutEvent:(id)a3 withPlaybackSummary:(id)a4
{
  id v6 = a3;
  v7 = [(WLDFederatedPunchoutReporter *)self _metadataForEventWithPunchout:v6 playbackSummary:a4];
  if ([v6 failureReason])
  {
    id v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"WLKFederatedPunchoutErrorDomain", [v6 failureReason], 0);
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v9 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WLDFederatedPunchoutReporter - Recording punchout with error %@", (uint8_t *)&v10, 0xCu);
  }

  +[VSMetricsManagerObjC recordFederatedPunchoutEventWithError:v8 metadata:v7];
}

- (id)_metadataForEventWithPunchout:(id)a3 playbackSummary:(id)a4
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = [v4 punchoutTime];
  v7 = [v4 matchTime];
  id v8 = v7;
  double v9 = 0.0;
  if (v6 && v7)
  {
    [v7 timeIntervalSinceDate:v6];
    double v9 = round(v10 * 10.0) / 10.0;
  }
  v11 = [v4 channelID];
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v11, @"channelID");

  unsigned __int8 v12 = [v4 bundleID];
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v12, VSMetricFlexibleFieldBundleID);

  v13 = +[NSNumber numberWithDouble:v9];
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v13, @"matchTimeSeconds");

  BOOL v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 ttl]);
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v14, @"ttl");

  id v15 = [v4 appAdamID];
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v15, @"adamID");

  v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isConsented]);
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v16, @"consented");

  if ([v4 failureReason])
  {
    v17 = [v4 canonicalID];
    objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v17, @"canonicalID");

    v18 = [v4 externalContentID];
    objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v18, @"externalID");
  }

  return v5;
}

- (void)_configureTimerWithDate:(id)a3
{
  id v4 = a3;
  id v5 = [(WLDFederatedPunchoutReporter *)self timer];
  if (v5)
  {
    id v6 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WLDFederatedPunchoutReporter - New punchout recorded with pre-existing timer.", (uint8_t *)buf, 2u);
    }

    dispatch_source_cancel(v5);
  }
  v7 = [(WLDFederatedPunchoutReporter *)self queue];
  id v8 = [v7 underlyingQueue];
  double v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);

  [v4 timeIntervalSinceNow];
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
  dispatch_source_set_timer(v9, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(buf, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __56__WLDFederatedPunchoutReporter__configureTimerWithDate___block_invoke;
  handler[3] = &unk_100044AE0;
  objc_copyWeak(&v13, buf);
  dispatch_source_set_event_handler(v9, handler);
  [(WLDFederatedPunchoutReporter *)self setTimer:v9];
  dispatch_activate(v9);
  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
}

void __56__WLDFederatedPunchoutReporter__configureTimerWithDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = +[NSDate now];
    id v3 = objc_alloc_init((Class)NSMutableArray);
    id v4 = [WeakRetained ledger];
    id v5 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v13 = [v4 count];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "WLDFederatedPunchoutReporter - punchout expiry timer fired, processing %lu punchouts.", buf, 0xCu);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __56__WLDFederatedPunchoutReporter__configureTimerWithDate___block_invoke_49;
    v8[3] = &unk_100044E50;
    id v9 = v2;
    id v10 = WeakRetained;
    id v11 = v3;
    id v6 = v3;
    id v7 = v2;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
    [v4 removeObjectsForKeys:v6];
    [WeakRetained setTimer:0];
  }
}

void __56__WLDFederatedPunchoutReporter__configureTimerWithDate___block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = [v6 expiry];
  id v9 = [v7 compare:v8];

  if (v9 == (id)1)
  {
    id v10 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "WLDFederatedPunchoutReporter - Punchout expired: %@", (uint8_t *)&v11, 0xCu);
    }

    if (![v6 failureReason]) {
      [v6 setFailureReason:1];
    }
    [*(id *)(a1 + 40) _reportPunchoutEvent:v6 withPlaybackSummary:0];
    [*(id *)(a1 + 48) addObject:v5];
  }
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSMutableDictionary)ledger
{
  return self->_ledger;
}

- (void)setLedger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ledger, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __47__WLDFederatedPunchoutReporter_recordPunchout___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "WLDFederatedPunchoutReporter - Attempted to record a punchout with invalid channel ID: %@", (uint8_t *)&v3, 0xCu);
}

@end