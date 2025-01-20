@interface UpgradeSequencer
+ (id)getSharedInstance;
- (BOOL)_isInterfaceLocked;
- (BOOL)lockIsHeldByClient:(_rpc_cred *)a3;
- (NSMutableDictionary)upgradesUnderway;
- (OS_dispatch_queue)lockAcquireQueue;
- (OS_dispatch_queue)registrationQueue;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)lockTimer;
- (OS_os_log)logHandle;
- (UpgradeClient)lockingClient;
- (UpgradeSequencer)init;
- (id)_abort;
- (id)_completeUpgradeSession;
- (id)_completeUpgradeWithError:(id)a3;
- (id)_timeout;
- (id)_unlockInterface;
- (id)sessionCompleteCallback;
- (int)_setKernelUpgradeOngoing:(BOOL)a3;
- (void)_disableInterfaceLockTimeout;
- (void)_handleInterfaceLockCancel;
- (void)_restartInterfaceLockTimeout;
- (void)_startUpgradeForCryptex:(id)a3 withGraftPath:(id)a4 killingJobs:(BOOL)a5 withCompletion:(id)a6;
- (void)abortWithCompletion:(id)a3;
- (void)completeUpgradeWithCompletion:(id)a3;
- (void)lockInterfaceForClient:(id)a3 withCompletion:(id)a4;
- (void)onUpgradeCompleteForCryptex:(id)a3 withCompletion:(id)a4;
- (void)onUpgradeSessionComplete:(id)a3;
- (void)setLockTimer:(id)a3;
- (void)setLockingClient:(id)a3;
- (void)setSessionCompleteCallback:(id)a3;
- (void)startUpgradeForCryptexes:(id)a3 killingJobs:(BOOL)a4 withCompletion:(id)a5;
@end

@implementation UpgradeSequencer

+ (id)getSharedInstance
{
  if (qword_10005E3D0 != -1) {
    dispatch_once(&qword_10005E3D0, &stru_100059188);
  }
  v2 = (void *)qword_10005E3D8;

  return v2;
}

- (UpgradeSequencer)init
{
  v22.receiver = self;
  v22.super_class = (Class)UpgradeSequencer;
  id v2 = [(UpgradeSequencer *)&v22 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_initially_inactive(0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.security.cryptexd.upgrade_sequencer_registration", v3);

    v5 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v4;

    dispatch_set_qos_class();
    dispatch_activate(*((dispatch_object_t *)v2 + 3));
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.security.cryptexd.upgrade_sequencer_work", 0);
    v7 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v6;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 2), *((dispatch_queue_t *)v2 + 3));
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.security.cryptexd.upgrade_sequencer_lock_acquire", 0);
    v9 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v8;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 1), *((dispatch_queue_t *)v2 + 2));
    dispatch_suspend(*((dispatch_object_t *)v2 + 1));
    dispatch_source_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v2 + 2));
    v11 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v10;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 8), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v12 = *((void *)v2 + 8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100004418;
    handler[3] = &unk_1000590F8;
    v13 = v2;
    id v21 = v13;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 8));
    v14 = (void *)v13[6];
    v13[6] = 0;

    id v15 = objc_alloc_init((Class)NSMutableDictionary);
    v16 = (void *)v13[4];
    v13[4] = v15;

    os_log_t v17 = os_log_create("com.apple.libcryptex", "upgrade_sequencer");
    v18 = (void *)v13[5];
    v13[5] = v17;
  }
  return (UpgradeSequencer *)v2;
}

- (void)startUpgradeForCryptexes:(id)a3 killingJobs:(BOOL)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_source_t v10 = [(UpgradeSequencer *)self workQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004624;
  v13[3] = &unk_100059250;
  id v14 = v8;
  id v15 = v9;
  v13[4] = self;
  BOOL v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

- (void)completeUpgradeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(UpgradeSequencer *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005380;
  v7[3] = &unk_100059278;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)onUpgradeCompleteForCryptex:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UpgradeSequencer *)self workQueue];
  dispatch_suspend(v8);

  id v9 = [(UpgradeSequencer *)self registrationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000054D4;
  block[3] = &unk_1000592A0;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)onUpgradeSessionComplete:(id)a3
{
  id v4 = a3;
  v5 = [(UpgradeSequencer *)self workQueue];
  dispatch_suspend(v5);

  id v6 = [(UpgradeSequencer *)self registrationQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005778;
  v8[3] = &unk_100059278;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)lockInterfaceForClient:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UpgradeSequencer *)self lockAcquireQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000058A8;
  block[3] = &unk_1000592A0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (BOOL)lockIsHeldByClient:(_rpc_cred *)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v5 = [(UpgradeSequencer *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000061E0;
  block[3] = &unk_1000592C8;
  block[4] = self;
  void block[5] = &v8;
  block[6] = a3;
  dispatch_sync(v5, block);

  LOBYTE(a3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

- (void)abortWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(UpgradeSequencer *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006320;
  v7[3] = &unk_100059278;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)_isInterfaceLocked
{
  id v2 = self;
  v3 = [(UpgradeSequencer *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(UpgradeSequencer *)v2 lockingClient];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (int)_setKernelUpgradeOngoing:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UpgradeSequencer *)self workQueue];
  dispatch_assert_queue_V2(v4);

  return sub_100039854(v3);
}

- (id)_completeUpgradeSession
{
  BOOL v3 = [(UpgradeSequencer *)self workQueue];
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = [(UpgradeSequencer *)self _setKernelUpgradeOngoing:0];
  if (v4)
  {
    signed int v5 = v4;
    id v6 = [(UpgradeSequencer *)self logHandle];

    if (v6)
    {
      id v7 = [(UpgradeSequencer *)self logHandle];
      os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      id v8 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      id v8 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v13 = sub_10000BF78("-[UpgradeSequencer _completeUpgradeSession]", "upgrade_sequencer.m", 611, "com.apple.security.cryptex.posix", v5, 0, v8);
    free(v8);
  }
  else
  {
    id v9 = [(UpgradeSequencer *)self _unlockInterface];
    if (v9)
    {
      uint64_t v10 = [(UpgradeSequencer *)self logHandle];

      if (v10)
      {
        char v11 = [(UpgradeSequencer *)self logHandle];
        os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
        id v12 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        id v12 = (char *)_os_log_send_and_compose_impl();
      }
      CFErrorRef v13 = sub_10000BF78("-[UpgradeSequencer _completeUpgradeSession]", "upgrade_sequencer.m", 620, "com.apple.security.cryptex.posix", 26, v9, v12);
      free(v12);
    }
    else
    {
      CFErrorRef v13 = 0;
    }
  }

  return v13;
}

- (void)_handleInterfaceLockCancel
{
  signed int v5 = [(UpgradeSequencer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(UpgradeSequencer *)self lockingClient];

  if (v6)
  {
    buffer[0] = *(_OWORD *)"unknown";
    buffer[1] = *(_OWORD *)&qword_1000485C8;
    id v7 = [(UpgradeSequencer *)self lockingClient];
    id v8 = [v7 conn];
    pid_t pid = xpc_connection_get_pid(v8);
    proc_name(pid, buffer, 0x20u);

    int v10 = *__error();
    char v11 = [(UpgradeSequencer *)self logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = [(UpgradeSequencer *)self lockingClient];
      CFErrorRef v13 = [v12 conn];
      if (v13)
      {
        id v2 = [(UpgradeSequencer *)self lockingClient];
        BOOL v3 = [v2 conn];
        pid_t v14 = xpc_connection_get_pid(v3);
      }
      else
      {
        pid_t v14 = -1;
      }
      int v19 = 136315394;
      v20 = buffer;
      __int16 v21 = 1024;
      pid_t v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "XPC client <process=%s pid=%d>: Client disconnected.", (uint8_t *)&v19, 0x12u);
      if (v13)
      {
      }
    }

    *__error() = v10;
    id v15 = [(UpgradeSequencer *)self _abort];
    if (v15)
    {
      int v16 = *__error();
      os_log_t v17 = [(UpgradeSequencer *)self logHandle];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buffer[0]) = 138412290;
        *(void *)((char *)buffer + 4) = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to abort upgrade.: %@", (uint8_t *)buffer, 0xCu);
      }

      *__error() = v16;
    }
    id v18 = [(UpgradeSequencer *)self _unlockInterface];
  }
}

- (id)_unlockInterface
{
  BOOL v3 = [(UpgradeSequencer *)self workQueue];
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = [(UpgradeSequencer *)self lockingClient];

  if (v4)
  {
    [(UpgradeSequencer *)self _disableInterfaceLockTimeout];
    [(UpgradeSequencer *)self setLockingClient:0];
  }
  return 0;
}

- (void)_disableInterfaceLockTimeout
{
  signed int v5 = [(UpgradeSequencer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  buffer[0] = *(_OWORD *)"unknown";
  buffer[1] = *(_OWORD *)&qword_1000485C8;
  id v6 = [(UpgradeSequencer *)self lockingClient];
  id v7 = [v6 conn];
  pid_t pid = xpc_connection_get_pid(v7);
  proc_name(pid, buffer, 0x20u);

  int v9 = *__error();
  int v10 = [(UpgradeSequencer *)self logHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    char v11 = [(UpgradeSequencer *)self lockingClient];
    id v12 = [v11 conn];
    if (v12)
    {
      id v2 = [(UpgradeSequencer *)self lockingClient];
      BOOL v3 = [v2 conn];
      pid_t v13 = xpc_connection_get_pid(v3);
    }
    else
    {
      pid_t v13 = -1;
    }
    int v15 = 136315394;
    int v16 = buffer;
    __int16 v17 = 1024;
    pid_t v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "XPC client <process=%s pid=%d>: Suspending upgrade lock timeout.", (uint8_t *)&v15, 0x12u);
    if (v12)
    {
    }
  }

  *__error() = v9;
  pid_t v14 = [(UpgradeSequencer *)self lockTimer];
  dispatch_source_set_timer(v14, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)_restartInterfaceLockTimeout
{
  signed int v5 = [(UpgradeSequencer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  buffer[0] = *(_OWORD *)"unknown";
  buffer[1] = *(_OWORD *)&qword_1000485C8;
  id v6 = [(UpgradeSequencer *)self lockingClient];
  id v7 = [v6 conn];
  pid_t pid = xpc_connection_get_pid(v7);
  proc_name(pid, buffer, 0x20u);

  int v9 = *__error();
  int v10 = [(UpgradeSequencer *)self logHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    char v11 = [(UpgradeSequencer *)self lockingClient];
    id v12 = [v11 conn];
    if (v12)
    {
      id v2 = [(UpgradeSequencer *)self lockingClient];
      BOOL v3 = [v2 conn];
      pid_t v13 = xpc_connection_get_pid(v3);
    }
    else
    {
      pid_t v13 = -1;
    }
    int v16 = 136315650;
    __int16 v17 = buffer;
    __int16 v18 = 1024;
    pid_t v19 = v13;
    __int16 v20 = 1024;
    int v21 = 10;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "XPC client <process=%s pid=%d>: Giving client another %d seconds to hold lock.", (uint8_t *)&v16, 0x18u);
    if (v12)
    {
    }
  }

  *__error() = v9;
  pid_t v14 = [(UpgradeSequencer *)self lockTimer];
  dispatch_time_t v15 = dispatch_walltime(0, 10000000000);
  dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (id)_timeout
{
  id v6 = [(UpgradeSequencer *)self workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(UpgradeSequencer *)self lockingClient];

  if (v7)
  {
    buffer[0] = *(_OWORD *)"unknown";
    buffer[1] = *(_OWORD *)&qword_1000485C8;
    id v8 = [(UpgradeSequencer *)self lockingClient];
    int v9 = [v8 conn];
    pid_t pid = xpc_connection_get_pid(v9);
    proc_name(pid, buffer, 0x20u);

    char v11 = [(UpgradeSequencer *)self logHandle];

    if (v11)
    {
      id v12 = [(UpgradeSequencer *)self logHandle];
      os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      pid_t v13 = [(UpgradeSequencer *)self lockingClient];
      pid_t v14 = [v13 conn];
      if (v14)
      {
        BOOL v3 = [(UpgradeSequencer *)self lockingClient];
        unsigned int v4 = [v3 conn];
        pid_t v15 = xpc_connection_get_pid(v4);
      }
      else
      {
        pid_t v15 = -1;
      }
      int v24 = 136315650;
      v25 = buffer;
      __int16 v26 = 1024;
      pid_t v27 = v15;
      __int16 v28 = 1024;
      int v29 = 60;
      LODWORD(v23) = 24;
      int v21 = (char *)_os_log_send_and_compose_impl();
      if (v14)
      {
      }
    }
    else
    {
      id v17 = &_os_log_default;
      __int16 v18 = [(UpgradeSequencer *)self lockingClient];
      pid_t v19 = [v18 conn];
      if (v19)
      {
        id v2 = [(UpgradeSequencer *)self lockingClient];
        BOOL v3 = [v2 conn];
        pid_t v20 = xpc_connection_get_pid((xpc_connection_t)v3);
      }
      else
      {
        pid_t v20 = -1;
      }
      int v24 = 136315650;
      v25 = buffer;
      __int16 v26 = 1024;
      pid_t v27 = v20;
      __int16 v28 = 1024;
      int v29 = 60;
      LODWORD(v23) = 24;
      int v21 = (char *)_os_log_send_and_compose_impl();
      if (v19)
      {
      }
      id v12 = &_os_log_default;
    }

    id v7 = sub_10000BF78("-[UpgradeSequencer _timeout]", "upgrade_sequencer.m", 697, "com.apple.security.cryptex.posix", 60, 0, v21);
    free(v21);
    int v16 = -[UpgradeSequencer _completeUpgradeWithError:](self, "_completeUpgradeWithError:", v7, &v24, v23);
  }
  else
  {
    int v16 = 0;
  }

  return v16;
}

- (id)_abort
{
  BOOL v3 = [(UpgradeSequencer *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v9[0] = 0;
  LODWORD(v8) = 2;
  unsigned int v4 = (char *)_os_log_send_and_compose_impl();
  CFErrorRef v5 = sub_10000BF78("-[UpgradeSequencer _abort]", "upgrade_sequencer.m", 712, "com.apple.security.cryptex", 27, 0, v4);
  free(v4);
  id v6 = -[UpgradeSequencer _completeUpgradeWithError:](self, "_completeUpgradeWithError:", v5, v9, v8);

  return v6;
}

- (void)_startUpgradeForCryptex:(id)a3 withGraftPath:(id)a4 killingJobs:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, CFErrorRef))a6;
  pid_t v13 = [(UpgradeSequencer *)self workQueue];
  dispatch_assert_queue_V2(v13);

  pid_t v14 = [(UpgradeSequencer *)self upgradesUnderway];
  pid_t v15 = [v14 objectForKey:v10];

  if (v15)
  {
    int v16 = [(UpgradeSequencer *)self logHandle];

    if (v16)
    {
      id v17 = [(UpgradeSequencer *)self logHandle];
      os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      __int16 v18 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      __int16 v18 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v19 = sub_10000BF78("-[UpgradeSequencer _startUpgradeForCryptex:withGraftPath:killingJobs:withCompletion:]", "upgrade_sequencer.m", 732, "com.apple.security.cryptex", 29, 0, v18);
    free(v18);
    v12[2](v12, v19);
  }
  else
  {
    CFErrorRef v19 = 0;
  }
  pid_t v20 = [[UpgradeOperation alloc] initWithCryptexName:v10 graftPath:v11];
  int v21 = v20;
  if (v20)
  {
    [(UpgradeOperation *)v20 startUpgrade];
    pid_t v22 = [(UpgradeSequencer *)self upgradesUnderway];
    [v22 setObject:v21 forKeyedSubscript:v10];

    if (v7) {
      [(UpgradeOperation *)v21 terminateJobsWithCompletion:v12];
    }
    else {
      v12[2](v12, 0);
    }
    CFErrorRef v26 = v19;
  }
  else
  {
    uint64_t v23 = [(UpgradeSequencer *)self logHandle];

    if (v23)
    {
      int v24 = [(UpgradeSequencer *)self logHandle];
      os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
      v25 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      v25 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v26 = sub_10000BF78("-[UpgradeSequencer _startUpgradeForCryptex:withGraftPath:killingJobs:withCompletion:]", "upgrade_sequencer.m", 742, "com.apple.security.cryptex", 24, 0, v25);
    free(v25);

    v12[2](v12, v26);
  }
}

- (id)_completeUpgradeWithError:(id)a3
{
  id v4 = a3;
  CFErrorRef v5 = [(UpgradeSequencer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(UpgradeSequencer *)self upgradesUnderway];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100007718;
  v13[3] = &unk_1000592F0;
  id v7 = v4;
  id v14 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v13];

  uint64_t v8 = [(UpgradeSequencer *)self upgradesUnderway];
  [v8 removeAllObjects];

  int v9 = [(UpgradeSequencer *)self sessionCompleteCallback];

  if (v9)
  {
    id v10 = [(UpgradeSequencer *)self sessionCompleteCallback];
    ((void (**)(void, id))v10)[2](v10, v7);
  }
  id v11 = [(UpgradeSequencer *)self _completeUpgradeSession];

  return v11;
}

- (OS_dispatch_queue)lockAcquireQueue
{
  return self->_lockAcquireQueue;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)registrationQueue
{
  return self->_registrationQueue;
}

- (NSMutableDictionary)upgradesUnderway
{
  return self->_upgradesUnderway;
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

- (id)sessionCompleteCallback
{
  return self->_sessionCompleteCallback;
}

- (void)setSessionCompleteCallback:(id)a3
{
}

- (UpgradeClient)lockingClient
{
  return self->_lockingClient;
}

- (void)setLockingClient:(id)a3
{
}

- (OS_dispatch_source)lockTimer
{
  return self->_lockTimer;
}

- (void)setLockTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockTimer, 0);
  objc_storeStrong((id *)&self->_lockingClient, 0);
  objc_storeStrong(&self->_sessionCompleteCallback, 0);
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_upgradesUnderway, 0);
  objc_storeStrong((id *)&self->_registrationQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_lockAcquireQueue, 0);
}

@end