@interface CLWMPressure
- (CLWMPressure)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)onPressureData:(const Sample *)a3;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMPressure

- (CLWMPressure)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v13.receiver = self;
  v13.super_class = (Class)CLWMPressure;
  v8 = [(CLWMBase *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_kPressureUpdateInterval = a5->kPressureUpdateInterval;
    uint64_t v10 = rand();
    float v11 = a5->kPrivacyPressureMaxOffset
        * (double)(int)(((unint64_t)((v10 << 32 >> 2) + (int)v10) >> 63)
                      + ((int)((unint64_t)((v10 << 32 >> 2) + (int)v10) >> 32) >> 29));
    v9->_privacyPressureOffset = v11;
    v9->_sampleCount = 0;
  }
  return v9;
}

- (void)setupListener
{
  if (sub_100862C50())
  {
    [(CLWorkoutRecordingDelegate *)self->_delegate silo];
    operator new();
  }
}

- (void)teardownListeners
{
  if (self->_pressureDispatcher.__ptr_.__value_ && sub_100862C50())
  {
    uint64_t v3 = sub_100862C50();
    sub_1009D26C4(v3, 1, (uint64_t)self->_pressureDispatcher.__ptr_.__value_);
    value = self->_pressureDispatcher.__ptr_.__value_;
    self->_pressureDispatcher.__ptr_.__value_ = 0;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8))(value);
    }
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234E4E0);
    }
    v5 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Recording pressure stopped.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234E4E0);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWMPressure teardownListeners]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (void)onPressureData:(const Sample *)a3
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((unsigned char *)ptr + 136) && !self->_disablePressure)
  {
    ++self->_sampleCount;
    sub_10170140C(v12);
    [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
    v14 |= 1u;
    v12[77] = v6;
    sub_101724428((uint64_t)v12);
    sub_10176019C(v13);
    uint64_t v7 = v13;
    uint64_t v8 = *(void *)(v13 + 8);
    double var0 = a3->var0;
    *(unsigned char *)(v8 + 24) |= 1u;
    *(double *)(v8 + 8) = var0;
    uint64_t v10 = *(void *)(v7 + 8);
    *(float *)&double var0 = a3->var1.var0 + self->_privacyPressureOffset;
    *(unsigned char *)(v10 + 24) |= 2u;
    *(_DWORD *)(v10 + 16) = LODWORD(var0);
    uint64_t v11 = *(void *)(v7 + 8);
    *(float *)&double var0 = a3->var1.var1;
    *(unsigned char *)(v11 + 24) |= 4u;
    *(_DWORD *)(v11 + 20) = LODWORD(var0);
    sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)v12);
    sub_101706914((PB::Base *)v12);
  }
}

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
  p_writer = &self->_writer;
  v5 = *(WriterManager **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_writer.__cntrl_;
  p_writer->__ptr_ = v5;
  p_writer->__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
}

- (int)getSampleCount
{
  return self->_sampleCount;
}

- (void).cxx_destruct
{
  cntrl = self->_writer.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  value = self->_pressureDispatcher.__ptr_.__value_;
  self->_pressureDispatcher.__ptr_.__value_ = 0;
  if (value)
  {
    v5 = *(void (**)(void))(*(void *)value + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end