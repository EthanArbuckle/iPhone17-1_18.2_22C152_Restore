@interface CRLGroupRep
- (BOOL)canBeOccluded;
- (BOOL)canOcclude;
- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4;
- (BOOL)containsPoint:(CGPoint)a3 withSlop:(CGSize)a4;
- (BOOL)containsUnknownContent;
- (BOOL)directlyManagesLayerContent;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)handleMultipleTapAtPoint:(CGPoint)a3;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)i_childRepsWantContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3 onlyNonGrouped:(BOOL)a4;
- (BOOL)i_shouldSmallHitRepTestingRecurse;
- (BOOL)intersectsUnscaledRect:(CGRect)a3;
- (BOOL)isInvisible;
- (BOOL)isSelectedIgnoringLocking;
- (BOOL)occludesSelectedRep;
- (BOOL)p_allowedToEditChildren;
- (BOOL)p_handleSubselectionTapAtPoint:(CGPoint)a3;
- (BOOL)shouldShowCollaboratorCursorHighlight;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3;
- (BOOL)wantsToHandleTapsWhenLocked;
- (BOOL)willHandleFreeTransformingLayoutForRep:(id)a3;
- (BOOL)willHandleResizingLayoutForRep:(id)a3;
- (CGPoint)convertNaturalPointFromUnscaledCanvas:(CGPoint)a3;
- (CGRect)clipRect;
- (CGRect)frameInUnscaledCanvas;
- (CGRect)frameInUnscaledCanvasForMarqueeSelecting;
- (CGRect)i_baseFrameInUnscaledCanvasForPositioningLayer;
- (CRLContainerInfo)containerInfo;
- (Class)layerClass;
- (NSArray)allRepsContainedInGroup;
- (id)beginEditingChildrenIfAllowedAtUnscaledPoint:(CGPoint)a3 pickingDeepestChild:(BOOL)a4;
- (id)createAdditionalBoardItemsForCopyImaging;
- (id)dynamicResizeDidBegin;
- (id)i_handleDeepSubselectionTapAtPoint:(CGPoint)a3;
- (id)overlayRenderables;
- (id)p_groupItem;
- (id)p_groupedChildReps;
- (id)repForAlternatePressureDragAtPoint:(CGPoint)a3;
- (id)selectionHighlightColor;
- (id)unscaledPathToIncludeForSystemPreviewOutline;
- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3;
- (void)dynamicFreeTransformDidEndWithTracker:(id)a3;
- (void)dynamicOperationDidBeginWithRealTimeCommands:(BOOL)a3;
- (void)dynamicResizeDidEndWithTracker:(id)a3;
- (void)dynamicallyFreeTransformingWithTracker:(id)a3;
- (void)dynamicallyResizingWithTracker:(id)a3;
- (void)processChangedProperty:(unint64_t)a3;
- (void)recursivelyDrawInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4;
- (void)setNeedsDisplay;
- (void)updateChildrenFromLayout;
- (void)updateFromLayout;
@end

@implementation CRLGroupRep

- (id)p_groupItem
{
  v3 = (objc_class *)objc_opt_class();
  v4 = [(CRLCanvasRep *)self info];
  v5 = sub_10024715C(v3, v4);

  return v5;
}

- (CRLContainerInfo)containerInfo
{
  v2 = [(CRLCanvasRep *)self info];
  v9 = sub_100246AC8(v2, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);

  return (CRLContainerInfo *)v9;
}

- (BOOL)isInvisible
{
  return 1;
}

- (CGRect)clipRect
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v6 = [(CRLGroupRep *)self p_groupedChildReps];
  id v7 = [v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        [v11 clipRect:*(_OWORD *)&v34.a, *(_OWORD *)&v34.c, *(_OWORD *)&v34.tx];
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        v20 = [v11 layout];
        v21 = [v20 geometry];
        v22 = v21;
        if (v21) {
          [v21 transform];
        }
        else {
          memset(&v34, 0, sizeof(v34));
        }
        v40.origin.CGFloat x = v13;
        v40.origin.CGFloat y = v15;
        v40.size.CGFloat width = v17;
        v40.size.CGFloat height = v19;
        CGRect v41 = CGRectApplyAffineTransform(v40, &v34);
        CGFloat v23 = v41.origin.x;
        CGFloat v24 = v41.origin.y;
        CGFloat v25 = v41.size.width;
        CGFloat v26 = v41.size.height;

        v42.origin.CGFloat x = x;
        v42.origin.CGFloat y = y;
        v42.size.CGFloat width = width;
        v42.size.CGFloat height = height;
        v46.origin.CGFloat x = v23;
        v46.origin.CGFloat y = v24;
        v46.size.CGFloat width = v25;
        v46.size.CGFloat height = v26;
        CGRect v43 = CGRectUnion(v42, v46);
        CGFloat x = v43.origin.x;
        CGFloat y = v43.origin.y;
        CGFloat width = v43.size.width;
        CGFloat height = v43.size.height;
      }
      id v8 = [v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v8);
  }

  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  if (CGRectIsNull(v44))
  {
    +[CRLGroupItem unscaledSizeForEmptyGroups];
    CGFloat x = sub_100064070();
    CGFloat y = v27;
    CGFloat width = v28;
    CGFloat height = v29;
  }
  double v30 = x;
  double v31 = y;
  double v32 = width;
  double v33 = height;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (void)recursivelyDrawInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4
{
  id v6 = a4;
  memset(&v26, 0, sizeof(v26));
  id v7 = [(CRLCanvasRep *)self layout];
  id v8 = [v7 geometry];
  uint64_t v9 = v8;
  if (v8) {
    [v8 transform];
  }
  else {
    memset(&v26, 0, sizeof(v26));
  }

  if (sub_1001ACE20(&v26.a))
  {
    CGAffineTransform v25 = v26;
    CGContextConcatCTM(a3, &v25);
    [(CRLGroupRep *)self clipRect];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    double v15 = v14;
    double v17 = v16;
    unsigned int v18 = [(CRLCanvasRep *)self masksToBounds];
    if ((sub_100067C6C() & 1) == 0)
    {
      BOOL v19 = sub_100064EF4(v15, v17);
      if (v18 && !v19)
      {
        v27.origin.CGFloat x = v11;
        v27.origin.CGFloat y = v13;
        v27.size.CGFloat width = v15;
        v27.size.CGFloat height = v17;
        CGContextClipToRect(a3, v27);
LABEL_21:
        CGContextSaveGState(a3);
        if ((v18 & 1) == 0)
        {
          v28.origin.CGFloat x = v11;
          v28.origin.CGFloat y = v13;
          v28.size.CGFloat width = v15;
          v28.size.CGFloat height = v17;
          CGContextClipToRect(a3, v28);
        }
        [(CRLGroupRep *)self drawInContext:a3];
        CGContextRestoreGState(a3);
LABEL_24:
        [(CRLCanvasRep *)self recursivelyDrawChildrenInContext:a3 keepingChildrenPassingTest:v6];
        goto LABEL_25;
      }
      if (!v19) {
        goto LABEL_21;
      }
    }
    if (v18) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  int v20 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D1EA8);
  }
  v21 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010720E8(v20, v21);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D1EC8);
  }
  v22 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101066770(v22, v20);
  }
  CGFloat v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupRep recursivelyDrawInContext:keepingChildrenPassingTest:]");
  CGFloat v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupRep.m"];
  +[CRLAssertionHandler handleFailureInFunction:v23 file:v24 lineNumber:93 isFatal:0 description:"Invalid group transform; bailing out on group"];

LABEL_25:
}

- (CGRect)frameInUnscaledCanvas
{
  v2 = [(CRLCanvasRep *)self layout];
  uint64_t v3 = [v2 pureGeometryInRoot];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)frameInUnscaledCanvasForMarqueeSelecting
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v6 = [(CRLCanvasRep *)self childReps];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v10) frameInUnscaledCanvasForMarqueeSelecting];
        v27.origin.CGFloat x = v11;
        v27.origin.CGFloat y = v12;
        v27.size.CGFloat width = v13;
        v27.size.CGFloat height = v14;
        v24.origin.CGFloat x = x;
        v24.origin.CGFloat y = y;
        v24.size.CGFloat width = width;
        v24.size.CGFloat height = height;
        CGRect v25 = CGRectUnion(v24, v27);
        CGFloat x = v25.origin.x;
        CGFloat y = v25.origin.y;
        CGFloat width = v25.size.width;
        CGFloat height = v25.size.height;
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)i_baseFrameInUnscaledCanvasForPositioningLayer
{
  v2 = [(CRLCanvasRep *)self layout];
  uint64_t v3 = [v2 geometryInRoot];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)updateFromLayout
{
  v9.receiver = self;
  v9.super_class = (Class)CRLGroupRep;
  [(CRLCanvasRep *)&v9 updateFromLayout];
  uint64_t v3 = [(CRLCanvasRep *)self canvas];
  unsigned int v4 = [v3 isCanvasInteractive];

  if (v4)
  {
    [(CRLCanvasRep *)self boundsForStandardKnobs];
    if (!CGRectEqualToRect(v10, self->_lastBoundsForStandardKnobs))
    {
      [(CRLCanvasRep *)self invalidateKnobPositions];
      [(CRLCanvasRep *)self boundsForStandardKnobs];
      self->_lastBoundsForStandardKnobs.origin.CGFloat x = v5;
      self->_lastBoundsForStandardKnobs.origin.CGFloat y = v6;
      self->_lastBoundsForStandardKnobs.size.CGFloat width = v7;
      self->_lastBoundsForStandardKnobs.size.CGFloat height = v8;
    }
  }
}

- (NSArray)allRepsContainedInGroup
{
  uint64_t v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unsigned int v4 = [(CRLCanvasRep *)self childReps];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CGRect v10 = [v9 allRepsContainedInGroup];
          [v3 addObjectsFromArray:v10];
        }
        else
        {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)createAdditionalBoardItemsForCopyImaging
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = [(CRLCanvasRep *)self childReps];
  id v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [(CRLCanvasRep *)self childReps];
    CGFloat v8 = [v7 firstObject];

    uint64_t v9 = objc_opt_class();
    long long v35 = v8;
    CGRect v10 = [v8 info];
    uint64_t v11 = sub_1002469D0(v9, v10);

    long long v12 = [(CRLCanvasRep *)self interactiveCanvasController];
    id v13 = objc_alloc((Class)NSSet);
    CGAffineTransform v34 = (void *)v11;
    uint64_t v46 = v11;
    long long v14 = +[NSArray arrayWithObjects:&v46 count:1];
    id v15 = [v13 initWithArray:v14];
    double v16 = [v12 topLevelZOrderedSiblingsOfInfos:v15];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v17 = v16;
    id v18 = [v17 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v41;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if ([v22 requiresAdditionalBoardItemsForCopyImaging])
          {
            CGFloat v23 = [(CRLCanvasRep *)self interactiveCanvasController];
            CGRect v24 = [v23 repForInfo:v22];

            CGRect v25 = [(CRLCanvasRep *)self childReps];
            unsigned int v26 = [v25 containsObject:v24];

            if (v26) {
              [v4 addObject:v24];
            }
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v19);
    }
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v27 = v4;
  id v28 = [v27 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v37;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(v27);
        }
        double v32 = [*(id *)(*((void *)&v36 + 1) + 8 * (void)j) createAdditionalBoardItemsForCopyImaging];
        [v3 addObjectsFromArray:v32];
      }
      id v29 = [v27 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v29);
  }

  return v3;
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)overlayRenderables
{
  v4.receiver = self;
  v4.super_class = (Class)CRLGroupRep;
  v2 = [(CRLCanvasRep *)&v4 overlayRenderables];

  return v2;
}

- (BOOL)isSelectedIgnoringLocking
{
  id v3 = [(CRLCanvasRep *)self layout];
  if ([v3 isSelectable])
  {
    objc_super v4 = [(CRLCanvasRep *)self canvas];
    unsigned int v5 = [v4 isCanvasInteractive];
  }
  else
  {
    unsigned int v5 = 0;
  }

  BOOL v6 = 0;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if (v5)
  {
    uint64_t v7 = [(CRLCanvasRep *)self interactiveCanvasController];
    CGFloat v8 = [v7 editorController];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000AD184;
    v10[3] = &unk_1014D1EF0;
    v10[4] = v8;
    v10[5] = self;
    v10[6] = &v11;
    [v8 enumerateEditorsOnStackUsingBlock:v10];

    BOOL v6 = *((unsigned char *)v12 + 24) != 0;
  }
  _Block_object_dispose(&v11, 8);
  return v6;
}

- (BOOL)shouldShowSelectionHighlight
{
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  objc_super v4 = [v3 editorController];
  unsigned int v5 = [v4 selectionPath];

  BOOL v6 = [v5 mostSpecificSelectionOfClass:objc_opt_class()];
  uint64_t v7 = [v3 topLevelContainerInfoForEditing];
  CGFloat v8 = [(CRLCanvasRep *)self info];
  id v15 = sub_100246AC8(v8, 1, v9, v10, v11, v12, v13, v14, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
  if (v7 == v15)
  {
  }
  else
  {
    double v16 = v15;
    if (!v6)
    {

LABEL_18:
      v27.receiver = self;
      v27.super_class = (Class)CRLGroupRep;
      BOOL v25 = [(CRLCanvasRep *)&v27 shouldShowSelectionHighlight];
      goto LABEL_19;
    }
    id v17 = [v6 boardItems];
    id v18 = [(CRLGroupRep *)self p_groupItem];
    unsigned int v19 = [v17 containsObject:v18];

    if (!v19) {
      goto LABEL_18;
    }
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v20 = [(CRLCanvasRep *)self childReps];
  id v21 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v29;
    while (2)
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v20);
        }
        if ([*(id *)(*((void *)&v28 + 1) + 8 * i) isInDynamicOperation])
        {
          BOOL v25 = 0;
          goto LABEL_16;
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }
  BOOL v25 = 1;
LABEL_16:

LABEL_19:
  return v25;
}

- (id)selectionHighlightColor
{
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  objc_super v4 = [v3 editorController];
  unsigned int v5 = [v4 selectionPath];
  BOOL v6 = [v5 mostSpecificSelectionOfClass:objc_opt_class()];

  uint64_t v7 = [(CRLCanvasRep *)self interactiveCanvasController];
  CGFloat v8 = [v7 topLevelContainerInfoForEditing];
  uint64_t v9 = (objc_class *)objc_opt_class();
  id v15 = sub_100246E2C(v8, v9, 1, v10, v11, v12, v13, v14, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);

  double v16 = [(CRLCanvasRep *)self info];
  if (v15 == v16)
  {
  }
  else
  {
    id v17 = v16;
    if (!v6)
    {

LABEL_10:
      v24.receiver = self;
      v24.super_class = (Class)CRLGroupRep;
      id v21 = [(CRLCanvasRep *)&v24 selectionHighlightColor];
      goto LABEL_11;
    }
    id v18 = [v6 boardItems];
    unsigned int v19 = [(CRLGroupRep *)self p_groupItem];
    unsigned int v20 = [v18 containsObject:v19];

    if (!v20) {
      goto LABEL_10;
    }
  }
  if (qword_1016A8F98 != -1) {
    dispatch_once(&qword_1016A8F98, &stru_1014D1F10);
  }
  id v21 = (id)qword_1016A8FA0;
LABEL_11:
  id v22 = v21;

  return v22;
}

- (BOOL)shouldShowCollaboratorCursorHighlight
{
  id v3 = [(CRLGroupRep *)self p_groupItem];
  if ([v3 isEffectivelyEmpty])
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CRLGroupRep;
    BOOL v4 = [(CRLCanvasRep *)&v6 shouldShowCollaboratorCursorHighlight];
  }

  return v4;
}

- (CGPoint)convertNaturalPointFromUnscaledCanvas:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v3 = [(CRLCanvasRep *)self layout];
  BOOL v4 = v3;
  if (v3) {
    [v3 transformInRoot];
  }
  else {
    memset(&v10, 0, sizeof(v10));
  }
  CGAffineTransformInvert(&v11, &v10);
  float64x2_t v9 = vaddq_f64(*(float64x2_t *)&v11.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v11.c, y), *(float64x2_t *)&v11.a, x));

  double v6 = v9.f64[1];
  double v5 = v9.f64[0];
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  uint64_t v22 = *(void *)&a3.x;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v5 = [(CRLCanvasRep *)self childReps];
  double v6 = [v5 reverseObjectEnumerator];

  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v28;
    float64x2_t v20 = (float64x2_t)vdupq_lane_s64(v22, 0);
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        CGAffineTransform v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v12 = [v11 layout:*(_OWORD *)&v20];
        uint64_t v13 = [v12 geometry];
        uint64_t v14 = v13;
        if (v13)
        {
          [v13 inverseTransform];
          float64x2_t v15 = v24;
          float64x2_t v16 = v25;
          float64x2_t v17 = v26;
        }
        else
        {
          float64x2_t v25 = 0u;
          float64x2_t v26 = 0u;
          float64x2_t v17 = 0uLL;
          float64x2_t v15 = 0uLL;
          float64x2_t v16 = 0uLL;
          float64x2_t v24 = 0u;
        }
        float64x2_t v23 = vaddq_f64(v17, vmlaq_f64(vmulq_n_f64(v16, y), v20, v15));

        if ([v11 containsPoint:v4 withPrecision:*(_OWORD *)&v23])
        {
          BOOL v18 = 1;
          goto LABEL_14;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (BOOL)containsPoint:(CGPoint)a3 withSlop:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  uint64_t v21 = *(void *)&a3.x;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v6 = [(CRLCanvasRep *)self childReps];
  id v7 = [v6 reverseObjectEnumerator];

  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v27;
    float64x2_t v19 = (float64x2_t)vdupq_lane_s64(v21, 0);
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v7);
        }
        CGAffineTransform v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v12 = [v11 layout:*(_OWORD *)&v19];
        uint64_t v13 = [v12 geometry];
        uint64_t v14 = v13;
        if (v13)
        {
          [v13 inverseTransform];
          float64x2_t v15 = v23;
          float64x2_t v16 = v24;
          float64x2_t v17 = v25;
        }
        else
        {
          float64x2_t v24 = 0u;
          float64x2_t v25 = 0u;
          float64x2_t v17 = 0uLL;
          float64x2_t v15 = 0uLL;
          float64x2_t v16 = 0uLL;
          float64x2_t v23 = 0u;
        }
        float64x2_t v22 = vaddq_f64(v17, vmlaq_f64(vmulq_n_f64(v16, y), v19, v15));

        if (objc_msgSend(v11, "containsPoint:withSlop:", *(_OWORD *)&v22, width, height))
        {
          LOBYTE(v8) = 1;
          goto LABEL_14;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return (char)v8;
}

- (BOOL)intersectsUnscaledRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(CRLCanvasRep *)self childReps];
  id v8 = [v7 reverseObjectEnumerator];

  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "intersectsUnscaledRect:", x, y, width, height))
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v9;
}

- (BOOL)i_shouldSmallHitRepTestingRecurse
{
  return 1;
}

- (void)processChangedProperty:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRLGroupRep;
  -[CRLCanvasRep processChangedProperty:](&v7, "processChangedProperty:");
  if (a3 == 11)
  {
    double v5 = [(CRLGroupRep *)self p_groupItem];
    if (([v5 isFreehandDrawing] & 1) == 0) {
      [(CRLCanvasRep *)self recursivelyPerformSelector:"invalidateKnobs"];
    }
  }
  double v6 = [(CRLCanvasRep *)self canvas];
  [v6 canvasInvalidatedForRep:self];
}

- (void)setNeedsDisplay
{
  v15.receiver = self;
  v15.super_class = (Class)CRLGroupRep;
  [(CRLCanvasRep *)&v15 setNeedsDisplay];
  id v3 = [(CRLCanvasRep *)self childReps];
  BOOL v4 = +[NSSet setWithArray:v3];

  if ([(CRLCanvasRep *)self drawsDescendantsIntoLayer])
  {
    uint64_t v5 = [(CRLCanvasRep *)self childrenToExcludeWhenDrawingDescendantsIntoLayer];

    BOOL v4 = (void *)v5;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setNeedsDisplay:v11];
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

- (BOOL)occludesSelectedRep
{
  return 0;
}

- (BOOL)canBeOccluded
{
  return 0;
}

- (BOOL)canOcclude
{
  return 0;
}

- (BOOL)containsUnknownContent
{
  v14.receiver = self;
  v14.super_class = (Class)CRLGroupRep;
  if ([(CRLCanvasRep *)&v14 containsUnknownContent])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    BOOL v4 = [(CRLCanvasRep *)self childReps];
    id v3 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v11;
      while (2)
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v4);
          }
          id v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) info];
          unsigned int v8 = [v7 isSupported];

          if (!v8)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        id v3 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return (char)v3;
}

- (void)dynamicOperationDidBeginWithRealTimeCommands:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CRLGroupRep;
  [(CRLCanvasRep *)&v3 dynamicOperationDidBeginWithRealTimeCommands:a3];
}

- (id)dynamicResizeDidBegin
{
  v15.receiver = self;
  v15.super_class = (Class)CRLGroupRep;
  objc_super v3 = [(CRLCanvasRep *)&v15 dynamicResizeDidBegin];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v4 = [(CRLGroupRep *)self p_groupedChildReps];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) dynamicResizeDidBegin];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)dynamicallyResizingWithTracker:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLGroupRep;
  [(CRLCanvasRep *)&v14 dynamicallyResizingWithTracker:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(CRLGroupRep *)self p_groupedChildReps];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) dynamicallyResizingWithTracker:v4];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(CRLGroupRep *)self p_groupedChildReps];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 applyNewBoundsToRep:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9)];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(CRLCanvasRep *)self recursivelyPerformSelector:"invalidateKnobs"];
  v10.receiver = self;
  v10.super_class = (Class)CRLGroupRep;
  [(CRLCanvasRep *)&v10 dynamicResizeDidEndWithTracker:v4];
}

- (BOOL)willHandleResizingLayoutForRep:(id)a3
{
  id v3 = a3;
  id v4 = [v3 layout];
  if ([v4 isInGroup])
  {
    id v5 = [v3 parentRep];
    unsigned __int8 v6 = [v5 isBeingResized];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLGroupRep;
  [(CRLCanvasRep *)&v14 dynamicFreeTransformDidBeginWithTracker:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(CRLGroupRep *)self p_groupedChildReps];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) dynamicFreeTransformDidBeginWithTracker:v4];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)dynamicallyFreeTransformingWithTracker:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLGroupRep;
  [(CRLCanvasRep *)&v14 dynamicallyFreeTransformingWithTracker:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(CRLGroupRep *)self p_groupedChildReps];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) dynamicallyFreeTransformingWithTracker:v4];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)dynamicFreeTransformDidEndWithTracker:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(CRLGroupRep *)self p_groupedChildReps];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 applyNewBoundsToRep:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9)];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(CRLCanvasRep *)self recursivelyPerformSelector:"invalidateKnobs"];
  v10.receiver = self;
  v10.super_class = (Class)CRLGroupRep;
  [(CRLCanvasRep *)&v10 dynamicFreeTransformDidEndWithTracker:v4];
}

- (BOOL)willHandleFreeTransformingLayoutForRep:(id)a3
{
  id v3 = a3;
  id v4 = [v3 layout];
  if ([v4 isInGroup])
  {
    id v5 = [v3 parentRep];
    unsigned __int8 v6 = [v5 isBeingFreeTransformed];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CRLCanvasRep *)self childReps];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) wantsToHandleTapsWhenLocked])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  -[CRLGroupRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:");
  -[CRLCanvasRep hitReps:withSlop:](self, "hitReps:withSlop:");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v13 wantsToHandleTapsOnBehalfOfRepForSelecting]
          && (objc_msgSend(v13, "handleSingleTapAtPoint:inputType:", a4, x, y) & 1) != 0)
        {

          BOOL v14 = 1;
          goto LABEL_12;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v16.receiver = self;
  v16.super_class = (Class)CRLGroupRep;
  BOOL v14 = -[CRLCanvasRep handleSingleTapAtPoint:inputType:](&v16, "handleSingleTapAtPoint:inputType:", a4, x, y);
LABEL_12:

  return v14;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  return -[CRLGroupRep p_handleSubselectionTapAtPoint:](self, "p_handleSubselectionTapAtPoint:", a4, a3.x, a3.y);
}

- (BOOL)handleMultipleTapAtPoint:(CGPoint)a3
{
  return -[CRLGroupRep p_handleSubselectionTapAtPoint:](self, "p_handleSubselectionTapAtPoint:", a3.x, a3.y);
}

- (BOOL)p_allowedToEditChildren
{
  return 1;
}

- (BOOL)p_handleSubselectionTapAtPoint:(CGPoint)a3
{
  id v3 = -[CRLGroupRep beginEditingChildrenIfAllowedAtUnscaledPoint:pickingDeepestChild:](self, "beginEditingChildrenIfAllowedAtUnscaledPoint:pickingDeepestChild:", 0, a3.x, a3.y);
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)i_handleDeepSubselectionTapAtPoint:(CGPoint)a3
{
  -[CRLGroupRep beginEditingChildrenIfAllowedAtUnscaledPoint:pickingDeepestChild:](self, "beginEditingChildrenIfAllowedAtUnscaledPoint:pickingDeepestChild:", 1, a3.x, a3.y);
  BOOL v4 = (CRLGroupRep *)objc_claimAutoreleasedReturnValue();
  if (!v4) {
    BOOL v4 = self;
  }

  return v4;
}

- (id)beginEditingChildrenIfAllowedAtUnscaledPoint:(CGPoint)a3 pickingDeepestChild:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  if ([(CRLGroupRep *)self p_allowedToEditChildren])
  {
    id v8 = [(CRLCanvasRep *)self canvas];
    id v9 = [(CRLCanvasRep *)self childRepsForHitTesting];
    +[CRLInteractiveCanvasController smallRepOutsetForHitTestingWithPrecision:0];
    uint64_t v11 = [v8 hitRep:0 withPrecision:v9 inTopLevelReps:0 smallRepOutset:0 unscaledPointTransformForRep:x y:y passingTest:v10];

    if (v11)
    {
      id v12 = v11;
      long long v13 = [(CRLCanvasRep *)self interactiveCanvasController];
      BOOL v14 = [v13 canvasEditor];

      objc_super v15 = [v14 editorController];
      if (v4)
      {
        objc_super v16 = [v12 i_repForSelectingIgnoringTopLevelEditing];
      }
      else
      {
        long long v17 = [(CRLCanvasRep *)self interactiveCanvasController];
        long long v18 = [v17 selectionModelTranslator];

        long long v19 = [(CRLGroupRep *)self p_groupItem];
        long long v20 = [v18 selectionPathForNothingSelectedInsideGroup:v19];
        [v15 setSelectionPath:v20];

        objc_super v16 = [v12 repForSelecting];

        id v12 = v18;
      }

      uint64_t v21 = objc_opt_class();
      float64x2_t v22 = [v16 info];
      float64x2_t v23 = sub_1002469D0(v21, v22);

      if (v23)
      {
        float64x2_t v24 = +[NSSet setWithObject:v23];
      }
      else
      {
        float64x2_t v24 = 0;
      }
      float64x2_t v25 = [v14 selectionPathWithInfos:v24];
      [v15 setSelectionPath:v25];

      if (v23) {
    }
      }
    else
    {
      objc_super v16 = 0;
    }
  }
  else
  {
    objc_super v16 = 0;
  }

  return v16;
}

- (void)updateChildrenFromLayout
{
  v2.receiver = self;
  v2.super_class = (Class)CRLGroupRep;
  [(CRLCanvasRep *)&v2 updateChildrenFromLayout];
}

- (id)p_groupedChildReps
{
  objc_super v2 = [(CRLCanvasRep *)self childReps];
  id v3 = +[NSOrderedSet orderedSetWithArray:v2];

  return v3;
}

- (id)repForAlternatePressureDragAtPoint:(CGPoint)a3
{
  return -[CRLGroupRep i_handleDeepSubselectionTapAtPoint:](self, "i_handleDeepSubselectionTapAtPoint:", a3.x, a3.y);
}

- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3
{
  return -[CRLGroupRep i_childRepsWantContextMenuWhenEditingDisabledAtPoint:onlyNonGrouped:](self, "i_childRepsWantContextMenuWhenEditingDisabledAtPoint:onlyNonGrouped:", 0, a3.x, a3.y);
}

- (BOOL)i_childRepsWantContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3 onlyNonGrouped:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v7 = [(CRLCanvasRep *)self childReps];
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!a4
          && !objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "wantsContextMenuWhenEditingDisabledAtPoint:", x, y))
        {
          BOOL v12 = 0;
          goto LABEL_12;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_12:

  return v12;
}

- (id)unscaledPathToIncludeForSystemPreviewOutline
{
  p_cache = CRLWPStorageAccessibility.cache;
  BOOL v4 = +[CRLBezierPath bezierPath];
  id v5 = (objc_class *)objc_opt_class();
  unsigned __int8 v6 = [(CRLCanvasRep *)self layout];
  long long v7 = sub_10024715C(v5, v6);

  id v8 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v9 = [v7 children];
  if ([v9 count])
  {
    uint64_t v10 = [(CRLGroupRep *)self p_groupItem];
    unsigned __int8 v11 = [v10 isEffectivelyEmpty];

    if ((v11 & 1) == 0)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      BOOL v12 = [v7 children];
      id v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v25;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            long long v17 = [v8 repForLayout:*(void *)(*((void *)&v24 + 1) + 8 * i)];
            long long v18 = v17;
            if (v17)
            {
              long long v19 = [v17 unscaledPathToIncludeForSystemPreviewOutline];
              [v4 appendBezierPath:v19];
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v14);
      }

      p_cache = (void **)(CRLWPStorageAccessibility + 16);
    }
    if (!v4) {
      goto LABEL_17;
    }
LABEL_16:
    if (![v4 isEmpty]) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  if (v4) {
    goto LABEL_16;
  }
LABEL_17:
  [(CRLCanvasRep *)self boundsForStandardKnobs];
  uint64_t v20 = [p_cache + 218 bezierPathWithRect:];

  BOOL v4 = (void *)v20;
LABEL_18:
  uint64_t v21 = [v4 arrayOfSubpathsWithEffectivelyEmptySubpathsRemoved:0];
  float64x2_t v22 = [p_cache + 218 uniteBezierPaths:v21];

  return v22;
}

@end