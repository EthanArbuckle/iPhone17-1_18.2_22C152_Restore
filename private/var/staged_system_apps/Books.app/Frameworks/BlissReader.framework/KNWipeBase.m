@interface KNWipeBase
+ (BOOL)isTransition;
+ (id)animationFilter;
+ (id)animationName;
+ (id)supportedTypes;
+ (int)animationCategory;
+ (unint64_t)directionType;
+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8;
+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8;
- (KNWipeBase)initWithAnimationContext:(id)a3;
- (void)animationWillBeginWithContext:(id)a3;
- (void)dealloc;
- (void)p_teardown;
- (void)renderFrameWithContext:(id)a3;
@end

@implementation KNWipeBase

- (KNWipeBase)initWithAnimationContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)KNWipeBase;
  v3 = [(KNAnimationEffect *)&v5 initWithAnimationContext:a3];
  if (v3) {
    v3->_parameterGroup = (KNAnimParameterGroup *)+[KNAnimParameterGroup parameterGroupForFile:](KNAnimParameterGroup, "parameterGroupForFile:", [KNBundle() pathForResource:@"Wipe" ofType:@"parameterGroup"]);
  }
  return v3;
}

+ (BOOL)isTransition
{
  return 0;
}

- (void)p_teardown
{
  self->mWipeDataBuffer = 0;
  self->_quadMetalShader = 0;
  self->_quadDataBuffer = 0;
}

- (void)dealloc
{
  [(KNWipeBase *)self p_teardown];
  v3.receiver = self;
  v3.super_class = (Class)KNWipeBase;
  [(KNWipeBase *)&v3 dealloc];
}

+ (id)animationName
{
  return @"apple:wipe";
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
  return &off_4998A8;
}

+ (unint64_t)directionType
{
  return 0;
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v5 = [a3 textures];
  id v6 = [a3 direction];
  uint64_t v7 = (uint64_t)v6;
  if (self->_isBuildOut) {
    uint64_t v7 = sub_938B4((uint64_t)v6);
  }
  id v8 = [v5 firstObject];
  float64x2_t v24 = 0u;
  float64x2_t v25 = 0u;
  float64x2_t v22 = 0u;
  float64x2_t v23 = 0u;
  float64x2_t v20 = 0u;
  float64x2_t v21 = 0u;
  float64x2_t v18 = 0u;
  float64x2_t v19 = 0u;
  [(KNAnimationEffect *)self mvpMatrixWithContext:a3];
  id v9 = [a3 metalContext];
  id v10 = [v9 device];
  id v11 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  [v11 setPixelFormat:[v9 pixelFormat]];
  [v11 setBlendingEnabled:1];
  [v11 setDestinationRGBBlendFactor:5];
  [v11 setDestinationAlphaBlendFactor:5];
  [v8 frame];
  TSDRectWithSize();
  v12 = +[KNWipeDataBuffer newWipeDataBufferWithVertexRect:textureRect:metalContext:colorAttachment:](KNWipeDataBuffer, "newWipeDataBufferWithVertexRect:textureRect:metalContext:colorAttachment:", v9, v11);
  self->mWipeDataBuffer = v12;
  [(KNWipeDataBuffer *)v12 setDirection:v7];
  [(KNWipeDataBuffer *)self->mWipeDataBuffer setBlurFraction:*(double *)&kKNWipeDataBufferBlurFractionTransitionDefault];
  mWipeDataBuffer = self->mWipeDataBuffer;
  v17[4] = v22;
  v17[5] = v23;
  v17[6] = v24;
  v17[7] = v25;
  v17[0] = v18;
  v17[1] = v19;
  v17[2] = v20;
  v17[3] = v21;
  [(KNWipeDataBuffer *)mWipeDataBuffer setMVPMatrix:v17];
  float32x4_t v14 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v20), v21);
  float32x4_t v15 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v22), v23);
  float32x4_t v16 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v24), v25);
  *(float32x4_t *)self->_anon_20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v18), v19);
  *(float32x4_t *)&self->_anon_20[16] = v14;
  *(float32x4_t *)&self->_anon_20[32] = v15;
  *(float32x4_t *)&self->_anon_20[48] = v16;
  if ([a3 isTransition])
  {
    [v8 frame];
    TSDRectWithSize();
    self->_quadDataBuffer = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v10);
    self->_quadMetalShader = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initDefaultTextureShaderWithDevice:v10 colorAttachment:v11];
  }
}

- (void)renderFrameWithContext:(id)a3
{
  id v5 = [a3 textures];
  [a3 percent];
  if (self->_isBuildOut) {
    double v7 = 1.0 - v6;
  }
  else {
    double v7 = v6;
  }
  if ((unint64_t)[v5 count] < 2) {
    id v8 = 0;
  }
  else {
    id v8 = [v5 objectAtIndex:0];
  }
  id v9 = [v5 lastObject];
  id v10 = [a3 metalContext];
  id v11 = [v10 device];
  id v12 = [v10 commandBuffer];
  id v13 = [v10 passDescriptor];
  id v14 = [v10 renderEncoder];
  if (v11)
  {
    if (v12) {
      goto LABEL_9;
    }
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNWipeBase renderFrameWithContext:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionWipe.m") lineNumber:200 description:@"invalid nil value for '%s'", "device"];
    if (v12)
    {
LABEL_9:
      if (v13) {
        goto LABEL_10;
      }
LABEL_19:
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KNWipeBase renderFrameWithContext:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionWipe.m"] lineNumber:202 description:[NSString stringWithFormat:@"invalid nil value for '%s'", "passDescriptor"]];
      if (v14) {
        goto LABEL_11;
      }
      goto LABEL_20;
    }
  }
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNWipeBase renderFrameWithContext:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionWipe.m") lineNumber:201 description:@"invalid nil value for '%s'", "commandBuffer"];
  if (!v13) {
    goto LABEL_19;
  }
LABEL_10:
  if (v14) {
    goto LABEL_11;
  }
LABEL_20:
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNWipeBase renderFrameWithContext:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionWipe.m") lineNumber:203 description:@"invalid nil value for '%s'", "renderEncoder"];
LABEL_11:
  id v15 = [v9 metalTexture];
  id v16 = [v8 metalTexture];
  if ([a3 isTransition])
  {
    [(TSDMetalShader *)self->_quadMetalShader setPipelineStateWithEncoder:v14 vertexBytes:self->_anon_20];
    [v14 setFragmentTexture:v16 atIndex:0];
    [(TSDMTLDataBuffer *)self->_quadDataBuffer drawWithEncoder:v14 atIndex:0];
  }
  if (v15)
  {
    [v14 setFragmentTexture:v15 atIndex:0];
    mWipeDataBuffer = self->mWipeDataBuffer;
    [v9 singleTextureOpacity];
    [(KNWipeDataBuffer *)mWipeDataBuffer drawWipeWithPercent:v14 opacity:v7 renderEncoder:v18];
  }
}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  if (a8 <= 0x174876E7FFLL && a7)
  {
    CFStringRef v11 = @"KNTransitionAttributesDirection";
    if (objc_msgSend(*a3, "objectForKey:", @"KNTransitionAttributesDirection", a4, a5, *(void *)&a6, a7)
      || [*a3 objectForKey:@"KNBuildAttributesDirection"])
    {
      if (a6 != 3) {
        CFStringRef v11 = @"KNBuildAttributesDirection";
      }
      unint64_t v12 = (unint64_t)objc_msgSend(objc_msgSend(*a3, "objectForKey:", v11), "unsignedIntegerValue") - 21;
      if (v12 > 6) {
        uint64_t v13 = 11;
      }
      else {
        uint64_t v13 = qword_344260[v12];
      }
      if (a6 == 2) {
        uint64_t v13 = sub_938B4(v13);
      }
      id v14 = [*a3 mutableCopy];
      [v14 setObject:[NSNumber numberWithUnsignedInteger:v13] forKey:v11];
      *a3 = v14;
    }
  }
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  BOOL v8 = a8 > 0x174876E7FFLL || !a7;
  if (!v8 && objc_msgSend(*a3, "objectForKey:", @"direction", a4, a5, *(void *)&a6, a7))
  {
    CFStringRef v11 = [(char *)[*a3 objectForKey:@"direction"] unsignedIntegerValue];
    if (a6 == 2) {
      CFStringRef v11 = (char *)sub_938B4((uint64_t)v11);
    }
    if ((unint64_t)(v11 - 12) > 0xC) {
      uint64_t v12 = 20;
    }
    else {
      uint64_t v12 = qword_344298[(void)(v11 - 12)];
    }
    id v13 = [*a3 mutableCopy];
    [v13 setObject:[NSNumber numberWithUnsignedInteger:v12] forKey:@"direction"];
    *a3 = v13;
  }
}

@end