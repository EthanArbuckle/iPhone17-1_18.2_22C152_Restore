@interface CLBarometerCalibrationSourcePressure
- (CLBarometerCalibrationSourcePressure)initWithUniverse:(id)a3 delegate:(id)a4;
- (id).cxx_construct;
- (void)dealloc;
- (void)disableSource;
- (void)enableSource;
- (void)onKFFilteredPressure:(const CMKFFilteredPressureSample *)a3;
@end

@implementation CLBarometerCalibrationSourcePressure

- (void)onKFFilteredPressure:(const CMKFFilteredPressureSample *)a3
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10232E840);
  }
  v6 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    double var1 = a3->var1;
    double var0 = a3->var0;
    double var5 = a3->var5;
    double var3 = a3->var3;
    double var2 = a3->var2;
    double var6 = a3->var6;
    double var4 = a3->var4;
    *(_DWORD *)buf = 134219776;
    CFAbsoluteTime v50 = Current;
    __int16 v51 = 2048;
    double v52 = var1;
    __int16 v53 = 2048;
    double v54 = var0;
    __int16 v55 = 2048;
    double v56 = var5;
    __int16 v57 = 2048;
    double v58 = var3;
    __int16 v59 = 2048;
    double v60 = var2;
    __int16 v61 = 2048;
    double v62 = var6;
    __int16 v63 = 2048;
    double v64 = var4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "received KF filtered pressure from AOP,now,%f,filteredPressureTimestamp,%f,filteredPressure,%f,kfTimestamp,%f,kfElevation,%f,kfPressure,%f temperature,%f,absAltUnc,%f", buf, 0x52u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10232E840);
    }
    double v21 = a3->var1;
    double v22 = a3->var0;
    double v23 = a3->var5;
    double v24 = a3->var3;
    double v25 = a3->var2;
    double v26 = a3->var6;
    double v27 = a3->var4;
    int v33 = 134219776;
    CFAbsoluteTime v34 = Current;
    __int16 v35 = 2048;
    double v36 = v21;
    __int16 v37 = 2048;
    double v38 = v22;
    __int16 v39 = 2048;
    double v40 = v23;
    __int16 v41 = 2048;
    double v42 = v24;
    __int16 v43 = 2048;
    double v44 = v25;
    __int16 v45 = 2048;
    double v46 = v26;
    __int16 v47 = 2048;
    double v48 = v27;
    v28 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourcePressure onKFFilteredPressure:]", "%s\n", v28);
    if (v28 != (char *)buf) {
      free(v28);
    }
  }
  double v14 = a3->var1;
  if (vabdd_f64(v14, self->_lastPressureBufferTimestamp) > 0.833333333)
  {
    self->_lastPressureBufferTimestamp = v14;
    v15 = (char *)operator new(0x38uLL);
    *((void *)v15 + 2) = 0;
    *((void *)v15 + 1) = 0;
    *(void *)v15 = off_10231B4E8;
    *((void *)v15 + 3) = *(void *)&a3->var1;
    *((double *)v15 + 4) = (float)(a3->var0 / 1000.0);
    *(float64x2_t *)(v15 + 40) = vcvtq_f64_f32(*(float32x2_t *)&a3->var6);
    delegate = self->super._delegate;
    v31 = v15 + 24;
    v32 = (std::__shared_weak_count *)v15;
    atomic_fetch_add_explicit((atomic_ullong *volatile)v15 + 1, 1uLL, memory_order_relaxed);
    [(CLBarometerCalibrationSourceClient *)delegate didUpdateSource:1 withData:&v31];
    if (v32) {
      sub_1000DB0A0(v32);
    }
    sub_1000DB0A0((std::__shared_weak_count *)v15);
  }
  v17 = (std::__shared_weak_count *)operator new(0x38uLL);
  v17[1].__vftable = *(std::__shared_weak_count_vtbl **)&a3->var5;
  float v18 = a3->var3;
  float v19 = a3->var2 / 1000.0;
  v17->__shared_weak_owners_ = 0;
  v17->__shared_owners_ = 0;
  v17->__vftable = (std::__shared_weak_count_vtbl *)off_10231B538;
  *(double *)&v17[1].__shared_owners_ = v18;
  *(double *)&v17[1].__shared_weak_owners_ = v19;
  *(double *)&v17[2].__vftable = a3->var4;
  v20 = self->super._delegate;
  v29 = v17 + 1;
  v30 = v17;
  atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  [(CLBarometerCalibrationSourceClient *)v20 didUpdateSource:5 withData:&v29];
  if (v30) {
    sub_1000DB0A0(v30);
  }
  sub_1000DB0A0(v17);
}

- (CLBarometerCalibrationSourcePressure)initWithUniverse:(id)a3 delegate:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CLBarometerCalibrationSourcePressure;
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
  value = self->_kfFilteredPressureDispatcher.__ptr_.__value_;
  self->_kfFilteredPressureDispatcher.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void *, SEL))(*(void *)value + 8))(value, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLBarometerCalibrationSourcePressure;
  [(CLBarometerCalibrationSource *)&v4 dealloc];
}

- (void)enableSource
{
  if (!self->super._sourceEnabled)
  {
    if (sub_1000D2E34(0))
    {
      uint64_t v3 = sub_1000D2E34(0);
      sub_1009D1EC4(v3, 30, (uint64_t)self->_kfFilteredPressureDispatcher.__ptr_.__value_, -1.0);
    }
    self->super._sourceEnabled = 1;
  }
}

- (void)disableSource
{
  if (self->super._sourceEnabled)
  {
    if (sub_1000D2E34(0))
    {
      uint64_t v3 = sub_1000D2E34(0);
      sub_1009D26C4(v3, 30, (uint64_t)self->_kfFilteredPressureDispatcher.__ptr_.__value_);
    }
    self->super._sourceEnabled = 0;
  }
}

- (void).cxx_destruct
{
  value = self->_kfFilteredPressureDispatcher.__ptr_.__value_;
  self->_kfFilteredPressureDispatcher.__ptr_.__value_ = 0;
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