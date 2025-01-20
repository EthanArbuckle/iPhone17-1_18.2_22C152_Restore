@interface THRevealTOCPanController
- (BOOL)animatingToTOC;
- (BOOL)guidedPanShouldPreserveCompletionAnimationEndLocation;
- (BOOL)wantsToHandlePanInDirection:(CGPoint)a3;
- (CGPoint)startCenterPoint;
- (THInteractiveCanvasController)icc;
- (THPageLayout)pageLayout;
- (THRevealTOCDelegate)delegate;
- (THRevealTOCPanController)initWithDelegate:(id)a3 interactiveCanvasController:(id)a4;
- (TSDContentLocation)startContentLocation;
- (TSDContentLocation)targetContentLocation;
- (double)p_shrinkAmountForMovement:(CGPoint)a3;
- (id)completionAnimationFromContentLocation:(id)a3 movement:(CGPoint)a4 velocity:(CGPoint)a5;
- (id)contentLocationForMovement:(CGPoint)a3 velocity:(CGPoint)a4 placement:(id *)a5 currentLocation:(id)a6;
- (id)p_contentLocationForMovement:(CGPoint)a3;
- (void)dealloc;
- (void)guidedPanDidEnd;
- (void)guidedPanDidFinishCompletionAnimation;
- (void)guidedPanWillBeginAtPoint:(CGPoint)a3 withCenterPoint:(CGPoint)a4;
- (void)setAnimatingToTOC:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIcc:(id)a3;
- (void)setPageLayout:(id)a3;
- (void)setStartCenterPoint:(CGPoint)a3;
- (void)setStartContentLocation:(id)a3;
- (void)setTargetContentLocation:(id)a3;
@end

@implementation THRevealTOCPanController

- (THRevealTOCPanController)initWithDelegate:(id)a3 interactiveCanvasController:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THRevealTOCPanController;
  result = [(THRevealTOCPanController *)&v7 init];
  if (result)
  {
    result->_delegate = (THRevealTOCDelegate *)a3;
    result->_icc = (THInteractiveCanvasController *)a4;
  }
  return result;
}

- (void)dealloc
{
  if (self->_pageLayout || self->_startContentLocation || self->_targetContentLocation) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THRevealTOCPanController dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THRevealTOCPanController.m") lineNumber:50 description:@"these should have been released when the pan ended"];
  }
  v3.receiver = self;
  v3.super_class = (Class)THRevealTOCPanController;
  [(THRevealTOCPanController *)&v3 dealloc];
}

- (BOOL)wantsToHandlePanInDirection:(CGPoint)a3
{
  double y = a3.y;
  BOOL result = [(THRevealTOCDelegate *)self->_delegate canRevealTOC];
  if (y <= 0.6) {
    return 0;
  }
  return result;
}

- (void)guidedPanWillBeginAtPoint:(CGPoint)a3 withCenterPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(THRevealTOCDelegate *)self->_delegate willRevealTOC];
  double v34 = x;
  double v35 = y;
  pageLayout = (THPageLayout *)objc_msgSend(objc_msgSend(-[THInteractiveCanvasController hitRep:allowsAllReps:](self->_icc, "hitRep:allowsAllReps:", 1, x, y), "layout"), "pageLayout");
  self->_pageLayout = pageLayout;
  if (!pageLayout)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THRevealTOCPanController guidedPanWillBeginAtPoint:withCenterPoint:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THRevealTOCPanController.m") lineNumber:71 description:@"invalid nil value for '%s'", "_pageLayout"];
    pageLayout = self->_pageLayout;
  }
  icc = self->_icc;
  [(THPageLayout *)pageLayout frameInRoot];
  -[THInteractiveCanvasController convertUnscaledToBoundsRect:](icc, "convertUnscaledToBoundsRect:");
  CGFloat v32 = v10;
  CGFloat v33 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(THRevealTOCDelegate *)self->_delegate pageTargetRectForRevealingTOC];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  [(THInteractiveCanvasController *)self->_icc viewScale];
  v36.origin.double x = v16;
  v36.origin.double y = v18;
  v36.size.width = v20;
  v36.size.height = v22;
  CGRectGetWidth(v36);
  v37.origin.double y = v32;
  v37.origin.double x = v33;
  v37.size.width = v12;
  v37.size.height = v14;
  CGRectGetWidth(v37);
  v23 = self->_icc;
  TSDCenterOfRect();
  -[THInteractiveCanvasController contentPlacementForPoint:inView:](v23, "contentPlacementForPoint:inView:", [(THRevealTOCDelegate *)self->_delegate unmovingViewForRevealingTOC], v24, v25);
  double v27 = v26;
  double v29 = v28;
  [(THPageLayout *)self->_pageLayout frameInRoot];
  TSDCenterOfRect();
  v30 = +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:");
  if (self->_targetContentLocation) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:@"-[THRevealTOCPanController guidedPanWillBeginAtPoint:withCenterPoint:]"] file:+[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THRevealTOCPanController.m"] lineNumber:80 description:@"expected nil value for '%s'", "_targetContentLocation"];
  }
  self->_targetContentLocation = (TSDContentLocation *)-[THInteractiveCanvasController convertContentLocation:fromPlacement:toPlacement:](self->_icc, "convertContentLocation:fromPlacement:toPlacement:", v30, v27, v29, kTSDContentPlacementCenter.var0.x, kTSDContentPlacementCenter.var0.y);
  [(THInteractiveCanvasController *)self->_icc viewScale];
  self->_startContentLocation = +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", v34, v35, v31);
}

- (id)p_contentLocationForMovement:(CGPoint)a3
{
  -[THInteractiveCanvasController convertBoundsToUnscaledPoint:](self->_icc, "convertBoundsToUnscaledPoint:", a3.x, a3.y);
  [(TSDContentLocation *)self->_startContentLocation unscaledPoint];
  TSDSubtractPoints();
  double v5 = v4;
  double v7 = v6;
  [(TSDContentLocation *)self->_startContentLocation viewScale];

  return +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", v5, v7, v8);
}

- (double)p_shrinkAmountForMovement:(CGPoint)a3
{
  id v4 = -[THRevealTOCPanController p_contentLocationForMovement:](self, "p_contentLocationForMovement:", a3.x, a3.y);
  [(TSDContentLocation *)self->_startContentLocation unscaledPoint];
  double v6 = v5;
  [(TSDContentLocation *)self->_targetContentLocation unscaledPoint];
  double v8 = v6 - v7;
  if (v6 - v7 <= 0.0) {
    return 0.0;
  }
  [v4 unscaledPoint];
  double v10 = v9;
  [(TSDContentLocation *)self->_startContentLocation unscaledPoint];
  if (v10 >= v11) {
    return 0.0;
  }
  [(TSDContentLocation *)self->_startContentLocation unscaledPoint];
  double v13 = v12;
  [v4 unscaledPoint];
  return fmin((v13 - v14) / v8, 1.0);
}

- (id)contentLocationForMovement:(CGPoint)a3 velocity:(CGPoint)a4 placement:(id *)a5 currentLocation:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  id v10 = -[THRevealTOCPanController p_contentLocationForMovement:](self, "p_contentLocationForMovement:", a5, a6, a3.x, a3.y, a4.x, a4.y);
  -[THRevealTOCPanController p_shrinkAmountForMovement:](self, "p_shrinkAmountForMovement:", x, y);
  double v12 = v11;
  if (v11 != 0.0)
  {
    [(TSDContentLocation *)self->_startContentLocation viewScale];
    [(TSDContentLocation *)self->_targetContentLocation viewScale];
    TSDInterpolateFloats();
    [v10 setViewScale:];
  }
  [(THRevealTOCDelegate *)self->_delegate revealTOCByAmount:v12];
  *a5 = kTSDContentPlacementCenter;
  return v10;
}

- (id)completionAnimationFromContentLocation:(id)a3 movement:(CGPoint)a4 velocity:(CGPoint)a5
{
  double y = a5.y;
  -[THRevealTOCPanController p_shrinkAmountForMovement:](self, "p_shrinkAmountForMovement:", a4.x, a4.y, a5.x);
  if (y <= 100.0 && (y >= -100.0 ? (BOOL v9 = v8 <= 0.300000012) : (BOOL v9 = 1), v9))
  {
    int v11 = 0;
    p_startContentLocation = &self->_startContentLocation;
  }
  else
  {
    p_startContentLocation = &self->_targetContentLocation;
    int v11 = 1;
  }
  double v12 = *p_startContentLocation;
  id v13 = +[TSDContentPathAnimation animation];
  [v13 setDuration:0.25];
  [v13 setContentLocations:[NSArray arrayWithObjects:a3, v12, 0]];
  [v13 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
  delegate = self->_delegate;
  if (v11)
  {
    BOOL v15 = 1;
    [(THRevealTOCDelegate *)delegate revealTOCAnimated:1 duration:0.25];
  }
  else
  {
    [(THRevealTOCDelegate *)delegate unrevealTOCAnimated:1 duration:0.25];
    BOOL v15 = 0;
  }
  self->_animatingToTOC = v15;
  return v13;
}

- (void)guidedPanDidFinishCompletionAnimation
{
  if (self->_animatingToTOC) {
    [(THRevealTOCDelegate *)self->_delegate didRevealTOC];
  }
}

- (BOOL)guidedPanShouldPreserveCompletionAnimationEndLocation
{
  return 0;
}

- (void)guidedPanDidEnd
{
  self->_pageLayout = 0;
  self->_startContentLocation = 0;

  self->_targetContentLocation = 0;
}

- (CGPoint)startCenterPoint
{
  double x = self->_startCenterPoint.x;
  double y = self->_startCenterPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartCenterPoint:(CGPoint)a3
{
  self->_startCenterPoint = a3;
}

- (THRevealTOCDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THRevealTOCDelegate *)a3;
}

- (THInteractiveCanvasController)icc
{
  return self->_icc;
}

- (void)setIcc:(id)a3
{
  self->_icc = (THInteractiveCanvasController *)a3;
}

- (THPageLayout)pageLayout
{
  return self->_pageLayout;
}

- (void)setPageLayout:(id)a3
{
}

- (TSDContentLocation)startContentLocation
{
  return self->_startContentLocation;
}

- (void)setStartContentLocation:(id)a3
{
}

- (TSDContentLocation)targetContentLocation
{
  return self->_targetContentLocation;
}

- (void)setTargetContentLocation:(id)a3
{
}

- (BOOL)animatingToTOC
{
  return self->_animatingToTOC;
}

- (void)setAnimatingToTOC:(BOOL)a3
{
  self->_animatingToTOC = a3;
}

@end