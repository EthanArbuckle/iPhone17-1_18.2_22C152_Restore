@interface APAdRequester
- (APAccumulator)adAccumulator;
- (APAdRequester)initWithBundleID:(id)a3 identifier:(id)a4 clientInfo:(id)a5 idAccount:(id)a6 accumulateRequests:(BOOL)a7;
- (APClientInfo)clientInfo;
- (APIDAccount_Private)idAccount;
- (APUnfairLock)accumulatorLock;
- (BOOL)_handleAdValidationErrorDomainWithJourneyMetricsHelper:(id)a3 code:(int64_t)a4 internalContent:(id)a5 type:(id)a6;
- (BOOL)cancelled;
- (NSString)bundleID;
- (NSUUID)identifier;
- (unint64_t)signpostID;
- (void)_setupAccumulator;
- (void)accumulateAdRequests:(id)a3;
- (void)cancelRequest;
- (void)checkForDiscards:(id)a3 placementType:(int64_t)a4;
- (void)requestAds:(id)a3;
- (void)sendAnalyticsForGettingAdResponse:(id)a3;
- (void)setAccumulatorLock:(id)a3;
- (void)setAdAccumulator:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setClientInfo:(id)a3;
- (void)setIdAccount:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSignpostID:(unint64_t)a3;
@end

@implementation APAdRequester

- (APAdRequester)initWithBundleID:(id)a3 identifier:(id)a4 clientInfo:(id)a5 idAccount:(id)a6 accumulateRequests:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v23.receiver = self;
  v23.super_class = (Class)APAdRequester;
  v17 = [(APAdRequester *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_bundleID, a3);
    objc_storeStrong((id *)&v18->_identifier, a4);
    v18->_cancelled = 0;
    objc_storeStrong((id *)&v18->_clientInfo, a5);
    objc_storeStrong((id *)&v18->_idAccount, a6);
    if (v7)
    {
      v19 = APPerfLogForCategory();
      v18->_signpostID = os_signpost_id_generate(v19);

      v20 = (APUnfairLock *)[objc_alloc((Class)APUnfairLock) initWithOptions:1];
      accumulatorLock = v18->_accumulatorLock;
      v18->_accumulatorLock = v20;

      [(APAdRequester *)v18 _setupAccumulator];
    }
  }

  return v18;
}

- (void)sendAnalyticsForGettingAdResponse:(id)a3
{
  id v3 = a3;
  v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [v3 identifier];
    v6 = [v5 UUIDString];
    *(_DWORD *)buf = 138412290;
    double v27 = *(double *)&v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[LegacyInterface] Context (%@) got an ad response.", buf, 0xCu);
  }
  BOOL v7 = +[NSDate date];
  v8 = [v3 prefetchTimestamp];

  if (v8)
  {
    v9 = [v3 prefetchTimestamp];
    [v7 timeIntervalSinceDate:v9];
    double v11 = v10;

    v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [v3 identifier];
      id v14 = [v13 UUIDString];
      *(_DWORD *)buf = 138543618;
      double v27 = *(double *)&v14;
      __int16 v28 = 2050;
      double v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[LegacyInterface] Context %{public}@: Pre-fetch to daemon ad response interval is %{public}f.", buf, 0x16u);
    }
    id v15 = +[NSNumber numberWithDouble:v11];
    id v16 = +[NSDecimalNumber notANumber];
    unsigned __int8 v17 = [v15 isEqual:v16];

    if (v17)
    {
      v18 = APLogForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        double v27 = v11;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%f Invalid interval", buf, 0xCu);
      }
    }
    else
    {
      v25[0] = v15;
      v19 = +[NSNumber numberWithLong:4, @"Interval", @"IntervalType"];
      v25[1] = v19;
      v24[2] = @"NetworkType";
      v20 = +[NSNumber numberWithUnsignedLong:0];
      v25[2] = v20;
      v24[3] = @"PlacementType";
      v21 = [v3 current];
      v22 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v21 placement]);
      v25[3] = v22;
      v24[4] = @"Failed";
      objc_super v23 = +[NSNumber numberWithBool:0];
      v25[4] = v23;
      v18 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];

      +[APAnalytics sendEvent:@"adtiming" customPayload:v18];
    }
  }
  else
  {
    id v15 = APLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "prefetchTimestamp is nil!", buf, 2u);
    }
  }
}

- (void)cancelRequest
{
  id v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(APAdRequester *)self identifier];
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cancelling request %{public}@", (uint8_t *)&v5, 0xCu);
  }
  self->_cancelled = 1;
}

- (void)checkForDiscards:(id)a3 placementType:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [v6 content];
  v8 = [v7 error];

  if (v8)
  {
    v9 = [v6 content];
    double v10 = [v9 error];
    double v11 = [v10 domain];

    v12 = [APJourneyDaemonMetricHelper alloc];
    id v13 = [v6 content];
    id v14 = [(APJourneyDaemonMetricHelper *)v12 initWithContentData:v13];

    if ([v11 isEqualToString:@"com.apple.ap.AdValidationErrorDomain"])
    {
      id v15 = [v6 content];
      id v16 = [v15 error];
      id v17 = [v16 code];
      v18 = +[NSNumber numberWithInteger:a4];
      unsigned __int8 v19 = [(APAdRequester *)self _handleAdValidationErrorDomainWithJourneyMetricsHelper:v14 code:v17 internalContent:v6 type:v18];

      if (v19) {
        goto LABEL_13;
      }
    }
    else
    {
      if ([v11 isEqualToString:@"com.apple.ap.DaemonDiscardedErrorDomain"])
      {
        v20 = [(APAdRequester *)self bundleID];
        v21 = [v6 content];
        v22 = [v21 error];
        -[APJourneyDaemonMetricHelper discardedForBundleID:withCode:](v14, "discardedForBundleID:withCode:", v20, [v22 code]);
        goto LABEL_11;
      }
      if ([v11 isEqualToString:NSURLErrorDomain])
      {
        objc_super v23 = [(APAdRequester *)self bundleID];
        v24 = [(APAdRequester *)self identifier];
        v25 = [v24 UUIDString];
        [(APJourneyDaemonMetricHelper *)v14 requestFailedForBundleID:v23 withCode:3300 requestID:v25 placement:0 placementType:a4];
      }
    }
    v20 = APLogForCategory();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
LABEL_12:

LABEL_13:
      goto LABEL_14;
    }
    v21 = [v6 content];
    v22 = [v21 identifier];
    int v26 = 138543618;
    double v27 = v22;
    __int16 v28 = 2114;
    double v29 = v11;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Error domain for Content %{public}@ is %{public}@. Not sending a discard metric.", (uint8_t *)&v26, 0x16u);
LABEL_11:

    goto LABEL_12;
  }
LABEL_14:
}

- (BOOL)_handleAdValidationErrorDomainWithJourneyMetricsHelper:(id)a3 code:(int64_t)a4 internalContent:(id)a5 type:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a4 == 4509)
  {
    id v13 = [(APAdRequester *)self bundleID];
    id v14 = [(APAdRequester *)self identifier];
    id v15 = [v14 UUIDString];
    id v16 = [v12 integerValue];
    id v17 = v10;
    v18 = v13;
    uint64_t v19 = 3302;
  }
  else
  {
    if (a4 != 4508)
    {
      v21 = [APDiagnosticDaemonMetricHelper alloc];
      v22 = [v11 content];
      id v13 = [(APDiagnosticDaemonMetricHelper *)v21 initWithContentData:v22];

      v32 = [v11 content];
      objc_super v23 = [v32 error];
      id v24 = [v23 code];
      v25 = [v11 content];
      int v26 = [v25 error];
      [v26 localizedDescription];
      id v27 = v11;
      id v28 = v10;
      v30 = id v29 = v12;
      [(APDiagnosticDaemonMetricHelper *)v13 validationFailed:v24 reason:v30];

      id v12 = v29;
      id v10 = v28;
      id v11 = v27;

      id v14 = [(APAdRequester *)self bundleID];
      [v10 discardedForBundleID:v14 withCode:2605];
      BOOL v20 = 1;
      goto LABEL_7;
    }
    id v13 = [(APAdRequester *)self bundleID];
    id v14 = [(APAdRequester *)self identifier];
    id v15 = [v14 UUIDString];
    id v16 = [v12 integerValue];
    id v17 = v10;
    v18 = v13;
    uint64_t v19 = 3301;
  }
  [v17 requestFailedForBundleID:v18 withCode:v19 requestID:v15 placement:0 placementType:v16];

  BOOL v20 = 0;
LABEL_7:

  return v20;
}

- (void)requestAds:(id)a3
{
  id v4 = a3;
  int v5 = [APAdBatchRequester alloc];
  id v6 = [(APAdRequester *)self bundleID];
  BOOL v7 = +[NSUUID UUID];
  v8 = [(APAdRequester *)self clientInfo];
  v9 = [(APAdRequester *)self idAccount];
  id v10 = [(APAdBatchRequester *)v5 initWithBatch:v4 bundleID:v6 requestIdentifier:v7 clientInfo:v8 idAccount:v9];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A6BB0;
  v12[3] = &unk_100235208;
  id v13 = v10;
  id v14 = self;
  id v11 = v10;
  [(APAdBatchRequester *)v11 makeRequest:v12];
}

- (void)_setupAccumulator
{
  id v3 = [(APAdRequester *)self accumulatorLock];
  [v3 lock];

  id v4 = [(APAdRequester *)self adAccumulator];

  if (v4)
  {
    id v21 = [(APAdRequester *)self accumulatorLock];
    [v21 unlock];

    return;
  }
  int v5 = +[APConfigurationMediator configurationForClass:objc_opt_class()];
  id v6 = v5;
  if (!v5)
  {
    uint64_t v9 = 200;
    uint64_t v10 = 100;
LABEL_15:
    uint64_t v15 = 4;
    goto LABEL_16;
  }
  BOOL v7 = [v5 accumulationTime];

  if (v7)
  {
    v8 = [v6 accumulationTime];
    uint64_t v9 = [v8 unsignedIntValue];
  }
  else
  {
    uint64_t v9 = 200;
  }
  id v11 = [v6 inactivityTime];

  if (v11)
  {
    id v12 = [v6 inactivityTime];
    uint64_t v10 = [v12 unsignedIntValue];
  }
  else
  {
    uint64_t v10 = 100;
  }
  id v13 = [v6 itemLimit];

  if (!v13) {
    goto LABEL_15;
  }
  id v14 = [v6 itemLimit];
  uint64_t v15 = [v14 unsignedIntValue];

LABEL_16:
  id v16 = APLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    uint64_t v25 = v9;
    __int16 v26 = 2048;
    uint64_t v27 = v10;
    __int16 v28 = 2048;
    uint64_t v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Creating ad accumulator with parameters: accumulate: %lu, inactivity: %lu, limit: %lu", buf, 0x20u);
  }

  id v17 = [[APAccumulator alloc] initWithAccumulationTime:v9 inactivityTime:v10 itemLimit:v15];
  adAccumulator = self->_adAccumulator;
  self->_adAccumulator = v17;

  objc_initWeak((id *)buf, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000A7518;
  v22[3] = &unk_100235230;
  objc_copyWeak(&v23, (id *)buf);
  uint64_t v19 = [(APAdRequester *)self adAccumulator];
  [v19 setAccumulationHandler:v22];

  BOOL v20 = [(APAdRequester *)self accumulatorLock];
  [v20 unlock];

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

- (void)accumulateAdRequests:(id)a3
{
  id v4 = a3;
  [(APUnfairLock *)self->_accumulatorLock lock];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v31;
    *(void *)&long long v6 = 134349570;
    long long v27 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v9);
        id v11 = [(APAdRequester *)self adAccumulator];
        id v12 = [v11 accumulatedItems];
        id v13 = [v12 count];

        if (!v13)
        {
          id v14 = APPerfLogForCategory();
          unint64_t v15 = [(APAdRequester *)self signpostID];
          if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v16 = v15;
            if (os_signpost_enabled(v14))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "AccumulationInterval", "", buf, 2u);
            }
          }
        }
        id v17 = [(APAdRequester *)self adAccumulator];
        [v17 accumulate:v10];

        v18 = APLogForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          uint64_t v29 = [(APAdRequester *)self adAccumulator];
          uint64_t v19 = [v29 accumulatedItems];
          id v20 = [v19 count];
          id v21 = [v10 identifier];
          v22 = [v10 context];
          [v22 identifier];
          id v23 = self;
          id v24 = v7;
          __int16 v26 = v25 = v8;
          *(_DWORD *)buf = v27;
          id v35 = v20;
          __int16 v36 = 2114;
          v37 = v21;
          __int16 v38 = 2114;
          v39 = v26;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Adding request #%{public}lu to batch with identifier %{public}@ and context %{public}@", buf, 0x20u);

          uint64_t v8 = v25;
          id v7 = v24;
          self = v23;
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v7);
  }

  [(APUnfairLock *)self->_accumulatorLock unlock];
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleID:(id)a3
{
}

- (APClientInfo)clientInfo
{
  return (APClientInfo *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClientInfo:(id)a3
{
}

- (APIDAccount_Private)idAccount
{
  return (APIDAccount_Private *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIdAccount:(id)a3
{
}

- (APAccumulator)adAccumulator
{
  return self->_adAccumulator;
}

- (void)setAdAccumulator:(id)a3
{
}

- (APUnfairLock)accumulatorLock
{
  return self->_accumulatorLock;
}

- (void)setAccumulatorLock:(id)a3
{
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulatorLock, 0);
  objc_storeStrong((id *)&self->_adAccumulator, 0);
  objc_storeStrong((id *)&self->_idAccount, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end