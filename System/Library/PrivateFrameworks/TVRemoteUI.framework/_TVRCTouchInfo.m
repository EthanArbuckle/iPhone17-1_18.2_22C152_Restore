@interface _TVRCTouchInfo
- (BOOL)isLikelyLongListScrollingEdgeGesture;
- (BOOL)pendingCancellation;
- (CGPoint)initialLocation;
- (CGPoint)initialProportionalLocation;
- (CGRect)boundingBox;
- (double)previousTimestamp;
- (double)timestamp;
- (id)description;
- (int64_t)virtualPhase;
- (void)setBoundingBox:(CGRect)a3;
- (void)setInitialLocation:(CGPoint)a3;
- (void)setInitialProportionalLocation:(CGPoint)a3;
- (void)setIsLikelyLongListScrollingEdgeGesture:(BOOL)a3;
- (void)setPendingCancellation:(BOOL)a3;
- (void)setPreviousTimestamp:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setVirtualPhase:(int64_t)a3;
@end

@implementation _TVRCTouchInfo

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = TVRCTouchPhaseDescription();
  [v3 appendFormat:@"; virtualPhase = %@", v4];

  if (self->_pendingCancellation) {
    [v3 appendString:@"; pending cancellation"];
  }
  v5 = NSStringFromCGPoint(self->_initialLocation);
  [v3 appendFormat:@"; initialLocation = %@", v5];

  v6 = NSStringFromCGPoint(self->_initialProportionalLocation);
  [v3 appendFormat:@"; initialProportionalLocation = %@", v6];

  if (self->_isLikelyLongListScrollingEdgeGesture) {
    [v3 appendString:@"; isLikelyLongListScrollingEdgeGesture = YES"];
  }
  if (self->_virtualPhase)
  {
    CGRect v11 = CGRectIntegral(self->_boundingBox);
    v7 = NSStringFromCGRect(v11);
    [v3 appendFormat:@"; boundingBox = %@", v7];
  }
  [v3 appendString:@">"];
  v8 = (void *)[v3 copy];

  return v8;
}

- (int64_t)virtualPhase
{
  return self->_virtualPhase;
}

- (void)setVirtualPhase:(int64_t)a3
{
  self->_virtualPhase = a3;
}

- (BOOL)pendingCancellation
{
  return self->_pendingCancellation;
}

- (void)setPendingCancellation:(BOOL)a3
{
  self->_pendingCancellation = a3;
}

- (CGPoint)initialLocation
{
  double x = self->_initialLocation.x;
  double y = self->_initialLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialLocation:(CGPoint)a3
{
  self->_initialLocation = a3;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBodouble x = a3;
}

- (CGPoint)initialProportionalLocation
{
  double x = self->_initialProportionalLocation.x;
  double y = self->_initialProportionalLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialProportionalLocation:(CGPoint)a3
{
  self->_initialProportionalLocation = a3;
}

- (BOOL)isLikelyLongListScrollingEdgeGesture
{
  return self->_isLikelyLongListScrollingEdgeGesture;
}

- (void)setIsLikelyLongListScrollingEdgeGesture:(BOOL)a3
{
  self->_isLikelyLongListScrollingEdgeGesture = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)previousTimestamp
{
  return self->_previousTimestamp;
}

- (void)setPreviousTimestamp:(double)a3
{
  self->_previousTimestamp = a3;
}

@end