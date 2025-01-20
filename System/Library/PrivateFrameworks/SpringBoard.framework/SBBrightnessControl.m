@interface SBBrightnessControl
+ (BOOL)handlesKeyCommandsForRoute:(int64_t)a3;
- (BOOL)_HUDIsDisplayable;
- (BOOL)_HUDIsDisplayableWithReason:(id *)a3;
- (BOOL)elasticHUDViewControllerCanBePresented:(id)a3 withReason:(id *)a4;
- (BOOL)elasticValueViewController:(id)a3 updateCurrentValue:(float)a4;
- (SBBrightnessControl)initWithHUDController:(id)a3;
- (float)elasticValueViewControllerCurrentValue:(id)a3;
- (id)_controllerForRoute:(int64_t)a3;
- (id)acquireBrightnessHUDHiddenAssertionForReason:(id)a3;
- (id)activeDataSource;
- (id)existingBrightnessHUDViewController;
- (id)presentedBrightnessHUDViewController;
- (int64_t)elasticBrightnessViewControllerBrightnessRouteType:(id)a3;
- (void)_controlCenterWillDismiss:(id)a3;
- (void)_controlCenterWillPresent:(id)a3;
- (void)_handleUpdateBrightnessIncrementKeyIsDown:(BOOL)a3 decrementKeyIsDown:(BOOL)a4;
- (void)_presentOrUpdateBrightnessHUDAsNecessaryForBrightnessLevel:(float)a3;
- (void)_resetIdleTimerForUserInteractionIfNecessary;
- (void)brightnessController:(id)a3 performCoordinatedBrightnessChangeForIncrementKeyDown:(BOOL)a4 decrementKeyDown:(BOOL)a5;
- (void)cancelBrightnessKeyPressEvents;
- (void)elasticBrightnessViewControllerValueUpdatesDidEnd:(id)a3;
- (void)elasticBrightnessViewControllerValueUpdatesWillBegin:(id)a3;
- (void)elasticHUDViewControllerRequestsDismissal:(id)a3;
- (void)handleBrightnessKeyPressEvent:(__IOHIDEvent *)a3 forRoute:(int64_t)a4;
- (void)setActiveController:(id)a3;
- (void)setBrightnessLevel:(float)a3 forRoute:(int64_t)a4;
@end

@implementation SBBrightnessControl

- (SBBrightnessControl)initWithHUDController:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBBrightnessControl.m", 48, @"Invalid parameter not satisfying: %@", @"HUDController" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)SBBrightnessControl;
  v7 = [(SBBrightnessControl *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_HUDController, a3);
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v8 selector:sel__controlCenterWillPresent_ name:@"SBControlCenterControllerWillPresentNotification" object:0];
    [v9 addObserver:v8 selector:sel__controlCenterWillDismiss_ name:@"SBControlCenterControllerWillDismissNotification" object:0];
  }
  return v8;
}

+ (BOOL)handlesKeyCommandsForRoute:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = off_1E6AEDD80;
    return [(__objc2_class *)*v3 handlesKeyCommands];
  }
  if (a3 == 2)
  {
    v3 = off_1E6AEEEC0;
    return [(__objc2_class *)*v3 handlesKeyCommands];
  }
  return 0;
}

- (void)handleBrightnessKeyPressEvent:(__IOHIDEvent *)a3 forRoute:(int64_t)a4
{
  id v5 = [(SBBrightnessControl *)self _controllerForRoute:a4];
  [v5 handleBrightnessKeyPressEvent:a3];
}

- (void)setBrightnessLevel:(float)a3 forRoute:(int64_t)a4
{
  id v6 = [(SBBrightnessControl *)self _controllerForRoute:a4];
  *(float *)&double v5 = a3;
  [v6 setBrightnessLevel:1 animated:v5];
}

- (void)cancelBrightnessKeyPressEvents
{
  [(SBKeyboardBrightnessController *)self->_keyboardBrightnessController cancelBrightnessKeyPressEvent];
  displayBrightnessController = self->_displayBrightnessController;
  [(SBDisplayBrightnessController *)displayBrightnessController cancelBrightnessKeyPressEvent];
}

- (id)acquireBrightnessHUDHiddenAssertionForReason:(id)a3
{
  id v4 = a3;
  [(SBBrightnessControl *)self cancelBrightnessKeyPressEvents];
  double v5 = [(SBHUDController *)self->_HUDController acquireHUDHiddenAssertionForIdentifier:*MEMORY[0x1E4FA7050] withReason:v4];

  return v5;
}

- (void)brightnessController:(id)a3 performCoordinatedBrightnessChangeForIncrementKeyDown:(BOOL)a4 decrementKeyDown:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v15 = a3;
  -[SBBrightnessControl setActiveController:](self, "setActiveController:");
  [(SBBrightnessControl *)self _handleUpdateBrightnessIncrementKeyIsDown:v6 decrementKeyIsDown:v5];
  if (v6 || v5)
  {
    [v15 brightnessLevel];
    float v9 = *(float *)&v8 + -0.0625;
    if ((float)(*(float *)&v8 + -0.0625) < 0.0) {
      float v9 = 0.0;
    }
    float v10 = fminf(*(float *)&v8 + 0.0625, 1.0);
    if (v6) {
      float v11 = v10;
    }
    else {
      float v11 = v9;
    }
    if (*(float *)&v8 != v11)
    {
      objc_super v12 = [(SBBrightnessControl *)self presentedBrightnessHUDViewController];
      *(float *)&double v13 = v11;
      [v12 noteValueWillDeltaStepToValue:v13];
    }
    *(float *)&double v8 = v11;
    [v15 setBrightnessLevel:1 animated:v8];
    *(float *)&double v14 = v11;
    [(SBBrightnessControl *)self _presentOrUpdateBrightnessHUDAsNecessaryForBrightnessLevel:v14];
  }
}

- (float)elasticValueViewControllerCurrentValue:(id)a3
{
  v3 = [(SBBrightnessControl *)self activeDataSource];
  [v3 brightnessLevel];
  float v5 = v4;

  return v5;
}

- (BOOL)elasticValueViewController:(id)a3 updateCurrentValue:(float)a4
{
  float v5 = [(SBBrightnessControl *)self activeDataSource];
  *(float *)&double v6 = a4;
  char v7 = [v5 setBrightnessLevel:0 animated:v6];

  return v7;
}

- (int64_t)elasticBrightnessViewControllerBrightnessRouteType:(id)a3
{
  v3 = [(SBBrightnessControl *)self activeDataSource];
  int64_t v4 = [v3 brightnessRouteType];

  return v4;
}

- (void)elasticBrightnessViewControllerValueUpdatesWillBegin:(id)a3
{
  id v3 = [(SBBrightnessControl *)self activeDataSource];
  [v3 noteValueUpdatesWillBegin];
}

- (void)elasticBrightnessViewControllerValueUpdatesDidEnd:(id)a3
{
  id v3 = [(SBBrightnessControl *)self activeDataSource];
  [v3 noteValueUpdatesDidEnd];
}

- (BOOL)elasticHUDViewControllerCanBePresented:(id)a3 withReason:(id *)a4
{
  return [(SBBrightnessControl *)self _HUDIsDisplayableWithReason:a4];
}

- (void)elasticHUDViewControllerRequestsDismissal:(id)a3
{
  id v3 = [(SBHUDController *)self->_HUDController presentedHUDControllerForIdentifier:*MEMORY[0x1E4FA7050]];
  [v3 dismissAnimated:0];
}

- (void)_controlCenterWillPresent:(id)a3
{
  if (!self->_controlCenterIsPresented)
  {
    self->_controlCenterIsPresented = 1;
    id v3 = [(SBHUDController *)self->_HUDController knownHUDControllerForIdentifier:*MEMORY[0x1E4FA7050]];
    [v3 dismissAnimated:1];
  }
}

- (void)_controlCenterWillDismiss:(id)a3
{
  self->_controlCenterIsPresented = 0;
}

- (id)presentedBrightnessHUDViewController
{
  v2 = [(SBHUDController *)self->_HUDController presentedHUDControllerForIdentifier:*MEMORY[0x1E4FA7050]];
  id v3 = [v2 HUDViewController];

  return v3;
}

- (id)existingBrightnessHUDViewController
{
  v2 = [(SBHUDController *)self->_HUDController knownHUDControllerForIdentifier:*MEMORY[0x1E4FA7050]];
  id v3 = [v2 HUDViewController];

  return v3;
}

- (void)_presentOrUpdateBrightnessHUDAsNecessaryForBrightnessLevel:(float)a3
{
  if (![(SBBrightnessControl *)self _HUDIsDisplayable]) {
    return;
  }
  uint64_t v5 = *MEMORY[0x1E4FA7050];
  double v6 = [(SBHUDController *)self->_HUDController knownHUDControllerForIdentifier:*MEMORY[0x1E4FA7050]];
  char v7 = [v6 HUDViewController];
  if (v6)
  {
    double v8 = v6;
  }
  else
  {
    float v9 = +[SBElasticValueViewControllerFactory factoryWithBrightnessDataSource:self];
    float v10 = [[SBElasticHUDViewController alloc] initWithFactory:v9];

    [(SBElasticHUDViewController *)v10 setDelegate:self];
    id v12 = [(SBHUDController *)self->_HUDController HUDSessionForViewController:v10 identifier:v5];

    double v8 = v12;
    char v7 = v10;
  }
  id v13 = v8;
  [v8 presentWithDismissalInterval:0 animated:60.0];
  *(float *)&double v11 = a3;
  [v7 noteValueDidChange:v11];
  if (!v6)
  {
    if (self->_brightnessIncrementKeyIsDown)
    {
      if (!self->_brightnessDecrementKeyIsDown) {
        goto LABEL_12;
      }
    }
    else if (!self->_brightnessDecrementKeyIsDown)
    {
      goto LABEL_13;
    }
    [v7 noteButtonDownWasHit:1];
    if (self->_brightnessIncrementKeyIsDown) {
LABEL_12:
    }
      [v7 noteButtonUpWasHit:1];
  }
LABEL_13:
}

- (BOOL)_HUDIsDisplayable
{
  return [(SBBrightnessControl *)self _HUDIsDisplayableWithReason:0];
}

- (BOOL)_HUDIsDisplayableWithReason:(id *)a3
{
  BOOL controlCenterIsPresented = self->_controlCenterIsPresented;
  if (self->_controlCenterIsPresented && a3 != 0) {
    *a3 = @"Control Center is presented";
  }
  return !controlCenterIsPresented;
}

- (void)_handleUpdateBrightnessIncrementKeyIsDown:(BOOL)a3 decrementKeyIsDown:(BOOL)a4
{
  int v4 = a4;
  int v5 = a3;
  uint64_t v7 = [(SBBrightnessControl *)self presentedBrightnessHUDViewController];
  int brightnessIncrementKeyIsDown = self->_brightnessIncrementKeyIsDown;
  int brightnessDecrementKeyIsDown = self->_brightnessDecrementKeyIsDown;
  id v14 = (id)v7;
  if (v7)
  {
    BOOL v10 = [(SBBrightnessControl *)self _HUDIsDisplayable];
    if (brightnessIncrementKeyIsDown != v5 && (v5 & 1) == 0) {
      [v14 noteButtonUpWasHit:0];
    }
    if (brightnessDecrementKeyIsDown != v4 && (v4 & 1) == 0) {
      [v14 noteButtonDownWasHit:0];
    }
    int v11 = !v10;
    if (brightnessIncrementKeyIsDown != v5 && v5 && (v11 & 1) == 0) {
      [v14 noteButtonUpWasHit:1];
    }
    int v12 = v4 ^ 1;
    if (brightnessDecrementKeyIsDown == v4) {
      int v12 = 1;
    }
    if (((v12 | v11) & 1) == 0) {
      [v14 noteButtonDownWasHit:1];
    }
  }
  if (brightnessIncrementKeyIsDown != v5 || brightnessDecrementKeyIsDown != v4) {
    [(SBBrightnessControl *)self _resetIdleTimerForUserInteractionIfNecessary];
  }
  self->_int brightnessIncrementKeyIsDown = v5;
  self->_int brightnessDecrementKeyIsDown = v4;
}

- (id)activeDataSource
{
  return self->_activeController;
}

- (void)setActiveController:(id)a3
{
  int v5 = (SBBrightnessRouteControlling *)a3;
  activeController = self->_activeController;
  if (activeController != v5)
  {
    float v9 = v5;
    uint64_t v7 = activeController;
    objc_storeStrong((id *)&self->_activeController, a3);
    if (v7)
    {
      [(SBBrightnessRouteControlling *)v7 noteValueUpdatesDidEnd];
      double v8 = [(SBBrightnessControl *)self existingBrightnessHUDViewController];
      [v8 reloadData];
    }
    int v5 = v9;
  }
}

- (id)_controllerForRoute:(int64_t)a3
{
  id v3 = self;
  switch(a3)
  {
    case 2:
      keyboardBrightnessController = self->_keyboardBrightnessController;
      if (!keyboardBrightnessController)
      {
        uint64_t v7 = [[SBKeyboardBrightnessController alloc] initWithCoordinator:self];
        double v8 = v3->_keyboardBrightnessController;
        v3->_keyboardBrightnessController = v7;

        keyboardBrightnessController = v3->_keyboardBrightnessController;
      }
      goto LABEL_11;
    case 1:
      keyboardBrightnessController = self->_displayBrightnessController;
      if (!keyboardBrightnessController)
      {
        float v9 = [[SBDisplayBrightnessController alloc] initWithCoordinator:self];
        displayBrightnessController = v3->_displayBrightnessController;
        v3->_displayBrightnessController = v9;

        keyboardBrightnessController = v3->_displayBrightnessController;
      }
LABEL_11:
      self = keyboardBrightnessController;
      break;
    case 0:
      int v4 = SBLogCommon();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

      if (v5) {
        NSLog(&cfstr_AttemptingToCo_1.isa);
      }
      self = 0;
      break;
  }
  return self;
}

- (void)_resetIdleTimerForUserInteractionIfNecessary
{
  id v8 = +[SBLockScreenManager sharedInstanceIfExists];
  if ([v8 isUILocked])
  {
    v2 = [v8 lockScreenEnvironment];
    id v3 = [v2 backlightController];
    char v4 = [v3 isInScreenOffMode];

    if ((v4 & 1) == 0)
    {
      BOOL v5 = +[SBIdleTimerGlobalCoordinator sharedInstanceIfExists];
      double v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      [v5 resetIdleTimerForReason:v7];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeController, 0);
  objc_storeStrong((id *)&self->_displayBrightnessController, 0);
  objc_storeStrong((id *)&self->_keyboardBrightnessController, 0);
  objc_storeStrong((id *)&self->_HUDController, 0);
}

@end