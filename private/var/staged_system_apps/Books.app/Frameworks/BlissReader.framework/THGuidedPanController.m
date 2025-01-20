@interface THGuidedPanController
- (BOOL)guidedPanShouldPreserveCompletionAnimationEndLocation;
- (BOOL)isFocusedOnColumn;
- (BOOL)isFocusedOnPage;
- (BOOL)isFocusedOnTarget;
- (CGPoint)consumedMovement;
- (CGPoint)previousMovement;
- (CGPoint)unscaledCenterPoint;
- (CGPoint)unscaledStartPoint;
- (NSArray)currentWells;
- (THGuidedPanController)initWithInteractiveCanvasController:(id)a3;
- (THGuidedPanDelegate)delegate;
- (THGuidedPanTarget)target;
- (THInteractiveCanvasController)interactiveCanvasController;
- (double)pageViewScale;
- (double)viewScaleForUnscaledRect:(CGRect)a3 forPage:(BOOL)a4;
- (id)completionAnimationFromContentLocation:(id)a3 movement:(CGPoint)a4 velocity:(CGPoint)a5;
- (id)contentLocationForMovement:(CGPoint)a3 velocity:(CGPoint)a4 placement:(id *)a5 currentLocation:(id)a6;
- (id)p_completionAnimationUsingWellsForMovement:(CGPoint)a3 velocity:(CGPoint)a4 currentLocation:(id)a5;
- (id)p_contentLocationUsingWellsForMovement:(CGPoint)a3 velocity:(CGPoint)a4 currentLocation:(id)a5;
- (int64_t)relativePageIndexForLayout:(id)a3;
- (void)clearTarget;
- (void)dealloc;
- (void)guidedPanDidEnd;
- (void)guidedPanWillBeginAtPoint:(CGPoint)a3 withCenterPoint:(CGPoint)a4;
- (void)setConsumedMovement:(CGPoint)a3;
- (void)setCurrentWells:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreviousMovement:(CGPoint)a3;
- (void)setTarget:(id)a3;
- (void)setUnscaledCenterPoint:(CGPoint)a3;
- (void)setUnscaledStartPoint:(CGPoint)a3;
@end

@implementation THGuidedPanController

- (THGuidedPanController)initWithInteractiveCanvasController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THGuidedPanController;
  v4 = [(THGuidedPanController *)&v6 init];
  if (v4) {
    v4->_interactiveCanvasController = (THInteractiveCanvasController *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THGuidedPanController;
  [(THGuidedPanController *)&v3 dealloc];
}

- (void)guidedPanWillBeginAtPoint:(CGPoint)a3 withCenterPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  [(THGuidedPanDelegate *)self->_delegate guidedPanWillBegin];
  self->_unscaledStartPoint.CGFloat x = v7;
  self->_unscaledStartPoint.CGFloat y = v6;
  self->_unscaledCenterPoint.CGFloat x = x;
  self->_unscaledCenterPoint.CGFloat y = y;
  CGPoint v9 = CGPointZero;
  self->_consumedMovement = CGPointZero;
  self->_previousMovement = v9;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  [(THGuidedPanTarget *)self->_target guidedPanTargetAddWellsToArray:v10 withController:self];
  v11 = objc_alloc_init(THGuidedPanPageWell);
  [v10 addObject:v11];

  [(THGuidedPanController *)self setCurrentWells:v10];
  delegate = self->_delegate;
  if (delegate)
  {
    [(THGuidedPanDelegate *)delegate guidedPanZoomedOutViewScale];
  }
  else
  {
    target = self->_target;
    if (target)
    {
      [(THGuidedPanTarget *)target guidedPanTargetUnscaledPageRect];
      -[THGuidedPanController viewScaleForUnscaledRect:forPage:](self, "viewScaleForUnscaledRect:forPage:", 1);
    }
    else
    {
      double v13 = 1.0;
    }
  }
  self->_pageViewScale = v13;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  currentWells = self->_currentWells;
  id v16 = [(NSArray *)currentWells countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(currentWells);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) guidedPanWillBeginAtPoint:self controller:v7 v6];
      }
      id v17 = [(NSArray *)currentWells countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v17);
  }
}

- (void)guidedPanDidEnd
{
}

- (id)p_contentLocationUsingWellsForMovement:(CGPoint)a3 velocity:(CGPoint)a4 currentLocation:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  v8 = +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", a5, self->_unscaledCenterPoint.x, self->_unscaledCenterPoint.y, self->_pageViewScale, a4.y);
  interactiveCanvasController = self->_interactiveCanvasController;
  [(THInteractiveCanvasController *)[(THGuidedPanController *)self interactiveCanvasController] centerPlusMovementContentPlacement];
  id v10 = -[THInteractiveCanvasController convertContentLocation:fromPlacement:toPlacement:](interactiveCanvasController, "convertContentLocation:fromPlacement:toPlacement:", v8);
  double v11 = 0.0;
  v12 = +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:");
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  currentWells = self->_currentWells;
  id v14 = [(NSArray *)currentWells countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v38;
    double v17 = 1.0;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(currentWells);
        }
        v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        [v19 weightWithMovement:v10 proposedLocation:self x:x y:y];
        double v21 = v20;
        [v19 smoothWeight];
        if (v22 > 0.0)
        {
          [v19 currentWeight];
          [v19 smoothWeight];
          TSDInterpolateFloats();
          double v21 = v23;
        }
        [v19 setCurrentWeight:v21];
        double v24 = v17 - v11;
        [v19 currentBlendedWeight];
        [v19 setPreviousBlendedWeight:];
        [v19 setCurrentBlendedWeight:(v17 - v11) * v21];
        if ((v17 - v11) * v21 > 0.0)
        {
          id v25 = [v19 contentLocationWithMovement:self x:y];
          if (v25) {
            v26 = v25;
          }
          else {
            v26 = v10;
          }
          [(TSDContentLocation *)v12 unscaledPoint];
          [v26 unscaledPoint];
          TSDInterpolatePoints();
          TSDAddPoints();
          double v28 = v27;
          double v30 = v29;
          [(TSDContentLocation *)v12 viewScale];
          double v32 = v31;
          [v26 viewScale];
          TSDInterpolateFloats();
          double v34 = v32 + v33;
          double v35 = v28;
          double v17 = 1.0;
          v12 = +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", v35, v30, v34);
          double v11 = 1.0 - v24 * (1.0 - v21);
        }
      }
      id v15 = [(NSArray *)currentWells countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v15);
  }
  return v12;
}

- (id)p_completionAnimationUsingWellsForMovement:(CGPoint)a3 velocity:(CGPoint)a4 currentLocation:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  currentWells = self->_currentWells;
  id v12 = [(NSArray *)currentWells countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v12) {
    goto LABEL_11;
  }
  id v13 = v12;
  id v14 = 0;
  unsigned int v15 = 0;
  uint64_t v16 = *(void *)v27;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v27 != v16) {
        objc_enumerationMutation(currentWells);
      }
      uint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      unsigned int v19 = [v18 guidedPanWellRatingWithMovement:self velocity:v9 controller:v8 x:x y:y];
      if (v19 > v15)
      {
        id v14 = v18;
        unsigned int v15 = v19;
      }
    }
    id v13 = [(NSArray *)currentWells countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v13);
  if (v15 <= 1)
  {
LABEL_11:
    double v20 = [(THGuidedPanController *)self target];
LABEL_12:
    id v21 = 0;
    id v22 = 0;
    goto LABEL_13;
  }
  double v20 = [(THGuidedPanController *)self target];
  if (!v14) {
    goto LABEL_12;
  }
  id v22 = [v14 contentAnimationToFocalPointFromLocation:a5 withMovement:self velocity:v9 controller:x y:y];
  id v21 = [v14 guidedPanTargetWithController:self location:a5];
LABEL_13:
  [(THGuidedPanController *)self setTarget:v21];
  if (objc_opt_respondsToSelector())
  {
    [v22 duration];
    double v24 = v23;
  }
  else
  {
    double v24 = 0.2;
  }
  [(THGuidedPanDelegate *)self->_delegate guidedPanWillAnimateFrom:v20 to:[(THGuidedPanController *)self target] duration:v24];
  return v22;
}

- (id)contentLocationForMovement:(CGPoint)a3 velocity:(CGPoint)a4 placement:(id *)a5 currentLocation:(id)a6
{
  self->_previousMovement = a3;
  if (a5) {
    *a5 = kTSDContentPlacementCenter;
  }
  TSDSubtractPoints();
  id v8 = -[THGuidedPanController p_contentLocationUsingWellsForMovement:velocity:currentLocation:](self, "p_contentLocationUsingWellsForMovement:velocity:currentLocation:", a6);
  [(THGuidedPanDelegate *)self->_delegate guidedPanUnscaledPageSize];
  TSDRectWithSize();
  CGFloat x = v36.origin.x;
  CGFloat y = v36.origin.y;
  CGFloat width = v36.size.width;
  CGFloat height = v36.size.height;
  double MidX = CGRectGetMidX(v36);
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v37);
  unsigned int v15 = [(THGuidedPanController *)self interactiveCanvasController];
  [(THInteractiveCanvasController *)[(THGuidedPanController *)self interactiveCanvasController] screenTopContentPlacement];
  double v17 = v16;
  double v19 = v18;
  [v8 viewScale];
  -[THInteractiveCanvasController clampedCenterPointForPoint:withPlacement:viewScale:](v15, "clampedCenterPointForPoint:withPlacement:viewScale:", MidX, MinY, v17, v19, v20);
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  double v21 = CGRectGetMidX(v38);
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v39);
  double v23 = [(THGuidedPanController *)self interactiveCanvasController];
  [(THInteractiveCanvasController *)[(THGuidedPanController *)self interactiveCanvasController] screenBottomContentPlacement];
  double v25 = v24;
  double v27 = v26;
  [v8 viewScale];
  -[THInteractiveCanvasController clampedCenterPointForPoint:withPlacement:viewScale:](v23, "clampedCenterPointForPoint:withPlacement:viewScale:", v21, MaxY, v25, v27, v28);
  [v8 unscaledPoint];
  double v30 = v29;
  [v8 unscaledPoint];
  TSUClamp();
  double v32 = v31;
  [v8 viewScale];

  return +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", v30, v32, v33);
}

- (id)completionAnimationFromContentLocation:(id)a3 movement:(CGPoint)a4 velocity:(CGPoint)a5
{
  TSDSubtractPoints();

  return -[THGuidedPanController p_completionAnimationUsingWellsForMovement:velocity:currentLocation:](self, "p_completionAnimationUsingWellsForMovement:velocity:currentLocation:", a3);
}

- (BOOL)guidedPanShouldPreserveCompletionAnimationEndLocation
{
  return 1;
}

- (BOOL)isFocusedOnColumn
{
  target = self->_target;
  if (target)
  {
    if ([(THGuidedPanTarget *)target guidedPanTargetKind] == 1)
    {
      [(THGuidedPanTarget *)self->_target viewScaleWithController:self];
      double v5 = v4;
      [(THInteractiveCanvasController *)self->_interactiveCanvasController viewScale];
      LOBYTE(target) = vabdd_f64(v6, v5) < 0.00999999978;
    }
    else
    {
      LOBYTE(target) = 0;
    }
  }
  return (char)target;
}

- (BOOL)isFocusedOnPage
{
  target = self->_target;
  if (target)
  {
    if ([(THGuidedPanTarget *)target guidedPanTargetKind])
    {
      LOBYTE(target) = 0;
    }
    else
    {
      [(THGuidedPanTarget *)self->_target viewScaleWithController:self];
      double v5 = v4;
      [(THInteractiveCanvasController *)self->_interactiveCanvasController viewScale];
      LOBYTE(target) = vabdd_f64(v6, v5) < 0.00999999978;
    }
  }
  return (char)target;
}

- (BOOL)isFocusedOnTarget
{
  unsigned int v3 = [(THGuidedPanTarget *)self->_target guidedPanTargetIsTargeted];
  if (v3)
  {
    if ([(THGuidedPanController *)self isFocusedOnColumn])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = [(THGuidedPanController *)self isFocusedOnPage];
    }
  }
  return v3;
}

- (double)viewScaleForUnscaledRect:(CGRect)a3 forPage:(BOOL)a4
{
  if (a4)
  {
    id v4 = [(THInteractiveCanvasController *)self->_interactiveCanvasController layerHost];
    id v5 = [v4 canvasLayer];
    objc_msgSend(objc_msgSend(v4, "clippingLayer"), "bounds");
    [v5 minimumPinchViewScale];
    [v5 maximumPinchViewScale];
    TSUClamp();
  }
  else
  {
    interactiveCanvasController = self->_interactiveCanvasController;
    -[THInteractiveCanvasController viewScaleForZoomToFitRect:outset:fitWidthOnly:](interactiveCanvasController, "viewScaleForZoomToFitRect:outset:fitWidthOnly:", a3.origin.x, a3.origin.y);
  }
  return result;
}

- (int64_t)relativePageIndexForLayout:(id)a3
{
  return (int64_t)[(THGuidedPanDelegate *)self->_delegate guidedPanPageIndexForLayout:a3];
}

- (void)clearTarget
{
}

- (THInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (NSArray)currentWells
{
  return self->_currentWells;
}

- (void)setCurrentWells:(id)a3
{
}

- (THGuidedPanTarget)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (THGuidedPanDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THGuidedPanDelegate *)a3;
}

- (CGPoint)unscaledStartPoint
{
  double x = self->_unscaledStartPoint.x;
  double y = self->_unscaledStartPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setUnscaledStartPoint:(CGPoint)a3
{
  self->_unscaledStartPoint = a3;
}

- (CGPoint)unscaledCenterPoint
{
  double x = self->_unscaledCenterPoint.x;
  double y = self->_unscaledCenterPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setUnscaledCenterPoint:(CGPoint)a3
{
  self->_unscaledCenterPoint = a3;
}

- (double)pageViewScale
{
  return self->_pageViewScale;
}

- (CGPoint)consumedMovement
{
  double x = self->_consumedMovement.x;
  double y = self->_consumedMovement.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setConsumedMovement:(CGPoint)a3
{
  self->_consumedMovement = a3;
}

- (CGPoint)previousMovement
{
  double x = self->_previousMovement.x;
  double y = self->_previousMovement.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousMovement:(CGPoint)a3
{
  self->_previousMovement = a3;
}

@end