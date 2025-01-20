@interface SBStatusBarTapManager
- (BOOL)_isUILocked:(id)a3;
- (BOOL)_performAfterAttemptingUnlockForAppWithBundleIdentifier:(id)a3 windowScene:(id)a4 completion:(id)a5;
- (BOOL)canHandleTapForBackgroundActivityWithIdentifier:(id)a3 windowScene:(id)a4;
- (BOOL)handleTapForBackgroundActivityWithIdentifier:(id)a3 windowScene:(id)a4;
- (id)_allApplicationDestinationsForApplications:(id)a3 windowScene:(id)a4;
- (id)_appDestinationForNextSceneToVisitForApps:(id)a3 andBackgroundActivityWithIdentifier:(id)a4 windowScene:(id)a5;
- (id)_foregroundApplicationDestinationsForApplications:(id)a3 windowScene:(id)a4;
- (id)_handlerForBackgroundActivityWithIdentifier:(id)a3 orOutApplications:(id *)a4;
- (id)_handlerForBackgroundActivityWithIdentifier:(id)a3 windowScene:(id)a4;
- (id)_recentlyTappedApplicationDestinationsForBackgroundActivityWithIdentifier:(id)a3;
- (id)_workspace;
- (void)_addRecentlyTappedApplicationDestinations:(id)a3 forBackgroundActivityWithIdentifier:(id)a4;
- (void)_resetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier:(id)a3;
- (void)_scheduleResetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier:(id)a3;
@end

@implementation SBStatusBarTapManager

- (BOOL)handleTapForBackgroundActivityWithIdentifier:(id)a3 windowScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [NSString stringWithUTF8String:"-[SBStatusBarTapManager handleTapForBackgroundActivityWithIdentifier:windowScene:]"];
    [v16 handleFailureInFunction:v17 file:@"SBStatusBarTapManager.m" lineNumber:69 description:@"this call must be made on the main thread"];
  }
  uint64_t v8 = [(SBStatusBarTapManager *)self _handlerForBackgroundActivityWithIdentifier:v6 windowScene:v7];
  v9 = (void *)v8;
  if (v8) {
    v10 = *(void **)(v8 + 24);
  }
  else {
    v10 = 0;
  }
  id v11 = v10;
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __82__SBStatusBarTapManager_handleTapForBackgroundActivityWithIdentifier_windowScene___block_invoke;
  v21[3] = &unk_1E6B0AF58;
  objc_copyWeak(&v23, &location);
  id v12 = v6;
  id v22 = v12;
  v13 = (void (**)(void, void))MEMORY[0x1D948C7A0](v21);
  if (v9 && v9[3] && [(SBStatusBarTapManager *)self _isUILocked:v7])
  {
    v14 = [v11 bundleIdentifier];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __82__SBStatusBarTapManager_handleTapForBackgroundActivityWithIdentifier_windowScene___block_invoke_2;
    v18[3] = &unk_1E6AFF0E8;
    v20 = v13;
    v19 = v9;
    [(SBStatusBarTapManager *)self _performAfterAttemptingUnlockForAppWithBundleIdentifier:v14 windowScene:v7 completion:v18];
  }
  else
  {
    ((void (**)(void, void *))v13)[2](v13, v9);
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v9 != 0;
}

void __82__SBStatusBarTapManager_handleTapForBackgroundActivityWithIdentifier_windowScene___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    v4 = (void *)a2[3];
  }
  else {
    v4 = 0;
  }
  id v8 = v4;
  if (-[_SBStatusBarTapHandler handleTap](a2))
  {
    v5 = [v8 sceneIdentifier];

    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
      [WeakRetained _addRecentlyTappedApplicationDestinations:v7 forBackgroundActivityWithIdentifier:*(void *)(a1 + 32)];
    }
  }
}

uint64_t __82__SBStatusBarTapManager_handleTapForBackgroundActivityWithIdentifier_windowScene___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void, void))(*(void *)(result + 40) + 16))(*(void *)(result + 40), *(void *)(result + 32));
  }
  return result;
}

- (BOOL)canHandleTapForBackgroundActivityWithIdentifier:(id)a3 windowScene:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F29060];
  id v8 = a3;
  if (([v7 isMainThread] & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = [NSString stringWithUTF8String:"-[SBStatusBarTapManager canHandleTapForBackgroundActivityWithIdentifier:windowScene:]"];
    [v17 handleFailureInFunction:v18 file:@"SBStatusBarTapManager.m" lineNumber:97 description:@"this call must be made on the main thread"];
  }
  v9 = [MEMORY[0x1E4F1CAD0] set];
  id v19 = v9;
  v10 = [(SBStatusBarTapManager *)self _handlerForBackgroundActivityWithIdentifier:v8 orOutApplications:&v19];

  id v11 = v19;
  if (v10)
  {
    BOOL v12 = 1;
  }
  else if ([v11 count])
  {
    v13 = [(SBStatusBarTapManager *)self _allApplicationDestinationsForApplications:v11 windowScene:v6];
    v14 = [(SBStatusBarTapManager *)self _foregroundApplicationDestinationsForApplications:v11 windowScene:v6];
    v15 = (void *)[v13 mutableCopy];
    [v15 minusOrderedSet:v14];
    BOOL v12 = [v15 count] != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)_handlerForBackgroundActivityWithIdentifier:(id)a3 windowScene:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F1CAD0] set];
  id v17 = v9;
  v10 = [(SBStatusBarTapManager *)self _handlerForBackgroundActivityWithIdentifier:v7 orOutApplications:&v17];
  id v11 = v17;

  if ([v11 count])
  {
    if (v10)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"SBStatusBarTapManager.m" lineNumber:128 description:@"should not have both a handler and apps"];
    }
    BOOL v12 = [(SBStatusBarTapManager *)self _appDestinationForNextSceneToVisitForApps:v11 andBackgroundActivityWithIdentifier:v7 windowScene:v8];
    if (v12)
    {
      v13 = -[_SBStatusBarTapHandler initWithApplicationDestination:]([_SBStatusBarTapHandler alloc], v12);

      v10 = v13;
    }
  }
  if (!v10)
  {
    v14 = SBLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SBStatusBarTapManager _handlerForBackgroundActivityWithIdentifier:windowScene:]((uint64_t)v7, (uint64_t)v11, v14);
    }
  }
  return v10;
}

- (id)_handlerForBackgroundActivityWithIdentifier:(id)a3 orOutApplications:(id *)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA80] set];
  if ([v5 isEqualToString:*MEMORY[0x1E4FA9630]]) {
    goto LABEL_11;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4FA9640]])
  {
    id v7 = SBMapsBundleIdentifier;
    goto LABEL_4;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4FA9668]])
  {
    id v8 = [(id)SBApp audioRecordingManager];
    v9 = [v8 nowRecordingApplication];
    if (v9) {
      [v6 addObject:v9];
    }

    goto LABEL_10;
  }
  if (![v5 isEqualToString:*MEMORY[0x1E4FA95F0]])
  {
    if ([v5 isEqualToString:*MEMORY[0x1E4FA95C0]])
    {
      id v8 = [(id)SBApp nowLocatingApps];
      if (!v8) {
        goto LABEL_10;
      }
LABEL_24:
      [v6 addObjectsFromArray:v8];
      goto LABEL_10;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4FA9610]])
    {
      id v17 = [_SBStatusBarTapHandler alloc];
      v18 = &__block_literal_global_342;
    }
    else
    {
      if ([v5 isEqualToString:*MEMORY[0x1E4FA96B8]])
      {
        v14 = [_SBStatusBarTapHandler alloc];
        v15 = (void *)MEMORY[0x1E4F1CB10];
        v16 = @"prefs:root=INTERNET_TETHERING";
        goto LABEL_41;
      }
      if ([v5 isEqualToString:*MEMORY[0x1E4FA95F8]])
      {
        id v7 = SBDiagnosticsBundleIdentifier;
LABEL_4:
        id v8 = SBWorkspaceApplicationForIdentifier(*v7);
        if (v8) {
          [v6 addObject:v8];
        }
        goto LABEL_10;
      }
      if ([v5 isEqualToString:*MEMORY[0x1E4FA9638]])
      {
        v14 = [_SBStatusBarTapHandler alloc];
        v15 = (void *)MEMORY[0x1E4F1CB10];
        v16 = @"prefs:root=General&path=ManagedConfigurationList";
        goto LABEL_41;
      }
      if ([v5 isEqualToString:*MEMORY[0x1E4FA96B0]])
      {
        id v19 = +[SBPlatformController sharedInstance];
        int v20 = [v19 isInternalInstall];

        if (!v20) {
          goto LABEL_11;
        }
        v14 = [_SBStatusBarTapHandler alloc];
        v15 = (void *)MEMORY[0x1E4F1CB10];
        v16 = @"prefs:root=INTERNAL_SETTINGS&path=sysdiagnose";
        goto LABEL_41;
      }
      if (![v5 isEqualToString:*MEMORY[0x1E4FA9690]])
      {
        if ([v5 isEqualToString:*MEMORY[0x1E4FA95E8]])
        {
          v14 = [_SBStatusBarTapHandler alloc];
          v15 = (void *)MEMORY[0x1E4F1CB10];
          v16 = @"prefs:root=EMERGENCY_SOS";
          goto LABEL_41;
        }
        if (!v5 || (STUIBackgroundActivityIdentiferRepresentsStyleOverride() & 1) != 0) {
          goto LABEL_11;
        }
        id v8 = [(id)SBApp appsForBackgroundActivityWithIdentifier:v5];
        goto LABEL_24;
      }
      id v17 = [_SBStatusBarTapHandler alloc];
      v18 = &__block_literal_global_35_0;
    }
    v10 = -[_SBStatusBarTapHandler initWithBlock:](v17, v18);
    goto LABEL_12;
  }
  id v8 = +[SBPlatformController sharedInstance];
  if ([v8 isInternalInstall])
  {
    BOOL v12 = [MEMORY[0x1E4F94118] sharedInstance];
    int v13 = [v12 activePrototypingEnabled];

    if (!v13) {
      goto LABEL_11;
    }
    v14 = [_SBStatusBarTapHandler alloc];
    v15 = (void *)MEMORY[0x1E4F1CB10];
    v16 = @"prefs:root=INTERNAL_SETTINGS&path=Prototyping";
LABEL_41:
    v21 = [v15 URLWithString:v16];
    v10 = -[_SBStatusBarTapHandler initWithURL:](v14, v21);

    goto LABEL_12;
  }
LABEL_10:

LABEL_11:
  v10 = 0;
LABEL_12:
  if (a4 && [v6 count]) {
    *a4 = v6;
  }

  return v10;
}

void __87__SBStatusBarTapManager__handlerForBackgroundActivityWithIdentifier_orOutApplications___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"SBStatusBarReturnToHearingAidNotification" object:0 userInfo:0];
}

uint64_t __87__SBStatusBarTapManager__handlerForBackgroundActivityWithIdentifier_orOutApplications___block_invoke_2()
{
  return MEMORY[0x1F4177BF0]();
}

- (id)_appDestinationForNextSceneToVisitForApps:(id)a3 andBackgroundActivityWithIdentifier:(id)a4 windowScene:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(SBStatusBarTapManager *)self _allApplicationDestinationsForApplications:v10 windowScene:v9];
  BOOL v12 = [(SBStatusBarTapManager *)self _foregroundApplicationDestinationsForApplications:v10 windowScene:v9];

  int v13 = [(SBStatusBarTapManager *)self _recentlyTappedApplicationDestinationsForBackgroundActivityWithIdentifier:v8];
  v14 = (void *)[v11 mutableCopy];
  BOOL v15 = [(SBStatusBarTapManager *)self _isUILocked:v9];

  if (v15)
  {
LABEL_6:
    id v19 = [v14 firstObject];
    goto LABEL_7;
  }
  [v14 minusOrderedSet:v12];
  if ([v14 count])
  {
    [v14 minusSet:v13];
    if (![v14 count]) {
      [(SBStatusBarTapManager *)self _resetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier:v8];
    }
    v16 = [v12 set];
    [(SBStatusBarTapManager *)self _addRecentlyTappedApplicationDestinations:v16 forBackgroundActivityWithIdentifier:v8];

    uint64_t v17 = [(SBStatusBarTapManager *)self _recentlyTappedApplicationDestinationsForBackgroundActivityWithIdentifier:v8];

    v18 = (void *)[v11 mutableCopy];
    [v18 minusSet:v17];
    int v13 = (void *)v17;
    v14 = v18;
    goto LABEL_6;
  }
  id v19 = 0;
LABEL_7:

  return v19;
}

- (void)_addRecentlyTappedApplicationDestinations:(id)a3 forBackgroundActivityWithIdentifier:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SBStatusBarTapManager.m", 261, @"Invalid parameter not satisfying: %@", @"destinations" object file lineNumber description];
  }
  backgroundActivityIdentifiersToRecentScenes = self->_backgroundActivityIdentifiersToRecentScenes;
  if (!backgroundActivityIdentifiersToRecentScenes)
  {
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
    id v11 = self->_backgroundActivityIdentifiersToRecentScenes;
    self->_backgroundActivityIdentifiersToRecentScenes = v10;

    backgroundActivityIdentifiersToRecentScenes = self->_backgroundActivityIdentifiersToRecentScenes;
  }
  BOOL v12 = [(NSMutableDictionary *)backgroundActivityIdentifiersToRecentScenes objectForKeyedSubscript:v8];
  int v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1CA80] set];
  }
  BOOL v15 = v14;

  v16 = [v7 allObjects];
  [v15 addObjectsFromArray:v16];

  [(NSMutableDictionary *)self->_backgroundActivityIdentifiersToRecentScenes setObject:v15 forKeyedSubscript:v8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = v7;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v23 = [v22 sceneIdentifier];

        if (!v23) {
          [v15 removeObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v19);
  }

  [(SBStatusBarTapManager *)self _scheduleResetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier:v8];
}

- (void)_scheduleResetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier:(id)a3
{
  id v4 = a3;
  if (!self->_backgroundActivityIdentifiersToRecentSceneResetTimers)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    backgroundActivityIdentifiersToRecentSceneResetTimers = self->_backgroundActivityIdentifiersToRecentSceneResetTimers;
    self->_backgroundActivityIdentifiersToRecentSceneResetTimers = v5;
  }
  objc_initWeak(&location, self);
  id v7 = [(NSMutableDictionary *)self->_backgroundActivityIdentifiersToRecentSceneResetTimers objectForKeyedSubscript:v4];
  id v8 = v7;
  if (v7) {
    [v7 invalidate];
  }
  id v9 = (void *)MEMORY[0x1E4F1CB00];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __105__SBStatusBarTapManager__scheduleResetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier___block_invoke;
  v13[3] = &unk_1E6AF8EE0;
  objc_copyWeak(&v15, &location);
  id v10 = v4;
  id v14 = v10;
  id v11 = [v9 timerWithTimeInterval:0 repeats:v13 block:8.0];

  BOOL v12 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v12 addTimer:v11 forMode:*MEMORY[0x1E4F1C4B0]];

  [v11 setTolerance:1.0];
  [(NSMutableDictionary *)self->_backgroundActivityIdentifiersToRecentSceneResetTimers setObject:v11 forKeyedSubscript:v10];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __105__SBStatusBarTapManager__scheduleResetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _resetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier:*(void *)(a1 + 32)];
}

- (id)_recentlyTappedApplicationDestinationsForBackgroundActivityWithIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_backgroundActivityIdentifiersToRecentScenes objectForKeyedSubscript:a3];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void)_resetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier:(id)a3
{
}

- (id)_workspace
{
  return +[SBWorkspace mainWorkspace];
}

- (BOOL)_isUILocked:(id)a3
{
  v3 = [a3 uiLockStateProvider];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[SBLockScreenManager sharedInstance];
  }
  id v6 = v5;

  char v7 = [v6 isUILocked];
  return v7;
}

- (id)_allApplicationDestinationsForApplications:(id)a3 windowScene:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v29 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v5;
  uint64_t v27 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v9 = +[SBMainSwitcherControllerCoordinator sharedInstance];
        id v10 = [v8 bundleIdentifier];
        id v11 = [v9 _persistenceIdentifiersForBundleIdentifier:v10 onlyIncludeLaunchableIdentifiers:1];

        uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v44 count:16];
        if (!v12)
        {

LABEL_20:
          id v22 = SBLogCommon();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            [(SBStatusBarTapManager *)v38 _allApplicationDestinationsForApplications:&v39 windowScene:v22];
          }

          id v23 = [[_SBStatusBarTapApplicationDestination alloc] initWithApplication:v8 sceneIdentifier:0 windowScene:v6];
          [v29 addObject:v23];

          continue;
        }
        uint64_t v13 = v12;
        uint64_t v28 = i;
        char v14 = 0;
        uint64_t v15 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v31 != v15) {
              objc_enumerationMutation(v11);
            }
            uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * j);
            uint64_t v18 = [v8 _sceneIdentifierForStoredPersistenceIdentifier:v17];
            if (v18)
            {
              uint64_t v19 = [[_SBStatusBarTapApplicationDestination alloc] initWithApplication:v8 sceneIdentifier:v18 windowScene:v6];
              [v29 addObject:v19];
              char v14 = 1;
            }
            else
            {
              SBLogCommon();
              uint64_t v19 = (_SBStatusBarTapApplicationDestination *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_ERROR))
              {
                uint64_t v20 = [v8 bundleIdentifier];
                *(_DWORD *)buf = 138412546;
                uint64_t v41 = v17;
                __int16 v42 = 2112;
                uint64_t v43 = v20;
                v21 = (void *)v20;
                _os_log_error_impl(&dword_1D85BA000, &v19->super, OS_LOG_TYPE_ERROR, "Unable to find a scene identifier for persistence identifier %@ with application %@", buf, 0x16u);
              }
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v44 count:16];
        }
        while (v13);

        uint64_t i = v28;
        if ((v14 & 1) == 0) {
          goto LABEL_20;
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
    }
    while (v27);
  }

  return v29;
}

- (id)_foregroundApplicationDestinationsForApplications:(id)a3 windowScene:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v8 = [v6 sceneManager];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  }
  id v11 = v10;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v37 = v11;
  uint64_t v12 = [v11 externalForegroundApplicationSceneHandles];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v18 = [v17 sceneIdentifier];
        uint64_t v19 = [v17 application];
        if ([v5 containsObject:v19])
        {
          uint64_t v20 = [[_SBStatusBarTapApplicationDestination alloc] initWithApplication:v19 sceneIdentifier:v18 windowScene:v6];
          [v7 addObject:v20];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v14);
  }

  v21 = +[SBSystemApertureSceneElement activeElements];
  if ([v21 count])
  {
    v38 = v7;
    id v22 = (void *)MEMORY[0x1E4F1CAD0];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __87__SBStatusBarTapManager__foregroundApplicationDestinationsForApplications_windowScene___block_invoke;
    v43[3] = &unk_1E6B0AF80;
    id v44 = v5;
    long long v36 = v21;
    id v23 = objc_msgSend(v21, "bs_compactMap:", v43);
    v24 = [v22 setWithArray:v23];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v25 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
    uint64_t v26 = [v25 externalApplicationSceneHandles];

    uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v40 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v31 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          long long v32 = [v31 sceneIdentifier];
          long long v33 = [v31 application];
          if ([v24 containsObject:v33])
          {
            long long v34 = [[_SBStatusBarTapApplicationDestination alloc] initWithApplication:v33 sceneIdentifier:v32 windowScene:v6];
            [v38 addObject:v34];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v39 objects:v49 count:16];
      }
      while (v28);
    }

    char v7 = v38;
    v21 = v36;
  }

  return v7;
}

id __87__SBStatusBarTapManager__foregroundApplicationDestinationsForApplications_windowScene___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 associatedApplication];
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 associatedApplication];
    LODWORD(v5) = [v5 containsObject:v6];

    if (v5)
    {
      id v4 = [v3 associatedApplication];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (BOOL)_performAfterAttemptingUnlockForAppWithBundleIdentifier:(id)a3 windowScene:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init(SBLockScreenUnlockRequest);
  [(SBLockScreenUnlockRequest *)v10 setName:@"Unlock to launch double height status bar app."];
  [(SBLockScreenUnlockRequest *)v10 setSource:24];
  [(SBLockScreenUnlockRequest *)v10 setWindowScene:v7];
  id v11 = SBWorkspaceApplicationForIdentifier(v9);

  if (!SBWorkspaceApplicationCanActivateWhilePasscodeLocked(v11)
    || [v7 isContinuityDisplayWindowScene])
  {
    [(SBLockScreenUnlockRequest *)v10 setIntent:3];
  }
  uint64_t v12 = +[SBLockScreenManager sharedInstance];
  char v13 = [v12 unlockWithRequest:v10 completion:v8];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivityIdentifiersToRecentSceneResetTimers, 0);
  objc_storeStrong((id *)&self->_backgroundActivityIdentifiersToRecentScenes, 0);
}

- (void)_handlerForBackgroundActivityWithIdentifier:(NSObject *)a3 windowScene:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = STBackgroundActivityIdentifierDescription();
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "unable to construct a tap handler for %@, %@", (uint8_t *)&v6, 0x16u);
}

- (void)_allApplicationDestinationsForApplications:(void *)a3 windowScene:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 bundleIdentifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1D85BA000, a4, OS_LOG_TYPE_ERROR, "Unable to find a scene identifier for %@, perhaps it was launched by CarPlay?", a1, 0xCu);
}

@end