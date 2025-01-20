@interface PTSyntheticLight
+ (void)disableAsynchronousWork;
- (PTSyntheticLight)initWithMetalContext:(id)a3 faceAttributesNetwork:(id)a4 effectUtil:(id)a5 msrColorPyramid:(id)a6 colorSize:(id *)a7 prewarmOnly:(BOOL)a8 sharedResources:(id)a9;
- (id)debugDescription;
- (id)debugTextures;
- (id)faceObservations;
- (id)lightEstimation;
- (id)srlV2CoeffsBuffer;
- (void)dealloc;
- (void)estimateLightIntensity:(id)a3 relightStrength:(float)a4;
- (void)estimateLightIntensityWithFaceRects:(PTSyntheticLight *)self inTex:(SEL)a2 numberOfFaceRects:transform:humanDetections:asyncWork:;
- (void)interpolateLightIntensity:(float)a3;
- (void)reset;
- (void)updateSubjectRelighting:(uint64_t)a3 inLuma:(void *)a4 inChroma:(void *)a5 inFaceRects:(uint64_t)a6 runOnAsyncCommandQueue:(int)a7 transform:(long long *)a8 dependentCommandBuffer:(void *)a9;
@end

@implementation PTSyntheticLight

- (PTSyntheticLight)initWithMetalContext:(id)a3 faceAttributesNetwork:(id)a4 effectUtil:(id)a5 msrColorPyramid:(id)a6 colorSize:(id *)a7 prewarmOnly:(BOOL)a8 sharedResources:(id)a9
{
  BOOL v9 = a8;
  v126[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v122 = a4;
  id v123 = a5;
  id v16 = a6;
  id v17 = a9;
  v124.receiver = self;
  v124.super_class = (Class)PTSyntheticLight;
  v18 = [(PTSyntheticLight *)&v124 init];
  v19 = v18;
  if (!v18)
  {
    v31 = 0;
    v32 = v122;
    v28 = v123;
LABEL_10:
    v27 = v16;
LABEL_11:
    v30 = v17;
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v18->_mainMetalContext, a3);
  uint64_t v20 = [v15 copy];
  asyncMetalContext = v19->_asyncMetalContext;
  v19->_asyncMetalContext = (PTMetalContext *)v20;

  v22 = [(PTMetalContext *)v19->_asyncMetalContext device];
  v23 = (void *)[v22 newCommandQueue];
  [(PTMetalContext *)v19->_asyncMetalContext setCommandQueue:v23];

  v24 = [(PTMetalContext *)v19->_asyncMetalContext commandQueue];

  if (!v24)
  {
    v33 = _PTLogSystem();
    v28 = v123;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:](v33, v34, v35, v36, v37, v38, v39, v40);
    }

    v31 = 0;
    v32 = v122;
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v19->_effectUtil, a5);
  objc_storeStrong((id *)&v19->_msrColorPyramid, a6);
  v19->_config.firstFrame = 1;
  *(void *)&v19->_config.framesSinceLightEstimate = 0x1E00000000;
  v19->_config.emaCoefficient = 0.3;
  v19->_subjectRelightingRunning = 0;
  uint64_t v25 = [v15 computePipelineStateFor:@"lightEstimation" withConstants:0];
  lightEstimation = v19->_lightEstimation;
  v19->_lightEstimation = (MTLComputePipelineState *)v25;

  if (!v19->_lightEstimation)
  {
    v42 = _PTLogSystem();
    v27 = v16;
    v28 = v123;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:](v42, v43, v44, v45, v46, v47, v48, v49);
    }

    v31 = 0;
    v32 = v122;
    goto LABEL_11;
  }
  v27 = v16;
  v28 = v123;
  if (v9)
  {
    personSemanticsNetwork = v19->_personSemanticsNetwork;
    v19->_personSemanticsNetwork = 0;

    v30 = v17;
  }
  else
  {
    v30 = v17;
    v50 = [[PTPersonSemanticsNetwork alloc] initWithMetalContext:v15 effectUtil:v123 sharedResources:v17];
    v51 = v19->_personSemanticsNetwork;
    v19->_personSemanticsNetwork = v50;

    if (!v19->_personSemanticsNetwork)
    {
      v73 = _PTLogSystem();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
        -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:].cold.9(v73);
      }

      v31 = 0;
      goto LABEL_30;
    }
  }
  v52 = [[PTSubjectRelighting alloc] initWithMetalContext:v15 effectUtil:v123 prewarmOnly:v9];
  subjectRelighting = v19->_subjectRelighting;
  v19->_subjectRelighting = v52;

  if (v19->_subjectRelighting)
  {
    objc_storeStrong((id *)&v19->_faceAttributesNetwork, a4);
    if (v9)
    {
LABEL_19:
      v31 = v19;
LABEL_30:
      v32 = v122;
      goto LABEL_12;
    }
    v62 = [v15 device];
    uint64_t v63 = [v62 newBufferWithLength:64 options:0];
    lightEstimationBuffer = v19->_lightEstimationBuffer;
    v19->_lightEstimationBuffer = (MTLBuffer *)v63;

    CFAllocatorRef v65 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v66 = [v27 targetRGBA];
    size_t v67 = [v66 width];
    v68 = [v27 targetRGBA];
    size_t v69 = [v68 height];
    uint64_t v70 = *MEMORY[0x1E4F24C98];
    v125[0] = *MEMORY[0x1E4F24D20];
    v125[1] = v70;
    v126[0] = MEMORY[0x1E4F1CC08];
    v126[1] = &unk_1F26C0A18;
    CVReturn v71 = CVPixelBufferCreate(v65, v67, v69, 0x42475241u, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v126 forKeys:v125 count:2], &v19->_rgbaPixelBufferCopy);

    if (!v71)
    {
      v74 = (void *)MEMORY[0x1E4F35330];
      size_t Width = CVPixelBufferGetWidth(v19->_rgbaPixelBufferCopy);
      v76 = [v74 texture2DDescriptorWithPixelFormat:81 width:Width height:CVPixelBufferGetHeight(v19->_rgbaPixelBufferCopy) mipmapped:0];
      objc_msgSend(v76, "setUsage:", +[PTPixelBufferUtil getNoConcurrentAccessHint:](PTPixelBufferUtil, "getNoConcurrentAccessHint:", v19->_rgbaPixelBufferCopy) | 3);
      v77 = [v15 device];
      uint64_t v78 = [v77 newTextureWithDescriptor:v76 iosurface:CVPixelBufferGetIOSurface(v19->_rgbaPixelBufferCopy) plane:0];
      rgbaTextureCopy = v19->_rgbaTextureCopy;
      v19->_rgbaTextureCopy = (MTLTexture *)v78;

      if (v19->_rgbaTextureCopy)
      {
        v80 = [v15 textureUtil];
        uint64_t v81 = [v80 createWithWidth:a7->var0 >> 1 height:a7->var1 >> 1 pixelFormat:10];
        quarterSizeLumaCopy = v19->_quarterSizeLumaCopy;
        v19->_quarterSizeLumaCopy = (MTLTexture *)v81;

        if (v19->_quarterSizeLumaCopy)
        {
          v83 = [v15 textureUtil];
          uint64_t v84 = [v83 createWithWidth:a7->var0 >> 2 height:a7->var1 >> 2 pixelFormat:30];
          quarterSizeChromaCopy = v19->_quarterSizeChromaCopy;
          v19->_quarterSizeChromaCopy = (MTLTexture *)v84;

          if (v19->_quarterSizeChromaCopy)
          {
            v86 = [v15 textureUtil];
            v87 = [(PTPersonSemanticsNetwork *)v19->_personSemanticsNetwork inRGBA];
            uint64_t v88 = [v87 width];
            v89 = [(PTPersonSemanticsNetwork *)v19->_personSemanticsNetwork inRGBA];
            uint64_t v90 = objc_msgSend(v86, "createWithWidth:height:pixelFormat:", v88, objc_msgSend(v89, "height"), 71);
            skinMaskRGBA = v19->_skinMaskRGBA;
            v19->_skinMaskRGBA = (MTLTexture *)v90;

            if (v19->_skinMaskRGBA)
            {

              v28 = v123;
              goto LABEL_19;
            }
            v92 = _PTLogSystem();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
              -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:].cold.7(v92, v114, v115, v116, v117, v118, v119, v120);
            }
          }
          else
          {
            v92 = _PTLogSystem();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
              -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:].cold.6(v92, v107, v108, v109, v110, v111, v112, v113);
            }
          }
        }
        else
        {
          v92 = _PTLogSystem();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
            -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:].cold.5(v92, v100, v101, v102, v103, v104, v105, v106);
          }
        }
      }
      else
      {
        v92 = _PTLogSystem();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
          -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:].cold.4(v92, v93, v94, v95, v96, v97, v98, v99);
        }
      }

      v31 = 0;
      v32 = v122;
      v28 = v123;
      goto LABEL_12;
    }
    v72 = _PTLogSystem();
    v32 = v122;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
      -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:].cold.8(v71, v72);
    }

    v31 = 0;
    v28 = v123;
  }
  else
  {
    v54 = _PTLogSystem();
    v32 = v122;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:](v54, v55, v56, v57, v58, v59, v60, v61);
    }

    v31 = 0;
  }
LABEL_12:

  return v31;
}

- (void)dealloc
{
  rgbaPixelBufferCopy = self->_rgbaPixelBufferCopy;
  if (rgbaPixelBufferCopy) {
    CVPixelBufferRelease(rgbaPixelBufferCopy);
  }
  v4.receiver = self;
  v4.super_class = (Class)PTSyntheticLight;
  [(PTSyntheticLight *)&v4 dealloc];
}

- (void)updateSubjectRelighting:(uint64_t)a3 inLuma:(void *)a4 inChroma:(void *)a5 inFaceRects:(uint64_t)a6 runOnAsyncCommandQueue:(int)a7 transform:(long long *)a8 dependentCommandBuffer:(void *)a9
{
  id v15 = a5;
  id v16 = a4;
  [a9 waitUntilScheduled];
  long long v17 = a8[1];
  long long v42 = *a8;
  long long v43 = v17;
  long long v44 = a8[2];
  uint64_t v18 = +[PTUtil orientationFromTransform:&v42 inverse:1];
  kdebug_trace();
  int v41 = a7;
  uint64_t v19 = 16;
  if (a7) {
    uint64_t v19 = 24;
  }
  id v20 = *(id *)(a1 + v19);
  [*(id *)(a1 + 32) executeNetwork:v20];
  v21 = [v20 commandBuffer];

  if (!v21)
  {
    v22 = _PTLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[PTEspressoGenericExecutor convertBindInput:](v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  uint64_t v30 = *(unsigned int *)(a6 + 64);
  long long v31 = a8[1];
  long long v42 = *a8;
  long long v43 = v31;
  long long v44 = a8[2];
  v32 = +[PTEffectUtil faceRectsForVision:a6 numberOfFaceRects:v30 transform:&v42];
  uint64_t v33 = [*(id *)(a1 + 104) faceLandmarksInPixelBuffer:a3 faceRects:v32 orientation:v18];
  uint64_t v34 = *(void **)(a1 + 96);
  *(void *)(a1 + 96) = v33;

  uint64_t v35 = *(void **)(a1 + 88);
  uint64_t v36 = [v20 commandBuffer];
  uint64_t v37 = [*(id *)(a1 + 32) outSkinMask];
  uint64_t v38 = [*(id *)(a1 + 32) outPersonMask];
  uint64_t v39 = *(void *)(a1 + 96);
  long long v40 = a8[1];
  long long v42 = *a8;
  long long v43 = v40;
  long long v44 = a8[2];
  objc_msgSend(v35, "runSRLForLivePhotosWithInputBuffer:lumaTexture:chromaTexture:skinMaskTexture:personMaskTexture:skinToneClassification:validROI:expBias:faceExpRatio:transform:", v36, v16, v15, v37, v38, v39, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0, &v42);

  if (v41) {
    [v20 commitAndWaitUntilCompleted];
  }
  else {
    [v20 commit];
  }
  [v20 commit];
  kdebug_trace();
}

- (void)estimateLightIntensityWithFaceRects:(PTSyntheticLight *)self inTex:(SEL)a2 numberOfFaceRects:transform:humanDetections:asyncWork:
{
  v8 = v7;
  BOOL v9 = v6;
  v10 = v5;
  int v11 = v4;
  v12 = v2;
  id v14 = v3;
  id v15 = v9;
  id v16 = v8;
  os_unfair_lock_lock(&sSRLAsyncLock);
  BOOL subjectRelightingRunning = self->_subjectRelightingRunning;
  os_unfair_lock_unlock(&sSRLAsyncLock);
  if (!subjectRelightingRunning
    && (self->_config.firstFrame
     || v11 >= 1 && self->_config.framesSinceLightEstimate >= self->_config.lightEstimateFrequency)
    && (int)[v15 detectionsRawCount] >= 1)
  {
    uint64_t v57 = v12;
    uint64_t v58 = v10;
    uint64_t v18 = 0;
    unsigned __int8 v19 = 0;
    uint64_t v20 = 64;
    do
    {
      v19 |= fabsf(fmodf(*(float *)([v15 detectionsRaw] + v20) + 180.0, 360.0) + -180.0) < 60.0;
      ++v18;
      v20 += 144;
    }
    while (v18 < (int)[v15 detectionsRawCount]);
    if (((v11 > 0) & v19) != 0)
    {
      uint64_t v68 = 0;
      size_t v69 = &v68;
      uint64_t v70 = 0x7010000000;
      CVReturn v71 = &unk_1D084FB0A;
      uint64_t v76 = 0;
      uint64_t v77 = 0;
      long long v21 = v57[1];
      long long v72 = *v57;
      long long v73 = v21;
      long long v22 = v57[3];
      long long v74 = v57[2];
      long long v75 = v22;
      LODWORD(v76) = v11;
      uint64_t v23 = [(PTMetalContext *)self->_mainMetalContext commandBuffer];

      if (!v23)
      {
        uint64_t v24 = _PTLogSystem();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          [(PTSyntheticLight *)v24 estimateLightIntensityWithFaceRects:v26 inTex:v27 numberOfFaceRects:v28 transform:v29 humanDetections:v30 asyncWork:v31];
        }
      }
      v32 = [(PTMetalContext *)self->_mainMetalContext textureUtil];
      uint64_t v33 = [(PTMetalContext *)self->_mainMetalContext commandBuffer];
      uint64_t v34 = [(PTMSRResize *)self->_msrColorPyramid targetRGBA];
      uint64_t v35 = [(PTPersonSemanticsNetwork *)self->_personSemanticsNetwork inRGBA];
      [v32 copy:v33 inTex:v34 outTex:v35];

      self->_config.framesSinceLightEstimate = 0;
      uint64_t v36 = [(PTMetalContext *)self->_mainMetalContext textureUtil];
      uint64_t v37 = [(PTMetalContext *)self->_mainMetalContext commandBuffer];
      uint64_t v38 = [(PTMSRResize *)self->_msrColorPyramid targetRGBA];
      [v36 copy:v37 inTex:v38 outTex:self->_rgbaTextureCopy];

      uint64_t v39 = [(PTMetalContext *)self->_mainMetalContext textureUtil];
      long long v40 = [(PTMetalContext *)self->_mainMetalContext commandBuffer];
      int v41 = [v14 texLuma];
      [v39 copy:v40 inTex:v41 outTex:self->_quarterSizeLumaCopy];

      long long v42 = [(PTMetalContext *)self->_mainMetalContext textureUtil];
      long long v43 = [(PTMetalContext *)self->_mainMetalContext commandBuffer];
      long long v44 = [v14 texChroma];
      [v42 copy:v43 inTex:v44 outTex:self->_quarterSizeChromaCopy];

      uint64_t v45 = [(PTMetalContext *)self->_mainMetalContext commandBuffer];
      [(PTMetalContext *)self->_mainMetalContext commit];
      if (self->_config.firstFrame || sPTEffectDisableAsyncWork == 1)
      {
        self->_BOOL subjectRelightingRunning = 0;
        long long v46 = *((_OWORD *)v69 + 3);
        long long v47 = *((_OWORD *)v69 + 5);
        long long v48 = *((_OWORD *)v69 + 6);
        location[2] = *((_OWORD *)v69 + 4);
        location[3] = v47;
        rgbaPixelBufferCopy = self->_rgbaPixelBufferCopy;
        quarterSizeLumaCopy = self->_quarterSizeLumaCopy;
        quarterSizeChromaCopy = self->_quarterSizeChromaCopy;
        location[4] = v48;
        location[0] = *((_OWORD *)v69 + 2);
        location[1] = v46;
        long long v52 = v58[1];
        v66[0] = *v58;
        long long v53 = v58[2];
        v66[1] = v52;
        v66[2] = v53;
        [(PTSyntheticLight *)self updateSubjectRelighting:rgbaPixelBufferCopy inLuma:quarterSizeLumaCopy inChroma:quarterSizeChromaCopy inFaceRects:location runOnAsyncCommandQueue:0 transform:v66 dependentCommandBuffer:v45];
      }
      else
      {
        v54 = self->_rgbaPixelBufferCopy;
        CVPixelBufferRetain(v54);
        self->_BOOL subjectRelightingRunning = 1;
        objc_initWeak((id *)location, self);
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __116__PTSyntheticLight_estimateLightIntensityWithFaceRects_inTex_numberOfFaceRects_transform_humanDetections_asyncWork___block_invoke;
        v59[3] = &unk_1E6884638;
        objc_copyWeak(v62, (id *)location);
        v62[1] = v54;
        v59[4] = self;
        uint64_t v61 = &v68;
        long long v55 = v58[1];
        long long v63 = *v58;
        long long v64 = v55;
        long long v65 = v58[2];
        id v60 = v45;
        uint64_t v56 = (void *)MEMORY[0x1D25E44D0](v59);
        [v16 addObject:v56];

        objc_destroyWeak(v62);
        objc_destroyWeak((id *)location);
      }

      _Block_object_dispose(&v68, 8);
    }
  }
}

void __116__PTSyntheticLight_estimateLightIntensityWithFaceRects_inTex_numberOfFaceRects_transform_humanDetections_asyncWork___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = *(_OWORD **)(*(void *)(a1 + 48) + 8);
    long long v6 = v5[3];
    long long v7 = v5[5];
    long long v8 = v5[6];
    v15[2] = v5[4];
    v15[3] = v7;
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *((void *)WeakRetained + 17);
    uint64_t v11 = *((void *)WeakRetained + 18);
    v12 = *(void **)(a1 + 32);
    v15[4] = v8;
    v15[0] = v5[2];
    v15[1] = v6;
    long long v13 = *(_OWORD *)(a1 + 88);
    v14[0] = *(_OWORD *)(a1 + 72);
    v14[1] = v13;
    v14[2] = *(_OWORD *)(a1 + 104);
    [v12 updateSubjectRelighting:v9 inLuma:v10 inChroma:v11 inFaceRects:v15 runOnAsyncCommandQueue:1 transform:v14 dependentCommandBuffer:v4];
    os_unfair_lock_lock(&sSRLAsyncLock);
    v3[112] = 0;
    os_unfair_lock_unlock(&sSRLAsyncLock);
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 64));
}

- (void)interpolateLightIntensity:(float)a3
{
  os_unfair_lock_lock(&sSRLAsyncLock);
  BOOL subjectRelightingRunning = self->_subjectRelightingRunning;
  os_unfair_lock_unlock(&sSRLAsyncLock);
  if (!subjectRelightingRunning)
  {
    int framesSinceLightEstimate = self->_config.framesSinceLightEstimate;
    if (framesSinceLightEstimate < self->_config.lightEstimateFrequency)
    {
      long long v7 = [(PTMetalContext *)self->_mainMetalContext commandBuffer];
      *(float *)&double v8 = a3;
      [(PTSyntheticLight *)self estimateLightIntensity:v7 relightStrength:v8];

      int framesSinceLightEstimate = self->_config.framesSinceLightEstimate;
    }
    self->_config.firstFrame = 0;
    self->_config.int framesSinceLightEstimate = framesSinceLightEstimate + 1;
  }
}

- (void)estimateLightIntensity:(id)a3 relightStrength:(float)a4
{
  float v5 = (float)(a4 * 0.6) + 0.5;
  p_config = &self->_config;
  if (!self->_config.firstFrame && v5 != self->_lastRelightStrength)
  {
    self->_config.firstFrame = 1;
    self->_config.int framesSinceLightEstimate = 0;
  }
  long long v7 = [a3 computeCommandEncoder];
  [v7 setComputePipelineState:self->_lightEstimation];
  double v8 = [(PTSubjectRelighting *)self->_subjectRelighting srlV2CoeffsBuffer];
  [v7 setBuffer:v8 offset:0 atIndex:0];

  [v7 setBuffer:self->_lightEstimationBuffer offset:0 atIndex:1];
  [v7 setBytes:p_config length:16 atIndex:2];
  uint64_t v13 = 0x3F4CCCCD3F19999ALL;
  int32x4_t v15 = vdupq_n_s32(0x3EB33333u);
  float v14 = v5;
  [v7 setBytes:&v13 length:28 atIndex:3];
  int64x2_t v11 = vdupq_n_s64(1uLL);
  uint64_t v12 = 1;
  unint64_t v9 = [(MTLComputePipelineState *)self->_lightEstimation threadExecutionWidth];
  v10[0] = 8;
  v10[1] = v9 >> 3;
  v10[2] = 1;
  [v7 dispatchThreads:&v11 threadsPerThreadgroup:v10];
  [v7 endEncoding];
  self->_lastRelightStrength = v5;
}

- (id)debugTextures
{
  v3 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v4 = [(PTPersonSemanticsNetwork *)self->_personSemanticsNetwork outSkinMask];
  float v5 = [(PTPersonSemanticsNetwork *)self->_personSemanticsNetwork outPersonMask];
  long long v6 = [(PTSubjectRelighting *)self->_subjectRelighting samplePosDebug];
  long long v7 = objc_msgSend(v3, "arrayWithObjects:", v4, v5, v6, 0);

  return v7;
}

- (id)srlV2CoeffsBuffer
{
  return [(PTSubjectRelighting *)self->_subjectRelighting srlV2CoeffsBuffer];
}

- (void)reset
{
  self->_config.int framesSinceLightEstimate = 0;
}

- (id)debugDescription
{
  return self->_description;
}

- (id)lightEstimation
{
  return self->_lightEstimationBuffer;
}

- (id)faceObservations
{
  return self->_faceObservations;
}

+ (void)disableAsynchronousWork
{
  sPTEffectDisableAsyncWork = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightEstimationBuffer, 0);
  objc_storeStrong((id *)&self->_quarterSizeChromaCopy, 0);
  objc_storeStrong((id *)&self->_quarterSizeLumaCopy, 0);
  objc_storeStrong((id *)&self->_rgbaTextureCopy, 0);
  objc_storeStrong((id *)&self->_faceAttributesNetwork, 0);
  objc_storeStrong((id *)&self->_faceObservations, 0);
  objc_storeStrong((id *)&self->_subjectRelighting, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_skinMaskRGBA, 0);
  objc_storeStrong((id *)&self->_msrColorPyramid, 0);
  objc_storeStrong((id *)&self->_effectUtil, 0);
  objc_storeStrong((id *)&self->_personSemanticsNetwork, 0);
  objc_storeStrong((id *)&self->_asyncMetalContext, 0);
  objc_storeStrong((id *)&self->_mainMetalContext, 0);

  objc_storeStrong((id *)&self->_lightEstimation, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 effectUtil:(uint64_t)a5 msrColorPyramid:(uint64_t)a6 colorSize:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 effectUtil:(uint64_t)a5 msrColorPyramid:(uint64_t)a6 colorSize:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 effectUtil:(uint64_t)a5 msrColorPyramid:(uint64_t)a6 colorSize:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 effectUtil:(uint64_t)a5 msrColorPyramid:(uint64_t)a6 colorSize:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 effectUtil:(uint64_t)a5 msrColorPyramid:(uint64_t)a6 colorSize:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 effectUtil:(uint64_t)a5 msrColorPyramid:(uint64_t)a6 colorSize:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 effectUtil:(uint64_t)a5 msrColorPyramid:(uint64_t)a6 colorSize:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(int)a1 faceAttributesNetwork:(NSObject *)a2 effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:.cold.8(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "CVPixelBufferCreate failed %i", (uint8_t *)v2, 8u);
}

- (void)initWithMetalContext:(os_log_t)log faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:.cold.9(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Failed allocating PTSegmentationNetwork", v1, 2u);
}

- (void)estimateLightIntensityWithFaceRects:(uint64_t)a3 inTex:(uint64_t)a4 numberOfFaceRects:(uint64_t)a5 transform:(uint64_t)a6 humanDetections:(uint64_t)a7 asyncWork:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end