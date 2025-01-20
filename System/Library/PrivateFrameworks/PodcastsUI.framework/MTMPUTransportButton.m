@interface MTMPUTransportButton
+ (id)_stringForDisplayedSkipInterval:(double)a3;
+ (id)defaultDisabledColor;
+ (id)defaultHighlightedColor;
+ (id)defaultRegularColor;
+ (id)defaultSelectedColor;
+ (id)skipIntervalImageForInterval:(double)a3 baseImage:(id)a4 font:(id)a5 scale:(double)a6;
+ (id)transportButton;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isEnabled;
- (BOOL)shouldInferColorsFromTintColor;
- (BOOL)shouldShowBackgroundForSelectedState;
- (BOOL)shouldTrack;
- (BOOL)wantsCustomHighlightAppearance;
- (MTMPUTransportButton)initWithFrame:(CGRect)a3;
- (MTMPUTransportButtonEventHandler)transportButtonEventHandler;
- (UIColor)disabledColor;
- (UIColor)highlightedColor;
- (UIColor)regularColor;
- (UIColor)selectedColor;
- (UIImage)transportButtonImage;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)transportButtonImageViewContentMode;
- (void)_updateDisabledTransportButtonImage;
- (void)_updateHighlightedTransportButtonImage;
- (void)_updateRegularTransportButtonImage;
- (void)_updateSelectedTransportButtonImage;
- (void)applyTransportButtonLayoutAttributes:(id *)a3;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDisabledColor:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlightedColor:(id)a3;
- (void)setRegularColor:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedColor:(id)a3;
- (void)setShouldInferColorsFromTintColor:(BOOL)a3;
- (void)setShouldShowBackgroundForSelectedState:(BOOL)a3;
- (void)setTransportButtonImage:(id)a3;
- (void)setTransportButtonImageViewContentMode:(int64_t)a3;
@end

@implementation MTMPUTransportButton

+ (id)defaultRegularColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

+ (id)defaultDisabledColor
{
  v2 = [a1 defaultRegularColor];
  v3 = [v2 colorWithAlphaComponent:0.4];

  return v3;
}

+ (id)defaultHighlightedColor
{
  return (id)[MEMORY[0x1E4FB1618] darkGrayColor];
}

+ (id)defaultSelectedColor
{
  return (id)[MEMORY[0x1E4FB1618] systemPinkColor];
}

- (MTMPUTransportButton)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MTMPUTransportButton;
  v3 = -[MTMPUTransportButton initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MTMPUTransportButtonEventHandler);
    transportButtonEventHandler = v3->_transportButtonEventHandler;
    v3->_transportButtonEventHandler = v4;

    [(MTMPUTransportButtonEventHandler *)v3->_transportButtonEventHandler setButton:v3];
    uint64_t v6 = [(id)objc_opt_class() defaultHighlightedColor];
    highlightedColor = v3->_highlightedColor;
    v3->_highlightedColor = (UIColor *)v6;

    uint64_t v8 = [(id)objc_opt_class() defaultDisabledColor];
    disabledColor = v3->_disabledColor;
    v3->_disabledColor = (UIColor *)v8;

    uint64_t v10 = [(id)objc_opt_class() defaultRegularColor];
    regularColor = v3->_regularColor;
    v3->_regularColor = (UIColor *)v10;

    uint64_t v12 = [(id)objc_opt_class() defaultSelectedColor];
    selectedColor = v3->_selectedColor;
    v3->_selectedColor = (UIColor *)v12;
  }
  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  transportButtonEventHandler = self->_transportButtonEventHandler;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__MTMPUTransportButton_hitTest_withEvent___block_invoke;
  v12[3] = &unk_1E6E1FDB0;
  CGFloat v15 = x;
  CGFloat v16 = y;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  uint64_t v10 = [(MTMPUTransportButtonEventHandler *)transportButtonEventHandler performHitTestingBlock:v12];

  return v10;
}

id __42__MTMPUTransportButton_hitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)MTMPUTransportButton;
  v2 = objc_msgSendSuper2(&v4, sel_hitTest_withEvent_, v1, *(double *)(a1 + 48), *(double *)(a1 + 56));

  return v2;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MTMPUTransportButton;
  [(MTMPUTransportButton *)&v3 layoutSubviews];
  if (self->_selectionIndicatorLayer)
  {
    [(MTMPUTransportButton *)self bounds];
    -[MTMPUTransportButton imageRectForContentRect:](self, "imageRectForContentRect:");
    CGRect v5 = CGRectInset(v4, -4.0, -4.0);
    -[CALayer setFrame:](self->_selectionIndicatorLayer, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
  }
}

- (BOOL)isEnabled
{
  v4.receiver = self;
  v4.super_class = (Class)MTMPUTransportButton;
  return [(MTMPUTransportButton *)&v4 isEnabled]
      || [(MTMPUTransportButtonEventHandler *)self->_transportButtonEventHandler shouldFakeEnabled];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MTMPUTransportButton;
  -[MTMPUTransportButton setEnabled:](&v6, sel_setEnabled_);
  if ([(MTMPUTransportButton *)self isSelected]
    && [(MTMPUTransportButton *)self shouldShowBackgroundForSelectedState])
  {
    LODWORD(v5) = 1053609165;
    if (v3) {
      *(float *)&double v5 = 1.0;
    }
    [(CALayer *)self->_selectionIndicatorLayer setOpacity:v5];
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  double v5 = self;
  transportButtonEventHandler = self->_transportButtonEventHandler;
  id v7 = a4;
  id v8 = a3;
  [(MTMPUTransportButtonEventHandler *)transportButtonEventHandler beginTrackingWithTouch:v8 withEvent:v7];
  v10.receiver = v5;
  v10.super_class = (Class)MTMPUTransportButton;
  LOBYTE(v5) = [(MTMPUTransportButton *)&v10 beginTrackingWithTouch:v8 withEvent:v7];

  return (char)v5;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  transportButtonEventHandler = self->_transportButtonEventHandler;
  id v5 = a3;
  [(MTMPUTransportButtonEventHandler *)transportButtonEventHandler cancelTrackingWithEvent:v5];
  v6.receiver = self;
  v6.super_class = (Class)MTMPUTransportButton;
  [(MTMPUTransportButton *)&v6 cancelTrackingWithEvent:v5];
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  transportButtonEventHandler = self->_transportButtonEventHandler;
  id v7 = a4;
  id v8 = a3;
  [(MTMPUTransportButtonEventHandler *)transportButtonEventHandler endTrackingWithTouch:v8 withEvent:v7];
  v9.receiver = self;
  v9.super_class = (Class)MTMPUTransportButton;
  [(MTMPUTransportButton *)&v9 endTrackingWithTouch:v8 withEvent:v7];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTMPUTransportButton;
  -[MTMPUTransportButton setSelected:](&v12, sel_setSelected_);
  if ([(MTMPUTransportButton *)self shouldShowBackgroundForSelectedState])
  {
    selectionIndicatorLayer = self->_selectionIndicatorLayer;
    if (v3)
    {
      if (!selectionIndicatorLayer)
      {
        objc_super v6 = [MEMORY[0x1E4F39BE8] layer];
        id v7 = self->_selectionIndicatorLayer;
        self->_selectionIndicatorLayer = v6;

        id v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.12];
        -[CALayer setBackgroundColor:](self->_selectionIndicatorLayer, "setBackgroundColor:", [v8 CGColor]);

        [(CALayer *)self->_selectionIndicatorLayer setCornerRadius:3.0];
        [(CALayer *)self->_selectionIndicatorLayer setOpacity:0.0];
        objc_super v9 = [(MTMPUTransportButton *)self layer];
        [v9 insertSublayer:self->_selectionIndicatorLayer atIndex:0];
      }
      [(MTMPUTransportButton *)self setNeedsLayout];
      BOOL v10 = [(MTMPUTransportButton *)self isEnabled];
      selectionIndicatorLayer = self->_selectionIndicatorLayer;
      if (v10) {
        LODWORD(v11) = 1.0;
      }
      else {
        LODWORD(v11) = 1053609165;
      }
    }
    else
    {
      double v11 = 0.0;
    }
    [(CALayer *)selectionIndicatorLayer setOpacity:v11];
  }
}

- (BOOL)shouldTrack
{
  v4.receiver = self;
  v4.super_class = (Class)MTMPUTransportButton;
  return [(MTMPUTransportButton *)&v4 shouldTrack]
      || [(MTMPUTransportButtonEventHandler *)self->_transportButtonEventHandler shouldForceTrackingEnabled];
}

+ (id)transportButton
{
  return (id)[a1 buttonWithType:0];
}

- (MTMPUTransportButtonEventHandler)transportButtonEventHandler
{
  return self->_transportButtonEventHandler;
}

- (void)applyTransportButtonLayoutAttributes:(id *)a3
{
  CGFloat x = a3->var1.origin.x;
  CGFloat y = a3->var1.origin.y;
  CGFloat width = a3->var1.size.width;
  CGFloat height = a3->var1.size.height;
  [(MTMPUTransportButton *)self setImageEdgeInsets:MTMPUEdgeInsetsRectInsets(x, y, width, height, a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height)];

  -[MTMPUTransportButton setFrame:](self, "setFrame:", x, y, width, height);
}

- (void)prepareForReuse
{
}

- (BOOL)wantsCustomHighlightAppearance
{
  return 1;
}

- (int64_t)transportButtonImageViewContentMode
{
  v2 = [(MTMPUTransportButton *)self imageView];
  int64_t v3 = [v2 contentMode];

  return v3;
}

- (void)setTransportButtonImageViewContentMode:(int64_t)a3
{
  id v4 = [(MTMPUTransportButton *)self imageView];
  [v4 setContentMode:a3];
}

- (void)setDisabledColor:(id)a3
{
  if (self->_disabledColor != a3)
  {
    objc_storeStrong((id *)&self->_disabledColor, a3);
    if (!self->_shouldInferColorsFromTintColor) {
      [(MTMPUTransportButton *)self _updateDisabledTransportButtonImage];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)setHighlightedColor:(id)a3
{
  if (self->_highlightedColor != a3)
  {
    objc_storeStrong((id *)&self->_highlightedColor, a3);
    if (!self->_shouldInferColorsFromTintColor) {
      [(MTMPUTransportButton *)self _updateHighlightedTransportButtonImage];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)setRegularColor:(id)a3
{
  if (self->_regularColor != a3)
  {
    objc_storeStrong((id *)&self->_regularColor, a3);
    if (!self->_shouldInferColorsFromTintColor) {
      [(MTMPUTransportButton *)self _updateRegularTransportButtonImage];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)setSelectedColor:(id)a3
{
  if (self->_selectedColor != a3)
  {
    objc_storeStrong((id *)&self->_selectedColor, a3);
    if (!self->_shouldInferColorsFromTintColor) {
      [(MTMPUTransportButton *)self _updateSelectedTransportButtonImage];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)setShouldInferColorsFromTintColor:(BOOL)a3
{
  if (self->_shouldInferColorsFromTintColor != a3)
  {
    self->_shouldInferColorsFromTintColor = a3;
    if (a3)
    {
      [(MTMPUTransportButton *)self setImage:0 forState:1];
      [(MTMPUTransportButton *)self setImage:0 forState:4];
      id v4 = [(UIImage *)self->_transportButtonImage imageWithRenderingMode:2];
      [(MTMPUTransportButton *)self setImage:v4 forState:0];
    }
    else
    {
      [(MTMPUTransportButton *)self _updateRegularTransportButtonImage];
      [(MTMPUTransportButton *)self _updateDisabledTransportButtonImage];
      [(MTMPUTransportButton *)self _updateHighlightedTransportButtonImage];
      [(MTMPUTransportButton *)self _updateSelectedTransportButtonImage];
    }
  }
}

- (void)setTransportButtonImage:(id)a3
{
  id v5 = (UIImage *)a3;
  transportButtonImage = self->_transportButtonImage;
  if (transportButtonImage != v5 && ([(UIImage *)transportButtonImage isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_transportButtonImage, a3);
    if (self->_shouldInferColorsFromTintColor)
    {
      id v7 = [(UIImage *)self->_transportButtonImage imageWithRenderingMode:2];
      [(MTMPUTransportButton *)self setImage:v7 forState:0];
    }
    else
    {
      [(MTMPUTransportButton *)self _updateHighlightedTransportButtonImage];
      [(MTMPUTransportButton *)self _updateRegularTransportButtonImage];
      [(MTMPUTransportButton *)self _updateSelectedTransportButtonImage];
      [(MTMPUTransportButton *)self _updateDisabledTransportButtonImage];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)_updateDisabledTransportButtonImage
{
  id v3 = [(UIImage *)self->_transportButtonImage _flatImageWithColor:self->_disabledColor];
  [(MTMPUTransportButton *)self setImage:v3 forState:2];
}

- (void)_updateHighlightedTransportButtonImage
{
  id v3 = [(UIImage *)self->_transportButtonImage _flatImageWithColor:self->_highlightedColor];
  [(MTMPUTransportButton *)self setImage:v3 forState:1];
}

- (void)_updateRegularTransportButtonImage
{
  id v3 = [(UIImage *)self->_transportButtonImage _flatImageWithColor:self->_regularColor];
  [(MTMPUTransportButton *)self setImage:v3 forState:0];
}

- (void)_updateSelectedTransportButtonImage
{
  id v3 = [(UIImage *)self->_transportButtonImage _flatImageWithColor:self->_selectedColor];
  [(MTMPUTransportButton *)self setImage:v3 forState:4];
}

- (UIColor)regularColor
{
  return self->_regularColor;
}

- (UIColor)disabledColor
{
  return self->_disabledColor;
}

- (UIColor)highlightedColor
{
  return self->_highlightedColor;
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (BOOL)shouldInferColorsFromTintColor
{
  return self->_shouldInferColorsFromTintColor;
}

- (BOOL)shouldShowBackgroundForSelectedState
{
  return self->_shouldShowBackgroundForSelectedState;
}

- (void)setShouldShowBackgroundForSelectedState:(BOOL)a3
{
  self->_shouldShowBackgroundForSelectedState = a3;
}

- (UIImage)transportButtonImage
{
  return self->_transportButtonImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportButtonImage, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_highlightedColor, 0);
  objc_storeStrong((id *)&self->_disabledColor, 0);
  objc_storeStrong((id *)&self->_regularColor, 0);
  objc_storeStrong((id *)&self->_selectionIndicatorLayer, 0);

  objc_storeStrong((id *)&self->_transportButtonEventHandler, 0);
}

+ (id)skipIntervalImageForInterval:(double)a3 baseImage:(id)a4 font:(id)a5 scale:(double)a6
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a4;
  [v11 size];
  UIGraphicsBeginImageContextWithOptions(v30, 0, a6);
  objc_msgSend(v11, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  objc_super v12 = [a1 _stringForDisplayedSkipInterval:fabs(a3)];
  uint64_t v13 = *MEMORY[0x1E4FB0700];
  v27[0] = *MEMORY[0x1E4FB06F8];
  v27[1] = v13;
  v28[0] = v10;
  v14 = [MEMORY[0x1E4FB1618] blackColor];
  v28[1] = v14;
  CGFloat v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  [v12 sizeWithAttributes:v15];
  double v17 = v16;
  double v19 = v18;
  UIRectGetCenter();
  double v21 = v20;
  double v23 = MTMPUFloatRoundForScale(v22 - v17 * 0.5, a6);
  objc_msgSend(v12, "drawAtPoint:withAttributes:", v15, v23, MTMPUFloatRoundForScale(v21 - v19 * 0.5, a6));
  v24 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v25 = [v24 _imageThatSuppressesAccessibilityHairlineThickening];

  return v25;
}

+ (id)_stringForDisplayedSkipInterval:(double)a3
{
  return (id)objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld", llround(a3));
}

@end