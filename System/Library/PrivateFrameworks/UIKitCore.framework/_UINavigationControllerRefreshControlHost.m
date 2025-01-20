@interface _UINavigationControllerRefreshControlHost
+ (BOOL)canHostRefreshControlOwnedByScrollView:(id)a3 inNavigationController:(id)a4;
- (BOOL)isHostingRefreshControlOwnedByScrollView:(id)a3;
- (BOOL)refreshControlInsetsAffectScrollViewRubberBanding;
- (NSArray)refreshControlConstraints;
- (NSString)description;
- (UINavigationController)navigationController;
- (UIRefreshControl)refreshControl;
- (UIScrollView)scrollView;
- (UIView)hostContainerView;
- (_UINavigationControllerRefreshControlHost)initWithNavigationController:(id)a3 scrollView:(id)a4;
- (_UINavigationControllerRefreshControlHostDelegate)delegate;
- (double)_alphaForRefreshingControlStateWithPossiblyObstructedContent;
- (double)_thresholdForObstructedContentFullAlpha;
- (double)_thresholdForObstructedContentZeroAlpha;
- (double)fullHeightOfRefreshControl;
- (double)restingHeightOfRefreshControl;
- (double)unobstructedHeight;
- (void)_installRefreshControlIntoContainerView;
- (void)_notifyLayoutDidChange;
- (void)_removeRefreshControlFromContainerView;
- (void)_updateFadeOutProgress;
- (void)dealloc;
- (void)decrementInsetHeight:(double)a3;
- (void)incrementInsetHeight:(double)a3;
- (void)refreshControl:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5;
- (void)setDelegate:(id)a3;
- (void)setHostContainerView:(id)a3;
- (void)setRefreshControl:(id)a3;
- (void)setRefreshControlConstraints:(id)a3;
- (void)setRestingHeightOfRefreshControl:(double)a3;
- (void)setUnobstructedHeight:(double)a3;
- (void)stopAnimations;
@end

@implementation _UINavigationControllerRefreshControlHost

- (void)setUnobstructedHeight:(double)a3
{
  hostContainerView = self->_hostContainerView;
  if (hostContainerView) {
    UIRoundToViewScale(hostContainerView);
  }
  if (self->_unobstructedHeight != a3)
  {
    self->_unobstructedHeight = a3;
    [(_UINavigationControllerRefreshControlHost *)self _notifyLayoutDidChange];
  }
}

+ (BOOL)canHostRefreshControlOwnedByScrollView:(id)a3 inNavigationController:(id)a4
{
  id v5 = a3;
  v6 = [a4 navigationBar];
  if ([v6 supportsRefreshControlHosting])
  {
    v7 = [v5 refreshControl];
    if (v7) {
      char v8 = [v6 _hasVariableHeight];
    }
    else {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (double)restingHeightOfRefreshControl
{
  return self->_restingHeightOfRefreshControl;
}

- (double)fullHeightOfRefreshControl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_refreshControl);
  [WeakRetained _refreshControlHeight];
  double v4 = v3;

  return v4;
}

- (void)setDelegate:(id)a3
{
}

- (_UINavigationControllerRefreshControlHost)initWithNavigationController:(id)a3 scrollView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([(id)objc_opt_class() canHostRefreshControlOwnedByScrollView:v8 inNavigationController:v7] & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"_UINavigationControllerRefreshControlHost.m" lineNumber:26 description:@"invalid parameters"];
  }
  v15.receiver = self;
  v15.super_class = (Class)_UINavigationControllerRefreshControlHost;
  v9 = [(_UINavigationControllerRefreshControlHost *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_navigationController, v7);
    objc_storeWeak((id *)&v10->_scrollView, v8);
    v11 = [v8 refreshControl];
    objc_storeWeak((id *)&v10->_refreshControl, v11);

    id WeakRetained = objc_loadWeakRetained((id *)&v10->_refreshControl);
    [WeakRetained _setHost:v10];

    v10->_unobstructedHeight = 0.0;
  }

  return v10;
}

- (void)setHostContainerView:(id)a3
{
  v11 = (UIView *)a3;
  if (v11)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_refreshControl);
    [WeakRetained _setHost:self];
  }
  if (self->_hostContainerView != v11)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_refreshControl);
    id v7 = [v6 superview];

    if (v7 != v11) {
      [(_UINavigationControllerRefreshControlHost *)self _removeRefreshControlFromContainerView];
    }
    objc_storeStrong((id *)&self->_hostContainerView, a3);
    id v8 = objc_loadWeakRetained((id *)&self->_refreshControl);
    v9 = [v8 superview];
    hostContainerView = self->_hostContainerView;

    if (v9 != hostContainerView) {
      [(_UINavigationControllerRefreshControlHost *)self _installRefreshControlIntoContainerView];
    }
  }
}

- (void)_removeRefreshControlFromContainerView
{
  double v3 = [(_UINavigationControllerRefreshControlHost *)self refreshControl];
  if (v3)
  {
    id v6 = v3;
    [v3 removeFromSuperview];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
    [WeakRetained _removeScrollViewScrollObserver:v6];

    [MEMORY[0x1E4F5B268] deactivateConstraints:self->_refreshControlConstraints];
    refreshControlConstraints = self->_refreshControlConstraints;
    self->_refreshControlConstraints = 0;

    double v3 = v6;
  }
}

- (void)_installRefreshControlIntoContainerView
{
  id v18 = [(_UINavigationControllerRefreshControlHost *)self refreshControl];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_refreshControl);

  if (WeakRetained)
  {
    double v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = [v18 heightAnchor];
    id v6 = [v5 constraintEqualToConstant:60.0];
    [(NSArray *)v4 addObject:v6];

    id v7 = [v18 centerYAnchor];
    id v8 = [(UIView *)self->_hostContainerView centerYAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    [(NSArray *)v4 addObject:v9];

    v10 = [v18 leftAnchor];
    v11 = [(UIView *)self->_hostContainerView leftAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    [(NSArray *)v4 addObject:v12];

    v13 = [v18 rightAnchor];
    v14 = [(UIView *)self->_hostContainerView rightAnchor];
    objc_super v15 = [v13 constraintEqualToAnchor:v14];
    [(NSArray *)v4 addObject:v15];

    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_hostContainerView addSubview:v18];
    [MEMORY[0x1E4F5B268] activateConstraints:v4];
    refreshControlConstraints = self->_refreshControlConstraints;
    self->_refreshControlConstraints = v4;

    id v17 = objc_loadWeakRetained((id *)&self->_scrollView);
    [v17 _addScrollViewScrollObserver:v18];
  }
}

- (UIView)hostContainerView
{
  return self->_hostContainerView;
}

- (BOOL)isHostingRefreshControlOwnedByScrollView:(id)a3
{
  id v4 = a3;
  id v5 = [(_UINavigationControllerRefreshControlHost *)self scrollView];
  if (v5 == v4)
  {
    id v7 = [(_UINavigationControllerRefreshControlHost *)self refreshControl];
    id v8 = [v4 refreshControl];
    BOOL v6 = v7 == v8;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (UIRefreshControl)refreshControl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_refreshControl);
  return (UIRefreshControl *)WeakRetained;
}

- (BOOL)refreshControlInsetsAffectScrollViewRubberBanding
{
  return 0;
}

- (void)setRestingHeightOfRefreshControl:(double)a3
{
  double v3 = fmax(a3, 0.0);
  if (self->_restingHeightOfRefreshControl != v3)
  {
    self->_restingHeightOfRefreshControl = v3;
    [(_UINavigationControllerRefreshControlHost *)self _notifyLayoutDidChange];
  }
}

- (NSString)description
{
  v18.receiver = self;
  v18.super_class = (Class)_UINavigationControllerRefreshControlHost;
  double v3 = [(_UINavigationControllerRefreshControlHost *)&v18 description];
  if (os_variant_has_internal_diagnostics())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v7 = objc_msgSend(v3, "stringByAppendingFormat:", @" delegate=%p", v6);

      double v3 = (void *)v7;
    }
    id v8 = objc_loadWeakRetained((id *)&self->_navigationController);

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_navigationController);
      uint64_t v10 = objc_msgSend(v3, "stringByAppendingFormat:", @" navigationController=%p", v9);

      double v3 = (void *)v10;
    }
    id v11 = objc_loadWeakRetained((id *)&self->_scrollView);

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_scrollView);
      uint64_t v13 = objc_msgSend(v3, "stringByAppendingFormat:", @" scrollView=%p", v12);

      double v3 = (void *)v13;
    }
    p_refreshControl = &self->_refreshControl;
    id v15 = objc_loadWeakRetained((id *)p_refreshControl);

    if (v15)
    {
      id v16 = objc_loadWeakRetained((id *)p_refreshControl);
      uint64_t v17 = objc_msgSend(v3, "stringByAppendingFormat:", @" refreshControl=%p", v16);

      double v3 = (void *)v17;
    }
  }
  return (NSString *)v3;
}

- (void)stopAnimations
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59___UINavigationControllerRefreshControlHost_stopAnimations__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)dealloc
{
  [(UIView *)self->_hostContainerView removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationControllerRefreshControlHost;
  [(_UINavigationControllerRefreshControlHost *)&v3 dealloc];
}

- (void)incrementInsetHeight:(double)a3
{
  [(_UINavigationControllerRefreshControlHost *)self restingHeightOfRefreshControl];
  double v6 = v5 + a3;
  [(_UINavigationControllerRefreshControlHost *)self setRestingHeightOfRefreshControl:v6];
}

- (void)decrementInsetHeight:(double)a3
{
  [(_UINavigationControllerRefreshControlHost *)self restingHeightOfRefreshControl];
  double v6 = v5 - a3;
  [(_UINavigationControllerRefreshControlHost *)self setRestingHeightOfRefreshControl:v6];
}

- (void)refreshControl:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5
{
  [(_UINavigationControllerRefreshControlHost *)self _notifyLayoutDidChange];
  if (a4 == 4)
  {
    uint64_t v7 = [(_UINavigationControllerRefreshControlHost *)self scrollView];
    [v7 _contentOffsetAnimationDuration];
    double v9 = v8;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __87___UINavigationControllerRefreshControlHost_refreshControl_didChangeToState_fromState___block_invoke;
    v11[3] = &unk_1E52D9F98;
    id v12 = v7;
    uint64_t v13 = self;
    id v10 = v7;
    +[UIView animateWithDuration:v11 animations:v9];
  }
}

- (void)_notifyLayoutDidChange
{
  [(_UINavigationControllerRefreshControlHost *)self _updateFadeOutProgress];
  objc_super v3 = [(_UINavigationControllerRefreshControlHost *)self delegate];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67___UINavigationControllerRefreshControlHost__notifyLayoutDidChange__block_invoke;
    v5[3] = &unk_1E52D9F98;
    id v6 = v3;
    uint64_t v7 = self;
    [WeakRetained _performWhileIgnoringUpdateTopViewFramesToMatchScrollOffset:v5];
  }
}

- (void)_updateFadeOutProgress
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_refreshControl);
  unint64_t v4 = [WeakRetained refreshControlState];

  if (v4 > 6)
  {
    double v5 = 0.0;
  }
  else if (((1 << v4) & 0x47) != 0)
  {
    double v5 = 1.0;
  }
  else
  {
    if (((1 << v4) & 0x28) != 0) {
      [(_UINavigationControllerRefreshControlHost *)self _alphaForRefreshingControlStateWithPossiblyObstructedContent];
    }
    else {
      [(UIView *)self->_hostContainerView alpha];
    }
    double v5 = v6;
  }
  [(UIView *)self->_hostContainerView alpha];
  if (v5 != v7)
  {
    hostContainerView = self->_hostContainerView;
    [(UIView *)hostContainerView setAlpha:v5];
  }
}

- (double)_thresholdForObstructedContentFullAlpha
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_refreshControl);
  [WeakRetained _refreshControlHeight];
  double v4 = v3 + -2.0;

  return v4;
}

- (double)_thresholdForObstructedContentZeroAlpha
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_refreshControl);
  [WeakRetained _refreshControlHeight];
  double v4 = v3 * 0.5;

  return v4;
}

- (double)_alphaForRefreshingControlStateWithPossiblyObstructedContent
{
  [(_UINavigationControllerRefreshControlHost *)self _thresholdForObstructedContentFullAlpha];
  double v4 = v3;
  [(_UINavigationControllerRefreshControlHost *)self _thresholdForObstructedContentZeroAlpha];
  double v6 = (self->_unobstructedHeight - v5) / (v4 - v5);
  if (v6 > 1.0) {
    double v6 = 1.0;
  }
  return fmax(v6, 0.0);
}

- (_UINavigationControllerRefreshControlHostDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UINavigationControllerRefreshControlHostDelegate *)WeakRetained;
}

- (UINavigationController)navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  return (UINavigationController *)WeakRetained;
}

- (double)unobstructedHeight
{
  return self->_unobstructedHeight;
}

- (void)setRefreshControl:(id)a3
{
}

- (NSArray)refreshControlConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRefreshControlConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshControlConstraints, 0);
  objc_destroyWeak((id *)&self->_refreshControl);
  objc_storeStrong((id *)&self->_hostContainerView, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scrollView);
}

@end