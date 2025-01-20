@interface THWReviewImageWithTargetsRep
- (BOOL)allowTrackingInControlContainer:(id)a3;
- (BOOL)directlyManagesLayerContent;
- (BOOL)p_areAllTargetsSelected;
- (BOOL)p_drawerContainsPoint:(CGPoint)a3;
- (BOOL)reviewDragAllowDraggingForRep:(id)a3;
- (BOOL)reviewQuestionIsAnswerCheckable;
- (BOOL)wasInDrawer;
- (CGPoint)anchorPoint;
- (CGPoint)layerDragging:(id)a3 convertNaturalPointToBounds:(CGPoint)a4;
- (CGPoint)layerDragging:(id)a3 naturalPositionWithGesture:(id)a4;
- (CGPoint)layerDraggingBoundsLocationForICCWithGesture:(id)a3;
- (THWLayerDraggingController)layerDraggingController;
- (THWReviewImageWithTargetsRep)initWithLayout:(id)a3 canvas:(id)a4;
- (TSDRep)draggingRep;
- (id)p_choiceAtIndex:(unint64_t)a3;
- (id)p_filterAnimation:(id)a3 forLayer:(id)a4 key:(id)a5 forPlacardRep:(id)a6;
- (id)p_questionHost;
- (id)p_repForTargetIndex:(unint64_t)a3;
- (id)p_targetRepForPlacardRep:(id)a3;
- (int)questionState;
- (int)reviewQuestionStateForChoiceIndex:(unint64_t)a3;
- (unint64_t)draggingPlacardIndex;
- (unint64_t)p_draggingPlacardIndexForRep:(id)a3;
- (unint64_t)p_targetIndexNearPoint:(CGPoint)a3;
- (unint64_t)pressedTargetIndex;
- (void)addAdditionalChildLayersToArray:(id)a3;
- (void)dealloc;
- (void)layerDraggingDidBegin:(id)a3 withPosition:(CGPoint)a4;
- (void)layerDraggingDidEnd:(id)a3 withPosition:(CGPoint)a4;
- (void)layerDraggingDidMove:(id)a3 withPosition:(CGPoint)a4;
- (void)p_addDropAnimationWithCompletion:(id)a3;
- (void)p_addPickupAnimation;
- (void)p_animatePlacardChanges:(id)a3 duration:(double)a4;
- (void)p_didDragInsideDrawer:(BOOL)a3;
- (void)p_setPanGRs:(BOOL)a3;
- (void)p_updateDrawerStateForPoint:(CGPoint)a3;
- (void)p_updateTargetStateForPoint:(CGPoint)a3;
- (void)p_updateTargetsAndPlacardLayout:(BOOL)a3 animated:(BOOL)a4;
- (void)reviewDragHandleForRep:(id)a3 withGesture:(id)a4;
- (void)reviewDragWillBeginForRep:(id)a3 withGesture:(id)a4;
- (void)reviewQuestionAnswerUpdated;
- (void)reviewQuestionUpdateChoiceIndex:(unint64_t)a3 withState:(int)a4;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setPressedTargetIndex:(unint64_t)a3;
- (void)setQuestionState:(int)a3;
- (void)setWasInDrawer:(BOOL)a3;
- (void)updateChildrenFromLayout;
@end

@implementation THWReviewImageWithTargetsRep

- (THWReviewImageWithTargetsRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THWReviewImageWithTargetsRep;
  result = [(THWReviewImageWithTargetsRep *)&v5 initWithLayout:a3 canvas:a4];
  if (result) {
    result->_pressedTargetIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageWithTargetsRep;
  [(THWReviewImageWithTargetsRep *)&v3 dealloc];
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (BOOL)allowTrackingInControlContainer:(id)a3
{
  return 1;
}

- (void)updateChildrenFromLayout
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageWithTargetsRep;
  [(THWReviewImageWithTargetsRep *)&v3 updateChildrenFromLayout];
  if (!self->_questionState)
  {
    -[THWReviewImageWithTargetsRep setQuestionState:](self, "setQuestionState:", objc_msgSend(-[THWReviewImageWithTargetsRep p_questionHost](self, "p_questionHost"), "reviewQuestionInitialState:", self));
    [(THWReviewImageWithTargetsRep *)self p_updateTargetsAndPlacardLayout:1 animated:0];
    [self.p_questionHost reviewQuestionDidUpdateState:self];
  }
}

- (void)p_updateTargetsAndPlacardLayout:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v24 = a4;
  BOOL v21 = a3;
  id v5 = [(THWReviewImageWithTargetsRep *)self canvas];
  id v6 = [(THWReviewImageWithTargetsRep *)self layout];
  id v7 = [(THWReviewImageWithTargetsRep *)self p_questionHost];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [v6 placardLayouts];
  id v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v13 = [v7 reviewQuestion:self targetForPlacard:[v12 index]];
        objc_opt_class();
        [v5 repForLayout:v12];
        [TSUDynamicCast setArrowDirection:[v6 placardArrowPlacementforTarget:v13]];
      }
      id v9 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v9);
  }
  if (v21) {
    [v6 updatePlacardLayouts];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obja = [v6 targetLayouts];
  id v14 = [obja countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(obja);
        }
        v18 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
        BOOL v19 = [v7 reviewQuestion:self placardForTarget:[v18 index]];
        objc_opt_class();
        [v5 repForLayout:v18];
        [(id)TSUDynamicCast() setRadioState:(2 * v19) animated:v24];
      }
      id v15 = [obja countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v15);
  }
  if (v24)
  {
    +[CATransaction begin];
    id v20 = [(THWReviewImageWithTargetsRep *)self interactiveCanvasController];
    [v20 beginAnimations:@"position" context:0];
    [v20 setAnimationDuration:0.3];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1B43BC;
    v25[3] = &unk_45A8B8;
    v25[4] = self;
    [v20 setAnimationFilterBlock:v25];
    [v20 layoutIfNeeded];
    [v20 commitAnimations];
    +[CATransaction commit];
  }
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageWithTargetsRep;
  [(THWReviewImageWithTargetsRep *)&v3 addAdditionalChildLayersToArray:a3];
}

- (int)reviewQuestionStateForChoiceIndex:(unint64_t)a3
{
  return 0;
}

- (void)reviewQuestionUpdateChoiceIndex:(unint64_t)a3 withState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = [(THWReviewImageWithTargetsRep *)self p_repForTargetIndex:a3];

  [v5 setChoiceState:v4];
}

- (void)reviewQuestionAnswerUpdated
{
  [self p_questionHost].reviewQuestionIsCurrentlyInView:self];

  [(THWReviewImageWithTargetsRep *)self p_updateTargetsAndPlacardLayout:1 animated:v3];
}

- (BOOL)reviewQuestionIsAnswerCheckable
{
  return [(THWReviewImageWithTargetsRep *)self p_areAllTargetsSelected];
}

- (void)setQuestionState:(int)a3
{
  if (self->_questionState != a3)
  {
    if (a3 == 1)
    {
      id v5 = [(THWReviewImageWithTargetsRep *)self interactiveCanvasController];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v6 = [[-[THWReviewImageWithTargetsRep layout](self, "layout") targetLayouts];
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v14;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
            objc_opt_class();
            [v5 repForLayout:v11];
            v12 = (void *)TSUDynamicCast();
            [v12 setRadioState:0];
            [v12 setChoiceState:0];
          }
          id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v8);
      }
    }
    self->_questionState = a3;
    [self.p_questionHost reviewQuestionDidUpdateState:self];
  }
}

- (BOOL)reviewDragAllowDraggingForRep:(id)a3
{
  id v3 = [(THWReviewImageWithTargetsRep *)self p_targetRepForPlacardRep:a3];
  return !v3 || [v3 choiceState] != 1;
}

- (void)reviewDragWillBeginForRep:(id)a3 withGesture:(id)a4
{
  if (a3)
  {
    uint64_t v4 = self;
    if (!self->_layerDraggingController)
    {
      [(THWReviewImageWithTargetsRep *)self p_setPanGRs:0];
      id v7 = objc_msgSend(objc_msgSend(a3, "interactiveCanvasController"), "layerForRep:", a3);
      id v8 = (TSDRep *)a3;
      v4->_draggingRep = v8;
      [(TSDRep *)v8 pauseLayerUpdates];
      [a4 naturalLocationForRep:v4->_draggingRep];
      double v10 = v9;
      double v12 = v11;
      [(TSDRep *)v4->_draggingRep naturalBounds];
      v4->_anchorPoint.x = v10 / v13;
      v4->_anchorPoint.y = v12 / v14;
      v4->_layerDraggingController = [[THWLayerDraggingController alloc] initWithLayer:hostView:gesture:anchorPoint:delegate:](v7, [THWReviewImageWithTargetsRep p_questionHost](v4, "p_questionHost"), "reviewQuestionDraggingHostView:", v4), a4, v4, v4->_anchorPoint.x, v4->_anchorPoint.y);
      objc_opt_class();
      [(THWReviewImageWithTargetsRep *)v4 draggingRep];
      long long v15 = (void *)TSUDynamicCast();
      long long v16 = v15;
      if (v15)
      {
        [v15 setArrowDirection:0];
        objc_msgSend(objc_msgSend(v16, "layout"), "setPlacement:", 2);
      }
      [(THWReviewImageWithTargetsRep *)v4 p_animatePlacardChanges:v16 duration:0.3];
      id v17 = [(THWReviewImageWithTargetsRep *)v4 p_targetRepForPlacardRep:v16];
      if ([v17 choiceState] == 2)
      {
        id v28 = a4;
        id v18 = [(THWReviewImageWithTargetsRep *)v4 interactiveCanvasController];
        id v19 = objc_alloc_init((Class)NSMutableIndexSet);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v27 = v4;
        id v20 = [(-[THWReviewImageWithTargetsRep layout](v4, "layout")) targetLayouts];
        id v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v30;
          do
          {
            for (i = 0; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v30 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              objc_opt_class();
              [v18 repForLayout:v25];
              id v26 = (id)TSUDynamicCast();
              if ([v26 choiceState] == 2)
              {
                [v26 setChoiceState:0];
                if (v26 != v17) {
                  [v19 addIndex:[v25 index]];
                }
              }
            }
            id v22 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v22);
        }
        uint64_t v4 = v27;
        [v27 p_questionHost].reviewQuestion:unassociateTargets:v27, v19];

        a4 = v28;
      }
      [(THWLayerDraggingController *)v4->_layerDraggingController handleGesture:a4];
    }
  }
}

- (void)reviewDragHandleForRep:(id)a3 withGesture:(id)a4
{
}

- (void)layerDraggingDidBegin:(id)a3 withPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  unint64_t v7 = [(THWReviewImageWithTargetsRep *)self draggingPlacardIndex];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [-THWReviewImageWithTargetsRep p_repForTargetIndex:](self, "p_repForTargetIndex:", [-THWReviewImageWithTargetsRep p_questionHost](self, "p_questionHost"), "reviewQuestion:targetForPlacard:", self, v7);
    if (v8)
    {
      double v9 = v8;
      objc_msgSend(objc_msgSend(v8, "layout"), "distanceSquaredToPoint:", x, y);
      if (v10 > 14400.0) {
        [v9 setRadioState:0];
      }
    }
  }
  -[THWReviewImageWithTargetsRep setWasInDrawer:](self, "setWasInDrawer:", -[THWReviewImageWithTargetsRep p_drawerContainsPoint:](self, "p_drawerContainsPoint:", x, y));
  -[THWReviewImageWithTargetsRep p_updateTargetStateForPoint:](self, "p_updateTargetStateForPoint:", x, y);

  [(THWReviewImageWithTargetsRep *)self p_addPickupAnimation];
}

- (void)layerDraggingDidMove:(id)a3 withPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(THWReviewImageWithTargetsRep *)self p_updateTargetStateForPoint:a3];

  -[THWReviewImageWithTargetsRep p_updateDrawerStateForPoint:](self, "p_updateDrawerStateForPoint:", x, y);
}

- (void)layerDraggingDidEnd:(id)a3 withPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(THWReviewImageWithTargetsRep *)self p_setPanGRs:1];
  +[CATransaction begin];
  -[THWReviewImageWithTargetsRep p_updateTargetStateForPoint:](self, "p_updateTargetStateForPoint:", x, y);
  objc_opt_class();
  [(THWReviewImageWithTargetsRep *)self draggingRep];
  unint64_t v7 = (void *)TSUDynamicCast();
  unint64_t v8 = -[THWReviewImageWithTargetsRep p_targetIndexNearPoint:](self, "p_targetIndexNearPoint:", x, y);
  unint64_t v9 = [(THWReviewImageWithTargetsRep *)self draggingPlacardIndex];
  unint64_t v10 = v9;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v12 = 0;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL && v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(THWReviewImageWithTargetsRep *)self p_didDragInsideDrawer:0];
      int v12 = 1;
    }
  }
  else if (v7 {
         && (id v11 = [(THWReviewImageWithTargetsRep *)self p_repForTargetIndex:v8],
  }
             [v11 choiceState] != 1))
  {
    [v7 setArrowDirection:[-[THWReviewImageWithTargetsRep layout](self, "layout") placardArrowPlacementforTarget:v8]];
    int v12 = 1;
    objc_msgSend(objc_msgSend(v7, "layout"), "setPlacement:", 1);
    [v11 setRadioState:2];
  }
  else
  {
    int v12 = 0;
  }
  if (objc_msgSend(objc_msgSend(v7, "layout"), "placement") == 2) {
    objc_msgSend(objc_msgSend(v7, "layout"), "setPlacement:", 0);
  }
  [(THWReviewImageWithTargetsRep *)self setPressedTargetIndex:0x7FFFFFFFFFFFFFFFLL];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1B4D80;
  v25[3] = &unk_456DE0;
  v25[4] = self;
  id v13 = [(TSDRep *)self->_draggingRep interactiveCanvasController];
  [(THWReviewImageWithTargetsRep *)self p_animatePlacardChanges:v7 duration:0.3];
  if (v12) {
    [self p_questionHost] reviewQuestion:self associatePlacard:v10 withTarget:v8];
  }
  [(TSDRep *)self->_draggingRep layerFrameInScaledCanvasRelativeToParent];
  [self canvas].convertBoundsToUnscaledRect:v14, v15, v16, v17];
  layerDraggingController = self->_layerDraggingController;
  TSDCenterOfRect();
  -[THWReviewImageWithTargetsRep layerDragging:convertNaturalPointToBounds:](self, "layerDragging:convertNaturalPointToBounds:", layerDraggingController);
  double v20 = v19;
  double v22 = v21;
  [v13 beginAnimations:@"position" context:0];
  [v13 setAnimationDuration:0.3];
  [v13 setAnimationCompletionBlock:v25];
  [(CALayer *)[(THWLayerDraggingController *)self->_layerDraggingController layer] bounds];
  TSDCenterOfRect();
  -[CALayer setPosition:]([(THWLayerDraggingController *)self->_layerDraggingController layer], "setPosition:", v23, v24);
  -[CALayer setPosition:]([(THWLayerDraggingController *)self->_layerDraggingController wrapperLayer], "setPosition:", v20, v22);
  [v13 commitAnimations];
  +[CATransaction commit];
}

- (CGPoint)layerDragging:(id)a3 naturalPositionWithGesture:(id)a4
{
  [a4 naturalLocationForRep:self];
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)layerDragging:(id)a3 convertNaturalPointToBounds:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v8 = [(THWReviewImageWithTargetsRep *)self canvas];
  -[THWReviewImageWithTargetsRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y);
  [v8 convertUnscaledToBoundsPoint:];
  double v10 = v9;
  double v12 = v11;
  id v13 = [a3 hostView];
  id v14 = [self interactiveCanvasController].canvasView;

  [v13 convertPoint:v14 fromView:v10];
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (CGPoint)layerDraggingBoundsLocationForICCWithGesture:(id)a3
{
  id v4 = [(THWReviewImageWithTargetsRep *)self interactiveCanvasController];

  [a3 boundsLocationForICC:v4];
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (id)p_choiceAtIndex:(unint64_t)a3
{
  id v4 = objc_msgSend(objc_msgSend(-[THWReviewImageWithTargetsRep layout](self, "layout"), "question"), "choices");
  if ((unint64_t)[v4 count] <= a3) {
    return 0;
  }

  return [v4 objectAtIndex:a3];
}

- (id)p_questionHost
{
  id v3 = [(THWReviewImageWithTargetsRep *)self interactiveCanvasController];

  return [v3 ancestorRepOfRep:self orDelegateConformingToProtocol:&OBJC_PROTOCOL___THWReviewQuestionHosting];
}

- (unint64_t)p_targetIndexNearPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (-[THWReviewImageWithTargetsRep p_drawerContainsPoint:](self, "p_drawerContainsPoint:")) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [self layout:0].targetLayouts;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v7) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v18;
  unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  double v11 = 1.79769313e308;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v6);
      }
      id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      [v13 distanceSquaredToPoint:x, y];
      if (v14 < v11)
      {
        double v15 = v14;
        if (v14 <= 14400.0)
        {
          unint64_t v10 = (unint64_t)[v13 index];
          double v11 = v15;
        }
      }
    }
    id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v8);
  return v10;
}

- (id)p_repForTargetIndex:(unint64_t)a3
{
  objc_opt_class();
  [self interactiveCanvasController].repForLayout:[self layout].layoutForTargetIndex:a3];

  return (id)TSUDynamicCast();
}

- (void)p_updateTargetStateForPoint:(CGPoint)a3
{
  unint64_t v4 = -[THWReviewImageWithTargetsRep p_targetIndexNearPoint:](self, "p_targetIndexNearPoint:", a3.x, a3.y);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    id v5 = 0;
  }
  else {
    id v5 = [(THWReviewImageWithTargetsRep *)self p_repForTargetIndex:v4];
  }
  unint64_t v6 = [(THWReviewImageWithTargetsRep *)self pressedTargetIndex];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
    if (v5) {
      goto LABEL_6;
    }
LABEL_10:
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_11;
  }
  id v7 = [(THWReviewImageWithTargetsRep *)self p_repForTargetIndex:v6];
  if (!v5) {
    goto LABEL_10;
  }
LABEL_6:
  if ([v5 choiceState] == 1 || v5 == v7) {
    return;
  }
  [v5 setRadioState:1];
LABEL_11:
  [(THWReviewImageWithTargetsRep *)self setPressedTargetIndex:v4];
  if (v7)
  {
    id v8 = [self p_questionHost] reviewQuestion:self placardForTarget:v6];
    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 2
    }
         * (v8 != (id)[(THWReviewImageWithTargetsRep *)self draggingPlacardIndex]);
    [v7 setRadioState:v9];
  }
}

- (BOOL)p_drawerContainsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v5 = [(THWReviewImageWithTargetsRep *)self layout];
  if (v5)
  {
    id v6 = [v5 drawerFrame];
    v13.n128_u64[0] = v9.n128_u64[0];
    v14.n128_u64[0] = v10.n128_u64[0];
    unint64_t v7 = v11.n128_u64[0];
    unint64_t v8 = v12.n128_u64[0];
    v9.n128_f64[0] = x;
    v10.n128_f64[0] = y;
    v11.n128_u64[0] = v13.n128_u64[0];
    v12.n128_u64[0] = v14.n128_u64[0];
    v13.n128_u64[0] = v7;
    v14.n128_u64[0] = v8;
    LOBYTE(v5) = _TSDPointInRectInclusive(v6, v9, v10, v11, v12, v13, v14);
  }
  return (char)v5;
}

- (void)p_updateDrawerStateForPoint:(CGPoint)a3
{
  BOOL v4 = -[THWReviewImageWithTargetsRep p_drawerContainsPoint:](self, "p_drawerContainsPoint:", a3.x, a3.y);
  unsigned int v5 = [(THWReviewImageWithTargetsRep *)self wasInDrawer];
  if (v4)
  {
    if (v5)
    {
      BOOL v4 = 1;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (v5)
  {
LABEL_5:
    [(THWReviewImageWithTargetsRep *)self p_didDragInsideDrawer:v4];
    goto LABEL_7;
  }
  BOOL v4 = 0;
LABEL_7:

  [(THWReviewImageWithTargetsRep *)self setWasInDrawer:v4];
}

- (void)p_addPickupAnimation
{
  id v3 = [(THWLayerDraggingController *)self->_layerDraggingController layer];
  id v4 = [(TSDRep *)self->_draggingRep interactiveCanvasController];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    id v6 = v4;
    [(CALayer *)v3 bounds];
    double v8 = v7;
    [v6 beginAnimations:@"scale" context:0];
    [v6 setAnimationDuration:0.15];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1B559C;
    v12[3] = &unk_456E38;
    v12[4] = v6;
    v12[5] = v3;
    [v6 setAnimationCompletionBlock:v12];
    CGAffineTransformMakeScale(&v11, 1.2, 1.2);
    CGAffineTransform v10 = v11;
    [(CALayer *)v3 setAffineTransform:&v10];
    [v6 commitAnimations];
    [v6 beginAnimations:@"position+opacity" context:0];
    [v6 setAnimationDuration:0.3];
    -[CALayer setPosition:](v3, "setPosition:", v8 * 0.5, -14.0);
    LODWORD(v9) = 1061997773;
    [(CALayer *)v3 setOpacity:v9];
    [v6 commitAnimations];
  }
}

- (void)p_addDropAnimationWithCompletion:(id)a3
{
  BOOL v5 = [(THWLayerDraggingController *)self->_layerDraggingController layer];
  id v6 = [(TSDRep *)self->_draggingRep interactiveCanvasController];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    double v8 = v6;
    +[CATransaction begin];
    [v8 beginAnimations:@"scale+opacity" context:0];
    [v8 setAnimationDuration:0.15];
    [v8 setAnimationCompletionBlock:a3];
    long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v11[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v11[1] = v9;
    v11[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [(CALayer *)v5 setAffineTransform:v11];
    LODWORD(v10) = 1.0;
    [(CALayer *)v5 setOpacity:v10];
    [v8 commitAnimations];
    +[CATransaction commit];
  }
}

- (unint64_t)draggingPlacardIndex
{
  return [(THWReviewImageWithTargetsRep *)self p_draggingPlacardIndexForRep:self->_draggingRep];
}

- (unint64_t)p_draggingPlacardIndexForRep:(id)a3
{
  objc_opt_class();
  [a3 layout];
  id v4 = (void *)TSUDynamicCast();
  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return (unint64_t)[v4 index];
}

- (id)p_targetRepForPlacardRep:(id)a3
{
  id v4 = [self p_questionHost] reviewQuestion:self targetForPlacard:[self p_draggingPlacardIndexForRep:a3];

  return [(THWReviewImageWithTargetsRep *)self p_repForTargetIndex:v4];
}

- (BOOL)p_areAllTargetsSelected
{
  id v3 = [(THWReviewImageWithTargetsRep *)self interactiveCanvasController];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [self layout:0 targetLayouts];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      double v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v8);
        objc_opt_class();
        [v3 repForLayout:v9];
        if ([(id)TSUDynamicCast() radioState] != 2) {
          return 0;
        }
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (id)p_filterAnimation:(id)a3 forLayer:(id)a4 key:(id)a5 forPlacardRep:(id)a6
{
  id v11 = [(THWReviewImageWithTargetsRep *)self interactiveCanvasController];
  long long v12 = +[NSNull null];
  id v13 = [v11 repForLayer:a4];
  if (!v13) {
    id v13 = [v11 repForLayer:[a4 superlayer]];
  }
  objc_opt_class();
  uint64_t v14 = TSUDynamicCast();
  objc_opt_class();
  [v13 parentRep];
  uint64_t v15 = TSUDynamicCast();
  if (![a5 isEqualToString:@"path"] || objc_msgSend((id)v14, "calloutLayer") != a4)
  {
    if (a6)
    {
      id result = 0;
      if ((id)v14 == a6 || (id)v15 == a6) {
        return result;
      }
    }
    else if (v14 | v15)
    {
      return 0;
    }
    layerDraggingController = self->_layerDraggingController;
    if (!layerDraggingController) {
      return v12;
    }
    if ([(THWLayerDraggingController *)layerDraggingController wrapperLayer] == a4) {
      return 0;
    }
    return v12;
  }
  [a3 duration];

  return [v14 calloutPathAnimationWithduration:];
}

- (void)p_animatePlacardChanges:(id)a3 duration:(double)a4
{
  id v7 = [a3 interactiveCanvasController];
  id v8 = [v7 layerForRep:a3];
  +[CATransaction begin];
  [v7 beginAnimations:@"placard-bounds" context:0];
  id v9 = [a3 contentTextRep];
  if (v9)
  {
    double v10 = v9;
    id v11 = +[CATransition animation];
    [v11 setType:kCATransitionFade];
    [v11 setDuration:a4];
    objc_msgSend(objc_msgSend(v10, "textLayer"), "addAnimation:forKey:", v11, @"fadeAnimation");
  }
  [v7 setAnimationDuration:a4];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1B5C3C;
  v20[3] = &unk_45A8E0;
  v20[4] = self;
  v20[5] = a3;
  [v7 setAnimationFilterBlock:v20];
  [v7 layoutIfNeeded];
  [a3 updateLayerBoundsAndWPPosition];
  [v8 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  TSDCenterOfRect();
  [v8 setPosition:];
  -[CALayer setBounds:]([(THWLayerDraggingController *)self->_layerDraggingController wrapperLayer], "setBounds:", v13, v15, v17, v19);
  [v7 commitAnimations];
  +[CATransaction commit];
}

- (void)p_setPanGRs:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [[self interactiveCanvasController] canvasView];
  if (v4)
  {
    id v5 = v4;
    do
    {
      objc_opt_class();
      id v6 = (void *)TSUDynamicCast();
      if (v6) {
        objc_msgSend(objc_msgSend(v6, "panGestureRecognizer"), "setEnabled:", v3);
      }
      id v5 = [v5 superview];
    }
    while (v5);
  }
}

- (void)p_didDragInsideDrawer:(BOOL)a3
{
  BOOL v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [self layout:0 placardLayouts];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    if (v3) {
      float v9 = 0.5;
    }
    else {
      float v9 = 1.0;
    }
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v10);
        objc_opt_class();
        [self canvas] repForLayout:v11];
        double v12 = (void *)TSUDynamicCast();
        if (!objc_msgSend(objc_msgSend(v12, "layout"), "placement"))
        {
          id v13 = objc_msgSend(objc_msgSend(v12, "interactiveCanvasController"), "layerForRep:", v12);
          *(float *)&double v14 = v9;
          [v13 setOpacity:v14];
        }
        double v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (int)questionState
{
  return self->_questionState;
}

- (THWLayerDraggingController)layerDraggingController
{
  return self->_layerDraggingController;
}

- (TSDRep)draggingRep
{
  return self->_draggingRep;
}

- (unint64_t)pressedTargetIndex
{
  return self->_pressedTargetIndex;
}

- (void)setPressedTargetIndex:(unint64_t)a3
{
  self->_pressedTargetIndeCGFloat x = a3;
}

- (BOOL)wasInDrawer
{
  return self->_wasInDrawer;
}

- (void)setWasInDrawer:(BOOL)a3
{
  self->_wasInDrawer = a3;
}

- (CGPoint)anchorPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

@end