@interface BYDaemonContext
- (BYDaemonContext)init;
- (LAContext)applePayAuthenticationContext;
- (LAContext)biometricAuthenticationContext;
- (OS_dispatch_queue)contextQueue;
- (void)_destroyContexts;
- (void)_prepareContextTimeout;
- (void)setApplePayAuthenticationContext:(id)a3;
- (void)setBiometricAuthenticationContext:(id)a3;
- (void)setContextQueue:(id)a3;
@end

@implementation BYDaemonContext

- (BYDaemonContext)init
{
  v10.receiver = self;
  v10.super_class = (Class)BYDaemonContext;
  v2 = [(BYDaemonContext *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.purplebuddy.context", v3);
    contextQueue = v2->_contextQueue;
    v2->_contextQueue = (OS_dispatch_queue *)v4;

    v6 = +[BYSetupStateNotifier sharedNotifier];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100005FA4;
    v8[3] = &unk_10001C800;
    v9 = v2;
    [v6 addStateCompletionObserver:v8 forState:2];
  }
  return v2;
}

- (void)setApplePayAuthenticationContext:(id)a3
{
  id v4 = a3;
  v5 = [(BYDaemonContext *)self contextQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006100;
  v7[3] = &unk_10001C828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (LAContext)applePayAuthenticationContext
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = sub_10000625C;
  v11 = sub_10000626C;
  id v12 = 0;
  v3 = [(BYDaemonContext *)self contextQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006274;
  v6[3] = &unk_10001C850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (LAContext *)v4;
}

- (void)setBiometricAuthenticationContext:(id)a3
{
  id v4 = a3;
  v5 = [(BYDaemonContext *)self contextQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000633C;
  v7[3] = &unk_10001C828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (LAContext)biometricAuthenticationContext
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = sub_10000625C;
  v11 = sub_10000626C;
  id v12 = 0;
  v3 = [(BYDaemonContext *)self contextQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006498;
  v6[3] = &unk_10001C850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (LAContext *)v4;
}

- (void)_prepareContextTimeout
{
  dispatch_time_t v3 = dispatch_time(0, 300000000000);
  id v4 = [(BYDaemonContext *)self contextQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006560;
  block[3] = &unk_10001C800;
  block[4] = self;
  dispatch_after(v3, v4, block);
}

- (void)_destroyContexts
{
  dispatch_time_t v3 = [(BYDaemonContext *)self contextQueue];
  dispatch_assert_queue_V2(v3);

  if (self->_applePayAuthenticationContext)
  {
    id v4 = _BYLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Destroying Apple Pay context", buf, 2u);
    }

    [(LAContext *)self->_applePayAuthenticationContext invalidate];
    applePayAuthenticationContext = self->_applePayAuthenticationContext;
    self->_applePayAuthenticationContext = 0;
  }
  if (self->_biometricAuthenticationContext)
  {
    id v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Destroying Biometric context", v8, 2u);
    }

    [(LAContext *)self->_biometricAuthenticationContext invalidate];
    biometricAuthenticationContext = self->_biometricAuthenticationContext;
    self->_biometricAuthenticationContext = 0;
  }
}

- (OS_dispatch_queue)contextQueue
{
  return self->_contextQueue;
}

- (void)setContextQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextQueue, 0);
  objc_storeStrong((id *)&self->_biometricAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_applePayAuthenticationContext, 0);
}

@end