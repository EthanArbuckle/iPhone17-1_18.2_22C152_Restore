@interface CSKappaCoreAnalytics
+ (int)binValueForAge:(char)a3 bins:()array<float;
- (BOOL)valid;
- (CSKappaCoreAnalytics)initWithSilo:(id)a3 vendor:(id)a4 aopService:(void *)a5;
- (id).cxx_construct;
- (id)sendUserInfoToCoreAnalytics;
- (void)clearSessionInfo;
- (void)clearUserInfo;
- (void)onCompanionMessage:(int)a3 data:(id)a4 receivedTimestamp:(double)a5;
- (void)onKappaSessionUpdate:(int)a3 data:(id)a4;
- (void)processSessionDetails:(KappaSessionDetails *)a3;
- (void)queryCompanion:(int)a3 completion:(id)a4;
- (void)sendLocalKappaSessionInfoToCompanion;
- (void)sendSessionInfoToCoreAnalytics;
- (void)setValid:(BOOL)a3;
- (void)startTimer:(double)a3;
- (void)stopTimer;
- (void)updatePersistedUserInfo;
- (void)updateUserInfoSettings;
- (void)updateUserStats;
- (void)uploadUserInfoWithHandler:(id)a3;
@end

@implementation CSKappaCoreAnalytics

- (void)uploadUserInfoWithHandler:(id)a3
{
  v4 = (void (**)(id, BOOL, NSDictionary *))a3;
  +[CSCoreAnalyticsUtils getSecondsSinceReboot];
  BOOL isSessionActive = self->_isSessionActive;
  if (self->_isSessionActive)
  {
    if (v4)
    {
      cachedUploadedResults = 0;
LABEL_8:
      v4[2](v4, !isSessionActive, cachedUploadedResults);
    }
  }
  else if (+[CSCoreAnalyticsUtils shouldAttemptCoreAnalyticsUploadWithInterval:@"CSKappaCoreAnalyticsLastSuccessfulUpload" persistentKey:(double)self->_userInfoCadence])
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100033594;
    block[3] = &unk_10039F568;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100033684;
    v12[3] = &unk_10039F5B8;
    objc_copyWeak(&v14, &location);
    v8 = v4;
    v13 = v8;
    [(CLTimer *)self->_queryCompanionTimer setHandler:v12];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100033978;
    v9[3] = &unk_10039F608;
    objc_copyWeak(&v11, &location);
    v10 = v8;
    [(CSKappaCoreAnalytics *)self queryCompanion:1 completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    cachedUploadedResults = self->_cachedUploadedResults;
    goto LABEL_8;
  }
}

- (CSKappaCoreAnalytics)initWithSilo:(id)a3 vendor:(id)a4 aopService:(void *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_10039F678);
  }
  v10 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "initWithSilo", buf, 2u);
  }
  self->_valid = 1;
  objc_storeStrong((id *)&self->_vendor, a4);
  self->_aopSvc = a5;
  id v11 = (OS_dispatch_queue *)dispatch_queue_create("CSKappaCoreAnalyticsDispatchQueue", 0);
  dispatchQueue = self->_dispatchQueue;
  self->_dispatchQueue = v11;

  v13 = +[NSUserDefaults standardUserDefaults];
  defaults = self->_defaults;
  self->_defaults = v13;

  v15 = +[NSNull null];
  v16 = +[NSNull null];
  +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v15, v16, 0);
  v17 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  queryCompletions = self->_queryCompletions;
  self->_queryCompletions = v17;

  v19 = [v9 proxyForService:@"CSCompanionService"];
  companion = self->_companion;
  self->_companion = v19;

  [(CSCompanionServiceProtocol *)self->_companion registerDelegate:self inSilo:v8];
  [(CSCompanionServiceProtocol *)self->_companion registerClient:self];
  self->_BOOL isSessionActive = 0;
  [(CSKappaCoreAnalytics *)self clearUserInfo];
  [(CSKappaCoreAnalytics *)self clearSessionInfo];
  v21 = +[CSPersistentConfiguration sharedConfiguration];
  v22 = [v21 objectForKey:@"CSKappaCoreAnalyticsDailyInfo"];

  if (!v22)
  {
    if (qword_1003DB750 != -1) {
      dispatch_once(&qword_1003DB750, &stru_10039F678);
    }
    v23 = qword_1003DB758;
    if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "First time tracking daily aggregates", v28, 2u);
    }
    v22 = +[NSData dataWithBytes:&self->_kappaUserInfo length:84];
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:");
  }
  v24 = (CLTimer *)[v8 newTimer];
  queryCompanionTimer = self->_queryCompanionTimer;
  self->_queryCompanionTimer = v24;

  v26 = +[CSPersistentConfiguration sharedConfiguration];
  self->_userInfoCadence = (int)[v26 integerForKey:@"CoreAnalyticsUserInfoCadence"];

  if (!self->_userInfoCadence) {
    self->_userInfoCadence = 86400;
  }

  return self;
}

- (void)startTimer:(double)a3
{
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_10039F678);
  }
  v5 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "startTimer", v6, 2u);
  }
  [(CLTimer *)self->_queryCompanionTimer setNextFireDelay:a3 interval:1.79769313e308];
}

- (void)stopTimer
{
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_10039F678);
  }
  v3 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "stopTimer", v4, 2u);
  }
  [(CLTimer *)self->_queryCompanionTimer setNextFireDelay:1.79769313e308 interval:1.79769313e308];
}

- (void)clearUserInfo
{
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_10039F678);
  }
  v3 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "clearUserInfo", v4, 2u);
  }
  *(void *)&self->_kappaUserInfo.isCompanionPaired = 0;
  self->_kappaUserInfo.userAgeBin = -1;
  *(_OWORD *)&self->_kappaUserInfo.firstPartyEnabled = 0u;
  *(_OWORD *)&self->_kappaUserInfo.numKappaEvents = 0u;
  *(_OWORD *)&self->_kappaUserInfo.numUISurfaced = 0u;
  *(_OWORD *)&self->_kappaUserInfo.numUserRequestedSOS = 0u;
  *(void *)&self->_kappaUserInfo.numPlacedCalls = 0;
}

- (id)sendUserInfoToCoreAnalytics
{
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_10039F678);
  }
  v3 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "sendUserInfoToCoreAnalytics", buf, 2u);
  }
  v4 = +[CSPermissions sharedInstance];
  unsigned int v39 = [v4 isAuthorizedForIS];

  +[CSCoreAnalyticsUtils getSecondsSinceReboot];
  double v6 = v5;
  if (v5 > (double)self->_userInfoCadence)
  {
    if (qword_1003DB750 != -1) {
      dispatch_once(&qword_1003DB750, &stru_10039F678);
    }
    v7 = qword_1003DB758;
    if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
    {
      unint64_t userInfoCadence = self->_userInfoCadence;
      *(_DWORD *)buf = 134217984;
      unint64_t v42 = userInfoCadence;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "secondsSinceReboot exceeds UserInfo cadence. Capping at cadence pd:%llu", buf, 0xCu);
    }
    double v6 = (double)self->_userInfoCadence;
  }
  if (v39)
  {
    v47[0] = @"didEnableKappaDetection";
    id v9 = +[NSNumber numberWithBool:self->_kappaUserInfo.didEnableKappaDetection];
    v48[0] = v9;
    v47[1] = @"didEnableKappaDetection_companion";
    v38 = +[NSNumber numberWithBool:self->_kappaUserInfo.didEnableKappaDetection_companion];
    v48[1] = v38;
    v47[2] = @"isImproveSafetyEnabled";
    v37 = +[NSNumber numberWithBool:self->_kappaUserInfo.isImproveSafetyEnabled];
    v48[2] = v37;
    v47[3] = @"isImproveSafetyEnabled_companion";
    v36 = +[NSNumber numberWithBool:self->_kappaUserInfo.isImproveSafetyEnabled_companion];
    v48[3] = v36;
    v47[4] = @"userAgeBin";
    v35 = +[NSNumber numberWithInt:self->_kappaUserInfo.userAgeBin];
    v48[4] = v35;
    v47[5] = @"firstPartyEnabled";
    v34 = +[NSNumber numberWithBool:self->_kappaUserInfo.firstPartyEnabled];
    v48[5] = v34;
    v47[6] = @"thirdPartyEnabled";
    v33 = +[NSNumber numberWithBool:self->_kappaUserInfo.thirdPartyEnabled];
    v48[6] = v33;
    v47[7] = @"firstPartyEnabled_companion";
    v32 = +[NSNumber numberWithBool:self->_kappaUserInfo.firstPartyEnabled_companion];
    v48[7] = v32;
    v47[8] = @"thirdPartyEnabled_companion";
    v31 = +[NSNumber numberWithBool:self->_kappaUserInfo.thirdPartyEnabled_companion];
    v48[8] = v31;
    v47[9] = @"totalDrivingTime";
    v30 = +[NSNumber numberWithInt:self->_kappaUserInfo.totalDrivingTime];
    v48[9] = v30;
    v47[10] = @"numKappaSessions";
    v29 = +[NSNumber numberWithInt:self->_kappaUserInfo.numKappaSessions];
    v48[10] = v29;
    v47[11] = @"numKappaEvents";
    v28 = +[NSNumber numberWithInt:self->_kappaUserInfo.numKappaEvents];
    v48[11] = v28;
    v47[12] = @"numTriggersAllSessions";
    v27 = +[NSNumber numberWithInt:self->_kappaUserInfo.numTriggersAllSessions];
    v48[12] = v27;
    v47[13] = @"numUISurfaced";
    v26 = +[NSNumber numberWithInt:self->_kappaUserInfo.numUISurfaced];
    v48[13] = v26;
    v47[14] = @"numCancelledUI";
    v25 = +[NSNumber numberWithInt:self->_kappaUserInfo.numCancelledUI];
    v48[14] = v25;
    v47[15] = @"numUserRequestedSOS";
    v24 = +[NSNumber numberWithInt:self->_kappaUserInfo.numUserRequestedSOS];
    v48[15] = v24;
    v47[16] = @"numAutoRequestedSOS";
    v23 = +[NSNumber numberWithInt:self->_kappaUserInfo.numAutoRequestedSOS];
    v48[16] = v23;
    v47[17] = @"numPlacedCalls";
    v22 = +[NSNumber numberWithInt:self->_kappaUserInfo.numPlacedCalls];
    v48[17] = v22;
    v47[18] = @"numKappaSessions_companion";
    v21 = +[NSNumber numberWithInt:self->_kappaUserInfo.numKappaSessions_companion];
    v48[18] = v21;
    v47[19] = @"numKappaEvents_companion";
    v20 = +[NSNumber numberWithInt:self->_kappaUserInfo.numKappaEvents_companion];
    v48[19] = v20;
    v47[20] = @"numTriggersAllSessions_companion";
    v10 = +[NSNumber numberWithInt:self->_kappaUserInfo.numTriggersAllSessions_companion];
    v48[20] = v10;
    v47[21] = @"numUISurfaced_companion";
    id v11 = +[NSNumber numberWithInt:self->_kappaUserInfo.numUISurfaced_companion];
    v48[21] = v11;
    v47[22] = @"numCancelledUI_companion";
    v12 = +[NSNumber numberWithInt:self->_kappaUserInfo.numCancelledUI_companion];
    v48[22] = v12;
    v47[23] = @"numUserRequestedSOS_companion";
    v13 = +[NSNumber numberWithInt:self->_kappaUserInfo.numUserRequestedSOS_companion];
    v48[23] = v13;
    v47[24] = @"numAutoRequestedSOS_companion";
    id v14 = +[NSNumber numberWithInt:self->_kappaUserInfo.numAutoRequestedSOS_companion];
    v48[24] = v14;
    v47[25] = @"numPlacedCalls_companion";
    v15 = +[NSNumber numberWithInt:self->_kappaUserInfo.numPlacedCalls_companion];
    v48[25] = v15;
    v47[26] = @"minutesSinceReboot_capped";
    v16 = +[NSNumber numberWithDouble:v6 / 60.0];
    v48[26] = v16;
    v17 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:27];
  }
  else
  {
    v45[0] = @"didEnableKappaDetection";
    id v9 = +[NSNumber numberWithBool:self->_kappaUserInfo.didEnableKappaDetection];
    v46[0] = v9;
    v45[1] = @"didEnableKappaDetection_companion";
    v38 = +[NSNumber numberWithBool:self->_kappaUserInfo.didEnableKappaDetection_companion];
    v46[1] = v38;
    v45[2] = @"isImproveSafetyEnabled";
    v37 = +[NSNumber numberWithBool:self->_kappaUserInfo.isImproveSafetyEnabled];
    v46[2] = v37;
    v45[3] = @"isImproveSafetyEnabled_companion";
    v36 = +[NSNumber numberWithBool:self->_kappaUserInfo.isImproveSafetyEnabled_companion];
    v46[3] = v36;
    v45[4] = @"firstPartyEnabled";
    v35 = +[NSNumber numberWithBool:self->_kappaUserInfo.firstPartyEnabled];
    v46[4] = v35;
    v45[5] = @"thirdPartyEnabled";
    v34 = +[NSNumber numberWithBool:self->_kappaUserInfo.thirdPartyEnabled];
    v46[5] = v34;
    v45[6] = @"firstPartyEnabled_companion";
    v33 = +[NSNumber numberWithBool:self->_kappaUserInfo.firstPartyEnabled_companion];
    v46[6] = v33;
    v45[7] = @"thirdPartyEnabled_companion";
    v32 = +[NSNumber numberWithBool:self->_kappaUserInfo.thirdPartyEnabled_companion];
    v46[7] = v32;
    v17 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:8];
  }

  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_10039F678);
  }
  v18 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    unint64_t v42 = (unint64_t)v17;
    __int16 v43 = 1024;
    unsigned int v44 = v39;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "UserInfo:%@, ImproveSafety:%d", buf, 0x12u);
  }
  id v40 = v17;
  AnalyticsSendEventLazy();
  objc_storeStrong((id *)&self->_cachedUploadedResults, v17);

  return v40;
}

- (void)clearSessionInfo
{
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_10039F678);
  }
  v3 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "clearSessionInfo", v4, 2u);
  }
  self->_BOOL isSessionActive = 0;
  *(void *)&self->_kappaSessionInfo.detectionDecision = 0;
  self->_kappaSessionInfo.drivingTimeStartToFirstTrigger = 0;
  self->_kappaSessionInfo.sessionStartTimestamp = -1.0;
  *(void *)&self->_kappaSessionInfo.sessionDuration = 0;
  *(void *)&self->_kappaSessionInfo.numTriggers = 0;
  *(void *)&self->_kappaSessionInfo.numRolloverCrashes = 0;
  self->_kappaSessionInfo.numDeescalations = 0;
  *(int32x2_t *)&self->_kappaSessionInfo.coarseLat = vdup_n_s32(0x447A0000u);
  self->_kappaSessionInfo.sunElevation = 1000.0;
  *(void *)&self->_kappaSessionInfo.signalEnvironment = 1000;
  *(void *)&self->_kappaSessionInfo.maxDeltaVXYOverEpoch = 0xBF80000000000000;
  *(void *)&self->_kappaSessionInfo.didRaiseUI = 0;
  *(void *)&self->_kappaSessionInfo.isSOSResponseSuccessPushedToCompanion = 0;
}

- (void)processSessionDetails:(KappaSessionDetails *)a3
{
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_10039F678);
  }
  double v5 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "processSessionDetails", v8, 2u);
  }
  self->_kappaSessionInfo.trigger_bitmap = a3->trigger_bitmap;
  int signalEnvironment = a3->signalEnvironment;
  self->_kappaSessionInfo.gpsDuration = a3->gpsCount;
  self->_kappaSessionInfo.serverConfigVersion = a3->serverConfigVersion;
  self->_kappaSessionInfo.int signalEnvironment = signalEnvironment;
  *(_OWORD *)&self->_kappaSessionInfo.numPlanarCrashes = *(_OWORD *)&a3->numPlanarCrashes;
  uint64_t v7 = *(void *)&a3->maxDeltaVXYBiggestImpact;
  *(void *)&self->_kappaSessionInfo.coarseLat = *(void *)&a3->coarseLat;
  self->_kappaSessionInfo.sunElevation = a3->sunElevation;
  *(void *)&self->_kappaSessionInfo.maxDeltaVXYBiggestImpact = v7;
}

- (void)sendLocalKappaSessionInfoToCompanion
{
  [(CSKappaCoreAnalytics *)self updateUserInfoSettings];
  BOOL didEnableKappaDetection = self->_kappaUserInfo.didEnableKappaDetection;
  v12[0] = self->_kappaUserInfo.didEnableKappaDetection;
  BOOL isImproveSafetyEnabled = self->_kappaUserInfo.isImproveSafetyEnabled;
  v12[1] = self->_kappaUserInfo.isImproveSafetyEnabled;
  BOOL firstPartyEnabled = self->_kappaUserInfo.firstPartyEnabled;
  v12[2] = self->_kappaUserInfo.firstPartyEnabled;
  BOOL thirdPartyEnabled = self->_kappaUserInfo.thirdPartyEnabled;
  v12[3] = self->_kappaUserInfo.thirdPartyEnabled;
  BOOL detectionDecision = self->_kappaSessionInfo.detectionDecision;
  int numTriggers = self->_kappaSessionInfo.numTriggers;
  int v14 = numTriggers;
  BOOL v13 = detectionDecision;
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_10039F678);
  }
  id v9 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67110400;
    BOOL v16 = didEnableKappaDetection;
    __int16 v17 = 1024;
    BOOL v18 = isImproveSafetyEnabled;
    __int16 v19 = 1024;
    BOOL v20 = firstPartyEnabled;
    __int16 v21 = 1024;
    BOOL v22 = thirdPartyEnabled;
    __int16 v23 = 1024;
    BOOL v24 = detectionDecision;
    __int16 v25 = 1024;
    int v26 = numTriggers;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "sendLocalKappaSessionInfoToCompanion %d %d %d %d %d %d", buf, 0x26u);
  }
  companion = self->_companion;
  id v11 = +[NSData dataWithBytes:v12 length:12];
  [(CSCompanionServiceProtocol *)companion sendData:v11 type:8];
}

- (void)queryCompanion:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_10039F678);
  }
  uint64_t v7 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "queryCompanion type:%d", (uint8_t *)v10, 8u);
  }
  queryCompletions = self->_queryCompletions;
  id v9 = objc_retainBlock(v6);
  [(NSMutableArray *)queryCompletions replaceObjectAtIndex:v4 withObject:v9];

  [(CSCompanionServiceProtocol *)self->_companion queryCompanion:v4];
  [(CSKappaCoreAnalytics *)self startTimer:5.0];
}

- (void)sendSessionInfoToCoreAnalytics
{
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_10039F678);
  }
  v3 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "sendSessionInfoToCoreAnalytics", buf, 2u);
  }
  uint64_t v4 = +[CSPermissions sharedInstance];
  unsigned __int8 v5 = [v4 isAuthorizedForIS];

  if (v5)
  {
    v47[0] = @"detectionDecision";
    __int16 v43 = +[NSNumber numberWithBool:self->_kappaSessionInfo.detectionDecision];
    v48[0] = v43;
    v47[1] = @"isCompanionConnected";
    v41 = +[NSNumber numberWithBool:self->_kappaSessionInfo.isCompanionConnected];
    v48[1] = v41;
    v47[2] = @"didCompanionTrigger";
    id v40 = +[NSNumber numberWithBool:self->_kappaSessionInfo.didCompanionTrigger];
    v48[2] = v40;
    v47[3] = @"companionDetectionDecision";
    unsigned int v39 = +[NSNumber numberWithBool:self->_kappaSessionInfo.companionDetectionDecision];
    v48[3] = v39;
    v47[4] = @"trigger_bitmap";
    v38 = +[NSNumber numberWithInt:self->_kappaSessionInfo.trigger_bitmap];
    v48[4] = v38;
    v47[5] = @"drivingTimeStartToFirstTrigger";
    v37 = +[NSNumber numberWithInt:self->_kappaSessionInfo.drivingTimeStartToFirstTrigger];
    v48[5] = v37;
    v47[6] = @"sessionDuration";
    v36 = +[NSNumber numberWithInt:self->_kappaSessionInfo.sessionDuration];
    v48[6] = v36;
    v47[7] = @"gpsDuration";
    v35 = +[NSNumber numberWithInt:self->_kappaSessionInfo.gpsDuration];
    v48[7] = v35;
    v47[8] = @"numTriggers";
    v34 = +[NSNumber numberWithInt:self->_kappaSessionInfo.numTriggers];
    v48[8] = v34;
    v47[9] = @"numPlanarCrashes";
    v33 = +[NSNumber numberWithInt:self->_kappaSessionInfo.numPlanarCrashes];
    v48[9] = v33;
    v47[10] = @"numRolloverCrashes";
    v32 = +[NSNumber numberWithInt:self->_kappaSessionInfo.numRolloverCrashes];
    v48[10] = v32;
    v47[11] = @"numHighSpeedCrashes";
    v31 = +[NSNumber numberWithInt:self->_kappaSessionInfo.numHighSpeedCrashes];
    v48[11] = v31;
    v47[12] = @"numDeescalations";
    v30 = +[NSNumber numberWithInt:self->_kappaSessionInfo.numDeescalations];
    v48[12] = v30;
    v47[13] = @"maxDeltaVXYBiggestImpact";
    v29 = +[NSNumber numberWithInt:self->_kappaSessionInfo.maxDeltaVXYBiggestImpact];
    v48[13] = v29;
    v47[14] = @"maxDeltaVXYOverEpoch";
    v28 = +[NSNumber numberWithInt:self->_kappaSessionInfo.maxDeltaVXYOverEpoch];
    v48[14] = v28;
    v47[15] = @"serverConfigVersion";
    *(float *)&double v6 = self->_kappaSessionInfo.serverConfigVersion;
    v27 = +[NSNumber numberWithFloat:v6];
    v48[15] = v27;
    v47[16] = @"didRaiseUI";
    int v26 = +[NSNumber numberWithBool:self->_kappaSessionInfo.didRaiseUI];
    v48[16] = v26;
    v47[17] = @"didRaiseUI_companion";
    __int16 v25 = +[NSNumber numberWithBool:self->_kappaSessionInfo.didRaiseUI_companion];
    v48[17] = v25;
    v47[18] = @"didCancelUI";
    BOOL v24 = +[NSNumber numberWithBool:self->_kappaSessionInfo.didCancelUI];
    v48[18] = v24;
    v47[19] = @"didCancelUI_companion";
    __int16 v23 = +[NSNumber numberWithBool:self->_kappaSessionInfo.didCancelUI_companion];
    v48[19] = v23;
    v47[20] = @"isSOSResponseSuccess";
    BOOL v22 = +[NSNumber numberWithBool:self->_kappaSessionInfo.isSOSResponseSuccess];
    v48[20] = v22;
    v47[21] = @"isSOSResponseSuccessPushedToCompanion";
    uint64_t v7 = +[NSNumber numberWithBool:self->_kappaSessionInfo.isSOSResponseSuccessPushedToCompanion];
    v48[21] = v7;
    v47[22] = @"isSOSResponseAlreadyActive";
    id v8 = +[NSNumber numberWithBool:self->_kappaSessionInfo.isSOSResponseAlreadyActive];
    v48[22] = v8;
    v47[23] = @"isSOSResponseFailed";
    id v9 = +[NSNumber numberWithBool:self->_kappaSessionInfo.isSOSResponseFailed];
    v48[23] = v9;
    v47[24] = @"isSOSResponseNotSupported";
    v10 = +[NSNumber numberWithBool:self->_kappaSessionInfo.isSOSResponseNotSupported];
    v48[24] = v10;
    v47[25] = @"isSOSResponseNotEnabled";
    id v11 = +[NSNumber numberWithBool:self->_kappaSessionInfo.isSOSResponseNotEnabled];
    v48[25] = v11;
    v47[26] = @"isSOSUserInitiated";
    v12 = +[NSNumber numberWithBool:self->_kappaSessionInfo.isSOSUserInitiated];
    v48[26] = v12;
    void v47[27] = @"isSOSAutoInitiated";
    BOOL v13 = +[NSNumber numberWithBool:self->_kappaSessionInfo.isSOSAutoInitiated];
    void v48[27] = v13;
    v47[28] = @"didPlaceCall";
    int v14 = +[NSNumber numberWithBool:self->_kappaSessionInfo.didPlaceCall];
    v48[28] = v14;
    unint64_t v42 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:29];

    id v15 = objc_alloc_init((Class)NSMutableDictionary);
    [v15 setDictionary:v42];
    if (self->_kappaSessionInfo.coarseLat != 1000.0)
    {
      BOOL v16 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v15 setObject:v16 forKeyedSubscript:@"coarseLat"];
    }
    if (self->_kappaSessionInfo.coarseLong != 1000.0)
    {
      __int16 v17 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v15 setObject:v17 forKeyedSubscript:@"coarseLong"];
    }
    if (self->_kappaSessionInfo.sunElevation != 1000.0)
    {
      BOOL v18 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v15 setObject:v18 forKeyedSubscript:@"sunElevation"];
    }
    if (self->_kappaSessionInfo.signalEnvironment != 1000)
    {
      __int16 v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      [v15 setObject:v19 forKeyedSubscript:@"signalEnvironment"];
    }
    if (qword_1003DB750 != -1) {
      dispatch_once(&qword_1003DB750, &stru_10039F678);
    }
    BOOL v20 = qword_1003DB758;
    if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "SessionInfo:%@", buf, 0xCu);
    }
    id v44 = v15;
    AnalyticsSendEventLazy();
  }
  else
  {
    if (qword_1003DB750 != -1) {
      dispatch_once(&qword_1003DB750, &stru_10039F678);
    }
    __int16 v21 = qword_1003DB758;
    if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Not authorized to collect data, discarding session info", buf, 2u);
    }
  }
}

- (void)updatePersistedUserInfo
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035C84;
  block[3] = &unk_10039F568;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (void)updateUserInfoSettings
{
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_10039F678);
  }
  v3 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "updateUserInfoSettings", (uint8_t *)&v7, 2u);
  }
  self->_kappaUserInfo.BOOL didEnableKappaDetection = +[SOSKappaManager isKappaEnabled];
  self->_kappaUserInfo.BOOL firstPartyEnabled = +[SOSUtilities kappaTriggersEmergencySOS];
  uint64_t v4 = +[SOSUtilities getKappaThirdPartyDisplayNameForApp];
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_10039F678);
  }
  unsigned __int8 v5 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "appName %@", (uint8_t *)&v7, 0xCu);
  }
  self->_kappaUserInfo.BOOL thirdPartyEnabled = v4 != 0;
  self->_kappaUserInfo.didEnableKappaDetection |= v4 != 0;
  double v6 = +[CSPermissions sharedInstance];
  self->_kappaUserInfo.BOOL isImproveSafetyEnabled = [v6 isAuthorizedForIS];

  self->_kappaUserInfo.isCompanionPaired = [(CSCompanionServiceProtocol *)self->_companion syncget_isCompanionPaired];
}

- (void)updateUserStats
{
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_10039F678);
  }
  v3 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "updateUserStats", buf, 2u);
  }
  uint64_t v4 = objc_alloc_init(CSCAStat);
  unsigned __int8 v5 = +[CSPlatformInfo sharedInstance];
  unsigned __int8 v6 = [v5 isKappaLoggingDevice];

  if (v6)
  {
    if (qword_1003DB750 != -1) {
      dispatch_once(&qword_1003DB750, &stru_10039F678);
    }
    int v7 = qword_1003DB758;
    if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "getStat not supported", buf, 2u);
    }
    int v8 = -1;
    self->_kappaUserInfo.int userAgeBin = -1;
  }
  else
  {
    CSAOPSvc::getStat((CSAOPSvc *)self->_aopSvc, v4);
    int v13 = 1112014848;
    long long v12 = xmmword_100338C48;
    self->_kappaUserInfo.int userAgeBin = +[CSKappaCoreAnalytics binValueForAge:[(CSCAStat *)v4 userAge] bins:&v12];
    int v8 = [(CSCAStat *)v4 armedSec];
  }
  self->_kappaUserInfo.int totalDrivingTime = v8;
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_10039F678);
  }
  id v9 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    int userAgeBin = self->_kappaUserInfo.userAgeBin;
    int totalDrivingTime = self->_kappaUserInfo.totalDrivingTime;
    *(_DWORD *)buf = 67109376;
    int v15 = userAgeBin;
    __int16 v16 = 1024;
    int v17 = totalDrivingTime;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "age:%d, drivingTime:%d", buf, 0xEu);
  }
}

+ (int)binValueForAge:(char)a3 bins:()array<float
{
  for (uint64_t i = 0; i != 5; ++i)
  {
    if (a4->var0[i] >= (float)a3) {
      break;
    }
  }
  return i;
}

- (void)onKappaSessionUpdate:(int)a3 data:(id)a4
{
  id v6 = a4;
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_10039F678);
  }
  int v7 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "onKappaSessionUpdate type:%d", buf, 8u);
  }
  switch(a3)
  {
    case 1:
      ++self->_kappaUserInfo.numKappaEvents;
      self->_kappaSessionInfo.BOOL detectionDecision = 1;
      break;
    case 2:
      [v6 getBytes:buf length:112];
      if ((buf[1] & 0x14) == 0)
      {
        if (self->_kappaSessionInfo.sessionStartTimestamp == -1.0)
        {
          ++self->_kappaUserInfo.numKappaSessions;
          self->_kappaSessionInfo.sessionStartTimestamp = CFAbsoluteTimeGetCurrent();
          self->_BOOL isSessionActive = 1;
        }
        ++self->_kappaUserInfo.numTriggersAllSessions;
        ++self->_kappaSessionInfo.numTriggers;
        self->_kappaSessionInfo.drivingTimeStartToFirstTrigger = *(unsigned __int16 *)&buf[2];
      }
      break;
    case 3:
      self->_kappaSessionInfo.int sessionDuration = (int)(CFAbsoluteTimeGetCurrent()
                                                    - self->_kappaSessionInfo.sessionStartTimestamp);
      if (qword_1003DB750 != -1) {
        dispatch_once(&qword_1003DB750, &stru_10039F678);
      }
      int v8 = qword_1003DB758;
      if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
      {
        int sessionDuration = self->_kappaSessionInfo.sessionDuration;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = sessionDuration;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "onKappaSessionUpdate sessionDuration:%d", buf, 8u);
      }
      break;
    case 4:
      *(void *)buf = 0;
      [v6 getBytes:buf length:8];
      switch(*(void *)buf)
      {
        case 0:
          self->_kappaSessionInfo.isSOSResponseSuccess = 1;
          break;
        case 1:
          self->_kappaSessionInfo.isSOSResponseNotSupported = 1;
          break;
        case 2:
        case 6:
          self->_kappaSessionInfo.isSOSResponseAlreadyActive = 1;
          break;
        case 3:
          self->_kappaSessionInfo.isSOSResponseFailed = 1;
          break;
        case 4:
          self->_kappaSessionInfo.isSOSResponseNotEnabled = 1;
          break;
        case 5:
          self->_kappaSessionInfo.isSOSResponseSuccessPushedToCompanion = 1;
          break;
        default:
          goto LABEL_42;
      }
      break;
    case 5:
      buf[0] = 0;
      [v6 getBytes:buf length:1];
      if (buf[0])
      {
        ++self->_kappaUserInfo.numUISurfaced;
        self->_kappaSessionInfo.didRaiseUI = 1;
      }
      else
      {
        ++self->_kappaUserInfo.numUISurfaced_companion;
        self->_kappaSessionInfo.didRaiseUI_companion = 1;
      }
      break;
    case 6:
      buf[0] = 0;
      [v6 getBytes:buf length:1];
      if (buf[0])
      {
        ++self->_kappaUserInfo.numCancelledUI;
        self->_kappaSessionInfo.didCancelUI = 1;
      }
      else
      {
        ++self->_kappaUserInfo.numCancelledUI_companion;
        self->_kappaSessionInfo.didCancelUI_companion = 1;
      }
      break;
    case 7:
      buf[0] = 0;
      [v6 getBytes:buf length:1];
      uint64_t v12 = 76;
      if (!buf[0]) {
        uint64_t v12 = 80;
      }
      uint64_t v13 = 92;
      if (!buf[0]) {
        uint64_t v13 = 96;
      }
      ++*(_DWORD *)((char *)&self->super.isa + v12);
      ++*(_DWORD *)((char *)&self->super.isa + v13);
      self->_kappaSessionInfo.isSOSUserInitiated = 1;
      self->_kappaSessionInfo.didPlaceCall = 1;
      break;
    case 8:
      buf[0] = 0;
      [v6 getBytes:buf length:1];
      uint64_t v10 = 84;
      if (!buf[0]) {
        uint64_t v10 = 88;
      }
      uint64_t v11 = 92;
      if (!buf[0]) {
        uint64_t v11 = 96;
      }
      ++*(_DWORD *)((char *)&self->super.isa + v10);
      ++*(_DWORD *)((char *)&self->super.isa + v11);
      *(_WORD *)&self->_kappaSessionInfo.isSOSAutoInitiated = 257;
      break;
    case 9:
      if (self->_isSessionActive)
      {
        *(_DWORD *)buf = -1082130432;
        uint8_t buf[4] = 0;
        long long v16 = 0uLL;
        *(void *)&buf[8] = 0;
        *(int32x2_t *)&long long v17 = vdup_n_s32(0x447A0000u);
        *((void *)&v17 + 1) = 0x3E8447A0000;
        LODWORD(v21) = 0;
        *((void *)&v23 + 1) = 0;
        long long v18 = 0u;
        long long v19 = 0u;
        memset(v20, 0, 29);
        long long v22 = 0uLL;
        *((void *)&v21 + 1) = 0;
        LOWORD(v23) = 0;
        [v6 getBytes:buf length:160];
        v14[6] = *(_OWORD *)&v20[16];
        v14[7] = v21;
        v14[8] = v22;
        v14[9] = v23;
        v14[2] = v17;
        v14[3] = v18;
        v14[4] = v19;
        v14[5] = *(_OWORD *)v20;
        v14[0] = *(_OWORD *)buf;
        v14[1] = v16;
        [(CSKappaCoreAnalytics *)self processSessionDetails:v14];
        [(CSKappaCoreAnalytics *)self sendLocalKappaSessionInfoToCompanion];
        [(CSKappaCoreAnalytics *)self sendSessionInfoToCoreAnalytics];
      }
      [(CSKappaCoreAnalytics *)self clearSessionInfo];
      [(CSKappaCoreAnalytics *)self updatePersistedUserInfo];
      break;
    case 10:
      self->_kappaSessionInfo.isCompanionConnected = 1;
      break;
    default:
      break;
  }
LABEL_42:
}

- (void)onCompanionMessage:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  id v7 = a4;
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_10039F678);
  }
  int v8 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "onCompanionMessage type:%d", buf, 8u);
  }
  switch(a3)
  {
    case 3:
      [v7 getBytes:buf length:40];
      if ((v32 & 0x400) == 0 && vabdd_f64(*(double *)buf, self->_kappaSessionInfo.sessionStartTimestamp) <= 5.0) {
        self->_kappaSessionInfo.didCompanionTrigger = 1;
      }
      break;
    case 6:
      if (self->_isSessionActive) {
        self->_kappaSessionInfo.companionDetectionDecision = 1;
      }
      break;
    case 8:
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100037680;
      block[3] = &unk_10039C138;
      id v27 = v7;
      v28 = self;
      dispatch_sync(dispatchQueue, block);

      break;
    case 9:
      int v25 = 0;
      [v7 getBytes:&v25 length:4];
      if (qword_1003DB750 != -1) {
        dispatch_once(&qword_1003DB750, &stru_10039F678);
      }
      uint64_t v10 = qword_1003DB758;
      if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v25;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "kTypeCompanionQuery queryType:%d", buf, 8u);
      }
      if (v25 == 1)
      {
        [(CSKappaCoreAnalytics *)self updateUserInfoSettings];
        *(_DWORD *)v29 = v25;
        BOOL didEnableKappaDetection = self->_kappaUserInfo.didEnableKappaDetection;
        LOBYTE(v30) = self->_kappaUserInfo.didEnableKappaDetection;
        BOOL isImproveSafetyEnabled = self->_kappaUserInfo.isImproveSafetyEnabled;
        BYTE1(v30) = self->_kappaUserInfo.isImproveSafetyEnabled;
        BOOL firstPartyEnabled = self->_kappaUserInfo.firstPartyEnabled;
        BYTE2(v30) = self->_kappaUserInfo.firstPartyEnabled;
        BOOL thirdPartyEnabled = self->_kappaUserInfo.thirdPartyEnabled;
        HIBYTE(v30) = self->_kappaUserInfo.thirdPartyEnabled;
        if (qword_1003DB750 != -1) {
          dispatch_once(&qword_1003DB750, &stru_10039F678);
        }
        int v15 = qword_1003DB758;
        if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)&uint8_t buf[4] = didEnableKappaDetection;
          __int16 v32 = 1024;
          BOOL v33 = isImproveSafetyEnabled;
          __int16 v34 = 1024;
          BOOL v35 = firstPartyEnabled;
          __int16 v36 = 1024;
          BOOL v37 = thirdPartyEnabled;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "kTypeCompanionQuery didEnableKappaDetection:%d isImproveSafetyEnabled:%d firstPartyEnabled:%d thirdPartyEnabled:%d", buf, 0x1Au);
        }
        id v16 = [objc_alloc((Class)NSMutableData) initWithBytes:v29 length:8];
        [(CSCompanionServiceProtocol *)self->_companion returnQueryToCompanion:v16];
      }
      break;
    case 10:
      [v7 getBytes:buf length:8];
      if (qword_1003DB750 != -1) {
        dispatch_once(&qword_1003DB750, &stru_10039F678);
      }
      long long v17 = qword_1003DB758;
      if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v29 = 67109120;
        int v30 = *(_DWORD *)buf;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "kTypeCompanionQueryReturn queryType:%d", v29, 8u);
      }
      if (*(_DWORD *)buf == 1)
      {
        long long v18 = [(NSMutableArray *)self->_queryCompletions objectAtIndex:1];
        long long v19 = +[NSNull null];
        BOOL v20 = v18 == v19;

        if (v20)
        {
          if (qword_1003DB750 != -1) {
            dispatch_once(&qword_1003DB750, &stru_10039F678);
          }
          BOOL v24 = qword_1003DB758;
          if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v29 = 67109120;
            int v30 = *(_DWORD *)buf;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "CoreAnalytics No completion block for type %d found, ignoring", v29, 8u);
          }
        }
        else
        {
          long long v21 = [(NSMutableArray *)self->_queryCompletions objectAtIndex:1];
          ((void (**)(void, id, void))v21)[2](v21, v7, *(unsigned int *)buf);
          queryCompletions = self->_queryCompletions;
          long long v23 = +[NSNull null];
          [(NSMutableArray *)queryCompletions replaceObjectAtIndex:1 withObject:v23];
        }
      }
      break;
    default:
      break;
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryCompletions, 0);
  objc_storeStrong((id *)&self->_cachedUploadedResults, 0);
  objc_storeStrong((id *)&self->_queryCompanionTimer, 0);
  objc_storeStrong((id *)&self->_companion, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_defaults, 0);

  objc_storeStrong((id *)&self->_vendor, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 20) = 0;
  *((_DWORD *)self + 4) = 0;
  *((_DWORD *)self + 6) = -1;
  *(_OWORD *)((char *)self + 28) = 0u;
  *(_OWORD *)((char *)self + 44) = 0u;
  *(_OWORD *)((char *)self + 60) = 0u;
  *(_OWORD *)((char *)self + 76) = 0u;
  *(void *)((char *)self + 92) = 0;
  return self;
}

@end