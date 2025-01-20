@interface _UIMotionEffectAttitudeEvent
- ($01BB1521EC52D44A8E7628F5261DCEC8)attitude;
- (_UIMotionEffectAttitudeEvent)initWithTimestamp:(double)a3 attitude:(id)a4;
- (double)velocityRelativeToPreviousEvent:(id)a3;
- (id)copyWithTimestamp:(double)a3;
@end

@implementation _UIMotionEffectAttitudeEvent

- (double)velocityRelativeToPreviousEvent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  double v5 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [(_UIMotionEffectAttitudeEvent *)self attitude];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [v4 attitude];
    double v15 = v7 - v14;
    double v17 = v9 - v16;
    double v19 = v11 - v18;
    double v21 = v13 - v20;
    [(_UIMotionEffectEvent *)self timestamp];
    double v23 = v22;
    [v4 timestamp];
    double v5 = (v21 * v21 + v19 * v19 + v15 * v15 + v17 * v17) / (v23 - v24);
  }

  return v5;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)attitude
{
  double x = self->_attitude.x;
  double y = self->_attitude.y;
  double z = self->_attitude.z;
  double w = self->_attitude.w;
  result.var3 = w;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (_UIMotionEffectAttitudeEvent)initWithTimestamp:(double)a3 attitude:(id)a4
{
  double var3 = a4.var3;
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  v9.receiver = self;
  v9.super_class = (Class)_UIMotionEffectAttitudeEvent;
  $01BB1521EC52D44A8E7628F5261DCEC8 result = [(_UIMotionEffectEvent *)&v9 initWithTimestamp:a3];
  if (result)
  {
    result->_attitude.double x = var0;
    result->_attitude.double y = var1;
    result->_attitude.double z = var2;
    result->_attitude.double w = var3;
  }
  return result;
}

- (id)copyWithTimestamp:(double)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  [(_UIMotionEffectAttitudeEvent *)self attitude];
  return (id)objc_msgSend(v5, "initWithTimestamp:attitude:", a3, v6, v7, v8, v9);
}

@end