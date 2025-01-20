@interface SBSetupManager
+ (SBSetupManager)sharedInstance;
- (BOOL)_isInSetupMode;
- (BOOL)_setSetupRequiredReason:(unint64_t)a3;
- (BOOL)isDeferringDeviceOrientationUpdates;
- (BOOL)isInSetupModeForDeviceMigration;
- (BOOL)isInSetupModeReadyToExit;
- (BOOL)setupHasFinishedRestoringFromBackup;
- (BOOL)updateInSetupMode;
- (NSHashTable)floatingDockControllers;
- (NSMapTable)floatingDockBehaviorAssertionsByFloatingDockController;
- (SBSetupManager)init;
- (void)_invalidateFloatingDockBehaviorAssertions;
- (void)_setupProcessChangedNotificationReceived:(id)a3;
- (void)_takeFloatingDockBehaviorAssertionForFloatingDockController:(id)a3;
- (void)_takeFloatingDockBehaviorAssertions;
- (void)_toggleSetupForMigrationNeeded:(BOOL)a3 forReason:(id)a4;
- (void)dealloc;
- (void)eventSource:(id)a3 didBeginTransitionToMode:(int64_t)a4 withLayoutState:(id)a5 activatingElement:(id)a6 triggeredBy:(int64_t)a7;
- (void)floatingDockControllerDidRegister:(id)a3;
- (void)noteAuthenticationSucceededWithPasscode:(id)a3;
- (void)postLaunchCompleteNotificationForSetup;
- (void)setDeferringDeviceOrientationUpdates:(BOOL)a3;
- (void)setInSetupModeReadyToExit:(BOOL)a3;
@end

@implementation SBSetupManager

- (BOOL)_isInSetupMode
{
  return self->_setupRequiredReason != 0;
}

+ (SBSetupManager)sharedInstance
{
  if (sharedInstance___once_2 != -1) {
    dispatch_once(&sharedInstance___once_2, &__block_literal_global_9_0);
  }
  v2 = (void *)sharedInstance___instance_3;
  return (SBSetupManager *)v2;
}

uint64_t __32__SBSetupManager_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBSetupManager);
  v1 = (void *)sharedInstance___instance_3;
  sharedInstance___instance_3 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBSetupManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBSetupManager;
  v2 = [(SBSetupManager *)&v9 init];
  if (v2)
  {
    if (SBPrepareLaunchSentinelIfNecessary___once != -1) {
      dispatch_once(&SBPrepareLaunchSentinelIfNecessary___once, &__block_literal_global_124);
    }
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    floatingDockControllers = v2->_floatingDockControllers;
    v2->_floatingDockControllers = (NSHashTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    floatingDockBehaviorAssertionsByFloatingDockController = v2->_floatingDockBehaviorAssertionsByFloatingDockController;
    v2->_floatingDockBehaviorAssertionsByFloatingDockController = (NSMapTable *)v5;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)SBSetupDeviceMigrationNotificationReceived, (CFStringRef)*MEMORY[0x1E4F9AA20], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  [(SBSetupManager *)self _invalidateFloatingDockBehaviorAssertions];
  v3.receiver = self;
  v3.super_class = (Class)SBSetupManager;
  [(SBSetupManager *)&v3 dealloc];
}

- (BOOL)isInSetupModeReadyToExit
{
  BOOL v3 = [(SBSetupManager *)self _isInSetupMode];
  if (v3) {
    LOBYTE(v3) = self->_inSetupModeReadyToExit;
  }
  return v3;
}

- (BOOL)isInSetupModeForDeviceMigration
{
  return self->_setupRequiredReason == 3;
}

- (BOOL)updateInSetupMode
{
  BOOL v3 = +[SBLockScreenManager sharedInstanceIfExists];
  if (([v3 isInLostMode] & 1) == 0)
  {

    goto LABEL_7;
  }
  v4 = [(id)SBApp authenticationController];
  int v5 = [v4 hasPasscodeSet];

  if (!v5)
  {
LABEL_7:
    v7 = [(id)SBApp userSessionController];
    if ([v7 isMultiUserSupported] && objc_msgSend(v7, "isLoginSession"))
    {
      v8 = self;
      uint64_t v9 = 0;
LABEL_24:
      BOOL v16 = [(SBSetupManager *)v8 _setSetupRequiredReason:v9];

      return v16;
    }
    if (BYSetupAssistantNeedsToRun())
    {
      v10 = SBLogCommon();
      uint64_t v11 = 1;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        __int16 v19 = 0;
        v12 = "inSetupMode = YES because BYSetupAssistantNeedsToRun() returned YES";
        uint64_t v11 = 1;
        v13 = (uint8_t *)&v19;
LABEL_16:
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, v12, v13, 2u);
      }
    }
    else
    {
      v14 = +[SBLockdownManager sharedInstance];
      int v15 = [v14 brickedDevice];

      if (v15)
      {
        v10 = SBLogCommon();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = 2;
          goto LABEL_22;
        }
        *(_WORD *)buf = 0;
        v12 = "inSetupMode = YES because SBLockdownManager reports we have a bricked device";
        uint64_t v11 = 2;
        v13 = buf;
        goto LABEL_16;
      }
      if (!self->_setupWantedForDeviceMigration)
      {
        uint64_t v11 = 0;
        goto LABEL_23;
      }
      v10 = SBLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "inSetupMode = YES because we have been asked to migrate a device.", v17, 2u);
      }
      uint64_t v11 = 3;
    }
LABEL_22:

LABEL_23:
    v8 = self;
    uint64_t v9 = v11;
    goto LABEL_24;
  }
  return [(SBSetupManager *)self _setSetupRequiredReason:0];
}

- (BOOL)setupHasFinishedRestoringFromBackup
{
  v2 = +[SBDefaults externalDefaults];
  BOOL v3 = [v2 setupDefaults];
  v4 = [v3 setupState];

  if (v4) {
    char v5 = [v4 isEqualToString:@"RestoredFromiTunesBackup"];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)postLaunchCompleteNotificationForSetup
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.setupsnapshotremoved", 0, 0, 0);
}

- (BOOL)isDeferringDeviceOrientationUpdates
{
  return self->_deferOrientationUpdatesAssertion != 0;
}

- (void)setDeferringDeviceOrientationUpdates:(BOOL)a3
{
  deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
  if ((((deferOrientationUpdatesAssertion == 0) ^ a3) & 1) == 0)
  {
    if (a3)
    {
      char v5 = [(id)SBApp deviceOrientationUpdateDeferralAssertionWithReason:@"SBOrientationLockedForBuddy"];
    }
    else
    {
      [(BSInvalidatable *)deferOrientationUpdatesAssertion invalidate];
      char v5 = 0;
    }
    v6 = self->_deferOrientationUpdatesAssertion;
    self->_deferOrientationUpdatesAssertion = v5;
  }
}

- (void)noteAuthenticationSucceededWithPasscode:(id)a3
{
}

- (BOOL)_setSetupRequiredReason:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v5 = [(SBSetupManager *)self _isInSetupMode];
  self->_setupRequiredReason = a3;
  int v6 = [(SBSetupManager *)self _isInSetupMode];
  if (v5 != v6)
  {
    if (v6)
    {
      v7 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v8 = [v7 userInterfaceIdiom];

      if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        uint64_t v9 = +[SBWorkspace mainWorkspace];
        v10 = [v9 mainWindowScene];
        uint64_t v11 = [v10 appInteractionEventSource];
        [v11 addObserver:self];
      }
      [(SBSetupManager *)self _takeFloatingDockBehaviorAssertions];
    }
    else
    {
      self->_inSetupModeReadyToExit = 0;
      [(SBSetupManager *)self _invalidateFloatingDockBehaviorAssertions];
      v12 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v13 = [v12 userInterfaceIdiom];

      if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        v14 = +[SBWorkspace mainWorkspace];
        int v15 = [v14 mainWindowScene];
        BOOL v16 = [v15 appInteractionEventSource];
        [v16 removeObserver:self];
      }
    }
    v17 = SBLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v18 = self->_setupRequiredReason - 1;
      if (v18 > 2) {
        __int16 v19 = @"none";
      }
      else {
        __int16 v19 = off_1E6AFFE28[v18];
      }
      int v22 = 138412290;
      v23 = v19;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Setup mode state did change - required reason: %@", (uint8_t *)&v22, 0xCu);
    }

    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 postNotificationName:@"SBInBuddyModeDidChangeNotification" object:0 userInfo:0];
  }
  return [(SBSetupManager *)self isInSetupMode];
}

- (void)_toggleSetupForMigrationNeeded:(BOOL)a3 forReason:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  self->_setupWantedForDeviceMigration = a3;
  [(SBSetupManager *)self updateInSetupMode];
  v7 = +[SBApplicationController sharedInstance];
  uint64_t v8 = [v7 setupApplication];

  unint64_t setupRequiredReason = self->_setupRequiredReason;
  v10 = SBLogCommon();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (setupRequiredReason == 3)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Activating Setup for device migration.", buf, 2u);
    }

    v12 = +[SBWorkspace mainWorkspace];
    uint64_t v13 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:v8];
    id v14 = objc_alloc(MEMORY[0x1E4F42C20]);
    int v15 = [MEMORY[0x1E4F1CB10] URLWithString:*MEMORY[0x1E4F9AA28]];
    BOOL v16 = (void *)[v14 initWithURL:v15];

    v17 = [MEMORY[0x1E4F1CAD0] setWithObject:v16];
    [(SBApplicationSceneEntity *)v13 addActions:v17];

    unint64_t v18 = [v12 createRequestForApplicationActivation:v13 options:0];
    [v18 setEventLabel:@"ActivateBuddyForDeviceMigration"];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __59__SBSetupManager__toggleSetupForMigrationNeeded_forReason___block_invoke;
    v25 = &unk_1E6AF4A98;
    id v19 = v8;
    id v26 = v19;
    v27 = self;
    id v20 = (id)[v18 addCompletionHandler:&v22];
    v21 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v22, v23, v24, v25);
    [v21 addObserver:self selector:sel__setupProcessChangedNotificationReceived_ name:@"SBApplicationProcessStateDidChange" object:v19];

    [v12 executeTransitionRequest:v18];
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138543362;
      id v29 = v6;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Setup no longer required for device migration for reason: %{public}@", buf, 0xCu);
    }

    self->_setupWantedForDeviceMigration = 0;
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 removeObserver:self name:@"SBApplicationProcessStateDidChange" object:v8];
  }
}

void __59__SBSetupManager__toggleSetupForMigrationNeeded_forReason___block_invoke(uint64_t a1, int a2)
{
  if (!a2
    || ([*(id *)(a1 + 32) processState],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 isForeground],
        v3,
        (v4 & 1) == 0))
  {
    int v5 = *(void **)(a1 + 40);
    [v5 _toggleSetupForMigrationNeeded:0 forReason:@"Setup not foreground at transition completion"];
  }
}

- (void)_setupProcessChangedNotificationReceived:(id)a3
{
  id v4 = a3;
  int v5 = [v4 userInfo];
  id v8 = [v5 objectForKeyedSubscript:@"previousProcessState"];

  id v6 = [v4 object];

  v7 = [v6 processState];

  if ([v8 isForeground] && (objc_msgSend(v7, "isForeground") & 1) == 0) {
    [(SBSetupManager *)self _toggleSetupForMigrationNeeded:0 forReason:@"backgrounded or exited"];
  }
}

- (void)_takeFloatingDockBehaviorAssertions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = self->_floatingDockControllers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[SBSetupManager _takeFloatingDockBehaviorAssertionForFloatingDockController:](self, "_takeFloatingDockBehaviorAssertionForFloatingDockController:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_takeFloatingDockBehaviorAssertionForFloatingDockController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[SBFloatingDockBehaviorAssertion alloc] initWithFloatingDockController:v4 visibleProgress:1 animated:0 gesturePossible:12 atLevel:@"in setup" reason:0 withCompletion:0.0];
  [(NSMapTable *)self->_floatingDockBehaviorAssertionsByFloatingDockController setObject:v5 forKey:v4];
}

- (void)_invalidateFloatingDockBehaviorAssertions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = self->_floatingDockControllers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        long long v9 = -[NSMapTable objectForKey:](self->_floatingDockBehaviorAssertionsByFloatingDockController, "objectForKey:", v8, (void)v10);
        [v9 invalidate];
        [(NSMapTable *)self->_floatingDockBehaviorAssertionsByFloatingDockController removeObjectForKey:v8];
      }
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)floatingDockControllerDidRegister:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(NSHashTable *)self->_floatingDockControllers addObject:v6];
    if ([(SBSetupManager *)self _isInSetupMode]) {
      [(SBSetupManager *)self _takeFloatingDockBehaviorAssertionForFloatingDockController:v6];
    }
  }
}

- (void)eventSource:(id)a3 didBeginTransitionToMode:(int64_t)a4 withLayoutState:(id)a5 activatingElement:(id)a6 triggeredBy:(int64_t)a7
{
  BOOL v9 = [(SBSetupManager *)self isInSetupModeReadyToExit];
  if (a4 == 1 && v9)
  {
    [(SBSetupManager *)self _invalidateFloatingDockBehaviorAssertions];
  }
}

- (void)setInSetupModeReadyToExit:(BOOL)a3
{
  self->_inSetupModeReadyToExit = a3;
}

- (NSHashTable)floatingDockControllers
{
  return self->_floatingDockControllers;
}

- (NSMapTable)floatingDockBehaviorAssertionsByFloatingDockController
{
  return self->_floatingDockBehaviorAssertionsByFloatingDockController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingDockBehaviorAssertionsByFloatingDockController, 0);
  objc_storeStrong((id *)&self->_floatingDockControllers, 0);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
}

@end