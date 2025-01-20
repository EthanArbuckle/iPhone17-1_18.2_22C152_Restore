@interface UIScrollAnimation
- (void)setEndPoint:(CGPoint)a3;
- (void)setProgress:(float)a3;
- (void)setStartPoint:(CGPoint)a3;
@end

@implementation UIScrollAnimation

- (void)setStartPoint:(CGPoint)a3
{
  self->_startPoint = a3;
}

- (void)setEndPoint:(CGPoint)a3
{
  self->_endPoint = a3;
}

- (void)setProgress:(float)a3
{
}

@end