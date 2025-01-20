@interface PKConnectedCircleTargetView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKConnectedCircleTargetView)init;
- (PKConnectedCircleTargetView)initWithFrame:(CGRect)a3;
- (PKConnectedCircleTargetView)initWithOuterColor:(id)a3 innerColor:(id)a4;
- (UIColor)innerColor;
- (UIColor)outerColor;
- (void)drawRect:(CGRect)a3;
@end

@implementation PKConnectedCircleTargetView

- (PKConnectedCircleTargetView)initWithOuterColor:(id)a3 innerColor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = -[PKConnectedCircleTargetView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_outerColor, a3);
    objc_storeStrong((id *)&v10->_innerColor, a4);
  }

  return v10;
}

- (PKConnectedCircleTargetView)init
{
  return -[PKConnectedCircleTargetView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKConnectedCircleTargetView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKConnectedCircleTargetView;
  v3 = -[PKConnectedCircleTargetView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PKConnectedCircleTargetView *)v3 setOpaque:0];
    v5 = [(PKConnectedCircleTargetView *)v4 layer];
    [v5 setShadowRadius:4.0];
    id v6 = [MEMORY[0x1E4FB1618] blackColor];
    objc_msgSend(v5, "setShadowColor:", objc_msgSend(v6, "CGColor"));

    objc_msgSend(v5, "setShadowOffset:", 0.0, 0.0);
    LODWORD(v7) = 0.25;
    [v5 setShadowOpacity:v7];
    [v5 setMasksToBounds:0];
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
  CGFloat v30 = v13;
  CGFloat v31 = v12;
  CGFloat v28 = v15;
  CGFloat v29 = v14;
  PKSizeAlignedInRect();
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CurrentContext = UIGraphicsGetCurrentContext();
  outerColor = self->_outerColor;
  if (outerColor)
  {
    CGContextSetFillColorWithColor(CurrentContext, [(UIColor *)outerColor CGColor]);
    CGContextBeginPath(CurrentContext);
    v33.origin.x = v5;
    v33.origin.y = v7;
    v33.size.width = v9;
    v33.size.height = v11;
    CGContextAddEllipseInRect(CurrentContext, v33);
    CGContextDrawPath(CurrentContext, kCGPathFill);
  }
  innerColor = self->_innerColor;
  if (innerColor)
  {
    CGContextSetFillColorWithColor(CurrentContext, [(UIColor *)innerColor CGColor]);
    CGContextBeginPath(CurrentContext);
    v34.origin.y = v30;
    v34.origin.x = v31;
    v34.size.height = v28;
    v34.size.width = v29;
    CGContextAddEllipseInRect(CurrentContext, v34);
    CGContextDrawPath(CurrentContext, kCGPathFill);
  }
  v27 = self->_outerColor;
  if (v27)
  {
    CGContextSetFillColorWithColor(CurrentContext, [(UIColor *)v27 CGColor]);
    CGContextBeginPath(CurrentContext);
    v35.origin.x = v17;
    v35.origin.y = v19;
    v35.size.width = v21;
    v35.size.height = v23;
    CGContextAddEllipseInRect(CurrentContext, v35);
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