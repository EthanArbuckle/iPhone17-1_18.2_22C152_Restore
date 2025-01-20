@interface SBContinuitySessionSystemEventMonitor
- (BOOL)_calculateIsInCall;
- (BOOL)_calculateLockScreenSearchPresented;
- (BOOL)_calculateUserInitiatedRemoteTransientOverlayPresented;
- (BOOL)handleEvent:(id)a3;
- (BOOL)isAirplayMirroring;
- (BOOL)isInCall;
- (BOOL)isLockScreenSearchPresented;
- (BOOL)isSOSActive;
- (BOOL)isUIBlocked;
- (BOOL)isUILocked;
- (BOOL)isUserInitiatedRemoteTransientOverlayPresented;
- (BOOL)isUsingSecureApp;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (NSString)coverSheetIdentifier;
- (SBContinuitySessionSystemEventMonitor)init;
- (int64_t)participantState;
- (void)_aggregateLockStateChanged:(id)a3;
- (void)_callStatusChanged:(id)a3;
- (void)_passcodeVisibilityUpdated:(id)a3;
- (void)_postEvent:(id)a3;
- (void)_reevaluateSecureAppUsage;
- (void)_setInCall:(BOOL)a3;
- (void)_setLockScreenSearchPresented:(BOOL)a3;
- (void)_setPasscodeVisible:(BOOL)a3;
- (void)_setSOSActive:(BOOL)a3;
- (void)_setUIBlocked:(BOOL)a3;
- (void)_setUILocked:(BOOL)a3;
- (void)_setUserInitiatedRemoteTransientOverlayPresented:(BOOL)a3;
- (void)_setUsingSecureApp:(BOOL)a3;
- (void)addObserver:(id)a3;
- (void)coverSheetViewControllerDidDismissSearch:(id)a3;
- (void)coverSheetViewControllerDidPresentModalView:(id)a3;
- (void)coverSheetViewControllerDidPresentSearch:(id)a3;
- (void)coverSheetViewControllerDidSettleOnPage:(id)a3 mainPage:(BOOL)a4;
- (void)dealloc;
- (void)didUpdateCurrentSOSInitiationState:(int64_t)a3;
- (void)displayManager:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayManager:(id)a3 didDisconnectIdentity:(id)a4;
- (void)remoteTransientOverlaySession:(id)a3 didInvalidateWithReason:(int64_t)a4 error:(id)a5;
- (void)remoteTransientOverlaySessionDidDeactivate:(id)a3;
- (void)remoteTransientOverlaySessionManager:(id)a3 didActivateSession:(id)a4;
- (void)removeObserver:(id)a3;
- (void)todayViewControllerDidDismissSearch:(id)a3;
- (void)todayViewControllerDidPresentSearch:(id)a3;
@end

@implementation SBContinuitySessionSystemEventMonitor

- (SBContinuitySessionSystemEventMonitor)init
{
  v21.receiver = self;
  v21.super_class = (Class)SBContinuitySessionSystemEventMonitor;
  v2 = [(SBContinuitySessionSystemEventMonitor *)&v21 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = +[SBLockScreenManager sharedInstanceIfExists];
    v6 = +[SBLockStateAggregator sharedInstance];
    char v7 = [v6 lockState];

    v2->_isUILocked = v7 & 1;
    v2->_isUIBlocked = (v7 & 4) != 0;
    v2->_inCall = [(SBContinuitySessionSystemEventMonitor *)v2 _calculateIsInCall];
    v2->_isPasscodeVisible = [v5 isPasscodeEntryVisible];
    v8 = [MEMORY[0x1E4F97B88] sharedInstance];
    [v8 addObserver:v2 queue:MEMORY[0x1E4F14428]];
    v2->_isSOSActive = [v8 currentSOSInitiationState] == 1;
    v9 = +[SBCoverSheetPresentationManager sharedInstance];
    v2->_usingSecureApp = [v9 isCoverSheetHostingAnApp];

    v10 = [v5 coverSheetViewController];
    [v10 addCoverSheetObserver:v2];
    [v10 registerExternalEventHandler:v2];
    v11 = +[SBIconController sharedInstance];
    v12 = [v11 coverSheetTodayViewController];

    [v12 addObserver:v2];
    v13 = [v10 coverSheetSpotlightPresenter];
    if ([v13 isSpotlightPresented]) {
      char v14 = 1;
    }
    else {
      char v14 = [v12 isSpotlightVisible];
    }
    v2->_lockScreenSearchPresented = v14;

    v2->_userInitiatedRemoteTransientOverlayPresented = [(SBContinuitySessionSystemEventMonitor *)v2 _calculateUserInitiatedRemoteTransientOverlayPresented];
    v15 = [(id)SBApp remoteTransientOverlaySessionManager];
    [v15 addObserver:v2];

    v16 = [(id)SBApp displayManager];
    uint64_t v17 = [v16 addObserver:v2];
    displayManagerObserver = v2->_displayManagerObserver;
    v2->_displayManagerObserver = (BSInvalidatable *)v17;

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v2 selector:sel__passcodeVisibilityUpdated_ name:@"SBLockScreenPasscodeUIVisibilityUpdatedNotification" object:0];
    [v19 addObserver:v2 selector:sel__aggregateLockStateChanged_ name:@"SBAggregateLockStateDidChangeNotification" object:0];
    [v19 addObserver:v2 selector:sel__callStatusChanged_ name:*MEMORY[0x1E4FADD90] object:0];
    [v19 addObserver:v2 selector:sel__callStatusChanged_ name:*MEMORY[0x1E4FADDD8] object:0];
    [v19 addObserver:v2 selector:sel__coverSheetSecureAppChanged_ name:@"BCoverSheetSecureAppChangedNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_displayManagerObserver invalidate];
  displayManagerObserver = self->_displayManagerObserver;
  self->_displayManagerObserver = 0;

  v4 = +[SBLockScreenManager sharedInstance];
  v5 = [v4 coverSheetViewController];

  [v5 unregisterExternalEventHandler:self];
  [v5 removeCoverSheetObserver:self];
  v6 = +[SBIconController sharedInstance];
  char v7 = [v6 coverSheetTodayViewController];
  [v7 removeObserver:self];

  v8 = [(id)SBApp remoteTransientOverlaySessionManager];
  [v8 removeObserver:self];

  v9.receiver = self;
  v9.super_class = (Class)SBContinuitySessionSystemEventMonitor;
  [(SBContinuitySessionSystemEventMonitor *)&v9 dealloc];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (BOOL)isUILocked
{
  return self->_isUILocked;
}

- (BOOL)isUIBlocked
{
  return self->_isUIBlocked;
}

- (BOOL)isSOSActive
{
  return self->_isSOSActive;
}

- (BOOL)isInCall
{
  return self->_inCall;
}

- (BOOL)isUsingSecureApp
{
  return self->_usingSecureApp;
}

- (BOOL)isAirplayMirroring
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = objc_msgSend(MEMORY[0x1E4F62420], "sharedInstance", 0);
  uint64_t v3 = [v2 connectedIdentities];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v8 isAirPlayDisplay] & 1) != 0
          || ([v8 isRestrictedAirPlayDisplay] & 1) != 0
          || ([v8 isMusicOnlyDisplay] & 1) != 0
          || [v8 isiPodOnlyDisplay])
        {
          v10 = SBLogContinuityDisplay();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v17 = v8;
            _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "Found airplay display: %{public}@", buf, 0xCu);
          }

          BOOL v9 = 1;
          goto LABEL_17;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
      BOOL v9 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_17:

  return v9;
}

- (BOOL)isUserInitiatedRemoteTransientOverlayPresented
{
  return self->_userInitiatedRemoteTransientOverlayPresented;
}

- (void)coverSheetViewControllerDidPresentModalView:(id)a3
{
  id v4 = +[SBContinuitySessionSystemEvent eventWithType:4];
  [(SBContinuitySessionSystemEventMonitor *)self _postEvent:v4];
}

- (void)coverSheetViewControllerDidSettleOnPage:(id)a3 mainPage:(BOOL)a4
{
  if (a4)
  {
    [(SBContinuitySessionSystemEventMonitor *)self _setUsingSecureApp:0];
  }
  else
  {
    uint64_t v5 = +[SBContinuitySessionSystemEvent eventWithType:4];
    [(SBContinuitySessionSystemEventMonitor *)self _postEvent:v5];

    [(SBContinuitySessionSystemEventMonitor *)self _reevaluateSecureAppUsage];
  }
}

- (void)coverSheetViewControllerDidPresentSearch:(id)a3
{
  BOOL v4 = [(SBContinuitySessionSystemEventMonitor *)self _calculateLockScreenSearchPresented];
  [(SBContinuitySessionSystemEventMonitor *)self _setLockScreenSearchPresented:v4];
}

- (void)coverSheetViewControllerDidDismissSearch:(id)a3
{
  BOOL v4 = [(SBContinuitySessionSystemEventMonitor *)self _calculateLockScreenSearchPresented];
  [(SBContinuitySessionSystemEventMonitor *)self _setLockScreenSearchPresented:v4];
}

- (void)todayViewControllerDidPresentSearch:(id)a3
{
  BOOL v4 = [(SBContinuitySessionSystemEventMonitor *)self _calculateLockScreenSearchPresented];
  [(SBContinuitySessionSystemEventMonitor *)self _setLockScreenSearchPresented:v4];
}

- (void)todayViewControllerDidDismissSearch:(id)a3
{
  BOOL v4 = [(SBContinuitySessionSystemEventMonitor *)self _calculateLockScreenSearchPresented];
  [(SBContinuitySessionSystemEventMonitor *)self _setLockScreenSearchPresented:v4];
}

- (void)didUpdateCurrentSOSInitiationState:(int64_t)a3
{
  [(SBContinuitySessionSystemEventMonitor *)self _setSOSActive:a3 == 1];
}

- (NSString)coverSheetIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (BOOL)handleEvent:(id)a3
{
  if (([a3 type] & 0xFFFFFFFFFFFFFFFELL) == 0x28) {
    [(SBContinuitySessionSystemEventMonitor *)self _reevaluateSecureAppUsage];
  }
  return 0;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (void)displayManager:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  +[SBContinuitySessionSystemEvent eventWithType:](SBContinuitySessionSystemEvent, "eventWithType:", 11, a4, a5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(SBContinuitySessionSystemEventMonitor *)self _postEvent:v6];
}

- (void)displayManager:(id)a3 didDisconnectIdentity:(id)a4
{
  +[SBContinuitySessionSystemEvent eventWithType:](SBContinuitySessionSystemEvent, "eventWithType:", 11, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(SBContinuitySessionSystemEventMonitor *)self _postEvent:v5];
}

- (void)remoteTransientOverlaySessionManager:(id)a3 didActivateSession:(id)a4
{
  id v8 = a4;
  id v5 = [(id)SBApp windowSceneManager];
  id v6 = [v5 embeddedDisplayWindowScene];
  int v7 = [v8 isPresentedOnWindowScene:v6];

  if (v7)
  {
    [v8 addSessionObserver:self];
    [(SBContinuitySessionSystemEventMonitor *)self _setUserInitiatedRemoteTransientOverlayPresented:[(SBContinuitySessionSystemEventMonitor *)self _calculateUserInitiatedRemoteTransientOverlayPresented]];
  }
}

- (void)remoteTransientOverlaySessionDidDeactivate:(id)a3
{
  [a3 removeSessionObserver:self];
  BOOL v4 = [(SBContinuitySessionSystemEventMonitor *)self _calculateUserInitiatedRemoteTransientOverlayPresented];
  [(SBContinuitySessionSystemEventMonitor *)self _setUserInitiatedRemoteTransientOverlayPresented:v4];
}

- (void)remoteTransientOverlaySession:(id)a3 didInvalidateWithReason:(int64_t)a4 error:(id)a5
{
  objc_msgSend(a3, "removeSessionObserver:", self, a4, a5);
  BOOL v6 = [(SBContinuitySessionSystemEventMonitor *)self _calculateUserInitiatedRemoteTransientOverlayPresented];
  [(SBContinuitySessionSystemEventMonitor *)self _setUserInitiatedRemoteTransientOverlayPresented:v6];
}

- (void)_postEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) continuitySessionSystemEventMonitor:self eventOccurred:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_passcodeVisibilityUpdated:(id)a3
{
  id v4 = +[SBLockScreenManager sharedInstanceIfExists];
  -[SBContinuitySessionSystemEventMonitor _setPasscodeVisible:](self, "_setPasscodeVisible:", [v4 isPasscodeEntryVisible]);
}

- (void)_aggregateLockStateChanged:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"SBAggregateLockStateKey"];
  unint64_t v6 = [v5 integerValue];

  [(SBContinuitySessionSystemEventMonitor *)self _setUILocked:v6 & 1];
  [(SBContinuitySessionSystemEventMonitor *)self _setUIBlocked:(v6 >> 2) & 1];
}

- (void)_callStatusChanged:(id)a3
{
}

uint64_t __60__SBContinuitySessionSystemEventMonitor__callStatusChanged___block_invoke(uint64_t a1)
{
  v2 = SBLogContinuityDisplay();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Call status changed", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_setInCall:", objc_msgSend(*(id *)(a1 + 32), "_calculateIsInCall"));
}

- (void)_setPasscodeVisible:(BOOL)a3
{
  if (self->_isPasscodeVisible != a3)
  {
    self->_isPasscodeVisible = a3;
    if (a3) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 3;
    }
    id v5 = +[SBContinuitySessionSystemEvent eventWithType:v4];
    [(SBContinuitySessionSystemEventMonitor *)self _postEvent:v5];
  }
}

- (void)_setUILocked:(BOOL)a3
{
  if (self->_isUILocked != a3)
  {
    self->_isUILocked = a3;
    id v4 = +[SBContinuitySessionSystemEvent eventWithType:a3];
    [(SBContinuitySessionSystemEventMonitor *)self _postEvent:v4];
  }
}

- (void)_setUIBlocked:(BOOL)a3
{
  if (self->_isUIBlocked != a3)
  {
    self->_isUIBlocked = a3;
    if (a3) {
      uint64_t v4 = 5;
    }
    else {
      uint64_t v4 = 6;
    }
    id v5 = +[SBContinuitySessionSystemEvent eventWithType:v4];
    [(SBContinuitySessionSystemEventMonitor *)self _postEvent:v5];
  }
}

- (void)_setInCall:(BOOL)a3
{
  if (self->_inCall != a3)
  {
    self->_inCall = a3;
    id v4 = +[SBContinuitySessionSystemEvent eventWithType:7];
    [(SBContinuitySessionSystemEventMonitor *)self _postEvent:v4];
  }
}

- (BOOL)_calculateIsInCall
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  uint64_t v3 = [v2 currentAudioAndVideoCalls];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v8 = SBLogContinuityDisplay();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          uint64_t v9 = [v7 callUUID];
          long long v10 = [v7 uniqueProxyIdentifier];
          *(_DWORD *)buf = 134218498;
          v22 = v7;
          __int16 v23 = 2114;
          v24 = v9;
          __int16 v25 = 2114;
          v26 = v10;
          _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Found current call: <%p:%{public}@ - %{public}@>", buf, 0x20u);
        }
        if [v7 status] == 1 && (objc_msgSend(v7, "isEndpointOnCurrentDevice"))
        {
          LOBYTE(v4) = 1;
          goto LABEL_16;
        }
        long long v11 = SBLogContinuityDisplay();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          long long v12 = [v7 callUUID];
          long long v13 = [v7 uniqueProxyIdentifier];
          int v14 = [v7 status];
          int v15 = [v7 isEndpointOnCurrentDevice];
          *(_DWORD *)buf = 134219010;
          v22 = v7;
          __int16 v23 = 2114;
          v24 = v12;
          __int16 v25 = 2114;
          v26 = v13;
          __int16 v27 = 1024;
          int v28 = v14;
          __int16 v29 = 1024;
          int v30 = v15;
          _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "Call <%p:%{public}@ - %{public}@> doesn't meet criteria -> call status: %d, isEndpointOnCurrentDevice: %{BOOL}u", buf, 0x2Cu);
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v31 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v4;
}

- (void)_setSOSActive:(BOOL)a3
{
  if (self->_isSOSActive != a3)
  {
    self->_isSOSActive = a3;
    id v4 = +[SBContinuitySessionSystemEvent eventWithType:8];
    [(SBContinuitySessionSystemEventMonitor *)self _postEvent:v4];
  }
}

- (BOOL)_calculateLockScreenSearchPresented
{
  v2 = +[SBLockScreenManager sharedInstance];
  uint64_t v3 = [v2 coverSheetViewController];
  id v4 = [v3 coverSheetSpotlightPresenter];
  if ([v4 isSpotlightPresented])
  {
    char v5 = 1;
  }
  else
  {
    unint64_t v6 = +[SBIconController sharedInstance];
    uint64_t v7 = [v6 coverSheetTodayViewController];
    char v5 = [v7 isSpotlightVisible];
  }
  return v5;
}

- (void)_setLockScreenSearchPresented:(BOOL)a3
{
  if (self->_lockScreenSearchPresented != a3)
  {
    self->_lockScreenSearchPresented = a3;
    id v4 = +[SBContinuitySessionSystemEvent eventWithType:9];
    [(SBContinuitySessionSystemEventMonitor *)self _postEvent:v4];
  }
}

- (void)_reevaluateSecureAppUsage
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[SBCoverSheetPresentationManager sharedInstance];
  uint64_t v4 = [v3 isCoverSheetHostingAnApp];

  char v5 = SBLogContinuityDisplay();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Reevaluating secure app usage... cover sheet hosting an app: %{BOOL}u", (uint8_t *)v6, 8u);
  }

  [(SBContinuitySessionSystemEventMonitor *)self _setUsingSecureApp:v4];
}

- (void)_setUsingSecureApp:(BOOL)a3
{
  if (self->_usingSecureApp != a3)
  {
    self->_usingSecureApp = a3;
    id v4 = +[SBContinuitySessionSystemEvent eventWithType:10];
    [(SBContinuitySessionSystemEventMonitor *)self _postEvent:v4];
  }
}

- (BOOL)_calculateUserInitiatedRemoteTransientOverlayPresented
{
  if (_calculateUserInitiatedRemoteTransientOverlayPresented_onceToken != -1) {
    dispatch_once(&_calculateUserInitiatedRemoteTransientOverlayPresented_onceToken, &__block_literal_global_128);
  }
  v2 = [(id)SBApp remoteTransientOverlaySessionManager];
  char v3 = [v2 hasActiveSessionMatchingPredicate:&__block_literal_global_23_1 options:0];

  return v3;
}

void __95__SBContinuitySessionSystemEventMonitor__calculateUserInitiatedRemoteTransientOverlayPresented__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.PassbookUIService";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)_calculateUserInitiatedRemoteTransientOverlayPresented_allowedBundleIdentifiers;
  _calculateUserInitiatedRemoteTransientOverlayPresented_allowedBundleIdentifiers = v0;
}

uint64_t __95__SBContinuitySessionSystemEventMonitor__calculateUserInitiatedRemoteTransientOverlayPresented__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [(id)SBApp windowSceneManager];
  id v4 = [v3 embeddedDisplayWindowScene];
  if ([v2 isPresentedOnWindowScene:v4])
  {
    char v5 = (void *)_calculateUserInitiatedRemoteTransientOverlayPresented_allowedBundleIdentifiers;
    unint64_t v6 = [v2 serviceBundleIdentifier];
    uint64_t v7 = [v5 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_setUserInitiatedRemoteTransientOverlayPresented:(BOOL)a3
{
  if (self->_userInitiatedRemoteTransientOverlayPresented != a3)
  {
    self->_userInitiatedRemoteTransientOverlayPresented = a3;
    id v4 = +[SBContinuitySessionSystemEvent eventWithType:12];
    [(SBContinuitySessionSystemEventMonitor *)self _postEvent:v4];
  }
}

- (BOOL)isLockScreenSearchPresented
{
  return self->_lockScreenSearchPresented;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayManagerObserver, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end