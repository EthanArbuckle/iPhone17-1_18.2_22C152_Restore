@interface _DASWidgetRefreshBudgetPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (NSArray)overrideListWidgets;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_os_log)log;
- (_CDContextualKeyPath)widgetOverrideKeypath;
- (_DASBudgetManager)budgetManager;
- (_DASWidgetRefreshBudgetPolicy)init;
- (double)baselineScoreForActivity:(id)a3;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setBudgetManager:(id)a3;
- (void)setLog:(id)a3;
- (void)setOverrideListWidgets:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setWidgetOverrideKeypath:(id)a3;
@end

@implementation _DASWidgetRefreshBudgetPolicy

- (BOOL)appliesToActivity:(id)a3
{
  v3 = [a3 widgetBudgetID];

  return v3 != 0;
}

- (_DASWidgetRefreshBudgetPolicy)init
{
  v16.receiver = self;
  v16.super_class = (Class)_DASWidgetRefreshBudgetPolicy;
  v2 = [(_DASWidgetRefreshBudgetPolicy *)&v16 init];
  if (v2)
  {
    uint64_t v3 = +[_DASBudgetManager sharedInstance];
    budgetManager = v2->_budgetManager;
    v2->_budgetManager = (_DASBudgetManager *)v3;

    uint64_t v5 = +[_CDContextualKeyPath keyPathWithKey:kDASWidgetOverrideKeyPath];
    widgetOverrideKeypath = v2->_widgetOverrideKeypath;
    v2->_widgetOverrideKeypath = (_CDContextualKeyPath *)v5;

    uint64_t v7 = [(_DASWidgetRefreshBudgetPolicy *)v2 initializeTriggers];
    triggers = v2->_triggers;
    v2->_triggers = (NSArray *)v7;

    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Widget Refresh Policy";

    id v10 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.dasd.widgetRefreshBudgets"];
    [v10 doubleForKey:@"usageDelay"];
    if (v11 > 1.0) {
      qword_1001C3A50 = *(void *)&v11;
    }
    [v10 doubleForKey:@"infrequentCadence"];
    if (v12 > 1.0) {
      qword_1001C3A58 = *(void *)&v12;
    }
    uint64_t v13 = +[_DASDaemonLogger logForCategory:@"widgetRefreshPolicy"];
    log = v2->_log;
    v2->_log = (OS_os_log *)v13;
  }
  return v2;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F2098;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C4590 != -1) {
    dispatch_once(&qword_1001C4590, block);
  }
  v2 = (void *)qword_1001C4598;

  return v2;
}

- (id)initializeTriggers
{
  v2 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_widgetOverrideKeypath];
  v6[0] = @"identifier";
  v6[1] = @"predicate";
  v7[0] = @"com.apple.duetactivityscheduler.widget.overridelist";
  v7[1] = v2;
  v6[2] = @"deviceSet";
  v6[3] = @"mustWake";
  v7[2] = &off_1001877E0;
  v7[3] = &__kCFBooleanTrue;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  v8 = v3;
  v4 = +[NSArray arrayWithObjects:&v8 count:1];

  return v4;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Widget Refresh Policy"];
  id v10 = +[_CDContextQueries keyPathForInUseStatus];
  double v11 = [v8 objectForKeyedSubscript:v10];
  unsigned __int8 v12 = [v11 unsignedLongLongValue];

  if ((v12 & 0xD) == 0)
  {
    uint64_t v13 = +[_CDContextQueries keyPathForLastUseDate];
    v14 = [v8 objectForKeyedSubscript:v13];

    v15 = +[NSDate date];
    [v15 timeIntervalSinceDate:v14];
    double v17 = v16;
    if (v16 > *(double *)&qword_1001C3A50)
    {
      v18 = [v7 startAfter];
      [v15 timeIntervalSinceDate:v18];
      double v20 = v19;
      double v21 = *(double *)&qword_1001C3A58;

      if (v20 < v21)
      {
        v22 = +[NSPredicate predicateWithFormat:@"timeSinceRecentUsage=%d", ((int)v17 / 60)];
        [(_DASPolicyResponseRationale *)v9 addRationaleWithCondition:v22];

        v23 = +[_DASPolicyResponse policyResponseWithDecision:33 validityDuration:v9 rationale:(double)0x384uLL];

        goto LABEL_17;
      }
    }
  }
  v24 = [(_DASBudgetManager *)self->_budgetManager widgetRefreshBudgetManager];
  v25 = [v7 widgetBudgetID];
  [v24 balanceForWidgetBudgetID:v25];
  double v27 = v26;

  if (v27 == -INFINITY)
  {
    v28 = +[NSPredicate predicateWithFormat:@"IndividualBalance=%d", 0x80000000];
    [(_DASPolicyResponseRationale *)v9 addRationaleWithCondition:v28];

    v23 = +[_DASPolicyResponse policyResponseWithDecision:33 validityDuration:v9 rationale:(double)0x384uLL];
    goto LABEL_17;
  }
  LODWORD(v4) = vcvtmd_s64_f64(v27);
  v29 = [v8 objectForKeyedSubscript:self->_widgetOverrideKeypath];
  v30 = [v7 widgetBudgetID];
  unsigned int v31 = [v29 containsObject:v30];

  if (v31)
  {
    v32 = +[NSPredicate predicateWithFormat:@"onOverrideList=%d", 1];
    [(_DASPolicyResponseRationale *)v9 addRationaleWithCondition:v32];
  }
  if ((int)v4 < 1)
  {
    v33 = +[_CDContextQueries keyPathForPluginStatus];
    v34 = [v8 objectForKeyedSubscript:v33];
    unsigned int v35 = [v34 BOOLValue];

    v36 = +[NSPredicate predicateWithFormat:@"IndividualBalance=%d", v4];
    [(_DASPolicyResponseRationale *)v9 addRationaleWithCondition:v36];

    uint64_t v37 = 33;
    if (!v35 || v4) {
      goto LABEL_16;
    }
    +[NSPredicate predicateWithFormat:@"isPluggedIn=%d", 1];
  }
  else
  {
    +[NSPredicate predicateWithFormat:@"IndividualBalance=%d", v4];
  v38 = };
  [(_DASPolicyResponseRationale *)v9 addRationaleWithCondition:v38];

  uint64_t v37 = 0;
LABEL_16:
  v23 = +[_DASPolicyResponse policyResponseWithDecision:v37 validityDuration:v9 rationale:(double)0x384uLL];

LABEL_17:

  return v23;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  unsigned int v5 = [a3 isEqualToString:@"com.apple.duetactivityscheduler.widget.overridelist" a4];
  if (v5) {
    [(_DASBudgetManager *)self->_budgetManager reinstantiateConfiguredBudgets];
  }
  return v5;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (double)baselineScoreForActivity:(id)a3
{
  return 1.0;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 0;
}

- (_DASBudgetManager)budgetManager
{
  return self->_budgetManager;
}

- (void)setBudgetManager:(id)a3
{
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

- (NSArray)overrideListWidgets
{
  return self->_overrideListWidgets;
}

- (void)setOverrideListWidgets:(id)a3
{
}

- (_CDContextualKeyPath)widgetOverrideKeypath
{
  return self->_widgetOverrideKeypath;
}

- (void)setWidgetOverrideKeypath:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_widgetOverrideKeypath, 0);
  objc_storeStrong((id *)&self->_overrideListWidgets, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);

  objc_storeStrong((id *)&self->_budgetManager, 0);
}

@end