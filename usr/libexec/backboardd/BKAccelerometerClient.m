@interface BKAccelerometerClient
- (BOOL)_passesThresholdForX:(float)a3 y:(float)a4 z:(float)a5;
- (BOOL)_shouldSendSampleEventWithTimestamp:(double)a3 samplingInterval:(double)a4;
- (BOOL)passiveOrientationEvents;
- (BOOL)wantsAccelerometerEvents;
- (BOOL)wantsOrientationEvents;
- (double)_lastAccelerometerEventTimestamp;
- (double)accelerometerUpdateInterval;
- (float)xThreshold;
- (float)yThreshold;
- (float)zThreshold;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)_queue_invalidate;
- (void)_setLastAccelerometerEventTimestamp:(double)a3;
- (void)setAccelerometerUpdateInterval:(double)a3;
- (void)setPassiveOrientationEvents:(BOOL)a3;
- (void)setWantsAccelerometerEvents:(BOOL)a3;
- (void)setWantsOrientationEvents:(BOOL)a3;
- (void)setXThreshold:(float)a3;
- (void)setYThreshold:(float)a3;
- (void)setZThreshold:(float)a3;
@end

@implementation BKAccelerometerClient

- (float)zThreshold
{
  return *(float *)((char *)&self->_yThreshold + 2);
}

- (float)yThreshold
{
  return *(float *)((char *)&self->_xThreshold + 2);
}

- (float)xThreshold
{
  return *(float *)(&self->super._terminating + 1);
}

- (double)accelerometerUpdateInterval
{
  if (self->_passiveOrientationEvents) {
    return *(double *)&self->_wantsAccelerometerEvents;
  }
  else {
    return 0.0;
  }
}

- (BOOL)wantsOrientationEvents
{
  return HIBYTE(self->_zThreshold);
}

- (BOOL)passiveOrientationEvents
{
  return BYTE2(self->_zThreshold);
}

- (BOOL)wantsAccelerometerEvents
{
  return self->_passiveOrientationEvents;
}

- (BOOL)_shouldSendSampleEventWithTimestamp:(double)a3 samplingInterval:(double)a4
{
  if (!self->_passiveOrientationEvents) {
    return 0;
  }
  double v4 = *(double *)&self->_wantsAccelerometerEvents;
  if (v4 <= 0.0) {
    return 0;
  }
  double v5 = a3 - *(double *)((char *)&self->_accelerometerUpdateInterval + 6);
  if (v5 >= v4) {
    return 1;
  }
  if (v4 >= a4 * 2.5) {
    return 0;
  }
  return v5 > v4 * 0.8 || v5 < 0.0;
}

- (BOOL)_passesThresholdForX:(float)a3 y:(float)a4 z:(float)a5
{
  float v5 = *(float *)(&self->super._terminating + 1);
  if (v5 > 0.0)
  {
    if (a3 < 0.0) {
      a3 = -a3;
    }
    if (a3 >= v5) {
      return 1;
    }
  }
  float v6 = *(float *)((char *)&self->_xThreshold + 2);
  if (v6 > 0.0)
  {
    if (a4 < 0.0) {
      a4 = -a4;
    }
    if (a4 >= v6) {
      return 1;
    }
  }
  float v7 = *(float *)((char *)&self->_yThreshold + 2);
  if (v7 <= 0.0) {
    return 0;
  }
  float v8 = -a5;
  if (a5 >= 0.0) {
    float v8 = a5;
  }
  return v8 >= v7;
}

- (void)setZThreshold:(float)a3
{
  *(float *)((char *)&self->_yThreshold + 2) = a3;
}

- (void)setYThreshold:(float)a3
{
  *(float *)((char *)&self->_xThreshold + 2) = a3;
}

- (void)setXThreshold:(float)a3
{
  *(float *)(&self->super._terminating + 1) = a3;
}

- (void)setWantsAccelerometerEvents:(BOOL)a3
{
  self->_passiveOrientationEvents = a3;
}

- (void)setAccelerometerUpdateInterval:(double)a3
{
  *(double *)&self->_wantsAccelerometerEvents = a3;
}

- (void)_setLastAccelerometerEventTimestamp:(double)a3
{
  *(double *)((char *)&self->_accelerometerUpdateInterval + 6) = a3;
}

- (double)_lastAccelerometerEventTimestamp
{
  return *(double *)((char *)&self->_accelerometerUpdateInterval + 6);
}

- (void)setWantsOrientationEvents:(BOOL)a3
{
  HIBYTE(self->_zThreshold) = a3;
}

- (void)setPassiveOrientationEvents:(BOOL)a3
{
  BYTE2(self->_zThreshold) = a3;
}

- (void)_queue_invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)BKAccelerometerClient;
  [(BKHIDEventClient *)&v2 _queue_invalidate];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKAccelerometerClient;
  double v4 = [(BKHIDEventClient *)&v9 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = [v4 appendBool:HIBYTE(self->_zThreshold) withName:@"wantsOrientationEvents"];
  id v6 = [v4 appendBool:BYTE2(self->_zThreshold) withName:@"passiveEvents"];
  id v7 = [v4 appendBool:self->_passiveOrientationEvents withName:@"wantsAccelerometerEvents"];

  return v4;
}

@end