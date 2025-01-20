@interface _DASDataBudgetPolicy
+ (BOOL)budget:(id)a3 isPositive:(id)a4;
+ (BOOL)budgetIsPositive:(id)a3;
+ (BOOL)isBudgetAvailable:(id)a3;
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)budgetAvailableForActivity:(id)a3 withContext:(id)a4 rationale:(id)a5;
- (BOOL)shouldIgnoreBudgetForActivity:(id)a3 withState:(id)a4 rationale:(id)a5;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASComplicationManager)complicationManager;
- (_DASDataBudgetPolicy)init;
- (double)projectedUsageForActivity:(id)a3 withContext:(id)a4;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setComplicationManager:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)updateSystemConstraintsWithContext:(id)a3;
@end

@implementation _DASDataBudgetPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 widgetID];
  if (!v4 || (id v5 = [v3 schedulingPriority], (unint64_t)v5 >= _DASSchedulingPriorityUserInitiated))
  {
    if (![v3 requiresNetwork])
    {
      unsigned __int8 v6 = 0;
      goto LABEL_8;
    }
    if (([v3 budgeted] & 1) == 0)
    {
      unsigned __int8 v6 = [v3 dataBudgeted];
      goto LABEL_8;
    }
  }
  unsigned __int8 v6 = 1;
LABEL_8:

  return v6;
}

- (id)initializeTriggers
{
  v2 = +[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus];
  id v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v2];

  v4 = +[_DASBudgetManager sharedInstance];
  id v5 = [v4 budgetKeyPathForBudgetName:@"com.apple.dasd.baCellular"];
  unsigned __int8 v6 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v5];

  v13[0] = @"identifier";
  v13[1] = @"predicate";
  v14[0] = @"com.apple.duetactivityscheduler.databudgetpolicy.status";
  v14[1] = v3;
  v13[2] = @"deviceSet";
  v13[3] = @"mustWake";
  v14[2] = &off_100186D30;
  v14[3] = &__kCFBooleanTrue;
  v7 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  v15[0] = v7;
  v11[0] = @"identifier";
  v11[1] = @"predicate";
  v12[0] = @"com.apple.das.databaudget.ba.status";
  v12[1] = v6;
  v11[2] = @"deviceSet";
  v11[3] = @"mustWake";
  v12[2] = &off_100186D30;
  v12[3] = &__kCFBooleanTrue;
  v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  v15[1] = v8;
  v9 = +[NSArray arrayWithObjects:v15 count:2];

  return v9;
}

- (_DASDataBudgetPolicy)init
{
  v10.receiver = self;
  v10.super_class = (Class)_DASDataBudgetPolicy;
  v2 = [(_DASDataBudgetPolicy *)&v10 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Data Budget Policy";

    uint64_t v5 = [(_DASDataBudgetPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;

    uint64_t v7 = +[_DASComplicationManager sharedInstance];
    complicationManager = v3->_complicationManager;
    v3->_complicationManager = (_DASComplicationManager *)v7;
  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001C3D98 != -1) {
    dispatch_once(&qword_1001C3D98, &stru_100176248);
  }
  v2 = (void *)qword_1001C3DA0;

  return v2;
}

+ (BOOL)isBudgetAvailable:(id)a3
{
  id v3 = a3;
  if ((uint64_t)+[_CDNetworkContext wifiQuality:v3] <= 0)
  {
    uint64_t v5 = +[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus];
    BOOL v4 = +[_DASDataBudgetPolicy budget:v5 isPositive:v3];
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)budgetIsPositive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus];
  LOBYTE(a1) = [a1 budget:v5 isPositive:v4];

  return (char)a1;
}

+ (BOOL)budget:(id)a3 isPositive:(id)a4
{
  id v4 = [a4 objectForKeyedSubscript:a3];
  uint64_t v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (void)updateSystemConstraintsWithContext:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [(id)objc_opt_class() isBudgetAvailable:v3];

  uint64_t v5 = +[_DASDaemon sharedInstance];
  id v6 = v5;
  if (v4) {
    [v5 removeConstraint:8 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
  }
  else {
    [v5 addConstraint:8 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
  }
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a4;
  if ([a3 isEqualToString:@"com.apple.duetactivityscheduler.databudgetpolicy.status"])
  {
    [(_DASDataBudgetPolicy *)self updateSystemConstraintsWithContext:v6];
    BOOL v7 = +[_DASDataBudgetPolicy budgetIsPositive:v6];
    v8 = +[_DASPLLogger sharedInstance];
    [v8 reportNewStatus:v7 forTrigger:off_1001C3978];

    BOOL v9 = !v7;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (BOOL)shouldIgnoreBudgetForActivity:(id)a3 withState:(id)a4 rationale:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (+[_DASPhotosPolicy isiCPLActivity:v7])
  {
    objc_super v10 = +[_DASPhotosPolicy keyPathForPhotosBudgetOverride];
    v11 = [v8 objectForKeyedSubscript:v10];
    unsigned __int8 v12 = [v11 unsignedIntegerValue];

    if (v12)
    {
      CFStringRef v13 = @"shouldOverrideBudget == YES";
LABEL_7:
      v14 = +[NSPredicate predicateWithFormat:v13];
      [v9 addRationaleWithCondition:v14];

      goto LABEL_8;
    }
  }
  if ((uint64_t)+[_CDNetworkContext cellQuality:v8] >= 1)
  {
    if (![v7 deferred])
    {
      BOOL v15 = 0;
      goto LABEL_10;
    }
    CFStringRef v13 = @"deferred == YES";
    goto LABEL_7;
  }
LABEL_8:
  BOOL v15 = 1;
LABEL_10:

  return v15;
}

- (double)projectedUsageForActivity:(id)a3 withContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned __int8 v7 = +[_DASNetworkEvaluationMonitor inexpensivePathAvailable];
  uint64_t v8 = (uint64_t)+[_CDNetworkContext cellQuality:v5];

  id v9 = (double *)&unk_100126818;
  if ((v7 & (v8 > 20)) == 0) {
    id v9 = (double *)&unk_100126820;
  }
  double v10 = *v9;
  id v11 = [v6 transferSize];

  return v10 * (double)(unint64_t)((void)v11 << 10);
}

- (BOOL)budgetAvailableForActivity:(id)a3 withContext:(id)a4 rationale:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(_DASDataBudgetPolicy *)self projectedUsageForActivity:v8 withContext:a4];
  double v11 = v10;
  unsigned __int8 v12 = +[_DASBudgetManager sharedInstance];
  [v12 balanceForBudgetWithName:@"com.apple.dasd.systemCellular"];
  double v14 = v13;
  [v12 capacityForBudgetWithName:@"com.apple.dasd.systemCellular"];
  double v16 = v15;
  v17 = [v8 startDate];

  if (v17)
  {
    v18 = +[NSNumber numberWithDouble:v14];
    v19 = +[NSPredicate predicateWithFormat:@"remainingBudget == %@", v18];
    [v9 addRationaleWithCondition:v19];

    BOOL v20 = v14 > 0.0;
  }
  else
  {
    v21 = [v8 userInfo];
    v22 = [v21 objectForKeyedSubscript:_DASCTSMinDataBudgetPercentRemainingKey];

    [v22 doubleValue];
    if (v22)
    {
      double v24 = v23;
    }
    else
    {
      double v24 = 0.5;
      if (v11 <= v16 * 0.5) {
        double v24 = v11 / v16;
      }
    }
    BOOL v20 = v14 >= v16 * v24;
    if (v14 < v16 * v24)
    {
      v25 = +[NSNumber numberWithDouble:v14];
      v26 = +[NSNumber numberWithDouble:v11];
      v27 = +[NSNumber numberWithDouble:v24];
      v28 = +[NSPredicate predicateWithFormat:@"remainingBudget == %@ AND projectedUsage == %@ and percentage == %@", v25, v26, v27];
      [v9 addRationaleWithCondition:v28];
    }
  }

  return v20;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  v29 = sub_10004EC74;
  v30 = &unk_100175570;
  v31 = self;
  id v7 = a4;
  id v32 = v7;
  if (qword_1001C3DA8 != -1) {
    dispatch_once(&qword_1001C3DA8, &v27);
  }
  id v8 = [v6 clientDataBudgetName:v27, v28, v29, v30, v31];

  if (!v8) {
    goto LABEL_5;
  }
  id v9 = +[_DASBudgetManager sharedInstance];
  double v10 = [v6 clientDataBudgetName];
  double v11 = [v9 budgetKeyPathForBudgetName:v10];

  if (!v11)
  {
LABEL_5:
    double v11 = +[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus];
  }
  unsigned __int8 v12 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:self->_policyName];
  if ([(_DASDataBudgetPolicy *)self shouldIgnoreBudgetForActivity:v6 withState:v7 rationale:v12])
  {
    goto LABEL_10;
  }
  if (+[_DASDataBudgetPolicy budget:v11 isPositive:v7])
  {
    double v13 = +[_DASNetworkQualityPolicy policyInstance];
    if ([v13 privateNetworkCellConnection])
    {

LABEL_10:
      uint64_t v14 = 0;
      goto LABEL_15;
    }
    unsigned int v16 = [(_DASDataBudgetPolicy *)self budgetAvailableForActivity:v6 withContext:v7 rationale:v12];

    if (v16) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = 33;
    }
  }
  else
  {
    double v15 = [v11 key];
    [(_DASPolicyResponseRationale *)v12 addRationaleForCondition:v15 withRequiredValue:1.0 withCurrentValue:0.0];

    uint64_t v14 = 33;
  }
LABEL_15:
  uint64_t v17 = (uint64_t)+[_CDNetworkContext wifiQuality:v7];
  if (v17 >= 1)
  {
    [(_DASPolicyResponseRationale *)v12 addRationaleForCondition:@"wifiQuality" withRequiredValue:20.0 withCurrentValue:(double)v17];
    uint64_t v14 = 0;
  }
  uint64_t v18 = (uint64_t)+[_CDNetworkContext wiredQuality:v7];
  if (v18 < 1)
  {
    if (v14)
    {
      v19 = +[NSDate date];
      complicationManager = self->_complicationManager;
      v21 = [v6 relatedApplications];
      if ([(_DASComplicationManager *)complicationManager isAnyActiveComplication:v21])
      {
        v22 = [v6 startAfter];
        [v19 timeIntervalSinceDate:v22];
        double v24 = v23;

        if (v24 > 1800.0) {
          uint64_t v14 = 0;
        }
      }
      else
      {
      }
    }
  }
  else
  {
    [(_DASPolicyResponseRationale *)v12 addRationaleForCondition:@"wiredQuality" withRequiredValue:20.0 withCurrentValue:(double)v18];
    uint64_t v14 = 0;
  }
  v25 = +[_DASPolicyResponse policyResponseWithDecision:v14 validityDuration:v12 rationale:(double)0x384uLL];

  return v25;
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

- (_DASComplicationManager)complicationManager
{
  return self->_complicationManager;
}

- (void)setComplicationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationManager, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end