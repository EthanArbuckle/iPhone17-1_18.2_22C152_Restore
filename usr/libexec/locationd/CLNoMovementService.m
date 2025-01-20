@interface CLNoMovementService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLNoMovementService)init;
- (NSMutableSet)clientRegistry;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)onDeviceMotionData:(const Sample *)a3;
- (void)onMobileAssetNotification:(int)a3 data:(uint64_t)a4;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onNoMovementControllerEnablement:(BOOL)a3;
- (void)onNoMovementControllerEpoch:(id)a3 epochValue:(int)a4;
- (void)onNoMovementControllerStateUpdate:(id)a3;
- (void)onWatchOrientationSettingsNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)registerForStateUpdates:(id)a3;
- (void)requestLatestStateUpdate:(id)a3;
- (void)serveClientsStateUpdate:(id)a3;
- (void)setClientRegistry:(id)a3;
- (void)toggleDeviceMotion:(BOOL)a3;
- (void)unregisterForStateUpdates:(id)a3;
@end

@implementation CLNoMovementService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1024818B0 != -1) {
    dispatch_once(&qword_1024818B0, &stru_1022F9C88);
  }
  return (id)qword_1024818A8;
}

- (CLNoMovementService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLNoMovementService;
  return [(CLNoMovementService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLNoMovementServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLNoMovementServiceClientProtocol];
}

+ (BOOL)isSupported
{
  if (qword_1024818C0 != -1) {
    dispatch_once(&qword_1024818C0, &stru_1022F9CA8);
  }
  return byte_1024818B8;
}

- (void)beginService
{
}

- (void)endService
{
  [self universe].silo
  [(CLNoMovementService *)self setClientRegistry:0];
  value = self->fMotionStateMediatorClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:2];
    v4 = self->fMotionStateMediatorClient.__ptr_.__value_;
    self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
    if (v4) {
      (*(void (**)(Client *))(*(void *)v4 + 8))(v4);
    }
  }
  unint64_t v5 = self->fWatchOrientationSettingsClient.__ptr_.__value_;
  if (v5)
  {
    [*((id *)v5 + 2) unregister:*((void *)v5 + 1) forNotification:0];
    v6 = self->fWatchOrientationSettingsClient.__ptr_.__value_;
    self->fWatchOrientationSettingsClient.__ptr_.__value_ = 0;
    if (v6) {
      (*(void (**)(Client *))(*(void *)v6 + 8))(v6);
    }
  }
  v7 = self->fDeviceMotionDispatcher.__ptr_.__value_;
  self->fDeviceMotionDispatcher.__ptr_.__value_ = 0;
  if (v7) {
    (*(void (**)(void *))(*(void *)v7 + 8))(v7);
  }
  if (qword_102419340 != -1) {
    dispatch_once(&qword_102419340, &stru_1022F9CC8);
  }
  v8 = qword_102419348;
  if (os_log_type_enabled((os_log_t)qword_102419348, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CLNoMovement] service: ended service", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419340 != -1) {
      dispatch_once(&qword_102419340, &stru_1022F9CC8);
    }
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNoMovementService endService]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
}

- (void)registerForStateUpdates:(id)a3
{
  [[-[CLNoMovementService universe](self, "universe") silo];
  [(NSMutableSet *)[(CLNoMovementService *)self clientRegistry] addObject:a3];
  int v5 = [(NSMutableSet *)[(CLNoMovementService *)self clientRegistry] count];

  sub_100563BF4((uint64_t)&self->fAnalytics, v5);
}

- (void)unregisterForStateUpdates:(id)a3
{
  [self universe].silo
  int v5 = [(CLNoMovementService *)self clientRegistry];

  [(NSMutableSet *)v5 removeObject:a3];
}

- (void)requestLatestStateUpdate:(id)a3
{
  [self universe].silo
  if (self->fController.__ptr_.__value_)
  {
    notify_post("com.apple.locationd.nomovement.stateupdate");
    int v5 = (void *)sub_100F83EE0((uint64_t)self->fController.__ptr_.__value_);
    [a3 onStateUpdate:[v5 copy]];
    if (qword_102419340 != -1) {
      dispatch_once(&qword_102419340, &stru_1022F9CC8);
    }
    v6 = qword_102419348;
    if (os_log_type_enabled((os_log_t)qword_102419348, OS_LOG_TYPE_DEFAULT))
    {
      [v5 startTime];
      *(_DWORD *)buf = 134218240;
      uint64_t v10 = v7;
      __int16 v11 = 1024;
      unsigned int v12 = [v5 state];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CLNoMovement] service: served client request for latest state update,startTime,%f,state,%d", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419340 != -1) {
        dispatch_once(&qword_102419340, &stru_1022F9CC8);
      }
      [v5 startTime];
      [v5 state];
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNoMovementService requestLatestStateUpdate:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)serveClientsStateUpdate:(id)a3
{
  [(-[CLNoMovementService universe](self, "universe")) silo];
  notify_post("com.apple.locationd.nomovement.stateupdate");
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int v5 = [(CLNoMovementService *)self clientRegistry];
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) onStateUpdate:[a3 copy]];
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v18 objects:v30 count:16];
    }
    while (v7);
  }
  if (qword_102419340 != -1) {
    dispatch_once(&qword_102419340, &stru_1022F9CC8);
  }
  uint64_t v10 = qword_102419348;
  if (os_log_type_enabled((os_log_t)qword_102419348, OS_LOG_TYPE_DEFAULT))
  {
    [a3 startTime];
    uint64_t v12 = v11;
    unsigned int v13 = [a3 state];
    *(_DWORD *)buf = 134218240;
    uint64_t v27 = v12;
    __int16 v28 = 1024;
    unsigned int v29 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[CLNoMovement] service: served all clients state update,startTime,%f,state,%d", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419340 != -1) {
      dispatch_once(&qword_102419340, &stru_1022F9CC8);
    }
    [a3 startTime];
    uint64_t v15 = v14;
    unsigned int v16 = [a3 state];
    int v22 = 134218240;
    uint64_t v23 = v15;
    __int16 v24 = 1024;
    unsigned int v25 = v16;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNoMovementService serveClientsStateUpdate:]", "%s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
  }
}

- (void)toggleDeviceMotion:(BOOL)a3
{
  BOOL v3 = a3;
  [self universe].silo
  if (sub_10125D0BC())
  {
    if (v3)
    {
      if (qword_102419340 != -1) {
        dispatch_once(&qword_102419340, &stru_1022F9CC8);
      }
      int v5 = qword_102419348;
      if (os_log_type_enabled((os_log_t)qword_102419348, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[CLNoMovement] service: attempt to enable device motion", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419340 != -1) {
          dispatch_once(&qword_102419340, &stru_1022F9CC8);
        }
        v9 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNoMovementService toggleDeviceMotion:]", "%s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }
      uint64_t v6 = sub_10125D0BC();
      sub_10125DACC(v6, (uint64_t)self->fDeviceMotionDispatcher.__ptr_.__value_, 0.01);
    }
    else
    {
      if (qword_102419340 != -1) {
        dispatch_once(&qword_102419340, &stru_1022F9CC8);
      }
      id v7 = qword_102419348;
      if (os_log_type_enabled((os_log_t)qword_102419348, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[CLNoMovement] service: attempt to disable device motion", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419340 != -1) {
          dispatch_once(&qword_102419340, &stru_1022F9CC8);
        }
        uint64_t v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNoMovementService toggleDeviceMotion:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
      uint64_t v8 = sub_10125D0BC();
      sub_10125DDA0(v8, (uint64_t)self->fDeviceMotionDispatcher.__ptr_.__value_);
    }
  }
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe:a3, a4, a5, a6, a7 silo];
  if (*a3 == 2)
  {
    if (qword_102419340 != -1) {
      dispatch_once(&qword_102419340, &stru_1022F9CC8);
    }
    uint64_t v10 = qword_102419348;
    if (os_log_type_enabled((os_log_t)qword_102419348, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[CLNoMovement] service: received workout-event notification", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419340 != -1) {
        dispatch_once(&qword_102419340, &stru_1022F9CC8);
      }
      v26 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNoMovementService onMotionStateMediatorNotification:data:]", "%s\n", v26);
      if (v26 != (char *)buf) {
        free(v26);
      }
    }
    value = self->fController.__ptr_.__value_;
    if (value)
    {
      long long v12 = *((_OWORD *)a4 + 13);
      v29[12] = *((_OWORD *)a4 + 12);
      v29[13] = v12;
      uint64_t v30 = *((void *)a4 + 28);
      long long v13 = *((_OWORD *)a4 + 9);
      v29[8] = *((_OWORD *)a4 + 8);
      v29[9] = v13;
      long long v14 = *((_OWORD *)a4 + 11);
      v29[10] = *((_OWORD *)a4 + 10);
      v29[11] = v14;
      long long v15 = *((_OWORD *)a4 + 5);
      v29[4] = *((_OWORD *)a4 + 4);
      v29[5] = v15;
      long long v16 = *((_OWORD *)a4 + 7);
      v29[6] = *((_OWORD *)a4 + 6);
      v29[7] = v16;
      long long v17 = *((_OWORD *)a4 + 1);
      v29[0] = *(_OWORD *)a4;
      v29[1] = v17;
      long long v18 = *((_OWORD *)a4 + 3);
      v29[2] = *((_OWORD *)a4 + 2);
      v29[3] = v18;
      sub_100F83EF0((uint64_t)value, v29);
    }
    long long v19 = *((_OWORD *)a4 + 13);
    v27[12] = *((_OWORD *)a4 + 12);
    v27[13] = v19;
    uint64_t v28 = *((void *)a4 + 28);
    long long v20 = *((_OWORD *)a4 + 9);
    v27[8] = *((_OWORD *)a4 + 8);
    v27[9] = v20;
    long long v21 = *((_OWORD *)a4 + 11);
    v27[10] = *((_OWORD *)a4 + 10);
    v27[11] = v21;
    long long v22 = *((_OWORD *)a4 + 5);
    v27[4] = *((_OWORD *)a4 + 4);
    v27[5] = v22;
    long long v23 = *((_OWORD *)a4 + 7);
    v27[6] = *((_OWORD *)a4 + 6);
    v27[7] = v23;
    long long v24 = *((_OWORD *)a4 + 1);
    v27[0] = *(_OWORD *)a4;
    v27[1] = v24;
    long long v25 = *((_OWORD *)a4 + 3);
    v27[2] = *((_OWORD *)a4 + 2);
    v27[3] = v25;
    sub_1005633B0((uint64_t)&self->fAnalytics, (uint64_t)v27);
  }
}

- (void)onWatchOrientationSettingsNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [[-[CLNoMovementService universe](self, "universe") silo];
  if (*a3 == 1)
  {
    if (qword_102419340 != -1) {
      dispatch_once(&qword_102419340, &stru_1022F9CC8);
    }
    id v7 = qword_102419348;
    if (os_log_type_enabled((os_log_t)qword_102419348, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[CLNoMovement] service: received wrist-status notification", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419340 != -1) {
        dispatch_once(&qword_102419340, &stru_1022F9CC8);
      }
      __int16 v12 = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNoMovementService onWatchOrientationSettingsNotification:data:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    value = self->fController.__ptr_.__value_;
    if (value)
    {
      long long v9 = *((_OWORD *)a4 + 1);
      v11[0] = *(_OWORD *)a4;
      v11[1] = v9;
      sub_100F847BC((uint64_t)value, (int *)v11);
    }
  }
}

- (void)onDeviceMotionData:(const Sample *)a3
{
  [self universe].silo
  if (self->fController.__ptr_.__value_)
  {
    long long v6 = *(_OWORD *)&a3[1].var1.var2;
    double var0 = a3->var0;
    uint64_t v7 = *(void *)&a3[2].var1.var0;
    double v8 = var0;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    sub_100F849C4((uint64_t)self->fController.__ptr_.__value_, (uint64_t)&v6);
  }
}

- (void)onNoMovementControllerStateUpdate:(id)a3
{
}

- (void)onNoMovementControllerEnablement:(BOOL)a3
{
}

- (void)onNoMovementControllerEpoch:(id)a3 epochValue:(int)a4
{
  sub_100563B54((uint64_t)&self->fAnalytics, a3, a4, v4);
}

- (void)onMobileAssetNotification:(int)a3 data:(uint64_t)a4
{
  [objc_msgSend(a1, "universe") silo];
  if (a3 == 10)
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v16 = 0;
    (*(void (**)(uint64_t, void **))(*(void *)a4 + 800))(a4, __p);
    if (qword_102419340 != -1) {
      dispatch_once(&qword_102419340, &stru_1022F9CC8);
    }
    uint64_t v7 = qword_102419348;
    if (os_log_type_enabled((os_log_t)qword_102419348, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = __p;
      if (v16 < 0) {
        double v8 = (void **)__p[0];
      }
      *(_DWORD *)buf = 136446210;
      long long v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[CLNoMovement] service: received mobile-asset: %{public}s", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419340 != -1) {
        dispatch_once(&qword_102419340, &stru_1022F9CC8);
      }
      uint64_t v11 = __p;
      if (v16 < 0) {
        uint64_t v11 = (void **)__p[0];
      }
      int v17 = 136446210;
      long long v18 = v11;
      __int16 v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNoMovementService onMobileAssetNotification:data:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    if (sub_1000E9358(a4))
    {
      uint64_t v9 = a1[4];
      if (v9)
      {
        sub_1004CE794(v14);
        sub_100F84A54(v9, (uint64_t)v14);
        sub_10013F3C4(v14);
      }
    }
    else
    {
      if (qword_102419340 != -1) {
        dispatch_once(&qword_102419340, &stru_1022F9CC8);
      }
      uint64_t v10 = qword_102419348;
      if (os_log_type_enabled((os_log_t)qword_102419348, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[CLNoMovement] service: failed to convert mobile-asset to dict", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419340 != -1) {
          dispatch_once(&qword_102419340, &stru_1022F9CC8);
        }
        LOWORD(v17) = 0;
        long long v13 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLNoMovementService onMobileAssetNotification:data:]", "%s\n", v13);
        if (v13 != (char *)buf) {
          free(v13);
        }
      }
    }
    if (SHIBYTE(v16) < 0) {
      operator delete(__p[0]);
    }
  }
}

- (NSMutableSet)clientRegistry
{
  return self->_clientRegistry;
}

- (void)setClientRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->fMobileAssetClient.__ptr_.__value_;
  self->fMobileAssetClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  float v4 = self->fController.__ptr_.__value_;
  self->fController.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(CLNoMovementController *, SEL))(*(void *)v4 + 24))(v4, a2);
  }
  int v5 = self->fDeviceMotionDispatcher.__ptr_.__value_;
  self->fDeviceMotionDispatcher.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(void *, SEL))(*(void *)v5 + 8))(v5, a2);
  }
  long long v6 = self->fWatchOrientationSettingsClient.__ptr_.__value_;
  self->fWatchOrientationSettingsClient.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(Client *, SEL))(*(void *)v6 + 8))(v6, a2);
  }
  uint64_t v7 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v7)
  {
    double v8 = *(void (**)(void))(*(void *)v7 + 8);
    v8();
  }
}

- (id).cxx_construct
{
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  self->fWatchOrientationSettingsClient.__ptr_.__value_ = 0;
  self->fDeviceMotionDispatcher.__ptr_.__value_ = 0;
  self->fController.__ptr_.__value_ = 0;
  sub_10056338C((uint64_t)&self->fAnalytics);
  self->fMobileAssetClient.__ptr_.__value_ = 0;
  return self;
}

@end