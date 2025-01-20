@interface CCDShieldUILifeCycleManager
+ (id)sharedInstance;
- (CCDShieldUILifeCycleManager)init;
- (CCDShieldUISession)activeSession;
- (void)_acquireAlwaysOnDisplayAssertion;
- (void)_acquireAppSwitcherAssertion;
- (void)_acquireLockScreenAssertion;
- (void)_forceTerminateShieldIfApplicable:(id)a3 completionTimeoutInSec:(unint64_t)a4;
- (void)_launchShieldForDeviceIdentifier:(id)a3 name:(id)a4 model:(int64_t)a5 skipPlacementStep:(BOOL)a6 isDedicated:(BOOL)a7 statusHandler:(id)a8;
- (void)_launchShieldUIProcess;
- (void)_releaseAlwaysOnDisplayAssertion;
- (void)_releaseAppSwitcherAssertion;
- (void)_releaseLockScreenAssertion;
- (void)assertionTargetProcessDidExit:(id)a3;
- (void)bringShieldUIProcessToForegroundIfApplicable;
- (void)dealloc;
- (void)forceShieldUITerminationIfApplicable;
- (void)launchShieldForDeviceIdentifier:(id)a3 name:(id)a4 model:(int64_t)a5 skipPlacementStep:(BOOL)a6 isDedicated:(BOOL)a7 statusHandler:(id)a8;
- (void)notifyShieldStatus:(int64_t)a3;
- (void)prepareForPullConversation:(id)a3;
- (void)shieldDidConnect;
- (void)shieldDidDisconnect;
- (void)tearDownShield;
@end

@implementation CCDShieldUILifeCycleManager

+ (id)sharedInstance
{
  if (qword_10001D850 != -1) {
    dispatch_once(&qword_10001D850, &stru_1000186D8);
  }
  v2 = (void *)qword_10001D858;

  return v2;
}

- (CCDShieldUILifeCycleManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)CCDShieldUILifeCycleManager;
  v2 = [(CCDShieldUILifeCycleManager *)&v8 init];
  if (v2)
  {
    v3 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v10 = v2;
      __int16 v11 = 2080;
      v12 = "-[CCDShieldUILifeCycleManager init]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
    }

    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.shieldui.lifecyclemanager", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)dealloc
{
  [(CCDShieldUILifeCycleManager *)self _releaseLockScreenAssertion];
  [(CCDShieldUILifeCycleManager *)self _releaseAppSwitcherAssertion];
  [(CCDShieldUILifeCycleManager *)self _releaseAlwaysOnDisplayAssertion];
  v3.receiver = self;
  v3.super_class = (Class)CCDShieldUILifeCycleManager;
  [(CCDShieldUILifeCycleManager *)&v3 dealloc];
}

- (CCDShieldUISession)activeSession
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = v2->_activeSession;
  objc_sync_exit(v2);

  return v3;
}

- (void)assertionTargetProcessDidExit:(id)a3
{
  id v3 = a3;
  v4 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[CCDShieldUILifeCycleManager assertionTargetProcessDidExit:]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s assertion %@ ", (uint8_t *)&v5, 0x16u);
  }
}

- (void)shieldDidConnect
{
  id v3 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(CCDShieldUILifeCycleManager *)self activeSession];
    *(_DWORD *)buf = 138543874;
    v9 = self;
    __int16 v10 = 2080;
    __int16 v11 = "-[CCDShieldUILifeCycleManager shieldDidConnect]";
    __int16 v12 = 2114;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s activeSession %{public}@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003968;
  block[3] = &unk_100018670;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)shieldDidDisconnect
{
  id v3 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543618;
    int v5 = self;
    __int16 v6 = 2080;
    id v7 = "-[CCDShieldUILifeCycleManager shieldDidDisconnect]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v4, 0x16u);
  }

  [(CCDShieldUILifeCycleManager *)self forceShieldUITerminationIfApplicable];
}

- (void)prepareForPullConversation:(id)a3
{
  id v4 = a3;
  int v5 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v11 = self;
    __int16 v12 = 2080;
    v13 = "-[CCDShieldUILifeCycleManager prepareForPullConversation:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003C04;
  v8[3] = &unk_100018700;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)notifyShieldStatus:(int64_t)a3
{
  int v5 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v6 = [(CCDShieldUILifeCycleManager *)self activeSession];
    int v10 = 138544130;
    __int16 v11 = self;
    __int16 v12 = 2080;
    v13 = "-[CCDShieldUILifeCycleManager notifyShieldStatus:]";
    __int16 v14 = 1024;
    int v15 = a3;
    __int16 v16 = 2114;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s error %d for session %{public}@", (uint8_t *)&v10, 0x26u);
  }
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = (void (**)(id, void *, int64_t))objc_retainBlock(v7->_statusHandler);
  objc_sync_exit(v7);

  if (v8)
  {
    id v9 = [(CCDShieldUILifeCycleManager *)v7 activeSession];
    v8[2](v8, v9, a3);
  }
}

- (void)launchShieldForDeviceIdentifier:(id)a3 name:(id)a4 model:(int64_t)a5 skipPlacementStep:(BOOL)a6 isDedicated:(BOOL)a7 statusHandler:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  v17 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [(CCDShieldUILifeCycleManager *)self activeSession];
    *(_DWORD *)buf = 138545154;
    v31 = self;
    __int16 v32 = 2080;
    v33 = "-[CCDShieldUILifeCycleManager launchShieldForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:statusHandler:]";
    __int16 v34 = 1024;
    BOOL v35 = v10;
    __int16 v36 = 1024;
    BOOL v37 = v9;
    __int16 v38 = 2114;
    id v39 = v14;
    __int16 v40 = 2114;
    id v41 = v15;
    __int16 v42 = 1024;
    int v43 = a5;
    __int16 v44 = 2114;
    v45 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ %s skipPlacementStep:%d isDedicated:%d identifier:%{public}@ name:%{public}@ model:%d activeSession:%{public}@", buf, 0x46u);
  }
  queue = self->_queue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100003FA0;
  v23[3] = &unk_100018728;
  v23[4] = self;
  id v24 = v14;
  id v26 = v16;
  int64_t v27 = a5;
  BOOL v28 = v10;
  BOOL v29 = v9;
  id v25 = v15;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  dispatch_async(queue, v23);
}

- (void)_launchShieldForDeviceIdentifier:(id)a3 name:(id)a4 model:(int64_t)a5 skipPlacementStep:(BOOL)a6 isDedicated:(BOOL)a7 statusHandler:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = (char *)a3;
  id v15 = a4;
  id v16 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    activeSession = self->_activeSession;
    *(_DWORD *)buf = 138545154;
    BOOL v35 = self;
    __int16 v36 = 2080;
    BOOL v37 = "-[CCDShieldUILifeCycleManager _launchShieldForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:statusHandler:]";
    __int16 v38 = 1024;
    BOOL v39 = v10;
    __int16 v40 = 1024;
    BOOL v41 = v9;
    __int16 v42 = 2114;
    int v43 = v14;
    __int16 v44 = 2114;
    id v45 = v15;
    __int16 v46 = 1024;
    int v47 = a5;
    __int16 v48 = 2114;
    v49 = activeSession;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ %s skipPlacementStep:%d isDedicated:%d identifier:%{public}@ name:%{public}@ model:%d activeSession:%{public}@", buf, 0x46u);
  }

  p_activeSession = &self->_activeSession;
  v19 = self->_activeSession;
  if (!v19) {
    goto LABEL_7;
  }
  id v21 = [(CCDShieldUISession *)v19 deviceIdentifier];
  unsigned __int8 v22 = [v21 isEqualToString:v14];

  if ((v22 & 1) == 0)
  {
    [(CCDShieldUILifeCycleManager *)self notifyShieldStatus:-2003];
    goto LABEL_11;
  }
  if (*p_activeSession)
  {
    [(CCDShieldUILifeCycleManager *)self notifyShieldStatus:0];
  }
  else
  {
LABEL_7:
    v23 = self;
    objc_sync_enter(v23);
    id v24 = objc_retainBlock(v16);
    id statusHandler = v23->_statusHandler;
    v23->_id statusHandler = v24;

    objc_sync_exit(v23);
    id v26 = dispatch_get_global_queue(2, 0);
    dispatch_async(v26, &stru_100018748);

    int64_t v27 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      BOOL v35 = v23;
      __int16 v36 = 2114;
      BOOL v37 = v14;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating CCDShieldUISession for device %{public}@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, v23);
    BOOL v28 = [CCDShieldUISession alloc];
    BOOL v29 = +[NSNumber numberWithBool:v10];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000043D4;
    v32[3] = &unk_100018670;
    objc_copyWeak(&v33, (id *)buf);
    v30 = [(CCDShieldUISession *)v28 initWithDeviceIdentifier:v14 name:v15 model:a5 placementStepSkipped:v29 isDedicated:v9 sessionInterruptionBlock:v32];

    [(CCDShieldUILifeCycleManager *)v23 willChangeValueForKey:@"activeSession"];
    v31 = v23;
    objc_sync_enter(v31);
    objc_storeStrong((id *)p_activeSession, v30);
    objc_sync_exit(v31);

    [(CCDShieldUILifeCycleManager *)v31 didChangeValueForKey:@"activeSession"];
    [(CCDShieldUILifeCycleManager *)v31 _acquireLockScreenAssertion];
    [(CCDShieldUILifeCycleManager *)v31 _acquireAppSwitcherAssertion];
    [(CCDShieldUILifeCycleManager *)v31 _launchShieldUIProcess];

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
  }
LABEL_11:
}

- (void)_launchShieldUIProcess
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setObject:SBSOpenApplicationEnvironmentSecureOnLockScreen forKey:SBSOpenApplicationOptionKeyLaunchEnvironment];
  [v3 setObject:&__kCFBooleanTrue forKey:FBSOpenApplicationOptionKeyPromptUnlockDevice];
  [v3 setObject:&__kCFBooleanTrue forKey:FBSOpenApplicationOptionKeyUnlockDevice];
  if (!self->_shieldConnected)
  {
    id v4 = +[NSURL URLWithString:@"ContinuityCaptureShieldUILaunch://"];
    int v5 = [(CCDShieldUILifeCycleManager *)self activeSession];
    __int16 v6 = [v5 configuration];

    id v21 = 0;
    id v7 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v21];
    id v8 = v21;
    if (v8 || !v7)
    {
      BOOL v9 = CMContinuityCaptureLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000FEA0((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    else
    {
      [v3 setObject:v4 forKey:FBSOpenApplicationOptionKeyPayloadURL];
      CFStringRef v23 = @"kContinuityCaptureLaunchUIConfigurationKey";
      id v24 = v7;
      BOOL v9 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      [v3 setObject:v9 forKey:FBSOpenApplicationOptionKeyPayloadAnnotation];
    }
  }
  id v16 = [v3 copy];
  v17 = +[FBSOpenApplicationOptions optionsWithDictionary:v16];

  v18 = SBSCreateOpenApplicationService();
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100004874;
  v19[3] = &unk_100018770;
  objc_copyWeak(&v20, &location);
  [v18 openApplication:@"com.apple.ContinuityCaptureShieldUI" withOptions:v17 completion:v19];
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
}

- (void)bringShieldUIProcessToForegroundIfApplicable
{
  id v3 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v7 = self;
    __int16 v8 = 2080;
    BOOL v9 = "-[CCDShieldUILifeCycleManager bringShieldUIProcessToForegroundIfApplicable]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004A74;
  block[3] = &unk_100018798;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_forceTerminateShieldIfApplicable:(id)a3 completionTimeoutInSec:(unint64_t)a4
{
  int v5 = (void (**)(void))a3;
  objc_initWeak(&location, self);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  __int16 v6 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:@"com.apple.ContinuityCaptureShieldUI"];
  id v29 = 0;
  id v7 = +[RBSProcessHandle handleForPredicate:v6 error:&v29];
  id v8 = v29;
  if (v7)
  {
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.forceTerminateShield", 0);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100004E2C;
    v24[3] = &unk_1000187E8;
    objc_copyWeak(&v28, &location);
    uint64_t v10 = v9;
    id v25 = v10;
    int64_t v27 = v30;
    uint64_t v11 = v5;
    id v26 = v11;
    [v7 monitorForDeath:v24];
    id v12 = [objc_alloc((Class)RBSTerminateContext) initWithExplanation:@"Terminated by ccd due to timeout"];
    id v13 = [objc_alloc((Class)RBSTerminateRequest) initWithPredicate:v6 context:v12];
    id v23 = 0;
    unsigned int v14 = [v13 execute:&v23];
    id v15 = v23;

    id v16 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v34 = "-[CCDShieldUILifeCycleManager _forceTerminateShieldIfApplicable:completionTimeoutInSec:]";
      __int16 v35 = 2112;
      id v36 = v13;
      __int16 v37 = 2114;
      id v38 = v15;
      __int16 v39 = 1024;
      unsigned int v40 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s request %@ error %{public}@ status %d", buf, 0x26u);
    }

    dispatch_time_t v17 = dispatch_time(0, 1000000000 * a4);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004FF0;
    block[3] = &unk_100018810;
    id v21 = v30;
    objc_copyWeak(&v22, &location);
    id v20 = v11;
    dispatch_after(v17, v10, block);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v28);

    id v8 = v15;
  }
  else
  {
    v5[2](v5);
  }

  _Block_object_dispose(v30, 8);
  objc_destroyWeak(&location);
}

- (void)forceShieldUITerminationIfApplicable
{
  id v3 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v7 = self;
    __int16 v8 = 2080;
    dispatch_queue_t v9 = "-[CCDShieldUILifeCycleManager forceShieldUITerminationIfApplicable]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000051F8;
  block[3] = &unk_100018798;
  void block[4] = self;
  dispatch_async_and_wait(queue, block);
}

- (void)tearDownShield
{
  id v3 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v7 = self;
    __int16 v8 = 2080;
    dispatch_queue_t v9 = "-[CCDShieldUILifeCycleManager tearDownShield]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005450;
  block[3] = &unk_100018798;
  void block[4] = self;
  dispatch_async_and_wait(queue, block);
}

- (void)_acquireLockScreenAssertion
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  lockScreenAssertion = self->_lockScreenAssertion;
  id v4 = CMContinuityCaptureLog();
  int v5 = v4;
  if (lockScreenAssertion)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000FF78(v5);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Acquiring SBSSecureAppAssertion for lock screen", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000058F8;
    v8[3] = &unk_100018838;
    objc_copyWeak(&v9, buf);
    __int16 v6 = +[SBSSecureAppAssertion acquireSecureAppAssertionWithType:7 errorHandler:v8];
    id v7 = self->_lockScreenAssertion;
    self->_lockScreenAssertion = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
}

- (void)_releaseLockScreenAssertion
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing SBSSecureAppAssertion for lock screen", v6, 2u);
  }

  lockScreenAssertion = self->_lockScreenAssertion;
  if (lockScreenAssertion)
  {
    [(SBSLockScreenContentAssertion *)lockScreenAssertion invalidate];
    int v5 = self->_lockScreenAssertion;
    self->_lockScreenAssertion = 0;
  }
}

- (void)_acquireAppSwitcherAssertion
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  appSwitcherAssertion = self->_appSwitcherAssertion;
  id v4 = CMContinuityCaptureLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (appSwitcherAssertion)
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempted to acquire AppSwitcherAssertion even though we already have one", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Acquiring SBSRequestAppSwitcherAppearanceForHiddenApplication", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100005C6C;
    v9[3] = &unk_100018860;
    objc_copyWeak(&v10, buf);
    __int16 v6 = objc_retainBlock(v9);
    id appSwitcherAssertionCompletion = self->_appSwitcherAssertionCompletion;
    self->_id appSwitcherAssertionCompletion = v6;

    objc_copyWeak(&v8, buf);
    SBSRequestAppSwitcherAppearanceForHiddenApplication();
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

- (void)_releaseAppSwitcherAssertion
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing AppSwitcherAssertion", v7, 2u);
  }

  id appSwitcherAssertionCompletion = self->_appSwitcherAssertionCompletion;
  self->_id appSwitcherAssertionCompletion = 0;

  appSwitcherAssertion = self->_appSwitcherAssertion;
  if (appSwitcherAssertion)
  {
    [(SBSAssertion *)appSwitcherAssertion invalidate];
    __int16 v6 = self->_appSwitcherAssertion;
    self->_appSwitcherAssertion = 0;
  }
}

- (void)_acquireAlwaysOnDisplayAssertion
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  alwaysOnDisplayAssertionToken = self->_alwaysOnDisplayAssertionToken;
  id v4 = CMContinuityCaptureLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (alwaysOnDisplayAssertionToken)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempted to acquire always on display assertion even though we already have one", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Acquiring always on display assertion", v8, 2u);
    }

    id v4 = objc_alloc_init((Class)SBSLockScreenService);
    __int16 v6 = [v4 preventSpuriousScreenUndimWithReason:@"Continuity Capture Enabled"];
    id v7 = self->_alwaysOnDisplayAssertionToken;
    self->_alwaysOnDisplayAssertionToken = v6;

    [v4 invalidate];
  }
}

- (void)_releaseAlwaysOnDisplayAssertion
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing always on display assertion", v6, 2u);
  }

  alwaysOnDisplayAssertionToken = self->_alwaysOnDisplayAssertionToken;
  if (alwaysOnDisplayAssertionToken)
  {
    [(BSInvalidatable *)alwaysOnDisplayAssertionToken invalidate];
    BOOL v5 = self->_alwaysOnDisplayAssertionToken;
    self->_alwaysOnDisplayAssertionToken = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminationSemaphore, 0);
  objc_storeStrong(&self->_statusHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong(&self->_appSwitcherAssertionCompletion, 0);
  objc_storeStrong((id *)&self->_alwaysOnDisplayAssertionToken, 0);
  objc_storeStrong((id *)&self->_appSwitcherAssertion, 0);

  objc_storeStrong((id *)&self->_lockScreenAssertion, 0);
}

@end