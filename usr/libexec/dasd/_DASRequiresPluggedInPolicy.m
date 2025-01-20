@interface _DASRequiresPluggedInPolicy
+ (BOOL)isIgnorableNotChargingReason:(unint64_t)a3;
+ (BOOL)isWirelessCharger:(id)a3;
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)deficitProcessing;
- (BOOL)deviceIsToppingOff:(unint64_t)a3;
- (BOOL)ignoreIsCharging;
- (BOOL)isIpad;
- (BOOL)requiresPluginForActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (NSArray)triggers;
- (NSDate)lastPredictionTimelineUpdate;
- (NSString)policyDescription;
- (NSString)policyName;
- (NSUserDefaults)pluginStatusDefaults;
- (OS_dispatch_queue)statsRecordingQueue;
- (_CDContextualKeyPath)batteryStatusKeyPath;
- (_CDContextualKeyPath)topOffCheckpointKeypath;
- (_CDContextualKeyPath)watchIsPluggedInKeyPath;
- (_DASRequiresPluggedInPolicy)init;
- (_DKPredictionTimeline)pluginTimeline;
- (_DKPredictor)predictor;
- (double)predictedScoreForActivity:(id)a3 atDate:(id)a4;
- (double)scoreForActivity:(id)a3 isPluggedIn:(BOOL)a4;
- (double)scoreForActivity:(id)a3 withBatteryStatus:(id)a4 withTopOffStatus:(unint64_t)a5 timeSincePluginStateChange:(double)a6 atDate:(id)a7 rationale:(id)a8;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)predictionForDevicePluggedIn;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (unint64_t)lastNotChargingReason;
- (unint64_t)notChargingReason;
- (void)computeAndRecordPolicyDurationStatsWhilePluggedIn:(BOOL)a3 considerPluggedIn:(BOOL)a4 atDate:(id)a5;
- (void)setBatteryStatusKeyPath:(id)a3;
- (void)setDeficitProcessing:(BOOL)a3;
- (void)setIgnoreIsCharging:(BOOL)a3;
- (void)setIsIpad:(BOOL)a3;
- (void)setLastNotChargingReason:(unint64_t)a3;
- (void)setLastPredictionTimelineUpdate:(id)a3;
- (void)setPluginStatusDefaults:(id)a3;
- (void)setPluginTimeline:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setPredictor:(id)a3;
- (void)setStatsRecordingQueue:(id)a3;
- (void)setTopOffCheckpointKeypath:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setWatchIsPluggedInKeyPath:(id)a3;
- (void)updateRationaleForTransferSize:(id)a3 withActivity:(id)a4;
@end

@implementation _DASRequiresPluggedInPolicy

+ (BOOL)isWirelessCharger:(id)a3
{
  id v3 = a3;
  v4 = +[_CDContextQueries batteryAdapterIsWirelessKey];
  v5 = [v3 objectForKeyedSubscript:v4];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 fastPass];

  if (v4)
  {
    v5 = +[_DASDaemonLogger logForCategory:@"pluggedinpolicy"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000F6870(v5);
    }

    LOBYTE(v5) = 0;
  }
  else
  {
    LODWORD(v5) = [v3 beforeDaysFirstActivity] ^ 1;
  }

  return (char)v5;
}

- (double)weightForActivity:(id)a3
{
  id v4 = a3;
  double v5 = 20.0;
  if (![(_DASRequiresPluggedInPolicy *)self requiresPluginForActivity:v4])
  {
    if (([v4 requestsApplicationLaunch] & 1) != 0
      || ([v4 relatedApplications],
          v6 = objc_claimAutoreleasedReturnValue(),
          id v7 = [v6 count],
          v6,
          v7))
    {
      double v5 = 2.0;
    }
    else
    {
      double v5 = 10.0;
    }
  }

  return v5;
}

- (double)scoreForActivity:(id)a3 isPluggedIn:(BOOL)a4
{
  double result = 1.0;
  if (!a4)
  {
    unsigned int v5 = -[_DASRequiresPluggedInPolicy requiresPluginForActivity:](self, "requiresPluginForActivity:", a3, 1.0);
    double result = 0.5;
    if (v5) {
      return 0.0;
    }
  }
  return result;
}

- (BOOL)requiresPluginForActivity:(id)a3
{
  id v3 = a3;
  if ([v3 requiresPlugin])
  {
    BOOL v4 = 1;
  }
  else if (+[_DASPhotosPolicy isiCPLActivity:v3] {
         && [v3 transferSizeType] == (id)30)
  }
  {
    id v5 = [v3 schedulingPriority];
    BOOL v4 = (unint64_t)v5 < _DASSchedulingPriorityUserInitiated;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (double)predictedScoreForActivity:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = 0.5;
  if ([v6 targetDevice] != (id)1 && objc_msgSend(v6, "targetDevice") != (id)2)
  {
    +[NSDate date];
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_100010514;
    v21 = &unk_100175570;
    v22 = self;
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = v23;
    +[_DASPredictionManager asyncDo:&v18];
    v10 = [(_DASRequiresPluggedInPolicy *)self pluginTimeline];
    v11 = [v10 valueAtDate:v7];
    v12 = v11;
    if (v11)
    {
      [v11 doubleValue];
      double v14 = v13;
      [(_DASRequiresPluggedInPolicy *)self scoreForActivity:v6 isPluggedIn:v13 > 0.0];
      double v8 = v14 * v15;
    }
    else
    {
      [(_DASRequiresPluggedInPolicy *)self scoreForActivity:v6 isPluggedIn:0];
      double v8 = v16;
    }
  }
  return v8;
}

- (_DKPredictionTimeline)pluginTimeline
{
  return (_DKPredictionTimeline *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)triggers
{
  return self->_triggers;
}

+ (BOOL)isIgnorableNotChargingReason:(unint64_t)a3
{
  return (a3 & 0xFF7FFFFFFE7F73FELL) == 0 && a3 != 0;
}

- (id)initializeTriggers
{
  id v3 = +[_CDContextQueries keyPathForPluginStatus];
  double v13 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v3];

  v12 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_batteryStatusKeyPath];
  v10 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_watchIsPluggedInKeyPath];
  v11 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_topOffCheckpointKeypath];
  v20[0] = @"identifier";
  v20[1] = @"predicate";
  v21[0] = @"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin";
  v21[1] = v13;
  v20[2] = @"deviceSet";
  v20[3] = @"mustWake";
  v21[2] = &off_100186E50;
  v21[3] = &__kCFBooleanTrue;
  BOOL v4 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];
  v22[0] = v4;
  v18[0] = @"identifier";
  v18[1] = @"predicate";
  v19[0] = @"com.apple.duetactivityscheduler.pluggedinpolicy.batteryStatus";
  v19[1] = v12;
  v18[2] = @"deviceSet";
  v18[3] = @"mustWake";
  v19[2] = &off_100186E50;
  v19[3] = &__kCFBooleanTrue;
  id v5 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
  v22[1] = v5;
  v16[0] = @"identifier";
  v16[1] = @"predicate";
  v17[0] = @"com.apple.duetactivityscheduler.pluggedinpolicy.watchispluggedin";
  v17[1] = v10;
  v16[2] = @"deviceSet";
  v16[3] = @"mustWake";
  v17[2] = &off_100186E50;
  v17[3] = &__kCFBooleanTrue;
  id v6 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];
  v22[2] = v6;
  v14[0] = @"identifier";
  v14[1] = @"predicate";
  v15[0] = @"com.apple.das.top.checkpointStatus";
  v15[1] = v11;
  v14[2] = @"deviceSet";
  v14[3] = @"mustWake";
  v15[2] = &off_100186E50;
  v15[3] = &__kCFBooleanTrue;
  id v7 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  v22[3] = v7;
  double v8 = +[NSArray arrayWithObjects:v22 count:4];

  return v8;
}

- (_DASRequiresPluggedInPolicy)init
{
  v30.receiver = self;
  v30.super_class = (Class)_DASRequiresPluggedInPolicy;
  v2 = [(_DASRequiresPluggedInPolicy *)&v30 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Charger Plugged In Policy";

    uint64_t v5 = +[_CDContextQueries keyPathForBatteryStateDataDictionary];
    batteryStatusKeyPath = v3->_batteryStatusKeyPath;
    v3->_batteryStatusKeyPath = (_CDContextualKeyPath *)v5;

    uint64_t v7 = +[_CDContextQueries keyPathForDefaultPairedDevicePluginStatus];
    watchIsPluggedInKeyPath = v3->_watchIsPluggedInKeyPath;
    v3->_watchIsPluggedInKeyPath = (_CDContextualKeyPath *)v7;

    uint64_t v9 = +[_DASPredictionManager sharedPredictor];
    predictor = v3->_predictor;
    v3->_predictor = (_DKPredictor *)v9;

    v11 = [(_DASRequiresPluggedInPolicy *)v3 predictionForDevicePluggedIn];
    objc_storeStrong((id *)&v3->_pluginTimeline, v11);
    +[_DASPredictionManager setPrediction:v11 forKey:@"plugin"];
    v12 = +[_DASPLLogger sharedInstance];
    [v12 recordPrediction:v11 key:@"powerPluggedInPrediction" valueMultiplier:100];

    v3->_isIpad = +[_DASConfig isiPad];
    id v13 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    byte_1001C3FC8 = [v13 BOOLForKey:@"imposePluginDelay"];

    id v14 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    v3->_ignoreIsCharging = [v14 BOOLForKey:@"ignoreIsCharging"];

    double v15 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler.plugin"];
    pluginStatusDefaults = v3->_pluginStatusDefaults;
    v3->_pluginStatusDefaults = v15;

    uint64_t v17 = +[_CDContextualKeyPath keyPathWithKey:@"/charging/topOffCheckpoint"];
    topOffCheckpointKeypath = v3->_topOffCheckpointKeypath;
    v3->_topOffCheckpointKeypath = (_CDContextualKeyPath *)v17;

    v3->_BOOL deficitProcessing = [(NSUserDefaults *)v3->_pluginStatusDefaults BOOLForKey:@"deficitProcessing"];
    uint64_t v19 = +[_DASDaemonLogger logForCategory:@"stats"];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      BOOL deficitProcessing = v3->_deficitProcessing;
      *(_DWORD *)buf = 67109120;
      BOOL v32 = deficitProcessing;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Deficit Processing=%u", buf, 8u);
    }

    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.dasd.pluginStatsRecording", v21);
    statsRecordingQueue = v3->_statsRecordingQueue;
    v3->_statsRecordingQueue = (OS_dispatch_queue *)v22;

    v24 = +[_DASDaemonLogger logForCategory:@"predictions"];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_1000F67F8((uint64_t)v11, v24);
    }

    uint64_t v25 = +[NSDate date];
    lastPredictionTimelineUpdate = v3->_lastPredictionTimelineUpdate;
    v3->_lastPredictionTimelineUpdate = (NSDate *)v25;

    uint64_t v27 = [(_DASRequiresPluggedInPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v27;
  }
  return v3;
}

- (id)predictionForDevicePluggedIn
{
  id v3 = (void *)os_transaction_create();
  uint64_t v5 = [(_DKPredictor *)self->_predictor pluginLikelihood];

  return v5;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

+ (id)policyInstance
{
  if (qword_1001C3FD0 != -1) {
    dispatch_once(&qword_1001C3FD0, &stru_100176730);
  }
  v2 = (void *)qword_1001C3FD8;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin"])
  {
    double v8 = +[_CDContextQueries keyPathForPluginStatus];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];
    id v10 = [v9 BOOLValue];

    self = +[_DASPLLogger sharedInstance];
    [(_DASRequiresPluggedInPolicy *)self reportNewStatus:v10 forTrigger:off_1001C3980];

    LOBYTE(self) = v10 ^ 1;
  }
  else if ([v6 isEqualToString:@"com.apple.duetactivityscheduler.pluggedinpolicy.batteryStatus"])
  {
    LOBYTE(self) = 1;
  }
  else if ([v6 isEqualToString:@"com.apple.duetactivityscheduler.pluggedinpolicy.watchispluggedin"])
  {
    v11 = [v7 objectForKeyedSubscript:self->_watchIsPluggedInKeyPath];
    LODWORD(self) = [v11 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (void)updateRationaleForTransferSize:(id)a3 withActivity:(id)a4
{
  id v5 = a3;
  if ([a4 transferSizeType] == (id)30) {
    [v5 setResponseOptions:[v5 responseOptions] | 1];
  }
}

- (void)computeAndRecordPolicyDurationStatsWhilePluggedIn:(BOOL)a3 considerPluggedIn:(BOOL)a4 atDate:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (void *)os_transaction_create();
  statsRecordingQueue = self->_statsRecordingQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000626C4;
  v13[3] = &unk_100176758;
  BOOL v17 = a3;
  BOOL v18 = a4;
  id v14 = v9;
  double v15 = self;
  id v16 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(statsRecordingQueue, v13);
}

- (unint64_t)notChargingReason
{
  v2 = +[_DASBatteryTemperatureReader batteryProperties];
  id v3 = [v2 objectForKeyedSubscript:@"ChargerData"];
  BOOL v4 = [v3 objectForKeyedSubscript:@"NotChargingReason"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 unsignedIntegerValue];
  }
  else
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"pluggedinpolicy"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000F68B4((uint64_t)v4, v6);
    }

    id v5 = 0;
  }

  return (unint64_t)v5;
}

- (double)scoreForActivity:(id)a3 withBatteryStatus:(id)a4 withTopOffStatus:(unint64_t)a5 timeSincePluginStateChange:(double)a6 atDate:(id)a7 rationale:(id)a8
{
  id v63 = a3;
  id v13 = a4;
  id v14 = a7;
  id v62 = a8;
  double v15 = +[_CDContextQueries batteryExternalConnectedKey];
  id v16 = [v13 objectForKeyedSubscript:v15];
  id v17 = [v16 BOOLValue];

  BOOL v18 = +[_CDContextQueries batteryIsChargingKey];
  uint64_t v19 = [v13 objectForKeyedSubscript:v18];
  unsigned int v59 = [v19 BOOLValue];

  v20 = +[_CDContextQueries batteryFullyChargedKey];
  v21 = [v13 objectForKeyedSubscript:v20];
  id v61 = v14;
  if ([v21 BOOLValue])
  {
    BOOL v22 = 1;
  }
  else
  {
    id v23 = +[_CDContextQueries batteryPercentageKey];
    v24 = [v13 objectForKeyedSubscript:v23];
    BOOL v22 = [v24 intValue] == 100;
  }
  uint64_t v25 = +[_CDContextQueries batteryVoltageKey];
  v26 = [v13 objectForKeyedSubscript:v25];
  uint64_t v27 = (uint64_t)[v26 integerValue];

  v28 = +[_CDContextQueries batteryTemperatureKey];
  v29 = [v13 objectForKeyedSubscript:v28];
  uint64_t v30 = (uint64_t)[v29 integerValue];

  v31 = +[_CDContextQueries batteryPercentageKey];
  BOOL v32 = [v13 objectForKeyedSubscript:v31];
  id v33 = [v32 integerValue];

  v34 = v63;
  if (([v63 hasMagneticSensitivity] & v17) == 1)
  {
    v35 = +[NSPredicate predicateWithFormat:@"hasMagneticSensitivity == YES AND isPluggedIn == YES"];
    v36 = v62;
    [v62 addRationaleWithCondition:v35];

    double v37 = 0.0;
    v38 = v61;
    goto LABEL_14;
  }
  if (a5 - 2 < 3)
  {
    CFStringRef v39 = @"topOffProtectionEngaged == %@";
    id v40 = v17;
LABEL_10:
    v36 = v62;
    v42 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v39, &__kCFBooleanTrue);
    [v62 addRationaleWithCondition:v42];

    goto LABEL_11;
  }
  BOOL ignoreIsCharging = self->_ignoreIsCharging;
  if ([(_DASRequiresPluggedInPolicy *)self deviceIsToppingOff:a5])
  {
    id v40 = 0;
    CFStringRef v39 = @"deviceTopOff == %@";
    goto LABEL_10;
  }
  uint64_t v58 = (uint64_t)v33;
  char v48 = v17 ^ 1;
  if (ignoreIsCharging) {
    char v48 = 1;
  }
  id v40 = v17;
  v36 = v62;
  if (v48)
  {
LABEL_11:
    v43 = +[_CDContextQueries batteryExternalConnectedKey];
    v44 = +[NSNumber numberWithBool:v40];
    v45 = +[NSPredicate predicateWithFormat:@"%@ == %@", v43, v44];
    [v36 addRationaleWithCondition:v45];

    v34 = v63;
    v46 = self;
    v38 = v61;
    [(_DASRequiresPluggedInPolicy *)self computeAndRecordPolicyDurationStatsWhilePluggedIn:v17 considerPluggedIn:v40 atDate:v61];
    double v37 = 1.0;
    if (v40) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if ((v22 | v59))
  {
    v46 = self;
    self->_lastNotChargingReason = 0;
    uint64_t v49 = 1;
    v36 = v62;
  }
  else
  {
    v46 = self;
    if (!self->_lastNotChargingReason) {
      self->_lastNotChargingReason = [(_DASRequiresPluggedInPolicy *)self notChargingReason];
    }
    v36 = v62;
    if ([(id)objc_opt_class() isIgnorableNotChargingReason:self->_lastNotChargingReason])
    {
      uint64_t v49 = 1;
    }
    else
    {
      v50 = +[NSNumber numberWithUnsignedInteger:self->_lastNotChargingReason];
      v51 = +[NSPredicate predicateWithFormat:@"isCharging == NO AND notChargingReason == %@", v50];
      [v62 addRationaleWithCondition:v51];

      v34 = v63;
      uint64_t v49 = 0;
    }
  }
  if (v46->_isIpad && v27 >= 4200 && v30 >= 3500 && !v46->_deficitProcessing)
  {
    v52 = [v34 userInfo];
    v53 = [v52 objectForKeyedSubscript:_DASCTSBypassBatteryAgingProtectionKey];
    if (([v53 BOOLValue] & 1) == 0)
    {
      unsigned __int8 v54 = [v34 backlogged];

      v46 = self;
      if (v54) {
        goto LABEL_33;
      }
      v52 = +[NSNumber numberWithInteger:v27];
      v53 = +[NSNumber numberWithInteger:v30];
      v55 = +[NSPredicate predicateWithFormat:@"voltage == %@ AND temperature == %@", v52, v53];
      [v36 addRationaleWithCondition:v55];

      uint64_t v49 = 0;
    }

    v46 = self;
  }
LABEL_33:
  if ((byte_1001C3FC8
     || ([v34 backlogged] & 1) == 0
     && +[_DASRequiresPluggedInPolicy isWirelessCharger:v13]&& v58 <= 79)&& a6 > 0.0&& a6 < 900.0)
  {
    v56 = +[NSNumber numberWithDouble:a6 / 60.0];
    v57 = +[NSPredicate predicateWithFormat:@"timeSincePlugin == %@", v56];
    [v36 addRationaleWithCondition:v57];

    v34 = v63;
    v38 = v61;
    [(_DASRequiresPluggedInPolicy *)v46 computeAndRecordPolicyDurationStatsWhilePluggedIn:1 considerPluggedIn:0 atDate:v61];
  }
  else
  {
    v38 = v61;
    [(_DASRequiresPluggedInPolicy *)v46 computeAndRecordPolicyDurationStatsWhilePluggedIn:1 considerPluggedIn:v49 atDate:v61];
    double v37 = 1.0;
    if (v49) {
      goto LABEL_14;
    }
  }
LABEL_12:
  double v37 = 0.5;
  if ([(_DASRequiresPluggedInPolicy *)v46 requiresPluginForActivity:v34])
  {
    [(_DASRequiresPluggedInPolicy *)v46 updateRationaleForTransferSize:v36 withActivity:v34];
    double v37 = 0.0;
  }
LABEL_14:

  return v37;
}

- (BOOL)deviceIsToppingOff:(unint64_t)a3
{
  return a3 == 5;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:self->_policyName];
  if ([v6 targetDevice])
  {
    uint64_t v9 = self->_watchIsPluggedInKeyPath;
    id v10 = [v7 objectForKeyedSubscript:v9];
    id v11 = [v10 BOOLValue];

    [(_DASRequiresPluggedInPolicy *)self scoreForActivity:v6 isPluggedIn:v11];
    double v13 = v12;
    if (v12 == 0.0)
    {
      [(_DASRequiresPluggedInPolicy *)self updateRationaleForTransferSize:v8 withActivity:v6];
      id v14 = +[NSNumber numberWithBool:v11];
      double v15 = +[NSPredicate predicateWithFormat:@"%@ == %@", v9, v14];

      [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v15];
    }
    id v16 = +[_DASPolicyResponse policyResponseWithScore:v8 validityDuration:v13 rationale:(double)0x384uLL];
  }
  else
  {
    uint64_t v9 = +[NSDate date];
    id v17 = +[_CDContextQueries keyPathForPluginStatus];
    BOOL v18 = [v7 lastModifiedDateForContextualKeyPath:v17];

    if (v18)
    {
      [(_CDContextualKeyPath *)v9 timeIntervalSinceDate:v18];
      double v20 = v19;
    }
    else
    {
      double v20 = 901.0;
    }
    v21 = [v7 objectForKeyedSubscript:self->_topOffCheckpointKeypath];
    id v22 = [v21 unsignedIntegerValue];

    id v23 = [v6 schedulingPriority];
    if ((unint64_t)v23 < _DASSchedulingPriorityUtility
      && [(_DASRequiresPluggedInPolicy *)self deviceIsToppingOff:v22])
    {
      v24 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"priority == %llu && topOffStatus == %llu", [v6 schedulingPriority], v22);
      [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v24];
      id v16 = +[_DASPolicyResponse policyResponseWithDecision:33 validityDuration:v8 rationale:(double)0x384uLL];
    }
    else
    {
      uint64_t v25 = [v7 objectForKeyedSubscript:self->_batteryStatusKeyPath];
      [(_DASRequiresPluggedInPolicy *)self scoreForActivity:v6 withBatteryStatus:v25 withTopOffStatus:v22 timeSincePluginStateChange:v9 atDate:v8 rationale:v20];
      double v27 = v26;

      id v16 = +[_DASPolicyResponse policyResponseWithScore:v8 validityDuration:v27 rationale:(double)0x384uLL];
    }
  }

  return v16;
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

- (_CDContextualKeyPath)batteryStatusKeyPath
{
  return self->_batteryStatusKeyPath;
}

- (void)setBatteryStatusKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)watchIsPluggedInKeyPath
{
  return self->_watchIsPluggedInKeyPath;
}

- (void)setWatchIsPluggedInKeyPath:(id)a3
{
}

- (void)setTriggers:(id)a3
{
}

- (_DKPredictor)predictor
{
  return self->_predictor;
}

- (void)setPredictor:(id)a3
{
}

- (void)setPluginTimeline:(id)a3
{
}

- (NSDate)lastPredictionTimelineUpdate
{
  return self->_lastPredictionTimelineUpdate;
}

- (void)setLastPredictionTimelineUpdate:(id)a3
{
}

- (BOOL)isIpad
{
  return self->_isIpad;
}

- (void)setIsIpad:(BOOL)a3
{
  self->_isIpad = a3;
}

- (BOOL)deficitProcessing
{
  return self->_deficitProcessing;
}

- (void)setDeficitProcessing:(BOOL)a3
{
  self->_BOOL deficitProcessing = a3;
}

- (OS_dispatch_queue)statsRecordingQueue
{
  return self->_statsRecordingQueue;
}

- (void)setStatsRecordingQueue:(id)a3
{
}

- (NSUserDefaults)pluginStatusDefaults
{
  return self->_pluginStatusDefaults;
}

- (void)setPluginStatusDefaults:(id)a3
{
}

- (_CDContextualKeyPath)topOffCheckpointKeypath
{
  return self->_topOffCheckpointKeypath;
}

- (void)setTopOffCheckpointKeypath:(id)a3
{
}

- (BOOL)ignoreIsCharging
{
  return self->_ignoreIsCharging;
}

- (void)setIgnoreIsCharging:(BOOL)a3
{
  self->_BOOL ignoreIsCharging = a3;
}

- (unint64_t)lastNotChargingReason
{
  return self->_lastNotChargingReason;
}

- (void)setLastNotChargingReason:(unint64_t)a3
{
  self->_lastNotChargingReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topOffCheckpointKeypath, 0);
  objc_storeStrong((id *)&self->_pluginStatusDefaults, 0);
  objc_storeStrong((id *)&self->_statsRecordingQueue, 0);
  objc_storeStrong((id *)&self->_lastPredictionTimelineUpdate, 0);
  objc_storeStrong((id *)&self->_pluginTimeline, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_watchIsPluggedInKeyPath, 0);
  objc_storeStrong((id *)&self->_batteryStatusKeyPath, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end