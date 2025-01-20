@interface THPageLayerAndSubviewHost
- (BOOL)visible;
- (CALayer)containerLayer;
- (CALayer)topLevelTilingLayer;
- (CGRect)canvasBoundsFrame;
- (NSString)description;
- (THModelPageInfo)pageInfo;
- (THPageLayerAndSubviewHost)initWithPageInfo:(id)a3 scrimEnabled:(BOOL)a4 delegate:(id)a5;
- (TSDCanvasSubviewsController)subviewsController;
- (TSDRep)rep;
- (UIView)borderView;
- (UIView)containerView;
- (UIView)view;
- (UIViewController)containerViewController;
- (id)p_largeThumbnail;
- (id)topLevelReps;
- (void)dealloc;
- (void)loadPreviewOnQueue:(id)a3;
- (void)p_layoutLayersWithFrame:(CGRect)a3;
- (void)recycle;
- (void)setFrame;
- (void)setHidden:(BOOL)a3;
- (void)setRep:(id)a3;
- (void)setUnscaledFrame:(CGRect)a3 unscaledLayerOffset:(CGPoint)a4 viewScale:(double)a5;
- (void)setVisible:(BOOL)a3;
- (void)teardown;
- (void)unloadPreviewAnimated:(BOOL)a3;
- (void)updateTopLevelLayers;
@end

@implementation THPageLayerAndSubviewHost

- (THPageLayerAndSubviewHost)initWithPageInfo:(id)a3 scrimEnabled:(BOOL)a4 delegate:(id)a5
{
  BOOL v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)THPageLayerAndSubviewHost;
  v8 = [(THPageLayerAndSubviewHost *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (THPageLayerAndSubviewHostDelegate *)a5;
    v8->_pageInfo = (THModelPageInfo *)a3;
    v9->_view = (UIView *)objc_alloc_init(THPageLayerAndSubviewHostView);
    v9->_borderView = (UIView *)objc_alloc_init(THPageLayerAndSubviewNoHitView);
    v9->_containerView = (UIView *)objc_alloc_init(THPageLayerAndSubviewNoHitView);
    [(CALayer *)[(UIView *)v9->_borderView layer] setZPosition:-1.0];
    v9->_pageHostLayer = (TSDTilingHostingLayer *)objc_alloc_init((Class)TSDTilingHostingLayer);
    v9->_pageContainerLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    v10 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    v9->_borderLayer = v10;
    double y = CGPointZero.y;
    -[CALayer setAnchorPoint:](v10, "setAnchorPoint:", CGPointZero.x, y);
    -[CALayer setBorderColor:](v9->_borderLayer, "setBorderColor:", objc_msgSend(objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "colorWithAlphaComponent:", 0.1), "CGColor"));
    [(CALayer *)v9->_borderLayer setBorderWidth:1.0];
    borderLayer = v9->_borderLayer;
    [(CALayer *)[(UIView *)v9->_borderView layer] setSublayers:+[NSArray arrayWithObjects:&borderLayer count:1]];
    [(UIView *)v9->_containerView setClipsToBounds:1];
    [v9->_containerView setBackgroundColor:[TSUColor whiteColor] platformColor]];
    [(CALayer *)[(UIView *)v9->_containerView layer] addSublayer:v9->_pageHostLayer];
    v12 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    v9->_previewLayer = v12;
    -[CALayer setAnchorPoint:](v12, "setAnchorPoint:", CGPointZero.x, y);
    if (v6)
    {
      v13 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
      v9->_scrimLayer = v13;
      -[CALayer setAnchorPoint:](v13, "setAnchorPoint:", CGPointZero.x, y);
      -[CALayer setBackgroundColor:](v9->_scrimLayer, "setBackgroundColor:", objc_msgSend(objc_msgSend(+[TSUColor whiteColor](TSUColor, "whiteColor"), "colorWithAlphaComponent:", 0.15), "CGColor"));
      [(CALayer *)v9->_scrimLayer setHidden:1];
    }
    [(CALayer *)v9->_previewLayer setHidden:1];
    [(UIView *)v9->_view addSubview:v9->_containerView];
    [(CALayer *)[(UIView *)v9->_view layer] addSublayer:v9->_previewLayer];
    if (v9->_scrimLayer) {
      [(CALayer *)[(UIView *)v9->_view layer] addSublayer:v9->_scrimLayer];
    }
    pageContainerLayer = v9->_pageContainerLayer;
    [(TSDTilingHostingLayer *)v9->_pageHostLayer setSublayers:+[NSArray arrayWithObjects:&pageContainerLayer count:1]];
    v9->_subviewsController = (TSDCanvasSubviewsController *)[objc_alloc((Class)TSDCanvasSubviewsController) initWithLayerAndSubviewHost:v9];
    v9->_previewState = 0;
    v9->_visible = 1;
  }
  return v9;
}

- (void)dealloc
{
  [(TSDTilingHostingLayer *)self->_pageHostLayer setController:0];

  if ([(UIView *)self->_view superview]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THPageLayerAndSubviewHost dealloc]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayerAndSubviewHost.m"] lineNumber:193 description:[NSString stringWithFormat:@"expected nil value for '%s'", "_view.superview"];
  }
  [(UIView *)self->_view removeFromSuperview];

  if ([(UIView *)self->_borderView superview]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THPageLayerAndSubviewHost dealloc]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayerAndSubviewHost.m"] lineNumber:196 description:[NSString stringWithFormat:@"expected nil value for '%s'", "_borderView.superview"];
  }
  [(UIView *)self->_borderView removeFromSuperview];

  v3.receiver = self;
  v3.super_class = (Class)THPageLayerAndSubviewHost;
  [(THPageLayerAndSubviewHost *)&v3 dealloc];
}

- (void)teardown
{
  if (self->_rep) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLayerAndSubviewHost teardown]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayerAndSubviewHost.m") lineNumber:212 description:@"expected nil value for '%s'", "_rep"];
  }
  [(THPageLayerAndSubviewHost *)self setRep:0];
  [(TSDCanvasSubviewsController *)self->_subviewsController teardown];
  if ([(UIView *)self->_view superview]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLayerAndSubviewHost teardown]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayerAndSubviewHost.m") lineNumber:215 description:@"expected nil value for '%s'", "_view.superview"];
  }
  [(UIView *)self->_view removeFromSuperview];
  if ([(UIView *)self->_borderView superview]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLayerAndSubviewHost teardown]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayerAndSubviewHost.m") lineNumber:217 description:@"expected nil value for '%s'", "_borderView.superview"];
  }
  borderView = self->_borderView;

  [(UIView *)borderView removeFromSuperview];
}

- (void)setRep:(id)a3
{
  if (self->_rep != a3)
  {
    self->_rep = (TSDRep *)a3;
    -[TSDTilingHostingLayer setController:](self->_pageHostLayer, "setController:", [a3 interactiveCanvasController]);
    [(TSDTilingHostingLayer *)self->_pageHostLayer setDelegate:[(TSDRep *)self->_rep interactiveCanvasController]];
    id v4 = [(TSDRep *)self->_rep interactiveCanvasController];
    pageContainerLayer = self->_pageContainerLayer;
    [(CALayer *)pageContainerLayer setDelegate:v4];
  }
}

- (void)recycle
{
  if (self->_rep) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLayerAndSubviewHost recycle]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayerAndSubviewHost.m") lineNumber:234 description:@"expected nil value for '%s'", "_rep"];
  }
  delegate = self->_delegate;

  [(THPageLayerAndSubviewHostDelegate *)delegate pageLayerAndSubviewHostRecycle:self];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIView *)[(THPageLayerAndSubviewHost *)self view] setHidden:a3];
  v5 = [(THPageLayerAndSubviewHost *)self borderView];

  [(UIView *)v5 setHidden:v3];
}

- (void)p_layoutLayersWithFrame:(CGRect)a3
{
  TSDRectWithSize();
  double x = v10.origin.x;
  double y = v10.origin.y;
  double width = v10.size.width;
  double height = v10.size.height;
  CGRect v11 = CGRectInset(v10, -1.0, -1.0);
  -[CALayer setFrame:](self->_borderLayer, "setFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
  -[CALayer setFrame:](self->_previewLayer, "setFrame:", x, y, width, height);
  scrimLayer = self->_scrimLayer;

  -[CALayer setFrame:](scrimLayer, "setFrame:", x, y, width, height);
}

- (void)setFrame
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLayerAndSubviewHost setFrame]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayerAndSubviewHost.m") lineNumber:254 description:@"This operation must only be performed on the main thread."];
  }
  if (+[NSThread isMainThread])
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    -[UIView setFrame:](self->_view, "setFrame:", self->_canvasBoundsFrame.origin.x, self->_canvasBoundsFrame.origin.y, self->_canvasBoundsFrame.size.width, self->_canvasBoundsFrame.size.height);
    TSDRectWithSize();
    -[UIView setBounds:](self->_view, "setBounds:");
    TSDRectWithSize();
    -[UIView setFrame:](self->_containerView, "setFrame:");
    -[UIView setBounds:](self->_containerView, "setBounds:", self->_canvasBoundsFrame.origin.x, self->_canvasBoundsFrame.origin.y, self->_canvasBoundsFrame.size.width, self->_canvasBoundsFrame.size.height);
    -[UIView setFrame:](self->_borderView, "setFrame:", self->_canvasBoundsFrame.origin.x, self->_canvasBoundsFrame.origin.y, self->_canvasBoundsFrame.size.width, self->_canvasBoundsFrame.size.height);
    -[THPageLayerAndSubviewHost p_layoutLayersWithFrame:](self, "p_layoutLayersWithFrame:", self->_canvasBoundsFrame.origin.x, self->_canvasBoundsFrame.origin.y, self->_canvasBoundsFrame.size.width, self->_canvasBoundsFrame.size.height);
    +[CATransaction commit];
  }
}

- (void)setUnscaledFrame:(CGRect)a3 unscaledLayerOffset:(CGPoint)a4 viewScale:(double)a5
{
  TSDMultiplyRectScalar();
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  if (!CGRectEqualToRect(v16, self->_canvasBoundsFrame))
  {
    self->_canvasBoundsFrame.origin.CGFloat x = x;
    self->_canvasBoundsFrame.origin.CGFloat y = y;
    self->_canvasBoundsFrame.size.CGFloat width = width;
    self->_canvasBoundsFrame.size.CGFloat height = height;
    [(THPageLayerAndSubviewHost *)self setFrame];
  }
  TSDMultiplyPointScalar();
  if (v10 != self->_layerBoundsOffset.x || v11 != self->_layerBoundsOffset.y)
  {
    self->_layerBoundsOffset.CGFloat x = v10;
    self->_layerBoundsOffset.CGFloat y = v11;
    CATransform3DMakeTranslation(&v15, v10, v11, 0.0);
    pageContainerLayer = self->_pageContainerLayer;
    CATransform3D v14 = v15;
    [(CALayer *)pageContainerLayer setSublayerTransform:&v14];
  }
}

- (id)p_largeThumbnail
{
  objc_opt_class();
  [self->_pageInfo context].documentRoot
  BOOL v3 = (void *)TSUDynamicCast();
  id v4 = objc_msgSend(objc_msgSend(v3, "tocModel"), "tiles");
  id v5 = [v3 navigationModel];
  BOOL v6 = [(THModelPageInfo *)self->_pageInfo parent];
  id v7 = [v5 navigationUnitContainingContentNode:v6];
  id v8 = objc_msgSend(objc_msgSend(v5, "navigationUnits"), "indexOfObject:", v7);
  id v9 = [(THModelNode *)v6 absolutePageIndexForRelativePageIndex:[(THModelPageInfo *)self->_pageInfo relativePageIndexInParent] forPresentationType:[(THModelNode *)v6 paginatedPresentationType]];
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v10 = [v7 relativePageIndexForAbsolutePageIndex:v9 forPresentationType:[v6 paginatedPresentationType]];
  if (v10 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v11 = (unint64_t)v10;
  if (v8 >= objc_msgSend(objc_msgSend(v5, "navigationUnits"), "count")) {
    return 0;
  }
  id v12 = [v4 objectAtIndex:v8];
  if (v11 >= (unint64_t)objc_msgSend(objc_msgSend(v12, "largerThumbs"), "count")) {
    return 0;
  }
  id v13 = +[TSDBitmapImageProvider temporaryCGImageForImageData:](TSDBitmapImageProvider, "temporaryCGImageForImageData:", objc_msgSend(objc_msgSend(v12, "largerThumbs"), "objectAtIndex:", v11));

  return +[TSUImage imageWithCGImage:v13];
}

- (void)loadPreviewOnQueue:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLayerAndSubviewHost loadPreviewOnQueue:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayerAndSubviewHost.m") lineNumber:326 description:@"This operation must only be performed on the main thread."];
  }
  int previewState = self->_previewState;
  if (previewState == 3)
  {
    self->_int previewState = 2;
    [(CALayer *)self->_previewLayer removeAllAnimations];
    scrimLayer = self->_scrimLayer;
    [(CALayer *)scrimLayer removeAllAnimations];
  }
  else if (!previewState)
  {
    self->_int previewState = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_16241C;
    block[3] = &unk_456DE0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)a3, block);
  }
}

- (void)unloadPreviewAnimated:(BOOL)a3
{
  unsigned int previewState = self->_previewState;
  if (previewState >= 2)
  {
    if (previewState == 2)
    {
      if (a3)
      {
        self->_unsigned int previewState = 3;
        +[CATransaction begin];
        +[CATransaction setAnimationDuration:0.2];
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = sub_162760;
        v7[3] = &unk_456DE0;
        v7[4] = self;
        +[CATransaction setCompletionBlock:v7];
        id v5 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
        [(CABasicAnimation *)v5 setFromValue:[[(CALayer *)self->_previewLayer presentationLayer] valueForKeyPath:@"opacity"]];
        [(CABasicAnimation *)v5 setToValue:+[NSNumber numberWithFloat:0.0]];
        [(CALayer *)self->_previewLayer addAnimation:v5 forKey:@"opacity"];
        [(CALayer *)self->_previewLayer setOpacity:0.0];
        if (self->_scrimLayer)
        {
          BOOL v6 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
          [(CABasicAnimation *)v6 setFromValue:[[(CALayer *)self->_scrimLayer presentationLayer] valueForKeyPath:@"opacity"]];
          [(CABasicAnimation *)v6 setToValue:+[NSNumber numberWithFloat:0.0]];
          [(CALayer *)self->_scrimLayer addAnimation:v6 forKey:@"opacity"];
          [(CALayer *)self->_scrimLayer setOpacity:0.0];
        }
        +[CATransaction commit];
      }
      else
      {
        +[CATransaction begin];
        self->_unsigned int previewState = 0;
        [(CALayer *)self->_previewLayer setContents:0];
        [(CALayer *)self->_previewLayer setHidden:1];
        [(CALayer *)self->_scrimLayer setHidden:1];
        +[CATransaction commit];
      }
    }
  }
  else
  {
    self->_unsigned int previewState = 0;
  }
}

- (UIViewController)containerViewController
{
  id v2 = [self->_rep.interactiveCanvasController layerHost];

  return (UIViewController *)[v2 viewController];
}

- (id)topLevelReps
{
  id v2 = (void *)TSUProtocolCast();

  return [v2 childReps];
}

- (void)updateTopLevelLayers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [v3 addObject:self->_pageContainerLayer];
  [v3 addObjectsFromArray:[self->_subviewsController updateAlternateLayersForViews]];
  if ((v3 = [self->_pageHostLayer sublayers] & 1) == 0)-[self->_pageHostLayer setSublayers:v3]; {
}
  }

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  pageInfo = self->_pageInfo;
  rep = self->_rep;
  [(UIView *)self->_view frame];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p; pageInfo=%@ rep=%p frame=%@ view=%@>",
           v4,
           self,
           pageInfo,
           rep,
           NSStringFromCGRect(v8),
           self->_view);
}

- (UIView)view
{
  return self->_view;
}

- (UIView)borderView
{
  return self->_borderView;
}

- (CGRect)canvasBoundsFrame
{
  double x = self->_canvasBoundsFrame.origin.x;
  double y = self->_canvasBoundsFrame.origin.y;
  double width = self->_canvasBoundsFrame.size.width;
  double height = self->_canvasBoundsFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (CALayer)containerLayer
{
  return self->_pageContainerLayer;
}

- (TSDCanvasSubviewsController)subviewsController
{
  return self->_subviewsController;
}

- (CALayer)topLevelTilingLayer
{
  return (CALayer *)self->_pageHostLayer;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (THModelPageInfo)pageInfo
{
  return self->_pageInfo;
}

- (TSDRep)rep
{
  return self->_rep;
}

@end