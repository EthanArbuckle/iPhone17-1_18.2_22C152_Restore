@interface SXIssueCoverLayoutAttributes
- (CGRect)frame;
- (SXIssueCoverLayoutAttributes)initWithFrame:(CGRect)a3;
@end

@implementation SXIssueCoverLayoutAttributes

- (SXIssueCoverLayoutAttributes)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)SXIssueCoverLayoutAttributes;
  result = [(SXIssueCoverLayoutAttributes *)&v8 init];
  if (result)
  {
    result->_frame.origin.CGFloat x = x;
    result->_frame.origin.CGFloat y = y;
    result->_frame.size.CGFloat width = width;
    result->_frame.size.CGFloat height = height;
  }
  return result;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end