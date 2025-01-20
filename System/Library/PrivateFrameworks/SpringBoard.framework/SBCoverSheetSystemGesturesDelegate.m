@interface SBCoverSheetSystemGesturesDelegate
- (BOOL)_areAnyGesturesRecognizedInSet:(id)a3;
- (BOOL)_canDismissGestureBegin;
- (BOOL)_canPresentGestureBegin;
- (BOOL)_isGestureActivelyRecognized:(id)a3;
- (BOOL)_isGestureAllowedByTransientOverlaysOrTopmostApp;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAnyGestureActivelyRecognized;
- (BOOL)isDismissGestureActive;
- (BOOL)isDismissGestureAllowedToBegin;
- (BOOL)isPresentGestureActive;
- (BOOL)isPresentGestureAllowedToBegin;
- (CSCoverSheetDismissGestureSettings)dismissGestureSettings;
- (SBCoverSheetSystemGestureDelegatePositionProviding)positionProvider;
- (SBCoverSheetSystemGesturesDelegate)initWithViewController:(id)a3 dismissGestureRecognizer:(id)a4 dismissAddendumGestureRecognizer:(id)a5 dismissalPreemptingGestureRecognizer:(id)a6;
- (SBFluidScrunchGestureRecognizer)scrunchDismissGestureRecognizer;
- (SBIndirectPanGestureRecognizer)indirectDismissGestureRecognizer;
- (SBIndirectPanGestureRecognizer)indirectPresentGestureRecognizer;
- (UIGestureRecognizer)dismissAddendumGestureRecognizer;
- (UIGestureRecognizer)dismissGestureRecognizer;
- (UIGestureRecognizer)preemptingGestureRecognizer;
- (UIPanGestureRecognizer)presentGestureRecognizer;
- (UIViewController)viewController;
- (id)dismissGestures;
- (id)presentGestures;
- (id)viewForSystemGestureRecognizer:(id)a3;
- (int)syntheticAppearState;
- (int64_t)indirectPanEffectiveInterfaceOrientation;
- (void)setDismissAddendumGestureRecognizer:(id)a3;
- (void)setDismissGestureRecognizer:(id)a3;
- (void)setDismissGestureSettings:(id)a3;
- (void)setIndirectDismissGestureRecognizer:(id)a3;
- (void)setIndirectPresentGestureRecognizer:(id)a3;
- (void)setPositionProvider:(id)a3;
- (void)setPreemptingGestureRecognizer:(id)a3;
- (void)setPresentGestureRecognizer:(id)a3;
- (void)setScrunchDismissGestureRecognizer:(id)a3;
- (void)setSyntheticAppearState:(int)a3;
- (void)setViewController:(id)a3;
@end

@implementation SBCoverSheetSystemGesturesDelegate

uint64_t __69__SBCoverSheetSystemGesturesDelegate__areAnyGesturesRecognizedInSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isGestureActivelyRecognized:a2];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)_isGestureActivelyRecognized:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 state] == 1 || objc_msgSend(v3, "state") == 2;

  return v4;
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  id v3 = [(SBCoverSheetSystemGesturesDelegate *)self viewController];
  BOOL v4 = [v3 view];

  return v4;
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (id)presentGestures
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  objc_msgSend(v3, "bs_safeAddObject:", self->_presentGestureRecognizer);
  objc_msgSend(v3, "bs_safeAddObject:", self->_indirectPresentGestureRecognizer);
  return v3;
}

- (BOOL)isAnyGestureActivelyRecognized
{
  id v3 = [(SBCoverSheetSystemGesturesDelegate *)self presentGestures];
  if ([(SBCoverSheetSystemGesturesDelegate *)self _areAnyGesturesRecognizedInSet:v3])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(SBCoverSheetSystemGesturesDelegate *)self dismissGestures];
    BOOL v4 = [(SBCoverSheetSystemGesturesDelegate *)self _areAnyGesturesRecognizedInSet:v5];
  }
  return v4;
}

- (BOOL)_areAnyGesturesRecognizedInSet:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__SBCoverSheetSystemGesturesDelegate__areAnyGesturesRecognizedInSet___block_invoke;
  v6[3] = &unk_1E6B09580;
  v6[4] = self;
  id v3 = objc_msgSend(a3, "bs_filter:", v6);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)dismissGestures
{
  v11[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dismissGestureRecognizer);
  v11[0] = WeakRetained;
  id v5 = objc_loadWeakRetained((id *)&self->_dismissAddendumGestureRecognizer);
  indirectDismissGestureRecognizer = self->_indirectDismissGestureRecognizer;
  scrunchDismissGestureRecognizer = self->_scrunchDismissGestureRecognizer;
  v11[1] = v5;
  v11[2] = indirectDismissGestureRecognizer;
  v11[3] = scrunchDismissGestureRecognizer;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  v9 = (void *)[v3 initWithArray:v8];

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBCoverSheetSystemGesturesDelegate *)self dismissGestureRecognizer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dismissAddendumGestureRecognizer);

  if (WeakRetained == v6 && v8 == v7)
  {
    BOOL v10 = 1;
  }
  else if (v8 == v6)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_preemptingGestureRecognizer);
    BOOL v10 = v11 == v7;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (UIGestureRecognizer)dismissGestureRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dismissGestureRecognizer);
  return (UIGestureRecognizer *)WeakRetained;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  p_dismissAddendumGestureRecognizer = &self->_dismissAddendumGestureRecognizer;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dismissAddendumGestureRecognizer);

  if (WeakRetained != v6) {
    return 1;
  }
  dismissGestureSettings = self->_dismissGestureSettings;
  return [(CSCoverSheetDismissGestureSettings *)dismissGestureSettings extendSwipeUpRegion];
}

- (SBCoverSheetSystemGesturesDelegate)initWithViewController:(id)a3 dismissGestureRecognizer:(id)a4 dismissAddendumGestureRecognizer:(id)a5 dismissalPreemptingGestureRecognizer:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBCoverSheetSystemGesturesDelegate;
  v14 = [(SBCoverSheetSystemGesturesDelegate *)&v20 init];
  v15 = v14;
  if (v14)
  {
    [(SBCoverSheetSystemGesturesDelegate *)v14 setViewController:v10];
    [(SBCoverSheetSystemGesturesDelegate *)v15 setDismissGestureRecognizer:v11];
    [(SBCoverSheetSystemGesturesDelegate *)v15 setDismissAddendumGestureRecognizer:v12];
    [(SBCoverSheetSystemGesturesDelegate *)v15 setPreemptingGestureRecognizer:v13];
    v16 = [MEMORY[0x1E4F5E408] rootSettings];
    uint64_t v17 = [v16 coverSheetDismissGestureSettings];
    dismissGestureSettings = v15->_dismissGestureSettings;
    v15->_dismissGestureSettings = (CSCoverSheetDismissGestureSettings *)v17;
  }
  return v15;
}

- (BOOL)isPresentGestureActive
{
  v2 = self;
  BOOL v3 = [(SBCoverSheetSystemGesturesDelegate *)self _canPresentGestureBegin];
  BOOL v4 = [(SBCoverSheetSystemGesturesDelegate *)v2 presentGestures];
  LOBYTE(v2) = [(SBCoverSheetSystemGesturesDelegate *)v2 _areAnyGesturesRecognizedInSet:v4];

  return v3 | v2;
}

- (BOOL)isPresentGestureAllowedToBegin
{
  return [(SBCoverSheetSystemGesturesDelegate *)self gestureRecognizerShouldBegin:self->_presentGestureRecognizer];
}

- (BOOL)isDismissGestureActive
{
  v2 = self;
  BOOL v3 = [(SBCoverSheetSystemGesturesDelegate *)self _canDismissGestureBegin];
  BOOL v4 = [(SBCoverSheetSystemGesturesDelegate *)v2 dismissGestures];
  LOBYTE(v2) = [(SBCoverSheetSystemGesturesDelegate *)v2 _areAnyGesturesRecognizedInSet:v4];

  return v3 | v2;
}

- (BOOL)isDismissGestureAllowedToBegin
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dismissGestureRecognizer);
  LOBYTE(v2) = [(SBCoverSheetSystemGesturesDelegate *)v2 gestureRecognizerShouldBegin:WeakRetained];

  return (char)v2;
}

- (void)setPresentGestureRecognizer:(id)a3
{
  p_presentGestureRecognizer = &self->_presentGestureRecognizer;
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_presentGestureRecognizer, a3);
  }
}

- (int64_t)indirectPanEffectiveInterfaceOrientation
{
  return [(id)SBApp activeInterfaceOrientation];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (SBIndirectPanGestureRecognizer *)a3;
  id v5 = SBLogSystemGestureCoverSheet();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(UIGestureRecognizer *)v4 sb_briefDescription];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBCoverSheetSystemGesturesDelegate gestureRecognizerShouldBegin - %{public}@", (uint8_t *)&buf, 0xCu);
  }
  id v7 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v8 = [v7 policyAggregator];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__88;
  v63 = __Block_byref_object_dispose__88;
  id v64 = 0;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __67__SBCoverSheetSystemGesturesDelegate_gestureRecognizerShouldBegin___block_invoke;
  v57[3] = &unk_1E6B095A8;
  v57[4] = &buf;
  v9 = (void (**)(void, void))MEMORY[0x1D948C7A0](v57);
  id v10 = [(SBCoverSheetSystemGesturesDelegate *)self presentGestures];
  int v11 = [v10 containsObject:v4];

  if (v11)
  {
    id v56 = 0;
    char v12 = [v8 allowsCapability:12 explanation:&v56];
    id v13 = v56;
    if (v12)
    {
      v14 = +[SBSystemGestureManager mainDisplayManager];
      int v15 = [v14 isGestureWithTypeAllowed:1];

      BOOL v16 = [(SBCoverSheetSystemGesturesDelegate *)self _canPresentGestureBegin];
      BOOL v17 = [(SBCoverSheetSystemGesturesDelegate *)self _isGestureAllowedByTransientOverlaysOrTopmostApp];
      v18 = +[SBControlCenterController sharedInstance];
      int v19 = [v18 allowGestureForContentBelow];

      if ((v16 & v15 & v17 & v19 & 1) == 0)
      {
        if ((v15 & 1) == 0) {
          ((void (**)(void, __CFString *))v9)[2](v9, @"gesture with type SBSystemGestureTypeShowCoverSheet is not allowed by SBSystemGestureManager");
        }
        if (!v16) {
          ((void (**)(void, __CFString *))v9)[2](v9, @"_canPresentGestureBegin is NO");
        }
        if (!v17) {
          ((void (**)(void, __CFString *))v9)[2](v9, @"Not allowed by transient overlays or topmost app");
        }
        if ((v19 & 1) == 0) {
          ((void (**)(void, __CFString *))v9)[2](v9, @"Not allowed by control center");
        }
        goto LABEL_22;
      }
LABEL_41:
      BOOL v35 = 1;
      goto LABEL_26;
    }
    v33 = [NSString stringWithFormat:@"CoverSheet capability disallowed by policy aggregator: %@", v13];
    ((void (**)(void, void *))v9)[2](v9, v33);
    goto LABEL_21;
  }
  objc_super v20 = [(SBCoverSheetSystemGesturesDelegate *)self dismissGestures];
  int v21 = [v20 containsObject:v4];

  if (v21)
  {
    id v55 = 0;
    char v22 = [v8 allowsCapability:13 explanation:&v55];
    id v13 = v55;
    if (v22)
    {
      int v23 = [(CSCoverSheetDismissGestureSettings *)self->_dismissGestureSettings extendSwipeUpRegion];
      id WeakRetained = (SBIndirectPanGestureRecognizer *)objc_loadWeakRetained((id *)&self->_dismissAddendumGestureRecognizer);
      BOOL v25 = WeakRetained == v4;

      if ((v25 & v23) == 1)
      {
        [(CSCoverSheetDismissGestureSettings *)self->_dismissGestureSettings extendedRegionInsetX];
        CGFloat v27 = v26;
        v28 = [(SBCoverSheetSystemGesturesDelegate *)self viewForSystemGestureRecognizer:v4];
        [v28 bounds];
        CGRect v67 = CGRectInset(v66, v27, 0.0);
        CGFloat x = v67.origin.x;
        CGFloat y = v67.origin.y;
        CGFloat width = v67.size.width;
        CGFloat height = v67.size.height;
        _UISystemGestureLocationInView();
        v68.origin.CGFloat x = x;
        v68.origin.CGFloat y = y;
        v68.size.CGFloat width = width;
        v68.size.CGFloat height = height;
        CGRectGetMinX(v68);
        if (BSFloatGreaterThanOrEqualToFloat())
        {
          v69.origin.CGFloat x = x;
          v69.origin.CGFloat y = y;
          v69.size.CGFloat width = width;
          v69.size.CGFloat height = height;
          CGRectGetMaxX(v69);
          int v54 = BSFloatLessThanOrEqualToFloat();
        }
        else
        {
          int v54 = 0;
        }
      }
      else
      {
        int v54 = 1;
      }
      v37 = +[SBSystemGestureManager mainDisplayManager];
      int v53 = [v37 isGestureWithTypeAllowed:2];

      v38 = +[SBWorkspace mainWorkspace];
      v39 = [v38 transientOverlayPresentationManager];
      int v40 = [v39 hasActivePresentation];

      v41 = +[SBControlCenterController sharedInstance];
      int v42 = [v41 isPresented];

      indirectDismissGestureRecognizer = self->_indirectDismissGestureRecognizer;
      BOOL v44 = indirectDismissGestureRecognizer == v4;
      if (indirectDismissGestureRecognizer == v4) {
        char v45 = v42;
      }
      else {
        char v45 = 1;
      }
      if (v44) {
        int v42 = 1;
      }
      if ((v45 & 1) == 0)
      {
        v46 = +[SBControlCenterController sharedInstance];
        int v42 = [v46 isVisible];
      }
      v47 = +[SBCoverSheetPresentationManager sharedInstance];
      int v48 = [v47 hasBeenDismissedSinceKeybagLock];

      int v49 = SBHomeGestureEnabled();
      int v50 = [(SBCoverSheetSystemGesturesDelegate *)self _canDismissGestureBegin];
      if (((v50 ^ 1 | v49) & 1) == 0)
      {
        v51 = [(id)SBApp authenticationController];
        int v52 = [v51 isAuthenticated];

        int v50 = v52 & v48;
      }
      if ((v50 & v53 & ~v40 & ~v42 & v54 & 1) == 0)
      {
        if (((v50 | v49 ^ 1) & 1) == 0) {
          ((void (**)(void, __CFString *))v9)[2](v9, @"either _canDismissGestureBegin is NO or can't pull up when not authenticated and not in notification center mode");
        }
        if ((v53 & 1) == 0) {
          ((void (**)(void, __CFString *))v9)[2](v9, @"gesture with type SBSystemGestureTypeDismissCoverSheet is not allowed by SBSystemGestureManager");
        }
        if (v40) {
          ((void (**)(void, __CFString *))v9)[2](v9, @"transient overlay is visible");
        }
        if (v42) {
          ((void (**)(void, __CFString *))v9)[2](v9, @"control center is visible");
        }
        if ((v54 & 1) == 0) {
          ((void (**)(void, __CFString *))v9)[2](v9, @"isn't within X margin");
        }
        goto LABEL_22;
      }
      goto LABEL_41;
    }
    v33 = [NSString stringWithFormat:@"Dismiss CoverSheet capability disallowed by policy aggregator: %@", v13];
    ((void (**)(void, void *))v9)[2](v9, v33);
LABEL_21:

LABEL_22:
  }
  id v13 = SBLogSystemGestureCoverSheet();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)v58 = 138543362;
    uint64_t v59 = v34;
    _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "should not begin for reason: %{public}@", v58, 0xCu);
  }
  BOOL v35 = 0;
LABEL_26:

  _Block_object_dispose(&buf, 8);
  return v35;
}

void __67__SBCoverSheetSystemGesturesDelegate_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = a2;
  if (v3)
  {
    [v3 appendFormat:@" | "];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendString:a2];
}

- (BOOL)_isGestureAllowedByTransientOverlaysOrTopmostApp
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = +[SBWorkspace mainWorkspace];
  BOOL v3 = [v2 transientOverlayPresentationManager];

  if ([v3 shouldDisableCoverSheetGesture])
  {
    id v4 = SBLogSystemGestureCoverSheet();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Not allowing transition because transient overlays suppress CoverSheet.", buf, 2u);
    }
LABEL_18:
    BOOL v7 = 0;
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v5 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  char v6 = [v5 isAnySwitcherVisible];

  if ((v6 & 1) == 0)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
    uint64_t v8 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v4);
          }
          char v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "application", (void)v16);
          int v13 = [v12 suppressesCoverSheetGesture];

          if (v13)
          {
            v14 = SBLogSystemGestureCoverSheet();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Not allowing transition because the top app suppresses CoverSheet.", buf, 2u);
            }

            goto LABEL_18;
          }
        }
        uint64_t v9 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
        BOOL v7 = 1;
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v7 = 1;
    }
    goto LABEL_19;
  }
  BOOL v7 = 1;
LABEL_20:

  return v7;
}

- (BOOL)_canDismissGestureBegin
{
  if ([(SBCoverSheetSystemGesturesDelegate *)self syntheticAppearState] - 1 > 1) {
    return 0;
  }
  else {
    return ![(SBCoverSheetSystemGesturesDelegate *)self isAnyGestureActivelyRecognized];
  }
}

- (BOOL)_canPresentGestureBegin
{
  int v3 = [(SBCoverSheetSystemGesturesDelegate *)self syntheticAppearState];
  if (v3 != 3 && v3) {
    return 0;
  }
  else {
    return ![(SBCoverSheetSystemGesturesDelegate *)self isAnyGestureActivelyRecognized];
  }
}

- (SBCoverSheetSystemGestureDelegatePositionProviding)positionProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_positionProvider);
  return (SBCoverSheetSystemGestureDelegatePositionProviding *)WeakRetained;
}

- (void)setPositionProvider:(id)a3
{
}

- (UIPanGestureRecognizer)presentGestureRecognizer
{
  return self->_presentGestureRecognizer;
}

- (SBIndirectPanGestureRecognizer)indirectPresentGestureRecognizer
{
  return self->_indirectPresentGestureRecognizer;
}

- (void)setIndirectPresentGestureRecognizer:(id)a3
{
}

- (SBIndirectPanGestureRecognizer)indirectDismissGestureRecognizer
{
  return self->_indirectDismissGestureRecognizer;
}

- (void)setIndirectDismissGestureRecognizer:(id)a3
{
}

- (SBFluidScrunchGestureRecognizer)scrunchDismissGestureRecognizer
{
  return self->_scrunchDismissGestureRecognizer;
}

- (void)setScrunchDismissGestureRecognizer:(id)a3
{
}

- (int)syntheticAppearState
{
  return self->_syntheticAppearState;
}

- (void)setSyntheticAppearState:(int)a3
{
  self->_syntheticAppearState = a3;
}

- (void)setViewController:(id)a3
{
}

- (void)setDismissGestureRecognizer:(id)a3
{
}

- (UIGestureRecognizer)dismissAddendumGestureRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dismissAddendumGestureRecognizer);
  return (UIGestureRecognizer *)WeakRetained;
}

- (void)setDismissAddendumGestureRecognizer:(id)a3
{
}

- (UIGestureRecognizer)preemptingGestureRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preemptingGestureRecognizer);
  return (UIGestureRecognizer *)WeakRetained;
}

- (void)setPreemptingGestureRecognizer:(id)a3
{
}

- (CSCoverSheetDismissGestureSettings)dismissGestureSettings
{
  return self->_dismissGestureSettings;
}

- (void)setDismissGestureSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissGestureSettings, 0);
  objc_destroyWeak((id *)&self->_preemptingGestureRecognizer);
  objc_destroyWeak((id *)&self->_dismissAddendumGestureRecognizer);
  objc_destroyWeak((id *)&self->_dismissGestureRecognizer);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_scrunchDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectPresentGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_presentGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_positionProvider);
}

@end