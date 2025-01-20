@interface CLBarometerCalibrationSourceSurfaceCalibration
- (CLBarometerCalibrationSourceSurfaceCalibration)initWithUniverse:(id)a3 delegate:(id)a4;
- (id).cxx_construct;
- (void)dealloc;
- (void)disableSource;
- (void)enableSource;
- (void)onSurfaceCalibration:(const CMSurfaceCalibrationSample *)a3;
@end

@implementation CLBarometerCalibrationSourceSurfaceCalibration

- (CLBarometerCalibrationSourceSurfaceCalibration)initWithUniverse:(id)a3 delegate:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CLBarometerCalibrationSourceSurfaceCalibration;
  v4 = [(CLBarometerCalibrationSource *)&v6 initWithUniverse:a3 delegate:a4];
  if (v4)
  {
    [(CLIntersiloUniverse *)v4->super._universe silo];
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  value = self->_surfaceCalibrationDispatcher.__ptr_.__value_;
  self->_surfaceCalibrationDispatcher.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void *, SEL))(*(void *)value + 8))(value, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLBarometerCalibrationSourceSurfaceCalibration;
  [(CLBarometerCalibrationSource *)&v4 dealloc];
}

- (void)enableSource
{
  if (!self->super._sourceEnabled)
  {
    if (sub_1000D2E34(0))
    {
      uint64_t v3 = sub_1000D2E34(0);
      sub_1009D1EC4(v3, 38, (uint64_t)self->_surfaceCalibrationDispatcher.__ptr_.__value_, -1.0);
    }
    self->super._sourceEnabled = 1;
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232AB10);
    }
    objc_super v4 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "surface calibration source enabled", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10232AB10);
      }
      v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceSurfaceCalibration enableSource]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
}

- (void)disableSource
{
  if (self->super._sourceEnabled)
  {
    if (sub_1000D2E34(0))
    {
      uint64_t v3 = sub_1000D2E34(0);
      sub_1009D26C4(v3, 38, (uint64_t)self->_surfaceCalibrationDispatcher.__ptr_.__value_);
    }
    self->super._sourceEnabled = 0;
  }
}

- (void)onSurfaceCalibration:(const CMSurfaceCalibrationSample *)a3
{
  v5 = (std::__shared_weak_count *)operator new(0x30uLL);
  v5->__shared_weak_owners_ = 0;
  v5->__shared_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)off_1022DCB58;
  v5[1].__vftable = *(std::__shared_weak_count_vtbl **)&a3->var0;
  v5[1].__shared_weak_owners_ = 1;
  *(double *)&v5[1].__shared_owners_ = a3->var1;
  delegate = self->super._delegate;
  v7 = v5 + 1;
  v8 = v5;
  atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  [(CLBarometerCalibrationSourceClient *)delegate didUpdateSource:7 withData:&v7];
  if (v8) {
    sub_1000DB0A0(v8);
  }
  sub_1000DB0A0(v5);
}

- (void).cxx_destruct
{
  value = self->_surfaceCalibrationDispatcher.__ptr_.__value_;
  self->_surfaceCalibrationDispatcher.__ptr_.__value_ = 0;
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