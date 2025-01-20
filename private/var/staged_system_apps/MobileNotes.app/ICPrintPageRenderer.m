@interface ICPrintPageRenderer
- (UIColor)backgroundColor;
- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4;
- (void)setBackgroundColor:(id)a3;
@end

@implementation ICPrintPageRenderer

- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v10 = [(ICPrintPageRenderer *)self backgroundColor];

  if (v10)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    id v12 = [(ICPrintPageRenderer *)self backgroundColor];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v12 CGColor]);

    [(ICPrintPageRenderer *)self paperRect];
    CGContextFillRect(CurrentContext, v14);
  }
  v13.receiver = self;
  v13.super_class = (Class)ICPrintPageRenderer;
  -[ICPrintPageRenderer drawPageAtIndex:inRect:](&v13, "drawPageAtIndex:inRect:", a3, x, y, width, height);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end