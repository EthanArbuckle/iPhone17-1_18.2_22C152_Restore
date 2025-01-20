@interface _DASDeviceActivityPolicy
+ (BOOL)isDeviceInUse:(id)a3;
+ (id)policyInstance;
+ (void)printLowLikelihoodRegions;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)backgroundTaskAllowedWithType:(id)a3 withRequiredFileProtection:(id)a4 withRationale:(id)a5 withState:(id)a6;
- (BOOL)considerAlwaysActive;
- (BOOL)requiresDeviceInactivityForActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (NSArray)triggers;
- (NSDate)lastPredictionTimelineUpdate;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_queue)queue;
- (_CDContextualKeyPath)inUseStatus;
- (_DASDeviceActivityPolicy)init;
- (_DKPredictionTimeline)deviceActivityTimeline;
- (_DKPredictor)predictor;
- (double)scoreForActivity:(id)a3 atDate:(id)a4;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)predictionForDeviceActivity;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)initializeTimelines;
- (void)setConsiderAlwaysActive:(BOOL)a3;
- (void)setDeviceActivityTimeline:(id)a3;
- (void)setInUseStatus:(id)a3;
- (void)setLastPredictionTimelineUpdate:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setPredictor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTriggers:(id)a3;
- (void)updateRationaleForTransferSize:(id)a3 withActivity:(id)a4;
@end

@implementation _DASDeviceActivityPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 fileProtection];
  v5 = +[_DASFileProtection complete];
  if ([v4 isEqual:v5])
  {
    BOOL v6 = 0;
  }
  else
  {
    v7 = [v3 fastPass];
    BOOL v6 = v7 == 0;
  }
  return v6;
}

- (double)weightForActivity:(id)a3
{
  id v4 = a3;
  double v5 = 20.0;
  if (![(_DASDeviceActivityPolicy *)self requiresDeviceInactivityForActivity:v4])
  {
    if ([v4 requestsApplicationLaunch]) {
      double v5 = 5.0;
    }
    else {
      double v5 = 10.0;
    }
  }

  return v5;
}

- (BOOL)requiresDeviceInactivityForActivity:(id)a3
{
  id v3 = a3;
  if ([v3 requiresDeviceInactivity])
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

- (double)scoreForActivity:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[NSDate date];
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  v23 = sub_100010D84;
  v24 = &unk_100175570;
  v25 = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = v8;
  +[_DASPredictionManager asyncDo:&v21];
  v9 = [(_DASDeviceActivityPolicy *)self deviceActivityTimeline];
  id v10 = [v6 duration];
  if ((unint64_t)v10 <= _DASActivityDurationModerate)
  {
    v18 = [v9 valueAtDate:v7];
    [v18 doubleValue];
    double v13 = 1.0 - v19;

    v17 = v7;
  }
  else
  {
    double v11 = (double)(unint64_t)v10;
    double v12 = 0.0;
    double v13 = 1.0;
    do
    {
      v14 = [v9 valueAtDate:v7];
      [v14 doubleValue];
      double v16 = v15;

      double v13 = v13 * (1.0 - v16);
      v17 = [v7 dateByAddingTimeInterval:900.0];

      double v12 = v12 + 900.0;
      id v7 = v17;
    }
    while (v12 < v11);
  }

  return v13;
}

- (_DKPredictionTimeline)deviceActivityTimeline
{
  return (_DKPredictionTimeline *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)triggers
{
  return self->_triggers;
}

+ (void)printLowLikelihoodRegions
{
  v2 = +[_DASPredictionManager lowLikelihoodPeriodStartForPredictionWithKey:@"deviceActivity"];
  id v3 = +[_DASPredictionManager lowLikelihoodPeriodEndForPredictionWithKey:@"deviceActivity"];
  BOOL v4 = +[NSLocale currentLocale];
  id v5 = +[_DASDaemonLogger logForCategory:@"predictions"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v2 descriptionWithLocale:v4];
    id v7 = [v3 descriptionWithLocale:v4];
    int v8 = 138412546;
    v9 = v6;
    __int16 v10 = 2112;
    double v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Low Likelihood is from %@ to %@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)initializeTriggers
{
  v2 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_inUseStatus];
  v6[0] = @"identifier";
  v6[1] = @"predicate";
  v7[0] = @"com.apple.duetactivityscheduler.deviceactivitypolicy.inusestatus";
  v7[1] = v2;
  v6[2] = @"deviceSet";
  v6[3] = @"mustWake";
  v7[2] = &off_100186D60;
  v7[3] = &__kCFBooleanTrue;
  id v3 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  int v8 = v3;
  BOOL v4 = +[NSArray arrayWithObjects:&v8 count:1];

  return v4;
}

- (_DASDeviceActivityPolicy)init
{
  v16.receiver = self;
  v16.super_class = (Class)_DASDeviceActivityPolicy;
  v2 = [(_DASDeviceActivityPolicy *)&v16 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Device Activity Policy";

    uint64_t v5 = +[_DASPredictionManager sharedPredictor];
    predictor = v3->_predictor;
    v3->_predictor = (_DKPredictor *)v5;

    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.duet.activityscheduler.deviceactivitypolicy.queue", v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

    [(id)objc_opt_class() printLowLikelihoodRegions];
    uint64_t v10 = +[_CDContextQueries keyPathForInUseStatus];
    inUseStatus = v3->_inUseStatus;
    v3->_inUseStatus = (_CDContextualKeyPath *)v10;

    uint64_t v12 = [(_DASDeviceActivityPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v12;

    id v14 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    v3->_considerAlwaysActive = [v14 BOOLForKey:@"deviceInUse"];

    [(_DASDeviceActivityPolicy *)v3 initializeTimelines];
  }
  return v3;
}

- (void)initializeTimelines
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004FB64;
  block[3] = &unk_1001754F8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)predictionForDeviceActivity
{
  id v3 = (void *)os_transaction_create();
  uint64_t v5 = [(_DKPredictor *)self->_predictor deviceActivityLikelihood];

  return v5;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004FD68;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3DC0 != -1) {
    dispatch_once(&qword_1001C3DC0, block);
  }
  v2 = (void *)qword_1001C3DC8;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"com.apple.duetactivityscheduler.deviceactivitypolicy.inusestatus"])
  {
    id v6 = +[_CDContextQueries keyPathForInUseStatus];
    id v7 = [v5 objectForKeyedSubscript:v6];
    unsigned __int8 v8 = [v7 BOOLValue];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

+ (BOOL)isDeviceInUse:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[_CDContextQueries keyPathForInUseStatus];
  id v5 = [v3 objectForKeyedSubscript:v4];

  LOBYTE(v4) = ((unint64_t)[v5 unsignedLongLongValue] & 5) != 0;
  return (char)v4;
}

- (BOOL)backgroundTaskAllowedWithType:(id)a3 withRequiredFileProtection:(id)a4 withRationale:(id)a5 withState:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (([v9 isEqualToString:_DASLaunchReasonBackgroundProcessing] & 1) == 0)
  {
    if (![v9 isEqualToString:_DASLaunchReasonHealthResearch]) {
      goto LABEL_9;
    }
    double v13 = +[_DASFileProtection complete];
    if ([v10 isEqual:v13])
    {
      BOOL v15 = 1;
      goto LABEL_7;
    }
    objc_super v16 = +[_DASFileProtection completeUnlessOpen];
    unsigned __int8 v17 = [v10 isEqual:v16];

    if (v17) {
      goto LABEL_9;
    }
  }
  if (![(id)objc_opt_class() isDeviceInUse:v12])
  {
LABEL_9:
    BOOL v15 = 1;
    goto LABEL_10;
  }
  double v13 = +[NSNumber numberWithBool:1];
  id v14 = +[NSPredicate predicateWithFormat:@"launchType == PROCESSING AND deviceActive == %@", v13];
  [v11 addRationaleWithCondition:v14];

  BOOL v15 = 0;
LABEL_7:

LABEL_10:
  return v15;
}

- (void)updateRationaleForTransferSize:(id)a3 withActivity:(id)a4
{
  id v5 = a3;
  if ([a4 transferSizeType] == (id)30) {
    [v5 setResponseOptions:[v5 responseOptions] | 1];
  }
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Device Activity Policy"];
  if (self->_considerAlwaysActive
    && [(_DASDeviceActivityPolicy *)self requiresDeviceInactivityForActivity:v6])
  {
    id v9 = +[NSPredicate predicateWithFormat:@"considerAlwaysActive == YES && requiresDeviceInactivity == YES"];
    [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v9];

    [(_DASDeviceActivityPolicy *)self updateRationaleForTransferSize:v8 withActivity:v6];
    id v10 = +[_DASPolicyResponse policyResponseWithDecision:33 validityDuration:v8 rationale:(double)0x384uLL];
    goto LABEL_21;
  }
  id v11 = +[_CDContextQueries keyPathForInUseStatus];
  id v12 = [v7 objectForKeyedSubscript:v11];

  if ([(_DASDeviceActivityPolicy *)self requiresDeviceInactivityForActivity:v6]&& +[_DASDeviceActivityPolicy isDeviceInUse:v7])
  {
    double v13 = +[NSPredicate predicateWithFormat:@"deviceActivity == %@", v12];
    [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v13];

    [(_DASDeviceActivityPolicy *)self updateRationaleForTransferSize:v8 withActivity:v6];
LABEL_7:
    double v14 = (double)0x384uLL;
LABEL_19:
    uint64_t v19 = +[_DASPolicyResponse policyResponseWithDecision:33 validityDuration:v8 rationale:v14];
    goto LABEL_20;
  }
  if ([v6 requestsApplicationLaunch]
    && ([v6 isContactTracingBackgroundActivity] & 1) == 0)
  {
    v20 = [v6 launchReason];
    v21 = [v6 fileProtection];
    unsigned __int8 v22 = [(_DASDeviceActivityPolicy *)self backgroundTaskAllowedWithType:v20 withRequiredFileProtection:v21 withRationale:v8 withState:v7];

    if ((v22 & 1) == 0)
    {
      double v14 = 10800.0;
      goto LABEL_19;
    }
    if (([v12 unsignedIntValue] & 4) != 0)
    {
      v25 = +[NSPredicate predicateWithFormat:@"deviceActivity == %@", v12];
      [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v25];

      goto LABEL_7;
    }
    objc_super v16 = +[NSDate date];
    [(_DASDeviceActivityPolicy *)self scoreForActivity:v6 atDate:v16];
    double v18 = 1.0 - v23;
  }
  else
  {
    if ([v12 BOOLValue]) {
      double v15 = 0.1;
    }
    else {
      double v15 = 0.5;
    }
    objc_super v16 = +[NSDate date];
    [(_DASDeviceActivityPolicy *)self scoreForActivity:v6 atDate:v16];
    double v18 = v15 + v17 * 0.5;
  }

  uint64_t v19 = +[_DASPolicyResponse policyResponseWithScore:0 validityDuration:fmax(v18, 0.05) rationale:(double)0x384uLL];
LABEL_20:
  id v10 = (void *)v19;

LABEL_21:

  return v10;
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

- (void)setDeviceActivityTimeline:(id)a3
{
}

- (NSDate)lastPredictionTimelineUpdate
{
  return self->_lastPredictionTimelineUpdate;
}

- (void)setLastPredictionTimelineUpdate:(id)a3
{
}

- (_CDContextualKeyPath)inUseStatus
{
  return self->_inUseStatus;
}

- (void)setInUseStatus:(id)a3
{
}

- (BOOL)considerAlwaysActive
{
  return self->_considerAlwaysActive;
}

- (void)setConsiderAlwaysActive:(BOOL)a3
{
  self->_considerAlwaysActive = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_inUseStatus, 0);
  objc_storeStrong((id *)&self->_lastPredictionTimelineUpdate, 0);
  objc_storeStrong((id *)&self->_deviceActivityTimeline, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end