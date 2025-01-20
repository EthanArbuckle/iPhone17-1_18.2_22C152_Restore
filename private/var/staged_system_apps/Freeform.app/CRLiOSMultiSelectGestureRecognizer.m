@interface CRLiOSMultiSelectGestureRecognizer
- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canMultiSelect;
- (BOOL)readyToEndOperation;
- (CRLCanvasLayoutManipulatingTracker)tracker;
- (CRLSelectionPath)currentSelection;
- (CRLiOSMultiSelectGestureRecognizer)initWithInteractiveCanvasController:(id)a3;
- (id)p_ICC;
- (id)p_infosToSelectWhenTogglingSelectionOfRep:(id)a3 inInfos:(id)a4;
- (id)p_selectionPathWithInfos:(id)a3;
- (void)i_updateStateForPressureDragOnRep:(id)a3;
- (void)operationDidEnd;
- (void)p_beginMultiSelect;
- (void)p_toggleSelection:(id)a3;
- (void)reset;
- (void)setCanMultiSelect:(BOOL)a3;
- (void)setCurrentSelection:(id)a3;
- (void)setState:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)trackerManipulatorDidTakeControl:(id)a3;
@end

@implementation CRLiOSMultiSelectGestureRecognizer

- (CRLiOSMultiSelectGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE678);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101085330(v5, v6);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE698);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultiSelectGestureRecognizer initWithInteractiveCanvasController:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSMultiSelectGestureRecognizer.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 57, 0, "invalid nil value for '%{public}s'", "icc");
  }
  v19.receiver = self;
  v19.super_class = (Class)CRLiOSMultiSelectGestureRecognizer;
  v10 = [(CRLiOSMultiSelectGestureRecognizer *)&v19 initWithTarget:0 action:0];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_interactiveCanvasController, v4);
    v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    touchesDown = v11->_touchesDown;
    v11->_touchesDown = v12;

    v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    alreadyToggledTouches = v11->_alreadyToggledTouches;
    v11->_alreadyToggledTouches = v14;

    v11->_canMultiSelect = 1;
    v16 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
    originalScaledTouchLocation = v11->_originalScaledTouchLocation;
    v11->_originalScaledTouchLocation = v16;
  }
  return v11;
}

- (void)setState:(int64_t)a3
{
  if ([(CRLiOSMultiSelectGestureRecognizer *)self state] != (id)a3)
  {
    if (qword_101719CA8 != -1) {
      dispatch_once(&qword_101719CA8, &stru_1014DE6B8);
    }
    int v5 = off_10166C7E8;
    if (os_log_type_enabled((os_log_t)off_10166C7E8, OS_LOG_TYPE_DEBUG)) {
      sub_1010853EC(v5, a3);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSMultiSelectGestureRecognizer;
  [(CRLiOSMultiSelectGestureRecognizer *)&v6 setState:a3];
}

- (void)reset
{
  if (qword_101719CA8 != -1) {
    dispatch_once(&qword_101719CA8, &stru_1014DE6D8);
  }
  v3 = off_10166C7E8;
  if (os_log_type_enabled((os_log_t)off_10166C7E8, OS_LOG_TYPE_DEBUG)) {
    sub_1010854B8(v3, self);
  }
  [(NSMutableSet *)self->_touchesDown removeAllObjects];
  [(NSMutableSet *)self->_alreadyToggledTouches removeAllObjects];
  touch = self->_touch;
  self->_touch = 0;

  [(CRLiOSMultiSelectGestureRecognizer *)self setCanMultiSelect:1];
  selectionPath = self->_selectionPath;
  self->_selectionPath = 0;

  originalSelectionPath = self->_originalSelectionPath;
  self->_originalSelectionPath = 0;

  v7 = [(CRLiOSMultiSelectGestureRecognizer *)self p_ICC];
  v8 = [v7 dynamicOperationController];

  if ([v8 isInPossibleDynamicOperation])
  {
    if (qword_101719CA8 != -1) {
      dispatch_once(&qword_101719CA8, &stru_1014DE6F8);
    }
    if (os_log_type_enabled((os_log_t)off_10166C7E8, OS_LOG_TYPE_DEBUG)) {
      sub_101085484();
    }
    [v8 endOperation];
  }
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSMultiSelectGestureRecognizer;
  [(CRLiOSMultiSelectGestureRecognizer *)&v9 reset];
}

- (id)p_selectionPathWithInfos:(id)a3
{
  id v4 = a3;
  int v5 = [(CRLiOSMultiSelectGestureRecognizer *)self p_ICC];
  objc_super v6 = [v5 canvasEditor];

  v7 = [v6 selectionPathWithInfos:v4];

  return v7;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v119.receiver = self;
  v119.super_class = (Class)CRLiOSMultiSelectGestureRecognizer;
  [(CRLiOSMultiSelectGestureRecognizer *)&v119 touchesBegan:v6 withEvent:a4];
  v7 = [(CRLiOSMultiSelectGestureRecognizer *)self p_ICC];
  v8 = [v7 layerHost];
  objc_super v9 = [v8 asUIKitHost];

  v10 = [v7 dynamicOperationController];
  v94 = v7;
  v11 = v7;
  v12 = self;
  v13 = [v11 tmCoordinator];
  if (![(CRLiOSMultiSelectGestureRecognizer *)v12 state]
    && [v94 currentlyScrolling])
  {
    if (qword_101719CA8 != -1) {
      dispatch_once(&qword_101719CA8, &stru_1014DE718);
    }
    if (os_log_type_enabled((os_log_t)off_10166C7E8, OS_LOG_TYPE_DEBUG)) {
      sub_101085554();
    }
    [(CRLiOSMultiSelectGestureRecognizer *)v12 setState:5];
    goto LABEL_109;
  }
  v86 = v13;
  v87 = v10;
  v85 = v9;
  v93 = v12;
  unint64_t v89 = (unint64_t)[(CRLiOSMultiSelectGestureRecognizer *)v12 modifierFlags];
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v84 = v6;
  id v14 = v6;
  id v15 = [v14 countByEnumeratingWithState:&v115 objects:v123 count:16];
  id obj = v14;
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v116;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v116 != v17) {
          objc_enumerationMutation(obj);
        }
        objc_super v19 = *(void **)(*((void *)&v115 + 1) + 8 * i);
        originalScaledTouchLocation = v12->_originalScaledTouchLocation;
        v21 = [v94 layerHost];
        v22 = [v21 canvasView];
        [v19 locationInView:v22];
        v23 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
        [(NSMapTable *)originalScaledTouchLocation setObject:v23 forKey:v19];
      }
      id v14 = obj;
      id v16 = [obj countByEnumeratingWithState:&v115 objects:v123 count:16];
    }
    while (v16);
  }

  if (-[CRLiOSMultiSelectGestureRecognizer state](v12, "state") || (unint64_t)[v14 count] < 2)
  {
    char v82 = 0;
    v10 = v87;
  }
  else
  {
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id v24 = v14;
    id v25 = [v24 countByEnumeratingWithState:&v111 objects:v122 count:16];
    if (v25)
    {
      id v26 = v25;
      char v27 = 0;
      uint64_t v28 = *(void *)v112;
      v10 = v87;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v112 != v28) {
            objc_enumerationMutation(v24);
          }
          uint64_t v30 = *(void *)(*((void *)&v111 + 1) + 8 * (void)j);
          v31 = [v9 hitRepWithTouch:v30];
          v32 = [v31 repForSelecting];

          if (v32 && [v32 isSelectedIgnoringLocking])
          {
            [(NSMutableSet *)v93->_alreadyToggledTouches addObject:v30];
            char v27 = 1;
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v111 objects:v122 count:16];
      }
      while (v26);
    }
    else
    {
      char v27 = 0;
      v10 = v87;
    }

    char v82 = v27 & 1;
    v12 = v93;
  }
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v33 = obj;
  id v34 = [v33 countByEnumeratingWithState:&v107 objects:v121 count:16];
  if (!v34) {
    goto LABEL_108;
  }
  id v35 = v34;
  uint64_t v81 = v89 & 0x120000;
  v80 = v106;
  uint64_t v36 = *(void *)v108;
  uint64_t v90 = *(void *)v108;
LABEL_31:
  id v37 = 0;
  id v88 = v35;
LABEL_32:
  if (*(void *)v108 != v36) {
    objc_enumerationMutation(v33);
  }
  v38 = *(void **)(*((void *)&v107 + 1) + 8 * (void)v37);
  if ([(CRLiOSMultiSelectGestureRecognizer *)v12 state])
  {
    if ([(CRLiOSMultiSelectGestureRecognizer *)v12 canMultiSelect])
    {
      v39 = [v9 hitRepWithTouch:v38];
      v40 = [v39 repForSelecting];

      if (v40 && ([v40 demandsExclusiveSelection] & 1) == 0) {
        [(NSMutableSet *)v12->_touchesDown addObject:v38];
      }
    }
    goto LABEL_75;
  }
  id obja = v37;
  if (![(NSMutableSet *)v12->_touchesDown count])
  {
    objc_storeStrong((id *)&v12->_touch, v38);
    if ((id)[(UITouch *)v12->_touch tapCount] != (id)1)
    {
      if (qword_101719CA8 != -1) {
        dispatch_once(&qword_101719CA8, &stru_1014DE798);
      }
      if (os_log_type_enabled((os_log_t)off_10166C7E8, OS_LOG_TYPE_DEBUG)) {
        sub_101085618(&v95, v96);
      }
      goto LABEL_74;
    }
    v43 = [v9 hitRepWithTouch:v12->_touch];
    uint64_t v44 = [v43 repForSelecting];
    rep = v12->_rep;
    v12->_rep = (CRLCanvasRep *)v44;

    v46 = v12->_rep;
    if (!v46
      || ([(CRLCanvasRep *)v46 info], v47 = objc_claimAutoreleasedReturnValue(), v47, !v47))
    {
      if (qword_101719CA8 != -1) {
        dispatch_once(&qword_101719CA8, &stru_1014DE778);
      }
      id v35 = v88;
      if (os_log_type_enabled((os_log_t)off_10166C7E8, OS_LOG_TYPE_DEBUG)) {
        sub_101085588(&v97, v98);
      }
      goto LABEL_74;
    }
    id v83 = v33;
    if ([(CRLCanvasRep *)v12->_rep demandsExclusiveSelection])
    {
      [(CRLiOSMultiSelectGestureRecognizer *)v12 setCanMultiSelect:0];
      v48 = [(CRLCanvasRep *)v12->_rep info];
      v49 = +[NSSet setWithObject:v48];
      uint64_t v50 = [(CRLiOSMultiSelectGestureRecognizer *)v12 p_selectionPathWithInfos:v49];
      v51 = v12;
      selectionPath = v12->_selectionPath;
      v12->_selectionPath = (CRLSelectionPath *)v50;
      goto LABEL_69;
    }
    [(CRLiOSMultiSelectGestureRecognizer *)v12 setCanMultiSelect:1];
    v51 = v12;
    v53 = [v94 selectionModelTranslator];
    v54 = [v94 editorController];
    v55 = [v54 selectionPath];
    uint64_t v56 = [v53 boardItemsForSelectionPath:v55];

    if (v81)
    {
      v49 = [(CRLiOSMultiSelectGestureRecognizer *)v12 p_infosToSelectWhenTogglingSelectionOfRep:v12->_rep inInfos:v56];
      uint64_t v57 = [(CRLiOSMultiSelectGestureRecognizer *)v12 p_selectionPathWithInfos:v49];
      selectionPath = v12->_selectionPath;
      v12->_selectionPath = (CRLSelectionPath *)v57;
    }
    else
    {
      if ((v82 & 1) != 0 || [(CRLCanvasRep *)v12->_rep isSelectedIgnoringLocking])
      {
        v48 = (void *)v56;
        v49 = +[NSMutableSet setWithSet:v56];
        if (![(CRLCanvasRep *)v12->_rep isSelectedIgnoringLocking])
        {
          v58 = [(CRLCanvasRep *)v12->_rep info];
          [v49 addObject:v58];

          v48 = (void *)v56;
        }
        uint64_t v59 = [(CRLiOSMultiSelectGestureRecognizer *)v12 p_selectionPathWithInfos:v49];
        selectionPath = v12->_selectionPath;
        v12->_selectionPath = (CRLSelectionPath *)v59;
        goto LABEL_68;
      }
      v49 = [(CRLCanvasRep *)v12->_rep info];
      selectionPath = +[NSSet setWithObject:v49];
      uint64_t v77 = [(CRLiOSMultiSelectGestureRecognizer *)v12 p_selectionPathWithInfos:selectionPath];
      v78 = v12->_selectionPath;
      v12->_selectionPath = (CRLSelectionPath *)v77;
    }
    v48 = (void *)v56;
LABEL_68:
    v10 = v87;
LABEL_69:

    [(NSMutableSet *)v51->_touchesDown addObject:v38];
    if ([v10 isInOperation])
    {
      uint64_t v36 = v90;
      if (qword_101719CA8 != -1) {
        dispatch_once(&qword_101719CA8, &stru_1014DE738);
      }
      v12 = v93;
      id v33 = v83;
      id v35 = v88;
      if (os_log_type_enabled((os_log_t)off_10166C7E8, OS_LOG_TYPE_DEBUG)) {
        sub_1010855B8(&v105, v80);
      }
LABEL_74:
      [(CRLiOSMultiSelectGestureRecognizer *)v12 setState:5];
      goto LABEL_75;
    }
    [v86 registerTrackerManipulator:v51];
    uint64_t v36 = v90;
    if (qword_101719CA8 != -1) {
      dispatch_once(&qword_101719CA8, &stru_1014DE758);
    }
    if (os_log_type_enabled((os_log_t)off_10166C7E8, OS_LOG_TYPE_DEBUG)) {
      sub_1010855E8(&v103, v104);
    }
    [v10 beginPossibleDynamicOperation];
    if ([(CRLCanvasRep *)v93->_rep demandsExclusiveSelection])
    {
      v60 = [v94 infosForSelectionPath:v93->_selectionPath];
      id v61 = [v60 count];

      if ((unint64_t)v61 >= 2)
      {
        v62 = [(CRLCanvasRep *)v93->_rep info];
        v63 = +[NSSet setWithObject:v62];
        uint64_t v64 = [(CRLiOSMultiSelectGestureRecognizer *)v93 p_selectionPathWithInfos:v63];
        v65 = v93->_selectionPath;
        v93->_selectionPath = (CRLSelectionPath *)v64;

        v66 = +[NSSet setWithObject:v93->_rep];
        [v10 startTransformingReps:v66];

        v12 = v93;
        id v33 = v83;
        id v35 = v88;
        goto LABEL_75;
      }
    }
    id v67 = objc_alloc_init((Class)NSMutableSet);
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    v68 = [v94 infosForSelectionPath:v93->_selectionPath];
    id v69 = [v68 countByEnumeratingWithState:&v99 objects:v120 count:16];
    v12 = v93;
    if (!v69) {
      goto LABEL_98;
    }
    id v70 = v69;
    uint64_t v71 = *(void *)v100;
LABEL_86:
    uint64_t v72 = 0;
    while (1)
    {
      if (*(void *)v100 != v71) {
        objc_enumerationMutation(v68);
      }
      v73 = [v94 repForInfo:*(void *)(*((void *)&v99 + 1) + 8 * v72)];
      v74 = [(CRLCanvasRep *)v73 info];
      v75 = [(CRLCanvasRep *)v93->_rep info];
      if (v74 != v75) {
        break;
      }
      v76 = v93->_rep;

      if (v73 != v76)
      {
        v74 = v73;
        v73 = v93->_rep;
        goto LABEL_93;
      }
LABEL_94:
      if (v73) {
        [v67 addObject:v73];
      }

      if (v70 == (id)++v72)
      {
        id v70 = [v68 countByEnumeratingWithState:&v99 objects:v120 count:16];
        if (!v70)
        {
LABEL_98:

          v10 = v87;
          [v87 startTransformingReps:v67];

          objc_super v9 = v85;
          id v33 = v83;
          id v35 = v88;
LABEL_46:
          uint64_t v36 = v90;
          id v37 = obja;
LABEL_75:
          id v37 = (char *)v37 + 1;
          if (v37 == v35)
          {
            id v79 = [v33 countByEnumeratingWithState:&v107 objects:v121 count:16];
            id v35 = v79;
            if (!v79) {
              goto LABEL_108;
            }
            goto LABEL_31;
          }
          goto LABEL_32;
        }
        goto LABEL_86;
      }
    }

LABEL_93:
    goto LABEL_94;
  }
  if ([(CRLiOSMultiSelectGestureRecognizer *)v12 canMultiSelect])
  {
    v41 = [v9 hitRepWithTouch:v38];
    v42 = [v41 repForSelecting];

    if (v42 && ![(CRLCanvasRep *)v42 demandsExclusiveSelection])
    {
      if (v12->_rep != v42)
      {
        [(NSMutableSet *)v12->_touchesDown addObject:v38];

        goto LABEL_46;
      }
      if (qword_101719CA8 != -1) {
        dispatch_once(&qword_101719CA8, &stru_1014DE7B8);
      }
      if (os_log_type_enabled((os_log_t)off_10166C7E8, OS_LOG_TYPE_DEBUG)) {
        sub_101085648();
      }
      [(CRLiOSMultiSelectGestureRecognizer *)v12 setState:5];
    }
  }
LABEL_108:

  v13 = v86;
  id v6 = v84;
LABEL_109:
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CRLiOSMultiSelectGestureRecognizer;
  [(CRLiOSMultiSelectGestureRecognizer *)&v4 touchesMoved:a3 withEvent:a4];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v103.receiver = self;
  v103.super_class = (Class)CRLiOSMultiSelectGestureRecognizer;
  [(CRLiOSMultiSelectGestureRecognizer *)&v103 touchesEnded:v6 withEvent:a4];
  v7 = [(CRLiOSMultiSelectGestureRecognizer *)self p_ICC];
  v8 = [v7 layerHost];
  objc_super v9 = [v8 asUIKitHost];
  v10 = (objc_class *)objc_opt_class();
  v85 = sub_100246E2C(v9, v10, 1, v11, v12, v13, v14, v15, (uint64_t)&OBJC_PROTOCOL___CRLUIKitInteractionHost);

  id v16 = [v7 dynamicOperationController];
  if (![(CRLiOSMultiSelectGestureRecognizer *)self state]
    && [v7 currentlyScrolling])
  {
    if (qword_101719CA8 != -1) {
      dispatch_once(&qword_101719CA8, &stru_1014DE7D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166C7E8, OS_LOG_TYPE_DEBUG)) {
      sub_101085554();
    }
    [(CRLiOSMultiSelectGestureRecognizer *)self setState:5];
    goto LABEL_64;
  }
  id v83 = v16;
  id v84 = +[NSMutableSet setWithSet:self->_touchesDown];
  [v84 minusSet:v6];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v82 = v6;
  id obj = v6;
  id v17 = [obj countByEnumeratingWithState:&v99 objects:v107 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v100;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v100 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(UITouch **)(*((void *)&v99 + 1) + 8 * i);
        if ([(NSMutableSet *)self->_touchesDown containsObject:v21])
        {
          v22 = [(NSMapTable *)self->_originalScaledTouchLocation objectForKey:v21];
          [v22 CGPointValue];
          double v24 = v23;
          double v26 = v25;

          char v27 = [v7 layerHost];
          uint64_t v28 = [v27 canvasView];
          [(UITouch *)v21 locationInView:v28];
          double v30 = v29;
          double v32 = v31;

          if (sub_1000653B4(v24, v26, v30, v32) < 14.0)
          {
            id v33 = [(NSMapTable *)self->_originalScaledTouchLocation objectForKey:v21];
            [v33 CGPointValue];
            double v35 = v34;
            double v37 = v36;

            [v7 convertBoundsToUnscaledPoint:v35, v37];
            double v39 = v38;
            double v41 = v40;
            v42 = [v85 repDragGestureRecognizer];
            v43 = [v42 repDragTracker];
            unsigned __int8 v44 = [v43 didBeginDrag];

            v45 = [v7 hitRep:v39, v41];
            v46 = v45;
            if (v44) {
              [v45 repForDragging];
            }
            else {
            v47 = [v45 repForSelecting];
            }
            if (v47)
            {
              if (!-[CRLiOSMultiSelectGestureRecognizer state](self, "state") && [v84 count])
              {
                [(CRLiOSMultiSelectGestureRecognizer *)self setState:1];
                [(CRLiOSMultiSelectGestureRecognizer *)self p_beginMultiSelect];
              }
              if (v21 != self->_touch
                && ([(NSMutableSet *)self->_alreadyToggledTouches containsObject:v21] & 1) == 0)
              {
                [(CRLiOSMultiSelectGestureRecognizer *)self p_toggleSelection:v47];
              }
            }
          }
        }
      }
      id v18 = [obj countByEnumeratingWithState:&v99 objects:v107 count:16];
    }
    while (v18);
  }

  id v48 = [(NSMutableSet *)self->_touchesDown copy];
  [(NSMutableSet *)self->_touchesDown minusSet:obj];
  [(NSMutableSet *)self->_alreadyToggledTouches minusSet:obj];
  if ([(NSMutableSet *)self->_touchesDown count] == (id)1)
  {
    id v49 = [v48 count];
    if (v49 != [(NSMutableSet *)self->_touchesDown count])
    {
      v62 = [(NSMutableSet *)self->_touchesDown anyObject];
      if (v62 != self->_touch)
      {
        v63 = [(NSMutableSet *)self->_touchesDown anyObject];
        touch = self->_touch;
        self->_touch = v63;

        v65 = [(NSMapTable *)self->_originalScaledTouchLocation objectForKey:self->_touch];
        [v65 CGPointValue];
        double v67 = v66;
        double v69 = v68;

        [v7 convertBoundsToUnscaledPoint:v67, v69];
        id v70 = [v7 hitRep];
        uint64_t v71 = [v70 repForSelecting];

        if (v71)
        {
          [(CRLiOSMultiSelectGestureRecognizer *)self p_toggleSelection:v71];
          [(NSMutableSet *)self->_alreadyToggledTouches addObject:self->_touch];
        }
      }
      goto LABEL_55;
    }
  }
  uint64_t v50 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
  if (![(NSMutableSet *)self->_touchesDown count])
  {
    v51 = (char *)[(CRLiOSMultiSelectGestureRecognizer *)self state];
    if ((unint64_t)(v51 - 1) < 2)
    {
      [(CRLiOSMultiSelectGestureRecognizer *)self setState:3];
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      v52 = [v7 infosForSelectionPath:self->_selectionPath];
      id v53 = [v52 countByEnumeratingWithState:&v91 objects:v105 count:16];
      if (v53)
      {
        id v54 = v53;
        uint64_t v55 = *(void *)v92;
        do
        {
          for (j = 0; j != v54; j = (char *)j + 1)
          {
            if (*(void *)v92 != v55) {
              objc_enumerationMutation(v52);
            }
            uint64_t v57 = [v7 repForInfo:*(void *)(*((void *)&v91 + 1) + 8 * (void)j)];
            [v57 fadeKnobsIn];
            [v57 setShowKnobsDuringManipulation:0];
          }
          id v54 = [v52 countByEnumeratingWithState:&v91 objects:v105 count:16];
        }
        while (v54);
      }

      uint64_t v50 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
      if ([v83 isInPossibleDynamicOperation])
      {
        v58 = [v7 infosForCurrentSelectionPath];
        id v59 = [v58 count];

        if (v59)
        {
          v60 = [obj anyObject];
          id v61 = [v60 type];

          if (v61 != (id)3) {
            [v85 performSelector:"showDefaultEditUIForCurrentSelection" withObject:0 afterDelay:0.0];
          }
        }
      }
      goto LABEL_56;
    }
    if (!v51)
    {
      [(CRLiOSMultiSelectGestureRecognizer *)self setState:5];
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      v62 = [v7 infosForSelectionPath:self->_selectionPath];
      id v72 = [(UITouch *)v62 countByEnumeratingWithState:&v95 objects:v106 count:16];
      if (v72)
      {
        id v73 = v72;
        uint64_t v74 = *(void *)v96;
        do
        {
          for (k = 0; k != v73; k = (char *)k + 1)
          {
            if (*(void *)v96 != v74) {
              objc_enumerationMutation(v62);
            }
            v76 = [v7 repForInfo:*(void *)(*((void *)&v95 + 1) + 8 * (void)k)];
            [v76 fadeKnobsIn];
            [v76 setShowKnobsDuringManipulation:0];
          }
          id v73 = [(UITouch *)v62 countByEnumeratingWithState:&v95 objects:v106 count:16];
        }
        while (v73);
      }
LABEL_55:

      uint64_t v50 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
    }
  }
LABEL_56:
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v77 = obj;
  id v78 = [v77 countByEnumeratingWithState:&v87 objects:v104 count:16];
  if (v78)
  {
    id v79 = v78;
    uint64_t v80 = *(void *)v88;
    do
    {
      for (m = 0; m != v79; m = (char *)m + 1)
      {
        if (*(void *)v88 != v80) {
          objc_enumerationMutation(v77);
        }
        [*(id *)((char *)&self->super.super.isa + v50[40]) removeObjectForKey:*(void *)(*((void *)&v87 + 1) + 8 * (void)m)];
      }
      id v79 = [v77 countByEnumeratingWithState:&v87 objects:v104 count:16];
    }
    while (v79);
  }

  id v6 = v82;
  id v16 = v83;
LABEL_64:
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CRLiOSMultiSelectGestureRecognizer;
  [(CRLiOSMultiSelectGestureRecognizer *)&v39 touchesEnded:v6 withEvent:a4];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v8)
  {
    id v9 = v8;
    char v27 = v34;
    id v28 = v7;
    v10 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
    uint64_t v11 = *(void *)v36;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v35 + 1) + 8 * (void)v12);
        uint64_t v14 = v10[37];
        if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v14), "containsObject:", v13, v27))
        {
          [*(id *)((char *)&self->super.super.isa + v14) removeObject:v13];
          if (![*(id *)((char *)&self->super.super.isa + v14) count])
          {
            unint64_t v15 = (unint64_t)[(CRLiOSMultiSelectGestureRecognizer *)self state];
            if (v15 <= 5) {
              [(CRLiOSMultiSelectGestureRecognizer *)self setState:qword_101176320[v15]];
            }
            id v16 = [(CRLiOSMultiSelectGestureRecognizer *)self p_ICC];
            id v17 = [v16 editorController];
            id v18 = [v16 dynamicOperationController];
            originalSelectionPath = self->_originalSelectionPath;
            if (originalSelectionPath)
            {
              v20 = [v17 selectionPath];
              if ([(CRLSelectionPath *)originalSelectionPath isEqual:v20])
              {

                goto LABEL_19;
              }
              unsigned int v21 = [v18 isInPossibleDynamicOperation];

              id v7 = v28;
              if (v21)
              {
                if (qword_101719CA8 != -1) {
                  dispatch_once(&qword_101719CA8, &stru_1014DE7F8);
                }
                if (os_log_type_enabled((os_log_t)off_10166C7E8, OS_LOG_TYPE_DEBUG)) {
                  sub_10108567C(&v33, v27);
                }
                [v17 setSelectionPath:self->_originalSelectionPath];
LABEL_19:
                id v7 = v28;
              }
            }

            v10 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
          }
        }
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      id v9 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v9);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v22 = v7;
  id v23 = [v22 countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        [(NSMapTable *)self->_originalScaledTouchLocation removeObjectForKey:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      id v24 = [v22 countByEnumeratingWithState:&v29 objects:v40 count:16];
    }
    while (v24);
  }
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_3;
  }
  int v5 = [v4 view];
  id v6 = [(CRLiOSMultiSelectGestureRecognizer *)self p_ICC];
  id v7 = [v6 canvasView];
  id v8 = [v7 enclosingScrollView];

  if (v5 == v8)
  {
    BOOL v9 = 0;
  }
  else
  {
LABEL_3:
    v11.receiver = self;
    v11.super_class = (Class)CRLiOSMultiSelectGestureRecognizer;
    BOOL v9 = [(CRLiOSMultiSelectGestureRecognizer *)&v11 canBePreventedByGestureRecognizer:v4];
  }

  return v9;
}

- (void)trackerManipulatorDidTakeControl:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = sub_1002469D0(v5, v4);
  if (![(CRLiOSMultiSelectGestureRecognizer *)self state])
  {
    id v7 = [(CRLiOSMultiSelectGestureRecognizer *)self p_ICC];
    id v8 = [v7 layerHost];
    BOOL v9 = [v8 asUIKitHost];
    v10 = [v9 repDragGestureRecognizer];

    if (v6 == v10)
    {
      if ([v6 state])
      {
        [(CRLiOSMultiSelectGestureRecognizer *)self setState:1];
        if (qword_101719CA8 != -1) {
          dispatch_once(&qword_101719CA8, &stru_1014DE818);
        }
        objc_super v11 = off_10166C7E8;
        if (os_log_type_enabled((os_log_t)off_10166C7E8, OS_LOG_TYPE_DEBUG)) {
          sub_1010856AC(v11, (uint64_t)v4, self);
        }
      }
      [(CRLiOSMultiSelectGestureRecognizer *)self p_beginMultiSelect];
    }
  }
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return 0;
}

- (BOOL)readyToEndOperation
{
  return [(CRLiOSMultiSelectGestureRecognizer *)self state] == (id)3;
}

- (void)operationDidEnd
{
  if (qword_101719CA8 != -1) {
    dispatch_once(&qword_101719CA8, &stru_1014DE838);
  }
  v3 = off_10166C7E8;
  if (os_log_type_enabled((os_log_t)off_10166C7E8, OS_LOG_TYPE_DEBUG)) {
    sub_101085788(v3, self);
  }
  if (![(CRLiOSMultiSelectGestureRecognizer *)self state]
    || [(CRLiOSMultiSelectGestureRecognizer *)self state] == (id)1
    || [(CRLiOSMultiSelectGestureRecognizer *)self state] == (id)2)
  {
    [(CRLiOSMultiSelectGestureRecognizer *)self setState:5];
  }
}

- (void)i_updateStateForPressureDragOnRep:(id)a3
{
  id v8 = (CRLCanvasRep *)a3;
  uint64_t v5 = [(CRLiOSMultiSelectGestureRecognizer *)self p_ICC];
  id v6 = [v5 editorController];
  id v7 = [v6 selectionPath];
  [(CRLiOSMultiSelectGestureRecognizer *)self setCurrentSelection:v7];

  [(CRLiOSMultiSelectGestureRecognizer *)self setCanMultiSelect:[(CRLCanvasRep *)v8 demandsExclusiveSelection]];
  if (self->_rep != v8) {
    objc_storeStrong((id *)&self->_rep, a3);
  }
  if (![(CRLiOSMultiSelectGestureRecognizer *)self state]) {
    [(CRLiOSMultiSelectGestureRecognizer *)self setState:1];
  }
}

- (id)p_ICC
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);

  return WeakRetained;
}

- (id)p_infosToSelectWhenTogglingSelectionOfRep:(id)a3 inInfos:(id)a4
{
  id v5 = a3;
  id v6 = +[NSMutableSet setWithSet:a4];
  unsigned int v7 = [v5 isSelectedIgnoringLocking];
  id v8 = [v5 info];

  if (v7) {
    [v6 removeObject:v8];
  }
  else {
    [v6 addObject:v8];
  }

  return v6;
}

- (void)p_toggleSelection:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSMultiSelectGestureRecognizer *)self p_ICC];
  id v6 = [v5 dynamicOperationController];
  [(CRLiOSMultiSelectGestureRecognizer *)self setState:2];
  unsigned int v7 = [v5 selectionModelTranslator];
  id v8 = [v7 boardItemsForSelectionPath:self->_selectionPath];

  BOOL v9 = [(CRLiOSMultiSelectGestureRecognizer *)self p_infosToSelectWhenTogglingSelectionOfRep:v4 inInfos:v8];
  v10 = [v8 crl_setBySubtractingSet:v9];
  objc_super v11 = [(CRLiOSMultiSelectGestureRecognizer *)self p_selectionPathWithInfos:v9];
  selectionPath = self->_selectionPath;
  self->_selectionPath = v11;

  uint64_t v13 = self->_selectionPath;
  uint64_t v14 = [v5 editorController];
  [v14 setSelectionPath:v13];

  unint64_t v15 = [v4 info];
  LODWORD(v14) = [v10 containsObject:v15];

  id v16 = +[NSSet setWithObject:v4];
  if (v14) {
    [v6 stopTransformingReps:v16];
  }
  else {
    [v6 startTransformingReps:v16];
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v17 = v9;
  id v18 = [v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = [v5 repForInfo:*(void *)(*((void *)&v33 + 1) + 8 * i)];
        [v22 setShowKnobsDuringManipulation:1];
        [v22 turnKnobsOn];
      }
      id v19 = [v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v19);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v23 = v10;
  id v24 = [v23 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v30;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = [v5 repForInfo:*(void *)(*((void *)&v29 + 1) + 8 * (void)j) v29];
        [v28 setShowKnobsDuringManipulation:0];
      }
      id v25 = [v23 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v25);
  }

  [v6 invalidateGuides];
}

- (void)p_beginMultiSelect
{
  if (qword_101719CA8 != -1) {
    dispatch_once(&qword_101719CA8, &stru_1014DE858);
  }
  if (os_log_type_enabled((os_log_t)off_10166C7E8, OS_LOG_TYPE_DEBUG)) {
    sub_10108588C();
  }
  unsigned int v3 = [(CRLiOSMultiSelectGestureRecognizer *)self modifierFlags];
  if (![(CRLiOSMultiSelectGestureRecognizer *)self state] && (*(void *)&v3 & 0x120000) != 0)
  {
    if (qword_101719CA8 != -1) {
      dispatch_once(&qword_101719CA8, &stru_1014DE878);
    }
    if (os_log_type_enabled((os_log_t)off_10166C7E8, OS_LOG_TYPE_DEBUG)) {
      sub_101085858();
    }
    [(CRLiOSMultiSelectGestureRecognizer *)self setState:1];
  }
  id v4 = [(CRLiOSMultiSelectGestureRecognizer *)self p_ICC];
  id v5 = [v4 dynamicOperationController];
  if (([v5 isInOperation] & 1) == 0
    && ([v5 isInPossibleDynamicOperation] & 1) == 0)
  {
    [v5 beginPossibleDynamicOperation];
  }
  id v53 = v5;
  id v56 = objc_alloc_init((Class)NSMutableSet);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = [v4 infosForSelectionPath:self->_selectionPath];
  id v6 = [obj countByEnumeratingWithState:&v57 objects:v75 count:16];
  unsigned int v7 = &OBJC_IVAR___CRLCanvasAnimation__allAnimationsFinishedBeforeStopping;
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v58;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = [v4 repForInfo:*(void *)(*((void *)&v57 + 1) + 8 * (void)v10)];
        uint64_t v12 = [v11 info];
        uint64_t v13 = v7[44];
        uint64_t v14 = [*(id *)((char *)&self->super.super.isa + v13) info];
        if (v12 != v14)
        {

          goto LABEL_24;
        }
        unint64_t v15 = v4;
        id v16 = v7;
        id v17 = *(Class *)((char *)&self->super.super.isa + v13);

        if (v11 != v17)
        {
          uint64_t v12 = v11;
          id v11 = *(id *)((char *)&self->super.super.isa + v13);
          unsigned int v7 = v16;
          id v4 = v15;
LABEL_24:

          if (!v11) {
            goto LABEL_26;
          }
LABEL_25:
          [v56 addObject:v11];
          [v11 turnKnobsOn];
          [v11 setShowKnobsDuringManipulation:1];
          goto LABEL_26;
        }
        unsigned int v7 = v16;
        id v4 = v15;
        if (v11) {
          goto LABEL_25;
        }
LABEL_26:

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v18 = [obj countByEnumeratingWithState:&v57 objects:v75 count:16];
      id v8 = v18;
    }
    while (v18);
  }

  id v19 = [v4 editorController];
  uint64_t v20 = [v19 selectionPath];
  originalSelectionPath = self->_originalSelectionPath;
  self->_originalSelectionPath = v20;

  [v4 endEditing];
  if ([(CRLiOSMultiSelectGestureRecognizer *)self state]) {
    goto LABEL_42;
  }
  id v22 = [(NSMapTable *)self->_originalScaledTouchLocation objectForKeyedSubscript:self->_touch];
  [v22 CGPointValue];
  [v4 convertBoundsToUnscaledPoint:];
  double v24 = v23;
  double v26 = v25;

  char v27 = [v4 hitRep:v24 v26];
  id v28 = [v27 repForSelecting];
  long long v29 = *(Class *)((char *)&self->super.super.isa + v7[44]);

  if (v28 != v29)
  {
    unsigned int v30 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE898);
    }
    long long v31 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      log = v31;
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      id obja = (id)objc_claimAutoreleasedReturnValue();
      v46 = (objc_class *)objc_opt_class();
      id v49 = NSStringFromClass(v46);
      uint64_t v50 = [v27 repForSelecting];
      v47 = (objc_class *)objc_opt_class();
      id v48 = NSStringFromClass(v47);
      *(_DWORD *)buf = 67110658;
      unsigned int v62 = v30;
      __int16 v63 = 2082;
      uint64_t v64 = "-[CRLiOSMultiSelectGestureRecognizer p_beginMultiSelect]";
      __int16 v65 = 2082;
      double v66 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSMultiSelectGestureRecognizer.m";
      __int16 v67 = 1024;
      int v68 = 588;
      __int16 v69 = 2114;
      id v70 = obja;
      __int16 v71 = 2114;
      id v72 = v49;
      __int16 v73 = 2114;
      uint64_t v74 = v48;
      _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The hit rep %{public}@ is providing a different repForSelecting %{public}@ before we update the selection vs after %{public}@.", buf, 0x40u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE8B8);
    }
    long long v32 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v32);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultiSelectGestureRecognizer p_beginMultiSelect]");
    os_log_t loga = (os_log_t)objc_claimAutoreleasedReturnValue();
    long long v33 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSMultiSelectGestureRecognizer.m"];
    long long v34 = (objc_class *)objc_opt_class();
    long long v35 = NSStringFromClass(v34);
    long long v36 = (objc_class *)objc_opt_class();
    long long v37 = NSStringFromClass(v36);
    long long v38 = [v27 repForSelecting];
    objc_super v39 = (objc_class *)objc_opt_class();
    double v40 = NSStringFromClass(v39);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", loga, v33, 588, 0, "The hit rep %{public}@ is providing a different repForSelecting %{public}@ before we update the selection vs after %{public}@.", v35, v37, v40);

LABEL_42:
    char v27 = 0;
  }
  selectionPath = self->_selectionPath;
  v42 = [v4 editorController];
  [v42 setSelectionPath:selectionPath];

  if (v27)
  {
    v43 = [v27 repForSelecting];
    unsigned __int8 v44 = *(Class *)((char *)&self->super.super.isa + v7[44]);

    if (v43 != v44)
    {
      if (qword_101719CA8 != -1) {
        dispatch_once(&qword_101719CA8, &stru_1014DE8D8);
      }
      if (os_log_type_enabled((os_log_t)off_10166C7E8, OS_LOG_TYPE_DEBUG)) {
        sub_101085824();
      }
      [(CRLiOSMultiSelectGestureRecognizer *)self setState:1];
    }
  }
  [v53 startTransformingReps:v56];
}

- (CRLSelectionPath)currentSelection
{
  return self->_selectionPath;
}

- (void)setCurrentSelection:(id)a3
{
}

- (BOOL)canMultiSelect
{
  return self->_canMultiSelect;
}

- (void)setCanMultiSelect:(BOOL)a3
{
  self->_canMultiSelect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionPath, 0);
  objc_storeStrong((id *)&self->_originalSelectionPath, 0);
  objc_storeStrong((id *)&self->_originalScaledTouchLocation, 0);
  objc_storeStrong((id *)&self->_alreadyToggledTouches, 0);
  objc_storeStrong((id *)&self->_touchesDown, 0);
  objc_storeStrong((id *)&self->_touch, 0);
  objc_storeStrong((id *)&self->_rep, 0);

  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end