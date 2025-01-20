@interface _RAPAnnotationTitleLabel
- (void)drawTextInRect:(CGRect)a3;
@end

@implementation _RAPAnnotationTitleLabel

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_RAPAnnotationTitleLabel *)self shadowOffset];
  double v9 = v8;
  double v11 = v10;
  v12 = [(_RAPAnnotationTitleLabel *)self textColor];
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, 3.0);
  CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
  CGContextSetTextDrawingMode(CurrentContext, kCGTextStroke);
  v14 = +[UIColor systemBackgroundColor];
  [(_RAPAnnotationTitleLabel *)self setTextColor:v14];

  v16.receiver = self;
  v16.super_class = (Class)_RAPAnnotationTitleLabel;
  -[_RAPAnnotationTitleLabel drawTextInRect:](&v16, "drawTextInRect:", x, y, width, height);
  CGContextSetTextDrawingMode(CurrentContext, kCGTextFill);
  [(_RAPAnnotationTitleLabel *)self setTextColor:v12];
  -[_RAPAnnotationTitleLabel setShadowOffset:](self, "setShadowOffset:", 0.0, 0.0);
  v15.receiver = self;
  v15.super_class = (Class)_RAPAnnotationTitleLabel;
  -[_RAPAnnotationTitleLabel drawTextInRect:](&v15, "drawTextInRect:", x, y, width, height);
  -[_RAPAnnotationTitleLabel setShadowOffset:](self, "setShadowOffset:", v9, v11);
}

@end