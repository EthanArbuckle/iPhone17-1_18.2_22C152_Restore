@interface SBSUIRemoteAlertSceneHostComponent
- (BOOL)allowsAlertStacking;
- (BOOL)hidEventDeferringDisabled;
- (BOOL)isAttachedToWindowedAccessory;
- (BOOL)isContentOpaque;
- (BOOL)shouldDisableOrientationUpdates;
- (CGRect)windowedAccessoryCutoutFrameInScreen;
- (NSNumber)preferredSceneDeactivationReason;
- (NSSet)backgroundActivitiesToSuppress;
- (NSString)configurationIdentifier;
- (SBSRemoteAlertActivationContext)activationContext;
- (SBSRemoteAlertConfigurationContext)configurationContext;
- (SBSUIRemoteAlertSceneHostComponentDelegate)delegate;
- (SBUIRemoteAlertIdleTimerSettings)desiredIdleTimerSettings;
- (double)desiredAutoLockDuration;
- (int)preferredStatusBarVisibility;
- (int64_t)dismissalAnimationStyle;
- (int64_t)preferredStatusBarStyle;
- (int64_t)swipeDismissalStyle;
- (int64_t)whitePointAdaptivityStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_flushPendingTransitionersWithContext:(id)a3;
- (void)_performSafeSettingsUpdate:(id)a3;
- (void)_performSafeTransition:(id)a3;
- (void)didInvalidateForRemoteAlertServiceInvalidation;
- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4;
- (void)handleButtonActions:(id)a3;
- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)scene:(id)a3 willUpdateSettings:(id)a4;
- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5;
- (void)setActivationContext:(id)a3;
- (void)setConfigurationContext:(id)a3;
- (void)setConfigurationIdentifier:(id)a3;
- (void)setDefaultStatusBarHeightsForWindowScene:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBSUIRemoteAlertSceneHostComponent

- (void)setConfigurationIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__SBSUIRemoteAlertSceneHostComponent_setConfigurationIdentifier___block_invoke;
  v6[3] = &unk_1E5CCD560;
  id v7 = v4;
  id v5 = v4;
  [(SBSUIRemoteAlertSceneHostComponent *)self _performSafeSettingsUpdate:v6];
}

uint64_t __65__SBSUIRemoteAlertSceneHostComponent_setConfigurationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setConfigurationIdentifier:*(void *)(a1 + 32)];
}

- (void)setConfigurationContext:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSceneComponent *)self hostScene];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SBSUIRemoteAlertSceneHostComponent_setConfigurationContext___block_invoke;
  v7[3] = &unk_1E5CCEB98;
  id v8 = v4;
  id v6 = v4;
  [v5 configureParameters:v7];
}

void __62__SBSUIRemoteAlertSceneHostComponent_setConfigurationContext___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__SBSUIRemoteAlertSceneHostComponent_setConfigurationContext___block_invoke_2;
  v3[3] = &unk_1E5CCE610;
  id v4 = *(id *)(a1 + 32);
  [a2 updateClientSettingsWithBlock:v3];
}

uint64_t __62__SBSUIRemoteAlertSceneHostComponent_setConfigurationContext___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setInitialRemoteAlertConfigurationContext:*(void *)(a1 + 32)];
}

- (void)setActivationContext:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSceneComponent *)self hostScene];
  int v6 = [v5 isActive];

  if (v6)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__SBSUIRemoteAlertSceneHostComponent_setActivationContext___block_invoke;
    v13[3] = &unk_1E5CCEBC0;
    id v7 = &v14;
    id v14 = v4;
    id v8 = v4;
    [(SBSUIRemoteAlertSceneHostComponent *)self _performSafeTransition:v13];
  }
  else
  {
    v9 = [(FBSSceneComponent *)self hostScene];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__SBSUIRemoteAlertSceneHostComponent_setActivationContext___block_invoke_2;
    v11[3] = &unk_1E5CCEB98;
    id v7 = &v12;
    id v12 = v4;
    id v10 = v4;
    [v9 configureParameters:v11];
  }
}

uint64_t __59__SBSUIRemoteAlertSceneHostComponent_setActivationContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setRemoteAlertActivationContext:*(void *)(a1 + 32)];
}

void __59__SBSUIRemoteAlertSceneHostComponent_setActivationContext___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__SBSUIRemoteAlertSceneHostComponent_setActivationContext___block_invoke_3;
  v3[3] = &unk_1E5CCE610;
  id v4 = *(id *)(a1 + 32);
  [a2 updateClientSettingsWithBlock:v3];
}

uint64_t __59__SBSUIRemoteAlertSceneHostComponent_setActivationContext___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setInitialRemoteAlertActivationContext:*(void *)(a1 + 32)];
}

- (void)setDefaultStatusBarHeightsForWindowScene:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSceneComponent *)self hostScene];
  char v6 = [v5 isActive];

  if ((v6 & 1) == 0)
  {
    id v7 = [v4 statusBarManager];
    id v8 = [v7 statusBar];

    v9 = [(FBSSceneComponent *)self hostScene];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__SBSUIRemoteAlertSceneHostComponent_setDefaultStatusBarHeightsForWindowScene___block_invoke;
    v11[3] = &unk_1E5CCEB98;
    id v12 = v8;
    id v10 = v8;
    [v9 configureParameters:v11];
  }
}

void __79__SBSUIRemoteAlertSceneHostComponent_setDefaultStatusBarHeightsForWindowScene___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__SBSUIRemoteAlertSceneHostComponent_setDefaultStatusBarHeightsForWindowScene___block_invoke_2;
  v3[3] = &unk_1E5CCD560;
  id v4 = *(id *)(a1 + 32);
  [a2 updateSettingsWithBlock:v3];
}

void __79__SBSUIRemoteAlertSceneHostComponent_setDefaultStatusBarHeightsForWindowScene___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 heightForOrientation:1];
  objc_msgSend(v4, "setDefaultStatusBarHeight:forOrientation:", 1);
  [*(id *)(a1 + 32) heightForOrientation:2];
  objc_msgSend(v4, "setDefaultStatusBarHeight:forOrientation:", 2);
  [*(id *)(a1 + 32) heightForOrientation:4];
  objc_msgSend(v4, "setDefaultStatusBarHeight:forOrientation:", 4);
  [*(id *)(a1 + 32) heightForOrientation:3];
  objc_msgSend(v4, "setDefaultStatusBarHeight:forOrientation:", 3);
}

- (void)_performSafeSettingsUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSceneComponent *)self hostScene];
  int v6 = [v5 isActive];

  id v7 = [(FBSSceneComponent *)self hostScene];
  if (v6)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__SBSUIRemoteAlertSceneHostComponent__performSafeSettingsUpdate___block_invoke;
    v13[3] = &unk_1E5CCEBE8;
    id v8 = &v14;
    id v14 = v4;
    id v9 = v4;
    [v7 performUpdate:v13];
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__SBSUIRemoteAlertSceneHostComponent__performSafeSettingsUpdate___block_invoke_2;
    v11[3] = &unk_1E5CCEC10;
    id v8 = &v12;
    id v12 = v4;
    id v10 = v4;
    [v7 configureParameters:v11];
  }
}

uint64_t __65__SBSUIRemoteAlertSceneHostComponent__performSafeSettingsUpdate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__SBSUIRemoteAlertSceneHostComponent__performSafeSettingsUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateSettingsWithBlock:*(void *)(a1 + 32)];
}

- (void)_performSafeTransition:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSceneComponent *)self hostScene];
  int v6 = [v5 isActive];

  if (v6)
  {
    id v7 = [(FBSSceneComponent *)self hostScene];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__SBSUIRemoteAlertSceneHostComponent__performSafeTransition___block_invoke;
    v12[3] = &unk_1E5CCEBE8;
    id v13 = v4;
    [v7 performUpdate:v12];
  }
  else
  {
    pendingTransitioners = self->_pendingTransitioners;
    if (!pendingTransitioners)
    {
      id v9 = [MEMORY[0x1E4F1CA48] array];
      id v10 = self->_pendingTransitioners;
      self->_pendingTransitioners = v9;

      pendingTransitioners = self->_pendingTransitioners;
    }
    v11 = (void *)MEMORY[0x1AD0CF1C0](v4);
    [(NSMutableArray *)pendingTransitioners addObject:v11];
  }
}

uint64_t __61__SBSUIRemoteAlertSceneHostComponent__performSafeTransition___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSceneComponent *)self hostScene];
  int v6 = [v5 isActive];

  if (v6)
  {
    id v7 = [(FBSSceneComponent *)self hostScene];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__SBSUIRemoteAlertSceneHostComponent_handleButtonActions___block_invoke;
    v8[3] = &unk_1E5CCD818;
    id v9 = v4;
    [v7 performUpdate:v8];
  }
}

uint64_t __58__SBSUIRemoteAlertSceneHostComponent_handleButtonActions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setButtonActions:*(void *)(a1 + 32)];
}

- (void)didInvalidateForRemoteAlertServiceInvalidation
{
  v3 = [(FBSSceneComponent *)self hostScene];
  int v4 = [v3 isActive];

  if (v4)
  {
    id v5 = [(FBSSceneComponent *)self hostScene];
    [v5 performUpdate:&__block_literal_global_41];
  }
}

uint64_t __84__SBSUIRemoteAlertSceneHostComponent_didInvalidateForRemoteAlertServiceInvalidation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setInvalidatedForHostInvalidation:1];
}

- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __118__SBSUIRemoteAlertSceneHostComponent_didTransitionToAttachedToWindowedAccessory_windowedAccessoryCutoutFrameInScreen___block_invoke;
  v4[3] = &__block_descriptor_65_e33_v16__0__FBSMutableSceneSettings_8l;
  BOOL v6 = a3;
  CGRect v5 = a4;
  [(SBSUIRemoteAlertSceneHostComponent *)self _performSafeSettingsUpdate:v4];
}

void __118__SBSUIRemoteAlertSceneHostComponent_didTransitionToAttachedToWindowedAccessory_windowedAccessoryCutoutFrameInScreen___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  id v4 = a2;
  [v4 setAttachedToWindowedAccessory:v3];
  objc_msgSend(v4, "setWindowedAccessoryCutoutFrameInScreen:", *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (BOOL)isAttachedToWindowedAccessory
{
  v2 = [(FBSSceneComponent *)self hostScene];
  uint64_t v3 = [v2 settings];
  char v4 = [v3 isAttachedToWindowedAccessory];

  return v4;
}

- (CGRect)windowedAccessoryCutoutFrameInScreen
{
  v2 = [(FBSSceneComponent *)self hostScene];
  uint64_t v3 = [v2 settings];
  [v3 windowedAccessoryCutoutFrameInScreen];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)allowsAlertStacking
{
  v2 = [(FBSSceneComponent *)self hostScene];
  uint64_t v3 = [v2 clientSettings];
  char v4 = [v3 allowsAlertStacking];

  return v4;
}

- (BOOL)isContentOpaque
{
  v2 = [(FBSSceneComponent *)self hostScene];
  uint64_t v3 = [v2 clientSettings];
  char v4 = [v3 isContentOpaque];

  return v4;
}

- (int64_t)dismissalAnimationStyle
{
  v2 = [(FBSSceneComponent *)self hostScene];
  uint64_t v3 = [v2 clientSettings];
  int64_t v4 = [v3 dismissalAnimationStyle];

  return v4;
}

- (int64_t)swipeDismissalStyle
{
  v2 = [(FBSSceneComponent *)self hostScene];
  uint64_t v3 = [v2 clientSettings];
  int64_t v4 = [v3 swipeDismissalStyle];

  return v4;
}

- (int64_t)preferredStatusBarStyle
{
  v2 = [(FBSSceneComponent *)self hostScene];
  uint64_t v3 = [v2 clientSettings];

  int64_t v4 = [v3 statusBarStyle];
  return v4;
}

- (int)preferredStatusBarVisibility
{
  v2 = [(FBSSceneComponent *)self hostScene];
  uint64_t v3 = [v2 clientSettings];

  if ([v3 statusBarHidden] & 1) != 0 || (objc_msgSend(v3, "defaultStatusBarHidden"))
  {
    int v4 = 1;
  }
  else if ([v3 contentOverlaysStatusBar])
  {
    int v4 = 0;
  }
  else
  {
    int v4 = 2;
  }

  return v4;
}

- (NSSet)backgroundActivitiesToSuppress
{
  v2 = [(FBSSceneComponent *)self hostScene];
  uint64_t v3 = [v2 clientSettings];
  int v4 = [v3 backgroundActivitiesToSuppress];

  return (NSSet *)v4;
}

- (double)desiredAutoLockDuration
{
  v2 = [(FBSSceneComponent *)self hostScene];
  uint64_t v3 = [v2 clientSettings];
  [v3 desiredAutoLockDuration];
  double v5 = v4;

  return v5;
}

- (SBUIRemoteAlertIdleTimerSettings)desiredIdleTimerSettings
{
  v2 = [(FBSSceneComponent *)self hostScene];
  uint64_t v3 = [v2 clientSettings];
  double v4 = [v3 desiredIdleTimerSettings];

  return (SBUIRemoteAlertIdleTimerSettings *)v4;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(FBSSceneComponent *)self hostScene];
  uint64_t v3 = [v2 clientSettings];
  unint64_t v4 = [v3 supportedInterfaceOrientations];

  return v4;
}

- (BOOL)shouldDisableOrientationUpdates
{
  v2 = [(FBSSceneComponent *)self hostScene];
  uint64_t v3 = [v2 clientSettings];
  char v4 = [v3 orientationChangedEventsDisabled];

  return v4;
}

- (int64_t)whitePointAdaptivityStyle
{
  v2 = [(FBSSceneComponent *)self hostScene];
  uint64_t v3 = [v2 clientSettings];
  int64_t v4 = [v3 whitePointAdaptivityStyle];

  return v4;
}

- (NSNumber)preferredSceneDeactivationReason
{
  v2 = [(FBSSceneComponent *)self hostScene];
  uint64_t v3 = [v2 clientSettings];
  int64_t v4 = [v3 preferredSceneDeactivationReason];

  return (NSNumber *)v4;
}

- (BOOL)hidEventDeferringDisabled
{
  v2 = [(FBSSceneComponent *)self hostScene];
  uint64_t v3 = [v2 clientSettings];
  char v4 = [v3 hidEventDeferringDisabled];

  return v4;
}

- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4
{
  objc_msgSend(a4, "transitionContext", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(SBSUIRemoteAlertSceneHostComponent *)self _flushPendingTransitionersWithContext:v5];
}

- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5
{
}

- (void)scene:(id)a3 willUpdateSettings:(id)a4
{
  objc_msgSend(a4, "transitionContext", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(SBSUIRemoteAlertSceneHostComponent *)self _flushPendingTransitionersWithContext:v5];
}

- (void)_flushPendingTransitionersWithContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableArray *)self->_pendingTransitioners count])
  {
    id v5 = (void *)[(NSMutableArray *)self->_pendingTransitioners copy];
    pendingTransitioners = self->_pendingTransitioners;
    self->_pendingTransitioners = 0;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([v13 wantsInvalidation])
  {
    [WeakRetained remoteAlertSceneHostComponentDidInvalidate:self];
  }
  else
  {
    if ([v13 wantsDeactivation]) {
      [WeakRetained remoteAlertSceneHostComponentDidDeactivate:self];
    }
    if ([v11 containsProperty:sel_allowsAlertStacking]) {
      [WeakRetained remoteAlertSceneHostComponentDidChangeAllowsAlertStacking:self];
    }
    if ([v11 containsProperty:sel_isContentOpaque]) {
      [WeakRetained remoteAlertSceneHostComponentDidChangeContentOpaque:self];
    }
    if ([v11 containsProperty:sel_dismissalAnimationStyle]) {
      [WeakRetained remoteAlertSceneHostComponentDidChangeDismissalAnimationStyle:self];
    }
    if ([v11 containsProperty:sel_swipeDismissalStyle]) {
      [WeakRetained remoteAlertSceneHostComponentDidChangeSwipeDismissalStyle:self];
    }
    if ([v11 containsProperty:sel_backgroundActivitiesToSuppress])
    {
      long long v15 = [v13 animationSettings];
      [WeakRetained remoteAlertSceneHostComponent:self didChangeBackgroundActivitiesToSuppressWithAnimationSettings:v15];
    }
    v16 = [v13 wantsIdleTimerDisabledReason];
    if (v16) {
      objc_msgSend(WeakRetained, "remoteAlertSceneHostComponent:didSetIdleTimerDisabled:forReason:", self, objc_msgSend(v13, "wantsIdleTimerDisabled"), v16);
    }
    if ([v11 containsProperty:sel_desiredAutoLockDuration]) {
      [WeakRetained remoteAlertSceneHostComponentDidChangeDesiredAutoLockDuration:self];
    }
    if ([v11 containsProperty:sel_desiredIdleTimerSettings]) {
      [WeakRetained remoteAlertSceneHostComponentDidChangeDesiredIdleTimerSettings:self];
    }
    if ([v11 containsProperty:sel_orientationChangedEventsDisabled]) {
      [WeakRetained remoteAlertSceneHostComponentDidChangeShouldDisableOrientationUpdates:self];
    }
    uint64_t v17 = [v10 clientSettings];
    uint64_t v18 = objc_opt_class();
    id v19 = v17;
    if (v18)
    {
      if (objc_opt_isKindOfClass()) {
        v20 = v19;
      }
      else {
        v20 = 0;
      }
    }
    else
    {
      v20 = 0;
    }
    id v21 = v20;

    if (v21)
    {
      id v22 = v12;
      uint64_t v23 = [v21 supportedInterfaceOrientations];
      if (v23 != [v22 supportedInterfaceOrientations]) {
        [WeakRetained remoteAlertSceneHostComponentDidChangeSupportedInterfaceOrientations:self];
      }
      uint64_t v24 = [v21 whitePointAdaptivityStyle];
      if (v24 != [v22 whitePointAdaptivityStyle]) {
        [WeakRetained remoteAlertSceneHostComponentDidChangeWhitePointAdaptivityStyle:self];
      }
      int v25 = [v21 statusBarHidden];
      if (v25 != [v22 statusBarHidden]
        || (uint64_t v26 = [v21 statusBarStyle], v26 != objc_msgSend(v22, "statusBarStyle"))
        || (int v27 = [v21 contentOverlaysStatusBar],
            v27 != [v22 contentOverlaysStatusBar]))
      {
        v28 = [v13 animationSettings];
        [WeakRetained remoteAlertSceneHostComponent:self didChangePreferredStatusBarVisibilityWithAnimationSettings:v28];
      }
      uint64_t v29 = [v21 backgroundStyle];
      if (v29 != [v22 backgroundStyle])
      {
        v30 = [v13 animationSettings];
        [WeakRetained remoteAlertSceneHostComponent:self didChangeWallpaperStyleWithAnimationSettings:v30];
      }
    }
    if ([v11 containsProperty:sel_preferredSceneDeactivationReason]) {
      [WeakRetained remoteAlertSceneHostComponentDidChangePreferredSceneDeactivationReason:self];
    }
    if ([v11 containsProperty:sel_hidEventDeferringDisabled])
    {
      v31 = SBLogTransientOverlay();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v32 = [(SBSUIRemoteAlertSceneHostComponent *)self hidEventDeferringDisabled];
        [v10 identityToken];
        v36 = v16;
        id v33 = v10;
        v35 = id v34 = v12;
        *(_DWORD *)buf = 67109378;
        BOOL v38 = v32;
        __int16 v39 = 2114;
        v40 = v35;
        _os_log_impl(&dword_1A7607000, v31, OS_LOG_TYPE_DEFAULT, "received new clientSetting for hidEventDeferringDisabled: %d for remote alert scene %{public}@", buf, 0x12u);

        id v12 = v34;
        id v10 = v33;
        v16 = v36;
      }

      [WeakRetained remoteAlertSceneHostComponentDidChangeHIDEventDeferringDisabled:self];
    }
  }
}

- (SBSUIRemoteAlertSceneHostComponentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSUIRemoteAlertSceneHostComponentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)configurationIdentifier
{
  return self->_configurationIdentifier;
}

- (SBSRemoteAlertConfigurationContext)configurationContext
{
  return self->_configurationContext;
}

- (SBSRemoteAlertActivationContext)activationContext
{
  return self->_activationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationContext, 0);
  objc_storeStrong((id *)&self->_configurationContext, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingTransitioners, 0);
}

@end