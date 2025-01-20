@interface CLWMFaceCovered
- (CLWMFaceCovered)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)onFaceCovered:(const FaceCovered *)a3;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMFaceCovered

- (CLWMFaceCovered)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CLWMFaceCovered;
  result = [(CLWMBase *)&v8 init];
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_sampleCount = 0;
    result->_inSwimmingWorkout = 0;
  }
  return result;
}

- (void)setupListener
{
}

- (void)teardownListeners
{
  if (self->_faceCoveredDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_1000D2E34(0);
    sub_1009D26C4(v3, 39, (uint64_t)self->_faceCoveredDispatcher.__ptr_.__value_);
    value = self->_faceCoveredDispatcher.__ptr_.__value_;
    self->_faceCoveredDispatcher.__ptr_.__value_ = 0;
    if (value)
    {
      v5 = *(void (**)(void))(*(void *)value + 8);
      v5();
    }
  }
}

- (void)onFaceCovered:(const FaceCovered *)a3
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((unsigned char *)ptr + 136))
  {
    if (self->_inSwimmingWorkout)
    {
      ++self->_sampleCount;
      sub_10170140C(buf);
      [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
      v16 |= 1u;
      uint64_t v14 = v6;
      sub_101726798((uint64_t)buf);
      sub_10175E6A8(v15);
      uint64_t v7 = v15;
      uint64_t v8 = *(void *)(v15 + 8);
      double v9 = (double)a3->var0 / 1000000.0;
      *(unsigned char *)(v8 + 20) |= 1u;
      *(double *)(v8 + 8) = v9;
      uint64_t v10 = *(void *)(v7 + 8);
      LOBYTE(v8) = a3->var1;
      *(unsigned char *)(v10 + 20) |= 2u;
      *(unsigned char *)(v10 + 16) = v8;
      sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)buf);
      sub_101706914((PB::Base *)buf);
    }
    else
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10234CE30);
      }
      v11 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLWMFC,do not write face covered event for non-swimming workout", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10234CE30);
        }
        v12 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWMFaceCovered onFaceCovered:]", "%s\n", v12);
        if (v12 != (char *)buf) {
          free(v12);
        }
      }
    }
  }
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*((void *)a4 + 14) == 19)
  {
    uint64_t v7 = *((void *)a4 + 2);
    if ((unint64_t)(v7 - 1) < 2)
    {
      self->_inSwimmingWorkout = 0;
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10234CE30);
      }
      uint64_t v10 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CLWMFC,swimming workout stopped,timestamp,%f", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 == -1) {
          goto LABEL_22;
        }
        goto LABEL_24;
      }
    }
    else if (v7 == 3 || v7 == 0)
    {
      self->_inSwimmingWorkout = 1;
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10234CE30);
      }
      double v9 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CLWMFC,swimming workout started,timestamp,%f", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 == -1)
        {
LABEL_22:
          CFAbsoluteTimeGetCurrent();
          v11 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWMFaceCovered onMotionStateMediatorNotification:data:]", "%s\n", v11);
          if (v11 != (char *)buf) {
            free(v11);
          }
          return;
        }
LABEL_24:
        dispatch_once(&qword_1024191E0, &stru_10234CE30);
        goto LABEL_22;
      }
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
  value = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  v5 = self->_faceCoveredDispatcher.__ptr_.__value_;
  self->_faceCoveredDispatcher.__ptr_.__value_ = 0;
  if (v5)
  {
    uint64_t v6 = *(void (**)(void))(*(void *)v5 + 8);
    v6();
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end