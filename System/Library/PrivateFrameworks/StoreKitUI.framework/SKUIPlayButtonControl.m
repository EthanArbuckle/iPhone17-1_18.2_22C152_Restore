@interface SKUIPlayButtonControl
+ ($8452678F12DBC466148836A9D382CAFC)_calculateStatistics:(SEL)a3 withSize:(CGImage *)a4;
+ (id)blurColorForColor:(id)a3;
+ (id)blurColorForImage:(id)a3 forButtonSize:(CGSize)a4 withOffsetRight:(float)a5 withOffsetBottom:(float)a6;
- (BOOL)_renderAsEnabled;
- (BOOL)isDisabledButSelectable;
- (BOOL)isIndeterminate;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)showOuterBorder;
- (BOOL)showingPlayIndicator;
- (BOOL)showingProgress;
- (CGRect)hitRect;
- (CGSize)buttonSize;
- (NSString)backdropGroupName;
- (SKUIButtonViewElement)element;
- (SKUIPlayButtonControl)initWithFrame:(CGRect)a3;
- (UIColor)controlForeGroundColor;
- (UIColor)progressIndicatorColor;
- (UIEdgeInsets)bigHitInsets;
- (UIImage)backgroundImageForBlurring;
- (UIImage)customPlayImage;
- (UIImage)customToggleImage;
- (UIImageView)imageView;
- (float)buttonCornerRadius;
- (float)playButtonDefaultAlpha;
- (float)progress;
- (id)_backgroundView;
- (id)_borderLayer;
- (id)_cancelImage;
- (id)_classicBackdropView;
- (id)_defaultBackgroundView;
- (id)_gradientBackgroundView;
- (id)_imageView;
- (id)_innerProgressLayer;
- (id)_newShapeViewWithBounds:(CGRect)a3 lineWidth:(double)a4;
- (id)_outerProgressLayer;
- (id)_playImage;
- (id)_selectedLayer;
- (id)cancelImage;
- (id)defaultBackgroundColor;
- (id)playImage;
- (int64_t)backgroundType;
- (void)_beginIndeterminateAnimation;
- (void)_createGradient:(id)a3 withGradientType:(int64_t)a4;
- (void)_prepareForReuse;
- (void)_showPlayIndicator:(BOOL)a3;
- (void)_toggleToPlayState;
- (void)_updateBackdropView;
- (void)_updateBackgroundBlur:(id)a3 withOffsetRight:(float)a4 withOffsetBottom:(float)a5;
- (void)_updateEnabledState;
- (void)_updateInnerProgressLayerStroke;
- (void)_useBlurredBackground:(BOOL)a3;
- (void)beginIndeterminateAnimation;
- (void)endIndeterminateAnimation;
- (void)hideProgressAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setBackdropGroupName:(id)a3;
- (void)setBackgroundGradientColors:(id)a3 withGradientType:(int64_t)a4;
- (void)setBackgroundImageForBlurring:(id)a3;
- (void)setBackgroundImageForBlurring:(id)a3 withOffsetRight:(float)a4 withOffsetBottom:(float)a5;
- (void)setBackgroundType:(int64_t)a3;
- (void)setBigHitInsets:(UIEdgeInsets)a3;
- (void)setBufferProgressIndicatorColor:(id)a3 withCompositingFilter:(id)a4;
- (void)setControlColor:(id)a3;
- (void)setControlForegroundColor:(id)a3;
- (void)setCustomPlayImage:(id)a3;
- (void)setCustomToggleImage:(id)a3;
- (void)setDisabledButSelectable:(BOOL)a3;
- (void)setElement:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setProgress:(float)a3;
- (void)setProgress:(float)a3 animated:(BOOL)a4;
- (void)setProgressIndicatorColor:(id)a3;
- (void)setProgressIndicatorColor:(id)a3 withCompositingFilter:(id)a4;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionColor:(id)a3 withCompositingFilter:(id)a4;
- (void)setShowBorder:(BOOL)a3;
- (void)setShowOuterBorder:(BOOL)a3;
- (void)showPlayIndicator:(BOOL)a3;
- (void)showPlayIndicator:(BOOL)a3 force:(BOOL)a4;
- (void)tintColorDidChange;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)updateOuterProgressLayerStroke;
@end

@implementation SKUIPlayButtonControl

- (SKUIPlayButtonControl)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIPlayButtonControl initWithFrame:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIPlayButtonControl;
  v8 = -[SKUIPlayButtonControl initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    [(SKUIPlayButtonControl *)v8 setBackgroundColor:0];
    [(SKUIPlayButtonControl *)v9 setOpaque:0];
    v10 = [(SKUIPlayButtonControl *)v9 layer];
    [v10 setAllowsGroupBlending:0];

    v11 = [(SKUIPlayButtonControl *)v9 layer];
    [v11 setAllowsGroupOpacity:0];

    v12 = [(SKUIPlayButtonControl *)v9 _imageView];
    [(SKUIPlayButtonControl *)v9 addSubview:v12];

    v9->_showingPlayIndicator = 1;
  }
  return v9;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->_didInitialHighlightForTouch = 0;
  v8.receiver = self;
  v8.super_class = (Class)SKUIPlayButtonControl;
  [(SKUIPlayButtonControl *)&v8 touchesBegan:a3 withEvent:a4];
  selectedLayer = self->_selectedLayer;
  if (selectedLayer)
  {
    v6 = [(SKUIPlayButtonShapeView *)selectedLayer layer];
    [v6 removeAllAnimations];

    v7 = [(SKUIPlayButtonControl *)self _selectedLayer];
    [v7 setAlpha:1.0];
  }
  else
  {
    v7 = [(SKUIPlayButtonControl *)self _selectedLayer];
    [(SKUIPlayButtonControl *)self addSubview:v7];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SKUIPlayButtonControl *)self isDisabledButSelectable])
  {
    objc_super v8 = [(SKUIPlayButtonControl *)self element];

    if (v8)
    {
      v9 = [(SKUIPlayButtonControl *)self element];
      [v9 dispatchEvent:0x1F1C94B88 eventAttribute:0x1F1C94BA8 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
    }
    [(SKUIPlayButtonControl *)self sendActionsForControlEvents:256];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SKUIPlayButtonControl;
    [(SKUIPlayButtonControl *)&v10 touchesEnded:v6 withEvent:v7];
  }
}

- (CGRect)hitRect
{
  v13.receiver = self;
  v13.super_class = (Class)SKUIPlayButtonControl;
  [(SKUIPlayButtonControl *)&v13 hitRect];
  double top = self->_bigHitInsets.top;
  double left = self->_bigHitInsets.left;
  double v6 = v5 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->_bigHitInsets.right);
  double v12 = v11 - (top + self->_bigHitInsets.bottom);
  result.size.double height = v12;
  result.size.double width = v10;
  result.origin.double y = v8;
  result.origin.double x = v6;
  return result;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)SKUIPlayButtonControl;
  [(SKUIPlayButtonControl *)&v10 layoutSubviews];
  [(SKUIPlayButtonControl *)self buttonSize];
  double v4 = v3;
  double v6 = v5;
  if (self->_showingPlayIndicator) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  double v8 = [(SKUIPlayButtonControl *)self _imageView];
  objc_msgSend(v8, "setFrame:", v7, 0.0, v4, v6);

  double v9 = [(SKUIPlayButtonControl *)self _backgroundView];
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v4, v6);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SKUIPlayButtonControl *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIPlayButtonControl;
  [(SKUIPlayButtonControl *)&v4 setEnabled:a3];
  [(SKUIPlayButtonControl *)self _updateEnabledState];
}

- (void)setDisabledButSelectable:(BOOL)a3
{
  self->_disabledButSelectable = a3;
  [(SKUIPlayButtonControl *)self _updateEnabledState];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIPlayButtonControl;
  -[SKUIPlayButtonControl setHighlighted:](&v9, sel_setHighlighted_);
  if ([(SKUIPlayButtonControl *)self _renderAsEnabled])
  {
    if (self->_backgroundType == 3)
    {
      double v5 = [(SKUIPlayButtonControl *)self _classicBackdropView];
      uint64_t v6 = [v5 inputSettings];

      double v7 = 0.7;
      if (v3) {
        double v7 = 0.35;
      }
      [v6 setColorTintAlpha:v7];
      [(SKUIPlayButtonControl *)self _updateBackdropView];
    }
    else if (!v3)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __40__SKUIPlayButtonControl_setHighlighted___block_invoke;
      v8[3] = &unk_1E6422020;
      v8[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v8 options:0 animations:0.47 completion:0.0];
    }
  }
}

void __40__SKUIPlayButtonControl_setHighlighted___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1[76])
  {
    id v2 = [v1 _selectedLayer];
    [v2 setAlpha:0.0];
  }
}

- (void)setSelected:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIPlayButtonControl;
  [(SKUIPlayButtonControl *)&v6 setSelected:a3];
  if (self->_backgroundType == 3)
  {
    objc_super v4 = [(SKUIPlayButtonControl *)self _classicBackdropView];
    double v5 = [v4 inputSettings];
    objc_msgSend(v5, "setSelected:", -[SKUIPlayButtonControl isSelected](self, "isSelected"));

    [(SKUIPlayButtonControl *)self _updateBackdropView];
  }
}

- (void)setProgressIndicatorColor:(id)a3
{
}

- (void)setProgressIndicatorColor:(id)a3 withCompositingFilter:(id)a4
{
  CGFloat v11 = (UIColor *)a3;
  id v7 = a4;
  progressIndicatorColor = self->_progressIndicatorColor;
  if (progressIndicatorColor == v11 || (-[UIColor isEqual:](progressIndicatorColor, "isEqual:") & 1) != 0)
  {
    int v9 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_progressIndicatorColor, a3);
    int v9 = 1;
  }
  id progressIndicatorCompositingFilter = self->_progressIndicatorCompositingFilter;
  if (progressIndicatorCompositingFilter != v7
    && ([progressIndicatorCompositingFilter isEqual:v7] & 1) == 0)
  {
    objc_storeStrong(&self->_progressIndicatorCompositingFilter, a4);
    goto LABEL_10;
  }
  if (v9) {
LABEL_10:
  }
    [(SKUIPlayButtonControl *)self _updateInnerProgressLayerStroke];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SKUIPlayButtonControl;
  [(SKUIPlayButtonControl *)&v3 tintColorDidChange];
  [(SKUIPlayButtonControl *)self _updateInnerProgressLayerStroke];
  [(SKUIPlayButtonControl *)self updateOuterProgressLayerStroke];
}

- (void)beginIndeterminateAnimation
{
  [(SKUIPlayButtonControl *)self setProgress:0 animated:0.0];
  BOOL indeterminate = self->_indeterminate;
  objc_super v4 = [(SKUIPlayButtonShapeView *)self->_outerProgressLayer layer];
  double v5 = v4;
  if (indeterminate)
  {
    objc_super v6 = [v4 animationKeys];
    uint64_t v7 = [v6 count];

    if (v7) {
      return;
    }
  }
  else
  {
    [v4 setStrokeStart:0.119999997];
    self->_BOOL indeterminate = 1;
  }
  double v8 = [(SKUIPlayButtonControl *)self window];

  if (v8)
  {
    [(SKUIPlayButtonControl *)self _beginIndeterminateAnimation];
  }
}

+ (id)blurColorForColor:(id)a3
{
  double v9 = 0.0;
  double v10 = 0.0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  objc_super v3 = 0;
  if ([a3 getHue:&v10 saturation:&v9 brightness:&v8 alpha:&v7])
  {
    double v9 = v9 * 1.8;
    objc_super v4 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithHue:saturation:brightness:alpha:", v10);
    double v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.980392157 alpha:0.78];
    objc_super v3 = [v4 _colorBlendedWithColor:v5 compositingFilter:*MEMORY[0x1E4F3A320]];
  }

  return v3;
}

+ (id)blurColorForImage:(id)a3 forButtonSize:(CGSize)a4 withOffsetRight:(float)a5 withOffsetBottom:(float)a6
{
  double width = a4.width;
  id v9 = a3;
  [v9 scale];
  double v11 = v10;
  [v9 size];
  double v13 = v11 * v12;
  [v9 size];
  CGFloat v15 = width * v11;
  CGFloat v16 = v11 * v14 - a6 * v11 - v15;
  id v17 = v9;
  v18 = (CGImage *)[v17 CGImage];

  v22.origin.CGFloat x = v13 - a5 * v11 - v15;
  v22.origin.CGFloat y = v16;
  v22.size.double width = v15;
  v22.size.double height = v15;
  CGRect v23 = CGRectIntegral(v22);
  v19 = CGImageCreateWithImageInRect(v18, v23);
  +[SKUIPlayButtonControl _calculateStatistics:withSize:](SKUIPlayButtonControl, "_calculateStatistics:withSize:", v19, v15, v15);
  CGImageRelease(v19);

  return 0;
}

- (CGSize)buttonSize
{
  double v2 = 28.0;
  double v3 = 28.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (float)buttonCornerRadius
{
  return 14.0;
}

- (id)cancelImage
{
  return 0;
}

- (id)defaultBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.933333333 green:0.933333333 blue:0.909803922 alpha:1.0];
}

- (void)endIndeterminateAnimation
{
  if (self->_indeterminate)
  {
    double v3 = [(SKUIPlayButtonControl *)self _outerProgressLayer];
    objc_super v4 = [v3 layer];

    [v4 setStrokeStart:0.0];
    [v4 removeAllAnimations];
    double v5 = [(SKUIPlayButtonControl *)self _outerProgressLayer];
    CGAffineTransformMakeRotation(&v6, -1.57079633);
    [v5 setTransform:&v6];

    self->_BOOL indeterminate = 0;
    [(SKUIPlayButtonControl *)self updateOuterProgressLayerStroke];
  }
}

- (void)hideProgressAnimated:(BOOL)a3
{
  if (self->_showingProgress || self->_indeterminate)
  {
    [(SKUIPlayButtonControl *)self endIndeterminateAnimation];
    objc_super v4 = [(SKUIPlayButtonControl *)self _innerProgressLayer];
    [v4 setHidden:1];

    if (self->_backgroundType == 3)
    {
      [(_UIBackdropView *)self->_backdropView setHidden:0];
    }
    else
    {
      double v5 = [(SKUIPlayButtonControl *)self _backgroundView];
      CGAffineTransform v6 = v5;
      if (v5)
      {
        [v5 setHidden:0];
        [v6 setAlpha:1.0];
        uint64_t v7 = [(SKUIPlayButtonControl *)self _imageView];
        [(SKUIPlayButtonControl *)self playButtonDefaultAlpha];
        [v7 setAlpha:v8];
      }
    }
    self->_showingProgress = 0;
    self->_showingPlayIndicator = 1;
    [(SKUIPlayButtonControl *)self _showPlayIndicator:1];
  }
}

- (id)playImage
{
  return 0;
}

- (float)playButtonDefaultAlpha
{
  float result = 0.48;
  if (!self->_usesBlurredBackground) {
    return 1.0;
  }
  return result;
}

- (void)setBackdropGroupName:(id)a3
{
  id v5 = a3;
  uint64_t backdropGroupName = (uint64_t)self->_backdropGroupName;
  if ((id)backdropGroupName != v5)
  {
    id v7 = v5;
    uint64_t backdropGroupName = [(id)backdropGroupName isEqualToString:v5];
    id v5 = v7;
    if ((backdropGroupName & 1) == 0)
    {
      objc_storeStrong((id *)&self->_backdropGroupName, a3);
      uint64_t backdropGroupName = [(_UIBackdropView *)self->_backdropView setGroupName:self->_backdropGroupName];
      id v5 = v7;
    }
  }

  MEMORY[0x1F41817F8](backdropGroupName, v5);
}

- (void)setBackgroundImageForBlurring:(id)a3 withOffsetRight:(float)a4 withOffsetBottom:(float)a5
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundImageForBlurring);

  id v9 = obj;
  if (WeakRetained != obj)
  {
    id v10 = objc_storeWeak((id *)&self->_backgroundImageForBlurring, obj);

    id v9 = obj;
    if (obj)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_backgroundImageForBlurring);
      *(float *)&double v12 = a4;
      *(float *)&double v13 = a5;
      [(SKUIPlayButtonControl *)self _updateBackgroundBlur:v11 withOffsetRight:v12 withOffsetBottom:v13];

      id v9 = obj;
    }
  }
}

- (void)setBackgroundType:(int64_t)a3
{
  if (self->_backgroundType == a3) {
    return;
  }
  self->_backgroundType = a3;
  if (a3 == 3)
  {
    [(UIView *)self->_backgroundView removeFromSuperview];
    backgroundView = self->_backgroundView;
    self->_backgroundView = 0;
  }
  else
  {
    CGAffineTransform v6 = self->_backgroundView;
    if (a3 == 4)
    {
      [(UIView *)v6 removeFromSuperview];
      id v7 = self->_backgroundView;
      self->_backgroundView = 0;

      if (!self->_gradientBackgroundView)
      {
        float v8 = [(SKUIPlayButtonControl *)self _gradientBackgroundView];
        gradientBackgroundView = self->_gradientBackgroundView;
        self->_gradientBackgroundView = v8;

        [(SKUIPlayButtonControl *)self _createGradient:self->_gradientColors withGradientType:self->_gradientType];
        [(SKUIPlayButtonControl *)self insertSubview:self->_gradientBackgroundView atIndex:0];
      }
      goto LABEL_14;
    }
    if (!v6)
    {
      id v10 = [(SKUIPlayButtonControl *)self _defaultBackgroundView];
      id v11 = self->_backgroundView;
      self->_backgroundView = v10;

      [(SKUIPlayButtonControl *)self insertSubview:self->_backgroundView atIndex:0];
    }
  }
  double v12 = self->_gradientBackgroundView;
  if (v12)
  {
    [(SKUIPlayButtonGradientView *)v12 removeFromSuperview];
    double v13 = self->_gradientBackgroundView;
    self->_gradientBackgroundView = 0;
  }
  if (a3 == 3)
  {
    if (!self->_backdropView)
    {
      double v14 = [(SKUIPlayButtonControl *)self _classicBackdropView];
      CGFloat v15 = [v14 effectView];
      CGFloat v16 = [v15 layer];
      [(SKUIPlayButtonControl *)self buttonCornerRadius];
      [v16 setCornerRadius:v17];

      v18 = [v14 layer];
      [(SKUIPlayButtonControl *)self buttonCornerRadius];
      [v18 setCornerRadius:v19];

      [(SKUIPlayButtonControl *)self insertSubview:v14 atIndex:0];
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_17;
  }
LABEL_14:
  backdropView = self->_backdropView;
  if (backdropView)
  {
    [(_UIBackdropView *)backdropView removeFromSuperview];
    [(_UIBackdropView *)self->_backdropView removeMaskViews];
    double v14 = self->_backdropView;
    self->_backdropView = 0;
    goto LABEL_16;
  }
LABEL_17:
  [(SKUIPlayButtonControl *)self setShowBorder:1];

  [(SKUIPlayButtonControl *)self _prepareForReuse];
}

- (void)setBackgroundGradientColors:(id)a3 withGradientType:(int64_t)a4
{
  id v7 = a3;
  if (*(_OWORD *)&self->_gradientColors != __PAIR128__(a4, (unint64_t)v7))
  {
    self->_gradientType = a4;
    id v8 = v7;
    objc_storeStrong((id *)&self->_gradientColors, a3);
    id v7 = v8;
  }
}

- (void)setBufferProgressIndicatorColor:(id)a3 withCompositingFilter:(id)a4
{
  id v11 = (UIColor *)a3;
  id v7 = a4;
  bufferProgressIndicatorColor = self->_bufferProgressIndicatorColor;
  if (bufferProgressIndicatorColor == v11 || (-[UIColor isEqual:](bufferProgressIndicatorColor, "isEqual:") & 1) != 0)
  {
    int v9 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_bufferProgressIndicatorColor, a3);
    int v9 = 1;
  }
  id bufferProgressIndicatorCompositingFilter = self->_bufferProgressIndicatorCompositingFilter;
  if (bufferProgressIndicatorCompositingFilter != v7
    && ([bufferProgressIndicatorCompositingFilter isEqual:v7] & 1) == 0)
  {
    objc_storeStrong(&self->_bufferProgressIndicatorCompositingFilter, a4);
    goto LABEL_10;
  }
  if (v9) {
LABEL_10:
  }
    [(SKUIPlayButtonControl *)self updateOuterProgressLayerStroke];
}

- (void)setControlColor:(id)a3
{
  id v5 = (UIColor *)a3;
  p_backgroundColor = &self->_backgroundColor;
  backgroundColor = self->_backgroundColor;
  if (backgroundColor != v5)
  {
    double v13 = v5;
    backgroundColor = (UIColor *)[(UIColor *)backgroundColor isEqual:v5];
    id v5 = v13;
    if ((backgroundColor & 1) == 0)
    {
      objc_storeStrong((id *)&self->_backgroundColor, a3);
      id v5 = v13;
      unint64_t backgroundType = self->_backgroundType;
      BOOL v9 = backgroundType > 4;
      uint64_t v10 = (1 << backgroundType) & 0x16;
      if (!v9 && v10 != 0)
      {
        double v12 = [(SKUIPlayButtonControl *)self _backgroundView];
        [v12 setBackgroundColor:*p_backgroundColor];

        id v5 = v13;
      }
    }
  }

  MEMORY[0x1F41817F8](backgroundColor, v5);
}

- (void)setSelectionColor:(id)a3 withCompositingFilter:(id)a4
{
  CGAffineTransform v6 = (UIColor *)a3;
  id v7 = a4;
  selectionColor = self->_selectionColor;
  self->_selectionColor = v6;
  BOOL v9 = v6;

  id selectionCompositingFilter = self->_selectionCompositingFilter;
  self->_id selectionCompositingFilter = v7;
  id v11 = v7;

  double v12 = [(SKUIPlayButtonShapeView *)self->_selectedLayer layer];
  double v13 = v9;
  objc_msgSend(v12, "setFillColor:", -[UIColor CGColor](v13, "CGColor"));

  id v14 = [(SKUIPlayButtonShapeView *)self->_selectedLayer layer];

  [v14 setCompositingFilter:v11];
}

- (void)setControlForegroundColor:(id)a3
{
  id v5 = (UIColor *)a3;
  controlForeGroundColor = self->_controlForeGroundColor;
  if (controlForeGroundColor != v5)
  {
    id v8 = v5;
    controlForeGroundColor = (UIColor *)[(UIColor *)controlForeGroundColor isEqual:v5];
    id v5 = v8;
    if ((controlForeGroundColor & 1) == 0)
    {
      objc_storeStrong((id *)&self->_controlForeGroundColor, a3);
      id v7 = [(SKUIPlayButtonControl *)self _imageView];
      [v7 setTintColor:v8];

      id v5 = v8;
    }
  }

  MEMORY[0x1F41817F8](controlForeGroundColor, v5);
}

- (void)setCustomPlayImage:(id)a3
{
  id v5 = a3;
  uint64_t customPlayImage = (uint64_t)self->_customPlayImage;
  if ((id)customPlayImage != v5)
  {
    id v7 = v5;
    uint64_t customPlayImage = [(id)customPlayImage isEqual:v5];
    id v5 = v7;
    if ((customPlayImage & 1) == 0)
    {
      objc_storeStrong((id *)&self->_customPlayImage, a3);
      uint64_t customPlayImage = [(SKUIPlayButtonControl *)self _showPlayIndicator:self->_showingPlayIndicator];
      id v5 = v7;
    }
  }

  MEMORY[0x1F41817F8](customPlayImage, v5);
}

- (void)setProgress:(float)a3
{
}

- (void)setProgress:(float)a3 animated:(BOOL)a4
{
  if (!self->_showingProgress) {
    [(SKUIPlayButtonControl *)self _toggleToPlayState];
  }
  if (self->_progress != a3)
  {
    if (a3 > 0.00000011921 && self->_indeterminate) {
      [(SKUIPlayButtonControl *)self endIndeterminateAnimation];
    }
    float v7 = fmax(fmin(a3, 1.0), 0.0);
    self->_progress = v7;
    id v8 = [(SKUIPlayButtonControl *)self _innerProgressLayer];
    id v12 = [v8 layer];

    if (a4)
    {
      BOOL v9 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
      [v9 setDuration:0.2];
      [v9 setFillMode:*MEMORY[0x1E4F39FA8]];
      [v9 setRemovedOnCompletion:0];
      *(float *)&double v10 = self->_progress;
      id v11 = [NSNumber numberWithFloat:v10];
      [v9 setToValue:v11];

      [v12 addAnimation:v9 forKey:0];
    }
    else
    {
      [v12 removeAllAnimations];
      [v12 setStrokeEnd:self->_progress];
    }
  }
}

- (BOOL)showOuterBorder
{
  return 0;
}

- (void)setShowBorder:(BOOL)a3
{
  if (self->_showBorder != a3)
  {
    self->_showBorder = a3;
    if (a3)
    {
      id v4 = [(SKUIPlayButtonControl *)self _borderLayer];
      [v4 setHidden:0];
    }
    else
    {
      borderLayer = self->_borderLayer;
      if (borderLayer)
      {
        [(SKUIPlayButtonShapeView *)borderLayer setHidden:1];
      }
    }
  }
}

- (void)setShowOuterBorder:(BOOL)a3
{
  if (self->_showOuterBorder != a3)
  {
    BOOL v3 = a3;
    self->_showOuterBorder = a3;
    id v5 = [(SKUIPlayButtonControl *)self _outerProgressLayer];
    [v5 setHidden:!v3];

    [(SKUIPlayButtonControl *)self updateOuterProgressLayerStroke];
  }
}

- (void)showPlayIndicator:(BOOL)a3
{
}

- (void)showPlayIndicator:(BOOL)a3 force:(BOOL)a4
{
  if (self->_showingPlayIndicator != a3 || a4)
  {
    self->_showingPlayIndicator = a3;
    -[SKUIPlayButtonControl _showPlayIndicator:](self, "_showPlayIndicator:");
  }
}

- (void)updateOuterProgressLayerStroke
{
  bufferProgressIndicatorColor = self->_bufferProgressIndicatorColor;
  if (bufferProgressIndicatorColor)
  {
    id v4 = bufferProgressIndicatorColor;
    id v5 = &OBJC_IVAR___SKUIPlayButtonControl__bufferProgressIndicatorCompositingFilter;
LABEL_7:
    id v6 = *(id *)((char *)&self->super.super.super.super.isa + *v5);
    goto LABEL_8;
  }
  if (!self->_usesBlurredBackground
    || self->_indeterminate
    || [(SKUIPlayButtonControl *)self showOuterBorder])
  {
    id v4 = [(SKUIPlayButtonControl *)self outerBorderColor];
    id v5 = &OBJC_IVAR___SKUIPlayButtonControl__progressIndicatorCompositingFilter;
    goto LABEL_7;
  }
  id v4 = 0;
  id v6 = 0;
LABEL_8:
  float v7 = [(SKUIPlayButtonShapeView *)self->_outerProgressLayer layer];
  BOOL v9 = v4;
  objc_msgSend(v7, "setStrokeColor:", -[UIColor CGColor](v9, "CGColor"));

  id v8 = [(SKUIPlayButtonShapeView *)self->_outerProgressLayer layer];
  [v8 setCompositingFilter:v6];
}

- (id)_backgroundView
{
  gradientBackgroundView = self->_gradientBackgroundView;
  if (gradientBackgroundView) {
    goto LABEL_5;
  }
  if (self->_backgroundType == 3)
  {
    gradientBackgroundView = self->_backdropView;
LABEL_5:
    id v3 = gradientBackgroundView;
    goto LABEL_6;
  }
  gradientBackgroundView = self->_backgroundView;
  if (gradientBackgroundView) {
    goto LABEL_5;
  }
  id v3 = 0;
LABEL_6:

  return v3;
}

- (void)_beginIndeterminateAnimation
{
  [(SKUIPlayButtonControl *)self updateOuterProgressLayerStroke];
  id v3 = [(SKUIPlayButtonControl *)self _outerProgressLayer];
  id v4 = [v3 layer];
  [v4 removeAllAnimations];

  id v5 = [(SKUIPlayButtonControl *)self _outerProgressLayer];
  CGAffineTransformMakeRotation(&v7, -1.57079633);
  [v5 setTransform:&v7];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SKUIPlayButtonControl__beginIndeterminateAnimation__block_invoke;
  v6[3] = &unk_1E6422020;
  v6[4] = self;
  [MEMORY[0x1E4FB1EB0] animateKeyframesWithDuration:197228 delay:v6 options:0 animations:1.0 completion:0.0];
}

uint64_t __53__SKUIPlayButtonControl__beginIndeterminateAnimation__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v3 = MEMORY[0x1E4F143A8];
  do
  {
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __53__SKUIPlayButtonControl__beginIndeterminateAnimation__block_invoke_2;
    v5[3] = &unk_1E6426868;
    v5[4] = *(void *)(a1 + 32);
    v5[5] = v2;
    uint64_t result = [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v5 relativeDuration:(double)v2++ * 0.25 animations:0.25];
  }
  while (v2 != 4);
  return result;
}

uint64_t __53__SKUIPlayButtonControl__beginIndeterminateAnimation__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 592);
  CGAffineTransformMakeRotation(&v3, (double)*(uint64_t *)(a1 + 40) * 1.57079633);
  return [v1 setTransform:&v3];
}

- (id)_borderLayer
{
  borderLayer = self->_borderLayer;
  if (!borderLayer)
  {
    [(SKUIPlayButtonControl *)self buttonSize];
    double v5 = v4;
    double v7 = v6;
    id v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v8 scale];
    double v10 = -1.0 / v9;
    id v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v11 scale];
    double v13 = -1.0 / v12;
    id v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v14 scale];
    double v16 = v5 + 1.0 / v15 * 2.0;
    float v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v17 scale];
    double v19 = v7 + 1.0 / v18 * 2.0;

    v20 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v20 scale];
    CGRect v22 = -[SKUIPlayButtonControl _newShapeViewWithBounds:lineWidth:](self, "_newShapeViewWithBounds:lineWidth:", v10, v13, v16, v19, 1.0 / v21);
    CGRect v23 = self->_borderLayer;
    self->_borderLayer = v22;

    v24 = self->_borderLayer;
    v25 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUIPlayButtonShapeView *)v24 setBackgroundColor:v25];

    v26 = [(SKUIPlayButtonShapeView *)self->_borderLayer layer];
    id v27 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v26, "setFillColor:", objc_msgSend(v27, "CGColor"));

    v28 = self->_borderLayer;
    if (self->_innerProgressLayer) {
      -[SKUIPlayButtonControl insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v28);
    }
    else {
      [(SKUIPlayButtonControl *)self addSubview:v28];
    }
    v29 = [(SKUIPlayButtonShapeView *)self->_borderLayer layer];
    id v30 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
    objc_msgSend(v29, "setStrokeColor:", objc_msgSend(v30, "CGColor"));

    borderLayer = self->_borderLayer;
  }

  return borderLayer;
}

- (id)_cancelImage
{
  uint64_t v2 = [(SKUIPlayButtonControl *)self cancelImage];
  CGAffineTransform v3 = [v2 imageWithRenderingMode:2];

  return v3;
}

- (void)_createGradient:(id)a3 withGradientType:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(SKUIPlayButtonControl *)self _gradientBackgroundView];
  id v8 = [v7 layer];

  if (a4)
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    double v9 = 0.5;
    double v10 = 1.0;
    double v11 = 0.0;
    double v12 = 0.5;
  }
  else
  {
    double v12 = 1.0;
    double v11 = 0.5;
    double v9 = 0.0;
    double v10 = 0.5;
  }
  objc_msgSend(v8, "setStartPoint:", v11, v9);
  objc_msgSend(v8, "setEndPoint:", v10, v12);
LABEL_6:
  double v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(id *)(*((void *)&v20 + 1) + 8 * v18);
        objc_msgSend(v13, "addObject:", objc_msgSend(v19, "CGColor", (void)v20));
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v16);
  }

  [v8 setColors:v13];
}

- (id)_classicBackdropView
{
  backdropView = self->_backdropView;
  if (!backdropView)
  {
    double v4 = [MEMORY[0x1E4FB1FE8] settingsForPrivateStyle:2010];
    [v4 setColorBurnTintAlpha:0.0];
    [v4 setGrayscaleTintAlpha:0.0];
    double v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.862745098 alpha:1.0];
    [v4 setColorTint:v5];

    int v6 = [(SKUIPlayButtonControl *)self isHighlighted];
    double v7 = 0.7;
    if (v6) {
      double v7 = 0.35;
    }
    [v4 setColorTintAlpha:v7];
    [v4 setDarkeningTintAlpha:0.0];
    [v4 setScale:0.5];
    id v8 = objc_alloc(MEMORY[0x1E4FB1FE0]);
    [(SKUIPlayButtonControl *)self bounds];
    double v9 = (_UIBackdropView *)objc_msgSend(v8, "initWithFrame:settings:", v4);
    double v10 = self->_backdropView;
    self->_backdropView = v9;

    [(_UIBackdropView *)self->_backdropView setComputesColorSettings:0];
    [(_UIBackdropView *)self->_backdropView setUserInteractionEnabled:0];
    if (self->_backdropGroupName) {
      -[_UIBackdropView setGroupName:](self->_backdropView, "setGroupName:");
    }

    backdropView = self->_backdropView;
  }

  return backdropView;
}

- (id)_defaultBackgroundView
{
  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    int v6 = self->_backgroundView;
    self->_backgroundView = v5;

    [(UIView *)self->_backgroundView setUserInteractionEnabled:0];
    double v7 = [(UIView *)self->_backgroundView layer];
    [(SKUIPlayButtonControl *)self buttonCornerRadius];
    [v7 setCornerRadius:v8];

    double v9 = self->_backgroundView;
    double v10 = [(SKUIPlayButtonControl *)self defaultBackgroundColor];
    [(UIView *)v9 setBackgroundColor:v10];

    [(UIView *)self->_backgroundView setClipsToBounds:1];
    backgroundView = self->_backgroundView;
  }

  return backgroundView;
}

- (BOOL)_renderAsEnabled
{
  int v3 = [(SKUIPlayButtonControl *)self isEnabled];
  if (v3) {
    LOBYTE(v3) = ![(SKUIPlayButtonControl *)self isDisabledButSelectable];
  }
  return v3;
}

- (id)_gradientBackgroundView
{
  gradientBackgroundView = self->_gradientBackgroundView;
  if (!gradientBackgroundView)
  {
    id v4 = [SKUIPlayButtonGradientView alloc];
    double v5 = -[SKUIPlayButtonGradientView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    int v6 = self->_gradientBackgroundView;
    self->_gradientBackgroundView = v5;

    [(SKUIPlayButtonGradientView *)self->_gradientBackgroundView setUserInteractionEnabled:0];
    double v7 = [(SKUIPlayButtonGradientView *)self->_gradientBackgroundView layer];
    [(SKUIPlayButtonControl *)self buttonCornerRadius];
    [v7 setCornerRadius:v8];

    double v9 = self->_gradientBackgroundView;
    double v10 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
    [(SKUIPlayButtonGradientView *)v9 setBackgroundColor:v10];

    [(SKUIPlayButtonGradientView *)self->_gradientBackgroundView setClipsToBounds:1];
    gradientBackgroundView = self->_gradientBackgroundView;
  }

  return gradientBackgroundView;
}

- (id)_imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    int v6 = self->_imageView;
    self->_imageView = v5;

    [(UIImageView *)self->_imageView setContentMode:4];
    [(UIImageView *)self->_imageView setUserInteractionEnabled:0];
    [(UIImageView *)self->_imageView setOpaque:0];
    [(UIImageView *)self->_imageView setBackgroundColor:0];
    imageView = self->_imageView;
  }

  return imageView;
}

- (id)_newShapeViewWithBounds:(CGRect)a3 lineWidth:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v9 = [SKUIPlayButtonShapeView alloc];
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGRect v16 = CGRectInset(v15, a4 * 0.5, a4 * 0.5);
  double v10 = -[SKUIPlayButtonShapeView initWithFrame:](v9, "initWithFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
  CGAffineTransformMakeRotation(&v14, -1.57079633);
  [(SKUIPlayButtonShapeView *)v10 setTransform:&v14];
  double v11 = [(SKUIPlayButtonShapeView *)v10 layer];
  [v11 setLineWidth:a4];
  [(SKUIPlayButtonShapeView *)v10 bounds];
  double v12 = CGPathCreateWithEllipseInRect(v17, 0);
  [v11 setPath:v12];
  [v11 setLineCap:@"round"];
  CGPathRelease(v12);
  [(SKUIPlayButtonShapeView *)v10 setUserInteractionEnabled:0];

  return v10;
}

- (void)_prepareForReuse
{
  objc_storeWeak((id *)&self->_backgroundImageForBlurring, 0);
  self->_BOOL indeterminate = 0;
  self->_progress = 0.0;
  self->_showingProgress = 0;
  self->_showingPlayIndicator = 1;
  self->_showOuterBorder = 0;
  outerProgressLayer = self->_outerProgressLayer;
  if (outerProgressLayer)
  {
    [(SKUIPlayButtonShapeView *)outerProgressLayer removeFromSuperview];
    id v4 = self->_outerProgressLayer;
    self->_outerProgressLayer = 0;
  }
  innerProgressLayer = self->_innerProgressLayer;
  if (innerProgressLayer)
  {
    [(SKUIPlayButtonShapeView *)innerProgressLayer removeFromSuperview];
    int v6 = self->_innerProgressLayer;
    self->_innerProgressLayer = 0;
  }
  progressIndicatorColor = self->_progressIndicatorColor;
  self->_progressIndicatorColor = 0;

  if ([(SKUIPlayButtonControl *)self _renderAsEnabled])
  {
    [(SKUIPlayButtonControl *)self playButtonDefaultAlpha];
    double v9 = v8;
  }
  else
  {
    double v9 = 0.4;
  }
  double v10 = [(SKUIPlayButtonControl *)self _imageView];
  [v10 setAlpha:v9];

  double v11 = [(SKUIPlayButtonControl *)self _imageView];
  [v11 setAlpha:v9];

  if ((self->_backgroundType & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    [(SKUIPlayButtonControl *)self _useBlurredBackground:1];
    double v12 = [MEMORY[0x1E4FB1618] blackColor];
    controlForeGroundColor = self->_controlForeGroundColor;
    self->_controlForeGroundColor = v12;

    CGAffineTransform v14 = [(SKUIPlayButtonControl *)self _imageView];
    CGRect v15 = [v14 layer];
    CGRect v16 = v15;
    uint64_t v17 = *MEMORY[0x1E4F3A2E0];
  }
  else
  {
    [(SKUIPlayButtonControl *)self _useBlurredBackground:0];
    uint64_t v18 = self->_controlForeGroundColor;
    self->_controlForeGroundColor = 0;

    CGAffineTransform v14 = [(SKUIPlayButtonControl *)self _imageView];
    CGRect v15 = [v14 layer];
    CGRect v16 = v15;
    uint64_t v17 = 0;
  }
  [v15 setCompositingFilter:v17];

  id v19 = [(SKUIPlayButtonControl *)self _imageView];
  [v19 setTintColor:self->_controlForeGroundColor];

  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    long long v21 = [(UIView *)backgroundView layer];
    [(SKUIPlayButtonControl *)self buttonCornerRadius];
    [v21 setCornerRadius:v22];
  }
  [(SKUIPlayButtonControl *)self setControlForegroundColor:self->_controlForeGroundColor];
  long long v23 = [(SKUIPlayButtonControl *)self defaultBackgroundColor];
  [(SKUIPlayButtonControl *)self setControlColor:v23];

  [(SKUIPlayButtonControl *)self _showPlayIndicator:1];

  [(SKUIPlayButtonControl *)self setNeedsLayout];
}

- (id)_innerProgressLayer
{
  innerProgressLayer = self->_innerProgressLayer;
  if (!innerProgressLayer)
  {
    [(SKUIPlayButtonControl *)self buttonSize];
    int v6 = -[SKUIPlayButtonControl _newShapeViewWithBounds:lineWidth:](self, "_newShapeViewWithBounds:lineWidth:", 0.0, 0.0, v4, v5, 2.0);
    double v7 = self->_innerProgressLayer;
    self->_innerProgressLayer = v6;

    float v8 = self->_innerProgressLayer;
    double v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUIPlayButtonShapeView *)v8 setBackgroundColor:v9];

    double v10 = [(SKUIPlayButtonShapeView *)self->_innerProgressLayer layer];
    id v11 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v10, "setFillColor:", objc_msgSend(v11, "CGColor"));

    [v10 setStrokeEnd:0.0];
    [(SKUIPlayButtonControl *)self addSubview:self->_innerProgressLayer];
    [(SKUIPlayButtonControl *)self _updateInnerProgressLayerStroke];

    innerProgressLayer = self->_innerProgressLayer;
  }

  return innerProgressLayer;
}

- (id)_outerProgressLayer
{
  outerProgressLayer = self->_outerProgressLayer;
  if (!outerProgressLayer)
  {
    [(SKUIPlayButtonControl *)self buttonSize];
    int v6 = -[SKUIPlayButtonControl _newShapeViewWithBounds:lineWidth:](self, "_newShapeViewWithBounds:lineWidth:", 0.0, 0.0, v4, v5, 1.5);
    double v7 = self->_outerProgressLayer;
    self->_outerProgressLayer = v6;

    float v8 = self->_outerProgressLayer;
    double v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUIPlayButtonShapeView *)v8 setBackgroundColor:v9];

    double v10 = [(SKUIPlayButtonShapeView *)self->_outerProgressLayer layer];
    id v11 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v10, "setFillColor:", objc_msgSend(v11, "CGColor"));

    double v12 = self->_outerProgressLayer;
    if (self->_innerProgressLayer) {
      -[SKUIPlayButtonControl insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v12);
    }
    else {
      [(SKUIPlayButtonControl *)self addSubview:v12];
    }
    [(SKUIPlayButtonControl *)self updateOuterProgressLayerStroke];

    outerProgressLayer = self->_outerProgressLayer;
  }

  return outerProgressLayer;
}

- (id)_playImage
{
  uint64_t v2 = [(SKUIPlayButtonControl *)self playImage];
  int v3 = [v2 imageWithRenderingMode:2];

  return v3;
}

- (id)_selectedLayer
{
  selectedLayer = self->_selectedLayer;
  if (!selectedLayer)
  {
    [(SKUIPlayButtonControl *)self buttonSize];
    int v6 = -[SKUIPlayButtonShapeView initWithFrame:]([SKUIPlayButtonShapeView alloc], "initWithFrame:", 0.0, 0.0, v4, v5);
    double v7 = self->_selectedLayer;
    self->_selectedLayer = v6;

    float v8 = [(SKUIPlayButtonShapeView *)self->_selectedLayer layer];
    selectionColor = self->_selectionColor;
    if (selectionColor)
    {
      [(SKUIPlayButtonControl *)self setSelectionColor:selectionColor withCompositingFilter:self->_selectionCompositingFilter];
    }
    else
    {
      double v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.16];
      [(SKUIPlayButtonControl *)self setSelectionColor:v10 withCompositingFilter:self->_selectionCompositingFilter];
    }
    [(SKUIPlayButtonShapeView *)self->_selectedLayer bounds];
    id v11 = CGPathCreateWithEllipseInRect(v14, 0);
    [v8 setPath:v11];
    CGPathRelease(v11);
    [(SKUIPlayButtonControl *)self addSubview:self->_selectedLayer];
    [(SKUIPlayButtonShapeView *)self->_selectedLayer setUserInteractionEnabled:0];

    selectedLayer = self->_selectedLayer;
  }

  return selectedLayer;
}

- (void)_showPlayIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  imageView = self->_imageView;
  if (a3) {
    [(SKUIPlayButtonControl *)self _playImage];
  }
  else {
  int v6 = [(SKUIPlayButtonControl *)self _cancelImage];
  }
  [(UIImageView *)imageView setImage:v6];

  [(SKUIPlayButtonControl *)self playIndicatorDidChange:v3];

  [(SKUIPlayButtonControl *)self setNeedsLayout];
}

- (void)_toggleToPlayState
{
  self->_showingProgress = 1;
  self->_showingPlayIndicator = 0;
  [(SKUIPlayButtonControl *)self _showPlayIndicator:0];
  BOOL v3 = [(SKUIPlayButtonControl *)self _outerProgressLayer];
  [v3 setHidden:0];

  id v4 = [(SKUIPlayButtonControl *)self _innerProgressLayer];
  [v4 setHidden:0];
}

- (void)_updateBackdropView
{
  BOOL v3 = [(_UIBackdropView *)self->_backdropView outputSettings];
  id v4 = [(_UIBackdropView *)self->_backdropView inputSettings];
  [v3 computeOutputSettingsUsingModel:v4];

  backdropView = self->_backdropView;
  id v6 = [(_UIBackdropView *)backdropView outputSettings];
  [(_UIBackdropView *)backdropView applySettings:v6];
}

- (void)_updateBackgroundBlur:(id)a3 withOffsetRight:(float)a4 withOffsetBottom:(float)a5
{
  id v8 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__42;
  v32 = __Block_byref_object_dispose__42;
  objc_getAssociatedObject(v8, (const void *)_SKUIPlayButtonControlBackgroundImageAssociatedObjectKeyColorCache);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  [(SKUIPlayButtonControl *)self buttonSize];
  id v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", a4, a5, v9, v10);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__SKUIPlayButtonControl__updateBackgroundBlur_withOffsetRight_withOffsetBottom___block_invoke;
  aBlock[3] = &unk_1E64270A0;
  aBlock[4] = self;
  double v12 = (void (**)(void *, void *))_Block_copy(aBlock);
  double v13 = [(id)v29[5] objectForKey:v11];
  if (v13)
  {
    CGRect v14 = [MEMORY[0x1E4F1CA98] null];
    int v15 = [v13 isEqual:v14];

    if (v15)
    {

      double v13 = 0;
    }
    v12[2](v12, v13);
  }
  else
  {
    objc_initWeak(&location, self);
    CGRect v16 = dispatch_get_global_queue(0, 0);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __80__SKUIPlayButtonControl__updateBackgroundBlur_withOffsetRight_withOffsetBottom___block_invoke_2;
    v18[3] = &unk_1E64270F0;
    objc_copyWeak(&v23, &location);
    id v17 = v8;
    float v24 = a4;
    float v25 = a5;
    id v19 = v17;
    float v22 = &v28;
    id v20 = v11;
    long long v21 = v12;
    dispatch_async(v16, v18);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    double v13 = 0;
  }

  _Block_object_dispose(&v28, 8);
}

void __80__SKUIPlayButtonControl__updateBackgroundBlur_withOffsetRight_withOffsetBottom___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (!v3)
  {
    id v3 = [*(id *)(a1 + 32) defaultBackgroundColor];
  }
  id v4 = [*(id *)(a1 + 32) _backgroundView];
  [v4 setBackgroundColor:v3];
}

void __80__SKUIPlayButtonControl__updateBackgroundBlur_withOffsetRight_withOffsetBottom___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    [WeakRetained buttonSize];
    id v5 = +[SKUIPlayButtonControl blurColorForImage:forButtonSize:withOffsetRight:withOffsetBottom:](SKUIPlayButtonControl, "blurColorForImage:forButtonSize:withOffsetRight:withOffsetBottom:", v4);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__SKUIPlayButtonControl__updateBackgroundBlur_withOffsetRight_withOffsetBottom___block_invoke_3;
    block[3] = &unk_1E64270C8;
    uint64_t v12 = *(void *)(a1 + 56);
    id v8 = *(id *)(a1 + 32);
    id v9 = v5;
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    id v6 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __80__SKUIPlayButtonControl__updateBackgroundBlur_withOffsetRight_withOffsetBottom___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = objc_getAssociatedObject(*(id *)(a1 + 32), (const void *)_SKUIPlayButtonControlBackgroundImageAssociatedObjectKeyColorCache);
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (!v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    objc_setAssociatedObject(*(id *)(a1 + 32), (const void *)_SKUIPlayButtonControlBackgroundImageAssociatedObjectKeyColorCache, *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), (void *)1);
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    [v5 setObject:v9 forKey:*(void *)(a1 + 48)];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA98] null];
    [v5 setObject:v10 forKey:*(void *)(a1 + 48)];
  }
  id v11 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v11();
}

- (void)_useBlurredBackground:(BOOL)a3
{
  if (self->_usesBlurredBackground != a3) {
    self->_usesBlurredBackground = a3;
  }
}

- (void)_updateInnerProgressLayerStroke
{
  progressIndicatorColor = self->_progressIndicatorColor;
  if (progressIndicatorColor)
  {
    uint64_t v4 = progressIndicatorColor;
    id v5 = self->_progressIndicatorCompositingFilter;
  }
  else
  {
    uint64_t v4 = [(SKUIPlayButtonControl *)self tintColor];
    id v5 = 0;
  }
  uint64_t v6 = [(SKUIPlayButtonShapeView *)self->_innerProgressLayer layer];
  id v8 = v4;
  objc_msgSend(v6, "setStrokeColor:", -[UIColor CGColor](v8, "CGColor"));

  uint64_t v7 = [(SKUIPlayButtonShapeView *)self->_innerProgressLayer layer];
  [v7 setCompositingFilter:v5];
}

- (void)_updateEnabledState
{
  if (self->_backgroundType == 3)
  {
    uint64_t v3 = [(SKUIPlayButtonControl *)self _classicBackdropView];
    uint64_t v4 = [v3 inputSettings];
    objc_msgSend(v4, "setEnabled:", -[SKUIPlayButtonControl _renderAsEnabled](self, "_renderAsEnabled"));

    id v5 = [v3 inputSettings];
    [v5 setHighlighted:0];
  }
  else
  {
    if ([(SKUIPlayButtonControl *)self _renderAsEnabled])
    {
      [(SKUIPlayButtonControl *)self playButtonDefaultAlpha];
      double v7 = v6;
    }
    else
    {
      double v7 = 0.4;
    }
    [(UIImageView *)self->_imageView setAlpha:v7];
  }

  [(SKUIPlayButtonControl *)self setNeedsLayout];
}

+ ($8452678F12DBC466148836A9D382CAFC)_calculateStatistics:(SEL)a3 withSize:(CGImage *)a4
{
  double height = a5.height;
  double width = a5.width;
  size_t v9 = (unint64_t)a5.width;
  size_t v10 = (unint64_t)a5.height;
  size_t v11 = 4 * (unint64_t)a5.width;
  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  uint64_t v12 = malloc_type_malloc(v11 * (unint64_t)a5.height, 0x7DAF1F6BuLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGRect v14 = CGBitmapContextCreate(v12, v9, v10, 8uLL, v11, DeviceRGB, 0x4001u);
  v57.size.double width = (double)(unint64_t)width;
  v57.size.double height = (double)(unint64_t)height;
  v57.origin.CGFloat x = 0.0;
  v57.origin.CGFloat y = 0.0;
  CGContextDrawImage(v14, v57, a4);
  CGContextRelease(v14);
  CGColorSpaceRelease(DeviceRGB);
  uint64_t v15 = 0;
  unint64_t v16 = 0;
  unint64_t v17 = 0;
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  unint64_t v20 = 0;
  unint64_t v21 = 0;
  unint64_t v22 = 0;
  unint64_t v23 = 0;
  char v24 = 1;
  do
  {
    char v25 = v24;
    size_t v26 = qword_1C1CCBDA0[v15];
    if (v26 < v10)
    {
      uint64_t v27 = (uint64_t)v12 + (v11 + 4) * v26 + 3;
      size_t v28 = v26;
      do
      {
        v29 = (unsigned __int8 *)v27;
        for (size_t i = v26; i < v9; v29 += 4 * v26)
        {
          uint64_t v31 = *(v29 - 3);
          v23 += v31;
          uint64_t v32 = *(v29 - 2);
          v22 += v32;
          uint64_t v33 = *(v29 - 1);
          v21 += v33;
          v20 += *v29;
          v19 += (v31 * v31);
          v18 += (v32 * v32);
          v17 += (v33 * v33);
          ++v16;
          i += v26;
        }
        v28 += v26;
        v27 += v11 * v26;
      }
      while (v28 < v10);
    }
    char v24 = 0;
    uint64_t v15 = 1;
  }
  while ((v25 & 1) != 0);
  double v34 = 1.0 / (double)v16;
  unint64_t v35 = (unint64_t)(v34 * (double)v23);
  unint64_t v36 = (unint64_t)(v34 * (double)v22);
  unint64_t v37 = (unint64_t)(v34 * (double)v21);
  float v38 = fmax(-((double)(v35 * v35) - (double)v19 * v34), 0.0);
  double v39 = sqrtf(v38);
  float v40 = fmax(-((double)(v36 * v36) - (double)v18 * v34), 0.0);
  double v41 = sqrtf(v40);
  float v42 = fmax(-((double)(v37 * v37) - (double)v17 * v34), 0.0);
  double v43 = sqrtf(v42);
  double v55 = 0.0;
  double v56 = 0.0;
  double v54 = 0.0;
  double v51 = 0.0;
  double v52 = 0.0;
  double v44 = (double)v35 * 0.00392156863;
  double v45 = (double)v36 * 0.00392156863;
  double v46 = (double)v37 * 0.00392156863;
  __SK_RGBtoHSV(&v56, &v55, &v54, v44, v45, v46);
  uint64_t result = ($8452678F12DBC466148836A9D382CAFC *)__SK_RGBtoHSV(&v53, &v52, &v51, v39 * 0.00392156863, v41 * 0.00392156863, v43 * 0.00392156863);
  if (a4) {
    free(v12);
  }
  retstr->var0 = v44;
  retstr->var1 = v45;
  retstr->var2 = v46;
  retstr->var3 = v56;
  double v48 = v54;
  retstr->var4 = v55;
  retstr->var5 = v48;
  double v49 = v52;
  double v50 = v51;
  retstr->var6 = (double)(unint64_t)(v34 * (double)v20) * 0.00392156863;
  retstr->var7 = v50;
  retstr->var8 = v49;
  return result;
}

- (int64_t)backgroundType
{
  return self->_backgroundType;
}

- (UIColor)controlForeGroundColor
{
  return self->_controlForeGroundColor;
}

- (UIImage)customPlayImage
{
  return self->_customPlayImage;
}

- (UIImage)customToggleImage
{
  return self->_customToggleImage;
}

- (void)setCustomToggleImage:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (BOOL)isIndeterminate
{
  return self->_indeterminate;
}

- (float)progress
{
  return self->_progress;
}

- (BOOL)showingPlayIndicator
{
  return self->_showingPlayIndicator;
}

- (UIColor)progressIndicatorColor
{
  return self->_progressIndicatorColor;
}

- (BOOL)showingProgress
{
  return self->_showingProgress;
}

- (UIEdgeInsets)bigHitInsets
{
  double top = self->_bigHitInsets.top;
  double left = self->_bigHitInsets.left;
  double bottom = self->_bigHitInsets.bottom;
  double right = self->_bigHitInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBigHitInsets:(UIEdgeInsets)a3
{
  self->_bigHitInsets = a3;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (UIImage)backgroundImageForBlurring
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundImageForBlurring);

  return (UIImage *)WeakRetained;
}

- (void)setBackgroundImageForBlurring:(id)a3
{
}

- (BOOL)isDisabledButSelectable
{
  return self->_disabledButSelectable;
}

- (SKUIButtonViewElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_element, 0);
  objc_destroyWeak((id *)&self->_backgroundImageForBlurring);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong(&self->_selectionCompositingFilter, 0);
  objc_storeStrong((id *)&self->_selectionColor, 0);
  objc_storeStrong(&self->_progressIndicatorCompositingFilter, 0);
  objc_storeStrong((id *)&self->_progressIndicatorColor, 0);
  objc_storeStrong((id *)&self->_selectedLayer, 0);
  objc_storeStrong((id *)&self->_outerProgressLayer, 0);
  objc_storeStrong((id *)&self->_innerProgressLayer, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_gradientColors, 0);
  objc_storeStrong((id *)&self->_gradientBackgroundView, 0);
  objc_storeStrong((id *)&self->_customToggleImage, 0);
  objc_storeStrong((id *)&self->_customPlayImage, 0);
  objc_storeStrong(&self->_bufferProgressIndicatorCompositingFilter, 0);
  objc_storeStrong((id *)&self->_controlForeGroundColor, 0);
  objc_storeStrong((id *)&self->_bufferProgressIndicatorColor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);

  objc_storeStrong((id *)&self->_backdropView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPlayButtonControl initWithFrame:]";
}

@end