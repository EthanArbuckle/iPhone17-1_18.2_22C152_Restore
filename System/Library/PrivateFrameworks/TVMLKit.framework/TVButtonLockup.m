@interface TVButtonLockup
- (BOOL)canBecomeFocused;
- (BOOL)isDisabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (IKViewElement)viewElement;
- (TVButtonLockup)initWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 groupName:(id)a5;
- (UIColor)highlightColor;
- (UILabel)titleView;
- (_TVImageView)imageView;
- (id)backgroundColor;
- (int64_t)_focusedSound;
- (int64_t)backdropStyle;
- (int64_t)vibrantLabelThemeOverride;
- (void)_playButtonAction:(id)a3;
- (void)_selectButtonAction:(id)a3;
- (void)_updateForAccessibilityChange;
- (void)_updateForFocusStateChange;
- (void)_updateImageMask;
- (void)_updateShadowForLabel:(id)a3 inFocus:(BOOL)a4;
- (void)_updateTextForAccessibilityAndFocus;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setHighlightColor:(id)a3;
- (void)setImageView:(id)a3;
- (void)setText:(id)a3 minimumScale:(double)a4 maxNumberOfLines:(unint64_t)a5;
- (void)setTitleView:(id)a3;
- (void)setVibrantLabelThemeOverride:(int64_t)a3;
- (void)setViewElement:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVButtonLockup

- (TVButtonLockup)initWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 groupName:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  v34.receiver = self;
  v34.super_class = (Class)TVButtonLockup;
  v12 = -[TVButtonLockup initWithFrame:](&v34, sel_initWithFrame_, x, y, width, height);
  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x263F1CC98]);
    double v14 = *MEMORY[0x263F001A8];
    double v15 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v16 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v17 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v18 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x263F001A8], v15, v16, v17);
    floatingView = v12->_floatingView;
    v12->_floatingView = (_UIFloatingContentView *)v18;

    [(_UIFloatingContentView *)v12->_floatingView setBackgroundColor:0 forState:8];
    [(_UIFloatingContentView *)v12->_floatingView setBackgroundColor:0 forState:1];
    [(_UIFloatingContentView *)v12->_floatingView setFocusedSizeIncrease:14.0];
    -[_UIFloatingContentView setContentMotionRotation:translation:](v12->_floatingView, "setContentMotionRotation:translation:", 0.0, 0.0, 8.0, 0.0);
    -[_UIFloatingContentView setFocusScaleAnchorPoint:](v12->_floatingView, "setFocusScaleAnchorPoint:", 0.5, 1.0);
    [(_UIFloatingContentView *)v12->_floatingView setShadowRadius:30.0];
    [(_UIFloatingContentView *)v12->_floatingView setShadowVerticalOffset:15.0];
    [(_UIFloatingContentView *)v12->_floatingView setShadowOpacity:0.25];
    [(_UIFloatingContentView *)v12->_floatingView setCornerRadius:6.0];
    [(_UIFloatingContentView *)v12->_floatingView setContinuousCornerEnabled:0];
    [(_UIFloatingContentView *)v12->_floatingView setVisualEffectContainerViewScaleFactor:0.988];
    [(TVButtonLockup *)v12 addSubview:v12->_floatingView];
    v12->_backdropStyle = a4;
    v12->_vibrantLabelThemeOverride = 0;
    v20 = [_TVVisualEffectView alloc];
    v21 = [MEMORY[0x263F1C480] effectWithStyle:v12->_backdropStyle];
    uint64_t v22 = [(_TVVisualEffectView *)v20 initWithEffect:v21];
    backdropView = v12->_backdropView;
    v12->_backdropView = (_TVVisualEffectView *)v22;

    [(_TVVisualEffectView *)v12->_backdropView _setCornerRadius:6.0];
    if ([v11 length]) {
      [(_TVVisualEffectView *)v12->_backdropView _setGroupName:v11];
    }
    v24 = [(_UIFloatingContentView *)v12->_floatingView visualEffectContainerView];
    [v24 addSubview:v12->_backdropView];

    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v14, v15, v16, v17);
    overlayView = v12->_overlayView;
    v12->_overlayView = (UIView *)v25;

    [(UIView *)v12->_overlayView setUserInteractionEnabled:0];
    v27 = v12->_overlayView;
    v28 = [MEMORY[0x263F1C550] whiteColor];
    [(UIView *)v27 setBackgroundColor:v28];

    [(UIView *)v12->_overlayView setAlpha:0.0];
    [(UIView *)v12->_overlayView _setCornerRadius:6.0];
    v29 = [(_UIFloatingContentView *)v12->_floatingView contentView];
    [v29 addSubview:v12->_overlayView];

    v30 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v12 action:sel__selectButtonAction_];
    [(TVButtonLockup *)v12 addGestureRecognizer:v30];
    v31 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v12 action:sel__playButtonAction_];
    [v31 setAllowedPressTypes:&unk_26E59EC08];
    [(TVButtonLockup *)v12 addGestureRecognizer:v31];
    v32 = [MEMORY[0x263F08A00] defaultCenter];
    [v32 addObserver:v12 selector:sel__updateForAccessibilityChange name:*MEMORY[0x263F8B200] object:0];
  }
  return v12;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVButtonLockup;
  [(TVButtonLockup *)&v4 dealloc];
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    backdropView = self->_backdropView;
    double v4 = 1.0;
    if (a3) {
      double v4 = 0.5;
    }
    [(_TVVisualEffectView *)backdropView setAlpha:v4];
  }
}

- (void)setText:(id)a3 minimumScale:(double)a4 maxNumberOfLines:(unint64_t)a5
{
  id v35 = a3;
  v8 = [(UILabel *)self->_textView attributedText];
  if ([v8 isEqualToAttributedString:v35]
    && ([(UILabel *)self->_textView minimumScaleFactor], v9 == a4))
  {
    NSInteger v10 = [(UILabel *)self->_textView numberOfLines];

    if (v10 == a5) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if (self->_imageView)
  {
    id v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 removeObserver:self name:@"TVMLImageViewImageDidLoadNotification" object:0];

    [(_TVImageView *)self->_imageView removeFromSuperview];
    imageView = self->_imageView;
    self->_imageView = 0;

    [(CALayer *)self->_imageMask removeFromSuperlayer];
    imageMask = self->_imageMask;
    self->_imageMask = 0;
  }
  [(UILabel *)self->_textView removeFromSuperview];
  double v14 = [(UILabel *)self->_textMask layer];
  [v14 removeFromSuperlayer];

  id v15 = objc_alloc(MEMORY[0x263F1C768]);
  double v16 = *MEMORY[0x263F001A8];
  double v17 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v18 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v19 = *(double *)(MEMORY[0x263F001A8] + 24);
  v20 = (UILabel *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x263F001A8], v17, v18, v19);
  textView = self->_textView;
  self->_textView = v20;

  [(UILabel *)self->_textView setAttributedText:v35];
  [(UILabel *)self->_textView setOpaque:0];
  [(UILabel *)self->_textView setBackgroundColor:0];
  [(UILabel *)self->_textView setNumberOfLines:a5];
  [(UILabel *)self->_textView setAdjustsFontForContentSizeCategory:1];
  uint64_t v22 = [(_UIFloatingContentView *)self->_floatingView contentView];
  [v22 insertSubview:self->_textView above:self->_overlayView];

  v23 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v16, v17, v18, v19);
  textMask = self->_textMask;
  self->_textMask = v23;

  uint64_t v25 = (void *)[v35 mutableCopy];
  uint64_t v26 = *MEMORY[0x263F1C240];
  v27 = [MEMORY[0x263F1C550] whiteColor];
  v28 = [v35 string];
  objc_msgSend(v25, "addAttribute:value:range:", v26, v27, 0, objc_msgSend(v28, "length"));

  v29 = self->_textMask;
  v30 = (void *)[v25 copy];
  [(UILabel *)v29 setAttributedText:v30];

  [(UILabel *)self->_textMask setOpaque:0];
  [(UILabel *)self->_textMask setBackgroundColor:0];
  [(UILabel *)self->_textMask setNumberOfLines:a5];
  [(UILabel *)self->_textMask setAdjustsFontForContentSizeCategory:1];
  v31 = [(UILabel *)self->_textMask layer];
  if (_AXSHighContrastFocusIndicatorsEnabled()) {
    uint64_t v32 = 0;
  }
  else {
    uint64_t v32 = *MEMORY[0x263F15B90];
  }
  [v31 setCompositingFilter:v32];

  v33 = [(UIView *)self->_overlayView layer];
  objc_super v34 = [(UILabel *)self->_textMask layer];
  [v33 addSublayer:v34];

  if (a4 > 0.0 && a4 < 1.0)
  {
    [(UILabel *)self->_textView setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_textView setMinimumScaleFactor:a4];
    [(UILabel *)self->_textMask setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_textMask setMinimumScaleFactor:a4];
  }
  [(TVButtonLockup *)self setNeedsLayout];

LABEL_15:
}

- (void)setImageView:(id)a3
{
  v5 = (_TVImageView *)a3;
  p_imageView = &self->_imageView;
  v20 = v5;
  if (self->_imageView == v5)
  {
    if (!v5) {
      goto LABEL_10;
    }
    double v17 = [(_TVImageView *)v5 image];

    if (v17) {
      goto LABEL_9;
    }
    double v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 removeObserver:self name:@"TVMLImageViewImageDidLoadNotification" object:0];

    double v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 addObserver:self selector:sel__updateImageMask name:@"TVMLImageViewImageDidLoadNotification" object:*p_imageView];
  }
  else
  {
    textView = self->_textView;
    if (textView)
    {
      [(UILabel *)textView removeFromSuperview];
      v8 = self->_textView;
      self->_textView = 0;

      double v9 = [(UILabel *)self->_textMask layer];
      [v9 removeFromSuperlayer];

      textMask = self->_textMask;
      self->_textMask = 0;
    }
    id v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 removeObserver:self name:@"TVMLImageViewImageDidLoadNotification" object:0];

    [(_TVImageView *)*p_imageView removeFromSuperview];
    [(CALayer *)self->_imageMask removeFromSuperlayer];
    imageMask = self->_imageMask;
    self->_imageMask = 0;

    objc_storeStrong((id *)&self->_imageView, a3);
    if (*p_imageView)
    {
      id v13 = [(_UIFloatingContentView *)self->_floatingView contentView];
      [v13 insertSubview:*p_imageView below:self->_overlayView];

      double v14 = [(_TVImageView *)*p_imageView image];

      if (!v14)
      {
        id v15 = [MEMORY[0x263F08A00] defaultCenter];
        [v15 removeObserver:self name:@"TVMLImageViewImageDidLoadNotification" object:0];

        double v16 = [MEMORY[0x263F08A00] defaultCenter];
        [v16 addObserver:self selector:sel__updateImageMask name:@"TVMLImageViewImageDidLoadNotification" object:*p_imageView];

        goto LABEL_10;
      }
LABEL_9:
      [(TVButtonLockup *)self _updateImageMask];
    }
  }
LABEL_10:
  [(TVButtonLockup *)self setNeedsLayout];
}

- (void)setTitleView:(id)a3
{
  v5 = (UILabel *)a3;
  titleView = self->_titleView;
  v7 = v5;
  if (titleView != v5)
  {
    [(UILabel *)titleView removeFromSuperview];
    objc_storeStrong((id *)&self->_titleView, a3);
    if (self->_titleView) {
      -[TVButtonLockup addSubview:](self, "addSubview:");
    }
  }
  [(TVButtonLockup *)self setNeedsLayout];
}

- (id)backgroundColor
{
  return self->__backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TVButtonLockup;
  id v4 = a3;
  [(TVButtonLockup *)&v11 setBackgroundColor:v4];
  v5 = (UIColor *)objc_msgSend(v4, "copy", v11.receiver, v11.super_class);

  backgroundColor = self->__backgroundColor;
  self->__backgroundColor = v5;

  if (self->__backgroundColor)
  {
    [(_TVVisualEffectView *)self->_backdropView removeFromSuperview];
    v7 = [(_UIFloatingContentView *)self->_floatingView contentView];
    v8 = v7;
    double v9 = self->__backgroundColor;
  }
  else
  {
    NSInteger v10 = [(_UIFloatingContentView *)self->_floatingView visualEffectContainerView];
    [v10 addSubview:self->_backdropView];

    v7 = [(_UIFloatingContentView *)self->_floatingView contentView];
    v8 = v7;
    double v9 = 0;
  }
  [v7 setBackgroundColor:v9];
}

- (void)setHighlightColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_highlightColor = &self->_highlightColor;
  if (self->_highlightColor != v5)
  {
    double v9 = v5;
    objc_storeStrong((id *)&self->_highlightColor, a3);
    overlayView = self->_overlayView;
    if (*p_highlightColor)
    {
      -[UIView setBackgroundColor:](overlayView, "setBackgroundColor:");
    }
    else
    {
      v8 = [MEMORY[0x263F1C550] whiteColor];
      [(UIView *)overlayView setBackgroundColor:v8];
    }
    v5 = v9;
  }
}

- (BOOL)canBecomeFocused
{
  return !self->_disabled;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TVButtonLockup;
  id v6 = a4;
  [(TVButtonLockup *)&v8 didUpdateFocusInContext:a3 withAnimationCoordinator:v6];
  if ([(TVButtonLockup *)self isFocused]) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 0;
  }
  [(_UIFloatingContentView *)self->_floatingView setControlState:v7 withAnimationCoordinator:v6];

  [(TVButtonLockup *)self _updateForFocusStateChange];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TVButtonLockup;
  id v6 = a3;
  [(TVButtonLockup *)&v9 pressesBegan:v6 withEvent:a4];
  uint64_t v7 = objc_msgSend(v6, "anyObject", v9.receiver, v9.super_class);

  uint64_t v8 = [v7 type];
  if ((v8 & 0xFFFFFFFFFFFFFFFDLL) == 4)
  {
    if ([(TVButtonLockup *)self isFocused]) {
      [(_UIFloatingContentView *)self->_floatingView setControlState:9 animated:1];
    }
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TVButtonLockup;
  [(TVButtonLockup *)&v7 pressesCancelled:a3 withEvent:a4];
  if ([(_UIFloatingContentView *)self->_floatingView controlState])
  {
    floatingView = self->_floatingView;
    if ([(TVButtonLockup *)self isFocused]) {
      uint64_t v6 = 8;
    }
    else {
      uint64_t v6 = 0;
    }
    [(_UIFloatingContentView *)floatingView setControlState:v6 animated:1];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TVButtonLockup;
  [(TVButtonLockup *)&v7 pressesEnded:a3 withEvent:a4];
  if ([(_UIFloatingContentView *)self->_floatingView controlState])
  {
    floatingView = self->_floatingView;
    if ([(TVButtonLockup *)self isFocused]) {
      uint64_t v6 = 8;
    }
    else {
      uint64_t v6 = 0;
    }
    [(_UIFloatingContentView *)floatingView setControlState:v6 animated:1];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TVButtonLockup;
  [(TVButtonLockup *)&v5 touchesBegan:a3 withEvent:a4];
  [(_UIFloatingContentView *)self->_floatingView setControlState:9 animated:1];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)TVButtonLockup;
  id v6 = a3;
  [(TVButtonLockup *)&v20 touchesMoved:v6 withEvent:a4];
  [(TVButtonLockup *)self bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  id v15 = [v6 anyObject];

  [v15 locationInView:self];
  v21.double x = v16;
  v21.double y = v17;
  v22.origin.double x = v8;
  v22.origin.double y = v10;
  v22.size.double width = v12;
  v22.size.double height = v14;
  BOOL v18 = CGRectContainsPoint(v22, v21);

  if (v18) {
    uint64_t v19 = 9;
  }
  else {
    uint64_t v19 = 0;
  }
  [(_UIFloatingContentView *)self->_floatingView setControlState:v19 animated:1];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TVButtonLockup;
  [(TVButtonLockup *)&v5 touchesEnded:a3 withEvent:a4];
  if ([(_UIFloatingContentView *)self->_floatingView controlState]) {
    [(_UIFloatingContentView *)self->_floatingView setControlState:0 animated:1];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TVButtonLockup;
  [(TVButtonLockup *)&v5 touchesCancelled:a3 withEvent:a4];
  if ([(_UIFloatingContentView *)self->_floatingView controlState]) {
    [(_UIFloatingContentView *)self->_floatingView setControlState:0 animated:1];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UIView *)self tv_itemWidth];
  if (v4 == 0.0) {
    double v5 = 142.0;
  }
  else {
    double v5 = v4;
  }
  [(UIView *)self tv_itemHeight];
  if (v6 == 0.0) {
    double v7 = 80.0;
  }
  else {
    double v7 = v6;
  }
  CGFloat v8 = [(TVButtonLockup *)self titleView];
  objc_msgSend(v8, "tv_margin");
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  CGFloat v17 = [(TVButtonLockup *)self titleView];
  objc_msgSend(v17, "sizeThatFits:", v5 - (v12 + v16), 0.0);
  double v19 = v18;

  double v20 = v14 + v7 + v10 + v19;
  double v21 = v5;
  result.double height = v20;
  result.double width = v21;
  return result;
}

- (void)layoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)TVButtonLockup;
  [(TVButtonLockup *)&v46 layoutSubviews];
  [(UIView *)self tv_itemWidth];
  if (v3 == 0.0) {
    double v4 = 142.0;
  }
  else {
    double v4 = v3;
  }
  [(UIView *)self tv_itemHeight];
  if (v5 == 0.0) {
    double v6 = 80.0;
  }
  else {
    double v6 = v5;
  }
  double v7 = [(TVButtonLockup *)self titleView];
  objc_msgSend(v7, "tv_margin");
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v4 - (v11 + v13);
  double v15 = [(TVButtonLockup *)self titleView];
  objc_msgSend(v15, "sizeThatFits:", v14, 0.0);
  double v17 = v16;

  -[_UIFloatingContentView setFrame:](self->_floatingView, "setFrame:", 0.0, 0.0, v4, v6);
  -[_TVVisualEffectView setFrame:](self->_backdropView, "setFrame:", 0.0, 0.0, v4, v6);
  -[UIView setFrame:](self->_overlayView, "setFrame:", 0.0, 0.0, v4, v6);
  if (self->_textView)
  {
    [(UIView *)self tv_padding];
    double v19 = v18;
    double v21 = v20;
    [(UILabel *)self->_textView tv_margin];
    [(UILabel *)self->_textView tv_textSizeForWidth:v4 - (v21 + v23 + v19 + v22)];
    double v25 = v24;
    double v27 = v26;
    double v28 = floor((v4 - v24) * 0.5);
    double v44 = v14;
    double v29 = v11;
    double v30 = v17;
    double v31 = v9;
    double v32 = floor((v6 - v26) * 0.5);
    -[UILabel setFrame:](self->_textView, "setFrame:", v28, v32, v24, v26);
    v33 = [(UILabel *)self->_textMask layer];
    double v34 = v32;
    double v9 = v31;
    double v17 = v30;
    double v11 = v29;
    double v14 = v44;
    objc_msgSend(v33, "setFrame:", v28, v34, v25, v27);
  }
  else
  {
    imageView = self->_imageView;
    if (imageView)
    {
      -[_TVImageView sizeThatFits:](imageView, "sizeThatFits:", v4, v6);
      double v45 = v9;
      double v37 = v36;
      double v39 = v38;
      double v40 = floor((v4 - v36) * 0.5);
      double v41 = floor((v6 - v38) * 0.5);
      -[_TVImageView setFrame:](self->_imageView, "setFrame:", v40, v41, v36, v38);
      double v42 = v37;
      double v9 = v45;
      -[CALayer setFrame:](self->_imageMask, "setFrame:", v40, v41, v42, v39);
    }
  }
  v43 = [(TVButtonLockup *)self titleView];
  objc_msgSend(v43, "setFrame:", v11, v6 + v9 + -7.0, v14, v17 + 2.0 + 12.0);

  [(TVButtonLockup *)self _updateForFocusStateChange];
  [(TVButtonLockup *)self bounds];
  -[TVButtonLockup _setFocusableContentMargins:](self, "_setFocusableContentMargins:", 0.0, 0.0, CGRectGetHeight(v47) - v6, 0.0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(TVButtonLockup *)self traitCollection];
    if ([v5 userInterfaceStyle])
    {
      [v4 userInterfaceStyle];
      double v6 = [(TVButtonLockup *)self traitCollection];
      [v6 userInterfaceStyle];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)TVButtonLockup;
  [(TVButtonLockup *)&v7 traitCollectionDidChange:v4];
}

- (int64_t)_focusedSound
{
  return 1;
}

- (void)_updateTextForAccessibilityAndFocus
{
  char v3 = [(TVButtonLockup *)self isFocused];
  textView = self->_textView;
  if (v3)
  {
    int v5 = _AXSHighContrastFocusIndicatorsEnabled();
    double v6 = 1.0;
    if (!v5) {
      double v6 = 0.0;
    }
    [(UILabel *)textView setAlpha:v6];
    objc_super v7 = self->_textView;
    if (_AXSHighContrastFocusIndicatorsEnabled())
    {
      uint64_t v8 = [MEMORY[0x263F1C550] blackColor];
      goto LABEL_8;
    }
  }
  else
  {
    [(UILabel *)self->_textView setAlpha:1.0];
    objc_super v7 = self->_textView;
  }
  uint64_t v8 = [MEMORY[0x263F1C550] whiteColor];
LABEL_8:
  id v9 = (id)v8;
  -[UILabel setColor:](v7, "setColor:");
}

- (void)_updateForAccessibilityChange
{
  imageMask = self->_imageMask;
  int v4 = _AXSHighContrastFocusIndicatorsEnabled();
  uint64_t v5 = *MEMORY[0x263F15B90];
  if (v4) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = *MEMORY[0x263F15B90];
  }
  [(CALayer *)imageMask setCompositingFilter:v6];
  objc_super v7 = [(UILabel *)self->_textMask layer];
  if (_AXSHighContrastFocusIndicatorsEnabled()) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v5;
  }
  [v7 setCompositingFilter:v8];

  [(TVButtonLockup *)self _updateTextForAccessibilityAndFocus];
}

- (void)_updateForFocusStateChange
{
  uint64_t v3 = [(TVButtonLockup *)self isFocused];
  if (v3) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  if (v3) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  [(UIView *)self->_overlayView setAlpha:v4];
  [(_TVImageView *)self->_imageView setAlpha:v5];
  [(UILabel *)self->_titleView setHidden:v3 ^ 1];
  [(CALayer *)self->_imageMask setAllowsEdgeAntialiasing:v3];
  [(TVButtonLockup *)self _updateShadowForLabel:self->_titleView inFocus:v3];
  [(TVButtonLockup *)self _updateTextForAccessibilityAndFocus];
}

- (void)_updateImageMask
{
  uint64_t v3 = [(_TVImageView *)self->_imageView image];

  if (v3)
  {
    double v4 = [(_TVImageView *)self->_imageView image];
    double v5 = [MEMORY[0x263F1C550] blackColor];
    uint64_t v6 = [v4 _flatImageWithColor:v5];

    [(CALayer *)self->_imageMask removeFromSuperlayer];
    objc_super v7 = [MEMORY[0x263F157E8] layer];
    imageMask = self->_imageMask;
    self->_imageMask = v7;

    id v9 = self->_imageMask;
    if (_AXSHighContrastFocusIndicatorsEnabled()) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = *MEMORY[0x263F15B90];
    }
    [(CALayer *)v9 setCompositingFilter:v10];
    double v11 = [(UIView *)self->_overlayView layer];
    [v11 addSublayer:self->_imageMask];

    double v12 = self->_imageMask;
    id v13 = v6;
    -[CALayer setContents:](v12, "setContents:", [v13 CGImage]);
    [(_TVImageView *)self->_imageView frame];
    -[CALayer setFrame:](self->_imageMask, "setFrame:");
  }
}

- (void)_selectButtonAction:(id)a3
{
}

- (void)_playButtonAction:(id)a3
{
}

- (void)_updateShadowForLabel:(id)a3 inFocus:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v11 = v5;
  if (v4)
  {
    if (!_updateShadowForLabel_inFocus____ShadowColor_0)
    {
      uint64_t v6 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.4];
      objc_super v7 = (void *)_updateShadowForLabel_inFocus____ShadowColor_0;
      _updateShadowForLabel_inFocus____ShadowColor_0 = v6;

      id v5 = v11;
    }
    objc_msgSend(v5, "setShadowColor:");
    double v8 = 2.0;
    double v9 = 0.0;
    double v10 = 6.0;
  }
  else
  {
    [v5 setShadowColor:0];
    double v9 = *MEMORY[0x263F001B0];
    double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
    double v10 = 0.0;
  }
  objc_msgSend(v11, "setShadowOffset:", v9, v8);
  [v11 setShadowBlur:v10];
}

- (int64_t)backdropStyle
{
  return self->_backdropStyle;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (int64_t)vibrantLabelThemeOverride
{
  return self->_vibrantLabelThemeOverride;
}

- (void)setVibrantLabelThemeOverride:(int64_t)a3
{
  self->_vibrantLabelThemeOverride = a3;
}

- (_TVImageView)imageView
{
  return self->_imageView;
}

- (UILabel)titleView
{
  return self->_titleView;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->__backgroundColor, 0);
  objc_storeStrong((id *)&self->_imageMask, 0);
  objc_storeStrong((id *)&self->_textMask, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_floatingView, 0);
}

@end