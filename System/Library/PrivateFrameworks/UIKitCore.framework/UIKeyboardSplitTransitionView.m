@interface UIKeyboardSplitTransitionView
- (BOOL)canDisplayTransition;
- (BOOL)shouldAllowRubberiness;
- (BOOL)showDictationKey;
- (BOOL)showIntlKey;
- (BOOL)transitionIsVisible;
- (CGImage)defaultKeyboardImage;
- (CGImage)keyImageWithToken:(id)a3;
- (CGImage)splitKeyboardImage;
- (CGRect)rectEnclosingKeyplane:(id)a3;
- (CGSize)sizeForShadowLayer:(int)a3;
- (NSArray)backgroundLayers;
- (NSArray)shadowLayers;
- (UIKeyboardKeyplaneTransitionDelegate)splitTransitionDelegate;
- (UIKeyboardSplitTransitionDataSource)splitTransitionDataSource;
- (id)bottomDropShadow;
- (id)centerDropShadow;
- (id)colorsForBackgroundLayer:(int)a3;
- (id)completionBlock;
- (id)outerCenterDropShadow;
- (id)topDropShadow;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)finalizeTransition;
- (void)finishWithProgress:(double)a3 completionBlock:(id)a4;
- (void)initializeLayers;
- (void)setCompletionBlock:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setSplitTransitionDataSource:(id)a3;
- (void)setSplitTransitionDelegate:(id)a3;
- (void)transformForProgress:(double)a3;
- (void)transitionToFinalState:(id)a3;
- (void)updateWithProgress:(double)a3;
@end

@implementation UIKeyboardSplitTransitionView

- (void)dealloc
{
  displayLink = self->_displayLink;
  if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    v4 = self->_displayLink;
    self->_displayLink = 0;
  }
  [(UIKeyboardSplitTransitionView *)self setCompletionBlock:0];
  sliceSet = self->_sliceSet;
  self->_sliceSet = 0;

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:@"UIKeyboardRivenVisualStyleDidChange" object:0];

  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardSplitTransitionView;
  [(UIView *)&v7 dealloc];
}

- (void)didMoveToWindow
{
  v3 = [(UIView *)self window];

  if (v3)
  {
    v4 = [(UIView *)self window];
    v5 = [v4 screen];
    [v5 scale];
    double v7 = v6;
    v8 = [(UIView *)self layer];
    [v8 setRasterizationScale:v7];

    v9 = [(UIView *)self window];
    v10 = [v9 screen];
    v11 = +[UIKeyboardMotionSupport supportForScreen:v10];
    [(UIKeyboardSplitTransitionView *)self setSplitTransitionDelegate:v11];

    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:self selector:sel_rebuildTransitionForSplitStyleChange_ name:@"UIKeyboardRivenVisualStyleDidChange" object:0];
  }
  else
  {
    [(UIKeyboardSplitTransitionView *)self setSplitTransitionDelegate:0];
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 removeObserver:self];
  }
}

- (void)setFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardSplitTransitionView;
  -[UIView setFrame:](&v6, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [(UIKeyboardSplitTransitionView *)self backgroundLayers];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__UIKeyboardSplitTransitionView_setFrame___block_invoke;
  v5[3] = &unk_1E52DC4C0;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __42__UIKeyboardSplitTransitionView_setFrame___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v24 = a2;
  [*(id *)(a1 + 32) bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  v13 = +[UIKeyboardPreferencesController sharedPreferencesController];
  v14 = [v13 preferencesActions];
  [v14 rivenSizeFactor:9.0];
  CGFloat v16 = v15 * -2.0;
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  CGRect v27 = CGRectInset(v26, v16, 0.0);
  objc_msgSend(v24, "setBounds:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);

  if (a3 == 2)
  {
    [*(id *)(a1 + 32) bounds];
    double v18 = v17;
    v19 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v20 = [v19 preferencesActions];
    [v20 rivenSizeFactor:9.0];
    double v22 = v18 + v21;
  }
  else
  {
    v19 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v20 = [v19 preferencesActions];
    [v20 rivenSizeFactor:9.0];
    double v22 = -v23;
  }
  objc_msgSend(v24, "setPosition:", v22, 0.0);
}

- (NSArray)shadowLayers
{
  return 0;
}

- (NSArray)backgroundLayers
{
  v2 = (void *)backgroundLayers_backgroundLayers;
  if (!backgroundLayers_backgroundLayers)
  {
    int v3 = 3;
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    double v5 = (void *)backgroundLayers_backgroundLayers;
    backgroundLayers_backgroundLayers = v4;

    do
    {
      CGFloat v6 = (void *)backgroundLayers_backgroundLayers;
      double v7 = [MEMORY[0x1E4F39BD0] layer];
      [v6 addObject:v7];

      --v3;
    }
    while (v3);
    v2 = (void *)backgroundLayers_backgroundLayers;
  }
  return (NSArray *)v2;
}

- (id)topDropShadow
{
  v2 = (void *)topDropShadow_top;
  if (!topDropShadow_top)
  {
    uint64_t v3 = +[UIImage kitImageNamed:@"kb-drop-shadow-top.png"];
    uint64_t v4 = (void *)topDropShadow_top;
    topDropShadow_top = v3;

    v2 = (void *)topDropShadow_top;
  }
  return v2;
}

- (id)centerDropShadow
{
  v2 = (void *)centerDropShadow_center;
  if (!centerDropShadow_center)
  {
    uint64_t v3 = +[UIImage kitImageNamed:@"kb-drop-shadow-center.png"];
    uint64_t v4 = (void *)centerDropShadow_center;
    centerDropShadow_center = v3;

    v2 = (void *)centerDropShadow_center;
  }
  return v2;
}

- (id)outerCenterDropShadow
{
  v2 = (void *)outerCenterDropShadow_outerCenter;
  if (!outerCenterDropShadow_outerCenter)
  {
    uint64_t v3 = +[UIImage kitImageNamed:@"kb-drop-shadow-outer-center.png"];
    uint64_t v4 = (void *)outerCenterDropShadow_outerCenter;
    outerCenterDropShadow_outerCenter = v3;

    v2 = (void *)outerCenterDropShadow_outerCenter;
  }
  return v2;
}

- (id)bottomDropShadow
{
  v2 = (void *)bottomDropShadow_bottom;
  if (!bottomDropShadow_bottom)
  {
    uint64_t v3 = +[UIImage kitImageNamed:@"kb-drop-shadow-bottom.png"];
    uint64_t v4 = (void *)bottomDropShadow_bottom;
    bottomDropShadow_bottom = v3;

    v2 = (void *)bottomDropShadow_bottom;
  }
  return v2;
}

- (void)initializeLayers
{
  uint64_t v3 = +[UIScreen mainScreen];
  [v3 scale];
  uint64_t v5 = v4;

  CGFloat v6 = [(UIKeyboardSplitTransitionView *)self shadowLayers];
  double v7 = [v6 objectAtIndex:0];

  CGFloat v8 = [v7 contents];

  if (!v8)
  {
    double v9 = [(UIKeyboardSplitTransitionView *)self topDropShadow];
    CGFloat v10 = [(UIKeyboardSplitTransitionView *)self centerDropShadow];
    double v11 = [(UIKeyboardSplitTransitionView *)self bottomDropShadow];
    CGFloat v12 = [(UIKeyboardSplitTransitionView *)self outerCenterDropShadow];
    v13 = [(UIKeyboardSplitTransitionView *)self shadowLayers];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __49__UIKeyboardSplitTransitionView_initializeLayers__block_invoke;
    v23[3] = &unk_1E52FE838;
    id v24 = v10;
    id v25 = v9;
    id v26 = v11;
    id v27 = v12;
    uint64_t v28 = v5;
    id v14 = v12;
    id v15 = v11;
    id v16 = v9;
    id v17 = v10;
    [v13 enumerateObjectsUsingBlock:v23];
  }
  double v18 = [(UIKeyboardSplitTransitionView *)self backgroundLayers];
  v19 = [v18 objectAtIndex:0];

  v20 = [v19 contents];

  if (!v20)
  {
    double v21 = [(UIKeyboardSplitTransitionView *)self backgroundLayers];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __49__UIKeyboardSplitTransitionView_initializeLayers__block_invoke_2;
    v22[3] = &unk_1E52E8818;
    v22[4] = self;
    v22[5] = v5;
    [v21 enumerateObjectsUsingBlock:v22];
  }
}

void __49__UIKeyboardSplitTransitionView_initializeLayers__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id v6 = *(id *)(a1 + 32);
  objc_msgSend(v5, "setAnchorPoint:", 0.0, 0.0);
  if (a3 == 4 || a3 == 1)
  {
    id v7 = *(id *)(a1 + 40);

    id v6 = v7;
  }
  if (a3 <= 6 && ((1 << a3) & 0x49) != 0)
  {
    CGFloat v8 = (id *)(a1 + 48);
  }
  else
  {
    if (a3 - 7 > 1) {
      goto LABEL_8;
    }
    CGFloat v8 = (id *)(a1 + 56);
  }
  id v9 = *v8;

  id v6 = v9;
LABEL_8:
  id v10 = v6;
  objc_msgSend(v5, "setContents:", objc_msgSend(v10, "CGImage"));
  [v5 setContentsScale:*(double *)(a1 + 64)];
  if (a3 <= 8 && ((1 << a3) & 0x1A4) != 0)
  {
    objc_msgSend(v5, "setContentsCenter:", 0.0, 0.5, 0.0, 0.0);
    if ((a3 | 2) == 7)
    {
      CGAffineTransformMakeScale(&m, -1.0, 1.0);
      CATransform3DMakeAffineTransform(&v13, &m);
      CATransform3D v11 = v13;
      [v5 setTransform:&v11];
    }
  }
}

void __49__UIKeyboardSplitTransitionView_initializeLayers__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3 == 2) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  id v9 = a2;
  objc_msgSend(v9, "setAnchorPoint:", v5, 0.0);
  id v6 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v7 = [v6 preferencesActions];
  [v7 rivenSizeFactor:9.0];
  objc_msgSend(v9, "setCornerRadius:");

  CGFloat v8 = [*(id *)(a1 + 32) colorsForBackgroundLayer:a3];
  [v9 setColors:v8];

  [v9 setContentsScale:*(double *)(a1 + 40)];
}

- (id)colorsForBackgroundLayer:(int)a3
{
  if (!colorsForBackgroundLayer__modernColors)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v4 = UIKBGetNamedColor(@"UIKBColorLightBackdropTint");
    uint64_t v5 = [v3 arrayWithObjects:v4, UIKBGetNamedColor(@"UIKBColorLightBackdropTint"), 0];
    id v6 = (void *)colorsForBackgroundLayer__modernColors;
    colorsForBackgroundLayer__modernColors = v5;
  }
  id v7 = +[UIKeyboardImpl activeInstance];
  CGFloat v8 = [v7 textInputTraits];
  uint64_t v9 = [v8 keyboardAppearance];

  if ((v9 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    id v10 = 0;
  }
  else {
    id v10 = (id)colorsForBackgroundLayer__modernColors;
  }
  return v10;
}

- (CGSize)sizeForShadowLayer:(int)a3
{
  switch(a3)
  {
    case 1:
    case 4:
      uint64_t v3 = [(UIKeyboardSplitTransitionView *)self topDropShadow];
      goto LABEL_6;
    case 2:
    case 5:
      uint64_t v3 = [(UIKeyboardSplitTransitionView *)self centerDropShadow];
      goto LABEL_6;
    case 3:
    case 6:
      uint64_t v3 = [(UIKeyboardSplitTransitionView *)self bottomDropShadow];
      goto LABEL_6;
    case 7:
    case 8:
      uint64_t v3 = [(UIKeyboardSplitTransitionView *)self outerCenterDropShadow];
LABEL_6:
      uint64_t v4 = v3;
      [v3 size];
      double v6 = v5;
      double v8 = v7;

      break;
    default:
      double v6 = *MEMORY[0x1E4F1DB30];
      double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      break;
  }
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGRect)rectEnclosingKeyplane:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGFloat x = *MEMORY[0x1E4F1DB28];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v7 = objc_msgSend(a3, "subtrees", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v11) frame];
        v29.origin.CGFloat x = v12;
        v29.origin.CGFloat y = v13;
        v29.size.CGFloat width = v14;
        v29.size.CGFloat height = v15;
        v26.origin.CGFloat x = x;
        v26.origin.CGFloat y = y;
        v26.size.CGFloat width = width;
        v26.size.CGFloat height = height;
        CGRect v27 = CGRectUnion(v26, v29);
        CGFloat x = v27.origin.x;
        CGFloat y = v27.origin.y;
        CGFloat width = v27.size.width;
        CGFloat height = v27.size.height;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (BOOL)shouldAllowRubberiness
{
  return ([(UIView *)self _clipCorners] & 3) != 0;
}

- (void)transformForProgress:(double)a3
{
  BOOL v5 = [(UIKeyboardSplitTransitionView *)self shouldAllowRubberiness];
  double v6 = [(UIView *)self layer];
  double v7 = v6;
  if (!v5)
  {
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    v22[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    v22[5] = v12;
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    void v22[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    v22[7] = v13;
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    v22[0] = *MEMORY[0x1E4F39B10];
    v22[1] = v14;
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    v22[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    v22[3] = v15;
    [v6 setTransform:v22];

    return;
  }
  uint64_t v8 = [v6 valueForKeyPath:@"transform.translation.y"];
  [v8 floatValue];
  CGFloat v10 = v9;

  memset(&v21, 0, sizeof(v21));
  CATransform3DMakeTranslation(&v21, 0.0, v10, 0.0);
  if (a3 > 1.0)
  {
    double v11 = (a3 + -1.0) * 0.025 + 1.0;
LABEL_7:
    CATransform3D v19 = v21;
    CATransform3DScale(&v20, &v19, v11, 1.0, 1.0);
    CATransform3D v21 = v20;
    goto LABEL_8;
  }
  if (a3 < 0.0)
  {
    double v11 = a3 * 0.025 + 1.0;
    goto LABEL_7;
  }
LABEL_8:
  CATransform3D v18 = v21;
  double v16 = [(UIView *)self layer];
  CATransform3D v17 = v18;
  [v16 setTransform:&v17];
}

- (BOOL)transitionIsVisible
{
  return 1;
}

- (void)finalizeTransition
{
  displayLink = self->_displayLink;
  if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    uint64_t v4 = self->_displayLink;
    self->_displayLink = 0;
  }
  [(UIKeyboardSplitTransitionView *)self updateWithProgress:self->_finishProgress];
  BOOL v5 = [(UIKeyboardSplitTransitionView *)self completionBlock];

  if (v5)
  {
    double v6 = [(UIKeyboardSplitTransitionView *)self completionBlock];
    v6[2]();

    [(UIKeyboardSplitTransitionView *)self setCompletionBlock:0];
  }
  id v7 = [(UIKeyboardSplitTransitionView *)self splitTransitionDelegate];
  objc_msgSend(v7, "transitionDidFinish:", -[UIKeyboardSplitTransitionView transitionIsVisible](self, "transitionIsVisible"));
}

- (void)transitionToFinalState:(id)a3
{
  [a3 timestamp];
  double v5 = v4;
  double finishProgress = self->_finishProgress;
  if (vabdd_f64(self->_currentProgress, finishProgress) < 0.01
    || (double v7 = v5 - self->_finalTransitionStartTime, finishDuration = self->_finishDuration, v7 >= finishDuration))
  {
    -[UIKeyboardSplitTransitionView updateWithProgress:](self, "updateWithProgress:");
    [(CADisplayLink *)self->_displayLink invalidate];
    displayLink = self->_displayLink;
    self->_displayLink = 0;

    [(UIKeyboardSplitTransitionView *)self finalizeTransition];
  }
  else
  {
    double v9 = self->_liftOffProgress + v7 / finishDuration * (finishProgress - self->_liftOffProgress);
    [(UIKeyboardSplitTransitionView *)self updateWithProgress:v9];
  }
}

- (void)finishWithProgress:(double)a3 completionBlock:(id)a4
{
  [(UIKeyboardSplitTransitionView *)self setCompletionBlock:a4];
  self->_double finishProgress = a3;
  self->_liftOffProgress = self->_currentProgress;
  if (+[UIView areAnimationsEnabled])
  {
    double currentProgress = self->_currentProgress;
    BOOL v7 = currentProgress >= 0.0 && currentProgress <= 1.0;
    double v8 = 3.0;
    if (!v7) {
      double v8 = 9.0;
    }
    self->_double finishDuration = vabdd_f64(currentProgress, self->_finishProgress) / v8;
    self->_finalTransitionStartTime = CACurrentMediaTime();
    double v9 = [(UIView *)self window];
    CGFloat v10 = [v9 screen];
    double v11 = [v10 displayLinkWithTarget:self selector:sel_transitionToFinalState_];
    displayLink = self->_displayLink;
    self->_displayLink = v11;

    long long v13 = self->_displayLink;
    id v14 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v13 addToRunLoop:v14 forMode:*MEMORY[0x1E4F1C4B0]];
  }
  else
  {
    self->_double currentProgress = self->_finishProgress;
    [(UIKeyboardSplitTransitionView *)self finalizeTransition];
  }
}

- (void)updateWithProgress:(double)a3
{
  if (!self->_isRebuilding)
  {
    if (a3 > 1.0 || a3 < 0.0) {
      [(UIKeyboardSplitTransitionView *)self transformForProgress:a3];
    }
    self->_double currentProgress = a3;
    double v5 = 1.0;
    if (a3 <= 1.0) {
      double v5 = a3;
    }
    if (a3 >= 0.0) {
      double v6 = v5;
    }
    else {
      double v6 = 0.0;
    }
    BOOL v7 = [(UIView *)self layer];
    [v7 setTimeOffset:v6];

    double v8 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v9 = [v8 preferencesActions];
    char v10 = [v9 currentInputModeSupportsCrescendo];

    if ((v10 & 1) == 0)
    {
      id v11 = [(UIKeyboardSplitTransitionView *)self splitTransitionDelegate];
      [v11 updateProgress:v6 startHeight:self->_startFrame.size.height endHeight:self->_endFrame.size.height];
    }
  }
}

- (BOOL)canDisplayTransition
{
  if (self->_isRebuilding) {
    return 0;
  }
  if ([(UIKeyboardSplitTransitionView *)self defaultKeyboardImage]) {
    return 1;
  }
  return [(UIKeyboardSplitTransitionView *)self splitKeyboardImage] != 0;
}

- (CGImage)defaultKeyboardImage
{
  return 0;
}

- (CGImage)splitKeyboardImage
{
  return 0;
}

- (CGImage)keyImageWithToken:(id)a3
{
  p_transitionDataSource = &self->_transitionDataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_transitionDataSource);
  double v6 = (CGImage *)[WeakRetained renderedImageWithToken:v4];

  return v6;
}

- (BOOL)showIntlKey
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionDataSource);
  char v3 = [WeakRetained showsInternationalKey];

  return v3;
}

- (BOOL)showDictationKey
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionDataSource);
  char v3 = [WeakRetained showsDictationKey];

  return v3;
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 456, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (UIKeyboardKeyplaneTransitionDelegate)splitTransitionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionDelegate);
  return (UIKeyboardKeyplaneTransitionDelegate *)WeakRetained;
}

- (void)setSplitTransitionDelegate:(id)a3
{
}

- (UIKeyboardSplitTransitionDataSource)splitTransitionDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionDataSource);
  return (UIKeyboardSplitTransitionDataSource *)WeakRetained;
}

- (void)setSplitTransitionDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliceSet, 0);
  objc_destroyWeak((id *)&self->_transitionDataSource);
  objc_destroyWeak((id *)&self->_transitionDelegate);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end