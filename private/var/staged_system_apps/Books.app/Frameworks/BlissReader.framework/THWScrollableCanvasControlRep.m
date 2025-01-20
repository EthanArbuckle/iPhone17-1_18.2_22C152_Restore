@interface THWScrollableCanvasControlRep
- (BOOL)canSelectChildRep:(id)a3;
- (THWScrollableCanvasControlRep)initWithLayout:(id)a3 canvas:(id)a4;
- (THWScrollableCanvasController)scrollableCanvasController;
- (TSDContainerInfo)containerInfo;
- (id)childReps;
- (void)addAlternateLayersForChildViewsToArray:(id)a3;
- (void)addChildViewsToArray:(id)a3;
- (void)canvasDidBeginFreeTransform;
- (void)dealloc;
- (void)didAddChildView:(id)a3;
- (void)screenScaleDidChange;
- (void)updateFromLayout;
- (void)viewScrollingEnded;
- (void)willBeRemoved;
- (void)willRemoveChildView:(id)a3;
@end

@implementation THWScrollableCanvasControlRep

- (THWScrollableCanvasControlRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v23.receiver = self;
  v23.super_class = (Class)THWScrollableCanvasControlRep;
  v6 = -[THWScrollableCanvasControlRep initWithLayout:canvas:](&v23, "initWithLayout:canvas:");
  if (v6)
  {
    v6->_scrollableCanvasController = -[THWScrollableCanvasController initWithDocumentRoot:]([THWScrollableCanvasController alloc], "initWithDocumentRoot:", [a4 documentRoot]);
    id v7 = [(THWScrollableCanvasControlRep *)v6 canvas];
    [a3 frameInRoot];
    [v7 convertUnscaledToBoundsRect:];
    scrollableCanvasController = v6->_scrollableCanvasController;
    [(-[THWScrollableCanvasControlRep canvas](v6, "canvas")) convertUnscaledToBoundsRect:v9, v10, v11, v12];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [v6 canvas].viewScale
    -[THWScrollableCanvasController createLayerHostIfNeededWithFrame:viewScale:](scrollableCanvasController, "createLayerHostIfNeededWithFrame:viewScale:", v14, v16, v18, v20, v21);
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWScrollableCanvasControlRep;
  [(THWScrollableCanvasControlRep *)&v3 dealloc];
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
}

- (void)updateFromLayout
{
  v17.receiver = self;
  v17.super_class = (Class)THWScrollableCanvasControlRep;
  [(THWScrollableCanvasControlRep *)&v17 updateFromLayout];
  [self layout].frameInRoot;
  [self canvas].convertUnscaledToBoundsRect:v3, v4, v5, v6;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  scrollableCanvasController = self->_scrollableCanvasController;
  [self canvas].viewScale;
  -[THWScrollableCanvasController setFrame:scale:](scrollableCanvasController, "setFrame:scale:", v8, v10, v12, v14, v16);
}

- (void)addChildViewsToArray:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWScrollableCanvasControlRep addChildViewsToArray:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWScrollableCanvasControlRep.m"] lineNumber:77 description:@"This operation must only be performed on the main thread."];
  }
  id v5 = [(THWScrollableCanvasControlRep *)self layout];
  id v6 = [(THWScrollableCanvasControlRep *)self canvas];
  [v5 frameInRoot];
  [v6 convertUnscaledToBoundsRect:];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  scrollableCanvasController = self->_scrollableCanvasController;
  [self canvas].viewScale;
  -[THWScrollableCanvasController createViewIfNeededWithFrame:viewScale:](scrollableCanvasController, "createViewIfNeededWithFrame:viewScale:", v8, v10, v12, v14, v16);
  objc_super v17 = [(THWScrollableCanvasController *)self->_scrollableCanvasController mainView];
  if (v17)
  {
    [a3 addObject:v17];
  }
}

- (void)willBeRemoved
{
  v3.receiver = self;
  v3.super_class = (Class)THWScrollableCanvasControlRep;
  [(THWControlRep *)&v3 willBeRemoved];
  +[NSObject cancelPreviousPerformRequestsWithTarget:[(THWScrollableCanvasController *)self->_scrollableCanvasController scrollView] selector:"flashScrollIndicators" object:0];
  [(THWScrollableCanvasController *)self->_scrollableCanvasController teardownController];
  [(THWScrollableCanvasController *)self->_scrollableCanvasController setDelegate:0];
}

- (void)willRemoveChildView:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWScrollableCanvasControlRep willRemoveChildView:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWScrollableCanvasControlRep.m") lineNumber:101 description:@"This operation must only be performed on the main thread."];
  }
  if (a3)
  {
    scrollableCanvasController = self->_scrollableCanvasController;
    if (scrollableCanvasController)
    {
      if ([(THWScrollableCanvasController *)scrollableCanvasController mainView] == a3)
      {
        +[NSObject cancelPreviousPerformRequestsWithTarget:[(THWScrollableCanvasController *)self->_scrollableCanvasController scrollView] selector:"flashScrollIndicators" object:0];
        id v6 = self->_scrollableCanvasController;
        [(THWScrollableCanvasController *)v6 teardownView];
      }
    }
  }
}

- (void)didAddChildView:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWScrollableCanvasControlRep didAddChildView:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWScrollableCanvasControlRep.m") lineNumber:114 description:@"This operation must only be performed on the main thread."];
  }
  if (a3)
  {
    scrollableCanvasController = self->_scrollableCanvasController;
    [(THWScrollableCanvasController *)scrollableCanvasController didAddView];
  }
}

- (void)viewScrollingEnded
{
  if ([(THWScrollableCanvasControlRep *)self isVisibleOnCanvas])
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:[(THWScrollableCanvasController *)self->_scrollableCanvasController scrollView] selector:"flashScrollIndicators" object:0];
    objc_super v3 = [(THWScrollableCanvasController *)self->_scrollableCanvasController scrollView];
    [(TSKScrollView *)v3 performSelector:"flashScrollIndicators" withObject:0 afterDelay:0.2];
  }
}

- (void)screenScaleDidChange
{
}

- (void)canvasDidBeginFreeTransform
{
  v2 = [(THWScrollableCanvasController *)self->_scrollableCanvasController interactiveCanvasController];

  [(THInteractiveCanvasController *)v2 didBeginFreeTransform];
}

- (THWScrollableCanvasController)scrollableCanvasController
{
  return self->_scrollableCanvasController;
}

@end