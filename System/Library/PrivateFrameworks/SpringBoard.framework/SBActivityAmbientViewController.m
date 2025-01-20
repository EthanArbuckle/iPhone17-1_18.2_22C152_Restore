@interface SBActivityAmbientViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_canTransitionActivityItem:(id)a3 forTransitionType:(int64_t)a4;
- (BOOL)_isActiveActivityItem:(id)a3;
- (BOOL)_itemIsFirstPartyActivity:(id)a3;
- (BOOL)_layerHasGaussianBlurFilter:(id)a3;
- (BOOL)_transitionTypeIsToFullOverlay:(int64_t)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isTransitioning;
- (BOOL)wantsIdleTimerDisabled;
- (CGRect)_compactOverlayFrameForContentSize:(CGSize)a3;
- (NSSet)audioCategoriesDisablingVolumeHUD;
- (SBActivityAmbientCompactOverlayViewController)compactOverlayViewController;
- (SBActivityAmbientFullOverlayViewController)fullOverlayViewController;
- (SBActivityAmbientViewController)initWithPrimaryActivityItem:(id)a3 overlayMode:(int64_t)a4;
- (SBActivityAmbientViewControllerDelegate)delegate;
- (SBActivityItem)primaryActivityItem;
- (SBActivityItem)secondaryActivityItem;
- (double)_blurWeightingForFullOverlayDismissalWithTranslation:(double)a3;
- (double)_cornerRadiusForFullOverlayDismissalWithTranslation:(double)a3;
- (double)_scaleForFullOverlayDismissalWithTranslation:(double)a3;
- (id)_addNewSwitchingTransitionViewBelowSubview:(id)a3;
- (id)_ambientActivitySettings;
- (id)_animationSettingsForFullOverlayDrag;
- (id)_animationSettingsForFullOverlayDragCancel;
- (id)_animationSettingsForFullOverlayTransitionYCurve;
- (id)_animationSettingsForTransitionType:(int64_t)a3;
- (id)_nextSecondaryActivityItemForTransitionType:(int64_t)a3;
- (int64_t)overlayMode;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addDismissGesture;
- (void)_addGaussianBlurToLayer:(id)a3 inputRadius:(double)a4;
- (void)_addNewBackgroundBlurMaterialViewWithInitialWeighting:(double)a3 hidden:(BOOL)a4;
- (void)_addNewCompactOverlayTransitionViewWithParentView:(id)a3 alpha:(double)a4;
- (void)_addNewFullOverlayTransitionBlurMaterialViewWithParentView:(id)a3 initialWeighting:(double)a4 hidden:(BOOL)a5;
- (void)_addOverlayForPrimaryActivity;
- (void)_addSecondaryActivityItemIfAvailable;
- (void)_animatePresentationOfCompactOverlayWithCompactViewController:(id)a3 completion:(id)a4;
- (void)_animatePresentationOfFullOverlayWithViewController:(id)a3 completion:(id)a4;
- (void)_animateTransitionToBecomeNewPrimaryAcivityWithItem:(id)a3 transitionType:(int64_t)a4 fullOverlayViewController:(id)a5 compactOverlayViewControllerForTransition:(id)a6 oldFullViewController:(id)a7 oldCompactViewController:(id)a8 completion:(id)a9;
- (void)_animateTransitionToCompactOverlayForItem:(id)a3 transitionType:(int64_t)a4 compactOverlayViewController:(id)a5 completion:(id)a6;
- (void)_animateTransitionToFullOverlayForPrimaryActivityItem:(id)a3 transitionType:(int64_t)a4 fullOverlayViewControllerForTransition:(id)a5 oldCompactOverlayViewController:(id)a6 completion:(id)a7;
- (void)_beginFullOverlayDragWithTranslation:(CGPoint)a3;
- (void)_beginTransitionForActivityItem:(id)a3 transitionType:(int64_t)a4 withCompletion:(id)a5;
- (void)_cancelFullOverlayDrag;
- (void)_cleanupBackgroundBlurViewIfNecessary;
- (void)_cleanupCompactViewController:(id)a3;
- (void)_cleanupCurrentCompactOverlayViewController;
- (void)_cleanupCurrentFullOverlayViewController;
- (void)_cleanupFullViewController:(id)a3;
- (void)_cleanupSwitchingTransitionView;
- (void)_cleanupTransitionBlurViewIfNecessary;
- (void)_compactOverlayViewControllerForItem:(id)a3 completion:(id)a4;
- (void)_didUpdateVisibleActivityItems;
- (void)_dismissCompactOverlayForActivityEnding:(BOOL)a3 completion:(id)a4;
- (void)_dismissCompactOverlayWithView:(id)a3 forActivityEnding:(BOOL)a4 completion:(id)a5;
- (void)_dismissFullOverlayWithCompletion:(id)a3;
- (void)_endAndCleanupTransitionForActivityItem:(id)a3 forTransitionType:(int64_t)a4 compactOverlayViewController:(id)a5 fullOverlayViewController:(id)a6 completion:(id)a7;
- (void)_fullOverlayViewControllerForItem:(id)a3 completion:(id)a4;
- (void)_handleDismissGesture:(id)a3;
- (void)_handleDismissGestureBegan:(id)a3;
- (void)_handleDismissGestureChanged:(id)a3;
- (void)_handleDismissGestureEnded:(id)a3;
- (void)_layoutCompactOverlayIfNecessaryWithView:(id)a3 frame:(CGRect)a4;
- (void)_layoutFullOverlayWithActivityView:(id)a3;
- (void)_prepareFullOverlayViewForDragWithLocation:(CGPoint)a3;
- (void)_removeDismissGesture;
- (void)_removeGaussianBlurFromLayer:(id)a3;
- (void)_resetPrimaryActivityItemWithCompletion:(id)a3;
- (void)_setAnchorPointForDrag:(CGPoint)a3 forView:(id)a4;
- (void)_setPrimaryActivityItem:(id)a3;
- (void)_setSecondaryActivityItem:(id)a3;
- (void)_transitionOverlayForActivityItem:(id)a3 withTransitionType:(int64_t)a4 withCompletion:(id)a5;
- (void)_updateAudioCategoriesDisablingVolumeHUD;
- (void)_updateCompactActivityOverlayWithItem:(id)a3 withCompletion:(id)a4;
- (void)_updateFullActivityOverlayWithItem:(id)a3;
- (void)activityViewController:(id)a3 didSetIdleTimerDisabled:(BOOL)a4;
- (void)activityViewControllerContentRequestsCancellingGesture:(id)a3;
- (void)activityViewControllerDidUpdateAudioCategoriesDisablingVolumeHUD:(id)a3;
- (void)addOverlayForPrimaryActivityItem:(id)a3 withOverlayMode:(int64_t)a4;
- (void)addOverlayForSecondaryActivityItem:(id)a3;
- (void)alertActivityItem:(id)a3 withAlertBlock:(id)a4;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)handleTapForCompactOverlayViewController:(id)a3 withActivityItem:(id)a4;
- (void)invalidate;
- (void)loadView;
- (void)removeOverlayForActivityItem:(id)a3 withCompletion:(id)a4;
- (void)setCompactOverlayHidden:(BOOL)a3;
- (void)setCompactOverlayViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFullOverlayViewController:(id)a3;
- (void)transitionToCompactOverlayMode;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SBActivityAmbientViewController

- (SBActivityAmbientViewController)initWithPrimaryActivityItem:(id)a3 overlayMode:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBActivityAmbientViewController;
  v7 = [(SBActivityAmbientViewController *)&v10 initWithNibName:0 bundle:0];
  v8 = v7;
  if (v7)
  {
    v7->_overlayMode = a4;
    [(SBActivityAmbientViewController *)v7 _setPrimaryActivityItem:v6];
  }

  return v8;
}

- (void)dealloc
{
  [(SBActivityAmbientViewController *)self _removeDismissGesture];
  v3.receiver = self;
  v3.super_class = (Class)SBActivityAmbientViewController;
  [(SBActivityAmbientViewController *)&v3 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FA6028]);
  [(SBActivityAmbientViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)SBActivityAmbientViewController;
  [(SBActivityAmbientViewController *)&v4 viewDidLoad];
  [(SBActivityAmbientViewController *)self _addOverlayForPrimaryActivity];
  id v3 = [(SBActivityAmbientViewController *)self view];
  [v3 setAccessibilityIdentifier:@"sb-activity-ambient-view"];
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SBActivityAmbientViewController;
  [(SBActivityAmbientViewController *)&v6 viewWillLayoutSubviews];
  compactOverlayViewController = self->_compactOverlayViewController;
  if (compactOverlayViewController)
  {
    [(SBActivityAmbientCompactOverlayViewController *)compactOverlayViewController contentSize];
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (!self->_isAnimatingTransition)
  {
    -[SBActivityAmbientViewController _compactOverlayFrameForContentSize:](self, "_compactOverlayFrameForContentSize:", v4, v5);
    -[SBActivityAmbientViewController _layoutCompactOverlayIfNecessaryWithView:frame:](self, "_layoutCompactOverlayIfNecessaryWithView:frame:", 0);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBActivityAmbientViewController;
  [(SBActivityAmbientViewController *)&v4 viewWillAppear:a3];
  [(SBActivityAmbientViewController *)self _addDismissGesture];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBActivityAmbientViewController;
  [(SBActivityAmbientViewController *)&v4 viewWillDisappear:a3];
  [(SBActivityAmbientViewController *)self _cleanupCurrentCompactOverlayViewController];
  [(SBActivityAmbientViewController *)self _cleanupCurrentFullOverlayViewController];
  [(SBActivityAmbientViewController *)self _cleanupTransitionBlurViewIfNecessary];
  [(SBActivityAmbientViewController *)self _cleanupBackgroundBlurViewIfNecessary];
  [(SBActivityAmbientViewController *)self _removeDismissGesture];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 24;
}

- (void)addOverlayForPrimaryActivityItem:(id)a3 withOverlayMode:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = SBLogActivity();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 identifier];
    int v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] adding ambient overlay for primary item", (uint8_t *)&v8, 0xCu);
  }
  [(SBActivityAmbientViewController *)self _transitionOverlayForActivityItem:v5 withTransitionType:3 withCompletion:0];
}

- (void)addOverlayForSecondaryActivityItem:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogActivity();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = [v4 identifier];
    int v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] adding ambient overlay for secondary item", (uint8_t *)&v8, 0xCu);
  }
  [(SBActivityAmbientViewController *)self _setSecondaryActivityItem:v4];
  secondaryActivityItem = self->_secondaryActivityItem;
  if (secondaryActivityItem) {
    [(SBActivityAmbientViewController *)self _updateCompactActivityOverlayWithItem:secondaryActivityItem withCompletion:0];
  }
}

- (void)transitionToCompactOverlayMode
{
  if (self->_primaryActivityItem)
  {
    if (!self->_overlayMode) {
      -[SBActivityAmbientViewController _transitionOverlayForActivityItem:withTransitionType:withCompletion:](self, "_transitionOverlayForActivityItem:withTransitionType:withCompletion:");
    }
  }
}

- (void)alertActivityItem:(id)a3 withAlertBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v6 = (SBActivityItem *)a3;
  v7 = (void (**)(void))a4;
  int v8 = SBLogActivity();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(SBActivityItem *)v6 identifier];
    int v17 = 138543362;
    v18 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] ambient item alerting", (uint8_t *)&v17, 0xCu);
  }
  primaryActivityItem = self->_primaryActivityItem;
  if (primaryActivityItem == v6)
  {
    v12 = [(SBActivityViewController *)self->_fullOverlayViewController activityItem];
    BOOL v11 = v12 == v6;

    primaryActivityItem = self->_primaryActivityItem;
  }
  else
  {
    BOOL v11 = 0;
  }
  if (primaryActivityItem == v6)
  {
    v14 = [(SBActivityViewController *)self->_compactOverlayViewController activityItem];
    BOOL v13 = v14 == v6;
  }
  else
  {
    BOOL v13 = 0;
  }
  if (!v11 && !v13 && self->_secondaryActivityItem != v6)
  {
    v15 = [(SBActivityAmbientViewController *)self delegate];
    [v15 activityAmbientViewController:self removePendingItem:v6];

    uint64_t v16 = 4;
LABEL_16:
    [(SBActivityAmbientViewController *)self _transitionOverlayForActivityItem:v6 withTransitionType:v16 withCompletion:0];
    goto LABEL_17;
  }
  if (v13) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = 2;
  }
  if (!v11) {
    goto LABEL_16;
  }
LABEL_17:
  v7[2](v7);
}

- (void)removeOverlayForActivityItem:(id)a3 withCompletion:(id)a4
{
  objc_super v6 = (SBActivityItem *)a3;
  id v7 = a4;
  int v8 = [(SBActivityViewController *)self->_fullOverlayViewController activityItem];

  v9 = [(SBActivityViewController *)self->_compactOverlayViewController activityItem];

  secondaryActivityItem = self->_secondaryActivityItem;
  if (self->_primaryActivityItem == v6) {
    [(SBActivityAmbientViewController *)self _setPrimaryActivityItem:0];
  }
  if (secondaryActivityItem == v6) {
    [(SBActivityAmbientViewController *)self _setSecondaryActivityItem:0];
  }
  if (v8 == v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79__SBActivityAmbientViewController_removeOverlayForActivityItem_withCompletion___block_invoke;
    v15[3] = &unk_1E6AF6828;
    v15[4] = self;
    BOOL v11 = &v16;
    id v16 = v7;
    [(SBActivityAmbientViewController *)self _dismissFullOverlayWithCompletion:v15];
    goto LABEL_9;
  }
  if (v9 == v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__SBActivityAmbientViewController_removeOverlayForActivityItem_withCompletion___block_invoke_2;
    v12[3] = &unk_1E6AF5FC8;
    v12[4] = self;
    BOOL v11 = (id *)&v13;
    BOOL v13 = v6;
    id v14 = v7;
    [(SBActivityAmbientViewController *)self _dismissCompactOverlayForActivityEnding:1 completion:v12];

LABEL_9:
  }
}

uint64_t __79__SBActivityAmbientViewController_removeOverlayForActivityItem_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetPrimaryActivityItemWithCompletion:*(void *)(a1 + 40)];
}

uint64_t __79__SBActivityAmbientViewController_removeOverlayForActivityItem_withCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanupCurrentCompactOverlayViewController];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 == v2[134])
  {
    uint64_t v6 = *(void *)(a1 + 48);
    return [v2 _resetPrimaryActivityItemWithCompletion:v6];
  }
  else
  {
    if (v3 == v2[135]) {
      [v2 _addSecondaryActivityItemIfAvailable];
    }
    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      id v5 = *(uint64_t (**)(void))(result + 16);
      return v5();
    }
  }
  return result;
}

- (BOOL)wantsIdleTimerDisabled
{
  return !self->_overlayMode
      && [(SBActivityViewController *)self->_fullOverlayViewController wantsIdleTimerDisabled];
}

- (BOOL)isTransitioning
{
  return self->_isAnimatingTransition;
}

- (void)setCompactOverlayHidden:(BOOL)a3
{
  compactOverlayViewController = self->_compactOverlayViewController;
  if (compactOverlayViewController)
  {
    BOOL v4 = a3;
    id v5 = [(SBActivityAmbientCompactOverlayViewController *)compactOverlayViewController view];
    BOOL v6 = !v4;
    double v7 = 1.0;
    int v8 = (void *)MEMORY[0x1E4F42FF0];
    v10[1] = 3221225472;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[2] = __59__SBActivityAmbientViewController_setCompactOverlayHidden___block_invoke;
    v10[3] = &unk_1E6AF4A70;
    if (!v6) {
      double v7 = 0.0;
    }
    id v11 = v5;
    double v12 = v7;
    id v9 = v5;
    [v8 _animateUsingSpringWithDuration:0 delay:v10 options:0 mass:0.1 stiffness:0.0 damping:0.0 initialVelocity:0.0 animations:50.0 completion:0.0];
  }
}

uint64_t __59__SBActivityAmbientViewController_setCompactOverlayHidden___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)_setPrimaryActivityItem:(id)a3
{
  BOOL v6 = (SBActivityItem *)a3;
  if (self->_primaryActivityItem != v6)
  {
    objc_storeStrong((id *)&self->_primaryActivityItem, a3);
    id v5 = [(SBActivityAmbientViewController *)self delegate];
    [v5 activityAmbientViewController:self removePendingItem:v6];

    [(SBActivityAmbientViewController *)self _didUpdateVisibleActivityItems];
  }
}

- (void)_setSecondaryActivityItem:(id)a3
{
  BOOL v6 = (SBActivityItem *)a3;
  if (self->_secondaryActivityItem != v6)
  {
    objc_storeStrong((id *)&self->_secondaryActivityItem, a3);
    id v5 = [(SBActivityAmbientViewController *)self delegate];
    [v5 activityAmbientViewController:self removePendingItem:v6];

    [(SBActivityAmbientViewController *)self _didUpdateVisibleActivityItems];
  }
}

- (void)_addOverlayForPrimaryActivity
{
  if (self->_primaryActivityItem)
  {
    int64_t overlayMode = self->_overlayMode;
    if (overlayMode == 1)
    {
      -[SBActivityAmbientViewController _updateCompactActivityOverlayWithItem:withCompletion:](self, "_updateCompactActivityOverlayWithItem:withCompletion:");
    }
    else if (!overlayMode)
    {
      -[SBActivityAmbientViewController _updateFullActivityOverlayWithItem:](self, "_updateFullActivityOverlayWithItem:");
    }
  }
}

- (void)_updateCompactActivityOverlayWithItem:(id)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (void (**)(void))a4;
  int v8 = SBLogActivity();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 identifier];
    *(_DWORD *)buf = 138543362;
    id v14 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] adding compact ambient overlay", buf, 0xCu);
  }
  uint64_t v10 = [(SBActivityAmbientViewController *)self delegate];
  [v10 activityAmbientViewController:self removePendingItem:v6];

  if (self->_compactOverlayViewController)
  {
    if (v7) {
      v7[2](v7);
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __88__SBActivityAmbientViewController__updateCompactActivityOverlayWithItem_withCompletion___block_invoke;
    v11[3] = &unk_1E6B00D08;
    v11[4] = self;
    double v12 = v7;
    [(SBActivityAmbientViewController *)self _compactOverlayViewControllerForItem:v6 completion:v11];
  }
}

uint64_t __88__SBActivityAmbientViewController__updateCompactActivityOverlayWithItem_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v11 = v4;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1120), a2);
    id v5 = [v11 view];
    [v11 cornerRadius];
    objc_msgSend(v5, "_setContinuousCornerRadius:");

    id v6 = *(void **)(a1 + 32);
    double v7 = [v11 view];
    int v8 = *(void **)(a1 + 32);
    [v11 contentSize];
    objc_msgSend(v8, "_compactOverlayFrameForContentSize:");
    objc_msgSend(v6, "_layoutCompactOverlayIfNecessaryWithView:frame:", v7);

    [*(id *)(a1 + 32) _animatePresentationOfCompactOverlayWithCompactViewController:v11 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(void))(v9 + 16))();
    }
  }
  return MEMORY[0x1F4181820]();
}

- (void)_updateFullActivityOverlayWithItem:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogActivity();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    *(_DWORD *)buf = 138543362;
    id v11 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] adding full ambient overlay", buf, 0xCu);
  }
  double v7 = [(SBActivityAmbientViewController *)self delegate];
  [v7 activityAmbientViewController:self removePendingItem:v4];
  if (!self->_fullOverlayViewController)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__SBActivityAmbientViewController__updateFullActivityOverlayWithItem___block_invoke;
    v8[3] = &unk_1E6B00D30;
    v8[4] = self;
    id v9 = v7;
    [(SBActivityAmbientViewController *)self _fullOverlayViewControllerForItem:v4 completion:v8];
  }
}

void __70__SBActivityAmbientViewController__updateFullActivityOverlayWithItem___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1112), a2);
    id v5 = *(void **)(a1 + 32);
    id v6 = [v4 view];
    [v5 _layoutFullOverlayWithActivityView:v6];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__SBActivityAmbientViewController__updateFullActivityOverlayWithItem___block_invoke_2;
    v10[3] = &unk_1E6AF5290;
    double v7 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = v8;
    uint64_t v12 = v9;
    [v7 _animatePresentationOfFullOverlayWithViewController:v4 completion:v10];
  }
}

uint64_t __70__SBActivityAmbientViewController__updateFullActivityOverlayWithItem___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) activityAmbientViewControllerResetIdleTimerBehavior:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 40);
  return [v2 _updateResolvedPreferences];
}

- (void)_fullOverlayViewControllerForItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBActivityViewController *)[SBActivityAmbientFullOverlayViewController alloc] initWithActivityItem:v6 sceneType:2 payloadID:0];
  uint64_t v9 = [(SBActivityAmbientFullOverlayViewController *)v8 view];
  [v9 setClipsToBounds:1];

  uint64_t v10 = [(SBActivityAmbientFullOverlayViewController *)v8 view];
  [v10 setAlpha:0.0];

  id v11 = [(SBActivityAmbientFullOverlayViewController *)v8 view];
  uint64_t v12 = NSString;
  BOOL v13 = [v6 descriptor];
  id v14 = [v13 platterTargetBundleIdentifier];
  uint64_t v15 = [v12 stringWithFormat:@"sb-activity-ambient-full-view,bundleIdentifier:%@", v14];
  [v11 setAccessibilityIdentifier:v15];

  [(SBActivityViewController *)v8 setDelegate:self];
  [(SBActivityViewController *)v8 setPresentationMode:1];
  [(SBActivityViewController *)v8 setVisibility:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__SBActivityAmbientViewController__fullOverlayViewControllerForItem_completion___block_invoke;
  v19[3] = &unk_1E6B00D80;
  id v20 = v6;
  v21 = self;
  v22 = v8;
  id v23 = v7;
  id v16 = v8;
  id v17 = v7;
  id v18 = v6;
  [(SBActivityViewController *)v16 ensureContent:MEMORY[0x1E4F14428] queue:v19 completion:1.79769313e308];
}

void __80__SBActivityAmbientViewController__fullOverlayViewControllerForItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = SBLogActivity();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__SBActivityAmbientViewController__fullOverlayViewControllerForItem_completion___block_invoke_cold_1(a1);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v6 = *(void **)(a1 + 40);
    id v5 = *(void **)(a1 + 48);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __80__SBActivityAmbientViewController__fullOverlayViewControllerForItem_completion___block_invoke_29;
    v7[3] = &unk_1E6B00D58;
    v7[4] = v6;
    id v8 = v5;
    id v9 = *(id *)(a1 + 56);
    objc_msgSend(v6, "bs_addChildViewController:animated:transitionBlock:", v8, 0, v7);
  }
}

void __80__SBActivityAmbientViewController__fullOverlayViewControllerForItem_completion___block_invoke_29(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 view];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 1120) view];
  id v6 = [*(id *)(a1 + 40) view];
  if (v5) {
    [v7 insertSubview:v6 belowSubview:v5];
  }
  else {
    [v7 addSubview:v6];
  }
  v4[2](v4);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_compactOverlayViewControllerForItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBActivityViewController *)[SBActivityAmbientCompactOverlayViewController alloc] initWithActivityItem:v6 sceneType:3 payloadID:0];
  id v9 = [(SBActivityAmbientCompactOverlayViewController *)v8 view];
  [v9 setClipsToBounds:1];

  uint64_t v10 = [(SBActivityAmbientCompactOverlayViewController *)v8 view];
  [v10 setAlpha:0.0];

  id v11 = [(SBActivityAmbientCompactOverlayViewController *)v8 view];
  uint64_t v12 = NSString;
  BOOL v13 = [v6 descriptor];
  id v14 = [v13 platterTargetBundleIdentifier];
  uint64_t v15 = [v12 stringWithFormat:@"sb-activity-ambient-compact-view,bundleIdentifier:%@", v14];
  [v11 setAccessibilityIdentifier:v15];

  [(SBActivityViewController *)v8 setDelegate:self];
  [(SBActivityAmbientCompactOverlayViewController *)v8 setCompactOverlayDelegate:self];
  [(SBActivityViewController *)v8 setPresentationMode:1];
  [(SBActivityViewController *)v8 setVisibility:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__SBActivityAmbientViewController__compactOverlayViewControllerForItem_completion___block_invoke;
  v19[3] = &unk_1E6B00D80;
  id v20 = v6;
  v21 = v8;
  v22 = self;
  id v23 = v7;
  id v16 = v8;
  id v17 = v7;
  id v18 = v6;
  [(SBActivityViewController *)v16 ensureContent:MEMORY[0x1E4F14428] queue:v19 completion:1.79769313e308];
}

void __83__SBActivityAmbientViewController__compactOverlayViewControllerForItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = SBLogActivity();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __83__SBActivityAmbientViewController__compactOverlayViewControllerForItem_completion___block_invoke_cold_1(a1);
    }

    id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) view];
    [*(id *)(a1 + 40) cornerRadius];
    objc_msgSend(v6, "_setContinuousCornerRadius:");

    objc_msgSend(*(id *)(a1 + 48), "bs_addChildViewController:", *(void *)(a1 + 40));
    id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v5();
}

- (void)_animatePresentationOfCompactOverlayWithCompactViewController:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [a3 view];
  id v7 = (void *)MEMORY[0x1E4F42FF0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __108__SBActivityAmbientViewController__animatePresentationOfCompactOverlayWithCompactViewController_completion___block_invoke;
  v16[3] = &unk_1E6AF4AC0;
  id v8 = v6;
  id v17 = v8;
  [v7 performWithoutAnimation:v16];
  id v9 = (void *)MEMORY[0x1E4F42FF0];
  id v13 = v5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __108__SBActivityAmbientViewController__animatePresentationOfCompactOverlayWithCompactViewController_completion___block_invoke_2;
  v14[3] = &unk_1E6AF4AC0;
  id v15 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __108__SBActivityAmbientViewController__animatePresentationOfCompactOverlayWithCompactViewController_completion___block_invoke_3;
  v12[3] = &unk_1E6AF5A50;
  id v10 = v5;
  id v11 = v8;
  [v9 _animateUsingSpringWithDuration:0 delay:v14 options:v12 mass:0.8888 stiffness:0.0 damping:2.0 initialVelocity:315.827 animations:34.0214 completion:0.0];
}

uint64_t __108__SBActivityAmbientViewController__animatePresentationOfCompactOverlayWithCompactViewController_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(a1 + 32) setHidden:0];
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.2, 0.2);
  return [v2 setTransform:&v4];
}

uint64_t __108__SBActivityAmbientViewController__animatePresentationOfCompactOverlayWithCompactViewController_completion___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __108__SBActivityAmbientViewController__animatePresentationOfCompactOverlayWithCompactViewController_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_animatePresentationOfFullOverlayWithViewController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 view];
  id v8 = (void *)MEMORY[0x1E4F42FF0];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke;
  v23[3] = &unk_1E6AF5290;
  id v9 = v7;
  id v24 = v9;
  v25 = self;
  [v8 performWithoutAnimation:v23];
  v21[4] = self;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_2;
  v22[3] = &unk_1E6AF4AC0;
  v22[4] = self;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_3;
  v21[3] = &unk_1E6AF5350;
  [MEMORY[0x1E4F42FF0] _animateUsingSpringWithDuration:0 delay:v22 options:v21 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
  id v10 = (void *)MEMORY[0x1E4F42FF0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_4;
  v19[3] = &unk_1E6AF4AC0;
  id v11 = v9;
  id v20 = v11;
  [v10 _animateUsingSpringWithDuration:0 delay:v19 options:0 mass:1.1117 stiffness:0.0 damping:2.0 initialVelocity:186.88 animations:27.3488 completion:0.0];
  uint64_t v12 = (void *)MEMORY[0x1E4F42FF0];
  id v16 = v6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_5;
  v17[3] = &unk_1E6AF4AC0;
  id v18 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_6;
  v15[3] = &unk_1E6AF5A50;
  id v13 = v6;
  id v14 = v11;
  [v12 _animateUsingSpringWithDuration:0 delay:v17 options:v15 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
}

uint64_t __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.9, 0.9);
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 40) _addNewFullOverlayTransitionBlurMaterialViewWithParentView:*(void *)(a1 + 32) initialWeighting:0 hidden:0.5];
}

uint64_t __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 976) setWeighting:0.0];
}

uint64_t __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupTransitionBlurViewIfNecessary];
}

uint64_t __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __98__SBActivityAmbientViewController__animatePresentationOfFullOverlayWithViewController_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_dismissCompactOverlayForActivityEnding:(BOOL)a3 completion:(id)a4
{
  compactOverlayViewController = self->_compactOverlayViewController;
  if (compactOverlayViewController)
  {
    id v6 = a4;
    id v7 = [(SBActivityAmbientCompactOverlayViewController *)compactOverlayViewController view];
    [(SBActivityAmbientViewController *)self _dismissCompactOverlayWithView:v7 forActivityEnding:v7 != 0 completion:v6];
  }
}

- (void)_dismissCompactOverlayWithView:(id)a3 forActivityEnding:(BOOL)a4 completion:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = (void *)MEMORY[0x1E4F42FF0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__SBActivityAmbientViewController__dismissCompactOverlayWithView_forActivityEnding_completion___block_invoke;
  v13[3] = &unk_1E6AF4AC0;
  id v14 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__SBActivityAmbientViewController__dismissCompactOverlayWithView_forActivityEnding_completion___block_invoke_2;
  v11[3] = &unk_1E6AF5A50;
  id v12 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 _animateUsingSpringWithDuration:0 delay:v13 options:v11 mass:0.5845 stiffness:0.0 damping:2.0 initialVelocity:877.298 animations:51.1883 completion:0.0];
}

uint64_t __95__SBActivityAmbientViewController__dismissCompactOverlayWithView_forActivityEnding_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __95__SBActivityAmbientViewController__dismissCompactOverlayWithView_forActivityEnding_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_dismissFullOverlayWithCompletion:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  fullOverlayViewController = self->_fullOverlayViewController;
  if (fullOverlayViewController)
  {
    id v6 = fullOverlayViewController;
    id v7 = self->_fullOverlayViewController;
    self->_fullOverlayViewController = 0;

    id v8 = [(SBActivityAmbientFullOverlayViewController *)v6 view];
    id v9 = SBLogActivity();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(SBActivityViewController *)v6 activityItem];
      id v11 = [v10 identifier];
      *(_DWORD *)buf = 138543362;
      v32 = v11;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] dismissing ambient full screen overlay", buf, 0xCu);
    }
    id v12 = (void *)MEMORY[0x1E4F42FF0];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke;
    v29[3] = &unk_1E6AF5290;
    v29[4] = self;
    id v13 = v8;
    id v30 = v13;
    [v12 performWithoutAnimation:v29];
    id v14 = (void *)MEMORY[0x1E4F42FF0];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke_2;
    v27[3] = &unk_1E6AF5290;
    v27[4] = self;
    id v28 = v13;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke_3;
    v24[3] = &unk_1E6AF4A98;
    id v15 = v28;
    id v25 = v15;
    v26 = self;
    [v14 _animateUsingSpringWithDuration:0 delay:v27 options:v24 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
    id v16 = (void *)MEMORY[0x1E4F42FF0];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke_4;
    v22[3] = &unk_1E6AF4AC0;
    id v23 = v15;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke_5;
    v19[3] = &unk_1E6AFA2A0;
    void v19[4] = self;
    id v20 = v6;
    id v21 = v4;
    id v17 = v6;
    id v18 = v15;
    [v16 _animateUsingSpringWithDuration:0 delay:v22 options:v19 mass:1.1117 stiffness:0.0 damping:2.0 initialVelocity:186.88 animations:27.3488 completion:0.0];
  }
}

uint64_t __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _addNewFullOverlayTransitionBlurMaterialViewWithParentView:*(void *)(a1 + 40) initialWeighting:0 hidden:0.0];
  long long v2 = [*(id *)(*(void *)(a1 + 32) + 976) layer];
  [v2 setAllowsGroupOpacity:1];

  long long v3 = [*(id *)(a1 + 40) layer];
  [v3 setAllowsGroupOpacity:1];

  id v4 = [*(id *)(a1 + 32) traitCollection];
  [v4 displayCornerRadius];
  double v6 = v5;

  id v7 = *(void **)(a1 + 40);
  return [v7 _setContinuousCornerRadius:v6];
}

uint64_t __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 976) setWeighting:1.0];
  long long v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

uint64_t __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke_3(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) layer];
  [v2 setAllowsGroupOpacity:1];

  long long v3 = *(void **)(a1 + 40);
  return [v3 _cleanupTransitionBlurViewIfNecessary];
}

uint64_t __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 0.9, 0.9);
  return [v1 setTransform:&v3];
}

uint64_t __69__SBActivityAmbientViewController__dismissFullOverlayWithCompletion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanupFullViewController:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    CGAffineTransform v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)_itemIsFirstPartyActivity:(id)a3
{
  CGAffineTransform v3 = [a3 descriptor];
  id v4 = [v3 platterTargetBundleIdentifier];

  double v5 = +[SBActivityManager sharedInstance];
  double v6 = [v5 firstPartyActivityGroupingIdentifiers];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (void)_cleanupCompactViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    [(SBActivityAmbientViewController *)self bs_removeChildViewController:v4];
  }
}

- (void)_cleanupFullViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    [(SBActivityAmbientViewController *)self bs_removeChildViewController:v4];
  }
}

- (void)_cleanupCurrentCompactOverlayViewController
{
  [(SBActivityAmbientViewController *)self _cleanupCompactViewController:self->_compactOverlayViewController];
  compactOverlayViewController = self->_compactOverlayViewController;
  self->_compactOverlayViewController = 0;
}

- (void)_cleanupCurrentFullOverlayViewController
{
  if (!self->_transitionAnimationCount)
  {
    [(SBActivityAmbientViewController *)self _cleanupFullViewController:self->_fullOverlayViewController];
    fullOverlayViewController = self->_fullOverlayViewController;
    self->_fullOverlayViewController = 0;

    [(SBActivityAmbientViewController *)self _updateResolvedPreferences];
  }
}

- (void)_cleanupTransitionBlurViewIfNecessary
{
  fullOverlayTransitionBlurView = self->_fullOverlayTransitionBlurView;
  if (fullOverlayTransitionBlurView && !self->_transitionAnimationCount)
  {
    [(MTMaterialView *)fullOverlayTransitionBlurView removeFromSuperview];
    id v4 = self->_fullOverlayTransitionBlurView;
    self->_fullOverlayTransitionBlurView = 0;
  }
}

- (void)_cleanupBackgroundBlurViewIfNecessary
{
  backgroundBlurMaterialView = self->_backgroundBlurMaterialView;
  if (backgroundBlurMaterialView && !self->_transitionAnimationCount)
  {
    [(MTMaterialView *)backgroundBlurMaterialView removeFromSuperview];
    id v4 = self->_backgroundBlurMaterialView;
    self->_backgroundBlurMaterialView = 0;
  }
}

- (void)_cleanupSwitchingTransitionView
{
  switchingTransitionView = self->_switchingTransitionView;
  if (switchingTransitionView)
  {
    [(UIView *)switchingTransitionView removeFromSuperview];
    id v4 = self->_switchingTransitionView;
    self->_switchingTransitionView = 0;
  }
}

- (void)_didUpdateVisibleActivityItems
{
  id v3 = [(SBActivityAmbientViewController *)self delegate];
  [v3 activityAmbientViewControllerDidUpdateVisibleActivityItems:self];
}

- (id)_ambientActivitySettings
{
  long long v2 = +[SBLiveActivityDomain rootSettings];
  id v3 = [v2 ambientSettings];

  return v3;
}

- (void)_updateAudioCategoriesDisablingVolumeHUD
{
  if (self->_overlayMode)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(SBActivityViewController *)self->_fullOverlayViewController audioCategoriesDisablingVolumeHUD];
  }
  id obj = (id)v3;
  if ((BSEqualSets() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, obj);
    id v4 = [(SBActivityAmbientViewController *)self delegate];
    [v4 activityAmbientViewControllerDidUpdateAudioCategoriesDisablingVolumeHUD:self];
  }
}

- (BOOL)_isActiveActivityItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SBActivityAmbientViewController *)self delegate];
  LOBYTE(self) = [v5 activityAmbientViewController:self isActiveActivityItem:v4];

  return (char)self;
}

- (id)_nextSecondaryActivityItemForTransitionType:(int64_t)a3
{
  id v5 = [(SBActivityAmbientViewController *)self delegate];
  double v6 = [v5 activityAmbientViewControllerNextPendingActivityItem:self];
  if (v6)
  {
    [v5 activityAmbientViewController:self removePendingItem:v6];
    [v5 activityAmbientViewController:self addPendingItem:self->_primaryActivityItem];
  }
  if ((unint64_t)(a3 - 3) < 2)
  {
    primaryActivityItem = self->_primaryActivityItem;
    if (!primaryActivityItem)
    {
      primaryActivityItem = self->_secondaryActivityItem;
      if (!primaryActivityItem) {
        primaryActivityItem = v6;
      }
    }
LABEL_11:
    id v8 = primaryActivityItem;
    goto LABEL_13;
  }
  if (a3 == 2)
  {
    primaryActivityItem = v6;
    if (!v6) {
      primaryActivityItem = self->_primaryActivityItem;
    }
    goto LABEL_11;
  }
  id v8 = 0;
LABEL_13:

  return v8;
}

- (void)_transitionOverlayForActivityItem:(id)a3 withTransitionType:(int64_t)a4 withCompletion:(id)a5
{
  id v9 = a3;
  id v8 = (void (**)(void))a5;
  if ([(SBActivityAmbientViewController *)self _canTransitionActivityItem:v9 forTransitionType:a4])
  {
    [(SBActivityAmbientViewController *)self _beginTransitionForActivityItem:v9 transitionType:a4 withCompletion:v8];
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

- (void)_beginTransitionForActivityItem:(id)a3 transitionType:(int64_t)a4 withCompletion:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = (SBActivityItem *)a3;
  id v9 = a5;
  id v10 = SBLogActivity();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(SBActivityItem *)v8 identifier];
    *(_DWORD *)buf = 138543618;
    v36 = v11;
    __int16 v37 = 2048;
    int64_t v38 = a4;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] begining ambient overlay transition for type: %ld", buf, 0x16u);
  }
  ++self->_transitionAnimationCount;
  id v12 = self->_fullOverlayViewController;
  id v13 = self->_compactOverlayViewController;
  if ([(SBActivityAmbientViewController *)self _transitionTypeIsToFullOverlay:a4])
  {
    self->_int64_t overlayMode = 0;
    if (a4 == 2) {
      [(SBActivityAmbientViewController *)self _setSecondaryActivityItem:0];
    }
    BOOL v14 = self->_primaryActivityItem == v8;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke;
    v28[3] = &unk_1E6B00DD0;
    BOOL v34 = v14;
    v28[4] = self;
    int64_t v33 = a4;
    v29 = v8;
    id v30 = v12;
    v31 = v13;
    id v32 = v9;
    id v15 = v12;
    id v16 = v13;
    [(SBActivityAmbientViewController *)self _fullOverlayViewControllerForItem:v29 completion:v28];

    id v17 = v29;
  }
  else
  {
    self->_int64_t overlayMode = 1;
    id v18 = [(SBActivityAmbientCompactOverlayViewController *)v13 view];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_4;
    v27[3] = &unk_1E6AF4AC0;
    v27[4] = self;
    [(SBActivityAmbientViewController *)self _dismissCompactOverlayWithView:v18 forActivityEnding:0 completion:v27];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_5;
    v21[3] = &unk_1E6B00E20;
    v21[4] = self;
    v22 = v8;
    id v23 = v13;
    int64_t v26 = a4;
    id v24 = v12;
    id v25 = v9;
    uint64_t v19 = v12;
    id v20 = v13;
    [(SBActivityAmbientViewController *)self _compactOverlayViewControllerForItem:v22 completion:v21];

    id v17 = v22;
  }
}

void __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1112), a2);
    id v5 = *(void **)(a1 + 32);
    double v6 = [v4 view];
    [v5 _layoutFullOverlayWithActivityView:v6];

    [*(id *)(a1 + 32) _updateResolvedPreferences];
    char v7 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 80))
    {
      id v8 = (void *)v7[140];
      v7[140] = 0;

      [*(id *)(a1 + 32) _animateTransitionToFullOverlayForPrimaryActivityItem:*(void *)(a1 + 40) transitionType:*(void *)(a1 + 72) fullOverlayViewControllerForTransition:v4 oldCompactOverlayViewController:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
    }
    else
    {
      id v9 = [v7 _nextSecondaryActivityItemForTransitionType:*(void *)(a1 + 72)];
      [*(id *)(a1 + 32) _setPrimaryActivityItem:*(void *)(a1 + 40)];
      id v10 = *(void **)(a1 + 32);
      if (v9)
      {
        [v10 _setSecondaryActivityItem:v9];
        id v11 = *(void **)(a1 + 32);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_2;
        v26[3] = &unk_1E6B00DA8;
        v26[4] = v11;
        id v12 = &v27;
        id v13 = *(id *)(a1 + 40);
        uint64_t v14 = *(void *)(a1 + 72);
        id v27 = v13;
        uint64_t v32 = v14;
        id v15 = &v28;
        id v28 = v4;
        id v29 = *(id *)(a1 + 48);
        id v30 = *(id *)(a1 + 56);
        id v31 = *(id *)(a1 + 64);
        [v11 _compactOverlayViewControllerForItem:v9 completion:v26];
      }
      else
      {
        id v16 = (void *)v10[140];
        v10[140] = 0;

        id v17 = *(void **)(a1 + 32);
        uint64_t v18 = *(void *)(a1 + 40);
        uint64_t v19 = *(void *)(a1 + 72);
        id v20 = *(void **)(a1 + 48);
        uint64_t v22 = *(void *)(a1 + 56);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_3;
        v23[3] = &unk_1E6AF4E00;
        void v23[4] = v17;
        id v12 = &v24;
        id v21 = v20;
        id v24 = v21;
        id v15 = &v25;
        id v25 = *(id *)(a1 + 56);
        [v17 _animateTransitionToBecomeNewPrimaryAcivityWithItem:v18 transitionType:v19 fullOverlayViewController:v4 compactOverlayViewControllerForTransition:0 oldFullViewController:v21 oldCompactViewController:v22 completion:v23];
      }
    }
  }
}

void __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1120), a2);
    id v4 = *(void **)(a1 + 32);
    id v5 = [v7 view];
    double v6 = *(void **)(a1 + 32);
    [v7 contentSize];
    objc_msgSend(v6, "_compactOverlayFrameForContentSize:");
    objc_msgSend(v4, "_layoutCompactOverlayIfNecessaryWithView:frame:", v5);

    [*(id *)(a1 + 32) _animateTransitionToBecomeNewPrimaryAcivityWithItem:*(void *)(a1 + 40) transitionType:*(void *)(a1 + 80) fullOverlayViewController:*(void *)(a1 + 48) compactOverlayViewControllerForTransition:v7 oldFullViewController:*(void *)(a1 + 56) oldCompactViewController:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
  }
}

uint64_t __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanupFullViewController:*(void *)(a1 + 40)];
  long long v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 _cleanupCompactViewController:v3];
}

void __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_4(uint64_t a1)
{
  long long v2 = *(id **)(a1 + 32);
  id v4 = v2[135];
  uint64_t v3 = [v2 delegate];
  [v3 activityAmbientViewController:*(void *)(a1 + 32) addPendingItem:v4];

  [*(id *)(a1 + 32) _setSecondaryActivityItem:0];
}

void __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1120), a2);
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 72);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_6;
    v10[3] = &unk_1E6B00DF8;
    void v10[4] = v5;
    id v11 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 72);
    id v13 = v8;
    uint64_t v16 = v9;
    id v14 = v4;
    id v15 = *(id *)(a1 + 64);
    [v5 _animateTransitionToCompactOverlayForItem:v6 transitionType:v7 compactOverlayViewController:v14 completion:v10];
    [*(id *)(a1 + 32) _updateResolvedPreferences];
  }
}

uint64_t __97__SBActivityAmbientViewController__beginTransitionForActivityItem_transitionType_withCompletion___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanupCompactViewController:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _cleanupFullViewController:*(void *)(a1 + 48)];
  long long v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 80);
  return [v2 _endAndCleanupTransitionForActivityItem:v3 forTransitionType:v5 compactOverlayViewController:v4 fullOverlayViewController:0 completion:v6];
}

- (void)_animateTransitionToFullOverlayForPrimaryActivityItem:(id)a3 transitionType:(int64_t)a4 fullOverlayViewControllerForTransition:(id)a5 oldCompactOverlayViewController:(id)a6 completion:(id)a7
{
  v84[3] = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v12 = a5;
  id v13 = a6;
  id v64 = a7;
  self->_isAnimatingTransition = 1;
  id v14 = [v12 view];
  id v15 = [v13 view];
  [v15 frame];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [v14 frame];
  double v25 = v24;
  v85.origin.x = v17;
  v85.origin.y = v19;
  v85.size.width = v21;
  v85.size.height = v23;
  double MidY = CGRectGetMidY(v85);
  [v14 frame];
  double v28 = v21 / v27;
  [v14 frame];
  id v29 = (void *)MEMORY[0x1E4F42FF0];
  v81[0] = MEMORY[0x1E4F143A8];
  double v31 = v23 / v30;
  v81[1] = 3221225472;
  v81[2] = __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke;
  v81[3] = &unk_1E6AF5290;
  id v32 = v14;
  id v82 = v32;
  v83 = self;
  [v29 performWithoutAnimation:v81];
  int64_t v33 = [(SBActivityAmbientViewController *)self _animationSettingsForTransitionType:a4];
  BOOL v34 = (void *)MEMORY[0x1E4F42FF0];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke_2;
  v79[3] = &unk_1E6AF4AC0;
  id v80 = v15;
  id v59 = v15;
  [v34 animateWithDuration:0 delay:v79 options:0 animations:0.05 completion:0.0];
  v35 = (void *)MEMORY[0x1E4F42FF0];
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke_3;
  v77[3] = &unk_1E6AF4AC0;
  id v36 = v32;
  id v78 = v36;
  objc_msgSend(v35, "sb_animateWithSettings:mode:animations:completion:", v33, 3, v77, 0);
  __int16 v37 = (void *)MEMORY[0x1E4F42FF0];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke_4;
  v75[3] = &unk_1E6AF5290;
  v75[4] = self;
  id v38 = v36;
  id v76 = v38;
  v66 = v33;
  objc_msgSend(v37, "sb_animateWithSettings:mode:animations:completion:", v33, 3, v75, 0);
  v58 = self;
  uint64_t v39 = [(SBActivityAmbientViewController *)self _animationSettingsForFullOverlayTransitionYCurve];
  v40 = [v39 BSAnimationSettings];

  v41 = [v33 BSAnimationSettings];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke_5;
  v67[3] = &unk_1E6B00DF8;
  id v68 = v38;
  v69 = self;
  id v70 = v13;
  id v71 = v61;
  id v72 = v12;
  id v73 = v64;
  int64_t v74 = a4;
  id v65 = v64;
  id v63 = v12;
  id v62 = v61;
  id v60 = v13;
  id v57 = v38;
  v42 = (void *)MEMORY[0x1D948C7A0](v67);
  v43 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position.y"];
  v44 = [NSNumber numberWithDouble:v25 * 0.5];
  [v43 setToValue:v44];

  [v40 mass];
  objc_msgSend(v43, "setMass:");
  [v40 damping];
  objc_msgSend(v43, "setDamping:");
  [v40 stiffness];
  objc_msgSend(v43, "setStiffness:");
  uint64_t v45 = *MEMORY[0x1E4F39FA8];
  [v43 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v43 settlingDuration];
  objc_msgSend(v43, "setDuration:");
  v46 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position.y"];
  v47 = [NSNumber numberWithDouble:MidY];
  [v46 setFromValue:v47];

  [v40 mass];
  objc_msgSend(v46, "setMass:");
  [v40 damping];
  objc_msgSend(v46, "setDamping:");
  [v40 stiffness];
  objc_msgSend(v46, "setStiffness:");
  [v46 setFillMode:v45];
  [v46 settlingDuration];
  objc_msgSend(v46, "setDuration:");
  v48 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.y"];
  v49 = [NSNumber numberWithDouble:v31];
  [v48 setFromValue:v49];

  [v48 setToValue:&unk_1F3348B38];
  [v41 mass];
  objc_msgSend(v48, "setMass:");
  [v41 damping];
  objc_msgSend(v48, "setDamping:");
  [v41 stiffness];
  objc_msgSend(v48, "setStiffness:");
  [v48 setFillMode:v45];
  [v48 settlingDuration];
  objc_msgSend(v48, "setDuration:");
  v50 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.x"];
  v51 = [NSNumber numberWithDouble:v28];
  [v50 setFromValue:v51];

  [v50 setToValue:&unk_1F3348B38];
  [v41 mass];
  objc_msgSend(v50, "setMass:");
  [v41 damping];
  objc_msgSend(v50, "setDamping:");
  [v41 stiffness];
  objc_msgSend(v50, "setStiffness:");
  [v50 setFillMode:v45];
  [v50 settlingDuration];
  objc_msgSend(v50, "setDuration:");
  v52 = [MEMORY[0x1E4F39B38] animation];
  v84[0] = v46;
  v84[1] = v48;
  v84[2] = v50;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:3];
  [v52 setAnimations:v53];

  [v52 setFillMode:v45];
  [v48 settlingDuration];
  objc_msgSend(v52, "setDuration:");
  v54 = (void *)MEMORY[0x1D948C7A0](v42);
  [v52 setValue:v54 forKey:@"SBActivityFullOverlayAnimationCompletionKey"];

  [v52 setDelegate:v58];
  v55 = [v59 layer];
  [v55 addAnimation:v43 forKey:@"position-y"];

  v56 = [v57 layer];
  [v56 addAnimation:v52 forKey:@"scale-position"];
}

uint64_t __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) layer];
  [v2 setAllowsGroupOpacity:1];

  [*(id *)(a1 + 32) _setContinuousCornerRadius:250.0];
  [*(id *)(a1 + 40) _addNewFullOverlayTransitionBlurMaterialViewWithParentView:*(void *)(a1 + 32) initialWeighting:0 hidden:1.0];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 976) layer];
  [v3 setAllowsGroupOpacity:1];

  [*(id *)(a1 + 40) _addNewBackgroundBlurMaterialViewWithInitialWeighting:0 hidden:0.0];
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 layoutIfNeeded];
}

uint64_t __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 976) setWeighting:0.0];
  [*(id *)(*(void *)(a1 + 32) + 984) setWeighting:1.0];
  long long v2 = [*(id *)(a1 + 32) traitCollection];
  [v2 displayCornerRadius];
  double v4 = v3;

  uint64_t v5 = *(void **)(a1 + 40);
  return [v5 _setContinuousCornerRadius:v4];
}

uint64_t __186__SBActivityAmbientViewController__animateTransitionToFullOverlayForPrimaryActivityItem_transitionType_fullOverlayViewControllerForTransition_oldCompactOverlayViewController_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _setContinuousCornerRadius:0.0];
  long long v2 = [*(id *)(a1 + 32) layer];
  [v2 setAllowsGroupOpacity:0];

  [*(id *)(a1 + 40) _cleanupCompactViewController:*(void *)(a1 + 48)];
  double v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  return [v3 _endAndCleanupTransitionForActivityItem:v4 forTransitionType:v6 compactOverlayViewController:0 fullOverlayViewController:v5 completion:v7];
}

- (void)_animateTransitionToBecomeNewPrimaryAcivityWithItem:(id)a3 transitionType:(int64_t)a4 fullOverlayViewController:(id)a5 compactOverlayViewControllerForTransition:(id)a6 oldFullViewController:(id)a7 oldCompactViewController:(id)a8 completion:(id)a9
{
  id v61 = a3;
  id v52 = a5;
  id v50 = a6;
  id v47 = a7;
  id v54 = a8;
  id v57 = a9;
  self->_isAnimatingTransition = 1;
  id v14 = [(SBActivityAmbientViewController *)self traitCollection];
  [v14 displayCornerRadius];
  double v16 = v15;

  CGFloat v17 = [v47 view];
  v66 = [v54 view];
  double v18 = [v52 view];
  CGFloat v19 = [v50 view];
  [v66 setUserInteractionEnabled:0];
  id v65 = v17;
  [v17 _setContinuousCornerRadius:v16];
  [v18 _setContinuousCornerRadius:v16];
  v42 = [(SBActivityAmbientViewController *)self _addNewSwitchingTransitionViewBelowSubview:v17];
  double v20 = (void *)MEMORY[0x1E4F42FF0];
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke;
  v86[3] = &unk_1E6AF4AC0;
  id v59 = v19;
  id v87 = v59;
  [v20 performWithoutAnimation:v86];
  v69 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
  [v69 setFromValue:&unk_1F3348B48];
  [v69 setToValue:&unk_1F3348B58];
  [v69 setMass:2.0];
  [v69 setDamping:50.0];
  [v69 setStiffness:300.0];
  uint64_t v21 = *MEMORY[0x1E4F39FA8];
  [v69 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v69 setDuration:0.8];
  id v68 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
  [v68 setFromValue:&unk_1F3348B38];
  [v68 setToValue:&unk_1F3348B68];
  [v68 setMass:2.0];
  [v68 setDamping:27.3488];
  [v68 setStiffness:186.88];
  [v68 setFillMode:v21];
  [v68 setDuration:1.1117];
  v46 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
  [v46 setFromValue:&unk_1F3348B38];
  [v46 setToValue:&unk_1F3348B48];
  [v46 setMass:2.0];
  [v46 setDamping:50.0];
  [v46 setStiffness:300.0];
  [v46 setFillMode:v21];
  [v46 setDuration:0.8];
  v44 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
  [v44 setFromValue:&unk_1F3348B78];
  [v44 setToValue:&unk_1F3348B48];
  [v44 setMass:2.0];
  [v44 setDamping:50.0];
  [v44 setStiffness:300.0];
  [v44 setFillMode:v21];
  [v44 setDuration:0.8];
  [v44 setRemovedOnCompletion:0];
  v67 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
  [v67 setFromValue:&unk_1F3348B68];
  [v67 setToValue:&unk_1F3348B38];
  [v67 setMass:2.0];
  [v67 setDamping:27.3488];
  [v67 setStiffness:186.88];
  [v67 setFillMode:v21];
  [v67 setDuration:1.1117];
  v56 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
  [v56 setFromValue:&unk_1F3348B48];
  [v56 setToValue:&unk_1F3348B38];
  [v56 setMass:2.0];
  [v56 setDamping:50.0];
  [v56 setStiffness:300.0];
  [v56 setFillMode:v21];
  [v56 setDuration:0.8];
  [v56 setRemovedOnCompletion:0];
  uint64_t v45 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
  [v45 setFromValue:&unk_1F3348B38];
  [v45 setToValue:&unk_1F3348B88];
  [v45 setMass:2.0];
  [v45 setDamping:51.1883];
  [v45 setStiffness:877.298];
  [v45 setFillMode:v21];
  [v45 setDuration:0.5845];
  [v45 setRemovedOnCompletion:0];
  v41 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
  [v41 setFromValue:&unk_1F3348B38];
  [v41 setToValue:&unk_1F3348B48];
  [v41 setMass:2.0];
  [v41 setDamping:51.1883];
  [v41 setStiffness:877.298];
  [v41 setFillMode:v21];
  [v41 setDuration:0.5845];
  [v41 setRemovedOnCompletion:0];
  v49 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
  [v49 setFromValue:&unk_1F3348B88];
  [v49 setToValue:&unk_1F3348B38];
  [v49 setMass:2.0];
  [v49 setDamping:34.0214];
  [v49 setStiffness:315.827];
  [v49 setFillMode:v21];
  [v49 setDuration:0.8888];
  double v22 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
  [v22 setFromValue:&unk_1F3348B48];
  [v22 setToValue:&unk_1F3348B38];
  [v22 setMass:2.0];
  [v22 setDamping:34.0214];
  [v22 setStiffness:315.827];
  [v22 setFillMode:v21];
  [v22 setDuration:0.8888];
  [v22 setBeginTime:0.2];
  [v22 setRemovedOnCompletion:0];
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke_77;
  v84[3] = &unk_1E6AF5290;
  v84[4] = self;
  id v23 = v18;
  id v85 = v23;
  double v24 = (void *)MEMORY[0x1D948C7A0](v84);
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke_2;
  v74[3] = &unk_1E6B00E48;
  id v75 = v42;
  id v76 = self;
  double v25 = self;
  id v77 = v47;
  id v78 = v54;
  id v79 = v61;
  id v80 = v50;
  id v81 = v52;
  id v82 = v57;
  int64_t v83 = a4;
  id v64 = v57;
  id v58 = v52;
  id v53 = v50;
  id v62 = v61;
  id v55 = v54;
  id v48 = v47;
  id v51 = v42;
  v43 = (void *)MEMORY[0x1D948C7A0](v74);
  int64_t v26 = (void *)MEMORY[0x1D948C7A0]();
  if (v48) {
    double v27 = v46;
  }
  else {
    double v27 = v67;
  }
  [v27 setValue:v26 forKey:@"SBActivityFullOverlayAnimationCompletionKey"];

  [v27 setDelegate:v25];
  double v28 = (void *)MEMORY[0x1D948C7A0](v24);
  [v44 setValue:v28 forKey:@"SBActivityFullOverlayAnimationCompletionKey"];

  [v44 setDelegate:v25];
  id v29 = (void *)MEMORY[0x1E4F42FF0];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke_3;
  v72[3] = &unk_1E6AF4AC0;
  id v73 = v59;
  id v60 = v59;
  [v29 _animateUsingSpringWithDuration:2 delay:v72 options:0 mass:0.8888 stiffness:0.2 damping:2.0 initialVelocity:315.827 animations:34.0214 completion:0.0];
  double v30 = (void *)MEMORY[0x1E4F42FF0];
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke_4;
  v70[3] = &unk_1E6AF4AC0;
  id v71 = v23;
  id v31 = v23;
  [v30 _animateUsingSpringWithDuration:0 delay:v70 options:0 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
  id v32 = [v65 layer];
  [(SBActivityAmbientViewController *)v25 _addGaussianBlurToLayer:v32 inputRadius:0.0];

  int64_t v33 = [v31 layer];
  [(SBActivityAmbientViewController *)v25 _addGaussianBlurToLayer:v33 inputRadius:50.0];

  BOOL v34 = [v65 layer];
  [v34 addAnimation:v68 forKey:@"currentFullScale"];

  v35 = [v65 layer];
  [v35 addAnimation:v69 forKey:@"currentFullBlur"];

  id v36 = [v65 layer];
  [v36 addAnimation:v46 forKey:@"currentFullOverlayAlpha"];

  __int16 v37 = [v66 layer];
  [v37 addAnimation:v45 forKey:@"currentCompactScale"];

  id v38 = [v66 layer];
  [v38 addAnimation:v41 forKey:@"currrentCompactAlpha"];

  uint64_t v39 = [v31 layer];
  [v39 addAnimation:v67 forKey:@"newFullScale"];

  v40 = [v31 layer];
  [v40 addAnimation:v44 forKey:@"newFullBlur"];
}

uint64_t __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 0.5, 0.5);
  return [v1 setTransform:&v3];
}

void __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke_77(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) layer];
  [v1 _removeGaussianBlurFromLayer:v2];
}

uint64_t __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) _cleanupFullViewController:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) _cleanupCompactViewController:*(void *)(a1 + 56)];
  id v2 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v3 = *(void *)(a1 + 96);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  return [v2 _endAndCleanupTransitionForActivityItem:v5 forTransitionType:v3 compactOverlayViewController:v6 fullOverlayViewController:v7 completion:v4];
}

uint64_t __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

uint64_t __228__SBActivityAmbientViewController__animateTransitionToBecomeNewPrimaryAcivityWithItem_transitionType_fullOverlayViewController_compactOverlayViewControllerForTransition_oldFullViewController_oldCompactViewController_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)_animateTransitionToCompactOverlayForItem:(id)a3 transitionType:(int64_t)a4 compactOverlayViewController:(id)a5 completion:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  self->_isAnimatingTransition = 1;
  id v11 = [(SBActivityAmbientFullOverlayViewController *)self->_fullOverlayViewController view];
  id v12 = [v9 view];
  [v9 contentSize];
  -[SBActivityAmbientViewController _compactOverlayFrameForContentSize:](self, "_compactOverlayFrameForContentSize:");
  double v14 = v13;
  double v16 = v15;
  CGFloat v17 = [v11 layer];
  [v17 frame];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  double v23 = v22;
  double v25 = v24;

  int64_t v26 = [(SBActivityAmbientViewController *)self view];
  [v26 bounds];
  double v28 = v27;

  id v29 = [v11 layer];
  [v29 cornerRadius];
  double v31 = v30;

  double v32 = v31 / v28;
  v70.origin.x = v19;
  v70.origin.y = v21;
  v70.size.width = v23;
  v70.size.height = v25;
  double MidX = CGRectGetMidX(v70);
  v71.origin.x = v19;
  v71.origin.y = v21;
  v71.size.width = v23;
  v71.size.height = v25;
  CGFloat v34 = CGRectGetMidY(v71) - v16 * 0.5;
  memset(&v69, 0, sizeof(v69));
  CGAffineTransformMakeScale(&v69, v23 / v14, v25 / v16);
  -[SBActivityAmbientViewController _layoutCompactOverlayIfNecessaryWithView:frame:](self, "_layoutCompactOverlayIfNecessaryWithView:frame:", v12, MidX - v14 * 0.5, v34, v14, v16);
  v35 = (void *)MEMORY[0x1E4F42FF0];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke;
  v63[3] = &unk_1E6B00E70;
  v63[4] = self;
  id v36 = v12;
  id v64 = v36;
  double v67 = v16 * v32;
  CGAffineTransform v68 = v69;
  id v37 = v9;
  id v65 = v37;
  id v38 = v11;
  id v66 = v38;
  [v35 performWithoutAnimation:v63];
  uint64_t v39 = (void *)MEMORY[0x1E4F42FF0];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_2;
  v61[3] = &unk_1E6AF4AC0;
  id v40 = v38;
  id v62 = v40;
  [v39 animateWithDuration:0 delay:v61 options:0 animations:0.2 completion:0.0];
  v41 = (void *)MEMORY[0x1E4F42FF0];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_3;
  v59[3] = &unk_1E6AF4AC0;
  id v42 = v37;
  id v60 = v42;
  [v41 animateWithDuration:0 delay:v59 options:0 animations:0.2 completion:0.1];
  v43 = (void *)MEMORY[0x1E4F42FF0];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_4;
  v57[3] = &unk_1E6AF4AC0;
  id v44 = v42;
  id v58 = v44;
  [v43 animateWithDuration:0 delay:v57 options:0 animations:0.2 completion:0.2];
  uint64_t v45 = (void *)MEMORY[0x1E4F42FF0];
  v46 = [(SBActivityAmbientViewController *)self _animationSettingsForTransitionType:a4];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_5;
  v53[3] = &unk_1E6AF59B8;
  v53[4] = self;
  id v54 = v44;
  id v55 = v36;
  id v56 = v40;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_6;
  v51[3] = &unk_1E6AFA3D8;
  id v52 = v10;
  id v47 = v10;
  id v48 = v40;
  id v49 = v36;
  id v50 = v44;
  objc_msgSend(v45, "sb_animateWithSettings:mode:animations:completion:", v46, 3, v53, v51);
}

uint64_t __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];

  [*(id *)(a1 + 40) setHidden:0];
  [*(id *)(a1 + 40) _setContinuousCornerRadius:*(double *)(a1 + 64)];
  long long v3 = *(void **)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 88);
  v8[0] = *(_OWORD *)(a1 + 72);
  v8[1] = v4;
  v8[2] = *(_OWORD *)(a1 + 104);
  [v3 setTransform:v8];
  [*(id *)(a1 + 48) setBackgroundAlpha:0.0];
  [*(id *)(a1 + 48) setContentAlpha:0.0];
  [*(id *)(a1 + 40) setAlpha:1.0];
  [*(id *)(a1 + 32) _addNewFullOverlayTransitionBlurMaterialViewWithParentView:*(void *)(a1 + 56) initialWeighting:1 hidden:0.0];
  [*(id *)(*(void *)(a1 + 32) + 976) setHidden:0];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 976) layer];
  [v5 setAllowsGroupOpacity:1];

  uint64_t v6 = [*(id *)(a1 + 56) layer];
  [v6 setAllowsGroupOpacity:1];

  return [*(id *)(a1 + 56) layoutIfNeeded];
}

uint64_t __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundAlpha:1.0];
}

uint64_t __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setContentAlpha:1.0];
}

void __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_5(id *a1)
{
  [*((id *)a1[4] + 123) setWeighting:0.0];
  [*((id *)a1[4] + 122) setWeighting:1.0];
  id v2 = a1[4];
  [a1[5] contentSize];
  objc_msgSend(v2, "_compactOverlayFrameForContentSize:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = a1[6];
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v16[0] = *MEMORY[0x1E4F1DAB8];
  v16[1] = v12;
  v16[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v11 setTransform:v16];
  objc_msgSend(a1[6], "setFrame:", v4, v6, v8, v10);
  objc_msgSend(a1[7], "setFrame:", v4, v6, v8, v10);
  [a1[5] cornerRadius];
  double v14 = v13;
  objc_msgSend(a1[6], "_setContinuousCornerRadius:");
  [a1[7] _setContinuousCornerRadius:v14];
  [a1[6] setAlpha:1.0];
  double v15 = [a1[4] view];
  [v15 layoutIfNeeded];
}

uint64_t __132__SBActivityAmbientViewController__animateTransitionToCompactOverlayForItem_transitionType_compactOverlayViewController_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_animationSettingsForFullOverlayTransitionYCurve
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v2 setBehaviorType:1];
  [v2 setDampingRatio:0.84];
  [v2 setResponse:0.435];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v2, "setFrameRateRange:highFrameRateReason:", 1114143, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
  return v2;
}

- (id)_animationSettingsForTransitionType:(int64_t)a3
{
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v4 setBehaviorType:1];
  double v5 = 0.0;
  double v6 = 0.0;
  if ((unint64_t)a3 <= 4)
  {
    double v5 = dbl_1D8FD15C8[a3];
    double v6 = dbl_1D8FD15F0[a3];
  }
  [v4 setDampingRatio:v6];
  [v4 setResponse:v5];
  CAFrameRateRange v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v4, "setFrameRateRange:highFrameRateReason:", 1114143, *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);
  return v4;
}

- (BOOL)_canTransitionActivityItem:(id)a3 forTransitionType:(int64_t)a4
{
  double v6 = (SBActivityItem *)a3;
  if ([(SBActivityAmbientViewController *)self _isActiveActivityItem:v6])
  {
    BOOL v7 = 1;
    switch(a4)
    {
      case 0:
        if (self->_primaryActivityItem != v6) {
          goto LABEL_8;
        }
        BOOL v8 = self->_overlayMode == 1;
        goto LABEL_11;
      case 1:
        uint64_t v9 = 1072;
        goto LABEL_7;
      case 2:
        uint64_t v9 = 1080;
LABEL_7:
        if (*(SBActivityItem **)((char *)&self->super.super.super.isa + v9) != v6) {
          goto LABEL_8;
        }
        BOOL v8 = self->_overlayMode == 0;
LABEL_11:
        BOOL v7 = v8;
        break;
      case 3:
      case 4:
        break;
      default:
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_layerHasGaussianBlurFilter:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v3 = objc_msgSend(a3, "filters", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = *MEMORY[0x1E4F3A0D0];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) name];
        char v10 = [v9 isEqualToString:v7];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (void)_addGaussianBlurToLayer:(id)a3 inputRadius:(double)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(SBActivityAmbientViewController *)self _layerHasGaussianBlurFilter:v6])
  {
    uint64_t v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v7 setName:@"gaussianBlur"];
    [v7 setValue:@"default" forKey:@"inputQuality"];
    [v7 setValue:@"default" forKey:@"inputIntermediateBitDepth"];
    BOOL v8 = [NSNumber numberWithDouble:a4];
    [v7 setValue:v8 forKey:@"inputRadius"];

    uint64_t v9 = MEMORY[0x1E4F1CC28];
    [v7 setValue:MEMORY[0x1E4F1CC28] forKey:@"inputNormalizeEdges"];
    [v7 setValue:v9 forKey:@"inputHardEdges"];
    char v10 = [v6 filters];
    BOOL v11 = (void *)[v10 mutableCopy];

    [v11 addObject:v7];
    v13[0] = v7;
    long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v6 setFilters:v12];
  }
}

- (void)_removeGaussianBlurFromLayer:(id)a3
{
}

- (void)_addNewFullOverlayTransitionBlurMaterialViewWithParentView:(id)a3 initialWeighting:(double)a4 hidden:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [(SBActivityAmbientViewController *)self _cleanupTransitionBlurViewIfNecessary];
  uint64_t v9 = (void *)MEMORY[0x1E4F743C8];
  char v10 = SBHBundle();
  BOOL v11 = [v9 materialViewWithRecipeNamed:@"ambientContentOverlay" inBundle:v10 options:0 initialWeighting:0 scaleAdjustment:a4];

  [v8 bounds];
  objc_msgSend(v11, "setFrame:");
  [v11 setOverrideUserInterfaceStyle:2];
  [v11 setAutoresizingMask:18];
  [v11 setHidden:v5];
  [v8 addSubview:v11];
  [v8 bringSubviewToFront:v11];
  [v8 layoutIfNeeded];

  fullOverlayTransitionBlurView = self->_fullOverlayTransitionBlurView;
  self->_fullOverlayTransitionBlurView = (MTMaterialView *)v11;
}

- (void)_addNewBackgroundBlurMaterialViewWithInitialWeighting:(double)a3 hidden:(BOOL)a4
{
  if (!self->_backgroundBlurMaterialView)
  {
    BOOL v4 = a4;
    id v11 = [(SBActivityAmbientViewController *)self view];
    uint64_t v7 = (void *)MEMORY[0x1E4F743C8];
    id v8 = SBHBundle();
    uint64_t v9 = [v7 materialViewWithRecipeNamed:@"activityAmbientBackground" inBundle:v8 options:0 initialWeighting:0 scaleAdjustment:a3];

    [v11 bounds];
    objc_msgSend(v9, "setFrame:");
    [v9 setOverrideUserInterfaceStyle:2];
    [v9 setHidden:v4];
    [v9 setAutoresizingMask:18];
    [v11 addSubview:v9];
    [v11 sendSubviewToBack:v9];
    [v11 layoutIfNeeded];
    backgroundBlurMaterialView = self->_backgroundBlurMaterialView;
    self->_backgroundBlurMaterialView = (MTMaterialView *)v9;
  }
}

- (void)_addNewCompactOverlayTransitionViewWithParentView:(id)a3 alpha:(double)a4
{
  if (!self->_compactOverlayTransitionView)
  {
    id v6 = (objc_class *)MEMORY[0x1E4F42FF0];
    id v7 = a3;
    id v8 = (UIView *)objc_alloc_init(v6);
    [v7 bounds];
    -[UIView setFrame:](v8, "setFrame:");
    uint64_t v9 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIView *)v8 setBackgroundColor:v9];

    [(UIView *)v8 setAlpha:a4];
    [(UIView *)v8 setAutoresizingMask:18];
    [v7 addSubview:v8];
    [v7 bringSubviewToFront:v8];
    [v7 layoutIfNeeded];

    compactOverlayTransitionView = self->_compactOverlayTransitionView;
    self->_compactOverlayTransitionView = v8;
  }
}

- (id)_addNewSwitchingTransitionViewBelowSubview:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F42FF0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(SBActivityAmbientViewController *)self view];
  [v7 bounds];
  objc_msgSend(v6, "setFrame:");

  id v8 = [MEMORY[0x1E4F428B8] blackColor];
  [v6 setBackgroundColor:v8];

  uint64_t v9 = [(SBActivityAmbientViewController *)self view];
  [v9 insertSubview:v6 belowSubview:v5];

  char v10 = [(SBActivityAmbientViewController *)self view];
  [v10 layoutIfNeeded];

  return v6;
}

- (void)_endAndCleanupTransitionForActivityItem:(id)a3 forTransitionType:(int64_t)a4 compactOverlayViewController:(id)a5 fullOverlayViewController:(id)a6 completion:(id)a7
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (void (**)(void))a7;
  long long v12 = SBLogActivity();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = [v10 identifier];
    int v17 = 138543618;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    int64_t v20 = a4;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] ending ambient overlay transition for type: %ld", (uint8_t *)&v17, 0x16u);
  }
  --self->_transitionAnimationCount;
  [(SBActivityAmbientViewController *)self _cleanupTransitionBlurViewIfNecessary];
  [(SBActivityAmbientViewController *)self _cleanupBackgroundBlurViewIfNecessary];
  [(SBActivityAmbientViewController *)self _cleanupSwitchingTransitionView];
  self->_isAnimatingTransition = 0;
  if (a4)
  {
    if (a4 == 1) {
      [(SBActivityAmbientViewController *)self _cleanupCurrentFullOverlayViewController];
    }
  }
  else
  {
    [(SBActivityAmbientViewController *)self _addSecondaryActivityItemIfAvailable];
  }
  long long v14 = [(SBActivityAmbientViewController *)self delegate];
  [v14 activityAmbientViewControllerResetIdleTimerBehavior:self];

  [(SBActivityAmbientViewController *)self _updateResolvedPreferences];
  long long v15 = SBLogActivity();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    long long v16 = [v10 identifier];
    int v17 = 138543618;
    uint64_t v18 = v16;
    __int16 v19 = 2048;
    int64_t v20 = a4;
    _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Transition completed for type: %ld", (uint8_t *)&v17, 0x16u);
  }
  if (v11) {
    v11[2](v11);
  }
}

- (void)_addSecondaryActivityItemIfAvailable
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v3 = [(SBActivityAmbientViewController *)self delegate];
  BOOL v4 = [v3 activityAmbientViewControllerNextPendingActivityItem:self];

  if (v4)
  {
    id v5 = SBLogActivity();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 identifier];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] dequeueing ambient item to be secondary", (uint8_t *)&v7, 0xCu);
    }
    [(SBActivityAmbientViewController *)self addOverlayForSecondaryActivityItem:v4];
  }
}

- (void)_resetPrimaryActivityItemWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(void))a3;
  id v5 = v4;
  if (!self->_isAnimatingTransition)
  {
    if (self->_primaryActivityItem)
    {
      if (v4) {
        v4[2](v4);
      }
    }
    else
    {
      secondaryActivityItem = self->_secondaryActivityItem;
      if (secondaryActivityItem)
      {
        [(SBActivityAmbientViewController *)self _transitionOverlayForActivityItem:secondaryActivityItem withTransitionType:2 withCompletion:v4];
      }
      else
      {
        int v7 = [(SBActivityAmbientViewController *)self delegate];
        id v8 = [v7 activityAmbientViewControllerNextPendingActivityItem:self];

        if (v8)
        {
          uint64_t v9 = SBLogActivity();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            id v10 = [v8 identifier];
            int v11 = 138543362;
            long long v12 = v10;
            _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] dequeueing ambient item to be primary", (uint8_t *)&v11, 0xCu);
          }
          if (self->_overlayMode)
          {
            [(SBActivityAmbientViewController *)self _setPrimaryActivityItem:v8];
            [(SBActivityAmbientViewController *)self _updateCompactActivityOverlayWithItem:v8 withCompletion:v5];
          }
          else
          {
            [(SBActivityAmbientViewController *)self _transitionOverlayForActivityItem:v8 withTransitionType:3 withCompletion:v5];
          }
        }
        else if (v5)
        {
          v5[2](v5);
        }
        [(SBActivityAmbientViewController *)self _didUpdateVisibleActivityItems];
      }
    }
  }
}

- (void)_layoutCompactOverlayIfNecessaryWithView:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  id v14 = v9;
  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v10 = [(SBActivityAmbientCompactOverlayViewController *)self->_compactOverlayViewController view];
  }
  int v11 = v10;
  objc_msgSend(v10, "setFrame:", x, y, width, height);
  long long v12 = [(SBActivityAmbientViewController *)self view];
  [v12 bringSubviewToFront:v11];

  uint64_t v13 = [(SBActivityAmbientViewController *)self view];
  [v13 layoutIfNeeded];
}

- (CGRect)_compactOverlayFrameForContentSize:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  id v5 = [(SBActivityAmbientViewController *)self view];
  [v5 bounds];
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v19.origin.double x = v7;
  v19.origin.double y = v9;
  v19.size.double width = v11;
  v19.size.CGFloat height = v13;
  CGFloat MidX = CGRectGetMidX(v19);
  double v15 = v9 + 20.0;
  double v16 = MidX + width * -0.5;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.double width = v17;
  result.origin.double y = v15;
  result.origin.double x = v16;
  return result;
}

- (void)_layoutFullOverlayWithActivityView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBActivityAmbientViewController *)self view];
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setAutoresizingMask:18];

  [v5 layoutIfNeeded];
}

- (BOOL)_transitionTypeIsToFullOverlay:(int64_t)a3
{
  return ((unint64_t)a3 < 5) & (0x1Du >> a3);
}

- (void)_addDismissGesture
{
  if (!self->_dismissEdgePanGesture)
  {
    double v3 = [[SBScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:sel__handleDismissGesture_ type:5 options:0];
    dismissEdgePanGesture = self->_dismissEdgePanGesture;
    self->_dismissEdgePanGesture = &v3->super;

    [(UIScreenEdgePanGestureRecognizer *)self->_dismissEdgePanGesture setEdges:4];
    [(UIScreenEdgePanGestureRecognizer *)self->_dismissEdgePanGesture setAllowedTouchTypes:&unk_1F3347D78];
    [(UIScreenEdgePanGestureRecognizer *)self->_dismissEdgePanGesture setDelegate:self];
    id v5 = +[SBSystemGestureManager mainDisplayManager];
    [v5 addGestureRecognizer:self->_dismissEdgePanGesture withType:134];
  }
  if (!self->_dismissPanGesture)
  {
    double v6 = [(SBActivityAmbientViewController *)self _ambientActivitySettings];
    int v7 = [v6 fullScreenDismissGestureEnabled];

    if (v7)
    {
      double v8 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel__handleDismissGesture_];
      dismissPanGesture = self->_dismissPanGesture;
      self->_dismissPanGesture = v8;

      [(UIPanGestureRecognizer *)self->_dismissPanGesture setAllowedTouchTypes:&unk_1F3347D90];
      [(UIPanGestureRecognizer *)self->_dismissPanGesture setDelegate:self];
      id v10 = [(SBActivityAmbientViewController *)self view];
      [v10 addGestureRecognizer:self->_dismissPanGesture];
    }
  }
}

- (void)_removeDismissGesture
{
  if (self->_dismissEdgePanGesture)
  {
    double v3 = +[SBSystemGestureManager mainDisplayManager];
    [v3 removeGestureRecognizer:self->_dismissEdgePanGesture];

    dismissEdgePanGesture = self->_dismissEdgePanGesture;
    self->_dismissEdgePanGesture = 0;
  }
  if (self->_dismissPanGesture)
  {
    id v5 = [(SBActivityAmbientViewController *)self view];
    [v5 removeGestureRecognizer:self->_dismissPanGesture];

    dismissPanGesture = self->_dismissPanGesture;
    self->_dismissPanGesture = 0;
  }
}

- (void)_handleDismissGesture:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [v5 state];
  if (v4 == 2) {
    goto LABEL_4;
  }
  if (v4 == 1)
  {
    [(SBActivityAmbientViewController *)self _handleDismissGestureBegan:v5];
LABEL_4:
    [(SBActivityAmbientViewController *)self _handleDismissGestureChanged:v5];
    goto LABEL_6;
  }
  [(SBActivityAmbientViewController *)self _handleDismissGestureEnded:v5];
LABEL_6:
}

- (void)_handleDismissGestureBegan:(id)a3
{
  self->_isInFullOverlayDrag = 1;
  id v4 = a3;
  id v5 = [(SBActivityAmbientViewController *)self traitCollection];
  [v5 displayCornerRadius];
  double v7 = v6;

  double v8 = [(SBActivityAmbientFullOverlayViewController *)self->_fullOverlayViewController view];
  [v8 _setContinuousCornerRadius:v7];

  [(SBActivityAmbientViewController *)self setCompactOverlayHidden:1];
  double v9 = [(SBActivityAmbientViewController *)self view];
  [v4 locationInView:v9];
  double v11 = v10;
  double v13 = v12;

  -[SBActivityAmbientViewController _prepareFullOverlayViewForDragWithLocation:](self, "_prepareFullOverlayViewForDragWithLocation:", v11, v13);
}

- (void)_handleDismissGestureChanged:(id)a3
{
  id v4 = a3;
  id v9 = [(SBActivityAmbientViewController *)self view];
  [v4 translationInView:v9];
  double v6 = v5;
  double v8 = v7;

  -[SBActivityAmbientViewController _beginFullOverlayDragWithTranslation:](self, "_beginFullOverlayDragWithTranslation:", v6, v8);
}

- (void)_handleDismissGestureEnded:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  self->_isInFullOverlayDrag = 0;
  self->_currentFullOverlayDragTranslationY = 9.22337204e18;
  self->_currentFullOverlayDragScale = 9.22337204e18;
  self->_currentFullOverlayDragOriginY = 9.22337204e18;
  id v4 = a3;
  double v5 = [(SBActivityAmbientViewController *)self view];
  [v4 translationInView:v5];
  double v7 = v6;

  double v8 = [(SBActivityAmbientViewController *)self view];
  [v4 velocityInView:v8];
  double v10 = v9;

  double v11 = fabs(v7);
  if ((fabs(v10) <= 50.0 || v10 >= 0.0) && v11 <= 50.0)
  {
    [(SBActivityAmbientViewController *)self _cancelFullOverlayDrag];
  }
  else
  {
    id v14 = [(SBActivityItem *)self->_primaryActivityItem descriptor];
    int v15 = [v14 isMomentary];

    if (v15)
    {
      double v16 = SBLogActivity();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        double v17 = [(SBActivityItem *)self->_primaryActivityItem identifier];
        int v21 = 138543362;
        double v22 = v17;
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] ambient full screen dismissed but is momentary so ending activity", (uint8_t *)&v21, 0xCu);
      }
      id v18 = objc_alloc_init(MEMORY[0x1E4F18130]);
      CGRect v19 = [(SBActivityItem *)self->_primaryActivityItem identifier];
      [v18 endActivity:v19];
    }
    else
    {
      primaryActivityItem = self->_primaryActivityItem;
      [(SBActivityAmbientViewController *)self _transitionOverlayForActivityItem:primaryActivityItem withTransitionType:1 withCompletion:0];
    }
  }
}

- (void)_prepareFullOverlayViewForDragWithLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v6 = [(SBActivityAmbientFullOverlayViewController *)self->_fullOverlayViewController view];
  [v6 frame];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__SBActivityAmbientViewController__prepareFullOverlayViewForDragWithLocation___block_invoke;
  v15[3] = &unk_1E6AFAB40;
  void v15[4] = self;
  *(CGFloat *)&void v15[5] = x;
  *(CGFloat *)&v15[6] = y;
  v15[7] = v8;
  v15[8] = v10;
  v15[9] = v12;
  v15[10] = v14;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v15];
}

void __78__SBActivityAmbientViewController__prepareFullOverlayViewForDragWithLocation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1112) view];
  objc_msgSend(*(id *)(a1 + 32), "_setAnchorPointForDrag:forView:", v2, vdivq_f64(*(float64x2_t *)(a1 + 40), *(float64x2_t *)(a1 + 72)));
}

- (void)_setAnchorPointForDrag:(CGPoint)a3 forView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v18 = a4;
  [v18 frame];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = [v18 layer];
  objc_msgSend(v10, "setAnchorPoint:", x, y);

  [v18 frame];
  double v12 = v11 - v7;
  double v14 = v13 - v9;
  [v18 center];
  double v16 = v15 - v12;
  [v18 center];
  objc_msgSend(v18, "setCenter:", v16, v17 - v14);
}

- (void)_beginFullOverlayDragWithTranslation:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  double v6 = [(SBActivityAmbientFullOverlayViewController *)self->_fullOverlayViewController view];
  double currentFullOverlayDragTranslationY = self->_currentFullOverlayDragTranslationY;
  double v8 = y;
  if (currentFullOverlayDragTranslationY != 9.22337204e18)
  {
    double currentFullOverlayDragOriginY = self->_currentFullOverlayDragOriginY;
    if (y <= 50.0) {
      double v10 = y;
    }
    else {
      double v10 = self->_currentFullOverlayDragTranslationY;
    }
    if (currentFullOverlayDragOriginY >= 30.0) {
      double v11 = y;
    }
    else {
      double v11 = self->_currentFullOverlayDragTranslationY;
    }
    if (y < currentFullOverlayDragTranslationY) {
      double v12 = v11;
    }
    else {
      double v12 = v10;
    }
    if (currentFullOverlayDragOriginY == 9.22337204e18) {
      double v8 = y;
    }
    else {
      double v8 = v12;
    }
  }
  [(SBActivityAmbientViewController *)self _scaleForFullOverlayDismissalWithTranslation:y];
  CGFloat currentFullOverlayDragScale = v13;
  if (v13 < 0.2 && self->_currentFullOverlayDragScale != 9.22337204e18) {
    CGFloat currentFullOverlayDragScale = self->_currentFullOverlayDragScale;
  }
  double v15 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  memset(&v33, 0, sizeof(v33));
  CGAffineTransformMakeScale(&v33, currentFullOverlayDragScale, currentFullOverlayDragScale);
  memset(&v32, 0, sizeof(v32));
  CGAffineTransformMakeTranslation(&v32, x, v8);
  CGAffineTransform t1 = v33;
  memset(&v31, 0, sizeof(v31));
  CGAffineTransform t2 = v32;
  CGAffineTransformConcat(&v31, &t1, &t2);
  [(SBActivityAmbientViewController *)self _cornerRadiusForFullOverlayDismissalWithTranslation:v8];
  uint64_t v17 = v16;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __72__SBActivityAmbientViewController__beginFullOverlayDragWithTranslation___block_invoke;
  v28[3] = &unk_1E6AF4AC0;
  v28[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v28];
  id v18 = (void *)MEMORY[0x1E4F42FF0];
  CGRect v19 = [(SBActivityAmbientViewController *)self _animationSettingsForFullOverlayDrag];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  CGAffineTransform v26 = v31;
  v24[2] = __72__SBActivityAmbientViewController__beginFullOverlayDragWithTranslation___block_invoke_2;
  v24[3] = &unk_1E6B00E98;
  id v25 = v6;
  uint64_t v27 = v17;
  id v20 = v6;
  objc_msgSend(v18, "sb_animateWithSettings:mode:animations:completion:", v19, 5, v24, 0);

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __72__SBActivityAmbientViewController__beginFullOverlayDragWithTranslation___block_invoke_3;
  v23[3] = &unk_1E6AF4A70;
  void v23[4] = self;
  *(double *)&void v23[5] = v8;
  objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", v15, 3, v23, 0);
  self->_double currentFullOverlayDragTranslationY = v8;
  self->_CGFloat currentFullOverlayDragScale = currentFullOverlayDragScale;
  int v21 = [v20 layer];
  [v21 frame];
  self->_double currentFullOverlayDragOriginY = v22;
}

void __72__SBActivityAmbientViewController__beginFullOverlayDragWithTranslation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _addNewBackgroundBlurMaterialViewWithInitialWeighting:0 hidden:1.0];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];
}

uint64_t __72__SBActivityAmbientViewController__beginFullOverlayDragWithTranslation___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  [v2 setTransform:v5];
  return [*(id *)(a1 + 32) _setContinuousCornerRadius:*(double *)(a1 + 88)];
}

uint64_t __72__SBActivityAmbientViewController__beginFullOverlayDragWithTranslation___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 984);
  [*(id *)(a1 + 32) _blurWeightingForFullOverlayDismissalWithTranslation:*(double *)(a1 + 40)];
  return objc_msgSend(v1, "setWeighting:");
}

- (double)_scaleForFullOverlayDismissalWithTranslation:(double)a3
{
  id v4 = [(SBActivityAmbientViewController *)self view];
  [v4 bounds];
  double v6 = a3 / (v5 / 6.0) + 1.0;

  BSUIConstrainValueWithRubberBand();
  if (v6 >= 1.0) {
    double v8 = v7 + 1.0;
  }
  else {
    double v8 = 1.0 - v7;
  }
  return fmin(fmax(v8, 0.0), 1.1);
}

- (double)_blurWeightingForFullOverlayDismissalWithTranslation:(double)a3
{
  id v4 = [(SBActivityAmbientViewController *)self view];
  [v4 bounds];
  double v6 = a3 / (v5 * 0.25) + 1.0;

  BSUIConstrainValueWithRubberBand();
  if (v6 >= 1.0) {
    double v8 = v7 + 1.0;
  }
  else {
    double v8 = 1.0 - v7;
  }
  return fmin(fmax(v8, 0.0), 1.1);
}

- (double)_cornerRadiusForFullOverlayDismissalWithTranslation:(double)a3
{
  double v3 = fabs(a3);
  id v4 = [(SBActivityAmbientFullOverlayViewController *)self->_fullOverlayViewController view];
  [v4 bounds];
  double v6 = v5;

  double result = v6 * 0.5;
  if (v3 <= v6 * 0.5) {
    return v3;
  }
  return result;
}

- (id)_animationSettingsForFullOverlayDrag
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v2 setBehaviorType:1];
  [v2 setDefaultValues];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v2, "setFrameRateRange:highFrameRateReason:", 1114143, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
  return v2;
}

- (id)_animationSettingsForFullOverlayDragCancel
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v2 setBehaviorType:1];
  [v2 setDampingRatio:1.0];
  [v2 setResponse:0.5];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v2, "setFrameRateRange:highFrameRateReason:", 1114143, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
  return v2;
}

- (void)_cancelFullOverlayDrag
{
  [(SBActivityAmbientViewController *)self setCompactOverlayHidden:0];
  double v3 = [(SBActivityAmbientFullOverlayViewController *)self->_fullOverlayViewController view];
  id v4 = [(SBActivityAmbientViewController *)self view];
  [v4 bounds];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;

  double v13 = (void *)MEMORY[0x1E4F42FF0];
  double v14 = [(SBActivityAmbientViewController *)self _animationSettingsForFullOverlayDragCancel];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__SBActivityAmbientViewController__cancelFullOverlayDrag__block_invoke;
  v18[3] = &unk_1E6AF6D10;
  uint64_t v21 = v6;
  uint64_t v22 = v8;
  uint64_t v23 = v10;
  uint64_t v24 = v12;
  id v19 = v3;
  id v20 = self;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__SBActivityAmbientViewController__cancelFullOverlayDrag__block_invoke_2;
  _OWORD v16[3] = &unk_1E6AFA190;
  void v16[4] = self;
  id v17 = v19;
  id v15 = v19;
  objc_msgSend(v13, "sb_animateWithSettings:mode:animations:completion:", v14, 3, v18, v16);
}

uint64_t __57__SBActivityAmbientViewController__cancelFullOverlayDrag__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v2, "setAnchorPoint:", 0.5, 0.5);

  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 64) * 0.5, *(double *)(a1 + 72) * 0.5);
  double v3 = *(void **)(a1 + 32);
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v6[0] = *MEMORY[0x1E4F1DAB8];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:v6];
  return [*(id *)(*(void *)(a1 + 40) + 976) setWeighting:0.0];
}

uint64_t __57__SBActivityAmbientViewController__cancelFullOverlayDrag__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1024) = 0;
  [*(id *)(a1 + 40) _setContinuousCornerRadius:0.0];
  [*(id *)(a1 + 32) _cleanupTransitionBlurViewIfNecessary];
  id v2 = *(void **)(a1 + 32);
  return [v2 _cleanupBackgroundBlurViewIfNecessary];
}

- (void)handleTapForCompactOverlayViewController:(id)a3 withActivityItem:(id)a4
{
  [(SBActivityAmbientViewController *)self _transitionOverlayForActivityItem:a4 withTransitionType:2 * (self->_primaryActivityItem != a4) withCompletion:0];
}

- (void)activityViewController:(id)a3 didSetIdleTimerDisabled:(BOOL)a4
{
  if (self->_fullOverlayViewController == a3)
  {
    id v5 = [(SBActivityAmbientViewController *)self delegate];
    [v5 activityAmbientViewControllerResetIdleTimerBehavior:self];
  }
}

- (void)activityViewControllerContentRequestsCancellingGesture:(id)a3
{
  if (self->_fullOverlayViewController == a3)
  {
    [(UIPanGestureRecognizer *)self->_dismissPanGesture setEnabled:0];
    [(UIPanGestureRecognizer *)self->_dismissPanGesture setEnabled:1];
    [(UIScreenEdgePanGestureRecognizer *)self->_dismissEdgePanGesture setEnabled:0];
    dismissEdgePanGesture = self->_dismissEdgePanGesture;
    [(UIScreenEdgePanGestureRecognizer *)dismissEdgePanGesture setEnabled:1];
  }
}

- (void)activityViewControllerDidUpdateAudioCategoriesDisablingVolumeHUD:(id)a3
{
  if (self->_fullOverlayViewController == a3) {
    [(SBActivityAmbientViewController *)self _updateAudioCategoriesDisablingVolumeHUD];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  objc_msgSend(a3, "valueForKey:", @"SBActivityFullOverlayAnimationCompletionKey", a4);
  long long v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    id v5 = v4;
    v4[2]();
    long long v4 = v5;
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_dismissEdgePanGesture != a3 && self->_dismissPanGesture != a3) {
    return 0;
  }
  long long v4 = [(SBActivityAmbientViewController *)self delegate];
  int v5 = [v4 activityAmbientViewControllerCanBeginFullOverlayDismissGesture:self];

  uint64_t v6 = [(id)SBApp bannerManager];
  uint64_t v7 = [(SBActivityAmbientViewController *)self view];
  uint64_t v8 = [v7 _sbWindowScene];
  int v9 = [v6 isDisplayingBannerInWindowScene:v8];

  uint64_t v10 = [(SBActivityViewController *)self->_fullOverlayViewController activityItem];
  BOOL v11 = [(SBActivityAmbientViewController *)self _isActiveActivityItem:v10];

  if (!self->_fullOverlayViewController) {
    return 0;
  }
  int v12 = v5 ^ 1;
  if (self->_overlayMode) {
    int v12 = 1;
  }
  if ((v12 | v9)) {
    return 0;
  }
  if (self->_isInFullOverlayDrag) {
    return 0;
  }
  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  uint64_t v6 = (UIScreenEdgePanGestureRecognizer *)a3;
  uint64_t v7 = (UIScreenEdgePanGestureRecognizer *)a4;
  dismissPanGesture = self->_dismissPanGesture;
  dismissEdgePanGesture = self->_dismissEdgePanGesture;
  BOOL v12 = dismissPanGesture == (UIPanGestureRecognizer *)v6 && dismissEdgePanGesture == v7
     || dismissPanGesture == (UIPanGestureRecognizer *)v7 && dismissEdgePanGesture == v6;

  return v12;
}

- (void)invalidate
{
  [(SBActivityViewController *)self->_fullOverlayViewController invalidate];
  [(SBActivityViewController *)self->_compactOverlayViewController invalidate];
  [(SBActivityAmbientViewController *)self _removeDismissGesture];
}

- (SBActivityItem)primaryActivityItem
{
  return self->_primaryActivityItem;
}

- (SBActivityItem)secondaryActivityItem
{
  return self->_secondaryActivityItem;
}

- (int64_t)overlayMode
{
  return self->_overlayMode;
}

- (NSSet)audioCategoriesDisablingVolumeHUD
{
  return self->_audioCategoriesDisablingVolumeHUD;
}

- (SBActivityAmbientViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBActivityAmbientViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBActivityAmbientFullOverlayViewController)fullOverlayViewController
{
  return self->_fullOverlayViewController;
}

- (void)setFullOverlayViewController:(id)a3
{
}

- (SBActivityAmbientCompactOverlayViewController)compactOverlayViewController
{
  return self->_compactOverlayViewController;
}

- (void)setCompactOverlayViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactOverlayViewController, 0);
  objc_storeStrong((id *)&self->_fullOverlayViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
  objc_storeStrong((id *)&self->_secondaryActivityItem, 0);
  objc_storeStrong((id *)&self->_primaryActivityItem, 0);
  objc_storeStrong((id *)&self->_dismissPanGesture, 0);
  objc_storeStrong((id *)&self->_dismissEdgePanGesture, 0);
  objc_storeStrong((id *)&self->_switchingTransitionView, 0);
  objc_storeStrong((id *)&self->_compactOverlayTransitionView, 0);
  objc_storeStrong((id *)&self->_backgroundBlurMaterialView, 0);
  objc_storeStrong((id *)&self->_fullOverlayTransitionBlurView, 0);
}

void __80__SBActivityAmbientViewController__fullOverlayViewControllerForItem_completion___block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) identifier];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "[ActivityID: %{public}@] error ensuring ambient full screen overlay content: %{public}@", v4, v5, v6, v7, v8);
}

void __83__SBActivityAmbientViewController__compactOverlayViewControllerForItem_completion___block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) identifier];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "[ActivityID: %{public}@] error ensuring ambient compact overlay content: %{public}@", v4, v5, v6, v7, v8);
}

@end