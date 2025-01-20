@interface SBVideoOutController
+ (id)sharedInstance;
+ (id)sharedInstanceIfExists;
- (BOOL)_displayMonitorHasAConnectedExternalIdentity;
- (BOOL)isScreenSharing;
- (SBVideoOutController)init;
- (void)_authenticationStateChanged:(id)a3;
- (void)_main_clearScreenSharingBackgroundActivityAssertion;
- (void)_main_clearVideoOutBackgroundActivityAssertion;
- (void)_main_startVideoOutBackgroundActivityAssertion;
- (void)_main_updateScreenSharingBackgroundActivityAssertion;
- (void)_main_updateScreenSharingBackgroundActivityAssertionSuppressionPreference:(id)a3;
- (void)_main_updateVideoOutBackgroundActivityAssertion;
- (void)_notifyThatScreenSharingChanged;
- (void)_registerForNotifications;
- (void)_unregisterForNotifications;
- (void)_updateAVRoutes;
- (void)_updateDisplayMonitorState;
- (void)_updateScreenMirroringObserverWithSuppressionPreferenceFromDefaults:(id)a3;
- (void)cacheDidRebuildAfterServerDeath:(id)a3;
- (void)dealloc;
- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4;
- (void)displayPortObserver:(id)a3 connectionStateChanged:(BOOL)a4;
- (void)updateScreenSharingBackgroundActivityAssertion;
@end

@implementation SBVideoOutController

+ (id)sharedInstance
{
  if ([MEMORY[0x1E4F73138] inUserSessionLoginUI])
  {
    id v3 = 0;
  }
  else
  {
    v4 = (void *)__controllerInstance_0;
    if (!__controllerInstance_0)
    {
      kdebug_trace();
      id v5 = objc_alloc_init((Class)a1);
      v6 = (void *)__controllerInstance_0;
      __controllerInstance_0 = (uint64_t)v5;

      kdebug_trace();
      v4 = (void *)__controllerInstance_0;
    }
    id v3 = v4;
  }
  return v3;
}

+ (id)sharedInstanceIfExists
{
  return (id)__controllerInstance_0;
}

- (SBVideoOutController)init
{
  v24.receiver = self;
  v24.super_class = (Class)SBVideoOutController;
  v2 = [(SBVideoOutController *)&v24 init];
  id v3 = v2;
  if (v2)
  {
    [(SBVideoOutController *)v2 _registerForNotifications];
    v4 = objc_alloc_init(SBDisplayPortObserver);
    displayPortObserver = v3->_displayPortObserver;
    v3->_displayPortObserver = v4;

    [(SBDisplayPortObserver *)v3->_displayPortObserver startMatchingNotifications];
    [(SBDisplayPortObserver *)v3->_displayPortObserver setDelegate:v3];
    uint64_t v6 = +[SBAVSystemControllerCache sharedInstance];
    avCache = v3->_avCache;
    v3->_avCache = (SBAVSystemControllerCache *)v6;

    [(SBAVSystemControllerCache *)v3->_avCache addObserver:v3];
    v8 = [MEMORY[0x1E4F62420] sharedInstance];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__SBVideoOutController_init__block_invoke;
    block[3] = &unk_1E6AF5290;
    id v22 = v8;
    v9 = v3;
    v23 = v9;
    id v10 = v8;
    v11 = (void *)MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], block);
    v12 = +[SBDefaults localDefaults];
    v13 = [v12 statusBarDefaults];

    v9->_screenSharingSetsBackgroundActivity = [v13 suppressStatusBarOverrideForScreenSharing] ^ 1;
    [(SBVideoOutController *)v9 _updateScreenMirroringObserverWithSuppressionPreferenceFromDefaults:v13];
    v14 = [NSString stringWithUTF8String:"suppressStatusBarOverrideForScreenSharing"];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __28__SBVideoOutController_init__block_invoke_2;
    v18[3] = &unk_1E6AF5290;
    v19 = v9;
    id v20 = v13;
    id v15 = v13;
    id v16 = (id)[v15 observeDefault:v14 onQueue:v11 withBlock:v18];
  }
  return v3;
}

uint64_t __28__SBVideoOutController_init__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) addObserver:*(void *)(a1 + 40)];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "connectedIdentities", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v9 = *(void **)(a1 + 32);
        v8 = *(void **)(a1 + 40);
        id v10 = [v9 configurationForIdentity:v7];
        [v8 displayMonitor:v9 didConnectIdentity:v7 withConfiguration:v10];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) _updateAVRoutes];
}

uint64_t __28__SBVideoOutController_init__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_main_updateScreenSharingBackgroundActivityAssertionSuppressionPreference:", *(void *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _updateScreenMirroringObserverWithSuppressionPreferenceFromDefaults:v3];
}

- (void)dealloc
{
  [(SBVideoOutController *)self _unregisterForNotifications];
  [(NSTimer *)self->_videoOutBackgroundActivityTimer invalidate];
  [(SBSBackgroundActivityAssertion *)self->_videoOutBackgroundActivityAssertion invalidate];
  [(NSTimer *)self->_screenSharingBackgroundActivityTimer invalidate];
  [(SBSBackgroundActivityAssertion *)self->_screenSharingBackgroundActivityAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBVideoOutController;
  [(SBVideoOutController *)&v3 dealloc];
}

- (BOOL)isScreenSharing
{
  return self->_screenSharingViaAVSystemController || self->_screenSharingViaDisplayMonitor;
}

- (void)_registerForNotifications
{
  [(SBVideoOutController *)self _unregisterForNotifications];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__authenticationStateChanged_ name:*MEMORY[0x1E4FA6140] object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)SBVideoOutController_DisplayPortAccessoryConnected, @"com.apple.HaywireAccessoryAttached", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_unregisterForNotifications
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (BOOL)_displayMonitorHasAConnectedExternalIdentity
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(MEMORY[0x1E4F62420], "sharedInstance", 0);
  objc_super v3 = [v2 connectedIdentities];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(id *)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 isExternal])
        {
          uint64_t v8 = [v7 type];

          if (v8 == 1)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
LABEL_12:

  return v4;
}

- (void)_updateAVRoutes
{
  BOOL v3 = [(SBAVSystemControllerCache *)self->_avCache isAirplayDisplayActive];
  if (self->_screenSharingViaAVSystemController != v3)
  {
    self->_screenSharingViaAVSystemController = v3;
    [(SBVideoOutController *)self updateScreenSharingBackgroundActivityAssertion];
    [(SBVideoOutController *)self _notifyThatScreenSharingChanged];
  }
}

- (void)_updateDisplayMonitorState
{
  BOOL v3 = [(SBVideoOutController *)self _displayMonitorHasAConnectedExternalIdentity];
  if (self->_screenSharingViaDisplayMonitor != v3)
  {
    self->_screenSharingViaDisplayMonitor = v3;
    BSDispatchMain();
    [(SBVideoOutController *)self _notifyThatScreenSharingChanged];
  }
}

uint64_t __50__SBVideoOutController__updateDisplayMonitorState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_updateVideoOutBackgroundActivityAssertion");
}

- (void)_notifyThatScreenSharingChanged
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SBAirPlayScreenSharingStatusChangedNotificationName" object:self userInfo:0];
}

- (void)_authenticationStateChanged:(id)a3
{
  uint64_t v4 = objc_msgSend((id)SBApp, "authenticationController", a3);
  int v5 = [v4 isAuthenticated];

  if (v5)
  {
    [(SBVideoOutController *)self updateScreenSharingBackgroundActivityAssertion];
  }
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v6 = a4;
  if ([v6 isExternal] && objc_msgSend(v6, "type") == 1) {
    [(SBVideoOutController *)self _updateDisplayMonitorState];
  }
}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  id v5 = a4;
  if ([v5 isExternal] && objc_msgSend(v5, "type") == 1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__SBVideoOutController_displayMonitor_willDisconnectIdentity___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __62__SBVideoOutController_displayMonitor_willDisconnectIdentity___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDisplayMonitorState];
}

- (void)cacheDidRebuildAfterServerDeath:(id)a3
{
  [(SBVideoOutController *)self _registerForNotifications];
  [(SBVideoOutController *)self _updateAVRoutes];
}

- (void)displayPortObserver:(id)a3 connectionStateChanged:(BOOL)a4
{
}

uint64_t __67__SBVideoOutController_displayPortObserver_connectionStateChanged___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1) {
    return objc_msgSend(v2, "_main_startVideoOutBackgroundActivityAssertion");
  }
  else {
    return objc_msgSend(v2, "_main_clearVideoOutBackgroundActivityAssertion");
  }
}

- (void)_main_clearScreenSharingBackgroundActivityAssertion
{
  BSDispatchQueueAssertMain();
  [(NSTimer *)self->_screenSharingBackgroundActivityTimer invalidate];
  screenSharingBackgroundActivityTimer = self->_screenSharingBackgroundActivityTimer;
  self->_screenSharingBackgroundActivityTimer = 0;

  if (self->_screenSharingBackgroundActivityAssertion)
  {
    if (![(SBVideoOutController *)self isScreenSharing]
      || ([(id)SBApp authenticationController],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          int v5 = [v4 isAuthenticated],
          v4,
          v5))
    {
      [(SBSBackgroundActivityAssertion *)self->_screenSharingBackgroundActivityAssertion invalidate];
      screenSharingBackgroundActivityAssertion = self->_screenSharingBackgroundActivityAssertion;
      self->_screenSharingBackgroundActivityAssertion = 0;
    }
  }
}

- (void)updateScreenSharingBackgroundActivityAssertion
{
}

uint64_t __70__SBVideoOutController_updateScreenSharingBackgroundActivityAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_updateScreenSharingBackgroundActivityAssertion");
}

- (void)_main_updateScreenSharingBackgroundActivityAssertion
{
  BSDispatchQueueAssertMain();
  if (self->_screenSharingViaAVSystemController && self->_screenSharingSetsBackgroundActivity)
  {
    if (!self->_screenSharingBackgroundActivityAssertion)
    {
      id v3 = [MEMORY[0x1E4FA6A18] assertionWithBackgroundActivityIdentifier:*MEMORY[0x1E4FA9688] forPID:getpid() exclusive:1 showsWhenForeground:1];
      screenSharingBackgroundActivityAssertion = self->_screenSharingBackgroundActivityAssertion;
      self->_screenSharingBackgroundActivityAssertion = v3;

      objc_initWeak(&location, self);
      int v5 = self->_screenSharingBackgroundActivityAssertion;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __76__SBVideoOutController__main_updateScreenSharingBackgroundActivityAssertion__block_invoke_18;
      v11[3] = &unk_1E6AF4B10;
      objc_copyWeak(&v12, &location);
      [(SBSBackgroundActivityAssertion *)v5 acquireWithHandler:&__block_literal_global_14 invalidationHandler:v11];
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    [(NSTimer *)self->_screenSharingBackgroundActivityTimer invalidate];
    objc_initWeak(&location, self);
    id v6 = (void *)MEMORY[0x1E4F1CB00];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__SBVideoOutController__main_updateScreenSharingBackgroundActivityAssertion__block_invoke_3;
    v9[3] = &unk_1E6AF61A0;
    objc_copyWeak(&v10, &location);
    id v7 = [v6 scheduledTimerWithTimeInterval:0 repeats:v9 block:30.0];
    screenSharingBackgroundActivityTimer = self->_screenSharingBackgroundActivityTimer;
    self->_screenSharingBackgroundActivityTimer = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    [(SBVideoOutController *)self _main_clearScreenSharingBackgroundActivityAssertion];
  }
}

void __76__SBVideoOutController__main_updateScreenSharingBackgroundActivityAssertion__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v2 = SBLogVideoOut();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Failed to acquire screen sharing background activity assertion", v3, 2u);
    }
  }
}

void __76__SBVideoOutController__main_updateScreenSharingBackgroundActivityAssertion__block_invoke_18(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(&v1);
}

void __76__SBVideoOutController__main_updateScreenSharingBackgroundActivityAssertion__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_main_clearScreenSharingBackgroundActivityAssertion");
}

void __76__SBVideoOutController__main_updateScreenSharingBackgroundActivityAssertion__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(&v4);
}

void __76__SBVideoOutController__main_updateScreenSharingBackgroundActivityAssertion__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_main_clearScreenSharingBackgroundActivityAssertion");
}

- (void)_main_updateScreenSharingBackgroundActivityAssertionSuppressionPreference:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  int v5 = [v4 suppressStatusBarOverrideForScreenSharing];

  self->_screenSharingSetsBackgroundActivity = v5 ^ 1;
  if (((v5 ^ 1) & 1) == 0) {
    [(SBVideoOutController *)self _main_clearScreenSharingBackgroundActivityAssertion];
  }
  [(SBVideoOutController *)self _updateAVRoutes];
}

- (void)_updateScreenMirroringObserverWithSuppressionPreferenceFromDefaults:(id)a3
{
  char v4 = [a3 suppressStatusBarOverrideForScreenSharing];
  screenMirroringObserver = self->_screenMirroringObserver;
  if (v4)
  {
    if (!screenMirroringObserver) {
      return;
    }
    id v6 = 0;
  }
  else
  {
    if (screenMirroringObserver) {
      return;
    }
    uint64_t v7 = SBFEffectiveArtworkSubtype();
    if (v7 > 2795)
    {
      if (v7 != 2868 && v7 != 2796) {
        return;
      }
    }
    else if (v7 != 2556 && v7 != 2622)
    {
      return;
    }
    id v6 = [MEMORY[0x1E4F770C8] UIControllingObserver];
    screenMirroringObserver = self->_screenMirroringObserver;
  }
  self->_screenMirroringObserver = v6;
}

- (void)_main_clearVideoOutBackgroundActivityAssertion
{
  BSDispatchQueueAssertMain();
  [(NSTimer *)self->_videoOutBackgroundActivityTimer invalidate];
  videoOutBackgroundActivityTimer = self->_videoOutBackgroundActivityTimer;
  self->_videoOutBackgroundActivityTimer = 0;

  videoOutBackgroundActivityAssertion = self->_videoOutBackgroundActivityAssertion;
  if (videoOutBackgroundActivityAssertion)
  {
    [(SBSBackgroundActivityAssertion *)videoOutBackgroundActivityAssertion invalidate];
    int v5 = self->_videoOutBackgroundActivityAssertion;
    self->_videoOutBackgroundActivityAssertion = 0;
  }
}

- (void)_main_startVideoOutBackgroundActivityAssertion
{
  BSDispatchQueueAssertMain();
  videoOutBackgroundActivityTimer = self->_videoOutBackgroundActivityTimer;
  if (videoOutBackgroundActivityTimer)
  {
    [(NSTimer *)videoOutBackgroundActivityTimer invalidate];
  }
  else if (!self->_videoOutBackgroundActivityAssertion)
  {
    char v4 = [MEMORY[0x1E4FA6A18] assertionWithBackgroundActivityIdentifier:*MEMORY[0x1E4FA96D0] forPID:getpid() exclusive:1 showsWhenForeground:1];
    videoOutBackgroundActivityAssertion = self->_videoOutBackgroundActivityAssertion;
    self->_videoOutBackgroundActivityAssertion = v4;

    objc_initWeak(&location, self);
    id v6 = self->_videoOutBackgroundActivityAssertion;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__SBVideoOutController__main_startVideoOutBackgroundActivityAssertion__block_invoke_24;
    v12[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v13, &location);
    [(SBSBackgroundActivityAssertion *)v6 acquireWithHandler:&__block_literal_global_23 invalidationHandler:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  uint64_t v7 = (void *)MEMORY[0x1E4F1CB00];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__SBVideoOutController__main_startVideoOutBackgroundActivityAssertion__block_invoke_3;
  v10[3] = &unk_1E6AF61A0;
  objc_copyWeak(&v11, &location);
  uint64_t v8 = [v7 scheduledTimerWithTimeInterval:0 repeats:v10 block:10.0];
  v9 = self->_videoOutBackgroundActivityTimer;
  self->_videoOutBackgroundActivityTimer = v8;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __70__SBVideoOutController__main_startVideoOutBackgroundActivityAssertion__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v2 = SBLogVideoOut();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Failed to acquire video out background activity assertion", v3, 2u);
    }
  }
}

void __70__SBVideoOutController__main_startVideoOutBackgroundActivityAssertion__block_invoke_24(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(&v1);
}

void __70__SBVideoOutController__main_startVideoOutBackgroundActivityAssertion__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_main_clearVideoOutBackgroundActivityAssertion");
}

void __70__SBVideoOutController__main_startVideoOutBackgroundActivityAssertion__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(&v4);
}

void __70__SBVideoOutController__main_startVideoOutBackgroundActivityAssertion__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_main_clearVideoOutBackgroundActivityAssertion");
}

- (void)_main_updateVideoOutBackgroundActivityAssertion
{
  BSDispatchQueueAssertMain();
  if (self->_screenSharingViaDisplayMonitor && !self->_screenSharingViaAVSystemController)
  {
    [(SBVideoOutController *)self _main_startVideoOutBackgroundActivityAssertion];
  }
  else
  {
    [(SBVideoOutController *)self _main_clearVideoOutBackgroundActivityAssertion];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayPortObserver, 0);
  objc_storeStrong((id *)&self->_avCache, 0);
  objc_storeStrong((id *)&self->_videoOutBackgroundActivityAssertion, 0);
  objc_storeStrong((id *)&self->_screenSharingBackgroundActivityAssertion, 0);
  objc_storeStrong((id *)&self->_screenMirroringObserver, 0);
  objc_storeStrong((id *)&self->_videoOutBackgroundActivityTimer, 0);
  objc_storeStrong((id *)&self->_screenSharingBackgroundActivityTimer, 0);
}

uint64_t __SBVideoOutController_DisplayPortAccessoryConnected_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_startVideoOutBackgroundActivityAssertion");
}

@end