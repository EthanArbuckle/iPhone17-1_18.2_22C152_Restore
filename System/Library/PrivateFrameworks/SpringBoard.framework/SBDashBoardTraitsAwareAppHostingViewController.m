@interface SBDashBoardTraitsAwareAppHostingViewController
- (CGRect)_referenceBoundsForBounds:(CGRect)a3;
- (SBApplicationHosting)appHosting;
- (SBDashBoardTraitsAwareAppHostingViewController)initWithAppHosting:(id)a3 targetWindow:(id)a4;
- (SBTraitsOrientedContentViewController)orientedContentViewController;
- (SBTraitsSceneParticipantDelegate)traitsParticipantDelegate;
- (TRAParticipant)traitsParticipant;
- (UIWindow)targetWindow;
- (id)_effectiveWindow;
- (id)_hostedAppViewController;
- (id)_hostedSceneHandle;
- (id)_traitsArbiter;
- (void)_acquireTraitsParticipantIfNeeded;
- (void)_invalidateTraitsParticipant;
- (void)_updateWindowLevel;
- (void)dealloc;
- (void)sceneDidAttach;
- (void)sceneWasDestroyed;
- (void)setAppHosting:(id)a3;
- (void)setContentViewBounds:(CGRect)a3;
- (void)setOrientedContentViewController:(id)a3;
- (void)setTargetWindow:(id)a3;
- (void)setTraitsParticipant:(id)a3;
- (void)setTraitsParticipantDelegate:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBDashBoardTraitsAwareAppHostingViewController

- (SBDashBoardTraitsAwareAppHostingViewController)initWithAppHosting:(id)a3 targetWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBDashBoardTraitsAwareAppHostingViewController;
  v8 = [(SBDashBoardTraitsAwareAppHostingViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_appHosting, v6);
    objc_storeStrong((id *)&v9->_targetWindow, a4);
    [(SBDashBoardTraitsAwareAppHostingViewController *)v9 _acquireTraitsParticipantIfNeeded];
  }

  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardTraitsAwareAppHostingViewController;
  [(SBDashBoardTraitsAwareAppHostingViewController *)&v4 viewWillAppear:a3];
  [(SBDashBoardTraitsAwareAppHostingViewController *)self _acquireTraitsParticipantIfNeeded];
  [(SBDashBoardTraitsAwareAppHostingViewController *)self _updateWindowLevel];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardTraitsAwareAppHostingViewController;
  [(SBDashBoardTraitsAwareAppHostingViewController *)&v4 viewWillDisappear:a3];
  [(SBDashBoardTraitsAwareAppHostingViewController *)self _invalidateTraitsParticipant];
}

- (void)setAppHosting:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appHosting);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_appHosting, obj);
    [(SBDashBoardTraitsAwareAppHostingViewController *)self _acquireTraitsParticipantIfNeeded];
    v5 = obj;
  }
}

- (void)setContentViewBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(SBTraitsOrientedContentViewController *)self->_orientedContentViewController view];
  objc_msgSend(v8, "setFrame:", x, y, width, height);

  id v9 = [(SBTraitsOrientedContentViewController *)self->_orientedContentViewController view];
  -[SBDashBoardTraitsAwareAppHostingViewController _referenceBoundsForBounds:](self, "_referenceBoundsForBounds:", x, y, width, height);
  objc_msgSend(v9, "setContentViewBoundsInReferenceSpace:");
}

- (void)sceneDidAttach
{
  [(SBDashBoardTraitsAwareAppHostingViewController *)self _acquireTraitsParticipantIfNeeded];
  [(SBDashBoardTraitsAwareAppHostingViewController *)self _updateWindowLevel];
}

- (void)sceneWasDestroyed
{
  [(SBDashBoardTraitsAwareAppHostingViewController *)self _invalidateTraitsParticipant];
  [(SBDashBoardTraitsAwareAppHostingViewController *)self _updateWindowLevel];
}

- (SBTraitsOrientedContentViewController)orientedContentViewController
{
  return self->_orientedContentViewController;
}

- (id)_traitsArbiter
{
  objc_super v4 = [(SBDashBoardTraitsAwareAppHostingViewController *)self _effectiveWindow];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 _sbWindowScene];
    id v7 = [v6 traitsArbiter];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBDashBoardTraitsAwareAppHostingViewController.m" lineNumber:93 description:@"Unexpected nil window"];
    id v7 = 0;
  }

  return v7;
}

- (id)_hostedSceneHandle
{
  v2 = [(SBDashBoardTraitsAwareAppHostingViewController *)self _hostedAppViewController];
  v3 = [v2 applicationSceneHandle];

  return v3;
}

- (id)_hostedAppViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appHosting);
  uint64_t v3 = objc_opt_class();
  id v4 = WeakRetained;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)_effectiveWindow
{
  uint64_t v3 = [(SBDashBoardTraitsAwareAppHostingViewController *)self view];
  targetWindow = [v3 window];
  v5 = targetWindow;
  if (!targetWindow) {
    targetWindow = self->_targetWindow;
  }
  id v6 = targetWindow;

  return v6;
}

- (void)_updateWindowLevel
{
  uint64_t v3 = [(SBDashBoardTraitsAwareAppHostingViewController *)self _effectiveWindow];
  if (v3)
  {
    traitsParticipantDelegate = self->_traitsParticipantDelegate;
    v5 = NSNumber;
    id v7 = v3;
    [v3 windowLevel];
    id v6 = objc_msgSend(v5, "numberWithDouble:");
    [(SBTraitsSceneParticipantDelegate *)traitsParticipantDelegate setPreferredSceneLevel:v6];

    uint64_t v3 = v7;
  }
}

- (void)_acquireTraitsParticipantIfNeeded
{
  if (self->_traitsParticipant
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_appHosting), WeakRetained, !WeakRetained))
  {
    id v48 = [(SBTraitsOrientedContentViewController *)self->_orientedContentViewController view];
    uint64_t v3 = [(SBDashBoardTraitsAwareAppHostingViewController *)self view];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    objc_msgSend(v48, "setFrame:", v5, v7, v9, v11);
    -[SBDashBoardTraitsAwareAppHostingViewController _referenceBoundsForBounds:](self, "_referenceBoundsForBounds:", v5, v7, v9, v11);
    objc_msgSend(v48, "setContentViewBoundsInReferenceSpace:");
  }
  else
  {
    v13 = [(SBDashBoardTraitsAwareAppHostingViewController *)self _effectiveWindow];
    if (v13)
    {
      v14 = [(SBDashBoardTraitsAwareAppHostingViewController *)self _hostedAppViewController];
      [v14 setMode:2];

      v15 = [(SBDashBoardTraitsAwareAppHostingViewController *)self _traitsArbiter];
      v16 = [SBTraitsSceneParticipantDelegate alloc];
      v17 = [(SBDashBoardTraitsAwareAppHostingViewController *)self _hostedSceneHandle];
      v18 = [(SBTraitsSceneParticipantDelegate *)v16 initWithSceneHandle:v17];
      traitsParticipantDelegate = self->_traitsParticipantDelegate;
      self->_traitsParticipantDelegate = v18;

      v20 = [v15 acquireParticipantWithRole:@"SBTraitsParticipantRoleCoverSheetPosterSwitcher" delegate:self->_traitsParticipantDelegate];
      traitsParticipant = self->_traitsParticipant;
      self->_traitsParticipant = v20;

      [(SBTraitsSceneParticipantDelegate *)self->_traitsParticipantDelegate setArbiter:v15];
      [(SBTraitsSceneParticipantDelegate *)self->_traitsParticipantDelegate setParticipant:self->_traitsParticipant];
      v22 = self->_traitsParticipantDelegate;
      v23 = NSNumber;
      [v13 windowLevel];
      v24 = objc_msgSend(v23, "numberWithDouble:");
      [(SBTraitsSceneParticipantDelegate *)v22 setPreferredSceneLevel:v24];

      v25 = [[SBTraitsOrientedContentViewController alloc] initWithNibName:0 bundle:0];
      orientedContentViewController = self->_orientedContentViewController;
      self->_orientedContentViewController = v25;

      [(SBTraitsOrientedContentViewController *)self->_orientedContentViewController setContentParticipant:self->_traitsParticipant];
      uint64_t v27 = objc_opt_class();
      v28 = SBSafeCast(v27, v13);
      v29 = v28;
      if (v28)
      {
        v30 = self->_orientedContentViewController;
        v31 = [v28 traitsParticipant];
        [(SBTraitsOrientedContentViewController *)v30 setContainerParticipant:v31];
      }
      v32 = [(SBDashBoardTraitsAwareAppHostingViewController *)self view];
      [v32 bounds];
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      double v40 = v39;

      v41 = [(SBTraitsOrientedContentViewController *)self->_orientedContentViewController view];
      objc_msgSend(v41, "setFrame:", v34, v36, v38, v40);
      -[SBDashBoardTraitsAwareAppHostingViewController _referenceBoundsForBounds:](self, "_referenceBoundsForBounds:", v34, v36, v38, v40);
      objc_msgSend(v41, "setContentViewBoundsInReferenceSpace:");
      [v41 setAutoresizingMask:18];
      v42 = self->_orientedContentViewController;
      v43 = [(SBDashBoardTraitsAwareAppHostingViewController *)self _hostedAppViewController];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __83__SBDashBoardTraitsAwareAppHostingViewController__acquireTraitsParticipantIfNeeded__block_invoke;
      v55[3] = &unk_1E6AF53D0;
      id v44 = v41;
      id v56 = v44;
      v57 = self;
      [(SBTraitsOrientedContentViewController *)v42 bs_addChildViewController:v43 animated:0 transitionBlock:v55];

      objc_initWeak(&location, self);
      v45 = self->_traitsParticipantDelegate;
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __83__SBDashBoardTraitsAwareAppHostingViewController__acquireTraitsParticipantIfNeeded__block_invoke_2;
      v52[3] = &unk_1E6AF9470;
      objc_copyWeak(&v53, &location);
      [(SBTraitsSceneParticipantDelegate *)v45 setActuateOrientationAlongsideBlock:v52];
      v46 = self->_orientedContentViewController;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __83__SBDashBoardTraitsAwareAppHostingViewController__acquireTraitsParticipantIfNeeded__block_invoke_3;
      v50[3] = &unk_1E6AF9498;
      objc_copyWeak(&v51, &location);
      [(SBTraitsOrientedContentViewController *)v46 setActuateAlongsideBlock:v50];
      [(TRAParticipant *)self->_traitsParticipant setNeedsUpdatePreferencesWithReason:@"setup"];
      v47 = self->_orientedContentViewController;
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __83__SBDashBoardTraitsAwareAppHostingViewController__acquireTraitsParticipantIfNeeded__block_invoke_4;
      v49[3] = &unk_1E6AF6698;
      v49[4] = self;
      [(SBDashBoardTraitsAwareAppHostingViewController *)self bs_addChildViewController:v47 animated:0 transitionBlock:v49];
      objc_destroyWeak(&v51);
      objc_destroyWeak(&v53);
      objc_destroyWeak(&location);
    }
  }
}

void __83__SBDashBoardTraitsAwareAppHostingViewController__acquireTraitsParticipantIfNeeded__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _hostedAppViewController];
  v2 = [v3 view];
  [v1 setContentView:v2];
}

void __83__SBDashBoardTraitsAwareAppHostingViewController__acquireTraitsParticipantIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[125] updateOrientationIfNeeded];
    id WeakRetained = v2;
  }
}

void __83__SBDashBoardTraitsAwareAppHostingViewController__acquireTraitsParticipantIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2, double a3, double a4)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v9 = WeakRetained;
    id v8 = objc_loadWeakRetained(WeakRetained + 122);
    objc_msgSend(v8, "setHostedAppReferenceSize:withInterfaceOrientation:", a2, a3, a4);

    id WeakRetained = v9;
  }
}

void __83__SBDashBoardTraitsAwareAppHostingViewController__acquireTraitsParticipantIfNeeded__block_invoke_4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) view];
  v2 = [*(id *)(*(void *)(a1 + 32) + 1000) view];
  [v3 addSubview:v2];
}

- (void)_invalidateTraitsParticipant
{
  [(TRAParticipant *)self->_traitsParticipant invalidate];
  [(SBTraitsSceneParticipantDelegate *)self->_traitsParticipantDelegate invalidate];
  traitsParticipantDelegate = self->_traitsParticipantDelegate;
  self->_traitsParticipantDelegate = 0;

  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = 0;
}

- (CGRect)_referenceBoundsForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = CGRectGetHeight(a3);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double v8 = CGRectGetWidth(v13);
  if (v7 >= v8) {
    double v9 = v8;
  }
  else {
    double v9 = v7;
  }
  if (v7 >= v8) {
    double v10 = v7;
  }
  else {
    double v10 = v8;
  }
  double v11 = x;
  double v12 = y;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)dealloc
{
  [(TRAParticipant *)self->_traitsParticipant invalidate];
  [(SBTraitsSceneParticipantDelegate *)self->_traitsParticipantDelegate invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardTraitsAwareAppHostingViewController;
  [(SBDashBoardTraitsAwareAppHostingViewController *)&v3 dealloc];
}

- (SBApplicationHosting)appHosting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appHosting);
  return (SBApplicationHosting *)WeakRetained;
}

- (TRAParticipant)traitsParticipant
{
  return self->_traitsParticipant;
}

- (void)setTraitsParticipant:(id)a3
{
}

- (SBTraitsSceneParticipantDelegate)traitsParticipantDelegate
{
  return self->_traitsParticipantDelegate;
}

- (void)setTraitsParticipantDelegate:(id)a3
{
}

- (void)setOrientedContentViewController:(id)a3
{
}

- (UIWindow)targetWindow
{
  return self->_targetWindow;
}

- (void)setTargetWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetWindow, 0);
  objc_storeStrong((id *)&self->_orientedContentViewController, 0);
  objc_storeStrong((id *)&self->_traitsParticipantDelegate, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_destroyWeak((id *)&self->_appHosting);
}

@end