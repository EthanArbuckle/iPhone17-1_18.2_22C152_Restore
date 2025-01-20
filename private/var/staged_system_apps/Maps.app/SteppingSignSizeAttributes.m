@interface SteppingSignSizeAttributes
- (CGSize)size;
- (SteppingSignSizeAttributes)initWithSize:(CGSize)a3 signToPageControlDistance:(double)a4;
- (double)signToPageControlDistance;
@end

@implementation SteppingSignSizeAttributes

- (SteppingSignSizeAttributes)initWithSize:(CGSize)a3 signToPageControlDistance:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)SteppingSignSizeAttributes;
  result = [(SteppingSignSizeAttributes *)&v8 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    result->_signToPageControlDistance = a4;
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

- (double)signToPageControlDistance
{
  return self->_signToPageControlDistance;
}

@end