@interface NCClickInteractionPresenter
- (BOOL)_isHinting;
- (BOOL)clickInteractionShouldBegin:(id)a3;
- (BOOL)dismissModalFullScreenIfNeeded;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isPresented;
- (CGRect)_finalPresentedViewFrame;
- (CGRect)_initialPresentedViewFrame;
- (CGRect)sourceViewVisibleRect;
- (MTMaterialView)_backgroundMaterialView;
- (NCClickInteractionPresentedControl)_presentedControl;
- (NCClickInteractionPresenter)initWithTitle:(id)a3 sourceView:(id)a4 materialRecipe:(int64_t)a5;
- (NCClickInteractionPresenterDelegate)delegate;
- (NCTouchEaterGestureRecognizer)_touchEater;
- (NSString)groupName;
- (NSString)title;
- (UIView)_containerView;
- (UIView)_portalView;
- (UIView)sourceView;
- (_UIClickInteraction)_clickInteraction;
- (double)_frictionForTransitionPresentation:(BOOL)a3 cancelled:(BOOL)a4;
- (double)_tensionForTransitionPresentation:(BOOL)a3 cancelled:(BOOL)a4;
- (id)highlightEffectForClickInteraction:(id)a3;
- (int64_t)materialRecipe;
- (int64_t)overrideUserInterfaceStyle;
- (void)_animatePresentation:(BOOL)a3 cancelled:(BOOL)a4 completion:(id)a5;
- (void)_configureBackgroundMaterialViewIfNecessary;
- (void)_configureContainerViewIfNecessary;
- (void)_configurePortalViewIfNecessary;
- (void)_configurePresentedControlIfNecessaryWithTitle:(id)a3;
- (void)_handleEatenTouch:(id)a3;
- (void)_performCancel;
- (void)_performPresentation;
- (void)_setHinting:(BOOL)a3;
- (void)_setPresented:(BOOL)a3;
- (void)_setUpBackgroundMaterialView;
- (void)_setUpContainerView;
- (void)_setUpPortalView;
- (void)_setUpPresentationIfNecessary;
- (void)_setUpPresentedControl;
- (void)_setUpSubviews;
- (void)_tearDown;
- (void)addTarget:(id)a3 action:(SEL)a4;
- (void)clickInteractionDidEnd:(id)a3;
- (void)contentSizeCategoryDidChange;
- (void)presentModalFullScreen;
- (void)setDelegate:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setOverrideUserInterfaceStyle:(int64_t)a3;
- (void)setSourceViewVisibleRect:(CGRect)a3;
- (void)setTitle:(id)a3;
@end

@implementation NCClickInteractionPresenter

- (NCClickInteractionPresenter)initWithTitle:(id)a3 sourceView:(id)a4 materialRecipe:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NCClickInteractionPresenter;
  v10 = [(NCClickInteractionPresenter *)&v19 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_sourceView, v9);
    [v9 bounds];
    v11->_sourceViewVisibleRect.origin.x = v12;
    v11->_sourceViewVisibleRect.origin.y = v13;
    v11->_sourceViewVisibleRect.size.width = v14;
    v11->_sourceViewVisibleRect.size.height = v15;
    v16 = (_UIClickInteraction *)objc_alloc_init(MEMORY[0x1E4FB2030]);
    clickInteraction = v11->_clickInteraction;
    v11->_clickInteraction = v16;

    [(_UIClickInteraction *)v11->_clickInteraction setDelegate:v11];
    [v9 addInteraction:v11->_clickInteraction];
    v11->_materialRecipe = a5;
    [(NCClickInteractionPresenter *)v11 _configurePresentedControlIfNecessaryWithTitle:v8];
  }

  return v11;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return [(NCClickInteractionPresentedControl *)self->_presentedControl _title];
}

- (void)setOverrideUserInterfaceStyle:(int64_t)a3
{
  if (self->_overrideUserInterfaceStyle != a3)
  {
    self->_overrideUserInterfaceStyle = a3;
    -[NCClickInteractionPresentedControl _setOverrideUserInterfaceStyle:](self->_presentedControl, "_setOverrideUserInterfaceStyle:");
  }
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
}

- (BOOL)dismissModalFullScreenIfNeeded
{
  if (self->_presented)
  {
    [(NCClickInteractionPresenter *)self _performCancel];
  }
  else
  {
    if (!self->_hinting) {
      return 0;
    }
    [(_UIClickInteraction *)self->_clickInteraction cancelInteraction];
  }
  return 1;
}

- (void)presentModalFullScreen
{
  [(NCClickInteractionPresenter *)self _setUpPresentationIfNecessary];

  [(NCClickInteractionPresenter *)self _performPresentation];
}

- (void)contentSizeCategoryDidChange
{
}

- (BOOL)clickInteractionShouldBegin:(id)a3
{
  p_sourceView = &self->_sourceView;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sourceView);
  [v5 locationInCoordinateSpace:WeakRetained];
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v12.x = v8;
  v12.y = v10;
  LODWORD(v5) = CGRectContainsPoint(self->_sourceViewVisibleRect, v12);

  if (v5) {
    [(NCClickInteractionPresenter *)self _setUpPresentationIfNecessary];
  }
  return self->_hinting;
}

- (id)highlightEffectForClickInteraction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4FB2228]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__NCClickInteractionPresenter_highlightEffectForClickInteraction___block_invoke;
  v8[3] = &unk_1E6A94D80;
  objc_copyWeak(&v9, &location);
  v6 = (void *)[v5 initWithProgressBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __66__NCClickInteractionPresenter_highlightEffectForClickInteraction___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 progress];
  double v6 = v5;

  CGFloat v27 = v6 * -0.25 / 1.5 + 1.0;
  double v7 = [WeakRetained _portalView];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v23 = v10;
  CGFloat v24 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat rect = v12;
  CGFloat v26 = v14;
  [WeakRetained sourceViewVisibleRect];
  CGFloat x = v33.origin.x;
  CGFloat y = v33.origin.y;
  CGFloat width = v33.size.width;
  CGFloat height = v33.size.height;
  memset(&v32, 0, sizeof(v32));
  double MidX = CGRectGetMidX(v33);
  v34.origin.CGFloat x = v9;
  v34.origin.CGFloat y = v11;
  v34.size.CGFloat width = v13;
  v34.size.CGFloat height = v26;
  tCGFloat x = (1.0 - v27) * (MidX - CGRectGetMidX(v34));
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v35);
  v36.origin.CGFloat y = v23;
  v36.origin.CGFloat x = v24;
  v36.size.CGFloat width = rect;
  v36.size.CGFloat height = v26;
  CGFloat v21 = CGRectGetMidY(v36);
  CGAffineTransformMakeTranslation(&v32, tx, (1.0 - v27) * (MidY - v21));
  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeScale(&v31, v27, v27);
  CGAffineTransform t1 = v32;
  memset(&v30, 0, sizeof(v30));
  CGAffineTransform t2 = v31;
  CGAffineTransformConcat(&v30, &t1, &t2);
  CGAffineTransform t1 = v30;
  [v7 setTransform:&t1];
}

- (void)clickInteractionDidEnd:(id)a3
{
  [(UIView *)self->_portalView removeFromSuperview];
  portalView = self->_portalView;
  self->_portalView = 0;

  if (self->_hinting)
  {
    [(NCClickInteractionPresenter *)self _performCancel];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchEater);

  if (WeakRetained == v7)
  {
    presentedControl = self->_presentedControl;
    [v6 locationInView:presentedControl];
    int v9 = -[NCClickInteractionPresentedControl pointInside:withEvent:](presentedControl, "pointInside:withEvent:", 0) ^ 1;
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)_setUpPresentationIfNecessary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [WeakRetained clickInteractionPresenterShouldBegin:self])
  {
    [(NCClickInteractionPresenter *)self _setUpSubviews];
    [(NCClickInteractionPresentedControl *)self->_presentedControl setUserInteractionEnabled:1];
    self->_hinting = 1;
    if (objc_opt_respondsToSelector()) {
      [WeakRetained clickInteractionPresenterDidBeginInteraction:self];
    }
  }
}

- (void)_configureContainerViewIfNecessary
{
  if (!self->_containerView)
  {
    id v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    containerView = self->_containerView;
    self->_containerView = v3;

    [(UIView *)self->_containerView setAutoresizesSubviews:1];
    [(UIView *)self->_containerView setAutoresizingMask:18];
    double v5 = [(UIView *)self->_containerView layer];
    [v5 setHitTestsAsOpaque:1];

    obj = [[NCTouchEaterGestureRecognizer alloc] initWithTarget:self action:sel__handleEatenTouch_];
    [(UIView *)self->_containerView addGestureRecognizer:obj];
    [(NCTouchEaterGestureRecognizer *)obj setDelegate:self];
    objc_storeWeak((id *)&self->_touchEater, obj);
  }
}

- (void)_setUpContainerView
{
  [(NCClickInteractionPresenter *)self _configureContainerViewIfNecessary];
  id v3 = [(UIView *)self->_containerView superview];

  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([WeakRetained containerViewForClickInteractionPresenter:self],
          (double v5 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v6 = objc_loadWeakRetained((id *)&self->_sourceView);
      double v5 = [v6 window];
    }
    [v5 addSubview:self->_containerView];
  }
  containerView = self->_containerView;
  double v8 = [(UIView *)containerView superview];
  [v8 bounds];
  -[UIView setFrame:](containerView, "setFrame:");

  id v9 = objc_loadWeakRetained((id *)&self->_touchEater);
  [v9 setEnabled:1];
}

- (void)_configureBackgroundMaterialViewIfNecessary
{
  if (!self->_backgroundMaterialView)
  {
    id v3 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:6 options:0 initialWeighting:0.0];
    backgroundMaterialView = self->_backgroundMaterialView;
    self->_backgroundMaterialView = v3;

    [(MTMaterialView *)self->_backgroundMaterialView setAutoresizingMask:18];
    [(MTMaterialView *)self->_backgroundMaterialView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:1];
    double v5 = self->_backgroundMaterialView;
    [(UIView *)self->_containerView bounds];
    -[MTMaterialView setFrame:](v5, "setFrame:");
  }
}

- (void)_setUpBackgroundMaterialView
{
  [(NCClickInteractionPresenter *)self _configureBackgroundMaterialViewIfNecessary];
  [(UIView *)self->_containerView insertSubview:self->_backgroundMaterialView atIndex:0];
  [(MTMaterialView *)self->_backgroundMaterialView setWeighting:0.0];
  backgroundMaterialView = self->_backgroundMaterialView;

  [(MTMaterialView *)backgroundMaterialView setHidden:1];
}

- (void)_configurePortalViewIfNecessary
{
  if (!self->_portalView)
  {
    id v3 = [NCClickInteractionPortalView alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
    double v5 = [(NCClickInteractionPortalView *)v3 initWithSourceView:WeakRetained];
    portalView = self->_portalView;
    self->_portalView = v5;

    [(NCClickInteractionPresenter *)self _configureContainerViewIfNecessary];
    containerView = self->_containerView;
    double v8 = self->_portalView;
    [(UIView *)containerView addSubview:v8];
  }
}

- (void)_setUpPortalView
{
  [(NCClickInteractionPresenter *)self _configurePortalViewIfNecessary];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  [WeakRetained frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  containerView = self->_containerView;
  double v12 = [WeakRetained superview];
  objc_msgSend(v12, "convertRect:toView:", 0, v4, v6, v8, v10);
  -[UIView convertRect:fromView:](containerView, "convertRect:fromView:", 0);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  -[UIView setFrame:](self->_portalView, "setFrame:", v14, v16, v18, v20);
}

- (void)_configurePresentedControlIfNecessaryWithTitle:(id)a3
{
  if (!self->_presentedControl)
  {
    id v4 = a3;
    double v5 = [[NCClickInteractionPresentedControl alloc] initWithTitle:v4 materialRecipe:self->_materialRecipe];

    presentedControl = self->_presentedControl;
    self->_presentedControl = v5;

    [(NCClickInteractionPresentedControl *)self->_presentedControl _setOverrideUserInterfaceStyle:[(NCClickInteractionPresenter *)self overrideUserInterfaceStyle]];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = [WeakRetained adjustsFontForContentSizeCategory];
    }
    else {
      uint64_t v7 = 0;
    }
    [(NCClickInteractionPresentedControl *)self->_presentedControl setAdjustsFontForContentSizeCategory:v7];
  }
}

- (void)_setUpPresentedControl
{
  presentedControl = self->_presentedControl;
  if (presentedControl)
  {
    id v4 = presentedControl;
    double v5 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    double v9 = __53__NCClickInteractionPresenter__setUpPresentedControl__block_invoke;
    double v10 = &unk_1E6A91A68;
    CGFloat v11 = self;
    double v12 = v4;
    double v6 = v4;
    [v5 performWithoutAnimation:&v7];
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_presentedControl, v7, v8, v9, v10, v11);
  }
}

uint64_t __53__NCClickInteractionPresenter__setUpPresentedControl__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _initialPresentedViewFrame];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "setFrame:");
  v13.origin.CGFloat x = v3;
  v13.origin.CGFloat y = v5;
  v13.size.CGFloat width = v7;
  v13.size.CGFloat height = v9;
  [*(id *)(a1 + 40) _setCornerRadius:CGRectGetHeight(v13) * 0.5];
  [*(id *)(a1 + 40) layoutIfNeeded];
  double v10 = *(void **)(a1 + 40);

  return [v10 setAlpha:0.0];
}

- (void)_setUpSubviews
{
  [(NCClickInteractionPresenter *)self _setUpContainerView];
  [(NCClickInteractionPresenter *)self _setUpPortalView];
  [(NCClickInteractionPresenter *)self _setUpBackgroundMaterialView];

  [(NCClickInteractionPresenter *)self _setUpPresentedControl];
}

- (CGRect)_initialPresentedViewFrame
{
  [(NCClickInteractionPresenter *)self _setUpContainerView];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  double v4 = [WeakRetained superview];
  objc_msgSend(WeakRetained, "convertRect:toView:", v4, self->_sourceViewVisibleRect.origin.x, self->_sourceViewVisibleRect.origin.y, self->_sourceViewVisibleRect.size.width, self->_sourceViewVisibleRect.size.height);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  CGRect v13 = [WeakRetained superview];
  objc_msgSend(v13, "convertRect:toView:", self->_containerView, v6, v8, v10, v12);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)_finalPresentedViewFrame
{
  [(NCClickInteractionPresenter *)self _configureContainerViewIfNecessary];
  [(NCClickInteractionPresenter *)self _initialPresentedViewFrame];
  CGFloat v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIView *)self->_containerView bounds];
  CGRect v33 = CGRectInset(v32, 8.0, 8.0);
  CGFloat y = v33.origin.y;
  CGFloat x = v33.origin.x;
  CGFloat height = v33.size.height;
  CGFloat width = v33.size.width;
  -[NCClickInteractionPresentedControl sizeThatFits:](self->_presentedControl, "sizeThatFits:", v33.size.width, v33.size.height);
  BSRectWithSize();
  CGFloat v11 = v6;
  CGFloat v12 = v8;
  CGFloat v13 = v10;
  UIRectCenteredYInRect();
  double v15 = v14;
  CGFloat v17 = v16;
  double v19 = v18;
  CGFloat v21 = v20;
  if (([(UIView *)self->_containerView _shouldReverseLayoutDirection] & 1) == 0)
  {
    v34.origin.CGFloat x = v4;
    v34.origin.CGFloat y = v11;
    v34.size.CGFloat width = v12;
    v34.size.CGFloat height = v13;
    double MaxX = CGRectGetMaxX(v34);
    v35.origin.CGFloat x = v15;
    v35.origin.CGFloat y = v17;
    v35.size.CGFloat width = v19;
    v35.size.CGFloat height = v21;
    double v15 = MaxX - CGRectGetWidth(v35);
  }
  NCRectConfinedToRect(v15, v17, v19, v21, x, y, width, height);
  _NCMainScreenScale();

  UIRectIntegralWithScale();
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (double)_tensionForTransitionPresentation:(BOOL)a3 cancelled:(BOOL)a4
{
  double result = 500.0;
  if (a4) {
    return 2000.0;
  }
  return result;
}

- (double)_frictionForTransitionPresentation:(BOOL)a3 cancelled:(BOOL)a4
{
  if (a4)
  {
    [(NCClickInteractionPresenter *)self _tensionForTransitionPresentation:a3 cancelled:1];
    return NCFrictionForCriticallyDampedSpringWithTension(v4);
  }
  else
  {
    double result = 18.0;
    if (a3) {
      return 26.0;
    }
  }
  return result;
}

- (void)_animatePresentation:(BOOL)a3 cancelled:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (v6) {
    [(NCClickInteractionPresenter *)self _finalPresentedViewFrame];
  }
  else {
    [(NCClickInteractionPresenter *)self _initialPresentedViewFrame];
  }
  CGFloat v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  objc_initWeak(&location, self);
  CGFloat v17 = (void *)MEMORY[0x1E4FB1EB0];
  [(NCClickInteractionPresenter *)self _tensionForTransitionPresentation:v6 cancelled:v5];
  double v19 = v18;
  [(NCClickInteractionPresenter *)self _frictionForTransitionPresentation:v6 cancelled:v5];
  double v21 = v20;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __73__NCClickInteractionPresenter__animatePresentation_cancelled_completion___block_invoke;
  v27[3] = &unk_1E6A94DA8;
  objc_copyWeak(v28, &location);
  BOOL v29 = v6;
  v28[1] = v13;
  v28[2] = v14;
  v28[3] = v15;
  v28[4] = v16;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73__NCClickInteractionPresenter__animatePresentation_cancelled_completion___block_invoke_2;
  v23[3] = &unk_1E6A94DD0;
  BOOL v26 = v6;
  objc_copyWeak(&v25, &location);
  id v22 = v8;
  id v24 = v22;
  [v17 _animateUsingSpringWithTension:v5 ^ 1 friction:v27 interactive:v23 animations:v19 completion:v21];

  objc_destroyWeak(&v25);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
}

void __73__NCClickInteractionPresenter__animatePresentation_cancelled_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = [WeakRetained _backgroundMaterialView];
  [v2 setHidden:0];

  double v3 = [WeakRetained _backgroundMaterialView];
  double v4 = v3;
  double v5 = 1.0;
  if (!*(unsigned char *)(a1 + 72)) {
    double v5 = 0.0;
  }
  [v3 setWeighting:v5];

  BOOL v6 = [WeakRetained _presentedControl];
  objc_msgSend(v6, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  int v7 = *(unsigned __int8 *)(a1 + 72);
  id v8 = [WeakRetained _presentedControl];
  double v9 = v8;
  if (v7) {
    [v8 _setContinuousCornerRadius:13.0];
  }
  else {
    [v8 _setCornerRadius:CGRectGetHeight(*(CGRect *)(a1 + 40)) * 0.5];
  }

  double v10 = [WeakRetained _presentedControl];
  CGFloat v11 = v10;
  double v12 = 1.0;
  if (!*(unsigned char *)(a1 + 72)) {
    double v12 = 0.0;
  }
  [v10 setAlpha:v12];

  CGFloat v13 = [WeakRetained _presentedControl];
  [v13 layoutIfNeeded];

  if (*(unsigned char *)(a1 + 72))
  {
    double v14 = (void *)*MEMORY[0x1E4FB2608];
    double v15 = [WeakRetained sourceView];
    double v16 = [v15 window];
    CGFloat v17 = [v16 _eventRoutingScene];
    [v14 _cancelAllEventsOfType:0 onEventRoutingScene:v17];
  }
}

uint64_t __73__NCClickInteractionPresenter__animatePresentation_cancelled_completion___block_invoke_2(uint64_t a1, int a2)
{
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v3 = a2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    double v5 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 clickInteractionPresenterDidPresent:WeakRetained];
    }
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    int v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)_performPresentation
{
  self->_hinting = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained clickInteractionPresenterDidCommitToPresentation:self];
  }
  self->_presented = 1;
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__NCClickInteractionPresenter__performPresentation__block_invoke;
  v4[3] = &unk_1E6A937A8;
  objc_copyWeak(&v5, &location);
  [(NCClickInteractionPresenter *)self _animatePresentation:1 cancelled:0 completion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__NCClickInteractionPresenter__performPresentation__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setPresented:a2];
  if ((a2 & 1) == 0 && (a3 & 1) == 0) {
    [WeakRetained _performCancel];
  }
}

- (void)_performCancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchEater);
  [WeakRetained setEnabled:0];

  [(NCClickInteractionPresentedControl *)self->_presentedControl setUserInteractionEnabled:0];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__NCClickInteractionPresenter__performCancel__block_invoke;
  v4[3] = &unk_1E6A937A8;
  objc_copyWeak(&v5, &location);
  [(NCClickInteractionPresenter *)self _animatePresentation:0 cancelled:1 completion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__NCClickInteractionPresenter__performCancel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _tearDown];
  v1 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    [v1 clickInteractionPresenterDidDismiss:WeakRetained];
  }
}

- (void)_tearDown
{
  *(_WORD *)&self->_presented = 0;
  [(UIView *)self->_containerView removeFromSuperview];
  containerView = self->_containerView;
  self->_containerView = 0;

  backgroundMaterialView = self->_backgroundMaterialView;
  self->_backgroundMaterialView = 0;

  portalView = self->_portalView;
  self->_portalView = 0;
}

- (void)_handleEatenTouch:(id)a3
{
  if ([a3 state] == 3)
  {
    [(NCClickInteractionPresenter *)self dismissModalFullScreenIfNeeded];
  }
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);

  return (UIView *)WeakRetained;
}

- (CGRect)sourceViewVisibleRect
{
  double x = self->_sourceViewVisibleRect.origin.x;
  double y = self->_sourceViewVisibleRect.origin.y;
  double width = self->_sourceViewVisibleRect.size.width;
  double height = self->_sourceViewVisibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceViewVisibleRect:(CGRect)a3
{
  self->_sourceViewVisibleRect = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (int64_t)materialRecipe
{
  return self->_materialRecipe;
}

- (NCClickInteractionPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCClickInteractionPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isPresented
{
  return self->_presented;
}

- (void)_setPresented:(BOOL)a3
{
  self->_presented = a3;
}

- (int64_t)overrideUserInterfaceStyle
{
  return self->_overrideUserInterfaceStyle;
}

- (_UIClickInteraction)_clickInteraction
{
  return self->_clickInteraction;
}

- (UIView)_containerView
{
  return self->_containerView;
}

- (UIView)_portalView
{
  return self->_portalView;
}

- (NCTouchEaterGestureRecognizer)_touchEater
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchEater);

  return (NCTouchEaterGestureRecognizer *)WeakRetained;
}

- (NCClickInteractionPresentedControl)_presentedControl
{
  return self->_presentedControl;
}

- (MTMaterialView)_backgroundMaterialView
{
  return self->_backgroundMaterialView;
}

- (BOOL)_isHinting
{
  return self->_hinting;
}

- (void)_setHinting:(BOOL)a3
{
  self->_hinting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_presentedControl, 0);
  objc_destroyWeak((id *)&self->_touchEater);
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_clickInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_groupName, 0);

  objc_destroyWeak((id *)&self->_sourceView);
}

@end