@interface SUUIStyledImageButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)useBigHitTarget;
- (CGRect)hitRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIImageView)additionalImageView;
- (SUUIImageView)imageView;
- (SUUIStyledImageButton)initWithFrame:(CGRect)a3;
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

@implementation SUUIStyledImageButton

- (SUUIStyledImageButton)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SUUIStyledImageButton;
  v3 = -[SUUIStyledImageButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [SUUIImageView alloc];
    [(SUUIStyledImageButton *)v3 bounds];
    uint64_t v5 = -[SUUIImageView initWithFrame:](v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (SUUIImageView *)v5;

    [(SUUIImageView *)v3->_imageView setAutoresizingMask:18];
    [(SUUIImageView *)v3->_imageView setUserInteractionEnabled:0];
    [(SUUIStyledImageButton *)v3 addSubview:v3->_imageView];
    v7 = [SUUIImageView alloc];
    uint64_t v8 = -[SUUIImageView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    additionalImageView = v3->_additionalImageView;
    v3->_additionalImageView = (SUUIImageView *)v8;

    [(SUUIImageView *)v3->_additionalImageView setAutoresizingMask:45];
    [(SUUIImageView *)v3->_additionalImageView setUserInteractionEnabled:0];
    [(SUUIStyledImageButton *)v3 addSubview:v3->_additionalImageView];
  }
  return v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->_didInitialHighlightForTouch = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUUIStyledImageButton;
  [(SUUIStyledImageButton *)&v4 touchesBegan:a3 withEvent:a4];
}

- (CGRect)hitRect
{
  if (self->_useBigHitTarget)
  {
    v15.receiver = self;
    v15.super_class = (Class)SUUIStyledImageButton;
    [(SUUIStyledImageButton *)&v15 hitRect];
    uint64_t v7 = 480;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SUUIStyledImageButton;
    [(SUUIStyledImageButton *)&v14 hitRect];
    uint64_t v7 = 520;
  }
  uint64_t v8 = (double *)((char *)self + v7);
  double v9 = v8[1];
  double v10 = v3 + v9;
  double v11 = v4 + *v8;
  double v12 = v5 - (v9 + v8[3]);
  double v13 = v6 - (*v8 + v8[2]);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIStyledImageButton;
  [(SUUIStyledImageButton *)&v9 layoutSubviews];
  [(SUUIImageView *)self->_additionalImageView imageSize];
  double v4 = v3;
  double v6 = v5;
  additionalImageView = self->_additionalImageView;
  [(SUUIStyledImageButton *)self bounds];
  CGFloat v8 = CGRectGetMidX(v10) - v4 * 0.5;
  [(SUUIStyledImageButton *)self bounds];
  -[SUUIImageView setFrame:](additionalImageView, "setFrame:", v8, CGRectGetMidY(v11) - v6 * 0.5, v4, v6);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SUUIStyledImageButton *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;
  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (void)setBackgroundColor:(id)a3
{
  imageView = self->_imageView;
  id v5 = a3;
  [(SUUIImageView *)imageView setBackgroundColor:v5];
  additionalImageView = self->_additionalImageView;
  uint64_t v7 = [MEMORY[0x263F825C8] clearColor];
  [(SUUIImageView *)additionalImageView setBackgroundColor:v7];

  v8.receiver = self;
  v8.super_class = (Class)SUUIStyledImageButton;
  [(SUUIStyledImageButton *)&v8 setBackgroundColor:v5];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUUIStyledImageButton *)self isHighlighted] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUIStyledImageButton;
    [(SUUIStyledImageButton *)&v7 setHighlighted:v3];
    double v5 = 1.0;
    if (v3 && (double v5 = 0.2, !self->_didInitialHighlightForTouch))
    {
      -[SUUIStyledImageButton setAlpha:](self, "setAlpha:", 0.2, 0.2);
      self->_didInitialHighlightForTouch = 1;
    }
    else
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __40__SUUIStyledImageButton_setHighlighted___block_invoke;
      v6[3] = &unk_2654019B0;
      v6[4] = self;
      *(double *)&v6[5] = v5;
      [MEMORY[0x263F82E00] animateWithDuration:327684 delay:v6 options:0 animations:0.47 completion:0.0];
    }
  }
}

uint64_t __40__SUUIStyledImageButton_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[SUUIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
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

- (SUUIImageView)imageView
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

- (SUUIImageView)additionalImageView
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

@end