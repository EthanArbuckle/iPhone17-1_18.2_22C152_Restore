@interface affineGPUMetal
- (FigMetalContext)metalContext;
- (affineGPUMetal)initWithMetalContext:(id)a3;
- (id)_allocatePyramidWithPixelFormat:(unint64_t)a3 bottomLevelWidth:(unint64_t)a4 bottomLevelHeight:(unint64_t)a5 scaleFactor:(unint64_t)a6 includeBottomLevel:(BOOL)a7 minimumDimension:(unint64_t)a8;
- (id)_compileShader:(id)a3 fragment:(id)a4 pixelFormat:(unint64_t)a5 deltaMapPixelFormat:(unint64_t)a6 unstyledPixelFormat:(unint64_t)a7 constants:(id)a8;
- (int)_allocateSemanticStyleColorCubeTextures;
- (int)_blurDeltaMapBordersFromStyledPixelBuffer:(__CVBuffer *)a3 withUnstyledPixelBuffer:(__CVBuffer *)a4 to:(__CVBuffer *)a5;
- (int)_cachedTexturesFromPixelBuffer:(__CVBuffer *)a3 isTwoPass:(BOOL)a4 isOptimized:(BOOL)a5 textures:(id *)a6;
- (int)_createRenderPipelinesForShaders:(id)a3;
- (int)_duplicateBottomRowsOnPixelBuffer:(__CVBuffer *)a3;
- (int)_getBlurDeltaMapBordersShaderParameters:(unint64_t)a3 pipelineIndexToUse:(int *)a4;
- (int)_getBlurShaderParameters:(unint64_t)a3 pipelineIndexToUse:(int *)a4;
- (int)_getTransformShaderParameters:(unint64_t)a3 isLuma:(BOOL)a4 isRGB:(BOOL)a5 isAttachment:(BOOL)a6 pixelRatio:(unsigned int *)a7 pipelineIndexToUse:(int *)a8;
- (int)_initBlurShaders;
- (int)_initComputeShaders;
- (int)_initTransformShaders;
- (int)_renderBlurInputTextures:(id *)a3 inputTexturesCount:(unsigned int)a4 outputTextures:(id *)a5;
- (int)_transformInputPixelBuffer:(__CVBuffer *)a3 outputPixelBuffer:(__CVBuffer *)a4 ltmLUT:(id)a5 isAttachment:(BOOL)a6 commandBuffer:(id)a7;
- (int)getBlurBuffersDecimationFactor;
- (int)renderWithPixelBuffer:(__CVBuffer *)a3 metadata:(id)a4 pixelBufferValidRect:(CGRect *)a5 ltmLUT:(id)a6 outputPixelBuffer:(__CVBuffer *)a7 isAttachmentRendering:(BOOL)a8;
- (int)renderWithSampleBuffer:(opaqueCMSampleBuffer *)a3 pixelBufferValidRect:(CGRect *)a4 ltmLUT:(id)a5 outputPixelBuffer:(__CVBuffer *)a6 isAttachmentRendering:(BOOL)a7;
- (int)setTransformsArray:(float *)(a3 transforms3x3:transformStrides:inputSize:outputSize:pixelBufferValidRect:isQuadraSensor:;
- (int)updateCubesIfNeeded;
- (void)_addCommandBufferHandler:(id)a3;
- (void)_blurDuplicatedPixelsOnPixelBuffer:(__CVBuffer *)a3 validBufferRect:(CGRect *)a4 forDeltaMap:(BOOL)a5;
- (void)_deallocateTransformBuffers;
- (void)cacheSourcePixelBuffer:(__CVBuffer *)a3;
- (void)configureBlurWith:(id *)a3;
- (void)configureP3ToBT2020conversion:(BOOL)a3;
- (void)dealloc;
- (void)finish;
- (void)setFillExtendedRowsInOutputBuffer:(BOOL)a3;
- (void)setOverscan:(int)a3 height:(int)a4;
- (void)setPriority:(int)a3;
- (void)setRenderMethod:(int)a3;
@end

@implementation affineGPUMetal

- (int)_createRenderPipelinesForShaders:(id)a3
{
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    pipelineRenderStates = self->_pipelineRenderStates;
    uint64_t v7 = *(void *)v46;
    uint64_t v36 = *(void *)v46;
    while (2)
    {
      v8 = 0;
      v9 = v6;
      id v38 = v5;
      do
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v8);
        v11 = [v10 objectForKeyedSubscript:@"functionConstants"];
        id v6 = objc_alloc_init((Class)MTLFunctionConstantValues);

        if (!v6)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          int v34 = FigSignalErrorAt();
LABEL_20:

          goto LABEL_21;
        }
        v12 = [v10 objectForKeyedSubscript:@"index"];
        unsigned int v43 = [v12 unsignedIntValue];

        v13 = [v10 objectForKeyedSubscript:@"pixelFormat"];
        uint64_t v14 = [v13 unsignedIntValue];

        v15 = [v10 objectForKeyedSubscript:@"deltaMapPixelFormat"];
        unsigned int v41 = [v15 unsignedIntValue];

        v16 = [v10 objectForKeyedSubscript:@"unstyledPixelFormat"];
        unsigned int v40 = [v16 unsignedIntValue];

        v17 = [(FigMetalContext *)self->_metalContext device];
        uint64_t v42 = v14;
        MTLPixelFormatGetInfoForDevice();
        LOBYTE(v14) = v44[8];

        if ((v14 & 0x10) != 0)
        {
          if ([v11 count])
          {
            uint64_t v18 = 0;
            unsigned int v19 = 1;
            do
            {
              v44[0] = 0;
              v20 = [v11 objectAtIndexedSubscript:v18];
              v21 = [v20 objectAtIndexedSubscript:1];
              unsigned __int8 v22 = [v21 BOOLValue];

              v44[0] = v22;
              v23 = [v11 objectAtIndexedSubscript:v18];
              v24 = [v23 objectAtIndexedSubscript:0];
              unsigned int v25 = [v24 unsignedIntValue];
              int v26 = v44[0];
              if (!v25) {
                int v26 = self->_useBicubic & v44[0];
              }
              v44[0] = v26 != 0;

              v27 = [v11 objectAtIndexedSubscript:v18];
              v28 = [v27 objectAtIndexedSubscript:0];
              objc_msgSend(v6, "setConstantValue:type:atIndex:", v44, 53, objc_msgSend(v28, "unsignedIntValue"));

              uint64_t v18 = v19;
            }
            while ((unint64_t)[v11 count] > v19++);
          }
          v30 = [v10 objectForKeyedSubscript:@"vertName"];
          v31 = [v10 objectForKeyedSubscript:@"fragName"];
          uint64_t v32 = [(affineGPUMetal *)self _compileShader:v30 fragment:v31 pixelFormat:v42 deltaMapPixelFormat:v41 unstyledPixelFormat:v40 constants:v6];
          v33 = pipelineRenderStates[v43];
          pipelineRenderStates[v43] = (MTLRenderPipelineState *)v32;

          id v5 = v38;
          uint64_t v7 = v36;
          if (!pipelineRenderStates[v43])
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            int v34 = -12786;
            goto LABEL_20;
          }
        }

        v8 = (char *)v8 + 1;
        v9 = v6;
      }
      while (v8 != v5);
      id v5 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v5) {
        continue;
      }
      break;
    }
    int v34 = 0;
LABEL_21:
  }
  else
  {
    int v34 = 0;
  }

  return v34;
}

- (id)_compileShader:(id)a3 fragment:(id)a4 pixelFormat:(unint64_t)a5 deltaMapPixelFormat:(unint64_t)a6 unstyledPixelFormat:(unint64_t)a7 constants:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  v17 = v16;
  if (!v14 || !v15 || !v16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v18 = 0;
LABEL_19:
    id v35 = 0;
    goto LABEL_14;
  }
  uint64_t v18 = objc_opt_new();
  if (!v18) {
    goto LABEL_18;
  }
  unsigned int v19 = [(FigMetalContext *)self->_metalContext library];
  id v20 = [v19 newFunctionWithName:v14];
  [v18 setVertexFunction:v20];

  v21 = [v18 vertexFunction];

  if (!v21)
  {
LABEL_18:
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_19;
  }
  id v37 = v14;
  unsigned __int8 v22 = [(FigMetalContext *)self->_metalContext library];
  v23 = [(FigMetalContext *)self->_metalContext pipelineLibrary];
  id v24 = [v22 newFunctionWithName:v15 constantValues:v17 pipelineLibrary:v23 error:0];
  [v18 setFragmentFunction:v24];

  unsigned int v25 = [v18 fragmentFunction];

  if (v25)
  {
    int v26 = [(FigMetalContext *)self->_metalContext fullRangeVertexDesc];
    [v18 setVertexDescriptor:v26];

    v27 = [(FigMetalContext *)self->_metalContext pipelineLibrary];
    [v18 setPipelineLibrary:v27];

    v28 = [v18 colorAttachments];
    v29 = [v28 objectAtIndexedSubscript:0];
    [v29 setPixelFormat:a5];

    if (a6)
    {
      v30 = [v18 colorAttachments];
      v31 = [v30 objectAtIndexedSubscript:1];
      [v31 setPixelFormat:a6];
    }
    if (a7)
    {
      uint64_t v32 = [v18 colorAttachments];
      v33 = [v32 objectAtIndexedSubscript:2];
      [v33 setPixelFormat:a7];
    }
    int v34 = [(FigMetalContext *)self->_metalContext device];
    id v35 = [v34 newRenderPipelineStateWithDescriptor:v18 error:0];

    if (!v35)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    id v35 = 0;
  }
  id v14 = v37;
LABEL_14:

  return v35;
}

- (affineGPUMetal)initWithMetalContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    fig_log_get_emitter();
LABEL_12:
    FigDebugAssert3();

    self = 0;
    goto LABEL_8;
  }
  v10.receiver = self;
  v10.super_class = (Class)affineGPUMetal;
  id v6 = [(affineGPUMetal *)&v10 init];
  self = v6;
  if (!v6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  self->_useBicubic = 1;
  if ([(affineGPUMetal *)self _initTransformShaders]
    || [(affineGPUMetal *)self _initBlurShaders]
    || [(affineGPUMetal *)self _initComputeShaders]
    || (uint64_t v7 = (MTLTexture *)objc_opt_new(),
        fgCubeTexture = self->_fgCubeTexture,
        self->_fgCubeTexture = v7,
        fgCubeTexture,
        !self->_fgCubeTexture))
  {
    fig_log_get_emitter();
    goto LABEL_12;
  }
  [(FigMetalContext *)self->_metalContext setQueuePriority:1];
LABEL_8:

  return self;
}

- (int)_initBlurShaders
{
  int v2 = [(affineGPUMetal *)self _createRenderPipelinesForShaders:&off_4E8F8];
  if (v2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v2;
}

- (void)dealloc
{
  [(affineGPUMetal *)self finish];
  cvMetalTextureCacheRef = self->_cvMetalTextureCacheRef;
  if (cvMetalTextureCacheRef) {
    CFRelease(cvMetalTextureCacheRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)affineGPUMetal;
  [(affineGPUMetal *)&v4 dealloc];
}

- (void)setOverscan:(int)a3 height:(int)a4
{
  *(_DWORD *)&self->_blurMetalConfig.mixEnabled = a3;
  *(_DWORD *)&self->_anon_429[3] = a4;
}

- (int)setTransformsArray:(float *)(a3 transforms3x3:transformStrides:inputSize:outputSize:pixelBufferValidRect:isQuadraSensor:
{
  uint64_t v11 = v6;
  if (gGMFigKTraceEnabled == 1)
  {
    uint64_t v124 = v8;
    uint32x2_t v125 = v5;
    uint64_t v123 = v7;
    kdebug_trace();
    *(void *)&long long v7 = v123;
    uint64_t v8 = v124;
    uint32x2_t v5 = v125;
  }
  if (!v7 || !DWORD1(v7) || !v8 || !HIDWORD(v8)) {
    goto LABEL_83;
  }
  *((void *)&v7 + 1) = v8;
  p_inputWidth = (int32x2_t *)&self->_inputWidth;
  *(_OWORD *)&self->_inputWidth = v7;
  __int32 v15 = v5.i32[0];
  unsigned int v16 = v5.u32[1];
  if (!*(void *)&v5)
  {
    [(affineGPUMetal *)self _deallocateTransformBuffers];
LABEL_73:
    int v121 = 0;
    goto LABEL_74;
  }
  if (!v5.i32[0] || !v5.i32[1]) {
    goto LABEL_83;
  }
  int v17 = v5.i32[0] - 1;
  if ((v5.i32[0] - 1) <= 1) {
    int v17 = 1;
  }
  if (*(void *)&self->_texMatCount[4] != v17) {
    goto LABEL_16;
  }
  int v18 = v5.i32[1] - 1;
  if ((v5.i32[1] - 1) <= 1) {
    int v18 = 1;
  }
  if (HIDWORD(*(void *)&self->_texMatCount[4]) != v18)
  {
LABEL_16:
    texMats = self->_texMats;
    if (texMats)
    {
      self->_texMats = 0;
      uint32x2_t v126 = v5;
      free(texMats);
      uint32x2_t v5 = v126;
    }
    int32x2_t v20 = (int32x2_t)vmax_u32(v5, (uint32x2_t)0x200000002);
    *(int32x2_t *)&self->_texMatCount[4] = v20;
    v21 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(48 * vmul_lane_s32(v20, v20, 1).u32[0], 0x1000040EED21634uLL);
    self->_texMats = v21;
    if (!v21) {
      goto LABEL_84;
    }
    int v22 = HIDWORD(*(void *)&self->_texMatCount[4]);
    int v23 = *(void *)&self->_texMatCount[4];
    LODWORD(self->_swathMatrices) = 8 * v23 * v22;
    self->_overscanHeight = 48 * v23 * v22;
    self->_swathRenderVertexIndicesBufferSize = (12 * v22 - 12) * (v23 + 0x7FFFFFFF);
    id v24 = [(FigMetalContext *)self->_metalContext device];
    unsigned int v25 = (MTLBuffer *)[v24 newBufferWithLength:LODWORD(self->_swathMatrices) options:0];
    verticesBuffer = self->_verticesBuffer;
    self->_verticesBuffer = v25;

    if (!self->_verticesBuffer) {
      goto LABEL_84;
    }
    v27 = [(FigMetalContext *)self->_metalContext device];
    v28 = (MTLBuffer *)[v27 newBufferWithLength:self->_overscanHeight options:0];
    matricesBuffer = self->_matricesBuffer;
    self->_matricesBuffer = v28;

    if (!self->_matricesBuffer) {
      goto LABEL_84;
    }
    v30 = [(FigMetalContext *)self->_metalContext device];
    v31 = (MTLBuffer *)[v30 newBufferWithLength:self->_swathRenderVertexIndicesBufferSize options:0];
    vertexIndicesBuffer = self->_vertexIndicesBuffer;
    self->_vertexIndicesBuffer = v31;

    if (!self->_vertexIndicesBuffer) {
      goto LABEL_84;
    }
    *(int32x2_t *)&self->_texMatCount[4] = vadd_s32(*(int32x2_t *)&self->_texMatCount[4], (int32x2_t)-1);
  }
  if (self->_texMats)
  {
    int v33 = 0;
    unsigned int v34 = 0;
    int v35 = 0;
    do
    {
      int v36 = 0;
      do
      {
        unsigned int v37 = v33 + v36;
        id v38 = (int32x2_t *)((char *)self->_texMats + 48 * v34 + 48 * v36);
        v39 = &(*a3)[9 * (v33 + v36)];
        v40.i32[0] = (__int32)v39[2];
        int32x2_t v41 = *(int32x2_t *)(v39 + 3);
        uint64_t v42 = *((void *)v39 + 3);
        __int32 v43 = *((_DWORD *)v39 + 8);
        int32x2_t v44 = vzip1_s32(*(int32x2_t *)v39, v41);
        int32x2_t v45 = vzip2_s32(*(int32x2_t *)v39, v41);
        v40.i32[1] = (__int32)v39[5];
        v38[1].i32[0] = v42;
        v38[3].i32[0] = HIDWORD(v42);
        *id v38 = v44;
        v38[2] = v45;
        v38[5].i32[0] = v43;
        v38[4] = v40;
        ++v36;
      }
      while (v16 != v36);
      v34 += v36;
      if (v16 == 1)
      {
        long long v46 = self->_texMats;
        long long v47 = (_OWORD *)((char *)v46 + 48 * v34);
        long long v48 = (long long *)((char *)v46 + 48 * v37);
        long long v49 = *v48;
        long long v50 = v48[2];
        ++v34;
        v47[1] = v48[1];
        v47[2] = v50;
        *long long v47 = v49;
      }
      ++v35;
      v33 += v16;
    }
    while (v35 != v15);
    if (v15 == 1)
    {
      int v51 = 0;
      if (v16 <= 2) {
        int v52 = 2;
      }
      else {
        int v52 = v16;
      }
      int v53 = -v52;
      unsigned int v54 = v34 - v52;
      do
      {
        v55 = self->_texMats;
        v56 = (_OWORD *)((char *)v55 + 48 * v34 + 48 * v51);
        v57 = (_OWORD *)((char *)v55 + 48 * v54 + 48 * v51);
        long long v58 = v57[1];
        _OWORD *v56 = *v57;
        v56[1] = v58;
        v56[2] = v57[2];
        ++v51;
      }
      while (v53 + v51);
    }
    *(void *)self->_transformStrides = v11;
    id v59 = [(MTLBuffer *)self->_verticesBuffer contents];
    *(void *)&self->_swathVertices[4] = v59;
    if (v59)
    {
      id v60 = [(MTLBuffer *)self->_matricesBuffer contents];
      *(void *)&self->_swathMatricesBufferSize = v60;
      if (v60)
      {
        v61 = (unsigned __int16 *)[(MTLBuffer *)self->_vertexIndicesBuffer contents];
        self->_swathRenderVertexIndices = v61;
        if (v61)
        {
          self->_transformConfig.clampingEnabled = 0;
          *(_DWORD *)&self->_anon_281[43] = 0;
          if (a4)
          {
            float x = a4->origin.x;
            long long v64 = *(_OWORD *)&self->_anon_281[15];
            v68.f32[0] = x;
            *(float *)&self->_anon_281[15] = x;
            float v65 = a4->origin.x + a4->size.width;
            v68.f32[1] = v65;
            *(float32x4_t *)&self->_anon_281[15] = v68;
            float32_t y = a4->origin.y;
            v68.f32[2] = y;
            *(float32x4_t *)&self->_anon_281[15] = v68;
            float32_t v67 = a4->origin.y + a4->size.height;
            v68.f32[3] = v67;
            if (x >= 2.0)
            {
              self->_transformConfig.clampingEnabled = 1;
              v68.f32[0] = x + 2.0;
              v68.f32[1] = v65 + -2.0;
            }
            v69.i32[0] = v68.i32[2];
            if (v68.f32[2] >= 2.0)
            {
              self->_transformConfig.clampingEnabled = 1;
              float32x2_t v69 = vadd_f32((float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v68, (int8x16_t)v68, 8uLL), (float32x2_t)0xC000000040000000);
              v68.i32[3] = v69.i32[1];
            }
            uint32x2_t v70 = (uint32x2_t)*p_inputWidth;
            v71.i64[1] = -1;
            *(float32x2_t *)v71.i8 = vcvt_f32_u32((uint32x2_t)vadd_s32(*p_inputWidth, (int32x2_t)-1));
            float32x4_t v62 = (float32x4_t)vzip1q_s32(v71, v71);
            v68.i32[2] = v69.i32[0];
            *(float32x4_t *)&self->_anon_281[15] = vdivq_f32(v68, v62);
            if (a5)
            {
              unsigned int v72 = 0;
              unsigned int v73 = 0;
            }
            else
            {
              unsigned int v72 = a4->origin.x;
              unsigned int v73 = a4->origin.y;
            }
          }
          else
          {
            unsigned int v72 = 0;
            unsigned int v73 = 0;
            uint32x2_t v70 = (uint32x2_t)*p_inputWidth;
          }
          float32x2_t v74 = vcvt_f32_u32(v70);
          unsigned int v75 = HIDWORD(*(void *)&self->_texMatCount[4]);
          unsigned int v76 = *(void *)&self->_texMatCount[4];
          if (v76)
          {
            int v77 = 0;
            unsigned int v78 = 0;
            uint64_t v79 = *(void *)&self->_swathVertices[4];
            float v80 = (float)*(void *)self->_transformStrides / v74.f32[0];
            float v81 = (float)HIDWORD(*(void *)self->_transformStrides) / v74.f32[1];
            float v82 = v81 + v81;
            float v83 = v80 + v80;
            float v84 = (float)(*(_DWORD *)&self->_anon_429[3] + v73) / v74.f32[1];
            float v85 = (float)(*(_DWORD *)&self->_blurMetalConfig.mixEnabled + v72) / v74.f32[0];
            float v86 = (float)(v84 * -2.0) + 1.0;
            float v87 = (float)(v85 * 2.0) + -1.0;
            unsigned int v88 = v76 + 1;
            float v89 = (float)(v85 * -2.0) + 1.0;
            if (v76 + 1 > 1) {
              uint64_t v90 = v76 + 1;
            }
            else {
              uint64_t v90 = 1;
            }
            float v91 = (float)(v84 * 2.0) + -1.0;
            if (v75 + 1 > 1) {
              int v92 = v75 + 1;
            }
            else {
              int v92 = 1;
            }
            do
            {
              unint64_t v93 = 0;
              *(float *)&uint64_t v94 = v87;
              do
              {
                *((float *)&v94 + 1) = v86;
                *(void *)(v79 + 8 * (v77 + v93)) = v94;
                if (v93 >= v76 - 1) {
                  *(float *)&uint64_t v94 = v89;
                }
                else {
                  *(float *)&uint64_t v94 = v83 + *(float *)&v94;
                }
                ++v93;
              }
              while (v90 != v93);
              float v86 = v86 - v82;
              if (v78 >= v75 - 1) {
                float v86 = v91;
              }
              ++v78;
              v77 += v88;
            }
            while (v78 != v92);
            int v95 = 0;
            int v96 = 0;
            int v97 = 1;
            do
            {
              ++v96;
              int v98 = v97;
              unsigned int v99 = v76;
              do
              {
                v61[v95] = v98 - 1;
                v61[v95 + 1] = v98;
                v61[v95 + 2] = v76 + v98;
                v61[v95 + 3] = v98;
                int v100 = v95 + 5;
                v61[v95 + 4] = v76 + v98;
                v95 += 6;
                v61[v100] = v76 + v98++ + 1;
                --v99;
              }
              while (v99);
              v97 += v88;
            }
            while (v96 != v75);
            float32x2_t v74 = vcvt_f32_u32((uint32x2_t)*p_inputWidth);
            unsigned int v75 = HIDWORD(*(void *)&self->_texMatCount[4]);
            unsigned int v76 = *(void *)&self->_texMatCount[4];
          }
          int v101 = 0;
          unsigned int v102 = 0;
          uint64_t v103 = *(void *)&self->_swathMatricesBufferSize;
          v104 = self->_texMats;
          __asm { FMOV            V1.2S, #1.0 }
          float32x2_t v110 = vdiv_f32(_D1, v74);
          v62.f32[0] = v74.f32[0] / v74.f32[1];
          float32x2_t v111 = (float32x2_t)vzip1_s32(*(int32x2_t *)v62.f32, (int32x2_t)v74);
          v74.f32[0] = v74.f32[1] / v74.f32[0];
          do
          {
            unsigned int v112 = 0;
            unsigned int v113 = v102;
            do
            {
              uint64_t v114 = v103 + 48 * (v101 + v112);
              v115 = (_OWORD *)((char *)v104 + 48 * v113);
              long long v117 = v115[1];
              long long v116 = v115[2];
              *(_OWORD *)uint64_t v114 = *v115;
              *(_OWORD *)(v114 + 16) = v117;
              *(_OWORD *)(v114 + 32) = v116;
              int8x16_t v118 = *(int8x16_t *)(v114 + 16);
              int32x4_t v119 = (int32x4_t)vextq_s8(*(int8x16_t *)v114, *(int8x16_t *)v114, 8uLL);
              *(float32x2_t *)v119.i8 = vmul_f32(v111, (float32x2_t)vext_s8(*(int8x8_t *)v114, *(int8x8_t *)v119.i8, 4uLL));
              *(void *)&long long v116 = vzip1q_s32(*(int32x4_t *)v114, v119).u64[0];
              *(_DWORD *)(v114 + 8) = v119.i32[1];
              *(void *)uint64_t v114 = v116;
              *(float32x2_t *)&long long v116 = vmul_f32(v74, (float32x2_t)vzip1_s32(*(int32x2_t *)v118.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v118, v118, 8uLL)));
              *(_DWORD *)(v114 + 24) = DWORD1(v116);
              DWORD1(v116) = v118.i32[1];
              *(void *)(v114 + 16) = v116;
              long long v120 = *(_OWORD *)(v114 + 32);
              *(_DWORD *)(v114 + 40) = DWORD2(v120);
              *(float32x2_t *)(v114 + 32) = vmul_f32(v110, *(float32x2_t *)&v120);
              ++v112;
              v113 += v75 + 1;
            }
            while (v112 <= v76);
            ++v102;
            v101 += v112;
          }
          while (v102 <= v75);
          goto LABEL_73;
        }
      }
    }
LABEL_83:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v121 = -12780;
    goto LABEL_74;
  }
LABEL_84:
  fig_log_get_emitter();
  FigDebugAssert3();
  int v121 = -12786;
LABEL_74:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  return v121;
}

- (void)_deallocateTransformBuffers
{
  texMats = self->_texMats;
  if (texMats)
  {
    self->_texMats = 0;
    free(texMats);
  }
  LODWORD(self->_swathMatrices) = 0;
  self->_overscanHeight = 0;
  self->_swathRenderVertexIndicesBufferSize = 0;
  verticesBuffer = self->_verticesBuffer;
  self->_verticesBuffer = 0;

  matricesBuffer = self->_matricesBuffer;
  self->_matricesBuffer = 0;

  vertexIndicesBuffer = self->_vertexIndicesBuffer;
  self->_vertexIndicesBuffer = 0;

  *(void *)&self->_texMatCount[4] = 0;
}

- (void)setRenderMethod:(int)a3
{
  int useBicubic = self->_useBicubic;
  int v4 = a3 == 1;
  if (useBicubic != v4)
  {
    self->_int useBicubic = v4;
    if ([(affineGPUMetal *)self _initTransformShaders]
      || [(affineGPUMetal *)self _initBlurShaders])
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      self->_int useBicubic = useBicubic;
    }
  }
}

- (void)setFillExtendedRowsInOutputBuffer:(BOOL)a3
{
  *((unsigned char *)&self->_P3ToBT2020ConversionMethod + 4) = a3;
}

- (void)setPriority:(int)a3
{
}

- (void)configureP3ToBT2020conversion:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  LODWORD(self->_intermediateOutputPixelBuffer) = v3;
}

- (void)cacheSourcePixelBuffer:(__CVBuffer *)a3
{
  id v4 = 0;
  id v5 = 0;
  if (a3)
  {
    if ([(affineGPUMetal *)self _cachedTexturesFromPixelBuffer:a3 isTwoPass:1 isOptimized:0 textures:v3])
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (void)finish
{
  [(FigMetalContext *)self->_metalContext waitForIdle];
  m2m = self->_m2m;
  if (m2m)
  {
    CFRelease(m2m);
    self->_m2m = 0;
  }
  id v4 = *(const void **)&self->_ditherNoStyle;
  if (v4)
  {
    CFRelease(v4);
    *(void *)&self->_ditherNoStyle = 0;
  }
  cvMetalTextureCacheRef = self->_cvMetalTextureCacheRef;
  if (cvMetalTextureCacheRef)
  {
    CFRelease(cvMetalTextureCacheRef);
    self->_cvMetalTextureCacheRef = 0;
  }
  [(affineGPUMetal *)self _deallocateTransformBuffers];
  *(_OWORD *)self->_blurPreviousTextureIndefloat x = 0u;
  inputLumaPyramid = self->_inputLumaPyramid;
  self->_inputLumaPyramid = 0;

  inputChromaPyramid = self->_inputChromaPyramid;
  self->_inputChromaPyramid = 0;

  smoothedLumaPyramid = self->_smoothedLumaPyramid;
  self->_smoothedLumaPyramid = 0;

  smoothedChromaPyramid = self->_smoothedChromaPyramid;
  self->_smoothedChromaPyramid = 0;
}

- (int)renderWithPixelBuffer:(__CVBuffer *)a3 metadata:(id)a4 pixelBufferValidRect:(CGRect *)a5 ltmLUT:(id)a6 outputPixelBuffer:(__CVBuffer *)a7 isAttachmentRendering:(BOOL)a8
{
  unint64_t v8 = a8;
  id v14 = a4;
  id v15 = a6;
  if (!a3) {
    goto LABEL_95;
  }
  if (!a5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_91;
  }
  if (!a7 || !self->_verticesBuffer || !self->_matricesBuffer || !self->_vertexIndicesBuffer || !self->_texMats)
  {
LABEL_95:
    fig_log_get_emitter();
    FigDebugAssert3();
    a5 = 0;
    goto LABEL_91;
  }
  float32x2_t v74 = a5;
  unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  unsigned int v79 = CVPixelBufferGetWidthOfPlane(a7, 0);
  unsigned int v78 = CVPixelBufferGetHeightOfPlane(a7, 0);
  unsigned int v73 = [v14 objectForKeyedSubscript:kFigCaptureStreamMetadata_QuadraBinningFactor];

  if (v8) {
    goto LABEL_33;
  }
  reverseCoefficients = self->_reverseCoefficients;
  if (!reverseCoefficients && !LOBYTE(self->_ditherStrengthChroma)) {
    goto LABEL_25;
  }
  float fbsDeltaThresholdLuma = self->_fbsDeltaThresholdLuma;
  float fbsEdgeThresholdLuma = self->_fbsEdgeThresholdLuma;
  if (fbsDeltaThresholdLuma > 0.0 || fbsEdgeThresholdLuma > 0.0)
  {
    int v21 = renderWithPixelBuffer_metadata_pixelBufferValidRect_ltmLUT_outputPixelBuffer_isAttachmentRendering__ditherSeed++;
    *(_DWORD *)&self->_anon_281[319] = v21;
    *(float *)&self->_anon_281[323] = fbsDeltaThresholdLuma;
    *(float *)&self->_anon_281[327] = fbsEdgeThresholdLuma;
    if (!reverseCoefficients) {
      goto LABEL_16;
    }
  }
  else if (!reverseCoefficients)
  {
LABEL_16:
    if (!LOBYTE(self->_ditherStrengthChroma)) {
      goto LABEL_25;
    }
  }
  if (self->_fbsDeltaThresholdChroma > 0.0 && self->_fbsEdgeThresholdChroma > 0.0)
  {
    if (!self->_inputLumaPyramid)
    {
      int v22 = [(affineGPUMetal *)self _allocatePyramidWithPixelFormat:20 bottomLevelWidth:WidthOfPlane bottomLevelHeight:HeightOfPlane scaleFactor:4 includeBottomLevel:0 minimumDimension:8];
      inputLumaPyramid = self->_inputLumaPyramid;
      self->_inputLumaPyramid = v22;

      if (!self->_inputLumaPyramid) {
        goto LABEL_101;
      }
    }
    if (!self->_smoothedLumaPyramid)
    {
      id v24 = [(affineGPUMetal *)self _allocatePyramidWithPixelFormat:20 bottomLevelWidth:WidthOfPlane bottomLevelHeight:HeightOfPlane scaleFactor:4 includeBottomLevel:0 minimumDimension:8];
      smoothedLumaPyramid = self->_smoothedLumaPyramid;
      self->_smoothedLumaPyramid = v24;

      if (!self->_smoothedLumaPyramid) {
        goto LABEL_101;
      }
    }
    *(_DWORD *)&self->_anon_281[331] = 0;
    *(void *)&self->_anon_281[335] = *(void *)&self->_fbsDeltaThresholdChroma;
    reverseCoefficients = self->_reverseCoefficients;
  }
  if (reverseCoefficients)
  {
LABEL_26:
    if (*(float *)&self->_attachmentIsLinearThumbnail <= 0.0 || *(float *)&self[1].super.isa <= 0.0) {
      goto LABEL_33;
    }
    if (self->_inputChromaPyramid
      || (size_t v26 = CVPixelBufferGetWidthOfPlane(a3, 1uLL),
          [(affineGPUMetal *)self _allocatePyramidWithPixelFormat:60 bottomLevelWidth:v26 bottomLevelHeight:CVPixelBufferGetHeightOfPlane(a3, 1uLL) scaleFactor:4 includeBottomLevel:0 minimumDimension:8], v27 = (NSArray *)objc_claimAutoreleasedReturnValue(), inputChromaPyramid = self->_inputChromaPyramid, self->_inputChromaPyramid = v27, inputChromaPyramid, self->_inputChromaPyramid))
    {
      if (self->_smoothedChromaPyramid
        || (size_t v29 = CVPixelBufferGetWidthOfPlane(a3, 1uLL),
            [(affineGPUMetal *)self _allocatePyramidWithPixelFormat:60 bottomLevelWidth:v29 bottomLevelHeight:CVPixelBufferGetHeightOfPlane(a3, 1uLL) scaleFactor:4 includeBottomLevel:0 minimumDimension:8], v30 = (NSArray *)objc_claimAutoreleasedReturnValue(), smoothedChromaPyramid = self->_smoothedChromaPyramid, self->_smoothedChromaPyramid = v30, smoothedChromaPyramid, self->_smoothedChromaPyramid))
      {
        *(_DWORD *)&self->_anon_281[343] = 0;
        *(void *)&self->_anon_281[347] = *(void *)&self->_attachmentIsLinearThumbnail;
        goto LABEL_33;
      }
    }
LABEL_101:
    fig_log_get_emitter();
    FigDebugAssert3();
    a5 = 0;
    int v71 = -12786;
    goto LABEL_92;
  }
LABEL_25:
  if (LOBYTE(self->_ditherStrengthChroma)) {
    goto LABEL_26;
  }
LABEL_33:
  uint64_t v32 = a7;
  if (LODWORD(self->_intermediateOutputPixelBuffer) == 1)
  {
    p_m2m = &self->_m2m;
    m2m = self->_m2m;
    if (!m2m) {
      goto LABEL_42;
    }
    if (CVPixelBufferGetWidthOfPlane(m2m, 0) != v79
      || CVPixelBufferGetHeightOfPlane(*p_m2m, 0) != v78
      || (OSType PixelFormatType = CVPixelBufferGetPixelFormatType(*p_m2m),
          PixelFormatType != CVPixelBufferGetPixelFormatType(a7)))
    {
      if (*p_m2m)
      {
        CFRelease(*p_m2m);
        *p_m2m = 0;
      }
      goto LABEL_42;
    }
    uint64_t v32 = *p_m2m;
    if (!*p_m2m)
    {
LABEL_42:
      unsigned int v75 = v8;
      id v76 = v15;
      id v77 = v14;
      int v36 = CVPixelBufferGetAttributes();
      unsigned int v37 = CVPixelBufferGetAttributes();
      id v38 = +[NSMutableDictionary dictionary];
      [v38 setObject:&__NSDictionary0__struct forKeyedSubscript:kCVPixelBufferIOSurfacePropertiesKey];
      if (v37) {
        [v38 addEntriesFromDictionary:v37];
      }
      CFStringRef v39 = kCVBufferPropagatedAttachmentsKey;
      int32x2_t v40 = [v36 objectForKeyedSubscript:kCVBufferPropagatedAttachmentsKey];
      [v38 setObject:v40 forKeyedSubscript:v39];

      OSType v41 = CVPixelBufferGetPixelFormatType(a7);
      CVReturn v42 = CVPixelBufferCreate(kCFAllocatorDefault, v79, v78, v41, (CFDictionaryRef)v38, &self->_m2m);
      if (v42)
      {
        int v71 = v42;
        fig_log_get_emitter();
        FigDebugAssert3();

        a5 = 0;
        goto LABEL_100;
      }
      CFDictionaryRef v43 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldPropagate);
      id v15 = v76;
      if (v43)
      {
        CFDictionaryRef v44 = (const __CFDictionary *)CFAutorelease(v43);
        if (v44) {
          CVBufferSetAttachments(*p_m2m, v44, kCVAttachmentMode_ShouldPropagate);
        }
      }

      uint64_t v32 = *p_m2m;
      unint64_t v8 = v75;
    }
  }
  int32x2_t v45 = [v14 objectForKeyedSubscript:kFigVideoStabilizationSampleBufferAttachmentKey_OutputSmartStyleUnstyledEnabled];
  unsigned __int8 v46 = [v45 BOOLValue];

  if (((v46 & 1) != 0 || LOBYTE(self->_blurOverscan.width))
    && (self->_reverseCoefficients || self->_intermediateOutputUnstyledPixelBuffer)
    && (v8 & 1) == 0)
  {
    p_ditherNoStyle = &self->_ditherNoStyle;
    long long v48 = *(__CVBuffer **)&self->_ditherNoStyle;
    if (!v48) {
      goto LABEL_62;
    }
    if (CVPixelBufferGetWidthOfPlane(v48, 0) != v79
      || CVPixelBufferGetHeightOfPlane(*(CVPixelBufferRef *)p_ditherNoStyle, 0) != v78
      || (OSType v49 = CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)p_ditherNoStyle),
          v49 != CVPixelBufferGetPixelFormatType(a7)))
    {
      if (*(void *)p_ditherNoStyle)
      {
        CFRelease(*(CFTypeRef *)p_ditherNoStyle);
        *(void *)p_ditherNoStyle = 0;
      }
      goto LABEL_62;
    }
    if (!*(void *)p_ditherNoStyle)
    {
LABEL_62:
      id v76 = v15;
      id v77 = v14;
      long long v50 = CVPixelBufferGetAttributes();
      int v51 = +[NSMutableDictionary dictionary];
      [v51 setObject:&__NSDictionary0__struct forKeyedSubscript:kCVPixelBufferIOSurfacePropertiesKey];
      if (v50) {
        [v51 addEntriesFromDictionary:v50];
      }
      OSType v52 = CVPixelBufferGetPixelFormatType(v32);
      if (!CVPixelBufferCreate(kCFAllocatorDefault, v79, v78, v52, (CFDictionaryRef)v51, (CVPixelBufferRef *)&self->_ditherNoStyle))
      {
        CFDictionaryRef v53 = CVBufferCopyAttachments(a7, kCVAttachmentMode_ShouldPropagate);
        unint64_t v8 = v8;
        if (v53)
        {
          CFDictionaryRef v54 = (const __CFDictionary *)CFAutorelease(v53);
          if (v54) {
            CVBufferSetAttachments(*(CVBufferRef *)p_ditherNoStyle, v54, kCVAttachmentMode_ShouldPropagate);
          }
        }

        goto LABEL_69;
      }
      fig_log_get_emitter();
      FigDebugAssert3();

      a5 = 0;
      int v71 = -12786;
LABEL_100:
      id v15 = v76;
      id v14 = v77;
      goto LABEL_92;
    }
  }
LABEL_69:
  self->_gpuProcessFailed = 0;
  v55 = [(FigMetalContext *)self->_metalContext commandQueue];
  a5 = [v55 commandBuffer];

  if (!a5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v71 = FigSignalErrorAt();
    goto LABEL_92;
  }
  [(affineGPUMetal *)self updateCubesIfNeeded];
  [(affineGPUMetal *)self _transformInputPixelBuffer:a3 outputPixelBuffer:v32 ltmLUT:v15 isAttachment:v8 commandBuffer:a5];
  CFTypeRef v56 = CMGetAttachment(a3, @"InputDepthPixelBuffer", 0);
  CFTypeRef v57 = CMGetAttachment(a3, @"OutputDepthPixelBuffer", 0);
  if (v56)
  {
    CFTypeRef v58 = v57;
    if (v57)
    {
      float v80 = v32;
      id v59 = a3;
      id v60 = v15;
      v61 = a7;
      char v62 = v8;
      v63 = [v14 objectForKeyedSubscript:kFigVideoStabilizationSampleBufferProcessorMetadata_DepthBufferFOVScaling];
      unint64_t v8 = (unint64_t)v63;
      if (v63)
      {
        [v63 floatValue];
        *(float *)&self->_anon_281[43] = v64;
        *(float *)v65.i32 = (float)(1.0 - v64) * 0.5;
        *(int32x2_t *)&self->_anon_281[47] = vdup_lane_s32(v65, 0);
      }
      [(affineGPUMetal *)self _transformInputPixelBuffer:v56 outputPixelBuffer:v58 ltmLUT:0 isAttachment:1 commandBuffer:a5];

      LOBYTE(v8) = v62;
      a7 = v61;
      id v15 = v60;
      a3 = v59;
      uint64_t v32 = v80;
    }
  }
  [(affineGPUMetal *)self _addCommandBufferHandler:a5];
  if (gGMFigKTraceEnabled)
  {
    v66 = [(CGRect *)a5 commandQueue];
    float32_t v67 = [v66 commandBuffer];

    [v67 setLabel:@"KTRACE_MTLCMDBUF"];
    [v67 addCompletedHandler:&__block_literal_global];
    [v67 commit];
    [(CGRect *)a5 addCompletedHandler:&__block_literal_global_72];
  }
  [(CGRect *)a5 commit];
  if ((v8 & 1) == 0)
  {
    float32x4_t v68 = *(const void **)&self->_ditherNoStyle;
    CMSetAttachment(a3, @"OutputSmartStyleUnstyledPixelBuffer", v68, 1u);
    if (LOBYTE(self->_blurOverscan.width))
    {
      if (v73) {
        float32x2_t v69 = 0;
      }
      else {
        float32x2_t v69 = v74;
      }
      [(affineGPUMetal *)self _blurDuplicatedPixelsOnPixelBuffer:v32 validBufferRect:v69 forDeltaMap:0];
      if (v68) {
        [(affineGPUMetal *)self _blurDuplicatedPixelsOnPixelBuffer:v68 validBufferRect:v69 forDeltaMap:1];
      }
      if (self->_intermediateOutputUnstyledPixelBuffer)
      {
        CFTypeRef v70 = CMGetAttachment(a3, @"OutputSmartStyleDeltaMapPixelBuffer", 0);
        if (v68)
        {
          if (v70) {
            [(affineGPUMetal *)self _blurDeltaMapBordersFromStyledPixelBuffer:v32 withUnstyledPixelBuffer:v68 to:v70];
          }
        }
      }
    }
  }
  [(affineGPUMetal *)self _duplicateBottomRowsOnPixelBuffer:v32];
  [(FigMetalContext *)self->_metalContext waitForIdle];
  if (self->_gpuProcessFailed)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v71 = -12782;
    goto LABEL_92;
  }
  if (LODWORD(self->_intermediateOutputPixelBuffer) == 1) {
    [(MTLTexture *)self->_fgCubeTexture downsample:v32 dst:a7 sync_m2m:1];
  }
LABEL_91:
  int v71 = 0;
LABEL_92:

  return v71;
}

- (int)renderWithSampleBuffer:(opaqueCMSampleBuffer *)a3 pixelBufferValidRect:(CGRect *)a4 ltmLUT:(id)a5 outputPixelBuffer:(__CVBuffer *)a6 isAttachmentRendering:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a5;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  v13 = (opaqueCMSampleBuffer *)CMGetAttachment(a3, kFigCaptureSampleBufferAttachmentKey_StreamingSemanticStylePersonMaskSampleBuffer, 0);
  if (v7 || !v13)
  {
    backgroundColorCube = self->_backgroundColorCube;
    *(_OWORD *)&self->_foregroundColorCube = 0u;

    fgCubePtr = (void *)self->_fgCubePtr;
    self->_fgCubePtr = 0;
  }
  else
  {
    self->_foregroundColorCube = (NSData *)CMSampleBufferGetImageBuffer(v13);
    CMGetAttachment(a3, kFigCaptureSampleBufferAttachmentKey_StreamingSemanticStyleForegroundLUT, 0);
    id v14 = (NSData *)objc_claimAutoreleasedReturnValue();
    id v15 = self->_backgroundColorCube;
    self->_backgroundColorCube = v14;

    CMGetAttachment(a3, kFigCaptureSampleBufferAttachmentKey_StreamingSemanticStyleBackgroundLUT, 0);
    unsigned int v16 = (const void *)objc_claimAutoreleasedReturnValue();
    fgCubePtr = (void *)self->_fgCubePtr;
    self->_fgCubePtr = v16;
  }

  if (v7)
  {
    LOBYTE(self->_forwardCoefficients) = 0;
    HIDWORD(self->_forwardCoefficients) = 0;
  }
  else
  {
    unsigned int v19 = CMGetAttachment(a3, kFigCaptureSampleBufferAttachmentKey_SubjectRelightingCurveParameter, 0);
    int32x2_t v20 = v19;
    LOBYTE(self->_forwardCoefficients) = v19 != 0;
    if (v19)
    {
      [v19 floatValue];
      HIDWORD(self->_forwardCoefficients) = v21;
    }
  }
  int v22 = CMGetAttachment(a3, @"AttachmentName", 0);
  BYTE4(self[1].super.isa) = [v22 isEqual:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingLinearThumbnail];

  CFStringRef v23 = (const __CFString *)kFigSampleBufferAttachmentKey_AttachedMedia;
  id v24 = CMGetAttachment(a3, kFigSampleBufferAttachmentKey_AttachedMedia, 0);
  uint64_t v25 = kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingIntegratedForwardLearnedCoefficients;
  size_t v26 = [v24 objectForKeyedSubscript:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingIntegratedForwardLearnedCoefficients];
  reverseCoefficients = self->_reverseCoefficients;
  self->_reverseCoefficients = v26;

  uint64_t v28 = kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingIntegratedReverseLearnedCoefficients;
  unsigned int v37 = v24;
  size_t v29 = [v24 objectForKeyedSubscript:kFigCaptureSampleBufferAttachedMediaKey_SmartStyleStreamingIntegratedReverseLearnedCoefficients];
  intermediateOutputUnstyledPixelBuffer = self->_intermediateOutputUnstyledPixelBuffer;
  self->_intermediateOutputUnstyledPixelBuffer = v29;

  if (self->_reverseCoefficients || self->_intermediateOutputUnstyledPixelBuffer)
  {
    id v31 = [v24 mutableCopy];
    [v31 setObject:0 forKeyedSubscript:v25];
    [v31 setObject:0 forKeyedSubscript:v28];
    id v32 = [v31 copy];
    CMRemoveAttachment(a3, v23);
    CMSetAttachment(a3, v23, v32, 1u);
    LOBYTE(self->_forwardCoefficients) = 0;
  }
  int v33 = CMGetAttachment(a3, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
  int v34 = [(affineGPUMetal *)self renderWithPixelBuffer:ImageBuffer metadata:v33 pixelBufferValidRect:a4 ltmLUT:v11 outputPixelBuffer:a6 isAttachmentRendering:v7];

  if (v34)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }

  return v34;
}

- (int)_transformInputPixelBuffer:(__CVBuffer *)a3 outputPixelBuffer:(__CVBuffer *)a4 ltmLUT:(id)a5 isAttachment:(BOOL)a6 commandBuffer:(id)a7
{
  BOOL v146 = a6;
  id v137 = a5;
  id v139 = a7;
  id v190 = 0;
  id v189 = 0;
  id v187 = 0;
  id v186 = 0;
  id v184 = 0;
  id v183 = 0;
  id v181 = 0;
  id v180 = 0;
  uint64_t v178 = 0;
  float v177 = 0.0;
  if (!*(void *)&self->_swathVertices[4]
    || !LODWORD(self->_swathMatrices)
    || !*(void *)&self->_swathMatricesBufferSize
    || !self->_overscanHeight
    || !self->_swathRenderVertexIndices
    || !self->_swathRenderVertexIndicesBufferSize
    || !a3
    || !a4
    || !v139)
  {
    fig_log_get_emitter();
LABEL_183:
    FigDebugAssert3();
    goto LABEL_184;
  }
  BOOL v140 = *(void *)&self->_texMatCount[4] <= 1
      && CVPixelBufferGetPixelFormatType(a3) != 1751411059
      && !v137
      && LODWORD(self->_intermediateOutputPixelBuffer) != 2
      && !self->_foregroundColorCube
      && !self->_reverseCoefficients
      && !self->_intermediateOutputUnstyledPixelBuffer
      && !LOBYTE(self->_ditherStrengthChroma)
      && !BYTE4(self[1].super.isa)
      && !LOBYTE(self->_forwardCoefficients)
      && CVPixelBufferGetPixelFormatType(a3) != 2016686642
      && CVPixelBufferGetPixelFormatType(a3) != 2019963442
      && CVPixelBufferGetPixelFormatType(a3) != 1882468914
      && CVPixelBufferGetPixelFormatType(a3) != 1885745714
      && CVPixelBufferGetPixelFormatType(a3) != 645428786
      && CVPixelBufferGetPixelFormatType(a3) != 645424690
      && CVPixelBufferGetPixelFormatType(a3) != 762869298
      && CVPixelBufferGetPixelFormatType(a3) != 762865202
      && CVPixelBufferGetPixelFormatType(a3) != 796423730
      && CVPixelBufferGetPixelFormatType(a3) != 796419634
      && CVPixelBufferGetPixelFormatType(a3) != 2088269362
      && CVPixelBufferGetPixelFormatType(a3) != 2088265266
      && CVPixelBufferGetPixelFormatType(a3) != 1278226488
      && CVPixelBufferGetPixelFormatType(a3) != 1278226536
      && CVPixelBufferGetPixelFormatType(a3) != 1278226534;
  int v9 = [(affineGPUMetal *)self _cachedTexturesFromPixelBuffer:a3 isTwoPass:1 isOptimized:0 textures:v188];
  if (v9)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_181:
    float v86 = 0;
    unsigned int v75 = 0;
    goto LABEL_165;
  }
  int v9 = [(affineGPUMetal *)self _cachedTexturesFromPixelBuffer:a4 isTwoPass:v140 isOptimized:1 textures:v185];
  if (v9)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_181;
  }
  if (v185[0] >= 3u)
  {
    fig_log_get_emitter();
    goto LABEL_183;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v152 = self;
  if (!v146)
  {
    reverseCoefficients = self->_reverseCoefficients;
    if (!reverseCoefficients && !LOBYTE(self->_ditherStrengthChroma))
    {
      HIDWORD(v127) = 0;
      goto LABEL_68;
    }
    if (self->_fbsDeltaThresholdChroma <= 0.0 || self->_fbsEdgeThresholdChroma <= 0.0)
    {
      HIDWORD(v127) = 0;
      if (!reverseCoefficients) {
        goto LABEL_68;
      }
    }
    else
    {
      if (v188[0] >= 3u)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        goto LABEL_184;
      }
      if (gGMFigKTraceEnabled == 1) {
        kdebug_trace();
      }
      id v11 = [v139 computeCommandEncoder];
      v12 = v11;
      if (!v11)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        int v124 = FigSignalErrorAt();
LABEL_189:
        int v9 = v124;
        goto LABEL_181;
      }
      [v11 setComputePipelineState:self->_pipelineComputeStates[1]];
      [v12 setImageblockWidth:32 height:32];
      v13 = &self->_anon_281[331];
      objc_msgSend(v12, "setBytes:length:atIndex:");
      id v14 = v189;
      long long v173 = 0u;
      long long v174 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      id v15 = self->_inputLumaPyramid;
      id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v173 objects:v192 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v174;
        int64x2_t v147 = vdupq_n_s64(0x20uLL);
        do
        {
          int v18 = 0;
          unsigned int v19 = v14;
          do
          {
            if (*(void *)v174 != v17) {
              objc_enumerationMutation(v15);
            }
            int32x2_t v20 = *(void **)(*((void *)&v173 + 1) + 8 * (void)v18);
            [v12 setTexture:v19 atIndex:0];
            [v12 setTexture:v20 atIndex:3];
            id v21 = [v20 width];
            id v22 = [v20 height];
            v172[0] = v21;
            v172[1] = v22;
            v172[2] = 1;
            int64x2_t v170 = v147;
            uint64_t v171 = 1;
            [v12 dispatchThreads:v172 threadsPerThreadgroup:&v170];
            id v14 = v20;

            int v18 = (char *)v18 + 1;
            unsigned int v19 = v14;
          }
          while (v16 != v18);
          id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v173 objects:v192 count:16];
        }
        while (v16);
      }

      [v12 setComputePipelineState:v152->_pipelineComputeStates[2]];
      [v12 setImageblockWidth:32 height:32];
      CFStringRef v23 = [(NSArray *)v152->_inputLumaPyramid lastObject];

      int v24 = [(NSArray *)v152->_smoothedLumaPyramid count];
      if (v24 < 2)
      {
        id v30 = v23;
      }
      else
      {
        uint64_t v25 = (v24 - 2);
        int64x2_t v148 = vdupq_n_s64(0x20uLL);
        do
        {
          *(void *)&long long v153 = *(void *)v13;
          DWORD2(v153) = *((_DWORD *)v13 + 2);
          size_t v26 = [(NSArray *)v152->_inputLumaPyramid objectAtIndexedSubscript:v25];
          v27 = [(NSArray *)v152->_smoothedLumaPyramid objectAtIndexedSubscript:v25];
          DWORD2(v153) = fmaxf(*((float *)&v153 + 2) * ldexpf(1.0, v25), *((float *)&v153 + 1));
          [v12 setBytes:&v153 length:12 atIndex:0];
          [v12 setTexture:v26 atIndex:0];
          [v12 setTexture:v23 atIndex:1];
          [v12 setTexture:v27 atIndex:2];
          id v28 = [v27 width];
          id v29 = [v27 height];
          v169[0] = v28;
          v169[1] = v29;
          v169[2] = 1;
          int64x2_t v167 = v148;
          uint64_t v168 = 1;
          [v12 dispatchThreads:v169 threadsPerThreadgroup:&v167];
          id v30 = v27;

          CFStringRef v23 = v30;
          BOOL v31 = v25-- <= 0;
        }
        while (!v31);
      }
      [v12 endEncoding];
      if (gGMFigKTraceEnabled == 1) {
        kdebug_trace();
      }

      self = v152;
      HIDWORD(v127) = 1;
      if (!v152->_reverseCoefficients)
      {
LABEL_68:
        if (!LOBYTE(self->_ditherStrengthChroma)) {
          goto LABEL_87;
        }
      }
    }
    if (*(float *)&self->_attachmentIsLinearThumbnail > 0.0 && *(float *)&self[1].super.isa > 0.0)
    {
      if (v188[0] < 3u)
      {
        if (gGMFigKTraceEnabled == 1) {
          kdebug_trace();
        }
        id v32 = [v139 computeCommandEncoder];
        int v33 = v32;
        if (v32)
        {
          [v32 setComputePipelineState:v152->_pipelineComputeStates[1]];
          [v33 setImageblockWidth:32 height:32];
          objc_msgSend(v33, "setBytes:length:atIndex:");
          id v34 = v190;
          long long v163 = 0u;
          long long v164 = 0u;
          long long v165 = 0u;
          long long v166 = 0u;
          int v35 = v152->_inputChromaPyramid;
          id v36 = [(NSArray *)v35 countByEnumeratingWithState:&v163 objects:v191 count:16];
          if (v36)
          {
            uint64_t v37 = *(void *)v164;
            int64x2_t v149 = vdupq_n_s64(0x20uLL);
            do
            {
              id v38 = 0;
              CFStringRef v39 = v34;
              do
              {
                if (*(void *)v164 != v37) {
                  objc_enumerationMutation(v35);
                }
                int32x2_t v40 = *(void **)(*((void *)&v163 + 1) + 8 * (void)v38);
                [v33 setTexture:v39 atIndex:0];
                [v33 setTexture:v40 atIndex:3];
                id v41 = [v40 width];
                id v42 = [v40 height];
                v162[0] = v41;
                v162[1] = v42;
                v162[2] = 1;
                int64x2_t v160 = v149;
                uint64_t v161 = 1;
                [v33 dispatchThreads:v162 threadsPerThreadgroup:&v160];
                id v34 = v40;

                id v38 = (char *)v38 + 1;
                CFStringRef v39 = v34;
              }
              while (v36 != v38);
              id v36 = [(NSArray *)v35 countByEnumeratingWithState:&v163 objects:v191 count:16];
            }
            while (v36);
          }

          [v33 setComputePipelineState:v152->_pipelineComputeStates[2]];
          [v33 setImageblockWidth:32 height:32];
          CFDictionaryRef v43 = [(NSArray *)v152->_inputChromaPyramid lastObject];

          int v44 = [(NSArray *)v152->_smoothedChromaPyramid count];
          if (v44 < 2)
          {
            id v50 = v43;
          }
          else
          {
            uint64_t v45 = (v44 - 2);
            int64x2_t v150 = vdupq_n_s64(0x20uLL);
            do
            {
              *(void *)&long long v153 = *(void *)&v152->_anon_281[343];
              DWORD2(v153) = *(_DWORD *)&v152->_anon_281[351];
              unsigned __int8 v46 = [(NSArray *)v152->_inputChromaPyramid objectAtIndexedSubscript:v45];
              long long v47 = [(NSArray *)v152->_smoothedChromaPyramid objectAtIndexedSubscript:v45];
              DWORD2(v153) = fmaxf(*((float *)&v153 + 2) * ldexpf(1.0, v45), *((float *)&v153 + 1));
              [v33 setBytes:&v153 length:12 atIndex:0];
              [v33 setTexture:v46 atIndex:0];
              [v33 setTexture:v43 atIndex:1];
              [v33 setTexture:v47 atIndex:2];
              id v48 = [v47 width];
              id v49 = [v47 height];
              v159[0] = v48;
              v159[1] = v49;
              v159[2] = 1;
              int64x2_t v157 = v150;
              uint64_t v158 = 1;
              [v33 dispatchThreads:v159 threadsPerThreadgroup:&v157];
              id v50 = v47;

              CFDictionaryRef v43 = v50;
              BOOL v31 = v45-- <= 0;
            }
            while (!v31);
          }
          [v33 endEncoding];
          if (gGMFigKTraceEnabled == 1) {
            kdebug_trace();
          }

          LODWORD(v127) = 1;
          self = v152;
          goto LABEL_92;
        }
        fig_log_get_emitter();
        FigDebugAssert3();
        int v124 = FigSignalErrorAt();
        goto LABEL_189;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
LABEL_184:
      float v86 = 0;
      unsigned int v75 = 0;
      int v9 = -12780;
      goto LABEL_165;
    }
LABEL_87:
    LODWORD(v127) = 0;
    goto LABEL_92;
  }
  uint64_t v127 = 0;
LABEL_92:
  if (!v185[0])
  {
    float v86 = 0;
    unsigned int v75 = 0;
    int v9 = 0;
    goto LABEL_165;
  }
  unint64_t v51 = 0;
  OSType v52 = 0;
  v142 = 0;
  v133 = &self->_anon_281[63];
  pipelineRenderStates = self->_pipelineRenderStates;
  v134 = &self->_anon_281[255];
  p_transformConfig = &self->_transformConfig;
  __asm { FMOV            V9.2S, #1.0 }
  while (1)
  {
    CFTypeRef v58 = &v188[2 * v51];
    id v60 = (void *)*((void *)v58 + 1);
    id v59 = (id *)(v58 + 2);
    unsigned int v61 = [v60 width];
    unsigned int v62 = [*v59 height];
    v63 = &v185[2 * v51];
    int32x2_t v65 = (void *)*((void *)v63 + 1);
    float v64 = (id *)(v63 + 2);
    unsigned int v151 = [v65 width];
    unsigned int v145 = [*v64 height];
    float v177 = 1.0 / (float)v61;
    int v9 = -[affineGPUMetal _getTransformShaderParameters:isLuma:isRGB:isAttachment:pixelRatio:pipelineIndexToUse:](v152, "_getTransformShaderParameters:isLuma:isRGB:isAttachment:pixelRatio:pipelineIndexToUse:", [*v64 pixelFormat], v51 == 0, PixelFormatType == 1111970369, v146, &v178, (char *)&v178 + 4);
    if (v9)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      float v86 = v142;
      unsigned int v75 = v52;
      goto LABEL_165;
    }
    if (!pipelineRenderStates[SHIDWORD(v178)] || (unsigned int v66 = v178) == 0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v9 = -12782;
      float v86 = v142;
      unsigned int v75 = v52;
      goto LABEL_165;
    }
    float32_t v67 = objc_opt_new();

    if (!v67)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v9 = FigSignalErrorAt();
      unsigned int v75 = 0;
      goto LABEL_175;
    }
    float32x4_t v68 = [v67 colorAttachments];
    float32x2_t v69 = [v68 objectAtIndexedSubscript:0];
    [v69 setLoadAction:0];

    CFTypeRef v70 = [v67 colorAttachments];
    int v71 = [v70 objectAtIndexedSubscript:0];
    [v71 setStoreAction:1];

    id v72 = *v64;
    unsigned int v73 = [v67 colorAttachments];
    float32x2_t v74 = [v73 objectAtIndexedSubscript:0];
    [v74 setTexture:v72];

    unsigned int v75 = v67;
    if (!v146) {
      break;
    }
LABEL_107:
    float v86 = [v139 renderCommandEncoderWithDescriptor:v75];

    if (!v86)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v9 = FigSignalErrorAt();
      float v86 = 0;
LABEL_170:
      unsigned int v75 = v67;
      goto LABEL_165;
    }
    [v86 setRenderPipelineState:pipelineRenderStates[SHIDWORD(v178)]];
    double v90 = (double)v145;
    if (v146)
    {
      LODWORD(v87) = v152->_inputWidth;
      *(double *)&unint64_t v91 = (double)v87;
      LODWORD(v88) = v152->_outputWidth;
      double v92 = *(double *)&v91 / (double)v88;
      LODWORD(v91) = v152->_inputHeight;
      LODWORD(v89) = v152->_outputHeight;
      double v93 = (double)v91 / (double)v89;
      double v94 = v92 * (double)v151;
      double v95 = -((double)v151 - (double)v151 * v92) * -0.5;
      double v96 = -(v90 - v90 * v93);
      double v90 = v93 * v90;
LABEL_116:
      double v98 = v96 * -0.5;
      goto LABEL_117;
    }
    unsigned int v97 = v61 / v66;
    double v95 = (double)(v61 / v66 - v151) * -0.5;
    if (v61 / v66 <= v151) {
      unsigned int v97 = v151;
    }
    double v94 = (double)v97;
    double v98 = 0.0;
    if (v61 / v66 <= v151) {
      double v95 = 0.0;
    }
    if (v62 > v145)
    {
      double v90 = (double)v62;
      double v96 = (double)(v62 - v145);
      goto LABEL_116;
    }
LABEL_117:
    *(double *)&long long v153 = v95;
    *((double *)&v153 + 1) = v98;
    *(double *)&long long v154 = v94;
    *((double *)&v154 + 1) = v90;
    long long v155 = xmmword_47500;
    [v86 setViewport:&v153];
    [v86 setVertexBuffer:v152->_verticesBuffer offset:0 atIndex:0];
    [v86 setVertexBuffer:v152->_matricesBuffer offset:0 atIndex:1];
    [v86 setVertexBytes:&v177 length:4 atIndex:2];
    [v86 setVertexBytes:p_transformConfig length:368 atIndex:3];
    if (v140)
    {
      [v86 setFragmentTexture:*v59 atIndex:0];
      int v9 = 0;
      unsigned int v99 = v152;
      goto LABEL_162;
    }
    if (v188[0])
    {
      unint64_t v100 = 0;
      do
      {
        [v86 setFragmentTexture:*(&v189 + v100) atIndex:v100];
        ++v100;
      }
      while (v100 < v188[0]);
    }
    if (v137) {
      [v86 setFragmentTexture:v137 atIndex:2];
    }
    unsigned int v99 = v152;
    if (v152->_bgCubePtr)
    {
      if (*(void *)&v152->_srlFixOn)
      {
        foregroundColorCube = v152->_foregroundColorCube;
        if (foregroundColorCube)
        {
          *((void *)&v153 + 1) = 0;
          *(void *)&long long v154 = 0;
          [(affineGPUMetal *)v152 _cachedTexturesFromPixelBuffer:foregroundColorCube isTwoPass:0 isOptimized:0 textures:&v153];
          [v86 setFragmentTexture:*((void *)&v153 + 1) atIndex:3];
          [v86 setFragmentTexture:v152->_bgCubeTexture atIndex:4];
          [v86 setFragmentTexture:v152->_segmentationMask atIndex:5];

          unsigned int v99 = v152;
        }
      }
    }
    if (v146)
    {
      if (BYTE4(v99[1].super.isa))
      {
        *(_WORD *)&v99->_anon_281[39] = 1;
        CVPixelBufferGetPixelFormatType(a4);
        if ((CMIGetPixelFormatInfo() & 0x100) != 0)
        {
          CMIGetPixelBufferYCCMatrix();
          CMIGetYCCFromRGBConversionMatrix();
          v99->_anon_281[40] = 1;
        }
        else
        {
          long long v102 = xmmword_47620;
          long long v103 = unk_47630;
          long long v104 = _PromotedConst_0;
          long long v105 = unk_47610;
        }
        int v9 = 0;
        *((_DWORD *)v133 + 18) = DWORD2(v104);
        *((_DWORD *)v133 + 22) = DWORD2(v105);
        *((_DWORD *)v133 + 26) = DWORD2(v102);
        *((_DWORD *)v133 + 30) = DWORD2(v103);
        *((void *)v133 + 8) = v104;
        *(_DWORD *)&v99->_anon_281[139] = 0;
        *((void *)v133 + 10) = v105;
        *(_DWORD *)&v99->_anon_281[155] = 0;
        *((void *)v133 + 12) = v102;
        *(_DWORD *)&v99->_anon_281[171] = 0;
        *((void *)v133 + 14) = v103;
        *(_DWORD *)&v99->_anon_281[187] = 0;
        goto LABEL_162;
      }
LABEL_136:
      int v9 = 0;
      goto LABEL_162;
    }
    if (!v99->_reverseCoefficients && !v99->_intermediateOutputUnstyledPixelBuffer) {
      goto LABEL_136;
    }
    CVPixelBufferGetPixelFormatType(a3);
    CVPixelBufferGetPixelFormatType(a4);
    __int16 v106 = CMIGetPixelFormatInfo();
    __int16 v107 = CMIGetPixelFormatInfo();
    simd_float4 v143 = 0u;
    if ((v106 & 0x100) != 0)
    {
      int v108 = CMIGetPixelBufferYCCMatrix();
      int v109 = v108;
      if (v108 != 5 && v108)
      {
        CMIGetRGBFromYCCConversionMatrix();
        int v112 = 0;
        int v9 = 0;
      }
      else
      {
        fig_log_get_emitter();
        uint64_t v126 = v128;
        LODWORD(v125) = 0;
        FigDebugAssert3();
        long long v110 = xmmword_472A0;
        long long v111 = xmmword_47280;
        int v9 = -12780;
        int v112 = 4;
        long long v113 = 0uLL;
        long long v114 = xmmword_47260;
        if (!v109) {
          goto LABEL_153;
        }
      }
      long long v129 = v110;
      long long v130 = v114;
      long long v131 = v111;
      long long v132 = v113;
      if (v109 == 5) {
        goto LABEL_153;
      }
    }
    else
    {
      int v9 = 0;
      long long v132 = 0uLL;
      long long v130 = xmmword_47260;
      long long v131 = xmmword_47280;
      long long v129 = xmmword_472A0;
    }
    if ((v107 & 0x100) == 0)
    {
      v115.columns[2] = (simd_float4)xmmword_47260;
      v115.columns[1] = (simd_float4)xmmword_47280;
      v115.columns[0] = (simd_float4)xmmword_472A0;
LABEL_155:
      *((_DWORD *)v133 + 2) = DWORD2(v129);
      *(void *)v133 = v129;
      *(_DWORD *)&v99->_anon_281[75] = 0;
      *((_DWORD *)v133 + 6) = DWORD2(v131);
      *((void *)v133 + 2) = v131;
      *(_DWORD *)&v99->_anon_281[91] = 0;
      *((_DWORD *)v133 + 10) = DWORD2(v130);
      *((void *)v133 + 4) = v130;
      *(_DWORD *)&v99->_anon_281[107] = 0;
      *((_DWORD *)v133 + 14) = DWORD2(v132);
      *((void *)v133 + 6) = v132;
      *(_DWORD *)&v99->_anon_281[123] = 0;
      *(simd_float4 *)&v99->_anon_281[127] = v115.columns[0];
      *(simd_float4 *)&v99->_anon_281[143] = v115.columns[1];
      simd_float4 v118 = v143;
      *(simd_float4 *)&v99->_anon_281[159] = v115.columns[2];
      *(simd_float4 *)&v99->_anon_281[175] = v143;
      v115.columns[0].i32[3] = 0;
      v115.columns[1].i32[3] = 0;
      v115.columns[2].i32[3] = 0;
      v118.i32[3] = 1.0;
      v115.columns[3] = v118;
      simd_float4x4 v193 = __invert_f4(v115);
      *((_DWORD *)v133 + 34) = v193.columns[0].i32[2];
      *((void *)v133 + 16) = v193.columns[0].i64[0];
      *((_DWORD *)v133 + 38) = v193.columns[1].i32[2];
      *((void *)v133 + 18) = v193.columns[1].i64[0];
      *((_DWORD *)v133 + 42) = v193.columns[2].i32[2];
      *((void *)v133 + 20) = v193.columns[2].i64[0];
      *((_DWORD *)v133 + 46) = v193.columns[3].i32[2];
      *((void *)v133 + 22) = v193.columns[3].i64[0];
      int32x4_t v119 = v99->_reverseCoefficients;
      if (v119)
      {
        [v86 setFragmentTexture:v119 atIndex:6];
        if (HIDWORD(v127))
        {
          long long v120 = [(NSArray *)v99->_smoothedLumaPyramid firstObject];
          [v86 setFragmentTexture:v120 atIndex:8];

          unsigned int v99 = v152;
        }
        if (v127)
        {
          int v121 = [(NSArray *)v99->_smoothedChromaPyramid firstObject];
          [v86 setFragmentTexture:v121 atIndex:9];

          unsigned int v99 = v152;
        }
      }
      intermediateOutputUnstyledPixelBuffer = v99->_intermediateOutputUnstyledPixelBuffer;
      if (intermediateOutputUnstyledPixelBuffer) {
        [v86 setFragmentTexture:intermediateOutputUnstyledPixelBuffer atIndex:7];
      }
      goto LABEL_162;
    }
    int v116 = CMIGetPixelBufferYCCMatrix();
    int v117 = v116;
    if (v116 != 5 && v116)
    {
      CMIGetYCCFromRGBConversionMatrix();
      simd_float4 v143 = v115.columns[3];
      int v112 = 0;
LABEL_152:
      if (v117 != 5) {
        goto LABEL_155;
      }
      goto LABEL_153;
    }
    fig_log_get_emitter();
    uint64_t v126 = v128;
    LODWORD(v125) = 0;
    FigDebugAssert3();
    v115.columns[0] = (simd_float4)xmmword_472A0;
    v115.columns[1] = (simd_float4)xmmword_47280;
    int v9 = -12780;
    int v112 = 4;
    simd_float4 v143 = 0u;
    v115.columns[2] = (simd_float4)xmmword_47260;
    if (v117) {
      goto LABEL_152;
    }
LABEL_153:
    if (v112) {
      goto LABEL_170;
    }
LABEL_162:
    v99->_anon_281[31] = v99->_forwardCoefficients;
    *(_DWORD *)&v99->_anon_281[35] = HIDWORD(v99->_forwardCoefficients);
    *(float32x2_t *)&v99->_anon_281[55] = vdiv_f32(_D9, vcvt_f32_u32((uint32x2_t)__PAIR64__(v145, v151)));
    objc_msgSend(v86, "setFragmentBytes:length:atIndex:", p_transformConfig, 368, 0, v125, v126);
    [v86 setTriangleFillMode:0];
    [v86 drawIndexedPrimitives:3 indexCount:(unint64_t)v152->_swathRenderVertexIndicesBufferSize >> 1 indexType:0 indexBuffer:v152->_vertexIndicesBuffer indexBufferOffset:0];
    [v86 endEncoding];
    ++v51;
    unsigned int v75 = v67;
    OSType v52 = v67;
    v142 = v86;
    if (v51 >= v185[0]) {
      goto LABEL_165;
    }
  }
  if (!v152->_intermediateOutputUnstyledPixelBuffer)
  {
LABEL_104:
    uint64_t v82 = *(void *)&v152->_ditherNoStyle;
    if (v82)
    {
      int v9 = [(affineGPUMetal *)v152 _cachedTexturesFromPixelBuffer:v82 isTwoPass:v140 isOptimized:1 textures:v179];
      if (v9)
      {
        fig_log_get_emitter();
        unsigned int v75 = v67;
        FigDebugAssert3();
        float v86 = v142;
        goto LABEL_165;
      }
      v152->_anon_281[355] = 1;
      id v83 = v180;
      float v84 = [v67 colorAttachments];
      float v85 = [v84 objectAtIndexedSubscript:2];
      [v85 setTexture:v83];

      unsigned int v75 = v67;
    }
    goto LABEL_107;
  }
  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  CFTypeRef v76 = CMGetAttachment(a3, @"OutputSmartStyleDeltaMapPixelBuffer", 0);
  if (!v76)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v9 = -12780;
    goto LABEL_175;
  }
  int v9 = CMIGetYCCFromRGBConversionMatrixForPixelBuffer();
  if (!v9)
  {
    long long v77 = v154;
    *(_OWORD *)v134 = v153;
    *((_OWORD *)v134 + 1) = v77;
    long long v78 = v156;
    *((_OWORD *)v134 + 2) = v155;
    *((_OWORD *)v134 + 3) = v78;
    int v9 = [(affineGPUMetal *)v152 _cachedTexturesFromPixelBuffer:v76 isTwoPass:0 isOptimized:0 textures:v182];
    if (!v9)
    {
      id v79 = v183;
      float v80 = [v67 colorAttachments];
      float v81 = [v80 objectAtIndexedSubscript:1];
      [v81 setTexture:v79];

      unsigned int v75 = v67;
      goto LABEL_104;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_175:
  float v86 = v142;
LABEL_165:

  return v9;
}

- (int)_renderBlurInputTextures:(id *)a3 inputTexturesCount:(unsigned int)a4 outputTextures:(id *)a5
{
  int v43 = 0;
  if (!a4 || !a3 || (uint64_t v6 = a5) == 0 || LODWORD(self->_blurVertexIndices) > 0x1000)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  int v9 = [(FigMetalContext *)self->_metalContext commandQueue];
  objc_super v10 = [v9 commandBuffer];

  if (v10)
  {
    if (v6->var0)
    {
      CFStringRef v39 = v6;
      int32x2_t v40 = v10;
      unint64_t v11 = 0;
      v12 = 0;
      v13 = 0;
      id v14 = 0;
      pipelineRenderStates = self->_pipelineRenderStates;
      var1 = a3->var1;
      uint64_t v16 = a4;
      while (1)
      {
        id v41 = v14;
        uint64_t v17 = (char *)v6 + 8 * v11;
        unsigned int v19 = (void *)*((void *)v17 + 1);
        int v18 = (uint64_t *)(v17 + 8);
        unsigned int v20 = -[affineGPUMetal _getBlurShaderParameters:pipelineIndexToUse:](self, "_getBlurShaderParameters:pipelineIndexToUse:", [v19 pixelFormat], &v43);
        if (v20)
        {
          int v37 = v20;
          fig_log_get_emitter();
          FigDebugAssert3();

LABEL_24:
          return v37;
        }
        if (!pipelineRenderStates[v43])
        {
          fig_log_get_emitter();
          FigDebugAssert3();

          return -12782;
        }
        id v21 = [(FigMetalContext *)self->_metalContext device];
        id v22 = [v21 newBufferWithBytes:*(void *)&self->_blurVertexIndicesSize length:self->_P3ToBT2020ConversionMethod options:0];

        if (!v22)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          int v37 = FigSignalErrorAt();

          goto LABEL_24;
        }
        CFStringRef v23 = objc_opt_new();

        if (!v23)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          int v37 = FigSignalErrorAt();

          return v37;
        }
        int v24 = [v23 colorAttachments];
        uint64_t v25 = [v24 objectAtIndexedSubscript:0];
        [v25 setLoadAction:1];

        size_t v26 = [v23 colorAttachments];
        v27 = [v26 objectAtIndexedSubscript:0];
        [v27 setStoreAction:1];

        uint64_t v28 = *v18;
        id v29 = [v23 colorAttachments];
        id v30 = [v29 objectAtIndexedSubscript:0];
        [v30 setTexture:v28];

        BOOL v31 = [v40 renderCommandEncoderWithDescriptor:v23];

        if (!v31) {
          break;
        }
        v12 = v31;
        [v31 setRenderPipelineState:pipelineRenderStates[v43]];
        [v31 setVertexBytes:*(void *)&self->_blurVertexSize length:LODWORD(self->_blurVertexIndices) atIndex:0];
        uint64_t v32 = 0;
        int v33 = var1;
        do
        {
          id v34 = *v33;
          v33 += 3;
          [v12 setFragmentTexture:v34 atIndex:v32++];
        }
        while (v16 != v32);
        [v12 setFragmentBytes:&self->_anon_429[11] length:32 atIndex:0];
        [v12 setTriangleFillMode:0];
        [v12 drawIndexedPrimitives:3 indexCount:(unint64_t)self->_P3ToBT2020ConversionMethod >> 1 indexType:0 indexBuffer:v22 indexBufferOffset:0];
        [v12 endEncoding];
        ++v11;
        uint64_t v6 = v39;
        ++var1;
        v13 = v22;
        id v14 = v23;
        if (v11 >= v39->var0)
        {

          objc_super v10 = v40;
          goto LABEL_17;
        }
      }
      fig_log_get_emitter();
      FigDebugAssert3();
      int v37 = FigSignalErrorAt();
    }
    else
    {
LABEL_17:
      [(affineGPUMetal *)self _addCommandBufferHandler:v10];
      if (gGMFigKTraceEnabled)
      {
        int v35 = [v10 commandQueue];
        id v36 = [v35 commandBuffer];

        [v36 setLabel:@"KTRACE_MTLCMDBUF"];
        [v36 addCompletedHandler:&__block_literal_global_127];
        [v36 commit];
        [v10 addCompletedHandler:&__block_literal_global_129];
      }
      [v10 commit];

      return 0;
    }
    return v37;
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_blurDeltaMapBordersFromStyledPixelBuffer:(__CVBuffer *)a3 withUnstyledPixelBuffer:(__CVBuffer *)a4 to:(__CVBuffer *)a5
{
  int v35 = 0;
  id v33 = 0;
  id v34 = 0;
  id v31 = 0;
  id v32 = 0;
  id v28 = 0;
  id v29 = 0;
  if (!a3 || !a4 || !a5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v14 = 0;
    id v12 = 0;
    objc_super v10 = 0;
    CFStringRef v23 = 0;
    int v8 = -12780;
    goto LABEL_16;
  }
  int v8 = -[affineGPUMetal _cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:](self, "_cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:");
  if (v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_22:
    id v14 = 0;
    id v12 = 0;
    objc_super v10 = 0;
LABEL_29:
    CFStringRef v23 = 0;
    goto LABEL_16;
  }
  int v8 = [(affineGPUMetal *)self _cachedTexturesFromPixelBuffer:a4 isTwoPass:1 isOptimized:0 textures:v30];
  if (v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_22;
  }
  int v8 = [(affineGPUMetal *)self _cachedTexturesFromPixelBuffer:a5 isTwoPass:0 isOptimized:0 textures:v27];
  if (v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_22;
  }
  int v9 = [(FigMetalContext *)self->_metalContext commandQueue];
  objc_super v10 = [v9 commandBuffer];

  if (!v10)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v8 = FigSignalErrorAt();
    goto LABEL_22;
  }
  int v8 = -[affineGPUMetal _getBlurDeltaMapBordersShaderParameters:pipelineIndexToUse:](self, "_getBlurDeltaMapBordersShaderParameters:pipelineIndexToUse:", [v28 pixelFormat], &v35);
  if (v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_26:
    id v14 = 0;
    id v12 = 0;
    goto LABEL_29;
  }
  if (!self->_pipelineRenderStates[v35])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v14 = 0;
    id v12 = 0;
    CFStringRef v23 = 0;
    int v8 = -12782;
    goto LABEL_16;
  }
  unint64_t v11 = [(FigMetalContext *)self->_metalContext device];
  id v12 = [v11 newBufferWithBytes:&self->_blurRenderIndices[5] length:96 options:0];

  if (!v12)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v8 = FigSignalErrorAt();
    goto LABEL_26;
  }
  v13 = objc_opt_new();
  id v14 = v13;
  if (!v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v8 = FigSignalErrorAt();
    id v14 = 0;
    goto LABEL_29;
  }
  id v15 = [v13 colorAttachments];
  uint64_t v16 = [v15 objectAtIndexedSubscript:0];
  [v16 setLoadAction:1];

  uint64_t v17 = [v14 colorAttachments];
  int v18 = [v17 objectAtIndexedSubscript:0];
  [v18 setStoreAction:1];

  id v19 = v28;
  unsigned int v20 = [v14 colorAttachments];
  id v21 = [v20 objectAtIndexedSubscript:0];
  [v21 setTexture:v19];

  id v22 = [v10 renderCommandEncoderWithDescriptor:v14];
  CFStringRef v23 = v22;
  if (!v22)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v8 = FigSignalErrorAt();
    goto LABEL_29;
  }
  [v22 setRenderPipelineState:self->_pipelineRenderStates[v35]];
  [v23 setVertexBytes:&self->_blurRenderVertices[10] length:128 atIndex:0];
  [v23 setFragmentTexture:v33 atIndex:0];
  [v23 setFragmentTexture:v34 atIndex:1];
  [v23 setFragmentTexture:v31 atIndex:2];
  [v23 setFragmentTexture:v32 atIndex:3];
  [v23 setFragmentTexture:self->_intermediateOutputUnstyledPixelBuffer atIndex:4];
  [v23 setFragmentBytes:&self->_transformConfig length:368 atIndex:0];
  [v23 setTriangleFillMode:0];
  [v23 drawIndexedPrimitives:3 indexCount:48 indexType:0 indexBuffer:v12 indexBufferOffset:0];
  [v23 endEncoding];
  [(affineGPUMetal *)self _addCommandBufferHandler:v10];
  if (gGMFigKTraceEnabled)
  {
    int v24 = [v10 commandQueue];
    uint64_t v25 = [v24 commandBuffer];

    [v25 setLabel:@"KTRACE_MTLCMDBUF"];
    [v25 addCompletedHandler:&__block_literal_global_140];
    [v25 commit];
    [v10 addCompletedHandler:&__block_literal_global_142];
  }
  [v10 commit];
  int v8 = 0;
LABEL_16:

  return v8;
}

- (int)getBlurBuffersDecimationFactor
{
  return 2;
}

- (void)configureBlurWith:(id *)a3
{
  if (!a3) {
    goto LABEL_16;
  }
  int var0 = a3->var0;
  LOBYTE(self->_blurOverscan.width) = a3->var0 != 0;
  if (!var0) {
    return;
  }
  if (a3->var1 < 4) {
    goto LABEL_16;
  }
  *(_OWORD *)self->_blurPreviousTextureIndefloat x = 0u;
  HIDWORD(self->_blurOverscan.width) = 5;
  *(_DWORD *)&self->_blurRadiusTable[4] = 4;
  *(float64x2_t *)&self->_blurOverscan.height = vcvtq_f64_f32(vcvt_f32_s32(*(int32x2_t *)&a3->var2));
  *(void *)&self->_blurBorderVertices[10] = 0x3F800000BF800000;
  __asm { FMOV            V1.2S, #1.0 }
  *(void *)&self->_blurBorderVertices[18] = _D1;
  __asm { FMOV            V2.2S, #-1.0 }
  *(void *)&self->_blurBorderVertices[26] = _D2;
  *(void *)&self->_blurBorderVertices[34] = 0xBF8000003F800000;
  *(void *)&self->_blurBorderVertices[42] = 0x3F800000BF800000;
  *(void *)&self->_blurBorderVertices[50] = _D1;
  *(void *)&self->_blurBorderVertices[58] = _D2;
  *(void *)&self->_blurRenderIndices[1] = 0xBF8000003F800000;
  *(_OWORD *)&self->_blurBorderIndices[4] = xmmword_47510;
  *(_OWORD *)&self->_blurBorderIndices[12] = xmmword_47520;
  *(_OWORD *)&self->_blurBorderIndices[20] = xmmword_47530;
  *(void *)&self->_blurRenderVertices[10] = 0x3F800000BF800000;
  *(void *)&self->_blurRenderVertices[18] = 0x3F800000BF800000;
  *(void *)&self->_blurRenderVertices[26] = _D1;
  *(void *)&self->_blurRenderVertices[34] = _D1;
  *(void *)&self->_blurRenderVertices[42] = 0x3F800000BF800000;
  *(void *)&self->_blurRenderVertices[50] = 0x3F800000BF800000;
  *(void *)&self->_blurRenderVertices[58] = _D1;
  *(void *)&self->_blurRenderVertices[66] = _D1;
  *(void *)&self->_blurRenderVertices[74] = _D2;
  *(void *)&self->_blurRenderVertices[82] = _D2;
  *(void *)&self->_blurRenderVertices[90] = 0xBF8000003F800000;
  *(void *)&self->_blurRenderVertices[98] = 0xBF8000003F800000;
  *(void *)&self->_blurRenderVertices[106] = _D2;
  *(void *)&self->_blurRenderVertices[114] = _D2;
  *(void *)&self->_blurRenderVertices[122] = 0xBF8000003F800000;
  *(void *)self->_blurFrameCounter = 0xBF8000003F800000;
  *(_OWORD *)&self->_blurRenderIndices[5] = xmmword_47540;
  *(_OWORD *)&self->_blurRenderIndices[13] = xmmword_47550;
  *(_OWORD *)&self->_blurRenderIndices[21] = xmmword_47560;
  *(_OWORD *)&self->_blurRenderIndices[29] = xmmword_47570;
  *(_OWORD *)&self->_blurRenderIndices[37] = xmmword_47580;
  *(_OWORD *)&self->_blurRenderIndices[45] = xmmword_47590;
  *(void *)&self->_blurRadiusTable[8] = 0x102030201020100;
  self->_blurBorderIndices[3] = 257;
  if (-[affineGPUMetal _cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:](self, "_cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:", a3->var8[0], 1, 0, self->_blurTempTextures[0][0].texture)|| -[affineGPUMetal _cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:](self, "_cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:", a3->var8[1], 1, 0, self->_blurPreviousTextures[0][0].texture)|| -[affineGPUMetal _cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:](self, "_cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:", a3->var8[2], 1, 0,
         self->_blurPreviousTextures[0][1].texture)
    || -[affineGPUMetal _cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:](self, "_cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:", a3->var8[3], 1, 0, self->_blurPreviousTextures[0][2].texture)|| (id v12 = a3->var9[0]) != 0&& (-[affineGPUMetal _cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:](self, "_cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:", v12, 1, 0, self->_blurTempTextures[1][0].texture)|| -[affineGPUMetal _cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:](self, "_cachedTexturesFromPixelBuffer:isTwoPass:isOptimized:textures:", a3->var9[1], 1,
          0,
          self->_blurPreviousTextures[1][0].texture)
     || [(affineGPUMetal *)self _cachedTexturesFromPixelBuffer:a3->var9[2] isTwoPass:1 isOptimized:0 textures:self->_blurPreviousTextures[1][1].texture]|| [(affineGPUMetal *)self _cachedTexturesFromPixelBuffer:a3->var9[3] isTwoPass:1 isOptimized:0 textures:self->_blurPreviousTextures[1][2].texture]))
  {
LABEL_16:
    fig_log_get_emitter();
    FigDebugAssert3();
    return;
  }
  if (a3->var10)
  {
    LOBYTE(self->_ditherStrengthChroma) = 1;
    *(_OWORD *)&self->_float fbsDeltaThresholdLuma = xmmword_475A0;
    *(void *)&self->_attachmentIsLinearThumbnail = 0x3C8080813B008081;
  }
}

- (void)_blurDuplicatedPixelsOnPixelBuffer:(__CVBuffer *)a3 validBufferRect:(CGRect *)a4 forDeltaMap:(BOOL)a5
{
  id v108 = 0;
  id v109 = 0;
  uint64_t v116 = 0;
  uint64_t v117 = 0;
  uint64_t v119 = 0;
  uint64_t v120 = 0;
  uint64_t v122 = 0;
  uint64_t v123 = 0;
  id v105 = 0;
  id v106 = 0;
  uint64_t v111 = 0;
  uint64_t v112 = 0;
  uint64_t v113 = 0;
  uint64_t v114 = 0;
  if (a3)
  {
    BOOL v5 = a5;
    if ([(affineGPUMetal *)self _cachedTexturesFromPixelBuffer:a3 isTwoPass:1 isOptimized:0 textures:&v107])
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      p_inputWidth = &self->_inputWidth;
      ++self->_blurPreviousTextureIndex[v5];
      *(void *)&self->_blurBorderVertices[42] = 0x3F800000BF800000;
      __asm { FMOV            V0.2S, #1.0 }
      *(void *)&self->_blurBorderVertices[50] = _D0;
      __asm { FMOV            V13.2S, #-1.0 }
      *(void *)&self->_blurBorderVertices[58] = _D13;
      *(void *)&self->_blurRenderIndices[1] = 0xBF8000003F800000;
      double height = self->_blurOverscan.height;
      double v13 = *(double *)&self->_blurNoiseRadius;
      uint64_t v102 = _D0;
      if (a4)
      {
        double height = height + a4->origin.x;
        double v13 = v13 + a4->origin.y;
      }
      uint64_t v14 = *(void *)&self->_swathMatricesBufferSize;
      uint64_t v15 = *(void *)&self->_texMatCount[4];
      uint32x2_t v17 = *(uint32x2_t *)p_inputWidth;
      uint64_t v16 = *(void *)&self->_outputWidth;
      v18.i64[0] = *(void *)p_inputWidth;
      v18.i64[1] = HIDWORD(*(void *)p_inputWidth);
      float64x2_t v19 = vcvtq_f64_u64(v18);
      float32x2_t v20 = 0;
      if (a4)
      {
        float64x2_t v97 = v19;
        uint64_t v100 = *(void *)&self->_texMatCount[4];
        BOOL IsNull = CGRectIsNull(*a4);
        float64x2_t v19 = v97;
        CGSize size = (CGSize)v97;
        uint64_t v15 = v100;
        if (!IsNull)
        {
          CGSize size = a4->size;
          float32x2_t v20 = vcvt_f32_f64((float64x2_t)a4->origin);
        }
      }
      else
      {
        CGSize size = (CGSize)v19;
      }
      uint64_t v23 = 0;
      BOOL v24 = v5;
      v25.i64[0] = v16;
      v25.i64[1] = HIDWORD(v16);
      float64x2_t v26 = vcvtq_f64_u64(v25);
      float v27 = height / v26.f64[0];
      float v98 = (float)(v27 * 2.0) + -1.0;
      float v28 = v13 / v26.f64[1];
      float v29 = (float)((float)(v27 * -2.0) + 1.0) + (float)((float)(v27 * -2.0) + 1.0);
      float v96 = (float)(v28 * -2.0) + 1.0;
      float v30 = v96 + v96;
      float32x2_t v31 = vcvt_f32_f64(vdivq_f64(v19, v26));
      *(float32x2_t *)&v26.f64[0] = vcvt_f32_u32(v17);
      float32x2_t v32 = vmla_f32((float32x2_t)0x3F800000BF800000, (float32x2_t)0xC000000040000000, vdiv_f32(v20, *(float32x2_t *)&v26.f64[0]));
      *(float32x2_t *)&v26.f64[0] = vmla_f32(v32, (float32x2_t)0xC000000040000000, vdiv_f32(vcvt_f32_f64((float64x2_t)size), *(float32x2_t *)&v26.f64[0]));
      v132[0] = v32;
      v132[1] = __PAIR64__(v32.u32[1], LODWORD(v26.f64[0]));
      v32.i32[1] = HIDWORD(v26.f64[0]);
      v132[2] = v32;
      v132[3] = *(void *)&v26.f64[0];
      int v124 = 0;
      int v125 = v15 + v15 * HIDWORD(v15);
      int v126 = HIDWORD(v15);
      int v127 = v125 + HIDWORD(v15);
      _S9 = -0.5;
      do
      {
        simd_float3x3 v133 = __invert_f3(*(simd_float3x3 *)(v14 + 48 * *(&v124 + v23)));
        _D3 = v132[v23];
        __asm { FMLA            S5, S9, V3.S[1] }
        v133.columns[0] = (simd_float3)vaddq_f32((float32x4_t)v133.columns[2], vmlaq_n_f32(vmulq_n_f32((float32x4_t)v133.columns[0], vmlas_n_f32(0.5, 0.5, *(float *)&_D3)), (float32x4_t)v133.columns[1], _S5));
        *(&v128 + v23++) = vmul_f32(vmla_f32((float32x2_t)0x3F800000BF800000, (float32x2_t)0xC000000040000000, vdiv_f32(*(float32x2_t *)v133.columns[0].f32, (float32x2_t)vdup_laneq_s32((int32x4_t)v133.columns[0], 2))), v31);
      }
      while (v23 != 4);
      uint64_t v36 = 0;
      uint64_t v37 = 1;
      uint64_t v38 = 8;
      do
      {
        uint64_t v39 = v38;
        do
        {
          float32x2_t v40 = *(&v128 + v36);
          float32x2_t v41 = *(float32x2_t *)((char *)&v128 + v39);
          if (vcgt_f32(v41, v40).i32[1])
          {
            *(&v128 + v36) = v41;
            *(float32x2_t *)((char *)&v128 + v39) = v40;
          }
          v39 += 8;
        }
        while (v39 != 32);
        ++v37;
        v38 += 8;
        uint64_t v36 = 1;
      }
      while (v37 != 3);
      float32x2_t v42 = v130;
      unsigned __int8 v43 = vcgt_f32(v130, v131).u8[0];
      _ZF = (v43 & 1) == 0;
      if (v43) {
        float v45 = v130.f32[0];
      }
      else {
        float v45 = v131.f32[0];
      }
      if (v43) {
        float v46 = v131.f32[0];
      }
      else {
        float v46 = v130.f32[0];
      }
      if (v43) {
        float32x2_t v47 = v130;
      }
      else {
        float32x2_t v47 = v131;
      }
      if (!_ZF) {
        float32x2_t v42 = v131;
      }
      if (vcgt_f32(v128, v129).u8[0]) {
        unsigned int v48 = -1;
      }
      else {
        unsigned int v48 = 0;
      }
      int8x8_t v49 = (int8x8_t)vdup_n_s32(v48);
      int8x8_t v50 = vbsl_s8(v49, (int8x8_t)v129, (int8x8_t)v128);
      int8x8_t v51 = vbsl_s8(v49, (int8x8_t)v128, (int8x8_t)v129);
      *(void *)&self->_blurRenderVertices[10] = 0x3F800000BF800000;
      float v52 = *(float *)&v50.i32[1];
      if (*(float *)&v50.i32[1] < 1.0) {
        float v52 = 1.0;
      }
      float v53 = *(float *)&v51.i32[1];
      if (*(float *)&v51.i32[1] < 1.0) {
        float v53 = 1.0;
      }
      if (*(float *)v50.i32 <= -1.0) {
        float v54 = *(float *)v50.i32;
      }
      else {
        float v54 = -1.0;
      }
      HIDWORD(v55) = v50.i32[1];
      *(int8x8_t *)&self->_blurRenderVertices[50] = v50;
      *(float *)&v50.i32[1] = v52;
      *(int8x8_t *)&self->_blurRenderVertices[18] = v50;
      *(void *)&self->_blurRenderVertices[26] = __PAIR64__(LODWORD(v53), v51.u32[0]);
      *(float *)&uint64_t v55 = v54;
      *(void *)&self->_blurRenderVertices[34] = v102;
      *(int8x8_t *)&self->_blurRenderVertices[58] = v51;
      if (*(float *)v51.i32 >= 1.0) {
        float v56 = *(float *)v51.i32;
      }
      else {
        float v56 = 1.0;
      }
      *(float *)v51.i32 = v56;
      *(void *)&self->_blurRenderVertices[42] = v55;
      *(int8x8_t *)&self->_blurRenderVertices[66] = v51;
      if (v46 > -1.0) {
        float v46 = -1.0;
      }
      *(void *)&self->_blurRenderVertices[74] = __PAIR64__(v42.u32[1], LODWORD(v46));
      *(float32x2_t *)&self->_blurRenderVertices[82] = v42;
      *(float32x2_t *)&self->_blurRenderVertices[90] = v47;
      if (v45 < 1.0) {
        float v45 = 1.0;
      }
      *(void *)&self->_blurRenderVertices[98] = __PAIR64__(v47.u32[1], LODWORD(v45));
      *(void *)&self->_blurRenderVertices[106] = _D13;
      if (v42.f32[1] <= -1.0) {
        float v57 = v42.f32[1];
      }
      else {
        float v57 = -1.0;
      }
      v42.f32[1] = v57;
      *(float32x2_t *)&self->_blurRenderVertices[114] = v42;
      if (v47.f32[1] <= -1.0) {
        float v58 = v47.f32[1];
      }
      else {
        float v58 = -1.0;
      }
      v47.f32[1] = v58;
      *(float32x2_t *)&self->_blurRenderVertices[122] = v47;
      *(void *)self->_blurFrameCounter = 0xBF8000003F800000;
      int v59 = HIDWORD(self->_blurOverscan.width) & 1;
      blurTempTextures = self->_blurTempTextures;
      __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE(&v110[24 * (HIDWORD(self->_blurOverscan.width) & 1)], self->_blurPreviousTextures[v24][*(&self->_blurTempTextures[0][0].count + v24)].texture);
      __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE(&v110[24 * (v59 ^ 1)], self->_blurTempTextures[v24][0].texture);
      LODWORD(width_high) = HIDWORD(self->_blurOverscan.width);
      if (width_high)
      {
        unint64_t v61 = 0;
        uint64_t v62 = 0;
        *(float *)v63.i32 = v98;
        *(float *)&uint64_t v64 = v98 + v29;
        *(float *)&v63.i32[1] = v96 - v30;
        int32x2_t v95 = v63;
        *((float *)&v64 + 1) = v96 - v30;
        uint64_t v94 = v64;
        _S9 = 10.0;
        _S10 = -10.0;
        do
        {
          uint64_t v67 = (width_high - 1);
          if (v61 == v67)
          {
            BOOL v68 = self->_blurPreviousTextureIndex[v24] > 2;
            if (!v61) {
              goto LABEL_61;
            }
            texture = self->_blurPreviousTextures[v24][0].texture;
            __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE(&v115, &texture[3 * *(&(*blurTempTextures)[0].count + v24)]);
            __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE(&v118, &texture[3 * ((*(&(*blurTempTextures)[0].count + v24) + 1) % 3)]);
            __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE(&v121, &texture[3 * ((*(&(*blurTempTextures)[0].count + v24) + 2) % 3)]);
            uint64_t v71 = 3;
          }
          else
          {
            if (!v61)
            {
              BOOL v68 = 0;
LABEL_61:
              __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE(&v115, &v107);
              uint64_t v71 = 1;
              v70.i32[0] = 2.0;
LABEL_62:
              unsigned int v72 = self->_blurRadiusTable[v61 + 8];
              goto LABEL_63;
            }
            __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE(&v115, &v110[24 * (v62 ^ 1)]);
            BOOL v68 = 0;
            uint64_t v71 = 1;
          }
          v70.i32[0] = 4.0;
          if (v61 <= 9) {
            goto LABEL_62;
          }
          unsigned int v72 = 1;
LABEL_63:
          _D5 = vdiv_f32((float32x2_t)vdup_lane_s32(v70, 0), vcvt_f32_u32(*(uint32x2_t *)&self->_outputWidth));
          *(float *)v80.i32 = vmlas_n_f32(v98, 10.0, _D5.f32[0]);
          __asm { FMLA            S1, S10, V5.S[1] }
          double v75 = COERCE_DOUBLE(__PAIR64__(_S1, v80.u32[0]));
          *(float *)&uint64_t v81 = vmlas_n_f32(v98 + v29, -10.0, _D5.f32[0]);
          double v76 = COERCE_DOUBLE(__PAIR64__(_S1, v81));
          float32x2_t v101 = _D5;
          __asm { FMLA            S1, S9, V5.S[1] }
          v80.i32[1] = _S1;
          HIDWORD(v81) = _S1;
          double v82 = COERCE_DOUBLE(__PAIR64__(LODWORD(v96), LODWORD(v98)));
          if (!(!_ZF & _CF)) {
            double v82 = v75;
          }
          double v83 = COERCE_DOUBLE(__PAIR64__(LODWORD(v96), v98 + v29));
          if (!_ZF & _CF) {
            int32x2_t v80 = v95;
          }
          else {
            double v83 = v76;
          }
          if (!_ZF & _CF) {
            uint64_t v81 = v94;
          }
          *(double *)&self->_blurBorderVertices[42] = v82;
          *(double *)&self->_blurBorderVertices[50] = v83;
          *(int32x2_t *)&self->_blurBorderVertices[58] = v80;
          *(void *)&self->_blurRenderIndices[1] = v81;
          if (v61 == v67) {
            float v84 = &v107;
          }
          else {
            float v84 = (int *)&v110[24 * v62];
          }
          if (v61 == v67) {
            *(float *)v80.i32 = 1.0;
          }
          else {
            *(float *)v80.i32 = 2.0;
          }
          int32x2_t v103 = v80;
          __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE(&v104, v84);
          float32x2_t v85 = vcvt_f32_u32(*(uint32x2_t *)&self->_outputWidth);
          *(float32x2_t *)&self->_anon_429[19] = vmul_n_f32(vdiv_f32((float32x2_t)vdup_lane_s32(v103, 0), v85), (float)v72 + 0.5);
          float32x2_t v86 = 0;
          if (!v61) {
            float32x2_t v86 = vmul_n_f32(v101, (float)*(int *)&self->_blurRadiusTable[4]);
          }
          *(float32x2_t *)&self->_anon_429[27] = v86;
          if (v61 == v67)
          {
            int v87 = 96;
            int v88 = 128;
            unint64_t v89 = &self->_blurRenderVertices[10];
            double v90 = &self->_blurRenderIndices[5];
          }
          else
          {
            int v87 = 48;
            int v88 = 64;
            unint64_t v89 = &self->_blurBorderVertices[10];
            double v90 = &self->_blurBorderIndices[4];
          }
          *(void *)&self->_blurVertexSize = v89;
          LODWORD(self->_blurVertexIndices) = v88;
          *(void *)&self->_blurVertexIndicesSize = v90;
          self->_P3ToBT2020ConversionMethod = v87;
          *(float32x2_t *)&self->_blurPasses = v85;
          self->_anon_429[11] = v68;
          [(affineGPUMetal *)self _renderBlurInputTextures:&v115 inputTexturesCount:v71 outputTextures:&v104];
          v62 ^= 1uLL;
          ++v61;
          unint64_t width_high = HIDWORD(self->_blurOverscan.width);
        }
        while (v61 < width_high);
      }
      *(&(*blurTempTextures)[0].count + v24) = (*(&(*blurTempTextures)[0].count + v24) + 1) % 3;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  for (uint64_t i = 0; i != -48; i -= 24)
  {
  }
  for (uint64_t j = 0; j != -72; j -= 24)
  {
  }
}

- (int)_duplicateBottomRowsOnPixelBuffer:(__CVBuffer *)a3
{
  size_t extraRowsOnBottom = 0;
  if (!self->_pipelineComputeStates[0] || !*((unsigned char *)&self->_P3ToBT2020ConversionMethod + 4)) {
    return 0;
  }
  if (!a3)
  {
    fig_log_get_emitter();
LABEL_21:
    FigDebugAssert3();
    return 0;
  }
  CVPixelBufferGetExtendedPixels(a3, 0, 0, 0, &extraRowsOnBottom);
  int v5 = 0;
  if (CVPixelBufferGetHeight(a3) == 1080 && extraRowsOnBottom == 8)
  {
    if (CVPixelBufferGetPixelFormatType(a3) == 875704438 || CVPixelBufferGetPixelFormatType(a3) == 875704422)
    {
      IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
      if (!IOSurface)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return -12782;
      }
      BOOL v7 = IOSurface;
      int v8 = [(FigMetalContext *)self->_metalContext device];
      id v9 = [v8 newBufferWithIOSurface:v7];

      if (!v9)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return -12786;
      }
      uint64_t v20 = 0x43800000437;
      int OffsetOfPlane = IOSurfaceGetOffsetOfPlane();
      int v21 = OffsetOfPlane - IOSurfaceGetOffsetOfPlane();
      int BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(v7, 0);
      unint64_t v11 = [(FigMetalContext *)self->_metalContext commandQueue];
      id v12 = [v11 commandBuffer];

      if (!v12)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        int v5 = FigSignalErrorAt();

        return v5;
      }
      double v13 = [v12 computeCommandEncoder];
      if (!v13)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        int v5 = FigSignalErrorAt();

        return v5;
      }
      uint64_t v14 = v13;
      [v13 setComputePipelineState:self->_pipelineComputeStates[0]];
      [v14 setBuffer:v9 offset:0 atIndex:0];
      [v14 setBytes:&v20 length:16 atIndex:1];
      uint64_t v18 = ((CVPixelBufferGetWidth(a3) >> 1) + 31) >> 5;
      int64x2_t v19 = vdupq_n_s64(1uLL);
      long long v16 = xmmword_475B0;
      uint64_t v17 = 1;
      [v14 dispatchThreadgroups:&v18 threadsPerThreadgroup:&v16];
      [v14 endEncoding];
      [(affineGPUMetal *)self _addCommandBufferHandler:v12];
      [v12 commit];
      CVBufferSetAttachment(a3, kCVPixelBufferExtendedPixelsFilledKey, kCFBooleanTrue, kCVAttachmentMode_ShouldNotPropagate);

      return 0;
    }
    fig_log_get_emitter();
    goto LABEL_21;
  }
  return v5;
}

- (int)_initTransformShaders
{
  int v2 = [(affineGPUMetal *)self _createRenderPipelinesForShaders:&off_4E730];
  if (v2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v2;
}

- (int)_initComputeShaders
{
  if ((int)FigCapturePlatformIdentifier() > 6
    || ([(FigMetalContext *)self->_metalContext computePipelineStateFor:@"kernelDuplicateBottomRows" constants:0], v3 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(), id v4 = self->_pipelineComputeStates[0], self->_pipelineComputeStates[0] = v3, v4, self->_pipelineComputeStates[0]))
  {
    int v5 = [(FigMetalContext *)self->_metalContext device];
    unsigned int v6 = [v5 supportsFamily:1004];

    if (!v6) {
      return 0;
    }
    BOOL v7 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"CMIFastBilateralSmoothing_Downsample4x" constants:0];
    int v8 = self->_pipelineComputeStates[1];
    self->_pipelineComputeStates[1] = v7;

    if (self->_pipelineComputeStates[1])
    {
      id v9 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"CMIFastBilateralSmoothing_Remix" constants:0];
      objc_super v10 = self->_pipelineComputeStates[2];
      self->_pipelineComputeStates[2] = v9;

      if (self->_pipelineComputeStates[2]) {
        return 0;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_cachedTexturesFromPixelBuffer:(__CVBuffer *)a3 isTwoPass:(BOOL)a4 isOptimized:(BOOL)a5 textures:(id *)a6
{
  CVMetalTextureRef image = 0;
  if (!a3 || !a6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    CFDictionaryRef v15 = 0;
    CVReturn v13 = -12780;
    goto LABEL_175;
  }
  BOOL v7 = a5;
  BOOL v8 = a4;
  cacheOut = &self->_cvMetalTextureCacheRef;
  if (!self->_cvMetalTextureCacheRef)
  {
    CFStringRef v58 = kCVMetalTextureCacheMaximumTextureAgeKey;
    int v59 = &off_49B40;
    CFDictionaryRef v11 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    id v12 = [(FigMetalContext *)self->_metalContext device];
    CVReturn v13 = CVMetalTextureCacheCreate(kCFAllocatorDefault, v11, v12, 0, cacheOut);

    if (v13)
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      CFDictionaryRef v15 = 0;
      goto LABEL_175;
    }
  }
  a6->int var0 = 0;
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  CFDictionaryRef v15 = 0;
  CVReturn v13 = -12782;
  CVPixelBufferRef pixelBuffer = a3;
  if (PixelFormatType <= 1111970368)
  {
    if (PixelFormatType <= 762869295)
    {
      if (PixelFormatType <= 645428785)
      {
        if (PixelFormatType > 645424687)
        {
          if (PixelFormatType != 645424688)
          {
            if (PixelFormatType != 645424690)
            {
              int v16 = 645428784;
              goto LABEL_73;
            }
LABEL_58:
            BOOL v26 = !v8;
            uint64_t v27 = 547;
LABEL_75:
            uint64_t v28 = 588;
LABEL_77:
            if (v26) {
              MTLPixelFormat v18 = v27;
            }
            else {
              MTLPixelFormat v18 = v28;
            }
            unsigned int v17 = 1;
            goto LABEL_81;
          }
          goto LABEL_74;
        }
        if (PixelFormatType != 641230384)
        {
          int v20 = 641234480;
LABEL_64:
          if (PixelFormatType != v20) {
            goto LABEL_175;
          }
        }
LABEL_76:
        BOOL v26 = !v8;
        uint64_t v27 = 540;
        uint64_t v28 = 10;
        goto LABEL_77;
      }
      if (PixelFormatType <= 758674991)
      {
        if (PixelFormatType == 645428786) {
          goto LABEL_58;
        }
        int v20 = 758670896;
        goto LABEL_64;
      }
      if (PixelFormatType == 758674992) {
        goto LABEL_76;
      }
      if (PixelFormatType == 762865200) {
        goto LABEL_74;
      }
      unsigned __int16 v21 = 26162;
      goto LABEL_56;
    }
    if (PixelFormatType <= 796419633)
    {
      if (PixelFormatType <= 792225327)
      {
        if (PixelFormatType == 762869296) {
          goto LABEL_74;
        }
        unsigned __int16 v21 = 30258;
LABEL_56:
        int v22 = v21 | 0x2D780000;
        goto LABEL_57;
      }
      if (PixelFormatType == 792225328 || PixelFormatType == 792229424) {
        goto LABEL_76;
      }
      unsigned __int16 v19 = 26160;
      goto LABEL_70;
    }
    if (PixelFormatType <= 796423729)
    {
      if (PixelFormatType == 796419634) {
        goto LABEL_58;
      }
      unsigned __int16 v19 = 30256;
LABEL_70:
      int v16 = v19 | 0x2F780000;
      goto LABEL_73;
    }
    if (PixelFormatType == 796423730) {
      goto LABEL_58;
    }
    if (PixelFormatType != 875704422 && PixelFormatType != 875704438) {
      goto LABEL_175;
    }
    uint64_t v23 = 540;
    uint64_t v24 = 10;
    if (v7)
    {
      uint64_t v24 = 80;
      int v25 = 4;
    }
    else
    {
      int v25 = 1;
    }
LABEL_140:
    if (v8) {
      MTLPixelFormat v18 = v24;
    }
    else {
      MTLPixelFormat v18 = v23;
    }
    if (v8) {
      unsigned int v17 = v25;
    }
    else {
      unsigned int v17 = 1;
    }
    goto LABEL_81;
  }
  if (PixelFormatType > 2016686639)
  {
    if (PixelFormatType > 2084075055)
    {
      if (PixelFormatType <= 2088265265)
      {
        if (PixelFormatType == 2084075056) {
          goto LABEL_76;
        }
        int v16 = 2088265264;
LABEL_73:
        if (PixelFormatType != v16) {
          goto LABEL_175;
        }
        goto LABEL_74;
      }
      if (PixelFormatType == 2088265266) {
        goto LABEL_58;
      }
      if (PixelFormatType == 2088269360) {
        goto LABEL_74;
      }
      int v22 = 2088269362;
LABEL_57:
      if (PixelFormatType != v22) {
        goto LABEL_175;
      }
      goto LABEL_58;
    }
    if (PixelFormatType <= 2019963439)
    {
      if (PixelFormatType != 2016686640)
      {
        if (PixelFormatType != 2016686642) {
          goto LABEL_175;
        }
LABEL_61:
        uint64_t v23 = 544;
        goto LABEL_137;
      }
    }
    else if (PixelFormatType != 2019963440)
    {
      if (PixelFormatType != 2019963442)
      {
        int v20 = 2084070960;
        goto LABEL_64;
      }
      goto LABEL_61;
    }
    uint64_t v23 = 543;
LABEL_137:
    uint64_t v24 = 20;
    if (v7)
    {
      uint64_t v24 = 60;
      int v25 = 2;
    }
    else
    {
      int v25 = 1;
    }
    goto LABEL_140;
  }
  if (PixelFormatType <= 1815491697)
  {
    if (PixelFormatType <= 1278226533)
    {
      if (PixelFormatType == 1111970369)
      {
        unsigned int v17 = 1;
        MTLPixelFormat v18 = MTLPixelFormatBGRA8Unorm;
      }
      else
      {
        if (PixelFormatType != 1278226488) {
          goto LABEL_175;
        }
        unsigned int v17 = 1;
        MTLPixelFormat v18 = MTLPixelFormatR8Unorm;
      }
    }
    else
    {
      unsigned int v17 = 1;
      if (PixelFormatType == 1278226534)
      {
        MTLPixelFormat v18 = MTLPixelFormatR32Float;
      }
      else
      {
        MTLPixelFormat v18 = MTLPixelFormatR16Float;
        if (PixelFormatType != 1278226536 && PixelFormatType != 1751411059) {
          goto LABEL_175;
        }
      }
    }
    goto LABEL_81;
  }
  if (PixelFormatType > 1882468913)
  {
    if (PixelFormatType == 1882468914) {
      goto LABEL_58;
    }
    if (PixelFormatType == 1885745712)
    {
LABEL_74:
      BOOL v26 = !v8;
      uint64_t v27 = 546;
      goto LABEL_75;
    }
    int v22 = 1885745714;
    goto LABEL_57;
  }
  if (PixelFormatType != 1815491698)
  {
    int v16 = 1882468912;
    goto LABEL_73;
  }
  unsigned int v17 = 1;
  MTLPixelFormat v18 = MTLPixelFormatRGBA16Unorm;
LABEL_81:
  BOOL v29 = v8;
  unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
  CVPixelBufferGetIOSurface(pixelBuffer);
  if (IOSurfaceGetCompressionTypeOfPlane() == 3
    || IOSurfaceGetCompressionTypeOfPlane() == 4)
  {
    BOOL v32 = v7;
    uint64_t v33 = 16391;
  }
  else
  {
    BOOL v32 = v7;
    uint64_t v33 = 7;
  }
  CFStringRef v56 = kCVMetalTextureUsage;
  id v34 = +[NSNumber numberWithUnsignedInteger:v33];
  float v57 = v34;
  CFDictionaryRef v15 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];

  if (CVMetalTextureCacheCreateTextureFromImage(kCFAllocatorDefault, *cacheOut, pixelBuffer, v15, v18, WidthOfPlane / v17, HeightOfPlane, 0, &image))
  {
    goto LABEL_181;
  }
  int v35 = CVMetalTextureGetTexture(image);
  id v36 = a6->var1[0];
  a6->var1[0] = v35;

  if (!a6->var1[0]) {
    goto LABEL_181;
  }
  ++a6->var0;
  if (image) {
    CFRelease(image);
  }
  if (!v29) {
    goto LABEL_174;
  }
  signed int v37 = CVPixelBufferGetPixelFormatType(pixelBuffer);
  unsigned int v38 = 1;
  CVReturn v13 = -12782;
  MTLPixelFormat v39 = MTLPixelFormatRG8Unorm;
  if (v37 <= 1111970368)
  {
    CFDictionaryRef v40 = v15;
    if (v37 <= 762869295)
    {
      if (v37 <= 645428785)
      {
        if (v37 > 645424687)
        {
          if (v37 == 645424688 || v37 == 645424690) {
            goto LABEL_169;
          }
          int v41 = 645428784;
LABEL_168:
          if (v37 == v41) {
            goto LABEL_169;
          }
LABEL_179:
          CFDictionaryRef v15 = v40;
          goto LABEL_175;
        }
        if (v37 == 641230384)
        {
LABEL_170:
          unsigned int v47 = CVPixelBufferGetWidthOfPlane(pixelBuffer, 1uLL);
          unsigned int v48 = CVPixelBufferGetHeightOfPlane(pixelBuffer, 1uLL);
          size_t v49 = v47 / v38;
          CFDictionaryRef v15 = v40;
          if (!CVMetalTextureCacheCreateTextureFromImage(kCFAllocatorDefault, *cacheOut, pixelBuffer, v40, v39, v49, v48, 1uLL, &image))
          {
            int8x8_t v50 = CVMetalTextureGetTexture(image);
            id v51 = a6->var1[1];
            a6->var1[1] = v50;

            if (a6->var1[1])
            {
              ++a6->var0;
              if (image) {
                CFRelease(image);
              }
              goto LABEL_174;
            }
          }
LABEL_181:
          fig_log_get_emitter();
          FigDebugAssert3();
          CVReturn v13 = -12786;
          goto LABEL_175;
        }
        int v43 = 641234480;
LABEL_156:
        if (v37 != v43) {
          goto LABEL_179;
        }
        goto LABEL_170;
      }
      if (v37 <= 758674991)
      {
        if (v37 != 645428786)
        {
          int v43 = 758670896;
          goto LABEL_156;
        }
      }
      else
      {
        if (v37 == 758674992) {
          goto LABEL_170;
        }
        if (v37 != 762865200)
        {
          unsigned __int16 v44 = 26162;
LABEL_150:
          int v41 = v44 | 0x2D780000;
          goto LABEL_168;
        }
      }
      goto LABEL_169;
    }
    if (v37 > 796419633)
    {
      if (v37 > 796423729)
      {
        if (v37 != 796423730)
        {
          if (v37 != 875704422 && v37 != 875704438) {
            goto LABEL_179;
          }
          if (v32) {
            MTLPixelFormat v39 = MTLPixelFormatBGRA8Unorm;
          }
          else {
            MTLPixelFormat v39 = MTLPixelFormatRG8Unorm;
          }
          if (v32) {
            unsigned int v38 = 2;
          }
          else {
            unsigned int v38 = 1;
          }
          goto LABEL_170;
        }
        goto LABEL_169;
      }
      if (v37 == 796419634) {
        goto LABEL_169;
      }
      unsigned __int16 v42 = 30256;
    }
    else
    {
      if (v37 <= 792225327)
      {
        if (v37 != 762869296)
        {
          unsigned __int16 v44 = 30258;
          goto LABEL_150;
        }
LABEL_169:
        MTLPixelFormat v39 = MTLPixelFormatRGBA8Uint|0x204;
        goto LABEL_170;
      }
      if (v37 == 792225328 || v37 == 792229424) {
        goto LABEL_170;
      }
      unsigned __int16 v42 = 26160;
    }
    int v41 = v42 | 0x2F780000;
    goto LABEL_168;
  }
  if (v37 > 2016686639)
  {
    CFDictionaryRef v40 = v15;
    if (v37 > 2084075055)
    {
      if (v37 <= 2088265265)
      {
        if (v37 == 2084075056) {
          goto LABEL_170;
        }
        unsigned __int16 v46 = 26160;
      }
      else
      {
        if (v37 == 2088265266 || v37 == 2088269360) {
          goto LABEL_169;
        }
        unsigned __int16 v46 = 30258;
      }
      int v41 = v46 | 0x7C780000;
      goto LABEL_168;
    }
    if (v37 <= 2019963439)
    {
      if (v37 != 2016686640 && v37 != 2016686642) {
        goto LABEL_179;
      }
    }
    else if (v37 != 2019963440 && v37 != 2019963442)
    {
      int v43 = 2084070960;
      goto LABEL_156;
    }
    MTLPixelFormat v39 = MTLPixelFormatRG16Unorm;
    goto LABEL_170;
  }
  if (v37 > 1815491697)
  {
    if (v37 <= 1882468913)
    {
      if (v37 == 1815491698)
      {
LABEL_174:
        CVReturn v13 = 0;
        goto LABEL_175;
      }
      int v45 = 1882468912;
    }
    else
    {
      if (v37 == 1882468914 || v37 == 1885745712) {
        goto LABEL_161;
      }
      int v45 = 1885745714;
    }
    if (v37 != v45) {
      goto LABEL_175;
    }
LABEL_161:
    CFDictionaryRef v40 = v15;
    goto LABEL_169;
  }
  if ((v37 - 1278226488) <= 0x30 && ((1 << (v37 - 56)) & 0x1400000000001) != 0
    || v37 == 1111970369
    || v37 == 1751411059)
  {
    goto LABEL_174;
  }
LABEL_175:

  return v13;
}

- (int)_getTransformShaderParameters:(unint64_t)a3 isLuma:(BOOL)a4 isRGB:(BOOL)a5 isAttachment:(BOOL)a6 pixelRatio:(unsigned int *)a7 pipelineIndexToUse:(int *)a8
{
  if (!a7 || !a8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  if ((uint64_t)a3 <= 109)
  {
    if ((uint64_t)a3 <= 29)
    {
      switch(a3)
      {
        case 0xAuLL:
          int v9 = 0;
          int v10 = 2;
          break;
        case 0x14uLL:
          int v9 = 0;
          int v10 = 4;
          break;
        case 0x19uLL:
          int v9 = 0;
          int v10 = 44;
          break;
        default:
          goto LABEL_30;
      }
    }
    else
    {
      if ((uint64_t)a3 > 59)
      {
        if (a3 == 60)
        {
          int v9 = 0;
          if (!a4)
          {
            int v10 = 6;
            goto LABEL_74;
          }
          int v14 = 5;
        }
        else
        {
          if (a3 != 80) {
            goto LABEL_30;
          }
          if (a4 && !a5)
          {
            int v9 = 0;
            *a8 = 0;
            unsigned int v11 = 4;
            goto LABEL_76;
          }
          int v9 = 0;
          if (a5)
          {
            int v10 = 9;
            goto LABEL_74;
          }
          int v14 = 1;
        }
        *a8 = v14;
        unsigned int v11 = 2;
        goto LABEL_76;
      }
      if (a3 != 30)
      {
        if (a3 == 55)
        {
          int v9 = 0;
          int v10 = 45;
          goto LABEL_74;
        }
        goto LABEL_30;
      }
      int v9 = 0;
      int v10 = 3;
    }
LABEL_74:
    *a8 = v10;
LABEL_75:
    unsigned int v11 = 1;
LABEL_76:
    *a7 = v11;
    if (a6) {
      return v9;
    }
    goto LABEL_77;
  }
  if ((uint64_t)a3 <= 587)
  {
    switch(a3)
    {
      case 0x21CuLL:
        if (self->_bgCubePtr)
        {
          unsigned int v8 = 10;
          if (*(void *)&self->_srlFixOn)
          {
            if (self->_foregroundColorCube) {
              unsigned int v8 = 12;
            }
            else {
              unsigned int v8 = 10;
            }
          }
        }
        else
        {
          unsigned int v8 = 10;
        }
        if (LODWORD(self->_intermediateOutputPixelBuffer) == 2) {
          unsigned int v8 = 23;
        }
        *a8 = v8;
        if (self->_reverseCoefficients)
        {
          if (self->_intermediateOutputUnstyledPixelBuffer) {
            unsigned int v8 = 15;
          }
          else {
            unsigned int v8 = 13;
          }
        }
        *a8 = v8;
        if (!self->_reverseCoefficients && !LOBYTE(self->_ditherStrengthChroma)
          || self->_fbsDeltaThresholdLuma <= 0.0 && self->_fbsEdgeThresholdLuma <= 0.0)
        {
          int v9 = 0;
          goto LABEL_75;
        }
        uint64_t v15 = v8 - 10;
        if (v15 > 5)
        {
          int v9 = -12780;
          int v10 = -1;
        }
        else
        {
          int v10 = dword_475D0[v15];
          int v9 = dword_475E8[(int)v15];
        }
        break;
      case 0x21DuLL:
      case 0x21EuLL:
      case 0x221uLL:
        goto LABEL_30;
      case 0x21FuLL:
        if (LODWORD(self->_intermediateOutputPixelBuffer) == 2) {
          int v10 = 24;
        }
        else {
          int v10 = 17;
        }
        *a8 = v10;
        if (BYTE4(self[1].super.isa))
        {
          int v10 = 47;
        }
        else if (self->_reverseCoefficients)
        {
          BOOL v12 = self->_intermediateOutputUnstyledPixelBuffer == 0;
          int v13 = 18;
LABEL_70:
          if (v12) {
            int v10 = v13;
          }
          else {
            int v10 = v13 + 1;
          }
        }
LABEL_73:
        int v9 = 0;
        goto LABEL_74;
      case 0x220uLL:
        int v10 = 26;
        *a8 = 26;
        if (!self->_reverseCoefficients) {
          goto LABEL_73;
        }
        BOOL v12 = self->_intermediateOutputUnstyledPixelBuffer == 0;
        int v13 = 27;
        goto LABEL_70;
      case 0x222uLL:
        if (LODWORD(self->_intermediateOutputPixelBuffer) == 2) {
          int v10 = 25;
        }
        else {
          int v10 = 20;
        }
        *a8 = v10;
        if (!self->_reverseCoefficients) {
          goto LABEL_73;
        }
        BOOL v12 = self->_intermediateOutputUnstyledPixelBuffer == 0;
        int v13 = 21;
        goto LABEL_70;
      case 0x223uLL:
        int v10 = 29;
        *a8 = 29;
        if (!self->_reverseCoefficients) {
          goto LABEL_73;
        }
        BOOL v12 = self->_intermediateOutputUnstyledPixelBuffer == 0;
        int v13 = 30;
        goto LABEL_70;
      default:
        if (a3 != 110) {
          goto LABEL_30;
        }
        int v9 = 0;
        int v10 = 46;
        goto LABEL_74;
    }
    goto LABEL_74;
  }
  if (a3 == 588)
  {
    int v9 = 0;
    int v10 = 7;
    goto LABEL_74;
  }
  if (a3 == 589)
  {
    int v9 = 0;
    int v10 = 8;
    goto LABEL_74;
  }
LABEL_30:
  *a8 = -1;
  int v9 = -12780;
  if (a6) {
    return v9;
  }
LABEL_77:
  if ((self->_reverseCoefficients || self->_intermediateOutputUnstyledPixelBuffer) && *(void *)&self->_ditherNoStyle)
  {
    switch(*a8)
    {
      case 13:
        int v16 = 32;
        break;
      case 14:
        int v16 = 33;
        break;
      case 15:
        int v16 = 34;
        break;
      case 16:
        int v16 = 35;
        break;
      case 18:
        int v16 = 36;
        break;
      case 19:
        int v16 = 37;
        break;
      case 21:
        int v16 = 38;
        break;
      case 22:
        int v16 = 39;
        break;
      case 27:
        int v16 = 40;
        break;
      case 28:
        int v16 = 41;
        break;
      case 30:
        int v16 = 42;
        break;
      case 31:
        int v16 = 43;
        break;
      default:
        *a8 = -1;
        return -12780;
    }
    *a8 = v16;
  }
  return v9;
}

- (int)_getBlurShaderParameters:(unint64_t)a3 pipelineIndexToUse:(int *)a4
{
  if (a4)
  {
    if ((uint64_t)a3 <= 539)
    {
      if ((uint64_t)a3 > 29)
      {
        if (a3 == 30)
        {
          int result = 0;
          int v5 = 49;
          goto LABEL_23;
        }
        if (a3 == 60)
        {
          int result = 0;
          int v5 = 52;
          goto LABEL_23;
        }
      }
      else
      {
        if (a3 == 10)
        {
          int result = 0;
          int v5 = 48;
          goto LABEL_23;
        }
        if (a3 == 20)
        {
          int result = 0;
          int v5 = 51;
          goto LABEL_23;
        }
      }
    }
    else if ((uint64_t)a3 <= 545)
    {
      if (a3 == 540)
      {
        int result = 0;
        int v5 = 50;
        goto LABEL_23;
      }
      if (a3 == 543)
      {
        int result = 0;
        int v5 = 53;
        goto LABEL_23;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x222uLL:
          int result = 0;
          int v5 = 56;
          goto LABEL_23;
        case 0x24CuLL:
          int result = 0;
          int v5 = 54;
          goto LABEL_23;
        case 0x24DuLL:
          int result = 0;
          int v5 = 55;
LABEL_23:
          *a4 = v5;
          return result;
      }
    }
    *a4 = -1;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return -12780;
}

- (int)_getBlurDeltaMapBordersShaderParameters:(unint64_t)a3 pipelineIndexToUse:(int *)a4
{
  if (a4)
  {
    switch(a3)
    {
      case 0x222uLL:
        int result = 0;
        int v5 = 59;
        goto LABEL_8;
      case 0x21FuLL:
        int result = 0;
        int v5 = 58;
        goto LABEL_8;
      case 0x21CuLL:
        int result = 0;
        int v5 = 57;
LABEL_8:
        *a4 = v5;
        return result;
    }
    *a4 = -1;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return -12780;
}

- (void)_addCommandBufferHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __43__affineGPUMetal__addCommandBufferHandler___block_invoke;
  v5[3] = &unk_48F48;
  objc_copyWeak(&v6, &location);
  [v4 addCompletedHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)_allocatePyramidWithPixelFormat:(unint64_t)a3 bottomLevelWidth:(unint64_t)a4 bottomLevelHeight:(unint64_t)a5 scaleFactor:(unint64_t)a6 includeBottomLevel:(BOOL)a7 minimumDimension:(unint64_t)a8
{
  id v15 = objc_alloc_init((Class)NSMutableArray);
  int v16 = v15;
  if (v15 && a6)
  {
    BOOL v26 = v15;
    if (!a7)
    {
      a4 = (a6 - 1 + a4) / a6;
      a5 = (a6 - 1 + a5) / a6;
    }
    if (a4 >= a5) {
      unint64_t v17 = a5;
    }
    else {
      unint64_t v17 = a4;
    }
    if (v17 < a8)
    {
LABEL_16:
      int v16 = v26;
      id v24 = v26;
    }
    else
    {
      unint64_t v18 = a6 - 1;
      while (1)
      {
        unsigned __int16 v19 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:a3 width:a4 height:a5 mipmapped:0];
        int v20 = v19;
        if (!v19) {
          break;
        }
        [v19 setUsage:23];
        unsigned __int16 v21 = [(FigMetalContext *)self->_metalContext device];
        id v22 = [v21 newTextureWithDescriptor:v20];

        if (!v22) {
          break;
        }
        [v26 addObject:v22];
        a4 = (v18 + a4) / a6;
        a5 = (v18 + a5) / a6;
        if (a4 >= a5) {
          unint64_t v23 = a5;
        }
        else {
          unint64_t v23 = a4;
        }

        if (v23 < a8) {
          goto LABEL_16;
        }
      }
      fig_log_get_emitter();
      FigDebugAssert3();

      id v24 = 0;
      int v16 = v26;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v24 = 0;
  }

  return v24;
}

- (int)_allocateSemanticStyleColorCubeTextures
{
  int v3 = objc_opt_new();
  id v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  [v3 setTextureType:2];
  [v4 setHeight:1024];
  [v4 setWidth:32];
  [v4 setPixelFormat:70];
  [v4 setUsage:7];
  int v5 = [(FigMetalContext *)self->_metalContext device];
  id v6 = (__CVBuffer *)[v5 newTextureWithDescriptor:v4];
  segmentationMask = self->_segmentationMask;
  self->_segmentationMask = v6;

  if (!self->_segmentationMask) {
    goto LABEL_6;
  }
  unsigned int v8 = [(FigMetalContext *)self->_metalContext device];
  int v9 = (MTLTexture *)[v8 newTextureWithDescriptor:v4];
  bgCubeTexture = self->_bgCubeTexture;
  self->_bgCubeTexture = v9;

  if (self->_bgCubeTexture)
  {
    int v11 = 0;
  }
  else
  {
LABEL_6:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v11 = -12786;
  }

  return v11;
}

- (int)updateCubesIfNeeded
{
  if ((self->_bgCubeTexture && self->_segmentationMask
     || ([(affineGPUMetal *)self _allocateSemanticStyleColorCubeTextures],
         self->_bgCubeTexture))
    && self->_segmentationMask)
  {
    int v3 = [(NSData *)self->_backgroundColorCube bytes];
    if (v3)
    {
      id v4 = v3;
      if (self->_bgCubePtr != v3)
      {
        bgCubeTexture = self->_bgCubeTexture;
        memset(v13, 0, sizeof(v13));
        long long v14 = xmmword_475C0;
        uint64_t v15 = 1;
        [(MTLTexture *)bgCubeTexture replaceRegion:v13 mipmapLevel:0 slice:0 withBytes:v4 bytesPerRow:128 bytesPerImage:0];
        self->_bgCubePtr = v4;
      }
    }
    id v6 = [self->_fgCubePtr bytes];
    if (v6)
    {
      id v7 = v6;
      if (*(id *)&self->_srlFixOn != v6)
      {
        segmentationMask = self->_segmentationMask;
        memset(v10, 0, sizeof(v10));
        long long v11 = xmmword_475C0;
        uint64_t v12 = 1;
        [(__CVBuffer *)segmentationMask replaceRegion:v10 mipmapLevel:0 slice:0 withBytes:v7 bytesPerRow:128 bytesPerImage:0];
        *(void *)&self->_srlFixOn = v7;
      }
    }
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intermediateOutputUnstyledPixelBuffer, 0);
  objc_storeStrong((id *)&self->_reverseCoefficients, 0);
  objc_storeStrong((id *)&self->_fgCubePtr, 0);
  objc_storeStrong((id *)&self->_backgroundColorCube, 0);
  objc_storeStrong((id *)&self->_segmentationMask, 0);
  objc_storeStrong((id *)&self->_bgCubeTexture, 0);
  objc_storeStrong((id *)&self->_fgCubeTexture, 0);
  for (unint64_t i = 0; i != -144; i -= 24)
  {
  }
  for (unint64_t j = 0; j != -96; j -= 24)
  {
  }
  objc_storeStrong((id *)&self->_smoothedChromaPyramid, 0);
  objc_storeStrong((id *)&self->_smoothedLumaPyramid, 0);
  objc_storeStrong((id *)&self->_inputChromaPyramid, 0);
  objc_storeStrong((id *)&self->_inputLumaPyramid, 0);
  objc_storeStrong((id *)&self->_vertexIndicesBuffer, 0);
  objc_storeStrong((id *)&self->_matricesBuffer, 0);
  objc_storeStrong((id *)&self->_verticesBuffer, 0);
  for (uint64_t k = 0; k != -3; --k)
    objc_storeStrong((id *)&self->_pipelineComputeStates[k + 2], 0);
  for (uint64_t m = 488; m != 8; m -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + m), 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end