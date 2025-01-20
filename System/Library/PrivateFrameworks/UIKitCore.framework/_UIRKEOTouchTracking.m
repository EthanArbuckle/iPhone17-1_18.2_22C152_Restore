@interface _UIRKEOTouchTracking
- (BOOL)valid;
- (Class)beganGestureClass;
- (double)largestObservedRadius;
- (int64_t)type;
- (void)setBeganGestureClass:(Class)a3;
- (void)setLargestObservedRadius:(double)a3;
- (void)setType:(int64_t)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation _UIRKEOTouchTracking

- (void).cxx_destruct
{
}

- (Class)beganGestureClass
{
  return self->_beganGestureClass;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setLargestObservedRadius:(double)a3
{
  self->_largestObservedRadius = a3;
}

- (double)largestObservedRadius
{
  return self->_largestObservedRadius;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setBeganGestureClass:(Class)a3
{
}

@end