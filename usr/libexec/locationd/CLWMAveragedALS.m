@interface CLWMAveragedALS
- (CLWMAveragedALS)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)onAveragedALSData:(const void *)a3;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMAveragedALS

- (CLWMAveragedALS)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CLWMAveragedALS;
  result = [(CLWMBase *)&v8 init];
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_sampleCount = 0;
  }
  return result;
}

- (void)setupListener
{
}

- (void)teardownListeners
{
  uint64_t v3 = sub_1000D2E34(0);
  sub_1009D26C4(v3, 31, (uint64_t)self->_averagedALSDispatcher.__ptr_.__value_);
  value = self->_averagedALSDispatcher.__ptr_.__value_;
  self->_averagedALSDispatcher.__ptr_.__value_ = 0;
  if (value)
  {
    v5 = *(void (**)(void))(*(void *)value + 8);
    v5();
  }
}

- (void)onAveragedALSData:(const void *)a3
{
  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((unsigned char *)ptr + 136))
    {
      ++self->_sampleCount;
      uint64_t v5 = *(void *)a3;
      int v6 = *((_DWORD *)a3 + 2);
      sub_10170140C(v11);
      [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
      v13 |= 1u;
      v11[77] = v7;
      sub_101725868((uint64_t)v11);
      sub_10175D418(v12);
      uint64_t v8 = v12;
      uint64_t v9 = *(void *)(v12 + 8);
      *(unsigned char *)(v9 + 20) |= 1u;
      *(void *)(v9 + 8) = v5;
      uint64_t v10 = *(void *)(v8 + 8);
      *(unsigned char *)(v10 + 20) |= 2u;
      *(_DWORD *)(v10 + 16) = v6;
      sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)v11);
      sub_101706914((PB::Base *)v11);
    }
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
  value = self->_averagedALSDispatcher.__ptr_.__value_;
  self->_averagedALSDispatcher.__ptr_.__value_ = 0;
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