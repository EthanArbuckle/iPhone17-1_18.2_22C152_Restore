@interface WRM_MotionControllerIOS
+ (id)singleton;
- (WRM_MotionControllerIOS)init;
- (int)getMobilityState;
- (int)getPrevMobilityState;
- (void)dealloc;
- (void)notifyHandoverManager:(int)a3;
- (void)startMonitoringAlarms;
- (void)stopAllAlarms;
- (void)stopMonitoringAlarms;
- (void)stopPendingAlarms;
- (void)updateAlarmMonitoringDuration:(int)a3;
- (void)waitForActivityState:(unint64_t)a3 :(int)a4;
- (void)waitForDrivingState:(unint64_t)a3;
- (void)waitForPedestrianState:(unint64_t)a3;
- (void)waitForRunningState:(unint64_t)a3;
- (void)waitForStaticState:(unint64_t)a3;
- (void)waitForWalkingState:(unint64_t)a3;
@end

@implementation WRM_MotionControllerIOS

- (int)getMobilityState
{
  return self->myMobilityState;
}

+ (id)singleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100089F94;
  block[3] = &unk_10020D980;
  block[4] = a1;
  if (qword_10027D0E0 != -1) {
    dispatch_once(&qword_10027D0E0, block);
  }
  return (id)qword_10027D0D8;
}

- (WRM_MotionControllerIOS)init
{
  v4.receiver = self;
  v4.super_class = (Class)WRM_MotionControllerIOS;
  v2 = [(WRM_MotionController *)&v4 init];
  if (v2)
  {
    v2->mAlarmQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.WirelessRadioManager.Motion", 0);
    v2->myMobilityState = 5;
    v2->myPrevMobilityState = 5;
    v2->mMotionControllerState = 0;
    v2->mStaticAlarm = 0;
    v2->mWalkingAlarm = 0;
    v2->mRunningAlarm = 0;
    v2->mDrivingAlarm = 0;
    v2->mPedestrianAfterStatic = 0;
    v2->mDefaultAlarmDuration = 1;
    +[WCM_Logging logLevel:21 message:@"Motion Controller: initialized\n"];
  }
  return v2;
}

- (void)dealloc
{
  mAlarmQueue = self->mAlarmQueue;
  if (mAlarmQueue) {
    dispatch_release(mAlarmQueue);
  }
  self->mAlarmQueue = 0;
  +[WCM_Logging logLevel:21 message:@"Handover Manager: Dealloc called for handover manager "];
  +[WCM_Logging logLevel:21 message:@"Handover Manager: Dealloc called for handover manager \n"];
  [(WRM_MotionControllerIOS *)self stopMonitoringAlarms];
  self->myMobilityState = 5;
  self->myPrevMobilityState = 5;
  self->mMotionControllerState = 0;
  self->mStaticAlarm = 0;
  self->mWalkingAlarm = 0;
  self->mRunningAlarm = 0;
  self->mDrivingAlarm = 0;
  self->mPedestrianAfterStatic = 0;
  v4.receiver = self;
  v4.super_class = (Class)WRM_MotionControllerIOS;
  [(WRM_MotionController *)&v4 dealloc];
}

- (int)getPrevMobilityState
{
  return self->myMobilityState;
}

- (void)updateAlarmMonitoringDuration:(int)a3
{
  self->mDefaultAlarmDuration = a3;
}

- (void)startMonitoringAlarms
{
  mAlarmQueue = self->mAlarmQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008A23C;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async(mAlarmQueue, block);
}

- (void)stopMonitoringAlarms
{
  if (+[CMActivityAlarm activityAlarmAvailable])
  {
    [(WRM_MotionControllerIOS *)self stopPendingAlarms];
  }
  else
  {
    +[WCM_Logging logLevel:21 message:@"Alarm: Motion activity not supported on the platform \n"];
  }
}

- (void)stopAllAlarms
{
  mAlarmQueue = self->mAlarmQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008A3D0;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async(mAlarmQueue, block);
}

- (void)stopPendingAlarms
{
  +[WCM_Logging logLevel:18 message:@"Alarm: Inside stopPendingAlarms"];
  if (+[CMActivityAlarm activityAlarmAvailable])
  {
    mStaticAlarm = self->mStaticAlarm;
    if (mStaticAlarm)
    {
      [(CMActivityAlarm *)mStaticAlarm invalidate];

      self->mStaticAlarm = 0;
    }
    mWalkingAlarm = self->mWalkingAlarm;
    if (mWalkingAlarm)
    {
      [(CMActivityAlarm *)mWalkingAlarm invalidate];

      self->mWalkingAlarm = 0;
    }
    mRunningAlarm = self->mRunningAlarm;
    if (mRunningAlarm)
    {
      [(CMActivityAlarm *)mRunningAlarm invalidate];

      self->mRunningAlarm = 0;
    }
    mDrivingAlarm = self->mDrivingAlarm;
    if (mDrivingAlarm)
    {
      [(CMActivityAlarm *)mDrivingAlarm invalidate];

      self->mDrivingAlarm = 0;
    }
    mPedestrianAfterStatic = self->mPedestrianAfterStatic;
    if (mPedestrianAfterStatic)
    {
      [(CMActivityAlarm *)mPedestrianAfterStatic invalidate];

      self->mPedestrianAfterStatic = 0;
    }
    self->mMotionControllerState = 0;
  }
}

- (void)waitForStaticState:(unint64_t)a3
{
  +[WCM_Logging logLevel:18 message:@"Alarm: setting up static state alarm "];
  mStaticAlarm = self->mStaticAlarm;
  if (mStaticAlarm)
  {

    self->mStaticAlarm = 0;
  }
  id v6 = objc_alloc((Class)CMActivityAlarm);
  mAlarmQueue = self->mAlarmQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008A6DC;
  v8[3] = &unk_10020F598;
  v8[4] = self;
  v8[5] = a3;
  self->mStaticAlarm = (CMActivityAlarm *)[v6 initWithTrigger:0 duration:mAlarmQueue onQueue:v8 withHandler:(double)a3];
}

- (void)waitForPedestrianState:(unint64_t)a3
{
  +[WCM_Logging logLevel:18 message:@"Alarm: setting up pedestrian state alarm "];
  mPedestrianAfterStatic = self->mPedestrianAfterStatic;
  if (mPedestrianAfterStatic)
  {

    self->mPedestrianAfterStatic = 0;
  }
  id v6 = objc_alloc((Class)CMActivityAlarm);
  mAlarmQueue = self->mAlarmQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008A834;
  v8[3] = &unk_10020F598;
  v8[4] = self;
  v8[5] = a3;
  self->mPedestrianAfterStatic = (CMActivityAlarm *)[v6 initWithTrigger:11 duration:mAlarmQueue onQueue:v8 withHandler:(double)a3];
}

- (void)waitForWalkingState:(unint64_t)a3
{
  +[WCM_Logging logLevel:18 message:@"Alarm: setting up walking state alarm "];
  mWalkingAlarm = self->mWalkingAlarm;
  if (mWalkingAlarm)
  {

    self->mWalkingAlarm = 0;
  }
  id v6 = objc_alloc((Class)CMActivityAlarm);
  mAlarmQueue = self->mAlarmQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008A990;
  v8[3] = &unk_10020F598;
  v8[4] = self;
  v8[5] = a3;
  self->mWalkingAlarm = (CMActivityAlarm *)[v6 initWithTrigger:2 duration:mAlarmQueue onQueue:v8 withHandler:(double)a3];
}

- (void)waitForRunningState:(unint64_t)a3
{
  +[WCM_Logging logLevel:18 message:@"Alarm: setting up running state alarm "];
  mRunningAlarm = self->mRunningAlarm;
  if (mRunningAlarm)
  {

    self->mRunningAlarm = 0;
  }
  id v6 = objc_alloc((Class)CMActivityAlarm);
  mAlarmQueue = self->mAlarmQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008AAEC;
  v8[3] = &unk_10020F598;
  v8[4] = self;
  v8[5] = a3;
  self->mRunningAlarm = (CMActivityAlarm *)[v6 initWithTrigger:3 duration:mAlarmQueue onQueue:v8 withHandler:(double)a3];
}

- (void)waitForDrivingState:(unint64_t)a3
{
  +[WCM_Logging logLevel:18 message:@"Alarm: setting up driving state alarm "];
  mDrivingAlarm = self->mDrivingAlarm;
  if (mDrivingAlarm)
  {

    self->mDrivingAlarm = 0;
  }
  id v6 = objc_alloc((Class)CMActivityAlarm);
  mAlarmQueue = self->mAlarmQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008AC48;
  v8[3] = &unk_10020F598;
  v8[4] = self;
  v8[5] = a3;
  self->mDrivingAlarm = (CMActivityAlarm *)[v6 initWithTrigger:4 duration:mAlarmQueue onQueue:v8 withHandler:(double)a3];
}

- (void)waitForActivityState:(unint64_t)a3 :(int)a4
{
  [(WRM_MotionControllerIOS *)self stopPendingAlarms];
  switch(a4)
  {
    case 0:
      [(WRM_MotionControllerIOS *)self waitForWalkingState:a3];
      [(WRM_MotionControllerIOS *)self waitForRunningState:a3];
      [(WRM_MotionControllerIOS *)self waitForDrivingState:a3];
      [(WRM_MotionControllerIOS *)self waitForPedestrianState:a3];
      self->mMotionControllerState = 2;
      CFStringRef v7 = @"Alarm State: ALARM_WALKING_RUNNING_DRIVING_PEDESTRIAN";
      goto LABEL_9;
    case 1:
      [(WRM_MotionControllerIOS *)self waitForStaticState:a3];
      [(WRM_MotionControllerIOS *)self waitForRunningState:a3];
      [(WRM_MotionControllerIOS *)self waitForDrivingState:a3];
      [(WRM_MotionControllerIOS *)self waitForPedestrianState:a3];
      goto LABEL_8;
    case 2:
      [(WRM_MotionControllerIOS *)self waitForStaticState:a3];
      [(WRM_MotionControllerIOS *)self waitForDrivingState:a3];
      [(WRM_MotionControllerIOS *)self waitForWalkingState:a3];
      [(WRM_MotionControllerIOS *)self waitForPedestrianState:a3];
      self->mMotionControllerState = 4;
      CFStringRef v7 = @"Alarm State: ALARM_DRIVING_STATIONARY_WALKING_PEDSTRIAN";
      goto LABEL_9;
    case 3:
      [(WRM_MotionControllerIOS *)self waitForStaticState:a3];
      [(WRM_MotionControllerIOS *)self waitForRunningState:a3];
      [(WRM_MotionControllerIOS *)self waitForWalkingState:a3];
      [(WRM_MotionControllerIOS *)self waitForPedestrianState:a3];
      self->mMotionControllerState = 5;
      CFStringRef v7 = @"Alarm State: ALARM_STATIONARY_WALKING_RUNNING_PEDSTRIAN";
      goto LABEL_9;
    case 4:
      [(WRM_MotionControllerIOS *)self waitForStaticState:a3];
      [(WRM_MotionControllerIOS *)self waitForRunningState:a3];
      [(WRM_MotionControllerIOS *)self waitForDrivingState:a3];
      [(WRM_MotionControllerIOS *)self waitForWalkingState:a3];
LABEL_8:
      self->mMotionControllerState = 3;
      CFStringRef v7 = @"Alarm State: ALARM_RUNNING_DRIVING_STATIONARY_PEDESTRIAN";
LABEL_9:
      uint64_t v8 = 18;
      goto LABEL_10;
    case 5:
      [(WRM_MotionControllerIOS *)self waitForStaticState:a3];
      return;
    default:
      CFStringRef v7 = @"Alarm: Motion State Invalid \n";
      uint64_t v8 = 16;
LABEL_10:
      +[WCM_Logging logLevel:v8 message:v7];
      return;
  }
}

- (void)notifyHandoverManager:(int)a3
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "kWRMM_MOTION_STATE", a3);
  *(_OWORD *)keys = *(_OWORD *)off_10020F5B8;
  values[0] = xpc_uint64_create(0x3E9uLL);
  values[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)off_10020F5C8;
  object[0] = xpc_uint64_create(0x3E8uLL);
  object[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)v8, object, 2uLL);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 21, @"%s: ready to send a xpc message: %@.", "-[WRM_MotionControllerIOS notifyHandoverManager:]", v6);
  [+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") updateControllerState:v6];
  [+[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton") updateControllerState:v6];
  xpc_release(object[0]);
  xpc_release(v6);
  xpc_release(values[0]);
  xpc_release(v5);
  xpc_release(v4);
}

@end