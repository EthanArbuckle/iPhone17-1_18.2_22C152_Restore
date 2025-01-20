@interface VIRefinedRegion
- (CGRect)regionOfInterest;
- (VIRefinedRegion)initWithRegionOfInterest:(CGRect)a3 confidence:(float)a4;
- (float)confidence;
@end

@implementation VIRefinedRegion

- (VIRefinedRegion)initWithRegionOfInterest:(CGRect)a3 confidence:(float)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)VIRefinedRegion;
  result = [(VIRefinedRegion *)&v10 init];
  if (result)
  {
    result->_regionOfInterest.origin.CGFloat x = x;
    result->_regionOfInterest.origin.CGFloat y = y;
    result->_regionOfInterest.size.CGFloat width = width;
    result->_regionOfInterest.size.CGFloat height = height;
    result->_confidence = a4;
  }
  return result;
}

- (CGRect)regionOfInterest
{
  double x = self->_regionOfInterest.origin.x;
  double y = self->_regionOfInterest.origin.y;
  double width = self->_regionOfInterest.size.width;
  double height = self->_regionOfInterest.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (float)confidence
{
  return self->_confidence;
}

@end