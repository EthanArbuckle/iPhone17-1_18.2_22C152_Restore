@interface WRM_MotionController
+ (id)singleton;
- (WRM_MotionController)init;
- (id)getMotionAlarmQueue;
- (int)getMobilityState;
- (int)getPrevMobilityState;
- (void)dealloc;
@end

@implementation WRM_MotionController

- (WRM_MotionController)init
{
  v4.receiver = self;
  v4.super_class = (Class)WRM_MotionController;
  v2 = [(WRM_MotionController *)&v4 init];
  if (v2) {
    v2->mAlarmQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.WirelessRadioManager.Motion", 0);
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
  v4.receiver = self;
  v4.super_class = (Class)WRM_MotionController;
  [(WRM_MotionController *)&v4 dealloc];
}

- (int)getMobilityState
{
  return 5;
}

- (int)getPrevMobilityState
{
  return 5;
}

- (id)getMotionAlarmQueue
{
  return self->mAlarmQueue;
}

+ (id)singleton
{
  if (qword_10027D0D0 != -1) {
    dispatch_once(&qword_10027D0D0, &stru_10020F570);
  }
  return (id)qword_10027D0C8;
}

@end