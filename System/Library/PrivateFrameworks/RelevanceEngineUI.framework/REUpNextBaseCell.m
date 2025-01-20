@interface REUpNextBaseCell
+ (id)_shadowImage;
+ (void)initialize;
- (BOOL)shouldOverrideContentHeaderColor;
- (CALayer)imageLayer;
- (NSString)representedElementIdentifier;
- (REContent)content;
- (REUpNextBaseCell)initWithFrame:(CGRect)a3;
- (REUpNextCellDelegate)delegate;
- (UIColor)defaultTextColor;
- (UIImage)contentImage;
- (UIImage)overrideContentImage;
- (id)transitionContext;
- (void)_updateColorOverlay;
- (void)applyLayoutAttributes:(id)a3;
- (void)configureWithContent:(id)a3;
- (void)didLongPress:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setContentBrightness:(double)a3 animated:(BOOL)a4;
- (void)setContentImage:(id)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setForegroundTextColorToColor:(id)a3 shouldOverrideContentHeaderColor:(BOOL)a4;
- (void)setHighlightBehavior:(unint64_t)a3;
- (void)setHighlightInsets:(UIEdgeInsets)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setOverrideContentImage:(id)a3;
- (void)setRepresentedElementIdentifier:(id)a3;
- (void)setShadowViewHidden:(BOOL)a3;
@end

@implementation REUpNextBaseCell

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    kActiveLayout_0_5 = 0x4018000000000000;
  }
}

+ (id)_shadowImage
{
  if (_shadowImage_onceToken != -1) {
    dispatch_once(&_shadowImage_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)_shadowImage_shadowImage;

  return v2;
}

void __32__REUpNextBaseCell__shadowImage__block_invoke()
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v0 imageNamed:@"platter_shadow" inBundle:v1 compatibleWithTraitCollection:0];

  uint64_t v2 = objc_msgSend(v4, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, *(double *)&kActiveLayout_0_5, 0.0, *(double *)&kActiveLayout_0_5);
  v3 = (void *)_shadowImage_shadowImage;
  _shadowImage_shadowImage = v2;
}

- (REUpNextBaseCell)initWithFrame:(CGRect)a3
{
  v34.receiver = self;
  v34.super_class = (Class)REUpNextBaseCell;
  v3 = -[REUpNextBaseCell initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F1C550] whiteColor];
    defaultTextColor = v3->_defaultTextColor;
    v3->_defaultTextColor = (UIColor *)v4;

    v6 = [(id)objc_opt_class() _shadowImage];
    [v6 size];
    v3->_shadowSize.width = v7;
    v3->_shadowSize.height = v8;
    uint64_t v9 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v6];
    shadowView = v3->_shadowView;
    v3->_shadowView = (UIImageView *)v9;

    v11 = [(UIImageView *)v3->_shadowView layer];
    [v11 setZPosition:-2.0];

    uint64_t v12 = [MEMORY[0x263F157E8] layer];
    imageLayer = v3->_imageLayer;
    v3->_imageLayer = (CALayer *)v12;

    [(CALayer *)v3->_imageLayer setAllowsGroupBlending:0];
    v14 = v3->_imageLayer;
    v15 = [MEMORY[0x263F1C920] mainScreen];
    [v15 scale];
    -[CALayer setContentsScale:](v14, "setContentsScale:");

    id v16 = objc_alloc(MEMORY[0x263F1CB60]);
    uint64_t v17 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    overlayView = v3->_overlayView;
    v3->_overlayView = (UIView *)v17;

    v19 = v3->_overlayView;
    v20 = [MEMORY[0x263F1C550] clearColor];
    [(UIView *)v19 setBackgroundColor:v20];

    v21 = [(UIView *)v3->_overlayView layer];
    [v21 setZPosition:1.0];

    v3->_darkeningAmount = 0.0;
    [(REUpNextBaseCell *)v3 addSubview:v3->_shadowView];
    v22 = [(REUpNextBaseCell *)v3 contentView];
    v23 = [MEMORY[0x263F1C550] clearColor];
    [v22 setBackgroundColor:v23];

    v24 = [(REUpNextBaseCell *)v3 contentView];
    [v24 addSubview:v3->_overlayView];

    v25 = [(REUpNextBaseCell *)v3 layer];
    [v25 addSublayer:v3->_imageLayer];

    [(CALayer *)v3->_imageLayer setZPosition:-2.0];
    uint64_t v26 = *MEMORY[0x263F15A20];
    [(CALayer *)v3->_imageLayer setCornerCurve:*MEMORY[0x263F15A20]];
    [(CALayer *)v3->_imageLayer setCornerRadius:*(double *)&kActiveLayout_0_5];
    [(CALayer *)v3->_imageLayer setMasksToBounds:1];
    v27 = [(UIView *)v3->_overlayView layer];
    [v27 setCornerCurve:v26];

    v28 = [(UIView *)v3->_overlayView layer];
    [v28 setCornerRadius:*(double *)&kActiveLayout_0_5];

    v29 = [(UIView *)v3->_overlayView layer];
    [v29 setMasksToBounds:1];

    v3->_behavior = 0;
    long long v30 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
    *(_OWORD *)&v3->_overlayInsets.top = *MEMORY[0x263F1D1C0];
    *(_OWORD *)&v3->_overlayInsets.bottom = v30;
    uint64_t v31 = [objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:v3 action:sel_didLongPress_];
    longPressRecognizer = v3->_longPressRecognizer;
    v3->_longPressRecognizer = (UILongPressGestureRecognizer *)v31;

    [(UILongPressGestureRecognizer *)v3->_longPressRecognizer setDelegate:v3];
    [(UILongPressGestureRecognizer *)v3->_longPressRecognizer setCancelsTouchesInView:0];
    [(REUpNextBaseCell *)v3 addGestureRecognizer:v3->_longPressRecognizer];
  }
  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(REUpNextBaseCell *)self isHighlighted];
  v7.receiver = self;
  v7.super_class = (Class)REUpNextBaseCell;
  [(REUpNextBaseCell *)&v7 setHighlighted:v3];
  if (v5 != v3)
  {
    if (v3)
    {
      [(REUpNextBaseCell *)self _updateColorOverlay];
    }
    else
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __35__REUpNextBaseCell_setHighlighted___block_invoke;
      v6[3] = &unk_2644B7EC0;
      v6[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:v6 animations:0.25];
    }
  }
}

uint64_t __35__REUpNextBaseCell_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateColorOverlay];
}

- (void)didLongPress:(id)a3
{
  id v4 = [(REUpNextBaseCell *)self delegate];
  [v4 cellDidLongPress:self];
}

- (void)setHighlightBehavior:(unint64_t)a3
{
  if (self->_behavior == a3) {
    return;
  }
  self->_behavior = a3;
  if (a3 == 1)
  {
    id v4 = [(UIView *)self->_overlayView layer];
    int v5 = v4;
    double v6 = -1.0;
    goto LABEL_6;
  }
  if (!a3)
  {
    id v4 = [(UIView *)self->_overlayView layer];
    int v5 = v4;
    double v6 = 0.0;
LABEL_6:
    [v4 setZPosition:v6];
  }

  [(REUpNextBaseCell *)self _updateColorOverlay];
}

- (void)setHighlightInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_overlayInsets.left
    || a3.top != self->_overlayInsets.top
    || a3.right != self->_overlayInsets.right
    || a3.bottom != self->_overlayInsets.bottom)
  {
    self->_overlayInsets = a3;
    [(REUpNextBaseCell *)self setNeedsLayout];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)REUpNextBaseCell;
  [(REUpNextBaseCell *)&v3 prepareForReuse];
  [(REUpNextBaseCell *)self setContentBrightness:0 animated:1.0];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)REUpNextBaseCell;
  [(REUpNextBaseCell *)&v13 layoutSubviews];
  [(REUpNextBaseCell *)self bounds];
  double x = v14.origin.x;
  double width = v14.size.width;
  CGFloat v5 = CGRectGetMaxY(v14) - *(double *)&kActiveLayout_0_5;
  double height = self->_shadowSize.height;
  overlayView = self->_overlayView;
  [(REUpNextBaseCell *)self bounds];
  -[UIView setFrame:](overlayView, "setFrame:", v8 + self->_overlayInsets.left, v9 + self->_overlayInsets.top, v10 - (self->_overlayInsets.left + self->_overlayInsets.right), v11 - (self->_overlayInsets.top + self->_overlayInsets.bottom));
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  imageLayer = self->_imageLayer;
  [(REUpNextBaseCell *)self bounds];
  -[CALayer setFrame:](imageLayer, "setFrame:");
  -[UIImageView setFrame:](self->_shadowView, "setFrame:", x, v5, width, height);
  [MEMORY[0x263F158F8] commit];
}

- (void)setContentBrightness:(double)a3 animated:(BOOL)a4
{
  float contentBrightness = self->_contentBrightness;
  float v6 = a3;
  if (vabds_f32(contentBrightness, v6) >= 0.00000011921)
  {
    BOOL v7 = a4;
    id v9 = [MEMORY[0x263F1C550] colorWithWhite:a3 alpha:1.0];
    uint64_t v10 = [v9 CGColor];

    id v11 = [MEMORY[0x263F1C550] colorWithWhite:self->_contentBrightness alpha:1.0];
    uint64_t v12 = [v11 CGColor];

    if (v7)
    {
      objc_super v13 = [MEMORY[0x263F15760] animationWithKeyPath:@"contentsMultiplyColor"];
      [v13 setToValue:v10];
      [v13 setFromValue:v12];
      [v13 setDuration:0.5];
      CGRect v14 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
      [v13 setTimingFunction:v14];

      [v13 setFillMode:*MEMORY[0x263F15AA0]];
      [(CALayer *)self->_imageLayer addAnimation:v13 forKey:@"brightnessBoost"];
    }
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    [(CALayer *)self->_imageLayer setContentsMultiplyColor:v10];
    [MEMORY[0x263F158F8] commit];
    self->_float contentBrightness = a3;
  }
}

- (void)setContentImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = (UIImage *)a3;
  p_contentImage = &self->_contentImage;
  if (self->_contentImage != v7)
  {
    id v11 = v7;
    if (!self->_overrideContentImage)
    {
      if (v4)
      {
        id v9 = [MEMORY[0x263F15760] animationWithKeyPath:@"contents"];
        objc_msgSend(v9, "setToValue:", -[UIImage CGImage](v11, "CGImage"));
        objc_msgSend(v9, "setFromValue:", -[UIImage CGImage](*p_contentImage, "CGImage"));
        [v9 setDuration:1.0];
        uint64_t v10 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
        [v9 setTimingFunction:v10];

        [(CALayer *)self->_imageLayer addAnimation:v9 forKey:@"contentsFade"];
      }
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setDisableActions:1];
      [(CALayer *)self->_imageLayer setContents:[(UIImage *)v11 CGImage]];
      [MEMORY[0x263F158F8] commit];
    }
    objc_storeStrong((id *)p_contentImage, a3);
    BOOL v7 = v11;
  }
}

- (void)setOverrideContentImage:(id)a3
{
  CGFloat v5 = (UIImage *)a3;
  if (self->_overrideContentImage != v5)
  {
    objc_storeStrong((id *)&self->_overrideContentImage, a3);
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    [(CALayer *)self->_imageLayer setContents:[(UIImage *)v5 CGImage]];
    [MEMORY[0x263F158F8] commit];
  }
}

- (void)setShadowViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIImageView *)self->_shadowView isHidden] != a3)
  {
    shadowView = self->_shadowView;
    [(UIImageView *)shadowView setHidden:v3];
  }
}

- (void)configureWithContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
  id v5 = a3;
  id v6 = [v5 tintColor];

  [(REUpNextBaseCell *)self setTintColor:v6];
}

- (void)setForegroundTextColorToColor:(id)a3 shouldOverrideContentHeaderColor:(BOOL)a4
{
  id v6 = (UIColor *)[a3 copy];
  defaultTextColor = self->_defaultTextColor;
  self->_defaultTextColor = v6;

  self->_shouldOverrideContentHeaderColor = a4;

  [(REUpNextBaseCell *)self defaultTextColorDidChange];
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)REUpNextBaseCell;
  [(REUpNextBaseCell *)&v7 applyLayoutAttributes:v4];
  -[REUpNextBaseCell setHidden:](self, "setHidden:", [v4 isHidden]);
  char v5 = [MEMORY[0x263F1CB60] _isInAnimationBlock];
  if ((v5 & 1) == 0)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
  }
  self->_darkeningAmount = 0.0;
  [(REUpNextBaseCell *)self _updateColorOverlay];
  if (!self->_overrideContentImage)
  {
    imageLayer = self->_imageLayer;
    [v4 unitFrameOnScreen];
    -[CALayer setContentsRect:](imageLayer, "setContentsRect:");
  }
  [(UIImageView *)self->_shadowView setAlpha:1.0];
  if ((v5 & 1) == 0) {
    [MEMORY[0x263F158F8] commit];
  }
}

- (void)_updateColorOverlay
{
  if ([(REUpNextBaseCell *)self isHighlighted])
  {
    unint64_t behavior = self->_behavior;
    if (behavior == 1)
    {
      overlayView = self->_overlayView;
      char v5 = (void *)MEMORY[0x263F1C550];
      double v6 = 0.3;
      double v7 = 0.1;
    }
    else
    {
      if (behavior) {
        return;
      }
      overlayView = self->_overlayView;
      char v5 = (void *)MEMORY[0x263F1C550];
      double v6 = 1.0;
      double v7 = 0.25;
    }
    uint64_t v9 = [v5 colorWithWhite:v6 alpha:v7];
    uint64_t v10 = overlayView;
  }
  else
  {
    double v8 = self->_overlayView;
    uint64_t v9 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:self->_darkeningAmount];
    uint64_t v10 = v8;
  }
  id v11 = (id)v9;
  -[UIView setBackgroundColor:](v10, "setBackgroundColor:");
}

- (id)transitionContext
{
  return (id)MEMORY[0x263EFFA78];
}

- (UIImage)contentImage
{
  return self->_contentImage;
}

- (REUpNextCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (REUpNextCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImage)overrideContentImage
{
  return self->_overrideContentImage;
}

- (REContent)content
{
  return self->_content;
}

- (NSString)representedElementIdentifier
{
  return self->_representedElementIdentifier;
}

- (void)setRepresentedElementIdentifier:(id)a3
{
}

- (UIColor)defaultTextColor
{
  return self->_defaultTextColor;
}

- (BOOL)shouldOverrideContentHeaderColor
{
  return self->_shouldOverrideContentHeaderColor;
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTextColor, 0);
  objc_storeStrong((id *)&self->_representedElementIdentifier, 0);
  objc_storeStrong((id *)&self->_overrideContentImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentImage, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);

  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end