@interface THAnimationController
- (BOOL)overshoot;
- (BOOL)p_shouldCrossFade;
- (BOOL)shouldAnimateTargetLayer;
- (CALayer)animationLayer;
- (CALayer)backgroundLayer;
- (CALayer)fadeInAnimationLayer;
- (CALayer)fadeOutAnimationLayer;
- (CALayer)foregroundLayer;
- (CALayer)hostLayer;
- (CALayer)interiorWrapperLayer;
- (CALayer)layerToAnimateUnder;
- (CALayer)sourceOverlayLayer;
- (CALayer)sourceReflectionLayer;
- (CALayer)sourceShadowLayer;
- (CALayer)targetLayer;
- (CALayer)targetReflectionLayer;
- (CALayer)targetShadowLayer;
- (CALayer)wrapperLayer;
- (CGPoint)initialLayerPosition;
- (CGRect)p_targetFrame;
- (CGRect)targetFrame;
- (CGSize)initialLayerSize;
- (THAnimatableDestination)destination;
- (THAnimatableSource)source;
- (THAnimationController)init;
- (TSULayerSaveRestore)layerSaveRestore;
- (double)animationDuration;
- (double)p_rotationAngleFromTransform:(CGAffineTransform *)a3;
- (double)p_scaleForAnimationLayer;
- (double)p_scaleForTargetLayer;
- (double)shadowFadeOutDurationScale;
- (double)shadowTransformDurationScale;
- (double)uniformTargetScale;
- (id)curveAndOvershootAnimation;
- (id)fadeInAnimation;
- (id)fadeInOnDelayAnimationToOpacity:(double)a3;
- (id)p_objectForLayer:(id)a3 key:(id)a4;
- (id)shadowFadeOutAnimation;
- (id)shadowTransformAnimation;
- (id)sourceShadowFadeOutAnimation;
- (void)addBackgroundFadeOutAnimation;
- (void)addContentAnimation;
- (void)addForegroundFadeAnimation;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)didAnimate;
- (void)didAnimatePostCommit;
- (void)p_restoreLayer:(id)a3;
- (void)p_saveLayer:(id)a3;
- (void)performAnimation;
- (void)presentAnimationWithCompletionBlock:(id)a3 overshoot:(BOOL)a4;
- (void)removeAllObservers;
- (void)removeObserver:(id)a3;
- (void)setBackgroundLayer:(id)a3;
- (void)setDestination:(id)a3;
- (void)setForegroundLayer:(id)a3;
- (void)setHostLayer:(id)a3;
- (void)setInitialLayerPosition:(CGPoint)a3;
- (void)setInitialLayerSize:(CGSize)a3;
- (void)setInteriorWrapperLayer:(id)a3;
- (void)setLayerSaveRestore:(id)a3;
- (void)setLayerToAnimateUnder:(id)a3;
- (void)setOvershoot:(BOOL)a3;
- (void)setShadowFadeOutDurationScale:(double)a3;
- (void)setShadowTransformDurationScale:(double)a3;
- (void)setShouldAnimateTargetLayer:(BOOL)a3;
- (void)setSource:(id)a3;
- (void)setSourceOverlayLayer:(id)a3;
- (void)setSourceReflectionLayer:(id)a3;
- (void)setSourceShadowLayer:(id)a3;
- (void)setTargetFrame:(CGRect)a3;
- (void)setTargetReflectionLayer:(id)a3;
- (void)setTargetShadowLayer:(id)a3;
- (void)setWrapperLayer:(id)a3;
- (void)setupAnimationLayer;
- (void)setupAnimationLayerForCrossFade;
- (void)setupTarget;
- (void)teardownTarget;
- (void)willAnimate;
@end

@implementation THAnimationController

- (THAnimationController)init
{
  v5.receiver = self;
  v5.super_class = (Class)THAnimationController;
  v2 = [(THAnimationController *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)TSULayerSaveRestore);
    [(THAnimationController *)v2 setLayerSaveRestore:v3];

    [(THAnimationController *)v2 setShadowFadeOutDurationScale:1.0];
    v2->mObservers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THAnimationController;
  [(THAnimationController *)&v3 dealloc];
}

- (CALayer)animationLayer
{
  if ([(THAnimationController *)self wrapperLayer])
  {
    return [(THAnimationController *)self wrapperLayer];
  }
  else if ([(THAnimationController *)self shouldAnimateTargetLayer])
  {
    v4 = [(THAnimationController *)self destination];
    return (CALayer *)[(THAnimatableDestination *)v4 targetLayer];
  }
  else
  {
    objc_super v5 = [(THAnimationController *)self source];
    return (CALayer *)[(THAnimatableSource *)v5 animationLayer];
  }
}

- (CALayer)targetLayer
{
  if ([(THAnimationController *)self shouldAnimateTargetLayer]) {
    return 0;
  }
  v4 = [(THAnimationController *)self destination];

  return (CALayer *)[(THAnimatableDestination *)v4 targetLayer];
}

- (CALayer)targetShadowLayer
{
  if (![(THAnimationController *)self shouldAnimateTargetLayer]) {
    return self->_targetShadowLayer;
  }

  return [(THAnimationController *)self sourceShadowLayer];
}

- (CALayer)targetReflectionLayer
{
  if (![(THAnimationController *)self shouldAnimateTargetLayer]) {
    return self->_targetReflectionLayer;
  }

  return [(THAnimationController *)self sourceReflectionLayer];
}

- (CALayer)fadeInAnimationLayer
{
  if (([(THAnimatableSource *)[(THAnimationController *)self source] shouldFadeOutAnimationLayer:[(THAnimationController *)self destination]] & 1) == 0&& (![(THAnimationController *)self targetLayer]|| ![(THAnimatableDestination *)[(THAnimationController *)self destination] shouldFadeInTargetLayer:[(THAnimationController *)self source]]))
  {
    return 0;
  }
  objc_super v3 = [(THAnimationController *)self destination];

  return (CALayer *)[(THAnimatableDestination *)v3 targetLayer];
}

- (CALayer)fadeOutAnimationLayer
{
  if (([(THAnimatableSource *)[(THAnimationController *)self source] shouldFadeOutAnimationLayer:[(THAnimationController *)self destination]] & 1) == 0&& (![(THAnimationController *)self targetLayer]|| ![(THAnimatableDestination *)[(THAnimationController *)self destination] shouldFadeInTargetLayer:[(THAnimationController *)self source]]))
  {
    return 0;
  }
  objc_super v3 = [(THAnimationController *)self source];

  return (CALayer *)[(THAnimatableSource *)v3 animationLayer];
}

- (void)addObserver:(id)a3
{
  if ((-[NSMutableArray containsObject:](self->mObservers, "containsObject:") & 1) == 0)
  {
    mObservers = self->mObservers;
    [(NSMutableArray *)mObservers addObject:a3];
  }
}

- (void)removeObserver:(id)a3
{
}

- (void)removeAllObservers
{
}

- (void)willAnimate
{
  [+[UIApplication sharedApplication] beginIgnoringInteractionEvents];
  mObservers = self->mObservers;

  [(NSMutableArray *)mObservers tsu_makeObjectsPerformSelectorIfImplemented:"animationControllerWillPresent:" withObject:self];
}

- (void)didAnimate
{
  id v3 = [(NSMutableArray *)self->mObservers copy];
  [v3 tsu_makeObjectsPerformSelectorIfImplemented:@"animationControllerDidPresent:" withObject:self];

  [+[UIApplication sharedApplication] endIgnoringInteractionEvents];
  v4 = objc_opt_class();

  [v4 performSelector:"attemptRotationToDeviceOrientation" withObject:0 afterDelay:0.01];
}

- (void)didAnimatePostCommit
{
  id v3 = self;
  id v4 = [(NSMutableArray *)self->mObservers copy];
  [v4 tsu_makeObjectsPerformSelectorIfImplemented:@"animationControllerDidPresentPostCommit:" withObject:self];

  [(THAnimationController *)self removeAllObservers];
}

- (void)setupAnimationLayerForCrossFade
{
  memset(&v60, 0, sizeof(v60));
  id v3 = [(THAnimationController *)self source];
  if (v3) {
    [(THAnimatableSource *)v3 freeTransform];
  }
  else {
    memset(&v60, 0, sizeof(v60));
  }
  CGAffineTransform t1 = v60;
  long long v36 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v38 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&t2.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&t2.c = v36;
  long long v34 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&t2.tx = v34;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v57[0] = v38;
    v57[1] = v36;
    v57[2] = v34;
    [(-[THAnimationController source](self, "source"), "animationLayer") setAffineTransform:v57];
  }
  [(THAnimationController *)self p_scaleForAnimationLayer];
  CGFloat v5 = v4;
  [(THAnimationController *)self p_scaleForTargetLayer];
  CGFloat v7 = v6;
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeScale(&t1, v5, v5);
  v8 = [(THAnimationController *)self fadeInAnimationLayer];
  v9 = [(THAnimationController *)self fadeOutAnimationLayer];
  [(CALayer *)v8 setHidden:1];
  [(CALayer *)v9 setHidden:0];
  v10 = [(THAnimationController *)self hostLayer];
  [self.source.animationLayer frame];
  TSDCenterOfRect();
  -[CALayer convertPoint:fromLayer:](v10, "convertPoint:fromLayer:", objc_msgSend(-[THAnimatableSource animationLayer](-[THAnimationController source](self, "source"), "animationLayer"), "superlayer"), v11, v12);
  -[THAnimationController setInitialLayerPosition:](self, "setInitialLayerPosition:");
  [(CALayer *)[(THAnimationController *)self animationLayer] frame];
  -[THAnimationController setInitialLayerSize:](self, "setInitialLayerSize:", v13, v14);
  v15 = [(THAnimationController *)self hostLayer];
  [(CALayer *)[(THAnimationController *)self animationLayer] frame];
  -[CALayer convertRect:fromLayer:](v15, "convertRect:fromLayer:", [(CALayer *)[(THAnimationController *)self animationLayer] superlayer], v16, v17, v18, v19);
  id v20 = objc_alloc_init((Class)CALayer);
  v56[0] = v39;
  v56[1] = v37;
  v56[2] = v35;
  [v20 setAffineTransform:v56];
  [(THAnimationController *)self initialLayerPosition];
  TSDRectWithCenterAndSize();
  [v20 setFrame:];
  id v21 = objc_alloc_init((Class)CALayer);
  [v20 bounds];
  [v21 setFrame:];
  [v20 addSublayer:v21];
  layerToAnimateUnder = self->_layerToAnimateUnder;
  v23 = [(THAnimationController *)self hostLayer];
  if (layerToAnimateUnder) {
    [(CALayer *)v23 insertSublayer:v20 below:self->_layerToAnimateUnder];
  }
  else {
    [(CALayer *)v23 addSublayer:v20];
  }
  if (v5 != 1.0)
  {
    CGAffineTransform v55 = t1;
    [v20 setAffineTransform:&v55];
  }
  [(CALayer *)v9 position];
  [v21 convertPoint:v24 fromLayer:[v9 superlayer]];
  -[CALayer setPosition:](v9, "setPosition:");
  [v21 addSublayer:v9];
  [v21 addSublayer:v8];
  if (v5 != 1.0)
  {
    memset(&t2, 0, sizeof(t2));
    CGAffineTransformMakeScale(&t2, 1.0 / v5, 1.0 / v5);
    memset(&v54, 0, sizeof(v54));
    if (v9) {
      [(CALayer *)v9 transform];
    }
    else {
      memset(&v53, 0, sizeof(v53));
    }
    CATransform3DGetAffineTransform(&v54, &v53);
    CGAffineTransform v51 = v54;
    CGAffineTransform v50 = t2;
    CGAffineTransformConcat(&v52, &v51, &v50);
    CGAffineTransform v49 = v52;
    [(CALayer *)v9 setAffineTransform:&v49];
  }
  if (v7 != 1.0)
  {
    memset(&t2, 0, sizeof(t2));
    CGAffineTransformMakeScale(&t2, v7, v7);
    memset(&v54, 0, sizeof(v54));
    v26 = [(THAnimationController *)self targetLayer];
    if (v26) {
      [(CALayer *)v26 transform];
    }
    else {
      memset(&v48, 0, sizeof(v48));
    }
    CATransform3DGetAffineTransform(&v54, &v48);
    CGAffineTransform v51 = v54;
    CGAffineTransform v50 = t2;
    CGAffineTransformConcat(&v47, &v51, &v50);
    v27 = [(THAnimationController *)self targetLayer];
    CGAffineTransform v46 = v47;
    [(CALayer *)v27 setAffineTransform:&v46];
  }
  [v21 bounds];
  TSDCenterOfRect();
  double v29 = v28;
  double v31 = v30;
  [(CALayer *)v8 frame];
  TSDCenterOfRect();
  memset(&t2, 0, sizeof(t2));
  CGAffineTransformMakeTranslation(&t2, -(v32 - v29), -(v33 - v31));
  memset(&v54, 0, sizeof(v54));
  if (v8) {
    [(CALayer *)v8 transform];
  }
  else {
    memset(&v45, 0, sizeof(v45));
  }
  CATransform3DGetAffineTransform(&v54, &v45);
  CGAffineTransform v51 = v54;
  CGAffineTransform v50 = t2;
  CGAffineTransformConcat(&v44, &v51, &v50);
  CGAffineTransform v43 = v44;
  [(CALayer *)v8 setAffineTransform:&v43];
  CGAffineTransform t2 = v60;
  *(_OWORD *)&v54.a = v39;
  *(_OWORD *)&v54.c = v37;
  *(_OWORD *)&v54.tx = v35;
  if (!CGAffineTransformEqualToTransform(&t2, &v54))
  {
    memset(&t2, 0, sizeof(t2));
    if (v20) {
      [v20 transform];
    }
    else {
      memset(&v42, 0, sizeof(v42));
    }
    CATransform3DGetAffineTransform(&t2, &v42);
    CGAffineTransform v54 = t2;
    CGAffineTransform v51 = v60;
    CGAffineTransformConcat(&v41, &v54, &v51);
    CGAffineTransform v40 = v41;
    [v20 setAffineTransform:&v40];
  }
  [(THAnimationController *)self setInteriorWrapperLayer:v21];
  [(THAnimationController *)self setWrapperLayer:v20];
}

- (void)setupAnimationLayer
{
  memset(&v27, 0, sizeof(v27));
  id v3 = [(THAnimationController *)self source];
  if (v3) {
    [(THAnimatableSource *)v3 freeTransform];
  }
  else {
    memset(&v27, 0, sizeof(v27));
  }
  CGAffineTransform t1 = v27;
  long long v16 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v18 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&t2.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&t2.c = v16;
  long long v14 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&t2.tx = v14;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v24[0] = v18;
    v24[1] = v16;
    v24[2] = v14;
    [(CALayer *)[(THAnimationController *)self animationLayer] setAffineTransform:v24];
  }
  double v4 = [(THAnimationController *)self hostLayer];
  [self.source.animationLayer frame];
  TSDCenterOfRect();
  -[CALayer convertPoint:fromLayer:](v4, "convertPoint:fromLayer:", [THAnimatableSource animationLayer][-[THAnimationController source](self, "source"), "animationLayer"], "superlayer"), v5, v6);
  -[THAnimationController setInitialLayerPosition:](self, "setInitialLayerPosition:");
  [(CALayer *)[(THAnimationController *)self animationLayer] frame];
  -[THAnimationController setInitialLayerSize:](self, "setInitialLayerSize:", v7, v8);
  id v9 = objc_alloc_init((Class)CALayer);
  [(THAnimationController *)self initialLayerPosition];
  [(THAnimationController *)self initialLayerSize];
  TSDRectWithCenterAndSize();
  [v9 setFrame:];
  v23[0] = v19;
  v23[1] = v17;
  v23[2] = v15;
  [v9 setAffineTransform:v23];
  [v9 setZPosition:1.0];
  [(CALayer *)[(THAnimationController *)self hostLayer] addSublayer:v9];
  if ([(THAnimationController *)self sourceOverlayLayer]) {
    [(CALayer *)[(THAnimationController *)self hostLayer] addSublayer:[(THAnimationController *)self sourceOverlayLayer]];
  }
  [(-[THAnimationController source](self, "source"), "animationLayer") position];
  objc_msgSend(v9, "convertPoint:fromLayer:", objc_msgSend(-[THAnimatableSource animationLayer](-[THAnimationController source](self, "source"), "animationLayer"), "superlayer"), v10, v11);
  -[CALayer setPosition:]([(THAnimationController *)self animationLayer], "setPosition:", v12, v13);
  CGAffineTransform t1 = v27;
  *(_OWORD *)&t2.a = v19;
  *(_OWORD *)&t2.c = v17;
  *(_OWORD *)&t2.tx = v15;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    if (v9) {
      [v9 affineTransform];
    }
    else {
      memset(&v21, 0, sizeof(v21));
    }
    CGAffineTransform t1 = v27;
    CGAffineTransformConcat(&v22, &v21, &t1);
    CGAffineTransform v20 = v22;
    [v9 setAffineTransform:&v20];
  }
  [v9 addSublayer:[self animationLayer]];
  [(THAnimationController *)self setWrapperLayer:v9];

  [(CALayer *)[(THAnimationController *)self targetLayer] setHidden:1];
}

- (void)setupTarget
{
  +[CATransaction flush];
  +[CATransaction begin];
  +[CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
  id v3 = [(NSMutableArray *)self->mObservers mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  mObservers = self->mObservers;
  id v5 = [(NSMutableArray *)mObservers countByEnumeratingWithState:&v16 objects:v20 count:16];
  double v6 = &selRef_absolutePageIndexForRelativePageIndex_forPresentationType_;
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v17;
    do
    {
      id v9 = 0;
      double v10 = v6;
      double v11 = v6[379];
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(mObservers);
        }
        double v12 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v9);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && [v12 animationControllerSetsDestination:self]
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [v12 animationControllerSetupTarget:self];
          [v3 removeObject:v12];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)mObservers countByEnumeratingWithState:&v16 objects:v20 count:16];
      double v6 = v10;
    }
    while (v7);
  }
  else
  {
    double v11 = "animationControllerSetupTarget:";
  }
  [v3 tsu_makeObjectsPerformSelectorIfImplemented:v11 withObject:self];

  [(THAnimationController *)self destination];
  if (objc_opt_respondsToSelector()) {
    [(THAnimatableDestination *)[(THAnimationController *)self destination] animatableDestinationSetupTarget:self];
  }
  [(THAnimationController *)self setShouldAnimateTargetLayer:[(THAnimatableSource *)[(THAnimationController *)self source] shouldAnimateTargetLayer:[(THAnimationController *)self destination]]];
  [(THAnimationController *)self p_targetFrame];
  -[THAnimationController setTargetFrame:](self, "setTargetFrame:");
  if ([(THAnimatableSource *)[(THAnimationController *)self source] shouldFadeOutAnimationLayer:[(THAnimationController *)self destination]]&& (![(THAnimatableSource *)[(THAnimationController *)self source] shouldFadeOutAnimationLayer:[(THAnimationController *)self destination]]|| ([(THAnimatableSource *)[(THAnimationController *)self source] shouldAnimateTargetLayer:[(THAnimationController *)self destination]] & 1) == 0))
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnimationController setupTarget]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnimationController.m") lineNumber:530 description:@"When fading out source animation layer, we should animate in the target layer."];
  }
  [(THAnimationController *)self p_saveLayer:[(THAnimatableSource *)[(THAnimationController *)self source] animationLayer]];
  [(THAnimationController *)self p_saveLayer:[(THAnimatableDestination *)[(THAnimationController *)self destination] targetLayer]];
  [(CALayer *)[(THAnimationController *)self foregroundLayer] setOpacity:0.0];
  [(THAnimationController *)self source];
  if (objc_opt_respondsToSelector()) {
    [(THAnimationController *)self setSourceShadowLayer:[(THAnimatableSource *)[(THAnimationController *)self source] sourceShadowLayer]];
  }
  [(THAnimationController *)self source];
  if (objc_opt_respondsToSelector()) {
    [(THAnimationController *)self setSourceReflectionLayer:[(THAnimatableSource *)[(THAnimationController *)self source] sourceReflectionLayer]];
  }
  [(THAnimationController *)self source];
  if (objc_opt_respondsToSelector()) {
    [(THAnimationController *)self setSourceOverlayLayer:[(THAnimatableSource *)[(THAnimationController *)self source] sourceOverlayLayer]];
  }
  [(THAnimationController *)self destination];
  if (objc_opt_respondsToSelector())
  {
    [(THAnimationController *)self setTargetShadowLayer:[(THAnimatableDestination *)[(THAnimationController *)self destination] targetShadowLayer]];
    [(THAnimationController *)self p_saveLayer:[(THAnimationController *)self targetShadowLayer]];
    [(CALayer *)[(THAnimationController *)self targetShadowLayer] setOpacity:0.0];
  }
  [(THAnimationController *)self destination];
  if (objc_opt_respondsToSelector())
  {
    [(THAnimationController *)self setTargetReflectionLayer:[(THAnimatableDestination *)[(THAnimationController *)self destination] targetReflectionLayer]];
    [(THAnimationController *)self p_saveLayer:[(THAnimationController *)self targetReflectionLayer]];
    [(CALayer *)[(THAnimationController *)self targetReflectionLayer] setOpacity:0.0];
  }
  [(THAnimationController *)self source];
  if (objc_opt_respondsToSelector()) {
    unsigned int v13 = [(THAnimatableSource *)[(THAnimationController *)self source] enforceAnimationLayer];
  }
  else {
    unsigned int v13 = 0;
  }
  if ([(THAnimationController *)self p_shouldCrossFade])
  {
    [(THAnimationController *)self setupAnimationLayerForCrossFade];
  }
  else
  {
    long long v14 = [(CALayer *)[(THAnimationController *)self animationLayer] superlayer];
    if (v14 == [(THAnimationController *)self hostLayer]) {
      int v15 = v13;
    }
    else {
      int v15 = 1;
    }
    if (v15 == 1) {
      [(THAnimationController *)self setupAnimationLayer];
    }
  }
  +[CATransaction commit];
  +[CATransaction flush];
}

- (void)teardownTarget
{
  [(THAnimationController *)self p_restoreLayer:[(THAnimatableDestination *)[(THAnimationController *)self destination] targetLayer]];
  [(THAnimationController *)self p_restoreLayer:[(THAnimatableSource *)[(THAnimationController *)self source] animationLayer]];
  [(THAnimationController *)self p_restoreLayer:[(THAnimationController *)self targetShadowLayer]];
  [(THAnimationController *)self p_restoreLayer:[(THAnimationController *)self targetReflectionLayer]];
  [(CALayer *)[(THAnimationController *)self foregroundLayer] removeAnimationForKey:@"THForegroundFadeAnimation"];
  [(CALayer *)[(THAnimationController *)self backgroundLayer] removeAnimationForKey:@"THBackgroundFadeAnimation"];
  [(CALayer *)[(THAnimationController *)self wrapperLayer] removeFromSuperlayer];
  [(CALayer *)[(THAnimationController *)self sourceOverlayLayer] removeFromSuperlayer];
  [(THAnimationController *)self setWrapperLayer:0];
  [(THAnimationController *)self setSourceShadowLayer:0];
  [(THAnimationController *)self setSourceReflectionLayer:0];
  [(THAnimationController *)self setSourceOverlayLayer:0];
  [(THAnimationController *)self setTargetShadowLayer:0];
  [(THAnimationController *)self setTargetReflectionLayer:0];
  [(NSMutableArray *)self->mObservers tsu_makeObjectsPerformSelectorIfImplemented:"animationControllerTeardownTarget:" withObject:self];
  [(THAnimationController *)self source];
  if (objc_opt_respondsToSelector()) {
    [(THAnimatableSource *)[(THAnimationController *)self source] reparentAnimationLayerIfBackedByView:self];
  }
  [(THAnimationController *)self destination];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(THAnimationController *)self destination];
    [(THAnimatableDestination *)v3 reparentTargetLayerIfBackedByView:self];
  }
}

- (void)presentAnimationWithCompletionBlock:(id)a3 overshoot:(BOOL)a4
{
  BOOL v4 = a4;
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnimationController presentAnimationWithCompletionBlock:overshoot:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnimationController.m") lineNumber:627 description:@"Manipulating UI outside main thread."];
  }
  [+[UIWindow keyWindow](UIWindow, "keyWindow") beginDisablingInterfaceAutorotation];
  [(THAnimationController *)self setOvershoot:v4];
  [(THAnimationController *)self willAnimate];
  [(THAnimationController *)self setupTarget];
  [(CALayer *)[(THAnimationController *)self animationLayer] removeAllAnimations];
  [(CALayer *)[(THAnimationController *)self fadeInAnimationLayer] removeAllAnimations];
  [(CALayer *)[(THAnimationController *)self fadeOutAnimationLayer] removeAllAnimations];
  +[CATransaction begin];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_15C190;
  v7[3] = &unk_456E88;
  v7[4] = self;
  v7[5] = a3;
  +[CATransaction setCompletionBlock:v7];
  [(THAnimationController *)self performAnimation];
  +[CATransaction commit];
}

- (double)animationDuration
{
  [(THAnimationController *)self source];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0.25;
  }
  id v3 = [(THAnimationController *)self source];

  [(THAnimatableSource *)v3 animationDuration];
  return result;
}

- (void)addForegroundFadeAnimation
{
  id v3 = [(THAnimationController *)self foregroundLayer];
  BOOL v4 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [(CABasicAnimation *)v4 setFromValue:+[NSNumber numberWithFloat:0.0]];
  LODWORD(v5) = 1.0;
  [(CABasicAnimation *)v4 setToValue:+[NSNumber numberWithFloat:v5]];
  [(THAnimationController *)self animationDuration];
  -[CABasicAnimation setDuration:](v4, "setDuration:");
  [(CABasicAnimation *)v4 setRemovedOnCompletion:0];
  [(CABasicAnimation *)v4 setFillMode:kCAFillModeForwards];
  [(CALayer *)v3 addAnimation:v4 forKey:@"THForegroundFadeAnimation"];
  double v6 = [(THAnimationController *)self foregroundLayer];
  LODWORD(v7) = 1.0;

  [(CALayer *)v6 setOpacity:v7];
}

- (void)addBackgroundFadeOutAnimation
{
  id v3 = [(THAnimationController *)self backgroundLayer];
  BOOL v4 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  LODWORD(v5) = 1.0;
  [(CABasicAnimation *)v4 setFromValue:+[NSNumber numberWithFloat:v5]];
  [(CABasicAnimation *)v4 setToValue:+[NSNumber numberWithFloat:0.0]];
  [(THAnimationController *)self animationDuration];
  -[CABasicAnimation setDuration:](v4, "setDuration:");
  [(CABasicAnimation *)v4 setRemovedOnCompletion:0];
  [(CABasicAnimation *)v4 setFillMode:kCAFillModeForwards];

  [(CALayer *)v3 addAnimation:v4 forKey:@"THBackgroundFadeAnimation"];
}

- (void)addContentAnimation
{
  [(NSMutableArray *)self->mObservers tsu_makeObjectsPerformSelectorIfImplemented:"animationControllerWillAddContentAnimations:" withObject:self];
  [(CALayer *)[(THAnimationController *)self animationLayer] setHidden:0];
  if ([(THAnimationController *)self animationLayer]) {
    [(CALayer *)[(THAnimationController *)self animationLayer] addAnimation:[(THAnimationController *)self curveAndOvershootAnimation] forKey:@"animationLayerCurveAndOvershoot"];
  }
  if ([(THAnimationController *)self p_shouldCrossFade])
  {
    [(CALayer *)[(THAnimationController *)self fadeInAnimationLayer] setHidden:0];
    [(CALayer *)[(THAnimationController *)self fadeOutAnimationLayer] setHidden:1];
    id v3 = +[CATransition animation];
    [v3 setType:kCATransitionFade];
    [(THAnimationController *)self animationDuration];
    [v3 setDuration:];
    unsigned int v4 = [(THAnimationController *)self shouldAnimateTargetLayer];
    double v5 = &kCAMediaTimingFunctionEaseOut;
    if (!v4) {
      double v5 = &kCAMediaTimingFunctionEaseIn;
    }
    [v3 setTimingFunction:[CAMediaTimingFunction functionWithName:*v5]];
    [(CALayer *)[(THAnimationController *)self interiorWrapperLayer] addAnimation:v3 forKey:0];
  }
  if ([(THAnimatableSource *)[(THAnimationController *)self source] shadowAnimationLayer])
  {
    id v6 = [(THAnimationController *)self shadowFadeOutAnimation];
    double v7 = (CALayer *)[(THAnimatableSource *)[(THAnimationController *)self source] shadowAnimationLayer];
    CFStringRef v8 = @"THAnimationControllerFadeOutAnimation";
LABEL_15:
    [(CALayer *)v7 addAnimation:v6 forKey:v8];
    goto LABEL_16;
  }
  if ([(THAnimationController *)self sourceShadowLayer]) {
    [(CALayer *)[(THAnimationController *)self sourceShadowLayer] addAnimation:[(THAnimationController *)self sourceShadowFadeOutAnimation] forKey:@"fadeOutAnimation"];
  }
  if ([(THAnimationController *)self sourceReflectionLayer]) {
    [(CALayer *)[(THAnimationController *)self sourceReflectionLayer] addAnimation:[(THAnimationController *)self sourceShadowFadeOutAnimation] forKey:@"fadeOutAnimation"];
  }
  if ([(THAnimationController *)self sourceOverlayLayer])
  {
    id v6 = [(THAnimationController *)self sourceShadowFadeOutAnimation];
    double v7 = [(THAnimationController *)self sourceOverlayLayer];
    CFStringRef v8 = @"fadeOutAnimation";
    goto LABEL_15;
  }
LABEL_16:
  if ([(THAnimationController *)self targetShadowLayer])
  {
    [self p_objectForLayer:[self targetShadowLayer] key:@"opacity"] floatValue];
    [(CALayer *)[(THAnimationController *)self targetShadowLayer] addAnimation:[(THAnimationController *)self fadeInOnDelayAnimationToOpacity:v9] forKey:@"fadeInAnimation"];
  }
  if ([(THAnimationController *)self targetReflectionLayer])
  {
    [self p_objectForLayer:[self targetReflectionLayer] key:@"opacity"] floatValue];
    [(CALayer *)[(THAnimationController *)self targetReflectionLayer] addAnimation:[(THAnimationController *)self fadeInOnDelayAnimationToOpacity:v10] forKey:@"fadeInAnimation"];
  }
  id v11 = [(THAnimationController *)self shadowTransformAnimation];
  if (v11) {
    [(-[THAnimationController source](self, "source"), "shadowAnimationLayer") addAnimation:v11 forKey:@"THAnimationControllerShadowTransform"];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  mObservers = self->mObservers;
  id v13 = [(NSMutableArray *)mObservers countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(mObservers);
        }
        long long v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v17 animationControllerDidAddContentAnimations:self uniformTargetScale:self->_uniformTargetScale];
        }
      }
      id v14 = [(NSMutableArray *)mObservers countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

- (id)curveAndOvershootAnimation
{
  memset(&v89, 0, sizeof(v89));
  id v3 = [(THAnimationController *)self animationLayer];
  if (v3) {
    [(CALayer *)v3 transform];
  }
  else {
    memset(&v88, 0, sizeof(v88));
  }
  CATransform3DGetAffineTransform(&v89, &v88);
  unsigned int v4 = [(THAnimationController *)self animationLayer];
  long long v74 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v75 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v87[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v87[1] = v74;
  long long v73 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v87[2] = v73;
  [(CALayer *)v4 setAffineTransform:v87];
  [(THAnimationController *)self initialLayerPosition];
  [(THAnimationController *)self initialLayerSize];
  TSDRectWithCenterAndSize();
  double v6 = v5;
  double v8 = v7;
  if ([(THAnimationController *)self targetLayer]
    && ([(THAnimatableDestination *)[(THAnimationController *)self destination] shouldFadeInTargetLayer:[(THAnimationController *)self source]] & 1) == 0)
  {
    v86[0] = v75;
    v86[1] = v74;
    v86[2] = v73;
    [(CALayer *)[(THAnimationController *)self targetLayer] setAffineTransform:v86];
  }
  [(THAnimationController *)self targetFrame];
  double v10 = v9;
  double v70 = v11;
  double v68 = v89.a;
  CGFloat d = v89.d;
  double c = v89.c;
  HIDWORD(v13) = HIDWORD(v89.tx);
  CGFloat ty = v89.ty;
  double v77 = v89.b;
  CGFloat tx = v89.tx;
  LODWORD(v13) = 1055286886;
  LODWORD(v11) = 1.0;
  LODWORD(v9) = 1057803469;
  v66 = +[CAMediaTimingFunction functionWithControlPoints:v13 :0.0 :v9 :v11];
  LODWORD(v15) = 0.25;
  LODWORD(v16) = 0.25;
  LODWORD(v17) = 1.0;
  LODWORD(v18) = 1057803469;
  long long v19 = +[CAMediaTimingFunction functionWithControlPoints:v15 :v16 :v18 :v17];
  [(THAnimationController *)self animationDuration];
  double v63 = v20;
  [(THAnimationController *)self animationDuration];
  double v69 = v21;
  unsigned int v22 = [(THAnimationController *)self overshoot];
  [(THAnimationController *)self overshoot];
  [(THAnimationController *)self destination];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(THAnimatableDestination *)[(THAnimationController *)self destination] shouldAnimateToFit])
  {
    double v23 = THScaleNeededToFitSizeInSize(v6, v8, v10, v70);
  }
  else
  {
    double v23 = THScaleNeededToFillSizeInSize(v6, v8, v10, v70);
  }
  double v65 = v23;
  double v76 = d;
  CGFloat v72 = ty;
  TSDMultiplyPointScalar();
  TSDCenterOfRect();
  TSDCenterOfRect();
  TSDSubtractPoints();
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  TSDAddPoints();
  double v28 = 0.0;
  if (v22) {
    double v28 = 0.05;
  }
  double v64 = v28;
  double v67 = v63 * 0.899999976;
  long long v29 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v85.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v85.m33 = v29;
  long long v30 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v85.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v85.m43 = v30;
  long long v31 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v85.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v85.m13 = v31;
  long long v32 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v85.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v85.m23 = v32;
  *(_OWORD *)&v84.m31 = *(_OWORD *)&v85.m31;
  *(_OWORD *)&v84.m33 = v29;
  *(_OWORD *)&v84.m41 = *(_OWORD *)&v85.m41;
  *(_OWORD *)&v84.m43 = v30;
  *(_OWORD *)&v84.m11 = *(_OWORD *)&v85.m11;
  *(_OWORD *)&v84.m13 = v31;
  double v33 = (v10 / v6 + v70 / v8) * 0.5 * (1.0 / ((fabs(v68 + c) + fabs(v77 + v76)) * 0.5));
  *(_OWORD *)&v84.m21 = *(_OWORD *)&v85.m21;
  *(_OWORD *)&v84.m23 = v32;
  CATransform3DTranslate(&v85, &v84, v25, v27, 0.0);
  CATransform3D a = v85;
  CATransform3DScale(&v84, &a, v65, v65, 1.0);
  CATransform3D v85 = v84;
  *(_OWORD *)&v84.m11 = v75;
  *(_OWORD *)&v84.m13 = v74;
  *(_OWORD *)&v84.m21 = v73;
  CATransform3DMakeAffineTransform(&b, (CGAffineTransform *)&v84);
  CATransform3D a = v85;
  CATransform3DConcat(&v84, &a, &b);
  CATransform3D v85 = v84;
  self->_uniformTargetScale = v65;
  TSDMultiplyPointScalar();
  double v35 = v34;
  double v71 = v36;
  v84.m11 = v68;
  v84.m12 = v77;
  v84.m13 = c;
  v84.m14 = v76;
  v84.m21 = tx;
  v84.m22 = v72;
  [(THAnimationController *)self p_rotationAngleFromTransform:&v84];
  double v38 = v37;
  *(_OWORD *)&v84.m11 = v75;
  *(_OWORD *)&v84.m13 = v74;
  *(_OWORD *)&v84.m21 = v73;
  [(THAnimationController *)self p_rotationAngleFromTransform:&v84];
  double v40 = v38 - v39;
  double v41 = 3.14059265 / vabdd_f64(v38, v39) + -1.0;
  if (v41 > 0.05) {
    double v41 = 0.05;
  }
  double v42 = v40 * v41;
  double v43 = fmax((v33 + -1.0) * v64 + 1.0, 0.96);
  if (v43 <= 1.04) {
    double v44 = v43;
  }
  else {
    double v44 = 1.04;
  }
  TSDMultiplyPointScalar();
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  CATransform3D v84 = v85;
  CATransform3D a = v85;
  CATransform3DScale(&v84, &a, v44, v44, 1.0);
  CATransform3D v81 = v84;
  CATransform3DRotate(&a, &v81, v42, 0.0, 0.0, 1.0);
  CATransform3D v84 = a;
  CATransform3D v81 = a;
  CATransform3DTranslate(&a, &v81, v46, v48, 0.0);
  CATransform3D v84 = a;
  CGAffineTransform v49 = +[CAKeyframeAnimation animationWithKeyPath:@"transform.translation"];
  [(CAKeyframeAnimation *)v49 setValues:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", CGSizeZero.width, CGSizeZero.height), +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v35, v71), +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", CGSizeZero.width, CGSizeZero.height), 0)];
  [(CAKeyframeAnimation *)v49 setTimingFunctions:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut), +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut], 0)];
  CGAffineTransform v50 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v51) = 1051361018;
  CGAffineTransform v52 = +[NSNumber numberWithFloat:v51];
  LODWORD(v53) = 1.0;
  [(CAKeyframeAnimation *)v49 setKeyTimes:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v50, v52, +[NSNumber numberWithFloat:v53], 0)];
  [(CAKeyframeAnimation *)v49 setDuration:v69 + v67 * 0.5];
  [(CAKeyframeAnimation *)v49 setFillMode:kCAFillModeForwards];
  [(CAKeyframeAnimation *)v49 setRemovedOnCompletion:0];
  CGAffineTransform v54 = +[CAKeyframeAnimation animationWithKeyPath:@"transform"];
  a.m11 = v68;
  a.m12 = v77;
  a.m13 = c;
  a.m14 = v76;
  a.m21 = tx;
  a.m22 = v72;
  CATransform3DMakeAffineTransform(&v80, (CGAffineTransform *)&a);
  CGAffineTransform v55 = +[NSValue valueWithCATransform3D:&v80];
  CATransform3D a = v84;
  v56 = +[NSValue valueWithCATransform3D:&a];
  CATransform3D a = v85;
  [(CAKeyframeAnimation *)v54 setValues:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v55, v56, +[NSValue valueWithCATransform3D:&a], 0)];
  [(CAKeyframeAnimation *)v54 setTimingFunctions:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v19, v66, 0)];
  v57 = +[NSNumber numberWithFloat:0.0];
  double v58 = v69 / (v69 + v67);
  *(float *)&double v58 = v58;
  v59 = +[NSNumber numberWithFloat:v58];
  LODWORD(v60) = 1.0;
  [(CAKeyframeAnimation *)v54 setKeyTimes:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v57, v59, +[NSNumber numberWithFloat:v60], 0)];
  [(CAKeyframeAnimation *)v54 setDuration:v69 + v67];
  [(CAKeyframeAnimation *)v54 setFillMode:kCAFillModeForwards];
  [(CAKeyframeAnimation *)v54 setRemovedOnCompletion:0];
  id v61 = +[CAAnimationGroup animation];
  [v61 setAnimations:[NSArray arrayWithObjects:v49, v54, nil]];
  [v61 setDuration:v69 + v67];
  [v61 setFillMode:kCAFillModeForwards];
  [v61 setRemovedOnCompletion:0];
  return v61;
}

- (id)fadeInAnimation
{
  [(THAnimationController *)self animationDuration];
  double v4 = v3;
  double v5 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [(CABasicAnimation *)v5 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
  [(CABasicAnimation *)v5 setDuration:v4];
  [(CABasicAnimation *)v5 setFromValue:+[NSNumber numberWithFloat:0.0]];
  [self p_objectForLayer:[self targetLayer] key:@"opacity" floatValue];
  [(CABasicAnimation *)v5 setToValue:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:")];
  [(CABasicAnimation *)v5 setFillMode:kCAFillModeForwards];
  [(CABasicAnimation *)v5 setRemovedOnCompletion:0];
  return v5;
}

- (id)shadowFadeOutAnimation
{
  [(THAnimationController *)self animationDuration];
  double v4 = v3;
  double v5 = v3 * self->_shadowFadeOutDurationScale;
  double v6 = +[CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
  [(CABasicAnimation *)v6 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
  [(CABasicAnimation *)v6 setBeginTime:v4 - v5 + CACurrentMediaTime()];
  [(CABasicAnimation *)v6 setDuration:v5];
  [(CABasicAnimation *)v6 setToValue:+[NSNumber numberWithFloat:0.0]];
  [(CABasicAnimation *)v6 setFillMode:kCAFillModeForwards];
  [(CABasicAnimation *)v6 setRemovedOnCompletion:0];
  return v6;
}

- (id)fadeInOnDelayAnimationToOpacity:(double)a3
{
  [(THAnimationController *)self animationDuration];
  double v6 = v5;
  [(THAnimationController *)self animationDuration];
  double v8 = v7 * 0.899999976;
  double v9 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [(CABasicAnimation *)v9 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
  [(CABasicAnimation *)v9 setBeginTime:v6 + CACurrentMediaTime()];
  [(CABasicAnimation *)v9 setDuration:v8];
  [(CABasicAnimation *)v9 setFromValue:+[NSNumber numberWithFloat:0.0]];
  *(float *)&double v10 = a3;
  [(CABasicAnimation *)v9 setToValue:+[NSNumber numberWithFloat:v10]];
  [(CABasicAnimation *)v9 setFillMode:kCAFillModeForwards];
  [(CABasicAnimation *)v9 setRemovedOnCompletion:0];
  return v9;
}

- (id)sourceShadowFadeOutAnimation
{
  [(THAnimationController *)self animationDuration];
  double v3 = v2 * 0.150000006;
  double v4 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [(CABasicAnimation *)v4 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
  [(CABasicAnimation *)v4 setDuration:v3];
  [(CABasicAnimation *)v4 setToValue:+[NSNumber numberWithFloat:0.0]];
  [(CABasicAnimation *)v4 setFillMode:kCAFillModeForwards];
  [(CABasicAnimation *)v4 setRemovedOnCompletion:0];
  return v4;
}

- (id)shadowTransformAnimation
{
  id v3 = [(THAnimatableSource *)[(THAnimationController *)self source] shadowAnimationLayer];
  if (self->_shadowTransformDurationScale <= 0.0 || v3 == 0) {
    return 0;
  }
  double v5 = v3;
  [(THAnimationController *)self source];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  [(THAnimationController *)self animationDuration];
  double v7 = v6;
  [v5 affineTransform];
  memset(v16, 0, sizeof(v16));
  double v8 = [(THAnimationController *)self source];
  double v9 = [(THAnimationController *)self destination];
  if (v8) {
    [(THAnimatableSource *)v8 shadowAnimationLayerDestinationTransform:v9 uniformTargetScale:self->_uniformTargetScale];
  }
  else {
    memset(v16, 0, 48);
  }
  double v11 = v7 * self->_shadowTransformDurationScale;
  double v10 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  [(CABasicAnimation *)v10 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
  [(CABasicAnimation *)v10 setDuration:v11];
  CGAffineTransform m = v16[1];
  CATransform3DMakeAffineTransform(&v15, &m);
  [(CABasicAnimation *)v10 setFromValue:+[NSValue valueWithCATransform3D:&v15]];
  CGAffineTransform m = v16[0];
  CATransform3DMakeAffineTransform(&v13, &m);
  [(CABasicAnimation *)v10 setToValue:+[NSValue valueWithCATransform3D:&v13]];
  [(CABasicAnimation *)v10 setFillMode:kCAFillModeForwards];
  [(CABasicAnimation *)v10 setRemovedOnCompletion:0];
  return v10;
}

- (void)performAnimation
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnimationController performAnimation]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnimationController.m") lineNumber:1046 description:@"Manipulating UI outside main thread."];
  }
  [(THAnimationController *)self addForegroundFadeAnimation];
  [(THAnimationController *)self addContentAnimation];
  [(THAnimationController *)self addBackgroundFadeOutAnimation];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  mObservers = self->mObservers;
  id v4 = [(NSMutableArray *)mObservers countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(mObservers);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          [(THAnimationController *)self animationDuration];
          [v8 animationController:self updateWhitePointAdaptivtyStyleWithDuration:];
        }
      }
      id v5 = [(NSMutableArray *)mObservers countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (double)p_rotationAngleFromTransform:(CGAffineTransform *)a3
{
  return atan2(a3->c + a3->a * 0.0 + a3->tx - (a3->tx - (a3->c - a3->a * 0.0)), a3->d + a3->b * 0.0 + a3->ty - (a3->ty - (a3->d - a3->b * 0.0)));
}

- (CGRect)p_targetFrame
{
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  [(THAnimationController *)self destination];
  CGFloat v7 = height;
  CGFloat v8 = width;
  CGFloat v9 = y;
  CGFloat v10 = CGRectNull.origin.x;
  if (objc_opt_respondsToSelector())
  {
    [(THAnimatableDestination *)[(THAnimationController *)self destination] ftcTargetFrame];
    CGFloat v10 = v11;
    CGFloat v9 = v12;
    CGFloat v8 = v13;
    CGFloat v7 = v14;
  }
  v32.origin.double x = v10;
  v32.origin.double y = v9;
  v32.size.double width = v8;
  v32.size.double height = v7;
  if (CGRectIsEmpty(v32))
  {
    id v15 = [(THAnimatableDestination *)[(THAnimationController *)self destination] targetLayer];
    if ([(THAnimationController *)self hostLayer])
    {
      if (v15 && [v15 superlayer])
      {
        [(THAnimationController *)self destination];
        if (objc_opt_respondsToSelector())
        {
          [(THAnimatableDestination *)[(THAnimationController *)self destination] targetFrameForSource:[(THAnimationController *)self source]];
          double x = v16;
          double y = v17;
          double width = v18;
          double height = v19;
        }
        v33.origin.double x = x;
        v33.origin.double y = y;
        v33.size.double width = width;
        v33.size.double height = height;
        if (CGRectIsEmpty(v33))
        {
          [v15 frame];
          double x = v20;
          double y = v21;
          double width = v22;
          double height = v23;
        }
        -[CALayer convertRect:fromLayer:](-[THAnimationController hostLayer](self, "hostLayer"), "convertRect:fromLayer:", [v15 superlayer], x, y, width, height);
        CGFloat v10 = v24;
        CGFloat v9 = v25;
        CGFloat v8 = v26;
        CGFloat v7 = v27;
      }
    }
  }
  double v28 = v10;
  double v29 = v9;
  double v30 = v8;
  double v31 = v7;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (id)p_objectForLayer:(id)a3 key:(id)a4
{
  uint64_t v6 = [(THAnimationController *)self layerSaveRestore];

  return [(TSULayerSaveRestore *)v6 objectForLayer:a3 key:a4];
}

- (void)p_saveLayer:(id)a3
{
  if (a3)
  {
    id v4 = [(THAnimationController *)self layerSaveRestore];
    [(TSULayerSaveRestore *)v4 saveLayer:a3];
  }
}

- (void)p_restoreLayer:(id)a3
{
  if (a3)
  {
    id v4 = [(THAnimationController *)self layerSaveRestore];
    [(TSULayerSaveRestore *)v4 restoreLayer:a3];
  }
}

- (double)p_scaleForTargetLayer
{
  double v3 = 1.0;
  if ([(THAnimationController *)self targetLayer]
    && [(THAnimatableDestination *)[(THAnimationController *)self destination] shouldFadeInTargetLayer:[(THAnimationController *)self source]])
  {
    [(-[THAnimationController source](self, "source"), "animationLayer") frame];
    double v5 = v4;
    double v7 = v6;
    [(-[THAnimationController destination](self, "destination")) targetLayer].frame;
    double v9 = v8;
    double v11 = v10;
    [(THAnimationController *)self destination];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [(THAnimatableDestination *)[(THAnimationController *)self destination] shouldAnimateToFit])
    {
      double v12 = THScaleNeededToFitSizeInSize(v5, v7, v9, v11);
    }
    else
    {
      double v12 = THScaleNeededToFillSizeInSize(v5, v7, v9, v11);
    }
    if (v12 <= 0.0) {
      return 1.0;
    }
    else {
      return 1.0 / v12;
    }
  }
  return v3;
}

- (double)p_scaleForAnimationLayer
{
  unsigned int v3 = [(THAnimationController *)self shouldAnimateTargetLayer];
  double result = 1.0;
  if (v3)
  {
    [(-[THAnimationController destination](self, "destination", 1.0), "targetLayer") frame];
    double v6 = v5;
    double v8 = v7;
    [(CALayer *)[(THAnimationController *)self fadeOutAnimationLayer] frame];
    double result = THScaleNeededToFillSizeInSize(v6, v8, v9, v10);
    if (result <= 0.0) {
      return 1.0;
    }
  }
  return result;
}

- (BOOL)p_shouldCrossFade
{
  return [(THAnimationController *)self fadeOutAnimationLayer] != 0;
}

- (THAnimatableSource)source
{
  return self->mSource;
}

- (void)setSource:(id)a3
{
}

- (THAnimatableDestination)destination
{
  return self->mDestination;
}

- (void)setDestination:(id)a3
{
}

- (CALayer)hostLayer
{
  return self->mHostLayer;
}

- (void)setHostLayer:(id)a3
{
}

- (CALayer)foregroundLayer
{
  return self->mForegroundLayer;
}

- (void)setForegroundLayer:(id)a3
{
}

- (CALayer)backgroundLayer
{
  return self->mBackgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
}

- (CALayer)layerToAnimateUnder
{
  return self->_layerToAnimateUnder;
}

- (void)setLayerToAnimateUnder:(id)a3
{
  self->_layerToAnimateUnder = (CALayer *)a3;
}

- (double)shadowFadeOutDurationScale
{
  return self->_shadowFadeOutDurationScale;
}

- (void)setShadowFadeOutDurationScale:(double)a3
{
  self->_shadowFadeOutDurationScale = a3;
}

- (double)shadowTransformDurationScale
{
  return self->_shadowTransformDurationScale;
}

- (void)setShadowTransformDurationScale:(double)a3
{
  self->_shadowTransformDurationScale = a3;
}

- (TSULayerSaveRestore)layerSaveRestore
{
  return self->_layerSaveRestore;
}

- (void)setLayerSaveRestore:(id)a3
{
}

- (CALayer)wrapperLayer
{
  return self->_wrapperLayer;
}

- (void)setWrapperLayer:(id)a3
{
}

- (CALayer)interiorWrapperLayer
{
  return self->_interiorWrapperLayer;
}

- (void)setInteriorWrapperLayer:(id)a3
{
}

- (CGPoint)initialLayerPosition
{
  double x = self->_initialLayerPosition.x;
  double y = self->_initialLayerPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialLayerPosition:(CGPoint)a3
{
  self->_initialLayerPosition = a3;
}

- (CGSize)initialLayerSize
{
  double width = self->_initialLayerSize.width;
  double height = self->_initialLayerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setInitialLayerSize:(CGSize)a3
{
  self->_initialLayerSize = a3;
}

- (double)uniformTargetScale
{
  return self->_uniformTargetScale;
}

- (CALayer)sourceShadowLayer
{
  return self->_sourceShadowLayer;
}

- (void)setSourceShadowLayer:(id)a3
{
}

- (CALayer)sourceReflectionLayer
{
  return self->_sourceReflectionLayer;
}

- (void)setSourceReflectionLayer:(id)a3
{
}

- (CALayer)sourceOverlayLayer
{
  return self->_sourceOverlayLayer;
}

- (void)setSourceOverlayLayer:(id)a3
{
}

- (void)setTargetShadowLayer:(id)a3
{
}

- (void)setTargetReflectionLayer:(id)a3
{
}

- (CGRect)targetFrame
{
  double x = self->_targetFrame.origin.x;
  double y = self->_targetFrame.origin.y;
  double width = self->_targetFrame.size.width;
  double height = self->_targetFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetFrame:(CGRect)a3
{
  self->_targetFrame = a3;
}

- (BOOL)shouldAnimateTargetLayer
{
  return self->_shouldAnimateTargetLayer;
}

- (void)setShouldAnimateTargetLayer:(BOOL)a3
{
  self->_shouldAnimateTargetLayer = a3;
}

- (BOOL)overshoot
{
  return self->_overshoot;
}

- (void)setOvershoot:(BOOL)a3
{
  self->_overshoot = a3;
}

@end