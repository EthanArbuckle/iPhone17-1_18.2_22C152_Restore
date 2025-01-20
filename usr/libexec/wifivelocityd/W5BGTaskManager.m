@interface W5BGTaskManager
- (BGSystemTaskScheduler)scheduler;
- (BOOL)scheduleRepeatingTask:(id)a3 interval:(double)a4 repeatingTask:(id)a5;
- (NSMutableArray)registeredIdentifiers;
- (W5BGTaskManager)init;
- (void)dealloc;
- (void)setRegisteredIdentifiers:(id)a3;
- (void)setScheduler:(id)a3;
- (void)stopAllRepeatingTasks;
@end

@implementation W5BGTaskManager

- (W5BGTaskManager)init
{
  self->_scheduler = 0;
  v4.receiver = self;
  v4.super_class = (Class)W5BGTaskManager;
  v2 = [(W5BGTaskManager *)&v4 init];
  if (v2)
  {
    if (objc_opt_class()) {
      v2->_scheduler = (BGSystemTaskScheduler *)+[BGSystemTaskScheduler sharedScheduler];
    }
    else {
      return 0;
    }
  }
  return v2;
}

- (BOOL)scheduleRepeatingTask:(id)a3 interval:(double)a4 repeatingTask:(id)a5
{
  if (-[NSMutableArray containsObject:](self->_registeredIdentifiers, "containsObject:"))
  {
    v9 = sub_10009756C();
    unsigned __int8 v10 = 0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315906;
      v23 = "-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:]";
      __int16 v24 = 2080;
      v25 = "W5BGTaskManager.m";
      __int16 v26 = 1024;
      int v27 = 39;
      __int16 v28 = 2114;
      id v29 = a3;
LABEL_9:
      _os_log_send_and_compose_impl();
      return 0;
    }
  }
  else
  {
    scheduler = self->_scheduler;
    if (!scheduler) {
      return 0;
    }
    if (([(BGSystemTaskScheduler *)scheduler registerForTaskWithIdentifier:a3 usingQueue:0 launchHandler:a5] & 1) == 0)
    {
      v18 = sub_10009756C();
      unsigned __int8 v10 = 0;
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        return v10;
      }
      int v22 = 136315906;
      v23 = "-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:]";
      __int16 v24 = 2080;
      v25 = "W5BGTaskManager.m";
      __int16 v26 = 1024;
      int v27 = 49;
      __int16 v28 = 2114;
      id v29 = a3;
      goto LABEL_9;
    }
    if ([(BGSystemTaskScheduler *)self->_scheduler taskRequestForIdentifier:a3])
    {
      v12 = sub_10009756C();
      unsigned __int8 v10 = 0;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315906;
        v23 = "-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:]";
        __int16 v24 = 2080;
        v25 = "W5BGTaskManager.m";
        __int16 v26 = 1024;
        int v27 = 52;
        __int16 v28 = 2114;
        id v29 = a3;
        goto LABEL_9;
      }
    }
    else
    {
      id v14 = [objc_alloc((Class)BGRepeatingSystemTaskRequest) initWithIdentifier:a3];
      [v14 setRequiresNetworkConnectivity:0];
      [v14 setRequiresExternalPower:0];
      [v14 setInterval:a4];
      [v14 setMinDurationBetweenInstances:a4];
      [v14 setShouldWakeDevice:0];
      CFStringRef v21 = 0;
      unsigned __int8 v10 = [[+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler") submitTaskRequest:v14 error:&v21];
      v15 = sub_10009756C();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v16)
        {
          int v22 = 136315906;
          v23 = "-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:]";
          __int16 v24 = 2080;
          v25 = "W5BGTaskManager.m";
          __int16 v26 = 1024;
          int v27 = 69;
          __int16 v28 = 2114;
          id v29 = a3;
          LODWORD(v20) = 38;
          v19 = &v22;
          _os_log_send_and_compose_impl();
        }
        -[NSMutableArray addObject:](self->_registeredIdentifiers, "addObject:", a3, v19, v20);
      }
      else if (v16)
      {
        CFStringRef v17 = v21;
        if (!v21) {
          CFStringRef v17 = @"Unknown";
        }
        int v22 = 136315906;
        v23 = "-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:]";
        __int16 v24 = 2080;
        v25 = "W5BGTaskManager.m";
        __int16 v26 = 1024;
        int v27 = 65;
        __int16 v28 = 2114;
        id v29 = (id)v17;
        _os_log_send_and_compose_impl();
      }
    }
  }
  return v10;
}

- (void)stopAllRepeatingTasks
{
  if (self->_scheduler)
  {
    v3 = (char *)[(NSMutableArray *)self->_registeredIdentifiers count];
    objc_super v4 = sub_10009756C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315906;
      v11 = "-[W5BGTaskManager stopAllRepeatingTasks]";
      __int16 v12 = 2080;
      v13 = "W5BGTaskManager.m";
      __int16 v14 = 1024;
      int v15 = 87;
      __int16 v16 = 2048;
      CFStringRef v17 = v3;
      LODWORD(v9) = 38;
      v8 = &v10;
      _os_log_send_and_compose_impl();
    }
    if (v3)
    {
      for (i = 0; i != v3; ++i)
      {
        v6 = (char *)-[NSMutableArray objectAtIndex:](self->_registeredIdentifiers, "objectAtIndex:", i, v8, v9);
        if ([(BGSystemTaskScheduler *)self->_scheduler deregisterTaskWithIdentifier:v6])
        {
          v7 = sub_10009756C();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            int v10 = 136315906;
            v11 = "-[W5BGTaskManager stopAllRepeatingTasks]";
            __int16 v12 = 2080;
            v13 = "W5BGTaskManager.m";
            __int16 v14 = 1024;
            int v15 = 94;
            __int16 v16 = 2114;
            CFStringRef v17 = v6;
            LODWORD(v9) = 38;
            v8 = &v10;
            _os_log_send_and_compose_impl();
          }
          -[NSMutableArray removeObjectAtIndex:](self->_registeredIdentifiers, "removeObjectAtIndex:", i, v8, v9);
        }
      }
    }
  }
}

- (void)dealloc
{
  scheduler = self->_scheduler;
  if (scheduler) {

  }
  registeredIdentifiers = self->_registeredIdentifiers;
  if (registeredIdentifiers) {

  }
  v5.receiver = self;
  v5.super_class = (Class)W5BGTaskManager;
  [(W5BGTaskManager *)&v5 dealloc];
}

- (BGSystemTaskScheduler)scheduler
{
  return (BGSystemTaskScheduler *)objc_getProperty(self, a2, 8, 1);
}

- (void)setScheduler:(id)a3
{
}

- (NSMutableArray)registeredIdentifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRegisteredIdentifiers:(id)a3
{
}

@end