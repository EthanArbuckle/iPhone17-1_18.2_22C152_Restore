@interface CRLKeyboardMovementManipulator
- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3;
- (BOOL)readyToEndOperation;
- (CRLCanvasLayoutManipulatingTracker)tracker;
- (CRLInteractiveCanvasController)i_ICC;
- (CRLKeyboardMovementManipulator)initWithInteractiveCanvasController:(id)a3;
- (double)p_movementFactorInPixelSpace:(int64_t)a3;
- (void)duplicateSelectionMovingByDelta:(CGPoint)a3;
- (void)moveSelectionByDelta:(CGPoint)a3;
- (void)operationDidEnd;
@end

@implementation CRLKeyboardMovementManipulator

- (CRLKeyboardMovementManipulator)initWithInteractiveCanvasController:(id)a3
{
  v4 = (CRLInteractiveCanvasController *)a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLKeyboardMovementManipulator;
  v5 = [(CRLKeyboardMovementManipulator *)&v9 init];
  v6 = v5;
  if (v5)
  {
    mTracker = v5->mTracker;
    v5->mICC = v4;
    v5->mTracker = 0;
  }
  return v6;
}

- (double)p_movementFactorInPixelSpace:(int64_t)a3
{
  double v3 = (double)a3;
  [(CRLInteractiveCanvasController *)self->mICC viewScale];
  return v3 / v4;
}

- (void)moveSelectionByDelta:(CGPoint)a3
{
  double v4 = +[NSMutableSet set];
  v5 = [(CRLInteractiveCanvasController *)self->mICC selectionModelTranslator];
  v6 = [(CRLInteractiveCanvasController *)self->mICC editorController];
  v7 = [v6 selectionPath];
  v8 = [v5 unlockedBoardItemsForSelectionPath:v7];

  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v13 = v8;
  id v14 = [v13 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v58;
    do
    {
      v17 = 0;
      do
      {
        if (*(void *)v58 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [(CRLInteractiveCanvasController *)self->mICC repForInfo:*(void *)(*((void *)&v57 + 1) + 8 * (void)v17)];
        v19 = [v18 layout];
        if ([v19 isDraggable])
        {
          unsigned __int8 v20 = [(CRLInteractiveCanvasController *)self->mICC isInDynamicOperation];

          if ((v20 & 1) == 0)
          {
            id v21 = [v4 count];
            v22 = [v18 layout];
            v23 = [v22 geometryInRoot];
            [v23 frame];
            CGFloat v25 = v24;
            CGFloat v27 = v26;
            CGFloat v29 = v28;
            CGFloat v31 = v30;
            if (v21)
            {
              v62.origin.CGFloat x = x;
              v62.origin.CGFloat y = y;
              v62.size.CGFloat width = width;
              v62.size.CGFloat height = height;
              v64.origin.CGFloat x = v25;
              v64.origin.CGFloat y = v27;
              v64.size.CGFloat width = v29;
              v64.size.CGFloat height = v31;
              CGRect v63 = CGRectUnion(v62, v64);
              CGFloat v25 = v63.origin.x;
              CGFloat v27 = v63.origin.y;
              CGFloat v29 = v63.size.width;
              CGFloat v31 = v63.size.height;
            }

            [v4 addObject:v18];
            CGFloat height = v31;
            CGFloat width = v29;
            CGFloat y = v27;
            CGFloat x = v25;
          }
        }
        else
        {
        }
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v15);
  }

  if ([v4 count])
  {
    v32 = [CRLCanvasRepDragTracker alloc];
    v33 = [v4 anyObject];
    v34 = [(CRLCanvasRepDragTracker *)v32 initWithRep:v33];
    mTracker = self->mTracker;
    self->mTracker = v34;

    [(CRLCanvasRepDragTracker *)self->mTracker setShowDragHUD:0];
    [(CRLCanvasRepDragTracker *)self->mTracker setShouldSnapToGuides:0];
    [(CRLCanvasRepDragTracker *)self->mTracker setIsArrowkeyDrivenTracking:1];
    v36 = [(CRLInteractiveCanvasController *)self->mICC tmCoordinator];
    [v36 registerTrackerManipulator:self];
    [v36 takeControlWithTrackerManipulator:self];
    v37 = [(CRLInteractiveCanvasController *)self->mICC dynamicOperationController];
    -[CRLCanvasRepDragTracker addUnscaledDragDelta:roundDeltaToViewScale:](self->mTracker, "addUnscaledDragDelta:roundDeltaToViewScale:", 0, a3.x, a3.y);
    double v38 = sub_100065738(x, y, width, height);
    double v40 = v39;
    -[CRLInteractiveCanvasController convertUnscaledToBoundsPoint:](self->mICC, "convertUnscaledToBoundsPoint:");
    double v42 = v41;
    double v44 = v43;
    -[CRLCanvasRepDragTracker setLogicalDragPoint:](self->mTracker, "setLogicalDragPoint:");
    -[CRLCanvasRepDragTracker setActualDragPoint:](self->mTracker, "setActualDragPoint:", v42, v44);
    [v37 beginOperation];
    v45 = [(CRLInteractiveCanvasController *)self->mICC commandController];
    v46 = [CRLCanvasCommandSelectionBehavior alloc];
    v47 = [(CRLInteractiveCanvasController *)self->mICC canvasEditor];
    v48 = [(CRLInteractiveCanvasController *)self->mICC editorController];
    v49 = [v48 selectionPath];
    v50 = [(CRLCanvasCommandSelectionBehavior *)v46 initWithCanvasEditor:v47 type:2 selectionPath:v49 selectionFlags:4];

    [v45 openGroupWithSelectionBehavior:v50];
    [v37 startTransformingReps:v4];
    [(CRLInteractiveCanvasController *)self->mICC convertUnscaledToBoundsPoint:sub_100064698(v38, v40, a3.x)];
    double v52 = v51;
    double v54 = v53;
    -[CRLCanvasRepDragTracker setLogicalDragPoint:](self->mTracker, "setLogicalDragPoint:");
    -[CRLCanvasRepDragTracker setActualDragPoint:](self->mTracker, "setActualDragPoint:", v52, v54);
    [v37 handleTrackerManipulator:self];
    [v45 closeGroup];
    v55 = self->mTracker;
    self->mTracker = 0;
  }
}

- (void)duplicateSelectionMovingByDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(CRLInteractiveCanvasController *)self->mICC selectionModelTranslator];
  v7 = [(CRLInteractiveCanvasController *)self->mICC editorController];
  v8 = [v7 selectionPath];
  objc_super v9 = [v6 unlockedBoardItemsForSelectionPath:v8];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v49 objects:v53 count:16];
  v12 = v10;
  if (!v11) {
    goto LABEL_25;
  }
  id v13 = v11;
  uint64_t v14 = 0;
  uint64_t v15 = *(void *)v50;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v50 != v15) {
        objc_enumerationMutation(v10);
      }
      v17 = [(CRLInteractiveCanvasController *)self->mICC repForInfo:*(void *)(*((void *)&v49 + 1) + 8 * i)];
      v18 = [v17 layout];
      unsigned int v19 = [v18 isDraggable];

      v14 += v19;
    }
    id v13 = [v10 countByEnumeratingWithState:&v49 objects:v53 count:16];
  }
  while (v13);

  if (v14)
  {
    v12 = [(CRLInteractiveCanvasController *)self->mICC canvasEditor];
    unsigned __int8 v20 = [(CRLInteractiveCanvasController *)self->mICC commandController];
    [v20 openGroup];
    [v20 enableProgressiveEnqueuingInCurrentGroup];
    id v21 = +[NSBundle mainBundle];
    v22 = [v21 localizedStringForKey:@"Duplicate" value:0 table:@"UndoStrings"];
    v47 = v20;
    [v20 setCurrentGroupActionString:v22];

    v23 = +[CRLPasteboard pasteboardWithName:@"com.apple.freeform.Canvas.CRLCanvasRepNoPositionOffsetPasteboardName" create:1];
    double v24 = [(CRLInteractiveCanvasController *)self->mICC editorController];
    CGFloat v25 = [v24 editorForEditAction:"copy:" withSender:0];
    v48 = v25;
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      int v26 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EBE70);
      }
      CGFloat v27 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109B894(v27, (uint64_t)v25, v26);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EBE90);
      }
      double v28 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v28, v26);
      }
      CGFloat v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLKeyboardMovementManipulator duplicateSelectionMovingByDelta:]");
      double v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLKeyboardMovementManipulator.m"];
      CGFloat v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 143, 0, "Editor (%{public}@) responds to copy: but not copyForKeyboardMovementDuplicationToPasteboard:. Falling back to canvas editor.", v32);

      CGFloat v25 = v12;
    }
    [v25 copyForKeyboardMovementDuplicationToPasteboard:v23];
    v33 = [v24 selectionPath];
    uint64_t v34 = [v33 mostSpecificSelectionOfClass:objc_opt_class()];
    if (v34)
    {
      v35 = (void *)v34;
      id v36 = [v33 indexForSelection:v34];
      v37 = (objc_class *)objc_opt_class();
      v46 = v24;
      [v24 currentEditors];
      v39 = double v38 = v23;
      double v40 = [v39 objectAtIndexedSubscript:v36];
      double v41 = sub_10024715C(v37, v40);

      v23 = v38;
      if ([v41 canPasteWithPasteboard:v38])
      {
        double v42 = [v41 pasteNativeInfosFromPasteboard:v38];

        double v24 = v46;
LABEL_24:
        double v43 = +[NSSet setWithArray:v42];
        double v44 = [v12 selectionPathWithInfos:v43];
        [v24 setSelectionPath:v44];

        [(CRLInteractiveCanvasController *)self->mICC layoutIfNeeded];
        -[CRLKeyboardMovementManipulator moveSelectionByDelta:](self, "moveSelectionByDelta:", x, y);
        [v47 closeGroup];
        mTracker = self->mTracker;
        self->mTracker = 0;

LABEL_25:
        goto LABEL_26;
      }

      double v24 = v46;
    }

    double v42 = [v12 pasteNativeInfosFromPasteboard:v23 allowImageReplacement:0];
    goto LABEL_24;
  }
LABEL_26:
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return (CRLCanvasLayoutManipulatingTracker *)self->mTracker;
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (BOOL)readyToEndOperation
{
  return 1;
}

- (void)operationDidEnd
{
}

- (CRLInteractiveCanvasController)i_ICC
{
  return self->mICC;
}

- (void).cxx_destruct
{
}

@end