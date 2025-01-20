@interface MBDaemon
+ (MBDaemon)sharedDaemon;
- (BOOL)_shouldIdleExit;
- (MBDaemon)init;
- (void)_handleSignal:(int)a3;
- (void)_holdWorkAssertionWithDescription:(const char *)a3;
- (void)_releaseWorkAssertionWithDescription:(const char *)a3;
- (void)_resetIdleTimer;
- (void)_scheduleIdleTimer;
- (void)holdWorkAssertion:(SEL)a3;
- (void)holdWorkAssertionWithClass:(Class)a3;
- (void)holdingWorkAssertionWithDescription:(id)a3 forScope:(id)a4;
- (void)reboot:(BOOL)a3;
- (void)releaseWorkAssertion:(SEL)a3;
- (void)releaseWorkAssertionWithClass:(Class)a3;
- (void)resetIdleTimer;
- (void)run;
- (void)setupSignalHandlers;
- (void)shutdown;
@end

@implementation MBDaemon

+ (MBDaemon)sharedDaemon
{
  if (qword_1004825D8 != -1) {
    dispatch_once(&qword_1004825D8, &stru_1004155C8);
  }
  v2 = (void *)qword_1004825D0;
  return (MBDaemon *)v2;
}

- (MBDaemon)init
{
  v9.receiver = self;
  v9.super_class = (Class)MBDaemon;
  v2 = [(MBDaemon *)&v9 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(Name, v5);
    assertionsQueue = v2->_assertionsQueue;
    v2->_assertionsQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)run
{
  id v2 = +[NSRunLoop mainRunLoop];
  [v2 run];
}

- (void)shutdown
{
}

- (void)reboot:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = MKBKeyBagKeyStashCommit();
  if (v4)
  {
    uint64_t v5 = v4;
    dispatch_queue_t v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unable to commit stash bag: %d", buf, 8u);
      uint64_t v14 = v5;
      _MBLog();
    }
  }
  char v15 = 0;
  +[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0, v14);
  unsigned int v7 = [(id)objc_claimAutoreleasedReturnValue() getBooleanValueForKey:@"RestoreShouldReboot" keyExists:&v15];
  if (v15 && !v7)
  {
    v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v17 = @"com.apple.MobileBackup";
      __int16 v18 = 2112;
      CFStringRef v19 = @"RestoreShouldReboot";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not rebooting after restore because %@ %@ preference is set", buf, 0x16u);
      _MBLog();
    }

    _MBLogFlushDeprecated();
    MBLogStashLogs();
    objc_super v9 = dispatch_semaphore_create(0);
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    abort();
  }
  _MBLogFlushDeprecated();
  MBLogStashLogs();
  v10 = MBGetDefaultLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v11) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Doing a full reboot", buf, 2u);
  }
  else
  {
    if (!v11) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Doing a Userspace reboot", buf, 2u);
  }
  _MBLog();
LABEL_16:

  int v12 = reboot3();
  if (v12)
  {
    v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "reboot3 failed: %d", buf, 8u);
      _MBLog();
    }
  }
  exit(v12 != 0);
}

- (void)_handleSignal:(int)a3
{
  if (a3 <= 14)
  {
    if (a3 == 1)
    {
      uint64_t v4 = MBGetDefaultLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SIGHUP", buf, 2u);
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    if (a3 == 3)
    {
      uint64_t v4 = MBGetDefaultLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SIGQUIT", buf, 2u);
        goto LABEL_16;
      }
LABEL_17:

      return;
    }
    goto LABEL_18;
  }
  if (a3 == 15)
  {
    uint64_t v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SIGTERM", buf, 2u);
      _MBLog();
    }

    MBExit(1);
  }
  if (a3 != 30)
  {
    if (a3 == 31)
    {
      uint64_t v4 = MBGetDefaultLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SIGUSR2", buf, 2u);
LABEL_16:
        _MBLog();
        goto LABEL_17;
      }
      goto LABEL_17;
    }
LABEL_18:
    dispatch_queue_t v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unhandled signal %d", buf, 8u);
      _MBLog();
    }
  }
}

- (void)setupSignalHandlers
{
  BOOL v3 = dispatch_get_global_queue(21, 0);
  for (uint64_t i = 0; i != 5; ++i)
  {
    int v5 = dword_1003B362C[i];
    dispatch_queue_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v5, 0, v3);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10019B1CC;
    v9[3] = &unk_1004155F0;
    v9[4] = self;
    int v10 = v5;
    dispatch_source_set_event_handler(v6, v9);
    dispatch_resume(v6);
    unsigned int v7 = (void *)qword_1004825A8[i];
    qword_1004825A8[i] = v6;
    int v8 = v6;

    signal(v5, (void (__cdecl *)(int))1);
  }
}

- (BOOL)_shouldIdleExit
{
  char v7 = 0;
  id v2 = +[MBPersona personalPersonaWithError:0];
  unsigned int v3 = [v2 getBooleanValueForKey:@"BackupShouldIdleExit" keyExists:&v7];
  if (v7) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  BOOL v5 = !v4;

  return v5;
}

- (void)_scheduleIdleTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_assertionsQueue);
  if (MBIsRunningInDaemon())
  {
    idleTimer = self->_idleTimer;
    if (idleTimer)
    {
      dispatch_source_cancel(idleTimer);
      BOOL v4 = self->_idleTimer;
      self->_idleTimer = 0;
    }
    if (qword_1004825E8 != -1) {
      dispatch_once(&qword_1004825E8, &stru_100415610);
    }
    BOOL v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_assertionsQueue);
    dispatch_queue_t v6 = self->_idleTimer;
    self->_idleTimer = v5;

    char v7 = self->_idleTimer;
    dispatch_time_t v8 = dispatch_time(0, 1000000000 * qword_1004825E0);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, self);
    objc_super v9 = self->_idleTimer;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10019B4A4;
    v10[3] = &unk_100413770;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v9, v10);
    dispatch_resume((dispatch_object_t)self->_idleTimer);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_resetIdleTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_assertionsQueue);
  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    dispatch_source_cancel(idleTimer);
    BOOL v4 = self->_idleTimer;
    self->_idleTimer = 0;
  }
  if (!self->_assertions)
  {
    [(MBDaemon *)self _scheduleIdleTimer];
  }
}

- (void)resetIdleTimer
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_assertionsQueue);
  assertionsQueue = self->_assertionsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019B63C;
  block[3] = &unk_100411128;
  block[4] = self;
  dispatch_sync(assertionsQueue, block);
}

- (void)_holdWorkAssertionWithDescription:(const char *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_assertionsQueue);
  ++self->_assertions;
  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    dispatch_source_cancel(idleTimer);
    dispatch_queue_t v6 = self->_idleTimer;
    self->_idleTimer = 0;
  }
  char v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unsigned int assertions = self->_assertions;
    *(_DWORD *)buf = 136315394;
    int v10 = a3;
    __int16 v11 = 1024;
    unsigned int v12 = assertions;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "holdWorkAssertion: %s, %d", buf, 0x12u);
    _MBLog();
  }
}

- (void)holdWorkAssertionWithClass:(Class)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_assertionsQueue);
  assertionsQueue = self->_assertionsQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10019B7D4;
  v6[3] = &unk_100415638;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(assertionsQueue, v6);
}

- (void)holdWorkAssertion:(SEL)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_assertionsQueue);
  assertionsQueue = self->_assertionsQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10019B898;
  v6[3] = &unk_100412A88;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(assertionsQueue, v6);
}

- (void)_releaseWorkAssertionWithDescription:(const char *)a3
{
  unsigned int assertions = self->_assertions;
  if (!assertions)
  {
    if (MBIsInternalInstall())
    {
      objc_super v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v11 = a3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Over-released work assertion: %s", buf, 0xCu);
        _MBLog();
      }
    }
    objc_exception_throw([objc_alloc((Class)MBException) initWithCode:1 format:@"Over-released work assertion"]);
  }
  unsigned int v6 = assertions - 1;
  self->_unsigned int assertions = v6;
  if (!v6) {
    [(MBDaemon *)self _scheduleIdleTimer];
  }
  char v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unsigned int v8 = self->_assertions;
    *(_DWORD *)buf = 136315394;
    __int16 v11 = a3;
    __int16 v12 = 1024;
    unsigned int v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "releaseWorkAssertion: %s, %d", buf, 0x12u);
    _MBLog();
  }
}

- (void)releaseWorkAssertionWithClass:(Class)a3
{
  assertionsQueue = self->_assertionsQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10019BAD4;
  v4[3] = &unk_100415638;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(assertionsQueue, v4);
}

- (void)releaseWorkAssertion:(SEL)a3
{
  assertionsQueue = self->_assertionsQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10019BB84;
  v4[3] = &unk_100412A88;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(assertionsQueue, v4);
}

- (void)holdingWorkAssertionWithDescription:(id)a3 forScope:(id)a4
{
  id v6 = a3;
  char v7 = (void (**)(void))a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_assertionsQueue);
  assertionsQueue = self->_assertionsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019BD2C;
  block[3] = &unk_1004110B0;
  block[4] = self;
  id v9 = v6;
  id v15 = v9;
  dispatch_sync(assertionsQueue, block);
  v7[2](v7);
  int v10 = self->_assertionsQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10019BD6C;
  v12[3] = &unk_1004110B0;
  v12[4] = self;
  id v11 = v9;
  id v13 = v11;
  dispatch_async(v10, v12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_assertionsQueue, 0);
}

@end