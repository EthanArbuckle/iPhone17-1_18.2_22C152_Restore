@interface IOSGps
- (BOOL)sensorPresent;
- (CLLocationManager)locationManager;
- (IOSGps)initWithDisableBackground:(BOOL)a3;
- (id).cxx_construct;
- (void)getSensor;
- (void)locationManager:(id)a3 didUpdateToLocation:(id)a4 fromLocation:(id)a5;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation IOSGps

- (IOSGps)initWithDisableBackground:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IOSGps;
  if ([(IOSGps *)&v4 init]) {
    operator new();
  }

  return 0;
}

- (void)locationManager:(id)a3 didUpdateToLocation:(id)a4 fromLocation:(id)a5
{
}

- (BOOL)sensorPresent
{
  return MGGetBoolAnswer();
}

- (void)start
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034477C;
  block[3] = &unk_1004527B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)stop
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100344914;
  block[3] = &unk_1004527B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)getSensor
{
  return self->_gpsSensor.__ptr_.__value_;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  value = self->_gpsSensor.__ptr_.__value_;
  self->_gpsSensor.__ptr_.__value_ = 0;
  if (value)
  {
    objc_super v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end