@interface CRLiOSInspectorCheckmark
+ (id)checkmark;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)usesCustomCheckmarkImage;
- (CGSize)intrinsicContentSize;
- (CRLiOSInspectorCheckmark)initWithFrame:(CGRect)a3;
- (UIButton)checkmarkImageButton;
- (UIImage)customCheckmarkImage;
- (UIImage)customHighlightedCheckmarkImage;
- (void)p_updateTintColor;
- (void)setCheckmarkImageButton:(id)a3;
- (void)setCustomCheckmarkImage:(id)a3;
- (void)setCustomHighlightedCheckmarkImage:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setUsesCustomCheckmarkImage:(BOOL)a3;
- (void)setupDefaultCheckmarkImage;
- (void)tintColorDidChange;
@end

@implementation CRLiOSInspectorCheckmark

+ (id)checkmark
{
  v2 = -[CRLiOSInspectorCheckmark initWithFrame:]([CRLiOSInspectorCheckmark alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  return v2;
}

- (CRLiOSInspectorCheckmark)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSInspectorCheckmark;
  v3 = -[CRLiOSInspectorCheckmark initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_enabled = 1;
    uint64_t v5 = +[UIButton buttonWithType:0];
    checkmarkImageButton = v4->_checkmarkImageButton;
    v4->_checkmarkImageButton = (UIButton *)v5;

    [(UIButton *)v4->_checkmarkImageButton setCrl_deprecatedAdjustsImageWhenHighlighted:1];
    [(UIButton *)v4->_checkmarkImageButton setCrl_deprecatedAdjustsImageWhenDisabled:1];
    [(UIButton *)v4->_checkmarkImageButton setContentMode:4];
    [(CRLiOSInspectorCheckmark *)v4 addSubview:v4->_checkmarkImageButton];
    [(CRLiOSInspectorCheckmark *)v4 setupDefaultCheckmarkImage];
    [(CRLiOSInspectorCheckmark *)v4 p_updateTintColor];
    [(UIButton *)v4->_checkmarkImageButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(CRLiOSInspectorCheckmark *)v4 crl_constraintsToAllSidesOfItem:v4->_checkmarkImageButton];
    +[NSLayoutConstraint activateConstraints:v7];
  }
  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  [(CRLiOSInspectorCheckmark *)self p_updateTintColor];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    if (self->_usesCustomCheckmarkImage) {
      -[UIButton setHighlighted:](self->_checkmarkImageButton, "setHighlighted:");
    }
    else {
      [(CRLiOSInspectorCheckmark *)self p_updateTintColor];
    }
  }
}

- (void)setUsesCustomCheckmarkImage:(BOOL)a3
{
  if (self->_usesCustomCheckmarkImage != a3)
  {
    if (a3)
    {
      [(UIButton *)self->_checkmarkImageButton setImage:self->_customCheckmarkImage forState:0];
      [(UIButton *)self->_checkmarkImageButton setImage:self->_customHighlightedCheckmarkImage forState:1];
      [(UIImage *)self->_customCheckmarkImage size];
      double v5 = v4;
      [(UIImage *)self->_customCheckmarkImage size];
      -[UIButton setFrame:](self->_checkmarkImageButton, "setFrame:", 0.0, 0.0, v5, v6);
    }
    else
    {
      [(CRLiOSInspectorCheckmark *)self setupDefaultCheckmarkImage];
      [(CRLiOSInspectorCheckmark *)self p_updateTintColor];
    }
    [(CRLiOSInspectorCheckmark *)self setNeedsLayout];
  }
}

- (void)setupDefaultCheckmarkImage
{
  v3 = +[UIImageSymbolConfiguration configurationWithWeight:6];
  id v8 = +[UIImage systemImageNamed:@"checkmark" withConfiguration:v3];

  double v4 = [v8 crl_imageWithAlpha:0 renderingMode:0.400000006];
  [(UIButton *)self->_checkmarkImageButton setImage:v8 forState:0];
  [(UIButton *)self->_checkmarkImageButton setImage:v4 forState:1];
  [v8 size];
  double v6 = v5;
  [v8 size];
  -[UIButton setFrame:](self->_checkmarkImageButton, "setFrame:", 0.0, 0.0, v6, v7);
}

- (void)setCustomCheckmarkImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_customCheckmarkImage != v5)
  {
    objc_storeStrong((id *)&self->_customCheckmarkImage, a3);
    [(CRLiOSInspectorCheckmark *)self setUsesCustomCheckmarkImage:v5 != 0];
    [(CRLiOSInspectorCheckmark *)self setNeedsLayout];
  }
}

- (void)setCustomHighlightedCheckmarkImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_customHighlightedCheckmarkImage != v5)
  {
    objc_storeStrong((id *)&self->_customHighlightedCheckmarkImage, a3);
    [(UIButton *)self->_checkmarkImageButton setImage:v5 forState:1];
    [(CRLiOSInspectorCheckmark *)self setNeedsLayout];
  }
}

- (void)p_updateTintColor
{
  v3 = [(CRLiOSInspectorCheckmark *)self tintColor];
  if (self->_enabled)
  {
    if (!self->_highlighted) {
      goto LABEL_6;
    }
    id v8 = v3;
    uint64_t v4 = [v3 colorWithAlphaComponent:0.8];
  }
  else
  {
    id v8 = v3;
    uint64_t v4 = +[UIColor secondaryLabelColor];
  }
  double v5 = (void *)v4;

  v3 = v5;
LABEL_6:
  if (!v3)
  {
    v3 = +[UIColor labelColor];
  }
  id v9 = v3;
  double v6 = [(CRLiOSInspectorCheckmark *)self checkmarkImageButton];
  double v7 = [v6 imageView];
  [v7 setTintColor:v9];
}

- (CGSize)intrinsicContentSize
{
  [(UIButton *)self->_checkmarkImageButton intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSInspectorCheckmark;
  [(CRLiOSInspectorCheckmark *)&v3 tintColorDidChange];
  [(CRLiOSInspectorCheckmark *)self p_updateTintColor];
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)usesCustomCheckmarkImage
{
  return self->_usesCustomCheckmarkImage;
}

- (UIImage)customCheckmarkImage
{
  return self->_customCheckmarkImage;
}

- (UIImage)customHighlightedCheckmarkImage
{
  return self->_customHighlightedCheckmarkImage;
}

- (UIButton)checkmarkImageButton
{
  return self->_checkmarkImageButton;
}

- (void)setCheckmarkImageButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkImageButton, 0);
  objc_storeStrong((id *)&self->_customHighlightedCheckmarkImage, 0);

  objc_storeStrong((id *)&self->_customCheckmarkImage, 0);
}

@end