@interface CLWMMagnetometer
- (CLWMMagnetometer)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (id)metadata;
- (int)getSampleCount;
- (void)onMagnetometerData:(const Sample *)a3;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMMagnetometer

- (CLWMMagnetometer)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CLWMMagnetometer;
  result = [(CLWMBase *)&v9 init];
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_magIntervalSeconds = a5->magIntervalSeconds;
    result->_sampleCount = 0;
  }
  return result;
}

- (void)setupListener
{
  if (sub_100B0AEC4())
  {
    if (!self->_magnetometerDispatcher.__ptr_.__value_)
    {
      [(CLWorkoutRecordingDelegate *)self->_delegate silo];
      operator new();
    }
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234E828);
    }
    v3 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_FAULT))
    {
      uint64_t aBlock = 68289539;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "!_magnetometerDispatcher";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of magnetometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&aBlock, 0x26u);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234E828);
      }
    }
    v4 = qword_102419198;
    if (os_signpost_enabled((os_log_t)qword_102419198))
    {
      uint64_t aBlock = 68289539;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "!_magnetometerDispatcher";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of magnetometer listener.", "{\"msg%{public}.0s\":\"Duplicate creation of magnetometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&aBlock, 0x26u);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234E828);
      }
    }
    v5 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_INFO))
    {
      uint64_t aBlock = 68289539;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "!_magnetometerDispatcher";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of magnetometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&aBlock, 0x26u);
    }
    abort_report_np();
    __break(1u);
  }
}

- (void)teardownListeners
{
  if (self->_magnetometerDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_100B0AEC4();
    sub_1009D26C4(v3, 0, (uint64_t)self->_magnetometerDispatcher.__ptr_.__value_);
    value = self->_magnetometerDispatcher.__ptr_.__value_;
    self->_magnetometerDispatcher.__ptr_.__value_ = 0;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8))(value);
    }
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234E828);
    }
    v5 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Recording magnetometer stopped.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234E828);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWMMagnetometer teardownListeners]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (id)metadata
{
  return 0;
}

- (void)onMagnetometerData:(const Sample *)a3
{
  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((unsigned char *)ptr + 136))
    {
      ++self->_sampleCount;
      sub_10170140C(v14);
      [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
      v16 |= 1u;
      v14[77] = v6;
      sub_101724E48((uint64_t)v14);
      sub_1016BD1E4(v15);
      uint64_t v7 = v15;
      uint64_t v8 = *(void *)(v15 + 8);
      double var0 = a3->var0;
      *(unsigned char *)(v8 + 36) |= 1u;
      *(double *)(v8 + 8) = var0;
      uint64_t v10 = *(void *)(v7 + 8);
      *(float *)&double var0 = a3->var1.var0;
      *(unsigned char *)(v10 + 36) |= 8u;
      *(_DWORD *)(v10 + 24) = LODWORD(var0);
      uint64_t v11 = *(void *)(v7 + 8);
      *(float *)&double var0 = a3->var1.var1;
      *(unsigned char *)(v11 + 36) |= 0x10u;
      *(_DWORD *)(v11 + 28) = LODWORD(var0);
      uint64_t v12 = *(void *)(v7 + 8);
      *(float *)&double var0 = a3->var1.var2;
      *(unsigned char *)(v12 + 36) |= 0x20u;
      *(_DWORD *)(v12 + 32) = LODWORD(var0);
      uint64_t v13 = *(void *)(v7 + 8);
      *(float *)&double var0 = a3->var2;
      *(unsigned char *)(v13 + 36) |= 4u;
      *(_DWORD *)(v13 + 20) = LODWORD(var0);
      sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)v14);
      sub_101706914((PB::Base *)v14);
    }
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
  value = self->_magnetometerDispatcher.__ptr_.__value_;
  self->_magnetometerDispatcher.__ptr_.__value_ = 0;
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