@interface OZFxPlugTimingAPI
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeOffsetForImageParameter:(SEL)a3;
- ($EBBD99E4BEE052F512DA5DADC73F537E)invalidTime;
- ($EBBD99E4BEE052F512DA5DADC73F537E)zeroTime;
- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4;
- (OZFxPlugTimingAPI)initWithPluginLock:(shared_ptr<OZFxPlugSharedLock>)a3;
- (const)sceneSettings;
- (double)durationForEffect:(id)a3;
- (double)durationOfImageParm:(unsigned int)a3 forEffect:(id)a4;
- (double)durationOfInputAToTransition:(id)a3;
- (double)durationOfInputBToTransition:(id)a3;
- (double)durationOfInputToFilter:(id)a3;
- (double)imageTimeForParmId:(unsigned int)a3 forEffect:(id)a4 fromTimelineTime:(double)a5;
- (double)inPointOfTimelineForEffect:(id)a3;
- (double)inputATimeForTransition:(id)a3 fromTimelineTime:(double)a4;
- (double)inputBTimeForTransition:(id)a3 fromTimelineTime:(double)a4;
- (double)inputTimeForFilter:(id)a3 fromTimelineTime:(double)a4;
- (double)outPointOfTimelineForEffect:(id)a3;
- (double)startTimeForEffect:(id)a3;
- (double)startTimeOfImageParm:(unsigned int)a3 forEffect:(id)a4;
- (double)startTimeOfInputAToTransition:(id)a3;
- (double)startTimeOfInputBToTransition:(id)a3;
- (double)startTimeOfInputToFilter:(id)a3;
- (double)timelineDurationForEffect:(id)a3;
- (double)timelineTimeFromImageTime:(double)a3 forParmId:(unsigned int)a4 forEffect:(id)a5;
- (double)timelineTimeFromInputATime:(double)a3 forTransition:(id)a4;
- (double)timelineTimeFromInputBTime:(double)a3 forTransition:(id)a4;
- (double)timelineTimeFromInputTime:(double)a3 forFilter:(id)a4;
- (double)transitionTimeFractionAtTime:(double)a3;
- (id).cxx_construct;
- (unint64_t)fieldOrderForImageParm:(unsigned int)a3 forEffect:(id)a4;
- (unint64_t)fieldOrderForInputAToTransition:(id)a3;
- (unint64_t)fieldOrderForInputBToTransition:(id)a3;
- (unint64_t)fieldOrderForInputToFilter:(id)a3;
- (unint64_t)timelineFpsDenominatorForEffect:(id)a3;
- (unint64_t)timelineFpsNumeratorForEffect:(id)a3;
- (void)copyFxTime:(id)a3 toFxTime:(id *)a4;
- (void)durationFxTime:(id *)a3 ofImageParm:(unsigned int)a4;
- (void)durationFxTimeForEffect:(id *)a3;
- (void)durationFxTimeOfInputToFilter:(id *)a3;
- (void)frameDuration:(id *)a3;
- (void)imageFxTime:(id *)a3 forParmId:(unsigned int)a4 fromTimelineTime:(id)a5;
- (void)inPointFxTimeOfTimelineForEffect:(id *)a3;
- (void)inputAFxTime:(id *)a3 fromTimelineTime:(id)a4;
- (void)inputBFxTime:(id *)a3 fromTimelineTime:(id)a4;
- (void)inputFxTime:(id *)a3 fromTimelineTime:(id)a4;
- (void)outPointFxTimeOfTimelineForEffect:(id *)a3;
- (void)sampleDuration:(id *)a3;
- (void)scene;
- (void)startFxTime:(id *)a3 ofImageParam:(unsigned int)a4;
- (void)startFxTimeForEffect:(id *)a3;
- (void)startFxTimeOfInputToFilter:(id *)a3;
- (void)timelineFxTime:(id *)a3 fromImageTime:(id)a4 forParmId:(unsigned int)a5;
- (void)timelineFxTime:(id *)a3 fromInputATime:(id)a4;
- (void)timelineFxTime:(id *)a3 fromInputBTime:(id)a4;
- (void)timelineFxTime:(id *)a3 fromInputTime:(id)a4;
@end

@implementation OZFxPlugTimingAPI

- (OZFxPlugTimingAPI)initWithPluginLock:(shared_ptr<OZFxPlugSharedLock>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)OZFxPlugTimingAPI;
  v4 = [(OZFxPlugTimingAPI *)&v10 init];
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

- (void)copyFxTime:(id)a3 toFxTime:(id *)a4
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  objc_super v10 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v11, (uint64_t)&ptr);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
  }
  if (*(void *)v11[0])
  {
    if ((*(unsigned int (**)(void))(**(void **)v11[0] + 160))(*(void *)v11[0]))
    {
      var1 = a4->var1;
      long long v8 = *(_OWORD *)a3.var1;
      *((void *)var1 + 2) = *((void *)a3.var1 + 2);
      *(_OWORD *)var1 = v8;
    }
    else
    {
      a4->var0 = a3.var0;
    }
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v11);
}

- ($EBBD99E4BEE052F512DA5DADC73F537E)invalidTime
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
  if (*(void *)v7[0] && !(*(unsigned int (**)(void))(**(void **)v7[0] + 160))(*(void *)v7[0])) {
    FxTimeInvalid = (long long *)0xBFF0000000000000;
  }
  else {
    FxTimeInvalid = getFxTimeInvalid();
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v7);
  return ($EBBD99E4BEE052F512DA5DADC73F537E)FxTimeInvalid;
}

- ($EBBD99E4BEE052F512DA5DADC73F537E)zeroTime
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
  if (*(void *)v7[0] && !(*(unsigned int (**)(void))(**(void **)v7[0] + 160))(*(void *)v7[0])) {
    FxTimeZero = 0;
  }
  else {
    FxTimeZero = getFxTimeZero();
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v7);
  return ($EBBD99E4BEE052F512DA5DADC73F537E)FxTimeZero;
}

- (double)startTimeOfInputToFilter:(id)a3
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v13 = cntrl;
  id v14 = 0;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v10, (uint64_t)&ptr);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v13);
  }
  v4 = *(const PCString **)v10;
  if (*(void *)v10)
  {
    if (!((unsigned int (*)(void))v4->var0[5].isa)(*(void *)v10))
    {
      PCMakeNSRefAndRetain<EAGLContext *>(v4[4].var0, (id *)&v8[0].var0);
      ProCore_Impl::PCNSRefImpl::release((id *)&v8[0].var0);
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v10);
      (*(void (**)(long long *__return_ptr))(*(void *)[v14 getSceneNode] + 1128))(&v10);
      *(_OWORD *)&v8[0].var0 = v10;
      uint64_t v9 = v11;
      double v6 = COERCE_DOUBLE([v14 figTimeToFxTime:v8 withConversionData:0]);
      goto LABEL_10;
    }
    PCString::PCString(v8, v4 + 19);
    v5 = PCString::ns_str(v8);
    NSLog(&cfstr_ThePlugInCalle.isa, v5);
    PCString::~PCString(v8);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v10);
  double v6 = -1.0;
LABEL_10:
  ProCore_Impl::PCNSRefImpl::release(&v14);
  return v6;
}

- (double)startTimeOfInputAToTransition:(id)a3
{
  return -1.0;
}

- (double)startTimeOfInputBToTransition:(id)a3
{
  return -1.0;
}

- (double)startTimeOfImageParm:(unsigned int)a3 forEffect:(id)a4
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v27 = cntrl;
  id v28 = 0;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v24, (uint64_t)&ptr);
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v27);
  }
  double v6 = *(const PCString **)v24;
  if (!*(void *)v24) {
    goto LABEL_8;
  }
  if (((unsigned int (*)(void))v6->var0[5].isa)(*(void *)v24))
  {
    PCString::PCString(v22, v6 + 19);
    v7 = PCString::ns_str(v22);
    NSLog(&cfstr_ThePlugInCalle_0.isa, v7);
    PCString::~PCString(v22);
LABEL_8:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v24);
    double v8 = -1.0;
    goto LABEL_9;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v6[4].var0, (id *)&v22[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v28, (id *)&v22[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v22[0].var0);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v24);
  uint64_t v10 = [v28 channelMap];
  uint64_t v13 = *(void *)(v10 + 8);
  uint64_t v11 = v10 + 8;
  uint64_t v12 = v13;
  double v8 = 0.0;
  if (v13)
  {
    uint64_t v14 = v11;
    do
    {
      unsigned int v15 = *(_DWORD *)(v12 + 32);
      BOOL v16 = v15 >= a3;
      if (v15 >= a3) {
        v17 = (uint64_t *)v12;
      }
      else {
        v17 = (uint64_t *)(v12 + 8);
      }
      if (v16) {
        uint64_t v14 = v12;
      }
      uint64_t v12 = *v17;
    }
    while (*v17);
    if (v14 != v11 && *(_DWORD *)(v14 + 32) <= a3)
    {
      v18 = *(OZChannelBase **)(v14 + 40);
      if (v18)
      {
        ImageNode = OZChanElementOrFootageRef::getImageNode(v18);
        if (ImageNode)
        {
          uint64_t v20 = (*(uint64_t (**)(const void *))(*(void *)ImageNode + 104))(ImageNode);
          uint64_t v21 = (*(uint64_t (**)(uint64_t))(*(void *)v20 + 232))(v20);
          if (v21)
          {
            (*(void (**)(long long *__return_ptr))(*(void *)v21 + 1128))(&v24);
            *(_OWORD *)&v22[0].var0 = v24;
            uint64_t v23 = v25;
            double v8 = COERCE_DOUBLE([v28 figTimeToFxTime:v22 withConversionData:0]);
          }
        }
      }
    }
  }
LABEL_9:
  ProCore_Impl::PCNSRefImpl::release(&v28);
  return v8;
}

- (double)durationOfInputToFilter:(id)a3
{
  long long v16 = *MEMORY[0x1E4F1FA48];
  uint64_t v17 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [(OZFxPlugTimingAPI *)self invalidTime];
  id v15 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v14 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v9, (uint64_t)&ptr);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v14);
  }
  v5 = *(const PCString **)v9[0];
  if (*(void *)v9[0])
  {
    if (!((unsigned int (*)(void))v5->var0[5].isa)(*(void *)v9[0]))
    {
      PCMakeNSRefAndRetain<EAGLContext *>(v5[4].var0, (id *)&v12.var0);
      ProCore_Impl::PCNSRefImpl::operator=(&v15, (id *)&v12.var0);
      ProCore_Impl::PCNSRefImpl::release((id *)&v12.var0);
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v9);
      (*(void (**)(OZLocking **__return_ptr))(*(void *)[v15 getSceneNode] + 1128))(v9);
      long long v16 = v10;
      uint64_t v17 = v11;
      double v7 = COERCE_DOUBLE([v15 figTimeToFxTime:&v16 withConversionData:0]);
      goto LABEL_10;
    }
    PCString::PCString(&v12, v5 + 19);
    double v6 = PCString::ns_str(&v12);
    NSLog(&cfstr_ThePlugInCalle_1.isa, v6);
    PCString::~PCString(&v12);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v9);
  double v7 = -1.0;
LABEL_10:
  ProCore_Impl::PCNSRefImpl::release(&v15);
  return v7;
}

- (double)durationOfInputAToTransition:(id)a3
{
  return -1.0;
}

- (double)durationOfInputBToTransition:(id)a3
{
  return -1.0;
}

- (double)durationOfImageParm:(unsigned int)a3 forEffect:(id)a4
{
  id v33 = 0;
  id v34 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v32 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v28, (uint64_t)&ptr);
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v32);
  }
  double v6 = *(PCString **)v28[0];
  if (!*(void *)v28[0]) {
    goto LABEL_8;
  }
  if (((unsigned int (*)(void))v6->var0[5].isa)(*(void *)v28[0]))
  {
    PCString::PCString(v26, v6 + 19);
    double v7 = PCString::ns_str(v26);
    NSLog(&cfstr_ThePlugInCalle_2.isa, v7);
    PCString::~PCString(v26);
LABEL_8:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v28);
    double v8 = -1.0;
    goto LABEL_9;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v6[4].var0, (id *)&v26[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v34, (id *)&v26[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v26[0].var0);
  uint64_t v10 = [v34 channelMap];
  uint64_t v14 = *(void *)(v10 + 8);
  uint64_t v12 = v10 + 8;
  uint64_t v13 = v14;
  if (!v14) {
    goto LABEL_23;
  }
  uint64_t v15 = v12;
  do
  {
    unsigned int v16 = *(_DWORD *)(v13 + 32);
    BOOL v17 = v16 >= a3;
    if (v16 >= a3) {
      v18 = (uint64_t *)v13;
    }
    else {
      v18 = (uint64_t *)(v13 + 8);
    }
    if (v17) {
      uint64_t v15 = v13;
    }
    uint64_t v13 = *v18;
  }
  while (*v18);
  if (v15 != v12 && *(_DWORD *)(v15 + 32) <= a3 && (v19 = *(const void **)(v15 + 40)) != 0) {
  else
  }
LABEL_23:
    uint64_t v20 = 0;
  Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v6, v11);
  PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)&v26[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v33, (id *)&v26[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v26[0].var0);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v28);
  double v8 = -1.0;
  if (v20)
  {
    ImageNode = OZChanElementOrFootageRef::getImageNode(v20);
    uint64_t v23 = ImageNode;
    if (ImageNode)
    {
      uint64_t v24 = (*(uint64_t (**)(const void *))(*(void *)v23 + 104))(v23);
      uint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)v24 + 232))(v24);
      if (v25)
      {
        (*(void (**)(OZLocking **__return_ptr))(*(void *)v25 + 1128))(v28);
        *(_OWORD *)&v26[0].var0 = v29;
        uint64_t v27 = v30;
        double v8 = COERCE_DOUBLE([v34 figDurationToFxDuration:v26 withConversionData:0]);
      }
    }
  }
LABEL_9:
  ProCore_Impl::PCNSRefImpl::release(&v33);
  ProCore_Impl::PCNSRefImpl::release(&v34);
  return v8;
}

- (unint64_t)timelineFpsNumeratorForEffect:(id)a3
{
  if (![(OZFxPlugTimingAPI *)self scene]) {
    return 30;
  }
  v4 = [(OZFxPlugTimingAPI *)self sceneSettings];
  double v5 = v4[4];
  double v6 = ceil(v5) * 1000.0;
  double v7 = v5 * 600.0;
  if (*((unsigned char *)v4 + 40)) {
    return (unint64_t)v6;
  }
  return (unint64_t)v7;
}

- (unint64_t)timelineFpsDenominatorForEffect:(id)a3
{
  if (![(OZFxPlugTimingAPI *)self scene]) {
    return 600;
  }
  if (*(unsigned char *)([(OZFxPlugTimingAPI *)self sceneSettings] + 40)) {
    return 1001;
  }
  return 600;
}

- (double)inPointOfTimelineForEffect:(id)a3
{
  id v15 = 0;
  id v14 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v12 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v13, (uint64_t)&ptr);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12);
  }
  v4 = *(PCString **)v13[0];
  if (*(void *)v13[0])
  {
    if (!((unsigned int (*)(void))v4->var0[5].isa)(*(void *)v13[0]))
    {
      PCMakeNSRefAndRetain<EAGLContext *>(v4[4].var0, (id *)&v10.var0);
      ProCore_Impl::PCNSRefImpl::operator=(&v15, (id *)&v10.var0);
      ProCore_Impl::PCNSRefImpl::release((id *)&v10.var0);
      Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v4, v7);
      PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)&v10.var0);
      ProCore_Impl::PCNSRefImpl::operator=(&v14, (id *)&v10.var0);
      ProCore_Impl::PCNSRefImpl::release((id *)&v10.var0);
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v13);
      double v6 = 0.0;
      OZScene::getPlayRange((OZScene *)[v15 getScene]);
      goto LABEL_10;
    }
    PCString::PCString(&v10, v4 + 19);
    double v5 = PCString::ns_str(&v10);
    NSLog(&cfstr_ThePlugInCalle_3.isa, v5);
    PCString::~PCString(&v10);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v13);
  double v6 = -1.0;
LABEL_10:
  ProCore_Impl::PCNSRefImpl::release(&v14);
  ProCore_Impl::PCNSRefImpl::release(&v15);
  return v6;
}

- (double)outPointOfTimelineForEffect:(id)a3
{
  id v19 = 0;
  id v20 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v18 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v23, (uint64_t)&ptr);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v18);
  }
  v4 = *(PCString **)v23.value;
  if (*(void *)v23.value)
  {
    if (!((unsigned int (*)(PCString *))v4->var0[5].isa)(v4))
    {
      PCMakeNSRefAndRetain<EAGLContext *>(v4[4].var0, (id *)&v22);
      ProCore_Impl::PCNSRefImpl::operator=(&v19, (id *)&v22);
      ProCore_Impl::PCNSRefImpl::release((id *)&v22);
      Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v4, v8);
      PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)&v22);
      ProCore_Impl::PCNSRefImpl::operator=(&v20, (id *)&v22);
      ProCore_Impl::PCNSRefImpl::release((id *)&v22);
      uint64_t v10 = [v19 getScene];
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v23);
      uint64_t PlayRange = OZScene::getPlayRange((OZScene *)v10);
      memset(v16, 0, sizeof(v16));
      OZSceneSettings::getFrameDuration((OZSceneSettings *)(v10 + 336), &v14);
      CMTime v23 = *(CMTime *)PlayRange;
      CMTime v22 = *(CMTime *)(PlayRange + 24);
      PC_CMTimeSaferAdd(&v23, &v22, (uint64_t)&v21);
      CMTime v23 = v21;
      *(__n128 *)&v22.value = v14;
      v22.epoch = v15;
      double v12 = PC_CMTimeSaferSubtract(&v23, &v22, (uint64_t)v16);
      double v7 = COERCE_DOUBLE(objc_msgSend(v19, "figTimeToFxTime:withConversionData:", v16, 0, v12));
      goto LABEL_10;
    }
    PCString::PCString((PCString *)&v22, v4 + 19);
    double v6 = PCString::ns_str(v5);
    NSLog(&cfstr_ThePlugInCalle_4.isa, v6);
    PCString::~PCString((PCString *)&v22);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v23);
  double v7 = -1.0;
LABEL_10:
  ProCore_Impl::PCNSRefImpl::release(&v19);
  ProCore_Impl::PCNSRefImpl::release(&v20);
  return v7;
}

- (double)timelineDurationForEffect:(id)a3
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  __n128 v14 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v15, (uint64_t)&ptr);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v14);
  }
  double v5 = *(const PCString **)v15[0];
  double v6 = -1.0;
  if (*(void *)v15[0])
  {
    if (((unsigned int (*)(const PCString *))v5->var0[5].isa)(v5))
    {
      PCString::PCString(v11, v5 + 19);
      double v7 = PCString::ns_str(v11);
      NSLog(&cfstr_ThePlugInCalle_5.isa, v7);
      PCString::~PCString(v11);
    }
    else
    {
      uint64_t PlayRange = OZScene::getPlayRange((OZScene *)[(OZFxPlugTimingAPI *)self scene]);
      var0 = v5[4].var0;
      *(_OWORD *)&v11[0].var0 = *(_OWORD *)(PlayRange + 24);
      uint64_t v12 = *(void *)(PlayRange + 40);
      double v6 = COERCE_DOUBLE([(__CFString *)var0 figTimeToFxTime:v11 withConversionData:0]);
    }
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v15);
  return v6;
}

- (double)startTimeForEffect:(id)a3
{
  void (**v9)(PCString *__return_ptr, void *);
  PCString v11[2];
  uint64_t v12;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v14;
  OZLocking *v15[2];
  long long v16;
  uint64_t v17;
  long long v18;
  uint64_t v19;
  id v20;

  id v20 = 0;
  unsigned int v16 = *MEMORY[0x1E4F1FA48];
  BOOL v17 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  v18 = v16;
  id v19 = v17;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  __n128 v14 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v15, (uint64_t)&ptr);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v14);
  }
  v4 = *(const PCString **)v15[0];
  if (!*(void *)v15[0]) {
    goto LABEL_8;
  }
  if (((unsigned int (*)(void))v4->var0[5].isa)(*(void *)v15[0]))
  {
    PCString::PCString(v11, v4 + 19);
    double v5 = PCString::ns_str(v11);
    NSLog(&cfstr_ThePlugInCalle_6.isa, v5);
    PCString::~PCString(v11);
LABEL_8:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v15);
    double v6 = -1.0;
    goto LABEL_13;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v4[4].var0, (id *)&v11[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v20, (id *)&v11[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v11[0].var0);
  if (v7)
  {
    uint64_t v9 = (void (**)(PCString *__return_ptr, void *))(*v7 + 592);
  }
  else
  {
    uint64_t v9 = (void (**)(PCString *__return_ptr, void *))(*v8 + 1128);
    double v7 = v8;
  }
  (*v9)(v11, v7);
  unsigned int v16 = *(_OWORD *)&v11[0].var0;
  BOOL v17 = v12;
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v15);
  *(_OWORD *)&v11[0].var0 = v16;
  uint64_t v12 = v17;
  double v6 = COERCE_DOUBLE([v20 figTimeToFxTime:v11 withConversionData:0]);
LABEL_13:
  ProCore_Impl::PCNSRefImpl::release(&v20);
  return v6;
}

- (double)durationForEffect:(id)a3
{
  *(_OWORD *)&v22.value = *MEMORY[0x1E4F1FA48];
  CMTimeEpoch v3 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  *(_OWORD *)&v23.value = *(_OWORD *)&v22.value;
  v22.epoch = v3;
  v23.epoch = v3;
  id v20 = 0;
  id v21 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  id v19 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v24, (uint64_t)&ptr);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v19);
  }
  double v5 = *(PCString **)v24.value;
  if (!*(void *)v24.value) {
    goto LABEL_8;
  }
  if (((unsigned int (*)(PCString *))v5->var0[5].isa)(v5))
  {
    PCString::PCString((PCString *)v17, v5 + 19);
    double v6 = PCString::ns_str((PCString *)v17);
    NSLog(&cfstr_ThePlugInCalle_7.isa, v6);
    PCString::~PCString((PCString *)v17);
LABEL_8:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v24);
    double v7 = -1.0;
    goto LABEL_15;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v5[4].var0, (id *)v17);
  ProCore_Impl::PCNSRefImpl::operator=(&v20, (id *)v17);
  ProCore_Impl::PCNSRefImpl::release((id *)v17);
  Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v5, v8);
  PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)v17);
  ProCore_Impl::PCNSRefImpl::operator=(&v21, (id *)v17);
  ProCore_Impl::PCNSRefImpl::release((id *)v17);
  if (v10) {
    (*(void (**)(CMTime *__return_ptr, void *))(*(void *)v10 + 592))(v17, v10);
  }
  else {
    (*(void (**)(CMTime *__return_ptr))(*(void *)v11 + 1128))(v17);
  }
  CMTime v22 = v17[0];
  CMTime v23 = v17[1];
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v24);
  if (v21)
  {
    CMTime v16 = v22;
    memset(v15, 0, sizeof(v15));
    v17[0] = v22;
    CMTime v24 = v23;
    double v12 = PC_CMTimeSaferAdd(v17, &v24, (uint64_t)v15);
    double v13 = COERCE_DOUBLE(objc_msgSend(v20, "figTimeToFxTime:withConversionData:", &v16, 0, v12));
    double v7 = COERCE_DOUBLE([v20 figTimeToFxTime:v15 withConversionData:0]) - v13;
  }
  else
  {
    v17[0] = v23;
    double v7 = COERCE_DOUBLE([v20 figTimeToFxTime:v17 withConversionData:0]);
  }
LABEL_15:
  ProCore_Impl::PCNSRefImpl::release(&v20);
  ProCore_Impl::PCNSRefImpl::release(&v21);
  return v7;
}

- (double)timelineTimeFromInputTime:(double)a3 forFilter:(id)a4
{
  id v26 = 0;
  id v27 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v25 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v22, (uint64_t)&ptr);
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v25);
  }
  double v7 = *(PCString **)v22;
  double v8 = -1.0;
  if (!*(void *)v22) {
    goto LABEL_20;
  }
  if (((unsigned int (*)(PCString *))v7->var0[5].isa)(v7))
  {
    PCString::PCString(v20, v7 + 19);
    uint64_t v9 = PCString::ns_str(v20);
    NSLog(&cfstr_ThePlugInCalle_8.isa, v9);
    PCString::~PCString(v20);
LABEL_20:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v22);
    a3 = v8;
    goto LABEL_21;
  }
  {
    double v8 = 0.0;
    goto LABEL_20;
  }
  Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v7, v10);
  PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)&v20[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v27, (id *)&v20[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v20[0].var0);
  PCMakeNSRefAndRetain<EAGLContext *>(v7[4].var0, (id *)&v20[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v26, (id *)&v20[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v20[0].var0);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v22);
  if (!v27)
  {
    long long v22 = 0uLL;
    uint64_t v23 = 0;
    if (v26) {
      [v26 fxTimeToFigTime:*(void *)&a3 withConversionData:0];
    }
    double v12 = self->_fxPlugLock.__cntrl_;
    BOOL v17 = self->_fxPlugLock.__ptr_;
    v18 = v12;
    if (v12) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v12 + 1, 1uLL, memory_order_relaxed);
    }
    OZFxPlugLockSentinel::OZFxPlugLockSentinel(v19, (uint64_t)&v17);
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v18);
    }
    if (*(void *)v19[0])
    {
      (*(void (**)(long long *__return_ptr))(*(void *)v13 + 608))(&v15);
      *(_OWORD *)&v20[0].var0 = v15;
      uint64_t v21 = v16;
    }
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v19);
    a3 = COERCE_DOUBLE([v26 figTimeToFxTime:v20 withConversionData:0]);
  }
LABEL_21:
  ProCore_Impl::PCNSRefImpl::release(&v26);
  ProCore_Impl::PCNSRefImpl::release(&v27);
  return a3;
}

- (double)timelineTimeFromInputATime:(double)a3 forTransition:(id)a4
{
  return -1.0;
}

- (double)timelineTimeFromInputBTime:(double)a3 forTransition:(id)a4
{
  return -1.0;
}

- (double)timelineTimeFromImageTime:(double)a3 forParmId:(unsigned int)a4 forEffect:(id)a5
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  id v28 = cntrl;
  id v29 = 0;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)v26, (uint64_t)&ptr);
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v28);
  }
  double v8 = *(const PCString **)v26[0].value;
  if (!*(void *)v26[0].value) {
    goto LABEL_8;
  }
  if (((unsigned int (*)(void))v8->var0[5].isa)(*(void *)v26[0].value))
  {
    PCString::PCString(v32, v8 + 19);
    uint64_t v10 = PCString::ns_str(v9);
    NSLog(&cfstr_ThePlugInCalle_9.isa, v10);
    PCString::~PCString(v32);
LABEL_8:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v26);
    a3 = -1.0;
    goto LABEL_28;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v8[4].var0, (id *)&v32[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v29, (id *)&v32[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v32[0].var0);
  uint64_t v11 = [v29 channelMap];
  uint64_t v14 = *(void *)(v11 + 8);
  uint64_t v12 = v11 + 8;
  uint64_t v13 = v14;
  if (!v14) {
    goto LABEL_27;
  }
  uint64_t v15 = v12;
  do
  {
    unsigned int v16 = *(_DWORD *)(v13 + 32);
    BOOL v17 = v16 >= a4;
    if (v16 >= a4) {
      v18 = (uint64_t *)v13;
    }
    else {
      v18 = (uint64_t *)(v13 + 8);
    }
    if (v17) {
      uint64_t v15 = v13;
    }
    uint64_t v13 = *v18;
  }
  while (*v18);
  if (v15 != v12 && *(_DWORD *)(v15 + 32) <= a4 && (id v19 = *(const void **)(v15 + 40)) != 0)
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v26);
    if (v20)
    {
      ImageNode = OZChanElementOrFootageRef::getImageNode(v20);
      if (ImageNode)
      {
        uint64_t v22 = (*(uint64_t (**)(const void *))(*(void *)ImageNode + 104))(ImageNode);
        uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 232))(v22);
        if (v23)
        {
          (*(void (**)(CMTime *__return_ptr))(*(void *)v23 + 1128))(v26);
          memset(&v25, 0, sizeof(v25));
          if (v29) {
            [v29 fxTimeToFigTime:*(void *)&a3 withConversionData:0];
          }
          CMTime v30 = v26[0];
          CMTime v31 = v25;
          PC_CMTimeSaferAdd(&v31, &v30, (uint64_t)v32);
          *(_OWORD *)&v25.value = *(_OWORD *)&v32[0].var0;
          v25.epoch = v33;
          a3 = COERCE_DOUBLE([v29 figTimeToFxTime:&v25 withConversionData:0]);
        }
      }
    }
  }
  else
  {
LABEL_27:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v26);
  }
LABEL_28:
  ProCore_Impl::PCNSRefImpl::release(&v29);
  return a3;
}

- (double)inputTimeForFilter:(id)a3 fromTimelineTime:(double)a4
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  id v28 = cntrl;
  id v29 = 0;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v25, (uint64_t)&ptr);
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v28);
  }
  double v7 = *(PCString **)v25;
  double v8 = -1.0;
  if (!*(void *)v25) {
    goto LABEL_10;
  }
  if (((unsigned int (*)(PCString *))v7->var0[5].isa)(v7))
  {
    PCString::PCString(v23, v7 + 19);
    uint64_t v10 = PCString::ns_str(v23);
    NSLog(&cfstr_ThePlugInCalle_10.isa, v10);
    PCString::~PCString(v23);
LABEL_10:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v25);
    goto LABEL_11;
  }
  if (TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v7, v9))
  {
    double v8 = a4;
    goto LABEL_10;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v7[4].var0, (id *)&v23[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v29, (id *)&v23[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v23[0].var0);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v25);
  long long v25 = 0uLL;
  uint64_t v26 = 0;
  if (v29) {
    [v29 fxTimeToFigTime:*(void *)&a4 withConversionData:0];
  }
  uint64_t v12 = self->_fxPlugLock.__cntrl_;
  id v20 = self->_fxPlugLock.__ptr_;
  uint64_t v21 = v12;
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v12 + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v22, (uint64_t)&v20);
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v21);
  }
  uint64_t v13 = *(const void **)v22[0];
  if (*(void *)v22[0])
  {
    if (v14)
    {
      long long v16 = v25;
      uint64_t v17 = v26;
      (*(void (**)(long long *__return_ptr, void *, long long *))(*(void *)v14 + 600))(&v18, v14, &v16);
    }
    else
    {
      (*(void (**)(long long *__return_ptr))(*(void *)v15 + 1144))(&v18);
    }
    *(_OWORD *)&v23[0].var0 = v18;
    uint64_t v24 = v19;
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v22);
    double v8 = COERCE_DOUBLE([v29 figTimeToFxTime:v23 withConversionData:0]);
  }
  else
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v22);
    double v8 = 0.0;
  }
LABEL_11:
  ProCore_Impl::PCNSRefImpl::release(&v29);
  return v8;
}

- (double)inputATimeForTransition:(id)a3 fromTimelineTime:(double)a4
{
  return -1.0;
}

- (double)inputBTimeForTransition:(id)a3 fromTimelineTime:(double)a4
{
  return -1.0;
}

- (double)imageTimeForParmId:(unsigned int)a3 forEffect:(id)a4 fromTimelineTime:(double)a5
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  id v28 = cntrl;
  id v29 = 0;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)v26, (uint64_t)&ptr);
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v28);
  }
  double v8 = *(const PCString **)v26[0].value;
  if (!*(void *)v26[0].value) {
    goto LABEL_8;
  }
  if (((unsigned int (*)(void))v8->var0[5].isa)(*(void *)v26[0].value))
  {
    PCString::PCString(v32, v8 + 19);
    uint64_t v10 = PCString::ns_str(v9);
    NSLog(&cfstr_ThePlugInCalle_11.isa, v10);
    PCString::~PCString(v32);
LABEL_8:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v26);
    a5 = -1.0;
    goto LABEL_28;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v8[4].var0, (id *)&v32[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v29, (id *)&v32[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v32[0].var0);
  uint64_t v11 = [v29 channelMap];
  uint64_t v14 = *(void *)(v11 + 8);
  uint64_t v12 = v11 + 8;
  uint64_t v13 = v14;
  if (!v14) {
    goto LABEL_27;
  }
  uint64_t v15 = v12;
  do
  {
    unsigned int v16 = *(_DWORD *)(v13 + 32);
    BOOL v17 = v16 >= a3;
    if (v16 >= a3) {
      long long v18 = (uint64_t *)v13;
    }
    else {
      long long v18 = (uint64_t *)(v13 + 8);
    }
    if (v17) {
      uint64_t v15 = v13;
    }
    uint64_t v13 = *v18;
  }
  while (*v18);
  if (v15 != v12 && *(_DWORD *)(v15 + 32) <= a3 && (uint64_t v19 = *(const void **)(v15 + 40)) != 0)
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v26);
    if (v20)
    {
      ImageNode = OZChanElementOrFootageRef::getImageNode(v20);
      if (ImageNode)
      {
        uint64_t v22 = (*(uint64_t (**)(const void *))(*(void *)ImageNode + 104))(ImageNode);
        uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 232))(v22);
        if (v23)
        {
          (*(void (**)(CMTime *__return_ptr))(*(void *)v23 + 1128))(v26);
          memset(&v25, 0, sizeof(v25));
          if (v29) {
            [v29 fxTimeToFigTime:*(void *)&a5 withConversionData:0];
          }
          CMTime v30 = v26[0];
          CMTime v31 = v25;
          PC_CMTimeSaferSubtract(&v31, &v30, (uint64_t)v32);
          *(_OWORD *)&v25.value = *(_OWORD *)&v32[0].var0;
          v25.epoch = v33;
          a5 = COERCE_DOUBLE([v29 figTimeToFxTime:&v25 withConversionData:0]);
        }
      }
    }
  }
  else
  {
LABEL_27:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v26);
  }
LABEL_28:
  ProCore_Impl::PCNSRefImpl::release(&v29);
  return a5;
}

- (unint64_t)fieldOrderForInputToFilter:(id)a3
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v13 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v14, (uint64_t)&ptr);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v13);
  }
  if (*(void *)v14[0]
  {
    CMTime v11 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    int FieldDominance = OZFootage::getFieldDominance(Footage, &v11);
    if (FieldDominance == 1) {
      unint64_t v9 = 1;
    }
    else {
      unint64_t v9 = 2 * (FieldDominance == 2);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v14);
  return v9;
}

- (unint64_t)fieldOrderForInputAToTransition:(id)a3
{
  return 0;
}

- (unint64_t)fieldOrderForInputBToTransition:(id)a3
{
  return 0;
}

- (unint64_t)fieldOrderForImageParm:(unsigned int)a3 forEffect:(id)a4
{
  id v24 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v22 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v23, (uint64_t)&ptr);
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v22);
  }
  if (!*(void *)v23[0])
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v23);
LABEL_24:
    unint64_t v17 = 0;
    goto LABEL_25;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(*(void **)(*(void *)v23[0] + 32), &v20);
  ProCore_Impl::PCNSRefImpl::operator=(&v24, &v20);
  ProCore_Impl::PCNSRefImpl::release(&v20);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v23);
  if (!v24) {
    goto LABEL_24;
  }
  uint64_t v6 = [v24 channelMap];
  uint64_t v9 = *(void *)(v6 + 8);
  uint64_t v7 = v6 + 8;
  uint64_t v8 = v9;
  if (!v9) {
    goto LABEL_24;
  }
  uint64_t v10 = v7;
  do
  {
    unsigned int v11 = *(_DWORD *)(v8 + 32);
    BOOL v12 = v11 >= a3;
    if (v11 >= a3) {
      uint64_t v13 = (uint64_t *)v8;
    }
    else {
      uint64_t v13 = (uint64_t *)(v8 + 8);
    }
    if (v12) {
      uint64_t v10 = v8;
    }
    uint64_t v8 = *v13;
  }
  while (*v13);
  if (v10 == v7) {
    goto LABEL_24;
  }
  if (*(_DWORD *)(v10 + 32) > a3) {
    goto LABEL_24;
  }
  ImageNode = OZChanElementOrFootageRef::getImageNode(*(OZChannelBase **)(v10 + 40));
  if (!ImageNode) {
    goto LABEL_24;
  }
  if (!v15) {
    goto LABEL_24;
  }
  CMTime v19 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  int FieldDominance = OZFootage::getFieldDominance(v15, &v19);
  if (FieldDominance == 1) {
    unint64_t v17 = 1;
  }
  else {
    unint64_t v17 = 2 * (FieldDominance == 2);
  }
LABEL_25:
  ProCore_Impl::PCNSRefImpl::release(&v24);
  return v17;
}

- (double)transitionTimeFractionAtTime:(double)a3
{
  return 0.0;
}

- (void)frameDuration:(id *)a3
{
  a3->var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)0x3FF0000000000000;
}

- (void)sampleDuration:(id *)a3
{
  id v18 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  unint64_t v17 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v14, (uint64_t)&ptr);
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v17);
  }
  double v5 = *(TXParagraphStyleFolder_Factory **)v14.n128_u64[0];
  if (*(void *)v14.n128_u64[0])
  {
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)v5 + 32))(*(void *)v14.n128_u64[0]);
    int v7 = (*(uint64_t (**)(TXParagraphStyleFolder_Factory *))(*(void *)v5 + 160))(v5);
    Instance = (void *)TXParagraphStyleFolder_Factory::createInstance(v5, v8);
    PCMakeNSRefAndRetain<EAGLContext *>(Instance, v13);
    ProCore_Impl::PCNSRefImpl::operator=(&v18, v13);
    ProCore_Impl::PCNSRefImpl::release(v13);
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v14);
    if (v6)
    {
      uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 272))(v6);
      uint64_t v11 = v10;
      if (v10)
      {
        if (v7)
        {
          __n128 v14 = 0uLL;
          uint64_t v15 = 0;
          OZSceneSettings::getFrameDuration((OZSceneSettings *)(v10 + 336), &v14);
          if (*(_DWORD *)(v11 + 480)) {
            operator/((long long *)&v14, 2, (uint64_t)v13);
          }
        }
        else
        {
          if (*(_DWORD *)(v10 + 480)) {
            uint64_t v12 = 0x3FE0000000000000;
          }
          else {
            uint64_t v12 = 0x3FF0000000000000;
          }
          a3->var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v12;
        }
      }
    }
  }
  else
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v14);
  }
  ProCore_Impl::PCNSRefImpl::release(&v18);
}

- (void)startFxTimeForEffect:(id *)a3
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  id v20 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v21, (uint64_t)&ptr);
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v20);
  }
  uint64_t v6 = *(void *)v21[0];
  if (*(void *)v21[0])
  {
    if ((*(uint64_t (**)(uint64_t))(*(void *)v6 + 160))(v6))
    {
      uint64_t Instance = TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v6, v9);
      if (v7) {
        (*(void (**)(long long *__return_ptr, void *))(*(void *)v7 + 592))(&v15, v7);
      }
      else {
        (*(void (**)(long long *__return_ptr, void *))(*(void *)v8 + 1128))(&v15, v8);
      }
      long long v17 = v15;
      uint64_t v18 = v16;
      if (Instance) {
        uint64_t v12 = (long long *)[*(id *)(v6 + 32) figTimeToFxTime:&v17 withConversionData:0];
      }
      else {
        uint64_t v12 = &v17;
      }
      var1 = a3->var1;
      long long v14 = *v12;
      *((void *)var1 + 2) = *((void *)v12 + 2);
      *(_OWORD *)var1 = v14;
    }
    else
    {
      [(OZFxPlugTimingAPI *)self startTimeForEffect:*(void *)(v6 + 24)];
      a3->var1 = v11;
    }
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v21);
}

- (void)durationFxTimeForEffect:(id *)a3
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  id v24 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v25, (uint64_t)&ptr);
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v24);
  }
  uint64_t v6 = *(void **)v25[0];
  if (*(void *)v25[0])
  {
    if ((*(uint64_t (**)(void *))(*v6 + 160))(v6))
    {
      uint64_t Instance = TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v6, v9);
      if (v7) {
        (*(void (**)(CMTime *__return_ptr, void *))(*(void *)v7 + 592))(v20, v7);
      }
      else {
        (*(void (**)(CMTime *__return_ptr, void *))(*(void *)v8 + 1128))(v20, v8);
      }
      CMTime v21 = v20[0];
      CMTime v22 = v20[1];
      if (Instance)
      {
        memset(&v19, 0, sizeof(v19));
        v20[0] = v21;
        CMTime v26 = v22;
        PC_CMTimeSaferAdd(v20, &v26, (uint64_t)&v19);
        CMTime v18 = v21;
        CMTime v17 = v19;
        uint64_t v12 = (void *)v6[4];
        [v12 figTimeToFxTime:&v18 withConversionData:0];
        [v12 figTimeToFxTime:&v17 withConversionData:0];
        v20[0] = v17;
        CMTime v26 = v18;
        PC_CMTimeSaferSubtract(v20, &v26, (uint64_t)&v15);
        var1 = a3->var1;
        long long v14 = v15;
        *((void *)var1 + 2) = v16;
        *(_OWORD *)var1 = v14;
      }
      else
      {
        *(CMTime *)a3->var1 = v22;
      }
    }
    else
    {
      [(OZFxPlugTimingAPI *)self durationForEffect:v6[3]];
      a3->var1 = v11;
    }
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v25);
}

- (void)startFxTimeOfInputToFilter:(id *)a3
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  long long v15 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v16, (uint64_t)&ptr);
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v15);
  }
  double v5 = *(void **)v16[0];
  if (*(void *)v16[0])
  {
    uint64_t v6 = (void *)v5[4];
    (*(void (**)(long long *__return_ptr))(*(void *)[v6 getSceneNode] + 1128))(&v12);
    long long v10 = v12;
    uint64_t v11 = v13;
    uint64_t v7 = [v6 figTimeToFxTime:&v10 withConversionData:0];
    if ((*(unsigned int (**)(void *))(*v5 + 160))(v5))
    {
      var1 = a3->var1;
      long long v9 = *(_OWORD *)v7;
      *((void *)var1 + 2) = *(void *)(v7 + 16);
      *(_OWORD *)var1 = v9;
    }
    else
    {
      a3->var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v7;
    }
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v16);
}

- (void)durationFxTimeOfInputToFilter:(id *)a3
{
  id v20 = 0;
  id v21 = 0;
  id v19 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  CMTime v18 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v13, (uint64_t)&ptr);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v18);
  }
  uint64_t v6 = *(void ***)v13[0];
  if (*(void *)v13[0])
  {
    char v7 = (*((uint64_t (**)(void))*v6 + 20))(*(void *)v13[0]);
    PCMakeNSRefAndRetain<EAGLContext *>(v6[4], &v16);
    ProCore_Impl::PCNSRefImpl::operator=(&v21, &v16);
    ProCore_Impl::PCNSRefImpl::release(&v16);
    uint64_t Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v6, v8);
    PCMakeNSRefAndRetain<EAGLContext *>(Instance, &v16);
    ProCore_Impl::PCNSRefImpl::operator=(&v20, &v16);
    ProCore_Impl::PCNSRefImpl::release(&v16);
    PCMakeNSRefAndRetain<EAGLContext *>(v6[3], &v16);
    ProCore_Impl::PCNSRefImpl::operator=(&v19, &v16);
    ProCore_Impl::PCNSRefImpl::release(&v16);
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v13);
    if (v7)
    {
      (*(void (**)(OZLocking **__return_ptr))(*(void *)[v21 getSceneNode] + 1128))(v13);
      var1 = a3->var1;
      long long v11 = v14;
      *((void *)var1 + 2) = v15;
      *(_OWORD *)var1 = v11;
    }
    else
    {
      [(OZFxPlugTimingAPI *)self durationOfInputToFilter:v19];
      a3->var1 = v12;
    }
  }
  else
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v13);
  }
  ProCore_Impl::PCNSRefImpl::release(&v19);
  ProCore_Impl::PCNSRefImpl::release(&v20);
  ProCore_Impl::PCNSRefImpl::release(&v21);
}

- (void)startFxTime:(id *)a3 ofImageParam:(unsigned int)a4
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  CMTime v25 = cntrl;
  id v26 = 0;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v22, (uint64_t)&ptr);
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v25);
  }
  if (!*(void *)v22) {
    goto LABEL_17;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(*(void **)(*(void *)v22 + 32), (id *)&v20);
  ProCore_Impl::PCNSRefImpl::operator=(&v26, (id *)&v20);
  ProCore_Impl::PCNSRefImpl::release((id *)&v20);
  uint64_t v8 = [v26 channelMap];
  uint64_t v11 = *(void *)(v8 + 8);
  uint64_t v9 = v8 + 8;
  uint64_t v10 = v11;
  if (!v11) {
    goto LABEL_17;
  }
  uint64_t v12 = v9;
  do
  {
    unsigned int v13 = *(_DWORD *)(v10 + 32);
    BOOL v14 = v13 >= a4;
    if (v13 >= a4) {
      uint64_t v15 = (uint64_t *)v10;
    }
    else {
      uint64_t v15 = (uint64_t *)(v10 + 8);
    }
    if (v14) {
      uint64_t v12 = v10;
    }
    uint64_t v10 = *v15;
  }
  while (*v15);
  if (v12 != v9 && *(_DWORD *)(v12 + 32) <= a4)
  {
    id v16 = *(OZChannelBase **)(v12 + 40);
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v22);
    if (v16)
    {
      Node = OZChanSceneNodeRef::getNode(v16);
      if (Node)
      {
        (*(void (**)(long long *__return_ptr))(*(void *)Node + 1128))(&v22);
        long long v20 = v22;
        uint64_t v21 = v23;
        -[OZFxPlugTimingAPI copyFxTime:toFxTime:](self, "copyFxTime:toFxTime:", [v26 figTimeToFxTime:&v20 withConversionData:0], a3);
      }
      else
      {
        var1 = a3->var1;
        long long v19 = *MEMORY[0x1E4F1F9F8];
        *((void *)var1 + 2) = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
        *(_OWORD *)var1 = v19;
      }
    }
  }
  else
  {
LABEL_17:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v22);
  }
  ProCore_Impl::PCNSRefImpl::release(&v26);
}

- (void)durationFxTime:(id *)a3 ofImageParm:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v36 = 0;
  id v37 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v35 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)v33, (uint64_t)&ptr);
  if (v35) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v35);
  }
  uint64_t v8 = *(TXParagraphStyleFolder_Factory **)v33[0].value;
  if (!*(void *)v33[0].value) {
    goto LABEL_21;
  }
  if (((*(uint64_t (**)(void))(*(void *)v8 + 160))(*(void *)v33[0].value) & 1) == 0)
  {
    [(OZFxPlugTimingAPI *)self durationOfImageParm:v4 forEffect:*((void *)v8 + 3)];
    a3->var1 = v20;
LABEL_21:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v33);
    goto LABEL_32;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(*((void **)v8 + 4), (id *)&v39);
  ProCore_Impl::PCNSRefImpl::operator=(&v36, (id *)&v39);
  ProCore_Impl::PCNSRefImpl::release((id *)&v39);
  uint64_t v9 = [v36 channelMap];
  uint64_t v13 = *(void *)(v9 + 8);
  uint64_t v11 = v9 + 8;
  uint64_t v12 = v13;
  if (!v13) {
    goto LABEL_22;
  }
  uint64_t v14 = v11;
  do
  {
    unsigned int v15 = *(_DWORD *)(v12 + 32);
    BOOL v16 = v15 >= v4;
    if (v15 >= v4) {
      CMTime v17 = (uint64_t *)v12;
    }
    else {
      CMTime v17 = (uint64_t *)(v12 + 8);
    }
    if (v16) {
      uint64_t v14 = v12;
    }
    uint64_t v12 = *v17;
  }
  while (*v17);
  if (v14 != v11 && *(_DWORD *)(v14 + 32) <= v4 && (CMTime v18 = *(const void **)(v14 + 40)) != 0) {
  else
  }
LABEL_22:
    long long v19 = 0;
  uint64_t Instance = (void *)TXParagraphStyleFolder_Factory::createInstance(v8, v10);
  PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)&v39);
  ProCore_Impl::PCNSRefImpl::operator=(&v37, (id *)&v39);
  ProCore_Impl::PCNSRefImpl::release((id *)&v39);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v33);
  if (v19)
  {
    ImageNode = OZChanElementOrFootageRef::getImageNode(v19);
    if (!ImageNode) {
      goto LABEL_30;
    }
    if (v37 && v23) {
      OZImageElement::isBackgroundDropZone(v23);
    }
    Node = OZChanSceneNodeRef::getNode(v19);
    if (Node)
    {
      (*(void (**)(CMTime *__return_ptr))(*(void *)Node + 1128))(v33);
      CMTime v32 = v33[0];
      memset(&v31, 0, sizeof(v31));
      CMTime v39 = v33[1];
      CMTime v38 = v33[0];
      double v25 = PC_CMTimeSaferAdd(&v39, &v38, (uint64_t)&v31);
      objc_msgSend(v36, "figTimeToFxTime:withConversionData:", &v32, 0, v25);
      [v36 figTimeToFxTime:&v31 withConversionData:0];
      long long v29 = 0uLL;
      uint64_t v30 = 0;
      CMTime v39 = v31;
      CMTime v38 = v32;
      PC_CMTimeSaferSubtract(&v39, &v38, (uint64_t)&v29);
      var1 = a3->var1;
      long long v27 = v29;
      uint64_t v28 = v30;
    }
    else
    {
LABEL_30:
      var1 = a3->var1;
      long long v27 = *MEMORY[0x1E4F1F9F8];
      uint64_t v28 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    }
    *((void *)var1 + 2) = v28;
    *(_OWORD *)var1 = v27;
  }
LABEL_32:
  ProCore_Impl::PCNSRefImpl::release(&v36);
  ProCore_Impl::PCNSRefImpl::release(&v37);
}

- (void)inPointFxTimeOfTimelineForEffect:(id *)a3
{
  id v17 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  BOOL v16 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v12, (uint64_t)&ptr);
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v16);
  }
  char v7 = *(void ***)v12;
  if (!*(void *)v12) {
    goto LABEL_12;
  }
  if (TXParagraphStyleFolder_Factory::createInstance(*(TXParagraphStyleFolder_Factory **)v12, v6))
  {
    if ((*((unsigned int (**)(void **))*v7 + 20))(v7))
    {
      var1 = a3->var1;
      long long v9 = *MEMORY[0x1E4F1FA48];
      *((void *)var1 + 2) = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      *(_OWORD *)var1 = v9;
    }
    else
    {
      a3->var1 = 0;
    }
LABEL_12:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v12);
    goto LABEL_13;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v7[4], &v14);
  ProCore_Impl::PCNSRefImpl::operator=(&v17, &v14);
  ProCore_Impl::PCNSRefImpl::release(&v14);
  uint64_t v10 = (OZScene *)[v17 getScene];
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v12);
  if (v10)
  {
    uint64_t PlayRange = OZScene::getPlayRange(v10);
    long long v12 = *(_OWORD *)PlayRange;
    uint64_t v13 = *(void *)(PlayRange + 16);
    -[OZFxPlugTimingAPI copyFxTime:toFxTime:](self, "copyFxTime:toFxTime:", [v17 figTimeToFxTime:&v12 withConversionData:0], a3);
  }
LABEL_13:
  ProCore_Impl::PCNSRefImpl::release(&v17);
}

- (void)outPointFxTimeOfTimelineForEffect:(id *)a3
{
  id v20 = 0;
  id v21 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  long long v19 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v23, (uint64_t)&ptr);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v19);
  }
  uint64_t v6 = *(void ***)v23.value;
  if (!*(void *)v23.value) {
    goto LABEL_10;
  }
  if (((*((uint64_t (**)(void **))*v6 + 20))(v6) & 1) == 0)
  {
    [(OZFxPlugTimingAPI *)self outPointOfTimelineForEffect:v6[3]];
    a3->var1 = v15;
LABEL_10:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v23);
    goto LABEL_13;
  }
  uint64_t Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v6, v7);
  PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)&v22);
  ProCore_Impl::PCNSRefImpl::operator=(&v21, (id *)&v22);
  ProCore_Impl::PCNSRefImpl::release((id *)&v22);
  PCMakeNSRefAndRetain<EAGLContext *>(v6[4], (id *)&v22);
  ProCore_Impl::PCNSRefImpl::operator=(&v20, (id *)&v22);
  ProCore_Impl::PCNSRefImpl::release((id *)&v22);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v23);
  long long v9 = [(OZFxPlugTimingAPI *)self scene];
  if (v9)
  {
    uint64_t PlayRange = OZScene::getPlayRange(v9);
    CMTime v22 = *(CMTime *)PlayRange;
    long long v16 = 0uLL;
    uint64_t v17 = 0;
    CMTime v23 = *(CMTime *)(PlayRange + 24);
    double v11 = PC_CMTimeSaferAdd(&v23, &v22, (uint64_t)&v16);
    objc_msgSend(v20, "figTimeToFxTime:withConversionData:", &v16, 0, v11);
    var1 = a3->var1;
    long long v13 = v16;
    uint64_t v14 = v17;
  }
  else
  {
    var1 = a3->var1;
    long long v13 = *MEMORY[0x1E4F1FA48];
    uint64_t v14 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  }
  *((void *)var1 + 2) = v14;
  *(_OWORD *)var1 = v13;
LABEL_13:
  ProCore_Impl::PCNSRefImpl::release(&v20);
  ProCore_Impl::PCNSRefImpl::release(&v21);
}

- (void)timelineFxTime:(id *)a3 fromInputTime:(id)a4
{
  id v29 = 0;
  id v30 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v28 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v25, (uint64_t)&ptr);
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v28);
  }
  uint64_t v8 = *(void ***)v25;
  if (!*(void *)v25)
  {
    unsigned int v15 = (OZLocking **)&v25;
    goto LABEL_18;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v8[4], (id *)&v23);
  ProCore_Impl::PCNSRefImpl::operator=(&v30, (id *)&v23);
  ProCore_Impl::PCNSRefImpl::release((id *)&v23);
  uint64_t Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v8, v10);
  PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)&v23);
  ProCore_Impl::PCNSRefImpl::operator=(&v29, (id *)&v23);
  ProCore_Impl::PCNSRefImpl::release((id *)&v23);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v25);
  v12.var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)[(OZFxPlugTimingAPI *)self zeroTime];
  long long v25 = *MEMORY[0x1E4F1F9F8];
  uint64_t v26 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  if (v9)
  {
    long long v23 = 0uLL;
    uint64_t v24 = 0;
    if (v30) {
      [v30 fxTimeToFigTime:a4.var1 withConversionData:0];
    }
    long long v13 = self->_fxPlugLock.__cntrl_;
    id v20 = self->_fxPlugLock.__ptr_;
    id v21 = v13;
    if (v13) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v13 + 1, 1uLL, memory_order_relaxed);
    }
    OZFxPlugLockSentinel::OZFxPlugLockSentinel(v22, (uint64_t)&v20);
    if (v21) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v21);
    }
    if (*(void *)v22[0])
    {
      long long v16 = v23;
      uint64_t v17 = v24;
      (*(void (**)(long long *__return_ptr))(*(void *)v14 + 608))(&v18);
      long long v25 = v18;
      uint64_t v26 = v19;
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v22);
      v12.var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)objc_msgSend(v30, "figTimeToFxTime:withConversionData:", &v25, 0, v16, v17);
      goto LABEL_15;
    }
    unsigned int v15 = v22;
LABEL_18:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v15);
    goto LABEL_19;
  }
LABEL_15:
  [(OZFxPlugTimingAPI *)self copyFxTime:v12.var1 toFxTime:a3];
LABEL_19:
  ProCore_Impl::PCNSRefImpl::release(&v29);
  ProCore_Impl::PCNSRefImpl::release(&v30);
}

- (void)timelineFxTime:(id *)a3 fromInputATime:(id)a4
{
  a3->var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)[(OZFxPlugTimingAPI *)self invalidTime];
}

- (void)timelineFxTime:(id *)a3 fromInputBTime:(id)a4
{
  a3->var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)[(OZFxPlugTimingAPI *)self invalidTime];
}

- (void)timelineFxTime:(id *)a3 fromImageTime:(id)a4 forParmId:(unsigned int)a5
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v26 = cntrl;
  id v27 = 0;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)v24, (uint64_t)&ptr);
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v26);
  }
  if (*(void *)v24[0].value)
  {
    PCMakeNSRefAndRetain<EAGLContext *>(*(void **)(*(void *)v24[0].value + 32), (id *)&v30);
    ProCore_Impl::PCNSRefImpl::operator=(&v27, (id *)&v30);
    ProCore_Impl::PCNSRefImpl::release((id *)&v30);
    uint64_t v10 = [v27 channelMap];
    uint64_t v13 = *(void *)(v10 + 8);
    uint64_t v11 = v10 + 8;
    uint64_t v12 = v13;
    if (!v13) {
      goto LABEL_24;
    }
    uint64_t v14 = v11;
    do
    {
      unsigned int v15 = *(_DWORD *)(v12 + 32);
      BOOL v16 = v15 >= a5;
      if (v15 >= a5) {
        uint64_t v17 = (uint64_t *)v12;
      }
      else {
        uint64_t v17 = (uint64_t *)(v12 + 8);
      }
      if (v16) {
        uint64_t v14 = v12;
      }
      uint64_t v12 = *v17;
    }
    while (*v17);
    if (v14 != v11 && *(_DWORD *)(v14 + 32) <= a5 && (long long v18 = *(const void **)(v14 + 40)) != 0)
    {
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v24);
      if (v19)
      {
        ImageNode = OZChanElementOrFootageRef::getImageNode(v19);
        if (ImageNode)
        {
          uint64_t v21 = (*(uint64_t (**)(const void *))(*(void *)ImageNode + 104))(ImageNode);
          uint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)v21 + 232))(v21);
          if (v22)
          {
            (*(void (**)(CMTime *__return_ptr))(*(void *)v22 + 1128))(v24);
            memset(&v23, 0, sizeof(v23));
            if (v27) {
              [v27 fxTimeToFigTime:a4.var1 withConversionData:0];
            }
            CMTime v28 = v24[0];
            CMTime v29 = v23;
            PC_CMTimeSaferAdd(&v29, &v28, (uint64_t)&v30);
            CMTime v23 = v30;
            a4.var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)[v27 figTimeToFxTime:&v23 withConversionData:0];
          }
        }
      }
    }
    else
    {
LABEL_24:
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v24);
    }
    [(OZFxPlugTimingAPI *)self copyFxTime:a4.var1 toFxTime:a3];
  }
  else
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v24);
  }
  ProCore_Impl::PCNSRefImpl::release(&v27);
}

- (void)inputFxTime:(id *)a3 fromTimelineTime:(id)a4
{
  id v29 = 0;
  id v30 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  CMTime v28 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v25, (uint64_t)&ptr);
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v28);
  }
  uint64_t v8 = *(void ***)v25;
  if (!*(void *)v25)
  {
    uint64_t v11 = (OZLocking **)&v25;
LABEL_18:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v11);
    goto LABEL_21;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v8[4], (id *)&v23);
  ProCore_Impl::PCNSRefImpl::operator=(&v30, (id *)&v23);
  ProCore_Impl::PCNSRefImpl::release((id *)&v23);
  uint64_t Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v8, v9);
  PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)&v23);
  ProCore_Impl::PCNSRefImpl::operator=(&v29, (id *)&v23);
  ProCore_Impl::PCNSRefImpl::release((id *)&v23);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v25);
  if (v30)
  {
    [v30 fxTimeToFigTime:a4.var1 withConversionData:0];
  }
  else
  {
    long long v21 = 0uLL;
    uint64_t v22 = 0;
  }
  long long v25 = v21;
  uint64_t v26 = v22;
  uint64_t v12 = self->_fxPlugLock.__cntrl_;
  long long v18 = self->_fxPlugLock.__ptr_;
  uint64_t v19 = v12;
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v12 + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v20, (uint64_t)&v18);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v19);
  }
  uint64_t v13 = *(const void **)v20[0];
  if (!*(void *)v20[0])
  {
    uint64_t v11 = v20;
    goto LABEL_18;
  }
  if (v14)
  {
    long long v16 = v25;
    uint64_t v17 = v26;
    (*(void (**)(long long *__return_ptr, void *, long long *))(*(void *)v14 + 600))(&v21, v14, &v16);
  }
  else
  {
    (*(void (**)(long long *__return_ptr))(*(void *)v15 + 1144))(&v21);
  }
  long long v23 = v21;
  uint64_t v24 = v22;
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v20);
  -[OZFxPlugTimingAPI copyFxTime:toFxTime:](self, "copyFxTime:toFxTime:", [v30 figTimeToFxTime:&v23 withConversionData:0], a3);
LABEL_21:
  ProCore_Impl::PCNSRefImpl::release(&v29);
  ProCore_Impl::PCNSRefImpl::release(&v30);
}

- (void)inputAFxTime:(id *)a3 fromTimelineTime:(id)a4
{
  a3->var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)[(OZFxPlugTimingAPI *)self invalidTime];
}

- (void)inputBFxTime:(id *)a3 fromTimelineTime:(id)a4
{
  a3->var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)[(OZFxPlugTimingAPI *)self invalidTime];
}

- (void)imageFxTime:(id *)a3 forParmId:(unsigned int)a4 fromTimelineTime:(id)a5
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v26 = cntrl;
  id v27 = 0;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)v24, (uint64_t)&ptr);
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v26);
  }
  if (*(void *)v24[0].value)
  {
    PCMakeNSRefAndRetain<EAGLContext *>(*(void **)(*(void *)v24[0].value + 32), (id *)&v30);
    ProCore_Impl::PCNSRefImpl::operator=(&v27, (id *)&v30);
    ProCore_Impl::PCNSRefImpl::release((id *)&v30);
    uint64_t v10 = [v27 channelMap];
    uint64_t v13 = *(void *)(v10 + 8);
    uint64_t v11 = v10 + 8;
    uint64_t v12 = v13;
    if (!v13) {
      goto LABEL_24;
    }
    uint64_t v14 = v11;
    do
    {
      unsigned int v15 = *(_DWORD *)(v12 + 32);
      BOOL v16 = v15 >= a4;
      if (v15 >= a4) {
        uint64_t v17 = (uint64_t *)v12;
      }
      else {
        uint64_t v17 = (uint64_t *)(v12 + 8);
      }
      if (v16) {
        uint64_t v14 = v12;
      }
      uint64_t v12 = *v17;
    }
    while (*v17);
    if (v14 != v11 && *(_DWORD *)(v14 + 32) <= a4 && (long long v18 = *(const void **)(v14 + 40)) != 0)
    {
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v24);
      if (v19)
      {
        ImageNode = OZChanElementOrFootageRef::getImageNode(v19);
        if (ImageNode)
        {
          uint64_t v21 = (*(uint64_t (**)(const void *))(*(void *)ImageNode + 104))(ImageNode);
          uint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)v21 + 232))(v21);
          if (v22)
          {
            (*(void (**)(CMTime *__return_ptr))(*(void *)v22 + 1128))(v24);
            memset(&v23, 0, sizeof(v23));
            if (v27) {
              [v27 fxTimeToFigTime:a5.var1 withConversionData:0];
            }
            CMTime v28 = v24[0];
            CMTime v29 = v23;
            PC_CMTimeSaferSubtract(&v29, &v28, (uint64_t)&v30);
            CMTime v23 = v30;
            a5.var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)[v27 figTimeToFxTime:&v23 withConversionData:0];
          }
        }
      }
    }
    else
    {
LABEL_24:
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v24);
    }
    [(OZFxPlugTimingAPI *)self copyFxTime:a5.var1 toFxTime:a3];
  }
  else
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v24);
  }
  ProCore_Impl::PCNSRefImpl::release(&v27);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeOffsetForImageParameter:(SEL)a3
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  long long v25 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v26, (uint64_t)&ptr);
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v25);
  }
  if (!*(void *)v26[0]) {
    goto LABEL_21;
  }
  uint64_t v7 = [*(id *)(*(void *)v26[0] + 32) channelMap];
  uint64_t v10 = *(void *)(v7 + 8);
  uint64_t v8 = v7 + 8;
  uint64_t v9 = v10;
  if (!v10) {
    goto LABEL_21;
  }
  uint64_t v11 = v8;
  do
  {
    unsigned int v12 = *(_DWORD *)(v9 + 32);
    BOOL v13 = v12 >= a4;
    if (v12 >= a4) {
      uint64_t v14 = (uint64_t *)v9;
    }
    else {
      uint64_t v14 = (uint64_t *)(v9 + 8);
    }
    if (v13) {
      uint64_t v11 = v9;
    }
    uint64_t v9 = *v14;
  }
  while (*v14);
  if (v11 == v8 || *(_DWORD *)(v11 + 32) > a4 || (unsigned int v15 = *(const void **)(v11 + 40)) == 0)
  {
LABEL_21:
    uint64_t v20 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    int64_t v19 = *(void *)(v20 + 16);
    goto LABEL_22;
  }
  uint64_t v17 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
  retstr->var3 = *(void *)(v17 + 16);
  if (v16)
  {
    Node = OZChanSceneNodeRef::getNode(v16);
    if (Node)
    {
      (*(void (**)(long long *__return_ptr))(*(void *)Node + 1128))(&v22);
      *(_OWORD *)&retstr->var0 = v22;
      int64_t v19 = v23;
LABEL_22:
      retstr->var3 = v19;
    }
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v26);
  return result;
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return &unk_1F121DA70 == a3;
}

- (void)scene
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
    CMTimeEpoch v3 = objc_msgSend(*(id *)(*(void *)v7[0] + 32), "getScene", ptr);
  }
  else {
    CMTimeEpoch v3 = 0;
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v7);
  return v3;
}

- (const)sceneSettings
{
  return [(OZFxPlugTimingAPI *)self scene] + 336;
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