@interface FMDSPStatusUtil
+ (id)sharedInstance;
- (BOOL)waitingForDetailedStats;
- (FMDSPStatusUtil)init;
- (FMDispatchTimer)timer;
- (NSDate)beaconLastKeyRollDate;
- (NSDate)beaconZoneCreationDate;
- (NSDictionary)rawStats;
- (NSNumber)beaconZoneCreationErrorCode;
- (NSString)mteStatus;
- (NSString)mteStatusError;
- (NSString)octStatus;
- (NSString)octStatusError;
- (OS_dispatch_queue)serialQueue;
- (SPFMIPRegisterInfo)spFmipRegisterInfo;
- (id)statsChangeHandler;
- (void)_refreshDetailedStats:(BOOL)a3;
- (void)_requestDetailedStatsFromUserAgent;
- (void)_serialQueue_refreshBeaconStats;
- (void)_userDidLogIn:(id)a3;
- (void)cancelRefresh;
- (void)clearCache;
- (void)refreshBeaconStats;
- (void)setRawStats:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSpFmipRegisterInfo:(id)a3;
- (void)setStatsChangeHandler:(id)a3;
- (void)setTimer:(id)a3;
- (void)setWaitingForDetailedStats:(BOOL)a3;
- (void)updateDetailedSPStats:(id)a3;
@end

@implementation FMDSPStatusUtil

+ (id)sharedInstance
{
  if (qword_10031EC20 != -1) {
    dispatch_once(&qword_10031EC20, &stru_1002DCEF0);
  }
  v2 = (void *)qword_10031EC18;

  return v2;
}

- (FMDSPStatusUtil)init
{
  v12.receiver = self;
  v12.super_class = (Class)FMDSPStatusUtil;
  v2 = [(FMDSPStatusUtil *)&v12 init];
  if (v2)
  {
    v3 = objc_opt_new();
    uint64_t v4 = [v3 fmipRegisterInfo];
    spFmipRegisterInfo = v2->_spFmipRegisterInfo;
    v2->_spFmipRegisterInfo = (SPFMIPRegisterInfo *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.icloud.spstats.queue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = +[FMPreferencesUtil dictionaryForKey:off_10031DAE8 inDomain:kFMDNotBackedUpPrefDomain];
    rawStats = v2->_rawStats;
    v2->_rawStats = (NSDictionary *)v8;

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"_userDidLogIn:" name:@"FMDUserLoggedInLocalNotification" object:0];

    if (!v2->_rawStats)
    {
      v2->_rawStats = (NSDictionary *)&__NSDictionary0__struct;
    }
  }
  return v2;
}

- (NSDate)beaconZoneCreationDate
{
  v2 = [(FMDSPStatusUtil *)self rawStats];
  v3 = [v2 objectForKeyedSubscript:@"beaconZoneCreationDate"];

  return (NSDate *)v3;
}

- (NSNumber)beaconZoneCreationErrorCode
{
  v2 = [(FMDSPStatusUtil *)self rawStats];
  v3 = [v2 objectForKeyedSubscript:@"beaconZoneCreationErrorCode"];

  return (NSNumber *)v3;
}

- (NSDate)beaconLastKeyRollDate
{
  v2 = [(FMDSPStatusUtil *)self rawStats];
  v3 = [v2 objectForKeyedSubscript:@"beaconLastKeyRollDate"];

  return (NSDate *)v3;
}

- (NSString)octStatus
{
  v2 = [(FMDSPStatusUtil *)self rawStats];
  v3 = [v2 objectForKeyedSubscript:@"octStatus"];

  return (NSString *)v3;
}

- (NSString)octStatusError
{
  v2 = [(FMDSPStatusUtil *)self rawStats];
  v3 = [v2 objectForKeyedSubscript:@"octStatusError"];

  return (NSString *)v3;
}

- (NSString)mteStatus
{
  v2 = [(FMDSPStatusUtil *)self rawStats];
  v3 = [v2 objectForKeyedSubscript:@"mteStatus"];

  return (NSString *)v3;
}

- (NSString)mteStatusError
{
  v2 = [(FMDSPStatusUtil *)self rawStats];
  v3 = [v2 objectForKeyedSubscript:@"mteStatusError"];

  return (NSString *)v3;
}

- (void)cancelRefresh
{
  objc_initWeak(&location, self);
  v3 = [(FMDSPStatusUtil *)self serialQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BE718;
  v4[3] = &unk_1002D93C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)clearCache
{
  [(FMDSPStatusUtil *)self setRawStats:&__NSDictionary0__struct];
  v2 = off_10031DAE8;
  uint64_t v3 = kFMDNotBackedUpPrefDomain;

  +[FMPreferencesUtil removeKey:v2 inDomain:v3];
}

- (void)refreshBeaconStats
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(FMDSPStatusUtil *)self serialQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BE894;
  v4[3] = &unk_1002D93C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_serialQueue_refreshBeaconStats
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(FMDSPStatusUtil *)self timer];
  [v3 cancel];

  uint64_t v4 = (uint64_t)+[FMPreferencesUtil integerForKey:@"SPStatusRecheckInterval" inDomain:kFMDNotBackedUpPrefDomain];
  if (v4 >= 1) {
    double v5 = (double)v4;
  }
  else {
    double v5 = 1800.0;
  }
  dispatch_queue_t v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v40 = (uint64_t)v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting timer to refresh beacon stats in %ld seconds", buf, 0xCu);
  }

  id v7 = objc_alloc((Class)FMDispatchTimer);
  uint64_t v8 = [(FMDSPStatusUtil *)self serialQueue];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000BEEEC;
  v36[3] = &unk_1002D93C8;
  objc_copyWeak(&v37, &location);
  id v9 = [v7 initWithQueue:v8 timeout:v36 completion:v5];
  [(FMDSPStatusUtil *)self setTimer:v9];

  v10 = [(FMDSPStatusUtil *)self timer];
  [v10 start];

  if (MKBDeviceUnlockedSinceBoot())
  {
    v11 = [(FMDSPStatusUtil *)self rawStats];
    objc_super v12 = [v11 copy];

    id v13 = [v12 mutableCopy];
    v14 = [(FMDSPStatusUtil *)self spFmipRegisterInfo];
    v15 = [v14 beaconZoneCreationErrorCode];
    [v13 fm_safelyMapKey:@"beaconZoneCreationErrorCode" toObject:v15];

    v16 = [(FMDSPStatusUtil *)self spFmipRegisterInfo];
    v17 = [v16 beaconZoneCreationDate];
    [v13 fm_safelyMapKey:@"beaconZoneCreationDate" toObject:v17];

    v18 = [(FMDSPStatusUtil *)self spFmipRegisterInfo];
    v19 = [v18 lastKeyRollDate];
    [v13 fm_safelyMapKey:@"lastKeyRollDate" toObject:v19];

    id v20 = [v13 copy];
    [(FMDSPStatusUtil *)self setRawStats:v20];

    unsigned int v21 = [v12 isEqualToDictionary:v13];
    v22 = [(FMDSPStatusUtil *)self rawStats];
    +[FMPreferencesUtil setDictionary:v22 forKey:off_10031DAE8 inDomain:kFMDNotBackedUpPrefDomain];

    v23 = [(FMDSPStatusUtil *)self spFmipRegisterInfo];
    v24 = [v23 serviceState];

    v25 = [(FMDSPStatusUtil *)self beaconZoneCreationErrorCode];
    if (v25)
    {
    }
    else if (v24 != (void *)SPServiceStateEnabled {
           || ([(FMDSPStatusUtil *)self beaconZoneCreationDate],
    }
               v27 = objc_claimAutoreleasedReturnValue(),
               BOOL v28 = v27 == 0,
               v27,
               !v28))
    {
      if (v21)
      {
        v29 = sub_100004238();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Basic beacon stats do not show any failure. Server already has the latest stats.", buf, 2u);
        }
      }
      else
      {
        v30 = sub_100004238();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Basic beacon stats do not show any failure. Sending the updated stats to the server", buf, 2u);
        }

        v29 = [(FMDSPStatusUtil *)self statsChangeHandler];
        if (v29)
        {
          v31 = dispatch_get_global_queue(0, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000BEF2C;
          block[3] = &unk_1002DA130;
          v29 = v29;
          v35 = v29;
          dispatch_async(v31, block);
        }
      }

      v32 = sub_100004238();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Canceling beacon stats refresh timer", buf, 2u);
      }

      v33 = [(FMDSPStatusUtil *)self timer];
      [v33 cancel];

      [(FMDSPStatusUtil *)self setTimer:0];
      goto LABEL_26;
    }
    v26 = sub_100004238();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Basic beacon stats is reporting a failure. Fetching detailed stats", buf, 2u);
    }

    [(FMDSPStatusUtil *)self _refreshDetailedStats:v21 ^ 1];
LABEL_26:

    goto LABEL_27;
  }
  objc_super v12 = sub_100004238();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Device not unlocked since boot. Will refresh beacon stats on next timer trigger.", buf, 2u);
  }
LABEL_27:

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

- (void)_refreshDetailedStats:(BOOL)a3
{
  double v5 = +[NSDate date];
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_1000BF274;
  v38[4] = sub_1000BF284;
  id v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_1000BF274;
  void v36[4] = sub_1000BF284;
  id v37 = 0;
  objc_initWeak(&location, self);
  dispatch_queue_t v6 = [(FMDSPStatusUtil *)self rawStats];
  id v7 = [v6 copy];

  id v8 = [v7 mutableCopy];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000BF28C;
  v27[3] = &unk_1002DCF18;
  objc_copyWeak(&v33, &location);
  v31 = v38;
  id v9 = v5;
  id v28 = v9;
  v32 = v36;
  id v10 = v8;
  id v29 = v10;
  id v11 = v7;
  id v30 = v11;
  BOOL v34 = a3;
  objc_super v12 = objc_retainBlock(v27);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000BF4E8;
  v22[3] = &unk_1002DCF40;
  id v13 = v10;
  v26 = v38;
  id v23 = v13;
  v24 = self;
  v14 = v12;
  id v25 = v14;
  +[FMDOctStatusUtil fetchOctStatusWithCompletion:v22];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000BF5E0;
  v17[3] = &unk_1002DCF40;
  id v15 = v13;
  unsigned int v21 = v36;
  id v18 = v15;
  v19 = self;
  v16 = v14;
  id v20 = v16;
  +[FMDMteStatusUtil fetchMteStatusWithCompletion:v17];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(v38, 8);
}

- (void)_requestDetailedStatsFromUserAgent
{
  [(FMDSPStatusUtil *)self setWaitingForDetailedStats:1];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.icloud.findmydeviced.fetch_spstats", 0, 0, 1u);
}

- (void)updateDetailedSPStats:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  double v5 = [(FMDSPStatusUtil *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BF814;
  block[3] = &unk_1002D9238;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_userDidLogIn:(id)a3
{
  if ([(FMDSPStatusUtil *)self waitingForDetailedStats])
  {
    dispatch_time_t v3 = dispatch_time(0, 5000000000);
    id v4 = dispatch_get_global_queue(0, 0);
    dispatch_after(v3, v4, &stru_1002DCF60);
  }
}

- (id)statsChangeHandler
{
  return self->_statsChangeHandler;
}

- (void)setStatsChangeHandler:(id)a3
{
}

- (NSDictionary)rawStats
{
  return self->_rawStats;
}

- (void)setRawStats:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (SPFMIPRegisterInfo)spFmipRegisterInfo
{
  return self->_spFmipRegisterInfo;
}

- (void)setSpFmipRegisterInfo:(id)a3
{
}

- (FMDispatchTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (BOOL)waitingForDetailedStats
{
  return self->_waitingForDetailedStats;
}

- (void)setWaitingForDetailedStats:(BOOL)a3
{
  self->_waitingForDetailedStats = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_spFmipRegisterInfo, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_rawStats, 0);

  objc_storeStrong(&self->_statsChangeHandler, 0);
}

@end