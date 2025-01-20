@interface _DASFileProtectionPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)deviceRecentlyLocked:(id)a3 since:(id)a4;
- (BOOL)isClassCLocked;
- (BOOL)passwordConfigured;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_queue)handleUnlockQueue;
- (_DASFileProtectionPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int)classCLockedToken;
- (void)setClassCLockedToken:(int)a3;
- (void)setHandleUnlockQueue:(id)a3;
- (void)setIsClassCLocked:(BOOL)a3;
- (void)setPasswordConfigured:(BOOL)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASFileProtectionPolicy

- (BOOL)appliesToActivity:(id)a3
{
  v3 = [a3 fileProtection];
  unsigned __int8 v4 = [v3 indicatesProtection];

  return v4;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (id)initializeTriggers
{
  v2 = +[_CDContextQueries keyPathForDeviceLockStatus];
  v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v2];

  unsigned __int8 v4 = +[_CDContextQueries keyPathForKeybagLockStatus];
  v5 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v4];

  v12[0] = @"identifier";
  v12[1] = @"predicate";
  v13[0] = @"com.apple.das.fileprotectionpolicy.statuschanged";
  v13[1] = v3;
  v12[2] = @"deviceSet";
  v12[3] = @"mustWake";
  v13[2] = &off_100186D90;
  v13[3] = &__kCFBooleanTrue;
  v6 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
  v14[0] = v6;
  v10[0] = @"identifier";
  v10[1] = @"predicate";
  v11[0] = @"com.apple.das.fileprotectionpolicy.kbstatuschanged";
  v11[1] = v5;
  v10[2] = @"deviceSet";
  v10[3] = @"mustWake";
  v11[2] = &off_100186D90;
  v11[3] = &__kCFBooleanTrue;
  v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  v14[1] = v7;
  v8 = +[NSArray arrayWithObjects:v14 count:2];

  return v8;
}

- (_DASFileProtectionPolicy)init
{
  v17.receiver = self;
  v17.super_class = (Class)_DASFileProtectionPolicy;
  v2 = [(_DASFileProtectionPolicy *)&v17 init];
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"File Protection Policy";

    uint64_t v5 = [(_DASFileProtectionPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.duetactivityscheduler.fileprotectionpolicy.queue", 0);
    handleUnlockQueue = v3->_handleUnlockQueue;
    v3->_handleUnlockQueue = (OS_dispatch_queue *)v7;

    v9 = v3->_handleUnlockQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000552D8;
    handler[3] = &unk_1001759D0;
    v10 = v3;
    v16 = v10;
    notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &v3->_classCLockedToken, v9, handler);
    CFBooleanRef v11 = (const __CFBoolean *)MGCopyAnswer();
    CFBooleanRef v12 = v11;
    if (v11) {
      CFRelease(v11);
    }
    BOOL v13 = kCFBooleanTrue == v12 && MKBDeviceUnlockedSinceBoot() == 0;
    v10->_isClassCLocked = v13;
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055404;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3E50 != -1) {
    dispatch_once(&qword_1001C3E50, block);
  }
  v2 = (void *)qword_1001C3E58;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (BOOL)deviceRecentlyLocked:(id)a3 since:(id)a4
{
  id v4 = a3;
  uint64_t v5 = +[_CDContextQueries keyPathForDeviceLockStatus];
  v6 = [v4 objectForKeyedSubscript:v5];
  unsigned __int8 v7 = [v6 BOOLValue];

  v8 = +[_CDContextQueries keyPathForKeybagLockStatus];
  v9 = [v4 objectForKeyedSubscript:v8];

  LOBYTE(v4) = [v9 BOOLValue];
  return v7 & (v4 ^ 1);
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL isClassCLocked = self->_isClassCLocked;
  v9 = +[_CDContextQueries keyPathForKeybagLockStatus];
  v10 = [v7 objectForKeyedSubscript:v9];
  id v11 = [v10 BOOLValue];

  CFBooleanRef v12 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"File Protection Policy"];
  if (v11)
  {
    BOOL v13 = [v6 fileProtection];
    v14 = +[_DASFileProtection complete];
    unsigned int v15 = [v13 isEqual:v14];

    if (v15)
    {
      v16 = +[NSNumber numberWithBool:1];
      objc_super v17 = [v6 fileProtection];
      +[NSPredicate predicateWithFormat:@"classALocked == %@ && activityFileProtection == %@", v16, v17];
      v21 = LABEL_7:;
      [(_DASPolicyResponseRationale *)v12 addRationaleWithCondition:v21];
      goto LABEL_8;
    }
  }
  if (isClassCLocked)
  {
    v18 = [v6 fileProtection];
    v19 = +[_DASFileProtection completeUntilFirstUserAuthentication];
    unsigned int v20 = [v18 isEqual:v19];

    if (v20)
    {
      v16 = +[NSNumber numberWithBool:1];
      objc_super v17 = [v6 fileProtection];
      +[NSPredicate predicateWithFormat:@"classCLocked == %@ && activityFileProtection == %@", v16, v17];
      goto LABEL_7;
    }
  }
  v24 = [v6 fileProtection];
  v25 = +[_DASFileProtection completeUnlessOpen];
  unsigned int v26 = [v24 isEqual:v25];

  if (v26)
  {
    v16 = +[NSDate date];
    if ([(_DASFileProtectionPolicy *)self deviceRecentlyLocked:v7 since:v16]
      || ([v6 startDate], v27 = objc_claimAutoreleasedReturnValue(), v27, v27)
      || (v11 & 1) == 0 && ([v6 overdueAtDate:v16] & 1) != 0)
    {
      uint64_t v22 = 0;
      v23 = 0;
      goto LABEL_13;
    }
    v30 = [v6 startBefore];
    [v30 timeIntervalSinceDate:v16];
    double v32 = v31;

    objc_super v17 = +[NSNumber numberWithBool:v11];
    v21 = [v6 fileProtection];
    v33 = +[NSNumber numberWithDouble:v32];
    v34 = +[NSPredicate predicateWithFormat:@"classALocked == %@ && activityFileProtection == %@ && timeUntilDeadline == %@", v17, v21, v33];
    [(_DASPolicyResponseRationale *)v12 addRationaleWithCondition:v34];

LABEL_8:
    uint64_t v22 = 100;
    v23 = v12;
LABEL_13:

    goto LABEL_15;
  }
  uint64_t v22 = 0;
  v23 = 0;
LABEL_15:
  v28 = +[_DASPolicyResponse policyResponseWithDecision:v22 validityDuration:v23 rationale:(double)0x384uLL];

  return v28;
}

- (BOOL)isClassCLocked
{
  return self->_isClassCLocked;
}

- (void)setIsClassCLocked:(BOOL)a3
{
  self->_BOOL isClassCLocked = a3;
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

- (BOOL)passwordConfigured
{
  return self->_passwordConfigured;
}

- (void)setPasswordConfigured:(BOOL)a3
{
  self->_passwordConfigured = a3;
}

- (int)classCLockedToken
{
  return self->_classCLockedToken;
}

- (void)setClassCLockedToken:(int)a3
{
  self->_classCLockedToken = a3;
}

- (OS_dispatch_queue)handleUnlockQueue
{
  return self->_handleUnlockQueue;
}

- (void)setHandleUnlockQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleUnlockQueue, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end