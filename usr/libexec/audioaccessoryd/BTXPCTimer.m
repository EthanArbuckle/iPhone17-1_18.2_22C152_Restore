@interface BTXPCTimer
- (BOOL)isActive;
- (BTXPCTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8;
- (BTXPCTimer)initWithName:(id)a3 date:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7;
- (BTXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8;
- (BTXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7;
- (NSDate)date;
- (NSString)name;
- (OS_xpc_object)activity;
- (OS_xpc_object)duetActivitySchedulerData;
- (double)gracePeriod;
- (id)activityHandler;
- (id)block;
- (id)criteria;
- (int64_t)priority;
- (unint64_t)options;
- (void)handleActivity;
- (void)invalidate;
- (void)setActivity:(id)a3;
- (void)setBlock:(id)a3;
- (void)setDate:(id)a3;
- (void)setDuetActivitySchedulerData:(id)a3;
- (void)setGracePeriod:(double)a3;
- (void)setName:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation BTXPCTimer

- (BTXPCTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)BTXPCTimer;
  v17 = [(BTXPCTimer *)&v20 init];
  v18 = v17;
  if (v17)
  {
    [(BTXPCTimer *)v17 setName:v14];
    [(BTXPCTimer *)v18 setDate:v15];
    [(BTXPCTimer *)v18 setGracePeriod:a5];
    [(BTXPCTimer *)v18 setPriority:a6];
    [(BTXPCTimer *)v18 setOptions:a7];
    [(BTXPCTimer *)v18 setBlock:v16];
    [(BTXPCTimer *)v18 handleActivity];
  }

  return v18;
}

- (BTXPCTimer)initWithName:(id)a3 date:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7
{
  return [(BTXPCTimer *)self initWithName:a3 date:a4 gracePeriod:a5 priority:a6 options:a7 block:0.0];
}

- (BTXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8
{
  id v14 = a8;
  id v15 = a3;
  id v16 = +[NSDate dateWithTimeIntervalSinceNow:a4];
  v17 = [(BTXPCTimer *)self initWithName:v15 date:v16 gracePeriod:a6 priority:a7 options:v14 block:a5];

  return v17;
}

- (BTXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7
{
  id v12 = a7;
  id v13 = a3;
  id v14 = +[NSDate dateWithTimeIntervalSinceNow:a4];
  id v15 = [(BTXPCTimer *)self initWithName:v13 date:v14 gracePeriod:a5 priority:a6 options:v12 block:0.0];

  return v15;
}

- (id)criteria
{
  v3 = [(BTXPCTimer *)self date];
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  double v6 = 0.0;
  if (v5 >= 0.0) {
    double v6 = v5;
  }
  int64_t v7 = (uint64_t)v6;
  [(BTXPCTimer *)self gracePeriod];
  int64_t v9 = (uint64_t)v8;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_int64(v10, XPC_ACTIVITY_DELAY, v7);
  xpc_dictionary_set_int64(v10, XPC_ACTIVITY_GRACE_PERIOD, v9);
  int64_t v11 = [(BTXPCTimer *)self priority];
  id v12 = (const char **)&XPC_ACTIVITY_PRIORITY_UTILITY;
  if (v11 != 1) {
    id v12 = (const char **)&XPC_ACTIVITY_PRIORITY_MAINTENANCE;
  }
  xpc_dictionary_set_string(v10, XPC_ACTIVITY_PRIORITY, *v12);
  unsigned __int8 v13 = [(BTXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_POWER_NAP, v13 & 1);
  unsigned __int8 v14 = [(BTXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY, (v14 & 4) != 0);
  unsigned __int8 v15 = [(BTXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, (v15 & 2) != 0);
  unsigned __int8 v16 = [(BTXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_USES_DUET_POWER_BUDGETING, (v16 & 8) != 0);
  if (([(BTXPCTimer *)self options] & 0x10) != 0)
  {
    v17 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_A;
  }
  else if (([(BTXPCTimer *)self options] & 0x20) != 0)
  {
    v17 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_B;
  }
  else
  {
    if (([(BTXPCTimer *)self options] & 0x40) == 0) {
      goto LABEL_13;
    }
    v17 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_C;
  }
  if (*v17) {
    xpc_dictionary_set_BOOL(v10, *v17, 1);
  }
LABEL_13:
  unsigned __int8 v18 = [(BTXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, (v18 & 0x80) != 0);
  unint64_t v19 = [(BTXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, v19 & 0x100);
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_ALLOW_BATTERY, ([(BTXPCTimer *)self options] & 0x200) != 0);
  unsigned __int16 v20 = (unsigned __int16)[(BTXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_MEMORY_INTENSIVE, (v20 & 0x400) != 0);
  unsigned __int16 v21 = (unsigned __int16)[(BTXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_CPU_INTENSIVE, (v21 & 0x800) != 0);
  unsigned __int16 v22 = (unsigned __int16)[(BTXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_DISK_INTENSIVE, (v22 & 0x1000) != 0);
  v23 = [(BTXPCTimer *)self duetActivitySchedulerData];
  if (v23) {
    xpc_dictionary_set_value(v10, XPC_ACTIVITY_DUET_ACTIVITY_SCHEDULER_DATA, v23);
  }

  return v10;
}

- (void)invalidate
{
  id v3 = [(BTXPCTimer *)self name];
  double v4 = (const char *)[v3 UTF8String];

  double v5 = sub_10006CA04("BTXPCTimer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    unsigned __int8 v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BTXPCTimer Unregistering XPC activity %s", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v6 = [(BTXPCTimer *)self activity];
  if (v6)
  {
    int64_t v7 = (void *)v6;
    double v8 = [(BTXPCTimer *)self activity];
    BOOL v9 = xpc_activity_set_state(v8, 5);

    if (v9)
    {
      xpc_object_t v10 = sub_10006CA04("BTXPCTimer");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315138;
        unsigned __int8 v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BTXPCTimer XPC activity marked DONE for %s", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  xpc_activity_unregister(v4);
  int64_t v11 = [(BTXPCTimer *)self block];

  if (v11) {
    [(BTXPCTimer *)self setBlock:0];
  }
  id v12 = [(BTXPCTimer *)self activity];

  if (v12) {
    [(BTXPCTimer *)self setActivity:0];
  }
}

- (id)activityHandler
{
  id v3 = [(BTXPCTimer *)self criteria];
  double v4 = [(BTXPCTimer *)self name];
  double v5 = [(BTXPCTimer *)self date];
  [v5 timeIntervalSinceNow];
  double v7 = v6;

  double v8 = sub_10006CA04("BTXPCTimer");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 < 0.0) {
      double v7 = 0.0;
    }
    BOOL v9 = [(BTXPCTimer *)self name];
    [(BTXPCTimer *)self gracePeriod];
    *(_DWORD *)buf = 138412802;
    v23 = v9;
    __int16 v24 = 2048;
    uint64_t v25 = (uint64_t)v7;
    __int16 v26 = 2048;
    uint64_t v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "BTXPCTimer: Scheduling XPC activity (%@) in %lld ~%lf grace.", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  int64_t v11 = [(BTXPCTimer *)self block];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10006BF50;
  v17[3] = &unk_100234B18;
  objc_copyWeak(&v21, (id *)buf);
  id v18 = v4;
  id v19 = v3;
  id v20 = v11;
  id v12 = v11;
  id v13 = v3;
  id v14 = v4;
  unsigned __int8 v15 = objc_retainBlock(v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

  return v15;
}

- (BOOL)isActive
{
  id v3 = [(BTXPCTimer *)self activity];

  if (!v3) {
    return 0;
  }
  double v4 = [(BTXPCTimer *)self activity];
  xpc_activity_state_t state = xpc_activity_get_state(v4);

  double v6 = sub_10006CA04("BTXPCTimer");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = [(BTXPCTimer *)self name];
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2048;
    xpc_activity_state_t v12 = state;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BTXPCTimer %@ current state %ld", (uint8_t *)&v9, 0x16u);
  }
  return state != 5;
}

- (void)handleActivity
{
  id v5 = [(BTXPCTimer *)self name];
  id v3 = (const char *)[v5 UTF8String];
  double v4 = [(BTXPCTimer *)self activityHandler];
  xpc_activity_register(v3, XPC_ACTIVITY_CHECK_IN, v4);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (double)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(double)a3
{
  self->_gracePeriod = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (OS_xpc_object)duetActivitySchedulerData
{
  return self->_duetActivitySchedulerData;
}

- (void)setDuetActivitySchedulerData:(id)a3
{
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_duetActivitySchedulerData, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end