@interface CLDurianCompanionDeviceObserver
- (CLDurianCompanionDeviceObserver)init;
- (CLDurianCompanionDeviceObserver)initWithUniverse:(id)a3;
- (CLDurianCompanionObservationDelegate)delegate;
- (id).cxx_construct;
- (void)dealloc;
- (void)onCompanionNotification:(int)a3 data:(unsigned __int8 *)a4;
- (void)registerForCompanionConnectionUpdateWithUniverse:(id)a3;
- (void)setDelegate:(id)a3;
- (void)unregisterForCompanionConnectionUpdate;
@end

@implementation CLDurianCompanionDeviceObserver

- (CLDurianCompanionDeviceObserver)init
{
  return 0;
}

- (CLDurianCompanionDeviceObserver)initWithUniverse:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLDurianCompanionDeviceObserver;
  v4 = [(CLDurianCompanionDeviceObserver *)&v7 init];
  v5 = v4;
  if (v4) {
    [(CLDurianCompanionDeviceObserver *)v4 registerForCompanionConnectionUpdateWithUniverse:a3];
  }
  return v5;
}

- (void)dealloc
{
  [(CLDurianCompanionDeviceObserver *)self unregisterForCompanionConnectionUpdate];
  v3.receiver = self;
  v3.super_class = (Class)CLDurianCompanionDeviceObserver;
  [(CLDurianCompanionDeviceObserver *)&v3 dealloc];
}

- (void)registerForCompanionConnectionUpdateWithUniverse:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332178);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = 68289026;
    __int16 v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #companion received companion connection update registration\"}", (uint8_t *)&v6, 0x12u);
  }
  value = self->_companionClient.__ptr_.__value_;
  if (!value) {
    sub_1000B2C0C();
  }
  [*((id *)value + 2) register:*((void *)value + 1) forNotification:5 registrationInfo:0];
}

- (void)unregisterForCompanionConnectionUpdate
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332178);
  }
  objc_super v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #companion received companion connection update unregistration\"}", (uint8_t *)v6, 0x12u);
  }
  value = self->_companionClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:5];
    v5 = self->_companionClient.__ptr_.__value_;
    self->_companionClient.__ptr_.__value_ = 0;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8))(v5);
    }
  }
}

- (void)onCompanionNotification:(int)a3 data:(unsigned __int8 *)a4
{
  if (a3 == 5)
  {
    int v5 = *a4;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332178);
    }
    uint64_t v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289283;
      int v12 = 0;
      __int16 v13 = 2082;
      v14 = "";
      __int16 v15 = 1025;
      int v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #companion received companion connection update\", \"companionIsNearby\":%{private}d}", buf, 0x18u);
    }
    id v7 = [a1 delegate];
    if (v5) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
    [v7 onCompanionObservationWithType:v8];
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332178);
    }
    v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "#durian #companion received unhandled companion notification", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332178);
      }
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLDurianCompanionDeviceObserver onCompanionNotification:data:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
  }
}

- (CLDurianCompanionObservationDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLDurianCompanionObservationDelegate *)a3;
}

- (void).cxx_destruct
{
  value = self->_companionClient.__ptr_.__value_;
  self->_companionClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end