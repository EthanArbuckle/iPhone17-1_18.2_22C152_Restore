@interface PTUtil
+ (double)mirrorMatrix4x4OverX:(__n128)a3;
+ (double)transformFromRotation:(__n128)a3 translation:(__n128)a4;
+ (float)adjustIntrinsics:(double)a3 fromImageSize:(double)a4 toViewPortSize:(double)a5;
+ (float)perspectiveProjectionFieldOfView:(float)a1 aspectRatio:(float)a2 depthNearFar:reverseZ:;
+ (float)perspectiveProjectionFromIntrinsics:(float)a1 colorSize:(uint64_t)a2 depthNearFar:(uint64_t)a3 reverseZ:(unint64_t *)a4;
+ (float)projectionMatrixForOrientation:(double)a3 intrinsics:(double)a4 fromImageSize:(double)a5 viewportSize:(float64_t)a6 reverseZ:(float64_t)a7 depthNearFar:;
+ (id)findMipmapLevel:(id)a3 largerThan:(id *)a4;
+ (id)findMipmapLevel:(id)a3 largerThan:(id *)a4 fromLevel:(int)a5;
+ (id)temporaryDirectory:(id)a3;
+ (int)getRotationDegreesFromAffineTransform:(CGAffineTransform *)a3;
+ (int)orientationForTransform:(CGAffineTransform *)a3 size:(id *)a4;
+ (unsigned)orientationFromTransform:(CGAffineTransform *)a3;
+ (unsigned)orientationFromTransform:(CGAffineTransform *)a3 inverse:(BOOL)a4;
- (PTUtil)initWithMetalContext:(id)a3;
- (int)_drawTurboLegendTick:(id)a3 outTexture:(id)a4 rect:(id *)a5 maxValue:(float)a6;
- (int)drawTurboLegend:(id)a3 outLuma:(id)a4 outChroma:(id)a5 rect:(id *)a6 maxValue:(float)a7;
- (int)drawTurboLegend:(id)a3 outRGBA:(id)a4 rect:(id *)a5 maxValue:(float)a6;
- (int)gaussianFilter3x3:(id)a3 inRGB:(id)a4 outRGB:(id)a5;
- (int)gaussianNoise:(id)a3 inNoise:(id)a4 outTex:(id)a5;
- (int)reciprocalTex:(id)a3 inTex:(id)a4 outTex:(id)a5 epsilon:(float)a6;
- (int)renderDisparity:(id)a3 inDisparity:(id)a4 outYUV:(id)a5 region:(PTRegion)a6 drawLegend:(BOOL)a7;
- (int)renderLine:(PTUtil *)self line:(SEL)a2 color:(id)a3 outTexture:(id)a4;
- (int)renderRect:(PTUtil *)self rect:(SEL)a2 color:(id)a3 fill:(BOOL)a4 outTexture:(id)a5;
- (int)sobelFilterSingleChannelColor:(id)a3 input:(id)a4 output:(id)a5 scale:(float)a6;
- (int)visualizeCircleUsingRect:(id)a3 center:(float)a4 radius:(id)a5 outTexture:;
- (void)rotateTexture:(id)a3 inTex:(id)a4 outTex:(id)a5 rotationDegrees:(int)a6;
@end

@implementation PTUtil

- (PTUtil)initWithMetalContext:(id)a3
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v124.receiver = self;
  v124.super_class = (Class)PTUtil;
  v6 = [(PTUtil *)&v124 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_35;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  uint64_t v8 = [v5 computePipelineStateFor:@"renderDisparity" withConstants:0];
  renderDisparity = v7->_renderDisparity;
  v7->_renderDisparity = (MTLComputePipelineState *)v8;

  if (!v7->_renderDisparity)
  {
    v42 = _PTLogSystem();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[PTUtil initWithMetalContext:](v42, v43, v44, v45, v46, v47, v48, v49);
    }
    goto LABEL_34;
  }
  uint64_t v10 = [v5 computePipelineStateFor:@"reciprocal" withConstants:0];
  reciprocal = v7->_reciprocal;
  v7->_reciprocal = (MTLComputePipelineState *)v10;

  if (!v7->_reciprocal)
  {
    v42 = _PTLogSystem();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[PTUtil initWithMetalContext:](v42, v50, v51, v52, v53, v54, v55, v56);
    }
    goto LABEL_34;
  }
  uint64_t v12 = [v5 computePipelineStateFor:@"sobelFilter" withConstants:0];
  sobelFilter = v7->_sobelFilter;
  v7->_sobelFilter = (MTLComputePipelineState *)v12;

  if (!v7->_sobelFilter)
  {
    v42 = _PTLogSystem();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[PTUtil initWithMetalContext:](v42, v57, v58, v59, v60, v61, v62, v63);
    }
    goto LABEL_34;
  }
  uint64_t v14 = [v5 computePipelineStateFor:@"gaussianNoise" withConstants:0];
  gaussianNoise = v7->_gaussianNoise;
  v7->_gaussianNoise = (MTLComputePipelineState *)v14;

  if (!v7->_gaussianNoise)
  {
    v42 = _PTLogSystem();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[PTUtil initWithMetalContext:].cold.4(v42, v64, v65, v66, v67, v68, v69, v70);
    }
    goto LABEL_34;
  }
  uint64_t v16 = [v5 computePipelineStateFor:@"renderRect" withConstants:0];
  renderRect = v7->_renderRect;
  v7->_renderRect = (MTLComputePipelineState *)v16;

  if (!v7->_renderRect)
  {
    v42 = _PTLogSystem();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[PTUtil initWithMetalContext:].cold.5(v42, v71, v72, v73, v74, v75, v76, v77);
    }
    goto LABEL_34;
  }
  uint64_t v18 = [v5 computePipelineStateFor:@"renderLine" withConstants:0];
  renderLine = v7->_renderLine;
  v7->_renderLine = (MTLComputePipelineState *)v18;

  if (!v7->_renderLine)
  {
    v42 = _PTLogSystem();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[PTUtil initWithMetalContext:].cold.6(v42, v78, v79, v80, v81, v82, v83, v84);
    }
    goto LABEL_34;
  }
  uint64_t v20 = [v5 computePipelineStateFor:@"visualizeCircleUsingRect" withConstants:0];
  visualizeCircleUsingRect = v7->_visualizeCircleUsingRect;
  v7->_visualizeCircleUsingRect = (MTLComputePipelineState *)v20;

  if (!v7->_visualizeCircleUsingRect)
  {
    v42 = _PTLogSystem();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[PTUtil initWithMetalContext:].cold.7(v42, v85, v86, v87, v88, v89, v90, v91);
    }
    goto LABEL_34;
  }
  uint64_t v22 = [v5 computePipelineStateFor:@"drawTurboLegend" withConstants:0];
  drawTurboLegend = v7->_drawTurboLegend;
  v7->_drawTurboLegend = (MTLComputePipelineState *)v22;

  if (!v7->_drawTurboLegend)
  {
    v42 = _PTLogSystem();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[PTUtil initWithMetalContext:].cold.8(v42, v92, v93, v94, v95, v96, v97, v98);
    }
    goto LABEL_34;
  }
  uint64_t v24 = [v5 computePipelineStateFor:@"drawTurboLegendYUV" withConstants:0];
  drawTurboLegendYUV = v7->_drawTurboLegendYUV;
  v7->_drawTurboLegendYUV = (MTLComputePipelineState *)v24;

  if (!v7->_drawTurboLegendYUV)
  {
    v42 = _PTLogSystem();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[PTUtil initWithMetalContext:].cold.9(v42, v99, v100, v101, v102, v103, v104, v105);
    }
    goto LABEL_34;
  }
  uint64_t v26 = [v5 computePipelineStateFor:@"rotateTexture" withConstants:0];
  rotateTexture = v7->_rotateTexture;
  v7->_rotateTexture = (MTLComputePipelineState *)v26;

  if (!v7->_rotateTexture)
  {
    v42 = _PTLogSystem();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[PTUtil initWithMetalContext:]0(v42, v106, v107, v108, v109, v110, v111, v112);
    }
LABEL_34:

LABEL_35:
    v41 = 0;
    goto LABEL_36;
  }
  computeGaussianKernel2D((uint64_t)v125);
  _S0 = v125[0];
  _S1 = v125[1];
  __asm { FCVT            H0, S0 }
  v123[0] = _S0;
  __asm { FCVT            H0, S1 }
  v123[1] = _S0;
  _S0 = v125[2];
  _S1 = v125[3];
  __asm { FCVT            H0, S0 }
  v123[2] = _S0;
  __asm { FCVT            H0, S1 }
  v122[0] = _S0;
  _S0 = v125[4];
  _S1 = v125[5];
  __asm { FCVT            H0, S0 }
  v122[1] = _S0;
  __asm { FCVT            H0, S1 }
  v122[2] = _S0;
  v38 = objc_opt_new();
  [v38 setConstantHalf3:v123 withName:@"kWeights2DRow0_half3"];
  [v38 setConstantHalf3:v122 withName:@"kWeights2DRow1_half3"];
  uint64_t v39 = [v5 computePipelineStateFor:@"gaussianFilter3x3" withConstants:v38];
  gaussianFilter3x3 = v7->_gaussianFilter3x3;
  v7->_gaussianFilter3x3 = (MTLComputePipelineState *)v39;

  if (v7->_gaussianFilter3x3)
  {
    v41 = v7;
  }
  else
  {
    v114 = _PTLogSystem();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR)) {
      -[PTUtil initWithMetalContext:]1(v114, v115, v116, v117, v118, v119, v120, v121);
    }

    v41 = 0;
  }

LABEL_36:
  return v41;
}

+ (id)findMipmapLevel:(id)a3 largerThan:(id *)a4 fromLevel:(int)a5
{
  id v7 = a3;
  if ([v7 count])
  {
    unint64_t v8 = a5;
    while (1)
    {
      unint64_t v9 = v8;
      if ([v7 count] - 1 <= v8)
      {
        uint64_t v15 = [v7 lastObject];
        goto LABEL_11;
      }
      ++v8;
      uint64_t v10 = [v7 objectAtIndexedSubscript:v9 + 1];
      if ([v10 width] < a4->var0) {
        break;
      }
      v11 = [v7 objectAtIndexedSubscript:v9 + 1];
      unint64_t v12 = [v11 height];
      unint64_t var1 = a4->var1;

      if (v12 < var1) {
        goto LABEL_10;
      }
    }

LABEL_10:
    uint64_t v15 = [v7 objectAtIndexedSubscript:v9];
LABEL_11:
    uint64_t v14 = (void *)v15;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)findMipmapLevel:(id)a3 largerThan:(id *)a4
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a4;
  v4 = [a1 findMipmapLevel:a3 largerThan:&v6 fromLevel:0];

  return v4;
}

+ (int)getRotationDegreesFromAffineTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  v9[0] = *(_OWORD *)&a3->a;
  v9[1] = v4;
  v9[2] = *(_OWORD *)&a3->tx;
  unsigned int v5 = orientationForTransform((double *)v9);
  int v6 = v5;
  if (v5 < 8) {
    return dword_1D0840A40[v5];
  }
  unint64_t v8 = _PTLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[PTUtil getRotationDegreesFromAffineTransform:v8];
  }

  return 0;
}

+ (id)temporaryDirectory:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"/"])
  {
    if (([v3 hasSuffix:@"/"] & 1) == 0)
    {
      uint64_t v4 = [v3 stringByAppendingString:@"/"];

      id v3 = (id)v4;
    }
    unsigned int v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v5 fileExistsAtPath:v3])
    {
      id v6 = 0;
    }
    else
    {
      id v16 = 0;
      [v5 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v16];
      id v6 = v16;
    }
    id v3 = v3;
    unint64_t v9 = (void *)temporaryDirectory__res;
    temporaryDirectory__res = (uint64_t)v3;
    goto LABEL_10;
  }
  if (!temporaryDirectory__res)
  {
    unsigned int v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v7 = NSTemporaryDirectory();
    unint64_t v8 = (void *)temporaryDirectory__res;
    temporaryDirectory__res = v7;

    id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v6 setDateFormat:@"dd-MM-yyyy_HHmmss"];
    unint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v10 = [v6 stringFromDate:v9];
    uint64_t v11 = [(id)temporaryDirectory__res stringByAppendingFormat:@"%@/", v10];
    unint64_t v12 = (void *)temporaryDirectory__res;
    temporaryDirectory__res = v11;

    uint64_t v15 = 0;
    [v5 createDirectoryAtPath:temporaryDirectory__res withIntermediateDirectories:1 attributes:0 error:&v15];

LABEL_10:
  }
  id v13 = (id)temporaryDirectory__res;

  return v13;
}

- (int)reciprocalTex:(id)a3 inTex:(id)a4 outTex:(id)a5 epsilon:(float)a6
{
  float v26 = a6;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [a3 computeCommandEncoder];
  if (!v11)
  {
    unint64_t v12 = _PTLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  [v11 setComputePipelineState:self->_reciprocal];
  [v11 setTexture:v10 atIndex:0];

  [v11 setTexture:v9 atIndex:1];
  [v11 setBytes:&v26 length:4 atIndex:0];
  uint64_t v20 = [v9 width];
  uint64_t v21 = [v9 height];

  v25[0] = v20;
  v25[1] = v21;
  v25[2] = 1;
  long long v23 = xmmword_1D081F8F0;
  uint64_t v24 = 1;
  [v11 dispatchThreads:v25 threadsPerThreadgroup:&v23];
  [v11 endEncoding];

  return 0;
}

- (int)_drawTurboLegendTick:(id)a3 outTexture:(id)a4 rect:(id *)a5 maxValue:(float)a6
{
  if (a6 >= 0.0)
  {
    uint64_t v11 = 0;
    __asm { FMOV            V0.4S, #1.0 }
    long long v19 = _Q0;
    do
    {
      LODWORD(v17) = (int)(float)((float)(a5->var1.var0 * v11) / a6) + LODWORD(a5->var0.var0);
      HIDWORD(v17) = a5->var0.var1;
      -[PTUtil renderRect:rect:color:fill:outTexture:](self, "renderRect:rect:color:fill:outTexture:", a3, 0, a4, v17, *(double *)&v19, v19);
      ++v11;
    }
    while ((float)(int)v11 <= a6);
  }
  return 0;
}

- (int)drawTurboLegend:(id)a3 outLuma:(id)a4 outChroma:(id)a5 rect:(id *)a6 maxValue:(float)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v14 computeCommandEncoder];
  if (!v15)
  {
    uint64_t v16 = _PTLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  [v15 setComputePipelineState:self->_drawTurboLegendYUV];
  [v15 setTexture:v13 atIndex:0];
  [v15 setTexture:v12 atIndex:1];

  int32x2_t v24 = vmovn_s64(*(int64x2_t *)&a6->var0.var0);
  v24.i16[1] = v24.i16[2];
  v24.i16[2] = a6->var1.var0;
  v24.i16[3] = LOWORD(a6->var1.var1) - 20;
  int32x2_t v31 = v24;
  [v15 setBytes:&v31 length:8 atIndex:0];
  v30[0] = v31.u16[2];
  v30[1] = v31.u16[3];
  v30[2] = 1;
  long long v27 = xmmword_1D081F8F0;
  *(void *)&long long v28 = 1;
  [v15 dispatchThreads:v30 threadsPerThreadgroup:&v27];
  [v15 endEncoding];
  a6->var0.unint64_t var1 = a6->var1.var1 + a6->var0.var1 - 20;
  a6->var1.unint64_t var1 = 20;
  long long v25 = *(_OWORD *)&a6->var0.var2;
  long long v27 = *(_OWORD *)&a6->var0.var0;
  long long v28 = v25;
  long long v29 = *(_OWORD *)&a6->var1.var1;
  [(PTUtil *)self _drawTurboLegendTick:v14 outTexture:v13 rect:&v27 maxValue:COERCE_DOUBLE(__PAIR64__(DWORD1(v29), LODWORD(a7)))];

  return 0;
}

- (int)drawTurboLegend:(id)a3 outRGBA:(id)a4 rect:(id *)a5 maxValue:(float)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = [v11 computeCommandEncoder];
  if (!v12)
  {
    id v13 = _PTLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  [v12 setComputePipelineState:self->_drawTurboLegend];
  [v12 setTexture:v10 atIndex:0];
  int32x2_t v21 = vmovn_s64(*(int64x2_t *)&a5->var0.var0);
  v21.i16[1] = v21.i16[2];
  v21.i16[2] = a5->var1.var0;
  v21.i16[3] = LOWORD(a5->var1.var1) - 20;
  int32x2_t v29 = v21;
  [v12 setBytes:&v29 length:8 atIndex:0];
  unint64_t v22 = a5->var1.var1 - 20;
  v28[0] = a5->var1.var0;
  v28[1] = v22;
  v28[2] = 1;
  long long v25 = xmmword_1D081F8F0;
  *(void *)&long long v26 = 1;
  [v12 dispatchThreads:v28 threadsPerThreadgroup:&v25];
  [v12 endEncoding];
  a5->var0.unint64_t var1 = a5->var1.var1 + a5->var0.var1 - 20;
  a5->var1.unint64_t var1 = 20;
  long long v23 = *(_OWORD *)&a5->var0.var2;
  long long v25 = *(_OWORD *)&a5->var0.var0;
  long long v26 = v23;
  long long v27 = *(_OWORD *)&a5->var1.var1;
  [(PTUtil *)self _drawTurboLegendTick:v11 outTexture:v10 rect:&v25 maxValue:COERCE_DOUBLE(__PAIR64__(DWORD1(v27), LODWORD(a6)))];

  return 0;
}

- (int)gaussianNoise:(id)a3 inNoise:(id)a4 outTex:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 computeCommandEncoder];
  if (!v10)
  {
    id v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  [v10 setComputePipelineState:self->_gaussianNoise];
  [v10 setTexture:v9 atIndex:0];

  [v10 setTexture:v8 atIndex:1];
  uint64_t v19 = [v8 width];
  uint64_t v20 = [v8 height];

  v24[0] = v19;
  v24[1] = v20;
  v24[2] = 1;
  long long v22 = xmmword_1D081F8F0;
  uint64_t v23 = 1;
  [v10 dispatchThreads:v24 threadsPerThreadgroup:&v22];
  [v10 endEncoding];

  return 0;
}

- (int)sobelFilterSingleChannelColor:(id)a3 input:(id)a4 output:(id)a5 scale:(float)a6
{
  float v26 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = [a3 computeCommandEncoder];
  if (!v11)
  {
    uint64_t v12 = _PTLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  [v11 setComputePipelineState:self->_sobelFilter];
  [v11 setTexture:v10 atIndex:0];

  [v11 setTexture:v9 atIndex:1];
  [v11 setBytes:&v26 length:4 atIndex:0];
  uint64_t v20 = [v9 width];
  uint64_t v21 = [v9 height];

  v25[0] = v20;
  v25[1] = v21;
  v25[2] = 1;
  long long v23 = xmmword_1D081F8F0;
  uint64_t v24 = 1;
  [v11 dispatchThreads:v25 threadsPerThreadgroup:&v23];
  [v11 endEncoding];

  return 0;
}

- (int)renderDisparity:(id)a3 inDisparity:(id)a4 outYUV:(id)a5 region:(PTRegion)a6 drawLegend:(BOOL)a7
{
  BOOL v7 = a7;
  unint64_t v8 = *(void *)&a6.var0.var0;
  uint64_t v32 = *(void *)&a6.var0.var0;
  id v12 = a3;
  id v13 = a5;
  id v14 = a4;
  uint64_t v15 = objc_opt_new();
  [v15 setNormalizedCoordinates:1];
  [v15 setMinFilter:0];
  [v15 setMagFilter:0];
  uint64_t v16 = [(PTMetalContext *)self->_metalContext device];
  uint64_t v17 = (void *)[v16 newSamplerStateWithDescriptor:v15];

  uint64_t v18 = WORD2(v8);
  unint64_t v19 = HIWORD(v8);
  uint64_t v20 = [v12 computeCommandEncoder];
  [v20 setComputePipelineState:self->_renderDisparity];
  [v20 setTexture:v14 atIndex:0];

  uint64_t v21 = [v13 texLuma];
  [v20 setTexture:v21 atIndex:1];

  long long v22 = [v13 texChroma];
  [v20 setTexture:v22 atIndex:2];

  [v20 setBytes:&v32 length:8 atIndex:0];
  [v20 setSamplerState:v17 atIndex:0];
  v31[0] = v18;
  v31[1] = v19;
  v31[2] = 1;
  long long v29 = xmmword_1D081F8F0;
  uint64_t v30 = 1;
  [v20 dispatchThreads:v31 threadsPerThreadgroup:&v29];
  [v20 endEncoding];
  if (v7)
  {
    long long v23 = [v13 texLuma];
    uint64_t v24 = [v13 texChroma];
    memset(v26, 0, sizeof(v26));
    long long v27 = xmmword_1D0840830;
    uint64_t v28 = 1;
    [(PTUtil *)self drawTurboLegend:v12 outLuma:v23 outChroma:v24 rect:v26 maxValue:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(3.5))];
  }
  return 0;
}

- (int)visualizeCircleUsingRect:(id)a3 center:(float)a4 radius:(id)a5 outTexture:
{
  uint64_t v24 = *(void *)&a4;
  float v23 = v5;
  id v8 = a5;
  id v9 = [a3 computeCommandEncoder];
  if (!v9)
  {
    id v10 = _PTLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  [v9 setComputePipelineState:self->_visualizeCircleUsingRect];
  [v9 setTexture:v8 atIndex:0];

  [v9 setBytes:&v24 length:8 atIndex:0];
  [v9 setBytes:&v23 length:4 atIndex:1];
  float v18 = ceilf(v23);
  v22[0] = (unint64_t)(float)(v18 + v18);
  v22[1] = v22[0];
  v22[2] = 1;
  long long v20 = xmmword_1D081F8F0;
  uint64_t v21 = 1;
  [v9 dispatchThreads:v22 threadsPerThreadgroup:&v20];
  [v9 endEncoding];

  return 0;
}

- (int)renderRect:(PTUtil *)self rect:(SEL)a2 color:(id)a3 fill:(BOOL)a4 outTexture:(id)a5
{
  long long v26 = v6;
  BOOL v25 = a4;
  v5.u64[1] = (unint64_t)vmax_s32((int32x2_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL), (int32x2_t)0x100000001);
  int8x16_t v27 = v5;
  id v9 = a5;
  id v10 = [a3 computeCommandEncoder];
  if (!v10)
  {
    uint64_t v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  [v10 setComputePipelineState:self->_renderRect];
  [v10 setTexture:v9 atIndex:0];

  [v10 setBytes:&v27 length:16 atIndex:0];
  [v10 setBytes:&v26 length:16 atIndex:1];
  [v10 setBytes:&v25 length:1 atIndex:2];
  *(void *)&long long v19 = v27.i32[2];
  *((void *)&v19 + 1) = v27.i32[3];
  long long v23 = v19;
  uint64_t v24 = 1;
  long long v21 = xmmword_1D081F8F0;
  uint64_t v22 = 1;
  [v10 dispatchThreads:&v23 threadsPerThreadgroup:&v21];
  [v10 endEncoding];

  return 0;
}

- (int)renderLine:(PTUtil *)self line:(SEL)a2 color:(id)a3 outTexture:(id)a4
{
  long long v26 = v5;
  int32x4_t v27 = v4;
  int v6 = vsubq_s32(v4, vdupq_laneq_s32(v4, 2)).u32[0];
  if (v6 < 0) {
    int v6 = -v6;
  }
  int v7 = vsubq_s32(v4, vdupq_laneq_s32(v4, 3)).i32[1];
  if (v7 < 0) {
    int v7 = -v7;
  }
  if (v6 <= v7) {
    int v8 = v7;
  }
  else {
    int v8 = v6;
  }
  if (v8)
  {
    id v11 = a4;
    uint64_t v12 = [a3 computeCommandEncoder];
    if (!v12)
    {
      uint64_t v13 = _PTLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
    [v12 setComputePipelineState:self->_renderLine];
    [v12 setTexture:v11 atIndex:0];

    [v12 setBytes:&v27 length:16 atIndex:0];
    [v12 setBytes:&v26 length:16 atIndex:1];
    uint64_t v23 = 1;
    uint64_t v24 = (v8 + 1);
    int64x2_t v25 = vdupq_n_s64(1uLL);
    long long v22 = xmmword_1D081F8F0;
    [v12 dispatchThreads:&v24 threadsPerThreadgroup:&v22];
    [v12 endEncoding];
  }
  return 0;
}

- (int)gaussianFilter3x3:(id)a3 inRGB:(id)a4 outRGB:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_gaussianFilter3x3];
  [v10 setTexture:v9 atIndex:0];

  [v10 setTexture:v8 atIndex:1];
  uint64_t v11 = [v8 width];
  uint64_t v12 = [v8 height];

  v16[0] = v11;
  v16[1] = v12;
  v16[2] = 1;
  long long v14 = xmmword_1D081FE90;
  uint64_t v15 = 1;
  [v10 dispatchThreads:v16 threadsPerThreadgroup:&v14];
  [v10 endEncoding];

  return 0;
}

- (void)rotateTexture:(id)a3 inTex:(id)a4 outTex:(id)a5 rotationDegrees:(int)a6
{
  int v17 = (a6 + 360) % 360;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [a3 computeCommandEncoder];
  [v11 setComputePipelineState:self->_rotateTexture];
  [v11 setTexture:v10 atIndex:0];

  [v11 setTexture:v9 atIndex:1];
  [v11 setBytes:&v17 length:4 atIndex:0];
  uint64_t v12 = [v9 width];
  uint64_t v13 = [v9 height];

  v16[0] = v12;
  v16[1] = v13;
  v16[2] = 1;
  long long v14 = xmmword_1D081F8F0;
  uint64_t v15 = 1;
  [v11 dispatchThreads:v16 threadsPerThreadgroup:&v14];
  [v11 endEncoding];
}

+ (unsigned)orientationFromTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->tx;
  return [a1 orientationFromTransform:v5 inverse:0];
}

+ (unsigned)orientationFromTransform:(CGAffineTransform *)a3 inverse:(BOOL)a4
{
  long long v4 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v4;
  v8[2] = *(_OWORD *)&a3->tx;
  unsigned int v5 = orientationForTransform((double *)v8);
  if (v5 < 4) {
    return dword_1D0840850[v5];
  }
  int v7 = _PTLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    +[PTUtil orientationFromTransform:inverse:](v7);
  }

  return -1;
}

+ (int)orientationForTransform:(CGAffineTransform *)a3 size:(id *)a4
{
  long long v5 = *(_OWORD *)&a3->c;
  v11[0] = *(_OWORD *)&a3->a;
  v11[1] = v5;
  v11[2] = *(_OWORD *)&a3->tx;
  int v6 = orientationForTransform((double *)v11);
  unint64_t var1 = a4->var1;
  unsigned int v8 = v6 - 1;
  if (a4->var0 < var1) {
    int result = 1;
  }
  else {
    int result = 3;
  }
  if (v8 <= 6)
  {
    if (a4->var0 >= var1) {
      id v10 = &unk_1D0840A08;
    }
    else {
      id v10 = &unk_1D0840A24;
    }
    return v10[v8];
  }
  return result;
}

+ (float)adjustIntrinsics:(double)a3 fromImageSize:(double)a4 toViewPortSize:(double)a5
{
  if (a4 != a6 || a5 != a7)
  {
    HIDWORD(a1) = HIDWORD(a2);
    double v8 = a6 / a7;
    BOOL v9 = a6 / a7 < a4 / a5;
    *(float *)&double v8 = a7 / a5;
    double v10 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&v8, 0));
    *(float *)&a6 = a6 / a4;
    double v11 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&a6, 0));
    if (v9) {
      *(double *)&float32x2_t v12 = v10;
    }
    else {
      *(double *)&float32x2_t v12 = v11;
    }
    LODWORD(a1) = vmul_f32(*(float32x2_t *)&a1, v12).u32[0];
  }
  return *(float *)&a1;
}

+ (float)projectionMatrixForOrientation:(double)a3 intrinsics:(double)a4 fromImageSize:(double)a5 viewportSize:(float64_t)a6 reverseZ:(float64_t)a7 depthNearFar:
{
  *(float *)&double v7 = *(float *)&a3 + 0.5;
  float v8 = a5 - (float)(*((float *)&a3 + 1) + 0.5);
  *((float *)&v7 + 1) = v8;
  +[PTUtil adjustIntrinsics:a1 fromImageSize:a2 toViewPortSize:v7];
  _Q6.f64[0] = a6;
  _Q6.f64[1] = a7;
  float v10 = vcvt_f32_f64(_Q6).f32[0];
  __asm { FMOV            V6.2S, #1.0 }
  return (float)(v15 + v15) / v10;
}

+ (float)perspectiveProjectionFieldOfView:(float)a1 aspectRatio:(float)a2 depthNearFar:reverseZ:
{
  return 1.0 / (float)(tanf(a1 * 0.5) * a2);
}

+ (float)perspectiveProjectionFromIntrinsics:(float)a1 colorSize:(uint64_t)a2 depthNearFar:(uint64_t)a3 reverseZ:(unint64_t *)a4
{
  return (float)(a1 + a1) / (float)*a4;
}

+ (double)transformFromRotation:(__n128)a3 translation:(__n128)a4
{
  v4.i64[0] = vzip1q_s32(a1, a2).u64[0];
  v4.i64[1] = __PAIR64__(a4.n128_u32[0], a3.n128_u32[0]);
  v5.i64[0] = vtrn2q_s32(a1, a2).u64[0];
  v5.i64[1] = __PAIR64__(a4.n128_u32[1], a3.n128_u32[1]);
  v6.i64[0] = vzip2q_s32(a1, a2).u64[0];
  v6.i64[1] = __PAIR64__(a4.n128_u32[2], a3.n128_u32[2]);
  *(void *)&double result = vzip1q_s32(vzip1q_s32(v4, v6), vzip1q_s32(v5, (int32x4_t)0)).u64[0];
  return result;
}

+ (double)mirrorMatrix4x4OverX:(__n128)a3
{
  uint64_t v4 = 0;
  float32x4_t v5 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 16);
  float32x4_t v6 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 32);
  float32x4_t v7 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 48);
  __n128 v15 = a2;
  __n128 v16 = a3;
  __n128 v17 = a4;
  float32x4_t v18 = 0u;
  float32x4_t v19 = 0u;
  float32x4_t v20 = 0u;
  float32x4_t v21 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v18 + v4) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1D081FA30, COERCE_FLOAT(*(long long *)((char *)&v14 + v4))), v5, *(float32x2_t *)((char *)&v14 + v4), 1), v6, *(float32x4_t *)((char *)&v14 + v4), 2), v7, *(float32x4_t *)((char *)&v14 + v4), 3);
    v4 += 16;
  }
  while (v4 != 64);
  uint64_t v8 = 0;
  float32x4_t v9 = v18;
  float32x4_t v10 = v19;
  float32x4_t v11 = v20;
  float32x4_t v12 = v21;
  long long v14 = xmmword_1D081FA30;
  __n128 v15 = (__n128)v5;
  __n128 v16 = (__n128)v6;
  __n128 v17 = (__n128)v7;
  float32x4_t v18 = 0u;
  float32x4_t v19 = 0u;
  float32x4_t v20 = 0u;
  float32x4_t v21 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v18 + v8) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v9, COERCE_FLOAT(*(long long *)((char *)&v14 + v8))), v10, *(float32x2_t *)((char *)&v14 + v8), 1), v11, *(float32x4_t *)((char *)&v14 + v8), 2), v12, *(float32x4_t *)((char *)&v14 + v8), 3);
    v8 += 16;
  }
  while (v8 != 64);
  return *(double *)v18.i64;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotateTexture, 0);
  objc_storeStrong((id *)&self->_gaussianFilter3x3, 0);
  objc_storeStrong((id *)&self->_visualizeCircleUsingRect, 0);
  objc_storeStrong((id *)&self->_renderLine, 0);
  objc_storeStrong((id *)&self->_renderRect, 0);
  objc_storeStrong((id *)&self->_sobelFilter, 0);
  objc_storeStrong((id *)&self->_gaussianNoise, 0);
  objc_storeStrong((id *)&self->_drawTurboLegendYUV, 0);
  objc_storeStrong((id *)&self->_drawTurboLegend, 0);
  objc_storeStrong((id *)&self->_reciprocal, 0);
  objc_storeStrong((id *)&self->_renderDisparity, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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

+ (void)orientationFromTransform:(os_log_t)log inverse:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Mirror Unsupported", v1, 2u);
}

+ (void)getRotationDegreesFromAffineTransform:(os_log_t)log .cold.1(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  v9[0] = 67110656;
  v9[1] = a2;
  __int16 v10 = 2048;
  uint64_t v11 = v3;
  __int16 v12 = 2048;
  uint64_t v13 = v4;
  __int16 v14 = 2048;
  uint64_t v15 = v5;
  __int16 v16 = 2048;
  uint64_t v17 = v6;
  __int16 v18 = 2048;
  uint64_t v19 = v7;
  __int16 v20 = 2048;
  uint64_t v21 = v8;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Unexpected rotation %i for transform (%f %f %f %f) (%f %f)", (uint8_t *)v9, 0x44u);
}

@end