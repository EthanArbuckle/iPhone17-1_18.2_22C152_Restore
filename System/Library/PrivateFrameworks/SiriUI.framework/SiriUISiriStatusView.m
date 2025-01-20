@interface SiriUISiriStatusView
+ (CGRect)activeFrameForScreen:(id)a3 frame:(CGRect)a4 safeAreaInsets:(UIEdgeInsets)a5;
- (BOOL)flamesViewDeferred;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isInUITrackingMode;
- (BOOL)paused;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_flamesFrame;
- (CGRect)_flamesViewFrame;
- (CGRect)_siriGlyphTappableRect;
- (CGSize)sizeThatFits:(CGSize)result;
- (SiriUISiriStatusView)initWithFrame:(CGRect)a3 screen:(id)a4 textInputEnabled:(BOOL)a5 configuration:(id)a6;
- (SiriUISiriStatusViewAnimationDelegate)animationDelegate;
- (SiriUISiriStatusViewDelegate)delegate;
- (UIEdgeInsets)safeAreaInsets;
- (UIView)flamesContainerView;
- (double)disabledMicOpacity;
- (double)flamesViewWidth;
- (double)statusViewHeight;
- (float)audioLevelForFlamesView:(id)a3;
- (id)_flamesView;
- (int64_t)mode;
- (void)_animateSiriGlyphHidden:(BOOL)a3;
- (void)_attachFlamesViewIfNeeded;
- (void)_handleKeyboardDidShowNotification:(id)a3;
- (void)_handleKeyboardWillHideNotification:(id)a3;
- (void)_layoutFlamesViewIfNeeded;
- (void)_micButtonHeld:(id)a3;
- (void)_micButtonTapped:(id)a3;
- (void)_setFlamesViewState:(int64_t)a3;
- (void)_setupOrbIfNeeded:(id)a3;
- (void)dealloc;
- (void)fadeOutCurrentAura;
- (void)forceMicVisible:(BOOL)a3;
- (void)layoutSubviews;
- (void)setAnimationDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabledMicOpacity:(double)a3;
- (void)setFlamesViewDeferred:(BOOL)a3;
- (void)setFlamesViewWidth:(double)a3;
- (void)setInUITrackingMode:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setPaused:(BOOL)a3;
- (void)setupOrbIfNeeded;
@end

@implementation SiriUISiriStatusView

- (SiriUISiriStatusView)initWithFrame:(CGRect)a3 screen:(id)a4 textInputEnabled:(BOOL)a5 configuration:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a4;
  id v15 = a6;
  v40.receiver = self;
  v40.super_class = (Class)SiriUISiriStatusView;
  v16 = -[SiriUISiriStatusView initWithFrame:](&v40, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_screen, a4);
    objc_storeStrong((id *)&v17->_configuration, a6);
    v17->_textInputEnabled = a5;
    id v18 = objc_alloc(MEMORY[0x263F1CB60]);
    uint64_t v19 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    touchInputView = v17->_touchInputView;
    v17->_touchInputView = (UIView *)v19;

    v21 = v17->_touchInputView;
    v22 = [MEMORY[0x263F1C550] clearColor];
    [(UIView *)v21 setBackgroundColor:v22];

    v23 = [(UIView *)v17->_touchInputView layer];
    [v23 setHitTestsAsOpaque:1];

    [(SiriUISiriStatusView *)v17 addSubview:v17->_touchInputView];
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 85.0, 85.0);
    glyphView = v17->_glyphView;
    v17->_glyphView = (UIView *)v24;

    [(UIView *)v17->_glyphView setAlpha:0.0];
    [(UIView *)v17->_glyphView setHidden:v17->_textInputEnabled];
    v26 = v17->_glyphView;
    v27 = [MEMORY[0x263F1C550] clearColor];
    [(UIView *)v26 setBackgroundColor:v27];

    v28 = [(UIView *)v17->_glyphView layer];
    [v28 setAllowsGroupBlending:0];

    [(SiriUISiriStatusView *)v17 insertSubview:v17->_glyphView below:v17->_touchInputView];
    v29 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v30 = dispatch_queue_create("SiriUIStatusView.GlyphConfigurationQueue", v29);
    glyphConfigurationQueue = v17->_glyphConfigurationQueue;
    v17->_glyphConfigurationQueue = (OS_dispatch_queue *)v30;

    v32 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v17 action:sel__micButtonTapped_];
    [v32 setDelegate:v17];
    [(UIView *)v17->_touchInputView addGestureRecognizer:v32];
    uint64_t v33 = [objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:v17 action:sel__micButtonHeld_];
    longPressRecognizer = v17->_longPressRecognizer;
    v17->_longPressRecognizer = (UILongPressGestureRecognizer *)v33;

    [(UILongPressGestureRecognizer *)v17->_longPressRecognizer setMinimumPressDuration:0.1];
    [(UILongPressGestureRecognizer *)v17->_longPressRecognizer setDelegate:v17];
    [(UIView *)v17->_touchInputView addGestureRecognizer:v17->_longPressRecognizer];
    id v35 = objc_alloc(MEMORY[0x263F1CB60]);
    [(SiriUISiriStatusView *)v17 bounds];
    uint64_t v36 = objc_msgSend(v35, "initWithFrame:");
    flamesContainerView = v17->_flamesContainerView;
    v17->_flamesContainerView = (UIView *)v36;

    [(SiriUISiriStatusView *)v17 insertSubview:v17->_flamesContainerView above:v17->_touchInputView];
    [(UIView *)v17->_flamesContainerView setUserInteractionEnabled:0];
    v38 = [MEMORY[0x263F08A00] defaultCenter];
    [v38 addObserver:v17 selector:sel__handleKeyboardDidShowNotification_ name:*MEMORY[0x263F1D418] object:0];
    [v38 addObserver:v17 selector:sel__handleKeyboardWillHideNotification_ name:*MEMORY[0x263F1D480] object:0];
    [(SiriUISiriStatusView *)v17 setNeedsLayout];
  }
  return v17;
}

+ (CGRect)activeFrameForScreen:(id)a3 frame:(CGRect)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  CGFloat y = a4.origin.y;
  CGFloat v9 = a4.origin.x + a5.left;
  CGFloat v6 = v9;
  CGFloat v10 = a4.size.width - (a5.left + a5.right);
  CGFloat v7 = v10;
  CGFloat v11 = a4.size.height - a5.bottom;
  CGFloat v8 = v11;
  CGRectGetHeight(a4);
  v17.origin.double x = v6;
  v17.origin.CGFloat y = y;
  v17.size.double width = v7;
  v17.size.double height = v8;
  CGRectGetWidth(v17);
  UIRectCenteredXInRect();
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.CGFloat y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)dealloc
{
  [(SUICFlamesView *)self->_flamesView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SiriUISiriStatusView;
  [(SiriUISiriStatusView *)&v3 dealloc];
}

- (UIView)flamesContainerView
{
  return self->_flamesContainerView;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 90.0;
  result.double height = v3;
  return result;
}

- (void)forceMicVisible:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a3 && (unint64_t)(self->_mode - 1) <= 1)
  {
    double v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      CGFloat v6 = "-[SiriUISiriStatusView forceMicVisible:]";
      _os_log_impl(&dword_2231EF000, v3, OS_LOG_TYPE_DEFAULT, "%s Tried to force mic visible, but we're already showing flames. Ignoring.", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    BOOL v4 = !a3;
    [(SiriUISiriStatusView *)self _animateSiriGlyphHidden:v4];
  }
}

- (void)setupOrbIfNeeded
{
}

- (void)fadeOutCurrentAura
{
}

- (void)layoutSubviews
{
  flamesContainerView = self->_flamesContainerView;
  [(SiriUISiriStatusView *)self _flamesViewFrame];
  -[UIView setFrame:](flamesContainerView, "setFrame:");
  [(SiriUISiriStatusView *)self _layoutFlamesViewIfNeeded];
  [(SiriUISiriStatusView *)self bounds];
  double v5 = v4;
  CGFloat rect = v6;
  double v8 = v7;
  double v10 = v9;
  [(SiriUISiriStatusView *)self safeAreaInsets];
  CGFloat v12 = v5 + v11;
  CGFloat v14 = v8 - (v11 + v13);
  CGFloat v16 = v10 - v15;
  [(UIView *)self->_glyphView frame];
  UIRectCenteredXInRect();
  double x = v28.origin.x;
  CGFloat y = v28.origin.y;
  double width = v28.size.width;
  double height = v28.size.height;
  double v21 = floor((90.0 - CGRectGetHeight(v28)) * 0.5);
  v29.origin.double x = v12;
  v29.origin.CGFloat y = rect;
  v29.size.double width = v14;
  v29.size.double height = v16;
  CGFloat v22 = CGRectGetHeight(v29) - v21;
  v30.origin.double x = x;
  v30.origin.CGFloat y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  -[UIView setFrame:](self->_glyphView, "setFrame:", x, v22 - CGRectGetHeight(v30), width, height);
  v23 = [(SiriUISiriStatusView *)self layer];
  [v23 setAllowsGroupBlending:0];

  flamesView = self->_flamesView;
  [(SiriUISiriStatusView *)self _flamesFrame];
  -[SUICFlamesView setActiveFrame:](flamesView, "setActiveFrame:");
  touchInputView = self->_touchInputView;
  [(SiriUISiriStatusView *)self _flamesFrame];
  -[UIView setFrame:](touchInputView, "setFrame:");
}

- (CGRect)_flamesViewFrame
{
  [(SiriUISiriStatusView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SiriUISiriStatusView *)self flamesViewWidth];
  if (v11 > 0.0)
  {
    [(SiriUISiriStatusView *)self flamesViewWidth];
    UIRectCenteredXInRectScale();
    double v4 = v12;
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
  }
  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.CGFloat y = v17;
  result.origin.double x = v16;
  return result;
}

- (void)setMode:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  double v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    double v6 = NSNumber;
    double v7 = v5;
    double v8 = [v6 numberWithInteger:a3];
    int v13 = 136315394;
    double v14 = "-[SiriUISiriStatusView setMode:]";
    __int16 v15 = 2112;
    double v16 = v8;
    _os_log_impl(&dword_2231EF000, v7, OS_LOG_TYPE_DEFAULT, "%s setMode: %@", (uint8_t *)&v13, 0x16u);
  }
  if (self->_mode != a3)
  {
    self->_mode = a3;
    double v9 = [MEMORY[0x263F08AB0] processInfo];
    [v9 systemUptime];
    self->_lastStateChangeTime = v10;

    switch(a3)
    {
      case 1:
        [(SiriUISiriStatusView *)self _attachFlamesViewIfNeeded];
        [(SiriUISiriStatusView *)self _setFlamesViewState:1];
        [(SiriUISiriStatusView *)self _animateSiriGlyphHidden:1];
        [(SUICFlamesView *)self->_flamesView setRenderingEnabled:1 forReason:*MEMORY[0x263F1D798]];
        [(id)*MEMORY[0x263F1D020] finishedIPTest:*MEMORY[0x263F75470]];
        return;
      case 2:
        [(SiriUISiriStatusView *)self _setFlamesViewState:2];
        [(SiriUISiriStatusView *)self _animateSiriGlyphHidden:1];
        [(SUICFlamesView *)self->_flamesView setRenderingEnabled:1 forReason:*MEMORY[0x263F1D798]];
        return;
      case 3:
        [(SUICFlamesView *)self->_flamesView setState:3];
        goto LABEL_9;
      case 4:
        [(SiriUISiriStatusView *)self _setFlamesViewState:0];
        double v11 = self;
        uint64_t v12 = 1;
        goto LABEL_11;
      default:
        [(SiriUISiriStatusView *)self _setFlamesViewState:0];
LABEL_9:
        double v11 = self;
        uint64_t v12 = 0;
LABEL_11:
        [(SiriUISiriStatusView *)v11 _animateSiriGlyphHidden:v12];
        break;
    }
  }
}

- (void)setFlamesViewDeferred:(BOOL)a3
{
  self->_flamesViewDeferred = a3;
  if (!a3) {
    [(SiriUISiriStatusView *)self _attachFlamesViewIfNeeded];
  }
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[SUICFlamesView setPaused:](self->_flamesView, "setPaused:");
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  double v4 = (UILongPressGestureRecognizer *)a3;
  BOOL v9 = (self->_mode != 2
     || ([MEMORY[0x263F08AB0] processInfo],
         double v5 = objc_claimAutoreleasedReturnValue(),
         [v5 systemUptime],
         double v7 = v6,
         double v8 = self->_lastStateChangeTime + 0.7,
         v5,
         v7 > v8))
    && (self->_longPressRecognizer != v4 || self->_mode != 1);

  return v9;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIView *)self->_flamesContainerView frame];
  CGFloat v10 = x;
  CGFloat v11 = y;
  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (void)_micButtonTapped:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSNumber;
    double v7 = v5;
    double v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v4, "state"));
    int v10 = 136315394;
    CGFloat v11 = "-[SiriUISiriStatusView _micButtonTapped:]";
    __int16 v12 = 2112;
    int v13 = v8;
    _os_log_impl(&dword_2231EF000, v7, OS_LOG_TYPE_DEFAULT, "%s Mic Button Tapped State %@", (uint8_t *)&v10, 0x16u);
  }
  if ([v4 state] == 3)
  {
    BOOL v9 = [(SiriUISiriStatusView *)self delegate];
    [v9 siriStatusViewWasTapped:self];
  }
}

- (void)_micButtonHeld:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 state];
  double v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSNumber;
    double v7 = v5;
    double v8 = [v6 numberWithInteger:v4];
    int v10 = 136315394;
    CGFloat v11 = "-[SiriUISiriStatusView _micButtonHeld:]";
    __int16 v12 = 2112;
    int v13 = v8;
    _os_log_impl(&dword_2231EF000, v7, OS_LOG_TYPE_DEFAULT, "%s Mic Button Held State %@", (uint8_t *)&v10, 0x16u);
  }
  if (v4 == 1)
  {
    BOOL v9 = [(SiriUISiriStatusView *)self delegate];
    [v9 siriStatusViewHoldDidBegin:self];
  }
  else
  {
    if ((unint64_t)(v4 - 3) > 1) {
      return;
    }
    BOOL v9 = [(SiriUISiriStatusView *)self delegate];
    [v9 siriStatusViewHoldDidEnd:self];
  }
}

- (id)_flamesView
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  flamesView = self->_flamesView;
  if (!flamesView)
  {
    if (self->_flamesViewDeferred)
    {
      flamesView = 0;
    }
    else
    {
      uint64_t v4 = (os_log_t *)MEMORY[0x263F28348];
      double v5 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315138;
        double v18 = "-[SiriUISiriStatusView _flamesView]";
        _os_log_impl(&dword_2231EF000, v5, OS_LOG_TYPE_DEFAULT, "%s Beginning flamesView setup", (uint8_t *)&v17, 0xCu);
      }
      id v6 = objc_alloc(MEMORY[0x263F75428]);
      [(UIScreen *)self->_screen bounds];
      CGFloat v11 = (SUICFlamesView *)objc_msgSend(v6, "initWithFrame:screen:fidelity:", self->_screen, -[SiriUIConfiguration flamesViewFidelity](self->_configuration, "flamesViewFidelity"), v7, v8, v9, v10);
      __int16 v12 = self->_flamesView;
      self->_flamesView = v11;

      int v13 = self->_flamesView;
      [(SiriUISiriStatusView *)self _flamesFrame];
      -[SUICFlamesView setActiveFrame:](v13, "setActiveFrame:");
      if (UIAccessibilityIsReduceTransparencyEnabled()) {
        [(SUICFlamesView *)self->_flamesView setShowAura:0];
      }
      [(SUICFlamesView *)self->_flamesView setFreezesAura:SiriUIDeviceShouldFreezeAura()];
      [(SUICFlamesView *)self->_flamesView setState:self->_deferredFlamesViewState];
      touchInputView = self->_touchInputView;
      [(SiriUISiriStatusView *)self _flamesFrame];
      -[UIView setFrame:](touchInputView, "setFrame:");
      [(SUICFlamesView *)self->_flamesView setDelegate:self];
      __int16 v15 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315138;
        double v18 = "-[SiriUISiriStatusView _flamesView]";
        _os_log_impl(&dword_2231EF000, v15, OS_LOG_TYPE_DEFAULT, "%s Finished flamesView setup", (uint8_t *)&v17, 0xCu);
      }
      flamesView = self->_flamesView;
    }
  }
  return flamesView;
}

- (void)setInUITrackingMode:(BOOL)a3
{
  BOOL v3 = a3;
  kdebug_trace();
  self->_inUITrackingMode = v3;
  unint64_t mode = self->_mode;
  if (mode <= 4)
  {
    flamesView = self->_flamesView;
    if (((1 << mode) & 0x19) != 0)
    {
      uint64_t v7 = !v3;
      uint64_t v8 = *MEMORY[0x263F1D798];
    }
    else
    {
      uint64_t v8 = *MEMORY[0x263F1D798];
      uint64_t v7 = 1;
    }
    [(SUICFlamesView *)flamesView setRenderingEnabled:v7 forReason:v8];
  }
}

- (void)_setFlamesViewState:(int64_t)a3
{
  self->_deferredFlamesViewState = a3;
}

- (void)_attachFlamesViewIfNeeded
{
  BOOL v3 = [(SiriUISiriStatusView *)self _flamesView];
  if (v3)
  {
    id v5 = v3;
    uint64_t v4 = [v3 superview];

    BOOL v3 = v5;
    if (!v4)
    {
      [(UIView *)self->_flamesContainerView addSubview:v5];
      [(SiriUISiriStatusView *)self setNeedsLayout];
      BOOL v3 = v5;
    }
  }
}

- (void)_layoutFlamesViewIfNeeded
{
  BOOL v3 = [(SUICFlamesView *)self->_flamesView superview];
  flamesContainerView = self->_flamesContainerView;

  if (v3 == flamesContainerView)
  {
    flamesView = self->_flamesView;
    [(UIView *)self->_flamesContainerView bounds];
    -[SUICFlamesView setFrame:](flamesView, "setFrame:");
  }
}

- (void)_setupOrbIfNeeded:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(void))a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    CGFloat v22 = "-[SiriUISiriStatusView _setupOrbIfNeeded:]";
    _os_log_impl(&dword_2231EF000, v5, OS_LOG_TYPE_DEFAULT, "%s Beginning orb setup", buf, 0xCu);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke;
  v20[3] = &unk_26469EFA8;
  v20[4] = self;
  uint64_t v6 = MEMORY[0x223CB13F0](v20);
  uint64_t v7 = (void *)v6;
  if (self->_glyphPlayerItem)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_26;
    v19[3] = &unk_26469EFA8;
    v19[4] = self;
    uint64_t v8 = (void *)MEMORY[0x223CB13F0](v19);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_33;
    v18[3] = &unk_26469EFA8;
    v18[4] = self;
    double v9 = (void *)MEMORY[0x223CB13F0](v18);
    glyphConfigurationQueue = self->_glyphConfigurationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_35;
    block[3] = &unk_26469EFF8;
    id v14 = v8;
    id v15 = v9;
    id v16 = v7;
    int v17 = v4;
    id v11 = v9;
    id v12 = v8;
    dispatch_async(glyphConfigurationQueue, block);
  }
}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_2;
  v8[3] = &unk_26469EFA8;
  v8[4] = *(void *)(a1 + 32);
  v2 = (void (**)(void))MEMORY[0x223CB13F0](v8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_21;
  v7[3] = &unk_26469EFA8;
  v7[4] = *(void *)(a1 + 32);
  BOOL v3 = (void (**)(void))MEMORY[0x223CB13F0](v7);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_2_24;
  v6[3] = &unk_26469EFA8;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = (void (**)(void))MEMORY[0x223CB13F0](v6);
  v2[2](v2);
  v3[2](v3);
  v4[2](v4);
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v10 = "-[SiriUISiriStatusView _setupOrbIfNeeded:]_block_invoke_3";
    _os_log_impl(&dword_2231EF000, v5, OS_LOG_TYPE_DEFAULT, "%s Finished Queue Player setup", buf, 0xCu);
  }
}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 464))
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFA860]);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 464);
    *(void *)(v3 + 464) = v2;

    [*(id *)(*(void *)(a1 + 32) + 464) setPreventsDisplaySleepDuringVideoPlayback:0];
    [*(id *)(*(void *)(a1 + 32) + 464) setAllowsExternalPlayback:0];
    [*(id *)(*(void *)(a1 + 32) + 464) pause];
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(void *)(v5 + 480))
    {
      uint64_t v6 = *(void **)(v5 + 464);
      objc_msgSend(v6, "setAudioSession:");
    }
    else
    {
      uint64_t v7 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_2_cold_1(v7);
      }
    }
  }
}

uint64_t __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_21(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(void *)(v1 + 448))
  {
    uint64_t v2 = result;
    uint64_t v3 = [MEMORY[0x263EFA838] playerLayerWithPlayer:*(void *)(v1 + 464)];
    uint64_t v4 = *(void *)(v2 + 32);
    uint64_t v5 = *(void **)(v4 + 448);
    *(void *)(v4 + 448) = v3;

    uint64_t v6 = *(void **)(*(void *)(v2 + 32) + 448);
    uint64_t v7 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
    [v6 setCompositingFilter:v7];

    uint64_t v8 = *(void *)(v2 + 32);
    double v9 = *(void **)(v8 + 448);
    [*(id *)(v8 + 440) bounds];
    objc_msgSend(v9, "setFrame:");
    double v10 = [*(id *)(*(void *)(v2 + 32) + 440) layer];
    [v10 addSublayer:*(void *)(*(void *)(v2 + 32) + 448)];

    uint64_t v11 = *(void **)(v2 + 32);
    return [v11 setNeedsLayout];
  }
  return result;
}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_2_24(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (!v1[57])
  {
    uint64_t v2 = v1[59];
    if (v2)
    {
      uint64_t v4 = (void *)MEMORY[0x263EFA840];
      uint64_t v5 = v1[58];
      CMTimeMake(&start, 966, 1000);
      CMTimeMake(&v9, 33330, 1000);
      CMTimeRangeMake(&v11, &start, &v9);
      uint64_t v6 = [v4 playerLooperWithPlayer:v5 templateItem:v2 timeRange:&v11];
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(v7 + 456);
      *(void *)(v7 + 456) = v6;
    }
  }
}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_26(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 pathForResource:@"Siri Blob" ofType:@"mov"];

  uint64_t v4 = (void *)MEMORY[0x263EFA800];
  uint64_t v5 = [NSURL fileURLWithPath:v3];
  uint64_t v6 = [v4 playerItemWithURL:v5];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 472);
  *(void *)(v7 + 472) = v6;

  CMTime v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    CMTimeRange v11 = "-[SiriUISiriStatusView _setupOrbIfNeeded:]_block_invoke";
    _os_log_impl(&dword_2231EF000, v9, OS_LOG_TYPE_DEFAULT, "%s Loaded glyph player item", (uint8_t *)&v10, 0xCu);
  }
}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_33(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EF93E0] sharedInstance];
  uint64_t v3 = *MEMORY[0x263EF9048];
  id v17 = 0;
  [v2 setCategory:v3 withOptions:1 error:&v17];
  id v4 = v17;

  uint64_t v5 = (os_log_t *)MEMORY[0x263F28348];
  if (v4 && os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_33_cold_3();
  }
  if (!*(void *)(*(void *)(a1 + 32) + 480))
  {
    uint64_t v6 = [MEMORY[0x263EF93E0] auxiliarySession];
    uint64_t v7 = *MEMORY[0x263EF9060];
    uint64_t v8 = *MEMORY[0x263EF9108];
    id v16 = 0;
    [v6 setCategory:v7 mode:v8 options:1 error:&v16];
    id v9 = v16;
    if (v9)
    {
      int v10 = v9;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
        __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_33_cold_1();
      }
    }
    else
    {
      id v15 = 0;
      [v6 setRequiresNoAudioResources:1 error:&v15];
      id v11 = v15;
      if (v11)
      {
        int v10 = v11;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
          __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_33_cold_1();
        }
      }
      else
      {
        uint64_t v12 = *(void *)(a1 + 32);
        id v13 = v6;
        int v10 = *(void **)(v12 + 480);
        *(void *)(v12 + 480) = v13;
      }
    }
  }
  id v14 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = "-[SiriUISiriStatusView _setupOrbIfNeeded:]_block_invoke";
    _os_log_impl(&dword_2231EF000, v14, OS_LOG_TYPE_DEFAULT, "%s Created audio sessions", buf, 0xCu);
  }
}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_35(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_2_36;
  v2[3] = &unk_26469EFD0;
  id v3 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_2_36(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_animateSiriGlyphHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSNumber;
    uint64_t v7 = v5;
    uint64_t v8 = [v6 numberWithBool:v3];
    *(_DWORD *)buf = 136315394;
    id v13 = "-[SiriUISiriStatusView _animateSiriGlyphHidden:]";
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl(&dword_2231EF000, v7, OS_LOG_TYPE_DEFAULT, "%s animateSiriGlyphHidden: %@", buf, 0x16u);
  }
  self->_siriGlyphHidden = v3;
  if (v3)
  {
    [(UIView *)self->_glyphView alpha];
    if (v9 < 2.22044605e-16) {
      return;
    }
    if (self->_siriGlyphHidden) {
      goto LABEL_7;
    }
  }
  [(UIView *)self->_glyphView alpha];
  if (v10 <= 0.0)
  {
LABEL_7:
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __48__SiriUISiriStatusView__animateSiriGlyphHidden___block_invoke;
    v11[3] = &unk_26469EFA8;
    v11[4] = self;
    [(SiriUISiriStatusView *)self _setupOrbIfNeeded:v11];
  }
}

uint64_t __48__SiriUISiriStatusView__animateSiriGlyphHidden___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = 0.0;
  if (!*(unsigned char *)(v2 + 529)) {
    double v3 = 0.35;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SiriUISiriStatusView__animateSiriGlyphHidden___block_invoke_2;
  v7[3] = &unk_26469EFA8;
  v7[4] = v2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__SiriUISiriStatusView__animateSiriGlyphHidden___block_invoke_3;
  v6[3] = &unk_26469F020;
  v6[4] = v2;
  uint64_t result = [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v7 usingSpringWithDamping:v6 initialSpringVelocity:0.35 options:v3 animations:1.0 completion:0.0];
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v5 + 529)) {
    return [*(id *)(v5 + 440) setAlpha:1.0];
  }
  return result;
}

uint64_t __48__SiriUISiriStatusView__animateSiriGlyphHidden___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 529))
  {
    [*(id *)(v2 + 440) setAlpha:0.0];
    double v3 = *(void **)(a1 + 32);
    id v4 = (void *)v3[51];
    [v3 _flamesFrame];
    return objc_msgSend(v4, "setFrame:");
  }
  else
  {
    uint64_t v6 = *(void **)(v2 + 408);
    [(id)v2 _siriGlyphTappableRect];
    objc_msgSend(v6, "setFrame:");
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 464);
    if (IsReduceMotionEnabled)
    {
      CMTimeMake(&v12, 9800, 1000);
      [v8 seekToTime:&v12];
      [*(id *)(*(void *)(a1 + 32) + 464) pause];
      return [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:1.0];
    }
    else
    {
      long long v10 = *MEMORY[0x263F010E0];
      uint64_t v11 = *(void *)(MEMORY[0x263F010E0] + 16);
      [v8 seekToTime:&v10];
      LODWORD(v9) = 1.0;
      return [*(id *)(*(void *)(a1 + 32) + 464) playImmediatelyAtRate:v9];
    }
  }
}

void __48__SiriUISiriStatusView__animateSiriGlyphHidden___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 529))
  {
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    uint64_t v2 = *(void *)(a1 + 32);
    if (!IsReduceMotionEnabled)
    {
      uint64_t v4 = [*(id *)(v2 + 464) timeControlStatus];
      uint64_t v2 = *(void *)(a1 + 32);
      if (v4 != 2)
      {
        uint64_t v5 = *(void **)(v2 + 464);
        long long v15 = *MEMORY[0x263F010E0];
        uint64_t v16 = *(void *)(MEMORY[0x263F010E0] + 16);
        [v5 seekToTime:&v15];
        LODWORD(v6) = 1.0;
        [*(id *)(*(void *)(a1 + 32) + 464) playImmediatelyAtRate:v6];
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
  }
  [*(id *)(v2 + 440) alpha];
  if (v7 < 2.22044605e-16)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    double v9 = *(void **)(v8 + 456);
    *(void *)(v8 + 456) = 0;

    long long v10 = *(void **)(*(void *)(a1 + 32) + 464);
    long long v15 = *MEMORY[0x263F010E0];
    uint64_t v16 = *(void *)(MEMORY[0x263F010E0] + 16);
    [v10 seekToTime:&v15];
    [*(id *)(*(void *)(a1 + 32) + 464) pause];
    uint64_t v11 = *(void *)(a1 + 32);
    CMTime v12 = *(void **)(v11 + 464);
    *(void *)(v11 + 464) = 0;

    [*(id *)(*(void *)(a1 + 32) + 448) removeFromSuperlayer];
    uint64_t v13 = *(void *)(a1 + 32);
    __int16 v14 = *(void **)(v13 + 448);
    *(void *)(v13 + 448) = 0;
  }
}

- (CGRect)_flamesFrame
{
  double v3 = objc_opt_class();
  screen = self->_screen;
  [(SiriUISiriStatusView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(SiriUISiriStatusView *)self safeAreaInsets];
  objc_msgSend(v3, "activeFrameForScreen:frame:safeAreaInsets:", screen, v6, v8, v10, v12, v13, v14, v15, v16);
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (CGRect)_siriGlyphTappableRect
{
  [(UIView *)self->_glyphView bounds];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  CGRectGetHeight(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGRectGetWidth(v13);
  [(UIView *)self->_touchInputView frame];
  [(SiriUISiriStatusView *)self bounds];
  [(SiriUISiriStatusView *)self safeAreaInsets];
  UIRectCenteredXInRect();
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (double)statusViewHeight
{
  [(SiriUISiriStatusView *)self safeAreaInsets];
  return v2 + 90.0;
}

- (UIEdgeInsets)safeAreaInsets
{
  double v3 = [(SiriUISiriStatusView *)self delegate];
  [v3 safeAreaInsetsForSiriStatusView:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)_handleKeyboardDidShowNotification:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  double v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F1D440]];
  char v6 = [v5 BOOLValue];

  if (v6)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v7 = [(UIView *)self->_touchInputView gestureRecognizers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      double v11 = (os_log_t *)MEMORY[0x263F28348];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          double v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          double v14 = *v11;
          if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            double v21 = "-[SiriUISiriStatusView _handleKeyboardDidShowNotification:]";
            __int16 v22 = 2112;
            uint64_t v23 = v13;
            _os_log_impl(&dword_2231EF000, v14, OS_LOG_TYPE_DEFAULT, "%s Keyboard showing inside of our process, disabling gesture recognizer: %@", buf, 0x16u);
          }
          [v13 setEnabled:0];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v9);
    }
  }
  else
  {
    double v15 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v21 = "-[SiriUISiriStatusView _handleKeyboardDidShowNotification:]";
      _os_log_impl(&dword_2231EF000, v15, OS_LOG_TYPE_DEFAULT, "%s Keyboard showing outside of our process, ignoring notification", buf, 0xCu);
    }
  }
}

- (void)_handleKeyboardWillHideNotification:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v3 = [(UIView *)self->_touchInputView gestureRecognizers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v14;
    uint64_t v8 = (os_log_t *)MEMORY[0x263F28348];
    *(void *)&long long v5 = 136315394;
    long long v12 = v5;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        double v11 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v12;
          long long v18 = "-[SiriUISiriStatusView _handleKeyboardWillHideNotification:]";
          __int16 v19 = 2112;
          double v20 = v10;
          _os_log_impl(&dword_2231EF000, v11, OS_LOG_TYPE_DEFAULT, "%s Keyboard hiding, re-enabling gesture recognizer: %@", buf, 0x16u);
        }
        objc_msgSend(v10, "setEnabled:", 1, v12);
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v6);
  }
}

- (float)audioLevelForFlamesView:(id)a3
{
  uint64_t v4 = [(SiriUISiriStatusView *)self delegate];
  [v4 audioLevelForSiriStatusView:self];
  float v6 = v5;

  return v6;
}

- (int64_t)mode
{
  return self->_mode;
}

- (double)disabledMicOpacity
{
  return self->_disabledMicOpacity;
}

- (void)setDisabledMicOpacity:(double)a3
{
  self->_disabledMicOpacitCGFloat y = a3;
}

- (SiriUISiriStatusViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriUISiriStatusViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)flamesViewWidth
{
  return self->_flamesViewWidth;
}

- (void)setFlamesViewWidth:(double)a3
{
  self->_flamesViewWidth = a3;
}

- (BOOL)flamesViewDeferred
{
  return self->_flamesViewDeferred;
}

- (BOOL)isInUITrackingMode
{
  return self->_inUITrackingMode;
}

- (BOOL)paused
{
  return self->_paused;
}

- (SiriUISiriStatusViewAnimationDelegate)animationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);
  return (SiriUISiriStatusViewAnimationDelegate *)WeakRetained;
}

- (void)setAnimationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_animationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_glyphConfigurationQueue, 0);
  objc_storeStrong((id *)&self->_glyphAudioSession, 0);
  objc_storeStrong((id *)&self->_glyphPlayerItem, 0);
  objc_storeStrong((id *)&self->_glyphQueuePlayer, 0);
  objc_storeStrong((id *)&self->_glyphPlayerLooper, 0);
  objc_storeStrong((id *)&self->_glyphLayer, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_flamesView, 0);
  objc_storeStrong((id *)&self->_flamesContainerView, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_touchInputView, 0);
}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  double v2 = "-[SiriUISiriStatusView _setupOrbIfNeeded:]_block_invoke_2";
  _os_log_error_impl(&dword_2231EF000, log, OS_LOG_TYPE_ERROR, "%s Using default audio session for glyphQueuePlayer", (uint8_t *)&v1, 0xCu);
}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_33_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2231EF000, v0, v1, "%s Error setting playback audio session for blob view: %@", v2, v3, v4, v5, 2u);
}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_33_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2231EF000, v0, v1, "%s Error setting ambient audio session for blob view: %@", v2, v3, v4, v5, 2u);
}

@end