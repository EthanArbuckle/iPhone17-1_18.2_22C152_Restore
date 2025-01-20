@interface PVRenderRequestJobDelegate
+ (unsigned)jobTypeTag;
- (PVRenderRequestJobDelegate)initWithRequest:(id)a3 completionHandler:(id)a4 pvRenderer:(id)a5;
- (PVVideoCompositingContext)videoCompositingContext;
- (id).cxx_construct;
- (int)graphBuildThreadPriority;
- (int)jobPriority;
- (int)renderContextPriority;
- (int)renderThreadPriority;
- (unint64_t)packedFamilyCode;
- (unsigned)jobTypeTag;
- (unsigned)outputCVPixelBufferFormat;
- (void)buildGraph:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5;
- (void)dealloc;
- (void)finishCancelledJob;
- (void)finishCompletedJob;
- (void)renderJobFinished:(HGRef<PVRenderJob>)a3;
- (void)setupDestinationBuffers:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5;
@end

@implementation PVRenderRequestJobDelegate

+ (unsigned)jobTypeTag
{
  return 12000;
}

- (PVRenderRequestJobDelegate)initWithRequest:(id)a3 completionHandler:(id)a4 pvRenderer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PVRenderRequestJobDelegate;
  v12 = [(PVRenderRequestJobDelegate *)&v22 init];
  v13 = v12;
  v14 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->m_request, a3);
    objc_storeStrong((id *)&v13->m_pvRenderer, a5);
    PVRenderManager::INSTANCE(v15, &v21);
    m_Obj = v14->m_renderManager.m_Obj;
    v17 = v21;
    if (m_Obj == v21)
    {
      if (m_Obj) {
        (*(void (**)(PVRenderManager *))(*(void *)m_Obj + 24))(m_Obj);
      }
    }
    else
    {
      if (m_Obj)
      {
        (*(void (**)(PVRenderManager *))(*(void *)m_Obj + 24))(m_Obj);
        v17 = v21;
      }
      v14->m_renderManager.m_Obj = v17;
    }
    uint64_t v18 = MEMORY[0x1BA9C0C60](v10);
    id m_completionHandler = v14->m_completionHandler;
    v14->id m_completionHandler = (id)v18;

    operator new();
  }

  return 0;
}

- (void)dealloc
{
  m_destinationBitmaps = self->m_destinationBitmaps;
  if (m_destinationBitmaps)
  {
    v5 = (void **)self->m_destinationBitmaps;
    std::vector<HGRef<HGBitmap>>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x1BA9BFBA0](m_destinationBitmaps, 0x20C40960023A9);
  }
  v4.receiver = self;
  v4.super_class = (Class)PVRenderRequestJobDelegate;
  [(PVRenderRequestJobDelegate *)&v4 dealloc];
}

- (unsigned)jobTypeTag
{
  v2 = objc_opt_class();

  return [v2 jobTypeTag];
}

- (unsigned)outputCVPixelBufferFormat
{
  unsigned int v3 = [(PVRenderRequest *)self->m_request outputCVPixelBufferFormat];
  uint64_t v4 = 16;
  if (!v3) {
    uint64_t v4 = 8;
  }
  v5 = *(Class *)((char *)&self->super.isa + v4);

  return [v5 outputCVPixelBufferFormat];
}

- (PVVideoCompositingContext)videoCompositingContext
{
  return [(PVRendererBase *)self->m_pvRenderer compositingContext];
}

- (void)buildGraph:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  p_m_request = &self->m_request;
  -[PVRenderer loadInstructionGraphEffects:](self->m_pvRenderer, "loadInstructionGraphEffects:", self->m_request, a4, a5);
  BOOL v7 = [(PVRenderRequest *)*p_m_request highQuality];
  v8 = [(PVRenderRequest *)*(p_m_request - 1) compositingContext];
  [(PVRenderRequest *)*p_m_request outputSize];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  m_pvuint64_t Renderer = self->m_pvRenderer;
  if (m_pvRenderer) {
    [(PVRenderer *)m_pvRenderer frameDuration];
  }
  else {
    memset(&v85, 0, sizeof(v85));
  }
  v14 = (PVRendererInstructionGraphContext *)HGObject::operator new(0xA8uLL);
  CMTime time = v85;
  v88.width = v10;
  v88.height = v12;
  PVRendererInstructionGraphContext::PVRendererInstructionGraphContext(v14, v8, v88, v7, &time);

  v15 = NSString;
  m_request = self->m_request;
  if (m_request)
  {
    [(PVRenderRequest *)m_request time];
    v17 = NSString;
    CMTimeValue value = v84.value;
    uint64_t timescale = v84.timescale;
  }
  else
  {
    uint64_t timescale = 0;
    CMTimeValue value = 0;
    memset(&v84, 0, sizeof(v84));
    v17 = NSString;
  }
  CMTime time = v84;
  v20 = objc_msgSend(v17, "stringWithFormat:", @"{%lld/%d = %.3f}", value, timescale, CMTimeGetSeconds(&time));
  v21 = [v15 stringWithFormat:@"RequestTime: %@", v20];

  id v58 = v21;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v58 UTF8String]);
  PVInstructionGraphContext::AddContextDotNode((id *)v14, (uint64_t)__p);
  if (v83 < 0) {
    operator delete(__p[0]);
  }
  if ((int)HGLogger::getLevel((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", v22) >= 1)
  {
    v23 = self->m_request;
    if (v23) {
      [(PVRenderRequest *)v23 time];
    }
    else {
      memset(&v81, 0, sizeof(v81));
    }
    v24 = CMTimeCopyDescription(0, &v81);
    v25 = v24;
    unsigned __int8 v26 = atomic_load(HGLogger::_enabled);
    if (v26)
    {
      uint64_t v27 = [v24 UTF8String];
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Current Time:           %s\n", v28, v29, v27);
    }
    CFRelease(v25);
  }
  time.CMTimeValue value = (CMTimeValue)&time.timescale;
  *(void *)&time.uint64_t timescale = 0;
  v76[0] = 0;
  v76[1] = 0;
  time.epoch = 0;
  v75 = v76;
  v76[2] = v77;
  v77[0] = 0;
  v78[0] = 0;
  v78[1] = 0;
  v77[1] = 0;
  v77[2] = v78;
  v78[2] = v79;
  v79[0] = 0;
  v80[0] = 0;
  v80[1] = 0;
  v79[1] = 0;
  v79[2] = v80;
  uint64_t Renderer = HGRenderContext::GetRenderer((HGRenderContext *)a4);
  CMTimeValue v31 = Renderer;
  if (Renderer) {
    (*(void (**)(uint64_t))(*(void *)Renderer + 16))(Renderer);
  }
  v85.CMTimeValue value = v31;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v32 = self;
  id obj = [(PVRenderRequest *)self->m_request outputNodes];
  uint64_t v33 = [obj countByEnumeratingWithState:&v70 objects:v86 count:16];
  if (v33)
  {
    uint64_t v61 = *(void *)v71;
    do
    {
      uint64_t v62 = v33;
      for (uint64_t i = 0; i != v62; ++i)
      {
        if (*(void *)v71 != v61) {
          objc_enumerationMutation(obj);
        }
        v35 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        v36 = v32->m_request;
        if (v36) {
          [(PVRenderRequest *)v36 time];
        }
        else {
          memset(v68, 0, sizeof(v68));
        }
        v67 = v14;
        if (v14) {
          (*(void (**)(PVRendererInstructionGraphContext *))(*(void *)v14 + 16))(v14);
        }
        if (v35) {
          [v35 hgNodeForTime:v68 trackInputs:&time renderer:&v85 igContext:&v67];
        }
        else {
          v69 = 0;
        }
        if (v67) {
          (*(void (**)(PVRendererInstructionGraphContext *))(*(void *)v67 + 24))(v67);
        }
        if (+[PVEnvironment PV_HIGHLIGHT_OUT_OF_GAMUT])
        {
          v37 = (HgcHighlightOutOfGamut *)HGObject::operator new(0x1A0uLL);
          HgcHighlightOutOfGamut::HgcHighlightOutOfGamut(v37);
          (*(void (**)(HgcHighlightOutOfGamut *, void, HGNode *))(*(void *)v37 + 120))(v37, 0, v69);
          if (v69 != (HGNode *)v37)
          {
            if (v69) {
              (*(void (**)(void))(*(void *)v69 + 24))();
            }
            v69 = (HGNode *)v37;
            (*(void (**)(HgcHighlightOutOfGamut *))(*(void *)v37 + 16))(v37);
          }
          (*(void (**)(HgcHighlightOutOfGamut *))(*(void *)v37 + 24))(v37);
        }
        v65 = v69;
        if (v69) {
          (*(void (**)(HGNode *))(*(void *)v69 + 16))(v69);
        }
        v38 = PVInstructionGraphContext::WorkingColorSpace((PVInstructionGraphContext *)v14);
        v39 = PVInstructionGraphContext::OutputColorSpace((PVInstructionGraphContext *)v14);
        id v64 = 0;
        ColorConformInput((HGColorConform **)&v65, v38, v39, 1, &v64, (HGColorConform **)&v66);
        id v40 = v64;
        v41 = v66;
        if (v69 == v66)
        {
          if (v69) {
            (*(void (**)(void))(*(void *)v69 + 24))();
          }
        }
        else
        {
          if (v69)
          {
            (*(void (**)(void))(*(void *)v69 + 24))();
            v41 = v66;
          }
          v69 = v41;
          v66 = 0;
        }

        if (v65) {
          (*(void (**)(HGNode *))(*(void *)v65 + 24))(v65);
        }
        if (v40) {
          NSLog(&cfstr_ConformError.isa, v40);
        }
        int v42 = [(PVRenderRequestJobDelegate *)self outputCVPixelBufferFormat];
        if (PVIsMultiplaneCoreVideo420Format(v42) || PVIsMultiplaneCoreVideo422Format(v42))
        {
          [(PVRenderRequest *)self->m_request outputSize];
          double v44 = v43;
          [(PVRenderRequest *)self->m_request outputSize];
          int v46 = (int)v44 & 1;
          if ((int)v44 < 0) {
            int v46 = -v46;
          }
          uint64_t v47 = HGRectMake4i(0, 0, v46 + (int)v44, (int)v45);
          uint64_t v49 = v48;
          uint64_t DOD = HGRenderer::GetDOD((HGRenderer *)v85.value, v69);
          uint64_t v52 = v51;
          v53 = PVInstructionGraphContext::OutputColorSpace((PVInstructionGraphContext *)v14);
          v54 = [v53 nclcTriplet];

          PVCreateYUVPlanesWithBackfillBlackBackground(DOD, v52, v47, v49, &v69, v54, v42, (uint64_t *)a3);
        }
        else if (v42 == 1380411457 || v42 == 1111970369)
        {
          v55 = (HGNode **)*((void *)a3 + 1);
          if ((unint64_t)v55 >= *((void *)a3 + 2))
          {
            uint64_t v57 = std::vector<HGRef<HGNode>>::__push_back_slow_path<HGRef<HGNode> const&>((uint64_t *)a3, (uint64_t *)&v69);
          }
          else
          {
            v56 = v69;
            *v55 = v69;
            if (v56) {
              (*(void (**)(HGNode *))(*(void *)v56 + 16))(v56);
            }
            uint64_t v57 = (uint64_t)(v55 + 1);
            *((void *)a3 + 1) = v55 + 1;
          }
          *((void *)a3 + 1) = v57;
        }

        if (v69) {
          (*(void (**)(HGNode *))(*(void *)v69 + 24))(v69);
        }
        v32 = self;
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v70 objects:v86 count:16];
    }
    while (v33);
  }

  if (v85.value) {
    (*(void (**)(CMTimeValue))(*(void *)v85.value + 24))(v85.value);
  }
  PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::~PVInputHGNodeMap(&time);

  if (v14) {
    (*(void (**)(PVRendererInstructionGraphContext *))(*(void *)v14 + 24))(v14);
  }
}

- (void)setupDestinationBuffers:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5
{
  if (*((void *)self->m_destinationBitmaps + 1) == *(void *)self->m_destinationBitmaps)
  {
    uint64_t v8 = [(PVRenderRequestJobDelegate *)self outputCVPixelBufferFormat];
    double v9 = [(PVRenderRequest *)self->m_request outputNodes];
    uint64_t v10 = [v9 count];

    for (; v10; --v10)
    {
      m_pvuint64_t Renderer = self->m_pvRenderer;
      [(PVRenderRequest *)self->m_request outputSize];
      if (m_pvRenderer) {
        -[PVRenderer getDestinationBuffer:cvPixelBufferFormat:](m_pvRenderer, "getDestinationBuffer:cvPixelBufferFormat:", v8);
      }
      else {
        v21 = 0;
      }
      m_destinationBitmaps = self->m_destinationBitmaps;
      v14 = (HGCVBitmap **)m_destinationBitmaps[1];
      if ((unint64_t)v14 >= m_destinationBitmaps[2])
      {
        uint64_t v16 = std::vector<HGRef<HGBitmap>>::__push_back_slow_path<HGRef<HGBitmap> const&>((uint64_t *)self->m_destinationBitmaps, (uint64_t *)&v21);
      }
      else
      {
        v15 = v21;
        PVRendererInstructionGraphContext *v14 = v21;
        if (v15) {
          (*(void (**)(HGCVBitmap *))(*(void *)v15 + 16))(v15);
        }
        uint64_t v16 = (uint64_t)(v14 + 1);
        m_destinationBitmaps[1] = v14 + 1;
      }
      m_destinationBitmaps[1] = v16;
      CVBitmapStorage = HGCVBitmap::getCVBitmapStorage((HGBitmap *)v21, v12);
      if (CVBitmapStorage)
      {
        PVCreateOutputBufferForHGCVPixelBuffer(*(__CVBuffer **)(CVBitmapStorage[16] + 24), (HGRenderContext *)a4, (uint64_t *)a3);
      }
      else
      {
        uint64_t v18 = (HGCVBitmap **)*((void *)a3 + 1);
        if ((unint64_t)v18 >= *((void *)a3 + 2))
        {
          uint64_t v20 = std::vector<HGRef<HGBitmap>>::__push_back_slow_path<HGRef<HGBitmap> const&>((uint64_t *)a3, (uint64_t *)&v21);
        }
        else
        {
          v19 = v21;
          *uint64_t v18 = v21;
          if (v19) {
            (*(void (**)(HGCVBitmap *))(*(void *)v19 + 16))(v19);
          }
          uint64_t v20 = (uint64_t)(v18 + 1);
          *((void *)a3 + 1) = v18 + 1;
        }
        *((void *)a3 + 1) = v20;
      }
      if (v21) {
        (*(void (**)(HGCVBitmap *))(*(void *)v21 + 24))(v21);
      }
    }
  }
}

- (void)finishCompletedJob
{
  unsigned int v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(uint64_t)(*((void *)self->m_destinationBitmaps + 1) - *(void *)self->m_destinationBitmaps) >> 3];
  m_destinationBitmaps = self->m_destinationBitmaps;
  v5 = (void *)*m_destinationBitmaps;
  if (*m_destinationBitmaps != m_destinationBitmaps[1])
  {
    do
    {
      uint64_t v6 = *v5;
      if (*v5)
      {
        (*(void (**)(void))(*(void *)v6 + 16))(*v5);
        uint64_t v8 = v6;
        (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
      }
      else
      {
        uint64_t v8 = 0;
      }
      BOOL v7 = +[PVImageBuffer imageWithHGBitmap:&v8];
      if (v8) {
        (*(void (**)(uint64_t))(*(void *)v8 + 24))(v8);
      }
      [v3 addObject:v7];

      if (v6) {
        (*(void (**)(uint64_t))(*(void *)v6 + 24))(v6);
      }
      ++v5;
    }
    while (v5 != *((void **)self->m_destinationBitmaps + 1));
  }
  (*((void (**)(void))self->m_completionHandler + 2))();
}

- (void)finishCancelledJob
{
}

- (void)renderJobFinished:(HGRef<PVRenderJob>)a3
{
  m_pvuint64_t Renderer = self->m_pvRenderer;
  uint64_t v4 = *(void *)a3.var0;
  uint64_t v5 = v4;
  if (v4) {
    (*(void (**)(uint64_t, SEL))(*(void *)v4 + 16))(v4, a2);
  }
  [(PVRenderer *)m_pvRenderer renderJobFinished:&v5];
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
  }
}

- (int)jobPriority
{
  unsigned int v2 = [(PVRenderRequest *)self->m_request priority];
  if (v2 >= 3) {
    return 5;
  }
  else {
    return 5 * v2;
  }
}

- (int)graphBuildThreadPriority
{
  return 0;
}

- (int)renderThreadPriority
{
  unsigned int v2 = [(PVRenderRequest *)self->m_request gcdPriority];
  if (v2 <= 2) {
    return v2 + 1;
  }
  else {
    return 2;
  }
}

- (int)renderContextPriority
{
  unsigned int v2 = [(PVRenderRequest *)self->m_request gpuPriority];
  if (v2 >= 3) {
    return 5;
  }
  else {
    return 5 * v2;
  }
}

- (unint64_t)packedFamilyCode
{
  uint64_t v3 = [(PVRenderRequest *)self->m_request parentCode];
  return [(PVRenderRequest *)self->m_request childCode] | (unint64_t)(v3 << 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->m_completionHandler, 0);
  m_Obj = self->m_renderManager.m_Obj;
  if (m_Obj) {
    (*(void (**)(PVRenderManager *))(*(void *)m_Obj + 24))(m_Obj);
  }
  objc_storeStrong((id *)&self->m_request, 0);

  objc_storeStrong((id *)&self->m_pvRenderer, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end