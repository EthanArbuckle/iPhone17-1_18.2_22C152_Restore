@interface PTRaytracingV3001
- (PTRaytracingV3001)initWithMetalContext:(id)a3 renderEffects:(id)a4 colorSize:(CGSize)a5 disparitySize:(CGSize)a6 debugRendering:(int64_t)a7 verbose:(BOOL)a8 options:(id)a9 quality:(int)a10;
- (int)prewarm;
- (int)renderContinuousWithSource:(id)a3 renderRequest:(id)a4;
- (unint64_t)minimumResourceHeapSize;
@end

@implementation PTRaytracingV3001

- (PTRaytracingV3001)initWithMetalContext:(id)a3 renderEffects:(id)a4 colorSize:(CGSize)a5 disparitySize:(CGSize)a6 debugRendering:(int64_t)a7 verbose:(BOOL)a8 options:(id)a9 quality:(int)a10
{
  uint64_t v10 = *(void *)&a10;
  double width = a6.width;
  double height = a6.height;
  double v280 = a5.width;
  double v281 = a5.height;
  id v16 = a3;
  id v17 = a4;
  id v18 = a9;
  v288.receiver = self;
  v288.super_class = (Class)PTRaytracingV3001;
  v19 = [(PTRaytracingV3001 *)&v288 init];
  if (!v19) {
    goto LABEL_74;
  }
  PTKTraceInit();
  v19->_disparitySize.double width = width;
  v19->_disparitySize.double height = height;
  objc_storeStrong((id *)&v19->_metalContext, a3);
  v19->_debugRendering = a7;
  objc_storeStrong((id *)&v19->_options, a9);
  objc_storeStrong((id *)&v19->_renderEffects, a4);
  uint64_t v20 = +[PTQualitySettings createWithQuality:v10 options:v18];
  qualitySettings = v19->_qualitySettings;
  v19->_qualitySettings = (PTQualitySettings *)v20;

  if (!v19->_qualitySettings)
  {
    v38 = _PTLogSystem();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:](v38, v39, v40, v41, v42, v43, v44, v45);
    }
    goto LABEL_73;
  }
  +[PTRaytracingUtils createFocusEdge];
  v19->_focusEdge.double width = v22;
  v19->_focusEdge.gradientThreshold = v23;
  v19->_focusEdge.gradientWeight = v24;
  v19->_focusEdge.minMaxThreshold = v25;
  v19->_BOOL updateSourceColor = 0;
  int v26 = [(PTQualitySettings *)v19->_qualitySettings quality];
  BOOL updateSourceColor = v19->_updateSourceColor;
  BOOL v29 = v26 < 100 && !updateSourceColor;
  v19->_skipFullSizeLayer = v29;
  if (!updateSourceColor) {
    goto LABEL_12;
  }
  v30 = [[PTColorConversion alloc] initWithMetalContext:v16];
  colorConversion = v19->_colorConversion;
  v19->_colorConversion = v30;

  if (!v19->_colorConversion)
  {
    v38 = _PTLogSystem();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]9(v38, v46, v47, v48, v49, v50, v51, v52);
    }
    goto LABEL_73;
  }
  v32 = [v16 textureUtil];
  uint64_t v33 = objc_msgSend(v32, "createWithSize:pixelFormat:", 115, v280, v281);
  rgba = v19->_rgba;
  v19->_rgba = (MTLTexture *)v33;

  if (!v19->_rgba)
  {
    v38 = _PTLogSystem();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]0(v38, v159, v160, v161, v162, v163, v164, v165);
    }
  }
  else
  {
LABEL_12:
    v35 = [v18 objectForKeyedSubscript:&unk_1F26C0928];
    v19->_injectedRGBAPyramid = v35 != 0;

    if (v19->_injectedRGBAPyramid)
    {
      uint64_t v36 = [v18 objectForKeyedSubscript:&unk_1F26C0928];
      rgbaPyramid = v19->_rgbaPyramid;
      v19->_rgbaPyramid = (PTPyramid *)v36;

      goto LABEL_19;
    }
    v53 = -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:]([PTPyramid alloc], "initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:", v16, 115, v19->_skipFullSizeLayer, [(PTQualitySettings *)v19->_qualitySettings doFirstLevelGaussianDownsample], 4, v280, v281);
    v54 = v19->_rgbaPyramid;
    v19->_rgbaPyramid = v53;

    if (v19->_rgbaPyramid)
    {
LABEL_19:
      v55 = [[PTRaytracingUtils alloc] initWithMetalContext:v16];
      raytracingUtils = v19->_raytracingUtils;
      v19->_raytracingUtils = v55;

      if (v19->_raytracingUtils)
      {
        v57 = [[PTRaytracingInterpolateResult alloc] initWithMetalContext:v16 useExportQualityNoise:[(PTQualitySettings *)v19->_qualitySettings useExportQualityNoise]];
        raytracingInterpolateResult = v19->_raytracingInterpolateResult;
        v19->_raytracingInterpolateResult = v57;

        if (v19->_raytracingInterpolateResult)
        {
          uint64_t v59 = +[PTPrecomputeRandom computeUnitDiskPoints:v16 numberOfPatternCircles:[(PTQualitySettings *)v19->_qualitySettings numberOfPatternCircles]];
          uint64_t v61 = v60;
          xy = v19->_aperturePoints.xy;
          v19->_aperturePoints.xy = (MTLBuffer *)v59;

          *((_WORD *)&v19->_aperturePoints.rayCount + 2) = WORD2(v61);
          v19->_aperturePoints.rayCount = v61;
          if (v19->_aperturePoints.xy)
          {
            uint64_t v63 = +[PTPrecomputeRandom computeRandomUChars:v16 rayCount:v61];
            randomUChars = v19->_randomUChars;
            v19->_randomUChars = (MTLBuffer *)v63;

            if (v19->_randomUChars)
            {
              v19->_doVisualization = 0;
              BOOL v65 = [(PTQualitySettings *)v19->_qualitySettings doMacroApertureLimit];
              float v66 = 0.0051429;
              if (v65) {
                float v66 = 0.00043025;
              }
              v19->_circleOfConfusionReference = v66;
              v19->_fNumberLimitWeight = 0.33333;
              *(float32x2_t *)&v19->_circleOfConfusionLimitBgFg[4] = vmul_n_f32((float32x2_t)0x3FC0000040800000, v66);
              [(PTQualitySettings *)v19->_qualitySettings circleOfConfusionLimitBackground];
              if (fabsf(v67) != INFINITY)
              {
                [(PTQualitySettings *)v19->_qualitySettings circleOfConfusionLimitBackground];
                *(_DWORD *)&v19->_circleOfConfusionLimitBgFg[4] = v68;
              }
              [(PTQualitySettings *)v19->_qualitySettings circleOfConfusionLimitForeground];
              if (fabsf(v69) != INFINITY)
              {
                [(PTQualitySettings *)v19->_qualitySettings circleOfConfusionLimitForeground];
                *(_DWORD *)&v19->_circleOfConfusionLimitBgFg[8] = v70;
              }
              v19->_kRayCount = v19->_aperturePoints.rayCount;
              _H8 = *((_WORD *)&v19->_aperturePoints.rayCount + 2);
              v72.f64[0] = v280;
              v72.f64[1] = v281;
              v73.f64[0] = width;
              v73.f64[1] = height;
              *(float32x2_t *)v19->_sourceColorSize = vcvt_f32_f64(v72);
              *(float32x2_t *)v19->_sourceDisparitySize = vcvt_f32_f64(v73);
              v19->_anamorphicFactor = 1.2;
              v74 = [v18 objectForKeyedSubscript:&unk_1F26C0940];

              if (v74)
              {
                v75 = [v18 objectForKeyedSubscript:&unk_1F26C0940];
                [v75 floatValue];
                v19->_anamorphicFactor = v76;
              }
              __asm { FCVT            S8, H8 }
              v19->_kPyramidSamplingFraction = 0.665;
              v19->_edgeTolerance = 0.025;
              BOOL v287 = 0;
              BOOL v287 = [(PTQualitySettings *)v19->_qualitySettings rayMarch];
              [(PTQualitySettings *)v19->_qualitySettings renderDownscale];
              float v81 = 3.0;
              if (v82 <= 3.0)
              {
                [(PTQualitySettings *)v19->_qualitySettings renderDownscale];
                float v81 = 1.0;
                if (v83 >= 2.0) {
                  float v81 = 2.0;
                }
              }
              [(PTQualitySettings *)v19->_qualitySettings renderDownscale];
              float v85 = v84 + 0.5;
              BOOL v86 = v84 <= 2.0;
              float v87 = 2.5;
              if (!v86) {
                float v87 = v85;
              }
              *(float *)&double v88 = 1.0 / (float)(0.5 - v87);
              *((float *)&v88 + 1) = -v87;
              double v279 = v88;
              v89 = objc_opt_new();
              [v89 setConstantValue:&v19->_kRayCount type:29 withName:@"kRaycount"];
              [v89 setConstantValue:&v287 type:53 withName:@"kRayMarch"];
              [v89 setConstantValue:&v19->_skipFullSizeLayer type:53 withName:@"kSkipFullSizeLayer"];
              LODWORD(v90) = _S8;
              [v89 setConstantFloat:@"kRadiusLocal_float" withName:v90];
              LODWORD(v91) = 0.25;
              [v89 setConstantFloat:@"kRadiusLocalFraction_float" withName:v91];
              *(float *)&double v92 = v81;
              [v89 setConstantFloat:@"kDiameterCoverageLimit_float" withName:v92];
              [v89 setConstantFloat2:@"kFocusBlendCoefficients_float2" withName:v279];
              *(float *)&double v93 = v19->_kPyramidSamplingFraction;
              [v89 setConstantFloat:@"kPyramidSamplingFraction_float" withName:v93];
              LODWORD(v94) = 6.0;
              [v89 setConstantFloat:@"kRayMarchDisparityRadiusTolerance_float" withName:v94];
              LODWORD(v95) = 1017370378;
              [v89 setConstantFloat:@"kHighlightBoostFactor_float" withName:v95];
              uint64_t v96 = [(PTMetalContext *)v19->_metalContext computePipelineStateFor:@"raytracingV3001" withConstants:v89];
              raytracingSDOF = v19->_raytracingSDOF;
              v19->_raytracingSDOF = (MTLComputePipelineState *)v96;

              if (!v19->_raytracingSDOF)
              {
                v150 = _PTLogSystem();
                if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
                  -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.7(v150, v195, v196, v197, v198, v199, v200, v201);
                }
                goto LABEL_100;
              }
              if ([(PTQualitySettings *)v19->_qualitySettings rayMarch])
              {
                v98 = -[PTGlobalReduction initWithMetalContext:textureSize:]([PTGlobalReduction alloc], "initWithMetalContext:textureSize:", v16, width, height);
                globalReduction = v19->_globalReduction;
                v19->_globalReduction = v98;

                if (!v19->_globalReduction)
                {
                  v150 = _PTLogSystem();
                  if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.8(v150, v202, v203, v204, v205, v206, v207, v208);
                  }
                  goto LABEL_100;
                }
                v100 = [v16 device];
                uint64_t v101 = [v100 newBufferWithLength:8 options:0];
                disparityDiffGlobalMinMax = v19->_disparityDiffGlobalMinMax;
                v19->_disparityDiffGlobalMinMax = (MTLBuffer *)v101;

                if (!v19->_disparityDiffGlobalMinMax)
                {
                  v150 = _PTLogSystem();
                  if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.9(v150, v209, v210, v211, v212, v213, v214, v215);
                  }
                  goto LABEL_100;
                }
                v103 = [(PTMetalContext *)v19->_metalContext textureUtil];
                uint64_t v104 = objc_msgSend(v103, "createWithSize:pixelFormat:", 10, width, height);
                disparityEdges = v19->_disparityEdges;
                v19->_disparityEdges = (MTLTexture *)v104;

                if (!v19->_disparityEdges)
                {
                  v150 = _PTLogSystem();
                  if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]0(v150, v237, v238, v239, v240, v241, v242, v243);
                  }
                  goto LABEL_100;
                }
                v106 = [(PTMetalContext *)v19->_metalContext textureUtil];
                uint64_t v107 = objc_msgSend(v106, "createWithSize:pixelFormat:", 10, width, height);
                disparityEdgesTemp = v19->_disparityEdgesTemp;
                v19->_disparityEdgesTemp = (MTLTexture *)v107;

                if (!v19->_disparityEdgesTemp)
                {
                  v150 = _PTLogSystem();
                  if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]1(v150, v265, v266, v267, v268, v269, v270, v271);
                  }
                  goto LABEL_100;
                }
              }
              if ([(PTQualitySettings *)v19->_qualitySettings doDisparityUpsampling])
              {
                v109 = [PTGuidedFilter alloc];
                v286[0] = (unint64_t)width;
                v286[1] = (unint64_t)height;
                v286[2] = 1;
                [(PTQualitySettings *)v19->_qualitySettings disparityGuidedFilterEpsilon];
                uint64_t v110 = -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:](v109, "initWithMetalContext:inputSize:epsilon:", v16, v286);
                guidedFilter = v19->_guidedFilter;
                v19->_guidedFilter = (PTGuidedFilter *)v110;

                if (!v19->_guidedFilter)
                {
                  v150 = _PTLogSystem();
                  if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]2(v150, v216, v217, v218, v219, v220, v221, v222);
                  }
                  goto LABEL_100;
                }
                [(PTQualitySettings *)v19->_qualitySettings disparityUpsampleFactor];
                CGFloat v113 = width * v112;
                [(PTQualitySettings *)v19->_qualitySettings disparityUpsampleFactor];
                v19->_disparitySizeUpscaled.double width = v113;
                v19->_disparitySizeUpscaled.double height = height * v114;
                v115 = [v16 textureUtil];
                uint64_t v116 = objc_msgSend(v115, "createWithSize:pixelFormat:", 25, v19->_disparitySizeUpscaled.width, v19->_disparitySizeUpscaled.height);
                disparityUpscaled = v19->_disparityUpscaled;
                v19->_disparityUpscaled = (MTLTexture *)v116;

                v118 = v19->_disparityUpscaled;
                if (!v118)
                {
                  v150 = _PTLogSystem();
                  if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]3(v150, v244, v245, v246, v247, v248, v249, v250);
                  }
                  goto LABEL_100;
                }
                v119 = v19->_rgbaPyramid;
                uint64_t v120 = [(MTLTexture *)v118 width];
                uint64_t v121 = [(MTLTexture *)v19->_disparityUpscaled height];
                v285[0] = v120;
                v285[1] = v121;
                v285[2] = 1;
                uint64_t v122 = [(PTPyramid *)v119 findMipmapLevelLargerThan:v285];
                guideRGBAUpscale = v19->_guideRGBAUpscale;
                v19->_guideRGBAUpscale = (MTLTexture *)v122;

                v124 = v19->_rgbaPyramid;
                v284[0] = (unint64_t)width;
                v284[1] = (unint64_t)height;
                v284[2] = 1;
                uint64_t v125 = [(PTPyramid *)v124 findMipmapLevelLargerThan:v284];
                guideRGBACoefficients = v19->_guideRGBACoefficients;
                v19->_guideRGBACoefficients = (MTLTexture *)v125;
              }
              if (![(PTQualitySettings *)v19->_qualitySettings doCenterDisparity]) {
                goto LABEL_104;
              }
              v127 = [(PTMetalContext *)v19->_metalContext textureUtil];
              uint64_t v128 = objc_msgSend(v127, "createWithSize:pixelFormat:", 25, width, height);
              disparityDiff = v19->_disparityDiff;
              v19->_disparityDiff = (MTLTexture *)v128;

              if (!v19->_disparityDiff)
              {
                v150 = _PTLogSystem();
                if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
                  -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]4(v150, v230, v231, v232, v233, v234, v235, v236);
                }
                goto LABEL_100;
              }
              v130 = [(PTMetalContext *)v19->_metalContext textureUtil];
              uint64_t v131 = objc_msgSend(v130, "createWithSize:pixelFormat:", 25, width, height);
              disparityEffects = v19->_disparityEffects;
              v19->_disparityEffects = (MTLTexture *)v131;

              if (!v19->_disparityEffects)
              {
                v150 = _PTLogSystem();
                if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
                  -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]5(v150, v258, v259, v260, v261, v262, v263, v264);
                }
              }
              else
              {
                if (![(PTQualitySettings *)v19->_qualitySettings doFocusEdgeMask]) {
                  goto LABEL_53;
                }
LABEL_104:
                v133 = [(PTMetalContext *)v19->_metalContext textureUtil];
                BOOL v134 = [(PTQualitySettings *)v19->_qualitySettings doDisparityUpsampling];
                double v135 = width;
                double v136 = height;
                if (v134)
                {
                  double v135 = v19->_disparitySizeUpscaled.width;
                  double v136 = v19->_disparitySizeUpscaled.height;
                }
                uint64_t v137 = objc_msgSend(v133, "createWithSize:pixelFormat:", 25, v135, v136);
                focusEdgeMask = v19->_focusEdgeMask;
                v19->_focusEdgeMask = (MTLTexture *)v137;

                if (!v19->_focusEdgeMask)
                {
                  v150 = _PTLogSystem();
                  if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingUtils initWithMetalContext:].cold.6(v150, v251, v252, v253, v254, v255, v256, v257);
                  }
                }
                else
                {
LABEL_53:
                  [(PTQualitySettings *)v19->_qualitySettings renderDownscale];
                  double v140 = v280 / v139;
                  [(PTQualitySettings *)v19->_qualitySettings renderDownscale];
                  double v142 = v281 / v141;
                  v143 = [v16 textureUtil];
                  uint64_t v144 = objc_msgSend(v143, "createWithSize:pixelFormat:", -[PTQualitySettings intermediatePixelFormat](v19->_qualitySettings, "intermediatePixelFormat"), v140, v142);
                  raytracedRGBWeight = v19->_raytracedRGBWeight;
                  v19->_raytracedRGBWeight = (MTLTexture *)v144;

                  if (v19->_raytracedRGBWeight)
                  {
                    if (![(PTQualitySettings *)v19->_qualitySettings doIntermediate2XUpscale]) {
                      goto LABEL_56;
                    }
                    v146 = [(PTMetalContext *)v19->_metalContext textureUtil];
                    uint64_t v147 = objc_msgSend(v146, "createWithWidth:height:pixelFormat:", (unint64_t)(v140 + v140), (unint64_t)(v142 + v142), -[PTQualitySettings intermediatePixelFormat](v19->_qualitySettings, "intermediatePixelFormat"));
                    raytracedRGBWeightUpscaled = v19->_raytracedRGBWeightUpscaled;
                    v19->_raytracedRGBWeightUpscaled = (MTLTexture *)v147;

                    if (v19->_raytracedRGBWeightUpscaled)
                    {
LABEL_56:
                      v149 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v19->_raytracedRGBWeight, v19->_disparityEdges, v19->_disparityEdgesTemp, 0);
                      v150 = v149;
                      if (v19->_disparityUpscaled) {
                        -[NSObject addObject:](v149, "addObject:");
                      }
                      if (v19->_focusEdgeMask) {
                        -[NSObject addObject:](v150, "addObject:");
                      }
                      v151 = v19;
                      goto LABEL_101;
                    }
                    v150 = _PTLogSystem();
                    if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
                      -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]8(v150, v272, v273, v274, v275, v276, v277, v278);
                    }
                  }
                  else
                  {
                    v150 = _PTLogSystem();
                    if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
                      -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]7(v150, v223, v224, v225, v226, v227, v228, v229);
                    }
                  }
                }
              }
LABEL_100:
              v151 = 0;
LABEL_101:

              goto LABEL_75;
            }
            v38 = _PTLogSystem();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
              -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.6(v38, v187, v188, v189, v190, v191, v192, v193);
            }
          }
          else
          {
            v38 = _PTLogSystem();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
              -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.5(v38, v180, v181, v182, v183, v184, v185, v186);
            }
          }
        }
        else
        {
          v38 = _PTLogSystem();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.4(v38, v166, v167, v168, v169, v170, v171, v172);
          }
        }
      }
      else
      {
        v38 = _PTLogSystem();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:](v38, v152, v153, v154, v155, v156, v157, v158);
        }
      }
      goto LABEL_73;
    }
    v38 = _PTLogSystem();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:](v38, v173, v174, v175, v176, v177, v178, v179);
    }
  }
LABEL_73:

LABEL_74:
  v151 = 0;
LABEL_75:

  return v151;
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

  uint64_t v90 = 0;
  long long v88 = 0u;
  long long v89 = 0u;
  *(float *)&double v9 = self->_circleOfConfusionReference;
  *(float *)&double v10 = self->_fNumberLimitWeight;
  +[PTRaytracingUtils createFocusObject:v7 anamorphicFactor:COERCE_DOUBLE((unint64_t)LODWORD(self->_anamorphicFactor)) colorSize:*(double *)self->_sourceColorSize circleOfConfusionReference:v9 fNumberLimitWeight:v10];
  v87[0] = 0;
  v87[1] = 0;
  uint64_t v11 = [v7 sourceDisparity];
  if (!self->_injectedRGBAPyramid)
  {
    v12 = [v7 sourceColor];
    [(PTPyramid *)self->_rgbaPyramid updatePyramidFromPTTexture:v6 inPTTexture:v12];
  }
  BOOL v13 = [(PTQualitySettings *)self->_qualitySettings doCenterDisparity];
  v14 = (MTLTexture *)v11;
  if (v13)
  {
    double v15 = (*(float *)&v88 + *(float *)&v88) * *((float *)&v88 + 2);
    *(float *)&double v15 = v15;
    float32x2_t v16 = vdiv_f32(*(float32x2_t *)&self->_circleOfConfusionLimitBgFg[4], (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v15, 0));
    float v17 = -v16.f32[0];
    __int32 v18 = v16.i32[1];
    BOOL v19 = [(PTQualitySettings *)self->_qualitySettings portraitPreviewDeadzone];
    raytracingUtils = self->_raytracingUtils;
    disparityDiff = self->_disparityDiff;
    *(float *)&double v22 = -*((float *)&v88 + 1);
    *(float *)&double v23 = v17;
    LODWORD(v24) = v18;
    if (v19) {
      -[PTRaytracingUtils disparityPortraitPreviewDeadzone:inDisparity:outDisparity:postModfier:](raytracingUtils, "disparityPortraitPreviewDeadzone:inDisparity:outDisparity:postModfier:", v6, v11, disparityDiff, v22, v23, v24);
    }
    else {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](raytracingUtils, "disparityApplyPostModifier:inDisparity:outDisparity:postModfier:", v6, v11, disparityDiff, v22, v23, v24);
    }
    v14 = self->_disparityDiff;
  }
  v77 = (void *)v11;
  float v25 = v14;
  globalReduction = self->_globalReduction;
  if (globalReduction)
  {
    [(PTGlobalReduction *)globalReduction parallelReductionMinMax:v6 inTexture:v25 globalMinMaxBuffer:self->_disparityDiffGlobalMinMax];
    v27 = self->_raytracingUtils;
    disparityEdges = self->_disparityEdges;
    disparityEdgesTemp = self->_disparityEdgesTemp;
    disparityDiffGlobalMinMax = self->_disparityDiffGlobalMinMax;
    *(float *)&double v31 = self->_edgeTolerance;
    long long v84 = v88;
    long long v85 = v89;
    uint64_t v86 = v90;
    [(PTRaytracingUtils *)v27 detectDilatedEdges:v6 inDisparity:v25 tempEdges:disparityEdgesTemp outEdges:disparityEdges focusObject:&v84 disparityDiffMinMax:disparityDiffGlobalMinMax edgeTolerance:v31];
  }
  id v36 = v6;
  if ([(PTQualitySettings *)self->_qualitySettings doDisparityUpsampling])
  {
    guidedFilter = self->_guidedFilter;
    disparityUpscaled = self->_disparityUpscaled;
    guideRGBAUpscale = self->_guideRGBAUpscale;
    guideRGBACoefficients = self->_guideRGBACoefficients;
    uint64_t v41 = [v7 renderState];
    -[PTGuidedFilter guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImage:sourceColorBitDepth:postModifierPtr:](guidedFilter, "guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImage:sourceColorBitDepth:postModifierPtr:", v36, v25, guideRGBACoefficients, guideRGBAUpscale, disparityUpscaled, [v41 sourceColorBitDepth], 0);

    id v6 = v36;
    uint64_t v42 = self->_disparityUpscaled;

    float v25 = v42;
  }
  if (self->_focusEdgeMask)
  {
    *(float *)&double v32 = self->_focusEdge.width;
    *(float *)&double v33 = self->_focusEdge.gradientThreshold;
    *(float *)&double v34 = self->_focusEdge.gradientWeight;
    *(float *)&double v35 = self->_focusEdge.minMaxThreshold;
    -[PTRaytracingUtils focusEdgeMask:inDisparityDiff:focusEdge:outFocusEdgeMask:](self->_raytracingUtils, "focusEdgeMask:inDisparityDiff:focusEdge:outFocusEdgeMask:", v6, v25, v32, v33, v34, v35);
  }
  long long v84 = 0u;
  long long v85 = 0u;
  if (v7) {
    [v7 scissorRect];
  }
  else {
    memset(v83, 0, sizeof(v83));
  }
  +[PTImageblockConfig adjustScissorRectToImageBlocks:v83];
  unint64_t v75 = v84;
  [(PTQualitySettings *)self->_qualitySettings renderDownscale];
  unsigned int v76 = v43;
  float32x2_t v44 = vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)__PAIR128__(*((unint64_t *)&v84 + 1), v75)));
  [(PTQualitySettings *)self->_qualitySettings renderDownscale];
  __asm { FMOV            V1.2D, #-0.5 }
  int32x2_t v51 = vmovn_s64(vcvtq_s64_f64(vrndmq_f64(vaddq_f64(vcvtq_f64_f32(vdiv_f32(v44, (float32x2_t)__PAIR64__(v45, v76))), _Q1))));
  v82[1] = v51.i16[2];
  v82[0] = v51.i16[0];
  v44.f32[0] = (float)(unint64_t)v85;
  [(PTQualitySettings *)self->_qualitySettings renderDownscale];
  unint64_t v53 = vcvtpd_u64_f64((float)(v44.f32[0] / v52) + 0.5);
  float v54 = (float)*((unint64_t *)&v85 + 1);
  [(PTQualitySettings *)self->_qualitySettings renderDownscale];
  unint64_t v56 = vcvtpd_u64_f64((float)(v54 / v55) + 0.5);
  v57 = [v6 computeCommandEncoder];
  if (!v57)
  {
    v58 = _PTLogSystem();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v58, v59, v60, v61, v62, v63, v64, v65);
    }
  }
  [v57 setComputePipelineState:self->_raytracingSDOF];
  float v66 = [(PTPyramid *)self->_rgbaPyramid mipmapTexture];
  [v57 setTexture:v66 atIndex:0];

  [v57 setTexture:v25 atIndex:1];
  [v57 setTexture:self->_disparityEdges atIndex:2];
  [v57 setTexture:self->_raytracedRGBWeight atIndex:3];
  [v57 setTexture:self->_focusEdgeMask atIndex:4];
  [v57 setBytes:v87 length:16 atIndex:0];
  [v57 setBuffer:self->_aperturePoints.xy offset:0 atIndex:1];
  [v57 setBuffer:self->_randomUChars offset:0 atIndex:2];
  [v57 setBuffer:self->_disparityDiffGlobalMinMax offset:0 atIndex:3];
  [v57 setBytes:self->_sourceColorSize length:8 atIndex:4];
  [v57 setBytes:self->_sourceDisparitySize length:8 atIndex:5];
  [v57 setBytes:v82 length:4 atIndex:6];
  v81[0] = v53;
  v81[1] = v56;
  v81[2] = 1;
  int64x2_t v79 = vdupq_n_s64(8uLL);
  uint64_t v80 = 1;
  [v57 dispatchThreads:v81 threadsPerThreadgroup:&v79];
  [v57 endEncoding];
  float v67 = self->_raytracedRGBWeight;
  if (self->_raytracedRGBWeightUpscaled)
  {
    int v68 = [(PTMetalContext *)self->_metalContext textureUtil];
    float v69 = v36;
    [v68 copy:v36 inTex:self->_raytracedRGBWeight outTex:self->_raytracedRGBWeightUpscaled];

    int v70 = self->_raytracedRGBWeightUpscaled;
    float v67 = v70;
  }
  else
  {
    float v69 = v36;
  }
  raytracingInterpolateResult = self->_raytracingInterpolateResult;
  if (self->_skipFullSizeLayer)
  {
    [(PTRaytracingInterpolateResult *)self->_raytracingInterpolateResult interpolateRGBWeightUsingSourceToDest:v69 renderRequest:v7 inRGBWeight:v67];
  }
  else
  {
    float64x2_t v72 = [(PTPyramid *)self->_rgbaPyramid mipmapLevels];
    float64x2_t v73 = [v72 objectAtIndexedSubscript:0];
    [(PTRaytracingInterpolateResult *)raytracingInterpolateResult interpolateRGBWeightUsingRGBALinearToDest:v36 renderRequest:v7 inRGBWeight:v67 inRGBA:v73];

    float v69 = v36;
  }
  if (kdebug_is_enabled())
  {
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __62__PTRaytracingV3001_renderContinuousWithSource_renderRequest___block_invoke;
    v78[3] = &unk_1E68841B0;
    v78[4] = self;
    [v69 addCompletedHandler:v78];
  }

  return 0;
}

void __62__PTRaytracingV3001_renderContinuousWithSource_renderRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 104) doDisparityUpsampling];
  [*(id *)(*(void *)(a1 + 32) + 104) renderDownscale];
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
  objc_storeStrong((id *)&self->_renderEffects, 0);
  objc_storeStrong((id *)&self->_raytracingSDOF, 0);
  objc_storeStrong((id *)&self->_guideRGBAUpscale, 0);
  objc_storeStrong((id *)&self->_disparityUpscaled, 0);
  objc_storeStrong((id *)&self->_guideRGBACoefficients, 0);
  objc_storeStrong((id *)&self->_raytracedRGBWeightUpscaled, 0);
  objc_storeStrong((id *)&self->_raytracedRGBWeight, 0);
  objc_storeStrong((id *)&self->_focusEdgeMask, 0);
  objc_storeStrong((id *)&self->_disparityDiff, 0);
  objc_storeStrong((id *)&self->_disparityEffects, 0);
  objc_storeStrong((id *)&self->_disparityEdgesTemp, 0);
  objc_storeStrong((id *)&self->_disparityEdges, 0);
  objc_storeStrong((id *)&self->_disparityDiffGlobalMinMax, 0);
  objc_storeStrong((id *)&self->_randomUChars, 0);

  objc_storeStrong((id *)&self->_rgba, 0);
  objc_storeStrong((id *)&self->_colorConversion, 0);
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

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.19(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end