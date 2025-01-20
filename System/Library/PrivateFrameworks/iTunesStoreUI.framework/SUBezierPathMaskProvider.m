@interface SUBezierPathMaskProvider
- (CGPath)copyPathForMaskWithSize:(CGSize)a3;
- (UIBezierPath)bezierPath;
- (void)dealloc;
- (void)setBezierPath:(id)a3;
@end

@implementation SUBezierPathMaskProvider

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUBezierPathMaskProvider;
  [(SUBezierPathMaskProvider *)&v3 dealloc];
}

- (CGPath)copyPathForMaskWithSize:(CGSize)a3
{
  result = [(UIBezierPath *)self->_bezierPath CGPath];
  if (result)
  {
    return CGPathRetain(result);
  }
  return result;
}

- (UIBezierPath)bezierPath
{
  return self->_bezierPath;
}

- (void)setBezierPath:(id)a3
{
}

@end