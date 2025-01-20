@interface SBSUIInCallWindowScene
- (BOOL)isAmbientPresented;
- (BOOL)isBeingShownAboveCoverSheet;
- (BOOL)isCallConnected;
- (BOOL)isDeviceAttachedToWindowedAccessory;
- (BOOL)isIdleTimerDisabled;
- (BOOL)isScreenSharingPresentation;
- (BOOL)prefersBannersHiddenFromClonedDisplay;
- (BOOL)prefersHiddenWhenDismissed;
- (BOOL)prefersLockedIdleDurationOnCoversheet;
- (BOOL)shouldBecomeVisibleWhenWakingDisplay;
- (BOOL)shouldNeverBeShownWhenLaunchingFaceTime;
- (BOOL)supportsDeviceLockEvents;
- (BOOL)systemControlsShouldPresentAsEmbedded;
- (CGRect)windowedAccessoryCutoutFrameInScreen;
- (NSSet)preferredBackgroundActivitiesToSuppress;
- (NSUUID)requestedPresentationConfigurationIdentifier;
- (SBSUIInCallWindowScene)initWithSession:(id)a3 connectionOptions:(id)a4;
- (SBUISystemApertureElement)associatedSystemApertureElement;
- (UIEdgeInsets)expanseHUDDodgingInsets;
- (id)systemApertureElementViewControllerProvider;
- (int64_t)presentationMode;
- (unint64_t)preferredHardwareButtonEventTypes;
- (unint64_t)preferredStatusBarStyleOverridesToSuppress;
- (void)_associateWithSourceIfNeeded:(id)a3;
- (void)_handleDeviceLockAction:(id)a3;
- (void)_handleFrameChanged;
- (void)_handleHardwareButtonEventSceneActions:(id)a3;
- (void)_handleSourceDidConnect:(id)a3;
- (void)_invalidate;
- (void)_setAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4;
- (void)_startObservingSystemApertureSourceConnectNotifications;
- (void)_updatePresentationMode:(int64_t)a3 analyticsSource:(id)a4;
- (void)_updateValidationStateIfNeededForPresentationMode:(int64_t)a3;
- (void)requestTransitionToPresentationMode:(int64_t)a3;
- (void)requestTransitionToPresentationMode:(int64_t)a3 isUserInitiated:(BOOL)a4;
- (void)requestTransitionToPresentationMode:(int64_t)a3 isUserInitiated:(BOOL)a4 analyticsSource:(id)a5;
- (void)setCallConnected:(BOOL)a3;
- (void)setExpanseHUDDodgingInsets:(UIEdgeInsets)a3;
- (void)setIdleTimerDisabled:(BOOL)a3;
- (void)setPreferredBackgroundActivitiesToSuppress:(id)a3;
- (void)setPreferredHardwareButtonEventTypes:(unint64_t)a3;
- (void)setPreferredStatusBarStyleOverridesToSuppress:(unint64_t)a3;
- (void)setPrefersBannersHiddenFromClonedDisplay:(BOOL)a3;
- (void)setPrefersHiddenWhenDismissed:(BOOL)a3;
- (void)setPrefersLockedIdleDurationOnCoversheet:(BOOL)a3;
- (void)setShouldBecomeVisibleWhenWakingDisplay:(BOOL)a3;
- (void)setShouldNeverBeShownWhenLaunchingFaceTime:(BOOL)a3;
- (void)setSupportsDeviceLockEvents:(BOOL)a3;
@end

@implementation SBSUIInCallWindowScene

- (SBSUIInCallWindowScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)SBSUIInCallWindowScene;
  v4 = [(SBSUIInCallWindowScene *)&v13 initWithSession:a3 connectionOptions:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SBSUIInCallWindowScene *)v4 _FBSScene];
    v7 = [v6 settings];
    v5->_presentationMode = [v7 inCallPresentationMode];
    v5->_deviceAttachedToWindowedAccessory = [v7 isAttachedToWindowedAccessory];
    [v7 windowedAccessoryCutoutFrameInScreen];
    v5->_windowedAccessoryCutoutFrameInScreen.origin.x = v8;
    v5->_windowedAccessoryCutoutFrameInScreen.origin.y = v9;
    v5->_windowedAccessoryCutoutFrameInScreen.size.width = v10;
    v5->_windowedAccessoryCutoutFrameInScreen.size.height = v11;
    [(SBSUIInCallWindowScene *)v5 _updateValidationStateIfNeededForPresentationMode:v5->_presentationMode];
    if (![(SBSUIInCallWindowScene *)v5 isScreenSharingPresentation]) {
      [(SBSUIInCallWindowScene *)v5 _startObservingSystemApertureSourceConnectNotifications];
    }
  }
  return v5;
}

- (void)_invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)SBSUIInCallWindowScene;
  [(SBSUIInCallWindowScene *)&v2 _invalidate];
  BSDispatchMain();
}

uint64_t __37__SBSUIInCallWindowScene__invalidate__block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 488)) {
    return objc_msgSend(MEMORY[0x1E4FA6B00], "notePresentationEndForRequestWithIdentifier:");
  }
  return result;
}

- (void)setPreferredHardwareButtonEventTypes:(unint64_t)a3
{
  if (self->_preferredHardwareButtonEventTypes != a3)
  {
    self->_preferredHardwareButtonEventTypes = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __63__SBSUIInCallWindowScene_setPreferredHardwareButtonEventTypes___block_invoke;
    v3[3] = &__block_descriptor_40_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    v3[4] = a3;
    [(SBSUIInCallWindowScene *)self _updateUIClientSettingsWithBlock:v3];
  }
}

uint64_t __63__SBSUIInCallWindowScene_setPreferredHardwareButtonEventTypes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPreferredHardwareButtonEventTypes:*(void *)(a1 + 32)];
}

- (void)setPreferredBackgroundActivitiesToSuppress:(id)a3
{
  v4 = (NSSet *)a3;
  v5 = v4;
  if (self->_preferredBackgroundActivitiesToSuppress != v4)
  {
    v6 = (NSSet *)[(NSSet *)v4 copy];
    preferredBackgroundActivitiesToSuppress = self->_preferredBackgroundActivitiesToSuppress;
    self->_preferredBackgroundActivitiesToSuppress = v6;

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__SBSUIInCallWindowScene_setPreferredBackgroundActivitiesToSuppress___block_invoke;
    v8[3] = &unk_1E5CCD1F0;
    CGFloat v9 = v5;
    [(SBSUIInCallWindowScene *)self _updateUIClientSettingsWithBlock:v8];
  }
}

uint64_t __69__SBSUIInCallWindowScene_setPreferredBackgroundActivitiesToSuppress___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPreferredBackgroundActivitiesToSuppress:*(void *)(a1 + 32)];
}

- (unint64_t)preferredStatusBarStyleOverridesToSuppress
{
  objc_super v2 = [(SBSUIInCallWindowScene *)self preferredBackgroundActivitiesToSuppress];
  unint64_t v3 = soft_STUIStyleOverridesForBackgroundActivityIdentifiers((uint64_t)v2);

  return v3;
}

- (void)setPreferredStatusBarStyleOverridesToSuppress:(unint64_t)a3
{
  soft_STUIBackgroundActivityIdentifiersForStyleOverrides(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(SBSUIInCallWindowScene *)self setPreferredBackgroundActivitiesToSuppress:v4];
}

- (void)setShouldBecomeVisibleWhenWakingDisplay:(BOOL)a3
{
  if (self->_shouldBecomeVisibleWhenWakingDisplay != a3)
  {
    self->_shouldBecomeVisibleWhenWakingDisplay = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __66__SBSUIInCallWindowScene_setShouldBecomeVisibleWhenWakingDisplay___block_invoke;
    v3[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    BOOL v4 = a3;
    [(SBSUIInCallWindowScene *)self _updateUIClientSettingsWithBlock:v3];
  }
}

uint64_t __66__SBSUIInCallWindowScene_setShouldBecomeVisibleWhenWakingDisplay___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShouldBecomeVisibleWhenWakingDisplay:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setSupportsDeviceLockEvents:(BOOL)a3
{
  if (self->_supportsDeviceLockEvents != a3)
  {
    self->_supportsDeviceLockEvents = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __54__SBSUIInCallWindowScene_setSupportsDeviceLockEvents___block_invoke;
    v3[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    BOOL v4 = a3;
    [(SBSUIInCallWindowScene *)self _updateUIClientSettingsWithBlock:v3];
  }
}

uint64_t __54__SBSUIInCallWindowScene_setSupportsDeviceLockEvents___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSupportsDeviceLockActions:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  if (self->_idleTimerDisabled != a3)
  {
    BOOL v3 = a3;
    self->_idleTimerDisabled = a3;
    v5 = NSString;
    v6 = [(SBSUIInCallWindowScene *)self session];
    v7 = [v6 persistentIdentifier];
    CGFloat v8 = [v5 stringWithFormat:@"SBSUIInCallWindowSceneIdleTimerDisabledReason %@", v7];

    CGFloat v9 = [MEMORY[0x1E4F42738] sharedApplication];
    [v9 _setIdleTimerDisabled:v3 forReason:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__SBSUIInCallWindowScene_setIdleTimerDisabled___block_invoke;
    v10[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    BOOL v11 = v3;
    [(SBSUIInCallWindowScene *)self _updateUIClientSettingsWithBlock:v10];
  }
}

uint64_t __47__SBSUIInCallWindowScene_setIdleTimerDisabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIdleTimerDisabled:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setPrefersLockedIdleDurationOnCoversheet:(BOOL)a3
{
  if (self->_prefersLockedIdleDurationOnCoversheet != a3)
  {
    self->_prefersLockedIdleDurationOnCoversheet = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __67__SBSUIInCallWindowScene_setPrefersLockedIdleDurationOnCoversheet___block_invoke;
    v3[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    BOOL v4 = a3;
    [(SBSUIInCallWindowScene *)self _updateUIClientSettingsWithBlock:v3];
  }
}

uint64_t __67__SBSUIInCallWindowScene_setPrefersLockedIdleDurationOnCoversheet___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPrefersLockedIdleDurationOnCoversheet:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setCallConnected:(BOOL)a3
{
  if (self->_callConnected != a3)
  {
    self->_callConnected = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __43__SBSUIInCallWindowScene_setCallConnected___block_invoke;
    v3[3] = &unk_1E5CCD1F0;
    void v3[4] = self;
    [(SBSUIInCallWindowScene *)self _updateUIClientSettingsWithBlock:v3];
  }
}

uint64_t __43__SBSUIInCallWindowScene_setCallConnected___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCallConnected:*(unsigned __int8 *)(*(void *)(a1 + 32) + 509)];
}

- (void)setExpanseHUDDodgingInsets:(UIEdgeInsets)a3
{
  if (self->_expanseHUDDodgingInsets.left != a3.left
    || self->_expanseHUDDodgingInsets.top != a3.top
    || self->_expanseHUDDodgingInsets.right != a3.right
    || self->_expanseHUDDodgingInsets.bottom != a3.bottom)
  {
    self->_expanseHUDDodgingInsets = a3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__SBSUIInCallWindowScene_setExpanseHUDDodgingInsets___block_invoke;
    v6[3] = &__block_descriptor_64_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    UIEdgeInsets v7 = a3;
    [(SBSUIInCallWindowScene *)self _updateUIClientSettingsWithBlock:v6];
  }
}

uint64_t __53__SBSUIInCallWindowScene_setExpanseHUDDodgingInsets___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setExpanseHUDDodgingInsets:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)setPrefersHiddenWhenDismissed:(BOOL)a3
{
  if (self->_prefersHiddenWhenDismissed != a3)
  {
    self->_prefersHiddenWhenDismissed = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __56__SBSUIInCallWindowScene_setPrefersHiddenWhenDismissed___block_invoke;
    v3[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    BOOL v4 = a3;
    [(SBSUIInCallWindowScene *)self _updateUIClientSettingsWithBlock:v3];
  }
}

uint64_t __56__SBSUIInCallWindowScene_setPrefersHiddenWhenDismissed___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPrefersHiddenWhenDismissed:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setShouldNeverBeShownWhenLaunchingFaceTime:(BOOL)a3
{
  if (self->_shouldNeverBeShownWhenLaunchingFaceTime != a3)
  {
    self->_shouldNeverBeShownWhenLaunchingFaceTime = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __69__SBSUIInCallWindowScene_setShouldNeverBeShownWhenLaunchingFaceTime___block_invoke;
    v3[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    BOOL v4 = a3;
    [(SBSUIInCallWindowScene *)self _updateUIClientSettingsWithBlock:v3];
  }
}

uint64_t __69__SBSUIInCallWindowScene_setShouldNeverBeShownWhenLaunchingFaceTime___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShouldNeverBeShownWhenLaunchingFaceTime:*(unsigned __int8 *)(a1 + 32)];
}

- (void)requestTransitionToPresentationMode:(int64_t)a3
{
}

- (void)requestTransitionToPresentationMode:(int64_t)a3 isUserInitiated:(BOOL)a4
{
}

- (void)requestTransitionToPresentationMode:(int64_t)a3 isUserInitiated:(BOOL)a4 analyticsSource:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  BOOL v11 = [[SBSUIInCallRequestPresentationModeAction alloc] initWithRequestedPresentationMode:a3 isUserInitiated:v5 analyticsSource:v8 responseHandler:&__block_literal_global_10];

  CGFloat v9 = [(SBSUIInCallWindowScene *)self _FBSScene];
  CGFloat v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
  [v9 sendActions:v10];
}

- (void)setPrefersBannersHiddenFromClonedDisplay:(BOOL)a3
{
  self->_prefersBannersHiddenFromClonedDisplay = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__SBSUIInCallWindowScene_setPrefersBannersHiddenFromClonedDisplay___block_invoke;
  v3[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  BOOL v4 = a3;
  [(SBSUIInCallWindowScene *)self _updateUIClientSettingsWithBlock:v3];
}

uint64_t __67__SBSUIInCallWindowScene_setPrefersBannersHiddenFromClonedDisplay___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPrefersBannersHiddenFromClonedDisplay:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)systemControlsShouldPresentAsEmbedded
{
  objc_super v2 = [(SBSUIInCallWindowScene *)self _FBSScene];
  BOOL v3 = [v2 settings];
  char v4 = [v3 systemControlsShouldPresentAsEmbedded];

  return v4;
}

- (BOOL)isBeingShownAboveCoverSheet
{
  objc_super v2 = [(SBSUIInCallWindowScene *)self _FBSScene];
  BOOL v3 = [v2 settings];
  char v4 = [v3 isBeingShownAboveCoverSheet];

  return v4;
}

- (NSUUID)requestedPresentationConfigurationIdentifier
{
  p_requestedPresentationConfigurationIdentifier = &self->_requestedPresentationConfigurationIdentifier;
  requestedPresentationConfigurationIdentifier = self->_requestedPresentationConfigurationIdentifier;
  if (!requestedPresentationConfigurationIdentifier)
  {
    char v4 = [(SBSUIInCallWindowScene *)self _FBSScene];
    BOOL v5 = [v4 settings];
    v6 = [v5 requestedPresentationConfigurationIdentifier];
    if (v6)
    {
      UIEdgeInsets v7 = [MEMORY[0x1E4FA6B00] identifiersForRequestedPresentations];
      int v8 = [v7 containsObject:v6];

      if (v8) {
        objc_storeStrong((id *)p_requestedPresentationConfigurationIdentifier, v6);
      }
    }

    requestedPresentationConfigurationIdentifier = *p_requestedPresentationConfigurationIdentifier;
  }
  return requestedPresentationConfigurationIdentifier;
}

- (BOOL)isScreenSharingPresentation
{
  objc_super v2 = [(SBSUIInCallWindowScene *)self _FBSScene];
  BOOL v3 = [v2 settings];
  char v4 = [v3 isScreenSharingPresentation];

  return v4;
}

- (BOOL)isAmbientPresented
{
  objc_super v2 = [(SBSUIInCallWindowScene *)self _FBSScene];
  BOOL v3 = [v2 settings];
  uint64_t v9 = 0;
  CGFloat v10 = &v9;
  uint64_t v11 = 0x2050000000;
  char v4 = (void *)getAMUIAmbientPresentationSettingsExtensionClass_softClass;
  uint64_t v12 = getAMUIAmbientPresentationSettingsExtensionClass_softClass;
  if (!getAMUIAmbientPresentationSettingsExtensionClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getAMUIAmbientPresentationSettingsExtensionClass_block_invoke;
    v8[3] = &unk_1E5CCC5D0;
    void v8[4] = &v9;
    __getAMUIAmbientPresentationSettingsExtensionClass_block_invoke((uint64_t)v8);
    char v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  if ([v3 conformsToExtension:objc_opt_class()]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v6 = [v3 isAmbientPresented];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (SBUISystemApertureElement)associatedSystemApertureElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedSource);
  BOOL v3 = [WeakRetained systemApertureElement];

  return (SBUISystemApertureElement *)v3;
}

- (void)_startObservingSystemApertureSourceConnectNotifications
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleSourceDidConnect_ name:@"SBUISystemApertureElementSourceDidConnectNotification" object:0];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  char v4 = +[SBUISystemApertureElementSource openSources];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(v4);
      }
      [(SBSUIInCallWindowScene *)self _associateWithSourceIfNeeded:*(void *)(*((void *)&v10 + 1) + 8 * v8)];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedSource);

      if (WeakRetained) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_handleSourceDidConnect:(id)a3
{
  char v4 = [a3 object];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  [(SBSUIInCallWindowScene *)self _associateWithSourceIfNeeded:v8];
}

- (void)_associateWithSourceIfNeeded:(id)a3
{
  id obj = a3;
  char v4 = [(SBSUIInCallWindowScene *)self session];
  uint64_t v5 = [v4 persistentIdentifier];

  if (obj)
  {
    id v6 = [obj systemApertureElement];
    if (!v6)
    {
      uint64_t v7 = [obj associatedScenePersistenceIdentifier];
      int v8 = [v7 isEqualToString:v5];

      if (!v8) {
        goto LABEL_11;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedSource);

      if (!WeakRetained)
      {
        objc_storeWeak((id *)&self->_associatedSource, obj);
        long long v10 = [(SBSUIInCallWindowScene *)self delegate];
        if (objc_opt_respondsToSelector())
        {
          long long v11 = [v10 inCallWindowSceneSystemApertureElementProvider:self];
        }
        else
        {
          long long v11 = 0;
        }
        [obj setSystemApertureElementViewControllerProvider:v11];
      }
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 removeObserver:self name:@"SBUISystemApertureElementSourceDidConnectNotification" object:0];
    }
  }
LABEL_11:
}

- (id)systemApertureElementViewControllerProvider
{
  BOOL v3 = [(SBSUIInCallWindowScene *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [v3 inCallWindowSceneSystemApertureElementProvider:self];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)_handleDeviceLockAction:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBSUIInCallWindowScene *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = SBLogInCallPresentation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(SBSUIInCallWindowScene *)self session];
      int v8 = [v7 persistentIdentifier];
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_DEFAULT, "Handling handleDeviceLockAction for session %{public}@", buf, 0xCu);
    }
    uint64_t v9 = -[SBSUIInCallWindowSceneDeviceLockEvent initWithSourceType:]([SBSUIInCallWindowSceneDeviceLockEvent alloc], "initWithSourceType:", [v4 sourceType]);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__SBSUIInCallWindowScene__handleDeviceLockAction___block_invoke;
    v13[3] = &unk_1E5CCD258;
    v13[4] = self;
    id v14 = v4;
    [v5 inCallWindowScene:self didReceiveDeviceLockEvent:v9 withResultHandler:v13];
  }
  else
  {
    uint64_t v9 = [[SBSUIHandleDeviceLockSceneActionResponse alloc] initWithDeviceLockHandlingResult:0 error:0];
    [v4 sendResponse:v9];
    long long v10 = SBLogInCallPresentation();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = [(SBSUIInCallWindowScene *)self session];
      long long v12 = [v11 persistentIdentifier];
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_1A7607000, v10, OS_LOG_TYPE_DEFAULT, "Declined handleDeviceLockAction because didReceiveDeviceLockEvent is not implemented %{public}@", buf, 0xCu);
    }
  }
}

void __50__SBSUIInCallWindowScene__handleDeviceLockAction___block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = [[SBSUIHandleDeviceLockSceneActionResponse alloc] initWithDeviceLockHandlingResult:a2 error:0];
  uint64_t v5 = SBLogInCallPresentation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) session];
    uint64_t v7 = [v6 persistentIdentifier];
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2114;
    long long v10 = v7;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "Send deviceLockAction response (didConsume: %{BOOL}u) for session %{public}@", (uint8_t *)v8, 0x12u);
  }
  [*(id *)(a1 + 40) sendResponse:v4];
}

- (void)_handleHardwareButtonEventSceneActions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v15 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          long long v12 = -[SBSUIInCallWindowSceneHardwareButtonEvent initWithButtonEventType:]([SBSUIInCallWindowSceneHardwareButtonEvent alloc], "initWithButtonEventType:", [v11 buttonEventType]);
          [v5 addObject:v12];
          long long v13 = [[SBSUIHardwareButtonEventSceneActionResponse alloc] initWithButtonEventHandlingResult:0 error:0];
          [v11 sendResponse:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    id v14 = [(SBSUIInCallWindowScene *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v14 inCallWindowScene:self didReceiveHardwareButtonEvents:v5];
    }

    id v4 = v15;
  }
}

- (void)_updatePresentationMode:(int64_t)a3 analyticsSource:(id)a4
{
  id v7 = a4;
  [(SBSUIInCallWindowScene *)self _updateValidationStateIfNeededForPresentationMode:a3];
  if (self->_presentationMode != a3)
  {
    self->_presentationMode = a3;
    if (self->_validationState == 1)
    {
      id v6 = [(SBSUIInCallWindowScene *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v6 inCallWindowSceneDidChangePresentationMode:self];
      }
      if (objc_opt_respondsToSelector()) {
        [v6 inCallWindowScene:self didChangePresentationModeWithAnalyticsSource:v7];
      }
    }
  }
}

- (void)_handleFrameChanged
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F42FF0] _isInAnimationBlockWithAnimationsEnabled])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    BOOL v3 = [(SBSUIInCallWindowScene *)self _allWindows];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          [v8 setNeedsLayout];
          [v8 layoutIfNeeded];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (void)_setAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v8 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v10 = SBLogInCallPresentation();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(double *)long long v13 = x;
    *(double *)&v13[1] = y;
    *(double *)&v13[2] = width;
    *(double *)&v13[3] = height;
    long long v11 = [MEMORY[0x1E4F29238] valueWithBytes:v13 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    *(_DWORD *)buf = 67109378;
    BOOL v15 = v8;
    __int16 v16 = 2114;
    long long v17 = v11;
    _os_log_impl(&dword_1A7607000, v10, OS_LOG_TYPE_DEFAULT, "Updating scene settings to attachedToWindowedAccessory: %{BOOL}u windowedAccessoryCutoutFrameInScreen: %{public}@", buf, 0x12u);
  }
  if (self->_deviceAttachedToWindowedAccessory != v8
    || (v19.origin.double x = x,
        v19.origin.double y = y,
        v19.size.double width = width,
        v19.size.double height = height,
        !CGRectEqualToRect(self->_windowedAccessoryCutoutFrameInScreen, v19)))
  {
    self->_deviceAttachedToWindowedAccessordouble y = v8;
    self->_windowedAccessoryCutoutFrameInScreen.origin.double x = x;
    self->_windowedAccessoryCutoutFrameInScreen.origin.double y = y;
    self->_windowedAccessoryCutoutFrameInScreen.size.double width = width;
    self->_windowedAccessoryCutoutFrameInScreen.size.double height = height;
    long long v12 = [(SBSUIInCallWindowScene *)self delegate];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v12, "inCallWindowScene:didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", self, v8, x, y, width, height);
    }
  }
}

- (void)_updateValidationStateIfNeededForPresentationMode:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int64_t validationState = self->_validationState;
  if (!validationState)
  {
    uint64_t v6 = [(SBSUIInCallWindowScene *)self activationState];
    if (a3 || v6 != -1)
    {
      id v7 = [(SBSUIInCallWindowScene *)self _FBSScene];
      BOOL v8 = [v7 settings];
      long long v9 = [v8 requestedPresentationConfigurationIdentifier];
      long long v10 = [MEMORY[0x1E4FA6B00] identifiersForRequestedPresentations];
      int v11 = [v10 containsObject:v9];

      if (v11)
      {
        objc_storeStrong((id *)&self->_requestedPresentationConfigurationIdentifier, v9);
        self->_int64_t validationState = 1;
        long long v12 = SBLogInCallPresentation();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138543362;
          long long v17 = self;
          _os_log_impl(&dword_1A7607000, v12, OS_LOG_TYPE_DEFAULT, "Validated scene %{public}@", (uint8_t *)&v16, 0xCu);
        }
      }
      else
      {
        self->_int64_t validationState = 2;
        long long v12 = SBLogInCallPresentation();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          [(SBSUIInCallWindowScene *)(uint64_t)self _updateValidationStateIfNeededForPresentationMode:v12];
        }
      }
    }
    int64_t validationState = self->_validationState;
  }
  if (validationState == 2 && !self->_hasRequestedDestructionForInvalidState)
  {
    self->_hasRequestedDestructionForInvalidState = 1;
    long long v13 = objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication", a3);
    uint64_t v14 = SBLogInCallPresentation();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      long long v17 = self;
      _os_log_impl(&dword_1A7607000, v14, OS_LOG_TYPE_DEFAULT, "Requesting invalid scene destruction for %{public}@", (uint8_t *)&v16, 0xCu);
    }

    BOOL v15 = [(SBSUIInCallWindowScene *)self session];
    objc_msgSend(v13, "SBSUI_requestInCallSceneSessionDestruction:withReason:analyticsSource:completion:", v15, 3, @"SBSUIInCallTransitionAnalyticsSourceSceneValidation", &__block_literal_global_43);
  }
}

- (unint64_t)preferredHardwareButtonEventTypes
{
  return self->_preferredHardwareButtonEventTypes;
}

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  return self->_preferredBackgroundActivitiesToSuppress;
}

- (BOOL)supportsDeviceLockEvents
{
  return self->_supportsDeviceLockEvents;
}

- (BOOL)isIdleTimerDisabled
{
  return self->_idleTimerDisabled;
}

- (BOOL)prefersLockedIdleDurationOnCoversheet
{
  return self->_prefersLockedIdleDurationOnCoversheet;
}

- (BOOL)shouldBecomeVisibleWhenWakingDisplay
{
  return self->_shouldBecomeVisibleWhenWakingDisplay;
}

- (BOOL)isCallConnected
{
  return self->_callConnected;
}

- (UIEdgeInsets)expanseHUDDodgingInsets
{
  double top = self->_expanseHUDDodgingInsets.top;
  double left = self->_expanseHUDDodgingInsets.left;
  double bottom = self->_expanseHUDDodgingInsets.bottom;
  double right = self->_expanseHUDDodgingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)prefersHiddenWhenDismissed
{
  return self->_prefersHiddenWhenDismissed;
}

- (int64_t)presentationMode
{
  return self->_presentationMode;
}

- (BOOL)isDeviceAttachedToWindowedAccessory
{
  return self->_deviceAttachedToWindowedAccessory;
}

- (CGRect)windowedAccessoryCutoutFrameInScreen
{
  double x = self->_windowedAccessoryCutoutFrameInScreen.origin.x;
  double y = self->_windowedAccessoryCutoutFrameInScreen.origin.y;
  double width = self->_windowedAccessoryCutoutFrameInScreen.size.width;
  double height = self->_windowedAccessoryCutoutFrameInScreen.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)prefersBannersHiddenFromClonedDisplay
{
  return self->_prefersBannersHiddenFromClonedDisplay;
}

- (BOOL)shouldNeverBeShownWhenLaunchingFaceTime
{
  return self->_shouldNeverBeShownWhenLaunchingFaceTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredBackgroundActivitiesToSuppress, 0);
  objc_storeStrong((id *)&self->_requestedPresentationConfigurationIdentifier, 0);
  objc_destroyWeak((id *)&self->_associatedSource);
}

- (void)_updateValidationStateIfNeededForPresentationMode:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 requestedPresentationConfigurationIdentifier];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  long long v9 = v5;
  _os_log_error_impl(&dword_1A7607000, a3, OS_LOG_TYPE_ERROR, "[ICSZombie] Scene %{public}@ is an ICSZombie and should be ignored. requestedPresentationConfigurationIdentifier: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end