@interface IOSActivityState
- (BOOL)sensorPresent;
- (CMMotionActivityManager)motionActivityManager;
- (IOSActivityState)init;
- (IOSActivityState)initWithMotionActivityManager:(id)a3 andHandler:(id)a4;
- (NSOperationQueue)motionEventProcessor;
- (id).cxx_construct;
- (id)description;
- (void)getSensor;
- (void)sensorBridge;
- (void)start;
- (void)stop;
@end

@implementation IOSActivityState

- (IOSActivityState)initWithMotionActivityManager:(id)a3 andHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IOSActivityState;
  v9 = [(IOSActivityState *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_motionActivityManager, a3);
    objc_storeStrong((id *)&v10->_motionEventProcessor, a4);
    operator new();
  }

  return 0;
}

- (void)start
{
  motionActivityManager = self->_motionActivityManager;
  motionEventProcessor = self->_motionEventProcessor;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001AA1C;
  v4[3] = &unk_100468A70;
  v4[4] = self;
  [(CMMotionActivityManager *)motionActivityManager startActivityUpdatesToQueue:motionEventProcessor withHandler:v4];
}

- (BOOL)sensorPresent
{
  return +[CMMotionActivityManager isActivityAvailable];
}

- (void)getSensor
{
  return self->_sensorBridge.__ptr_.__value_;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (IOSActivityState)init
{
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_100468AA8);
    v4 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v4 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR))
  {
LABEL_3:
    int v6 = 136315138;
    id v7 = "-[IOSActivityState init]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Attempt to access unimplemented function %s", (uint8_t *)&v6, 0xCu);
  }
LABEL_4:
  [(IOSActivityState *)self doesNotRecognizeSelector:a2];

  return 0;
}

- (void)stop
{
}

- (void)sensorBridge
{
  return self->_sensorBridge.__ptr_.__value_;
}

- (id)description
{
  return @"activity state";
}

- (CMMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (NSOperationQueue)motionEventProcessor
{
  return self->_motionEventProcessor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionEventProcessor, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  value = self->_sensorBridge.__ptr_.__value_;
  self->_sensorBridge.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

@end