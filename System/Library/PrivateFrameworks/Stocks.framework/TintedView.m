@interface TintedView
- (TintedView)init;
- (UIColor)tintColor;
- (UIImage)image;
- (void)drawRect:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation TintedView

- (TintedView)init
{
  v6.receiver = self;
  v6.super_class = (Class)TintedView;
  v2 = [(TintedView *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F1C550] clearColor];
    [(TintedView *)v2 setBackgroundColor:v3];

    v4 = [(TintedView *)v2 layer];
    [v4 setNeedsDisplayOnBoundsChange:0];
  }
  return v2;
}

- (void)drawRect:(CGRect)a3
{
  if (self->_image)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    [(TintedView *)self bounds];
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    -[UIImage drawInRect:](self->_image, "drawInRect:");
    if (self->_tintColor)
    {
      CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceIn);
      [(UIColor *)self->_tintColor set];
      uint64_t v13 = v6;
      uint64_t v14 = v8;
      uint64_t v15 = v10;
      uint64_t v16 = v12;
      CGContextFillRect(CurrentContext, *(CGRect *)&v13);
    }
  }
}

- (void)setImage:(id)a3
{
  uint64_t v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    objc_storeStrong((id *)&self->_image, a3);
    double v6 = *MEMORY[0x263F00148];
    double v7 = *(double *)(MEMORY[0x263F00148] + 8);
    [(UIImage *)self->_image size];
    -[TintedView setBounds:](self, "setBounds:", v6, v7, v8, v9);
    v10.receiver = self;
    v10.super_class = (Class)TintedView;
    [(TintedView *)&v10 setNeedsDisplay];
  }
}

- (void)setTintColor:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end