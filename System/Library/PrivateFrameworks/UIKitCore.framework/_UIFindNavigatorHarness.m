@interface _UIFindNavigatorHarness
- (BOOL)_shouldAdjustHostViewContentOffsets;
- (BOOL)findNavigatorShouldDismissOnResponderChange:(id)a3;
- (BOOL)isFindNavigatorVisible;
- (UIScrollView)hostScrollView;
- (UIView)hostView;
- (UIView)interactionView;
- (_UIFindNavigatorHarness)init;
- (_UIFindNavigatorViewController)findNavigatorViewController;
- (id)_findNavigatorView;
- (void)_adjustHostViewScrollOffsetToTopIfSupported;
- (void)_layoutFindNavigator;
- (void)_sendPlacementUpdate;
- (void)beginHoistingFindNavigator:(BOOL)a3;
- (void)dealloc;
- (void)dismissFindNavigatorEndingActiveSession:(BOOL)a3;
- (void)endHoistingFindNavigator:(BOOL)a3;
- (void)endHoistingFindNavigator:(BOOL)a3 endingActiveSession:(BOOL)a4;
- (void)findNavigatorViewControllerDidRequestDismissal:(id)a3;
- (void)findNavigatorViewControllerViewDidChangeIntrinsicContentSize:(id)a3;
- (void)presentFindNavigatorWithFindSession:(id)a3 showingReplace:(BOOL)a4 idiom:(int64_t)a5;
- (void)setFindNavigatorViewController:(id)a3;
- (void)setHostScrollView:(id)a3;
- (void)setHostView:(id)a3;
- (void)setInteractionView:(id)a3;
@end

@implementation _UIFindNavigatorHarness

- (_UIFindNavigatorHarness)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFindNavigatorHarness;
  v2 = [(_UIFindNavigatorHarness *)&v6 init];
  if (v2)
  {
    v3 = [(UIInputViewController *)[_UIFindNavigatorViewController alloc] initWithNibName:0 bundle:0];
    findNavigatorViewController = v2->_findNavigatorViewController;
    v2->_findNavigatorViewController = v3;

    [(_UIFindNavigatorViewController *)v2->_findNavigatorViewController setFindNavigatorViewControllerDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(_UIFindNavigatorHarness *)self endHoistingFindNavigator:0];
  v3.receiver = self;
  v3.super_class = (Class)_UIFindNavigatorHarness;
  [(_UIFindNavigatorHarness *)&v3 dealloc];
}

- (void)setInteractionView:(id)a3
{
  p_interactionView = &self->_interactionView;
  id v5 = a3;
  objc_storeWeak((id *)p_interactionView, v5);
  NSClassFromString(&cfstr_Wkwebview.isa);
  LOBYTE(p_interactionView) = objc_opt_isKindOfClass();

  self->_interactionViewIsWebView = p_interactionView & 1;
}

- (id)_findNavigatorView
{
  return [(_UIFindNavigatorViewController *)self->_findNavigatorViewController findNavigatorView];
}

- (BOOL)_shouldAdjustHostViewContentOffsets
{
  p_hostScrollView = &self->_hostScrollView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostScrollView);

  if (!WeakRetained) {
    return 0;
  }
  id v4 = objc_loadWeakRetained((id *)p_hostScrollView);
  [v4 contentOffset];
  double v6 = v5;
  id v7 = objc_loadWeakRetained((id *)p_hostScrollView);
  [v7 _minimumContentOffset];
  BOOL v9 = vabdd_f64(v6, v8) < 2.22044605e-16;

  return v9;
}

- (void)_adjustHostViewScrollOffsetToTopIfSupported
{
  p_hostScrollView = &self->_hostScrollView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostScrollView);
  [WeakRetained contentOffset];
  double v4 = v3;
  id v5 = objc_loadWeakRetained((id *)p_hostScrollView);
  [v5 _minimumContentOffset];
  double v7 = v6;
  id v8 = objc_loadWeakRetained((id *)p_hostScrollView);
  objc_msgSend(v8, "setContentOffset:", v4, v7);
}

- (void)beginHoistingFindNavigator:(BOOL)a3
{
  BOOL v3 = a3;
  p_hostView = &self->_hostView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);

  if (!WeakRetained)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"_UIFindNavigatorHarness.m" lineNumber:86 description:@"No host view to hoist the find navigator."];
  }
  if (!self->_isHoistingFindNavigator)
  {
    self->_isHoistingFindNavigator = 1;
    BOOL v8 = [(_UIFindNavigatorHarness *)self _shouldAdjustHostViewContentOffsets];
    id v9 = objc_loadWeakRetained((id *)p_hostView);
    v10 = [(_UIFindNavigatorHarness *)self _findNavigatorView];
    [v9 addSubview:v10];

    v11 = objc_loadWeakRetained((id *)p_hostView);
    -[UIView _addGeometryChangeObserver:](v11, self);

    [(_UIFindNavigatorHarness *)self _layoutFindNavigator];
    if (v3)
    {
      v12 = [(_UIFindNavigatorHarness *)self _findNavigatorView];
      [v12 frame];
      CGAffineTransformMakeTranslation(&v20, 0.0, -v13);
      v14 = [(_UIFindNavigatorHarness *)self _findNavigatorView];
      CGAffineTransform v19 = v20;
      [v14 setTransform:&v19];

      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __54___UIFindNavigatorHarness_beginHoistingFindNavigator___block_invoke;
      v17[3] = &unk_1E52D9FC0;
      v17[4] = self;
      BOOL v18 = v8;
      +[UIView animateWithDuration:0 delay:v17 usingSpringWithDamping:0 initialSpringVelocity:0.35 options:0.0 animations:600.0 completion:0.0];
    }
    else if (v8)
    {
      [(_UIFindNavigatorHarness *)self _adjustHostViewScrollOffsetToTopIfSupported];
      [(_UIFindNavigatorHarness *)self _sendPlacementUpdate];
    }
  }
  v15 = [(_UIFindNavigatorHarness *)self _findNavigatorView];
  [v15 becomeFirstResponder];
}

- (void)endHoistingFindNavigator:(BOOL)a3
{
}

- (void)endHoistingFindNavigator:(BOOL)a3 endingActiveSession:(BOOL)a4
{
  if (self->_isHoistingFindNavigator)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_isHoistingFindNavigator = 0;
    BOOL v7 = [(_UIFindNavigatorHarness *)self _shouldAdjustHostViewContentOffsets];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);
    -[UIView _removeGeometryChangeObserver:](WeakRetained, self);

    id v9 = [(_UIFindNavigatorHarness *)self findNavigatorViewController];
    v10 = [v9 findSession];

    if (v10 && v4)
    {
      v11 = [v10 parentInteraction];
      [v11 _didEndActiveFindSession];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72___UIFindNavigatorHarness_endHoistingFindNavigator_endingActiveSession___block_invoke;
    aBlock[3] = &unk_1E52D9F70;
    aBlock[4] = self;
    v12 = (void (**)(void))_Block_copy(aBlock);
    double v13 = v12;
    if (v5)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __72___UIFindNavigatorHarness_endHoistingFindNavigator_endingActiveSession___block_invoke_2;
      v16[3] = &unk_1E52D9FC0;
      v16[4] = self;
      BOOL v17 = v7;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __72___UIFindNavigatorHarness_endHoistingFindNavigator_endingActiveSession___block_invoke_3;
      v14[3] = &unk_1E52E45A0;
      v14[4] = self;
      v15 = v12;
      +[UIView animateWithDuration:0 delay:v16 usingSpringWithDamping:v14 initialSpringVelocity:0.35 options:0.0 animations:600.0 completion:0.0];
    }
    else
    {
      v12[2](v12);
      if (v7) {
        [(_UIFindNavigatorHarness *)self _adjustHostViewScrollOffsetToTopIfSupported];
      }
      [(_UIFindNavigatorHarness *)self _sendPlacementUpdate];
    }
  }
}

- (void)_layoutFindNavigator
{
  p_hostView = &self->_hostView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);
  [WeakRetained safeAreaInsets];
  double v6 = v5;

  BOOL v7 = [(_UIFindNavigatorHarness *)self _findNavigatorView];
  [v7 intrinsicContentSize];
  double v9 = v8;

  double v10 = -v9;
  id v11 = objc_loadWeakRetained((id *)p_hostView);
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  if (self->_interactionViewIsWebView)
  {
    id v18 = objc_loadWeakRetained((id *)&self->_hostScrollView);

    if (v18)
    {
      id v19 = objc_loadWeakRetained((id *)&self->_interactionView);
      [v19 _obscuredInsets];
      if (v6 < v20) {
        double v6 = v20;
      }
    }
    else
    {
      double v10 = 0.0;
    }
  }
  if (v10 >= v15 + v6) {
    double v21 = v10;
  }
  else {
    double v21 = v15 + v6;
  }
  v22 = [(_UIFindNavigatorHarness *)self _findNavigatorView];
  objc_msgSend(v22, "setFrame:", v13, v21, v17, v9);

  id v23 = objc_loadWeakRetained((id *)&self->_hostScrollView);
  [v23 _setSystemInsetAdjustment:@"findadj" forAdjustmentTypeIdentifier:v9];

  id v25 = objc_loadWeakRetained((id *)p_hostView);
  v24 = [(_UIFindNavigatorHarness *)self _findNavigatorView];
  [v25 bringSubviewToFront:v24];
}

- (void)_sendPlacementUpdate
{
  BOOL v3 = [(_UIFindNavigatorHarness *)self findNavigatorViewController];
  id v8 = [v3 findSession];

  BOOL v4 = objc_alloc_init(_UIFindNavigatorInlinePlacement);
  double v5 = [(_UIFindNavigatorHarness *)self _findNavigatorView];
  [v5 intrinsicContentSize];
  -[_UIFindNavigatorInlinePlacement setIntrinsicContentSize:](v4, "setIntrinsicContentSize:");

  [(_UIFindNavigatorPlacement *)v4 setShowing:self->_isHoistingFindNavigator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);
  [(_UIFindNavigatorInlinePlacement *)v4 setHostView:WeakRetained];

  BOOL v7 = [v8 parentInteraction];
  [v7 _willChangeNavigatorPlacement:v4];
}

- (BOOL)isFindNavigatorVisible
{
  return self->_isHoistingFindNavigator;
}

- (void)presentFindNavigatorWithFindSession:(id)a3 showingReplace:(BOOL)a4 idiom:(int64_t)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  id v10 = v7;
  if (v5) {
    uint64_t v8 = [v7 supportsReplacement];
  }
  else {
    uint64_t v8 = 0;
  }
  [(_UIFindNavigatorViewController *)self->_findNavigatorViewController setFindSession:v10];
  double v9 = [(_UIFindNavigatorViewController *)self->_findNavigatorViewController findNavigatorView];
  [v9 setMode:v8];
  [v9 setIntrinsicHeightDerivedFromAssistantBar:0];
  [v9 setVisibleSeparatorEdges:4];
  [v9 setUsesOpaqueBackground:1];
  [(_UIFindNavigatorViewController *)self->_findNavigatorViewController setTintTechnique:0];
  [(_UIFindNavigatorHarness *)self beginHoistingFindNavigator:1];
}

- (void)dismissFindNavigatorEndingActiveSession:(BOOL)a3
{
}

- (BOOL)findNavigatorShouldDismissOnResponderChange:(id)a3
{
  return 0;
}

- (void)findNavigatorViewControllerDidRequestDismissal:(id)a3
{
}

- (void)findNavigatorViewControllerViewDidChangeIntrinsicContentSize:(id)a3
{
  [(_UIFindNavigatorHarness *)self _layoutFindNavigator];
  [(_UIFindNavigatorHarness *)self _sendPlacementUpdate];
}

- (UIView)interactionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionView);
  return (UIView *)WeakRetained;
}

- (UIView)hostView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);
  return (UIView *)WeakRetained;
}

- (void)setHostView:(id)a3
{
}

- (UIScrollView)hostScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostScrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)setHostScrollView:(id)a3
{
}

- (_UIFindNavigatorViewController)findNavigatorViewController
{
  return self->_findNavigatorViewController;
}

- (void)setFindNavigatorViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findNavigatorViewController, 0);
  objc_destroyWeak((id *)&self->_hostScrollView);
  objc_destroyWeak((id *)&self->_hostView);
  objc_destroyWeak((id *)&self->_interactionView);
}

@end