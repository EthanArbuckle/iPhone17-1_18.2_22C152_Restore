@interface KNBuildFlame
+ (BOOL)requiresSingleTexturePerStage;
+ (id)animationFilter;
+ (id)animationName;
+ (id)defaultAttributes;
+ (id)supportedTypes;
+ (id)thumbnailImageNameForType:(int)a3;
+ (int)animationCategory;
+ (unint64_t)directionType;
- (CATransform3D)p_orthoTransformWithScale:(SEL)a3 offset:(double)a4;
- (CGRect)frameOfEffectWithContext:(id)a3;
- (id)p_flameSystemForTR:(id)a3 build:(id)a4 randomGenerator:(id)a5 metalContext:(id)a6;
- (id)p_texturedRectFromImagePath:(id)a3 metalContext:(id)a4;
- (void)metalAnimationHasBegunWithContext:(id)a3;
- (void)metalAnimationWillBeginWithContext:(id)a3;
- (void)metalPrepareAnimationWithContext:(id)a3;
- (void)metalRenderFrameWithContext:(id)a3;
- (void)metalTeardownAnimationsWithContext:(id)a3;
- (void)p_prepareAnimationWithContext:(id)a3;
- (void)renderFrameWithContext:(id)a3;
- (void)teardown;
@end

@implementation KNBuildFlame

+ (id)animationName
{
  return @"com.apple.iWork.Keynote.KLNFlame";
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
  return &off_499830;
}

+ (unint64_t)directionType
{
  return 8;
}

+ (id)defaultAttributes
{
  CFStringRef v4 = @"KNBuildAttributesDuration";
  v5 = &off_498F48;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"anim-icons-builds-flame";
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

- (void)teardown
{
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  CFStringRef v4 = [a3 textures];
  v5 = [v4 objectAtIndexedSubscript:0];

  [v5 frameOnCanvas];
  self->_drawableFrame.origin.CGFloat x = v6;
  self->_drawableFrame.origin.CGFloat y = v7;
  self->_drawableFrame.size.CGFloat width = v8;
  self->_drawableFrame.size.CGFloat height = v9;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  TSDRectWithSize();
  TSDCenterRectOverRect();
  self->_frameRect.origin.CGFloat x = v10;
  self->_frameRect.origin.CGFloat y = v11;
  self->_frameRect.size.CGFloat width = v12;
  self->_frameRect.size.CGFloat height = v13;
  self->_frameRect.origin.CGFloat y = v11 + (v13 - self->_drawableFrame.size.height) * -0.25;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  v29.origin.CGFloat x = v14;
  v29.origin.CGFloat y = v15;
  v29.size.CGFloat width = v16;
  v29.size.CGFloat height = v17;
  CGRect v26 = CGRectIntersection(self->_frameRect, v29);
  self->_frameRect = v26;
  CGRect v27 = CGRectIntegral(v26);
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;
  self->_frameRect = v27;

  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (id)p_flameSystemForTR:(id)a3 build:(id)a4 randomGenerator:(id)a5 metalContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    CGFloat v14 = +[TSUAssertionHandler currentHandler];
    CGFloat v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFlame p_flameSystemForTR:build:randomGenerator:metalContext:]");
    CGFloat v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFlame.m"];
    [v14 handleFailureInFunction:v15 file:v16 lineNumber:180 description:@"invalid nil value for '%s'", "randGen"];
  }
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  [v11 duration];
  double v18 = v17;
  [v10 size];
  double v20 = v19;
  [v10 size];
  if (v13)
  {
    unint64_t v22 = (unint64_t)((v18 + fmax(v18 * -0.5 + 1.0, 0.0)) * (double)(unint64_t)(v20 / v21 * 150.0));
    [v10 size];
    id v23 = +[KNBuildFlameSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildFlameSystem, "newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", v22, 0, v12, self->_metalFlameShader, v13);
    [(TSDTexturedRectangle *)self->_metalFlameTexture size];
  }
  else
  {
    id v23 = 0;
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  [v23 setupWithTexture:v10 particleTextureSize:0 reverseDrawOrder:width height];

  return v23;
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
  CGRect result = CATransform3DTranslate(&v18, &v17, x, -y, 0.0);
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

- (void)renderFrameWithContext:(id)a3
{
}

- (id)p_texturedRectFromImagePath:(id)a3 metalContext:(id)a4
{
  id v5 = a4;
  CGFloat v6 = +[TSUImage imageWithContentsOfFile:a3];
  id v7 = [v6 CGImage];

  id v8 = [objc_alloc((Class)TSDTexturedRectangle) initWithCGImage:v7];
  long long v9 = [v5 device];

  [v8 setupMetalTextureForDevice:v9];

  return v8;
}

- (void)p_prepareAnimationWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 textures];
  CGFloat v6 = [v4 metalContext];
  id v7 = [v6 device];
  if ([v5 count] != (char *)&dword_0 + 1)
  {
    id v8 = +[TSUAssertionHandler currentHandler];
    long long v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFlame p_prepareAnimationWithContext:]");
    long long v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFlame.m"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 254, @"Effect expects one texture. Passed (%lu) textures.", objc_msgSend(v5, "count"));
  }
  long long v11 = [v5 lastObject];
  id v12 = KNBundle();
  v69 = [v12 pathForResource:@"KNBuildFlame" ofType:@"png"];

  long long v13 = [(KNBuildFlame *)self p_texturedRectFromImagePath:v69 metalContext:v6];
  metalFlameTexture = self->_metalFlameTexture;
  self->_metalFlameTexture = v13;

  [(KNBuildFlame *)self frameOfEffectWithContext:v4];
  [(KNAnimationEffect *)self mvpMatrixWithContext:v4];
  long long v15 = *(_OWORD *)&v74.m33;
  *(_OWORD *)&self->_baseTransform.m31 = *(_OWORD *)&v74.m31;
  *(_OWORD *)&self->_baseTransform.m33 = v15;
  long long v16 = *(_OWORD *)&v74.m43;
  *(_OWORD *)&self->_baseTransform.m41 = *(_OWORD *)&v74.m41;
  *(_OWORD *)&self->_baseTransform.m43 = v16;
  long long v17 = *(_OWORD *)&v74.m13;
  *(_OWORD *)&self->_baseTransform.m11 = *(_OWORD *)&v74.m11;
  *(_OWORD *)&self->_baseTransform.m13 = v17;
  long long v18 = *(_OWORD *)&v74.m23;
  *(_OWORD *)&self->_baseTransform.m21 = *(_OWORD *)&v74.m21;
  *(_OWORD *)&self->_baseTransform.m23 = v18;
  [v11 frameOnCanvas];
  double v67 = v19 - CGRectGetMinX(self->_frameRect);
  [v11 frameOnCanvas];
  double v21 = v20 - CGRectGetMaxY(self->_frameRect);
  v68 = v5;
  CGRect frameRect = self->_frameRect;
  CGFloat v22 = self->_drawableFrame.origin.y - frameRect.origin.y;
  double MaxY = CGRectGetMaxY(frameRect);
  double v66 = v21 + MaxY - CGRectGetMaxY(self->_drawableFrame) - v22;
  [v11 frameOnCanvas];
  double v25 = v24;
  double v27 = v26;
  double y = CGPointZero.y;
  id v29 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  [v29 setPixelFormat:[v6 pixelFormat]];
  [v29 setBlendingEnabled:1];
  [v29 setSourceRGBBlendFactor:1];
  [v29 setSourceAlphaBlendFactor:1];
  [v29 setDestinationRGBBlendFactor:5];
  [v29 setDestinationAlphaBlendFactor:5];
  v30 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initDefaultTextureAndOpacityShaderWithDevice:v7 colorAttachment:v29];
  metalObjectShader = self->_metalObjectShader;
  self->_metalObjectShader = v30;

  v32 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v7, CGPointZero.x, y, v25, v27, TSDRectUnit[0], TSDRectUnit[1], TSDRectUnit[2], TSDRectUnit[3]);
  metalObjectDataBuffer = self->_metalObjectDataBuffer;
  self->_metalObjectDataBuffer = v32;

  float32x4_t v34 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m21), *(float64x2_t *)&self->_baseTransform.m23);
  float32x4_t v35 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m31), *(float64x2_t *)&self->_baseTransform.m33);
  float32x4_t v36 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m41), *(float64x2_t *)&self->_baseTransform.m43);
  *(float32x4_t *)self->_anon_160 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m11), *(float64x2_t *)&self->_baseTransform.m13);
  *(float32x4_t *)&self->_anon_160[16] = v34;
  *(float32x4_t *)&self->_anon_160[32] = v35;
  *(float32x4_t *)&self->_anon_160[48] = v36;
  v37 = v4;
  id v38 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v38, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));
  [v38 setBlendingEnabled:1];
  [v38 setSourceRGBBlendFactor:4];
  [v38 setSourceAlphaBlendFactor:4];
  [v38 setDestinationRGBBlendFactor:1];
  [v38 setDestinationAlphaBlendFactor:1];
  v39 = [objc_alloc((Class)TSDMetalRenderTarget) initWithSize:v6 metalContext:self->_frameRect.size.width, self->_frameRect.size.height];
  fboRenderTarget = self->_fboRenderTarget;
  self->_fboRenderTarget = v39;

  v41 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"buildFlameVertexShader" fragmentShader:@"buildFlameFragmentShader" device:v7 library:@"KeynoteMetalLibrary" colorAttachment:v38];
  metalFlameShader = self->_metalFlameShader;
  self->_metalFlameShader = v41;

  v43 = [v37 animatedBuild];
  v44 = [v37 randomGenerator];
  v45 = [(KNBuildFlame *)self p_flameSystemForTR:v11 build:v43 randomGenerator:v44 metalContext:v6];
  flameSystem = self->_flameSystem;
  self->_flameSystem = v45;

  [v11 frameOnCanvas];
  [v11 frameOnCanvas];
  double height = self->_frameRect.size.height;
  [(KNAnimationContext *)self->super.mAnimationContext fieldOfViewInRadians];
  long double v49 = tan(v48 * 0.5);
  long double v50 = height / (v49 + v49);
  memset(&v74, 0, sizeof(v74));
  [(KNAnimationContext *)self->super.mAnimationContext fieldOfViewInRadians];
  TSDTransform3DMakeProjection();
  memset(&v73, 0, sizeof(v73));
  CATransform3DMakeTranslation(&v73, v67 - self->_frameRect.size.width * 0.5, -self->_frameRect.size.height - self->_frameRect.origin.y + self->_frameRect.origin.y - v66, -v50);
  CATransform3D a = v73;
  CATransform3D b = v74;
  CATransform3DConcat(&v72, &a, &b);
  CATransform3D v74 = v72;
  float32x4_t v51 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v72.m21), *(float64x2_t *)&v72.m23);
  float32x4_t v52 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v72.m31), *(float64x2_t *)&v72.m33);
  float32x4_t v53 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v72.m41), *(float64x2_t *)&v72.m43);
  *(float32x4_t *)&self->_flameUniforms.RotationMaCGFloat x = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v72.m11), *(float64x2_t *)&v72.m13);
  *(float32x4_t *)&self->_flameUniforms.Duration = v51;
  *(float32x4_t *)&self->_anon_34[12] = v52;
  *(float32x4_t *)&self->_anon_34[28] = v53;
  [(KNBuildFlameSystem *)self->_flameSystem speedMax];
  *(float *)&double v54 = v54;
  *(_DWORD *)&self->_anon_34[48] = LODWORD(v54);
  [(KNBuildFlameSystem *)self->_flameSystem rotationMax];
  *(float *)&double v55 = v55;
  *(_DWORD *)&self->_anon_34[44] = LODWORD(v55);
  [(KNBuildFlameSystem *)self->_flameSystem duration];
  *(float *)&double v56 = v56;
  *(_DWORD *)&self->_anon_34[60] = LODWORD(v56);
  v57 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initDefaultTextureShaderWithDevice:v7 colorAttachment:v29];
  metalFboShader = self->_metalFboShader;
  self->_metalFboShader = v57;

  TSDRectWithSize();
  v59 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v7);
  metalFboDataBuffer = self->_metalFboDataBuffer;
  self->_metalFboDataBuffer = v59;

  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  memset(&v72, 0, sizeof(v72));
  TSDTransform3DMakeOrtho();
  CGFloat x = self->_frameRect.origin.x;
  CGFloat v62 = self->_frameRect.origin.y - self->_frameRect.size.height * 0.5;
  CATransform3D b = v72;
  CATransform3DTranslate(&a, &b, x, v62, 0.0);
  CATransform3D v72 = a;
  float32x4_t v63 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a.m21), *(float64x2_t *)&a.m23);
  float32x4_t v64 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a.m31), *(float64x2_t *)&a.m33);
  float32x4_t v65 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a.m41), *(float64x2_t *)&a.m43);
  *(float32x4_t *)self->_anon_1c0 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a.m11), *(float64x2_t *)&a.m13);
  *(float32x4_t *)&self->_anon_1c0[16] = v63;
  *(float32x4_t *)&self->_anon_1c0[32] = v64;
  *(float32x4_t *)&self->_anon_1c0[48] = v65;
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  id v6 = a3;
  id v4 = [v6 animatedBuild];
  unsigned int v5 = [v4 isBuildIn];

  if (v5) {
    [(KNBuildFlame *)self p_prepareAnimationWithContext:v6];
  }
}

- (void)metalAnimationWillBeginWithContext:(id)a3
{
  id v4 = a3;
  [(KNBuildFlame *)self metalPrepareAnimationWithContext:v4];
  [(KNBuildFlame *)self metalAnimationHasBegunWithContext:v4];
}

- (void)metalAnimationHasBegunWithContext:(id)a3
{
  id v6 = a3;
  id v4 = [v6 animatedBuild];
  unsigned int v5 = [v4 isBuildOut];

  if (v5) {
    [(KNBuildFlame *)self p_prepareAnimationWithContext:v6];
  }
}

- (void)metalRenderFrameWithContext:(id)a3
{
  id v37 = a3;
  id v4 = [v37 textures];
  unsigned int v5 = [v37 metalContext];
  [v37 percent];
  double v7 = v6;
  id v8 = [v37 animatedBuild];
  if ([v8 isBuildOut]) {
    double v9 = 1.0 - v7;
  }
  else {
    double v9 = v7;
  }
  long long v10 = [v4 lastObject];
  long long v11 = [v37 metalContext];
  id v12 = [v11 renderEncoder];

  if (!v12)
  {
    long long v13 = +[TSUAssertionHandler currentHandler];
    long long v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFlame metalRenderFrameWithContext:]");
    +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFlame.m"];
    v16 = long long v15 = v5;
    [v13 handleFailureInFunction:v14 file:v16 lineNumber:392 description:@"invalid nil value for '%s'", "renderEncoder"];

    unsigned int v5 = v15;
  }
  if ([v8 isBuildOut]) {
    double v17 = 0.25;
  }
  else {
    double v17 = 0.5;
  }
  [v8 duration];
  double v19 = 1.0 / v18;
  if (v17 >= v19) {
    double v20 = v19;
  }
  else {
    double v20 = v17;
  }
  double v21 = [v37 metalContext];
  CGFloat v22 = [v10 metalTextureWithContext:v21];

  if (v22)
  {
    float32x4_t v36 = v4;
    [v12 setFragmentTexture:v22 atIndex:0];
    if (v9 > v20)
    {
      TSUSineMap();
      double v24 = v23;
      [v10 singleTextureOpacity];
      *(float *)&double v25 = v24 * v25;
      self->_objectFragmentUniforms.Opacitdouble y = *(float *)&v25;
      -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_metalObjectShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v12, self->_anon_160);
      [(TSDMTLDataBuffer *)self->_metalObjectDataBuffer drawWithEncoder:v12 atIndex:[(TSDMetalShader *)self->_metalObjectShader bufferIndex]];
    }
    BOOL v26 = v9 == 1.0 || v9 == 0.0;
    float v28 = 1.0;
    if (v26) {
      float v28 = 0.0;
    }
    float v27 = v7;
    *(float *)&self->_anon_34[52] = v27;
    *(float *)&self->_anon_34[56] = v28;
    [v5 commandQueue];
    id v29 = v35 = v5;
    v30 = [v29 commandBuffer];

    v31 = [(TSDMetalRenderTarget *)self->_fboRenderTarget passDescriptor];
    v32 = [v30 renderCommandEncoderWithDescriptor:v31];

    [(TSDMetalShader *)self->_metalFlameShader setPipelineStateWithEncoder:v32 vertexBytes:&self->_flameUniforms];
    v33 = [(TSDTexturedRectangle *)self->_metalFlameTexture metalTexture];
    [v32 setFragmentTexture:v33 atIndex:0];

    [(KNBuildFlameSystem *)self->_flameSystem drawMetalWithEncoder:v32];
    [v32 endEncoding];
    [v30 commit];
    float32x4_t v34 = [(TSDMetalRenderTarget *)self->_fboRenderTarget texture];
    [v12 setFragmentTexture:v34 atIndex:0];

    [(TSDMetalShader *)self->_metalFboShader setPipelineStateWithEncoder:v12 vertexBytes:self->_anon_1c0];
    [(TSDMTLDataBuffer *)self->_metalFboDataBuffer drawWithEncoder:v12 atIndex:[(TSDMetalShader *)self->_metalFboShader bufferIndex]];

    unsigned int v5 = v35;
    id v4 = v36;
  }
}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  metalFlameShader = self->_metalFlameShader;
  self->_metalFlameShader = 0;

  metalObjectShader = self->_metalObjectShader;
  self->_metalObjectShader = 0;

  metalObjectDataBuffer = self->_metalObjectDataBuffer;
  self->_metalObjectDataBuffer = 0;

  [(TSDTexturedRectangle *)self->_metalFlameTexture teardown];
  metalFlameTexture = self->_metalFlameTexture;
  self->_metalFlameTexture = 0;

  metalFboShader = self->_metalFboShader;
  self->_metalFboShader = 0;

  metalFboDataBuffer = self->_metalFboDataBuffer;
  self->_metalFboDataBuffer = 0;

  fboRenderTarget = self->_fboRenderTarget;
  self->_fboRenderTarget = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fboRenderTarget, 0);
  objc_storeStrong((id *)&self->_metalFboDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalFboShader, 0);
  objc_storeStrong((id *)&self->_metalObjectDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalObjectShader, 0);
  objc_storeStrong((id *)&self->_metalFlameShader, 0);
  objc_storeStrong((id *)&self->_metalFlameTexture, 0);

  objc_storeStrong((id *)&self->_flameSystem, 0);
}

@end