@interface RDLaunchEvents
+ (void)initialize;
- (void)dealloc;
- (void)registerForXPCActivities:(id)a3;
- (void)registerForXPCEvent:(id)a3;
- (void)unregisterForXPCActivities:(id)a3;
@end

@implementation RDLaunchEvents

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10002AA00 = (uint64_t)os_log_create("com.apple.SensorKit", "RDLaunchEvents");
  }
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 24);
    objc_setProperty_nonatomic(self, v3, 0, 32);
    objc_setProperty_nonatomic(self, v4, 0, 16);
  }
  v5.receiver = self;
  v5.super_class = (Class)RDLaunchEvents;
  [(RDLaunchEvents *)&v5 dealloc];
}

- (void)registerForXPCActivities:(id)a3
{
  objc_initWeak(&location, self);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v17;
    *(void *)&long long v5 = 138543362;
    long long v12 = v5;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(a3);
        }
        v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v9 = sub_100006494((uint64_t)self, v8);
        v10 = qword_10002AA00;
        if (v9)
        {
          if (os_log_type_enabled((os_log_t)qword_10002AA00, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v12;
            v22 = v8;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Registering for %{public}@", buf, 0xCu);
          }
          v11 = (const char *)[v8 UTF8String];
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472;
          handler[2] = sub_100006AFC;
          handler[3] = &unk_100024A18;
          objc_copyWeak(&v15, &location);
          handler[4] = v8;
          xpc_activity_register(v11, XPC_ACTIVITY_CHECK_IN, handler);
          objc_destroyWeak(&v15);
        }
        else if (os_log_type_enabled((os_log_t)qword_10002AA00, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v12;
          v22 = v8;
          _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Failed to create an RDXPCActivity named %{public}@", buf, 0xCu);
        }
      }
      id v4 = [a3 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v4);
  }
  objc_destroyWeak(&location);
}

- (void)unregisterForXPCActivities:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v13;
    *(void *)&long long v5 = 138543362;
    long long v11 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v8);
        v10 = qword_10002AA00;
        if (os_log_type_enabled((os_log_t)qword_10002AA00, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v11;
          long long v17 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unregistering for %{public}@", buf, 0xCu);
        }
        xpc_activity_unregister([v9 UTF8String]);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)registerForXPCEvent:(id)a3
{
  id v4 = self;
  objc_initWeak(&location, self);
  long long v5 = (const char *)[a3 UTF8String];
  if (v4) {
    id v4 = (RDLaunchEvents *)v4->_q;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007098;
  v6[3] = &unk_100024A40;
  objc_copyWeak(&v7, &location);
  xpc_set_event_stream_handler(v5, &v4->super, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
}

@end