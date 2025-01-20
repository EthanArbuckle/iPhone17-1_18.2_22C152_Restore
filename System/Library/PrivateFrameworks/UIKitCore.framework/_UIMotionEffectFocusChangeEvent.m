@interface _UIMotionEffectFocusChangeEvent
- (CGPoint)focusPosition;
- (_UIMotionEffectFocusChangeEvent)initWithTimestamp:(double)a3 focusPosition:(CGPoint)a4;
- (double)velocityRelativeToPreviousEvent:(id)a3;
- (id)copyWithTimestamp:(double)a3;
@end

@implementation _UIMotionEffectFocusChangeEvent

- (_UIMotionEffectFocusChangeEvent)initWithTimestamp:(double)a3 focusPosition:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v7.receiver = self;
  v7.super_class = (Class)_UIMotionEffectFocusChangeEvent;
  result = [(_UIMotionEffectEvent *)&v7 initWithTimestamp:a3];
  if (result)
  {
    result->_focusPosition.CGFloat x = x;
    result->_focusPosition.CGFloat y = y;
  }
  return result;
}

- (id)copyWithTimestamp:(double)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  [(_UIMotionEffectFocusChangeEvent *)self focusPosition];
  return (id)objc_msgSend(v5, "initWithTimestamp:focusPosition:", a3, v6, v7);
}

- (double)velocityRelativeToPreviousEvent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  double v5 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [(_UIMotionEffectFocusChangeEvent *)self focusPosition];
    double v7 = v6;
    double v9 = v8;
    [v4 focusPosition];
    double v11 = v7 - v10;
    double v13 = v9 - v12;
    [(_UIMotionEffectEvent *)self timestamp];
    double v15 = v14;
    [v4 timestamp];
    double v5 = (v11 * v11 + v13 * v13) / (v15 - v16);
  }

  return v5;
}

- (CGPoint)focusPosition
{
  double x = self->_focusPosition.x;
  double y = self->_focusPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end