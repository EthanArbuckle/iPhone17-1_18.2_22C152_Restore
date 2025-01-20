@interface KNTransitionTwist
+ (id)animationFilter;
+ (id)animationName;
+ (id)supportedTypes;
+ (int)animationCategory;
- (KNTransitionTwist)initWithAnimationContext:(id)a3;
- (double)fx:(double)a3 withPercent:(double)a4;
- (void)animationWillBeginWithContext:(id)a3;
- (void)createArrays:(id)a3 context:(id)a4 device:(id)a5;
- (void)drawGrid:(id)a3 encoder:(id)a4 currentBuffer:(unint64_t)a5 advanceDynamicBuffer:(BOOL)a6;
- (void)p_drawTwistWithPercent:(double)a3 currentBuffer:(unint64_t)a4 texture:(id)a5 oldTexture:(id)a6 encoder:(id)a7 isMotionBlurred:(BOOL)a8 isUpdating:(BOOL)a9;
- (void)p_teardown;
- (void)renderFrameWithContext:(id)a3;
- (void)update:(id)a3 withContext:(id)a4 isUpdating:(BOOL)a5;
@end

@implementation KNTransitionTwist

- (KNTransitionTwist)initWithAnimationContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KNTransitionTwist;
  result = [(KNAnimationEffect *)&v4 initWithAnimationContext:a3];
  if (result) {
    result->_numPoints = 19;
  }
  return result;
}

- (void)p_teardown
{
  metalDataBuffer = self->_metalDataBuffer;
  self->_metalDataBuffer = 0;

  metalShader = self->_metalShader;
  self->_metalShader = 0;
}

+ (id)animationName
{
  return @"com.apple.iWork.Keynote.BUKTwist";
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
  return &off_499818;
}

- (void)createArrays:(id)a3 context:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (self->_metalDataBuffer) {
      goto LABEL_12;
    }
    uint64_t v11 = 35048;
  }
  else
  {
    uint64_t v11 = 35044;
  }
  v12 = +[NSMutableArray array];
  v13 = +[TSDGPUDataBufferAttribute attributeWithName:kTSDGPUShaderAttributePosition bufferUsage:35048 dataType:5 normalized:0 componentCount:3];
  [v12 addObject:v13];
  self->_unint64_t positionAttributeIndex = (unint64_t)[v12 indexOfObject:v13];

  v14 = +[TSDGPUDataBufferAttribute attributeWithName:kTSDGPUShaderAttributeTexCoord bufferUsage:v11 dataType:3 normalized:1 componentCount:2];
  [v12 addObject:v14];
  self->_unint64_t texCoordAttributeIndex = (unint64_t)[v12 indexOfObject:v14];

  v15 = +[TSDGPUDataBufferAttribute attributeWithName:kTSDGPUShaderAttributeNormal bufferUsage:35048 dataType:3 normalized:1 componentCount:3];
  [v12 addObject:v15];
  self->_unint64_t normalAttributeIndex = (unint64_t)[v12 indexOfObject:v15];

  if ([v9 isMotionBlurred])
  {
    v16 = +[TSDGPUDataBufferAttribute attributeWithName:kTSDGPUShaderAttributePreviousPosition bufferUsage:35048 dataType:5 normalized:0 componentCount:3];
    [v12 addObject:v16];
    self->_unint64_t prevPositionAttributeIndex = (unint64_t)[v12 indexOfObject:v16];
  }
  v17 = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v12];
  bufferAttributes = self->_bufferAttributes;
  self->_bufferAttributes = v17;

  if (v10)
  {
    v19 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:meshSize:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:meshSize:device:", self->_bufferAttributes, v10, (double)self->_numPoints, (double)self->_numPoints);
    metalDataBuffer = self->_metalDataBuffer;
    self->_metalDataBuffer = v19;
  }
  [v8 size:v9];
  double v22 = v21;
  id v23 = v8;
  [v8 size];
  int64_t numPoints = self->_numPoints;
  double v25 = (double)(numPoints - 1);
  double v26 = v22 / v25;
  double v28 = v27 / v25;
  unint64_t positionAttributeIndex = self->_positionAttributeIndex;
  unint64_t texCoordAttributeIndex = self->_texCoordAttributeIndex;
  unint64_t normalAttributeIndex = self->_normalAttributeIndex;
  unint64_t prevPositionAttributeIndex = self->_prevPositionAttributeIndex;
  double v33 = 1.0 / v25;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_28E54;
  v36[3] = &unk_4575B0;
  v36[4] = positionAttributeIndex;
  v36[5] = texCoordAttributeIndex;
  unsigned __int8 v37 = [v35 isMotionBlurred];
  v36[6] = normalAttributeIndex;
  v36[7] = prevPositionAttributeIndex;
  v36[8] = numPoints;
  *(double *)&v36[9] = v26;
  *(double *)&v36[10] = v28;
  *(double *)&v36[11] = v33;
  v34 = objc_retainBlock(v36);
  if (v10) {
    [(TSDMTLDataBuffer *)self->_metalDataBuffer updateMetalDataBufferAttributes:self->_bufferAttributes withBlock:v34];
  }

  id v8 = v23;
  id v9 = v35;
LABEL_12:
}

- (void)drawGrid:(id)a3 encoder:(id)a4 currentBuffer:(unint64_t)a5 advanceDynamicBuffer:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  [v10 setFragmentTexture:a3 atIndex:0];
  [v10 setVertexBytes:(char *)&self[1] + 128 * a5 length:128 atIndex:1];
  [(TSDMTLDataBuffer *)self->_metalDataBuffer drawWithEncoder:v10 atIndex:0 advanceDynamicBuffer:v6];
}

- (double)fx:(double)a3 withPercent:(double)a4
{
  double v4 = (self->_twistyness + -1.0) / 9.0 + 0.25;
  double v5 = (v4 + 1.0) * a4 - v4 * a3;
  double v6 = 0.0;
  if (v5 < 0.0) {
    return v6;
  }
  double v6 = 1.0;
  if (v5 > 1.0) {
    return v6;
  }
  TSUSineMap();
  return result;
}

- (void)update:(id)a3 withContext:(id)a4 isUpdating:(BOOL)a5
{
  id v8 = a4;
  id v9 = a3;
  [v8 percent];
  uint64_t v11 = v10;
  v12 = (char *)[v8 direction];
  [v9 size];
  double v14 = v13;

  int64_t numPoints = self->_numPoints;
  unint64_t positionAttributeIndex = self->_positionAttributeIndex;
  unint64_t texCoordAttributeIndex = self->_texCoordAttributeIndex;
  unint64_t normalAttributeIndex = self->_normalAttributeIndex;
  unint64_t prevPositionAttributeIndex = self->_prevPositionAttributeIndex;
  LOBYTE(v9) = [v8 isMotionBlurred];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_29328;
  v21[3] = &unk_4575D8;
  v21[6] = texCoordAttributeIndex;
  v21[7] = normalAttributeIndex;
  char v22 = (char)v9;
  v21[8] = prevPositionAttributeIndex;
  v21[9] = numPoints;
  v21[4] = self;
  v21[5] = positionAttributeIndex;
  BOOL v23 = v12 == (unsigned char *)&dword_8 + 3;
  v21[10] = v11;
  *(double *)&v21[11] = v14 * 0.5;
  BOOL v24 = a5;
  v20 = objc_retainBlock(v21);
  [(TSDMTLDataBuffer *)self->_metalDataBuffer updateMetalDataBufferAttributes:self->_bufferAttributes withBlock:v20];
}

- (void)p_drawTwistWithPercent:(double)a3 currentBuffer:(unint64_t)a4 texture:(id)a5 oldTexture:(id)a6 encoder:(id)a7 isMotionBlurred:(BOOL)a8 isUpdating:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeScale(&v41, 1.0, -1.0);
  CGAffineTransform v39 = v41;
  CGAffineTransformTranslate(&v40, &v39, 0.0, -1.0);
  CGAffineTransform v41 = v40;
  float64x2_t v18 = *(float64x2_t *)&v40.a;
  float64x2_t v19 = *(float64x2_t *)&v40.c;
  float64x2_t v20 = *(float64x2_t *)&v40.tx;
  float64x2_t v21 = *(float64x2_t *)&CGAffineTransformIdentity.a;
  float64x2_t v22 = *(float64x2_t *)&CGAffineTransformIdentity.c;
  float64x2_t v23 = *(float64x2_t *)&CGAffineTransformIdentity.tx;
  if (v10)
  {
    float64x2_t v35 = *(float64x2_t *)&v41.c;
    float64x2_t v37 = *(float64x2_t *)&v40.a;
    float64x2_t v31 = *(float64x2_t *)&CGAffineTransformIdentity.a;
    float64x2_t v33 = *(float64x2_t *)&v40.tx;
    float64x2_t v27 = *(float64x2_t *)&CGAffineTransformIdentity.tx;
    float64x2_t v29 = *(float64x2_t *)&CGAffineTransformIdentity.c;
    [(TSDMetalMotionBlurEffect *)self->_motionBlurMetalEffect velocityScale];
    float64x2_t v22 = v29;
    float64x2_t v21 = v31;
    float64x2_t v20 = v33;
    float64x2_t v19 = v35;
    v25.f64[1] = v24;
    float64x2_t v18 = v37;
    *((float32x2_t *)&self[2].super.super.isa + 16 * a4) = vcvt_f32_f64(v25);
    float64x2_t v23 = v27;
  }
  float32x2_t v32 = vcvt_f32_f64(v23);
  float32x2_t v30 = vcvt_f32_f64(v22);
  float32x2_t v38 = vcvt_f32_f64(v20);
  float32x2_t v36 = vcvt_f32_f64(v19);
  float32x2_t v34 = vcvt_f32_f64(v18);
  [v17 popDebugGroup:vcvt_f32_f64(v21), *(void *)&v23.f64[1]];
  [v17 pushDebugGroup:@"KNTransitionTwist Draw Front"];
  [v17 setCullMode:1];
  double v26 = (float32x2_t *)((char *)&self[1] + 128 * a4);
  v26[15].i32[1] = 1065353216;
  v26[8] = v28;
  v26[9] = 0;
  v26[10] = v30;
  v26[11] = 0;
  v26[12] = v32;
  v26[13] = (float32x2_t)1065353216;
  [(KNTransitionTwist *)self drawGrid:v15 encoder:v17 currentBuffer:a4 advanceDynamicBuffer:0];
  [v17 pushDebugGroup:@"KNTransitionTwist Draw Back"];
  [v17 setCullMode:2];
  v26[15].i32[1] = -1082130432;
  v26[8] = v34;
  v26[9] = 0;
  v26[10] = v36;
  v26[11] = 0;
  v26[12] = v38;
  v26[13] = (float32x2_t)1065353216;
  [(KNTransitionTwist *)self drawGrid:v16 encoder:v17 currentBuffer:a4 advanceDynamicBuffer:v9];
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4 = a3;
  v45 = [v4 textures];
  uint64_t v44 = [v45 lastObject];
  self->_twistyness = 3.3;
  double v5 = [v4 transitionAttributes];
  double v6 = [v5 objectForKeyedSubscript:@"com.apple.iWork.Keynote.BUKTwist.twist"];

  if (v6)
  {
    v7 = [v5 objectForKeyedSubscript:@"com.apple.iWork.Keynote.BUKTwist.twist"];
    [v7 doubleValue];
    self->_twistyness = v8;
  }
  BOOL v9 = [v4 metalContext];
  BOOL v10 = [v9 device];
  id v11 = [v9 pixelFormat];
  id v12 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  [v12 setPixelFormat:v11];
  float64x2_t v61 = 0u;
  float64x2_t v62 = 0u;
  float64x2_t v59 = 0u;
  float64x2_t v60 = 0u;
  float64x2_t v57 = 0u;
  float64x2_t v58 = 0u;
  float64x2_t v55 = 0u;
  float64x2_t v56 = 0u;
  mAnimationContext = self->super.mAnimationContext;
  if (mAnimationContext) {
    [(KNAnimationContext *)mAnimationContext slideProjectionMatrix];
  }
  if ([v4 isMotionBlurred])
  {
    id v14 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
    [v14 setPixelFormat:v11];
    id v15 = objc_alloc((Class)TSDMetalMotionBlurEffect);
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    double v17 = v16;
    double v19 = v18;
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    double v21 = v20;
    double v23 = v22;
    float64_t v24 = [v4 randomGenerator];
    float64x2_t v25 = [v4 metalContext];
    double v26 = [v15 initWithFramebufferSize:v24 slideSize:v25 randomGenerator:v17 metalContext:v19, v21, v23];
    motionBlurMetalEffect = self->_motionBlurMetalEffect;
    self->_motionBlurMetalEffect = v26;

    float32x2_t v28 = self->_motionBlurMetalEffect;
    if (v28)
    {
      v46[4] = v59;
      v46[5] = v60;
      v46[6] = v61;
      v46[7] = v62;
      v46[0] = v55;
      v46[1] = v56;
      v46[2] = v57;
      v46[3] = v58;
      [(TSDMetalMotionBlurEffect *)v28 adjustTransformForMotionBlurBuffer:v46];
    }
    else
    {
      float64x2_t v53 = 0u;
      float64x2_t v54 = 0u;
      float64x2_t v51 = 0u;
      float64x2_t v52 = 0u;
      float64x2_t v49 = 0u;
      float64x2_t v50 = 0u;
      float64x2_t v47 = 0u;
      float64x2_t v48 = 0u;
    }
    float64x2_t v29 = (void *)v44;
    float64x2_t v59 = v51;
    float64x2_t v60 = v52;
    float64x2_t v61 = v53;
    float64x2_t v62 = v54;
    float64x2_t v55 = v47;
    float64x2_t v56 = v48;
    float64x2_t v57 = v49;
    float64x2_t v58 = v50;
  }
  else
  {
    id v14 = 0;
    float64x2_t v29 = (void *)v44;
  }
  unsigned int v30 = [v4 isMotionBlurred];
  float64x2_t v31 = @"transitionTwistVertexShader";
  if (v30) {
    float64x2_t v31 = @"transitionTwistMBVertexShader";
  }
  float32x2_t v32 = v31;
  unsigned int v33 = [v4 isMotionBlurred];
  float32x2_t v34 = @"transitionTwistFragmentShader";
  if (v33) {
    float32x2_t v34 = @"transitionTwistMBFragmentShader";
  }
  float64x2_t v35 = v34;
  float32x2_t v36 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:v32 fragmentShader:v35 device:v10 library:@"KeynoteMetalLibrary" colorAttachment:v12 velocityAttachment:v14];
  metalShader = self->_metalShader;
  self->_metalShader = v36;

  [(KNTransitionTwist *)self createArrays:v29 context:v4 device:v10];
  uint64_t v38 = 0;
  float32x4_t v39 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v55), v56);
  float32x4_t v40 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v57), v58);
  float32x4_t v41 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v59), v60);
  float32x4_t v42 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v61), v62);
  do
  {
    v43 = (float32x4_t *)((char *)&self[1]._positionAttributeIndex + v38);
    v43[-2] = v39;
    v43[-1] = v40;
    float32x4_t *v43 = v41;
    v43[1] = v42;
    v38 += 128;
  }
  while (v38 != 384);
}

- (void)renderFrameWithContext:(id)a3
{
  id v29 = a3;
  id v4 = [v29 textures];
  [v29 percent];
  double v6 = v5;
  v7 = [v29 metalContext];
  double v8 = [v7 renderEncoder];
  if (!v8)
  {
    BOOL v9 = +[TSUAssertionHandler currentHandler];
    BOOL v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionTwist renderFrameWithContext:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionTwist.m"];
    [v9 handleFailureInFunction:v10 file:v11 lineNumber:501 description:@"invalid nil value for '%s'", "workingEncoder"];
  }
  id v12 = [v4 lastObject];
  double v13 = [v12 metalTextureWithContext:v7];

  if (v13)
  {
    if ((unint64_t)[v4 count] < 2)
    {
      id v14 = 0;
      id v15 = 0;
    }
    else
    {
      id v14 = [v4 objectAtIndexedSubscript:0];
      id v15 = [v14 metalTextureWithContext:v7];
    }
    [v29 percent];
    if (v16 == self->_lastUpdatePercent)
    {
      [v29 percent];
      BOOL v17 = v18 == 0.0;
    }
    else
    {
      BOOL v17 = 1;
    }
    [v29 percent];
    self->_lastUpdatePercent = v19;
    [(KNTransitionTwist *)self update:v14 withContext:v29 isUpdating:v17];
    TSUSineMap();
    float v21 = v20 * 0.5;
    double v22 = [v29 metalContext];
    *((float *)&self[2].super.mAnimationContext + 32 * (void)[v22 currentBuffer]) = v21;

    if ([v29 isMotionBlurred])
    {
      motionBlurMetalEffect = self->_motionBlurMetalEffect;
      float64_t v24 = [v29 metalContext];
      uint64_t v25 = [(TSDMetalMotionBlurEffect *)motionBlurMetalEffect bindColorAndVelocityWithMetalContext:v24 shouldFillBackground:0];

      double v8 = (void *)v25;
    }
    [(TSDMetalShader *)self->_metalShader setPipelineStateWithEncoder:v8];
    double v26 = [v29 metalContext];
    -[KNTransitionTwist p_drawTwistWithPercent:currentBuffer:texture:oldTexture:encoder:isMotionBlurred:isUpdating:](self, "p_drawTwistWithPercent:currentBuffer:texture:oldTexture:encoder:isMotionBlurred:isUpdating:", [v26 currentBuffer], v13, v15, v8, [v29 isMotionBlurred], v17, v6);

    if ([v29 isMotionBlurred])
    {
      float64x2_t v27 = self->_motionBlurMetalEffect;
      float32x2_t v28 = [v7 renderEncoder];
      [(TSDMetalMotionBlurEffect *)v27 drawResultWithWorkingRenderEncoder:v8 destinationRenderEncoder:v28];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalShader, 0);
  objc_storeStrong((id *)&self->_bufferAttributes, 0);

  objc_storeStrong((id *)&self->_motionBlurMetalEffect, 0);
}

@end