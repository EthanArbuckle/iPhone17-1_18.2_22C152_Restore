@interface KNShimmerEffect
- (KNAnimationRandomGenerator)randomGenerator;
- (KNShimmerEffect)initWithAnimationContext:(id)a3 texture:(id)a4 destinationRect:(CGRect)a5 translate:(CATransform3D *)a6 duration:(double)a7 direction:(unint64_t)a8 buildType:(int)a9 metalContext:(id)a10 randomGenerator:(id)a11;
- (TSDTexturedRectangle)texture;
- (double)opacity;
- (id)objectSystemForTR:(id)a3 slideRect:(CGRect)a4 duration:(double)a5;
- (id)particleSystemForTR:(id)a3 slideRect:(CGRect)a4 duration:(double)a5;
- (unint64_t)p_numberOfParticlesForTR:(id)a3 slideRect:(CGRect)a4 duration:(double)a5;
- (void)p_renderEffectAtPercent:(double)a3 withContext:(id)a4;
- (void)renderEffectAtPercent:(double)a3;
- (void)renderEffectAtPercent:(double)a3 withContext:(id)a4;
- (void)setOpacity:(double)a3;
- (void)setRandomGenerator:(id)a3;
- (void)setTexture:(id)a3;
- (void)setupEffectIfNecessary;
- (void)setupMetalEffectIfNecessary;
- (void)teardown;
@end

@implementation KNShimmerEffect

- (void)setupEffectIfNecessary
{
  if (self->_metalContext) {
    [(KNShimmerEffect *)self setupMetalEffectIfNecessary];
  }
}

- (void)setupMetalEffectIfNecessary
{
  if (!self->_isSetup)
  {
    v3 = [(TSDMetalContext *)self->_metalContext device];
    v4 = KNBundle();
    v5 = [v4 pathForResource:@"KNBuildShimmer" ofType:@"png"];

    CFDataRef v6 = +[NSData dataWithContentsOfFile:v5];
    v7 = CGDataProviderCreateWithCFData(v6);

    v8 = CGImageCreateWithPNGDataProvider(v7, 0, 1, kCGRenderingIntentDefault);
    CGDataProviderRelease(v7);
    v9 = (TSDTexturedRectangle *)[objc_alloc((Class)TSDTexturedRectangle) initWithCGImage:v8];
    shimmerTexturedRect = self->_shimmerTexturedRect;
    self->_shimmerTexturedRect = v9;

    v11 = self->_shimmerTexturedRect;
    v12 = [(TSDMetalContext *)self->_metalContext device];
    [(TSDTexturedRectangle *)v11 setupMetalTextureForDevice:v12];

    CGImageRelease(v8);
    float32x4_t v39 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_translate.m11), *(float64x2_t *)&self->_translate.m13);
    float32x4_t v37 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_translate.m21), *(float64x2_t *)&self->_translate.m23);
    float32x4_t v35 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_translate.m31), *(float64x2_t *)&self->_translate.m33);
    float32x4_t v33 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_translate.m41), *(float64x2_t *)&self->_translate.m43);
    id v13 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
    [v13 setPixelFormat:[self->_metalContext pixelFormat]];
    [v13 setBlendingEnabled:1];
    [v13 setDestinationRGBBlendFactor:5];
    [v13 setDestinationAlphaBlendFactor:5];
    v14 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"buildShimmerObjectVertexShader" fragmentShader:@"buildShimmerFragmentShader" device:v3 library:@"KeynoteMetalLibrary" colorAttachment:v13];
    objectSystemMetalShader = self->_objectSystemMetalShader;
    self->_objectSystemMetalShader = v14;

    texture = self->_texture;
    [(KNAnimationContext *)self->_animationContext slideRect];
    -[KNShimmerEffect objectSystemForTR:slideRect:duration:](self, "objectSystemForTR:slideRect:duration:", texture);
    v17 = (KNShimmerObjectSystem *)objc_claimAutoreleasedReturnValue();
    objectSystem = self->_objectSystem;
    self->_objectSystem = v17;

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    float32x4_t v62 = 0u;
    long long v63 = 0u;
    float32x4_t v60 = 0u;
    float32x4_t v61 = 0u;
    float32x4_t v59 = 0u;
    v19 = self->_objectSystem;
    if (v19)
    {
      [(KNShimmerObjectSystem *)v19 vertexUniforms];
      v19 = self->_objectSystem;
    }
    else
    {
      long long v66 = 0uLL;
      long long v67 = 0uLL;
      long long v64 = 0uLL;
      long long v65 = 0uLL;
      long long v63 = 0uLL;
    }
    float32x4_t v59 = v39;
    float32x4_t v60 = v37;
    float32x4_t v61 = v35;
    float32x4_t v62 = v33;
    v58[6] = v65;
    v58[7] = v66;
    v58[8] = v67;
    v58[4] = v63;
    v58[5] = v64;
    v58[2] = v35;
    v58[3] = v33;
    v58[0] = v39;
    v58[1] = v37;
    -[KNShimmerObjectSystem setVertexUniforms:](v19, "setVertexUniforms:", v58, *(_OWORD *)&v33, *(_OWORD *)&v35, *(_OWORD *)&v37, *(_OWORD *)&v39);
    if ([(KNShimmerObjectSystem *)self->_objectSystem shouldDraw])
    {
      v20 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"buildShimmerParticleVertexShader" fragmentShader:@"buildShimmerFragmentShader" device:v3 library:@"KeynoteMetalLibrary" colorAttachment:v13];
      particleSystemMetalShader = self->_particleSystemMetalShader;
      self->_particleSystemMetalShader = v20;

      v22 = self->_texture;
      [(KNAnimationContext *)self->_animationContext slideRect];
      -[KNShimmerEffect particleSystemForTR:slideRect:duration:](self, "particleSystemForTR:slideRect:duration:", v22);
      v23 = (KNShimmerParticleSystem *)objc_claimAutoreleasedReturnValue();
      particleSystem = self->_particleSystem;
      self->_particleSystem = v23;

      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v25 = self->_particleSystem;
      if (v25)
      {
        [(KNShimmerParticleSystem *)v25 vertexUniforms];
        v25 = self->_particleSystem;
      }
      else
      {
        long long v56 = 0uLL;
        long long v57 = 0uLL;
        long long v54 = 0uLL;
        long long v55 = 0uLL;
        long long v52 = 0uLL;
        long long v53 = 0uLL;
        long long v50 = 0uLL;
        long long v51 = 0uLL;
        long long v48 = 0uLL;
        long long v49 = 0uLL;
        long long v46 = 0uLL;
        long long v47 = 0uLL;
      }
      long long v42 = v40;
      long long v43 = v38;
      long long v44 = v36;
      long long v45 = v34;
      BYTE4(v50) = 0;
      v41[12] = v54;
      v41[13] = v55;
      v41[14] = v56;
      v41[15] = v57;
      v41[10] = v52;
      v41[11] = v53;
      v41[4] = v46;
      v41[5] = v47;
      v41[6] = v48;
      v41[7] = v49;
      v41[8] = v50;
      v41[9] = v51;
      v41[0] = v40;
      v41[1] = v38;
      v41[2] = v36;
      v41[3] = v34;
      [(KNShimmerParticleSystem *)v25 setVertexUniforms:v41];
    }
    v26 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initDefaultTextureAndOpacityShaderWithDevice:v3 colorAttachment:v13];
    objectMetalShader = self->_objectMetalShader;
    self->_objectMetalShader = v26;

    float32x4_t v28 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m21), *(float64x2_t *)&self->_baseTransform.m23);
    float32x4_t v29 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m31), *(float64x2_t *)&self->_baseTransform.m33);
    float32x4_t v30 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m41), *(float64x2_t *)&self->_baseTransform.m43);
    *(float32x4_t *)self->_anon_190 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m11), *(float64x2_t *)&self->_baseTransform.m13);
    *(float32x4_t *)&self->_anon_190[16] = v28;
    *(float32x4_t *)&self->_anon_190[32] = v29;
    *(float32x4_t *)&self->_anon_190[48] = v30;
    [(TSDTexturedRectangle *)self->_texture frame];
    v31 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:v3 textureRect:CGPointZero.x device:CGPointZero.y];
    objectMTLDataBuffer = self->_objectMTLDataBuffer;
    self->_objectMTLDataBuffer = v31;

    self->_isSetup = 1;
  }
}

- (unint64_t)p_numberOfParticlesForTR:(id)a3 slideRect:(CGRect)a4 duration:(double)a5
{
  double width = self->_destinationRect.size.width;
  double height = self->_destinationRect.size.height;
  double v7 = width / a4.size.width * height / a4.size.height;
  id v8 = a3;
  [v8 size];
  double v10 = v9 / width;
  [v8 size];
  double v12 = v11;

  return (unint64_t)fmin(v7 * (v10 * v12 / height) * 2000.0, 3276.0);
}

- (id)objectSystemForTR:(id)a3 slideRect:(CGRect)a4 duration:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  unint64_t v12 = -[KNShimmerEffect p_numberOfParticlesForTR:slideRect:duration:](self, "p_numberOfParticlesForTR:slideRect:duration:", v11, x, y, width, height, a5);
  if (self->_metalContext)
  {
    unint64_t v13 = v12;
    [v11 size];
    double v15 = v14;
    double v17 = v16;
    unint64_t direction = self->_direction;
    v19 = [(KNShimmerEffect *)self randomGenerator];
    id v20 = +[KNShimmerObjectSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNShimmerObjectSystem, "newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", v13, direction, v19, self->_objectSystemMetalShader, self->_metalContext, v15, v17, width, height, a5);
  }
  else
  {
    id v20 = 0;
  }
  v21 = [(KNAnimationContext *)self->_animationContext capabilities];
  [v20 setupWithTexture:v11 particleTextureSize:CGSizeZero reverseDrawOrder:v21 capabilities:CGSizeZero.width, CGSizeZero.height];

  return v20;
}

- (id)particleSystemForTR:(id)a3 slideRect:(CGRect)a4 duration:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  unint64_t v12 = -[KNShimmerEffect p_numberOfParticlesForTR:slideRect:duration:](self, "p_numberOfParticlesForTR:slideRect:duration:", v11, x, y, width, height, a5);
  id v13 = [(KNShimmerObjectSystem *)self->_objectSystem visibleParticleCount];
  if (self->_metalContext)
  {
    unint64_t v14 = v12 / 0x28;
    if (v12 / 0x28 <= 2) {
      unint64_t v14 = 2;
    }
    unint64_t v15 = v14 + 2 * (void)v13;
    if (v15 >= 0xCCC) {
      unint64_t v16 = 3276;
    }
    else {
      unint64_t v16 = v15;
    }
    [(KNShimmerObjectSystem *)self->_objectSystem particleSize];
    double v18 = v17;
    double v20 = v19;
    double v21 = (double)v16;
    [v11 size];
    double v23 = v22;
    double v25 = v24;
    v26 = [(KNShimmerEffect *)self randomGenerator];
    id v27 = +[KNShimmerParticleSystem newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNShimmerParticleSystem, "newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", 0, v26, self->_particleSystemMetalShader, self->_metalContext, v18, v20, v21, 1.0, v23, v25, width, height, *(void *)&a5);
  }
  else
  {
    id v27 = 0;
  }
  objectSystem = self->_objectSystem;
  if (!objectSystem)
  {
    float32x4_t v29 = +[TSUAssertionHandler currentHandler];
    float32x4_t v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNShimmerEffect particleSystemForTR:slideRect:duration:]");
    v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildShimmer.m"];
    [v29 handleFailureInFunction:v30 file:v31 lineNumber:392 description:@"Need to set up object system first!"];

    objectSystem = self->_objectSystem;
  }
  [v27 setObjectSystem:objectSystem];
  v32 = [(KNShimmerObjectSystem *)self->_objectSystem dataBuffer];
  float32x4_t v33 = [v32 vertexAttributeNamed:kTSDGPUShaderAttributeColor];
  [v27 setObjectDataBufferAttributeColor:v33];

  long long v34 = [(KNShimmerObjectSystem *)self->_objectSystem dataBuffer];
  float32x4_t v35 = [v34 vertexAttributeNamed:kTSDGPUShaderAttributePosition];
  [v27 setObjectDataBufferAttributePosition:v35];

  long long v36 = [(KNShimmerObjectSystem *)self->_objectSystem dataBuffer];
  float32x4_t v37 = [v36 vertexAttributeNamed:kTSDGPUShaderAttributeSpeed];
  [v27 setObjectDataBufferAttributeSpeed:v37];

  long long v38 = [(KNShimmerObjectSystem *)self->_objectSystem dataBuffer];
  float32x4_t v39 = [v38 vertexAttributeNamed:kTSDGPUShaderAttributeColorTexCoord];
  [v27 setObjectDataBufferAttributeColorTexCoord:v39];

  shimmerTexturedRect = self->_shimmerTexturedRect;
  if (shimmerTexturedRect)
  {
    [(TSDTexturedRectangle *)shimmerTexturedRect size];
  }
  else
  {
    double v41 = CGSizeZero.width;
    double v42 = CGSizeZero.height;
  }
  if (self->_metalContext) {
    id v43 = v11;
  }
  else {
    id v43 = 0;
  }
  [v27 setupWithTexture:v43 particleTextureSize:0 reverseDrawOrder:v41, v42];

  return v27;
}

- (KNShimmerEffect)initWithAnimationContext:(id)a3 texture:(id)a4 destinationRect:(CGRect)a5 translate:(CATransform3D *)a6 duration:(double)a7 direction:(unint64_t)a8 buildType:(int)a9 metalContext:(id)a10 randomGenerator:(id)a11
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v41 = a3;
  double v23 = (TSDTexturedRectangle *)a4;
  id v24 = a10;
  id v25 = a11;
  v42.receiver = self;
  v42.super_class = (Class)KNShimmerEffect;
  v26 = [(KNShimmerEffect *)&v42 init];
  id v27 = v26;
  if (v26)
  {
    v26->_texture = v23;
    v26->_destinationRect.origin.CGFloat x = x;
    v26->_destinationRect.origin.CGFloat y = y;
    v26->_destinationRect.size.CGFloat width = width;
    v26->_destinationRect.size.CGFloat height = height;
    v26->_duration = a7;
    v26->_unint64_t direction = a8;
    v26->_buildType = a9;
    long long v28 = *(_OWORD *)&a6->m11;
    long long v29 = *(_OWORD *)&a6->m13;
    long long v30 = *(_OWORD *)&a6->m23;
    *(_OWORD *)&v26->_translate.m21 = *(_OWORD *)&a6->m21;
    *(_OWORD *)&v26->_translate.m23 = v30;
    *(_OWORD *)&v26->_translate.m11 = v28;
    *(_OWORD *)&v26->_translate.m13 = v29;
    long long v31 = *(_OWORD *)&a6->m31;
    long long v32 = *(_OWORD *)&a6->m33;
    long long v33 = *(_OWORD *)&a6->m43;
    *(_OWORD *)&v26->_translate.m41 = *(_OWORD *)&a6->m41;
    *(_OWORD *)&v26->_translate.m43 = v33;
    *(_OWORD *)&v26->_translate.m31 = v31;
    *(_OWORD *)&v26->_translate.m33 = v32;
    objc_storeStrong((id *)&v26->_animationContext, a3);
    if (!v24)
    {
      long long v34 = +[TSUAssertionHandler currentHandler];
      float32x4_t v35 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNShimmerEffect initWithAnimationContext:texture:destinationRect:translate:duration:direction:buildType:metalContext:randomGenerator:]");
      long long v36 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildShimmer.m"];
      [v34 handleFailureInFunction:v35 file:v36 lineNumber:429 description:@"invalid nil value for '%s'", "metalContext", v41];
    }
    objc_storeStrong((id *)&v27->_metalContext, a10);
    if (!v25)
    {
      float32x4_t v37 = +[TSUAssertionHandler currentHandler];
      long long v38 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNShimmerEffect initWithAnimationContext:texture:destinationRect:translate:duration:direction:buildType:metalContext:randomGenerator:]");
      float32x4_t v39 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildShimmer.m"];
      [v37 handleFailureInFunction:v38 file:v39 lineNumber:431 description:@"invalid nil value for '%s'", "randomGenerator"];
    }
    objc_storeStrong((id *)&v27->_randomGenerator, a11);
    [(KNShimmerEffect *)v27 setupMetalEffectIfNecessary];
  }

  return v27;
}

- (void)renderEffectAtPercent:(double)a3
{
}

- (void)renderEffectAtPercent:(double)a3 withContext:(id)a4
{
}

- (void)p_renderEffectAtPercent:(double)a3 withContext:(id)a4
{
  id v22 = a4;
  CFDataRef v6 = self->_texture;
  int buildType = self->_buildType;
  if (buildType == 2) {
    double v8 = 1.0 - a3;
  }
  else {
    double v8 = a3;
  }
  TSUReverseSquare();
  if (buildType == 1) {
    double v10 = (v8 + v9 * self->_duration) * 1.57079633;
  }
  else {
    double v10 = -((v8 + v9 * self->_duration) * 1.57079633);
  }
  TSUClamp();
  TSUSineMap();
  double v12 = v11;
  [(TSDTexturedRectangle *)v6 singleTextureOpacity];
  if (v22)
  {
    double v14 = v13;
    unint64_t v15 = -[TSDTexturedRectangle metalTextureWithContext:](v6, "metalTextureWithContext:");
    if (v15)
    {
      double v16 = (1.0 - v8) * (1.0 - v8);
      double v17 = [v22 renderEncoder];
      [(TSDMetalShader *)self->_objectMetalShader setPipelineStateWithEncoder:v17 vertexBytes:self->_anon_190 fragmentBytes:&self->_objectFragmentUniforms];
      [v17 setFragmentTexture:v15 atIndex:0];
      [(TSDMTLDataBuffer *)self->_objectMTLDataBuffer drawWithEncoder:v17 atIndex:0];
      [(TSDMetalShader *)self->_objectSystemMetalShader setPipelineStateWithEncoder:v17];
      [(KNShimmerObjectSystem *)self->_objectSystem drawWithPercent:buildType == 1 opacity:0 rotation:v22 clockwise:v16 texture:v12 * v14 context:v10];
      if ([(KNShimmerObjectSystem *)self->_objectSystem shouldDraw])
      {
        BOOL v18 = buildType == 1;
        [(TSDMetalShader *)self->_particleSystemMetalShader setPipelineStateWithEncoder:v17];
        double v19 = [(TSDTexturedRectangle *)self->_shimmerTexturedRect metalTexture];
        [v17 setFragmentTexture:v19 atIndex:0];

        particleSystem = self->_particleSystem;
        [(TSDTexturedRectangle *)v6 singleTextureOpacity];
        [(KNShimmerParticleSystem *)particleSystem drawWithPercent:v18 opacity:self->_texture rotation:v22 clockwise:v16 texture:v21 * 0.5 context:v10];
      }
    }
  }
}

- (void)teardown
{
  self->_isSetup = 0;
  objectSystem = self->_objectSystem;
  self->_objectSystem = 0;

  particleSystem = self->_particleSystem;
  self->_particleSystem = 0;

  objectMetalShader = self->_objectMetalShader;
  self->_objectMetalShader = 0;

  objectMTLDataBuffer = self->_objectMTLDataBuffer;
  self->_objectMTLDataBuffer = 0;

  objectSystemMetalShader = self->_objectSystemMetalShader;
  self->_objectSystemMetalShader = 0;

  particleSystemMetalShader = self->_particleSystemMetalShader;
  self->_particleSystemMetalShader = 0;

  [(TSDTexturedRectangle *)self->_shimmerTexturedRect teardown];
  shimmerTexturedRect = self->_shimmerTexturedRect;
  self->_shimmerTexturedRect = 0;
}

- (KNAnimationRandomGenerator)randomGenerator
{
  randomGenerator = self->_randomGenerator;
  if (!randomGenerator)
  {
    v4 = +[TSUAssertionHandler currentHandler];
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNShimmerEffect randomGenerator]");
    CFDataRef v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildShimmer.m"];
    [v4 handleFailureInFunction:v5 file:v6 lineNumber:511 description:@"invalid nil value for '%s'", "_randomGenerator"];

    randomGenerator = self->_randomGenerator;
  }

  return randomGenerator;
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

- (void)setRandomGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomGenerator, 0);
  objc_storeStrong((id *)&self->_objectMTLDataBuffer, 0);
  objc_storeStrong((id *)&self->_objectMetalShader, 0);
  objc_storeStrong((id *)&self->_particleSystemMetalShader, 0);
  objc_storeStrong((id *)&self->_objectSystemMetalShader, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_animationContext, 0);
  objc_storeStrong((id *)&self->_shimmerTexturedRect, 0);
  objc_storeStrong((id *)&self->_particleSystem, 0);

  objc_storeStrong((id *)&self->_objectSystem, 0);
}

@end