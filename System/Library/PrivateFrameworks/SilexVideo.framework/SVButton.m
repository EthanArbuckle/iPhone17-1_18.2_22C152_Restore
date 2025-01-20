@interface SVButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (SVButton)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)touchInsets;
- (id)touchUpInsideBlock;
- (void)_privateButtonTapped;
- (void)onTouchUpInside:(id)a3;
- (void)setTouchInsets:(UIEdgeInsets)a3;
@end

@implementation SVButton

- (SVButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SVButton;
  v3 = -[SVButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SVButton *)v3 addTarget:v3 action:sel__privateButtonTapped forControlEvents:64];
  }
  return v4;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v28.receiver = self;
  v28.super_class = (Class)SVButton;
  unsigned __int8 v7 = -[SVButton pointInside:withEvent:](&v28, sel_pointInside_withEvent_, a4);
  [(SVButton *)self bounds];
  double v26 = v9;
  double v27 = v8;
  double v25 = v10;
  double v12 = v11;
  [(SVButton *)self touchInsets];
  double v14 = v13;
  [(SVButton *)self touchInsets];
  double v16 = v15;
  [(SVButton *)self touchInsets];
  double v18 = v17;
  [(SVButton *)self touchInsets];
  double v20 = v19;
  [(SVButton *)self touchInsets];
  double v22 = v21;
  [(SVButton *)self touchInsets];
  if (v7) {
    return 1;
  }
  v30.size.height = v12 - (v22 + v23);
  v30.size.width = v25 - (v18 + v20);
  v30.origin.CGFloat y = v26 + v16;
  v30.origin.CGFloat x = v27 + v14;
  v29.CGFloat x = x;
  v29.CGFloat y = y;
  return CGRectContainsPoint(v30, v29);
}

- (void)_privateButtonTapped
{
  v3 = [(SVButton *)self touchUpInsideBlock];

  if (v3)
  {
    v4 = [(SVButton *)self touchUpInsideBlock];
    v4[2]();
  }
}

- (UIEdgeInsets)touchInsets
{
  double top = self->_touchInsets.top;
  double left = self->_touchInsets.left;
  double bottom = self->_touchInsets.bottom;
  double right = self->_touchInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

- (id)touchUpInsideBlock
{
  return self->_touchUpInsideBlock;
}

- (void)onTouchUpInside:(id)a3
{
}

- (void).cxx_destruct
{
}

@end