@interface SBKeyboardHomeAffordanceController
+ (id)sharedInstance;
- (BOOL)shouldAllowAutoHideForHomeGrabberView:(id)a3;
- (BOOL)shouldAllowThinStyleForHomeGrabberView:(id)a3;
- (SBKeyboardHomeAffordanceController)init;
- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3;
- (void)_didChangeAdditionalEdgeMarginForAssertion:(id)a3;
- (void)_didChangeKeyboardDocked:(id)a3;
- (void)_getHomeGrabberContainingView:(id *)a3 isAlwaysPortrait:(BOOL *)a4;
- (void)_updateHomeAffordance;
- (void)_updateTopMostAssertion;
- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5;
- (void)dealloc;
- (void)registerAssertion:(id)a3;
- (void)unregisterAssertion:(id)a3;
@end

@implementation SBKeyboardHomeAffordanceController

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SBKeyboardHomeAffordanceController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_51 != -1) {
    dispatch_once(&sharedInstance_onceToken_51, block);
  }
  v2 = (void *)sharedInstance___sharedInstance_26;
  return v2;
}

void __52__SBKeyboardHomeAffordanceController_sharedInstance__block_invoke(uint64_t a1)
{
  if (SBFEffectiveHomeButtonType() == 2)
  {
    id v2 = objc_alloc_init(*(Class *)(a1 + 32));
    v3 = (void *)sharedInstance___sharedInstance_26;
    sharedInstance___sharedInstance_26 = (uint64_t)v2;
  }
  else
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = [NSString stringWithUTF8String:"+[SBKeyboardHomeAffordanceController sharedInstance]_block_invoke"];
    [v4 handleFailureInFunction:v5 file:@"SBKeyboardHomeAffordanceAssertion.m" lineNumber:62 description:@"Attempted to make a home affordance keyboard assertion on a device that shouldn't."];

    v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __52__SBKeyboardHomeAffordanceController_sharedInstance__block_invoke_cold_1(v6);
    }
  }
}

- (SBKeyboardHomeAffordanceController)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBKeyboardHomeAffordanceController;
  id v2 = [(SBKeyboardHomeAffordanceController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_isKeyboardDocked = 1;
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    assertions = v3->_assertions;
    v3->_assertions = (NSHashTable *)v4;

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel__didChangeKeyboardDocked_ name:@"SBKeyboardDockedChangedNotification" object:0];
  }
  return v3;
}

- (void)dealloc
{
  [(id)SBApp removeActiveOrientationObserver:self];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(SBHomeGrabberRotationView *)self->_homeGrabberView removeFromSuperview];
  v4.receiver = self;
  v4.super_class = (Class)SBKeyboardHomeAffordanceController;
  [(SBKeyboardHomeAffordanceController *)&v4 dealloc];
}

- (void)registerAssertion:(id)a3
{
  if (a3)
  {
    -[NSHashTable addObject:](self->_assertions, "addObject:");
    [(SBKeyboardHomeAffordanceController *)self _updateTopMostAssertion];
  }
}

- (void)unregisterAssertion:(id)a3
{
  if (a3)
  {
    -[NSHashTable removeObject:](self->_assertions, "removeObject:");
    [(SBKeyboardHomeAffordanceController *)self _updateTopMostAssertion];
  }
}

- (void)_didChangeAdditionalEdgeMarginForAssertion:(id)a3
{
  p_topMostAssertion = &self->_topMostAssertion;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_topMostAssertion);

  if (WeakRetained == v5)
  {
    id v7 = [(SBHomeGrabberRotationView *)self->_homeGrabberView grabberView];
    [v7 setNeedsLayout];
  }
}

- (void)_didChangeKeyboardDocked:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"SBKeyboardDockedKey"];
  self->_isKeyboardDocked = [v5 BOOLValue];

  [(SBKeyboardHomeAffordanceController *)self _updateHomeAffordance];
}

- (void)_getHomeGrabberContainingView:(id *)a3 isAlwaysPortrait:(BOOL *)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topMostAssertion);
  id v7 = [WeakRetained sourceWindow];

  uint64_t v8 = objc_opt_class();
  v9 = [v7 windowScene];
  v10 = SBSafeCast(v8, v9);

  if ([MEMORY[0x1E4F42B08] usesInputSystemUI])
  {
    uint64_t v11 = objc_opt_class();
    v12 = [(id)SBApp systemUIScenesCoordinator];
    v13 = [v12 inputUISceneController];
    v14 = [v13 hostingWindow];
    SBSafeCast(v11, v14);
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    if (v10) {
      char v15 = [v10 isMainDisplayWindowScene];
    }
    else {
      char v15 = 1;
    }
  }
  else
  {
    if (!v10)
    {
      id v23 = 0;
      goto LABEL_21;
    }
    v16 = [v10 medusaHostedKeyboardWindowController];
    if ([v16 isUsingMedusaHostedKeyboardWindow])
    {
      v17 = [v16 medusaHostedKeyboardWindow];
      v18 = [v17 rootViewController];
      id v23 = [v18 view];

      char v15 = [v10 isMainDisplayWindowScene];
    }
    else
    {
      Class v19 = NSClassFromString(&cfstr_Uikeyboardarbi.isa);
      if (objc_opt_respondsToSelector())
      {
        v20 = [(objc_class *)v19 performSelector:sel_sharedArbiterManager];
      }
      else
      {
        v20 = 0;
      }
      if (objc_opt_respondsToSelector())
      {
        v21 = [v20 keyboardWindow];
        v22 = [v21 rootViewController];
        id v23 = [v22 view];
      }
      else
      {
        id v23 = 0;
      }

      char v15 = 0;
    }
  }
  if (a3) {
    *a3 = v23;
  }
  if (a4) {
    *a4 = v15;
  }
LABEL_21:
}

- (void)_updateHomeAffordance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topMostAssertion);
  if (WeakRetained && self->_isKeyboardDocked)
  {
    BOOL v29 = 0;
    id v28 = 0;
    [(SBKeyboardHomeAffordanceController *)self _getHomeGrabberContainingView:&v28 isAlwaysPortrait:&v29];
    id v4 = v28;
    id v5 = v4;
    homeGrabberView = self->_homeGrabberView;
    if (homeGrabberView)
    {
      [v4 bounds];
      -[SBHomeGrabberRotationView setFrame:](homeGrabberView, "setFrame:");
    }
    else
    {
      uint64_t v8 = objc_opt_class();
      v9 = [WeakRetained sourceWindow];
      v10 = [v9 windowScene];
      uint64_t v11 = SBSafeCast(v8, v10);

      if (([MEMORY[0x1E4F42B08] usesInputSystemUI] & 1) == 0 && !v11)
      {
LABEL_17:

        goto LABEL_18;
      }
      v12 = [v11 medusaHostedKeyboardWindowController];
      [v12 addObserver:self];

      v13 = [SBHomeGrabberRotationView alloc];
      [v5 bounds];
      v14 = -[SBHomeGrabberRotationView initWithFrame:](v13, "initWithFrame:");
      char v15 = self->_homeGrabberView;
      self->_homeGrabberView = v14;

      v16 = [(SBHomeGrabberRotationView *)self->_homeGrabberView grabberView];
      if (__sb__runningInSpringBoard())
      {
        [v16 setSuppressesBounce:SBFEffectiveDeviceClass() == 2];
      }
      else
      {
        v17 = [MEMORY[0x1E4F42948] currentDevice];
        objc_msgSend(v16, "setSuppressesBounce:", objc_msgSend(v17, "userInterfaceIdiom") == 1);
      }
      v18 = [(SBHomeGrabberRotationView *)self->_homeGrabberView grabberView];
      [v18 setDelegate:self];

      [(SBHomeGrabberRotationView *)self->_homeGrabberView setHidden:1];
      [(SBHomeGrabberRotationView *)self->_homeGrabberView setAlpha:0.0];
      [(SBHomeGrabberRotationView *)self->_homeGrabberView setUserInteractionEnabled:0];
      [(id)SBApp addActiveOrientationObserver:self];
    }
    BOOL v19 = v29;
    self->_isHomeGrabberContainingViewAlwaysPortrait = v29;
    if (v19) {
      uint64_t v20 = [(id)SBApp activeInterfaceOrientation];
    }
    else {
      uint64_t v20 = 1;
    }
    [(SBHomeGrabberRotationView *)self->_homeGrabberView setOrientation:v20];
    [v5 addSubview:self->_homeGrabberView];
    v21 = [(SBHomeGrabberRotationView *)self->_homeGrabberView grabberView];
    [v21 setNeedsLayout];

    LODWORD(v21) = [(SBHomeGrabberRotationView *)self->_homeGrabberView isHidden];
    [(SBHomeGrabberRotationView *)self->_homeGrabberView setHidden:0];
    v22 = [(SBHomeGrabberRotationView *)self->_homeGrabberView grabberView];
    [v22 setHomeAffordanceInteractionEnabled:1];

    if (v21)
    {
      id v23 = (void *)MEMORY[0x1E4F4F680];
      v24 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
      v25 = [v23 settingsWithDuration:v24 timingFunction:0.25];

      v26 = [MEMORY[0x1E4F4F898] factoryWithSettings:v25];
      [v26 setAllowsAdditiveAnimations:1];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __59__SBKeyboardHomeAffordanceController__updateHomeAffordance__block_invoke;
      v27[3] = &unk_1E6AF4AC0;
      v27[4] = self;
      [MEMORY[0x1E4F4F898] animateWithFactory:v26 options:4 actions:v27 completion:0];
    }
    goto LABEL_17;
  }
  [(SBHomeGrabberRotationView *)self->_homeGrabberView setHidden:1];
  [(SBHomeGrabberRotationView *)self->_homeGrabberView setAlpha:0.0];
  id v7 = [(SBHomeGrabberRotationView *)self->_homeGrabberView grabberView];
  [v7 setHomeAffordanceInteractionEnabled:0];

LABEL_18:
}

uint64_t __59__SBKeyboardHomeAffordanceController__updateHomeAffordance__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:1.0];
}

- (void)_updateTopMostAssertion
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = self->_assertions;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (!v6) {
          goto LABEL_8;
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "sourceWindow", (void)v17);
        [v10 windowLevel];
        double v12 = v11;
        v13 = [v6 sourceWindow];
        [v13 windowLevel];
        double v15 = v14;

        if (v12 >= v15)
        {
LABEL_8:
          id v16 = v9;

          v6 = v16;
        }
      }
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  objc_storeWeak((id *)&self->_topMostAssertion, v6);
  [(SBKeyboardHomeAffordanceController *)self _updateHomeAffordance];
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  homeGrabberView = self->_homeGrabberView;
  if (homeGrabberView
    && self->_isHomeGrabberContainingViewAlwaysPortrait
    && [(SBHomeGrabberRotationView *)homeGrabberView orientation] != a3)
  {
    uint64_t v8 = +[SBAnimationUtilities animationSettingsForRotationFromInterfaceOrientation:[(SBHomeGrabberRotationView *)self->_homeGrabberView orientation] toInterfaceOrientation:a3];
    [(SBHomeGrabberRotationView *)self->_homeGrabberView setOrientation:a3 animated:1 rotationSettings:v8];
    v9 = SBLogHomeAffordance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = [(SBHomeGrabberRotationView *)self->_homeGrabberView grabberView];
      double v11 = BSInterfaceOrientationDescription();
      int v12 = 134218242;
      v13 = v10;
      __int16 v14 = 2114;
      double v15 = v11;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "grabber=%p rotating keyboard affordance to %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topMostAssertion);
  [WeakRetained additionalEdgeMargin];
  double v5 = v4;

  return v5;
}

- (BOOL)shouldAllowThinStyleForHomeGrabberView:(id)a3
{
  return 0;
}

- (BOOL)shouldAllowAutoHideForHomeGrabberView:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_topMostAssertion);
  objc_storeStrong((id *)&self->_homeGrabberView, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

void __52__SBKeyboardHomeAffordanceController_sharedInstance__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Attempted to make a home affordance keyboard assertion on a device that shouldn't.", v1, 2u);
}

@end