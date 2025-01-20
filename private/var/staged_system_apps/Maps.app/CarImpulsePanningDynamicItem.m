@interface CarImpulsePanningDynamicItem
- (CGAffineTransform)transform;
- (CGPoint)center;
- (CGRect)bounds;
- (CarImpulsePanningDynamicItem)initWithBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation CarImpulsePanningDynamicItem

- (CarImpulsePanningDynamicItem)initWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  result = [(CarImpulsePanningDynamicItem *)self init];
  if (result)
  {
    result->_bounds.origin.CGFloat x = x;
    result->_bounds.origin.CGFloat y = y;
    result->_bounds.size.CGFloat width = width;
    result->_bounds.size.CGFloat height = height;
  }
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

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[1].ty;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

@end