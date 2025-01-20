@interface CLDeviceProximityHelper
+ (int)convertPocketStateToDeviceProximity:(int64_t)a3;
- (CLDeviceProximityHelper)initWithOwnerClass:(void *)a3;
- (CMPocketStateManager)fPocketStateManager;
- (void)fDeviceProximity;
- (void)invalidate;
- (void)queryForProximity:(id)a3 monitorInterval:(double)a4 withTimeout:(double)a5;
@end

@implementation CLDeviceProximityHelper

+ (int)convertPocketStateToDeviceProximity:(int64_t)a3
{
  if ((unint64_t)a3 < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (CLDeviceProximityHelper)initWithOwnerClass:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLDeviceProximityHelper;
  v4 = [(CLDeviceProximityHelper *)&v6 init];
  if (v4)
  {
    v4->_fPocketStateManager = (CMPocketStateManager *)objc_opt_new();
    v4->_fDeviceProximity = a3;
  }
  return v4;
}

- (void)queryForProximity:(id)a3 monitorInterval:(double)a4 withTimeout:(double)a5
{
  fPocketStateManager = self->_fPocketStateManager;
  if (fPocketStateManager)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10098B58C;
    v7[3] = &unk_1022D62A8;
    v7[4] = self;
    [(CMPocketStateManager *)fPocketStateManager queryStateOntoQueue:a3 andMonitorFor:v7 withTimeout:a4 andHandler:a5];
  }
}

- (void)invalidate
{
  p_fPocketStateManager = &self->_fPocketStateManager;
  fPocketStateManager = self->_fPocketStateManager;
  if (fPocketStateManager)
  {

    *p_fPocketStateManager = 0;
    p_fPocketStateManager[1] = 0;
  }
}

- (CMPocketStateManager)fPocketStateManager
{
  return self->_fPocketStateManager;
}

- (void)fDeviceProximity
{
  return self->_fDeviceProximity;
}

@end