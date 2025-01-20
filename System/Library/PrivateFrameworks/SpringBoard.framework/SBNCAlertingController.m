@interface SBNCAlertingController
- (BOOL)_activeAlertDestinationsInRequestDestinations:(id)a3;
- (BOOL)_isBundleIdentifierBlockedForCommunicationPolicy:(id)a3;
- (BOOL)_isBundleIdentifierBlockedForScreenTimeExpiration:(id)a3;
- (BOOL)_shouldRealert;
- (BOOL)_shouldScreenTimeSuppressNotificationRequest:(id)a3;
- (BOOL)_shouldScreenTimeSuppressNotificationsForBundleIdentifier:(id)a3;
- (NCNotificationRequest)activeRequestWithRealerts;
- (NSMutableSet)realertTimers;
- (SBCommunicationPolicyManager)communicationPolicyManager;
- (SBLockScreenManager)lockScreenManager;
- (SBNCAlertingController)init;
- (SBNCAlertingController)initWithSoundController:(id)a3 screenController:(id)a4 lockScreenManager:(id)a5 communicationPolicyManager:(id)a6;
- (SBNCScreenController)screenController;
- (SBNCSoundController)soundController;
- (void)_alertNowForNotificationRequest:(id)a3;
- (void)_alertNowForNotificationRequest:(id)a3 presentingDestination:(id)a4;
- (void)_killRealertsForNotificationRequest:(id)a3;
- (void)_lockStateChanged;
- (void)_realertTimerFired:(id)a3;
- (void)_scheduleRealertsForNotificationRequest:(id)a3;
- (void)alertOnPostForNotificationRequest:(id)a3 forRequestDestinations:(id)a4;
- (void)alertOnPresentationForNotificationRequest:(id)a3 presentingDestination:(id)a4;
- (void)killAlertsForNotificationRequest:(id)a3;
- (void)killRealerts;
- (void)resetAutomaticLockStateForNotificationRequest:(id)a3;
- (void)setActiveRequestWithRealerts:(id)a3;
- (void)setCommunicationPolicyManager:(id)a3;
- (void)setLockScreenManager:(id)a3;
- (void)setRealertTimers:(id)a3;
- (void)setScreenController:(id)a3;
- (void)setSoundController:(id)a3;
@end

@implementation SBNCAlertingController

- (SBNCAlertingController)init
{
  return 0;
}

- (SBNCAlertingController)initWithSoundController:(id)a3 screenController:(id)a4 lockScreenManager:(id)a5 communicationPolicyManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SBNCAlertingController;
  v15 = [(SBNCAlertingController *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_soundController, a3);
    objc_storeStrong((id *)&v16->_screenController, a4);
    objc_storeStrong((id *)&v16->_lockScreenManager, a5);
    objc_storeStrong((id *)&v16->_communicationPolicyManager, a6);
    uint64_t v17 = objc_opt_new();
    realertTimers = v16->_realertTimers;
    v16->_realertTimers = (NSMutableSet *)v17;

    id v19 = (id)[MEMORY[0x1E4F89D30] sharedInstance];
    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v16 selector:sel__hardwareButtonPressed_ name:*MEMORY[0x1E4FA7AA0] object:0];
    [v20 addObserver:v16 selector:sel__hardwareButtonPressed_ name:*MEMORY[0x1E4FA7A98] object:0];
    [v20 addObserver:v16 selector:sel__hardwareButtonPressed_ name:*MEMORY[0x1E4FA7A70] object:0];
    [v20 addObserver:v16 selector:sel__hardwareButtonPressed_ name:*MEMORY[0x1E4FA7A78] object:0];
    [v20 addObserver:v16 selector:sel__hardwareButtonPressed_ name:*MEMORY[0x1E4FA7AE0] object:0];
    [v20 addObserver:v16 selector:sel__lockStateChanged name:@"SBAggregateLockStateDidChangeNotification" object:0];
  }
  return v16;
}

- (void)alertOnPostForNotificationRequest:(id)a3 forRequestDestinations:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(SBNCAlertingController *)self lockScreenManager];
  int v9 = [v8 isUILocked];

  v10 = [(id)SBApp notificationDispatcher];
  int v11 = [v10 isCarDestinationActive];

  BOOL v12 = [(SBNCAlertingController *)self _activeAlertDestinationsInRequestDestinations:v7];
  int v13 = objc_msgSend(v6, "sb_shouldSuppressAlert");
  BOOL v14 = [(SBNCAlertingController *)self _shouldScreenTimeSuppressNotificationRequest:v6];
  int v15 = (v9 | ~(v12 | v13)) & ((v11 | v14) ^ 1);
  v16 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    int v21 = v9;
    if (v15) {
      uint64_t v17 = @"Alerting";
    }
    else {
      uint64_t v17 = @"Not alerting";
    }
    v18 = v16;
    id v19 = [v6 notificationIdentifier];
    v20 = objc_msgSend(v19, "un_logDigest");
    *(_DWORD *)buf = 138544642;
    v23 = v17;
    __int16 v24 = 2114;
    v25 = v20;
    __int16 v26 = 1024;
    int v27 = v21;
    __int16 v28 = 1024;
    BOOL v29 = v12;
    __int16 v30 = 1024;
    int v31 = v13;
    __int16 v32 = 1024;
    BOOL v33 = v14;
    _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ on post for request %{public}@. uiLocked=%d activeAlertDestinations=%d suppressAlertForContext=%d shouldSuppressForScreenTime=%d", buf, 0x2Eu);
  }
  if (v15)
  {
    [(SBNCAlertingController *)self _alertNowForNotificationRequest:v6];
    [(SBNCAlertingController *)self _scheduleRealertsForNotificationRequest:v6];
  }
}

- (void)alertOnPresentationForNotificationRequest:(id)a3 presentingDestination:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v8;
    v10 = [v6 notificationIdentifier];
    int v11 = objc_msgSend(v10, "un_logDigest");
    int v12 = 138543362;
    int v13 = v11;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Alerting on presentation for request %{public}@", (uint8_t *)&v12, 0xCu);
  }
  [(SBNCAlertingController *)self _alertNowForNotificationRequest:v6 presentingDestination:v7];
}

- (void)killAlertsForNotificationRequest:(id)a3
{
  id v5 = a3;
  v4 = [(SBNCAlertingController *)self soundController];
  [v4 stopSoundForNotificationRequest:v5];

  [(SBNCAlertingController *)self _killRealertsForNotificationRequest:v5];
}

- (void)killRealerts
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(SBNCAlertingController *)self activeRequestWithRealerts];

  if (v3)
  {
    v4 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      id v6 = [(SBNCAlertingController *)self activeRequestWithRealerts];
      id v7 = [v6 notificationIdentifier];
      v8 = objc_msgSend(v7, "un_logDigest");
      int v11 = 138543362;
      int v12 = v8;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Killing realerts for request %{public}@", (uint8_t *)&v11, 0xCu);
    }
    int v9 = [(SBNCAlertingController *)self realertTimers];
    [v9 makeObjectsPerformSelector:sel_invalidate];

    v10 = [(SBNCAlertingController *)self realertTimers];
    [v10 removeAllObjects];

    [(SBNCAlertingController *)self setActiveRequestWithRealerts:0];
  }
}

- (void)resetAutomaticLockStateForNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(SBNCAlertingController *)self screenController];
  [v5 resetAutomaticLockStateForNotificationRequest:v4];
}

- (void)_alertNowForNotificationRequest:(id)a3
{
}

- (void)_alertNowForNotificationRequest:(id)a3 presentingDestination:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SBNCAlertingController *)self soundController];
  [v8 playSoundAndReadOutForNotificationRequest:v7 presentingDestination:v6];

  id v9 = [(SBNCAlertingController *)self screenController];
  [v9 turnOnScreenIfPossibleForNotificationRequest:v7];
}

- (void)_lockStateChanged
{
  v3 = [(SBNCAlertingController *)self lockScreenManager];
  char v4 = [v3 isUILocked];

  if ((v4 & 1) == 0)
  {
    [(SBNCAlertingController *)self killRealerts];
  }
}

- (BOOL)_activeAlertDestinationsInRequestDestinations:(id)a3
{
  id v3 = a3;
  if ([v3 containsObject:*MEMORY[0x1E4FB3848]]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 containsObject:*MEMORY[0x1E4FB3850]];
  }

  return v4;
}

- (BOOL)_shouldScreenTimeSuppressNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 options];
  if ([v5 overridesDowntime])
  {
    BOOL v6 = 0;
  }
  else
  {
    id v7 = [v4 sectionIdentifier];
    BOOL v6 = [(SBNCAlertingController *)self _shouldScreenTimeSuppressNotificationsForBundleIdentifier:v7];
  }
  return v6;
}

- (BOOL)_shouldScreenTimeSuppressNotificationsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBNCAlertingController *)self _isBundleIdentifierBlockedForScreenTimeExpiration:v4]|| [(SBNCAlertingController *)self _isBundleIdentifierBlockedForCommunicationPolicy:v4];

  return v5;
}

- (BOOL)_isBundleIdentifierBlockedForScreenTimeExpiration:(id)a3
{
  id v3 = a3;
  id v4 = +[SBApplicationController sharedInstance];
  BOOL v5 = [v4 applicationWithBundleIdentifier:v3];

  BOOL v6 = [v5 info];
  LOBYTE(v3) = [v6 isBlockedForScreenTimeExpiration];

  return (char)v3;
}

- (BOOL)_isBundleIdentifierBlockedForCommunicationPolicy:(id)a3
{
  id v3 = a3;
  id v4 = +[SBCommunicationPolicyManager sharedInstance];
  char v5 = [v4 shouldScreenTimeSuppressNotificationsForBundleIdentifier:v3];

  return v5;
}

- (BOOL)_shouldRealert
{
  id v3 = [(SBNCAlertingController *)self lockScreenManager];
  if ([v3 isUILocked])
  {
    id v4 = [(SBNCAlertingController *)self lockScreenManager];
    int v5 = [v4 isInLostMode] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_killRealertsForNotificationRequest:(id)a3
{
  id v4 = a3;
  int v5 = [(SBNCAlertingController *)self activeRequestWithRealerts];
  BOOL v6 = [v5 notificationIdentifier];
  id v7 = [v4 notificationIdentifier];

  LODWORD(v4) = [v6 isEqualToString:v7];
  if (v4)
  {
    [(SBNCAlertingController *)self killRealerts];
  }
}

- (void)_realertTimerFired:(id)a3
{
  id v7 = a3;
  if ([(SBNCAlertingController *)self _shouldRealert])
  {
    id v4 = [(SBNCAlertingController *)self realertTimers];
    if ([v4 containsObject:v7])
    {
      int v5 = [(SBNCAlertingController *)self activeRequestWithRealerts];

      if (!v5) {
        goto LABEL_6;
      }
      id v4 = [(SBNCAlertingController *)self activeRequestWithRealerts];
      [(SBNCAlertingController *)self _alertNowForNotificationRequest:v4];
    }
  }
LABEL_6:
  BOOL v6 = [(SBNCAlertingController *)self realertTimers];
  [v6 removeObject:v7];
}

- (void)_scheduleRealertsForNotificationRequest:(id)a3
{
  id v15 = a3;
  id v4 = [v15 options];
  uint64_t v5 = [v4 realertCount];

  BOOL v6 = [(SBNCAlertingController *)self _shouldRealert];
  if (v15 && v6 && v5)
  {
    [(SBNCAlertingController *)self killRealerts];
    [(SBNCAlertingController *)self setActiveRequestWithRealerts:v15];
    uint64_t v7 = 0;
    unint64_t v8 = 120;
    do
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.springboard.alertingcontroller.realert-%ld", ++v7);
      id v10 = objc_alloc(MEMORY[0x1E4F89D38]);
      int v11 = [v15 notificationIdentifier];
      int v12 = (void *)[v10 initWithTimeInterval:v9 serviceIdentifier:self target:sel__realertTimerFired_ selector:v11 userInfo:(double)v8];

      [v12 setUserVisible:1];
      [v12 setMinimumEarlyFireProportion:1.0];
      uint64_t v13 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      [v12 scheduleInRunLoop:v13];

      uint64_t v14 = [(SBNCAlertingController *)self realertTimers];
      [v14 addObject:v12];

      v8 += 120;
    }
    while (v5 != v7);
  }
}

- (SBNCSoundController)soundController
{
  return self->_soundController;
}

- (void)setSoundController:(id)a3
{
}

- (SBNCScreenController)screenController
{
  return self->_screenController;
}

- (void)setScreenController:(id)a3
{
}

- (SBLockScreenManager)lockScreenManager
{
  return self->_lockScreenManager;
}

- (void)setLockScreenManager:(id)a3
{
}

- (SBCommunicationPolicyManager)communicationPolicyManager
{
  return self->_communicationPolicyManager;
}

- (void)setCommunicationPolicyManager:(id)a3
{
}

- (NCNotificationRequest)activeRequestWithRealerts
{
  return self->_activeRequestWithRealerts;
}

- (void)setActiveRequestWithRealerts:(id)a3
{
}

- (NSMutableSet)realertTimers
{
  return self->_realertTimers;
}

- (void)setRealertTimers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realertTimers, 0);
  objc_storeStrong((id *)&self->_activeRequestWithRealerts, 0);
  objc_storeStrong((id *)&self->_communicationPolicyManager, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_screenController, 0);
  objc_storeStrong((id *)&self->_soundController, 0);
}

@end