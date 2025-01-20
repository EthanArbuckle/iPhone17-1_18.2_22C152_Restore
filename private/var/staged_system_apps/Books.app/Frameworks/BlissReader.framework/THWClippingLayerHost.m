@interface THWClippingLayerHost
- (BOOL)becomeFirstResponder;
- (BOOL)isInFocusedContainer;
- (BOOL)isViewLoaded;
- (BOOL)resignFirstResponder;
- (CALayer)clippingLayer;
- (CALayer)layer;
- (CGPoint)contentOffset;
- (CGRect)frame;
- (THWClippingLayerHost)init;
- (TSDCanvasLayer)canvasLayer;
- (TSDCanvasSubviewsController)subviewsController;
- (TSDCanvasView)canvasView;
- (TSDInteractiveCanvasController)interactiveCanvasController;
- (UIView)containerView;
- (UIViewController)containerViewController;
- (id)asiOSCVC;
- (id)newAnnotationPopoverController;
- (id)newAudioPlaybackHUDWithFrame:(CGRect)a3 audioRep:(id)a4 delegate:(id)a5;
- (id)newMoviePlaybackHUDWithFrame:(CGRect)a3 playerController:(id)a4 movieRep:(id)a5;
- (id)topLevelReps;
- (id)undoManager;
- (id)viewController;
- (void)beginModalOperationWithLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5;
- (void)dealloc;
- (void)endModalOperation;
- (void)presentError:(id)a3 completionHandler:(id)a4;
- (void)presentErrors:(id)a3 withLocalizedDescription:(id)a4 completionHandler:(id)a5;
- (void)presentMovieCompatibilityAlertForUnplayableMoviePasteboardDrawableProviders:(id)a3 completionHandler:(id)a4;
- (void)presentMovieCompatibilityAlertForUnplayableMovieURLs:(id)a3 completionHandler:(id)a4;
- (void)promptForAnnotationAuthorNameWithCompletionBlock:(id)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setInteractiveCanvasController:(id)a3;
- (void)teardown;
- (void)teardownAndTransferCanvasLayersToHost:(id)a3;
@end

@implementation THWClippingLayerHost

- (THWClippingLayerHost)init
{
  v6.receiver = self;
  v6.super_class = (Class)THWClippingLayerHost;
  v2 = [(THWClippingLayerHost *)&v6 init];
  if (v2)
  {
    v3 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    v2->_layer = v3;
    [(CALayer *)v3 setMasksToBounds:1];
    v4 = (TSDCanvasLayer *)objc_alloc_init((Class)TSDCanvasLayer);
    v2->_canvasLayer = v4;
    [(CALayer *)v2->_layer addSublayer:v4];
    v2->_subviewsController = (TSDCanvasSubviewsController *)[objc_alloc((Class)TSDCanvasSubviewsController) initWithLayerAndSubviewHost:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWClippingLayerHost;
  [(THWClippingLayerHost *)&v3 dealloc];
}

- (void)setInteractiveCanvasController:(id)a3
{
  self->_interactiveCanvasController = (TSDInteractiveCanvasController *)a3;
  v4 = [(THWClippingLayerHost *)self canvasLayer];

  [(TSDCanvasLayer *)v4 setController:a3];
}

- (CGRect)frame
{
  [(CALayer *)self->_layer frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  [(CALayer *)self->_layer bounds];
  TSDRectWithOriginAndSize();
  -[CALayer setBounds:](self->_layer, "setBounds:");
  TSDCenterOfRect();
  layer = self->_layer;

  -[CALayer setPosition:](layer, "setPosition:");
}

- (void)teardownAndTransferCanvasLayersToHost:(id)a3
{
  id v5 = [[self->_canvasLayer sublayers] copy];
  [(TSDCanvasLayer *)self->_canvasLayer setSublayers:0];
  objc_msgSend(objc_msgSend(a3, "canvasLayer"), "setSublayers:", v5);

  [(THWClippingLayerHost *)self teardown];
  [(CALayer *)self->_layer removeFromSuperlayer];

  self->_layer = 0;
}

- (void)presentError:(id)a3 completionHandler:(id)a4
{
  id v4 = +[TSUAssertionHandler currentHandler];
  id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWClippingLayerHost presentError:completionHandler:]");
  objc_super v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWClippingLayerHost.m"];

  [v4 handleFailureInFunction:v5 file:v6 lineNumber:85 description:@"should present error"];
}

- (void)presentErrors:(id)a3 withLocalizedDescription:(id)a4 completionHandler:(id)a5
{
  id v5 = +[TSUAssertionHandler currentHandler];
  objc_super v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWClippingLayerHost presentErrors:withLocalizedDescription:completionHandler:]");
  v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWClippingLayerHost.m"];

  [v5 handleFailureInFunction:v6 file:v7 lineNumber:90 description:@"should present error"];
}

- (void)presentMovieCompatibilityAlertForUnplayableMovieURLs:(id)a3 completionHandler:(id)a4
{
  id v4 = +[TSUAssertionHandler currentHandler];
  id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWClippingLayerHost presentMovieCompatibilityAlertForUnplayableMovieURLs:completionHandler:]");
  objc_super v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWClippingLayerHost.m"];

  [v4 handleFailureInFunction:v5 file:v6 lineNumber:97 description:@"should present error"];
}

- (void)presentMovieCompatibilityAlertForUnplayableMoviePasteboardDrawableProviders:(id)a3 completionHandler:(id)a4
{
  id v4 = +[TSUAssertionHandler currentHandler];
  id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWClippingLayerHost presentMovieCompatibilityAlertForUnplayableMoviePasteboardDrawableProviders:completionHandler:]");
  objc_super v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWClippingLayerHost.m"];

  [v4 handleFailureInFunction:v5 file:v6 lineNumber:102 description:@"should present error"];
}

- (void)beginModalOperationWithLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5
{
  id v5 = +[TSUAssertionHandler currentHandler];
  objc_super v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWClippingLayerHost beginModalOperationWithLocalizedMessage:progress:cancelHandler:]");
  v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWClippingLayerHost.m"];

  [v5 handleFailureInFunction:v6 file:v7 lineNumber:111 description:@"should not be called"];
}

- (void)endModalOperation
{
  id v2 = +[TSUAssertionHandler currentHandler];
  double v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWClippingLayerHost endModalOperation]");
  id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWClippingLayerHost.m"];

  [v2 handleFailureInFunction:v3 file:v4 lineNumber:116 description:@"should not be called"];
}

- (BOOL)isViewLoaded
{
  return 0;
}

- (BOOL)becomeFirstResponder
{
  return 0;
}

- (BOOL)resignFirstResponder
{
  return 0;
}

- (void)teardown
{
  [(CALayer *)self->_layer setDelegate:0];
  [(TSDCanvasLayer *)self->_canvasLayer teardown];
  [(TSDCanvasSubviewsController *)self->_subviewsController teardown];
  if (objc_msgSend(-[TSDCanvasSubviewsController repChildViews](self->_subviewsController, "repChildViews"), "count")) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWClippingLayerHost teardown]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWClippingLayerHost.m") lineNumber:151 description:@"subviews of layerhost %@ not torn down: %@", self, -[TSDCanvasSubviewsController repChildViews](self->_subviewsController, "repChildViews")];
  }
  interactiveCanvasController = self->_interactiveCanvasController;

  [(TSDInteractiveCanvasController *)interactiveCanvasController i_layerHostHasBeenTornDown];
}

- (id)undoManager
{
  return 0;
}

- (BOOL)isInFocusedContainer
{
  return 0;
}

- (TSDCanvasView)canvasView
{
  return 0;
}

- (CALayer)clippingLayer
{
  return self->_layer;
}

- (id)newMoviePlaybackHUDWithFrame:(CGRect)a3 playerController:(id)a4 movieRep:(id)a5
{
  return 0;
}

- (id)newAudioPlaybackHUDWithFrame:(CGRect)a3 audioRep:(id)a4 delegate:(id)a5
{
  return 0;
}

- (id)newAnnotationPopoverController
{
  return 0;
}

- (void)promptForAnnotationAuthorNameWithCompletionBlock:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (id)asiOSCVC
{
  return 0;
}

- (id)viewController
{
  return 0;
}

- (CGPoint)contentOffset
{
  id v2 = [(THWClippingLayerHost *)self clippingLayer];

  [(CALayer *)v2 bounds];
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  [(CALayer *)[(THWClippingLayerHost *)self clippingLayer] bounds];
  TSDRectWithOriginAndSize();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(THWClippingLayerHost *)self clippingLayer];

  -[CALayer setBounds:](v12, "setBounds:", v5, v7, v9, v11);
}

- (UIView)containerView
{
  return 0;
}

- (UIViewController)containerViewController
{
  return 0;
}

- (id)topLevelReps
{
  id v2 = [(TSDInteractiveCanvasController *)[(THWClippingLayerHost *)self interactiveCanvasController] canvas];

  return [v2 topLevelReps];
}

- (TSDCanvasSubviewsController)subviewsController
{
  return self->_subviewsController;
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (CALayer)layer
{
  return self->_layer;
}

- (TSDCanvasLayer)canvasLayer
{
  return self->_canvasLayer;
}

@end