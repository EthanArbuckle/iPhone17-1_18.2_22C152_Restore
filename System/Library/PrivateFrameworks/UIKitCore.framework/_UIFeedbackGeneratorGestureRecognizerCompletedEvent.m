@interface _UIFeedbackGeneratorGestureRecognizerCompletedEvent
+ (id)completedEventFromEvent:(id)a3 inView:(id)a4;
- (CGPoint)locationInView;
- (CGPoint)locationInView:(id)a3;
@end

@implementation _UIFeedbackGeneratorGestureRecognizerCompletedEvent

+ (id)completedEventFromEvent:(id)a3 inView:(id)a4
{
  id v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  v9 = v8;
  if (v7) {
    uint64_t v10 = v7[10];
  }
  else {
    uint64_t v10 = 0;
  }
  v8[1] = v10;
  [v7 locationInView:v6];
  uint64_t v12 = v11;
  uint64_t v14 = v13;

  v9[2] = v12;
  v9[3] = v14;
  return v9;
}

- (CGPoint)locationInView:(id)a3
{
  double x = self->_locationInView.x;
  double y = self->_locationInView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)locationInView
{
  double x = self->_locationInView.x;
  double y = self->_locationInView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end