@interface SKUIStyledImageButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)useBigHitTarget;
- (CGRect)hitRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIImageView)additionalImageView;
- (SKUIImageView)imageView;
- (SKUIStyledImageButton)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)bigHitInsets;
- (UIEdgeInsets)hitRectInsets;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setBigHitInsets:(UIEdgeInsets)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHitRectInsets:(UIEdgeInsets)a3;
- (void)setUseBigHitTarget:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation SKUIStyledImageButton

- (SKUIStyledImageButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStyledImageButton initWithFrame:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIStyledImageButton;
  v8 = -[SKUIStyledImageButton initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [SKUIImageView alloc];
    [(SKUIStyledImageButton *)v8 bounds];
    uint64_t v10 = -[SKUIImageView initWithFrame:](v9, "initWithFrame:");
    imageView = v8->_imageView;
    v8->_imageView = (SKUIImageView *)v10;

    [(SKUIImageView *)v8->_imageView setAutoresizingMask:18];
    [(SKUIImageView *)v8->_imageView setUserInteractionEnabled:0];
    [(SKUIStyledImageButton *)v8 addSubview:v8->_imageView];
    v12 = [SKUIImageView alloc];
    uint64_t v13 = -[SKUIImageView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    additionalImageView = v8->_additionalImageView;
    v8->_additionalImageView = (SKUIImageView *)v13;

    [(SKUIImageView *)v8->_additionalImageView setAutoresizingMask:45];
    [(SKUIImageView *)v8->_additionalImageView setUserInteractionEnabled:0];
    [(SKUIStyledImageButton *)v8 addSubview:v8->_additionalImageView];
  }
  return v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->_didInitialHighlightForTouch = 0;
  v4.receiver = self;
  v4.super_class = (Class)SKUIStyledImageButton;
  [(SKUIStyledImageButton *)&v4 touchesBegan:a3 withEvent:a4];
}

- (CGRect)hitRect
{
  if (self->_useBigHitTarget)
  {
    v15.receiver = self;
    v15.super_class = (Class)SKUIStyledImageButton;
    [(SKUIStyledImageButton *)&v15 hitRect];
    uint64_t v7 = 480;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SKUIStyledImageButton;
    [(SKUIStyledImageButton *)&v14 hitRect];
    uint64_t v7 = 520;
  }
  v8 = (double *)((char *)self + v7);
  double v9 = v8[1];
  double v10 = v3 + v9;
  double v11 = v4 + *v8;
  double v12 = v5 - (v9 + v8[3]);
  double v13 = v6 - (*v8 + v8[2]);
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SKUIStyledImageButton;
  [(SKUIStyledImageButton *)&v9 layoutSubviews];
  [(SKUIImageView *)self->_additionalImageView imageSize];
  double v4 = v3;
  double v6 = v5;
  additionalImageView = self->_additionalImageView;
  [(SKUIStyledImageButton *)self bounds];
  CGFloat v8 = CGRectGetMidX(v10) - v4 * 0.5;
  [(SKUIStyledImageButton *)self bounds];
  -[SKUIImageView setFrame:](additionalImageView, "setFrame:", v8, CGRectGetMidY(v11) - v6 * 0.5, v4, v6);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SKUIStyledImageButton *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (void)setBackgroundColor:(id)a3
{
  imageView = self->_imageView;
  id v5 = a3;
  [(SKUIImageView *)imageView setBackgroundColor:v5];
  additionalImageView = self->_additionalImageView;
  uint64_t v7 = [MEMORY[0x1E4FB1618] clearColor];
  [(SKUIImageView *)additionalImageView setBackgroundColor:v7];

  v8.receiver = self;
  v8.super_class = (Class)SKUIStyledImageButton;
  [(SKUIStyledImageButton *)&v8 setBackgroundColor:v5];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SKUIStyledImageButton *)self isHighlighted] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUIStyledImageButton;
    [(SKUIStyledImageButton *)&v7 setHighlighted:v3];
    double v5 = 1.0;
    if (v3 && (double v5 = 0.2, !self->_didInitialHighlightForTouch))
    {
      -[SKUIStyledImageButton setAlpha:](self, "setAlpha:", 0.2, 0.2);
      self->_didInitialHighlightForTouch = 1;
    }
    else
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __40__SKUIStyledImageButton_setHighlighted___block_invoke;
      v6[3] = &unk_1E6426868;
      v6[4] = self;
      *(double *)&v6[5] = v5;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:327684 delay:v6 options:0 animations:0.47 completion:0.0];
    }
  }
}

uint64_t __40__SKUIStyledImageButton_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[SKUIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
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

- (SKUIImageView)imageView
{
  return self->_imageView;
}

- (BOOL)useBigHitTarget
{
  return self->_useBigHitTarget;
}

- (void)setUseBigHitTarget:(BOOL)a3
{
  self->_useBigHitTarget = a3;
}

- (SKUIImageView)additionalImageView
{
  return self->_additionalImageView;
}

- (UIEdgeInsets)hitRectInsets
{
  double top = self->_hitRectInsets.top;
  double left = self->_hitRectInsets.left;
  double bottom = self->_hitRectInsets.bottom;
  double right = self->_hitRectInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setHitRectInsets:(UIEdgeInsets)a3
{
  self->_hitRectInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalImageView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIStyledImageButton initWithFrame:]";
}

@end