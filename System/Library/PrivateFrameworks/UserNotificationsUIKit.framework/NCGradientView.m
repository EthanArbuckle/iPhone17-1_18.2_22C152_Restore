@interface NCGradientView
- (NCGradientView)initWithHorizontalStartColor:(id)a3 horizontalEndColor:(id)a4;
- (NCGradientView)initWithVerticalStartColor:(id)a3 verticalEndColor:(id)a4;
- (void)layoutSubviews;
@end

@implementation NCGradientView

- (NCGradientView)initWithHorizontalStartColor:(id)a3 horizontalEndColor:(id)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NCGradientView;
  v8 = -[NCGradientView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F39BD0] layer];
    gradient = v8->_gradient;
    v8->_gradient = (CAGradientLayer *)v9;

    v11 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v12 = [v11 userInterfaceLayoutDirection];

    v13 = v8->_gradient;
    if (v12 == 1)
    {
      v21[0] = [v7 CGColor];
      v14 = v21;
      v15 = v6;
    }
    else
    {
      uint64_t v20 = [v6 CGColor];
      v14 = &v20;
      v15 = v7;
    }
    v14[1] = [v15 CGColor];
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    [(CAGradientLayer *)v13 setColors:v16];

    v17 = [(NCGradientView *)v8 layer];
    [v17 insertSublayer:v8->_gradient atIndex:0];

    v8->_isVertical = 0;
  }

  return v8;
}

- (NCGradientView)initWithVerticalStartColor:(id)a3 verticalEndColor:(id)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NCGradientView;
  v8 = -[NCGradientView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F39BD0] layer];
    gradient = v8->_gradient;
    v8->_gradient = (CAGradientLayer *)v9;

    v11 = v8->_gradient;
    v16[0] = [v6 CGColor];
    v16[1] = [v7 CGColor];
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    [(CAGradientLayer *)v11 setColors:v12];

    v13 = [(NCGradientView *)v8 layer];
    [v13 insertSublayer:v8->_gradient atIndex:0];

    v8->_isVertical = 1;
  }

  return v8;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)NCGradientView;
  [(NCGradientView *)&v8 layoutSubviews];
  gradient = self->_gradient;
  [(NCGradientView *)self bounds];
  -[CAGradientLayer setFrame:](gradient, "setFrame:");
  double v4 = 0.0;
  if (self->_isVertical) {
    double v5 = 0.5;
  }
  else {
    double v5 = 0.0;
  }
  if (self->_isVertical)
  {
    double v6 = 0.5;
  }
  else
  {
    double v4 = 0.5;
    double v6 = 1.0;
  }
  if (self->_isVertical) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.5;
  }
  -[CAGradientLayer setStartPoint:](self->_gradient, "setStartPoint:", v5, v4);
  -[CAGradientLayer setEndPoint:](self->_gradient, "setEndPoint:", v6, v7);
}

- (void).cxx_destruct
{
}

@end