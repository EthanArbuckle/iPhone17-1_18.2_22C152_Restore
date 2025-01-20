@interface _DASMemoryPressurePolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (_DASMemoryPressurePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int64_t)currentMemoryPressure;
- (int64_t)memoryPressureLevelWithContext:(id)a3;
- (int64_t)systemMemoryPressure;
- (void)setCurrentMemoryPressure:(int64_t)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASMemoryPressurePolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 schedulingPriority];
  if ((unint64_t)v4 >= _DASSchedulingPriorityUserInitiated) {
    LOBYTE(v5) = 0;
  }
  else {
    unsigned int v5 = [v3 triggersRestart] ^ 1;
  }

  return v5;
}

- (double)weightForActivity:(id)a3
{
  return 5.0;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (int64_t)systemMemoryPressure
{
  int64_t v4 = 1;
  size_t v3 = 8;
  sysctlbyname("kern.memorystatus_vm_pressure_level", &v4, &v3, 0, 0);
  return v4;
}

- (_DASMemoryPressurePolicy)init
{
  v14.receiver = self;
  v14.super_class = (Class)_DASMemoryPressurePolicy;
  v2 = [(_DASMemoryPressurePolicy *)&v14 init];
  size_t v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Memory Pressure Policy";

    unsigned int v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.dasd.memoryPressure", v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v3->_queue);
    timer = v3->_timer;
    v3->_timer = (OS_dispatch_source *)v8;

    dispatch_set_qos_class_fallback();
    dispatch_source_set_timer((dispatch_source_t)v3->_timer, 0, 0x37E11D600uLL, 0x3B9ACA00uLL);
    v10 = v3->_timer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000111BC;
    handler[3] = &unk_1001754F8;
    v13 = v3;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_activate((dispatch_object_t)v3->_timer);
  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001C3EB0 != -1) {
    dispatch_once(&qword_1001C3EB0, &stru_100176520);
  }
  v2 = (void *)qword_1001C3EB8;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (int64_t)memoryPressureLevelWithContext:(id)a3
{
  return self->_currentMemoryPressure;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_DASMemoryPressurePolicy *)self memoryPressureLevelWithContext:v7];
  v9 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Memory Pressure Policy"];
  v10 = +[NSDate date];
  v11 = [v6 startBefore];
  [v11 timeIntervalSinceDate:v10];
  double v13 = v12;

  if (v13 >= 0.0
    || (unsigned int v14 = +[_DASSystemContext isPluggedIn:v7],
        unsigned __int8 v15 = +[_DASDeviceActivityPolicy isDeviceInUse:v7],
        !v14)
    || (v15 & 1) != 0)
  {
    id v20 = [v6 schedulingPriority];
    double v21 = (double)v8;
    if ((unint64_t)v20 <= _DASSchedulingPriorityBackground)
    {
      double v22 = 1.0;
      [(_DASPolicyResponseRationale *)v9 addRationaleForCondition:@"memoryPressure" withRequiredValue:1.0 withCurrentValue:v21];
      unsigned int v23 = !+[_DASDeviceActivityPolicy isDeviceInUse:v7];
      if ((v8 & 2) == 0) {
        unsigned int v23 = 1;
      }
      if (v23 != 1 || (v8 & 4) != 0) {
        goto LABEL_20;
      }
    }
    else
    {
      [(_DASPolicyResponseRationale *)v9 addRationaleForCondition:@"memoryPressure" withRequiredValue:2.0 withCurrentValue:v21];
      if ((v8 & 4) != 0)
      {
LABEL_20:
        double v18 = (double)0x384uLL;
        uint64_t v19 = 33;
        goto LABEL_21;
      }
      if (v8 <= 1) {
        double v22 = 1.0;
      }
      else {
        double v22 = 0.5;
      }
    }
    uint64_t v24 = +[_DASPolicyResponse policyResponseWithScore:v9 validityDuration:v22 rationale:(double)0x384uLL];
    goto LABEL_22;
  }
  id v16 = [v6 schedulingPriority];
  double v17 = 2.0;
  if ((unint64_t)v16 > _DASSchedulingPriorityBackground) {
    double v17 = 4.0;
  }
  [(_DASPolicyResponseRationale *)v9 addRationaleForCondition:@"memoryPressure" withRequiredValue:v17 withCurrentValue:(double)v8];
  if ((v8 & 4) != 0)
  {
    id v25 = [v6 schedulingPriority];
    if ((unint64_t)v25 <= _DASSchedulingPriorityBackground && v13 > -86400.0) {
      goto LABEL_20;
    }
  }
  double v18 = (double)0x384uLL;
  uint64_t v19 = 0;
LABEL_21:
  uint64_t v24 = +[_DASPolicyResponse policyResponseWithDecision:v19 validityDuration:v9 rationale:v18];
LABEL_22:
  v26 = (void *)v24;

  return v26;
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

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)currentMemoryPressure
{
  return self->_currentMemoryPressure;
}

- (void)setCurrentMemoryPressure:(int64_t)a3
{
  self->_currentMemoryPressure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end