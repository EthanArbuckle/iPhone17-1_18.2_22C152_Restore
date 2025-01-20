@interface SBNCNotificationDispatcher
- (BOOL)_lockScreenWantsBanners;
- (BOOL)isCarDestinationActive;
- (BOOL)isNotificationContentExtensionVisible:(id)a3;
- (BSServiceConnectionEndpoint)carOpenServiceEndpoint;
- (NCBulletinNotificationSource)notificationSource;
- (NCNotificationDispatcher)dispatcher;
- (SBCommunicationPolicyManager)communicationPolicyManager;
- (SBLockScreenManager)lockScreenManager;
- (SBLockStateAggregator)lockStateAggregator;
- (SBNCAlertingController)alertingController;
- (SBNCNotificationDispatcher)init;
- (SBNCNotificationDispatcherDelegate)dispatcherDelegate;
- (SBNotificationBannerDestination)bannerDestination;
- (SBNotificationCarPlayDestination)carDestination;
- (SBNotificationCenterDestination)notificationCenterDestination;
- (SBNotificationDestination)dashBoardDestination;
- (SBUserAlertNotificationSource)userNotificationAlertSource;
- (SBWalletNotificationSource)walletNotificationSource;
- (id)keyWindowForScreen:(id)a3;
- (void)_aggregateLockStateDidChange;
- (void)_carPlayDestinationAvailabilityDidChange;
- (void)_setupNewDestinationsForDispatcher:(id)a3;
- (void)_updateActiveDestinations;
- (void)coverSheetViewController:(id)a3 didChangeActiveBehavior:(id)a4;
- (void)setAlertingController:(id)a3;
- (void)setCarDestination:(id)a3;
- (void)setCommunicationPolicyManager:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setDispatcherDelegate:(id)a3;
- (void)setLockScreenManager:(id)a3;
- (void)setLockStateAggregator:(id)a3;
- (void)setNotificationSource:(id)a3;
- (void)setUserNotificationAlertSource:(id)a3;
@end

@implementation SBNCNotificationDispatcher

- (SBNotificationBannerDestination)bannerDestination
{
  return self->_bannerDestination;
}

- (id)keyWindowForScreen:(id)a3
{
  id v4 = a3;
  if ([(SBNCNotificationDispatcher *)self isCarDestinationActive])
  {
    v5 = [(SBNotificationCarPlayDestination *)self->_carDestination keyWindowForScreen:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isCarDestinationActive
{
  return [(SBNotificationCarPlayDestination *)self->_carDestination isActive];
}

- (SBNCNotificationDispatcher)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)SBNCNotificationDispatcher;
  v2 = [(SBNCNotificationDispatcher *)&v29 init];
  if (v2)
  {
    NCRegisterUserNotificationsUILogging();
    v3 = *MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v2;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Setting up SpringBoard notifications dispatcher %{public}@", buf, 0xCu);
    }
    id v4 = +[SBBacklightController sharedInstance];
    uint64_t v5 = +[SBLockScreenManager sharedInstance];
    lockScreenManager = v2->_lockScreenManager;
    v2->_lockScreenManager = (SBLockScreenManager *)v5;

    uint64_t v7 = +[SBLockStateAggregator sharedInstance];
    lockStateAggregator = v2->_lockStateAggregator;
    v2->_lockStateAggregator = (SBLockStateAggregator *)v7;

    uint64_t v9 = +[SBCommunicationPolicyManager sharedInstance];
    communicationPolicyManager = v2->_communicationPolicyManager;
    v2->_communicationPolicyManager = (SBCommunicationPolicyManager *)v9;

    v11 = [[SBNCSoundController alloc] initWithLockScreenManager:v2->_lockScreenManager lockStateAggregator:v2->_lockStateAggregator];
    v12 = [[SBNCScreenController alloc] initWithBackLightController:v4 lockScreenManager:v2->_lockScreenManager lockStateAggregator:v2->_lockStateAggregator];
    v13 = [[SBNCAlertingController alloc] initWithSoundController:v11 screenController:v12 lockScreenManager:v2->_lockScreenManager communicationPolicyManager:v2->_communicationPolicyManager];
    alertingController = v2->_alertingController;
    v2->_alertingController = v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4FB37E0]) initWithAlertingController:v2->_alertingController];
    dispatcher = v2->_dispatcher;
    v2->_dispatcher = (NCNotificationDispatcher *)v15;

    v17 = objc_alloc_init(SBNCNotificationDispatcherDelegate);
    dispatcherDelegate = v2->_dispatcherDelegate;
    v2->_dispatcherDelegate = v17;

    [(NCNotificationDispatcher *)v2->_dispatcher setDelegate:v2->_dispatcherDelegate];
    [(SBNCNotificationDispatcher *)v2 _setupNewDestinationsForDispatcher:v2->_dispatcher];
    [(SBNCNotificationDispatcher *)v2 _updateActiveDestinations];
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4FB38B8]) initWithDispatcher:v2->_dispatcher];
    notificationSource = v2->_notificationSource;
    v2->_notificationSource = (NCBulletinNotificationSource *)v19;

    v21 = [[SBWalletNotificationSource alloc] initWithDispatcher:v2->_dispatcher];
    walletNotificationSource = v2->_walletNotificationSource;
    v2->_walletNotificationSource = v21;

    v23 = [[SBUserAlertNotificationSource alloc] initWithDispatcher:v2->_dispatcher];
    userNotificationAlertSource = v2->_userNotificationAlertSource;
    v2->_userNotificationAlertSource = v23;

    v25 = +[SBAlertItemsController sharedInstance];
    [v25 setLockScreenNotificationsAlertItemPresenter:v2->_userNotificationAlertSource];

    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v26 addObserver:v2 selector:sel__aggregateLockStateDidChange name:@"SBAggregateLockStateDidChangeNotification" object:0];
    [v26 addObserver:v2 selector:sel__carPlayDestinationAvailabilityDidChange name:@"SBNotificationCarPlayDestinationAvailabilityDidChange" object:0];
    v27 = [(SBLockScreenManager *)v2->_lockScreenManager coverSheetViewController];
    [v27 addCoverSheetObserver:v2];
  }
  return v2;
}

- (BSServiceConnectionEndpoint)carOpenServiceEndpoint
{
  return [(SBNotificationCarPlayDestination *)self->_carDestination endpoint];
}

- (void)_aggregateLockStateDidChange
{
  v3 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Lock state changed", v4, 2u);
  }
  [(SBNCNotificationDispatcher *)self _updateActiveDestinations];
}

- (void)_carPlayDestinationAvailabilityDidChange
{
  v3 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "CarPlay destination availability changed", v4, 2u);
  }
  [(SBNCNotificationDispatcher *)self _updateActiveDestinations];
}

- (void)_updateActiveDestinations
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = +[SBLockScreenManager sharedInstance];
  int v4 = [v3 isUILocked];

  uint64_t v5 = [(SBNCNotificationDispatcher *)self lockScreenManager];
  int v6 = [v5 isInLostMode];

  BOOL v7 = [(SBNCNotificationDispatcher *)self isCarDestinationActive];
  uint64_t v8 = v4 ^ 1 | [(SBNCNotificationDispatcher *)self _lockScreenWantsBanners];
  uint64_t v9 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109888;
    v15[1] = v4;
    __int16 v16 = 1024;
    int v17 = v6;
    __int16 v18 = 1024;
    BOOL v19 = v7;
    __int16 v20 = 1024;
    int v21 = v8;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Updating active destinations [ lockScreenVisible: %d lostMode: %d carPlay: %d bannersActive : %d ]", (uint8_t *)v15, 0x1Au);
  }
  v10 = [(SBNCNotificationDispatcher *)self dispatcher];
  [v10 registerDestination:self->_bannerDestination];
  v11 = [(SBNCNotificationDispatcher *)self bannerDestination];
  [v10 setDestination:v11 enabled:v8];

  if ((v8 & 1) == 0) {
    [(SBNotificationBannerDestination *)self->_bannerDestination destinationDidBecomeDisabled];
  }
  if (self->_dashBoardDestination)
  {
    objc_msgSend(v10, "registerDestination:");
    v12 = [(SBNCNotificationDispatcher *)self dashBoardDestination];
    [v10 setDestination:v12 enabled:1];
  }
  carDestination = self->_carDestination;
  if (v7)
  {
    [v10 registerDestination:carDestination];
    v14 = [(SBNCNotificationDispatcher *)self carDestination];
    [v10 setDestination:v14 enabled:1];
  }
  else
  {
    [v10 unregisterDestination:carDestination];
  }
}

- (void)_setupNewDestinationsForDispatcher:(id)a3
{
  int v4 = objc_alloc_init(SBNotificationCarPlayDestination);
  carDestination = self->_carDestination;
  self->_carDestination = v4;

  int v6 = self->_carDestination;
  BOOL v7 = [(SBNCNotificationDispatcher *)self alertingController];
  [(SBNotificationCarPlayDestination *)v6 setAlertingController:v7];

  uint64_t v8 = objc_alloc_init(SBNotificationBannerDestination);
  bannerDestination = self->_bannerDestination;
  self->_bannerDestination = v8;

  v10 = self->_bannerDestination;
  v11 = +[SBSetupManager sharedInstance];
  [(SBNotificationBannerDestination *)v10 setSetupManager:v11];

  v12 = self->_bannerDestination;
  v13 = +[SBLockScreenManager sharedInstance];
  [(SBNotificationBannerDestination *)v12 setLockScreenManager:v13];

  v14 = self->_bannerDestination;
  uint64_t v15 = +[SBAssistantController sharedInstance];
  [(SBNotificationBannerDestination *)v14 setAssistantController:v15];

  [(SBNCNotificationDispatcherDelegate *)self->_dispatcherDelegate setBannerDestination:self->_bannerDestination];
  __int16 v16 = +[SBLockScreenManager sharedInstance];
  int v17 = [v16 notificationDestination];
  dashBoardDestination = self->_dashBoardDestination;
  self->_dashBoardDestination = v17;

  BOOL v19 = self->_dashBoardDestination;
  id v20 = [(SBNCNotificationDispatcher *)self alertingController];
  [(SBNotificationDestination *)v19 setAlertingController:v20];
}

- (BOOL)_lockScreenWantsBanners
{
  v2 = +[SBLockScreenManager sharedInstanceIfExists];
  v3 = [v2 coverSheetViewController];
  int v4 = [v3 activeBehavior];
  BOOL v5 = [v4 notificationBehavior] == 2;

  return v5;
}

- (void)coverSheetViewController:(id)a3 didChangeActiveBehavior:(id)a4
{
  BOOL v5 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Cover Sheet active behavior changed", v6, 2u);
  }
  [(SBNCNotificationDispatcher *)self _updateActiveDestinations];
}

- (BOOL)isNotificationContentExtensionVisible:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBNCNotificationDispatcher *)self dashBoardDestination];
  if ([v5 isNotificationContentExtensionVisible:v4])
  {
    char v6 = 1;
  }
  else
  {
    BOOL v7 = [(SBNCNotificationDispatcher *)self bannerDestination];
    char v6 = [v7 isNotificationContentExtensionVisible:v4];
  }
  return v6;
}

- (SBNotificationDestination)dashBoardDestination
{
  return self->_dashBoardDestination;
}

- (SBWalletNotificationSource)walletNotificationSource
{
  return self->_walletNotificationSource;
}

- (SBNotificationCenterDestination)notificationCenterDestination
{
  return self->_notificationCenterDestination;
}

- (NCNotificationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
}

- (SBNCNotificationDispatcherDelegate)dispatcherDelegate
{
  return self->_dispatcherDelegate;
}

- (void)setDispatcherDelegate:(id)a3
{
}

- (NCBulletinNotificationSource)notificationSource
{
  return self->_notificationSource;
}

- (void)setNotificationSource:(id)a3
{
}

- (SBUserAlertNotificationSource)userNotificationAlertSource
{
  return self->_userNotificationAlertSource;
}

- (void)setUserNotificationAlertSource:(id)a3
{
}

- (SBLockScreenManager)lockScreenManager
{
  return self->_lockScreenManager;
}

- (void)setLockScreenManager:(id)a3
{
}

- (SBLockStateAggregator)lockStateAggregator
{
  return self->_lockStateAggregator;
}

- (void)setLockStateAggregator:(id)a3
{
}

- (SBNotificationCarPlayDestination)carDestination
{
  return self->_carDestination;
}

- (void)setCarDestination:(id)a3
{
}

- (SBCommunicationPolicyManager)communicationPolicyManager
{
  return self->_communicationPolicyManager;
}

- (void)setCommunicationPolicyManager:(id)a3
{
}

- (SBNCAlertingController)alertingController
{
  return self->_alertingController;
}

- (void)setAlertingController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertingController, 0);
  objc_storeStrong((id *)&self->_communicationPolicyManager, 0);
  objc_storeStrong((id *)&self->_carDestination, 0);
  objc_storeStrong((id *)&self->_lockStateAggregator, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_userNotificationAlertSource, 0);
  objc_storeStrong((id *)&self->_notificationSource, 0);
  objc_storeStrong((id *)&self->_dispatcherDelegate, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_notificationCenterDestination, 0);
  objc_storeStrong((id *)&self->_walletNotificationSource, 0);
  objc_storeStrong((id *)&self->_dashBoardDestination, 0);
  objc_storeStrong((id *)&self->_bannerDestination, 0);
}

@end