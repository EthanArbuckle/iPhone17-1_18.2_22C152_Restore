@interface _DASUserRequestedBackupPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_CDContextualKeyPath)userRequestedBackup;
- (_DASUserRequestedBackupPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setUserRequestedBackup:(id)a3;
@end

@implementation _DASUserRequestedBackupPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 schedulingPriority];
  if ((unint64_t)v4 >= _DASSchedulingPriorityUserInitiated)
  {
    unsigned __int8 v5 = 0;
  }
  else if ([v3 userRequestedBackupTask])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unsigned __int8 v5 = [v3 requiresNetwork];
  }

  return v5;
}

- (id)initializeTriggers
{
  v2 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_userRequestedBackup];
  v6[0] = @"identifier";
  v6[1] = @"predicate";
  v7[0] = @"com.apple.das.userRequestedBackup";
  v7[1] = v2;
  v6[2] = @"deviceSet";
  v6[3] = @"mustWake";
  v7[2] = &off_100186F10;
  v7[3] = &__kCFBooleanTrue;
  id v3 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  v8 = v3;
  id v4 = +[NSArray arrayWithObjects:&v8 count:1];

  return v4;
}

- (_DASUserRequestedBackupPolicy)init
{
  v10.receiver = self;
  v10.super_class = (Class)_DASUserRequestedBackupPolicy;
  v2 = [(_DASUserRequestedBackupPolicy *)&v10 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"User Requested Backup Policy";

    uint64_t v5 = +[_DASUserRequestedBackupTaskManager userRequestedBackupKeyPath];
    userRequestedBackup = v3->_userRequestedBackup;
    v3->_userRequestedBackup = (_CDContextualKeyPath *)v5;

    uint64_t v7 = [(_DASUserRequestedBackupPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v7;
  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001C4070 != -1) {
    dispatch_once(&qword_1001C4070, &stru_100176918);
  }
  v2 = (void *)qword_1001C4078;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a4;
  BOOL v9 = 1;
  if ([a3 isEqualToString:@"com.apple.das.userRequestedBackup"])
  {
    uint64_t v7 = [v6 objectForKeyedSubscript:self->_userRequestedBackup];
    unsigned __int8 v8 = [v7 BOOLValue];

    if (v8) {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (double)weightForActivity:(id)a3
{
  return 0.1;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 objectForKeyedSubscript:self->_userRequestedBackup];
  id v8 = [v7 BOOLValue];

  BOOL v9 = +[_DASDaemon sharedInstance];
  objc_super v10 = [v9 backupTaskManager];

  v11 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"User Requested Backup Policy"];
  unsigned int v12 = [v6 userRequestedBackupTask];
  if (v12)
  {
    v13 = [v6 startDate];
    if (v13)
    {
    }
    else if (([v10 activityEligibleForRunning:v6] & 1) == 0)
    {
      v17 = +[NSPredicate predicateWithFormat:@"eligibleForRunning == %@", &__kCFBooleanFalse];
      [(_DASPolicyResponseRationale *)v11 addRationaleWithCondition:v17];

      uint64_t v16 = 33;
      goto LABEL_15;
    }
  }
  v14 = +[NSNumber numberWithBool:v8];
  v15 = +[NSPredicate predicateWithFormat:@"userRequestedBackup == %@", v14];
  [(_DASPolicyResponseRationale *)v11 addRationaleWithCondition:v15];

  if (v8)
  {
    if (v12)
    {
      uint64_t v16 = 67;
    }
    else if ([v6 requiresNetwork])
    {
      uint64_t v16 = 67;
    }
    else
    {
      uint64_t v16 = 33;
    }
  }
  else if (v12)
  {
    uint64_t v16 = 33;
  }
  else
  {
    uint64_t v16 = 0;
  }
LABEL_15:
  v18 = +[_DASPolicyResponse policyResponseWithDecision:v16 validityDuration:v11 rationale:(double)0x384uLL];

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

- (_CDContextualKeyPath)userRequestedBackup
{
  return self->_userRequestedBackup;
}

- (void)setUserRequestedBackup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userRequestedBackup, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end