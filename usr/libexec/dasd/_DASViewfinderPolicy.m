@interface _DASViewfinderPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)viewfinderIsActive;
- (FigCameraViewfinder)viewFinder;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_queue)queue;
- (_DASViewfinderPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setViewFinder:(id)a3;
- (void)setViewfinderIsActive:(BOOL)a3;
@end

@implementation _DASViewfinderPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = [a3 schedulingPriority];
  return (unint64_t)v3 < _DASSchedulingPriorityUserInitiated;
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
  CFStringRef v5 = @"identifier";
  CFStringRef v6 = @"com.apple.das.viewfinder.statuschanged";
  v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v7 = v2;
  id v3 = +[NSArray arrayWithObjects:&v7 count:1];

  return v3;
}

- (_DASViewfinderPolicy)init
{
  v13.receiver = self;
  v13.super_class = (Class)_DASViewfinderPolicy;
  v2 = [(_DASViewfinderPolicy *)&v13 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Viewfinder Policy";

    uint64_t v5 = [(_DASViewfinderPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.dasd.viewfinderpolicy", v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = +[FigCameraViewfinder cameraViewfinder];
    viewFinder = v3->_viewFinder;
    v3->_viewFinder = (FigCameraViewfinder *)v10;

    [(FigCameraViewfinder *)v3->_viewFinder setDelegate:v3 queue:v3->_queue];
    [(FigCameraViewfinder *)v3->_viewFinder startWithOptions:0];
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EEFAC;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C4550 != -1) {
    dispatch_once(&qword_1001C4550, block);
  }
  v2 = (void *)qword_1001C4558;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  unsigned int v5 = [a3 isEqualToString:@"com.apple.das.viewfinder.statuschanged" a4];
  if (v5) {
    LOBYTE(v5) = self->_viewfinderIsActive;
  }
  return v5;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  if (self->_viewfinderIsActive) {
    uint64_t v4 = 33;
  }
  else {
    uint64_t v4 = 0;
  }
  unsigned int v5 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Viewfinder Policy"];
  [(_DASPolicyResponseRationale *)v5 addRationaleForCondition:@"viewfinderActive" withRequiredValue:0.0 withCurrentValue:1.0];
  CFStringRef v6 = +[_DASPolicyResponse policyResponseWithDecision:v4 validityDuration:v5 rationale:(double)0x384uLL];

  return v6;
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4
{
  self->_viewfinderIsActive = 1;
  uint64_t v4 = +[_DASDaemonLogger logForCategory:@"viewfinder", a4];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trigger: /device/system/viewfinderActive is now [1]", v7, 2u);
  }

  unsigned int v5 = +[_DASDaemon sharedInstance];
  CFStringRef v8 = @"com.apple.das.viewfinder.statuschanged";
  CFStringRef v6 = +[NSArray arrayWithObjects:&v8 count:1];
  [v5 handleTriggersBatched:v6];
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4
{
  self->_viewfinderIsActive = 0;
  uint64_t v4 = +[_DASDaemonLogger logForCategory:@"viewfinder", a4];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trigger: /device/system/viewfinderActive is now [0]", v7, 2u);
  }

  unsigned int v5 = +[_DASDaemon sharedInstance];
  CFStringRef v8 = @"com.apple.das.viewfinder.statuschanged";
  CFStringRef v6 = +[NSArray arrayWithObjects:&v8 count:1];
  [v5 handleTriggersBatched:v6];
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

- (BOOL)viewfinderIsActive
{
  return self->_viewfinderIsActive;
}

- (void)setViewfinderIsActive:(BOOL)a3
{
  self->_viewfinderIsActive = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (FigCameraViewfinder)viewFinder
{
  return self->_viewFinder;
}

- (void)setViewFinder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewFinder, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end