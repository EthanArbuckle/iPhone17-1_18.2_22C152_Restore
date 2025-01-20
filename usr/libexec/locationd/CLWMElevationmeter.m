@interface CLWMElevationmeter
- (CLWMElevationmeter)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)onElevationmetryNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMElevationmeter

- (CLWMElevationmeter)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CLWMElevationmeter;
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
  if (!self->_elevationmeterObserverClient.__ptr_.__value_) {
    sub_1004A1714();
  }
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234CEA8);
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
    v11 = "!_elevationmeterObserverClient";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of elevationmeter listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CEA8);
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
    v11 = "!_elevationmeterObserverClient";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of elevationmeter listener.", "{\"msg%{public}.0s\":\"Duplicate creation of elevationmeter listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CEA8);
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
    v11 = "!_elevationmeterObserverClient";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of elevationmeter listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }
  abort_report_np();
}

- (void)teardownListeners
{
  value = self->_elevationmeterObserverClient.__ptr_.__value_;
  self->_elevationmeterObserverClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (void)onElevationmetryNotification:(const int *)a3 data:(const NotificationData *)a4
{
  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((unsigned char *)ptr + 136))
    {
      ++self->_sampleCount;
      sub_10170140C(v17);
      [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
      v19 |= 1u;
      v17[77] = v7;
      sub_101723DF8((uint64_t)v17);
      sub_10175E204(v18);
      uint64_t v8 = v18;
      uint64_t v9 = *(void *)(v18 + 8);
      [(CLWMBase *)self makeSafeCFAbsoluteTime:*((double *)a4 + 1)];
      *(_WORD *)(v9 + 60) |= 1u;
      *(void *)(v9 + 8) = v10;
      uint64_t v11 = *(void *)(v8 + 8);
      int v12 = *((_DWORD *)a4 + 4);
      *(_WORD *)(v11 + 60) |= 0x10u;
      *(_DWORD *)(v11 + 32) = v12;
      uint64_t v13 = *(void *)(v8 + 8);
      int v14 = *((_DWORD *)a4 + 5);
      *(_WORD *)(v13 + 60) |= 0x20u;
      *(_DWORD *)(v13 + 36) = v14;
      uint64_t v15 = *(void *)(v8 + 8);
      int v16 = *((_DWORD *)a4 + 10);
      *(_WORD *)(v15 + 60) |= 0x200u;
      *(_DWORD *)(v15 + 52) = v16;
      sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)v17);
      sub_101706914((PB::Base *)v17);
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
  value = self->_elevationmeterObserverClient.__ptr_.__value_;
  self->_elevationmeterObserverClient.__ptr_.__value_ = 0;
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