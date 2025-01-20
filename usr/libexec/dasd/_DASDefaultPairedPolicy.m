@interface _DASDefaultPairedPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSDate)lastPredictionTimelineUpdate;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASDefaultPairedPolicy)init;
- (_DKPredictionTimeline)deviceNearbyTimeline;
- (_DKPredictor)predictor;
- (double)scoreForActivity:(id)a3 atDate:(id)a4;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)predictionForDeviceNearby;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setDeviceNearbyTimeline:(id)a3;
- (void)setLastPredictionTimelineUpdate:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setPredictor:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASDefaultPairedPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  if ([v3 targetDevice] == (id)1)
  {
    v4 = [v3 startDate];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)initializeTriggers
{
  v2 = +[_CDContextQueries keyPathForDefaultPairedDeviceNearbyStatus];
  id v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v2];

  v7[0] = @"identifier";
  v7[1] = @"predicate";
  v8[0] = @"com.apple.duetactivityscheduler.defaultpairedpolicy.nearbystatus";
  v8[1] = v3;
  v7[2] = @"deviceSet";
  v7[3] = @"mustWake";
  v8[2] = &off_100186D48;
  v8[3] = &__kCFBooleanTrue;
  v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  v9 = v4;
  BOOL v5 = +[NSArray arrayWithObjects:&v9 count:1];

  return v5;
}

- (_DASDefaultPairedPolicy)init
{
  v14.receiver = self;
  v14.super_class = (Class)_DASDefaultPairedPolicy;
  v2 = [(_DASDefaultPairedPolicy *)&v14 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Default Paired Nearby Policy";

    uint64_t v5 = +[_DASPredictionManager sharedPredictor];
    predictor = v3->_predictor;
    v3->_predictor = (_DKPredictor *)v5;

    uint64_t v7 = [(_DASDefaultPairedPolicy *)v3 predictionForDeviceNearby];
    deviceNearbyTimeline = v3->_deviceNearbyTimeline;
    v3->_deviceNearbyTimeline = (_DKPredictionTimeline *)v7;

    uint64_t v9 = +[NSDate date];
    lastPredictionTimelineUpdate = v3->_lastPredictionTimelineUpdate;
    v3->_lastPredictionTimelineUpdate = (NSDate *)v9;

    uint64_t v11 = [(_DASDefaultPairedPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v11;
  }
  return v3;
}

- (id)predictionForDeviceNearby
{
  id v3 = (void *)os_transaction_create();
  uint64_t v5 = +[NSDate distantPast];
  v6 = +[NSDate date];
  uint64_t v7 = +[_DKQuery predicateForEventsWithStartInDateRangeFrom:v5 to:v6];

  v8 = +[_DKQuery predicateForEventsWithIntegerValue:1];
  v13[0] = v7;
  v13[1] = v8;
  uint64_t v9 = +[NSArray arrayWithObjects:v13 count:2];
  v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];

  uint64_t v11 = [(_DKPredictor *)self->_predictor predictionForStreamWithName:@"/defaultPaired/nearby" withPredicate:v10 withPredictionType:1];

  return v11;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"com.apple.duetactivityscheduler.defaultpairedpolicy.nearbystatus"])
  {
    v6 = +[_CDContextQueries keyPathForDefaultPairedDeviceNearbyStatus];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];
    unsigned int v8 = [v7 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F1C8;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3DB0 != -1) {
    dispatch_once(&qword_1001C3DB0, block);
  }
  v2 = (void *)qword_1001C3DB8;

  return v2;
}

- (double)scoreForActivity:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[NSDate date];
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  v23 = sub_10004F3AC;
  v24 = &unk_100175570;
  v25 = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = v8;
  +[_DASPredictionManager asyncDo:&v21];
  uint64_t v9 = [(_DASDefaultPairedPolicy *)self deviceNearbyTimeline];
  id v10 = [v6 duration];
  if ((unint64_t)v10 <= _DASActivityDurationModerate)
  {
    v18 = [v9 valueAtDate:v7];
    [v18 doubleValue];
    double v13 = v19;

    v17 = v7;
  }
  else
  {
    double v11 = (double)(unint64_t)v10;
    double v12 = 0.0;
    double v13 = 1.0;
    do
    {
      objc_super v14 = [v9 valueAtDate:v7];
      [v14 doubleValue];
      double v16 = v15;

      double v13 = v13 * v16;
      v17 = [v7 dateByAddingTimeInterval:900.0];

      double v12 = v12 + 900.0;
      id v7 = v17;
    }
    while (v12 < v11);
  }

  return v13;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_CDContextQueries keyPathForDefaultPairedDeviceNearbyStatus];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  LOBYTE(v7) = [v9 BOOLValue];
  if (v7)
  {
    id v10 = +[NSDate date];
    [(_DASDefaultPairedPolicy *)self scoreForActivity:v6 atDate:v10];
    double v12 = v11;

    double v13 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Default Paired Nearby Policy"];
    objc_super v14 = +[NSNumber numberWithDouble:v12];
    double v15 = +[NSPredicate predicateWithFormat:@"defaultPaired.likelihood == %@", v14];
    [(_DASPolicyResponseRationale *)v13 addRationaleWithCondition:v15];

    +[_DASPolicyResponse policyResponseWithScore:0 validityDuration:fmax(v12, 0.01) rationale:(double)0x384uLL];
  }
  else
  {
    double v13 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Default Paired Nearby Policy"];
    double v16 = +[NSNumber numberWithBool:0];
    v17 = +[NSPredicate predicateWithFormat:@"defaultPairedIsNearby == %@", v16];
    [(_DASPolicyResponseRationale *)v13 addRationaleWithCondition:v17];

    +[_DASPolicyResponse policyResponseWithDecision:33 validityDuration:v13 rationale:(double)0x384uLL];
  v18 = };

  return v18;
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

- (NSArray)triggers
{
  return self->_triggers;
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

- (_DKPredictionTimeline)deviceNearbyTimeline
{
  return (_DKPredictionTimeline *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceNearbyTimeline:(id)a3
{
}

- (NSDate)lastPredictionTimelineUpdate
{
  return self->_lastPredictionTimelineUpdate;
}

- (void)setLastPredictionTimelineUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPredictionTimelineUpdate, 0);
  objc_storeStrong((id *)&self->_deviceNearbyTimeline, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end