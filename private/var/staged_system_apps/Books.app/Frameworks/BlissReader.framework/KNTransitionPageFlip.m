@interface KNTransitionPageFlip
+ (id)animationFilter;
+ (id)animationName;
+ (id)supportedTypes;
+ (id)thumbnailImageNameForType:(int)a3;
+ (int)animationCategory;
+ (int)rendererTypeForAnimationContext:(id)a3;
+ (unint64_t)directionType;
+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8;
+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8;
- (KNTransitionPageFlip)initWithAnimationContext:(id)a3;
- (void)animationWillBeginWithContext:(id)a3;
- (void)createArrays:(id)a3 context:(id)a4 device:(id)a5;
- (void)p_drawFlipWithPercent:(double)a3 currentBuffer:(unint64_t)a4 texture:(id)a5 encoder:(id)a6 isMotionBlurred:(BOOL)a7 isUpdating:(BOOL)a8;
- (void)p_teardown;
- (void)renderFrameWithContext:(id)a3;
- (void)update:(id)a3 withContext:(id)a4 isUpdating:(BOOL)a5;
@end

@implementation KNTransitionPageFlip

- (KNTransitionPageFlip)initWithAnimationContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KNTransitionPageFlip;
  result = [(KNAnimationEffect *)&v4 initWithAnimationContext:a3];
  if (result) {
    result->_numPoints = 30;
  }
  return result;
}

- (void)p_teardown
{
  dataBufferAttributes = self->_dataBufferAttributes;
  self->_dataBufferAttributes = 0;

  motionBlurMetalEffect = self->_motionBlurMetalEffect;
  self->_motionBlurMetalEffect = 0;

  pageFlipMetalShader = self->_pageFlipMetalShader;
  self->_pageFlipMetalShader = 0;

  quadMetalShader = self->_quadMetalShader;
  self->_quadMetalShader = 0;

  pageFlipMetalDataBuffer = self->_pageFlipMetalDataBuffer;
  self->_pageFlipMetalDataBuffer = 0;

  quadMetalDatabuffer = self->_quadMetalDatabuffer;
  self->_quadMetalDatabuffer = 0;
}

+ (id)animationName
{
  return @"apple:pageflip";
}

+ (int)animationCategory
{
  return 202;
}

+ (id)animationFilter
{
  return kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return &off_499B18;
}

+ (unint64_t)directionType
{
  return 4;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"anim-icons-trans-pageFlip";
}

+ (int)rendererTypeForAnimationContext:(id)a3
{
  return 2;
}

- (void)createArrays:(id)a3 context:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (self->_pageFlipMetalDataBuffer) {
      goto LABEL_13;
    }
    uint64_t v11 = 35048;
  }
  else
  {
    uint64_t v11 = 35044;
  }
  v37 = v8;
  v12 = +[NSMutableArray array];
  uint64_t v13 = +[TSDGPUDataBufferAttribute attributeWithName:kTSDGPUShaderAttributePosition bufferUsage:35048 dataType:5 normalized:0 componentCount:3];
  [v12 addObject:v13];
  uint64_t v14 = +[TSDGPUDataBufferAttribute attributeWithName:kTSDGPUShaderAttributeTexCoord bufferUsage:v11 dataType:3 normalized:1 componentCount:2];
  [v12 addObject:v14];
  uint64_t v15 = +[TSDGPUDataBufferAttribute attributeWithName:kTSDGPUShaderAttributeNormal bufferUsage:35048 dataType:3 normalized:1 componentCount:3];
  [v12 addObject:v15];
  if ([v9 isMotionBlurred])
  {
    uint64_t v16 = +[TSDGPUDataBufferAttribute attributeWithName:kTSDGPUShaderAttributePreviousPosition bufferUsage:35048 dataType:5 normalized:0 componentCount:3];
    [v12 addObject:v16];
  }
  else
  {
    uint64_t v16 = 0;
  }
  v17 = (NSArray *)[v12 copy];
  dataBufferAttributes = self->_dataBufferAttributes;
  self->_dataBufferAttributes = v17;

  v41 = (void *)v13;
  self->_unint64_t positionAttributeIndex = [(NSArray *)self->_dataBufferAttributes indexOfObject:v13];
  v39 = (void *)v15;
  self->_unint64_t normalAttributeIndex = [(NSArray *)self->_dataBufferAttributes indexOfObject:v15];
  v40 = (void *)v14;
  self->_unint64_t texCoordAttributeIndex = [(NSArray *)self->_dataBufferAttributes indexOfObject:v14];
  v38 = (void *)v16;
  self->_unint64_t prevPositionAttributeIndex = [(NSArray *)self->_dataBufferAttributes indexOfObject:v16];
  v19 = &OBJC_IVAR___THiOSThemeProvider__uiTextColor;
  id v8 = v37;
  if (v10)
  {
    v20 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:meshSize:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:meshSize:device:", self->_dataBufferAttributes, v10, (double)self->_numPoints, (double)self->_numPoints);
    pageFlipMetalDataBuffer = self->_pageFlipMetalDataBuffer;
    self->_pageFlipMetalDataBuffer = v20;

    [v37 size];
    TSDRectWithSize();
    v19 = &OBJC_IVAR___THiOSThemeProvider__uiTextColor;
    v22 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v10);
    quadMetalDatabuffer = self->_quadMetalDatabuffer;
    self->_quadMetalDatabuffer = v22;
  }
  [v37 size];
  double v25 = v24;
  [v37 size];
  double v27 = v26;
  uint64_t v28 = *(uint64_t *)((char *)&self->super.super.isa + v19[357]);
  double v29 = (double)(v28 - 1);
  double v30 = v25 / v29;
  double v31 = v26 / v29;
  unint64_t positionAttributeIndex = self->_positionAttributeIndex;
  unint64_t texCoordAttributeIndex = self->_texCoordAttributeIndex;
  unint64_t normalAttributeIndex = self->_normalAttributeIndex;
  unint64_t prevPositionAttributeIndex = self->_prevPositionAttributeIndex;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1D5A4C;
  v42[3] = &unk_45B180;
  v42[4] = positionAttributeIndex;
  v42[5] = texCoordAttributeIndex;
  unsigned __int8 v43 = [v9 isMotionBlurred];
  v42[6] = normalAttributeIndex;
  v42[7] = prevPositionAttributeIndex;
  v42[8] = v28;
  *(double *)&v42[9] = v30;
  *(double *)&v42[10] = v31;
  *(double *)&v42[11] = v25;
  *(double *)&v42[12] = v27;
  v36 = objc_retainBlock(v42);
  if (v10) {
    [(TSDMTLDataBuffer *)self->_pageFlipMetalDataBuffer updateMetalDataBufferAttributes:self->_dataBufferAttributes withBlock:v36];
  }

LABEL_13:
}

- (void)update:(id)a3 withContext:(id)a4 isUpdating:(BOOL)a5
{
  id v8 = a4;
  id v9 = a3;
  [v8 percent];
  double v11 = v10;
  v12 = (char *)[v8 direction];
  int64_t numPoints = self->_numPoints;
  double v34 = v11;
  double v14 = (v11 + sin((v11 + -1.0) * 3.14159265 * 0.5) + 1.0) * 0.5;
  double v15 = 1.0 - v14;
  if (v12 == (unsigned char *)&dword_C + 1)
  {
    double v16 = 1.57079633;
    goto LABEL_5;
  }
  if (v12 == (unsigned char *)&dword_C + 2)
  {
    double v16 = -1.57079633;
LABEL_5:
    double v17 = v16 + v15 * 0.785398163;
    goto LABEL_7;
  }
  double v17 = v15 * -0.785398163;
LABEL_7:
  double v18 = fmax(v14 * -0.200000003 * 2.0 + 0.5, 0.200000003);
  if (v14 * 6.28318531 <= 3.14159265) {
    double v19 = v14 * 6.28318531;
  }
  else {
    double v19 = 3.14159265;
  }
  double v33 = (v14 * -2.0 + 1.0) * 1.2;
  __double2 v20 = __sincos_stret(v17);
  __double2 v21 = __sincos_stret(v19);
  double v22 = v19 * v18;
  [v9 size];
  uint64_t v24 = v23;
  [v9 size];
  uint64_t v26 = v25;

  BOOL v27 = v12 == (unsigned char *)&dword_8 + 3;
  unint64_t positionAttributeIndex = self->_positionAttributeIndex;
  unint64_t normalAttributeIndex = self->_normalAttributeIndex;
  unint64_t texCoordAttributeIndex = self->_texCoordAttributeIndex;
  unint64_t prevPositionAttributeIndex = self->_prevPositionAttributeIndex;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1D5F84;
  v35[3] = &unk_45B1A0;
  v35[4] = positionAttributeIndex;
  v35[5] = normalAttributeIndex;
  unsigned __int8 v36 = [v8 isMotionBlurred];
  v35[6] = prevPositionAttributeIndex;
  v35[7] = numPoints;
  BOOL v37 = v27;
  v35[8] = *(void *)&v20.__cosval;
  v35[9] = *(void *)&v20.__sinval;
  *(double *)&v35[10] = v33;
  *(double *)&v35[11] = v22;
  *(double *)&v35[12] = 1.0 / v18;
  *(double *)&v35[13] = v18;
  *(double *)&v35[14] = v18 * (1.0 - v21.__cosval);
  v35[15] = *(void *)&v21.__sinval;
  *(double *)&v35[16] = v18 * v21.__sinval;
  v35[17] = *(void *)&v21.__cosval;
  v35[18] = v26;
  v35[19] = v24;
  *(double *)&v35[20] = v34;
  BOOL v38 = a5;
  v35[21] = texCoordAttributeIndex;
  v32 = objc_retainBlock(v35);
  [(TSDMTLDataBuffer *)self->_pageFlipMetalDataBuffer updateMetalDataBufferAttributes:self->_dataBufferAttributes withBlock:v32];
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4 = a3;
  v55 = [v4 textures];
  uint64_t v5 = [v55 lastObject];
  v6 = [v4 metalContext];
  v56 = [v6 device];
  if ([v4 isMotionBlurred])
  {
    id v7 = objc_alloc((Class)TSDMetalMotionBlurEffect);
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    double v9 = v8;
    double v11 = v10;
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    double v13 = v12;
    double v15 = v14;
    double v16 = [v4 randomGenerator];
    double v17 = [v4 metalContext];
    double v18 = [v7 initWithFramebufferSize:v16 slideSize:v17 randomGenerator:v9 metalContext:v11 v13 v15];
    motionBlurMetalEffect = self->_motionBlurMetalEffect;
    self->_motionBlurMetalEffect = v18;

    [(TSDMetalMotionBlurEffect *)self->_motionBlurMetalEffect setIsSingleObject:1];
  }
  __double2 v20 = (void *)v5;
  id v21 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  [v21 setPixelFormat:[v6 pixelFormat]];
  double v22 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initDefaultTextureShaderWithDevice:v56 colorAttachment:v21];
  quadMetalShader = self->_quadMetalShader;
  self->_quadMetalShader = v22;

  [v21 setBlendingEnabled:1];
  [v21 setSourceAlphaBlendFactor:4];
  [v21 setSourceRGBBlendFactor:4];
  [v21 setDestinationRGBBlendFactor:5];
  [v21 setDestinationAlphaBlendFactor:5];
  if ([v4 isMotionBlurred])
  {
    id v24 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
    objc_msgSend(v24, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));
  }
  else
  {
    id v24 = 0;
  }
  unsigned int v25 = [v4 isMotionBlurred];
  uint64_t v26 = @"transitionPageFlipVertexShader";
  if (v25) {
    uint64_t v26 = @"transitionPageFlipMBVertexShader";
  }
  BOOL v27 = v26;
  unsigned int v28 = [v4 isMotionBlurred];
  double v29 = @"transitionPageFlipFragmentShader";
  if (v28) {
    double v29 = @"transitionPageFlipMBFragmentShader";
  }
  double v30 = v29;
  double v31 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:v27 fragmentShader:v30 device:v56 library:@"KeynoteMetalLibrary" colorAttachment:v21 velocityAttachment:v24];
  pageFlipMetalShader = self->_pageFlipMetalShader;
  self->_pageFlipMetalShader = v31;

  [(KNTransitionPageFlip *)self createArrays:v20 context:v4 device:v56];
  float64x2_t v80 = 0u;
  float64x2_t v81 = 0u;
  float64x2_t v78 = 0u;
  float64x2_t v79 = 0u;
  float64x2_t v76 = 0u;
  float64x2_t v77 = 0u;
  float64x2_t v74 = 0u;
  float64x2_t v75 = 0u;
  mAnimationContext = self->super.mAnimationContext;
  if (mAnimationContext) {
    [(KNAnimationContext *)mAnimationContext slideProjectionMatrix];
  }
  if ([v4 isMotionBlurred])
  {
    double v34 = self->_motionBlurMetalEffect;
    if (v34)
    {
      v65[4] = v78;
      v65[5] = v79;
      v65[6] = v80;
      v65[7] = v81;
      v65[0] = v74;
      v65[1] = v75;
      v65[2] = v76;
      v65[3] = v77;
      [(TSDMetalMotionBlurEffect *)v34 adjustTransformForMotionBlurBuffer:v65];
    }
    else
    {
      float64x2_t v72 = 0u;
      float64x2_t v73 = 0u;
      float64x2_t v70 = 0u;
      float64x2_t v71 = 0u;
      float64x2_t v68 = 0u;
      float64x2_t v69 = 0u;
      float64x2_t v66 = 0u;
      float64x2_t v67 = 0u;
    }
    float64x2_t v78 = v70;
    float64x2_t v79 = v71;
    float64x2_t v80 = v72;
    float64x2_t v81 = v73;
    float64x2_t v74 = v66;
    float64x2_t v75 = v67;
    float64x2_t v76 = v68;
    float64x2_t v77 = v69;
  }
  uint64_t v35 = 0;
  float32x4_t v36 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v74), v75);
  float32x4_t v37 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v76), v77);
  float32x4_t v38 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v78), v79);
  float32x4_t v39 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v80), v81);
  long long v40 = *(_OWORD *)&CGAffineTransformIdentity.a;
  float64x2_t v47 = *(float64x2_t *)&CGAffineTransformIdentity.c;
  *(float32x2_t *)&long long v40 = vcvt_f32_f64(*(float64x2_t *)&CGAffineTransformIdentity.a);
  float32x2_t v41 = vcvt_f32_f64(*(float64x2_t *)&CGAffineTransformIdentity.tx);
  __asm { FMOV            V5.4S, #1.0 }
  *(float32x2_t *)&v47.f64[0] = vcvt_f32_f64(v47);
  anon_60 = self->_anon_60;
  do
  {
    v49 = &anon_60[v35];
    *(float32x4_t *)v49 = v36;
    *((float32x4_t *)v49 + 1) = v37;
    *((float32x4_t *)v49 + 2) = v38;
    *((float32x4_t *)v49 + 3) = v39;
    *((void *)v49 + 8) = v40;
    *(_DWORD *)&anon_60[v35 + 72] = DWORD2(v40);
    *((_DWORD *)v49 + 19) = 0;
    *((void *)v49 + 10) = *(void *)&v47.f64[0];
    *(_DWORD *)&anon_60[v35 + 88] = LODWORD(v47.f64[1]);
    *((_DWORD *)v49 + 23) = 0;
    *((float32x2_t *)v49 + 12) = v41;
    *(_DWORD *)&anon_60[v35 + 104] = DWORD2(_Q5);
    v35 += 128;
    *((_DWORD *)v49 + 27) = 0;
  }
  while (v35 != 384);
  v50 = self->super.mAnimationContext;
  if (v50)
  {
    [(KNAnimationContext *)v50 slideProjectionMatrix];
    float32x4_t v51 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v63), v64);
    float32x4_t v52 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v61), v62);
    float32x4_t v53 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v59), v60);
    float32x4_t v54 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v57), v58);
  }
  else
  {
    float32x4_t v54 = 0uLL;
    float32x4_t v53 = 0uLL;
    float32x4_t v52 = 0uLL;
    float32x4_t v51 = 0uLL;
  }
  *(float32x4_t *)&self->_anon_1f0[4] = v54;
  *(float32x4_t *)&self->_anon_1f0[20] = v53;
  *(float32x4_t *)&self->_anon_1f0[36] = v52;
  *(float32x4_t *)&self->_anon_1f0[52] = v51;
}

- (void)p_drawFlipWithPercent:(double)a3 currentBuffer:(unint64_t)a4 texture:(id)a5 encoder:(id)a6 isMotionBlurred:(BOOL)a7 isUpdating:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a6;
  id v21 = v14;
  double v15 = (a3 + -0.75) * -4.0 + 1.0;
  if (v15 > 1.0) {
    double v15 = 1.0;
  }
  float v16 = v15;
  double v17 = &self->_fragmentInput[a4];
  v17->Opacity = v16;
  [v14 setFragmentTexture:a5 atIndex:0];
  [v21 setCullMode:2];
  double v18 = (float32x2_t *)&self->_anon_60[128 * a4];
  v18[15] = (float32x2_t)0xBF80000000000000;
  if (v9)
  {
    [(TSDMetalMotionBlurEffect *)self->_motionBlurMetalEffect velocityScale];
    v20.f64[1] = v19;
    v18[14] = vcvt_f32_f64(v20);
  }
  [(TSDMetalShader *)self->_pageFlipMetalShader setPipelineStateWithEncoder:v21 vertexBytes:v18 fragmentBytes:v17];
  [(TSDMTLDataBuffer *)self->_pageFlipMetalDataBuffer drawWithEncoder:v21 atIndex:0 advanceDynamicBuffer:0];
  [v21 setCullMode:1];
  v18[15] = (float32x2_t)0x3F8000003A83126FLL;
  [v21 setVertexBytes:v18 length:128 atIndex:1];
  [(TSDMTLDataBuffer *)self->_pageFlipMetalDataBuffer drawWithEncoder:v21 atIndex:0 advanceDynamicBuffer:v8];
}

- (void)renderFrameWithContext:(id)a3
{
  id v27 = a3;
  id v4 = [v27 textures];
  uint64_t v5 = [v27 metalContext];
  v6 = [v5 renderEncoder];
  if (!v6)
  {
    id v7 = +[TSUAssertionHandler currentHandler];
    BOOL v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionPageFlip renderFrameWithContext:]");
    BOOL v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionPageFlip.m"];
    [v7 handleFailureInFunction:v8 file:v9 lineNumber:536 description:@"invalid nil value for '%s'", "workingEncoder"];
  }
  double v10 = [v4 lastObject];
  double v11 = [v10 metalTextureWithContext:v5];

  double v12 = [v4 firstObject];
  double v13 = [v12 metalTextureWithContext:v5];

  if (v11 && v13)
  {
    [(TSDMetalShader *)self->_quadMetalShader setPipelineStateWithEncoder:v6 vertexBytes:&self->_anon_1f0[4]];
    [v6 setFragmentTexture:v11 atIndex:0];
    [(TSDMTLDataBuffer *)self->_quadMetalDatabuffer drawWithEncoder:v6 atIndex:0];
    if ([v27 isMotionBlurred])
    {
      motionBlurMetalEffect = self->_motionBlurMetalEffect;
      double v15 = [v27 metalContext];
      uint64_t v16 = [(TSDMetalMotionBlurEffect *)motionBlurMetalEffect bindColorAndVelocityWithMetalContext:v15 shouldFillBackground:0];

      v6 = (void *)v16;
    }
    [v27 percent];
    if (v17 == self->_lastUpdatePercent)
    {
      [v27 percent];
      BOOL v18 = v19 == 0.0;
    }
    else
    {
      BOOL v18 = 1;
    }
    [v27 percent];
    self->_lastUpdatePercent = v20;
    id v21 = [v4 lastObject];
    [(KNTransitionPageFlip *)self update:v21 withContext:v27 isUpdating:v18];

    [v27 percent];
    double v23 = v22;
    id v24 = [v27 metalContext];
    -[KNTransitionPageFlip p_drawFlipWithPercent:currentBuffer:texture:encoder:isMotionBlurred:isUpdating:](self, "p_drawFlipWithPercent:currentBuffer:texture:encoder:isMotionBlurred:isUpdating:", [v24 currentBuffer], v13, v6, [v27 isMotionBlurred], v18, v23);

    if ([v27 isMotionBlurred])
    {
      unsigned int v25 = self->_motionBlurMetalEffect;
      uint64_t v26 = [v5 renderEncoder];
      [(TSDMetalMotionBlurEffect *)v25 drawResultWithWorkingRenderEncoder:v6 destinationRenderEncoder:v26];
    }
  }
}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  if (a6 == 3 && a8 <= 0x174876E7FFLL && a7)
  {
    BOOL v9 = [*a3 objectForKeyedSubscript:@"KNTransitionAttributesDirection" a4, a5];

    if (v9)
    {
      double v10 = [*a3 objectForKeyedSubscript:@"KNTransitionAttributesDirection"];
      double v11 = (char *)[v10 unsignedIntegerValue];

      if ((unint64_t)(v11 - 1) > 3) {
        uint64_t v12 = 12;
      }
      else {
        uint64_t v12 = qword_345590[(void)(v11 - 1)];
      }
      id v13 = [*a3 mutableCopy];
      id v14 = +[NSNumber numberWithUnsignedInteger:v12];
      [v13 setObject:v14 forKeyedSubscript:@"KNTransitionAttributesDirection"];

      id v15 = v13;
      *a3 = v15;
    }
  }
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  if (a6 == 3 && a8 <= 0x174876E7FFLL && a7)
  {
    BOOL v9 = [*a3 objectForKeyedSubscript:@"direction" a4, a5];

    if (v9)
    {
      double v10 = [*a3 objectForKeyedSubscript:@"direction"];
      double v11 = (char *)[v10 unsignedIntegerValue];

      if ((unint64_t)(v11 - 11) > 3) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = qword_3455B0[(void)(v11 - 11)];
      }
      id v13 = [*a3 mutableCopy];
      id v14 = +[NSNumber numberWithUnsignedInteger:v12];
      [v13 setObject:v14 forKeyedSubscript:@"direction"];

      id v15 = v13;
      *a3 = v15;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quadMetalDatabuffer, 0);
  objc_storeStrong((id *)&self->_quadMetalShader, 0);
  objc_storeStrong((id *)&self->_pageFlipMetalDataBuffer, 0);
  objc_storeStrong((id *)&self->_pageFlipMetalShader, 0);
  objc_storeStrong((id *)&self->_motionBlurMetalEffect, 0);

  objc_storeStrong((id *)&self->_dataBufferAttributes, 0);
}

@end