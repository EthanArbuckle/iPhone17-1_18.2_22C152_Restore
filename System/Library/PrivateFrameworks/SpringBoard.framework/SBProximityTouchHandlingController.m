@interface SBProximityTouchHandlingController
- (BOOL)absorbTouchesBelowStatusBar;
- (NSSet)allowedSystemGestureTypes;
- (SBProximityTouchHandlingController)initWithSettings:(id)a3 touchHandlingDelegate:(id)a4;
- (double)statusBarHeight;
- (void)_createNewWindow;
- (void)invalidate;
- (void)setAbsorbTouchesBelowStatusBar:(BOOL)a3;
- (void)setAllowedSystemGestureTypes:(id)a3;
- (void)setStatusBarHeight:(double)a3;
- (void)windowSceneDidConnect:(id)a3;
@end

@implementation SBProximityTouchHandlingController

- (SBProximityTouchHandlingController)initWithSettings:(id)a3 touchHandlingDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBProximityTouchHandlingController;
  v8 = [(SBProximityTouchHandlingController *)&v12 init];
  if (v8)
  {
    v9 = objc_alloc_init(_SBProximityTouchHandlingViewController);
    proxTouchHandlingViewController = v8->_proxTouchHandlingViewController;
    v8->_proxTouchHandlingViewController = v9;

    -[_SBProximityTouchHandlingViewController setDelegate:](v8->_proxTouchHandlingViewController, v7);
    -[_SBProximityTouchHandlingViewController setProximitySettings:]((uint64_t)v8->_proxTouchHandlingViewController, v6);
    BKSHIDServicesSetObjectInProximityIgnoresTouches();
  }

  return v8;
}

- (void)invalidate
{
  [(UIWindow *)self->_proxTouchHandlingWindow setHidden:1];
  proxTouchHandlingWindow = self->_proxTouchHandlingWindow;
  self->_proxTouchHandlingWindow = 0;
}

- (void)windowSceneDidConnect:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_windowScene, a3);
  proxTouchHandlingWindow = self->_proxTouchHandlingWindow;
  if (proxTouchHandlingWindow)
  {
    id v6 = [(UIWindow *)proxTouchHandlingWindow windowScene];

    if (v6 != v7) {
      [(UIWindow *)self->_proxTouchHandlingWindow setWindowScene:v7];
    }
  }
}

- (void)_createNewWindow
{
  if (a1)
  {
    v2 = a1;
    if (!a1[4])
    {
      v3 = SBLogCommon();
      BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

      if (v4) {
        NSLog(&cfstr_TryingToCreate.isa);
      }
    }
    a1 = +[_SBProximityTouchHandlingWindow proximityTouchHandlingWindowWithScene:viewController:]((uint64_t)_SBProximityTouchHandlingWindow, (void *)v2[4], (void *)v2[6]);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAbsorbTouchesBelowStatusBar:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_proxTouchHandlingWindow)
  {
    -[SBProximityTouchHandlingController _createNewWindow](self);
    v5 = (UIWindow *)objc_claimAutoreleasedReturnValue();
    proxTouchHandlingWindow = self->_proxTouchHandlingWindow;
    self->_proxTouchHandlingWindow = v5;
  }
  id v7 = SBLogProximitySensor();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v8)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Not absorbing touches", (uint8_t *)&v14, 2u);
    }

    [(UIWindow *)self->_proxTouchHandlingWindow setHidden:1];
    [(BSInvalidatable *)self->_suppressSystemGestures invalidate];
    suppressSystemGestures = self->_suppressSystemGestures;
    self->_suppressSystemGestures = 0;
    goto LABEL_12;
  }
  if (v8)
  {
    double statusBarHeight = self->_statusBarHeight;
    int v14 = 134217984;
    double v15 = statusBarHeight;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Absorbing touches below y:%g", (uint8_t *)&v14, 0xCu);
  }

  [(UIWindow *)self->_proxTouchHandlingWindow setHidden:0];
  if (!self->_suppressSystemGestures && self->_statusBarHeight == 0.0)
  {
    BKSHIDServicesCancelTouchesOnMainDisplay();
    suppressSystemGestures = +[SBSystemGestureManager mainDisplayManager];
    v11 = +[SBSystemGestureManager deviceHardwareButtonGestureTypes];
    objc_super v12 = [suppressSystemGestures acquireSystemGestureDisableAssertionForReason:@"objectInProximity" exceptSystemGestureTypes:v11];
    v13 = self->_suppressSystemGestures;
    self->_suppressSystemGestures = v12;

LABEL_12:
  }
}

- (void)setStatusBarHeight:(double)a3
{
  if (self->_statusBarHeight != a3)
  {
    self->_double statusBarHeight = a3;
    -[_SBProximityTouchHandlingViewController setStatusBarHeight:]((double *)self->_proxTouchHandlingViewController, a3);
  }
}

- (BOOL)absorbTouchesBelowStatusBar
{
  return self->_absorbTouchesBelowStatusBar;
}

- (NSSet)allowedSystemGestureTypes
{
  return self->_allowedSystemGestureTypes;
}

- (void)setAllowedSystemGestureTypes:(id)a3
{
}

- (double)statusBarHeight
{
  return self->_statusBarHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressSystemGestures, 0);
  objc_storeStrong((id *)&self->_suppressBackBoardTouchCancellation, 0);
  objc_storeStrong((id *)&self->_proxTouchHandlingViewController, 0);
  objc_storeStrong((id *)&self->_proxTouchHandlingWindow, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_allowedSystemGestureTypes, 0);
}

@end