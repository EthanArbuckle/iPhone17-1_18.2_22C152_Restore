@interface PTEffectRenderer
+ (BOOL)useStudioLightFromSegmentation:(id)a3;
+ (PTEffectPixelBufferDescriptor)segmentationMatteFormatForColorSize:(SEL)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)lowResDisparitySizeFromEffectDescriptor;
- (BOOL)isRenderRequiredForRequest:(id)a3;
- (PTEffectRenderer)initWithDescriptor:(id)a3 metalContext:(id)a4 useHighResNetwork:(BOOL)a5 faceAttributesNetwork:(id)a6 humanDetections:(id)a7 prevTemporalState:(id)a8 asyncInitQueue:(id)a9 sharedResources:(id)a10;
- (id)activeReactions;
- (id)copyTemporalState:(id)a3;
- (int)render:(id)a3 waitUntilCompleted:(BOOL)a4 gpuCompleted:(id)a5;
- (int)renderReaction:(id)a3 effectRenderRequest:(id)a4;
- (int)runGestureDetection:(id)a3 asyncWork:(id)a4;
- (int64_t)effectQuality;
- (void)copyInYUV:(id)a3 toOutYUV:(id)a4;
- (void)createVfxTextures:(id *)a3;
- (void)dealloc;
- (void)removeAllActiveReactions;
- (void)reset:(id)a3;
- (void)setDebug:(int64_t)a3;
- (void)setEffectQuality:(int64_t)a3;
@end

@implementation PTEffectRenderer

- (void)createVfxTextures:(id *)a3
{
  objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", -[PTVFXRenderEffect rgbaOutputPixelFormat](self->_vfxEffect, "rgbaOutputPixelFormat"), a3->var0, a3->var1, 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v12 setUsage:7];
  [v12 setStorageMode:0];
  v5 = [(PTMetalContext *)self->_metalContext device];
  v6 = (MTLTexture *)[v5 newTextureWithDescriptor:v12];
  vfxRenderTarget = self->_vfxRenderTarget;
  self->_vfxRenderTarget = v6;

  v8 = objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", -[PTVFXRenderEffect depthOutputPixelFormat](self->_vfxEffect, "depthOutputPixelFormat"), a3->var0, a3->var1, 0);
  [v8 setUsage:7];
  [v8 setStorageMode:0];
  v9 = [(PTMetalContext *)self->_metalContext device];
  v10 = (MTLTexture *)[v9 newTextureWithDescriptor:v8];
  vfxDepthBuffer = self->_vfxDepthBuffer;
  self->_vfxDepthBuffer = v10;
}

- (void)setEffectQuality:(int64_t)a3
{
  self->effectQuality = a3;
}

- (BOOL)isRenderRequiredForRequest:(id)a3
{
  id v4 = a3;
  char v5 = [v4 effectType];
  if (self->_frameIndex) {
    BOOL v6 = (v5 & 0x4F) == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6) {
    goto LABEL_7;
  }
  char v7 = v5;
  if (-[PTBackgroundReplacement updateAndGetBackgroundState:frameIndex:](self->_backgroundReplacement, "updateAndGetBackgroundState:frameIndex:", v4))
  {
    goto LABEL_7;
  }
  if ((v7 & 0x10) != 0)
  {
    id v12 = [(PTVFXRenderEffect *)self->_vfxEffect activeReactions];
    if ([v12 count])
    {

      goto LABEL_7;
    }
    v16 = [v4 reactions];
    uint64_t v17 = [v16 count];

    if (v17) {
      goto LABEL_7;
    }
  }
  [v4 frameTimeSeconds];
  if ((v7 & 0x20) == 0)
  {
LABEL_11:
    [v4 frameTimeSeconds];
    BOOL v8 = 0;
    self->_lastFrameTime = v11;
    *(_WORD *)&self->_runCVMNetworkPreviousFrame = 0;
    self->_networkFrameIndex = 0;
    goto LABEL_8;
  }
  reactionProvider = self->_reactionProvider;
  if (reactionProvider)
  {
    double v14 = v10;
    v15 = [(PTEffectReactionProvider *)reactionProvider latestReactions];
    if ([v15 count])
    {
    }
    else
    {
      v18 = self->_reactionProvider;
      v20[0] = (uint64_t)(v14 * 100000.0);
      v20[1] = 0x1000186A0;
      v20[2] = 0;
      BOOL v19 = [(PTEffectReactionProvider *)v18 runGestureDetectionForTimeStamp:v20];

      if (!v19) {
        goto LABEL_11;
      }
    }
  }
LABEL_7:
  BOOL v8 = 1;
LABEL_8:

  return v8;
}

- (PTEffectRenderer)initWithDescriptor:(id)a3 metalContext:(id)a4 useHighResNetwork:(BOOL)a5 faceAttributesNetwork:(id)a6 humanDetections:(id)a7 prevTemporalState:(id)a8 asyncInitQueue:(id)a9 sharedResources:(id)a10
{
  BOOL v482 = a5;
  v513[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v486 = a7;
  id v488 = a8;
  id v487 = a9;
  id v489 = a10;
  v502.receiver = self;
  v502.super_class = (Class)PTEffectRenderer;
  v18 = [(PTEffectRenderer *)&v502 init];
  v490 = v18;
  if (!v18)
  {
    v28 = 0;
    v29 = v486;
    v30 = v488;
    v31 = v489;
    goto LABEL_65;
  }
  BOOL v19 = v18;
  id v484 = v17;
  id v485 = v16;
  PTKTraceInit();
  kdebug_trace();
  p_metalContext = (id *)&v19->_metalContext;
  objc_storeStrong((id *)&v19->_metalContext, a4);
  uint64_t v21 = [v15 copy];
  effectDescriptor = v19->_effectDescriptor;
  v19->_effectDescriptor = (PTEffectDescriptor *)v21;

  v19->_debugType = 0;
  v19->_unint64_t availableEffectTypes = [v15 availableEffectTypes];
  objc_storeStrong((id *)&v19->_sharedResources, a10);
  objc_storeStrong((id *)&v19->_asyncInitQueue, a9);
  objc_storeStrong((id *)&v19->_humanDetections, a7);
  CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v512 = *MEMORY[0x1E4F24C78];
  v513[0] = &unk_1F26C11B8;
  CFDictionaryRef v24 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v513 forKeys:&v512 count:1];
  v25 = [(PTMetalContext *)v19->_metalContext device];
  p_textureCache = &v19->_textureCache;
  LODWORD(v23) = CVMetalTextureCacheCreate(v23, v24, v25, 0, &v19->_textureCache);

  if (v23 || !*p_textureCache)
  {
    v27 = _PTLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]9();
    }

    *p_textureCache = 0;
  }
  v19->effectQuality = [v15 effectQuality];
  unint64_t availableEffectTypes = v19->_availableEffectTypes;
  unint64_t v476 = availableEffectTypes & 0x48;
  char v477 = availableEffectTypes;
  if ((availableEffectTypes & 3) != 0)
  {
    unsigned int v33 = 1;
  }
  else
  {
    BOOL v34 = (availableEffectTypes & 0x40) == 0;
    if ((availableEffectTypes & 4) != 0 && (availableEffectTypes & 0x48) != 0) {
      BOOL v34 = 0;
    }
    unsigned int v33 = v34 & (availableEffectTypes >> 4);
  }
  unsigned int v478 = v33;
  v19->_BOOL studiolightFromSegmentation = +[PTEffectRenderer useStudioLightFromSegmentation:v15];
  v19->_frameIndex = 0;
  *(_WORD *)&v19->_runCVMNetworkPreviousFrame = 0;
  v19->_lastFrameTime = NAN;
  dispatch_queue_t v36 = dispatch_queue_create("com.apple.portrait.async_queue", 0);
  asyncQueue = v19->_asyncQueue;
  v19->_asyncQueue = (OS_dispatch_queue *)v36;

  [v15 colorSize];
  unint64_t v39 = (unint64_t)v38;
  v483 = v15;
  [v15 colorSize];
  uint64_t v40 = 0;
  unint64_t v41 = v39 >> 1;
  unint64_t v491 = (unint64_t)v42;
  unint64_t v492 = v39;
  unint64_t v43 = (unint64_t)v42 >> 1;
  intermediateYUV = v19->_intermediateYUV;
  char v45 = 1;
  do
  {
    char v46 = v45;
    v47 = [*p_metalContext textureUtil];
    v48 = [v47 createWithWidth:v492 height:v491 pixelFormat:10];

    if (!v48)
    {
      v48 = _PTLogSystem();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:](v48, v82, v83, v84, v85, v86, v87, v88);
      }
      v28 = 0;
      id v15 = v483;
      id v17 = v484;
      id v16 = v485;
      v29 = v486;
      v30 = v488;
      v31 = v489;
      goto LABEL_64;
    }
    v49 = [*p_metalContext textureUtil];
    v50 = [v49 createWithWidth:v41 height:v43 pixelFormat:30];

    if (!v50)
    {
      v89 = _PTLogSystem();
      id v15 = v483;
      id v17 = v484;
      id v16 = v485;
      v29 = v486;
      v30 = v488;
      v31 = v489;
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
        -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:](v89, v90, v91, v92, v93, v94, v95, v96);
      }
      goto LABEL_52;
    }
    uint64_t v51 = +[PTTexture createYUV420:v48 chroma:v50];
    v52 = intermediateYUV[v40];
    intermediateYUV[v40] = (PTTextureYUV *)v51;

    if (!intermediateYUV[v40])
    {
      v89 = _PTLogSystem();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
        -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:](v89, v97, v98, v99, v100, v101, v102, v103);
      }
      id v15 = v483;
      id v17 = v484;
      id v16 = v485;
      v29 = v486;
      v30 = v488;
      v31 = v489;
LABEL_52:

      v28 = 0;
      goto LABEL_64;
    }

    char v45 = 0;
    uint64_t v40 = 1;
  }
  while ((v46 & 1) != 0);
  if (v482) {
    float v53 = 0.175;
  }
  else {
    float v53 = 0.1;
  }
  v490->_focusDisparityMax = 2.0;
  *(void *)&v490->_focusDisparityUpdateCoefficientSDOF = 0x3F0000003E800000;
  v48 = PTDefaultsGetDictionary();
  v490->_disparityFocusOffsetSDOF.disparityOffsetFactor = 0.935;
  *(void *)&v490->_disparityFocusOffsetSDOF.offsetInMeters = 0x3F80000000000000;
  v490->_disparityFocusOffsetReactions.offsetInMeters = v53;
  v490->_disparityFocusOffsetStudioLight = (PTDisparityFocusOffset)0x3E4CCCCD3F800000;
  v54 = [v48 objectForKeyedSubscript:@"PTEffectFocusDisparityMax"];
  v55 = v54;
  id v15 = v483;
  id v16 = v485;
  v30 = v488;
  v31 = v489;
  if (v54)
  {
    [v54 floatValue];
    v490->_focusDisparityMax = v56;
    v57 = _PTLogSystem();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]8(v55);
    }
  }
  v58 = [v48 objectForKeyedSubscript:@"PTEffectFocusDisparityExponentialMovingAverage"];

  if (v58)
  {
    [v58 floatValue];
    v490->_focusDisparityUpdateCoefficientSDOF = v59;
    v60 = _PTLogSystem();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]7(v58);
    }
  }
  v61 = [v48 objectForKeyedSubscript:@"PTEffectFocusDisparityExponentialMovingAverageStudioLight"];

  id v17 = v484;
  if (v61)
  {
    [v61 floatValue];
    v490->_focusDisparityUpdateCoefficientStudioLight = v62;
    v63 = _PTLogSystem();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]6(v61);
    }
  }
  v64 = [(PTMetalContext *)v490->_metalContext device];
  uint64_t v65 = [v64 newBufferWithLength:16 options:0];
  faceDisparityArray = v490->_faceDisparityArray;
  v490->_faceDisparityArray = (MTLBuffer *)v65;

  if (!v490->_faceDisparityArray)
  {
    v104 = _PTLogSystem();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.4(v104, v105, v106, v107, v108, v109, v110, v111);
    }
    goto LABEL_62;
  }
  v67 = [(PTMetalContext *)v490->_metalContext device];
  uint64_t v68 = [v67 newBufferWithLength:4 options:0];
  focusDisparityRaw = v490->_focusDisparityRaw;
  v490->_focusDisparityRaw = (MTLBuffer *)v68;

  if (!v490->_focusDisparityRaw)
  {
    v104 = _PTLogSystem();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.5(v104, v112, v113, v114, v115, v116, v117, v118);
    }
    goto LABEL_62;
  }
  char v501 = 1;
  v70 = [(PTMetalContext *)v490->_metalContext device];
  uint64_t v71 = [v70 newBufferWithBytes:&v501 length:1 options:0];
  useDisparityBufferForReactions = v490->_useDisparityBufferForReactions;
  v490->_useDisparityBufferForReactions = (MTLBuffer *)v71;

  if (!v490->_useDisparityBufferForReactions)
  {
    v119 = _PTLogSystem();
    v29 = v486;
    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.6(v119, v120, v121, v122, v123, v124, v125, v126);
    }
    goto LABEL_59;
  }
  v73 = [[PTEffectUtil alloc] initWithMetalContext:v490->_metalContext];
  effectUtil = v490->_effectUtil;
  v490->_effectUtil = v73;

  if (!v490->_effectUtil)
  {
    v104 = _PTLogSystem();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.7(v104, v127, v128, v129, v130, v131, v132, v133);
    }
    goto LABEL_62;
  }
  v75 = [[PTUtil alloc] initWithMetalContext:v490->_metalContext];
  util = v490->_util;
  v490->_util = v75;

  if (!v490->_util)
  {
    v135 = _PTLogSystem();
    if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR)) {
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.8(v135, v136, v137, v138, v139, v140, v141, v142);
    }
    goto LABEL_143;
  }
  cvmNetwork = v490->_cvmNetwork;
  v490->_cvmNetwork = 0;

  msrColorPyramid = v490->_msrColorPyramid;
  v490->_msrColorPyramid = 0;

  if (![v483 prewarmOnly])
  {
    if (v478)
    {
      v143 = [PTCVMNetwork alloc];
      metalContext = v490->_metalContext;
      v146 = v490->_util;
      v145 = v490->_effectUtil;
      *(void *)&long long v507 = v492;
      *((void *)&v507 + 1) = v491;
      *(void *)&long long v508 = 1;
      uint64_t v147 = [(PTCVMNetwork *)v143 initWithMetalContext:metalContext colorSize:&v507 effectUtil:v145 util:v146 useHighResNetwork:v482 sharedResources:v489];
      v148 = v490->_cvmNetwork;
      v490->_cvmNetwork = (PTCVMNetwork *)v147;

      v149 = v490->_cvmNetwork;
      if (!v149)
      {
        v135 = _PTLogSystem();
        if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR)) {
          -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]2(v135, v175, v176, v177, v178, v179, v180, v181);
        }
        goto LABEL_143;
      }
      v475 = v61;
      v150 = [(PTCVMNetwork *)v149 outDisparity];
      uint64_t v151 = [v150 width];
      v152 = [(PTCVMNetwork *)v490->_cvmNetwork outDisparity];
      unint64_t v80 = [v152 height];

      if (!v151 || !v80)
      {
        v153 = _PTLogSystem();
        if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR)) {
          -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]4();
        }

        uint64_t v151 = 320;
        unint64_t v80 = 176;
      }
      v154 = [PTMSRResize alloc];
      v155 = v490->_metalContext;
      uint64_t v156 = [(PTCVMNetwork *)v490->_cvmNetwork rotated];
      *(void *)&long long v507 = v492;
      *((void *)&v507 + 1) = v491;
      *(void *)&long long v508 = 1;
      *(void *)&long long v499 = v151;
      *((void *)&v499 + 1) = v80;
      uint64_t v500 = 1;
      uint64_t v157 = [(PTMSRResize *)v154 initWithMetalContext:v155 inputSize:&v507 targetSize:&v499 rotateTargetPixelBuffer:v156 sRGB:0 sharedResources:v489];
      v158 = v490->_msrColorPyramid;
      v490->_msrColorPyramid = (PTMSRResize *)v157;

      v159 = v490->_msrColorPyramid;
      if (!v159)
      {
        v307 = _PTLogSystem();
        if (os_log_type_enabled(v307, OS_LOG_TYPE_ERROR)) {
          -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]3(v307, v308, v309, v310, v311, v312, v313, v314);
        }

        v28 = 0;
        id v17 = v484;
        id v16 = v485;
        goto LABEL_167;
      }
      unint64_t v474 = v151;
      [(PTCVMNetwork *)v490->_cvmNetwork bindColorInputPixelBuffer:[(PTMSRResize *)v159 targetRGBAPixelBuffer]];
      uint64_t v81 = 1;
      id v17 = v484;
    }
    else
    {
      if (v476)
      {
        [v483 colorSize];
        +[PTEffectPersonSegmentation segmentationSizeForColorSize:](PTEffectPersonSegmentation, "segmentationSizeForColorSize:");
        double v161 = v160;
        double v163 = v162;
        v164 = [PTMSRResize alloc];
        v165 = v490->_metalContext;
        v498[0] = (unint64_t)v161;
        v498[1] = (unint64_t)v163;
        v498[2] = 1;
        *(void *)&long long v507 = v492;
        *((void *)&v507 + 1) = v491;
        *(void *)&long long v508 = 1;
        uint64_t v166 = [(PTMSRResize *)v164 initWithMetalContext:v165 inputSize:&v507 targetSize:v498 rotateTargetPixelBuffer:0 sRGB:0 sharedResources:v489];
        v167 = v490->_msrColorPyramid;
        v490->_msrColorPyramid = (PTMSRResize *)v166;

        if (!v490->_msrColorPyramid)
        {
          v135 = _PTLogSystem();
          if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR)) {
            -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]3(v135, v315, v316, v317, v318, v319, v320, v321);
          }
          goto LABEL_143;
        }
        unint64_t v474 = 0;
        v475 = v61;
        uint64_t v81 = 0;
        unint64_t v80 = 0;
LABEL_88:
        unint64_t v186 = v492;
        if (v492 >= v491) {
          unint64_t v186 = v491;
        }
        float v187 = 2.0;
        if (v186 > 0x2CF) {
          float v187 = 3.0;
        }
        if (v186 <= 0x437) {
          float v188 = v187;
        }
        else {
          float v188 = 4.0;
        }
        v189 = [[PTColorConversion alloc] initWithMetalContext:v485];
        colorConversion = v490->_colorConversion;
        v490->_colorConversion = v189;

        if (v490->_colorConversion)
        {
          if ((v477 & 2) == 0)
          {
LABEL_99:
            if (!v478)
            {
LABEL_113:
              unint64_t v473 = v80;
              if (v476)
              {
                v234 = [(PTMetalContext *)v490->_metalContext textureUtil];
                uint64_t v235 = [v234 createWithWidth:v492 height:v491 pixelFormat:10];
                upscaledPersonSegmentation = v490->_upscaledPersonSegmentation;
                v490->_upscaledPersonSegmentation = (MTLTexture *)v235;
              }
              int v511 = 0;
              uint64_t v510 = 0;
              v237 = [(PTMetalContext *)v490->_metalContext device];
              uint64_t v238 = [v237 newBufferWithBytes:&v510 length:12 options:0];
              lastFocus = v490->_lastFocus;
              v490->_lastFocus = (MTLBuffer *)v238;

              if (v490->_lastFocus)
              {
                int v509 = 0;
                long long v507 = xmmword_1D0840770;
                long long v508 = unk_1D0840780;
                v240 = [(PTMetalContext *)v490->_metalContext device];
                uint64_t v241 = [v240 newBufferWithBytes:&v507 length:36 options:0];
                focusDisparityModifiers = v490->_focusDisparityModifiers;
                v490->_focusDisparityModifiers = (MTLBuffer *)v241;

                id v16 = v485;
                v61 = v475;
                if (v490->_focusDisparityModifiers)
                {
                  int v496 = 1065353216;
                  v243 = [(PTMetalContext *)v490->_metalContext device];
                  uint64_t v244 = [v243 newBufferWithBytes:&v496 length:4 options:0];
                  studioLightEffectModifier = v490->_studioLightEffectModifier;
                  v490->_studioLightEffectModifier = (MTLBuffer *)v244;

                  if (!v490->_studioLightEffectModifier)
                  {
                    v260 = _PTLogSystem();
                    if (os_log_type_enabled(v260, OS_LOG_TYPE_ERROR)) {
                      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]7(v260, v357, v358, v359, v360, v361, v362, v363);
                    }
                    v28 = 0;
                    v29 = v486;
                    goto LABEL_210;
                  }
                  if ((v477 & 2) != 0)
                  {
                    v247 = [PTEffectRelighting alloc];
                    v248 = v490->_metalContext;
                    unint64_t v249 = v490->_availableEffectTypes;
                    v250 = v490->_effectUtil;
                    v480 = v490->_util;
                    uint64_t v251 = [v15 prewarmOnly];
                    v252 = v490->_msrColorPyramid;
                    BOOL studiolightFromSegmentation = v490->_studiolightFromSegmentation;
                    *(void *)&long long v499 = v492;
                    *((void *)&v499 + 1) = v491;
                    uint64_t v500 = 1;
                    LOBYTE(v470) = studiolightFromSegmentation;
                    v254 = v248;
                    id v17 = v484;
                    v255 = v250;
                    v61 = v475;
                    uint64_t v256 = [(PTEffectRelighting *)v247 initWithMetalContext:v254 faceAttributesNetwork:v484 availableEffectTypes:v249 effectUtil:v255 util:v480 prewarmOnly:v251 colorSize:&v499 msrColorPyramid:v252 studiolightFromSegmentation:v470 sharedResources:v31];
                    effectRelighting = v490->_effectRelighting;
                    v490->_effectRelighting = (PTEffectRelighting *)v256;

                    if (!v490->_effectRelighting)
                    {
                      v260 = _PTLogSystem();
                      if (os_log_type_enabled(v260, OS_LOG_TYPE_ERROR)) {
                        -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]7(v260, v400, v401, v402, v403, v404, v405, v406);
                      }
                      v28 = 0;
                      id v16 = v485;
                      v29 = v486;
                      goto LABEL_210;
                    }
                  }
                  v505 = &unk_1F26C0EE0;
                  *(float *)&double v246 = fminf(v188, 4.0);
                  v258 = [NSNumber numberWithFloat:v246];
                  v506 = v258;
                  v259 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v506 forKeys:&v505 count:1];
                  v260 = +[PTQualitySettings createWithQuality:25 options:v259];

                  if (v260)
                  {
                    [v260 setDoCenterDisparity:0];
                    LODWORD(v261) = 1.0;
                    [v260 setDisparityUpsampleFactor:v261];
                    [v260 setIntermediatePixelFormat:71];
                    v262 = [PTRenderPipelineDescriptor alloc];
                    v263 = [*p_metalContext device];
                    v264 = -[PTRenderPipelineDescriptor initWithDevice:version:colorSize:disparitySize:](v262, "initWithDevice:version:colorSize:disparitySize:", v263, 3001, (double)v492, (double)v491, (float)((float)v474 * 1.5), (float)((float)v473 * 1.5));

                    p_super = &v264->super;
                    if (v264)
                    {
                      v503[0] = &unk_1F26C0EF8;
                      v503[1] = &unk_1F26C0F10;
                      v504[0] = v260;
                      v504[1] = MEMORY[0x1E4F1CC28];
                      v503[2] = &unk_1F26C0F28;
                      v265 = v490;
                      v504[2] = v490->_metalContext;
                      v266 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v504 forKeys:v503 count:3];
                      [(PTRenderPipelineDescriptor *)v264 setOptions:v266];

                      v267 = [[PTRenderPipeline alloc] initWithDescriptor:v264];
                      renderPipeline = v490->_renderPipeline;
                      v490->_renderPipeline = v267;

                      v269 = v490->_renderPipeline;
                      if (!v269)
                      {
                        v407 = _PTLogSystem();
                        if (os_log_type_enabled(v407, OS_LOG_TYPE_ERROR)) {
                          -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]0(v407, v408, v409, v410, v411, v412, v413, v414);
                        }

                        v28 = 0;
                        id v15 = v483;
                        id v17 = v484;
                        id v16 = v485;
                        v29 = v486;
                        v30 = v488;
                        v31 = v489;
                        goto LABEL_209;
                      }
                      uint64_t v270 = [(PTRenderPipeline *)v269 createRenderStateWithQuality:[v260 quality]];
                      renderState = v490->_renderState;
                      v490->_renderState = (PTRenderState *)v270;

                      v272 = v490->_renderState;
                      if (!v272)
                      {
                        v415 = _PTLogSystem();
                        if (os_log_type_enabled(v415, OS_LOG_TYPE_ERROR)) {
                          -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]1(v415, v416, v417, v418, v419, v420, v421, v422);
                        }
                        goto LABEL_207;
                      }
                      [(PTRenderState *)v272 setSourceColorBitDepth:8];
                      [(PTRenderState *)v490->_renderState prepareForRendering:1];
                      uint64_t v273 = objc_opt_new();
                      sdofRenderRequest = v490->_sdofRenderRequest;
                      v490->_sdofRenderRequest = (PTRenderRequest *)v273;

                      [(PTRenderRequest *)v490->_sdofRenderRequest setFrameId:0];
                      [(PTRenderRequest *)v490->_sdofRenderRequest setRenderState:v490->_renderState];
                      LODWORD(v275) = 1108546159;
                      if (v482) {
                        *(float *)&double v275 = 34.47;
                      }
                      [(PTRenderRequest *)v490->_sdofRenderRequest setFocalLenIn35mmFilm:v275];
                      LODWORD(v276) = 1.0;
                      [(PTRenderRequest *)v490->_sdofRenderRequest setFocusDisparity:v276];
                      v490->_externalHandDetectionsAvailable = 0;
                      if (v476)
                      {
                        v277 = [PTEffectPersonSegmentation alloc];
                        v278 = v490->_metalContext;
                        [v483 colorSize];
                        uint64_t v281 = -[PTEffectPersonSegmentation initWithMetalContext:colorSize:msrColorPyramid:cvmNetwork:effectQuality:prewarmOnly:sharedResources:](v277, "initWithMetalContext:colorSize:msrColorPyramid:cvmNetwork:effectQuality:prewarmOnly:sharedResources:", v278, v490->_msrColorPyramid, v490->_cvmNetwork, v490->effectQuality, [v483 prewarmOnly], v489, v279, v280);
                        personSegmentation = v490->_personSegmentation;
                        v490->_personSegmentation = (PTEffectPersonSegmentation *)v281;

                        if (!v490->_personSegmentation)
                        {
                          v415 = _PTLogSystem();
                          if (os_log_type_enabled(v415, OS_LOG_TYPE_ERROR)) {
                            -[PTEffectPersonSegmentation initWithMetalContext:colorSize:msrColorPyramid:cvmNetwork:effectQuality:prewarmOnly:sharedResources:](v415, v428, v429, v430, v431, v432, v433, v434);
                          }
                          goto LABEL_207;
                        }
                        [v483 colorSize];
                        +[PTEffectPersonSegmentation segmentationSizeForColorSize:](PTEffectPersonSegmentation, "segmentationSizeForColorSize:");
                        v265 = v490;
                        v283 = v490->_msrColorPyramid;
                        v495[0] = (unint64_t)v284;
                        v495[1] = (unint64_t)v285;
                        v495[2] = 1;
                        v286 = [(PTMSRResize *)v283 addAdditionalOutput:v495];
                        v490->_personSegmentationInput = v286;
                        CVPixelBufferRetain(v286);
                      }
                      if ((v477 & 0x40) != 0)
                      {
                        v287 = [[PTBackgroundReplacement alloc] initWithMetalContext:v265->_metalContext effectDescriptor:v265->_effectDescriptor sharedSDOFRenderRequest:v265->_sdofRenderRequest renderPipeline:v265->_renderPipeline];
                        backgroundReplacement = v265->_backgroundReplacement;
                        v265->_backgroundReplacement = v287;
                      }
                      if ((v265->_availableEffectTypes & 0x10) == 0) {
                        goto LABEL_132;
                      }
                      uint64_t v423 = [v489 renderEffect];
                      if (v423)
                      {
                        v424 = (void *)v423;
                        v425 = [v489 renderEffect];
                        v426 = v425;
                        if (v425)
                        {
                          [v425 colorSize];
                          uint64_t v427 = v494;
                        }
                        else
                        {
                          uint64_t v427 = 0;
                        }
                        if (v427 == v492)
                        {
                          v442 = [v489 renderEffect];
                          v443 = v442;
                          if (v442)
                          {
                            [v442 colorSize];
                            uint64_t v444 = v493;
                          }
                          else
                          {
                            uint64_t v444 = 0;
                          }

                          if (v444 == v491)
                          {
                            uint64_t v445 = [v489 renderEffect];
                            vfxEffect = v490->_vfxEffect;
                            v490->_vfxEffect = (PTVFXRenderEffect *)v445;

                            goto LABEL_197;
                          }
                        }
                        else
                        {
                        }
                      }
                      v447 = [PTVFXRenderEffect alloc];
                      v448 = v490->_metalContext;
                      v449 = v490->_colorConversion;
                      uint64_t v450 = [v483 prewarmOnly];
                      humanDetections = v490->_humanDetections;
                      *(void *)&long long v499 = v492;
                      *((void *)&v499 + 1) = v491;
                      uint64_t v500 = 1;
                      uint64_t v452 = [(PTVFXRenderEffect *)v447 initWithMetalContext:v448 colorSize:&v499 colorConversion:v449 prewarmOnly:v450 humanDetections:humanDetections asyncInitQueue:v487];
                      v453 = v490->_vfxEffect;
                      v490->_vfxEffect = (PTVFXRenderEffect *)v452;

                      if (!v490->_vfxEffect)
                      {
                        v415 = _PTLogSystem();
                        if (os_log_type_enabled(v415, OS_LOG_TYPE_ERROR)) {
                          -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]4(v415, v456, v457, v458, v459, v460, v461, v462);
                        }
                        goto LABEL_207;
                      }
                      objc_msgSend(v489, "setRenderEffect:");
LABEL_197:
                      *(void *)&long long v499 = v492;
                      *((void *)&v499 + 1) = v491;
                      uint64_t v500 = 1;
                      [(PTEffectRenderer *)v490 createVfxTextures:&v499];
                      v454 = [[PTDepthConverter alloc] initWithMetalContext:v490->_metalContext];
                      depthConverter = v490->_depthConverter;
                      v490->_depthConverter = v454;

                      if (!v490->_depthConverter)
                      {
                        v415 = _PTLogSystem();
                        if (os_log_type_enabled(v415, OS_LOG_TYPE_ERROR)) {
                          -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]5(v415, v463, v464, v465, v466, v467, v468, v469);
                        }
                        goto LABEL_207;
                      }
                      if (!v490->_vfxEffect || !v490->_vfxRenderTarget || !v490->_vfxDepthBuffer)
                      {
                        v415 = _PTLogSystem();
                        if (os_log_type_enabled(v415, OS_LOG_TYPE_ERROR)) {
                          -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]6();
                        }
                        goto LABEL_207;
                      }
LABEL_132:
                      v289 = [[PTEffectDebugLayer alloc] initWithMetalContext:v490->_metalContext effectRelighting:v490->_effectRelighting renderState:v490->_renderState util:v490->_util colorConversion:v490->_colorConversion msrColorPyramid:v490->_msrColorPyramid vfxRenderEffect:v490->_vfxEffect depthConverter:v490->_depthConverter disparityFixedFocus:v490->_disparityCenteredUpscaledSDOF faceDisparityArray:v490->_faceDisparityArray focusDisparityRaw:v490->_focusDisparityRaw focusDisparityModifiers:v490->_focusDisparityModifiers];
                      debugLayer = v490->_debugLayer;
                      v490->_debugLayer = v289;

                      v291 = v490->_debugLayer;
                      if (v291)
                      {
                        [(PTEffectDebugLayer *)v291 setReactionProvider:v490->_reactionProvider];
                        kdebug_trace();
                        v28 = v490;
LABEL_208:
                        id v15 = v483;
                        id v17 = v484;
                        id v16 = v485;
                        v29 = v486;
                        v30 = v488;
                        v31 = v489;
                        goto LABEL_209;
                      }
                      v415 = _PTLogSystem();
                      if (os_log_type_enabled(v415, OS_LOG_TYPE_ERROR)) {
                        -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]3(v415, v435, v436, v437, v438, v439, v440, v441);
                      }
LABEL_207:

                      v28 = 0;
                      goto LABEL_208;
                    }
                    v392 = _PTLogSystem();
                    if (os_log_type_enabled(v392, OS_LOG_TYPE_ERROR)) {
                      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]9(v392, v393, v394, v395, v396, v397, v398, v399);
                    }

                    v28 = 0;
                    id v16 = v485;
                  }
                  else
                  {
                    p_super = _PTLogSystem();
                    id v16 = v485;
                    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
                      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]8(p_super, v371, v372, v373, v374, v375, v376, v377);
                    }
                    v28 = 0;
                  }
                  id v17 = v484;
                  v29 = v486;
LABEL_209:

LABEL_210:
                  goto LABEL_63;
                }
                v119 = _PTLogSystem();
                v29 = v486;
                if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                  -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]6(v119, v343, v344, v345, v346, v347, v348, v349);
                }
LABEL_59:

                v28 = 0;
                goto LABEL_63;
              }
              v104 = _PTLogSystem();
              id v16 = v485;
              v61 = v475;
              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
                -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]5(v104, v322, v323, v324, v325, v326, v327, v328);
              }
LABEL_62:

              v28 = 0;
              v29 = v486;
              goto LABEL_63;
            }
            v196 = [PTEffectTemporalFilter alloc];
            v197 = v490->_metalContext;
            uint64_t v198 = v81;
            unint64_t v199 = v80;
            *(void *)&long long v507 = v474;
            *((void *)&v507 + 1) = v80;
            uint64_t v471 = v198;
            *(void *)&long long v508 = v198;
            uint64_t v200 = [(PTEffectTemporalFilter *)v196 initWithMetalContext:v197 disparitySize:&v507];
            temporalFilter = v490->_temporalFilter;
            v490->_temporalFilter = (PTEffectTemporalFilter *)v200;

            if (v490->_temporalFilter)
            {
              v202 = [(PTMetalContext *)v490->_metalContext textureUtil];
              unint64_t v203 = (unint64_t)(float)((float)v80 * 1.5);
              unint64_t v479 = (unint64_t)(float)((float)v474 * 1.5);
              uint64_t v204 = objc_msgSend(v202, "createWithWidth:height:pixelFormat:");
              disparityCenteredUpscaledSDOF = v490->_disparityCenteredUpscaledSDOF;
              v490->_disparityCenteredUpscaledSDOF = (MTLTexture *)v204;

              if (v490->_disparityCenteredUpscaledSDOF)
              {
                unint64_t v472 = v199;
                v206 = [(PTMetalContext *)v490->_metalContext textureUtil];
                uint64_t v207 = [v206 createWithWidth:v479 height:v203 pixelFormat:25];
                disparityCenteredUpscaledReactions = v490->_disparityCenteredUpscaledReactions;
                v490->_disparityCenteredUpscaledReactions = (MTLTexture *)v207;

                if (v490->_disparityCenteredUpscaledReactions)
                {
                  if ((v477 & 0x4C) == 0) {
                    goto LABEL_105;
                  }
                  v209 = [(PTMetalContext *)v490->_metalContext textureUtil];
                  uint64_t v210 = [v209 createWithWidth:v479 height:v203 pixelFormat:25];
                  disparityCenteredUpscaledWithScreenCaptureRect = v490->_disparityCenteredUpscaledWithScreenCaptureRect;
                  v490->_disparityCenteredUpscaledWithScreenCaptureRect = (MTLTexture *)v210;

                  if (!v490->_disparityCenteredUpscaledWithScreenCaptureRect)
                  {
                    v292 = _PTLogSystem();
                    if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR)) {
                      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]9(v292, v385, v386, v387, v388, v389, v390, v391);
                    }
                  }
                  else
                  {
LABEL_105:
                    unint64_t v212 = v203;
                    if (v488 && v490->_cvmNetwork)
                    {
                      v213 = [*p_metalContext commandQueue];
                      v214 = [v213 commandBuffer];

                      if (!v214)
                      {
                        v215 = _PTLogSystem();
                        if (os_log_type_enabled(v215, OS_LOG_TYPE_ERROR)) {
                          -[PTEffect updateEffectDelegate:](v215, v216, v217, v218, v219, v220, v221, v222);
                        }

                        id v15 = v483;
                        v30 = v488;
                        v31 = v489;
                        unint64_t v212 = v203;
                      }
                      [v30 restoreState:v214 cvmNetwork:v490->_cvmNetwork temporalFilter:v490->_temporalFilter];
                      [v214 commit];
                      [v214 waitUntilScheduled];
                    }
                    v223 = [(PTMSRResize *)v490->_msrColorPyramid pyramidRGBA];
                    v497[0] = (unint64_t)(float)((float)v474 * 1.5);
                    v497[1] = v212;
                    v497[2] = 1;
                    uint64_t v224 = +[PTUtil findMipmapLevel:v223 largerThan:v497];
                    guideRGBAUpscale = v490->_guideRGBAUpscale;
                    v490->_guideRGBAUpscale = (MTLTexture *)v224;

                    v226 = [(PTMSRResize *)v490->_msrColorPyramid pyramidRGBA];
                    *(void *)&long long v507 = v474;
                    *((void *)&v507 + 1) = v472;
                    *(void *)&long long v508 = v471;
                    uint64_t v227 = +[PTUtil findMipmapLevel:v226 largerThan:&v507];
                    guideRGBACoefficients = v490->_guideRGBACoefficients;
                    v490->_guideRGBACoefficients = (MTLTexture *)v227;

                    v229 = [PTGuidedFilter alloc];
                    v230 = v490->_metalContext;
                    *(void *)&long long v507 = v474;
                    *((void *)&v507 + 1) = v472;
                    unint64_t v80 = v472;
                    *(void *)&long long v508 = v471;
                    LODWORD(v231) = 1028443341;
                    uint64_t v232 = [(PTGuidedFilter *)v229 initWithMetalContext:v230 inputSize:&v507 epsilon:v231];
                    guidedFilter = v490->_guidedFilter;
                    v490->_guidedFilter = (PTGuidedFilter *)v232;

                    id v17 = v484;
                    if (v490->_guidedFilter) {
                      goto LABEL_113;
                    }
                    v292 = _PTLogSystem();
                    if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR)) {
                      -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]2(v292, v378, v379, v380, v381, v382, v383, v384);
                    }
                  }
                }
                else
                {
                  v292 = _PTLogSystem();
                  if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR)) {
                    -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]3(v292, v364, v365, v366, v367, v368, v369, v370);
                  }
                }
              }
              else
              {
                v292 = _PTLogSystem();
                if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR)) {
                  -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]2(v292, v350, v351, v352, v353, v354, v355, v356);
                }
              }
            }
            else
            {
              v292 = _PTLogSystem();
              if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR)) {
                -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]1(v292, v329, v330, v331, v332, v333, v334, v335);
              }
            }
            goto LABEL_166;
          }
          v191 = [[PTNormalAndDiffuseEstimation alloc] initWithMetalContext:v490->_metalContext];
          diffuseEstimation = v490->_diffuseEstimation;
          v490->_diffuseEstimation = v191;

          if (v490->_diffuseEstimation)
          {
            v193 = [(PTMetalContext *)v490->_metalContext textureUtil];
            uint64_t v194 = [v193 createWithWidth:v474 height:v80 pixelFormat:20];
            diffuse = v490->_diffuse;
            v490->_diffuse = (MTLTexture *)v194;

            if (v490->_diffuse) {
              goto LABEL_99;
            }
            v292 = _PTLogSystem();
            if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR)) {
              -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]1(v292, v336, v337, v338, v339, v340, v341, v342);
            }
          }
          else
          {
            v292 = _PTLogSystem();
            if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR)) {
              -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]0(v292, v300, v301, v302, v303, v304, v305, v306);
            }
          }
        }
        else
        {
          v292 = _PTLogSystem();
          if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR)) {
            -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:]0(v292, v293, v294, v295, v296, v297, v298, v299);
          }
        }
LABEL_166:

        v28 = 0;
        id v16 = v485;
LABEL_167:
        v29 = v486;
        v61 = v475;
        goto LABEL_63;
      }
      unint64_t v474 = 0;
      v475 = v61;
      uint64_t v81 = 0;
      unint64_t v80 = 0;
    }
LABEL_85:
    if (!v490->_msrColorPyramid && ([v483 prewarmOnly] & 1) == 0)
    {
      v182 = [PTMSRResize alloc];
      v183 = v490->_metalContext;
      *(void *)&long long v507 = v492;
      *((void *)&v507 + 1) = v491;
      uint64_t v81 = 1;
      *(void *)&long long v508 = 1;
      long long v499 = xmmword_1D0840760;
      uint64_t v500 = 1;
      uint64_t v184 = [(PTMSRResize *)v182 initWithMetalContext:v183 inputSize:&v507 targetSize:&v499 rotateTargetPixelBuffer:0 sRGB:0 sharedResources:v489];
      v185 = v490->_msrColorPyramid;
      v490->_msrColorPyramid = (PTMSRResize *)v184;

      unint64_t v474 = 320;
      unint64_t v80 = 176;
    }
    goto LABEL_88;
  }
  v79 = [[PTEspressoGenericExecutor alloc] initWithMetalContext:*p_metalContext];
  if (v79)
  {
    v475 = v61;

    unint64_t v474 = 320;
    unint64_t v80 = 176;
    uint64_t v81 = 1;
    goto LABEL_85;
  }
  v135 = _PTLogSystem();
  if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR)) {
    -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.9(v135, v168, v169, v170, v171, v172, v173, v174);
  }
LABEL_143:

  v28 = 0;
  id v16 = v485;
  v29 = v486;
LABEL_63:

LABEL_64:
LABEL_65:

  return v28;
}

- (int64_t)effectQuality
{
  return self->effectQuality;
}

- (int)render:(id)a3 waitUntilCompleted:(BOOL)a4 gpuCompleted:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v196 = a5;
  v201 = objc_opt_new();
  if ([(PTMetalContext *)self->_metalContext isCommandBufferCommitted])
  {
    int v9 = 0;
  }
  else
  {
    double v10 = _PTLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PTEffect render:]();
    }

    int v9 = -9;
  }
  [v8 frameTimeSeconds];
  unint64_t v11 = self->_availableEffectTypes & [v8 effectType];
  uint64_t v197 = [v8 inColorBuffer];
  uint64_t v12 = [v8 outColorBuffer];
  unint64_t v13 = [(PTBackgroundReplacement *)self->_backgroundReplacement updateAndGetBackgroundState:v8 frameIndex:self->_frameIndex];
  BOOL v14 = (v11 & 0x40) != 0 && [v8 inBackgroundReplacementBuffer] || v13 != 0;
  BOOL v206 = v14;
  BOOL v15 = 0;
  int v16 = v11 & (v13 != 4);
  if (v13 == 1) {
    int v16 = 0;
  }
  uint64_t v17 = (v11 >> 3) & 1;
  int v204 = v16;
  if ((v11 & 2) == 0 && (v16 & 1) == 0 && !v206) {
    BOOL v15 = [v8 outColorBuffer] != 0;
  }
  unint64_t v186 = v13;
  BOOL v189 = v15;
  unsigned int v202 = v9;
  uint64_t v18 = [v8 remappedAperture];
  int v20 = v19;
  uint64_t v21 = MEMORY[0x1D25E42A0](v18);
  if ((v11 & 0x20) != 0) {
    [(PTEffectRenderer *)self runGestureDetection:v8 asyncWork:v201];
  }
  unint64_t v22 = v11 & 2;
  int v23 = v17 | v206;
  BOOL v199 = (v11 & 0x10) != 0
      && [(PTVFXRenderEffect *)self->_vfxEffect updateWithRenderRequest:v8 lastFrameTime:self->_lastFrameTime];
  char v24 = v204;
  if ((v11 & 2) != 0) {
    char v24 = 1;
  }
  if (v24) {
    unsigned int v25 = 1;
  }
  else {
    unsigned int v25 = v199 & ~(v23 & (v11 >> 2) | v206);
  }
  unsigned int v188 = v23 & (v11 >> 2) | v206;
  if (v206)
  {
    if ((v11 & 2) == 0)
    {
      if ((v13 & 0xFFFFFFFFFFFFFFFELL) != 2) {
        LOBYTE(v25) = 0;
      }
      if ((v25 & 1) == 0) {
        goto LABEL_38;
      }
      goto LABEL_34;
    }
    BOOL v26 = !self->_studiolightFromSegmentation;
    if (self->_studiolightFromSegmentation && ((v25 ^ 1) & 1) == 0)
    {
      if ((v13 & 0xFFFFFFFFFFFFFFFELL) != 2) {
        goto LABEL_38;
      }
LABEL_34:
      BOOL v190 = [(PTHumanDetections *)self->_humanDetections detectionsRawCount] > 0;
      int v27 = 1;
      BOOL v205 = 1;
      goto LABEL_39;
    }
  }
  else
  {
    BOOL v26 = v25;
  }
  if (v26) {
    goto LABEL_34;
  }
LABEL_38:
  BOOL v205 = 0;
  BOOL v190 = 0;
  int v27 = v17 | v206;
LABEL_39:
  uint64_t v28 = [v8 frameTimeSeconds];
  double v30 = v29 - self->_lastFrameTime;
  if (v30 > 1.0) {
    self->_frameIndex = 0;
  }
  if (v23 && (v30 > 1.0 || !self->_renderSegmentationPreviousFrame))
  {
    v31 = _PTLogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D0778000, v31, OS_LOG_TYPE_INFO, "Reset segmentation network", (uint8_t *)buf, 2u);
    }

    uint64_t v28 = [(PTEffectPersonSegmentation *)self->_personSegmentation reset];
  }
  self->_renderSegmentationPreviousFrame = v23;
  if (v205 && (v30 > 1.0 || !self->_runCVMNetworkPreviousFrame))
  {
    v32 = _PTLogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D0778000, v32, OS_LOG_TYPE_INFO, "Reset network", (uint8_t *)buf, 2u);
    }

    [(PTCVMNetwork *)self->_cvmNetwork reset];
    uint64_t v28 = [(PTEffectTemporalFilter *)self->_temporalFilter reset];
  }
  self->_runCVMNetworkPreviousFrame = v205;
  if ((v11 & 2) != 0 && (v30 > 1.0 || !self->_renderStudioLightPreviousFrame))
  {
    unsigned int v33 = _PTLogSystem();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D0778000, v33, OS_LOG_TYPE_INFO, "Reset studio light", (uint8_t *)buf, 2u);
    }

    uint64_t v28 = [(PTEffectRelighting *)self->_effectRelighting reset];
  }
  self->_renderStudioLightPreviousFrame = (v11 & 2) >> 1;
  PTDefaultsFlush(v28);
  uint64_t v194 = PTDefaultsPublicGetDictionary();
  v193 = [v194 objectForKeyedSubscript:@"PTEffectDebug"];
  unint64_t v200 = v11;
  context = (void *)v21;
  BOOL v187 = v6;
  BOOL v34 = (int)[v193 intValue] > 0 || self->_debugType != 0;
  v35 = [(PTMetalContext *)self->_metalContext device];
  unint64_t v203 = +[PTTexture createFromPixelbuffer:v197 device:v35 textureCache:self->_textureCache read:1 write:0];

  if (v12)
  {
    dispatch_queue_t v36 = [(PTMetalContext *)self->_metalContext device];
    uint64_t v37 = +[PTTexture createFromPixelbuffer:v12 device:v36 textureCache:self->_textureCache read:v34 write:1];
  }
  else
  {
    uint64_t v37 = 0;
  }
  intermediateYUV = self->_intermediateYUV;
  [v203 copyMetadataTo:self->_intermediateYUV[0]];
  [v203 copyMetadataTo:self->_intermediateYUV[1]];
  unint64_t v39 = objc_opt_new();
  [v39 addObject:v203];
  unint64_t v40 = v200;
  if (v22) {
    objc_msgSend(v39, "addObject:", intermediateYUV[objc_msgSend(v39, "count") & 1]);
  }
  if (v204) {
    objc_msgSend(v39, "addObject:", intermediateYUV[objc_msgSend(v39, "count") & 1]);
  }
  if (v206) {
    objc_msgSend(v39, "addObject:", intermediateYUV[objc_msgSend(v39, "count") & 1]);
  }
  if (v37) {
    objc_msgSend(v39, "replaceObjectAtIndex:withObject:", objc_msgSend(v39, "count") - 1, v37);
  }
  if (v27)
  {
    unsigned int v41 = [(PTMSRResize *)self->_msrColorPyramid downsampleToQuarterSize:v197] | v202;
    if (v41)
    {
      double v42 = _PTLogSystem();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:]0();
      }
    }
    unsigned int v202 = [(PTMSRResize *)self->_msrColorPyramid downsampleQuarterSizeToTargetSize:v197] | v41;
    if (v202)
    {
      unint64_t v43 = _PTLogSystem();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:]0();
      }
    }
    else
    {
      unsigned int v202 = 0;
    }
  }
  uint64_t v198 = (void *)v37;
  if (v205)
  {
    v44 = [(PTMetalContext *)self->_metalContext commandBuffer];

    if (!v44)
    {
      char v45 = _PTLogSystem();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:].cold.5(v45, v46, v47, v48, v49, v50, v51, v52);
      }
    }
    temporalFilter = self->_temporalFilter;
    v54 = [(PTMetalContext *)self->_metalContext commandBuffer];
    v55 = [(PTMSRResize *)self->_msrColorPyramid targetRGBA];
    [(PTEffectTemporalFilter *)temporalFilter prepareFilter:v54 opticalFlowRGB:v55 frameIndex:self->_networkFrameIndex];

    [(PTMetalContext *)self->_metalContext commit];
    if ([v8 inExternalDisparityBuffer])
    {
      uint64_t v56 = [v8 inExternalDisparityBuffer];
      v57 = [(PTMetalContext *)self->_metalContext device];
      uint64_t v58 = +[PTPixelBufferUtil createTextureFromPixelBuffer:v56 device:v57 textureCache:self->_textureCache sRGB:0];
    }
    else
    {
      [(PTCVMNetwork *)self->_cvmNetwork executeNetwork:self->_networkFrameIndex];
      uint64_t v58 = [(PTCVMNetwork *)self->_cvmNetwork outDisparity];
    }
    float v59 = [(PTMetalContext *)self->_metalContext commandBuffer];

    if (!v59)
    {
      v60 = _PTLogSystem();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:].cold.5(v60, v61, v62, v63, v64, v65, v66, v67);
      }
    }
    [(PTHumanDetections *)self->_humanDetections detectionsRawCount];
    if (v22) {
      [(PTNormalAndDiffuseEstimation *)self->_diffuseEstimation estimateDiffuseFromDisparity:v58 outDiffuse:self->_diffuse];
    }
    if ([(PTCVMNetwork *)self->_cvmNetwork networkVersionID] == 7
      && ![(PTCVMNetwork *)self->_cvmNetwork highResNetwork])
    {
      float v68 = 1.5705;
    }
    else
    {
      float v68 = 1.0;
    }
    v69 = self->_temporalFilter;
    v70 = [(PTMetalContext *)self->_metalContext commandBuffer];
    if (v22) {
      diffuse = self->_diffuse;
    }
    else {
      diffuse = 0;
    }
    LODWORD(v185) = self->_networkFrameIndex;
    *(float *)&double v71 = v68;
    [(PTEffectTemporalFilter *)v69 filter:v70 inDisparity:v58 inNormal:0 inDiffuse:diffuse filterNormalSpatial:1 filterDiffuseSpatial:1 frameIndex:v71 disparityScale:v185];
  }
  else
  {
    uint64_t v58 = 0;
  }
  v192 = (void *)v58;
  if (!v23)
  {
    v76 = 0;
LABEL_110:
    unsigned int v78 = v188;
    goto LABEL_111;
  }
  [(PTMetalContext *)self->_metalContext commit];
  if ([v8 outPersonSegmentationMatteBuffer])
  {
    uint64_t v73 = [v8 outPersonSegmentationMatteBuffer];
    v74 = [(PTMetalContext *)self->_metalContext device];
    uint64_t v75 = +[PTPixelBufferUtil createTextureFromPixelBuffer:v73 device:v74];

    v76 = v75;
    int v77 = v202;
  }
  else
  {
    upscaledPersonSegmentation = self->_upscaledPersonSegmentation;
    int v77 = v202;
    if (!upscaledPersonSegmentation)
    {
      v76 = _PTLogSystem();
      v165 = v198;
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
        -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:]();
      }
      goto LABEL_173;
    }
    v76 = upscaledPersonSegmentation;
  }
  personSegmentation = self->_personSegmentation;
  uint64_t v128 = [(PTMetalContext *)self->_metalContext commandBuffer];
  v77 |= [(PTEffectPersonSegmentation *)personSegmentation runPersonSegmentationToOutPersonSegmentationMatteBuffer:v128 inRGBA:self->_personSegmentationInput outUpscaledSegmentation:v76];

  [(PTMetalContext *)self->_metalContext commit];
  if (v8) {
    [v8 transform];
  }
  else {
    memset(v213, 0, 48);
  }
  v165 = v198;
  if (+[PTUtil getRotationDegreesFromAffineTransform:v213])
  {
    uint64_t v166 = _PTLogSystem();
    if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR)) {
      -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:].cold.7();
    }

LABEL_173:
    int v167 = 0;
    goto LABEL_190;
  }
  uint64_t v168 = [(PTMetalContext *)self->_metalContext commandBuffer];

  unsigned int v202 = v77;
  if (v168) {
    goto LABEL_110;
  }
  uint64_t v169 = _PTLogSystem();
  unsigned int v78 = v188;
  if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR)) {
    -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:].cold.5(v169, v170, v171, v172, v173, v174, v175, v176);
  }

LABEL_111:
  BOOL v79 = v190;
  v191 = v76;
  int v80 = v204 | v199 & ~v78;
  if (v79 || [(PTVFXRenderEffect *)self->_vfxEffect emitNewReaction])
  {
    if ([(PTVFXRenderEffect *)self->_vfxEffect emitNewReaction]) {
      BOOL v81 = [(PTHumanDetections *)self->_humanDetections detectionsRawCount] == 0;
    }
    else {
      BOOL v81 = 0;
    }
    uint64_t v82 = [(PTHumanDetections *)self->_humanDetections faceDetectionsFilteredState:v81];
    effectUtil = self->_effectUtil;
    uint64_t v84 = [(PTHumanDetections *)self->_humanDetections faceDetectionsRaw];
    float focusDisparityMax = self->_focusDisparityMax;
    uint64_t v86 = [(PTEffectTemporalFilter *)self->_temporalFilter disparityFiltered];
    *(float *)&double v87 = focusDisparityMax;
    [(PTEffectUtil *)effectUtil sampleFaceRectsWithMaxFaceRects:4 faceRects:v84 faceRectsState:v82 focusDisparityMax:v86 inDisparity:self->_faceDisparityArray outFaceDistanceArray:v87];

    uint64_t v88 = self->_effectUtil;
    uint64_t v89 = [(PTHumanDetections *)self->_humanDetections detectionsRawCount];
    float focusDisparityUpdateCoefficientSDOF = self->_focusDisparityUpdateCoefficientSDOF;
    float focusDisparityUpdateCoefficientStudioLight = self->_focusDisparityUpdateCoefficientStudioLight;
    BOOL v92 = self->_networkFrameIndex == 0;
    BOOL v93 = [(PTVFXRenderEffect *)self->_vfxEffect emitNewReaction];
    uint64_t v94 = [v8 focusOnAll];
    *(float *)&double v95 = self->_disparityFocusOffsetSDOF.disparityOffsetFactor;
    *(float *)&double v96 = self->_disparityFocusOffsetSDOF.offsetInMeters;
    *(float *)&double v97 = self->_disparityFocusOffsetReactions.disparityOffsetFactor;
    *(float *)&double v98 = self->_disparityFocusOffsetReactions.offsetInMeters;
    *(float *)&double v99 = self->_disparityFocusOffsetStudioLight.disparityOffsetFactor;
    *(float *)&double v100 = self->_disparityFocusOffsetStudioLight.offsetInMeters;
    *(float *)&double v101 = focusDisparityUpdateCoefficientSDOF;
    *(float *)&double v102 = focusDisparityUpdateCoefficientStudioLight;
    -[PTEffectUtil updateFocusObjectWithFaceRectCount:disparityFocusOffsetSDOF:disparityFocusOffsetReactions:disparityFocusOffsetStudioLight:exponentialMovingAverageSDOF:exponentialMovingAverageStudioLight:faceRectsState:isFirstFrame:emitNewReaction:focusOnAll:lastFocus:inFaceDisparityArray:outDisparityModifiers:outDisparityFocus:outStudioLightEffectModifier:outUseDisparityBufferForReactions:](v88, "updateFocusObjectWithFaceRectCount:disparityFocusOffsetSDOF:disparityFocusOffsetReactions:disparityFocusOffsetStudioLight:exponentialMovingAverageSDOF:exponentialMovingAverageStudioLight:faceRectsState:isFirstFrame:emitNewReaction:focusOnAll:lastFocus:inFaceDisparityArray:outDisparityModifiers:outDisparityFocus:outStudioLightEffectModifier:outUseDisparityBufferForReactions:", v89, v82, v92, v93, v94, self->_lastFocus, v95, v96, v97, v98, v99, v100, v101, v102,
      self->_faceDisparityArray,
      self->_focusDisparityModifiers,
      self->_focusDisparityRaw,
      self->_studioLightEffectModifier,
      self->_useDisparityBufferForReactions);
    unint64_t v40 = v200;
  }
  int v103 = v80 & v205;
  v104 = [(PTEffectTemporalFilter *)self->_temporalFilter diffuseFiltered];
  if (!v22)
  {
    int v77 = v202;
    if (!v103) {
      goto LABEL_153;
    }
    goto LABEL_145;
  }
  if (self->_studiolightFromSegmentation && v206)
  {
    uint64_t v106 = [(PTEffectRelighting *)self->_effectRelighting approximateDiffuseFromSegmentation:v191];
    backgroundReplacement = self->_backgroundReplacement;
    if (backgroundReplacement && (v186 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      [(PTBackgroundReplacement *)backgroundReplacement transitionTimeNormalized:v8];
      if (v186 == 3) {
        float v109 = 1.0 - v108;
      }
      else {
        float v109 = v108;
      }
      uint64_t v110 = [(PTMetalContext *)self->_metalContext textureUtil];
      uint64_t v111 = [(PTMetalContext *)self->_metalContext commandBuffer];
      *(float *)&double v112 = v109;
      [v110 mix:v111 inTexX:v104 inTexY:v106 outTex:v106 alpha:v112];
    }
    id v113 = v106;

    v104 = v113;
  }
  [(PTMetalContext *)self->_metalContext commit];
  [(PTEffectRelighting *)self->_effectRelighting estimateLightIntensity:v203 inFaceRects:[(PTHumanDetections *)self->_humanDetections faceDetectionsRaw] numberOfFaceRects:[(PTHumanDetections *)self->_humanDetections detectionsRawCount] humanDetections:self->_humanDetections effectRenderRequest:v8 asyncWork:v201];
  uint64_t v114 = [(PTMetalContext *)self->_metalContext commandBuffer];

  if (!v114)
  {
    uint64_t v115 = _PTLogSystem();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
      -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:].cold.5(v115, v116, v117, v118, v119, v120, v121, v122);
    }
  }
  [(PTHumanDetections *)self->_humanDetections detectionsRawCount];
  effectRelighting = self->_effectRelighting;
  uint64_t v124 = [v39 objectAtIndexedSubscript:0];
  if (v205)
  {
    uint64_t v125 = [(PTEffectTemporalFilter *)self->_temporalFilter disparityFiltered];
  }
  else
  {
    uint64_t v125 = 0;
  }
  focusDisparityModifiers = self->_focusDisparityModifiers;
  uint64_t v130 = [v39 objectAtIndexedSubscript:1];
  [v8 relightStrengthStudioLight];
  -[PTEffectRelighting studioLightInYUV:inDiffuse:inDisparity:inFocusDisparityModifier:outYUV:relightStrength:studioLightFromSegmentationBlend:studioLightEffectModifier:](effectRelighting, "studioLightInYUV:inDiffuse:inDisparity:inFocusDisparityModifier:outYUV:relightStrength:studioLightFromSegmentationBlend:studioLightEffectModifier:", v124, v104, v125, focusDisparityModifiers, v130, self->_studioLightEffectModifier);

  if (v205) {
  [v39 removeObjectAtIndex:0];
  }
  int v77 = v202;
  unint64_t v40 = v200;
  if (v103)
  {
LABEL_145:
    if (v199) {
      disparityCenteredUpscaledReactions = self->_disparityCenteredUpscaledReactions;
    }
    else {
      disparityCenteredUpscaledReactions = 0;
    }
    uint64_t v132 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_disparityCenteredUpscaledSDOF, disparityCenteredUpscaledReactions, 0);
    guidedFilter = self->_guidedFilter;
    v134 = [(PTMetalContext *)self->_metalContext commandBuffer];
    v135 = [(PTEffectTemporalFilter *)self->_temporalFilter disparityFiltered];
    v77 |= [(PTGuidedFilter *)guidedFilter guidedFilter:v134 image:v135 guideRGBACoefficients:self->_guideRGBACoefficients guideRGBAUpscale:self->_guideRGBAUpscale upscaledImageArray:v132 sourceColorBitDepth:8 postModifierBuffer:self->_focusDisparityModifiers];

    unint64_t v40 = v200;
    if (v77)
    {
      uint64_t v136 = _PTLogSystem();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR)) {
        -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:].cold.4(v77, v136);
      }
    }
  }
LABEL_153:
  if (v204)
  {
    uint64_t v137 = [v39 objectAtIndexedSubscript:0];
    [(PTRenderRequest *)self->_sdofRenderRequest setSourceColor:v137];

    uint64_t v138 = [v39 objectAtIndexedSubscript:1];
    [(PTRenderRequest *)self->_sdofRenderRequest setDestinationColor:v138];

    LODWORD(v139) = v20;
    [(PTRenderRequest *)self->_sdofRenderRequest setFNumber:v139];
    if ((v40 & 4) != 0)
    {
      uint64_t v140 = self->_effectUtil;
      [v8 inScreenCaptureRect];
      double v142 = v141;
      double v144 = v143;
      double v146 = v145;
      double v148 = v147;
      p_disparityCenteredUpscaledWithScreenCaptureRect = &self->_disparityCenteredUpscaledWithScreenCaptureRect;
      disparityCenteredUpscaledWithScreenCaptureRect = self->_disparityCenteredUpscaledWithScreenCaptureRect;
      disparityCenteredUpscaledSDOF = self->_disparityCenteredUpscaledSDOF;
      [(PTRenderRequest *)self->_sdofRenderRequest focalLenIn35mmFilm];
      int v153 = v152;
      [(PTRenderRequest *)self->_sdofRenderRequest fNumber];
      LODWORD(v155) = v154;
      LODWORD(v156) = v153;
      -[PTEffectUtil updateDisparityWithScreenCaptureRect:inDisparity:outDisparity:focalLenIn35mmFilm:fNumber:](v140, "updateDisparityWithScreenCaptureRect:inDisparity:outDisparity:focalLenIn35mmFilm:fNumber:", disparityCenteredUpscaledSDOF, disparityCenteredUpscaledWithScreenCaptureRect, v142, v144, v146, v148, v156, v155);
    }
    else
    {
      p_disparityCenteredUpscaledWithScreenCaptureRect = &self->_disparityCenteredUpscaledSDOF;
    }
    [(PTRenderRequest *)self->_sdofRenderRequest setSourceDisparity:*p_disparityCenteredUpscaledWithScreenCaptureRect];
    renderPipeline = self->_renderPipeline;
    v158 = [(PTMetalContext *)self->_metalContext commandBuffer];
    v77 |= [(PTRenderPipeline *)renderPipeline encodeRenderTo:v158 withRenderRequest:self->_sdofRenderRequest];

    if (v77)
    {
      v159 = _PTLogSystem();
      if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR)) {
        -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:](v77, v159);
      }
    }
    [v39 removeObjectAtIndex:0];
  }
  if (v206)
  {
    double v160 = self->_backgroundReplacement;
    double v161 = [(PTMetalContext *)self->_metalContext commandBuffer];
    double v162 = [v39 objectAtIndexedSubscript:0];
    double v163 = [v39 objectAtIndexedSubscript:1];
    [(PTBackgroundReplacement *)v160 replaceBackground:v161 inYUV:v162 inSegmentation:v191 effectRenderRequest:v8 outYUV:v163 frameIndex:self->_frameIndex];

    unint64_t v40 = v200;
    [v39 removeObjectAtIndex:0];
  }
  [v8 setOutColorBufferWriteSkipped:0];
  if (!v189) {
    goto LABEL_182;
  }
  if ([(PTEffectDescriptor *)self->_effectDescriptor allowSkipOutColorBufferWrite])
  {
    v164 = [(PTVFXRenderEffect *)self->_vfxEffect activeReactions];
    if ([v164 count])
    {
    }
    else
    {
      int64_t debugType = self->_debugType;

      if (!debugType)
      {
        [v8 setOutColorBufferWriteSkipped:1];
        goto LABEL_182;
      }
    }
  }
  [(PTEffectRenderer *)self copyInYUV:v203 toOutYUV:v198];
LABEL_182:
  if (!((v40 >> 2) & 1 | !v199))
  {
    uint64_t v178 = [(PTMetalContext *)self->_metalContext commandBuffer];
    v77 |= [(PTEffectRenderer *)self renderReaction:v178 effectRenderRequest:v8];
  }
  objc_initWeak(buf, self);
  uint64_t v179 = [(PTMetalContext *)self->_metalContext commandBuffer];
  v209[0] = MEMORY[0x1E4F143A8];
  v209[1] = 3221225472;
  v209[2] = __59__PTEffectRenderer_render_waitUntilCompleted_gpuCompleted___block_invoke;
  v209[3] = &unk_1E6884898;
  objc_copyWeak(&v211, buf);
  id v210 = v201;
  [v179 addScheduledHandler:v209];

  uint64_t v180 = [(PTMetalContext *)self->_metalContext commandBuffer];
  v207[0] = MEMORY[0x1E4F143A8];
  v207[1] = 3221225472;
  v207[2] = __59__PTEffectRenderer_render_waitUntilCompleted_gpuCompleted___block_invoke_109;
  v207[3] = &unk_1E68848C0;
  id v208 = v196;
  [v180 addCompletedHandler:v207];

  metalContext = self->_metalContext;
  if (v187) {
    [(PTMetalContext *)metalContext commitAndWaitUntilCompleted];
  }
  else {
    [(PTMetalContext *)metalContext commitAndWaitUntilScheduled];
  }
  [v8 setReactions:0];
  if (v205) {
    ++self->_networkFrameIndex;
  }
  [v8 frameTimeSeconds];
  self->_lastFrameTime = v182;

  objc_destroyWeak(&v211);
  objc_destroyWeak(buf);

  int v167 = 1;
  v165 = v198;
  v76 = v191;
LABEL_190:

  if (v167)
  {
    if (![(PTMetalContext *)self->_metalContext isCommandBufferCommitted])
    {
      v183 = _PTLogSystem();
      if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR)) {
        -[PTEffect render:]();
      }

      v77 |= 0xFFFFFFF7;
    }
    ++self->_frameIndex;
    self->_lastEffectType = [v8 effectType];
  }
  else
  {
    int v77 = -10;
  }

  return v77;
}

- (id)activeReactions
{
  v2 = [(PTVFXRenderEffect *)self->_vfxEffect activeReactions];
  v3 = (void *)[v2 copy];

  return v3;
}

- (int)runGestureDetection:(id)a3 asyncWork:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 detectedObjects];
  int v9 = [v8 objectForKeyedSubscript:@"DetectedObjectsInfo"];
  double v10 = v9;
  if (v9)
  {
    id v11 = v9;

    id v8 = v11;
  }
  uint64_t v12 = [v8 objectForKeyedSubscript:@"HumanHands"];
  unint64_t v13 = [v12 objectForKeyedSubscript:@"ObjectsArray"];

  BOOL v14 = [v8 objectForKeyedSubscript:@"HumanFaces"];
  BOOL v15 = [v14 objectForKeyedSubscript:@"ObjectsArray"];

  if (!v8 || self->_reactionProvider)
  {
    if (self->_externalHandDetectionsAvailable && !v13)
    {
      double v30 = _PTLogSystem();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[PTEffectRenderer runGestureDetection:asyncWork:]();
      }
    }
  }
  else
  {
    self->_externalHandDetectionsAvailable = v13 != 0;
    int v16 = _PTLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      if (self->_externalHandDetectionsAvailable) {
        uint64_t v17 = @"YES";
      }
      else {
        uint64_t v17 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v17;
      _os_log_impl(&dword_1D0778000, v16, OS_LOG_TYPE_INFO, "External hand detections available: %@", buf, 0xCu);
    }

    uint64_t v18 = [PTEffectReactionProvider alloc];
    [(PTEffectDescriptor *)self->_effectDescriptor colorSize];
    int v19 = -[PTEffectReactionProvider initWithFrameSize:sharedResources:asyncInitQueue:externalHandDetectionsEnabled:](v18, "initWithFrameSize:sharedResources:asyncInitQueue:externalHandDetectionsEnabled:", self->_sharedResources, self->_asyncInitQueue, self->_externalHandDetectionsAvailable);
    reactionProvider = self->_reactionProvider;
    self->_reactionProvider = v19;

    uint64_t v21 = self->_reactionProvider;
    if (!v21)
    {
      unint64_t v22 = _PTLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[PTEffectRenderer runGestureDetection:asyncWork:](v22, v23, v24, v25, v26, v27, v28, v29);
      }

      uint64_t v21 = self->_reactionProvider;
    }
    [(PTEffectDebugLayer *)self->_debugLayer setReactionProvider:v21];
  }
  if (self->_reactionProvider)
  {
    id v31 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v32 = [v6 reactions];
    v57 = (void *)[v31 initWithArray:v32];

    [v6 frameTimeSeconds];
    uint64_t v34 = (uint64_t)(v33 * 100000.0);
    if (v6) {
      [v6 transform];
    }
    else {
      memset(v62, 0, sizeof(v62));
    }
    uint64_t v35 = +[PTUtil getRotationDegreesFromAffineTransform:v62];
    dispatch_queue_t v36 = self->_reactionProvider;
    uint64_t v37 = [v6 inColorBuffer];
    *(void *)buf = v34;
    *(void *)&buf[8] = 0x1000186A0;
    *(void *)&buf[16] = 0;
    [(PTEffectReactionProvider *)v36 updateWithFrame:v37 withTimeStamp:buf withRotationDegrees:v35 withDetectedHands:v13 withDetectedFaces:v15 asyncWork:v7];
    double v38 = [(PTEffectReactionProvider *)self->_reactionProvider latestReactions];
    unint64_t v39 = v38;
    if (v38 && [v38 count])
    {
      uint64_t v51 = v15;
      uint64_t v52 = v13;
      float v53 = v10;
      v54 = v8;
      id v55 = v7;
      id v56 = v6;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      uint64_t v50 = v39;
      id v40 = v39;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v58 objects:v63 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v59;
        do
        {
          uint64_t v44 = 0;
          do
          {
            if (*(void *)v59 != v43) {
              objc_enumerationMutation(v40);
            }
            char v45 = *(void **)(*((void *)&v58 + 1) + 8 * v44);
            uint64_t v46 = _PTLogSystem();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v47 = [v45 triggerID];
              uint64_t v48 = [v45 emoji];
              *(_DWORD *)buf = 134218242;
              *(void *)&buf[4] = v47;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v48;
              _os_log_debug_impl(&dword_1D0778000, v46, OS_LOG_TYPE_DEBUG, "PTEffect: Detected reaction with ID %li, type %@", buf, 0x16u);
            }
            ++v44;
          }
          while (v42 != v44);
          uint64_t v42 = [v40 countByEnumeratingWithState:&v58 objects:v63 count:16];
        }
        while (v42);
      }

      [v57 addObjectsFromArray:v40];
      id v7 = v55;
      double v10 = v53;
      BOOL v15 = v51;
      unint64_t v13 = v52;
    }
    objc_msgSend(v6, "setReactions:", v57, v50, v51, v52, v53, v54, v55, v56);
  }
  return 0;
}

+ (BOOL)useStudioLightFromSegmentation:(id)a3
{
  v3 = FTGetChipIdentifier();
  if ([v3 isEqualToString:@"H13"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"H14"];
  }

  return v4;
}

- (void)setDebug:(int64_t)a3
{
  self->_int64_t debugType = a3;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)lowResDisparitySizeFromEffectDescriptor
{
  [(PTEffectDescriptor *)self->_effectDescriptor colorSize];
  unint64_t v5 = +[PTEffectUtil aspectRatio:](PTEffectUtil, "aspectRatio:");
  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var0 = 0;
  [(PTEffectDescriptor *)self->_effectDescriptor colorSize];
  double v7 = v6;
  result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[(PTEffectDescriptor *)self->_effectDescriptor colorSize];
  unint64_t v10 = 288;
  if (v5 == 1) {
    unint64_t v10 = 320;
  }
  uint64_t v11 = 216;
  if (v5 == 1) {
    uint64_t v11 = 176;
  }
  if (v7 <= v9) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  if (v7 > v9) {
    unint64_t v10 = v11;
  }
  retstr->var0 = v12;
  retstr->var1 = v10;
  retstr->var2 = 1;
  return result;
}

- (void)dealloc
{
  textureCache = self->_textureCache;
  if (textureCache) {
    CFRelease(textureCache);
  }
  v4.receiver = self;
  v4.super_class = (Class)PTEffectRenderer;
  [(PTEffectRenderer *)&v4 dealloc];
}

- (id)copyTemporalState:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [[PTEffectTemporalState alloc] initWithMetalContext:self->_metalContext];
  [(PTEffectTemporalState *)v5 saveState:v4 cvmNetwork:self->_cvmNetwork msrColorPyramid:self->_msrColorPyramid];

  return v5;
}

- (void)reset:(id)a3
{
  self->_frameIndex = 0;
  self->_networkFrameIndex = 0;
  [(PTEffectTemporalFilter *)self->_temporalFilter reset];
  [(PTCVMNetwork *)self->_cvmNetwork reset];
  [(PTEffectRelighting *)self->_effectRelighting reset];
  personSegmentation = self->_personSegmentation;

  [(PTEffectPersonSegmentation *)personSegmentation reset];
}

void __59__PTEffectRenderer_render_waitUntilCompleted_gpuCompleted___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          dispatch_async(WeakRetained[3], *(dispatch_block_t *)(*((void *)&v8 + 1) + 8 * i));
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
  else
  {
    v3 = _PTLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59__PTEffectRenderer_render_waitUntilCompleted_gpuCompleted___block_invoke_cold_1();
    }
  }
}

uint64_t __59__PTEffectRenderer_render_waitUntilCompleted_gpuCompleted___block_invoke_109(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)copyInYUV:(id)a3 toOutYUV:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [v7 texLuma];
  uint64_t v9 = [v8 iosurface];

  long long v10 = [v6 texLuma];
  uint64_t v11 = [v10 iosurface];

  if (v9 && v11)
  {
    msrColorPyramid = self->_msrColorPyramid;
    uint64_t v13 = [v7 texLuma];
    uint64_t v14 = [v13 width];
    BOOL v15 = [v7 texLuma];

    uint64_t v16 = [v15 height];
    v17.i64[0] = v14;
    v17.i64[1] = v16;
    [(PTMSRResize *)msrColorPyramid rotate:v9 crop:0 rotationDegree:v11 toDest:1 synchronous:*(double *)vcvt_hight_f32_f64(0, vcvtq_f64_u64(v17)).i64];
  }
  else
  {
    uint64_t v18 = [(PTMetalContext *)self->_metalContext commandBuffer];

    if (!v18)
    {
      int v19 = _PTLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:].cold.5(v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    uint64_t v27 = [(PTMetalContext *)self->_metalContext textureUtil];
    uint64_t v28 = [(PTMetalContext *)self->_metalContext commandBuffer];
    uint64_t v29 = [v7 texLuma];
    double v30 = [v6 texLuma];
    [v27 copy:v28 inTex:v29 outTex:v30];

    id v31 = [(PTMetalContext *)self->_metalContext textureUtil];
    v32 = [(PTMetalContext *)self->_metalContext commandBuffer];
    double v33 = [v7 texChroma];

    uint64_t v34 = [v6 texChroma];
    [v31 copy:v32 inTex:v33 outTex:v34];
  }
}

- (int)renderReaction:(id)a3 effectRenderRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = ([v7 effectType] & 0x40) != 0 && objc_msgSend(v7, "inBackgroundReplacementBuffer") != 0;
  uint64_t v9 = [(PTVFXRenderEffect *)self->_vfxEffect activeReactions];
  vfxRenderTarget = (MTLTexture *)[v9 count];

  if (vfxRenderTarget)
  {
    [(PTVFXRenderEffect *)self->_vfxEffect depthNearFar];
    double v12 = v11;
    BOOL v13 = [(PTVFXRenderEffect *)self->_vfxEffect reverseZ];
    [v7 outColorROI];
    if (v14 <= 0.0 || ([v7 outColorROI], v15 <= 0.0))
    {
      uint64_t v18 = _PTLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[PTEffectRenderer renderReaction:effectRenderRequest:]();
      }
      LODWORD(vfxRenderTarget) = -10;
    }
    else
    {
      if ([v7 outPersonSegmentationMatteBuffer])
      {
        uint64_t v16 = [v7 outPersonSegmentationMatteBuffer];
        uint64x2_t v17 = [(PTMetalContext *)self->_metalContext device];
        uint64_t v18 = +[PTPixelBufferUtil createTextureFromPixelBuffer:v16 device:v17 textureCache:self->_textureCache sRGB:0];
      }
      else if (v8)
      {
        uint64_t v18 = self->_upscaledPersonSegmentation;
      }
      else
      {
        uint64_t v18 = 0;
      }
      double Width = (double)CVPixelBufferGetWidth((CVPixelBufferRef)[v7 outColorBuffer]);
      [v7 outColorROI];
      float v21 = v20 * Width;
      unint64_t v22 = vcvtas_u32_f32(v21);
      double Height = (double)CVPixelBufferGetHeight((CVPixelBufferRef)[v7 outColorBuffer]);
      [v7 outColorROI];
      float v25 = v24 * Height;
      unint64_t v26 = vcvtas_u32_f32(v25);
      if ([(MTLTexture *)self->_vfxRenderTarget width] != v22
        || [(MTLTexture *)self->_vfxRenderTarget height] != v26)
      {
        valuePtr[0] = v22;
        valuePtr[1] = v26;
        valuePtr[2] = 1;
        [(PTEffectRenderer *)self createVfxTextures:valuePtr];
      }
      depthConverter = self->_depthConverter;
      if (v18)
      {
        uint64_t v28 = [v7 inBilbyAlphaMaskTexture];
        vfxDepthBuffer = self->_vfxDepthBuffer;
        [v7 reactionsCombinedCropRect];
        LODWORD(v30) = 0.75;
        [(PTDepthConverter *)depthConverter segmentationToDepth:v6 inSegmentation:v18 inAlphaMask:v28 outDepth:vfxDepthBuffer depthNearFar:v13 segmentationDepthNearFar:v12 reverseZ:5.27765665e13 threshold:v30 cropRect:v31];
      }
      else
      {
        disparityCenteredUpscaledReactions = self->_disparityCenteredUpscaledReactions;
        double v33 = self->_vfxDepthBuffer;
        useDisparityBufferForReactions = self->_useDisparityBufferForReactions;
        [v7 reactionsCombinedCropRect];
        [(PTDepthConverter *)depthConverter thresholdedDisparityToDepth:v6 inBaseDisparity:disparityCenteredUpscaledReactions outDepth:v33 depthNearFar:v13 segmentationDepthNearFar:useDisparityBufferForReactions disparityThresholdNearFar:v12 reverseZ:5.27765665e13 useDisparityBuffer:-5.2386921e-11 cropRect:v35];
      }
      dispatch_queue_t v36 = self->_vfxDepthBuffer;
      vfxRenderTarget = self->_vfxRenderTarget;
      uint64_t v37 = self->_disparityCenteredUpscaledReactions;
      vfxEffect = self->_vfxEffect;
      unint64_t v39 = [(PTEffectTemporalFilter *)self->_temporalFilter disparityFiltered];
      LODWORD(vfxRenderTarget) = [(PTVFXRenderEffect *)vfxEffect renderWithBackgroundDimming:v6 effectRGBA:vfxRenderTarget inCenteredDisparity:v37 inSegmentation:v18 effectDepth:v36 disparityFiltered:v39 focusDisparityModifiers:self->_focusDisparityModifiers renderRequest:v7 debugType:self->_debugType];

      LODWORD(valuePtr[0]) = [(PTVFXRenderEffect *)self->_vfxEffect maxReactionEffectComplexity];
      id v40 = (const void *)[v7 outColorBuffer];
      CFNumberRef v41 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
      CMSetAttachment(v40, @"ReactionEffectComplexity", v41, 1u);
    }
  }
  return (int)vfxRenderTarget;
}

+ (PTEffectPixelBufferDescriptor)segmentationMatteFormatForColorSize:(SEL)a3
{
  return +[PTEffectPersonSegmentation upscaledSegmentationMatteFormatForColorSize:](PTEffectPersonSegmentation, "upscaledSegmentationMatteFormatForColorSize:", a4.width, a4.height);
}

- (void)removeAllActiveReactions
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedResources, 0);
  objc_storeStrong((id *)&self->_humanDetections, 0);
  objc_storeStrong((id *)&self->_asyncInitQueue, 0);
  objc_storeStrong((id *)&self->_depthConverter, 0);
  objc_storeStrong((id *)&self->_vfxRenderTarget, 0);
  objc_storeStrong((id *)&self->_vfxDepthBuffer, 0);
  objc_storeStrong((id *)&self->_vfxEffect, 0);
  objc_storeStrong((id *)&self->_personSegmentation, 0);
  objc_storeStrong((id *)&self->_reactionProvider, 0);
  objc_storeStrong((id *)&self->_temporalFilter, 0);
  objc_storeStrong((id *)&self->_diffuseEstimation, 0);
  objc_storeStrong((id *)&self->_effectDescriptor, 0);
  objc_storeStrong((id *)&self->_effectUtil, 0);
  objc_storeStrong((id *)&self->_util, 0);
  objc_storeStrong((id *)&self->_debugLayer, 0);
  objc_storeStrong((id *)&self->_sdofRenderRequest, 0);
  objc_storeStrong((id *)&self->_colorConversion, 0);
  objc_storeStrong((id *)&self->_effectRelighting, 0);
  objc_storeStrong((id *)&self->_cvmNetwork, 0);
  objc_storeStrong((id *)&self->_guideRGBACoefficients, 0);
  objc_storeStrong((id *)&self->_guideRGBAUpscale, 0);
  objc_storeStrong((id *)&self->_guidedFilter, 0);
  objc_storeStrong((id *)&self->_useDisparityBufferForReactions, 0);
  objc_storeStrong((id *)&self->_studioLightEffectModifier, 0);
  objc_storeStrong((id *)&self->_focusDisparityModifiers, 0);
  objc_storeStrong((id *)&self->_msrColorPyramid, 0);
  objc_storeStrong((id *)&self->_focusDisparityRaw, 0);
  objc_storeStrong((id *)&self->_lastFocus, 0);
  objc_storeStrong((id *)&self->_faceDisparityArray, 0);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_intermediateYUV[i + 1], 0);
  objc_storeStrong((id *)&self->_diffuse, 0);
  objc_storeStrong((id *)&self->_backgroundReplacement, 0);
  objc_storeStrong((id *)&self->_upscaledPersonSegmentation, 0);
  objc_storeStrong((id *)&self->_disparityCenteredUpscaledWithScreenCaptureRect, 0);
  objc_storeStrong((id *)&self->_disparityCenteredUpscaledReactions, 0);
  objc_storeStrong((id *)&self->_disparityCenteredUpscaledSDOF, 0);
  objc_storeStrong((id *)&self->_renderState, 0);
  objc_storeStrong((id *)&self->_renderPipeline, 0);
  objc_storeStrong((id *)&self->_asyncQueue, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.19(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.21(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.23(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.25(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:.cold.26()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "VFX init failed", v2, v3, v4, v5, v6);
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.27(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.29(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.31(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.32(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.33(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:.cold.34()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Invalid disparity size. Using 320 x 176", v2, v3, v4, v5, v6);
}

- (void)initWithDescriptor:(void *)a1 metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:.cold.36(void *a1)
{
  [a1 floatValue];
  OUTLINED_FUNCTION_4_3(v1);
  OUTLINED_FUNCTION_10(&dword_1D0778000, v2, v3, "defaults write com.apple.coremedia PTEffectFocusDisparityExponentialMovingAverageStudioLight %f", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(void *)a1 metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:.cold.37(void *a1)
{
  [a1 floatValue];
  OUTLINED_FUNCTION_4_3(v1);
  OUTLINED_FUNCTION_10(&dword_1D0778000, v2, v3, "defaults write com.apple.coremedia PTEffectFocusDisparityExponentialMovingAverage %f", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(void *)a1 metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:.cold.38(void *a1)
{
  [a1 floatValue];
  OUTLINED_FUNCTION_4_3(v1);
  OUTLINED_FUNCTION_10(&dword_1D0778000, v2, v3, "defaults write com.apple.coremedia PTEffectFocusDisparityMax %f", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:.cold.39()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Error allocating texture cache", v2, v3, v4, v5, v6);
}

- (void)render:waitUntilCompleted:gpuCompleted:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Missing effectRenderRequest.outPersonSegmentationMatteBuffer", v2, v3, v4, v5, v6);
}

- (void)render:(int)a1 waitUntilCompleted:(NSObject *)a2 gpuCompleted:.cold.3(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Error executing render pipeline %i", (uint8_t *)v2, 8u);
}

- (void)render:(int)a1 waitUntilCompleted:(NSObject *)a2 gpuCompleted:.cold.4(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Error guidedFilter %i", (uint8_t *)v2, 8u);
}

- (void)render:(uint64_t)a3 waitUntilCompleted:(uint64_t)a4 gpuCompleted:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)render:waitUntilCompleted:gpuCompleted:.cold.7()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Rotation is not supported for segmentation", v2, v3, v4, v5, v6);
}

- (void)render:waitUntilCompleted:gpuCompleted:.cold.10()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(&dword_1D0778000, v0, OS_LOG_TYPE_ERROR, "Assertion failed %s %i", (uint8_t *)v1, 0x12u);
}

void __59__PTEffectRenderer_render_waitUntilCompleted_gpuCompleted___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Async task during destruction", v2, v3, v4, v5, v6);
}

- (void)runGestureDetection:(uint64_t)a3 asyncWork:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)runGestureDetection:asyncWork:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "External hand detections expected but not provided in effectRenderRequest.detectedObjects", v2, v3, v4, v5, v6);
}

- (void)renderReaction:effectRenderRequest:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Invalid outColorROI", v2, v3, v4, v5, v6);
}

@end