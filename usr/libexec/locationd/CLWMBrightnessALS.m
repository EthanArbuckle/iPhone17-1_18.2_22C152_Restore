@interface CLWMBrightnessALS
- (CLWMBrightnessALS)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)handleBrightnessClientNotification:(id)a3 withValue:(id)a4;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMBrightnessALS

- (CLWMBrightnessALS)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CLWMBrightnessALS;
  result = [(CLWMBase *)&v8 init];
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_brightnessSystemClient = 0;
    result->_sampleCount = 0;
  }
  return result;
}

- (void)setupListener
{
  v3 = (BrightnessSystemClient *)objc_alloc_init((Class)BrightnessSystemClient);
  self->_brightnessSystemClient = v3;
  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_101A32B9C;
    v4[3] = &unk_10234D9E0;
    v4[4] = self;
    [(BrightnessSystemClient *)v3 registerNotificationBlock:v4 forProperties:&off_102398220];
    [(BrightnessSystemClient *)self->_brightnessSystemClient setProperty:(id)CFMakeCollectable(kCFBooleanTrue) forKey:@"ActivateALS"];
  }
}

- (void)teardownListeners
{
  brightnessSystemClient = self->_brightnessSystemClient;
  if (brightnessSystemClient)
  {

    self->_brightnessSystemClient = 0;
  }
}

- (void)handleBrightnessClientNotification:(id)a3 withValue:(id)a4
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((unsigned char *)ptr + 136))
  {
    if (self->_brightnessSystemClient)
    {
      ++self->_sampleCount;
      sub_10170140C(v10);
      [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
      v12 |= 1u;
      v10[77] = v7;
      sub_101724938((uint64_t)v10);
      sub_10175C74C(v11);
      uint64_t v8 = *(void *)(v11 + 8);
      [a4 floatValue];
      *(unsigned char *)(v8 + 12) |= 1u;
      *(_DWORD *)(v8 + 8) = v9;
      sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)v10);
      sub_101706914((PB::Base *)v10);
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
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end