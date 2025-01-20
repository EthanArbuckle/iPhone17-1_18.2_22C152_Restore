@interface SiriSharedUICompactAdditionalContentView
- (BOOL)isInAmbient;
- (BOOL)layerHasOpacity;
- (CGSize)_fittingSize;
- (CGSize)_sizeThatFits:(CGSize)a3 forSnippet:(id)a4;
- (CGSize)_sizeThatFitsAllSnippets:(CGSize)a3;
- (CGSize)portraitContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)snippetViews;
- (SiriSharedUIAnimationContext)animationContextForFrameAndLayoutUpdate;
- (SiriSharedUICompactAdditionalContentView)initWithFrame:(CGRect)a3 platterCategory:(int64_t)a4;
- (SiriSharedUICompactAdditionalContentViewDelegate)delegate;
- (SiriSharedUIStackableContentDelegate)stackContainerDelegate;
- (SiriSharedUIViewStackConstraints)stackConstraints;
- (UIView)snippetContainerView;
- (double)attachmentYOffset;
- (id)_conversationAppearAnimation;
- (id)_conversationDisappearAnimation;
- (id)prepareForUpdatesPendingCompletionBlocks;
- (int64_t)_animatedPresentationType;
- (int64_t)attachmentType;
- (void)_adjustCornerRadiusForSnippetView:(id)a3;
- (void)_setupSubviews;
- (void)animateAppearanceIfNeeded;
- (void)animateFadeOutWithCompletion:(id)a3;
- (void)didCompleteAnimatedFadeOut;
- (void)layoutSubviews;
- (void)prepareForUpdatesToSnippetViews:(BOOL)a3;
- (void)relayout;
- (void)setAnimationContextForFrameAndLayoutUpdate:(id)a3;
- (void)setAttachmentType:(int64_t)a3;
- (void)setAttachmentYOffset:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setSnippetContainerView:(id)a3;
- (void)setSnippetViews:(id)a3;
- (void)setStackConstraints:(id)a3;
- (void)setStackContainerDelegate:(id)a3;
- (void)snippetContentDidUpdate;
- (void)updateContentSizeWithAnimation:(BOOL)a3;
@end

@implementation SiriSharedUICompactAdditionalContentView

- (SiriSharedUICompactAdditionalContentView)initWithFrame:(CGRect)a3 platterCategory:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SiriSharedUICompactAdditionalContentView;
  v5 = -[SiriSharedUICompactAdditionalContentView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5)
  {
    [(SiriSharedUICompactAdditionalContentView *)v5 _setupSubviews];
    v7 = [(SiriSharedUICompactAdditionalContentView *)v6 layer];
    [v7 setOpacity:0.0];
  }
  v6->_platterCategory = a4;
  return v6;
}

- (void)_setupSubviews
{
  v3 = [MEMORY[0x263F5E700] platterViewWithBlurEffectStyle:8];
  platterView = self->_platterView;
  self->_platterView = v3;

  [(PLPlatterView *)self->_platterView _setContinuousCornerRadius:23.5];
  [(SiriSharedUICompactAdditionalContentView *)self addSubview:self->_platterView];
  v5 = objc_alloc_init(SiriSharedUIStandardView);
  containerView = self->_containerView;
  self->_containerView = &v5->super;

  [(UIView *)self->_containerView setClipsToBounds:1];
  v7 = self->_containerView;
  v8 = [MEMORY[0x263F825C8] clearColor];
  [(UIView *)v7 setBackgroundColor:v8];

  objc_super v9 = [(PLPlatterView *)self->_platterView customContentView];
  [v9 addSubview:self->_containerView];

  v10 = objc_alloc_init(SiriSharedUIStandardView);
  snippetContainerView = self->_snippetContainerView;
  self->_snippetContainerView = &v10->super;

  [(UIView *)self->_containerView addSubview:self->_snippetContainerView];
  uint64_t v12 = SiriSharedUILanguageSemanticContentAttribute();
  SiriSharedUIRecursiveSetSemanticContentAttribute(self, v12);
}

- (void)layoutSubviews
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v42.receiver = self;
  v42.super_class = (Class)SiriSharedUICompactAdditionalContentView;
  [(SiriSharedUICompactAdditionalContentView *)&v42 layoutSubviews];
  [(SiriSharedUICompactAdditionalContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SiriSharedUICompactAdditionalContentView *)self animationContextForFrameAndLayoutUpdate];

  if (v11)
  {
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __58__SiriSharedUICompactAdditionalContentView_layoutSubviews__block_invoke;
    v41[3] = &unk_2640E38C0;
    v41[4] = self;
    *(double *)&v41[5] = v4;
    *(double *)&v41[6] = v6;
    *(double *)&v41[7] = v8;
    *(double *)&v41[8] = v10;
    uint64_t v12 = [(SiriSharedUICompactAdditionalContentView *)self animationContextForFrameAndLayoutUpdate];
    +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:v41 context:v12 completion:0];
  }
  else
  {
    -[PLPlatterView setFrame:](self->_platterView, "setFrame:", v4, v6, v8, v10);
  }
  v45.origin.x = v4;
  v45.origin.y = v6;
  v45.size.width = v8;
  v45.size.height = v10;
  [(PLPlatterView *)self->_platterView setHasShadow:CGRectGetHeight(v45) > 0.0];
  -[UIView setFrame:](self->_containerView, "setFrame:", v4, v6, v8, v10);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v13 = self->_snippetViews;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    CGFloat rect = v10;
    CGFloat v32 = v4;
    BOOL v16 = 0;
    double v18 = *MEMORY[0x263F001B0];
    double v17 = *(double *)(MEMORY[0x263F001B0] + 8);
    double v35 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v36 = *MEMORY[0x263F001A8];
    double v33 = *(double *)(MEMORY[0x263F001A8] + 24);
    double v34 = *(double *)(MEMORY[0x263F001A8] + 16);
    uint64_t v19 = *(void *)v38;
    double v20 = 0.0;
    double v21 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v13);
        }
        v23 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        -[SiriSharedUICompactAdditionalContentView _sizeThatFits:forSnippet:](self, "_sizeThatFits:forSnippet:", v23, v8, 1.79769313e308);
        if (v24 == v18 && v25 == v17)
        {
          objc_msgSend(v23, "setFrame:", v36, v35, v34, v33);
        }
        else
        {
          double v27 = v24;
          objc_msgSend(v23, "setFrame:", 0.0, v21, v24, v25);
          [v23 frame];
          double v21 = CGRectGetMaxY(v46) + 0.0;
          [v23 frame];
          double MaxY = CGRectGetMaxY(v47);
          if (v20 < v27) {
            double v20 = v27;
          }
          if (v16)
          {
            BOOL v16 = 1;
          }
          else
          {
            double v29 = floor(MaxY + 0.0);
            v48.origin.y = v6;
            v48.origin.x = v32;
            v48.size.width = v8;
            v48.size.height = rect;
            double MaxY = floor(CGRectGetHeight(v48));
            BOOL v16 = v29 > MaxY;
          }
        }
      }
      uint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v37, v43, 16, MaxY);
    }
    while (v15);
  }
  else
  {
    double v20 = 0.0;
    double v21 = 0.0;
  }

  -[UIView setFrame:](self->_snippetContainerView, "setFrame:", 0.0, 0.0, v20, v21);
  v30 = [(SiriSharedUICompactAdditionalContentView *)self stackContainerDelegate];
  [v30 stackableContentDidLayout:self];
}

uint64_t __58__SiriSharedUICompactAdditionalContentView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setSnippetViews:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(NSArray *)self->_snippetViews isEqualToArray:v4])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    double v5 = self->_snippetViews;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v7);
    }

    double v10 = (NSArray *)[v4 copy];
    snippetViews = self->_snippetViews;
    self->_snippetViews = v10;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v12 = self->_snippetViews;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          double v17 = *(void **)(*((void *)&v20 + 1) + 8 * j);
          uint64_t v18 = SiriSharedUILanguageSemanticContentAttribute();
          SiriSharedUIRecursiveSetSemanticContentAttribute(v17, v18);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v17, "viewInsetsInConversationView:", 0.0, 0.0, 0.0, 0.0, (void)v20);
          }
          snippetContainerView = self->_snippetContainerView;
          if (snippetContainerView) {
            [(UIView *)snippetContainerView addSubview:v17];
          }
          -[SiriSharedUICompactAdditionalContentView _adjustCornerRadiusForSnippetView:](self, "_adjustCornerRadiusForSnippetView:", v17, (void)v20);
          [v17 setClipsToBounds:1];
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v14);
    }

    [(SiriSharedUICompactAdditionalContentView *)self updateContentSizeWithAnimation:1];
  }
}

- (void)_adjustCornerRadiusForSnippetView:(id)a3
{
}

- (id)prepareForUpdatesPendingCompletionBlocks
{
  prepareForUpdatesPendingCompletionBlocks = self->_prepareForUpdatesPendingCompletionBlocks;
  if (!prepareForUpdatesPendingCompletionBlocks)
  {
    id v4 = [MEMORY[0x263EFF980] array];
    double v5 = self->_prepareForUpdatesPendingCompletionBlocks;
    self->_prepareForUpdatesPendingCompletionBlocks = v4;

    prepareForUpdatesPendingCompletionBlocks = self->_prepareForUpdatesPendingCompletionBlocks;
  }
  return prepareForUpdatesPendingCompletionBlocks;
}

- (CGSize)portraitContentSize
{
  [(UIView *)self->_containerView bounds];
  double v3 = v2;
  double v5 = v4 + 8.0 * 2.0;
  result.height = v3;
  result.width = v5;
  return result;
}

- (void)animateAppearanceIfNeeded
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([(NSArray *)self->_snippetViews count])
  {
    if (self->_runningAnimatedFadeOut)
    {
      self->_requestedAppearanceAnimation = 1;
    }
    else if (![(SiriSharedUICompactAdditionalContentView *)self layerHasOpacity])
    {
      double v3 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        double v9 = "-[SiriSharedUICompactAdditionalContentView animateAppearanceIfNeeded]";
        _os_log_impl(&dword_20C9D5000, v3, OS_LOG_TYPE_DEFAULT, "%s #compact running fadeIn of platterView", (uint8_t *)&v8, 0xCu);
      }
      [MEMORY[0x263F158F8] begin];
      double v4 = [(SiriSharedUICompactAdditionalContentView *)self layer];
      double v5 = [(SiriSharedUICompactAdditionalContentView *)self _conversationAppearAnimation];
      [v4 addAnimation:v5 forKey:@"additionalContentAppearance"];

      uint64_t v6 = [(SiriSharedUICompactAdditionalContentView *)self layer];
      LODWORD(v7) = 1.0;
      [v6 setOpacity:v7];

      [MEMORY[0x263F158F8] commit];
    }
  }
}

- (id)_conversationAppearAnimation
{
  double v3 = NSNumber;
  [(SiriSharedUICompactAdditionalContentView *)self frame];
  double v5 = [v3 numberWithDouble:v4];
  uint64_t v6 = +[SiriSharedUIAnimationUtilities animationForStyle:3 expectedWidthForStyle:v5 presentationType:[(SiriSharedUICompactAdditionalContentView *)self _animatedPresentationType]];

  return v6;
}

- (id)_conversationDisappearAnimation
{
  int64_t v2 = [(SiriSharedUICompactAdditionalContentView *)self _animatedPresentationType];
  return +[SiriSharedUIAnimationUtilities animationForStyle:2 expectedWidthForStyle:0 presentationType:v2];
}

- (int64_t)_animatedPresentationType
{
  return self->_isInAmbient;
}

- (void)prepareForUpdatesToSnippetViews:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    BOOL runningPrepareForUpdates = self->_runningPrepareForUpdates;
    *(_DWORD *)buf = 136315650;
    v11 = "-[SiriSharedUICompactAdditionalContentView prepareForUpdatesToSnippetViews:]";
    __int16 v12 = 1024;
    BOOL v13 = runningPrepareForUpdates;
    __int16 v14 = 1024;
    int v15 = 1;
    _os_log_impl(&dword_20C9D5000, v5, OS_LOG_TYPE_DEFAULT, "%s #compact prepareForUpdates isAlreadyRunningPrepareForUpdates: %d, meetsRequirementsForContentUpdating: %d", buf, 0x18u);
  }
  if (!self->_runningPrepareForUpdates && v3)
  {
    self->_BOOL runningPrepareForUpdates = 1;
    objc_initWeak((id *)buf, self);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __76__SiriSharedUICompactAdditionalContentView_prepareForUpdatesToSnippetViews___block_invoke;
    v8[3] = &unk_2640E3870;
    objc_copyWeak(&v9, (id *)buf);
    [(SiriSharedUICompactAdditionalContentView *)self animateFadeOutWithCompletion:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

void __76__SiriSharedUICompactAdditionalContentView_prepareForUpdatesToSnippetViews___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 434) = 0;
    BOOL v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v7 = "-[SiriSharedUICompactAdditionalContentView prepareForUpdatesToSnippetViews:]_block_invoke";
      _os_log_impl(&dword_20C9D5000, v3, OS_LOG_TYPE_DEFAULT, "%s #compact processing any pending update completionBlocks", buf, 0xCu);
    }
    double v4 = objc_alloc_init(SiriSharedUIAnimationContext);
    [(SiriSharedUIAnimationContext *)v4 setAnimationDuration:0.0];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __76__SiriSharedUICompactAdditionalContentView_prepareForUpdatesToSnippetViews___block_invoke_13;
    v5[3] = &unk_2640E37F8;
    v5[4] = v2;
    +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:v5 context:v4 completion:0];
  }
}

uint64_t __76__SiriSharedUICompactAdditionalContentView_prepareForUpdatesToSnippetViews___block_invoke_13(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F158F8] begin];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int64_t v2 = objc_msgSend(*(id *)(a1 + 32), "prepareForUpdatesPendingCompletionBlocks", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  double v7 = [*(id *)(a1 + 32) prepareForUpdatesPendingCompletionBlocks];
  [v7 removeAllObjects];

  [*(id *)(a1 + 32) updateContentSizeWithAnimation:0];
  [*(id *)(a1 + 32) setNeedsDisplay];
  [*(id *)(a1 + 32) layoutIfNeeded];
  return [MEMORY[0x263F158F8] commit];
}

- (void)snippetContentDidUpdate
{
}

- (void)didCompleteAnimatedFadeOut
{
  self->_runningAnimatedFadeOut = 0;
  if (self->_requestedAppearanceAnimation)
  {
    [(SiriSharedUICompactAdditionalContentView *)self animateAppearanceIfNeeded];
    self->_requestedAppearanceAnimation = 0;
  }
}

- (void)animateFadeOutWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(SiriSharedUICompactAdditionalContentView *)self layerHasOpacity])
  {
    uint64_t v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v17 = "-[SiriSharedUICompactAdditionalContentView animateFadeOutWithCompletion:]";
      _os_log_impl(&dword_20C9D5000, v5, OS_LOG_TYPE_DEFAULT, "%s #compact running fadeOut of platterView", buf, 0xCu);
    }
    self->_runningAnimatedFadeOut = 1;
    [MEMORY[0x263F158F8] begin];
    objc_initWeak((id *)buf, self);
    uint64_t v6 = (void *)MEMORY[0x263F158F8];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    long long v12 = __73__SiriSharedUICompactAdditionalContentView_animateFadeOutWithCompletion___block_invoke;
    BOOL v13 = &unk_2640E3898;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = v4;
    [v6 setCompletionBlock:&v10];
    double v7 = [(SiriSharedUICompactAdditionalContentView *)self layer];
    uint64_t v8 = [(SiriSharedUICompactAdditionalContentView *)self _conversationDisappearAnimation];
    [v7 addAnimation:v8 forKey:@"additionalContentDisappearance"];

    long long v9 = [(SiriSharedUICompactAdditionalContentView *)self layer];
    [v9 setOpacity:0.0];

    [MEMORY[0x263F158F8] commit];
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __73__SiriSharedUICompactAdditionalContentView_animateFadeOutWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__SiriSharedUICompactAdditionalContentView_animateFadeOutWithCompletion___block_invoke_2;
    block[3] = &unk_2640E37F8;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __73__SiriSharedUICompactAdditionalContentView_animateFadeOutWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didCompleteAnimatedFadeOut];
}

- (BOOL)layerHasOpacity
{
  int64_t v2 = [(SiriSharedUICompactAdditionalContentView *)self layer];
  [v2 opacity];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[SiriSharedUICompactAdditionalContentView _sizeThatFitsAllSnippets:](self, "_sizeThatFitsAllSnippets:", a3.width, a3.height);
  if (v4 <= 0.0) {
    double v5 = 0.0;
  }
  else {
    double v5 = v4 + 0.0;
  }
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (CGSize)_sizeThatFitsAllSnippets:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v22 = *MEMORY[0x263EF8340];
  double v7 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = self->_snippetViews;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        -[SiriSharedUICompactAdditionalContentView _sizeThatFits:forSnippet:](self, "_sizeThatFits:forSnippet:", *(void *)(*((void *)&v17 + 1) + 8 * v12), width, height, (void)v17);
        double v7 = fmax(v7, v13);
        double v6 = v6 + v14 + 0.0;
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  double v15 = v7;
  double v16 = v6;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)relayout
{
}

- (void)updateContentSizeWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  [(SiriSharedUICompactAdditionalContentView *)self _fittingSize];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [(SiriSharedUICompactAdditionalContentView *)self stackContainerDelegate];
  objc_msgSend(v9, "stackableContentWillUpdateLayout:withUpdatedContentSize:animated:", self, v3, v6, v8);

  [(SiriSharedUICompactAdditionalContentView *)self invalidateIntrinsicContentSize];
}

- (CGSize)_fittingSize
{
  double v3 = 2.0;
  if (!self->_isInAmbient) {
    double v3 = 1.0;
  }
  double v4 = 556.0 * v3;
  double v5 = (double *)&SiriSharedUICompactPlatterAmbientHorizontalPadding;
  if (!self->_isInAmbient) {
    double v5 = (double *)&SiriSharedUICompactPlatterHorizontalPadding;
  }
  double v6 = *v5;
  double v7 = [(SiriSharedUICompactAdditionalContentView *)self stackContainerDelegate];
  [v7 stackableContentMaximumContainerWidth];
  double v9 = v8 + v6 * -2.0;

  if (v4 >= v9) {
    double v10 = v9;
  }
  else {
    double v10 = v4;
  }
  -[SiriSharedUICompactAdditionalContentView sizeThatFits:](self, "sizeThatFits:", v10, 1.79769313e308);
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (CGSize)_sizeThatFits:(CGSize)a3 forSnippet:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = [v6 collectionViewLayout];
    [v7 collectionViewContentSize];
    double v9 = v8;
  }
  else
  {
    objc_msgSend(v6, "sizeThatFits:", width, height);
    double width = v10;
    double v9 = v11;
  }

  double v12 = width;
  double v13 = v9;
  result.double height = v13;
  result.double width = v12;
  return result;
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

- (SiriSharedUICompactAdditionalContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriSharedUICompactAdditionalContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SiriSharedUIViewStackConstraints)stackConstraints
{
  return self->stackConstraints;
}

- (void)setStackConstraints:(id)a3
{
}

- (SiriSharedUIStackableContentDelegate)stackContainerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->stackContainerDelegate);
  return (SiriSharedUIStackableContentDelegate *)WeakRetained;
}

- (void)setStackContainerDelegate:(id)a3
{
}

- (NSArray)snippetViews
{
  return self->_snippetViews;
}

- (SiriSharedUIAnimationContext)animationContextForFrameAndLayoutUpdate
{
  return self->animationContextForFrameAndLayoutUpdate;
}

- (void)setAnimationContextForFrameAndLayoutUpdate:(id)a3
{
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (void)setIsInAmbient:(BOOL)a3
{
  self->_isInAmbient = a3;
}

- (UIView)snippetContainerView
{
  return self->_snippetContainerView;
}

- (void)setSnippetContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetContainerView, 0);
  objc_storeStrong((id *)&self->animationContextForFrameAndLayoutUpdate, 0);
  objc_storeStrong((id *)&self->_snippetViews, 0);
  objc_destroyWeak((id *)&self->stackContainerDelegate);
  objc_storeStrong((id *)&self->stackConstraints, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_prepareForUpdatesPendingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
}

@end