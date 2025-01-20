@interface SDUnlockXPCSession
- (BOOL)checkEntitlementWithHandler:(id)a3;
- (NSString)bundleID;
- (SDUnlockXPCSesssionDelegate)delegate;
- (SFAutoUnlockDevice)enableDevice;
- (SFUnlockClientProtocol)clientProxy;
- (void)attemptAutoUnlockForSiriWithClientProxy:(id)a3;
- (void)attemptAutoUnlockWithClientProxy:(id)a3;
- (void)attemptAutoUnlockWithoutNotifyingWatchWithClientProxy:(id)a3;
- (void)authPromptInfoWithCompletionHandler:(id)a3;
- (void)authenticateUsingClientProxy:(id)a3 type:(unint64_t)a4 sessionID:(id)a5 options:(id)a6;
- (void)autoUnlockStateWithCompletionHandler:(id)a3;
- (void)canAuthenticateUsingClientProxy:(id)a3 authenticationType:(unint64_t)a4 device:(id)a5 sessionID:(id)a6;
- (void)cancelAuthenticationSessionWithID:(id)a3;
- (void)cancelAutoUnlock;
- (void)cancelAutoUnlock:(BOOL)a3;
- (void)cancelEnablingAutoUnlockForDevice:(id)a3;
- (void)clearPhoneAutoUnlockNotification:(BOOL)a3;
- (void)completeAutoUnlockWithNotification:(BOOL)a3;
- (void)disableAutoUnlockForDevice:(id)a3 completionHandler:(id)a4;
- (void)disableUnlockWithDevice:(id)a3 completionHandler:(id)a4;
- (void)disableUsingClientProxy:(id)a3 authenticationType:(unint64_t)a4 device:(id)a5 sessionID:(id)a6;
- (void)donateDeviceUnlockedWithMask:(BOOL)a3;
- (void)eligibleAutoUnlockDevicesWithCompletionHandler:(id)a3;
- (void)enableAutoUnlockWithDevice:(id)a3 passcode:(id)a4 clientProxy:(id)a5;
- (void)enableUnlockWithDevice:(id)a3 fromKey:(BOOL)a4 withPasscode:(id)a5 completionHandler:(id)a6;
- (void)enableUsingClientProxy:(id)a3 authenticationType:(unint64_t)a4 device:(id)a5 passcode:(id)a6 sessionID:(id)a7;
- (void)establishStashBagWithCompletionHandler:(id)a3;
- (void)establishStashBagWithManifest:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)listEligibleDevicesForAuthenticationType:(unint64_t)a3 completionHandler:(id)a4;
- (void)manager:(id)a3 didCompleteAuthenticationFor:(id)a4;
- (void)manager:(id)a3 didDisableAuthenticationFor:(id)a4;
- (void)manager:(id)a3 didEnableAuthenticationFor:(id)a4;
- (void)manager:(id)a3 didFailAuthenticationFor:(id)a4 error:(id)a5;
- (void)manager:(id)a3 didFailToDisableDeviceFor:(id)a4 error:(id)a5;
- (void)manager:(id)a3 didFailToEnableDeviceFor:(id)a4 error:(id)a5;
- (void)manager:(id)a3 didReceiveApproveRequestFor:(id)a4 info:(id)a5;
- (void)manager:(id)a3 didStartAuthenticationFor:(id)a4;
- (void)notifyDelegate;
- (void)prewarmAutoUnlock;
- (void)registerForApprovalRequestsUsingClientProxy:(id)a3 forType:(unint64_t)a4;
- (void)repairCloudPairing;
- (void)reportUserApprovalWithACMToken:(id)a3 error:(id)a4 sessionID:(id)a5;
- (void)requestEnablementUsingClientProxy:(id)a3 authenticationType:(unint64_t)a4 device:(id)a5 sessionID:(id)a6;
- (void)requestRelock;
- (void)session:(id)a3 didBeginAttemptWithDevice:(id)a4;
- (void)session:(id)a3 didCompleteUnlockWithDevice:(id)a4;
- (void)session:(id)a3 didEnableWithDevice:(id)a4;
- (void)session:(id)a3 didFailToEnableDevice:(id)a4 error:(id)a5;
- (void)session:(id)a3 didFailUnlockWithResults:(id)a4 error:(id)a5 incrementedAttempt:(BOOL)a6;
- (void)session:(id)a3 didReceiveKeyDeviceLocked:(id)a4;
- (void)setBundleID:(id)a3;
- (void)setClientProxy:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableDevice:(id)a3;
- (void)startObservingAuthentationStateChangesWithObserver:(id)a3 forIdentifier:(id)a4;
- (void)stopObservingAuthentationStateChangesForIdentifier:(id)a3;
- (void)unlockEnabledWithDevice:(id)a3 completionHandler:(id)a4;
- (void)unlockStateForDevice:(id)a3 completionHandler:(id)a4;
@end

@implementation SDUnlockXPCSession

- (void)invalidate
{
  v3 = [(SDUnlockXPCSession *)self clientProxy];

  if (v3)
  {
    v4 = +[SDAutoUnlockSessionManager sharedManager];
    [v4 cancelEnablingAllDevices];

    [(SDUnlockXPCSession *)self cancelAutoUnlock:0];
    v5 = +[SDAuthenticationManager shared];
    [v5 handleDelegateInvalidated];
  }

  [(SDUnlockXPCSession *)self notifyDelegate];
}

- (void)repairCloudPairing
{
  id v2 = +[SDAutoUnlockSessionManager sharedManager];
  [v2 repairCloudPairing];
}

- (void)eligibleAutoUnlockDevicesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    v5 = [(SDUnlockXPCSession *)self bundleID];
    id location = 0;
    objc_initWeak(&location, self);
    v6 = +[SDAutoUnlockSessionManager sharedManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000CAF80;
    v9[3] = &unk_1008CC8E8;
    id v10 = v4;
    objc_copyWeak(&v11, &location);
    [v6 eligibleDevicesRequestFromBundleID:v5 withCompletionHandler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    CFStringRef v14 = @"This process does not have permission to perform this action";
    v7 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    v8 = +[NSError errorWithDomain:SFAutoUnlockErrorDomain code:111 userInfo:v7];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)enableAutoUnlockWithDevice:(id)a3 passcode:(id)a4 clientProxy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    [(SDUnlockXPCSession *)self setEnableDevice:v8];
    [(SDUnlockXPCSession *)self setClientProxy:v10];

    id v11 = auto_unlock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Adding observer for enabling device %@", (uint8_t *)&v16, 0xCu);
    }

    v12 = +[SDAutoUnlockSessionManager sharedManager];
    [v12 registerObserver:self];

    NSErrorUserInfoKey v13 = +[SDAutoUnlockSessionManager sharedManager];
    [v13 enableAutoUnlockWithDevice:v8 passcode:v9];
  }
  else
  {
    uint64_t v14 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    CFStringRef v19 = @"This process does not have permission to perform this action";
    v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    NSErrorUserInfoKey v13 = +[NSError errorWithDomain:v14 code:111 userInfo:v15];

    [v10 failedToEnableDevice:v8 error:v13];
    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)cancelEnablingAutoUnlockForDevice:(id)a3
{
  id v5 = a3;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    id v4 = +[SDAutoUnlockSessionManager sharedManager];
    [v4 cancelEnablingAutoUnlockForDevice:v5];
  }
}

- (void)disableAutoUnlockForDevice:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:v7])
  {
    id location = 0;
    objc_initWeak(&location, self);
    id v8 = +[SDAutoUnlockSessionManager sharedManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000CB358;
    v9[3] = &unk_1008CC910;
    id v10 = v7;
    objc_copyWeak(&v11, &location);
    [v8 disableAutoUnlockForDevice:v6 completionHandler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)prewarmAutoUnlock
{
  id v2 = +[SDAutoUnlockSessionManager sharedManager];
  [v2 prewarmAutoUnlock];
}

- (void)donateDeviceUnlockedWithMask:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[SDAutoUnlockSessionManager sharedManager];
  [v4 donateDeviceUnlockedWithMask:v3];
}

- (void)clearPhoneAutoUnlockNotification:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[SDAutoUnlockSessionManager sharedManager];
  [v4 clearPhoneAutoUnlockNotification:v3];
}

- (void)completeAutoUnlockWithNotification:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[SDAutoUnlockSessionManager sharedManager];
  [v4 completeAutoUnlockWithNotification:v3];
}

- (void)attemptAutoUnlockWithClientProxy:(id)a3
{
  id v4 = a3;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    [(SDUnlockXPCSession *)self setClientProxy:v4];
    id v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding observer for auto unlock attempt %@", (uint8_t *)&v10, 0xCu);
    }

    id v6 = +[SDAutoUnlockSessionManager sharedManager];
    [v6 registerObserver:self];

    id v7 = +[SDAutoUnlockSessionManager sharedManager];
    [v7 attemptAutoUnlockForType:1];
  }
  else
  {
    uint64_t v8 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    CFStringRef v13 = @"This process does not have permission to perform this action";
    id v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v7 = +[NSError errorWithDomain:v8 code:111 userInfo:v9];

    [v4 failedUnlockWithError:v7];
    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)attemptAutoUnlockWithoutNotifyingWatchWithClientProxy:(id)a3
{
  id v4 = a3;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    [(SDUnlockXPCSession *)self setClientProxy:v4];
    id v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding observer for auto unlock attempt without notifying watch %@", (uint8_t *)&v10, 0xCu);
    }

    id v6 = +[SDAutoUnlockSessionManager sharedManager];
    [v6 registerObserver:self];

    id v7 = +[SDAutoUnlockSessionManager sharedManager];
    [v7 attemptAutoUnlockWithoutNotifyingWatch];
  }
  else
  {
    uint64_t v8 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    CFStringRef v13 = @"This process does not have permission to perform this action";
    id v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v7 = +[NSError errorWithDomain:v8 code:111 userInfo:v9];

    [v4 failedUnlockWithError:v7];
    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)attemptAutoUnlockForSiriWithClientProxy:(id)a3
{
  id v4 = a3;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    [(SDUnlockXPCSession *)self setClientProxy:v4];
    id v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding observer for auto unlock attempt for Siri %@", (uint8_t *)&v10, 0xCu);
    }

    id v6 = +[SDAutoUnlockSessionManager sharedManager];
    [v6 registerObserver:self];

    id v7 = +[SDAutoUnlockSessionManager sharedManager];
    [v7 attemptAutoUnlockForSiri];
  }
  else
  {
    uint64_t v8 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    CFStringRef v13 = @"This process does not have permission to perform this action";
    id v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v7 = +[NSError errorWithDomain:v8 code:111 userInfo:v9];

    [v4 failedUnlockWithError:v7];
    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)cancelAutoUnlock
{
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    [(SDUnlockXPCSession *)self cancelAutoUnlock:1];
  }
  else
  {
    BOOL v3 = auto_unlock_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancel Auto Unlock: This process does not have permission to perform this action", v4, 2u);
    }

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)cancelAutoUnlock:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[SDAutoUnlockSessionManager sharedManager];
  [v5 cancelAutoUnlock];

  if (v3)
  {
    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)requestRelock
{
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    id v4 = +[SDAutoUnlockSessionManager sharedManager];
    [v4 requestRelock];
  }
  else
  {
    BOOL v3 = auto_unlock_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request relock Auto Unlock: This process does not have permission to perform this action", buf, 2u);
    }

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)autoUnlockStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    id v5 = +[SDAutoUnlockSessionManager sharedManager];
    [v5 autoUnlockStateWithCompletionHandler:v4];

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
  else
  {
    uint64_t v6 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    CFStringRef v10 = @"This process does not have permission to perform this action";
    id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    uint64_t v8 = +[NSError errorWithDomain:v6 code:111 userInfo:v7];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)authPromptInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    id v5 = +[SDAutoUnlockSessionManager sharedManager];
    [v5 authPromptInfoWithCompletionHandler:v4];

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
  else
  {
    uint64_t v6 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    CFStringRef v10 = @"This process does not have permission to perform this action";
    id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    uint64_t v8 = +[NSError errorWithDomain:v6 code:111 userInfo:v7];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)notifyDelegate
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(SDUnlockXPCSesssionDelegate *)delegate unlockSessionDidFinish:self];
  }
}

- (void)session:(id)a3 didReceiveKeyDeviceLocked:(id)a4
{
  id v5 = a4;
  id v6 = [(SDUnlockXPCSession *)self clientProxy];
  [v6 keyDeviceLocked:v5];
}

- (void)session:(id)a3 didEnableWithDevice:(id)a4
{
  id v11 = a4;
  id v5 = [(SDUnlockXPCSession *)self enableDevice];
  id v6 = [v5 uniqueID];
  id v7 = [v11 uniqueID];
  unsigned int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    NSErrorUserInfoKey v9 = [(SDUnlockXPCSession *)self clientProxy];
    [v9 enabledDevice:v11];

    CFStringRef v10 = +[SDAutoUnlockSessionManager sharedManager];
    [v10 unregisterObserver:self];

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)session:(id)a3 didFailToEnableDevice:(id)a4 error:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  unsigned int v8 = [(SDUnlockXPCSession *)self enableDevice];
  NSErrorUserInfoKey v9 = [v8 uniqueID];
  CFStringRef v10 = [v14 uniqueID];
  unsigned int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    NSErrorUserInfoKey v12 = [(SDUnlockXPCSession *)self clientProxy];
    [v12 failedToEnableDevice:v14 error:v7];

    CFStringRef v13 = +[SDAutoUnlockSessionManager sharedManager];
    [v13 unregisterObserver:self];

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)session:(id)a3 didBeginAttemptWithDevice:(id)a4
{
  id v5 = a4;
  id v6 = auto_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(SDUnlockXPCSession *)self clientProxy];
    int v9 = 138412290;
    CFStringRef v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Began: Calling client proxy %@", (uint8_t *)&v9, 0xCu);
  }
  unsigned int v8 = [(SDUnlockXPCSession *)self clientProxy];
  [v8 beganAttemptWithDevice:v5];
}

- (void)session:(id)a3 didCompleteUnlockWithDevice:(id)a4
{
  id v5 = a4;
  id v6 = auto_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(SDUnlockXPCSession *)self clientProxy];
    int v10 = 138412290;
    unsigned int v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Completed: Calling client proxy %@", (uint8_t *)&v10, 0xCu);
  }
  unsigned int v8 = [(SDUnlockXPCSession *)self clientProxy];
  [v8 completedUnlockWithDevice:v5];

  int v9 = +[SDAutoUnlockSessionManager sharedManager];
  [v9 unregisterObserver:self];

  [(SDUnlockXPCSession *)self notifyDelegate];
}

- (void)session:(id)a3 didFailUnlockWithResults:(id)a4 error:(id)a5 incrementedAttempt:(BOOL)a6
{
  id v7 = a5;
  unsigned int v8 = [(SDUnlockXPCSession *)self clientProxy];
  [v8 failedUnlockWithError:v7];

  int v9 = +[SDAutoUnlockSessionManager sharedManager];
  [v9 unregisterObserver:self];

  [(SDUnlockXPCSession *)self notifyDelegate];
}

- (void)enableUnlockWithDevice:(id)a3 fromKey:(BOOL)a4 withPasscode:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  NSErrorUserInfoKey v12 = (void (**)(id, void, void *))a6;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:v12])
  {
    if (a4)
    {
      uint64_t v13 = SFUnlockErrorDomian;
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      CFStringRef v20 = @"Enabling from the key side is not yet supported";
      id v14 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      v15 = +[NSError errorWithDomain:v13 code:111 userInfo:v14];
      v12[2](v12, 0, v15);

      [(SDUnlockXPCSession *)self notifyDelegate];
    }
    else
    {
      int v16 = +[SDUnlockLockManager sharedLockManager];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000CC568;
      v17[3] = &unk_1008CC938;
      v17[4] = self;
      NSErrorUserInfoKey v18 = v12;
      [v16 enableUnlockWithDevice:v10 passcode:v11 completionHandler:v17];
    }
  }
}

- (void)disableUnlockWithDevice:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:v7])
  {
    unsigned int v8 = +[SDUnlockKeyManager sharedKeyManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000CC684;
    v9[3] = &unk_1008CC938;
    void v9[4] = self;
    id v10 = v7;
    [v8 disableUnlockWithDevice:v6 completionHandler:v9];
  }
}

- (void)unlockEnabledWithDevice:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, id, void))a4;
  if (-[SDUnlockXPCSession checkEntitlementWithHandler:](self, "checkEntitlementWithHandler:"))
  {
    id v5 = +[SDUnlockKeyManager sharedKeyManager];
    v6[2](v6, [v5 unlockEnabled], 0);

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)establishStashBagWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:v4])
  {
    id v5 = +[SDUnlockKeyManager sharedKeyManager];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000CC81C;
    v6[3] = &unk_1008CC938;
    v6[4] = self;
    id v7 = v4;
    [v5 establishStashBagWithCompletionHandler:v6];
  }
}

- (void)establishStashBagWithManifest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:v7])
  {
    unsigned int v8 = +[SDUnlockKeyManager sharedKeyManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000CC938;
    v9[3] = &unk_1008CC938;
    void v9[4] = self;
    id v10 = v7;
    [v8 establishStashBagWithManifest:v6 completionHandler:v9];
  }
}

- (void)unlockStateForDevice:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    unsigned int v8 = +[SDUnlockKeyManager sharedKeyManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000CCB1C;
    v12[3] = &unk_1008CC960;
    v12[4] = self;
    id v13 = v7;
    [v8 unlockStateForDevice:v6 completionHandler:v12];
  }
  else
  {
    uint64_t v9 = SFUnlockErrorDomian;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    CFStringRef v15 = @"This process does not have permission to perform this action";
    id v10 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v11 = +[NSError errorWithDomain:v9 code:111 userInfo:v10];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)listEligibleDevicesForAuthenticationType:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    id v7 = +[SDAuthenticationManager shared];
    unsigned int v8 = [v7 queue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000CCC70;
    v10[3] = &unk_1008CC9B0;
    unint64_t v12 = a3;
    id v11 = v6;
    dispatch_async(v8, v10);
  }
  else
  {
    uint64_t v9 = authentications_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000CE524();
    }

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)enableUsingClientProxy:(id)a3 authenticationType:(unint64_t)a4 device:(id)a5 passcode:(id)a6 sessionID:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  int v16 = authentications_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v30 = a4;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "enableUsingClientProxy type:%lu", buf, 0xCu);
  }

  if (![(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    v17 = authentications_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000CE524();
    }

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
  [(SDUnlockXPCSession *)self setClientProxy:v12];
  NSErrorUserInfoKey v18 = +[SDAuthenticationManager shared];
  [v18 setDelegate:self];

  NSErrorUserInfoKey v19 = +[SDAuthenticationManager shared];
  CFStringRef v20 = [v19 queue];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000CCF48;
  v24[3] = &unk_1008CC9D8;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  unint64_t v28 = a4;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  dispatch_async(v20, v24);
}

- (void)requestEnablementUsingClientProxy:(id)a3 authenticationType:(unint64_t)a4 device:(id)a5 sessionID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (![(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    id v13 = authentications_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000CE524();
    }

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
  [(SDUnlockXPCSession *)self setClientProxy:v10];
  id v14 = +[SDAuthenticationManager shared];
  [v14 setDelegate:self];

  id v15 = +[SDAuthenticationManager shared];
  int v16 = [v15 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CD11C;
  block[3] = &unk_1008CBB30;
  id v21 = v12;
  unint64_t v22 = a4;
  id v20 = v11;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(v16, block);
}

- (void)disableUsingClientProxy:(id)a3 authenticationType:(unint64_t)a4 device:(id)a5 sessionID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    [(SDUnlockXPCSession *)self setClientProxy:v10];
    id v13 = +[SDAuthenticationManager shared];
    [v13 setDelegate:self];

    id v14 = +[SDAuthenticationManager shared];
    id v15 = [v14 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CD2F0;
    block[3] = &unk_1008CBB30;
    unint64_t v20 = a4;
    id v18 = v11;
    id v19 = v12;
    dispatch_async(v15, block);
  }
  else
  {
    int v16 = authentications_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000CE524();
    }

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)canAuthenticateUsingClientProxy:(id)a3 authenticationType:(unint64_t)a4 device:(id)a5 sessionID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (![(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    id v13 = authentications_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000CE524();
    }

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
  [(SDUnlockXPCSession *)self setClientProxy:v10];
  id v14 = +[SDAuthenticationManager shared];
  [v14 setDelegate:self];

  id v15 = +[SDAuthenticationManager shared];
  int v16 = [v15 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CD4C4;
  block[3] = &unk_1008CBB30;
  id v21 = v12;
  unint64_t v22 = a4;
  id v20 = v11;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(v16, block);
}

- (void)authenticateUsingClientProxy:(id)a3 type:(unint64_t)a4 sessionID:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    [(SDUnlockXPCSession *)self setClientProxy:v10];
    id v13 = +[SDAuthenticationManager shared];
    [v13 setDelegate:self];

    id v14 = +[SDAuthenticationManager shared];
    id v15 = [v14 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CD698;
    block[3] = &unk_1008CBB30;
    unint64_t v20 = a4;
    id v18 = v11;
    id v19 = v12;
    dispatch_async(v15, block);
  }
  else
  {
    int v16 = authentications_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000CE524();
    }

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)cancelAuthenticationSessionWithID:(id)a3
{
  id v4 = a3;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    id v5 = +[SDAuthenticationManager shared];
    id v6 = [v5 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CD7FC;
    block[3] = &unk_1008CA4B8;
    id v9 = v4;
    dispatch_async(v6, block);
  }
  else
  {
    id v7 = authentications_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000CE524();
    }

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)registerForApprovalRequestsUsingClientProxy:(id)a3 forType:(unint64_t)a4
{
  id v6 = a3;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    [(SDUnlockXPCSession *)self setClientProxy:v6];
    id v7 = +[SDAuthenticationManager shared];
    [v7 setDelegate:self];

    unsigned int v8 = +[SDAuthenticationManager shared];
    id v9 = [v8 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CD980;
    block[3] = &unk_1008CB370;
    void block[4] = a4;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = authentications_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000CE524();
    }

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)startObservingAuthentationStateChangesWithObserver:(id)a3 forIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SDAuthenticationManager shared];
  unsigned int v8 = [v7 queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000CDABC;
  v11[3] = &unk_1008CA640;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

- (void)stopObservingAuthentationStateChangesForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[SDAuthenticationManager shared];
  id v5 = [v4 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CDBD8;
  block[3] = &unk_1008CA4B8;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

- (void)reportUserApprovalWithACMToken:(id)a3 error:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(SDUnlockXPCSession *)self checkEntitlementWithHandler:0])
  {
    id v11 = +[SDAuthenticationManager shared];
    id v12 = [v11 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CDD80;
    block[3] = &unk_1008CAF18;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(v12, block);
  }
  else
  {
    id v13 = authentications_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000CE524();
    }

    [(SDUnlockXPCSession *)self notifyDelegate];
  }
}

- (void)manager:(id)a3 didEnableAuthenticationFor:(id)a4
{
  id v5 = a4;
  id v6 = [(SDUnlockXPCSession *)self clientProxy];
  [v6 enabledAuthenticationSessionWithID:v5];

  id v7 = +[SDAuthenticationManager shared];
  [v7 setDelegate:0];

  [(SDUnlockXPCSession *)self notifyDelegate];
}

- (void)manager:(id)a3 didDisableAuthenticationFor:(id)a4
{
  id v5 = a4;
  id v6 = [(SDUnlockXPCSession *)self clientProxy];
  [v6 disabledAuthenticationSessionWithID:v5];

  id v7 = +[SDAuthenticationManager shared];
  [v7 setDelegate:0];

  [(SDUnlockXPCSession *)self notifyDelegate];
}

- (void)manager:(id)a3 didCompleteAuthenticationFor:(id)a4
{
  id v5 = a4;
  id v6 = [(SDUnlockXPCSession *)self clientProxy];
  [v6 completedAuthenticationSessionWithID:v5];

  id v7 = +[SDAuthenticationManager shared];
  [v7 setDelegate:0];

  [(SDUnlockXPCSession *)self notifyDelegate];
}

- (void)manager:(id)a3 didFailToEnableDeviceFor:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SDUnlockXPCSession *)self clientProxy];
  [v9 failedToEnableDeviceForSessionID:v8 error:v7];

  id v10 = +[SDAuthenticationManager shared];
  [v10 setDelegate:0];

  [(SDUnlockXPCSession *)self notifyDelegate];
}

- (void)manager:(id)a3 didFailToDisableDeviceFor:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SDUnlockXPCSession *)self clientProxy];
  [v9 failedToDisableDeviceForSessionID:v8 error:v7];

  id v10 = +[SDAuthenticationManager shared];
  [v10 setDelegate:0];

  [(SDUnlockXPCSession *)self notifyDelegate];
}

- (void)manager:(id)a3 didFailAuthenticationFor:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SDUnlockXPCSession *)self clientProxy];
  [v9 failedAuthenticationSessionWithID:v8 error:v7];

  id v10 = +[SDAuthenticationManager shared];
  [v10 setDelegate:0];

  [(SDUnlockXPCSession *)self notifyDelegate];
}

- (void)manager:(id)a3 didStartAuthenticationFor:(id)a4
{
  id v5 = a4;
  id v6 = [(SDUnlockXPCSession *)self clientProxy];
  [v6 startedAuthenticationSessionWithID:v5];
}

- (void)manager:(id)a3 didReceiveApproveRequestFor:(id)a4 info:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SDUnlockXPCSession *)self clientProxy];
  [v9 receivedApproveRequestForSessionID:v8 info:v7];
}

- (BOOL)checkEntitlementWithHandler:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = +[NSXPCConnection currentConnection];
  unsigned __int8 v6 = [v5 _connectionHasEntitlement:@"com.apple.private.sharing.unlock-manager"];

  if (v6)
  {
    id v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(SDUnlockXPCSession *)self bundleID];
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Client bundle ID: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    id v9 = paired_unlock_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000CE558(self, v9);
    }

    if (v4)
    {
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      CFStringRef v16 = @"This process does not have permission to perform this action";
      id v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      id v11 = +[NSError errorWithDomain:@"SFUnlockErrorDomian" code:111 userInfo:v10];
      v4[2](v4, 0, v11);

      [(SDUnlockXPCSession *)self notifyDelegate];
    }
  }

  return v6;
}

- (NSString)bundleID
{
  bundleID = self->_bundleID;
  if (!bundleID)
  {
    id v4 = +[NSXPCConnection currentConnection];
    id v5 = [v4 _xpcConnection];
    sub_1001B3F50(v5);
    unsigned __int8 v6 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      id v7 = +[NSXPCConnection currentConnection];
      unsigned __int8 v6 = [v7 valueForEntitlement:@"application-identifier"];
    }
    id v8 = self->_bundleID;
    self->_bundleID = v6;

    bundleID = self->_bundleID;
  }

  return bundleID;
}

- (SDUnlockXPCSesssionDelegate)delegate
{
  return (SDUnlockXPCSesssionDelegate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDelegate:(id)a3
{
}

- (void)setBundleID:(id)a3
{
}

- (SFUnlockClientProtocol)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
}

- (SFAutoUnlockDevice)enableDevice
{
  return self->_enableDevice;
}

- (void)setEnableDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableDevice, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end