@interface TVRUIDirectionalControlView
- (BOOL)offsetDirectionalPad;
- (NSArray)interactionViews;
- (TVRButtonHaptic)haptic;
- (TVRUIDirectionalControlView)initWithStyleProvider:(id)a3;
- (TVRUIStyleProvider)styleProvider;
- (UIImageView)downImageView;
- (UIImageView)leftImageView;
- (UIImageView)rightImageView;
- (UIImageView)upImageView;
- (UIView)directionControlsWrapperView;
- (UIView)highlightedView;
- (UIView)selectIndicator;
- (UIView)tapHandlingSquareWrapperView;
- (_TVRUIEventDelegate)eventDelegate;
- (id)_createDirectionalImageViewWithImageName:(id)a3;
- (id)_directionalViewForTouchLocation:(CGPoint)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)_buttonTypeForLocation:(CGPoint)a3;
- (void)_configureGesture;
- (void)_configureLongPressGesture:(id)a3;
- (void)_highlightArrowView:(id)a3;
- (void)_highlightView:(id)a3 enabled:(BOOL)a4;
- (void)_layoutHighlightViewForView:(id)a3;
- (void)_sendSelectButtonPressBegan;
- (void)_sendSelectButtonPressEnded;
- (void)handleLongPress:(id)a3;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
- (void)setDirectionControlsWrapperView:(id)a3;
- (void)setDownImageView:(id)a3;
- (void)setEventDelegate:(id)a3;
- (void)setHaptic:(id)a3;
- (void)setHighlightedView:(id)a3;
- (void)setInteractionViews:(id)a3;
- (void)setLeftImageView:(id)a3;
- (void)setOffsetDirectionalPad:(BOOL)a3;
- (void)setRightImageView:(id)a3;
- (void)setSelectIndicator:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTapHandlingSquareWrapperView:(id)a3;
- (void)setUpImageView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TVRUIDirectionalControlView

- (TVRUIDirectionalControlView)initWithStyleProvider:(id)a3
{
  v43[5] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)TVRUIDirectionalControlView;
  v6 = [(TVRUIDirectionalControlView *)&v42 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_styleProvider, a3);
    v8 = [(TVRUIStyleProvider *)v7->_styleProvider touchpadBackgroundColor];
    [(TVRUIDirectionalControlView *)v7 setBackgroundColor:v8];

    v9 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    tapHandlingSquareWrapperView = v7->_tapHandlingSquareWrapperView;
    v7->_tapHandlingSquareWrapperView = v9;

    [(TVRUIDirectionalControlView *)v7 addSubview:v7->_tapHandlingSquareWrapperView];
    v11 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    directionControlsWrapperView = v7->_directionControlsWrapperView;
    v7->_directionControlsWrapperView = v11;

    [(TVRUIDirectionalControlView *)v7 addSubview:v7->_directionControlsWrapperView];
    uint64_t v13 = [(TVRUIDirectionalControlView *)v7 _createDirectionalImageViewWithImageName:@"DirectionalControlArrowUp"];
    upImageView = v7->_upImageView;
    v7->_upImageView = (UIImageView *)v13;

    uint64_t v15 = [(TVRUIDirectionalControlView *)v7 _createDirectionalImageViewWithImageName:@"DirectionalControlArrowRight"];
    rightImageView = v7->_rightImageView;
    v7->_rightImageView = (UIImageView *)v15;

    uint64_t v17 = [(TVRUIDirectionalControlView *)v7 _createDirectionalImageViewWithImageName:@"DirectionalControlArrowDown"];
    downImageView = v7->_downImageView;
    v7->_downImageView = (UIImageView *)v17;

    uint64_t v19 = [(TVRUIDirectionalControlView *)v7 _createDirectionalImageViewWithImageName:@"DirectionalControlArrowLeft"];
    leftImageView = v7->_leftImageView;
    v7->_leftImageView = (UIImageView *)v19;

    v21 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    selectIndicator = v7->_selectIndicator;
    v7->_selectIndicator = v21;

    v23 = [(TVRUIDirectionalControlView *)v7 styleProvider];
    [v23 directionalPadSelectButtonBorderWidth];
    double v25 = v24;
    v26 = [(UIView *)v7->_selectIndicator layer];
    [v26 setBorderWidth:v25];

    v27 = [(TVRUIDirectionalControlView *)v7 styleProvider];
    id v28 = [v27 directionalPadSelectButtonBorderColor];
    uint64_t v29 = [v28 CGColor];
    v30 = [(UIView *)v7->_selectIndicator layer];
    [v30 setBorderColor:v29];

    [(UIView *)v7->_selectIndicator setAlpha:0.6];
    v31 = [(UIView *)v7->_selectIndicator layer];
    [v31 setCornerRadius:24.0];

    v43[0] = v7->_upImageView;
    v43[1] = v7->_rightImageView;
    v43[2] = v7->_downImageView;
    v43[3] = v7->_leftImageView;
    v43[4] = v7->_selectIndicator;
    uint64_t v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:5];
    interactionViews = v7->_interactionViews;
    v7->_interactionViews = (NSArray *)v32;

    v34 = v7->_interactionViews;
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __53__TVRUIDirectionalControlView_initWithStyleProvider___block_invoke;
    v40[3] = &unk_264800B18;
    v35 = v7;
    v41 = v35;
    [(NSArray *)v34 enumerateObjectsUsingBlock:v40];
    v36 = (void *)[objc_alloc(MEMORY[0x263F82A70]) initWithDelegate:v35];
    [(TVRUIDirectionalControlView *)v35 addInteraction:v36];

    [(TVRUIDirectionalControlView *)v35 _configureLongPressGesture:v7->_selectIndicator];
    [(TVRUIDirectionalControlView *)v35 _configureGesture];
    uint64_t v37 = +[TVRButtonHaptic hapticForView:v7->_tapHandlingSquareWrapperView];
    haptic = v35->_haptic;
    v35->_haptic = (TVRButtonHaptic *)v37;
  }
  return v7;
}

uint64_t __53__TVRUIDirectionalControlView_initWithStyleProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 472) addSubview:a2];
}

- (void)layoutSubviews
{
  v40.receiver = self;
  v40.super_class = (Class)TVRUIDirectionalControlView;
  [(TVRUIDirectionalControlView *)&v40 layoutSubviews];
  [(TVRUIDirectionalControlView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UIView setBounds:](self->_tapHandlingSquareWrapperView, "setBounds:", 0.0, 0.0, v7, v7);
  v41.origin.CGFloat x = v4;
  v41.origin.CGFloat y = v6;
  v41.size.width = v8;
  v41.size.height = v10;
  double v11 = 0.5;
  CGFloat v12 = CGRectGetWidth(v41) * 0.5;
  v42.origin.CGFloat x = v4;
  v42.origin.CGFloat y = v6;
  v42.size.width = v8;
  v42.size.height = v10;
  -[UIView setCenter:](self->_tapHandlingSquareWrapperView, "setCenter:", v12, CGRectGetHeight(v42) * 0.5);
  v43.origin.CGFloat x = v4;
  v43.origin.CGFloat y = v6;
  v43.size.width = v8;
  v43.size.height = v10;
  CGFloat Width = CGRectGetWidth(v43);
  -[UIView setBounds:](self->_directionControlsWrapperView, "setBounds:", 0.0, 0.0, Width * 0.69, Width * 0.69);
  v44.origin.CGFloat x = v4;
  v44.origin.CGFloat y = v6;
  v44.size.width = v8;
  v44.size.height = v10;
  double Height = CGRectGetHeight(v44);
  [(UIView *)self->_directionControlsWrapperView bounds];
  CGFloat x = v15;
  CGFloat y = v17;
  CGFloat v38 = v18;
  CGFloat v20 = v19;
  if ([(TVRUIDirectionalControlView *)self offsetDirectionalPad])
  {
    v21 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v21, OS_LOG_TYPE_DEFAULT, "Directional view adjusting position for media controls", buf, 2u);
    }

    v45.origin.CGFloat x = v4;
    v45.origin.CGFloat y = v6;
    v45.size.width = v8;
    v45.size.height = v10;
    double v22 = CGRectGetHeight(v45);
    v23 = [(TVRUIDirectionalControlView *)self styleProvider];
    [v23 mediaControlsViewHeight];
    double v25 = v22 - v24;

    double v26 = v25 * 0.5;
    v27 = [(TVRUIDirectionalControlView *)self styleProvider];
    int v28 = [v27 isSmallDevice];

    if (v28)
    {
      CGFloat rect = v20;
      uint64_t v29 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227326000, v29, OS_LOG_TYPE_DEFAULT, "Showing the directional controls on a small device so adjusting the insets to ensure the controls fit.", buf, 2u);
      }

      v30 = [(TVRUIDirectionalControlView *)self styleProvider];
      [v30 directionalPadInsetForSmallDevices];
      CGFloat v32 = v31;
      CGFloat v34 = v33;

      v46.origin.CGFloat x = x;
      v46.origin.CGFloat y = y;
      v46.size.width = v38;
      v46.size.height = rect;
      CGRect v47 = CGRectInset(v46, v34, v32);
      CGFloat x = v47.origin.x;
      CGFloat y = v47.origin.y;
      CGFloat v38 = v47.size.width;
      double v26 = v26 + v34;
      CGFloat v20 = v47.size.height;
      double v11 = 0.5;
    }
  }
  else
  {
    double v26 = Height * 0.5;
  }
  v48.origin.CGFloat x = v4;
  v48.origin.CGFloat y = v6;
  v48.size.width = v8;
  v48.size.height = v10;
  -[UIView setCenter:](self->_directionControlsWrapperView, "setCenter:", CGRectGetWidth(v48) * v11, v26);
  -[UIView setBounds:](self->_selectIndicator, "setBounds:", 0.0, 0.0, 88.0, 88.0);
  [(UIView *)self->_directionControlsWrapperView bounds];
  CGFloat v35 = CGRectGetWidth(v49) * v11;
  [(UIView *)self->_directionControlsWrapperView bounds];
  -[UIView setCenter:](self->_selectIndicator, "setCenter:", v35, CGRectGetHeight(v50) * v11);
  [(UIImageView *)self->_upImageView setFrame:_TVRImageFrameForDirectionalImage_0(self->_upImageView, 1, x, y, v38, v20)];
  [(TVRUIDirectionalControlView *)self _layoutHighlightViewForView:self->_upImageView];
  [(UIImageView *)self->_downImageView setFrame:_TVRImageFrameForDirectionalImage_0(self->_downImageView, 4, x, y, v38, v20)];
  [(TVRUIDirectionalControlView *)self _layoutHighlightViewForView:self->_downImageView];
  [(UIImageView *)self->_leftImageView setFrame:_TVRImageFrameForDirectionalImage_0(self->_leftImageView, 2, x, y, v38, v20)];
  [(TVRUIDirectionalControlView *)self _layoutHighlightViewForView:self->_leftImageView];
  [(UIImageView *)self->_rightImageView setFrame:_TVRImageFrameForDirectionalImage_0(self->_rightImageView, 8, x, y, v38, v20)];
  [(TVRUIDirectionalControlView *)self _layoutHighlightViewForView:self->_rightImageView];
}

- (void)setOffsetDirectionalPad:(BOOL)a3
{
  if (self->_offsetDirectionalPad != a3)
  {
    self->_offsetDirectionalPad = a3;
    uint64_t v4 = [(TVRUIDirectionalControlView *)self window];
    if (v4)
    {
      double v5 = (void *)v4;
      CGFloat v6 = [(TVRUIDirectionalControlView *)self superview];

      if (v6)
      {
        v7[0] = MEMORY[0x263EF8330];
        v7[1] = 3221225472;
        v7[2] = __55__TVRUIDirectionalControlView_setOffsetDirectionalPad___block_invoke;
        v7[3] = &unk_2647FFF70;
        v7[4] = self;
        [MEMORY[0x263F82E00] animateWithDuration:v7 animations:0.4];
      }
    }
  }
}

uint64_t __55__TVRUIDirectionalControlView_setOffsetDirectionalPad___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)TVRUIDirectionalControlView;
  id v6 = a3;
  [(TVRUIDirectionalControlView *)&v15 touchesBegan:v6 withEvent:a4];
  double v7 = objc_msgSend(v6, "anyObject", v15.receiver, v15.super_class);

  CGFloat v8 = [(TVRUIDirectionalControlView *)self tapHandlingSquareWrapperView];
  [v7 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  -[TVRUIDirectionalControlView _directionalViewForTouchLocation:](self, "_directionalViewForTouchLocation:", v10, v12);
  uint64_t v13 = (UIView *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && v13 == self->_selectIndicator)
  {
    objc_storeWeak((id *)&self->_highlightedView, v13);
    [(TVRUIDirectionalControlView *)self _highlightView:v14 enabled:1];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TVRUIDirectionalControlView;
  [(TVRUIDirectionalControlView *)&v6 touchesEnded:a3 withEvent:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_highlightedView);
  [(TVRUIDirectionalControlView *)self _highlightView:WeakRetained enabled:0];

  objc_storeWeak((id *)&self->_highlightedView, 0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TVRUIDirectionalControlView;
  [(TVRUIDirectionalControlView *)&v6 touchesCancelled:a3 withEvent:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_highlightedView);
  [(TVRUIDirectionalControlView *)self _highlightView:WeakRetained enabled:0];

  objc_storeWeak((id *)&self->_highlightedView, 0);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  double v7 = [(TVRUIDirectionalControlView *)self interactionViews];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __81__TVRUIDirectionalControlView_pointerInteraction_regionForRequest_defaultRegion___block_invoke;
  v24[3] = &unk_264800B40;
  v24[4] = self;
  uint64_t v26 = 0x403E000000000000;
  id v8 = v6;
  id v25 = v8;
  uint64_t v9 = [v7 indexOfObjectPassingTest:v24];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v10 = 0;
  }
  else
  {
    double v11 = [(TVRUIDirectionalControlView *)self interactionViews];
    double v12 = [v11 objectAtIndexedSubscript:v9];

    [v12 bounds];
    CGRect v29 = CGRectInset(v28, -30.0, -30.0);
    -[TVRUIDirectionalControlView convertRect:fromView:](self, "convertRect:fromView:", v12, v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v21 = (void *)MEMORY[0x263F82A80];
    double v22 = [NSNumber numberWithUnsignedInteger:v9];
    double v10 = objc_msgSend(v21, "regionWithRect:identifier:", v22, v14, v16, v18, v20);
  }
  return v10;
}

BOOL __81__TVRUIDirectionalControlView_pointerInteraction_regionForRequest_defaultRegion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 superview];
  [v3 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v4, "convertRect:toView:", *(void *)(a1 + 32), v6, v8, v10, v12);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v35.origin.CGFloat x = v14;
  v35.origin.CGFloat y = v16;
  v35.size.CGFloat width = v18;
  v35.size.CGFloat height = v20;
  CGRect v36 = CGRectInset(v35, -*(double *)(a1 + 48), -*(double *)(a1 + 48));
  CGFloat x = v36.origin.x;
  CGFloat y = v36.origin.y;
  CGFloat width = v36.size.width;
  CGFloat height = v36.size.height;
  [*(id *)(a1 + 40) location];
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  CGFloat v29 = x;
  CGFloat v30 = y;
  CGFloat v31 = width;
  CGFloat v32 = height;
  return CGRectContainsPoint(*(CGRect *)&v29, *(CGPoint *)&v26);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  double v5 = objc_msgSend(a4, "identifier", a3);
  double v6 = [(TVRUIDirectionalControlView *)self interactionViews];
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "integerValue"));
  double v7 = (UIImageView *)objc_claimAutoreleasedReturnValue();

  [(UIImageView *)v7 bounds];
  double Width = CGRectGetWidth(v22);
  [(UIImageView *)v7 bounds];
  double Height = CGRectGetHeight(v23);
  if (Width >= Height) {
    double Height = Width;
  }
  if (v7 == (UIImageView *)self->_selectIndicator)
  {
    [(UIImageView *)v7 bounds];
    CGRect v25 = CGRectInset(v24, -10.0, -10.0);
    double x = v25.origin.x;
    double y = v25.origin.y;
    double v10 = v25.size.width;
    double v15 = v25.size.height;
    double v11 = 24.0;
  }
  else
  {
    double v10 = Height + 20.0;
    double v11 = (Height + 20.0) * 0.5;
    if (v7 == self->_leftImageView || v7 == self->_rightImageView)
    {
      double y = -10.0;
      double x = -25.0;
    }
    else
    {
      if (v7 != self->_upImageView && v7 != self->_downImageView)
      {
        double v12 = 0;
        goto LABEL_14;
      }
      double y = -25.0;
      double x = -10.0;
    }
    double v15 = Height + 20.0;
  }
  id v16 = objc_alloc_init(MEMORY[0x263F82AD0]);
  double v17 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", x, y, v10, v15, v11);
  [v16 setVisiblePath:v17];
  CGFloat v18 = (void *)[objc_alloc(MEMORY[0x263F82CC8]) initWithView:v7 parameters:v16];
  double v19 = [MEMORY[0x263F82A68] effectWithPreview:v18];
  double v12 = [MEMORY[0x263F82A90] styleWithEffect:v19 shape:0];

LABEL_14:
  return v12;
}

- (id)_createDirectionalImageViewWithImageName:(id)a3
{
  id v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  double v5 = [v3 bundleForClass:objc_opt_class()];
  double v6 = [MEMORY[0x263F827E8] imageNamed:v4 inBundle:v5 compatibleWithTraitCollection:0];

  double v7 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v6];
  [v7 setAlpha:0.6];
  id v8 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v8 setAlpha:0.0];
  [v7 insertSubview:v8 atIndex:0];

  return v7;
}

- (void)_layoutHighlightViewForView:(id)a3
{
  id v3 = a3;
  id v4 = [v3 subviews];
  id v14 = [v4 objectAtIndexedSubscript:0];

  objc_msgSend(v14, "setBounds:", 0.0, 0.0, 72.0, 72.0);
  [v3 bounds];
  CGFloat v5 = CGRectGetWidth(v16) * 0.5;
  [v3 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v17.origin.double x = v7;
  v17.origin.double y = v9;
  v17.size.CGFloat width = v11;
  v17.size.CGFloat height = v13;
  objc_msgSend(v14, "setCenter:", v5, CGRectGetHeight(v17) * 0.5);
  [v14 bounds];
  [v14 _setCornerRadius:CGRectGetWidth(v18) * 0.5];
}

- (id)_directionalViewForTouchLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_selectIndicator = &self->_selectIndicator;
  selectIndicator = self->_selectIndicator;
  double v8 = [(TVRUIDirectionalControlView *)self tapHandlingSquareWrapperView];
  -[UIView convertPoint:fromView:](selectIndicator, "convertPoint:fromView:", v8, x, y);
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  [(UIView *)*p_selectIndicator bounds];
  v29.double x = v10;
  v29.double y = v12;
  if (!CGRectContainsPoint(v30, v29))
  {
    CGFloat v13 = [(TVRUIDirectionalControlView *)self tapHandlingSquareWrapperView];
    [v13 bounds];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v31.origin.double x = v15;
    v31.origin.double y = v17;
    v31.size.CGFloat width = v19;
    v31.size.CGFloat height = v21;
    double v22 = CGRectGetHeight(v31) - x;
    BOOL v23 = y >= v22;
    BOOL v24 = y >= x;
    if (y >= x || y >= v22)
    {
      if (y < v22) {
        BOOL v24 = 1;
      }
      if (v24)
      {
        if (y < x || y < v22)
        {
          if (y < x) {
            BOOL v23 = 1;
          }
          if (v23)
          {
            uint64_t v26 = 0;
            goto LABEL_19;
          }
          CGRect v25 = &OBJC_IVAR___TVRUIDirectionalControlView__leftImageView;
        }
        else
        {
          CGRect v25 = &OBJC_IVAR___TVRUIDirectionalControlView__downImageView;
        }
      }
      else
      {
        CGRect v25 = &OBJC_IVAR___TVRUIDirectionalControlView__rightImageView;
      }
    }
    else
    {
      CGRect v25 = &OBJC_IVAR___TVRUIDirectionalControlView__upImageView;
    }
    p_selectIndicator = (UIView **)((char *)self + *v25);
  }
  uint64_t v26 = *p_selectIndicator;
LABEL_19:
  return v26;
}

- (void)_highlightView:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (UIImageView *)a3;
  if ((UIImageView *)self->_selectIndicator == v6
    || self->_upImageView == v6
    || self->_downImageView == v6
    || self->_rightImageView == v6
    || self->_leftImageView == v6)
  {
    double v7 = 0.6;
    if (v4) {
      double v7 = 1.0;
    }
    double v8 = v6;
    [(UIImageView *)v6 setAlpha:v7];
    double v6 = v8;
  }
}

- (void)_highlightArrowView:(id)a3
{
  id v3 = a3;
  [v3 setAlpha:1.0];
  BOOL v4 = [v3 subviews];
  CGFloat v5 = [v4 objectAtIndexedSubscript:0];

  double v6 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.4];
  [v5 setBackgroundColor:v6];

  [v5 setAlpha:1.0];
  double v7 = (void *)MEMORY[0x263F82E00];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__TVRUIDirectionalControlView__highlightArrowView___block_invoke;
  v10[3] = &unk_264800638;
  id v11 = v5;
  id v12 = v3;
  id v8 = v3;
  id v9 = v5;
  [v7 animateWithDuration:v10 animations:0 completion:0.35];
}

uint64_t __51__TVRUIDirectionalControlView__highlightArrowView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.6];
}

- (void)_configureGesture
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_handleTap_];
  [v3 setCancelsTouchesInView:0];
  [v3 setDelaysTouchesBegan:0];
  [v3 setDelaysTouchesEnded:0];
  [(TVRUIDirectionalControlView *)self addGestureRecognizer:v3];
}

- (void)handleTap:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 state] == 3)
  {
    uint64_t v5 = [(TVRUIDirectionalControlView *)self eventDelegate];
    if (v5)
    {
      double v6 = (void *)v5;
      double v7 = [(TVRUIDirectionalControlView *)self eventDelegate];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        [(TVRButtonHaptic *)self->_haptic userInteractionBegan];
        [v4 locationInView:self];
        CGFloat v10 = v9;
        double v12 = v11;
        CGFloat v13 = [(TVRUIDirectionalControlView *)self tapHandlingSquareWrapperView];
        [v13 frame];
        v34.double x = v10;
        v34.double y = v12;
        BOOL v14 = CGRectContainsPoint(v35, v34);

        if (v14)
        {
          CGFloat v15 = [(TVRUIDirectionalControlView *)self tapHandlingSquareWrapperView];
          [v4 locationInView:v15];
          -[TVRUIDirectionalControlView _directionalViewForTouchLocation:](self, "_directionalViewForTouchLocation:");
          double v16 = (UIView *)objc_claimAutoreleasedReturnValue();

          if (v16 && v16 != self->_selectIndicator) {
            [(TVRUIDirectionalControlView *)self _highlightArrowView:v16];
          }
          CGFloat v17 = [(TVRUIDirectionalControlView *)self tapHandlingSquareWrapperView];
          [v4 locationInView:v17];
          int64_t v18 = -[TVRUIDirectionalControlView _buttonTypeForLocation:](self, "_buttonTypeForLocation:");

          CGFloat v19 = +[TVRUIButtonEvent createButtonEvent:1 buttonType:v18];
          double v20 = [(TVRUIDirectionalControlView *)self eventDelegate];
          [v20 generatedButtonEvent:v19];

          CGFloat v21 = +[TVRUIButtonEvent createButtonEvent:2 buttonType:v18];
          double v22 = [(TVRUIDirectionalControlView *)self eventDelegate];
          [v22 generatedButtonEvent:v21];

          BOOL v23 = _TVRUIViewControllerLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            int64_t v32 = v18;
            _os_log_impl(&dword_227326000, v23, OS_LOG_TYPE_DEFAULT, "Detected directional control tap within bounds of button type %ld", buf, 0xCu);
          }

          goto LABEL_17;
        }
        [(TVRUIDirectionalControlView *)self bounds];
        if (v12 >= v24 * 0.5)
        {
          double v16 = +[TVRUIButtonEvent createButtonEvent:1 buttonType:13];
          uint64_t v28 = [(TVRUIDirectionalControlView *)self eventDelegate];
          [v28 generatedButtonEvent:v16];

          CGFloat v19 = +[TVRUIButtonEvent createButtonEvent:2 buttonType:13];
          CGPoint v29 = [(TVRUIDirectionalControlView *)self eventDelegate];
          [v29 generatedButtonEvent:v19];

          CGFloat v21 = _TVRUIViewControllerLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            uint64_t v27 = "Detected directional control tap outside bounds - lower half. Sending arrow down";
            goto LABEL_16;
          }
        }
        else
        {
          double v16 = +[TVRUIButtonEvent createButtonEvent:1 buttonType:12];
          CGRect v25 = [(TVRUIDirectionalControlView *)self eventDelegate];
          [v25 generatedButtonEvent:v16];

          CGFloat v19 = +[TVRUIButtonEvent createButtonEvent:2 buttonType:12];
          uint64_t v26 = [(TVRUIDirectionalControlView *)self eventDelegate];
          [v26 generatedButtonEvent:v19];

          CGFloat v21 = _TVRUIViewControllerLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            uint64_t v27 = "Detected directional control tap outside bounds - top half. Sending arrow up";
LABEL_16:
            _os_log_impl(&dword_227326000, v21, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
          }
        }
LABEL_17:

        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __41__TVRUIDirectionalControlView_handleTap___block_invoke;
        block[3] = &unk_2647FFF70;
        block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
  }
}

uint64_t __41__TVRUIDirectionalControlView_handleTap___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 504) userInteractionEnded];
}

- (int64_t)_buttonTypeForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  selectIndicator = self->_selectIndicator;
  double v7 = [(TVRUIDirectionalControlView *)self tapHandlingSquareWrapperView];
  -[UIView convertPoint:fromView:](selectIndicator, "convertPoint:fromView:", v7, x, y);
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(UIView *)self->_selectIndicator bounds];
  v25.double x = v9;
  v25.double y = v11;
  if (CGRectContainsPoint(v26, v25)) {
    return 1;
  }
  CGFloat v13 = [(TVRUIDirectionalControlView *)self tapHandlingSquareWrapperView];
  [v13 bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v27.origin.double x = v15;
  v27.origin.double y = v17;
  v27.size.CGFloat width = v19;
  v27.size.CGFloat height = v21;
  double v22 = CGRectGetHeight(v27) - x;
  BOOL v23 = y >= v22;
  BOOL v24 = y >= x;
  if (y < x && y < v22) {
    return 12;
  }
  if (y < v22) {
    BOOL v24 = 1;
  }
  if (!v24) {
    return 15;
  }
  if (y >= x && y >= v22) {
    return 13;
  }
  if (y < x) {
    BOOL v23 = 1;
  }
  if (v23) {
    return 0;
  }
  else {
    return 14;
  }
}

- (void)_configureLongPressGesture:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F82938];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithTarget:self action:sel_handleLongPress_];
  [v6 setMinimumPressDuration:0.3];
  [v6 setCancelsTouchesInView:1];
  [v6 setDelaysTouchesBegan:0];
  [v6 setDelaysTouchesEnded:0];
  [v5 addGestureRecognizer:v6];
}

- (void)handleLongPress:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    [(TVRUIDirectionalControlView *)self _sendSelectButtonPressBegan];
  }
  else if ([v4 state] == 3 || objc_msgSend(v4, "state") == 4)
  {
    [(TVRUIDirectionalControlView *)self _sendSelectButtonPressEnded];
  }
}

- (void)_sendSelectButtonPressBegan
{
  id v4 = +[TVRUIButtonEvent createButtonEvent:1 buttonType:1];
  id v3 = [(TVRUIDirectionalControlView *)self eventDelegate];
  [v3 generatedButtonEvent:v4];
}

- (void)_sendSelectButtonPressEnded
{
  id v4 = +[TVRUIButtonEvent createButtonEvent:2 buttonType:1];
  id v3 = [(TVRUIDirectionalControlView *)self eventDelegate];
  [v3 generatedButtonEvent:v4];
}

- (_TVRUIEventDelegate)eventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventDelegate);
  return (_TVRUIEventDelegate *)WeakRetained;
}

- (void)setEventDelegate:(id)a3
{
}

- (BOOL)offsetDirectionalPad
{
  return self->_offsetDirectionalPad;
}

- (UIView)selectIndicator
{
  return self->_selectIndicator;
}

- (void)setSelectIndicator:(id)a3
{
}

- (UIImageView)upImageView
{
  return self->_upImageView;
}

- (void)setUpImageView:(id)a3
{
}

- (UIImageView)rightImageView
{
  return self->_rightImageView;
}

- (void)setRightImageView:(id)a3
{
}

- (UIImageView)downImageView
{
  return self->_downImageView;
}

- (void)setDownImageView:(id)a3
{
}

- (UIImageView)leftImageView
{
  return self->_leftImageView;
}

- (void)setLeftImageView:(id)a3
{
}

- (NSArray)interactionViews
{
  return self->_interactionViews;
}

- (void)setInteractionViews:(id)a3
{
}

- (UIView)directionControlsWrapperView
{
  return self->_directionControlsWrapperView;
}

- (void)setDirectionControlsWrapperView:(id)a3
{
}

- (UIView)tapHandlingSquareWrapperView
{
  return self->_tapHandlingSquareWrapperView;
}

- (void)setTapHandlingSquareWrapperView:(id)a3
{
}

- (UIView)highlightedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_highlightedView);
  return (UIView *)WeakRetained;
}

- (void)setHighlightedView:(id)a3
{
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (TVRButtonHaptic)haptic
{
  return self->_haptic;
}

- (void)setHaptic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_haptic, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_destroyWeak((id *)&self->_highlightedView);
  objc_storeStrong((id *)&self->_tapHandlingSquareWrapperView, 0);
  objc_storeStrong((id *)&self->_directionControlsWrapperView, 0);
  objc_storeStrong((id *)&self->_interactionViews, 0);
  objc_storeStrong((id *)&self->_leftImageView, 0);
  objc_storeStrong((id *)&self->_downImageView, 0);
  objc_storeStrong((id *)&self->_rightImageView, 0);
  objc_storeStrong((id *)&self->_upImageView, 0);
  objc_storeStrong((id *)&self->_selectIndicator, 0);
  objc_destroyWeak((id *)&self->_eventDelegate);
}

@end