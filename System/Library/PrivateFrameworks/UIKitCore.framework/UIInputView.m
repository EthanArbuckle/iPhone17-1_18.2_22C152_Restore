@interface UIInputView
+ (void)_setupAppearanceIfNecessary;
- (BOOL)_disableSplitSupport;
- (BOOL)_isSplit;
- (BOOL)_isToolbars;
- (BOOL)_isTransitioning;
- (BOOL)_supportsSplit;
- (BOOL)_suppressBackgroundStyling;
- (BOOL)allowsSelfSizing;
- (BOOL)assertSizingWithPredictionBar;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)_defaultSize;
- (CGSize)leftContentViewSize;
- (CGSize)rightContentViewSize;
- (NSMutableDictionary)_mergedSliceMap;
- (NSMutableDictionary)_splitSliceMap;
- (UIEdgeInsets)backgroundEdgeInsets;
- (UIImage)_mergedImage;
- (UIImage)_splitImage;
- (UIInputView)initWithCoder:(NSCoder *)coder;
- (UIInputView)initWithFrame:(CGRect)a3;
- (UIInputView)initWithFrame:(CGRect)frame inputViewStyle:(UIInputViewStyle)inputViewStyle;
- (UIInputViewStyle)inputViewStyle;
- (UIView)leftContentView;
- (UIView)rightContentView;
- (double)_additionalClipHeight;
- (double)contentRatio;
- (id)_splitBorderedBackgroundWithCorners:(unint64_t)a3;
- (id)_toolbarBorderedBackground;
- (id)tintColor;
- (unint64_t)_clipCornersOfView:(id)a3;
- (void)_beginSplitTransitionIfNeeded:(double)a3 gapWidth:(double)a4;
- (void)_endSplitTransitionIfNeeded:(BOOL)a3;
- (void)_setDisableSplitSupport:(BOOL)a3;
- (void)_setLeftOffset:(double)a3 gapWidth:(double)a4;
- (void)_setNeedsContentSizeUpdate;
- (void)_setProgress:(double)a3 boundedBy:(double)a4;
- (void)_setRenderConfig:(id)a3;
- (void)_setSuppressBackgroundStyling:(BOOL)a3;
- (void)_updateClipCorners;
- (void)_updateWithSize:(CGSize)a3;
- (void)setAllowsSelfSizing:(BOOL)allowsSelfSizing;
- (void)setAssertSizingWithPredictionBar:(BOOL)a3;
- (void)setBackgroundEdgeInsets:(UIEdgeInsets)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentRatio:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setInputViewStyle:(int64_t)a3;
- (void)setLeftContentViewSize:(CGSize)a3;
- (void)setRightContentViewSize:(CGSize)a3;
- (void)set_mergedImage:(id)a3;
- (void)set_mergedSliceMap:(id)a3;
- (void)set_splitImage:(id)a3;
- (void)set_splitSliceMap:(id)a3;
@end

@implementation UIInputView

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v6.receiver = self;
  v6.super_class = (Class)UIInputView;
  -[UIView setFrame:](&v6, sel_setFrame_, a3.origin.x, a3.origin.y);
  -[UIInputView _updateWithSize:](self, "_updateWithSize:", width, height);
}

- (void)_setLeftOffset:(double)a3 gapWidth:(double)a4
{
  self->_gapWidth = a4;
  self->_leftOffset = a3;
  if (!self->_disableSplitSupport)
  {
    if (self->_gapWidth == 0.0)
    {
      [(UIInputView *)self contentRatio];
      double v7 = v6;
      [(UIView *)self frame];
      double v9 = ceil(v7 * v8);
      [(UIView *)self frame];
      double v11 = floor((1.0 - v7) * v10);
      [(UIView *)self frame];
      double height = v30.size.height;
      double v13 = 0.0;
      v30.origin.x = 0.0;
      v30.origin.y = 0.0;
      v30.size.double width = v9;
      double MaxX = CGRectGetMaxX(v30);
      double v15 = height;
      double v16 = 0.0;
    }
    else
    {
      [(UIView *)self frame];
      double v19 = v18 - a3 - a4;
      [(UIInputView *)self leftContentViewSize];
      double v15 = v20;
      [(UIInputView *)self rightContentViewSize];
      double height = v21;
      if (v15 - v21 > 0.0) {
        double v22 = v15 - v21;
      }
      else {
        double v22 = 0.0;
      }
      if (v15 - v21 < 0.0) {
        double v13 = 0.0;
      }
      else {
        double v13 = v22;
      }
      if (v15 - v21 < 0.0) {
        double v16 = -(v15 - v21);
      }
      else {
        double v16 = 0.0;
      }
      double v23 = 1.0 / UIKBScale();
      double v9 = a3 - v23;
      [(UIView *)self bounds];
      double MaxX = v23 + v24 - v19;
      double v11 = v19 - v23;
    }
    -[UIView setFrame:](self->_leftContentView, "setFrame:", 0.0, v16, v9, v15);
    -[UIView setFrame:](self->_rightContentView, "setFrame:", MaxX, v13, v11, height);
    [(UIInputView *)self _updateClipCorners];
    v31.origin.x = 0.0;
    v31.origin.y = v16;
    v31.size.double width = v9;
    v31.size.double height = v15;
    double v25 = CGRectGetHeight(v31);
    v32.origin.x = MaxX;
    v32.origin.y = v13;
    v32.size.double width = v11;
    v32.size.double height = height;
    double v26 = CGRectGetHeight(v32);
    if (v25 >= v26) {
      double v27 = v25;
    }
    else {
      double v27 = v26;
    }
    [(UIView *)self frame];
    if (v27 != v28)
    {
      [(UIView *)self frame];
      -[UIInputView setFrame:](self, "setFrame:");
    }
  }
}

- (double)contentRatio
{
  return self->_contentRatio;
}

- (void)_updateClipCorners
{
  [(_UIInputViewContent *)self->_leftContentView _updateCornerClipping];
  [(_UIInputViewContent *)self->_rightContentView _updateCornerClipping];
  double gapWidth = self->_gapWidth;
  v4 = [(UIView *)self _inheritedRenderConfig];
  int v5 = [v4 lightKeyboard];

  if (gapWidth <= 0.0)
  {
    if (v5)
    {
      id v8 = [(UIInputView *)self _toolbarBorderedBackground];
      [(_UIInputViewContent *)self->_leftContentView _setToolbarBackgroundViewWithImage:v8];
      [(_UIInputViewContent *)self->_rightContentView _setToolbarBackgroundViewWithImage:v8];
      goto LABEL_6;
    }
  }
  else if (v5)
  {
    id v8 = [(UIInputView *)self _splitBorderedBackgroundWithCorners:2];
    [(_UIInputViewContent *)self->_leftContentView _setToolbarBackgroundViewWithImage:v8];
    double v6 = [(UIInputView *)self _splitBorderedBackgroundWithCorners:1];
    [(_UIInputViewContent *)self->_rightContentView _setToolbarBackgroundViewWithImage:v6];

LABEL_6:

    return;
  }
  [(_UIInputViewContent *)self->_leftContentView _setToolbarBackgroundViewWithImage:0];
  rightContentView = self->_rightContentView;
  [(_UIInputViewContent *)rightContentView _setToolbarBackgroundViewWithImage:0];
}

- (id)_toolbarBorderedBackground
{
  [(UIView *)self frame];
  if (CGRectIsEmpty(v29))
  {
    v3 = 0;
  }
  else
  {
    if (qword_1EB25D538 != -1) {
      dispatch_once(&qword_1EB25D538, &__block_literal_global_123);
    }
    v4 = (void *)qword_1EB25D530;
    int v5 = NSNumber;
    [(UIView *)self frame];
    double v7 = [v5 numberWithDouble:v6];
    v3 = [v4 objectForKey:v7];

    if (!v3)
    {
      [(UIView *)self frame];
      double v9 = v8;
      double v10 = 1.0 / UIKBScale();
      double v11 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", 0.0, 0.0, 1.0, v9, 0.0, v10 + 0.0, 1.0, v9 - v10);
      v12 = +[UIKBRenderTraits traitsWithGeometry:v11];
      double v13 = [[_UIBackdropViewSettingsUltraLight alloc] initWithDefaultValues];
      [(_UIBackdropViewSettings *)v13 grayscaleTintLevel];
      double v15 = v14;
      [(_UIBackdropViewSettings *)v13 grayscaleTintAlpha];
      v17 = +[UIColor colorWithWhite:v15 alpha:v16];
      double v18 = +[UIKBColorGradient gradientWithUIColor:v17];
      [v12 setBackgroundGradient:v18];

      double v19 = +[UIKBEdgeEffect effectWithColor:@"UIKBColorBlack_Alpha30" edges:1 inset:-v10 weight:v10];
      [v12 addRenderEffect:v19];

      double v20 = UIKBScale();
      double v21 = +[UIKBRenderer rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:](UIKBRenderer, "rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:", 0, 0, 7, UIKeyboardGetCurrentIdiom(), 1.0, v9, v20);
      [v21 renderBackgroundTraits:v12];
      double v22 = [v21 renderedImage];
      v3 = objc_msgSend(v22, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);

      double v23 = (void *)qword_1EB25D530;
      double v24 = NSNumber;
      [(UIView *)self frame];
      double v26 = [v24 numberWithDouble:v25];
      [v23 setObject:v3 forKey:v26];
    }
  }
  return v3;
}

- (unint64_t)_clipCornersOfView:(id)a3
{
  if (self->_gapWidth == 0.0) {
    return 0;
  }
  id v5 = a3;
  double v6 = [(UIView *)self superview];
  unint64_t v7 = [v6 _clipCornersOfView:v5];

  return v7;
}

- (double)_additionalClipHeight
{
  return 0.0;
}

- (void)_updateWithSize:(CGSize)a3
{
  if (self->_gapWidth == 0.0) {
    [(UIInputView *)self _setLeftOffset:0.0 gapWidth:0.0];
  }
}

- (UIInputView)initWithFrame:(CGRect)frame inputViewStyle:(UIInputViewStyle)inputViewStyle
{
  v18.receiver = self;
  v18.super_class = (Class)UIInputView;
  id v5 = -[UIView initWithFrame:](&v18, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  double v6 = v5;
  if (v5)
  {
    v5->_disableSplitSupport = [(UIInputView *)v5 conformsToProtocol:&unk_1ED50E3A0] ^ 1;
    v6->_style = inputViewStyle;
    [(id)objc_opt_class() _setupAppearanceIfNecessary];
    v6->_contentRatio = 0.5;
    unint64_t v7 = [_UIInputViewContent alloc];
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v12 = -[_UIInputViewContent initWithFrame:inputView:](v7, "initWithFrame:inputView:", v6, *MEMORY[0x1E4F1DB28], v9, v10, v11);
    leftContentView = v6->_leftContentView;
    v6->_leftContentView = (_UIInputViewContent *)v12;

    double v14 = -[_UIInputViewContent initWithFrame:inputView:]([_UIInputViewContent alloc], "initWithFrame:inputView:", v6, v8, v9, v10, v11);
    rightContentView = v6->_rightContentView;
    v6->_rightContentView = v14;

    [(UIView *)v6->_rightContentView setAutoresizingMask:1];
    [(_UIInputViewContent *)v6->_leftContentView set_unclippableCorners:5];
    [(_UIInputViewContent *)v6->_rightContentView set_unclippableCorners:10];
    *(_OWORD *)&v6->_backgroundEdgeInsets.top = 0u;
    *(_OWORD *)&v6->_backgroundEdgeInsets.bottom = 0u;
    [(UIView *)v6 addSubview:v6->_leftContentView];
    [(UIView *)v6 addSubview:v6->_rightContentView];
    [(UIInputView *)v6 _setLeftOffset:0.0 gapWidth:0.0];
    double v16 = v6;
  }

  return v6;
}

+ (void)_setupAppearanceIfNecessary
{
  if ((dyld_program_sdk_at_least() & 1) == 0 && _setupAppearanceIfNecessary_onceToken != -1)
  {
    dispatch_once(&_setupAppearanceIfNecessary_onceToken, &__block_literal_global_314);
  }
}

- (UIInputView)initWithFrame:(CGRect)a3
{
  return -[UIInputView initWithFrame:inputViewStyle:](self, "initWithFrame:inputViewStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIInputView)initWithCoder:(NSCoder *)coder
{
  v4.receiver = self;
  v4.super_class = (Class)UIInputView;
  return [(UIView *)&v4 initWithCoder:coder];
}

void __42__UIInputView__setupAppearanceIfNecessary__block_invoke()
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = +[UIPeripheralHost hostViewClass];
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v1 = +[UIView appearanceMatchingProperties:&unk_1ED3F7938 whenContainedInInstancesOfClasses:v0];
  v2 = +[UIView appearanceMatchingProperties:&unk_1ED3F7938 whenContainedInInstancesOfClasses:v0];
  v3 = [[_UIBackdropViewSettingsUltraLight alloc] initWithDefaultValues];
  [(_UIBackdropViewSettings *)v3 grayscaleTintLevel];
  double v5 = v4;
  [(_UIBackdropViewSettings *)v3 grayscaleTintAlpha];
  unint64_t v7 = +[UIColor colorWithWhite:v5 alpha:v6];
  [v1 setBackgroundColor:v7];
  [v2 setBackgroundColor:v7];
}

- (void)setAllowsSelfSizing:(BOOL)allowsSelfSizing
{
  BOOL v3 = self->_allowsSelfSizing;
  self->_allowsSelfSizing = allowsSelfSizing;
  if (v3 != allowsSelfSizing)
  {
    id v6 = +[UIKBKeyplaneChangeContext keyplaneChangeContext];
    [v6 setSelfSizingChanged:1];
    double v5 = [(UIView *)self superview];
    [v5 _didChangeKeyplaneWithContext:v6];
  }
}

- (void)setAssertSizingWithPredictionBar:(BOOL)a3
{
  BOOL assertSizingWithPredictionBar = self->_assertSizingWithPredictionBar;
  self->_BOOL assertSizingWithPredictionBar = a3;
  if (assertSizingWithPredictionBar != a3)
  {
    id v6 = +[UIKBKeyplaneChangeContext keyplaneChangeContext];
    [v6 setSelfSizingChanged:1];
    double v5 = [(UIView *)self superview];
    [v5 _didChangeKeyplaneWithContext:v6];
  }
}

- (id)tintColor
{
  if ([(UIView *)self _lightStyleRenderConfig]) {
    +[UIColor whiteColor];
  }
  else {
  v2 = +[UIColor blackColor];
  }
  return v2;
}

- (BOOL)_suppressBackgroundStyling
{
  return self->_suppressBackgroundStyling;
}

- (void)_setSuppressBackgroundStyling:(BOOL)a3
{
  self->_suppressBackgroundStyling = a3;
}

- (BOOL)_disableSplitSupport
{
  return self->_disableSplitSupport;
}

- (void)_setDisableSplitSupport:(BOOL)a3
{
  self->_disableSplitSupport = a3;
}

- (void)_setRenderConfig:(id)a3
{
  id v5 = a3;
  renderConfig = self->_renderConfig;
  if (renderConfig)
  {
    BOOL v7 = [(UIKBRenderConfig *)renderConfig lightKeyboard];
    int v8 = v7 ^ [v5 lightKeyboard];
  }
  else
  {
    int v8 = 1;
  }
  objc_storeStrong((id *)&self->_renderConfig, a3);
  [(UIView *)self->_leftContentView _setRenderConfig:v5];
  [(UIView *)self->_rightContentView _setRenderConfig:v5];
  if (v8) {
    [(UIInputView *)self _updateClipCorners];
  }
  double v9 = [(UIView *)self _rootInputWindowController];
  double v10 = [v9 _inputAssistantView];
  BOOL v11 = [(UIView *)self isDescendantOfView:v10];

  if (!v11)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __32__UIInputView__setRenderConfig___block_invoke;
    v12[3] = &unk_1E52D9F70;
    v12[4] = self;
    +[UIView _performSystemAppearanceModifications:v12];
  }
}

void __32__UIInputView__setRenderConfig___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 _screen];
  objc_msgSend(v1, "_didChangeFromIdiom:onScreen:traverseHierarchy:", objc_msgSend(v2, "_userInterfaceIdiom"), 0, 1);
}

- (void)setInputViewStyle:(int64_t)a3
{
  self->_style = a3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (!self->_disableSplitSupport && (leftContentView = self->_leftContentView) != 0 && self->_rightContentView)
  {
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", self->_leftContentView, x, y);
    if (-[UIView pointInside:withEvent:](leftContentView, "pointInside:withEvent:", v7))
    {
      BOOL v9 = 1;
      goto LABEL_4;
    }
    rightContentView = self->_rightContentView;
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", rightContentView, x, y);
    unsigned __int8 v8 = -[UIView pointInside:withEvent:](rightContentView, "pointInside:withEvent:", v7);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UIInputView;
    unsigned __int8 v8 = -[UIView pointInside:withEvent:](&v13, sel_pointInside_withEvent_, v7, x, y);
  }
  BOOL v9 = v8;
LABEL_4:

  return v9;
}

- (BOOL)_isToolbars
{
  [(UIInputView *)self leftContentViewSize];
  if (v3 == 0.0 || (BOOL v4 = [(_UIInputViewContent *)self->_leftContentView _isToolbar]))
  {
    [(UIInputView *)self rightContentViewSize];
    if (v5 == 0.0)
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      rightContentView = self->_rightContentView;
      LOBYTE(v4) = [(_UIInputViewContent *)rightContentView _isToolbar];
    }
  }
  return v4;
}

- (BOOL)_isSplit
{
  return self->_gapWidth > 0.0;
}

- (void)_setNeedsContentSizeUpdate
{
}

- (BOOL)_supportsSplit
{
  [(UIInputView *)self leftContentViewSize];
  if (v3 != 0.0) {
    return 1;
  }
  [(UIInputView *)self rightContentViewSize];
  return v5 != 0.0;
}

- (void)_setProgress:(double)a3 boundedBy:(double)a4
{
  if (a3 >= 0.0)
  {
    double v6 = a3;
    [(UIInputView *)self contentRatio];
    self->_transitionRatio = v8;
    if (a4 <= 0.0)
    {
      double v12 = v8;
    }
    else
    {
      if (1.0 / (1.0 - a4) * v6 - 1.0 / (1.0 - a4) * a4 >= 0.0) {
        double v9 = 1.0 / (1.0 - a4) * v6 - 1.0 / (1.0 - a4) * a4;
      }
      else {
        double v9 = 0.0;
      }
      if (v6 < a4) {
        double v10 = 1.0 / a4 * v6;
      }
      else {
        double v10 = 1.0;
      }
      [(UIInputView *)self contentRatio];
      double v12 = (1.0 - v10) * (v11 + -0.5) + 0.5;
      self->_transitionRatio = v12;
      double v6 = v9;
    }
    double v13 = round(v6 * self->_transitionGap);
    [(UIView *)self frame];
    double v15 = round(self->_transitionLeftOffset + (1.0 - v6) * (ceil(v12 * v14) - self->_transitionLeftOffset));
    [(UIInputView *)self _setLeftOffset:v15 gapWidth:v13];
  }
}

- (BOOL)_isTransitioning
{
  return self->_isTransitioning;
}

- (void)_beginSplitTransitionIfNeeded:(double)a3 gapWidth:(double)a4
{
  if (![(UIInputView *)self _isTransitioning])
  {
    self->_transitionGap = a4;
    self->_transitionLeftOffset = a3;
    self->_isTransitioning = 1;
    [(UIInputView *)self willBeginSplitTransition];
  }
}

- (void)_endSplitTransitionIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIInputView *)self _isTransitioning])
  {
    self->_isTransitioning = 0;
    if (v3)
    {
      [(UIInputView *)self _setLeftOffset:self->_transitionLeftOffset gapWidth:self->_transitionGap];
      [(UIInputView *)self didEndSplitTransition];
      double transitionLeftOffset = self->_transitionLeftOffset;
      double transitionGap = self->_transitionGap;
    }
    else
    {
      [(UIInputView *)self _setLeftOffset:0.0 gapWidth:0.0];
      [(UIInputView *)self didEndSplitTransition];
      double transitionLeftOffset = 0.0;
      double transitionGap = 0.0;
    }
    [(UIInputView *)self _setLeftOffset:transitionLeftOffset gapWidth:transitionGap];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v6.receiver = self;
  v6.super_class = (Class)UIInputView;
  -[UIView setBounds:](&v6, sel_setBounds_, a3.origin.x, a3.origin.y);
  -[UIInputView _updateWithSize:](self, "_updateWithSize:", width, height);
}

- (id)_splitBorderedBackgroundWithCorners:(unint64_t)a3
{
  [(UIView *)self frame];
  if (CGRectIsEmpty(v43))
  {
    id v5 = 0;
  }
  else
  {
    if (qword_1EB25D528 != -1) {
      dispatch_once(&qword_1EB25D528, &__block_literal_global_114_0);
    }
    objc_super v6 = (void *)_MergedGlobals_7_4;
    id v7 = [NSNumber numberWithUnsignedInteger:a3];
    double v8 = [v6 objectForKey:v7];

    if (v8)
    {
      id v5 = v8;
    }
    else
    {
      double v9 = +[UIKeyboardPreferencesController sharedPreferencesController];
      double v10 = [v9 preferencesActions];
      [v10 rivenSizeFactor:10.0];
      double v12 = v11;

      double v13 = v12 + v12;
      [(UIView *)self frame];
      double v15 = v14;
      double v16 = UIKBScale();
      if (a3 == 1) {
        unint64_t v17 = 2;
      }
      else {
        unint64_t v17 = 8 * (a3 == 2);
      }
      double v18 = 1.0 / v16;
      double v19 = UIRectInsetEdges(v17 | 1u, 0.0, 0.0, v12 + v12, v15, 1.0 / v16);
      double v23 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", 0.0, 0.0, v12 + v12, v15, v19, v20, v21, v22);
      [v23 setRoundRectRadius:v12];
      [v23 setRoundRectCorners:a3];
      double v24 = +[UIKBRenderTraits traitsWithGeometry:v23];
      double v25 = [[_UIBackdropViewSettingsUltraLight alloc] initWithDefaultValues];
      [(_UIBackdropViewSettings *)v25 grayscaleTintLevel];
      double v27 = v26;
      [(_UIBackdropViewSettings *)v25 grayscaleTintAlpha];
      CGRect v29 = +[UIColor colorWithWhite:v27 alpha:v28];
      CGRect v30 = +[UIKBColorGradient gradientWithUIColor:v29];
      [v24 setBackgroundGradient:v30];

      CGRect v31 = +[UIKBEdgeEffect effectWithColor:@"UIKBColorBlack_Alpha30" edges:v17 | 1 inset:-v18 weight:v18];
      [v24 addRenderEffect:v31];

      double v32 = UIKBScale();
      v33 = +[UIKBRenderer rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:](UIKBRenderer, "rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:", 0, 0, 7, UIKeyboardGetCurrentIdiom(), v13, v15, v32);
      [v33 renderBackgroundTraits:v24];
      v34 = [v33 renderedImage];
      if (v34)
      {
        v35 = v34;
        if ((v17 & 2) != 0) {
          double v36 = v13;
        }
        else {
          double v36 = 0.0;
        }
        if (v17 >= 8) {
          double v37 = v13;
        }
        else {
          double v37 = 0.0;
        }
        v38 = objc_msgSend(v34, "resizableImageWithCapInsets:", 0.0, v36, 0.0, v37);

        v39 = (void *)_MergedGlobals_7_4;
        v40 = [NSNumber numberWithUnsignedInteger:a3];
        [v39 setObject:v38 forKey:v40];
      }
      else
      {
        v38 = 0;
      }
      id v5 = v38;
    }
  }
  return v5;
}

void __51__UIInputView__splitBorderedBackgroundWithCorners___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_MergedGlobals_7_4;
  _MergedGlobals_7_4 = (uint64_t)v0;
}

void __41__UIInputView__toolbarBorderedBackground__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)qword_1EB25D530;
  qword_1EB25D530 = (uint64_t)v0;
}

- (CGSize)_defaultSize
{
  [(UIView *)self frame];
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (CGSize)leftContentViewSize
{
  double width = self->_leftContentSize.width;
  double height = self->_leftContentSize.height;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    [(_UIInputViewContent *)self->_leftContentView _contentSize];
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)rightContentViewSize
{
  double width = self->_rightContentSize.width;
  double height = self->_rightContentSize.height;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    [(_UIInputViewContent *)self->_rightContentView _contentSize];
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIInputViewStyle)inputViewStyle
{
  return self->_style;
}

- (BOOL)allowsSelfSizing
{
  return self->_allowsSelfSizing;
}

- (BOOL)assertSizingWithPredictionBar
{
  return self->_assertSizingWithPredictionBar;
}

- (UIView)leftContentView
{
  return &self->_leftContentView->super;
}

- (UIView)rightContentView
{
  return &self->_rightContentView->super;
}

- (void)setContentRatio:(double)a3
{
  self->_contentRatio = a3;
}

- (void)setLeftContentViewSize:(CGSize)a3
{
  self->_leftContentSize = a3;
}

- (void)setRightContentViewSize:(CGSize)a3
{
  self->_rightContentSize = a3;
}

- (UIImage)_mergedImage
{
  return self->_mergedImage;
}

- (void)set_mergedImage:(id)a3
{
}

- (UIImage)_splitImage
{
  return self->_splitImage;
}

- (void)set_splitImage:(id)a3
{
}

- (NSMutableDictionary)_mergedSliceMap
{
  return self->_mergedSliceMap;
}

- (void)set_mergedSliceMap:(id)a3
{
}

- (NSMutableDictionary)_splitSliceMap
{
  return self->_splitSliceMap;
}

- (void)set_splitSliceMap:(id)a3
{
}

- (UIEdgeInsets)backgroundEdgeInsets
{
  double top = self->_backgroundEdgeInsets.top;
  double left = self->_backgroundEdgeInsets.left;
  double bottom = self->_backgroundEdgeInsets.bottom;
  double right = self->_backgroundEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBackgroundEdgeInsets:(UIEdgeInsets)a3
{
  self->_backgroundEdgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionLayer, 0);
  objc_storeStrong((id *)&self->_visibleLayers, 0);
  objc_storeStrong((id *)&self->_splitSliceMap, 0);
  objc_storeStrong((id *)&self->_mergedSliceMap, 0);
  objc_storeStrong((id *)&self->_splitImage, 0);
  objc_storeStrong((id *)&self->_mergedImage, 0);
  objc_storeStrong((id *)&self->_rightContentView, 0);
  objc_storeStrong((id *)&self->_leftContentView, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
}

@end