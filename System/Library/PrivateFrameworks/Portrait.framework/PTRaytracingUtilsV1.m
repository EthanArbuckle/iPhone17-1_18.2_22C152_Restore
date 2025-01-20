@interface PTRaytracingUtilsV1
+ (PTFocus)createFocusObject:(SEL)a3 pyramidSamplingFraction:(id)a4 anamorphicFactor:(float)a5 raytracingRadiusLocal:(float)a6 rayCount:(float)a7 colorSize:(int)a8 doMacroApertureLimit:(BOOL)a9;
+ (PTFocusEdge)createFocusEdge;
+ (PTNoiseValues)calculateVarReadNoise:(id)a3;
+ (float)focalLength;
+ (float)frameWidth;
+ (id)precomputeNoise:(id)a3 sideLength:(int)a4;
- (PTRaytracingUtilsV1)initWithMetalContext:(id)a3;
- (id)sNBE;
- (id)sNLE;
- (int)convertRGBPyramidFromSource:(id)a3 renderRequest:(id)a4 rgbaPyramidArray:(id)a5 skipLevel0:(BOOL)a6;
- (int)detectDilatedEdges:(id)a3 inDisparity:(id)a4 tempEdges:(id)a5 outEdges:(id)a6 focusObject:(PTFocus *)a7 disparityDiffMinMax:(id)a8 edgeTolerance:(float)a9;
- (void)centerDisparityOnFocus:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 focusObject:(PTFocus *)a6;
- (void)focusEdgeMask:(id)a3 inDisparityDiff:(id)a4 focusObject:(PTFocus *)a5 focusEdge:(PTFocusEdge)a6 outFocusEdgeMask:(id)a7;
- (void)interpolateRGBRadiusToDest:(id)a3 renderRequest:(id)a4 inRGBA:(id)a5 inRGBRadius:(id)a6 inRandomGauss:(id)a7 bicubicSampling:(BOOL)a8;
- (void)interpolateRGBRadiusUsingSourceToDest:(id)a3 renderRequest:(id)a4 inRGBRadius:(id)a5 inRandomGauss:(id)a6 bicubicSampling:(BOOL)a7;
@end

@implementation PTRaytracingUtilsV1

- (PTRaytracingUtilsV1)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v128.receiver = self;
  v128.super_class = (Class)PTRaytracingUtilsV1;
  v6 = [(PTRaytracingUtilsV1 *)&v128 init];
  v7 = v6;
  if (v6)
  {
    p_metalContext = (id *)&v6->_metalContext;
    objc_storeStrong((id *)&v6->_metalContext, a3);
    v9 = objc_opt_new();
    [v9 setNormalizedCoordinates:1];
    [v9 setMinFilter:1];
    [v9 setMagFilter:1];
    v10 = [v5 device];
    uint64_t v11 = [v10 newSamplerStateWithDescriptor:v9];
    sNLE = v7->_sNLE;
    v7->_sNLE = (MTLSamplerState *)v11;

    if (v7->_sNLE)
    {
      [v9 setMinFilter:2];
      [v9 setMagFilter:2];
      v13 = [v5 device];
      uint64_t v14 = [v13 newSamplerStateWithDescriptor:v9];
      sNBE = v7->_sNBE;
      v7->_sNBE = (MTLSamplerState *)v14;

      uint64_t v16 = [(PTMetalContext *)v7->_metalContext computePipelineStateFor:@"centerDisparityOnFocus_V1" withConstants:0];
      centerDisparityOnFocus = v7->_centerDisparityOnFocus;
      v7->_centerDisparityOnFocus = (MTLComputePipelineState *)v16;

      if (v7->_centerDisparityOnFocus)
      {
        uint64_t v18 = [(PTMetalContext *)v7->_metalContext computePipelineStateFor:@"sobelEdgeDetector_V1" withConstants:0];
        sobelEdgeDetector = v7->_sobelEdgeDetector;
        v7->_sobelEdgeDetector = (MTLComputePipelineState *)v18;

        if (v7->_sobelEdgeDetector)
        {
          uint64_t v20 = [(PTMetalContext *)v7->_metalContext computePipelineStateFor:@"edgeDilation_V1" withConstants:0];
          edgeDilation = v7->_edgeDilation;
          v7->_edgeDilation = (MTLComputePipelineState *)v20;

          if (v7->_edgeDilation)
          {
            uint64_t v22 = [(PTMetalContext *)v7->_metalContext computePipelineStateFor:@"focusEdgeMask_V1" withConstants:0];
            focusEdgeMask = v7->_focusEdgeMask;
            v7->_focusEdgeMask = (MTLComputePipelineState *)v22;

            if (v7->_focusEdgeMask)
            {
              id v124 = v5;
              v24 = objc_opt_new();
              uint64_t v25 = 0;
              interpolateRGBRadiusToDestYUV = v7->_interpolateRGBRadiusToDestYUV;
              interpolateRGBRadiusToDestYUVFromSource = v7->_interpolateRGBRadiusToDestYUVFromSource;
              interpolateRGBRadiusToDestRGBA = v7->_interpolateRGBRadiusToDestRGBA;
              interpolateRGBRadiusToDestRGBAFromSource = v7->_interpolateRGBRadiusToDestRGBAFromSource;
              convertRGBPyramidFromYUV = v7->_convertRGBPyramidFromYUV;
              convertRGBPyramid = v7->_convertRGBPyramid;
              while (1)
              {
                unsigned int v127 = supportedColorTransferFunctions[v25];
                [v24 reset];
                [v24 setConstantValue:&v127 type:29 withName:@"kColorTransferFunctionToLinear"];
                uint64_t v30 = [*p_metalContext computePipelineStateFor:@"interpolateRGBRadiusToDestYUV_V1" withConstants:v24];
                v31 = interpolateRGBRadiusToDestYUV[v127];
                interpolateRGBRadiusToDestYUV[v127] = (MTLComputePipelineState *)v30;

                if (!interpolateRGBRadiusToDestYUV[v127]) {
                  break;
                }
                uint64_t v32 = [*p_metalContext computePipelineStateFor:@"interpolateRGBRadiusToDestYUVFromSource_V1" withConstants:v24];
                v33 = interpolateRGBRadiusToDestYUVFromSource[v127];
                interpolateRGBRadiusToDestYUVFromSource[v127] = (MTLComputePipelineState *)v32;

                if (!interpolateRGBRadiusToDestYUVFromSource[v127])
                {
                  v80 = _PTLogSystem();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingUtilsV1 initWithMetalContext:].cold.7(v80, v88, v89, v90, v91, v92, v93, v94);
                  }
                  goto LABEL_39;
                }
                uint64_t v34 = [*p_metalContext computePipelineStateFor:@"interpolateRGBRadiusToDestRGB_V1" withConstants:v24];
                v35 = interpolateRGBRadiusToDestRGBA[v127];
                interpolateRGBRadiusToDestRGBA[v127] = (MTLComputePipelineState *)v34;

                if (!interpolateRGBRadiusToDestRGBA[v127])
                {
                  v80 = _PTLogSystem();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingUtilsV1 initWithMetalContext:].cold.8(v80, v95, v96, v97, v98, v99, v100, v101);
                  }
                  goto LABEL_39;
                }
                uint64_t v36 = [*p_metalContext computePipelineStateFor:@"interpolateRGBRadiusToDestRGBFromSource_V1" withConstants:v24];
                v37 = interpolateRGBRadiusToDestRGBAFromSource[v127];
                interpolateRGBRadiusToDestRGBAFromSource[v127] = (MTLComputePipelineState *)v36;

                if (!interpolateRGBRadiusToDestRGBAFromSource[v127])
                {
                  v80 = _PTLogSystem();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingUtilsV1 initWithMetalContext:].cold.9(v80, v102, v103, v104, v105, v106, v107, v108);
                  }
                  goto LABEL_39;
                }
                uint64_t v38 = [*p_metalContext computePipelineStateFor:@"convertRGBPyramid_V1" withConstants:v24];
                v39 = convertRGBPyramid[v127];
                convertRGBPyramid[v127] = (MTLComputePipelineState *)v38;

                if (!convertRGBPyramid[v127])
                {
                  v80 = _PTLogSystem();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingUtilsV1 initWithMetalContext:]0(v80, v109, v110, v111, v112, v113, v114, v115);
                  }
                  goto LABEL_39;
                }
                uint64_t v40 = [*p_metalContext computePipelineStateFor:@"convertRGBPyramidFromYUV_V1" withConstants:v24];
                v41 = convertRGBPyramidFromYUV[v127];
                convertRGBPyramidFromYUV[v127] = (MTLComputePipelineState *)v40;

                if (!convertRGBPyramidFromYUV[v127])
                {
                  v80 = _PTLogSystem();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
                    -[PTRaytracingUtilsV1 initWithMetalContext:]1(v80, v116, v117, v118, v119, v120, v121, v122);
                  }
                  goto LABEL_39;
                }
                if (++v25 == 5)
                {
                  v42 = [[PTRandom alloc] initWithSeed:0x7FFFFFFFLL];
                  random = v7->_random;
                  v7->_random = v42;

                  v44 = v7;
                  id v5 = v124;
                  goto LABEL_41;
                }
              }
              v80 = _PTLogSystem();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
                -[PTRaytracingUtilsV1 initWithMetalContext:].cold.6(v80, v81, v82, v83, v84, v85, v86, v87);
              }
LABEL_39:
              id v5 = v124;
            }
            else
            {
              v24 = _PTLogSystem();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                -[PTRaytracingUtils initWithMetalContext:].cold.6(v24, v73, v74, v75, v76, v77, v78, v79);
              }
            }
          }
          else
          {
            v24 = _PTLogSystem();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              -[PTRaytracingUtils initWithMetalContext:].cold.5(v24, v66, v67, v68, v69, v70, v71, v72);
            }
          }
        }
        else
        {
          v24 = _PTLogSystem();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[PTRaytracingUtils initWithMetalContext:].cold.4(v24, v59, v60, v61, v62, v63, v64, v65);
          }
        }
      }
      else
      {
        v24 = _PTLogSystem();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[PTRaytracingUtilsV2 initWithMetalContext:](v24, v52, v53, v54, v55, v56, v57, v58);
        }
      }
    }
    else
    {
      v24 = _PTLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[PTRaytracingUtilsV1 initWithMetalContext:](v24, v45, v46, v47, v48, v49, v50, v51);
      }
    }
    v44 = 0;
LABEL_41:
  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (id)sNBE
{
  return self->_sNBE;
}

- (id)sNLE
{
  return self->_sNLE;
}

- (void)interpolateRGBRadiusUsingSourceToDest:(id)a3 renderRequest:(id)a4 inRGBRadius:(id)a5 inRandomGauss:(id)a6 bicubicSampling:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int32x2_t v16 = 0;
  int64x2_t v51 = 0u;
  long long v52 = 0u;
  if (v13)
  {
    [v13 scissorRect];
    int32x2_t v16 = vmovn_s64(v51);
  }
  v50[1] = v16.i16[2];
  v50[0] = v16.i16[0];
  uint64_t v17 = 488;
  if (v7) {
    uint64_t v17 = 480;
  }
  id v18 = *(id *)((char *)&self->super.isa + v17);
  int v49 = 0;
  if (v15)
  {
    -[PTRandom nextUshort2:](self->_random, "nextUshort2:", [v15 width] - 1);
    HIWORD(v49) = v19;
    LOWORD(v49) = v20;
  }
  +[PTRaytracingUtilsV1 calculateVarReadNoise:](PTRaytracingUtilsV1, "calculateVarReadNoise:", v13, v52);
  v48[0] = v21;
  v48[1] = v22;
  v23 = [v13 destinationColor];
  v24 = [v23 transferFunction];
  int v25 = +[PTColorConversion getTransferFunction:v24 toLinear:1];

  v26 = [v13 destinationColor];
  LODWORD(v24) = [v26 isRGB];

  if (v24)
  {
    [v12 setComputePipelineState:self->_interpolateRGBRadiusToDestRGBAFromSource[v25]];
    v27 = [v13 sourceColor];
    v28 = [v27 texRGBA];
    [v12 setTexture:v28 atIndex:0];

    [v12 setTexture:v14 atIndex:1];
    [v12 setTexture:v15 atIndex:2];
    v29 = [v13 destinationColor];
    uint64_t v30 = [v29 texRGBA];
    [v12 setTexture:v30 atIndex:3];

    [v12 setBytes:v48 length:8 atIndex:0];
    [v12 setBytes:v50 length:4 atIndex:1];
    v31 = v12;
    uint64_t v32 = 2;
  }
  else
  {
    long long v46 = 0uLL;
    uint64_t v47 = 0;
    v33 = [v13 destinationColor];
    +[PTColorConversion getColorMatrix:v33 toRGB:0];

    long long v44 = 0uLL;
    uint64_t v45 = 0;
    uint64_t v34 = [v13 destinationColor];
    +[PTColorConversion getColorMatrix:v34 toRGB:1];

    [v12 setComputePipelineState:self->_interpolateRGBRadiusToDestYUVFromSource[v25]];
    v35 = [v13 sourceColor];
    uint64_t v36 = [v35 texLuma];
    [v12 setTexture:v36 atIndex:0];

    v37 = [v13 sourceColor];
    uint64_t v38 = [v37 texChroma];
    [v12 setTexture:v38 atIndex:1];

    [v12 setTexture:v14 atIndex:2];
    [v12 setTexture:v15 atIndex:3];
    v39 = [v13 destinationColor];
    uint64_t v40 = [v39 texLuma];
    [v12 setTexture:v40 atIndex:4];

    v41 = [v13 destinationColor];
    v42 = [v41 texChroma];
    [v12 setTexture:v42 atIndex:5];

    [v12 setBytes:v48 length:8 atIndex:0];
    [v12 setBytes:&v46 length:24 atIndex:1];
    [v12 setBytes:&v44 length:24 atIndex:2];
    [v12 setBytes:v50 length:4 atIndex:3];
    v31 = v12;
    uint64_t v32 = 4;
  }
  [v31 setBytes:&v49 length:4 atIndex:v32];
  [v12 setSamplerState:v18 atIndex:0];
  long long v46 = v43;
  uint64_t v47 = 1;
  long long v44 = xmmword_1D081F8E0;
  uint64_t v45 = 1;
  [v12 dispatchThreads:&v46 threadsPerThreadgroup:&v44];
}

- (void)interpolateRGBRadiusToDest:(id)a3 renderRequest:(id)a4 inRGBA:(id)a5 inRGBRadius:(id)a6 inRandomGauss:(id)a7 bicubicSampling:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a3;
  +[PTRaytracingUtilsV1 calculateVarReadNoise:v14];
  v47[0] = v19;
  v47[1] = v20;
  int32x2_t v21 = 0;
  int64x2_t v45 = 0u;
  long long v46 = 0u;
  if (v14)
  {
    [v14 scissorRect];
    int32x2_t v21 = vmovn_s64(v45);
  }
  v44[1] = v21.i16[2];
  v44[0] = v21.i16[0];
  uint64_t v22 = 488;
  if (v8) {
    uint64_t v22 = 480;
  }
  id v23 = *(id *)((char *)&self->super.isa + v22);
  int v43 = 0;
  if (v17)
  {
    -[PTRandom nextUshort2:](self->_random, "nextUshort2:", [v17 width] - 1);
    HIWORD(v43) = v24;
    LOWORD(v43) = v25;
  }
  v26 = [v14 destinationColor];
  v27 = [v26 transferFunction];
  int v28 = +[PTColorConversion getTransferFunction:v27 toLinear:1];

  v29 = [v14 destinationColor];
  LODWORD(v27) = [v29 isRGB];

  if (v27)
  {
    [v18 setComputePipelineState:self->_interpolateRGBRadiusToDestRGBA[v28]];
    [v18 setTexture:v15 atIndex:0];
    [v18 setTexture:v16 atIndex:1];
    [v18 setTexture:v17 atIndex:2];
    uint64_t v30 = [v14 destinationColor];
    v31 = [v30 texRGBA];
    [v18 setTexture:v31 atIndex:3];

    [v18 setBytes:v47 length:8 atIndex:0];
    [v18 setBytes:v44 length:4 atIndex:1];
    uint64_t v32 = v18;
    uint64_t v33 = 2;
  }
  else
  {
    long long v41 = 0uLL;
    uint64_t v42 = 0;
    uint64_t v34 = [v14 destinationColor];
    +[PTColorConversion getColorMatrix:v34 toRGB:0];

    [v18 setComputePipelineState:self->_interpolateRGBRadiusToDestYUV[v28]];
    [v18 setTexture:v15 atIndex:0];
    [v18 setTexture:v16 atIndex:1];
    [v18 setTexture:v17 atIndex:2];
    v35 = [v14 destinationColor];
    uint64_t v36 = [v35 texLuma];
    [v18 setTexture:v36 atIndex:3];

    v37 = [v14 destinationColor];
    uint64_t v38 = [v37 texChroma];
    [v18 setTexture:v38 atIndex:4];

    [v18 setBytes:v47 length:8 atIndex:0];
    [v18 setBytes:&v41 length:24 atIndex:1];
    [v18 setBytes:v44 length:4 atIndex:2];
    uint64_t v32 = v18;
    uint64_t v33 = 3;
  }
  [v32 setBytes:&v43 length:4 atIndex:v33];
  [v18 setSamplerState:v23 atIndex:0];
  long long v39 = v46;
  uint64_t v40 = 1;
  long long v41 = xmmword_1D081F8E0;
  uint64_t v42 = 1;
  [v18 dispatchThreads:&v39 threadsPerThreadgroup:&v41];
}

- (int)convertRGBPyramidFromSource:(id)a3 renderRequest:(id)a4 rgbaPyramidArray:(id)a5 skipLevel0:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  id v13 = [v10 sourceColor];
  id v14 = [v13 transferFunction];
  int v15 = +[PTColorConversion getTransferFunction:v14 toLinear:1];

  id v16 = [v12 computeCommandEncoder];

  if (!v16)
  {
    id v17 = _PTLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  __int16 v25 = [v10 sourceColor];
  int v26 = [v25 isRGB];

  if (v26)
  {
    [v16 setComputePipelineState:self->_convertRGBPyramid[v15]];
    v27 = [v10 sourceColor];
    int v28 = [v27 texRGBA];
    [v16 setTexture:v28 atIndex:0];

    if (v6)
    {
      [v16 setTexture:0 atIndex:1];
    }
    else
    {
      uint64_t v34 = [v11 objectAtIndexedSubscript:0];
      [v16 setTexture:v34 atIndex:1];
    }
    v35 = [v11 objectAtIndexedSubscript:1];
    [v16 setTexture:v35 atIndex:2];
  }
  else
  {
    long long v43 = 0uLL;
    uint64_t v44 = 0;
    v29 = [v10 sourceColor];
    +[PTColorConversion getColorMatrix:v29 toRGB:1];

    [v16 setComputePipelineState:self->_convertRGBPyramidFromYUV[v15]];
    uint64_t v30 = [v10 sourceColor];
    v31 = [v30 texLuma];
    [v16 setTexture:v31 atIndex:0];

    uint64_t v32 = [v10 sourceColor];
    uint64_t v33 = [v32 texChroma];
    [v16 setTexture:v33 atIndex:1];

    if (v6)
    {
      [v16 setTexture:0 atIndex:2];
    }
    else
    {
      uint64_t v36 = [v11 objectAtIndexedSubscript:0];
      [v16 setTexture:v36 atIndex:2];
    }
    v37 = [v11 objectAtIndexedSubscript:1];
    [v16 setTexture:v37 atIndex:3];

    [v16 setBytes:&v43 length:24 atIndex:0];
  }
  uint64_t v38 = [v10 sourceColor];
  unint64_t v39 = (unint64_t)[v38 width] >> 1;
  uint64_t v40 = [v10 sourceColor];
  v42[0] = v39;
  v42[1] = (unint64_t)[v40 height] >> 1;
  v42[2] = 1;
  long long v43 = xmmword_1D081F8F0;
  uint64_t v44 = 1;
  [v16 dispatchThreads:v42 threadsPerThreadgroup:&v43];

  [v16 endEncoding];
  return 0;
}

- (void)focusEdgeMask:(id)a3 inDisparityDiff:(id)a4 focusObject:(PTFocus *)a5 focusEdge:(PTFocusEdge)a6 outFocusEdgeMask:(id)a7
{
  PTFocusEdge v19 = a6;
  id v11 = a7;
  id v12 = a4;
  id v13 = [a3 computeCommandEncoder];
  [v13 setComputePipelineState:self->_focusEdgeMask];
  [v13 setTexture:v12 atIndex:0];

  [v13 setTexture:v11 atIndex:1];
  [v13 setBytes:a5 length:40 atIndex:0];
  [v13 setBytes:&v19 length:16 atIndex:1];
  uint64_t v14 = [v11 width];
  uint64_t v15 = [v11 height];

  v18[0] = v14;
  v18[1] = v15;
  v18[2] = 1;
  long long v16 = xmmword_1D081F8E0;
  uint64_t v17 = 1;
  [v13 dispatchThreads:v18 threadsPerThreadgroup:&v16];
  [v13 endEncoding];
}

- (void)centerDisparityOnFocus:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 focusObject:(PTFocus *)a6
{
  float v26 = flt_1D081FA50[(float)(a6->var2 * 1000.0) > 70.0] / a6->var0;
  id v10 = a5;
  id v11 = a4;
  id v12 = [a3 computeCommandEncoder];
  if (!v12)
  {
    id v13 = _PTLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  [v12 setComputePipelineState:self->_centerDisparityOnFocus];
  [v12 setTexture:v11 atIndex:0];

  [v12 setTexture:v10 atIndex:1];
  [v12 setBytes:&a6->var1 length:4 atIndex:0];
  [v12 setBytes:&v26 length:4 atIndex:1];
  uint64_t v21 = [v10 width];
  uint64_t v22 = [v10 height];

  v25[0] = v21;
  v25[1] = v22;
  v25[2] = 1;
  long long v23 = xmmword_1D081F8F0;
  uint64_t v24 = 1;
  [v12 dispatchThreads:v25 threadsPerThreadgroup:&v23];
  [v12 endEncoding];
}

- (int)detectDilatedEdges:(id)a3 inDisparity:(id)a4 tempEdges:(id)a5 outEdges:(id)a6 focusObject:(PTFocus *)a7 disparityDiffMinMax:(id)a8 edgeTolerance:(float)a9
{
  float v42 = a9;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  uint64_t v19 = [a3 computeCommandEncoder];
  if (!v19)
  {
    uint64_t v20 = _PTLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
  [v19 setComputePipelineState:self->_sobelEdgeDetector];
  [v19 setTexture:v18 atIndex:0];
  [v19 setTexture:v16 atIndex:1];
  [v19 setBytes:&v42 length:4 atIndex:0];
  v41[0] = [v16 width];
  v41[1] = [v16 height];
  v41[2] = 1;
  long long v39 = xmmword_1D081F8F0;
  uint64_t v40 = 1;
  [v19 dispatchThreads:v41 threadsPerThreadgroup:&v39];
  float var2 = a7->var2;
  +[PTRaytracingUtilsV1 frameWidth];
  float v30 = (float)(var2 / v29) * a7->var0;
  unint64_t v31 = [v18 width];

  float v38 = v30 * (float)v31;
  char v37 = 1;
  [v19 setComputePipelineState:self->_edgeDilation];
  [v19 setTexture:v16 atIndex:0];
  [v19 setTexture:v17 atIndex:1];
  [v19 setBytes:&v37 length:1 atIndex:0];
  [v19 setBytes:&v38 length:4 atIndex:1];
  [v19 setBuffer:v15 offset:0 atIndex:2];
  v36[0] = [v16 width];
  v36[1] = [v16 height];
  v36[2] = 1;
  long long v39 = xmmword_1D081F8F0;
  uint64_t v40 = 1;
  [v19 dispatchThreads:v36 threadsPerThreadgroup:&v39];
  char v37 = 0;
  [v19 setComputePipelineState:self->_edgeDilation];
  [v19 setTexture:v17 atIndex:0];

  [v19 setTexture:v16 atIndex:1];
  [v19 setBytes:&v37 length:1 atIndex:0];
  [v19 setBytes:&v38 length:4 atIndex:1];
  [v19 setBuffer:v15 offset:0 atIndex:2];

  uint64_t v32 = [v16 width];
  uint64_t v33 = [v16 height];

  v35[0] = v32;
  v35[1] = v33;
  v35[2] = 1;
  long long v39 = xmmword_1D081F8F0;
  uint64_t v40 = 1;
  [v19 dispatchThreads:v35 threadsPerThreadgroup:&v39];
  [v19 endEncoding];

  return 0;
}

+ (PTFocus)createFocusObject:(SEL)a3 pyramidSamplingFraction:(id)a4 anamorphicFactor:(float)a5 raytracingRadiusLocal:(float)a6 rayCount:(float)a7 colorSize:(int)a8 doMacroApertureLimit:(BOOL)a9
{
  BOOL v10 = a9;
  float32x2_t v49 = v9;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  [v15 focusDisparity];
  float v17 = v16;
  [v15 fNumber];
  float v19 = v18;
  [v15 alphaLowLight];
  float v21 = v20;
  [v15 focalLenIn35mmFilm];
  float v23 = v22;
  [v15 visCropFactor];
  float v47 = v24;
  [v15 visCropFactor];
  long long v46 = v25;
  double v26 = v17;
  if (v17 > 10.0 || v26 < 0.025)
  {
    uint64_t v27 = _PTLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v51 = v17;
      _os_log_impl(&dword_1D0778000, v27, OS_LOG_TYPE_INFO, "FocusDistance will be clipped during rendering. Was %f", buf, 0xCu);
    }
  }
  *(void *)&retstr[1].float var2 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  double v28 = 0.025;
  if (v26 >= 0.025) {
    double v28 = v17;
  }
  float v29 = fmin(v28, 10.0);
  retstr->var1 = v29;
  if (v10)
  {
    if ([v15 sensorID] == 19)
    {
      float v30 = 6.6;
      float v31 = 0.4;
    }
    else
    {
      float v30 = 2.8;
      float v31 = 1.3333;
    }
    objc_msgSend(v15, "networkBias", v46);
    double v33 = (float)((float)((float)(v30 * (float)(v29 - v32)) / v31) * 0.33333) + v19 * 0.666666657;
    if (v33 >= v19)
    {
      float v34 = v33;
      float v19 = v34;
    }
  }
  float v35 = *((float *)&v46 + 1);
  if (v47 >= *((float *)&v46 + 1)) {
    float v35 = v47;
  }
  double v36 = 0.1;
  if (v19 >= 0.1) {
    double v36 = v19;
  }
  float v37 = (float)(1.0 - v21) * 22.0 + v36 * v21;
  double v38 = v23 / 1000.0 * v35;
  *(float *)&double v38 = v38;
  retstr->float var2 = *(float *)&v38;
  double v40 = *(float *)&v38;
  float v39 = *(float *)&v38 / (v37 + v37);
  retstr->var0 = v39;
  LODWORD(v40) = 1024685244;
  if (v49.f32[1] <= v49.f32[0])
  {
    v41.i32[0] = vdup_lane_s32(*(int32x2_t *)&v40, 0).u32[0];
    v41.f32[1] = vmuls_lane_f32(0.036, v49, 1) / v49.f32[0];
  }
  else
  {
    float32x2_t v41 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v40, 0);
    v41.f32[0] = (float)(v49.f32[0] * 0.036) / v49.f32[1];
  }
  *(float *)v42.i32 = 1.0 / a6;
  *(float *)&v42.i32[1] = a6;
  float v43 = v39 / (a7 + 1.0);
  float32x2_t v44 = vdiv_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v38, 0), v41);
  *(float32x2_t *)&retstr[1].var0 = vmul_n_f32(vmul_f32((float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32((float32x2_t)(v49.u32[1] | 0x408F400000000000), v49), 0), (int8x8_t)vrev64_s32(v42), (int8x8_t)v42), v44), v43);
  *(float *)v42.i32 = 1.0 / sqrt((double)a8 / 3.14159265) * a5;
  retstr->var3 = (float)(v49.f32[0] * (float)(v43 * v44.f32[0])) * *(float *)v42.i32;
  LODWORD(retstr->var4) = v42.i32[0];
  retstr[1].float var2 = 0.02 / *(float *)v42.i32;

  return result;
}

+ (PTFocusEdge)createFocusEdge
{
  float v2 = 0.0015;
  float v3 = 0.1;
  float v4 = 0.5;
  float v5 = 1.5;
  result.minMaxThreshold = v3;
  result.gradientWeight = v5;
  result.gradientThreshold = v4;
  result.width = v2;
  return result;
}

+ (float)focalLength
{
  return 0.032;
}

+ (float)frameWidth
{
  return 0.036;
}

+ (id)precomputeNoise:(id)a3 sideLength:(int)a4
{
  id v5 = a3;
  int v6 = a4 * a4;
  BOOL v7 = [MEMORY[0x1E4F1CA58] dataWithLength:(4 * a4 * a4)];
  BOOL v8 = [[PTRandom alloc] initWithSeed:0x7FFFFFFFLL];
  id v9 = v7;
  uint64_t v10 = [v9 bytes];
  uint64_t v11 = v10;
  if (a4)
  {
    if ((2 * v6) <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = (2 * v6);
    }
    id v13 = (_WORD *)v10;
    do
    {
      [(PTRandom *)v8 nextFloat];
      *v13++ = (int)v14;
      --v12;
    }
    while (v12);
  }
  id v15 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:60 width:a4 height:a4 mipmapped:0];
  [v15 setUsage:3];
  float v16 = (void *)[v5 newTextureWithDescriptor:v15];
  memset(v18, 0, 24);
  void v18[3] = a4;
  v18[4] = a4;
  v18[5] = 1;
  [v16 replaceRegion:v18 mipmapLevel:0 withBytes:v11 bytesPerRow:4 * a4];

  return v16;
}

+ (PTNoiseValues)calculateVarReadNoise:(id)a3
{
  id v3 = a3;
  int v4 = [v3 AGC];
  int v5 = [v3 conversionGain];
  int v6 = objc_msgSend(v3, "readNoise_1x");
  int v7 = objc_msgSend(v3, "readNoise_8x");
  int v8 = [v3 sensorID];
  if (v8 == 1811 || v8 == 1300) {
    double v10 = 2.0;
  }
  else {
    double v10 = 1.0;
  }
  uint64_t v11 = [v3 renderState];
  int v12 = [v11 sourceColorBitDepth];

  [v3 totalSensorCropRectSize];
  double v14 = v13;
  id v15 = [v3 sourceColor];
  double v16 = v14 / (double)(unint64_t)[v15 width];
  [v3 totalSensorCropRectSize];
  double v18 = v16 * v17;
  float v19 = [v3 sourceColor];

  float v20 = v10 / (v18 / (double)(unint64_t)[v19 height]);
  float v21 = v20 / 1023.0;
  if (v12 == 10) {
    float v21 = (float)(v20 / 1023.0) * 12.0;
  }
  float v22 = (float)v4 / 255.0;
  float v23 = (float)((float)v5 / 65535.0) * v21;
  float v24 = (float)((float)v6 / 65535.0) * (float)((float)v6 / 65535.0);
  float v25 = (float)(v24 - (float)((float)((float)v7 / 65535.0) * (float)((float)v7 / 65535.0))) / 0.98438;
  float v26 = v23 * (float)((float)(v25 + (float)((float)(v22 * (float)(v24 - v25)) * v22)) * v23);
  float v27 = v22 * v23;
  result.var1 = v27;
  result.var0 = v26;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_random, 0);
  objc_storeStrong((id *)&self->_sNLE, 0);
  objc_storeStrong((id *)&self->_sNBE, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_edgeDilation, 0);
  objc_storeStrong((id *)&self->_sobelEdgeDetector, 0);
  objc_storeStrong((id *)&self->_centerDisparityOnFocus, 0);
  for (uint64_t i = 0; i != -9; --i)
    objc_storeStrong((id *)&self->_convertRGBPyramidFromYUV[i + 8], 0);
  for (uint64_t j = 0; j != -9; --j)
    objc_storeStrong((id *)&self->_convertRGBPyramid[j + 8], 0);
  for (uint64_t k = 0; k != -9; --k)
    objc_storeStrong((id *)&self->_interpolateRGBRadiusToDestRGBAFromSource[k + 8], 0);
  for (uint64_t m = 0; m != -9; --m)
    objc_storeStrong((id *)&self->_interpolateRGBRadiusToDestYUVFromSource[m + 8], 0);
  for (uint64_t n = 152; n != 80; n -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + n), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + n), 0);
    n -= 8;
  }
  while (n != 8);

  objc_storeStrong((id *)&self->_focusEdgeMask, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end