@interface IOSDeviceMotion
+ (void)convertGToAccel:(SensorMeasurement *)a3;
- (BOOL)sensorPresent;
- (IOSDeviceMotion)initWithMotionManager:(id)a3 andHandler:(id)a4 usingReferenceFrame:(unint64_t)a5;
- (id)description;
- (void)start;
- (void)stop;
@end

@implementation IOSDeviceMotion

- (IOSDeviceMotion)initWithMotionManager:(id)a3 andHandler:(id)a4 usingReferenceFrame:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 deviceMotionUpdateInterval];
  v12.receiver = self;
  v12.super_class = (Class)IOSDeviceMotion;
  v10 = -[IOSAbstractInertialSensor initWithMotionManager:andHandler:andType:andRate:](&v12, "initWithMotionManager:andHandler:andType:andRate:", v8, v9, 8);
  v10->_referenceFrame = a5;

  return v10;
}

- (void)start
{
  v8.receiver = self;
  v8.super_class = (Class)IOSDeviceMotion;
  v3 = [(IOSAbstractInertialSensor *)&v8 motionManager];
  unint64_t referenceFrame = self->_referenceFrame;
  v7.receiver = self;
  v7.super_class = (Class)IOSDeviceMotion;
  v5 = [(IOSAbstractInertialSensor *)&v7 motionEventProcessor];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100044BB4;
  v6[3] = &unk_100468AD0;
  v6[4] = self;
  [v3 startDeviceMotionUpdatesUsingReferenceFrame:referenceFrame toQueue:v5 withHandler:v6];
}

- (BOOL)sensorPresent
{
  v5.receiver = self;
  v5.super_class = (Class)IOSDeviceMotion;
  v2 = [(IOSAbstractInertialSensor *)&v5 motionManager];
  unsigned __int8 v3 = [v2 isDeviceMotionAvailable];

  return v3;
}

+ (void)convertGToAccel:(SensorMeasurement *)a3
{
  *(float64x2_t *)&a3->var1 = vmulq_n_f64(*(float64x2_t *)&a3->var1, -9.81);
  a3->var3 = -(9.81 * a3->var3);
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)IOSDeviceMotion;
  v2 = [(IOSAbstractInertialSensor *)&v3 motionManager];
  [v2 stopDeviceMotionUpdates];
}

- (id)description
{
  return @"fused device motion";
}

@end