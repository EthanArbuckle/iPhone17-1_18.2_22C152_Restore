@interface SBUserAgent
- (BOOL)_launchFromSource:(int)a3 withURL:(id)a4 bundleID:(id)a5 allowUnlock:(BOOL)a6 animate:(BOOL)a7;
- (BOOL)_openApplication:(id)a3 withURL:(id)a4 fromSource:(int)a5 animated:(BOOL)a6 options:(id)a7;
- (BOOL)applicationInstalledForDisplayID:(id)a3;
- (BOOL)canLaunchFromSource:(int)a3 withURL:(id)a4 bundleID:(id)a5;
- (BOOL)deviceIsBlocked;
- (BOOL)deviceIsLocked;
- (BOOL)deviceIsPasscodeLocked;
- (BOOL)deviceIsPasscodeLockedRemotely;
- (BOOL)deviceIsTethered;
- (BOOL)isApplicationForegroundObscured:(id)a3;
- (BOOL)isApplicationRestrictedOrHidden:(id)a3;
- (BOOL)isIdleTimerDisabledForReason:(id)a3;
- (BOOL)isInternalInstall;
- (BOOL)isNamedRemoteAlertServiceActive:(id)a3 controllerClassName:(id)a4;
- (BOOL)isScreenOn;
- (BOOL)launchApplicationFromSource:(int)a3 withDisplayID:(id)a4 options:(id)a5;
- (BOOL)launchApplicationFromSource:(int)a3 withURL:(id)a4 options:(id)a5;
- (BOOL)launchFromSource:(int)a3 withURL:(id)a4 bundleID:(id)a5 allowUnlock:(BOOL)a6;
- (BOOL)lockScreenIsShowing;
- (BOOL)openURL:(id)a3 allowUnlock:(BOOL)a4 animated:(BOOL)a5;
- (BOOL)springBoardIsActive;
- (SBIdleTimerPolicyAggregator)_idleTimerPolicyAggregator;
- (SBUserAgent)init;
- (__CFRunLoop)wifiRunLoopRef;
- (id)_safeValue:(id)a3 forKey:(id)a4 ofType:(Class)a5;
- (id)folderNameForDisplayID:(id)a3;
- (id)foregroundApplicationDisplayID;
- (id)localizedDisplayNameForDisplayID:(id)a3;
- (id)topSuspendedEventsOnlyDisplayID;
- (int)networkUsageTypeForAppWithDisplayID:(id)a3;
- (int64_t)activeInterfaceOrientation;
- (void)_cleanupFromBannerLaunch;
- (void)_setIdleTimerPolicyAggregator:(id)a3;
- (void)activateModalBulletinAlert:(id)a3;
- (void)activateRemoteAlertService:(id)a3 options:(id)a4;
- (void)addActiveInterfaceOrientationObserver:(id)a3;
- (void)disableLockScreenBundleNamed:(id)a3 deactivationContext:(id)a4;
- (void)enableLockScreenBundleNamed:(id)a3 activationContext:(id)a4;
- (void)lockAndDimDevice;
- (void)lockAndDimDeviceDisconnectingCallIfNecessary:(BOOL)a3;
- (void)lockAndDimDeviceDisconnectingCallIfNecessary:(BOOL)a3 andDimScreen:(BOOL)a4;
- (void)removeActiveInterfaceOrientationObserver:(id)a3;
- (void)setBadgeNumberOrString:(id)a3 forApplicationWithID:(id)a4;
- (void)setIdleText:(id)a3;
- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setMinimumBacklightLevel:(float)a3 animated:(BOOL)a4;
- (void)undimScreen;
- (void)updateInterfaceOrientationIfNecessary;
@end

@implementation SBUserAgent

- (SBUserAgent)init
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = [NSString stringWithUTF8String:"-[SBUserAgent init]"];
    [v4 handleFailureInFunction:v5 file:@"SBUserAgent.m" lineNumber:90 description:@"this call must be made on the main thread"];
  }
  v6.receiver = self;
  v6.super_class = (Class)SBUserAgent;
  return [(SBUserAgent *)&v6 init];
}

- (void)updateInterfaceOrientationIfNecessary
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = [NSString stringWithUTF8String:"-[SBUserAgent updateInterfaceOrientationIfNecessary]"];
    [v8 handleFailureInFunction:v9 file:@"SBUserAgent.m" lineNumber:105 description:@"this call must be made on the main thread"];
  }
  v2 = +[SBLockScreenManager sharedInstance];
  v3 = [v2 lockScreenEnvironment];
  v4 = [v3 backlightController];
  int v5 = [v4 isInScreenOffMode];

  if (v5)
  {
    objc_super v6 = +[SBLockScreenManager sharedInstance];
    id v10 = [v6 lockScreenOrientationManager];

    [v10 updateInterfaceOrientationWithRequestedOrientation:0 animated:0];
  }
  else
  {
    v7 = (void *)SBApp;
    [v7 updateNativeOrientationWithLogMessage:@"SBUserAgent thinks the screen is on"];
  }
}

- (int64_t)activeInterfaceOrientation
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    int v5 = [NSString stringWithUTF8String:"-[SBUserAgent activeInterfaceOrientation]"];
    [v4 handleFailureInFunction:v5 file:@"SBUserAgent.m" lineNumber:120 description:@"this call must be made on the main thread"];
  }
  v2 = (void *)SBApp;
  return [v2 activeInterfaceOrientation];
}

- (id)foregroundApplicationDisplayID
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = [NSString stringWithUTF8String:"-[SBUserAgent foregroundApplicationDisplayID]"];
    [v10 handleFailureInFunction:v11 file:@"SBUserAgent.m" lineNumber:128 description:@"this call must be made on the main thread"];
  }
  v2 = +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController];
  v3 = [v2 layoutStatePrimaryElement];
  v4 = [v3 workspaceEntity];
  int v5 = [v4 applicationSceneEntity];
  objc_super v6 = [v5 sceneHandle];
  v7 = [v6 application];
  v8 = [v7 bundleIdentifier];

  return v8;
}

- (BOOL)isApplicationForegroundObscured:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [NSString stringWithUTF8String:"-[SBUserAgent isApplicationForegroundObscured:]"];
    [v16 handleFailureInFunction:v17 file:@"SBUserAgent.m" lineNumber:133 description:@"this call must be made on the main thread"];
  }
  SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v8 = [v7 sceneIfExists];
        if (v8)
        {
          v9 = v8;
          id v10 = [v8 settings];
          if (![v10 isOccluded]) {
            goto LABEL_14;
          }
          v11 = [v9 settings];
          if (([v11 isForeground] & 1) == 0)
          {

LABEL_14:
            continue;
          }
          v12 = [v7 application];
          v13 = [v12 bundleIdentifier];
          char v14 = [v13 isEqualToString:v18];

          if (v14)
          {
            LOBYTE(v4) = 1;
            goto LABEL_17;
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
  }
LABEL_17:

  return v4;
}

- (BOOL)applicationInstalledForDisplayID:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F29060];
  id v4 = a3;
  if (([v3 isMainThread] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = [NSString stringWithUTF8String:"-[SBUserAgent applicationInstalledForDisplayID:]"];
    [v8 handleFailureInFunction:v9 file:@"SBUserAgent.m" lineNumber:146 description:@"this call must be made on the main thread"];
  }
  uint64_t v5 = +[SBApplicationController sharedInstanceIfExists];
  objc_super v6 = [v5 applicationWithBundleIdentifier:v4];

  return v6 != 0;
}

- (BOOL)springBoardIsActive
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v6 = [NSString stringWithUTF8String:"-[SBUserAgent springBoardIsActive]"];
    [v5 handleFailureInFunction:v6 file:@"SBUserAgent.m" lineNumber:151 description:@"this call must be made on the main thread"];
  }
  v2 = +[SBMainWorkspace sharedInstance];
  char v3 = [v2 isSpringBoardActive];

  return v3;
}

- (BOOL)deviceIsLocked
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v6 = [NSString stringWithUTF8String:"-[SBUserAgent deviceIsLocked]"];
    [v5 handleFailureInFunction:v6 file:@"SBUserAgent.m" lineNumber:159 description:@"this call must be made on the main thread"];
  }
  v2 = +[SBLockScreenManager sharedInstance];
  char v3 = [v2 isUILocked];

  return v3;
}

- (BOOL)deviceIsPasscodeLocked
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v6 = [NSString stringWithUTF8String:"-[SBUserAgent deviceIsPasscodeLocked]"];
    [v5 handleFailureInFunction:v6 file:@"SBUserAgent.m" lineNumber:164 description:@"this call must be made on the main thread"];
  }
  v2 = [(id)SBApp authenticationController];
  char v3 = [v2 isAuthenticatedCached] ^ 1;

  return v3;
}

- (BOOL)deviceIsPasscodeLockedRemotely
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = [NSString stringWithUTF8String:"-[SBUserAgent deviceIsPasscodeLockedRemotely]"];
    [v7 handleFailureInFunction:v8 file:@"SBUserAgent.m" lineNumber:169 description:@"this call must be made on the main thread"];
  }
  BOOL v3 = [(SBUserAgent *)self deviceIsPasscodeLocked];
  if (v3)
  {
    id v4 = +[SBDefaults localDefaults];
    uint64_t v5 = [v4 lockScreenDefaults];
    char v6 = [v5 limitFeaturesForRemoteLock];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)deviceIsBlocked
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    char v6 = [NSString stringWithUTF8String:"-[SBUserAgent deviceIsBlocked]"];
    [v5 handleFailureInFunction:v6 file:@"SBUserAgent.m" lineNumber:174 description:@"this call must be made on the main thread"];
  }
  v2 = [(id)SBApp lockOutController];
  char v3 = [v2 isBlocked];

  return v3;
}

- (BOOL)deviceIsTethered
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    char v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[SBUserAgent deviceIsTethered]"];
    [v3 handleFailureInFunction:v4 file:@"SBUserAgent.m" lineNumber:179 description:@"this call must be made on the main thread"];
  }
  return BKSDisplayServicesDisplayIsTethered();
}

- (BOOL)lockScreenIsShowing
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[SBUserAgent lockScreenIsShowing]"];
    [v4 handleFailureInFunction:v5 file:@"SBUserAgent.m" lineNumber:184 description:@"this call must be made on the main thread"];
  }
  return [(SBUserAgent *)self deviceIsLocked];
}

- (BOOL)openURL:(id)a3 allowUnlock:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = [NSString stringWithUTF8String:"-[SBUserAgent openURL:allowUnlock:animated:]"];
    [v10 handleFailureInFunction:v11 file:@"SBUserAgent.m" lineNumber:192 description:@"this call must be made on the main thread"];
  }
  BOOL v8 = [(SBUserAgent *)self _openApplication:0 withURL:v7 fromSource:0 animated:v5 options:0];

  return v8;
}

- (id)_safeValue:(id)a3 forKey:(id)a4 ofType:(Class)a5
{
  if (a3)
  {
    BOOL v5 = [a3 objectForKey:a4];
    if (objc_opt_isKindOfClass()) {
      char v6 = v5;
    }
    else {
      char v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)_cleanupFromBannerLaunch
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v5 = [NSString stringWithUTF8String:"-[SBUserAgent _cleanupFromBannerLaunch]"];
    [v4 handleFailureInFunction:v5 file:@"SBUserAgent.m" lineNumber:206 description:@"this call must be made on the main thread"];
  }
  [(BSInvalidatable *)self->_bannerSuppressionAssertion invalidate];
  bannerSuppressionAssertion = self->_bannerSuppressionAssertion;
  self->_bannerSuppressionAssertion = 0;

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:@"SBAssistantVisibilityDidChangeNotification" object:0];
}

- (BOOL)_openApplication:(id)a3 withURL:(id)a4 fromSource:(int)a5 animated:(BOOL)a6 options:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = (uint64_t)a3;
  unint64_t v13 = (unint64_t)a4;
  id v14 = a7;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    v39 = [NSString stringWithUTF8String:"-[SBUserAgent _openApplication:withURL:fromSource:animated:options:]"];
    [v38 handleFailureInFunction:v39 file:@"SBUserAgent.m" lineNumber:217 description:@"this call must be made on the main thread"];
  }
  if (v9 == 6)
  {
    int v15 = ++_openApplication_withURL_fromSource_animated_options____carBannerOpenRequestCount;
    v16 = [(id)SBApp notificationDispatcher];
    id v17 = [v16 carOpenServiceEndpoint];

    if (v17)
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F224A0]);
      [v18 setTargetConnectionEndpoint:v17];
      if (v13)
      {
        long long v19 = SBLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          int v58 = v15;
          __int16 v59 = 2112;
          id v60 = v17;
          __int16 v61 = 2112;
          unint64_t v62 = v13;
          _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "sending CarBanner open url request (%u) to %@ : url=%@", buf, 0x1Cu);
        }

        long long v20 = [MEMORY[0x1E4F223E0] defaultWorkspace];
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke;
        v55[3] = &__block_descriptor_36_e34_v24__0__NSDictionary_8__NSError_16l;
        int v56 = v15;
        [v20 openURL:v13 configuration:v18 completionHandler:v55];
LABEL_28:

        char v32 = 1;
LABEL_41:

        goto LABEL_42;
      }
      v34 = SBLogCommon();
      BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v35)
        {
          *(_DWORD *)buf = 67109634;
          int v58 = v15;
          __int16 v59 = 2112;
          id v60 = v17;
          __int16 v61 = 2112;
          unint64_t v62 = v12;
          _os_log_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_DEFAULT, "sending CarBanner open app request (%u) to %@ : app=%@", buf, 0x1Cu);
        }

        long long v20 = [MEMORY[0x1E4F223E0] defaultWorkspace];
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_33;
        v53[3] = &__block_descriptor_36_e20_v20__0B8__NSError_12l;
        int v54 = v15;
        [v20 openApplicationWithBundleIdentifier:v12 configuration:v18 completionHandler:v53];
        goto LABEL_28;
      }
      if (v35)
      {
        *(_DWORD *)buf = 67109378;
        int v58 = v15;
        __int16 v59 = 2112;
        id v60 = v17;
        _os_log_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_DEFAULT, "cannot send invalid CarBanner open request (%u) to %@", buf, 0x12u);
      }
    }
    else
    {
      id v18 = SBLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v58 = v15;
        _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "cannot send CarBanner open request (%u) to a nil endpoint", buf, 8u);
      }
    }
    char v32 = 0;
    goto LABEL_41;
  }
  if (v13)
  {
    long long v21 = SBWorkspaceApplicationForURLWithError((void *)v13, 0, 0);
    id v17 = v21;
    if (v21)
    {
      uint64_t v22 = [v21 bundleIdentifier];

      uint64_t v12 = v22;
      goto LABEL_16;
    }
LABEL_32:
    v36 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_36;
    block[3] = &unk_1E6AF5290;
    v51 = (id)v13;
    uint64_t v12 = (uint64_t)(id)v12;
    id v52 = (id)v12;
    dispatch_async(v36, block);

    char v32 = 0;
    id v18 = v51;
    goto LABEL_41;
  }
  if (!v12)
  {
    id v17 = 0;
    goto LABEL_31;
  }
  v23 = +[SBApplicationController sharedInstance];
  id v17 = [v23 applicationWithBundleIdentifier:v12];

  if (!v17) {
    goto LABEL_32;
  }
LABEL_16:
  if ([(SBUserAgent *)self canLaunchFromSource:v9 withURL:v13 bundleID:v12])
  {
    uint64_t v24 = +[SBLockScreenManager sharedInstance];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_2;
    v43[3] = &unk_1E6B021F0;
    v43[4] = self;
    id v44 = v14;
    id v18 = v24;
    v45 = v18;
    int v48 = v9;
    id v46 = (id)v13;
    BOOL v49 = a6;
    id v17 = v17;
    id v47 = v17;
    v25 = (uint64_t (**)(void, void))MEMORY[0x1D948C7A0](v43);
    if (+[SBAssistantController isVisible]
      && [(SBUserAgent *)self deviceIsPasscodeLocked])
    {
      BOOL v26 = v9 == 3;
      if (v9 == 3)
      {
        v27 = [(id)SBApp bannerManager];
        v28 = [v27 acquireBannerSuppressionAssertionForReason:@"BannerOpenAppFromUserAgent"];
        bannerSuppressionAssertion = self->_bannerSuppressionAssertion;
        self->_bannerSuppressionAssertion = v28;

        BOOL v26 = 1;
      }
      v30 = +[SBAssistantController sharedInstance];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_53;
      v40[3] = &unk_1E6B02218;
      BOOL v42 = v26;
      v40[4] = self;
      v41 = v25;
      int v31 = [v30 requestPasscodeUnlockWithCompletion:v40];
      char v32 = v31;
      if (v9 == 3)
      {
        if (v31)
        {
          v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v33 addObserver:self selector:sel__cleanupFromBannerLaunch name:@"SBAssistantVisibilityDidChangeNotification" object:0];
        }
        else
        {
          [(SBUserAgent *)self _cleanupFromBannerLaunch];
        }
      }
    }
    else
    {
      char v32 = v25[2](v25, 0);
    }

    goto LABEL_41;
  }
LABEL_31:
  if (v13 | v12) {
    goto LABEL_32;
  }
  uint64_t v12 = 0;
  char v32 = 0;
LABEL_42:

  return v32;
}

void __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *(_DWORD *)(a1 + 32);
    v9[0] = 67109890;
    v9[1] = v8;
    __int16 v10 = 1024;
    BOOL v11 = v5 != 0;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "CarBanner open url request (%u) finished: success=%{BOOL}i error=%@ result=%@", (uint8_t *)v9, 0x22u);
  }
}

void __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_33(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(_DWORD *)(a1 + 32);
    v8[0] = 67109634;
    v8[1] = v7;
    __int16 v9 = 1024;
    int v10 = a2;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "CarBanner open app request (%u) finished: success=%{BOOL}i error=%@", (uint8_t *)v8, 0x18u);
  }
}

void __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_36(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 _LSFailedToOpenURL:*(void *)(a1 + 32) withBundle:*(void *)(a1 + 40)];
}

uint64_t __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_2(uint64_t a1, void *a2)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _safeValue:*(void *)(a1 + 40) forKey:*MEMORY[0x1E4FA7AC0] ofType:objc_opt_class()];
  int v5 = [v4 BOOLValue];

  if ([*(id *)(a1 + 48) isUILocked])
  {
    char v6 = 0;
  }
  else
  {
    int v7 = [*(id *)(a1 + 32) _safeValue:*(void *)(a1 + 40) forKey:*MEMORY[0x1E4FA7AC8] ofType:objc_opt_class()];
    char v6 = [v7 BOOLValue];
  }
  int v8 = [*(id *)(a1 + 32) _safeValue:*(void *)(a1 + 40) forKey:@"SBUILaunchOptionKeyActivationSettings" ofType:objc_opt_class()];
  __int16 v9 = v8;
  if (v8) {
    int v10 = v8;
  }
  else {
    int v10 = objc_alloc_init(SBActivationSettings);
  }
  __int16 v11 = v10;

  int v12 = *(_DWORD *)(a1 + 72);
  switch(v12)
  {
    case 3:
      uint64_t v13 = 42;
      uint64_t v14 = 6;
      break;
    case 7:
      uint64_t v13 = 47;
      uint64_t v14 = 2;
      break;
    case 5:
      uint64_t v13 = 45;
      uint64_t v14 = 5;
      break;
    default:
      uint64_t v14 = 0;
      goto LABEL_15;
  }
  [(SBActivationSettings *)v11 setFlag:1 forActivationSetting:v13];
LABEL_15:
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_3;
  v43[3] = &unk_1E6B021A0;
  char v49 = v6;
  id v15 = v11;
  id v44 = v15;
  id v16 = v3;
  id v45 = v16;
  id v17 = (uint64_t *)(a1 + 56);
  id v18 = *(id *)(a1 + 56);
  char v50 = *(unsigned char *)(a1 + 76);
  id v46 = v18;
  uint64_t v48 = v14;
  id v47 = *(id *)(a1 + 64);
  long long v19 = (uint64_t (**)(void))MEMORY[0x1D948C7A0](v43);
  long long v20 = [(id)SBApp lockOutController];
  if (v5 && [*(id *)(a1 + 48) isUILocked])
  {
    v30 = [*(id *)(a1 + 48) lockScreenEnvironment];
    long long v21 = [v30 backlightController];
    [v21 setInScreenOffMode:0];

    if (([v20 isBlocked] & 1) == 0)
    {
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      char v42 = 0;
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x2020000000;
      char v38 = 0;
      v29 = [v30 customActionStore];
      id v22 = objc_alloc_init(MEMORY[0x1E4FA5FA0]);
      [v22 setIdentifier:@"SBUIUserAgent"];
      [v22 setRequiresUIUnlock:1];
      [v22 setCanBypassPinLock:0];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_6;
      v31[3] = &unk_1E6B021C8;
      v33 = &v39;
      v34 = &v35;
      char v32 = v19;
      [v22 setAction:v31];
      [v29 setCustomLockScreenActionContext:v22];
      uint64_t v23 = +[SBLockScreenManager sharedInstance];
      v51 = @"SBUIUnlockOptionsBypassPasscodeKey";
      uint64_t v24 = [NSNumber numberWithBool:0];
      v52[0] = v24;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
      [(id)v23 unlockUIFromSource:8 withOptions:v25];

      [v29 setCustomLockScreenActionContext:0];
      if (*((unsigned char *)v40 + 24)) {
        LOBYTE(v23) = *((unsigned char *)v36 + 24) != 0;
      }
      BOOL v26 = *((unsigned char *)v40 + 24) == 0;

      _Block_object_dispose(&v35, 8);
      _Block_object_dispose(&v39, 8);
      if (!v26)
      {

        goto LABEL_29;
      }
    }
  }
  if (([v20 isLockedOut] & 1) != 0 || objc_msgSend(*(id *)(a1 + 48), "isUILocked"))
  {
    v27 = SBLogCommon();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_2_cold_1(v17, v27);
    }

    LOBYTE(v23) = 0;
  }
  else
  {
    LOBYTE(v23) = v19[2](v19);
  }
LABEL_29:

  return v23 & 1;
}

uint64_t __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 32) setFlag:1 forActivationSetting:7];
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "applyActivationSettings:");
  }
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    id v3 = (void *)SBApp;
    uint64_t v4 = *(unsigned __int8 *)(a1 + 73);
    uint64_t v5 = *(void *)(a1 + 32);
    char v6 = [MEMORY[0x1E4F4F7F8] processHandle];
    uint64_t v7 = 1;
    [v3 applicationOpenURL:v2 withApplication:0 animating:v4 activationSettings:v5 origin:v6 notifyLSOnFailure:1 withResult:0];
  }
  else
  {
    int v8 = +[SBWorkspace mainWorkspace];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_4;
    v11[3] = &unk_1E6B02178;
    __int16 v9 = *(void **)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 64);
    id v12 = v9;
    id v13 = *(id *)(a1 + 32);
    uint64_t v7 = [v8 requestTransitionWithBuilder:v11];
  }
  return v7;
}

void __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = a2;
  [v4 setSource:v3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_5;
  v5[3] = &unk_1E6AF5638;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v4 modifyApplicationContext:v5];
}

void __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:*(void *)(a1 + 32)];
  [(SBWorkspaceEntity *)v4 applyActivationSettings:*(void *)(a1 + 40)];
  [v3 setEntity:v4 forLayoutRole:1];
}

uint64_t __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_6(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  uint64_t result = (*(uint64_t (**)(void))(a1[4] + 16))();
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

void __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_53(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = +[SBAssistantController defaultActivationSettings];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    [v5 _cleanupFromBannerLaunch];
  }
}

- (BOOL)canLaunchFromSource:(int)a3 withURL:(id)a4 bundleID:(id)a5
{
  id v6 = a5;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (a4)
    {
LABEL_3:
      BOOL v7 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v9 = [NSString stringWithUTF8String:"-[SBUserAgent canLaunchFromSource:withURL:bundleID:]"];
    [v8 handleFailureInFunction:v9 file:@"SBUserAgent.m" lineNumber:410 description:@"this call must be made on the main thread"];

    if (a4) {
      goto LABEL_3;
    }
  }
  int v10 = +[SBApplicationController sharedInstance];
  __int16 v11 = +[SBApplicationPlaceholderController sharedInstance];
  if (v6)
  {
    id v12 = [v10 applicationWithBundleIdentifier:v6];
    if (v12)
    {
      id v13 = [v11 placeholderForDisplayID:v6];
      BOOL v7 = v13 == 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

LABEL_12:
  return v7;
}

- (BOOL)launchApplicationFromSource:(int)a3 withDisplayID:(id)a4 options:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = [NSString stringWithUTF8String:"-[SBUserAgent launchApplicationFromSource:withDisplayID:options:]"];
    [v12 handleFailureInFunction:v13 file:@"SBUserAgent.m" lineNumber:425 description:@"this call must be made on the main thread"];
  }
  BOOL v10 = [(SBUserAgent *)self _openApplication:v8 withURL:0 fromSource:v6 animated:1 options:v9];

  return v10;
}

- (BOOL)launchApplicationFromSource:(int)a3 withURL:(id)a4 options:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = [NSString stringWithUTF8String:"-[SBUserAgent launchApplicationFromSource:withURL:options:]"];
    [v12 handleFailureInFunction:v13 file:@"SBUserAgent.m" lineNumber:430 description:@"this call must be made on the main thread"];
  }
  BOOL v10 = [(SBUserAgent *)self _openApplication:0 withURL:v8 fromSource:v6 animated:1 options:v9];

  return v10;
}

- (BOOL)launchFromSource:(int)a3 withURL:(id)a4 bundleID:(id)a5 allowUnlock:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = [NSString stringWithUTF8String:"-[SBUserAgent launchFromSource:withURL:bundleID:allowUnlock:]"];
    [v14 handleFailureInFunction:v15 file:@"SBUserAgent.m" lineNumber:436 description:@"this call must be made on the main thread"];
  }
  BOOL v12 = [(SBUserAgent *)self _launchFromSource:v8 withURL:v10 bundleID:v11 allowUnlock:v6 animate:1];

  return v12;
}

- (BOOL)_launchFromSource:(int)a3 withURL:(id)a4 bundleID:(id)a5 allowUnlock:(BOOL)a6 animate:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  id v13 = a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    id v17 = [NSString stringWithUTF8String:"-[SBUserAgent _launchFromSource:withURL:bundleID:allowUnlock:animate:]"];
    [v16 handleFailureInFunction:v17 file:@"SBUserAgent.m" lineNumber:441 description:@"this call must be made on the main thread"];

    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
  id v15 = [NSNumber numberWithBool:1];
  [v14 setObject:v15 forKey:*MEMORY[0x1E4FA7AC0]];

LABEL_6:
  BOOL v18 = [(SBUserAgent *)self _openApplication:v13 withURL:v12 fromSource:v10 animated:v7 options:v14];

  return v18;
}

- (BOOL)isApplicationRestrictedOrHidden:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[SBIconController sharedInstance];
    uint64_t v5 = [v4 model];

    BOOL v6 = [v5 applicationIconForBundleIdentifier:v3];
    if ([v5 isIconVisible:v6])
    {
      BOOL v7 = +[SBApplicationController sharedInstance];
      BOOL v8 = [v7 restrictionController];
      char v9 = [v8 isApplicationIdentifierRestricted:v3];
    }
    else
    {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)undimScreen
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"-[SBUserAgent undimScreen]"];
    [v2 handleFailureInFunction:v3 file:@"SBUserAgent.m" lineNumber:466 description:@"this call must be made on the main thread"];
  }
  id v4 = +[SBLockScreenManager sharedInstance];
  [v4 requestUserAttentionScreenWakeFromSource:8 reason:@"SBUserAgent"];
}

- (void)lockAndDimDevice
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[SBUserAgent lockAndDimDevice]"];
    [v3 handleFailureInFunction:v4 file:@"SBUserAgent.m" lineNumber:472 description:@"this call must be made on the main thread"];
  }
  [(SBUserAgent *)self lockAndDimDeviceDisconnectingCallIfNecessary:1 andDimScreen:1];
}

- (void)lockAndDimDeviceDisconnectingCallIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v6 = [NSString stringWithUTF8String:"-[SBUserAgent lockAndDimDeviceDisconnectingCallIfNecessary:]"];
    [v5 handleFailureInFunction:v6 file:@"SBUserAgent.m" lineNumber:477 description:@"this call must be made on the main thread"];
  }
  [(SBUserAgent *)self lockAndDimDeviceDisconnectingCallIfNecessary:v3 andDimScreen:1];
}

- (void)lockAndDimDeviceDisconnectingCallIfNecessary:(BOOL)a3 andDimScreen:(BOOL)a4
{
  BOOL v4 = a4;
  v12[1] = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v6 = [NSString stringWithUTF8String:"-[SBUserAgent lockAndDimDeviceDisconnectingCallIfNecessary:andDimScreen:]"];
    [v5 handleFailureInFunction:v6 file:@"SBUserAgent.m" lineNumber:482 description:@"this call must be made on the main thread"];

    if (v4) {
      goto LABEL_3;
    }
LABEL_7:
    BOOL v7 = +[SBLockScreenManager sharedInstance];
    id v11 = @"SBUILockOptionsUseScreenOffModeKey";
    BOOL v8 = [NSNumber numberWithBool:0];
    v12[0] = v8;
    char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v7 lockUIFromSource:8 withOptions:v9];

    return;
  }
  if (!v4) {
    goto LABEL_7;
  }
LABEL_3:
  id v10 = [(id)SBApp screenSleepCoordinator];
  [v10 sleepAndLockUIFromSource:8 completion:0];
}

- (BOOL)isScreenOn
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v6 = [NSString stringWithUTF8String:"-[SBUserAgent isScreenOn]"];
    [v5 handleFailureInFunction:v6 file:@"SBUserAgent.m" lineNumber:497 description:@"this call must be made on the main thread"];
  }
  uint64_t v2 = +[SBBacklightController sharedInstance];
  if ([v2 screenIsOn]) {
    int v3 = [v2 isPendingScreenUnblankAfterCACommit] ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v15 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"-[SBUserAgent setIdleTimerDisabled:forReason:]"];
    [v13 handleFailureInFunction:v14 file:@"SBUserAgent.m" lineNumber:506 description:@"this call must be made on the main thread"];
  }
  idleTimerDisableAssertions = self->_idleTimerDisableAssertions;
  if (v4)
  {
    if (!idleTimerDisableAssertions)
    {
      BOOL v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      BOOL v8 = self->_idleTimerDisableAssertions;
      self->_idleTimerDisableAssertions = v7;
    }
    char v9 = +[SBIdleTimerGlobalCoordinator sharedInstance];
    id v10 = [v9 acquireIdleTimerDisableAssertionForReason:v15];

    [(NSMutableDictionary *)self->_idleTimerDisableAssertions setObject:v10 forKey:v15];
LABEL_7:

    goto LABEL_8;
  }
  if (idleTimerDisableAssertions)
  {
    id v11 = [(NSMutableDictionary *)idleTimerDisableAssertions objectForKey:v15];
    id v10 = v11;
    if (v11)
    {
      [v11 invalidate];
      [(NSMutableDictionary *)self->_idleTimerDisableAssertions removeObjectForKey:v15];
      if (![(NSMutableDictionary *)self->_idleTimerDisableAssertions count])
      {
        id v12 = self->_idleTimerDisableAssertions;
        self->_idleTimerDisableAssertions = 0;
      }
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (BOOL)isIdleTimerDisabledForReason:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    char v9 = [NSString stringWithUTF8String:"-[SBUserAgent isIdleTimerDisabledForReason:]"];
    [v8 handleFailureInFunction:v9 file:@"SBUserAgent.m" lineNumber:529 description:@"this call must be made on the main thread"];
  }
  uint64_t v5 = [(NSMutableDictionary *)self->_idleTimerDisableAssertions objectForKey:v4];
  BOOL v6 = v5 != 0;

  return v6;
}

- (void)setBadgeNumberOrString:(id)a3 forApplicationWithID:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = a4;
  id v7 = a3;
  if (([v5 isMainThread] & 1) == 0)
  {
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = [NSString stringWithUTF8String:"-[SBUserAgent setBadgeNumberOrString:forApplicationWithID:]"];
    [v9 handleFailureInFunction:v10 file:@"SBUserAgent.m" lineNumber:537 description:@"this call must be made on the main thread"];
  }
  BOOL v8 = +[SBApplicationController sharedInstance];
  id v11 = [v8 applicationWithBundleIdentifier:v6];

  [v11 setBadgeValue:v7];
}

- (void)setIdleText:(id)a3
{
  int v3 = (void *)MEMORY[0x1E4F29060];
  id v4 = a3;
  if (([v3 isMainThread] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"-[SBUserAgent setIdleText:]"];
    [v6 handleFailureInFunction:v7 file:@"SBUserAgent.m" lineNumber:543 description:@"this call must be made on the main thread"];
  }
  id v8 = +[SBIconController sharedInstance];
  uint64_t v5 = [v8 iconManager];
  [v5 setIdleModeText:v4];
}

- (id)folderNameForDisplayID:(id)a3
{
  id v3 = a3;
  id v4 = +[SBIconController sharedInstance];
  uint64_t v5 = [v4 folderNameForDisplayID:v3];

  return v5;
}

- (int)networkUsageTypeForAppWithDisplayID:(id)a3
{
  id v3 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [NSString stringWithUTF8String:"-[SBUserAgent networkUsageTypeForAppWithDisplayID:]"];
    [v7 handleFailureInFunction:v8 file:@"SBUserAgent.m" lineNumber:555 description:@"this call must be made on the main thread"];
  }
  id v4 = SBWorkspaceApplicationForIdentifier(v3);
  int v5 = [v4 dataUsage];

  return v5;
}

- (void)activateModalBulletinAlert:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F29060];
  id v6 = a3;
  if (([v3 isMainThread] & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    int v5 = [NSString stringWithUTF8String:"-[SBUserAgent activateModalBulletinAlert:]"];
    [v4 handleFailureInFunction:v5 file:@"SBUserAgent.m" lineNumber:564 description:@"this call must be made on the main thread"];
  }
  [v6 setAllowInCar:0];
  [MEMORY[0x1E4FA7938] activateAlertItem:v6];
}

- (void)addActiveInterfaceOrientationObserver:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[SBUserAgent addActiveInterfaceOrientationObserver:]"];
    [v3 handleFailureInFunction:v4 file:@"SBUserAgent.m" lineNumber:570 description:@"this call must be made on the main thread"];
  }
  [(id)SBApp addActiveOrientationObserver:v5];
}

- (void)removeActiveInterfaceOrientationObserver:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[SBUserAgent removeActiveInterfaceOrientationObserver:]"];
    [v3 handleFailureInFunction:v4 file:@"SBUserAgent.m" lineNumber:575 description:@"this call must be made on the main thread"];
  }
  [(id)SBApp removeActiveOrientationObserver:v5];
}

- (void)setMinimumBacklightLevel:(float)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    char v9 = [NSString stringWithUTF8String:"-[SBUserAgent setMinimumBacklightLevel:animated:]"];
    [v8 handleFailureInFunction:v9 file:@"SBUserAgent.m" lineNumber:580 description:@"this call must be made on the main thread"];
  }
  v6.n128_f32[0] = a3;
  SBSetMinimumBrightnessLevel(v4, v6, v7);
}

- (void)activateRemoteAlertService:(id)a3 options:(id)a4
{
  id v17 = a3;
  id v5 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    id v16 = [NSString stringWithUTF8String:"-[SBUserAgent activateRemoteAlertService:options:]"];
    [v15 handleFailureInFunction:v16 file:@"SBUserAgent.m" lineNumber:585 description:@"this call must be made on the main thread"];
  }
  __n128 v6 = [MEMORY[0x1E4FA6BB0] definitionWithServiceName:v17 legacyAlertOptions:v5];
  if (v6)
  {
    __n128 v7 = [(id)SBApp remoteTransientOverlaySessionManager];
    id v8 = [v7 sessionWithDefinition:v6 options:0];

    char v9 = [MEMORY[0x1E4FA6BA0] configurationContextWithLegacyAlertOptions:v5];
    [v8 prepareWithConfigurationContext:v9];
    id v10 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
    [v10 setLegacyAlertOptions:v5];
    id v11 = [v10 reason];

    if (!v11)
    {
      id v12 = objc_msgSend(v5, "bs_safeStringForKey:", *MEMORY[0x1E4FA71B8]);
      [v10 setReason:v12];
    }
    id v13 = objc_msgSend(v5, "bs_safeNumberForKey:", *MEMORY[0x1E4FA71A0]);
    uint64_t v14 = v13;
    if (v13) {
      objc_msgSend(v10, "setActivatingForSiri:", objc_msgSend(v13, "BOOLValue"));
    }
    [v8 activateWithContext:v10];
  }
}

- (BOOL)isNamedRemoteAlertServiceActive:(id)a3 controllerClassName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = [NSString stringWithUTF8String:"-[SBUserAgent isNamedRemoteAlertServiceActive:controllerClassName:]"];
    [v12 handleFailureInFunction:v13 file:@"SBUserAgent.m" lineNumber:608 description:@"this call must be made on the main thread"];
  }
  BOOL v7 = 0;
  if (v5 && v6)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FA6BB0]) initWithServiceName:v5 viewControllerClassName:v6];
    char v9 = [(id)SBApp remoteTransientOverlaySessionManager];
    id v10 = [v9 existingSessionsWithDefinition:v8 options:0];
    BOOL v7 = [v10 count] != 0;
  }
  return v7;
}

- (id)localizedDisplayNameForDisplayID:(id)a3
{
  id v3 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = [NSString stringWithUTF8String:"-[SBUserAgent localizedDisplayNameForDisplayID:]"];
    [v10 handleFailureInFunction:v11 file:@"SBUserAgent.m" lineNumber:617 description:@"this call must be made on the main thread"];
  }
  BOOL v4 = +[SBApplicationController sharedInstance];
  id v5 = [v4 applicationWithBundleIdentifier:v3];
  id v6 = [v5 displayName];

  if (!v6)
  {
    BOOL v7 = +[SBApplicationPlaceholderController sharedInstance];
    id v8 = [v7 placeholderForDisplayID:v3];
    id v6 = [v8 applicationDisplayName];
  }
  return v6;
}

- (void)enableLockScreenBundleNamed:(id)a3 activationContext:(id)a4
{
  id v13 = a3;
  id v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = a4;
  if (([v5 isMainThread] & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = [NSString stringWithUTF8String:"-[SBUserAgent enableLockScreenBundleNamed:activationContext:]"];
    [v11 handleFailureInFunction:v12 file:@"SBUserAgent.m" lineNumber:629 description:@"this call must be made on the main thread"];
  }
  BOOL v7 = [MEMORY[0x1E4FA7958] contextWithName:v13];
  [v7 setUserInfo:v6];

  id v8 = +[SBLockScreenManager sharedInstance];
  char v9 = [v8 lockScreenEnvironment];
  id v10 = [v9 pluginPresenter];
  [v10 enableLockScreenPluginWithContext:v7];
}

- (void)disableLockScreenBundleNamed:(id)a3 deactivationContext:(id)a4
{
  id v13 = a3;
  id v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = a4;
  if (([v5 isMainThread] & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = [NSString stringWithUTF8String:"-[SBUserAgent disableLockScreenBundleNamed:deactivationContext:]"];
    [v11 handleFailureInFunction:v12 file:@"SBUserAgent.m" lineNumber:636 description:@"this call must be made on the main thread"];
  }
  BOOL v7 = [MEMORY[0x1E4FA7958] contextWithName:v13];
  [v7 setUserInfo:v6];

  id v8 = +[SBLockScreenManager sharedInstance];
  char v9 = [v8 lockScreenEnvironment];
  id v10 = [v9 pluginPresenter];
  [v10 disableLockScreenPluginWithContext:v7];
}

- (__CFRunLoop)wifiRunLoopRef
{
  uint64_t v2 = +[SBWiFiManager sharedInstance];
  id v3 = (__CFRunLoop *)[v2 wifiRunLoopRef];

  return v3;
}

- (BOOL)isInternalInstall
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"-[SBUserAgent isInternalInstall]"];
    [v5 handleFailureInFunction:v6 file:@"SBUserAgent.m" lineNumber:651 description:@"this call must be made on the main thread"];
  }
  uint64_t v2 = +[SBPlatformController sharedInstance];
  char v3 = [v2 isInternalInstall];

  return v3;
}

- (id)topSuspendedEventsOnlyDisplayID
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    char v3 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v4 = [NSString stringWithUTF8String:"-[SBUserAgent topSuspendedEventsOnlyDisplayID]"];
    [v3 handleFailureInFunction:v4 file:@"SBUserAgent.m" lineNumber:660 description:@"this call must be made on the main thread"];
  }
  return 0;
}

- (SBIdleTimerPolicyAggregator)_idleTimerPolicyAggregator
{
  return self->_idleTimerPolicyAggregator;
}

- (void)_setIdleTimerPolicyAggregator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_idleTimerPolicyAggregator, 0);
  objc_storeStrong((id *)&self->_idleTimerDisableAssertions, 0);
}

void __68__SBUserAgent__openApplication_withURL_fromSource_animated_options___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 136315394;
  BOOL v4 = "-[SBUserAgent _openApplication:withURL:fromSource:animated:options:]_block_invoke_2";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "%s: Can't open %@ when device is locked, passcode locked or blocked.", (uint8_t *)&v3, 0x16u);
}

@end