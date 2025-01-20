@interface KNTransitionDroplet
+ (id)animationFilter;
+ (id)animationName;
+ (id)defaultAttributes;
+ (id)supportedTypes;
+ (id)thumbnailImageNameForType:(int)a3;
+ (int)animationCategory;
+ (unint64_t)directionType;
- (KNTransitionDroplet)initWithAnimationContext:(id)a3;
- (void)animationWillBeginWithContext:(id)a3;
- (void)dealloc;
- (void)p_drawWithMetalContext:(id)a3 renderEncoder:(id)a4;
- (void)p_teardown;
- (void)renderFrameWithContext:(id)a3;
@end

@implementation KNTransitionDroplet

- (KNTransitionDroplet)initWithAnimationContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KNTransitionDroplet;
  return [(KNAnimationEffect *)&v4 initWithAnimationContext:a3];
}

- (void)p_teardown
{
  self->_metalDrawBuffer = 0;
  self->_rippleShader = 0;
}

- (void)dealloc
{
  [(KNTransitionDroplet *)self p_teardown];
  v3.receiver = self;
  v3.super_class = (Class)KNTransitionDroplet;
  [(KNTransitionDroplet *)&v3 dealloc];
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
  return &off_499980;
}

+ (id)animationName
{
  return @"apple:droplet";
}

+ (unint64_t)directionType
{
  return 8;
}

+ (id)defaultAttributes
{
  CFStringRef v3 = @"KNTransitionAttributesDuration";
  objc_super v4 = &off_498F78;
  return +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"kn-mac-anim-icons-trans-droplet";
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v5 = [a3 textures];
  id v6 = objc_msgSend(objc_msgSend(a3, "metalContext"), "device");
  id v7 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v7, "setPixelFormat:", objc_msgSend(objc_msgSend(a3, "metalContext"), "pixelFormat"));
  self->_rippleShader = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"transitionDropletVertexShader" fragmentShader:@"transitionDropletFragmentShader" device:v6 library:@"KeynoteMetalLibrary" colorAttachment:v7];
  id v8 = [v5 objectAtIndexedSubscript:0];
  [v8 size];
  TSDRectWithSize();
  self->_metalDrawBuffer = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v6);
  mAnimationContext = self->super.mAnimationContext;
  if (mAnimationContext)
  {
    [(KNAnimationContext *)mAnimationContext slideProjectionMatrix];
    float32x4_t v10 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v24), v25);
    float32x4_t v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v22), v23);
    float32x4_t v12 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v20), v21);
    float32x4_t v13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v18), v19);
  }
  else
  {
    float32x4_t v13 = 0uLL;
    float64x2_t v24 = 0u;
    float64x2_t v25 = 0u;
    float64x2_t v22 = 0u;
    float64x2_t v23 = 0u;
    float64x2_t v20 = 0u;
    float64x2_t v21 = 0u;
    float32x4_t v12 = 0uLL;
    float32x4_t v11 = 0uLL;
    float32x4_t v10 = 0uLL;
    float64x2_t v18 = 0u;
    float64x2_t v19 = 0u;
  }
  *(float32x4_t *)self->_anon_70 = v13;
  *(float32x4_t *)&self->_anon_70[16] = v12;
  *(float32x4_t *)&self->_anon_70[32] = v11;
  *(float32x4_t *)&self->_anon_70[48] = v10;
  [v8 size:*(_OWORD *)&v18, *(_OWORD *)&v19, *(_OWORD *)&v20, *(_OWORD *)&v21, *(_OWORD *)&v22, *(_OWORD *)&v23, *(_OWORD *)&v24, *(_OWORD *)&v25];
  *(float *)&double v14 = v14;
  anon_b0 = self->_anon_b0;
  *(_DWORD *)anon_b0 = LODWORD(v14);
  [v8 size];
  float v17 = v16;
  *((float *)anon_b0 + 1) = v17;
  *(_OWORD *)(anon_b0 + 8) = xmmword_344A10;
  *((void *)anon_b0 + 3) = 0x40C0000041200000;
}

- (void)p_drawWithMetalContext:(id)a3 renderEncoder:(id)a4
{
  id v7 = [a3 textures];
  [a3 percent];
  double v9 = v8;
  id v10 = [v7[1] metalTexture];
  id v11 = objc_msgSend(objc_msgSend(v7, "objectAtIndexedSubscript:", 0), "metalTexture");
  id v12 = objc_msgSend(objc_msgSend(a3, "metalContext"), "currentBuffer");
  float v13 = v9;
  self->_fragmentInput[(void)v12].percent = v13;
  [a4 setFragmentBytes:length:atIndex:];
  [a4 setFragmentTexture:v11 atIndex:0];
  [a4 setFragmentTexture:v10 atIndex:1];
  metalDrawBuffer = self->_metalDrawBuffer;

  [(TSDMTLDataBuffer *)metalDrawBuffer drawWithEncoder:a4 atIndex:0];
}

- (void)renderFrameWithContext:(id)a3
{
  id v5 = [a3 metalContext];
  id v6 = [v5 device];
  id v7 = [v5 commandBuffer];
  id v8 = [v5 passDescriptor];
  id v9 = [v5 renderEncoder];
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionDroplet renderFrameWithContext:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionDroplet.m") lineNumber:219 description:@"invalid nil value for '%s'", "device"];
    if (v7)
    {
LABEL_3:
      if (v8) {
        goto LABEL_4;
      }
LABEL_10:
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionDroplet renderFrameWithContext:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionDroplet.m") lineNumber:221 description:@"invalid nil value for '%s'", "passDescriptor"];
      if (v9) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KNTransitionDroplet renderFrameWithContext:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionDroplet.m"] lineNumber:220 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"commandBuffer"];
  if (!v8) {
    goto LABEL_10;
  }
LABEL_4:
  if (v9) {
    goto LABEL_5;
  }
LABEL_11:
  [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KNTransitionDroplet renderFrameWithContext:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionDroplet.m"] lineNumber:222 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"renderEncoder"];
LABEL_5:
  [(TSDMetalShader *)self->_rippleShader setPipelineStateWithEncoder:v9 vertexBytes:self->_anon_70 fragmentBytes:self->_anon_b0];

  [(KNTransitionDroplet *)self p_drawWithMetalContext:a3 renderEncoder:v9];
}

@end