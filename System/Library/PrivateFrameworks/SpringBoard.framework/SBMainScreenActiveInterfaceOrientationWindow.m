@interface SBMainScreenActiveInterfaceOrientationWindow
+ (BOOL)_traitsArbiterOrientationActuationEnabled;
+ (BOOL)layoutContentViewControllerWithConstraints;
+ (BOOL)sb_autorotates;
+ (id)_traitsArbiterOrientationActuationRole;
- (BOOL)_canBecomeKeyWindow;
- (BOOL)isActive;
- (BOOL)isDisablingInterfaceOrientationChanges;
- (BOOL)passesTouchesThrough;
- (NSString)debugName;
- (NSString)description;
- (SBMainScreenActiveInterfaceOrientationWindow)initWithRole:(id)a3 debugName:(id)a4;
- (SBMainScreenActiveInterfaceOrientationWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5;
- (UIViewController)contentViewController;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)rootViewController;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)effectiveRootViewControllerSupportedInterfaceOrientations;
- (void)_updateInterfaceOrientationToCurrentActiveInterfaceOrientationWithDuration:(double)a3;
- (void)_updateSupportedInterfaceOrientationsForTraitArbiterActuationIfNeeded;
- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5;
- (void)disableInterfaceOrientationChangesForReason:(id)a3;
- (void)enableInterfaceOrientationChangesForReason:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setPassesTouchesThrough:(BOOL)a3;
- (void)setRootViewController:(id)a3;
@end

@implementation SBMainScreenActiveInterfaceOrientationWindow

- (SBMainScreenActiveInterfaceOrientationWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5
{
  id v8 = a3;
  v9 = NSString;
  v10 = (void *)MEMORY[0x1E4F42D90];
  id v11 = a5;
  id v12 = a4;
  v13 = [v10 mainScreen];
  v14 = [v13 displayIdentity];
  v15 = [v9 stringWithFormat:@"%@-%@", v11, v14];

  v30.receiver = self;
  v30.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindow;
  v16 = [(SBWindow *)&v30 initWithWindowScene:v8 rootViewController:0 layoutStrategy:0 role:v12 debugName:v15];

  if (v16)
  {
    v17 = objc_alloc_init(_SBMainScreenActiveInterfaceOrientationWindowRootViewController);
    v18 = [v8 screen];
    [v18 bounds];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    v27 = [(_SBMainScreenActiveInterfaceOrientationWindowRootViewController *)v17 view];
    objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

    v29.receiver = v16;
    v29.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindow;
    [(SBMainScreenActiveInterfaceOrientationWindow *)&v29 setRootViewController:v17];
  }
  return v16;
}

- (SBMainScreenActiveInterfaceOrientationWindow)initWithRole:(id)a3 debugName:(id)a4
{
  return [(SBMainScreenActiveInterfaceOrientationWindow *)self initWithWindowScene:0 role:a3 debugName:a4];
}

- (id)rootViewController
{
  uint64_t v3 = objc_opt_class();
  v7.receiver = self;
  v7.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindow;
  v4 = [(SBMainScreenActiveInterfaceOrientationWindow *)&v7 rootViewController];
  v5 = SBSafeCast(v3, v4);

  return v5;
}

- (void)setRootViewController:(id)a3
{
}

- (BOOL)_canBecomeKeyWindow
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) != 1;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindow;
  -[SBWindow setHidden:](&v5, sel_setHidden_);
  if (v3)
  {
    [(id)SBApp removeActiveOrientationObserver:self];
  }
  else
  {
    [(SBMainScreenActiveInterfaceOrientationWindow *)self _updateInterfaceOrientationToCurrentActiveInterfaceOrientationWithDuration:0.0];
    [(SBMainScreenActiveInterfaceOrientationWindow *)self _updateSupportedInterfaceOrientationsForTraitArbiterActuationIfNeeded];
    [(id)SBApp addActiveOrientationObserver:self];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindow;
  -[SBMainScreenActiveInterfaceOrientationWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  objc_super v5 = (SBMainScreenActiveInterfaceOrientationWindow *)objc_claimAutoreleasedReturnValue();
  if ([(SBMainScreenActiveInterfaceOrientationWindow *)self passesTouchesThrough])
  {
    if (v5 == self
      || ([(SBMainScreenActiveInterfaceOrientationWindow *)self rootViewController],
          v6 = objc_claimAutoreleasedReturnValue(),
          [v6 view],
          objc_super v7 = (SBMainScreenActiveInterfaceOrientationWindow *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v5 == v7))
    {

      objc_super v5 = 0;
    }
  }
  return v5;
}

- (void)setContentViewController:(id)a3
{
  objc_super v5 = (UIViewController *)a3;
  p_contentViewController = (id *)&self->_contentViewController;
  if (self->_contentViewController != v5)
  {
    double v24 = v5;
    objc_super v7 = [(SBMainScreenActiveInterfaceOrientationWindow *)self rootViewController];
    id v8 = v7;
    if (*p_contentViewController)
    {
      objc_msgSend(v7, "bs_removeChildViewController:");
      [v8 setContentViewController:0];
    }
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (*p_contentViewController)
    {
      objc_super v9 = [v8 view];
      v10 = [*p_contentViewController view];
      int v11 = [(id)objc_opt_class() layoutContentViewControllerWithConstraints];
      if (v11)
      {
        [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
      }
      else
      {
        [v9 bounds];
        objc_msgSend(v10, "setFrame:");
        [v10 setAutoresizingMask:18];
      }
      objc_msgSend(v8, "bs_addChildViewController:", *p_contentViewController);
      [v8 setContentViewController:*p_contentViewController];
      if (v11)
      {
        id v12 = [v10 leftAnchor];
        v13 = [v9 leftAnchor];
        v14 = [v12 constraintEqualToAnchor:v13];
        [v14 setActive:1];

        v15 = [v10 rightAnchor];
        v16 = [v9 rightAnchor];
        v17 = [v15 constraintEqualToAnchor:v16];
        [v17 setActive:1];

        v18 = [v10 topAnchor];
        double v19 = [v9 topAnchor];
        double v20 = [v18 constraintEqualToAnchor:v19];
        [v20 setActive:1];

        double v21 = [v10 bottomAnchor];
        double v22 = [v9 bottomAnchor];
        double v23 = [v21 constraintEqualToAnchor:v22];
        [v23 setActive:1];
      }
    }
    [(SBMainScreenActiveInterfaceOrientationWindow *)self _updateSupportedInterfaceOrientationsForTraitArbiterActuationIfNeeded];

    objc_super v5 = v24;
  }
}

- (void)disableInterfaceOrientationChangesForReason:(id)a3
{
  id v4 = a3;
  orientationUpdateDisableReasons = self->_orientationUpdateDisableReasons;
  id v8 = v4;
  if (!orientationUpdateDisableReasons)
  {
    v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    objc_super v7 = self->_orientationUpdateDisableReasons;
    self->_orientationUpdateDisableReasons = v6;

    id v4 = v8;
    orientationUpdateDisableReasons = self->_orientationUpdateDisableReasons;
  }
  [(NSCountedSet *)orientationUpdateDisableReasons addObject:v4];
  [(SBMainScreenActiveInterfaceOrientationWindow *)self _updateSupportedInterfaceOrientationsForTraitArbiterActuationIfNeeded];
}

- (void)enableInterfaceOrientationChangesForReason:(id)a3
{
  [(NSCountedSet *)self->_orientationUpdateDisableReasons removeObject:a3];
  if (![(NSCountedSet *)self->_orientationUpdateDisableReasons count])
  {
    [(SBMainScreenActiveInterfaceOrientationWindow *)self _updateInterfaceOrientationToCurrentActiveInterfaceOrientationWithDuration:0.0];
    [(SBMainScreenActiveInterfaceOrientationWindow *)self _updateSupportedInterfaceOrientationsForTraitArbiterActuationIfNeeded];
  }
}

- (BOOL)isDisablingInterfaceOrientationChanges
{
  return [(NSCountedSet *)self->_orientationUpdateDisableReasons count] != 0;
}

- (NSString)description
{
  return (NSString *)[(SBMainScreenActiveInterfaceOrientationWindow *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBMainScreenActiveInterfaceOrientationWindow *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(SBMainScreenActiveInterfaceOrientationWindow *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBMainScreenActiveInterfaceOrientationWindow *)self succinctDescriptionBuilder];
  objc_super v5 = [(SBMainScreenActiveInterfaceOrientationWindow *)self _debugName];
  id v6 = (id)[v4 appendObject:v5 withName:0];

  [(SBMainScreenActiveInterfaceOrientationWindow *)self frame];
  int v11 = _SBWindowFrameDescription(v7, v8, v9, v10);
  id v12 = (id)[v4 appendObject:v11 withName:@"frame"];

  id v13 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBMainScreenActiveInterfaceOrientationWindow isHidden](self, "isHidden"), @"hidden", 1);
  v14 = [(SBMainScreenActiveInterfaceOrientationWindow *)self rootViewController];
  [v14 supportedInterfaceOrientations];
  v15 = BSInterfaceOrientationMaskDescription();
  [v4 appendString:v15 withName:@"rootVCSupportedInterfaceOrientations"];

  [(SBMainScreenActiveInterfaceOrientationWindow *)self interfaceOrientation];
  v16 = BSInterfaceOrientationDescription();
  [v4 appendString:v16 withName:@"interfaceOrientation"];

  v17 = [(NSCountedSet *)self->_orientationUpdateDisableReasons allObjects];
  v18 = [v4 activeMultilinePrefix];
  [v4 appendArraySection:v17 withName:@"updateDisableReasons" multilinePrefix:v18 skipIfEmpty:1];

  double v19 = [(SBMainScreenActiveInterfaceOrientationWindow *)self layer];
  id v20 = (id)[v4 appendObject:v19 withName:@"layer"];

  return v4;
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v9 = BKLogOrientationClient();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    double v10 = BSInterfaceOrientationDescription();
    int v11 = BSInterfaceOrientationDescription();
    int v12 = 138543874;
    id v13 = self;
    __int16 v14 = 2114;
    v15 = v10;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "Attempting to rotate active interface orientation following window (%{public}@) from orientation: %{public}@ to orientation %{public}@.", (uint8_t *)&v12, 0x20u);
  }
  +[SBAnimationUtilities adjustedRotationAnimationDurationForDuration:a5 fromOrientation:a3 toOrientation:a4];
  -[SBMainScreenActiveInterfaceOrientationWindow _updateInterfaceOrientationToCurrentActiveInterfaceOrientationWithDuration:](self, "_updateInterfaceOrientationToCurrentActiveInterfaceOrientationWithDuration:");
}

+ (BOOL)layoutContentViewControllerWithConstraints
{
  return 1;
}

- (void)_updateInterfaceOrientationToCurrentActiveInterfaceOrientationWithDuration:(double)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(NSCountedSet *)self->_orientationUpdateDisableReasons count])
  {
    objc_super v5 = [(SBMainScreenActiveInterfaceOrientationWindow *)self _roleHint];
    char v6 = SBTraitsArbiterOrientationActuationEnabledForRole(v5);

    if ((v6 & 1) == 0)
    {
      [(SBMainScreenActiveInterfaceOrientationWindow *)self effectiveRootViewControllerSupportedInterfaceOrientations];
      uint64_t v7 = [(id)SBApp activeInterfaceOrientation];
      if (SBFInterfaceOrientationMaskContainsInterfaceOrientation())
      {
        uint64_t v8 = XBInterfaceOrientationMaskForInterfaceOrientation();
        double v9 = [(SBMainScreenActiveInterfaceOrientationWindow *)self rootViewController];
        [v9 setSupportedInterfaceOrientations:v8];

        double v10 = BKLogOrientationClient();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v11 = BSInterfaceOrientationDescription();
          int v13 = 138543618;
          __int16 v14 = self;
          __int16 v15 = 2114;
          __int16 v16 = v11;
          int v12 = "Really rotating active interface orientation following window (%{public}@) to orientation: %{public}@.";
LABEL_8:
          _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v13, 0x16u);
        }
      }
      else
      {
        uint64_t v7 = SBFFirstInterfaceOrientationInInterfaceOrientationMask();
        double v10 = BKLogOrientationClient();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v11 = BSInterfaceOrientationDescription();
          int v13 = 138543618;
          __int16 v14 = self;
          __int16 v15 = 2114;
          __int16 v16 = v11;
          int v12 = "Overriding orientation of window (%{public}@) to orientation: %{public}@, because the root view controll"
                "er does not support the active interface orientation.";
          goto LABEL_8;
        }
      }

      [(SBMainScreenActiveInterfaceOrientationWindow *)self _legacySetRotatableViewOrientation:v7 duration:a3];
    }
  }
}

- (unint64_t)effectiveRootViewControllerSupportedInterfaceOrientations
{
  v2 = [(SBMainScreenActiveInterfaceOrientationWindow *)self contentViewController];
  uint64_t v3 = [v2 supportedInterfaceOrientations];
  if (v3) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 30;
  }

  return v4;
}

+ (BOOL)sb_autorotates
{
  return [a1 _traitsArbiterOrientationActuationEnabled] ^ 1;
}

+ (BOOL)_traitsArbiterOrientationActuationEnabled
{
  v2 = [a1 _traitsArbiterOrientationActuationRole];
  char v3 = SBTraitsArbiterOrientationActuationEnabledForRole(v2);

  return v3;
}

+ (id)_traitsArbiterOrientationActuationRole
{
  return 0;
}

- (void)_updateSupportedInterfaceOrientationsForTraitArbiterActuationIfNeeded
{
  if ([(id)objc_opt_class() _traitsArbiterOrientationActuationEnabled])
  {
    if ([(SBMainScreenActiveInterfaceOrientationWindow *)self isDisablingInterfaceOrientationChanges])
    {
      [(SBMainScreenActiveInterfaceOrientationWindow *)self _windowInterfaceOrientation];
      uint64_t v3 = XBInterfaceOrientationMaskForInterfaceOrientation();
    }
    else
    {
      uint64_t v3 = [(SBMainScreenActiveInterfaceOrientationWindow *)self effectiveRootViewControllerSupportedInterfaceOrientations];
    }
    uint64_t v4 = v3;
    id v5 = [(SBMainScreenActiveInterfaceOrientationWindow *)self rootViewController];
    [v5 setSupportedInterfaceOrientations:v4];
  }
}

- (BOOL)isActive
{
  return 0;
}

- (NSString)debugName
{
  return self->_debugName;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (BOOL)passesTouchesThrough
{
  return self->_passesTouchesThrough;
}

- (void)setPassesTouchesThrough:(BOOL)a3
{
  self->_passesTouchesThrough = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_orientationUpdateDisableReasons, 0);
}

@end