@interface TSDMetalEdgeDistanceFieldTraceEffect
+ (void)didEndWithDevice:(id)a3;
+ (void)willBeginWithDevice:(id)a3;
- (BOOL)isValid;
- (BOOL)p_generateTraceTextureInfoWithStrokeWidth:(double)a3 clockwise:(BOOL)a4 context:(id)a5 randomGenerator:(id)a6;
- (CGPoint)p_normalizedPointInTexturedRectangleFrameFromPoint:(CGPoint)a3 inBufferSize:(CGSize)a4;
- (CGPoint)randomStrokePoint;
- (NSArray)strokeLineSegment;
- (TSDAnimationRandomGenerator)randomGenerator;
- (TSDMetalEdgeDistanceFieldTraceEffect)initWithTR:(id)a3 strokeWidth:(double)a4 downsampleScale:(double)a5 clockwise:(BOOL)a6 context:(id)a7 randomGenerator:(id)a8 capabilities:(id)a9;
- (TSDMetalShader)shader;
- (TSDMetalTextureInfo)edgeDistanceFieldTextureInfo;
- (TSDMetalTextureInfo)traceTextureInfo;
- (id)description;
- (id)p_houghTransformWithZeroes:(__CFArray *)a3 bufferSize:(CGSize)a4;
- (void)dealloc;
- (void)drawWithContext:(id)a3 andBuffer:(id)a4 atPercent:(double)a5 MVPMatrix:(CATransform3D *)a6 opacity:(double)a7 color:(id)a8 strokeFadeHardnessLeading:(double)a9 strokeFadeHardnessTrailing:(double)a10;
- (void)p_addNearbyPixelsToArray:(__CFArray *)a3 pixel:(CGPoint)a4 edgeDataBuffer:(float *)a5 dataBuffer:(char *)a6 tempDataBuffer:(char *)a7 localMaximumLookupBuffer:(BOOL *)a8 bufferSize:(CGSize)a9;
- (void)p_fillFloatBuffer:(float *)a3 withRGBAData:(char *)a4 bufferSize:(CGSize)a5;
- (void)teardown;
@end

@implementation TSDMetalEdgeDistanceFieldTraceEffect

+ (void)willBeginWithDevice:(id)a3
{
}

+ (void)didEndWithDevice:(id)a3
{
}

- (TSDMetalEdgeDistanceFieldTraceEffect)initWithTR:(id)a3 strokeWidth:(double)a4 downsampleScale:(double)a5 clockwise:(BOOL)a6 context:(id)a7 randomGenerator:(id)a8 capabilities:(id)a9
{
  BOOL v12 = a6;
  id v16 = a3;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v88.receiver = self;
  v88.super_class = (Class)TSDMetalEdgeDistanceFieldTraceEffect;
  v20 = [(TSDMetalEdgeDistanceFieldTraceEffect *)&v88 init];
  if (v20)
  {
    if (!v18)
    {
      v21 = [MEMORY[0x263F7C7F0] currentHandler];
      v22 = [NSString stringWithUTF8String:"-[TSDMetalEdgeDistanceFieldTraceEffect initWithTR:strokeWidth:downsampleScale:clockwise:context:randomGenerator:capabilities:]"];
      v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, v23, 1453, @"invalid nil value for '%s'", "randomGenerator");
    }
    [v16 frame];
    double v26 = v24;
    double v27 = v25;
    if (v24 > 65536.0 || v25 > 65536.0)
    {
      double v31 = TSDScaleSizeWithinSize(v24, v25, 65536.0, 65536.0);
      double v30 = TSDCeilSize(v31);
      double v28 = v30 / v26;
      if (v30 / v26 >= v29 / v27) {
        double v28 = v29 / v27;
      }
    }
    else
    {
      double v28 = 1.0;
      double v29 = v25;
      double v30 = v26;
    }
    if (v28 <= a5) {
      a5 = v28;
    }
    if (v30 <= v29) {
      double v30 = v29;
    }
    double v32 = round(v30 * -0.05);
    if (a4 >= 1.0) {
      double v33 = a4;
    }
    else {
      double v33 = 1.0;
    }
    unint64_t v34 = vcvtpd_s64_f64(v33);
    v35 = [v16 metalTexture];
    uint64_t v36 = +[TSDMetalEdgeDistanceField distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:](TSDMetalEdgeDistanceField, "distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:", v35, v34, 0, 1, v17, v19, v26, v27, v32, v32, v32, v32, a5);
    v37 = (void *)*((void *)v20 + 43);
    *((void *)v20 + 43) = v36;

    double v38 = TSDMultiplySizeScalar(v26, v27, a5);
    double v40 = v39;
    double v41 = -v32;
    CGFloat v42 = -v32 / (double)[*((id *)v20 + 43) width];
    CGFloat v43 = v41 / (double)[*((id *)v20 + 43) height];
    CGFloat v44 = v38 / (double)[*((id *)v20 + 43) width];
    CGFloat v45 = v40 / (double)[*((id *)v20 + 43) height];
    uint64_t v46 = MEMORY[0x263F000D0];
    long long v47 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)(v20 + 24) = *MEMORY[0x263F000D0];
    *(_OWORD *)(v20 + 40) = v47;
    *(_OWORD *)(v20 + 56) = *(_OWORD *)(v46 + 32);
    long long v48 = *(_OWORD *)(v20 + 40);
    *(_OWORD *)&v86.a = *(_OWORD *)(v20 + 24);
    *(_OWORD *)&v86.c = v48;
    *(_OWORD *)&v86.tx = *(_OWORD *)(v20 + 56);
    CGAffineTransformTranslate(&v87, &v86, v42, v43);
    long long v50 = *(_OWORD *)&v87.c;
    long long v49 = *(_OWORD *)&v87.tx;
    *(_OWORD *)(v20 + 24) = *(_OWORD *)&v87.a;
    *(_OWORD *)(v20 + 40) = v50;
    *(_OWORD *)(v20 + 56) = v49;
    long long v51 = *(_OWORD *)(v20 + 40);
    *(_OWORD *)&v86.a = *(_OWORD *)(v20 + 24);
    *(_OWORD *)&v86.c = v51;
    *(_OWORD *)&v86.tx = *(_OWORD *)(v20 + 56);
    CGAffineTransformScale(&v87, &v86, v44, v45);
    long long v53 = *(_OWORD *)&v87.c;
    long long v52 = *(_OWORD *)&v87.tx;
    *(_OWORD *)(v20 + 24) = *(_OWORD *)&v87.a;
    *(_OWORD *)(v20 + 40) = v53;
    *(_OWORD *)(v20 + 56) = v52;
    int v54 = objc_msgSend(v20, "p_generateTraceTextureInfoWithStrokeWidth:clockwise:context:randomGenerator:", v12, v17, v18, a4);
    v20[336] = v54;
    if (v54)
    {
      id v55 = objc_alloc_init(MEMORY[0x263F129B0]);
      objc_msgSend(v55, "setPixelFormat:", objc_msgSend(v17, "pixelFormat"));
      [v55 setBlendingEnabled:1];
      [v55 setSourceRGBBlendFactor:1];
      [v55 setSourceAlphaBlendFactor:1];
      [v55 setDestinationRGBBlendFactor:5];
      [v55 setDestinationAlphaBlendFactor:5];
      v56 = [TSDMetalShader alloc];
      v57 = [v17 device];
      uint64_t v58 = [(TSDMetalShader *)v56 initCustomShaderWithVertexShader:@"TSDMetalEdgeDistanceField_Trace_VertexShader" fragmentShader:@"TSDMetalEdgeDistanceField_Trace_FragmentShader" device:v57 library:@"KeynoteMetalLibrary" colorAttachment:v55];
      v59 = (void *)*((void *)v20 + 45);
      *((void *)v20 + 45) = v58;

      float32x2_t v60 = vcvt_f32_f64(*(float64x2_t *)(v20 + 24));
      float32x2_t v61 = vcvt_f32_f64(*(float64x2_t *)(v20 + 40));
      float32x2_t v62 = vcvt_f32_f64(*(float64x2_t *)(v20 + 56));
      *((_DWORD *)v20 + 54) = 0;
      *((float32x2_t *)v20 + 26) = v60;
      *((_DWORD *)v20 + 58) = 0;
      *((float32x2_t *)v20 + 28) = v61;
      *((_DWORD *)v20 + 62) = 1065353216;
      *((float32x2_t *)v20 + 30) = v62;
      v60.f32[0] = a4;
      *((_DWORD *)v20 + 79) = v60.i32[0];
      [*((id *)v20 + 43) size];
      float64_t v84 = v63;
      [*((id *)v20 + 43) size];
      float64_t v82 = v64;
      [*((id *)v20 + 43) size];
      double v80 = 1.0 / v65;
      [*((id *)v20 + 43) size];
      v66.f64[0] = v80;
      v66.f64[1] = 1.0 / v67;
      v68.f64[0] = v84;
      v68.f64[1] = v82;
      *((float32x4_t *)v20 + 17) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v68), v66);
      [v17 layerSize];
      float64_t v85 = v69;
      [v17 layerSize];
      float64_t v83 = v70;
      [v17 layerSize];
      double v81 = 1.0 / v71;
      [v17 layerSize];
      v72.f64[0] = v81;
      v72.f64[1] = 1.0 / v73;
      v74.f64[0] = v85;
      v74.f64[1] = v83;
      *((float32x4_t *)v20 + 18) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v74), v72);
      *((_DWORD *)v20 + 82) = *((void *)v20 + 2);
      *(float *)v74.f64 = 1.0 / a5;
      *((_DWORD *)v20 + 78) = LODWORD(v74.f64[0]);
      [v16 frameOnCanvas];
      *((void *)v20 + 13) = v75;
      *((void *)v20 + 14) = v76;
      *((void *)v20 + 15) = v77;
      *((void *)v20 + 16) = v78;
    }
    else
    {
      [v20 teardown];
    }
  }

  return (TSDMetalEdgeDistanceFieldTraceEffect *)v20;
}

- (void)dealloc
{
  if (!self->_didTeardown)
  {
    v3 = [MEMORY[0x263F7C7F0] currentHandler];
    v4 = [NSString stringWithUTF8String:"-[TSDMetalEdgeDistanceFieldTraceEffect dealloc]"];
    v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:1525 description:@"Didn't teardown!"];
  }
  zeroesArray = self->_zeroesArray;
  if (zeroesArray)
  {
    CFRelease(zeroesArray);
    self->_zeroesArray = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)TSDMetalEdgeDistanceFieldTraceEffect;
  [(TSDMetalEdgeDistanceFieldTraceEffect *)&v7 dealloc];
}

- (id)description
{
  return &stru_26D688A48;
}

- (void)teardown
{
  if (!self->_didTeardown)
  {
    v3 = [(TSDMetalEdgeDistanceFieldTraceEffect *)self edgeDistanceFieldTextureInfo];
    [v3 teardown];

    v4 = [(TSDMetalEdgeDistanceFieldTraceEffect *)self traceTextureInfo];
    [v4 teardown];

    edgeDistanceFieldTextureInfo = self->_edgeDistanceFieldTextureInfo;
    self->_edgeDistanceFieldTextureInfo = 0;

    traceTextureInfo = self->_traceTextureInfo;
    self->_traceTextureInfo = 0;

    shader = self->_shader;
    self->_shader = 0;

    self->_didTeardown = 1;
  }
}

- (void)drawWithContext:(id)a3 andBuffer:(id)a4 atPercent:(double)a5 MVPMatrix:(CATransform3D *)a6 opacity:(double)a7 color:(id)a8 strokeFadeHardnessLeading:(double)a9 strokeFadeHardnessTrailing:(double)a10
{
  float32x4_t v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a6->m21), *(float64x2_t *)&a6->m23);
  float32x4_t v12 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a6->m31), *(float64x2_t *)&a6->m33);
  float32x4_t v13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a6->m41), *(float64x2_t *)&a6->m43);
  *(float32x4_t *)self->_anon_90 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a6->m11), *(float64x2_t *)&a6->m13);
  *(float32x4_t *)&self->_anon_90[16] = v11;
  anon_90 = (id *)self->_anon_90;
  *(float32x4_t *)&self->_anon_90[32] = v12;
  *(float32x4_t *)&self->_anon_90[48] = v13;
  float v15 = a7;
  anon_100 = self->_anon_100;
  float var1 = a8.var1;
  float v18 = a5;
  uint64_t v19 = *(void *)&a8.var2;
  *(float *)&self->_anon_100[48] = v15;
  *(float *)&self->_anon_100[52] = v18;
  *($C28CD4A45FD07A4F97CC9D5F91F25271 *)self->_anon_100 = a8;
  float v20 = a9;
  float v21 = a10;
  *(float *)&self->_anon_100[64] = v20;
  *(float *)&self->_anon_100[68] = v21;
  id v22 = a4;
  id v23 = a3;
  double v24 = [v23 renderEncoder];
  double v25 = [anon_90[25] name];
  [v24 setFragmentTexture:v25 atIndex:0];

  double v26 = [v23 renderEncoder];
  double v27 = [anon_90[26] name];
  [v26 setFragmentTexture:v27 atIndex:1];

  id v28 = anon_90[27];
  double v29 = [v23 renderEncoder];
  [v28 setPipelineStateWithEncoder:v29 vertexBytes:anon_90 fragmentBytes:anon_100];

  id v30 = [v23 renderEncoder];

  objc_msgSend(v22, "drawWithEncoder:atIndex:", v30, objc_msgSend(anon_90[27], "bufferIndex"));
}

- (NSArray)strokeLineSegment
{
  if (self->_zeroesArray)
  {
    v3 = [(TSDMetalEdgeDistanceFieldTraceEffect *)self p_houghTransformWithZeroes:self->_bufferSize.width bufferSize:self->_bufferSize.height];
    strokeLineSegment = self->_strokeLineSegment;
    self->_strokeLineSegment = v3;
    v5 = v3;

    CFRelease(self->_zeroesArray);
    self->_zeroesArray = 0;
  }
  v6 = self->_strokeLineSegment;
  return v6;
}

- (CGPoint)p_normalizedPointInTexturedRectangleFrameFromPoint:(CGPoint)a3 inBufferSize:(CGSize)a4
{
  double v8 = a3.x / a4.width;
  long long v4 = *(_OWORD *)&self->_textureEdgeInsetsAdjustmentMatrix.c;
  *(_OWORD *)&v9.a = *(_OWORD *)&self->_textureEdgeInsetsAdjustmentMatrix.a;
  *(_OWORD *)&v9.c = v4;
  *(_OWORD *)&v9.tx = *(_OWORD *)&self->_textureEdgeInsetsAdjustmentMatrix.tx;
  double v7 = a3.y / a4.height;
  CGAffineTransformInvert(&v10, &v9);
  float64x2_t v5 = vaddq_f64(*(float64x2_t *)&v10.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v10.c, v7), *(float64x2_t *)&v10.a, v8));
  double v6 = v5.f64[1];
  result.x = v5.f64[0];
  result.y = v6;
  return result;
}

- (id)p_houghTransformWithZeroes:(__CFArray *)a3 bufferSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v78[2] = *MEMORY[0x263EF8340];
  if (p_houghTransformWithZeroes_bufferSize__onceToken != -1) {
    dispatch_once(&p_houghTransformWithZeroes_bufferSize__onceToken, &__block_literal_global_243);
  }
  uint64_t v7 = (uint64_t)width;
  uint64_t v8 = (uint64_t)height;
  uint64_t v9 = (uint64_t)sqrt((double)(v8 * v8 + v7 * v7));
  CGAffineTransform v10 = (char *)malloc_type_calloc(2 * v9, 0x168uLL, 0x2EDACB6CuLL);
  CFIndex Count = CFArrayGetCount(a3);
  if (Count <= 0)
  {
    free(v10);
    goto LABEL_32;
  }
  uint64_t v11 = 0;
  CFIndex v12 = 0;
  if (v7 >= 0) {
    uint64_t v13 = (uint64_t)width;
  }
  else {
    uint64_t v13 = v7 + 1;
  }
  float64x2_t v72 = self;
  uint64_t v73 = -(v13 >> 1);
  if (v8 >= 0) {
    uint64_t v14 = (uint64_t)height;
  }
  else {
    uint64_t v14 = v8 + 1;
  }
  uint64_t v15 = -(v14 >> 1);
  if (v9 >= 0) {
    uint64_t v16 = v9;
  }
  else {
    uint64_t v16 = v9 + 1;
  }
  uint64_t v17 = -(v16 >> 1);
  uint64_t v18 = v16 >> 1;
  uint64_t v19 = -1;
  uint64_t v20 = -1;
  do
  {
    uint64_t ValueAtIndex = (uint64_t)CFArrayGetValueAtIndex(a3, v12);
    uint64_t v22 = 0;
    id v23 = (double *)&unk_267FB97B0;
    do
    {
      double v24 = *v23 * (double)(v15 + (unint64_t)(double)(ValueAtIndex / v7))
          + (double)(v73 + (unint64_t)(double)(ValueAtIndex % v7)) * *(v23 - 1);
      uint64_t v25 = (uint64_t)v24;
      if (v17 < (uint64_t)v24 && v18 > v25 && v25 != 0)
      {
        id v28 = &v10[720 * v18 + 720 * v25];
        unsigned __int16 v29 = *(_WORD *)&v28[2 * v22] + 1;
        *(_WORD *)&v28[2 * v22] = v29;
        if (v11 < v29)
        {
          uint64_t v20 = v22;
          uint64_t v19 = (uint64_t)v24;
        }
        if (v11 <= v29) {
          uint64_t v11 = v29;
        }
      }
      ++v22;
      v23 += 2;
    }
    while (v22 != 360);
    ++v12;
  }
  while (v12 != Count);
  if (v11 >= 0xFFFF)
  {
    double v31 = [MEMORY[0x263F7C7F0] currentHandler];
    double v32 = [NSString stringWithUTF8String:"-[TSDMetalEdgeDistanceFieldTraceEffect p_houghTransformWithZeroes:bufferSize:]"];
    double v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
    [v31 handleFailureInFunction:v32 file:v33 lineNumber:1657 description:@"max_value > 2^16!"];

    free(v10);
    goto LABEL_34;
  }
  free(v10);
  if (v11 < 11)
  {
LABEL_32:
    id v30 = 0;
    goto LABEL_60;
  }
LABEL_34:
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0);
  for (CFIndex i = 0; i != Count; ++i)
  {
    uint64_t v36 = (uint64_t)CFArrayGetValueAtIndex(a3, i);
    uint64_t v37 = 0;
    double v38 = (double *)&unk_267FB97B0;
    while (v19 != (uint64_t)(*v38 * (double)(v15 + (unint64_t)(double)(v36 / v7))
                           + (double)(v73 + (unint64_t)(double)(v36 % v7)) * *(v38 - 1))
         || v20 != v37)
    {
      ++v37;
      v38 += 2;
      if (v37 == 360) {
        goto LABEL_43;
      }
    }
    CFArrayAppendValue(Mutable, (const void *)v36);
LABEL_43:
    ;
  }
  uint64_t v40 = (uint64_t)CFArrayGetValueAtIndex(Mutable, 0);
  double v41 = (double)(v40 % v7);
  double v42 = (double)(v40 / v7);
  double v43 = cos((double)v20 * 3.14159265 / 180.0);
  CFIndex v44 = CFArrayGetCount(Mutable);
  if (v44 < 2)
  {
    double v60 = (double)(v40 / v7);
    double v59 = (double)(v40 % v7);
  }
  else
  {
    CFIndex v45 = v44;
    double v75 = width;
    *(double *)&CFArrayRef theArraya = height;
    double v46 = sin((double)v20 * 3.14159265 / 180.0);
    double v47 = fabs(v46);
    double v48 = fabs(v43);
    double v49 = -v46;
    double v50 = 0.0;
    CFIndex v51 = 1;
    uint64_t v52 = v40;
    double v53 = 0.0;
    do
    {
      uint64_t v54 = (uint64_t)CFArrayGetValueAtIndex(Mutable, v51);
      uint64_t v55 = v54 / v7;
      if (v47 <= v48)
      {
        double v56 = v42;
      }
      else
      {
        uint64_t v55 = v54 % v7;
        double v56 = v41;
      }
      if (v47 > v48) {
        double v57 = v49;
      }
      else {
        double v57 = v43;
      }
      double v58 = ((double)v55 - v56) / v57;
      if (v58 < v53)
      {
        double v53 = v58;
        uint64_t v52 = v54;
      }
      if (v58 > v50)
      {
        double v50 = v58;
        uint64_t v40 = v54;
      }
      ++v51;
    }
    while (v45 != v51);
    double v59 = (double)(v52 % v7);
    double v60 = (double)(v52 / v7);
    double v41 = (double)(v40 % v7);
    double v42 = (double)(v40 / v7);
    double width = v75;
    double height = *(double *)&theArraya;
  }
  -[TSDMetalEdgeDistanceFieldTraceEffect p_normalizedPointInTexturedRectangleFrameFromPoint:inBufferSize:](v72, "p_normalizedPointInTexturedRectangleFrameFromPoint:inBufferSize:", v59, v60, width, height);
  double v62 = v61;
  double v64 = v63;
  -[TSDMetalEdgeDistanceFieldTraceEffect p_normalizedPointInTexturedRectangleFrameFromPoint:inBufferSize:](v72, "p_normalizedPointInTexturedRectangleFrameFromPoint:inBufferSize:", v41, v42, width, height);
  double v66 = v65;
  double v68 = v67;
  double v69 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v62, v64);
  v78[0] = v69;
  double v70 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v66, v68);
  v78[1] = v70;
  id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:2];

  CFRelease(Mutable);
LABEL_60:
  return v30;
}

int64x2_t __78__TSDMetalEdgeDistanceFieldTraceEffect_p_houghTransformWithZeroes_bufferSize___block_invoke()
{
  int64x2_t result = (int64x2_t)xmmword_223838000;
  uint64_t v1 = 0x1FFFFFFFFFFFFD30;
  float64x2_t v6 = (float64x2_t)vdupq_n_s64(0x4066800000000000uLL);
  float64x2_t v7 = (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL);
  int64x2_t v5 = vdupq_n_s64(2uLL);
  do
  {
    int64x2_t v9 = result;
    float64x2_t v8 = vdivq_f64(vmulq_f64(vcvtq_f64_s64(result), v7), v6);
    __double2 v2 = __sincos_stret(v8.f64[1]);
    __double2 v3 = __sincos_stret(v8.f64[0]);
    v10.val[1].f64[0] = v3.__sinval;
    v10.val[0].f64[0] = v3.__cosval;
    v10.val[0].f64[1] = v2.__cosval;
    v10.val[1].f64[1] = v2.__sinval;
    long long v4 = (double *)&p_houghTransformWithZeroes_bufferSize__s_CosSinArray[v1 + 720];
    vst2q_f64(v4, v10);
    int64x2_t result = vaddq_s64(v9, v5);
    v1 += 4;
  }
  while (v1 * 8);
  return result;
}

- (void)p_fillFloatBuffer:(float *)a3 withRGBAData:(char *)a4 bufferSize:(CGSize)a5
{
  uint64_t v5 = (uint64_t)(a5.width * a5.height);
  if (v5 >= 1)
  {
    float64x2_t v6 = a4 + 3;
    do
    {
      unsigned int v7 = *(v6 - 2);
      unsigned int v8 = *(v6 - 1);
      unsigned int v9 = *v6;
      if (*(v6 - 3)) {
        BOOL v10 = 0;
      }
      else {
        BOOL v10 = v7 == 0;
      }
      if (v10 && v8 == 0 && v9 == 0)
      {
        double v14 = 1.79769313e308;
      }
      else
      {
        double v13 = ((double)v7 / 255.0 + (double)*(v6 - 3) + (double)v8 / 65025.0 + (double)v9 / 16581375.0)
            / 255.0
            + -0.5;
        double v14 = v13 + v13;
      }
      v6 += 4;
      float v15 = v14;
      *a3++ = v15;
      --v5;
    }
    while (v5);
  }
}

- (BOOL)p_generateTraceTextureInfoWithStrokeWidth:(double)a3 clockwise:(BOOL)a4 context:(id)a5 randomGenerator:(id)a6
{
  BOOL v156 = a4;
  uint64_t v163 = *MEMORY[0x263EF8340];
  id v140 = a5;
  id v143 = a6;
  if (!v143)
  {
    unsigned int v9 = [MEMORY[0x263F7C7F0] currentHandler];
    BOOL v10 = [NSString stringWithUTF8String:"-[TSDMetalEdgeDistanceFieldTraceEffect p_generateTraceTextureInfoWithStrokeWidth:clockwise:context:randomGenerator:]"];
    uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 1781, @"invalid nil value for '%s'", "randGen");
  }
  CFIndex v12 = [(TSDMetalEdgeDistanceFieldTraceEffect *)self edgeDistanceFieldTextureInfo];
  double v13 = [v12 name];

  double v14 = [(TSDMetalEdgeDistanceFieldTraceEffect *)self edgeDistanceFieldTextureInfo];
  unsigned int v15 = [v14 width];

  uint64_t v16 = [(TSDMetalEdgeDistanceFieldTraceEffect *)self edgeDistanceFieldTextureInfo];
  CFAllocatorRef v17 = (const __CFAllocator *)[v16 height];

  uint64_t v18 = [(TSDMetalEdgeDistanceFieldTraceEffect *)self edgeDistanceFieldTextureInfo];
  [v18 size];
  double v20 = v19;
  double v22 = v21;

  size_t v23 = (void)v17 * v15;
  long long v158 = 0uLL;
  double v159 = 0.0;
  double v24 = malloc_type_malloc(4 * v23, 0xD778D90DuLL);
  *(void *)&double v160 = v15;
  CFAllocatorRef v161 = v17;
  uint64_t v162 = 1;
  size_t v138 = 4 * v15;
  v139 = v13;
  [v13 getBytes:v24 bytesPerRow:v138 fromRegion:&v158 mipmapLevel:0];
  v146 = self;
  v155 = (float *)malloc_type_calloc(4uLL, v23, 0xC1271245uLL);
  -[TSDMetalEdgeDistanceFieldTraceEffect p_fillFloatBuffer:withRGBAData:bufferSize:](self, "p_fillFloatBuffer:withRGBAData:bufferSize:", v20, v22);
  free(v24);
  uint64_t v25 = (char *)malloc_type_calloc(4uLL, v23, 0xCDEA002BuLL);
  data = (char *)malloc_type_calloc(4uLL, v23, 0x62567561uLL);
  CFAllocatorRef v26 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef cf = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0);
  CFArrayRef Mutable = CFArrayCreateMutable(v26, 0, 0);
  double v27 = malloc_type_calloc(1uLL, v23, 0x6321D04EuLL);
  size_t width = v15;
  CFAllocatorRef allocator = v26;
  theArray = CFArrayCreateMutable(v26, v15, 0);
  unsigned int v149 = v15;
  if (v15)
  {
    unint64_t v28 = 0;
    if (v20 <= v22) {
      double v29 = v22;
    }
    else {
      double v29 = v20;
    }
    id v30 = v27;
    double v31 = a3 / v29;
    do
    {
      if (v17)
      {
        unint64_t v32 = 0;
        double v33 = (double)v28;
        unint64_t v34 = v30;
        do
        {
          if (v31 < fabsf(v155[(uint64_t)(v33 + v20 * (double)v32)])
            || TSDMetalEdgeDistanceFieldBufferPixelIsLocalMaximum((uint64_t)v155, (double)v28, (double)v32, v20, v22))
          {
            *unint64_t v34 = 1;
          }
          else if (TSDMetalEdgeDistanceFieldBufferNeighborPixelIsZero((uint64_t)v155, (double)v28, (double)v32, v20, v22))
          {
            CFArrayAppendValue(theArray, (const void *)(uint64_t)(v33 + v20 * (double)v32));
          }
          ++v32;
          v34 += width;
        }
        while (v17 != (const __CFAllocator *)v32);
      }
      ++v28;
      ++v30;
    }
    while (v28 != width);
  }
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count <= 0)
  {
    v96 = v140;
    v97 = v155;
    v98 = data;
    goto LABEL_124;
  }
  v146->_zeroesArray = CFArrayCreateCopy(allocator, theArray);
  v146->_bufferSize.size_t width = v20;
  v146->_bufferSize.double height = v22;
  double v36 = (double)(Count - 1);
  CFIndex v137 = Count;
  [v143 doubleBetween:0.0 :(double)Count];
  uint64_t v37 = v155;
  if (v38 <= v36)
  {
    [v143 doubleBetween:0.0 :(double)Count];
    double v36 = v39;
  }
  CFAllocatorRef allocatora = v17;
  double v40 = (double)v149;
  uint64_t ValueAtIndex = (uint64_t)CFArrayGetValueAtIndex(theArray, (uint64_t)v36);
  uint64_t v42 = (uint64_t)v20;
  -[TSDMetalEdgeDistanceFieldTraceEffect p_normalizedPointInTexturedRectangleFrameFromPoint:inBufferSize:](v146, "p_normalizedPointInTexturedRectangleFrameFromPoint:inBufferSize:", (double)(ValueAtIndex % (uint64_t)v20), (double)(ValueAtIndex / (uint64_t)v20), v20, v22);
  v146->_randomStrokePoint.x = v43;
  v146->_randomStrokePoint.y = v44;
  if (CFArrayGetCount(theArray) < 1)
  {
    uint64_t v144 = 0;
    uint64_t v145 = 0;
    CFArrayRef v77 = cf;
    goto LABEL_71;
  }
  uint64_t v144 = 0;
  uint64_t v145 = 0;
  double v150 = v40 * 0.5;
  CFIndex v45 = v25 + 3;
  double v46 = INFINITY;
  CFArrayRef v47 = cf;
  double v136 = a3;
  do
  {
    double v48 = INFINITY;
    do
    {
      if (!CFArrayGetCount(theArray))
      {
        CFArrayRef v77 = v47;
        a3 = v136;
        goto LABEL_71;
      }
      CFIndex v49 = CFArrayGetCount(theArray);
      double v50 = (double)(unint64_t)(v49 - 1);
      double v51 = (double)(unint64_t)v49;
      [v143 doubleBetween:0.0 :(double)(unint64_t)v49];
      if (v52 <= v50)
      {
        [v143 doubleBetween:0.0 :v51];
        double v50 = v53;
      }
      uint64_t v54 = (uint64_t)CFArrayGetValueAtIndex(theArray, (uint64_t)v50);
      CFArrayRemoveValueAtIndex(theArray, (uint64_t)v50);
      double v55 = (double)(v54 % v42);
      double v56 = (double)(v54 / v42);
      uint64_t v57 = 4 * (uint64_t)(v55 + v20 * v56);
      if (v45[v57]
        || (double v59 = (double *)&v158,
            (uint64_t v60 = TSDMetalEdgeDistanceFieldBufferNeighborPixelsClosestToZero((uint64_t)v155, 2, &v158, v55, v56, v20, v22)) == 0))
      {
        int v58 = 13;
        continue;
      }
      if (v60 == 1) {
        goto LABEL_33;
      }
      if (v60 == 2)
      {
        double v61 = TSDSubtractPoints(*(double *)&v158, *((double *)&v158 + 1), v150);
        double v63 = TSDAngleFromDelta(v61, v62);
        double v64 = TSDSubtractPoints(v159, v160, v150);
        double v59 = (double *)(&v158 + ((TSDAngleFromDelta(v64, v65) > v63) ^ v156));
LABEL_33:
        double v46 = *v59;
        double v48 = v59[1];
      }
      int v58 = 12;
    }
    while (v58 == 13);
    double v66 = &v25[v57];
    *(_WORD *)double v66 = 0x8000;
    v66[3] = -1;
    -[TSDMetalEdgeDistanceFieldTraceEffect p_addNearbyPixelsToArray:pixel:edgeDataBuffer:dataBuffer:tempDataBuffer:localMaximumLookupBuffer:bufferSize:](v146, "p_addNearbyPixelsToArray:pixel:edgeDataBuffer:dataBuffer:tempDataBuffer:localMaximumLookupBuffer:bufferSize:", Mutable, v155, v25, data, v27, v55, v56, v20, v22);
    double v67 = &v25[4 * (uint64_t)(v46 + v20 * v48)];
    *(_WORD *)double v67 = 0x7FFF;
    v67[3] = -1;
    -[TSDMetalEdgeDistanceFieldTraceEffect p_addNearbyPixelsToArray:pixel:edgeDataBuffer:dataBuffer:tempDataBuffer:localMaximumLookupBuffer:bufferSize:](v146, "p_addNearbyPixelsToArray:pixel:edgeDataBuffer:dataBuffer:tempDataBuffer:localMaximumLookupBuffer:bufferSize:", Mutable, v155, v25, data, v27, v46, v48, v20, v22);
    if (v46 != v55 && v48 != v56)
    {
      uint64_t v69 = 0;
      *(double *)&long long v158 = v55;
      *((double *)&v158 + 1) = v48;
      char v70 = 1;
      double v159 = v46;
      double v160 = v56;
      do
      {
        char v71 = v70;
        float64x2_t v72 = (double *)(&v158 + v69);
        double v73 = *v72;
        double v74 = v72[1];
        double v75 = &v25[4 * (uint64_t)(*v72 + v20 * v74)];
        *(_WORD *)double v75 = v69 + 0x7FFF;
        v75[3] = -1;
        -[TSDMetalEdgeDistanceFieldTraceEffect p_addNearbyPixelsToArray:pixel:edgeDataBuffer:dataBuffer:tempDataBuffer:localMaximumLookupBuffer:bufferSize:](v146, "p_addNearbyPixelsToArray:pixel:edgeDataBuffer:dataBuffer:tempDataBuffer:localMaximumLookupBuffer:bufferSize:", Mutable, v155, v25, data, v27, v73, v74, v20, v22);
        char v70 = 0;
        uint64_t v69 = 1;
      }
      while ((v71 & 1) != 0);
    }
    if (CFArrayGetCount(Mutable) < 1)
    {
      CFArrayRef v77 = v47;
      CFArrayRef v76 = Mutable;
      a3 = v136;
    }
    else
    {
      CFArrayRef v76 = Mutable;
      a3 = v136;
      do
      {
        CFArrayRef v77 = v76;
        CFArrayRef v78 = v47;
        CFIndex v79 = CFArrayGetCount(v76);
        if (v79 >= 1)
        {
          CFIndex v80 = v79;
          for (CFIndex i = 0; i != v80; ++i)
          {
            uint64_t v82 = (uint64_t)CFArrayGetValueAtIndex(v77, i);
            double v83 = (double)(v82 % v42);
            double v84 = (double)(v82 / v42);
            uint64_t v85 = 4 * (uint64_t)(v83 + v20 * v84);
            if (!v45[v85])
            {
              CGAffineTransform v86 = &data[v85];
              if (!data[v85 + 3])
              {
                uint64_t v87 = TSDMetalEdgeDistanceFieldBufferSurroundingTracePixelValueClosestToZero((uint64_t)v25, 0, (double)(v82 % v42), (double)(v82 / v42), v20, v22);
                if (v87 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  uint64_t v88 = ((v87 >> 63) | 1) + v87;
                  if (v145 >= v88) {
                    uint64_t v89 = ((v87 >> 63) | 1) + v87;
                  }
                  else {
                    uint64_t v89 = v145;
                  }
                  uint64_t v90 = v144;
                  if (v144 <= v88) {
                    uint64_t v90 = ((v87 >> 63) | 1) + v87;
                  }
                  uint64_t v144 = v90;
                  uint64_t v145 = v89;
                  __int16 v91 = v88 + 0x8000;
                  if (v88 < -32768) {
                    __int16 v91 = v88 - 32513;
                  }
                  *CGAffineTransform v86 = v88;
                  v86[1] = HIBYTE(v91);
                  v86[3] = -1;
                }
                -[TSDMetalEdgeDistanceFieldTraceEffect p_addNearbyPixelsToArray:pixel:edgeDataBuffer:dataBuffer:tempDataBuffer:localMaximumLookupBuffer:bufferSize:](v146, "p_addNearbyPixelsToArray:pixel:edgeDataBuffer:dataBuffer:tempDataBuffer:localMaximumLookupBuffer:bufferSize:", v78, v155, v25, data, v27, v83, v84, v20, v22);
              }
            }
          }
          for (CFIndex j = 0; j != v80; ++j)
          {
            uint64_t v93 = (uint64_t)CFArrayGetValueAtIndex(v77, j);
            double v94 = (double)(v93 % v42) + v20 * (double)(v93 / v42);
            v95 = &v25[4 * (uint64_t)v94];
            if (!v95[3])
            {
              *(_WORD *)v95 = *(_WORD *)&data[4 * (uint64_t)v94];
              v95[3] = -1;
            }
          }
        }
        CFArrayRemoveAllValues(v77);
        CFArrayRef v76 = v78;
        CFArrayRef v47 = v77;
      }
      while (CFArrayGetCount(v78) > 0);
    }
    CFArrayRef Mutable = v76;
    CFArrayRef v47 = v77;
    double v46 = INFINITY;
  }
  while (CFArrayGetCount(theArray) >= 1);
LABEL_71:
  CFMutableArrayRef cf = v77;
  if (v20 <= v22) {
    double v99 = v22;
  }
  else {
    double v99 = v20;
  }
  double v100 = a3 / v99;
  size_t v101 = (size_t)allocatora;
  v102 = v146;
  while (2)
  {
    if (!width) {
      goto LABEL_123;
    }
    unint64_t v103 = 0;
    char v157 = 1;
    while (2)
    {
      unint64_t v151 = v103;
      if (!v101) {
        goto LABEL_114;
      }
      unint64_t v104 = 0;
      double v105 = (double)v103;
      while (2)
      {
        double v106 = v105 + v20 * (double)v104;
        v107 = &v25[4 * (uint64_t)v106];
        if (v107[3]) {
          goto LABEL_113;
        }
        if (v100 < fabsf(v37[(uint64_t)v106]))
        {
          *(_WORD *)v107 = -1;
          v107[3] = -1;
          goto LABEL_113;
        }
        uint64_t v108 = 0;
        uint64_t v109 = 0;
        uint64_t v110 = 0;
        uint64_t v111 = 0x7FFFFFFFFFFFFFFFLL;
        char v112 = 1;
        while (2)
        {
          double v113 = TSDAddPoints(v105, (double)v104, *(double *)&kNeighboring8Points[v108]);
          if (v113 < 0.0) {
            goto LABEL_93;
          }
          BOOL v115 = v114 >= 0.0 && v113 < v20;
          if (!v115 || v114 >= v22) {
            goto LABEL_93;
          }
          if (v27[(int)(v113 + v114 * v40)]) {
            goto LABEL_93;
          }
          v118 = &v25[4 * (uint64_t)(v113 + v20 * v114)];
          if (!v118[3]) {
            goto LABEL_93;
          }
          uint64_t v119 = *(unsigned __int16 *)v118;
          if (v119 == 0xFFFF) {
            goto LABEL_93;
          }
          uint64_t v117 = v119 - 0x8000;
          if (v111 == 0x7FFFFFFFFFFFFFFFLL)
          {
            char v157 = 0;
            char v112 = 0;
            uint64_t v110 = v117;
            uint64_t v109 = v117;
            goto LABEL_94;
          }
          if (v117 >= v111)
          {
            char v157 = 0;
            char v112 = 0;
            if (v117 >= v109) {
              uint64_t v110 = v109;
            }
            else {
              uint64_t v110 = v117;
            }
            if (v117 > v109) {
              uint64_t v109 = v117;
            }
LABEL_93:
            uint64_t v117 = v111;
            goto LABEL_94;
          }
          char v157 = 0;
          char v112 = 0;
          uint64_t v110 = v111;
LABEL_94:
          v108 += 2;
          uint64_t v111 = v117;
          if (v108 != 8) {
            continue;
          }
          break;
        }
        size_t v101 = (size_t)allocatora;
        if ((v112 & 1) == 0)
        {
          uint64_t v120 = ((v110 >> 63) | 1) + v110;
          __int16 v121 = v120 + 0x8000;
          if (v120 < -32768) {
            __int16 v121 = v120 - 32513;
          }
          char *v107 = v120;
          v107[1] = HIBYTE(v121);
          v107[3] = -1;
          v27[(int)(v105 + (double)v104 * v40)] = 0;
        }
        uint64_t v37 = v155;
LABEL_113:
        if (++v104 != v101) {
          continue;
        }
        break;
      }
LABEL_114:
      unint64_t v103 = v151 + 1;
      if (v151 + 1 != width) {
        continue;
      }
      break;
    }
    v102 = v146;
    if ((v157 & 1) == 0) {
      continue;
    }
    break;
  }
  for (unint64_t k = 0; k != width; ++k)
  {
    if (v101)
    {
      for (unint64_t m = 0; m != v101; ++m)
      {
        double v124 = (double)k + v20 * (double)m;
        uint64_t v125 = *(unsigned __int16 *)&v25[4 * (uint64_t)v124] - v145;
        __int16 v126 = v125 + 0x8000;
        if (v125 - 0x8000 < 0) {
          __int16 v126 = v125 - 32513;
        }
        v127 = &data[4 * (uint64_t)v124];
        char *v127 = v125;
        v127[1] = HIBYTE(v126);
        v127[3] = -1;
      }
    }
  }
LABEL_123:
  v102->_traceTextureMaxValue = v144 - v145;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v98 = data;
  v129 = v102;
  v130 = CGDataProviderCreateWithData(0, data, v138 * v101, 0);
  v131 = CGImageCreate(width, v101, 8uLL, 0x20uLL, v138, DeviceRGB, 3u, v130, 0, 0, kCGRenderingIntentDefault);
  v96 = v140;
  v132 = [v140 device];
  uint64_t v133 = +[TSDMetalTextureInfo textureInfoWithCGImage:v131 forDevice:v132];
  traceTextureInfo = v129->_traceTextureInfo;
  v129->_traceTextureInfo = (TSDMetalTextureInfo *)v133;

  CGColorSpaceRelease(DeviceRGB);
  CGDataProviderRelease(v130);
  v97 = v155;
  CGImageRelease(v131);
  CFIndex Count = v137;
LABEL_124:
  free(v97);
  free(v25);
  free(v98);
  free(v27);
  CFRelease(theArray);
  CFRelease(cf);
  CFRelease(Mutable);

  return Count > 0;
}

- (void)p_addNearbyPixelsToArray:(__CFArray *)a3 pixel:(CGPoint)a4 edgeDataBuffer:(float *)a5 dataBuffer:(char *)a6 tempDataBuffer:(char *)a7 localMaximumLookupBuffer:(BOOL *)a8 bufferSize:(CGSize)a9
{
  double height = a9.height;
  double width = a9.width;
  double y = a4.y;
  double x = a4.x;
  uint64_t v15 = 0;
  uint64_t v16 = a6 + 3;
  CFAllocatorRef v17 = a7 + 3;
  do
  {
    double v18 = TSDAddPoints(x, y, *(double *)&kNeighboring8Points[v15]);
    if (v18 >= 0.0 && v19 >= 0.0 && v18 < width && v19 < height)
    {
      double v22 = v18 + width * v19;
      uint64_t v23 = 4 * (uint64_t)v22;
      if (!v16[v23] && !v17[v23] && !a8[(int)v22]) {
        CFArrayAppendValue(a3, (const void *)(uint64_t)v22);
      }
    }
    v15 += 2;
  }
  while (v15 != 8);
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (TSDMetalTextureInfo)edgeDistanceFieldTextureInfo
{
  return self->_edgeDistanceFieldTextureInfo;
}

- (TSDMetalTextureInfo)traceTextureInfo
{
  return self->_traceTextureInfo;
}

- (TSDMetalShader)shader
{
  return self->_shader;
}

- (CGPoint)randomStrokePoint
{
  double x = self->_randomStrokePoint.x;
  double y = self->_randomStrokePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (TSDAnimationRandomGenerator)randomGenerator
{
  return self->_randomGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomGenerator, 0);
  objc_storeStrong((id *)&self->_shader, 0);
  objc_storeStrong((id *)&self->_traceTextureInfo, 0);
  objc_storeStrong((id *)&self->_edgeDistanceFieldTextureInfo, 0);
  objc_storeStrong((id *)&self->_strokeLineSegment, 0);
}

@end