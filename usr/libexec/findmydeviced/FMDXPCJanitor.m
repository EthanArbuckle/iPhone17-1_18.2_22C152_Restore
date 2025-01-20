@interface FMDXPCJanitor
- (FMDXPCJanitor)initWithName:(id)a3 gracePeriod:(double)a4 cleanupTask:(id)a5;
- (NSString)name;
- (double)gracePeriod;
- (id)activityHandler;
- (id)cleanupTask;
- (void)deactivate;
- (void)handleActivity;
- (void)performWork;
- (void)schedule:(id)a3;
- (void)schedule:(id)a3 requireClass:(unint64_t)a4;
- (void)setCleanupTask:(id)a3;
- (void)setGracePeriod:(double)a3;
- (void)setName:(id)a3;
@end

@implementation FMDXPCJanitor

- (FMDXPCJanitor)initWithName:(id)a3 gracePeriod:(double)a4 cleanupTask:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)FMDXPCJanitor;
  v10 = [(FMDXPCJanitor *)&v13 init];
  if (v10)
  {
    v11 = [@"com.apple.icloud.findmydeviced.fmdxpcjanitor." stringByAppendingString:v8];
    [(FMDXPCJanitor *)v10 setName:v11];

    [(FMDXPCJanitor *)v10 setGracePeriod:a4];
    [(FMDXPCJanitor *)v10 setCleanupTask:v9];
    [(FMDXPCJanitor *)v10 handleActivity];
  }

  return v10;
}

- (void)schedule:(id)a3
{
}

- (void)schedule:(id)a3 requireClass:(unint64_t)a4
{
  id v6 = a3;
  [(FMDXPCJanitor *)self gracePeriod];
  v7 = [v6 dateByAddingTimeInterval:x0];

  [v7 timeIntervalSinceNow];
  int64_t v9 = (uint64_t)v8;

  [(FMDXPCJanitor *)self gracePeriod];
  int64_t v11 = (uint64_t)v10;
  v12 = sub_100004238();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134217984;
    int64_t v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMDXPCJanitor: Scheduling cleanup XPC activity in %lld", (uint8_t *)&v18, 0xCu);
  }

  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v13, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_POWER_NAP, 1);
  xpc_dictionary_set_int64(v13, XPC_ACTIVITY_DELAY, v9);
  xpc_dictionary_set_int64(v13, XPC_ACTIVITY_GRACE_PERIOD, v11);
  id v14 = [(FMDXPCJanitor *)self name];
  v15 = (const char *)[v14 cStringUsingEncoding:4];

  if (a4)
  {
    v16 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_A;
    if (a4 != 1) {
      v16 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_C;
    }
    xpc_dictionary_set_BOOL(v13, *v16, 1);
  }
  v17 = [(FMDXPCJanitor *)self activityHandler];
  xpc_activity_register(v15, v13, v17);
}

- (void)deactivate
{
  v3 = [(FMDXPCJanitor *)self name];

  v4 = sub_100004238();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v6 = [(FMDXPCJanitor *)self name];
      int v9 = 138412290;
      double v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDXPCJanitor Unregistering XPC activity %@", (uint8_t *)&v9, 0xCu);
    }
    id v7 = [(FMDXPCJanitor *)self name];
    double v8 = (const char *)[v7 cStringUsingEncoding:4];

    xpc_activity_unregister(v8);
  }
  else
  {
    if (v5)
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cannot unregister unnamed XPC activity", (uint8_t *)&v9, 2u);
    }
  }
}

- (id)activityHandler
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100090284;
  v4[3] = &unk_1002DC188;
  v4[4] = self;
  v2 = objc_retainBlock(v4);

  return v2;
}

- (void)handleActivity
{
  id v3 = [(FMDXPCJanitor *)self name];
  v4 = (const char *)[v3 cStringUsingEncoding:4];

  id v5 = [(FMDXPCJanitor *)self activityHandler];
  xpc_activity_register(v4, XPC_ACTIVITY_CHECK_IN, v5);
}

- (void)performWork
{
  id v3 = [(FMDXPCJanitor *)self cleanupTask];

  if (v3)
  {
    id v5 = [(FMDXPCJanitor *)self cleanupTask];
    v5[2]();
  }
  else
  {
    v4 = sub_100004238();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDXPCJanitor initialized without cleanupTask. No work to do.", buf, 2u);
    }
  }
}

- (double)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(double)a3
{
  self->_gracePeriod = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (id)cleanupTask
{
  return self->_cleanupTask;
}

- (void)setCleanupTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cleanupTask, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end