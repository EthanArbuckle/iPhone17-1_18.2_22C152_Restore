@interface UIPDFHighlightLayer
- (CGPath)borderPath;
- (CGPath)clipPath;
- (CGPoint)offset;
- (void)dealloc;
- (void)setBorderPath:(CGPath *)a3;
- (void)setClipPath:(CGPath *)a3;
- (void)setOffset:(CGPoint)a3;
@end

@implementation UIPDFHighlightLayer

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIPDFHighlightLayer;
  [(UIPDFHighlightLayer *)&v3 dealloc];
  CGPathRelease(self->_clipPath);
  CGPathRelease(self->_borderPath);
}

- (CGPath)clipPath
{
  return self->_clipPath;
}

- (void)setClipPath:(CGPath *)a3
{
  self->_clipPath = a3;
}

- (CGPath)borderPath
{
  return self->_borderPath;
}

- (void)setBorderPath:(CGPath *)a3
{
  self->_borderPath = a3;
}

- (CGPoint)offset
{
  double x = self->offset.x;
  double y = self->offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->offset = a3;
}

@end