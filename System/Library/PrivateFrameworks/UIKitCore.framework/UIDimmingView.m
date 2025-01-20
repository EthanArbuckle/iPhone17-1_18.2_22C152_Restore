@interface UIDimmingView
+ (id)defaultDimmingColor;
- (BOOL)displayed;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)hitTestsAsOpaque;
- (BOOL)ignoresTouches;
- (BOOL)isTransparentFocusItem;
- (BOOL)suppressesBackdrops;
- (NSArray)lowerWindowDismissalGestureViews;
- (NSArray)passthroughViews;
- (UIBarButtonItem)highlightedBarButtonItem;
- (UIBlurEffect)blurEffect;
- (UIColor)dimmingColor;
- (UIDimmingView)initWithFrame:(CGRect)a3;
- (UIDimmingViewDelegate)delegate;
- (double)percentDisplayed;
- (double)percentLightened;
- (id)_backdropViewsToAnimate;
- (id)_gestureRecognizersForEvent:(id)a3;
- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int)textEffectsVisibilityLevel;
- (void)_clearAdditionalEventGestures;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_queueAdditionalEventGesturesFromView:(id)a3;
- (void)_sendDelegateDimmingViewWasTapped;
- (void)_simulateTap;
- (void)dealloc;
- (void)display:(BOOL)a3;
- (void)display:(BOOL)a3 withAnimationDuration:(double)a4 afterDelay:(double)a5;
- (void)handleSingleTap:(id)a3;
- (void)setBlurEffect:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmingColor:(id)a3;
- (void)setHighlightedBarButtonItem:(id)a3;
- (void)setHitTestsAsOpaque:(BOOL)a3;
- (void)setIgnoresTouches:(BOOL)a3;
- (void)setLowerWindowDismissalGestureViews:(id)a3;
- (void)setPassthroughViews:(id)a3;
- (void)setPercentDisplayed:(double)a3;
- (void)setPercentLightened:(double)a3;
- (void)setSuppressesBackdrops:(BOOL)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)updateBackgroundColor;
- (void)willMoveToWindow:(id)a3;
@end

@implementation UIDimmingView

- (void)setDimmingColor:(id)a3
{
  id v5 = a3;
  if (!-[UIColor isEqual:](self->_dimmingColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_dimmingColor, a3);
    [(UIDimmingView *)self updateBackground];
  }
}

- (void)updateBackgroundColor
{
  if (qword_1EB25E850 != -1) {
    dispatch_once(&qword_1EB25E850, &__block_literal_global_653);
  }
  double v3 = *(double *)&_MergedGlobals_21_5;
  double v4 = *(double *)algn_1EB25E838;
  double v5 = *(double *)&qword_1EB25E840;
  double v6 = unk_1EB25E848;
  [(UIDimmingView *)self percentLightened];
  v8 = +[UIColor colorWithRed:v3 green:v4 blue:v5 alpha:v6 * v7];
  double v15 = 0.0;
  v9 = [(UIDimmingView *)self dimmingColor];
  [v9 getRed:0 green:0 blue:0 alpha:&v15];

  v10 = [(UIDimmingView *)self dimmingColor];
  double v11 = v15;
  [(UIDimmingView *)self percentDisplayed];
  v13 = [v10 colorWithAlphaComponent:v11 * v12];

  v14 = [v8 _colorBlendedWithColor:v13];
  [(UIView *)self setBackgroundColor:v14];
}

- (UIColor)dimmingColor
{
  return self->_dimmingColor;
}

- (double)percentLightened
{
  return self->_percentLightened;
}

- (double)percentDisplayed
{
  return self->_percentDisplayed;
}

- (void)setPercentDisplayed:(double)a3
{
  if (self->_percentDisplayed != a3)
  {
    self->_percentDisplayed = a3;
    [(UIDimmingView *)self updateBackground];
  }
}

- (void)setIgnoresTouches:(BOOL)a3
{
  self->_ignoresTouches = a3;
}

- (void)setPercentLightened:(double)a3
{
  if (self->_percentLightened != a3)
  {
    self->_percentLightened = a3;
    [(UIDimmingView *)self updateBackground];
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UIDimmingView;
  [(UIView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(UIDimmingView *)self updateBackground];
}

- (void)dealloc
{
  [(UIGestureRecognizer *)self->_singleFingerTapRecognizer setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)UIDimmingView;
  [(UIView *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowerWindowDismissalGestureViews, 0);
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_additionalEventGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_observedEventForAdditionalGestures, 0);
  objc_storeStrong((id *)&self->_singleFingerTapRecognizer, 0);
  objc_storeStrong((id *)&self->_dimmingColor, 0);
  objc_storeStrong((id *)&self->_passthroughViews, 0);
  objc_storeStrong((id *)&self->_backgroundGlow, 0);
  objc_storeStrong((id *)&self->_highlightedImageView, 0);
  objc_storeStrong((id *)&self->_highlightedBarButtonItem, 0);
}

void __38__UIDimmingView_updateBackgroundColor__block_invoke()
{
  v0 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
  v1 = -[UITraitCollection _traitCollectionWithIncrementedBackgroundLevel](v0);
  v2 = +[UIColor systemBackgroundColor];
  objc_super v3 = [v2 resolvedColorWithTraitCollection:v1];

  double v10 = 0.0;
  double v11 = 0.0;
  double v9 = 0.0;
  [v3 getRed:&v11 green:&v10 blue:&v9 alpha:0];
  if (v11 >= v10) {
    double v4 = v11;
  }
  else {
    double v4 = v10;
  }
  if (v4 < v9) {
    double v4 = v9;
  }
  double v5 = 1.0 / v4;
  if (v4 == 0.0) {
    double v5 = 0.0;
  }
  if (v11 == v4) {
    double v6 = 1.0;
  }
  else {
    double v6 = v11 * v5;
  }
  if (v10 == v4) {
    double v7 = 1.0;
  }
  else {
    double v7 = v10 * v5;
  }
  _MergedGlobals_21_5 = *(void *)&v6;
  *(double *)algn_1EB25E838 = v7;
  double v8 = v9 * v5;
  if (v9 == v4) {
    double v8 = 1.0;
  }
  qword_1EB25E840 = *(void *)&v8;
  unk_1EB25E848 = *(void *)&v4;
}

- (void)setDelegate:(id)a3
{
}

- (UIDimmingView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UIDimmingView;
  objc_super v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = [(id)objc_opt_class() defaultDimmingColor];
  [(UIDimmingView *)v3 setDimmingColor:v4];

  if (v3)
  {
    double v5 = +[UIColor clearColor];
    [(UIView *)v3 setBackgroundColor:v5];

    [(UIView *)v3 setOpaque:0];
    [(UIDimmingView *)v3 setHitTestsAsOpaque:1];
    if (dyld_program_sdk_at_least())
    {
      double v6 = [[UITapGestureRecognizer alloc] initWithTarget:v3 action:sel_handleSingleTap_];
      singleFingerTapRecognizer = v3->_singleFingerTapRecognizer;
      v3->_singleFingerTapRecognizer = v6;

      [(UIGestureRecognizer *)v3->_singleFingerTapRecognizer setDelegate:v3];
      [(UIView *)v3 addGestureRecognizer:v3->_singleFingerTapRecognizer];
    }
    lowerWindowDismissalGestureViews = v3->_lowerWindowDismissalGestureViews;
    v3->_lowerWindowDismissalGestureViews = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (void)setHitTestsAsOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIView *)self layer];
  [v4 setHitTestsAsOpaque:v3];
}

+ (id)defaultDimmingColor
{
  return +[UIColor _dimmingViewColor];
}

- (void)setSuppressesBackdrops:(BOOL)a3
{
  self->_suppressesBackdrops = a3;
}

- (void)willMoveToWindow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIDimmingView;
  [(UIView *)&v4 willMoveToWindow:a3];
  [(UIDimmingView *)self _clearAdditionalEventGestures];
}

- (void)_clearAdditionalEventGestures
{
  observedEventForAdditionalGestures = self->_observedEventForAdditionalGestures;
  if (observedEventForAdditionalGestures)
  {
    [(NSMutableSet *)observedEventForAdditionalGestures->_eventObservers removeObject:self];
    objc_super v4 = self->_observedEventForAdditionalGestures;
    self->_observedEventForAdditionalGestures = 0;
  }
  additionalEventGestureRecognizers = self->_additionalEventGestureRecognizers;
  [(NSMutableSet *)additionalEventGestureRecognizers removeAllObjects];
}

- (NSArray)passthroughViews
{
  return self->_passthroughViews;
}

- (void)setPassthroughViews:(id)a3
{
}

- (int)textEffectsVisibilityLevel
{
  return 190;
}

- (void)setHighlightedBarButtonItem:(id)a3
{
  id v25 = a3;
  objc_storeStrong((id *)&self->_highlightedBarButtonItem, a3);
  if (self->_highlightedBarButtonItem)
  {
    double v5 = [v25 view];
    [v5 bounds];
    _UIGraphicsBeginImageContextWithOptions(0, 0, v6, v7, 0.0);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      double v9 = 0;
    }
    else {
      double v9 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    [v5 bounds];
    CGFloat v11 = -v10;
    [v5 bounds];
    CGContextTranslateCTM(v9, v11, -v12);
    v13 = [v5 layer];
    v14 = GetContextStack(0);
    if (*(int *)v14 < 1) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = v14[3 * (*(_DWORD *)v14 - 1) + 1];
    }
    [v13 renderInContext:v15];

    v16 = _UIGraphicsGetImageFromCurrentImageContext(0);
    UIGraphicsEndImageContext();
    if (!self->_highlightedImageView)
    {
      v17 = [UIImageView alloc];
      v18 = -[UIImageView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      highlightedImageView = self->_highlightedImageView;
      self->_highlightedImageView = v18;

      [(UIView *)self->_highlightedImageView setUserInteractionEnabled:0];
      [(UIView *)self addSubview:self->_highlightedImageView];
    }
    v20 = [v5 superview];
    [v5 frame];
    objc_msgSend(v20, "convertRect:toView:", self);
    -[UIImageView setFrame:](self->_highlightedImageView, "setFrame:");

    [(UIImageView *)self->_highlightedImageView setImage:v16];
    if (!self->_backgroundGlow)
    {
      v21 = [UIImageView alloc];
      v22 = _UIImageWithName(@"UIButtonBarPressedIndicator.png");
      v23 = [(UIImageView *)v21 initWithImage:v22];
      backgroundGlow = self->_backgroundGlow;
      self->_backgroundGlow = v23;

      [(UIView *)self->_backgroundGlow setUserInteractionEnabled:0];
      [(UIView *)self insertSubview:self->_backgroundGlow belowSubview:self->_highlightedImageView];
    }
    [(UIView *)self->_highlightedImageView center];
    -[UIImageView setCenter:](self->_backgroundGlow, "setCenter:");
    [(UIView *)self->_backgroundGlow setAlpha:0.2];
  }
  else
  {
    [(UIView *)self->_backgroundGlow removeFromSuperview];
    [(UIView *)self->_highlightedImageView removeFromSuperview];
  }
}

- (UIBarButtonItem)highlightedBarButtonItem
{
  return self->_highlightedBarButtonItem;
}

- (id)_backdropViewsToAnimate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v4 = +[_UIBackdropView allBackdropViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (self)
        {
          double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (-[UIView _viewOrderRelativeToView:requireIntersection:](self, v9, 1) == -2) {
            [v3 addObject:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)displayed
{
  return self->_percentDisplayed > 0.0;
}

- (void)setBlurEffect:(id)a3
{
  id v5 = a3;
  if (!-[UIBlurEffect isEqual:](self->_blurEffect, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_blurEffect, a3);
    [(UIDimmingView *)self updateBackground];
  }
}

- (BOOL)hitTestsAsOpaque
{
  v2 = [(UIView *)self layer];
  char v3 = [v2 hitTestsAsOpaque];

  return v3;
}

- (void)display:(BOOL)a3
{
  double v4 = 0.0;
  if (a3) {
    double v4 = 1.0;
  }
  self->_percentDisplayed = v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__UIDimmingView_display___block_invoke;
  v5[3] = &unk_1E52D9FC0;
  v5[4] = self;
  BOOL v6 = a3;
  +[UIView performWithoutAnimation:v5];
  [(UIDimmingView *)self updateBackground];
}

void __25__UIDimmingView_display___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) suppressesBackdrops])
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    v2 = objc_msgSend(*(id *)(a1 + 32), "_backdropViewsToAnimate", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setShouldRasterizeEffectsView:*(unsigned __int8 *)(a1 + 40)];
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
}

- (void)display:(BOOL)a3 withAnimationDuration:(double)a4 afterDelay:(double)a5
{
  BOOL v7 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v9 = 0.0;
  if (a3) {
    double v9 = 1.0;
  }
  self->_percentDisplayed = v9;
  if ([(UIDimmingView *)self suppressesBackdrops])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v10 = [(UIDimmingView *)self _backdropViewsToAnimate];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * v14++) setShouldRasterizeEffectsView:v7];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__UIDimmingView_display_withAnimationDuration_afterDelay___block_invoke;
  v17[3] = &unk_1E52D9F70;
  v17[4] = self;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__UIDimmingView_display_withAnimationDuration_afterDelay___block_invoke_2;
  v15[3] = &unk_1E52E0478;
  BOOL v16 = v7;
  v15[4] = self;
  +[UIView animateWithDuration:4 delay:v17 options:v15 animations:a4 completion:a5];
}

uint64_t __58__UIDimmingView_display_withAnimationDuration_afterDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateBackground];
}

uint64_t __58__UIDimmingView_display_withAnimationDuration_afterDelay___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40))
  {
    result = *(void *)(result + 32);
    if (*(unsigned char *)(result + 440)) {
      return [(id)result dimmingRemovalAnimationDidStop];
    }
  }
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (self->_inPassthroughHitTest)
  {
    long long v8 = 0;
    goto LABEL_44;
  }
  v55.receiver = self;
  v55.super_class = (Class)UIDimmingView;
  -[UIView hitTest:withEvent:](&v55, sel_hitTest_withEvent_, v7, x, y);
  double v9 = (UIDimmingView *)objc_claimAutoreleasedReturnValue();
  long long v10 = v9;
  if (v9 != self) {
    goto LABEL_42;
  }
  v42 = v9;
  id v44 = v7;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v11 = self->_passthroughViews;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v52 != v14) {
          objc_enumerationMutation(v11);
        }
        BOOL v16 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(v16, "window", v42);
        if (v17)
        {
          long long v18 = (void *)v17;
          long long v19 = [v16 window];
          long long v20 = [(UIView *)self window];
          if (v19 == v20)
          {
            [v16 bounds];
            objc_msgSend(v16, "convertRect:toView:", self);
            v60.double x = x;
            v60.double y = y;
            BOOL v21 = CGRectContainsPoint(v61, v60);

            if (v21)
            {
              self->_inPassthroughHitTest = 1;
              -[UIView convertPoint:toView:](self, "convertPoint:toView:", v16, x, y);
              uint64_t v22 = objc_msgSend(v16, "hitTest:withEvent:", v44);
              self->_inPassthroughHitTest = 0;
              if (v22)
              {
                long long v8 = (UIDimmingView *)v22;

                id v7 = v44;
                long long v10 = v42;
                goto LABEL_43;
              }
            }
          }
          else
          {
          }
        }
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v13);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = self->_lowerWindowDismissalGestureViews;
  id v7 = v44;
  uint64_t v46 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (!v46) {
    goto LABEL_41;
  }
  uint64_t v45 = *(void *)v48;
  do
  {
    for (uint64_t j = 0; j != v46; ++j)
    {
      if (*(void *)v48 != v45) {
        objc_enumerationMutation(obj);
      }
      v24 = *(void **)(*((void *)&v47 + 1) + 8 * j);
      id v25 = [(UIView *)self window];
      id v26 = v24;
      id v27 = v25;
      id v28 = v7;
      v29 = v28;
      if (v7) {
        BOOL v30 = [v28 type] == 0;
      }
      else {
        BOOL v30 = 0;
      }
      v31 = [v26 window];
      if (v31)
      {
        id v32 = [v26 window];
        if (v32 == v27)
        {
          BOOL v37 = 0;
        }
        else
        {
          v33 = [v26 window];
          [v33 level];
          double v35 = v34;
          [v27 level];
          BOOL v37 = v35 <= v36;
        }
        id v7 = v44;
      }
      else
      {
        BOOL v37 = 0;
      }

      v38 = [v26 gestureRecognizers];
      uint64_t v39 = [v38 count];

      if (!v30)
      {

LABEL_38:
        continue;
      }
      if (v39) {
        BOOL v40 = v37;
      }
      else {
        BOOL v40 = 0;
      }

      if (v40)
      {
        self->_inPassthroughHitTest = 1;
        -[UIView convertPoint:toView:](self, "convertPoint:toView:", v26, x, y);
        objc_msgSend(v26, "hitTest:withEvent:", v29);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        self->_inPassthroughHitTest = 0;
        if (v27) {
          [(UIDimmingView *)self _queueAdditionalEventGesturesFromView:v26];
        }
        goto LABEL_38;
      }
    }
    uint64_t v46 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v56 count:16];
  }
  while (v46);
LABEL_41:

  long long v10 = v42;
LABEL_42:
  long long v8 = v10;
LABEL_43:

LABEL_44:
  return v8;
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (self->_inPassthroughHitTest)
  {
    uint64_t v4 = 0;
  }
  else
  {
    double y = a3.y;
    double x = a3.x;
    v30.receiver = self;
    v30.super_class = (Class)UIDimmingView;
    -[UIView hitTest:forEvent:](&v30, sel_hitTest_forEvent_);
    double v9 = (UIDimmingView *)objc_claimAutoreleasedReturnValue();
    long long v10 = v9;
    if (v9 == self)
    {
      v24 = v9;
      id v25 = a4;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v11 = self->_passthroughViews;
      uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v27;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v11);
            }
            BOOL v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            uint64_t v17 = objc_msgSend(v16, "window", v24);
            if (v17)
            {
              long long v18 = (void *)v17;
              long long v19 = [v16 window];
              long long v20 = [(UIView *)self window];
              if (v19 == v20)
              {
                [v16 bounds];
                objc_msgSend(v16, "convertRect:toView:", self);
                v34.double x = x;
                v34.double y = y;
                BOOL v21 = CGRectContainsPoint(v35, v34);

                if (v21)
                {
                  self->_inPassthroughHitTest = 1;
                  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v16, x, y);
                  uint64_t v22 = objc_msgSend(v16, "hitTest:forEvent:", v25);
                  self->_inPassthroughHitTest = 0;
                  if (v22)
                  {
                    uint64_t v4 = (UIDimmingView *)v22;

                    long long v10 = v24;
                    goto LABEL_18;
                  }
                }
              }
              else
              {
              }
            }
          }
          uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      long long v10 = v24;
    }
    uint64_t v4 = v10;
LABEL_18:
  }
  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_singleFingerTapRecognizer != a3) {
    return 1;
  }
  id v6 = a3;
  id v7 = [a4 view];
  long long v8 = [v6 view];

  BOOL v4 = v7 == v8;
  return v4;
}

- (void)handleSingleTap:(id)a3
{
  if ([a3 state] == 3)
  {
    [(UIDimmingView *)self _simulateTap];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    [(UIDimmingView *)self _simulateTap];
  }
}

- (void)_simulateTap
{
  if (!self->_ignoresTouches) {
    [(UIDimmingView *)self _sendDelegateDimmingViewWasTapped];
  }
}

- (void)_sendDelegateDimmingViewWasTapped
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 dimmingViewWasTapped:self];
  }
}

- (void)_queueAdditionalEventGesturesFromView:(id)a3
{
  id v15 = [a3 gestureRecognizers];
  uint64_t v4 = [(UIView *)self window];
  if (v4)
  {
    char v5 = (void *)v4;
    uint64_t v6 = [v15 count];

    if (v6)
    {
      id v7 = v15;
      if (!self->_observedEventForAdditionalGestures)
      {
        long long v8 = (void *)UIApp;
        double v9 = [(UIView *)self window];
        long long v10 = [v8 _touchesEventForWindow:v9];
        observedEventForAdditionalGestures = self->_observedEventForAdditionalGestures;
        self->_observedEventForAdditionalGestures = v10;

        -[UIEvent _addEventObserver:]((uint64_t)self->_observedEventForAdditionalGestures, self);
        id v7 = v15;
      }
      additionalEventGestureRecognizers = self->_additionalEventGestureRecognizers;
      if (!additionalEventGestureRecognizers)
      {
        uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v14 = self->_additionalEventGestureRecognizers;
        self->_additionalEventGestureRecognizers = v13;

        id v7 = v15;
        additionalEventGestureRecognizers = self->_additionalEventGestureRecognizers;
      }
      [(NSMutableSet *)additionalEventGestureRecognizers addObjectsFromArray:v7];
    }
  }
}

- (id)_gestureRecognizersForEvent:(id)a3
{
  additionalEventGestureRecognizers = self->_additionalEventGestureRecognizers;
  if (additionalEventGestureRecognizers)
  {
    char v5 = [(NSMutableSet *)additionalEventGestureRecognizers allObjects];
    [(NSMutableSet *)self->_additionalEventGestureRecognizers removeAllObjects];
  }
  else
  {
    char v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (BOOL)isTransparentFocusItem
{
  uint64_t v3 = [(UIView *)self _focusBehavior];
  if ([v3 supportsViewTransparency])
  {
    uint64_t v4 = [(UIDimmingView *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      uint64_t v6 = [(UIDimmingView *)self delegate];
      char v7 = [v6 _allowsFocusBehindDimmingView];

      return v7;
    }
  }
  else
  {
  }
  v9.receiver = self;
  v9.super_class = (Class)UIDimmingView;
  return [(UIView *)&v9 isTransparentFocusItem];
}

- (UIDimmingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIDimmingViewDelegate *)WeakRetained;
}

- (BOOL)ignoresTouches
{
  return self->_ignoresTouches;
}

- (BOOL)suppressesBackdrops
{
  return self->_suppressesBackdrops;
}

- (UIBlurEffect)blurEffect
{
  return self->_blurEffect;
}

- (NSArray)lowerWindowDismissalGestureViews
{
  return self->_lowerWindowDismissalGestureViews;
}

- (void)setLowerWindowDismissalGestureViews:(id)a3
{
}

@end