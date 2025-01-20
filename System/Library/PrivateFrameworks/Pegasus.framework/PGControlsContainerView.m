@interface PGControlsContainerView
- (BOOL)_controlsShouldAutoHide;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isInteractivelyResizing;
- (BOOL)isShowingControlsForHoverActive;
- (BOOL)showsPictureInPictureUnavailableIndicator;
- (PGCommandHandler)commandHandler;
- (PGControlsContainerView)initWithFrame:(CGRect)a3 viewModel:(id)a4;
- (id)_acquirePreventAutoHideOfControlsAssertionWithReason:(id)a3;
- (id)_performVisibilityTransitionAnimated:(BOOL)a3 existingAnimator:(id)a4 animations:(id)a5 success:(id)a6;
- (id)_updateVisibilityOfView:(id)a3 hidden:(BOOL)a4 animated:(BOOL)a5 existingAnimator:(id)a6;
- (id)coordinatedAnimationsForControlsVisibiity;
- (id)viewModel;
- (void)_handleDoubleDoubleTapGestureRecognizer:(id)a3;
- (void)_handleDoubleTapGestureRecognizer:(id)a3;
- (void)_handleHoverGestureRecognizer:(id)a3;
- (void)_handleSingleTapGestureRecognizer:(id)a3;
- (void)_invalidateTimer;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setControlsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)_setPrefersControlsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateHideControlsAfterDelayTimer;
- (void)controlsViewModel:(id)a3 didIssueCommand:(id)a4;
- (void)controlsViewModel:(id)a3 valuesChangedFromOldValue:(id)a4;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setCommandHandler:(id)a3;
- (void)setControlsContainerHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setCoordinatedAnimationsForControlsVisibiity:(id)a3;
- (void)setHoverGestureDisbaled:(BOOL)a3;
- (void)setInteractivelyResizing:(BOOL)a3;
- (void)setShowingControlsForHoverActive:(BOOL)a3;
- (void)setShowsPictureInPictureUnavailableIndicator:(BOOL)a3;
@end

@implementation PGControlsContainerView

- (PGControlsContainerView)initWithFrame:(CGRect)a3 viewModel:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PGControlsContainerView;
  v11 = -[PGControlsContainerView initWithFrame:](&v26, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    [(PGControlsContainerView *)v11 setOverrideUserInterfaceStyle:2];
    v13 = [(PGControlsContainerView *)v12 layer];
    [v13 setHitTestsAsOpaque:1];

    objc_storeStrong((id *)&v12->_viewModel, a4);
    [v10 setDelegate:v12];
    v14 = [PGControlsView alloc];
    [(PGControlsContainerView *)v12 bounds];
    uint64_t v15 = -[PGControlsView initWithFrame:viewModel:](v14, "initWithFrame:viewModel:", v12->_viewModel);
    controlsView = v12->_controlsView;
    v12->_controlsView = (PGControlsView *)v15;

    [(PGControlsContainerView *)v12 addSubview:v12->_controlsView];
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v12 action:sel__handleSingleTapGestureRecognizer_];
    singleTapGestureRecognizer = v12->_singleTapGestureRecognizer;
    v12->_singleTapGestureRecognizer = (UITapGestureRecognizer *)v17;

    [(PGControlsContainerView *)v12 addGestureRecognizer:v12->_singleTapGestureRecognizer];
    [(UITapGestureRecognizer *)v12->_singleTapGestureRecognizer setDelaysTouchesEnded:0];
    [(UITapGestureRecognizer *)v12->_singleTapGestureRecognizer setDelegate:v12];
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v12 action:sel__handleDoubleTapGestureRecognizer_];
    doubleTapGestureRecognizer = v12->_doubleTapGestureRecognizer;
    v12->_doubleTapGestureRecognizer = (UITapGestureRecognizer *)v19;

    [(UITapGestureRecognizer *)v12->_doubleTapGestureRecognizer setNumberOfTapsRequired:2];
    [(PGControlsContainerView *)v12 addGestureRecognizer:v12->_doubleTapGestureRecognizer];
    [(UITapGestureRecognizer *)v12->_doubleTapGestureRecognizer setDelaysTouchesEnded:0];
    [(UITapGestureRecognizer *)v12->_doubleTapGestureRecognizer setDelegate:v12];
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v12 action:sel__handleDoubleDoubleTapGestureRecognizer_];
    doubleDoubleTapGestureRecognizer = v12->_doubleDoubleTapGestureRecognizer;
    v12->_doubleDoubleTapGestureRecognizer = (UITapGestureRecognizer *)v21;

    [(UITapGestureRecognizer *)v12->_doubleDoubleTapGestureRecognizer setNumberOfTapsRequired:2];
    [(UITapGestureRecognizer *)v12->_doubleDoubleTapGestureRecognizer setNumberOfTouchesRequired:2];
    [(PGControlsContainerView *)v12 addGestureRecognizer:v12->_doubleDoubleTapGestureRecognizer];
    [(UITapGestureRecognizer *)v12->_doubleDoubleTapGestureRecognizer setDelaysTouchesEnded:0];
    [(UITapGestureRecognizer *)v12->_doubleDoubleTapGestureRecognizer setDelegate:v12];
    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:v12 action:sel__handleHoverGestureRecognizer_];
    hoverGestureRecognizer = v12->_hoverGestureRecognizer;
    v12->_hoverGestureRecognizer = (UIGestureRecognizer *)v23;

    [(PGControlsContainerView *)v12 addGestureRecognizer:v12->_hoverGestureRecognizer];
    [(UIGestureRecognizer *)v12->_hoverGestureRecognizer setDelegate:v12];
  }

  return v12;
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)PGControlsContainerView;
  [(PGControlsContainerView *)&v6 didMoveToWindow];
  v3 = [(PGControlsContainerView *)self layer];
  [v3 setBorderWidth:1.0];

  v4 = [(PGControlsContainerView *)self layer];
  id v5 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.15];
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v5, "CGColor"));
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PGControlsContainerView;
  [(PGControlsContainerView *)&v5 layoutSubviews];
  controlsView = self->_controlsView;
  [(PGControlsContainerView *)self bounds];
  -[PGControlsView setFrame:](controlsView, "setFrame:");
  interruptionDimmingView = self->_interruptionDimmingView;
  [(PGControlsContainerView *)self bounds];
  -[UIView setFrame:](interruptionDimmingView, "setFrame:");
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PGControlsContainerView;
  -[PGControlsContainerView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  [(PGControlsView *)self->_controlsView _setContinuousCornerRadius:a3];
  [(UIView *)self->_interruptionDimmingView _setContinuousCornerRadius:a3];
}

- (void)setControlsContainerHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  p_containerViewVisibilityAnimator = &self->_containerViewVisibilityAnimator;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewVisibilityAnimator);
  v8 = [(PGControlsContainerView *)self _updateVisibilityOfView:self hidden:v5 animated:v4 existingAnimator:WeakRetained];
  objc_storeWeak((id *)p_containerViewVisibilityAnimator, v8);
}

- (void)setInteractivelyResizing:(BOOL)a3
{
  if (self->_interactivelyResizing != a3)
  {
    self->_interactivelyResizing = a3;
    BOOL v4 = !a3;
    -[PGControlsContainerView _setControlsHidden:animated:](self, "_setControlsHidden:animated:");
    if (!v4)
    {
      [(PGControlsContainerView *)self _invalidateTimer];
    }
  }
}

- (id)viewModel
{
  return self->_viewModel;
}

- (void)setHoverGestureDisbaled:(BOOL)a3
{
}

- (void)controlsViewModel:(id)a3 didIssueCommand:(id)a4
{
  id v8 = a4;
  if ([v8 systemAction] == 4)
  {
    if ([(PGControlsView *)self->_controlsView prefersControlsHidden])
    {
      BOOL v5 = self;
      uint64_t v6 = 0;
    }
    else
    {
      BOOL v5 = self;
      uint64_t v6 = 1;
    }
    [(PGControlsContainerView *)v5 _setPrefersControlsHidden:v6 animated:1];
  }
  else
  {
    v7 = [(PGControlsContainerView *)self commandHandler];
    [v7 handleCommand:v8];
  }
}

- (void)controlsViewModel:(id)a3 valuesChangedFromOldValue:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  v7 = [v29 values];
  -[UITapGestureRecognizer setEnabled:](self->_singleTapGestureRecognizer, "setEnabled:", [v7 includesSingleTapGestureRecognizer]);
  -[UITapGestureRecognizer setEnabled:](self->_doubleTapGestureRecognizer, "setEnabled:", [v7 includesDoubleTapGestureRecognizer]);
  -[UITapGestureRecognizer setEnabled:](self->_doubleDoubleTapGestureRecognizer, "setEnabled:", [v7 includesDoubleDoubleTapGestureRecognizer]);
  [(PGControlsView *)self->_controlsView viewModelDidUpdateValuesFromOldValues:v6];
  [(PGControlsContainerView *)self _updateHideControlsAfterDelayTimer];
  id v8 = [v29 playbackState];
  uint64_t v9 = [v8 contentType];

  if ((unint64_t)(v9 - 1) > 1) {
    goto LABEL_28;
  }
  id v10 = [v29 playbackState];
  [v10 normalizedProgress];
  double v12 = v11;

  v13 = [v29 values];
  char v14 = [v13 controlsShouldAutoHide];

  uint64_t v15 = [v29 values];
  if ([v15 includesContentLoadingIndicator]
    && ![v6 includesContentLoadingIndicator])
  {
    int v17 = 1;
  }
  else
  {
    v16 = [v29 values];
    if ([v16 includesWaitingToPlayIndicator]) {
      int v17 = [v6 includesWaitingToPlayIndicator] ^ 1;
    }
    else {
      int v17 = 0;
    }
  }
  v18 = [v29 values];
  if (([v18 includesContentLoadingIndicator] & 1) != 0
    || ([v6 includesContentLoadingIndicator] & 1) == 0)
  {
    v20 = [v29 values];
    if ([v20 includesWaitingToPlayIndicator]) {
      int v19 = 0;
    }
    else {
      int v19 = [v6 includesWaitingToPlayIndicator];
    }
  }
  else
  {
    int v19 = 1;
  }

  if (v12 < 1.0) {
    char v21 = 1;
  }
  else {
    char v21 = v14;
  }
  if ((v21 & 1) == 0 && [v6 controlsShouldAutoHide] || v17)
  {
    [(PGControlsContainerView *)self _setPrefersControlsHidden:0 animated:1];
LABEL_28:
    [(UIView *)self->_interruptionDimmingView removeFromSuperview];
    interruptionDimmingView = self->_interruptionDimmingView;
    self->_interruptionDimmingView = 0;

    goto LABEL_29;
  }
  if (v19)
  {
    [(PGControlsContainerView *)self _updateHideControlsAfterDelayTimer];
    goto LABEL_28;
  }
  if (![v29 isInterrupted]) {
    goto LABEL_28;
  }
  [(PGControlsContainerView *)self _invalidateTimer];
  [(PGControlsContainerView *)self _setPrefersControlsHidden:0 animated:1];
  if (!self->_interruptionDimmingView)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(PGControlsContainerView *)self bounds];
    uint64_t v23 = (UIView *)objc_msgSend(v22, "initWithFrame:");
    v24 = self->_interruptionDimmingView;
    self->_interruptionDimmingView = v23;

    [(UIView *)self->_interruptionDimmingView setUserInteractionEnabled:0];
    v25 = self->_interruptionDimmingView;
    objc_super v26 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.65];
    [(UIView *)v25 setBackgroundColor:v26];

    v27 = self->_interruptionDimmingView;
    [(PGControlsContainerView *)self _continuousCornerRadius];
    -[UIView _setContinuousCornerRadius:](v27, "_setContinuousCornerRadius:");
    [(PGControlsContainerView *)self insertSubview:self->_interruptionDimmingView belowSubview:self->_controlsView];
  }
LABEL_29:
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v4 = (UIGestureRecognizer *)a3;
  BOOL v5 = [(UIGestureRecognizer *)v4 delegate];

  if (v5 == self)
  {
    if (self->_hoverGestureRecognizer == v4
      && ([(PGControlsViewModel *)self->_viewModel values],
          id v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 includesRestoreButton],
          v6,
          !v7))
    {
      LOBYTE(self) = 0;
    }
    else
    {
      id v8 = [(UIGestureRecognizer *)v4 view];
      uint64_t v9 = [(UIGestureRecognizer *)v4 view];
      [(UIGestureRecognizer *)v4 locationInView:v9];
      id v10 = objc_msgSend(v8, "hitTest:withEvent:", 0);

      LODWORD(self) = [v10 isDescendantOfView:self->_controlsView] ^ 1;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PGControlsContainerView;
    LOBYTE(self) = [(PGControlsContainerView *)&v12 gestureRecognizerShouldBegin:v4];
  }

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = (UITapGestureRecognizer *)a3;
  int v7 = (UITapGestureRecognizer *)a4;
  id v8 = v7;
  BOOL v9 = 0;
  if (self->_singleTapGestureRecognizer == v6)
  {
    if (self->_doubleTapGestureRecognizer == v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (void)_handleSingleTapGestureRecognizer:(id)a3
{
  if ([(UIGestureRecognizer *)self->_hoverGestureRecognizer state] == UIGestureRecognizerStatePossible)
  {
    viewModel = self->_viewModel;
    [(PGControlsViewModel *)viewModel handleSingleTap];
  }
}

- (void)_handleDoubleTapGestureRecognizer:(id)a3
{
}

- (void)_handleDoubleDoubleTapGestureRecognizer:(id)a3
{
  if (!self->_interactivelyResizing) {
    [(PGControlsViewModel *)self->_viewModel handleDoubleDoubleTap];
  }
}

- (void)_handleHoverGestureRecognizer:(id)a3
{
  id v6 = a3;
  if ([v6 state] == 1)
  {
    if ([(PGControlsContainerView *)self isShowingControlsForHoverActive]) {
      goto LABEL_8;
    }
    [(PGControlsContainerView *)self setShowingControlsForHoverActive:1];
LABEL_6:
    [(PGControlsContainerView *)self _updateHideControlsAfterDelayTimer];
    uint64_t v5 = 0;
LABEL_7:
    [(PGControlsContainerView *)self _setPrefersControlsHidden:v5 animated:1];
    goto LABEL_8;
  }
  uint64_t v4 = [v6 state];
  if ([(PGControlsContainerView *)self isShowingControlsForHoverActive] == (v4 == 2)) {
    goto LABEL_8;
  }
  [(PGControlsContainerView *)self setShowingControlsForHoverActive:v4 == 2];
  if (v4 == 2) {
    goto LABEL_6;
  }
  if ([(PGControlsContainerView *)self _controlsShouldAutoHide])
  {
    uint64_t v5 = 1;
    goto LABEL_7;
  }
LABEL_8:
}

- (id)_acquirePreventAutoHideOfControlsAssertionWithReason:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [v5 UUIDString];

  preventAutoHideOfControlsAssertionIdentifiers = self->_preventAutoHideOfControlsAssertionIdentifiers;
  if (!preventAutoHideOfControlsAssertionIdentifiers)
  {
    id v8 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
    BOOL v9 = self->_preventAutoHideOfControlsAssertionIdentifiers;
    self->_preventAutoHideOfControlsAssertionIdentifiers = v8;

    preventAutoHideOfControlsAssertionIdentifiers = self->_preventAutoHideOfControlsAssertionIdentifiers;
  }
  [(NSMutableSet *)preventAutoHideOfControlsAssertionIdentifiers addObject:v6];
  [(PGControlsContainerView *)self _updateHideControlsAfterDelayTimer];
  objc_initWeak(&location, self);
  id v10 = objc_alloc(MEMORY[0x1E4F4F838]);
  if (v4) {
    double v11 = v4;
  }
  else {
    double v11 = @"Unknown Reason";
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__PGControlsContainerView__acquirePreventAutoHideOfControlsAssertionWithReason___block_invoke;
  v15[3] = &unk_1E610C618;
  objc_copyWeak(&v17, &location);
  id v12 = v6;
  id v16 = v12;
  v13 = (void *)[v10 initWithIdentifier:v12 forReason:v11 invalidationBlock:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

void __80__PGControlsContainerView__acquirePreventAutoHideOfControlsAssertionWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[62] removeObject:*(void *)(a1 + 32)];
    [v3 _updateHideControlsAfterDelayTimer];
    id WeakRetained = v3;
  }
}

- (void)_setPrefersControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(PGControlsContainerView *)self _updateHideControlsAfterDelayTimer];
  [(PGControlsView *)self->_controlsView setPrefersControlsHidden:v5];
  if (v5) {
    [(PGControlsContainerView *)self setShowingControlsForHoverActive:0];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__PGControlsContainerView__setPrefersControlsHidden_animated___block_invoke;
  v11[3] = &unk_1E610C280;
  v11[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v11];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hidableControlsVisibilityAnimator);
  v9[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__PGControlsContainerView__setPrefersControlsHidden_animated___block_invoke_2;
  v10[3] = &unk_1E610C280;
  v10[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PGControlsContainerView__setPrefersControlsHidden_animated___block_invoke_3;
  v9[3] = &unk_1E610C280;
  id v8 = [(PGControlsContainerView *)self _performVisibilityTransitionAnimated:v4 existingAnimator:WeakRetained animations:v10 success:v9];
  objc_storeWeak((id *)&self->_hidableControlsVisibilityAnimator, v8);

  [(PGControlsContainerView *)self _updateHideControlsAfterDelayTimer];
}

uint64_t __62__PGControlsContainerView__setPrefersControlsHidden_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) updateProgress];
}

void __62__PGControlsContainerView__setPrefersControlsHidden_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 416) updateControlsAlpha];
  v2 = [*(id *)(a1 + 32) coordinatedAnimationsForControlsVisibiity];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) coordinatedAnimationsForControlsVisibiity];
    v3[2](v3, [*(id *)(*(void *)(a1 + 32) + 416) prefersControlsHidden] ^ 1);
  }
}

uint64_t __62__PGControlsContainerView__setPrefersControlsHidden_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 416) updateProgress];
  v2 = *(void **)(a1 + 32);

  return [v2 _updateHideControlsAfterDelayTimer];
}

- (void)_setControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(PGControlsContainerView *)self _updateHideControlsAfterDelayTimer];
  controlsView = self->_controlsView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlsViewVisibilityAnimator);
  BOOL v9 = [(PGControlsContainerView *)self _updateVisibilityOfView:controlsView hidden:v5 animated:v4 existingAnimator:WeakRetained];
  objc_storeWeak((id *)&self->_controlsViewVisibilityAnimator, v9);

  [(PGControlsContainerView *)self _updateHideControlsAfterDelayTimer];
}

- (id)_updateVisibilityOfView:(id)a3 hidden:(BOOL)a4 animated:(BOOL)a5 existingAnimator:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  if (!a4) {
    [v10 setHidden:0];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__PGControlsContainerView__updateVisibilityOfView_hidden_animated_existingAnimator___block_invoke;
  v19[3] = &unk_1E610C640;
  id v20 = v10;
  BOOL v21 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__PGControlsContainerView__updateVisibilityOfView_hidden_animated_existingAnimator___block_invoke_2;
  v15[3] = &unk_1E610C668;
  BOOL v18 = a4;
  id v16 = v20;
  id v17 = self;
  id v12 = v20;
  v13 = [(PGControlsContainerView *)self _performVisibilityTransitionAnimated:v7 existingAnimator:v11 animations:v19 success:v15];

  return v13;
}

uint64_t __84__PGControlsContainerView__updateVisibilityOfView_hidden_animated_existingAnimator___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

void *__84__PGControlsContainerView__updateVisibilityOfView_hidden_animated_existingAnimator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:*(unsigned __int8 *)(a1 + 48)];
  result = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) != result[52])
  {
    return (void *)[result _updateHideControlsAfterDelayTimer];
  }
  return result;
}

- (id)_performVisibilityTransitionAnimated:(BOOL)a3 existingAnimator:(id)a4 animations:(id)a5 success:(id)a6
{
  BOOL v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([v9 isRunning] && objc_msgSend(v9, "isInterruptible"))
  {
    [v9 stopAnimation:0];
    [v9 finishAnimationAtPosition:2];
  }
  if (v8)
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__0;
    v21[4] = __Block_byref_object_dispose__0;
    id v12 = (id)[objc_alloc(MEMORY[0x1E4F43008]) initWithDuration:0 curve:v10 animations:0.2];
    id v22 = v12;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __100__PGControlsContainerView__performVisibilityTransitionAnimated_existingAnimator_animations_success___block_invoke;
    v18[3] = &unk_1E610C690;
    id v19 = v11;
    id v20 = v21;
    [v12 addCompletion:v18];
    [v12 startAnimation];

    _Block_object_dispose(v21, 8);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F42FF0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __100__PGControlsContainerView__performVisibilityTransitionAnimated_existingAnimator_animations_success___block_invoke_2;
    v15[3] = &unk_1E610C6B8;
    id v16 = v10;
    id v17 = v11;
    [v13 performWithoutAnimation:v15];

    id v12 = 0;
  }

  return v12;
}

void __100__PGControlsContainerView__performVisibilityTransitionAnimated_existingAnimator_animations_success___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

uint64_t __100__PGControlsContainerView__performVisibilityTransitionAnimated_existingAnimator_animations_success___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (BOOL)_controlsShouldAutoHide
{
  uint64_t v3 = [(PGControlsViewModel *)self->_viewModel values];
  if (![v3 controlsShouldAutoHide]
    || [(NSMutableSet *)self->_preventAutoHideOfControlsAssertionIdentifiers count]
    || [(PGControlsView *)self->_controlsView prefersControlsHidden])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    BOOL v4 = ![(PGControlsContainerView *)self isShowingControlsForHoverActive];
  }

  return v4;
}

- (void)_updateHideControlsAfterDelayTimer
{
  if ([(PGControlsContainerView *)self _controlsShouldAutoHide])
  {
    if (![(PGControlsView *)self->_controlsView prefersControlsHidden]
      && !self->_hideControlsAfterDelayTimer)
    {
      objc_initWeak(&location, self);
      uint64_t v3 = (void *)MEMORY[0x1E4F1CB00];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __61__PGControlsContainerView__updateHideControlsAfterDelayTimer__block_invoke;
      v6[3] = &unk_1E610C6E0;
      objc_copyWeak(&v7, &location);
      BOOL v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:v6 block:3.0];
      hideControlsAfterDelayTimer = self->_hideControlsAfterDelayTimer;
      self->_hideControlsAfterDelayTimer = v4;

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(PGControlsContainerView *)self _invalidateTimer];
  }
}

void __61__PGControlsContainerView__updateHideControlsAfterDelayTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v5 = WeakRetained;
    v2 = [WeakRetained viewModel];
    char v3 = [v2 isInterrupted];

    id WeakRetained = v5;
    if ((v3 & 1) == 0)
    {
      [v5 _setPrefersControlsHidden:1 animated:1];
      BOOL v4 = (void *)v5[61];
      v5[61] = 0;

      id WeakRetained = v5;
    }
  }
}

- (void)_invalidateTimer
{
  [(NSTimer *)self->_hideControlsAfterDelayTimer invalidate];
  hideControlsAfterDelayTimer = self->_hideControlsAfterDelayTimer;
  self->_hideControlsAfterDelayTimer = 0;
}

- (PGCommandHandler)commandHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandHandler);

  return (PGCommandHandler *)WeakRetained;
}

- (void)setCommandHandler:(id)a3
{
}

- (BOOL)showsPictureInPictureUnavailableIndicator
{
  return self->_showsPictureInPictureUnavailableIndicator;
}

- (void)setShowsPictureInPictureUnavailableIndicator:(BOOL)a3
{
  self->_showsPictureInPictureUnavailableIndicator = a3;
}

- (BOOL)isShowingControlsForHoverActive
{
  return self->_showingControlsForHoverActive;
}

- (void)setShowingControlsForHoverActive:(BOOL)a3
{
  self->_showingControlsForHoverActive = a3;
}

- (BOOL)isInteractivelyResizing
{
  return self->_interactivelyResizing;
}

- (id)coordinatedAnimationsForControlsVisibiity
{
  return self->_coordinatedAnimationsForControlsVisibiity;
}

- (void)setCoordinatedAnimationsForControlsVisibiity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_coordinatedAnimationsForControlsVisibiity, 0);
  objc_destroyWeak((id *)&self->_commandHandler);
  objc_storeStrong((id *)&self->_preventAutoHideOfControlsAssertionIdentifiers, 0);
  objc_storeStrong((id *)&self->_hideControlsAfterDelayTimer, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleDoubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_singleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_interruptionDimmingView, 0);
  objc_destroyWeak((id *)&self->_hidableControlsVisibilityAnimator);
  objc_destroyWeak((id *)&self->_controlsViewVisibilityAnimator);
  objc_destroyWeak((id *)&self->_containerViewVisibilityAnimator);
  objc_storeStrong((id *)&self->_controlsView, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end