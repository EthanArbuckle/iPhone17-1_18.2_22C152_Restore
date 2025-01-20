@interface SBIconListPageControl
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)actsAsButton;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isEffectivelyVisible;
- (BOOL)isScrubbing;
- (NSArray)touchIgnoreRects;
- (SBIconListPageControl)initWithFrame:(CGRect)a3;
- (SBIconListPageControlDelegate)delegate;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (_UILegibilitySettings)legibilitySettings;
- (double)defaultHeight;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)cancelTapGesture;
- (void)legibilitySettingsDidChange;
- (void)pageControlCurrentPageDidChange:(id)a3;
- (void)setActsAsButton:(BOOL)a3;
- (void)setButtonHighlighted:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setTouchIgnoreRects:(id)a3;
- (void)tapGestureDidUpdate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation SBIconListPageControl

- (void)setTouchIgnoreRects:(id)a3
{
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"filters.highlightBrightness.inputAmount"] & 1) != 0
    || ([v4 isEqualToString:@"filters.highlightSaturation.inputAmount"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBIconListPageControl;
    BOOL v5 = [(SBIconListPageControl *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBIconListPageControl *)self legibilitySettingsDidChange];
  }
}

- (void)legibilitySettingsDidChange
{
  id v5 = [(SBIconListPageControl *)self legibilitySettings];
  v3 = [v5 primaryColor];
  [(UIPageControl *)self setCurrentPageIndicatorTintColor:v3];

  id v4 = [v5 secondaryColor];
  [(UIPageControl *)self setPageIndicatorTintColor:v4];
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setDelegate:(id)a3
{
}

- (SBIconListPageControl)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBIconListPageControl;
  v3 = -[UIPageControl initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v3 action:sel_tapGestureDidUpdate_];
    tapGestureRecognizer = v3->_tapGestureRecognizer;
    v3->_tapGestureRecognizer = (UITapGestureRecognizer *)v4;

    [(UITapGestureRecognizer *)v3->_tapGestureRecognizer setDelegate:v3];
    [(SBIconListPageControl *)v3 addGestureRecognizer:v3->_tapGestureRecognizer];
    [(UIPageControl *)v3 _setAllowsDiscreteInteraction:0];
    [(SBIconListPageControl *)v3 addTarget:v3 action:sel_pageControlCurrentPageDidChange_ forControlEvents:4096];
  }
  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v8 = [(SBIconListPageControl *)self touchIgnoreRects];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) CGRectValue];
        CGFloat v12 = v28.origin.x;
        CGFloat v13 = v28.origin.y;
        CGFloat width = v28.size.width;
        CGFloat height = v28.size.height;
        if (!CGRectIsInfinite(v28))
        {
          v29.origin.double x = v12;
          v29.origin.double y = v13;
          v29.size.CGFloat width = width;
          v29.size.CGFloat height = height;
          if (!CGRectIsEmpty(v29))
          {
            v30.origin.double x = v12;
            v30.origin.double y = v13;
            v30.size.CGFloat width = width;
            v30.size.CGFloat height = height;
            v27.double x = x;
            v27.double y = y;
            if (CGRectContainsPoint(v30, v27))
            {
              LOBYTE(v9) = 1;
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  uint64_t v16 = [v7 type];
  v17 = 0;
  if ((v9 & 1) == 0 && v16 != 9)
  {
    v19.receiver = self;
    v19.super_class = (Class)SBIconListPageControl;
    v17 = -[SBIconListPageControl hitTest:withEvent:](&v19, sel_hitTest_withEvent_, v7, x, y);
  }

  return v17;
}

- (NSArray)touchIgnoreRects
{
  return self->_touchIgnoreRects;
}

- (double)defaultHeight
{
  double result = self->_cachedDefaultHeight;
  if (result <= 0.0)
  {
    -[UIPageControl sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double result = v4;
    self->_cachedDefaultHeight = v4;
  }
  return result;
}

- (void)setActsAsButton:(BOOL)a3
{
  if (self->_actsAsButton != a3)
  {
    self->_actsAsButton = a3;
    [(UIPageControl *)self setBackgroundStyle:a3];
  }
}

- (void)setButtonHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v21[2] = *MEMORY[0x1E4F143B8];
  if ([(SBIconListPageControl *)self actsAsButton])
  {
    id v5 = [(SBIconListPageControl *)self delegate];
    uint64_t v6 = [v5 highlightingViewForPageControl:self];
    id v7 = (void *)v6;
    if (v6) {
      v8 = (SBIconListPageControl *)v6;
    }
    else {
      v8 = self;
    }
    uint64_t v9 = v8;

    uint64_t v10 = [(SBIconListPageControl *)v9 layer];
    v11 = v10;
    if (v3)
    {
      CGFloat v12 = [v10 filters];

      if (!v12)
      {
        CGFloat v13 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A000]];
        [v13 setName:@"highlightBrightness"];
        [v13 setValue:&unk_1F300F040 forKey:@"inputAmount"];
        v14 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
        [v14 setName:@"highlightSaturation"];
        [v14 setValue:&unk_1F300F050 forKey:@"inputAmount"];
        v21[0] = v13;
        v21[1] = v14;
        v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
        [v11 setFilters:v15];
      }
      [v11 setValue:&unk_1F300F060 forKeyPath:@"filters.highlightBrightness.inputAmount"];
      uint64_t v16 = [(SBIconListPageControl *)self traitCollection];
      uint64_t v17 = [v16 userInterfaceStyle];

      if (v17 == 2) {
        [v11 setValue:&unk_1F300F070 forKeyPath:@"filters.highlightSaturation.inputAmount"];
      }
    }
    else
    {
      v18 = (void *)MEMORY[0x1E4FB1EB0];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __46__SBIconListPageControl_setButtonHighlighted___block_invoke;
      v19[3] = &unk_1E6AAC810;
      id v20 = v10;
      [v18 animateWithDuration:2 delay:v19 options:0 animations:0.3 completion:0.0];
    }
  }
}

uint64_t __46__SBIconListPageControl_setButtonHighlighted___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setValue:&unk_1F300F040 forKeyPath:@"filters.highlightBrightness.inputAmount"];
  v2 = *(void **)(a1 + 32);
  return [v2 setValue:&unk_1F300F050 forKeyPath:@"filters.highlightSaturation.inputAmount"];
}

- (void)cancelTapGesture
{
  id v2 = [(SBIconListPageControl *)self tapGestureRecognizer];
  [v2 setEnabled:0];
  [v2 setEnabled:1];
}

- (void)tapGestureDidUpdate:(id)a3
{
  if ([a3 state] == 3)
  {
    id v4 = [(SBIconListPageControl *)self delegate];
    [v4 pageControlDidReceiveButtonTap:self];
  }
}

- (void)pageControlCurrentPageDidChange:(id)a3
{
  id v4 = a3;
  id v6 = [(SBIconListPageControl *)self delegate];
  int64_t v5 = [(UIPageControl *)self interactionState];
  if (v5 == 2 && ![(SBIconListPageControl *)self isScrubbing])
  {
    [(SBIconListPageControl *)self setScrubbing:1];
    [v6 pageControlDidBeginScrubbing:self];
  }
  objc_msgSend(v6, "pageControl:didMoveCurrentPageToPage:withScrubbing:", v4, objc_msgSend(v4, "currentPage"), v5 == 2);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBIconListPageControl;
  [(SBIconListPageControl *)&v5 touchesBegan:a3 withEvent:a4];
  [(SBIconListPageControl *)self setButtonHighlighted:1];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBIconListPageControl;
  [(SBIconListPageControl *)&v5 touchesCancelled:a3 withEvent:a4];
  [(SBIconListPageControl *)self setButtonHighlighted:0];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBIconListPageControl;
  [(SBIconListPageControl *)&v6 touchesEnded:a3 withEvent:a4];
  if ([(SBIconListPageControl *)self isScrubbing])
  {
    [(SBIconListPageControl *)self setScrubbing:0];
    objc_super v5 = [(SBIconListPageControl *)self delegate];
    [v5 pageControlDidEndScrubbing:self];
  }
  [(SBIconListPageControl *)self setButtonHighlighted:0];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v5 = a3;
  id v6 = [(SBIconListPageControl *)self tapGestureRecognizer];

  if (v6 == v5)
  {
    unsigned __int8 v7 = [(SBIconListPageControl *)self actsAsButton];
  }
  else
  {
    if (!objc_msgSend((id)+[SBIconListPageControl superclass](SBIconListPageControl, "superclass"), "instancesRespondToSelector:", a2))
    {
      BOOL v8 = 1;
      goto LABEL_7;
    }
    v10.receiver = self;
    v10.super_class = (Class)SBIconListPageControl;
    unsigned __int8 v7 = [(UIPageControl *)&v10 gestureRecognizerShouldBegin:v5];
  }
  BOOL v8 = v7;
LABEL_7:

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)isEffectivelyVisible
{
  if ([(SBIconListPageControl *)self isHidden]) {
    return 0;
  }
  [(SBIconListPageControl *)self alpha];
  return BSFloatIsZero() ^ 1;
}

- (SBIconListPageControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBIconListPageControlDelegate *)WeakRetained;
}

- (BOOL)actsAsButton
{
  return self->_actsAsButton;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (void)setScrubbing:(BOOL)a3
{
  self->_scrubbing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchIgnoreRects, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end