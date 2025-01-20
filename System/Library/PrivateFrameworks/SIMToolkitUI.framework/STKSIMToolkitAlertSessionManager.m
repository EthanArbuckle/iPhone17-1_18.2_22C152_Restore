@interface STKSIMToolkitAlertSessionManager
- (BOOL)_showAfterDeviceUnlock:(unint64_t)a3;
- (STKCarrierSubscriptionMonitor)subscriptionMonitor;
- (STKSIMToolkitAlertSession)currentSession;
- (STKSIMToolkitAlertSessionManager)initWithSubscriptionMonitor:(id)a3;
- (STKTelephonyListItemsProvider)_listItemsProvider;
- (id)_listItemsFromCTItems:(id)a3;
- (id)_newSessionBehaviorFromOptions:(id)a3;
- (id)remoteAlertDescriptorForSession:(id)a3;
- (void)_queue_handleSIMToolkitEvent:(int64_t)a3 responder:(id)a4 userInfo:(id)a5;
- (void)_queue_setCurrentSession:(id)a3;
- (void)_queue_startListening;
- (void)_removeNotification;
- (void)_setListItemsProvider:(id)a3;
- (void)_showNotification;
- (void)deviceLockStateChanged:(BOOL)a3;
- (void)handleSIMToolkitEvent:(int64_t)a3 responder:(id)a4 userInfo:(id)a5;
- (void)incomingCallUIStateDidChange:(BOOL)a3;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)userEventDidOccur:(id)a3;
@end

@implementation STKSIMToolkitAlertSessionManager

id __64__STKSIMToolkitAlertSessionManager_initWithSubscriptionMonitor___block_invoke_3(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 40);
  if (result) {
    return (id)[result sendSIMToolkitDisplayReady:0];
  }
  return result;
}

void __64__STKSIMToolkitAlertSessionManager_initWithSubscriptionMonitor___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = v1[4];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__STKSIMToolkitAlertSessionManager_initWithSubscriptionMonitor___block_invoke_3;
  block[3] = &unk_2645F4458;
  v4 = v1;
  dispatch_async(v2, block);
}

- (STKSIMToolkitAlertSessionManager)initWithSubscriptionMonitor:(id)a3
{
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = STKSIMToolkitLog();
  v36.receiver = self;
  v36.super_class = (Class)STKSIMToolkitAlertSessionManager;
  v8 = [(STKAlertSessionManager *)&v36 initWithEventQueue:v6 logger:v7];

  if (v8)
  {
    uint64_t v9 = BSDispatchQueueCreateWithQualityOfService();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v8->_subscriptionMonitor, a3);
    uint64_t v11 = +[STKIncomingCallUIStateMonitor sharedInstance];
    incomingCallUIStateMonitor = v8->_incomingCallUIStateMonitor;
    v8->_incomingCallUIStateMonitor = (STKIncomingCallUIStateMonitor *)v11;

    [(STKIncomingCallUIStateMonitor *)v8->_incomingCallUIStateMonitor addObserver:v8];
    v13 = (__CFString *)(id)*MEMORY[0x263F031B0];
    v14 = [MEMORY[0x263F08AB0] processInfo];
    v15 = [v14 processName];

    if ([v15 isEqual:@"ctnotifytool"])
    {

      v13 = @"com.apple.ctnotifytool";
    }
    uint64_t v16 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:v13];
    userNotificationCenter = v8->_userNotificationCenter;
    v8->_userNotificationCenter = (UNUserNotificationCenter *)v16;

    uint64_t v18 = +[STKDeviceLockMonitor sharedInstance];
    deviceLockMonitor = v8->_deviceLockMonitor;
    v8->_deviceLockMonitor = (STKDeviceLockMonitor *)v18;

    [(STKDeviceLockMonitor *)v8->_deviceLockMonitor addObserver:v8];
    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_lock_deviceLocked = 0;
    notificationGroup = v8->_notificationGroup;
    v8->_notificationGroup = 0;

    uint64_t v21 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v8->_queue];
    telephonyClient = v8->_telephonyClient;
    v8->_telephonyClient = (CoreTelephonyClient *)v21;

    v23 = v8->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__STKSIMToolkitAlertSessionManager_initWithSubscriptionMonitor___block_invoke;
    block[3] = &unk_2645F4458;
    v24 = v8;
    v35 = v24;
    dispatch_sync(v23, block);
    p_atHomeScreenNotifyToken = &v24->_atHomeScreenNotifyToken;
    v26 = v8->_queue;
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    v31 = __64__STKSIMToolkitAlertSessionManager_initWithSubscriptionMonitor___block_invoke_2;
    v32 = &unk_2645F4738;
    v27 = v24;
    v33 = v27;
    notify_register_dispatch("com.apple.springboard.homescreenunlocked", p_atHomeScreenNotifyToken, v26, &v29);
    [(STKSIMToolkitAlertSessionManager *)v27 incomingCallUIStateDidChange:[(STKIncomingCallUIStateMonitor *)v8->_incomingCallUIStateMonitor isShowingIncomingCallUI]];
    [(STKSIMToolkitAlertSessionManager *)v27 deviceLockStateChanged:[(STKDeviceLockMonitor *)v8->_deviceLockMonitor isDeviceLocked]];
  }
  return v8;
}

uint64_t __64__STKSIMToolkitAlertSessionManager_initWithSubscriptionMonitor___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_startListening");
  *(void *)(*(void *)(a1 + 32) + 112) = [[STKTelephonySelectionListItemsProvider alloc] initWithTelephonyClient:*(void *)(*(void *)(a1 + 32) + 40)];

  return MEMORY[0x270F9A758]();
}

- (void)handleSIMToolkitEvent:(int64_t)a3 responder:(id)a4 userInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__STKSIMToolkitAlertSessionManager_handleSIMToolkitEvent_responder_userInfo___block_invoke;
  v13[3] = &unk_2645F44D0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

uint64_t __77__STKSIMToolkitAlertSessionManager_handleSIMToolkitEvent_responder_userInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleSIMToolkitEvent:responder:userInfo:", *(void *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_showNotification
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221DC0000, a2, OS_LOG_TYPE_ERROR, "Something wrong with localization; using default language: %@",
    (uint8_t *)&v2,
    0xCu);
}

void __53__STKSIMToolkitAlertSessionManager__showNotification__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v6 = [WeakRetained log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __53__STKSIMToolkitAlertSessionManager__showNotification__block_invoke_cold_1((uint64_t)v3, v6);
    }
  }
}

- (void)_removeNotification
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = [(STKAlertSessionManager *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = @"SIMToolkit_Carrier";
    _os_log_impl(&dword_221DC0000, v3, OS_LOG_TYPE_DEFAULT, "Remove notifications with Identifier='%@'", buf, 0xCu);
  }

  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"SIMToolkit_Carrier", 0);
  [(UNUserNotificationCenter *)self->_userNotificationCenter removePendingNotificationRequestsWithIdentifiers:v4];
  [(UNUserNotificationCenter *)self->_userNotificationCenter removeDeliveredNotificationsWithIdentifiers:v4];
}

- (BOOL)_showAfterDeviceUnlock:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_deviceLocked)
  {
    [(STKSIMToolkitAlertSessionManager *)self _showNotification];
    v6 = (OS_dispatch_group *)dispatch_group_create();
    notificationGroup = self->_notificationGroup;
    self->_notificationGroup = v6;

    dispatch_group_enter((dispatch_group_t)self->_notificationGroup);
    os_unfair_lock_unlock(p_lock);
    id v8 = self->_notificationGroup;
    dispatch_time_t v9 = dispatch_time(0, 1000000000 * a3);
    BOOL v10 = dispatch_group_wait(v8, v9) == 0;
    os_unfair_lock_lock(p_lock);
    id v11 = self->_notificationGroup;
    self->_notificationGroup = 0;

    [(STKSIMToolkitAlertSessionManager *)self _removeNotification];
  }
  else
  {
    BOOL v10 = 1;
  }
  os_unfair_lock_unlock(p_lock);
  id v12 = [(STKAlertSessionManager *)self log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = "Don't show";
    if (v10) {
      v13 = "Show";
    }
    id v14 = "timeout waiting for device unlock";
    if (v10) {
      id v14 = "device unlocked in-time";
    }
    int v16 = 136315394;
    v17 = v13;
    __int16 v18 = 2080;
    v19 = v14;
    _os_log_impl(&dword_221DC0000, v12, OS_LOG_TYPE_DEFAULT, "%s STK alert; %s", (uint8_t *)&v16, 0x16u);
  }

  return v10;
}

- (id)remoteAlertDescriptorForSession:(id)a3
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 options];
    uint64_t v7 = [v5 event];
    id v8 = [v6 valueForKey:*MEMORY[0x263F032B8]];
    uint64_t v9 = (int)[v8 intValue];

    BOOL v10 = [(STKAlertSessionManager *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      currentSession = self->_currentSession;
      *(_DWORD *)buf = 134218240;
      v107 = (__CFString *)currentSession;
      __int16 v108 = 2048;
      uint64_t v109 = v9;
      _os_log_impl(&dword_221DC0000, v10, OS_LOG_TYPE_DEFAULT, "Session <%p> - SlotID %ld", buf, 0x16u);
    }

    uint64_t v12 = [(STKCarrierSubscriptionMonitor *)self->_subscriptionMonitor subscriptionContextForSlot:v9];
    if ([(STKCarrierSubscriptionMonitor *)self->_subscriptionMonitor numAvailableSubscriptions] < 2)
    {
      id v82 = 0;
      v87 = 0;
    }
    else
    {
      telephonyClient = self->_telephonyClient;
      id v105 = 0;
      v87 = [(CoreTelephonyClient *)telephonyClient getSimLabel:v12 error:&v105];
      id v14 = v105;
      if (v14)
      {
        uint64_t v15 = (uint64_t)v14;
        id v82 = v14;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          [(STKSIMToolkitAlertSessionManager *)v9 remoteAlertDescriptorForSession:v15];
        }
      }
      else
      {
        id v82 = 0;
      }
    }
    v88 = objc_msgSend(v6, "bs_safeStringForKey:", *MEMORY[0x263F032C0]);
    v84 = v6;
    int v16 = [(STKSIMToolkitAlertSessionManager *)self _newSessionBehaviorFromOptions:v6];
    uint64_t v19 = [objc_alloc(MEMORY[0x263F02C20]) initWithBundleType:1];
    uint64_t v20 = self->_telephonyClient;
    v104[1] = 0;
    v86 = (void *)v19;
    uint64_t v21 = -[CoreTelephonyClient copyCarrierBundleValueWithDefault:key:bundleType:error:](v20, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v12, @"AllowSTKAlertInLockScreen");
    id v22 = 0;
    v89 = (void *)v12;
    v85 = (void *)v21;
    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v23 = [(STKAlertSessionManager *)self log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v107 = @"AllowSTKAlertInLockScreen";
        __int16 v108 = 2112;
        uint64_t v109 = (uint64_t)v85;
        _os_log_impl(&dword_221DC0000, v23, OS_LOG_TYPE_DEFAULT, "Carrier bundle: key=%@; value=%@", buf, 0x16u);
      }

      int v24 = [v85 BOOLValue];
    }
    else
    {
      v25 = [(STKAlertSessionManager *)self log];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[STKSIMToolkitAlertSessionManager remoteAlertDescriptorForSession:]();
      }

      int v24 = 0;
    }
    v26 = [(STKAlertSessionManager *)self log];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = "Don't allow";
      if (v24) {
        v27 = "Allow";
      }
      *(_DWORD *)buf = 136315138;
      v107 = (__CFString *)v27;
      _os_log_impl(&dword_221DC0000, v26, OS_LOG_TYPE_DEFAULT, "%s STK alerts when device is locked", buf, 0xCu);
    }

    if (v24)
    {
      id v28 = v22;
    }
    else
    {
      uint64_t v29 = self->_telephonyClient;
      v104[0] = v22;
      uint64_t v30 = (void *)[(CoreTelephonyClient *)v29 copyCarrierBundleValueWithDefault:v12 key:@"STKAlertLockScreenNotificationTimeoutSeconds" bundleType:v86 error:v104];
      id v28 = v104[0];

      if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v31 = [(STKAlertSessionManager *)self log];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v107 = @"STKAlertLockScreenNotificationTimeoutSeconds";
          __int16 v108 = 2112;
          uint64_t v109 = (uint64_t)v30;
          _os_log_impl(&dword_221DC0000, v31, OS_LOG_TYPE_DEFAULT, "Carrier bundle: key=%@; value=%@", buf, 0x16u);
        }

        uint64_t v32 = [v30 unsignedIntegerValue];
        if (v32) {
          uint64_t v33 = v32;
        }
        else {
          uint64_t v33 = 29;
        }
      }
      else
      {
        v34 = [(STKAlertSessionManager *)self log];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[STKSIMToolkitAlertSessionManager remoteAlertDescriptorForSession:]();
        }

        uint64_t v33 = 29;
      }
      v35 = [(STKAlertSessionManager *)self log];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v107 = (__CFString *)v33;
        _os_log_impl(&dword_221DC0000, v35, OS_LOG_TYPE_DEFAULT, "Show STK alerts notification with timeout = %ld secs", buf, 0xCu);
      }

      BOOL v36 = [(STKSIMToolkitAlertSessionManager *)self _showAfterDeviceUnlock:v33];
      if (!v36)
      {
        v37 = v5;
        [v5 sendResponse:2];
        v40 = 0;
        __int16 v18 = 0;
        v41 = v89;
        v42 = v82;
LABEL_76:

        goto LABEL_77;
      }
    }
    v37 = v5;
    switch(v7)
    {
      case 1:
      case 2:
      case 3:
      case 4:
        goto LABEL_41;
      case 5:
        if (v88)
        {
          id v83 = v28;
          v43 = [STKTextSessionData alloc];
          v44 = [v87 text];
          v45 = [(STKTextSessionData *)v43 initWithText:v88 simLabel:v44];

          v46 = [STKTextSessionAction alloc];
          v102[0] = MEMORY[0x263EF8330];
          v102[1] = 3221225472;
          v102[2] = __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke;
          v102[3] = &unk_2645F4628;
          v103 = (STKListItemsSessionData *)v5;
          v40 = [(STKTextSessionAction *)v46 initWithBehavior:v16 inputData:v45 response:v102];
          v47 = @"STKTextAlertViewController";
          v48 = v103;
          goto LABEL_72;
        }
        v88 = 0;
LABEL_81:
        v47 = 0;
        v40 = 0;
        v42 = v82;
        goto LABEL_75;
      case 6:
        id v83 = v28;
        v49 = objc_msgSend(v5, "options", v89);
        uint64_t v50 = *MEMORY[0x263F03170];
        objc_msgSend(v49, "bs_safeStringForKey:", *MEMORY[0x263F03170]);
        v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v51) {
          v52 = v51;
        }
        else {
          v52 = &stru_26D4601D0;
        }

        v53 = objc_msgSend(v84, "bs_safeStringForKey:", v50);
        v54 = (const void *)*MEMORY[0x263F03180];
        uint64_t v55 = [v53 isEqualToString:*MEMORY[0x263F03180]];

        v56 = [STKMutableTextInputSessionData alloc];
        v57 = [v87 text];
        v45 = [(STKTextInputSessionData *)v56 initWithText:v88 simLabel:v57];

        -[STKMutableTextInputSessionData setIsSecure:](v45, "setIsSecure:", objc_msgSend(v84, "bs_BOOLForKey:", *MEMORY[0x263F03150]));
        v58 = objc_msgSend(v84, "bs_safeStringForKey:", *MEMORY[0x263F03140]);
        [(STKMutableTextInputSessionData *)v45 setDefaultText:v58];

        [(STKMutableTextInputSessionData *)v45 setIsDigitsOnly:v55];
        objc_msgSend(v84, "bs_safeNumberForKey:", *MEMORY[0x263F03160]);
        v59 = (STKListItemsSessionData *)objc_claimAutoreleasedReturnValue();
        v48 = v59;
        if (v59) {
          [(STKMutableTextInputSessionData *)v45 setMinimumInputLength:[(STKListItemsSessionData *)v59 unsignedIntegerValue]];
        }
        v60 = objc_msgSend(v84, "bs_safeNumberForKey:", *MEMORY[0x263F03158]);
        v61 = v60;
        if (v60) {
          -[STKMutableTextInputSessionData setMaximumInputLength:](v45, "setMaximumInputLength:", [v60 unsignedIntegerValue]);
        }
        v62 = objc_msgSend(v84, "bs_safeNumberForKey:", *MEMORY[0x263F03148]);
        v63 = v62;
        v81 = v62;
        if (v62 && ([v62 BOOLValue] & 1) == 0)
        {
          v79 = [STKTextInputSessionAction alloc];
          v100[0] = MEMORY[0x263EF8330];
          v100[1] = 3221225472;
          v100[2] = __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_2;
          v100[3] = &unk_2645F4788;
          v65 = &v101;
          id v101 = v37;
          v40 = [(STKTextInputSessionAction *)v79 initWithBehavior:v16 inputData:v45 response:v100];
          v47 = @"STKOneShotInputAlertViewController";
          goto LABEL_86;
        }
        if (CFEqual(v52, (CFTypeRef)*MEMORY[0x263F03178]))
        {
          v64 = [STKYesNoSessionAction alloc];
          v98[0] = MEMORY[0x263EF8330];
          v98[1] = 3221225472;
          v98[2] = __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_3;
          v98[3] = &unk_2645F47B0;
          v65 = &v99;
          id v99 = v37;
          v40 = [(STKYesNoSessionAction *)v64 initWithBehavior:v16 inputData:v45 response:v98];
          v47 = @"STKYesNoInputAlertViewController";
LABEL_86:

          v63 = v81;
          v42 = v82;
          goto LABEL_87;
        }
        if (CFEqual(v52, (CFTypeRef)*MEMORY[0x263F03188]) || CFEqual(v52, v54))
        {
          v80 = [STKTextInputSessionAction alloc];
          v96[0] = MEMORY[0x263EF8330];
          v96[1] = 3221225472;
          v96[2] = __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_4;
          v96[3] = &unk_2645F4788;
          v65 = &v97;
          id v97 = v37;
          v40 = [(STKTextInputSessionAction *)v80 initWithBehavior:v16 inputData:v45 response:v96];
          v47 = @"STKStandardInputAlertViewController";
          goto LABEL_86;
        }
        v47 = 0;
        v40 = 0;
        v42 = v82;
LABEL_87:

        goto LABEL_73;
      case 7:
        uint64_t v7 = 5;
LABEL_41:
        uint64_t v38 = (uint64_t)v88;
        if (v88) {
          goto LABEL_71;
        }
        if (v7 == 2)
        {
          v39 = (void *)MEMORY[0x263F03290];
          goto LABEL_69;
        }
        if (v7 == 3)
        {
          v39 = (void *)MEMORY[0x263F032A0];
LABEL_69:
          uint64_t v38 = objc_msgSend(v84, "bs_safeStringForKey:", *v39);
          goto LABEL_71;
        }
        uint64_t v38 = 0;
LABEL_71:
        id v83 = v28;
        v75 = [STKNotifySessionData alloc];
        v76 = [v87 text];
        v88 = (void *)v38;
        v45 = [(STKNotifySessionData *)v75 initWithText:v38 simLabel:v76 notifyType:v7];

        v77 = [STKNotifySessionAction alloc];
        v90[0] = MEMORY[0x263EF8330];
        v90[1] = 3221225472;
        v90[2] = __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_7;
        v90[3] = &unk_2645F4628;
        v91 = v37;
        v40 = [(STKTextSessionAction *)v77 initWithBehavior:v16 inputData:v45 response:v90];
        v47 = @"STKNotifyAlertViewController";
        v48 = v91;
LABEL_72:
        v42 = v82;
LABEL_73:

        id v28 = v83;
LABEL_74:

LABEL_75:
        __int16 v18 = [[_STKRemoteAlertDescriptor alloc] initWithAction:v40 viewControllerName:v47];
        v41 = v89;
        break;
      case 8:
        v66 = [(STKTelephonyListItemsProvider *)self->_listItemsProvider selectionListItemsForContext:v89 options:v84];
        v45 = [(STKSIMToolkitAlertSessionManager *)self _listItemsFromCTItems:v66];

        if (![(STKMutableTextInputSessionData *)v45 count]) {
          goto LABEL_67;
        }
        id v83 = v28;
        v67 = [STKListItemsSessionData alloc];
        v68 = [v87 text];
        v48 = [(STKListItemsSessionData *)v67 initWithText:v88 simLabel:v68 listItems:v45];

        v69 = [STKListItemsSessionAction alloc];
        v94[0] = MEMORY[0x263EF8330];
        v94[1] = 3221225472;
        v94[2] = __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_5;
        v94[3] = &unk_2645F47B0;
        id v95 = v5;
        v40 = [(STKListItemsSessionAction *)v69 initWithBehavior:v16 inputData:v48 response:v94];

        v47 = @"STKListDisplayAlertViewController";
        goto LABEL_72;
      case 9:
        objc_msgSend(v84, "bs_safeObjectForKey:ofType:", *MEMORY[0x263F030F0], objc_opt_class());
        v45 = (STKMutableTextInputSessionData *)objc_claimAutoreleasedReturnValue();
        if (!v45)
        {
LABEL_67:
          v47 = 0;
          v40 = 0;
          v42 = v82;
          goto LABEL_74;
        }
        id v83 = v28;
        objc_msgSend(v84, "bs_safeObjectForKey:ofType:", *MEMORY[0x263F030F8], objc_opt_class());
        v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v70) {
          v71 = v70;
        }
        else {
          v71 = &stru_26D4601D0;
        }

        v72 = [STKMutableCallSetupSessionData alloc];
        v73 = [v87 text];
        v48 = [(STKCallSetupSessionData *)v72 initWithText:v88 simLabel:v73 phoneNumber:v45];

        [(STKListItemsSessionData *)v48 setIsHighPriority:CFEqual(v71, (CFTypeRef)*MEMORY[0x263F03100]) != 0];
        v74 = [STKCallSetupSessionAction alloc];
        v92[0] = MEMORY[0x263EF8330];
        v92[1] = 3221225472;
        v92[2] = __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_6;
        v92[3] = &unk_2645F4628;
        id v93 = v5;
        v40 = [(STKTextSessionAction *)v74 initWithBehavior:v16 inputData:v48 response:v92];

        v47 = @"STKSetupCallAlertViewController";
        goto LABEL_72;
      default:
        goto LABEL_81;
    }
    goto LABEL_76;
  }
  int v16 = [(STKAlertSessionManager *)self log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_currentSession;
    *(_DWORD *)buf = 134217984;
    v107 = (__CFString *)v17;
    _os_log_impl(&dword_221DC0000, v16, OS_LOG_TYPE_DEFAULT, "Session <%p> - session isKindOfClass is NULL", buf, 0xCu);
  }
  __int16 v18 = 0;
LABEL_77:

  return v18;
}

uint64_t __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendResponse:a2];
}

uint64_t __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 sendResponse:a2];
  }
  else {
    return [v3 sendResponse:0 withStringResult:a3];
  }
}

uint64_t __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  if (a3)
  {
    uint64_t v5 = [a3 BOOLValue];
    return [v4 sendResponse:a2 withBOOLResult:v5];
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    return [v7 sendResponse:a2];
  }
}

uint64_t __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 sendResponse:a2];
  }
  else {
    return [v3 sendResponse:0 withStringResult:a3];
  }
}

uint64_t __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3)
  {
    uint64_t v4 = [a3 unsignedIntegerValue];
    return [v3 sendSuccessWithSelectedIndex:v4];
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    return [v6 sendResponse:a2];
  }
}

uint64_t __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendResponse:a2];
}

uint64_t __68__STKSIMToolkitAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendResponse:a2];
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__STKSIMToolkitAlertSessionManager_remoteAlertHandleDidDeactivate___block_invoke;
  v7[3] = &unk_2645F44F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __67__STKSIMToolkitAlertSessionManager_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 136) alertHandle];
  id v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    id v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 136);
      int v6 = 134217984;
      uint64_t v7 = v5;
      _os_log_impl(&dword_221DC0000, v4, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleDeactivated", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_queue_setCurrentSession:", 0);
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 removeObserver:self];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__STKSIMToolkitAlertSessionManager_remoteAlertHandle_didInvalidateWithError___block_invoke;
  block[3] = &unk_2645F47D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __77__STKSIMToolkitAlertSessionManager_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 136) alertHandle];
  id v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    id v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 136);
      uint64_t v6 = *(void *)(a1 + 48);
      int v7 = 134218242;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      uint64_t v10 = v6;
      _os_log_impl(&dword_221DC0000, v4, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleInvalidated with error: %{public}@", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_queue_setCurrentSession:", 0);
  }
}

- (void)userEventDidOccur:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__STKSIMToolkitAlertSessionManager_userEventDidOccur___block_invoke;
  block[3] = &unk_2645F4458;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __54__STKSIMToolkitAlertSessionManager_userEventDidOccur___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v9 = 0;
    _os_log_impl(&dword_221DC0000, v2, OS_LOG_TYPE_DEFAULT, "UserEventDidOccur", v9, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 128);
  if (v4)
  {
    [v4 sendResponse:7];
    uint64_t v3 = *(void *)(a1 + 32);
  }
  [*(id *)(v3 + 120) invalidate];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 128);
  *(void *)(v7 + 128) = 0;
}

- (void)incomingCallUIStateDidChange:(BOOL)a3
{
  if (a3)
  {
    if (self->_haltEventQueueProcessingAssertion) {
      return;
    }
    id v4 = [(STKAlertSessionManager *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221DC0000, v4, OS_LOG_TYPE_DEFAULT, "Halting event queue processing due to incoming call ui being visible.", buf, 2u);
    }

    uint64_t v5 = [(STKAlertSessionManager *)self eventQueue];
    uint64_t v6 = [v5 acquireEventQueueHaltingAssertionForReason:@"incomingCallUIVisible"];
    haltEventQueueProcessingAssertion = self->_haltEventQueueProcessingAssertion;
    self->_haltEventQueueProcessingAssertion = v6;
  }
  else
  {
    uint64_t v8 = [(STKAlertSessionManager *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v9 = 0;
      _os_log_impl(&dword_221DC0000, v8, OS_LOG_TYPE_DEFAULT, "Resulting event queue processing due to incoming call ui being removed.", v9, 2u);
    }

    [(BSInvalidatable *)self->_haltEventQueueProcessingAssertion invalidate];
    uint64_t v5 = self->_haltEventQueueProcessingAssertion;
    self->_haltEventQueueProcessingAssertion = 0;
  }
}

- (void)deviceLockStateChanged:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_deviceLocked = a3;
  if (!a3)
  {
    notificationGroup = self->_notificationGroup;
    if (notificationGroup) {
      dispatch_group_leave(notificationGroup);
    }
    [(STKSIMToolkitAlertSessionManager *)self _removeNotification];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_queue_setCurrentSession:(id)a3
{
  id v4 = (STKSIMToolkitAlertSession *)a3;
  BSDispatchQueueAssert();
  currentSession = self->_currentSession;
  if (currentSession != v4)
  {
    uint64_t v6 = [(STKAlertSession *)currentSession alertHandle];
    [v6 removeObserver:self];

    [(STKAlertSession *)self->_currentSession invalidate];
  }
  uint64_t v7 = self->_currentSession;
  self->_currentSession = v4;
  uint64_t v8 = v4;

  id v9 = [(STKAlertSession *)self->_currentSession alertHandle];

  [v9 addObserver:self];
}

- (void)_queue_handleSIMToolkitEvent:(int64_t)a3 responder:(id)a4 userInfo:(id)a5
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v70 = a4;
  id v9 = a5;
  BSDispatchQueueAssert();
  uint64_t v10 = [(STKAlertSessionManager *)self log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = NSStringFromSTKSIMToolkitEvent(a3);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_221DC0000, v10, OS_LOG_TYPE_DEFAULT, "Event received: %{public}@ with options: %@", buf, 0x16u);
  }
  if (a3 != 14)
  {
    v71 = self->_currentSession;
    uint64_t v15 = [(STKSIMToolkitAlertSession *)v71 behavior];
    if ([v15 dismissesAfterUserEvent])
    {
      BOOL v16 = [(STKAlertSession *)v71 hasSentResponse];

      if (!v16) {
        goto LABEL_14;
      }
      v17 = [(STKAlertSessionManager *)self log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        currentSession = self->_currentSession;
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = currentSession;
        _os_log_impl(&dword_221DC0000, v17, OS_LOG_TYPE_DEFAULT, "Session <%p> - Dismissing because [currentAlert dismissesAfterNextEvent] && [currentAlert hasSentResponse]", buf, 0xCu);
      }

      [(STKSIMToolkitAlertSessionManager *)self _queue_setCurrentSession:0];
      uint64_t v15 = v71;
      v71 = 0;
    }

LABEL_14:
    if (a3 == 7)
    {
      v23 = [(STKAlertSessionManager *)self log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v9;
        _os_log_impl(&dword_221DC0000, v23, OS_LOG_TYPE_DEFAULT, "Session <%p> - Play Tone userInfo: %{public}@", buf, 0x16u);
      }

      v68 = +[STKSoundFactory soundForOptions:v9];
    }
    else
    {
      if (a3 == 13)
      {
        uint64_t v19 = *MEMORY[0x263F032A8];
        v68 = [v9 objectForKey:*MEMORY[0x263F032A8]];
        uint64_t v20 = [(STKAlertSession *)v71 options];
        id v67 = [v20 objectForKey:v19];

        if (v71 && BSEqualObjects())
        {
          uint64_t v21 = [(STKAlertSessionManager *)self log];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = self->_currentSession;
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v22;
            _os_log_impl(&dword_221DC0000, v21, OS_LOG_TYPE_DEFAULT, "Session <%p> - Dismissing because kCTSIMToolkitSessionCompleteNotification", buf, 0xCu);
          }

          [(STKSIMToolkitAlertSessionManager *)self _queue_setCurrentSession:0];
        }
        goto LABEL_99;
      }
      v68 = 0;
    }
    id v67 = [(STKSIMToolkitAlertSessionManager *)self _newSessionBehaviorFromOptions:v9];
    int v24 = [STKSIMToolkitAlertSession alloc];
    v25 = [(STKAlertSessionManager *)self log];
    v69 = [(STKSIMToolkitAlertSession *)v24 initWithLogger:v25 responseProvider:v70 event:a3 options:v9 behavior:v67 sound:v68];

    if (v71 && ![(STKAlertSession *)v71 hasSentResponse])
    {
      v43 = [(STKAlertSessionManager *)self log];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v69;
        _os_log_impl(&dword_221DC0000, v43, OS_LOG_TYPE_DEFAULT, "Session <%p> - Returning early because an existing session already exists and needs a response", buf, 0xCu);
      }

      [(STKAlertSession *)v69 sendResponse:5];
      [(STKAlertSession *)v69 invalidate];
      goto LABEL_98;
    }
    switch(a3)
    {
      case 5:
        v26 = [(STKAlertSessionManager *)self log];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v69;
          _os_log_impl(&dword_221DC0000, v26, OS_LOG_TYPE_DEFAULT, "Session <%p> - Text session", buf, 0xCu);
        }

        objc_msgSend(v9, "bs_safeStringForKey:", *MEMORY[0x263F03130]);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v27) {
          id v28 = v27;
        }
        else {
          id v28 = &stru_26D4601D0;
        }

        if (CFEqual(v28, (CFTypeRef)*MEMORY[0x263F03138])) {
          goto LABEL_91;
        }
        int out_token = -1;
        uint64_t state64 = 0;
        notify_register_check((const char *)*MEMORY[0x263F796A8], &out_token);
        if (out_token != -1)
        {
          notify_get_state(out_token, &state64);
          notify_cancel(out_token);
        }
        uint64_t v64 = state64;
        dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
        v66 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        id v93 = __Block_byref_object_copy__0;
        v94 = __Block_byref_object_dispose__0;
        id v95 = 0;
        v78[0] = MEMORY[0x263EF8330];
        v78[1] = 3221225472;
        v78[2] = __84__STKSIMToolkitAlertSessionManager__queue_handleSIMToolkitEvent_responder_userInfo___block_invoke;
        v78[3] = &unk_2645F4800;
        v80 = buf;
        uint64_t v30 = v29;
        v79 = v30;
        [v66 setTransitionHandler:v78];
        v65 = [MEMORY[0x263F3F728] monitorWithConfiguration:v66];
        v63 = v30;
        dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
        v31 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        uint64_t v32 = [*(id *)(*(void *)&buf[8] + 40) elements];
        uint64_t v33 = [v32 countByEnumeratingWithState:&v74 objects:v91 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v75;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v75 != v34) {
                objc_enumerationMutation(v32);
              }
              BOOL v36 = *(void **)(*((void *)&v74 + 1) + 8 * i);
              if ([v36 isUIApplicationElement])
              {
                v37 = [v36 bundleIdentifier];
                BOOL v38 = [v37 length] == 0;

                if (!v38)
                {
                  v39 = [v36 bundleIdentifier];
                  [v31 addObject:v39];
                }
              }
            }
            uint64_t v33 = [v32 countByEnumeratingWithState:&v74 objects:v91 count:16];
          }
          while (v33);
        }

        [v65 invalidate];
        if (v64 || [v31 count] && (objc_msgSend(v31, "isEqual:", &unk_26D468328) & 1) == 0)
        {
          v40 = [(STKAlertSessionManager *)self log];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            int v41 = [v31 count];
            *(_DWORD *)id v83 = 134218754;
            v84 = v69;
            __int16 v85 = 1024;
            BOOL v86 = v64 != 0;
            __int16 v87 = 1024;
            int v88 = v41;
            __int16 v89 = 2112;
            v90 = v31;
            _os_log_impl(&dword_221DC0000, v40, OS_LOG_TYPE_DEFAULT, "Session <%p> - Sending busy response because locked: %d, applicationCount: %d, applications: %@", v83, 0x22u);
          }

          [(STKAlertSession *)v69 sendResponse:5];
          [(STKAlertSession *)v69 invalidate];
          char v42 = 0;
        }
        else
        {
          char v42 = 1;
        }

        _Block_object_dispose(buf, 8);
        if (v42) {
          goto LABEL_91;
        }
        goto LABEL_98;
      case 9:
        v46 = [(STKAlertSessionManager *)self log];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v69;
          _os_log_impl(&dword_221DC0000, v46, OS_LOG_TYPE_DEFAULT, "Session <%p> - Call setup session", buf, 0xCu);
        }

        v47 = [MEMORY[0x263F29CA0] sharedInstance];
        BOOL v48 = [v47 deviceClass] == 0;

        if (!v48)
        {
          v49 = [(STKAlertSessionManager *)self log];
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v69;
            _os_log_impl(&dword_221DC0000, v49, OS_LOG_TYPE_DEFAULT, "Session <%p> - Call setup session not supported", buf, 0xCu);
          }

          [(STKAlertSession *)v69 sendResponse:6];
          [(STKAlertSession *)v69 invalidate];
LABEL_98:

LABEL_99:
          goto LABEL_100;
        }
        v57 = objc_msgSend(v9, "bs_safeStringForKey:", *MEMORY[0x263F030F8]);
        if (BSEqualStrings())
        {
          v58 = (void *)CTCopyCurrentCalls();
          if ([v58 count])
          {
            v59 = [(STKAlertSessionManager *)self log];
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              *(void *)&uint8_t buf[4] = v69;
              _os_log_impl(&dword_221DC0000, v59, OS_LOG_TYPE_DEFAULT, "Session <%p> - Call setup session busy (has existing phone calls)", buf, 0xCu);
            }

            [(STKAlertSession *)v69 sendResponse:5];
            [(STKAlertSession *)v69 invalidate];

            goto LABEL_98;
          }
        }
        goto LABEL_91;
      case 10:
        v44 = [(STKAlertSessionManager *)self log];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v69;
          _os_log_impl(&dword_221DC0000, v44, OS_LOG_TYPE_DEFAULT, "Session <%p> - Idle text session", buf, 0xCu);
        }

        v45 = objc_msgSend(v9, "bs_safeStringForKey:", *MEMORY[0x263F032C0]);
        SBSSetIdleText();
        [(STKAlertSession *)v69 sendResponse:0];
        [(STKAlertSession *)v69 invalidate];

        goto LABEL_98;
      case 11:
        uint64_t v50 = [(STKAlertSessionManager *)self log];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v69;
          _os_log_impl(&dword_221DC0000, v50, OS_LOG_TYPE_DEFAULT, "Session <%p> - Local information session", buf, 0xCu);
        }

        CFArrayRef v51 = (const __CFArray *)CFPreferencesCopyValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x263EFFE48], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
        CFArrayRef v52 = v51;
        if (v51 && CFArrayGetCount(v51) >= 1 && (CFTypeRef Value = CFArrayGetValueAtIndex(v52, 0)) != 0)
        {
          CFLocaleRef v54 = 0;
        }
        else
        {
          CFLocaleRef v56 = CFLocaleCopyCurrent();
          CFLocaleRef v54 = v56;
          if (!v56 || (CFTypeRef Value = CFLocaleGetValue(v56, (CFLocaleKey)*MEMORY[0x263EFFCF0])) == 0)
          {
            -[STKAlertSession sendResponse:](v69, "sendResponse:", 3, Value);
LABEL_75:
            [(STKAlertSession *)v69 invalidate];
            if (v52) {
              CFRelease(v52);
            }
            if (v54) {
              CFRelease(v54);
            }
            goto LABEL_98;
          }
        }
        [(STKAlertSession *)v69 sendResponse:0 withStringResult:Value];
        goto LABEL_75;
      case 12:
        uint64_t v55 = [(STKAlertSessionManager *)self log];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v69;
          _os_log_impl(&dword_221DC0000, v55, OS_LOG_TYPE_DEFAULT, "Session <%p> - Language session", buf, 0xCu);
        }

        [(STKAlertSession *)v69 sendResponse:0];
        [(STKAlertSession *)v69 invalidate];
        goto LABEL_98;
      default:
LABEL_91:
        v60 = [v9 objectForKey:*MEMORY[0x263F031A8]];
        v61 = v60;
        if (v60 && [v60 BOOLValue])
        {
          v62 = [(STKAlertSessionManager *)self log];
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v69;
            _os_log_impl(&dword_221DC0000, v62, OS_LOG_TYPE_DEFAULT, "Session <%p> - Not presenting because it asked not to be presented", buf, 0xCu);
          }

          [(STKAlertSession *)v69 sendResponse:0];
          [(STKAlertSession *)v69 invalidate];
        }
        else
        {
          v72[0] = MEMORY[0x263EF8330];
          v72[1] = 3221225472;
          v72[2] = __84__STKSIMToolkitAlertSessionManager__queue_handleSIMToolkitEvent_responder_userInfo___block_invoke_110;
          v72[3] = &unk_2645F4650;
          v72[4] = self;
          v73 = v69;
          [(STKAlertSessionManager *)self enqueuePresentationForSession:v73 completion:v72];
        }
        goto LABEL_98;
    }
  }
  id v12 = [(STKAlertSessionManager *)self log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221DC0000, v12, OS_LOG_TYPE_DEFAULT, "Requested user attention", buf, 2u);
  }

  if (!self->_userEventMonitor)
  {
    id v13 = objc_alloc_init(STKUserEventMonitor);
    userEventMonitor = self->_userEventMonitor;
    self->_userEventMonitor = v13;

    objc_storeStrong((id *)&self->_userEventResponder, a4);
    [(STKUserEventMonitor *)self->_userEventMonitor setDelegate:self];
    [(STKUserEventMonitor *)self->_userEventMonitor setEnabled:1];
  }
LABEL_100:
}

void __84__STKSIMToolkitAlertSessionManager__queue_handleSIMToolkitEvent_responder_userInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    id v5 = v6;
  }
}

void __84__STKSIMToolkitAlertSessionManager__queue_handleSIMToolkitEvent_responder_userInfo___block_invoke_110(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(NSObject **)(v2 + 32);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __84__STKSIMToolkitAlertSessionManager__queue_handleSIMToolkitEvent_responder_userInfo___block_invoke_2;
    v4[3] = &unk_2645F44F8;
    v4[4] = v2;
    id v5 = *(id *)(a1 + 40);
    dispatch_async(v3, v4);
  }
}

uint64_t __84__STKSIMToolkitAlertSessionManager__queue_handleSIMToolkitEvent_responder_userInfo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setCurrentSession:", *(void *)(a1 + 40));
}

- (id)_listItemsFromCTItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = [MEMORY[0x263EFF980] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "text", (void)v17);

          if (v12)
          {
            id v13 = [STKListItem alloc];
            id v14 = [v11 text];
            uint64_t v15 = -[STKListItem initWithText:selected:](v13, "initWithText:selected:", v14, [v11 selected]);
            [v5 addObject:v15];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_newSessionBehaviorFromOptions:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(STKMutableSessionBehavior);
  id v5 = objc_msgSend(v3, "bs_safeStringForKey:", *MEMORY[0x263F03120]);
  if (v5) {
    uint64_t v6 = BSEqualStrings();
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = objc_msgSend(v3, "bs_safeNumberForKey:", *MEMORY[0x263F032C8]);
  [v7 doubleValue];
  [(STKMutableSessionBehavior *)v4 setTimeout:"setTimeout:"];

  [(STKMutableSessionBehavior *)v4 setShouldSendResponseUponDisplay:v6];
  [(STKMutableSessionBehavior *)v4 setDismissesAfterUserEvent:v6];

  return v4;
}

- (void)_queue_startListening
{
  BSDispatchQueueAssert();
  if (!self->_serverConnection)
  {
    id v3 = (__CTServerConnection *)_CTServerConnectionCreate();
    self->_serverConnection = v3;
    if (v3)
    {
      _CTServerConnectionSetTargetQueue();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
    }
  }
  telephonyClient = self->_telephonyClient;
  if (telephonyClient) {
    [(CoreTelephonyClient *)telephonyClient setDelegate:self];
  }
}

- (STKTelephonyListItemsProvider)_listItemsProvider
{
  return self->_listItemsProvider;
}

- (void)_setListItemsProvider:(id)a3
{
}

- (STKSIMToolkitAlertSession)currentSession
{
  return self->_currentSession;
}

- (STKCarrierSubscriptionMonitor)subscriptionMonitor
{
  return self->_subscriptionMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionMonitor, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_userEventResponder, 0);
  objc_storeStrong((id *)&self->_userEventMonitor, 0);
  objc_storeStrong((id *)&self->_listItemsProvider, 0);
  objc_storeStrong((id *)&self->_haltEventQueueProcessingAssertion, 0);
  objc_storeStrong((id *)&self->_notificationGroup, 0);
  objc_storeStrong((id *)&self->_deviceLockMonitor, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_incomingCallUIStateMonitor, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __53__STKSIMToolkitAlertSessionManager__showNotification__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221DC0000, a2, OS_LOG_TYPE_ERROR, "Unable to add notification request %@", (uint8_t *)&v2, 0xCu);
}

- (void)remoteAlertDescriptorForSession:.cold.1()
{
  int v2 = 138412802;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_221DC0000, v0, v1, "Carrier bundle: key=%@; value=%@; error:%@; ", v2);
}

- (void)remoteAlertDescriptorForSession:.cold.2()
{
  int v2 = 138412802;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_221DC0000, v0, v1, "Carrier bundle: key=%@; value=%@; error:%@", v2);
}

- (void)remoteAlertDescriptorForSession:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = 136315650;
  uint64_t v6 = CTSubscriptionSlotAsString();
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_221DC0000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Getting Sim label failed for %s and context(%p) with error %@", (uint8_t *)&v5, 0x20u);
}

@end