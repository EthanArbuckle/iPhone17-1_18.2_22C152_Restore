@interface TUIGeometryAttributes
- (CGAffineTransform)transform;
- (CGPoint)center;
- (CGRect)frame;
- (CGSize)size;
- (TUIGeometryAttributes)initWithSize:(CGSize)a3 center:(CGPoint)a4 transform:(CGAffineTransform *)a5;
@end

@implementation TUIGeometryAttributes

- (TUIGeometryAttributes)initWithSize:(CGSize)a3 center:(CGPoint)a4 transform:(CGAffineTransform *)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)TUIGeometryAttributes;
  result = [(TUIGeometryAttributes *)&v14 init];
  if (result)
  {
    CGSize size = CGRectNull.size;
    result->_frame.origin = CGRectNull.origin;
    result->_frame.CGSize size = size;
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    result->_center.CGFloat x = x;
    result->_center.CGFloat y = y;
    long long v13 = *(_OWORD *)&a5->a;
    long long v12 = *(_OWORD *)&a5->c;
    *(_OWORD *)&result->_transform.tCGFloat x = *(_OWORD *)&a5->tx;
    *(_OWORD *)&result->_transform.a = v13;
    *(_OWORD *)&result->_transform.c = v12;
  }
  return result;
}

- (CGRect)frame
{
  if (CGRectIsNull(self->_frame))
  {
    double width = self->_size.width;
    double height = self->_size.height;
    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeTranslation(&v10, width * -0.5, height * -0.5);
    CGAffineTransform t1 = v10;
    long long v5 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&t2.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&t2.c = v5;
    *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&self->_transform.tx;
    CGAffineTransformConcat(&v9, &t1, &t2);
    CGAffineTransform v10 = v9;
    CGAffineTransformMakeTranslation(&v6, self->_center.x, self->_center.y);
    CGAffineTransform t1 = v10;
    CGAffineTransformConcat(&v9, &t1, &v6);
    CGAffineTransform v10 = v9;
    v11.origin.CGFloat x = 0.0;
    v11.origin.CGFloat y = 0.0;
    v11.size.double width = width;
    v11.size.double height = height;
    CGRect result = CGRectApplyAffineTransform(v11, &v9);
    self->_frame = result;
  }
  else
  {
    return self->_frame;
  }
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

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[2].b;
  return self;
}

@end