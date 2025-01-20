@interface UIKeyboardDicationBackground
- (UIKeyboardDicationBackground)initWithFrame:(CGRect)a3;
- (UIKeyboardDicationBackgroundGradientView)gradient;
- (id)shadows;
- (void)layoutSubviews;
- (void)setGradient:(id)a3;
@end

@implementation UIKeyboardDicationBackground

- (id)shadows
{
  v2 = (void *)shadows_shadows;
  if (!shadows_shadows)
  {
    int v3 = 4;
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    v5 = (void *)shadows_shadows;
    shadows_shadows = v4;

    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      v10 = (void *)shadows_shadows;
      v11 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v6, v7, v8, v9);
      [v10 addObject:v11];

      --v3;
    }
    while (v3);
    v2 = (void *)shadows_shadows;
  }
  return v2;
}

- (void)layoutSubviews
{
  [(UIView *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(UIKeyboardDicationBackground *)self gradient];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  id v12 = [(UIKeyboardDicationBackground *)self gradient];
  [v12 setNeedsDisplay];
}

- (UIKeyboardDicationBackground)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardDicationBackground;
  double v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = +[UIColor clearColor];
    [(UIView *)v3 setBackgroundColor:v4];

    double v5 = [UIKeyboardDicationBackgroundGradientView alloc];
    [(UIView *)v3 frame];
    double v6 = -[UIKeyboardDicationBackgroundGradientView initWithFrame:](v5, "initWithFrame:");
    [(UIKeyboardDicationBackground *)v3 setGradient:v6];

    double v7 = [(UIKeyboardDicationBackground *)v3 gradient];
    [(UIView *)v3 addSubview:v7];

    [(UIView *)v3 setNeedsLayout];
    double v8 = v3;
  }

  return v3;
}

- (UIKeyboardDicationBackgroundGradientView)gradient
{
  return self->_gradient;
}

- (void)setGradient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_shadows, 0);
}

@end