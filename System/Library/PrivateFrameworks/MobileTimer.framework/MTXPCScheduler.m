@interface MTXPCScheduler
+ (MTXPCScheduler)xpcSchedulerWithEvent:(id)a3;
- (MTXPCScheduler)initWithEvent:(id)a3;
- (NSString)eventName;
- (void)scheduleActivityWithCriteria:(id)a3 activityHandler:(id)a4;
- (void)scheduleActivityWithCriteria:(id)a3 activityHandler:(id)a4 performImmediately:(BOOL)a5;
- (void)scheduleTimerForSeconds:(double)a3;
- (void)setEventName:(id)a3;
- (void)unscheduleActivity;
- (void)unscheduleTimer;
@end

@implementation MTXPCScheduler

+ (MTXPCScheduler)xpcSchedulerWithEvent:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithEvent:v4];

  return (MTXPCScheduler *)v5;
}

- (MTXPCScheduler)initWithEvent:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTXPCScheduler;
  v5 = [(MTXPCScheduler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v6;
  }
  return v5;
}

- (void)scheduleTimerForSeconds:(double)a3
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  time_t v5 = time(0);
  xpc_dictionary_set_date(xdict, "Date", 1000000000 * (unint64_t)(ceil(a3) + (double)v5));
  if (MTIsHorseman()) {
    xpc_dictionary_set_BOOL(xdict, "UserVisible", 1);
  }
  [(NSString *)self->_eventName UTF8String];
  xpc_set_event();
}

- (void)unscheduleTimer
{
  [(NSString *)self->_eventName UTF8String];
  xpc_set_event();
}

- (void)scheduleActivityWithCriteria:(id)a3 activityHandler:(id)a4
{
}

- (void)scheduleActivityWithCriteria:(id)a3 activityHandler:(id)a4 performImmediately:(BOOL)a5
{
  BOOL v5 = a5;
  xpc_activity_handler_t handler = a4;
  eventName = self->_eventName;
  id v9 = a3;
  xpc_activity_register([(NSString *)eventName UTF8String], v9, handler);

  if (v5) {
    (*((void (**)(xpc_activity_handler_t, void))handler + 2))(handler, 0);
  }
}

- (void)unscheduleActivity
{
  v2 = [(NSString *)self->_eventName UTF8String];
  xpc_activity_unregister(v2);
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end