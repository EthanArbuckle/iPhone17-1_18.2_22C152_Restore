@interface THWZoomableCanvasControlRep
- (BOOL)canSelectChildRep:(id)a3;
- (THWZoomableCanvasControlRep)initWithLayout:(id)a3 canvas:(id)a4;
- (THWZoomableCanvasController)zoomableCanvasController;
- (TSDContainerInfo)containerInfo;
- (id)childReps;
- (id)viewControllerForView:(id)a3;
- (void)addAlternateLayersForChildViewsToArray:(id)a3;
- (void)addChildViewsToArray:(id)a3;
- (void)dealloc;
- (void)didAddChildView:(id)a3;
- (void)screenScaleDidChange;
- (void)updateFromLayout;
- (void)willBeRemoved;
- (void)willRemoveChildView:(id)a3;
@end

@implementation THWZoomableCanvasControlRep

- (THWZoomableCanvasControlRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)THWZoomableCanvasControlRep;
  v5 = -[THWZoomableCanvasControlRep initWithLayout:canvas:](&v17, "initWithLayout:canvas:", a3);
  if (v5)
  {
    v6 = -[THWZoomableCanvasController initWithDocumentRoot:]([THWZoomableCanvasController alloc], "initWithDocumentRoot:", [a4 documentRoot]);
    v5->_zoomableCanvasController = v6;
    [v5 layout].frameInRoot;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [v5 canvas].viewScale;
    -[THWZoomableCanvasController createLayerHostIfNeededWithUnscaledFrame:viewScale:](v6, "createLayerHostIfNeededWithUnscaledFrame:viewScale:", v8, v10, v12, v14, v15);
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWZoomableCanvasControlRep;
  [(THWZoomableCanvasControlRep *)&v3 dealloc];
}

- (TSDContainerInfo)containerInfo
{
  return 0;
}

- (id)childReps
{
  return 0;
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (void)updateFromLayout
{
  v13.receiver = self;
  v13.super_class = (Class)THWZoomableCanvasControlRep;
  [(THWZoomableCanvasControlRep *)&v13 updateFromLayout];
  [self layout].frameInRoot;
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  zoomableCanvasController = self->_zoomableCanvasController;
  [self canvas].viewScale;
  -[THWZoomableCanvasController setUnscaledFrame:viewScale:](zoomableCanvasController, "setUnscaledFrame:viewScale:", v4, v6, v8, v10, v12);
}

- (void)addAlternateLayersForChildViewsToArray:(id)a3
{
  double v4 = [(THWClippingLayerHost *)[(THWZoomableCanvasController *)self->_zoomableCanvasController clippingLayerHost] layer];
  if (v4)
  {
    [a3 addObject:v4];
  }
}

- (void)addChildViewsToArray:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWZoomableCanvasControlRep addChildViewsToArray:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWZoomableCanvasControl.m") lineNumber:89 description:@"This operation must only be performed on the main thread."];
  }
  [self layout].frameInRoot
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  zoomableCanvasController = self->_zoomableCanvasController;
  [self interactiveCanvasController].viewScale;
  -[THWZoomableCanvasController createViewIfNeededWithUnscaledFrame:viewScale:](zoomableCanvasController, "createViewIfNeededWithUnscaledFrame:viewScale:", v6, v8, v10, v12, v14);
  double v15 = [(THWZoomableCanvasController *)self->_zoomableCanvasController scrollView];
  if (v15)
  {
    [a3 addObject:v15];
  }
}

- (id)viewControllerForView:(id)a3
{
  if ([(THWZoomableCanvasController *)self->_zoomableCanvasController scrollView] != a3) {
    return 0;
  }
  double v5 = [(THWZoomableCanvasController *)self->_zoomableCanvasController layerHost];

  return [(TSDCanvasLayerHosting *)v5 viewController];
}

- (void)willBeRemoved
{
  v3.receiver = self;
  v3.super_class = (Class)THWZoomableCanvasControlRep;
  [(THWControlRep *)&v3 willBeRemoved];
  [(THWZoomableCanvasController *)self->_zoomableCanvasController teardownController];
  [(THWZoomableCanvasController *)self->_zoomableCanvasController setDelegate:0];
}

- (void)willRemoveChildView:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWZoomableCanvasControlRep willRemoveChildView:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWZoomableCanvasControl.m") lineNumber:127 description:@"This operation must only be performed on the main thread."];
  }
  if (a3)
  {
    zoomableCanvasController = self->_zoomableCanvasController;
    if (zoomableCanvasController)
    {
      if ([(THWZoomableCanvasController *)zoomableCanvasController scrollView] == a3)
      {
        double v6 = self->_zoomableCanvasController;
        [(THWZoomableCanvasController *)v6 teardownView];
      }
    }
  }
}

- (void)didAddChildView:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWZoomableCanvasControlRep didAddChildView:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWZoomableCanvasControl.m") lineNumber:139 description:@"This operation must only be performed on the main thread."];
  }
  if (a3)
  {
    zoomableCanvasController = self->_zoomableCanvasController;
    [(THWZoomableCanvasController *)zoomableCanvasController didAddView];
  }
}

- (void)screenScaleDidChange
{
}

- (THWZoomableCanvasController)zoomableCanvasController
{
  return self->_zoomableCanvasController;
}

@end