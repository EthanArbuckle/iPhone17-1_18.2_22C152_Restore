@interface KNBuildAnvil
+ (BOOL)requiresSingleTexturePerStage;
+ (id)animationFilter;
+ (id)animationName;
+ (id)defaultAttributes;
+ (id)supportedTypes;
+ (id)thumbnailImageNameForType:(int)a3;
+ (int)animationCategory;
+ (int)rendererTypeForAnimationContext:(id)a3;
+ (unint64_t)directionType;
+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8;
- (CATransform3D)p_orthoTransformWithScale:(SEL)a3 offset:(double)a4;
- (CGPoint)p_cameraShakePointsWithRandomGenerator:(id)a3;
- (CGPoint)p_objectTranslationAtPercent:(double)a3 duration:(double)a4 objectSmashDuration:(double)a5 objectFrame:(CGRect)a6 randomGenerator:(id)a7;
- (CGRect)frameOfEffectWithContext:(id)a3;
- (CGRect)frameOfEffectWithFrame:(CGRect)a3 context:(id)a4;
- (id)p_smokeSystemForTR:(id)a3 build:(id)a4 randomGenerator:(id)a5 metalContext:(id)a6;
- (id)p_specksSystemForTR:(id)a3 build:(id)a4 randomGenerator:(id)a5 metalContext:(id)a6;
- (id)p_texturedRectFromImagePath:(id)a3 metalContext:(id)a4;
- (void)metalPrepareAnimationWithContext:(id)a3;
- (void)metalRenderFrameWithContext:(id)a3;
- (void)metalTeardownAnimationsWithContext:(id)a3;
- (void)renderFrameWithContext:(id)a3;
- (void)teardown;
@end

@implementation KNBuildAnvil

+ (id)animationName
{
  return @"com.apple.iWork.Keynote.BUKAnvil";
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
  return &off_499AA0;
}

+ (unint64_t)directionType
{
  return 8;
}

+ (id)defaultAttributes
{
  CFStringRef v4 = @"KNBuildAttributesDuration";
  v5 = &off_498FD8;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"anim-icons-builds-anvil";
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

- (CGRect)frameOfEffectWithFrame:(CGRect)a3 context:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8 = self;
  self->_drawableFrame = a3;
  CGRectGetMinX(a3);
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  CGRectGetMinY(v9);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGRectGetMaxX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRectGetMaxY(v11);
  [(KNAnimationContext *)v8->super.mAnimationContext slideRect];
  CGRectGetMinY(v12);
  [(KNAnimationContext *)v8->super.mAnimationContext slideRect];
  CGRectGetMaxY(v13);
  [(KNAnimationContext *)v8->super.mAnimationContext slideRect];
  CGRectGetMinX(v14);
  [(KNAnimationContext *)v8->super.mAnimationContext slideRect];
  CGRectGetMaxX(v15);
  v8 = (KNBuildAnvil *)((char *)v8 + 616);
  TSDRectWithPoints();
  *(CGRect *)&v8->super.super.isa = v16;
  CGRect result = CGRectIntegral(v16);
  *(CGRect *)&v8->super.super.isa = result;
  return result;
}

+ (int)rendererTypeForAnimationContext:(id)a3
{
  return 3;
}

- (void)teardown
{
  cameraShakePoints = self->_cameraShakePoints;
  if (cameraShakePoints)
  {
    free(cameraShakePoints);
    self->_cameraShakePoints = 0;
  }
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  [a3 drawableFrame];
  CGFloat x = v8.origin.x;
  CGFloat y = v8.origin.y;
  CGFloat width = v8.size.width;
  CGFloat height = v8.size.height;
  self->_drawableFrame = v8;
  CGRectGetMinX(v8);
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  CGRectGetMinY(v9);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGRectGetMaxX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRectGetMaxY(v11);
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  CGRectGetMinY(v12);
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  CGRectGetMaxY(v13);
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  CGRectGetMinX(v14);
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  CGRectGetMaxX(v15);
  self = (KNBuildAnvil *)((char *)self + 616);
  TSDRectWithPoints();
  *(CGRect *)&self->super.super.isa = v16;
  CGRect result = CGRectIntegral(v16);
  *(CGRect *)&self->super.super.isa = result;
  return result;
}

- (CGPoint)p_cameraShakePointsWithRandomGenerator:(id)a3
{
  id v4 = a3;
  cameraShakePoints = self->_cameraShakePoints;
  if (!cameraShakePoints)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    self->_cameraShakePoints = (CGPoint *)malloc_type_calloc(0x10uLL, 0xBuLL, 0x8CB475F9uLL);
    do
    {
      double v8 = ((double)(int)v7 / -10.0 + 1.0) * ((double)(int)v7 / -10.0 + 1.0);
      [v4 doubleBetween:-1.0 :1.0];
      double v10 = v8 * (v9 * 0.025) * 0.4;
      long double v11 = pow(-1.0, (double)(int)v7);
      cameraShakePoints = self->_cameraShakePoints;
      p_CGFloat x = &cameraShakePoints[v6].x;
      *p_CGFloat x = v10;
      p_x[1] = v11 * 0.025 * v8;
      ++v7;
      ++v6;
    }
    while (v7 != 11);
  }

  return cameraShakePoints;
}

- (id)p_smokeSystemForTR:(id)a3 build:(id)a4 randomGenerator:(id)a5 metalContext:(id)a6
{
  if (a6)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a4;
    [a3 size];
    double v14 = v13;
    double v16 = v15;
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    double v18 = v17;
    double v20 = v19;
    [v12 duration];
    uint64_t v22 = v21;

    id v23 = +[KNBuildAnvilSmokeSystem newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildAnvilSmokeSystem, "newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", 0, v11, self->_metalSmokeShader, v10, 16.0, 16.0, 300.0, 1.0, v14, v16, v18, v20, v22);
    [(TSDTexturedRectangle *)self->_metalSmokeTexture frame];
    double v25 = v24;
    [(TSDTexturedRectangle *)self->_metalSmokeTexture frame];
    [v23 setupWithTexture:0 particleTextureSize:0 reverseDrawOrder:v25];
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (id)p_specksSystemForTR:(id)a3 build:(id)a4 randomGenerator:(id)a5 metalContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    double v14 = +[TSUAssertionHandler currentHandler];
    double v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildAnvil p_specksSystemForTR:build:randomGenerator:metalContext:]");
    double v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildAnvil.m"];
    [v14 handleFailureInFunction:v15 file:v16 lineNumber:273 description:@"invalid nil value for '%s'", "randGen"];
  }
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  double v18 = v17;
  double v20 = v19;
  [v10 frameOnCanvas];
  [v10 size];
  [v10 size];
  TSUClamp();
  if (v13)
  {
    TSDMixFloats();
    double v22 = (double)(unint64_t)v21;
    [v10 size];
    double v24 = v23;
    double v26 = v25;
    [v11 duration];
    id v28 = +[KNBuildAnvilSpecksSystem newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildAnvilSpecksSystem, "newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", 0, v12, self->_metalSpecksShader, v13, 16.0, 16.0, v22, 1.0, v24, v26, v18, v20, v27);
    [(TSDTexturedRectangle *)self->_metalSpecksTexture frame];
    double v30 = v29;
    [(TSDTexturedRectangle *)self->_metalSpecksTexture frame];
    [v28 setupWithTexture:0 particleTextureSize:0 reverseDrawOrder:v30 v31];
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

- (CGPoint)p_objectTranslationAtPercent:(double)a3 duration:(double)a4 objectSmashDuration:(double)a5 objectFrame:(CGRect)a6 randomGenerator:(id)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat rect = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v12 = a7;
  if (a4 * 0.5 <= 0.25) {
    double v13 = a4 * 0.5;
  }
  else {
    double v13 = 0.25;
  }
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  double v15 = v14;
  if (!v12)
  {
    double v16 = +[TSUAssertionHandler currentHandler];
    double v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildAnvil p_objectTranslationAtPercent:duration:objectSmashDuration:objectFrame:randomGenerator:]");
    double v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildAnvil.m"];
    [v16 handleFailureInFunction:v17 file:v18 lineNumber:315 description:@"invalid nil value for '%s'", "randGen"];
  }
  CGFloat v20 = CGPointZero.x;
  double y = CGPointZero.y;
  [(KNBuildAnvil *)self p_cameraShakePointsWithRandomGenerator:v12];
  double v21 = -(a5 - a3 * a4) / v13;
  if (v21 > 0.0 && v21 < 1.0)
  {
    TSDMixFloats();
    TSDMixFloats();
    TSDAddPoints();
    CGFloat v20 = v23;
    double y = v24;
  }
  TSUClamp();
  double v26 = v25;
  v34.origin.CGFloat x = x;
  v34.size.CGFloat width = width;
  v34.origin.double y = rect;
  v34.size.CGFloat height = height;
  double v27 = y + (1.0 - v26 * v26) * (v15 + CGRectGetMaxY(v34) + self->_drawableFrame.origin.y + 5.0);

  double v28 = v20;
  double v29 = v27;
  result.double y = v29;
  result.CGFloat x = v28;
  return result;
}

- (void)renderFrameWithContext:(id)a3
{
}

- (id)p_texturedRectFromImagePath:(id)a3 metalContext:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[TSUImage imageWithContentsOfFile:a3];
  id v7 = [v6 CGImage];

  id v8 = [objc_alloc((Class)TSDTexturedRectangle) initWithCGImage:v7];
  double v9 = [v5 device];

  [v8 setupMetalTextureForDevice:v9];

  return v8;
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 textures];
  v66 = [v4 animatedBuild];
  uint64_t v6 = [v4 metalContext];
  id v7 = [v6 device];
  id v8 = [v5 objectAtIndexedSubscript:0];
  [v8 frameOnCanvas];
  -[KNBuildAnvil frameOfEffectWithFrame:context:](self, "frameOfEffectWithFrame:context:", v4);

  [v4 drawableFrame];
  self->_drawableFrame.origin.CGFloat x = v9;
  self->_drawableFrame.origin.double y = v10;
  self->_drawableFrame.size.CGFloat width = v11;
  self->_drawableFrame.size.CGFloat height = v12;
  if ([v5 count] != (char *)&dword_0 + 1)
  {
    double v13 = +[TSUAssertionHandler currentHandler];
    double v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildAnvil metalPrepareAnimationWithContext:]");
    double v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildAnvil.m"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 385, @"Effect expects one texture. Passed (%lu) textures.", objc_msgSend(v5, "count"));
  }
  double v16 = [v5 lastObject];
  double v17 = KNBundle();
  uint64_t v18 = [v17 pathForResource:@"KNBuildAnvil-Smoke" ofType:@"png"];

  v65 = (void *)v18;
  double v19 = [(KNBuildAnvil *)self p_texturedRectFromImagePath:v18 metalContext:v6];
  metalSmokeTexture = self->_metalSmokeTexture;
  self->_metalSmokeTexture = v19;

  double v21 = KNBundle();
  double v22 = [v21 pathForResource:@"KNBuildAnvil-Specks" ofType:@"png"];

  double v23 = [(KNBuildAnvil *)self p_texturedRectFromImagePath:v22 metalContext:v6];
  metalSpecksTexture = self->_metalSpecksTexture;
  self->_metalSpecksTexture = v23;

  [v16 frameOnCanvas];
  double v26 = v25;
  double v28 = v27;
  double y = CGPointZero.y;
  double v30 = TSDRectUnit[0];
  double v31 = TSDRectUnit[1];
  double v32 = TSDRectUnit[2];
  double v33 = TSDRectUnit[3];
  CGRect v34 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:v7 textureRect:CGPointZero.x device:y];
  metalObjectDataBuffer = self->_metalObjectDataBuffer;
  self->_metalObjectDataBuffer = v34;

  if ([v4 isMotionBlurred])
  {
    v36 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:addTransparentBorder:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:addTransparentBorder:device:", 1, 1, 1, v7, CGPointZero.x, y, v26, v28, v30, v31, v32, v33, TSDGPUDataBufferMeshSizeDefault[0], TSDGPUDataBufferMeshSizeDefault[1]);
    metalBlurDataBuffer = self->_metalBlurDataBuffer;
    self->_metalBlurDataBuffer = v36;
  }
  id v38 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v38, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));
  [v38 setBlendingEnabled:1];
  [v38 setDestinationRGBBlendFactor:5];
  [v38 setDestinationAlphaBlendFactor:5];
  v39 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"buildAnvilSmokeVertexShader" fragmentShader:@"buildAnvilSmokeFragmentShader" device:v7 library:@"KeynoteMetalLibrary" colorAttachment:v38];
  metalSmokeShader = self->_metalSmokeShader;
  self->_metalSmokeShader = v39;

  v41 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"buildAnvilSpecksVertexShader" fragmentShader:@"buildAnvilSpecksFragmentShader" device:v7 library:@"KeynoteMetalLibrary" colorAttachment:v38];
  metalSpecksShader = self->_metalSpecksShader;
  self->_metalSpecksShader = v41;

  v43 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initDefaultTextureAndOpacityShaderWithDevice:v7 colorAttachment:v38];
  metalObjectShader = self->_metalObjectShader;
  self->_metalObjectShader = v43;

  if ([v4 isMotionBlurred])
  {
    v45 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initDefaultSingleDirectionMotionBlurShaderWithDevice:v7 colorAttachment:v38];
    metalObjectBlurShader = self->_metalObjectBlurShader;
    self->_metalObjectBlurShader = v45;

    [v16 size];
    float64_t v64 = v47;
    [v16 size];
    float64_t v63 = v48;
    [v16 size];
    double v62 = 1.0 / v49;
    [v16 size];
    v50.f64[0] = v62;
    v50.f64[1] = 1.0 / v51;
    v52.f64[0] = v64;
    v52.f64[1] = v63;
    *(float32x4_t *)&self->_anon_1e0[16] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v52), v50);
  }
  v53 = [v4 randomGenerator];
  v54 = [(KNBuildAnvil *)self p_smokeSystemForTR:v16 build:v66 randomGenerator:v53 metalContext:v6];
  smokeSystem = self->_smokeSystem;
  self->_smokeSystem = v54;

  v56 = [(KNBuildAnvil *)self p_specksSystemForTR:v16 build:v66 randomGenerator:v53 metalContext:v6];
  specksSystem = self->_specksSystem;
  self->_specksSystem = v56;

  [(KNAnimationEffect *)self mvpMatrixWithContext:v4];
  *(_OWORD *)&self->_baseTransform.m31 = v71;
  *(_OWORD *)&self->_baseTransform.m33 = v72;
  *(_OWORD *)&self->_baseTransform.m41 = v73;
  *(_OWORD *)&self->_baseTransform.m43 = v74;
  *(_OWORD *)&self->_baseTransform.m11 = v67;
  *(_OWORD *)&self->_baseTransform.m13 = v68;
  *(_OWORD *)&self->_baseTransform.m21 = v69;
  *(_OWORD *)&self->_baseTransform.m23 = v70;
  float32x4_t v58 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m11), *(float64x2_t *)&self->_baseTransform.m13);
  float32x4_t v59 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m21), *(float64x2_t *)&self->_baseTransform.m23);
  float32x4_t v60 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m31), *(float64x2_t *)&self->_baseTransform.m33);
  float32x4_t v61 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m41), *(float64x2_t *)&self->_baseTransform.m43);
  *(float32x4_t *)self->_anon_190 = v58;
  *(float32x4_t *)&self->_anon_190[16] = v59;
  *(float32x4_t *)&self->_anon_190[32] = v60;
  *(float32x4_t *)&self->_anon_190[48] = v61;
  *(float32x4_t *)&self->_anon_1e0[32] = v58;
  *(float32x4_t *)&self->_anon_1e0[48] = v59;
  *(float32x4_t *)&self->_anon_1e0[64] = v60;
  *(float32x4_t *)&self->_anon_1e0[80] = v61;
}

- (CATransform3D)p_orthoTransformWithScale:(SEL)a3 offset:(double)a4
{
  double y = a5.y;
  CGFloat x = a5.x;
  TSDMultiplySizeScalar();
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  TSDTransform3DMakeOrtho();
  long long v8 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v17.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v17.m33 = v8;
  long long v9 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v17.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v17.m43 = v9;
  long long v10 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v17.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v17.m13 = v10;
  long long v11 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v17.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v17.m23 = v11;
  CGPoint result = CATransform3DTranslate(&v18, &v17, x, -y, 0.0);
  long long v13 = *(_OWORD *)&v18.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v18.m31;
  *(_OWORD *)&retstr->m33 = v13;
  long long v14 = *(_OWORD *)&v18.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v18.m41;
  *(_OWORD *)&retstr->m43 = v14;
  long long v15 = *(_OWORD *)&v18.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v18.m11;
  *(_OWORD *)&retstr->m13 = v15;
  long long v16 = *(_OWORD *)&v18.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v18.m21;
  *(_OWORD *)&retstr->m23 = v16;
  return result;
}

- (void)metalRenderFrameWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 textures];
  uint64_t v6 = [v4 animatedBuild];
  [v4 percent];
  double v8 = v7;
  long long v9 = [v5 lastObject];
  long long v10 = [v4 metalContext];
  long long v11 = [v10 renderEncoder];

  if (!v11)
  {
    CGFloat v12 = +[TSUAssertionHandler currentHandler];
    long long v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildAnvil metalRenderFrameWithContext:]");
    long long v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildAnvil.m"];
    [v12 handleFailureInFunction:v13 file:v14 lineNumber:474 description:@"invalid nil value for '%s'", "renderEncoder"];
  }
  [v6 duration];
  double v16 = v15;
  double v17 = v15 * 0.4;
  if (v17 <= 0.2) {
    double v18 = v17;
  }
  else {
    double v18 = 0.2;
  }
  [v9 frameOnCanvas];
  double v20 = v19;
  double v21 = [v4 metalContext];
  double v22 = [v9 metalTextureWithContext:v21];

  if (v22)
  {
    [v11 setFragmentTexture:v22 atIndex:0];
    if (v8 <= 0.999)
    {
      double v75 = v20;
      long long v81 = *(_OWORD *)&self->_baseTransform.m13;
      long long v83 = *(_OWORD *)&self->_baseTransform.m11;
      long long v77 = *(_OWORD *)&self->_baseTransform.m23;
      long long v79 = *(_OWORD *)&self->_baseTransform.m21;
      long long v71 = *(_OWORD *)&self->_baseTransform.m33;
      long long v73 = *(_OWORD *)&self->_baseTransform.m31;
      long long v69 = *(_OWORD *)&self->_baseTransform.m41;
      CGFloat m43 = self->_baseTransform.m43;
      CGFloat m44 = self->_baseTransform.m44;
      uint64_t v25 = [v4 randomGenerator];
      [v9 frameOnCanvas];
      -[KNBuildAnvil p_objectTranslationAtPercent:duration:objectSmashDuration:objectFrame:randomGenerator:](self, "p_objectTranslationAtPercent:duration:objectSmashDuration:objectFrame:randomGenerator:", v25, v8, v16, v18, v26, v27, v28, v29);
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      TSUClamp();
      double v35 = v34;
      [v9 frameOnCanvas];
      v76 = (void *)v25;
      -[KNBuildAnvil p_objectTranslationAtPercent:duration:objectSmashDuration:objectFrame:randomGenerator:](self, "p_objectTranslationAtPercent:duration:objectSmashDuration:objectFrame:randomGenerator:", v25, v35, v16, v18, v36, v37, v38, v39);
      TSDSubtractPoints();
      float64_t v65 = v41;
      float64_t v67 = v40;
      char v42 = TSDNearlyEqualPoints();
      v43.f64[0] = v67;
      v43.f64[1] = v65;
      *(float32x2_t *)self->_anon_1e0 = vcvt_f32_f64(v43);
      *(_OWORD *)&v86.m11 = v83;
      *(_OWORD *)&v86.m13 = v81;
      *(_OWORD *)&v86.m21 = v79;
      *(_OWORD *)&v86.m23 = v77;
      *(_OWORD *)&v86.m31 = v73;
      *(_OWORD *)&v86.m33 = v71;
      *(_OWORD *)&v86.m41 = v69;
      v86.CGFloat m43 = m43;
      v86.CGFloat m44 = m44;
      CATransform3DTranslate(&v87, &v86, v31, v33, 0.0);
      long long v72 = *(_OWORD *)&v87.m11;
      long long v74 = *(_OWORD *)&v87.m13;
      float32x4_t v84 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v87.m11), *(float64x2_t *)&v87.m13);
      long long v68 = *(_OWORD *)&v87.m21;
      long long v70 = *(_OWORD *)&v87.m23;
      float32x4_t v82 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v87.m21), *(float64x2_t *)&v87.m23);
      long long v64 = *(_OWORD *)&v87.m31;
      long long v66 = *(_OWORD *)&v87.m33;
      float32x4_t v80 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v87.m31), *(float64x2_t *)&v87.m33);
      long long v62 = *(_OWORD *)&v87.m41;
      long long v63 = *(_OWORD *)&v87.m43;
      float32x4_t v78 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v87.m41), *(float64x2_t *)&v87.m43);
      [v9 singleTextureOpacity];
      *(float32x4_t *)self->_anon_190 = v84;
      *(float32x4_t *)&self->_anon_190[16] = v82;
      *(float32x4_t *)&self->_anon_190[32] = v80;
      *(float32x4_t *)&self->_anon_190[48] = v78;
      *(float *)&double v44 = v44;
      self->_objectFragmentUniforms.Opacitdouble y = *(float *)&v44;
      *(float32x4_t *)&self->_anon_1e0[32] = v84;
      *(float32x4_t *)&self->_anon_1e0[48] = v82;
      *(float32x4_t *)&self->_anon_1e0[64] = v80;
      *(float32x4_t *)&self->_anon_1e0[80] = v78;
      self->_blurFragmentUniforms.Opacitdouble y = *(float *)&v44;
      if ((v42 & 1) != 0 || ![v4 isMotionBlurred])
      {
        p_metalObjectShader = &self->_metalObjectShader;
        [(TSDMetalShader *)self->_metalObjectShader setPipelineStateWithEncoder:v11 vertexBytes:self->_anon_190 fragmentBytes:&self->_objectFragmentUniforms];
        v46 = &OBJC_IVAR___KNBuildAnvil__metalObjectDataBuffer;
      }
      else
      {
        p_metalObjectShader = &self->_metalObjectBlurShader;
        [(TSDMetalShader *)self->_metalObjectBlurShader setPipelineStateWithEncoder:v11 vertexBytes:self->_anon_1e0 fragmentBytes:&self->_blurFragmentUniforms];
        v46 = &OBJC_IVAR___KNBuildAnvil__metalBlurDataBuffer;
      }
      [*(id *)((char *)&self->super.super.isa + *v46) drawWithEncoder:v11 atIndex:[p_metalObjectShader bufferIndex]];
      TSUClamp();
      double v48 = v47;
      *(_OWORD *)&v87.m11 = v72;
      *(_OWORD *)&v87.m13 = v74;
      *(_OWORD *)&v87.m21 = v68;
      *(_OWORD *)&v87.m23 = v70;
      *(_OWORD *)&v87.m31 = v64;
      *(_OWORD *)&v87.m33 = v66;
      *(_OWORD *)&v87.m41 = v62;
      *(_OWORD *)&v87.CGFloat m43 = v63;
      CATransform3DTranslate(&v85, &v87, 0.0, v48 * (v75 / -7.0 * 0.5 * v48), 0.0);
      $C1DFD4E0A10081BF298E754D91354697 v49 = ($C1DFD4E0A10081BF298E754D91354697)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v85.m11), *(float64x2_t *)&v85.m13);
      float32x4_t v50 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v85.m21), *(float64x2_t *)&v85.m23);
      float32x4_t v51 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v85.m31), *(float64x2_t *)&v85.m33);
      float32x4_t v52 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v85.m41), *(float64x2_t *)&v85.m43);
      double v53 = 1.0 - v48 * v48;
      if (v48 == 0.0) {
        double v53 = 0.0;
      }
      float v54 = v48;
      float v55 = v53;
      *(float *)&self->_anon_30[56] = v54;
      *(float *)&self->_anon_30[60] = v55;
      self->_smokeUniforms = v49;
      *(float32x4_t *)self->_anon_30 = v50;
      *(float32x4_t *)&self->_anon_30[16] = v51;
      *(float32x4_t *)&self->_anon_30[32] = v52;
      [(KNBuildAnvilSmokeSystem *)self->_smokeSystem speedMax];
      *(float *)&double v56 = v56;
      *(_DWORD *)&self->_anon_30[52] = LODWORD(v56);
      [(KNBuildAnvilSmokeSystem *)self->_smokeSystem rotationMax];
      *(float *)&double v57 = v57;
      *(_DWORD *)&self->_anon_30[48] = LODWORD(v57);
      [(TSDMetalShader *)self->_metalSmokeShader setPipelineStateWithEncoder:v11 vertexBytes:&self->_smokeUniforms];
      float32x4_t v58 = [(TSDTexturedRectangle *)self->_metalSmokeTexture metalTexture];
      [v11 setFragmentTexture:v58 atIndex:0];

      [(KNBuildAnvilSmokeSystem *)self->_smokeSystem drawMetalWithEncoder:v11];
      if (v48 < 0.5)
      {
        *(float32x4_t *)&self->_specksUniforms.SpeedMaCGFloat x = v84;
        *(float32x4_t *)&self->_anon_9c[4] = v82;
        *(float32x4_t *)&self->_anon_9c[20] = v80;
        *(float32x4_t *)&self->_anon_9c[36] = v78;
        TSUSineMap();
        TSUClamp();
        *(float *)&double v59 = v59;
        *(float *)&self->_anon_9c[56] = v54;
        *(_DWORD *)&self->_anon_9c[60] = LODWORD(v59);
        [(KNBuildAnvilSpecksSystem *)self->_specksSystem speedMax];
        *(float *)&double v60 = v60;
        *(_DWORD *)&self->_anon_9c[52] = LODWORD(v60);
        [(TSDMetalShader *)self->_metalSpecksShader setPipelineStateWithEncoder:v11 vertexBytes:&self->_specksUniforms];
        float32x4_t v61 = [(TSDTexturedRectangle *)self->_metalSpecksTexture metalTexture];
        [v11 setFragmentTexture:v61 atIndex:0];

        [(KNBuildAnvilSpecksSystem *)self->_specksSystem drawMetalWithEncoder:v11];
      }
    }
    else
    {
      [(TSDMetalShader *)self->_metalObjectShader setPipelineStateWithEncoder:v11 vertexBytes:self->_anon_190 fragmentBytes:&self->_objectFragmentUniforms];
      [(TSDMTLDataBuffer *)self->_metalObjectDataBuffer drawWithEncoder:v11 atIndex:[(TSDMetalShader *)self->_metalObjectShader bufferIndex]];
    }
  }
}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  metalSmokeShader = self->_metalSmokeShader;
  self->_metalSmokeShader = 0;

  metalSpecksShader = self->_metalSpecksShader;
  self->_metalSpecksShader = 0;

  metalObjectShader = self->_metalObjectShader;
  self->_metalObjectShader = 0;

  metalObjectBlurShader = self->_metalObjectBlurShader;
  self->_metalObjectBlurShader = 0;

  metalObjectDataBuffer = self->_metalObjectDataBuffer;
  self->_metalObjectDataBuffer = 0;

  metalBlurDataBuffer = self->_metalBlurDataBuffer;
  self->_metalBlurDataBuffer = 0;

  [(TSDTexturedRectangle *)self->_metalSmokeTexture teardown];
  [(TSDTexturedRectangle *)self->_metalSpecksTexture teardown];
  cameraShakePoints = self->_cameraShakePoints;
  if (cameraShakePoints)
  {
    free(cameraShakePoints);
    self->_cameraShakePoints = 0;
  }
}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  if ((a6 - 1) <= 1 && a8 <= 0x174876E7FFLL && a7)
  {
    id v12 = [*a3 mutableCopy];
    [v12 setObject:&__kCFBooleanFalse forKeyedSubscript:@"KNBuildCustomAttributesMotionBlur"];
    id v13 = v12;
    *a3 = v13;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalBlurDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalObjectDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalObjectBlurShader, 0);
  objc_storeStrong((id *)&self->_metalObjectShader, 0);
  objc_storeStrong((id *)&self->_metalSpecksTexture, 0);
  objc_storeStrong((id *)&self->_metalSpecksShader, 0);
  objc_storeStrong((id *)&self->_specksSystem, 0);
  objc_storeStrong((id *)&self->_metalSmokeTexture, 0);
  objc_storeStrong((id *)&self->_metalSmokeShader, 0);

  objc_storeStrong((id *)&self->_smokeSystem, 0);
}

@end