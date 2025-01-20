@interface WiFiManagerMotionServices
- (CMActivityAlarm)drivingAlarm;
- (CMActivityAlarm)walkingAlarm;
- (CMMotionActivityManager)activityManager;
- (NSOperationQueue)motionQ;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)serialActivityDispatchQ;
- (WiFiManagerMotionServices)init;
- (__WiFiManager)manager;
- (double)drivingEndedAlarmTriggerDuration;
- (double)drivingStartedAlarmTriggerDuration;
- (double)motionStartTime;
- (double)walkingEndedAlarmTriggerDuration;
- (double)walkingStartedAlarmTriggerDuration;
- (int)motionState;
- (void)dealloc;
- (void)dispatchMotionCallback;
- (void)motionStateChangeCb;
- (void)setActivityManager:(id)a3;
- (void)setDrivingAlarm:(id)a3;
- (void)setDrivingEndedAlarmTriggerDuration:(double)a3;
- (void)setDrivingStartedAlarmTriggerDuration:(double)a3;
- (void)setManager:(__WiFiManager *)a3;
- (void)setMotionQ:(id)a3;
- (void)setMotionStartTime:(double)a3;
- (void)setMotionState:(int)a3;
- (void)setMotionStateChangeCb:(void *)a3;
- (void)setQueue:(id)a3;
- (void)setSerialActivityDispatchQ:(id)a3;
- (void)setWalkingAlarm:(id)a3;
- (void)setWalkingEndedAlarmTriggerDuration:(double)a3;
- (void)setWalkingStartedAlarmTriggerDuration:(double)a3;
- (void)setupDrivingEndedAlarm;
- (void)setupDrivingStartedAlarm;
- (void)setupWalkingEndedAlarm;
- (void)setupWalkingStartedAlarm;
- (void)startMonitoringMotionState;
- (void)stopMonitoringMotionState;
@end

@implementation WiFiManagerMotionServices

- (WiFiManagerMotionServices)init
{
  if (objc_opt_class())
  {
    if (+[CMMotionActivityManager isActivityAvailable])
    {
      v5.receiver = self;
      v5.super_class = (Class)WiFiManagerMotionServices;
      result = [(WiFiManagerMotionServices *)&v5 init];
      if (result) {
        return result;
      }
      self = 0;
    }
    else
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3, @"%s: [MOTION] this device does not support motion data", @"-[WiFiManagerMotionServices init]"];
      }
    }
  }

  return 0;
}

- (void)startMonitoringMotionState
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s", "-[WiFiManagerMotionServices startMonitoringMotionState]")
  }
  self->_activityManager = (CMMotionActivityManager *)objc_alloc_init((Class)CMMotionActivityManager);
  objc_super v5 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  self->_motionQ = v5;
  [(NSOperationQueue *)v5 setName:@"WiFiManagerMotionServicesQueue"];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BE08C;
  v6[3] = &unk_100240EB0;
  v6[4] = self;
  [(CMMotionActivityManager *)[(WiFiManagerMotionServices *)self activityManager] startActivityUpdatesToQueue:[(WiFiManagerMotionServices *)self motionQ] withHandler:v6];
}

- (void)dealloc
{
  serialActivityDispatchQ = self->_serialActivityDispatchQ;
  if (serialActivityDispatchQ) {
    dispatch_release(serialActivityDispatchQ);
  }

  v5.receiver = self;
  v5.super_class = (Class)WiFiManagerMotionServices;
  [(WiFiManagerMotionServices *)&v5 dealloc];
}

- (void)dispatchMotionCallback
{
  if ([(WiFiManagerMotionServices *)self motionStateChangeCb])
  {
    v4 = [(WiFiManagerMotionServices *)self motionStateChangeCb];
    objc_super v5 = [(WiFiManagerMotionServices *)self manager];
    uint64_t v6 = [(WiFiManagerMotionServices *)self motionState];
    [(WiFiManagerMotionServices *)self motionStartTime];
    v4(v5, v6);
  }
  else
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:4 message:"motionStateChangeCb is NULL!"];
    }
  }
}

- (void)stopMonitoringMotionState
{
  [(CMMotionActivityManager *)[(WiFiManagerMotionServices *)self activityManager] stopActivityUpdates];
}

- (void)setupWalkingStartedAlarm
{
  if (+[CMActivityAlarm activityAlarmAvailable])
  {
    if (!self->_serialActivityDispatchQ)
    {
      v4 = off_10027CA18;
      objc_super v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      self->_serialActivityDispatchQ = (OS_dispatch_queue *)dispatch_queue_create(v4, v5);
    }

    [(WiFiManagerMotionServices *)self walkingStartedAlarmTriggerDuration];
    double v7 = v6;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000BE554;
    v10[3] = &unk_100240ED8;
    v10[4] = self;
    self->_walkingAlarm = (CMActivityAlarm *)[objc_alloc((Class)CMActivityAlarm) initWithTrigger:2 duration:-[WiFiManagerMotionServices serialActivityDispatchQ](self, "serialActivityDispatchQ") onQueue:v10 withHandler:v6];
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: [MOTION] Setting up Walking Started Alarm, dur:%.1fsecs", @"-[WiFiManagerMotionServices setupWalkingStartedAlarm]", *(void *)&v7];
    }
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: [MOTION] activity alarm is not available", "-[WiFiManagerMotionServices setupWalkingStartedAlarm]", v9);
    }
  }
}

- (void)setupWalkingEndedAlarm
{
  if (+[CMActivityAlarm activityAlarmAvailable])
  {
    if (!self->_serialActivityDispatchQ)
    {
      v4 = off_10027CA18;
      objc_super v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      self->_serialActivityDispatchQ = (OS_dispatch_queue *)dispatch_queue_create(v4, v5);
    }

    [(WiFiManagerMotionServices *)self walkingEndedAlarmTriggerDuration];
    double v7 = v6;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000BE7BC;
    v10[3] = &unk_100240ED8;
    v10[4] = self;
    self->_walkingAlarm = (CMActivityAlarm *)[objc_alloc((Class)CMActivityAlarm) initWithTrigger:0 duration:-[WiFiManagerMotionServices serialActivityDispatchQ](self, "serialActivityDispatchQ") onQueue:v10 withHandler:v6];
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: [MOTION] Setting up Walking Ended Alarm, dur:%.1fsecs", "-[WiFiManagerMotionServices setupWalkingEndedAlarm]", *(void *)&v7);
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: [MOTION] activity alarm is not available", @"-[WiFiManagerMotionServices setupWalkingEndedAlarm]", v9];
    }
  }
}

- (void)setupDrivingStartedAlarm
{
  if (+[CMActivityAlarm activityAlarmAvailable])
  {
    if (!self->_serialActivityDispatchQ)
    {
      v4 = off_10027CA18;
      objc_super v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      self->_serialActivityDispatchQ = (OS_dispatch_queue *)dispatch_queue_create(v4, v5);
    }

    [(WiFiManagerMotionServices *)self drivingStartedAlarmTriggerDuration];
    double v7 = v6;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000BEA24;
    v10[3] = &unk_100240ED8;
    v10[4] = self;
    self->_drivingAlarm = (CMActivityAlarm *)[objc_alloc((Class)CMActivityAlarm) initWithTrigger:4 duration:-[WiFiManagerMotionServices serialActivityDispatchQ](self, "serialActivityDispatchQ") onQueue:v10 withHandler:v6];
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: [MOTION] Setting up Driving Started Alarm, dur:%.1fsecs", "-[WiFiManagerMotionServices setupDrivingStartedAlarm]", *(void *)&v7);
    }
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: [MOTION] activity alarm is not available", "-[WiFiManagerMotionServices setupDrivingStartedAlarm]", v9);
    }
  }
}

- (void)setupDrivingEndedAlarm
{
  if (+[CMActivityAlarm activityAlarmAvailable])
  {
    if (!self->_serialActivityDispatchQ)
    {
      v4 = off_10027CA18;
      objc_super v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      self->_serialActivityDispatchQ = (OS_dispatch_queue *)dispatch_queue_create(v4, v5);
    }

    [(WiFiManagerMotionServices *)self drivingEndedAlarmTriggerDuration];
    double v7 = v6;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000BEC8C;
    v10[3] = &unk_100240ED8;
    v10[4] = self;
    self->_drivingAlarm = (CMActivityAlarm *)[objc_alloc((Class)CMActivityAlarm) initWithTrigger:10 duration:-[WiFiManagerMotionServices serialActivityDispatchQ](self, "serialActivityDispatchQ") onQueue:v10 withHandler:v6];
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: [MOTION] Setting up Driving Ended Alarm, dur:%.1fsecs", "-[WiFiManagerMotionServices setupDrivingEndedAlarm]", *(void *)&v7);
    }
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: [MOTION] activity alarm is not available", "-[WiFiManagerMotionServices setupDrivingEndedAlarm]", v9);
    }
  }
}

- (CMMotionActivityManager)activityManager
{
  return self->_activityManager;
}

- (void)setActivityManager:(id)a3
{
}

- (NSOperationQueue)motionQ
{
  return self->_motionQ;
}

- (void)setMotionQ:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)motionStateChangeCb
{
  return self->_motionStateChangeCb;
}

- (void)setMotionStateChangeCb:(void *)a3
{
  self->_motionStateChangeCb = a3;
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

- (int)motionState
{
  return self->_motionState;
}

- (void)setMotionState:(int)a3
{
  self->_motionState = a3;
}

- (OS_dispatch_queue)serialActivityDispatchQ
{
  return self->_serialActivityDispatchQ;
}

- (void)setSerialActivityDispatchQ:(id)a3
{
}

- (CMActivityAlarm)drivingAlarm
{
  return self->_drivingAlarm;
}

- (void)setDrivingAlarm:(id)a3
{
}

- (CMActivityAlarm)walkingAlarm
{
  return self->_walkingAlarm;
}

- (void)setWalkingAlarm:(id)a3
{
}

- (double)drivingStartedAlarmTriggerDuration
{
  return self->_drivingStartedAlarmTriggerDuration;
}

- (void)setDrivingStartedAlarmTriggerDuration:(double)a3
{
  self->_drivingStartedAlarmTriggerDuration = a3;
}

- (double)drivingEndedAlarmTriggerDuration
{
  return self->_drivingEndedAlarmTriggerDuration;
}

- (void)setDrivingEndedAlarmTriggerDuration:(double)a3
{
  self->_drivingEndedAlarmTriggerDuration = a3;
}

- (double)walkingStartedAlarmTriggerDuration
{
  return self->_walkingStartedAlarmTriggerDuration;
}

- (void)setWalkingStartedAlarmTriggerDuration:(double)a3
{
  self->_walkingStartedAlarmTriggerDuration = a3;
}

- (double)walkingEndedAlarmTriggerDuration
{
  return self->_walkingEndedAlarmTriggerDuration;
}

- (void)setWalkingEndedAlarmTriggerDuration:(double)a3
{
  self->_walkingEndedAlarmTriggerDuration = a3;
}

- (double)motionStartTime
{
  return self->_motionStartTime;
}

- (void)setMotionStartTime:(double)a3
{
  self->_motionStartTime = a3;
}

@end