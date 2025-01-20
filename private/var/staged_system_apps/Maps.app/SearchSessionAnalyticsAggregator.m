@interface SearchSessionAnalyticsAggregator
+ (id)sharedAggregator;
- (BOOL)isAllowedSessionAnalytic:(id)a3;
- (id)collectedAnalytics;
- (void)collectSearchSessionAnalytics:(id)a3;
@end

@implementation SearchSessionAnalyticsAggregator

+ (id)sharedAggregator
{
  if (qword_101610A70 != -1) {
    dispatch_once(&qword_101610A70, &stru_10131AC48);
  }
  v2 = (void *)qword_101610A68;

  return v2;
}

- (id)collectedAnalytics
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(GEOSessionUserActionMetadata *)v2->_sessionUserActionMetadata sessionUserActionMetadata];
  v4 = sub_100109E50();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = @"YES";
    if (!v3) {
      v5 = @"NO";
    }
    v6 = v5;
    int v9 = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SearchSessionAnalyticsAggregator has analytis : %@", (uint8_t *)&v9, 0xCu);
  }
  if (!v3)
  {
    sessionUserActionMetadata = v2->_sessionUserActionMetadata;
    v2->_sessionUserActionMetadata = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)collectSearchSessionAnalytics:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_sessionUserActionMetadata)
  {
    v6 = (GEOSessionUserActionMetadata *)objc_alloc_init((Class)GEOSessionUserActionMetadata);
    sessionUserActionMetadata = v5->_sessionUserActionMetadata;
    v5->_sessionUserActionMetadata = v6;

    if ((unint64_t)GEOConfigGetUInteger() > 0x63) {
      uint64_t UInteger = 100;
    }
    else {
      uint64_t UInteger = GEOConfigGetUInteger();
    }
    v5->_maxCount = UInteger;
  }
  if ([(SearchSessionAnalyticsAggregator *)v5 isAllowedSessionAnalytic:v4])
  {
    [v5->_sessionUserActionMetadata captureSearchAction:[v4 action] searchTarget:[v4 target] maxCountToMaintain:v5->_maxCount];
  }
  else
  {
    int v9 = sub_100109E50();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v4 debugDescription];
      int v11 = 138412290;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SearchSessionAnalyticsAggregator is not allowed to log : %@", (uint8_t *)&v11, 0xCu);
    }
  }
  objc_sync_exit(v5);
}

- (BOOL)isAllowedSessionAnalytic:(id)a3
{
  id v3 = a3;
  int v4 = [v3 action];
  char v5 = 0;
  if (v4 <= 2006)
  {
    if (((v4 - 1001) > 0x2F || ((1 << (v4 + 23)) & 0x9F0000030209) == 0)
      && (v4 > 8 || ((1 << v4) & 0x186) == 0))
    {
      goto LABEL_15;
    }
LABEL_14:
    char v5 = 1;
    goto LABEL_15;
  }
  if (v4 > 2197)
  {
    if ((v4 - 9036) >= 2 && v4 != 2198) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if ((v4 - 2007) <= 0x18 && ((1 << (v4 + 41)) & 0x1000003) != 0 || v4 == 2099) {
    goto LABEL_14;
  }
LABEL_15:
  int v6 = [v3 target];

  char v7 = 0;
  if (v6 <= 501)
  {
    if ((v6 - 101) > 4 || v6 == 103) {
      return v5 & v7;
    }
LABEL_23:
    char v7 = 1;
    return v5 & v7;
  }
  if ((v6 - 502) <= 4 && ((1 << (v6 + 10)) & 0x13) != 0 || v6 == 1011 || v6 == 1009) {
    goto LABEL_23;
  }
  return v5 & v7;
}

- (void).cxx_destruct
{
}

@end