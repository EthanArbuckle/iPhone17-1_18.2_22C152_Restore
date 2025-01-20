@interface PTRaytracingUtils
+ (PTFocus)createFocusObject:(SEL)a3 anamorphicFactor:(id)a4 colorSize:(float)a5 circleOfConfusionReference:(float)a6 fNumberLimitWeight:(float)a7;
+ (PTFocusEdge)createFocusEdge;
+ (float)focalLength;
+ (float)frameWidth;
- (PTRaytracingUtils)initWithMetalContext:(id)a3;
- (int)detectDilatedEdges:(id)a3 inDisparity:(id)a4 tempEdges:(id)a5 outEdges:(id)a6 focusObject:(PTFocus *)a7 disparityDiffMinMax:(id)a8 edgeTolerance:(float)a9;
- (int)sobelEdgeDetection:(id)a3 inImage:(id)a4 outEdges:(id)a5 edgeTolerance:(float)a6;
- (void)disparityApplyPostModifier:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 postModfier:(PTPostModifier)a6;
- (void)disparityMinMaxApplyPostModifier:(id)a3 disparityMinMaxBuffer:(id)a4 postModfier:(PTPostModifier)a5;
- (void)disparityPortraitPreviewDeadzone:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 postModfier:(PTPostModifier)a6;
- (void)focusEdgeMask:(id)a3 inDisparityDiff:(id)a4 focusEdge:(PTFocusEdge)a5 outFocusEdgeMask:(id)a6;
@end

@implementation PTRaytracingUtils

- (PTRaytracingUtils)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v65.receiver = self;
  v65.super_class = (Class)PTRaytracingUtils;
  v6 = [(PTRaytracingUtils *)&v65 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_22;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  uint64_t v8 = [v5 computePipelineStateFor:@"disparityApplyPostModifier" withConstants:0];
  disparityApplyPostModifier = v7->_disparityApplyPostModifier;
  v7->_disparityApplyPostModifier = (MTLComputePipelineState *)v8;

  if (!v7->_disparityApplyPostModifier)
  {
    v21 = _PTLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils initWithMetalContext:](v21, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_21;
  }
  uint64_t v10 = [v5 computePipelineStateFor:@"disparityPortraitPreviewDeadzone" withConstants:0];
  disparityPortraitPreviewDeadzone = v7->_disparityPortraitPreviewDeadzone;
  v7->_disparityPortraitPreviewDeadzone = (MTLComputePipelineState *)v10;

  if (!v7->_disparityPortraitPreviewDeadzone)
  {
    v21 = _PTLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils initWithMetalContext:](v21, v29, v30, v31, v32, v33, v34, v35);
    }
    goto LABEL_21;
  }
  uint64_t v12 = [v5 computePipelineStateFor:@"disparityMinMaxApplyPostModifier" withConstants:0];
  disparityMinMaxApplyPostModifier = v7->_disparityMinMaxApplyPostModifier;
  v7->_disparityMinMaxApplyPostModifier = (MTLComputePipelineState *)v12;

  if (!v7->_disparityMinMaxApplyPostModifier)
  {
    v21 = _PTLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils initWithMetalContext:](v21, v36, v37, v38, v39, v40, v41, v42);
    }
    goto LABEL_21;
  }
  uint64_t v14 = [v5 computePipelineStateFor:@"sobelEdgeDetector" withConstants:0];
  sobelEdgeDetector = v7->_sobelEdgeDetector;
  v7->_sobelEdgeDetector = (MTLComputePipelineState *)v14;

  if (!v7->_sobelEdgeDetector)
  {
    v21 = _PTLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils initWithMetalContext:].cold.4(v21, v43, v44, v45, v46, v47, v48, v49);
    }
    goto LABEL_21;
  }
  uint64_t v16 = [v5 computePipelineStateFor:@"edgeDilation" withConstants:0];
  edgeDilation = v7->_edgeDilation;
  v7->_edgeDilation = (MTLComputePipelineState *)v16;

  if (!v7->_edgeDilation)
  {
    v21 = _PTLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils initWithMetalContext:].cold.5(v21, v50, v51, v52, v53, v54, v55, v56);
    }
    goto LABEL_21;
  }
  uint64_t v18 = [v5 computePipelineStateFor:@"focusEdgeMask" withConstants:0];
  focusEdgeMask = v7->_focusEdgeMask;
  v7->_focusEdgeMask = (MTLComputePipelineState *)v18;

  if (!v7->_focusEdgeMask)
  {
    v21 = _PTLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils initWithMetalContext:].cold.6(v21, v57, v58, v59, v60, v61, v62, v63);
    }
LABEL_21:

LABEL_22:
    v20 = 0;
    goto LABEL_23;
  }
  v20 = v7;
LABEL_23:

  return v20;
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

- (void)focusEdgeMask:(id)a3 inDisparityDiff:(id)a4 focusEdge:(PTFocusEdge)a5 outFocusEdgeMask:(id)a6
{
  PTFocusEdge v17 = a5;
  id v9 = a6;
  id v10 = a4;
  v11 = [a3 computeCommandEncoder];
  [v11 setComputePipelineState:self->_focusEdgeMask];
  [v11 setTexture:v10 atIndex:0];

  [v11 setTexture:v9 atIndex:1];
  [v11 setBytes:&v17 length:16 atIndex:0];
  uint64_t v12 = [v9 width];
  uint64_t v13 = [v9 height];

  v16[0] = v12;
  v16[1] = v13;
  v16[2] = 1;
  long long v14 = xmmword_1D081F8E0;
  uint64_t v15 = 1;
  [v11 dispatchThreads:v16 threadsPerThreadgroup:&v14];
  [v11 endEncoding];
}

- (void)disparityApplyPostModifier:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 postModfier:(PTPostModifier)a6
{
  PTPostModifier v25 = a6;
  id v9 = a5;
  id v10 = a4;
  v11 = [a3 computeCommandEncoder];
  if (!v11)
  {
    uint64_t v12 = _PTLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  [v11 setComputePipelineState:self->_disparityApplyPostModifier];
  [v11 setTexture:v10 atIndex:0];

  [v11 setTexture:v9 atIndex:1];
  [v11 setBytes:&v25 length:12 atIndex:0];
  uint64_t v20 = [v9 width];
  uint64_t v21 = [v9 height];

  v24[0] = v20;
  v24[1] = v21;
  v24[2] = 1;
  long long v22 = xmmword_1D081F8F0;
  uint64_t v23 = 1;
  [v11 dispatchThreads:v24 threadsPerThreadgroup:&v22];
  [v11 endEncoding];
}

- (void)disparityPortraitPreviewDeadzone:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 postModfier:(PTPostModifier)a6
{
  PTPostModifier v33 = a6;
  float v9 = 1.0 / (float)(0.1 - (float)(1.0 / a6.var0));
  double v10 = -0.100000001 - 1.0 / a6.var0;
  double v11 = 1.0 / v10;
  BOOL v12 = v10 <= 0.05;
  double v13 = 20.0;
  if (!v12) {
    double v13 = v11;
  }
  float v14 = v13;
  float v31 = v14;
  float v32 = v9;
  id v15 = a5;
  id v16 = a4;
  uint64_t v17 = [a3 computeCommandEncoder];
  if (!v17)
  {
    uint64_t v18 = _PTLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  [v17 setComputePipelineState:self->_disparityPortraitPreviewDeadzone];
  [v17 setTexture:v16 atIndex:0];

  [v17 setTexture:v15 atIndex:1];
  [v17 setBytes:&v33 length:12 atIndex:0];
  [v17 setBytes:&v32 length:4 atIndex:1];
  [v17 setBytes:&v31 length:4 atIndex:2];
  uint64_t v26 = [v15 width];
  uint64_t v27 = [v15 height];

  v30[0] = v26;
  v30[1] = v27;
  v30[2] = 1;
  long long v28 = xmmword_1D081F8F0;
  uint64_t v29 = 1;
  [v17 dispatchThreads:v30 threadsPerThreadgroup:&v28];
  [v17 endEncoding];
}

- (void)disparityMinMaxApplyPostModifier:(id)a3 disparityMinMaxBuffer:(id)a4 postModfier:(PTPostModifier)a5
{
  PTPostModifier v21 = a5;
  id v7 = a4;
  uint64_t v8 = [a3 computeCommandEncoder];
  if (!v8)
  {
    float v9 = _PTLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  [v8 setComputePipelineState:self->_disparityMinMaxApplyPostModifier];
  [v8 setBuffer:v7 offset:0 atIndex:0];

  [v8 setBytes:&v21 length:12 atIndex:1];
  int64x2_t v19 = vdupq_n_s64(1uLL);
  uint64_t v20 = 1;
  long long v17 = xmmword_1D081F8F0;
  uint64_t v18 = 1;
  [v8 dispatchThreads:&v19 threadsPerThreadgroup:&v17];
  [v8 endEncoding];
}

- (int)sobelEdgeDetection:(id)a3 inImage:(id)a4 outEdges:(id)a5 edgeTolerance:(float)a6
{
  float v26 = a6;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [a3 computeCommandEncoder];
  if (!v11)
  {
    uint64_t v12 = _PTLogSystem();
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
  id v16 = a4;
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  *(float *)&double v21 = a9;
  [(PTRaytracingUtils *)self sobelEdgeDetection:v20 inImage:v16 outEdges:v18 edgeTolerance:v21];
  uint64_t v22 = [v20 computeCommandEncoder];

  if (!v22)
  {
    long long v23 = _PTLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v23, v24, v25, v26, v27, v28, v29, v30);
    }
  }
  float var3 = a7->var3;
  float v40 = var3 * (float)(unint64_t)[v16 width];
  char v39 = 1;
  [v22 setComputePipelineState:self->_edgeDilation];
  [v22 setTexture:v18 atIndex:0];
  [v22 setTexture:v19 atIndex:1];
  [v22 setBytes:&v39 length:1 atIndex:0];
  [v22 setBytes:&v40 length:4 atIndex:1];
  [v22 setBuffer:v17 offset:0 atIndex:2];

  v38[0] = [v18 width];
  v38[1] = [v18 height];
  v38[2] = 1;
  long long v36 = xmmword_1D081F8F0;
  uint64_t v37 = 1;
  [v22 dispatchThreads:v38 threadsPerThreadgroup:&v36];
  char v39 = 0;
  [v22 setTexture:v19 atIndex:0];

  [v22 setTexture:v18 atIndex:1];
  [v22 setBytes:&v39 length:1 atIndex:0];
  uint64_t v32 = [v18 width];
  uint64_t v33 = [v18 height];

  v35[0] = v32;
  v35[1] = v33;
  v35[2] = 1;
  long long v36 = xmmword_1D081F8F0;
  uint64_t v37 = 1;
  [v22 dispatchThreads:v35 threadsPerThreadgroup:&v36];
  [v22 endEncoding];

  return 0;
}

+ (PTFocus)createFocusObject:(SEL)a3 anamorphicFactor:(id)a4 colorSize:(float)a5 circleOfConfusionReference:(float)a6 fNumberLimitWeight:(float)a7
{
  float v8 = v7;
  long long v39 = *(_OWORD *)&a6;
  id v11 = a4;
  [v11 visCropFactor];
  float v42 = v12;
  [v11 visCropFactor];
  if (v42 >= v13) {
    float v14 = v13;
  }
  else {
    float v14 = v42;
  }
  objc_msgSend(v11, "visCropFactorPreview", v39);
  float v43 = v15;
  [v11 visCropFactorPreview];
  if (v43 >= v16) {
    float v17 = v16;
  }
  else {
    float v17 = v43;
  }
  [v11 focalLenIn35mmFilm];
  *(double *)&int32x2_t v19 = v18 / 1000.0 * v14;
  *(float *)v19.i32 = *(double *)v19.i32;
  int32x2_t v44 = v19;
  [v11 fNumber];
  float v21 = v20 / v17;
  [v11 focusDisparity];
  float v23 = v22;
  [v11 networkBias];
  double v25 = (float)((float)((float)((float)(v23 - v24) * (float)(*(float *)v44.i32 * *(float *)v44.i32)) / a7) * v8)
      + v21 * (1.0 - v8);
  if (v25 >= v21) {
    float v26 = v25;
  }
  else {
    float v26 = v21;
  }
  [v11 alphaLowLight];
  double v28 = v26;
  if (v26 < 0.1) {
    double v28 = 0.1;
  }
  float v29 = (float)(1.0 - v27) * 22.0 + v28 * v27;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(void *)&retstr[1].var2 = 0;
  [v11 focusDisparity];
  float v31 = v30;

  retstr->var1 = v31;
  LODWORD(retstr->var2) = v44.i32[0];
  double v34 = v29 + v29;
  float v33 = *(float *)v44.i32 / v34;
  retstr->var0 = v33;
  LODWORD(v34) = v40.i32[1];
  v35.i32[0] = 1024685244;
  if (v40.f32[1] <= v40.f32[0])
  {
    v36.i32[0] = vdup_lane_s32(v35, 0).u32[0];
    v36.f32[1] = vmuls_lane_f32(0.036, v40, 1) / v40.f32[0];
  }
  else
  {
    float32x2_t v36 = (float32x2_t)vdup_lane_s32(v35, 0);
    v36.f32[0] = (float)(v40.f32[0] * 0.036) / v40.f32[1];
  }
  *(float *)v37.i32 = 1.0 / a5;
  *(float *)&v37.i32[1] = a5;
  float32x2_t v38 = vmul_n_f32(vdiv_f32((float32x2_t)vdup_lane_s32(v44, 0), v36), v33);
  *(float32x2_t *)&retstr[1].var0 = vmul_f32((float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(*(float32x2_t *)&v34, v40), 0), (int8x8_t)vrev64_s32(v37), (int8x8_t)v37), v38);
  LODWORD(retstr->var3) = v38.i32[0];
  return result;
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
  objc_storeStrong((id *)&self->_disparityMinMaxApplyPostModifier, 0);
  objc_storeStrong((id *)&self->_disparityPortraitPreviewDeadzone, 0);
  objc_storeStrong((id *)&self->_disparityApplyPostModifier, 0);

  objc_storeStrong((id *)&self->_focusEdgeMask, 0);
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

- (void)disparityApplyPostModifier:(uint64_t)a3 inDisparity:(uint64_t)a4 outDisparity:(uint64_t)a5 postModfier:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end