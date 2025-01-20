@interface IOSPedometry
- (BOOL)sensorPresent;
- (IOSPedometry)init;
- (id).cxx_construct;
- (void)getSensor;
- (void)start;
- (void)stop;
@end

@implementation IOSPedometry

- (void)start
{
  pedometer = self->_pedometer;
  id v4 = objc_alloc_init((Class)NSDate);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10034ACF8;
  v5[3] = &unk_100469130;
  v5[4] = self;
  [(CMPedometer *)pedometer startPedometerUpdatesFromDate:v4 withHandler:v5];
}

- (IOSPedometry)init
{
  v6.receiver = self;
  v6.super_class = (Class)IOSPedometry;
  v2 = [(IOSPedometry *)&v6 init];
  if (v2)
  {
    v3 = (CMPedometer *)objc_alloc_init((Class)CMPedometer);
    pedometer = v2->_pedometer;
    v2->_pedometer = v3;

    operator new();
  }
  return 0;
}

- (BOOL)sensorPresent
{
  if (+[CMPedometer isStepCountingAvailable]
    || +[CMPedometer isDistanceAvailable])
  {
    return 1;
  }

  return +[CMPedometer isFloorCountingAvailable];
}

- (void)getSensor
{
  return self->_sensor.__ptr_.__value_;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

- (void)stop
{
}

- (void).cxx_destruct
{
  value = self->_sensor.__ptr_.__value_;
  self->_sensor.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(PedometrySensor *, SEL))(*(void *)value + 8))(value, a2);
  }

  objc_storeStrong((id *)&self->_pedometer, 0);
}

@end