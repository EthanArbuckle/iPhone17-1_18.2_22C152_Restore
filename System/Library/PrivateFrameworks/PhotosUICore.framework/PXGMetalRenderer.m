@interface PXGMetalRenderer
+ (NSString)mainShaderSource;
+ (float)maxZPosition;
+ (id)_loadAndPreprocessShaderSourceWithFilename:(id)a3 extension:(id)a4;
+ (void)_configureUniformGeometries:(id *)a3 renderRect:(CGRect)a4 drawingScale:(double)a5 renderOrigin:(CGPoint)a6;
- ($1816C37EF4263922E01E14025B0212CC)_handleCompiledRenderPipelineState:(SEL)a3 forColorProgram:(id)a4 shader:(id)a5 shaderFlags:(id)a6 colorPixelFormat:(int)a7 pipelineIndex:(unint64_t)a8 isOpaque:(int64_t)a9;
- ($1816C37EF4263922E01E14025B0212CC)_pipelineForRenderTexture:(SEL)a3 colorPixelFormat:(id *)a4 waitForCompilation:(unint64_t)a5;
- ($EDEBC7EA21717A15148E9A8A98906629)interactionState;
- (BOOL)isInvertColorsEnabled;
- (BOOL)lowMemoryMode;
- (BOOL)wantsBGRATextures;
- (BOOL)wantsMipmaps;
- (BOOL)wantsToDriveRender;
- (CGRect)converRectToRenderCoordinates:(CGRect)a3;
- (CGRect)visibleRect;
- (CGRect)visibleRectInRenderCoordinates;
- (OS_dispatch_queue)layoutQueue;
- (PXGEntityManager)entityManager;
- (PXGMetalRenderDestination)renderDestination;
- (PXGMetalRenderer)initWithRenderDestination:(id)a3 layoutQueue:(id)a4;
- (PXGMetalRendererTestingDelegate)testingDelegate;
- (PXGRendererDelegate)delegate;
- (PXGTextureConverter)textureConverter;
- (PXGTungstenRecordingSession)recordingSession;
- (__n128)cameraConfiguration;
- (__n128)setCameraConfiguration:(uint64_t)a3;
- (double)offscreenEffectScale;
- (id)_createColorTextureForRenderStateValues:(id *)a3;
- (id)_createPipelineStateForColorProgram:(id)a3 shader:(id)a4 shaderFlags:(int)a5 colorPixelFormat:(unint64_t)a6 depthStencilPixelFormat:(unint64_t)a7 isOpaque:(BOOL)a8;
- (id)renderSnapshotForRequest:(id *)a3 offscreenEffect:(id)a4;
- (id)test_renderSnapshotHandler;
- (int64_t)_drawRenderTexture:(id *)a3 forRenderPass:(id)a4 withCommandEncoder:(id)a5;
- (int64_t)_drawSpritesWithRenderPass:(id)a3 renderState:(id)a4 commandEncoder:(id)a5 passingTest:(id)a6;
- (unint64_t)destinationColorSpaceName;
- (unsigned)presentationType;
- (void)_clearPipelines;
- (void)_parseAndSortRenderTextures:(id)a3 willPerformOffscreenPass:(BOOL)a4;
- (void)_pipelinesLock_resizePipelinesStorageIfNeeded;
- (void)_populateEffectSprites:(id)a3 spriteRenderDataStore:(id)a4 presentationDataStore:(id)a5 metadataStore:(id)a6;
- (void)_preloadKernel:(id)a3;
- (void)_preloadShader:(id)a3;
- (void)_renderToCommandBuffer:(id)a3 renderState:(id)a4 renderPassDescriptor:(id)a5 withCompletionCompletion:(id)a6;
- (void)_renderToMainDestination:(id)a3 withCompletionCompletion:(id)a4;
- (void)_setupMetalIfNeeded;
- (void)_setupSquareGeometryBuffer;
- (void)_setupYCbCrMatrices;
- (void)dealloc;
- (void)effectComponent:(id)a3 prepareForEffect:(id)a4;
- (void)metalTextureConverter:(id)a3 didCreateTexture:(id)a4 options:(id)a5;
- (void)releaseResources;
- (void)renderDestination:(id)a3 renderSizeWillChange:(CGSize)a4;
- (void)renderDestinationRequestRender:(id)a3;
- (void)renderImmediately;
- (void)renderSpritesWithTextures:(id)a3 dataStore:(id)a4 presentationDataStore:(id)a5 presentationMetadataStore:(id)a6 layout:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setEntityManager:(id)a3;
- (void)setInteractionState:(id *)a3;
- (void)setIsInvertColorsEnabled:(BOOL)a3;
- (void)setLowMemoryMode:(BOOL)a3;
- (void)setNeedsRender;
- (void)setOffscreenEffectScale:(double)a3;
- (void)setRecordingSession:(id)a3;
- (void)setTest_renderSnapshotHandler:(id)a3;
- (void)setTestingDelegate:(id)a3;
- (void)setVisibleRect:(CGRect)a3;
@end

@implementation PXGMetalRenderer

void __111__PXGMetalRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 entityManager];
  v4 = [v5 effectComponent];
  [v3 setContentsFrom:v4];
}

void __86__PXGMetalRenderer__drawSpritesWithRenderPass_renderState_commandEncoder_passingTest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 62) && (*(unsigned int (**)(void))(*(void *)(a1 + 64) + 16))())
  {
    char v4 = 1;
    *(unsigned char *)(a2 + 62) = 1;
    if ([*(id *)a2 isCaptureTexture] && (id v5 = *(id *)a2) != 0)
    {
      id v20 = v5;
      uint64_t v6 = [*(id *)(a1 + 32) uniforms];
      [*(id *)(a1 + 40) renderRect];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      [v20 drawingScale];
      +[PXGMetalRenderer _configureUniformGeometries:renderRect:drawingScale:renderOrigin:](PXGMetalRenderer, "_configureUniformGeometries:renderRect:drawingScale:renderOrigin:", v6, v8, v10, v12, v14, v15, *(double *)(a1 + 96), *(double *)(a1 + 104));
      objc_msgSend(*(id *)(a1 + 48), "setVertexBytes:length:atIndex:", objc_msgSend(*(id *)(a1 + 32), "uniforms"), 272, 0);
      char v4 = 0;
    }
    else
    {
      id v20 = 0;
    }
    uint64_t v16 = [*(id *)(a1 + 56) _drawRenderTexture:a2 forRenderPass:*(void *)(a1 + 40) withCommandEncoder:*(void *)(a1 + 48)];
    uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v18 = *(void *)(v17 + 24);
    if (v18 <= v16) {
      uint64_t v18 = v16;
    }
    *(void *)(v17 + 24) = v18;
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += v16;
    ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    if ((v4 & 1) == 0)
    {
      uint64_t v19 = [*(id *)(a1 + 32) uniforms];
      [*(id *)(a1 + 40) renderRect];
      +[PXGMetalRenderer _configureUniformGeometries:renderRect:drawingScale:renderOrigin:](PXGMetalRenderer, "_configureUniformGeometries:renderRect:drawingScale:renderOrigin:", v19);
      objc_msgSend(*(id *)(a1 + 48), "setVertexBytes:length:atIndex:", objc_msgSend(*(id *)(a1 + 32), "uniforms"), 272, 0);
    }
  }
}

uint64_t __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_8()
{
  return 1;
}

- (void)metalTextureConverter:(id)a3 didCreateTexture:(id)a4 options:(id)a5
{
  id v8 = a4;
  double v9 = (PXGMetalTextureConverter *)a3;
  os_unfair_lock_lock(&self->_metalLock);
  double v10 = self->_textureConverter;
  os_unfair_lock_unlock(&self->_metalLock);

  if (v10 == v9)
  {
    double v11 = [(PXGMetalRenderer *)self recordingSession];

    if (v11)
    {
      double v12 = [(PXGMetalRenderer *)self recordingSession];
      double v13 = +[PXGMetalRecordingTextureCreatedEvent eventWithTexture:v8 options:a5 recordingComponent:1];
      [v12 recordEvent:v13];
    }
    id v24 = v8;
    id v25 = 0;
    memset(v28, 0, sizeof(v28));
    uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v27 = 0;
    BYTE8(v28[0]) = 0;
    int v14 = [v8 shaderFlags];
    if (a5.var0)
    {
      double v15 = [(PXGMetalRenderer *)self entityManager];
      uint64_t v16 = [v15 effectComponent];

      uint64_t v17 = [v16 effectForId:a5];
      id v25 = (id)[v17 shader];
      v14 |= 0x400000u;
    }
    uint64_t v18 = [(PXGMetalRenderer *)self renderDestination];
    uint64_t v19 = [v18 colorPixelFormat];

    BOOL didPerformFirstRender = self->_didPerformFirstRender;
    if (self->_didPerformFirstRender)
    {
      if ([v8 isOpaque])
      {
        BYTE12(v28[1]) = 0;
        DWORD1(v28[0]) = v14;
        [(PXGMetalRenderer *)self _pipelineForRenderTexture:&v24 colorPixelFormat:v19 waitForCompilation:1];
      }
      BYTE12(v28[1]) = 0;
      DWORD1(v28[0]) = v14 | 0x100000;
      [(PXGMetalRenderer *)self _pipelineForRenderTexture:&v24 colorPixelFormat:v19 waitForCompilation:1];

      if (a5.var0) {
        dispatch_sync((dispatch_queue_t)self->_compilationQueue, &__block_literal_global_292);
      }
    }
    BYTE12(v28[1]) = [v8 isOpaque];
    DWORD1(v28[0]) = v14;
    [(PXGMetalRenderer *)self _pipelineForRenderTexture:&v24 colorPixelFormat:v19 waitForCompilation:didPerformFirstRender];
  }
}

- (int64_t)_drawRenderTexture:(id *)a3 forRenderPass:(id)a4 withCommandEncoder:(id)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3->var0;
  [(PXGMetalRenderer *)self interactionState];
  uint64_t v11 = v63;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v60 = 0u;
  -[PXGMetalRenderer _pipelineForRenderTexture:colorPixelFormat:waitForCompilation:](self, "_pipelineForRenderTexture:colorPixelFormat:waitForCompilation:", a3, [v8 pixelFormat], v63 < 1);
  id v12 = a3->var1;
  double v13 = [(PXGMetalRenderer *)self recordingSession];

  if (v13)
  {
    int v14 = [(PXGMetalRenderer *)self recordingSession];
    long long v55 = v60;
    id v15 = (id)v61;
    id v56 = v15;
    id v57 = *((id *)&v61 + 1);
    id v58 = (id)v62;
    char v59 = BYTE8(v62);
    if (PXGMetalRenderEvent)
    {
      uint64_t v16 = +[PXGMetalRenderEvent eventWithRenderTexture:a3 pipeline:&v55];
    }
    else
    {

      uint64_t v16 = 0;
    }
    [v14 recordEvent:v16];

    uint64_t v17 = [(PXGMetalRenderer *)self recordingSession];
    uint64_t v18 = [v17 frameState];
    uint64_t v19 = [v10 spriteIndexes];
    [v18 addRecordedSpriteIndexes:v19];
  }
  if (!(void)v62)
  {
    if (self->_didPerformFirstRender) {
      goto LABEL_19;
    }
    dispatch_sync((dispatch_queue_t)self->_compilationQueue, &__block_literal_global_289);
    -[PXGMetalRenderer _pipelineForRenderTexture:colorPixelFormat:waitForCompilation:](self, "_pipelineForRenderTexture:colorPixelFormat:waitForCompilation:", a3, [v8 pixelFormat], v11 < 1);
    long long v60 = *(_OWORD *)buf;
    uint64_t v48 = v65.i64[0];
    v65.i64[0] = 0;
    v49 = (void *)v61;
    *(void *)&long long v61 = v48;

    uint64_t v50 = v65.i64[1];
    v65.i64[1] = 0;
    v51 = (void *)*((void *)&v61 + 1);
    *((void *)&v61 + 1) = v50;

    uint64_t v52 = v66;
    uint64_t v66 = 0;
    v53 = (void *)v62;
    *(void *)&long long v62 = v52;

    BYTE8(v62) = v67;
    if (!(void)v62) {
LABEL_19:
    }
      PXGTungstenGetLog();
  }
  objc_msgSend(v9, "setRenderPipelineState:");
  *(_OWORD *)buf = 0u;
  int8x16_t v65 = 0u;
  int v20 = [v10 isOpaque];
  float v21 = 0.0;
  if (v20) {
    float v21 = 1.0;
  }
  *(float *)buf = v21;
  __asm { FMOV            V0.4S, #1.0 }
  int8x16_t v65 = _Q0;
  uint64_t v27 = objc_msgSend(off_1E5DA9658, "sharedInstance", *(_OWORD *)&_Q0, v55, v56);
  int v28 = [v27 debugSharedTextures];

  if (v28)
  {
    __int32 v29 = [v10 spriteCount];
    v30.i32[0] = 1;
    v31.i32[0] = v29;
    int8x16_t v65 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_u32(v31, v30), 0), (int8x16_t)xmmword_1AB359B20, v54);
  }
  [v9 setFragmentBytes:buf length:32 atIndex:1];
  id v32 = (id)v61;
  v33 = [v32 params];
  [v9 setFragmentBuffer:v33 offset:0 atIndex:2];

  v34 = [v32 TRCLUTs];
  [v9 setFragmentTexture:v34 atIndex:1];

  v35 = [v32 colorCube];
  [v9 setFragmentTexture:v35 atIndex:2];

  uint64_t v36 = 112;
  if (a3->var5 < 4u) {
    uint64_t v36 = 104;
  }
  v37 = (MTLSamplerState *)*(id *)((char *)&self->super.isa + v36);
  if (v12)
  {
    uint64_t v38 = [v12 sampler];
    p_clampToZeroSampler = &self->_clampToZeroSampler;
    switch(v38)
    {
      case 0:
      case 2:
        goto LABEL_16;
      case 1:
      case 3:
        p_clampToZeroSampler = &self->_mirrorRepeatSampler;
LABEL_16:
        v40 = *p_clampToZeroSampler;

        v37 = v40;
        break;
      default:
        break;
    }
  }
  [v9 setFragmentSamplerState:v37 atIndex:0];
  NSUInteger location = a3->var2.location;
  NSUInteger length = a3->var2.length;
  [v9 setVertexBufferOffset:4 * location atIndex:2];
  [v9 setVertexBufferOffset:location << 6 atIndex:5];
  v43 = [v10 texture];
  [v9 setFragmentTexture:v43 atTextureIndex:0 samplerState:v37 atSamplerIndex:0];
  v44 = [v10 chromaTexture];
  [v9 setFragmentTexture:v44 atIndex:4];

  [v12 encodeBindableArgumentsWithEncoder:v9];
  [v9 drawPrimitives:3 vertexStart:0 vertexCount:54 instanceCount:length];
  uint64_t v45 = [v43 width];
  uint64_t v46 = [v43 height];

  return v46 * v45;
}

- ($1816C37EF4263922E01E14025B0212CC)_pipelineForRenderTexture:(SEL)a3 colorPixelFormat:(id *)a4 waitForCompilation:(unint64_t)a5
{
  BOOL v6 = a6;
  uint64_t v11 = [off_1E5DA9658 sharedInstance];
  id v12 = a4->var0;
  id var1 = a4->var1;
  id v14 = var1;
  v71 = (void *)a5;
  BOOL v66 = v6;
  id obj = var1;
  if ([v11 enableColorMatching])
  {
    id v15 = [v12 colorProgram];
  }
  else
  {
    id v15 = 0;
  }
  int var4 = a4->var4;
  if (![v11 enableRoundedCorners]) {
    var4 &= ~0x100000u;
  }
  int v17 = BYTE4(a4[1].var1);
  if ([(PXGMetalRenderer *)self isInvertColorsEnabled]) {
    int v18 = 0x200000;
  }
  else {
    int v18 = 0;
  }
  int v19 = v18 | var4;
  int v20 = [v11 debugOpaque];
  int v70 = v17;
  if (v17) {
    int v21 = 0x1000000;
  }
  else {
    int v21 = 0x2000000;
  }
  if (v20) {
    int v22 = v21;
  }
  else {
    int v22 = 0;
  }
  if ([v11 debugExtendedColorRange]) {
    int v23 = 0x800000;
  }
  else {
    int v23 = 0;
  }
  int v24 = v19 | v22 | v23;
  if ([v11 debugResolution]) {
    int v25 = 0x4000000;
  }
  else {
    int v25 = 0;
  }
  if ([v11 debugColorTransform]) {
    int v26 = 0x8000000;
  }
  else {
    int v26 = 0;
  }
  int v27 = v25 | v26;
  if ([v11 debugMipmaps]) {
    int v28 = 0x40000000;
  }
  else {
    int v28 = 0;
  }
  uint64_t v29 = v24 | v27 | v28;
  uint32x4_t v30 = [(PXGMetalRenderer *)self renderDestination];
  int8x16_t v65 = (void *)[v30 depthStencilPixelFormat];

  p_pipelinesLock = &self->_pipelinesLock;
  os_unfair_lock_lock(&self->_pipelinesLock);
  *(_OWORD *)&retstr->id var2 = 0u;
  *(_OWORD *)&retstr->int var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  uint64_t v68 = retstr;
  v69 = v12;
  if (!v12 || [v12 renderPipelineIndex] >= self->_pipelinesCount) {
    goto LABEL_31;
  }
  pipelines = self->_pipelines;
  uint64_t v62 = [v12 renderPipelineIndex];
  id v33 = v15;
  id v34 = v14;
  uint64_t v60 = (uint64_t)&pipelines[v62];
  if (*(id *)(v60 + 16) != v33
    || (id var3 = pipelines[v62].var3, var3 != v34) && ![var3 isEquivalentToShader:v34]
    || *(_DWORD *)v60 != v29
    || (void *)pipelines[v62].var1 != v71)
  {

LABEL_31:
    int v35 = 0;
    goto LABEL_32;
  }
  int var5 = pipelines[v62].var5;

  if (var5 == v70)
  {
    __copy_assignment_8_8_t0w16_s16_s24_s32_t40w1((uint64_t)v68, v60);
    int v35 = 1;
  }
  else
  {
    int v35 = 0;
  }
  p_pipelinesLock = &self->_pipelinesLock;
LABEL_32:
  int64_t pipelinesCount = self->_pipelinesCount;
  if (pipelinesCount >= 1)
  {
    int v61 = v35;
    uint64_t v63 = v11;
    v64 = p_pipelinesLock;
    uint64_t v37 = 0;
    int64_t v38 = 0;
    while (1)
    {
      v39 = self->_pipelines;
      uint64_t v40 = (uint64_t)&v39[v37];
      id v41 = v15;
      id v42 = v14;
      if (v39[v37].var2 == v41
        && ((id v43 = *(id *)(v40 + 24), v43 == v42) || [v43 isEquivalentToShader:v42])
        && *(_DWORD *)v40 == v29
        && (void *)v39[v37].var1 == v71)
      {
        int v44 = v39[v37].var5;

        if (v44 == v70)
        {
          __copy_assignment_8_8_t0w16_s16_s24_s32_t40w1((uint64_t)v68, v40);
          [v69 setRenderPipelineIndex:v38];
          uint64_t v11 = v63;
          p_pipelinesLock = v64;
          goto LABEL_45;
        }
      }
      else
      {
      }
      ++v38;
      int64_t pipelinesCount = self->_pipelinesCount;
      ++v37;
      if (v38 >= pipelinesCount)
      {
        uint64_t v11 = v63;
        p_pipelinesLock = v64;
        int v35 = v61;
        break;
      }
    }
  }
  if (v35)
  {
LABEL_45:
    os_unfair_lock_unlock(p_pipelinesLock);
  }
  else
  {
    self->_int64_t pipelinesCount = pipelinesCount + 1;
    [(PXGMetalRenderer *)self _pipelinesLock_resizePipelinesStorageIfNeeded];
    uint64_t v45 = &self->_pipelines[pipelinesCount];
    objc_storeStrong(&v45->var2, v15);
    objc_storeStrong(&v45->var3, obj);
    v45->var0 = v29;
    v45->id var1 = (unint64_t)v71;
    id v46 = v45->var4;
    v45->int var4 = 0;

    v45->int var5 = v70;
    __copy_assignment_8_8_t0w16_s16_s24_s32_t40w1((uint64_t)v68, (uint64_t)v45);
    [v69 setRenderPipelineIndex:pipelinesCount];
    os_unfair_lock_unlock(p_pipelinesLock);
    if (v66)
    {
      v47 = [(PXGMetalRenderer *)self _createPipelineStateForColorProgram:v15 shader:v14 shaderFlags:v29 colorPixelFormat:v71 depthStencilPixelFormat:v65 isOpaque:v70 != 0];
      LOBYTE(v59) = v70 != 0;
      [(PXGMetalRenderer *)self _handleCompiledRenderPipelineState:v47 forColorProgram:v15 shader:v14 shaderFlags:v29 colorPixelFormat:v71 pipelineIndex:pipelinesCount isOpaque:v59];
      *(_OWORD *)&v68->var0 = *(_OWORD *)location;
      uint64_t v48 = v80;
      v80 = 0;
      id var2 = v68->var2;
      v68->id var2 = v48;

      uint64_t v50 = v81;
      v81 = 0;
      id v51 = v68->var3;
      v68->id var3 = v50;

      uint64_t v52 = v82;
      v82 = 0;
      id v53 = v68->var4;
      v68->int var4 = v52;

      v68->int var5 = v83;
    }
    else
    {
      objc_initWeak(location, self);
      compilationQueue = self->_compilationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __82__PXGMetalRenderer__pipelineForRenderTexture_colorPixelFormat_waitForCompilation___block_invoke;
      block[3] = &unk_1E5DB0F28;
      objc_copyWeak(v76, location);
      id v73 = v15;
      id v55 = v14;
      int v77 = v29;
      v76[1] = v71;
      v76[2] = v65;
      char v78 = v70;
      v76[3] = (id)pipelinesCount;
      id v74 = v55;
      v75 = self;
      dispatch_async(compilationQueue, block);

      objc_destroyWeak(v76);
      objc_destroyWeak(location);
    }
  }

  return result;
}

- (PXGMetalRenderDestination)renderDestination
{
  return self->_renderDestination;
}

- (BOOL)isInvertColorsEnabled
{
  return self->_isInvertColorsEnabled;
}

- (PXGTungstenRecordingSession)recordingSession
{
  return self->_recordingSession;
}

- ($EDEBC7EA21717A15148E9A8A98906629)interactionState
{
  CGSize size = self[5].var8.size;
  *(CGPoint *)&retstr->var0 = self[5].var8.origin;
  *(CGSize *)&retstr->int var4 = size;
  CGSize v4 = *(CGSize *)&self[6].var4;
  retstr->var8.origin = *(CGPoint *)&self[6].var0;
  retstr->var8.CGSize size = v4;
  return self;
}

- (void)_pipelinesLock_resizePipelinesStorageIfNeeded
{
  os_unfair_lock_assert_owner(&self->_pipelinesLock);
  int64_t pipelinesCount = self->_pipelinesCount;
  int64_t pipelinesCapacity = self->_pipelinesCapacity;
  if (pipelinesCount > pipelinesCapacity)
  {
    int64_t v5 = self->_pipelinesCapacity;
    if (!pipelinesCapacity)
    {
      int64_t v5 = 10;
      self->_int64_t pipelinesCapacity = 10;
    }
    if (pipelinesCount > v5)
    {
      do
      {
        BOOL v6 = pipelinesCount <= 2 * v5;
        v5 *= 2;
      }
      while (!v6);
      self->_int64_t pipelinesCapacity = v5;
    }
    _PXGArrayResize();
  }
}

- (void)_populateEffectSprites:(id)a3 spriteRenderDataStore:(id)a4 presentationDataStore:(id)a5 metadataStore:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v34 = a4;
  id v11 = a5;
  id v24 = a6;
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v25 = [(PXGMetalRenderer *)self entityManager];
  id v33 = [v25 effectComponent];
  uint64_t v32 = [v33 effectIds];
  id v12 = v11;
  uint64_t v31 = [v12 entities];
  id v13 = v12;
  uint64_t v30 = [v13 geometries];
  id v14 = v13;
  uint64_t v29 = [v14 styles];
  id v23 = v14;
  uint64_t v28 = [v23 infos];
  id v15 = [(PXGMetalRenderer *)self renderDestination];
  [v15 scale];
  uint64_t v17 = v16;

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v10;
  uint64_t v18 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v18)
  {
    uint64_t v27 = *(void *)v54;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v54 != v27) {
          objc_enumerationMutation(obj);
        }
        int v20 = *(void **)(*((void *)&v53 + 1) + 8 * v19);
        v51[0] = 0;
        v51[1] = v51;
        v51[2] = 0x3032000000;
        v51[3] = __Block_byref_object_copy__19717;
        v51[4] = __Block_byref_object_dispose__19718;
        id v52 = 0;
        v49[0] = 0;
        v49[1] = v49;
        v49[2] = 0x3032000000;
        v49[3] = __Block_byref_object_copy__19717;
        v49[4] = __Block_byref_object_dispose__19718;
        id v50 = 0;
        int v21 = [v20 spriteIndexes];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __101__PXGMetalRenderer__populateEffectSprites_spriteRenderDataStore_presentationDataStore_metadataStore___block_invoke;
        v36[3] = &unk_1E5DB0F50;
        uint64_t v43 = v31;
        uint64_t v44 = v32;
        id v22 = v33;
        id v41 = v49;
        id v42 = v51;
        id v37 = v22;
        int64_t v38 = v20;
        id v39 = v35;
        id v40 = v34;
        uint64_t v45 = v30;
        uint64_t v46 = v29;
        uint64_t v47 = v28;
        uint64_t v48 = v17;
        [v21 enumerateRangesUsingBlock:v36];

        _Block_object_dispose(v49, 8);
        _Block_object_dispose(v51, 8);

        ++v19;
      }
      while (v18 != v19);
      uint64_t v18 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v18);
  }

  [obj addObjectsFromArray:v35];
}

- (PXGEntityManager)entityManager
{
  return self->_entityManager;
}

void __82__PXGMetalRenderer__pipelineForRenderTexture_colorPixelFormat_waitForCompilation___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  CGSize v4 = [WeakRetained _createPipelineStateForColorProgram:*(void *)(a1 + 32) shader:*(void *)(a1 + 40) shaderFlags:*(unsigned int *)(a1 + 88) colorPixelFormat:*(void *)(a1 + 64) depthStencilPixelFormat:*(void *)(a1 + 72) isOpaque:*(unsigned __int8 *)(a1 + 92)];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  id v5 = objc_loadWeakRetained(v2);
  BOOL v6 = v5;
  if (v5)
  {
    LOBYTE(v8) = *(unsigned char *)(a1 + 92);
    [v5 _handleCompiledRenderPipelineState:v4 forColorProgram:*(void *)(a1 + 32) shader:*(void *)(a1 + 40) shaderFlags:*(unsigned int *)(a1 + 88) colorPixelFormat:*(void *)(a1 + 64) pipelineIndex:*(void *)(a1 + 80) isOpaque:v8];
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
  }

  if ((void)v13)
  {
    double v7 = *(NSObject **)(*(void *)(a1 + 48) + 304);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__PXGMetalRenderer__pipelineForRenderTexture_colorPixelFormat_waitForCompilation___block_invoke_2;
    block[3] = &unk_1E5DD20C8;
    objc_copyWeak(&v10, v2);
    void block[4] = *(void *)(a1 + 48);
    dispatch_async(v7, block);
    objc_destroyWeak(&v10);
  }
}

- ($1816C37EF4263922E01E14025B0212CC)_handleCompiledRenderPipelineState:(SEL)a3 forColorProgram:(id)a4 shader:(id)a5 shaderFlags:(id)a6 colorPixelFormat:(int)a7 pipelineIndex:(unint64_t)a8 isOpaque:(int64_t)a9
{
  id v30 = a4;
  id v18 = a5;
  id v19 = a6;
  p_pipelinesLock = &self->_pipelinesLock;
  os_unfair_lock_lock(&self->_pipelinesLock);
  *(_OWORD *)&retstr->id var2 = 0u;
  *(_OWORD *)&retstr->int var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  if (self->_pipelinesCount > a9)
  {
    int v28 = a7;
    unint64_t v27 = a8;
    pipelines = self->_pipelines;
    id v22 = &pipelines[a9];
    id v23 = v18;
    id v24 = v19;
    if (v22->var2 == v23
      && ((id var3 = pipelines[a9].var3, var3 == v24) || [var3 isEquivalentToShader:v24])
      && v22->var0 == v28
      && pipelines[a9].var1 == v27)
    {
      BOOL var5 = pipelines[a9].var5;

      if (var5 == a10)
      {
        objc_storeStrong(&pipelines[a9].var4, a4);
        __copy_assignment_8_8_t0w16_s16_s24_s32_t40w1((uint64_t)retstr, (uint64_t)&pipelines[a9]);
      }
    }
    else
    {
    }
  }
  os_unfair_lock_unlock(p_pipelinesLock);

  return result;
}

void __82__PXGMetalRenderer__pipelineForRenderTexture_colorPixelFormat_waitForCompilation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  [v2 rendererNeedsUpdate:*(void *)(a1 + 32)];
}

void __101__PXGMetalRenderer__populateEffectSprites_spriteRenderDataStore_presentationDataStore_metadataStore___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    do
    {
      if (*(_DWORD *)(*(void *)(a1 + 88) + 4 * *(unsigned int *)(*(void *)(a1 + 80) + 4 * a2)))
      {
        BOOL v6 = objc_msgSend(*(id *)(a1 + 32), "effectForId:");
        uint64_t v7 = [v6 numberOfSiblingSprites];
        if (v7)
        {
          if (*(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != v6)
          {
            uint64_t v8 = [v6 createSiblingsTextureForMainSpriteTexture:*(void *)(a1 + 40)];
            uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
            id v10 = *(void **)(v9 + 40);
            *(void *)(v9 + 40) = v8;

            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v6);
            if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
              objc_msgSend(*(id *)(a1 + 48), "addObject:");
            }
          }
          if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
          {
            unint64_t v11 = [*(id *)(a1 + 56) count] | (unint64_t)(v7 << 32);
            [*(id *)(a1 + 56) insertSpritesInRange:v11];
            uint64_t v12 = [*(id *)(a1 + 56) entities];
            uint64_t v13 = [*(id *)(a1 + 56) geometries];
            uint64_t v14 = [*(id *)(a1 + 56) styles];
            uint64_t v15 = [*(id *)(a1 + 56) infos];
            uint64_t v31 = 0;
            long long v29 = 0u;
            long long v30 = 0u;
            uint64_t v16 = *(void **)(a1 + 56);
            if (v16) {
              [v16 spritesInRange:v11];
            }
            uint64_t v17 = *(void *)(a1 + 96);
            uint64_t v18 = *(void *)(a1 + 104);
            uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8);
            uint64_t v28 = v31;
            uint64_t v20 = *(void *)(a1 + 112);
            uint64_t v21 = *(void *)(v19 + 40);
            uint64_t v22 = v17 + 32 * a2;
            uint64_t v23 = *(void *)(a1 + 40);
            double v24 = *(double *)(a1 + 120);
            v27[0] = v29;
            v27[1] = v30;
            v26[0] = v12 + 4 * a2;
            v26[1] = v13 + 32 * a2;
            v26[2] = v14 + 160 * a2;
            v26[3] = v15 + 40 * a2;
            v25[0] = v26[0];
            v25[1] = v22;
            v25[2] = v18 + 160 * a2;
            v25[3] = v20 + 40 * a2;
            [v6 configureSiblingSprites:v27 siblingsSpriteIndexRange:v11 siblingsTexture:v21 forMainRenderSpriteRef:v26 mainPresentationSpriteRef:v25 mainSpriteIndex:a2 mainSpriteTexture:v24 screenScale:v23];
          }
        }
      }
      ++a2;
      --v3;
    }
    while (v3);
  }
}

void __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 behavior];
  if (!v4) {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  BOOL v5 = v4 == 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_2;
  v13[3] = &unk_1E5DB0FA0;
  long long v21 = *(_OWORD *)(a1 + 96);
  uint64_t v22 = *(void *)(a1 + 112);
  id v14 = *(id *)(a1 + 32);
  long long v27 = *(_OWORD *)(a1 + 184);
  long long v28 = *(_OWORD *)(a1 + 200);
  long long v29 = *(_OWORD *)(a1 + 216);
  long long v30 = *(_OWORD *)(a1 + 232);
  long long v23 = *(_OWORD *)(a1 + 120);
  long long v24 = *(_OWORD *)(a1 + 136);
  long long v25 = *(_OWORD *)(a1 + 152);
  long long v26 = *(_OWORD *)(a1 + 168);
  BOOL v37 = v5;
  long long v18 = *(_OWORD *)(a1 + 64);
  id v6 = *(id *)(a1 + 40);
  long long v31 = *(_OWORD *)(a1 + 248);
  uint64_t v7 = *(void *)(a1 + 264);
  uint64_t v33 = *(void *)(a1 + 272);
  uint64_t v8 = *(void *)(a1 + 80);
  uint64_t v32 = v7;
  uint64_t v19 = v8;
  id v15 = v6;
  id v16 = v3;
  uint64_t v34 = *(void *)(a1 + 280);
  long long v9 = *(_OWORD *)(a1 + 304);
  long long v35 = *(_OWORD *)(a1 + 288);
  long long v36 = v9;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 88);
  id v17 = v10;
  uint64_t v20 = v11;
  id v12 = v3;
  [v12 enumerateSpriteIndexes:v13];
}

void __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v5 = *(void *)(a1 + 96);
  if (*(_DWORD *)(*(void *)(a1 + 112) + 4 * *(unsigned int *)(*(void *)(a1 + 104) + 4 * a2)))
  {
    id v6 = objc_msgSend(*(id *)(a1 + 32), "effectForId:");
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = (_DWORD *)(v5 + 160 * a2);
  [v6 setScale:*(double *)(a1 + 216)];
  uint64_t v8 = [v6 kernel];
  if (v8)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (*(unsigned char *)(a1 + 320)) {
      ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    }
  }
  uint64_t v9 = [*(id *)(a1 + 40) spriteGeometries] + 20 * a2;
  if (*(unsigned char *)(a1 + 320))
  {
    uint64x2_t v11 = *(uint64x2_t *)(a1 + 248);
    uint64_t v12 = *(void *)(a1 + 264);
  }
  else
  {
    float64x2_t v10 = vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)(v9 + 12)), *(double *)(a1 + 272));
    uint64x2_t v11 = vcvtq_u64_f64(v10);
    uint64_t v12 = 1;
  }
  LODWORD(v10.f64[0]) = *v7;
  if (*(float *)v7 != 0.0 && v11.i64[0] != 0 && v11.i64[1] != 0)
  {
    float32x2_t v26 = *(float32x2_t *)(v9 + 12);
    uint64x2_t v27 = v11;
    float v16 = *(float *)v9;
    float v15 = *(float *)(v9 + 4);
    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 48), "isOpaque", v10.f64[0]);
    id v17 = objc_alloc_init(PXGMetalRenderPass);
    [(PXGMetalRenderPass *)v17 setCaptureSpriteTexture:*(void *)(a1 + 48)];
    LODWORD(v18) = *(_DWORD *)([*(id *)(a1 + 40) spriteGeometries] + 20 * a2 + 8);
    [(PXGMetalRenderPass *)v17 setCaptureSpriteZPosition:v18];
    if (v8) {
      uint64_t v19 = v6;
    }
    else {
      uint64_t v19 = 0;
    }
    [(PXGMetalRenderPass *)v17 setOffscreenKernelEffect:v19];
    if (v8) {
      [v6 drawingScale];
    }
    else {
      double v20 = 1.0;
    }
    [(PXGMetalRenderPass *)v17 setDrawingScale:v20];
    uint64x2_t v28 = v27;
    uint64_t v29 = v12;
    [(PXGMetalRenderPass *)v17 setRenderSize:&v28];
    if (*(unsigned char *)(a1 + 320))
    {
      double v21 = *(double *)(a1 + 184);
      double v22 = *(double *)(a1 + 192);
      double v23 = *(double *)(a1 + 200);
      double v24 = *(double *)(a1 + 208);
    }
    else
    {
      float32x2_t v25 = vmul_f32(v26, (float32x2_t)0x3F0000003F000000);
      double v21 = (float)(v16 - v25.f32[0]);
      double v22 = (float)(v15 - v25.f32[1]);
      double v23 = v26.f32[0];
      double v24 = v26.f32[1];
    }
    -[PXGMetalRenderPass setRenderRect:](v17, "setRenderRect:", v21, v22, v23, v24);
    PXGOffscreenMetalPixelFormatForDrawableFormat();
  }
}

- (void)_parseAndSortRenderTextures:(id)a3 willPerformOffscreenPass:(BOOL)a4
{
  BOOL v90 = a4;
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 hasParsedRenderTextures] & 1) == 0)
  {
    [v4 setHasParsedRenderTextures:1];
    id v77 = v4;
    uint64_t v5 = [v4 textures];
    v76 = [v77 opaqueTextures];
    v75 = [v77 translucentTextures];
    [v76 removeAllTextures];
    [v75 removeAllTextures];
    id v92 = [v77 effectComponent];
    uint64_t v100 = [v92 effectIds];
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    id obj = v5;
    uint64_t v6 = 0;
    uint64_t v7 = [obj countByEnumeratingWithState:&v126 objects:v139 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v127;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v127 != v8) {
            objc_enumerationMutation(obj);
          }
          v6 += [*(id *)(*((void *)&v126 + 1) + 8 * i) spriteCount];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v126 objects:v139 count:16];
      }
      while (v7);
    }

    float64x2_t v10 = [v77 renderPassStateForSpriteCount:v6];
    uint64x2_t v11 = v10;
    if (!v10) {
      PXAssertGetLog();
    }
    uint64_t v87 = [v10 spriteIndexes];
    uint64_t v82 = [v11 textureInfos];
    id v12 = v77;
    uint64_t v99 = [v12 spriteEntities];
    id v13 = v12;
    uint64_t v98 = [v13 spriteGeometries];
    id v14 = v13;
    uint64_t v81 = [v14 spriteOriginalGeometries];
    id v15 = v14;
    uint64_t v80 = [v15 spriteInfos];
    id v16 = v15;
    uint64_t v17 = [v16 spriteStyles];
    float v18 = *(float *)([v16 uniforms] + 264);
    *(void *)buf = 0;
    v132 = buf;
    uint64_t v133 = 0x6010000000;
    v134 = PXSharedLibraryAssistantPeopleViewController__ivarWeakLayout;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    uint64_t v122 = 0;
    v123 = &v122;
    uint64_t v124 = 0x2020000000;
    char v125 = 0;
    uint64_t v118 = 0;
    v119 = &v118;
    uint64_t v120 = 0x2020000000;
    char v121 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__PXGMetalRenderer__parseAndSortRenderTextures_willPerformOffscreenPass___block_invoke;
    aBlock[3] = &unk_1E5DB1118;
    v115 = buf;
    v116 = &v118;
    v117 = &v122;
    id v113 = v76;
    id v114 = v75;
    v97 = (void (**)(void))_Block_copy(aBlock);
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v78 = obj;
    uint64_t v85 = [v78 countByEnumeratingWithState:&v108 objects:v130 count:16];
    if (v85)
    {
      uint64_t v89 = 0;
      double v79 = v18;
      uint64_t v84 = *(void *)v109;
      float v19 = *(float *)off_1E5DAAF50;
      float v20 = *((float *)off_1E5DAAF50 + 1);
      float v21 = *((float *)off_1E5DAAF50 + 2);
      float32x2_t v93 = *(float32x2_t *)off_1E5DAAF30;
      float v94 = *((float *)off_1E5DAAF50 + 3);
      float v95 = *((float *)off_1E5DAAF30 + 2);
      float v91 = *((float *)off_1E5DAAF30 + 3);
      uint64_t v107 = v17;
      do
      {
        for (uint64_t j = 0; j != v85; ++j)
        {
          if (*(void *)v109 != v84) {
            objc_enumerationMutation(v78);
          }
          double v22 = *(void **)(*((void *)&v108 + 1) + 8 * j);
          uint64_t v23 = [v22 spriteCount];
          if (v23)
          {
            [v22 getSpriteIndexes:v87 + 4 * v89 maxSpriteCount:v23];
            [v22 getTextureInfos:v82 + (v89 << 6) forSpriteIndexes:v87 + 4 * v89 geometries:v81 spriteStyles:v17 spriteInfos:v80 screenScale:v23 count:v79];
            int v102 = [v22 isOpaque];
            char v101 = [v22 isAtlas];
            [v22 alpha];
            float v25 = v24;
            uint64_t v103 = [v22 shaderFlags];
            if (v103 >= 0x10000)
            {
              v72 = [MEMORY[0x1E4F28B00] currentHandler];
              [v72 handleFailureInMethod:a2, self, @"PXGMetalRenderer.m", 1506, @"Invalid texture shader flags:%u specified for texture:%@", v103, v22 object file lineNumber description];
            }
            float32x2_t v26 = v123;
            *((unsigned char *)v123 + 24) = 0;
            *((unsigned char *)v119 + 24) = 0;
            uint8_t v27 = *((unsigned char *)v26 + 24);
            unsigned __int8 v28 = [v22 isCaptureTexture];
            int v29 = 0;
            int v30 = 0;
            unsigned int v31 = 0;
            BOOL v104 = 0;
            v106 = 0;
            uint64_t v32 = v132;
            *((void *)v132 + 4) = v22;
            *((void *)v32 + 5) = 0;
            *((void *)v32 + 7) = 0;
            *((void *)v32 + 8) = 0;
            *((void *)v32 + 6) = v89;
            v32[72] = 0;
            v32[92] = v27;
            *(int32x2_t *)(v32 + 76) = vdup_n_s32(0x7F7FFFFFu);
            *(void *)(v32 + 84) = 0x80000000800000;
            *(_WORD *)(v32 + 93) = v28;
            uint64_t v23 = v23;
            uint64_t v33 = (unsigned int *)(v87 + 4 * v89);
            int v96 = 1;
            float v34 = 3.4028e38;
            uint64_t v86 = v23;
            while (1)
            {
              uint64_t v35 = *v33;
              v105 = v33 + 1;
              uint64_t v36 = *(unsigned int *)(v99 + 4 * v35);
              int v37 = *(_DWORD *)(v100 + 4 * v36);
              if (v37 != v30) {
                break;
              }
LABEL_26:
              uint64_t v40 = v17 + 160 * v35;
              float v42 = *(float *)(v40 + 36);
              float v43 = *(float *)(v40 + 40);
              uint64_t v41 = v40 + 36;
              BOOL v46 = v42 == v19 && v43 == v20 && *(float *)(v41 + 8) == v21 && *(float *)(v41 + 12) == v94;
              int v47 = 0;
              if (*(float *)(v17 + 160 * v35 + 56) != 0.0)
              {
                uint64_t v48 = v17 + 160 * v35;
                long long v49 = *(_OWORD *)(v48 + 20);
                if (COERCE_FLOAT(*(void *)(v48 + 28)) == v95)
                {
                  int32x2_t v50 = vceq_f32(*(float32x2_t *)&v49, v93);
                  if (vand_s8((int8x8_t)v50, (int8x8_t)vdup_lane_s32(v50, 1)).u32[0]) {
                    int v47 = *((float *)&v49 + 3) == v91;
                  }
                }
                v47 ^= 1u;
              }
              id v51 = (float *)(v17 + 160 * v35);
              unsigned int v52 = *(unsigned __int8 *)(v41 + 34);
              if (!v102 || (*v51 == 1.0 ? (v53 = v46) : (v53 = 0), v53 ? (BOOL v54 = v52 > 3) : (BOOL v54 = 1), v54)) {
                int v55 = 0;
              }
              else {
                int v55 = v96 & (v47 ^ 1);
              }
              long long v56 = v11;
              if (v101) {
                int v57 = 0;
              }
              else {
                int v57 = v25 == 0.0 || *v51 == 0.0;
              }
              uint64_t v58 = v98 + 20 * v35;
              float32x2_t v59 = *(float32x2_t *)v58;
              float32x2_t v60 = *(float32x2_t *)(v58 + 12);
              float v61 = *(float *)(v58 + 8) + *(float *)(v107 + 160 * v35 + 52);
              if (v46) {
                int v62 = 0;
              }
              else {
                int v62 = 0x100000;
              }
              if (v104) {
                int v63 = 0x400000;
              }
              else {
                int v63 = 0;
              }
              if (v47) {
                int v64 = 0x10000000;
              }
              else {
                int v64 = 0;
              }
              int v65 = v63 | v62 | v64 | v103;
              if (v65 == v29
                && (BOOL v66 = v123, *((unsigned __int8 *)v123 + 24) == v55)
                && ((v55 ^ 1 | v90) != 1 || v61 == v34)
                && ((char v67 = v119, v37 == v30) ? (v68 = *((unsigned __int8 *)v119 + 24) == v57) : (v68 = 0),
                    v68 ? (BOOL v69 = v52 == v31) : (BOOL v69 = 0),
                    v69))
              {
                int v70 = v132;
              }
              else
              {
                v97[2]();
                int v70 = v132;
                *((float *)v132 + 16) = v61;
                *((_DWORD *)v70 + 17) = v65;
                v70[72] = v52;
                *((void *)v70 + 5) = v106;
                v70[92] = v55;
                BOOL v66 = v123;
                char v67 = v119;
              }
              float32x2_t v71 = vmul_f32(v60, (float32x2_t)0x3F0000003F000000);
              *(float32x2_t *)(v70 + 76) = vminnm_f32(*(float32x2_t *)(v70 + 76), vsub_f32(v59, v71));
              *(float32x2_t *)(v70 + 84) = vmaxnm_f32(*(float32x2_t *)(v70 + 84), vadd_f32(v59, v71));
              ++*((void *)v70 + 7);
              float v34 = v61;
              *((unsigned char *)v66 + 24) = v55;
              *((unsigned char *)v67 + 24) = v57;
              int v29 = v65;
              int v30 = v37;
              unsigned int v31 = v52;
              --v23;
              uint64x2_t v11 = v56;
              uint64_t v17 = v107;
              uint64_t v33 = v105;
              if (!v23)
              {
                v97[2]();

                v89 += v86;
                goto LABEL_79;
              }
            }
            if (v37)
            {
              int64_t v38 = [v92 effectForId:*(unsigned int *)(v100 + 4 * v36)];
              id v39 = [v38 shader];

              if (v39)
              {
                int v96 = [v39 isOpaque];
LABEL_25:
                BOOL v104 = v39 != 0;
                v106 = v39;
                goto LABEL_26;
              }
            }
            else
            {

              id v39 = 0;
            }
            int v96 = 1;
            goto LABEL_25;
          }
LABEL_79:
          ;
        }
        uint64_t v85 = [v78 countByEnumeratingWithState:&v108 objects:v130 count:16];
      }
      while (v85);
    }

    _Block_object_dispose(&v118, 8);
    _Block_object_dispose(&v122, 8);
    _Block_object_dispose(buf, 8);

    id v4 = v77;
  }
}

double __73__PXGMetalRenderer__parseAndSortRenderTextures_willPerformOffscreenPass___block_invoke(void *a1)
{
  uint64_t v1 = *(void *)(a1[6] + 8);
  if (*(void *)(v1 + 56))
  {
    if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
    {
      id v3 = (_OWORD *)(v1 + 32);
      if (*(unsigned char *)(*(void *)(a1[8] + 8) + 24)) {
        id v4 = (void *)a1[4];
      }
      else {
        id v4 = (void *)a1[5];
      }
      long long v5 = v3[1];
      v9[0] = *v3;
      v9[1] = v5;
      long long v6 = v3[3];
      v9[2] = v3[2];
      v9[3] = v6;
      [v4 addTexture:v9];
    }
    uint64_t v7 = *(void *)(a1[6] + 8);
    *(void *)(v7 + 48) += *(void *)(v7 + 56);
    *(void *)(v7 + 56) = 0;
    *(int32x2_t *)(*(void *)(a1[6] + 8) + 76) = vdup_n_s32(0x7F7FFFFFu);
    double result = 2.84809454e-306;
    *(void *)(*(void *)(a1[6] + 8) + 84) = 0x80000000800000;
  }
  return result;
}

void __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, double a4)
{
  uint64_t v7 = (double *)&v26;
  uint64_t v8 = (double *)&v26 + 1;
  uint64_t v9 = (double *)&v27;
  float64x2_t v10 = (double *)&v27 + 1;
  id v11 = a2;
  id v12 = a3;
  uint64_t v13 = [v11 behavior];
  uint64_t v22 = 0;
  uint64_t v23 = (double *)&v22;
  uint64_t v24 = 0x4010000000;
  float v25 = &unk_1AB5D584F;
  long long v14 = *(_OWORD *)(a1 + 120);
  long long v26 = *(_OWORD *)(a1 + 104);
  long long v27 = v14;
  if (v13)
  {
    id v15 = *(void **)(a1 + 32);
    if (v15)
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      float v18 = __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_4;
      float v19 = &unk_1E5DB0FF0;
      id v20 = v15;
      float v21 = &v22;
      [v11 enumerateSpriteIndexes:&v16];

      uint64_t v7 = v23 + 4;
      uint64_t v8 = v23 + 5;
      uint64_t v9 = v23 + 6;
      float64x2_t v10 = v23 + 7;
    }
  }
  objc_msgSend(v11, "setCaptureRect:", *v7, *v8, *v9, *v10, v16, v17, v18, v19);
  objc_msgSend(v11, "setSpriteGeometries:", objc_msgSend(*(id *)(a1 + 32), "spriteGeometries"));
  [v11 setDrawingScale:a4];
  [v11 setTexture:v12];
  _Block_object_dispose(&v22, 8);
}

- (void)renderSpritesWithTextures:(id)a3 dataStore:(id)a4 presentationDataStore:(id)a5 presentationMetadataStore:(id)a6 layout:(id)a7
{
  uint64_t v179 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(PXGMetalRenderStatePool *)self->_renderStatePool checkoutRenderState];
  if (v17)
  {
    id v146 = v16;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testingDelegate);
    v152 = v17;
    [WeakRetained metalRenderer:self willCheckoutRenderState:v17];

    float v19 = [(PXGMetalRenderer *)self renderDestination];
    [(PXGMetalRenderer *)self visibleRect];
    v20.i32[0] = 0;
    *(float *)&double v21 = v21;
    *(float *)&double v22 = v22;
    unint64_t v23 = __PAIR64__(LODWORD(v22), LODWORD(v21));
    float32x4_t v24 = *(float32x4_t *)&self[1]._nextFrameId;
    int32x4_t v25 = vceqq_f32(v24, (float32x4_t)xmmword_1AB359B30);
    v25.i32[3] = v25.i32[2];
    v25.i32[0] = vminvq_u32((uint32x4_t)v25);
    int8x16_t v143 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v20, v25), 0), (int8x16_t)v23, (int8x16_t)v24);
    long long v26 = [(PXGMetalRenderer *)self recordingSession];

    long long v27 = self;
    if (v26)
    {
      unsigned __int8 v28 = [(PXGMetalRenderer *)self recordingSession];
      [(PXGMetalRenderer *)self visibleRect];
      double v30 = v29;
      double v32 = v31;
      uint64_t v33 = [(PXGMetalRenderer *)self renderDestination];
      [v33 scale];
      uint64_t v35 = +[PXGMetalRecordingFrameStartEvent eventWithViewSize:renderOrigin:screenScale:](PXGMetalRecordingFrameStartEvent, "eventWithViewSize:renderOrigin:screenScale:", v30, v32, *(double *)v143.i64, v34);
      [v28 recordEvent:v35];
    }
    v149 = v15;
    v150 = v14;
    id v147 = v13;
    if ([v19 canSetColorSpace]) {
      objc_msgSend(v19, "setColorspace:", MEMORY[0x1AD10B240](objc_msgSend(v19, "destinationColorSpaceName")));
    }
    v151 = v19;
    v154 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
    id v153 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v169 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    id v148 = v12;
    id v36 = v12;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v169 objects:v174 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v170;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v170 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void **)(*((void *)&v169 + 1) + 8 * i);
          uint64_t v42 = [v41 texture];
          if (!v42) {
            goto LABEL_13;
          }
          float v43 = (void *)v42;
          uint64_t v44 = [v41 texture];
          uint64_t v45 = [v44 device];
          device = v27->_device;

          if (v45 == device)
          {
LABEL_13:
            id v47 = v41;
            if ([v47 isCaptureTexture])
            {
              uint64_t v48 = [v47 copy];
              [v153 addObject:v48];

              id v47 = (id)v48;
            }
            [v154 addObject:v47];
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v169 objects:v174 count:16];
      }
      while (v38);
    }

    long long v49 = v27->_spriteRenderDataStore;
    id v14 = v150;
    if (v150)
    {
      [v150 sprites];
    }
    else
    {
      uint64_t v168 = 0;
      long long v166 = 0u;
      long long v167 = 0u;
    }
    id v15 = v149;
    v164[0] = v166;
    v164[1] = v167;
    uint64_t v165 = v168;
    [(PXGSpriteDataStore *)v49 setSprites:v164];
    [(PXGMetalRenderer *)v27 _populateEffectSprites:v154 spriteRenderDataStore:v49 presentationDataStore:v150 metadataStore:v149];
    [v152 setTextures:v154];
    [v152 setCaptureSpriteTextures:v153];
    v163 = 0;
    *(_OWORD *)__src = 0u;
    *(_OWORD *)v162 = 0u;
    v145 = v49;
    if (v49)
    {
      [(PXGSpriteDataStore *)v49 sprites];
      unsigned int v50 = __src[0];
    }
    else
    {
      unsigned int v50 = 0;
    }
    uint64_t v51 = v50;
    id v52 = v152;
    uint64_t v53 = [v52 spriteGeometriesBufferWithCount:v51];
    id v54 = v52;
    int v55 = (void *)[v54 spriteEntitiesBufferWithCount:v51];
    id v56 = v54;
    int v57 = (void *)[v56 spriteStylesBufferWithCount:v51];
    id v58 = v56;
    float32x2_t v59 = (void *)[v58 spriteInfosBufferWithCount:v51];
    id v60 = v58;
    uint64_t v61 = [v60 spriteOriginalGeometriesBufferWithCount:v51];
    if (!v53 || !v55 || !v57 || !v59 || (int v62 = (void *)v61) == 0) {
      PXAssertGetLog();
    }
    if (v51)
    {
      int v63 = (float64x2_t *)v162[0];
      float64x2_t v64 = vcvtq_f64_f32(*(float32x2_t *)v143.i8);
      uint64_t v65 = v51;
      do
      {
        *(float32x2_t *)uint64_t v53 = vcvt_f32_f64(vsubq_f64(*v63, v64));
        float v66 = v63[1].f64[0] - *(float *)&v143.i32[2];
        *(float *)(v53 + 8) = v66;
        *(float64_t *)(v53 + 12) = v63[1].f64[1];
        v63 += 2;
        v53 += 20;
        --v65;
      }
      while (v65);
    }
    memcpy(v55, __src[1], 4 * v51);
    memcpy(v57, v162[1], 160 * v51);
    memcpy(v59, v163, 40 * v51);
    memcpy(v62, v162[0], 32 * v51);
    unsigned int v67 = [v149 numberOfResizableCapInsets];
    BOOL v68 = (const void *)[v149 resizableCapInsets];
    id v69 = v60;
    int v70 = (void *)[v69 resizableCapInsetsBufferWithCount:v67];
    if (!v70) {
      PXAssertGetLog();
    }
    memcpy(v70, v68, 16 * v67);
    float32x2_t v71 = [v69 effectComponent];
    v160[0] = MEMORY[0x1E4F143A8];
    v160[1] = 3221225472;
    v160[2] = __111__PXGMetalRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke;
    v160[3] = &unk_1E5DB0F78;
    v72 = v27;
    v160[4] = v27;
    [v71 performChanges:v160];

    id v73 = [(PXGMetalRenderer *)v27 test_renderSnapshotHandler];
    id v74 = [(PXGMetalRenderer *)v27 test_renderSnapshotHandler];

    id v13 = v147;
    id v12 = v148;
    if (v74)
    {
      [(PXGMetalRenderer *)v27 setTest_renderSnapshotHandler:0];
      v75 = [v151 renderTexture];
    }
    else
    {
      v75 = 0;
    }
    id v76 = v69;
    uint64_t v77 = [v76 uniforms];
    uint64_t v78 = v77;
    uint32x4_t v79 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&v72[1]._nextFrameId, (float32x4_t)xmmword_1AB359B30);
    v79.i32[3] = v79.i32[2];
    if ((vminvq_u32(v79) & 0x80000000) != 0)
    {
      [(PXGMetalRenderer *)v72 visibleRectInRenderCoordinates];
      double v101 = v100;
      double v103 = v102;
      double v105 = v104;
      double v107 = v106;
      [(PXGMetalRenderer *)v72 renderOrigin];
      +[PXGMetalRenderer _configureUniformGeometries:renderRect:drawingScale:renderOrigin:](PXGMetalRenderer, "_configureUniformGeometries:renderRect:drawingScale:renderOrigin:", v78, v101, v103, v105, v107, 1.0, v108, v109);
    }
    else
    {
      uint64_t v80 = 0;
      long long v81 = *(_OWORD *)&v72[1].super.isa;
      long long v82 = *(_OWORD *)&v72[1]._device;
      long long v83 = *(_OWORD *)&v72[1]._yCbCrMatricesBuffer;
      *(_OWORD *)(v77 + 32) = *(_OWORD *)&v72[1]._commandQueue;
      *(_OWORD *)(v77 + 48) = v83;
      *(_OWORD *)uint64_t v77 = v81;
      *(_OWORD *)(v77 + 16) = v82;
      long long v84 = *(_OWORD *)&v72[1]._lastOffscreenEffectRenderTime;
      long long v85 = *(_OWORD *)&v72[1]._offscreenEffectTexture;
      long long v86 = *(_OWORD *)&v72[1]._clampToZeroSampler;
      *(_OWORD *)(v77 + 96) = *(_OWORD *)&v72[1]._workQueue;
      *(_OWORD *)(v77 + 112) = v86;
      *(_OWORD *)(v77 + 64) = v84;
      *(_OWORD *)(v77 + 80) = v85;
      long long v87 = *(_OWORD *)&v72[1]._pipelinesLock._os_unfair_lock_opaque;
      long long v88 = *(_OWORD *)&v72[1]._pipelinesCount;
      long long v89 = *(_OWORD *)&v72[1]._renderStatePool;
      *(_OWORD *)(v77 + 224) = *(_OWORD *)&v72[1]._compilationQueue;
      *(_OWORD *)(v77 + 240) = v89;
      *(_OWORD *)(v77 + 192) = v87;
      *(_OWORD *)(v77 + 208) = v88;
      *(void *)(v77 + 256) = v72[1]._nextFrameId;
      float32x4_t v90 = *(float32x4_t *)(v77 + 64);
      float32x4_t v91 = *(float32x4_t *)(v77 + 80);
      float32x4_t v92 = *(float32x4_t *)(v77 + 96);
      float32x4_t v93 = *(float32x4_t *)(v77 + 112);
      long long v94 = *(_OWORD *)(v77 + 16);
      long long v95 = *(_OWORD *)(v77 + 32);
      long long v96 = *(_OWORD *)(v77 + 48);
      v173[0] = *(_OWORD *)v77;
      v173[1] = v94;
      v173[2] = v95;
      v173[3] = v96;
      *(_OWORD *)buf = 0u;
      long long v176 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      do
      {
        *(float32x4_t *)&buf[v80 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v90, COERCE_FLOAT(v173[v80])), v91, *(float32x2_t *)&v173[v80], 1), v92, (float32x4_t)v173[v80], 2), v93, (float32x4_t)v173[v80], 3);
        ++v80;
      }
      while (v80 != 4);
      long long v97 = v176;
      long long v98 = v177;
      long long v99 = v178;
      *(_OWORD *)(v77 + 128) = *(_OWORD *)buf;
      *(_OWORD *)(v77 + 144) = v97;
      *(_OWORD *)(v77 + 160) = v98;
      *(_OWORD *)(v77 + 176) = v99;
    }
    [v151 scale];
    double v144 = v110;
    float v111 = v110;
    *(float *)(v78 + 264) = v111;
    [v151 renderSize];
    uint64_t v141 = v113;
    uint64_t v142 = v112;
    [(PXGMetalRenderer *)v72 renderOrigin];
    uint64_t v139 = v115;
    uint64_t v140 = v114;
    [v151 renderBoundsInPoints];
    uint64_t v117 = v116;
    uint64_t v119 = v118;
    uint64_t v121 = v120;
    uint64_t v138 = v122;
    [(PXGMetalRenderer *)v72 visibleRectInRenderCoordinates];
    uint64_t v124 = v123;
    uint64_t v126 = v125;
    uint64_t v128 = v127;
    uint64_t v130 = v129;
    [(PXGMetalRenderer *)v72 offscreenEffectScale];
    v159[0] = v142;
    v159[1] = v141;
    v159[2] = v140;
    v159[3] = v139;
    v159[4] = v117;
    v159[5] = v119;
    v159[6] = v121;
    v159[7] = v138;
    v159[8] = v124;
    v159[9] = v126;
    v159[10] = v128;
    v159[11] = v130;
    v159[12] = v131;
    v159[13] = [v151 colorPixelFormat];
    v159[14] = [v151 sampleCount];
    *(double *)&v159[15] = v144;
    [v76 setValues:v159];
    v155[0] = MEMORY[0x1E4F143A8];
    v155[1] = 3221225472;
    v155[2] = __111__PXGMetalRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_2;
    v155[3] = &unk_1E5DD0E78;
    id v132 = v73;
    id v158 = v132;
    id v133 = v75;
    id v156 = v133;
    v157 = v72;
    [(PXGMetalRenderer *)v72 _renderToMainDestination:v76 withCompletionCompletion:v155];
    objc_storeStrong((id *)&v72->_lastFrameRenderState, v76);
    [(PXGMetalRenderer *)v72 recordingSession];
    long long v135 = v134 = v72;

    if (v135)
    {
      long long v136 = [(PXGMetalRenderer *)v134 recordingSession];
      long long v137 = +[PXGMetalRecordingFrameEndEvent event];
      [v136 recordEvent:v137];
    }
    v134->_BOOL didPerformFirstRender = 1;

    id v16 = v146;
    uint64_t v17 = v152;
  }
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)visibleRectInRenderCoordinates
{
  [(PXGMetalRenderer *)self visibleRect];
  -[PXGMetalRenderer converRectToRenderCoordinates:](self, "converRectToRenderCoordinates:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)test_renderSnapshotHandler
{
  return self->_test_renderSnapshotHandler;
}

- (CGRect)converRectToRenderCoordinates:(CGRect)a3
{
}

+ (void)_configureUniformGeometries:(id *)a3 renderRect:(CGRect)a4 drawingScale:(double)a5 renderOrigin:(CGPoint)a6
{
  [off_1E5DA9658 sharedInstance];
  objc_claimAutoreleasedReturnValue();
  double v6 = [off_1E5DA9658 sharedInstance];
  [v6 cameraZoomFactor];

  PXGCameraForVisibleRect();
}

+ (float)maxZPosition
{
  return 250.0;
}

- (double)offscreenEffectScale
{
  return self->_offscreenEffectScale;
}

- (void)_renderToMainDestination:(id)a3 withCompletionCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_inFlightSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v8 = [(PXGMetalRenderer *)self renderDestination];
  uint64_t v9 = [v8 currentRenderPassDescriptor];

  if (v9)
  {
    float64x2_t v10 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
    [v10 setLabel:@"PXGMetalRenderer Main Destination"];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __70__PXGMetalRenderer__renderToMainDestination_withCompletionCompletion___block_invoke;
    id v15 = &unk_1E5DB4788;
    id v16 = self;
    id v17 = v7;
    [(PXGMetalRenderer *)self _renderToCommandBuffer:v10 renderState:v6 renderPassDescriptor:v9 withCompletionCompletion:&v12];
    objc_msgSend(v10, "commit", v12, v13, v14, v15, v16);
    [v10 waitUntilScheduled];
    if (self->_renderDestinationIsPresentable)
    {
      id v11 = [(PXGMetalRenderer *)self renderDestination];
      [v11 present];
    }
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_inFlightSemaphore);
  }
}

- (void)effectComponent:(id)a3 prepareForEffect:(id)a4
{
  id v5 = a4;
  id v6 = [v5 shader];
  if (v6) {
    [(PXGMetalRenderer *)self _preloadShader:v6];
  }
  id v7 = [v5 kernel];
  uint64_t v8 = v7;
  if (v7)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__PXGMetalRenderer_effectComponent_prepareForEffect___block_invoke;
    v11[3] = &unk_1E5DD32A8;
    v11[4] = self;
    id v12 = v7;
    uint64_t v9 = (void (**)(void))_Block_copy(v11);
    float64x2_t v10 = v9;
    if (self->_didPerformFirstRender) {
      v9[2](v9);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v9);
    }
  }
}

- (void)_preloadShader:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_device)
  {
    v11[0] = 0;
    memset(v13, 0, sizeof(v13));
    char v17 = 0;
    v11[1] = v4;
    long long v12 = 0x7FFFFFFFFFFFFFFFuLL;
    *(_DWORD *)&void v13[4] = 0x400000;
    uint64_t v14 = 0;
    char v15 = [v4 isOpaque];
    __int16 v16 = 0;
    id v6 = [(PXGMetalRenderer *)self renderDestination];
    uint64_t v7 = [v6 colorPixelFormat];

    [(PXGMetalRenderer *)self _pipelineForRenderTexture:v11 colorPixelFormat:v7 waitForCompilation:0];
    if ([v5 isOpaque])
    {
      char v15 = 0;
      [(PXGMetalRenderer *)self _pipelineForRenderTexture:v11 colorPixelFormat:v7 waitForCompilation:0];
    }
  }
}

- (int64_t)_drawSpritesWithRenderPass:(id)a3 renderState:(id)a4 commandEncoder:(id)a5 passingTest:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v12;
  kdebug_trace();
  [v14 pushDebugGroup:@"PXGRender Draw Sprites"];
  id v15 = v11;
  objc_msgSend(v14, "setVertexBytes:length:atIndex:", objc_msgSend(v15, "uniforms"), 272, 0);
  [v14 setVertexBuffer:self->_squareGeometryBuffer offset:0 atIndex:1];
  __int16 v16 = [v15 spriteGeometriesBuffer];
  [v14 setVertexBuffer:v16 offset:0 atIndex:3];

  char v17 = [v15 spriteStylesBuffer];
  [v14 setVertexBuffer:v17 offset:0 atIndex:4];

  float v18 = [v15 resizableCapInsetsBuffer];
  [v14 setVertexBuffer:v18 offset:0 atIndex:6];

  [v14 setDepthStencilState:self->_depthStencil];
  id v19 = v15;
  objc_msgSend(v14, "setFragmentBytes:length:atIndex:", objc_msgSend(v19, "uniforms"), 272, 0);
  yCbCrMatricesBuffer = self->_yCbCrMatricesBuffer;
  if (yCbCrMatricesBuffer) {
    [v14 setFragmentBuffer:yCbCrMatricesBuffer offset:0 atIndex:3];
  }
  double v21 = [v19 currentRenderPassState];
  double v22 = [v21 spriteIndexesMetalBuffer];
  [v14 setVertexBuffer:v22 offset:0 atIndex:2];

  unint64_t v23 = [v21 spriteTextureInfosMetalBuffer];
  [v14 setVertexBuffer:v23 offset:0 atIndex:5];

  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v59[3] = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  v58[3] = 0;
  uint64_t v54 = 0;
  int v55 = &v54;
  uint64_t v56 = 0x2020000000;
  if (v13) {
    float32x4_t v24 = v13;
  }
  else {
    float32x4_t v24 = &__block_literal_global_285_19702;
  }
  uint64_t v57 = 0;
  int32x4_t v25 = _Block_copy(v24);
  if (v19)
  {
    [v19 values];
  }
  else
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
  }
  long long v45 = v47;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PXGMetalRenderer__drawSpritesWithRenderPass_renderState_commandEncoder_passingTest___block_invoke_2;
  aBlock[3] = &unk_1E5DB1140;
  id v26 = v25;
  id v41 = v26;
  id v27 = v19;
  id v37 = v27;
  id v28 = v10;
  id v38 = v28;
  id v29 = v14;
  id v39 = v29;
  uint64_t v40 = self;
  uint64_t v42 = v58;
  float v43 = v59;
  uint64_t v44 = &v54;
  double v30 = _Block_copy(aBlock);
  double v31 = [v27 opaqueTextures];
  [v31 drawWithOrder:1 enumerationBlock:v30];

  double v32 = [v27 translucentTextures];
  [v32 drawWithOrder:0 enumerationBlock:v30];

  [v29 popDebugGroup];
  uint64_t v33 = self;
  kdebug_trace();

  int64_t v34 = v55[3];
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v59, 8);

  return v34;
}

- (void)_renderToCommandBuffer:(id)a3 renderState:(id)a4 renderPassDescriptor:(id)a5 withCompletionCompletion:(id)a6
{
  a3;
  id v10 = a4;
  a5;
  a6;
  ++self->_nextFrameId;
  objc_msgSend(v10, "prepareForRender:");
  objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v10 effectComponent];
  [ objc_claimAutoreleasedReturnValue() effectIds];
  id v11 = v10;
  [v11 spriteStyles];
  id v12 = v11;
  [v12 spriteEntities];
  id v13 = v12;
  [v13 uniforms];
  if (v13) {
    [v13 values];
  }
  PXSizeScale();
}

- (id)_createPipelineStateForColorProgram:(id)a3 shader:(id)a4 shaderFlags:(int)a5 colorPixelFormat:(unint64_t)a6 depthStencilPixelFormat:(unint64_t)a7 isOpaque:(BOOL)a8
{
  BOOL v73 = a8;
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = [v12 source];
  [(id)v13 length];
  kdebug_trace();

  id v14 = [v11 params];
  LODWORD(v13) = 4 * (v14 != 0);

  int v15 = v13 | (8 * (self->_yCbCrMatricesBuffer != 0));
  __int16 v16 = [v11 TRCLUTs];
  if (v16) {
    int v17 = 3;
  }
  else {
    int v17 = 1;
  }

  float v18 = [v11 colorCube];
  int v19 = v17 | (4 * (v18 != 0));

  int v20 = [v11 numInputs];
  unint64_t v21 = [v12 opcodes];
  int v22 = v21;
  int v24 = v23;
  unint64_t v25 = HIDWORD(v21);
  v91[0] = a5;
  v91[1] = v20;
  v75 = v11;
  v91[2] = [v11 opcodes];
  v91[3] = v15;
  v91[4] = v19;
  v91[5] = v22;
  id v26 = self;
  v91[6] = v25;
  v91[7] = v24;
  id v27 = objc_alloc_init(MEMORY[0x1E4F35228]);
  objc_msgSend(v27, "setConstantValues:type:withRange:", v91, 29, 0, 8);
  os_unfair_lock_lock(&self->_metalLock);
  id v28 = self->_device;
  id v29 = self->_library;
  os_unfair_lock_unlock(&self->_metalLock);
  long long v81 = v12;
  double v30 = [v12 source];

  id v76 = v28;
  if (v30)
  {
    if (!self->_didPerformFirstRender && [MEMORY[0x1E4F29060] isMainThread]) {
      PXGTungstenGetLog();
    }
    uint64_t v77 = v29;
    id v69 = v27;
    int v70 = self;
    double v31 = [(id)objc_opt_class() mainShaderSource];
    double v32 = (void *)[v31 mutableCopy];

    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id obj = [off_1E5DA6B08 shaderFunctions];
    uint64_t v33 = [obj countByEnumeratingWithState:&v86 objects:v90 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v87;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v87 != v35) {
            objc_enumerationMutation(obj);
          }
          id v37 = *(void **)(*((void *)&v86 + 1) + 8 * v36);
          id v38 = [v81 source];
          id v39 = [v38 sourceForShaderFunction:v37];

          if (v39)
          {
            uint64_t v40 = NSString;
            id v41 = [v37 name];
            uint64_t v42 = [v40 stringWithFormat:@"/* <PXGShaderInject(%@)> */\n", v41];

            uint64_t v43 = [v32 rangeOfString:v42];
            uint64_t v45 = v44;
            if (v43 == 0x7FFFFFFFFFFFFFFFLL)
            {
              long long v47 = [MEMORY[0x1E4F28B00] currentHandler];
              [v47 handleFailureInMethod:a2, v70, @"PXGMetalRenderer.m", 592, @"Invalid parameter not satisfying: %@", @"range.location != NSNotFound" object file lineNumber description];
            }
            long long v46 = [NSString stringWithFormat:@"{\n%@\n}\n", v39];
            [v32 insertString:v46 atIndex:v43 + v45];
          }
          ++v36;
        }
        while (v34 != v36);
        uint64_t v34 = [obj countByEnumeratingWithState:&v86 objects:v90 count:16];
      }
      while (v34);
    }

    long long v48 = [v81 parameterBindingDeclarations];
    if ([v48 length]) {
      objc_msgSend(v32, "replaceOccurrencesOfString:withString:options:range:", @"/* <PXGShaderFragmentParameters> */", v48, 0, 0, objc_msgSend(v32, "length"));
    }
    long long v49 = [v81 source];
    long long v50 = [v49 otherSource];

    id v26 = v70;
    if ([v50 length]) {
      objc_msgSend(v32, "replaceOccurrencesOfString:withString:options:range:", @"/* <PXGShaderOtherSource> */", v50, 0, 0, objc_msgSend(v32, "length"));
    }
    id v85 = 0;
    id v29 = (MTLLibrary *)[(MTLDevice *)v76 newLibraryWithSource:v32 options:0 error:&v85];
    id v51 = v85;

    if (!v29)
    {
      unsigned int v67 = [MEMORY[0x1E4F28B00] currentHandler];
      [v67 handleFailureInMethod:a2, v70, @"PXGMetalRenderer.m", 609, @"Failed to create library:%@", v51 object file lineNumber description];
    }
    id v27 = v69;
  }
  id v84 = 0;
  long long v52 = (void *)[(MTLLibrary *)v29 newFunctionWithName:@"vertex_main" constantValues:v27 error:&v84];
  id v53 = v84;
  id v54 = v53;
  if (v52)
  {
    if (v53) {
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v65 = [MEMORY[0x1E4F28B00] currentHandler];
    [v65 handleFailureInMethod:a2, v26, @"PXGMetalRenderer.m", 614, @"Failed to create vertex function:%@", v54 object file lineNumber description];

    if (v54) {
LABEL_28:
    }
      PXGTungstenGetLog();
  }
  id v83 = 0;
  uint64_t v78 = v29;
  int v55 = (void *)[(MTLLibrary *)v29 newFunctionWithName:@"fragment_main" constantValues:v27 error:&v83];
  id v56 = v83;
  uint64_t v57 = v56;
  if (v55)
  {
    if (v56) {
      goto LABEL_31;
    }
  }
  else
  {
    float v66 = [MEMORY[0x1E4F28B00] currentHandler];
    [v66 handleFailureInMethod:a2, v26, @"PXGMetalRenderer.m", 621, @"Failed to create fragment function:%@", v57 object file lineNumber description];

    if (v57) {
LABEL_31:
    }
      PXGTungstenGetLog();
  }
  id obja = v54;
  id v58 = objc_opt_new();
  [v58 setVertexFunction:v52];
  [v58 setFragmentFunction:v55];
  [v58 setDepthAttachmentPixelFormat:a7];
  [v58 setStencilAttachmentPixelFormat:a7];
  float32x2_t v59 = [(PXGMetalRenderer *)v26 renderDestination];
  objc_msgSend(v58, "setRasterSampleCount:", objc_msgSend(v59, "sampleCount"));

  id v60 = [v58 colorAttachments];
  uint64_t v61 = [v60 objectAtIndexedSubscript:0];

  [v61 setPixelFormat:a6];
  [v61 setBlendingEnabled:!v73];
  [v61 setRgbBlendOperation:0];
  [v61 setAlphaBlendOperation:0];
  [v61 setSourceRGBBlendFactor:1];
  [v61 setSourceAlphaBlendFactor:1];
  [v61 setDestinationRGBBlendFactor:5];
  [v61 setDestinationAlphaBlendFactor:5];
  id v82 = 0;
  int v62 = (void *)[(MTLDevice *)v76 newRenderPipelineStateWithDescriptor:v58 error:&v82];
  id v63 = v82;
  if (!v62)
  {
    id v74 = [MEMORY[0x1E4F28B00] currentHandler];
    [v74 handleFailureInMethod:a2, v26, @"PXGMetalRenderer.m", 645, @"Failed to create render pipeline state:%@", v63 object file lineNumber description];
  }
  kdebug_trace();

  return v62;
}

- (unsigned)presentationType
{
  return 0;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
}

- (void)setNeedsRender
{
  id v2 = [(PXGMetalRenderer *)self renderDestination];
  [v2 setNeedsRender];
}

- (void)setInteractionState:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var4;
  CGSize size = a3->var8.size;
  self->_interactionState.targetRect.origin = a3->var8.origin;
  self->_interactionState.targetRect.CGSize size = size;
  *(_OWORD *)&self->_interactionState.scrollRegime = v3;
  *(_OWORD *)&self->_interactionState.contentChangeTrend = v4;
}

- (__n128)setCameraConfiguration:(uint64_t)a3
{
  *(_OWORD *)(a1 + 416) = *(_OWORD *)a3;
  long long v3 = *(_OWORD *)(a3 + 16);
  long long v4 = *(_OWORD *)(a3 + 32);
  long long v5 = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(a1 + 464) = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(a1 + 480) = v5;
  *(_OWORD *)(a1 + 432) = v3;
  *(_OWORD *)(a1 + 448) = v4;
  long long v6 = *(_OWORD *)(a3 + 80);
  long long v7 = *(_OWORD *)(a3 + 96);
  long long v8 = *(_OWORD *)(a3 + 128);
  *(_OWORD *)(a1 + 528) = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(a1 + 544) = v8;
  *(_OWORD *)(a1 + 496) = v6;
  *(_OWORD *)(a1 + 512) = v7;
  __n128 result = *(__n128 *)(a3 + 144);
  long long v10 = *(_OWORD *)(a3 + 160);
  long long v11 = *(_OWORD *)(a3 + 192);
  *(_OWORD *)(a1 + 592) = *(_OWORD *)(a3 + 176);
  *(_OWORD *)(a1 + 608) = v11;
  *(__n128 *)(a1 + 560) = result;
  *(_OWORD *)(a1 + 576) = v10;
  return result;
}

- (PXGTextureConverter)textureConverter
{
  return (PXGTextureConverter *)self->_textureConverter;
}

void __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_11(uint64_t a1, void *a2)
{
  id v5 = a2;
  long long v3 = (void *)MEMORY[0x1AD10CB00]();
  kdebug_trace();
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(a1 + 48));
  }
  [*(id *)(a1 + 32) keepAlive];
}

intptr_t __70__PXGMetalRenderer__renderToMainDestination_withCompletionCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 225))
  {
    uint64_t v4 = *(NSObject **)(v3 + 304);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__PXGMetalRenderer__renderToMainDestination_withCompletionCompletion___block_invoke_2;
    v7[3] = &unk_1E5DD08D8;
    v7[4] = v3;
    v7[5] = a2;
    dispatch_async(v4, v7);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 168));
}

void __111__PXGMetalRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 48);
  if (v1)
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v3 = *(NSObject **)(*(void *)(a1 + 40) + 304);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __111__PXGMetalRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_3;
      v4[3] = &unk_1E5DD3280;
      id v6 = v1;
      id v5 = *(id *)(a1 + 32);
      dispatch_async(v3, v4);
    }
  }
}

- (PXGMetalRenderer)initWithRenderDestination:(id)a3 layoutQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PXGMetalRenderer;
  id v9 = [(PXGMetalRenderer *)&v30 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layoutQueue, a4);
    objc_storeStrong((id *)&v10->_renderDestination, a3);
    [(PXGMetalRenderDestination *)v10->_renderDestination setDelegate:v10];
    [(PXGMetalRenderDestination *)v10->_renderDestination setLayoutQueue:v8];
    v10->_renderDestinationIsPresentable = [v7 conformsToProtocol:&unk_1F037AE20];
    v10->_renderDestinationWantsCompleteRenderingNotification = objc_opt_respondsToSelector() & 1;
    v10->_pipelinesLock._os_unfair_lock_opaque = 0;
    v10->_metalLock._os_unfair_lock_opaque = 0;
    long long v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.photos.metalrenderer-compile", v12);
    compilationQueue = v10->_compilationQueue;
    v10->_compilationQueue = (OS_dispatch_queue *)v13;

    int v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    __int16 v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.photos.metalrenderer-work", v16);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v17;

    dispatch_semaphore_t v19 = dispatch_semaphore_create(3);
    inFlightSemaphore = v10->_inFlightSemaphore;
    v10->_inFlightSemaphore = (OS_dispatch_semaphore *)v19;

    v10->_offscreenEffectScale = 1.0;
    [(PXGMetalRenderer *)v10 _setupMetalIfNeeded];
    unint64_t v21 = [PXGMetalRenderStatePool alloc];
    int v22 = [v7 device];
    uint64_t v23 = [(PXGMetalRenderStatePool *)v21 initWithDevice:v22 queue:v8];
    renderStatePool = v10->_renderStatePool;
    v10->_renderStatePool = (PXGMetalRenderStatePool *)v23;

    uint64_t v25 = [off_1E5DA6B40 newSpriteDataStore];
    spriteRenderDataStore = v10->_spriteRenderDataStore;
    v10->_spriteRenderDataStore = (PXGSpriteDataStore *)v25;

    id v27 = objc_alloc_init(PXGMetalOffscreenTexturesStore);
    offscreenTextureCache = v10->_offscreenTextureCache;
    v10->_offscreenTextureCache = v27;
  }
  return v10;
}

- (void)_setupMetalIfNeeded
{
  uint64_t v3 = [(PXGMetalRenderer *)self renderDestination];
  uint64_t v4 = [v3 device];

  id v5 = [off_1E5DA6978 privateContextWithDevice:v4 commandQueue:self->_commandQueue];
  if (!v4) {
    PXGTungstenGetLog();
  }
  os_unfair_lock_lock(&self->_metalLock);
  device = self->_device;
  if (device != v4)
  {
    objc_storeStrong((id *)&self->_device, v4);
    [(PXGMetalRenderStatePool *)self->_renderStatePool setDevice:self->_device];
    [(PXGMetalRenderer *)self _clearPipelines];
    id v7 = self->_device;
    if (v7)
    {
      id v8 = (MTLCommandQueue *)[(MTLDevice *)v7 newCommandQueue];
      commandQueue = self->_commandQueue;
      self->_commandQueue = v8;

      long long v10 = [off_1E5DA6978 privateContextWithDevice:self->_device commandQueue:self->_commandQueue];

      [(MTLCommandQueue *)self->_commandQueue setGPUPriority:4];
      long long v11 = objc_opt_new();
      [v11 setMinFilter:1];
      [v11 setMagFilter:1];
      [v11 setSAddressMode:3];
      [v11 setRAddressMode:3];
      [v11 setTAddressMode:3];
      if ([(PXGMetalRenderer *)self wantsMipmaps]) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = 0;
      }
      [v11 setMipFilter:v12];
      dispatch_queue_t v13 = (MTLSamplerState *)[(MTLDevice *)self->_device newSamplerStateWithDescriptor:v11];
      mirrorRepeatSampler = self->_mirrorRepeatSampler;
      self->_mirrorRepeatSampler = v13;

      [v11 setSAddressMode:4];
      [v11 setRAddressMode:4];
      [v11 setTAddressMode:4];
      int v15 = (MTLSamplerState *)[(MTLDevice *)self->_device newSamplerStateWithDescriptor:v11];
      clampToZeroSampler = self->_clampToZeroSampler;
      self->_clampToZeroSampler = v15;

      id v17 = objc_alloc_init(MEMORY[0x1E4F35218]);
      [v17 setDepthWriteEnabled:1];
      [v17 setDepthCompareFunction:3];
      float v18 = (MTLDepthStencilState *)[(MTLDevice *)self->_device newDepthStencilStateWithDescriptor:v17];
      depthStencil = self->_depthStencil;
      self->_depthStencil = v18;

      int v20 = [v10 library];
      librardouble y = self->_library;
      self->_librardouble y = v20;

      int v22 = (PXGColorGradingTexturesStore *)[objc_alloc((Class)off_1E5DA6700) initWithMetalContext:v10];
      colorGradingTexturesStore = self->_colorGradingTexturesStore;
      self->_colorGradingTexturesStore = v22;

      [(PXGMetalRenderer *)self _setupConstantBuffers];
      id v5 = v10;
    }
  }
  int v24 = [(PXGMetalRenderer *)self renderDestination];
  uint64_t v25 = [v24 destinationColorSpaceName];

  if (device == v4)
  {
    id v26 = [(PXGMetalTextureConverter *)self->_textureConverter metalRenderContext];
    id v27 = [v26 device];
    if (v27 == v4)
    {
      unint64_t v28 = [(PXGMetalTextureConverter *)self->_textureConverter destinationColorSpaceName];

      if (v28 == v25)
      {
        os_unfair_lock_unlock(&self->_metalLock);
        goto LABEL_18;
      }
    }
    else
    {
    }
  }
  if (self->_device)
  {
    id v29 = [PXGMetalTextureConverter alloc];
    uint64_t v30 = [(PXGMetalRenderer *)self presentationType];
    double v31 = [(PXGMetalRenderer *)self layoutQueue];
    double v32 = [(PXGMetalTextureConverter *)v29 initWithContext:v5 presentationType:v30 destinationColorspaceName:v25 layoutQueue:v31];
    textureConverter = self->_textureConverter;
    self->_textureConverter = v32;
  }
  else
  {
    double v31 = self->_textureConverter;
    self->_textureConverter = 0;
  }

  [(PXGMetalTextureConverter *)self->_textureConverter setDelegate:self];
  os_unfair_lock_unlock(&self->_metalLock);
  uint64_t v34 = [(PXGMetalRenderer *)self delegate];
  [v34 rendererDidChangeTextureConverter:self];

LABEL_18:
}

- (BOOL)wantsMipmaps
{
  uint64_t v3 = [off_1E5DA9658 sharedInstance];
  if ([v3 enableMipmaps]) {
    BOOL v4 = ![(PXGMetalRenderer *)self lowMemoryMode];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)renderDestinationRequestRender:(id)a3
{
  id v4 = [(PXGMetalRenderer *)self delegate];
  [v4 rendererPerformRender:self];
}

- (PXGRendererDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGRendererDelegate *)WeakRetained;
}

- (void)renderDestination:(id)a3 renderSizeWillChange:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = [(PXGMetalRenderer *)self delegate];
  objc_msgSend(v7, "renderer:viewportSizeWillChange:", self, width, height);
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (void)_setupSquareGeometryBuffer
{
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)uint64_t v30 = 0;
  *(_OWORD *)&v30[16] = 0u;
  long long v29 = 0u;
  LODWORD(v29) = 1065353216;
  __asm { FMOV            V0.4S, #1.0 }
  *(_OWORD *)&v30[4] = _Q0;
  *(_DWORD *)&v30[28] = 1065353216;
  LODWORD(v2) = 1.0;
  do
  {
    uint64_t v9 = 0;
    int v10 = v5 - 3 * ((1431655766 * (unint64_t)v5) >> 32);
    if (v10 == 2) {
      v11.f32[0] = 1.0;
    }
    else {
      v11.f32[0] = 0.0;
    }
    if (v5 - 6 >= 3) {
      float v12 = 0.0;
    }
    else {
      float v12 = 1.0;
    }
    v11.f32[1] = v12;
    if (v10 == 1) {
      v13.f32[0] = 1.0;
    }
    else {
      v13.f32[0] = 0.0;
    }
    unint64_t v14 = v5 - 3;
    if (v5 - 3 >= 3) {
      float v15 = 0.0;
    }
    else {
      float v15 = 1.0;
    }
    v13.f32[1] = v15;
    __int16 v16 = (BOOL *)&_setupSquareGeometryBuffer_nineSlicedSquare + 16 * v4 + 11;
    do
    {
      float32x2_t v17 = *(float32x2_t *)&v30[8 * v9 - 16];
      BOOL v18 = v5 <= 2 && v17.f32[1] == 1.0 || v17.f32[1] == 0.0 && v14 < 3;
      BOOL v20 = v10 == 1 && v17.f32[0] == 1.0 || v17.f32[0] == 0.0 && v10 == 2;
      if (v14 <= 2 && v17.f32[1] == 1.0)
      {
        BOOL v22 = 1;
        if (v10) {
          goto LABEL_46;
        }
      }
      else
      {
        BOOL v22 = v17.f32[1] == 0.0 && v5 - 6 < 3;
        if (v10) {
          goto LABEL_46;
        }
      }
      if (v17.f32[0] == 1.0)
      {
        BOOL v24 = 1;
        goto LABEL_52;
      }
LABEL_46:
      BOOL v24 = v17.f32[0] == 0.0 && v10 == 1;
LABEL_52:
      *(float32x2_t *)(v16 - 11) = vmla_f32(v11, v13, v17);
      *(v16 - 3) = v18;
      *(v16 - 2) = v20;
      *(v16 - 1) = v22;
      *__int16 v16 = v24;
      v16 += 16;
      ++v9;
    }
    while (v9 != 6);
    v4 += 6;
    ++v5;
  }
  while (v5 != 9);
  id v26 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", &_setupSquareGeometryBuffer_nineSlicedSquare, 864, 0, 0.0, v2, v29, *(_OWORD *)v30, *(_OWORD *)&v30[16]);
  squareGeometryBuffer = self->_squareGeometryBuffer;
  self->_squareGeometryBuffer = v26;

  unint64_t v28 = self->_squareGeometryBuffer;
  [(MTLBuffer *)v28 setLabel:@"NineSlicedSquareGeometryBuffer"];
}

- (void)_clearPipelines
{
  p_pipelinesLock = &self->_pipelinesLock;
  os_unfair_lock_lock(&self->_pipelinesLock);
  if (self->_pipelinesCount >= 1)
  {
    uint64_t v4 = 0;
    int64_t v5 = 0;
    do
    {
      id v6 = &self->_pipelines[v4];
      id var2 = v6->var2;
      v6->id var2 = 0;

      id var3 = v6->var3;
      v6->id var3 = 0;

      id var4 = v6->var4;
      v6->id var4 = 0;

      ++v5;
      ++v4;
    }
    while (v5 < self->_pipelinesCount);
  }
  self->_int64_t pipelinesCount = 0;
  os_unfair_lock_unlock(p_pipelinesLock);
}

- (unint64_t)destinationColorSpaceName
{
  double v2 = [(PXGMetalRenderer *)self renderDestination];
  unint64_t v3 = [v2 destinationColorSpaceName];

  return v3;
}

- (void)setIsInvertColorsEnabled:(BOOL)a3
{
  if (self->_isInvertColorsEnabled != a3)
  {
    self->_isInvertColorsEnabled = a3;
    id v4 = [(PXGMetalRenderer *)self delegate];
    [v4 rendererNeedsUpdate:self];
  }
}

- (BOOL)wantsToDriveRender
{
  return 1;
}

- (BOOL)wantsBGRATextures
{
  return 0;
}

- (void)setEntityManager:(id)a3
{
  id v6 = (PXGEntityManager *)a3;
  if (self->_entityManager != v6)
  {
    objc_storeStrong((id *)&self->_entityManager, a3);
    int64_t v5 = [(PXGEntityManager *)v6 effectComponent];
    [v5 setDelegate:self];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_recordingSession, 0);
  objc_storeStrong((id *)&self->_renderDestination, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_test_renderSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_entityManager, 0);
  objc_storeStrong((id *)&self->_offscreenTextureCache, 0);
  objc_storeStrong((id *)&self->_colorGradingTexturesStore, 0);
  objc_storeStrong((id *)&self->_textureConverter, 0);
  objc_storeStrong((id *)&self->_lastFrameRenderState, 0);
  objc_storeStrong((id *)&self->_spriteRenderDataStore, 0);
  objc_storeStrong((id *)&self->_renderStatePool, 0);
  objc_storeStrong((id *)&self->_inFlightSemaphore, 0);
  objc_storeStrong((id *)&self->_compilationQueue, 0);
  objc_storeStrong((id *)&self->_depthStencil, 0);
  objc_storeStrong((id *)&self->_clampToZeroSampler, 0);
  objc_storeStrong((id *)&self->_mirrorRepeatSampler, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_offscreenEffectTexture, 0);
  objc_storeStrong((id *)&self->_offscreenTexture, 0);
  objc_storeStrong((id *)&self->_yCbCrMatricesBuffer, 0);
  objc_storeStrong((id *)&self->_squareGeometryBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setTestingDelegate:(id)a3
{
}

- (PXGMetalRendererTestingDelegate)testingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testingDelegate);
  return (PXGMetalRendererTestingDelegate *)WeakRetained;
}

- (void)setRecordingSession:(id)a3
{
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (__n128)cameraConfiguration
{
  long long v2 = *(_OWORD *)(a1 + 592);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 576);
  *(_OWORD *)(a2 + 176) = v2;
  *(_OWORD *)(a2 + 192) = *(_OWORD *)(a1 + 608);
  long long v3 = *(_OWORD *)(a1 + 528);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 512);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 560);
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 544);
  *(_OWORD *)(a2 + 144) = v4;
  long long v5 = *(_OWORD *)(a1 + 464);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 448);
  *(_OWORD *)(a2 + 48) = v5;
  long long v6 = *(_OWORD *)(a1 + 496);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 480);
  *(_OWORD *)(a2 + 80) = v6;
  __n128 result = *(__n128 *)(a1 + 432);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 416);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

- (void)_preloadKernel:(id)a3
{
  device = self->_device;
  if (device) {
    [a3 preloadWithDevice:device];
  }
}

void __53__PXGMetalRenderer_effectComponent_prepareForEffect___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  long long v2 = *(NSObject **)(v1 + 160);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__PXGMetalRenderer_effectComponent_prepareForEffect___block_invoke_2;
  v3[3] = &unk_1E5DD32A8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t __53__PXGMetalRenderer_effectComponent_prepareForEffect___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _preloadKernel:*(void *)(a1 + 40)];
}

uint64_t __86__PXGMetalRenderer__drawSpritesWithRenderPass_renderState_commandEncoder_passingTest___block_invoke()
{
  return 1;
}

- (void)setTest_renderSnapshotHandler:(id)a3
{
  id v4 = a3;
  if (self->_test_renderSnapshotHandler != v4)
  {
    id v8 = v4;
    if (self->_renderDestinationIsPresentable)
    {
      long long v5 = [(PXGMetalRenderer *)self renderDestination];
      objc_msgSend(v5, "test_configureForRenderSnapshot");
    }
    long long v6 = (void *)[v8 copy];
    id test_renderSnapshotHandler = self->_test_renderSnapshotHandler;
    self->_id test_renderSnapshotHandler = v6;

    id v4 = v8;
  }
}

BOOL __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  float v2 = *(float *)(a2 + 32);
  return v2 > *(float *)(a1 + 32) && v2 <= *(float *)(a1 + 36);
}

BOOL __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return *(float *)(a2 + 32) > *(float *)(a1 + 32);
}

BOOL __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return *(float *)(a2 + 32) <= *(float *)(a1 + 32);
}

uint64_t __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_9(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result) {
    return *(unsigned char *)(a2 + 61) == 0;
  }
  return result;
}

uint64_t __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_10(void *a1, uint64_t a2)
{
  if (!(*(unsigned int (**)(void))(a1[4] + 16))()
    || (v4 = (float32x2_t)a1[5], float32x2_t v5 = *(float32x2_t *)(a2 + 44), (vmvn_s8((int8x8_t)vcge_f32(v5, v4)).u32[0] & 1) != 0)
    || (float32x2_t v6 = *(float32x2_t *)(a2 + 52),
        float32x2_t v7 = (float32x2_t)a1[6],
        int8x8_t v8 = vmvn_s8((int8x8_t)vcge_f32((float32x2_t)vext_s8((int8x8_t)v5, (int8x8_t)v7, 4uLL), (float32x2_t)vext_s8((int8x8_t)v4, (int8x8_t)v6, 4uLL))), ((v8.i32[1] | v8.i32[0]) & 1) != 0))
  {
    __int8 v9 = 0;
  }
  else
  {
    __int8 v9 = vcge_f32(v7, v6).i8[4];
  }
  return v9 & 1;
}

float64x2_t __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_4(uint64_t a1, unsigned int a2, unsigned char *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) spriteGeometries] + 20 * a2;
  float32x2_t v6 = *(float32x2_t *)(v5 + 12);
  float32x2_t v7 = *(float64x2_t **)(*(void *)(a1 + 40) + 8);
  float64x2_t v8 = vcvtq_f64_f32(vadd_f32(*(float32x2_t *)v5, vmul_f32(v6, (float32x2_t)0xBF000000BF000000)));
  float64x2_t result = vcvtq_f64_f32(v6);
  v7[2] = v8;
  v7[3] = result;
  *a3 = 1;
  return result;
}

void __70__PXGMetalRenderer__renderToMainDestination_withCompletionCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) renderDestination];
  [v2 notifyDidCompleteRenderForFrameID:*(void *)(a1 + 40)];
}

- (id)renderSnapshotForRequest:(id *)a3 offscreenEffect:(id)a4
{
  id v5 = a4;
  float32x2_t v6 = self->_lastFrameRenderState;
  if (!v6)
  {
    dispatch_semaphore_t v19 = 0;
    goto LABEL_13;
  }
  kdebug_trace();
  float32x2_t v7 = [(PXGMetalRenderer *)self renderDestination];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  [(PXGMetalRenderState *)v6 values];
  long long v32 = v40;
  long long v33 = v41;
  long long v34 = v42;
  long long v35 = v43;
  long long v28 = v36;
  long long v29 = v37;
  long long v30 = v38;
  long long v31 = v39;
  uint64_t v8 = [(PXGMetalRenderer *)self _createColorTextureForRenderStateValues:&v28];
  if (v8)
  {
    __int8 v9 = (void *)v8;
    id v10 = objc_alloc_init(MEMORY[0x1E4F352E0]);
    float32x2_t v11 = [v10 colorAttachments];
    float v12 = [v11 objectAtIndexedSubscript:0];

    [v7 clearColor];
    objc_msgSend(v12, "setClearColor:");
    [v12 setLoadAction:2];
    [v12 setStoreAction:1];
    uint64_t v23 = v12;
    [v12 setTexture:v9];
    BOOL v24 = v7;
    uint64_t v13 = [v7 depthStencilTexture];
    unint64_t v14 = [v10 depthAttachment];
    [v14 setTexture:v13];
    [v14 setLoadAction:2];
    [v14 setStoreAction:0];
    [v14 setClearDepth:1.0];
    float v15 = [v10 stencilAttachment];
    uint64_t v25 = (void *)v13;
    [v15 setTexture:v13];
    [v15 setLoadAction:2];
    [v15 setStoreAction:0];
    [v15 setClearStencil:0];
    __int16 v16 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
    [v16 setLabel:@"PXGMetalRenderer Snapshot"];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __61__PXGMetalRenderer_renderSnapshotForRequest_offscreenEffect___block_invoke;
    v26[3] = &unk_1E5DCF720;
    id v27 = v6;
    [(PXGMetalRenderer *)self _renderToCommandBuffer:v16 renderState:v27 renderPassDescriptor:v10 withCompletionCompletion:v26];
    float32x2_t v17 = v5;
    BOOL v18 = [v5 kernel];

    if (v18)
    {
      long long v32 = v40;
      long long v33 = v41;
      long long v34 = v42;
      long long v35 = v43;
      long long v28 = v36;
      long long v29 = v37;
      long long v30 = v38;
      long long v31 = v39;
      dispatch_semaphore_t v19 = [(PXGMetalRenderer *)self _createColorTextureForRenderStateValues:&v28];
      if (!v19)
      {
        id v5 = v17;
        float32x2_t v7 = v24;
        unint64_t v21 = v23;
        goto LABEL_11;
      }
      BOOL v20 = [v17 kernel];
      [v20 encodeToCommandBuffer:v16 sourceTexture:v9 destinationTexture:v19 targetScale:*((double *)&v43 + 1)];

      id v5 = v17;
      __int8 v9 = v19;
    }
    else
    {
      id v5 = v17;
    }
    float32x2_t v7 = v24;
    unint64_t v21 = v23;
    [v16 commit];
    [v16 waitUntilScheduled];
    dispatch_semaphore_t v19 = (void *)[objc_alloc((Class)off_1E5DA6998) initWithTexture:v9];
LABEL_11:

    goto LABEL_12;
  }
  dispatch_semaphore_t v19 = 0;
LABEL_12:

LABEL_13:
  return v19;
}

uint64_t __61__PXGMetalRenderer_renderSnapshotForRequest_offscreenEffect___block_invoke()
{
  return kdebug_trace();
}

- (id)_createColorTextureForRenderStateValues:(id *)a3
{
  id v5 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:a3->var5 width:(unint64_t)a3->var0.width height:(unint64_t)a3->var0.height mipmapped:0];
  [v5 setSampleCount:a3->var6];
  if (a3->var6 >= 2) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 2;
  }
  [v5 setTextureType:v6];
  [v5 setStorageMode:2];
  [v5 setUsage:7];
  float32x2_t v7 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v5];
  [v7 setLabel:@"PXGMetalRenderer Snapshot"];
  if (!v7) {
    PXGTungstenGetLog();
  }
  id v8 = v7;

  return v7;
}

uint64_t __111__PXGMetalRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setOffscreenEffectScale:(double)a3
{
}

- (void)setLowMemoryMode:(BOOL)a3
{
  if (self->_lowMemoryMode != a3)
  {
    self->_lowMemoryMode = a3;
    -[PXGMetalRenderDestination setLowMemoryMode:](self->_renderDestination, "setLowMemoryMode:");
  }
}

- (void)releaseResources
{
  lastFrameRenderState = self->_lastFrameRenderState;
  self->_lastFrameRenderState = 0;

  float32x2_t v4 = [(PXGMetalRenderer *)self renderDestination];
  [v4 releaseCachedResources];

  [(PXGMetalOffscreenTexturesStore *)self->_offscreenTextureCache removeAllTextures];
  [(PXGMetalRenderStatePool *)self->_renderStatePool clearReusePool];
  id v5 = [(PXGMetalRenderer *)self delegate];
  [v5 rendererNeedsUpdate:self];
}

- (void)renderImmediately
{
  id v2 = [(PXGMetalRenderer *)self renderDestination];
  [v2 renderImmediately];
}

- (void)_setupYCbCrMatrices
{
}

- (void)dealloc
{
  [(PXGMetalRenderer *)self _clearPipelines];
  free(self->_pipelines);
  v3.receiver = self;
  v3.super_class = (Class)PXGMetalRenderer;
  [(PXGMetalRenderer *)&v3 dealloc];
}

+ (NSString)mainShaderSource
{
  float32x2_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"PXGMetalRenderer.m", 213, @"Dynamic shader source is not currently supported, see rdar://78532560" object file lineNumber description];

  abort();
}

+ (id)_loadAndPreprocessShaderSourceWithFilename:(id)a3 extension:(id)a4
{
  float32x2_t v7 = (void *)MEMORY[0x1E4F28B50];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 bundleForClass:objc_opt_class()];
  float32x2_t v11 = [v10 URLForResource:v9 withExtension:v8];

  id v34 = 0;
  float v12 = [NSString stringWithContentsOfURL:v11 encoding:4 error:&v34];
  id v13 = v34;
  unint64_t v14 = (void *)[v12 mutableCopy];

  if (!v14)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"PXGMetalRenderer.m", 197, @"Error:%@ loading file at path:%@", v13, v11 object file lineNumber description];
  }
  id v33 = v13;
  float v15 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^#include \"(.*)\"$" options:16 error:&v33];
  id v16 = v33;

  uint64_t v17 = [v14 length];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __73__PXGMetalRenderer__loadAndPreprocessShaderSourceWithFilename_extension___block_invoke;
  v26[3] = &unk_1E5DB0F00;
  SEL v31 = a2;
  id v32 = a1;
  id v27 = v15;
  id v28 = v16;
  id v29 = v11;
  id v18 = v14;
  id v30 = v18;
  id v19 = v11;
  id v20 = v16;
  id v21 = v15;
  objc_msgSend(v18, "enumerateSubstringsInRange:options:usingBlock:", 0, v17, 256, v26);
  BOOL v22 = v30;
  id v23 = v18;

  return v23;
}

void __73__PXGMetalRenderer__loadAndPreprocessShaderSourceWithFilename_extension___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v7 length];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __73__PXGMetalRenderer__loadAndPreprocessShaderSourceWithFilename_extension___block_invoke_2;
  v11[3] = &unk_1E5DB0ED8;
  id v12 = v7;
  long long v16 = *(_OWORD *)(a1 + 64);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  id v10 = v7;
  objc_msgSend(v8, "enumerateMatchesInString:options:range:usingBlock:", v10, 0, 0, v9, v11);
}

void __73__PXGMetalRenderer__loadAndPreprocessShaderSourceWithFilename_extension___block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 rangeAtIndex:1];
  objc_msgSend(v3, "substringWithRange:", v4, v5);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v10 stringByDeletingPathExtension];
  id v7 = [v10 pathExtension];
  id v8 = +[PXGMetalRenderer _loadAndPreprocessShaderSourceWithFilename:v6 extension:v7];

  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 72), @"PXGMetalRenderer.m", 205, @"Error:%@ including file at path:%@", *(void *)(a1 + 40), *(void *)(a1 + 48) object file lineNumber description];
  }
  objc_msgSend(*(id *)(a1 + 56), "replaceCharactersInRange:withString:", *(void *)(a1 + 80), *(void *)(a1 + 88), v8);
}

@end