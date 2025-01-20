@interface THWFreeTransformController
+ (BOOL)isFreeTransformInProgress;
- (BOOL)bounceUpOnly;
- (BOOL)freeTransformGestureRecognizerShouldAllowPinchDown:(id)a3;
- (BOOL)freeTransformGestureRecognizerShouldAllowPinchUp:(id)a3;
- (BOOL)freeTransformGestureRecognizerShouldDelayRecognizeUntilScaleChange:(id)a3;
- (BOOL)freeTransformGestureRecognizerShouldRubberband:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isFreeTransformInProgress;
- (BOOL)p_wantsCurtainFadeOut;
- (BOOL)passedThreshold;
- (BOOL)smoothEdges;
- (CALayer)curtainLayer;
- (CALayer)freeTransformLayer;
- (CALayer)shadowLayer;
- (CALayer)superLayerForWrapper;
- (CALayer)targetLayer;
- (CALayer)wrapperLayer;
- (CGAffineTransform)currentTransform;
- (CGAffineTransform)originalShadowTransform;
- (CGPoint)lastDragCenter;
- (CGPoint)lastVelocity;
- (CGRect)completionTargetRect;
- (CGRect)originalTargetLayerFrame;
- (THWFreeTransformController)init;
- (THWFreeTransformController)initWithSharedGestureRecognizer:(BOOL)a3;
- (THWFreeTransformControllerDelegate)delegate;
- (THWFreeTransformControllerGestureRecognizerDelegate)gestureRecognizerDelegate;
- (THWFreeTransformGestureRecognizer)transformGR;
- (TSULayerSaveRestore)layerSaveRestore;
- (UIView)wrapperView;
- (double)p_clampedScaleWithOriginalScale:(double)result originalFrame:(CGRect)a4 targetFrame:(CGRect)a5;
- (double)p_rotationAngleFromTransform:(CGAffineTransform *)a3;
- (double)scaleThreshold;
- (double)transformScale;
- (id)p_shadowFadeInAnimation:(id *)a3;
- (id)p_shadowFadeOutAnimation:(double)a3;
- (void)appendShadowTransform:(CGAffineTransform *)a3;
- (void)cancelTransform;
- (void)clearGestureRecognizer;
- (void)dealloc;
- (void)p_addOvershootAnimationWithOriginalFrame:(CGRect)a3 originalTransform:(CGAffineTransform *)a4 targetFrame:(CGRect)a5 targetTransform:(CGAffineTransform *)a6 completion:(id)a7;
- (void)p_cleanupExtraLayers;
- (void)p_fadeOutCurtain;
- (void)p_setupCurtain;
- (void)p_setupForTransformWithGesture:(id)a3;
- (void)p_setupShadow;
- (void)p_updateUnmovingParentView:(id)a3;
- (void)recreateGestureRecognizerOnView:(id)a3;
- (void)setBounceUpOnly:(BOOL)a3;
- (void)setCurtainLayer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGestureRecognizerDelegate:(id)a3;
- (void)setIsFreeTransformInProgress:(BOOL)a3;
- (void)setLastDragCenter:(CGPoint)a3;
- (void)setLastVelocity:(CGPoint)a3;
- (void)setLayerSaveRestore:(id)a3;
- (void)setOriginalTargetLayerFrame:(CGRect)a3;
- (void)setPassedThreshold:(BOOL)a3;
- (void)setScaleThreshold:(double)a3;
- (void)setShadowLayer:(id)a3;
- (void)setSmoothEdges:(BOOL)a3;
- (void)setTargetLayer:(id)a3;
- (void)setTransformGR:(id)a3;
- (void)setTransformScale:(double)a3;
- (void)setWrapperView:(id)a3;
- (void)transformGRChanged:(id)a3;
- (void)updateUnmovingParentView;
@end

@implementation THWFreeTransformController

- (CALayer)wrapperLayer
{
  result = (CALayer *)self->mWrapperView;
  if (result) {
    return (CALayer *)[(CALayer *)result layer];
  }
  return result;
}

- (CALayer)superLayerForWrapper
{
  id v2 = [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)self delegate] unmovingParentViewForFreeTransformController:self];

  return (CALayer *)[v2 layer];
}

+ (BOOL)isFreeTransformInProgress
{
  int v2 = dword_5731D0;
  if (dword_5731D0 < 0)
  {
    [+[TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:@"stringWithUTF8String:"] file:+[NSString stringWithUTF8String:@"stringWithUTF8String:"] lineNumber:117 description:@"FTC-in-progress counter should be nonnegative"];
    int v2 = dword_5731D0;
  }
  return v2 > 0;
}

- (THWFreeTransformController)init
{
  v8.receiver = self;
  v8.super_class = (Class)THWFreeTransformController;
  int v2 = [(THWFreeTransformController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(THWFreeTransformController *)v2 setSmoothEdges:1];
    long long v4 = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v3->mOriginalShadowTransform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v3->mOriginalShadowTransform.c = v5;
    long long v6 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v3->mOriginalShadowTransform.tx = v6;
    *(_OWORD *)&v3->mCurrentTransform.a = v4;
    *(_OWORD *)&v3->mCurrentTransform.c = v5;
    *(_OWORD *)&v3->mCurrentTransform.tx = v6;
  }
  return v3;
}

- (THWFreeTransformController)initWithSharedGestureRecognizer:(BOOL)a3
{
  result = [(THWFreeTransformController *)self init];
  if (result) {
    result->mSharedTransformGR = a3;
  }
  return result;
}

- (void)dealloc
{
  [(THWFreeTransformController *)self setWrapperView:0];
  self->mTransformGR = 0;

  self->mTargetLayer = 0;
  [(THWFreeTransformController *)self setShadowLayer:0];
  [(THWFreeTransformController *)self setCurtainLayer:0];
  [(THWFreeTransformController *)self setGestureRecognizerDelegate:0];
  [(THWFreeTransformController *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)THWFreeTransformController;
  [(THWFreeTransformController *)&v3 dealloc];
}

- (void)cancelTransform
{
  if ([(THWFreeTransformController *)self isFreeTransformInProgress])
  {
    mTransformGR = self->mTransformGR;
    [(THWFreeTransformGestureRecognizer *)mTransformGR cancel];
  }
}

- (void)setTargetLayer:(id)a3
{
  if ([(THWFreeTransformController *)self targetLayer] != a3)
  {

    self->mTargetLayer = (CALayer *)a3;
  }
}

- (CALayer)freeTransformLayer
{
  result = [(THWFreeTransformController *)self wrapperLayer];
  if (!result) {
    return self->mTargetLayer;
  }
  return result;
}

- (void)p_cleanupExtraLayers
{
  [(THWFreeTransformController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)self delegate] freeTransformControllerShouldMoveFreeTransformViewAboveStatusBar:self])
  {
    objc_opt_class();
    [(CALayer *)[(THWFreeTransformController *)self freeTransformLayer] delegate];
    objc_super v3 = (void *)TSUDynamicCast();
    objc_msgSend(objc_msgSend(v3, "window"), "moveViewBackBelowStatusBar:preserveCurrentFrame:", v3, 0);
  }
  if ([(THWFreeTransformController *)self wrapperLayer])
  {
    if (self->mTransformScale != 0.0)
    {
      long long v4 = [(THWFreeTransformController *)self targetLayer];
      long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v6[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v6[1] = v5;
      v6[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      [(CALayer *)v4 setAffineTransform:v6];
    }
    [(TSULayerSaveRestore *)[(THWFreeTransformController *)self layerSaveRestore] restoreLayer:[(THWFreeTransformController *)self targetLayer]];
    [(CALayer *)[(THWFreeTransformController *)self wrapperLayer] removeFromSuperlayer];
    [(THWFreeTransformController *)self setWrapperView:0];
  }
  else
  {
    [(TSULayerSaveRestore *)[(THWFreeTransformController *)self layerSaveRestore] restoreLayer:[(THWFreeTransformController *)self targetLayer]];
  }
  [(CALayer *)[(THWFreeTransformController *)self shadowLayer] removeFromSuperlayer];
  [(THWFreeTransformController *)self setShadowLayer:0];
  [(CALayer *)[(THWFreeTransformController *)self curtainLayer] removeFromSuperlayer];
  [(THWFreeTransformController *)self setCurtainLayer:0];
}

- (void)p_setupCurtain
{
  if (![(THWFreeTransformController *)self curtainLayer]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformController p_setupCurtain]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformController.m") lineNumber:221 description:@"invalid nil value for '%s'", "self.curtainLayer"];
  }
  id v3 = [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)self delegate] curtainColorForFreeTransformController:self];
  if (!v3) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWFreeTransformController p_setupCurtain]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformController.m"] lineNumber:224 description:@"invalid nil value for '%s'", "curtainColor"];
  }
  [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)self delegate] curtainSizeForFreeTransformController:self];
  if (v5 == CGSizeZero.width && v4 == CGSizeZero.height) {
    [[(CALayer *)[(THWFreeTransformController *)self freeTransformLayer] superlayer] frame];
  }
  if ([(CALayer *)[(THWFreeTransformController *)self curtainLayer] superlayer])
  {
    [[(CALayer *)[(THWFreeTransformController *)self curtainLayer] superlayer] position];
    TSDRectWithCenterAndSize();
    -[CALayer setFrame:]([(THWFreeTransformController *)self curtainLayer], "setFrame:", v7, v8, v9, v10);
    id v11 = [v3 CGColor];
    v12 = [(THWFreeTransformController *)self curtainLayer];
    [(CALayer *)v12 setBackgroundColor:v11];
  }
}

- (BOOL)p_wantsCurtainFadeOut
{
  id v3 = [(THWFreeTransformController *)self delegate];

  return [(THWFreeTransformControllerDelegate *)v3 freeTransformControllerWantsCurtainFadeOut:self];
}

- (void)p_fadeOutCurtain
{
  [(THWFreeTransformController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)self delegate] freeTransformControllerWillFadeOutCurtain:self];
  }
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  id v3 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  if (![(THWFreeTransformController *)self curtainLayer]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformController p_fadeOutCurtain]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformController.m") lineNumber:258 description:@"invalid nil value for '%s'", "self.curtainLayer"];
  }
  if ([(THWFreeTransformController *)self curtainLayer])
  {
    [(CALayer *)[(THWFreeTransformController *)self curtainLayer] frame];
    if (v5 == CGSizeZero.width && v4 == CGSizeZero.height) {
      [(THWFreeTransformController *)self p_setupCurtain];
    }
  }
  [(CABasicAnimation *)v3 setFromValue:+[NSNumber numberWithDouble:1.0]];
  [(CABasicAnimation *)v3 setToValue:+[NSNumber numberWithDouble:0.0]];
  [(CABasicAnimation *)v3 setDuration:0.25];
  [(CABasicAnimation *)v3 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
  [(CABasicAnimation *)v3 setFillMode:kCAFillModeForwards];
  [(CABasicAnimation *)v3 setRemovedOnCompletion:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6FD6C;
  v7[3] = &unk_456DE0;
  v7[4] = self;
  +[CATransaction setCompletionBlock:v7];
  [(CALayer *)[(THWFreeTransformController *)self curtainLayer] addAnimation:v3 forKey:@"THWFreeTransformControllerCurtainFadeOutKey"];
  +[CATransaction commit];
  self->mStartedCurtainFadeOut = 1;
}

- (CGRect)originalTargetLayerFrame
{
  CGFloat x = self->mOriginalTargetLayerFrame.origin.x;
  CGFloat y = self->mOriginalTargetLayerFrame.origin.y;
  CGFloat width = self->mOriginalTargetLayerFrame.size.width;
  CGFloat height = self->mOriginalTargetLayerFrame.size.height;
  [(THWFreeTransformController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)self delegate] freeTransformControllerOriginalTargetLayerFrame:self];
    CGFloat x = v7;
    CGFloat y = v8;
    CGFloat width = v9;
    CGFloat height = v10;
  }
  double v11 = x;
  double v12 = y;
  double v13 = width;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)appendShadowTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&self->mOriginalShadowTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->mOriginalShadowTransform.a;
  *(_OWORD *)&t1.c = v4;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&self->mOriginalShadowTransform.tx;
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v5;
  *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v14, &t1, &t2);
  long long v6 = *(_OWORD *)&v14.c;
  *(_OWORD *)&self->mOriginalShadowTransform.a = *(_OWORD *)&v14.a;
  *(_OWORD *)&self->mOriginalShadowTransform.c = v6;
  *(_OWORD *)&self->mOriginalShadowTransform.tCGFloat x = *(_OWORD *)&v14.tx;
  long long v7 = *(_OWORD *)&self->mOriginalShadowTransform.c;
  long long v9 = *(_OWORD *)&self->mOriginalShadowTransform.a;
  long long v10 = v7;
  long long v11 = *(_OWORD *)&self->mOriginalShadowTransform.tx;
  v8[0] = v9;
  v8[1] = v7;
  v8[2] = v11;
  [(CALayer *)[(THWFreeTransformController *)self shadowLayer] setAffineTransform:v8];
}

- (id)p_shadowFadeInAnimation:(id *)a3
{
  double v4 = v3;
  long long v5 = +[CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
  [(CABasicAnimation *)v5 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
  [(CABasicAnimation *)v5 setDuration:0.150000006];
  [(CABasicAnimation *)v5 setFromValue:+[NSNumber numberWithFloat:0.0]];
  *(float *)&double v6 = v4;
  [(CABasicAnimation *)v5 setToValue:+[NSNumber numberWithFloat:v6]];
  [(CABasicAnimation *)v5 setRemovedOnCompletion:0];
  return v5;
}

- (id)p_shadowFadeOutAnimation:(double)a3
{
  double v4 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [(CABasicAnimation *)v4 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
  [(CABasicAnimation *)v4 setDuration:0.150000006];
  *(float *)&double v5 = a3;
  [(CABasicAnimation *)v4 setFromValue:+[NSNumber numberWithFloat:v5]];
  [(CABasicAnimation *)v4 setToValue:+[NSNumber numberWithFloat:0.0]];
  [(CABasicAnimation *)v4 setFillMode:kCAFillModeForwards];
  [(CABasicAnimation *)v4 setRemovedOnCompletion:0];
  return v4;
}

- (void)p_setupShadow
{
  double v3 = [(THWFreeTransformController *)self targetLayer];
  [(CALayer *)v3 shadowOpacity];
  if (v4 == 0.0)
  {
    [(THWFreeTransformController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      -[THWFreeTransformControllerDelegate shadowPropertiesForFreeTransformController:defaults:]([(THWFreeTransformController *)self delegate], "shadowPropertiesForFreeTransformController:defaults:", self, 0.667, 0.0, 10.0, 15.0);
      double v53 = v13;
      BOOL v8 = 0;
      long long v7 = 0;
      [(CALayer *)v3 bounds];
    }
    else
    {
      BOOL v8 = 0;
      long long v7 = 0;
      double v53 = 0.667;
      [(CALayer *)v3 bounds];
    }
  }
  else
  {
    [(CALayer *)v3 shadowOpacity];
    double v53 = v5;
    [(CALayer *)v3 shadowOffset];
    [(CALayer *)v3 shadowRadius];
    uint64_t v51 = v6;
    long long v7 = [(CALayer *)v3 shadowColor];
    BOOL v8 = [(CALayer *)v3 shadowPath] != 0;
    [(CALayer *)v3 bounds];
  }
  CGFloat v15 = v9;
  CGFloat v16 = v10;
  CGFloat v17 = v11;
  CGFloat v18 = v12;
  [(THWFreeTransformController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)self delegate] shadowBoundsForFreeTransformController:self];
    CGFloat v15 = v19;
    CGFloat v16 = v20;
    CGFloat v17 = v21;
    CGFloat v18 = v22;
  }
  TSDShrinkSizeToFitInSize();
  double v24 = v23;
  v69.origin.CGFloat x = v15;
  v69.origin.CGFloat y = v16;
  v69.size.CGFloat width = v17;
  v69.size.CGFloat height = v18;
  CGFloat v25 = CGRectGetWidth(v69) / v24;
  self->mShadowScale = v25;
  TSDMultiplySizeScalar();
  double v27 = v26;
  double v29 = v28;
  id v30 = objc_alloc_init((Class)CALayer);
  [(CALayer *)v3 anchorPoint];
  [v30 setAnchorPoint:];
  TSDRectWithSize();
  [v30 setBounds:];
  [(CALayer *)v3 position];
  [v30 setPosition:];
  if (v3)
  {
    [(CALayer *)v3 transform];
  }
  else
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
  }
  v60[4] = v65;
  v60[5] = v66;
  v60[6] = v67;
  v60[7] = v68;
  v60[0] = v61;
  v60[1] = v62;
  v60[2] = v63;
  v60[3] = v64;
  double v31 = v52 / v25;
  [v30 setTransform:v60];
  if (!v7) {
    long long v7 = [(CGColor *)[TSUColor blackColor] CGColor];
  }
  [v30 setShadowColor:v7];
  *(float *)&double v32 = v53;
  [v30 setShadowOpacity:v32];
  [v30 setShadowOffset:v27, v29];
  [v30 setShadowRadius:v31];
  if (v8)
  {
    memset(&transform, 0, sizeof(transform));
    CGAffineTransformMakeScale(&transform, 1.0 / self->mShadowScale, 1.0 / self->mShadowScale);
    CGPathRef v33 = CGPathCreateCopyByTransformingPath([(CALayer *)v3 shadowPath], &transform);
    if (v33)
    {
      v34 = v33;
      [v30 setShadowPath:v33];
      CGPathRelease(v34);
    }
  }
  else
  {
    [(THWFreeTransformController *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)self delegate] freeTransformControllerShouldUsedTracedShadowPath:self])
    {
      v35 = [(CALayer *)v3 tracedShadowPathWithScale:1.0 / self->mShadowScale];
    }
    else
    {
      [(THWFreeTransformController *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        id v36 = [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)self delegate] shadowPathForFreeTransformController:self];
        CGAffineTransformMakeScale(&v58, 1.0 / self->mShadowScale, 1.0 / self->mShadowScale);
        [v36 transformUsingAffineTransform:&v58];
        v37 = (TSDBezierPath *)v36;
      }
      else
      {
        [v30 bounds];
        v37 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:");
      }
      v35 = (CGPath *)[(TSDBezierPath *)v37 CGPath];
    }
    [v30 setShadowPath:v35];
  }
  p_mOriginalShadowTransform = &self->mOriginalShadowTransform;
  CGAffineTransformMakeScale(&t1, self->mShadowScale, self->mShadowScale);
  if (v30) {
    [v30 transform];
  }
  else {
    memset(&v55, 0, sizeof(v55));
  }
  CATransform3DGetAffineTransform(&t2, &v55);
  CGAffineTransformConcat(&transform, &t1, &t2);
  long long v39 = *(_OWORD *)&transform.c;
  *(_OWORD *)&p_mOriginalShadowTransform->a = *(_OWORD *)&transform.a;
  *(_OWORD *)&self->mOriginalShadowTransform.c = v39;
  *(_OWORD *)&self->mOriginalShadowTransform.tCGFloat x = *(_OWORD *)&transform.tx;
  long long v40 = *(_OWORD *)&self->mOriginalShadowTransform.c;
  v54[0] = *(_OWORD *)&p_mOriginalShadowTransform->a;
  v54[1] = v40;
  v54[2] = *(_OWORD *)&self->mOriginalShadowTransform.tx;
  [v30 setAffineTransform:v54];
  [[(CALayer *)v3 superlayer] insertSublayer:v30 below:v3];
  [v30 setName:@"THWFreeTransformShadowLayer"];
  [(THWFreeTransformController *)self setShadowLayer:v30];

  [(CALayer *)v3 setShadowOpacity:0.0];
  id v41 = -[THWFreeTransformController p_shadowFadeInAnimation:](self, "p_shadowFadeInAnimation:", v53, v27, v29, v31);
  [v30 addAnimation:v41 forKey:kFadeInAnimationName];
  [(THWFreeTransformController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v42 = [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)self delegate] freeTransformControllerStyledRep:self];
    id v43 = [v42 shadowLayer];
    if (v43)
    {
      v44 = v43;
      [v43 opacity];
      id v46 = [(THWFreeTransformController *)self p_shadowFadeOutAnimation:v45];
      [v44 addAnimation:v46 forKey:kTHWFreeTransformControllerFadeOutAnimationName];
    }
    id v47 = [v42 reflectionLayer];
    if (v47)
    {
      v48 = v47;
      [v47 opacity];
      id v50 = [(THWFreeTransformController *)self p_shadowFadeOutAnimation:v49];
      [v48 addAnimation:v50 forKey:kTHWFreeTransformControllerFadeOutAnimationName];
    }
  }
}

- (double)p_rotationAngleFromTransform:(CGAffineTransform *)a3
{
  return atan2(a3->c + a3->a * 0.0 + a3->tx - (a3->tx - (a3->c - a3->a * 0.0)), a3->d + a3->b * 0.0 + a3->ty - (a3->ty - (a3->d - a3->b * 0.0)));
}

- (void)p_addOvershootAnimationWithOriginalFrame:(CGRect)a3 originalTransform:(CGAffineTransform *)a4 targetFrame:(CGRect)a5 targetTransform:(CGAffineTransform *)a6 completion:(id)a7
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  double v72 = a3.size.width;
  double v73 = a3.size.height;
  int v13 = 1055286886;
  LODWORD(a3.size.height) = 1.0;
  LODWORD(a3.size.width) = 1057803469;
  v75 = +[CAMediaTimingFunction functionWithControlPoints:a3.origin.x :0.0 :a3.size.width :a3.size.height];
  LODWORD(v14) = 0.25;
  LODWORD(v15) = 0.25;
  LODWORD(v16) = 1.0;
  LODWORD(v17) = 1057803469;
  v74 = +[CAMediaTimingFunction functionWithControlPoints:v14 :v15 :v17 :v16];
  TSDCenterOfRect();
  double v18 = width;
  double v19 = height;
  TSDCenterOfRect();
  TSDSubtractPoints();
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  double v24 = a4->a;
  double v25 = a4->b;
  double c = a4->c;
  double d = a4->d;
  TSDMultiplyPointScalar();
  TSDAddPoints();
  double v28 = v18 / v72;
  double v29 = v19 / v73;
  long long v30 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v82.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v82.m33 = v30;
  long long v31 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v82.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v82.m43 = v31;
  long long v32 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v82.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v82.m13 = v32;
  long long v33 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v82.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v82.m23 = v33;
  *(_OWORD *)&v81.m31 = *(_OWORD *)&v82.m31;
  *(_OWORD *)&v81.m33 = v30;
  *(_OWORD *)&v81.m41 = *(_OWORD *)&v82.m41;
  *(_OWORD *)&v81.m43 = v31;
  *(_OWORD *)&v81.m11 = *(_OWORD *)&v82.m11;
  *(_OWORD *)&v81.m13 = v32;
  double v34 = (v28 + v29) * 0.5 * (1.0 / ((fabs(v24 + c) + fabs(v25 + d)) * 0.5));
  *(_OWORD *)&v81.m21 = *(_OWORD *)&v82.m21;
  *(_OWORD *)&v81.m23 = v33;
  CATransform3DTranslate(&v82, &v81, v21, v23, 0.0);
  if (v28 >= v29) {
    CGFloat v35 = v29;
  }
  else {
    CGFloat v35 = v28;
  }
  CATransform3D a = v82;
  CATransform3DScale(&v81, &a, v35, v35, 1.0);
  CATransform3D v82 = v81;
  long long v36 = *(_OWORD *)&a6->c;
  *(_OWORD *)&v81.m11 = *(_OWORD *)&a6->a;
  *(_OWORD *)&v81.m13 = v36;
  *(_OWORD *)&v81.m21 = *(_OWORD *)&a6->tx;
  CATransform3DMakeAffineTransform(&b, (CGAffineTransform *)&v81);
  CATransform3D a = v82;
  CATransform3DConcat(&v81, &a, &b);
  CATransform3D v82 = v81;
  [(THWFreeTransformController *)self lastVelocity];
  TSDMultiplyPointScalar();
  double v38 = v37;
  double v40 = v39;
  long long v41 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v81.m11 = *(_OWORD *)&a4->a;
  *(_OWORD *)&v81.m13 = v41;
  *(_OWORD *)&v81.m21 = *(_OWORD *)&a4->tx;
  [(THWFreeTransformController *)self p_rotationAngleFromTransform:&v81];
  double v43 = v42;
  long long v44 = *(_OWORD *)&a6->c;
  *(_OWORD *)&v81.m11 = *(_OWORD *)&a6->a;
  *(_OWORD *)&v81.m13 = v44;
  *(_OWORD *)&v81.m21 = *(_OWORD *)&a6->tx;
  [(THWFreeTransformController *)self p_rotationAngleFromTransform:&v81];
  double v46 = v43 - v45;
  double v47 = 3.14059265 / vabdd_f64(v43, v45) + -1.0;
  if (v47 > 0.19) {
    double v47 = 0.19;
  }
  double v48 = v46 * v47;
  double v49 = fmax((v34 + -1.0) * 0.12 + 1.0, 0.96);
  if (v49 <= 1.04) {
    double v50 = v49;
  }
  else {
    double v50 = 1.04;
  }
  TSDMultiplyPointScalar();
  CGFloat v52 = v51;
  CGFloat v54 = v53;
  CATransform3D v81 = v82;
  CATransform3D a = v82;
  CATransform3DScale(&v81, &a, v50, v50, 1.0);
  CATransform3D v78 = v81;
  CATransform3DRotate(&a, &v78, v48, 0.0, 0.0, 1.0);
  CATransform3D v81 = a;
  CATransform3D v78 = a;
  CATransform3DTranslate(&a, &v78, v52, v54, 0.0);
  CATransform3D v81 = a;
  [+[UIApplication sharedApplication] beginIgnoringInteractionEvents];
  +[CATransaction begin];
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_70EEC;
  v77[3] = &unk_457868;
  v77[4] = a7;
  +[CATransaction setCompletionBlock:v77];
  CATransform3D v55 = +[CAKeyframeAnimation animationWithKeyPath:@"transform.translation"];
  [(CAKeyframeAnimation *)v55 setValues:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", CGSizeZero.width, CGSizeZero.height), +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v38, v40), +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", CGSizeZero.width, CGSizeZero.height), 0)];
  [(CAKeyframeAnimation *)v55 setTimingFunctions:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:"), 0)];
  v56 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v57) = 1051361018;
  CGAffineTransform v58 = +[NSNumber numberWithFloat:v57];
  LODWORD(v59) = 1.0;
  [(CAKeyframeAnimation *)v55 setKeyTimes:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v56, v58, +[NSNumber numberWithFloat:v59], 0)];
  [(CAKeyframeAnimation *)v55 setDuration:0.39];
  [(CAKeyframeAnimation *)v55 setFillMode:kCAFillModeForwards];
  [(CAKeyframeAnimation *)v55 setRemovedOnCompletion:0];
  v60 = +[CAKeyframeAnimation animationWithKeyPath:@"transform"];
  long long v61 = *(_OWORD *)&a4->c;
  *(_OWORD *)&a.m11 = *(_OWORD *)&a4->a;
  *(_OWORD *)&a.m13 = v61;
  *(_OWORD *)&a.m21 = *(_OWORD *)&a4->tx;
  CATransform3DMakeAffineTransform(&v76, (CGAffineTransform *)&a);
  long long v62 = +[NSValue valueWithCATransform3D:&v76];
  CATransform3D a = v81;
  long long v63 = +[NSValue valueWithCATransform3D:&a];
  CATransform3D a = v82;
  [(CAKeyframeAnimation *)v60 setValues:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v62, v63, +[NSValue valueWithCATransform3D:&a], 0)];
  [(CAKeyframeAnimation *)v60 setTimingFunctions:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v74, v75, 0)];
  long long v64 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v65) = 1057458056;
  long long v66 = +[NSNumber numberWithFloat:v65];
  LODWORD(v67) = 1.0;
  [(CAKeyframeAnimation *)v60 setKeyTimes:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v64, v66, +[NSNumber numberWithFloat:v67], 0)];
  [(CAKeyframeAnimation *)v60 setDuration:0.51];
  [(CAKeyframeAnimation *)v60 setFillMode:kCAFillModeForwards];
  [(CAKeyframeAnimation *)v60 setRemovedOnCompletion:0];
  id v68 = +[CAAnimationGroup animation];
  [v68 setAnimations:[NSArray arrayWithObjects:v55, v60, 0]];
  [v68 setDuration:0.51];
  [v68 setFillMode:kCAFillModeForwards];
  [v68 setRemovedOnCompletion:0];
  CGRect v69 = [(THWFreeTransformController *)self freeTransformLayer];
  [(CALayer *)v69 addAnimation:v68 forKey:kSnapToSizeAnimationName];
  [(THWFreeTransformController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)self delegate] freeTransformControllerShouldFadeShadowOut:self])
  {
    v70 = +[CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
    [(CABasicAnimation *)v70 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [(CABasicAnimation *)v70 setDuration:0.27];
    [(CABasicAnimation *)v70 setToValue:+[NSNumber numberWithFloat:0.0]];
    [(CABasicAnimation *)v70 setFillMode:kCAFillModeForwards];
    [(CABasicAnimation *)v70 setRemovedOnCompletion:0];
    v71 = [(THWFreeTransformController *)self shadowLayer];
    [(CALayer *)v71 addAnimation:v70 forKey:kTHWFreeTransformControllerFadeOutAnimationName];
  }
  +[CATransaction commit];
}

- (double)p_clampedScaleWithOriginalScale:(double)result originalFrame:(CGRect)a4 targetFrame:(CGRect)a5
{
  double v5 = a5.size.height / a4.size.height;
  BOOL v6 = a5.size.width / a4.size.width < a5.size.height / a4.size.height;
  if (a5.size.width / a4.size.width >= a5.size.height / a4.size.height) {
    double v7 = a5.size.height / a4.size.height;
  }
  else {
    double v7 = a5.size.width / a4.size.width;
  }
  if (!v6) {
    double v5 = a5.size.width / a4.size.width;
  }
  BOOL v8 = a5.size.width <= a4.size.width;
  if (a5.size.width <= a4.size.width) {
    double v9 = 1.0;
  }
  else {
    double v9 = v7;
  }
  if (!v8) {
    double v5 = 1.0;
  }
  if (v5 > result) {
    CGRect result = v5 * 0.667 + result * 0.333;
  }
  if (result > v9) {
    return v9 + (result - v9) * 0.333;
  }
  return result;
}

- (void)p_setupForTransformWithGesture:(id)a3
{
  if (self->mStartedFreeTransform) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformController p_setupForTransformWithGesture:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformController.m") lineNumber:621 description:@"Already started transforming."];
  }
  double v40 = self;
  self->mStartedFreeTransform = 1;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  float v4 = [+[UIApplication sharedApplication] windows];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v46;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (([v9 isUserInteractionEnabled] & 1) == 0) {
          [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformController p_setupForTransformWithGesture:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformController.m") lineNumber:630 description:@"we'll end up switching this on later..."];
        }
        [v9 setUserInteractionEnabled:0];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v6);
  }
  [+[UIWindow keyWindow](UIWindow, "keyWindow") beginDisablingInterfaceAutorotation];
  ++dword_5731D0;
  [(THWFreeTransformController *)v40 setIsFreeTransformInProgress:1];
  [(THWFreeTransformController *)v40 setPassedThreshold:0];
  [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)v40 delegate] freeTransformControllerDidBegin:v40];
  if (![(THWFreeTransformController *)v40 layerSaveRestore]) {
    [(THWFreeTransformController *)v40 setLayerSaveRestore:objc_alloc_init((Class)TSULayerSaveRestore)];
  }
  [(TSULayerSaveRestore *)[(THWFreeTransformController *)v40 layerSaveRestore] saveLayer:[(THWFreeTransformController *)v40 targetLayer]];
  double v10 = [(THWFreeTransformController *)v40 superLayerForWrapper];
  [(CALayer *)[(THWFreeTransformController *)v40 targetLayer] frame];
  TSDCenterOfRect();
  -[CALayer convertPoint:fromLayer:](v10, "convertPoint:fromLayer:", [(CALayer *)[(THWFreeTransformController *)v40 targetLayer] superlayer], v11, v12);
  if ([(THWFreeTransformController *)v40 targetLayer])
  {
    [(CALayer *)[(THWFreeTransformController *)v40 targetLayer] frame];
    TSDRectWithCenterAndSize();
    double x = v13;
    double y = v15;
    double width = v17;
    double height = v19;
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  -[THWFreeTransformController setOriginalTargetLayerFrame:](v40, "setOriginalTargetLayerFrame:", x, y, width, height);
  if (v40->mTransformScale != 0.0)
  {
    TSDCenterOfRect();
    TSDMultiplySizeScalar();
    TSDRectWithCenterAndSize();
    double x = v21;
    double y = v22;
    double width = v23;
    double height = v24;
  }
  v50.origin.double x = x;
  v50.origin.double y = y;
  v50.size.double width = width;
  v50.size.double height = height;
  CGRect v51 = CGRectInset(v50, -0.0, -0.0);
  [v40 setWrapperView:[objc_alloc((Class)UIView) initWithFrame:v51.origin.x, v51.origin.y, v51.size.width, v51.size.height]];
  double mTransformScale = v40->mTransformScale;
  if (mTransformScale != 0.0)
  {
    CGAffineTransformMakeScale(&v44, 1.0 / mTransformScale, 1.0 / mTransformScale);
    double v26 = [(THWFreeTransformController *)v40 wrapperLayer];
    CGAffineTransform v43 = v44;
    [(CALayer *)v26 setAffineTransform:&v43];
    CGAffineTransformMakeScale(&v42, v40->mTransformScale, v40->mTransformScale);
    double v27 = [(THWFreeTransformController *)v40 targetLayer];
    CGAffineTransform v41 = v42;
    [(CALayer *)v27 setAffineTransform:&v41];
  }
  [-[THWFreeTransformController wrapperLayer](v40, "wrapperLayer") setBackgroundColor:[+[TSUColor clearColor](TSUColor, "clearColor") CGColor]];
  [(CALayer *)[(THWFreeTransformController *)v40 wrapperLayer] setName:@"THWFreeTransformWrapperLayer"];
  [(THWFreeTransformController *)v40 setCurtainLayer:objc_alloc_init((Class)CALayer)];
  [(CALayer *)[(THWFreeTransformController *)v40 curtainLayer] setName:@"THWFreeTransformCurtainLayer"];
  [(CALayer *)[(THWFreeTransformController *)v40 superLayerForWrapper] insertSublayer:[(THWFreeTransformController *)v40 curtainLayer] below:[(THWFreeTransformController *)v40 targetLayer]];
  [(CALayer *)[(THWFreeTransformController *)v40 superLayerForWrapper] insertSublayer:[(THWFreeTransformController *)v40 wrapperLayer] below:[(THWFreeTransformController *)v40 targetLayer]];
  double v28 = [(THWFreeTransformController *)v40 wrapperLayer];
  [(CALayer *)[(THWFreeTransformController *)v40 targetLayer] position];
  -[CALayer convertPoint:fromLayer:](v28, "convertPoint:fromLayer:", [(CALayer *)[(THWFreeTransformController *)v40 targetLayer] superlayer], v29, v30);
  double v32 = v31;
  double v34 = v33;
  [(THWFreeTransformController *)v40 delegate];
  if (objc_opt_respondsToSelector()) {
    [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)v40 delegate] freeTransformControllerWillMoveTargetLayer:[(THWFreeTransformController *)v40 targetLayer]];
  }
  [(CALayer *)[(THWFreeTransformController *)v40 wrapperLayer] addSublayer:[(THWFreeTransformController *)v40 targetLayer]];
  -[CALayer setPosition:]([(THWFreeTransformController *)v40 targetLayer], "setPosition:", v32, v34);
  if ([(THWFreeTransformController *)v40 smoothEdges])
  {
    [(CALayer *)[(THWFreeTransformController *)v40 wrapperLayer] setShouldRasterize:1];
    TSUScreenScale();
    [(CALayer *)[(THWFreeTransformController *)v40 wrapperLayer] setRasterizationScale:v35];
  }
  [(THWFreeTransformController *)v40 delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)v40 delegate] freeTransformControllerShouldMoveFreeTransformViewAboveStatusBar:v40])
  {
    [(CALayer *)[(THWFreeTransformController *)v40 freeTransformLayer] setZPosition:10000.0];
  }
  else
  {
    objc_opt_class();
    [(CALayer *)[(THWFreeTransformController *)v40 freeTransformLayer] delegate];
    long long v36 = (void *)TSUDynamicCast();
    objc_opt_class();
    [(CALayer *)[(THWFreeTransformController *)v40 superLayerForWrapper] delegate];
    uint64_t v37 = TSUDynamicCast();
    [(THWFreeTransformController *)v40 delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ![(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)v40 delegate] freeTransformControllerShouldUseEffectsWindow:v40])
    {
      objc_msgSend(objc_msgSend(v36, "window"), "moveViewAboveStatusBar:zPosition:hostView:", v36, v37, 10000.0);
    }
    else
    {
      +[UIWindow moveViewToEffectsWindowAboveStatusBar:v36 zPosition:v37 hostView:10000.0];
    }
  }
  [(CALayer *)[(THWFreeTransformController *)v40 freeTransformLayer] setZPosition:10000.0];
  if ([(THWFreeTransformController *)v40 p_wantsCurtainFadeOut]) {
    [(THWFreeTransformController *)v40 p_setupCurtain];
  }
  [(THWFreeTransformController *)v40 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)v40 delegate] freeTransformControllerWantsShadow:v40])
  {
    [(THWFreeTransformController *)v40 p_setupShadow];
  }
  -[THWFreeTransformController setLastVelocity:](v40, "setLastVelocity:", CGPointZero.x, CGPointZero.y);
  [v39 centerPoint];
  -[THWFreeTransformController setLastDragCenter:](v40, "setLastDragCenter:");
}

- (void)transformGRChanged:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformController transformGRChanged:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformController.m") lineNumber:739 description:@"This operation must only be performed on the main thread."];
  }
  if (!self->mStartedFreeTransform) {
    [(THWFreeTransformController *)self p_setupForTransformWithGesture:a3];
  }
  memset(&v87, 0, sizeof(v87));
  if (a3) {
    [a3 transform];
  }
  [a3 scale];
  double v6 = v5;
  [(THWFreeTransformController *)self originalTargetLayerFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)self delegate] freeTransformControllerRectForCompletionAnimation:self];
  -[THWFreeTransformController p_clampedScaleWithOriginalScale:originalFrame:targetFrame:](self, "p_clampedScaleWithOriginalScale:originalFrame:targetFrame:", v6, v8, v10, v12, v14, v15, v16, v17, v18);
  if (v19 != v6)
  {
    double v20 = v19;
    [a3 angle];
    if (a3) {
      [a3 transformWithScale:v20 angle:v21];
    }
    else {
      memset(&v86, 0, sizeof(v86));
    }
    CGAffineTransform v87 = v86;
  }
  double mTransformScale = self->mTransformScale;
  if (mTransformScale != 0.0)
  {
    CGAffineTransformMakeScale(&t1, 1.0 / mTransformScale, 1.0 / mTransformScale);
    CGAffineTransform t2 = v87;
    CGAffineTransformConcat(&v86, &t1, &t2);
    CGAffineTransform v87 = v86;
  }
  v83[1] = v87;
  v83[0] = v87;
  [(CALayer *)[(THWFreeTransformController *)self freeTransformLayer] setAffineTransform:v83];
  double v23 = [(THWFreeTransformController *)self targetLayer];
  if (v23 == [(THWFreeTransformController *)self freeTransformLayer])
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    long long v24 = *(_OWORD *)&self->mOriginalShadowTransform.c;
    *(_OWORD *)&v86.CATransform3D a = *(_OWORD *)&self->mOriginalShadowTransform.a;
    *(_OWORD *)&v86.double c = v24;
    *(_OWORD *)&v86.tdouble x = *(_OWORD *)&self->mOriginalShadowTransform.tx;
    CGAffineTransform t2 = v87;
    CGAffineTransformConcat(&v82, &v86, &t2);
    double v25 = [(THWFreeTransformController *)self shadowLayer];
    CGAffineTransform v81 = v82;
    [(CALayer *)v25 setAffineTransform:&v81];
    +[CATransaction commit];
  }
  if (v6 <= 0.959999979
    && !self->mStartedCurtainFadeOut
    && [(THWFreeTransformController *)self p_wantsCurtainFadeOut])
  {
    [(THWFreeTransformController *)self p_fadeOutCurtain];
  }
  [a3 centerPoint];
  [(THWFreeTransformController *)self lastDragCenter];
  TSDSubtractPoints();
  TSDMultiplyPointScalar();
  [(THWFreeTransformController *)self lastVelocity];
  TSDAveragePoints();
  double v27 = v26;
  double v29 = v28;
  [(CALayer *)[(THWFreeTransformController *)self freeTransformLayer] removeAllAnimations];
  [(THWFreeTransformController *)self scaleThreshold];
  if (v30 > 1.0 && v6 < 1.5
    || ([(THWFreeTransformController *)self scaleThreshold], v31 < 1.0) && v6 < 0.5)
  {
    double x = CGPointZero.x;
    if (CGPointZero.x != v27 || (double x = CGPointZero.y, x != v29)) {
      -[CALayer addMomentumTiltWithVelocity:]([(THWFreeTransformController *)self freeTransformLayer], "addMomentumTiltWithVelocity:", v27, v29);
    }
  }
  [a3 centerPoint];
  -[THWFreeTransformController setLastDragCenter:](self, "setLastDragCenter:");
  -[THWFreeTransformController setLastVelocity:](self, "setLastVelocity:", v27, v29);
  if ([a3 isEnabled]
    && ([a3 state] == (char *)&dword_0 + 3 || objc_msgSend(a3, "state") == &dword_4))
  {
    [(CALayer *)[(THWFreeTransformController *)self freeTransformLayer] removeMomentumTiltAnimation];
    [(CALayer *)[(THWFreeTransformController *)self freeTransformLayer] setZPosition:0.0];
    [(THWFreeTransformController *)self scaleThreshold];
    if (v33 <= 1.0)
    {
      BOOL v35 = 0;
    }
    else
    {
      [(THWFreeTransformController *)self scaleThreshold];
      BOOL v35 = v6 > v34;
    }
    [(THWFreeTransformController *)self scaleThreshold];
    if (v36 >= 1.0)
    {
      BOOL v38 = 0;
    }
    else
    {
      [(THWFreeTransformController *)self scaleThreshold];
      BOOL v38 = v6 < v37;
    }
    if ([a3 state] == &dword_4) {
      uint64_t v39 = 0;
    }
    else {
      uint64_t v39 = v35 | v38;
    }
    CGSize size = CGRectNull.size;
    self->mCompletionTargetRect.origin = CGRectNull.origin;
    self->mCompletionTargetRect.CGSize size = size;
    [(THWFreeTransformController *)self originalTargetLayerFrame];
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    [(THWFreeTransformController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)self delegate] freeTransformControllerWillBeginCompletionAnimation:self passedThreshold:v39];
    }
    long long v49 = *(_OWORD *)&v87.c;
    *(_OWORD *)&self->mCurrentTransform.CATransform3D a = *(_OWORD *)&v87.a;
    *(_OWORD *)&self->mCurrentTransform.double c = v49;
    *(_OWORD *)&self->mCurrentTransform.tdouble x = *(_OWORD *)&v87.tx;
    [(THWFreeTransformController *)self setPassedThreshold:v39];
    if (v39)
    {
      [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)self delegate] freeTransformControllerRectForCompletionAnimation:self];
      self->mCompletionTargetRect.origin.double x = v50;
      self->mCompletionTargetRect.origin.double y = v51;
      self->mCompletionTargetRect.size.double width = v52;
      self->mCompletionTargetRect.size.double height = v53;
      [(THWFreeTransformController *)self completionTargetRect];
      if (!CGRectIsNull(v88))
      {
        [(CALayer *)[(THWFreeTransformController *)self freeTransformLayer] center];
        TSDRectWithCenterAndSize();
        double v42 = v54;
        double v44 = v55;
        double v46 = v56;
        double v48 = v57;
        if (self->mTransformScale != 0.0)
        {
          TSDCenterOfRect();
          TSDMultiplySizeScalar();
          TSDRectWithCenterAndSize();
          double v42 = v58;
          double v44 = v59;
          double v46 = v60;
          double v48 = v61;
        }
      }
    }
    else
    {
      [(THWFreeTransformController *)self originalTargetLayerFrame];
      self->mCompletionTargetRect.origin.double x = v62;
      self->mCompletionTargetRect.origin.double y = v63;
      self->mCompletionTargetRect.size.double width = v64;
      self->mCompletionTargetRect.size.double height = v65;
      if (self->mTransformScale != 0.0)
      {
        [(THWFreeTransformController *)self completionTargetRect];
        TSDCenterOfRect();
        [(THWFreeTransformController *)self completionTargetRect];
        TSDMultiplySizeScalar();
        TSDRectWithCenterAndSize();
        self->mCompletionTargetRect.origin.double x = v66;
        self->mCompletionTargetRect.origin.double y = v67;
        self->mCompletionTargetRect.size.double width = v68;
        self->mCompletionTargetRect.size.double height = v69;
      }
    }
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v77 = sub_71E70;
    CATransform3D v78 = &unk_457278;
    v79 = self;
    char v80 = v39;
    if (!self->mStartedCurtainFadeOut
      && v39
      && [(THWFreeTransformController *)self p_wantsCurtainFadeOut])
    {
      [(THWFreeTransformController *)self p_fadeOutCurtain];
    }
    [(THWFreeTransformController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)self delegate] freeTransformControllerDidFinishFreeTransforming:self passedThreshold:v39 completionBlock:v76];
    }
    else
    {
      [(THWFreeTransformController *)self completionTargetRect];
      if (CGRectIsEmpty(v89) || [a3 state] == &dword_4)
      {
        v77((uint64_t)v76);
      }
      else
      {
        [(THWFreeTransformController *)self completionTargetRect];
        double v71 = v70;
        CGAffineTransform v86 = v87;
        long long v72 = *(_OWORD *)&CGAffineTransformIdentity.c;
        *(_OWORD *)&t2.CATransform3D a = *(_OWORD *)&CGAffineTransformIdentity.a;
        *(_OWORD *)&t2.double c = v72;
        *(_OWORD *)&t2.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
        -[THWFreeTransformController p_addOvershootAnimationWithOriginalFrame:originalTransform:targetFrame:targetTransform:completion:](self, "p_addOvershootAnimationWithOriginalFrame:originalTransform:targetFrame:targetTransform:completion:", &v86, &t2, v76, v42, v44, v46, v48, v73, v71, v74, v75);
      }
    }
  }
  else
  {
    [(THWFreeTransformController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)self delegate] freeTransformControllerDidContinue:self withScale:v6];
    }
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  [(THWFreeTransformController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  float v4 = [(THWFreeTransformController *)self delegate];

  return [(THWFreeTransformControllerDelegate *)v4 freeTransformControllerShouldBegin:self];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  if (!self->mDelegate || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mDelegate = self->mDelegate;

  return [(THWFreeTransformControllerDelegate *)mDelegate freeTransformController:self shouldRecognizeSimultaneouslyWithGestureRecognizer:a4];
}

- (BOOL)freeTransformGestureRecognizerShouldDelayRecognizeUntilScaleChange:(id)a3
{
  mDelegate = self->mDelegate;
  if (!mDelegate) {
    mDelegate = self->mGestureRecognizerDelegate;
  }
  if (self->mBounceUpOnly) {
    return 1;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(THWFreeTransformControllerDelegate *)mDelegate freeTransformControllerShouldDelayRecognizeUntilScaleChange:self];
}

- (BOOL)freeTransformGestureRecognizerShouldRubberband:(id)a3
{
  return self->mBounceUpOnly;
}

- (BOOL)freeTransformGestureRecognizerShouldAllowPinchDown:(id)a3
{
  mDelegate = self->mDelegate;
  if (!mDelegate) {
    mDelegate = self->mGestureRecognizerDelegate;
  }
  if (self->mBounceUpOnly) {
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }

  return [(THWFreeTransformControllerDelegate *)mDelegate freeTransformControllerShouldAllowPinchDown:self];
}

- (BOOL)freeTransformGestureRecognizerShouldAllowPinchUp:(id)a3
{
  mDelegate = self->mDelegate;
  if (!mDelegate) {
    mDelegate = self->mGestureRecognizerDelegate;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }

  return [(THWFreeTransformControllerDelegate *)mDelegate freeTransformControllerShouldAllowPinchUp:self];
}

- (THWFreeTransformControllerDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THWFreeTransformControllerDelegate *)a3;
}

- (THWFreeTransformControllerGestureRecognizerDelegate)gestureRecognizerDelegate
{
  return self->mGestureRecognizerDelegate;
}

- (void)setGestureRecognizerDelegate:(id)a3
{
  self->mGestureRecognizerDelegate = (THWFreeTransformControllerGestureRecognizerDelegate *)a3;
}

- (UIView)wrapperView
{
  return self->mWrapperView;
}

- (void)setWrapperView:(id)a3
{
}

- (CALayer)targetLayer
{
  return self->mTargetLayer;
}

- (double)scaleThreshold
{
  return self->mScaleThreshold;
}

- (void)setScaleThreshold:(double)a3
{
  self->mScaleThresholdouble d = a3;
}

- (THWFreeTransformGestureRecognizer)transformGR
{
  return self->mTransformGR;
}

- (void)setTransformGR:(id)a3
{
}

- (CALayer)shadowLayer
{
  return self->mShadowLayer;
}

- (void)setShadowLayer:(id)a3
{
}

- (CALayer)curtainLayer
{
  return self->mCurtainLayer;
}

- (void)setCurtainLayer:(id)a3
{
}

- (void)setOriginalTargetLayerFrame:(CGRect)a3
{
  self->mOriginalTargetLayerFrame = a3;
}

- (CGPoint)lastDragCenter
{
  double x = self->mLastDragCenter.x;
  double y = self->mLastDragCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastDragCenter:(CGPoint)a3
{
  self->mLastDragCenter = a3;
}

- (CGPoint)lastVelocity
{
  double x = self->mLastVelocity.x;
  double y = self->mLastVelocity.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastVelocity:(CGPoint)a3
{
  self->mLastVelocitdouble y = a3;
}

- (BOOL)smoothEdges
{
  return self->mSmoothEdges;
}

- (void)setSmoothEdges:(BOOL)a3
{
  self->mSmoothEdges = a3;
}

- (double)transformScale
{
  return self->mTransformScale;
}

- (void)setTransformScale:(double)a3
{
  self->double mTransformScale = a3;
}

- (BOOL)bounceUpOnly
{
  return self->mBounceUpOnly;
}

- (void)setBounceUpOnly:(BOOL)a3
{
  self->mBounceUpOnldouble y = a3;
}

- (CGRect)completionTargetRect
{
  double x = self->mCompletionTargetRect.origin.x;
  double y = self->mCompletionTargetRect.origin.y;
  double width = self->mCompletionTargetRect.size.width;
  double height = self->mCompletionTargetRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGAffineTransform)currentTransform
{
  long long v3 = *(_OWORD *)&self[5].ty;
  *(_OWORD *)&retstr->CATransform3D a = *(_OWORD *)&self[5].d;
  *(_OWORD *)&retstr->double c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[6].b;
  return self;
}

- (CGAffineTransform)originalShadowTransform
{
  long long v3 = *(_OWORD *)&self[4].a;
  *(_OWORD *)&retstr->CATransform3D a = *(_OWORD *)&self[3].tx;
  *(_OWORD *)&retstr->double c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[4].c;
  return self;
}

- (BOOL)passedThreshold
{
  return self->mPassedThreshold;
}

- (void)setPassedThreshold:(BOOL)a3
{
  self->mPassedThresholdouble d = a3;
}

- (BOOL)isFreeTransformInProgress
{
  return self->mIsFreeTransformInProgress;
}

- (void)setIsFreeTransformInProgress:(BOOL)a3
{
  self->mIsFreeTransformInProgress = a3;
}

- (TSULayerSaveRestore)layerSaveRestore
{
  return self->_layerSaveRestore;
}

- (void)setLayerSaveRestore:(id)a3
{
}

- (void)recreateGestureRecognizerOnView:(id)a3
{
  if ([(THWFreeTransformGestureRecognizer *)[(THWFreeTransformController *)self transformGR] view] != a3)
  {
    [(THWFreeTransformController *)self clearGestureRecognizer];
    if (a3)
    {
      [(THWFreeTransformController *)self setTransformGR:[[THWFreeTransformGestureRecognizer alloc] initWithTarget:self action:"transformGRChanged:"]];
      [(THWFreeTransformGestureRecognizer *)[(THWFreeTransformController *)self transformGR] setFreeTransformDelegate:self];
      [a3 addGestureRecognizer:[self transformGR]];
      [(THWFreeTransformController *)self p_updateUnmovingParentView:a3];
    }
  }
}

- (void)clearGestureRecognizer
{
  if ([(THWFreeTransformController *)self transformGR])
  {
    id v3 = [(THWFreeTransformGestureRecognizer *)[(THWFreeTransformController *)self transformGR] view];
    float v4 = [(THWFreeTransformController *)self transformGR];
    [v3 removeGestureRecognizer:v4];
  }
}

- (void)updateUnmovingParentView
{
  objc_opt_class();
  [(CALayer *)[(THWFreeTransformController *)self targetLayer] delegate];
  uint64_t v3 = TSUDynamicCast();

  [(THWFreeTransformController *)self p_updateUnmovingParentView:v3];
}

- (void)p_updateUnmovingParentView:(id)a3
{
  id v5 = [(THWFreeTransformControllerDelegate *)[(THWFreeTransformController *)self delegate] unmovingParentViewForFreeTransformController:self];
  if (!v5) {
    id v5 = [a3 superview];
  }
  double v6 = [(THWFreeTransformController *)self transformGR];

  [(THWFreeTransformGestureRecognizer *)v6 setUnmovingParentView:v5];
}

@end