@interface TUIPinningLiveTransform
- (CGAffineTransform)transform;
- (CGPoint)center;
- (CGSize)size;
- (Class)kind;
- (TUIPinningLiveTransform)initWithCenter:(CGPoint)a3 size:(CGSize)a4 transform:(CGAffineTransform *)a5 pinPosition:(unint64_t)a6;
- (unint64_t)pinPosition;
@end

@implementation TUIPinningLiveTransform

- (TUIPinningLiveTransform)initWithCenter:(CGPoint)a3 size:(CGSize)a4 transform:(CGAffineTransform *)a5 pinPosition:(unint64_t)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)TUIPinningLiveTransform;
  result = [(TUIPinningLiveTransform *)&v15 init];
  if (result)
  {
    result->_center.CGFloat x = x;
    result->_center.CGFloat y = y;
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    long long v13 = *(_OWORD *)&a5->a;
    long long v14 = *(_OWORD *)&a5->tx;
    *(_OWORD *)&result->_transform.c = *(_OWORD *)&a5->c;
    *(_OWORD *)&result->_transform.tCGFloat x = v14;
    *(_OWORD *)&result->_transform.a = v13;
    result->_pinPosition = a6;
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
  long long v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[1].tx;
  return self;
}

- (unint64_t)pinPosition
{
  return self->_pinPosition;
}

@end