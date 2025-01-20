@interface NTKColorSliderThumbView
- (CGSize)sizeThatFits:(CGSize)result;
- (NTKColorSliderThumbView)initWithFrame:(CGRect)a3;
- (UIColor)color;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setColor:(id)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation NTKColorSliderThumbView

- (NTKColorSliderThumbView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)NTKColorSliderThumbView;
  v3 = -[NTKColorSliderThumbView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    border = v3->_border;
    v3->_border = (UIView *)v4;

    v6 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v3->_border setBackgroundColor:v6];

    id v7 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v8 = [v7 CGColor];
    v9 = [(UIView *)v3->_border layer];
    [v9 setShadowColor:v8];

    v10 = [(UIView *)v3->_border layer];
    LODWORD(v11) = 0.5;
    [v10 setShadowOpacity:v11];

    double v12 = *MEMORY[0x1E4F1DB30];
    double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v14 = [(UIView *)v3->_border layer];
    objc_msgSend(v14, "setShadowOffset:", v12, v13);

    v15 = [(UIView *)v3->_border layer];
    [v15 setShadowRadius:10.0];

    [(NTKColorSliderThumbView *)v3 addSubview:v3->_border];
    uint64_t v16 = objc_opt_new();
    content = v3->_content;
    v3->_content = (UIView *)v16;

    [(NTKColorSliderThumbView *)v3 addSubview:v3->_content];
  }
  return v3;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)NTKColorSliderThumbView;
  [(NTKColorSliderThumbView *)&v22 layoutSubviews];
  [(NTKColorSliderThumbView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_border, "setFrame:");
  v23.origin.CGFloat x = v4;
  v23.origin.CGFloat y = v6;
  v23.size.CGFloat width = v8;
  v23.size.CGFloat height = v10;
  CGFloat v11 = CGRectGetWidth(v23) * 0.5;
  double v12 = [(UIView *)self->_border layer];
  [v12 setCornerRadius:v11];

  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v4, v6, v8, v10);
  id v13 = objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 CGPath];
  v15 = [(UIView *)self->_border layer];
  [v15 setShadowPath:v14];

  v24.origin.CGFloat x = v4;
  v24.origin.CGFloat y = v6;
  v24.size.CGFloat width = v8;
  v24.size.CGFloat height = v10;
  CGRect v25 = CGRectInset(v24, 6.0, 6.0);
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  -[UIView setFrame:](self->_content, "setFrame:");
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat v20 = CGRectGetWidth(v26) * 0.5;
  v21 = [(UIView *)self->_content layer];
  [v21 setCornerRadius:v20];
}

- (CGSize)sizeThatFits:(CGSize)result
{
  if (result.width >= result.height) {
    result.double width = result.height;
  }
  double width = result.width;
  result.CGFloat height = width;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  if (a3.size.width >= a3.size.height) {
    a3.size.double width = a3.size.height;
  }
  v3.receiver = self;
  v3.super_class = (Class)NTKColorSliderThumbView;
  -[NTKColorSliderThumbView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.width);
}

- (void)setBounds:(CGRect)a3
{
  if (a3.size.width >= a3.size.height) {
    a3.size.double width = a3.size.height;
  }
  v3.receiver = self;
  v3.super_class = (Class)NTKColorSliderThumbView;
  -[NTKColorSliderThumbView setBounds:](&v3, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.width);
}

- (void)setColor:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_border, 0);
}

@end