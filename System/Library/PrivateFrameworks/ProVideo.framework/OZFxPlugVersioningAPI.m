@interface OZFxPlugVersioningAPI
- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4;
- (BOOL)updateVersionAtCreation:(unsigned int)a3;
- (OZFxPlugVersioningAPI)initWithPluginLock:(shared_ptr<OZFxPlugSharedLock>)a3;
- (id).cxx_construct;
- (unsigned)versionAtCreation;
@end

@implementation OZFxPlugVersioningAPI

- (OZFxPlugVersioningAPI)initWithPluginLock:(shared_ptr<OZFxPlugSharedLock>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)OZFxPlugVersioningAPI;
  v4 = [(OZFxPlugVersioningAPI *)&v10 init];
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

- (unsigned)versionAtCreation
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
    unsigned int v3 = (*(uint64_t (**)(void))(**(void **)v7[0] + 192))(*(void *)v7[0]);
  }
  else {
    unsigned int v3 = -1;
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v7);
  return v3;
}

- (BOOL)updateVersionAtCreation:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v18 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v19, (uint64_t)&ptr);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v18);
  }
  uint64_t v6 = *(uint64_t **)v19[0];
  if (*(void *)v19[0])
  {
    uint64_t Instance = TXParagraphStyleFolder_Factory::createInstance(*(TXParagraphStyleFolder_Factory **)v19[0], v5);
    uint64_t v8 = *v6;
    if (Instance) {
    (*(void (**)(uint64_t *, uint64_t))(v8 + 184))(v6, v3);
    }
    PCPrint("File %s, line %d should not have been reached:\n\t", v9, v10, v11, v12, v13, v14, v15, (char)"/Library/Caches/com.apple.xbs/Sources/MotioniOS/Ozone/Effects/FxFilter/OZFxPlugHostPropertiesAPI.mm");
    pcAbortImpl();
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v19);
  return 0;
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return &unk_1F121E208 == a3;
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