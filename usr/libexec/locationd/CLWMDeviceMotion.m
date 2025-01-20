@interface CLWMDeviceMotion
- (CLWMDeviceMotion)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)onDeviceMotionData:(const Sample *)a3;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMDeviceMotion

- (CLWMDeviceMotion)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CLWMDeviceMotion;
  result = [(CLWMBase *)&v9 init];
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_rotationRateIntervalSeconds = a5->rotationRateIntervalSeconds;
    result->_sampleCount = 0;
  }
  return result;
}

- (void)setupListener
{
  if (sub_10125D0BC())
  {
    if (!self->_deviceMotionDispatcher.__ptr_.__value_)
    {
      [[CLDeviceMotionProperties alloc] initWithMode:3];
      [(CLWorkoutRecordingDelegate *)self->_delegate silo];
      operator new();
    }
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234BF18);
    }
    v3 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      objc_super v9 = "";
      __int16 v10 = 2082;
      v11 = "assert";
      __int16 v12 = 2081;
      v13 = "!_deviceMotionDispatcher";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of rotation rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234BF18);
      }
    }
    v4 = qword_102419198;
    if (os_signpost_enabled((os_log_t)qword_102419198))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      objc_super v9 = "";
      __int16 v10 = 2082;
      v11 = "assert";
      __int16 v12 = 2081;
      v13 = "!_deviceMotionDispatcher";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of rotation rate listener.", "{\"msg%{public}.0s\":\"Duplicate creation of rotation rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234BF18);
      }
    }
    v5 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      objc_super v9 = "";
      __int16 v10 = 2082;
      v11 = "assert";
      __int16 v12 = 2081;
      v13 = "!_deviceMotionDispatcher";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of rotation rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
    __break(1u);
  }
}

- (void)teardownListeners
{
  if (self->_deviceMotionDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_10125D0BC();
    sub_10125DDA0(v3, (uint64_t)self->_deviceMotionDispatcher.__ptr_.__value_);
    value = self->_deviceMotionDispatcher.__ptr_.__value_;
    self->_deviceMotionDispatcher.__ptr_.__value_ = 0;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8))(value);
    }
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234BF18);
    }
    v5 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Recording rotation rate stopped.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234BF18);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWMDeviceMotion teardownListeners]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (void)onDeviceMotionData:(const Sample *)a3
{
  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((unsigned char *)ptr + 136))
    {
      ++self->_sampleCount;
      sub_10170140C(v13);
      [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
      v15 |= 1u;
      v13[77] = v6;
      sub_101723F18((uint64_t)v13);
      sub_101760640(v14);
      uint64_t v7 = v14;
      uint64_t v8 = *(void *)(v14 + 8);
      double var0 = a3->var0;
      *(unsigned char *)(v8 + 28) |= 1u;
      *(double *)(v8 + 8) = var0;
      uint64_t v10 = *(void *)(v7 + 8);
      LODWORD(var0) = HIDWORD(a3[2].var0);
      *(unsigned char *)(v10 + 28) |= 2u;
      *(_DWORD *)(v10 + 16) = LODWORD(var0);
      uint64_t v11 = *(void *)(v7 + 8);
      *(float *)&double var0 = a3[2].var1.var0;
      *(unsigned char *)(v11 + 28) |= 4u;
      *(_DWORD *)(v11 + 20) = LODWORD(var0);
      uint64_t v12 = *(void *)(v7 + 8);
      *(float *)&double var0 = a3[2].var1.var1;
      *(unsigned char *)(v12 + 28) |= 8u;
      *(_DWORD *)(v12 + 24) = LODWORD(var0);
      sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)v13);
      sub_101706914((PB::Base *)v13);
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
  value = self->_deviceMotionDispatcher.__ptr_.__value_;
  self->_deviceMotionDispatcher.__ptr_.__value_ = 0;
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