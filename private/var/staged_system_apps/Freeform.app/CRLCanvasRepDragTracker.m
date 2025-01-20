@interface CRLCanvasRepDragTracker
- (BOOL)allowsDelegateToDisplayUIForDragOperation;
- (BOOL)didBeginDrag;
- (BOOL)insertInfosAndUpdateDragForDuplicatingDragIfAppropriate;
- (BOOL)isArrowkeyDrivenTracking;
- (BOOL)isDragInsertDrivenTracking;
- (BOOL)isEnqueueingCommandsInRealTime;
- (BOOL)isInspectorDrivenTracking;
- (BOOL)operationShouldBeDynamic;
- (BOOL)p_delegateIsHandlingDrag;
- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3;
- (BOOL)shouldShowGuides;
- (BOOL)shouldSnapToGuides;
- (BOOL)shouldSuppressConstrainingHUD;
- (BOOL)showDragHUD;
- (BOOL)supportsAlignmentGuides;
- (BOOL)traceIfDesiredForBeginOperation;
- (BOOL)traceIfDesiredForEndOperation;
- (CGRect)p_selectedInfosRect;
- (CRLCanvasRep)rep;
- (CRLCanvasRepDragTracker)initWithRep:(id)a3;
- (NSArray)decoratorOverlayRenderables;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)p_infosFromReps:(id)a3;
- (id)p_repsForInfos:(id)a3 fromReps:(id)a4;
- (id)repsForGuidesWhenManipulatingReps:(id)a3;
- (void)activateUIFeedback;
- (void)addUnscaledDragDelta:(CGPoint)a3 roundDeltaToViewScale:(BOOL)a4;
- (void)beginShowingDragUIForInitialDragPoint:(CGPoint)a3;
- (void)changeDynamicLayoutsForReps:(id)a3;
- (void)commitChangesForReps:(id)a3;
- (void)dealloc;
- (void)didChangeCurrentlyTransformingReps;
- (void)endPossibleRepDragGesture;
- (void)p_didBeginDrag;
- (void)p_hideGuideRenderable;
- (void)p_hideHUD;
- (void)p_updateGuides;
- (void)p_updateHUDAtPoint:(CGPoint)a3;
- (void)p_updateHUDFromTimer;
- (void)preventOpeningCommandGroupWhenCommittingChangesForReps;
- (void)setActualDragPoint:(CGPoint)a3;
- (void)setConstrainingPoint:(CGPoint)a3;
- (void)setIsArrowkeyDrivenTracking:(BOOL)a3;
- (void)setIsDragInsertDrivenTracking:(BOOL)a3;
- (void)setIsInspectorDrivenTracking:(BOOL)a3;
- (void)setLogicalDragPoint:(CGPoint)a3;
- (void)setRep:(id)a3;
- (void)setShouldConstrain:(BOOL)a3;
- (void)setShouldShowGuides:(BOOL)a3;
- (void)setShouldSnapToGuides:(BOOL)a3;
- (void)setShouldSuppressConstrainingHUD:(BOOL)a3;
- (void)setShowDragHUD:(BOOL)a3;
- (void)setSnapLevel:(double)a3;
- (void)willBeginDynamicOperationForReps:(id)a3;
@end

@implementation CRLCanvasRepDragTracker

- (CRLCanvasRepDragTracker)initWithRep:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRLCanvasRepDragTracker;
  v5 = [(CRLCanvasRepDragTracker *)&v16 init];
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101500470);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BD5C8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101500490);
      }
      v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v6);
      }
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepDragTracker initWithRep:]");
      v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 135, 0, "invalid nil value for '%{public}s'", "rep");
    }
    [(CRLCanvasRepDragTracker *)v5 setRep:v4];
    v9 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
    mMapRepsToSnapOffsets = v5->mMapRepsToSnapOffsets;
    v5->mMapRepsToSnapOffsets = v9;

    v11 = objc_alloc_init(CRLCanvasHUDController);
    mSecondHUDController = v5->mSecondHUDController;
    v5->mSecondHUDController = v11;

    v5->mShowDragHUD = 0;
    v13 = (UIImpactFeedbackGenerator *)objc_alloc_init((Class)UIImpactFeedbackGenerator);
    mImpactFeedbackGenerator = v5->mImpactFeedbackGenerator;
    v5->mImpactFeedbackGenerator = v13;

    [(UIImpactFeedbackGenerator *)v5->mImpactFeedbackGenerator prepare];
    v5->mConstraintAngle = -1.0;
  }

  return v5;
}

- (void)dealloc
{
  if (self->mHaveShownHUD || self->mHaveShownSecondHUD) {
    [(CRLCanvasRepDragTracker *)self p_hideHUD];
  }
  [(CRLCanvasRenderable *)self->mGuideRenderable setDelegate:0];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasRepDragTracker;
  [(CRLCanvasRepDragTracker *)&v3 dealloc];
}

- (void)activateUIFeedback
{
}

- (void)beginShowingDragUIForInitialDragPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (![(CRLCanvasRepDragTracker *)self p_delegateIsHandlingDrag])
  {
    v6 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
    v7 = [v6 dynamicOperationController];
    if ([v7 isInPossibleDynamicOperation])
    {
    }
    else
    {
      v8 = [v6 dynamicOperationController];
      unsigned __int8 v9 = [v8 isInOperation];

      if ((v9 & 1) == 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1015004B0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010BD678();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1015004D0);
        }
        v10 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v10);
        }
        v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepDragTracker beginShowingDragUIForInitialDragPoint:]");
        v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m"];
        +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:205 isFatal:0 description:"showing UI for drag without being in some kind of dynamic operation"];
      }
    }
    self->mInitialDragPoint.CGFloat x = x;
    self->mInitialDragPoint.CGFloat y = y;
    v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mConnectedLineLayouts = self->mConnectedLineLayouts;
    self->mConnectedLineLayouts = v13;

    v15 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mParentLayoutsForInvalidatingForAncestorCollabCursors = self->mParentLayoutsForInvalidatingForAncestorCollabCursors;
    self->mParentLayoutsForInvalidatingForAncestorCollabCursors = v15;

    [(CRLCanvasRepDragTracker *)self didChangeCurrentlyTransformingReps];
    [(CRLCanvasRepDragTracker *)self p_updateGuides];
    [(CRLCanvasRepDragTracker *)self performSelector:"p_updateHUDFromTimer" withObject:0 afterDelay:0.2];
  }
}

- (void)endPossibleRepDragGesture
{
  id v4 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
  [(CRLCanvasRepDragTracker *)self p_hideHUD];
  [(CRLCanvasRepDragTracker *)self p_hideGuideRenderable];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  objc_super v3 = [v4 guideController];
  [v3 endAlignmentOperation];

  if (self->mGuideRenderable) {
    [v4 removeDecorator:self];
  }
}

- (BOOL)insertInfosAndUpdateDragForDuplicatingDragIfAppropriate
{
  v2 = self;
  if (self->mDidDuplicateWhenDragBegan)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015004F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BD788();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500510);
    }
    objc_super v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepDragTracker insertInfosAndUpdateDragForDuplicatingDragIfAppropriate]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:271 isFatal:0 description:"Should only call insertInfosAndUpdateDragForDuplicatingDragIfAppropriate once!"];
  }
  if (![(CRLCanvasRepDragTracker *)v2 p_delegateIsHandlingDrag])
  {
    v6 = [(CRLCanvasRep *)v2->mRep interactiveCanvasController];
    v7 = [v6 canvasEditor];
    v8 = [(CRLCanvasRepDragTracker *)v2 rep];
    unsigned __int8 v9 = [v6 selectionModelTranslator];
    v10 = [v6 editorController];
    v11 = [v10 selectionPath];
    v12 = [v9 unlockedBoardItemsForSelectionPath:v11];

    v13 = 0;
    if ([v7 canvasEditorCanOptionDragDuplicateWithSender:0])
    {
      if ([v12 count])
      {
        v14 = [v6 commandController];
        [v14 openGroup];
        [v14 enableProgressiveEnqueuingInCurrentGroup];
        v2->mDidDuplicateWhenDragBegan = 1;
        v15 = [v7 canvasEditorHelper];
        v13 = [v15 insertCopiesOfInfos:v12 forDuplicatingDragOnRep:v8];

        [v6 layoutIfNeeded];
        objc_super v16 = [v7 selectionPathWithInfos:v13];
        v17 = [v6 editorController];
        [v17 setSelectionPath:v16];
      }
      else
      {
        v13 = 0;
      }
    }
    id v54 = objc_alloc_init((Class)NSMutableSet);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v18 = v12;
    id v19 = [v18 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v60;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v60 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [v6 repForInfo:*(void *)(*((void *)&v59 + 1) + 8 * i)];
          if (v23) {
            [v54 addObject:v23];
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v20);
    }

    v24 = [v6 dynamicOperationController];
    [v24 stopTransformingReps:v54];

    v52 = v13;
    if ([v13 count])
    {
      v50 = v7;
      v51 = v2;
      v25 = [v6 topLevelZOrderedSiblingsOfInfos:v18];
      v26 = [v25 crl_arrayWithObjectsInSet:v18];

      v27 = [v8 info];
      v47 = v26;
      id v28 = [v26 indexOfObjectIdenticalTo:v27];

      id v53 = v28;
      if (v28 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_101500530);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010BD700();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_101500550);
        }
        v29 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v29);
        }
        v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepDragTracker insertInfosAndUpdateDragForDuplicatingDragIfAppropriate]");
        v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m"];
        +[CRLAssertionHandler handleFailureInFunction:v30 file:v31 lineNumber:319 isFatal:0 description:"Unable to find index!"];
      }
      id v48 = v18;
      v49 = v8;
      v32 = [v6 topLevelZOrderedSiblingsOfInfos:v13];
      v33 = [v32 crl_arrayWithObjectsInSet:v13];

      id v34 = objc_alloc_init((Class)NSMutableSet);
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v35 = v13;
      id v36 = [v35 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v36)
      {
        id v37 = v36;
        v38 = 0;
        uint64_t v39 = *(void *)v56;
        do
        {
          for (j = 0; j != v37; j = (char *)j + 1)
          {
            if (*(void *)v56 != v39) {
              objc_enumerationMutation(v35);
            }
            uint64_t v41 = *(void *)(*((void *)&v55 + 1) + 8 * (void)j);
            v42 = [v6 repForInfo:v41 createIfNeeded:1];
            if (v42) {
              [v34 addObject:v42];
            }
            if ([v33 indexOfObjectIdenticalTo:v41] == v53)
            {
              id v43 = v42;

              v38 = v43;
            }
          }
          id v37 = [v35 countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v37);
      }
      else
      {
        v38 = 0;
      }

      v44 = v34;
      if ([v34 count])
      {
        v45 = [v6 dynamicOperationController];
        [v45 startTransformingReps:v34];
      }
      v7 = v50;
      v2 = v51;
      id v18 = v48;
      if (v38) {
        [(CRLCanvasRepDragTracker *)v51 setRep:v38];
      }

      v8 = v49;
    }
    else
    {
      v38 = 0;
    }
  }
  return v2->mDidDuplicateWhenDragBegan;
}

- (void)addUnscaledDragDelta:(CGPoint)a3 roundDeltaToViewScale:(BOOL)a4
{
  self->mRoundDragDelta = a4;
  self->mUnscaledDragDelta.CGFloat x = sub_100064698(self->mUnscaledDragDelta.x, self->mUnscaledDragDelta.y, a3.x);
  self->mUnscaledDragDelta.CGFloat y = v5;
}

- (void)setActualDragPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (!self->mHaveSetPreviousActualDragPoint) {
    self->mPreviousActualDragPoint = self->mActualDragPoint;
  }
  id v8 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
  [v8 convertBoundsToUnscaledPoint:x, y];
  self->mActualDragPoint.double x = v6;
  self->mActualDragPoint.double y = v7;
}

- (void)setLogicalDragPoint:(CGPoint)a3
{
  self->mLogicalDragPoint = a3;
}

- (void)setShouldConstrain:(BOOL)a3
{
  if (self->mShouldConstrain != a3)
  {
    self->mShouldConstrain = a3;
    if (!self->mDidBeginDrag)
    {
      if (a3)
      {
        if (!self->mConstraintGuidesShowing) {
          [(CRLCanvasRepDragTracker *)self p_showGuideRenderable];
        }
      }
      else if (self->mConstraintGuidesShowing)
      {
        [(CRLCanvasRepDragTracker *)self p_hideGuideRenderable];
      }
    }
  }
}

- (void)setSnapLevel:(double)a3
{
  if (a3 != 0.0 && !self->mShouldConstrain)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500570);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BD810();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500590);
    }
    CGFloat v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    CGFloat v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepDragTracker setSnapLevel:]");
    CGFloat v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:380 isFatal:0 description:"non-zero snap level when we aren't constraining the drag. that doesn't make sense."];
  }
  if (self->mSnapLevel != a3) {
    self->mSnapLevel = a3;
  }
}

- (void)setConstrainingPoint:(CGPoint)a3
{
  self->mConstrainingPoint = a3;
}

- (void)preventOpeningCommandGroupWhenCommittingChangesForReps
{
  self->mPreventOpeningCommandGroupWhenCommittingChangesForReps = 1;
}

- (void)p_didBeginDrag
{
  if (!self->mDidBeginDrag)
  {
    self->mDidBeginDrag = 1;
    id v5 = [(CRLCanvasRepDragTracker *)self rep];
    v2 = [v5 interactiveCanvasController];
    objc_super v3 = [v2 layerHost];
    id v4 = [v3 asiOSCVC];
    [v4 hideEditMenu];
  }
}

- (void)setShouldShowGuides:(BOOL)a3
{
  self->mShouldShowGuides = a3;
  BOOL v3 = self->mShowDragHUD || !a3;
  if (!v3 && ![(CRLCanvasRepDragTracker *)self shouldSnapToGuides]) {
    self->mShowDragHUD = 1;
  }
}

- (void)willBeginDynamicOperationForReps:(id)a3
{
  if (!self->mIsEnqueueingCommandsInRealTime)
  {
    id v4 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
    if ([v4 shouldSupportedDynamicOperationsEnqueueCommandsInRealTime])
    {
      unsigned int v5 = [(CRLCanvasRep *)self->mRep allowsSupportedDynamicOperationsToBeRealTime];

      if (!v5) {
        goto LABEL_6;
      }
      CGFloat v6 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
      id v4 = [v6 commandController];

      [v4 openGroup];
      [v4 enableRealTimeSyncProgressiveEnqueuingInCurrentGroup];
      self->mIsEnqueueingCommandsInRealTime = 1;
    }
  }
LABEL_6:

  [(CRLCanvasRepDragTracker *)self p_delegateIsHandlingDrag];
}

- (void)changeDynamicLayoutsForReps:(id)a3
{
  id v198 = a3;
  if (self->mDidBeginDrag
    || (self->mUnscaledDragDelta.x == CGPointZero.x ? (BOOL v4 = self->mUnscaledDragDelta.y == CGPointZero.y) : (BOOL v4 = 0), !v4))
  {
    v212 = self;
    v199 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
    if (self->mRoundDragDelta)
    {
      [v199 viewScale];
      double x = self->mUnscaledDragDelta.x;
      double y = self->mUnscaledDragDelta.y;
      double v8 = sub_100067528(x, y, v7);
      double v10 = v9;
    }
    else
    {
      double v8 = self->mUnscaledDragDelta.x;
      double v10 = self->mUnscaledDragDelta.y;
      double x = v8;
      double y = v10;
    }
    self->mUnscaledDragDelta.double x = sub_100064680(x, y, v8);
    self->mUnscaledDragDelta.double y = v11;
    [(CRLCanvasRepDragTracker *)self p_didBeginDrag];
    if ([(CRLCanvasRepDragTracker *)self p_delegateIsHandlingDrag])
    {
LABEL_216:
      self->mPreviousActualDragPoint = self->mActualDragPoint;
      self->mHaveSetPreviousActualDragPoint = 1;

      goto LABEL_217;
    }
    unsigned int v12 = [(CRLCanvasRepDragTracker *)self shouldSnapToGuides];
    if (v12)
    {
      double v13 = fabs(v10);
      if (fabs(v8) >= 6.0)
      {
        unsigned int v215 = [(CRLCanvasRepDragTracker *)self shouldShowGuides];
        int v15 = 0;
        unsigned __int8 v210 = 1;
        BOOL v14 = v13 < 6.0;
      }
      else
      {
        unsigned int v215 = 1;
        BOOL v14 = v13 < 6.0;
        int v15 = 1;
        unsigned __int8 v210 = 1;
      }
      int v16 = 1;
      unsigned int v216 = 1;
      if (v14)
      {
LABEL_17:
        int v206 = v16;
        long long v256 = 0u;
        long long v257 = 0u;
        long long v254 = 0u;
        long long v255 = 0u;
        id v17 = v198;
        id v18 = [v17 countByEnumeratingWithState:&v254 objects:v278 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v255;
          while (2)
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v255 != v19) {
                objc_enumerationMutation(v17);
              }
              uint64_t v21 = [(NSMapTable *)v212->mMapRepsToSnapOffsets objectForKey:*(void *)(*((void *)&v254 + 1) + 8 * i)];
              if (!v21)
              {
                [(NSMapTable *)v212->mMapRepsToSnapOffsets removeAllObjects];
                goto LABEL_27;
              }
            }
            id v18 = [v17 countByEnumeratingWithState:&v254 objects:v278 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }
LABEL_27:

        long long v252 = 0u;
        long long v253 = 0u;
        long long v250 = 0u;
        long long v251 = 0u;
        id v22 = v17;
        id v23 = [v22 countByEnumeratingWithState:&v250 objects:v277 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v251;
          do
          {
            for (j = 0; j != v23; j = (char *)j + 1)
            {
              if (*(void *)v251 != v24) {
                objc_enumerationMutation(v22);
              }
              v26 = *(void **)(*((void *)&v250 + 1) + 8 * (void)j);
              if (([v26 isBeingDragged] & 1) == 0) {
                [v26 dynamicDragDidBegin];
              }
            }
            id v23 = [v22 countByEnumeratingWithState:&v250 objects:v277 count:16];
          }
          while (v23);
        }

        v197 = [v199 commandController];
        v27 = v212;
        if (v212->mIsEnqueueingCommandsInRealTime)
        {
          [v197 openGroup];
          v27 = v212;
        }
        v209 = [(CRLCanvasRepDragTracker *)v27 repsForGuidesWhenManipulatingReps:v22];
        long long v248 = 0u;
        long long v249 = 0u;
        long long v246 = 0u;
        long long v247 = 0u;
        id v28 = v22;
        id v29 = [v28 countByEnumeratingWithState:&v246 objects:v276 count:16];
        double v31 = CGRectZero.origin.x;
        double v30 = CGRectZero.origin.y;
        double width = CGRectZero.size.width;
        double rect = CGRectZero.size.height;
        if (v29)
        {
          uint64_t v32 = *(void *)v247;
          do
          {
            for (k = 0; k != v29; k = (char *)k + 1)
            {
              if (*(void *)v247 != v32) {
                objc_enumerationMutation(v28);
              }
              id v34 = *(void **)(*((void *)&v246 + 1) + 8 * (void)k);
              id v35 = [v34 layout];
              id v36 = [(NSMapTable *)v212->mMapRepsToSnapOffsets objectForKey:v34];
              id v37 = v36;
              double v38 = CGPointZero.x;
              if (v36)
              {
                [v36 CGPointValue];
                double v38 = v39;
              }
              double v40 = sub_100064680(v8, v10, v38);
              double v42 = v41;
              if ([v34 shouldShowSizesInRulers]
                && [v209 containsObject:v34])
              {
                [v34 snapRectForDynamicDragWithOffset:v40, v42];
                double v31 = sub_100064F28(v31, v30, width, rect, v43, v44, v45, v46);
                double v30 = v47;
                double width = v48;
                double rect = v49;
              }
              [v35 dragByUnscaled:v40, v42];
            }
            id v29 = [v28 countByEnumeratingWithState:&v246 objects:v276 count:16];
          }
          while (v29);
        }

        if (v212->mIsEnqueueingCommandsInRealTime) {
          [v197 closeGroup];
        }
        double v51 = CGPointZero.x;
        double v50 = CGPointZero.y;
        double v205 = v50;
        if (v212->mShouldConstrain)
        {
          [(CRLCanvasRep *)v212->mRep i_dragOffset];
          double v53 = v52;
          double v55 = v54;
          double v56 = sub_100065398(v52, v54);
          unsigned int v57 = +[UIDevice crl_phoneUI];
          [v199 viewScale];
          if (v56 == 0.0)
          {
            long long v59 = v212;
            v212->double mConstraintAngle = -1.0;
            double mConstraintAngle = -1.0;
          }
          else
          {
            double v61 = 200.0;
            if (v57) {
              double v61 = 50.0;
            }
            long long v59 = v212;
            if (v56 > v61 / v58 || (double mConstraintAngle = v212->mConstraintAngle, mConstraintAngle < 0.0))
            {
              double v62 = acos(v53 / v56);
              if (v55 < 0.0) {
                double v62 = 6.28318531 - v62;
              }
              double mConstraintAngle = round(v62 / 0.785398163) * 0.785398163;
              v212->double mConstraintAngle = mConstraintAngle;
            }
          }
          __double2 v63 = __sincos_stret(mConstraintAngle);
          double v64 = sub_10006468C(v63.__cosval, v63.__sinval, v53, v55);
          double v65 = sub_1000646A4(v63.__cosval, v63.__sinval, v64);
          double mSnapLevel = v59->mSnapLevel;
          if (mSnapLevel != 0.0)
          {
            double v65 = mSnapLevel * round(v65 / mSnapLevel);
            double v66 = mSnapLevel * round(v66 / mSnapLevel);
          }
          double v51 = sub_100064680(v65, v66, v53);
          double v50 = v68;
          double v31 = sub_100064698(v31, v30, v51);
          double v30 = v69;
        }
        uint64_t v242 = 0;
        v243 = &v242;
        uint64_t v244 = 0x2020000000;
        char v245 = 0;
        v70 = [v28 allObjects];
        v241[0] = _NSConcreteStackBlock;
        v241[1] = 3221225472;
        v241[2] = sub_1004DC0CC;
        v241[3] = &unk_1015005B8;
        v241[4] = &v242;
        unsigned int v71 = [v70 crl_allObjectsPassTest:v241];

        double v73 = v205;
        double v72 = CGPointZero.x;
        if ((v12 & v71) == 1)
        {
          if (!v212->mShouldConstrain
            || v212->mSnapLevel == 0.0
            || (double v73 = v205,
                double v72 = CGPointZero.x,
                [v199 isCanvasBackgroundAlignmentSnappingEnabled]))
          {
            v74 = [v199 guideController];
            if ([v199 isCanvasBackgroundAlignmentSnappingEnabled]
              && [v28 count] == (id)1)
            {
              v75 = [v28 anyObject];
              uint64_t v76 = objc_opt_class();
              v77 = [v75 layout];
              v78 = sub_1002469D0(v76, v77);

              if (v78 && [v78 pathIsLineSegment])
              {
                uint64_t v79 = objc_opt_class();
                v80 = [v75 layout];
                v81 = sub_1002469D0(v79, v80);

                if (v81 && ([v81 isStraightLine] & 1) == 0)
                {
                  [v74 snapRectToGuides:0 forKnobTag:1 snapSize:1 snapWithBackgroundAlignmentProvider:0 isLine:1 startPoint:CGPointZero.x endPoint:v205];
                }
                else
                {
                  [v78 tailPoint];
                  [v78 convertNaturalPointToUnscaledCanvas:];
                  double v83 = v82;
                  double v85 = v84;
                  [v78 headPoint];
                  [v78 convertNaturalPointToUnscaledCanvas:];
                  [v74 snapRectToGuides:0 forKnobTag:1 snapSize:1 snapWithBackgroundAlignmentProvider:1 v31, v30, width, rect, v83, v85, v86, v87];
                }
                double v72 = v88;
                double v73 = v89;
              }
              else
              {
                LOBYTE(v196) = *((unsigned char *)v243 + 24) == 0;
                [v74 snapRectToGuides:0 forKnobTag:1 snapSize:1 snapWithBackgroundAlignmentProvider:0 isLine:0 startPoint:CGPointZero.x endPoint:v205 hasHorizontalFlip:0 hasVerticalFlip:v196];
                double v72 = v93;
                double v73 = v94;
              }
            }
            else
            {
              id v90 = [v199 isCanvasBackgroundAlignmentSnappingEnabled];
              LOBYTE(v196) = *((unsigned char *)v243 + 24) == 0;
              [v74 snapRectToGuides:0 forKnobTag:1 snapSize:v90 snapWithBackgroundAlignmentProvider:0 isLine:0 startPoint:v31 endPoint:v30 width:width rect:rect startPoint:CGPointZero.x endPoint:v205 hasHorizontalFlip:v205 hasVerticalFlip:v196];
              double v72 = v91;
              double v73 = v92;
            }
            v95 = +[NSMutableArray array];
            long long v239 = 0u;
            long long v240 = 0u;
            long long v237 = 0u;
            long long v238 = 0u;
            id v96 = v28;
            id v97 = [v96 countByEnumeratingWithState:&v237 objects:v275 count:16];
            if (v97)
            {
              uint64_t v98 = *(void *)v238;
              do
              {
                for (m = 0; m != v97; m = (char *)m + 1)
                {
                  if (*(void *)v238 != v98) {
                    objc_enumerationMutation(v96);
                  }
                  v100 = [*(id *)(*((void *)&v237 + 1) + 8 * (void)m) additionalRectsForSnappingWithOffset:v51, v50];
                  [v95 addObjectsFromArray:v100];
                }
                id v97 = [v96 countByEnumeratingWithState:&v237 objects:v275 count:16];
              }
              while (v97);
            }

            if ([v95 count])
            {
              unsigned int v101 = [v74 didJustSnapInX];
              unsigned int v102 = [v74 didJustSnapInY];
              char v103 = v102;
              if (v101) {
                double v104 = v72;
              }
              else {
                double v104 = 1.79769313e308;
              }
              long long v235 = 0u;
              long long v236 = 0u;
              if (v102) {
                double v105 = v73;
              }
              else {
                double v105 = 1.79769313e308;
              }
              long long v233 = 0uLL;
              long long v234 = 0uLL;
              id v106 = v95;
              id v107 = [v106 countByEnumeratingWithState:&v233 objects:v274 count:16];
              int v203 = v15;
              if (v107)
              {
                uint64_t v108 = *(void *)v234;
                do
                {
                  for (n = 0; n != v107; n = (char *)n + 1)
                  {
                    if (*(void *)v234 != v108) {
                      objc_enumerationMutation(v106);
                    }
                    [*(id *)(*((void *)&v233 + 1) + 8 * (void)n) CGRectValue];
                    [v74 snapRectToGuides];
                    double v111 = v110;
                    double v113 = v112;
                    unsigned __int8 v114 = [v74 didJustSnapInX];
                    unsigned __int8 v115 = [v74 didJustSnapInY];
                    char v116 = v114 & (v111 < v104);
                    if (v116) {
                      double v104 = v111;
                    }
                    LOBYTE(v101) = v116 | v101;
                    v103 |= v115 & (v113 < v105);
                    if ((v115 & (v113 < v105)) != 0) {
                      double v105 = v113;
                    }
                  }
                  id v107 = [v106 countByEnumeratingWithState:&v233 objects:v274 count:16];
                }
                while (v107);
              }

              int v15 = v203;
              [v74 setDidJustSnapInX:v101 & 1];
              if (v105 == 1.79769313e308) {
                double v73 = 0.0;
              }
              else {
                double v73 = v105;
              }
              if (v104 == 1.79769313e308) {
                double v72 = 0.0;
              }
              else {
                double v72 = v104;
              }
              [v74 setDidJustSnapInY:v103 & 1];
            }
            v117 = [v199 canvasBackground];
            v118 = [v117 alignmentProvider];
            unsigned int v119 = [v199 isCanvasBackgroundAlignmentSnappingEnabled];
            if (v118) {
              unsigned int v120 = v119;
            }
            else {
              unsigned int v120 = 0;
            }
            if (!(v15 | v120)) {
              double v72 = 0.0;
            }
            if (!(v206 | v120)) {
              double v73 = 0.0;
            }
          }
        }
        if (!v212->mShouldConstrain) {
          goto LABEL_163;
        }
        __double2 v121 = __sincos_stret(v212->mConstraintAngle);
        double sinval = v121.__sinval;
        if (v121.__cosval == 0.0 || fabs(v121.__cosval) < 0.00999999978)
        {
          BOOL v125 = 0;
          BOOL v126 = 0;
          BOOL v124 = v73 != 0.0;
          double v72 = 0.0;
        }
        else
        {
          if (fabs(v121.__sinval) < 0.00999999978 || v121.__sinval == 0.0) {
            double v73 = 0.0;
          }
          BOOL v124 = v73 != 0.0;
          BOOL v125 = v72 != 0.0;
          if (v72 == 0.0 || v73 == 0.0)
          {
            BOOL v126 = v72 != 0.0;
          }
          else
          {
            BOOL v126 = fabs(v72) < fabs(v73);
            BOOL v124 = 1;
            BOOL v125 = 1;
          }
        }
        double v72 = sub_100064698(v72, v73, v51);
        double v73 = v127;
        double v31 = sub_100064680(v31, v30, v51);
        double v30 = v128;
        [(CRLCanvasRep *)v212->mRep i_dragOffset];
        double v207 = v129;
        double v131 = sub_100064698(v129, v130, v72);
        double v133 = v132;
        double v134 = sub_100065398(v131, v132);
        double v135 = v134;
        if (!v125 && !v124)
        {
LABEL_161:
          if (v135 > 0.0)
          {
            double v150 = sub_10006468C(v121.__cosval, sinval, v131, v133);
            double v151 = sub_1000646A4(v121.__cosval, sinval, v150);
            double v72 = sub_100064680(v151, v152, v207);
            double v73 = v153;
          }
LABEL_163:
          [(NSMapTable *)v212->mMapRepsToSnapOffsets removeAllObjects];
          if (v212->mIsEnqueueingCommandsInRealTime) {
            [v197 openGroup];
          }
          long long v231 = 0u;
          long long v232 = 0u;
          long long v229 = 0u;
          long long v230 = 0u;
          id v154 = v28;
          id v155 = [v154 countByEnumeratingWithState:&v229 objects:v273 count:16];
          if (v155)
          {
            uint64_t v156 = *(void *)v230;
            do
            {
              for (ii = 0; ii != v155; ii = (char *)ii + 1)
              {
                if (*(void *)v230 != v156) {
                  objc_enumerationMutation(v154);
                }
                v158 = *(void **)(*((void *)&v229 + 1) + 8 * (void)ii);
                v159 = [v158 layout];
                [v159 dragByUnscaled:v72, v73];
                mMapRepsToSnapOffsets = v212->mMapRepsToSnapOffsets;
                v161 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v72, v73);
                [(NSMapTable *)mMapRepsToSnapOffsets setObject:v161 forKey:v158];
              }
              id v155 = [v154 countByEnumeratingWithState:&v229 objects:v273 count:16];
            }
            while (v155);
          }

          if (v212->mIsEnqueueingCommandsInRealTime) {
            [v197 closeGroup];
          }
          v279.origin.double x = v31;
          v279.origin.double y = v30;
          v279.size.double width = width;
          v279.size.double height = rect;
          CGRect v280 = CGRectOffset(v279, v72, v73);
          double v163 = v205;
          double v162 = CGPointZero.x;
          if (v210)
          {
            double v164 = v280.origin.x;
            double v165 = v280.origin.y;
            double v166 = v280.size.width;
            double height = v280.size.height;
            v168 = [v199 guideController];
            [v168 showGuidesAlignedWithRect:v215 shouldRenderX:v216 shouldRenderY:v164 v165 v166 height];
            [v168 setDoNotRemoveExistingGuidesWhenDisplaying:1];
            recta = v168;
            long long v227 = 0u;
            long long v228 = 0u;
            long long v225 = 0u;
            long long v226 = 0u;
            id obja = v154;
            id v204 = [obja countByEnumeratingWithState:&v225 objects:v272 count:16];
            if (v204)
            {
              uint64_t v202 = *(void *)v226;
              do
              {
                for (jj = 0; jj != v204; jj = (char *)jj + 1)
                {
                  if (*(void *)v226 != v202) {
                    objc_enumerationMutation(obja);
                  }
                  v169 = *(void **)(*((void *)&v225 + 1) + 8 * (void)jj);
                  v170 = [v169 additionalRectsForSnappingWithOffset:v162, v163];
                  long long v223 = 0u;
                  long long v224 = 0u;
                  long long v221 = 0u;
                  long long v222 = 0u;
                  id v171 = v170;
                  id v172 = [v171 countByEnumeratingWithState:&v221 objects:v271 count:16];
                  if (v172)
                  {
                    uint64_t v173 = *(void *)v222;
                    do
                    {
                      for (kk = 0; kk != v172; kk = (char *)kk + 1)
                      {
                        if (*(void *)v222 != v173) {
                          objc_enumerationMutation(v171);
                        }
                        [*(id *)(*((void *)&v221 + 1) + 8 * (void)kk) CGRectValue];
                        CGFloat v179 = v175;
                        CGFloat v180 = v176;
                        CGFloat v181 = v177;
                        CGFloat v182 = v178;
                        if (v177 <= 0.0 || v178 <= 0.0)
                        {
                          unsigned int v183 = +[CRLAssertionHandler _atomicIncrementAssertCount];
                          if (qword_101719A70 != -1) {
                            dispatch_once(&qword_101719A70, &stru_101500658);
                          }
                          v184 = off_10166B4A0;
                          if (os_log_type_enabled((os_log_t)v184, OS_LOG_TYPE_ERROR))
                          {
                            v282.origin.double x = v179;
                            v282.origin.double y = v180;
                            v282.size.double width = v181;
                            v282.size.double height = v182;
                            NSStringFromCGRect(v282);
                            id v189 = (id)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 67110402;
                            unsigned int v260 = v183;
                            __int16 v261 = 2082;
                            v262 = "-[CRLCanvasRepDragTracker changeDynamicLayoutsForReps:]";
                            __int16 v263 = 2082;
                            v264 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m";
                            __int16 v265 = 1024;
                            int v266 = 945;
                            __int16 v267 = 2112;
                            id v268 = v189;
                            __int16 v269 = 2112;
                            v270 = v169;
                            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v184, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid additional snapping rect %@ from rep %@! Ignoring.", buf, 0x36u);
                          }
                          if (qword_101719A70 != -1) {
                            dispatch_once(&qword_101719A70, &stru_101500678);
                          }
                          v185 = off_10166B4A0;
                          if (os_log_type_enabled((os_log_t)v185, OS_LOG_TYPE_ERROR))
                          {
                            v190 = +[CRLAssertionHandler packedBacktraceString];
                            *(_DWORD *)buf = 67109378;
                            unsigned int v260 = v183;
                            __int16 v261 = 2114;
                            v262 = v190;
                            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v185, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
                          }
                          v186 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepDragTracker changeDynamicLayoutsForReps:]");
                          v187 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m"];
                          v281.origin.double x = v179;
                          v281.origin.double y = v180;
                          v281.size.double width = v181;
                          v281.size.double height = v182;
                          v188 = NSStringFromCGRect(v281);
                          +[CRLAssertionHandler handleFailureInFunction:v186, v187, 945, 0, "Invalid additional snapping rect %@ from rep %@! Ignoring.", v188, v169 file lineNumber isFatal description];
                        }
                        else
                        {
                          [recta showGuidesAlignedWithRect:v215 shouldRenderX:v216 shouldRenderY:v175];
                        }
                      }
                      id v172 = [v171 countByEnumeratingWithState:&v221 objects:v271 count:16];
                    }
                    while (v172);
                  }

                  double v163 = v205;
                  double v162 = CGPointZero.x;
                }
                id v204 = [obja countByEnumeratingWithState:&v225 objects:v272 count:16];
              }
              while (v204);
            }

            v191 = recta;
            [recta setDoNotRemoveExistingGuidesWhenDisplaying:0];
          }
          else
          {
            v191 = [v199 guideController:v280.origin.x, v280.origin.y, v280.size.width, v280.size.height];
            [v191 hideAlignmentGuides];
          }

          if (v212->mShouldConstrain)
          {
            if (!v212->mConstraintGuidesShowing) {
              [(CRLCanvasRepDragTracker *)v212 p_showGuideRenderable];
            }
          }
          else if (v212->mConstraintGuidesShowing)
          {
            [(CRLCanvasRepDragTracker *)v212 p_hideGuideRenderable];
          }
          long long v219 = 0u;
          long long v220 = 0u;
          long long v217 = 0u;
          long long v218 = 0u;
          v192 = v212->mParentLayoutsForInvalidatingForAncestorCollabCursors;
          id v193 = [(NSMutableSet *)v192 countByEnumeratingWithState:&v217 objects:v258 count:16];
          if (v193)
          {
            uint64_t v194 = *(void *)v218;
            do
            {
              for (mm = 0; mm != v193; mm = (char *)mm + 1)
              {
                if (*(void *)v218 != v194) {
                  objc_enumerationMutation(v192);
                }
                [*(id *)(*((void *)&v217 + 1) + 8 * (void)mm) invalidateFrame];
              }
              id v193 = [(NSMutableSet *)v192 countByEnumeratingWithState:&v217 objects:v258 count:16];
            }
            while (v193);
          }

          -[CRLCanvasRepDragTracker p_updateHUDAtPoint:](v212, "p_updateHUDAtPoint:", v212->mLogicalDragPoint.x, v212->mLogicalDragPoint.y);
          _Block_object_dispose(&v242, 8);

          self = v212;
          goto LABEL_216;
        }
        if (v126)
        {
          if (v121.__cosval != 0.0)
          {
            double v136 = v131 / v121.__cosval;
LABEL_140:
            double v137 = fabs(v136);
LABEL_160:
            double v148 = v135;
            double v131 = sub_1000646A4(v131, v133, v137 / v135);
            double v133 = v149;
            double v135 = v148;
            double sinval = v121.__sinval;
            goto LABEL_161;
          }
          double obj = v134;
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1015005D8);
          }
          v138 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v138, OS_LOG_TYPE_ERROR)) {
            sub_1010BD8F8();
          }

          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1015005F8);
          }
          v139 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v139, OS_LOG_TYPE_ERROR))
          {
            v140 = +[CRLAssertionHandler packedBacktraceString];
            sub_1010BD898(v140);
          }

          v141 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepDragTracker changeDynamicLayoutsForReps:]");
          v142 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m"];
          +[CRLAssertionHandler handleFailureInFunction:v141 file:v142 lineNumber:791 isFatal:0 description:"prioritizing X offset with a unit direction that doesn't have an X value!"];
        }
        else
        {
          if (v121.__sinval != 0.0)
          {
            double v136 = v133 / v121.__sinval;
            goto LABEL_140;
          }
          double obj = v134;
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_101500618);
          }
          v143 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v143, OS_LOG_TYPE_ERROR)) {
            sub_1010BD980();
          }

          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_101500638);
          }
          v144 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v144, OS_LOG_TYPE_ERROR))
          {
            v145 = +[CRLAssertionHandler packedBacktraceString];
            sub_1010BD898(v145);
          }

          v146 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRepDragTracker changeDynamicLayoutsForReps:]");
          v147 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRepDragTracker.m"];
          +[CRLAssertionHandler handleFailureInFunction:v146 file:v147 lineNumber:799 isFatal:0 description:"prioritizing Y offset with a unit direction that doesn't have an Y value!"];
        }
        double v135 = obj;
        double v137 = obj;
        goto LABEL_160;
      }
    }
    else
    {
      unsigned __int8 v210 = [(CRLCanvasRepDragTracker *)self shouldShowGuides];
      unsigned int v215 = [(CRLCanvasRepDragTracker *)self shouldShowGuides];
      int v15 = 0;
    }
    unsigned int v216 = [(CRLCanvasRepDragTracker *)self shouldShowGuides];
    int v16 = 0;
    goto LABEL_17;
  }
LABEL_217:
}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return self->mDidBeginDrag
      && !self->mPreventOpeningCommandGroupWhenCommittingChangesForReps
      && !self->mDidDuplicateWhenDragBegan
      && !self->mIsEnqueueingCommandsInRealTime;
}

- (void)commitChangesForReps:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
  CGFloat v6 = [v5 commandController];
  [v6 openGroup];
  if (self->mDidDuplicateWhenDragBegan)
  {
    double v7 = +[NSBundle mainBundle];
    double v8 = v7;
    CFStringRef v9 = @"Duplicate";
  }
  else
  {
    if ([v4 count] == (id)1)
    {
      double v8 = [v4 anyObject];
      uint64_t v10 = [v8 actionStringForDrag];
      goto LABEL_7;
    }
    double v7 = +[NSBundle mainBundle];
    double v8 = v7;
    CFStringRef v9 = @"Move";
  }
  uint64_t v10 = [v7 localizedStringForKey:v9 value:0 table:@"UndoStrings"];
LABEL_7:
  CGFloat v11 = (void *)v10;
  [v6 setCurrentGroupActionString:v10];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v17, "isBeingDragged", (void)v21)) {
          [v17 dynamicDragDidEnd];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  [v6 closeGroup];
  if (self->mIsEnqueueingCommandsInRealTime)
  {
    id v18 = [CRLCanvasCommandSelectionBehavior alloc];
    uint64_t v19 = [v5 canvasEditor];
    id v20 = [(CRLCanvasCommandSelectionBehavior *)v18 initWithCanvasEditor:v19 type:2];

    [v6 closeGroupWithSelectionBehavior:v20];
  }
}

- (id)repsForGuidesWhenManipulatingReps:(id)a3
{
  id v3 = [a3 mutableCopy];

  return v3;
}

- (BOOL)supportsAlignmentGuides
{
  if ([(CRLCanvasRepDragTracker *)self p_delegateIsHandlingDrag]) {
    return 0;
  }
  else {
    return ![(CRLCanvasRepDragTracker *)self isArrowkeyDrivenTracking];
  }
}

- (BOOL)operationShouldBeDynamic
{
  return 1;
}

- (void)didChangeCurrentlyTransformingReps
{
  if (byte_1016A9DA8) {
    return;
  }
  byte_1016A9DA8 = 1;
  double v48 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
  id v3 = [v48 dynamicOperationController];
  id v4 = objc_alloc_init((Class)NSMutableSet);
  id v47 = objc_alloc_init((Class)NSMutableSet);
  unsigned int v5 = [v3 currentlyTransformingReps];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v61;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v61 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        if ([(CRLCanvasRepDragTracker *)self isDragInsertDrivenTracking]
          || ([v10 isSelected] & 1) != 0)
        {
          if ([v10 isSelected])
          {
            CGFloat v11 = [v10 additionalRepsForDragging];
            [v4 unionSet:v11];
          }
        }
        else
        {
          [v47 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v60 objects:v66 count:16];
    }
    while (v7);
  }
  [v47 minusSet:v4];
  [v4 minusSet:v5];
  if ([v4 count]) {
    [v3 startTransformingReps:v4];
  }
  if (objc_msgSend(v47, "count", v4)) {
    [v3 stopTransformingReps:v47];
  }
  double v45 = v3;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v5;
  id v12 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v57;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v57 != v14) {
          objc_enumerationMutation(obj);
        }
        int v16 = *(void **)(*((void *)&v56 + 1) + 8 * (void)j);
        id v17 = [v16 layout];
        id v18 = [v17 connectedLayouts];

        if (v18) {
          [(NSMutableSet *)self->mConnectedLineLayouts unionSet:v18];
        }
        uint64_t v19 = [v16 parentRep];
        if (v19)
        {
          id v20 = (void *)v19;
          while (![v20 shouldShowCollaboratorCursorHighlight])
          {
            uint64_t v21 = [v20 parentRep];

            id v20 = (void *)v21;
            if (!v21) {
              goto LABEL_31;
            }
          }
          mParentLayoutsForInvalidatingForAncestorCollabCursors = self->mParentLayoutsForInvalidatingForAncestorCollabCursors;
          long long v23 = [v16 parentRep];
          long long v24 = [v23 layout];
          [(NSMutableSet *)mParentLayoutsForInvalidatingForAncestorCollabCursors addObject:v24];
        }
LABEL_31:
      }
      id v13 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
    }
    while (v13);
  }
  v25 = obj;

  id v46 = objc_alloc_init((Class)NSMutableSet);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  double v50 = self->mConnectedLineLayouts;
  id v26 = [(NSMutableSet *)v50 countByEnumeratingWithState:&v52 objects:v64 count:16];
  v27 = v48;
  if (!v26) {
    goto LABEL_49;
  }
  id v28 = v26;
  uint64_t v29 = *(void *)v53;
  do
  {
    double v30 = 0;
    id v49 = v28;
    do
    {
      if (*(void *)v53 != v29) {
        objc_enumerationMutation(v50);
      }
      double v31 = *(void **)(*((void *)&v52 + 1) + 8 * (void)v30);
      [v31 checkConnections];
      uint64_t v32 = [v31 connectedTo];
      if (v32)
      {
        v33 = (void *)v32;
        id v34 = [v31 connectedFrom];

        if (v34)
        {
          uint64_t v35 = v29;
          id v36 = [v31 connectedTo];
          id v37 = [v36 info];
          double v38 = [v27 repForInfo:v37];
          if ([v25 containsObject:v38])
          {
            double v39 = [v31 connectedFrom];
            double v40 = [v39 info];
            double v41 = [v27 repForInfo:v40];
            unsigned int v42 = [obj containsObject:v41];

            v27 = v48;
            v25 = obj;

            uint64_t v29 = v35;
            id v28 = v49;
            if (!v42) {
              goto LABEL_47;
            }
            double v43 = [v31 info];
            id v36 = [v48 repForInfo:v43];

            if (v36) {
              [v46 addObject:v36];
            }
            v27 = v48;
          }
          else
          {

            uint64_t v29 = v35;
            id v28 = v49;
          }
        }
      }
LABEL_47:
      double v30 = (char *)v30 + 1;
    }
    while (v28 != v30);
    id v28 = [(NSMutableSet *)v50 countByEnumeratingWithState:&v52 objects:v64 count:16];
  }
  while (v28);
LABEL_49:

  if ([v46 count]) {
    [v45 startTransformingReps:v46];
  }
  byte_1016A9DA8 = 0;
}

- (BOOL)traceIfDesiredForBeginOperation
{
  if (qword_101719D30 != -1) {
    dispatch_once(&qword_101719D30, &stru_101500698);
  }
  v2 = off_10166EA00;
  if (os_log_type_enabled((os_log_t)off_10166EA00, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "begin drag operation", v4, 2u);
  }
  return 1;
}

- (BOOL)traceIfDesiredForEndOperation
{
  id v3 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
  id v4 = [v3 dynamicOperationController];
  unsigned int v5 = [v4 allTransformedReps];
  [(CRLCanvasRep *)self->mRep i_dragOffset];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  if (qword_101719D30 != -1) {
    dispatch_once(&qword_101719D30, &stru_1015006B8);
  }
  uint64_t v10 = off_10166EA00;
  if (os_log_type_enabled((os_log_t)off_10166EA00, OS_LOG_TYPE_INFO))
  {
    CGFloat v11 = v10;
    int v13 = 134218496;
    id v14 = [v5 count];
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "end drag operation for %zi reps. Offset (%f, %f)", (uint8_t *)&v13, 0x20u);
  }
  return 1;
}

- (NSArray)decoratorOverlayRenderables
{
  if (self->mConstraintGuidesShowing)
  {
    mGuideRenderable = self->mGuideRenderable;
    v2 = +[NSArray arrayWithObjects:&mGuideRenderable count:1];
  }
  else
  {
    v2 = &__NSArray0__struct;
  }

  return (NSArray *)v2;
}

- (BOOL)allowsDelegateToDisplayUIForDragOperation
{
  return 1;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null];
}

- (void)p_updateHUDFromTimer
{
}

- (void)p_updateHUDAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v38 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
  if (self->mShowDragHUD)
  {
    if ([(CRLCanvasRep *)self->mRep shouldShowDragHUD])
    {
      uint64_t v6 = [v38 dynamicOperationController];
      uint64_t v7 = [v6 currentlyTransformingReps];
      id v8 = [v7 count];

      if (v8 == (id)1)
      {
        [(CRLCanvasRepDragTracker *)self p_selectedInfosRect];
        double v10 = v9;
        double MinY = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        __int16 v17 = [v38 canvas];
        unsigned int v18 = [v17 isAnchoredAtRight];

        if (v18)
        {
          v40.origin.double x = v10;
          v40.origin.double y = MinY;
          v40.size.double width = v14;
          v40.size.double height = v16;
          double MaxX = CGRectGetMaxX(v40);
          v41.origin.double x = v10;
          v41.origin.double y = MinY;
          v41.size.double width = v14;
          v41.size.double height = v16;
          double MinY = CGRectGetMinY(v41);
          double v10 = -MaxX;
        }
        id v20 = [v38 unitStringForPoint:v10, MinY];
        uint64_t v21 = +[CRLCanvasHUDController sharedHUDController];
        [v21 setLabelText:v20];
        long long v22 = [v38 canvasView];
        [v21 showHUDForKey:self forTouchPoint:v22 inCanvasView:x y:y upwardsNudge:75.0];

        self->mHaveShownHUD = 1;
        goto LABEL_9;
      }
    }
  }
  if (self->mHaveShownHUD)
  {
    self->mHaveShownHUD = 0;
    id v20 = +[CRLCanvasHUDController sharedHUDController];
    [v20 hideHUDForKey:self];
LABEL_9:
  }
  if (self->mShouldConstrain
    && ![(CRLCanvasRepDragTracker *)self shouldSuppressConstrainingHUD])
  {
    double mConstraintAngle = self->mConstraintAngle;
    if (fabs(mConstraintAngle) >= 0.1
      && fabs(mConstraintAngle + -6.28318531) >= 0.1
      && fabs(mConstraintAngle + -3.14159265) >= 0.1)
    {
      if (fabs(mConstraintAngle + -1.57079633) >= 0.1 && fabs(mConstraintAngle + -4.71238898) >= 0.1)
      {
        if (self->mSnapLevel == 0.0)
        {
          long long v24 = +[NSBundle mainBundle];
          v25 = v24;
          CFStringRef v26 = @"Diagonal";
          goto LABEL_19;
        }
        id v28 = +[NSBundle mainBundle];
        v25 = v28;
        CFStringRef v29 = @"Diagonal %i pt";
      }
      else
      {
        if (self->mSnapLevel == 0.0)
        {
          long long v24 = +[NSBundle mainBundle];
          v25 = v24;
          CFStringRef v26 = @"Vertical";
          goto LABEL_19;
        }
        id v28 = +[NSBundle mainBundle];
        v25 = v28;
        CFStringRef v29 = @"Vertical %i pt";
      }
    }
    else
    {
      if (self->mSnapLevel == 0.0)
      {
        long long v24 = +[NSBundle mainBundle];
        v25 = v24;
        CFStringRef v26 = @"Horizontal";
LABEL_19:
        v27 = [v24 localizedStringForKey:v26 value:0 table:0];
LABEL_22:

        [(CRLCanvasHUDController *)self->mSecondHUDController setLabelText:v27];
        mSecondHUDController = self->mSecondHUDController;
        uint64_t v32 = [(CRLCanvasHUDController *)mSecondHUDController view];
        [v32 frame];
        double v34 = sub_100064698(self->mConstrainingPoint.x, self->mConstrainingPoint.y, (v33 + v33) / 5.0);
        double v36 = v35;
        id v37 = [v38 canvasView];
        -[CRLCanvasHUDController showHUDForKey:forTouchPoint:inCanvasView:withUpwardsNudge:](mSecondHUDController, "showHUDForKey:forTouchPoint:inCanvasView:withUpwardsNudge:", self, v37, v34, v36, 75.0);

        self->mHaveShownSecondHUD = 1;
        goto LABEL_23;
      }
      id v28 = +[NSBundle mainBundle];
      v25 = v28;
      CFStringRef v29 = @"Horizontal %i pt";
    }
    double v30 = [v28 localizedStringForKey:v29 value:0 table:0];
    v27 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v30, (int)self->mSnapLevel);

    goto LABEL_22;
  }
  if (self->mHaveShownSecondHUD)
  {
    self->mHaveShownSecondHUD = 0;
    [(CRLCanvasHUDController *)self->mSecondHUDController hideHUDForKey:self];
  }
LABEL_23:
}

- (void)p_hideHUD
{
  if (self->mHaveShownHUD)
  {
    self->mHaveShownHUD = 0;
    id v3 = +[CRLCanvasHUDController sharedHUDController];
    [v3 hideHUDForKey:self];
  }
  if (self->mHaveShownSecondHUD)
  {
    self->mHaveShownSecondHUD = 0;
    mSecondHUDController = self->mSecondHUDController;
    [(CRLCanvasHUDController *)mSecondHUDController hideHUDForKey:self];
  }
}

- (void)p_updateGuides
{
  id v4 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
  id v3 = [v4 guideController];
  [(CRLCanvasRepDragTracker *)self p_selectedInfosRect];
  [v3 showGuidesAlignedWithRect:1 shouldRenderX:1 shouldRenderY:1];
}

- (CGRect)p_selectedInfosRect
{
  v2 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v7 = [v2 dynamicOperationController];
  id v8 = [v7 currentlyTransformingReps];

  id v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v27;
    double v12 = CGPointZero.y;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        CGFloat v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v14 shouldShowSizesInRulers])
        {
          [v14 snapRectForDynamicDragWithOffset:CGPointZero.x, v12];
          double x = sub_100064F28(x, y, width, height, v15, v16, v17, v18);
          double y = v19;
          double width = v20;
          double height = v21;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (void)p_hideGuideRenderable
{
  self->mConstraintGuidesShowing = 0;
}

- (BOOL)p_delegateIsHandlingDrag
{
  return 0;
}

- (id)p_infosFromReps:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableSet) initWithCapacity:[v3 count]];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) info:(void)v12];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)p_repsForInfos:(id)a3 fromReps:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v14 = [v13 info:v17];
        unsigned int v15 = [v5 containsObject:v14];

        if (v15) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (BOOL)isEnqueueingCommandsInRealTime
{
  return self->mIsEnqueueingCommandsInRealTime;
}

- (BOOL)shouldSuppressConstrainingHUD
{
  return self->mShouldSuppressConstrainingHUD;
}

- (void)setShouldSuppressConstrainingHUD:(BOOL)a3
{
  self->mShouldSuppressConstrainingHUD = a3;
}

- (BOOL)didBeginDrag
{
  return self->mDidBeginDrag;
}

- (BOOL)isDragInsertDrivenTracking
{
  return self->mIsDragInsertDrivenTracking;
}

- (void)setIsDragInsertDrivenTracking:(BOOL)a3
{
  self->mIsDragInsertDrivenTracking = a3;
}

- (BOOL)showDragHUD
{
  return self->mShowDragHUD;
}

- (void)setShowDragHUD:(BOOL)a3
{
  self->mShowDragHUD = a3;
}

- (BOOL)shouldShowGuides
{
  return self->mShouldShowGuides;
}

- (BOOL)shouldSnapToGuides
{
  return self->mShouldSnapToGuides;
}

- (void)setShouldSnapToGuides:(BOOL)a3
{
  self->mShouldSnapToGuides = a3;
}

- (BOOL)isInspectorDrivenTracking
{
  return self->mIsInspectorDrivenTracking;
}

- (void)setIsInspectorDrivenTracking:(BOOL)a3
{
  self->mIsInspectorDrivenTracking = a3;
}

- (CRLCanvasRep)rep
{
  return self->mRep;
}

- (void)setRep:(id)a3
{
}

- (BOOL)isArrowkeyDrivenTracking
{
  return self->mIsArrowkeyDrivenTracking;
}

- (void)setIsArrowkeyDrivenTracking:(BOOL)a3
{
  self->mIsArrowkeyDrivenTracking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mImpactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->mParentLayoutsForInvalidatingForAncestorCollabCursors, 0);
  objc_storeStrong((id *)&self->mConnectedLineLayouts, 0);
  objc_storeStrong((id *)&self->mGuideRenderable, 0);
  objc_storeStrong((id *)&self->mMapRepsToSnapOffsets, 0);
  objc_storeStrong((id *)&self->mAutoscroll, 0);
  objc_storeStrong((id *)&self->mSecondHUDController, 0);

  objc_storeStrong((id *)&self->mRep, 0);
}

@end