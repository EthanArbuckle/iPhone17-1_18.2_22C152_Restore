@interface KNWipeEffect
- (BOOL)isBuildIn;
- (CAMediaTimingFunction)timingFunction;
- (CATransform3D)MVPMatrix;
- (KNWipeDataBuffer)wipeDataBuffer;
- (KNWipeEffect)initWithContext:(id)a3;
- (TSDMetalContext)metalContext;
- (TSDTexturedRectangle)texture;
- (double)duration;
- (double)opacity;
- (double)p_animationPercentWithPercent:(double)a3;
- (double)startWipeAtPercent;
- (double)stopWipeAtPercent;
- (unint64_t)direction;
- (void)renderEffectAtPercent:(double)a3 atBufferIndex:(unint64_t)a4 withEncoder:(id)a5;
- (void)setDirection:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setIsBuildIn:(BOOL)a3;
- (void)setMVPMatrix:(CATransform3D *)a3;
- (void)setMetalContext:(id)a3;
- (void)setOpacity:(double)a3;
- (void)setStartWipeAtPercent:(double)a3;
- (void)setStopWipeAtPercent:(double)a3;
- (void)setTexture:(id)a3;
- (void)setTimingFunction:(id)a3;
- (void)setWipeDataBuffer:(id)a3;
- (void)setupEffectIfNecessary;
- (void)teardown;
@end

@implementation KNWipeEffect

- (KNWipeEffect)initWithContext:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)KNWipeEffect;
  v5 = [(KNWipeEffect *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 metalContext];
    v7 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v6;

    *((void *)v5 + 4) = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    v8 = [v4 animatedBuild];
    v5[8] = [v8 isBuildIn];

    v9 = [v4 animatedBuild];
    *((void *)v5 + 9) = [v9 direction];

    v10 = [v4 animatedBuild];
    [v10 duration];
    *((void *)v5 + 10) = v11;

    long long v12 = *(_OWORD *)&CATransform3DIdentity.m33;
    *(_OWORD *)(v5 + 152) = *(_OWORD *)&CATransform3DIdentity.m31;
    *(_OWORD *)(v5 + 168) = v12;
    long long v13 = *(_OWORD *)&CATransform3DIdentity.m43;
    *(_OWORD *)(v5 + 184) = *(_OWORD *)&CATransform3DIdentity.m41;
    *(_OWORD *)(v5 + 200) = v13;
    long long v14 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)(v5 + 88) = *(_OWORD *)&CATransform3DIdentity.m11;
    *(_OWORD *)(v5 + 104) = v14;
    long long v15 = *(_OWORD *)&CATransform3DIdentity.m23;
    *(_OWORD *)(v5 + 120) = *(_OWORD *)&CATransform3DIdentity.m21;
    *(_OWORD *)(v5 + 136) = v15;
    *((void *)v5 + 3) = 0x3FF0000000000000;
  }

  return (KNWipeEffect *)v5;
}

- (void)setTexture:(id)a3
{
  self->_texture = (TSDTexturedRectangle *)a3;
  [a3 singleTextureOpacity];
  self->_opacity = v4;
}

- (void)setMVPMatrix:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  long long v5 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_MVPMatrix.m23 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_MVPMatrix.m21 = v5;
  *(_OWORD *)&self->_MVPMatrix.m13 = v4;
  *(_OWORD *)&self->_MVPMatrix.m11 = v3;
  long long v6 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  long long v8 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_MVPMatrix.m43 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_MVPMatrix.m41 = v8;
  *(_OWORD *)&self->_MVPMatrix.m33 = v7;
  *(_OWORD *)&self->_MVPMatrix.m31 = v6;
  wipeDataBuffer = self->_wipeDataBuffer;
  if (wipeDataBuffer)
  {
    long long v10 = *(_OWORD *)&a3->m33;
    v14[4] = *(_OWORD *)&a3->m31;
    v14[5] = v10;
    long long v11 = *(_OWORD *)&a3->m43;
    v14[6] = *(_OWORD *)&a3->m41;
    v14[7] = v11;
    long long v12 = *(_OWORD *)&a3->m13;
    v14[0] = *(_OWORD *)&a3->m11;
    v14[1] = v12;
    long long v13 = *(_OWORD *)&a3->m23;
    v14[2] = *(_OWORD *)&a3->m21;
    v14[3] = v13;
    [(KNWipeDataBuffer *)wipeDataBuffer setMVPMatrix:v14];
  }
}

- (double)p_animationPercentWithPercent:(double)a3
{
  TSUClamp();
  double v5 = fmin(fmax((v4 - self->_startWipeAtPercent) / (self->_stopWipeAtPercent - self->_startWipeAtPercent), 0.0), 1.0);
  if (!self->_isBuildIn) {
    double v5 = 1.0 - v5;
  }
  timingFunction = self->_timingFunction;

  [(CAMediaTimingFunction *)timingFunction TSD_valueAtPercent:v5];
  return result;
}

- (void)setupEffectIfNecessary
{
  if (!self->_texture)
  {
    long long v3 = +[TSUAssertionHandler currentHandler];
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNWipeEffect setupEffectIfNecessary]");
    double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNWipeDataBuffer.m"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:509 description:@"invalid nil value for '%s'", "_texture"];
  }
  if (self->_metalContext)
  {
    id v6 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
    [v6 setPixelFormat:[self->_metalContext pixelFormat]];
    [v6 setBlendingEnabled:1];
    [v6 setDestinationRGBBlendFactor:5];
    [v6 setDestinationAlphaBlendFactor:5];
    [(TSDTexturedRectangle *)self->_texture frame];
    TSDRectWithSize();
    long long v7 = +[KNWipeDataBuffer newWipeDataBufferWithVertexRect:textureRect:metalContext:colorAttachment:](KNWipeDataBuffer, "newWipeDataBufferWithVertexRect:textureRect:metalContext:colorAttachment:", self->_metalContext, v6);
    wipeDataBuffer = self->_wipeDataBuffer;
    self->_wipeDataBuffer = v7;
  }
  uint64_t v9 = 11;
  if (self->_direction == 11) {
    uint64_t v9 = 12;
  }
  if (self->_isBuildIn) {
    unint64_t direction = self->_direction;
  }
  else {
    unint64_t direction = v9;
  }
  [(KNWipeDataBuffer *)self->_wipeDataBuffer setDirection:direction];
  [(KNWipeDataBuffer *)self->_wipeDataBuffer setBlurFraction:*(double *)&kKNWipeDataBufferBlurFractionTransitionDefault];
  long long v11 = *(_OWORD *)&self->_MVPMatrix.m33;
  v15[4] = *(_OWORD *)&self->_MVPMatrix.m31;
  v15[5] = v11;
  long long v12 = *(_OWORD *)&self->_MVPMatrix.m43;
  v15[6] = *(_OWORD *)&self->_MVPMatrix.m41;
  v15[7] = v12;
  long long v13 = *(_OWORD *)&self->_MVPMatrix.m13;
  v15[0] = *(_OWORD *)&self->_MVPMatrix.m11;
  v15[1] = v13;
  long long v14 = *(_OWORD *)&self->_MVPMatrix.m23;
  v15[2] = *(_OWORD *)&self->_MVPMatrix.m21;
  v15[3] = v14;
  [(KNWipeDataBuffer *)self->_wipeDataBuffer setMVPMatrix:v15];
}

- (void)teardown
{
  self->_wipeDataBuffer = 0;
  _objc_release_x1();
}

- (void)renderEffectAtPercent:(double)a3 atBufferIndex:(unint64_t)a4 withEncoder:(id)a5
{
  id v16 = a5;
  if (!self->_metalContext)
  {
    long long v7 = +[TSUAssertionHandler currentHandler];
    long long v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNWipeEffect renderEffectAtPercent:atBufferIndex:withEncoder:]");
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNWipeDataBuffer.m"];
    [v7 handleFailureInFunction:v8 file:v9 lineNumber:537 description:@"invalid nil value for '%s'", "_metalContext"];
  }
  texture = self->_texture;
  if (!texture)
  {
    long long v11 = +[TSUAssertionHandler currentHandler];
    long long v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNWipeEffect renderEffectAtPercent:atBufferIndex:withEncoder:]");
    long long v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNWipeDataBuffer.m"];
    [v11 handleFailureInFunction:v12 file:v13 lineNumber:538 description:@"invalid nil value for '%s'", "_texture"];

    texture = self->_texture;
  }
  long long v14 = [(TSDTexturedRectangle *)texture metalTexture];
  [v16 setFragmentTexture:v14 atIndex:0];

  wipeDataBuffer = self->_wipeDataBuffer;
  [(KNWipeEffect *)self p_animationPercentWithPercent:a3];
  -[KNWipeDataBuffer drawWipeWithPercent:opacity:renderEncoder:](wipeDataBuffer, "drawWipeWithPercent:opacity:renderEncoder:", v16);
}

- (TSDTexturedRectangle)texture
{
  return self->_texture;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (CATransform3D)MVPMatrix
{
  long long v3 = *(_OWORD *)&self[1].m22;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[1].m14;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self[1].m32;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m24;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self->m42;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m34;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self[1].m12;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m44;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  self->_timingFunction = (CAMediaTimingFunction *)a3;
}

- (double)startWipeAtPercent
{
  return self->_startWipeAtPercent;
}

- (void)setStartWipeAtPercent:(double)a3
{
  self->_startWipeAtPercent = a3;
}

- (double)stopWipeAtPercent
{
  return self->_stopWipeAtPercent;
}

- (void)setStopWipeAtPercent:(double)a3
{
  self->_stopWipeAtPercent = a3;
}

- (KNWipeDataBuffer)wipeDataBuffer
{
  return self->_wipeDataBuffer;
}

- (void)setWipeDataBuffer:(id)a3
{
}

- (TSDMetalContext)metalContext
{
  return self->_metalContext;
}

- (void)setMetalContext:(id)a3
{
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_unint64_t direction = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)isBuildIn
{
  return self->_isBuildIn;
}

- (void)setIsBuildIn:(BOOL)a3
{
  self->_isBuildIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalContext, 0);

  objc_storeStrong((id *)&self->_wipeDataBuffer, 0);
}

@end