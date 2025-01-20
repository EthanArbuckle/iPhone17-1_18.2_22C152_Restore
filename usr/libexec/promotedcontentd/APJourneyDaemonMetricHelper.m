@interface APJourneyDaemonMetricHelper
- (APContentData)contentData;
- (APJourneyDaemonMetricHelper)initWithContentData:(id)a3;
- (void)conversionForBundleID:(id)a3 source:(id)a4 conversionValue:(signed __int16)a5;
- (void)discardedForBundleID:(id)a3 withCode:(int64_t)a4;
- (void)downloaded;
- (void)receivedForBundleID:(id)a3 adServer:(int64_t)a4 elapsedTime:(double)a5 relayValues:(id)a6 internalProperties:(id)a7;
- (void)receivedForBundleID:(id)a3 elapsedTime:(double)a4 relayValues:(id)a5 internalProperties:(id)a6;
- (void)recordMetric:(int64_t)a3 forPurpose:(int64_t)a4 bundleID:(id)a5 handleOverride:(id)a6 properties:(id)a7 internalProperties:(id)a8 relayData:(id)a9 order:(int64_t)a10 options:(int64_t)a11;
- (void)recordMetric:(int64_t)a3 forPurpose:(int64_t)a4 properties:(id)a5 internalProperties:(id)a6 order:(int64_t)a7 options:(int64_t)a8;
- (void)requestFailedForBundleID:(id)a3 withCode:(int64_t)a4 requestID:(id)a5 placement:(unint64_t)a6 placementType:(int64_t)a7;
- (void)requestFailedForBundleID:(id)a3 withCode:(int64_t)a4 requestID:(id)a5 placementType:(int64_t)a6;
@end

@implementation APJourneyDaemonMetricHelper

- (APJourneyDaemonMetricHelper)initWithContentData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APJourneyDaemonMetricHelper;
  v6 = [(APJourneyDaemonMetricHelper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentData, a3);
  }

  return v7;
}

- (void)recordMetric:(int64_t)a3 forPurpose:(int64_t)a4 properties:(id)a5 internalProperties:(id)a6 order:(int64_t)a7 options:(int64_t)a8
{
}

- (void)recordMetric:(int64_t)a3 forPurpose:(int64_t)a4 bundleID:(id)a5 handleOverride:(id)a6 properties:(id)a7 internalProperties:(id)a8 relayData:(id)a9 order:(int64_t)a10 options:(int64_t)a11
{
  id v31 = a5;
  id v15 = a6;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  v30 = +[MetricsModule storage];
  v19 = +[MetricsModuleClasses metricClass];
  v20 = [(APJourneyDaemonMetricHelper *)self contentData];
  v21 = [v20 identifier];
  v22 = [v20 contextIdentifier];
  v23 = [v22 UUIDString];

  if (v15)
  {
    id v24 = v15;
  }
  else
  {
    id v24 = [v20 journeyIdentifier];
  }
  v25 = v24;
  v26 = [v20 adServerEnvironment];
  id v27 = [[v19 alloc] initWithPurpose:a4 metric:a3 contentIdentifier:v21 contextIdentifier:v23 handle:v25 branch:0 properties:v18 internalProperties:v17 relayData:v16 environment:v26 order:a10 options:0];

  if ([v31 length]) {
    [v27 updateClientBundleID:v31];
  }
  [v30 receivedMetric:v27];
}

- (void)receivedForBundleID:(id)a3 elapsedTime:(double)a4 relayValues:(id)a5 internalProperties:(id)a6
{
}

- (void)receivedForBundleID:(id)a3 adServer:(int64_t)a4 elapsedTime:(double)a5 relayValues:(id)a6 internalProperties:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  CFStringRef v21 = @"elapsed";
  id v15 = +[NSNumber numberWithInteger:llround(a5 * 1000.0)];
  v22 = v15;
  id v16 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

  id v17 = APLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    int64_t v20 = (int64_t)v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Received event for client request %@", buf, 0xCu);
  }

  if ((a4 & 0x8000000000000000) == 0)
  {
    id v18 = APLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v20 = a4;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Received event from adserver %ld", buf, 0xCu);
    }
  }
  [(APJourneyDaemonMetricHelper *)self recordMetric:1000 forPurpose:100 bundleID:v12 handleOverride:0 properties:v16 internalProperties:v14 relayData:v13 order:0 options:0];
}

- (void)discardedForBundleID:(id)a3 withCode:(int64_t)a4
{
  CFStringRef v9 = @"code";
  id v6 = a3;
  v7 = +[NSNumber numberWithInteger:a4];
  v10 = v7;
  v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  -[APJourneyDaemonMetricHelper recordMetric:forPurpose:bundleID:handleOverride:properties:internalProperties:relayData:order:options:](self, "recordMetric:forPurpose:bundleID:handleOverride:properties:internalProperties:relayData:order:options:", 1001, 100, v6, 0, v8, 0, 0, 0, 0, v9);
}

- (void)conversionForBundleID:(id)a3 source:(id)a4 conversionValue:(signed __int16)a5
{
  uint64_t v5 = a5;
  CFStringRef v12 = @"source";
  CFStringRef v13 = @"conversion_value";
  v14[0] = a4;
  id v8 = a4;
  id v9 = a3;
  v10 = +[NSNumber numberWithShort:v5];
  v14[1] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:&v12 count:2];

  -[APJourneyDaemonMetricHelper recordMetric:forPurpose:bundleID:handleOverride:properties:internalProperties:relayData:order:options:](self, "recordMetric:forPurpose:bundleID:handleOverride:properties:internalProperties:relayData:order:options:", 1002, 100, v9, 0, v11, 0, 0, 0, 0, v12, v13, v14[0]);
}

- (void)downloaded
{
}

- (void)requestFailedForBundleID:(id)a3 withCode:(int64_t)a4 requestID:(id)a5 placementType:(int64_t)a6
{
}

- (void)requestFailedForBundleID:(id)a3 withCode:(int64_t)a4 requestID:(id)a5 placement:(unint64_t)a6 placementType:(int64_t)a7
{
  CFStringRef v18 = @"code";
  id v12 = a5;
  id v13 = a3;
  id v14 = +[NSNumber numberWithInteger:a4];
  v19 = v14;
  id v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  id v16 = [v15 mutableCopy];

  id v17 = +[APJourneyMetricAdapter translateWithPromotedContent:a7 placement:a6];
  [v16 addEntriesFromDictionary:v17];
  -[APJourneyDaemonMetricHelper recordMetric:forPurpose:bundleID:handleOverride:properties:internalProperties:relayData:order:options:](self, "recordMetric:forPurpose:bundleID:handleOverride:properties:internalProperties:relayData:order:options:", 1004, 100, v13, v12, v16, 0, 0, 0, 0, v18);
}

- (APContentData)contentData
{
  return self->_contentData;
}

- (void).cxx_destruct
{
}

@end