@interface PTRaytracingV14RenderState
- (BOOL)doVisualization;
- (MTLBuffer)aperturePointsXY;
- (MTLBuffer)disparityDiffGlobalMinMax;
- (MTLBuffer)randomUChars;
- (MTLComputePipelineState)raytracingSDOF;
- (MTLTexture)disparityDiff;
- (MTLTexture)disparityEdges;
- (MTLTexture)disparityEdgesTemp;
- (MTLTexture)focusEdgeMask;
- (MTLTexture)randomGaussNoise;
- (MTLTexture)raytracedRGBRadius;
- (MTLTexture)raytracedRGBRadiusUpscaled;
- (PTDisparityUpscale)disparityUpscale;
- (PTGlobalReduction)globalReduction;
- (PTQualitySettings)qualitySettings;
- (PTRaytracingV14RenderState)initWithMetalContext:(id)a3 util:(id)a4 quality:(int)a5 colorSize:(CGSize)a6 disparitySize:(CGSize)a7 debugRendering:(int64_t)a8 pyramidPixelFormat:(unint64_t)a9 options:(id)a10 debugTextures:(id)a11;
- (double)colorSize;
- (float)anamorphicFactor;
- (float)edgeTolerance;
- (float)pyramidSamplingFraction;
- (float)raytracingRadiusLocal;
- (id)description;
- (int)rayCount;
- (unint64_t)dependentFrames;
- (void)setAnamorphicFactor:(float)a3;
- (void)setAperturePointsXY:(id)a3;
- (void)setColorSize:(PTRaytracingV14RenderState *)self;
- (void)setDisparityDiff:(id)a3;
- (void)setDisparityDiffGlobalMinMax:(id)a3;
- (void)setDisparityEdges:(id)a3;
- (void)setDisparityEdgesTemp:(id)a3;
- (void)setDisparityUpscale:(id)a3;
- (void)setDoVisualization:(BOOL)a3;
- (void)setEdgeTolerance:(float)a3;
- (void)setFocusEdgeMask:(id)a3;
- (void)setGlobalReduction:(id)a3;
- (void)setPyramidSamplingFraction:(float)a3;
- (void)setQualitySettings:(id)a3;
- (void)setRandomGaussNoise:(id)a3;
- (void)setRandomUChars:(id)a3;
- (void)setRayCount:(int)a3;
- (void)setRaytracedRGBRadius:(id)a3;
- (void)setRaytracedRGBRadiusUpscaled:(id)a3;
- (void)setRaytracingRadiusLocal:(float)a3;
- (void)setRaytracingSDOF:(id)a3;
@end

@implementation PTRaytracingV14RenderState

- (PTRaytracingV14RenderState)initWithMetalContext:(id)a3 util:(id)a4 quality:(int)a5 colorSize:(CGSize)a6 disparitySize:(CGSize)a7 debugRendering:(int64_t)a8 pyramidPixelFormat:(unint64_t)a9 options:(id)a10 debugTextures:(id)a11
{
  double height = a7.height;
  double width = a7.width;
  double v215 = a6.width;
  double v216 = a6.height;
  uint64_t v14 = *(void *)&a5;
  id v17 = a3;
  id v18 = a4;
  id v19 = a10;
  id v20 = a11;
  v218.receiver = self;
  v218.super_class = (Class)PTRaytracingV14RenderState;
  v21 = [(PTRaytracingV14RenderState *)&v218 init];
  v21->_quality = v14;
  uint64_t v22 = +[PTQualitySettings createWithQuality:v14 options:v19];
  qualitySettings = v21->_qualitySettings;
  v21->_qualitySettings = (PTQualitySettings *)v22;

  v24 = v21->_qualitySettings;
  if (v24)
  {
    [(PTQualitySettings *)v24 setDoFirstLevelGaussianDownsample:1];
    v25 = +[PTPrecomputeRandom computeUnitDiskPoints:v17 numberOfPatternCircles:[(PTQualitySettings *)v21->_qualitySettings numberOfPatternCircles]];
    uint64_t v27 = v26;
    objc_storeStrong((id *)&v21->_aperturePointsXY, v25);
    if (v21->_aperturePointsXY)
    {
      uint64_t v28 = +[PTPrecomputeRandom computeRandomUChars:v17 rayCount:v27];
      randomUChars = v21->_randomUChars;
      v21->_randomUChars = (MTLBuffer *)v28;

      if (v21->_randomUChars)
      {
        _H0 = WORD2(v27);
        v21->_rayCount = v27;
        v21->_doVisualization = 0;
        __asm { FCVT            S0, H0 }
        v21->_float raytracingRadiusLocal = _S0;
        v36.f64[0] = v215;
        v36.f64[1] = v216;
        *(float32x2_t *)v21->_colorSize = vcvt_f32_f64(v36);
        v21->_anamorphicFactor = 1.2;
        *(void *)&v21->_kPyramidSamplingFraction = 0x3CCCCCCD3F99999ALL;
        BOOL v217 = 0;
        BOOL v217 = [(PTQualitySettings *)v21->_qualitySettings rayMarch];
        float raytracingRadiusLocal = v21->_raytracingRadiusLocal;
        [(PTQualitySettings *)v21->_qualitySettings renderDownscale];
        float v39 = v38;
        v40 = objc_opt_new();
        [v40 setConstantValue:&v21->_rayCount type:29 withName:@"kRaytracingRaycount"];
        [v40 setConstantValue:&v217 type:53 withName:@"kRayMarch"];
        *(float *)&double v41 = raytracingRadiusLocal * 0.25;
        [v40 setConstantFloat:@"kRadiusLocal_float" withName:v41];
        *(float *)&double v42 = v21->_kPyramidSamplingFraction;
        [v40 setConstantFloat:@"kPyramidSamplingFraction_float" withName:v42];
        double v43 = fmax(v39 * 0.25 + 1.5, 2.0);
        *(float *)&double v43 = v43;
        [v40 setConstantFloat:@"kDiameterCoverageLimit_float" withName:v43];
        LODWORD(v44) = 4.0;
        [v40 setConstantFloat:@"kRayMarchDisparityRadiusTolerance_float" withName:v44];
        uint64_t v45 = [v17 computePipelineStateFor:@"raytracingV14" withConstants:v40];
        raytracingSDOF = v21->_raytracingSDOF;
        v21->_raytracingSDOF = (MTLComputePipelineState *)v45;

        if (!v21->_raytracingSDOF)
        {
          v70 = _PTLogSystem();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
            -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.4(v70, v112, v113, v114, v115, v116, v117, v118);
          }
          goto LABEL_74;
        }
        if ([(PTQualitySettings *)v21->_qualitySettings rayMarch])
        {
          v47 = -[PTGlobalReduction initWithMetalContext:textureSize:]([PTGlobalReduction alloc], "initWithMetalContext:textureSize:", v17, width, height);
          globalReduction = v21->_globalReduction;
          v21->_globalReduction = v47;

          if (!v21->_globalReduction)
          {
            v70 = _PTLogSystem();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
              -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.8(v70, v119, v120, v121, v122, v123, v124, v125);
            }
            goto LABEL_74;
          }
          v49 = [v17 device];
          uint64_t v50 = [v49 newBufferWithLength:8 options:0];
          disparityDiffGlobalMinMax = v21->_disparityDiffGlobalMinMax;
          v21->_disparityDiffGlobalMinMax = (MTLBuffer *)v50;

          if (!v21->_disparityDiffGlobalMinMax)
          {
            v70 = _PTLogSystem();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
              -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.6(v70, v126, v127, v128, v129, v130, v131, v132);
            }
            goto LABEL_74;
          }
          v52 = [v17 textureUtil];
          uint64_t v53 = objc_msgSend(v52, "createWithSize:pixelFormat:", 10, width, height);
          disparityEdges = v21->_disparityEdges;
          v21->_disparityEdges = (MTLTexture *)v53;

          if (!v21->_disparityEdges)
          {
            v70 = _PTLogSystem();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
              -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.7(v70, v147, v148, v149, v150, v151, v152, v153);
            }
            goto LABEL_74;
          }
          v55 = [v17 textureUtil];
          uint64_t v56 = objc_msgSend(v55, "createWithSize:pixelFormat:", 10, width, height);
          disparityEdgesTemp = v21->_disparityEdgesTemp;
          v21->_disparityEdgesTemp = (MTLTexture *)v56;

          if (!v21->_disparityEdgesTemp)
          {
            v70 = _PTLogSystem();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
              -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.8(v70, v175, v176, v177, v178, v179, v180, v181);
            }
            goto LABEL_74;
          }
        }
        if ([(PTQualitySettings *)v21->_qualitySettings doDisparityUpsampling])
        {
          v58 = -[PTDisparityUpscale initWithMetalContext:colorSize:disparitySize:]([PTDisparityUpscale alloc], "initWithMetalContext:colorSize:disparitySize:", v17, v215, v216, width, height);
          disparityUpscale = v21->_disparityUpscale;
          v21->_disparityUpscale = v58;

          if (!v21->_disparityUpscale)
          {
            v70 = _PTLogSystem();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
              -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.9(v70, v133, v134, v135, v136, v137, v138, v139);
            }
            goto LABEL_74;
          }
        }
        if ([(PTQualitySettings *)v21->_qualitySettings doCenterDisparity])
        {
          v60 = [v17 textureUtil];
          uint64_t v61 = objc_msgSend(v60, "createWithSize:pixelFormat:", 25, width, height);
          disparityDiff = v21->_disparityDiff;
          v21->_disparityDiff = (MTLTexture *)v61;

          if (!v21->_disparityDiff)
          {
            v70 = _PTLogSystem();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
              -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:]0(v70, v140, v141, v142, v143, v144, v145, v146);
            }
            goto LABEL_74;
          }
        }
        if ([(PTQualitySettings *)v21->_qualitySettings doFocusEdgeMask])
        {
          if ([(PTQualitySettings *)v21->_qualitySettings doDisparityUpsampling]) {
            double width = (double)[(PTDisparityUpscale *)v21->_disparityUpscale width];
          }
          if ([(PTQualitySettings *)v21->_qualitySettings doDisparityUpsampling]) {
            double height = (double)[(PTDisparityUpscale *)v21->_disparityUpscale height];
          }
          v63 = [v17 textureUtil];
          uint64_t v64 = [v63 createWithWidth:(unint64_t)width height:(unint64_t)height pixelFormat:25];
          focusEdgeMask = v21->_focusEdgeMask;
          v21->_focusEdgeMask = (MTLTexture *)v64;

          if (!v21->_focusEdgeMask)
          {
            v70 = _PTLogSystem();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
              -[PTRaytracingUtils initWithMetalContext:].cold.6(v70, v154, v155, v156, v157, v158, v159, v160);
            }
            goto LABEL_74;
          }
        }
        if ([(PTQualitySettings *)v21->_qualitySettings quality] <= 25)
        {
          v66 = [v17 textureUtil];
          uint64_t v67 = [v66 createWithWidth:256 height:256 pixelFormat:12];
          randomGaussNoise = v21->_randomGaussNoise;
          v21->_randomGaussNoise = (MTLTexture *)v67;

          if (!v21->_randomGaussNoise)
          {
            v70 = _PTLogSystem();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
              -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:]2(v70, v168, v169, v170, v171, v172, v173, v174);
            }
            goto LABEL_74;
          }
          v69 = [v17 commandQueue];
          v70 = v69;
          if (!v69)
          {
            v70 = _PTLogSystem();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
              -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:]3(v70, v182, v183, v184, v185, v186, v187, v188);
            }
            goto LABEL_74;
          }
          uint64_t v71 = [v69 commandBuffer];
          if (!v71)
          {
            v189 = _PTLogSystem();
            if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR)) {
              -[PTEffect updateEffectDelegate:](v189, v190, v191, v192, v193, v194, v195, v196);
            }

            goto LABEL_74;
          }
          v214 = (void *)v71;
          v72 = [v17 device];
          v213 = +[PTRaytracingUtilsV1 precomputeNoise:v72 sideLength:256];

          if (!v213)
          {
            v204 = _PTLogSystem();
            if (os_log_type_enabled(v204, OS_LOG_TYPE_ERROR)) {
              -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:]5(v204, v205, v206, v207, v208, v209, v210, v211);
            }

            goto LABEL_74;
          }
          [v18 gaussianNoise:v214 inNoise:v213 outTex:v21->_randomGaussNoise];
          [v214 commit];
          [v214 waitUntilScheduled];
        }
        [(PTQualitySettings *)v21->_qualitySettings renderDownscale];
        float v74 = v73;
        [(PTQualitySettings *)v21->_qualitySettings renderDownscale];
        float v76 = v75;
        v77 = [v17 textureUtil];
        double v78 = v215 / v74;
        double v79 = v216 / v76;
        uint64_t v80 = objc_msgSend(v77, "createWithSize:pixelFormat:", 115, v78, v79);
        raytracedRGBRadius = v21->_raytracedRGBRadius;
        v21->_raytracedRGBRadius = (MTLTexture *)v80;

        if (v21->_raytracedRGBRadius)
        {
          if (![(PTQualitySettings *)v21->_qualitySettings doIntermediate2XUpscale]) {
            goto LABEL_29;
          }
          v82 = [v17 textureUtil];
          uint64_t v83 = [v82 createWithWidth:(unint64_t)(v78 + v78) height:(unint64_t)(v79 + v79) pixelFormat:115];
          raytracedRGBRadiusUpscaled = v21->_raytracedRGBRadiusUpscaled;
          v21->_raytracedRGBRadiusUpscaled = (MTLTexture *)v83;

          if (v21->_raytracedRGBRadiusUpscaled)
          {
LABEL_29:
            v70 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v21->_raytracedRGBRadius, v21->_disparityEdges, v21->_disparityEdgesTemp, 0);
            if ([(PTQualitySettings *)v21->_qualitySettings doDisparityUpsampling])
            {
              v85 = [(PTDisparityUpscale *)v21->_disparityUpscale upscaledTexture];

              if (v85)
              {
                v86 = [(PTDisparityUpscale *)v21->_disparityUpscale upscaledTexture];
                [v70 addObject:v86];
              }
            }
            if ([(PTQualitySettings *)v21->_qualitySettings doFocusEdgeMask] && v21->_focusEdgeMask) {
              -[NSObject addObject:](v70, "addObject:");
            }
            uint64_t v87 = [NSString stringWithFormat:@"%@, Rays: %i", v21->_qualitySettings, v27];
            description = v21->_description;
            v21->_description = (NSString *)v87;

            v89 = v21;
            goto LABEL_75;
          }
          v70 = _PTLogSystem();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
            -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:]7(v70, v197, v198, v199, v200, v201, v202, v203);
          }
        }
        else
        {
          v70 = _PTLogSystem();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
            -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:]6(v70, v161, v162, v163, v164, v165, v166, v167);
          }
        }
LABEL_74:
        v89 = 0;
LABEL_75:

        goto LABEL_76;
      }
      v97 = _PTLogSystem();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
        -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:](v97, v105, v106, v107, v108, v109, v110, v111);
      }
    }
    else
    {
      v97 = _PTLogSystem();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
        -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:](v97, v98, v99, v100, v101, v102, v103, v104);
      }
    }
  }
  else
  {
    v25 = _PTLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:](v25, v90, v91, v92, v93, v94, v95, v96);
    }
  }
  v89 = 0;
LABEL_76:

  return v89;
}

- (unint64_t)dependentFrames
{
  return 0;
}

- (MTLBuffer)randomUChars
{
  return self->_randomUChars;
}

- (void)setRandomUChars:(id)a3
{
}

- (id)description
{
  return objc_getProperty(self, a2, 104, 1);
}

- (MTLTexture)randomGaussNoise
{
  return self->_randomGaussNoise;
}

- (void)setRandomGaussNoise:(id)a3
{
}

- (MTLTexture)focusEdgeMask
{
  return self->_focusEdgeMask;
}

- (void)setFocusEdgeMask:(id)a3
{
}

- (BOOL)doVisualization
{
  return self->_doVisualization;
}

- (void)setDoVisualization:(BOOL)a3
{
  self->_doVisualization = a3;
}

- (double)colorSize
{
  return *(double *)(a1 + 72);
}

- (void)setColorSize:(PTRaytracingV14RenderState *)self
{
  *(void *)self->_colorSize = v2;
}

- (float)pyramidSamplingFraction
{
  return self->_kPyramidSamplingFraction;
}

- (void)setPyramidSamplingFraction:(float)a3
{
  self->_kPyramidSamplingFraction = a3;
}

- (float)edgeTolerance
{
  return self->_edgeTolerance;
}

- (void)setEdgeTolerance:(float)a3
{
  self->_edgeTolerance = a3;
}

- (int)rayCount
{
  return self->_rayCount;
}

- (void)setRayCount:(int)a3
{
  self->_rayCount = a3;
}

- (MTLComputePipelineState)raytracingSDOF
{
  return self->_raytracingSDOF;
}

- (void)setRaytracingSDOF:(id)a3
{
}

- (MTLBuffer)aperturePointsXY
{
  return self->_aperturePointsXY;
}

- (void)setAperturePointsXY:(id)a3
{
}

- (MTLTexture)raytracedRGBRadius
{
  return self->_raytracedRGBRadius;
}

- (void)setRaytracedRGBRadius:(id)a3
{
}

- (MTLTexture)raytracedRGBRadiusUpscaled
{
  return self->_raytracedRGBRadiusUpscaled;
}

- (void)setRaytracedRGBRadiusUpscaled:(id)a3
{
}

- (MTLTexture)disparityEdges
{
  return self->_disparityEdges;
}

- (void)setDisparityEdges:(id)a3
{
}

- (MTLTexture)disparityEdgesTemp
{
  return self->_disparityEdgesTemp;
}

- (void)setDisparityEdgesTemp:(id)a3
{
}

- (PTDisparityUpscale)disparityUpscale
{
  return self->_disparityUpscale;
}

- (void)setDisparityUpscale:(id)a3
{
}

- (PTGlobalReduction)globalReduction
{
  return self->_globalReduction;
}

- (void)setGlobalReduction:(id)a3
{
}

- (MTLBuffer)disparityDiffGlobalMinMax
{
  return self->_disparityDiffGlobalMinMax;
}

- (void)setDisparityDiffGlobalMinMax:(id)a3
{
}

- (float)anamorphicFactor
{
  return self->_anamorphicFactor;
}

- (void)setAnamorphicFactor:(float)a3
{
  self->_anamorphicFactor = a3;
}

- (float)raytracingRadiusLocal
{
  return self->_raytracingRadiusLocal;
}

- (void)setRaytracingRadiusLocal:(float)a3
{
  self->_float raytracingRadiusLocal = a3;
}

- (PTQualitySettings)qualitySettings
{
  return self->_qualitySettings;
}

- (void)setQualitySettings:(id)a3
{
}

- (MTLTexture)disparityDiff
{
  return self->_disparityDiff;
}

- (void)setDisparityDiff:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disparityDiff, 0);
  objc_storeStrong((id *)&self->_qualitySettings, 0);
  objc_storeStrong((id *)&self->_disparityDiffGlobalMinMax, 0);
  objc_storeStrong((id *)&self->_disparityEdgesTemp, 0);
  objc_storeStrong((id *)&self->_disparityEdges, 0);
  objc_storeStrong((id *)&self->_raytracedRGBRadiusUpscaled, 0);
  objc_storeStrong((id *)&self->_raytracedRGBRadius, 0);
  objc_storeStrong((id *)&self->_aperturePointsXY, 0);
  objc_storeStrong((id *)&self->_randomGaussNoise, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_focusEdgeMask, 0);
  objc_storeStrong((id *)&self->_randomizedGauss, 0);
  objc_storeStrong((id *)&self->_raytracingSDOF, 0);
  objc_storeStrong((id *)&self->_disparityDiffGlobalMax, 0);
  objc_storeStrong((id *)&self->_randomUChars, 0);
  objc_storeStrong((id *)&self->_disparityUpscale, 0);

  objc_storeStrong((id *)&self->_globalReduction, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end