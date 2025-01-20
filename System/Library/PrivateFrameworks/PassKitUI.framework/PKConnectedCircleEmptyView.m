@interface PKConnectedCircleEmptyView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKConnectedCircleEmptyView)init;
- (PKConnectedCircleEmptyView)initWithFrame:(CGRect)a3;
- (PKConnectedCircleEmptyView)initWithOuterColor:(id)a3 innerColor:(id)a4;
- (UIColor)innerColor;
- (UIColor)outerColor;
- (void)drawRect:(CGRect)a3;
@end

@implementation PKConnectedCircleEmptyView

- (PKConnectedCircleEmptyView)initWithOuterColor:(id)a3 innerColor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = -[PKConnectedCircleEmptyView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_outerColor, a3);
    objc_storeStrong((id *)&v10->_innerColor, a4);
  }

  return v10;
}

- (PKConnectedCircleEmptyView)init
{
  return -[PKConnectedCircleEmptyView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKConnectedCircleEmptyView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKConnectedCircleEmptyView;
  v3 = -[PKConnectedCircleEmptyView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PKConnectedCircleEmptyView *)v3 setOpaque:0];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 24.0;
  double v4 = 24.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  PKSizeAlignedInRect();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  PKSizeAlignedInRect();
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CurrentContext = UIGraphicsGetCurrentContext();
  outerColor = self->_outerColor;
  if (outerColor)
  {
    CGContextSetFillColorWithColor(CurrentContext, [(UIColor *)outerColor CGColor]);
    CGContextBeginPath(CurrentContext);
    v24.origin.x = v5;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    CGContextAddEllipseInRect(CurrentContext, v24);
    CGContextDrawPath(CurrentContext, kCGPathFill);
  }
  innerColor = self->_innerColor;
  if (innerColor)
  {
    CGContextSetFillColorWithColor(CurrentContext, [(UIColor *)innerColor CGColor]);
    CGContextBeginPath(CurrentContext);
    v25.origin.x = v13;
    v25.origin.y = v15;
    v25.size.width = v17;
    v25.size.height = v19;
    CGContextAddEllipseInRect(CurrentContext, v25);
    CGContextDrawPath(CurrentContext, kCGPathFill);
  }
}

- (UIColor)outerColor
{
  return self->_outerColor;
}

- (UIColor)innerColor
{
  return self->_innerColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerColor, 0);

  objc_storeStrong((id *)&self->_outerColor, 0);
}

@end