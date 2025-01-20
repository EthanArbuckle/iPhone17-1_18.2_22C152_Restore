@interface CLDMVisionService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)valid;
- (CLDMVisionService)init;
- (CLVisionNotifierServiceProtocol)visionNotificationProxy;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)handleARSessionState:(unint64_t)a3 fromClient:(id)a4;
- (void)handleDeviceMotionData:(const Sample *)a3;
- (void)handleGeomagneticModelData:(id *)a3;
- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4;
- (void)setValid:(BOOL)a3;
- (void)setVisionNotificationProxy:(id)a3;
@end

@implementation CLDMVisionService

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
  if (qword_1024812E0 != -1) {
    dispatch_once(&qword_1024812E0, &stru_1022F5DD0);
  }
  return (id)qword_1024812D8;
}

+ (BOOL)isSupported
{
  if (qword_1024812F0 != -1) {
    dispatch_once(&qword_1024812F0, &stru_1022F5DF0);
  }
  return byte_1024812E8;
}

- (CLDMVisionService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLDMVisionService;
  result = [(CLDMVisionService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLDMVisionServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLDMVisionServiceClientProtocol];
  if (result) {
    result->fDeclination = 0.0;
  }
  return result;
}

- (void)beginService
{
  [(CLDMVisionService *)self setValid:1];
  -[CLDMVisionService setVisionNotificationProxy:](self, "setVisionNotificationProxy:", [objc_msgSend(-[CLDMVisionService universe](self, "universe"), "vendor") proxyForService:@"CLVisionNotifier"]);
  -[CLVisionNotifierServiceProtocol registerDelegate:inSilo:](-[CLDMVisionService visionNotificationProxy](self, "visionNotificationProxy"), "registerDelegate:inSilo:", self, [-[CLDMVisionService universe](self, "universe") silo]);
  objc_super v3 = [(CLDMVisionService *)self visionNotificationProxy];

  [(CLVisionNotifierServiceProtocol *)v3 registerForVisionNotifications:self];
}

- (void)endService
{
  objc_super v3 = [(CLDMVisionService *)self visionNotificationProxy];

  [(CLVisionNotifierServiceProtocol *)v3 deregisterForVisionNotifications:self];
}

- (void)handleDeviceMotionData:(const Sample *)a3
{
  uint64_t v4 = (unint64_t)(a3->var0 * 1000000.0);
  float var1 = a3[2].var1.var1;
  uint64_t v8 = *(void *)((char *)&a3[2].var0 + 4);
  float v9 = var1;
  int8x16_t v6 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->var1.var0), *(float64x2_t *)&a3[1].var0);
  float32x4_t v7 = (float32x4_t)vextq_s8(v6, v6, 4uLL);
  sub_100B9BEAC(&v7, v7);
  sub_100E6EFD0((uint64_t)&self->fVisualLocalizationPropagation, (uint64_t)&v8, (__n128 *)&v7, v4);
}

- (void)handleGeomagneticModelData:(id *)a3
{
  if (qword_102419080 != -1) {
    dispatch_once(&qword_102419080, &stru_1022F5E10);
  }
  unint64_t v5 = qword_102419088;
  if (os_log_type_enabled((os_log_t)qword_102419088, OS_LOG_TYPE_DEBUG))
  {
    double var5 = a3->var5;
    *(_DWORD *)buf = 134217984;
    double v9 = var5;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "visual localization,handleGeomagneticModelData, data.declination,%f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419080 != -1) {
      dispatch_once(&qword_102419080, &stru_1022F5E10);
    }
    float32x4_t v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDMVisionService handleGeomagneticModelData:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  self->fDeclination = a3->var5;
}

- (void)handleARSessionState:(unint64_t)a3 fromClient:(id)a4
{
  if (qword_102419080 != -1) {
    dispatch_once(&qword_102419080, &stru_1022F5E10);
  }
  int8x16_t v6 = qword_102419088;
  if (os_log_type_enabled((os_log_t)qword_102419088, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "visual localization,handleARSessionState, sessionState,%lu", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419080 != -1) {
      dispatch_once(&qword_102419080, &stru_1022F5E10);
    }
    v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDMVisionService handleARSessionState:fromClient:]", "%s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
  value = self->fDeviceMotionDispatcher.__ptr_.__value_;
  if (a3 == 1)
  {
    if (!value)
    {
      if (qword_102419080 != -1) {
        dispatch_once(&qword_102419080, &stru_1022F5E10);
      }
      uint64_t v8 = qword_102419088;
      if (os_log_type_enabled((os_log_t)qword_102419088, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "visual localization,handleARSessionState, initializeVlfPropagation", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419080 != -1) {
          dispatch_once(&qword_102419080, &stru_1022F5E10);
        }
        v17 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDMVisionService handleARSessionState:fromClient:]", "%s\n", v17);
        if (v17 != (char *)buf) {
          free(v17);
        }
      }
      double v9 = [[CLDeviceMotionProperties alloc] initWithMode:3];
      [self.universe silo];
      operator new();
    }
  }
  else if (value)
  {
    if (qword_102419080 != -1) {
      dispatch_once(&qword_102419080, &stru_1022F5E10);
    }
    v10 = qword_102419088;
    if (os_log_type_enabled((os_log_t)qword_102419088, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "visual localization,handleARSessionState, stopVlfPropagation", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419080 != -1) {
        dispatch_once(&qword_102419080, &stru_1022F5E10);
      }
      v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDMVisionService handleARSessionState:fromClient:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
    uint64_t v11 = sub_10125D0BC();
    sub_1009D26C4(v11, 1, (uint64_t)self->fDeviceMotionDispatcher.__ptr_.__value_);
    v12 = self->fDeviceMotionDispatcher.__ptr_.__value_;
    self->fDeviceMotionDispatcher.__ptr_.__value_ = 0;
    if (v12) {
      (*(void (**)(Dispatcher *))(*(void *)v12 + 8))(v12);
    }
    p_fGeomagneticModelProviderClient = &self->fGeomagneticModelProviderClient;
    [*((id *)p_fGeomagneticModelProviderClient->__ptr_.__value_ + 2) unregister:*((void *)p_fGeomagneticModelProviderClient->__ptr_.__value_ + 1) forNotification:0];
    v14 = p_fGeomagneticModelProviderClient->__ptr_.__value_;
    p_fGeomagneticModelProviderClient->__ptr_.__value_ = 0;
    if (v14) {
      (*(void (**)(Client *))(*(void *)v14 + 8))(v14);
    }
  }
}

- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4
{
  if (qword_102419080 != -1) {
    dispatch_once(&qword_102419080, &stru_1022F5E10);
  }
  int8x16_t v6 = qword_102419088;
  if (os_log_type_enabled((os_log_t)qword_102419088, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    double v19 = *(double *)&a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "visual localization,handleVLLocalizationResult, localizationResult,%@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419080 != -1) {
      dispatch_once(&qword_102419080, &stru_1022F5E10);
    }
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDMVisionService handleVLLocalizationResult:fromClient:]", "%s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  float fDeclination = self->fDeclination;
  if (sub_100E6F074((uint64_t)&self->fVisualLocalizationPropagation, a3, fDeclination))
  {
    float v8 = self->fVisualLocalizationPropagation.fAttitudePropagated.elements[0];
    float v15 = self->fVisualLocalizationPropagation.fAttitudePropagated.elements[1];
    float v16 = self->fVisualLocalizationPropagation.fAttitudePropagated.elements[2];
    float v17 = self->fVisualLocalizationPropagation.fAttitudePropagated.elements[3];
    [a3 timestamp];
    uint64_t v9 = sub_1000D2E34(0);
    (*(void (**)(void))(*(void *)(v9 + 104) + 16))();
    if (qword_102419080 != -1) {
      dispatch_once(&qword_102419080, &stru_1022F5E10);
    }
    v10 = qword_102419088;
    if (os_log_type_enabled((os_log_t)qword_102419088, OS_LOG_TYPE_INFO))
    {
      double v11 = self->fDeclination;
      [a3 timestamp];
      *(_DWORD *)buf = 134219264;
      double v19 = v8;
      __int16 v20 = 2048;
      double v21 = v15;
      __int16 v22 = 2048;
      double v23 = v16;
      __int16 v24 = 2048;
      double v25 = v17;
      __int16 v26 = 2048;
      double v27 = v11;
      __int16 v28 = 2048;
      uint64_t v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "visual localization,handleVLLocalizationResult, sendPropagatedVLLocalizationResultFromClient,qTotal,%f,%f,%f,%f,declination,%f,timestamp,%f", buf, 0x3Eu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419080 != -1) {
        dispatch_once(&qword_102419080, &stru_1022F5E10);
      }
      [a3 timestamp];
      v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDMVisionService handleVLLocalizationResult:fromClient:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
  }
}

- (BOOL)valid
{
  return self->valid_;
}

- (void)setValid:(BOOL)a3
{
  self->valid_ = a3;
}

- (CLVisionNotifierServiceProtocol)visionNotificationProxy
{
  return self->_visionNotificationProxy;
}

- (void)setVisionNotificationProxy:(id)a3
{
}

- (void).cxx_destruct
{
  self->fVisualLocalizationPropagation._vptr$CLVisualLocalizationPropagation = (void **)off_1022F5E40;
  value = self->fGeomagneticModelProviderClient.__ptr_.__value_;
  self->fGeomagneticModelProviderClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  uint64_t v4 = self->fDeviceMotionDispatcher.__ptr_.__value_;
  self->fDeviceMotionDispatcher.__ptr_.__value_ = 0;
  if (v4)
  {
    unint64_t v5 = *(void (**)(void))(*(void *)v4 + 8);
    v5();
  }
}

- (id).cxx_construct
{
  self->fDeviceMotionDispatcher.__ptr_.__value_ = 0;
  self->fGeomagneticModelProviderClient.__ptr_.__value_ = 0;
  sub_100E6EF74((uint64_t)&self->fVisualLocalizationPropagation);
  return self;
}

@end