@interface MSDAnalyticsEventHandler
+ (id)sharedInstance;
- (MSDAnalyticsEventHandler)init;
- (NSArray)cellularTypeStrMapping;
- (NSDictionary)rawDataKeyMapping;
- (id)getDemoBundleInfo:(id)a3;
- (id)getDownloadSizeBucket:(int64_t)a3;
- (id)getEmbeddedSimCarrier:(id)a3;
- (id)getPhysicalSimCarrier:(id)a3;
- (id)prepareCAData:(int)a3;
- (void)sendAppUsageDataEvent:(id)a3 withExecutable:(id)a4 sessionUUID:(id)a5 sessionStart:(id)a6 sessionEnd:(id)a7 sessionDuration:(int64_t)a8 appOrder:(int64_t)a9 appDuration:(double)a10;
- (void)sendAutoEnrollmentAbortEvent:(id)a3 languageCode:(id)a4 countryCode:(id)a5 networkInformation:(id)a6 wifiSSID:(id)a7;
- (void)sendAutoEnrollmentResults:(id)a3;
- (void)sendBgDownloadPausedEvent:(int64_t)a3 forReason:(id)a4;
- (void)sendContentUpdateCompletedEvent:(int64_t)a3 withTimeTaken:(double)a4 cachingHubAvailable:(BOOL)a5 isCriticalUpdate:(BOOL)a6 contentUpdateType:(id)a7 andComponentSuccess:(int64_t)a8;
- (void)sendContentUpdateFailureEvent:(id)a3 isFatal:(BOOL)a4;
- (void)sendEnrollmentFailureEvent:(id)a3;
- (void)sendFMHFailureEvent:(id)a3;
- (void)sendFileDownloadSourceEvent:(id)a3;
- (void)sendHeartbeatEvent;
- (void)sendLastShallowRefreshTime:(id)a3;
- (void)sendNetworkAverageBandwidthEvent:(int64_t)a3 forServerType:(id)a4;
- (void)sendNetworkAverageRTTEvent:(int64_t)a3 forServerType:(id)a4;
- (void)sendNetworkFailureEvent:(id)a3 forServerType:(id)a4;
- (void)sendNetworkPacketLossEvent:(int64_t)a3 forServerType:(id)a4;
- (void)sendNetworkRawDataEvent:(id)a3 forServerType:(id)a4;
- (void)sendOSUpdateFailureEvent:(id)a3;
- (void)sendiCloudSigninFailureEvent:(id)a3;
- (void)setCellularTypeStrMapping:(id)a3;
- (void)setRawDataKeyMapping:(id)a3;
@end

@implementation MSDAnalyticsEventHandler

+ (id)sharedInstance
{
  if (qword_100189B48 != -1) {
    dispatch_once(&qword_100189B48, &stru_1001533B0);
  }
  v2 = (void *)qword_100189B40;

  return v2;
}

- (MSDAnalyticsEventHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSDAnalyticsEventHandler;
  v2 = [(MSDAnalyticsEventHandler *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MSDAnalyticsEventHandler *)v2 setRawDataKeyMapping:&off_100163020];
    v4 = +[NSArray arrayWithObjects:@"None", @"Physical", @"eSim", 0];
    [(MSDAnalyticsEventHandler *)v3 setCellularTypeStrMapping:v4];
  }
  return v3;
}

- (void)sendContentUpdateFailureEvent:(id)a3 isFatal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v15 = [(MSDAnalyticsEventHandler *)self prepareCAData:0];
  v7 = +[MSDProgressUpdater sharedInstance];
  v8 = [v7 bundleInProgress];

  v9 = [v8 bundleInfo];
  v10 = [(MSDAnalyticsEventHandler *)self getDemoBundleInfo:v9];

  [v15 setObject:v10 forKey:@"demoBundleInProgressInfo"];
  v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 code]);
  [v15 setObject:v11 forKey:@"errorCode"];

  v12 = [v6 localizedDescription];

  [v15 setObject:v12 forKey:@"errorMessage"];
  v13 = +[NSNumber numberWithBool:v4];
  [v15 setObject:v13 forKey:@"isFatal"];

  v14 = +[MSDAnalytics sharedInstance];
  [v14 sendEvent:@"com.apple.MobileStoreDemo.contentUpdateFailure" withPayload:v15];
}

- (void)sendiCloudSigninFailureEvent:(id)a3
{
  id v4 = a3;
  id v8 = [(MSDAnalyticsEventHandler *)self prepareCAData:0];
  v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 code]);
  [v8 setObject:v5 forKey:@"errorCode"];

  id v6 = [v4 localizedDescription];

  [v8 setObject:v6 forKey:@"errorMessage"];
  v7 = +[MSDAnalytics sharedInstance];
  [v7 sendEvent:@"com.apple.MobileStoreDemo.icloudSignInFailure" withPayload:v8];
}

- (void)sendOSUpdateFailureEvent:(id)a3
{
  id v4 = a3;
  id v8 = [(MSDAnalyticsEventHandler *)self prepareCAData:0];
  v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 code]);
  [v8 setObject:v5 forKey:@"errorCode"];

  id v6 = [v4 localizedDescription];

  [v8 setObject:v6 forKey:@"errorMessage"];
  v7 = +[MSDAnalytics sharedInstance];
  [v7 sendEvent:@"com.apple.MobileStoreDemo.osUpdateFailure" withPayload:v8];
}

- (void)sendFMHFailureEvent:(id)a3
{
  id v4 = a3;
  id v8 = [(MSDAnalyticsEventHandler *)self prepareCAData:0];
  v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 code]);
  [v8 setObject:v5 forKey:@"errorCode"];

  id v6 = [v4 localizedDescription];

  [v8 setObject:v6 forKey:@"errorMessage"];
  v7 = +[MSDAnalytics sharedInstance];
  [v7 sendEvent:@"com.apple.MobileStoreDemo.fmhFailure" withPayload:v8];
}

- (void)sendEnrollmentFailureEvent:(id)a3
{
  id v4 = a3;
  id v8 = [(MSDAnalyticsEventHandler *)self prepareCAData:0];
  v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 code]);
  [v8 setObject:v5 forKey:@"errorCode"];

  id v6 = [v4 localizedDescription];

  [v8 setObject:v6 forKey:@"errorMessage"];
  v7 = +[MSDAnalytics sharedInstance];
  [v7 sendEvent:@"com.apple.MobileStoreDemo.enrollmentFailure" withPayload:v8];
}

- (void)sendNetworkFailureEvent:(id)a3 forServerType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [(MSDAnalyticsEventHandler *)self prepareCAData:0];
  id v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 code]);
  [v11 setObject:v8 forKey:@"errorCode"];

  [v11 setObject:v6 forKey:@"serverType"];
  v9 = [v7 localizedDescription];

  [v11 setObject:v9 forKey:@"errorMessage"];
  v10 = +[MSDAnalytics sharedInstance];
  [v10 sendEvent:@"com.apple.MobileStoreDemo.networkFailure" withPayload:v11];
}

- (void)sendContentUpdateCompletedEvent:(int64_t)a3 withTimeTaken:(double)a4 cachingHubAvailable:(BOOL)a5 isCriticalUpdate:(BOOL)a6 contentUpdateType:(id)a7 andComponentSuccess:(int64_t)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v14 = a7;
  id v26 = [(MSDAnalyticsEventHandler *)self prepareCAData:0];
  id v15 = +[MSDProgressUpdater sharedInstance];
  v16 = [v15 bundleInProgress];

  v17 = [v16 bundleInfo];
  v18 = [(MSDAnalyticsEventHandler *)self getDemoBundleInfo:v17];

  [v26 setObject:v18 forKey:@"demoBundleInProgressInfo"];
  v19 = +[NSNumber numberWithLongLong:a3];
  [v26 setObject:v19 forKey:@"downloadSize"];

  v20 = [(MSDAnalyticsEventHandler *)self getDownloadSizeBucket:a3];
  [v26 setObject:v20 forKey:@"downloadSizeBucket"];

  v21 = +[NSNumber numberWithBool:v10];
  [v26 setObject:v21 forKey:@"isCachingHubAvailable"];

  v22 = +[NSNumber numberWithBool:v9];
  [v26 setObject:v22 forKey:@"isCriticalUpdate"];

  [v26 setObject:v14 forKey:@"contentUpdateType"];
  v23 = +[NSNumber numberWithDouble:a4];
  [v26 setObject:v23 forKey:@"timeTaken"];

  v24 = +[NSNumber numberWithInt:a8];
  [v26 setObject:v24 forKey:@"componentSuccessPercent"];

  v25 = +[MSDAnalytics sharedInstance];
  [v25 sendEvent:@"com.apple.MobileStoreDemo.contentUpdateCompleted" withPayload:v26];
}

- (void)sendBgDownloadPausedEvent:(int64_t)a3 forReason:(id)a4
{
  id v6 = a4;
  id v9 = [(MSDAnalyticsEventHandler *)self prepareCAData:0];
  id v7 = +[NSNumber numberWithInt:a3];
  [v9 setObject:v7 forKey:@"pauseDuration"];

  [v9 setObject:v6 forKey:@"pauseReason"];
  id v8 = +[MSDAnalytics sharedInstance];
  [v8 sendEvent:@"com.apple.MobileStoreDemo.bgDownloadPaused" withPayload:v9];
}

- (void)sendFileDownloadSourceEvent:(id)a3
{
  id v4 = a3;
  id v6 = [(MSDAnalyticsEventHandler *)self prepareCAData:0];
  [v6 setObject:v4 forKey:@"fileDownloadSource"];

  v5 = +[MSDAnalytics sharedInstance];
  [v5 sendEvent:@"com.apple.MobileStoreDemo.fileDownloadSource" withPayload:v6];
}

- (void)sendNetworkAverageRTTEvent:(int64_t)a3 forServerType:(id)a4
{
  id v6 = a4;
  id v9 = [(MSDAnalyticsEventHandler *)self prepareCAData:0];
  id v7 = +[NSNumber numberWithInt:a3];
  [v9 setObject:v7 forKey:@"avgRTT"];

  [v9 setObject:v6 forKey:@"serverType"];
  id v8 = +[MSDAnalytics sharedInstance];
  [v8 sendEvent:@"com.apple.MobileStoreDemo.networkRTT" withPayload:v9];
}

- (void)sendNetworkPacketLossEvent:(int64_t)a3 forServerType:(id)a4
{
  id v6 = a4;
  id v9 = [(MSDAnalyticsEventHandler *)self prepareCAData:0];
  id v7 = +[NSNumber numberWithInt:a3];
  [v9 setObject:v7 forKey:@"packetLoss"];

  [v9 setObject:v6 forKey:@"serverType"];
  id v8 = +[MSDAnalytics sharedInstance];
  [v8 sendEvent:@"com.apple.MobileStoreDemo.networkPacketLoss" withPayload:v9];
}

- (void)sendNetworkAverageBandwidthEvent:(int64_t)a3 forServerType:(id)a4
{
  id v6 = a4;
  id v9 = [(MSDAnalyticsEventHandler *)self prepareCAData:0];
  id v7 = +[NSNumber numberWithInt:a3];
  [v9 setObject:v7 forKey:@"avgBandwidth"];

  [v9 setObject:v6 forKey:@"serverType"];
  id v8 = +[MSDAnalytics sharedInstance];
  [v8 sendEvent:@"com.apple.MobileStoreDemo.networkBandwidth" withPayload:v9];
}

- (void)sendNetworkRawDataEvent:(id)a3 forServerType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSDAnalyticsEventHandler *)self prepareCAData:0];
  uint64_t v9 = [v6 objectForKey:@"_kCFNTimingDataResponseEnd"];
  if (v9)
  {
    BOOL v10 = (void *)v9;
    id v11 = [v6 objectForKey:@"_kCFNTimingDataResponseStart"];

    if (v11)
    {
      v12 = [v6 objectForKey:@"_kCFNTimingDataResponseEnd"];
      [v12 doubleValue];
      double v14 = v13;

      id v15 = [v6 objectForKey:@"_kCFNTimingDataResponseStart"];
      [v15 doubleValue];
      double v17 = v16;

      v18 = +[NSNumber numberWithDouble:v14 - v17];
      [v8 setObject:v18 forKey:@"responseDuration"];
    }
  }
  uint64_t v19 = [v6 objectForKey:@"_kCFNTimingDataRequestEnd"];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [v6 objectForKey:@"_kCFNTimingDataRequestStart"];

    if (v21)
    {
      v22 = [v6 objectForKey:@"_kCFNTimingDataRequestEnd"];
      [v22 doubleValue];
      double v24 = v23;

      v25 = [v6 objectForKey:@"_kCFNTimingDataRequestStart"];
      [v25 doubleValue];
      double v27 = v26;

      v28 = +[NSNumber numberWithDouble:v24 - v27];
      [v8 setObject:v28 forKey:@"requestDuration"];
    }
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v29 = v6;
  id v30 = [v29 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v40;
    do
    {
      v33 = 0;
      do
      {
        if (*(void *)v40 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v39 + 1) + 8 * (void)v33);
        v35 = [(MSDAnalyticsEventHandler *)self rawDataKeyMapping];
        v36 = [v35 objectForKey:v34];

        if (v36)
        {
          v37 = [v29 objectForKeyedSubscript:v34];
          [v8 setObject:v37 forKey:v36];
        }
        v33 = (char *)v33 + 1;
      }
      while (v31 != v33);
      id v31 = [v29 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v31);
  }

  [v8 setObject:v7 forKey:@"serverType"];
  v38 = +[MSDAnalytics sharedInstance];
  [v38 sendEvent:@"com.apple.MobileStoreDemo.networkRawData" withPayload:v8];
}

- (void)sendAppUsageDataEvent:(id)a3 withExecutable:(id)a4 sessionUUID:(id)a5 sessionStart:(id)a6 sessionEnd:(id)a7 sessionDuration:(int64_t)a8 appOrder:(int64_t)a9 appDuration:(double)a10
{
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v27 = [(MSDAnalyticsEventHandler *)self prepareCAData:1];
  [v27 setObject:v21 forKey:@"bundleID"];

  [v27 setObject:v20 forKey:@"executableName"];
  [v27 setObject:v19 forKey:@"sessionUUID"];

  [v27 setObject:v18 forKey:@"sessionStartTime"];
  [v27 setObject:v17 forKey:@"sessionEndTime"];

  v22 = +[NSNumber numberWithInteger:a8];
  [v27 setObject:v22 forKey:@"sessionDuration"];

  double v23 = +[NSNumber numberWithInteger:a9];
  [v27 setObject:v23 forKey:@"appOrder"];

  *(float *)&double v24 = a10;
  v25 = +[NSNumber numberWithFloat:v24];
  [v27 setObject:v25 forKey:@"appDuration"];

  double v26 = +[MSDAnalytics sharedInstance];
  [v26 sendEvent:@"com.apple.MobileStoreDemo.appUsage" withPayload:v27];
}

- (void)sendHeartbeatEvent
{
  id v3 = [(MSDAnalyticsEventHandler *)self prepareCAData:1];
  v2 = +[MSDAnalytics sharedInstance];
  [v2 sendEvent:@"com.apple.MobileStoreDemo.heartbeat" withPayload:v3];
}

- (void)sendLastShallowRefreshTime:(id)a3
{
  id v4 = a3;
  id v9 = [(MSDAnalyticsEventHandler *)self prepareCAData:1];
  [v4 timeIntervalSince1970];
  double v6 = v5;

  id v7 = +[NSString stringWithFormat:@"%lld", (uint64_t)v6];
  [v9 setObject:v7 forKey:@"LastShallowRefreshTime"];
  id v8 = +[MSDAnalytics sharedInstance];
  [v8 sendEvent:@"com.apple.MobileStoreDemo.lastShallowRefreshTime" withPayload:v9];
}

- (void)sendAutoEnrollmentResults:(id)a3
{
  id v27 = a3;
  id v4 = [(MSDAnalyticsEventHandler *)self prepareCAData:1];
  double v5 = [v27 objectForKey:@"AutoEnrollmentTimeStamp"];
  [v5 timeIntervalSince1970];
  double v7 = v6;

  id v8 = +[NSString stringWithFormat:@"%d", (int)v7];
  [v4 setObject:v8 forKey:@"AutoEnrollmentTimeStamp"];
  id v9 = [v27 objectForKey:@"AutoEnrollmentStatus"];
  [v4 setObject:v9 forKey:@"AutoEnrollmentStatus"];

  BOOL v10 = [v27 objectForKey:@"ErrorCode"];
  [v4 setObject:v10 forKey:@"errorCode"];

  id v11 = [v27 objectForKey:@"ErrorMessage"];

  if (v11)
  {
    v12 = [v27 objectForKey:@"ErrorMessage"];
    [v4 setObject:v12 forKey:@"errorMessage"];
  }
  else
  {
    [v4 setObject:@"<NOT_SET>" forKey:@"errorMessage"];
  }
  double v13 = [v27 objectForKey:@"AutoEnrollmentSelectedStoreID"];

  if (v13)
  {
    double v14 = [v27 objectForKey:@"AutoEnrollmentSelectedStoreID"];
    [v4 setObject:v14 forKey:@"AutoEnrollmentSelectedStoreID"];
  }
  else
  {
    [v4 setObject:@"<NOT_SET>" forKey:@"errorMessage"];
  }
  id v15 = [v27 objectForKey:@"AutoEnrollmentNetworkInfo"];
  double v16 = [(MSDAnalyticsEventHandler *)self getPhysicalSimCarrier:v15];

  id v17 = [v27 objectForKey:@"AutoEnrollmentNetworkInfo"];
  id v18 = [(MSDAnalyticsEventHandler *)self getEmbeddedSimCarrier:v17];

  [v4 setObject:v16 forKey:@"AutoEnrollmentPhyscialSIMCarrier"];
  [v4 setObject:v18 forKey:@"AutoEnrollmentEmbeddedSIMCarrier"];
  id v19 = [v27 objectForKey:@"AutoEnrollmentWiFiSSID"];
  [v4 setObject:v19 forKey:@"AutoEnrollmentWiFiSSID"];

  id v20 = [v27 objectForKey:@"AutoEnrollmentHelpMenuUserTapped"];

  if (v20)
  {
    id v21 = [v27 objectForKey:@"AutoEnrollmentHelpMenuUserTapped"];
    v22 = [v21 allObjects];
    double v23 = [v22 componentsJoinedByString:@", "];

    [v4 setObject:v23 forKey:@"AutoEnrollmentHelpMenuUserTapped"];
  }
  double v24 = [v27 objectForKey:@"AutoEnrollmentLanguageCodeInfo"];
  [v4 setObject:v24 forKey:@"AutoEnrollmentLanguageCodeInfo"];

  v25 = [v27 objectForKey:@"AutoEnrollmentCountryCodeInfo"];
  [v4 setObject:v25 forKey:@"AutoEnrollmentCountryCodeInfo"];

  double v26 = +[MSDAnalytics sharedInstance];
  [v26 sendEvent:@"com.apple.MobileStoreDemo.autoEnrollment" withPayload:v4];
}

- (void)sendAutoEnrollmentAbortEvent:(id)a3 languageCode:(id)a4 countryCode:(id)a5 networkInformation:(id)a6 wifiSSID:(id)a7
{
  id v23 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  double v16 = [(MSDAnalyticsEventHandler *)self prepareCAData:1];
  id v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v23 code]);
  [v16 setObject:v17 forKey:@"errorCode"];

  id v18 = [v23 localizedDescription];

  if (v18)
  {
    id v19 = [v23 localizedDescription];
    [v16 setObject:v19 forKey:@"errorMessage"];
  }
  [v16 setObject:v12 forKey:@"AutoEnrollmentAbortLanguageCodeInfo"];
  [v16 setObject:v15 forKey:@"AutoEnrollmentAbortCountryCodeInfo"];

  id v20 = [(MSDAnalyticsEventHandler *)self getPhysicalSimCarrier:v14];
  id v21 = [(MSDAnalyticsEventHandler *)self getEmbeddedSimCarrier:v14];

  [v16 setObject:v20 forKey:@"AutoEnrollmentPhyscialSIMCarrier"];
  [v16 setObject:v21 forKey:@"AutoEnrollmentEmbeddedSIMCarrier"];
  [v16 setObject:v13 forKey:@"AutoEnrollmentWiFiSSID"];

  v22 = +[MSDAnalytics sharedInstance];
  [v22 sendEvent:@"com.apple.MobileStoreDemo.autoEnrollmentAbort" withPayload:v16];
}

- (id)prepareCAData:(int)a3
{
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  double v6 = +[MSDTargetDevice sharedInstance];
  double v7 = [v6 getDeviceOptions];
  id v8 = [v7 objectForKey:@"store_id"];

  if (v8)
  {
    id v9 = [v6 getDeviceOptions];
    BOOL v10 = [v9 objectForKey:@"store_id"];
  }
  else
  {
    BOOL v10 = @"<unknown>";
  }
  [v5 setObject:v10 forKey:@"storeID"];
  id v11 = [v6 serialNumber];
  [v5 setObject:v11 forKey:@"deviceSerialNumber"];
  if (a3 == 1)
  {
    id v12 = +[MSDTargetDevice sharedInstance];
    id v13 = [v12 getDeviceOptions];

    id v14 = [v13 objectForKey:@"store_type"];

    if (v14)
    {
      CFStringRef v15 = [v13 objectForKey:@"store_type"];
    }
    else
    {
      CFStringRef v15 = @"<unknown>";
    }
    uint64_t v34 = (__CFString *)v15;
    [v5 setObject:v15 forKey:@"storeType"];
    double v16 = +[MSDProgressUpdater sharedInstance];
    id v17 = [v16 installedBundle];

    id v18 = [v17 bundleInfo];
    uint64_t v19 = [(MSDAnalyticsEventHandler *)self getDemoBundleInfo:v18];

    v33 = (void *)v19;
    [v5 setObject:v19 forKey:@"demoBundleInfo"];
    id v20 = objc_alloc_init((Class)NSDateFormatter);
    [v20 setDateFormat:@"yyyy-MM-dd"];
    id v21 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US"];
    [v20 setLocale:v21];

    id v22 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSGregorianCalendar];
    [v20 setCalendar:v22];

    id v23 = [v17 getLastBundleUpdateDate];
    double v24 = v23;
    v35 = v13;
    if (v23 && ([v23 isEqualToString:@"<unknown>"] & 1) == 0)
    {
      id v26 = objc_alloc_init((Class)NSDateFormatter);
      [v26 setDateFormat:@"yyyy-MM-dd"];
      id v27 = [v26 dateFromString:v24];
      v25 = [v20 stringFromDate:v27];

      if (!v25)
      {
        v28 = sub_100068600();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          sub_1000D38B8(v28);
        }

        v25 = @"<unknown>";
      }
    }
    else
    {

      v25 = @"<unknown>";
    }
    [v5 setObject:v25 forKey:@"lastBundleUpdateDate"];
    id v29 = +[NSDate date];
    id v30 = [v20 stringFromDate:v29];

    if (!v30)
    {
      id v31 = sub_100068600();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        sub_1000D3874(v31);
      }

      id v30 = @"<unknown>";
    }
    [v5 setObject:v30 forKey:@"localDate"];
  }

  return v5;
}

- (id)getDownloadSizeBucket:(int64_t)a3
{
  id v4 = +[NSString stringWithFormat:@"%ld-%ld GB", a3 / 1000000000, a3 / 1000000000 + 1];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000D38FC((uint64_t)v4, a3, v5);
  }

  return v4;
}

- (id)getDemoBundleInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"BundleName"];

  if (v4)
  {
    id v5 = [v3 objectForKey:@"BundleName"];
  }
  else
  {
    id v5 = @"<unknown>";
  }
  double v6 = [v3 objectForKey:@"PartNumber"];

  if (v6)
  {
    double v7 = [v3 objectForKey:@"PartNumber"];
  }
  else
  {
    double v7 = @"<unknown>";
  }
  id v8 = [v3 objectForKey:@"Revision"];

  if (v8)
  {
    id v9 = [v3 objectForKey:@"Revision"];
  }
  else
  {
    id v9 = @"<unknown>";
  }
  BOOL v10 = +[NSString stringWithFormat:@"%@.%@.%@", v5, v7, v9];

  return v10;
}

- (id)getPhysicalSimCarrier:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = &stru_100155450;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        BOOL v10 = [v9 objectForKeyedSubscript:@"SimType"];
        if ([v10 isEqualToNumber:&off_1001621C8])
        {
          double v7 = [v9 objectForKeyedSubscript:@"Provider"];

          goto LABEL_12;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v7 = &stru_100155450;
  }
LABEL_12:

  return v7;
}

- (id)getEmbeddedSimCarrier:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = &stru_100155450;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        BOOL v10 = [v9 objectForKeyedSubscript:@"SimType"];
        if ([v10 isEqualToNumber:&off_1001621E0])
        {
          double v7 = [v9 objectForKeyedSubscript:@"Provider"];

          goto LABEL_12;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v7 = &stru_100155450;
  }
LABEL_12:

  return v7;
}

- (NSDictionary)rawDataKeyMapping
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRawDataKeyMapping:(id)a3
{
}

- (NSArray)cellularTypeStrMapping
{
  return self->_cellularTypeStrMapping;
}

- (void)setCellularTypeStrMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularTypeStrMapping, 0);

  objc_storeStrong((id *)&self->_rawDataKeyMapping, 0);
}

@end