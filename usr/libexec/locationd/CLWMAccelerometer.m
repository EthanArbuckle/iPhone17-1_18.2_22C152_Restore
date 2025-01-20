@interface CLWMAccelerometer
- (CLWMAccelerometer)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (id)metadata;
- (int)getSampleCount;
- (void)dealloc;
- (void)onAccelerometerData:(const Sample *)a3;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMAccelerometer

- (CLWMAccelerometer)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CLWMAccelerometer;
  v8 = [(CLWMBase *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_fWorkoutRecorderAccelSampleCount = 0;
    v8->_metadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->_accelIntervalSeconds = a5->accelIntervalSeconds;
    v9->_kWorkoutRecorderWaitNumAccelSamples = *(_DWORD *)&a5->recordingType.__r_.var1;
    v9->_sampleCount = 0;
  }
  return v9;
}

- (void)setupListener
{
  if (sub_1009EC0A8())
  {
    if (!self->_accelerometerDispatcher.__ptr_.__value_)
    {
      [(CLWorkoutRecordingDelegate *)self->_delegate silo];
      operator new();
    }
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234DB98);
    }
    v3 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      __int16 v10 = 2082;
      objc_super v11 = "assert";
      __int16 v12 = 2081;
      v13 = "!_accelerometerDispatcher";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of accelerometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234DB98);
      }
    }
    v4 = qword_102419198;
    if (os_signpost_enabled((os_log_t)qword_102419198))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      __int16 v10 = 2082;
      objc_super v11 = "assert";
      __int16 v12 = 2081;
      v13 = "!_accelerometerDispatcher";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of accelerometer listener.", "{\"msg%{public}.0s\":\"Duplicate creation of accelerometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234DB98);
      }
    }
    v5 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      __int16 v10 = 2082;
      objc_super v11 = "assert";
      __int16 v12 = 2081;
      v13 = "!_accelerometerDispatcher";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of accelerometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
    __break(1u);
  }
}

- (void)teardownListeners
{
  if (self->_accelerometerDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_1009EC0A8();
    sub_1009D26C4(v3, 0, (uint64_t)self->_accelerometerDispatcher.__ptr_.__value_);
    value = self->_accelerometerDispatcher.__ptr_.__value_;
    self->_accelerometerDispatcher.__ptr_.__value_ = 0;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8))(value);
    }
    self->_fWorkoutRecorderAccelSampleCount = 0;
  }
}

- (void)dealloc
{
  self->_metadata = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWMAccelerometer;
  [(CLWMBase *)&v3 dealloc];
}

- (id)metadata
{
  id v2 = [(NSMutableDictionary *)self->_metadata copy];

  return v2;
}

- (void)onAccelerometerData:(const Sample *)a3
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((unsigned char *)ptr + 136))
  {
    ++self->_sampleCount;
    unsigned int fWorkoutRecorderAccelSampleCount = self->_fWorkoutRecorderAccelSampleCount;
    if (fWorkoutRecorderAccelSampleCount >= self->_kWorkoutRecorderWaitNumAccelSamples)
    {
      if (![(NSMutableDictionary *)self->_metadata objectForKey:@"SensorRecordingActiveAndEnabled"])
      {
        id v7 = [[-[CLIntersiloUniverse vendor](self->_universe, "vendor") proxyForService:@"CLFallNotifier"];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_101A36E44;
        v20[3] = &unk_1022CA588;
        v20[4] = self;
        [v7 doAsync:v20];
      }
    }
    else
    {
      self->_unsigned int fWorkoutRecorderAccelSampleCount = fWorkoutRecorderAccelSampleCount + 1;
    }
    sub_10170140C(v17);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v16.receiver = self;
    v16.super_class = (Class)CLWMAccelerometer;
    [(CLWMBase *)&v16 makeSafeCFAbsoluteTime:Current];
    v19 |= 1u;
    v17[77] = v9;
    sub_101723CD8((uint64_t)v17);
    sub_101651C5C(v18);
    uint64_t v10 = v18;
    uint64_t v11 = *(void *)(v18 + 8);
    double var0 = a3->var0;
    *(unsigned char *)(v11 + 32) |= 1u;
    *(double *)(v11 + 8) = var0;
    uint64_t v13 = *(void *)(v10 + 8);
    *(float *)&double var0 = a3->var1.var0;
    *(unsigned char *)(v13 + 32) |= 4u;
    *(_DWORD *)(v13 + 20) = LODWORD(var0);
    uint64_t v14 = *(void *)(v10 + 8);
    *(float *)&double var0 = a3->var1.var1;
    *(unsigned char *)(v14 + 32) |= 8u;
    *(_DWORD *)(v14 + 24) = LODWORD(var0);
    uint64_t v15 = *(void *)(v10 + 8);
    *(float *)&double var0 = a3->var1.var2;
    *(unsigned char *)(v15 + 32) |= 0x10u;
    *(_DWORD *)(v15 + 28) = LODWORD(var0);
    sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)v17);
    sub_101706914((PB::Base *)v17);
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
  value = self->_accelerometerDispatcher.__ptr_.__value_;
  self->_accelerometerDispatcher.__ptr_.__value_ = 0;
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