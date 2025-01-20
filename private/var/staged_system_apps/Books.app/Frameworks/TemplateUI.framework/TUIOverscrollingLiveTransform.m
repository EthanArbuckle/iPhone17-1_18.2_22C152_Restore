@interface TUIOverscrollingLiveTransform
- (CGAffineTransform)transform;
- (CGPoint)center;
- (CGSize)size;
- (Class)kind;
- (TUIOverscrollingLiveTransform)initWithCenter:(CGPoint)a3 size:(CGSize)a4 transform:(CGAffineTransform *)a5;
@end

@implementation TUIOverscrollingLiveTransform

- (TUIOverscrollingLiveTransform)initWithCenter:(CGPoint)a3 size:(CGSize)a4 transform:(CGAffineTransform *)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)TUIOverscrollingLiveTransform;
  result = [(TUIOverscrollingLiveTransform *)&v13 init];
  if (result)
  {
    result->_center.CGFloat x = x;
    result->_center.CGFloat y = y;
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    long long v11 = *(_OWORD *)&a5->a;
    long long v12 = *(_OWORD *)&a5->c;
    *(_OWORD *)&result->_transform.tCGFloat x = *(_OWORD *)&a5->tx;
    *(_OWORD *)&result->_transform.c = v12;
    *(_OWORD *)&result->_transform.a = v11;
  }
  return result;
}

- (Class)kind
{
  return (Class)objc_opt_class();
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[1].d;
  return self;
}

@end