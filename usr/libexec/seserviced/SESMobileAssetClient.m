@interface SESMobileAssetClient
+ (unint64_t)getWeeksTryingToDownload;
- (BOOL)isEligibleAsset:(id)a3;
- (BOOL)retryInProgress;
- (BOOL)userInitiated;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)queue;
- (SESMobileAssetClient)initWithManager:(id)a3;
- (SESMobileAssetManager)mobileAssetManager;
- (double)metadataQueryInterval;
- (id)optionsForInterval:(double)a3;
- (int64_t)downloadTimeoutInterval;
- (os_state_data_s)dumpState;
- (unint64_t)currentCompatibilityVersion;
- (unsigned)errorCount;
- (void)downloadAsset:(id)a3;
- (void)handleAvailableAsset:(id)a3;
- (void)handleQueryResult:(int64_t)a3 query:(id)a4;
- (void)handleQuerySuccess:(id)a3;
- (void)maybeQueryMetadata;
- (void)onAlarm:(id)a3;
- (void)onDarwinNotification:(id)a3;
- (void)queryMA;
- (void)queryMetadata;
- (void)retryWithBackoff:(id)a3;
- (void)setCurrentCompatibilityVersion:(unint64_t)a3;
- (void)setDownloadTimeoutInterval:(int64_t)a3;
- (void)setErrorCount:(unsigned int)a3;
- (void)setMetadataQueryInterval:(double)a3;
- (void)setMobileAssetManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRetryInProgress:(BOOL)a3;
- (void)setUserDefaults:(id)a3;
- (void)setUserInitiated:(BOOL)a3;
- (void)triggerUserInitiatedSync;
@end

@implementation SESMobileAssetClient

- (SESMobileAssetClient)initWithManager:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SESMobileAssetClient;
  v5 = [(SESMobileAssetClient *)&v26 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.seserviced.mobileassetclient", v7);
    [(SESMobileAssetClient *)v5 setQueue:v8];

    id v9 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.seserviced"];
    [(SESMobileAssetClient *)v5 setUserDefaults:v9];

    [(SESMobileAssetClient *)v5 setMobileAssetManager:v4];
    [(SESMobileAssetClient *)v5 setMetadataQueryInterval:172800.0];
    [(SESMobileAssetClient *)v5 setRetryInProgress:0];
    v5->_errorCount = [(NSUserDefaults *)v5->_userDefaults integerForKey:@"downloadErrorCount"];
    -[SESMobileAssetClient setCurrentCompatibilityVersion:](v5, "setCurrentCompatibilityVersion:", [v4 currentCompatibilityVersion]);
    [(SESMobileAssetClient *)v5 setDownloadTimeoutInterval:0];
    v5->_userInitiated = [(NSUserDefaults *)v5->_userDefaults BOOLForKey:@"mobileasset.isUserInitiated"];
    if (SESInternalVariant())
    {
      if ([(NSUserDefaults *)v5->_userDefaults BOOLForKey:@"debug.mobileasset.disable"])
      {
        p_super = SESDefaultLogObject();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "MobileAsset disabled by internal preference", buf, 2u);
        }
        goto LABEL_10;
      }
      v11 = [(SESMobileAssetClient *)v5 userDefaults];
      v12 = [v11 objectForKey:@"debug.mobileasset.metadataQueryInterval"];

      if (v12)
      {
        [v12 doubleValue];
        -[SESMobileAssetClient setMetadataQueryInterval:](v5, "setMetadataQueryInterval:");
      }
      v13 = [(SESMobileAssetClient *)v5 userDefaults];
      -[SESMobileAssetClient setDownloadTimeoutInterval:](v5, "setDownloadTimeoutInterval:", [v13 integerForKey:@"debug.mobileasset.downloadTimeoutInterval"]);

      v14 = [(SESMobileAssetClient *)v5 userDefaults];
      v15 = +[NSNumber numberWithUnsignedInteger:[(SESMobileAssetClient *)v5 currentCompatibilityVersion]];
      [v14 setObject:v15 forKey:@"debug.mobileasset.currentCompatibilityVersion"];
    }
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_100053F30;
    v23 = &unk_10040B8A8;
    v24 = v5;
    os_state_add_handler();
    queue = v5->_queue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100053F38;
    v18[3] = &unk_10040B880;
    v19 = v24;
    dispatch_async(queue, v18);

    p_super = &v24->super;
LABEL_10:
  }
  return v5;
}

- (void)onAlarm:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100054064;
  v7[3] = &unk_10040D1A0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)onDarwinNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000541E0;
  v7[3] = &unk_10040D1A0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (os_state_data_s)dumpState
{
  v3 = objc_opt_new();
  id v4 = +[NSNumber numberWithBool:self->_retryInProgress];
  [v3 setObject:v4 forKeyedSubscript:@"retryInProgress"];

  v5 = +[NSNumber numberWithUnsignedInt:self->_errorCount];
  [v3 setObject:v5 forKeyedSubscript:@"errorCount"];

  id v6 = +[NSNumber numberWithBool:self->_userInitiated];
  [v3 setObject:v6 forKeyedSubscript:@"userInitiated"];

  v7 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"nextMetadataCheck"];
  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:@"nextMetadataCheck"];
  }
  id v8 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"catalogDownloadStartedOn"];
  if (v8) {
    [v3 setObject:v8 forKeyedSubscript:@"catalogDownloadStartedOn"];
  }
  id v9 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"assetDownloadStartedOn"];
  [v3 setObject:v9 forKeyedSubscript:@"assetDownloadStartedOn"];
  v10 = (os_state_data_s *)sub_1000190DC((uint64_t)"seserviced.mobileassetclient", (uint64_t)v3);

  return v10;
}

- (void)maybeQueryMetadata
{
  v3 = [(SESMobileAssetClient *)self queue];
  dispatch_assert_queue_V2(v3);

  +[SESAlarm clearAlarm:@"com.apple.seserviced.download.catalog"];
  id v4 = [(SESMobileAssetClient *)self userDefaults];
  v5 = [v4 objectForKey:@"nextMetadataCheck"];

  if (v5)
  {
    [v5 timeIntervalSinceNow];
    double v7 = v6;
  }
  else
  {
    double v7 = -1.0;
  }
  [(SESMobileAssetClient *)self metadataQueryInterval];
  if (v7 <= v8)
  {
    id v9 = v5;
  }
  else
  {
    [(SESMobileAssetClient *)self metadataQueryInterval];
    id v9 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");

    v10 = [(SESMobileAssetClient *)self userDefaults];
    [v10 setObject:v9 forKey:@"nextMetadataCheck"];

    v11 = SESDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v14 = 134218242;
      double v15 = v7;
      __int16 v16 = 2112;
      double v17 = *(double *)&v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Clamping ttnc %.0f to interval, next check %@", (uint8_t *)&v14, 0x16u);
    }

    [(SESMobileAssetClient *)self metadataQueryInterval];
    double v7 = v12;
  }
  v13 = SESDefaultLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    double v15 = *(double *)&v9;
    __int16 v16 = 2048;
    double v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "nextCheck %@ ttNC %.0f", (uint8_t *)&v14, 0x16u);
  }

  if (v7 <= 0.0) {
    [(SESMobileAssetClient *)self queryMetadata];
  }
  else {
    +[SESAlarm setAlarm:@"com.apple.seserviced.download.catalog" secondsFromNow:v7];
  }
}

- (void)queryMetadata
{
  v3 = [(SESMobileAssetClient *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SESMobileAssetClient *)self userDefaults];
  v5 = [v4 objectForKey:@"catalogDownloadStartedOn"];

  if (v5)
  {
    [v5 timeIntervalSinceNow];
    double v7 = fabs(v6);
  }
  else
  {
    double v8 = [(SESMobileAssetClient *)self userDefaults];
    id v9 = +[NSDate now];
    [v8 setObject:v9 forKey:@"catalogDownloadStartedOn"];

    double v7 = 0.0;
  }
  v10 = [(SESMobileAssetClient *)self optionsForInterval:v7];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100054768;
  v11[3] = &unk_10040D948;
  v11[4] = self;
  +[MAAsset startCatalogDownload:@"com.apple.MobileAsset.SecureElementServiceAssets" options:v10 then:v11];
}

- (void)queryMA
{
  v3 = [(SESMobileAssetClient *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = SESDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Querying MA", buf, 2u);
  }

  id v5 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.SecureElementServiceAssets"];
  [v5 setDoNotBlockBeforeFirstUnlock:1];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100054B28;
  v7[3] = &unk_10040D998;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [v6 queryMetaData:v7];
}

- (void)handleQueryResult:(int64_t)a3 query:(id)a4
{
  id v6 = a4;
  double v7 = [(SESMobileAssetClient *)self queue];
  dispatch_assert_queue_V2(v7);

  +[SESAlarm clearAlarm:@"com.apple.seserviced.download.asset"];
  switch(a3)
  {
    case 0:
      v10 = [v6 results];
      [(SESMobileAssetClient *)self handleQuerySuccess:v10];

      break;
    case 1:
    case 3:
    case 4:
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
      id v8 = SESDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Asset transient error, retrying", v11, 2u);
      }

      [(SESMobileAssetClient *)self retryWithBackoff:@"com.apple.seserviced.download.asset"];
      break;
    case 2:
      [(SESMobileAssetClient *)self queryMetadata];
      break;
    case 5:
    case 7:
      id v9 = SESDefaultLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Asset fatal error, not retrying", buf, 2u);
      }

      break;
    default:
      break;
  }
}

- (void)handleQuerySuccess:(id)a3
{
  id v4 = a3;
  id v5 = [(SESMobileAssetClient *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (!v7)
  {

LABEL_26:
    v22 = SESDefaultLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Got query success w/ no eligible assets, clearing user initiated flag", buf, 2u);
    }

    [(SESMobileAssetClient *)self setUserInitiated:0];
    goto LABEL_29;
  }
  id v8 = v7;
  char v23 = 0;
  uint64_t v9 = *(void *)v25;
  do
  {
    v10 = 0;
    do
    {
      if (*(void *)v25 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v10);
      double v12 = SESDefaultLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = [v11 assetId];
        id v14 = [v11 state];
        double v15 = [v11 attributes];
        *(_DWORD *)buf = 138412802;
        v29 = v13;
        __int16 v30 = 2048;
        id v31 = v14;
        __int16 v32 = 2112;
        v33 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Got asset id %@ state %ld attributes %@", buf, 0x20u);
      }
      unsigned __int8 v16 = [(SESMobileAssetClient *)self isEligibleAsset:v11];
      id v17 = [v11 state];
      if (v16)
      {
        switch((unint64_t)v17)
        {
          case 0uLL:
            [(SESMobileAssetClient *)self retryWithBackoff:@"com.apple.seserviced.download.asset"];
            break;
          case 1uLL:
          case 4uLL:
            [(SESMobileAssetClient *)self downloadAsset:v11];
            char v23 = 1;
            break;
          case 2uLL:
          case 5uLL:
          case 6uLL:
            [(SESMobileAssetClient *)self handleAvailableAsset:v11];
            break;
          case 3uLL:
            v19 = v11;
            v20 = &stru_10040D9F8;
            goto LABEL_16;
          default:
            break;
        }
      }
      else if (v17 == (id)2 || [v11 state] == (id)3)
      {
        v18 = SESDefaultLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Purging ineligible asset in installed state", buf, 2u);
        }

        v19 = v11;
        v20 = &stru_10040D9D8;
LABEL_16:
        [v19 purge:v20];
      }
      v10 = (char *)v10 + 1;
    }
    while (v8 != v10);
    id v21 = [v6 countByEnumeratingWithState:&v24 objects:v34 count:16];
    id v8 = v21;
  }
  while (v21);

  if ((v23 & 1) == 0) {
    goto LABEL_26;
  }
LABEL_29:
}

- (void)downloadAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(SESMobileAssetClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SESMobileAssetClient *)self userDefaults];
  id v7 = [v6 objectForKey:@"assetDownloadStartedOn"];

  if (v7)
  {
    [v7 timeIntervalSinceNow];
    double v9 = fabs(v8);
  }
  else
  {
    v10 = [(SESMobileAssetClient *)self userDefaults];
    v11 = +[NSDate now];
    [v10 setObject:v11 forKey:@"assetDownloadStartedOn"];

    double v9 = 0.0;
  }
  double v12 = [(SESMobileAssetClient *)self optionsForInterval:v9];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100055230;
  v14[3] = &unk_10040D998;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  [v13 startDownload:v12 then:v14];
}

- (void)handleAvailableAsset:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(SESMobileAssetClient *)self isEligibleAsset:v4])
  {
    id v5 = [v4 getLocalFileUrl];
    if (v5)
    {
      id v6 = [(SESMobileAssetClient *)self mobileAssetManager];
      [v6 handleDownloadedAsset:v5];

      id v7 = SESDefaultLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Set downloaded asset successfully", v10, 2u);
      }

      [v4 purge:&stru_10040DA38];
      [(SESMobileAssetClient *)self setErrorCount:0];
      [(SESMobileAssetClient *)self setUserInitiated:0];
    }
    else
    {
      double v9 = SESDefaultLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Valid asset w/ no URL?", v11, 2u);
      }

      [(SESMobileAssetClient *)self retryWithBackoff:@"com.apple.seserviced.download.asset"];
    }
  }
  else
  {
    double v8 = SESDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Purging ineligible asset", buf, 2u);
    }

    [v4 purge:&stru_10040DA18];
  }
}

- (void)retryWithBackoff:(id)a3
{
  id v4 = a3;
  id v5 = [(SESMobileAssetClient *)self queue];
  dispatch_assert_queue_V2(v5);

  if (+[SESAlarm isAlarmSet:v4])
  {
    id v6 = SESDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Already have alarm for %@ ...", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    unsigned int v7 = [(SESMobileAssetClient *)self errorCount];
    if (v7 >= 6) {
      unsigned int v8 = 6;
    }
    else {
      unsigned int v8 = v7;
    }
    uint64_t v9 = dword_1003776E8[v8];
    [(SESMobileAssetClient *)self setErrorCount:[(SESMobileAssetClient *)self errorCount] + 1];
    v10 = SESDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      id v12 = v4;
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Scheduling retry of %@ for %lu seconds from now", (uint8_t *)&v11, 0x16u);
    }

    +[SESAlarm setAlarm:v4 secondsFromNow:(double)v9];
  }
}

- (BOOL)isEligibleAsset:(id)a3
{
  id v4 = a3;
  id v5 = [v4 attributes];
  id v6 = [v5 objectForKeyedSubscript:@"_CompatibilityVersion"];
  signed int v7 = [v6 intValue];

  if ((id)[(SESMobileAssetClient *)self currentCompatibilityVersion] != (id)v7)
  {
    int v11 = SESDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v16 = 67109376;
      *(_DWORD *)id v17 = v7;
      *(_WORD *)&v17[4] = 2048;
      *(void *)&v17[6] = [(SESMobileAssetClient *)self currentCompatibilityVersion];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Asset ineligible, asset compatVersion %d mine %lu", (uint8_t *)&v16, 0x12u);
    }
    goto LABEL_8;
  }
  unsigned int v8 = [(SESMobileAssetClient *)self mobileAssetManager];
  id v9 = [v8 currentContentVersion];

  v10 = [v4 attributes];
  int v11 = [v10 objectForKeyedSubscript:@"_ContentVersion"];

  unsigned int v12 = [v11 unsignedIntValue];
  BOOL v13 = (unint64_t)v9 < v12;
  if ((unint64_t)v9 >= v12)
  {
    uint64_t v14 = SESDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      *(void *)id v17 = v11;
      *(_WORD *)&v17[8] = 2048;
      *(void *)&v17[10] = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Asset CV %@ <= currentCV %lu", (uint8_t *)&v16, 0x16u);
    }

LABEL_8:
    BOOL v13 = 0;
  }

  return v13;
}

- (id)optionsForInterval:(double)a3
{
  id v5 = objc_opt_new();
  id v6 = v5;
  BOOL v8 = a3 < 259200.0 && !self->_userInitiated;
  [v5 setRequiresPowerPluggedIn:v8];
  BOOL v9 = !self->_userInitiated && a3 < 518400.0;
  [v6 setDiscretionary:v9];
  BOOL v10 = self->_userInitiated || a3 > 518400.0;
  [v6 setAllowsCellularAccess:v10];
  BOOL v12 = a3 > 777600.0 || self->_userInitiated;
  [v6 setAllowsExpensiveAccess:v12];
  if (SESInternalVariant()
    && [(SESMobileAssetClient *)self downloadTimeoutInterval])
  {
    [v6 setTimeoutIntervalForResource:-[SESMobileAssetClient downloadTimeoutInterval](self, "downloadTimeoutInterval")];
  }
  [v6 logOptions];

  return v6;
}

- (void)setErrorCount:(unsigned int)a3
{
  self->_errorCount = a3;
  -[NSUserDefaults setInteger:forKey:](self->_userDefaults, "setInteger:forKey:");
}

- (void)triggerUserInitiatedSync
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055A6C;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setUserInitiated:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_userInitiated = v3;
  userDefaults = self->_userDefaults;

  [(NSUserDefaults *)userDefaults setBool:v3 forKey:@"mobileasset.isUserInitiated"];
}

+ (unint64_t)getWeeksTryingToDownload
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.seserviced"];
  BOOL v3 = [v2 objectForKey:@"catalogDownloadStartedOn"];
  [v3 timeIntervalSinceNow];
  double v5 = fabs(v4);

  id v6 = [v2 objectForKey:@"assetDownloadStartedOn"];
  [v6 timeIntervalSinceNow];
  double v8 = fabs(v7);

  return (unint64_t)(fmax(v5, v8) / 604800.0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (double)metadataQueryInterval
{
  return self->_metadataQueryInterval;
}

- (void)setMetadataQueryInterval:(double)a3
{
  self->_metadataQueryInterval = a3;
}

- (int64_t)downloadTimeoutInterval
{
  return self->_downloadTimeoutInterval;
}

- (void)setDownloadTimeoutInterval:(int64_t)a3
{
  self->_downloadTimeoutInterval = a3;
}

- (BOOL)retryInProgress
{
  return self->_retryInProgress;
}

- (void)setRetryInProgress:(BOOL)a3
{
  self->_retryInProgress = a3;
}

- (unsigned)errorCount
{
  return self->_errorCount;
}

- (unint64_t)currentCompatibilityVersion
{
  return self->_currentCompatibilityVersion;
}

- (void)setCurrentCompatibilityVersion:(unint64_t)a3
{
  self->_currentCompatibilityVersion = a3;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (SESMobileAssetManager)mobileAssetManager
{
  return self->_mobileAssetManager;
}

- (void)setMobileAssetManager:(id)a3
{
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetManager, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end