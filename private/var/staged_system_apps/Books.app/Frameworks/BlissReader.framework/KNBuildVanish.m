@interface KNBuildVanish
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
- (KNBuildVanish)initWithAnimationContext:(id)a3;
- (void)animationDidEndWithContext:(id)a3;
- (void)animationWillBeginWithContext:(id)a3;
- (void)metalAnimationDidEndWithContext:(id)a3;
- (void)metalAnimationHasBegunWithContext:(id)a3;
- (void)metalPrepareAnimationWithContext:(id)a3;
- (void)metalRenderFrameWithContext:(id)a3;
- (void)metalTeardownAnimationsWithContext:(id)a3;
- (void)p_drawMetalParticleSystemsWithEncoder:(id)a3 texture:(id)a4 percent:(double)a5 sparkles:(BOOL)a6 particleSystemOpacity:(double)a7 metalContext:(id)a8;
- (void)p_setupMVPMatricesWithContext:(id)a3;
- (void)p_setupMetalBlurEffectsWithContext:(id)a3;
- (void)p_setupMetalShaderUniformsWithTexture:(id)a3;
- (void)p_setupMetalShadersWithContext:(id)a3;
- (void)p_setupParticleSystemWithContext:(id)a3 image:(id)a4 build:(id)a5 randomGenerator:(id)a6;
- (void)p_setupParticleTexturedRectWithContext:(id)a3;
- (void)renderFrameWithContext:(id)a3;
- (void)teardown;
@end

@implementation KNBuildVanish

+ (id)animationName
{
  return @"com.apple.iWork.Keynote.Vanish";
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
  return &off_499950;
}

+ (unint64_t)directionType
{
  return 8;
}

+ (id)defaultAttributes
{
  CFStringRef v4 = @"KNBuildAttributesDuration";
  v5 = &off_4991E0;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"kn-mac-anim-icons-builds-vanish";
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  if (a7)
  {
    uint64_t v8 = *(void *)&a6;
    *a4 = @"apple:dissolve";
    KNBundle();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v11 = [v13 localizedStringForKey:@"%@ builds were exported as Dissolve." value:&stru_46D7E8 table:@"Keynote"];
    v12 = [a1 localizedMenuString:v8];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
}

- (KNBuildVanish)initWithAnimationContext:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)KNBuildVanish;
  v3 = [(KNAnimationEffect *)&v9 initWithAnimationContext:a3];
  if (v3)
  {
    CFStringRef v4 = KNBundle();
    v5 = [v4 pathForResource:@"Vanish" ofType:@"parameterGroup"];

    uint64_t v6 = +[KNAnimParameterGroup parameterGroupForFile:v5];
    parameterGroup = v3->_parameterGroup;
    v3->_parameterGroup = (KNAnimParameterGroup *)v6;
  }
  return v3;
}

- (void)teardown
{
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  [a3 drawableFrame];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  CGRectGetMinX(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRectGetMinY(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGRectGetMaxX(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGRectGetMaxY(v23);
  TSDRectWithPoints();
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  v27.origin.CGFloat x = v16;
  v27.origin.CGFloat y = v17;
  v27.size.CGFloat width = v18;
  v27.size.CGFloat height = v19;
  v24.origin.CGFloat x = v9;
  v24.origin.CGFloat y = v11;
  v24.size.CGFloat width = v13;
  v24.size.CGFloat height = v15;
  CGRect v25 = CGRectIntersection(v24, v27);
  CGRect result = CGRectIntegral(v25);
  self->_animationRect = result;
  self->_drawableFrame.origin.CGFloat x = x;
  self->_drawableFrame.origin.CGFloat y = y;
  self->_drawableFrame.size.CGFloat width = width;
  self->_drawableFrame.size.CGFloat height = height;
  return result;
}

- (void)p_setupMVPMatricesWithContext:(id)a3
{
  CFStringRef v4 = [a3 textures];
  v5 = [v4 firstObject];

  [v5 frameOnCanvas];
  CGFloat v7 = v6 - CGRectGetMinX(self->_animationRect);
  [v5 frameOnCanvas];
  double v9 = v8 - CGRectGetMaxY(self->_animationRect);
  CGRectGetWidth(self->_animationRect);
  CGRectGetHeight(self->_animationRect);
  TSDTransform3DMakeOrtho();
  long long v10 = *(_OWORD *)&v29.m33;
  *(_OWORD *)&self->_baseMatrix.m31 = *(_OWORD *)&v29.m31;
  *(_OWORD *)&self->_baseMatrix.m33 = v10;
  long long v11 = *(_OWORD *)&v29.m43;
  *(_OWORD *)&self->_baseMatrix.m41 = *(_OWORD *)&v29.m41;
  *(_OWORD *)&self->_baseMatrix.m43 = v11;
  long long v12 = *(_OWORD *)&v29.m13;
  *(_OWORD *)&self->_baseMatrix.m11 = *(_OWORD *)&v29.m11;
  *(_OWORD *)&self->_baseMatrix.m13 = v12;
  long long v13 = *(_OWORD *)&v29.m23;
  *(_OWORD *)&self->_baseMatrix.m21 = *(_OWORD *)&v29.m21;
  *(_OWORD *)&self->_baseMatrix.m23 = v13;
  long long v14 = *(_OWORD *)&self->_baseMatrix.m33;
  *(_OWORD *)&v28.m31 = *(_OWORD *)&self->_baseMatrix.m31;
  *(_OWORD *)&v28.m33 = v14;
  long long v15 = *(_OWORD *)&self->_baseMatrix.m43;
  *(_OWORD *)&v28.m41 = *(_OWORD *)&self->_baseMatrix.m41;
  *(_OWORD *)&v28.m43 = v15;
  long long v16 = *(_OWORD *)&self->_baseMatrix.m13;
  *(_OWORD *)&v28.m11 = *(_OWORD *)&self->_baseMatrix.m11;
  *(_OWORD *)&v28.m13 = v16;
  long long v17 = *(_OWORD *)&self->_baseMatrix.m23;
  *(_OWORD *)&v28.m21 = *(_OWORD *)&self->_baseMatrix.m21;
  *(_OWORD *)&v28.m23 = v17;
  CATransform3DTranslate(&v29, &v28, v7, -v9, 0.0);
  long long v18 = *(_OWORD *)&v29.m33;
  *(_OWORD *)&self->_baseMatrix.m31 = *(_OWORD *)&v29.m31;
  *(_OWORD *)&self->_baseMatrix.m33 = v18;
  long long v19 = *(_OWORD *)&v29.m43;
  *(_OWORD *)&self->_baseMatrix.m41 = *(_OWORD *)&v29.m41;
  *(_OWORD *)&self->_baseMatrix.m43 = v19;
  long long v20 = *(_OWORD *)&v29.m13;
  *(_OWORD *)&self->_baseMatrix.m11 = *(_OWORD *)&v29.m11;
  *(_OWORD *)&self->_baseMatrix.m13 = v20;
  long long v21 = *(_OWORD *)&v29.m23;
  *(_OWORD *)&self->_baseMatrix.m21 = *(_OWORD *)&v29.m21;
  *(_OWORD *)&self->_baseMatrix.m23 = v21;
  long long v22 = *(_OWORD *)&self->_baseMatrix.m23;
  long long v24 = *(_OWORD *)&self->_baseMatrix.m11;
  long long v23 = *(_OWORD *)&self->_baseMatrix.m13;
  *(_OWORD *)&self->_projectionMatrix.m21 = *(_OWORD *)&self->_baseMatrix.m21;
  *(_OWORD *)&self->_projectionMatrix.m23 = v22;
  *(_OWORD *)&self->_projectionMatrix.m11 = v24;
  *(_OWORD *)&self->_projectionMatrix.m13 = v23;
  long long v25 = *(_OWORD *)&self->_baseMatrix.m43;
  long long v27 = *(_OWORD *)&self->_baseMatrix.m31;
  long long v26 = *(_OWORD *)&self->_baseMatrix.m33;
  *(_OWORD *)&self->_projectionMatrix.m41 = *(_OWORD *)&self->_baseMatrix.m41;
  *(_OWORD *)&self->_projectionMatrix.m43 = v25;
  *(_OWORD *)&self->_projectionMatrix.m31 = v27;
  *(_OWORD *)&self->_projectionMatrix.m33 = v26;
}

- (void)p_setupParticleSystemWithContext:(id)a3 image:(id)a4 build:(id)a5 randomGenerator:(id)a6
{
  id v37 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v12)
  {
    long long v13 = +[TSUAssertionHandler currentHandler];
    long long v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildVanish p_setupParticleSystemWithContext:image:build:randomGenerator:]");
    long long v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildVanish.m"];
    [v13 handleFailureInFunction:v14 file:v15 lineNumber:242 description:@"invalid nil value for '%s'", "randGen"];
  }
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  double v17 = v16;
  double v19 = v18;
  [v11 duration];
  double v21 = v20;
  [v10 frame];
  unint64_t v24 = (unint64_t)(sqrt(sqrt(v23 * (v22 / v19) / v17)) * 10000.0);
  [v10 size];
  double v26 = v25;
  double v28 = v27;
  vanishMetalShader = self->_vanishMetalShader;
  v30 = [v37 metalContext];
  v31 = (KNBuildVanishParticleSystem *)+[KNBuildVanishParticleSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildVanishParticleSystem, "newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", v24, 0, v12, vanishMetalShader, v30, v26, v28, v17, v19, v21);
  vanishParticleSystem = self->_vanishParticleSystem;
  self->_vanishParticleSystem = v31;

  [(TSDTexturedRectangle *)self->_particleTR size];
  double v34 = v33;
  double v36 = v35;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Particle Min Scale"];
  -[KNBuildVanishParticleSystem setMinScale:](self->_vanishParticleSystem, "setMinScale:");
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Particle Max Scale"];
  -[KNBuildVanishParticleSystem setMaxScale:](self->_vanishParticleSystem, "setMaxScale:");
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Random Max Speed"];
  -[KNBuildVanishParticleSystem setRandomParticleSpeedMax:](self->_vanishParticleSystem, "setRandomParticleSpeedMax:");
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Max Speed"];
  -[KNBuildVanishParticleSystem setMaxSpeed:](self->_vanishParticleSystem, "setMaxSpeed:");
  -[KNBuildVanishParticleSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](self->_vanishParticleSystem, "setupWithTexture:particleTextureSize:reverseDrawOrder:", v10, 0, v34, v36);
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4 = a3;
  [(KNBuildVanish *)self metalPrepareAnimationWithContext:v4];
  [(KNBuildVanish *)self metalAnimationHasBegunWithContext:v4];
}

- (void)renderFrameWithContext:(id)a3
{
}

- (void)animationDidEndWithContext:(id)a3
{
  id v4 = a3;
  [(KNBuildVanish *)self metalAnimationDidEndWithContext:v4];
  [(KNBuildVanish *)self metalTeardownAnimationsWithContext:v4];
}

- (void)p_setupMetalBlurEffectsWithContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 metalContext];
  double v6 = [v4 textures];
  CGFloat v7 = [v6 lastObject];
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Blur Steps"];
  unint64_t v9 = (unint64_t)fmax(v8, 1.0);
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Blur Radius Max"];
  double v11 = v10;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Half Size Radius Every"];
  double v13 = v12;
  long long v14 = [v5 commandQueue];
  long long v15 = [v14 commandBuffer];
  double v16 = [[KNGaussianBlurEffect alloc] initWithContext:v4];

  blurEffect = self->_blurEffect;
  self->_blurEffect = v16;

  long long v18 = *(_OWORD *)&self->_projectionMatrix.m33;
  v24[4] = *(_OWORD *)&self->_projectionMatrix.m31;
  v24[5] = v18;
  long long v19 = *(_OWORD *)&self->_projectionMatrix.m43;
  v24[6] = *(_OWORD *)&self->_projectionMatrix.m41;
  v24[7] = v19;
  long long v20 = *(_OWORD *)&self->_projectionMatrix.m13;
  v24[0] = *(_OWORD *)&self->_projectionMatrix.m11;
  v24[1] = v20;
  long long v21 = *(_OWORD *)&self->_projectionMatrix.m23;
  v24[2] = *(_OWORD *)&self->_projectionMatrix.m21;
  v24[3] = v21;
  [(KNGaussianBlurEffect *)self->_blurEffect setMVPMatrix:v24];
  [(KNGaussianBlurEffect *)self->_blurEffect setTexture:v7];
  [(KNGaussianBlurEffect *)self->_blurEffect setSaturateBlurTextures:1];
  [(KNGaussianBlurEffect *)self->_blurEffect setupEffectIfNecessary];
  double v22 = self->_blurEffect;
  double v23 = [(KNAnimationContext *)self->super.mAnimationContext capabilities];
  [(KNGaussianBlurEffect *)v22 createBlurTexturesWithBlurSteps:v9 + 1 maxBlurRadius:v15 stepsToDecreaseRadius:v23 commandBuffer:v11 capabilities:v13];

  [v15 commit];
}

- (void)p_setupParticleTexturedRectWithContext:(id)a3
{
  id v4 = a3;
  v5 = KNBundle();
  id v14 = [v5 pathForResource:@"KNBuildVanish" ofType:@"png"];

  CFDataRef v6 = +[NSData dataWithContentsOfFile:v14];
  CGFloat v7 = CGDataProviderCreateWithCFData(v6);

  double v8 = CGImageCreateWithPNGDataProvider(v7, 0, 1, kCGRenderingIntentDefault);
  CGDataProviderRelease(v7);
  unint64_t v9 = (TSDTexturedRectangle *)[objc_alloc((Class)TSDTexturedRectangle) initWithCGImage:v8];
  particleTR = self->_particleTR;
  self->_particleTR = v9;

  double v11 = self->_particleTR;
  double v12 = [v4 metalContext];

  double v13 = [v12 device];
  [(TSDTexturedRectangle *)v11 setupMetalTextureForDevice:v13];

  CGImageRelease(v8);
}

- (void)p_setupMetalShadersWithContext:(id)a3
{
  id v8 = [a3 metalContext];
  id v4 = [v8 device];
  id v5 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  [v5 setPixelFormat:[v8 pixelFormat]];
  [v5 setBlendingEnabled:1];
  [v5 setDestinationRGBBlendFactor:5];
  [v5 setDestinationAlphaBlendFactor:5];
  CFDataRef v6 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"buildVanishVertexShader" fragmentShader:@"buildVanishFragmentShader" device:v4 library:@"KeynoteMetalLibrary" colorAttachment:v5];
  vanishMetalShader = self->_vanishMetalShader;
  self->_vanishMetalShader = v6;
}

- (void)p_setupMetalShaderUniformsWithTexture:(id)a3
{
  parameterGroup = self->_parameterGroup;
  id v5 = a3;
  [(KNAnimParameterGroup *)parameterGroup valueForConstant:@"Should Sparkle"];
  *(float *)&double v6 = v6;
  *(_DWORD *)&self->_anon_5c[44] = LODWORD(v6);
  float32x4_t v7 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m21), *(float64x2_t *)&self->_projectionMatrix.m23);
  float32x4_t v8 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m31), *(float64x2_t *)&self->_projectionMatrix.m33);
  float32x4_t v9 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m41), *(float64x2_t *)&self->_projectionMatrix.m43);
  *(float32x4_t *)&self->_vertexUniforms.Percent = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m11), *(float64x2_t *)&self->_projectionMatrix.m13);
  *(float32x4_t *)&self->_vertexUniforms.ParticleScalePercent = v7;
  *(float32x4_t *)&self->_anon_5c[4] = v8;
  *(float32x4_t *)&self->_anon_5c[20] = v9;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"SparklePeriod"];
  *(float *)&double v10 = v10;
  *(_DWORD *)&self->_anon_5c[48] = LODWORD(v10);
  [(KNBuildVanishParticleSystem *)self->_vanishParticleSystem particleSize];
  [v5 size];
  [(KNBuildVanishParticleSystem *)self->_vanishParticleSystem particleSize];
  [v5 size];

  TSDRectWithSize();
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;
  double MidX = CGRectGetMidX(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  float v16 = MidX - CGRectGetMinX(v25);
  float v23 = v16;
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  *(float *)&unsigned int v18 = MidY - CGRectGetMinY(v27);
  *(float *)&uint64_t v19 = -v23;
  LODWORD(v20) = 0;
  HIDWORD(v20) = v18;
  *(float *)&uint64_t v21 = v23;
  LODWORD(v22) = 0;
  *((float *)&v19 + 1) = -*(float *)&v18;
  *((float *)&v22 + 1) = -*(float *)&v18;
  *((float *)&v21 + 1) = -*(float *)&v18;
  *(void *)&self->_anon_5c[68] = __PAIR64__(v18, -v23);
  *(void *)&self->_anon_5c[76] = v20;
  *(void *)&self->_anon_5c[84] = __PAIR64__(v18, LODWORD(v23));
  *(void *)&self->_anon_5c[92] = COERCE_UNSIGNED_INT(-v23);
  *(void *)&self->_anon_5c[100] = 0;
  *(void *)&self->_anon_5c[108] = LODWORD(v23);
  *(void *)&self->_anon_5c[116] = v19;
  *(void *)&self->_anon_5c[124] = v22;
  *(void *)&self->_anon_5c[132] = v21;
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  id v4 = a3;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  self->_drawableFrame.origin.CGFloat x = v5;
  self->_drawableFrame.origin.CGFloat y = v6;
  self->_drawableFrame.size.CGFloat width = v7;
  self->_drawableFrame.size.CGFloat height = v8;
  CGSize size = self->_drawableFrame.size;
  self->_animationRect.origin = self->_drawableFrame.origin;
  self->_animationRect.CGSize size = size;
  double v10 = [v4 textures];
  double v11 = [v10 lastObject];

  [(KNAnimationEffect *)self perspectiveMVPMatrixWithContext:v4];
  self->_projectionMatriCGFloat x = v15;
  [(KNBuildVanish *)self p_setupParticleTexturedRectWithContext:v4];
  [(KNBuildVanish *)self p_setupMetalShadersWithContext:v4];
  double v12 = [v4 animatedBuild];
  double v13 = [v4 randomGenerator];
  [(KNBuildVanish *)self p_setupParticleSystemWithContext:v4 image:v11 build:v12 randomGenerator:v13];

  [(KNBuildVanish *)self p_setupMetalShaderUniformsWithTexture:v11];
  id v14 = [v4 animatedBuild];
  LODWORD(v13) = [v14 isBuildIn];

  if (v13) {
    [(KNBuildVanish *)self p_setupMetalBlurEffectsWithContext:v4];
  }
}

- (void)metalAnimationHasBegunWithContext:(id)a3
{
  id v6 = a3;
  id v4 = [v6 animatedBuild];
  unsigned int v5 = [v4 isBuildOut];

  if (v5) {
    [(KNBuildVanish *)self p_setupMetalBlurEffectsWithContext:v6];
  }
}

- (void)p_drawMetalParticleSystemsWithEncoder:(id)a3 texture:(id)a4 percent:(double)a5 sparkles:(BOOL)a6 particleSystemOpacity:(double)a7 metalContext:(id)a8
{
  BOOL v10 = a6;
  id v23 = a3;
  id v14 = a4;
  id v15 = a8;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForAnimationCurve:@"ParticleTransparency" atPercent:a5];
  if (v10)
  {
    [(KNAnimParameterGroup *)self->_parameterGroup valueForAnimationCurve:@"ParticleTransparency" atPercent:a5];
    double v18 = 1.0 - v17;
  }
  else
  {
    double v18 = v16 * a7;
  }
  float v19 = v18;
  float v20 = a5;
  *(float *)&self->_anon_5c[36] = v20;
  *(float *)&self->_anon_5c[40] = v19;
  uint64_t v21 = [v14 metalTextureWithContext:v15];
  if (v21)
  {
    [(TSDMetalShader *)self->_vanishMetalShader setPipelineStateWithEncoder:v23 vertexBytes:&self->_vertexUniforms];
    [v23 setVertexTexture:v21 atIndex:0];
    uint64_t v22 = [(TSDTexturedRectangle *)self->_particleTR metalTexture];
    [v23 setFragmentTexture:v22 atIndex:0];

    [(KNBuildVanishParticleSystem *)self->_vanishParticleSystem drawMetalWithEncoder:v23];
  }
}

- (void)metalRenderFrameWithContext:(id)a3
{
  id v32 = a3;
  id v4 = [v32 metalContext];
  unsigned int v5 = [v4 renderEncoder];
  [v32 percent];
  double v7 = v6;
  long double v8 = 1.0 - v6;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"ParticleScale Pow"];
  pow(v8, v9);
  TSUMix();
  *(float *)&double v10 = v10;
  *(_DWORD *)&self->_anon_5c[52] = LODWORD(v10);
  [(KNAnimParameterGroup *)self->_parameterGroup valueForAnimationCurve:@"Velocity Curve" atPercent:v7];
  *(float *)&double v11 = 2.0 - v11;
  *(_DWORD *)&self->_anon_5c[56] = LODWORD(v11);
  [(KNBuildVanishParticleSystem *)self->_vanishParticleSystem speedMax];
  *(float *)&double v12 = v12;
  *(_DWORD *)&self->_anon_5c[60] = LODWORD(v12);
  [(KNAnimParameterGroup *)self->_parameterGroup valueForAnimationCurve:@"Opacity Fade" atPercent:v7];
  double v14 = v13;
  [v32 duration];
  double v16 = v7 * v15;
  double v17 = 0.0;
  if (v16 < 0.1)
  {
    [v32 duration:0.0];
    double v17 = v7 * v18 / 0.1;
  }
  [(KNAnimParameterGroup *)self->_parameterGroup valueForAnimationCurve:@"Blur Radius Curve" atPercent:v17];
  double v20 = v19;
  uint64_t v21 = [v32 textures];
  uint64_t v22 = [v21 lastObject];

  [v32 duration];
  if (v7 * v23 <= 0.2)
  {
    [v22 singleTextureOpacity];
    [(KNGaussianBlurEffect *)self->_blurEffect setOpacity:(1.0 - v14) * v24];
    [(KNGaussianBlurEffect *)self->_blurEffect renderEffectAtPercent:v4 withContext:v20];
  }
  [v32 duration];
  if (v7 * v25 >= 0.1)
  {
    CGRect v26 = [v32 randomGenerator];
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Min Particle Opacity for Random"];
    double v28 = v27;
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Max Particle Opacity for Random"];
    [v26 doubleBetween:v28 :v29];
    double v31 = v30;

    [(KNBuildVanish *)self p_drawMetalParticleSystemsWithEncoder:v5 texture:v22 percent:1 sparkles:v4 particleSystemOpacity:v7 metalContext:v31];
  }
}

- (void)metalAnimationDidEndWithContext:(id)a3
{
  id v4 = [a3 animatedBuild];
  unsigned int v5 = [v4 isBuildOut];

  if (v5)
  {
    blurEffect = self->_blurEffect;
    [(KNGaussianBlurEffect *)blurEffect teardown];
  }
}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  [(KNGaussianBlurEffect *)self->_blurEffect teardown];
  [(TSDTexturedRectangle *)self->_particleTR teardown];
  vanishParticleSystem = self->_vanishParticleSystem;
  self->_vanishParticleSystem = 0;

  vanishMetalShader = self->_vanishMetalShader;
  self->_vanishMetalShader = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vanishMetalShader, 0);
  objc_storeStrong((id *)&self->_particleTR, 0);
  objc_storeStrong((id *)&self->_vanishParticleSystem, 0);
  objc_storeStrong((id *)&self->_blurEffect, 0);

  objc_storeStrong((id *)&self->_parameterGroup, 0);
}

@end