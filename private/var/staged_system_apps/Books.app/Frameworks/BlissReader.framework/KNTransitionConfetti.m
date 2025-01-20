@interface KNTransitionConfetti
+ (id)animationFilter;
+ (id)animationName;
+ (id)customAttributes;
+ (id)defaultAttributes;
+ (id)supportedTypes;
+ (id)thumbnailImageNameForType:(int)a3;
+ (int)animationCategory;
+ (unint64_t)directionType;
+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8;
+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8;
- (CATransform3D)p_calculateQuadShaderMVPMatrixWithPercent:(SEL)a3 slideSize:(double)a4 destRect:(CGSize)a5;
- (KNTransitionConfetti)initWithAnimationContext:(id)a3;
- (void)animationWillBeginWithContext:(id)a3;
- (void)dealloc;
- (void)p_setupParticleSystemWithImage:(id)a3 direction:(unint64_t)a4 duration:(double)a5 randomGenerator:(id)a6 metalContext:(id)a7;
- (void)p_teardown;
- (void)renderFrameWithContext:(id)a3;
@end

@implementation KNTransitionConfetti

- (KNTransitionConfetti)initWithAnimationContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KNTransitionConfetti;
  return [(KNAnimationEffect *)&v4 initWithAnimationContext:a3];
}

- (void)p_teardown
{
  self->mParticleSystem = 0;
  self->_metalShader = 0;

  self->_quadMetalShader = 0;
  self->_quadMTLDataBuffer = 0;
}

- (void)dealloc
{
  [(KNTransitionConfetti *)self p_teardown];
  v3.receiver = self;
  v3.super_class = (Class)KNTransitionConfetti;
  [(KNTransitionConfetti *)&v3 dealloc];
}

+ (id)animationName
{
  return @"com.apple.iWork.Keynote.KLNConfetti";
}

+ (int)animationCategory
{
  return 201;
}

+ (id)animationFilter
{
  return (id)kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return &off_499998;
}

+ (unint64_t)directionType
{
  return 7;
}

+ (id)defaultAttributes
{
  LODWORD(v2) = 1.5;
  return +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithFloat:v2], @"KNTransitionAttributesDuration", 0);
}

+ (id)customAttributes
{
  return 0;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"kn-mac-anim-icons-trans-confetti";
}

- (void)p_setupParticleSystemWithImage:(id)a3 direction:(unint64_t)a4 duration:(double)a5 randomGenerator:(id)a6 metalContext:(id)a7
{
  if (!a6) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionConfetti p_setupParticleSystemWithImage:direction:duration:randomGenerator:metalContext:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionConfetti.m") lineNumber:150 description:@"invalid nil value for '%s'", "randGen"];
  }
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  double v13 = v12;
  double v15 = v14;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  if (a7)
  {
    unint64_t v18 = (unint64_t)(sqrt(sqrt(v16 * (v17 / v15) / v13)) * 10000.0);
    [a3 size];
    mParticleSystem = (KNBuildConfettiSystem *)+[KNBuildConfettiSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildConfettiSystem, "newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", v18, a4, a6, self->_metalShader, a7);
    self->mParticleSystem = mParticleSystem;
  }
  else
  {
    mParticleSystem = self->mParticleSystem;
  }
  double height = CGSizeZero.height;

  -[KNBuildConfettiSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](mParticleSystem, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, 0, CGSizeZero.width, height);
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v5 = [a3 textures];
  id v6 = [a3 direction];
  [a3 duration];
  double v8 = v7;
  id v9 = [v5 lastObject];
  id v10 = objc_msgSend(objc_msgSend(a3, "metalContext"), "device");
  id v11 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v11, "setPixelFormat:", objc_msgSend(objc_msgSend(a3, "metalContext"), "pixelFormat"));
  [v11 setBlendingEnabled:1];
  [v11 setDestinationAlphaBlendFactor:5];
  [v11 setDestinationRGBBlendFactor:5];
  self->_metalShader = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"transitionConfettiVertexShader" fragmentShader:@"transitionConfettiFragmentShader" device:v10 library:@"KeynoteMetalLibrary" colorAttachment:v11];
  [self p_setupParticleSystemWithImage:[v5 objectAtIndexedSubscript:0] direction:v6 randomGenerator:[a3 randomGenerator] metalContext:[a3 metalContext] duration:v8];
  self->_quadMetalShader = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initDefaultTextureShaderWithDevice:v10 colorAttachment:v11];
  if (!self->_quadMTLDataBuffer)
  {
    [v9 size];
    double v13 = v12;
    [v9 size];
    self->_quadMTLDataBuffer = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v10, 0.0, 0.0, v13, v14, 0.0, 0.0, 1.0, 1.0);
  }
  for (uint64_t i = 0; i != 15; i += 5)
  {
    mAnimationContext = self->super.mAnimationContext;
    if (mAnimationContext)
    {
      [(KNAnimationContext *)mAnimationContext slideProjectionMatrix];
      float64x2_t v18 = v28;
      float64x2_t v17 = v29;
      float64x2_t v20 = v30;
      float64x2_t v19 = v31;
      float64x2_t v22 = v32;
      float64x2_t v21 = v33;
      float64x2_t v24 = v34;
      float64x2_t v23 = v35;
    }
    else
    {
      float64x2_t v34 = 0u;
      float64x2_t v35 = 0u;
      float64x2_t v24 = 0uLL;
      float64x2_t v32 = 0u;
      float64x2_t v33 = 0u;
      float64x2_t v23 = 0uLL;
      float64x2_t v22 = 0uLL;
      float64x2_t v21 = 0uLL;
      float64x2_t v30 = 0u;
      float64x2_t v31 = 0u;
      float64x2_t v20 = 0uLL;
      float64x2_t v19 = 0uLL;
      float64x2_t v18 = 0uLL;
      float64x2_t v17 = 0uLL;
      float64x2_t v28 = 0u;
      float64x2_t v29 = 0u;
    }
    v25 = (float32x4_t *)&self->_vertexInput[i];
    float32x4_t *v25 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v18), v17);
    v25[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v20), v19);
    v25[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v22), v21);
    v25[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v24), v23);
    [(KNBuildConfettiSystem *)self->mParticleSystem rotationMax];
    *(float *)&double v26 = v26;
    v25[4].i32[0] = LODWORD(v26);
    [(KNBuildConfettiSystem *)self->mParticleSystem speedMax];
    *(float *)&double v27 = v27;
    v25[4].i32[1] = LODWORD(v27);
  }
}

- (CATransform3D)p_calculateQuadShaderMVPMatrixWithPercent:(SEL)a3 slideSize:(double)a4 destRect:(CGSize)a5
{
  double height = a6.size.height;
  double width = a6.size.width;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  mAnimationContext = self->super.mAnimationContext;
  if (mAnimationContext) {
    [(KNAnimationContext *)mAnimationContext slideProjectionMatrix];
  }
  long double v11 = pow(a4, 4.0);
  long long v12 = *(_OWORD *)&retstr->m33;
  CGFloat v13 = (1.0 - v11) * 0.25 + 0.75;
  *(_OWORD *)&v38.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v38.m33 = v12;
  long long v14 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v38.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v38.m43 = v14;
  long long v15 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v38.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v38.m13 = v15;
  long long v16 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v38.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v38.m23 = v16;
  CATransform3DTranslate(&v39, &v38, width * 0.5, height * 0.5, 0.0);
  long long v17 = *(_OWORD *)&v39.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v39.m31;
  *(_OWORD *)&retstr->m33 = v17;
  long long v18 = *(_OWORD *)&v39.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v39.m41;
  *(_OWORD *)&retstr->m43 = v18;
  long long v19 = *(_OWORD *)&v39.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v39.m11;
  *(_OWORD *)&retstr->m13 = v19;
  long long v20 = *(_OWORD *)&v39.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v39.m21;
  *(_OWORD *)&retstr->m23 = v20;
  long long v21 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v38.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v38.m33 = v21;
  long long v22 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v38.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v38.m43 = v22;
  long long v23 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v38.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v38.m13 = v23;
  long long v24 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v38.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v38.m23 = v24;
  CATransform3DScale(&v39, &v38, v13, v13, 1.0);
  long long v25 = *(_OWORD *)&v39.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v39.m31;
  *(_OWORD *)&retstr->m33 = v25;
  long long v26 = *(_OWORD *)&v39.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v39.m41;
  *(_OWORD *)&retstr->m43 = v26;
  long long v27 = *(_OWORD *)&v39.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v39.m11;
  *(_OWORD *)&retstr->m13 = v27;
  long long v28 = *(_OWORD *)&v39.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v39.m21;
  *(_OWORD *)&retstr->m23 = v28;
  long long v29 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v38.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v38.m33 = v29;
  long long v30 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v38.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v38.m43 = v30;
  long long v31 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v38.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v38.m13 = v31;
  long long v32 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v38.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v38.m23 = v32;
  result = CATransform3DTranslate(&v39, &v38, width * -0.5, height * -0.5, 0.0);
  long long v34 = *(_OWORD *)&v39.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v39.m31;
  *(_OWORD *)&retstr->m33 = v34;
  long long v35 = *(_OWORD *)&v39.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v39.m41;
  *(_OWORD *)&retstr->m43 = v35;
  long long v36 = *(_OWORD *)&v39.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v39.m11;
  *(_OWORD *)&retstr->m13 = v36;
  long long v37 = *(_OWORD *)&v39.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v39.m21;
  *(_OWORD *)&retstr->m23 = v37;
  return result;
}

- (void)renderFrameWithContext:(id)a3
{
  id v5 = [a3 textures];
  v49 = (char *)[a3 direction];
  [a3 percent];
  double v7 = v6;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  double v9 = v8;
  double v11 = v10;
  id v50 = [v5 lastObject];
  id v12 = [v5 objectAtIndex:0];
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v48 = v7;
  double v21 = 1.0 - v7;
  memset(&v55, 0, sizeof(v55));
  mAnimationContext = self->super.mAnimationContext;
  if (mAnimationContext) {
    [(KNAnimationContext *)mAnimationContext slideProjectionMatrix];
  }
  CGFloat v23 = (1.0 - pow(v21, 4.0)) * 0.25 + 0.75;
  CATransform3D v53 = v55;
  CATransform3DTranslate(&v54, &v53, v18 * 0.5, v20 * 0.5, 0.0);
  CATransform3D v55 = v54;
  CATransform3D v53 = v54;
  CATransform3DScale(&v54, &v53, v23, v23, 1.0);
  CATransform3D v55 = v54;
  CATransform3D v53 = v54;
  CATransform3DTranslate(&v54, &v53, v18 * -0.5, v20 * -0.5, 0.0);
  CATransform3D v55 = v54;
  id v24 = [a3 metalContext];
  id v25 = [v24 device];
  id v26 = [v24 commandBuffer];
  id v27 = [v24 passDescriptor];
  id v47 = [v24 currentBuffer];
  id v28 = [v24 renderEncoder];
  memset(&v54, 0, sizeof(v54));
  -[KNTransitionConfetti p_calculateQuadShaderMVPMatrixWithPercent:slideSize:destRect:](self, "p_calculateQuadShaderMVPMatrixWithPercent:slideSize:destRect:", v21, v9, v11, v14, v16, v18, v20);
  if (v25)
  {
    if (v26) {
      goto LABEL_5;
    }
  }
  else
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KNTransitionConfetti renderFrameWithContext:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionConfetti.m"] lineNumber:281 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"device"];
    if (v26)
    {
LABEL_5:
      if (v27) {
        goto LABEL_6;
      }
LABEL_18:
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KNTransitionConfetti renderFrameWithContext:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionConfetti.m"] lineNumber:283 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"passDescriptor"];
      if (v28) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:@"-[KNTransitionConfetti renderFrameWithContext:]"] file:+[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionConfetti.m"] lineNumber:282 description:@"invalid nil value for '%s'", "commandBuffer"];
  if (!v27) {
    goto LABEL_18;
  }
LABEL_6:
  if (!v28) {
LABEL_7:
  }
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KNTransitionConfetti renderFrameWithContext:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionConfetti.m"] lineNumber:284 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"renderEncoder"]];
LABEL_8:
  id v29 = [v50 metalTextureWithContext:v24];
  id v30 = [v12 metalTextureWithContext:v24];
  if (v29)
  {
    id v31 = v30;
    if (v30)
    {
      [v28 setFragmentTexture:v29 atIndex:0];
      float32x4_t v32 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v54.m21), *(float64x2_t *)&v54.m23);
      float32x4_t v33 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v54.m31), *(float64x2_t *)&v54.m33);
      float32x4_t v34 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v54.m41), *(float64x2_t *)&v54.m43);
      self[1].super = (KNAnimationEffect)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v54.m11), *(float64x2_t *)&v54.m13);
      *(float32x4_t *)&self[1].mParticleSystem = v32;
      *(float32x4_t *)&self[1]._quadMetalShader = v33;
      self[1]._vertexInput[0] = ($8E8993324294570CC2572FFC521E3532)v34;
      [a3 percent];
      if (v35 > 0.0)
      {
        [(TSDMetalShader *)self->_quadMetalShader setPipelineStateWithEncoder:v28 vertexBytes:&self[1]];
        [v28 setFragmentTexture:v29 atIndex:0];
        [(TSDMTLDataBuffer *)self->_quadMTLDataBuffer drawWithEncoder:v28 atIndex:0];
      }
      if (v49 == &stru_68.segname[1])
      {
        double v36 = sqrt(sqrt(v18 * (v20 / v11) / v9));
        memset(&v53, 0, sizeof(v53));
        long long v37 = self->super.mAnimationContext;
        if (v37) {
          [(KNAnimationContext *)v37 slideProjectionMatrix];
        }
        double v38 = v48;
        CATransform3D v51 = v53;
        CATransform3DTranslate(&v52, &v51, 0.0, v48 * (v48 * (v20 * -2.0)) * (v36 * -0.5 + 1.0), 0.0);
        CATransform3D v53 = v52;
        id v39 = v47;
        v40 = &self->_vertexInput[5 * (void)v47];
        float32x4_t v41 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v52.m21), *(float64x2_t *)&v52.m23);
        float32x4_t v42 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v52.m31), *(float64x2_t *)&v52.m33);
        float32x4_t v43 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v52.m41), *(float64x2_t *)&v52.m43);
        *(float32x4_t *)v40 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v52.m11), *(float64x2_t *)&v52.m13);
        v40[1] = ($8E8993324294570CC2572FFC521E3532)v41;
        v40[2] = ($8E8993324294570CC2572FFC521E3532)v42;
        v40[3] = ($8E8993324294570CC2572FFC521E3532)v43;
      }
      else
      {
        double v38 = v48;
        id v39 = v47;
      }
      float v44 = v21;
      v45 = &self->_vertexInput[5 * (void)v39];
      float v46 = v38;
      v45[4].percent = v46;
      v45[4].opacity = v44;
      -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_metalShader, "setPipelineStateWithEncoder:vertexBytes:", v28);
      [v28 setFragmentTexture:v31 atIndex:0];
      [(KNBuildConfettiSystem *)self->mParticleSystem drawMetalWithEncoder:v28];
    }
  }
}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  if (a6 == 3
    && a8 <= 0x174876E7FFLL
    && a7
    && objc_msgSend(*a3, "objectForKey:", @"KNTransitionAttributesDirection", a4, a5))
  {
    if (objc_msgSend(objc_msgSend(*a3, "objectForKey:", @"KNTransitionAttributesDirection"), "unsignedIntegerValue") == &dword_C)uint64_t v9 = 121; {
    else
    }
      uint64_t v9 = 122;
    id v10 = [*a3 mutableCopy];
    [v10 setObject:[NSNumber numberWithUnsignedInteger:v9] forKey:@"KNTransitionAttributesDirection"];
    *a3 = v10;
  }
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  if (a6 == 3 && a8 <= 0x174876E7FFLL && a7 && objc_msgSend(*a3, "objectForKey:", @"direction", a4, a5))
  {
    uint64_t v9 = [(char *)[*a3 objectForKey:@"direction"] unsignedIntegerValue];
    uint64_t v10 = 122;
    if (v9 == &stru_68.segname[1]) {
      uint64_t v10 = 12;
    }
    if (v9 == &stru_68.segname[2]) {
      uint64_t v11 = 11;
    }
    else {
      uint64_t v11 = v10;
    }
    id v12 = [*a3 mutableCopy];
    [v12 setObject:[NSNumber numberWithUnsignedInteger:v11] forKey:@"direction"];
    *a3 = v12;
  }
}

@end