@interface _DASWatchBackgroundBudgetPolicy
+ (id)policyInstance;
- (BOOL)applicationForActivity:(id)a3 isDisallowedWithContext:(id)a4;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)sessionInProgress:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_CDContextualKeyPath)ineligibleAppsKeyPath;
- (_CDContextualKeyPath)launchBudgetKeyPath;
- (_CDContextualKeyPath)queriesKeyPath;
- (_CDContextualKeyPath)sessionInProgressKeyPath;
- (_CDContextualKeyPath)snapshotBudgetKeyPath;
- (_DASWatchBackgroundBudgetPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setIneligibleAppsKeyPath:(id)a3;
- (void)setLaunchBudgetKeyPath:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setQueriesKeyPath:(id)a3;
- (void)setSessionInProgressKeyPath:(id)a3;
- (void)setSnapshotBudgetKeyPath:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASWatchBackgroundBudgetPolicy

- (id)initializeTriggers
{
  v14 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_snapshotBudgetKeyPath];
  v13 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_launchBudgetKeyPath];
  v11 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_queriesKeyPath];
  v9 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_sessionInProgressKeyPath];
  v10 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_ineligibleAppsKeyPath];
  v23[0] = @"identifier";
  v23[1] = @"predicate";
  v24[0] = @"com.apple.duetactivityscheduler.backgroundbudget.snapshot";
  v24[1] = v14;
  v23[2] = @"deviceSet";
  v23[3] = @"mustWake";
  v24[2] = &off_100186F28;
  v24[3] = &__kCFBooleanTrue;
  v12 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  v25[0] = v12;
  v21[0] = @"identifier";
  v21[1] = @"predicate";
  v22[0] = @"com.apple.duetactivityscheduler.backgroundbudget.launch";
  v22[1] = v13;
  v21[2] = @"deviceSet";
  v21[3] = @"mustWake";
  v22[2] = &off_100186F28;
  v22[3] = &__kCFBooleanTrue;
  v3 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
  v25[1] = v3;
  v19[0] = @"identifier";
  v19[1] = @"predicate";
  v20[0] = @"/watch/launch/queries";
  v20[1] = v11;
  v19[2] = @"deviceSet";
  v19[3] = @"mustWake";
  v20[2] = &off_100186F28;
  v20[3] = &__kCFBooleanTrue;
  v4 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  v25[2] = v4;
  v17[0] = @"identifier";
  v17[1] = @"predicate";
  v18[0] = @"com.apple.duetactivityscheduler.session.inprogress";
  v18[1] = v9;
  v17[2] = @"deviceSet";
  v17[3] = @"mustWake";
  v18[2] = &off_100186F28;
  v18[3] = &__kCFBooleanTrue;
  v5 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  v25[3] = v5;
  v15[0] = @"identifier";
  v15[1] = @"predicate";
  v16[0] = @"com.apple.dasd.watch.ineligibleApps";
  v16[1] = v10;
  v15[2] = @"deviceSet";
  v15[3] = @"mustWake";
  v16[2] = &off_100186F28;
  v16[3] = &__kCFBooleanTrue;
  v6 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  v25[4] = v6;
  v7 = +[NSArray arrayWithObjects:v25 count:5];

  return v7;
}

- (_DASWatchBackgroundBudgetPolicy)init
{
  v18.receiver = self;
  v18.super_class = (Class)_DASWatchBackgroundBudgetPolicy;
  v2 = [(_DASWatchBackgroundBudgetPolicy *)&v18 init];
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Watch Background Budget Policy";

    uint64_t v5 = +[_CDContextualKeyPath keyPathWithKey:@"/watch/budget/snapshots"];
    snapshotBudgetKeyPath = v3->_snapshotBudgetKeyPath;
    v3->_snapshotBudgetKeyPath = (_CDContextualKeyPath *)v5;

    uint64_t v7 = +[_CDContextualKeyPath keyPathWithKey:@"/watch/budget/launches"];
    launchBudgetKeyPath = v3->_launchBudgetKeyPath;
    v3->_launchBudgetKeyPath = (_CDContextualKeyPath *)v7;

    uint64_t v9 = +[_CDContextualKeyPath keyPathWithKey:@"/watch/launch/queries"];
    queriesKeyPath = v3->_queriesKeyPath;
    v3->_queriesKeyPath = (_CDContextualKeyPath *)v9;

    uint64_t v11 = +[_CDContextualKeyPath keyPathWithKey:@"/session/inProgress"];
    sessionInProgressKeyPath = v3->_sessionInProgressKeyPath;
    v3->_sessionInProgressKeyPath = (_CDContextualKeyPath *)v11;

    uint64_t v13 = +[_CDContextualKeyPath keyPathWithKey:@"/watch/launch/ineligibleApps"];
    ineligibleAppsKeyPath = v3->_ineligibleAppsKeyPath;
    v3->_ineligibleAppsKeyPath = (_CDContextualKeyPath *)v13;

    uint64_t v15 = [(_DASWatchBackgroundBudgetPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v15;
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006DE90;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C4098 != -1) {
    dispatch_once(&qword_1001C4098, block);
  }
  v2 = (void *)qword_1001C40A0;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"com.apple.duetactivityscheduler.session.inprogress"])
  {
    v6 = +[_CDContextQueries keyPathForBacklightOnStatus];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];
    unsigned __int8 v8 = [v7 BOOLValue];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:_DASBudgetDictionaryKey];

  if (v5) {
    unsigned __int8 v6 = 1;
  }
  else {
    unsigned __int8 v6 = [v3 requestsApplicationLaunch];
  }

  return v6;
}

- (BOOL)sessionInProgress:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:self->_sessionInProgressKeyPath];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (BOOL)applicationForActivity:(id)a3 isDisallowedWithContext:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 objectForKeyedSubscript:self->_ineligibleAppsKeyPath];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned __int8 v8 = [v6 relatedApplications];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        if ([v7 containsObject:*(void *)(*((void *)&v13 + 1) + 8 * i)])
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v9;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Watch Background Budget Policy"];
  unsigned int v9 = [(_DASWatchBackgroundBudgetPolicy *)self applicationForActivity:v6 isDisallowedWithContext:v7];
  uint64_t v10 = [v6 relatedApplications];
  uint64_t v11 = v10;
  if (v9)
  {
    v12 = [v10 description];
    long long v13 = [v12 stringByReplacingOccurrencesOfString:@"\n" withString:@","];

    long long v14 = +[NSString stringWithFormat:@"%@ is disallowed", v13];
    [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:v14 withRequiredValue:0.0 withCurrentValue:1.0];

    long long v15 = +[_DASDaemon sharedInstance];
    long long v16 = +[NSSet setWithObject:v6];
    [v15 cancelActivities:v16];

    v17 = +[_DASPolicyResponse policyResponseWithDecision:100 validityDuration:v8 rationale:(double)0x384uLL];
    goto LABEL_16;
  }
  long long v13 = [v10 firstObject];

  objc_super v18 = [v6 userInfo];
  v19 = [v18 objectForKeyedSubscript:_DASBudgetDictionaryKey];

  if ([v19 isEqualToString:@"/watch/launch/queries"])
  {
    v20 = [v7 objectForKeyedSubscript:self->_queriesKeyPath];
    v21 = [v20 objectForKeyedSubscript:v13];
    unsigned int v22 = [v21 intValue];

    if (!v22)
    {
      [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"queriesBudgetValue" withRequiredValue:1.0 withCurrentValue:0.0];
      uint64_t v23 = [v7 objectForKeyedSubscript:self->_launchBudgetKeyPath];

      v20 = (void *)v23;
    }
    goto LABEL_11;
  }
  if ([v19 isEqualToString:@"/watch/budget/snapshots"])
  {
    snapshotBudgetKeyPath = self->_snapshotBudgetKeyPath;
LABEL_10:
    v20 = [v7 objectForKeyedSubscript:snapshotBudgetKeyPath];
LABEL_11:
    v25 = [v20 objectForKeyedSubscript:v13];
    int v26 = [v25 intValue];

    [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"budgetValue" withRequiredValue:1.0 withCurrentValue:(double)v26];
    if (v26 <= 0) {
      uint64_t v27 = 33;
    }
    else {
      uint64_t v27 = 0;
    }
    v17 = +[_DASPolicyResponse policyResponseWithDecision:v27 validityDuration:v8 rationale:(double)0x384uLL];

    goto LABEL_15;
  }
  if ([v19 isEqualToString:@"/watch/budget/launches"])
  {
    snapshotBudgetKeyPath = self->_launchBudgetKeyPath;
    goto LABEL_10;
  }
  v29 = +[NSPredicate predicateWithFormat:@"budgetKey == nil"];
  [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v29];

  v17 = +[_DASPolicyResponse policyResponseWithDecision:0 validityDuration:v8 rationale:(double)0x384uLL];
LABEL_15:

LABEL_16:

  return v17;
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

- (_CDContextualKeyPath)snapshotBudgetKeyPath
{
  return self->_snapshotBudgetKeyPath;
}

- (void)setSnapshotBudgetKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)launchBudgetKeyPath
{
  return self->_launchBudgetKeyPath;
}

- (void)setLaunchBudgetKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)queriesKeyPath
{
  return self->_queriesKeyPath;
}

- (void)setQueriesKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)sessionInProgressKeyPath
{
  return self->_sessionInProgressKeyPath;
}

- (void)setSessionInProgressKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)ineligibleAppsKeyPath
{
  return self->_ineligibleAppsKeyPath;
}

- (void)setIneligibleAppsKeyPath:(id)a3
{
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_ineligibleAppsKeyPath, 0);
  objc_storeStrong((id *)&self->_sessionInProgressKeyPath, 0);
  objc_storeStrong((id *)&self->_queriesKeyPath, 0);
  objc_storeStrong((id *)&self->_launchBudgetKeyPath, 0);
  objc_storeStrong((id *)&self->_snapshotBudgetKeyPath, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end