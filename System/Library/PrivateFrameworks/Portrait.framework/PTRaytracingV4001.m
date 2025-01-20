@interface PTRaytracingV4001
- (PTRaytracingV4001)initWithMetalContext:(id)a3 renderEffects:(id)a4 colorSize:(CGSize)a5 disparitySize:(CGSize)a6 debugRendering:(int64_t)a7 verbose:(BOOL)a8 options:(id)a9 quality:(int)a10;
- (int)prewarm;
- (int)renderContinuousWithSource:(id)a3 renderRequest:(id)a4;
- (unint64_t)minimumResourceHeapSize;
@end

@implementation PTRaytracingV4001

- (PTRaytracingV4001)initWithMetalContext:(id)a3 renderEffects:(id)a4 colorSize:(CGSize)a5 disparitySize:(CGSize)a6 debugRendering:(int64_t)a7 verbose:(BOOL)a8 options:(id)a9 quality:(int)a10
{
  uint64_t v10 = *(void *)&a10;
  double width = a6.width;
  double height = a6.height;
  double v245 = a5.width;
  double v246 = a5.height;
  id v15 = a3;
  id v16 = a9;
  v253.receiver = self;
  v253.super_class = (Class)PTRaytracingV4001;
  v17 = [(PTRaytracingV4001 *)&v253 init];
  if (!v17) {
    goto LABEL_46;
  }
  PTKTraceInit();
  v17->_disparitySize.double width = width;
  v17->_disparitySize.double height = height;
  objc_storeStrong((id *)&v17->_metalContext, a3);
  v17->_debugRendering = a7;
  objc_storeStrong((id *)&v17->_options, a9);
  uint64_t v18 = +[PTQualitySettings createWithQuality:v10 options:v16];
  qualitySettings = v17->_qualitySettings;
  v17->_qualitySettings = (PTQualitySettings *)v18;

  if (v17->_qualitySettings)
  {
    +[PTRaytracingUtils createFocusEdge];
    v17->_focusEdge.double width = v20;
    v17->_focusEdge.gradientThreshold = v21;
    v17->_focusEdge.gradientWeight = v22;
    v17->_focusEdge.minMaxThreshold = v23;
    v17->_skipFullSizeLayer = [(PTQualitySettings *)v17->_qualitySettings quality] < 100;
    v24 = [v16 objectForKeyedSubscript:&unk_1F26C0688];
    v17->_injectedRGBAPyramid = v24 != 0;

    if (v17->_injectedRGBAPyramid)
    {
      uint64_t v25 = [v16 objectForKeyedSubscript:&unk_1F26C0688];
      rgbaPyramid = v17->_rgbaPyramid;
      v17->_rgbaPyramid = (PTPyramid *)v25;

      goto LABEL_8;
    }
    v35 = -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:]([PTPyramid alloc], "initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:", v15, 115, v17->_skipFullSizeLayer, [(PTQualitySettings *)v17->_qualitySettings doFirstLevelGaussianDownsample], 4, v245, v246);
    v36 = v17->_rgbaPyramid;
    v17->_rgbaPyramid = v35;

    if (v17->_rgbaPyramid)
    {
LABEL_8:
      v37 = [[PTRaytracingUtils alloc] initWithMetalContext:v15];
      raytracingUtils = v17->_raytracingUtils;
      v17->_raytracingUtils = v37;

      if (v17->_raytracingUtils)
      {
        v39 = [[PTRaytracingInterpolateResult alloc] initWithMetalContext:v15 useExportQualityNoise:[(PTQualitySettings *)v17->_qualitySettings useExportQualityNoise]];
        raytracingInterpolateResult = v17->_raytracingInterpolateResult;
        v17->_raytracingInterpolateResult = v39;

        if (v17->_raytracingInterpolateResult)
        {
          uint64_t v41 = +[PTPrecomputeRandom computeUnitDiskPoints:v15 numberOfPatternCircles:[(PTQualitySettings *)v17->_qualitySettings numberOfPatternCircles]];
          uint64_t v43 = v42;
          xy = v17->_aperturePoints.xy;
          v17->_aperturePoints.xy = (MTLBuffer *)v41;

          *((_WORD *)&v17->_aperturePoints.rayCount + 2) = WORD2(v43);
          v17->_aperturePoints.rayCount = v43;
          if (v17->_aperturePoints.xy)
          {
            uint64_t v45 = +[PTPrecomputeRandom computeRandomUChars:v15 rayCount:v43];
            randomUChars = v17->_randomUChars;
            v17->_randomUChars = (MTLBuffer *)v45;

            if (v17->_randomUChars)
            {
              v17->_doVisualization = 0;
              BOOL v47 = [(PTQualitySettings *)v17->_qualitySettings doMacroApertureLimit];
              float v48 = 0.0051429;
              if (v47) {
                float v48 = 0.00043025;
              }
              v17->_circleOfConfusionReference = v48;
              v17->_fNumberLimitWeight = 0.33333;
              *(float32x2_t *)&v17->_circleOfConfusionLimitBgFg[4] = vmul_n_f32((float32x2_t)0x3FC0000040800000, v48);
              [(PTQualitySettings *)v17->_qualitySettings circleOfConfusionLimitBackground];
              if (fabsf(v49) != INFINITY)
              {
                [(PTQualitySettings *)v17->_qualitySettings circleOfConfusionLimitBackground];
                *(_DWORD *)&v17->_circleOfConfusionLimitBgFg[4] = v50;
              }
              [(PTQualitySettings *)v17->_qualitySettings circleOfConfusionLimitForeground];
              if (fabsf(v51) != INFINITY)
              {
                [(PTQualitySettings *)v17->_qualitySettings circleOfConfusionLimitForeground];
                *(_DWORD *)&v17->_circleOfConfusionLimitBgFg[8] = v52;
              }
              v17->_kRayCount = v17->_aperturePoints.rayCount;
              _H8 = *((_WORD *)&v17->_aperturePoints.rayCount + 2);
              v54.f64[0] = v245;
              v54.f64[1] = v246;
              *(float32x2_t *)v17->_sourceColorSize = vcvt_f32_f64(v54);
              v54.f64[0] = width;
              v54.f64[1] = height;
              *(float32x2_t *)v17->_sourceDisparitySize = vcvt_f32_f64(v54);
              v17->_anamorphicFactor = 1.2;
              v55 = [v16 objectForKeyedSubscript:&unk_1F26C06A0];

              if (v55)
              {
                v56 = [v16 objectForKeyedSubscript:&unk_1F26C06A0];
                [v56 floatValue];
                v17->_anamorphicFactor = v57;
              }
              __asm { FCVT            S8, H8 }
              v17->_kPyramidSamplingFraction = 0.665;
              v17->_edgeTolerance = 0.025;
              BOOL v252 = 0;
              BOOL v252 = [(PTQualitySettings *)v17->_qualitySettings rayMarch];
              [(PTQualitySettings *)v17->_qualitySettings renderDownscale];
              float v63 = 3.0;
              if (v64 <= 3.0)
              {
                [(PTQualitySettings *)v17->_qualitySettings renderDownscale];
                float v63 = 1.0;
                if (v65 >= 2.0) {
                  float v63 = 2.0;
                }
              }
              [(PTQualitySettings *)v17->_qualitySettings renderDownscale];
              float v67 = v66 + 0.5;
              BOOL v68 = v66 <= 2.0;
              float v69 = 2.5;
              if (!v68) {
                float v69 = v67;
              }
              *(float *)&double v70 = 1.0 / (float)(0.5 - v69);
              *((float *)&v70 + 1) = -v69;
              double v244 = v70;
              v71 = objc_opt_new();
              [v71 setConstantValue:&v17->_kRayCount type:29 withName:@"kRaycount"];
              [v71 setConstantValue:&v252 type:53 withName:@"kRayMarch"];
              [v71 setConstantValue:&v17->_skipFullSizeLayer type:53 withName:@"kSkipFullSizeLayer"];
              LODWORD(v72) = _S8;
              [v71 setConstantFloat:@"kRadiusLocal_float" withName:v72];
              LODWORD(v73) = 0.25;
              [v71 setConstantFloat:@"kRadiusLocalFraction_float" withName:v73];
              *(float *)&double v74 = v63;
              [v71 setConstantFloat:@"kDiameterCoverageLimit_float" withName:v74];
              [v71 setConstantFloat2:@"kFocusBlendCoefficients_float2" withName:v244];
              *(float *)&double v75 = v17->_kPyramidSamplingFraction;
              [v71 setConstantFloat:@"kPyramidSamplingFraction_float" withName:v75];
              LODWORD(v76) = 6.0;
              [v71 setConstantFloat:@"kRayMarchDisparityRadiusTolerance_float" withName:v76];
              LODWORD(v77) = 1017370378;
              [v71 setConstantFloat:@"kHighlightBoostFactor_float" withName:v77];
              uint64_t v78 = [(PTMetalContext *)v17->_metalContext computePipelineStateFor:@"raytracingV4001" withConstants:v71];
              raytracingSDOF = v17->_raytracingSDOF;
              v17->_raytracingSDOF = (MTLComputePipelineState *)v78;

              if (!v17->_raytracingSDOF)
              {
                v146 = _PTLogSystem();
                if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
                  -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.7(v146, v147, v148, v149, v150, v151, v152, v153);
                }
                goto LABEL_82;
              }
              if ([(PTQualitySettings *)v17->_qualitySettings rayMarch])
              {
                v80 = -[PTGlobalReduction initWithMetalContext:textureSize:]([PTGlobalReduction alloc], "initWithMetalContext:textureSize:", v15, width, height);
                globalReduction = v17->_globalReduction;
                v17->_globalReduction = v80;

                if (!v17->_globalReduction)
                {
                  v146 = _PTLogSystem();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.8(v146, v174, v175, v176, v177, v178, v179, v180);
                  }
                  goto LABEL_82;
                }
                v82 = [v15 device];
                uint64_t v83 = [v82 newBufferWithLength:8 options:0];
                disparityDiffGlobalMinMax = v17->_disparityDiffGlobalMinMax;
                v17->_disparityDiffGlobalMinMax = (MTLBuffer *)v83;

                if (!v17->_disparityDiffGlobalMinMax)
                {
                  v146 = _PTLogSystem();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.9(v146, v181, v182, v183, v184, v185, v186, v187);
                  }
                  goto LABEL_82;
                }
                v85 = [(PTMetalContext *)v17->_metalContext textureUtil];
                uint64_t v86 = objc_msgSend(v85, "createWithSize:pixelFormat:", 10, width, height);
                disparityEdges = v17->_disparityEdges;
                v17->_disparityEdges = (MTLTexture *)v86;

                if (!v17->_disparityEdges)
                {
                  v146 = _PTLogSystem();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]0(v146, v202, v203, v204, v205, v206, v207, v208);
                  }
                  goto LABEL_82;
                }
                v88 = [(PTMetalContext *)v17->_metalContext textureUtil];
                uint64_t v89 = objc_msgSend(v88, "createWithSize:pixelFormat:", 10, width, height);
                disparityEdgesTemp = v17->_disparityEdgesTemp;
                v17->_disparityEdgesTemp = (MTLTexture *)v89;

                if (!v17->_disparityEdgesTemp)
                {
                  v146 = _PTLogSystem();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]1(v146, v230, v231, v232, v233, v234, v235, v236);
                  }
                  goto LABEL_82;
                }
              }
              if ([(PTQualitySettings *)v17->_qualitySettings doDisparityUpsampling])
              {
                v91 = [PTGuidedFilter alloc];
                v251[0] = (unint64_t)width;
                v251[1] = (unint64_t)height;
                v251[2] = 1;
                [(PTQualitySettings *)v17->_qualitySettings disparityGuidedFilterEpsilon];
                uint64_t v92 = -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:](v91, "initWithMetalContext:inputSize:epsilon:", v15, v251);
                guidedFilter = v17->_guidedFilter;
                v17->_guidedFilter = (PTGuidedFilter *)v92;

                if (!v17->_guidedFilter)
                {
                  v146 = _PTLogSystem();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]2(v146, v188, v189, v190, v191, v192, v193, v194);
                  }
                  goto LABEL_82;
                }
                [(PTQualitySettings *)v17->_qualitySettings disparityUpsampleFactor];
                CGFloat v95 = width * v94;
                [(PTQualitySettings *)v17->_qualitySettings disparityUpsampleFactor];
                v17->_disparitySizeUpscaled.double width = v95;
                v17->_disparitySizeUpscaled.double height = height * v96;
                v97 = [v15 textureUtil];
                uint64_t v98 = objc_msgSend(v97, "createWithSize:pixelFormat:", 25, v17->_disparitySizeUpscaled.width, v17->_disparitySizeUpscaled.height);
                disparityDiffUpscaled = v17->_disparityDiffUpscaled;
                v17->_disparityDiffUpscaled = (MTLTexture *)v98;

                v100 = v17->_disparityDiffUpscaled;
                if (!v100)
                {
                  v146 = _PTLogSystem();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]3(v146, v209, v210, v211, v212, v213, v214, v215);
                  }
                  goto LABEL_82;
                }
                v101 = v17->_rgbaPyramid;
                uint64_t v102 = [(MTLTexture *)v100 width];
                uint64_t v103 = [(MTLTexture *)v17->_disparityDiffUpscaled height];
                v250[0] = v102;
                v250[1] = v103;
                v250[2] = 1;
                uint64_t v104 = [(PTPyramid *)v101 findMipmapLevelLargerThan:v250];
                guideRGBAUpscale = v17->_guideRGBAUpscale;
                v17->_guideRGBAUpscale = (MTLTexture *)v104;

                v106 = v17->_rgbaPyramid;
                v249[0] = (unint64_t)width;
                v249[1] = (unint64_t)height;
                v249[2] = 1;
                uint64_t v107 = [(PTPyramid *)v106 findMipmapLevelLargerThan:v249];
                guideRGBACoefficients = v17->_guideRGBACoefficients;
                v17->_guideRGBACoefficients = (MTLTexture *)v107;
              }
              else if ([(PTQualitySettings *)v17->_qualitySettings doCenterDisparity])
              {
                v154 = [(PTMetalContext *)v17->_metalContext textureUtil];
                uint64_t v155 = objc_msgSend(v154, "createWithSize:pixelFormat:", 25, width, height);
                disparityDiff = v17->_disparityDiff;
                v17->_disparityDiff = (MTLTexture *)v155;

                if (!v17->_disparityDiff)
                {
                  v146 = _PTLogSystem();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]7(v146, v223, v224, v225, v226, v227, v228, v229);
                  }
                  goto LABEL_82;
                }
              }
              if (![(PTQualitySettings *)v17->_qualitySettings doFocusEdgeMask]) {
                goto LABEL_56;
              }
              v157 = [(PTMetalContext *)v17->_metalContext textureUtil];
              BOOL v158 = [(PTQualitySettings *)v17->_qualitySettings doDisparityUpsampling];
              double v159 = width;
              double v160 = height;
              if (v158)
              {
                double v159 = v17->_disparitySizeUpscaled.width;
                double v160 = v17->_disparitySizeUpscaled.height;
              }
              uint64_t v161 = objc_msgSend(v157, "createWithSize:pixelFormat:", 25, v159, v160);
              focusEdgeMask = v17->_focusEdgeMask;
              v17->_focusEdgeMask = (MTLTexture *)v161;

              if (!v17->_focusEdgeMask)
              {
                v146 = _PTLogSystem();
                if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
                  -[PTRaytracingUtils initWithMetalContext:].cold.6(v146, v216, v217, v218, v219, v220, v221, v222);
                }
              }
              else
              {
LABEL_56:
                [(PTQualitySettings *)v17->_qualitySettings renderDownscale];
                double v164 = v245 / v163;
                [(PTQualitySettings *)v17->_qualitySettings renderDownscale];
                double v166 = v246 / v165;
                v167 = [v15 textureUtil];
                uint64_t v168 = objc_msgSend(v167, "createWithSize:pixelFormat:", -[PTQualitySettings intermediatePixelFormat](v17->_qualitySettings, "intermediatePixelFormat"), v164, v166);
                raytracedRGBWeight = v17->_raytracedRGBWeight;
                v17->_raytracedRGBWeight = (MTLTexture *)v168;

                if (v17->_raytracedRGBWeight)
                {
                  if (![(PTQualitySettings *)v17->_qualitySettings doIntermediate2XUpscale]) {
                    goto LABEL_59;
                  }
                  v170 = [(PTMetalContext *)v17->_metalContext textureUtil];
                  uint64_t v171 = objc_msgSend(v170, "createWithWidth:height:pixelFormat:", (unint64_t)(v164 + v164), (unint64_t)(v166 + v166), -[PTQualitySettings intermediatePixelFormat](v17->_qualitySettings, "intermediatePixelFormat"));
                  raytracedRGBWeightUpscaled = v17->_raytracedRGBWeightUpscaled;
                  v17->_raytracedRGBWeightUpscaled = (MTLTexture *)v171;

                  if (v17->_raytracedRGBWeightUpscaled)
                  {
LABEL_59:
                    v173 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v17->_raytracedRGBWeight, v17->_disparityEdges, v17->_disparityEdgesTemp, 0);
                    v146 = v173;
                    if (v17->_focusEdgeMask) {
                      -[NSObject addObject:](v173, "addObject:");
                    }
                    v144 = v17;
                    goto LABEL_83;
                  }
                  v146 = _PTLogSystem();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]6(v146, v237, v238, v239, v240, v241, v242, v243);
                  }
                }
                else
                {
                  v146 = _PTLogSystem();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]5(v146, v195, v196, v197, v198, v199, v200, v201);
                  }
                }
              }
LABEL_82:
              v144 = 0;
LABEL_83:

              goto LABEL_47;
            }
            v27 = _PTLogSystem();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.6(v27, v137, v138, v139, v140, v141, v142, v143);
            }
          }
          else
          {
            v27 = _PTLogSystem();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.5(v27, v130, v131, v132, v133, v134, v135, v136);
            }
          }
        }
        else
        {
          v27 = _PTLogSystem();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.4(v27, v116, v117, v118, v119, v120, v121, v122);
          }
        }
      }
      else
      {
        v27 = _PTLogSystem();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:](v27, v109, v110, v111, v112, v113, v114, v115);
        }
      }
      goto LABEL_45;
    }
    v27 = _PTLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:](v27, v123, v124, v125, v126, v127, v128, v129);
    }
  }
  else
  {
    v27 = _PTLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:](v27, v28, v29, v30, v31, v32, v33, v34);
    }
  }
LABEL_45:

LABEL_46:
  v144 = 0;
LABEL_47:

  return v144;
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

  uint64_t v96 = 0;
  long long v94 = 0u;
  long long v95 = 0u;
  *(float *)&double v9 = self->_circleOfConfusionReference;
  *(float *)&double v10 = self->_fNumberLimitWeight;
  +[PTRaytracingUtils createFocusObject:v7 anamorphicFactor:COERCE_DOUBLE((unint64_t)LODWORD(self->_anamorphicFactor)) colorSize:*(double *)self->_sourceColorSize circleOfConfusionReference:v9 fNumberLimitWeight:v10];
  v93[0] = 0;
  v93[1] = 0;
  if (!self->_injectedRGBAPyramid)
  {
    rgbaPyramid = self->_rgbaPyramid;
    v12 = [v7 sourceColor];
    [(PTPyramid *)rgbaPyramid updatePyramidFromPTTexture:v6 inPTTexture:v12];
  }
  double v13 = (*(float *)&v94 + *(float *)&v94) * *((float *)&v94 + 2);
  *(float *)&double v13 = v13;
  float32x2_t v14 = vdiv_f32(*(float32x2_t *)&self->_circleOfConfusionLimitBgFg[4], (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v13, 0));
  float v15 = -*((float *)&v94 + 1);
  float v16 = -v14.f32[0];
  v92[0] = -*((float *)&v94 + 1);
  v92[1] = -v14.f32[0];
  __int32 v17 = v14.i32[1];
  v92[2] = v14.f32[1];
  globalReduction = self->_globalReduction;
  if (globalReduction)
  {
    v19 = [v7 sourceDisparity];
    [(PTGlobalReduction *)globalReduction parallelReductionMinMax:v6 inTexture:v19 globalMinMaxBuffer:self->_disparityDiffGlobalMinMax];

    *(float *)&double v20 = v15;
    *(float *)&double v21 = v16;
    LODWORD(v22) = v17;
    -[PTRaytracingUtils disparityMinMaxApplyPostModifier:disparityMinMaxBuffer:postModfier:](self->_raytracingUtils, "disparityMinMaxApplyPostModifier:disparityMinMaxBuffer:postModfier:", v6, self->_disparityDiffGlobalMinMax, v20, v21, v22);
    raytracingUtils = self->_raytracingUtils;
    v24 = [v7 sourceDisparity];
    disparityEdges = self->_disparityEdges;
    disparityEdgesTemp = self->_disparityEdgesTemp;
    disparityDiffGlobalMinMax = self->_disparityDiffGlobalMinMax;
    *(float *)&double v28 = self->_edgeTolerance;
    long long v89 = v94;
    long long v90 = v95;
    uint64_t v91 = v96;
    [(PTRaytracingUtils *)raytracingUtils detectDilatedEdges:v6 inDisparity:v24 tempEdges:disparityEdgesTemp outEdges:disparityEdges focusObject:&v89 disparityDiffMinMax:disparityDiffGlobalMinMax edgeTolerance:v28];
  }
  uint64_t v29 = [v7 sourceDisparity];
  if ([(PTQualitySettings *)self->_qualitySettings doDisparityUpsampling])
  {
    guidedFilter = self->_guidedFilter;
    uint64_t v30 = [v7 sourceDisparity];
    uint64_t v31 = v29;
    p_disparityDiffUpscaled = &self->_disparityDiffUpscaled;
    disparityDiffUpscaled = self->_disparityDiffUpscaled;
    guideRGBACoefficients = self->_guideRGBACoefficients;
    guideRGBAUpscale = self->_guideRGBAUpscale;
    v36 = [v7 renderState];
    uint64_t v37 = [v36 sourceColorBitDepth];
    v38 = disparityDiffUpscaled;
    uint64_t v29 = v31;
    [(PTGuidedFilter *)guidedFilter guidedFilter:v6 image:v30 guideRGBACoefficients:guideRGBACoefficients guideRGBAUpscale:guideRGBAUpscale upscaledImage:v38 sourceColorBitDepth:v37 postModifierPtr:v92];
  }
  else
  {
    if (![(PTQualitySettings *)self->_qualitySettings doCenterDisparity]) {
      goto LABEL_10;
    }
    uint64_t v43 = self->_raytracingUtils;
    uint64_t v30 = [v7 sourceDisparity];
    p_disparityDiffUpscaled = &self->_disparityDiff;
    *(float *)&double v44 = v15;
    *(float *)&double v45 = v16;
    LODWORD(v46) = v17;
    -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v43, "disparityApplyPostModifier:inDisparity:outDisparity:postModfier:", v6, v30, self->_disparityDiff, v44, v45, v46);
  }

  BOOL v47 = *p_disparityDiffUpscaled;
  uint64_t v29 = v47;
LABEL_10:
  if (self->_focusEdgeMask)
  {
    *(float *)&double v39 = self->_focusEdge.width;
    *(float *)&double v40 = self->_focusEdge.gradientThreshold;
    *(float *)&double v41 = self->_focusEdge.gradientWeight;
    *(float *)&double v42 = self->_focusEdge.minMaxThreshold;
    -[PTRaytracingUtils focusEdgeMask:inDisparityDiff:focusEdge:outFocusEdgeMask:](self->_raytracingUtils, "focusEdgeMask:inDisparityDiff:focusEdge:outFocusEdgeMask:", v6, v29, v39, v40, v41, v42);
  }
  long long v89 = 0u;
  long long v90 = 0u;
  if (v7) {
    [v7 scissorRect];
  }
  else {
    memset(v88, 0, sizeof(v88));
  }
  float v48 = v29;
  +[PTImageblockConfig adjustScissorRectToImageBlocks:v88];
  unint64_t v80 = v89;
  [(PTQualitySettings *)self->_qualitySettings renderDownscale];
  unsigned int v82 = v49;
  float32x2_t v50 = vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)__PAIR128__(*((unint64_t *)&v89 + 1), v80)));
  [(PTQualitySettings *)self->_qualitySettings renderDownscale];
  __asm { FMOV            V1.2D, #-0.5 }
  int32x2_t v57 = vmovn_s64(vcvtq_s64_f64(vrndmq_f64(vaddq_f64(vcvtq_f64_f32(vdiv_f32(v50, (float32x2_t)__PAIR64__(v51, v82))), _Q1))));
  v87[1] = v57.i16[2];
  v87[0] = v57.i16[0];
  v50.f32[0] = (float)(unint64_t)v90;
  [(PTQualitySettings *)self->_qualitySettings renderDownscale];
  unint64_t v59 = vcvtpd_u64_f64((float)(v50.f32[0] / v58) + 0.5);
  float v60 = (float)*((unint64_t *)&v90 + 1);
  [(PTQualitySettings *)self->_qualitySettings renderDownscale];
  unint64_t v62 = vcvtpd_u64_f64((float)(v60 / v61) + 0.5);
  float v63 = [v6 computeCommandEncoder];
  if (!v63)
  {
    float v64 = _PTLogSystem();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v64, v65, v66, v67, v68, v69, v70, v71);
    }
  }
  [v63 setComputePipelineState:self->_raytracingSDOF];
  double v72 = [(PTPyramid *)self->_rgbaPyramid mipmapTexture];
  [v63 setTexture:v72 atIndex:0];

  [v63 setTexture:v48 atIndex:1];
  [v63 setTexture:self->_disparityEdges atIndex:2];
  [v63 setTexture:self->_raytracedRGBWeight atIndex:3];
  [v63 setTexture:self->_focusEdgeMask atIndex:4];
  [v63 setBytes:v93 length:16 atIndex:0];
  [v63 setBuffer:self->_aperturePoints.xy offset:0 atIndex:1];
  [v63 setBuffer:self->_randomUChars offset:0 atIndex:2];
  [v63 setBuffer:self->_disparityDiffGlobalMinMax offset:0 atIndex:3];
  [v63 setBytes:self->_sourceColorSize length:8 atIndex:4];
  [v63 setBytes:self->_sourceDisparitySize length:8 atIndex:5];
  [v63 setBytes:v87 length:4 atIndex:6];
  v86[0] = v59;
  v86[1] = v62;
  v86[2] = 1;
  int64x2_t v84 = vdupq_n_s64(8uLL);
  uint64_t v85 = 1;
  [v63 dispatchThreads:v86 threadsPerThreadgroup:&v84];
  [v63 endEncoding];
  double v73 = self->_raytracedRGBWeight;
  if (self->_raytracedRGBWeightUpscaled)
  {
    double v74 = [(PTMetalContext *)self->_metalContext textureUtil];
    [v74 copy:v6 inTex:self->_raytracedRGBWeight outTex:self->_raytracedRGBWeightUpscaled];

    double v75 = self->_raytracedRGBWeightUpscaled;
    double v73 = v75;
  }
  raytracingInterpolateResult = self->_raytracingInterpolateResult;
  if (self->_skipFullSizeLayer)
  {
    [(PTRaytracingInterpolateResult *)self->_raytracingInterpolateResult interpolateRGBWeightUsingSourceToDest:v6 renderRequest:v7 inRGBWeight:v73];
  }
  else
  {
    double v77 = [(PTPyramid *)self->_rgbaPyramid mipmapLevels];
    uint64_t v78 = [v77 objectAtIndexedSubscript:0];
    [(PTRaytracingInterpolateResult *)raytracingInterpolateResult interpolateRGBWeightUsingRGBALinearToDest:v6 renderRequest:v7 inRGBWeight:v73 inRGBA:v78];
  }
  if (kdebug_is_enabled())
  {
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __62__PTRaytracingV4001_renderContinuousWithSource_renderRequest___block_invoke;
    v83[3] = &unk_1E68841B0;
    v83[4] = self;
    [v6 addCompletedHandler:v83];
  }

  return 0;
}

void __62__PTRaytracingV4001_renderContinuousWithSource_renderRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 88) doDisparityUpsampling];
  [*(id *)(*(void *)(a1 + 32) + 88) renderDownscale];
  kdebug_trace();
  if ([v3 status] != 4)
  {
    v4 = _PTLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__PTRaytracingV4001_renderContinuousWithSource_renderRequest___block_invoke_cold_2(v3, v4);
    }

    if ([v3 status] != 4)
    {
      v5 = _PTLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __62__PTRaytracingV4001_renderContinuousWithSource_renderRequest___block_invoke_cold_1(v3, v5);
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
  objc_storeStrong((id *)&self->_raytracingSDOF, 0);
  objc_storeStrong((id *)&self->_guideRGBAUpscale, 0);
  objc_storeStrong((id *)&self->_guideRGBACoefficients, 0);
  objc_storeStrong((id *)&self->_raytracedRGBWeightUpscaled, 0);
  objc_storeStrong((id *)&self->_raytracedRGBWeight, 0);
  objc_storeStrong((id *)&self->_focusEdgeMask, 0);
  objc_storeStrong((id *)&self->_disparityDiffUpscaled, 0);
  objc_storeStrong((id *)&self->_disparityDiff, 0);
  objc_storeStrong((id *)&self->_disparityEdgesTemp, 0);
  objc_storeStrong((id *)&self->_disparityEdges, 0);
  objc_storeStrong((id *)&self->_disparityDiffGlobalMinMax, 0);
  objc_storeStrong((id *)&self->_randomUChars, 0);

  objc_storeStrong((id *)&self->_guidedFilter, 0);
  objc_storeStrong((id *)&self->_globalReduction, 0);
  objc_storeStrong((id *)&self->_raytracingInterpolateResult, 0);
  objc_storeStrong((id *)&self->_raytracingUtils, 0);
  objc_storeStrong((id *)&self->_qualitySettings, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_debugLayer, 0);
  objc_storeStrong((id *)&self->_rgbaPyramid, 0);

  objc_storeStrong((id *)&self->_options, 0);
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

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __62__PTRaytracingV4001_renderContinuousWithSource_renderRequest___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = [a1 error];
  v5 = [a1 label];
  int v6 = 138412546;
  id v7 = v4;
  __int16 v8 = 2112;
  double v9 = v5;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "%@ label %@", (uint8_t *)&v6, 0x16u);
}

void __62__PTRaytracingV4001_renderContinuousWithSource_renderRequest___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 error];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Commandbuffer Error %@", (uint8_t *)&v4, 0xCu);
}

@end