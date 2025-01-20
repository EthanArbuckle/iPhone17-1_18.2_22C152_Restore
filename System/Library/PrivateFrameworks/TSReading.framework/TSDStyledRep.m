@interface TSDStyledRep
- (BOOL)canDrawShadowInOneStepWithChildren:(BOOL)a3;
- (BOOL)isInvisible;
- (BOOL)shouldHideSelectionHighlightDueToRectangularPath;
- (BOOL)shouldShowReflection;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)shouldShowShadow;
- (CALayer)reflectionLayer;
- (CALayer)shadowLayer;
- (CGImage)newShadowImageWithSize:(CGSize)a3 shadow:(id)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6;
- (CGImage)newShadowImageWithSize:(CGSize)a3 unflipped:(BOOL)a4 withChildren:(BOOL)a5;
- (CGImage)p_newReflectionImageWithSize:(CGSize)a3 applyOpacity:(BOOL)a4 viewScale:(double)a5 withBlock:(id)a6;
- (CGRect)clipRect;
- (CGRect)p_clipRectInRootForTransform:(CGAffineTransform *)a3;
- (CGRect)p_rectWithEffectsAppliedToRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4;
- (CGRect)rectWithEffectsAppliedToRect:(CGRect)a3;
- (CGRect)reflectionLayerFrame;
- (CGRect)reflectionLayerFrameInRoot;
- (NSString)description;
- (TSDReflection)reflection;
- (TSDShadow)shadow;
- (double)opacity;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)additionalLayersUnderLayer;
- (id)pathSourceForSelectionHighlightBehavior;
- (id)styledInfo;
- (id)textureForContext:(id)a3;
- (void)createReflectionLayer;
- (void)dealloc;
- (void)didUpdateEffectLayersForLayer:(id)a3;
- (void)disposeReflectionLayer;
- (void)drawGradientWithAlphaOverReflection:(CGContext *)a3 applyingOpacity:(BOOL)a4 reflectionSize:(CGSize)a5;
- (void)drawInContext:(CGContext *)a3;
- (void)drawInContextWithoutEffects:(CGContext *)a3;
- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8;
- (void)drawInContextWithoutEffectsForAlphaOnly:(CGContext *)a3;
- (void)drawInContextWithoutEffectsOrChildren:(CGContext *)a3;
- (void)drawInContextWithoutEffectsOrChildrenForAlphaOnly:(CGContext *)a3;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)drawReflectionInContext:(CGContext *)a3 drawChildren:(BOOL)a4;
- (void)drawReflectionInContext:(CGContext *)a3 withTransparencyLayer:(BOOL)a4 applyingOpacity:(BOOL)a5 shouldClipGradient:(BOOL)a6 withBlock:(id)a7;
- (void)drawReflectionIntoReflectionFrameInContext:(CGContext *)a3 withTransparencyLayer:(BOOL)a4 applyingOpacity:(BOOL)a5 drawChildren:(BOOL)a6;
- (void)drawShadowInContext:(CGContext *)a3 withChildren:(BOOL)a4 withDrawableOpacity:(BOOL)a5;
- (void)invalidateShadowLayer;
- (void)p_drawReflectionInContext:(CGContext *)a3;
- (void)p_drawReflectionIntoReflectionFrameInContext:(CGContext *)a3 withTransparencyLayer:(BOOL)a4 applyingOpacity:(BOOL)a5 shouldClipGradient:(BOOL)a6 withBlock:(id)a7;
- (void)positionShadowLayer:(id)a3 forShadow:(id)a4 withNaturalBounds:(CGRect)a5;
- (void)processChangedProperty:(int)a3;
- (void)setNeedsDisplay;
- (void)viewScaleDidChange;
- (void)willUpdateEffectLayersForLayer:(id)a3;
@end

@implementation TSDStyledRep

- (void)dealloc
{
  [(CALayer *)self->mReflectionLayer setDelegate:0];

  self->mReflectionLayer = 0;
  self->mShadowLayer = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDStyledRep;
  [(TSDRep *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(TSDRep *)self info];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  id v8 = [(TSDRep *)self info];
  [(TSDRep *)self layout];
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [(TSDRep *)self layout];
  [(TSDRep *)self frameInUnscaledCanvas];
  return (NSString *)[v3 stringWithFormat:@"<%@ %p info=<%@ %p> layout=<%@ %p> frameInUnscaledCanvas=%@>", v5, self, v7, v8, v10, v11, NSStringFromCGRect(v13)];
}

- (id)styledInfo
{
  v2 = [(TSDRep *)self layout];

  return [(TSDLayout *)v2 info];
}

- (void)setNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)TSDStyledRep;
  [(TSDRep *)&v3 setNeedsDisplay];
  [(TSDStyledRep *)self invalidateShadowLayer];
  [(CALayer *)self->mReflectionLayer setNeedsDisplay];
}

- (void)viewScaleDidChange
{
  char mFlags = (char)self->mFlags;
  v4.receiver = self;
  v4.super_class = (Class)TSDStyledRep;
  [(TSDRep *)&v4 viewScaleDidChange];
  *(unsigned char *)&self->char mFlags = *(unsigned char *)&self->mFlags & 0xFE | mFlags & 1;
}

- (CGRect)clipRect
{
  [(TSDStyledRep *)self clipRectWithoutEffects];

  -[TSDStyledRep rectWithEffectsAppliedToRect:](self, "rectWithEffectsAppliedToRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)p_clipRectInRootForTransform:(CGAffineTransform *)a3
{
  [(TSDStyledRep *)self clipRectWithoutEffects];
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v11.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v11.c = v5;
  *(_OWORD *)&v11.tx = *(_OWORD *)&a3->tx;
  CGRect v13 = CGRectApplyAffineTransform(v12, &v11);
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v11.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v11.c = v6;
  *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  -[TSDStyledRep p_rectWithEffectsAppliedToRect:additionalTransform:](self, "p_rectWithEffectsAppliedToRect:additionalTransform:", &v11, v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a3, a4);
}

- (void)p_drawReflectionInContext:(CGContext *)a3
{
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  TSDSetCGContextInfo((uint64_t)a3, 0, 0, 1, 0, v5);
  [(TSDStyledRep *)self reflectionLayerFrameInRoot];
  double v7 = v6;
  objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "reflectionFrameInRoot");
  double v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(TSDCanvas *)self->super.mCanvas viewScale];
  double v17 = TSDMultiplyRectScalar(v9, v11, v13, v15, v16);
  double v19 = TSDSubtractPoints(v17, v18, v7);
  CGContextTranslateCTM(a3, v19, v20);
  [(TSDCanvas *)self->super.mCanvas viewScale];
  CGContextScaleCTM(a3, v21, v21);

  [(TSDStyledRep *)self drawReflectionIntoReflectionFrameInContext:a3 withTransparencyLayer:0 applyingOpacity:0 drawChildren:1];
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if (self->mReflectionLayer == a3)
  {
    [(TSDRep *)self i_configureFontSmoothingForContext:a4 layer:a3];
    [(TSDStyledRep *)self p_drawReflectionInContext:a4];
  }
}

- (double)opacity
{
  id v2 = [(TSDStyledRep *)self styledLayout];

  [v2 opacity];
  return result;
}

- (CGRect)rectWithEffectsAppliedToRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(TSDRep *)self layout];
  if (v8) {
    [(TSDAbstractLayout *)v8 transformInRoot];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  CGAffineTransformInvert(&v14, &v13);
  -[TSDStyledRep p_rectWithEffectsAppliedToRect:additionalTransform:](self, "p_rectWithEffectsAppliedToRect:additionalTransform:", &v14, x, y, width, height);
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (CGRect)p_rectWithEffectsAppliedToRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(TSDRep *)self info];
  if (objc_opt_respondsToSelector())
  {
    double v10 = [(TSDStyledRep *)self shadow];
    if (v10)
    {
      double v11 = v10;
      if ([(TSDShadow *)v10 isEnabled])
      {
        long long v12 = *(_OWORD *)&a4->c;
        *(_OWORD *)&v35.a = *(_OWORD *)&a4->a;
        *(_OWORD *)&v35.c = v12;
        *(_OWORD *)&v35.tdouble x = *(_OWORD *)&a4->tx;
        -[TSDShadow shadowBoundsForRect:additionalTransform:](v11, "shadowBoundsForRect:additionalTransform:", &v35, x, y, width, height);
        double x = v13;
        double y = v14;
        double width = v15;
        double height = v16;
      }
    }
  }
  if ([(TSDStyledRep *)self reflection])
  {
    objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "reflectionFrame");
    double v18 = v17;
    double v20 = v19;
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    if ([(TSDAbstractLayout *)[(TSDRep *)self layout] parent])
    {
      objc_msgSend(-[TSDAbstractLayout geometryInRoot](-[TSDAbstractLayout parent](-[TSDRep layout](self, "layout"), "parent"), "geometryInRoot"), "frame");
      double v18 = TSDAddPoints(v18, v20, v25);
      double v20 = v26;
    }
    long long v27 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v35.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v35.c = v27;
    *(_OWORD *)&v35.tdouble x = *(_OWORD *)&a4->tx;
    double v28 = v18;
    *(double *)&long long v27 = v20;
    uint64_t v29 = v22;
    uint64_t v30 = v24;
    CGRect v39 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v27 - 8), &v35);
    v36.origin.double x = x;
    v36.origin.double y = y;
    v36.size.double width = width;
    v36.size.double height = height;
    CGRect v37 = CGRectUnion(v36, v39);
    double x = v37.origin.x;
    double y = v37.origin.y;
    double width = v37.size.width;
    double height = v37.size.height;
  }
  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (TSDReflection)reflection
{
  if (self->mIsUpdatingReflectionOpacity) {
    return &self->mDynamicReflection->super;
  }
  id v3 = [(TSDStyledRep *)self styledInfo];

  return (TSDReflection *)[v3 reflection];
}

- (TSDShadow)shadow
{
  if (self->mIsUpdatingShadow) {
    return self->mDynamicShadow;
  }
  id v3 = [(TSDStyledRep *)self styledInfo];

  return (TSDShadow *)[v3 shadow];
}

- (BOOL)shouldShowReflection
{
  return objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "isInvisible") ^ 1;
}

- (BOOL)shouldShowShadow
{
  return objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "isInvisible") ^ 1;
}

- (void)createReflectionLayer
{
  id v3 = objc_alloc_init(TSDTilingLayer);
  self->mReflectionLayer = &v3->super;
  [(TSDTilingLayer *)v3 setDelegate:self];
  [(TSDTilingLayer *)v3 setDrawsInBackground:1];
  [(TSDTilingLayer *)v3 setNeedsDisplay];
  uint64_t v4 = [(TSDRep *)self tilingMode];

  [(TSDTilingLayer *)v3 setTilingMode:v4];
}

- (void)disposeReflectionLayer
{
  self->mReflectionLayer = 0;
}

- (void)willUpdateEffectLayersForLayer:(id)a3
{
  uint64_t v4 = [(TSDStyledRep *)self shadow];
  if (v4 && [(TSDShadow *)v4 isEnabled] && [(TSDStyledRep *)self shouldShowShadow])
  {
    if (!self->mShadowLayer)
    {
      self->mShadowLayer = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
      [(TSDStyledRep *)self invalidateShadowLayer];
    }
  }
  else
  {
    mShadowLayer = self->mShadowLayer;
    if (mShadowLayer)
    {

      self->mShadowLayer = 0;
    }
  }
  if ([(TSDStyledRep *)self reflection]
    && [(TSDStyledRep *)self shouldShowReflection])
  {
    if (!self->mReflectionLayer)
    {
      [(TSDStyledRep *)self createReflectionLayer];
    }
  }
  else if (self->mReflectionLayer)
  {
    [(TSDStyledRep *)self disposeReflectionLayer];
  }
}

- (BOOL)isInvisible
{
  return 0;
}

- (CGRect)reflectionLayerFrameInRoot
{
  objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "reflectionFrameInRoot");
  double v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(TSDCanvas *)self->super.mCanvas viewScale];
  double v12 = TSDMultiplyRectScalar(v4, v6, v8, v10, v11);

  return CGRectIntegral(*(CGRect *)&v12);
}

- (CGRect)reflectionLayerFrame
{
  objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "reflectionFrame");
  double v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(TSDCanvas *)self->super.mCanvas viewScale];
  double v12 = TSDMultiplyRectScalar(v4, v6, v8, v10, v11);
  double v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  if ([(TSDRep *)self parentRep])
  {
    [[(TSDRep *)self parentRep] layerFrameInScaledCanvas];
    double v20 = v19;
    double v12 = TSDAddPoints(v12, v14, v19);
    double v14 = v21;
  }
  else
  {
    double v20 = *MEMORY[0x263F001A8];
  }
  v31.origin.double x = v12;
  v31.origin.double y = v14;
  v31.size.CGFloat width = v16;
  v31.size.CGFloat height = v18;
  CGRect v32 = CGRectIntegral(v31);
  double x = v32.origin.x;
  double y = v32.origin.y;
  CGFloat width = v32.size.width;
  CGFloat height = v32.size.height;
  if ([(TSDRep *)self parentRep])
  {
    double x = TSDSubtractPoints(x, y, v20);
    double y = v26;
  }
  double v27 = x;
  double v28 = y;
  double v29 = width;
  double v30 = height;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (void)didUpdateEffectLayersForLayer:(id)a3
{
  objc_msgSend(MEMORY[0x263F158F8], "begin", a3);
  [MEMORY[0x263F158F8] setAnimationDuration:0.0];
  BOOL v4 = [(TSDStyledRep *)self isInvisible];
  mShadowLayer = self->mShadowLayer;
  if (v4)
  {
    [(CALayer *)mShadowLayer setContents:0];
  }
  else if (mShadowLayer)
  {
    CGFloat v6 = [(TSDStyledRep *)self shadow];
    if (!v6)
    {
      double v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSDStyledRep didUpdateEffectLayersForLayer:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledRep.m"), 365, @"invalid nil value for '%s'", "shadow");
    }
    if (![(TSDShadow *)v6 isEnabled])
    {
      double v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSDStyledRep didUpdateEffectLayersForLayer:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledRep.m"), 366, @"shouldn't have shadow layer if shadow is not enabled");
    }
    if (v6 && [(TSDShadow *)v6 isEnabled])
    {
      [(TSDStyledRep *)self opacity];
      double v12 = v11;
      [(TSDShadow *)v6 opacity];
      double v14 = v12 * v13;
      [(CALayer *)self->mShadowLayer opacity];
      double v16 = v15;
      if (v14 != v16)
      {
        *(float *)&double v16 = v14;
        [(CALayer *)self->mShadowLayer setOpacity:v16];
      }
      if (v14 != 0.0 && ![(CALayer *)self->mShadowLayer contents]) {
        [(TSDStyledRep *)self invalidateShadowLayer];
      }
      double v17 = self->mShadowLayer;
      objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "shadowedNaturalBoundsWithoutOffset");
      -[TSDStyledRep positionShadowLayer:forShadow:withNaturalBounds:](self, "positionShadowLayer:forShadow:withNaturalBounds:", v17, v6);
    }
  }
  if (self->mShadowLayer)
  {
    CGFloat v18 = [(TSDStyledRep *)self shadow];
    if (!v18)
    {
      double v19 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v20 = [NSString stringWithUTF8String:"-[TSDStyledRep didUpdateEffectLayersForLayer:]"];
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledRep.m"), 398, @"invalid nil value for '%s'", "shadow");
    }
    if (![(TSDShadow *)v18 isEnabled])
    {
      double v21 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v22 = [NSString stringWithUTF8String:"-[TSDStyledRep didUpdateEffectLayersForLayer:]"];
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledRep.m"), 399, @"shouldn't have shadow layer if shadow is not enabled");
    }
    if (v18 && [(TSDShadow *)v18 isEnabled])
    {
      [(TSDStyledRep *)self opacity];
      double v24 = v23;
      [(TSDShadow *)v18 opacity];
      double v26 = v24 * v25;
      [(CALayer *)self->mShadowLayer opacity];
      double v28 = v27;
      if (v26 != v28)
      {
        *(float *)&double v28 = v26;
        [(CALayer *)self->mShadowLayer setOpacity:v28];
      }
      double v29 = self->mShadowLayer;
      objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "shadowedNaturalBoundsWithoutOffset");
      -[TSDStyledRep positionShadowLayer:forShadow:withNaturalBounds:](self, "positionShadowLayer:forShadow:withNaturalBounds:", v29, v18);
    }
    if (*(unsigned char *)&self->mFlags)
    {
      [(CALayer *)self->mShadowLayer bounds];
      double v31 = v30;
      double v33 = v32;
      [(TSDRep *)self scaleToConvertNaturalToLayerRelative];
      CGAffineTransform v35 = [(TSDStyledRep *)self newShadowImageWithSize:0 unflipped:1 withChildren:TSDMultiplySizeScalar(v31, v33, 1.0 / v34)];
      [(CALayer *)self->mShadowLayer setContents:v35];
      *(unsigned char *)&self->mFlags &= ~1u;
      CGImageRelease(v35);
    }
  }
  if (self->mReflectionLayer)
  {
    [(TSDStyledRep *)self reflectionLayerFrameInRoot];
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    memset(&v53[1], 0, sizeof(CGAffineTransform));
    [(TSDRep *)self parentLayerInverseTransformInRootForZeroAnchor];
    double v44 = TSDCenterOfRect(v37, v39, v41, v43);
    CGAffineTransform v52 = v53[1];
    TSDTransformConvertForNewOrigin(&v52, v53, v44, v45);
    v53[1] = v53[0];
    -[CALayer setIfDifferentFrame:orTransform:](self->mReflectionLayer, "setIfDifferentFrame:orTransform:", v53, v37, v39, v41, v43);
    [(TSDStyledRep *)self opacity];
    double v47 = v46;
    [(TSDReflection *)[(TSDStyledRep *)self reflection] opacity];
    double v49 = v47 * v48;
    [(CALayer *)self->mReflectionLayer opacity];
    double v51 = v50;
    if (v49 != v51)
    {
      *(float *)&double v51 = v49;
      [(CALayer *)self->mReflectionLayer setOpacity:v51];
    }
  }
  [MEMORY[0x263F158F8] commit];
}

- (void)invalidateShadowLayer
{
  *(unsigned char *)&self->mFlags |= 1u;
}

- (void)positionShadowLayer:(id)a3 forShadow:(id)a4 withNaturalBounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  double x = a5.origin.x;
  [(TSDRep *)self scaleToConvertNaturalToLayerRelative];
  double v13 = v12;
  if ([a4 isDropShadow])
  {
    TSDMultiplyRectScalar(x, y, width, height, v13);
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v88 = 0u;
    [(TSDRep *)self computeDirectLayerFrame:&v91 andTransform:&v88];
    double v14 = TSDCenterOfRect(*(CGFloat *)&v91, *((CGFloat *)&v91 + 1), *(CGFloat *)&v92, *((CGFloat *)&v92 + 1));
    double v16 = v15;
    [a4 offsetDelta];
    TSDMultiplyPointScalar(v17, v18, v13);
    double v19 = TSDRoundedPoint();
    objc_msgSend(a3, "setPosition:", TSDAddPoints(v14, v16, v19));
    [a3 setBounds:TSDRectWithSize()];
    long long v85 = v88;
    long long v86 = v89;
    long long v87 = v90;
    uint64_t v20 = &v85;
  }
  else if ([a4 isContactShadow])
  {
    [(TSDShadow *)[(TSDStyledRep *)self shadow] boundsForRep:self];
    double v25 = TSDMultiplyRectScalar(v21, v22, v23, v24, v13);
    double v29 = TSDCenterOfRect(v25, v26, v27, v28);
    double v31 = v30;
    [a4 offset];
    TSDMultiplyPointScalar(0.0, v32, v13);
    double v33 = TSDRoundedPoint();
    double v34 = TSDAddPoints(v29, v31, v33);
    double v36 = v35;
    if ([(TSDRep *)self parentRep])
    {
      [[(TSDRep *)self parentRep] layerFrameInScaledCanvas];
      double v34 = v34 - v37;
      double v36 = v36 - v38;
    }
    objc_msgSend(a3, "setPosition:", v34, v36);
    [a3 setBounds:TSDRectWithSize()];
    long long v39 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v82 = *MEMORY[0x263F000D0];
    long long v83 = v39;
    long long v84 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    uint64_t v20 = &v82;
  }
  else
  {
    if (![a4 isCurvedShadow]) {
      goto LABEL_14;
    }
    objc_opt_class();
    double v40 = (void *)TSUDynamicCast();
    [(TSDShadow *)[(TSDStyledRep *)self shadow] boundsForRep:self];
    double v45 = TSDMultiplyRectScalar(v41, v42, v43, v44, v13);
    double v49 = TSDCenterOfRect(v45, v46, v47, v48);
    double v51 = v50;
    [v40 offsetFromCurve];
    [v40 curve];
    if (v52 > 0.0)
    {
      TSDAddPoints(v49, v51, 0.0);
      double v49 = TSDRoundedPoint();
      double v51 = v53;
    }
    [a4 offsetDelta];
    TSDMultiplyPointScalar(v54, v55, v13);
    double v56 = TSDRoundedPoint();
    double v57 = TSDAddPoints(v49, v51, v56);
    double v59 = v58;
    if ([(TSDRep *)self parentRep])
    {
      [[(TSDRep *)self parentRep] layerFrameInScaledCanvas];
      double v57 = v57 - v60;
      double v59 = v59 - v61;
    }
    objc_msgSend(a3, "setPosition:", v57, v59);
    [a3 setBounds:TSDRectWithSize()];
    long long v62 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v79 = *MEMORY[0x263F000D0];
    long long v80 = v62;
    long long v81 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    uint64_t v20 = &v79;
  }
  objc_msgSend(a3, "setAffineTransform:", v20, v79, v80, v81, v82, v83, v84, v85, v86, v87);
LABEL_14:
  [a3 frame];
  double v64 = v63;
  double v66 = v65;
  uint64_t v67 = [a3 superlayer];
  if (v67)
  {
    v68 = (void *)v67;
    do
    {
      [v68 frame];
      double v64 = TSDAddPoints(v64, v66, v69);
      double v66 = v70;
      v68 = (void *)[v68 superlayer];
    }
    while (v68);
  }
  [a3 position];
  double v72 = v71;
  double v74 = v73;
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  double v76 = TSDRoundedPointForScale(v64, v66, v75);
  double v78 = TSDSubtractPoints(v76, v77, v64);
  objc_msgSend(a3, "setPosition:", TSDAddPoints(v72, v74, v78));
}

- (BOOL)canDrawShadowInOneStepWithChildren:(BOOL)a3
{
  return 0;
}

- (CGImage)newShadowImageWithSize:(CGSize)a3 shadow:(id)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  return (CGImage *)objc_msgSend(a4, "newShadowImageForRep:withSize:drawSelector:unflipped:", self, a5, a6, a3.width, a3.height);
}

- (CGImage)newShadowImageWithSize:(CGSize)a3 unflipped:(BOOL)a4 withChildren:(BOOL)a5
{
  BOOL v5 = a4;
  double height = a3.height;
  double width = a3.width;
  double v9 = &selRef_drawInContextWithoutEffectsForAlphaOnly_;
  if (!a5) {
    double v9 = &selRef_drawInContextWithoutEffectsOrChildrenForAlphaOnly_;
  }
  uint64_t v10 = *v9;
  double v11 = [(TSDStyledRep *)self shadow];

  return -[TSDStyledRep newShadowImageWithSize:shadow:drawSelector:unflipped:](self, "newShadowImageWithSize:shadow:drawSelector:unflipped:", v11, v10, v5, width, height);
}

- (CGImage)p_newReflectionImageWithSize:(CGSize)a3 applyOpacity:(BOOL)a4 viewScale:(double)a5 withBlock:(id)a6
{
  BOOL v8 = a4;
  double v10 = TSDCeilSize(a3.width);
  if (v10 <= 0.0) {
    return 0;
  }
  if (v11 <= 0.0) {
    return 0;
  }
  double v12 = TSDBitmapContextCreate(11, v10);
  if (!v12) {
    return 0;
  }
  double v13 = v12;
  CGContextScaleCTM(v12, a5, a5);
  TSDSetCGContextInfo((uint64_t)v13, [(TSDCanvas *)[(TSDRep *)self canvas] isPrinting], [(TSDCanvas *)[(TSDRep *)self canvas] isDrawingIntoPDF], 0, [(TSDCanvas *)[(TSDRep *)self canvas] shouldSuppressBackgrounds], 1.0);
  [(TSDStyledRep *)self p_drawReflectionIntoReflectionFrameInContext:v13 withTransparencyLayer:0 applyingOpacity:v8 shouldClipGradient:0 withBlock:a6];
  Image = CGBitmapContextCreateImage(v13);
  CGContextRelease(v13);
  return Image;
}

- (void)drawGradientWithAlphaOverReflection:(CGContext *)a3 applyingOpacity:(BOOL)a4 reflectionSize:(CGSize)a5
{
  CGFloat height = a5.height;
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  double v9 = (double *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
  double v10 = 1.0;
  if (v6) {
    [(TSDReflection *)[(TSDStyledRep *)self reflection] opacity];
  }
  double *v9 = v10;
  [(TSDReflection *)[(TSDStyledRep *)self reflection] fadeAcceleration];
  *((void *)v9 + 1) = v11;
  *(_OWORD *)range = xmmword_22383A968;
  long long v17 = unk_22383A978;
  *(_OWORD *)domain = xmmword_2238393F0;
  CGFunctionCallbacks v15 = *(CGFunctionCallbacks *)byte_26D6871D8;
  double v12 = CGFunctionCreate(v9, 1uLL, domain, 2uLL, range, &v15);
  double v13 = (CGColorSpace *)TSUDeviceGrayColorSpace();
  v20.double x = 0.0;
  v20.CGFloat y = height;
  Axial = CGShadingCreateAxial(v13, *MEMORY[0x263F00148], v20, v12, 1, 1);
  CGContextSetBlendMode(a3, kCGBlendModeDestinationIn);
  CGContextDrawShading(a3, Axial);
  CGShadingRelease(Axial);
  CGFunctionRelease(v12);
}

- (void)p_drawReflectionIntoReflectionFrameInContext:(CGContext *)a3 withTransparencyLayer:(BOOL)a4 applyingOpacity:(BOOL)a5 shouldClipGradient:(BOOL)a6 withBlock:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v13 = [(TSDStyledRep *)self styledLayout];
  [v13 reflectionFrame];
  double v15 = v14;
  double v17 = v16;
  CGContextSaveGState(a3);
  if (v10)
  {
    v40.origin.double x = TSDRectWithSize();
    CGContextBeginTransparencyLayerWithRect(a3, v40, 0);
  }
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  double v19 = v18 * TSDCGContextAssociatedScreenScale((uint64_t)a3);
  double v20 = TSDAliasRound(v19);
  CGContextTranslateCTM(a3, 0.0, v20 / v19);
  [(TSDAbstractLayout *)[(TSDRep *)self layout] alignmentFrame];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "aliasedAlignmentFrameForScale:", v19);
  double MaxY = CGRectGetMaxY(v41);
  v42.origin.double x = v22;
  v42.origin.CGFloat y = v24;
  v42.size.double width = v26;
  v42.size.CGFloat height = v28;
  CGFloat v30 = CGRectGetMaxY(v42);
  CGContextTranslateCTM(a3, 0.0, MaxY - v30 + MaxY - v30);
  [v13 alignmentFrameInRoot];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  CGFloat v38 = v37;
  CGContextSaveGState(a3);
  CGContextTranslateCTM(a3, 0.0, v38);
  CGContextScaleCTM(a3, 1.0, -1.0);
  CGContextTranslateCTM(a3, -v32, -v34);
  if (v13) {
    [v13 transformInRoot];
  }
  else {
    memset(&v39, 0, sizeof(v39));
  }
  CGContextConcatCTM(a3, &v39);
  TSDCGContextSetIsReflection((uint64_t)a3, 1);
  (*((void (**)(id, CGContext *))a7 + 2))(a7, a3);
  TSDCGContextSetIsReflection((uint64_t)a3, 0);
  CGContextRestoreGState(a3);
  if (v8)
  {
    v43.size.double width = v36 + 2.0;
    v43.origin.double x = -1.0;
    v43.origin.CGFloat y = 0.0;
    v43.size.CGFloat height = v38;
    CGContextClipToRect(a3, v43);
  }
  -[TSDStyledRep drawGradientWithAlphaOverReflection:applyingOpacity:reflectionSize:](self, "drawGradientWithAlphaOverReflection:applyingOpacity:reflectionSize:", a3, v9, v15, v17, *(_OWORD *)&v39.a, *(_OWORD *)&v39.c, *(_OWORD *)&v39.tx);
  if (v10) {
    CGContextEndTransparencyLayer(a3);
  }
  CGContextRestoreGState(a3);
}

- (void)drawReflectionIntoReflectionFrameInContext:(CGContext *)a3 withTransparencyLayer:(BOOL)a4 applyingOpacity:(BOOL)a5 drawChildren:(BOOL)a6
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __110__TSDStyledRep_drawReflectionIntoReflectionFrameInContext_withTransparencyLayer_applyingOpacity_drawChildren___block_invoke;
  v6[3] = &unk_2646B24E8;
  v6[4] = self;
  BOOL v7 = a6;
  [(TSDStyledRep *)self p_drawReflectionIntoReflectionFrameInContext:a3 withTransparencyLayer:a4 applyingOpacity:a5 shouldClipGradient:0 withBlock:v6];
}

uint64_t __110__TSDStyledRep_drawReflectionIntoReflectionFrameInContext_withTransparencyLayer_applyingOpacity_drawChildren___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) drawInContextWithoutEffects:a2 withContent:1 withStroke:1 withOpacity:0 forAlphaOnly:0 drawChildren:*(unsigned __int8 *)(a1 + 40)];
}

- (void)drawShadowInContext:(CGContext *)a3 withChildren:(BOOL)a4 withDrawableOpacity:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v9 = [(TSDStyledRep *)self shadow];
  if (v9)
  {
    BOOL v10 = v9;
    if ([(TSDShadow *)v9 isEnabled])
    {
      if ([(TSDStyledRep *)self shouldShowShadow])
      {
        [(TSDShadow *)v10 boundsInNaturalSpaceForRep:self];
        CGFloat x = v11;
        CGFloat y = v13;
        CGFloat width = v15;
        CGFloat height = v17;
        double v19 = -[TSDStyledRep newShadowImageWithSize:unflipped:withChildren:](self, "newShadowImageWithSize:unflipped:withChildren:", 0, v6, v15, v17);
        if (v19)
        {
          double v20 = v19;
          CGContextSaveGState(a3);
          [(TSDShadow *)v10 opacity];
          double v22 = v21;
          if (v5)
          {
            [(TSDStyledRep *)self opacity];
            double v22 = v22 * v23;
          }
          if (v22 < 1.0) {
            CGContextSetAlpha(a3, v22);
          }
          if ([(TSDShadow *)v10 isDropShadow])
          {
            [(TSDShadow *)v10 offsetDelta];
            double v25 = v24;
            double v27 = v26;
            id v28 = [(TSDStyledRep *)self styledLayout];
            if (v28) {
              [v28 transformInRoot];
            }
            else {
              memset(&v64, 0, sizeof(v64));
            }
            CGAffineTransformInvert(&v65, &v64);
            double v46 = TSDDeltaApplyAffineTransform((float64x2_t *)&v65, v25, v27);
            CGFloat v48 = v47;
            v66.origin.CGFloat x = x;
            v66.origin.CGFloat y = y;
            v66.size.CGFloat width = width;
            v66.size.CGFloat height = height;
            CGRect v67 = CGRectOffset(v66, v46, v48);
            CGFloat x = v67.origin.x;
            CGFloat y = v67.origin.y;
            CGFloat width = v67.size.width;
            CGFloat height = v67.size.height;
            TSDAffineTransformForFlips(0, 1, (uint64_t)v63, v67.origin.x, v67.origin.y, v67.size.width, v67.size.height);
            double v49 = (CGAffineTransform *)v63;
          }
          else
          {
            if ([(TSDShadow *)v10 isContactShadow])
            {
              objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "alignmentFrameInRoot");
              double v30 = v29;
              objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "alignmentFrameInRoot");
              CGFloat v32 = v31;
              CGFloat v34 = v33;
              double v35 = [(TSDRep *)self layout];
              if (v35) {
                [(TSDAbstractLayout *)v35 transformInRoot];
              }
              else {
                memset(&v61, 0, sizeof(v61));
              }
              CGAffineTransformInvert(&transform, &v61);
              CGContextConcatCTM(a3, &transform);
              CGContextTranslateCTM(a3, v32, v34);
              [(TSDShadow *)v10 offset];
              CGContextTranslateCTM(a3, 0.0, v30 + v50);
              CGContextTranslateCTM(a3, 0.0, v30);
              CGContextScaleCTM(a3, 1.0, -1.0);
              goto LABEL_32;
            }
            if (![(TSDShadow *)v10 isCurvedShadow])
            {
LABEL_32:
              v70.origin.CGFloat x = x;
              v70.origin.CGFloat y = y;
              v70.size.CGFloat width = width;
              v70.size.CGFloat height = height;
              CGContextDrawImage(a3, v70, v20);
              CGImageRelease(v20);
              CGContextRestoreGState(a3);
              return;
            }
            objc_opt_class();
            double v36 = (void *)TSUDynamicCast();
            [(TSDLayoutGeometry *)[(TSDAbstractLayout *)[(TSDRep *)self layout] geometry] frame];
            CGFloat v38 = v37;
            CGFloat v40 = v39;
            CGFloat v42 = v41;
            CGFloat v44 = v43;
            if ([(TSDAbstractLayout *)[(TSDRep *)self layout] parent])
            {
              double v45 = [(TSDAbstractLayout *)[(TSDRep *)self layout] parent];
              if (v45) {
                [(TSDAbstractLayout *)v45 transformInRoot];
              }
              else {
                memset(&v60, 0, sizeof(v60));
              }
              v68.origin.CGFloat x = v38;
              v68.origin.CGFloat y = v40;
              v68.size.CGFloat width = v42;
              v68.size.CGFloat height = v44;
              CGRect v69 = CGRectApplyAffineTransform(v68, &v60);
              CGFloat v38 = v69.origin.x;
              CGFloat v40 = v69.origin.y;
            }
            double v51 = [(TSDRep *)self layout];
            if (v51) {
              [(TSDAbstractLayout *)v51 transformInRoot];
            }
            else {
              memset(&v58, 0, sizeof(v58));
            }
            CGAffineTransformInvert(&v59, &v58);
            CGContextConcatCTM(a3, &v59);
            CGContextTranslateCTM(a3, v38, v40);
            [(TSDShadow *)v10 offsetDelta];
            CGFloat v53 = v52;
            [(TSDShadow *)v10 offsetDelta];
            CGContextTranslateCTM(a3, v53, v54);
            [v36 curve];
            if (v55 > 0.0)
            {
              [v36 offsetFromCurve];
              *(float *)&double v56 = v56;
              CGContextTranslateCTM(a3, 0.0, *(float *)&v56);
            }
            TSDAffineTransformForFlips(0, 1, (uint64_t)v57, x, y, width, height);
            double v49 = (CGAffineTransform *)v57;
          }
          CGContextConcatCTM(a3, v49);
          goto LABEL_32;
        }
      }
    }
  }
}

- (void)drawReflectionInContext:(CGContext *)a3 withTransparencyLayer:(BOOL)a4 applyingOpacity:(BOOL)a5 shouldClipGradient:(BOOL)a6 withBlock:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  if ([(TSDStyledRep *)self reflection]
    && [(TSDStyledRep *)self shouldShowReflection])
  {
    id v13 = [(TSDStyledRep *)self styledLayout];
    double v14 = v13;
    if (v13) {
      [v13 transformInRoot];
    }
    else {
      memset(&v31, 0, sizeof(v31));
    }
    CGAffineTransformInvert(&transform, &v31);
    CGContextConcatCTM(a3, &transform);
    [v14 reflectionFrame];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    if ([(TSDCanvas *)[(TSDRep *)self canvas] isDrawingIntoPDF])
    {
      double v23 = -[TSDStyledRep p_newReflectionImageWithSize:applyOpacity:viewScale:withBlock:](self, "p_newReflectionImageWithSize:applyOpacity:viewScale:withBlock:", v9, a7, TSDMultiplySizeScalar(v20, v22, 4.16666651));
      if (v23)
      {
        double v24 = v23;
        if ([v14 parent])
        {
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "parent"), "geometryInRoot"), "frame");
          double v16 = TSDAddPoints(v16, v18, v25);
          double v18 = v26;
        }
        v33.origin.CGFloat x = v16;
        v33.origin.CGFloat y = v18;
        v33.size.CGFloat width = v20;
        v33.size.CGFloat height = v22;
        double MinY = CGRectGetMinY(v33);
        v34.origin.CGFloat x = v16;
        v34.origin.CGFloat y = v18;
        v34.size.CGFloat width = v20;
        v34.size.CGFloat height = v22;
        CGFloat MaxY = CGRectGetMaxY(v34);
        CGContextTranslateCTM(a3, 0.0, MinY + MaxY);
        CGContextScaleCTM(a3, 1.0, -1.0);
        v35.origin.CGFloat x = v16;
        v35.origin.CGFloat y = v18;
        v35.size.CGFloat width = v20;
        v35.size.CGFloat height = v22;
        CGContextDrawImage(a3, v35, v24);
        CGImageRelease(v24);
      }
    }
    else
    {
      CGContextTranslateCTM(a3, v16, v18);
      objc_msgSend((id)objc_msgSend(v14, "parent"), "frameInRoot");
      CGContextTranslateCTM(a3, v29, v30);
      [(TSDStyledRep *)self p_drawReflectionIntoReflectionFrameInContext:a3 withTransparencyLayer:v10 applyingOpacity:v9 shouldClipGradient:v8 withBlock:a7];
    }
  }
}

- (void)drawReflectionInContext:(CGContext *)a3 drawChildren:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__TSDStyledRep_drawReflectionInContext_drawChildren___block_invoke;
  v4[3] = &unk_2646B24E8;
  v4[4] = self;
  BOOL v5 = a4;
  [(TSDStyledRep *)self drawReflectionInContext:a3 withTransparencyLayer:1 applyingOpacity:1 shouldClipGradient:0 withBlock:v4];
}

uint64_t __53__TSDStyledRep_drawReflectionInContext_drawChildren___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) drawInContextWithoutEffects:a2 withContent:1 withStroke:1 withOpacity:0 forAlphaOnly:0 drawChildren:*(unsigned __int8 *)(a1 + 40)];
}

- (void)drawInContext:(CGContext *)a3
{
  if ((objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "isInvisible") & 1) == 0)
  {
    [(TSDStyledRep *)self drawShadowInContext:a3 withChildren:1 withDrawableOpacity:1];
    [(TSDStyledRep *)self drawInContextWithoutEffects:a3 withContent:1 withStroke:1 withOpacity:1 forAlphaOnly:0 drawChildren:0];
    [(TSDStyledRep *)self opacity];
    CGFloat v6 = v5;
    if (v5 == 1.0)
    {
      [(TSDStyledRep *)self drawReflectionInContext:a3 drawChildren:1];
    }
    else
    {
      CGContextSaveGState(a3);
      CGContextSetAlpha(a3, v6);
      [(TSDStyledRep *)self drawReflectionInContext:a3 drawChildren:1];
      CGContextRestoreGState(a3);
    }
  }
}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8
{
  BOOL v8 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4, a5, a6, a7, a8);
  uint64_t v9 = [NSString stringWithUTF8String:"-[TSDStyledRep drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:]"];
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledRep.m"), 911, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSDStyledRep drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:]"), 0 reason userInfo]);
}

- (void)drawInContextWithoutEffects:(CGContext *)a3
{
}

- (void)drawInContextWithoutEffectsOrChildren:(CGContext *)a3
{
}

- (void)drawInContextWithoutEffectsForAlphaOnly:(CGContext *)a3
{
}

- (void)drawInContextWithoutEffectsOrChildrenForAlphaOnly:(CGContext *)a3
{
}

- (void)processChangedProperty:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDStyledRep;
  -[TSDRep processChangedProperty:](&v5, sel_processChangedProperty_);
  if (a3 == 518 || a3 == 520)
  {
    if (self->mIsUpdatingShadow) {
      [(TSDStyledRep *)self invalidateShadowLayer];
    }
  }
  else
  {
    if (a3 != 519) {
      return;
    }
    [(CALayer *)self->mReflectionLayer setNeedsDisplay];
  }
  [(TSDCanvas *)self->super.mCanvas layoutInvalidated];
}

- (id)additionalLayersUnderLayer
{
  if (!self->mShadowLayer && !self->mReflectionLayer) {
    return 0;
  }
  double v3 = (void *)[MEMORY[0x263EFF980] array];
  if (self->mShadowLayer && [(TSDStyledRep *)self shouldShowShadow]) {
    [v3 addObject:self->mShadowLayer];
  }
  if (self->mReflectionLayer && [(TSDStyledRep *)self shouldShowReflection]) {
    [v3 addObject:self->mReflectionLayer];
  }
  return v3;
}

- (BOOL)shouldHideSelectionHighlightDueToRectangularPath
{
  id v3 = [(TSDLayout *)[(TSDRep *)self layout] i_wrapPath];
  if (!v3)
  {
    BOOL v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDStyledRep shouldHideSelectionHighlightDueToRectangularPath]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledRep.m"), 987, @"invalid nil value for '%s'", "wrapPath");
  }
  if (objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "stroke")
    && objc_msgSend((id)objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "stroke"), "isFrame")&& (objc_msgSend((id)objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "stroke"), "hasMask") & 1) != 0|| -[TSDInteractiveCanvasController usesAlternateDrawableSelectionHighlight](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "usesAlternateDrawableSelectionHighlight"))
  {
    goto LABEL_7;
  }
  if ([v3 isRectangular]) {
    goto LABEL_9;
  }
  objc_opt_class();
  [(TSDStyledRep *)self pathSourceForSelectionHighlightBehavior];
  CGFloat v6 = (void *)TSUDynamicCast();
  if (!v6) {
    return (char)v6;
  }
  BOOL v7 = v6;
  if ([v6 type]
    || ([v7 scalar],
        double v9 = v8,
        [(TSDCanvas *)[(TSDRep *)self canvas] viewScale],
        v9 * v10 >= 10.0))
  {
LABEL_7:
    LOBYTE(v6) = 0;
  }
  else
  {
LABEL_9:
    LOBYTE(v6) = 1;
  }
  return (char)v6;
}

- (BOOL)shouldShowSelectionHighlight
{
  v5.receiver = self;
  v5.super_class = (Class)TSDStyledRep;
  BOOL v3 = [(TSDRep *)&v5 shouldShowSelectionHighlight];
  if (v3) {
    LOBYTE(v3) = ![(TSDStyledRep *)self shouldHideSelectionHighlightDueToRectangularPath];
  }
  return v3;
}

- (id)pathSourceForSelectionHighlightBehavior
{
  return 0;
}

- (id)textureForContext:(id)a3
{
  if (![(TSDRep *)self texture]
    || ![a3 isEqual:self->super.mTextureContext]
    || [(TSDRep *)self temporaryMixingLayout])
  {
    uint64_t v5 = [a3 isMagicMove];
    int v6 = [a3 shouldAddMagicMoveObjectOnly];
    char v7 = [a3 shouldNotAddContainedReps];
    double v8 = objc_msgSend(-[TSDStyledRep styledInfo](self, "styledInfo"), "shadow");
    [(TSDCanvas *)self->super.mCanvas viewScale];
    double v10 = v9;
    double v11 = objc_alloc_init(TSDTextureSet);
    [(TSDTextureSet *)v11 setIsMagicMove:v5];
    double v214 = v10;
    if (![a3 shouldSeparateShadow]
      || !v8
      || (([v8 isEnabled] ^ 1 | v6) & 1) != 0)
    {
LABEL_27:
      memset(&v231, 0, sizeof(v231));
      v124 = [(TSDRep *)self layout];
      if (v124) {
        [(TSDAbstractLayout *)v124 transformInRoot];
      }
      else {
        memset(&v231, 0, sizeof(v231));
      }
      mTextureActionAttributes = self->super.mTextureActionAttributes;
      if (mTextureActionAttributes)
      {
        uint64_t v126 = [(NSDictionary *)mTextureActionAttributes valueForKey:@"sfx-action-rotation-angle"];
        if (v126)
        {
          v127 = (void *)v126;
          [(TSDRep *)self centerForRotation];
          double v129 = v128;
          double v131 = v130;
          CGAffineTransform v229 = v231;
          CGAffineTransformTranslate(&v230, &v229, v128, v130);
          CGAffineTransform v231 = v230;
          [v127 floatValue];
          CGAffineTransform v229 = v231;
          CGAffineTransformRotate(&v230, &v229, v132 * 0.0174532925);
          CGAffineTransform v231 = v230;
          CGAffineTransform v229 = v230;
          CGAffineTransformTranslate(&v230, &v229, -v129, -v131);
          CGAffineTransform v231 = v230;
        }
      }
      if (v5)
      {
        CGAffineTransform v229 = v231;
        [(TSDRep *)self unRotatedTransform:&v229];
        CGAffineTransform v231 = v230;
      }
      char v133 = v7 ^ 1;
      [(TSDRep *)self naturalBounds];
      CGAffineTransform v230 = v231;
      CGRect v236 = CGRectApplyAffineTransform(v235, &v230);
      double v212 = TSDMultiplyRectScalar(v236.origin.x, v236.origin.y, v236.size.width, v236.size.height, v10);
      CGAffineTransform v230 = v231;
      [(TSDStyledRep *)self p_clipRectInRootForTransform:&v230];
      double x = v134;
      CGFloat y = v136;
      CGFloat width = v138;
      CGFloat height = v140;
      if (v5
        && [a3 shouldSeparateReflection]
        && [a3 shouldSeparateShadow])
      {
        [(TSDStyledRep *)self clipRectWithoutEffects];
        CGAffineTransform v230 = v231;
        CGRect v238 = CGRectApplyAffineTransform(v237, &v230);
        double x = v238.origin.x;
        CGFloat y = v238.origin.y;
        CGFloat width = v238.size.width;
        CGFloat height = v238.size.height;
      }
      [(TSDStyledRep *)self clipRectWithoutEffects];
      CGAffineTransform v230 = v231;
      CGRect v240 = CGRectApplyAffineTransform(v239, &v230);
      CGFloat v142 = v240.origin.x;
      CGFloat v143 = v240.origin.y;
      CGFloat v144 = v240.size.width;
      CGFloat v145 = v240.size.height;
      v240.origin.double x = x;
      v240.origin.CGFloat y = y;
      v240.size.CGFloat width = width;
      v240.size.CGFloat height = height;
      v250.origin.double x = v142;
      v250.origin.CGFloat y = v143;
      v250.size.CGFloat width = v144;
      v250.size.CGFloat height = v145;
      if (!CGRectEqualToRect(v240, v250))
      {
        double v146 = TSDCenterOfRect(v142, v143, v144, v145);
        double v148 = v147;
        double v149 = TSDCenterOfRect(x, y, width, height);
        double v151 = TSDMultiplySizeScalar(vabdd_f64(v149, v146), vabdd_f64(v150, v148), 2.0);
        double v152 = TSDAddSizes(width, height, v151);
        double x = TSDRectWithCenterAndSize(v146, v148, v152);
        CGFloat y = v153;
        CGFloat width = v154;
        CGFloat height = v155;
      }
      v241.origin.double x = TSDMultiplyRectScalar(x, y, width, height, v214);
      CGRect v242 = CGRectIntegral(v241);
      CGRect v243 = CGRectInset(v242, -1.0, -1.0);
      double v156 = v243.size.width;
      double v157 = v243.size.height;
      v223[0] = MEMORY[0x263EF8330];
      v223[1] = 3221225472;
      v223[2] = __34__TSDStyledRep_textureForContext___block_invoke_2;
      v223[3] = &unk_2646B2538;
      char v227 = v5;
      CGRect v224 = v243;
      double v225 = v214;
      CGAffineTransform v226 = v231;
      v223[4] = self;
      v223[5] = a3;
      char v228 = v7 ^ 1;
      double v158 = TSDSubtractPoints(v243.origin.x, v243.origin.y, v212);
      v160 = -[TSDTexturedRectangle initWithSize:offset:renderBlock:]([TSDTexturedRectangle alloc], "initWithSize:offset:renderBlock:", v223, v156, v157, v158, v159);
      [(TSDTexturedRectangle *)v160 setTextureType:5];
      [(TSDTexturedRectangle *)v160 setTextureOpacity:1.0];
      [(TSDStyledRep *)self opacity];
      -[TSDTextureSet setTextureOpacity:](v11, "setTextureOpacity:");
      [(TSDTextureSet *)v11 addRenderable:v160];

      objc_opt_class();
      [(TSDLayout *)[(TSDRep *)self layout] stroke];
      v161 = (void *)TSUDynamicCast();
      if ([a3 shouldSeparateStroke]
        && v161
        && [v161 shouldRender])
      {
        [(TSDStyledRep *)self clipRect];
        if (v5) {
          [(TSDRep *)self naturalBounds];
        }
        CGAffineTransform v230 = v231;
        CGRect v244 = CGRectApplyAffineTransform(*(CGRect *)&v162, &v230);
        v245.origin.double x = TSDMultiplyRectScalar(v244.origin.x, v244.origin.y, v244.size.width, v244.size.height, v214);
        CGRect v246 = CGRectIntegral(v245);
        CGRect v247 = CGRectInset(v246, -1.0, -1.0);
        double v166 = v247.size.width;
        double v167 = v247.size.height;
        v217[0] = MEMORY[0x263EF8330];
        v217[1] = 3221225472;
        v217[2] = __34__TSDStyledRep_textureForContext___block_invoke_3;
        v217[3] = &unk_2646B2560;
        char v221 = v5;
        v217[4] = self;
        CGRect v218 = v247;
        double v219 = v214;
        CGAffineTransform v220 = v231;
        char v222 = v133;
        double v168 = TSDSubtractPoints(v247.origin.x, v247.origin.y, v212);
        v170 = -[TSDTexturedRectangle initWithSize:offset:renderBlock:]([TSDTexturedRectangle alloc], "initWithSize:offset:renderBlock:", v217, v166, v167, v168, v169);
        [(TSDTexturedRectangle *)v170 setTextureType:8];
        [(TSDTexturedRectangle *)v170 setTextureOpacity:1.0];
        [(TSDTextureSet *)v11 addRenderable:v170];
      }
      if ([a3 shouldSeparateReflection])
      {
        v171 = [(TSDStyledRep *)self reflection];
        char v172 = v171 ? v6 : 1;
        if ((v172 & 1) == 0)
        {
          v173 = v171;
          objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "reflectionFrame");
          v248.origin.double x = TSDMultiplyRectScalar(v174, v175, v176, v177, v214);
          CGRect v249 = CGRectIntegral(v248);
          double v178 = v249.origin.x;
          double v179 = v249.origin.y;
          double v210 = v249.size.height;
          double v213 = v249.size.width;
          [(TSDRep *)self naturalBounds];
          -[TSDRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:");
          CGFloat v181 = v180;
          CGFloat v183 = v182;
          CGFloat v185 = v184;
          CGFloat v187 = v186;
          [(TSDRep *)self naturalBounds];
          double v192 = TSDCenterRectOverRect(v188, v189, v190, v191, v181, v183, v185, v187);
          double v196 = TSDMultiplyRectScalar(v192, v193, v194, v195, v214);
          double v197 = TSDSubtractPoints(v178, v179, v196);
          v215[0] = MEMORY[0x263EF8330];
          v215[1] = 3221225472;
          v215[2] = __34__TSDStyledRep_textureForContext___block_invoke_4;
          v215[3] = &unk_2646B2588;
          *(double *)&v215[5] = v178;
          *(double *)&v215[6] = v179;
          *(double *)&v215[7] = v213;
          *(double *)&v215[8] = v210;
          *(double *)&v215[9] = v214;
          v215[4] = self;
          char v216 = v133;
          v199 = -[TSDTexturedRectangle initWithSize:offset:renderBlock:]([TSDTexturedRectangle alloc], "initWithSize:offset:renderBlock:", v215, v213, v210, v197, v198);
          [(TSDTexturedRectangle *)v199 setTextureType:9];
          [(TSDReflection *)v173 opacity];
          -[TSDTexturedRectangle setTextureOpacity:](v199, "setTextureOpacity:");
          [(TSDTextureSet *)v11 addRenderable:v199];
        }
      }
      if (([a3 shouldNotCacheTexture] & 1) == 0)
      {
        [(TSDRep *)self setTexture:v11];
        [(TSDRep *)self setTextureContext:a3];
      }
      return v11;
    }
    *(_OWORD *)&v231.a = 0uLL;
    char v12 = [a3 shouldNotAddContainedReps] ^ 1;
    [(TSDShadow *)[(TSDStyledRep *)self shadow] boundsForRep:self];
    double v17 = TSDMultiplyRectScalar(v13, v14, v15, v16, v10);
    double v200 = v18;
    double v201 = v17;
    [(TSDShadow *)[(TSDStyledRep *)self shadow] boundsInNaturalSpaceForRep:self];
    CGFloat v206 = v20;
    double v208 = v19;
    CGFloat v203 = v22;
    CGFloat v204 = v21;
    double v23 = TSDMultiplyRectScalar(v19, v20, v21, v22, v10);
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v211 = TSDRectWithSize();
    double v31 = v30;
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    if ([v8 isCurvedShadow])
    {
      [(TSDRep *)self naturalBounds];
      double v40 = TSDMultiplyRectScalar(v36, v37, v38, v39, v10);
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      double v47 = TSDRectWithSize();
      double v51 = TSDCenterRectOverRect(v40, v42, v44, v46, v47, v48, v49, v50);
      CGFloat v54 = TSDRectWithOriginAndSize(v53, v51 / v27, v52 / v29, v44 / v27, v46 / v29);
      double v58 = TSDRectByExpandingBoundingRectToContentRect(v23, v25, v27, v29, v54, v55, v56, v57, 0.2, 0.3, 0.8, 0.7);
      double v61 = v60;
      double v63 = v62;
      double v211 = 0.2;
      double v31 = 0.3;
      *(double *)&uint64_t v33 = 0.8;
      *(double *)&uint64_t v202 = 0.7;
    }
    else
    {
      uint64_t v202 = v35;
      double v63 = v29;
      double v61 = v27;
      double v59 = v25;
      double v58 = v23;
    }
    v232[0] = MEMORY[0x263EF8330];
    v232[1] = 3221225472;
    v232[2] = __34__TSDStyledRep_textureForContext___block_invoke;
    v232[3] = &unk_2646B2510;
    *(double *)&v232[6] = v208;
    *(CGFloat *)&v232[7] = v206;
    *(CGFloat *)&v232[8] = v204;
    *(CGFloat *)&v232[9] = v203;
    char v233 = v12;
    v232[4] = self;
    v232[5] = v8;
    *(double *)&v232[10] = v58;
    *(double *)&v232[11] = v59;
    *(double *)&v232[12] = v61;
    *(double *)&v232[13] = v63;
    *(double *)&v232[14] = v23;
    *(double *)&v232[15] = v25;
    *(double *)&v232[16] = v27;
    *(double *)&v232[17] = v29;
    double v207 = v61;
    double v209 = *(double *)&v33;
    if ([v8 isDropShadow])
    {
      [v8 offset];
      double v65 = v31;
      double v67 = v66;
      [v8 angle];
      TSDOriginRotate(&v231.a, v67, v68 * 0.0174532925);
      double v10 = v214;
      double v69 = TSDMultiplyPointScalar(v231.a, v231.b, v214);
      v231.a = v69;
      v231.double b = v70;
      [v8 radius];
      double v72 = v69 - v71 * v214;
      double b = v231.b;
      [v8 radius];
      double v75 = b - v74 * v214;
      double v31 = v65;
    }
    else if ([v8 isContactShadow])
    {
      [v8 offset];
      double v10 = v214;
      TSDMultiplyPointScalar(0.0, v76, v214);
      double v205 = TSDRoundedPoint();
      [(TSDRep *)self naturalBounds];
      double v77 = v31;
      double v79 = v78;
      double v80 = v63;
      double v82 = v81;
      CGFloat v84 = v83;
      CGFloat v86 = v85;
      [(TSDRep *)self naturalBounds];
      -[TSDRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:");
      CGFloat v88 = v87;
      CGFloat v90 = v89;
      CGFloat v91 = v79;
      double v31 = v77;
      CGFloat v92 = v82;
      double v63 = v80;
      double v95 = TSDCenterRectOverRect(v91, v92, v84, v86, v88, v90, v93, v94);
      double v99 = TSDMultiplyRectScalar(v95, v96, v97, v98, v214);
      double v100 = TSDSubtractPoints(v201, v200, v99);
      double v72 = TSDAddPoints(v100, v101, v205);
      double v75 = v102;
    }
    else
    {
      if ([v8 isCurvedShadow])
      {
        [(TSDRep *)self naturalBounds];
        double v103 = v61;
        double v10 = v214;
        TSDMultiplyRectScalar(v104, v105, v106, v107, v214);
        double v110 = (v103 - v108) * -0.5;
        double v111 = (v63 - v109) * -0.5;
        objc_opt_class();
        v112 = (void *)TSUDynamicCast();
        [v112 curve];
        double v113 = *(double *)&v202;
        if (v114 > 0.0)
        {
          [v112 offsetFromCurve];
          double v116 = TSDMultiplyPointScalar(0.0, v115, v214);
          double v110 = TSDAddPoints(v110, v111, v116);
          double v111 = v117;
        }
        [v8 offsetDelta];
        double v120 = TSDMultiplyPointScalar(v118, v119, v214);
        double v72 = TSDAddPoints(v110, v111, v120);
        double v75 = v121;
        goto LABEL_23;
      }
      double v72 = *MEMORY[0x263F00148];
      double v75 = *(double *)(MEMORY[0x263F00148] + 8);
      double v10 = v214;
    }
    double v113 = *(double *)&v202;
LABEL_23:
    v122 = -[TSDTexturedRectangle initWithSize:offset:renderBlock:]([TSDTexturedRectangle alloc], "initWithSize:offset:renderBlock:", v232, v207, v63, v72, v75);
    if ([v8 isContactShadow]) {
      uint64_t v123 = 3;
    }
    else {
      uint64_t v123 = 2;
    }
    [(TSDTexturedRectangle *)v122 setTextureType:v123];
    [v8 opacity];
    -[TSDTexturedRectangle setTextureOpacity:](v122, "setTextureOpacity:");
    -[TSDTexturedRectangle setContentRect:](v122, "setContentRect:", v211, v31, v209, v113);
    [(TSDTextureSet *)v11 addRenderable:v122];

    goto LABEL_27;
  }

  return [(TSDRep *)self texture];
}

void __34__TSDStyledRep_textureForContext___block_invoke(uint64_t a1, CGContextRef c)
{
  CGContextSaveGState(c);
  BOOL v4 = (CGImage *)objc_msgSend(*(id *)(a1 + 32), "newShadowImageWithSize:unflipped:withChildren:", 1, *(unsigned __int8 *)(a1 + 144), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if ([*(id *)(a1 + 40) isCurvedShadow])
  {
    memset(&v29, 0, sizeof(v29));
    uint64_t v5 = (void *)[*(id *)(a1 + 32) layout];
    if (v5) {
      [v5 transformInRoot];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
    int v6 = (void *)[*(id *)(a1 + 32) layout];
    if (v6)
    {
      [v6 transformInRoot];
      double v7 = *(double *)&v25;
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v23 = 0u;
      double v7 = 0.0;
    }
    double v8 = -v7;
    double v9 = (void *)[*(id *)(a1 + 32) layout];
    if (v9)
    {
      [v9 transformInRoot];
      double v10 = *((double *)&v22 + 1);
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v20 = 0u;
      double v10 = 0.0;
    }
    CGAffineTransformMakeTranslation(&t2, v8, -v10);
    CGAffineTransformConcat(&v28, &t1, &t2);
    CGAffineTransformInvert(&v29, &v28);
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeTranslation(&v19, *(double *)(a1 + 96) * 0.5, *(double *)(a1 + 104) * 0.5);
    CGAffineTransform transform = v19;
    CGContextConcatCTM(c, &transform);
    CGAffineTransform transform = v29;
    CGContextConcatCTM(c, &transform);
    CGAffineTransform transform = v19;
    CGAffineTransformInvert(&v17, &transform);
    CGContextConcatCTM(c, &v17);
    CGFloat v11 = *(double *)(a1 + 112);
    CGFloat v12 = *(double *)(a1 + 120);
    double v13 = TSDCenterRectOverRect(*(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 104), v11, v12, *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 136));
    double v14 = TSDSubtractPoints(v11, v12, v13);
    CGAffineTransformMakeTranslation(&v16, v14, v15);
    CGContextConcatCTM(c, &v16);
  }
  else if ([*(id *)(a1 + 40) isContactShadow])
  {
    CGContextTranslateCTM(c, 0.0, *(CGFloat *)(a1 + 136));
    CGContextScaleCTM(c, 1.0, -1.0);
  }
  v30.origin.double x = TSDRectWithSize();
  CGContextDrawImage(c, v30, v4);
  CGImageRelease(v4);
  CGContextRestoreGState(c);
}

uint64_t __34__TSDStyledRep_textureForContext___block_invoke_2(uint64_t a1, CGContextRef c)
{
  CGContextSetAllowsFontSmoothing(c, 0);
  CGContextSetAllowsFontSubpixelQuantization(c, 0);
  CGContextSetShouldSubpixelQuantizeFonts(c, 0);
  if (*(unsigned char *)(a1 + 136))
  {
    BOOL v4 = (void *)[*(id *)(a1 + 32) layout];
    if (v4) {
      [v4 transformInRoot];
    }
    else {
      memset(v9, 0, sizeof(v9));
    }
    double v5 = TSDTransformAngle((double *)v9);
    TSDCGContextUpdateLayoutAngle((uint64_t)c, v5);
  }
  CGContextTranslateCTM(c, -*(double *)(a1 + 48), -*(double *)(a1 + 56));
  CGContextScaleCTM(c, *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 80));
  long long v6 = *(_OWORD *)(a1 + 104);
  *(_OWORD *)&v8.a = *(_OWORD *)(a1 + 88);
  *(_OWORD *)&v8.c = v6;
  *(_OWORD *)&v8.tdouble x = *(_OWORD *)(a1 + 120);
  CGContextConcatCTM(c, &v8);
  if (([*(id *)(a1 + 40) shouldSeparateShadow] & 1) == 0) {
    [*(id *)(a1 + 32) drawShadowInContext:c withChildren:*(unsigned __int8 *)(a1 + 137) withDrawableOpacity:0];
  }
  [*(id *)(a1 + 32) drawInContextWithoutEffects:c withContent:1 withStroke:1 withOpacity:0 forAlphaOnly:0 drawChildren:*(unsigned __int8 *)(a1 + 137)];
  uint64_t result = [*(id *)(a1 + 40) shouldSeparateReflection];
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 32) drawReflectionInContext:c drawChildren:*(unsigned __int8 *)(a1 + 137)];
  }
  return result;
}

uint64_t __34__TSDStyledRep_textureForContext___block_invoke_3(uint64_t a1, CGContextRef c)
{
  if (*(unsigned char *)(a1 + 128))
  {
    BOOL v4 = (void *)[*(id *)(a1 + 32) layout];
    if (v4) {
      [v4 transformInRoot];
    }
    else {
      memset(v9, 0, sizeof(v9));
    }
    double v5 = TSDTransformAngle((double *)v9);
    TSDCGContextUpdateLayoutAngle((uint64_t)c, v5);
  }
  CGContextTranslateCTM(c, -*(double *)(a1 + 40), -*(double *)(a1 + 48));
  CGContextScaleCTM(c, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 72));
  long long v6 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)&v8.a = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v8.c = v6;
  *(_OWORD *)&v8.tdouble x = *(_OWORD *)(a1 + 112);
  CGContextConcatCTM(c, &v8);
  CGContextSetAllowsFontSubpixelQuantization(c, 0);
  CGContextSetShouldSubpixelQuantizeFonts(c, 0);
  return [*(id *)(a1 + 32) drawInContextWithoutEffects:c withContent:0 withStroke:1 withOpacity:0 forAlphaOnly:0 drawChildren:*(unsigned __int8 *)(a1 + 129)];
}

uint64_t __34__TSDStyledRep_textureForContext___block_invoke_4(uint64_t a1, CGContextRef c)
{
  CGContextTranslateCTM(c, -*(double *)(a1 + 40), -*(double *)(a1 + 48));
  CGContextScaleCTM(c, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 72));
  BOOL v4 = (void *)[*(id *)(a1 + 32) layout];
  if (v4) {
    [v4 transformInRoot];
  }
  else {
    memset(&transform, 0, sizeof(transform));
  }
  CGContextConcatCTM(c, &transform);
  CGContextSetAllowsFontSubpixelQuantization(c, 0);
  CGContextSetShouldSubpixelQuantizeFonts(c, 0);
  double v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__TSDStyledRep_textureForContext___block_invoke_5;
  v7[3] = &unk_2646B24E8;
  v7[4] = v5;
  char v8 = *(unsigned char *)(a1 + 80);
  return [v5 drawReflectionInContext:c withTransparencyLayer:0 applyingOpacity:0 shouldClipGradient:0 withBlock:v7];
}

uint64_t __34__TSDStyledRep_textureForContext___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) drawInContextWithoutEffects:a2 withContent:1 withStroke:1 withOpacity:0 forAlphaOnly:0 drawChildren:*(unsigned __int8 *)(a1 + 40)];
}

- (CALayer)shadowLayer
{
  return self->mShadowLayer;
}

- (CALayer)reflectionLayer
{
  return self->mReflectionLayer;
}

@end