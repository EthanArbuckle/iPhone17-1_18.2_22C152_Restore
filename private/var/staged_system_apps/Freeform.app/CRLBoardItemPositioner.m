@interface CRLBoardItemPositioner
- (BOOL)avoidCollisions;
- (BOOL)clampToVisibleBounds;
- (BOOL)hasValidGeometries;
- (BOOL)p_hasAnyCollisionForIndividualInfos:(id)a3 currentTotalFrame:(CGRect)a4 currentTotalDelta:(CGPoint)a5;
- (BOOL)p_hasCanvasCollisionWithSpecificBoardItemFrame:(CGRect)a3 targetCenter:(CGPoint)a4 previouslyPositionedBoardItems:(id)a5;
- (BOOL)p_infos:(id)a3 collideWithRect:(CGRect)a4 orTargetCenter:(CGPoint)a5;
- (BOOL)shouldPreserveRelativePositions;
- (BOOL)useOriginalPositions;
- (CGPoint)pPinnedCenter:(CGPoint)a3 andSize:(CGSize)a4 toBounds:(CGRect)a5;
- (CGPoint)positionOffset;
- (CGPoint)targetCenter;
- (CGRect)boundsByFittingBoardItem:(id)a3;
- (CGRect)canvasBoundsOfBoardItem:(id)a3;
- (CGRect)i_boundsForPositioningBoardItem:(id)a3;
- (CRLBoardItemPositioner)initWithCanvasEditor:(id)a3;
- (CRLBoardItemPositioner)initWithCanvasEditor:(id)a3 targetCenter:(CGPoint)a4 validGeometries:(BOOL)a5;
- (CRLCanvasEditor)canvasEditor;
- (void)i_positionBoardItems:(id)a3 ignoreCanvasBackgroundAlignmentProvidedSnapping:(BOOL)a4;
- (void)pPositionNewBoardItems:(id)a3 ignoreCanvasBackgroundAlignmentProvidedSnapping:(BOOL)a4;
- (void)p_CenterBoardItem:(id)a3 withInitialFrame:(CGRect)a4 offsettingFromTargetCenter:(CGPoint)a5 previouslyPositionedBoardItems:(id)a6 ignoreCanvasBackgroundAlignmentProvidedSnapping:(BOOL)a7;
- (void)positionBoardItems:(id)a3;
- (void)positionBoardItems:(id)a3 ignoreCanvasBackgroundAlignmentProvidedSnapping:(BOOL)a4;
- (void)setAvoidCollisions:(BOOL)a3;
- (void)setClampToVisibleBounds:(BOOL)a3;
- (void)setShouldPreserveRelativePositions:(BOOL)a3;
@end

@implementation CRLBoardItemPositioner

- (CRLBoardItemPositioner)initWithCanvasEditor:(id)a3
{
  result = -[CRLBoardItemPositioner initWithCanvasEditor:targetCenter:validGeometries:](self, "initWithCanvasEditor:targetCenter:validGeometries:", a3, 1, CGPointZero.x, CGPointZero.y);
  if (result) {
    result->_useOriginalPositions = 1;
  }
  return result;
}

- (CRLBoardItemPositioner)initWithCanvasEditor:(id)a3 targetCenter:(CGPoint)a4 validGeometries:(BOOL)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLBoardItemPositioner;
  v10 = [(CRLBoardItemPositioner *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_canvasEditor, v9);
    v11->_targetCenter.CGFloat x = x;
    v11->_targetCenter.CGFloat y = y;
    v11->_validGeometries = a5;
    *(_WORD *)&v11->_useOriginalPositions = 256;
    v12 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
    boardItemsToCanvasBounds = v11->_boardItemsToCanvasBounds;
    v11->_boardItemsToCanvasBounds = v12;
  }
  return v11;
}

- (void)positionBoardItems:(id)a3
{
}

- (void)positionBoardItems:(id)a3 ignoreCanvasBackgroundAlignmentProvidedSnapping:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (self->_validGeometries) {
    [(CRLBoardItemPositioner *)self i_positionBoardItems:v6 ignoreCanvasBackgroundAlignmentProvidedSnapping:v4];
  }
  else {
    [(CRLBoardItemPositioner *)self pPositionNewBoardItems:v6 ignoreCanvasBackgroundAlignmentProvidedSnapping:v4];
  }
}

- (CGRect)i_boundsForPositioningBoardItem:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasEditor);
  BOOL v4 = [WeakRetained interactiveCanvasController];

  v5 = [v4 delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [v4 delegate];
    [v7 visibleUnscaledCanvasRectWithoutKeyboard];
    CGFloat x = v8;
    CGFloat y = v10;
    CGFloat width = v12;
    CGFloat height = v14;
  }
  else
  {
    CGFloat x = CGRectInfinite.origin.x;
    CGFloat y = CGRectInfinite.origin.y;
    CGFloat width = CGRectInfinite.size.width;
    CGFloat height = CGRectInfinite.size.height;
  }

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGPoint)positionOffset
{
  double v2 = 50.0;
  double v3 = 50.0;
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGRect)canvasBoundsOfBoardItem:(id)a3
{
  id v4 = a3;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x5012000000;
  v48 = sub_1001F76B8;
  v49 = nullsub_33;
  v50 = "";
  v5 = [(NSMapTable *)self->_boardItemsToCanvasBounds objectForKey:v4];
  char v6 = v5;
  if (!v5)
  {
    double v16 = [(CRLBoardItemPositioner *)self canvasEditor];
    double v17 = [v16 interactiveCanvasController];

    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    double v18 = [v17 canvas];
    double v19 = [v18 layoutController];
    v20 = [v19 layoutForInfo:v4];

    if (v20)
    {
      v21 = [v20 pureGeometryInRoot];
      [v21 frame];
      v22 = v46;
      v46[6] = v23;
      v22[7] = v24;
      v22[8] = v25;
      v22[9] = v26;

      *((unsigned char *)v42 + 24) = 1;
    }
    else if (!*((unsigned char *)v42 + 24))
    {
      v27 = [(CRLBoardItemPositioner *)self canvasEditor];
      v28 = [v27 selectionPathWithInfo:v4];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1001F76C8;
      v40[3] = &unk_1014E1808;
      v40[4] = &v45;
      v40[5] = &v41;
      [v17 withLayoutForSelectionPath:v28 performBlock:v40];

      if (!*((unsigned char *)v42 + 24))
      {
        [v4 visibleBoundsForPositioning];
        v35 = v46;
        v46[6] = v36;
        v35[7] = v37;
        v35[8] = v38;
        v35[9] = v39;
        goto LABEL_8;
      }
    }
    boardItemsToCanvasBounds = self->_boardItemsToCanvasBounds;
    v30 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", *((double *)v46 + 6), *((double *)v46 + 7), *((double *)v46 + 8), *((double *)v46 + 9));
    [(NSMapTable *)boardItemsToCanvasBounds setObject:v30 forKey:v4];

LABEL_8:
    _Block_object_dispose(&v41, 8);

    double v8 = *((double *)v46 + 6);
    double v10 = *((double *)v46 + 7);
    double v12 = *((double *)v46 + 8);
    double v14 = *((double *)v46 + 9);
    goto LABEL_9;
  }
  [v5 CGRectValue];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  objc_super v15 = (double *)v46;
  *((double *)v46 + 6) = v7;
  v15[7] = v9;
  v15[8] = v11;
  v15[9] = v13;
LABEL_9:

  _Block_object_dispose(&v45, 8);
  double v31 = v8;
  double v32 = v10;
  double v33 = v12;
  double v34 = v14;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (CGRect)boundsByFittingBoardItem:(id)a3
{
  [a3 visibleBoundsForPositioning];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (BOOL)hasValidGeometries
{
  return self->_validGeometries;
}

- (BOOL)p_infos:(id)a3 collideWithRect:(CGRect)a4 orTargetCenter:(CGPoint)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat x = a4.origin.x;
  CGFloat y = a4.origin.y;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v8 = a3;
  id v9 = [v8 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v45;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v8);
        }
        double v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v13 = objc_opt_class();
        double v14 = sub_1002469D0(v13, v12);
        if (v14)
        {
          [(CRLBoardItemPositioner *)self canvasBoundsOfBoardItem:v14];
          CGFloat v16 = v15;
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          CGFloat v22 = v21;
          double v23 = sub_100065738(x, y, width, height);
          double v25 = v24;
          double v26 = sub_100065738(v16, v18, v20, v22);
          double v28 = vabdd_f64(v25, v27);
          BOOL v29 = vabdd_f64(v23, v26) < 4.0 && v28 < 4.0;
          if (v29 || ((v30 = vabdd_f64(a5.y, v27), vabdd_f64(a5.x, v26) < 4.0) ? (BOOL v31 = v30 < 4.0) : (BOOL v31 = 0), v31))
          {
            double v32 = vabdd_f64(height, v22);
            if (vabdd_f64(width, v20) < 40.0 || v32 < 40.0) {
              goto LABEL_27;
            }
          }
          uint64_t v34 = objc_opt_class();
          v35 = sub_1002469D0(v34, v12);
          uint64_t v36 = v35;
          if (v35)
          {
            uint64_t v37 = [v35 allNestedChildrenItemsIncludingGroups];
            unsigned __int8 v38 = -[CRLBoardItemPositioner p_infos:collideWithRect:orTargetCenter:](self, "p_infos:collideWithRect:orTargetCenter:", v37, x, y, width, height, a5.x, a5.y);

            if (v38)
            {

LABEL_27:
              BOOL v39 = 1;
              goto LABEL_28;
            }
          }
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v39 = 0;
LABEL_28:

  return v39;
}

- (BOOL)p_hasCanvasCollisionWithSpecificBoardItemFrame:(CGRect)a3 targetCenter:(CGPoint)a4 previouslyPositionedBoardItems:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  double height = a3.size.height;
  double width = a3.size.width;
  double v9 = a3.origin.y;
  double v10 = a3.origin.x;
  id v12 = a5;
  if (self->_avoidCollisions)
  {
    uint64_t v13 = [(CRLBoardItemPositioner *)self canvasEditor];
    double v14 = [v13 interactiveCanvasController];

    if (!v14)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1828);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108A570();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1848);
      }
      double v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      CGFloat v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemPositioner p_hasCanvasCollisionWithSpecificBoardItemFrame:targetCenter:previouslyPositionedBoardItems:]");
      double v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItemPositioner.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 218, 0, "invalid nil value for '%{public}s'", "icc");
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasEditor);
    double v19 = [WeakRetained interactiveCanvasController];
    CGFloat v20 = [v19 infosToDisplay];
    [v20 crl_arrayByTransformingWithBlock:&stru_1014E1888];
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    if ([v12 count])
    {
      if (v21)
      {
        uint64_t v22 = [v12 arrayByAddingObjectsFromArray:v21];

        id v21 = (id)v22;
      }
      else
      {
        id v21 = v12;
      }
    }
    BOOL v23 = -[CRLBoardItemPositioner p_infos:collideWithRect:orTargetCenter:](self, "p_infos:collideWithRect:orTargetCenter:", v21, v10, v9, width, height, x, y);
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (CGPoint)pPinnedCenter:(CGPoint)a3 andSize:(CGSize)a4 toBounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat rect = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v49 = a4.width * 0.5;
  double v50 = a3.x;
  CGFloat v41 = a3.y;
  double v46 = a4.height;
  v52.origin.CGFloat x = sub_10006402C(a3.x, a3.y, a4.width);
  CGFloat v10 = v52.origin.x;
  CGFloat v11 = v52.origin.y;
  CGFloat v12 = v52.size.width;
  CGFloat v13 = v52.size.height;
  double MinX = CGRectGetMinX(v52);
  v53.origin.CGFloat x = x;
  v53.origin.CGFloat y = y;
  v53.size.CGFloat width = width;
  v53.size.CGFloat height = height;
  double v14 = CGRectGetMinX(v53);
  CGFloat v48 = v10;
  v54.origin.CGFloat x = v10;
  v54.origin.CGFloat y = v11;
  v54.size.CGFloat width = v12;
  v54.size.CGFloat height = v13;
  double MaxX = CGRectGetMaxX(v54);
  v55.origin.CGFloat x = x;
  v55.origin.CGFloat y = y;
  v55.size.CGFloat width = rect;
  v55.size.CGFloat height = height;
  double v16 = CGRectGetMaxX(v55);
  BOOL v17 = MinX >= v14 || MaxX <= v16;
  if (!v17)
  {
    v57.origin.CGFloat x = x;
    v57.origin.CGFloat y = y;
    v57.size.CGFloat width = rect;
    v57.size.CGFloat height = height;
    double MidX = CGRectGetMidX(v57);
LABEL_10:
    double v50 = MidX;
    goto LABEL_11;
  }
  if (MinX < v14)
  {
    v58.origin.CGFloat x = x;
    v58.origin.CGFloat y = y;
    v58.size.CGFloat width = rect;
    v58.size.CGFloat height = height;
    double MidX = v49 + CGRectGetMinX(v58);
    goto LABEL_10;
  }
  if (MaxX > v16)
  {
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = rect;
    v56.size.CGFloat height = height;
    double MidX = CGRectGetMaxX(v56) - v49;
    goto LABEL_10;
  }
LABEL_11:
  double v42 = v46 * 0.5;
  v59.origin.CGFloat x = v48;
  v59.origin.CGFloat y = v11;
  v59.size.CGFloat width = v12;
  v59.size.CGFloat height = v13;
  double MinY = CGRectGetMinY(v59);
  v60.origin.CGFloat x = x;
  v60.origin.CGFloat y = y;
  v60.size.CGFloat width = rect;
  v60.size.CGFloat height = height;
  double v45 = CGRectGetMinY(v60);
  v61.origin.CGFloat x = v48;
  v61.origin.CGFloat y = v11;
  v61.size.CGFloat width = v12;
  v61.size.CGFloat height = v13;
  double MaxY = CGRectGetMaxY(v61);
  v62.origin.CGFloat x = x;
  v62.origin.CGFloat y = y;
  v62.size.CGFloat width = rect;
  v62.size.CGFloat height = height;
  double v20 = CGRectGetMaxY(v62);
  CGFloat v21 = rect;
  if (MinY >= v45 || MaxY <= v20)
  {
    if (MinY < v45)
    {
      CGFloat v30 = x;
      CGFloat v31 = y;
      CGFloat v32 = height;
      double v26 = v42;
      double MidY = v42 + CGRectGetMinY(*(CGRect *)(&v21 - 2));
    }
    else
    {
      BOOL v17 = MaxY <= v20;
      double MidY = v41;
      double v26 = v42;
      if (!v17)
      {
        CGFloat v27 = x;
        CGFloat v28 = y;
        CGFloat v29 = height;
        double MidY = CGRectGetMaxY(*(CGRect *)(&v21 - 2)) - v42;
      }
    }
  }
  else
  {
    CGFloat v22 = x;
    CGFloat v23 = y;
    CGFloat v24 = height;
    double MidY = CGRectGetMidY(*(CGRect *)(&v21 - 2));
    double v26 = v42;
  }
  double v33 = [(CRLBoardItemPositioner *)self canvasEditor];
  uint64_t v34 = [v33 interactiveCanvasController];
  v35 = [v34 canvas];
  unsigned int v36 = [v35 isAnchoredAtRight];

  if (v50 - v49 >= 0.0) {
    int v37 = 1;
  }
  else {
    int v37 = v36;
  }
  if (v37) {
    double v38 = v50;
  }
  else {
    double v38 = v49;
  }
  double v39 = -v49;
  if (v49 + v50 <= 0.0) {
    double v39 = v50;
  }
  if (v36) {
    double v38 = v39;
  }
  if (MidY - v26 >= 0.0) {
    double v40 = MidY;
  }
  else {
    double v40 = v26;
  }
  result.CGFloat y = v40;
  result.CGFloat x = v38;
  return result;
}

- (void)p_CenterBoardItem:(id)a3 withInitialFrame:(CGRect)a4 offsettingFromTargetCenter:(CGPoint)a5 previouslyPositionedBoardItems:(id)a6 ignoreCanvasBackgroundAlignmentProvidedSnapping:(BOOL)a7
{
  double y = a5.y;
  double x = a5.x;
  CGFloat height = a4.size.height;
  double width = a4.size.width;
  CGFloat v66 = a4.origin.x;
  CGFloat v67 = a4.origin.y;
  id v14 = a3;
  id v15 = a6;
  [(CRLBoardItemPositioner *)self i_boundsForPositioningBoardItem:v14];
  double v68 = v16;
  double v69 = v17;
  double v19 = v18;
  double v21 = v20;
  CGFloat v64 = width;
  CGFloat v65 = height;
  double v22 = sub_10006402C(x, y, width);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  if (!a7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasEditor);
    CGFloat v30 = [WeakRetained interactiveCanvasController];
    unsigned int v31 = [v30 isCanvasBackgroundAlignmentSnappingEnabled];

    if (v31)
    {
      id v32 = objc_loadWeakRetained((id *)&self->_canvasEditor);
      double v33 = [v32 interactiveCanvasController];
      uint64_t v34 = [v33 canvasBackground];

      v35 = [v34 alignmentProvider];
      unsigned int v36 = v35;
      if (v35)
      {
        [v35 originPointForAlignedInsertingRect:v22, v24, v26, v28];
        double v22 = v37;
        double v24 = v38;
      }
    }
  }
  for (i = 0;
        -[CRLBoardItemPositioner p_hasCanvasCollisionWithSpecificBoardItemFrame:targetCenter:previouslyPositionedBoardItems:](self, "p_hasCanvasCollisionWithSpecificBoardItemFrame:targetCenter:previouslyPositionedBoardItems:", i, v22, v24, v26, v28, x, y);
        i = v44)
  {
    [(CRLBoardItemPositioner *)self positionOffset];
    double v22 = sub_100064698(v22, v24, v40);
    double v24 = v41;
    [(CRLBoardItemPositioner *)self positionOffset];
    double x = sub_100064698(x, y, v42);
    double y = v43;
    if (self->_clampToVisibleBounds && !sub_100064278(v19, v21, v68, v69, v22, v24, v26, v28))
    {
      double v48 = sub_100065738(v22, v24, v26, v28);
      -[CRLBoardItemPositioner pPinnedCenter:andSize:toBounds:](self, "pPinnedCenter:andSize:toBounds:");
      double v47 = v48;
      goto LABEL_15;
    }
    id v44 = v15;
  }
  if (self->_clampToVisibleBounds && !sub_100064278(v19, v21, v68, v69, v22, v24, v26, v28))
  {
    double v63 = sub_100065738(v22, v24, v26, v28);
    -[CRLBoardItemPositioner pPinnedCenter:andSize:toBounds:](self, "pPinnedCenter:andSize:toBounds:");
    double v47 = v63;
LABEL_15:
    double v49 = sub_100064680(v45, v46, v47);
    double v22 = sub_100064698(v22, v24, v49);
    double v24 = v50;
  }
  id v51 = objc_loadWeakRetained((id *)&self->_canvasEditor);
  CGRect v52 = [v51 interactiveCanvasController];
  CGRect v53 = [v52 commandController];
  CGRect v54 = [v53 board];

  if (!v54)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E18A8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108A60C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E18C8);
    }
    CGRect v55 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    CGRect v56 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemPositioner p_CenterBoardItem:withInitialFrame:offsettingFromTargetCenter:previouslyPositionedBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:]");
    CGRect v57 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItemPositioner.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v56, v57, 325, 0, "invalid nil value for '%{public}s'", "board");
  }
  if (!self->_useOriginalPositions
    || (double v58 = sub_100065738(v22, v24, v26, v28),
        double v60 = v59,
        double v61 = sub_100065738(v66, v67, v64, v65),
        !sub_100064084(v58, v60, v61, v62)))
  {
    [v14 crl_onBoard:v54 moveItemToPosition:v22 size:v24];
  }
}

- (BOOL)p_hasAnyCollisionForIndividualInfos:(id)a3 currentTotalFrame:(CGRect)a4 currentTotalDelta:(CGPoint)a5
{
  double x = a5.x;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat v8 = a4.origin.x;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = a3;
  id v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v32;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v15 = objc_opt_class();
        double v16 = sub_1002469D0(v15, v14);
        if (v16)
        {
          [(CRLBoardItemPositioner *)self boundsByFittingBoardItem:v16];
          double v18 = v17;
          double v20 = v19;
          double v23 = sub_100064698(v21, v22, x);
          double v25 = v24;
          double v26 = sub_100065738(v8, y, width, height);
          if (-[CRLBoardItemPositioner p_hasCanvasCollisionWithSpecificBoardItemFrame:targetCenter:previouslyPositionedBoardItems:](self, "p_hasCanvasCollisionWithSpecificBoardItemFrame:targetCenter:previouslyPositionedBoardItems:", 0, v23, v25, v18, v20, v26, v27))
          {

            BOOL v28 = 1;
            goto LABEL_12;
          }
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v28 = 0;
LABEL_12:

  return v28;
}

- (void)i_positionBoardItems:(id)a3 ignoreCanvasBackgroundAlignmentProvidedSnapping:(BOOL)a4
{
  BOOL v97 = a4;
  v106 = 0;
  v107 = 0;
  v108 = 0;
  id v96 = a3;
  sub_1001F930C(&v106, (unint64_t)[v96 count]);
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  double v7 = CGPointZero.x;
  double v8 = CGPointZero.y;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id obj = v96;
  int v9 = 0;
  id v10 = [obj countByEnumeratingWithState:&v102 objects:v110 count:16];
  if (v10)
  {
    int v11 = 0;
    uint64_t v12 = *(void *)v103;
    do
    {
      CGFloat v13 = 0;
      int v98 = v11 + v10;
      do
      {
        if (*(void *)v103 != v12) {
          objc_enumerationMutation(obj);
        }
        CGFloat v14 = x;
        uint64_t v15 = *(void **)(*((void *)&v102 + 1) + 8 * (void)v13);
        [(CRLBoardItemPositioner *)self boundsByFittingBoardItem:v15];
        double v17 = v16;
        double v19 = v18;
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        id v24 = v15;
        id v25 = v24;
        double v26 = v107;
        if (v107 >= v108)
        {
          BOOL v28 = v106;
          unint64_t v29 = 0xCCCCCCCCCCCCCCCDLL * ((v107 - v106) >> 3);
          unint64_t v30 = v29 + 1;
          if (v29 + 1 > 0x666666666666666) {
            sub_100004E40();
          }
          if (0x999999999999999ALL * ((v108 - v106) >> 3) > v30) {
            unint64_t v30 = 0x999999999999999ALL * ((v108 - v106) >> 3);
          }
          if (0xCCCCCCCCCCCCCCCDLL * ((v108 - v106) >> 3) >= 0x333333333333333) {
            unint64_t v31 = 0x666666666666666;
          }
          else {
            unint64_t v31 = v30;
          }
          v111[4] = &v108;
          if (v31)
          {
            long long v32 = (char *)sub_10015F68C((uint64_t)&v108, v31);
            BOOL v28 = v106;
            double v26 = v107;
          }
          else
          {
            long long v32 = 0;
          }
          long long v33 = &v32[40 * v29];
          *(void *)long long v33 = v25;
          *((double *)v33 + 1) = v17;
          *((double *)v33 + 2) = v19;
          *((CGFloat *)v33 + 3) = v21;
          *((CGFloat *)v33 + 4) = v23;
          long long v34 = v33;
          if (v26 != v28)
          {
            v35 = v26;
            do
            {
              uint64_t v36 = *((void *)v35 - 5);
              v35 -= 40;
              *(void *)v35 = 0;
              *((void *)v34 - 5) = v36;
              v34 -= 40;
              long long v37 = *(_OWORD *)(v35 + 8);
              *(_OWORD *)(v34 + 24) = *(_OWORD *)(v35 + 24);
              *(_OWORD *)(v34 + 8) = v37;
            }
            while (v35 != v28);
          }
          double v27 = v33 + 40;
          v106 = v34;
          v107 = v33 + 40;
          double v38 = v108;
          v108 = &v32[40 * v31];
          v111[2] = v26;
          v111[3] = v38;
          v111[0] = v28;
          v111[1] = v28;
          sub_1001F993C((uint64_t)v111);
        }
        else
        {
          *(void *)v107 = v24;
          *((double *)v26 + 1) = v17;
          *((double *)v26 + 2) = v19;
          double v27 = v26 + 40;
          *((CGFloat *)v26 + 3) = v21;
          *((CGFloat *)v26 + 4) = v23;
        }
        v107 = v27;
        if (v19 < v8) {
          double v39 = v17;
        }
        else {
          double v39 = v7;
        }
        if (v19 < v8) {
          double v40 = v19;
        }
        else {
          double v40 = v8;
        }
        if (v19 < v8) {
          int v41 = v11;
        }
        else {
          int v41 = v9;
        }
        if (v17 >= v7)
        {
          double v39 = v7;
          double v40 = v8;
          int v41 = v9;
        }
        if (v11) {
          double v7 = v39;
        }
        else {
          double v7 = v17;
        }
        if (v11) {
          double v8 = v40;
        }
        else {
          double v8 = v19;
        }
        if (v11) {
          int v9 = v41;
        }
        else {
          int v9 = 0;
        }
        v112.origin.CGFloat x = v17;
        v112.origin.CGFloat y = v19;
        v112.size.CGFloat width = v21;
        v112.size.CGFloat height = v23;
        v114.origin.CGFloat x = v14;
        v114.origin.CGFloat y = y;
        v114.size.CGFloat width = width;
        v114.size.CGFloat height = height;
        CGRect v113 = CGRectUnion(v112, v114);
        CGFloat width = v113.size.width;
        CGFloat height = v113.size.height;
        CGFloat x = v113.origin.x;
        CGFloat y = v113.origin.y;
        ++v11;
        CGFloat v13 = (char *)v13 + 1;
      }
      while (v13 != v10);
      id v10 = [obj countByEnumeratingWithState:&v102 objects:v110 count:16];
      int v11 = v98;
    }
    while (v10);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasEditor);
  double v43 = [WeakRetained interactiveCanvasController];
  id v44 = [v43 canvasBackground];

  double v45 = [v44 alignmentProvider];
  if (self->_useOriginalPositions)
  {
    double v47 = CGPointZero.x;
    double v46 = CGPointZero.y;
  }
  else
  {
    double v48 = self->_targetCenter.x;
    double v49 = self->_targetCenter.y;
    double v50 = sub_100065738(x, y, width, height);
    double v47 = sub_100064680(v48, v49, v50);
    double v46 = v51;
    double v52 = sub_100064698(x, y, v47);
    double v54 = v53;
    if (!v97)
    {
      id v55 = objc_loadWeakRetained((id *)&self->_canvasEditor);
      CGRect v56 = [v55 interactiveCanvasController];
      unsigned int v57 = [v56 isCanvasBackgroundAlignmentSnappingEnabled];
      unsigned int v58 = v45 ? v57 : 0;

      if (v58)
      {
        [v45 originPointForAlignedInsertingRect:v52, v54, width, height];
        double v52 = v59;
        double v54 = v60;
      }
    }
    if ([(CRLBoardItemPositioner *)self shouldPreserveRelativePositions])
    {
      while (-[CRLBoardItemPositioner p_hasAnyCollisionForIndividualInfos:currentTotalFrame:currentTotalDelta:](self, "p_hasAnyCollisionForIndividualInfos:currentTotalFrame:currentTotalDelta:", obj, v52, v54, width, height, v47, v46))
      {
        [(CRLBoardItemPositioner *)self positionOffset];
        double v62 = v61;
        if (v45)
        {
          id v63 = objc_loadWeakRetained((id *)&self->_canvasEditor);
          CGFloat v64 = [v63 interactiveCanvasController];
          [v64 viewScale];
          [v45 snapDistanceForViewScale:];
          double v66 = v65;

          if (v62 <= v66) {
            double v62 = v66;
          }
        }
        double v47 = sub_100064698(v47, v46, v62);
        double v46 = v67;
        double v52 = sub_100064698(v52, v54, v62);
        double v54 = v68;
      }
    }
  }
  if ([(CRLBoardItemPositioner *)self shouldPreserveRelativePositions])
  {
    id v69 = objc_loadWeakRetained((id *)&self->_canvasEditor);
    v70 = [v69 interactiveCanvasController];
    v71 = [v70 commandController];
    id v72 = [v71 board];

    if (!v72)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E18E8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108A6A8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1908);
      }
      v73 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v73, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      v74 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemPositioner i_positionBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:]");
      v75 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItemPositioner.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v74, v75, 409, 0, "invalid nil value for '%{public}s'", "board");
    }
    if (!v97)
    {
      id v76 = objc_loadWeakRetained((id *)&self->_canvasEditor);
      v77 = [v76 interactiveCanvasController];
      unsigned int v78 = [v77 isCanvasBackgroundAlignmentSnappingEnabled];
      if (v45) {
        unsigned int v79 = v78;
      }
      else {
        unsigned int v79 = 0;
      }

      if (v79)
      {
        v80 = &v106[40 * v9];
        double v81 = *((double *)v80 + 1);
        [v45 originPointForAlignedInsertingRect:sub_100064698(v81, *((double *)v80 + 2), v47)];
        double v47 = sub_100064680(v82, v83, v81);
      }
    }
    v84 = v106;
    v85 = v107;
    while (v84 != v85)
    {
      id v86 = *(id *)v84;
      [v86 crl_onBoard:v72 moveItemToPosition:sub_100064698(*((double *)v84 + 1), *((double *)v84 + 2), v47)];

      v84 += 40;
    }
  }
  else
  {
    if ((unint64_t)[obj count] < 2) {
      id v72 = 0;
    }
    else {
      id v72 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(obj, "count"));
    }
    v87 = v106;
    v88 = v107;
    if (v106 != v107)
    {
      double v89 = v47;
      do
      {
        CGFloat v90 = *((double *)v87 + 1);
        CGFloat v91 = *((double *)v87 + 2);
        CGFloat v92 = *((double *)v87 + 3);
        CGFloat v93 = *((double *)v87 + 4);
        double v94 = sub_100065738(v90, v91, v92, v93);
        -[CRLBoardItemPositioner p_CenterBoardItem:withInitialFrame:offsettingFromTargetCenter:previouslyPositionedBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:](self, "p_CenterBoardItem:withInitialFrame:offsettingFromTargetCenter:previouslyPositionedBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:", *(void *)v87, v72, v97, v90, v91, v92, v93, v89 + v94, v46 + v95);
        [v72 addObject:*(void *)v87];
        v87 += 40;
      }
      while (v87 != v88);
    }
  }

  v109 = &v106;
  sub_1001F98BC((void ***)&v109);
}

- (void)pPositionNewBoardItems:(id)a3 ignoreCanvasBackgroundAlignmentProvidedSnapping:(BOOL)a4
{
  BOOL v4 = a4;
  double v49 = 0;
  double v50 = 0;
  double v51 = 0;
  id v44 = a3;
  sub_1001F930C((char **)&v49, (unint64_t)[v44 count]);
  BOOL v43 = v4;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = v44;
  id v7 = [v6 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v46;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v46 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        [(CRLBoardItemPositioner *)self boundsByFittingBoardItem:v10];
        uint64_t v12 = v11;
        uint64_t v14 = v13;
        uint64_t v16 = v15;
        uint64_t v18 = v17;
        id v19 = v10;
        id v20 = v19;
        CGFloat v21 = v50;
        if (v50 >= (char *)v51)
        {
          CGFloat v23 = v49;
          unint64_t v24 = 0xCCCCCCCCCCCCCCCDLL * ((v50 - (char *)v49) >> 3);
          unint64_t v25 = v24 + 1;
          if (v24 + 1 > 0x666666666666666) {
            sub_100004E40();
          }
          if (0x999999999999999ALL * (v51 - v49) > v25) {
            unint64_t v25 = 0x999999999999999ALL * (v51 - v49);
          }
          if (0xCCCCCCCCCCCCCCCDLL * (v51 - v49) >= 0x333333333333333) {
            unint64_t v26 = 0x666666666666666;
          }
          else {
            unint64_t v26 = v25;
          }
          v52[4] = (void **)&v51;
          if (v26)
          {
            double v27 = (char *)sub_10015F68C((uint64_t)&v51, v26);
            CGFloat v23 = v49;
            CGFloat v21 = v50;
          }
          else
          {
            double v27 = 0;
          }
          BOOL v28 = &v27[40 * v24];
          *(void *)BOOL v28 = v20;
          *((void *)v28 + 1) = v12;
          *((void *)v28 + 2) = v14;
          *((void *)v28 + 3) = v16;
          *((void *)v28 + 4) = v18;
          unint64_t v29 = v28;
          if (v21 != (char *)v23)
          {
            unint64_t v30 = v21;
            do
            {
              uint64_t v31 = *((void *)v30 - 5);
              v30 -= 40;
              *(void *)unint64_t v30 = 0;
              *((void *)v29 - 5) = v31;
              v29 -= 40;
              long long v32 = *(_OWORD *)(v30 + 8);
              *(_OWORD *)(v29 + 24) = *(_OWORD *)(v30 + 24);
              *(_OWORD *)(v29 + 8) = v32;
            }
            while (v30 != (char *)v23);
          }
          double v22 = v28 + 40;
          double v49 = (void **)v29;
          double v50 = v28 + 40;
          long long v33 = v51;
          double v51 = (void **)&v27[40 * v26];
          v52[0] = v23;
          v52[2] = (void **)v21;
          v52[3] = v33;
          v52[1] = v23;
          sub_1001F993C((uint64_t)v52);
        }
        else
        {
          *(void *)double v50 = v19;
          *((void *)v21 + 1) = v12;
          *((void *)v21 + 2) = v14;
          double v22 = v21 + 40;
          *((void *)v21 + 3) = v16;
          *((void *)v21 + 4) = v18;
        }
        double v50 = v22;
      }
      id v7 = [v6 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v7);
  }

  double x = self->_targetCenter.x;
  double y = self->_targetCenter.y;
  if ((unint64_t)[v6 count] < 2) {
    id v36 = 0;
  }
  else {
    id v36 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  }
  long long v37 = (char *)v49;
  double v38 = v50;
  while (v37 != v38)
  {
    -[CRLBoardItemPositioner p_CenterBoardItem:withInitialFrame:offsettingFromTargetCenter:previouslyPositionedBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:](self, "p_CenterBoardItem:withInitialFrame:offsettingFromTargetCenter:previouslyPositionedBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:", *(void *)v37, v36, v43, *((double *)v37 + 1), *((double *)v37 + 2), *((double *)v37 + 3), *((double *)v37 + 4), x, y);
    [(CRLBoardItemPositioner *)self positionOffset];
    double v40 = v39;
    double v42 = v41;
    [v36 addObject:*(void *)v37];
    double y = y + v42;
    double x = x + v40;
    v37 += 40;
  }

  v52[0] = (void **)&v49;
  sub_1001F98BC(v52);
}

- (BOOL)shouldPreserveRelativePositions
{
  return self->_shouldPreserveRelativePositions;
}

- (void)setShouldPreserveRelativePositions:(BOOL)a3
{
  self->_shouldPreserveRelativePositions = a3;
}

- (BOOL)avoidCollisions
{
  return self->_avoidCollisions;
}

- (void)setAvoidCollisions:(BOOL)a3
{
  self->_avoidCollisions = a3;
}

- (CRLCanvasEditor)canvasEditor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasEditor);

  return (CRLCanvasEditor *)WeakRetained;
}

- (CGPoint)targetCenter
{
  double x = self->_targetCenter.x;
  double y = self->_targetCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)useOriginalPositions
{
  return self->_useOriginalPositions;
}

- (BOOL)clampToVisibleBounds
{
  return self->_clampToVisibleBounds;
}

- (void)setClampToVisibleBounds:(BOOL)a3
{
  self->_clampToVisibleBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boardItemsToCanvasBounds, 0);

  objc_destroyWeak((id *)&self->_canvasEditor);
}

@end