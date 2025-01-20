@interface THWSceneController
- (BOOL)animating;
- (BOOL)disableFrameUpdate;
- (BOOL)hasEmbeddedAnimation;
- (BOOL)hasRendered;
- (BOOL)isLoaded;
- (BOOL)isLoading;
- (BOOL)isPlaying;
- (BOOL)playSceneWhenLoaded;
- (BOOL)shouldFillSize:(CGSize)a3 withinSize:(CGSize)a4;
- (BOOL)shouldStopLoading;
- (BOOL)userInteractionEnabled;
- (BOOL)userInterruptedAnimation;
- (BOOL)yFovFixed;
- (CGRect)sceneFrame;
- (NSDate)sceneWidgetTimeStamp;
- (SCNScene)scene;
- (THPageAffordanceHosting)canvasPageAffordanceHost;
- (THWSCNCameraControlEventHandler)cameraControlEventHandler;
- (THWSceneController)initWithSceneInfo:(id)a3 frame:(CGRect)a4 delegate:(id)a5;
- (THWSceneControllerDelegate)delegate;
- (THWSceneInfo)sceneInfo;
- (THWSceneView)sceneView;
- (UITapGestureRecognizer)singleTapGR;
- (id)p_loadSceneFromURL:(id)a3;
- (id)sceneLayer;
- (void)dealloc;
- (void)didAddSceneView;
- (void)handleSingleTapInSceneView;
- (void)loadScene;
- (void)loadSceneDeferred;
- (void)p_addIdleAnimation;
- (void)p_cleanupFailedLoad;
- (void)p_configureDiagnosticOverlayLayer;
- (void)p_crossfadeLayerOut:(id)a3 fadeLayerIn:(id)a4 completion:(id)a5;
- (void)p_didCreateView;
- (void)p_pauseIdleAnimationForRotation:(BOOL)a3;
- (void)p_setupCameraBehavior;
- (void)p_setupGestureRecognizers;
- (void)p_setupSceneViewWithCancelHandler:(id)a3;
- (void)pauseIdleAnimation;
- (void)pauseIdleAnimationForRotation;
- (void)playIdleAnimation;
- (void)renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5;
- (void)resumeIdleAnimationIfNecessary;
- (void)setAnimating:(BOOL)a3;
- (void)setCameraControlEventHandler:(id)a3;
- (void)setCanvasPageAffordanceHost:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableFrameUpdate:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3 overrideDisabled:(BOOL)a4;
- (void)setHasEmbeddedAnimation:(BOOL)a3;
- (void)setIsLoaded:(BOOL)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setPlaySceneWhenLoaded:(BOOL)a3;
- (void)setScene:(id)a3;
- (void)setSceneFrame:(CGRect)a3;
- (void)setSceneInfo:(id)a3;
- (void)setSceneView:(id)a3;
- (void)setSceneWidgetTimeStamp:(id)a3;
- (void)setShouldStopLoading:(BOOL)a3;
- (void)setSingleTapGR:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setUserInterruptedAnimation:(BOOL)a3;
- (void)setupSceneView;
- (void)stopAnimation;
@end

@implementation THWSceneController

- (THWSceneController)initWithSceneInfo:(id)a3 frame:(CGRect)a4 delegate:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)THWSceneController;
  v11 = [(THWSceneController *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(THWSceneController *)v11 setSceneInfo:a3];
    -[THWSceneController setSceneFrame:](v12, "setSceneFrame:", x, y, width, height);
    [(THWSceneController *)v12 setDelegate:a5];
  }
  return v12;
}

- (void)stopAnimation
{
  [(THWSceneView *)[(THWSceneController *)self sceneView] removeCameraAnimation];
  v3 = [(THWSceneController *)self sceneView];

  [(THWSceneView *)v3 stop:self];
}

- (void)dealloc
{
  [(THWSceneView *)self->_sceneView setDelegate:0];
  [(THWSceneController *)self setSceneInfo:0];
  [(THWSceneController *)self setSceneView:0];

  self->_cameraControlEventHandler = 0;
  [(THWSceneController *)self setScene:0];
  [(THWSceneController *)self setSceneWidgetTimeStamp:0];
  [(THWSceneController *)self setSingleTapGR:0];
  v3.receiver = self;
  v3.super_class = (Class)THWSceneController;
  [(THWSceneController *)&v3 dealloc];
}

- (id)sceneLayer
{
  if (![(THWSceneController *)self isLoaded]) {
    return 0;
  }
  objc_super v3 = [(THWSceneController *)self sceneView];

  return [(THWSceneView *)v3 layer];
}

- (void)p_configureDiagnosticOverlayLayer
{
  objc_super v3 = +[NSUserDefaults standardUserDefaults];
  BOOL v4 = [(NSUserDefaults *)v3 BOOLForKey:kTHSceneWidgetFPSOverlayKey[0]];
  v5 = [(THWSceneController *)self sceneView];

  [(THWSceneView *)v5 setShowsStatistics:v4];
}

- (void)p_addIdleAnimation
{
  unsigned int v3 = [(THWSceneInfo *)[(THWSceneController *)self sceneInfo] idleAnimationBehavior];
  if (v3)
  {
    if (v3 == 1)
    {
      BOOL v4 = [(THWSceneController *)self sceneView];
      [(THWSceneView *)v4 rotateCameraContinuouslyWithEaseIn];
    }
    else
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController p_addIdleAnimation]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m") lineNumber:250 description:@"Unrecognized idle animation behavior: %d" -[THWSceneInfo idleAnimationBehavior](-[THWSceneController sceneInfo](self, "sceneInfo"), "idleAnimationBehavior")];
    }
  }
}

- (BOOL)yFovFixed
{
  if (![(THWSceneController *)self sceneView]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController yFovFixed]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m") lineNumber:262 description:@"invalid nil value for '%s'", "self.sceneView"];
  }
  objc_msgSend(objc_msgSend(-[THWSceneView pointOfView](-[THWSceneController sceneView](self, "sceneView"), "pointOfView"), "camera"), "yFov");
  return v3 != 0.0;
}

- (BOOL)shouldFillSize:(CGSize)a3 withinSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.height;
  double v7 = a3.width;
  if (![(THWSceneController *)self sceneView]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWSceneController shouldFillSize:withinSize:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"] lineNumber:280 description:[NSString stringWithFormat:@"invalid nil value for '%s'", "self.sceneView"];
  }
  objc_msgSend(objc_msgSend(-[THWSceneView pointOfView](-[THWSceneController sceneView](self, "sceneView"), "pointOfView"), "camera"), "yFov");
  BOOL result = v9 != 0.0;
  if (v7 / v6 < width / height) {
    return v9 == 0.0;
  }
  return result;
}

- (void)p_pauseIdleAnimationForRotation:(BOOL)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController p_pauseIdleAnimationForRotation:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m") lineNumber:314 description:@"Manipulating UI outside main thread."];
  }
  if ([(THWSceneView *)[(THWSceneController *)self sceneView] scene])
  {
    [(THWSceneView *)[(THWSceneController *)self sceneView] removeCameraAnimation];
    [(THWSceneView *)[(THWSceneController *)self sceneView] pause:self];
    if (!a3) {
      [(THWSceneController *)self setUserInterruptedAnimation:1];
    }
  }
  else
  {
    [(THWSceneController *)self setPlaySceneWhenLoaded:0];
  }

  [(THWSceneController *)self setIsPlaying:0];
}

- (void)pauseIdleAnimation
{
}

- (void)pauseIdleAnimationForRotation
{
}

- (void)playIdleAnimation
{
  if (![(THWSceneController *)self isPlaying]
    && [(THWSceneView *)[(THWSceneController *)self sceneView] scene]
    && [(THWSceneControllerDelegate *)[(THWSceneController *)self delegate] sceneControllerShouldAllowIdleAnimation:self])
  {
    [(THWSceneController *)self setIsPlaying:1];
    if ([(THWSceneController *)self hasEmbeddedAnimation])
    {
      double v3 = [(THWSceneController *)self sceneView];
      -[THWSceneView play:](v3, "play:");
    }
    else
    {
      [(THWSceneController *)self p_addIdleAnimation];
    }
  }
}

- (void)resumeIdleAnimationIfNecessary
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController resumeIdleAnimationIfNecessary]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m") lineNumber:366 description:@"Manipulating UI outside main thread."];
  }
  if ([(THWSceneController *)self isLoaded]
    && [(THWSceneView *)[(THWSceneController *)self sceneView] scene])
  {
    if (![(THWSceneController *)self userInterruptedAnimation])
    {
      [(THWSceneController *)self playIdleAnimation];
    }
  }
  else
  {
    [(THWSceneController *)self setPlaySceneWhenLoaded:1];
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(THWSceneController *)self sceneView];

  [(THWSceneView *)v4 setUserInteractionEnabled:v3];
}

- (BOOL)userInteractionEnabled
{
  v2 = [(THWSceneController *)self sceneView];

  return [(THWSceneView *)v2 isUserInteractionEnabled];
}

- (void)p_setupSceneViewWithCancelHandler:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController p_setupSceneViewWithCancelHandler:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m") lineNumber:409 description:@"Manipulating UI outside main thread."];
  }
  [(THWSceneController *)self setPlaySceneWhenLoaded:0];
  [(THWSceneController *)self setUserInterruptedAnimation:0];
  v5 = [THWSceneView alloc];
  [(THWSceneController *)self sceneFrame];
  v8 = -[THWSceneView initWithFrame:options:](v5, "initWithFrame:options:", 0);
  [v8 setBackgroundColor:[-[THWSceneControllerDelegate backgroundColorForSceneController:](-[THWSceneController delegate](self, "delegate"), "backgroundColorForSceneController:", self) platformColor]];
  [(THWSceneControllerDelegate *)[(THWSceneController *)self delegate] screenScaleForSceneController:self];
  [v8 layer].contentsScale = v6;
  [v8 layer].opacity = 0.0;
  [(THWSceneController *)self setSceneView:v8];
  double v7 = [(THWSceneController *)self scene];
  [(THWSceneView *)[(THWSceneController *)self sceneView] setDelegate:self];
  if (v7)
  {
    [(THWSceneView *)v8 scnWarmUpScene:v7 abortHandler:a3];
    +[SCNTransaction begin];
    [(THWSceneView *)v8 setScene:v7];
    +[SCNTransaction commit];
  }
  [(THWSceneController *)self setScene:0];
}

- (void)setupSceneView
{
  if (!self->_sceneView)
  {
    if (self->_scene)
    {
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472;
      v3[2] = sub_1BB074;
      v3[3] = &unk_45A908;
      v3[4] = self;
      [(THWSceneController *)self p_setupSceneViewWithCancelHandler:v3];
      [(THWSceneController *)self p_didCreateView];
    }
  }
}

- (void)p_crossfadeLayerOut:(id)a3 fadeLayerIn:(id)a4 completion:(id)a5
{
  if (!a3)
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWSceneController p_crossfadeLayerOut:fadeLayerIn:completion:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"] lineNumber:471 description:[NSString stringWithFormat:@"invalid nil value for '%s'", "fadeOutLayer"]];
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController p_crossfadeLayerOut:fadeLayerIn:completion:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m") lineNumber:472 description:@"invalid nil value for '%s'", "fadeInLayer"];
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  +[CATransaction begin];
  +[CATransaction setAnimationDuration:0.15];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1BB2CC;
  v12[3] = &unk_457868;
  v12[4] = a5;
  +[CATransaction setCompletionBlock:v12];
  v8 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  LODWORD(v9) = 1.0;
  [(CABasicAnimation *)v8 setToValue:+[NSNumber numberWithFloat:v9]];
  [(CABasicAnimation *)v8 setRemovedOnCompletion:0];
  [(CABasicAnimation *)v8 setFillMode:kCAFillModeForwards];
  [a4 addAnimation:v8 forKey:@"opacity"];
  v10 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  LODWORD(v11) = 0.5;
  [(CABasicAnimation *)v10 setToValue:+[NSNumber numberWithFloat:v11]];
  [(CABasicAnimation *)v10 setRemovedOnCompletion:0];
  [(CABasicAnimation *)v10 setFillMode:kCAFillModeForwards];
  [a3 addAnimation:v10 forKey:@"opacity"];
  +[CATransaction commit];
}

- (void)didAddSceneView
{
  id v3 = [(THWSceneControllerDelegate *)[(THWSceneController *)self delegate] placeholderLayerForSceneController:self];
  v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  double v7 = sub_1BB3D0;
  v8 = &unk_456E38;
  id v9 = v3;
  v10 = self;
  if (-[THWSceneControllerDelegate sceneControllerShouldAllowCrossfade:](-[THWSceneController delegate](self, "delegate"), "sceneControllerShouldAllowCrossfade:", self)&& v3&& (objc_msgSend(v3, "isHidden", v5, v6) & 1) == 0&& (objc_msgSend(v3, "opacity"), v4 > 0.0))
  {
    [(THWSceneController *)self p_crossfadeLayerOut:v3 fadeLayerIn:[(THWSceneView *)[(THWSceneController *)self sceneView] layer] completion:&v5];
  }
  else
  {
    v7((uint64_t)&v5);
  }
}

- (void)setFrame:(CGRect)a3
{
}

- (void)setFrame:(CGRect)a3 overrideDisabled:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4 || !self->_disableFrameUpdate)
  {
    [(THWSceneController *)self sceneFrame];
    v22.origin.double x = v9;
    v22.origin.double y = v10;
    v22.size.double width = v11;
    v22.size.double height = v12;
    v21.origin.double x = x;
    v21.origin.double y = y;
    v21.size.double width = width;
    v21.size.double height = height;
    if (!CGRectEqualToRect(v21, v22))
    {
      -[THWSceneController setSceneFrame:](self, "setSceneFrame:", x, y, width, height);
      v13 = [(THWSceneController *)self sceneView];
      if (v13)
      {
        objc_super v14 = v13;
        [(THWSceneView *)v13 frame];
        unsigned int v17 = -[THWSceneController shouldFillSize:withinSize:](self, "shouldFillSize:withinSize:", v15, v16, width, height);
        v18 = &kCAGravityResizeAspectFill;
        if (!v17) {
          v18 = &kCAGravityResizeAspect;
        }
        [v14 layer].contentsGravity = *v18;
        -[THWSceneView setFrame:](v14, "setFrame:", x, y, width, height);
        v19 = [(THWSceneController *)self sceneView];
        [(THWSceneView *)v19 setNeedsDisplay];
      }
    }
  }
}

- (void)loadSceneDeferred
{
  if ([(THWSceneController *)self isLoaded])
  {
    if (![(THWSceneController *)self isLoaded])
    {
      id v3 = +[TSUAssertionHandler currentHandler];
      float v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController loadSceneDeferred]");
      v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"];
      [v3 handleFailureInFunction:v4 file:v5 lineNumber:602 description:@"should already be loaded if background loading isn't supported"];
    }
  }
  else
  {
    if ([(THWSceneController *)self isLoading]) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController loadSceneDeferred]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m") lineNumber:572 description:@"already loading widget"];
    }
    [(THWSceneController *)self setIsLoading:1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1BB718;
    v6[3] = &unk_456E38;
    v6[4] = [[-[THWSceneController delegate](self, "delegate") documentRootForSceneController:self] accessController];
    v6[5] = self;
    [+[TSKLowPriorityThreadDispatcher sharedLowPriorityDispatcher](TSKLowPriorityThreadDispatcher, "sharedLowPriorityDispatcher") dispatch:v6];
  }
}

- (void)loadScene
{
  if ([(THWSceneController *)self isLoaded])
  {
    if (![(THWSceneController *)self isLoaded])
    {
      id v5 = +[TSUAssertionHandler currentHandler];
      uint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController loadScene]");
      double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"];
      [v5 handleFailureInFunction:v6 file:v7 lineNumber:628 description:@"should already be loaded if background loading isn't supported"];
    }
  }
  else
  {
    if ([(THWSceneController *)self isLoading]) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWSceneController loadScene]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"] lineNumber:610 description:@"already loading widget"];
    }
    [(THWSceneController *)self setIsLoading:1];
    id v3 = [(THWSceneController *)self sceneInfo];
    if (v3) {
      id v4 = [(THWSceneController *)self p_loadSceneFromURL:[(THWSceneInfo *)v3 sourceURL]];
    }
    else {
      id v4 = 0;
    }
    [(THWSceneController *)self setIsLoading:0];
    [(THWSceneController *)self setIsLoaded:1];
    [(THWSceneController *)self setScene:v4];
    v8 = [(THWSceneController *)self delegate];
    [(THWSceneControllerDelegate *)v8 sceneDidLoadForSceneController:self];
  }
}

- (id)p_loadSceneFromURL:(id)a3
{
  if (a3 && ([a3 isFileURL] & 1) != 0)
  {
    unsigned int v17 = self;
    if (!-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", [a3 path])){
[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController p_loadSceneFromURL:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m") lineNumber:639 description:@"Could not find file: %@", a3];
}
    id v5 = +[NSNumber numberWithBool:1];
    }
    uint64_t v6 = SCNSceneSourceSkipConsistencyCheckKey;
    double v7 = +[NSNumber numberWithBool:1];
    v8 = +[NSNumber numberWithBool:1];
    uint64_t v9 = SCNSceneSourceCreateCameraIfAbsentKey;
    CGFloat v10 = +[NSNumber numberWithBool:1];
    uint64_t v11 = SCNSceneSourceCreateLightIfAbsentKey;
    CGFloat v12 = +[NSNumber numberWithBool:1];
    v13 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, v6, v7, SCNSceneSourceCreateNormalsIfAbsentKey, v8, v9, v10, v11, v12, SCNSceneSourceAdjustInvalidCameraClippingPlanesKey, 0);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3052000000;
    v20[3] = sub_1BBD5C;
    v20[4] = sub_1BBD6C;
    v20[5] = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    id v14 = [objc_alloc((Class)SCNSceneSource) initWithURL:a3 options:v13];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1BBD78;
    v18[3] = &unk_45A930;
    v18[5] = v19;
    v18[6] = v20;
    v18[4] = v17;
    id v15 = [v14 sceneWithOptions:v13 statusHandler:v18];
    -[THWSceneController setHasEmbeddedAnimation:](v17, "setHasEmbeddedAnimation:", objc_msgSend(objc_msgSend(v14, "IDsOfEntriesWithClass:", objc_opt_class()), "count") != 0);
    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v20, 8);
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController p_loadSceneFromURL:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m") lineNumber:636 description:@"Expected sourceURL to be a local file-based URL"];
    return 0;
  }
  return v15;
}

- (void)p_cleanupFailedLoad
{
  id v3 = [(THWSceneController *)self sceneView];

  [(THWSceneView *)v3 stop:self];
}

- (void)p_setupCameraBehavior
{
  [(THWSceneController *)self setCameraControlEventHandler:[[THWSCNCameraControlEventHandler alloc] initWithSceneController:self]];
  [(THWSceneView *)[(THWSceneController *)self sceneView] setEventHandler:[(THWSceneController *)self cameraControlEventHandler]];
  unsigned int v3 = [(THWSceneInfo *)[(THWSceneController *)self sceneInfo] rotationConstraints];
  if (v3)
  {
    if (v3 == 2)
    {
      [(THWSceneView *)[(THWSceneController *)self sceneView] eventHandler];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(THWSceneView *)[(THWSceneController *)self sceneView] setEventHandlerStickyAxis:2];
      }
    }
    else if (v3 == 1)
    {
      [(THWSceneView *)[(THWSceneController *)self sceneView] eventHandler];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(-[THWSceneController sceneView](self, "sceneView")) eventHandler].setGimbalLockMode:1;
      }
    }
    else
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController p_setupCameraBehavior]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m") lineNumber:706 description:@"Unrecognized rotation constraint: %d" -[THWSceneInfo rotationConstraints](-[THWSceneController sceneInfo](self, "sceneInfo"), "rotationConstraints")];
    }
  }
  [(THWSceneView *)[(THWSceneController *)self sceneView] eventHandler];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(THWSceneView *)[(THWSceneController *)self sceneView] eventHandler];
    [v4 setEnableInertia:1];
    double v5 = *(double *)&THWSceneInertialDampingNormal;
    [v4 setFriction:v5];
  }
}

- (void)handleSingleTapInSceneView
{
  unsigned int v3 = [(THWSceneController *)self delegate];

  [(THWSceneControllerDelegate *)v3 handleSingleTapInSceneForSceneController:self];
}

- (void)p_setupGestureRecognizers
{
  -[THWSceneController setSingleTapGR:](self, "setSingleTapGR:", [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleSingleTapInSceneView"]);
  [(THWSceneView *)[(THWSceneController *)self sceneView] addGestureRecognizer:[(THWSceneController *)self singleTapGR]];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v11 = self;
  id v3 = [[-[THWSceneController sceneView](self, "sceneView") eventHandler] gestureRecognizers];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 setEnabled:0];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 setEnabled:0];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          uint64_t v9 = (void *)TSUDynamicCast();
          if ([v9 minimumNumberOfTouches] == (char *)&dword_0 + 1
            && (unint64_t)[v9 maximumNumberOfTouches] >= 2)
          {
            [v9 setMaximumNumberOfTouches:1];
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          CGFloat v10 = (void *)TSUDynamicCast();
          if ([v10 numberOfTapsRequired] == (char *)&dword_0 + 2) {
            [(UITapGestureRecognizer *)[(THWSceneController *)v11 singleTapGR] requireGestureRecognizerToFail:v10];
          }
        }
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)p_didCreateView
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController p_didCreateView]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m") lineNumber:758 description:@"Manipulating UI outside main thread."];
  }
  if ([(THWSceneView *)[(THWSceneController *)self sceneView] scene])
  {
    [(THWSceneController *)self p_setupCameraBehavior];
    if ([(THWSceneController *)self playSceneWhenLoaded])
    {
      [(THWSceneController *)self setPlaySceneWhenLoaded:0];
      [(THWSceneController *)self resumeIdleAnimationIfNecessary];
    }
    [(THWSceneController *)self p_configureDiagnosticOverlayLayer];
  }
  else
  {
    [(THWSceneController *)self p_cleanupFailedLoad];
  }
}

- (void)renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5
{
  self->_hasRendered = 1;
}

- (THWSceneControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWSceneControllerDelegate *)a3;
}

- (THPageAffordanceHosting)canvasPageAffordanceHost
{
  return self->_canvasPageAffordanceHost;
}

- (void)setCanvasPageAffordanceHost:(id)a3
{
  self->_canvasPageAffordanceHost = (THPageAffordanceHosting *)a3;
}

- (BOOL)disableFrameUpdate
{
  return self->_disableFrameUpdate;
}

- (void)setDisableFrameUpdate:(BOOL)a3
{
  self->_disableFrameUpdate = a3;
}

- (BOOL)hasRendered
{
  return self->_hasRendered;
}

- (THWSceneView)sceneView
{
  return self->_sceneView;
}

- (void)setSceneView:(id)a3
{
}

- (THWSceneInfo)sceneInfo
{
  return self->_sceneInfo;
}

- (void)setSceneInfo:(id)a3
{
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (void)setIsPlaying:(BOOL)a3
{
  self->_isPlaying = a3;
}

- (UITapGestureRecognizer)singleTapGR
{
  return self->_singleTapGR;
}

- (void)setSingleTapGR:(id)a3
{
}

- (BOOL)playSceneWhenLoaded
{
  return self->_playSceneWhenLoaded;
}

- (void)setPlaySceneWhenLoaded:(BOOL)a3
{
  self->_playSceneWhenLoaded = a3;
}

- (BOOL)userInterruptedAnimation
{
  return self->_userInterruptedAnimation;
}

- (void)setUserInterruptedAnimation:(BOOL)a3
{
  self->_userInterruptedAnimation = a3;
}

- (BOOL)hasEmbeddedAnimation
{
  return self->_hasEmbeddedAnimation;
}

- (void)setHasEmbeddedAnimation:(BOOL)a3
{
  self->_hasEmbeddedAnimation = a3;
}

- (BOOL)shouldStopLoading
{
  return self->_shouldStopLoading;
}

- (void)setShouldStopLoading:(BOOL)a3
{
  self->_shouldStopLoading = a3;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void)setIsLoaded:(BOOL)a3
{
  self->_isLoaded = a3;
}

- (SCNScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (CGRect)sceneFrame
{
  double x = self->_sceneFrame.origin.x;
  double y = self->_sceneFrame.origin.y;
  double width = self->_sceneFrame.size.width;
  double height = self->_sceneFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSceneFrame:(CGRect)a3
{
  self->_sceneFrame = a3;
}

- (NSDate)sceneWidgetTimeStamp
{
  return self->_sceneWidgetTimeStamp;
}

- (void)setSceneWidgetTimeStamp:(id)a3
{
}

- (THWSCNCameraControlEventHandler)cameraControlEventHandler
{
  return self->_cameraControlEventHandler;
}

- (void)setCameraControlEventHandler:(id)a3
{
}

@end