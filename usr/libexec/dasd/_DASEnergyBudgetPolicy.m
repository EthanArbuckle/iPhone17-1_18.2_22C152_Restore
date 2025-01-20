@interface _DASEnergyBudgetPolicy
+ (BOOL)budgetIsPositive:(id)a3;
+ (BOOL)isBudgetAvailable:(id)a3;
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreBudgetForActivity:(id)a3 withState:(id)a4;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASComplicationManager)complicationManager;
- (_DASEnergyBudgetPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setComplicationManager:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)updateSystemConstraintsWithContext:(id)a3;
@end

@implementation _DASEnergyBudgetPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  if ([v3 budgeted]) {
    unsigned int v4 = [v3 requiresPlugin] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)initializeTriggers
{
  v2 = +[_CDContextQueries keyPathForEnergyBudgetRemainingStatus];
  id v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v2];

  v10[0] = @"identifier";
  v10[1] = @"predicate";
  v11[0] = @"com.apple.duetactivityscheduler.energybudgetpolicy.status";
  v11[1] = v3;
  v10[2] = @"deviceSet";
  v10[3] = @"mustWake";
  v11[2] = &off_100186D78;
  v11[3] = &__kCFBooleanTrue;
  unsigned int v4 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  v12[0] = v4;
  CFStringRef v8 = @"identifier";
  CFStringRef v9 = @"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin";
  v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v12[1] = v5;
  v6 = +[NSArray arrayWithObjects:v12 count:2];

  return v6;
}

- (_DASEnergyBudgetPolicy)init
{
  v10.receiver = self;
  v10.super_class = (Class)_DASEnergyBudgetPolicy;
  v2 = [(_DASEnergyBudgetPolicy *)&v10 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Energy Budget Policy";

    uint64_t v5 = [(_DASEnergyBudgetPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;

    uint64_t v7 = +[_DASComplicationManager sharedInstance];
    complicationManager = v3->_complicationManager;
    v3->_complicationManager = (_DASComplicationManager *)v7;
  }
  return v3;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

+ (id)policyInstance
{
  if (qword_1001C3E38 != -1) {
    dispatch_once(&qword_1001C3E38, &stru_100176308);
  }
  v2 = (void *)qword_1001C3E40;

  return v2;
}

+ (BOOL)isBudgetAvailable:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[_CDContextQueries keyPathForPluginStatus];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = +[_DASEnergyBudgetPolicy budgetIsPositive:v3];
  }

  return v7;
}

+ (BOOL)budgetIsPositive:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[_CDContextQueries keyPathForEnergyBudgetRemainingStatus];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  if (v5) {
    unsigned __int8 v6 = [v5 BOOLValue];
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
    [v5 removeConstraint:4 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
  }
  else {
    [v5 addConstraint:4 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
  }
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqualToString:@"com.apple.duetactivityscheduler.energybudgetpolicy.status"] & 1) == 0&& !objc_msgSend(v6, "isEqualToString:", @"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin"))
  {
    goto LABEL_6;
  }
  [(_DASEnergyBudgetPolicy *)self updateSystemConstraintsWithContext:v7];
  BOOL v8 = +[_DASEnergyBudgetPolicy budgetIsPositive:v7];
  CFStringRef v9 = +[_DASPLLogger sharedInstance];
  [v9 reportNewStatus:v8 forTrigger:off_1001C3970];

  objc_super v10 = +[_CDContextQueries keyPathForPluginStatus];
  v11 = [v7 objectForKeyedSubscript:v10];
  unsigned int v12 = [v11 BOOLValue];

  if (![v6 isEqualToString:@"com.apple.duetactivityscheduler.energybudgetpolicy.status"]|| !v8|| v12)
  {
    BOOL v13 = [v6 isEqualToString:@"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin"] ^ 1 | v8 | v12 ^ 1;
  }
  else
  {
LABEL_6:
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (BOOL)shouldIgnoreBudgetForActivity:(id)a3 withState:(id)a4
{
  id v5 = a4;
  BOOL v9 = 0;
  if (+[_DASPhotosPolicy isiCPLActivity:a3])
  {
    id v6 = +[_DASPhotosPolicy keyPathForPhotosBudgetOverride];
    id v7 = [v5 objectForKeyedSubscript:v6];
    unsigned __int8 v8 = [v7 unsignedIntegerValue];

    if ((v8 & 2) != 0) {
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_100054F0C;
  v27 = &unk_100175570;
  v28 = self;
  id v7 = a4;
  id v29 = v7;
  if (qword_1001C3E48 != -1) {
    dispatch_once(&qword_1001C3E48, &v24);
  }
  unsigned __int8 v8 = [_DASPolicyResponseRationale alloc];
  BOOL v9 = -[_DASPolicyResponseRationale initWithPolicyName:](v8, "initWithPolicyName:", self->_policyName, v24, v25, v26, v27, v28);
  if (+[_DASEnergyBudgetPolicy budgetIsPositive:v7]) {
    goto LABEL_6;
  }
  [(_DASPolicyResponseRationale *)v9 addRationaleForCondition:@"energyBudget" withRequiredValue:1.0 withCurrentValue:0.0];
  if ([(_DASEnergyBudgetPolicy *)self shouldIgnoreBudgetForActivity:v6 withState:v7])
  {
    objc_super v10 = +[NSPredicate predicateWithFormat:@"shouldOverrideBudget == YES"];
    [(_DASPolicyResponseRationale *)v9 addRationaleWithCondition:v10];

LABEL_6:
    uint64_t v11 = 0;
    char v12 = 1;
    goto LABEL_8;
  }
  char v12 = 0;
  uint64_t v11 = 33;
LABEL_8:
  BOOL v13 = +[_CDContextQueries keyPathForPluginStatus];
  v14 = [v7 objectForKeyedSubscript:v13];
  unsigned int v15 = [v14 BOOLValue];

  if (v15)
  {
    [(_DASPolicyResponseRationale *)v9 addRationaleForCondition:@"pluggedInStatus" withRequiredValue:1.0 withCurrentValue:1.0];
LABEL_11:
    uint64_t v11 = 0;
    goto LABEL_18;
  }
  if (v12) {
    goto LABEL_11;
  }
  v16 = +[NSDate date];
  complicationManager = self->_complicationManager;
  v18 = [v6 relatedApplications];
  if ([(_DASComplicationManager *)complicationManager isAnyActiveComplication:v18])
  {
    v19 = [v6 startAfter];
    [v16 timeIntervalSinceDate:v19];
    double v21 = v20;

    if (v21 > 1800.0) {
      uint64_t v11 = 0;
    }
  }
  else
  {
  }
LABEL_18:
  v22 = +[_DASPolicyResponse policyResponseWithDecision:v11 validityDuration:v9 rationale:(double)0x384uLL];

  return v22;
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