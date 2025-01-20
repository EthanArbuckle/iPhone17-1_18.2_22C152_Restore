@interface _UIFluidSliderInteractionUpdate
- (BOOL)isAtTarget;
- (BOOL)isTracking;
- (CGAffineTransform)trackTransform;
- (CGRect)barFrame;
- (CGRect)trackBounds;
- (double)_unclampedValue;
- (double)value;
- (int64_t)interactionState;
- (int64_t)type;
- (void)setAtTarget:(BOOL)a3;
- (void)setBarFrame:(CGRect)a3;
- (void)setInteractionState:(int64_t)a3;
- (void)setTrackBounds:(CGRect)a3;
- (void)setTrackTransform:(CGAffineTransform *)a3;
- (void)setTracking:(BOOL)a3;
- (void)setType:(int64_t)a3;
- (void)setValue:(double)a3;
- (void)set_unclampedValue:(double)a3;
@end

@implementation _UIFluidSliderInteractionUpdate

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (CGRect)trackBounds
{
  double x = self->_trackBounds.origin.x;
  double y = self->_trackBounds.origin.y;
  double width = self->_trackBounds.size.width;
  double height = self->_trackBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTrackBounds:(CGRect)a3
{
  self->_trackBounds = a3;
}

- (CGAffineTransform)trackTransform
{
  long long v3 = *(_OWORD *)&self[2].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[3].a;
  return self;
}

- (void)setTrackTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_trackTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_trackTransform.tdouble x = v4;
  *(_OWORD *)&self->_trackTransform.a = v3;
}

- (CGRect)barFrame
{
  double x = self->_barFrame.origin.x;
  double y = self->_barFrame.origin.y;
  double width = self->_barFrame.size.width;
  double height = self->_barFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBarFrame:(CGRect)a3
{
  self->_barFrame = a3;
}

- (int64_t)interactionState
{
  return self->_interactionState;
}

- (void)setInteractionState:(int64_t)a3
{
  self->_interactionState = a3;
}

- (BOOL)isTracking
{
  return self->_tracking;
}

- (void)setTracking:(BOOL)a3
{
  self->_tracking = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)isAtTarget
{
  return self->_atTarget;
}

- (void)setAtTarget:(BOOL)a3
{
  self->_atTarget = a3;
}

- (double)_unclampedValue
{
  return self->__unclampedValue;
}

- (void)set_unclampedValue:(double)a3
{
  self->__unclampedValue = a3;
}

@end