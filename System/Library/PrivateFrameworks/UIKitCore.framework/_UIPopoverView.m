@interface _UIPopoverView
+ (id)popoverViewContainingView:(id)a3;
- (BOOL)_allowsCustomizationOfContent;
- (BOOL)_definesTintColor;
- (BOOL)_needsLayoutOnAnimatedFrameChangeForNewFrame:(CGRect)a3;
- (BOOL)chromeHidden;
- (BOOL)chromeHiddenForSizeTransition;
- (BOOL)contentExtendsOverArrow;
- (BOOL)showsBackgroundComponentHighlights;
- (BOOL)showsBackgroundViewHighlight;
- (BOOL)showsContentViewHighlight;
- (CGRect)_snapshotBounds;
- (CGSize)contentSize;
- (UIActionSheet)presentedActionSheet;
- (UIColor)arrowBackgroundColor;
- (UIColor)popoverBackgroundColor;
- (UIEdgeInsets)safeAreaInsetsForContentView;
- (UIPopoverController)popoverController;
- (_UIPopoverView)initWithFrame:(CGRect)a3;
- (_UIPopoverView)initWithFrame:(CGRect)a3 backgroundViewClass:(Class)a4;
- (_UIPopoverView)initWithFrame:(CGRect)a3 backgroundViewClass:(Class)a4 embeddedInView:(BOOL)a5 contentExtendsOverArrow:(BOOL)a6;
- (_UIRoundedRectShadowView)shadowView;
- (double)_customCornerRadius;
- (double)animationOvershootHeight;
- (double)arrowOffset;
- (id)_normalInheritedTintColor;
- (id)_traitCollectionForChildEnvironment:(id)a3;
- (id)backgroundView;
- (id)contentView;
- (id)standardChromeView;
- (int)_style;
- (int64_t)backgroundBlurEffectStyle;
- (int64_t)backgroundStyle;
- (unint64_t)arrowDirection;
- (void)_hideArrow;
- (void)_performBlockCheckingDefinesTintColor:(id)a3;
- (void)_setCornerRadius:(double)a3;
- (void)_setCustomCornerRadius:(double)a3;
- (void)_setFrame:(CGRect)a3 arrowOffset:(double)a4;
- (void)_setPopoverContentView:(id)a3;
- (void)_showArrow;
- (void)_updateAlphaForChromeHidden;
- (void)layoutSubviews;
- (void)setAnimationOvershootHeight:(double)a3;
- (void)setArrowBackgroundColor:(id)a3;
- (void)setArrowDirection:(unint64_t)a3;
- (void)setArrowOffset:(double)a3;
- (void)setBackgroundBlurEffectStyle:(int64_t)a3;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setChromeHidden:(BOOL)a3;
- (void)setChromeHiddenForSizeTransition:(BOOL)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setPopoverBackgroundColor:(id)a3;
- (void)setPopoverController:(id)a3;
- (void)setPresentedActionSheet:(id)a3;
- (void)setShadowView:(id)a3;
- (void)setShowsBackgroundComponentHighlights:(BOOL)a3;
- (void)setShowsBackgroundViewHighlight:(BOOL)a3;
- (void)setShowsContentViewHighlight:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIPopoverView

- (void)_setFrame:(CGRect)a3 arrowOffset:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10 = [(_UIPopoverView *)self standardChromeView];
  if ([v10 usesImagesForShapeMasking])
  {
    BOOL v14 = 0;
    if ([v10 useShortMode])
    {
      +[_UIPopoverStandardChromeView contentViewInsets];
      double v12 = v11 + 44.0;
      +[_UIPopoverStandardChromeView contentViewInsets];
      if (height > v12 + v13) {
        BOOL v14 = 1;
      }
    }
    if ([v10 isPinned]
      && ([(UIView *)self frame],
          v29.origin.double x = x,
          v29.origin.double y = y,
          v29.size.double width = width,
          v29.size.double height = height,
          !CGRectEqualToRect(v28, v29))
      && ([v10 arrowOffset], vabdd_f64(a4, v15) >= 2.22044605e-16))
    {
      -[UIView _setFrameIgnoringLayerTransform:](self, "_setFrameIgnoringLayerTransform:", x, y, width, height);
    }
    else
    {
      -[UIView _setFrameIgnoringLayerTransform:](self, "_setFrameIgnoringLayerTransform:", x, y, width, height);
      if (!v14) {
        goto LABEL_16;
      }
    }
    id v16 = objc_alloc(+[_UIPopoverStandardChromeView standardChromeViewClass]);
    [(UIView *)self bounds];
    v17 = objc_msgSend(v16, "initWithFrame:");
    [v17 setArrowOffset:a4];
    objc_msgSend(v17, "setArrowDirection:", -[_UIPopoverView arrowDirection](self, "arrowDirection"));
    objc_msgSend(v17, "setBackgroundStyle:", -[_UIPopoverView backgroundStyle](self, "backgroundStyle"));
    objc_msgSend(v17, "_setBackgroundBlurEffectStyle:", -[_UIPopoverView backgroundBlurEffectStyle](self, "backgroundBlurEffectStyle"));
    v18 = [(_UIPopoverView *)self popoverBackgroundColor];
    [v17 setPopoverBackgroundColor:v18];

    [v17 _setCustomCornerRadius:self->_customCornerRadius];
    if ([(_UIPopoverView *)self contentExtendsOverArrow]) {
      [v17 setViewToMaskWhenContentExtendsOverArrow:self->_clipView];
    }
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __40___UIPopoverView__setFrame_arrowOffset___block_invoke;
    v25 = &unk_1E52D9F98;
    v26 = self;
    v19 = v17;
    v27 = v19;
    +[UIView performWithoutAnimation:&v22];
    backgroundView = self->_backgroundView;
    self->_backgroundView = v19;
    v21 = v19;
  }
  else
  {
    -[UIView _setFrameIgnoringLayerTransform:](self, "_setFrameIgnoringLayerTransform:", x, y, width, height);
  }
LABEL_16:
  -[_UIPopoverView setArrowOffset:](self, "setArrowOffset:", a4, v22, v23, v24, v25, v26);
  [(UIView *)self setNeedsLayout];
  [(UIView *)self layoutIfNeeded];
}

- (void)setArrowOffset:(double)a3
{
  [(UIPopoverBackgroundView *)self->_backgroundView setArrowOffset:a3];
  [(UIView *)self setNeedsLayout];
}

+ (id)popoverViewContainingView:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v4 = [v3 superview];

      id v3 = (id)v4;
    }
    while (v4);
  }
  return v3;
}

- (void)setArrowDirection:(unint64_t)a3
{
  if ([(UIPopoverBackgroundView *)self->_backgroundView arrowDirection] != a3)
  {
    if (self->_backgroundView
      && ([(UIView *)self window], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v6 = (void *)v5,
          [(_UIPopoverView *)self standardChromeView],
          v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      id v8 = objc_alloc(self->_backgroundViewClass);
      [(UIView *)self bounds];
      v9 = objc_msgSend(v8, "initWithFrame:");
      [(_UIPopoverView *)self arrowOffset];
      objc_msgSend(v9, "setArrowOffset:");
      [v9 setArrowDirection:a3];
      objc_msgSend(v9, "setBackgroundStyle:", -[_UIPopoverView backgroundStyle](self, "backgroundStyle"));
      objc_msgSend(v9, "_setBackgroundBlurEffectStyle:", -[_UIPopoverView backgroundBlurEffectStyle](self, "backgroundBlurEffectStyle"));
      v10 = [(_UIPopoverView *)self popoverBackgroundColor];
      [v9 setPopoverBackgroundColor:v10];

      [(_UIPopoverView *)self _customCornerRadius];
      objc_msgSend(v9, "_setCustomCornerRadius:");
      if ([(_UIPopoverView *)self contentExtendsOverArrow]) {
        [v9 setViewToMaskWhenContentExtendsOverArrow:self->_clipView];
      }
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      id v16 = __36___UIPopoverView_setArrowDirection___block_invoke;
      v17 = &unk_1E52D9F98;
      v18 = self;
      double v11 = v9;
      v19 = v11;
      +[UIView performWithoutAnimation:&v14];
      backgroundView = self->_backgroundView;
      self->_backgroundView = v11;
      double v13 = v11;
    }
    else
    {
      [(UIPopoverBackgroundView *)self->_backgroundView setArrowDirection:a3];
    }
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_performBlockCheckingDefinesTintColor:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  BOOL v5 = [(_UIPopoverView *)self _definesTintColor];
  v4[2](v4);

  if (v5 != [(_UIPopoverView *)self _definesTintColor])
  {
    -[UIView _dispatchTintColorVisitorWithReasons:](self, 1);
  }
}

- (BOOL)_definesTintColor
{
  v8.receiver = self;
  v8.super_class = (Class)_UIPopoverView;
  if ([(UIView *)&v8 _definesTintColor]) {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)_UIPopoverView;
  uint64_t v4 = [(UIView *)&v7 _normalInheritedTintColor];
  BOOL v5 = [(_UIPopoverView *)self _normalInheritedTintColor];
  BOOL v3 = v4 != v5;

  return v3;
}

- (_UIPopoverView)initWithFrame:(CGRect)a3 backgroundViewClass:(Class)a4 embeddedInView:(BOOL)a5 contentExtendsOverArrow:(BOOL)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v39[1] = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    v37 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 0, a5);
    [v37 handleFailureInMethod:a2, self, @"_UIPopoverView.m", 66, @"Invalid parameter not satisfying: %@", @"backgroundViewClass" object file lineNumber description];
  }
  v38.receiver = self;
  v38.super_class = (Class)_UIPopoverView;
  double v13 = -[UIView initWithFrame:](&v38, sel_initWithFrame_, x, y, width, height);
  uint64_t v14 = v13;
  if (v13)
  {
    v13->_backgroundViewClass = a4;
    uint64_t v15 = objc_msgSend([a4 alloc], "initWithFrame:", x, y, width, height);
    backgroundView = v14->_backgroundView;
    v14->_backgroundView = (UIPopoverBackgroundView *)v15;

    v14->_contentExtendsOverArrow = a6;
    [(objc_class *)v14->_backgroundViewClass cornerRadius];
    v14->_customCornerRadius = v17;
    v18 = [(_UIPopoverView *)v14 standardChromeView];

    if (v18)
    {
      [(UIView *)v14 frame];
      double v20 = v19;
      +[_UIPopoverStandardChromeView contentViewInsets];
      double v22 = v21 + 44.0;
      +[_UIPopoverStandardChromeView contentViewInsets];
      if (v20 <= v22 + v23)
      {
        [(UIPopoverBackgroundView *)v14->_backgroundView setUseShortMode:1];
        [(UIPopoverBackgroundView *)v14->_backgroundView setArrowOffset:0.0];
      }
    }
    v24 = [UIView alloc];
    [(UIPopoverBackgroundView *)v14->_backgroundView _contentViewFrame];
    uint64_t v25 = -[UIView initWithFrame:](v24, "initWithFrame:");
    contentView = v14->_contentView;
    v14->_contentView = (UIView *)v25;

    [(UIView *)v14->_contentView _setContinuousCornerRadius:v14->_customCornerRadius];
    v14->_contentSize = (CGSize)*MEMORY[0x1E4F1DB30];
    [(UIView *)v14->_contentView _setOverrideVibrancyTrait:1];
    [(UIView *)v14->_contentView setClipsToBounds:1];
    if ([(_UIPopoverView *)v14 contentExtendsOverArrow])
    {
      v27 = [UIView alloc];
      [(UIView *)v14 bounds];
      uint64_t v28 = -[UIView initWithFrame:](v27, "initWithFrame:");
      clipView = v14->_clipView;
      v14->_clipView = (UIView *)v28;

      [(UIView *)v14->_clipView setClipsToBounds:1];
      [(UIView *)v14 addSubview:v14->_clipView];
      [(UIView *)v14->_clipView addSubview:v14->_backgroundView];
      [(UIView *)v14->_clipView addSubview:v14->_contentView];
      v30 = [(_UIPopoverView *)v14 standardChromeView];
      [v30 setViewToMaskWhenContentExtendsOverArrow:v14->_clipView];

      v31 = (_UIPopoverView *)v14->_clipView;
    }
    else
    {
      [(UIView *)v14 addSubview:v14->_backgroundView];
      [(UIView *)v14 addSubview:v14->_contentView];
      v31 = v14;
    }
    v32 = [(UIView *)v31 layer];
    [v32 setAllowsGroupOpacity:1];

    v39[0] = objc_opt_class();
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    id v34 = [(UIView *)v14 registerForTraitChanges:v33 withHandler:&__block_literal_global_665];
  }
  return v14;
}

- (double)arrowOffset
{
  [(UIPopoverBackgroundView *)self->_backgroundView arrowOffset];
  return result;
}

- (void)layoutSubviews
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ([(_UIPopoverView *)self contentExtendsOverArrow])
  {
    clipView = self->_clipView;
    [(UIView *)self bounds];
    -[UIView setFrame:](clipView, "setFrame:");
  }
  backgroundView = self->_backgroundView;
  [(UIView *)self bounds];
  -[UIView setFrame:](backgroundView, "setFrame:");
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  BOOL v6 = *MEMORY[0x1E4F1DB30] == self->_contentSize.width && v5 == self->_contentSize.height;
  if (v6 || ![(_UIPopoverView *)self contentExtendsOverArrow])
  {
    contentView = self->_contentView;
    [(UIPopoverBackgroundView *)self->_backgroundView _contentViewFrame];
    objc_super v7 = contentView;
  }
  else
  {
    objc_super v7 = self->_contentView;
    double width = self->_contentSize.width;
    double height = self->_contentSize.height;
    double v10 = 0.0;
    double v11 = 0.0;
  }
  -[UIView setFrame:](v7, "setFrame:", v10, v11, width, height);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v13 = [(UIView *)self->_contentView subviews];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [(UIView *)self->_contentView bounds];
        objc_msgSend(v18, "setFrame:");
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);
  }

  if (self->_shadowView)
  {
    [(UIView *)self bounds];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    switch([(_UIPopoverView *)self arrowDirection])
    {
      case 0uLL:
      case 2uLL:
        [(id)objc_opt_class() arrowHeight];
        double v20 = v20 + 0.0;
        double v22 = v22 + 0.0;
        goto LABEL_21;
      case 1uLL:
        [(id)objc_opt_class() arrowHeight];
        double v20 = v20 + 0.0;
        double v22 = v22 + v27;
LABEL_21:
        double v26 = v26 - (v27 + 0.0);
        break;
      case 4uLL:
        [(id)objc_opt_class() arrowHeight];
        double v20 = v20 + v28;
        goto LABEL_24;
      case 8uLL:
        [(id)objc_opt_class() arrowHeight];
        double v20 = v20 + 0.0;
LABEL_24:
        double v24 = v24 - (v28 + 0.0);
        double v22 = v22 + 0.0;
        break;
      default:
        break;
    }
    -[_UIRoundedRectShadowView frameWithContentWithFrame:](self->_shadowView, "frameWithContentWithFrame:", v20, v22, v24, v26);
    -[UIView _setFrameIgnoringLayerTransform:](self->_shadowView, "_setFrameIgnoringLayerTransform:");
  }
}

- (unint64_t)arrowDirection
{
  return [(UIPopoverBackgroundView *)self->_backgroundView arrowDirection];
}

- (BOOL)contentExtendsOverArrow
{
  return self->_contentExtendsOverArrow;
}

- (UIEdgeInsets)safeAreaInsetsForContentView
{
  BOOL v3 = [(_UIPopoverView *)self standardChromeView];
  [v3 safeAreaInsetsForContentView];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v9 + self->_animationOvershootHeight;
  double v13 = v5;
  double v14 = v7;
  double v15 = v11;
  result.right = v15;
  result.bottom = v12;
  result.left = v14;
  result.top = v13;
  return result;
}

- (id)_normalInheritedTintColor
{
  v14.receiver = self;
  v14.super_class = (Class)_UIPopoverView;
  id v3 = [(UIView *)&v14 _normalInheritedTintColor];
  uint64_t v4 = [(_UIPopoverView *)self popoverBackgroundColor];
  if (v4)
  {
    double v5 = (void *)v4;
LABEL_3:

    goto LABEL_4;
  }
  uint64_t v7 = [(_UIPopoverView *)self standardChromeView];
  if (v7)
  {
    double v8 = (void *)v7;
    double v9 = [(_UIPopoverView *)self standardChromeView];
    uint64_t v10 = [v9 _resolvedBackgroundStyle];

    if (v10 == 100)
    {
      double v11 = +[UIColor systemBlueColor];
      id v3 = v3;
      id v12 = v11;
      if (v3 == v12)
      {

LABEL_15:
        +[UIColor _systemBlueColor2];
        double v5 = v3;
        id v3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      double v5 = v12;
      if (!v3 || !v12)
      {

        goto LABEL_3;
      }
      int v13 = [v3 isEqual:v12];

      if (v13) {
        goto LABEL_15;
      }
    }
  }
LABEL_4:
  return v3;
}

- (id)standardChromeView
{
  if (self->_backgroundView && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = self->_backgroundView;
  }
  else {
    id v3 = 0;
  }
  return v3;
}

- (UIColor)popoverBackgroundColor
{
  v2 = [(_UIPopoverView *)self standardChromeView];
  id v3 = [v2 popoverBackgroundColor];

  return (UIColor *)v3;
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIPopoverView;
  uint64_t v4 = [(UIView *)&v9 _traitCollectionForChildEnvironment:a3];
  if (v4)
  {
    double v5 = [(_UIPopoverView *)self popoverController];
    double v6 = [v5 _managingSplitViewController];

    if (v6)
    {
      uint64_t v7 = -[UITraitCollection _traitCollectionWithIncrementedBackgroundLevel](v4);

      uint64_t v4 = (void *)v7;
    }
  }
  return v4;
}

- (UIPopoverController)popoverController
{
  return self->_popoverController;
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_showsBackgroundComponentHighlights)
    {
      double v5 = [(_UIPopoverView *)self standardChromeView];
      [v5 setDebugModeEnabled:1];
    }
    if (self->_showsBackgroundViewHighlight)
    {
      backgroundView = self->_backgroundView;
      uint64_t v7 = +[UIColor colorWithRed:0.5 green:0.5 blue:0.0 alpha:0.5];
      [(UIView *)backgroundView setBackgroundColor:v7];
    }
    if (self->_showsContentViewHighlight)
    {
      contentView = self->_contentView;
      objc_super v9 = +[UIColor grayColor];
      [(UIView *)contentView setBackgroundColor:v9];
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __35___UIPopoverView_willMoveToWindow___block_invoke;
    v10[3] = &unk_1E52D9F70;
    v10[4] = self;
    +[UIView performWithoutAnimation:v10];
  }
}

- (void)setShadowView:(id)a3
{
  p_shadowView = &self->_shadowView;
  objc_storeStrong((id *)&self->_shadowView, a3);
  id v6 = a3;
  [(UIView *)self insertSubview:*p_shadowView atIndex:0];
}

- (void)setPopoverBackgroundColor:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44___UIPopoverView_setPopoverBackgroundColor___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(_UIPopoverView *)self _performBlockCheckingDefinesTintColor:v6];
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (void)setChromeHidden:(BOOL)a3
{
  self->_chromeHidden = a3;
  [(_UIPopoverView *)self _updateAlphaForChromeHidden];
}

- (void)setBackgroundStyle:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37___UIPopoverView_setBackgroundStyle___block_invoke;
  v3[3] = &unk_1E52D9CD0;
  v3[4] = self;
  v3[5] = a3;
  [(_UIPopoverView *)self _performBlockCheckingDefinesTintColor:v3];
}

- (void)setBackgroundBlurEffectStyle:(int64_t)a3
{
  self->_backgroundBlurEffectStyle = a3;
  id v4 = [(_UIPopoverView *)self standardChromeView];
  [v4 _setBackgroundBlurEffectStyle:self->_backgroundBlurEffectStyle];
}

- (void)setArrowBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIPopoverView *)self standardChromeView];
  [v5 setArrowBackgroundColor:v4];

  [(UIView *)self setNeedsLayout];
}

- (void)setAnimationOvershootHeight:(double)a3
{
  self->_animationOvershootHeight = a3;
}

- (id)contentView
{
  return self->_contentView;
}

- (id)backgroundView
{
  return self->_backgroundView;
}

- (void)_updateAlphaForChromeHidden
{
  double v2 = 0.0;
  if (!self->_chromeHidden && !self->_chromeHiddenForSizeTransition) {
    double v2 = 1.0;
  }
  [(UIView *)self setAlpha:v2];
}

- (void)_setPopoverContentView:(id)a3
{
  id v9 = a3;
  [(UIView *)self->_contentView addSubview:v9];
  if (([v9 translatesAutoresizingMaskIntoConstraints] & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = [MEMORY[0x1E4F5B268] constraintWithItem:self->_contentView attribute:9 relatedBy:0 toItem:v9 attribute:9 multiplier:1.0 constant:0.0];
    [v4 addObject:v5];

    id v6 = [MEMORY[0x1E4F5B268] constraintWithItem:self->_contentView attribute:10 relatedBy:0 toItem:v9 attribute:10 multiplier:1.0 constant:0.0];
    [v4 addObject:v6];

    id v7 = [MEMORY[0x1E4F5B268] constraintWithItem:self->_contentView attribute:7 relatedBy:0 toItem:v9 attribute:7 multiplier:1.0 constant:0.0];
    [v4 addObject:v7];

    double v8 = [MEMORY[0x1E4F5B268] constraintWithItem:self->_contentView attribute:8 relatedBy:0 toItem:v9 attribute:8 multiplier:1.0 constant:0.0];
    [v4 addObject:v8];

    [MEMORY[0x1E4F5B268] activateConstraints:v4];
  }
}

- (void)_setCustomCornerRadius:(double)a3
{
  if (self->_customCornerRadius != a3)
  {
    self->_customCornerRadius = a3;
    -[UIPopoverBackgroundView _setCustomCornerRadius:](self->_backgroundView, "_setCustomCornerRadius:");
    [(UIView *)self->_contentView _setContinuousCornerRadius:self->_customCornerRadius];
    [(UIView *)self setNeedsDisplay];
  }
}

- (_UIPopoverView)initWithFrame:(CGRect)a3 backgroundViewClass:(Class)a4
{
  return -[_UIPopoverView initWithFrame:backgroundViewClass:embeddedInView:contentExtendsOverArrow:](self, "initWithFrame:backgroundViewClass:embeddedInView:contentExtendsOverArrow:", a4, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIPopoverView)initWithFrame:(CGRect)a3
{
  return -[_UIPopoverView initWithFrame:backgroundViewClass:](self, "initWithFrame:backgroundViewClass:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (int)_style
{
  return 1;
}

- (BOOL)_needsLayoutOnAnimatedFrameChangeForNewFrame:(CGRect)a3
{
  return 1;
}

- (CGRect)_snapshotBounds
{
  [(UIView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if ([(UIPopoverController *)self->_popoverController _popoverControllerStyle] != 1)
  {
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"_UIPopoverView.m" lineNumber:232 description:@"-_snapshotBounds is only supported for popover views of slide style popover controllers"];
  }
  [(UIPopoverBackgroundView *)self->_backgroundView _shadowOffset];
  double v13 = v12;
  [(UIPopoverBackgroundView *)self->_backgroundView _shadowRadius];
  double v15 = v9 + v13 + v14;
  double v16 = v5;
  double v17 = v7;
  double v18 = v11;
  result.size.double height = v18;
  result.size.double width = v15;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (BOOL)_allowsCustomizationOfContent
{
  return 0;
}

- (void)setChromeHiddenForSizeTransition:(BOOL)a3
{
  self->_chromeHiddenForSizeTransition = a3;
  [(_UIPopoverView *)self _updateAlphaForChromeHidden];
}

- (int64_t)backgroundStyle
{
  return [(UIPopoverBackgroundView *)self->_backgroundView backgroundStyle];
}

- (UIColor)arrowBackgroundColor
{
  double v2 = [(_UIPopoverView *)self standardChromeView];
  id v3 = [v2 arrowBackgroundColor];

  return (UIColor *)v3;
}

- (void)_setCornerRadius:(double)a3
{
  [(UIView *)self->_contentView _setContinuousCornerRadius:a3 + -1.0];
  [(UIView *)self setNeedsDisplay];
}

- (void)_showArrow
{
  if (objc_opt_respondsToSelector())
  {
    backgroundView = self->_backgroundView;
    [(UIPopoverBackgroundView *)backgroundView _showArrow];
  }
}

- (void)_hideArrow
{
  if (objc_opt_respondsToSelector())
  {
    backgroundView = self->_backgroundView;
    [(UIPopoverBackgroundView *)backgroundView _hideArrow];
  }
}

- (BOOL)showsBackgroundComponentHighlights
{
  return self->_showsBackgroundComponentHighlights;
}

- (void)setShowsBackgroundComponentHighlights:(BOOL)a3
{
  self->_showsBackgroundComponentHighlights = a3;
}

- (BOOL)showsBackgroundViewHighlight
{
  return self->_showsBackgroundViewHighlight;
}

- (void)setShowsBackgroundViewHighlight:(BOOL)a3
{
  self->_showsBackgroundViewHighlight = a3;
}

- (BOOL)showsContentViewHighlight
{
  return self->_showsContentViewHighlight;
}

- (void)setShowsContentViewHighlight:(BOOL)a3
{
  self->_showsContentViewHighlight = a3;
}

- (double)_customCornerRadius
{
  return self->_customCornerRadius;
}

- (UIActionSheet)presentedActionSheet
{
  return self->_presentedActionSheet;
}

- (void)setPresentedActionSheet:(id)a3
{
}

- (void)setPopoverController:(id)a3
{
  self->_popoverController = (UIPopoverController *)a3;
}

- (int64_t)backgroundBlurEffectStyle
{
  return self->_backgroundBlurEffectStyle;
}

- (BOOL)chromeHidden
{
  return self->_chromeHidden;
}

- (BOOL)chromeHiddenForSizeTransition
{
  return self->_chromeHiddenForSizeTransition;
}

- (_UIRoundedRectShadowView)shadowView
{
  return self->_shadowView;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)animationOvershootHeight
{
  return self->_animationOvershootHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_presentedActionSheet, 0);
  objc_storeStrong((id *)&self->_clipView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end