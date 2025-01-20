@interface MREffectJustASlide
- (BOOL)canMoveInDirection:(unsigned __int8)a3 withPZR:(id)a4;
- (BOOL)getVerticesCoordinates:(MREffectJustASlide *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isAlphaFriendly;
- (BOOL)isFocuser;
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MREffectJustASlide)init;
- (double)pzrCancel:(id)a3;
- (double)pzrEnd:(id)a3;
- (double)pzrStart:(id)a3;
- (double)pzrUpdate:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_cleanup;
- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)resetPZR;
- (void)setIsFocuser:(BOOL)a3;
@end

@implementation MREffectJustASlide

- (MREffectJustASlide)init
{
  v4.receiver = self;
  v4.super_class = (Class)MREffectJustASlide;
  v2 = [(MREffectJustASlide *)&v4 init];
  if (v2)
  {
    *(void *)(v2 + 185) = objc_alloc_init(MRCroppingSprite);
    *(void *)(v2 + 217) = 0x3FF0000000000000;
  }
  return (MREffectJustASlide *)v2;
}

- (void)_cleanup
{
  *(void *)(&self->super._isInInteractiveMode + 1) = 0;
}

- (BOOL)isNative3D
{
  id v2 = [(NSDictionary *)[(MRLayerEffect *)self->super.mEffectLayer slideProvidersForElementIDs] objectForKey:@"image0"];
  if (!v2) {
    return 1;
  }
  v3 = v2;
  id v4 = [v2 frame];
  if (v4)
  {
    return [v4 isNative3D];
  }
  else if ([v3 isOpaque])
  {
    return 0;
  }
  else
  {
    return [v3 hasFilters];
  }
}

- (BOOL)isOpaque
{
  id v3 = [(NSDictionary *)[(MRLayerEffect *)self->super.mEffectLayer slideProvidersForElementIDs] objectForKey:@"image0"];
  if (v3)
  {
    id v4 = v3;
    id v5 = [v3 frame];
    if (v5)
    {
      LOBYTE(v3) = [v5 isOpaque];
    }
    else
    {
      LOBYTE(v3) = ([v4 isOpaque] & 1) != 0 || BYTE1(self->mSprite) != 0;
    }
  }
  return (char)v3;
}

- (BOOL)isAlphaFriendly
{
  id v2 = [(NSDictionary *)[(MRLayerEffect *)self->super.mEffectLayer slideProvidersForElementIDs] objectForKey:@"image0"];
  if (!v2) {
    return 1;
  }
  id v3 = [v2 frame];
  if (!v3) {
    return 1;
  }
  return [v3 isAlphaFriendly];
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MREffectJustASlide;
  [(MREffect *)&v8 prerenderForTime:a4 inContext:a5 withArguments:a3];
  BYTE1(self->mSprite) = *((float *)[a4 backColor] + 3) >= 1.0;
  return BYTE1(self->_y0);
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = [(NSDictionary *)[(MRLayerEffect *)self->super.mEffectLayer slideProvidersForElementIDs] objectForKey:@"image0"];
  v10 = v9;
  if (BYTE1(self->_y0))
  {
    BYTE1(self->_y0) = 0;
    objc_msgSend(v9, "setCenter:", *(double *)(&self->mForceIsOpaque + 1), *(double *)((char *)&self->_panX + 1));
    [v10 setScale:*(double *)((char *)&self->_panY + 1)];
    [v10 setRotation:*(double *)((char *)&self->_scale + 1)];
  }
  id v11 = [v10 retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  if (v11)
  {
    v12 = v11;
    if ([v11 shader])
    {
      [*(id *)(&self->super._isInInteractiveMode + 1) setNeedsInSpriteCoordinates:1];
      unsigned int v13 = [(MREffectJustASlide *)self isOpaque];
      float v14 = *((float *)[a4 foreColor] + 3);
      if (v13 && v14 >= 1.0)
      {
        double x = CGPointZero.x;
        double y = CGPointZero.y;
      }
      else
      {
        [a4 blend:2];
        if (v14 < 1.0
          || (id v27 = objc_msgSend(objc_msgSend(v12, "shader"), "objectForKey:", @".opaqueRect")) == 0)
        {
          objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setInnerRect:", 0.0, 0.0, 1.0, 1.0);
          objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "renderImageInner:inContext:atPosition:andSize:zRotation:", v12, a4, CGPointZero.x, CGPointZero.y, 2.0, 2.0, 0.0);
          [a4 blend:0];
          goto LABEL_30;
        }
        [v27 CGRectValue];
        objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setInnerRect:");
        double x = CGPointZero.x;
        double y = CGPointZero.y;
        objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "renderImageOuter:inContext:atPosition:andSize:zRotation:", v12, a4, CGPointZero.x, y, 2.0, 2.0, 0.0);
        [a4 blend:0];
      }
      objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "renderImageInner:inContext:atPosition:andSize:zRotation:", v12, a4, x, y, 2.0, 2.0, 0.0);
LABEL_30:
      [v12 releaseByUser];
      return;
    }
    unsigned __int8 v19 = [v12 isOpaque];
    unsigned int v20 = [v12 hasKenBurns];
    unsigned int v21 = [a4 foreColorIsOpaqueWhite];
    CFStringRef v22 = @"PlainTextureHigh";
    if (v21) {
      CFStringRef v22 = @"PlainTextureHighNoColor";
    }
    CFStringRef v23 = @"PlainTextureNoColor";
    if (!v21) {
      CFStringRef v23 = @"PlainTexture";
    }
    if (v20) {
      CFStringRef v24 = v22;
    }
    else {
      CFStringRef v24 = v23;
    }
    [v12 aspectRatio];
    if (self->super._panoramaPanningOffsets)
    {
      if (v25 < 0.5 || v25 > 2.0)
      {
        if (v25 <= 2.0)
        {
          [a4 localAspectRatio];
          [v12 scale];
          [v12 centerY];
          -[MREffect valueForPanoramaPanningForElementID:value:minValue:maxValue:](self, "valueForPanoramaPanningForElementID:value:minValue:maxValue:", @"image0");
          objc_msgSend(v12, "setCenterY:");
        }
        else
        {
          [v12 scale];
          [v12 centerX];
          -[MREffect valueForPanoramaPanningForElementID:value:minValue:maxValue:](self, "valueForPanoramaPanningForElementID:value:minValue:maxValue:", @"image0");
          objc_msgSend(v12, "setCenterX:");
        }
      }
    }
    [v12 scale];
    double v28 = 1.0;
    if (v29 > 0.0)
    {
      [v12 scale];
      *(float *)&double v30 = v30;
      double v28 = *(float *)&v30;
    }
    p_mPixelSize = &self->super.mPixelSize;
    float v32 = self->super.mPixelSize.width / self->super.mPixelSize.height;
    [v12 aspectRatio];
    float v34 = v33;
    [v12 centerX];
    float v36 = (1.0 - (v35 + 1.0) * v28) * 0.5;
    [v12 centerX];
    float v38 = (1.0 - (v37 + -1.0) * v28) * 0.5;
    [v12 centerY];
    *((float *)&v69 + 1) = v32;
    double v40 = v32;
    double v41 = v28 * (v39 + 1.0) * v32;
    double v42 = v34;
    float v43 = (1.0 - v41 / v34) * 0.5;
    [v12 centerY];
    float v45 = (1.0 - v28 * (v44 + -1.0) * v40 / v42) * 0.5;
    double v46 = v36;
    BOOL v47 = v36 > 0.00001;
    if (v38 < 0.99999) {
      BOOL v47 = 1;
    }
    double v48 = v43;
    BOOL v49 = v43 > 0.00001;
    if (v45 < 0.99999) {
      BOOL v49 = 1;
    }
    if (v47 || v49)
    {
      *(float *)&uint64_t v69 = v36;
      float v50 = v38 - v36;
      float v51 = v45 - v43;
      if (v47) {
        float v52 = 1.0 / p_mPixelSize->width;
      }
      else {
        float v52 = 0.0;
      }
      if (v49) {
        float v53 = 1.0 / p_mPixelSize->width;
      }
      else {
        float v53 = 0.0;
      }
      double v54 = v53 + v53;
      double v55 = v50;
      double v56 = v51;
      objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setInnerRect:", v46 + v52 * 2.0, v48 + v54 * v40, v50 + v52 * -4.0, v51 + v53 * -4.0 * v40, v69);
      objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setOuterRect:", (float)(v70 - v52), (float)(v43 - (float)(v53 * v71)), v55 + v52 * 2.0, v56 + v54 * v40);
      objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "fakeRenderInContext:atPosition:andSize:zRotation:", a4, CGPointZero.x, CGPointZero.y, 2.0, 2.0, 0.0);
      [a4 setShader:v24];
      [*(id *)(&self->super._isInInteractiveMode + 1) renderImageInner:v12 inContext:a4];
      [a4 unsetShader];
      v57 = (float *)[a4 backColor];
      float v58 = v57[3];
      if (v58 < 1.0)
      {
        if (objc_msgSend(objc_msgSend(v12, "texture"), "isPremultiplied")) {
          uint64_t v65 = 2;
        }
        else {
          uint64_t v65 = 3;
        }
        [a4 blend:v65];
        [a4 setShader:@"PlainTextureSoftOpaque"];
        CGFloat v66 = p_mPixelSize->width * v55;
        *(float *)&CGFloat v66 = v66;
        CGFloat v67 = self->super.mPixelSize.height * v56;
        *(float *)&CGFloat v67 = v67;
        [a4 setShaderUniformVec2:@"invRadii" :v66 forKey:v67];
        double v61 = 0.0;
        double v62 = 0.0;
        double v63 = 0.0;
        double v64 = 0.0;
      }
      else
      {
        [a4 setShader:@"PlainTextureSoftOpaque"];
        CGFloat v59 = p_mPixelSize->width * v55;
        *(float *)&CGFloat v59 = v59;
        CGFloat v60 = self->super.mPixelSize.height * v56;
        *(float *)&CGFloat v60 = v60;
        [a4 setShaderUniformVec2:@"invRadii" :v59 forKey:v60];
        *(float *)&double v61 = *v57;
        *(float *)&double v62 = v57[1];
        *(float *)&double v63 = v57[2];
        *(float *)&double v64 = v57[3];
      }
      [a4 setShaderUniformVec4:@"edgeColor" :v61 :v62 :v63 forKey:v64];
      [*(id *)(&self->super._isInInteractiveMode + 1) renderImageMiddle:v12 inContext:a4];
      [a4 unsetShader];
      if (v58 < 1.0)
      {
        [a4 blend:0];
      }
      else
      {
        [a4 composeForeColor:v57 saveTo:v72];
        [a4 setShader:@"PlainColor"];
        [*(id *)(&self->super._isInInteractiveMode + 1) renderImageOuter:0 inContext:a4];
        [a4 unsetShader];
        [a4 restoreForeColor:v72];
      }
    }
    else
    {
      objc_msgSend(a4, "setShader:", v24, v46, v48);
      if (v19)
      {
        objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "renderImage:inContext:atPosition:andSize:zRotation:", v12, a4, CGPointZero.x, CGPointZero.y, 2.0, 2.0, 0.0);
      }
      else
      {
        if (objc_msgSend(objc_msgSend(v12, "texture"), "isPremultiplied")) {
          uint64_t v68 = 2;
        }
        else {
          uint64_t v68 = 3;
        }
        [a4 blend:v68];
        objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "renderImage:inContext:atPosition:andSize:zRotation:", v12, a4, CGPointZero.x, CGPointZero.y, 2.0, 2.0, 0.0);
        [a4 blend:0];
      }
      [a4 unsetShader];
    }
    [v12 releaseByUser];
  }
  else
  {
    v17 = *(void **)(&self->super._isInInteractiveMode + 1);
    double v18 = CGPointZero.y;
    objc_msgSend(v17, "fakeRenderInContext:atPosition:andSize:zRotation:", a4, CGPointZero.x, v18, 2.0, 2.0, 0.0);
  }
}

- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = [(NSDictionary *)[(MRLayerEffect *)self->super.mEffectLayer slideProvidersForElementIDs] objectForKey:@"image0"];
  v10 = v9;
  if (BYTE1(self->_y0))
  {
    BYTE1(self->_y0) = 0;
    objc_msgSend(v9, "setCenter:", *(double *)(&self->mForceIsOpaque + 1), *(double *)((char *)&self->_panX + 1));
    [v10 setScale:*(double *)((char *)&self->_panY + 1)];
    [v10 setRotation:*(double *)((char *)&self->_scale + 1)];
  }
  id v11 = [v10 retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  [v11 setUsesBackgroundColorAsBorderColor:1];
  [v11 aspectRatio];
  if (self->super._panoramaPanningOffsets)
  {
    if (v12 < 0.5 || v12 > 2.0)
    {
      if (v12 <= 2.0)
      {
        [a4 localAspectRatio];
        [v11 scale];
        [v11 centerY];
        -[MREffect valueForPanoramaPanningForElementID:value:minValue:maxValue:](self, "valueForPanoramaPanningForElementID:value:minValue:maxValue:", @"image0");
        objc_msgSend(v11, "setCenterY:");
      }
      else
      {
        [v11 scale];
        [v11 centerX];
        -[MREffect valueForPanoramaPanningForElementID:value:minValue:maxValue:](self, "valueForPanoramaPanningForElementID:value:minValue:maxValue:", @"image0");
        objc_msgSend(v11, "setCenterX:");
      }
    }
  }
  objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "fakeRenderInContext:atPosition:andSize:zRotation:", a4, CGPointZero.x, CGPointZero.y, 2.0, 2.0, 0.0);
  return v11;
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v8 = [(NSDictionary *)[(MRLayerEffect *)self->super.mEffectLayer slideProvidersForElementIDs] objectForKey:@"image0"];
  return [v8 patchworkAtTime:a4 inContext:a5 withArguments:a3];
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  if (objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "hitAtPoint:withInverseMatrix:localPoint:", a4, a5, a3.x, a3.y))return @"image0"; {
  else
  }
    return 0;
}

- (BOOL)getVerticesCoordinates:(MREffectJustASlide *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  unsigned int v8 = [a5 isEqualToString:@"image0"];
  if (v8)
  {
    id v9 = *(void **)(&self->super._isInInteractiveMode + 1);
    LOBYTE(v8) = [v9 getVerticesCoordinates:a3 withMatrix:a4];
  }
  return v8;
}

- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4
{
  if (!BYTE5(self->_y0)) {
    return;
  }
  objc_msgSend(-[NSDictionary objectForKey:](-[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"), "objectForKey:", @"image0"), "imageAspectRatio");
  double v7 = *(double *)((char *)&self->_panY + 1) / a3;
  *(double *)((char *)&self->_panY + 1) = v7;
  double v9 = v8 / a3;
  if (BYTE4(self->_y0))
  {
    double v10 = fmax(v9 + v9, 2.0);
    if (v7 <= v10)
    {
      double v10 = 1.0;
      if (v9 <= 1.0) {
        double v10 = v9;
      }
      if (v7 >= v10) {
        goto LABEL_12;
      }
    }
  }
  else if (v9 <= 1.0)
  {
    double v10 = v9;
  }
  else
  {
    double v10 = 1.0;
  }
  *(double *)((char *)&self->_panY + 1) = v10;
LABEL_12:
  *(double *)((char *)&self->_scale + 1) = 0.0;
  double v11 = *(double *)((char *)&self->_panY + 1);
  double v12 = (1.0 - 1.0 / v11) * 0.5;
  if (v12 < 0.0) {
    double v12 = 0.0;
  }
  double v13 = (1.0 - v9 / v11) * 0.5;
  if (v13 >= 0.0) {
    double v14 = v13;
  }
  else {
    double v14 = 0.0;
  }
  double v15 = v12 + 0.5;
  double v16 = v14 + 0.5;
  double v17 = *(double *)(&self->mForceIsOpaque + 1);
  if (v17 > v12 + 0.5 || (double v15 = 0.5 - v12, v17 < 0.5 - v12)) {
    *(double *)(&self->mForceIsOpaque + 1) = v15;
  }
  double v18 = *(double *)((char *)&self->_panX + 1);
  if (v18 > v16 || (double v16 = 0.5 - v14, v18 < 0.5 - v14)) {
    *(double *)((char *)&self->_panX + 1) = v16;
  }
  if (![(MRLayer *)self->super.mEffectLayer isActivated]) {
    a4 = 0.0;
  }
  [(MRLayerEffect *)self->super.mEffectLayer animateCenterOfSlide:@"image0", *(double *)(&self->mForceIsOpaque + 1), *(double *)((char *)&self->_panX + 1), a4, 0.0, 0.0 to withDuration andInitialSpeed];
  [(MRLayerEffect *)self->super.mEffectLayer animateScaleOfSlide:@"image0" to:*(double *)((char *)&self->_panY + 1) withDuration:a4];
  [(MRLayerEffect *)self->super.mEffectLayer animateRotationOfSlide:@"image0" to:*(double *)((char *)&self->_scale + 1) withDuration:a4];
  BYTE1(self->_y0) = 0;
}

- (BOOL)isFocuser
{
  return BYTE5(self->_y0);
}

- (void)setIsFocuser:(BOOL)a3
{
  BYTE5(self->_y0) = a3;
}

- (double)pzrStart:(id)a3
{
  id v4 = [(NSDictionary *)[(MRLayerEffect *)self->super.mEffectLayer slideProvidersForElementIDs] objectForKey:@"image0"];
  [v4 center];
  *(void *)((char *)&self->_rotation + 1) = v5;
  *(void *)((char *)&self->_startSlideCenter.x + 1) = v6;
  [v4 scale];
  *(void *)((char *)&self->_startSlideCenter.y + 1) = v7;
  [v4 rotation];
  *(void *)((char *)&self->_startSlideScale + 1) = v8;
  BYTE3(self->_y0) = 0;
  return 0.0;
}

- (double)pzrUpdate:(id)a3
{
  if (BYTE5(self->_y0)) {
    BYTE4(self->_y0) = *((unsigned char *)a3 + 100);
  }
  id v5 = [(NSDictionary *)[(MRLayerEffect *)self->super.mEffectLayer slideProvidersForElementIDs] objectForKey:@"image0"];
  CGFloat v6 = self->super.mPixelSize.width / self->super.mPixelSize.height;
  [v5 imageAspectRatio];
  double v8 = v7;
  double v9 = v7 / v6;
  double v10 = *(double *)((char *)&self->_startSlideCenter.y + 1) * *((double *)a3 + 6);
  *(double *)((char *)&self->_panY + 1) = v10;
  if (BYTE4(self->_y0))
  {
    double v11 = fmax(v9 + v9, 2.0);
  }
  else
  {
    double v12 = 1.0;
    if (v9 <= 1.0) {
      double v12 = v9;
    }
    if (BYTE5(self->_y0)) {
      double v11 = v12;
    }
    else {
      double v11 = 1.0e10;
    }
  }
  if (v10 > v11)
  {
    double v10 = v11 * (log10(v10 / v11) + 1.0);
    *(double *)((char *)&self->_panY + 1) = v10;
  }
  if (!BYTE3(self->_y0))
  {
    double v13 = 0.5 / *(double *)((char *)&self->_startSlideCenter.y + 1);
    __double2 v14 = __sincos_stret(*(double *)((char *)&self->_startSlideScale + 1));
    *(double *)((char *)&self->_startSlideRotation + 1) = *(double *)((char *)&self->_rotation + 1)
                                                        + v13
                                                        * (v14.__sinval * (v9 / v8 * *((double *)a3 + 3))
                                                         + *((double *)a3 + 2) * v14.__cosval);
    *(double *)((char *)&self->_x0 + 1) = *(double *)((char *)&self->_startSlideCenter.x + 1)
                                        - v13
                                        * (v14.__cosval * -(v9 * *((double *)a3 + 3))
                                         + *((double *)a3 + 2) / v8 * v14.__sinval);
    double v10 = *(double *)((char *)&self->_panY + 1);
    BOOL v15 = v10 <= v9 && *((double *)a3 + 10) < 1.0 || *((unsigned char *)a3 + 96) == 16;
    BYTE2(self->_y0) = v15;
    BYTE3(self->_y0) = 1;
  }
  int v16 = BYTE2(self->_y0);
  if (BYTE2(self->_y0))
  {
    double v17 = *(double *)((char *)&self->_startSlideScale + 1) + *((double *)a3 + 7);
    *(double *)((char *)&self->_scale + 1) = v17;
    double v10 = *(double *)((char *)&self->_panY + 1);
  }
  else
  {
    double v17 = *(double *)((char *)&self->_scale + 1);
  }
  double v18 = 0.5 / v10;
  __double2 v19 = __sincos_stret(v17);
  *(double *)(&self->mForceIsOpaque + 1) = *(double *)((char *)&self->_startSlideRotation + 1)
                                         - v18
                                         * (v19.__sinval * (v9 / v8 * *((double *)a3 + 3))
                                          + *((double *)a3 + 2) * v19.__cosval);
  *(double *)((char *)&self->_panX + 1) = *(double *)((char *)&self->_x0 + 1)
                                        + v18
                                        * (v19.__cosval * -(v9 * *((double *)a3 + 3))
                                         + v8 * *((double *)a3 + 2) * v19.__sinval);
  if (v16) {
    goto LABEL_38;
  }
  double v20 = *(double *)((char *)&self->_panY + 1);
  if ((1.0 - 1.0 / v20) * 0.5 >= 0.0) {
    double v21 = (1.0 - 1.0 / v20) * 0.5;
  }
  else {
    double v21 = 0.0;
  }
  double v22 = (1.0 - v9 / v20) * 0.5;
  if (v22 >= 0.0) {
    double v23 = v22;
  }
  else {
    double v23 = 0.0;
  }
  double v24 = v23 + 0.5;
  double v25 = *(double *)(&self->mForceIsOpaque + 1);
  if (v25 > v21 + 0.5)
  {
    double v26 = v21 + 0.5 + sqrt(v25 - (v21 + 0.5) + 1.0) + -1.0;
LABEL_32:
    *(double *)(&self->mForceIsOpaque + 1) = v26;
    goto LABEL_33;
  }
  if (v25 < 0.5 - v21)
  {
    double v26 = 0.5 - v21 - sqrt(0.5 - v21 - v25 + 1.0) + 1.0;
    goto LABEL_32;
  }
LABEL_33:
  double v27 = *(double *)((char *)&self->_panX + 1);
  if (v27 > v24)
  {
    double v28 = v24 + sqrt(v27 - v24 + 1.0) + -1.0;
LABEL_37:
    *(double *)((char *)&self->_panX + 1) = v28;
    goto LABEL_38;
  }
  if (v27 < 0.5 - v23)
  {
    double v28 = 0.5 - v23 - sqrt(0.5 - v23 - v27 + 1.0) + 1.0;
    goto LABEL_37;
  }
LABEL_38:
  BYTE1(self->_y0) = 1;
  return 0.0;
}

- (double)pzrEnd:(id)a3
{
  if (BYTE5(self->_y0)) {
    BYTE4(self->_y0) = *((unsigned char *)a3 + 100);
  }
  id v5 = [(NSDictionary *)[(MRLayerEffect *)self->super.mEffectLayer slideProvidersForElementIDs] objectForKey:@"image0"];
  double v6 = self->super.mPixelSize.width / self->super.mPixelSize.height;
  [v5 imageAspectRatio];
  double v8 = v7 / v6;
  double v9 = *(double *)((char *)&self->_startSlideCenter.y + 1) * *((double *)a3 + 6);
  *(double *)((char *)&self->_panY + 1) = v9;
  if (!BYTE4(self->_y0))
  {
    if (!BYTE5(self->_y0)) {
      goto LABEL_14;
    }
    if (v8 <= 1.0) {
      double v10 = v7 / v6;
    }
    else {
      double v10 = 1.0;
    }
    goto LABEL_13;
  }
  double v10 = fmax(v8 + v8, 2.0);
  if (v9 > v10) {
    goto LABEL_13;
  }
  double v10 = 1.0;
  if (v8 <= 1.0) {
    double v10 = v7 / v6;
  }
  if (v9 < v10) {
LABEL_13:
  }
    *(double *)((char *)&self->_panY + 1) = v10;
LABEL_14:
  *(double *)((char *)&self->_scale + 1) = 0.0;
  double v11 = 0.5 / *(double *)((char *)&self->_panY + 1);
  double v12 = 0.0;
  double v13 = 0.0;
  double v14 = 0.0;
  if (*((unsigned char *)a3 + 98))
  {
    double v13 = *((double *)a3 + 8) * 0.125;
    double v14 = *((double *)a3 + 9) * 0.125;
  }
  double v15 = *((double *)a3 + 2) + v13;
  double v16 = v14 + *((double *)a3 + 3);
  *(double *)(&self->mForceIsOpaque + 1) = *(double *)((char *)&self->_startSlideRotation + 1)
                                         - v11 * (v15 + v8 / v7 * v16 * 0.0);
  *(double *)((char *)&self->_panX + 1) = *(double *)((char *)&self->_x0 + 1) + v11 * (v7 * v15 * 0.0 - v8 * v16);
  double v17 = *(double *)((char *)&self->_panY + 1);
  double v18 = (1.0 - 1.0 / v17) * 0.5;
  if (v18 < 0.0) {
    double v18 = 0.0;
  }
  double v19 = (1.0 - v8 / v17) * 0.5;
  if (v19 >= 0.0) {
    double v12 = v19;
  }
  double v20 = v18 + 0.5;
  double v21 = v12 + 0.5;
  double v22 = *(double *)(&self->mForceIsOpaque + 1);
  if (v22 > v18 + 0.5 || (double v20 = 0.5 - v18, v22 < 0.5 - v18)) {
    *(double *)(&self->mForceIsOpaque + 1) = v20;
  }
  double v23 = *(double *)((char *)&self->_panX + 1);
  if (v23 > v21 || (double v21 = 0.5 - v12, v23 < 0.5 - v12))
  {
    *(double *)((char *)&self->_panX + 1) = v21;
    double v23 = v21;
  }
  if (!*((unsigned char *)a3 + 98)) {
    return 0.0;
  }
  double v24 = 0.25;
  [(MRLayerEffect *)self->super.mEffectLayer animateCenterOfSlide:@"image0", *(double *)(&self->mForceIsOpaque + 1), v23, 0.25, *((double *)a3 + 8), *((double *)a3 + 9) to withDuration andInitialSpeed];
  [(MRLayerEffect *)self->super.mEffectLayer animateScaleOfSlide:@"image0" to:*(double *)((char *)&self->_panY + 1) withDuration:0.25];
  [(MRLayerEffect *)self->super.mEffectLayer animateRotationOfSlide:@"image0" to:*(double *)((char *)&self->_scale + 1) withDuration:0.25];
  BYTE1(self->_y0) = 0;
  return v24;
}

- (double)pzrCancel:(id)a3
{
  if (*((unsigned char *)a3 + 98))
  {
    double v4 = 0.25;
    [(MRLayerEffect *)self->super.mEffectLayer animateCenterOfSlide:@"image0", *(double *)((char *)&self->_rotation + 1), *(double *)((char *)&self->_startSlideCenter.x + 1), 0.25 to withDuration];
    [(MRLayerEffect *)self->super.mEffectLayer animateScaleOfSlide:@"image0" to:*(double *)((char *)&self->_startSlideCenter.y + 1) withDuration:0.25];
    [(MRLayerEffect *)self->super.mEffectLayer animateRotationOfSlide:@"image0" to:*(double *)((char *)&self->_startSlideScale + 1) withDuration:0.25];
    BYTE1(self->_y0) = 0;
  }
  else
  {
    *(double *)(&self->mForceIsOpaque + 1) = *(double *)((char *)&self->_rotation + 1);
    *(double *)((char *)&self->_panX + 1) = *(double *)((char *)&self->_startSlideCenter.x + 1);
    *(double *)((char *)&self->_panY + 1) = *(double *)((char *)&self->_startSlideCenter.y + 1);
    *(double *)((char *)&self->_scale + 1) = *(double *)((char *)&self->_startSlideScale + 1);
    return 0.0;
  }
  return v4;
}

- (void)resetPZR
{
  *(double *)((char *)&self->_scale + 1) = 0.0;
  *(double *)((char *)&self->_panX + 1) = 0.0;
  *(void *)(&self->mForceIsOpaque + 1) = 0;
  *(double *)((char *)&self->_panY + 1) = 1.0;
  BYTE1(self->_y0) = 0;
  BYTE4(self->_y0) = 0;
}

- (BOOL)canMoveInDirection:(unsigned __int8)a3 withPZR:(id)a4
{
  if (!BYTE4(self->_y0)) {
    return 1;
  }
  id v7 = [(NSDictionary *)[(MRLayerEffect *)self->super.mEffectLayer slideProvidersForElementIDs] objectForKey:@"image0"];
  double v8 = self->super.mPixelSize.width / self->super.mPixelSize.height;
  [v7 imageAspectRatio];
  double v10 = *(double *)((char *)&self->_panY + 1);
  double v11 = (1.0 - 1.0 / v10) * 0.5;
  if (v11 < 0.0) {
    double v11 = 0.0;
  }
  double v12 = (1.0 - v9 / v8 / v10) * 0.5;
  if (v12 < 0.0) {
    double v12 = 0.0;
  }
  return ((a3 & 1) == 0 || *((double *)a4 + 8) >= 0.0 || *(double *)(&self->mForceIsOpaque + 1) < v11 + 0.5)
      && ((a3 & 2) == 0 || *((double *)a4 + 8) <= 0.0 || *(double *)(&self->mForceIsOpaque + 1) > 0.5 - v11)
      && ((a3 & 4) == 0 || *((double *)a4 + 9) <= 0.0 || *(double *)((char *)&self->_panX + 1) > 0.5 - v12)
      && ((a3 & 8) == 0 || *((double *)a4 + 9) >= 0.0 || *(double *)((char *)&self->_panX + 1) < v12 + 0.5);
}

@end