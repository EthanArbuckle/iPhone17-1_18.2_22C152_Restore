@interface PTRaytracingV2002
- (PTRaytracingV2002)initWithMetalContext:(id)a3 renderEffects:(id)a4 colorSize:(CGSize)a5 disparitySize:(CGSize)a6 debugRendering:(int64_t)a7 verbose:(BOOL)a8 options:(id)a9 quality:(int)a10;
- (int)prewarm;
- (int)renderContinuousWithSource:(id)a3 renderRequest:(id)a4;
- (unint64_t)minimumResourceHeapSize;
@end

@implementation PTRaytracingV2002

- (PTRaytracingV2002)initWithMetalContext:(id)a3 renderEffects:(id)a4 colorSize:(CGSize)a5 disparitySize:(CGSize)a6 debugRendering:(int64_t)a7 verbose:(BOOL)a8 options:(id)a9 quality:(int)a10
{
  uint64_t v10 = *(void *)&a10;
  double height = a6.height;
  double width = a6.width;
  double v234 = a5.width;
  double v235 = a5.height;
  id v17 = a3;
  id v18 = a9;
  v241.receiver = self;
  v241.super_class = (Class)PTRaytracingV2002;
  v19 = [(PTRaytracingV2002 *)&v241 init];
  if (!v19) {
    goto LABEL_54;
  }
  PTKTraceInit();
  *((double *)v19 + 5) = width;
  *((double *)v19 + 6) = height;
  objc_storeStrong((id *)v19 + 7, a3);
  *((void *)v19 + 4) = a7;
  objc_storeStrong((id *)v19 + 1, a9);
  uint64_t v20 = +[PTQualitySettings createWithQuality:v10 options:v18];
  v21 = (void *)*((void *)v19 + 11);
  *((void *)v19 + 11) = v20;

  if (*((void *)v19 + 11))
  {
    +[PTRaytracingUtilsV2 createFocusEdge];
    *((_DWORD *)v19 + 17) = v22;
    *((_DWORD *)v19 + 18) = v23;
    *((_DWORD *)v19 + 19) = v24;
    *((_DWORD *)v19 + 20) = v25;
    BOOL v240 = 0;
    BOOL v240 = (int)[*((id *)v19 + 11) quality] < 100;
    v26 = [v18 objectForKeyedSubscript:&unk_1F26C0778];
    v19[64] = v26 != 0;

    if (v19[64])
    {
      uint64_t v27 = [v18 objectForKeyedSubscript:&unk_1F26C0778];
      v28 = (void *)*((void *)v19 + 2);
      *((void *)v19 + 2) = v27;

      goto LABEL_8;
    }
    v37 = -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:]([PTPyramid alloc], "initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:", v17, 115, v240, [*((id *)v19 + 11) doFirstLevelGaussianDownsample], 4, v234, v235);
    v38 = (void *)*((void *)v19 + 2);
    *((void *)v19 + 2) = v37;

    if (*((void *)v19 + 2))
    {
LABEL_8:
      v39 = [[PTRaytracingUtilsV2 alloc] initWithMetalContext:v17];
      v40 = (void *)*((void *)v19 + 12);
      *((void *)v19 + 12) = v39;

      if (*((void *)v19 + 12))
      {
        v41 = -[PTRaytracingInterpolateResultV2 initWithMetalContext:useExportQualityNoise:]([PTRaytracingInterpolateResultV2 alloc], "initWithMetalContext:useExportQualityNoise:", v17, [*((id *)v19 + 11) useExportQualityNoise]);
        v42 = (void *)*((void *)v19 + 13);
        *((void *)v19 + 13) = v41;

        if (*((void *)v19 + 13))
        {
          uint64_t v43 = +[PTPrecomputeRandom computeUnitDiskPoints:numberOfPatternCircles:](PTPrecomputeRandom, "computeUnitDiskPoints:numberOfPatternCircles:", v17, [*((id *)v19 + 11) numberOfPatternCircles]);
          uint64_t v45 = v44;
          v46 = (void *)*((void *)v19 + 16);
          *((void *)v19 + 16) = v43;

          *((_WORD *)v19 + 70) = WORD2(v45);
          *((_DWORD *)v19 + 34) = v45;
          if (*((void *)v19 + 16))
          {
            uint64_t v47 = +[PTPrecomputeRandom computeRandomUChars:v17 rayCount:v45];
            v48 = (void *)*((void *)v19 + 18);
            *((void *)v19 + 18) = v47;

            if (*((void *)v19 + 18))
            {
              *((_DWORD *)v19 + 63) = *((_DWORD *)v19 + 34);
              v19[248] = 0;
              _H0 = *((_WORD *)v19 + 70);
              __asm { FCVT            S10, H0 }
              v55.f64[0] = v234;
              v55.f64[1] = v235;
              *((float32x2_t *)v19 + 32) = vcvt_f32_f64(v55);
              *(_OWORD *)(v19 + 264) = xmmword_1D081FC60;
              char v239 = 0;
              char v239 = [*((id *)v19 + 11) rayMarch];
              [*((id *)v19 + 11) renderDownscale];
              float v56 = 3.0;
              if (v57 <= 3.0)
              {
                [*((id *)v19 + 11) renderDownscale];
                float v56 = 1.0;
                if (v58 >= 2.0) {
                  float v56 = 2.0;
                }
              }
              [*((id *)v19 + 11) renderDownscale];
              float v60 = v59 + 0.5;
              BOOL v61 = v59 <= 2.0;
              float v62 = 2.5;
              if (!v61) {
                float v62 = v60;
              }
              *(float *)&double v63 = 1.0 / (float)(0.5 - v62);
              *((float *)&v63 + 1) = -v62;
              double v233 = v63;
              v64 = objc_opt_new();
              [v64 setConstantValue:v19 + 252 type:29 withName:@"kRaycount"];
              [v64 setConstantValue:&v239 type:53 withName:@"kRayMarch"];
              [v64 setConstantValue:&v240 type:53 withName:@"kSkipFullSizeLayer"];
              LODWORD(v65) = _S10;
              [v64 setConstantFloat:@"kRadiusLocal_float" withName:v65];
              LODWORD(v66) = 0.25;
              [v64 setConstantFloat:@"kRadiusLocalFraction_float" withName:v66];
              *(float *)&double v67 = v56;
              [v64 setConstantFloat:@"kDiameterCoverageLimit_float" withName:v67];
              [v64 setConstantFloat2:@"kFocusBlendCoefficients_float2" withName:v233];
              LODWORD(v68) = *((_DWORD *)v19 + 66);
              [v64 setConstantFloat:@"kPyramidSamplingFraction_float" withName:v68];
              LODWORD(v69) = 6.0;
              [v64 setConstantFloat:@"kRayMarchDisparityRadiusTolerance_float" withName:v69];
              uint64_t v70 = [*((id *)v19 + 7) computePipelineStateFor:@"raytracingV2002" withConstants:v64];
              v71 = (void *)*((void *)v19 + 35);
              *((void *)v19 + 35) = v70;

              if (!*((void *)v19 + 35))
              {
                v118 = _PTLogSystem();
                if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
                  -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.7(v118, v156, v157, v158, v159, v160, v161, v162);
                }
                goto LABEL_78;
              }
              if ([*((id *)v19 + 11) rayMarch])
              {
                v72 = -[PTGlobalReduction initWithMetalContext:textureSize:]([PTGlobalReduction alloc], "initWithMetalContext:textureSize:", *((void *)v19 + 7), width, height);
                v73 = (void *)*((void *)v19 + 14);
                *((void *)v19 + 14) = v72;

                if (!*((void *)v19 + 14))
                {
                  v118 = _PTLogSystem();
                  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.8(v118, v163, v164, v165, v166, v167, v168, v169);
                  }
                  goto LABEL_78;
                }
                v74 = [*((id *)v19 + 7) device];
                uint64_t v75 = [v74 newBufferWithLength:8 options:0];
                v76 = (void *)*((void *)v19 + 19);
                *((void *)v19 + 19) = v75;

                if (!*((void *)v19 + 19))
                {
                  v118 = _PTLogSystem();
                  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.9(v118, v170, v171, v172, v173, v174, v175, v176);
                  }
                  goto LABEL_78;
                }
                v77 = [*((id *)v19 + 7) textureUtil];
                uint64_t v78 = objc_msgSend(v77, "createWithSize:pixelFormat:", 10, width, height);
                v79 = (void *)*((void *)v19 + 20);
                *((void *)v19 + 20) = v78;

                if (!*((void *)v19 + 20))
                {
                  v118 = _PTLogSystem();
                  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]0(v118, v198, v199, v200, v201, v202, v203, v204);
                  }
                  goto LABEL_78;
                }
                v80 = [*((id *)v19 + 7) textureUtil];
                uint64_t v81 = objc_msgSend(v80, "createWithSize:pixelFormat:", 10, width, height);
                v82 = (void *)*((void *)v19 + 21);
                *((void *)v19 + 21) = v81;

                if (!*((void *)v19 + 21))
                {
                  v118 = _PTLogSystem();
                  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]1(v118, v219, v220, v221, v222, v223, v224, v225);
                  }
                  goto LABEL_78;
                }
              }
              if ([*((id *)v19 + 11) doDisparityUpsampling])
              {
                v83 = [PTGuidedFilter alloc];
                uint64_t v84 = *((void *)v19 + 7);
                v238[0] = (unint64_t)width;
                v238[1] = (unint64_t)height;
                v238[2] = 1;
                [*((id *)v19 + 11) disparityGuidedFilterEpsilon];
                uint64_t v85 = -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:](v83, "initWithMetalContext:inputSize:epsilon:", v84, v238);
                v86 = (void *)*((void *)v19 + 15);
                *((void *)v19 + 15) = v85;

                if (!*((void *)v19 + 15))
                {
                  v118 = _PTLogSystem();
                  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]2(v118, v177, v178, v179, v180, v181, v182, v183);
                  }
                  goto LABEL_78;
                }
                [*((id *)v19 + 11) disparityUpsampleFactor];
                double v88 = width * v87;
                [*((id *)v19 + 11) disparityUpsampleFactor];
                *((double *)v19 + 29) = v88;
                *((double *)v19 + 30) = height * v89;
                v90 = [v17 textureUtil];
                uint64_t v91 = objc_msgSend(v90, "createWithSize:pixelFormat:", 25, *((double *)v19 + 29), *((double *)v19 + 30));
                v92 = (void *)*((void *)v19 + 26);
                *((void *)v19 + 26) = v91;

                v93 = (void *)*((void *)v19 + 26);
                if (!v93)
                {
                  v118 = _PTLogSystem();
                  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]3(v118, v205, v206, v207, v208, v209, v210, v211);
                  }
                  goto LABEL_78;
                }
                v94 = (void *)*((void *)v19 + 2);
                uint64_t v95 = [v93 width];
                uint64_t v96 = [*((id *)v19 + 26) height];
                v237[0] = v95;
                v237[1] = v96;
                v237[2] = 1;
                uint64_t v97 = [v94 findMipmapLevelLargerThan:v237];
                v98 = (void *)*((void *)v19 + 28);
                *((void *)v19 + 28) = v97;

                v99 = (void *)*((void *)v19 + 2);
                v236[0] = (unint64_t)width;
                v236[1] = (unint64_t)height;
                v236[2] = 1;
                uint64_t v100 = [v99 findMipmapLevelLargerThan:v236];
                v101 = (void *)*((void *)v19 + 27);
                *((void *)v19 + 27) = v100;
              }
              if (![*((id *)v19 + 11) doCenterDisparity]) {
                goto LABEL_82;
              }
              v102 = [*((id *)v19 + 7) textureUtil];
              uint64_t v103 = objc_msgSend(v102, "createWithSize:pixelFormat:", 25, width, height);
              v104 = (void *)*((void *)v19 + 22);
              *((void *)v19 + 22) = v103;

              if (!*((void *)v19 + 22))
              {
                v118 = _PTLogSystem();
                if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
                  -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]4(v118, v191, v192, v193, v194, v195, v196, v197);
                }
              }
              else
              {
                if (![*((id *)v19 + 11) doFocusEdgeMask]) {
                  goto LABEL_33;
                }
LABEL_82:
                v105 = [*((id *)v19 + 7) textureUtil];
                if ([*((id *)v19 + 11) doDisparityUpsampling])
                {
                  double width = *((double *)v19 + 29);
                  double height = *((double *)v19 + 30);
                }
                uint64_t v106 = objc_msgSend(v105, "createWithSize:pixelFormat:", 25, width, height);
                v107 = (void *)*((void *)v19 + 23);
                *((void *)v19 + 23) = v106;

                if (!*((void *)v19 + 23))
                {
                  v118 = _PTLogSystem();
                  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingUtils initWithMetalContext:].cold.6(v118, v212, v213, v214, v215, v216, v217, v218);
                  }
                }
                else
                {
LABEL_33:
                  [*((id *)v19 + 11) renderDownscale];
                  double v109 = v234 / v108;
                  [*((id *)v19 + 11) renderDownscale];
                  double v111 = v235 / v110;
                  v112 = [v17 textureUtil];
                  uint64_t v113 = objc_msgSend(v112, "createWithSize:pixelFormat:", 115, v109, v111);
                  v114 = (void *)*((void *)v19 + 24);
                  *((void *)v19 + 24) = v113;

                  if (*((void *)v19 + 24))
                  {
                    if (![*((id *)v19 + 11) doIntermediate2XUpscale]) {
                      goto LABEL_36;
                    }
                    v115 = [*((id *)v19 + 7) textureUtil];
                    uint64_t v116 = objc_msgSend(v115, "createWithWidth:height:pixelFormat:", (unint64_t)(v109 + v109), (unint64_t)(v111 + v111), objc_msgSend(*((id *)v19 + 11), "intermediatePixelFormat"));
                    v117 = (void *)*((void *)v19 + 25);
                    *((void *)v19 + 25) = v116;

                    if (*((void *)v19 + 25))
                    {
LABEL_36:
                      v118 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", *((void *)v19 + 24), *((void *)v19 + 20), *((void *)v19 + 21), 0);
                      if ([*((id *)v19 + 11) doDisparityUpsampling]
                        && *((void *)v19 + 26))
                      {
                        -[NSObject addObject:](v118, "addObject:");
                      }
                      if ([*((id *)v19 + 11) doFocusEdgeMask] && *((void *)v19 + 23)) {
                        -[NSObject addObject:](v118, "addObject:");
                      }
                      v119 = v19;
                      goto LABEL_79;
                    }
                    v118 = _PTLogSystem();
                    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
                      -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]7(v118, v226, v227, v228, v229, v230, v231, v232);
                    }
                  }
                  else
                  {
                    v118 = _PTLogSystem();
                    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
                      -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]6(v118, v184, v185, v186, v187, v188, v189, v190);
                    }
                  }
                }
              }
LABEL_78:
              v119 = 0;
LABEL_79:

              goto LABEL_55;
            }
            v29 = _PTLogSystem();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.6(v29, v148, v149, v150, v151, v152, v153, v154);
            }
          }
          else
          {
            v29 = _PTLogSystem();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.5(v29, v141, v142, v143, v144, v145, v146, v147);
            }
          }
        }
        else
        {
          v29 = _PTLogSystem();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.4(v29, v127, v128, v129, v130, v131, v132, v133);
          }
        }
      }
      else
      {
        v29 = _PTLogSystem();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:](v29, v120, v121, v122, v123, v124, v125, v126);
        }
      }
      goto LABEL_53;
    }
    v29 = _PTLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:](v29, v134, v135, v136, v137, v138, v139, v140);
    }
  }
  else
  {
    v29 = _PTLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:](v29, v30, v31, v32, v33, v34, v35, v36);
    }
  }
LABEL_53:

LABEL_54:
  v119 = 0;
LABEL_55:

  return v119;
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

  uint64_t v91 = 0;
  long long v89 = 0u;
  long long v90 = 0u;
  float kPyramidSamplingFraction = self->_kPyramidSamplingFraction;
  float anamorphicFactor = self->_anamorphicFactor;
  uint64_t kRayCount = self->_kRayCount;
  double v12 = *(double *)self->_colorSize;
  BOOL v13 = [(PTQualitySettings *)self->_qualitySettings doMacroApertureLimit];
  *(float *)&double v14 = kPyramidSamplingFraction;
  *(float *)&double v15 = anamorphicFactor;
  +[PTRaytracingUtilsV2 createFocusObject:v7 pyramidSamplingFraction:kRayCount anamorphicFactor:v13 rayCount:v14 colorSize:v15 doMacroApertureLimit:v12];
  long long v87 = 0u;
  long long v88 = 0u;
  if (v7) {
    [v7 scissorRect];
  }
  if (!self->_injectedRGBAPyramid)
  {
    rgbaPyramid = self->_rgbaPyramid;
    id v17 = [v7 sourceColor];
    [(PTPyramid *)rgbaPyramid updatePyramidFromPTTexture:v6 inPTTexture:v17];
  }
  if ([(PTQualitySettings *)self->_qualitySettings doCenterDisparity])
  {
    raytracingUtils = self->_raytracingUtils;
    v19 = [v7 sourceDisparity];
    disparityDiff = self->_disparityDiff;
    *(float *)&double v21 = self->_foregroundBlurLimitingFactor;
    long long v84 = v89;
    long long v85 = v90;
    uint64_t v86 = v91;
    [(PTRaytracingUtilsV2 *)raytracingUtils centerDisparityOnFocus:v6 inDisparity:v19 outDisparity:disparityDiff focusObject:&v84 foregroundBlurLimitingFactor:v21];

    int v22 = self->_disparityDiff;
  }
  else
  {
    int v22 = [v7 sourceDisparity];
  }
  int v23 = v22;
  globalReduction = self->_globalReduction;
  if (globalReduction)
  {
    [(PTGlobalReduction *)globalReduction parallelReductionMinMax:v6 inTexture:v23 globalMinMaxBuffer:self->_disparityDiffGlobalMinMax];
    int v25 = self->_raytracingUtils;
    disparityEdges = self->_disparityEdges;
    disparityEdgesTemp = self->_disparityEdgesTemp;
    disparityDiffGlobalMinMax = self->_disparityDiffGlobalMinMax;
    *(float *)&double v29 = self->_edgeTolerance;
    long long v84 = v89;
    long long v85 = v90;
    uint64_t v86 = v91;
    [(PTRaytracingUtilsV2 *)v25 detectDilatedEdges:v6 inDisparity:v23 tempEdges:disparityEdgesTemp outEdges:disparityEdges focusObject:&v84 disparityDiffMinMax:disparityDiffGlobalMinMax edgeTolerance:v29];
  }
  if ([(PTQualitySettings *)self->_qualitySettings doDisparityUpsampling])
  {
    guidedFilter = self->_guidedFilter;
    guideRGBACoefficients = self->_guideRGBACoefficients;
    guideRGBAUpscale = self->_guideRGBAUpscale;
    disparityUpscaled = self->_disparityUpscaled;
    uint64_t v36 = [v7 renderState];
    -[PTGuidedFilter guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImage:sourceColorBitDepth:postModifierPtr:](guidedFilter, "guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImage:sourceColorBitDepth:postModifierPtr:", v6, v23, guideRGBACoefficients, guideRGBAUpscale, disparityUpscaled, [v36 sourceColorBitDepth], 0);

    v37 = self->_disparityUpscaled;
    int v23 = v37;
  }
  if (self->_focusEdgeMask)
  {
    v38 = self->_raytracingUtils;
    HIDWORD(v39) = DWORD1(v89);
    HIDWORD(v40) = DWORD1(v90);
    long long v84 = v89;
    long long v85 = v90;
    uint64_t v86 = v91;
    *(float *)&double v39 = self->_focusEdge.width;
    *(float *)&double v40 = self->_focusEdge.gradientThreshold;
    *(float *)&double v30 = self->_focusEdge.gradientWeight;
    *(float *)&double v31 = self->_focusEdge.minMaxThreshold;
    -[PTRaytracingUtilsV2 focusEdgeMask:inDisparityDiff:focusObject:focusEdge:outFocusEdgeMask:](v38, "focusEdgeMask:inDisparityDiff:focusObject:focusEdge:outFocusEdgeMask:", v6, v23, &v84, v39, v40, v30, v31);
  }
  v41 = [v7 sourceDisparity];
  float v77 = (float)(unint64_t)[v41 width];
  v42 = [v7 sourceDisparity];
  unint64_t v43 = [v42 height];
  *(float *)&uint64_t v44 = v77;
  *((float *)&v44 + 1) = (float)v43;
  uint64_t v78 = v44;

  uint64_t v83 = v78;
  unint64_t v76 = v87;
  [(PTQualitySettings *)self->_qualitySettings renderDownscale];
  LODWORD(v78) = v45;
  float32x2_t v46 = vcvt_f32_s32((int32x2_t)vand_s8((int8x8_t)vmovn_s64((int64x2_t)__PAIR128__(*((unint64_t *)&v87 + 1), v76)), (int8x8_t)0xFFFF0000FFFFLL));
  [(PTQualitySettings *)self->_qualitySettings renderDownscale];
  int32x2_t v48 = vcvt_s32_f32(vdiv_f32(v46, (float32x2_t)__PAIR64__(v47, v78)));
  v82[1] = v48.i16[2];
  v82[0] = v48.i16[0];
  v46.f32[0] = (float)(unint64_t)v88;
  [(PTQualitySettings *)self->_qualitySettings renderDownscale];
  unint64_t v50 = vcvtps_u32_f32(v46.f32[0] / v49);
  v46.f32[0] = (float)*((unint64_t *)&v88 + 1);
  [(PTQualitySettings *)self->_qualitySettings renderDownscale];
  unint64_t v52 = vcvtps_u32_f32(v46.f32[0] / v51);
  v53 = [v6 computeCommandEncoder];
  if (!v53)
  {
    v54 = _PTLogSystem();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v54, v55, v56, v57, v58, v59, v60, v61);
    }
  }
  [v53 setComputePipelineState:self->_raytracingSDOF];
  float v62 = [(PTPyramid *)self->_rgbaPyramid mipmapTexture];
  [v53 setTexture:v62 atIndex:0];

  [v53 setTexture:v23 atIndex:1];
  [v53 setTexture:self->_disparityEdges atIndex:2];
  [v53 setTexture:self->_raytracedRGBWeight atIndex:3];
  [v53 setTexture:self->_focusEdgeMask atIndex:4];
  [v53 setBytes:&v89 length:40 atIndex:0];
  [v53 setBuffer:self->_aperturePoints.xy offset:0 atIndex:1];
  [v53 setBuffer:self->_randomUChars offset:0 atIndex:2];
  [v53 setBuffer:self->_disparityDiffGlobalMinMax offset:0 atIndex:3];
  [v53 setBytes:&v83 length:8 atIndex:4];
  [v53 setBytes:v82 length:4 atIndex:5];
  *(void *)&long long v84 = v50;
  *((void *)&v84 + 1) = v52;
  *(void *)&long long v85 = 1;
  int64x2_t v80 = vdupq_n_s64(8uLL);
  uint64_t v81 = 1;
  [v53 dispatchThreads:&v84 threadsPerThreadgroup:&v80];
  [v53 endEncoding];
  double v63 = self->_raytracedRGBWeight;
  if (self->_raytracedRGBWeightUpscaled)
  {
    v64 = [(PTMetalContext *)self->_metalContext textureUtil];
    [v64 copy:v6 inTex:self->_raytracedRGBWeight outTex:self->_raytracedRGBWeightUpscaled];

    double v65 = self->_raytracedRGBWeightUpscaled;
    double v63 = v65;
  }
  double v66 = [v6 computeCommandEncoder];

  if (!v66)
  {
    double v67 = _PTLogSystem();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v67, v68, v69, v70, v71, v72, v73, v74);
    }
  }
  [(PTRaytracingInterpolateResultV2 *)self->_raytracingInterpolateResult interpolateRGBWeightUsingSourceToDest:v66 renderRequest:v7 inRGBWeight:v63];
  [v66 endEncoding];
  if (kdebug_is_enabled())
  {
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __62__PTRaytracingV2002_renderContinuousWithSource_renderRequest___block_invoke;
    v79[3] = &unk_1E68841B0;
    v79[4] = self;
    [v6 addCompletedHandler:v79];
  }

  return 0;
}

void __62__PTRaytracingV2002_renderContinuousWithSource_renderRequest___block_invoke(uint64_t a1, void *a2)
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
  objc_storeStrong((id *)&self->_disparityUpscaled, 0);
  objc_storeStrong((id *)&self->_raytracedRGBWeightUpscaled, 0);
  objc_storeStrong((id *)&self->_raytracedRGBWeight, 0);
  objc_storeStrong((id *)&self->_focusEdgeMask, 0);
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

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end