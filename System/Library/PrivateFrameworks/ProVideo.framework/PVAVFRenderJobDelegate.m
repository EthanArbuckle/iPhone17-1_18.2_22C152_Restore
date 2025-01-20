@interface PVAVFRenderJobDelegate
+ (unsigned)jobTypeTag;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)compositionTime;
- (AVAsynchronousVideoCompositionRequest)compositionRequest;
- (PVAVFRenderJobDelegate)initWithCompositor:(id)a3 request:(id)a4 compositionTime:(id *)a5 thumbnailCompositing:(BOOL)a6;
- (PVTaskToken)token;
- (PVVideoCompositingContext)videoCompositingContext;
- (PVVideoCompositionInstruction)compositionInstruction;
- (id).cxx_construct;
- (int)jobPriority;
- (int)renderContextPriority;
- (int)renderThreadPriority;
- (unint64_t)packedFamilyCode;
- (unsigned)childCode;
- (unsigned)jobTypeTag;
- (unsigned)minimumRequestCompletionTimeMS;
- (unsigned)parentCode;
- (void)_buildGraph:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5 outputNodes:(void *)a6;
- (void)_setupInputs:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5;
- (void)buildGraph:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5;
- (void)finishCancelledJob;
- (void)finishCompletedJob;
- (void)renderJobFinished:(HGRef<PVRenderJob>)a3;
- (void)setChildCode:(unsigned int)a3;
- (void)setMinimumRequestCompletionTimeMS:(unsigned int)a3;
- (void)setParentCode:(unsigned int)a3;
- (void)setToken:(id)a3;
- (void)setupDestinationBuffers:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5;
@end

@implementation PVAVFRenderJobDelegate

+ (unsigned)jobTypeTag
{
  return 10000;
}

- (PVAVFRenderJobDelegate)initWithCompositor:(id)a3 request:(id)a4 compositionTime:(id *)a5 thumbnailCompositing:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PVAVFRenderJobDelegate;
  v13 = [(PVAVFRenderJobDelegate *)&v37 init];
  v14 = v13;
  if (v13)
  {
    p_m_compositor = (id *)&v13->m_compositor;
    objc_storeStrong((id *)&v13->m_compositor, a3);
    objc_storeStrong((id *)&v14->m_request, a4);
    uint64_t v16 = [(AVAsynchronousVideoCompositionRequest *)v14->m_request videoCompositionInstruction];
    m_instruction = v14->m_instruction;
    v14->m_instruction = (PVVideoCompositionInstruction *)v16;

    long long v18 = *(_OWORD *)&a5->var0;
    v14->m_compositionTime.epoch = a5->var3;
    *(_OWORD *)&v14->m_compositionTime.CMTimeValue value = v18;
    v14->m_thumbnailCompositing = a6;
    v14->m_minimumRequestCompletionTimeMS = 0;
    PerfTimer::Start(&v14->m_timer);
    v19 = (PVRenderManager *)[(PVAVFRenderJobDelegate *)v14 jobTypeTag];
    v14->m_parentCode = v19;
    v14->m_childCode = 0;
    PVRenderManager::INSTANCE(v19, &time);
    m_Obj = v14->m_renderManager.m_Obj;
    CMTimeValue value = time.value;
    if (m_Obj == (PVRenderManager *)time.value)
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
        CMTimeValue value = time.value;
      }
      v14->m_renderManager.m_Obj = (PVRenderManager *)value;
    }
    v22 = [*p_m_compositor videoCompositingContext];
    v23 = [(AVAsynchronousVideoCompositionRequest *)v14->m_request renderContext];
    char v24 = [*p_m_compositor thumbnailCompositing];
    v25 = (PVAVFInstructionGraphContext *)HGObject::operator new(0x88uLL);
    PVAVFInstructionGraphContext::PVAVFInstructionGraphContext(v25, v22, v23, v24);
    v26 = (PVAVFInstructionGraphContext *)v14->m_instructionGraphContext.m_Obj;
    if (v26 == v25)
    {
      if (v25) {
        (*(void (**)(PVAVFInstructionGraphContext *))(*(void *)v25 + 24))(v25);
      }
    }
    else
    {
      if (v26) {
        (*(void (**)(PVAVFInstructionGraphContext *))(*(void *)v26 + 24))(v26);
      }
      v14->m_instructionGraphContext.m_Obj = (PVInstructionGraphContext *)v25;
    }

    v27 = NSString;
    CMTimeValue v28 = v14->m_compositionTime.value;
    uint64_t timescale = v14->m_compositionTime.timescale;
    *(void *)&time.flags = *(void *)&v14->m_compositionTime.flags;
    HIDWORD(time.epoch) = HIDWORD(v14->m_compositionTime.epoch);
    time.CMTimeValue value = v28;
    time.uint64_t timescale = timescale;
    v30 = objc_msgSend(NSString, "stringWithFormat:", @"{%lld/%d = %.3f}", v28, timescale, CMTimeGetSeconds(&time));
    v31 = [v27 stringWithFormat:@"RequestTime: %@", v30];

    v32 = (id *)v14->m_instructionGraphContext.m_Obj;
    id v33 = v31;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v33 UTF8String]);
    PVInstructionGraphContext::AddContextDotNode(v32, (uint64_t)__p);
    if (v36 < 0) {
      operator delete(__p[0]);
    }
  }
  return v14;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)compositionTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (PVVideoCompositionInstruction)compositionInstruction
{
  return (PVVideoCompositionInstruction *)[(AVAsynchronousVideoCompositionRequest *)self->m_request videoCompositionInstruction];
}

- (AVAsynchronousVideoCompositionRequest)compositionRequest
{
  return self->m_request;
}

- (unsigned)jobTypeTag
{
  v2 = objc_opt_class();

  return [v2 jobTypeTag];
}

- (PVVideoCompositingContext)videoCompositingContext
{
  return [(PVVideoCompositing *)self->m_compositor videoCompositingContext];
}

- (int)jobPriority
{
  if (self->m_thumbnailCompositing) {
    return 0;
  }
  else {
    return 6;
  }
}

- (int)renderThreadPriority
{
  v3 = [(AVAsynchronousVideoCompositionRequest *)self->m_request renderContext];
  if ([v3 highQualityRendering])
  {
    BOOL v4 = [(PVVideoCompositing *)self->m_compositor shouldDoLowPowerExport];

    if (v4) {
      return 1;
    }
    else {
      return 3;
    }
  }
  else
  {

    return 3;
  }
}

- (int)renderContextPriority
{
  v3 = [(AVAsynchronousVideoCompositionRequest *)self->m_request renderContext];
  if ([v3 highQualityRendering])
  {
    BOOL v4 = [(PVVideoCompositing *)self->m_compositor shouldDoLowPowerExport];

    if (v4) {
      return 0;
    }
    else {
      return 5;
    }
  }
  else
  {

    return 5;
  }
}

- (void)buildGraph:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5
{
  v9 = v10;
  v10[0] = 0;
  v11[0] = 0;
  v11[1] = 0;
  v10[1] = 0;
  v10[2] = v11;
  v11[2] = v12;
  v12[0] = 0;
  v13[0] = 0;
  v13[1] = 0;
  v12[1] = 0;
  v12[2] = v13;
  v13[2] = v14;
  v14[0] = 0;
  v15[0] = 0;
  v15[1] = 0;
  v14[1] = 0;
  v14[2] = v15;
  -[PVAVFRenderJobDelegate _setupInputs:renderContext:frameStats:](self, "_setupInputs:renderContext:frameStats:", &v9);
  [(PVAVFRenderJobDelegate *)self _buildGraph:&v9 renderContext:a4 frameStats:a5 outputNodes:a3];
  PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::~PVInputHGNodeMap(&v9);
}

- (void)_setupInputs:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", a2) >= 1)
  {
    [(PVAVFRenderJobDelegate *)self packedFamilyCode];
    kdebug_trace();
  }
  PerfTimer::PerfTimer(&v93);
  PerfTimer::Start(&v93);
  v47 = [(AVAsynchronousVideoCompositionRequest *)self->m_request sourceTrackIDs];
  if (+[PVEnvironment PV_MULTI_SOURCE_PLAYBACK_FPS]
    && *((unsigned char *)a5 + 56)
    && (unint64_t)[v47 count] <= 1)
  {
    *((unsigned char *)a5 + 56) = 0;
  }
  if (v47 && [v47 count])
  {
    id v56 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7 = [(PVVideoCompositionInstruction *)self->m_instruction outputNode];
    v8 = [v7 getAllSourceNodes];

    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    obuint64_t j = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v88 objects:v99 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v89;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v89 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v88 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = v12;
            v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "trackID"));
            v15 = [v56 objectForKeyedSubscript:v14];
            BOOL v16 = v15 == 0;

            if (v16)
            {
              id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [v56 setObject:v17 forKeyedSubscript:v14];
            }
            long long v18 = [v56 objectForKeyedSubscript:v14];
            [v18 addObject:v13];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v88 objects:v99 count:16];
      }
      while (v9);
    }

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v54 = obj;
    uint64_t v19 = [v54 countByEnumeratingWithState:&v84 objects:v98 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v85;
      uint64_t v49 = *(void *)v85;
      do
      {
        uint64_t v21 = 0;
        uint64_t v52 = v19;
        do
        {
          if (*(void *)v85 != v20) {
            objc_enumerationMutation(v54);
          }
          v22 = *(void **)(*((void *)&v84 + 1) + 8 * v21);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v23 = v22;
            *((void *)&v60 + 1) = 0;
            double v61 = 0.0;
            *(void *)&long long v60 = (char *)&v60 + 8;
            char v24 = [v23 requiredSourceTrackIDs];
            id v58 = v23;
            long long v82 = 0u;
            long long v83 = 0u;
            long long v80 = 0u;
            long long v81 = 0u;
            id v25 = v24;
            uint64_t v26 = [v25 countByEnumeratingWithState:&v80 objects:v97 count:16];
            if (v26)
            {
              uint64_t v27 = *(void *)v81;
              do
              {
                for (uint64_t j = 0; j != v26; ++j)
                {
                  if (*(void *)v81 != v27) {
                    objc_enumerationMutation(v25);
                  }
                  v29 = *(void **)(*((void *)&v80 + 1) + 8 * j);
                  int v79 = 0;
                  uint64_t v30 = [v29 intValue];
                  int v79 = v30;
                  if (v30)
                  {
                    v31 = [(AVAsynchronousVideoCompositionRequest *)self->m_request sourceFrameByTrackID:v30];
                    v94 = &v79;
                    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v60, &v79, (uint64_t)&std::piecewise_construct, &v94)[5] = (uint64_t *)v31;
                  }
                }
                uint64_t v26 = [v25 countByEnumeratingWithState:&v80 objects:v97 count:16];
              }
              while (v26);
            }

            uint64_t v20 = v49;
            uint64_t v19 = v52;
            if (v58)
            {
              [v58 nodeForCompositeTrackMap:&v60];
              v78 = v94;
              if (v94) {
                (*(void (**)(int *))(*(void *)v94 + 16))(v94);
              }
            }
            else
            {
              v94 = 0;
              v78 = 0;
            }
            PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::SetNode((uint64_t **)a3, v58, (uint64_t *)&v78);
            if (v78) {
              (*(void (**)(int *))(*(void *)v78 + 24))(v78);
            }
            if (v94) {
              (*(void (**)(int *))(*(void *)v94 + 24))(v94);
            }

            std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&v60, *((void **)&v60 + 1));
          }
          ++v21;
        }
        while (v21 != v19);
        uint64_t v19 = [v54 countByEnumeratingWithState:&v84 objects:v98 count:16];
      }
      while (v19);
    }

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v48 = v47;
    uint64_t v51 = [v48 countByEnumeratingWithState:&v74 objects:v96 count:16];
    if (v51)
    {
      uint64_t v50 = *(void *)v75;
      do
      {
        for (uint64_t k = 0; k != v51; ++k)
        {
          if (*(void *)v75 != v50) {
            objc_enumerationMutation(v48);
          }
          v32 = *(void **)(*((void *)&v74 + 1) + 8 * k);
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          id v59 = [v56 objectForKeyedSubscript:v32];
          uint64_t v33 = [v59 countByEnumeratingWithState:&v70 objects:v95 count:16];
          if (v33)
          {
            uint64_t v34 = *(void *)v71;
            do
            {
              for (uint64_t m = 0; m != v33; ++m)
              {
                if (*(void *)v71 != v34) {
                  objc_enumerationMutation(v59);
                }
                char v36 = *(void **)(*((void *)&v70 + 1) + 8 * m);
                uint64_t v37 = [v32 intValue];
                if (v37)
                {
                  v38 = [(AVAsynchronousVideoCompositionRequest *)self->m_request sourceFrameByTrackID:v37];
                  if (v38)
                  {
                    if ([v36 dataTrackID])
                    {
                      HGCVBitmap::create((HGCVPixelBuffer *)-[AVAsynchronousVideoCompositionRequest sourceFrameByTrackID:](self->m_request, "sourceFrameByTrackID:", [v36 dataTrackID]), 1, 0, &v60);
                      uint64_t v67 = v60;
                      if ((void)v60) {
                        (*(void (**)(void))(*(void *)v60 + 16))(v60);
                      }
                      PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::SetFrameDataPixelBuffer((uint64_t)a3, v36, &v67);
                      if (v67) {
                        (*(void (**)(uint64_t))(*(void *)v67 + 24))(v67);
                      }
                      if ((void)v60) {
                        (*(void (**)(void))(*(void *)v60 + 24))(v60);
                      }
                    }
                    if ([v36 depthTrackID]
                      && [v36 metadataTrackID])
                    {
                      v39 = -[AVAsynchronousVideoCompositionRequest sourceTimedMetadataByTrackID:](self->m_request, "sourceTimedMetadataByTrackID:", [v36 metadataTrackID]);
                      if (v39) {
                        [v36 setTimedMetadataGroup:v39];
                      }
                    }
                    long long v65 = *(_OWORD *)&self->m_compositionTime.value;
                    int64_t epoch = self->m_compositionTime.epoch;
                    m_Obuint64_t j = self->m_instructionGraphContext.m_Obj;
                    v64 = m_Obj;
                    if (m_Obj) {
                      (*(void (**)(PVInstructionGraphContext *))(*(void *)m_Obj + 16))(m_Obj);
                    }
                    PVCreateInputGraphForPixelBuffer(v38, &v64, (HGNode **)&v94);
                    if (v64) {
                      (*(void (**)(PVInstructionGraphContext *))(*(void *)v64 + 24))(v64);
                    }
                    v63 = v94;
                    if (v94) {
                      (*(void (**)(int *))(*(void *)v94 + 16))(v94);
                    }
                    PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::SetNode((uint64_t **)a3, v36, (uint64_t *)&v63);
                    if (v63) {
                      (*(void (**)(int *))(*(void *)v63 + 24))(v63);
                    }
                    size_t Width = CVPixelBufferGetWidth(v38);
                    size_t Height = CVPixelBufferGetHeight(v38);
                    long long v60 = 0uLL;
                    double v61 = (double)Width;
                    double v62 = (double)Height;
                    __n128 v43 = PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::SetInputSize((uint64_t)a3, v36, &v60);
                    if (v94) {
                      (*(void (**)(int *, __n128))(*(void *)v94 + 24))(v94, v43);
                    }
                  }
                  else
                  {
                    v44 = (HGNode *)HGObject::operator new(0x1A0uLL);
                    HGNode::HGNode(v44);
                    v68 = v44;
                    if (v44) {
                      (*(void (**)(HGNode *))(*(void *)v44 + 16))(v44);
                    }
                    PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::SetNode((uint64_t **)a3, v36, (uint64_t *)&v68);
                    if (v68) {
                      (*(void (**)(HGNode *))(*(void *)v68 + 24))(v68);
                    }
                    if (v44) {
                      goto LABEL_91;
                    }
                  }
                }
                else
                {
                  v44 = (HGNode *)HGObject::operator new(0x1A0uLL);
                  HGNode::HGNode(v44);
                  v69 = v44;
                  if (v44) {
                    (*(void (**)(HGNode *))(*(void *)v44 + 16))(v44);
                  }
                  PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::SetNode((uint64_t **)a3, v36, (uint64_t *)&v69);
                  if (v69) {
                    (*(void (**)(HGNode *))(*(void *)v69 + 24))(v69);
                  }
                  if (v44)
                  {
LABEL_91:
                    (*(void (**)(HGNode *))(*(void *)v44 + 24))(v44);
                    continue;
                  }
                }
              }
              uint64_t v33 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v70, v95, 16, v43.n128_f64[0]);
            }
            while (v33);
          }
        }
        uint64_t v51 = [v48 countByEnumeratingWithState:&v74 objects:v96 count:16];
      }
      while (v51);
    }
  }
  else
  {
    v45 = (HGNode *)HGObject::operator new(0x1A0uLL);
    HGNode::HGNode(v45);
    v92 = v45;
    if (v45) {
      (*(void (**)(HGNode *))(*(void *)v45 + 16))(v45);
    }
    PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::SetNode((uint64_t **)a3, 0, (uint64_t *)&v92);
    if (v92) {
      (*(void (**)(HGNode *))(*(void *)v92 + 24))(v92);
    }
    if (v45) {
      (*(void (**)(HGNode *))(*(void *)v45 + 24))(v45);
    }
  }
  PerfTimer::End(&v93);
  PVPerfStats::FrameStats::SetValueForIndex((uint64_t)a5, 1u, v93._end - v93._start);
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v46) >= 1) {
    kdebug_trace();
  }
}

- (void)_buildGraph:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5 outputNodes:(void *)a6
{
  uint64_t Renderer = HGRenderContext::GetRenderer((HGRenderContext *)a4);
  uint64_t v10 = (HGRenderer *)Renderer;
  if (Renderer) {
    (*(void (**)(uint64_t))(*(void *)Renderer + 16))(Renderer);
  }
  long long v84 = 0;
  long long v85 = v10;
  id v11 = [(PVVideoCompositionInstruction *)self->m_instruction outputNode];

  if (v11)
  {
    if ((int)HGLogger::getLevel((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", v12) >= 1)
    {
      CMTime time = (CMTime)self->m_compositionTime;
      v15 = CMTimeCopyDescription(0, &time);
      BOOL v16 = v15;
      unsigned __int8 v17 = atomic_load(HGLogger::_enabled);
      if (v17)
      {
        uint64_t v18 = [v15 UTF8String];
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Current Time:           %s\n", v19, v20, v18);
      }
      CFRelease(v16);
      m_instruction = self->m_instruction;
      if (m_instruction) {
        [(PVVideoCompositionInstruction *)m_instruction timeRange];
      }
      else {
        memset(&range, 0, sizeof(range));
      }
      char v24 = CMTimeRangeCopyDescription(0, &range);

      unsigned __int8 v25 = atomic_load(HGLogger::_enabled);
      if (v25)
      {
        uint64_t v26 = [v24 UTF8String];
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Instruction Time Range: %s\n", v27, v28, v26);
      }
      CFRelease(v24);
    }
    v29 = [(PVVideoCompositionInstruction *)self->m_instruction outputNode];
    long long v79 = *(_OWORD *)&self->m_compositionTime.value;
    int64_t epoch = self->m_compositionTime.epoch;
    m_Obuint64_t j = self->m_instructionGraphContext.m_Obj;
    v78 = m_Obj;
    if (m_Obj) {
      (*(void (**)(PVInstructionGraphContext *))(*(void *)m_Obj + 16))(m_Obj);
    }
    if (v29)
    {
      [v29 hgNodeForTime:&v79 trackInputs:a3 renderer:&v85 igContext:&v78];
      v31 = v81;
      v32 = v84;
      if (v84 == v81)
      {
        if (v81) {
          (*(void (**)(void))(*(void *)v81 + 24))();
        }
        goto LABEL_26;
      }
      if (!v84) {
        goto LABEL_25;
      }
    }
    else
    {
      long long v81 = 0;
      v32 = v84;
      if (!v84)
      {
LABEL_26:
        if (v78) {
          (*(void (**)(PVInstructionGraphContext *))(*(void *)v78 + 24))(v78);
        }

        goto LABEL_29;
      }
    }
    (*(void (**)(HGNode *))(*(void *)v32 + 24))(v32);
    v31 = v81;
LABEL_25:
    long long v84 = v31;
    long long v81 = 0;
    goto LABEL_26;
  }
  unsigned __int8 v22 = atomic_load(HGLogger::_enabled);
  if (v22) {
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"instruction.outputNode is nil; returning empty HGNode\n",
  }
      v13,
      v14);
  id v23 = (HGNode *)HGObject::operator new(0x1A0uLL);
  HGNode::HGNode(v23);
  if (v84 == v23)
  {
    if (v23) {
      (*(void (**)(HGNode *))(*(void *)v23 + 24))(v23);
    }
  }
  else
  {
    long long v84 = v23;
  }
LABEL_29:
  if (+[PVEnvironment PV_HIGHLIGHT_OUT_OF_GAMUT])
  {
    uint64_t v33 = (HgcHighlightOutOfGamut *)HGObject::operator new(0x1A0uLL);
    HgcHighlightOutOfGamut::HgcHighlightOutOfGamut(v33);
    (*(void (**)(HgcHighlightOutOfGamut *, void, HGNode *))(*(void *)v33 + 120))(v33, 0, v84);
    if (v84 != (HGNode *)v33)
    {
      if (v84) {
        (*(void (**)(HGNode *))(*(void *)v84 + 24))(v84);
      }
      long long v84 = (HGNode *)v33;
      (*(void (**)(HgcHighlightOutOfGamut *))(*(void *)v33 + 16))(v33);
    }
    (*(void (**)(HgcHighlightOutOfGamut *))(*(void *)v33 + 24))(v33);
  }
  if (+[PVEnvironment PVHighlightHDRRegions])
  {
    uint64_t v34 = PVInstructionGraphContext::WorkingColorSpace(self->m_instructionGraphContext.m_Obj);
    v35 = +[PVColorSpace rec2020LinearColorSpace];
    if (([v34 isEqual:v35] & 1) == 0)
    {
      long long v77 = (HGColorConform *)v84;
      if (v84) {
        (*(void (**)(HGNode *))(*(void *)v84 + 16))(v84);
      }
      ColorConformInput(&v77, v34, v35, 0, 0, (HGColorConform **)&v81);
      char v36 = v81;
      if (v84 == v81)
      {
        if (v84) {
          (*(void (**)(HGNode *))(*(void *)v84 + 24))(v84);
        }
      }
      else
      {
        if (v84)
        {
          (*(void (**)(HGNode *))(*(void *)v84 + 24))(v84);
          char v36 = v81;
        }
        long long v84 = v36;
        long long v81 = 0;
      }
      if (v77) {
        (*(void (**)(HGColorConform *))(*(void *)v77 + 24))(v77);
      }
    }
    uint64_t v37 = (HgcHighlightHDRRegion *)HGObject::operator new(0x1A0uLL);
    HgcHighlightHDRRegion::HgcHighlightHDRRegion(v37);
    (*(void (**)(HgcHighlightHDRRegion *, void, HGNode *))(*(void *)v37 + 120))(v37, 0, v84);
    if (v84 != (HGNode *)v37)
    {
      if (v84) {
        (*(void (**)(HGNode *))(*(void *)v84 + 24))(v84);
      }
      long long v84 = (HGNode *)v37;
      (*(void (**)(HgcHighlightHDRRegion *))(*(void *)v37 + 16))(v37);
    }
    if (([v34 isEqual:v35] & 1) == 0)
    {
      long long v76 = (HGColorConform *)v84;
      if (v84) {
        (*(void (**)(HGNode *))(*(void *)v84 + 16))(v84);
      }
      ColorConformInput(&v76, v35, v34, 0, 0, (HGColorConform **)&v81);
      v38 = v81;
      if (v84 == v81)
      {
        if (v84) {
          (*(void (**)(HGNode *))(*(void *)v84 + 24))(v84);
        }
      }
      else
      {
        if (v84)
        {
          (*(void (**)(HGNode *))(*(void *)v84 + 24))(v84);
          v38 = v81;
        }
        long long v84 = v38;
        long long v81 = 0;
      }
      if (v76) {
        (*(void (**)(HGColorConform *))(*(void *)v76 + 24))(v76);
      }
    }
    (*(void (**)(HgcHighlightHDRRegion *))(*(void *)v37 + 24))(v37);
  }
  long long v75 = (HGColorConform *)v84;
  if (v84) {
    (*(void (**)(HGNode *))(*(void *)v84 + 16))(v84);
  }
  v39 = PVInstructionGraphContext::WorkingColorSpace(self->m_instructionGraphContext.m_Obj);
  v40 = PVInstructionGraphContext::OutputColorSpace(self->m_instructionGraphContext.m_Obj);
  id v74 = 0;
  ColorConformInput(&v75, v39, v40, 1, &v74, (HGColorConform **)&v81);
  id v41 = v74;
  v42 = v81;
  if (v84 == v81)
  {
    if (v84) {
      (*(void (**)(HGNode *))(*(void *)v84 + 24))(v84);
    }
  }
  else
  {
    if (v84)
    {
      (*(void (**)(HGNode *))(*(void *)v84 + 24))(v84);
      v42 = v81;
    }
    long long v84 = v42;
    long long v81 = 0;
  }

  if (v75) {
    (*(void (**)(HGColorConform *))(*(void *)v75 + 24))(v75);
  }
  if (v41) {
    NSLog(&cfstr_ConformError.isa, v41);
  }
  __n128 v43 = [(PVVideoCompositing *)self->m_compositor requiredPixelBufferAttributesForRenderContext];
  v44 = [v43 objectForKey:*MEMORY[0x1E4F24D70]];
  v45 = [v44 objectAtIndex:0];
  int v46 = [v45 unsignedIntValue];

  if (PVIsMultiplaneCoreVideo420Format(v46) || PVIsMultiplaneCoreVideo422Format(v46))
  {
    id v73 = v41;
    v47 = [(AVAsynchronousVideoCompositionRequest *)self->m_request renderContext];
    [v47 size];
    double v49 = v48;
    uint64_t v50 = [(AVAsynchronousVideoCompositionRequest *)self->m_request renderContext];
    [v50 renderScale];
    float v52 = v51;

    v53 = [(AVAsynchronousVideoCompositionRequest *)self->m_request renderContext];
    [v53 size];
    double v55 = v54;
    id v56 = [(AVAsynchronousVideoCompositionRequest *)self->m_request renderContext];
    [v56 renderScale];
    v57 = (uint64_t *)a6;
    int v58 = (int)(v49 * v52);
    unsigned int v60 = (int)(v55 * v59);

    int v61 = v58 & 1;
    if (v58 < 0) {
      int v61 = -v61;
    }
    uint64_t v62 = HGRectMake4i(0, 0, v61 + v58, v60);
    uint64_t v64 = v63;
    uint64_t DOD = HGRenderer::GetDOD(v85, v84);
    uint64_t v67 = v66;
    v68 = PVInstructionGraphContext::OutputColorSpace(self->m_instructionGraphContext.m_Obj);
    v69 = [v68 nclcTriplet];

    PVCreateYUVPlanesWithBackfillBlackBackground(DOD, v67, v62, v64, &v84, v69, v46, v57);
    id v41 = v73;
  }
  else
  {
    long long v70 = (void *)*((void *)a6 + 1);
    if ((unint64_t)v70 >= *((void *)a6 + 2))
    {
      uint64_t v72 = std::vector<HGRef<HGNode>>::__push_back_slow_path<HGRef<HGNode> const&>((uint64_t *)a6, (uint64_t *)&v84);
    }
    else
    {
      long long v71 = v84;
      *long long v70 = v84;
      if (v71) {
        (*(void (**)(HGNode *))(*(void *)v71 + 16))(v71);
      }
      uint64_t v72 = (uint64_t)(v70 + 1);
      *((void *)a6 + 1) = v70 + 1;
    }
    *((void *)a6 + 1) = v72;
  }

  if (v84) {
    (*(void (**)(HGNode *))(*(void *)v84 + 24))(v84);
  }
  if (v85) {
    (*(void (**)(HGRenderer *))(*(void *)v85 + 24))(v85);
  }
}

- (void)setupDestinationBuffers:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5
{
  m_destinationPixelBuffer = self->m_destinationPixelBuffer;
  if (!m_destinationPixelBuffer)
  {
    uint64_t v9 = [(AVAsynchronousVideoCompositionRequest *)self->m_request renderContext];
    self->m_destinationPixelBuffer = (__CVBuffer *)[v9 newPixelBuffer];

    m_destinationPixelBuffer = self->m_destinationPixelBuffer;
  }

  PVCreateOutputBufferForHGCVPixelBuffer(m_destinationPixelBuffer, (HGRenderContext *)a4, (uint64_t *)a3);
}

- (void)finishCompletedJob
{
  PerfTimer::End(&self->m_timer);
  HIDWORD(v3) = 1083129856;
  double v4 = (self->m_timer._end - self->m_timer._start) * 1000.0;
  LODWORD(v3) = self->m_minimumRequestCompletionTimeMS;
  double v5 = (double)v3;
  if (v4 < v5) {
    usleep(1000 * (v5 - v4));
  }
  [(AVAsynchronousVideoCompositionRequest *)self->m_request finishWithComposedVideoFrame:self->m_destinationPixelBuffer];
  CVPixelBufferRelease(self->m_destinationPixelBuffer);
  self->m_destinationPixelBuffer = 0;
}

- (void)finishCancelledJob
{
  [(AVAsynchronousVideoCompositionRequest *)self->m_request finishCancelledRequest];
  m_destinationPixelBuffer = self->m_destinationPixelBuffer;
  if (m_destinationPixelBuffer)
  {
    CVPixelBufferRelease(m_destinationPixelBuffer);
    self->m_destinationPixelBuffer = 0;
  }
}

- (void)renderJobFinished:(HGRef<PVRenderJob>)a3
{
  m_compositor = self->m_compositor;
  uint64_t v4 = *(void *)a3.var0;
  uint64_t v5 = v4;
  if (v4) {
    (*(void (**)(uint64_t, SEL))(*(void *)v4 + 16))(v4, a2);
  }
  [(PVVideoCompositing *)m_compositor renderRequestFinished:&v5];
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
  }
}

- (unint64_t)packedFamilyCode
{
  unsigned int v3 = [(PVAVFRenderJobDelegate *)self parentCode];
  uint64_t v4 = [(AVAsynchronousVideoCompositionRequest *)self->m_request renderContext];
  int v5 = [v4 highQualityRendering];

  LODWORD(v6) = v3 + 100;
  if (v5) {
    uint64_t v6 = v6;
  }
  else {
    uint64_t v6 = v3;
  }
  return self->m_childCode | (unint64_t)(v6 << 32);
}

- (unsigned)minimumRequestCompletionTimeMS
{
  return self->m_minimumRequestCompletionTimeMS;
}

- (void)setMinimumRequestCompletionTimeMS:(unsigned int)a3
{
  self->m_minimumRequestCompletionTimeMS = a3;
}

- (unsigned)parentCode
{
  return self->m_parentCode;
}

- (void)setParentCode:(unsigned int)a3
{
  self->m_parentCode = a3;
}

- (unsigned)childCode
{
  return self->m_childCode;
}

- (void)setChildCode:(unsigned int)a3
{
  self->m_childCode = a3;
}

- (PVTaskToken)token
{
  return (PVTaskToken *)objc_getProperty(self, a2, 128, 1);
}

- (void)setToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  m_Obuint64_t j = self->m_instructionGraphContext.m_Obj;
  if (m_Obj) {
    (*(void (**)(PVInstructionGraphContext *))(*(void *)m_Obj + 24))(m_Obj);
  }
  uint64_t v4 = self->m_renderManager.m_Obj;
  if (v4) {
    (*(void (**)(PVRenderManager *))(*(void *)v4 + 24))(v4);
  }
  objc_storeStrong((id *)&self->m_instruction, 0);
  objc_storeStrong((id *)&self->m_request, 0);

  objc_storeStrong((id *)&self->m_compositor, 0);
}

- (id).cxx_construct
{
  self->m_renderManager.m_Obuint64_t j = 0;
  self->m_instructionGraphContext.m_Obuint64_t j = 0;
  return self;
}

@end