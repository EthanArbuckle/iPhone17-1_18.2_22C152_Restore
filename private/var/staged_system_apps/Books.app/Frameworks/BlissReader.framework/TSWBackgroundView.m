@interface TSWBackgroundView
- (BOOL)isOpaque;
- (TSDGradient)gradient;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setGradient:(id)a3;
@end

@implementation TSWBackgroundView

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->mGradient)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextSetFillColorWithColor(CurrentContext, [+[TSUColor clearColor](TSUColor, "clearColor") CGColor]);
    v10.origin.double x = x;
    v10.origin.double y = y;
    v10.size.double width = width;
    v10.size.double height = height;
    CGContextFillRect(CurrentContext, v10);
    CGContextRestoreGState(CurrentContext);
    -[TSDGradient paintRect:inContext:](self->mGradient, "paintRect:inContext:", CurrentContext, x, y, width, height);
  }
  v9.receiver = self;
  v9.super_class = (Class)TSWBackgroundView;
  -[TSWBackgroundView drawRect:](&v9, "drawRect:", x, y, width, height);
}

- (void)dealloc
{
  self->mGradient = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWBackgroundView;
  [(TSWBackgroundView *)&v3 dealloc];
}

- (BOOL)isOpaque
{
  return 0;
}

- (TSDGradient)gradient
{
  return self->mGradient;
}

- (void)setGradient:(id)a3
{
}

@end