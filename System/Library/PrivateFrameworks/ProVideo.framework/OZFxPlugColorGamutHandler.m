@interface OZFxPlugColorGamutHandler
- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4;
- (OZFxPlugColorGamutHandler)initWithPluginLock:(shared_ptr<OZFxPlugSharedLock>)a3;
- (id).cxx_construct;
- (id)colorMatrixFromDesiredRGBToYCbCr;
- (id)colorMatrixFromYCbCrToDesiredRGB;
- (id)pcFloat33MatrixToFxMatrix44:(const float *)a3;
- (unint64_t)colorPrimaries;
@end

@implementation OZFxPlugColorGamutHandler

- (OZFxPlugColorGamutHandler)initWithPluginLock:(shared_ptr<OZFxPlugSharedLock>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)OZFxPlugColorGamutHandler;
  v4 = [(OZFxPlugColorGamutHandler *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(OZFxPlugSharedLock **)ptr;
    uint64_t v6 = *((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_fxPlugLock.__cntrl_;
    v5->_fxPlugLock.__ptr_ = v7;
    v5->_fxPlugLock.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }
  return v5;
}

- (id)pcFloat33MatrixToFxMatrix44:(const float *)a3
{
  uint64_t v3 = 0;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(v7, 0, sizeof(v7));
  v4 = (double *)v7;
  do
  {
    for (uint64_t i = 0; i != 3; ++i)
      v4[i] = a3[i];
    *((void *)&v7[2 * v3++ + 1] + 1) = 0;
    a3 += 3;
    v4 += 4;
  }
  while (v3 != 3);
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0x3FF0000000000000;
  return [[FxMatrix44 alloc] initWithColorMatrix44Data:v7];
}

- (id)colorMatrixFromDesiredRGBToYCbCr
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v9 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v10, (uint64_t)&ptr);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v9);
  }
  if (*(void *)v10[0])
  {
    int WorkingGamut = getWorkingGamut(*(OZChannelBase **)v10[0]);
    PCGetWorkingColorSpaceRGBToYCbCrMatrix(WorkingGamut, (uint64_t)v11);
    v5 = -[OZFxPlugColorGamutHandler pcFloat33MatrixToFxMatrix44:](self, "pcFloat33MatrixToFxMatrix44:", v11, ptr);
  }
  else
  {
    v5 = objc_alloc_init(FxMatrix44);
  }
  uint64_t v6 = v5;
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v10);
  return v6;
}

- (id)colorMatrixFromYCbCrToDesiredRGB
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v9 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v10, (uint64_t)&ptr);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v9);
  }
  if (*(void *)v10[0])
  {
    int WorkingGamut = getWorkingGamut(*(OZChannelBase **)v10[0]);
    PCGetWorkingColorSpaceYCbCrToRGBMatrix(WorkingGamut, (uint64_t)v11);
    v5 = -[OZFxPlugColorGamutHandler pcFloat33MatrixToFxMatrix44:](self, "pcFloat33MatrixToFxMatrix44:", v11, ptr);
  }
  else
  {
    v5 = objc_alloc_init(FxMatrix44);
  }
  uint64_t v6 = v5;
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v10);
  return v6;
}

- (unint64_t)colorPrimaries
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v6 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v7, (uint64_t)&ptr);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6);
  }
  if (*(void *)v7[0]) {
    unint64_t v3 = getWorkingGamut(*(OZChannelBase **)v7[0]) == 1;
  }
  else {
    unint64_t v3 = 0;
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v7);
  return v3;
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return &unk_1F12189D0 == a3;
}

- (void).cxx_destruct
{
  cntrl = self->_fxPlugLock.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end