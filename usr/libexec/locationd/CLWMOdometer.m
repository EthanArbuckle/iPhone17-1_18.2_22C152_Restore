@interface CLWMOdometer
- (CLWMOdometer)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (double)makeSafeAbsoluteElevation:(double)a3;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)onOdometerNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMOdometer

- (CLWMOdometer)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CLWMOdometer;
  result = [(CLWMBase *)&v9 init];
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_disablePrivacyElevationOffset = a5->disablePrivacyElevationOffset;
    result->_disableForceActiveListeners = a5->disableForceActiveListeners;
    result->_sampleCount = 0;
  }
  return result;
}

- (void)setupListener
{
  if (!self->_odometerObserverClient.__ptr_.__value_) {
    sub_1004A1714();
  }
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D658);
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
    v11 = "!_odometerObserverClient";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of odometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D658);
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
    v11 = "!_odometerObserverClient";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of odometer listener.", "{\"msg%{public}.0s\":\"Duplicate creation of odometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D658);
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
    v11 = "!_odometerObserverClient";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of odometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }
  abort_report_np();
}

- (void)teardownListeners
{
  value = self->_odometerObserverClient.__ptr_.__value_;
  self->_odometerObserverClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (void)onOdometerNotification:(const int *)a3 data:(const NotificationData *)a4
{
  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((unsigned char *)ptr + 136))
    {
      ++self->_sampleCount;
      sub_10170140C(v44);
      [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
      v46 |= 1u;
      v44[77] = v7;
      sub_101723FA8((uint64_t)v44);
      sub_10175FCF8(v45);
      uint64_t v8 = v45;
      sub_10177E2D0(*(void *)(v45 + 8));
      uint64_t v9 = *(void *)(v8 + 8);
      uint64_t v10 = *(void *)(v9 + 72);
      [(CLWMBase *)self makeSafeCFAbsoluteTime:*(double *)a4];
      *(_WORD *)(v10 + 100) |= 0x80u;
      *(void *)(v10 + 64) = v11;
      uint64_t v12 = *(void *)(v9 + 72);
      uint64_t v13 = *((void *)a4 + 1);
      *(_WORD *)(v12 + 100) |= 2u;
      *(void *)(v12 + 16) = v13;
      uint64_t v14 = *(void *)(v9 + 72);
      uint64_t v15 = *((void *)a4 + 2);
      *(_WORD *)(v14 + 100) |= 1u;
      *(void *)(v14 + 8) = v15;
      uint64_t v16 = *(void *)(v9 + 72);
      [(CLWMOdometer *)self makeSafeAbsoluteElevation:*((double *)a4 + 3)];
      *(_WORD *)(v16 + 100) |= 4u;
      *(void *)(v16 + 24) = v17;
      uint64_t v18 = *(void *)(v9 + 72);
      uint64_t v19 = *((void *)a4 + 4);
      *(_WORD *)(v18 + 100) |= 0x40u;
      *(void *)(v18 + 56) = v19;
      uint64_t v20 = *(void *)(v9 + 72);
      uint64_t v21 = *((void *)a4 + 5);
      *(_WORD *)(v20 + 100) |= 0x20u;
      *(void *)(v20 + 48) = v21;
      uint64_t v22 = *(void *)(v9 + 72);
      uint64_t v23 = *((void *)a4 + 6);
      *(_WORD *)(v22 + 100) |= 0x10u;
      *(void *)(v22 + 40) = v23;
      uint64_t v24 = *(void *)(v9 + 72);
      uint64_t v25 = *((void *)a4 + 7);
      *(_WORD *)(v24 + 100) |= 8u;
      *(void *)(v24 + 32) = v25;
      uint64_t v26 = *(void *)(v9 + 72);
      [(CLWMBase *)self makeSafeCFAbsoluteTime:*((double *)a4 + 8)];
      *(_WORD *)(v26 + 100) |= 0x100u;
      *(void *)(v26 + 72) = v27;
      uint64_t v28 = *(void *)(v9 + 72);
      int v29 = *((_DWORD *)a4 + 21);
      *(_WORD *)(v28 + 100) |= 0x400u;
      *(_DWORD *)(v28 + 84) = v29;
      uint64_t v30 = *(void *)(v9 + 72);
      int v31 = *((_DWORD *)a4 + 20);
      *(_WORD *)(v30 + 100) |= 0x800u;
      *(_DWORD *)(v30 + 88) = v31;
      uint64_t v32 = *(void *)(v8 + 8);
      [(CLWMOdometer *)self makeSafeAbsoluteElevation:*((double *)a4 + 12)];
      *(unsigned char *)(v32 + 80) |= 4u;
      *(void *)(v32 + 24) = v33;
      uint64_t v34 = *(void *)(v8 + 8);
      uint64_t v35 = *((void *)a4 + 13);
      *(unsigned char *)(v34 + 80) |= 8u;
      *(void *)(v34 + 32) = v35;
      uint64_t v36 = *(void *)(v8 + 8);
      [(CLWMOdometer *)self makeSafeAbsoluteElevation:*((double *)a4 + 14)];
      *(unsigned char *)(v36 + 80) |= 0x40u;
      *(void *)(v36 + 56) = v37;
      uint64_t v38 = *(void *)(v8 + 8);
      uint64_t v39 = *((void *)a4 + 15);
      *(unsigned char *)(v38 + 80) |= 0x80u;
      *(void *)(v38 + 64) = v39;
      uint64_t v40 = *(void *)(v8 + 8);
      uint64_t v41 = *((void *)a4 + 16);
      *(unsigned char *)(v40 + 80) |= 2u;
      *(void *)(v40 + 16) = v41;
      uint64_t v42 = *(void *)(v8 + 8);
      uint64_t v43 = *((void *)a4 + 17);
      *(unsigned char *)(v42 + 80) |= 1u;
      *(void *)(v42 + 8) = v43;
      sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)v44);
      sub_101706914((PB::Base *)v44);
    }
  }
}

- (double)makeSafeAbsoluteElevation:(double)a3
{
  if (a3 != 0.0 && self->_privacyElevationOffset == 0.0 && !self->_disablePrivacyElevationOffset)
  {
    self->_double privacyElevationOffset = a3;
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D658);
    }
    v5 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      double privacyElevationOffset = self->_privacyElevationOffset;
      *(_DWORD *)buf = 134283521;
      double v10 = privacyElevationOffset;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Offsetting elevation by %{private}f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D658);
      }
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWMOdometer makeSafeAbsoluteElevation:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
  return a3 - self->_privacyElevationOffset;
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
  value = self->_odometerObserverClient.__ptr_.__value_;
  self->_odometerObserverClient.__ptr_.__value_ = 0;
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