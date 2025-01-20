@interface PTEffectUtil
+ (BOOL)currentProcessIsCameracaptured;
+ (CGRect)rotateNormalizedRect:(CGRect)a3 transform:(CGAffineTransform *)a4 inverse:(BOOL)a5;
+ (double)inverseRectTransform:(float32x4_t)a1;
+ (double)screenSpaceToCameraSpace:(float32x4_t)a3 zValue:(float32x4_t)a4 inverseProjection:(float32x4_t)a5;
+ (double)transformRect:(float32x4_t)a1 intoCropCoordinates:(float32x4_t)a2;
+ (float32x2_t)multiplyRectTransform:(float32x2_t)a1 withRectTransform:(int8x16_t)a2;
+ (id)faceRectsForVision:(id)a1 numberOfFaceRects:(SEL)a2 transform:;
+ (unint64_t)aspectRatio:(CGSize)a3;
+ (unint64_t)closestAspectRatio:(CGSize)a3;
- (PTEffectUtil)initWithMetalContext:(id)a3;
- (void)clearTexture:(id)a3 outTex:(id)a4;
- (void)copySingleChannelInTex:(id)a3 outTex:(id)a4;
- (void)sampleFaceRectsWithMaxFaceRects:(int)a3 faceRects:faceRectsState:focusDisparityMax:inDisparity:outFaceDistanceArray:;
- (void)updateDisparityWithScreenCaptureRect:(CGRect)a3 inDisparity:(id)a4 outDisparity:(id)a5 focalLenIn35mmFilm:(float)a6 fNumber:(float)a7;
- (void)updateFocusObjectWithFaceRectCount:(int)a3 disparityFocusOffsetSDOF:(PTDisparityFocusOffset)a4 disparityFocusOffsetReactions:(PTDisparityFocusOffset)a5 disparityFocusOffsetStudioLight:(PTDisparityFocusOffset)a6 exponentialMovingAverageSDOF:(float)a7 exponentialMovingAverageStudioLight:(float)a8 faceRectsState:(int *)a9 isFirstFrame:(BOOL)a10 emitNewReaction:(BOOL)a11 focusOnAll:(BOOL)a12 lastFocus:(id)a13 inFaceDisparityArray:(id)a14 outDisparityModifiers:(id)a15 outDisparityFocus:(id)a16 outStudioLightEffectModifier:(id)a17 outUseDisparityBufferForReactions:(id)a18;
@end

@implementation PTEffectUtil

- (void)clearTexture:(id)a3 outTex:(id)a4
{
  id v6 = a4;
  v7 = [a3 computeCommandEncoder];
  [v7 setComputePipelineState:self->_clear];
  [v7 setTexture:v6 atIndex:0];
  uint64_t v8 = [v6 width];
  uint64_t v9 = [v6 height];

  v12[0] = v8;
  v12[1] = v9;
  v12[2] = 1;
  long long v10 = xmmword_1D081F8F0;
  uint64_t v11 = 1;
  [v7 dispatchThreads:v12 threadsPerThreadgroup:&v10];
  [v7 endEncoding];
}

+ (unint64_t)aspectRatio:(CGSize)a3
{
  if (a3.width >= a3.height) {
    double width = a3.width;
  }
  else {
    double width = a3.height;
  }
  if (a3.width >= a3.height) {
    a3.double width = a3.height;
  }
  float v4 = a3.width;
  float v5 = width / v4;
  unint64_t v6 = 2 * (fabsf(v5 + -1.3333) < 0.05);
  if (fabsf(v5 + -1.7778) < 0.05) {
    return 1;
  }
  else {
    return v6;
  }
}

- (PTEffectUtil)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v56.receiver = self;
  v56.super_class = (Class)PTEffectUtil;
  unint64_t v6 = [(PTEffectUtil *)&v56 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_19;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  uint64_t v8 = [v5 computePipelineStateFor:@"updateFocusObject" withConstants:0];
  updateFocusObject = v7->_updateFocusObject;
  v7->_updateFocusObject = (MTLComputePipelineState *)v8;

  if (!v7->_updateFocusObject)
  {
    v19 = _PTLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[PTEffectUtil initWithMetalContext:](v19, v20, v21, v22, v23, v24, v25, v26);
    }
    goto LABEL_18;
  }
  uint64_t v10 = [v5 computePipelineStateFor:@"effectSampleFaceRects" withConstants:0];
  effectSampleFaceRects = v7->_effectSampleFaceRects;
  v7->_effectSampleFaceRects = (MTLComputePipelineState *)v10;

  if (!v7->_effectSampleFaceRects)
  {
    v19 = _PTLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[PTEffectUtil initWithMetalContext:](v19, v27, v28, v29, v30, v31, v32, v33);
    }
    goto LABEL_18;
  }
  uint64_t v12 = [v5 computePipelineStateFor:@"copySingleChannel" withConstants:0];
  copySingleChannel = v7->_copySingleChannel;
  v7->_copySingleChannel = (MTLComputePipelineState *)v12;

  if (!v7->_copySingleChannel)
  {
    v19 = _PTLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[PTEffectUtil initWithMetalContext:](v19, v34, v35, v36, v37, v38, v39, v40);
    }
    goto LABEL_18;
  }
  uint64_t v14 = [v5 computePipelineStateFor:@"clear" withConstants:0];
  clear = v7->_clear;
  v7->_clear = (MTLComputePipelineState *)v14;

  if (!v7->_clear)
  {
    v19 = _PTLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[PTEffectUtil initWithMetalContext:].cold.4(v19, v41, v42, v43, v44, v45, v46, v47);
    }
    goto LABEL_18;
  }
  uint64_t v16 = [v5 computePipelineStateFor:@"updateDisparityWithScreenCaptureRect" withConstants:0];
  updateDisparityWithScreenCaptureRect = v7->_updateDisparityWithScreenCaptureRect;
  v7->_updateDisparityWithScreenCaptureRect = (MTLComputePipelineState *)v16;

  if (!v7->_updateDisparityWithScreenCaptureRect)
  {
    v19 = _PTLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[PTEffectUtil initWithMetalContext:].cold.5(v19, v48, v49, v50, v51, v52, v53, v54);
    }
LABEL_18:

LABEL_19:
    v18 = 0;
    goto LABEL_20;
  }
  v18 = v7;
LABEL_20:

  return v18;
}

+ (BOOL)currentProcessIsCameracaptured
{
  if (currentProcessIsCameracaptured_once != -1) {
    dispatch_once(&currentProcessIsCameracaptured_once, &__block_literal_global_5);
  }
  return currentProcessIsCameracaptured_answer != 0;
}

- (void)updateFocusObjectWithFaceRectCount:(int)a3 disparityFocusOffsetSDOF:(PTDisparityFocusOffset)a4 disparityFocusOffsetReactions:(PTDisparityFocusOffset)a5 disparityFocusOffsetStudioLight:(PTDisparityFocusOffset)a6 exponentialMovingAverageSDOF:(float)a7 exponentialMovingAverageStudioLight:(float)a8 faceRectsState:(int *)a9 isFirstFrame:(BOOL)a10 emitNewReaction:(BOOL)a11 focusOnAll:(BOOL)a12 lastFocus:(id)a13 inFaceDisparityArray:(id)a14 outDisparityModifiers:(id)a15 outDisparityFocus:(id)a16 outStudioLightEffectModifier:(id)a17 outUseDisparityBufferForReactions:(id)a18
{
  memset(v42, 0, sizeof(v42));
  uint64_t v43 = 0;
  v36[0] = a4;
  v36[1] = a5;
  v36[2] = a6;
  float v21 = 1.0;
  if (a10) {
    float v22 = 1.0;
  }
  else {
    float v22 = a7;
  }
  float v37 = v22;
  float v38 = v22;
  if (!a10) {
    float v21 = a8;
  }
  float v39 = v21;
  uint64_t v40 = 0x3F00000000000000;
  int v41 = 0;
  LOBYTE(v42[0]) = a12;
  DWORD1(v42[0]) = 1010174817;
  BYTE8(v42[0]) = a10;
  *(void *)((char *)v42 + 12) = 0x3F19999A3DCCCCCDLL;
  DWORD1(v42[1]) = 1053609165;
  *((void *)&v42[1] + 1) = 0x3F19999A3F000000;
  LODWORD(v43) = 1058642330;
  BYTE4(v43) = a11;
  metalContext = self->_metalContext;
  id v24 = a18;
  id v25 = a17;
  id v26 = a16;
  id v27 = a15;
  id v28 = a14;
  id v29 = a13;
  uint64_t v30 = [(PTMetalContext *)metalContext commandBuffer];
  uint64_t v31 = [v30 computeCommandEncoder];

  [v31 setComputePipelineState:self->_updateFocusObject];
  [v31 setBytes:v36 length:88 atIndex:0];
  [v31 setBuffer:v28 offset:0 atIndex:1];

  [v31 setBuffer:v29 offset:0 atIndex:2];
  [v31 setBuffer:v27 offset:0 atIndex:3];

  [v31 setBuffer:v26 offset:0 atIndex:4];
  [v31 setBytes:a9 length:16 atIndex:5];
  [v31 setBuffer:v25 offset:0 atIndex:6];

  [v31 setBuffer:v24 offset:0 atIndex:7];
  long long v34 = xmmword_1D08200D0;
  uint64_t v35 = 1;
  long long v32 = xmmword_1D081F8F0;
  uint64_t v33 = 1;
  [v31 dispatchThreads:&v34 threadsPerThreadgroup:&v32];
  [v31 endEncoding];
}

- (void)sampleFaceRectsWithMaxFaceRects:(int)a3 faceRects:faceRectsState:focusDisparityMax:inDisparity:outFaceDistanceArray:
{
  uint64_t v8 = v5;
  uint64_t v9 = v4;
  uint64_t v10 = v3;
  int v23 = v7;
  uint64_t v13 = a3;
  metalContext = self->_metalContext;
  id v15 = v6;
  id v16 = v8;
  v17 = [(PTMetalContext *)metalContext commandBuffer];
  v18 = [v17 computeCommandEncoder];

  [v18 setComputePipelineState:self->_effectSampleFaceRects];
  [v18 setTexture:v16 atIndex:0];

  [v18 setBytes:v10 length:16 * a3 atIndex:0];
  [v18 setBytes:v9 length:4 * a3 atIndex:1];
  [v18 setBuffer:v15 offset:0 atIndex:2];

  [v18 setBytes:&v23 length:4 atIndex:3];
  uint64_t v21 = v13;
  int64x2_t v22 = vdupq_n_s64(1uLL);
  long long v19 = xmmword_1D0820118;
  uint64_t v20 = 1;
  [v18 dispatchThreads:&v21 threadsPerThreadgroup:&v19];
  [v18 endEncoding];
}

- (void)copySingleChannelInTex:(id)a3 outTex:(id)a4
{
  metalContext = self->_metalContext;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(PTMetalContext *)metalContext commandBuffer];
  uint64_t v10 = [v9 computeCommandEncoder];

  [v10 setComputePipelineState:self->_copySingleChannel];
  [v10 setTexture:v8 atIndex:0];

  [v10 setTexture:v7 atIndex:1];
  uint64_t v11 = [v7 width];
  uint64_t v12 = [v7 height];

  v15[0] = v11;
  v15[1] = v12;
  v15[2] = 1;
  long long v13 = xmmword_1D081F8F0;
  uint64_t v14 = 1;
  [v10 dispatchThreads:v15 threadsPerThreadgroup:&v13];
  [v10 endEncoding];
}

- (void)updateDisparityWithScreenCaptureRect:(CGRect)a3 inDisparity:(id)a4 outDisparity:(id)a5 focalLenIn35mmFilm:(float)a6 fNumber:(float)a7
{
  CGFloat width = a3.size.width;
  CGFloat height = a3.size.height;
  double x = a3.origin.x;
  double y = a3.origin.y;
  float v9 = a6 / 1000.0;
  float v10 = (float)(a6 / 1000.0) / (a7 + a7);
  id v11 = a5;
  id v12 = a4;
  +[PTRaytracingUtils frameWidth];
  float v14 = v9 / v13;
  float v15 = (float)(unint64_t)[v11 height];
  unint64_t v16 = [v11 width];
  v17.f32[0] = v14 * v10;
  v18.f64[0] = x;
  *(float *)v19.i32 = x + (float)(v14 * v10);
  v18.f64[1] = y;
  v20.f64[0] = width;
  v20.f64[1] = height;
  *(float *)&__int32 v21 = y + (float)((float)((float)(v14 * v10) * v15) / (float)v16);
  v17.f32[1] = (float)((float)(v14 * v10) * v15) / (float)v16;
  v19.i32[1] = v21;
  float32x4_t v33 = vcvt_hight_f32_f64(v19, vsubq_f64(vaddq_f64(v18, v20), vcvtq_f64_f32(vadd_f32(v17, v17))));
  int64x2_t v22 = [(PTMetalContext *)self->_metalContext commandBuffer];
  int v23 = [v22 computeCommandEncoder];

  [v23 setComputePipelineState:self->_updateDisparityWithScreenCaptureRect];
  [v23 setTexture:v12 atIndex:0];

  [v23 setTexture:v11 atIndex:1];
  [v23 setBytes:&v33 length:16 atIndex:0];
  uint64_t v24 = [v11 width];
  uint64_t v25 = [v11 height];

  v32[0] = v24;
  v32[1] = v25;
  v32[2] = 1;
  long long v30 = xmmword_1D081F8F0;
  uint64_t v31 = 1;
  [v23 dispatchThreads:v32 threadsPerThreadgroup:&v30];
  [v23 endEncoding];
}

+ (CGRect)rotateNormalizedRect:(CGRect)a3 transform:(CGAffineTransform *)a4 inverse:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  long long v10 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v19.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v19.c = v10;
  *(_OWORD *)&v19.tCGFloat x = *(_OWORD *)&a4->tx;
  int v11 = +[PTUtil getRotationDegreesFromAffineTransform:&v19];
  if (v5)
  {
    if (v11 != 90)
    {
      if (v11 != 180)
      {
        if (v11 != 270) {
          goto LABEL_12;
        }
        goto LABEL_10;
      }
LABEL_9:
      long long v12 = xmmword_1D08200F0;
      __asm { FMOV            V0.2D, #1.0 }
LABEL_13:
      CGFloat v18 = 0.0;
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  if (v11 != 90)
  {
    if (v11 != 270)
    {
      if (v11 != 180)
      {
LABEL_12:
        long long v12 = xmmword_1D08200E0;
        _Q0 = 0uLL;
        goto LABEL_13;
      }
      goto LABEL_9;
    }
LABEL_11:
    _Q0 = xmmword_1D081FAC0;
    long long v12 = xmmword_1D0820100;
    CGFloat v18 = 1.0;
    goto LABEL_14;
  }
LABEL_10:
  _Q0 = xmmword_1D08200E0;
  long long v12 = xmmword_1D081FAC0;
  CGFloat v18 = -1.0;
LABEL_14:
  *(_OWORD *)&v19.a = v12;
  v19.c = v18;
  *(void *)&v19.d = v12;
  *(_OWORD *)&v19.tCGFloat x = _Q0;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v20, &v19);
}

+ (id)faceRectsForVision:(id)a1 numberOfFaceRects:(SEL)a2 transform:
{
  BOOL v5 = v4;
  LODWORD(v6) = v3;
  uint64_t v7 = v2;
  float v9 = objc_opt_new();
  if ((int)v6 >= 1)
  {
    uint64_t v6 = v6;
    long long v10 = (float *)(v7 + 8);
    do
    {
      double v11 = *(v10 - 2);
      double v12 = 1.0 - *(v10 - 1);
      float v14 = *v10;
      float v13 = v10[1];
      v10 += 4;
      long long v15 = v5[1];
      v18[0] = *v5;
      v18[1] = v15;
      v18[2] = v5[2];
      objc_msgSend(a1, "rotateNormalizedRect:transform:inverse:", v18, 0, v11, v12 - v13, v14);
      unint64_t v16 = objc_msgSend(MEMORY[0x1E4F457F8], "observationWithBoundingBox:");
      [v9 addObject:v16];

      --v6;
    }
    while (v6);
  }

  return v9;
}

+ (unint64_t)closestAspectRatio:(CGSize)a3
{
  if (a3.width >= a3.height) {
    double width = a3.width;
  }
  else {
    double width = a3.height;
  }
  if (a3.width >= a3.height) {
    a3.double width = a3.height;
  }
  float v4 = a3.width;
  float v5 = width / v4;
  if (fabsf(v5 + -1.7778) < fabsf(v5 + -1.3333)) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (double)screenSpaceToCameraSpace:(float32x4_t)a3 zValue:(float32x4_t)a4 inverseProjection:(float32x4_t)a5
{
  float v6 = *(float *)&a1 * 2.0 + -1.0;
  float v7 = *((float *)&a1 + 1) * 2.0 + -1.0;
  float32x4_t v8 = vaddq_f32(a6, vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(a3, v6), a4, v7), a5, a2));
  *(void *)&double result = vdivq_f32(v8, (float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 3)).u64[0];
  return result;
}

+ (double)inverseRectTransform:(float32x4_t)a1
{
  v1.i64[0] = vnegq_f32(a1).u64[0];
  __asm { FMOV            V2.4S, #1.0 }
  v1.i64[1] = *((void *)&_Q2 + 1);
  *(void *)&double result = vdivq_f32(v1, (float32x4_t)vdupq_laneq_s64((int64x2_t)a1, 1)).u64[0];
  return result;
}

+ (double)transformRect:(float32x4_t)a1 intoCropCoordinates:(float32x4_t)a2
{
  v2.i64[0] = vsubq_f32(a1, a2).u64[0];
  v2.i64[1] = a1.i64[1];
  *(void *)&double result = vdivq_f32(v2, (float32x4_t)vdupq_laneq_s64((int64x2_t)a2, 1)).u64[0];
  return result;
}

+ (float32x2_t)multiplyRectTransform:(float32x2_t)a1 withRectTransform:(int8x16_t)a2
{
  return vmla_f32(*(float32x2_t *)a2.i8, (float32x2_t)*(_OWORD *)&vextq_s8(a2, a2, 8uLL), a1);
}

void __46__PTEffectUtil_currentProcessIsCameracaptured__block_invoke()
{
  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v0)
  {
    float32x4_t v1 = v0;
    float32x4_t v2 = (__CFString *)SecTaskCopySigningIdentifier(v0, 0);
    currentProcessIsCameracaptured_answer = [(__CFString *)v2 isEqualToString:@"com.apple.cameracaptured"];
    CFRelease(v1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateDisparityWithScreenCaptureRect, 0);
  objc_storeStrong((id *)&self->_clear, 0);
  objc_storeStrong((id *)&self->_copySingleChannel, 0);
  objc_storeStrong((id *)&self->_effectSampleFaceRects, 0);
  objc_storeStrong((id *)&self->_updateFocusObject, 0);

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

@end