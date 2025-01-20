@interface ACMEToolbar
- (void)drawRect:(CGRect)a3;
@end

@implementation ACMEToolbar

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGFloat v8 = x;
  CGFloat v9 = y;
  CGFloat v10 = width;
  CGFloat v11 = height;

  CGContextClearRect(CurrentContext, *(CGRect *)&v8);
}

@end