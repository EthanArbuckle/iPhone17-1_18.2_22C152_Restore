@interface OZFxPlugHostPrivateAPI
- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4;
- (BOOL)giveEffectUIFocus;
- (BOOL)navigateToTime:(id)a3;
- (OZFxPlugHostPrivateAPI)initWithPluginLock:(shared_ptr<OZFxPlugSharedLock>)a3;
- (float)blendingGamma;
- (id).cxx_construct;
- (id)URLForHostResource:(id)a3 withExtension:(id)a4 subDirectory:(id)a5 inBundle:(id)a6;
- (id)URLForHostResource:(id)a3 withExtension:(id)a4 subDirectory:(id)a5 inBundleWithIdentifier:(id)a6;
- (id)URLForHostResource:(id)a3 withExtension:(id)a4 subDirectory:(id)a5 inBundleWithURL:(id)a6;
- (id)URLForMediaFolder;
- (void)dealloc;
@end

@implementation OZFxPlugHostPrivateAPI

- (OZFxPlugHostPrivateAPI)initWithPluginLock:(shared_ptr<OZFxPlugSharedLock>)a3
{
  ptr = a3.__ptr_;
  v15.receiver = self;
  v15.super_class = (Class)OZFxPlugHostPrivateAPI;
  v4 = [(OZFxPlugHostPrivateAPI *)&v15 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(OZFxPlugSharedLock **)ptr;
    v6 = (std::__shared_weak_count *)*((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_fxPlugLock.__cntrl_;
    v5->_fxPlugLock.__ptr_ = v7;
    v5->_fxPlugLock.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
      v7 = v5->_fxPlugLock.__ptr_;
      v6 = (std::__shared_weak_count *)v5->_fxPlugLock.__cntrl_;
    }
    v12 = v7;
    v13 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    OZFxPlugLockSentinel::OZFxPlugLockSentinel(v14, (uint64_t)&v12);
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    v9 = *(OZFxPlugSharedBase **)v14[0];
    OZFxPlugSharedBase::getPluginUUID(*(const PCString **)v14[0], &v11);
    v5->_pluginUUID = (NSString *)[(__CFString *)PCString::ns_str(&v11) copy];
    PCString::~PCString(&v11);
    v5->_sessionID = OZFxPlugSharedBase::getPluginSessionID(v9);
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v14);
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OZFxPlugHostPrivateAPI;
  [(OZFxPlugHostPrivateAPI *)&v3 dealloc];
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return &unk_1F1219D80 == a3;
}

- (id)URLForMediaFolder
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v12 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v13, (uint64_t)&ptr);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12);
  }
  if (*(void *)v13[0])
  {
    uint64_t v3 = (*(uint64_t (**)(void))(**(void **)v13[0] + 32))(*(void *)v13[0]);
    if (v3 && (uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 272))(v3)) != 0) {
      v5 = *(const __CFURL ***)(v4 + 1584);
    }
    else {
      v5 = 0;
    }
    PCSharedCount::PCSharedCount(&v10);
    if (v5)
    {
      OZDocument::getFilename(v5, (PCURL *)&v9);
      PCString::set((PCString *)&v10, &v9);
      PCString::~PCString(&v9);
    }
    PCString::empty((PCString *)&v10);
    if (PCString::empty((PCString *)&v10))
    {
      v6 = 0;
    }
    else
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:PCString::ns_str((PCString *)&v10)];
      v6 = objc_msgSend((id)objc_msgSend(v7, "URLByDeletingLastPathComponent"), "URLByAppendingPathComponent:isDirectory:", @"Media", 1);
    }
    PCString::~PCString((PCString *)&v10);
  }
  else
  {
    v6 = 0;
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v13);
  return v6;
}

- (BOOL)navigateToTime:(id)a3
{
  PCPrint("File %s, line %d should not have been reached:\n\t", (uint64_t)a2, (uint64_t)a3.var1, v3, v4, v5, v6, v7, (char)"/Library/Caches/com.apple.xbs/Sources/MotioniOS/Ozone/Effects/FxFilter/OZFxPlugHostPrivateAPI.mm");
  pcAbortImpl();
}

- (BOOL)giveEffectUIFocus
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  PCString v11 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v12, (uint64_t)&ptr);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v11);
  }
  if (!*(void *)v12[0]) {
    goto LABEL_10;
  }
  BOOL v4 = (BOOL)v3;
  if (v3)
  {
    uint64_t v5 = (const void *)(*(uint64_t (**)(void *))(*(void *)v3 + 248))(v3);
    if (v5)
    {
      if (v6)
      {
        uint64_t v7 = (OZScene *)(*(uint64_t (**)(void *))(*(void *)v6 + 272))(v6);
        v8 = (OZDocument *)*((void *)v7 + 198);
        OZScene::selectObject(v7, (OZObjectManipulator *)(v4 + 48), 0, 0);
        OZDocument::postNotification(v8, 32);
        LOBYTE(v4) = 1;
        goto LABEL_11;
      }
    }
LABEL_10:
    LOBYTE(v4) = 0;
  }
LABEL_11:
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v12);
  return v4;
}

- (float)blendingGamma
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v8 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v9, (uint64_t)&ptr);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v8);
  }
  uint64_t v3 = *(PCRenderModel **)v9[0];
  if (*(void *)v9[0]
    && (uint64_t v3 = (PCRenderModel *)(*(uint64_t (**)(PCRenderModel *))(*(void *)v3 + 24))(v3)) != 0)
  {
    (*(void (**)(PCRenderModel *))(*(void *)v3 + 296))(v3);
  }
  else
  {
    float DefaultBlendingGamma = PCRenderModel::getDefaultBlendingGamma(v3);
  }
  float v5 = DefaultBlendingGamma;
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v9);
  return v5;
}

- (id)URLForHostResource:(id)a3 withExtension:(id)a4 subDirectory:(id)a5 inBundle:(id)a6
{
  id v6 = a6;
  if (!a6) {
    id v6 = (id)[MEMORY[0x1E4F28B50] mainBundle];
  }

  return (id)[v6 URLForResource:a3 withExtension:a4 subdirectory:a5];
}

- (id)URLForHostResource:(id)a3 withExtension:(id)a4 subDirectory:(id)a5 inBundleWithIdentifier:(id)a6
{
  if (a6) {
    a6 = (id)[MEMORY[0x1E4F28B50] bundleWithIdentifier:a6];
  }

  return [(OZFxPlugHostPrivateAPI *)self URLForHostResource:a3 withExtension:a4 subDirectory:a5 inBundle:a6];
}

- (id)URLForHostResource:(id)a3 withExtension:(id)a4 subDirectory:(id)a5 inBundleWithURL:(id)a6
{
  if (a6) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithURL:0];
  }

  return [(OZFxPlugHostPrivateAPI *)self URLForHostResource:a3 withExtension:a4 subDirectory:a5 inBundle:v10];
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