@interface KeychainItemUpgradeRequestController
- (BOOL)haveRecordedDate;
- (CKKSLockStateTracker)lockStateTracker;
- (CKKSNearFutureScheduler)persistentReferenceUpgrader;
- (KeychainItemUpgradeRequestController)initWithLockStateTracker:(id)a3;
- (OS_dispatch_queue)queue;
- (OctagonStateMachine)stateMachine;
- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5;
- (void)setHaveRecordedDate:(BOOL)a3;
- (void)setLockStateTracker:(id)a3;
- (void)setPersistentReferenceUpgrader:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)triggerKeychainItemUpdateRPC:(id)a3;
@end

@implementation KeychainItemUpgradeRequestController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_persistentReferenceUpgrader, 0);

  objc_storeStrong((id *)&self->_stateMachine, 0);
}

- (void)setHaveRecordedDate:(BOOL)a3
{
  self->_haveRecordedDate = a3;
}

- (BOOL)haveRecordedDate
{
  return self->_haveRecordedDate;
}

- (void)setLockStateTracker:(id)a3
{
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPersistentReferenceUpgrader:(id)a3
{
}

- (CKKSNearFutureScheduler)persistentReferenceUpgrader
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStateMachine:(id)a3
{
}

- (OctagonStateMachine)stateMachine
{
  return (OctagonStateMachine *)objc_getProperty(self, a2, 16, 1);
}

- (void)triggerKeychainItemUpdateRPC:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = [(KeychainItemUpgradeRequestController *)self stateMachine];
  [v5 startOperation];

  v6 = [(KeychainItemUpgradeRequestController *)self lockStateTracker];

  if (v6)
  {
    v7 = [(KeychainItemUpgradeRequestController *)self lockStateTracker];
    [v7 recheck];
  }
  v8 = +[OctagonStateTransitionOperation named:@"upgrade-persistent-ref" entering:@"upgrade_persistent_ref"];
  CFStringRef v15 = @"nothing_to_do";
  v9 = +[NSArray arrayWithObjects:&v15 count:1];
  v10 = +[NSSet setWithArray:v9];

  v11 = [OctagonStateTransitionRequest alloc];
  v12 = [(KeychainItemUpgradeRequestController *)self queue];
  id v13 = [(OctagonStateTransitionRequest *)v11 init:@"request-item-upgrade" sourceStates:v10 serialQueue:v12 transitionOp:v8];

  v14 = [(KeychainItemUpgradeRequestController *)self stateMachine];
  [v14 handleExternalRequest:v13 startTimeout:10000000000];

  v4[2](v4, 0);
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(KeychainItemUpgradeRequestController *)self queue];
  dispatch_assert_queue_V2(v11);

  if ([v8 isEqualToString:@"wait_for_unlock"])
  {
    v12 = sub_10000B070("keychainitemupgrade");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "waiting for unlock before continuing with state machine", (uint8_t *)&buf, 2u);
    }

    id v13 = +[OctagonStateTransitionOperation named:@"wait-for-unlock" entering:@"nothing_to_do"];
    v14 = [(KeychainItemUpgradeRequestController *)self lockStateTracker];
    CFStringRef v15 = [(OctagonPendingFlag *)v14 unlockDependency];
    [v13 addNullableDependency:v15];

LABEL_5:
    goto LABEL_29;
  }
  if ([v8 isEqualToString:@"upgrade_persistent_ref"])
  {
    v16 = sub_10000B070("keychainitemupgrade");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "upgrading persistent refs", (uint8_t *)&buf, 2u);
    }

    CFTypeRef cf = 0;
    v37[0] = 0;
    unsigned __int8 v35 = 0;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2000000000;
    char v42 = 0;
    v37[1] = v37;
    v37[2] = 0x2000000000;
    uint64_t v38 = 0;
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 0x40000000;
    v44 = sub_10014448C;
    v45 = &unk_100303E70;
    v46 = v37;
    v47 = &v39;
    v48 = &v35;
    p_CFTypeRef cf = &cf;
    sub_10000CBA4(1, 1, 0, (uint64_t)&v38, (uint64_t)&buf);
    _Block_object_dispose(v37, 8);
    int v17 = *((unsigned __int8 *)v40 + 24);
    _Block_object_dispose(&v39, 8);
    v18 = [(KeychainItemUpgradeRequestController *)self lockStateTracker];
    unsigned int v19 = [v18 isLockedError:cf];

    if (v19)
    {
      v14 = [[OctagonPendingFlag alloc] initWithFlag:@"schedule_pref_upgrade" conditions:1];
      [v10 _onqueueHandlePendingFlagLater:v14];
      id v13 = +[OctagonStateTransitionOperation named:@"after-upgrade--attempt-wait-for-unlock" entering:@"wait_for_unlock"];
      CFTypeRef v20 = cf;
      if (cf)
      {
        CFTypeRef cf = 0;
        CFRelease(v20);
      }
      goto LABEL_5;
    }
    int v23 = v35;
    if (v35 && !cf) {
      goto LABEL_21;
    }
    if (cf) {
      BOOL v27 = 1;
    }
    else {
      BOOL v27 = v17 == 0;
    }
    char v28 = !v27;
    v29 = sub_10000B070("keychainitemupgrade");
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    if (!v23 || (v28 & 1) != 0)
    {
      if (v30)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "finished upgrading items!", (uint8_t *)&buf, 2u);
      }

      CFStringRef v32 = @"nothing-to-do";
      CFStringRef v33 = @"nothing_to_do";
    }
    else
    {
      if (v30)
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = cf;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "hit an error, triggering CKKSNFS: %@", (uint8_t *)&buf, 0xCu);
      }

      v31 = [(KeychainItemUpgradeRequestController *)self persistentReferenceUpgrader];
      [v31 trigger];

      CFStringRef v32 = @"wait-for-trigger";
      CFStringRef v33 = @"wait_for_trigger";
    }
    id v13 = +[OctagonStateTransitionOperation named:v32 entering:v33];
    CFTypeRef v34 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v34);
    }
  }
  else
  {
    if ([v8 isEqualToString:@"wait_for_trigger"])
    {
      v21 = sub_10000B070("keychainitemupgrade");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "waiting for trigger to occur", (uint8_t *)&buf, 2u);
      }

      if ([v9 _onqueueContains:@"schedule_pref_upgrade"])
      {
        [v9 _onqueueRemoveFlag:@"schedule_pref_upgrade"];
        v22 = sub_10000B070("keychainitemupgrade");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "handling persistent ref flag, attempting to upgrade next batch", (uint8_t *)&buf, 2u);
        }

LABEL_21:
        id v13 = +[OctagonStateTransitionOperation named:@"upgrade-persistent-refs" entering:@"upgrade_persistent_ref"];
        goto LABEL_29;
      }
    }
    else if ([v8 isEqualToString:@"nothing_to_do"])
    {
      v24 = [(KeychainItemUpgradeRequestController *)self persistentReferenceUpgrader];
      [v24 cancel];

      if ([v9 _onqueueContains:@"schedule_pref_upgrade"]) {
        [v9 _onqueueRemoveFlag:@"schedule_pref_upgrade"];
      }
      v25 = sub_10000B070("keychainitemupgrade");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "nothing to do", (uint8_t *)&buf, 2u);
      }
    }
    id v13 = 0;
  }
LABEL_29:

  return v13;
}

- (KeychainItemUpgradeRequestController)initWithLockStateTracker:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)KeychainItemUpgradeRequestController;
  v6 = [(KeychainItemUpgradeRequestController *)&v23 init];
  if (v6)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("KeychainItemUpgradeControllerQueue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_lockStateTracker, a3);
    id v10 = [OctagonStateMachine alloc];
    v25[0] = @"nothing_to_do";
    v25[1] = @"wait_for_unlock";
    v26[0] = &off_100326788;
    v26[1] = &off_1003267A0;
    v25[2] = @"upgrade_persistent_ref";
    v25[3] = @"wait_for_trigger";
    v26[2] = &off_1003267B8;
    v26[3] = &off_1003267D0;
    v11 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
    CFStringRef v24 = @"schedule_pref_upgrade";
    v12 = +[NSArray arrayWithObjects:&v24 count:1];
    id v13 = +[NSSet setWithArray:v12];
    v14 = [(OctagonStateMachine *)v10 initWithName:@"keychainitemupgrade" states:v11 flags:v13 initialState:@"upgrade_persistent_ref" queue:v6->_queue stateEngine:v6 unexpectedStateErrorDomain:@"com.apple.security.keychainitemupgrade.state" lockStateTracker:v5 reachabilityTracker:0];
    stateMachine = v6->_stateMachine;
    v6->_stateMachine = v14;

    v16 = [CKKSNearFutureScheduler alloc];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001CFDE8;
    v20[3] = &unk_1003077A0;
    objc_copyWeak(&v21, &location);
    int v17 = [(CKKSNearFutureScheduler *)v16 initWithName:@"persistent-ref-upgrader" initialDelay:5000000000 exponentialBackoff:300000000000 maximumDelay:0 keepProcessAlive:0 dependencyDescriptionCode:v20 block:2.0];
    persistentReferenceUpgrader = v6->_persistentReferenceUpgrader;
    v6->_persistentReferenceUpgrader = v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v6;
}

@end