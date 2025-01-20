@interface _DASUrgencyOverridePolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSMutableDictionary)urgentActivities;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASUrgencyOverridePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)rationaleWithUrgencyOverride:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int64_t)makeDecisionBasedOnUrgencyOverride:(id)a3;
- (os_unfair_lock_s)lock;
- (void)addActivity:(id)a3 urgencyLevel:(int64_t)a4;
- (void)removeActivity:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setUrgentActivities:(id)a3;
@end

@implementation _DASUrgencyOverridePolicy

- (BOOL)appliesToActivity:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  urgentActivities = self->_urgentActivities;
  v7 = [v5 name];

  v8 = [(NSMutableDictionary *)urgentActivities objectForKey:v7];
  LOBYTE(urgentActivities) = v8 != 0;

  os_unfair_lock_unlock(p_lock);
  return (char)urgentActivities;
}

- (_DASUrgencyOverridePolicy)init
{
  v12.receiver = self;
  v12.super_class = (Class)_DASUrgencyOverridePolicy;
  v2 = [(_DASUrgencyOverridePolicy *)&v12 init];
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Urgency Override Policy";

    id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    v6 = [v5 dictionaryForKey:@"urgentActivities"];
    v7 = (NSMutableDictionary *)[v6 mutableCopy];
    urgentActivities = v3->_urgentActivities;
    v3->_urgentActivities = v7;

    if (!v3->_urgentActivities)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v10 = v3->_urgentActivities;
      v3->_urgentActivities = v9;
    }
    v3->_lock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057CAC;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3E80 != -1) {
    dispatch_once(&qword_1001C3E80, block);
  }
  v2 = (void *)qword_1001C3E88;

  return v2;
}

- (void)addActivity:(id)a3 urgencyLevel:(int64_t)a4
{
  id v6 = a3;
  v7 = +[_DASDaemonLogger logForCategory:@"UrgencyOverride"];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding %@ to _urgentActivities", (uint8_t *)&v11, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  urgentActivities = self->_urgentActivities;
  v9 = +[NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)urgentActivities setValue:v9 forKey:v6];

  os_unfair_lock_unlock(&self->_lock);
  id v10 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
  [v10 setObject:self->_urgentActivities forKey:@"urgentActivities"];
}

- (void)removeActivity:(id)a3
{
  id v4 = a3;
  id v5 = +[_DASDaemonLogger logForCategory:@"UrgencyOverride"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing %@ from _urgentActivities", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_urgentActivities removeObjectForKey:v4];
  os_unfair_lock_unlock(&self->_lock);
  id v6 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
  [v6 setObject:self->_urgentActivities forKey:@"urgentActivities"];
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 1;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5 = a3;
  int64_t v6 = [(_DASUrgencyOverridePolicy *)self makeDecisionBasedOnUrgencyOverride:v5];
  int v7 = [(_DASUrgencyOverridePolicy *)self rationaleWithUrgencyOverride:v5];

  id v8 = +[_DASPolicyResponse policyResponseWithDecision:v6 validityDuration:v7 rationale:(double)0x384uLL];

  return v8;
}

- (int64_t)makeDecisionBasedOnUrgencyOverride:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  urgentActivities = self->_urgentActivities;
  int v7 = [v5 name];

  id v8 = [(NSMutableDictionary *)urgentActivities valueForKey:v7];

  os_unfair_lock_unlock(p_lock);
  if ([v8 intValue] == 2)
  {
    int64_t v9 = 200;
  }
  else if ([v8 intValue] == 1)
  {
    int64_t v9 = 67;
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)rationaleWithUrgencyOverride:(id)a3
{
  id v4 = a3;
  id v5 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Urgency Override Policy"];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  urgentActivities = self->_urgentActivities;
  id v8 = [v4 name];

  int64_t v9 = [(NSMutableDictionary *)urgentActivities valueForKey:v8];

  os_unfair_lock_unlock(p_lock);
  id v10 = +[NSString stringWithFormat:@"urgencylevel == %@", v9];
  [(_DASPolicyResponseRationale *)v5 addRationaleForCondition:v10 withRequiredValue:1.0 withCurrentValue:1.0];

  return v5;
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

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)urgentActivities
{
  return self->_urgentActivities;
}

- (void)setUrgentActivities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urgentActivities, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end