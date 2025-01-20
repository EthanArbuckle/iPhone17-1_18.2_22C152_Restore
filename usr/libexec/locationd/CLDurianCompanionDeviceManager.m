@interface CLDurianCompanionDeviceManager
- (CLDurianCompanionDeviceManager)init;
- (CLDurianCompanionDeviceManager)initWithUniverse:(id)a3;
- (CLDurianDeviceObservationDelegate)deviceObservationDelegate;
- (NSUUID)lastObservedBeacon;
- (SPOwnerSession)ownerSession;
- (int64_t)lastObservedType;
- (void)dealloc;
- (void)onCompanionObservationWithType:(int64_t)a3;
- (void)setDeviceObservationDelegate:(id)a3;
- (void)setLastObservedBeacon:(id)a3;
- (void)setLastObservedType:(int64_t)a3;
- (void)setOwnerSession:(id)a3;
@end

@implementation CLDurianCompanionDeviceManager

- (CLDurianCompanionDeviceManager)init
{
  return 0;
}

- (CLDurianCompanionDeviceManager)initWithUniverse:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLDurianCompanionDeviceManager;
  v3 = [(CLDurianCompanionDeviceManager *)&v6 init];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    v3->_lastObservedBeacon = 0;
    v3->_lastObservedType = 0;
    v3->_ownerSession = (SPOwnerSession *)v4;
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianCompanionDeviceManager;
  [(CLDurianCompanionDeviceManager *)&v3 dealloc];
}

- (void)onCompanionObservationWithType:(int64_t)a3
{
  SEL v5 = NSSelectorFromString(@"activeCompanionWithCompletion:");
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10163E6B0;
    v8[3] = &unk_102332858;
    objc_copyWeak(v9, &location);
    v9[1] = (id)a3;
    [(SPOwnerSession *)self->_ownerSession performSelector:v5 withObject:v8];
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332878);
    }
    objc_super v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      id location = (id)68289026;
      __int16 v11 = 2082;
      v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #companion owner session deosn't respond to activeCompanionWithCompletion:\"}", (uint8_t *)&location, 0x12u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332878);
      }
    }
    v7 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id location = (id)68289026;
      __int16 v11 = 2082;
      v12 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #companion owner session deosn't respond to activeCompanionWithCompletion:", "{\"msg%{public}.0s\":\"#durian #companion owner session deosn't respond to activeCompanionWithCompletion:\"}", (uint8_t *)&location, 0x12u);
    }
  }
}

- (CLDurianDeviceObservationDelegate)deviceObservationDelegate
{
  return self->_deviceObservationDelegate;
}

- (void)setDeviceObservationDelegate:(id)a3
{
  self->_deviceObservationDelegate = (CLDurianDeviceObservationDelegate *)a3;
}

- (SPOwnerSession)ownerSession
{
  return (SPOwnerSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOwnerSession:(id)a3
{
}

- (NSUUID)lastObservedBeacon
{
  return self->_lastObservedBeacon;
}

- (void)setLastObservedBeacon:(id)a3
{
}

- (int64_t)lastObservedType
{
  return self->_lastObservedType;
}

- (void)setLastObservedType:(int64_t)a3
{
  self->_lastObservedType = a3;
}

@end