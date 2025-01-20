@interface KNTransitionFlop
+ (id)animationFilter;
+ (id)animationName;
+ (id)defaultAttributes;
+ (id)supportedTypes;
+ (id)thumbnailImageNameForType:(int)a3;
+ (int)animationCategory;
+ (int)rendererTypeForAnimationContext:(id)a3;
+ (unint64_t)directionType;
+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8;
+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8;
- (KNTransitionFlop)initWithAnimationContext:(id)a3;
- (void)_updateFlop:(id)a3 withContext:(id)a4 dataBuffer:(id)a5 isUpdating:(BOOL)a6;
- (void)_updateShadowWithTexture:(id)a3 percent:(double)a4 direction:(unint64_t)a5 shadowBuffer:(id)a6 currentBuffer:(unint64_t)a7;
- (void)animationWillBeginWithContext:(id)a3;
- (void)createArrays:(id)a3 context:(id)a4 device:(id)a5;
- (void)p_drawFlopVertical:(BOOL)a3 encoder:(id)a4 metalTexture:(id)a5 oldMetalTexture:(id)a6 isUpdating:(BOOL)a7;
- (void)p_metalAnimationWillBeginWithContext:(id)a3;
- (void)p_metalRenderFrameWithContext:(id)a3;
- (void)p_teardown;
- (void)renderFrameWithContext:(id)a3;
- (void)updateFlopAndShadowMeshesWithTexture:(id)a3 context:(id)a4 flopBuffer:(id)a5 shadowBuffer:(id)a6 isUpdating:(BOOL)a7;
@end

@implementation KNTransitionFlop

- (KNTransitionFlop)initWithAnimationContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KNTransitionFlop;
  result = [(KNAnimationEffect *)&v4 initWithAnimationContext:a3];
  if (result) {
    result->_numPoints = 13;
  }
  return result;
}

- (void)p_teardown
{
  colorBufferAttributes = self->_colorBufferAttributes;
  self->_colorBufferAttributes = 0;

  shadowBufferAttributes = self->_shadowBufferAttributes;
  self->_shadowBufferAttributes = 0;

  quadMetalShader = self->_quadMetalShader;
  self->_quadMetalShader = 0;

  metalOutgoingQuadDataBuffer = self->_metalOutgoingQuadDataBuffer;
  self->_metalOutgoingQuadDataBuffer = 0;

  metalIncomingQuadDataBuffer = self->_metalIncomingQuadDataBuffer;
  self->_metalIncomingQuadDataBuffer = 0;

  colorMetalShader = self->_colorMetalShader;
  self->_colorMetalShader = 0;

  metalColorDataBuffer = self->_metalColorDataBuffer;
  self->_metalColorDataBuffer = 0;

  shadowMetalShader = self->_shadowMetalShader;
  self->_shadowMetalShader = 0;

  metalShadowDataBuffer = self->_metalShadowDataBuffer;
  self->_metalShadowDataBuffer = 0;
}

+ (int)rendererTypeForAnimationContext:(id)a3
{
  return 2;
}

+ (id)animationName
{
  return @"com.apple.iWork.Keynote.BUKFlop";
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
  return &off_499800;
}

+ (unint64_t)directionType
{
  return 4;
}

+ (id)defaultAttributes
{
  CFStringRef v4 = @"KNTransitionAttributesDuration";
  v5 = &off_498F38;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"anim-icons-trans-flop";
}

- (void)createArrays:(id)a3 context:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (self->_metalColorDataBuffer) {
      goto LABEL_29;
    }
    v49 = v8;
    uint64_t v11 = 35048;
  }
  else
  {
    v49 = v8;
    uint64_t v11 = 35044;
  }
  v48 = (int *)[v9 direction];
  v12 = +[NSMutableArray array];
  uint64_t v13 = kTSDGPUShaderAttributePosition;
  v14 = +[TSDGPUDataBufferAttribute attributeWithName:kTSDGPUShaderAttributePosition bufferUsage:35048 dataType:5 normalized:0 componentCount:3];
  [v12 addObject:v14];
  v15 = +[TSDGPUDataBufferAttribute attributeWithName:kTSDGPUShaderAttributeTexCoord bufferUsage:v11 dataType:3 normalized:1 componentCount:2];
  [v12 addObject:v15];
  v16 = +[TSDGPUDataBufferAttribute attributeWithName:kTSDGPUShaderAttributeNormal bufferUsage:35048 dataType:3 normalized:1 componentCount:3];
  [v12 addObject:v16];
  if ([v9 isMotionBlurred])
  {
    v17 = +[TSDGPUDataBufferAttribute attributeWithName:kTSDGPUShaderAttributePreviousPosition bufferUsage:35048 dataType:5 normalized:0 componentCount:3];
    [v12 addObject:v17];
  }
  else
  {
    v17 = 0;
  }
  v18 = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v12];
  colorBufferAttributes = self->_colorBufferAttributes;
  self->_colorBufferAttributes = v18;

  self->_unint64_t colorPositionAttributeIndex = [(NSArray *)self->_colorBufferAttributes indexOfObject:v14];
  self->_unint64_t colorTexCoordAttributeIndex = [(NSArray *)self->_colorBufferAttributes indexOfObject:v15];
  self->_unint64_t colorNormalAttributeIndex = [(NSArray *)self->_colorBufferAttributes indexOfObject:v16];
  self->_unint64_t colorPrevPositionAttributeIndex = [(NSArray *)self->_colorBufferAttributes indexOfObject:v17];

  v20 = +[NSMutableArray array];
  v21 = +[TSDGPUDataBufferAttribute attributeWithName:v13 bufferUsage:35048 dataType:5 normalized:0 componentCount:2];
  [v20 addObject:v21];
  if (v10) {
    uint64_t v22 = 5;
  }
  else {
    uint64_t v22 = 2;
  }
  v23 = +[TSDGPUDataBufferAttribute attributeWithName:@"Alpha" bufferUsage:35048 dataType:v22 normalized:1 componentCount:1];
  [v20 addObject:v23];
  v24 = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v20];
  shadowBufferAttributes = self->_shadowBufferAttributes;
  self->_shadowBufferAttributes = v24;

  self->_shadowPositionAttributeIndex = [(NSArray *)self->_shadowBufferAttributes indexOfObject:v21];
  self->_shadowAlphaAttributeIndex = [(NSArray *)self->_shadowBufferAttributes indexOfObject:v23];

  if (v10)
  {
    v26 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:self->_shadowBufferAttributes vertexCount:2 * self->_numPoints indexElementCount:0 device:v10];
    metalShadowDataBuffer = self->_metalShadowDataBuffer;
    self->_metalShadowDataBuffer = v26;
  }
  id v8 = v49;
  [v49 size];
  double v29 = v28;
  [v49 size];
  unint64_t v31 = (unint64_t)v48 - 13;
  double v32 = v29 * 0.5;
  if (v48 == (int *)((char *)&dword_C + 1)) {
    double v33 = v30 * 0.5;
  }
  else {
    double v33 = 0.0;
  }
  if (v31 < 2) {
    double v30 = v30 * 0.5;
  }
  int64_t numPoints = self->_numPoints;
  if (v31 >= 2) {
    double v35 = v29 * 0.5;
  }
  else {
    double v35 = v29;
  }
  double v36 = (double)(numPoints - 1);
  double v37 = v35 / v36;
  double v38 = v30 / v36;
  if (v48 == &dword_C) {
    double v39 = v32;
  }
  else {
    double v39 = 0.0;
  }
  if (v10)
  {
    v40 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:meshSize:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:meshSize:device:", self->_colorBufferAttributes, v10, (double)numPoints, (double)numPoints);
    metalColorDataBuffer = self->_metalColorDataBuffer;
    self->_metalColorDataBuffer = v40;
  }
  unsigned __int8 v42 = [v9 isMotionBlurred];
  unint64_t colorPositionAttributeIndex = self->_colorPositionAttributeIndex;
  unint64_t colorTexCoordAttributeIndex = self->_colorTexCoordAttributeIndex;
  unint64_t colorNormalAttributeIndex = self->_colorNormalAttributeIndex;
  unint64_t colorPrevPositionAttributeIndex = self->_colorPrevPositionAttributeIndex;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_25564;
  v50[3] = &unk_457548;
  unint64_t v52 = colorPositionAttributeIndex;
  unint64_t v53 = colorTexCoordAttributeIndex;
  unsigned __int8 v61 = v42;
  unint64_t v54 = colorNormalAttributeIndex;
  unint64_t v55 = colorPrevPositionAttributeIndex;
  int64_t v56 = numPoints;
  double v57 = v37;
  double v58 = v39;
  double v59 = v38;
  double v60 = v33;
  id v51 = v49;
  v47 = objc_retainBlock(v50);
  if (v10) {
    [(TSDMTLDataBuffer *)self->_metalColorDataBuffer updateMetalDataBufferAttributes:self->_colorBufferAttributes withBlock:v47];
  }

LABEL_29:
}

- (void)_updateFlop:(id)a3 withContext:(id)a4 dataBuffer:(id)a5 isUpdating:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [v11 percent];
  double v14 = v13;
  id v15 = [v11 direction];
  [v10 size];
  double v17 = v16 * 0.5;
  [v10 size];
  double v19 = v18 * 0.5;
  [v10 size];
  uint64_t v21 = v20;
  [v10 size];
  int64_t numPoints = self->_numPoints;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_25998;
  v27[3] = &unk_457570;
  v27[4] = self;
  id v28 = v11;
  uint64_t v31 = v21;
  uint64_t v32 = v23;
  id v33 = v15;
  double v34 = v17;
  double v35 = v19;
  double v36 = v14 * 3.14159265;
  double v37 = v14 * (v14 * v14) * 3.14159265;
  double v38 = v14;
  BOOL v39 = a6;
  id v29 = v10;
  int64_t v30 = numPoints;
  id v24 = v10;
  id v25 = v11;
  v26 = objc_retainBlock(v27);
  [v12 updateMetalDataBufferAttributes:self->_colorBufferAttributes withBlock:v26];
}

- (void)_updateShadowWithTexture:(id)a3 percent:(double)a4 direction:(unint64_t)a5 shadowBuffer:(id)a6 currentBuffer:(unint64_t)a7
{
  unint64_t v12 = a5 - 11;
  int64_t numPoints = self->_numPoints;
  id v14 = a6;
  id v15 = a3;
  [v15 size];
  double v17 = v16;
  [v15 size];
  double v19 = v18;

  if (v12 >= 2)
  {
    double v26 = ceil(v19 * 0.5 * 0.02);
    double v27 = v19 * 0.5 - v26;
    double v22 = 0.0;
    double v28 = v19 * 0.5 + v26;
    if (a5 == 13) {
      double v25 = v28;
    }
    else {
      double v25 = v27;
    }
    if (a5 == 13) {
      double v23 = -1.0;
    }
    else {
      double v23 = 1.0;
    }
    if (a5 == 13) {
      double v19 = v28;
    }
    else {
      double v19 = v27;
    }
  }
  else
  {
    double v20 = ceil(v17 * 0.5 * 0.02);
    double v21 = v17 * 0.5 - v20;
    double v22 = -1.0;
    double v23 = 1.0;
    double v24 = v17 * 0.5 + v20;
    if (a5 == 12) {
      double v25 = v24;
    }
    else {
      double v25 = v21;
    }
    if (a5 == 12) {
      double v17 = v24;
    }
    else {
      double v17 = v21;
    }
  }
  double v29 = v25 / 5.0;
  TSUSineMap();
  float v30 = self->_shadowUmbra[a7];
  unint64_t shadowPositionAttributeIndex = self->_shadowPositionAttributeIndex;
  unint64_t shadowAlphaAttributeIndex = self->_shadowAlphaAttributeIndex;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_26228;
  v35[3] = &unk_457590;
  v35[4] = shadowPositionAttributeIndex;
  v35[5] = shadowAlphaAttributeIndex;
  *(double *)&v35[6] = a4;
  *(double *)&v35[7] = a4 * 0.2 * a4 + 0.8;
  BOOL v36 = v12 < 2;
  *(double *)&v35[8] = v17;
  *(double *)&v35[9] = v19;
  BOOL v37 = a5 == 11;
  *(double *)&v35[10] = a4 * 0.3 + 0.5;
  *(double *)&v35[11] = v22;
  *(double *)&v35[12] = v30;
  *(double *)&v35[13] = v23;
  v35[14] = numPoints;
  *(double *)&v35[15] = v29 * v31 * a4;
  double v34 = objc_retainBlock(v35);
  [v14 updateMetalDataBufferAttributes:self->_shadowBufferAttributes withBlock:v34];
}

- (void)updateFlopAndShadowMeshesWithTexture:(id)a3 context:(id)a4 flopBuffer:(id)a5 shadowBuffer:(id)a6 isUpdating:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  [(KNTransitionFlop *)self _updateFlop:v14 withContext:v13 dataBuffer:a5 isUpdating:v7];
  [v13 percent];
  double v16 = v15;
  id v17 = [v13 direction];
  id v18 = [v13 metalContext];

  -[KNTransitionFlop _updateShadowWithTexture:percent:direction:shadowBuffer:currentBuffer:](self, "_updateShadowWithTexture:percent:direction:shadowBuffer:currentBuffer:", v14, v17, v12, [v18 currentBuffer], v16);
}

- (void)p_metalAnimationWillBeginWithContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 textures];
  v6 = [v5 lastObject];
  BOOL v7 = [v4 metalContext];
  id v8 = [v7 device];

  id v9 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  id v10 = [v4 metalContext];
  [v9 setPixelFormat:[v10 pixelFormat]];

  id v11 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initDefaultTextureShaderWithDevice:v8 colorAttachment:v9];
  quadMetalShader = self->_quadMetalShader;
  self->_quadMetalShader = v11;

  id v13 = [v4 direction];
  [v6 frame];
  double v18 = v16;
  double v19 = v17;
  switch((unint64_t)v13)
  {
    case 0xBuLL:
      double v20 = 0.49;
      double v21 = v14;
      double v14 = v14 + v16 * 0.49;
      double width = 0.51;
      double v18 = v16 * 0.51;
      double y = 0.0;
      double height = 1.0;
      double x = 0.0;
      double v26 = 0.0;
      goto LABEL_5;
    case 0xCuLL:
      double width = 0.51;
      double x = 0.49;
      double v21 = v14 + v16 * 0.49;
      double v18 = v16 * 0.51;
      double y = 0.0;
      double height = 1.0;
      double v26 = 0.0;
      double v20 = 0.0;
LABEL_5:
      double v30 = v15;
      break;
    case 0xDuLL:
      double height = 0.51;
      double y = 0.49;
      double v30 = v15 + v17 * 0.49;
      double v19 = v17 * 0.51;
      double x = 0.0;
      double width = 1.0;
      double v26 = 0.0;
      goto LABEL_8;
    case 0xEuLL:
      double v26 = 0.49;
      double v30 = v15;
      double v15 = v15 + v17 * 0.49;
      double height = 0.51;
      double v19 = v17 * 0.51;
      double y = 0.0;
      double width = 1.0;
      double x = 0.0;
LABEL_8:
      double v20 = 0.0;
      double v21 = v14;
      break;
    default:
      double x = CGRectZero.origin.x;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      double v27 = +[TSUAssertionHandler currentHandler];
      double v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionFlop p_metalAnimationWillBeginWithContext:]");
      double v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionFlop.m"];
      [v27 handleFailureInFunction:v28 file:v29 lineNumber:609 description:@"Unknown direction!"];

      double v26 = y;
      double v20 = CGRectZero.origin.x;
      double v18 = width;
      double v30 = y;
      double v21 = CGRectZero.origin.x;
      double v19 = height;
      double v15 = y;
      double v14 = CGRectZero.origin.x;
      break;
  }
  if (!self->_metalOutgoingQuadDataBuffer)
  {
    double v31 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v8, v14, v15, v18, v19, v20, v26, width, height);
    metalOutgoingQuadDataBuffer = self->_metalOutgoingQuadDataBuffer;
    self->_metalOutgoingQuadDataBuffer = v31;

    id v33 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v8, v21, v30, v18, v19, x, y, width, height);
    metalIncomingQuadDataBuffer = self->_metalIncomingQuadDataBuffer;
    self->_metalIncomingQuadDataBuffer = v33;
  }
  [v9 setBlendingEnabled:1 v14, v15];
  [v9 setSourceAlphaBlendFactor:1];
  [v9 setSourceRGBBlendFactor:1];
  [v9 setDestinationRGBBlendFactor:5];
  [v9 setDestinationAlphaBlendFactor:5];
  double v35 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"transitionFlopShadowVertexShader" fragmentShader:@"transitionFlopShadowFragmentShader" device:v8 library:@"KeynoteMetalLibrary" colorAttachment:v9];
  shadowMetalShader = self->_shadowMetalShader;
  self->_shadowMetalShader = v35;

  if ([v4 isMotionBlurred])
  {
    id v37 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
    double v38 = [v4 metalContext];
    [v37 setPixelFormat:[v38 pixelFormat]];

    [v9 setBlendingEnabled:0];
    id v39 = objc_alloc((Class)TSDMetalMotionBlurEffect);
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    double v41 = v40;
    double v43 = v42;
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    double v45 = v44;
    double v47 = v46;
    v48 = [v4 randomGenerator];
    v49 = [v4 metalContext];
    v50 = [v39 initWithFramebufferSize:v48 slideSize:v49 randomGenerator:v41 metalContext:v43];
    motionBlurMetalEffect = self->_motionBlurMetalEffect;
    self->_motionBlurMetalEffect = v50;

    [(TSDMetalMotionBlurEffect *)self->_motionBlurMetalEffect setIsSingleObject:1];
  }
  else
  {
    id v37 = 0;
  }
  unsigned int v52 = [v4 isMotionBlurred];
  unint64_t v53 = @"transitionFlopVertexShader";
  if (v52) {
    unint64_t v53 = @"transitionFlopMBVertexShader";
  }
  unint64_t v54 = v53;
  unsigned int v55 = [v4 isMotionBlurred];
  int64_t v56 = @"transitionFlopFragmentShader";
  if (v55) {
    int64_t v56 = @"transitionFlopMBFragmentShader";
  }
  double v57 = v56;
  double v58 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:v54 fragmentShader:v57 device:v8 library:@"KeynoteMetalLibrary" colorAttachment:v9 velocityAttachment:v37];

  colorMetalShader = self->_colorMetalShader;
  self->_colorMetalShader = v58;

  [(KNTransitionFlop *)self createArrays:v6 context:v4 device:v8];
  float32x4_t v60 = 0uLL;
  float64x2_t v103 = 0u;
  float64x2_t v104 = 0u;
  float64x2_t v101 = 0u;
  float64x2_t v102 = 0u;
  float64x2_t v99 = 0u;
  float64x2_t v100 = 0u;
  float64x2_t v97 = 0u;
  float64x2_t v98 = 0u;
  mAnimationContext = self->super.mAnimationContext;
  if (mAnimationContext)
  {
    [(KNAnimationContext *)mAnimationContext slideProjectionMatrix];
    float32x4_t v62 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v103), v104);
    float32x4_t v63 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v101), v102);
    float32x4_t v64 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v99), v100);
    float32x4_t v60 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v97), v98);
  }
  else
  {
    float32x4_t v64 = 0uLL;
    float32x4_t v63 = 0uLL;
    float32x4_t v62 = 0uLL;
  }
  *(float32x4_t *)self->_anon_a0 = v60;
  *(float32x4_t *)&self->_anon_a0[16] = v64;
  *(float32x4_t *)&self->_anon_a0[32] = v63;
  *(float32x4_t *)&self->_anon_a0[48] = v62;
  *(float32x4_t *)self->_anon_e0 = v60;
  *(float32x4_t *)&self->_anon_e0[16] = v64;
  *(float32x4_t *)&self->_anon_e0[32] = v63;
  *(float32x4_t *)&self->_anon_e0[48] = v62;
  if (objc_msgSend(v4, "isMotionBlurred", *(_OWORD *)&v62, *(_OWORD *)&v63, *(_OWORD *)&v64, *(_OWORD *)&v60))
  {
    v65 = self->_motionBlurMetalEffect;
    if (v65)
    {
      float64x2_t v87 = v101;
      float64x2_t v88 = v102;
      float64x2_t v89 = v103;
      float64x2_t v90 = v104;
      *(float64x2_t *)&v85.a = v97;
      *(float64x2_t *)&v85.c = v98;
      *(float64x2_t *)&v85.tdouble x = v99;
      float64x2_t v86 = v100;
      [(TSDMetalMotionBlurEffect *)v65 adjustTransformForMotionBlurBuffer:&v85];
    }
    else
    {
      float64x2_t v95 = 0u;
      float64x2_t v96 = 0u;
      float64x2_t v93 = 0u;
      float64x2_t v94 = 0u;
      float64x2_t v92 = 0u;
      memset(&v91, 0, sizeof(v91));
    }
    float64x2_t v97 = *(float64x2_t *)&v91.a;
    float64x2_t v98 = *(float64x2_t *)&v91.c;
    float64x2_t v103 = v95;
    float64x2_t v104 = v96;
    float64x2_t v101 = v93;
    float64x2_t v102 = v94;
    float64x2_t v99 = *(float64x2_t *)&v91.tx;
    float64x2_t v100 = v92;
    float32x4_t v66 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v91.a), *(float64x2_t *)&v91.c);
    float32x4_t v67 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v91.tx), v92);
    float32x4_t v69 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v93), v94);
    float32x4_t v68 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v95), v96);
  }
  else
  {
    float32x4_t v67 = v81;
    float32x4_t v66 = v82;
    float32x4_t v68 = v79;
    float32x4_t v69 = v80;
  }
  *(float32x4_t *)self->_anon_120 = v66;
  *(float32x4_t *)&self->_anon_120[16] = v67;
  *(float32x4_t *)&self->_anon_120[32] = v69;
  *(float32x4_t *)&self->_anon_120[48] = v68;
  *(float32x4_t *)self->_anon_1a0 = v66;
  *(float32x4_t *)&self->_anon_1a0[16] = v67;
  *(float32x4_t *)&self->_anon_1a0[32] = v69;
  *(float32x4_t *)&self->_anon_1a0[48] = v68;
  float32x2_t v70 = vcvt_f32_f64(*(float64x2_t *)&CGAffineTransformIdentity.a);
  float32x2_t v71 = vcvt_f32_f64(*(float64x2_t *)&CGAffineTransformIdentity.c);
  float32x2_t v72 = vcvt_f32_f64(*(float64x2_t *)&CGAffineTransformIdentity.tx);
  *(_DWORD *)&self->_anon_120[72] = 0;
  *(float32x2_t *)&self->_anon_120[64] = v70;
  *(_DWORD *)&self->_anon_120[88] = 0;
  *(float32x2_t *)&self->_anon_120[80] = v71;
  *(_DWORD *)&self->_anon_120[104] = 1065353216;
  *(float32x2_t *)&self->_anon_120[96] = v72;
  v73 = (float64x2_t *)&v85;
  if ([v4 direction] != (char *)&dword_C + 1 && objc_msgSend(v4, "direction") != (char *)&dword_C + 2) {
    v73 = (float64x2_t *)&v91;
  }
  memset(&v91, 0, sizeof(v91));
  CGAffineTransformMakeScale(&v91, -1.0, 1.0);
  CGAffineTransform v84 = v91;
  CGAffineTransformTranslate(&v85, &v84, -1.0, 0.0);
  CGAffineTransform v91 = v85;
  memset(&v85, 0, sizeof(v85));
  CGAffineTransformMakeScale(&v85, 1.0, -1.0);
  CGAffineTransform v83 = v85;
  CGAffineTransformTranslate(&v84, &v83, 0.0, -1.0);
  CGAffineTransform v85 = v84;
  float32x2_t v74 = vcvt_f32_f64(*v73);
  float32x2_t v75 = vcvt_f32_f64(v73[1]);
  float32x2_t v76 = vcvt_f32_f64(v73[2]);
  *(_DWORD *)&self->_anon_1a0[72] = 0;
  *(float32x2_t *)&self->_anon_1a0[64] = v74;
  *(_DWORD *)&self->_anon_1a0[88] = 0;
  *(float32x2_t *)&self->_anon_1a0[80] = v75;
  *(_DWORD *)&self->_anon_1a0[104] = 1065353216;
  *(float32x2_t *)&self->_anon_1a0[96] = v76;
  *(_DWORD *)&self->_anon_120[120] = 1065353216;
  *(_DWORD *)&self->_anon_1a0[120] = -1082130432;
  if ([v4 isMotionBlurred])
  {
    [(TSDMetalMotionBlurEffect *)self->_motionBlurMetalEffect velocityScale];
    v78.f64[1] = v77;
    *(float32x2_t *)&v78.f64[0] = vcvt_f32_f64(v78);
    *(float64_t *)&self->_anon_120[112] = v78.f64[0];
    *(float64_t *)&self->_anon_1a0[112] = v78.f64[0];
  }
}

- (void)animationWillBeginWithContext:(id)a3
{
}

- (void)p_drawFlopVertical:(BOOL)a3 encoder:(id)a4 metalTexture:(id)a5 oldMetalTexture:(id)a6 isUpdating:(BOOL)a7
{
  BOOL v7 = a7;
  colorMetalShader = self->_colorMetalShader;
  anon_1a0 = self->_anon_1a0;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  [(TSDMetalShader *)colorMetalShader setPipelineStateWithEncoder:v15 vertexBytes:anon_1a0];
  [v15 setCullMode:1];
  [v15 setFragmentTexture:v14 atIndex:0];

  [(TSDMTLDataBuffer *)self->_metalColorDataBuffer drawWithEncoder:v15 atIndex:0 advanceDynamicBuffer:0];
  [(TSDMetalShader *)self->_colorMetalShader setPipelineStateWithEncoder:v15 vertexBytes:self->_anon_120];
  [v15 setCullMode:2];
  [v15 setFragmentTexture:v13 atIndex:0];

  [(TSDMTLDataBuffer *)self->_metalColorDataBuffer drawWithEncoder:v15 atIndex:0 advanceDynamicBuffer:v7];
}

- (void)p_metalRenderFrameWithContext:(id)a3
{
  id v31 = a3;
  id v4 = [v31 metalContext];
  v5 = [v4 renderEncoder];
  if (!v5)
  {
    v6 = +[TSUAssertionHandler currentHandler];
    BOOL v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionFlop p_metalRenderFrameWithContext:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionFlop.m"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:742 description:@"invalid nil value for '%s'", "workingEncoder"];
  }
  id v9 = [v31 textures];
  id v10 = (char *)[v31 direction];
  [v31 percent];
  double v12 = v11;
  id v13 = [v9 lastObject];
  id v14 = [v31 metalContext];
  id v15 = [v13 metalTextureWithContext:v14];

  if ((unint64_t)[v9 count] < 2)
  {
    double v18 = 0;
    double v16 = 0;
  }
  else
  {
    double v16 = [v9 objectAtIndexedSubscript:0];
    double v17 = [v31 metalContext];
    double v18 = [v16 metalTextureWithContext:v17];

    if (v18 && v15)
    {
      [v31 percent];
      double v30 = v4;
      if (v19 == self->_lastUpdatePercent)
      {
        [v31 percent];
        BOOL v20 = v21 == 0.0;
      }
      else
      {
        BOOL v20 = 1;
      }
      [v31 percent];
      self->_lastUpdatePercent = v22;
      p_metalShadowDataBuffer = &self->_metalShadowDataBuffer;
      BOOL v29 = v20;
      [(KNTransitionFlop *)self updateFlopAndShadowMeshesWithTexture:v13 context:v31 flopBuffer:self->_metalColorDataBuffer shadowBuffer:self->_metalShadowDataBuffer isUpdating:v20];
      [(TSDMetalShader *)self->_quadMetalShader setPipelineStateWithEncoder:v5 vertexBytes:self->_anon_e0];
      if (v12 <= 0.7)
      {
        [v5 setFragmentTexture:v15 atIndex:0];
        [(TSDMTLDataBuffer *)self->_metalIncomingQuadDataBuffer drawWithEncoder:v5 atIndex:0];
        [v5 setVertexBytes:self->_anon_e0 length:64 atIndex:1];
        [v5 setFragmentTexture:v18 atIndex:0];
        [(TSDMTLDataBuffer *)self->_metalOutgoingQuadDataBuffer drawWithEncoder:v5 atIndex:0];
        [(TSDMetalShader *)self->_shadowMetalShader setPipelineStateWithEncoder:v5 vertexBytes:self->_anon_a0];
      }
      else
      {
        [v5 setFragmentTexture:v18 atIndex:0];
        [(TSDMTLDataBuffer *)self->_metalOutgoingQuadDataBuffer drawWithEncoder:v5 atIndex:0];
        [(TSDMetalShader *)self->_shadowMetalShader setPipelineStateWithEncoder:v5 vertexBytes:self->_anon_a0];
        [(TSDMTLDataBuffer *)*p_metalShadowDataBuffer drawWithEncoder:v5 atIndex:0];
        [(TSDMetalShader *)self->_quadMetalShader setPipelineStateWithEncoder:v5 vertexBytes:self->_anon_e0];
        [v5 setFragmentTexture:v15 atIndex:0];
        p_metalShadowDataBuffer = &self->_metalIncomingQuadDataBuffer;
      }
      [(TSDMTLDataBuffer *)*p_metalShadowDataBuffer drawWithEncoder:v5 atIndex:0];
      if ([v31 isMotionBlurred])
      {
        motionBlurMetalEffect = self->_motionBlurMetalEffect;
        double v25 = [v31 metalContext];
        uint64_t v26 = [(TSDMetalMotionBlurEffect *)motionBlurMetalEffect bindColorAndVelocityWithMetalContext:v25 shouldFillBackground:0];

        v5 = (void *)v26;
      }
      id v4 = v30;
      [(KNTransitionFlop *)self p_drawFlopVertical:(unint64_t)(v10 - 13) < 2 encoder:v5 metalTexture:v15 oldMetalTexture:v18 isUpdating:v29];
      if ([v31 isMotionBlurred])
      {
        double v27 = self->_motionBlurMetalEffect;
        double v28 = [v30 renderEncoder];
        [(TSDMetalMotionBlurEffect *)v27 drawResultWithWorkingRenderEncoder:v5 destinationRenderEncoder:v28];

        id v4 = v30;
      }
    }
  }
}

- (void)renderFrameWithContext:(id)a3
{
}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  if (a6 == 3 && a8 <= 0x174876E7FFLL && a7)
  {
    id v10 = [*a3 mutableCopy];
    double v11 = +[NSNumber numberWithUnsignedInteger:13];
    [v10 setObject:v11 forKey:@"direction"];

    id v12 = v10;
    *a3 = v12;
  }
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  if (a6 == 3 && a8 <= 0x174876E7FFLL && a7)
  {
    id v9 = [*a3 objectForKeyedSubscript:@"direction" a4, a5];

    if (v9)
    {
      id v10 = [*a3 objectForKeyedSubscript:@"direction"];
      double v11 = (char *)[v10 unsignedIntegerValue];

      if (v11 == (unsigned char *)&dword_C + 2)
      {
        id v12 = [*a3 mutableCopy];
        id v13 = +[NSNumber numberWithUnsignedInteger:13];
        [v12 setObject:v13 forKeyedSubscript:@"direction"];

        id v14 = v12;
        *a3 = v14;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalShadowDataBuffer, 0);
  objc_storeStrong((id *)&self->_shadowMetalShader, 0);
  objc_storeStrong((id *)&self->_metalColorDataBuffer, 0);
  objc_storeStrong((id *)&self->_colorMetalShader, 0);
  objc_storeStrong((id *)&self->_metalIncomingQuadDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalOutgoingQuadDataBuffer, 0);
  objc_storeStrong((id *)&self->_quadMetalShader, 0);
  objc_storeStrong((id *)&self->_motionBlurMetalEffect, 0);
  objc_storeStrong((id *)&self->_shadowBufferAttributes, 0);

  objc_storeStrong((id *)&self->_colorBufferAttributes, 0);
}

@end