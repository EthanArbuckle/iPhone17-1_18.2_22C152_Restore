@interface BKAccelerometerClientUIApp
- (BKAccelerometerClientUIApp)initWithPid:(int)a3 sendRight:(id)a4 queue:(id)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)_queue_invalidate;
- (void)handleOrientationEvent:(int64_t)a3 orientationLocked:(BOOL)a4;
- (void)setWantsAccelerometerEvents:(BOOL)a3;
@end

@implementation BKAccelerometerClientUIApp

- (void)handleOrientationEvent:(int64_t)a3 orientationLocked:(BOOL)a4
{
  if ([(BKAccelerometerClient *)self wantsOrientationEvents] && !a4)
  {
    mach_absolute_time();
    DeviceOrientationEventWithUsage = (const void *)IOHIDEventCreateDeviceOrientationEventWithUsage();
    v8 = BKLogOrientationDevice();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = BSDeviceOrientationDescription();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      __int16 v14 = 2114;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending orientation: %{public}@ event to %{public}@", buf, 0x16u);
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100082254;
    v11[3] = &unk_1000F8208;
    v11[4] = self;
    v10 = +[BKSHIDEventDeferringResolution build:v11];
    BKSendHIDEventToClientWithDestination();
    CFRelease(DeviceOrientationEventWithUsage);
    *(void *)((char *)&self->super._lastAccelerometerEventTimestamp + 6) = a3;
  }
}

- (void)_queue_invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)BKAccelerometerClientUIApp;
  [(BKAccelerometerClient *)&v2 _queue_invalidate];
}

- (void)setWantsAccelerometerEvents:(BOOL)a3
{
  if (a3)
  {
    v3 = sub_100012808();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "BKAccelerometerClientUIApp doesn't support accelerometer events", v4, 2u);
    }
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKAccelerometerClientUIApp;
  v4 = [(BKAccelerometerClient *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = [v4 appendInt:*(unsigned int *)((char *)&self->super._lastAccelerometerEventTimestamp + 6) withName:@"lastOrientation"];

  return v4;
}

- (BKAccelerometerClientUIApp)initWithPid:(int)a3 sendRight:(id)a4 queue:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)BKAccelerometerClientUIApp;
  id v5 = [(BKHIDEventClient *)&v8 initWithPid:*(void *)&a3 sendRight:a4 queue:a5];
  v6 = v5;
  if (v5)
  {
    [(BKAccelerometerClient *)v5 setPassiveOrientationEvents:0];
    *(double *)((char *)&v6->super._lastAccelerometerEventTimestamp + 6) = 0.0;
  }
  return v6;
}

@end