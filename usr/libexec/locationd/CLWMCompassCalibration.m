@interface CLWMCompassCalibration
- (CLWMCompassCalibration)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (id)metadata;
- (int)getSampleCount;
- (void)dealloc;
- (void)onCompassCalibrationData:(const CompassCalibration *)a3;
- (void)retrieveCachedCompassCalibration;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMCompassCalibration

- (CLWMCompassCalibration)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CLWMCompassCalibration;
  v8 = [(CLWMBase *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_metadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->_kCompassCalibrationKey = *(__CFString **)&a5[1].disableAveragedALS;
    v9->_kCachedCalibrationLifeTime = *(double *)&a5[1].disableOdometer;
    v9->_kCachedCompassCalibrationQuality = a5->kCachedCompassCalibrationQuality;
    v9->_sampleCount = 0;
  }
  return v9;
}

- (void)setupListener
{
  if (!self->_compassCalibrationDispatcher.__ptr_.__value_)
  {
    [(CLWorkoutRecordingDelegate *)self->_delegate silo];
    operator new();
  }
}

- (void)teardownListeners
{
  if (self->_compassCalibrationDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_10058D9A0(0);
    sub_1009D26C4(v3, 6, (uint64_t)self->_compassCalibrationDispatcher.__ptr_.__value_);
    value = self->_compassCalibrationDispatcher.__ptr_.__value_;
    self->_compassCalibrationDispatcher.__ptr_.__value_ = 0;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8))(value);
    }
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234DA68);
    }
    v5 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Recording compass calibration stopped.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234DA68);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWMCompassCalibration teardownListeners]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (void)dealloc
{
  self->_metadata = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWMCompassCalibration;
  [(CLWMBase *)&v3 dealloc];
}

- (id)metadata
{
  id v2 = [(NSMutableDictionary *)self->_metadata copy];

  return v2;
}

- (void)retrieveCachedCompassCalibration
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((unsigned char *)ptr + 136))
  {
    v29 = 0;
    uint64_t v4 = sub_1000A6958();
    if (sub_1004D01D8(v4, (uint64_t)self->_kCompassCalibrationKey, (CFTypeRef *)&v29))
    {
      [objc_msgSend(v29, "objectForKeyedSubscript:", @"Time") floatValue];
      float v6 = v5;
      id v7 = [v29 objectForKeyedSubscript:@"Bias"];
      id v8 = [v29 objectForKeyedSubscript:@"Scale"];
      sub_10170140C(buf);
      [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
      v33 |= 1u;
      uint64_t v31 = v9;
      sub_101724ED8((uint64_t)buf);
      sub_10175DD60(v32);
      CFAbsoluteTime v10 = v6;
      uint64_t v11 = v32;
      uint64_t v12 = *(void *)(v32 + 8);
      *(_DWORD *)(v12 + 80) |= 1u;
      *(CFAbsoluteTime *)(v12 + 8) = v10;
      uint64_t v13 = *(void *)(v11 + 8);
      [objc_msgSend(v7, "objectAtIndexedSubscript:", 0) floatValue];
      *(_DWORD *)(v13 + 80) |= 2u;
      *(_DWORD *)(v13 + 16) = v14;
      uint64_t v15 = *(void *)(v11 + 8);
      [v7[1] floatValue];
      *(_DWORD *)(v15 + 80) |= 4u;
      *(_DWORD *)(v15 + 20) = v16;
      uint64_t v17 = *(void *)(v11 + 8);
      [objc_msgSend(v7, "objectAtIndexedSubscript:", 2) floatValue];
      *(_DWORD *)(v17 + 80) |= 8u;
      *(_DWORD *)(v17 + 24) = v18;
      uint64_t v19 = *(void *)(v11 + 8);
      [v8[0] floatValue];
      *(_DWORD *)(v19 + 80) |= 0x2000u;
      *(_DWORD *)(v19 + 64) = v20;
      uint64_t v21 = *(void *)(v11 + 8);
      [objc_msgSend(v8, "objectAtIndexedSubscript:", 1) floatValue];
      *(_DWORD *)(v21 + 80) |= 0x4000u;
      *(_DWORD *)(v21 + 68) = v22;
      uint64_t v23 = *(void *)(v11 + 8);
      [objc_msgSend(v8, "objectAtIndexedSubscript:", 2) floatValue];
      *(_DWORD *)(v23 + 80) |= 0x8000u;
      *(_DWORD *)(v23 + 72) = v24;
      uint64_t v25 = *(void *)(v11 + 8);
      float kCachedCompassCalibrationQuality = self->_kCachedCompassCalibrationQuality;
      *(_DWORD *)(v25 + 80) |= 0x1000u;
      *(float *)(v25 + 60) = kCachedCompassCalibrationQuality;
      if (CFAbsoluteTimeGetCurrent() - self->_kCachedCalibrationLifeTime <= v10) {
        [(NSMutableDictionary *)self->_metadata setObject:&__kCFBooleanTrue forKeyedSubscript:@"ContainsValidCompassCalibration"];
      }
      sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)buf);
      sub_101706914((PB::Base *)buf);
    }
    else
    {
      if (qword_1024190A0 != -1) {
        dispatch_once(&qword_1024190A0, &stru_10234DA88);
      }
      v27 = qword_1024190A8;
      if (os_log_type_enabled((os_log_t)qword_1024190A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[CompassCalibration] no persistent calibration found", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024190A0 != -1) {
          dispatch_once(&qword_1024190A0, &stru_10234DA88);
        }
        v28 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWMCompassCalibration retrieveCachedCompassCalibration]", "%s\n", v28);
        if (v28 != (char *)buf) {
          free(v28);
        }
      }
    }
  }
}

- (void)onCompassCalibrationData:(const CompassCalibration *)a3
{
  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((unsigned char *)ptr + 136))
    {
      ++self->_sampleCount;
      [(NSMutableDictionary *)self->_metadata setObject:&__kCFBooleanTrue forKeyedSubscript:@"ContainsValidCompassCalibration"];
      sub_10170140C(v17);
      [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
      v19 |= 1u;
      v17[77] = v6;
      sub_101724ED8((uint64_t)v17);
      sub_10175DD60(v18);
      uint64_t v7 = v18;
      uint64_t v8 = *(void *)(v18 + 8);
      [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
      *(_DWORD *)(v8 + 80) |= 1u;
      *(void *)(v8 + 8) = v9;
      uint64_t v10 = *(void *)(v7 + 8);
      LODWORD(v9) = *(_DWORD *)(&a3->var4 + 1);
      *(_DWORD *)(v10 + 80) |= 2u;
      *(_DWORD *)(v10 + 16) = v9;
      uint64_t v11 = *(void *)(v7 + 8);
      *(float *)&uint64_t v9 = *(float *)((char *)a3->var5 + 1);
      *(_DWORD *)(v11 + 80) |= 4u;
      *(_DWORD *)(v11 + 20) = v9;
      uint64_t v12 = *(void *)(v7 + 8);
      *(float *)&uint64_t v9 = *(float *)((char *)&a3->var5[1] + 1);
      *(_DWORD *)(v12 + 80) |= 8u;
      *(_DWORD *)(v12 + 24) = v9;
      uint64_t v13 = *(void *)(v7 + 8);
      *(float *)&uint64_t v9 = *(float *)((char *)&a3->var6[2] + 1);
      *(_DWORD *)(v13 + 80) |= 0x2000u;
      *(_DWORD *)(v13 + 64) = v9;
      uint64_t v14 = *(void *)(v7 + 8);
      *(float *)&uint64_t v9 = *(float *)((char *)a3->var7 + 1);
      *(_DWORD *)(v14 + 80) |= 0x4000u;
      *(_DWORD *)(v14 + 68) = v9;
      uint64_t v15 = *(void *)(v7 + 8);
      *(float *)&uint64_t v9 = *(float *)((char *)&a3->var7[1] + 1);
      *(_DWORD *)(v15 + 80) |= 0x8000u;
      *(_DWORD *)(v15 + 72) = v9;
      uint64_t v16 = *(void *)(v7 + 8);
      *(float *)&uint64_t v9 = *(float *)((char *)&a3->var8[2] + 1);
      *(_DWORD *)(v16 + 80) |= 0x1000u;
      *(_DWORD *)(v16 + 60) = v9;
      sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)v17);
      sub_101706914((PB::Base *)v17);
    }
  }
}

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
  p_writer = &self->_writer;
  float v5 = *(WriterManager **)a3.__ptr_;
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
  value = self->_compassCalibrationDispatcher.__ptr_.__value_;
  self->_compassCalibrationDispatcher.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Dispatcher *, SEL))(*(void *)value + 8))(value, a2);
  }
  cntrl = self->_writer.__cntrl_;
  if (cntrl)
  {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end