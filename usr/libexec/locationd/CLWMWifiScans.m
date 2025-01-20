@interface CLWMWifiScans
- (CLWMWifiScans)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)dealloc;
- (void)onWifiScanNotification:(const int *)a3 data:(const void *)a4;
- (void)removeAllObjects;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMWifiScans

- (CLWMWifiScans)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CLWMWifiScans;
  v8 = [(CLWMBase *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_disableWifiScans = a5->disableWifiScans;
    v8->_wifiLookupTable = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v9->_sampleCount = 0;
  }
  return v9;
}

- (void)setupListener
{
}

- (void)teardownListeners
{
  value = self->_wifiClient.__ptr_.__value_;
  self->_wifiClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (void)dealloc
{
  self->_wifiLookupTable = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWMWifiScans;
  [(CLWMBase *)&v3 dealloc];
}

- (void)removeAllObjects
{
}

- (void)onWifiScanNotification:(const int *)a3 data:(const void *)a4
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((unsigned char *)ptr + 136) && !self->_disableWifiScans)
  {
    ++self->_sampleCount;
    if (*a3 == 3)
    {
      v5 = (void *)*((void *)self->_wifiClient.__ptr_.__value_ + 2);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_101A4C568;
      v6[3] = &unk_10234E4A0;
      v6[4] = self;
      [v5 fetchScanResultWithReply:v6, a4];
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
  value = self->_wifiClient.__ptr_.__value_;
  self->_wifiClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
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
  *((void *)self + 6) = 0;
  return self;
}

@end