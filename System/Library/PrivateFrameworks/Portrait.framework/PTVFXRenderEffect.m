@interface PTVFXRenderEffect
+ (uint64_t)transformVideoPositionToCropCoordinates:(uint64_t)a3 effectRenderRequest:(uint64_t)a4 flipYAxis:(char)a5;
+ (uint64_t)transformVideoRectToCropCoordinates:(uint64_t)a3 effectRenderRequest:(void *)a4;
+ (void)setRandomizationSeed:(int)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)colorSize;
- (BOOL)computeSoftAlphaMask;
- (BOOL)emitNewReaction;
- (BOOL)reverseZ;
- (BOOL)updateWithRenderRequest:(id)a3 lastFrameTime:(double)a4;
- (BOOL)useSoftAlphaMask:(unint64_t)a3;
- (NSArray)reactionTemplates;
- (PTVFXRenderEffect)initWithMetalContext:(id)a3 colorSize:(id *)a4 colorConversion:(id)a5 prewarmOnly:(BOOL)a6 humanDetections:(id)a7 asyncInitQueue:(id)a8;
- (double)depthNearFar;
- (float)dimmingFactor;
- (id)activeReactions;
- (id)addNewEffectFromEvent:(id)a3 renderRequest:(id)a4 time:(double)a5 presenterOverlaySmall:(BOOL)a6;
- (int)convertRGB:(id)a3 inRGBA:(id)a4 inAlphaMask:(id)a5 outRGBA:(id)a6 toLinear:(BOOL)a7 transferFunction:(id)a8;
- (int)initVFX:(BOOL)a3 asyncInitQueue:(id)a4;
- (int)maxReactionEffectComplexity;
- (int)render:(id)a3 effectRGBA:(id)a4 effectDepth:(id)a5;
- (int)renderWithBackgroundDimming:(id)a3 effectRGBA:(id)a4 inCenteredDisparity:(id)a5 inSegmentation:(id)a6 effectDepth:(id)a7 disparityFiltered:(id)a8 focusDisparityModifiers:(id)a9 renderRequest:(id)a10 debugType:(int64_t)a11;
- (unint64_t)depthOutputPixelFormat;
- (unint64_t)rgbaOutputPixelFormat;
- (void)removeAllActiveReactions;
- (void)removeEffectBindingWithKey:(id)a3;
- (void)setDepthNearFar:(PTVFXRenderEffect *)self;
- (void)setReactionTemplates:(id)a3;
- (void)setReverseZ:(BOOL)a3;
- (void)setupCommonVFXSceneLoadOptions:(id)a3 metalLibraryURL:(id)a4;
- (void)updateCameraProjection;
@end

@implementation PTVFXRenderEffect

- (void)setupCommonVFXSceneLoadOptions:(id)a3 metalLibraryURL:(id)a4
{
  id v6 = a3;
  metalContext = self->_metalContext;
  id v8 = a4;
  v9 = [(PTMetalContext *)metalContext device];
  [v6 setDevice:v9];

  v10 = [(PTMetalContext *)self->_metalContext commandQueue];
  [v6 setCommandQueue:v10];

  [v6 setMetalLibraryURL:v8];
  [v6 setAutomaticallyPrepareScene:0];
  [v6 setColorPixelFormat:self->rgbaOutputPixelFormat];
  [v6 setDepthPixelFormat:self->depthOutputPixelFormat];
  [v6 setInternalPixelFormatDepth:0];
  [v6 setEnableDeferredRendering:0];
  SEL v11 = NSSelectorFromString(&cfstr_Setdonotclearr.isa);
  if (objc_opt_respondsToSelector())
  {
    v12 = [v6 methodSignatureForSelector:v11];
    v13 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v12];
    [v13 setSelector:v11];
    [v13 setTarget:v6];
    char v14 = 1;
    [v13 setArgument:&v14 atIndex:2];
    [v13 invoke];
  }
}

void __44__PTVFXRenderEffect_initVFX_asyncInitQueue___block_invoke(uint64_t a1)
{
  kdebug_trace();
  v2 = objc_opt_new();
  v4 = 0;
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v5 = 0;
    do
    {
      if (v5 == 2)
      {
        id v6 = [v2 lastObject];
        [v2 addObject:v6];
      }
      else
      {
        gotLoadHelper_x8__OBJC_CLASS___VFXSceneLoadOptions(v3);
        id v6 = objc_opt_new();
        [*(id *)(a1 + 40) setupCommonVFXSceneLoadOptions:v6 metalLibraryURL:*(void *)(a1 + 48)];
        [v6 setSetupAsTemplate:1];
        gotLoadHelper_x8__OBJC_CLASS____TtC3VFX8VFXScene(v7);
        v9 = (void *)[objc_alloc(*(Class *)(v8 + 2512)) initWithOptions:v6];
        v10 = *(void **)(a1 + 56);
        SEL v11 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v5];
        v12 = [v10 pathForResource:v11 ofType:@"vfx"];

        v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
        id v18 = v4;
        id v14 = (id)[v9 addEffectFrom:v13 error:&v18];
        id v15 = v18;

        [v9 prepare];
        [v2 addObject:v9];

        v4 = v15;
      }

      ++v5;
    }
    while (v5 < [*(id *)(a1 + 32) count]);
  }
  v16 = *(void **)(a1 + 40);
  v17 = (void *)[v2 copy];
  [v16 setReactionTemplates:v17];

  kdebug_trace();
}

- (PTVFXRenderEffect)initWithMetalContext:(id)a3 colorSize:(id *)a4 colorConversion:(id)a5 prewarmOnly:(BOOL)a6 humanDetections:(id)a7 asyncInitQueue:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v53 = a7;
  id v17 = a8;
  v56.receiver = self;
  v56.super_class = (Class)PTVFXRenderEffect;
  id v18 = [(PTVFXRenderEffect *)&v56 init];
  if (v18)
  {
    kdebug_trace();
    objc_storeStrong((id *)v18 + 1, a3);
    objc_storeStrong((id *)v18 + 2, a5);
    long long v19 = *(_OWORD *)&a4->var0;
    *((void *)v18 + 13) = a4->var2;
    *(_OWORD *)(v18 + 88) = v19;
    long long v20 = *(_OWORD *)&a4->var0;
    *((void *)v18 + 16) = a4->var2;
    *((_OWORD *)v18 + 7) = v20;
    *((void *)v18 + 43) = 81;
    *((void *)v18 + 44) = 260;
    v18[76] = 0;
    v21 = [PTVFXSoftAlphaMask alloc];
    uint64_t v22 = *((void *)v18 + 1);
    long long v54 = *(_OWORD *)&a4->var0;
    unint64_t var2 = a4->var2;
    uint64_t v23 = [(PTVFXSoftAlphaMask *)v21 initWithMetalContext:v22 colorSize:&v54];
    v24 = (void *)*((void *)v18 + 7);
    *((void *)v18 + 7) = v23;

    *((void *)v18 + 20) = +[PTEffectUtil aspectRatio:](PTEffectUtil, "aspectRatio:", (double)a4->var0, (double)a4->var1);
    objc_storeStrong((id *)v18 + 4, a7);
    *((void *)v18 + 45) = 0x461C40003DCCCCCDLL;
    v18[336] = 1;
    v18[244] = 0;
    v25 = [[PTEffectReactionBackgroundDimming alloc] initWithMetalContext:v15];
    v26 = (void *)*((void *)v18 + 3);
    *((void *)v18 + 3) = v25;

    if (*((void *)v18 + 3))
    {
      uint64_t v27 = objc_opt_new();
      v28 = (void *)*((void *)v18 + 32);
      *((void *)v18 + 32) = v27;

      v29 = objc_opt_new();
      LODWORD(v54) = 0;
      v30 = v18 + 264;
      do
      {
        [v29 reset];
        [v29 setConstantValue:&v54 type:29 withName:@"kColorTransferFunction"];
        uint64_t v31 = [v15 computePipelineStateFor:@"convertRGBAlpha" withConstants:v29];
        v32 = *(void **)&v30[8 * (int)v54];
        *(void *)&v30[8 * (int)v54] = v31;

        int v33 = v54;
        if (!*(void *)&v30[8 * (int)v54])
        {
          v43 = _PTLogSystem();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            [(PTVFXRenderEffect *)v43 initWithMetalContext:v45 colorSize:v46 colorConversion:v47 prewarmOnly:v48 humanDetections:v49 asyncInitQueue:v50];
          }

          goto LABEL_15;
        }
        LODWORD(v54) = v54 + 1;
      }
      while (v33 <= 7);
      if (a6)
      {
        kdebug_trace();
      }
      else
      {
        int v51 = [v18 initVFX:0 asyncInitQueue:v17];
        kdebug_trace();
        if (v51) {
          goto LABEL_15;
        }
      }
      v34 = v18;
    }
    else
    {
      v29 = _PTLogSystem();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        [(PTVFXRenderEffect *)v29 initWithMetalContext:v37 colorSize:v38 colorConversion:v39 prewarmOnly:v40 humanDetections:v41 asyncInitQueue:v42];
      }
LABEL_15:
      v34 = 0;
    }
    v35 = v53;
  }
  else
  {
    v34 = 0;
    v35 = v53;
  }

  return v34;
}

- (int)initVFX:(BOOL)a3 asyncInitQueue:(id)a4
{
  BOOL v51 = a3;
  queue = a4;
  unint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  gotLoadHelper_x8__OBJC_CLASS___VFXRenderer(v6);
  id v8 = objc_alloc(*(Class *)(v7 + 2464));
  v9 = [(PTMetalContext *)self->_metalContext commandQueue];
  v10 = (VFXRenderer *)[v8 initWithCommandQueue:v9];
  vfxRenderer = self->_vfxRenderer;
  self->_vfxRenderer = v10;

  v12 = [v5 URLForResource:@"default" withExtension:@"metallib"];
  gotLoadHelper_x8__OBJC_CLASS___VFXSceneLoadOptions(v13);
  id v14 = objc_opt_new();
  [(PTVFXRenderEffect *)self setupCommonVFXSceneLoadOptions:v14 metalLibraryURL:v12];
  gotLoadHelper_x8__OBJC_CLASS____TtC3VFX8VFXScene(v15);
  v52 = (void *)[objc_alloc(*(Class *)(v16 + 2512)) initWithOptions:v14];
  -[VFXRenderer setScene:](self->_vfxRenderer, "setScene:");
  id v17 = [v5 pathForResource:@"lighting" ofType:@"vfx"];
  id v18 = [(VFXRenderer *)self->_vfxRenderer scene];
  long long v19 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17];
  id v59 = 0;
  long long v20 = [v18 addEffectFrom:v19 error:&v59];
  id v21 = v59;
  p_lighting = &self->_lighting;
  lighting = self->_lighting;
  self->_lighting = v20;

  if (v21 || (v26 = *p_lighting) == 0)
  {
    v24 = _PTLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[PTVFXRenderEffect initVFX:asyncInitQueue:]((uint64_t)v17, (uint64_t)v21, v24);
    }

    int v25 = 0;
    v26 = *p_lighting;
    int v27 = -1;
  }
  else
  {
    int v27 = 0;
    int v25 = 1;
  }
  v28 = [(_TtC3VFX9VFXEffect *)v26 bindingOf:@"Skybox" named:@"intensity"];
  lightBinding = self->_lightBinding;
  self->_lightBinding = v28;

  v30 = [(VFXRenderer *)self->_vfxRenderer scene];
  [v30 prepare];

  if (v25 && !v51)
  {
    [(PTVFXRenderEffect *)self setReactionTemplates:MEMORY[0x1E4F1CBF0]];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PTVFXRenderEffect_initVFX_asyncInitQueue___block_invoke;
    block[3] = &unk_1E68841D8;
    id v55 = &unk_1F26C10C0;
    objc_super v56 = self;
    id v57 = v12;
    id v58 = v5;
    dispatch_async(queue, block);
  }
  uint64_t v31 = (NSMutableDictionary *)objc_opt_new();
  effectBindings = self->_effectBindings;
  self->_effectBindings = v31;

  int v33 = [(_TtC3VFX9VFXEffect *)self->_lighting cameras];
  v34 = [v33 firstObject];
  camera = self->_camera;
  self->_camera = v34;

  uint64_t v36 = [(_TtC3VFX9VFXEffect *)self->_lighting cameras];
  uint64_t v37 = [v36 count];

  if (v37 != 1)
  {
    uint64_t v38 = _PTLogSystem();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[PTVFXRenderEffect initVFX:asyncInitQueue:]((id *)&self->_lighting, v38);
    }

    int v27 = -2;
  }
  self->_cameraRotationDegrees = -1;
  float32x2_t v39 = *(float32x2_t *)self->depthNearFar;
  float v40 = vmuls_lane_f32(v39.f32[0], v39, 1);
  float v41 = -(float)(v40 + (float)(v39.f32[1] * -0.5));
  float v42 = vmlas_n_f32(v40, -0.5, v39.f32[0]);
  if (!self->reverseZ) {
    float v42 = v41;
  }
  self->_emitZValue = v42 / (float)((float)(v39.f32[0] - v39.f32[1]) * -0.5);
  if (v21)
  {
    v43 = _PTLogSystem();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      -[PTVFXRenderEffect initVFX:asyncInitQueue:]((uint64_t)v21, v43, v44, v45, v46, v47, v48, v49);
    }

    int v27 = -1;
  }

  return v27;
}

- (id)activeReactions
{
  return self->_activeReactions;
}

- (BOOL)updateWithRenderRequest:(id)a3 lastFrameTime:(double)a4
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [v6 frameTimeSeconds];
  double v8 = v7;
  BOOL v9 = [v6 presenterOverlayMode] == 3 || objc_msgSend(v6, "presenterOverlayMode") == 4;
  BOOL v95 = v9;
  v10 = [(PTVFXRenderEffect *)self reactionTemplates];
  uint64_t v11 = [v10 count];

  v102 = self;
  if ([(NSMutableDictionary *)self->_activeReactions count])
  {
    BOOL v12 = 0;
  }
  else
  {
    double v13 = [v6 reactions];
    BOOL v12 = [v13 count] == 0;
  }
  BOOL v14 = 0;
  if (!v11 || v12) {
    goto LABEL_95;
  }
  [v6 inReactionColorSize];
  if (v15 != (double)v102->_colorSize.width
    || ([v6 inReactionColorSize], v16 != (double)v102->_colorSize.height))
  {
    [v6 inReactionColorSize];
    if (v17 != 0.0)
    {
      [v6 inReactionColorSize];
      if (v18 != 0.0)
      {
        [v6 inReactionColorSize];
        unint64_t v20 = (unint64_t)v19;
        [v6 inReactionColorSize];
        v102->_colorSize.double width = v20;
        v102->_colorSize.double height = (unint64_t)v21;
        v102->_colorSize.depth = 0;
      }
    }
  }
  double width = (double)v102->_colorSize.width;
  [v6 outColorROI];
  v24 = v6;
  unint64_t v25 = (unint64_t)(v23 * width);
  double height = (double)v102->_colorSize.height;
  v99 = v24;
  [v24 outColorROI];
  unint64_t v28 = (unint64_t)(v27 * height);
  if (v102->_colorSizeROI.width == v25 && v102->_colorSizeROI.height == v28)
  {
    int v29 = 0;
  }
  else
  {
    v102->_colorSizeROI.double width = v25;
    v102->_colorSizeROI.double height = v28;
    int v29 = 1;
    v102->_colorSizeROI.depth = 1;
    v102->_aspectRatio = +[PTEffectUtil aspectRatio:](PTEffectUtil, "aspectRatio:", (double)v25, (double)v28);
  }
  if (v99) {
    [v99 transform];
  }
  else {
    memset(v124, 0, 48);
  }
  int v30 = +[PTUtil getRotationDegreesFromAffineTransform:v124];
  if (v30 == v102->_cameraRotationDegrees)
  {
    if (!v29) {
      goto LABEL_26;
    }
  }
  else
  {
    v102->_cameraRotationDegrees = v30;
  }
  [(PTVFXRenderEffect *)v102 updateCameraProjection];
LABEL_26:
  float v31 = v8 - a4;
  BOOL v32 = v31 > 0.25 && !v102->_simulationWasSkippedForPreviousFrame;
  if (v31 <= 0.0166666667) {
    float v31 = 0.016667;
  }
  if (v31 > 0.25) {
    float v31 = 0.25;
  }
  double v33 = v31;
  BOOL v93 = v32;
  kdebug_trace();
  id v34 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v35 = [(NSMutableDictionary *)v102->_effectBindings allKeys];
  v98 = (void *)[v34 initWithArray:v35];

  uint64_t v36 = v102;
  v102->_emitNewReaction = 0;
  v102->_float dimmingFactor = 0.0;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  obuint64_t j = [v99 reactions];
  uint64_t v100 = [obj countByEnumeratingWithState:&v120 objects:v129 count:16];
  if (v100)
  {
    int v101 = 0;
    uint64_t v96 = *(void *)v121;
    int v97 = 0;
    do
    {
      for (uint64_t i = 0; i != v100; ++i)
      {
        if (*(void *)v121 != v96) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = *(void **)(*((void *)&v120 + 1) + 8 * i);
        float32x2_t v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v38, "triggerID"));
        long long v116 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        float v40 = [(NSMutableDictionary *)v36->_effectBindings allValues];
        uint64_t v41 = [v40 countByEnumeratingWithState:&v116 objects:v128 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v117;
LABEL_40:
          uint64_t v44 = 0;
          while (1)
          {
            if (*(void *)v117 != v43) {
              objc_enumerationMutation(v40);
            }
            uint64_t v45 = *(void **)(*((void *)&v116 + 1) + 8 * v44);
            uint64_t v46 = [v45 effectType];
            if (v46 == [v38 effectType]) {
              break;
            }
            if (v42 == ++v44)
            {
              uint64_t v42 = [v40 countByEnumeratingWithState:&v116 objects:v128 count:16];
              if (v42) {
                goto LABEL_40;
              }
              goto LABEL_46;
            }
          }
          id v47 = v45;

          if (!v47) {
            goto LABEL_49;
          }
          uint64_t v48 = v99;
          uint64_t v36 = v102;
        }
        else
        {
LABEL_46:

LABEL_49:
          long long v114 = 0u;
          long long v115 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          uint64_t v49 = [(NSMutableDictionary *)v102->_effectBindings allValues];
          uint64_t v50 = [v49 countByEnumeratingWithState:&v112 objects:v127 count:16];
          if (v50)
          {
            uint64_t v51 = v50;
            uint64_t v52 = *(void *)v113;
            do
            {
              for (uint64_t j = 0; j != v51; ++j)
              {
                if (*(void *)v113 != v52) {
                  objc_enumerationMutation(v49);
                }
                [*(id *)(*((void *)&v112 + 1) + 8 * j) forceFadeOut:v8];
              }
              uint64_t v51 = [v49 countByEnumeratingWithState:&v112 objects:v127 count:16];
            }
            while (v51);
          }

          ++v101;
          uint64_t v54 = [v38 effectType];
          uint64_t v36 = v102;
          uint64_t v48 = v99;
          id v55 = [(PTVFXRenderEffect *)v102 addNewEffectFromEvent:v38 renderRequest:v99 time:v95 presenterOverlaySmall:v8];
          id v47 = v55;
          BOOL v56 = v54 << 32 != 0x100000000 && v95;
          BOOL v57 = v54 << 32 != 0x200000000 && v56;
          [v55 setUseCircularGradient:v57];
          [(NSMutableDictionary *)v102->_effectBindings setObject:v47 forKeyedSubscript:v39];
          v102->_emitNewReaction |= v47 != 0;
        }
        [v48 inReactionVideoRect];
        objc_msgSend(v47, "updateWithEvent:renderRequest:videoRect:time:", v38, v48);
        if ([v47 active])
        {
          ++v97;
        }
        else
        {
          id v58 = [v47 effect];

          if (v58)
          {
            id v59 = [(VFXRenderer *)v36->_vfxRenderer scene];
            v60 = [v47 effect];
            [v59 removeEffect:v60];

            v61 = [(VFXRenderer *)v36->_vfxRenderer scene];
            [v61 clearCaches];

            [v47 setEffect:0];
            [(NSMutableDictionary *)v36->_activeReactions removeObjectForKey:v39];
          }
        }
        [v98 removeObject:v39];
        v62 = [v47 effect];
        [v62 setIsEnabled:1];

        float dimmingFactor = v36->_dimmingFactor;
        [v47 dimmingFactor];
        if (dimmingFactor >= v64) {
          float v64 = dimmingFactor;
        }
        v36->_float dimmingFactor = v64;
      }
      uint64_t v100 = [obj countByEnumeratingWithState:&v120 objects:v129 count:16];
    }
    while (v100);
  }

  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  v65 = [(NSMutableDictionary *)v36->_effectBindings allValues];
  uint64_t v66 = [v65 countByEnumeratingWithState:&v108 objects:v126 count:16];
  if (v66)
  {
    uint64_t v68 = v66;
    uint64_t v69 = *(void *)v109;
    do
    {
      for (uint64_t k = 0; k != v68; ++k)
      {
        if (*(void *)v109 != v69) {
          objc_enumerationMutation(v65);
        }
        *(float *)&double v67 = v36->_dimmingFactor;
        [*(id *)(*((void *)&v108 + 1) + 8 * k) updateBackgroundDimming:v67];
      }
      uint64_t v68 = [v65 countByEnumeratingWithState:&v108 objects:v126 count:16];
    }
    while (v68);
  }

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  v71 = (void *)[v98 copy];
  uint64_t v72 = [v71 countByEnumeratingWithState:&v104 objects:v125 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    int v74 = 0;
    uint64_t v75 = *(void *)v105;
    do
    {
      for (uint64_t m = 0; m != v73; ++m)
      {
        if (*(void *)v105 != v75) {
          objc_enumerationMutation(v71);
        }
        uint64_t v77 = *(void *)(*((void *)&v104 + 1) + 8 * m);
        v78 = [(NSMutableDictionary *)v36->_effectBindings objectForKey:v77];
        [v99 inReactionVideoRect];
        objc_msgSend(v78, "updateWithEvent:renderRequest:videoRect:time:", 0, v99);
        float v79 = v36->_dimmingFactor;
        [v78 dimmingFactor];
        if (v79 >= v80) {
          float v80 = v79;
        }
        v36->_float dimmingFactor = v80;
        if (([v78 active] & 1) == 0)
        {
          [(PTVFXRenderEffect *)v36 removeEffectBindingWithKey:v77];
          ++v74;
        }
      }
      uint64_t v73 = [v71 countByEnumeratingWithState:&v104 objects:v125 count:16];
    }
    while (v73);
  }

  if (v93)
  {
    v81 = _PTLogSystem();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
      -[PTVFXRenderEffect updateWithRenderRequest:lastFrameTime:](v81, v82, v83, v84, v85, v86, v87, v88);
    }
    char v89 = 1;
  }
  else
  {
    v81 = [(VFXRenderer *)v36->_vfxRenderer scene];
    [v81 updateWithDeltaTime:v33];
    char v89 = 0;
  }

  v36->_simulationWasSkippedForPreviousFrame = v89;
  float v90 = v36->_dimmingFactor * -0.95 + 1.0;
  float v103 = v90;
  v91 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v103 length:4];
  +[PTVFXRenderEffectBinding setRawValue:v91 onBinding:v36->_lightBinding];

  kdebug_trace();
  BOOL v14 = [(NSMutableDictionary *)v36->_activeReactions count] != 0;

  id v6 = v99;
LABEL_95:

  return v14;
}

- (NSArray)reactionTemplates
{
  return (NSArray *)objc_getProperty(self, a2, 368, 1);
}

- (BOOL)emitNewReaction
{
  return self->_emitNewReaction;
}

- (void)setReactionTemplates:(id)a3
{
}

- (unint64_t)rgbaOutputPixelFormat
{
  return self->rgbaOutputPixelFormat;
}

- (unint64_t)depthOutputPixelFormat
{
  return self->depthOutputPixelFormat;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)colorSize
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)((char *)self + 88);
  return self;
}

- (void)removeEffectBindingWithKey:(id)a3
{
  effectBindings = self->_effectBindings;
  id v5 = a3;
  id v10 = [(NSMutableDictionary *)effectBindings objectForKey:v5];
  id v6 = [v10 effect];

  if (v6)
  {
    double v7 = [(VFXRenderer *)self->_vfxRenderer scene];
    double v8 = [v10 effect];
    [v7 removeEffect:v8];

    BOOL v9 = [(VFXRenderer *)self->_vfxRenderer scene];
    [v9 clearCaches];

    [v10 setEffect:0];
  }
  [(NSMutableDictionary *)self->_effectBindings removeObjectForKey:v5];
  [(NSMutableDictionary *)self->_activeReactions removeObjectForKey:v5];
}

- (BOOL)useSoftAlphaMask:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 5;
}

- (BOOL)computeSoftAlphaMask
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v3 = [(NSMutableDictionary *)self->_effectBindings allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (-[PTVFXRenderEffect useSoftAlphaMask:](self, "useSoftAlphaMask:", [*(id *)(*((void *)&v10 + 1) + 8 * i) effectType]))
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (void)updateCameraProjection
{
  self->_float dimmingFactor = 0.0;
  [(PTVFXRenderEffect *)self removeAllActiveReactions];
  *(float *)&double v3 = (float)self->_colorSizeROI.width / (float)self->_colorSizeROI.height;
  LODWORD(v4) = 1055994548;
  +[PTUtil perspectiveProjectionFieldOfView:self->reverseZ aspectRatio:v4 depthNearFar:v3 reverseZ:*(double *)self->depthNearFar];
  float32x4_t v9 = v5;
  unsigned int cameraRotationDegrees = self->_cameraRotationDegrees;
  switch(cameraRotationDegrees)
  {
    case 0x10Eu:
      uint64_t v12 = 0;
      long long v15 = xmmword_1D081F9F0;
      long long v16 = xmmword_1D081FA00;
      long long v17 = xmmword_1D081FA10;
      long long v18 = xmmword_1D081FA20;
      float32x4_t v19 = 0u;
      float32x4_t v20 = 0u;
      float32x4_t v21 = 0u;
      float32x4_t v22 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v19 + v12) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*(long long *)((char *)&v15 + v12))), v6, *(float32x2_t *)((char *)&v15 + v12), 1), v7, *(float32x4_t *)((char *)&v15 + v12), 2), v8, *(float32x4_t *)((char *)&v15 + v12), 3);
        v12 += 16;
      }
      while (v12 != 64);
      goto LABEL_12;
    case 0xB4u:
      uint64_t v13 = 0;
      long long v15 = xmmword_1D081FA30;
      long long v16 = xmmword_1D081F9F0;
      long long v17 = xmmword_1D081FA10;
      long long v18 = xmmword_1D081FA20;
      float32x4_t v19 = 0u;
      float32x4_t v20 = 0u;
      float32x4_t v21 = 0u;
      float32x4_t v22 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v19 + v13) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*(long long *)((char *)&v15 + v13))), v6, *(float32x2_t *)((char *)&v15 + v13), 1), v7, *(float32x4_t *)((char *)&v15 + v13), 2), v8, *(float32x4_t *)((char *)&v15 + v13), 3);
        v13 += 16;
      }
      while (v13 != 64);
      goto LABEL_12;
    case 0x5Au:
      uint64_t v11 = 0;
      long long v15 = xmmword_1D081FA40;
      long long v16 = xmmword_1D081FA30;
      long long v17 = xmmword_1D081FA10;
      long long v18 = xmmword_1D081FA20;
      float32x4_t v19 = 0u;
      float32x4_t v20 = 0u;
      float32x4_t v21 = 0u;
      float32x4_t v22 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v19 + v11) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*(long long *)((char *)&v15 + v11))), v6, *(float32x2_t *)((char *)&v15 + v11), 1), v7, *(float32x4_t *)((char *)&v15 + v11), 2), v8, *(float32x4_t *)((char *)&v15 + v11), 3);
        v11 += 16;
      }
      while (v11 != 64);
LABEL_12:
      float32x4_t v9 = v19;
      float32x4_t v6 = v20;
      float32x4_t v7 = v21;
      float32x4_t v8 = v22;
      break;
  }
  -[_TtC3VFX9VFXCamera setProjection:](self->_camera, "setProjection:", *(double *)v9.i64, *(_OWORD *)&v9, *(_OWORD *)&v6, *(_OWORD *)&v7, *(_OWORD *)&v8, v15, v16, v17, v18);
  *(simd_float4x4 *)self->_anon_b0 = __invert_f4(v14);
}

- (id)addNewEffectFromEvent:(id)a3 renderRequest:(id)a4 time:(double)a5 presenterOverlaySmall:(BOOL)a6
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  BOOL v114 = a6;
  uint64_t v12 = objc_opt_new();
  [v12 setStartTime:a5];
  unint64_t v13 = [v10 effectType];
  unint64_t v14 = v13 % [(NSArray *)self->_reactionTemplates count];
  [v12 setEffectType:v14];
  objc_msgSend(v12, "setUiTriggeredReaction:", objc_msgSend(v10, "uiTriggeredReaction"));
  activeReactions = self->_activeReactions;
  uint64_t v100 = v10;
  long long v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "triggerID"));
  [(NSMutableDictionary *)activeReactions setObject:v12 forKeyedSubscript:v16];

  long long v17 = [[PTVFXRenderEffectBinding alloc] initWithHumanDetections:self->_humanDetections];
  long long v18 = [(VFXRenderer *)self->_vfxRenderer scene];
  float32x4_t v19 = [(NSArray *)self->_reactionTemplates objectAtIndexedSubscript:v14];
  float32x4_t v20 = [v18 addEffectFromTemplate:v19];
  [(PTVFXRenderEffectBinding *)v17 setEffect:v20];

  v102 = v17;
  float32x4_t v21 = [(PTVFXRenderEffectBinding *)v17 effect];
  if (!v21)
  {
    float32x4_t v22 = _PTLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[PTVFXRenderEffect addNewEffectFromEvent:renderRequest:time:presenterOverlaySmall:].cold.7(v14, v22);
    }
  }
  if ([(PTVFXRenderEffect *)self useSoftAlphaMask:v14])
  {
    uint64_t v23 = [v21 fetchClientTextureIDWithNamed:@"texAlpha"];
    v24 = [(PTVFXSoftAlphaMask *)self->_softAlphaMask lazyInstantiateAlphaMaskForRenderRequest:v11];
    [v21 setClientTextureWithId:v23 texture:v24];
  }
  [(PTVFXRenderEffectBinding *)v17 setEffectType:v14];
  v98 = v12;
  v99 = v11;
  switch(v14)
  {
    case 0uLL:
      unsigned int cameraRotationDegrees = self->_cameraRotationDegrees;
      if (cameraRotationDegrees == 180 || !cameraRotationDegrees)
      {
        LODWORD(v25) = 1083388723;
        goto LABEL_37;
      }
      _ZF = self->_aspectRatio == 2;
      LODWORD(v25) = 1084437299;
      float v48 = 5.0;
      goto LABEL_35;
    case 1uLL:
    case 2uLL:
      v26 = [v21 bindingOf:@"Emitter" named:@"left"];
      if (v26)
      {
        buf[0] = [v100 orientation] == 0;
        double v27 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:1];
        +[PTVFXRenderEffectBinding setRawValue:v27 onBinding:v26];
      }
      unint64_t v28 = [v21 bindingOf:@"Emitter" named:@"up"];
      if (v28)
      {
        buf[0] = v14 == 1;
        int v29 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:1];
        +[PTVFXRenderEffectBinding setRawValue:v29 onBinding:v28];
      }
      goto LABEL_16;
    case 3uLL:
      unsigned int v40 = self->_cameraRotationDegrees;
      if (v40 != 180 && v40) {
        LODWORD(v25) = dword_1D081F9A8[self->_aspectRatio == 2];
      }
      else {
        LODWORD(v25) = 1082340147;
      }
      goto LABEL_37;
    case 4uLL:
    case 7uLL:
      int v30 = v17;
      float v31 = v17;
      uint64_t v32 = 1;
      goto LABEL_24;
    case 5uLL:
      int v30 = v17;
      float v31 = v17;
      uint64_t v32 = 0;
LABEL_24:
      [(PTVFXRenderEffectBinding *)v31 setUseBackgroundDimming:v32];
      break;
    case 6uLL:
      uint64_t v41 = [v21 bindingOf:@"Emitter" named:@"position"];
      [(PTVFXRenderEffectBinding *)v17 setPositionBinding:v41];

      uint64_t v42 = [(PTVFXRenderEffectBinding *)v17 positionBinding];

      if (!v42)
      {
        uint64_t v43 = _PTLogSystem();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          -[PTVFXRenderEffect addNewEffectFromEvent:renderRequest:time:presenterOverlaySmall:].cold.6(v43, v44, v45);
        }
      }
      unsigned int v46 = self->_cameraRotationDegrees;
      if (v46 != 180 && v46)
      {
        _ZF = self->_aspectRatio == 2;
        LODWORD(v25) = 1087163597;
        float v48 = 6.0;
LABEL_35:
        if (_ZF) {
          *(float *)&double v25 = v48;
        }
      }
      else
      {
        LODWORD(v25) = 1084647014;
      }
LABEL_37:
      int v30 = v17;
      [(PTVFXRenderEffectBinding *)v17 setDuration:v25];
      break;
    default:
      v26 = _PTLogSystem();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[PTVFXRenderEffect addNewEffectFromEvent:renderRequest:time:presenterOverlaySmall:].cold.5(v14, v26, v33, v34, v35, v36, v37, v38);
      }
LABEL_16:

      int v30 = v17;
      break;
  }
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  int v97 = v21;
  uint64_t v49 = [v21 bindings];
  uint64_t v50 = [v49 countByEnumeratingWithState:&v110 objects:v121 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    BOOL v95 = &v119;
    uint64_t v52 = *(void *)v111;
    __asm { FMOV            V0.2S, #1.0 }
    uint64_t v96 = _D0;
    int32x2_t v57 = vdup_n_s32(0x7F7FFFFFu);
    do
    {
      uint64_t v58 = 0;
      do
      {
        if (*(void *)v111 != v52) {
          objc_enumerationMutation(v49);
        }
        id v59 = *(void **)(*((void *)&v110 + 1) + 8 * v58);
        v60 = objc_msgSend(v59, "bindingName", v95);
        if ([v60 isEqualToString:@"headPosition"])
        {
          [(PTVFXRenderEffectBinding *)v30 setHeadPositionBinding:v59];
          goto LABEL_61;
        }
        if ([v60 isEqualToString:@"seed"])
        {
          *(_DWORD *)buf = 0;
          int v61 = kVFXRandomizationSeed;
          if (kVFXRandomizationSeed == -1) {
            int v61 = mach_absolute_time();
          }
          *(_DWORD *)buf = v61;
          v62 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:4];
          +[PTVFXRenderEffectBinding setRawValue:v62 onBinding:v59];

          goto LABEL_60;
        }
        if ([v60 isEqualToString:@"orientation"])
        {
          v63 = (void *)MEMORY[0x1E4F1C9B8];
          p_unsigned int cameraRotationDegrees = (float32x2_t *)&self->_cameraRotationDegrees;
LABEL_56:
          uint64_t v66 = 4;
          goto LABEL_57;
        }
        if ([v60 isEqualToString:@"aspectRatio"])
        {
          if (self->_aspectRatio == 2) {
            int v65 = 4;
          }
          else {
            int v65 = 9;
          }
          *(_DWORD *)buf = v65;
          v63 = (void *)MEMORY[0x1E4F1C9B8];
          p_unsigned int cameraRotationDegrees = (float32x2_t *)buf;
          goto LABEL_56;
        }
        if ([v60 isEqualToString:@"opacity"])
        {
          uint64_t v69 = [(PTVFXRenderEffectBinding *)v30 opacityValue];

          if (!v69)
          {
            *(_DWORD *)buf = 1065353216;
            v70 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:4];
            [(PTVFXRenderEffectBinding *)v30 setOpacityValue:v70];

            v71 = objc_opt_new();
            [(PTVFXRenderEffectBinding *)v30 setOpacityBindings:v71];
          }
          uint64_t v72 = [(PTVFXRenderEffectBinding *)v30 opacityBindings];
          [v72 addObject:v59];

          uint64_t v67 = [(PTVFXRenderEffectBinding *)v30 opacityValue];
          goto LABEL_58;
        }
        if ([v60 isEqualToString:@"duration"])
        {
          uint64_t v73 = [(PTVFXRenderEffectBinding *)v30 durationBinding];

          if (v73)
          {
            int v74 = _PTLogSystem();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
              -[PTVFXRenderEffect addNewEffectFromEvent:renderRequest:time:presenterOverlaySmall:](&v108, v109, v74);
            }
          }
          uint64_t v68 = [v59 rawValue];
          if ([v68 length] == 4)
          {
            [(PTVFXRenderEffectBinding *)v102 setDurationBinding:v59];
          }
          else
          {
            uint64_t v75 = _PTLogSystem();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
              -[PTVFXRenderEffect addNewEffectFromEvent:renderRequest:time:presenterOverlaySmall:]((uint64_t)v120, v68);
            }
          }
          goto LABEL_59;
        }
        if ([v60 isEqualToString:@"gestureTrigger"])
        {
          buf[0] = 0;
          buf[0] = [v100 uiTriggeredReaction] ^ 1;
          v63 = (void *)MEMORY[0x1E4F1C9B8];
          p_unsigned int cameraRotationDegrees = (float32x2_t *)buf;
LABEL_76:
          uint64_t v66 = 1;
          goto LABEL_57;
        }
        if ([v60 isEqualToString:@"backgroundDimming"])
        {
          float v103 = [v59 rawValue];
          v76 = [(PTVFXRenderEffectBinding *)v30 backgroundDimmingBinding];

          if (v76)
          {
            uint64_t v77 = _PTLogSystem();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
              -[PTVFXRenderEffect addNewEffectFromEvent:renderRequest:time:presenterOverlaySmall:].cold.4(&v106, v107, v77);
            }

            int v30 = v102;
          }
          if ([v103 length] == 4)
          {
            [(PTVFXRenderEffectBinding *)v30 setBackgroundDimmingBinding:v59];
          }
          else
          {
            v78 = _PTLogSystem();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
              -[PTVFXRenderEffect addNewEffectFromEvent:renderRequest:time:presenterOverlaySmall:]((uint64_t)v118, v103);
            }
          }
        }
        else
        {
          if ([v60 isEqualToString:@"bilbyFloating"])
          {
            v63 = (void *)MEMORY[0x1E4F1C9B8];
            p_unsigned int cameraRotationDegrees = (float32x2_t *)&v114;
            goto LABEL_76;
          }
          if ([v60 isEqualToString:@"viewportScale"])
          {
            unint64_t width = self->_colorSizeROI.width;
            unint64_t height = self->_colorSizeROI.height;
            HIDWORD(v81) = HIDWORD(v96);
            LODWORD(v82) = v96;
            if (width > height)
            {
              *(float *)&uint64_t v81 = (float)width / (float)height;
              uint64_t v83 = v81;
            }
            else
            {
              *((float *)&v82 + 1) = (float)height / (float)width;
              uint64_t v83 = v82;
            }
            *(void *)buf = v83;
            v63 = (void *)MEMORY[0x1E4F1C9B8];
            p_unsigned int cameraRotationDegrees = (float32x2_t *)buf;
            goto LABEL_106;
          }
          if ([v60 isEqualToString:@"boundsMin"])
          {
            float32x2_t v105 = (float32x2_t)v57;
            float v84 = 0.0;
            char v85 = 1;
            do
            {
              char v101 = v85;
              char v86 = 1;
              double v87 = 0.0;
              float v104 = v84;
              do
              {
                char v88 = v86;
                double v89 = COERCE_DOUBLE(__PAIR64__(LODWORD(v87), LODWORD(v104)));
                LODWORD(v87) = -1.0;
                +[PTEffectUtil screenSpaceToCameraSpace:zValue:inverseProjection:](PTEffectUtil, "screenSpaceToCameraSpace:zValue:inverseProjection:", v89, v87, *(double *)self->_anon_b0, *(double *)&self->_anon_b0[16], *(double *)&self->_anon_b0[32], *(double *)&self->_anon_b0[48]);
                char v86 = 0;
                HIDWORD(v87) = v105.i32[1];
                float32x2_t v105 = vminnm_f32(v90, v105);
                LODWORD(v87) = 1.0;
              }
              while ((v88 & 1) != 0);
              char v85 = 0;
              float v84 = 1.0;
            }
            while ((v101 & 1) != 0);
            v91 = _PTLogSystem();
            if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218240;
              *(double *)&buf[4] = v105.f32[0];
              __int16 v116 = 2048;
              double v117 = v105.f32[1];
              _os_log_impl(&dword_1D0778000, v91, OS_LOG_TYPE_INFO, "boundsMin %f %f ", buf, 0x16u);
            }

            v63 = (void *)MEMORY[0x1E4F1C9B8];
            p_unsigned int cameraRotationDegrees = &v105;
LABEL_106:
            uint64_t v66 = 8;
LABEL_57:
            uint64_t v67 = [v63 dataWithBytes:p_cameraRotationDegrees length:v66];
LABEL_58:
            uint64_t v68 = (void *)v67;
            +[PTVFXRenderEffectBinding setRawValue:v67 onBinding:v59];
LABEL_59:

LABEL_60:
            int v30 = v102;
          }
        }
LABEL_61:

        ++v58;
      }
      while (v58 != v51);
      uint64_t v92 = [v49 countByEnumeratingWithState:&v110 objects:v121 count:16];
      uint64_t v51 = v92;
    }
    while (v92);
  }

  [(PTVFXRenderEffectBinding *)v30 setUseBackgroundDimming:[(PTVFXRenderEffectBinding *)v30 useBackgroundDimming]];
  [(PTVFXRenderEffectBinding *)v30 setCreationTimeSeconds:a5];
  -[PTVFXRenderEffectBinding setInverseCameraProjection:](v30, "setInverseCameraProjection:", *(double *)self->_anon_b0, *(double *)&self->_anon_b0[16], *(double *)&self->_anon_b0[32], *(double *)&self->_anon_b0[48]);
  *(float *)&double v93 = self->_emitZValue;
  [(PTVFXRenderEffectBinding *)v30 setEmitZValue:v93];

  return v30;
}

- (int)maxReactionEffectComplexity
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v3 = [(NSMutableDictionary *)self->_activeReactions keyEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v4)
  {
    int v6 = 0;
    goto LABEL_19;
  }
  uint64_t v5 = v4;
  int v6 = 0;
  uint64_t v7 = *(void *)v14;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v3);
      }
      float32x4_t v9 = [(NSMutableDictionary *)self->_activeReactions objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * v8)];
      unint64_t v10 = [v9 effectType];
      if (v10 > 7) {
        goto LABEL_14;
      }
      if (((1 << v10) & 0xB1) != 0)
      {
        int v6 = 100;
        goto LABEL_9;
      }
      if (v10 == 3)
      {
        if (v6 <= 50) {
          int v6 = 50;
        }
      }
      else
      {
LABEL_14:
        if (v6 <= 25) {
          int v6 = 25;
        }
      }
LABEL_9:

      ++v8;
    }
    while (v5 != v8);
    uint64_t v11 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    uint64_t v5 = v11;
  }
  while (v11);
LABEL_19:

  return v6;
}

- (void)removeAllActiveReactions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(NSMutableDictionary *)self->_effectBindings allKeys];
  uint64_t v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(PTVFXRenderEffect *)self removeEffectBindingWithKey:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (int)render:(id)a3 effectRGBA:(id)a4 effectDepth:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = v9;
  if (a4 && v9)
  {
    [(VFXRenderer *)self->_vfxRenderer setTexture:a4];
    [(VFXRenderer *)self->_vfxRenderer setDepthTexture:v10];
    [(VFXRenderer *)self->_vfxRenderer encodeWithCommandBuffer:v8];
    [(VFXRenderer *)self->_vfxRenderer finalizeEncoding];
    int v11 = 0;
  }
  else
  {
    long long v12 = _PTLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PTVFXRenderEffect render:effectRGBA:effectDepth:](v12, v13, v14);
    }

    int v11 = -10;
  }

  return v11;
}

- (int)renderWithBackgroundDimming:(id)a3 effectRGBA:(id)a4 inCenteredDisparity:(id)a5 inSegmentation:(id)a6 effectDepth:(id)a7 disparityFiltered:(id)a8 focusDisparityModifiers:(id)a9 renderRequest:(id)a10 debugType:(int64_t)a11
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v67 = a9;
  id v23 = a10;
  uint64_t v24 = [v23 outColorBuffer];
  uint64_t v73 = [v23 inBilbyAlphaMaskTexture];
  [v23 inReactionVideoRect];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  [v23 outColorROI];
  float64_t v68 = v34;
  float64_t v69 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  if ([(PTVFXRenderEffect *)self computeSoftAlphaMask])
  {
    softAlphaMasuint64_t k = self->_softAlphaMask;
    if (v20) {
      [(PTVFXSoftAlphaMask *)softAlphaMask updateSoftAlphaMask:v17 inSegmentation:v20 effectRenderRequest:v23];
    }
    else {
      [(PTVFXSoftAlphaMask *)softAlphaMask updateSoftAlphaMask:v17 inDisparity:v22 focusDisparityModifiers:v67 effectRenderRequest:v23];
    }
  }
  int v65 = v22;
  id v71 = v21;
  unsigned int v40 = [(PTMetalContext *)self->_metalContext device];
  uint64_t v41 = +[PTTexture createFromPixelbuffer:v24 device:v40 read:1 write:1];

  if (v73)
  {
    self->_float dimmingFactor = 0.0;
    double v42 = 0.0;
  }
  else
  {
    *(float *)&double v42 = self->_dimmingFactor;
  }
  uint64_t v43 = v71;
  int v64 = -[PTEffectReactionBackgroundDimming backgroundDimAndConvertRGBLinearFromPTTexture:inPTTexture:inCenteredDisparity:inSegmentation:outRGBA:dimmingFactor:disparityRemapping:outColorROI:](self->_reactionBackground, "backgroundDimAndConvertRGBLinearFromPTTexture:inPTTexture:inCenteredDisparity:inSegmentation:outRGBA:dimmingFactor:disparityRemapping:outColorROI:", v17, v41, v19, v20, v18, v42, v26, v28, v30, v32, *(void *)&v69, *(void *)&v68, v36, v38);
  int v63 = [(PTVFXRenderEffect *)self render:v17 effectRGBA:v18 effectDepth:v71];
  int v44 = [v41 isRGB];
  uint64_t v66 = v20;
  if (v73 && v44)
  {
    id v70 = v19;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    uint64_t v45 = [(NSMutableDictionary *)self->_effectBindings allValues];
    uint64_t v46 = [v45 countByEnumeratingWithState:&v74 objects:v78 count:16];
    if (v46)
    {
      int v47 = 0;
      uint64_t v48 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v75 != v48) {
            objc_enumerationMutation(v45);
          }
          v47 |= [*(id *)(*((void *)&v74 + 1) + 8 * i) useCircularGradient];
        }
        uint64_t v46 = [v45 countByEnumeratingWithState:&v74 objects:v78 count:16];
      }
      while (v46);

      if (v47) {
        uint64_t v46 = (uint64_t)v73;
      }
      else {
        uint64_t v46 = 0;
      }
    }
    else
    {
    }
    id v59 = v41;
    v60 = [v59 texRGBA];
    int v61 = [v59 transferFunction];

    int v58 = [(PTVFXRenderEffect *)self convertRGB:v17 inRGBA:v18 inAlphaMask:v46 outRGBA:v60 toLinear:0 transferFunction:v61];
    id v19 = v70;
    uint64_t v43 = v71;
  }
  else
  {
    uint64_t v50 = [v41 width];
    uint64_t v51 = [v41 height];
    v52.i64[0] = v50;
    v52.i64[1] = v51;
    v53.f64[0] = v69;
    v53.f64[1] = v68;
    int32x2_t v72 = vcvt_s32_f32(vrnda_f32(vcvt_f32_f64(vmulq_f64(v53, vcvtq_f64_u64(v52)))));
    colorConversion = self->_colorConversion;
    __int16 v55 = [v18 width];
    __int16 v56 = [v18 height];
    LOWORD(v57) = v72.i16[0];
    WORD1(v57) = v72.i16[2];
    WORD2(v57) = v55;
    HIWORD(v57) = v56;
    int v58 = [(PTColorConversion *)colorConversion convertRGBLinearToPTTexture:v17 inRGBA:v18 outPTTexture:v41 outRect:v57];
  }

  return v63 | v64 | v58;
}

- (int)convertRGB:(id)a3 inRGBA:(id)a4 inAlphaMask:(id)a5 outRGBA:(id)a6 toLinear:(BOOL)a7 transferFunction:(id)a8
{
  BOOL v9 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  int v18 = +[PTColorConversion getTransferFunction:a8 toLinear:v9];
  id v19 = [[PTImageblockConfig alloc] initWithTexture:v14];
  id v20 = [v17 computeCommandEncoder];

  if (!v20)
  {
    id v21 = _PTLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v21, v22, v23, v24, v25, v26, v27, v28);
    }
  }
  [v20 setComputePipelineState:self->_convertRGBAlpha[v18]];
  objc_msgSend(v20, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v19, "imageblockSize"), -[PTImageblockConfig imageblockSize](v19, "imageblockSize"));
  [v20 setTexture:v16 atIndex:0];

  [v20 setTexture:v15 atIndex:1];
  [v20 setTexture:v14 atIndex:2];
  if (v19)
  {
    [(PTImageblockConfig *)v19 threads];
    [(PTImageblockConfig *)v19 threadsPerGroup];
  }
  else
  {
    memset(v31, 0, sizeof(v31));
    memset(v30, 0, sizeof(v30));
  }
  [v20 dispatchThreads:v31 threadsPerThreadgroup:v30];
  [v20 endEncoding];

  return 0;
}

+ (void)setRandomizationSeed:(int)a3
{
  kVFXRandomizationSeed = a3;
}

- (float)dimmingFactor
{
  return self->_dimmingFactor;
}

+ (uint64_t)transformVideoPositionToCropCoordinates:(uint64_t)a3 effectRenderRequest:(uint64_t)a4 flipYAxis:(char)a5
{
  if (a5) {
    *((float *)&a2 + 1) = 1.0 - *((float *)&a2 + 1);
  }
  return objc_msgSend(a1, "transformVideoRectToCropCoordinates:effectRenderRequest:", a2);
}

+ (uint64_t)transformVideoRectToCropCoordinates:(uint64_t)a3 effectRenderRequest:(void *)a4
{
  [a4 reactionsCombinedCropRect];

  return +[PTEffectUtil transformRect:a1 intoCropCoordinates:v4];
}

- (double)depthNearFar
{
  return *(double *)(a1 + 360);
}

- (void)setDepthNearFar:(PTVFXRenderEffect *)self
{
  *(void *)self->depthNearFar = v2;
}

- (BOOL)reverseZ
{
  return self->reverseZ;
}

- (void)setReverseZ:(BOOL)a3
{
  self->reverseZ = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reactionTemplates, 0);
  for (uint64_t i = 0; i != -9; --i)
    objc_storeStrong((id *)&self->_convertRGBAlpha[i + 8], 0);
  objc_storeStrong((id *)&self->_activeReactions, 0);
  objc_storeStrong((id *)&self->_effectBindings, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_vfxRenderer, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_util, 0);
  objc_storeStrong((id *)&self->_softAlphaMask, 0);
  objc_storeStrong((id *)&self->_lightBinding, 0);
  objc_storeStrong((id *)&self->_lighting, 0);
  objc_storeStrong((id *)&self->_humanDetections, 0);
  objc_storeStrong((id *)&self->_reactionBackground, 0);
  objc_storeStrong((id *)&self->_colorConversion, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 colorConversion:(uint64_t)a5 prewarmOnly:(uint64_t)a6 humanDetections:(uint64_t)a7 asyncInitQueue:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 colorConversion:(uint64_t)a5 prewarmOnly:(uint64_t)a6 humanDetections:(uint64_t)a7 asyncInitQueue:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initVFX:(uint64_t)a3 asyncInitQueue:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initVFX:(id *)a1 asyncInitQueue:(NSObject *)a2 .cold.2(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  double v3 = [*a1 cameras];
  v4[0] = 67109120;
  v4[1] = [v3 count];
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Expected 1 camera was %i", (uint8_t *)v4, 8u);
}

- (void)initVFX:(os_log_t)log asyncInitQueue:.cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "addEffectFrom %@ error %@", (uint8_t *)&v3, 0x16u);
}

- (void)addNewEffectFromEvent:(uint64_t)a1 renderRequest:(void *)a2 time:presenterOverlaySmall:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_2_0(a1, a2);
  *int v3 = 134217984;
  uint64_t *v2 = v4;
  OUTLINED_FUNCTION_1_0(&dword_1D0778000, v5, v6, "Unexpected length of duration: %lu");
}

- (void)addNewEffectFromEvent:(NSObject *)a3 renderRequest:time:presenterOverlaySmall:.cold.2(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3_0(&dword_1D0778000, a3, (uint64_t)a3, "Multiple duration bindings found", a1);
}

- (void)addNewEffectFromEvent:(uint64_t)a1 renderRequest:(void *)a2 time:presenterOverlaySmall:.cold.3(uint64_t a1, void *a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_2_0(a1, a2);
  *int v3 = 134217984;
  uint64_t *v2 = v4;
  OUTLINED_FUNCTION_1_0(&dword_1D0778000, v5, v6, "Unexpected length of backgroundDimming: %lu");
}

- (void)addNewEffectFromEvent:(NSObject *)a3 renderRequest:time:presenterOverlaySmall:.cold.4(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3_0(&dword_1D0778000, a3, (uint64_t)a3, "Already bound", a1);
}

- (void)addNewEffectFromEvent:(uint64_t)a3 renderRequest:(uint64_t)a4 time:(uint64_t)a5 presenterOverlaySmall:(uint64_t)a6 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addNewEffectFromEvent:(uint64_t)a3 renderRequest:time:presenterOverlaySmall:.cold.6(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)int v3 = 0;
  OUTLINED_FUNCTION_3_0(&dword_1D0778000, a1, a3, "Position binding not found", v3);
}

- (void)addNewEffectFromEvent:(int)a1 renderRequest:(NSObject *)a2 time:presenterOverlaySmall:.cold.7(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Cannot create effect %i", (uint8_t *)v2, 8u);
}

- (void)updateWithRenderRequest:(uint64_t)a3 lastFrameTime:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)render:(NSObject *)a1 effectRGBA:(uint64_t)a2 effectDepth:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  OUTLINED_FUNCTION_3_0(&dword_1D0778000, a1, a3, "tex is nil", v3);
}

@end