@interface NUTitleView
- (CGRect)lastLayoutBounds;
- (NUAnimationQueue)animationQueue;
- (NUCrossFadeTitleView)incomingTitleView;
- (NUCrossFadeTitleView)titleView;
- (NUFadeViewAnimator)fadeAnimator;
- (NUSlideViewAnimator)slideAnimator;
- (NUTitleView)initWithCoder:(id)a3;
- (NUTitleView)initWithFrame:(CGRect)a3;
- (NUTitleView)initWithStyler:(id)a3;
- (NUTitleViewDelegate)delegate;
- (NUTitleViewStyler)styler;
- (OS_dispatch_semaphore)lingerSemaphore;
- (id)createMaskingLayerForTranslation;
- (void)applyTitleViewUpdate:(id)a3 animation:(unint64_t)a4;
- (void)finishDisplayingTitleViewUpdate:(id)a3 finished:(id)a4;
- (void)layoutSubviews;
- (void)relayoutWithAnimation:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIncomingTitleView:(id)a3;
- (void)setLastLayoutBounds:(CGRect)a3;
- (void)setLingerSemaphore:(id)a3;
- (void)setStyler:(id)a3;
- (void)setTitleView:(id)a3;
- (void)titleViewHandleTapGesture;
@end

@implementation NUTitleView

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)NUTitleView;
  [(NUTitleView *)&v30 layoutSubviews];
  v3 = [(NUTitleView *)self slideAnimator];
  if ([v3 isAnimating]) {
    goto LABEL_5;
  }
  [(NUTitleView *)self lastLayoutBounds];
  double v5 = v4;
  double v7 = v6;
  [(NUTitleView *)self bounds];
  double v9 = v8;
  double v11 = v10;

  if (v5 != v9 || v7 != v11)
  {
    [(NUTitleView *)self bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    v20 = [(NUTitleView *)self titleView];
    objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

    [(NUTitleView *)self bounds];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    v29 = [(NUTitleView *)self incomingTitleView];
    objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

    v3 = [(NUTitleView *)self titleView];
    [v3 relayoutWithAnimation:0];
LABEL_5:
  }
  [(NUTitleView *)self bounds];
  [(NUTitleView *)self setLastLayoutBounds:"setLastLayoutBounds:"];
}

- (NUCrossFadeTitleView)titleView
{
  return self->_titleView;
}

- (NUSlideViewAnimator)slideAnimator
{
  return self->_slideAnimator;
}

- (void)setLastLayoutBounds:(CGRect)a3
{
  self->_lastLayoutBounds = a3;
}

- (CGRect)lastLayoutBounds
{
  double x = self->_lastLayoutBounds.origin.x;
  double y = self->_lastLayoutBounds.origin.y;
  double width = self->_lastLayoutBounds.size.width;
  double height = self->_lastLayoutBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setStyler:(id)a3
{
  objc_storeStrong((id *)&self->_styler, a3);
  id v5 = a3;
  double v6 = [(NUTitleView *)self titleView];
  [v6 setStyler:v5];

  id v7 = [(NUTitleView *)self incomingTitleView];
  [v7 setStyler:v5];
}

- (NUCrossFadeTitleView)incomingTitleView
{
  return self->_incomingTitleView;
}

- (void)setDelegate:(id)a3
{
}

- (NUTitleView)initWithStyler:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NUTitleView;
  double v6 = (CGPoint *)MEMORY[0x263F001A8];
  id v7 = -[NUTitleView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  double v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_styler, a3);
    double v9 = objc_alloc_init(NUAnimationQueue);
    animationQueue = v8->_animationQueue;
    v8->_animationQueue = v9;

    double v11 = [NUSlideViewAnimator alloc];
    [(NUTitleView *)v8 bounds];
    uint64_t v12 = -[NUSlideViewAnimator initWithBounds:](v11, "initWithBounds:");
    slideAnimator = v8->_slideAnimator;
    v8->_slideAnimator = (NUSlideViewAnimator *)v12;

    double v14 = NUTranslationAnimationTimingFunction();
    [(NUSlideViewAnimator *)v8->_slideAnimator setMediaTimingFunction:v14];

    double v15 = objc_alloc_init(NUFadeViewAnimator);
    fadeAnimator = v8->_fadeAnimator;
    v8->_fadeAnimator = v15;

    CGSize v17 = (CGSize)v6[1];
    v8->_lastLayoutBounds.origin = *v6;
    v8->_lastLayoutBounds.size = v17;
    double v18 = [[NUCrossFadeTitleView alloc] initWithStyler:v5];
    titleView = v8->_titleView;
    v8->_titleView = v18;

    [(NUCrossFadeTitleView *)v8->_titleView setAutoresizingMask:2];
    [(NUCrossFadeTitleView *)v8->_titleView setClipsToBounds:1];
    [(NUTitleView *)v8 addSubview:v8->_titleView];
    v20 = [[NUCrossFadeTitleView alloc] initWithStyler:v5];
    incomingTitleView = v8->_incomingTitleView;
    v8->_incomingTitleView = v20;

    [(NUCrossFadeTitleView *)v8->_incomingTitleView setAutoresizingMask:2];
    [(NUCrossFadeTitleView *)v8->_incomingTitleView setClipsToBounds:1];
    [(NUTitleView *)v8 insertSubview:v8->_incomingTitleView belowSubview:v8->_titleView];
    double v22 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v8 action:sel_titleViewHandleTapGesture];
    [(NUTitleView *)v8 addGestureRecognizer:v22];
    [(UIView *)v8 nu_supportViewDebugging];
  }
  return v8;
}

void __46__NUTitleView_applyTitleViewUpdate_animation___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained finishDisplayingTitleViewUpdate:*(void *)(a1 + 32) finished:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)finishDisplayingTitleViewUpdate:(id)a3 finished:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  double v8 = _UIAccessibilityFocusedElements();
  if ([v8 containsObject:self])
  {
LABEL_5:

    goto LABEL_6;
  }
  int v9 = [v6 shouldSpeakAccessibilityTitleWhenDisplayed];

  if (v9)
  {
    double v8 = [v6 accessibilityTitle];
    if (v8) {
      UIAccessibilitySpeakOrQueueIfNeeded();
    }
    goto LABEL_5;
  }
LABEL_6:
  [v6 lingerTimeInterval];
  if (v10 == 0.0
    || ([(NUTitleView *)self lingerSemaphore],
        double v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    v7[2](v7);
  }
  else
  {
    uint64_t v12 = dispatch_get_global_queue(-32768, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__NUTitleView_finishDisplayingTitleViewUpdate_finished___block_invoke;
    block[3] = &unk_2645FE180;
    block[4] = self;
    id v14 = v6;
    double v15 = v7;
    dispatch_async(v12, block);
  }
}

- (void)applyTitleViewUpdate:(id)a3 animation:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    if ([MEMORY[0x263F1CB60] areAnimationsEnabled]) {
      unint64_t v7 = a4;
    }
    else {
      unint64_t v7 = 3;
    }
    if ([v6 shouldCancelPendingUpdates])
    {
      double v8 = [(NUTitleView *)self animationQueue];
      [v8 cancel];

      int v9 = [(NUTitleView *)self lingerSemaphore];

      if (v9)
      {
        double v10 = [(NUTitleView *)self lingerSemaphore];
        dispatch_semaphore_signal(v10);

        [(NUTitleView *)self setLingerSemaphore:0];
      }
    }
    objc_initWeak(&location, self);
    double v11 = [(NUTitleView *)self animationQueue];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    CGSize v17 = __46__NUTitleView_applyTitleViewUpdate_animation___block_invoke_2;
    double v18 = &unk_2645FED40;
    objc_copyWeak(v20, &location);
    v20[1] = (id)v7;
    id v12 = v6;
    id v19 = v12;
    [v11 addAnimation:&v15];

    double v13 = objc_msgSend(v12, "accessibilityTitle", v15, v16, v17, v18);
    [(NUTitleView *)self setAccessibilityLabel:v13];

    id v14 = [(NUTitleView *)self accessibilityLabel];
    [(NUTitleView *)self setIsAccessibilityElement:v14 != 0];

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
}

- (NUAnimationQueue)animationQueue
{
  return self->_animationQueue;
}

void __46__NUTitleView_applyTitleViewUpdate_animation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [MEMORY[0x263F08B88] isMainThread];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    [v6 setLingerSemaphore:v7];

    uint64_t v8 = *(void *)(a1 + 48);
    switch(v8)
    {
      case 0:
      case 3:
        BOOL v9 = v8 == 0;
        double v10 = [v6 titleView];
        uint64_t v11 = *(void *)(a1 + 32);
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __46__NUTitleView_applyTitleViewUpdate_animation___block_invoke_4;
        v39[3] = &unk_2645FE338;
        id v12 = v42;
        objc_copyWeak(v42, (id *)(a1 + 40));
        id v40 = *(id *)(a1 + 32);
        id v41 = v3;
        [v10 updateTitleViewWithUpdate:v11 animated:v9 completion:v39];
        double v13 = &v40;
        id v14 = &v41;
        goto LABEL_7;
      case 1:
        uint64_t v15 = [v6 incomingTitleView];
        [v15 updateTitleViewWithUpdate:*(void *)(a1 + 32) animated:0 completion:0];

        uint64_t v16 = [v6 createMaskingLayerForTranslation];
        CGSize v17 = [v6 layer];
        [v17 setMask:v16];

        double v18 = [v6 incomingTitleView];
        [v18 setAlpha:1.0];

        id v19 = [v6 layer];
        v20 = [v19 mask];
        [v20 bounds];
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        v29 = [v6 slideAnimator];
        objc_msgSend(v29, "setBounds:", v22, v24, v26, v28);

        double v10 = [v6 slideAnimator];
        objc_super v30 = [v6 titleView];
        v31 = [v6 incomingTitleView];
        v32 = v35;
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __46__NUTitleView_applyTitleViewUpdate_animation___block_invoke_8;
        v35[3] = &unk_2645FE338;
        id v12 = &v36;
        objc_copyWeak(&v36, (id *)(a1 + 40));
        v35[4] = *(id *)(a1 + 32);
        v35[5] = v3;
        [v10 translateFromView:v30 toView:v31 direction:0 completion:v35];
        goto LABEL_6;
      case 2:
        v33 = [v6 incomingTitleView];
        [v33 updateTitleViewWithUpdate:*(void *)(a1 + 32) animated:0 completion:0];

        v34 = [v6 incomingTitleView];
        [v34 setAlpha:0.0];

        double v10 = [v6 fadeAnimator];
        objc_super v30 = [v6 titleView];
        v31 = [v6 incomingTitleView];
        v32 = v37;
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __46__NUTitleView_applyTitleViewUpdate_animation___block_invoke_6;
        v37[3] = &unk_2645FE338;
        id v12 = &v38;
        objc_copyWeak(&v38, (id *)(a1 + 40));
        v37[4] = *(id *)(a1 + 32);
        v37[5] = v3;
        [v10 fadeFromView:v30 toView:v31 completion:v37];
LABEL_6:
        double v13 = (id *)(v32 + 4);
        id v14 = (id *)(v32 + 5);

LABEL_7:
        objc_destroyWeak(v12);
        break;
      default:
        break;
    }
  }
}

- (void)setLingerSemaphore:(id)a3
{
}

- (NUTitleView)initWithFrame:(CGRect)a3
{
  return -[NUTitleView initWithStyler:](self, "initWithStyler:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NUTitleView)initWithCoder:(id)a3
{
  return [(NUTitleView *)self initWithStyler:0];
}

void __46__NUTitleView_applyTitleViewUpdate_animation___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v3 = WeakRetained;
    double v4 = [v3 titleView];
    [v3 sendSubviewToBack:v4];
    id v5 = [v3 incomingTitleView];
    [v3 setTitleView:v5];

    [v3 setIncomingTitleView:v4];
    id v6 = [v3 incomingTitleView];
    [v6 setAlpha:0.0];

    dispatch_semaphore_t v7 = [v3 layer];
    [v7 setMask:0];

    [v3 finishDisplayingTitleViewUpdate:*(void *)(a1 + 32) finished:*(void *)(a1 + 40)];
    id WeakRetained = v8;
  }
}

void __46__NUTitleView_applyTitleViewUpdate_animation___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v3 = WeakRetained;
    double v4 = [v3 titleView];
    [v3 sendSubviewToBack:v4];
    id v5 = [v3 incomingTitleView];
    [v3 setTitleView:v5];

    [v3 setIncomingTitleView:v4];
    id v6 = [v3 incomingTitleView];
    [v6 setAlpha:0.0];

    dispatch_semaphore_t v7 = [v3 layer];
    [v7 setMask:0];

    [v3 finishDisplayingTitleViewUpdate:*(void *)(a1 + 32) finished:*(void *)(a1 + 40)];
    id WeakRetained = v8;
  }
}

- (void)relayoutWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NUTitleView *)self titleView];
  [v4 relayoutWithAnimation:v3];
}

- (void)titleViewHandleTapGesture
{
  BOOL v3 = [(NUTitleView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(NUTitleView *)self delegate];
    [v5 titleViewDidTapOnTitleView:self];
  }
}

void __56__NUTitleView_finishDisplayingTitleViewUpdate_finished___block_invoke(id *a1)
{
  v2 = [a1[4] lingerSemaphore];
  [a1[5] lingerTimeInterval];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  dispatch_semaphore_wait(v2, v4);

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__NUTitleView_finishDisplayingTitleViewUpdate_finished___block_invoke_2;
  block[3] = &unk_2645FE158;
  id v6 = a1[6];
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__NUTitleView_finishDisplayingTitleViewUpdate_finished___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)createMaskingLayerForTranslation
{
  v24[4] = *MEMORY[0x263EF8340];
  double v3 = [MEMORY[0x263F157D0] layer];
  dispatch_time_t v4 = [(NUTitleView *)self titleView];
  [v4 visibleFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v13 = [(NUTitleView *)self incomingTitleView];
  [v13 visibleFrame];
  v28.origin.double x = v14;
  v28.origin.double y = v15;
  v28.size.double width = v16;
  v28.size.double height = v17;
  v26.origin.double x = v6;
  v26.origin.double y = v8;
  v26.size.double width = v10;
  v26.size.double height = v12;
  CGRect v27 = CGRectUnion(v26, v28);
  objc_msgSend(v3, "setFrame:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);

  [(NUTitleView *)self center];
  objc_msgSend(v3, "setPosition:");
  id v18 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.0];
  v24[0] = [v18 CGColor];
  id v19 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:1.0];
  v24[1] = [v19 CGColor];
  id v20 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:1.0];
  v24[2] = [v20 CGColor];
  id v21 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.0];
  v24[3] = [v21 CGColor];
  double v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];
  [v3 setColors:v22];

  [v3 setLocations:&unk_26D4A8D38];

  return v3;
}

- (NUTitleViewStyler)styler
{
  return self->_styler;
}

- (NUTitleViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NUTitleViewDelegate *)WeakRetained;
}

- (void)setTitleView:(id)a3
{
}

- (void)setIncomingTitleView:(id)a3
{
}

- (NUFadeViewAnimator)fadeAnimator
{
  return self->_fadeAnimator;
}

- (OS_dispatch_semaphore)lingerSemaphore
{
  return self->_lingerSemaphore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lingerSemaphore, 0);
  objc_storeStrong((id *)&self->_animationQueue, 0);
  objc_storeStrong((id *)&self->_fadeAnimator, 0);
  objc_storeStrong((id *)&self->_slideAnimator, 0);
  objc_storeStrong((id *)&self->_incomingTitleView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_styler, 0);
}

@end