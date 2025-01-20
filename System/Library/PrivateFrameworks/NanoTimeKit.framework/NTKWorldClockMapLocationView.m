@interface NTKWorldClockMapLocationView
- (NTKWorldClockMapLocationView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)positionAtPoint:(CGPoint)a3 withinBounds:(CGRect)a4;
@end

@implementation NTKWorldClockMapLocationView

- (NTKWorldClockMapLocationView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKWorldClockMapLocationView;
  v3 = -[NTKWorldClockMapLocationView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(NTKWorldClockMapLocationView *)v3 setOpaque:0];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  id v8 = [MEMORY[0x1E4FB1618] whiteColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v8 CGColor]);

  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGContextFillEllipseInRect(CurrentContext, v10);
  CGContextFillPath(CurrentContext);
}

- (void)positionAtPoint:(CGPoint)a3 withinBounds:(CGRect)a4
{
  CGFloat rect = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  [(NTKWorldClockMapLocationView *)self frame];
  UIRectCenteredAboutPointScale();
  double v8 = v18.origin.x;
  double v9 = v18.origin.y;
  double v10 = v18.size.width;
  double height = v18.size.height;
  if (CGRectGetMinX(v18) < 0.0) {
    double v8 = 0.0;
  }
  v19.origin.CGFloat x = v8;
  v19.origin.CGFloat y = v9;
  v19.size.CGFloat width = v10;
  v19.size.double height = height;
  if (CGRectGetMinY(v19) < 0.0) {
    double v9 = 0.0;
  }
  v20.origin.CGFloat x = v8;
  v20.origin.CGFloat y = v9;
  v20.size.CGFloat width = v10;
  v20.size.double height = height;
  double MaxX = CGRectGetMaxX(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.double height = rect;
  if (MaxX > CGRectGetWidth(v21))
  {
    v22.origin.CGFloat x = x;
    v22.size.double height = rect;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    double v13 = CGRectGetWidth(v22);
    v23.origin.CGFloat x = v8;
    v23.origin.CGFloat y = v9;
    v23.size.CGFloat width = v10;
    v23.size.double height = height;
    double v8 = v13 - CGRectGetWidth(v23);
  }
  v24.origin.CGFloat x = v8;
  v24.origin.CGFloat y = v9;
  v24.size.CGFloat width = v10;
  v24.size.double height = height;
  double MaxY = CGRectGetMaxY(v24);
  v25.origin.CGFloat x = x;
  v25.size.double height = rect;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  if (MaxY > CGRectGetHeight(v25))
  {
    v26.origin.CGFloat x = x;
    v26.size.double height = rect;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    double v15 = CGRectGetHeight(v26);
    v27.origin.CGFloat x = v8;
    v27.origin.CGFloat y = v9;
    v27.size.CGFloat width = v10;
    v27.size.double height = height;
    double v9 = v15 - CGRectGetHeight(v27);
  }
  -[NTKWorldClockMapLocationView setFrame:](self, "setFrame:", v8, v9, v10, height);
}

@end