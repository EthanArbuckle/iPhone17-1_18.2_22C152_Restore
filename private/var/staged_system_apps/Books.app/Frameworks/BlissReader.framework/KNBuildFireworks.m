@interface KNBuildFireworks
+ (BOOL)requiresSingleTexturePerStage;
+ (id)animationFilter;
+ (id)animationName;
+ (id)defaultAttributes;
+ (id)supportedTypes;
+ (id)thumbnailImageNameForType:(int)a3;
+ (int)animationCategory;
+ (unint64_t)directionType;
+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8;
- (CGRect)frameOfEffectWithContext:(id)a3;
- (KNBuildFireworks)initWithAnimationContext:(id)a3;
- (id)p_fireworksSystemsForTR:(id)a3 build:(id)a4 context:(id)a5;
- (id)p_particleTexturedRectWithPath:(id)a3;
- (void)animationDidEndWithContext:(id)a3;
- (void)metalAnimationDidEndWithContext:(id)a3;
- (void)metalAnimationWillBeginWithContext:(id)a3;
- (void)metalPrepareAnimationWithContext:(id)a3;
- (void)metalRenderFrameWithContext:(id)a3;
- (void)metalTeardownAnimationsWithContext:(id)a3;
- (void)p_drawObject:(id)a3 percent:(double)a4 encoder:(id)a5;
- (void)p_drawParticleSystemsWithPercent:(double)a3 sparkles:(BOOL)a4 particleSystemOpacity:(double)a5 context:(id)a6 renderEncoder:(id)a7;
- (void)p_setupParticleTexturedRectsWithMetalContext:(id)a3;
- (void)p_setupShadersWithMetalContext:(id)a3;
- (void)renderFrameWithContext:(id)a3;
- (void)teardown;
@end

@implementation KNBuildFireworks

+ (id)animationName
{
  return @"com.apple.iWork.Keynote.KNFireworks";
}

+ (int)animationCategory
{
  return 203;
}

+ (id)animationFilter
{
  return kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return &off_499968;
}

+ (unint64_t)directionType
{
  return 8;
}

+ (id)defaultAttributes
{
  CFStringRef v4 = @"KNBuildAttributesDuration";
  v5 = &off_499210;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"anim-icons-builds-fireworks";
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  if (a7) {
    *a4 = @"apple:dissolve";
  }
}

- (KNBuildFireworks)initWithAnimationContext:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)KNBuildFireworks;
  v3 = [(KNAnimationEffect *)&v9 initWithAnimationContext:a3];
  if (v3)
  {
    CFStringRef v4 = KNBundle();
    v5 = [v4 pathForResource:@"Fireworks" ofType:@"parameterGroup"];

    uint64_t v6 = +[KNAnimParameterGroup parameterGroupForFile:v5];
    parameterGroup = v3->_parameterGroup;
    v3->_parameterGroup = (KNAnimParameterGroup *)v6;
  }
  return v3;
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  [a3 drawableFrame];
  self->_drawableFrame.origin.x = v4;
  self->_drawableFrame.origin.y = v5;
  self->_drawableFrame.size.width = v6;
  self->_drawableFrame.size.height = v7;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  self->_frameRect.origin.x = v8;
  self->_frameRect.origin.y = v9;
  self->_frameRect.size.width = v10;
  self->_frameRect.size.height = v11;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (id)p_fireworksSystemsForTR:(id)a3 build:(id)a4 context:(id)a5
{
  id v62 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [v9 randomGenerator];
  [v8 duration];
  double v12 = v11;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"FireworksCount"];
  double v14 = v12 * v13;
  if ((unint64_t)v14 <= 2) {
    unint64_t v15 = 2;
  }
  else {
    unint64_t v15 = (unint64_t)v14;
  }
  id v61 = +[NSMutableArray arrayWithCapacity:v15];
  unint64_t v60 = v15;
  [v10 doubleBetween:0.0 :(double)(v15 - 1)];
  uint64_t v16 = 0;
  unint64_t v59 = (unint64_t)v17;
  while (1)
  {
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    double v19 = v18;
    double v21 = v20;
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"ParticleCount"];
    double v23 = v22;
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"FireworkSizeMin"];
    double v25 = v24;
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"FireworkSizeMax"];
    [v10 doubleBetween:v25 :v26];
    double v28 = v27;
    [v9 duration];
    uint64_t v30 = v29;
    id v31 = [v9 direction];
    metalFireworksShader = self->_metalFireworksShader;
    v33 = [v9 metalContext];
    id v34 = +[KNBuildFireworksSystem newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildFireworksSystem, "newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", v31, v10, metalFireworksShader, v33, 1.0, 1.0, (double)(unint64_t)v23, 1.0, self->_drawableFrame.size.width, self->_drawableFrame.size.height, v19, v21, v30);

    [(TSDTexturedRectangle *)self->_particleTR size];
    if (!v34) {
      break;
    }
    double v37 = v35;
    double v38 = v36;
    if (v19 >= v21) {
      double v39 = v21;
    }
    else {
      double v39 = v19;
    }
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"ParticleSizeMin"];
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"ParticleSizeMax"];
    TSDMultiplySizeScalar();
    [v34 setRandomParticleSizeMinMax:];
    [v34 setMaxDistance:v39 * v28];
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"ParticleColorRandomness"];
    [v34 setColorRandomness:];
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"ParticleLifeSpanMinDuration"];
    [v34 setLifeSpanMinDuration:];
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"FireworkSpeedMin"];
    double v41 = v40;
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"FireworkSpeedMax"];
    [v34 setRandomParticleSpeedMinMax:v41, v42];
    if (v16)
    {
      double v43 = 0.5;
      double v44 = 1.0;
    }
    else
    {
      double v43 = 0.0;
      double v44 = 0.5;
    }
    [v10 doubleBetween:v43 :v44];
    [v34 setFireworkStartingPositionX:];
    if (!v16)
    {
      double v45 = 0.0;
      goto LABEL_16;
    }
    if (v16 == 1)
    {
      double v45 = 1.0;
LABEL_16:
      [v34 setFireworkStartingPositionX:v45];
    }
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"FireworkDurationMin"];
    double v47 = v46;
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"FireworkDurationMax"];
    [v10 doubleBetween:v47 :v48];
    double v50 = v49;
    [v9 duration];
    double v52 = v50 / v51;
    [v10 doubleBetween:0.0 :1.0 - v52];
    HIDWORD(v54) = 0;
    if (v59 == v16) {
      double v53 = 0.0;
    }
    if (v53 < 0.001) {
      double v53 = 0.001;
    }
    *(float *)&double v53 = v53;
    *(float *)&double v54 = v52;
    [v34 setLifeSpan:v53, v54];
    [v34 setupWithTexture:v62 particleTextureSize:0 reverseDrawOrder:v37, v38];
    [v61 addObject:v34];

    if (v60 == ++v16) {
      goto LABEL_24;
    }
  }
  v55 = +[TSUAssertionHandler currentHandler];
  v56 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFireworks p_fireworksSystemsForTR:build:context:]");
  v57 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFireworks.m"];
  [v55 handleFailureInFunction:v56 file:v57 lineNumber:298 description:@"invalid nil value for '%s'", "particleSystem"];

LABEL_24:

  return v61;
}

- (void)renderFrameWithContext:(id)a3
{
}

- (void)animationDidEndWithContext:(id)a3
{
  id v4 = a3;
  [(KNBuildFireworks *)self metalAnimationDidEndWithContext:v4];
  [(KNBuildFireworks *)self metalTeardownAnimationsWithContext:v4];
}

- (void)teardown
{
}

- (id)p_particleTexturedRectWithPath:(id)a3
{
  CFDataRef v3 = +[NSData dataWithContentsOfFile:a3];
  id v4 = CGDataProviderCreateWithCFData(v3);

  CGFloat v5 = CGImageCreateWithPNGDataProvider(v4, 0, 1, kCGRenderingIntentDefault);
  CGDataProviderRelease(v4);
  id v6 = [objc_alloc((Class)TSDTexturedRectangle) initWithCGImage:v5];
  CGImageRelease(v5);

  return v6;
}

- (void)p_setupParticleTexturedRectsWithMetalContext:(id)a3
{
  if (!self->_particleTR)
  {
    id v4 = a3;
    CGFloat v5 = KNBundle();
    id v16 = [v5 pathForResource:@"KNBuildFireworks" ofType:@"png"];

    id v6 = [(KNBuildFireworks *)self p_particleTexturedRectWithPath:v16];
    particleTR = self->_particleTR;
    self->_particleTR = v6;

    id v8 = self->_particleTR;
    id v9 = [v4 device];
    [(TSDTexturedRectangle *)v8 setupMetalTextureForDevice:v9];

    double v10 = KNBundle();
    double v11 = [v10 pathForResource:@"KNBuildFireworks_CenterBurst" ofType:@"png"];

    double v12 = [(KNBuildFireworks *)self p_particleTexturedRectWithPath:v11];
    centerBurstTR = self->_centerBurstTR;
    self->_centerBurstTR = v12;

    double v14 = self->_centerBurstTR;
    unint64_t v15 = [v4 device];

    [(TSDTexturedRectangle *)v14 setupMetalTextureForDevice:v15];
  }
}

- (void)p_setupShadersWithMetalContext:(id)a3
{
  id v4 = a3;
  id v17 = [v4 device];
  id v5 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  id v6 = [v4 pixelFormat];

  [v5 setPixelFormat:v6];
  [v5 setBlendingEnabled:1];
  [v5 setDestinationRGBBlendFactor:5];
  [v5 setDestinationAlphaBlendFactor:5];
  CGFloat v7 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initDefaultTextureAndOpacityShaderWithDevice:v17 colorAttachment:v5];
  metalObjectShader = self->_metalObjectShader;
  self->_metalObjectShader = v7;

  id v9 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"buildFireworksParticlesVertexShader" fragmentShader:@"buildFireworksParticlesFragmentShader" device:v17 library:@"KeynoteMetalLibrary" colorAttachment:v5];
  metalFireworksShader = self->_metalFireworksShader;
  self->_metalFireworksShader = v9;

  [v5 setDestinationRGBBlendFactor:0];
  [v5 setDestinationAlphaBlendFactor:0];
  double v11 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initQuadTextureShaderWithFragmentShader:@"buildFireworksTrailsFragmentShader" device:v17 library:@"KeynoteMetalLibrary" colorAttachment:v5];
  metalTrailsShader = self->_metalTrailsShader;
  self->_metalTrailsShader = v11;

  [v5 setSourceRGBBlendFactor:4];
  [v5 setSourceAlphaBlendFactor:4];
  double v13 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initQuadTextureShaderWithFragmentShader:@"buildFireworksTrailsFragmentShader" device:v17 library:@"KeynoteMetalLibrary" colorAttachment:v5];
  metalFBOShader = self->_metalFBOShader;
  self->_metalFBOShader = v13;

  [v5 setDestinationRGBBlendFactor:5];
  [v5 setDestinationAlphaBlendFactor:5];
  unint64_t v15 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initDefaultTextureAndOpacityShaderWithDevice:v17 colorAttachment:v5];
  metalCenterBurstShader = self->_metalCenterBurstShader;
  self->_metalCenterBurstShader = v15;
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 textures];
  id v6 = [v4 animatedBuild];
  CGFloat v7 = [v4 metalContext];
  if ([v5 count] != (char *)&dword_0 + 1)
  {
    id v8 = +[TSUAssertionHandler currentHandler];
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFireworks metalPrepareAnimationWithContext:]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFireworks.m"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 443, @"Effect expects one texture. Passed (%lu) textures.", objc_msgSend(v5, "count"));
  }
  double v11 = [v5 lastObject];
  double v12 = [v7 device];
  [v4 drawableFrame];
  self->_drawableFrame.origin.x = v13;
  self->_drawableFrame.origin.y = v14;
  self->_drawableFrame.size.width = v15;
  self->_drawableFrame.size.height = v16;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  self->_frameRect.origin.x = v17;
  self->_frameRect.origin.y = v18;
  self->_frameRect.size.width = v19;
  self->_frameRect.size.height = v20;
  [(KNAnimationEffect *)self mvpMatrixWithContext:v4];
  long long v21 = *(_OWORD *)&v62.m33;
  *(_OWORD *)&self->_baseTransform.m31 = *(_OWORD *)&v62.m31;
  *(_OWORD *)&self->_baseTransform.m33 = v21;
  long long v22 = *(_OWORD *)&v62.m43;
  *(_OWORD *)&self->_baseTransform.m41 = *(_OWORD *)&v62.m41;
  *(_OWORD *)&self->_baseTransform.m43 = v22;
  long long v23 = *(_OWORD *)&v62.m13;
  *(_OWORD *)&self->_baseTransform.m11 = *(_OWORD *)&v62.m11;
  *(_OWORD *)&self->_baseTransform.m13 = v23;
  long long v24 = *(_OWORD *)&v62.m23;
  *(_OWORD *)&self->_baseTransform.m21 = *(_OWORD *)&v62.m21;
  *(_OWORD *)&self->_baseTransform.m23 = v24;
  TSDTransform3DMakeOrtho();
  long long v25 = *(_OWORD *)&v62.m33;
  *(_OWORD *)&self->_baseOrthoTransform.m31 = *(_OWORD *)&v62.m31;
  *(_OWORD *)&self->_baseOrthoTransform.m33 = v25;
  long long v26 = *(_OWORD *)&v62.m43;
  *(_OWORD *)&self->_baseOrthoTransform.m41 = *(_OWORD *)&v62.m41;
  *(_OWORD *)&self->_baseOrthoTransform.m43 = v26;
  long long v27 = *(_OWORD *)&v62.m13;
  *(_OWORD *)&self->_baseOrthoTransform.m11 = *(_OWORD *)&v62.m11;
  *(_OWORD *)&self->_baseOrthoTransform.m13 = v27;
  long long v28 = *(_OWORD *)&v62.m23;
  *(_OWORD *)&self->_baseOrthoTransform.m21 = *(_OWORD *)&v62.m21;
  *(_OWORD *)&self->_baseOrthoTransform.m23 = v28;
  [(KNBuildFireworks *)self p_setupParticleTexturedRectsWithMetalContext:v7];
  [(KNBuildFireworks *)self p_setupShadersWithMetalContext:v7];
  uint64_t v29 = [(KNBuildFireworks *)self p_fireworksSystemsForTR:v11 build:v6 context:v4];
  fireworksSystems = self->_fireworksSystems;
  self->_fireworksSystems = v29;

  [v11 frame];
  TSDRectWithSize();
  double v31 = TSDRectUnit[0];
  double v32 = TSDRectUnit[1];
  double v33 = TSDRectUnit[2];
  double v34 = TSDRectUnit[3];
  double v35 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v12);
  metalObjectDataBuffer = self->_metalObjectDataBuffer;
  self->_metalObjectDataBuffer = v35;

  TSDRectWithSize();
  double v37 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v12);
  metalFBODataBuffer = self->_metalFBODataBuffer;
  self->_metalFBODataBuffer = v37;

  [(TSDTexturedRectangle *)self->_centerBurstTR size];
  double v40 = v39;
  [(TSDTexturedRectangle *)self->_centerBurstTR size];
  double v42 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v12, 0.0, 0.0, v40, v41, v31, v32, v33, v34);
  metalCenterBurstDataBuffer = self->_metalCenterBurstDataBuffer;
  self->_metalCenterBurstDataBuffer = v42;

  float32x4_t v44 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m21), *(float64x2_t *)&self->_baseTransform.m23);
  float32x4_t v45 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m31), *(float64x2_t *)&self->_baseTransform.m33);
  float32x4_t v46 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m41), *(float64x2_t *)&self->_baseTransform.m43);
  *(float32x4_t *)self->_anon_230 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m11), *(float64x2_t *)&self->_baseTransform.m13);
  *(float32x4_t *)&self->_anon_230[16] = v44;
  *(float32x4_t *)&self->_anon_230[32] = v45;
  *(float32x4_t *)&self->_anon_230[48] = v46;
  float32x4_t v47 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseOrthoTransform.m21), *(float64x2_t *)&self->_baseOrthoTransform.m23);
  float32x4_t v48 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseOrthoTransform.m31), *(float64x2_t *)&self->_baseOrthoTransform.m33);
  float32x4_t v49 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseOrthoTransform.m41), *(float64x2_t *)&self->_baseOrthoTransform.m43);
  *(float32x4_t *)self->_anon_1f0 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseOrthoTransform.m11), *(float64x2_t *)&self->_baseOrthoTransform.m13);
  *(float32x4_t *)&self->_anon_1f0[16] = v47;
  *(float32x4_t *)&self->_anon_1f0[32] = v48;
  *(float32x4_t *)&self->_anon_1f0[48] = v49;
  [v11 frameOnCanvas];
  double v51 = v50;
  double MinX = CGRectGetMinX(self->_frameRect);
  [v11 frameOnCanvas];
  double v54 = v53;
  double MaxY = CGRectGetMaxY(self->_frameRect);
  memset(&v62, 0, sizeof(v62));
  mAnimationContext = self->super.mAnimationContext;
  if (mAnimationContext) {
    [(KNAnimationContext *)mAnimationContext slideProjectionMatrix];
  }
  CATransform3D v60 = v62;
  CATransform3DTranslate(&v61, &v60, v51 - MinX, -(v54 - MaxY), 0.0);
  CATransform3D v62 = v61;
  float32x4_t v57 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v61.m21), *(float64x2_t *)&v61.m23);
  float32x4_t v58 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v61.m31), *(float64x2_t *)&v61.m33);
  float32x4_t v59 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v61.m41), *(float64x2_t *)&v61.m43);
  *(float32x4_t *)&self->_particlesVertexUniforms.Percent = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v61.m11), *(float64x2_t *)&v61.m13);
  *(float32x4_t *)&self->_particlesVertexUniforms.ShouldSparkle = v57;
  *(float32x4_t *)&self->_particlesVertexUniforms.SpeedMax = v58;
  *(float32x4_t *)&self->_anon_194[12] = v59;
}

- (void)metalAnimationWillBeginWithContext:(id)a3
{
  id v4 = a3;
  [(KNBuildFireworks *)self frameOfEffectWithContext:v4];
  [(KNBuildFireworks *)self metalPrepareAnimationWithContext:v4];
  id v13 = [v4 metalContext];

  id v5 = [objc_alloc((Class)TSDMetalRenderTarget) initWithSize:v13 metalContext:self->_frameRect.size.width, self->_frameRect.size.height];
  frameRenderTarget = self->_frameRenderTarget;
  self->_frameRenderTarget = v5;

  CGFloat v7 = [objc_alloc((Class)TSDMetalRenderTarget) initWithSize:v13 metalContext:self->_frameRect.size.width, self->_frameRect.size.height];
  bloomRenderTarget = self->_bloomRenderTarget;
  self->_bloomRenderTarget = v7;

  id v9 = objc_alloc((Class)TSDMetalBloomEffect);
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"BloomBlurScale"];
  double v11 = [v9 initWithEffectSize:v13 blurScale:self->_frameRect.size.width metalContext:self->_frameRect.size.height];
  metalBloomEffect = self->_metalBloomEffect;
  self->_metalBloomEffect = v11;

  self->_previousPercent = 0.0;
}

- (void)p_drawObject:(id)a3 percent:(double)a4 encoder:(id)a5
{
  parameterGroup = self->_parameterGroup;
  id v8 = a5;
  id v9 = a3;
  [(KNAnimParameterGroup *)parameterGroup valueForConstant:@"TextOpacityBeginTime"];
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"TextOpacityEndTime"];
  TSUClamp();
  double v11 = v10;
  [v9 singleTextureOpacity];
  double v13 = v12;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForAnimationCurve:@"TextOpacityTiming" atPercent:v11];
  *(float *)&double v14 = v13 * v14;
  int v16 = LODWORD(v14);
  [(TSDMetalShader *)self->_metalObjectShader setPipelineStateWithEncoder:v8 vertexBytes:self->_anon_230 fragmentBytes:&v16];
  CGFloat v15 = [v9 metalTexture];

  [v8 setFragmentTexture:v15 atIndex:0];
  [(TSDMTLDataBuffer *)self->_metalObjectDataBuffer drawWithEncoder:v8 atIndex:[(TSDMetalShader *)self->_metalObjectShader bufferIndex]];
}

- (void)p_drawParticleSystemsWithPercent:(double)a3 sparkles:(BOOL)a4 particleSystemOpacity:(double)a5 context:(id)a6 renderEncoder:(id)a7
{
  BOOL v9 = a4;
  id v12 = a6;
  id v13 = a7;
  double v51 = [v12 randomGenerator];
  *(float *)&self->_anon_194[44] = (float)v9;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obj = self->_fireworksSystems;
  id v14 = [(NSArray *)obj countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v14)
  {
    id v15 = v14;
    id v50 = v12;
    uint64_t v53 = *(void *)v58;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v58 != v53) {
          objc_enumerationMutation(obj);
        }
        CGFloat v17 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        [v17 lifeSpan];
        double v20 = (a3 - v18) / v19;
        if (([v12 isWarmingUp] & 1) == 0 && (v20 <= 0.0 || v20 > 1.0)) {
          continue;
        }
        TSUClamp();
        double v23 = v22;
        TSUClamp();
        double v25 = v24;
        double v26 = a5;
        if (v9)
        {
          [(KNAnimParameterGroup *)self->_parameterGroup valueForAnimationCurve:@"ParticleTransparency" atPercent:v23];
          double v26 = 1.0 - v27;
        }
        [(KNAnimParameterGroup *)self->_parameterGroup valueForAnimationCurve:@"ParticleBurstTiming" atPercent:v23];
        *(float *)&double v28 = v28;
        *(_DWORD *)&self->_anon_194[52] = LODWORD(v28);
        [(KNAnimParameterGroup *)self->_parameterGroup valueForAnimationCurve:@"ParticleBurstTiming" atPercent:v25];
        *(float *)&double v29 = v29;
        *(_DWORD *)&self->_anon_194[56] = LODWORD(v29);
        *(float *)&double v29 = v25;
        *(_DWORD *)&self->_anon_194[32] = LODWORD(v29);
        [v17 speedMax];
        *(float *)&double v30 = v30;
        *(_DWORD *)&self->_anon_194[60] = LODWORD(v30);
        *(float *)&double v30 = v23;
        *(_DWORD *)&self->_anon_194[28] = LODWORD(v30);
        *(float *)&double v30 = v26;
        int v56 = LODWORD(v30);
        if (([v12 isWarmingUp] | !v9) == 1
          && ([v17 didDrawCenterBurst] & 1) == 0)
        {
          [(TSDTexturedRectangle *)self->_centerBurstTR size];
          double v32 = v31;
          double v34 = v33;
          CGFloat v35 = self->_frameRect.size.height / v33;
          [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"CenterBurstScaleMin"];
          double v37 = v36;
          [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"CenterBurstScaleMax"];
          [v51 doubleBetween:v37 :v38];
          CGFloat v40 = v35 * v39;
          [v17 startingPoint];
          long long v41 = *(_OWORD *)&self->_baseTransform.m13;
          *(_OWORD *)&v54.m11 = *(_OWORD *)&self->_baseTransform.m11;
          *(_OWORD *)&v54.m13 = v41;
          long long v42 = *(_OWORD *)&self->_baseTransform.m23;
          *(_OWORD *)&v54.m21 = *(_OWORD *)&self->_baseTransform.m21;
          *(_OWORD *)&v54.m23 = v42;
          long long v43 = *(_OWORD *)&self->_baseTransform.m33;
          *(_OWORD *)&v54.m31 = *(_OWORD *)&self->_baseTransform.m31;
          *(_OWORD *)&v54.m33 = v43;
          long long v44 = *(_OWORD *)&self->_baseTransform.m43;
          *(_OWORD *)&v54.m41 = *(_OWORD *)&self->_baseTransform.m41;
          *(_OWORD *)&v54.m43 = v44;
          CATransform3DTranslate(&v55, &v54, v45, v46, 0.0);
          CATransform3D v54 = v55;
          CATransform3DTranslate(&v55, &v54, v32 * -0.5 * v40, v34 * -0.5 * v40, 0.0);
          CATransform3D v54 = v55;
          CATransform3DScale(&v55, &v54, v40, v40, 1.0);
          *(float32x4_t *)&v55.m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v55.m11), *(float64x2_t *)&v55.m13);
          *(float32x4_t *)&v55.m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v55.m21), *(float64x2_t *)&v55.m23);
          *(float32x4_t *)&v55.m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v55.m31), *(float64x2_t *)&v55.m33);
          *(float32x4_t *)&v55.m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v55.m41), *(float64x2_t *)&v55.m43);
          LODWORD(v54.m11) = 0;
          [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"CenterBurstOpacity"];
          *(float *)&double v47 = v47;
          LODWORD(v54.m11) = LODWORD(v47);
          [(TSDMetalShader *)self->_metalCenterBurstShader setPipelineStateWithEncoder:v13 vertexBytes:&v55 fragmentBytes:&v54];
          float32x4_t v48 = [(TSDTexturedRectangle *)self->_centerBurstTR metalTexture];
          [v13 setFragmentTexture:v48 atIndex:0];

          id v12 = v50;
          [(TSDMTLDataBuffer *)self->_metalCenterBurstDataBuffer drawWithEncoder:v13 atIndex:[(TSDMetalShader *)self->_metalCenterBurstShader bufferIndex]];
          [v17 setDidDrawCenterBurst:1];
        }
        [(TSDMetalShader *)self->_metalFireworksShader setPipelineStateWithEncoder:v13 vertexBytes:&self->_particlesVertexUniforms fragmentBytes:&v56];
        float32x4_t v49 = [(TSDTexturedRectangle *)self->_particleTR metalTexture];
        [v13 setFragmentTexture:v49 atIndex:0];

        [v17 drawMetalWithEncoder:v13];
      }
      id v15 = [(NSArray *)obj countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v15);
  }
}

- (void)metalRenderFrameWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 metalContext];
  id v6 = [v5 commandQueue];
  CGFloat v7 = [v6 commandBuffer];

  id v8 = [v4 metalContext];
  CATransform3D v54 = [v8 renderEncoder];

  if ([v4 isWarmingUp])
  {
    uint64_t v9 = 2;
  }
  else if (self->_previousPercent == 0.0)
  {
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 1;
  }
  [(TSDMetalRenderTarget *)self->_frameRenderTarget setTextureLoadAction:v9];
  double v10 = [(TSDMetalRenderTarget *)self->_frameRenderTarget passDescriptor];
  double v11 = [v7 renderCommandEncoderWithDescriptor:v10];

  uint64_t v53 = [v4 textures];
  [v4 percent];
  double v13 = v12;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  double v15 = v14;
  double v17 = v16;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"ParticleTrailsDitherAmount"];
  double v19 = v18;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"ParticleTrailsDitherMax"];
  double v21 = v20;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"BloomPower"];
  double v23 = v22;
  CATransform3D v55 = [v4 randomGenerator];
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Gravity"];
  if (v15 >= v17) {
    double v15 = v17;
  }
  double v25 = v15 * 0.001 * v24;
  [v4 duration];
  double v27 = v25 * v26;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"ParticleSizeStart"];
  float v29 = v27;
  *(float *)&double v28 = v15 * v28 / 100.0;
  *(float *)&self->_anon_194[36] = v29;
  *(_DWORD *)&self->_anon_194[40] = LODWORD(v28);
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"SparklePeriod"];
  *(float *)&double v30 = v30;
  *(_DWORD *)&self->_anon_194[48] = LODWORD(v30);
  if (self->_previousPercent > 0.0)
  {
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"FireworkDurationMin"];
    [v4 duration];
    TSUClamp();
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"TrailsFadeOutMin"];
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"TrailsFadeOutMax"];
    TSDMixFloats();
    double v32 = 1.0 - v31;
    [v55 randomDouble];
    float64_t v52 = v33;
    [v55 randomDouble];
    v34.f64[0] = v52;
    v34.f64[1] = v35;
    float32x2_t v36 = vcvt_f32_f64(v34);
    *(float *)v34.f64 = v32;
    float v37 = v19;
    self->_fboFragmentUniforms.Opacity = *(float *)v34.f64;
    self->_fboFragmentUniforms.NoiseAmount = v37;
    *(float *)v34.f64 = v21;
    *(_DWORD *)&self->_anon_2b8[8] = LODWORD(v34.f64[0]);
    *(float32x2_t *)self->_anon_2b8 = v36;
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_metalTrailsShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v11, self->_anon_1f0);
    double v38 = [(TSDMetalRenderTarget *)self->_frameRenderTarget texture];
    [v11 setFragmentTexture:v38 atIndex:0];

    [(TSDMTLDataBuffer *)self->_metalFBODataBuffer drawWithEncoder:v11 atIndex:[(TSDMetalShader *)self->_metalTrailsShader bufferIndex]];
  }
  [(KNBuildFireworks *)self p_drawParticleSystemsWithPercent:0 sparkles:v4 particleSystemOpacity:v11 context:v13 renderEncoder:1.0];
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"FireworkDurationMax"];
  [v4 duration];
  TSUClamp();
  -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", @"ParticleTransparency");
  double v40 = 1.0 - v39;
  *(float *)&double v39 = 1.0 - v39;
  self->_fboFragmentUniforms.Opacity = *(float *)&v39;
  self->_fboFragmentUniforms.NoiseAmount = 0.0;
  [v11 endEncoding];
  long long v41 = [(TSDMetalRenderTarget *)self->_bloomRenderTarget passDescriptor];
  long long v42 = [v7 renderCommandEncoderWithDescriptor:v41];

  [(TSDMetalShader *)self->_metalFBOShader setPipelineStateWithEncoder:v42 vertexBytes:self->_anon_1f0 fragmentBytes:&self->_fboFragmentUniforms];
  long long v43 = [(TSDMetalRenderTarget *)self->_frameRenderTarget texture];
  [v42 setFragmentTexture:v43 atIndex:0];

  [(TSDMTLDataBuffer *)self->_metalFBODataBuffer drawWithEncoder:v42 atIndex:[(TSDMetalShader *)self->_metalFBOShader bufferIndex]];
  [(KNBuildFireworks *)self p_drawParticleSystemsWithPercent:1 sparkles:v4 particleSystemOpacity:v42 context:v13 renderEncoder:v40];
  [v42 endEncoding];
  [v7 commit];
  long long v44 = [v53 objectAtIndexedSubscript:0];
  [(KNBuildFireworks *)self p_drawObject:v44 percent:v54 encoder:v13];

  metalBloomEffect = self->_metalBloomEffect;
  CGFloat v46 = [(TSDMetalRenderTarget *)self->_bloomRenderTarget texture];
  double v47 = [v4 metalContext];
  long long v48 = *(_OWORD *)&self->_baseOrthoTransform.m33;
  v56[4] = *(_OWORD *)&self->_baseOrthoTransform.m31;
  v56[5] = v48;
  long long v49 = *(_OWORD *)&self->_baseOrthoTransform.m43;
  v56[6] = *(_OWORD *)&self->_baseOrthoTransform.m41;
  v56[7] = v49;
  long long v50 = *(_OWORD *)&self->_baseOrthoTransform.m13;
  v56[0] = *(_OWORD *)&self->_baseOrthoTransform.m11;
  v56[1] = v50;
  long long v51 = *(_OWORD *)&self->_baseOrthoTransform.m23;
  v56[2] = *(_OWORD *)&self->_baseOrthoTransform.m21;
  v56[3] = v51;
  [(TSDMetalBloomEffect *)metalBloomEffect drawBloomEffectWithTexture:v46 metalContext:v47 encoder:v54 MVPMatrix:v56 bloomAmount:v23];

  self->_previousPercent = v13;
}

- (void)metalAnimationDidEndWithContext:(id)a3
{
  frameRenderTarget = self->_frameRenderTarget;
  self->_frameRenderTarget = 0;

  bloomRenderTarget = self->_bloomRenderTarget;
  self->_bloomRenderTarget = 0;

  [(TSDMetalBloomEffect *)self->_metalBloomEffect teardown];
  metalBloomEffect = self->_metalBloomEffect;
  self->_metalBloomEffect = 0;
}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  metalFireworksShader = self->_metalFireworksShader;
  self->_metalFireworksShader = 0;

  metalObjectShader = self->_metalObjectShader;
  self->_metalObjectShader = 0;

  metalCenterBurstShader = self->_metalCenterBurstShader;
  self->_metalCenterBurstShader = 0;

  metalCenterBurstDataBuffer = self->_metalCenterBurstDataBuffer;
  self->_metalCenterBurstDataBuffer = 0;

  [(TSDTexturedRectangle *)self->_centerBurstTR teardown];
  [(TSDTexturedRectangle *)self->_particleTR teardown];
  metalFBOShader = self->_metalFBOShader;
  self->_metalFBOShader = 0;

  metalFBODataBuffer = self->_metalFBODataBuffer;
  self->_metalFBODataBuffer = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalBloomEffect, 0);
  objc_storeStrong((id *)&self->_bloomRenderTarget, 0);
  objc_storeStrong((id *)&self->_metalFBODataBuffer, 0);
  objc_storeStrong((id *)&self->_metalFBOShader, 0);
  objc_storeStrong((id *)&self->_metalTrailsShader, 0);
  objc_storeStrong((id *)&self->_frameRenderTarget, 0);
  objc_storeStrong((id *)&self->_particleTR, 0);
  objc_storeStrong((id *)&self->_centerBurstTR, 0);
  objc_storeStrong((id *)&self->_metalCenterBurstDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalCenterBurstShader, 0);
  objc_storeStrong((id *)&self->_metalObjectDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalObjectShader, 0);
  objc_storeStrong((id *)&self->_metalFireworksShader, 0);
  objc_storeStrong((id *)&self->_fireworksSystems, 0);

  objc_storeStrong((id *)&self->_parameterGroup, 0);
}

@end