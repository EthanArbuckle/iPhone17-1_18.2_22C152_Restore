@interface PNCropVariant
- (CGRect)cropRect;
- (PNCropVariant)initWithAspectRatio:(double)a3 scaleFactor:(double)a4 cropScore:(double)a5 cropType:(int64_t)a6 cropRect:(CGRect)a7;
- (double)aspectRatio;
- (double)cropScore;
- (double)scaleFactor;
- (int64_t)cropType;
@end

@implementation PNCropVariant

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)cropType
{
  return self->_cropType;
}

- (double)cropScore
{
  return self->_cropScore;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (PNCropVariant)initWithAspectRatio:(double)a3 scaleFactor:(double)a4 cropScore:(double)a5 cropType:(int64_t)a6 cropRect:(CGRect)a7
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)PNCropVariant;
  CGRect result = [(PNCropVariant *)&v16 init];
  if (result)
  {
    result->_cropRect.origin.CGFloat x = x;
    result->_cropRect.origin.CGFloat y = y;
    result->_cropRect.size.CGFloat width = width;
    result->_cropRect.size.CGFloat height = height;
    result->_cropType = a6;
    result->_scaleFactor = a4;
    result->_cropScore = a5;
    result->_aspectRatio = a3;
  }
  return result;
}

@end