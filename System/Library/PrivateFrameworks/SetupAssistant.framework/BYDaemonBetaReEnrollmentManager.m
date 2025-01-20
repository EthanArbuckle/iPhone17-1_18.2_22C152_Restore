@interface BYDaemonBetaReEnrollmentManager
+ (id)sharedInstance;
+ (void)unregisterActivityUsingRegistrar:(id)a3;
- (BOOL)_onSerialQueue_needsEnrollWithCheckForExistingEnrollment:(BOOL)a3 enrollBlock:(id)a4;
- (BOOL)_onSerialQueue_needsEnrollWithProgramName:(id)a3 assetAudience:(id)a4 programID:(id)a5;
- (BYDaemonBetaReEnrollmentManager)initWithSeedProgramManager:(id)a3 xpcActivityRegistrar:(id)a4 setupAssistantFrameworkDefaults:(id)a5 lockAssertionManager:(id)a6;
- (BYDaemonLockAssertionManager)lockAssertionManager;
- (BYSeedProgramManager)seedProgramManager;
- (BYXPCActivityRegistrar)xpcActivityRegistrar;
- (NSObject)lockAssertion;
- (NSUserDefaults)setupAssistantFrameworkDefaults;
- (OS_dispatch_queue)serialQueue;
- (void)_onSerialQueue_attemptLockAssertionIfNecessary;
- (void)_onSerialQueue_performOneEnrollWithProgramName:(id)a3 assetAudience:(id)a4 programID:(id)a5 completionOnSerialQueue:(id)a6;
- (void)_onSerialQueue_registerActivityForPurpose:(id)a3;
- (void)daemonStart;
- (void)enrollInSeedProgramNamed:(id)a3 withAssetAudience:(id)a4 programID:(id)a5;
- (void)setLockAssertion:(id)a3;
- (void)setLockAssertionManager:(id)a3;
- (void)setSeedProgramManager:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSetupAssistantFrameworkDefaults:(id)a3;
- (void)setXpcActivityRegistrar:(id)a3;
@end

@implementation BYDaemonBetaReEnrollmentManager

+ (id)sharedInstance
{
  if (qword_100024D80 != -1) {
    dispatch_once(&qword_100024D80, &stru_10001C9C8);
  }
  v2 = (void *)qword_100024D78;
  return v2;
}

- (BYDaemonBetaReEnrollmentManager)initWithSeedProgramManager:(id)a3 xpcActivityRegistrar:(id)a4 setupAssistantFrameworkDefaults:(id)a5 lockAssertionManager:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BYDaemonBetaReEnrollmentManager;
  v14 = [(BYDaemonBetaReEnrollmentManager *)&v17 init];
  if (v14)
  {
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.budd.betaReEnrollmentManager", 0);
    [(BYDaemonBetaReEnrollmentManager *)v14 setSerialQueue:v15];

    [(BYDaemonBetaReEnrollmentManager *)v14 setSeedProgramManager:v10];
    [(BYDaemonBetaReEnrollmentManager *)v14 setXpcActivityRegistrar:v11];
    [(BYDaemonBetaReEnrollmentManager *)v14 setSetupAssistantFrameworkDefaults:v12];
    [(BYDaemonBetaReEnrollmentManager *)v14 setLockAssertionManager:v13];
  }

  return v14;
}

- (void)daemonStart
{
  v3 = [(BYDaemonBetaReEnrollmentManager *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AF10;
  block[3] = &unk_10001C800;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)enrollInSeedProgramNamed:(id)a3 withAssetAudience:(id)a4 programID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(BYDaemonBetaReEnrollmentManager *)self serialQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000B0DC;
  v15[3] = &unk_10001C9F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

+ (void)unregisterActivityUsingRegistrar:(id)a3
{
  id v3 = a3;
  v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unregistering beta re-enrollment activity...", v5, 2u);
  }

  [v3 unregisterActivityWithIdentifier:"com.apple.purplebuddy.betaReEnrollment"];
}

- (void)_onSerialQueue_registerActivityForPurpose:(id)a3
{
  id v4 = a3;
  v5 = [(BYDaemonBetaReEnrollmentManager *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Beta Re-Enroll: Registering activity (%{public}@)", buf, 0xCu);
  }

  v7 = [(BYDaemonBetaReEnrollmentManager *)self xpcActivityRegistrar];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B43C;
  v9[3] = &unk_10001CA68;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  [v7 registerActivityWithIdentifier:"com.apple.purplebuddy.betaReEnrollment" criteria:XPC_ACTIVITY_CHECK_IN handler:v9];
}

- (BOOL)_onSerialQueue_needsEnrollWithCheckForExistingEnrollment:(BOOL)a3 enrollBlock:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, void *, void *, void *))a4;
  v7 = [(BYDaemonBetaReEnrollmentManager *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(BYDaemonBetaReEnrollmentManager *)self setupAssistantFrameworkDefaults];
  id v9 = [v8 objectForKey:@"SeedEnrollmentProgramName"];

  id v10 = [(BYDaemonBetaReEnrollmentManager *)self setupAssistantFrameworkDefaults];
  id v11 = [v10 objectForKey:@"SeedEnrollmentAssetAudience"];

  id v12 = [(BYDaemonBetaReEnrollmentManager *)self setupAssistantFrameworkDefaults];
  id v13 = [v12 objectForKey:@"SeedEnrollmentProgramID"];

  id v14 = [(BYDaemonBetaReEnrollmentManager *)self setupAssistantFrameworkDefaults];
  dispatch_queue_t v15 = [v14 objectForKey:@"SeedEnrollmentFailureCount"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v16 = [v15 unsignedIntegerValue];
    unsigned int v17 = (unint64_t)v16 < 0xF0;
    if ((unint64_t)v16 <= 0xEF && v4) {
      unsigned int v17 = [(BYDaemonBetaReEnrollmentManager *)self _onSerialQueue_needsEnrollWithProgramName:v9 assetAudience:v11 programID:v13];
    }
    if (v6 && v17)
    {
      v6[2](v6, v9, v11, v13);
      LOBYTE(v17) = 1;
    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (BOOL)_onSerialQueue_needsEnrollWithProgramName:(id)a3 assetAudience:(id)a4 programID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(BYDaemonBetaReEnrollmentManager *)self serialQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(BYDaemonBetaReEnrollmentManager *)self seedProgramManager];
  id v13 = [v12 currentEnrollmentMetadata];

  id v14 = objc_msgSend(v13, "bySeedProgramManager_valueForProgramKey");
  unsigned int v15 = [v10 isEqualToString:v14];

  if (v15)
  {
    id v16 = objc_msgSend(v13, "bySeedProgramManager_valueForAssetAudienceKey");
    if ([v8 isEqualToString:v16])
    {
      unsigned int v17 = objc_msgSend(v13, "bySeedProgramManager_valueForProgramIDKey");
      unsigned int v18 = [v9 isEqualToString:v17] ^ 1;
    }
    else
    {
      LOBYTE(v18) = 1;
    }
  }
  else
  {
    LOBYTE(v18) = 1;
  }

  return v18;
}

- (void)_onSerialQueue_performOneEnrollWithProgramName:(id)a3 assetAudience:(id)a4 programID:(id)a5 completionOnSerialQueue:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(BYDaemonBetaReEnrollmentManager *)self serialQueue];
  dispatch_assert_queue_V2(v14);

  unsigned int v15 = _BYLoggingFacility();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Beta Re-Enroll: Starting enroll", buf, 2u);
  }

  id v16 = [(BYDaemonBetaReEnrollmentManager *)self seedProgramManager];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000C0C4;
  v18[3] = &unk_10001CAB8;
  v18[4] = self;
  id v19 = v10;
  id v17 = v10;
  [v16 enrollInSeedProgramNamed:v13 withAssetAudience:v12 programID:v11 completion:v18];
}

- (void)_onSerialQueue_attemptLockAssertionIfNecessary
{
  id v3 = [(BYDaemonBetaReEnrollmentManager *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(BYDaemonBetaReEnrollmentManager *)self lockAssertion];

  if (!v4)
  {
    v5 = [(BYDaemonBetaReEnrollmentManager *)self lockAssertionManager];
    CFStringRef v10 = @"MKBAssertionKey";
    CFStringRef v11 = @"Other";
    v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v7 = [v5 acquireLockAssertionWithOptions:v6 purpose:@"Beta Re-Enroll"];
    [(BYDaemonBetaReEnrollmentManager *)self setLockAssertion:v7];

    id v8 = [(BYDaemonBetaReEnrollmentManager *)self lockAssertion];

    if (!v8)
    {
      id v9 = _BYLoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000108D4(v9);
      }
    }
  }
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (BYSeedProgramManager)seedProgramManager
{
  return self->_seedProgramManager;
}

- (void)setSeedProgramManager:(id)a3
{
}

- (BYXPCActivityRegistrar)xpcActivityRegistrar
{
  return self->_xpcActivityRegistrar;
}

- (void)setXpcActivityRegistrar:(id)a3
{
}

- (NSUserDefaults)setupAssistantFrameworkDefaults
{
  return self->_setupAssistantFrameworkDefaults;
}

- (void)setSetupAssistantFrameworkDefaults:(id)a3
{
}

- (BYDaemonLockAssertionManager)lockAssertionManager
{
  return self->_lockAssertionManager;
}

- (void)setLockAssertionManager:(id)a3
{
}

- (NSObject)lockAssertion
{
  return self->_lockAssertion;
}

- (void)setLockAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockAssertion, 0);
  objc_storeStrong((id *)&self->_lockAssertionManager, 0);
  objc_storeStrong((id *)&self->_setupAssistantFrameworkDefaults, 0);
  objc_storeStrong((id *)&self->_xpcActivityRegistrar, 0);
  objc_storeStrong((id *)&self->_seedProgramManager, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end