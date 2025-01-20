@interface THWPagedCanvasControlRep
- (BOOL)canSelectChildRep:(id)a3;
- (THWPagedCanvasControlRep)initWithLayout:(id)a3 canvas:(id)a4;
- (THWPagedCanvasController)pagedCanvasController;
- (TSDContainerInfo)containerInfo;
- (id)childReps;
- (id)viewControllerForView:(id)a3;
- (void)addAlternateLayersForChildViewsToArray:(id)a3;
- (void)addChildViewsToArray:(id)a3;
- (void)dealloc;
- (void)didAddChildView:(id)a3;
- (void)screenScaleDidChange;
- (void)updateFromLayout;
- (void)viewScrollingEnded;
- (void)willBeRemoved;
- (void)willRemoveChildView:(id)a3;
@end

@implementation THWPagedCanvasControlRep

- (THWPagedCanvasControlRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v23.receiver = self;
  v23.super_class = (Class)THWPagedCanvasControlRep;
  v6 = -[THWPagedCanvasControlRep initWithLayout:canvas:](&v23, "initWithLayout:canvas:");
  if (v6)
  {
    v6->_pagedCanvasController = -[THWPagedCanvasController initWithDocumentRoot:]([THWPagedCanvasController alloc], "initWithDocumentRoot:", [a4 documentRoot]);
    id v7 = [(THWPagedCanvasControlRep *)v6 canvas];
    [a3 frameInRoot];
    [v7 convertUnscaledToBoundsRect:];
    pagedCanvasController = v6->_pagedCanvasController;
    [(-[THWPagedCanvasControlRep canvas](v6, "canvas")) convertUnscaledToBoundsRect:v9, v10, v11, v12];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [v6 interactiveCanvasController].viewScale;
    -[THWPagedCanvasController createLayerHostIfNeededWithFrame:viewScale:](pagedCanvasController, "createLayerHostIfNeededWithFrame:viewScale:", v14, v16, v18, v20, v21);
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWPagedCanvasControlRep;
  [(THWPagedCanvasControlRep *)&v3 dealloc];
}

- (void)viewScrollingEnded
{
  id v2 = [(THWPagedCanvasControlRep *)self interactiveCanvasController];

  [v2 invalidateReps];
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

- (void)addAlternateLayersForChildViewsToArray:(id)a3
{
  v4 = [(THWPagedCanvasController *)self->_pagedCanvasController alternateLayerForView];
  if (v4)
  {
    [a3 addObject:v4];
  }
}

- (void)updateFromLayout
{
  v17.receiver = self;
  v17.super_class = (Class)THWPagedCanvasControlRep;
  [(THWPagedCanvasControlRep *)&v17 updateFromLayout];
  [self layout].frameInRoot
  [self canvas].convertUnscaledToBoundsRect:v3, v4, v5, v6;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  pagedCanvasController = self->_pagedCanvasController;
  [self canvas].viewScale
  -[THWPagedCanvasController setFrame:scale:](pagedCanvasController, "setFrame:scale:", v8, v10, v12, v14, v16);
}

- (void)addChildViewsToArray:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPagedCanvasControlRep addChildViewsToArray:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWPagedCanvasControl.m") lineNumber:103 description:@"This operation must only be performed on the main thread."];
  }
  [self layout].frameInRoot
  [self canvas].convertUnscaledToBoundsRect:v5, v6, v7, v8];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  pagedCanvasController = self->_pagedCanvasController;
  [self canvas].viewScale;
  -[THWPagedCanvasController createViewIfNeededWithFrame:viewScale:](pagedCanvasController, "createViewIfNeededWithFrame:viewScale:", v10, v12, v14, v16, v18);
  double v19 = [(THWPagedCanvasController *)self->_pagedCanvasController view];
  if (v19)
  {
    [a3 addObject:v19];
  }
}

- (id)viewControllerForView:(id)a3
{
  if ([(THWPagedCanvasController *)self->_pagedCanvasController view] != a3) {
    return 0;
  }
  id v5 = [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)self->_pagedCanvasController interactiveCanvasController] layerHost];

  return [v5 viewController];
}

- (void)willBeRemoved
{
  v3.receiver = self;
  v3.super_class = (Class)THWPagedCanvasControlRep;
  [(THWControlRep *)&v3 willBeRemoved];
  [(THWPagedCanvasController *)self->_pagedCanvasController teardownController];
  [(THWPagedCanvasController *)self->_pagedCanvasController setDelegate:0];
}

- (void)didAddChildView:(id)a3
{
}

- (void)willRemoveChildView:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPagedCanvasControlRep willRemoveChildView:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWPagedCanvasControl.m") lineNumber:148 description:@"This operation must only be performed on the main thread."];
  }
  if (a3)
  {
    pagedCanvasController = self->_pagedCanvasController;
    if (pagedCanvasController)
    {
      if ([(THWPagedCanvasController *)pagedCanvasController view] == a3)
      {
        double v6 = self->_pagedCanvasController;
        [(THWPagedCanvasController *)v6 teardownView];
      }
    }
  }
}

- (void)screenScaleDidChange
{
}

- (THWPagedCanvasController)pagedCanvasController
{
  return self->_pagedCanvasController;
}

@end