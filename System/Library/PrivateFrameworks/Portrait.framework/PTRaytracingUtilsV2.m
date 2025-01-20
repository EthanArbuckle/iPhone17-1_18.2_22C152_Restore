@interface PTRaytracingUtilsV2
+ (PTFocus)createFocusObject:(SEL)a3 pyramidSamplingFraction:(id)a4 anamorphicFactor:(float)a5 rayCount:(float)a6 colorSize:(int)a7 doMacroApertureLimit:(BOOL)a8;
+ (PTFocusEdge)createFocusEdge;
+ (float)focalLength;
+ (float)frameWidth;
- (PTRaytracingUtilsV2)initWithMetalContext:(id)a3;
- (int)detectDilatedEdges:(id)a3 inDisparity:(id)a4 tempEdges:(id)a5 outEdges:(id)a6 focusObject:(PTFocus *)a7 disparityDiffMinMax:(id)a8 edgeTolerance:(float)a9;
- (int)sobelEdgeDetection:(id)a3 inImage:(id)a4 outEdges:(id)a5 edgeTolerance:(float)a6;
- (void)centerDisparityOnFocus:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 focusObject:(PTFocus *)a6 foregroundBlurLimitingFactor:(float)a7;
- (void)focusEdgeMask:(id)a3 inDisparityDiff:(id)a4 focusObject:(PTFocus *)a5 focusEdge:(PTFocusEdge)a6 outFocusEdgeMask:(id)a7;
@end

@implementation PTRaytracingUtilsV2

- (PTRaytracingUtilsV2)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PTRaytracingUtilsV2;
  v6 = [(PTRaytracingUtilsV2 *)&v47 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_16;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  uint64_t v8 = [v5 computePipelineStateFor:@"centerDisparityOnFocusV2" withConstants:0];
  centerDisparityOnFocus = v7->_centerDisparityOnFocus;
  v7->_centerDisparityOnFocus = (MTLComputePipelineState *)v8;

  if (!v7->_centerDisparityOnFocus)
  {
    v17 = _PTLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtilsV2 initWithMetalContext:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_15;
  }
  uint64_t v10 = [v5 computePipelineStateFor:@"sobelEdgeDetectorV2" withConstants:0];
  sobelEdgeDetector = v7->_sobelEdgeDetector;
  v7->_sobelEdgeDetector = (MTLComputePipelineState *)v10;

  if (!v7->_sobelEdgeDetector)
  {
    v17 = _PTLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils initWithMetalContext:].cold.4(v17, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_15;
  }
  uint64_t v12 = [v5 computePipelineStateFor:@"edgeDilationV2" withConstants:0];
  edgeDilation = v7->_edgeDilation;
  v7->_edgeDilation = (MTLComputePipelineState *)v12;

  if (!v7->_edgeDilation)
  {
    v17 = _PTLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils initWithMetalContext:].cold.5(v17, v32, v33, v34, v35, v36, v37, v38);
    }
    goto LABEL_15;
  }
  uint64_t v14 = [v5 computePipelineStateFor:@"focusEdgeMaskV2" withConstants:0];
  focusEdgeMask = v7->_focusEdgeMask;
  v7->_focusEdgeMask = (MTLComputePipelineState *)v14;

  if (!v7->_focusEdgeMask)
  {
    v17 = _PTLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils initWithMetalContext:].cold.6(v17, v39, v40, v41, v42, v43, v44, v45);
    }
LABEL_15:

LABEL_16:
    v16 = 0;
    goto LABEL_17;
  }
  v16 = v7;
LABEL_17:

  return v16;
}

- (void)focusEdgeMask:(id)a3 inDisparityDiff:(id)a4 focusObject:(PTFocus *)a5 focusEdge:(PTFocusEdge)a6 outFocusEdgeMask:(id)a7
{
  PTFocusEdge v19 = a6;
  id v11 = a7;
  id v12 = a4;
  v13 = [a3 computeCommandEncoder];
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

- (void)centerDisparityOnFocus:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 focusObject:(PTFocus *)a6 foregroundBlurLimitingFactor:(float)a7
{
  float v28 = a7;
  float v27 = flt_1D081FA50[(float)(a6->var2 * 1000.0) > 70.0] / a6->var0;
  id v11 = a5;
  id v12 = a4;
  v13 = [a3 computeCommandEncoder];
  if (!v13)
  {
    uint64_t v14 = _PTLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  [v13 setComputePipelineState:self->_centerDisparityOnFocus];
  [v13 setTexture:v12 atIndex:0];

  [v13 setTexture:v11 atIndex:1];
  [v13 setBytes:&a6->var1 length:4 atIndex:0];
  [v13 setBytes:&v27 length:4 atIndex:1];
  [v13 setBytes:&v28 length:4 atIndex:2];
  uint64_t v22 = [v11 width];
  uint64_t v23 = [v11 height];

  v26[0] = v22;
  v26[1] = v23;
  v26[2] = 1;
  long long v24 = xmmword_1D081F8F0;
  uint64_t v25 = 1;
  [v13 dispatchThreads:v26 threadsPerThreadgroup:&v24];
  [v13 endEncoding];
}

- (int)sobelEdgeDetection:(id)a3 inImage:(id)a4 outEdges:(id)a5 edgeTolerance:(float)a6
{
  float v26 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = [a3 computeCommandEncoder];
  if (!v11)
  {
    id v12 = _PTLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  [v11 setComputePipelineState:self->_sobelEdgeDetector];
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

- (int)detectDilatedEdges:(id)a3 inDisparity:(id)a4 tempEdges:(id)a5 outEdges:(id)a6 focusObject:(PTFocus *)a7 disparityDiffMinMax:(id)a8 edgeTolerance:(float)a9
{
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  *(float *)&double v21 = a9;
  [(PTRaytracingUtilsV2 *)self sobelEdgeDetection:v20 inImage:v19 outEdges:v17 edgeTolerance:v21];
  uint64_t v22 = [v20 computeCommandEncoder];

  if (!v22)
  {
    long long v23 = _PTLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v23, v24, v25, v26, v27, v28, v29, v30);
    }
  }
  float var2 = a7->var2;
  +[PTRaytracingUtilsV2 frameWidth];
  float v33 = (float)(var2 / v32) * a7->var0;
  unint64_t v34 = [v19 width];

  float v43 = v33 * (float)v34;
  char v42 = 1;
  [v22 setComputePipelineState:self->_edgeDilation];
  [v22 setTexture:v17 atIndex:0];
  [v22 setTexture:v18 atIndex:1];
  [v22 setBytes:&v42 length:1 atIndex:0];
  [v22 setBytes:&v43 length:4 atIndex:1];
  [v22 setBuffer:v16 offset:0 atIndex:2];

  v41[0] = [v17 width];
  v41[1] = [v17 height];
  v41[2] = 1;
  long long v39 = xmmword_1D081F8F0;
  uint64_t v40 = 1;
  [v22 dispatchThreads:v41 threadsPerThreadgroup:&v39];
  char v42 = 0;
  [v22 setTexture:v18 atIndex:0];

  [v22 setTexture:v17 atIndex:1];
  [v22 setBytes:&v42 length:1 atIndex:0];
  uint64_t v35 = [v17 width];
  uint64_t v36 = [v17 height];

  v38[0] = v35;
  v38[1] = v36;
  v38[2] = 1;
  long long v39 = xmmword_1D081F8F0;
  uint64_t v40 = 1;
  [v22 dispatchThreads:v38 threadsPerThreadgroup:&v39];
  [v22 endEncoding];

  return 0;
}

+ (PTFocus)createFocusObject:(SEL)a3 pyramidSamplingFraction:(id)a4 anamorphicFactor:(float)a5 rayCount:(float)a6 colorSize:(int)a7 doMacroApertureLimit:(BOOL)a8
{
  BOOL v9 = a8;
  float32x2_t v49 = v8;
  id v50 = a4;
  [v50 focusDisparity];
  float v14 = v13;
  [v50 fNumber];
  float v16 = v15;
  [v50 alphaLowLight];
  float v18 = v17;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(void *)&retstr[1].float var2 = 0;
  double v19 = v14;
  if (v14 < 0.025) {
    double v19 = 0.025;
  }
  float v20 = fmin(v19, 10.0);
  retstr->var1 = v20;
  if (v9)
  {
    if ([v50 sensorID] == 19)
    {
      float v21 = 6.6;
      float v22 = 0.4;
    }
    else
    {
      float v21 = 2.8;
      float v22 = 1.3333;
    }
    [v50 focusDisparity];
    float v24 = v23;
    [v50 networkBias];
    double v26 = (float)((float)((float)(v21 * (float)(v24 - v25)) / v22) * 0.33333) + v16 * 0.666666657;
    if (v26 >= v16)
    {
      float v27 = v26;
      float v16 = v27;
    }
  }
  double v28 = v16;
  if (v16 < 0.1) {
    double v28 = 0.1;
  }
  float v29 = (float)(1.0 - v18) * 22.0 + v28 * v18;
  [v50 visCropFactor];
  float v46 = v30;
  [v50 visCropFactor];
  if (v46 >= v31) {
    float v32 = v31;
  }
  else {
    float v32 = v46;
  }
  [v50 visCropFactorPreview];
  float v47 = v33;
  [v50 visCropFactorPreview];
  if (v47 >= v34) {
    float v35 = v34;
  }
  else {
    float v35 = v47;
  }
  [v50 focalLenIn35mmFilm];
  double v37 = v32;
  *(float *)&double v37 = v36 / 1000.0 * v32;
  retstr->float var2 = *(float *)&v37;
  double v39 = v35;
  float v38 = *(float *)&v37 / (v29 + v29) * v35;
  retstr->var0 = v38;
  LODWORD(v39) = v49.i32[1];
  v40.i32[0] = 1024685244;
  if (v49.f32[1] <= v49.f32[0])
  {
    v41.i32[0] = vdup_lane_s32(v40, 0).u32[0];
    v41.f32[1] = vmuls_lane_f32(0.036, v49, 1) / v49.f32[0];
  }
  else
  {
    float32x2_t v41 = (float32x2_t)vdup_lane_s32(v40, 0);
    v41.f32[0] = (float)(v49.f32[0] * 0.036) / v49.f32[1];
  }
  *(float *)v42.i32 = 1.0 / a6;
  *(float *)&v42.i32[1] = a6;
  float32x2_t v43 = vdiv_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v37, 0), v41);
  *(float32x2_t *)&retstr[1].var0 = vmul_n_f32(vmul_f32((float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(*(float32x2_t *)&v39, v49), 0), (int8x8_t)vrev64_s32(v42), (int8x8_t)v42), v43), v38);
  float v44 = 1.0 / sqrt((double)a7 / 3.14159265) * a5;
  retstr->var3 = (float)(v49.f32[0] * (float)(v38 * v43.f32[0])) * v44;
  retstr->var4 = v44;
  retstr[1].float var2 = 0.02 / v44;

  return result;
}

+ (PTFocusEdge)createFocusEdge
{
  float v2 = 0.1;
  float v3 = 4.0;
  float v4 = 0.125;
  float v5 = 6.0;
  result.minMaxThreshold = v2;
  result.gradientWeight = v5;
  result.gradientThreshold = v4;
  result.width = v3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_edgeDilation, 0);
  objc_storeStrong((id *)&self->_sobelEdgeDetector, 0);
  objc_storeStrong((id *)&self->_centerDisparityOnFocus, 0);

  objc_storeStrong((id *)&self->_focusEdgeMask, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end