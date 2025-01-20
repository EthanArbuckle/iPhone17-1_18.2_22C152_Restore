@interface CLFenceBackgroundActivityScheduler
- (CLFenceBackgroundActivityScheduler)init;
- (CLFenceBackgroundActivityScheduler)initWithQueue:(id)a3;
- (id)registeredBlock;
- (void)dealloc;
- (void)handleBackgroundTask:(id)a3;
- (void)registerDailyBlock:(id)a3;
- (void)scheduleBackgroundTask;
- (void)setRegisteredBlock:(id)a3;
@end

@implementation CLFenceBackgroundActivityScheduler

- (CLFenceBackgroundActivityScheduler)init
{
  return 0;
}

- (CLFenceBackgroundActivityScheduler)initWithQueue:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLFenceBackgroundActivityScheduler;
  v4 = [(CLFenceBackgroundActivityScheduler *)&v6 init];
  if (v4)
  {
    v4->_queue = (OS_dispatch_queue *)a3;
    [(CLFenceBackgroundActivityScheduler *)v4 scheduleBackgroundTask];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLFenceBackgroundActivityScheduler;
  [(CLFenceBackgroundActivityScheduler *)&v3 dealloc];
}

- (void)registerDailyBlock:(id)a3
{
  if (qword_1024193C0 != -1) {
    dispatch_once(&qword_1024193C0, &stru_1022E8D70);
  }
  v5 = qword_1024193C8;
  if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#BackgroundTask registering daily block", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193C0 != -1) {
      dispatch_once(&qword_1024193C0, &stru_1022E8D70);
    }
    objc_super v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFenceBackgroundActivityScheduler registerDailyBlock:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  [(CLFenceBackgroundActivityScheduler *)self setRegisteredBlock:a3];
}

- (void)scheduleBackgroundTask
{
  if (objc_opt_class())
  {
    id v3 = +[BGSystemTaskScheduler sharedScheduler];
    queue = self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100B8EBD4;
    v13[3] = &unk_1022E8D50;
    v13[4] = self;
    [v3 registerForTaskWithIdentifier:@"com.apple.locationd.fence.daily" usingQueue:queue launchHandler:v13];
    if (objc_msgSend(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"), "taskRequestForIdentifier:", @"com.apple.locationd.fence.daily"))
    {
      if (qword_1024193C0 != -1) {
        dispatch_once(&qword_1024193C0, &stru_1022E8D70);
      }
      v5 = qword_1024193C8;
      if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#BackgroundTask request already exists", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193C0 != -1) {
          dispatch_once(&qword_1024193C0, &stru_1022E8D70);
        }
        LOWORD(v14) = 0;
LABEL_28:
        v10 = (uint8_t *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFenceBackgroundActivityScheduler scheduleBackgroundTask]", "%s\n");
LABEL_29:
        if (v10 != buf) {
          free(v10);
        }
      }
    }
    else
    {
      id v7 = [objc_alloc((Class)BGRepeatingSystemTaskRequest) initWithIdentifier:@"com.apple.locationd.fence.daily"];
      [v7 setRequiresNetworkConnectivity:0];
      [v7 setRequiresExternalPower:0];
      [v7 setInterval:86400.0];
      [v7 interval];
      [v7 setMinDurationBetweenInstances:v8 * 0.8];
      v12 = 0;
      if (objc_msgSend(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"), "submitTaskRequest:error:", v7, &v12))
      {
        if (qword_1024193C0 != -1) {
          dispatch_once(&qword_1024193C0, &stru_1022E8D70);
        }
        v9 = qword_1024193C8;
        if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v17 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#BackgroundTask successfully scheduled task, %@", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024193C0 != -1) {
            dispatch_once(&qword_1024193C0, &stru_1022E8D70);
          }
          int v14 = 138412290;
          id v15 = v7;
          goto LABEL_28;
        }
      }
      else
      {
        if (qword_1024193C0 != -1) {
          dispatch_once(&qword_1024193C0, &stru_1022E8D70);
        }
        v11 = qword_1024193C8;
        if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v17 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#BackgroundTask failed to schedule, error, %@", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024193C0 != -1) {
            dispatch_once(&qword_1024193C0, &stru_1022E8D70);
          }
          int v14 = 138412290;
          id v15 = v12;
          v10 = (uint8_t *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLFenceBackgroundActivityScheduler scheduleBackgroundTask]", "%s\n");
          goto LABEL_29;
        }
      }
    }
  }
  else
  {
    if (qword_1024193C0 != -1) {
      dispatch_once(&qword_1024193C0, &stru_1022E8D70);
    }
    objc_super v6 = qword_1024193C8;
    if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#BackgroundTask BGSystemTaskScheduler not available", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193C0 != -1) {
        dispatch_once(&qword_1024193C0, &stru_1022E8D70);
      }
      LOWORD(v14) = 0;
      goto LABEL_28;
    }
  }
}

- (void)handleBackgroundTask:(id)a3
{
  if (qword_1024193C0 != -1) {
    dispatch_once(&qword_1024193C0, &stru_1022E8D70);
  }
  v5 = qword_1024193C8;
  if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#BackgroundTask fired", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193C0 != -1) {
      dispatch_once(&qword_1024193C0, &stru_1022E8D70);
    }
    double v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFenceBackgroundActivityScheduler handleBackgroundTask:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  if ([(CLFenceBackgroundActivityScheduler *)self registeredBlock])
  {
    if (qword_1024193C0 != -1) {
      dispatch_once(&qword_1024193C0, &stru_1022E8D70);
    }
    objc_super v6 = qword_1024193C8;
    if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#BackgroundTask invoking registered block", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193C0 != -1) {
        dispatch_once(&qword_1024193C0, &stru_1022E8D70);
      }
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFenceBackgroundActivityScheduler handleBackgroundTask:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    (*((void (**)(void))[(CLFenceBackgroundActivityScheduler *)self registeredBlock] + 2))();
  }
  else
  {
    if (qword_1024193C0 != -1) {
      dispatch_once(&qword_1024193C0, &stru_1022E8D70);
    }
    id v7 = qword_1024193C8;
    if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "#BackgroundTask no registered block to invoke", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193C0 != -1) {
        dispatch_once(&qword_1024193C0, &stru_1022E8D70);
      }
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLFenceBackgroundActivityScheduler handleBackgroundTask:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
  }
  [a3 setTaskCompleted];
}

- (id)registeredBlock
{
  return self->_registeredBlock;
}

- (void)setRegisteredBlock:(id)a3
{
}

@end