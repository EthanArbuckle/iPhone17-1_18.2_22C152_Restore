@interface OZFxPrincipalDelegate
- (OZFxPrincipalDelegate)initWithPluginLock:(shared_ptr<OZFxPlugSharedLock>)a3;
- (id).cxx_construct;
- (id)fxServiceProxy;
@end

@implementation OZFxPrincipalDelegate

- (OZFxPrincipalDelegate)initWithPluginLock:(shared_ptr<OZFxPlugSharedLock>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)OZFxPrincipalDelegate;
  v4 = [(OZFxPrincipalDelegate *)&v10 init];
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

- (id)fxServiceProxy
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
    v3 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)v7[0] + 16), "pluginKitPlug", ptr), "plugInPrincipal");
  }
  else {
    v3 = 0;
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v7);
  return v3;
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