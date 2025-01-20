@interface CLWMHeartRate
- (CLWMHeartRate)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)onHeartRateNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMHeartRate

- (CLWMHeartRate)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CLWMHeartRate;
  result = [(CLWMBase *)&v9 init];
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_disableForceActiveListeners = a5->disableForceActiveListeners;
    result->_sampleCount = 0;
  }
  return result;
}

- (void)setupListener
{
  if (!self->_heartRateObserverClient.__ptr_.__value_) {
    sub_100A1F244();
  }
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234E478);
  }
  v2 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    __int16 v6 = 2082;
    v7 = "";
    __int16 v8 = 2082;
    objc_super v9 = "assert";
    __int16 v10 = 2081;
    v11 = "!_heartRateObserverClient";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of heart rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234E478);
    }
  }
  v3 = qword_102419198;
  if (os_signpost_enabled((os_log_t)qword_102419198))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    __int16 v6 = 2082;
    v7 = "";
    __int16 v8 = 2082;
    objc_super v9 = "assert";
    __int16 v10 = 2081;
    v11 = "!_heartRateObserverClient";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of heart rate listener.", "{\"msg%{public}.0s\":\"Duplicate creation of heart rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234E478);
    }
  }
  v4 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    __int16 v6 = 2082;
    v7 = "";
    __int16 v8 = 2082;
    objc_super v9 = "assert";
    __int16 v10 = 2081;
    v11 = "!_heartRateObserverClient";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of heart rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }
  abort_report_np();
}

- (void)teardownListeners
{
  value = self->_heartRateObserverClient.__ptr_.__value_;
  self->_heartRateObserverClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (void)onHeartRateNotification:(const int *)a3 data:(const NotificationData *)a4
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((unsigned char *)ptr + 136))
  {
    ++self->_sampleCount;
    if ((*a3 & 0xFFFFFFFE) == 4)
    {
      sub_10170140C(v22);
      [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
      v24 |= 1u;
      v22[77] = v7;
      sub_101723E88((uint64_t)v22);
      sub_10173E6B0(v23);
      uint64_t v8 = v23;
      uint64_t v9 = *(void *)(v23 + 8);
      int v10 = *(_DWORD *)a4;
      *(_WORD *)(v9 + 68) |= 0x40u;
      *(_DWORD *)(v9 + 52) = v10;
      uint64_t v11 = *(void *)(v8 + 8);
      uint64_t v12 = *((void *)a4 + 1);
      *(_WORD *)(v11 + 68) |= 2u;
      *(void *)(v11 + 16) = v12;
      uint64_t v13 = *(void *)(v8 + 8);
      uint64_t v14 = *((void *)a4 + 2);
      *(_WORD *)(v13 + 68) |= 1u;
      *(void *)(v13 + 8) = v14;
      uint64_t v15 = *(void *)(v8 + 8);
      LOBYTE(v10) = *((unsigned char *)a4 + 24);
      *(_WORD *)(v15 + 68) |= 0x200u;
      *(unsigned char *)(v15 + 64) = v10;
      uint64_t v16 = *(void *)(v8 + 8);
      uint64_t v17 = *((void *)a4 + 4);
      *(_WORD *)(v16 + 68) |= 0x10u;
      *(void *)(v16 + 40) = v17;
      uint64_t v18 = *(void *)(v8 + 8);
      [(CLWMBase *)self makeSafeCFAbsoluteTime:*((double *)a4 + 5)];
      *(_WORD *)(v18 + 68) |= 8u;
      *(void *)(v18 + 32) = v19;
      uint64_t v20 = *(void *)(v8 + 8);
      int v21 = *((_DWORD *)a4 + 14);
      *(_WORD *)(v20 + 68) |= 0x20u;
      *(_DWORD *)(v20 + 48) = v21;
      sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)v22);
      sub_101706914((PB::Base *)v22);
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
  value = self->_heartRateObserverClient.__ptr_.__value_;
  self->_heartRateObserverClient.__ptr_.__value_ = 0;
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