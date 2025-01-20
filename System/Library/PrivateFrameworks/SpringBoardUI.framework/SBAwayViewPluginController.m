@interface SBAwayViewPluginController
+ (void)disableBundleNamed:(id)a3;
+ (void)disableBundleNamed:(id)a3 deactivationContext:(id)a4;
+ (void)enableBundleNamed:(id)a3;
+ (void)enableBundleNamed:(id)a3 activationContext:(id)a4;
- (BOOL)allowsControlCenter;
- (BOOL)allowsLockScreenCamera;
- (BOOL)allowsLockScreenHint;
- (BOOL)allowsLockScreenMediaControls;
- (BOOL)allowsLogout;
- (BOOL)allowsPhotoSlideshow;
- (BOOL)allowsScreenshots;
- (BOOL)allowsSiri;
- (BOOL)allowsTimer;
- (BOOL)allowsUnlocking;
- (BOOL)animateResumingToApplicationWithIdentifier:(id)a3;
- (BOOL)disablesAwayItemsCompletely;
- (BOOL)handleHeadsetButtonPressed:(BOOL)a3;
- (BOOL)handleLockButtonPressed;
- (BOOL)handleMenuButtonDoubleTap;
- (BOOL)handleMenuButtonHeld;
- (BOOL)handleMenuButtonTap;
- (BOOL)handleVolumeDownButtonPressed;
- (BOOL)handleVolumeUpButtonPressed;
- (BOOL)hasCustomSubtitle;
- (BOOL)isContentViewWhiteUnderSlideToUnlockText;
- (BOOL)legibilitySettingsOverridesVibrancy;
- (BOOL)pluginAnimatesAppearanceTransition:(BOOL)a3;
- (BOOL)pluginHandleEvent:(int64_t)a3;
- (BOOL)shouldAutoHideNotifications;
- (BOOL)shouldDisableOnRelock;
- (BOOL)shouldDisableOnUnlock;
- (BOOL)shouldShowLockStatusBarTime;
- (BOOL)showBatteryChargingText;
- (BOOL)showDate;
- (BOOL)showDateView;
- (BOOL)showStatusBar;
- (BOOL)viewCanBeDisplayed;
- (BOOL)viewWantsOverlayLayout;
- (BOOL)wantsMenuButtonHeldEvent;
- (BOOL)wantsMesaAutoUnlock;
- (SBAwayViewPluginController)init;
- (SBLockScreenPluginAction)pluginUnlockAction;
- (SBLockScreenPluginAgent)pluginAgent;
- (SBLockScreenPluginAppearance)pluginAppearance;
- (_UILegibilitySettings)legibilitySettings;
- (id)_legibilitySettings;
- (id)bundleIDForUnlock;
- (id)customHeaderView;
- (id)customSubtitleColor;
- (id)customSubtitleText;
- (id)enableTransitionBlock;
- (id)pluginAnimateAppearanceTransition:(BOOL)a3 withCompletion:(id)a4;
- (id)slideToUnlockText;
- (int64_t)notificationBehavior;
- (int64_t)orientation;
- (int64_t)overlayStyle;
- (int64_t)pluginPriority;
- (int64_t)presentationStyle;
- (unint64_t)unlockAnimationStyleForDestinationApp:(id)a3;
- (void)_updateAppearanceAndNotify:(BOOL)a3;
- (void)disable;
- (void)pluginDidDeactivateWithContext:(id)a3;
- (void)pluginWillActivateWithContext:(id)a3;
- (void)purgeView;
- (void)setNeedsLegibilityAppearanceUpdate;
- (void)setPluginAgent:(id)a3;
- (void)setViewCanBeDisplayed:(BOOL)a3;
@end

@implementation SBAwayViewPluginController

- (SBAwayViewPluginController)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBAwayViewPluginController;
  result = [(SBAwayViewPluginController *)&v3 init];
  if (result) {
    result->_viewCanBeDisplayed = 1;
  }
  return result;
}

- (void)_updateAppearanceAndNotify:(BOOL)a3
{
  appearance = self->_appearance;
  if (!appearance) {
    return;
  }
  BOOL v4 = a3;
  [(SBLockScreenPluginAppearanceContext *)appearance setHidden:[(SBAwayViewPluginController *)self viewCanBeDisplayed] ^ 1];
  id v18 = [MEMORY[0x263EFF980] array];
  if (![(SBAwayViewPluginController *)self showStatusBar])
  {
    v6 = +[SBLockScreenElementOverride overrideForHiddenElement:1];
    [v18 addObject:v6];
  }
  if (![(SBAwayViewPluginController *)self showDateView])
  {
    v7 = +[SBLockScreenElementOverride overrideForHiddenElement:2];
    [v18 addObject:v7];
  }
  if ([(SBAwayViewPluginController *)self hasCustomSubtitle])
  {
    v8 = +[SBLockScreenElementOverride overrideForElement:3];
    v9 = [(SBAwayViewPluginController *)self customSubtitleText];
    [v8 setText:v9];

LABEL_11:
    [v18 addObject:v8];

    id v11 = v18;
    goto LABEL_12;
  }
  BOOL v10 = [(SBAwayViewPluginController *)self showDate];
  id v11 = v18;
  if (!v10)
  {
    v8 = +[SBLockScreenElementOverride overrideForHiddenElement:3];
    [v8 setText:&stru_26D3ED7F8];
    goto LABEL_11;
  }
LABEL_12:
  [(SBLockScreenPluginAppearanceContext *)self->_appearance setElementOverrides:v11];
  if ([(SBAwayViewPluginController *)self allowsSiri]) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 2;
  }
  if (![(SBAwayViewPluginController *)self allowsLockScreenCamera]) {
    v12 |= 4uLL;
  }
  if (![(SBAwayViewPluginController *)self allowsUnlocking]) {
    v12 |= 8uLL;
  }
  if (![(SBAwayViewPluginController *)self allowsLogout]) {
    v12 |= 0x10uLL;
  }
  if (![(SBAwayViewPluginController *)self wantsMesaAutoUnlock]) {
    v12 |= 0x20uLL;
  }
  if (![(SBAwayViewPluginController *)self allowsLockScreenMediaControls]) {
    v12 |= 0x40uLL;
  }
  if (![(SBAwayViewPluginController *)self allowsControlCenter]) {
    v12 |= 0x100uLL;
  }
  if ([(SBAwayViewPluginController *)self allowsScreenshots]) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = v12 | 0x200;
  }
  [(SBLockScreenPluginAppearanceContext *)self->_appearance setRestrictedCapabilities:v13];
  unint64_t v14 = [(SBAwayViewPluginController *)self overlayStyle];
  if (v14 <= 3) {
    [(SBLockScreenPluginAppearanceContext *)self->_appearance setBackgroundStyle:v14];
  }
  [(SBLockScreenPluginAppearanceContext *)self->_appearance setPresentationStyle:[(SBAwayViewPluginController *)self presentationStyle]];
  [(SBLockScreenPluginAppearanceContext *)self->_appearance setNotificationBehavior:[(SBAwayViewPluginController *)self notificationBehavior]];
  v15 = self->_appearance;
  v16 = [(SBAwayViewPluginController *)self _legibilitySettings];
  [(SBLockScreenPluginAppearanceContext *)v15 setLegibilitySettings:v16];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_agent);
    [WeakRetained pluginController:self updateAppearance:self->_appearance];
  }
}

- (id)_legibilitySettings
{
  uint64_t v3 = [(SBAwayViewPluginController *)self legibilitySettings];
  if (v3)
  {
    BOOL v4 = (SBLockScreenLegibilitySettings *)v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
    }
    else
    {
      v6 = [SBLockScreenLegibilitySettings alloc];
      uint64_t v7 = [(SBLockScreenLegibilitySettings *)v4 style];
      v8 = [(SBLockScreenLegibilitySettings *)v4 primaryColor];
      v9 = [(SBLockScreenLegibilitySettings *)v4 secondaryColor];
      BOOL v10 = [(SBLockScreenLegibilitySettings *)v4 shadowColor];
      v5 = [(SBLockScreenLegibilitySettings *)v6 initWithStyle:v7 primaryColor:v8 secondaryColor:v9 shadowColor:v10];

      [(SBLockScreenLegibilitySettings *)v5 setVibrancyDisabled:[(SBAwayViewPluginController *)self legibilitySettingsOverridesVibrancy]];
      if ([(SBAwayViewPluginController *)self isContentViewWhiteUnderSlideToUnlockText])
      {
        id v11 = [MEMORY[0x263F1C550] whiteColor];
        [(SBLockScreenLegibilitySettings *)v5 setBackgroundColorHint:v11];
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)pluginPriority
{
  return 0;
}

- (SBLockScreenPluginAppearance)pluginAppearance
{
  appearance = self->_appearance;
  if (!appearance)
  {
    BOOL v4 = objc_alloc_init(SBLockScreenPluginMutableAppearanceContext);
    v5 = self->_appearance;
    self->_appearance = v4;

    [(SBAwayViewPluginController *)self _updateAppearanceAndNotify:0];
    appearance = self->_appearance;
  }

  return (SBLockScreenPluginAppearance *)appearance;
}

- (void)pluginWillActivateWithContext:(id)a3
{
  id v4 = [a3 userInfo];
  [(SBAwayViewPluginController *)self setActivationContext:v4];
}

- (void)pluginDidDeactivateWithContext:(id)a3
{
  id v4 = [a3 userInfo];
  [(SBAwayViewPluginController *)self setDeactivationContext:v4];

  [(SBAwayViewPluginController *)self purgeView];

  [(SBAwayViewPluginController *)self setPluginAgent:0];
}

- (SBLockScreenPluginAction)pluginUnlockAction
{
  uint64_t v3 = [(SBAwayViewPluginController *)self slideToUnlockText];
  uint64_t v4 = [(SBAwayViewPluginController *)self bundleIDForUnlock];
  if (v3 | v4)
  {
    v5 = +[SBLockScreenPluginApplicationAction actionWithBundleID:v4];
    [v5 setLabel:v3];
    objc_msgSend(v5, "setTransitionStyle:", -[SBAwayViewPluginController unlockAnimationStyleForDestinationApp:](self, "unlockAnimationStyleForDestinationApp:", v4));
  }
  else
  {
    v5 = 0;
  }

  return (SBLockScreenPluginAction *)v5;
}

- (BOOL)pluginHandleEvent:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      BOOL v4 = [(SBAwayViewPluginController *)self shouldDisableOnUnlock];
      if (v4) {
        goto LABEL_6;
      }
      break;
    case 2:
      BOOL v4 = [(SBAwayViewPluginController *)self shouldDisableOnRelock];
      if (v4)
      {
LABEL_6:
        [(SBAwayViewPluginController *)self disable];
        LOBYTE(v4) = 1;
      }
      break;
    case 3:
      LOBYTE(v4) = [(SBAwayViewPluginController *)self handleMenuButtonTap];
      break;
    case 4:
      LOBYTE(v4) = [(SBAwayViewPluginController *)self handleLockButtonPressed];
      break;
    case 5:
      LOBYTE(v4) = [(SBAwayViewPluginController *)self handleVolumeUpButtonPressed];
      break;
    case 6:
      LOBYTE(v4) = [(SBAwayViewPluginController *)self handleVolumeDownButtonPressed];
      break;
    case 7:
      uint64_t v5 = 0;
      goto LABEL_22;
    case 8:
      uint64_t v5 = 1;
LABEL_22:
      LOBYTE(v4) = [(SBAwayViewPluginController *)self handleHeadsetButtonPressed:v5];
      break;
    default:
      LOBYTE(v4) = 0;
      break;
  }
  return v4;
}

- (BOOL)pluginAnimatesAppearanceTransition:(BOOL)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = [(SBAwayViewPluginController *)self enableTransitionBlock];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)pluginAnimateAppearanceTransition:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(void))a4;
  uint64_t v7 = v6;
  if (v4)
  {
    v8 = [(SBAwayViewPluginController *)self enableTransitionBlock];
    BOOL v9 = v8 == 0;
    if (v8)
    {
      BOOL v10 = (void *)MEMORY[0x263F29BF0];
      id v11 = NSString;
      uint64_t v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      unint64_t v14 = [v11 stringWithFormat:@"Plugin %@ did not call transition completion block", v13];
      v15 = [v10 sentinelWithExceptionReason:v14];

      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __79__SBAwayViewPluginController_pluginAnimateAppearanceTransition_withCompletion___block_invoke;
      v19[3] = &unk_2645D4458;
      id v16 = v15;
      id v20 = v16;
      v21 = v7;
      if (((double (**)(void, void *))v8)[2](v8, v19) <= 0.0)
      {
        v17 = 0;
      }
      else
      {
        v17 = objc_msgSend(MEMORY[0x263F29BC8], "settingsWithDuration:");
      }
    }
    else
    {
      v17 = 0;
    }

    if (!v7) {
      goto LABEL_13;
    }
  }
  else
  {
    v17 = 0;
    BOOL v9 = 1;
    if (!v6) {
      goto LABEL_13;
    }
  }
  if (v9) {
    v7[2](v7);
  }
LABEL_13:

  return v17;
}

uint64_t __79__SBAwayViewPluginController_pluginAnimateAppearanceTransition_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) signal];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)purgeView
{
  uint64_t v3 = [(SBAwayViewPluginController *)self viewIfLoaded];

  if (v3)
  {
    BOOL v4 = [(SBAwayViewPluginController *)self viewIfLoaded];
    [v4 removeFromSuperview];

    [(SBAwayViewPluginController *)self setView:0];
  }
}

- (void)setViewCanBeDisplayed:(BOOL)a3
{
  if (self->_viewCanBeDisplayed != a3)
  {
    self->_viewCanBeDisplayed = a3;
    [(SBAwayViewPluginController *)self _updateAppearanceAndNotify:1];
  }
}

- (int64_t)orientation
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  int64_t v3 = [v2 statusBarOrientation];

  return v3;
}

- (void)disable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_agent);
  [WeakRetained deactivatePluginController:self];
}

- (id)enableTransitionBlock
{
  return 0;
}

- (int64_t)overlayStyle
{
  return 1;
}

- (int64_t)presentationStyle
{
  if ([(SBAwayViewPluginController *)self viewWantsOverlayLayout]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (int64_t)notificationBehavior
{
  if ([(SBAwayViewPluginController *)self disablesAwayItemsCompletely]) {
    return 1;
  }
  if ([(SBAwayViewPluginController *)self shouldAutoHideNotifications]) {
    return 2;
  }
  return 0;
}

- (_UILegibilitySettings)legibilitySettings
{
  return (_UILegibilitySettings *)+[SBLockScreenLegibilitySettings defaultSettings];
}

- (BOOL)viewWantsOverlayLayout
{
  return 0;
}

- (BOOL)shouldDisableOnRelock
{
  return 0;
}

- (BOOL)shouldDisableOnUnlock
{
  return 0;
}

- (BOOL)shouldShowLockStatusBarTime
{
  return 0;
}

- (BOOL)shouldAutoHideNotifications
{
  return 0;
}

- (BOOL)allowsControlCenter
{
  return 1;
}

- (BOOL)allowsTimer
{
  return 1;
}

- (BOOL)allowsLockScreenHint
{
  return [(SBAwayViewPluginController *)self presentationStyle] != 1;
}

- (BOOL)animateResumingToApplicationWithIdentifier:(id)a3
{
  return [(SBAwayViewPluginController *)self unlockAnimationStyleForDestinationApp:a3] != 2;
}

- (id)bundleIDForUnlock
{
  return 0;
}

- (unint64_t)unlockAnimationStyleForDestinationApp:(id)a3
{
  return 0;
}

- (BOOL)disablesAwayItemsCompletely
{
  return 0;
}

- (BOOL)showDateView
{
  return 0;
}

- (BOOL)showBatteryChargingText
{
  return 1;
}

- (BOOL)showDate
{
  return 1;
}

- (BOOL)hasCustomSubtitle
{
  return 0;
}

- (id)customSubtitleText
{
  return 0;
}

- (id)customSubtitleColor
{
  return 0;
}

- (BOOL)showStatusBar
{
  return 1;
}

- (id)customHeaderView
{
  return 0;
}

- (BOOL)allowsLockScreenCamera
{
  return 1;
}

- (BOOL)allowsLockScreenMediaControls
{
  return 1;
}

- (BOOL)allowsPhotoSlideshow
{
  return 1;
}

- (BOOL)allowsSiri
{
  return 1;
}

- (BOOL)allowsUnlocking
{
  return 1;
}

- (id)slideToUnlockText
{
  return 0;
}

- (BOOL)handleMenuButtonTap
{
  return 0;
}

- (BOOL)handleMenuButtonDoubleTap
{
  return 0;
}

- (BOOL)wantsMenuButtonHeldEvent
{
  return 0;
}

- (BOOL)handleMenuButtonHeld
{
  return 0;
}

- (BOOL)handleLockButtonPressed
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPressed
{
  return 0;
}

- (BOOL)handleVolumeDownButtonPressed
{
  return 0;
}

- (BOOL)handleHeadsetButtonPressed:(BOOL)a3
{
  return 0;
}

- (BOOL)wantsMesaAutoUnlock
{
  return 1;
}

- (BOOL)allowsScreenshots
{
  return 1;
}

- (BOOL)allowsLogout
{
  return 1;
}

- (BOOL)legibilitySettingsOverridesVibrancy
{
  return 0;
}

- (BOOL)isContentViewWhiteUnderSlideToUnlockText
{
  return 0;
}

- (void)setNeedsLegibilityAppearanceUpdate
{
}

+ (void)enableBundleNamed:(id)a3 activationContext:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x263F793B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 enableLockScreenBundle:v7 withContext:v6];
}

+ (void)enableBundleNamed:(id)a3
{
}

+ (void)disableBundleNamed:(id)a3 deactivationContext:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x263F793B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 disableLockScreenBundle:v7 withContext:v6];
}

+ (void)disableBundleNamed:(id)a3
{
}

- (SBLockScreenPluginAgent)pluginAgent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_agent);

  return (SBLockScreenPluginAgent *)WeakRetained;
}

- (void)setPluginAgent:(id)a3
{
}

- (BOOL)viewCanBeDisplayed
{
  return self->_viewCanBeDisplayed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearance, 0);

  objc_destroyWeak((id *)&self->_agent);
}

@end