@interface KNBuildConfetti
+ (id)animationFilter;
+ (id)animationName;
+ (id)customAttributes;
+ (id)defaultAttributes;
+ (id)supportedTypes;
+ (id)thumbnailImageNameForType:(int)a3;
+ (int)animationCategory;
+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8;
+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8;
- (CGRect)frameOfEffectWithContext:(id)a3;
- (KNBuildConfetti)initWithAnimationContext:(id)a3;
- (void)metalPrepareAnimationWithContext:(id)a3;
- (void)metalTeardownAnimationsWithContext:(id)a3;
- (void)p_drawWithContext:(id)a3;
- (void)p_setupParticleSystemWithImage:(id)a3 build:(id)a4 randomGenerator:(id)a5 metalContext:(id)a6;
- (void)renderFrameWithContext:(id)a3;
@end

@implementation KNBuildConfetti

- (KNBuildConfetti)initWithAnimationContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KNBuildConfetti;
  return [(KNAnimationEffect *)&v4 initWithAnimationContext:a3];
}

+ (id)animationName
{
  return @"com.apple.iWork.Keynote.KLNConfetti";
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
  return &off_4999C8;
}

+ (id)defaultAttributes
{
  CFStringRef v4 = @"KNBuildAttributesDuration";
  v5 = &off_498FA8;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)customAttributes
{
  return 0;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"kn-mac-anim-icons-builds-confetti";
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  id v4 = a3;
  [v4 drawableFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 direction];

  self->_drawableFrame.origin.x = v6;
  self->_drawableFrame.origin.y = v8;
  self->_drawableFrame.size.width = v10;
  self->_drawableFrame.size.height = v12;
  v13.origin.x = v6;
  v13.origin.y = v8;
  v13.size.width = v10;
  v13.size.height = v12;
  CGRectGetMinX(v13);
  v14.origin.x = v6;
  v14.origin.y = v8;
  v14.size.width = v10;
  v14.size.height = v12;
  CGRectGetMinY(v14);
  v15.origin.x = v6;
  v15.origin.y = v8;
  v15.size.width = v10;
  v15.size.height = v12;
  CGRectGetMaxX(v15);
  v16.origin.x = v6;
  v16.origin.y = v8;
  v16.size.width = v10;
  v16.size.height = v12;
  CGRectGetMaxY(v16);
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  CGRectGetMinY(v17);
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  CGRectGetMaxY(v18);
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  CGRectGetMinX(v19);
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  CGRectGetMaxX(v20);
  self = (KNBuildConfetti *)((char *)self + 240);
  TSDRectWithPoints();
  *(CGRect *)&self->super.super.isa = v21;
  CGRect result = CGRectIntegral(v21);
  *(CGRect *)&self->super.super.isa = result;
  return result;
}

- (void)p_setupParticleSystemWithImage:(id)a3 build:(id)a4 randomGenerator:(id)a5 metalContext:(id)a6
{
  id v28 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v11)
  {
    CGRect v13 = +[TSUAssertionHandler currentHandler];
    CGRect v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildConfetti p_setupParticleSystemWithImage:build:randomGenerator:metalContext:]");
    CGRect v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildConfetti.m"];
    [v13 handleFailureInFunction:v14 file:v15 lineNumber:182 description:@"invalid nil value for '%s'", "randGen"];
  }
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  double v17 = v16;
  double v19 = v18;
  [v28 frame];
  double v21 = v20;
  double v23 = v22;
  [v10 duration];
  id v24 = [v10 direction];
  if (v12)
  {
    id v25 = v24;
    [v28 size];
    v26 = (KNBuildConfettiSystem *)+[KNBuildConfettiSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildConfettiSystem, "newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", (unint64_t)(sqrt(sqrt(v21 * (v23 / v19) / v17)) * 10000.0), v25, v11, self->_metalShader, v12);
    particleSystem = self->_particleSystem;
    self->_particleSystem = v26;
  }
  -[KNBuildConfettiSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](self->_particleSystem, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, 0, CGSizeZero.width, CGSizeZero.height);
}

- (void)p_drawWithContext:(id)a3
{
  id v4 = a3;
  double v5 = [v4 textures];
  CGFloat v6 = [v4 animatedBuild];
  [v4 percent];
  double v8 = v7;
  double v9 = (char *)[v6 direction];
  unsigned int v10 = [v6 isBuildIn];
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  double v12 = v11;
  double v14 = v13;
  CGRect v15 = [v5 lastObject];
  [v15 frame];
  double v17 = v16;
  double v19 = v18;
  float64x2_t v35 = *(float64x2_t *)&self->_baseTransform.m11;
  float64x2_t v36 = *(float64x2_t *)&self->_baseTransform.m21;
  float64x2_t v40 = *(float64x2_t *)&self->_baseTransform.m23;
  float64x2_t v41 = *(float64x2_t *)&self->_baseTransform.m33;
  float64x2_t v37 = *(float64x2_t *)&self->_baseTransform.m31;
  float64x2_t v38 = *(float64x2_t *)&self->_baseTransform.m13;
  float64x2_t v42 = *(float64x2_t *)&self->_baseTransform.m43;
  float64x2_t v39 = *(float64x2_t *)&self->_baseTransform.m41;
  [v15 singleTextureOpacity];
  if (v10) {
    double v21 = 1.0 - v8;
  }
  else {
    double v21 = v8;
  }
  double v22 = 1.0 - v21;
  double v23 = v21 + v21 * v21 * (1.0 - v22 * v22) + (-(v22 * v22) * v22 + 1.0) * (1.0 - v21 * v21);
  double v24 = v23 * 0.5;
  if (v10) {
    double v25 = v23 * 0.5;
  }
  else {
    double v25 = 1.0;
  }
  double v34 = v20;
  if (v9 == &stru_68.segname[1])
  {
    *(float64x2_t *)&v43.m11 = v35;
    *(float64x2_t *)&v43.m13 = v38;
    *(float64x2_t *)&v43.m21 = v36;
    *(float64x2_t *)&v43.m23 = v40;
    *(float64x2_t *)&v43.m31 = v37;
    *(float64x2_t *)&v43.m33 = v41;
    *(float64x2_t *)&v43.m41 = v39;
    *(float64x2_t *)&v43.m43 = v42;
    CATransform3DTranslate(&v44, &v43, 0.0, v21 * (v21 * (v19 * -2.0)) * (sqrt(sqrt(v17 * (v19 / v14) / v12)) * -0.5 + 1.0), 0.0);
    float64x2_t v35 = *(float64x2_t *)&v44.m11;
    float64x2_t v36 = *(float64x2_t *)&v44.m21;
    float64x2_t v40 = *(float64x2_t *)&v44.m23;
    float64x2_t v41 = *(float64x2_t *)&v44.m33;
    float64x2_t v37 = *(float64x2_t *)&v44.m31;
    float64x2_t v38 = *(float64x2_t *)&v44.m13;
    float64x2_t v42 = *(float64x2_t *)&v44.m43;
    float64x2_t v39 = *(float64x2_t *)&v44.m41;
  }
  v26 = [v4 metalContext];
  v27 = [v26 renderEncoder];
  if (!v27)
  {
    id v28 = +[TSUAssertionHandler currentHandler];
    v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildConfetti p_drawWithContext:]");
    v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildConfetti.m"];
    [v28 handleFailureInFunction:v29 file:v30 lineNumber:250 description:@"invalid nil value for '%s'", "renderEncoder"];
  }
  v31 = [v15 metalTextureWithContext:v26];
  if (v31)
  {
    self->_vertexInput = ($8E8993324294570CC2572FFC521E3532)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v35), v38);
    *(float32x4_t *)self->_anon_b0 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v36), v40);
    *(float32x4_t *)&self->_anon_b0[16] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v37), v41);
    *(float32x4_t *)&self->_anon_b0[32] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v39), v42);
    float v32 = v24 * v25;
    float v33 = v22 * v34;
    *(float *)&self->_anon_b0[56] = v32;
    *(float *)&self->_anon_b0[60] = v33;
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_metalShader, "setPipelineStateWithEncoder:vertexBytes:", v27);
    [v27 setFragmentTexture:v31 atIndex:0];
    [(KNBuildConfettiSystem *)self->_particleSystem drawMetalWithEncoder:v27];
  }
}

- (void)renderFrameWithContext:(id)a3
{
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  id v4 = a3;
  double v5 = [v4 animatedBuild];
  CGFloat v6 = [v4 textures];
  if ([v6 count] != (char *)&dword_0 + 1)
  {
    double v7 = +[TSUAssertionHandler currentHandler];
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildConfetti metalPrepareAnimationWithContext:]");
    double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildConfetti.m"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 288, @"Effect expects one texture. Passed (%lu) textures.", objc_msgSend(v6, "count"));
  }
  unsigned int v10 = [v4 metalContext];
  double v11 = [v10 device];

  if (!v11)
  {
    double v12 = +[TSUAssertionHandler currentHandler];
    double v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildConfetti metalPrepareAnimationWithContext:]");
    double v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildConfetti.m"];
    [v12 handleFailureInFunction:v13 file:v14 lineNumber:291 description:@"invalid nil value for '%s'", "device"];
  }
  id v15 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  double v16 = [v4 metalContext];
  [v15 setPixelFormat:[v16 pixelFormat]];

  [v15 setBlendingEnabled:1];
  [v15 setDestinationAlphaBlendFactor:5];
  [v15 setDestinationRGBBlendFactor:5];
  double v17 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"transitionConfettiVertexShader" fragmentShader:@"transitionConfettiFragmentShader" device:v11 library:@"KeynoteMetalLibrary" colorAttachment:v15];
  metalShader = self->_metalShader;
  self->_metalShader = v17;

  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  self->_frameRect.origin.x = v19;
  self->_frameRect.origin.y = v20;
  self->_frameRect.size.width = v21;
  self->_frameRect.size.height = v22;
  double v23 = [v6 objectAtIndexedSubscript:0];
  double v24 = [v4 randomGenerator];
  double v25 = [v4 metalContext];
  [(KNBuildConfetti *)self p_setupParticleSystemWithImage:v23 build:v5 randomGenerator:v24 metalContext:v25];

  [(KNBuildConfettiSystem *)self->_particleSystem rotationMax];
  *(float *)&double v26 = v26;
  *(_DWORD *)&self->_anon_b0[48] = LODWORD(v26);
  [(KNBuildConfettiSystem *)self->_particleSystem speedMax];
  *(float *)&double v27 = v27;
  *(_DWORD *)&self->_anon_b0[52] = LODWORD(v27);
  [(KNAnimationEffect *)self perspectiveMVPMatrixWithContext:v4];
  long long v28 = v37;
  *(_OWORD *)&self->_baseTransform.m31 = v36;
  *(_OWORD *)&self->_baseTransform.m33 = v28;
  long long v29 = v39;
  *(_OWORD *)&self->_baseTransform.m41 = v38;
  *(_OWORD *)&self->_baseTransform.m43 = v29;
  long long v30 = v33;
  *(_OWORD *)&self->_baseTransform.m11 = v32;
  *(_OWORD *)&self->_baseTransform.m13 = v30;
  long long v31 = v35;
  *(_OWORD *)&self->_baseTransform.m21 = v34;
  *(_OWORD *)&self->_baseTransform.m23 = v31;
}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  metalShader = self->_metalShader;
  self->_metalShader = 0;

  particleSystem = self->_particleSystem;
  self->_particleSystem = 0;
}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  if ((a6 - 1) <= 1 && a8 <= 0x174876E7FFLL && a7)
  {
    double v11 = [*a3 objectForKeyedSubscript:@"KNBuildAttributesDirection" a4, a5];

    if (v11)
    {
      double v12 = [*a3 objectForKeyedSubscript:@"KNBuildAttributesDirection"];
      double v13 = (int *)[v12 unsignedIntegerValue];

      if (v13 == &dword_C) {
        uint64_t v14 = 121;
      }
      else {
        uint64_t v14 = 122;
      }
      id v15 = [*a3 mutableCopy];
      double v16 = +[NSNumber numberWithUnsignedInteger:v14];
      [v15 setObject:v16 forKeyedSubscript:@"KNBuildAttributesDirection"];

      id v17 = v15;
      *a3 = v17;
    }
  }
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  if ((a6 - 1) <= 1 && a8 <= 0x174876E7FFLL && a7)
  {
    double v11 = [*a3 objectForKeyedSubscript:@"direction" a4, a5];

    if (v11)
    {
      double v12 = [*a3 objectForKeyedSubscript:@"direction"];
      double v13 = (char *)[v12 unsignedIntegerValue];

      uint64_t v14 = 122;
      if (v13 == &stru_68.segname[1]) {
        uint64_t v14 = 12;
      }
      if (v13 == &stru_68.segname[2]) {
        uint64_t v15 = 11;
      }
      else {
        uint64_t v15 = v14;
      }
      id v16 = [*a3 mutableCopy];
      id v17 = +[NSNumber numberWithUnsignedInteger:v15];
      [v16 setObject:v17 forKeyedSubscript:@"direction"];

      id v18 = v16;
      *a3 = v18;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalShader, 0);

  objc_storeStrong((id *)&self->_particleSystem, 0);
}

@end