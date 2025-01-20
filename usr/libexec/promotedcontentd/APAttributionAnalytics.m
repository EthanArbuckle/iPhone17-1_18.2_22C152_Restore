@interface APAttributionAnalytics
+ (id)_buildPayloadForTimingAnalytics:(id)a3 startDate:(id)a4 endDate:(id)a5 additionalFields:(id)a6;
+ (id)storefrontCountryOnly:(id)a3;
+ (int64_t)findBucketForDaemonRunningTime:(double)a3;
+ (void)sendTimedAnalytic:(id)a3 fieldName:(id)a4 startDate:(id)a5 endDate:(id)a6;
+ (void)sendTimedAnalytic:(id)a3 fieldName:(id)a4 startDate:(id)a5 endDate:(id)a6 additionalFields:(id)a7;
+ (void)sendTimingAnalytics:(id)a3 startDate:(id)a4 endDate:(id)a5 additionalFields:(id)a6;
+ (void)sendTokenDuplicateAnalytics:(id)a3;
- (APAttributionAnalytics)init;
- (APUnfairLock)analyticsLock;
- (NSString)errorCode;
- (NSString)status;
- (NSString)storefrontID;
- (int64_t)retry;
- (unint64_t)end;
- (unint64_t)lsProxyEnd;
- (unint64_t)lsProxyStart;
- (unint64_t)serverPostEnd;
- (unint64_t)serverPostStart;
- (unint64_t)start;
- (unint64_t)state;
- (unint64_t)tokenDaemonEnd;
- (unint64_t)tokenDaemonStart;
- (unint64_t)tokenEnd;
- (unint64_t)tokenStart;
- (void)sendAnalytics;
- (void)sendTokenAnalytics;
- (void)setAnalyticsLock:(id)a3;
- (void)setEnd:(unint64_t)a3;
- (void)setErrorCode:(id)a3;
- (void)setLsProxyEnd:(unint64_t)a3;
- (void)setLsProxyStart:(unint64_t)a3;
- (void)setRetry:(int64_t)a3;
- (void)setServerPostEnd:(unint64_t)a3;
- (void)setServerPostStart:(unint64_t)a3;
- (void)setStart:(unint64_t)a3;
- (void)setState:(unint64_t)a3;
- (void)setStatus:(id)a3;
- (void)setStorefrontID:(id)a3;
- (void)setTokenDaemonEnd:(unint64_t)a3;
- (void)setTokenDaemonStart:(unint64_t)a3;
- (void)setTokenEnd:(unint64_t)a3;
- (void)setTokenStart:(unint64_t)a3;
@end

@implementation APAttributionAnalytics

- (APAttributionAnalytics)init
{
  v8.receiver = self;
  v8.super_class = (Class)APAttributionAnalytics;
  v2 = [(APAttributionAnalytics *)&v8 init];
  v3 = v2;
  if (v2)
  {
    storefrontID = v2->_storefrontID;
    v2->_storefrontID = (NSString *)&stru_1002392C0;

    v3->_state = 0;
    v5 = (APUnfairLock *)[objc_alloc((Class)APUnfairLock) initWithOptions:0];
    analyticsLock = v3->_analyticsLock;
    v3->_analyticsLock = v5;
  }
  return v3;
}

- (void)sendAnalytics
{
  [(APUnfairLock *)self->_analyticsLock lock];
  if (self->_state == 3)
  {
    unint64_t end = self->_end;
    unint64_t serverPostEnd = self->_serverPostEnd;
    unint64_t lsProxyEnd = self->_lsProxyEnd;
    unint64_t serverPostStart = self->_serverPostStart;
    if (serverPostEnd >= serverPostStart) {
      unint64_t v7 = serverPostEnd - serverPostStart;
    }
    else {
      unint64_t v7 = 0;
    }
    unint64_t start = self->_start;
    unint64_t tokenDaemonStart = self->_tokenDaemonStart;
    if (tokenDaemonStart >= start) {
      unint64_t v10 = tokenDaemonStart - start;
    }
    else {
      unint64_t v10 = 0;
    }
    unint64_t tokenDaemonEnd = self->_tokenDaemonEnd;
    unint64_t tokenStart = self->_tokenStart;
    BOOL v24 = tokenDaemonEnd >= start;
    unint64_t v13 = tokenDaemonEnd - start;
    if (v24) {
      unint64_t v14 = v13;
    }
    else {
      unint64_t v14 = 0;
    }
    if (tokenStart >= start) {
      unint64_t v15 = tokenStart - start;
    }
    else {
      unint64_t v15 = 0;
    }
    unint64_t tokenEnd = self->_tokenEnd;
    unint64_t lsProxyStart = self->_lsProxyStart;
    BOOL v24 = tokenEnd >= start;
    unint64_t v18 = tokenEnd - start;
    if (v24) {
      unint64_t v19 = v18;
    }
    else {
      unint64_t v19 = 0;
    }
    unint64_t v20 = lsProxyStart - start;
    if (lsProxyStart < start) {
      unint64_t v20 = 0;
    }
    BOOL v24 = lsProxyEnd >= start;
    unint64_t v21 = lsProxyEnd - start;
    if (!v24) {
      unint64_t v21 = 0;
    }
    BOOL v24 = serverPostStart >= start;
    unint64_t v22 = serverPostStart - start;
    if (!v24) {
      unint64_t v22 = 0;
    }
    BOOL v24 = serverPostEnd >= start;
    unint64_t v23 = serverPostEnd - start;
    if (!v24) {
      unint64_t v23 = 0;
    }
    BOOL v24 = end >= start;
    unint64_t v25 = end - start;
    if (v24) {
      unint64_t v26 = v25;
    }
    else {
      unint64_t v26 = 0;
    }
    unint64_t v53 = v22;
    unint64_t v54 = v23;
    unint64_t v51 = v20;
    unint64_t v52 = v21;
    if (!v24)
    {
      v27 = APLogForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        unint64_t v28 = self->_start;
        unint64_t v29 = self->_end;
        *(_DWORD *)buf = 134218240;
        unint64_t v59 = v28;
        __int16 v60 = 2048;
        unint64_t v61 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Attribution start time %lu should not be greater than end time %lu", buf, 0x16u);
      }

      unint64_t start = self->_start;
      unint64_t tokenDaemonStart = self->_tokenDaemonStart;
    }
    if (tokenDaemonStart < start)
    {
      v30 = APLogForCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        unint64_t v31 = self->_start;
        unint64_t v32 = self->_tokenDaemonStart;
        *(_DWORD *)buf = 134218240;
        unint64_t v59 = v31;
        __int16 v60 = 2048;
        unint64_t v61 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Attribution client start time %lu should not be greater than attribution daemon start time %lu", buf, 0x16u);
      }
    }
    if (self->_end < self->_tokenDaemonEnd)
    {
      v33 = APLogForCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        unint64_t v34 = self->_start;
        unint64_t v35 = self->_tokenDaemonStart;
        *(_DWORD *)buf = 134218240;
        unint64_t v59 = v34;
        __int16 v60 = 2048;
        unint64_t v61 = v35;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Attribution deamon end time %lu should not be greater than Attribution client end time %lu", buf, 0x16u);
      }
    }
    v56[0] = @"attributionRoundTrip";
    v50 = +[NSNumber numberWithUnsignedInteger:v26];
    v57[0] = v50;
    v56[1] = @"svrPostRoundTrip";
    v49 = +[NSNumber numberWithUnsignedInteger:v7];
    storefrontID = self->_storefrontID;
    v57[1] = v49;
    v57[2] = storefrontID;
    v56[2] = @"storeFront";
    v56[3] = @"DaemonStart";
    v48 = +[NSNumber numberWithUnsignedInteger:v10];
    v57[3] = v48;
    v56[4] = @"DaemonEnd";
    v37 = +[NSNumber numberWithUnsignedInteger:v14];
    v57[4] = v37;
    v56[5] = @"TokenGenerateStart";
    v38 = +[NSNumber numberWithUnsignedInteger:v15];
    v57[5] = v38;
    v56[6] = @"TokenGenerateEnd";
    v39 = +[NSNumber numberWithUnsignedInteger:v19];
    v57[6] = v39;
    v56[7] = @"LSProxyStart";
    v40 = +[NSNumber numberWithUnsignedInteger:v51];
    v57[7] = v40;
    v56[8] = @"LSProxyEnd";
    v41 = +[NSNumber numberWithUnsignedInteger:v52];
    v57[8] = v41;
    v56[9] = @"ServerPostStart";
    v42 = +[NSNumber numberWithUnsignedInteger:v53];
    v57[9] = v42;
    v56[10] = @"ServerPostEnd";
    v43 = +[NSNumber numberWithUnsignedInteger:v54];
    v57[10] = v43;
    v56[11] = @"AttributionEnd";
    unint64_t v55 = v26;
    v44 = +[NSNumber numberWithUnsignedInteger:v26];
    v57[11] = v44;
    v45 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:12];

    +[APAnalytics sendEvent:@"attribution.latency" customPayload:v45];
    v46 = APLogForCategory();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v59 = v55;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Attribution Roundtrip %lu", buf, 0xCu);
    }

    [(APUnfairLock *)self->_analyticsLock unlock];
  }
  else
  {
    analyticsLock = self->_analyticsLock;
    [(APUnfairLock *)analyticsLock unlock];
  }
}

- (void)sendTokenAnalytics
{
  if (self->_status)
  {
    errorCode = self->_errorCode;
    if (errorCode)
    {
      v4 = errorCode;
    }
    else
    {
      v4 = +[NSNull null];
    }
    v5 = v4;
    status = self->_status;
    v13[0] = @"Status";
    v13[1] = @"Code";
    v14[0] = status;
    v14[1] = v4;
    v13[2] = @"Retry";
    unint64_t v7 = +[NSNumber numberWithInteger:self->_retry];
    v14[2] = v7;
    objc_super v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

    +[APAnalytics sendEvent:@"attribution.token" customPayload:v8];
    v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      unint64_t v10 = self->_status;
      int v11 = 138543362;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Analytics token event status %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Analytics status cannot be nil", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)setEnd:(unint64_t)a3
{
  [(APUnfairLock *)self->_analyticsLock lock];
  self->_unint64_t end = a3;
  unint64_t state = self->_state;
  if (state)
  {
    if (state != 2) {
      goto LABEL_6;
    }
    unint64_t v6 = 3;
  }
  else
  {
    unint64_t v6 = 1;
  }
  self->_unint64_t state = v6;
LABEL_6:
  analyticsLock = self->_analyticsLock;

  [(APUnfairLock *)analyticsLock unlock];
}

- (unint64_t)end
{
  [(APUnfairLock *)self->_analyticsLock lock];
  unint64_t end = self->_end;
  [(APUnfairLock *)self->_analyticsLock unlock];
  return end;
}

- (void)setServerPostEnd:(unint64_t)a3
{
  [(APUnfairLock *)self->_analyticsLock lock];
  self->_unint64_t serverPostEnd = a3;
  unint64_t state = self->_state;
  if (state)
  {
    if (state != 1) {
      goto LABEL_6;
    }
    unint64_t v6 = 3;
  }
  else
  {
    unint64_t v6 = 2;
  }
  self->_unint64_t state = v6;
LABEL_6:
  analyticsLock = self->_analyticsLock;

  [(APUnfairLock *)analyticsLock unlock];
}

- (unint64_t)serverPostEnd
{
  [(APUnfairLock *)self->_analyticsLock lock];
  unint64_t serverPostEnd = self->_serverPostEnd;
  [(APUnfairLock *)self->_analyticsLock unlock];
  return serverPostEnd;
}

+ (void)sendTokenDuplicateAnalytics:(id)a3
{
  id v3 = a3;
  CFStringRef v8 = @"source";
  id v9 = v3;
  v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  +[APAnalytics sendEvent:@"attribution.duplicate" customPayload:v4];

  v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Analytics duplicate token event status %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

+ (id)_buildPayloadForTimingAnalytics:(id)a3 startDate:(id)a4 endDate:(id)a5 additionalFields:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 length])
  {
    double v13 = 0.0;
    if (v10)
    {
      if (v11)
      {
        [v11 timeIntervalSinceDate:v10];
        double v13 = v14;
        if (v14 < 0.0)
        {
          unint64_t v15 = APLogForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136642819;
            BOOL v24 = "+[APAttributionAnalytics _buildPayloadForTimingAnalytics:startDate:endDate:additionalFields:]";
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%{sensitive}s] Start date is prior to end date", buf, 0xCu);
          }
        }
      }
    }
    v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)(v13 * 1000.0), v9);
    unint64_t v22 = v16;
    v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

    if (v12)
    {
      id v18 = [v17 mutableCopy];
      [v18 addEntriesFromDictionary:v12];
      id v19 = [v18 copy];

      v17 = v19;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (int64_t)findBucketForDaemonRunningTime:(double)a3
{
  for (int64_t result = 0; result != 10; ++result)
  {
    if (qword_1001D6698[result] >= (uint64_t)(a3 * 1000.0)) {
      break;
    }
  }
  return result;
}

+ (id)storefrontCountryOnly:(id)a3
{
  id v3 = a3;
  v4 = v3;
  v5 = @"NONE";
  if (v3 && ([v3 isEqualToString:@"NONE"] & 1) == 0)
  {
    int v6 = [v4 componentsSeparatedByString:@"-"];
    if ([v6 count])
    {
      id v7 = [v6 firstObject];
    }
    else
    {
      CFStringRef v8 = APLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error extracting storefront country only.", v10, 2u);
      }

      id v7 = v4;
    }
    v5 = v7;
  }

  return v5;
}

+ (void)sendTimingAnalytics:(id)a3 startDate:(id)a4 endDate:(id)a5 additionalFields:(id)a6
{
  uint64_t v6 = [a1 _buildPayloadForTimingAnalytics:a3 startDate:a4 endDate:a5 additionalFields:a6];
  if (v6) {
    +[APAnalytics sendEvent:@"attribution.timings" customPayload:v6];
  }

  _objc_release_x1();
}

+ (void)sendTimedAnalytic:(id)a3 fieldName:(id)a4 startDate:(id)a5 endDate:(id)a6
{
}

+ (void)sendTimedAnalytic:(id)a3 fieldName:(id)a4 startDate:(id)a5 endDate:(id)a6 additionalFields:(id)a7
{
  id v13 = a3;
  id v12 = [a1 _buildPayloadForTimingAnalytics:a4 startDate:a5 endDate:a6 additionalFields:a7];
  if (v12) {
    +[APAnalytics sendEvent:v13 customPayload:v12];
  }
}

- (unint64_t)start
{
  return self->_start;
}

- (void)setStart:(unint64_t)a3
{
  self->_unint64_t start = a3;
}

- (unint64_t)tokenDaemonStart
{
  return self->_tokenDaemonStart;
}

- (void)setTokenDaemonStart:(unint64_t)a3
{
  self->_unint64_t tokenDaemonStart = a3;
}

- (unint64_t)tokenDaemonEnd
{
  return self->_tokenDaemonEnd;
}

- (void)setTokenDaemonEnd:(unint64_t)a3
{
  self->_unint64_t tokenDaemonEnd = a3;
}

- (unint64_t)tokenStart
{
  return self->_tokenStart;
}

- (void)setTokenStart:(unint64_t)a3
{
  self->_unint64_t tokenStart = a3;
}

- (unint64_t)tokenEnd
{
  return self->_tokenEnd;
}

- (void)setTokenEnd:(unint64_t)a3
{
  self->_unint64_t tokenEnd = a3;
}

- (unint64_t)lsProxyStart
{
  return self->_lsProxyStart;
}

- (void)setLsProxyStart:(unint64_t)a3
{
  self->_unint64_t lsProxyStart = a3;
}

- (unint64_t)lsProxyEnd
{
  return self->_lsProxyEnd;
}

- (void)setLsProxyEnd:(unint64_t)a3
{
  self->_unint64_t lsProxyEnd = a3;
}

- (unint64_t)serverPostStart
{
  return self->_serverPostStart;
}

- (void)setServerPostStart:(unint64_t)a3
{
  self->_unint64_t serverPostStart = a3;
}

- (NSString)storefrontID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStorefrontID:(id)a3
{
}

- (NSString)status
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setStatus:(id)a3
{
}

- (NSString)errorCode
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setErrorCode:(id)a3
{
}

- (int64_t)retry
{
  return self->_retry;
}

- (void)setRetry:(int64_t)a3
{
  self->_retry = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (APUnfairLock)analyticsLock
{
  return (APUnfairLock *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAnalyticsLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsLock, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_storefrontID, 0);
}

@end