@interface SiriSharedUICompactResultView
- (BOOL)_isSnippetAnimatingInsertionOrRemoval;
- (BOOL)_snippetViewIsLoading;
- (BOOL)allowAutomaticContentViewsScaling;
- (BOOL)snippetNeedsSizing;
- (CGSize)_maxSizeForSnippet;
- (CGSize)intrinsicContentSize;
- (CGSize)previousContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)customAttachmentConstraints;
- (SiriSharedUIAnimationContext)animationContextForFrameAndLayoutUpdate;
- (SiriSharedUICompactResultView)initWithFrame:(CGRect)a3;
- (SiriSharedUICompactResultViewDelegate)delegate;
- (SiriSharedUIContentPlatterView)snippetView;
- (SiriSharedUIPanDismissalGestureRecognizer)dismissalGestureRecognizer;
- (SiriSharedUIStackableContentDelegate)stackContainerDelegate;
- (SiriSharedUIViewStackConstraints)stackConstraints;
- (UIButton)_overlayButton;
- (double)attachmentYOffset;
- (double)darkenIntensity;
- (double)previousSeparatorContentHeight;
- (id)_snippetInsertAnimation;
- (id)_snippetRemovalAnimation;
- (int64_t)_animatedPresentationType;
- (int64_t)attachmentType;
- (void)_overlayButtonWasTouchedUpInside:(id)a3;
- (void)contentPlatterView:(id)a3 didScrollWithContentOffset:(CGPoint)a4;
- (void)contentPlatterViewScrollDidBegin;
- (void)contentPlatterViewScrollDidEnd;
- (void)contentPlatterViewScrolledToContentOffset:(CGPoint)a3;
- (void)layoutSubviews;
- (void)relayout;
- (void)setAllowAutomaticContentViewsScaling:(BOOL)a3;
- (void)setAnimationContextForFrameAndLayoutUpdate:(id)a3;
- (void)setAttachmentType:(int64_t)a3;
- (void)setAttachmentYOffset:(double)a3;
- (void)setCustomAttachmentConstraints:(id)a3;
- (void)setDarkenIntensity:(double)a3;
- (void)setDarkenIntensity:(double)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setDismissalGestureRecognizer:(id)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setIsInAmbientInteractivity:(BOOL)a3;
- (void)setNeedsLayout;
- (void)setOverlayButton:(id)a3;
- (void)setPreviousContentSize:(CGSize)a3;
- (void)setPreviousSeparatorContentHeight:(double)a3;
- (void)setShowDimmingView:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowSnippetView:(BOOL)a3 animated:(BOOL)a4;
- (void)setSnippetNeedsSizing:(BOOL)a3;
- (void)setSnippetView:(id)a3 completion:(id)a4;
- (void)setStackConstraints:(id)a3;
- (void)setStackContainerDelegate:(id)a3;
- (void)snippetContentDidUpdate;
@end

@implementation SiriSharedUICompactResultView

- (SiriSharedUICompactResultView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SiriSharedUICompactResultView;
  v3 = -[SiriSharedUICompactResultView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F824E8] buttonWithType:0];
    overlayButton = v3->_overlayButton;
    v3->_overlayButton = (UIButton *)v4;

    v6 = [(SiriSharedUICompactResultView *)v3 _overlayButton];
    [v6 addTarget:v3 action:sel__overlayButtonWasTouchedUpInside_ forControlEvents:64];
  }
  return v3;
}

- (void)setSnippetView:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v7 = (SiriSharedUIContentPlatterView *)a3;
  id v8 = a4;
  p_snippetView = &self->_snippetView;
  snippetView = self->_snippetView;
  if (snippetView != v7)
  {
    v30 = snippetView;
    objc_storeStrong((id *)&self->_snippetView, a3);
    self->_snippetNeedsSizing = 1;
    v11 = [(SiriSharedUIContentPlatterView *)*p_snippetView layer];
    [v11 setAllowsGroupOpacity:0];

    [(SiriSharedUIContentPlatterView *)*p_snippetView setIsInAmbient:self->_isInAmbient];
    [(SiriSharedUICompactResultView *)self setShowDimmingView:0 animated:0];
    [(SiriSharedUIContentPlatterView *)*p_snippetView removeFromSuperview];
    v12 = *p_snippetView;
    uint64_t v13 = SiriSharedUILanguageSemanticContentAttribute();
    SiriSharedUIRecursiveSetSemanticContentAttribute(v12, v13);
    if (!self->_isInAmbient)
    {
      v14 = *p_snippetView;
      v15 = [(SiriSharedUICompactResultView *)self dismissalGestureRecognizer];
      [(SiriSharedUIContentPlatterView *)v14 setDismissalGestureRecognizer:v15];
    }
    v32 = v8;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v16 = [(SiriSharedUIContentPlatterView *)v7 contentViews];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v37;
      int v20 = 1;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(v16);
          }
          v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            v20 &= [v22 shouldAutomaticallyScaleContentInAmbient];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v18);
    }
    else
    {
      LOBYTE(v20) = 1;
    }

    [(SiriSharedUICompactResultView *)self setAllowAutomaticContentViewsScaling:v20 & 1];
    [(SiriSharedUIContentPlatterView *)*p_snippetView setDelegate:self];
    [(SiriSharedUICompactResultView *)self addSubview:*p_snippetView];
    [MEMORY[0x263F158F8] begin];
    v23 = (void *)MEMORY[0x263F158F8];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __59__SiriSharedUICompactResultView_setSnippetView_completion___block_invoke;
    v33[3] = &unk_2640E3820;
    id v24 = v31;
    id v34 = v24;
    id v8 = v32;
    id v35 = v32;
    [v23 setCompletionBlock:v33];
    v25 = [(SiriSharedUIContentPlatterView *)*p_snippetView layer];
    v26 = [(SiriSharedUICompactResultView *)self _snippetInsertAnimation];
    [v25 addAnimation:v26 forKey:@"snippetInsert"];

    if (self->_isInAmbient) {
      +[SiriSharedUICAFiltering applyGaussianBlurFilterToView:*p_snippetView];
    }
    v27 = [v24 layer];
    v28 = [(SiriSharedUICompactResultView *)self _snippetRemovalAnimation];
    [v27 addAnimation:v28 forKey:@"snippetInsert"];

    v29 = [v24 layer];
    [v29 setOpacity:0.0];

    [MEMORY[0x263F158F8] commit];
    [(SiriSharedUICompactResultView *)self snippetContentDidUpdate];
  }
}

uint64_t __59__SiriSharedUICompactResultView_setSnippetView_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setIsInAmbient:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isInAmbient = a3;
  -[SiriSharedUIContentPlatterView setIsInAmbient:](self->_snippetView, "setIsInAmbient:");
  BOOL v5 = !v3;
  [(SiriSharedUIContentPlatterView *)self->_snippetView setScrollEnabled:!v3];
  snippetView = self->_snippetView;
  if (v5)
  {
    id v7 = [(SiriSharedUICompactResultView *)self dismissalGestureRecognizer];
    -[SiriSharedUIContentPlatterView setDismissalGestureRecognizer:](snippetView, "setDismissalGestureRecognizer:");
  }
  else
  {
    id v7 = [(SiriSharedUIContentPlatterView *)self->_snippetView dismissalGestureRecognizer];
    -[SiriSharedUIContentPlatterView removeGestureRecognizer:](snippetView, "removeGestureRecognizer:");
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  self->_isInAmbientInteractivity = a3;
  -[SiriSharedUIContentPlatterView setIsInAmbientInteractivity:](self->_snippetView, "setIsInAmbientInteractivity:");
}

- (void)setAllowAutomaticContentViewsScaling:(BOOL)a3
{
  self->_allowAutomaticContentViewsScaling = a3;
  -[SiriSharedUIContentPlatterView setAllowAutomaticContentViewsScaling:](self->_snippetView, "setAllowAutomaticContentViewsScaling:");
}

- (void)setShowSnippetView:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(SiriSharedUIContentPlatterView *)self->_snippetView isHidden] == a3)
  {
    if (v5) {
      double v7 = 1.0;
    }
    else {
      double v7 = 0.0;
    }
    objc_initWeak(&location, self);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __61__SiriSharedUICompactResultView_setShowSnippetView_animated___block_invoke;
    v15 = &unk_2640E3BF8;
    objc_copyWeak(v16, &location);
    v16[1] = *(id *)&v7;
    BOOL v17 = v5;
    id v8 = _Block_copy(&v12);
    v9 = objc_alloc_init(SiriSharedUIAnimationContext);
    v10 = v9;
    double v11 = 0.2;
    if (!v4) {
      double v11 = 0.0;
    }
    -[SiriSharedUIAnimationContext setAnimationDuration:](v9, "setAnimationDuration:", v11, v12, v13, v14, v15);
    [(SiriSharedUIAnimationContext *)v10 setAnimationOptions:1];
    +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:v8 context:v10 completion:0];

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
}

void __61__SiriSharedUICompactResultView_setShowSnippetView_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    BOOL v3 = [WeakRetained snippetView];
    [v3 setAlpha:*(double *)(a1 + 40)];

    BOOL v4 = [v5 snippetView];
    [v4 setHidden:*(unsigned char *)(a1 + 48) == 0];

    id WeakRetained = v5;
  }
}

- (void)setShowDimmingView:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(SiriSharedUICompactResultView *)self darkenIntensity];
  if ((((v7 != 1.0) ^ v5) & 1) == 0)
  {
    double v8 = 0.0;
    if (v5) {
      double v8 = 1.0;
    }
    [(SiriSharedUICompactResultView *)self setDarkenIntensity:v4 animated:v8];
    v9 = [(SiriSharedUICompactResultView *)self _overlayButton];
    id v10 = v9;
    if (v5) {
      [(SiriSharedUICompactResultView *)self addSubview:v9];
    }
    else {
      [v9 removeFromSuperview];
    }
  }
}

- (void)setDarkenIntensity:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__SiriSharedUICompactResultView_setDarkenIntensity_animated___block_invoke;
  aBlock[3] = &unk_2640E3C20;
  objc_copyWeak(v11, &location);
  v11[1] = *(id *)&a3;
  v6 = _Block_copy(aBlock);
  double v7 = objc_alloc_init(SiriSharedUIAnimationContext);
  double v8 = v7;
  double v9 = 0.2;
  if (!v4) {
    double v9 = 0.0;
  }
  [(SiriSharedUIAnimationContext *)v7 setAnimationDuration:v9];
  [(SiriSharedUIAnimationContext *)v8 setAnimationOptions:1];
  +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:v6 context:v8 completion:0];

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __61__SiriSharedUICompactResultView_setDarkenIntensity_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setDarkenIntensity:*(double *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)snippetContentDidUpdate
{
  [(SiriSharedUICompactResultView *)self relayout];
  snippetView = self->_snippetView;
  [(SiriSharedUIContentPlatterView *)snippetView setNeedsLayout];
}

- (CGSize)intrinsicContentSize
{
  [(SiriSharedUICompactResultView *)self _maxSizeForSnippet];
  double v4 = v3;
  double v6 = v5;
  [(SiriSharedUICompactResultView *)self frame];
  if (v4 >= v7) {
    double v9 = v7;
  }
  else {
    double v9 = v4;
  }
  if (v6 >= v8) {
    double v10 = v8;
  }
  else {
    double v10 = v6;
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setNeedsLayout
{
  v4.receiver = self;
  v4.super_class = (Class)SiriSharedUICompactResultView;
  [(SiriSharedUICompactResultView *)&v4 setNeedsLayout];
  double v3 = [(SiriSharedUICompactResultView *)self snippetView];
  [v3 setNeedsLayout];
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)SiriSharedUICompactResultView;
  [(SiriSharedUICompactResultView *)&v26 layoutSubviews];
  if (self->_snippetNeedsSizing) {
    [(SiriSharedUICompactResultView *)self snippetContentDidUpdate];
  }
  [(SiriSharedUICompactResultView *)self _maxSizeForSnippet];
  double v4 = v3;
  double v6 = v5;
  [(SiriSharedUICompactResultView *)self bounds];
  double Height = CGRectGetHeight(v27);
  if (Height < v6) {
    double v6 = Height;
  }
  double v8 = [(SiriSharedUICompactResultView *)self delegate];
  [v8 contentInsetsForResultView:self];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  -[SiriSharedUIContentPlatterView setContentInsets:](self->_snippetView, "setContentInsets:", v10, v12, v14, v16);
  snippetView = self->_snippetView;
  if (snippetView)
  {
    -[SiriSharedUIContentPlatterView sizeThatFits:](snippetView, "sizeThatFits:", v4, v6);
  }
  else
  {
    double v18 = *MEMORY[0x263F001B0];
    double v19 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  if (self->_isInAmbient && self->_allowAutomaticContentViewsScaling)
  {
    if (self->_isInAmbientInteractivity) {
      int v20 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
    }
    else {
      int v20 = &SiriSharedUICompactAmbientContentScaleAmount;
    }
    double v19 = v19 * *(double *)v20;
  }
  if (v6 >= v19) {
    double v6 = v19;
  }
  if (v4 >= v18) {
    double v4 = v18;
  }
  v21 = [(SiriSharedUICompactResultView *)self animationContextForFrameAndLayoutUpdate];

  if (v21)
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __47__SiriSharedUICompactResultView_layoutSubviews__block_invoke;
    v25[3] = &unk_2640E3C48;
    v25[4] = self;
    *(double *)&v25[5] = v4;
    *(double *)&v25[6] = v6;
    v22 = [(SiriSharedUICompactResultView *)self animationContextForFrameAndLayoutUpdate];
    +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:v25 context:v22 completion:0];
  }
  else
  {
    -[SiriSharedUIContentPlatterView setFrame:](self->_snippetView, "setFrame:", 0.0, 0.0, v4, v6);
  }
  v23 = [(SiriSharedUICompactResultView *)self _overlayButton];
  [(SiriSharedUICompactResultView *)self bounds];
  objc_msgSend(v23, "setFrame:");

  id v24 = [(SiriSharedUICompactResultView *)self stackContainerDelegate];
  [v24 stackableContentDidLayout:self];
}

uint64_t __47__SiriSharedUICompactResultView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 448), "setFrame:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)relayout
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (self->_snippetView)
  {
    [(SiriSharedUICompactResultView *)self _maxSizeForSnippet];
    if (v3 != 0.0)
    {
      double v5 = v3;
      double v6 = v4;
      snippetView = self->_snippetView;
      if (snippetView) {
        -[SiriSharedUIContentPlatterView sizeThatFits:](snippetView, "sizeThatFits:", v3, v4);
      }
      else {
        double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
      }
      if (self->_isInAmbient && self->_allowAutomaticContentViewsScaling)
      {
        if (self->_isInAmbientInteractivity) {
          double v10 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
        }
        else {
          double v10 = &SiriSharedUICompactAmbientContentScaleAmount;
        }
        double v8 = v8 * *(double *)v10;
      }
      if (v6 >= v8) {
        double v6 = v8;
      }
      p_previousContentSize = &self->_previousContentSize;
      CGFloat v12 = self->_previousContentSize.height - self->_previousSeparatorContentHeight;
      [(SiriSharedUIContentPlatterView *)self->_snippetView heightForContentSeparators];
      if (v12 <= 0.0 && v6 - v13 > 0.0)
      {
        double v14 = [(SiriSharedUICompactResultView *)self snippetView];
        double v15 = [v14 layer];
        double v16 = [(SiriSharedUICompactResultView *)self _snippetInsertAnimation];
        [v15 addAnimation:v16 forKey:@"snippetInsert"];
      }
      if (v5 == p_previousContentSize->width && v6 == self->_previousContentSize.height) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = [(SiriSharedUICompactResultView *)self _isSnippetAnimatingInsertionOrRemoval] ^ 1;
      }
      p_previousContentSize->width = v5;
      self->_previousContentSize.height = v6;
      [(SiriSharedUIContentPlatterView *)self->_snippetView heightForContentSeparators];
      self->_previousSeparatorContentdouble Height = v19;
      [(SiriSharedUIContentPlatterView *)self->_snippetView heightForContentSeparators];
      if (v6 == v20) {
        double v6 = 0.0;
      }
      self->_snippetNeedsSizing = 0;
      v21 = [(SiriSharedUICompactResultView *)self stackContainerDelegate];
      objc_msgSend(v21, "stackableContentWillUpdateLayout:withUpdatedContentSize:animated:", self, v18, v5, v6);

      [(SiriSharedUICompactResultView *)self invalidateIntrinsicContentSize];
      v22 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        v32.width = v5;
        v32.height = v6;
        id v24 = NSStringFromCGSize(v32);
        int v26 = 136315394;
        CGRect v27 = "-[SiriSharedUICompactResultView relayout]";
        __int16 v28 = 2112;
        v29 = v24;
        _os_log_impl(&dword_20C9D5000, v23, OS_LOG_TYPE_DEFAULT, "%s #compact relayout with contentSize: %@ ", (uint8_t *)&v26, 0x16u);
      }
      if (v6 > 0.0
        || v6 == 0.0 && ![(SiriSharedUICompactResultView *)self _snippetViewIsLoading])
      {
        v25 = [(SiriSharedUICompactResultView *)self delegate];
        [v25 resultViewContentDidLoad:self];
      }
    }
  }
  else
  {
    [(SiriSharedUICompactResultView *)self frame];
    if (CGRectGetHeight(v33) != 0.0)
    {
      double v9 = [(SiriSharedUICompactResultView *)self stackContainerDelegate];
      objc_msgSend(v9, "stackableContentWillUpdateLayout:withUpdatedContentSize:animated:", self, 0, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));

      [(SiriSharedUICompactResultView *)self invalidateIntrinsicContentSize];
    }
  }
}

- (BOOL)_snippetViewIsLoading
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(SiriSharedUIContentPlatterView *)self->_snippetView contentViews];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        double v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "isLoading", (void)v8))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (CGSize)_maxSizeForSnippet
{
  uint64_t v3 = [(SiriSharedUICompactResultView *)self delegate];
  [v3 maximumHeightForResultView:self];
  double v5 = v4;

  double v6 = 2.0;
  if (!self->_isInAmbient) {
    double v6 = 1.0;
  }
  double v7 = 556.0 * v6;
  long long v8 = (double *)&SiriSharedUICompactPlatterAmbientHorizontalPadding;
  if (!self->_isInAmbient) {
    long long v8 = (double *)&SiriSharedUICompactPlatterHorizontalPadding;
  }
  double v9 = *v8;
  long long v10 = [(SiriSharedUICompactResultView *)self stackContainerDelegate];
  [v10 stackableContentMaximumContainerWidth];
  double v12 = v11 + v9 * -2.0;

  if (v7 >= v12) {
    double v13 = v12;
  }
  else {
    double v13 = v7;
  }
  double v14 = v5;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SiriSharedUICompactResultView *)self _maxSizeForSnippet];
  double v7 = v6;
  double v9 = v8;
  snippetView = self->_snippetView;
  if (snippetView) {
    -[SiriSharedUIContentPlatterView sizeThatFits:](snippetView, "sizeThatFits:", width, height);
  }
  else {
    double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  if (self->_isInAmbient && self->_allowAutomaticContentViewsScaling)
  {
    if (self->_isInAmbientInteractivity) {
      double v12 = &SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
    }
    else {
      double v12 = &SiriSharedUICompactAmbientContentScaleAmount;
    }
    double v11 = v11 * *(double *)v12;
  }
  if (v9 < v11) {
    double v11 = v9;
  }
  double v13 = v7;
  result.double height = v11;
  result.double width = v13;
  return result;
}

- (void)_overlayButtonWasTouchedUpInside:(id)a3
{
  id v4 = [(SiriSharedUICompactResultView *)self delegate];
  [v4 resultViewDarkenedContentWasTapped:self];
}

- (void)contentPlatterView:(id)a3 didScrollWithContentOffset:(CGPoint)a4
{
  if (a4.y > 0.0)
  {
    id v6 = [(SiriSharedUICompactResultView *)self delegate];
    [v6 resultViewContentDidScroll:self];
  }
}

- (void)contentPlatterViewScrolledToContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(SiriSharedUICompactResultView *)self delegate];
  objc_msgSend(v6, "resultViewContentScrolled:toContentOffset:", self, x, y);
}

- (void)contentPlatterViewScrollDidBegin
{
  id v3 = [(SiriSharedUICompactResultView *)self delegate];
  [v3 resultViewContentScrolling:self didBegin:1];
}

- (void)contentPlatterViewScrollDidEnd
{
  id v3 = [(SiriSharedUICompactResultView *)self delegate];
  [v3 resultViewContentScrolling:self didBegin:0];
}

- (BOOL)_isSnippetAnimatingInsertionOrRemoval
{
  id v3 = [(SiriSharedUIContentPlatterView *)self->_snippetView layer];
  uint64_t v4 = [v3 animationForKey:@"snippetInsert"];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(SiriSharedUIContentPlatterView *)self->_snippetView layer];
    double v7 = [v6 animationForKey:@"snippetRemoval"];
    BOOL v5 = v7 != 0;
  }
  return v5;
}

- (id)_snippetInsertAnimation
{
  id v3 = NSNumber;
  [(SiriSharedUICompactResultView *)self frame];
  BOOL v5 = [v3 numberWithDouble:v4];
  id v6 = +[SiriSharedUIAnimationUtilities animationForStyle:0 expectedWidthForStyle:v5 presentationType:[(SiriSharedUICompactResultView *)self _animatedPresentationType]];

  return v6;
}

- (id)_snippetRemovalAnimation
{
  int64_t v2 = [(SiriSharedUICompactResultView *)self _animatedPresentationType];
  return +[SiriSharedUIAnimationUtilities animationForStyle:1 expectedWidthForStyle:0 presentationType:v2];
}

- (int64_t)_animatedPresentationType
{
  return self->_isInAmbient;
}

- (void)setDarkenIntensity:(double)a3
{
  if (self->_darkenIntensity != a3)
  {
    self->_darkenIntensitdouble y = a3;
    snippetView = self->_snippetView;
    [(SiriSharedUICompactResultView *)self darkenIntensity];
    -[SiriSharedUIContentPlatterView setDarkenIntensity:](snippetView, "setDarkenIntensity:");
  }
}

- (int64_t)attachmentType
{
  return self->attachmentType;
}

- (void)setAttachmentType:(int64_t)a3
{
  self->attachmentType = a3;
}

- (double)attachmentYOffset
{
  return self->attachmentYOffset;
}

- (void)setAttachmentYOffset:(double)a3
{
  self->attachmentYOffset = a3;
}

- (SiriSharedUICompactResultViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (SiriSharedUICompactResultViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SiriSharedUIPanDismissalGestureRecognizer)dismissalGestureRecognizer
{
  return self->dismissalGestureRecognizer;
}

- (void)setDismissalGestureRecognizer:(id)a3
{
}

- (SiriSharedUIContentPlatterView)snippetView
{
  return self->_snippetView;
}

- (SiriSharedUIStackableContentDelegate)stackContainerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->stackContainerDelegate);
  return (SiriSharedUIStackableContentDelegate *)WeakRetained;
}

- (void)setStackContainerDelegate:(id)a3
{
}

- (SiriSharedUIViewStackConstraints)stackConstraints
{
  return self->stackConstraints;
}

- (void)setStackConstraints:(id)a3
{
}

- (NSArray)customAttachmentConstraints
{
  return self->customAttachmentConstraints;
}

- (void)setCustomAttachmentConstraints:(id)a3
{
}

- (SiriSharedUIAnimationContext)animationContextForFrameAndLayoutUpdate
{
  return self->animationContextForFrameAndLayoutUpdate;
}

- (void)setAnimationContextForFrameAndLayoutUpdate:(id)a3
{
}

- (double)darkenIntensity
{
  return self->_darkenIntensity;
}

- (BOOL)snippetNeedsSizing
{
  return self->_snippetNeedsSizing;
}

- (void)setSnippetNeedsSizing:(BOOL)a3
{
  self->_snippetNeedsSizing = a3;
}

- (UIButton)_overlayButton
{
  return self->_overlayButton;
}

- (void)setOverlayButton:(id)a3
{
}

- (CGSize)previousContentSize
{
  double width = self->_previousContentSize.width;
  double height = self->_previousContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviousContentSize:(CGSize)a3
{
  self->_previousContentSize = a3;
}

- (double)previousSeparatorContentHeight
{
  return self->_previousSeparatorContentHeight;
}

- (void)setPreviousSeparatorContentHeight:(double)a3
{
  self->_previousSeparatorContentdouble Height = a3;
}

- (BOOL)allowAutomaticContentViewsScaling
{
  return self->_allowAutomaticContentViewsScaling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayButton, 0);
  objc_storeStrong((id *)&self->animationContextForFrameAndLayoutUpdate, 0);
  objc_storeStrong((id *)&self->customAttachmentConstraints, 0);
  objc_storeStrong((id *)&self->stackConstraints, 0);
  objc_destroyWeak((id *)&self->stackContainerDelegate);
  objc_storeStrong((id *)&self->_snippetView, 0);
  objc_storeStrong((id *)&self->dismissalGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end