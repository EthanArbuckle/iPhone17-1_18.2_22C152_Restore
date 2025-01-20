@interface CLBarometerCalibrationSourceCompanion
- (CLBarometerCalibrationSourceCompanion)initWithUniverse:(id)a3 delegate:(id)a4;
- (id).cxx_construct;
- (void)disableSource;
- (void)enableSource;
- (void)onCompanionNotification:(int)a3 data:(NotificationData *)a4;
@end

@implementation CLBarometerCalibrationSourceCompanion

- (CLBarometerCalibrationSourceCompanion)initWithUniverse:(id)a3 delegate:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CLBarometerCalibrationSourceCompanion;
  if ([(CLBarometerCalibrationSource *)&v5 initWithUniverse:a3 delegate:a4]) {
    sub_1000B2C0C();
  }
  return 0;
}

- (void)enableSource
{
  if (!self->super._sourceEnabled)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022B9628);
    }
    v3 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Enabling companion data source", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022B9628);
      }
      v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceCompanion enableSource]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
    [*((id *)self->fCompanionClient.__ptr_.__value_ + 2) register:*((void *)self->fCompanionClient.__ptr_.__value_ + 1) forNotification:11 registrationInfo:0];
    [*((id *)self->fCompanionClient.__ptr_.__value_ + 2) register:*((void *)self->fCompanionClient.__ptr_.__value_ + 1) forNotification:12 registrationInfo:0];
    self->super._sourceEnabled = 1;
  }
}

- (void)disableSource
{
  if (self->super._sourceEnabled)
  {
    [*((id *)self->fCompanionClient.__ptr_.__value_ + 2) unregister:*((void *)self->fCompanionClient.__ptr_.__value_ + 1) forNotification:11];
    [*((id *)self->fCompanionClient.__ptr_.__value_ + 2) unregister:*((void *)self->fCompanionClient.__ptr_.__value_ + 1) forNotification:12];
    self->super._sourceEnabled = 0;
  }
}

- (void)onCompanionNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 12)
  {
    v6 = (char *)operator new(0x30uLL);
    *((void *)v6 + 1) = 0;
    *(void *)v6 = off_1022B96A8;
    *(int8x16_t *)(v6 + 24) = vextq_s8(*(int8x16_t *)a4, *(int8x16_t *)a4, 8uLL);
    *((void *)v6 + 2) = 0;
    *((void *)v6 + 5) = *((void *)a4 + 2);
    delegate = self->super._delegate;
    v10 = v6 + 24;
    v11 = (std::__shared_weak_count *)v6;
    atomic_fetch_add_explicit((atomic_ullong *volatile)v6 + 1, 1uLL, memory_order_relaxed);
    [(CLBarometerCalibrationSourceClient *)delegate didUpdateSource:9 withData:&v10];
    v8 = v11;
    if (!v11) {
      goto LABEL_7;
    }
LABEL_6:
    sub_1000DB0A0(v8);
    goto LABEL_7;
  }
  if (a3 != 11) {
    return;
  }
  v6 = (char *)operator new(0x30uLL);
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = 0;
  *(void *)v6 = off_1022B9658;
  *(int64x2_t *)(v6 + 24) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *((void *)v6 + 5) = 0x7FEFFFFFFFFFFFFFLL;
  *((CFAbsoluteTime *)v6 + 3) = CFAbsoluteTimeGetCurrent();
  v7 = self->super._delegate;
  *((_OWORD *)v6 + 2) = *(_OWORD *)a4;
  v12 = v6 + 24;
  v13 = (std::__shared_weak_count *)v6;
  atomic_fetch_add_explicit((atomic_ullong *volatile)v6 + 1, 1uLL, memory_order_relaxed);
  [(CLBarometerCalibrationSourceClient *)v7 didUpdateSource:4 withData:&v12];
  v8 = v13;
  if (v13) {
    goto LABEL_6;
  }
LABEL_7:
  sub_1000DB0A0((std::__shared_weak_count *)v6);
}

- (void).cxx_destruct
{
  value = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

@end