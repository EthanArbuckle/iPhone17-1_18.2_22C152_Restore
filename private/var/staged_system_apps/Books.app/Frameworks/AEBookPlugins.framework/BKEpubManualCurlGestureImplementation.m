@interface BKEpubManualCurlGestureImplementation
- (BKEpubManualCurlGestureImplementation)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5;
- (CGPoint)endPoint;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)startLocationInView:(id)a3;
- (CGPoint)startPoint;
- (CGPoint)translationInView:(id)a3;
- (CGPoint)velocity;
- (CGPoint)velocityInView:(id)a3;
- (double)duration;
- (double)endTime;
- (double)nextTime;
- (double)startTime;
- (int64_t)state;
- (void)setNextTime:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setState:(int64_t)a3;
@end

@implementation BKEpubManualCurlGestureImplementation

- (BKEpubManualCurlGestureImplementation)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  v11.receiver = self;
  v11.super_class = (Class)BKEpubManualCurlGestureImplementation;
  result = [(BKEpubManualCurlGestureImplementation *)&v11 init];
  if (result)
  {
    result->_startPoint.double x = v9;
    result->_startPoint.double y = v8;
    result->_endPoint.double x = x;
    result->_endPoint.double y = y;
    result->_duration = a5;
    result->_velocity.double x = (x - v9) / a5;
    result->_velocity.double y = (y - v8) / a5;
  }
  return result;
}

- (void)setStartTime:(double)a3
{
  double v3 = self->_duration + a3;
  self->_startTime = a3;
  self->_endTime = v3;
}

- (CGPoint)startLocationInView:(id)a3
{
  [a3 convertPoint:0 fromView:self->_startPoint.x, self->_startPoint.y];
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  [(BKEpubManualCurlGestureImplementation *)self nextTime];
  double v6 = v5;
  [(BKEpubManualCurlGestureImplementation *)self startTime];
  double v8 = v6 - v7;
  [(BKEpubManualCurlGestureImplementation *)self duration];
  double v10 = v8 / v9;
  [(BKEpubManualCurlGestureImplementation *)self startPoint];
  double v12 = v11;
  [(BKEpubManualCurlGestureImplementation *)self endPoint];
  double v14 = v13;
  [(BKEpubManualCurlGestureImplementation *)self startPoint];
  double v16 = v12 + (v14 - v15) * v10;
  [(BKEpubManualCurlGestureImplementation *)self startPoint];
  double v18 = v17;
  [(BKEpubManualCurlGestureImplementation *)self endPoint];
  double v20 = v19;
  [(BKEpubManualCurlGestureImplementation *)self startPoint];
  [v4 convertPoint:0 fromView:v16 v18 + (v20 - v21) * v10];
  double v23 = v22;
  double v25 = v24;

  double v26 = v23;
  double v27 = v25;
  result.double y = v27;
  result.double x = v26;
  return result;
}

- (CGPoint)translationInView:(id)a3
{
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  id v6 = a3;
  [v6 convertPoint:0 fromView:x, y];
  double v8 = v7;
  double v10 = v9;
  [(BKEpubManualCurlGestureImplementation *)self locationInView:v6];
  double v12 = v11;
  double v14 = v13;

  double v15 = v12 - v8;
  double v16 = v14 - v10;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (CGPoint)velocityInView:(id)a3
{
  id v4 = a3;
  [(BKEpubManualCurlGestureImplementation *)self velocity];
  [v4 convertPoint:0 fromView:];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGPoint)startPoint
{
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x = self->_endPoint.x;
  double y = self->_endPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (double)nextTime
{
  return self->_nextTime;
}

- (void)setNextTime:(double)a3
{
  self->_nextTime = a3;
}

- (CGPoint)velocity
{
  double x = self->_velocity.x;
  double y = self->_velocity.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

@end