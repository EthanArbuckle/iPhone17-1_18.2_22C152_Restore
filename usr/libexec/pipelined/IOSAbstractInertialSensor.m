@interface IOSAbstractInertialSensor
- (BOOL)sensorPresent;
- (CMMotionManager)motionManager;
- (IOSAbstractInertialSensor)init;
- (IOSAbstractInertialSensor)initWithMotionManager:(id)a3 andHandler:(id)a4 andType:(int)a5 andRate:(double)a6;
- (NSOperationQueue)motionEventProcessor;
- (double)updateInterval;
- (id).cxx_construct;
- (void)getSensor;
- (void)sensorBridge;
- (void)start;
- (void)stop;
@end

@implementation IOSAbstractInertialSensor

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (IOSAbstractInertialSensor)initWithMotionManager:(id)a3 andHandler:(id)a4 andType:(int)a5 andRate:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IOSAbstractInertialSensor;
  v11 = [(IOSAbstractInertialSensor *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_motionManager, a3);
    objc_storeStrong((id *)&v12->_motionEventProcessor, a4);
    operator new();
  }

  return 0;
}

- (void)sensorBridge
{
  return self->_sensorBridge.__ptr_.__value_;
}

- (NSOperationQueue)motionEventProcessor
{
  return self->_motionEventProcessor;
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

- (IOSAbstractInertialSensor)init
{
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_100468BC0);
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
    v7 = "-[IOSAbstractInertialSensor init]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Attempt to access unimplemented function %s", (uint8_t *)&v6, 0xCu);
  }
LABEL_4:
  [(IOSAbstractInertialSensor *)self doesNotRecognizeSelector:a2];

  return 0;
}

- (BOOL)sensorPresent
{
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_100468BC0);
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
    v7 = "-[IOSAbstractInertialSensor sensorPresent]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Attempt to access unimplemented function %s", (uint8_t *)&v6, 0xCu);
  }
LABEL_4:
  [(IOSAbstractInertialSensor *)self doesNotRecognizeSelector:a2];
  return 0;
}

- (void)start
{
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_100468BC0);
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
    int v5 = 136315138;
    int v6 = "-[IOSAbstractInertialSensor start]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Attempt to access unimplemented function %s", (uint8_t *)&v5, 0xCu);
  }
LABEL_4:
  [(IOSAbstractInertialSensor *)self doesNotRecognizeSelector:a2];
}

- (void)stop
{
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_100468BC0);
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
    int v5 = 136315138;
    int v6 = "-[IOSAbstractInertialSensor stop]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Attempt to access unimplemented function %s", (uint8_t *)&v5, 0xCu);
  }
LABEL_4:
  [(IOSAbstractInertialSensor *)self doesNotRecognizeSelector:a2];
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionEventProcessor, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  value = self->_sensorBridge.__ptr_.__value_;
  self->_sensorBridge.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

@end