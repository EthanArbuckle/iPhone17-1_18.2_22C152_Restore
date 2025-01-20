@interface PTRaytracingV14
- (PTRaytracingV14)initWithMetalContext:(id)a3 renderEffects:(id)a4 colorSize:(CGSize)a5 disparitySize:(CGSize)a6 debugRendering:(int64_t)a7 verbose:(BOOL)a8 options:(id)a9 quality:(int)a10;
- (int)prewarm;
- (int)renderContinuousWithSource:(id)a3 renderRequest:(id)a4;
- (unint64_t)minimumResourceHeapSize;
@end

@implementation PTRaytracingV14

- (PTRaytracingV14)initWithMetalContext:(id)a3 renderEffects:(id)a4 colorSize:(CGSize)a5 disparitySize:(CGSize)a6 debugRendering:(int64_t)a7 verbose:(BOOL)a8 options:(id)a9 quality:(int)a10
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  double v15 = a5.height;
  double v16 = a5.width;
  id v19 = a3;
  id v20 = a9;
  v91.receiver = self;
  v91.super_class = (Class)PTRaytracingV14;
  v21 = [(PTRaytracingV14 *)&v91 init];
  if (!v21) {
    goto LABEL_21;
  }
  PTKTraceInit();
  v21->_disparitySize.CGFloat width = width;
  v21->_disparitySize.CGFloat height = height;
  objc_storeStrong((id *)&v21->_metalContext, a3);
  v21->_debugRendering = a7;
  objc_storeStrong((id *)&v21->_options, a9);
  +[PTRaytracingUtilsV1 createFocusEdge];
  v21->_focusEdge.CGFloat width = v22;
  v21->_focusEdge.gradientThreshold = v23;
  v21->_focusEdge.gradientWeight = v24;
  v21->_focusEdge.minMaxThreshold = v25;
  v26 = [[PTColorConversion alloc] initWithMetalContext:v19];
  colorConversion = v21->_colorConversion;
  v21->_colorConversion = v26;

  if (!v21->_colorConversion)
  {
    v35 = _PTLogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingV14 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:](v35, v36, v37, v38, v39, v40, v41, v42);
    }
    goto LABEL_20;
  }
  v28 = [[PTRaytracingUtilsV1 alloc] initWithMetalContext:v21->_metalContext];
  raytracingUtils = v21->_raytracingUtils;
  v21->_raytracingUtils = v28;

  if (!v21->_raytracingUtils)
  {
    v35 = _PTLogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingV14 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:](v35, v43, v44, v45, v46, v47, v48, v49);
    }
    goto LABEL_20;
  }
  v30 = [[PTUtil alloc] initWithMetalContext:v21->_metalContext];
  util = v21->_util;
  v21->_util = v30;

  if (!v21->_util)
  {
    v35 = _PTLogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingV14 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:](v35, v50, v51, v52, v53, v54, v55, v56);
    }
    goto LABEL_20;
  }
  v21->_bicubicUpscale = 0;
  v32 = [v20 objectForKeyedSubscript:&unk_1F26C0AD8];
  v21->_injectedRGBAPyramid = v32 != 0;

  if (v21->_injectedRGBAPyramid)
  {
    uint64_t v33 = [v20 objectForKeyedSubscript:&unk_1F26C0AD8];
    rgbaPyramid = v21->_rgbaPyramid;
    v21->_rgbaPyramid = (PTPyramid *)v33;
  }
  else
  {
    v57 = [PTPyramid alloc];
    metalContext = v21->_metalContext;
    v59 = [(PTRaytracingV14RenderState *)v21->_renderState qualitySettings];
    uint64_t v60 = -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:](v57, "initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:", metalContext, 115, 0, [v59 doFirstLevelGaussianDownsample], 4, v16, v15);
    v61 = v21->_rgbaPyramid;
    v21->_rgbaPyramid = (PTPyramid *)v60;

    if (!v21->_rgbaPyramid)
    {
      v35 = _PTLogSystem();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[PTRaytracingV14 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.4(v35, v80, v81, v82, v83, v84, v85, v86);
      }
      goto LABEL_20;
    }
  }
  v62 = [PTRaytracingV14RenderState alloc];
  v88 = v21->_metalContext;
  v89 = v62;
  unsigned int v90 = a10;
  v63 = v21->_util;
  v64 = [(PTPyramid *)v21->_rgbaPyramid mipmapTexture];
  uint64_t v65 = [v64 pixelFormat];
  options = v21->_options;
  id v67 = objc_alloc(MEMORY[0x1E4F1C978]);
  v68 = [(PTPyramid *)v21->_rgbaPyramid mipmapTexture];
  v69 = objc_msgSend(v67, "initWithObjects:", v68, 0);
  uint64_t v70 = -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:](v89, "initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:", v88, v63, v90, a7, v65, options, v16, v15, v21->_disparitySize.width, v21->_disparitySize.height, v69);
  renderState = v21->_renderState;
  v21->_renderState = (PTRaytracingV14RenderState *)v70;

  if (!v21->_renderState)
  {
    v35 = _PTLogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingV14 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.5(v35, v73, v74, v75, v76, v77, v78, v79);
    }
LABEL_20:

LABEL_21:
    v72 = 0;
    goto LABEL_22;
  }
  v72 = v21;
LABEL_22:

  return v72;
}

- (int)prewarm
{
  return 0;
}

- (int)renderContinuousWithSource:(id)a3 renderRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 renderState];
  [v8 quality];
  [v7 fNumber];
  [v7 focusDisparity];
  [v7 alphaLowLight];
  kdebug_trace();

  uint64_t v143 = 0;
  long long v141 = 0u;
  long long v142 = 0u;
  [(PTRaytracingV14RenderState *)self->_renderState pyramidSamplingFraction];
  int v10 = v9;
  [(PTRaytracingV14RenderState *)self->_renderState anamorphicFactor];
  int v12 = v11;
  [(PTRaytracingV14RenderState *)self->_renderState raytracingRadiusLocal];
  int v14 = v13;
  uint64_t v15 = [(PTRaytracingV14RenderState *)self->_renderState rayCount];
  [(PTRaytracingV14RenderState *)self->_renderState colorSize];
  double v17 = v16;
  v18 = [(PTRaytracingV14RenderState *)self->_renderState qualitySettings];
  uint64_t v19 = [v18 doMacroApertureLimit];
  LODWORD(v20) = v10;
  LODWORD(v21) = v12;
  LODWORD(v22) = v14;
  +[PTRaytracingUtilsV1 createFocusObject:v7 pyramidSamplingFraction:v15 anamorphicFactor:v19 raytracingRadiusLocal:v20 rayCount:v21 colorSize:v22 doMacroApertureLimit:v17];

  long long v139 = 0u;
  long long v140 = 0u;
  if (v7) {
    [v7 scissorRect];
  }
  if (self->_injectedRGBAPyramid) {
    goto LABEL_4;
  }
  float v23 = [(PTRaytracingV14RenderState *)self->_renderState qualitySettings];
  int v24 = [v23 doFirstLevelGaussianDownsample];

  if (v24)
  {
    colorConversion = self->_colorConversion;
    v26 = [v7 sourceColor];
    v27 = [(PTPyramid *)self->_rgbaPyramid mipmapLevels];
    v28 = [v27 objectAtIndexedSubscript:0];
    LODWORD(colorConversion) = [(PTColorConversion *)colorConversion convertRGBLinearFromPTTexture:v6 inPTTexture:v26 outRGBA:v28];

    if (colorConversion)
    {
      v29 = _PTLogSystem();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[PTEffect render:]();
      }
    }
    int v30 = [(PTPyramid *)self->_rgbaPyramid updatePyramid:v6 offset:0];
    if (v30)
    {
      int v31 = v30;
      v32 = _PTLogSystem();
      int v125 = v31;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      goto LABEL_20;
    }
LABEL_4:
    int v125 = 0;
    goto LABEL_21;
  }
  raytracingUtils = self->_raytracingUtils;
  v34 = [(PTPyramid *)self->_rgbaPyramid mipmapLevels];
  LODWORD(raytracingUtils) = [(PTRaytracingUtilsV1 *)raytracingUtils convertRGBPyramidFromSource:v6 renderRequest:v7 rgbaPyramidArray:v34 skipLevel0:1];

  if (raytracingUtils)
  {
    v35 = _PTLogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[PTEffect render:]();
    }
  }
  int v36 = [(PTPyramid *)self->_rgbaPyramid updatePyramid:v6 offset:1];
  if (!v36) {
    goto LABEL_4;
  }
  int v37 = v36;
  v32 = _PTLogSystem();
  int v125 = v37;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
LABEL_19:
  }
    -[PTEffect render:]();
LABEL_20:

LABEL_21:
  uint64_t v38 = [(PTRaytracingV14RenderState *)self->_renderState qualitySettings];
  int v39 = [v38 doCenterDisparity];

  if (v39)
  {
    uint64_t v40 = self->_raytracingUtils;
    uint64_t v41 = [v7 sourceDisparity];
    uint64_t v42 = [(PTRaytracingV14RenderState *)self->_renderState disparityDiff];
    long long v136 = v141;
    long long v137 = v142;
    uint64_t v138 = v143;
    [(PTRaytracingUtilsV1 *)v40 centerDisparityOnFocus:v6 inDisparity:v41 outDisparity:v42 focusObject:&v136];

    uint64_t v43 = [(PTRaytracingV14RenderState *)self->_renderState disparityDiff];
  }
  else
  {
    uint64_t v43 = [v7 sourceDisparity];
  }
  uint64_t v44 = (void *)v43;
  uint64_t v45 = [(PTRaytracingV14RenderState *)self->_renderState globalReduction];

  if (v45)
  {
    uint64_t v46 = [(PTRaytracingV14RenderState *)self->_renderState globalReduction];
    uint64_t v47 = [(PTRaytracingV14RenderState *)self->_renderState disparityDiffGlobalMinMax];
    [v46 parallelReductionMinMax:v6 inTexture:v44 globalMinMaxBuffer:v47];

    uint64_t v48 = self->_raytracingUtils;
    uint64_t v49 = [(PTRaytracingV14RenderState *)self->_renderState disparityEdgesTemp];
    uint64_t v50 = [(PTRaytracingV14RenderState *)self->_renderState disparityEdges];
    uint64_t v51 = [(PTRaytracingV14RenderState *)self->_renderState disparityDiffGlobalMinMax];
    [(PTRaytracingV14RenderState *)self->_renderState edgeTolerance];
    long long v136 = v141;
    long long v137 = v142;
    uint64_t v138 = v143;
    -[PTRaytracingUtilsV1 detectDilatedEdges:inDisparity:tempEdges:outEdges:focusObject:disparityDiffMinMax:edgeTolerance:](v48, "detectDilatedEdges:inDisparity:tempEdges:outEdges:focusObject:disparityDiffMinMax:edgeTolerance:", v6, v44, v49, v50, &v136, v51);
  }
  uint64_t v52 = [(PTRaytracingV14RenderState *)self->_renderState qualitySettings];
  int v53 = [v52 doDisparityUpsampling];

  if (v53)
  {
    rgbaPyramid = self->_rgbaPyramid;
    uint64_t v55 = [(PTRaytracingV14RenderState *)self->_renderState disparityUpscale];
    uint64_t v56 = [v55 upscaledTexture];
    uint64_t v57 = [v56 width];
    v58 = [(PTRaytracingV14RenderState *)self->_renderState disparityUpscale];
    v59 = [v58 upscaledTexture];
    v135[0] = v57;
    v135[1] = [v59 height];
    v135[2] = 0;
    uint64_t v60 = [(PTRaytracingV14RenderState *)self->_renderState qualitySettings];
    v61 = -[PTPyramid findMipmapLevelLargerThan:fromLevel:](rgbaPyramid, "findMipmapLevelLargerThan:fromLevel:", v135, [v60 doFirstLevelGaussianDownsample] ^ 1);

    v62 = [(PTRaytracingV14RenderState *)self->_renderState disparityUpscale];
    v63 = [v7 sourceColor];
    uint64_t v64 = objc_msgSend(v62, "guidedUpsampling:inDisparity:inRGBA:colorDepth:", v6, v44, v61, objc_msgSend(v63, "YCbCrColorDepth"));

    uint64_t v44 = (void *)v64;
  }
  uint64_t v65 = [(PTRaytracingV14RenderState *)self->_renderState focusEdgeMask];

  if (v65)
  {
    v66 = self->_raytracingUtils;
    id v67 = [(PTRaytracingV14RenderState *)self->_renderState focusEdgeMask];
    HIDWORD(v68) = DWORD1(v141);
    HIDWORD(v69) = DWORD1(v142);
    long long v136 = v141;
    long long v137 = v142;
    uint64_t v138 = v143;
    *(float *)&double v68 = self->_focusEdge.width;
    *(float *)&double v69 = self->_focusEdge.gradientThreshold;
    *(float *)&double v70 = self->_focusEdge.gradientWeight;
    *(float *)&double v71 = self->_focusEdge.minMaxThreshold;
    -[PTRaytracingUtilsV1 focusEdgeMask:inDisparityDiff:focusObject:focusEdge:outFocusEdgeMask:](v66, "focusEdgeMask:inDisparityDiff:focusObject:focusEdge:outFocusEdgeMask:", v6, v44, &v136, v67, v68, v69, v70, v71);
  }
  v72 = [v7 sourceDisparity];
  float v127 = (float)(unint64_t)[v72 width];
  uint64_t v73 = [v7 sourceDisparity];
  unint64_t v74 = [v73 height];
  *(float *)&uint64_t v75 = v127;
  *((float *)&v75 + 1) = (float)v74;
  uint64_t v128 = v75;

  uint64_t v134 = v128;
  unint64_t v126 = v139;
  uint64_t v76 = [(PTRaytracingV14RenderState *)self->_renderState qualitySettings];
  [v76 renderDownscale];
  LODWORD(v128) = v77;
  float32x2_t v78 = vcvt_f32_s32((int32x2_t)vand_s8((int8x8_t)vmovn_s64((int64x2_t)__PAIR128__(*((unint64_t *)&v139 + 1), v126)), (int8x8_t)0xFFFF0000FFFFLL));
  uint64_t v79 = [(PTRaytracingV14RenderState *)self->_renderState qualitySettings];
  [v79 renderDownscale];
  int32x2_t v129 = vcvt_s32_f32(vdiv_f32(v78, (float32x2_t)__PAIR64__(v80, v128)));

  v133[1] = v129.i16[2];
  v133[0] = v129.i16[0];
  v78.f32[0] = (float)(unint64_t)v140;
  uint64_t v81 = [(PTRaytracingV14RenderState *)self->_renderState qualitySettings];
  [v81 renderDownscale];
  unint64_t v83 = vcvtps_u32_f32(v78.f32[0] / v82);
  v78.f32[0] = (float)*((unint64_t *)&v140 + 1);
  uint64_t v84 = [(PTRaytracingV14RenderState *)self->_renderState qualitySettings];
  [v84 renderDownscale];
  unint64_t v86 = vcvtps_u32_f32(v78.f32[0] / v85);

  v87 = [v6 computeCommandEncoder];
  if (!v87)
  {
    v88 = _PTLogSystem();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v88, v89, v90, v91, v92, v93, v94, v95);
    }
  }
  v96 = [(PTRaytracingV14RenderState *)self->_renderState raytracingSDOF];
  [v87 setComputePipelineState:v96];

  v97 = [(PTPyramid *)self->_rgbaPyramid mipmapTexture];
  [v87 setTexture:v97 atIndex:0];

  [v87 setTexture:v44 atIndex:1];
  v98 = [(PTRaytracingV14RenderState *)self->_renderState disparityEdges];
  [v87 setTexture:v98 atIndex:2];

  v99 = [(PTRaytracingV14RenderState *)self->_renderState raytracedRGBRadius];
  [v87 setTexture:v99 atIndex:3];

  v100 = [(PTRaytracingV14RenderState *)self->_renderState focusEdgeMask];
  [v87 setTexture:v100 atIndex:4];

  [v87 setBytes:&v141 length:40 atIndex:0];
  v101 = [(PTRaytracingV14RenderState *)self->_renderState aperturePointsXY];
  [v87 setBuffer:v101 offset:0 atIndex:1];

  v102 = [(PTRaytracingV14RenderState *)self->_renderState randomUChars];
  [v87 setBuffer:v102 offset:0 atIndex:2];

  v103 = [(PTRaytracingV14RenderState *)self->_renderState disparityDiffGlobalMinMax];
  [v87 setBuffer:v103 offset:0 atIndex:3];

  [v87 setBytes:&v134 length:8 atIndex:4];
  [v87 setBytes:v133 length:4 atIndex:5];
  *(void *)&long long v136 = v83;
  *((void *)&v136 + 1) = v86;
  *(void *)&long long v137 = 1;
  int64x2_t v131 = vdupq_n_s64(8uLL);
  uint64_t v132 = 1;
  [v87 dispatchThreads:&v136 threadsPerThreadgroup:&v131];
  [v87 endEncoding];
  v104 = [(PTRaytracingV14RenderState *)self->_renderState raytracedRGBRadius];
  v105 = [(PTRaytracingV14RenderState *)self->_renderState raytracedRGBRadiusUpscaled];

  if (v105)
  {
    v106 = [(PTMetalContext *)self->_metalContext textureUtil];
    v107 = [(PTRaytracingV14RenderState *)self->_renderState raytracedRGBRadius];
    v108 = [(PTRaytracingV14RenderState *)self->_renderState raytracedRGBRadiusUpscaled];
    [v106 copy:v6 inTex:v107 outTex:v108];

    uint64_t v109 = [(PTRaytracingV14RenderState *)self->_renderState raytracedRGBRadiusUpscaled];

    v104 = (void *)v109;
  }
  v110 = [v6 computeCommandEncoder];

  if (!v110)
  {
    v111 = _PTLogSystem();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v111, v112, v113, v114, v115, v116, v117, v118);
    }
  }
  v119 = [(PTRaytracingV14RenderState *)self->_renderState qualitySettings];
  int v120 = [v119 doFirstLevelGaussianDownsample];

  v121 = self->_raytracingUtils;
  if (v120)
  {
    v122 = [(PTPyramid *)self->_rgbaPyramid mipmapTexture];
    v123 = [(PTRaytracingV14RenderState *)self->_renderState randomGaussNoise];
    [(PTRaytracingUtilsV1 *)v121 interpolateRGBRadiusToDest:v110 renderRequest:v7 inRGBA:v122 inRGBRadius:v104 inRandomGauss:v123 bicubicSampling:self->_bicubicUpscale];
  }
  else
  {
    v122 = [(PTRaytracingV14RenderState *)self->_renderState randomGaussNoise];
    [(PTRaytracingUtilsV1 *)v121 interpolateRGBRadiusUsingSourceToDest:v110 renderRequest:v7 inRGBRadius:v104 inRandomGauss:v122 bicubicSampling:self->_bicubicUpscale];
  }

  [v110 endEncoding];
  if (kdebug_is_enabled())
  {
    v130[0] = MEMORY[0x1E4F143A8];
    v130[1] = 3221225472;
    v130[2] = __60__PTRaytracingV14_renderContinuousWithSource_renderRequest___block_invoke;
    v130[3] = &unk_1E68841B0;
    v130[4] = self;
    [v6 addCompletedHandler:v130];
  }

  return v125;
}

void __60__PTRaytracingV14_renderContinuousWithSource_renderRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(*(void *)(a1 + 32) + 8) qualitySettings];
  [v4 doDisparityUpsampling];
  v5 = [*(id *)(*(void *)(a1 + 32) + 8) qualitySettings];
  [v5 renderDownscale];
  kdebug_trace();

  if ([v3 status] != 4)
  {
    id v6 = _PTLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __62__PTRaytracingV4001_renderContinuousWithSource_renderRequest___block_invoke_cold_2(v3, v6);
    }

    if ([v3 status] != 4)
    {
      id v7 = _PTLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __62__PTRaytracingV4001_renderContinuousWithSource_renderRequest___block_invoke_cold_1(v3, v7);
      }
    }
  }
}

- (unint64_t)minimumResourceHeapSize
{
  return 1024;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_util, 0);
  objc_storeStrong((id *)&self->_raytracingUtils, 0);
  objc_storeStrong((id *)&self->_debugLayer, 0);
  objc_storeStrong((id *)&self->_rgbaPyramid, 0);
  objc_storeStrong((id *)&self->_colorConversion, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_renderState, 0);
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end