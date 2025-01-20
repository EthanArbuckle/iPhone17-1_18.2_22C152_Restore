@interface _DASRemoteWidgetBudgetPolicy
+ (BOOL)budgetIsPositive:(id)a3;
+ (BOOL)isBudgetAvailable:(id)a3;
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)unavailableToday;
- (NSArray)triggers;
- (NSDate)actualUnavailableDate;
- (NSDate)unavailableDate;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_os_log)log;
- (_DASRemoteWidgetBudgetPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)loadUnavailable;
- (void)logActualUnavailableDurationWithState:(id)a3;
- (void)logExhaustedDuration:(double)a3 withPluginConsideration:(BOOL)a4;
- (void)logUnavailableDurationWithState:(id)a3;
- (void)registerDailyTimer;
- (void)saveActualUnavailableDate:(id)a3;
- (void)saveUnavailableDate:(id)a3;
- (void)setActualUnavailableDate:(id)a3;
- (void)setLog:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setUnavailableDate:(id)a3;
- (void)setUnavailableToday:(BOOL)a3;
@end

@implementation _DASRemoteWidgetBudgetPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 schedulingPriority];
  if ((unint64_t)v4 <= _DASSchedulingPriorityUtility && [v3 targetDevice] == (id)3)
  {
    v5 = [v3 widgetID];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)initializeTriggers
{
  v2 = +[_DASBudgetManager sharedInstance];
  id v3 = [v2 budgetKeyPathForBudgetName:@"com.apple.dasd.remoteWidget"];
  id v4 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v3];

  v11[0] = @"identifier";
  v11[1] = @"predicate";
  v12[0] = @"com.apple.das.remoteWidgetBudget";
  v12[1] = v4;
  v11[2] = @"deviceSet";
  v11[3] = @"mustWake";
  v12[2] = &off_1001871F8;
  v12[3] = &__kCFBooleanTrue;
  v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  v13[0] = v5;
  CFStringRef v9 = @"identifier";
  CFStringRef v10 = @"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin";
  BOOL v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v13[1] = v6;
  v7 = +[NSArray arrayWithObjects:v13 count:2];

  return v7;
}

- (_DASRemoteWidgetBudgetPolicy)init
{
  v10.receiver = self;
  v10.super_class = (Class)_DASRemoteWidgetBudgetPolicy;
  v2 = [(_DASRemoteWidgetBudgetPolicy *)&v10 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.duetactivityscheduler", "remotewidgetbudget");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Remote Widget Budget Policy";

    policyDescription = v2->_policyDescription;
    v2->_policyDescription = (NSString *)@"Blocks remote widget activities based on remaining budget.";

    uint64_t v7 = [(_DASRemoteWidgetBudgetPolicy *)v2 initializeTriggers];
    triggers = v2->_triggers;
    v2->_triggers = (NSArray *)v7;

    [(_DASRemoteWidgetBudgetPolicy *)v2 loadUnavailable];
    [(_DASRemoteWidgetBudgetPolicy *)v2 registerDailyTimer];
  }
  return v2;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096948;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C42C8 != -1) {
    dispatch_once(&qword_1001C42C8, block);
  }
  v2 = (void *)qword_1001C42D0;

  return v2;
}

+ (BOOL)isBudgetAvailable:(id)a3
{
  id v3 = a3;
  id v4 = +[_CDContextQueries keyPathForPluginStatus];
  v5 = [v3 objectForKeyedSubscript:v4];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = +[_DASRemoteWidgetBudgetPolicy budgetIsPositive:v3];
  }

  return v7;
}

+ (BOOL)budgetIsPositive:(id)a3
{
  id v3 = a3;
  id v4 = +[_DASBudgetManager sharedInstance];
  v5 = [v4 budgetKeyPathForBudgetName:@"com.apple.dasd.remoteWidget"];
  unsigned __int8 v6 = [v3 objectForKeyedSubscript:v5];

  if (v6) {
    unsigned __int8 v7 = [v6 BOOLValue];
  }
  else {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (void)registerDailyTimer
{
  id v3 = +[NSDate now];
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
  v5 = [v4 objectForKey:@"remoteWidgetLoggingInterval"];
  [v5 doubleValue];
  double v7 = v6;

  [v3 timeIntervalSinceReferenceDate];
  double v9 = v8;
  objc_super v10 = dispatch_get_global_queue(-32768, 0);
  v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v10);

  if (v9 >= v7)
  {
    dispatch_time_t v15 = dispatch_walltime(0, 86400000000000);
    dispatch_source_set_timer(v11, v15, 0x4E94914F0000uLL, 0x3B9ACA00uLL);
    v13 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    v14 = +[NSNumber numberWithDouble:v9 + 86400.0];
    [v13 setObject:v14 forKey:@"remoteWidgetLoggingInterval"];
    goto LABEL_5;
  }
  dispatch_time_t v12 = dispatch_walltime(0, (uint64_t)((v7 - v9) * 1000000000.0));
  dispatch_source_set_timer(v11, v12, 0x4E94914F0000uLL, 0x3B9ACA00uLL);
  v13 = +[_DASDaemonLogger logForCategory:@"remoteWidgetBudget"];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v7];
    *(_DWORD *)buf = 138412290;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Analytics will fire at %@", buf, 0xCu);
LABEL_5:
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100096D50;
  handler[3] = &unk_1001754F8;
  handler[4] = self;
  dispatch_source_set_event_handler(v11, handler);
  dispatch_activate(v11);
}

- (void)logExhaustedDuration:(double)a3 withPluginConsideration:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = +[_DASDaemonLogger logForCategory:@"remoteWidgetBudget"];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v7) {
      sub_1000FBD88(a3);
    }

    double v8 = (double *)v11;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    double v9 = sub_100096F80;
  }
  else
  {
    if (v7) {
      sub_1000FBE24(a3);
    }

    double v8 = (double *)v10;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    double v9 = sub_100097040;
  }
  *((void *)v8 + 2) = v9;
  *((void *)v8 + 3) = &unk_100177510;
  v8[4] = a3;
  AnalyticsSendEventLazy();
}

- (void)logUnavailableDurationWithState:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[_DASRemoteWidgetBudgetPolicy budgetIsPositive:v4];
  p_unavailableDate = &self->_unavailableDate;
  unavailableDate = self->_unavailableDate;
  if (v5)
  {
    if (unavailableDate)
    {
      [(NSDate *)unavailableDate timeIntervalSinceNow];
      if (v8 >= -86400.0)
      {
        [(_DASRemoteWidgetBudgetPolicy *)self logExhaustedDuration:0 withPluginConsideration:-v8];
      }
      else
      {
        double v9 = +[_DASDaemonLogger logForCategory:@"remoteWidgetBudget"];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000FBEC0((uint64_t *)&self->_unavailableDate, v9);
        }
      }
      dispatch_time_t v12 = *p_unavailableDate;
      if (*p_unavailableDate || self->_unavailableToday)
      {
        self->_unavailableDate = 0;

        self->_unavailableToday = 0;
        goto LABEL_13;
      }
    }
  }
  else if (!unavailableDate)
  {
    objc_super v10 = +[NSDate now];
    v11 = self->_unavailableDate;
    self->_unavailableDate = v10;

LABEL_13:
    [(_DASRemoteWidgetBudgetPolicy *)self saveUnavailableDate:self->_unavailableDate];
  }
  [(_DASRemoteWidgetBudgetPolicy *)self logActualUnavailableDurationWithState:v4];
}

- (void)logActualUnavailableDurationWithState:(id)a3
{
  unsigned __int8 v4 = +[_DASRemoteWidgetBudgetPolicy isBudgetAvailable:a3];
  p_actualUnavailableDate = &self->_actualUnavailableDate;
  actualUnavailableDate = self->_actualUnavailableDate;
  if (v4)
  {
    if (actualUnavailableDate)
    {
      [(NSDate *)actualUnavailableDate timeIntervalSinceNow];
      if (v7 >= -86400.0)
      {
        [(_DASRemoteWidgetBudgetPolicy *)self logExhaustedDuration:1 withPluginConsideration:-v7];
LABEL_14:
        dispatch_time_t v12 = *p_actualUnavailableDate;
        if (*p_actualUnavailableDate)
        {
          self->_actualUnavailableDate = 0;

          [(_DASRemoteWidgetBudgetPolicy *)self saveActualUnavailableDate:self->_actualUnavailableDate];
        }
        return;
      }
      double v8 = +[_DASDaemonLogger logForCategory:@"remoteWidgetBudget"];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000FBF80((uint64_t *)&self->_actualUnavailableDate, v8);
      }
    }
    else
    {
      double v8 = +[_DASDaemonLogger logForCategory:@"remoteWidgetBudget"];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000FBF3C(v8);
      }
    }

    goto LABEL_14;
  }
  if (!actualUnavailableDate)
  {
    double v9 = +[NSDate now];
    objc_super v10 = self->_actualUnavailableDate;
    self->_actualUnavailableDate = v9;

    v11 = self->_actualUnavailableDate;
    [(_DASRemoteWidgetBudgetPolicy *)self saveActualUnavailableDate:v11];
  }
}

- (void)saveUnavailableDate:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (!v4)
  {
    id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    [v5 removeObjectForKey:@"remoteWidgetUnavailableInterval"];

    id v6 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    [v6 removeObjectForKey:@"remoteWidgetUnavailableToday"];

    id v4 = 0;
  }
  [v4 timeIntervalSinceReferenceDate];
  double v8 = v7;
  id v9 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
  objc_super v10 = +[NSNumber numberWithDouble:v8];
  [v9 setObject:v10 forKey:@"remoteWidgetUnavailableInterval"];

  id v11 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
  [v11 setBool:self->_unavailableToday forKey:@"remoteWidgetUnavailableToday"];
}

- (void)saveActualUnavailableDate:(id)a3
{
  id v3 = a3;
  id v9 = v3;
  if (!v3)
  {
    id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    [v4 removeObjectForKey:@"remoteWidgetActualUnavailableInterval"];

    id v3 = 0;
  }
  [v3 timeIntervalSinceReferenceDate];
  double v6 = v5;
  id v7 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
  double v8 = +[NSNumber numberWithDouble:v6];
  [v7 setObject:v8 forKey:@"remoteWidgetActualUnavailableInterval"];
}

- (void)loadUnavailable
{
  actualUnavailableDate = self->_actualUnavailableDate;
  self->_actualUnavailableDate = 0;

  unavailableDate = self->_unavailableDate;
  self->_unavailableDate = 0;

  id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
  self->_unavailableToday = [v5 BOOLForKey:@"remoteWidgetUnavailableToday"];

  id v6 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
  id v7 = [v6 objectForKey:@"remoteWidgetUnavailableInterval"];

  [v7 doubleValue];
  if (v8 == 0.0)
  {
    dispatch_time_t v15 = v7;
  }
  else
  {
    +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    id v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    objc_super v10 = self->_unavailableDate;
    self->_unavailableDate = v9;

    id v11 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    v16 = [v11 objectForKey:@"remoteWidgetActualUnavailableInterval"];

    [v16 doubleValue];
    if (v12 != 0.0)
    {
      +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v14 = self->_actualUnavailableDate;
      self->_actualUnavailableDate = v13;
    }
    dispatch_time_t v15 = v16;
  }
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqualToString:@"com.apple.das.remoteWidgetBudget"] & 1) == 0
    && ![v6 isEqualToString:@"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin"])
  {
    goto LABEL_5;
  }
  unsigned int v8 = +[_DASRemoteWidgetBudgetPolicy budgetIsPositive:v7];
  id v9 = +[_CDContextQueries keyPathForPluginStatus];
  objc_super v10 = [v7 objectForKeyedSubscript:v9];
  unsigned int v11 = [v10 BOOLValue];

  if (![v6 isEqualToString:@"com.apple.das.remoteWidgetBudget"])
  {
    [(_DASRemoteWidgetBudgetPolicy *)self logActualUnavailableDurationWithState:v7];
    if ((v11 ^ 1 | v8) != 1) {
      goto LABEL_5;
    }
LABEL_7:
    BOOL v12 = 1;
    goto LABEL_8;
  }
  [(_DASRemoteWidgetBudgetPolicy *)self logUnavailableDurationWithState:v7];
  if ((v8 ^ 1 | v11)) {
    goto LABEL_7;
  }
LABEL_5:
  BOOL v12 = 0;
LABEL_8:

  return v12;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5 = a4;
  id v6 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:self->_policyName];
  unsigned __int8 v7 = +[_DASRemoteWidgetBudgetPolicy isBudgetAvailable:v5];

  if (v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    [(_DASPolicyResponseRationale *)v6 addRationaleForCondition:@"remoteWidgetBudget" withRequiredValue:1.0 withCurrentValue:0.0];
    uint64_t v8 = 100;
  }
  id v9 = +[_DASPolicyResponse policyResponseWithDecision:v8 validityDuration:v6 rationale:(double)0x384uLL];

  return v9;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
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

- (NSDate)unavailableDate
{
  return self->_unavailableDate;
}

- (void)setUnavailableDate:(id)a3
{
}

- (NSDate)actualUnavailableDate
{
  return self->_actualUnavailableDate;
}

- (void)setActualUnavailableDate:(id)a3
{
}

- (BOOL)unavailableToday
{
  return self->_unavailableToday;
}

- (void)setUnavailableToday:(BOOL)a3
{
  self->_unavailableToday = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualUnavailableDate, 0);
  objc_storeStrong((id *)&self->_unavailableDate, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end