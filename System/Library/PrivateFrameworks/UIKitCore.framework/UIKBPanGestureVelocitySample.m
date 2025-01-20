@interface UIKBPanGestureVelocitySample
- (CGPoint)end;
- (CGPoint)start;
- (double)dt;
- (double)force;
- (double)majorRadius;
- (void)pullValuesFrom:(id)a3;
- (void)resetValues;
- (void)setDt:(double)a3;
- (void)setEnd:(CGPoint)a3;
- (void)setForce:(double)a3;
- (void)setMajorRadius:(double)a3;
- (void)setStart:(CGPoint)a3;
@end

@implementation UIKBPanGestureVelocitySample

- (void)pullValuesFrom:(id)a3
{
  id v4 = a3;
  [v4 start];
  -[UIKBPanGestureVelocitySample setStart:](self, "setStart:");
  [v4 end];
  -[UIKBPanGestureVelocitySample setEnd:](self, "setEnd:");
  [v4 dt];
  -[UIKBPanGestureVelocitySample setDt:](self, "setDt:");
  [v4 force];
  -[UIKBPanGestureVelocitySample setForce:](self, "setForce:");
  [v4 majorRadius];
  double v6 = v5;

  [(UIKBPanGestureVelocitySample *)self setMajorRadius:v6];
}

- (void)resetValues
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  -[UIKBPanGestureVelocitySample setStart:](self, "setStart:", *MEMORY[0x1E4F1DAD8], v4);
  -[UIKBPanGestureVelocitySample setEnd:](self, "setEnd:", v3, v4);
  [(UIKBPanGestureVelocitySample *)self setDt:0.0];
  [(UIKBPanGestureVelocitySample *)self setForce:0.0];
  [(UIKBPanGestureVelocitySample *)self setMajorRadius:0.0];
}

- (CGPoint)start
{
  objc_copyStruct(v4, &self->start, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setStart:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->start, &v3, 16, 1, 0);
}

- (CGPoint)end
{
  objc_copyStruct(v4, &self->end, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setEnd:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->end, &v3, 16, 1, 0);
}

- (double)dt
{
  return self->dt;
}

- (void)setDt:(double)a3
{
  self->dt = a3;
}

- (double)force
{
  return self->force;
}

- (void)setForce:(double)a3
{
  self->force = a3;
}

- (double)majorRadius
{
  return self->majorRadius;
}

- (void)setMajorRadius:(double)a3
{
  self->majorRadius = a3;
}

@end