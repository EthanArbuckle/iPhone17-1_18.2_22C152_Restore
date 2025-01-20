@interface KNSparkleEffect
- (KNAnimationRandomGenerator)randomGenerator;
- (KNSparkleEffect)initWithAnimationContext:(id)a3 texture:(id)a4 destinationRect:(CGRect)a5 translate:(CATransform3D *)a6 duration:(double)a7 direction:(unint64_t)a8 buildType:(int)a9 metalContext:(id)a10 randomGenerator:(id)a11;
- (TSDTexturedRectangle)texture;
- (double)opacity;
- (id)p_sparkleSystemForTR:(id)a3 slideRect:(CGRect)a4 duration:(double)a5 direction:(unint64_t)a6 randomGenerator:(id)a7;
- (void)p_renderEffectAtPercent:(double)a3 withContext:(id)a4;
- (void)renderEffectAtPercent:(double)a3;
- (void)renderEffectAtPercent:(double)a3 withContext:(id)a4;
- (void)setOpacity:(double)a3;
- (void)setRandomGenerator:(id)a3;
- (void)setTexture:(id)a3;
- (void)setupEffectIfNecessary;
- (void)teardown;
@end

@implementation KNSparkleEffect

- (void)setupEffectIfNecessary
{
  if (!self->_isSetup)
  {
    id v3 = [KNBundle() pathForResource:@"KNBuildSparkle" ofType:@"png"];
    metalContext = self->_metalContext;
    if (metalContext)
    {
      id v5 = [(TSDMetalContext *)metalContext device];
      v6 = CGDataProviderCreateWithCFData((CFDataRef)+[NSData dataWithContentsOfFile:v3]);
      v7 = CGImageCreateWithPNGDataProvider(v6, 0, 1, kCGRenderingIntentDefault);
      CGDataProviderRelease(v6);
      v8 = (TSDTexturedRectangle *)[objc_alloc((Class)TSDTexturedRectangle) initWithCGImage:v7];
      self->_sparkleTexturedRect = v8;
      [(TSDTexturedRectangle *)v8 setupMetalTextureForDevice:v5];
      CGImageRelease(v7);
      id v9 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
      [v9 setPixelFormat:[self->_metalContext pixelFormat]];
      [v9 setBlendingEnabled:1];
      [v9 setDestinationRGBBlendFactor:5];
      [v9 setDestinationAlphaBlendFactor:5];
      self->_objectMTLShader = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initDefaultTextureAndOpacityShaderWithDevice:v5 colorAttachment:v9];
      self->_sparkleMTLShader = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"buildSparkleVertexShader" fragmentShader:@"buildSparkleFragmentShader" device:v5 library:@"KeynoteMetalLibrary" colorAttachment:v9];
      texture = self->_texture;
      [(KNAnimationContext *)self->_animationContext slideRect];
      self->_sparkleSystem = (KNBuildSparkleSystem *)-[KNSparkleEffect p_sparkleSystemForTR:slideRect:duration:direction:randomGenerator:](self, "p_sparkleSystemForTR:slideRect:duration:direction:randomGenerator:", texture, self->_direction, [(KNSparkleEffect *)self randomGenerator], v11, v12, v13, v14, self->_duration);
    }
    v15 = +[TSDGPUDataBufferAttribute attributeWithName:kTSDGPUShaderAttributePosition bufferUsage:35040 dataType:5 normalized:0 componentCount:2];
    v16 = +[TSDGPUDataBufferAttribute attributeWithName:kTSDGPUShaderAttributeTexCoord bufferUsage:35040 dataType:5 normalized:0 componentCount:2];
    v21[0] = v15;
    v21[1] = v16;
    v17 = +[NSArray arrayWithObjects:v21 count:2];
    self->_objectBufferAttributes = v17;
    self->_objectPositionAttributeIndex = [(NSArray *)v17 indexOfObject:v15];
    self->_objectTexCoordAttributeIndex = [(NSArray *)self->_objectBufferAttributes indexOfObject:v16];
    v18 = self->_metalContext;
    if (v18)
    {
      objectBufferAttributes = self->_objectBufferAttributes;
      id v20 = [(TSDMetalContext *)v18 device];
      self->_objectMTLDataBuffer = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:meshSize:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:meshSize:device:", objectBufferAttributes, v20, TSDGPUDataBufferMeshSizeDefault[0], TSDGPUDataBufferMeshSizeDefault[1]);
    }
    self->_isSetup = 1;
  }
}

- (id)p_sparkleSystemForTR:(id)a3 slideRect:(CGRect)a4 duration:(double)a5 direction:(unint64_t)a6 randomGenerator:(id)a7
{
  if (!self->_metalContext) {
    return 0;
  }
  double height = a4.size.height;
  double width = a4.size.width;
  double v14 = self->_destinationRect.size.width;
  double v15 = self->_destinationRect.size.height;
  if (v14 >= a4.size.width) {
    double v14 = a4.size.width;
  }
  double v16 = v14 / a4.size.width;
  if (v15 >= a4.size.height) {
    double v15 = a4.size.height;
  }
  double v17 = (2.0 - sqrt(v16 * v15 / a4.size.height)) * 0.5 * 1500.0 * a5;
  [(TSDTexturedRectangle *)self->_sparkleTexturedRect size];
  double v19 = v18;
  double v21 = v20;
  [a3 size];
  id v24 = +[KNBuildSparkleSystem newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildSparkleSystem, "newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", a6, a7, self->_sparkleMTLShader, self->_metalContext, v19, v21, (double)(unint64_t)v17, 1.0, v22, v23, width, height, *(void *)&a5);
  [(TSDTexturedRectangle *)self->_sparkleTexturedRect size];
  [v24 setupWithTexture:0 particleTextureSize:0 reverseDrawOrder:0];
  return v24;
}

- (KNSparkleEffect)initWithAnimationContext:(id)a3 texture:(id)a4 destinationRect:(CGRect)a5 translate:(CATransform3D *)a6 duration:(double)a7 direction:(unint64_t)a8 buildType:(int)a9 metalContext:(id)a10 randomGenerator:(id)a11
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v31.receiver = self;
  v31.super_class = (Class)KNSparkleEffect;
  double v22 = [(KNSparkleEffect *)&v31 init];
  double v23 = v22;
  if (v22)
  {
    v22->_texture = (TSDTexturedRectangle *)a4;
    v22->_destinationRect.origin.CGFloat x = x;
    v22->_destinationRect.origin.CGFloat y = y;
    v22->_destinationRect.size.CGFloat width = width;
    v22->_destinationRect.size.CGFloat height = height;
    v22->_duration = a7;
    v22->_direction = a8;
    v22->_buildType = a9;
    long long v24 = *(_OWORD *)&a6->m11;
    long long v25 = *(_OWORD *)&a6->m13;
    long long v26 = *(_OWORD *)&a6->m23;
    *(_OWORD *)&v22->_translate.m21 = *(_OWORD *)&a6->m21;
    *(_OWORD *)&v22->_translate.m23 = v26;
    *(_OWORD *)&v22->_translate.m11 = v24;
    *(_OWORD *)&v22->_translate.m13 = v25;
    long long v27 = *(_OWORD *)&a6->m31;
    long long v28 = *(_OWORD *)&a6->m33;
    long long v29 = *(_OWORD *)&a6->m43;
    *(_OWORD *)&v22->_translate.m41 = *(_OWORD *)&a6->m41;
    *(_OWORD *)&v22->_translate.m43 = v29;
    *(_OWORD *)&v22->_translate.m31 = v27;
    *(_OWORD *)&v22->_translate.m33 = v28;
    v22->_animationContext = (KNAnimationContext *)a3;
    if (!a10) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:@"-[KNSparkleEffect initWithAnimationContext:texture:destinationRect:translate:duration:direction:buildType:metalContext:randomGenerator:]"] file:+[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildSparkle.m"] lineNumber:371 description:@"invalid nil value for '%s'", "metalContext"];
    }
    v23->_metalContext = (TSDMetalContext *)a10;
    if (!a11) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:@"-[KNSparkleEffect initWithAnimationContext:texture:destinationRect:translate:duration:direction:buildType:metalContext:randomGenerator:]"] file:[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildSparkle.m"] lineNumber:373 description:@"invalid nil value for '%s'", "randomGenerator"];
    }
    v23->_randomGenerator = (KNAnimationRandomGenerator *)a11;
    [(KNSparkleEffect *)v23 setupEffectIfNecessary];
  }
  return v23;
}

- (void)renderEffectAtPercent:(double)a3
{
}

- (void)renderEffectAtPercent:(double)a3 withContext:(id)a4
{
}

- (void)p_renderEffectAtPercent:(double)a3 withContext:(id)a4
{
  texture = self->_texture;
  unint64_t direction = self->_direction;
  unint64_t v9 = direction & 0xFFFFFFFFFFFFFFFELL;
  unint64_t v10 = direction - 11;
  float64x2_t v47 = *(float64x2_t *)&self->_translate.m11;
  float64x2_t v48 = *(float64x2_t *)&self->_translate.m21;
  float64x2_t v52 = *(float64x2_t *)&self->_translate.m23;
  float64x2_t v53 = *(float64x2_t *)&self->_translate.m33;
  float64x2_t v49 = *(float64x2_t *)&self->_translate.m31;
  float64x2_t v50 = *(float64x2_t *)&self->_translate.m13;
  float64x2_t v55 = *(float64x2_t *)&self->_translate.m43;
  float64x2_t v51 = *(float64x2_t *)&self->_translate.m41;
  [(TSDTexturedRectangle *)texture singleTextureOpacity];
  double v54 = v11;
  [(TSDTexturedRectangle *)texture size];
  double v13 = v12;
  [(TSDTexturedRectangle *)texture size];
  double v15 = v14;
  double v56 = a3;
  int buildType = self->_buildType;
  double v17 = 0.0;
  TSUClamp();
  if (buildType == 2)
  {
    if (v9 != 12 && v10 >= 2) {
      double v20 = v15;
    }
    else {
      double v20 = 0.0;
    }
    if (v10 <= 1)
    {
      if (v9 != 12)
      {
        double v26 = 0.0;
        double v17 = 1.0;
        double v22 = v13 * v18;
        TSUClamp();
        double v24 = v30;
        double v21 = 1.0;
        double v20 = 0.0;
        goto LABEL_31;
      }
      double v21 = 1.0;
      double v22 = v13 - v13 * v18;
      TSUClamp();
      double v24 = 1.0 - v23;
      goto LABEL_25;
    }
    if (v9 == 12)
    {
      double v15 = v15 - v15 * v18;
      double v24 = 1.0;
      TSUClamp();
      double v21 = 1.0 - v28;
LABEL_28:
      double v26 = 0.0;
      double v22 = v13;
      goto LABEL_29;
    }
    double v15 = v15 * v18;
    double v26 = 1.0;
    TSUClamp();
    double v21 = v32;
    double v24 = 1.0;
    double v22 = v13;
  }
  else
  {
    if (v9 == 12 && v10 < 2) {
      double v17 = v13;
    }
    if (v10 <= 1)
    {
      if (v9 == 12)
      {
        double v26 = 0.0;
        double v22 = v13 - v13 * v18;
        TSUClamp();
        double v24 = 1.0 - v27;
        double v21 = 1.0;
        double v20 = 0.0;
        double v13 = v17;
        double v17 = 1.0;
        goto LABEL_31;
      }
      double v17 = 0.0;
      double v21 = 1.0;
      double v22 = v13 * v18;
      TSUClamp();
      double v24 = v31;
LABEL_25:
      double v26 = 0.0;
LABEL_29:
      double v20 = 0.0;
      goto LABEL_30;
    }
    if (v9 != 12)
    {
      double v15 = v15 * v18;
      double v17 = 0.0;
      double v24 = 1.0;
      TSUClamp();
      double v21 = v33;
      goto LABEL_28;
    }
    double v46 = v15 - v15 * v18;
    double v17 = 0.0;
    double v26 = 1.0;
    TSUClamp();
    double v21 = 1.0 - v29;
    double v24 = 1.0;
    double v22 = v13;
    double v20 = v15;
    double v15 = v46;
  }
LABEL_30:
  double v13 = 0.0;
LABEL_31:
  id v34 = [a4 currentBuffer];
  id v35 = [a4 renderEncoder];
  v36 = (_OWORD *)((char *)self + 64 * (void)v34);
  float32x4_t v37 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v47), v50);
  float32x4_t v38 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v48), v52);
  float32x4_t v39 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v49), v53);
  float32x4_t v40 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v51), v55);
  v36[20] = v37;
  v36[21] = v38;
  v36[22] = v39;
  v36[23] = v40;
  float v41 = v54;
  v42 = (float *)((char *)self + 4 * (void)v34);
  v42[128] = v41;
  *(float32x4_t *)&self->_sparkleVertexInput.Percent = v37;
  *(float32x4_t *)&self->_anon_ec[4] = v38;
  *(float32x4_t *)&self->_anon_ec[20] = v39;
  *(float32x4_t *)&self->_anon_ec[36] = v40;
  v37.f32[0] = v56;
  *(_DWORD *)&self->_anon_ec[52] = v37.i32[0];
  *(float *)&self->_anon_ec[56] = v41;
  [(KNBuildSparkleSystem *)self->_sparkleSystem speedMax];
  *(float *)&double v43 = v43;
  *(_DWORD *)&self->_anon_ec[60] = LODWORD(v43);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_1A788C;
  v57[3] = &unk_45A6C0;
  long long v58 = *(_OWORD *)&self->_objectPositionAttributeIndex;
  double v59 = v13;
  double v60 = v20;
  double v61 = v22;
  double v62 = v15;
  double v63 = v17;
  double v64 = v26;
  double v65 = v24;
  double v66 = v21;
  [(TSDMTLDataBuffer *)self->_objectMTLDataBuffer updateMetalDataBufferAttributes:self->_objectBufferAttributes withBlock:v57];
  id v44 = [(TSDTexturedRectangle *)texture metalTextureWithContext:a4];
  if (v44)
  {
    id v45 = v44;
    [v35 setFragmentTexture:0 atIndex:1];
    [(TSDMetalShader *)self->_objectMTLShader setPipelineStateWithEncoder:v35 vertexBytes:v36 + 20 fragmentBytes:v42 + 128];
    [v35 setFragmentTexture:v45 atIndex:0];
    [(TSDMTLDataBuffer *)self->_objectMTLDataBuffer drawWithEncoder:v35 atIndex:0];
    [(TSDMetalShader *)self->_sparkleMTLShader setPipelineStateWithEncoder:v35 vertexBytes:&self->_sparkleVertexInput];
    [v35 setFragmentTexture:[self->_sparkleTexturedRect metalTexture] atIndex:0];
    [(KNBuildSparkleSystem *)self->_sparkleSystem drawMetalWithEncoder:v35];
    self->_objectBufferAttributes = (NSArray *)[(NSArray *)self->_objectBufferAttributes copy];
  }
}

- (void)teardown
{
  self->_objectBufferAttributes = 0;
  self->_sparkleSystem = 0;
  self->_sparkleMTLShader = 0;
  self->_objectMTLShader = 0;
  self->_objectMTLDataBuffer = 0;
  self->_isSetup = 0;
  [(TSDTexturedRectangle *)self->_sparkleTexturedRect teardown];
  self->_sparkleTexturedRect = 0;
  self->_effect = 0;
}

- (TSDTexturedRectangle)texture
{
  return self->_texture;
}

- (void)setTexture:(id)a3
{
  self->_texture = (TSDTexturedRectangle *)a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacitCGFloat y = a3;
}

- (KNAnimationRandomGenerator)randomGenerator
{
  return self->_randomGenerator;
}

- (void)setRandomGenerator:(id)a3
{
}

@end