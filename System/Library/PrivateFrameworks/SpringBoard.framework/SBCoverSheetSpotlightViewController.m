@interface SBCoverSheetSpotlightViewController
- (BOOL)handleEvent:(id)a3;
- (BOOL)presentationCancelsTouches;
- (SBCoverSheetSpotlightViewController)initWithSpotlightViewController:(id)a3;
- (SBCoverSheetSpotlightViewControllerDelegate)delegate;
- (SBHHomePullToSearchSettings)searchTransitionSettings;
- (SBSpotlightPresentableViewController)spotlightViewController;
- (double)_scaleGivenTranslation:(double)a3;
- (double)maxPresentationOffset;
- (double)topOffset;
- (id)_newDisplayLayoutElement;
- (id)willBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4 needsInitialLayout:(BOOL *)a5;
- (void)_updatePresentationProgress:(double)a3 withOffset:(double)a4 velocity:(double)a5 presentationState:(int64_t)a6;
- (void)_updateSpotlightScale:(double)a3 interactive:(BOOL)a4;
- (void)addGrabberView:(id)a3;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)dismissForHomeButton;
- (void)handleBottomEdgeGestureChanged:(id)a3;
- (void)handleBottomEdgeGestureEnded:(id)a3;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setMaxPresentationOffset:(double)a3;
- (void)setSearchTransitionSettings:(id)a3;
- (void)setSpotlightViewController:(id)a3;
- (void)setTargetDisplayConfiguration:(id)a3;
- (void)setTopOffset:(double)a3;
- (void)updateComponentTransitionWithOffset:(double)a3 presentationState:(int64_t)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBCoverSheetSpotlightViewController

- (SBCoverSheetSpotlightViewController)initWithSpotlightViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBCoverSheetSpotlightViewController;
  v6 = [(SBCoverSheetSpotlightViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_spotlightViewController, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SBCoverSheetSpotlightViewController;
  [(CSCoverSheetViewControllerBase *)&v5 viewDidLoad];
  spotlightViewController = self->_spotlightViewController;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__SBCoverSheetSpotlightViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1E6AF6698;
  v4[4] = self;
  [(SBCoverSheetSpotlightViewController *)self bs_addChildViewController:spotlightViewController animated:0 transitionBlock:v4];
}

void __50__SBCoverSheetSpotlightViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  id v6 = [v3 view];
  objc_super v5 = [*(id *)(*(void *)(a1 + 32) + 1088) view];
  [v6 bounds];
  objc_msgSend(v5, "setFrame:");
  [v5 setAutoresizingMask:18];
  [v5 setAutoresizesSubviews:1];
  [v6 addSubview:v5];
  v4[2](v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBCoverSheetSpotlightViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillAppear:a3];
  [(CSCoverSheetViewControllerBase *)self setDisplayLayoutElementActive:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBCoverSheetSpotlightViewController;
  [(CSCoverSheetViewControllerBase *)&v5 viewDidDisappear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained coverSheetSpotlightViewControllerShouldDismiss:self animated:0];
}

- (void)invalidate
{
}

- (BOOL)presentationCancelsTouches
{
  return 0;
}

- (SBHHomePullToSearchSettings)searchTransitionSettings
{
  return [(SBSpotlightPresentableViewController *)self->_spotlightViewController searchTransitionSettings];
}

- (void)setSearchTransitionSettings:(id)a3
{
}

- (void)setTargetDisplayConfiguration:(id)a3
{
  spotlightViewController = self->_spotlightViewController;
  id v4 = a3;
  id v5 = [(SBSpotlightPresentableViewController *)spotlightViewController spotlightMultiplexingViewController];
  [v5 setTargetDisplayConfiguration:v4];
}

- (void)_updatePresentationProgress:(double)a3 withOffset:(double)a4 velocity:(double)a5 presentationState:(int64_t)a6
{
  [(SBSpotlightPresentableViewController *)self->_spotlightViewController setTopOffset:self->_topOffset];
  [(SBSpotlightPresentableViewController *)self->_spotlightViewController setMaxPresentationOffset:self->_maxPresentationOffset];
  [(SBSpotlightPresentableViewController *)self->_spotlightViewController updatePresentationProgress:a6 withOffset:a3 velocity:a4 presentationState:a5];
  [(SBCoverSheetSpotlightViewController *)self updateComponentTransitionWithOffset:a6 presentationState:a4];
}

- (id)willBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4 needsInitialLayout:(BOOL *)a5
{
  return [(SBSpotlightPresentableViewController *)self->_spotlightViewController willBeginModifyingPresentationProgressForState:a3 animated:a4 needsInitialLayout:a5];
}

- (void)updateComponentTransitionWithOffset:(double)a3 presentationState:(int64_t)a4
{
  v7 = [(SBCoverSheetSpotlightViewController *)self delegate];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  CSComponentTransitionInputsMake();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  CSComponentTransitionInputsMake();
  if (a4 == 1 && a3 == 0.0)
  {
    proudLockComponent = self->_proudLockComponent;
    self->_proudLockComponent = 0;

    dateViewComponent = self->_dateViewComponent;
    self->_dateViewComponent = 0;

    contentComponent = self->_contentComponent;
    self->_contentComponent = 0;

    wallpaperFloatingLayerComponent = self->_wallpaperFloatingLayerComponent;
    self->_wallpaperFloatingLayerComponent = 0;

    [v7 coverSheetSpotlightViewControllerRemoveContentView:self];
  }
  else
  {
    CSComponentTransitionInputsMake();
    long long v35 = v29;
    long long v36 = v30;
    long long v37 = v31;
    CSComponentTransitionInputsMake();
    long long v32 = v29;
    long long v33 = v30;
    long long v34 = v31;
    [v7 coverSheetSpotlightViewControllerAddContentView:self];
    v12 = objc_opt_new();
    v13 = [v12 priority:40];
    v14 = [v13 transitionModifiers:8];
    v15 = [v14 transitionInputs:&v29];
    v16 = [v15 shouldResideInALowerSubview:1];
    v17 = [v16 optOutOfAlphaFadesForPageScroll:0];
    v18 = self->_proudLockComponent;
    self->_proudLockComponent = v17;

    v19 = objc_opt_new();
    v20 = [v19 priority:40];
    v21 = [v20 transitionModifiers:8];
    long long v29 = v32;
    long long v30 = v33;
    long long v31 = v34;
    v22 = [v21 transitionInputs:&v29];
    v23 = self->_dateViewComponent;
    self->_dateViewComponent = v22;

    v24 = objc_opt_new();
    v25 = [v24 priority:40];
    v26 = [v25 transitionModifiers:8];
    long long v29 = v35;
    long long v30 = v36;
    long long v31 = v37;
    v27 = [v26 transitionInputs:&v29];
    v28 = self->_contentComponent;
    self->_contentComponent = v27;
  }
  [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBCoverSheetSpotlightViewController;
  if ([(CSCoverSheetViewControllerBase *)&v8 handleEvent:v4]
    && ([v4 isConsumable] & 1) != 0)
  {
    char v5 = [v4 isConsumable];
  }
  else
  {
    if ([v4 type] == 25)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained coverSheetSpotlightViewControllerShouldDismiss:self animated:0];
    }
    char v5 = 0;
  }

  return v5;
}

- (void)aggregateBehavior:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBCoverSheetSpotlightViewController;
  id v3 = a3;
  [(CSCoverSheetViewControllerBase *)&v4 aggregateBehavior:v3];
  objc_msgSend(v3, "setIdleTimerDuration:", 10, v4.receiver, v4.super_class);
  [v3 setIdleTimerMode:1];
  [v3 setNotificationBehavior:2];
}

- (void)aggregateAppearance:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBCoverSheetSpotlightViewController;
  [(CSCoverSheetViewControllerBase *)&v25 aggregateAppearance:v4];
  char v5 = [MEMORY[0x1E4F5E3C0] controlCenterGrabber];
  id v6 = [v5 priority:40];
  v7 = [v6 hidden:1];
  [v4 addComponent:v7];

  objc_super v8 = [MEMORY[0x1E4F5E3C0] footerCallToActionLabel];
  objc_super v9 = [v8 priority:40];
  v10 = [(CSCoverSheetViewControllerBase *)self coverSheetIdentifier];
  v11 = [v9 identifier:v10];
  v12 = [v11 hidden:1];
  [v4 addComponent:v12];

  v13 = [MEMORY[0x1E4F5E3C0] homeAffordance];
  v14 = [v13 priority:40];
  v15 = [(CSCoverSheetViewControllerBase *)self coverSheetIdentifier];
  v16 = [v14 identifier:v15];
  v17 = [v16 hidden:1];
  [v4 addComponent:v17];

  v18 = [MEMORY[0x1E4F5E3C0] whitePoint];
  v19 = [v18 priority:40];
  v20 = [(CSCoverSheetViewControllerBase *)self coverSheetIdentifier];
  v21 = [v19 identifier:v20];
  v22 = [v21 hidden:1];
  [v4 addComponent:v22];

  proudLockComponent = self->_proudLockComponent;
  if (proudLockComponent)
  {
    v24 = [(CSProudLockComponent *)proudLockComponent shouldResideInALowerSubview:1];
    [v4 addComponent:v24];
  }
  if (self->_dateViewComponent) {
    objc_msgSend(v4, "addComponent:");
  }
  if (self->_contentComponent) {
    objc_msgSend(v4, "addComponent:");
  }
  if (self->_wallpaperFloatingLayerComponent) {
    objc_msgSend(v4, "addComponent:");
  }
}

- (id)_newDisplayLayoutElement
{
  id v2 = objc_alloc(MEMORY[0x1E4FA6A68]);
  id v3 = (void *)[v2 initWithIdentifier:*MEMORY[0x1E4FA6F78]];
  [v3 setFillsDisplayBounds:1];
  [v3 setLayoutRole:6];
  return v3;
}

- (void)addGrabberView:(id)a3
{
  id v6 = a3;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    id v4 = [(SBCoverSheetSpotlightViewController *)self view];
    [v4 bounds];
    objc_msgSend(v6, "setFrame:");

    [v6 setAutoresizingMask:18];
    char v5 = [(SBSpotlightPresentableViewController *)self->_spotlightViewController scalingContentView];
    [v5 addSubview:v6];

    [v6 setAutoHides:0];
  }
}

- (void)handleBottomEdgeGestureChanged:(id)a3
{
  id v4 = a3;
  char v5 = [(SBCoverSheetSpotlightViewController *)self view];
  [v4 translationInView:v5];
  double v7 = v6;

  [(SBCoverSheetSpotlightViewController *)self _scaleGivenTranslation:v7];
  -[SBCoverSheetSpotlightViewController _updateSpotlightScale:interactive:](self, "_updateSpotlightScale:interactive:", 1);
}

- (void)handleBottomEdgeGestureEnded:(id)a3
{
  id v4 = a3;
  [(SBCoverSheetSpotlightViewController *)self _updateSpotlightScale:0 interactive:1.0];
  char v5 = [(SBCoverSheetSpotlightViewController *)self view];
  [v4 velocityInView:v5];
  double v7 = v6;

  objc_super v8 = [(SBCoverSheetSpotlightViewController *)self view];
  [v4 translationInView:v8];
  double v10 = v9;

  [(SBCoverSheetSpotlightViewController *)self _scaleGivenTranslation:v10 + v7 / 1000.0 * *MEMORY[0x1E4F43CE0] / (1.0 - *MEMORY[0x1E4F43CE0])];
  if (v11 < 0.98)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained coverSheetSpotlightViewControllerShouldDismiss:self animated:1];
  }
}

- (void)dismissForHomeButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained coverSheetSpotlightViewControllerShouldDismiss:self animated:1];
}

- (double)_scaleGivenTranslation:(double)a3
{
  id v4 = [(SBCoverSheetSpotlightViewController *)self view];
  [v4 bounds];
  double v6 = a3 / (v5 * 0.5) + 1.0;

  BSUIConstrainValueWithRubberBand();
  if (v6 >= 1.0) {
    double v8 = v7 + 1.0;
  }
  else {
    double v8 = 1.0 - v7;
  }
  return fmin(fmax(v8, 0.0), 1.1);
}

- (void)_updateSpotlightScale:(double)a3 interactive:(BOOL)a4
{
}

- (SBCoverSheetSpotlightViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBCoverSheetSpotlightViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBSpotlightPresentableViewController)spotlightViewController
{
  return self->_spotlightViewController;
}

- (void)setSpotlightViewController:(id)a3
{
}

- (double)topOffset
{
  return self->_topOffset;
}

- (void)setTopOffset:(double)a3
{
  self->_topOffset = a3;
}

- (double)maxPresentationOffset
{
  return self->_maxPresentationOffset;
}

- (void)setMaxPresentationOffset:(double)a3
{
  self->_maxPresentationOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wallpaperFloatingLayerComponent, 0);
  objc_storeStrong((id *)&self->_contentComponent, 0);
  objc_storeStrong((id *)&self->_dateViewComponent, 0);
  objc_storeStrong((id *)&self->_proudLockComponent, 0);
}

@end