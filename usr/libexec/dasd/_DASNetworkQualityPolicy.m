@interface _DASNetworkQualityPolicy
+ (BOOL)shouldReportOversizeLoadForTransferSize:(unint64_t)a3 withContext:(id)a4;
+ (id)policyInstance;
+ (int64_t)currentNetworkQualityWithContext:(id)a3 interface:(int64_t *)a4;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)inDiscountedHoursAtDate:(id)a3;
- (BOOL)inLowCongestionHoursAtDate:(id)a3;
- (BOOL)isiCloudKeychainActivity:(id)a3;
- (BOOL)privateNetworkCellConnection;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (BOOL)smartDataModeEnabled;
- (BOOL)unconstrainedNetworkAvailableForActivity:(id)a3 withContext:(id)a4 withRationale:(id)a5;
- (CoreTelephonyClient)coreTelephonyClient;
- (NSArray)triggers;
- (NSDictionary)discountedHours;
- (NSDictionary)lowCongestionHours;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_queue)telephonyQueue;
- (OS_dispatch_source)refreshHoursTimer;
- (_CDContext)userContext;
- (_CDContextualKeyPath)cellStatus;
- (_CDContextualKeyPath)wifiStatus;
- (_CDContextualKeyPath)wiredStatus;
- (_DASNetworkEvaluationMonitor)networkEvaluator;
- (_DASNetworkQualityPolicy)init;
- (_DKPredictionTimeline)cellPredictionTimeline;
- (_DKPredictionTimeline)wifiPredictionTimeline;
- (double)companionScoreForActivity:(id)a3 networkQuality:(int64_t)a4 interface:(int64_t)a5 interfaceSubtype:(int64_t)a6 pluginStatus:(BOOL)a7 radioHot:(BOOL)a8 linkAvailable:(BOOL *)a9;
- (double)predictedScoreForActivity:(id)a3 atDate:(id)a4;
- (double)scoreForActivity:(id)a3 networkQuality:(int64_t)a4 interface:(int64_t)a5 interfaceSubtype:(int64_t)a6 pluginStatus:(BOOL)a7 radioHot:(BOOL)a8 linkAvailable:(BOOL *)a9;
- (double)scoreWithInexpensiveCellForActivity:(id)a3 networkQuality:(int64_t)a4 interface:(int64_t)a5 radioHot:(BOOL)a6;
- (double)weightForActivity:(id)a3;
- (id)initializeCoreTelephonyClient;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int)transferSizeIndex:(unint64_t)a3;
- (int64_t)companionMinimumQualityForActivity:(id)a3 interface:(int64_t)a4;
- (int64_t)minimumQualityForActivity:(id)a3 interface:(int64_t)a4 interfaceSubtype:(int64_t)a5;
- (void)clearOffPeakDiscountedHours;
- (void)loadCTInformationWithSDM:(BOOL)a3;
- (void)parseCTCongestionHoursDictionary:(id)a3 atDate:(id)a4;
- (void)preferredDataSimChanged:(id)a3;
- (void)registerForPredictionChanges;
- (void)setCellPredictionTimeline:(id)a3;
- (void)setCellStatus:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setDiscountedHours:(id)a3;
- (void)setLowCongestionHours:(id)a3;
- (void)setNetworkEvaluator:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setPrivateNetworkCellConnection:(BOOL)a3;
- (void)setRefreshHoursTimer:(id)a3;
- (void)setSmartDataModeEnabled:(BOOL)a3;
- (void)setTelephonyQueue:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setUserContext:(id)a3;
- (void)setWifiPredictionTimeline:(id)a3;
- (void)setWifiStatus:(id)a3;
- (void)setWiredStatus:(id)a3;
- (void)smartDataModeChanged:(id)a3 userEnabled:(BOOL)a4;
- (void)updatePNWStatus:(BOOL)a3;
- (void)updateSystemConstraintsWithContext:(id)a3;
@end

@implementation _DASNetworkQualityPolicy

- (BOOL)appliesToActivity:(id)a3
{
  return [a3 requiresNetwork];
}

- (id)initializeTriggers
{
  v10 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_wifiStatus];
  v9 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_wiredStatus];
  v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_cellStatus];
  v15[0] = @"identifier";
  v15[1] = @"predicate";
  v16[0] = @"com.apple.duetactivityscheduler.nwstatus.wifi";
  v16[1] = v10;
  v15[2] = @"deviceSet";
  v15[3] = @"mustWake";
  v16[2] = &off_100186E08;
  v16[3] = &__kCFBooleanTrue;
  v4 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  v17[0] = v4;
  v13[0] = @"identifier";
  v13[1] = @"predicate";
  v14[0] = @"com.apple.duetactivityscheduler.nwstatus.wired";
  v14[1] = v9;
  v13[2] = @"deviceSet";
  v13[3] = @"mustWake";
  v14[2] = &off_100186E08;
  v14[3] = &__kCFBooleanTrue;
  v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  v17[1] = v5;
  v11[0] = @"identifier";
  v11[1] = @"predicate";
  v12[0] = @"com.apple.duetactivityscheduler.nwstatus.cell";
  v12[1] = v3;
  v11[2] = @"deviceSet";
  v11[3] = @"mustWake";
  v12[2] = &off_100186E08;
  v12[3] = &__kCFBooleanTrue;
  v6 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  v17[2] = v6;
  v7 = +[NSArray arrayWithObjects:v17 count:3];

  return v7;
}

- (void)registerForPredictionChanges
{
  v3 = +[_CDClientContext userContext];
  v4 = [v3 objectForKeyedSubscript:self->_wifiStatus];

  v5 = +[_CDNetworkContext predictionKey];
  v6 = [v4 objectForKeyedSubscript:v5];

  objc_storeStrong((id *)&self->_wifiPredictionTimeline, v6);
  v7 = +[_DASDaemonLogger logForCategory:@"predictions"];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000F65F8();
  }

  +[_DASPredictionManager setPrediction:v6 forKey:@"wifiPredictions"];
  v8 = +[_DASPLLogger sharedInstance];
  [v8 recordPrediction:v6 key:@"wiFiAssociatedPrediction" valueMultiplier:1];

  v9 = +[_CDClientContext userContext];
  v10 = [v9 objectForKeyedSubscript:self->_cellStatus];

  v11 = +[_CDNetworkContext predictionKey];
  v12 = [v10 objectForKeyedSubscript:v11];

  objc_storeStrong((id *)&self->_cellPredictionTimeline, v12);
  v13 = +[_DASDaemonLogger logForCategory:@"predictions"];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1000F658C();
  }

  +[_DASPredictionManager setPrediction:v12 forKey:@"cellPredictions"];
  v14 = +[_DASPLLogger sharedInstance];
  [v14 recordPrediction:v12 key:@"cellQualityPrediction" valueMultiplier:1];

  v15 = +[_CDContextPredictionQueries keyPathForWiFiQualityPrediction];
  v16 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v15];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10005D4E4;
  v25[3] = &unk_100176620;
  v25[4] = self;
  id v26 = v15;
  id v17 = v15;
  v18 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.duetactivityscheduler.wifiqualityprediction" contextualPredicate:v16 callback:v25];

  [(_CDContext *)self->_userContext registerCallback:v18];
  v19 = +[_CDContextPredictionQueries keyPathForCellQualityPrediction];
  v20 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v19];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10005D5F8;
  v23[3] = &unk_100176620;
  v23[4] = self;
  id v24 = v19;
  id v21 = v19;
  v22 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.duetactivityscheduler.cellqualityprediction" contextualPredicate:v20 callback:v23];

  [(_CDContext *)self->_userContext registerCallback:v22];
}

- (_DASNetworkQualityPolicy)init
{
  v30.receiver = self;
  v30.super_class = (Class)_DASNetworkQualityPolicy;
  v2 = [(_DASNetworkQualityPolicy *)&v30 init];
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Network Quality Policy";

    uint64_t v5 = +[_CDNetworkContext keyPathForWiFiConnectionStatus];
    wifiStatus = v3->_wifiStatus;
    v3->_wifiStatus = (_CDContextualKeyPath *)v5;

    uint64_t v7 = +[_DASNetworkEvaluationMonitor sharedInstance];
    networkEvaluator = v3->_networkEvaluator;
    v3->_networkEvaluator = (_DASNetworkEvaluationMonitor *)v7;

    uint64_t v9 = +[_CDClientContext userContext];
    userContext = v3->_userContext;
    v3->_userContext = (_CDContext *)v9;

    uint64_t v11 = +[_CDNetworkContext keyPathForWiredConnectionStatus];
    wiredStatus = v3->_wiredStatus;
    v3->_wiredStatus = (_CDContextualKeyPath *)v11;

    uint64_t v13 = +[_CDNetworkContext keyPathForCellConnectionStatus];
    cellStatus = v3->_cellStatus;
    v3->_cellStatus = (_CDContextualKeyPath *)v13;

    uint64_t v15 = [(_DASNetworkQualityPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v15;

    [(_DASNetworkQualityPolicy *)v3 clearOffPeakDiscountedHours];
    id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.dasd.networkqualitypolicy.telephony", v17);
    telephonyQueue = v3->_telephonyQueue;
    v3->_telephonyQueue = (OS_dispatch_queue *)v18;

    id v20 = [(_DASNetworkQualityPolicy *)v3 initializeCoreTelephonyClient];
    dispatch_source_t v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v3->_telephonyQueue);
    refreshHoursTimer = v3->_refreshHoursTimer;
    v3->_refreshHoursTimer = (OS_dispatch_source *)v21;

    v23 = v3->_refreshHoursTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10005D934;
    handler[3] = &unk_1001754F8;
    id v24 = v3;
    v29 = v24;
    dispatch_source_set_event_handler(v23, handler);
    v25 = v3->_refreshHoursTimer;
    dispatch_time_t v26 = dispatch_walltime(0, 21600000000000);
    dispatch_source_set_timer(v25, v26, 0x13A52453C000uLL, 0x3B9ACA00uLL);
    dispatch_activate((dispatch_object_t)v3->_refreshHoursTimer);
    [(_DASNetworkQualityPolicy *)v24 loadCTInformationWithSDM:1];
  }
  return v3;
}

- (void)clearOffPeakDiscountedHours
{
  [(_DASNetworkQualityPolicy *)self setLowCongestionHours:&__NSDictionary0__struct];

  [(_DASNetworkQualityPolicy *)self setDiscountedHours:&__NSDictionary0__struct];
}

- (void)parseCTCongestionHoursDictionary:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!qword_1001C3F58)
  {
    uint64_t v8 = +[NSCalendar currentCalendar];
    uint64_t v9 = (void *)qword_1001C3F58;
    qword_1001C3F58 = v8;
  }
  v10 = +[NSDate distantFuture];
  uint64_t v11 = [v6 objectForKeyedSubscript:@"ExpirationDate"];
  if (v11)
  {
    id v12 = objc_alloc_init((Class)NSISO8601DateFormatter);
    uint64_t v13 = [v12 dateFromString:v11];
    v14 = v13;
    if (v13)
    {
      uint64_t v15 = self;
      id v16 = v13;

      id v17 = +[_DASDaemonLogger logForCategory:@"carrierBundle"];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v91 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Expiration Date is %@", buf, 0xCu);
      }

      v10 = v16;
      self = v15;
    }
  }
  [v10 timeIntervalSinceDate:v7];
  if (v18 >= 0.0)
  {
    v67 = v10;
    v68 = self;
    v69 = v11;
    v73 = [(id)qword_1001C3F58 components:540 fromDate:v7];
    id v70 = v6;
    v71 = [v6 objectForKeyedSubscript:@"TimeWindows"];
    id v20 = +[NSMutableDictionary dictionary];
    dispatch_source_t v21 = +[NSMutableDictionary dictionary];
    id v77 = objc_alloc_init((Class)NSDateFormatter);
    [v77 setDateFormat:@"HH:mm:SS"];
    uint64_t v22 = 0;
    v75 = v21;
    id v72 = v7;
    v76 = v20;
    do
    {
      uint64_t v74 = v22;
      uint64_t v78 = (int)(v22 + [v73 weekday] - 1) % 7;
      v23 = [&off_100187A38 objectAtIndexedSubscript:];
      id v24 = [v71 objectForKeyedSubscript:v23];

      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id obj = v24;
      id v83 = [obj countByEnumeratingWithState:&v86 objects:v98 count:16];
      if (v83)
      {
        uint64_t v82 = *(void *)v87;
        uint64_t v25 = v78 + 1;
        do
        {
          for (i = 0; i != v83; i = (char *)i + 1)
          {
            if (*(void *)v87 != v82) {
              objc_enumerationMutation(obj);
            }
            v27 = *(void **)(*((void *)&v86 + 1) + 8 * i);
            v85 = [v27 objectForKeyedSubscript:@"WindowType"];
            uint64_t v28 = [v27 objectForKeyedSubscript:@"StartTime"];
            uint64_t v29 = [v27 objectForKeyedSubscript:@"EndTime"];
            objc_super v30 = (void *)v28;
            v31 = (void *)v29;
            if (v30) {
              BOOL v32 = v29 == 0;
            }
            else {
              BOOL v32 = 1;
            }
            v84 = v30;
            if (v32)
            {
              v33 = +[_DASDaemonLogger logForCategory:@"carrierBundle"];
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                v34 = [&off_100187A38 objectAtIndexedSubscript:v78];
                *(_DWORD *)buf = 138412802;
                id v91 = v34;
                __int16 v92 = 2112;
                v93 = v84;
                __int16 v94 = 2112;
                v95 = v31;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Error reading times for %@ (%@-%@)", buf, 0x20u);
              }
            }
            else
            {
              v35 = [v77 dateFromString:x0];
              v36 = [v77 dateFromString:v31];
              v37 = +[_DASDaemonLogger logForCategory:@"carrierBundle"];
              BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
              if (v35) {
                BOOL v39 = v36 == 0;
              }
              else {
                BOOL v39 = 1;
              }
              if (v39)
              {
                if (v38)
                {
                  v40 = [&off_100187A38 objectAtIndexedSubscript:v78];
                  *(_DWORD *)buf = 138412802;
                  id v91 = v40;
                  __int16 v92 = 2112;
                  v93 = v84;
                  __int16 v94 = 2112;
                  v95 = v31;
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Error parsing times for %@ (%@-%@)", buf, 0x20u);
                }
                v33 = v35;
              }
              else
              {
                if (v38)
                {
                  v41 = [&off_100187A38 objectAtIndexedSubscript:v78];
                  *(_DWORD *)buf = 138413058;
                  id v91 = v85;
                  __int16 v92 = 2112;
                  v93 = v84;
                  __int16 v94 = 2112;
                  v95 = v31;
                  __int16 v96 = 2112;
                  v97 = v41;
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%@ hours are %@-%@ for %@", buf, 0x2Au);
                }
                v37 = [v73 copy];
                -[NSObject setDay:](v37, "setDay:", (char *)[v73 day] + v74);
                -[NSObject setHour:](v37, "setHour:", [(id)qword_1001C3F58 component:32 fromDate:v35]);
                -[NSObject setMinute:](v37, "setMinute:", [(id)qword_1001C3F58 component:64 fromDate:v35]);
                -[NSObject setSecond:](v37, "setSecond:", [(id)qword_1001C3F58 component:128 fromDate:v35]);
                v33 = [(id)qword_1001C3F58 dateFromComponents:v37];

                -[NSObject setHour:](v37, "setHour:", [(id)qword_1001C3F58 component:32 fromDate:v36]);
                -[NSObject setMinute:](v37, "setMinute:", [(id)qword_1001C3F58 component:64 fromDate:v36]);
                -[NSObject setSecond:](v37, "setSecond:", [(id)qword_1001C3F58 component:128 fromDate:v36]);
                v42 = [(id)qword_1001C3F58 dateFromComponents:v37];

                [v42 timeIntervalSinceDate:v33];
                if (v43 >= 0.0)
                {
                  v36 = v42;
                }
                else
                {
                  v36 = [v42 dateByAddingTimeInterval:86400.0];
                }
                [v36 timeIntervalSinceDate:v33];
                double v45 = round(v44 * 0.5);
                if (v45 > 10800.0) {
                  double v45 = 10800.0;
                }
                v46 = [v33 dateByAddingTimeInterval:(double)arc4random_uniform(fmax(v45, 0.0))];
                [v7 timeIntervalSinceDate:v36];
                double v48 = v47;
                id v49 = objc_alloc((Class)NSDateInterval);
                v50 = v49;
                v80 = v46;
                if (v48 <= 0.0)
                {
                  id v81 = [v49 initWithStartDate:v46 endDate:v36];
                }
                else
                {
                  v51 = [v46 dateByAddingTimeInterval:604800.0];
                  v52 = [v36 dateByAddingTimeInterval:604800.0];
                  id v81 = [v50 initWithStartDate:v51 endDate:v52];

                  v46 = v80;
                  dispatch_source_t v21 = v75;
                }
                if (([v85 isEqualToString:@"OffPeak"] & 1) != 0
                  || [v85 isEqualToString:@"DiscountedRateAndOffPeak"])
                {
                  v53 = +[NSNumber numberWithUnsignedInteger:v25];
                  v54 = [v76 objectForKeyedSubscript:v53];

                  if (!v54)
                  {
                    v54 = +[NSMutableArray array];
                  }
                  [v54 addObject:v81];
                  v55 = +[NSNumber numberWithUnsignedInteger:v25];
                  [v76 setObject:v54 forKeyedSubscript:v55];

                  dispatch_source_t v21 = v75;
                  v46 = v80;
                }
                if (([v85 isEqualToString:@"DiscountedRate"] & 1) != 0
                  || [v85 isEqualToString:@"DiscountedRateAndOffPeak"])
                {
                  v56 = +[NSNumber numberWithUnsignedInteger:v25];
                  [v21 objectForKeyedSubscript:v56];
                  v58 = v57 = v21;

                  if (!v58)
                  {
                    v58 = +[NSMutableArray array];
                  }
                  [v58 addObject:v81];
                  v59 = +[NSNumber numberWithUnsignedInteger:v25];
                  [v57 setObject:v58 forKeyedSubscript:v59];

                  dispatch_source_t v21 = v57;
                  v46 = v80;
                }

                id v7 = v72;
                id v20 = v76;
              }
            }
          }
          id v83 = [obj countByEnumeratingWithState:&v86 objects:v98 count:16];
        }
        while (v83);
      }

      uint64_t v22 = v74 + 1;
    }
    while (v74 != 6);
    id v60 = [v20 copy];
    [(_DASNetworkQualityPolicy *)v68 setLowCongestionHours:v60];

    id v61 = [v21 copy];
    [(_DASNetworkQualityPolicy *)v68 setDiscountedHours:v61];

    v62 = [v7 dateByAddingTimeInterval:21600.0];
    v10 = v67;
    v63 = [v67 earlierDate:v62];

    refreshHoursTimer = v68->_refreshHoursTimer;
    [v63 timeIntervalSinceDate:v7];
    dispatch_time_t v66 = dispatch_walltime(0, (uint64_t)(v65 * 1000000000.0 + 1.0e10));
    dispatch_source_set_timer(refreshHoursTimer, v66, 0x13A52453C000uLL, 0x2540BE400uLL);

    uint64_t v11 = v69;
    id v6 = v70;
  }
  else
  {
    v19 = +[_DASDaemonLogger logForCategory:@"carrierBundle"];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v91 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Expiration Date in the past (%@). Exiting", buf, 0xCu);
    }

    [(_DASNetworkQualityPolicy *)self clearOffPeakDiscountedHours];
  }
}

- (id)initializeCoreTelephonyClient
{
  coreTelephonyClient = self->_coreTelephonyClient;
  if (!coreTelephonyClient)
  {
    v4 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:self->_telephonyQueue];
    uint64_t v5 = self->_coreTelephonyClient;
    self->_coreTelephonyClient = v4;

    [(CoreTelephonyClient *)self->_coreTelephonyClient setDelegate:self];
    coreTelephonyClient = self->_coreTelephonyClient;
  }

  return coreTelephonyClient;
}

- (void)loadCTInformationWithSDM:(BOOL)a3
{
  coreTelephonyClient = self->_coreTelephonyClient;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005E570;
  v4[3] = &unk_100176670;
  v4[4] = self;
  BOOL v5 = a3;
  [(CoreTelephonyClient *)coreTelephonyClient getPreferredDataSubscriptionContext:v4];
}

- (void)updatePNWStatus:(BOOL)a3
{
  if (a3)
  {
    objc_initWeak(&location, self);
    coreTelephonyClient = self->_coreTelephonyClient;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10005EA20;
    v5[3] = &unk_100176698;
    objc_copyWeak(&v6, &location);
    [(CoreTelephonyClient *)coreTelephonyClient isPrivateNetworkSIM:0 completion:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    self->_privateNetworkCellConnection = 0;
  }
}

- (BOOL)inLowCongestionHoursAtDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)qword_1001C3F58;
  if (!qword_1001C3F58)
  {
    uint64_t v6 = +[NSCalendar currentCalendar];
    id v7 = (void *)qword_1001C3F58;
    qword_1001C3F58 = v6;

    BOOL v5 = (void *)qword_1001C3F58;
  }
  id v8 = [v5 component:512 fromDate:v4];
  uint64_t v9 = 0;
  uint64_t v10 = (uint64_t)v8 - 1;
  char v11 = 1;
  do
  {
    char v12 = v11;
    uint64_t v10 = (v9 + v10 + 7) % 7;
    uint64_t v13 = [(_DASNetworkQualityPolicy *)self lowCongestionHours];
    v14 = +[NSNumber numberWithInteger:v10 + 1];
    uint64_t v15 = [v13 objectForKeyedSubscript:v14];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          if ([*(id *)(*((void *)&v23 + 1) + 8 * i) containsDate:v4])
          {

            BOOL v21 = 1;
            goto LABEL_15;
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    char v11 = 0;
    BOOL v21 = 0;
    uint64_t v9 = -1;
  }
  while ((v12 & 1) != 0);
LABEL_15:

  return v21;
}

- (BOOL)inDiscountedHoursAtDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)qword_1001C3F58;
  if (!qword_1001C3F58)
  {
    uint64_t v6 = +[NSCalendar currentCalendar];
    id v7 = (void *)qword_1001C3F58;
    qword_1001C3F58 = v6;

    BOOL v5 = (void *)qword_1001C3F58;
  }
  id v8 = [v5 component:512 fromDate:v4];
  uint64_t v9 = 0;
  uint64_t v10 = (uint64_t)v8 - 1;
  char v11 = 1;
  do
  {
    char v12 = v11;
    uint64_t v10 = (v9 + v10 + 7) % 7;
    uint64_t v13 = [(_DASNetworkQualityPolicy *)self discountedHours];
    v14 = +[NSNumber numberWithInteger:v10 + 1];
    uint64_t v15 = [v13 objectForKeyedSubscript:v14];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          if ([*(id *)(*((void *)&v23 + 1) + 8 * i) containsDate:v4])
          {

            BOOL v21 = 1;
            goto LABEL_15;
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    char v11 = 0;
    BOOL v21 = 0;
    uint64_t v9 = -1;
  }
  while ((v12 & 1) != 0);
LABEL_15:

  return v21;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

+ (BOOL)shouldReportOversizeLoadForTransferSize:(unint64_t)a3 withContext:(id)a4
{
  return _DASActivityTransferSizeModerate <= a3;
}

+ (id)policyInstance
{
  if (qword_1001C3F60 != -1) {
    dispatch_once(&qword_1001C3F60, &stru_1001766B8);
  }
  v2 = (void *)qword_1001C3F68;

  return v2;
}

+ (int64_t)currentNetworkQualityWithContext:(id)a3 interface:(int64_t *)a4
{
  id v5 = a3;
  uint64_t v6 = (uint64_t)+[_CDNetworkContext wiredQuality:v5];
  if (v6 < 1)
  {
    id v9 = +[_CDNetworkContext wifiQuality:v5];
    if (v9)
    {
      id v7 = v9;
      if (a4)
      {
        id v8 = +[_CDNetworkContext wifiInterfaceClass:v5];
        goto LABEL_7;
      }
    }
    else
    {
      if (a4) {
        *a4 = (int64_t)+[_CDNetworkContext cellInterfaceClass:v5];
      }
      id v7 = +[_CDNetworkContext cellQuality:v5];
    }
  }
  else
  {
    id v7 = (id)v6;
    if (a4)
    {
      id v8 = +[_CDNetworkContext wiredInterfaceClass:v5];
LABEL_7:
      *a4 = (int64_t)v8;
    }
  }

  return (int64_t)v7;
}

- (void)updateSystemConstraintsWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (uint64_t)+[_CDNetworkContext wiredQuality:v3];
  uint64_t v5 = (uint64_t)+[_CDNetworkContext wifiQuality:v3];
  uint64_t v6 = (uint64_t)+[_CDNetworkContext cellQuality:v3];

  id v9 = +[_DASDaemon sharedInstance];
  if (v5 > 20 || v4 >= 21)
  {
    [v9 removeConstraint:16 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
    [v9 removeConstraint:16 forSchedulingPriority:_DASSchedulingPriorityUtility];
    uint64_t v8 = _DASSchedulingPriorityMaintenance;
LABEL_7:
    [v9 removeConstraint:32 forSchedulingPriority:v8];
    [v9 removeConstraint:32 forSchedulingPriority:_DASSchedulingPriorityUtility];
    goto LABEL_9;
  }
  [v9 addConstraint:16 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
  [v9 addConstraint:16 forSchedulingPriority:_DASSchedulingPriorityUtility];
  uint64_t v8 = _DASSchedulingPriorityMaintenance;
  if (v6 >= 21) {
    goto LABEL_7;
  }
  [v9 addConstraint:32 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
  [v9 addConstraint:32 forSchedulingPriority:_DASSchedulingPriorityUtility];
LABEL_9:
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (uint64_t)+[_CDNetworkContext wiredQuality:v7];
  uint64_t v9 = (uint64_t)+[_CDNetworkContext wifiQuality:v7];
  uint64_t v10 = (uint64_t)+[_CDNetworkContext cellQuality:v7];
  unsigned __int8 v11 = +[_CDNetworkContext cellInterfaceUp:v7];
  BOOL v12 = v9 > 0 || v10 < 1;
  if (v12 || (uint64_t v13 = 1, !byte_1001C3F70) && byte_1001C3F71) {
    uint64_t v13 = 0;
  }
  [(_DASNetworkQualityPolicy *)self updatePNWStatus:v13];
  byte_1001C3F71 = v10 > 0;
  byte_1001C3F70 = v9 > 0;
  [(_DASNetworkQualityPolicy *)self updateSystemConstraintsWithContext:v7];
  if ([v6 isEqualToString:@"com.apple.duetactivityscheduler.nwstatus.wired"])
  {
    BOOL v14 = v8 < 21;
LABEL_14:
    BOOL v16 = v14;
    goto LABEL_27;
  }
  if ([v6 isEqualToString:@"com.apple.duetactivityscheduler.nwstatus.wifi"])
  {
    uint64_t v15 = +[_DASPLLogger sharedInstance];
    [v15 reportNewStatus:v9 > 20 forTrigger:off_1001C3988];

    BOOL v14 = v8 > 20 || v9 < 21;
    goto LABEL_14;
  }
  unsigned int v17 = [v6 isEqualToString:@"com.apple.duetactivityscheduler.nwstatus.cell"];
  char v18 = v11 ^ 1;
  if (v10 < 21) {
    char v18 = 1;
  }
  if (v9 > 20) {
    char v18 = 1;
  }
  if (v8 <= 20) {
    char v19 = v18;
  }
  else {
    char v19 = 1;
  }
  if (v17) {
    BOOL v16 = v19;
  }
  else {
    BOOL v16 = 0;
  }
LABEL_27:

  return v16;
}

- (double)weightForActivity:(id)a3
{
  return (double)(unint64_t)(12 * (100 - (void)[a3 schedulingPriority])) / 100.0;
}

- (int64_t)companionMinimumQualityForActivity:(id)a3 interface:(int64_t)a4
{
  id v5 = a3;
  id v6 = [v5 schedulingPriority];
  if ((unint64_t)v6 >= _DASSchedulingPriorityUserInitiated)
  {
    int64_t v8 = 20;
    goto LABEL_11;
  }
  unsigned __int8 v7 = [v5 deferred];
  int64_t v8 = 20;
  if (a4 != 3 && (v7 & 1) == 0)
  {
    if (a4 == 1)
    {
      uint64_t v9 = [v5 startBefore];
      [v9 timeIntervalSinceNow];
      double v11 = v10;

      if (v11 < 0.0)
      {
LABEL_9:
        int64_t v8 = 50;
        goto LABEL_11;
      }
    }
    id v12 = [v5 transferSize];
    id v13 = [v5 schedulingPriority];
    if ((unint64_t)v13 > _DASSchedulingPriorityMaintenance
      || ([v5 launchReason],
          BOOL v14 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v15 = [v14 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification],
          v14,
          (v15 & 1) != 0))
    {
LABEL_8:
      id v16 = [v5 schedulingPriority];
      if ((unint64_t)v16 > _DASSchedulingPriorityUtility
        || (a4 != 2 || (unint64_t)v12 < _DASActivityTransferSizeLarge)
        && (a4 != 1 || (unint64_t)v12 < _DASActivityTransferSizeVeryLarge))
      {
        goto LABEL_9;
      }
LABEL_21:
      int64_t v8 = 100;
      goto LABEL_11;
    }
    unsigned __int8 v18 = [v5 noTransferSizeSpecified];
    int64_t v8 = 100;
    if (a4 != 2 && (v18 & 1) == 0)
    {
      if (a4 == 1 && (unint64_t)v12 > _DASActivityTransferSizeLarge) {
        goto LABEL_21;
      }
      goto LABEL_8;
    }
  }
LABEL_11:

  return v8;
}

- (int)transferSizeIndex:(unint64_t)a3
{
  if (_DASActivityTransferSizeVerySmall >= a3) {
    return 0;
  }
  if (_DASActivityTransferSizeSmall >= a3) {
    return 1;
  }
  if (_DASActivityTransferSizeModerate >= a3) {
    return 2;
  }
  if (_DASActivityTransferSizeLarge >= a3) {
    return 3;
  }
  if (_DASActivityTransferSizeVeryLarge >= a3) {
    return 4;
  }
  return 5;
}

- (double)scoreWithInexpensiveCellForActivity:(id)a3 networkQuality:(int64_t)a4 interface:(int64_t)a5 radioHot:(BOOL)a6
{
  double result = 0.0;
  if (a4 >= 50)
  {
    BOOL v7 = a6;
    unsigned int v11 = -[self transferSizeIndex:](objc_msgSend(a3, "transferSize", 0.0));
    signed int v12 = v11;
    if (a5 == 1)
    {
      BOOL v13 = a4 != 100;
      BOOL v14 = (char *)&unk_1001269E0 + 16 * (int)v11;
    }
    else
    {
      if (+[_DASNetworkEvaluationMonitor inexpensivePathAvailable])
      {
        unsigned __int8 v15 = (double *)((char *)&unk_100126B00
                       + 64 * (uint64_t)v12
                       + 32
                       * [(_DASNetworkQualityPolicy *)self smartDataModeEnabled]
                       + 16 * v7
                       + 8 * (a4 != 100));
        return *v15;
      }
      BOOL v13 = a4 != 100;
      BOOL v14 = (char *)&unk_100126A40 + 32 * v12 + 16 * v7;
    }
    unsigned __int8 v15 = (double *)&v14[8 * v13];
    return *v15;
  }
  return result;
}

- (double)companionScoreForActivity:(id)a3 networkQuality:(int64_t)a4 interface:(int64_t)a5 interfaceSubtype:(int64_t)a6 pluginStatus:(BOOL)a7 radioHot:(BOOL)a8 linkAvailable:(BOOL *)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  if (a9) {
    *a9 = a4 > 0;
  }
  if (a4 >= 1) {
    double v16 = 1.0;
  }
  else {
    double v16 = 0.0;
  }
  if (a4 >= 1 && !a7)
  {
    double v16 = 0.0;
    if ([(_DASNetworkQualityPolicy *)self minimumQualityForActivity:v15 interface:a5 interfaceSubtype:a6] <= a4)
    {
      id v17 = [v15 schedulingPriority];
      if ((unint64_t)v17 >= _DASSchedulingPriorityUserInitiated)
      {
        double v16 = (double)a4;
      }
      else
      {
        [(_DASNetworkQualityPolicy *)self scoreWithInexpensiveCellForActivity:v15 networkQuality:a4 interface:a5 radioHot:v9];
        double v16 = v18;
      }
    }
  }

  return v16;
}

- (int64_t)minimumQualityForActivity:(id)a3 interface:(int64_t)a4 interfaceSubtype:(int64_t)a5
{
  return -[_DASNetworkQualityPolicy companionMinimumQualityForActivity:interface:](self, "companionMinimumQualityForActivity:interface:", a3, a4, a5);
}

- (double)scoreForActivity:(id)a3 networkQuality:(int64_t)a4 interface:(int64_t)a5 interfaceSubtype:(int64_t)a6 pluginStatus:(BOOL)a7 radioHot:(BOOL)a8 linkAvailable:(BOOL *)a9
{
  -[_DASNetworkQualityPolicy companionScoreForActivity:networkQuality:interface:interfaceSubtype:pluginStatus:radioHot:linkAvailable:](self, "companionScoreForActivity:networkQuality:interface:interfaceSubtype:pluginStatus:radioHot:linkAvailable:", a3, a4, a5, a6, a7, a8);
  return result;
}

- (BOOL)isiCloudKeychainActivity:(id)a3
{
  id v3 = a3;
  if ([v3 requiresNetwork])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [v3 relatedApplications];
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          BOOL v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) lowercaseString];
          if ([v9 containsString:@"securityd"])
          {

LABEL_15:
            BOOL v11 = 1;
            goto LABEL_16;
          }
          unsigned __int8 v10 = [v9 containsString:@"trustedpeershelper"];

          if (v10) {
            goto LABEL_15;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        BOOL v11 = 0;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
LABEL_16:
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)unconstrainedNetworkAvailableForActivity:(id)a3 withContext:(id)a4 withRationale:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = +[_DASNetworkEvaluationMonitor sharedInstance];
  unsigned __int8 v12 = [v11 isUnconstrainedPathAvailableForActivity:v8];

  if (v12) {
    goto LABEL_19;
  }
  if ([v8 requiresUnconstrainedNetworking])
  {
    CFStringRef v13 = @"requiresUnconstrainedNetworking == YES";
LABEL_13:
    char v19 = +[NSPredicate predicateWithFormat:v13];
    [v10 addRationaleWithCondition:v19];

LABEL_14:
    BOOL v20 = 0;
    goto LABEL_20;
  }
  if ([(_DASNetworkQualityPolicy *)self isiCloudKeychainActivity:v8])
  {
    long long v14 = +[_DASDaemonLogger logForCategory:@"lowDataMode"];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 67109120;
      LODWORD(v35) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "iCloudKeychainActivity=%u", (uint8_t *)&v34, 8u);
    }

    CFStringRef v15 = @"isiCloudKeychainActivity == YES";
LABEL_18:
    uint64_t v22 = +[NSPredicate predicateWithFormat:v15];
    [v10 addRationaleWithCondition:v22];

LABEL_19:
    BOOL v20 = 1;
    goto LABEL_20;
  }
  if (+[_DASPhotosPolicy isiCPLActivity:v8])
  {
    long long v16 = +[_DASPhotosPolicy keyPathForPhotosBudgetOverride];
    id v17 = [v9 objectForKeyedSubscript:v16];
    unsigned __int8 v18 = [v17 unsignedIntegerValue];

    if ((v18 & 0x10) != 0)
    {
      BOOL v21 = +[_DASDaemonLogger logForCategory:@"lowDataMode"];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "shouldOverrideLDM == YES", (uint8_t *)&v34, 2u);
      }

      CFStringRef v15 = @"shouldOverrideLDM == YES";
      goto LABEL_18;
    }
  }
  if (([v8 requestsApplicationLaunch] & 1) != 0
    || [v8 requestsExtensionLaunch])
  {
    CFStringRef v13 = @"requestsLaunch == YES";
    goto LABEL_13;
  }
  long long v24 = [v8 startBefore];
  long long v25 = [v8 startAfter];
  [v24 timeIntervalSinceDate:v25];
  double v27 = v26;

  if (v27 < 1.0) {
    double v27 = 1.0;
  }
  uint64_t v28 = [v8 startAfter];
  [v28 timeIntervalSinceNow];
  double v30 = -v29;

  double v31 = v30 / v27;
  if (v31 < 0.9) {
    goto LABEL_14;
  }
  BOOL v32 = +[NSPredicate predicateWithFormat:@"isNearingDeadline == YES"];
  [v10 addRationaleWithCondition:v32];

  v33 = +[_DASDaemonLogger logForCategory:@"lowDataMode"];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 134217984;
    double v35 = v31 * 100.0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "isNearingDeadline == YES (%2.0f%% complete)", (uint8_t *)&v34, 0xCu);
  }

  BOOL v20 = 1;
  +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.dasd.ldm.nearingDeadline" byCount:1];
LABEL_20:

  return v20;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006039C;
  block[3] = &unk_100175570;
  block[4] = self;
  id v7 = a4;
  id v51 = v7;
  if (qword_1001C3F78 != -1) {
    dispatch_once(&qword_1001C3F78, block);
  }
  id v8 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:self->_policyName];
  unsigned __int8 v10 = [(_DASNetworkEvaluationMonitor *)self->_networkEvaluator isNetworkPathAvailableForActivity:v6];
  if ((v10 & 1) == 0)
  {
    [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"networkPathAvailability" withRequiredValue:1.0 withCurrentValue:0.0];
    [(_DASPolicyResponseRationale *)v8 setResponseOptions:(unint64_t)[(_DASPolicyResponseRationale *)v8 responseOptions] | 1];
LABEL_11:
    double v22 = (double)0x384uLL;
    uint64_t v23 = 100;
    goto LABEL_23;
  }
  id v11 = [v6 schedulingPriority];
  if ((unint64_t)v11 < _DASSchedulingPriorityUtility
    && ([v6 deferred] & 1) == 0
    && ![(_DASNetworkQualityPolicy *)self unconstrainedNetworkAvailableForActivity:v6 withContext:v7 withRationale:v8])
  {
    [(_DASPolicyResponseRationale *)v8 setResponseOptions:(unint64_t)[(_DASPolicyResponseRationale *)v8 responseOptions] | 2];
    [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"unconstrainedNetworkAvailable" withRequiredValue:1.0 withCurrentValue:0.0];
    goto LABEL_11;
  }
  unsigned __int8 v12 = [v6 userInfo];
  CFStringRef v13 = [v12 objectForKeyedSubscript:_DASCTSMailFetchKey];
  if ([v13 BOOLValue])
  {
    long long v14 = +[NSDate date];
    CFStringRef v15 = [v6 startBefore];
    [v14 timeIntervalSinceDate:v15];
    double v17 = v16;
    unsigned __int8 v18 = [v6 startBefore];
    char v19 = [v6 startAfter];
    [v18 timeIntervalSinceDate:v19];
    double v21 = v20;

    if (v17 > v21)
    {
      double v22 = (double)0x384uLL;
      uint64_t v23 = 67;
LABEL_23:
      uint64_t v29 = +[_DASPolicyResponse policyResponseWithDecision:v23 validityDuration:v8 rationale:v22];
      goto LABEL_24;
    }
  }
  else
  {
  }
  id v24 = [v6 schedulingPriority];
  if ((unint64_t)v24 >= _DASSchedulingPriorityUserInitiated) {
    goto LABEL_18;
  }
  long long v25 = [v6 launchReason];
  if ([v25 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification])
  {
    double v26 = [v6 submitDate];
    [v26 timeIntervalSinceNow];
    double v28 = v27;

    if (v28 < 0.0) {
      double v28 = -v28;
    }

    if (v28 < 60.0) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  if ((uint64_t)+[_CDNetworkContext wiredQuality:v7] >= 1)
  {
    double v22 = 10800.0;
    goto LABEL_22;
  }
  id v32 = +[_CDNetworkContext wifiQuality:v7];
  uint64_t v33 = [(_DASNetworkQualityPolicy *)self minimumQualityForActivity:v6 interface:1 interfaceSubtype:0];
  int v34 = +[_CDContextQueries keyPathForPluginStatus];
  double v35 = [v7 objectForKeyedSubscript:v34];
  id v36 = [v35 BOOLValue];

  char v49 = 1;
  [(_DASNetworkQualityPolicy *)self scoreForActivity:v6 networkQuality:v32 interface:1 interfaceSubtype:0 pluginStatus:v36 radioHot:0 linkAvailable:&v49];
  double v38 = v37;
  [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"wifiQuality" withRequiredValue:(double)v33 withCurrentValue:(double)(uint64_t)v32];
  if (v38 <= 0.0)
  {
    if (+[_DASPhotosPolicy isiCPLActivity:v6])
    {
      BOOL v39 = +[_DASPhotosPolicy keyPathForPhotosBudgetOverride];
      v40 = [v7 objectForKeyedSubscript:v39];
      unsigned __int8 v41 = [v40 unsignedIntegerValue];

      if ((v41 & 2) != 0)
      {
        [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"photosOverrideEnergy" withRequiredValue:1.0 withCurrentValue:1.0];
LABEL_18:
        double v22 = (double)0x384uLL;
LABEL_22:
        uint64_t v23 = 0;
        goto LABEL_23;
      }
    }
    id v42 = +[_CDNetworkContext cellQuality:v7];
    [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"cellQuality" withRequiredValue:(double)[(_DASNetworkQualityPolicy *)self minimumQualityForActivity:v6 interface:2 interfaceSubtype:0] withCurrentValue:(double)(uint64_t)v42];
    char v48 = 1;
    [(_DASNetworkQualityPolicy *)self scoreForActivity:v6 networkQuality:v42 interface:2 interfaceSubtype:0 pluginStatus:v36 radioHot:+[_CDNetworkContext cellInterfaceUp:v7] linkAvailable:&v48];
    if (v43 <= 0.0)
    {
      if (v49 || v48 && ([v6 requiresInexpensiveNetworking] & 1) == 0) {
        uint64_t v46 = 4;
      }
      else {
        uint64_t v46 = 8;
      }
      [(_DASPolicyResponseRationale *)v8 setResponseOptions:[(_DASPolicyResponseRationale *)v8 responseOptions] | v46];
      double v22 = (double)0x384uLL;
      uint64_t v23 = 33;
      goto LABEL_23;
    }
    double v38 = v43;
    if ([v6 uploadSize])
    {
      id v44 = +[_CDNetworkContext cellUploadCost:v7];
      if (v44 == (id)2)
      {
        double v45 = 0.5;
        goto LABEL_42;
      }
      if (v44 == (id)3)
      {
        double v45 = 0.1;
LABEL_42:
        double v38 = v38 * v45;
        double v47 = +[NSPredicate predicateWithFormat:@"powerCost == %ld", v44];
        [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v47];
      }
    }
  }
  uint64_t v29 = +[_DASPolicyResponse policyResponseWithScore:v8 validityDuration:v38 rationale:(double)0x384uLL];
LABEL_24:
  double v30 = (void *)v29;

  return v30;
}

- (double)predictedScoreForActivity:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_DASNetworkQualityPolicy *)self wifiPredictionTimeline];
  id v9 = [v8 valueAtDate:v7];
  id v10 = [v9 integerValue];

  id v11 = +[_DASPredictionManager predictionForKey:@"plugin"];
  unsigned __int8 v12 = [v11 valueAtDate:v7];
  CFStringRef v13 = v12;
  if (v12)
  {
    [v12 doubleValue];
    BOOL v15 = v14 > 0.5;
  }
  else
  {
    BOOL v15 = 0;
  }
  [(_DASNetworkQualityPolicy *)self scoreForActivity:v6 networkQuality:v10 interface:1 interfaceSubtype:0 pluginStatus:v15 radioHot:0 linkAvailable:0];
  double v17 = v16;
  if (![v6 requiresInexpensiveNetworking]
    || (double v18 = v17, [(_DASNetworkQualityPolicy *)self inDiscountedHoursAtDate:v7]))
  {
    char v19 = [(_DASNetworkQualityPolicy *)self cellPredictionTimeline];
    double v20 = [v19 valueAtDate:v7];
    id v21 = [v20 integerValue];

    if (v13)
    {
      [v13 doubleValue];
      BOOL v23 = v22 > 0.5;
    }
    else
    {
      BOOL v23 = 0;
    }
    [(_DASNetworkQualityPolicy *)self scoreForActivity:v6 networkQuality:v21 interface:2 interfaceSubtype:0 pluginStatus:v23 radioHot:0 linkAvailable:0];
    double v25 = v24;
    if (v24 <= 0.0
      || (double v18 = 1.0, ![(_DASNetworkQualityPolicy *)self inLowCongestionHoursAtDate:v7]))
    {
      if (v17 >= v25) {
        double v18 = v17;
      }
      else {
        double v18 = v25;
      }
    }
  }

  return v18;
}

- (void)preferredDataSimChanged:(id)a3
{
  id v4 = a3;
  id v5 = +[_DASDaemonLogger logForCategory:@"carrierBundle"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uuid];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Preferred data SIM changed for context: %@", (uint8_t *)&v7, 0xCu);
  }
  [(_DASNetworkQualityPolicy *)self loadCTInformationWithSDM:1];
}

- (void)smartDataModeChanged:(id)a3 userEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  self->_smartDataModeEnabled = a4;
  id v5 = +[_DASDaemonLogger logForCategory:@"carrierBundle"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithBool:v4];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SDM changed to %@", (uint8_t *)&v7, 0xCu);
  }
}

- (BOOL)privateNetworkCellConnection
{
  return self->_privateNetworkCellConnection;
}

- (void)setPrivateNetworkCellConnection:(BOOL)a3
{
  self->_privateNetworkCellConnection = a3;
}

- (BOOL)smartDataModeEnabled
{
  return self->_smartDataModeEnabled;
}

- (void)setSmartDataModeEnabled:(BOOL)a3
{
  self->_smartDataModeEnabled = a3;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
}

- (_CDContextualKeyPath)wifiStatus
{
  return self->_wifiStatus;
}

- (void)setWifiStatus:(id)a3
{
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (_DASNetworkEvaluationMonitor)networkEvaluator
{
  return self->_networkEvaluator;
}

- (void)setNetworkEvaluator:(id)a3
{
}

- (_CDContext)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
}

- (_DKPredictionTimeline)wifiPredictionTimeline
{
  return (_DKPredictionTimeline *)objc_getProperty(self, a2, 64, 1);
}

- (void)setWifiPredictionTimeline:(id)a3
{
}

- (_CDContextualKeyPath)wiredStatus
{
  return self->_wiredStatus;
}

- (void)setWiredStatus:(id)a3
{
}

- (_CDContextualKeyPath)cellStatus
{
  return self->_cellStatus;
}

- (void)setCellStatus:(id)a3
{
}

- (_DKPredictionTimeline)cellPredictionTimeline
{
  return (_DKPredictionTimeline *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCellPredictionTimeline:(id)a3
{
}

- (OS_dispatch_source)refreshHoursTimer
{
  return self->_refreshHoursTimer;
}

- (void)setRefreshHoursTimer:(id)a3
{
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (OS_dispatch_queue)telephonyQueue
{
  return self->_telephonyQueue;
}

- (void)setTelephonyQueue:(id)a3
{
}

- (NSDictionary)lowCongestionHours
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLowCongestionHours:(id)a3
{
}

- (NSDictionary)discountedHours
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDiscountedHours:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discountedHours, 0);
  objc_storeStrong((id *)&self->_lowCongestionHours, 0);
  objc_storeStrong((id *)&self->_telephonyQueue, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_refreshHoursTimer, 0);
  objc_storeStrong((id *)&self->_cellPredictionTimeline, 0);
  objc_storeStrong((id *)&self->_cellStatus, 0);
  objc_storeStrong((id *)&self->_wiredStatus, 0);
  objc_storeStrong((id *)&self->_wifiPredictionTimeline, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_networkEvaluator, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_wifiStatus, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end