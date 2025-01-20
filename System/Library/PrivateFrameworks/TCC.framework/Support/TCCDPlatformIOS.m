@interface TCCDPlatformIOS
- (BOOL)_displaySBRemoteAlert:(id)a3;
- (BOOL)_handleSBRemoteAlert:(id)a3;
- (BOOL)_isDeviceLocked;
- (BOOL)_isSBRemoteAlert:(id)a3;
- (BOOL)_isSBRemoteAlertAvailable;
- (BOOL)displayAlert:(id)a3;
- (OS_dispatch_queue)alertQueue;
- (OS_dispatch_semaphore)alertSemaphore;
- (TCCDPlatformIOS)initWithName:(id)a3;
- (id)_getProcIdForSBRemoteAlert:(id)a3;
- (id)hangAssertionForClientWithPid:(int)a3;
- (void)_configureServices;
- (void)_waitForDeviceUnlock;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setAlertQueue:(id)a3;
- (void)setAlertSemaphore:(id)a3;
@end

@implementation TCCDPlatformIOS

- (TCCDPlatformIOS)initWithName:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TCCDPlatformIOS;
  v3 = [(TCCDPlatform *)&v7 initWithName:a3];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.tccd.PlatformIOSAlert", 0);
    alertQueue = v3->_alertQueue;
    v3->_alertQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)_configureServices
{
  v12.receiver = self;
  v12.super_class = (Class)TCCDPlatformIOS;
  [(TCCDPlatform *)&v12 _configureServices];
  v3 = [(TCCDPlatform *)self servicesByName];
  dispatch_queue_t v4 = [v3 objectForKeyedSubscript:@"kTCCServiceAddressBook"];
  objc_msgSend(v4, "setIos_watchKitUserNotificationNumber:", &off_10009D2B8);
  v5 = [v3 objectForKeyedSubscript:@"kTCCServiceContactsLimited"];

  objc_msgSend(v5, "setIos_watchKitUserNotificationNumber:", &off_10009D2B8);
  v6 = [v3 objectForKeyedSubscript:@"kTCCServiceContactsFull"];

  objc_msgSend(v6, "setIos_watchKitUserNotificationNumber:", &off_10009D2B8);
  objc_super v7 = [v3 objectForKeyedSubscript:@"kTCCServiceCalendar"];

  objc_msgSend(v7, "setIos_watchKitUserNotificationNumber:", &off_10009D2D0);
  v8 = [v3 objectForKeyedSubscript:@"kTCCServiceReminders"];

  objc_msgSend(v8, "setIos_watchKitUserNotificationNumber:", &off_10009D2E8);
  v9 = [v3 objectForKeyedSubscript:@"kTCCServicePhotos"];

  objc_msgSend(v9, "setIos_watchKitUserNotificationNumber:", &off_10009D300);
  v10 = [v3 objectForKeyedSubscript:@"kTCCServicePhotosAdd"];

  objc_msgSend(v10, "setIos_watchKitUserNotificationNumber:", &off_10009D300);
  v11 = [v3 objectForKeyedSubscript:@"kTCCServiceMicrophone"];

  objc_msgSend(v11, "setIos_watchKitUserNotificationNumber:", &off_10009D318);
}

- (BOOL)_isDeviceLocked
{
  return MKBGetDeviceLockState() - 1 < 2;
}

- (void)_waitForDeviceUnlock
{
  int out_token = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  dispatch_queue_t v4 = [(TCCDPlatformIOS *)self alertQueue];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100055B20;
  handler[3] = &unk_100096968;
  objc_copyWeak(&v15, &location);
  v5 = v3;
  v14 = v5;
  notify_register_dispatch("com.apple.springboard.lockstate", &out_token, v4, handler);

  if ([(TCCDPlatformIOS *)self _isDeviceLocked])
  {
    v6 = [(TCCDPlatform *)self server];
    objc_super v7 = [v6 logHandle];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Remote Alert: Device locked; waiting for unlock...",
        v12,
        2u);
    }
  }
  else
  {
    v8 = [(TCCDPlatform *)self server];
    v9 = [v8 logHandle];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Remote Alert: Device is not actually locked.", v12, 2u);
    }

    notify_cancel(out_token);
    dispatch_semaphore_signal(v5);
  }
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v10 = [(TCCDPlatform *)self server];
  v11 = [v10 logHandle];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Remote Alert: Device unlocked.", v12, 2u);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (BOOL)_isSBRemoteAlert:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = [v3 configuration];
  v5 = [v4 objectForKeyedSubscript:@"TCCDAlertConfig_SBRemoteAlertServiceName"];
  if (v5)
  {
    v6 = [v3 configuration];
    objc_super v7 = [v6 objectForKeyedSubscript:@"TCCDAlertConfig_SBRemoteAlertViewControllerClassName"];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_isSBRemoteAlertAvailable
{
  if (qword_1000AC798 != -1) {
    dispatch_once(&qword_1000AC798, &stru_100096988);
  }
  return byte_1000AC7A0;
}

- (id)_getProcIdForSBRemoteAlert:(id)a3
{
  dispatch_queue_t v4 = [a3 configuration];
  v5 = [v4 objectForKeyedSubscript:@"TCCDAlertConfig_SBRemoteAlertServiceName"];

  id v13 = 0;
  id v6 = [objc_alloc((Class)LSApplicationIdentity) initWithBundleIdentifier:v5 allowPlaceholder:0 personaUniqueString:&stru_100096EC0 error:&v13];
  id v7 = v13;
  if (v7)
  {
    BOOL v8 = [(TCCDPlatform *)self server];
    v9 = [v8 logHandle];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v7 description];
      *(_DWORD *)buf = 138543618;
      id v15 = v5;
      __int16 v16 = 2114;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remote Alert: failed to get identifier for second-stage prompt, bundleID=%{public}@, error=%{public}@", buf, 0x16u);
    }
  }
  v11 = +[RBSProcessIdentity identityForLSApplicationIdentity:v6];

  return v11;
}

- (BOOL)_displaySBRemoteAlert:(id)a3
{
  id v4 = a3;
  v5 = [(TCCDPlatform *)self server];
  id v6 = [v5 logHandle];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v4 service];
    BOOL v8 = [v7 name];
    v9 = [v4 configuration];
    *(_DWORD *)buf = 138543618;
    v57 = v8;
    __int16 v58 = 2114;
    v59 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Remote Alert: creating for %{public}@, with config: %{public}@", buf, 0x16u);
  }
  if ([v4 condition] != (id)2)
  {
    id v21 = objc_alloc((Class)SBSRemoteAlertDefinition);
    v19 = [v4 configuration];
    v22 = [v19 objectForKeyedSubscript:@"TCCDAlertConfig_SBRemoteAlertServiceName"];
    id v12 = [v4 configuration];
    v23 = [v12 objectForKeyedSubscript:@"TCCDAlertConfig_SBRemoteAlertViewControllerClassName"];
    v20 = [v21 initWithServiceName:v22 viewControllerClassName:v23];

    id v13 = 0;
    LODWORD(v12) = 0;
LABEL_7:

    if (!v20)
    {
      v33 = [(TCCDPlatform *)self server];
      v34 = [v33 logHandle];

      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_100056FC4();
      }
      BOOL v27 = 0;
      v20 = v13;
      goto LABEL_34;
    }
    id v24 = +[SBSRemoteAlertHandle newHandleWithDefinition:v20 configurationContext:0];
    if (!v24)
    {
      v35 = [(TCCDPlatform *)self server];
      v36 = [v35 logHandle];

      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_100056FF8();
      }
      BOOL v27 = 0;
      goto LABEL_33;
    }
    id v25 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
    v26 = v25;
    BOOL v27 = v25 != 0;
    if (v25)
    {
      unsigned int v52 = v12;
      [v25 setActivatingForSiri:0];
      v53 = v24;
      if ([v4 condition] == (id)2)
      {
        v51 = +[SBSRemoteAlertPresentationTargetPredicate predicateForProcess:v13];
        id v28 = [objc_alloc((Class)SBSRemoteAlertPresentationTarget) initWithTargetPredicate:v51];
        [v28 setShouldDismissInSwitcher:0];
        [v26 setPresentationTarget:v28];
        v29 = [v4 customUserInfo];
        [v26 setUserInfo:v29];

        v30 = [v4 service];
        v31 = [v30 name];
        v32 = +[NSString stringWithFormat:@"Secondary Prompt for %@", v31];
        [v26 setReason:v32];

        id v24 = v53;
      }
      else
      {
        CFStringRef v54 = @"TCC Service";
        v39 = [v4 service];
        v40 = [v39 name];
        v55 = v40;
        v41 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        [v26 setUserInfo:v41];

        [v26 setReason:@"TCC 3 Rights prompt first time"];
      }
      [v24 addObserver:self];
      dispatch_semaphore_t v42 = dispatch_semaphore_create(0);
      [(TCCDPlatformIOS *)self setAlertSemaphore:v42];

      v36 = 0;
      if ([v4 condition] == (id)2)
      {
        v36 = [(TCCDPlatformIOS *)self hangAssertionForClientWithPid:v52];
      }
      v43 = [(TCCDPlatform *)self server];
      v44 = [v43 logHandle];

      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        v45 = [v4 service];
        v46 = [v45 name];
        *(_DWORD *)buf = 138543618;
        v57 = v46;
        __int16 v58 = 2114;
        v59 = v53;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Remote Alert: activating for %{public}@: %{public}@", buf, 0x16u);
      }
      id v24 = v53;
      [v53 activateWithContext:v26];
      v47 = [(TCCDPlatformIOS *)self alertSemaphore];

      if (!v47) {
        goto LABEL_32;
      }
      v48 = [(TCCDPlatformIOS *)self alertSemaphore];
      dispatch_semaphore_wait(v48, 0xFFFFFFFFFFFFFFFFLL);

      [(TCCDPlatformIOS *)self setAlertSemaphore:0];
      if (!v36) {
        goto LABEL_32;
      }
      [v36 invalidate];
      v49 = [(TCCDPlatform *)self server];
      v38 = [v49 logHandle];

      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v52;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "invalidated watchdog opt-out assertion for client with pid: %d", buf, 8u);
      }
    }
    else
    {
      v37 = [(TCCDPlatform *)self server];
      v38 = [v37 logHandle];

      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_10005702C();
      }
      v36 = 0;
    }

LABEL_32:
LABEL_33:

    v34 = v13;
LABEL_34:

    id v13 = v20;
    goto LABEL_35;
  }
  v10 = [v4 customUserInfo];
  v11 = [v10 objectForKeyedSubscript:@"ResponsiblePID"];
  id v12 = [v11 intValue];

  id v13 = +[BSProcessHandle processHandleForPID:v12];
  v14 = [v13 bundleIdentifier];
  id v15 = [v4 customUserInfo];
  __int16 v16 = [v15 objectForKeyedSubscript:@"BundleRequestingSecondaryPrompt"];
  unsigned int v17 = [v14 isEqualToString:v16];

  if (v17)
  {
    id v18 = objc_alloc((Class)SBSRemoteAlertDefinition);
    v19 = [(TCCDPlatformIOS *)self _getProcIdForSBRemoteAlert:v4];
    v20 = [v18 initWithSceneProvidingProcess:v19 configurationIdentifier:0];
    goto LABEL_7;
  }
  BOOL v27 = 0;
LABEL_35:

  return v27;
}

- (BOOL)_handleSBRemoteAlert:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  objc_initWeak(&location, self);
  v5 = [(TCCDPlatformIOS *)self alertQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100056778;
  v8[3] = &unk_1000969B0;
  id v9 = v4;
  id v6 = v4;
  objc_copyWeak(&v11, &location);
  v10 = &v13;
  dispatch_sync(v5, v8);

  LOBYTE(v5) = *((unsigned char *)v14 + 24);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);
  return (char)v5;
}

- (BOOL)displayAlert:(id)a3
{
  id v4 = a3;
  if ([v4 condition] != (id)1 && objc_msgSend(v4, "condition") != (id)2
    || ![(TCCDPlatformIOS *)self _isSBRemoteAlert:v4])
  {
    id v7 = [(TCCDPlatform *)self server];
    BOOL v8 = [v7 logHandle];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000570D8(v4, v8);
    }
    goto LABEL_17;
  }
  if (![(TCCDPlatformIOS *)self _isSBRemoteAlertAvailable])
  {
    CFStringRef v9 = @"SBRemoteAlert not available.";
    goto LABEL_15;
  }
  v5 = [v4 service];

  if (!v5)
  {
    CFStringRef v9 = @"missing Service";
    goto LABEL_15;
  }
  if ([v4 persistentStateValue] == -1)
  {
    CFStringRef v9 = @"Persistent state not set";
LABEL_15:
    v10 = [(TCCDPlatform *)self server];
    BOOL v8 = [v10 logHandle];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100057060((uint64_t)v9, v8);
    }
LABEL_17:

    BOOL v6 = 0;
    goto LABEL_18;
  }
  if ([(TCCDPlatformIOS *)self _isDeviceLocked]) {
    [(TCCDPlatformIOS *)self _waitForDeviceUnlock];
  }
  BOOL v6 = [(TCCDPlatformIOS *)self _handleSBRemoteAlert:v4];
LABEL_18:

  return v6;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  v5 = [(TCCDPlatform *)self server];
  BOOL v6 = [v5 logHandle];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Remote Alert: %{public}@ didActivate", (uint8_t *)&v7, 0xCu);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  v5 = [(TCCDPlatform *)self server];
  BOOL v6 = [v5 logHandle];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Remote Alert: %{public}@ didDeactivate", (uint8_t *)&v9, 0xCu);
  }

  int v7 = [(TCCDPlatformIOS *)self alertSemaphore];

  if (v7)
  {
    id v8 = [(TCCDPlatformIOS *)self alertSemaphore];
    dispatch_semaphore_signal(v8);
  }
  if ([v4 isValid]) {
    [v4 invalidate];
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TCCDPlatform *)self server];
  int v9 = [v8 logHandle];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_100057194((uint64_t)v6, (uint64_t)v7, v9);
  }

  id v10 = [(TCCDPlatformIOS *)self alertSemaphore];

  if (v10)
  {
    id v11 = [(TCCDPlatformIOS *)self alertSemaphore];
    dispatch_semaphore_signal(v11);
  }
  [v6 removeObserver:self];
}

- (id)hangAssertionForClientWithPid:(int)a3
{
  v5 = +[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:");
  if (v5)
  {
    id v6 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.frontboard" name:@"DisableWatchdog"];
    if (v6)
    {
      id v7 = objc_alloc((Class)RBSAssertion);
      v23 = v6;
      id v8 = +[NSArray arrayWithObjects:&v23 count:1];
      int v9 = [v7 initWithExplanation:@"Prevent watchdog termination while blocking on Contacts second stage prompt" target:v5 attributes:v8];

      if (v9)
      {
        id v20 = 0;
        unsigned __int8 v10 = [v9 acquireWithError:&v20];
        id v11 = v20;
        id v12 = [(TCCDPlatform *)self server];
        uint64_t v13 = [v12 logHandle];

        if (v10)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v22 = a3;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "acquired watchdog opt-out assertion for client with pid: %d", buf, 8u);
          }

          int v9 = v9;
          v14 = v9;
          goto LABEL_21;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100057284((uint64_t)v11, v13);
        }

LABEL_20:
        v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
      unsigned int v17 = [(TCCDPlatform *)self server];
      id v18 = [v17 logHandle];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100057250();
      }
    }
    else
    {
      char v16 = [(TCCDPlatform *)self server];
      int v9 = [v16 logHandle];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100057250();
      }
    }
    id v11 = 0;
    goto LABEL_20;
  }
  uint64_t v15 = [(TCCDPlatform *)self server];
  id v11 = [v15 logHandle];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10005721C();
  }
  v14 = 0;
LABEL_22:

  return v14;
}

- (OS_dispatch_queue)alertQueue
{
  return self->_alertQueue;
}

- (void)setAlertQueue:(id)a3
{
}

- (OS_dispatch_semaphore)alertSemaphore
{
  return self->_alertSemaphore;
}

- (void)setAlertSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertSemaphore, 0);
  objc_storeStrong((id *)&self->_alertQueue, 0);
}

@end