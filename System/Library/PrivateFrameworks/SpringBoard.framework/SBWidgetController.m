@interface SBWidgetController
- (BOOL)_shouldUsePinnedWidgets;
- (BOOL)areWidgetsPinnedForWidgetDiscoveryController:(id)a3;
- (BOOL)bootstrapFavoriteWidgets;
- (BOOL)didPurgeNonASTCSnapshotsForWidgetDiscoveryController:(id)a3;
- (BOOL)didPurgeNonCAMLSnapshotsForWidgetDiscoveryController:(id)a3;
- (BOOL)shouldShowWidgetsPinningTeachingViewForWidgetDiscoveryController:(id)a3;
- (BOOL)widgetDiscoveryController:(id)a3 shouldPurgeArchivedSnapshotsForWidgetWithBundleIdentifier:(id)a4;
- (SBWidgetController)init;
- (WGWidgetDiscoveryController)_widgetDiscoveryController;
- (id)newAvocadoWidgetListViewControllerWithSettings:(WGWidgetListSettings)a3;
- (id)newWidgetGroupViewControllerWithSettings:(WGWidgetListSettings)a3;
- (id)newWidgetListViewControllerWithSettings:(WGWidgetListSettings)a3;
- (id)statusBarAssertionForWidgetDiscoveryController:(id)a3 legibilityStyle:(int64_t)a4;
- (id)todayWidgetIdentifiers;
- (id)widgetDiscoveryController:(id)a3 preferredViewControllerForPresentingFromViewController:(id)a4;
- (void)_reloadWidgetPreferences;
- (void)launchExtensionWithBundleID:(id)a3 options:(id)a4 completion:(id)a5;
- (void)removeWidgetIdentifiersFromToday:(id)a3;
- (void)setBootstrapFavoriteWidgets:(BOOL)a3;
- (void)setWidgetDiscoveryController:(id)a3;
- (void)widgetDiscoveryController:(id)a3 didEndUsingStatusBarAssertion:(id)a4;
- (void)widgetDiscoveryController:(id)a3 requestUnlockWithCompletion:(id)a4;
- (void)widgetDiscoveryController:(id)a3 updateStatusBarAssertion:(id)a4 withLegibilityStyle:(int64_t)a5;
- (void)widgetDiscoveryController:(id)a3 widgetWithBundleIdentifier:(id)a4 didEncounterProblematicSnapshotAtURL:(id)a5;
@end

@implementation SBWidgetController

- (SBWidgetController)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBWidgetController;
  v2 = [(SBWidgetController *)&v8 init];
  if (v2)
  {
    v3 = (WGWidgetDiscoveryController *)objc_alloc_init(MEMORY[0x1E4FB7040]);
    widgetDiscoveryController = v2->_widgetDiscoveryController;
    v2->_widgetDiscoveryController = v3;

    [(WGWidgetDiscoveryController *)v2->_widgetDiscoveryController setDelegate:v2];
    [(WGWidgetDiscoveryController *)v2->_widgetDiscoveryController beginDiscovery];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_SBWidgetViewControllerPreferencesChangedHandler, @"com.apple.springboard.widgetViewControllerPrefsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(SBWidgetController *)v2 _reloadWidgetPreferences];
    v6 = +[SBMainWorkspace sharedInstance];
    [v6 registerHandler:v2 forExtensionPoint:@"com.apple.widget-extension"];
  }
  return v2;
}

- (void)_reloadWidgetPreferences
{
  v3 = +[SBDefaults localDefaults];
  id v4 = [v3 notificationCenterDefaults];

  -[WGWidgetDiscoveryController setWidgetLoggingEnabled:](self->_widgetDiscoveryController, "setWidgetLoggingEnabled:", [v4 isWidgetLoggingEnabled]);
  -[WGWidgetDiscoveryController setWidgetSnapshotTimestampsEnabled:](self->_widgetDiscoveryController, "setWidgetSnapshotTimestampsEnabled:", [v4 showWidgetSnapshotDebugLabels]);
}

- (id)newWidgetGroupViewControllerWithSettings:(WGWidgetListSettings)a3
{
  uint64_t v3 = *(void *)&a3.var1;
  unint64_t var0 = a3.var0;
  id v6 = objc_alloc(MEMORY[0x1E4FB7048]);
  widgetDiscoveryController = self->_widgetDiscoveryController;
  return (id)objc_msgSend(v6, "initWithWidgetDiscoveryController:listSettings:", widgetDiscoveryController, var0, v3);
}

- (id)newWidgetListViewControllerWithSettings:(WGWidgetListSettings)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4FB7038]);
  widgetDiscoveryController = self->_widgetDiscoveryController;
  return (id)[v4 initWithWidgetDiscoveryController:widgetDiscoveryController];
}

- (id)newAvocadoWidgetListViewControllerWithSettings:(WGWidgetListSettings)a3
{
  uint64_t v3 = *(void *)&a3.var1;
  unint64_t var0 = a3.var0;
  id v6 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4FB7030]) initWithWidgetDiscoveryController:self->_widgetDiscoveryController];
    objc_msgSend(v8, "setListSettings:", var0, v3);
    return v8;
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4FB7038]);
    widgetDiscoveryController = self->_widgetDiscoveryController;
    return (id)[v10 initWithWidgetDiscoveryController:widgetDiscoveryController];
  }
}

- (void)setBootstrapFavoriteWidgets:(BOOL)a3
{
}

- (BOOL)bootstrapFavoriteWidgets
{
  return [(WGWidgetDiscoveryController *)self->_widgetDiscoveryController bootstrapFavoriteWidgets];
}

- (id)todayWidgetIdentifiers
{
  return (id)[(WGWidgetDiscoveryController *)self->_widgetDiscoveryController todayWidgetIdentifiers];
}

- (void)removeWidgetIdentifiersFromToday:(id)a3
{
}

- (void)widgetDiscoveryController:(id)a3 widgetWithBundleIdentifier:(id)a4 didEncounterProblematicSnapshotAtURL:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a5;
  if (MEMORY[0x1D948B7C0]("-[SBWidgetController widgetDiscoveryController:widgetWithBundleIdentifier:didEncounterProblematicSnapshotAtURL:]"))
  {
    id v6 = [v5 path];
    uint64_t v7 = SBFCachesPathForSandboxPath();
    objc_super v8 = [v7 stringByAppendingPathComponent:@"com.apple.springboard"];

    v9 = [v8 stringByAppendingPathComponent:@"badwidgets"];

    id v10 = [MEMORY[0x1E4F4F708] sharedInstance];
    v11 = [MEMORY[0x1E4F1C9C8] date];
    v12 = [v10 formatDateAsLongYMDHMSNoSpacesWithDate:v11];

    v13 = [v9 stringByAppendingPathComponent:v12];

    SBEnsureDirectoryExistsAtPath();
    v14 = [v6 lastPathComponent];
    v15 = [v13 stringByAppendingPathComponent:v14];

    v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    v17 = [v5 path];
    id v23 = 0;
    int v18 = [v16 moveItemAtPath:v17 toPath:v15 error:&v23];
    id v19 = v23;

    v20 = SBLogCommon();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v18)
    {
      if (v21)
      {
        *(_DWORD *)buf = 138543874;
        v25 = v6;
        __int16 v26 = 2114;
        v27 = v15;
        __int16 v28 = 2114;
        id v29 = v19;
        v22 = "Moved potentially bad item from %{public}@ to %{public}@: %{public}@";
LABEL_7:
        _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_INFO, v22, buf, 0x20u);
      }
    }
    else if (v21)
    {
      *(_DWORD *)buf = 138543874;
      v25 = v6;
      __int16 v26 = 2114;
      v27 = v15;
      __int16 v28 = 2114;
      id v29 = v19;
      v22 = "Failed to move potentially bad item from %{public}@ to %{public}@: %{public}@";
      goto LABEL_7;
    }
  }
}

- (BOOL)_shouldUsePinnedWidgets
{
  return 0;
}

- (BOOL)areWidgetsPinnedForWidgetDiscoveryController:(id)a3
{
  return 0;
}

- (BOOL)shouldShowWidgetsPinningTeachingViewForWidgetDiscoveryController:(id)a3
{
  return 0;
}

- (void)widgetDiscoveryController:(id)a3 requestUnlockWithCompletion:(id)a4
{
  id v4 = a4;
  id v6 = objc_alloc_init(SBLockScreenUnlockRequest);
  [(SBLockScreenUnlockRequest *)v6 setSource:4];
  [(SBLockScreenUnlockRequest *)v6 setIntent:2];
  [(SBLockScreenUnlockRequest *)v6 setName:@"SBWidgetController"];
  [(SBLockScreenUnlockRequest *)v6 setWantsBiometricPresentation:1];
  id v5 = +[SBLockScreenManager sharedInstance];
  [v5 unlockWithRequest:v6 completion:v4];
}

- (id)widgetDiscoveryController:(id)a3 preferredViewControllerForPresentingFromViewController:(id)a4
{
  id v4 = a4;
  return v4;
}

- (BOOL)widgetDiscoveryController:(id)a3 shouldPurgeArchivedSnapshotsForWidgetWithBundleIdentifier:(id)a4
{
  id v4 = objc_msgSend(MEMORY[0x1E4F624D0], "sharedInstance", a3, a4);
  id v5 = [v4 initializationContext];
  char v6 = [v5 lastExitReason];

  return (v6 & 0x14) != 0;
}

- (BOOL)didPurgeNonCAMLSnapshotsForWidgetDiscoveryController:(id)a3
{
  uint64_t v3 = +[SBDefaults localDefaults];
  id v4 = [v3 notificationCenterDefaults];

  LOBYTE(v3) = [v4 didPurgeNonCAMLSnapshots];
  [v4 setDidPurgeNonCAMLSnapshots:1];

  return (char)v3;
}

- (BOOL)didPurgeNonASTCSnapshotsForWidgetDiscoveryController:(id)a3
{
  uint64_t v3 = +[SBDefaults localDefaults];
  id v4 = [v3 notificationCenterDefaults];

  LOBYTE(v3) = [v4 didPurgeNonASTCSnapshots];
  [v4 setDidPurgeNonASTCSnapshots:1];

  return (char)v3;
}

- (id)statusBarAssertionForWidgetDiscoveryController:(id)a3 legibilityStyle:(int64_t)a4
{
  id v5 = +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay];
  char v6 = [v5 assertionManager];
  if ([v5 isStatusBarEffectivelyHidden])
  {
    uint64_t v7 = 0;
  }
  else
  {
    objc_super v8 = objc_alloc_init(SBMutableStatusBarSettings);
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F43228]) initWithStyle:a4];
    [(SBMutableStatusBarSettings *)v8 setLegibilitySettings:v9];

    [(SBMutableStatusBarSettings *)v8 setAlpha:&unk_1F3348AF8];
    uint64_t v7 = (void *)[v6 newSettingsAssertionWithSettings:v8 atLevel:7 reason:@"WidgetListEditView"];
    [v7 acquire];
  }
  return v7;
}

- (void)widgetDiscoveryController:(id)a3 updateStatusBarAssertion:(id)a4 withLegibilityStyle:(int64_t)a5
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__SBWidgetController_widgetDiscoveryController_updateStatusBarAssertion_withLegibilityStyle___block_invoke;
  v8[3] = &__block_descriptor_40_e36_v16__0__SBMutableStatusBarSettings_8l;
  v8[4] = a5;
  [v7 modifySettingsWithBlock:v8];
}

void __93__SBWidgetController_widgetDiscoveryController_updateStatusBarAssertion_withLegibilityStyle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F43228];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithStyle:*(void *)(a1 + 32)];
  [v4 setLegibilitySettings:v5];
}

- (void)widgetDiscoveryController:(id)a3 didEndUsingStatusBarAssertion:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) == 0;
  id v5 = v6;
  if (v4) {
    id v5 = 0;
  }
  [v5 invalidate];
}

- (void)launchExtensionWithBundleID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_alloc_init(SBTodayWidgetXCodeDebuggingUtility);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__SBWidgetController_launchExtensionWithBundleID_options_completion___block_invoke;
  v15[3] = &unk_1E6AFE018;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(SBTodayWidgetXCodeDebuggingUtility *)v11 launchTodayViewFromCurrentContextWithCompletion:v15];
}

void __69__SBWidgetController_launchExtensionWithBundleID_options_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__SBWidgetController_launchExtensionWithBundleID_options_completion___block_invoke_2;
    v10[3] = &unk_1E6AF5A50;
    uint64_t v8 = *(void *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    [v7 debugWidgetWithBundleID:v6 options:v8 completion:v10];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 56);
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v5);
    }
  }
}

uint64_t __69__SBWidgetController_launchExtensionWithBundleID_options_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (WGWidgetDiscoveryController)_widgetDiscoveryController
{
  return self->_widgetDiscoveryController;
}

- (void)setWidgetDiscoveryController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end