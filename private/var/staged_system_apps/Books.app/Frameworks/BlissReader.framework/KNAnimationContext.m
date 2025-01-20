@interface KNAnimationContext
- (BOOL)isBaseLayerVisible;
- (CALayer)baseLayer;
- (CALayer)showLayer;
- (CATransform3D)slideProjectionMatrix;
- (CGRect)slideRect;
- (CGRect)unscaledSlideRect;
- (KNAnimationContext)initWithShowSize:(CGSize)a3 viewScale:(double)a4 baseLayer:(id)a5 isBaseLayerVisible:(BOOL)a6;
- (TSDCapabilities)capabilities;
- (double)fieldOfViewInRadians;
- (double)pixelAspectRatio;
- (double)showScale;
- (double)viewScale;
- (void)dealloc;
- (void)setPixelAspectRatio:(double)a3;
@end

@implementation KNAnimationContext

- (KNAnimationContext)initWithShowSize:(CGSize)a3 viewScale:(double)a4 baseLayer:(id)a5 isBaseLayerVisible:(BOOL)a6
{
  v32.receiver = self;
  v32.super_class = (Class)KNAnimationContext;
  v9 = [(KNAnimationContext *)&v32 init];
  if (v9)
  {
    TSDRectWithSize();
    v9->mUnscaledSlideRect.origin.x = v10;
    v9->mUnscaledSlideRect.origin.y = v11;
    v9->mUnscaledSlideRect.size.width = v12;
    v9->mUnscaledSlideRect.size.double height = v13;
    v9->mViewScale = a4;
    [a5 bounds];
    v9->mSlideRect.origin.x = v14;
    v9->mSlideRect.origin.y = v15;
    v9->mSlideRect.size.width = v16;
    v9->mSlideRect.size.double height = v17;
    v9->mBaseLayer = (CALayer *)[objc_alloc((Class)CALayer) initWithLayer:a5];
    [a5 bounds];
    -[CALayer setBounds:](v9->mBaseLayer, "setBounds:");
    [a5 position];
    -[CALayer setPosition:](v9->mBaseLayer, "setPosition:");
    v9->mBaseLayerVisible = a6;
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(CALayer *)v9->mBaseLayer setSublayers:0];
    [(CALayer *)v9->mBaseLayer setName:@"Show base layer"];
    [(CALayer *)v9->mBaseLayer setMasksToBounds:1];
    [(CALayer *)v9->mBaseLayer setEdgeAntialiasingMask:0];
    +[CATransaction commit];
    v9->mFOVInRadians = 0.34906585;
    double height = v9->mSlideRect.size.height;
    [(KNAnimationContext *)v9 fieldOfViewInRadians];
    long double v20 = tan(v19 * 0.5);
    long double v21 = height / (v20 + v20);
    memset(&v31, 0, sizeof(v31));
    [(KNAnimationContext *)v9 fieldOfViewInRadians];
    TSDTransform3DMakeProjection();
    memset(&v30, 0, sizeof(v30));
    CATransform3DMakeTranslation(&v30, v9->mSlideRect.size.width * -0.5 - v9->mSlideRect.origin.x, v9->mSlideRect.size.height * -0.5 - v9->mSlideRect.origin.y, -v21);
    CATransform3D a = v30;
    CATransform3D v27 = v31;
    CATransform3DConcat(&v29, &a, &v27);
    long long v22 = *(_OWORD *)&v29.m33;
    *(_OWORD *)&v9->mSlideProjectionMatrix.m31 = *(_OWORD *)&v29.m31;
    *(_OWORD *)&v9->mSlideProjectionMatrix.m33 = v22;
    long long v23 = *(_OWORD *)&v29.m43;
    *(_OWORD *)&v9->mSlideProjectionMatrix.m41 = *(_OWORD *)&v29.m41;
    *(_OWORD *)&v9->mSlideProjectionMatrix.m43 = v23;
    long long v24 = *(_OWORD *)&v29.m13;
    *(_OWORD *)&v9->mSlideProjectionMatrix.m11 = *(_OWORD *)&v29.m11;
    *(_OWORD *)&v9->mSlideProjectionMatrix.m13 = v24;
    long long v25 = *(_OWORD *)&v29.m23;
    *(_OWORD *)&v9->mSlideProjectionMatrix.m21 = *(_OWORD *)&v29.m21;
    *(_OWORD *)&v9->mSlideProjectionMatrix.m23 = v25;
    v9->mPixelAspectRatio = 1.0;
    v9->mCapabilities = (TSDCapabilities *)objc_alloc_init((Class)TSDCapabilities);
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)KNAnimationContext;
  [(KNAnimationContext *)&v3 dealloc];
}

- (double)showScale
{
  v2 = [(KNAnimationContext *)self baseLayer];
  if (!v2) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationContext showScale]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimationContext.m") lineNumber:128 description:@"invalid nil value for '%s'", "baseLayer"];
  }
  id v3 = [(CALayer *)v2 valueForKeyPath:@"transform.scale.x"];
  id v4 = [(CALayer *)v2 valueForKeyPath:@"transform.scale.y"];
  v5 = v4;
  if (v3)
  {
    if (v4) {
      goto LABEL_5;
    }
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationContext showScale]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimationContext.m") lineNumber:131 description:@"invalid nil value for '%s'", "xscale"];
    if (v5) {
      goto LABEL_5;
    }
  }
  [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KNAnimationContext showScale]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimationContext.m"] lineNumber:132 description:[NSString stringWithFormat:@"invalid nil value for '%s'", "yscale"];
LABEL_5:
  [v3 tsu_CGFloatValue];
  double v7 = v6;
  [v5 tsu_CGFloatValue];
  if (v7 >= v8) {
    double v8 = v7;
  }
  return fmin(v8, 1.0);
}

- (CGRect)slideRect
{
  double x = self->mSlideRect.origin.x;
  double y = self->mSlideRect.origin.y;
  double width = self->mSlideRect.size.width;
  double height = self->mSlideRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)unscaledSlideRect
{
  double x = self->mUnscaledSlideRect.origin.x;
  double y = self->mUnscaledSlideRect.origin.y;
  double width = self->mUnscaledSlideRect.size.width;
  double height = self->mUnscaledSlideRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CALayer)baseLayer
{
  return self->mBaseLayer;
}

- (BOOL)isBaseLayerVisible
{
  return self->mBaseLayerVisible;
}

- (double)fieldOfViewInRadians
{
  return self->mFOVInRadians;
}

- (CATransform3D)slideProjectionMatrix
{
  long long v3 = *(_OWORD *)&self[1].m23;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[1].m21;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self[1].m33;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m31;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self->m43;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m41;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self[1].m13;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (double)pixelAspectRatio
{
  return self->mPixelAspectRatio;
}

- (void)setPixelAspectRatio:(double)a3
{
  self->mPixelAspectRatio = a3;
}

- (double)viewScale
{
  return self->mViewScale;
}

- (TSDCapabilities)capabilities
{
  return self->mCapabilities;
}

- (CALayer)showLayer
{
  return self->_showLayer;
}

@end