@interface CLWMCalorimetry
- (CLWMCalorimetry)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (id)metadata;
- (int)getSampleCount;
- (void)dealloc;
- (void)onCalorimetryNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)resetBodyMetrics;
- (void)setWorkoutRecording:(id)a3;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
- (void)writeBodyMetrics;
@end

@implementation CLWMCalorimetry

- (void)setWorkoutRecording:(id)a3
{
  self->_workoutRecording = (CLWorkoutRecording *)a3;
}

- (CLWMCalorimetry)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CLWMCalorimetry;
  v8 = [(CLWMBase *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_metadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->_disableBodyMetrics = a5->disableBodyMetrics;
    v9->_disableMeanMaxMets = a5->disableMeanMaxMets;
    v9->_sampleCount = 0;
  }
  return v9;
}

- (void)setupListener
{
  if (!self->_calorimetryClient.__ptr_.__value_) {
    sub_1012A0598();
  }
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D678);
  }
  v2 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    __int16 v6 = 2082;
    v7 = "";
    __int16 v8 = 2082;
    v9 = "assert";
    __int16 v10 = 2081;
    objc_super v11 = "!_calorimetryClient";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of calorimetry listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D678);
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
    v9 = "assert";
    __int16 v10 = 2081;
    objc_super v11 = "!_calorimetryClient";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of calorimetry listener.", "{\"msg%{public}.0s\":\"Duplicate creation of calorimetry listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D678);
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
    v9 = "assert";
    __int16 v10 = 2081;
    objc_super v11 = "!_calorimetryClient";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of calorimetry listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }
  abort_report_np();
}

- (void)teardownListeners
{
  [(CLWMCalorimetry *)self writeBodyMetrics];
  value = self->_calorimetryClient.__ptr_.__value_;
  self->_calorimetryClient.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

- (void)dealloc
{
  self->_metadata = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWMCalorimetry;
  [(CLWMBase *)&v3 dealloc];
}

- (id)metadata
{
  id v2 = [(NSMutableDictionary *)self->_metadata copy];

  return v2;
}

- (void)onCalorimetryNotification:(const int *)a3 data:(const NotificationData *)a4
{
  ++self->_sampleCount;
  int v6 = *a3;
  if (*a3 != 2)
  {
LABEL_4:
    if (v6 == 8)
    {
      metadata = self->_metadata;
      uint64_t v9 = sub_100103240();
      sub_10073B1A4(v9, (uint64_t)__p);
      if (v15 >= 0) {
        __int16 v10 = __p;
      }
      else {
        __int16 v10 = (void **)__p[0];
      }
      [(NSMutableDictionary *)metadata setValue:+[NSString stringWithUTF8String:v10] forKey:@"HardwareType"];
      if (v15 < 0) {
        operator delete(__p[0]);
      }
      [(NSMutableDictionary *)self->_metadata setValue:+[NSNumber numberWithDouble:*(double *)a4] forKey:@"MeanMaxMets"];
    }
    return;
  }
  if (sub_101A2CBF8((uint64_t)&self->_bodyMetrics, (uint64_t)a4))
  {
    int v6 = *a3;
    goto LABEL_4;
  }
  long long v11 = *(_OWORD *)a4;
  long long v12 = *((_OWORD *)a4 + 1);
  long long v13 = *((_OWORD *)a4 + 2);
  *(_OWORD *)&self->_bodyMetrics.runVo2max = *(_OWORD *)((char *)a4 + 44);
  *(_OWORD *)&self->_bodyMetrics.vo2max = v12;
  *(_OWORD *)&self->_bodyMetrics.hronset = v13;
  *(_OWORD *)&self->_bodyMetrics.gender = v11;

  [(CLWMCalorimetry *)self writeBodyMetrics];
}

- (void)resetBodyMetrics
{
  *(_OWORD *)&self->_bodyMetrics.hronset = xmmword_101E544D0;
  *(_OWORD *)&self->_bodyMetrics.runVo2max = *(long long *)((char *)&xmmword_101E544D0 + 12);
  *(_OWORD *)&self->_bodyMetrics.gender = xmmword_101E544B0;
  *(_OWORD *)&self->_bodyMetrics.vo2max = unk_101E544C0;
  self->_bodyMetrics.runVo2max = 7.0;
}

- (void)writeBodyMetrics
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((unsigned char *)ptr + 136) && !self->_disableBodyMetrics)
  {
    sub_10170140C(v22);
    [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
    v24 |= 1u;
    v22[77] = v4;
    sub_101723D68((uint64_t)v22);
    sub_10175D8BC(v23);
    uint64_t v5 = v23;
    uint64_t v6 = *(void *)(v23 + 8);
    int gender = self->_bodyMetrics.gender;
    *(_WORD *)(v6 + 64) |= 0x10u;
    *(_DWORD *)(v6 + 24) = gender;
    uint64_t v8 = *(void *)(v5 + 8);
    float heightM = self->_bodyMetrics.heightM;
    *(_WORD *)(v8 + 64) |= 0x20u;
    *(float *)(v8 + 28) = heightM;
    uint64_t v10 = *(void *)(v5 + 8);
    float weightKG = self->_bodyMetrics.weightKG;
    *(_WORD *)(v10 + 64) |= 0x1000u;
    *(float *)(v10 + 56) = weightKG;
    uint64_t v12 = *(void *)(v5 + 8);
    float vo2max = self->_bodyMetrics.vo2max;
    *(_WORD *)(v12 + 64) |= 0x800u;
    *(float *)(v12 + 52) = vo2max;
    uint64_t v14 = *(void *)(v5 + 8);
    float age = self->_bodyMetrics.age;
    *(_WORD *)(v14 + 64) |= 2u;
    *(float *)(v14 + 12) = age;
    uint64_t v16 = *(void *)(v5 + 8);
    float hrmin = self->_bodyMetrics.hrmin;
    *(_WORD *)(v16 + 64) |= 0x80u;
    *(float *)(v16 + 36) = hrmin;
    uint64_t v18 = *(void *)(v5 + 8);
    float hrmax = self->_bodyMetrics.hrmax;
    *(_WORD *)(v18 + 64) |= 0x40u;
    *(float *)(v18 + 32) = hrmax;
    uint64_t v20 = *(void *)(v5 + 8);
    float hronset = self->_bodyMetrics.hronset;
    *(_WORD *)(v20 + 64) |= 0x100u;
    *(float *)(v20 + 40) = hronset;
    sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)v22);
    sub_101706914((PB::Base *)v22);
  }
}

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
  p_writer = &self->_writer;
  uint64_t v5 = *(WriterManager **)a3.__ptr_;
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
  value = self->_calorimetryClient.__ptr_.__value_;
  self->_calorimetryClient.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)value + 8);
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