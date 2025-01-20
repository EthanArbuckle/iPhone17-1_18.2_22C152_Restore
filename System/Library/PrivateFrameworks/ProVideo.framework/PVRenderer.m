@interface PVRenderer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration;
- (HGRef<HGBitmap>)getDestinationBuffer:(CGSize)a3 cvPixelBufferFormat:(unsigned int)a4;
- (HGRef<HGCVPixelBuffer>)hgCVPixelBufferFromCVPoolForSize:(CGSize)a3 withFormat:(unsigned int)a4;
- (PVRenderer)initWithOptions:(id)a3;
- (id).cxx_construct;
- (unsigned)outputCVPixelBufferFormat;
- (void)_configureDefaultPoolPolicy;
- (void)_statsLogCheck;
- (void)cleanupMemoryCaches;
- (void)dealloc;
- (void)loadInstructionGraphEffects:(id)a3;
- (void)renderJobFinished:(HGRef<PVRenderJob>)a3;
- (void)startRenderRequest:(id)a3 completionHandler:(id)a4;
- (void)updateDestinationFormatForOutputColorSpace;
@end

@implementation PVRenderer

- (PVRenderer)initWithOptions:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PVRenderer;
  if ([(PVRendererBase *)&v8 initWithOptions:v4])
  {
    if (v4)
    {
      v5 = [v4 objectForKeyedSubscript:@"kPVRendererPoolDestinationBuffers"];
      if (v5)
      {
        v6 = [v4 objectForKeyedSubscript:@"kPVRendererPoolDestinationBuffers"];
        [v6 BOOLValue];
      }
    }
    operator new();
  }

  return 0;
}

- (void)dealloc
{
  PVRenderManager::FlushTextureFactories(self->_renderManager.m_Obj);
  PVRenderManager::TearDownTextureFactories(self->_renderManager.m_Obj);
  cvPoolsLock = self->_cvPoolsLock;
  if (cvPoolsLock) {
    (*((void (**)(HGSynchronizable *))cvPoolsLock->var0 + 1))(cvPoolsLock);
  }
  p_cvPools = &self->_cvPools;
  begin = (uint64_t *)self->_cvPools.__begin_;
  end = (uint64_t *)self->_cvPools.__end_;
  if (begin != end)
  {
    do
    {
      uint64_t v7 = *begin;
      if (*begin)
      {
        (*(void (**)(uint64_t))(*(void *)v7 + 16))(*begin);
        (*(void (**)(uint64_t))(*(void *)v7 + 24))(v7);
      }
      ++begin;
    }
    while (begin != end);
    begin = (uint64_t *)p_cvPools->__begin_;
    objc_super v8 = (uint64_t *)self->_cvPools.__end_;
    if (v8 != p_cvPools->__begin_)
    {
      do
        std::allocator<HGRef<PVCVPixelBufferPool>>::destroy[abi:ne180100]((uint64_t)&self->_cvPools.__end_cap_, --v8);
      while (v8 != begin);
    }
  }
  self->_cvPools.__end_ = begin;
  v9.receiver = self;
  v9.super_class = (Class)PVRenderer;
  [(PVRendererBase *)&v9 dealloc];
}

- (void)startRenderRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v6 outputNodes];
  if (v8
    && ([v6 outputNodes],
        objc_super v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        v8,
        v10)
    && ([v6 outputSize], v11 != 0.0)
    && ([v6 outputSize], v12 != 0.0))
  {
    v13 = [[PVRenderRequestJobDelegate alloc] initWithRequest:v6 completionHandler:v7 pvRenderer:self];
    if (v6)
    {
      [v6 time];
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
    }
    [(PVRendererBase *)self startJobForDelegate:v13 time:&v14 playback:1];
    if (v17) {
      (*(void (**)(uint64_t))(*(void *)v17 + 24))(v17);
    }
    [(PVRenderer *)self _statsLogCheck];
  }
  else
  {
    (*((void (**)(id, void, id, void))v7 + 2))(v7, 0, v6, 0);
  }
}

- (void)loadInstructionGraphEffects:(id)a3
{
  id v4 = a3;
  v5 = [(PVRendererBase *)self compositingContext];
  [v4 outputSize];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  char v10 = [v4 highQuality];
  [(PVRenderer *)self frameDuration];
  double v11 = (PVRendererInstructionGraphContext *)HGObject::operator new(0xA8uLL);
  CMTime v16 = v15;
  v17.width = v7;
  v17.height = v9;
  PVRendererInstructionGraphContext::PVRendererInstructionGraphContext(v11, v5, v17, v10, &v16);

  effectLoader = self->_effectLoader;
  v13 = [v4 outputNodes];
  uint64_t v14 = v11;
  if (v11) {
    (*(void (**)(PVRendererInstructionGraphContext *))(*(void *)v11 + 16))(v11);
  }
  [(PVRenderEffectLoader *)effectLoader loadEffectsForGraphs:v13 loadContext:&v14];
  if (v14) {
    (*(void (**)(PVRendererInstructionGraphContext *))(*(void *)v14 + 24))(v14);
  }

  if (v11) {
    (*(void (**)(PVRendererInstructionGraphContext *))(*(void *)v11 + 24))(v11);
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, 1, 30);
}

- (void)cleanupMemoryCaches
{
  v9.receiver = self;
  v9.super_class = (Class)PVRenderer;
  [(PVRendererBase *)&v9 cleanupMemoryCaches];
  [(PVRenderEffectLoader *)self->_effectLoader ageOutEffects];
  m_Obj = self->_destinationBufferPool.m_Obj;
  if (m_Obj) {
    HGCVPixelBufferPool::clear(m_Obj);
  }
  PVRenderManager::FreeTexturePools(self->_renderManager.m_Obj);
  cvPoolsLock = self->_cvPoolsLock;
  char v8 = 0;
  HGSynchronizable::Lock(cvPoolsLock);
  begin = (CVPixelBufferPoolRef **)self->_cvPools.__begin_;
  end = (CVPixelBufferPoolRef **)self->_cvPools.__end_;
  while (begin != end)
  {
    double v6 = *begin;
    if (*begin) {
      (*((void (**)(CVPixelBufferPoolRef *))*v6 + 2))(*begin);
    }
    CVPixelBufferPoolFlush(v6[5], 1uLL);
    (*((void (**)(CVPixelBufferPoolRef *))*v6 + 3))(v6);
    ++begin;
  }
  HGSynchronizer::~HGSynchronizer(&cvPoolsLock);
}

- (unsigned)outputCVPixelBufferFormat
{
  return self->_destinationPixelFormat;
}

- (HGRef<HGBitmap>)getDestinationBuffer:(CGSize)a3 cvPixelBufferFormat:(unsigned int)a4
{
  v5 = *(HGCV **)&a4;
  double height = a3.height;
  double width = a3.width;
  objc_super v9 = v4;
  *id v4 = 0;
  if (PVIsMultiplaneCoreVideo420Format(a4) || PVIsMultiplaneCoreVideo422Format((int)v5))
  {
    v32.double width = width;
    v32.double height = height;
    if (!PVCanCreateCVPixelBuffer(v32))
    {
      unint64_t v10 = PVMaximumCVPixelBufferSize();
      if (width > (double)v10) {
        double width = (double)v10;
      }
      if (height > (double)v10) {
        double height = (double)v10;
      }
      NSLog(&cfstr_ErrorMultiplan.isa);
    }
  }
  v33.double width = width;
  v33.double height = height;
  if (PVCanCreateCVPixelBuffer(v33))
  {
    -[PVRenderer hgCVPixelBufferFromCVPoolForSize:withFormat:](self, "hgCVPixelBufferFromCVPoolForSize:withFormat:", v5, width, height);
    if (v30)
    {
      double v12 = (__CVBuffer *)*((void *)v30 + 3);
      v13 = [(PVRendererBase *)self compositingContext];
      uint64_t v14 = [v13 outputColorSpace];
      PVAddColorSpaceAttributesToCVPixelBuffer(v12, v14);

      if (PVIsMultiplaneCoreVideo420Format((int)v5) || PVIsMultiplaneCoreVideo422Format((int)v5))
      {
        if (PVIs10BitMultiplaneCoreVideoX420Format((int)v5) || PVIs10BitMultiplaneCoreVideoX422Format((int)v5)) {
          int v16 = 3;
        }
        else {
          int v16 = 1;
        }
        HGCVBitmap::create(&v30, v16, 0, &v29);
      }
      else
      {
        int v27 = HGCV::HGFormatForCVPixelFormat(v5, 0, v15);
        HGCVBitmap::create(&v30, v27, 0, &v29);
      }
      uint64_t v28 = v29;
      if (v29)
      {
        *objc_super v9 = v29;
        (*(void (**)(uint64_t))(*(void *)v28 + 16))(v28);
        (*(void (**)(uint64_t))(*(void *)v28 + 24))(v28);
      }
    }
    else
    {
      NSLog(&cfstr_ErrorGetdestin.isa);
    }
    v26 = v30;
    if (v30) {
      return (HGRef<HGBitmap>)(*(uint64_t (**)(HGCVPixelBuffer *))(*(void *)v30 + 24))(v30);
    }
  }
  else
  {
    float v17 = width;
    float v18 = height;
    uint64_t v19 = HGRectMake4f(v11, 0.0, 0.0, v17, v18);
    uint64_t v21 = v20;
    uint64_t v23 = HGCV::HGFormatForCVPixelFormat(v5, 0, v22);
    v24 = [(PVRendererBase *)self compositingContext];
    v25 = [v24 outputColorSpace];
    PVCreateHGBitmapWithStorage(v19, v21, v23, v25, (HGBitmap **)&v30);
    if (v30)
    {
      *objc_super v9 = v30;
      v30 = 0;
    }
  }
  return (HGRef<HGBitmap>)v26;
}

- (void)renderJobFinished:(HGRef<PVRenderJob>)a3
{
  uint64_t v20 = *(void *)a3.var0;
  if (v20) {
    (*(void (**)(uint64_t, SEL))(*(void *)v20 + 16))(v20, a2);
  }
  v19.receiver = self;
  v19.super_class = (Class)PVRenderer;
  [(PVRendererBase *)&v19 renderJobFinished:&v20];
  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 24))(v20);
  }
  cvPoolsLock = self->_cvPoolsLock;
  LOBYTE(p_cvPoolsLock) = 0;
  HGSynchronizable::Lock(cvPoolsLock);
  p_cvPools = &self->_cvPools;
  begin = (CVPixelBufferPoolRef **)self->_cvPools.__begin_;
  end = (CVPixelBufferPoolRef **)self->_cvPools.__end_;
  while (begin != end)
  {
    CGFloat v7 = *begin;
    if (*begin) {
      (*((void (**)(CVPixelBufferPoolRef *))*v7 + 2))(*begin);
    }
    CVPixelBufferPoolFlush(v7[5], 0);
    (*((void (**)(CVPixelBufferPoolRef *))*v7 + 3))(v7);
    ++begin;
  }
  HGSynchronizer::~HGSynchronizer(&cvPoolsLock);
  cvPoolsLock = 0;
  p_cvPoolsLock = &cvPoolsLock;
  uint64_t v17 = 0x2020000000;
  value = self->_dateLock.__ptr_.__value_;
  char v18 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __32__PVRenderer_renderJobFinished___block_invoke;
  block[3] = &unk_1E6169850;
  block[4] = self;
  block[5] = &cvPoolsLock;
  dispatch_sync(*(dispatch_queue_t *)value, block);
  if (*((unsigned char *)p_cvPoolsLock + 24))
  {
    PVRenderManager::FlushTextureFactories(self->_renderManager.m_Obj);
    double v12 = self->_cvPoolsLock;
    char v13 = 0;
    HGSynchronizable::Lock(v12);
    objc_super v9 = (CVPixelBufferPoolRef **)p_cvPools->__begin_;
    unint64_t v10 = (CVPixelBufferPoolRef **)p_cvPools->__end_;
    while (v9 != v10)
    {
      uint64_t v11 = *v9;
      if (*v9) {
        (*((void (**)(CVPixelBufferPoolRef *))*v11 + 2))(*v9);
      }
      CVPixelBufferPoolFlush(v11[5], 1uLL);
      (*((void (**)(CVPixelBufferPoolRef *))*v11 + 3))(v11);
      ++v9;
    }
    HGSynchronizer::~HGSynchronizer(&v12);
  }
  _Block_object_dispose(&cvPoolsLock, 8);
}

void __32__PVRenderer_renderJobFinished___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 168) timeIntervalSinceNow];
  if (v2 < -1.0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 168);
    *(void *)(v4 + 168) = v3;
  }
}

- (void)_statsLogCheck
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x2020000000;
  value = self->_dateLock.__ptr_.__value_;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = *(void *)"";
  v4[2] = __28__PVRenderer__statsLogCheck__block_invoke;
  v4[3] = &unk_1E6169850;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(*(dispatch_queue_t *)value, v4);
  if (*((unsigned char *)v6 + 24)) {
    [(PVRendererBase *)self printAndClearStats:1];
  }
  _Block_object_dispose(&v5, 8);
}

void __28__PVRenderer__statsLogCheck__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 160) timeIntervalSinceNow];
  if (v2 < -5.0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 160);
    *(void *)(v4 + 160) = v3;
  }
}

- (void)_configureDefaultPoolPolicy
{
  m_Obj = self->_destinationBufferPool.m_Obj;
  std::string::basic_string[abi:ne180100]<0>(&__p, "com.apple.PVRenderer.destinationBufferPool");
  HGCVPixelBufferPool::setLabel((uint64_t)m_Obj, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (+[PVDeviceCharacteristics isLowMemDevice])
  {
    uint64_t v4 = 500;
    uint64_t v5 = 1;
    uint64_t v6 = 1;
  }
  else
  {
    if (+[PVDeviceCharacteristics actualMemory] >= 1073741825) {
      uint64_t v6 = 128;
    }
    else {
      uint64_t v6 = 32;
    }
    uint64_t v4 = 1000;
    uint64_t v5 = 20;
  }
  HGCVPixelBufferPool::setRecyclingPolicy(self->_destinationBufferPool.m_Obj, v5, v6, v4);
}

- (void)updateDestinationFormatForOutputColorSpace
{
  uint64_t v3 = [(PVRendererBase *)self compositingContext];
  uint64_t v4 = [v3 outputColorSpace];
  char v5 = [v4 isHDRSpace];

  if (v5)
  {
    unsigned int v6 = 2016686640;
  }
  else
  {
    uint64_t v7 = [(PVRendererBase *)self compositingContext];
    char v8 = [v7 outputColorSpace];
    [v8 isP3d65GammaColorSpace];

    unsigned int v6 = 1111970369;
  }
  self->_destinationPixelFormat = v6;
}

- (HGRef<HGCVPixelBuffer>)hgCVPixelBufferFromCVPoolForSize:(CGSize)a3 withFormat:(unsigned int)a4
{
  uint64_t v5 = *(void *)&a4;
  double height = a3.height;
  double width = a3.width;
  objc_super v9 = v4;
  cvPoolsLock = self->_cvPoolsLock;
  char v23 = 0;
  HGSynchronizable::Lock(cvPoolsLock);
  *objc_super v9 = 0;
  if (self->_enableDestinationPool)
  {
    uint64_t v21 = 0;
    p_cvPools = (uint64_t *)&self->_cvPools;
    begin = (uint64_t *)self->_cvPools.__begin_;
    end = (uint64_t *)self->_cvPools.__end_;
    if (begin != end)
    {
      while (1)
      {
        uint64_t v13 = *begin;
        if (*begin) {
          (*(void (**)(uint64_t))(*(void *)v13 + 16))(*begin);
        }
        if (*(void *)(v13 + 16) == (unint64_t)width
          && *(void *)(v13 + 24) == (unint64_t)height
          && *(_DWORD *)(v13 + 32) == v5)
        {
          break;
        }
        (*(void (**)(uint64_t))(*(void *)v13 + 24))(v13);
        if (++begin == end) {
          goto LABEL_9;
        }
      }
      uint64_t v19 = *(void *)v13;
      uint64_t v21 = v13;
      (*(void (**)(uint64_t))(v19 + 16))(v13);
      (*(void (**)(uint64_t))(*(void *)v13 + 24))(v13);
      goto LABEL_19;
    }
LABEL_9:
    uint64_t v14 = [(PVRendererBase *)self name];
    NSLog(&cfstr_CouldNotFindPo.isa, v14, (int)width, (int)height);

    CMTime v15 = (PVCVPixelBufferPool *)HGObject::operator new(0x30uLL);
    PVCVPixelBufferPool::PVCVPixelBufferPool(v15, (unint64_t)width, (unint64_t)height, v5);
    if (v15)
    {
      uint64_t v21 = (uint64_t)v15;
      int v16 = (PVCVPixelBufferPool **)p_cvPools[1];
      if ((unint64_t)v16 < p_cvPools[2])
      {
        *int v16 = v15;
        (*(void (**)(PVCVPixelBufferPool *))(*(void *)v15 + 16))(v15);
LABEL_16:
        uint64_t v17 = (uint64_t)(v16 + 1);
        p_cvPools[1] = (uint64_t)(v16 + 1);
LABEL_18:
        p_cvPools[1] = v17;
        uint64_t v13 = v21;
LABEL_19:
        CVPixelBufferRef pixelBufferOut = 0;
        CVPixelBufferPoolCreatePixelBuffer(0, *(CVPixelBufferPoolRef *)(v13 + 40), &pixelBufferOut);
        HGCVPixelBuffer::convert((HGCVPixelBuffer *)pixelBufferOut, &v20);
        if (v20) {
          *objc_super v9 = v20;
        }
        if (v21) {
          (*(void (**)(uint64_t))(*(void *)v21 + 24))(v21);
        }
        goto LABEL_23;
      }
    }
    else
    {
      int v16 = (PVCVPixelBufferPool **)p_cvPools[1];
      if ((unint64_t)v16 < p_cvPools[2])
      {
        *int v16 = 0;
        goto LABEL_16;
      }
    }
    uint64_t v17 = std::vector<HGRef<PVCVPixelBufferPool>>::__push_back_slow_path<HGRef<PVCVPixelBufferPool> const&>(p_cvPools, &v21);
    goto LABEL_18;
  }
  HGCVPixelBuffer::create((HGCVPixelBuffer *)width, (unint64_t)height, v5, &pixelBufferOut);
  if (pixelBufferOut) {
    *objc_super v9 = pixelBufferOut;
  }
LABEL_23:
  HGSynchronizer::~HGSynchronizer(&cvPoolsLock);
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTextureCacheFlushDate, 0);
  objc_storeStrong((id *)&self->_lastStatsLogDateTime, 0);
  std::unique_ptr<PVGCDLock>::reset[abi:ne180100]((id **)&self->_dateLock, 0);
  objc_storeStrong((id *)&self->_effectLoader, 0);
  m_Obj = self->_renderManager.m_Obj;
  if (m_Obj) {
    (*(void (**)(PVRenderManager *))(*(void *)m_Obj + 24))(m_Obj);
  }
  uint64_t v4 = self->_destinationBufferPool.m_Obj;
  if (v4) {
    (*(void (**)(HGCVPixelBufferPool *))(*(void *)v4 + 24))(v4);
  }
  p_cvPools = &self->_cvPools;
  std::vector<HGRef<PVCVPixelBufferPool>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_cvPools);
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 19) = 0;
  return self;
}

@end