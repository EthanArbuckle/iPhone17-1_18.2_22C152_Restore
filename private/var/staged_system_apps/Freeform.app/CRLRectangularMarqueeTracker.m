@interface CRLRectangularMarqueeTracker
- (BOOL)disallowAllActionsWhileTracking;
- (BOOL)operationShouldBeDynamic;
- (BOOL)p_shouldUpdateMarqueeFrameForDragDistance:(double)a3;
- (BOOL)shouldCenterResizeMarqueeRect;
- (BOOL)shouldInvertOriginalSelection;
- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3;
- (BOOL)shouldSuppressAnimationWhenMarqueeBegins;
- (BOOL)shouldSuppressContextMenu;
- (BOOL)shouldSuppressRestoringOriginalSelectionIfNothingSelected;
- (BOOL)supportsAlignmentGuides;
- (CGPoint)currentUnscaledDragPoint;
- (CGPoint)startingUnscaledPoint;
- (CGRect)p_currentUnscaledMarqueeRect;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (CRLRectangularMarqueeTracker)initWithInteractiveCanvasController:(id)a3;
- (NSArray)decoratorOverlayRenderables;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)beginMarquee;
- (void)changeDynamicLayoutsForReps:(id)a3;
- (void)commitChangesForReps:(id)a3;
- (void)p_beginMarquee;
- (void)p_beginMarqueePressAnimation;
- (void)p_refreshRectsForReps;
- (void)p_setPendingSelection;
- (void)p_stopMarqueePressAnimation;
- (void)p_updateMarquee;
- (void)setCurrentUnscaledDragPoint:(CGPoint)a3;
- (void)setInteractiveCanvasController:(id)a3;
- (void)setShouldCenterResizeMarqueeRect:(BOOL)a3;
- (void)setShouldInvertOriginalSelection:(BOOL)a3;
- (void)setShouldSuppressAnimationWhenMarqueeBegins:(BOOL)a3;
- (void)setShouldSuppressContextMenu:(BOOL)a3;
- (void)setShouldSuppressRestoringOriginalSelectionIfNothingSelected:(BOOL)a3;
- (void)setStartingUnscaledPoint:(CGPoint)a3;
@end

@implementation CRLRectangularMarqueeTracker

- (CRLRectangularMarqueeTracker)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CRLRectangularMarqueeTracker;
  v5 = [(CRLRectangularMarqueeTracker *)&v19 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
    v7 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
    scaledRectsForReps = v6->_scaledRectsForReps;
    v6->_scaledRectsForReps = v7;

    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pendingSelection = v6->_pendingSelection;
    v6->_pendingSelection = v9;

    CGSize size = CGRectNull.size;
    v6->_selectionRectScaled.origin = CGRectNull.origin;
    v6->_selectionRectScaled.CGSize size = size;
    uint64_t v12 = +[CRLCanvasShapeRenderable renderable];
    selectionOverlay = v6->_selectionOverlay;
    v6->_selectionOverlay = (CRLCanvasRenderable *)v12;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_interactiveCanvasController);
    [(CRLCanvasRenderable *)v6->_selectionOverlay setDelegate:WeakRetained];

    v15 = +[CRLColor colorWithRed:0.17 green:0.44 blue:1.0 alpha:1.0];
    v16 = +[CRLColor colorWithRed:0.12 green:0.31 blue:0.7 alpha:0.2];
    -[CRLCanvasRenderable setBorderColor:](v6->_selectionOverlay, "setBorderColor:", [v15 CGColor]);
    [(CRLCanvasRenderable *)v6->_selectionOverlay setBorderWidth:1.0];
    -[CRLCanvasRenderable setBackgroundColor:](v6->_selectionOverlay, "setBackgroundColor:", [v16 CGColor]);
    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v6 selector:"p_refreshRectsForReps" name:@"CRLCanvasUpdateScrollNotification" object:v4];
  }
  return v6;
}

- (void)setCurrentUnscaledDragPoint:(CGPoint)a3
{
  self->_currentUnscaledDragPoint = a3;
  self->_wasCurrentUnscaledDragPointSetExternally = 1;
}

- (CGRect)p_currentUnscaledMarqueeRect
{
  if (self->_startedSelection)
  {
    double x = sub_100064044(self->_startingUnscaledPoint.x, self->_startingUnscaledPoint.y, self->_currentUnscaledDragPoint.x);
  }
  else
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)beginMarquee
{
  if (!self->_startedSelection)
  {
    self->_startedSelection = 1;
    [(CRLRectangularMarqueeTracker *)self p_beginMarquee];
  }
}

- (void)changeDynamicLayoutsForReps:(id)a3
{
  id v4 = a3;
  if (self->_startedSelection)
  {
    if (!self->_wasCurrentUnscaledDragPointSetExternally) {
      goto LABEL_6;
    }
    id v5 = v4;
    [(CRLRectangularMarqueeTracker *)self p_updateMarquee];
  }
  else
  {
    self->_startedSelection = 1;
    id v5 = v4;
    [(CRLRectangularMarqueeTracker *)self p_beginMarquee];
  }
  id v4 = v5;
LABEL_6:
}

- (void)commitChangesForReps:(id)a3
{
  if (!self->_startedSelection) {
    return;
  }
  CGSize size = CGRectZero.size;
  self->_selectionRectScaled.origin = CGRectZero.origin;
  self->_selectionRectScaled.CGSize size = size;
  -[CRLCanvasRenderable setBounds:](self->_selectionOverlay, "setBounds:", a3, self->_selectionRectScaled.origin.x, self->_selectionRectScaled.origin.y, self->_selectionRectScaled.size.width, self->_selectionRectScaled.size.height);
  p_interactiveCanvasController = &self->_interactiveCanvasController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  [WeakRetained removeDecorator:self];

  v7 = +[NSNotificationCenter defaultCenter];
  id v8 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  [v7 removeObserver:self name:@"CRLCanvasUpdateScrollNotification" object:v8];

  if ([(NSMutableSet *)self->_pendingSelection count])
  {
    if (![(CRLRectangularMarqueeTracker *)self shouldSuppressContextMenu])
    {
      id v9 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
      v10 = [v9 layerHost];
      v11 = [v10 asiOSCVC];

      [v11 performSelector:"showDefaultEditUIForCurrentSelection" withObject:0 afterDelay:0.0];
LABEL_8:
    }
  }
  else if (![(CRLRectangularMarqueeTracker *)self shouldSuppressRestoringOriginalSelectionIfNothingSelected])
  {
    selectionBeforeMarquee = self->_selectionBeforeMarquee;
    v11 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v13 = [v11 editorController];
    [v13 setSelectionPath:selectionBeforeMarquee];

    goto LABEL_8;
  }
  id v14 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  v15 = [v14 layerHost];
  v16 = [v15 asiOSCVC];
  [v16 i_quickSelectViewController];
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19) {
    [v19 unhideUIIfAppropriateAfterHidingForWindowRect];
  }
  v17 = +[NSNotificationCenter defaultCenter];
  id v18 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  [v17 postNotificationName:@"CRLMarqueeDidEndNotification" object:v18 userInfo:0];
}

- (BOOL)operationShouldBeDynamic
{
  return 0;
}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 0;
}

- (BOOL)supportsAlignmentGuides
{
  return 0;
}

- (BOOL)disallowAllActionsWhileTracking
{
  return 1;
}

- (NSArray)decoratorOverlayRenderables
{
  selectionOverladouble y = self->_selectionOverlay;
  v2 = +[NSArray arrayWithObjects:&selectionOverlay count:1];

  return (NSArray *)v2;
}

- (void)p_updateMarquee
{
  p_interactiveCanvasController = &self->_interactiveCanvasController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  [WeakRetained convertUnscaledToBoundsPoint:self->_startingUnscaledPoint.x, self->_startingUnscaledPoint.y];
  double v6 = v5;
  double v8 = v7;

  id v9 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  [v9 convertUnscaledToBoundsPoint:self->_currentUnscaledDragPoint.x, self->_currentUnscaledDragPoint.y];
  double v11 = v10;
  double v13 = v12;

  v81.origin.double x = sub_100064044(v6, v8, v11);
  CGRect v82 = CGRectIntegral(v81);
  self->_selectionRectScaled = v82;
  if (self->_shouldCenterResizeMarqueeRect)
  {
    double v14 = sub_1000646A4(v82.size.width, v82.size.height, 2.0);
    self->_selectionRectScaled.origin.double x = sub_10006402C(v6, v8, v14);
    self->_selectionRectScaled.origin.double y = v15;
    self->_selectionRectScaled.size.double width = v16;
    self->_selectionRectScaled.size.double height = v17;
  }
  if ([(CRLRectangularMarqueeTracker *)self p_shouldUpdateMarqueeFrameForDragDistance:sub_1000653B4(v6, v8, v11, v13)])
  {
    -[CRLCanvasRenderable setFrame:](self->_selectionOverlay, "setFrame:", self->_selectionRectScaled.origin.x, self->_selectionRectScaled.origin.y, self->_selectionRectScaled.size.width, self->_selectionRectScaled.size.height);
  }
  id v18 = objc_alloc_init((Class)NSMutableSet);
  id v19 = objc_alloc_init((Class)NSMutableSet);
  location = (id *)p_interactiveCanvasController;
  id v20 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  [v20 convertBoundsToUnscaledRect:self->_selectionRectScaled.origin.x, self->_selectionRectScaled.origin.y, self->_selectionRectScaled.size.width, self->_selectionRectScaled.size.height];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v29 = self->_scaledRectsForReps;
  id v30 = [(NSMapTable *)v29 countByEnumeratingWithState:&v76 objects:v80 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v77;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v77 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        v35 = [(NSMapTable *)self->_scaledRectsForReps objectForKeyedSubscript:v34];
        [v35 CGRectValue];
        CGFloat v37 = v36;
        CGFloat v39 = v38;
        CGFloat v41 = v40;
        CGFloat v43 = v42;

        v44 = [v34 info];
        v84.origin.double x = v37;
        v84.origin.double y = v39;
        v84.size.double width = v41;
        v84.size.double height = v43;
        BOOL v45 = CGRectContainsRect(self->_selectionRectScaled, v84);
        v46 = v19;
        if (!v45)
        {
          v85.origin.double x = v37;
          v85.origin.double y = v39;
          v85.size.double width = v41;
          v85.size.double height = v43;
          BOOL v47 = CGRectIntersectsRect(self->_selectionRectScaled, v85);
          v46 = v18;
          if (v47)
          {
            if (objc_msgSend(v34, "intersectsUnscaledRect:", v22, v24, v26, v28)) {
              v46 = v19;
            }
            else {
              v46 = v18;
            }
          }
        }
        [v46 addObject:v44];
      }
      id v31 = [(NSMapTable *)v29 countByEnumeratingWithState:&v76 objects:v80 count:16];
    }
    while (v31);
  }

  [(NSMutableSet *)self->_pendingSelection minusSet:v18];
  [(NSMutableSet *)self->_pendingSelection unionSet:v19];
  if (self->_shouldInvertOriginalSelection) {
    [(NSMutableSet *)self->_pendingSelection crl_xorSet:self->_originalSelection];
  }
  [(CRLRectangularMarqueeTracker *)self p_setPendingSelection];
  self->_lastUnscaledPoint = self->_currentUnscaledDragPoint;
  id v48 = objc_loadWeakRetained(location);
  v49 = [v48 layerHost];
  v50 = [v49 asiOSCVC];
  v51 = [v50 i_quickSelectViewController];

  if (v51)
  {
    [(CRLRectangularMarqueeTracker *)self p_currentUnscaledMarqueeRect];
    double x = v83.origin.x;
    double y = v83.origin.y;
    double width = v83.size.width;
    double height = v83.size.height;
    if (!CGRectIsNull(v83))
    {
      id v56 = objc_loadWeakRetained(location);
      [v56 convertUnscaledToBoundsRect:x, y, width, height];
      double v58 = v57;
      double v60 = v59;
      double v62 = v61;
      double v64 = v63;

      id v65 = objc_loadWeakRetained(location);
      v66 = [v65 canvasView];
      [v66 convertRect:0 toView:v58];
      double v68 = v67;
      double v70 = v69;
      double v72 = v71;
      double v74 = v73;

      [v51 temporarilyHideUIIfAppropriateForWindowRect:v68, v70, v72, v74];
    }
  }
}

- (void)p_beginMarquee
{
  v3 = +[NSNotificationCenter defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  [v3 postNotificationName:@"CRLMarqueeDidBeginNotification" object:WeakRetained userInfo:0];

  id v5 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  [v5 addDecorator:self];

  id v6 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  double v7 = [v6 editorController];
  double v8 = [v7 selectionPath];
  selectionBeforeMarquee = self->_selectionBeforeMarquee;
  self->_selectionBeforeMarquee = v8;

  [(CRLRectangularMarqueeTracker *)self p_refreshRectsForReps];
  id v10 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  id v32 = [v10 canvasEditor];

  id v11 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  p_startingUnscaledPoint = &self->_startingUnscaledPoint;
  double v13 = [v11 hitRep:self->_startingUnscaledPoint.x, self->_startingUnscaledPoint.y];

  double v14 = [v13 repForSelecting];
  CGFloat v15 = v14;
  if (self->_shouldInvertOriginalSelection || v14 && [v14 isSelectedIgnoringLocking])
  {
    id v16 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    CGFloat v17 = [v16 infosForCurrentSelectionPath];

    id v18 = [v17 objectsPassingTest:&stru_1015015A0];

    [(NSMutableSet *)self->_pendingSelection unionSet:v18];
  }
  else
  {
    id v18 = [v32 selectionPathWithInfo:0];
    id v19 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    id v20 = [v19 editorController];
    [v20 setSelectionPath:v18];
  }
  id v21 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  double v22 = [v21 selectionModelTranslator];
  id v23 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  double v24 = [v23 editorController];
  double v25 = [v24 selectionPath];
  double v26 = [v22 boardItemsForSelectionPath:v25];
  originalSelection = self->_originalSelection;
  self->_originalSelection = v26;

  if (v15)
  {
    if (self->_shouldInvertOriginalSelection)
    {
      unsigned int v28 = [v15 isSelectedIgnoringLocking];
      pendingSelection = self->_pendingSelection;
      id v30 = [v15 info];
      if (v28)
      {
        [(NSMutableSet *)pendingSelection removeObject:v30];
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      if ([v15 isSelected])
      {
LABEL_14:
        [(CRLRectangularMarqueeTracker *)self p_setPendingSelection];
        goto LABEL_15;
      }
      pendingSelection = self->_pendingSelection;
      id v30 = [v15 info];
    }
    [(NSMutableSet *)pendingSelection addObject:v30];
    goto LABEL_13;
  }
LABEL_15:
  if (![(CRLRectangularMarqueeTracker *)self shouldSuppressAnimationWhenMarqueeBegins])[(CRLRectangularMarqueeTracker *)self p_beginMarqueePressAnimation]; {
  CGPoint v31 = *p_startingUnscaledPoint;
  }
  self->_lastUnscaledPoint = *p_startingUnscaledPoint;
  self->_currentUnscaledDragPoint = v31;
}

- (void)p_setPendingSelection
{
  p_interactiveCanvasController = &self->_interactiveCanvasController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  id v19 = [WeakRetained editorController];

  id v5 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  id v6 = [v5 canvasEditor];

  double v7 = [v19 selectionPath];
  double v8 = [v7 mostSpecificSelectionOfClass:objc_opt_class()];
  id v9 = v8;
  if (v8)
  {
    pendingSelection = self->_pendingSelection;
    id v11 = [v8 boardItems];
    double v12 = [v11 anyObject];
    [(NSMutableSet *)pendingSelection removeObject:v12];
  }
  id v13 = [(NSMutableSet *)self->_pendingSelection count];
  if (!v9 || v13)
  {
    id v18 = [v6 selectionPathWithInfos:self->_pendingSelection];
  }
  else
  {
    id v14 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
    CGFloat v15 = [v14 selectionModelTranslator];
    id v16 = [v9 containerGroups];
    CGFloat v17 = [v16 lastObject];
    id v18 = [v15 selectionPathForNothingSelectedInsideGroup:v17];
  }
  [v19 setSelectionPath:v18];
}

- (void)p_refreshRectsForReps
{
  v3 = NSAllMapTableKeys(self->_scaledRectsForReps);
  id v4 = [v3 mutableCopy];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  id v6 = [WeakRetained topLevelRepsForDragSelecting];

  id v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)v10) repForSelecting];
        double v12 = v11;
        if (v11 && ([v11 demandsExclusiveSelection] & 1) == 0)
        {
          id v13 = NSAllMapTableKeys(self->_scaledRectsForReps);
          unsigned __int8 v14 = [v13 containsObject:v12];

          if ((v14 & 1) == 0)
          {
            id v15 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
            [v12 frameInUnscaledCanvasForMarqueeSelecting];
            [v15 convertUnscaledToBoundsRect:];
            double v17 = v16;
            double v19 = v18;
            double v21 = v20;
            double v23 = v22;

            scaledRectsForReps = self->_scaledRectsForReps;
            double v25 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v17, v19, v21, v23);
            [(NSMapTable *)scaledRectsForReps setObject:v25 forKey:v12];
          }
          [v4 removeObject:v12];
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v8);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v26 = v4;
  id v27 = [v26 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v32;
    do
    {
      id v30 = 0;
      do
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v26);
        }
        -[NSMapTable removeObjectForKey:](self->_scaledRectsForReps, "removeObjectForKey:", *(void *)(*((void *)&v31 + 1) + 8 * (void)v30), (void)v31);
        id v30 = (char *)v30 + 1;
      }
      while (v28 != v30);
      id v28 = [v26 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v28);
  }
}

- (void)p_beginMarqueePressAnimation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  [WeakRetained convertUnscaledToBoundsPoint:self->_startingUnscaledPoint.x, self->_startingUnscaledPoint.y];
  double v5 = v4;
  double v7 = v6;

  double v8 = sub_10006402C(v5, v7, 1.0);
  double v10 = v9;
  double v12 = v11;
  [(CRLCanvasRenderable *)self->_selectionOverlay setFrame:v8];
  [(CRLCanvasRenderable *)self->_selectionOverlay removeAnimationForKey:@"kCRLMarqueeStartAnimationKey"];
  id v20 = +[CABasicAnimation animationWithKeyPath:@"bounds.size"];
  id v13 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", 80.0, 80.0);
  [v20 setFromValue:v13];

  unsigned __int8 v14 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v10, v12);
  [v20 setToValue:v14];

  LODWORD(v15) = 1036831949;
  LODWORD(v16) = 0.25;
  LODWORD(v17) = 0.25;
  LODWORD(v18) = 1.0;
  double v19 = +[CAMediaTimingFunction functionWithControlPoints:v16 :v15 :v17 :v18];
  [v20 setTimingFunction:v19];

  [v20 setDuration:0.3];
  [v20 setDelegate:self];
  [(CRLCanvasRenderable *)self->_selectionOverlay addAnimation:v20 forKey:@"kCRLMarqueeStartAnimationKey"];
}

- (void)p_stopMarqueePressAnimation
{
}

- (BOOL)p_shouldUpdateMarqueeFrameForDragDistance:(double)a3
{
  double v5 = [(CRLCanvasRenderable *)self->_selectionOverlay animationForKey:@"kCRLMarqueeStartAnimationKey"];

  BOOL v6 = a3 >= 20.0 || v5 == 0;
  BOOL v7 = v6;
  if (v6) {
    [(CRLRectangularMarqueeTracker *)self p_stopMarqueePressAnimation];
  }
  return v7;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (void)setInteractiveCanvasController:(id)a3
{
}

- (CGPoint)startingUnscaledPoint
{
  double x = self->_startingUnscaledPoint.x;
  double y = self->_startingUnscaledPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartingUnscaledPoint:(CGPoint)a3
{
  self->_startingUnscaledPoint = a3;
}

- (CGPoint)currentUnscaledDragPoint
{
  double x = self->_currentUnscaledDragPoint.x;
  double y = self->_currentUnscaledDragPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)shouldCenterResizeMarqueeRect
{
  return self->_shouldCenterResizeMarqueeRect;
}

- (void)setShouldCenterResizeMarqueeRect:(BOOL)a3
{
  self->_shouldCenterResizeMarqueeRect = a3;
}

- (BOOL)shouldInvertOriginalSelection
{
  return self->_shouldInvertOriginalSelection;
}

- (void)setShouldInvertOriginalSelection:(BOOL)a3
{
  self->_shouldInvertOriginalSelection = a3;
}

- (BOOL)shouldSuppressAnimationWhenMarqueeBegins
{
  return self->_shouldSuppressAnimationWhenMarqueeBegins;
}

- (void)setShouldSuppressAnimationWhenMarqueeBegins:(BOOL)a3
{
  self->_shouldSuppressAnimationWhenMarqueeBegins = a3;
}

- (BOOL)shouldSuppressContextMenu
{
  return self->_shouldSuppressContextMenu;
}

- (void)setShouldSuppressContextMenu:(BOOL)a3
{
  self->_shouldSuppressContextMenu = a3;
}

- (BOOL)shouldSuppressRestoringOriginalSelectionIfNothingSelected
{
  return self->_shouldSuppressRestoringOriginalSelectionIfNothingSelected;
}

- (void)setShouldSuppressRestoringOriginalSelectionIfNothingSelected:(BOOL)a3
{
  self->_shouldSuppressRestoringOriginalSelectionIfNothingSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionBeforeMarquee, 0);
  objc_storeStrong((id *)&self->_originalSelection, 0);
  objc_storeStrong((id *)&self->_pendingSelection, 0);
  objc_storeStrong((id *)&self->_scaledRectsForReps, 0);
  objc_destroyWeak((id *)&self->_interactiveCanvasController);

  objc_storeStrong((id *)&self->_selectionOverlay, 0);
}

@end