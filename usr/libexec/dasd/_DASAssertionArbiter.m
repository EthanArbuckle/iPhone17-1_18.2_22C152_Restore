@interface _DASAssertionArbiter
- ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenForPID:(SEL)a3 success:(int)a4;
- (BOOL)doesAuditToken:(id *)a3 haveEntitlement:(id)a4;
- (BOOL)doesPID:(int)a3 haveEntitlement:(id)a4;
- (BOOL)isBackgroundFetchActivity:(id)a3;
- (BOOL)shouldCreateAssertionForActivity:(id)a3;
- (NSMutableDictionary)assertionAssociations;
- (OS_os_log)log;
- (_DASAssertionArbiter)initWithDelegate:(id)a3;
- (_DASAssertionArbiterDelegate)handlerDelegate;
- (id)assertionForWebBrowserContinuedProcessingTask:(id)a3 targetPID:(int)a4;
- (id)createAssertionForActivity:(id)a3 targetPID:(int)a4;
- (id)createAssertionForBackgroundFetchActivity:(id)a3 targetPID:(int)a4;
- (id)createAssertionForBackgroundTaskActivity:(id)a3 targetPID:(int)a4;
- (id)createAssertionForHealthKitActivity:(id)a3 targetPID:(int)a4;
- (id)createUnmanagedAssertionForActivity:(id)a3 targetPID:(int)a4;
- (id)hostAssertionAssociatedWithActivity:(id)a3 targetPID:(int)a4;
- (int)hostPIDForTarget:(int)a3;
- (void)acquireAssertionsForActivity:(id)a3;
- (void)createManagedAssertionForActivity:(id)a3 targetPID:(int)a4;
- (void)installHandlersForAssertion:(id)a3;
- (void)invalidateAssertionsForActivity:(id)a3;
- (void)setAssertionAssociations:(id)a3;
- (void)setHandlerDelegate:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation _DASAssertionArbiter

- (_DASAssertionArbiter)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_DASAssertionArbiter;
  v5 = [(_DASAssertionArbiter *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_handlerDelegate, v4);
    uint64_t v7 = +[NSMutableDictionary dictionary];
    assertionAssociations = v6->_assertionAssociations;
    v6->_assertionAssociations = (NSMutableDictionary *)v7;

    os_log_t v9 = os_log_create("com.apple.duetactivityscheduler", "AssertionArbiter");
    log = v6->_log;
    v6->_log = (OS_os_log *)v9;
  }
  return v6;
}

- (id)createUnmanagedAssertionForActivity:(id)a3 targetPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = [(_DASAssertionArbiter *)self createAssertionForActivity:v6 targetPID:v4];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000F5214();
  }

  return v8;
}

- (id)hostAssertionAssociatedWithActivity:(id)a3 targetPID:(int)a4
{
  id v5 = a3;
  id v6 = [(_DASAssertionArbiter *)self assertionAssociations];
  objc_sync_enter(v6);
  uint64_t v7 = [(NSMutableDictionary *)self->_assertionAssociations objectForKeyedSubscript:v5];
  objc_sync_exit(v6);

  v8 = [v7 anyAssertion];

  return v8;
}

- (void)createManagedAssertionForActivity:(id)a3 targetPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = [(_DASAssertionArbiter *)self createAssertionForActivity:v6 targetPID:v4];
  if (v7)
  {
    [(_DASAssertionArbiter *)self installHandlersForAssertion:v7];
    v8 = [(_DASAssertionArbiter *)self assertionAssociations];
    objc_sync_enter(v8);
    id v9 = [(NSMutableDictionary *)self->_assertionAssociations objectForKeyedSubscript:v6];
    if (!v9)
    {
      id v9 = [[_DASAssertionAssociation alloc] initWithActivity:v6];
      [(NSMutableDictionary *)self->_assertionAssociations setObject:v9 forKeyedSubscript:v6];
    }
    objc_sync_exit(v8);

    [(_DASAssertionAssociation *)v9 trackAssertion:v7];
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000F527C();
  }
}

- (void)acquireAssertionsForActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASAssertionArbiter *)self assertionAssociations];
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)self->_assertionAssociations objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  if (v6)
  {
    [v6 acquireAssertions];
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000F52E4();
  }
}

- (void)invalidateAssertionsForActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASAssertionArbiter *)self assertionAssociations];
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)self->_assertionAssociations objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  if (v6)
  {
    [v6 invalidateAssertions];
    uint64_t v7 = [(_DASAssertionArbiter *)self assertionAssociations];
    objc_sync_enter(v7);
    [(NSMutableDictionary *)self->_assertionAssociations removeObjectForKey:v4];
    objc_sync_exit(v7);
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000F534C();
  }
}

- (id)createAssertionForActivity:(id)a3 targetPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (![(_DASAssertionArbiter *)self shouldCreateAssertionForActivity:v6])
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
LABEL_5:
    }
      sub_1000F53B4();
LABEL_6:
    v8 = 0;
    goto LABEL_12;
  }
  if (![v6 isBackgroundTaskActivity])
  {
    if ([(_DASAssertionArbiter *)self isBackgroundFetchActivity:v6])
    {
      uint64_t v7 = [(_DASAssertionArbiter *)self createAssertionForBackgroundFetchActivity:v6 targetPID:v4];
      goto LABEL_11;
    }
    id v9 = [v6 launchReason];
    unsigned int v10 = [v9 isEqualToString:_DASLaunchReasonHealthKit];

    if (v10)
    {
      uint64_t v7 = [(_DASAssertionArbiter *)self createAssertionForHealthKitActivity:v6 targetPID:v4];
      goto LABEL_11;
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    goto LABEL_6;
  }
  uint64_t v7 = [(_DASAssertionArbiter *)self createAssertionForBackgroundTaskActivity:v6 targetPID:v4];
LABEL_11:
  v8 = (void *)v7;
LABEL_12:

  return v8;
}

- (BOOL)shouldCreateAssertionForActivity:(id)a3
{
  id v4 = a3;
  if (([v4 isBackgroundTaskActivity] & 1) != 0
    || [(_DASAssertionArbiter *)self isBackgroundFetchActivity:v4])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = [v4 launchReason];
    unsigned __int8 v5 = [v6 isEqualToString:_DASLaunchReasonHealthKit];
  }
  return v5;
}

- (BOOL)isBackgroundFetchActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 launchReason];
  if ([v4 isEqualToString:_DASLaunchReasonBackgroundFetch])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = [v3 launchReason];
    if ([v6 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification])
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      uint64_t v7 = [v3 launchReason];
      if ([v7 isEqualToString:_DASLaunchReasonNSURLSessionComplete])
      {
        unsigned __int8 v5 = 1;
      }
      else
      {
        v8 = [v3 launchReason];
        unsigned __int8 v5 = [v8 isEqualToString:_DASLaunchReasonNSURLSessionAuthorizationRequired];
      }
    }
  }
  return v5;
}

- (void)installHandlersForAssertion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004B504;
  v7[3] = &unk_1001761D8;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  [v4 setWarningHandler:v7];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004B574;
  v5[3] = &unk_100176200;
  v5[4] = self;
  objc_copyWeak(&v6, &location);
  [v4 setInvalidationHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)createAssertionForBackgroundFetchActivity:(id)a3 targetPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F541C();
  }
  uint64_t v7 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.dasd" name:@"BackgroundDownload"];
  id v8 = objc_alloc((Class)RBSAssertion);
  id v9 = +[RBSTarget targetWithPid:v4];
  v14 = v7;
  unsigned int v10 = +[NSArray arrayWithObjects:&v14 count:1];
  id v11 = [v8 initWithExplanation:@"com.apple.das.backgroundFetch" target:v9 attributes:v10];

  objc_super v12 = [[_DASAssertion alloc] initWithRBSAssertion:v11 forPid:v4];

  return v12;
}

- (id)createAssertionForHealthKitActivity:(id)a3 targetPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F5484();
  }
  uint64_t v7 = [v6 launchReason];
  id v8 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.dasd" name:@"HealthLaunch"];
  id v9 = objc_alloc((Class)RBSAssertion);
  unsigned int v10 = +[RBSTarget targetWithPid:v4];
  v15 = v8;
  id v11 = +[NSArray arrayWithObjects:&v15 count:1];
  id v12 = [v9 initWithExplanation:v7 target:v10 attributes:v11];

  v13 = [[_DASAssertion alloc] initWithRBSAssertion:v12 forPid:v4];

  return v13;
}

- (id)createAssertionForBackgroundTaskActivity:(id)a3 targetPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (![v6 isBackgroundTaskActivity]) {
    goto LABEL_20;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F54EC();
  }
  uint64_t v7 = [v6 launchReason];
  unsigned __int8 v8 = [v7 isEqualToString:_DASLaunchReasonBackgroundRefresh];

  if (v8)
  {
    CFStringRef v9 = @"BGAppRefreshTask";
  }
  else
  {
    unsigned int v10 = [v6 launchReason];
    unsigned int v11 = [v10 isEqualToString:_DASLaunchReasonBackgroundProcessing];

    if (v11)
    {
      if ([v6 isContactTracingBackgroundActivity]
        && ![v6 requiresPlugin])
      {
        CFStringRef v9 = @"BGProcessingTask-ExposureNotification";
      }
      else if ([v6 requiresPlugin])
      {
        CFStringRef v9 = @"BGProcessingTask-Unrestricted";
      }
      else
      {
        CFStringRef v9 = @"BGProcessingTask-Restricted";
      }
    }
    else
    {
      id v12 = [v6 launchReason];
      int v13 = [v12 isEqualToString:_DASLaunchReasonHealthResearch];

      if ((v13 & 1) == 0)
      {
        if (![v6 isContinuedProcessingTask]) {
          goto LABEL_20;
        }
        if ([(_DASAssertionArbiter *)self doesPID:v4 haveEntitlement:@"com.apple.developer.web-browser-engine.networking"])
        {
          -[_DASAssertionArbiter assertionForWebBrowserContinuedProcessingTask:targetPID:](self, "assertionForWebBrowserContinuedProcessingTask:targetPID:", v6, [v6 pid]);
          v14 = (_DASAssertion *)objc_claimAutoreleasedReturnValue();
          goto LABEL_21;
        }
        log = self->_log;
        if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Acquiring unrestricted assertion for Continued Processing", v23, 2u);
        }
      }
      CFStringRef v9 = @"BGProcessingTask-Unrestricted";
    }
  }
  uint64_t v15 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.dasd" name:v9];
  if (v15)
  {
    v16 = (void *)v15;
    id v17 = objc_alloc((Class)RBSAssertion);
    v18 = +[RBSTarget targetWithPid:v4];
    v24 = v16;
    v19 = +[NSArray arrayWithObjects:&v24 count:1];
    id v20 = [v17 initWithExplanation:@"com.apple.das.backgroundTasks" target:v18 attributes:v19];

    v14 = [[_DASAssertion alloc] initWithRBSAssertion:v20 forPid:v4];
    goto LABEL_21;
  }
LABEL_20:
  v14 = 0;
LABEL_21:

  return v14;
}

- (id)assertionForWebBrowserContinuedProcessingTask:(id)a3 targetPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (![(_DASAssertionArbiter *)self doesPID:v4 haveEntitlement:@"com.apple.developer.web-browser-engine.networking"])
  {
    unsigned int v11 = 0;
    goto LABEL_14;
  }
  v24 = [v6 launchReason];
  v25 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.dasd" name:@"ContinuousDownload"];
  id v7 = objc_alloc((Class)RBSAssertion);
  unsigned __int8 v8 = +[RBSTarget targetWithPid:v4];
  v27 = v25;
  CFStringRef v9 = +[NSArray arrayWithObjects:&v27 count:1];
  id v10 = [v7 initWithExplanation:v24 target:v8 attributes:v9];

  unsigned int v11 = [[_DASAssertion alloc] initWithRBSAssertion:v10 forPid:v4];
  uint64_t v12 = [(_DASAssertionArbiter *)self hostPIDForTarget:v4];
  if (v12)
  {
    if ([(_DASAssertionArbiter *)self doesPID:v12 haveEntitlement:@"com.apple.developer.web-browser"])
    {
      int v13 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.dasd" name:@"BackgroundDownloadHostJetsamBand"];
      id v14 = objc_alloc((Class)RBSAssertion);
      uint64_t v15 = +[RBSTarget targetWithPid:v12];
      v26 = v13;
      v16 = +[NSArray arrayWithObjects:&v26 count:1];
      id v17 = [v14 initWithExplanation:@"Assertion on networking process host" target:v15 attributes:v16];

      v18 = [[_DASAssertion alloc] initWithRBSAssertion:v17 forPid:v12];
      [(_DASAssertionArbiter *)self installHandlersForAssertion:v18];
      v19 = [(_DASAssertionArbiter *)self assertionAssociations];
      objc_sync_enter(v19);
      id v20 = [(NSMutableDictionary *)self->_assertionAssociations objectForKeyedSubscript:v6];
      if (!v20)
      {
        id v20 = [[_DASAssertionAssociation alloc] initWithActivity:v6];
        [(NSMutableDictionary *)self->_assertionAssociations setObject:v20 forKeyedSubscript:v6];
      }
      objc_sync_exit(v19);

      [(_DASAssertionAssociation *)v20 trackAssertion:v18];
      [(_DASAssertionAssociation *)v20 acquireAssertions];
      v21 = v11;

      goto LABEL_13;
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000F55C8();
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000F5554();
  }
  v22 = v11;
LABEL_13:

LABEL_14:

  return v11;
}

- (BOOL)doesPID:(int)a3 haveEntitlement:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  char v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  [(_DASAssertionArbiter *)self auditTokenForPID:v4 success:&v12];
  if (v12)
  {
    v9[0] = v10;
    v9[1] = v11;
    BOOL v7 = [(_DASAssertionArbiter *)self doesAuditToken:v9 haveEntitlement:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenForPID:(SEL)a3 success:(int)a4
{
  uint64_t v6 = *(void *)&a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handlerDelegate);
  long long v10 = [WeakRetained assertionArbiter:self clientWithPID:v6];
  long long v11 = [v10 connection];

  BOOL v12 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v12) {
      sub_1000F5718();
    }
    *a5 = 1;
    [v11 auditToken];
  }
  else
  {
    if (v12) {
      sub_1000F56A4();
    }
    int v13 = +[RBSProcessIdentifier identifierWithPid:v6];
    id v18 = 0;
    id v14 = +[RBSProcessHandle handleForIdentifier:v13 error:&v18];
    id v15 = v18;
    v16 = v15;
    if (!v14 || v15)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        sub_1000F5630();
      }
      *a5 = 0;
      *(_OWORD *)retstr->var0 = 0u;
      *(_OWORD *)&retstr->var0[4] = 0u;
    }
    else
    {
      *a5 = 1;
      [v14 auditToken];
    }
  }
  return result;
}

- (BOOL)doesAuditToken:(id *)a3 haveEntitlement:(id)a4
{
  uint64_t v6 = (__CFString *)a4;
  long long v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v7;
  unsigned __int8 v8 = SecTaskCreateWithAuditToken(0, &token);
  if (v8)
  {
    CFStringRef v9 = v8;
    *(void *)token.val = 0;
    long long v10 = (void *)SecTaskCopyValueForEntitlement(v8, v6, (CFErrorRef *)&token);
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    {
      sub_1000F5838();
      if (!v10) {
        goto LABEL_10;
      }
    }
    else if (!v10)
    {
      goto LABEL_10;
    }
    if (objc_opt_respondsToSelector())
    {
      unsigned __int8 v11 = [v10 BOOLValue];
LABEL_11:
      int v13 = *(void **)token.val;
      if (*(void *)token.val)
      {
        id v14 = [*(id *)token.val code];
        log = self->_log;
        if (v14 == (id)3)
        {
          if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v17 = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "sectask entitlement check made for not-running process", v17, 2u);
          }
        }
        else if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
        {
          sub_1000F57D0();
        }
      }
      CFRelease(v9);

      goto LABEL_19;
    }
LABEL_10:
    unsigned __int8 v11 = 0;
    goto LABEL_11;
  }
  BOOL v12 = self->_log;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
    sub_1000F578C((os_log_t)v12);
  }
  unsigned __int8 v11 = 0;
LABEL_19:

  return v11;
}

- (int)hostPIDForTarget:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned __int8 v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
  id v13 = 0;
  uint64_t v6 = +[RBSProcessHandle handleForIdentifier:v5 error:&v13];
  id v7 = v13;

  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    unsigned __int8 v11 = [v6 hostProcess];
    int v10 = [v11 rbs_pid];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1000F58BC((uint64_t)v7, v3, log);
    }
    int v10 = 0;
  }

  return v10;
}

- (_DASAssertionArbiterDelegate)handlerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handlerDelegate);

  return (_DASAssertionArbiterDelegate *)WeakRetained;
}

- (void)setHandlerDelegate:(id)a3
{
}

- (NSMutableDictionary)assertionAssociations
{
  return self->_assertionAssociations;
}

- (void)setAssertionAssociations:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_assertionAssociations, 0);

  objc_destroyWeak((id *)&self->_handlerDelegate);
}

@end