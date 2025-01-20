@interface CRLFreehandDrawingRep
- (BOOL)accessibilityActivate;
- (BOOL)canOcclude;
- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4;
- (BOOL)containsPoint:(CGPoint)a3 withSlop:(CGSize)a4;
- (BOOL)crlaxAllowedToEditChildren;
- (BOOL)crlaxNeedsEditRotorMenu;
- (BOOL)directlyManagesLayerContent;
- (BOOL)drawsDescendantsIntoLayer;
- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)handledDirectTouchForDrawingModePencilOnlyAtPoint:(CGPoint)a3;
- (BOOL)handledLassoTapAtPoint:(CGPoint)a3 withInputType:(int64_t)a4;
- (BOOL)intersectsUnscaledRect:(CGRect)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)isInvisible;
- (BOOL)manuallyControlsMiniFormatter;
- (BOOL)p_canReceiveDropWithDragInfo:(id)a3;
- (BOOL)p_handledTapAtPoint:(CGPoint)a3;
- (BOOL)p_hasMathResultViews;
- (BOOL)p_isTrifurcatedRenderingEnabled;
- (BOOL)p_shouldAllowSetNeedsDisplay;
- (BOOL)p_shouldDrawShapeRep:(id)a3 withOtherShapeRep:(id)a4;
- (BOOL)p_shouldHideDataDetectors:(id)a3;
- (BOOL)p_wantsSixChannelLayer;
- (BOOL)p_wasDataDetectorStrokeRenderable:(id)a3 hitAtNaturalPoint:(CGPoint)a4;
- (BOOL)shouldShowKnobs;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)skipsRerenderForTranslation;
- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3;
- (BOOL)wantsToHandleTapsOnBehalfOfRepForSelecting;
- (BOOL)wantsToHandleTapsWhenLocked;
- (BOOL)wantsToManuallyHandleEditMenuTapAtPoint:(CGPoint)a3;
- (CGAffineTransform)p_fullTransformInRoot;
- (CGPoint)accessibilityActivationPoint;
- (CGPoint)parentScaledCanvasFrameOriginForTrifurcationContainer:(id)a3;
- (CGRect)clipRectInScaledCanvasForTrifurcationContainer:(id)a3;
- (CGRect)crlaxAttachedMathResultViewFrame;
- (CGRect)frameInUnscaledCanvas;
- (CGRect)frameInUnscaledCanvasForMarqueeSelecting;
- (CGRect)i_baseFrameInUnscaledCanvasForPositioningLayer;
- (CGRect)p_boundsForMathResultViews;
- (CGRect)p_boundsInNaturalSpaceForMathView:(id)a3;
- (CGRect)p_getUnRotatedFrameWithoutMathResults;
- (CRLBidirectionalMap)drawingShapeItemUUIDToStrokeDataUUIBidirectionalMap;
- (CRLFreehandDrawingLayout)p_freehandDrawingLayout;
- (CRLFreehandDrawingRep)initWithLayout:(id)a3 canvas:(id)a4;
- (CRLWidthLimitedQueue)queueForConcurrentlyDrawingChildrenIntoLayersIfSafe;
- (Class)layerClass;
- (NSArray)decoratorOverlayRenderables;
- (NSArray)decoratorOverlayViews;
- (NSSet)subscribedFreehandDrawingIDs;
- (NSString)crlaxRecognizedMathDescription;
- (PKDrawing)pkDrawing;
- (PKMathRecognitionController)pkMathRecognitionController;
- (PKRecognitionController)pkRecognitionController;
- (_TtC8Freeform30CRLMathRecognitionItemsHandler)p_mathRecognitionHandler;
- (double)canvasContentsScaleForTrifurcationContainer:(id)a3;
- (double)canvasViewScaleForTrifurcationContainer:(id)a3;
- (double)p_zPositionForSelectionHighlightLayer;
- (id)accessibilityCustomActions;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityHint;
- (id)additionalRenderablesOverRenderable;
- (id)additionalRepsForDraggingConnectionLine:(id)a3;
- (id)beginEditingChildrenIfAllowedAtUnscaledPoint:(CGPoint)a3 pickingDeepestChild:(BOOL)a4;
- (id)childRepsToInformForSelectabilityChanges;
- (id)createAdditionalBoardItemsForCopyImaging;
- (id)crlaxChildren;
- (id)dragAndDropHighlightRenderable;
- (id)dragItemsForBeginningDragOfChildRep:(id)a3;
- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4 passingTest:(id)a5;
- (id)p_baseMathView;
- (id)p_childrenToExcludeFromFlattenedDrawing;
- (id)p_freehandDrawingInfo;
- (id)p_ingestibleItemSourceForDragInfo:(id)a3;
- (id)p_makeDataDetectorRenderables:(id)a3;
- (id)p_selectionPath;
- (id)p_shapeChildrenForDrawingRecursively;
- (id)p_trifurcationContainer;
- (id)unscaledPathToIncludeForSystemPreviewOutline;
- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4;
- (void)becameNotSelected;
- (void)becameSelected;
- (void)beginTrifurcatedRenderForChildRep:(id)a3;
- (void)didAddSixChannelEnabledChildRep:(id)a3;
- (void)didAddSixChannelSuppressingChildRep:(id)a3;
- (void)didEndZoomingOperation;
- (void)didEnterBackground;
- (void)didProcessAllChanges;
- (void)didRemoveSixChannelEnabledChildRep:(id)a3;
- (void)didRemoveSixChannelSuppressingChildRep:(id)a3;
- (void)didUpdateChildLayers;
- (void)didUpdateMathResultView;
- (void)didUpdateRenderable:(id)a3;
- (void)didUpdateShouldSolveMathForTriggerStroke:(id)a3 shouldSolveMath:(BOOL)a4 undoable:(BOOL)a5;
- (void)documentModeDidChange;
- (void)drawShapeReps:(id)a3 intoContext:(CGContext *)a4 forLayer:(id)a5 inTrifurcationContainer:(id)a6;
- (void)dynamicFreeTransformDidEndWithTracker:(id)a3;
- (void)dynamicOperationDidEnd;
- (void)dynamicResizeDidEndWithTracker:(id)a3;
- (void)endTrifurcatedRenderForChildRep:(id)a3;
- (void)handleEditMenuTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (void)p_addDataDetectorInteractionIfNeeded;
- (void)p_concatenatePathDrawChildShapeReps:(id)a3 togetherInContext:(CGContext *)a4;
- (void)p_drawChildShapeReps:(id)a3 togetherInContext:(CGContext *)a4;
- (void)p_drawChildShapeRepsWithPencilKitStrokes:(id)a3 togetherInContext:(CGContext *)a4;
- (void)p_drawShapeChildren:(id)a3 inContext:(CGContext *)a4;
- (void)p_hideMiniFormatter;
- (void)p_initializePKRecognitionSessionAndSetupMathAndDataRecognitionWithDrawing:(id)a3;
- (void)p_invokeDataDetectorIfDetectorRenderableIsTapped:(CGPoint)a3 detectorRenderables:(id)a4;
- (void)p_removeDataDetectorInteraction;
- (void)p_removeSubselectionAffordanceIfNeeded;
- (void)p_requestNewMathRecognitionHandler;
- (void)p_resetMathRecognitionHandlerIfRequestedAndEnabled;
- (void)p_selectionOrSelectedInfosChanged;
- (void)p_setupMathPaperAndDataRecognition;
- (void)p_showMiniFormatter;
- (void)p_showSubselectionAffordanceForInfos:(id)a3;
- (void)p_suspensionStatusChanged;
- (void)p_toggleMiniFormatter;
- (void)p_updateBaseMathViewIfNeeded;
- (void)p_updateDataDetectionItemsAndInteraction;
- (void)p_updateLayoutBoundsForMathResultView;
- (void)p_updatePKRecognitionControllerWithStrokes:(id)a3 useCachedSession:(BOOL)a4;
- (void)p_updateSubselectionAffordance;
- (void)pkStrokesForFreehandItemsDidChange:(id)a3;
- (void)processChangedProperty:(unint64_t)a3;
- (void)processChanges:(id)a3 forChangeSource:(id)a4;
- (void)recursivelyDrawChildrenInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4;
- (void)removeDrawingShapeItemUUIDToStrokeDataUUIDPair:(id)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setupDrawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap;
- (void)suppressionOfFreehandContentDidChange;
- (void)updateDrawingShapeItemUUIDToStrokeDataUUIDDict:(id)a3;
- (void)updateFromLayout;
- (void)updateRenderableGeometryFromLayout:(id)a3;
- (void)viewScaleDidChange;
- (void)viewScrollDidChange;
- (void)viewScrollingEnded;
- (void)willBeRemoved;
- (void)willEnterForeground;
- (void)willUpdateChildLayers;
@end

@implementation CRLFreehandDrawingRep

- (CRLFreehandDrawingRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v6 = a4;
  v49.receiver = self;
  v49.super_class = (Class)CRLFreehandDrawingRep;
  v7 = [(CRLCanvasRep *)&v49 initWithLayout:a3 canvas:v6];
  if (v7 && [v6 isCanvasInteractive])
  {
    v8 = +[NSNotificationCenter defaultCenter];
    v9 = +[CRLMathCalculationController mathHintsModeChangedNotificationName];
    [v8 addObserver:v7 selector:"p_mathHintsModeChanged" name:v9 object:0];

    v10 = +[NSNotificationCenter defaultCenter];
    v11 = +[CRLMathCalculationController mathHintsSuspensionStatusChangedNotificationName];
    [v10 addObserver:v7 selector:"p_suspensionStatusChanged" name:v11 object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    v13 = [(CRLCanvasRep *)v7 interactiveCanvasController];
    v14 = [v13 editorController];
    [v12 addObserver:v7 selector:"p_selectionOrSelectedInfosChanged" name:@"CRLEditorControllerSelectionPathDidChangeNotification" object:v14];

    uint64_t v15 = +[NSSet set];
    currentlySelectedInfosShowingAffordance = v7->_currentlySelectedInfosShowingAffordance;
    v7->_currentlySelectedInfosShowingAffordance = (NSSet *)v15;

    v17 = [(CRLCanvasRep *)v7 canvas];
    v44 = _NSConcreteStackBlock;
    uint64_t v45 = 3221225472;
    v46 = sub_1001A054C;
    v47 = &unk_1014CBBB0;
    v18 = v7;
    v48 = v18;
    [v17 performBlockAfterLayoutIfNecessary:&v44];

    uint64_t v19 = +[NSMutableSet set];
    childRepsForTrifurcation = v18->_childRepsForTrifurcation;
    v18->_childRepsForTrifurcation = (NSMutableSet *)v19;

    uint64_t v21 = +[NSMutableSet set];
    childRepsWithSixChannelRenderEnabled = v18->_childRepsWithSixChannelRenderEnabled;
    v18->_childRepsWithSixChannelRenderEnabled = (NSMutableSet *)v21;

    uint64_t v23 = +[NSMutableSet set];
    childRepsSuppressingSixChannelRender = v18->_childRepsSuppressingSixChannelRender;
    v18->_childRepsSuppressingSixChannelRender = (NSMutableSet *)v23;

    v25 = [(CRLFreehandDrawingRep *)v18 p_freehandDrawingInfo];
    id v26 = objc_alloc((Class)NSSet);
    v27 = [v25 id];
    v28 = [v26 initWithObjects:v27, 0, v44, v45, v46, v47];
    subscribedFreehandDrawingIDs = v18->_subscribedFreehandDrawingIDs;
    v18->_subscribedFreehandDrawingIDs = v28;

    v30 = [(CRLCanvasRep *)v18 interactiveCanvasController];
    v31 = [v30 pkDrawingProvider];

    if (v31)
    {
      v32 = [(CRLCanvasRep *)v18 interactiveCanvasController];
      v33 = [v32 pkDrawingProvider];
      [v33 addPKDrawingsObserver:v18];

      v34 = [(CRLCanvasRep *)v18 interactiveCanvasController];
      v35 = [v34 pkDrawingProvider];
      v36 = [v25 id];
      v37 = [v35 pkStrokesForFreehandDrawingItemID:v36];

      v38 = [v25 cachedPKDrawing];
      [(CRLFreehandDrawingRep *)v18 p_updatePKRecognitionControllerWithStrokes:v37 useCachedSession:v38 != 0];

      if (v37 && [v37 count])
      {
        v39 = [(CRLFreehandDrawingRep *)v18 p_freehandDrawingInfo];
        if ([v39 prohibitsClustering])
        {
        }
        else
        {
          v40 = [(CRLFreehandDrawingRep *)v18 p_freehandDrawingInfo];
          v41 = [v40 pkRecognitionController];
          v42 = [v41 dataDetectorController];

          if (v42) {
            [(CRLFreehandDrawingRep *)v18 p_updateDataDetectionItemsAndInteraction];
          }
        }
      }
    }
  }

  return v7;
}

- (id)p_freehandDrawingInfo
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLCanvasRep *)self info];
  v5 = sub_1002469D0(v3, v4);

  return v5;
}

- (BOOL)isInvisible
{
  return ![(CRLFreehandDrawingRep *)self drawsDescendantsIntoLayer];
}

- (BOOL)canOcclude
{
  return 1;
}

- (void)willBeRemoved
{
  uint64_t v3 = [(CRLCanvasRep *)self canvas];
  unsigned int v4 = [v3 isCanvasInteractive];

  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    id v6 = +[CRLMathCalculationController mathHintsModeChangedNotificationName];
    [v5 removeObserver:self name:v6 object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    v8 = +[CRLMathCalculationController mathHintsSuspensionStatusChangedNotificationName];
    [v7 removeObserver:self name:v8 object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    v10 = [(CRLCanvasRep *)self interactiveCanvasController];
    v11 = [v10 editorController];
    [v9 removeObserver:self name:@"CRLEditorControllerSelectionPathDidChangeNotification" object:v11];

    [(NSMutableSet *)self->_childRepsForTrifurcation removeAllObjects];
    [(CRLFreehandDrawingRepTrifurcationContainer *)self->_activeTrifurcationContainer tearDown];
    activeTrifurcationContainer = self->_activeTrifurcationContainer;
    self->_activeTrifurcationContainer = 0;

    [(NSMutableSet *)self->_childRepsWithSixChannelRenderEnabled removeAllObjects];
    [(NSMutableSet *)self->_childRepsSuppressingSixChannelRender removeAllObjects];
    v13 = [(CRLCanvasRep *)self interactiveCanvasController];
    v14 = [v13 pkDrawingProvider];
    [v14 removePKDrawingsObserver:self];
  }
  [(CRLFreehandDrawingRep *)self p_removeSubselectionAffordanceIfNeeded];
  if (+[CRLFeatureFlagGroup isMathPaperEnabled])
  {
    uint64_t v15 = [(CRLCanvasRep *)self canvas];
    unsigned int v16 = [v15 isCanvasInteractive];

    if (v16)
    {
      v17 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v17 removeDecorator:self];
    }
  }
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:2]) {
    [(CRLFreehandDrawingRep *)self p_removeDataDetectorInteraction];
  }
  v18.receiver = self;
  v18.super_class = (Class)CRLFreehandDrawingRep;
  [(CRLCanvasRep *)&v18 willBeRemoved];
}

- (id)additionalRepsForDraggingConnectionLine:(id)a3
{
  id v4 = a3;
  v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v6 = [v5 editorController];
  v7 = [v6 selectionPath];
  v8 = [v7 mostSpecificSelectionOfClass:objc_opt_class()];

  uint64_t v9 = objc_opt_class();
  v10 = [(CRLCanvasRep *)self info];
  v11 = sub_1002469D0(v9, v10);

  if (v8
    && v11
    && ([v8 containerGroups],
        v12 = objc_claimAutoreleasedReturnValue(),
        unsigned int v13 = [v12 containsObject:v11],
        v12,
        v13))
  {
    v14 = [(CRLCanvasRep *)self childReps];
    uint64_t v15 = +[NSSet setWithArray:v14];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CRLFreehandDrawingRep;
    uint64_t v15 = [(CRLCanvasRep *)&v17 additionalRepsForDraggingConnectionLine:v4];
  }

  return v15;
}

- (BOOL)p_shouldDrawShapeRep:(id)a3 withOtherShapeRep:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isMoreOptimalToDrawWithOtherShapeRepsIfPossible]) {
    unsigned __int8 v7 = [v5 canDrawWithOtherShapeRep:v6];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)p_drawChildShapeReps:(id)a3 togetherInContext:(CGContext *)a4
{
  id v14 = a3;
  if ([v14 count])
  {
    if ([v14 count] == (id)1)
    {
      CGContextSaveGState(a4);
      id v6 = [v14 objectAtIndexedSubscript:0];
      [v6 recursivelyDrawInContext:a4 keepingChildrenPassingTest:0];

      CGContextRestoreGState(a4);
    }
    else
    {
      unsigned __int8 v7 = [v14 firstObject];
      [v7 opacity];
      double v9 = v8;

      if (v9 != 0.0)
      {
        v10 = [v14 firstObject];
        v11 = [v10 layout];
        v12 = [v11 stroke];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          [(CRLFreehandDrawingRep *)self p_drawChildShapeRepsWithPencilKitStrokes:v14 togetherInContext:a4];
        }
        else {
          [(CRLFreehandDrawingRep *)self p_concatenatePathDrawChildShapeReps:v14 togetherInContext:a4];
        }
      }
    }
  }
}

- (void)p_concatenatePathDrawChildShapeReps:(id)a3 togetherInContext:(CGContext *)a4
{
  id v5 = a3;
  if ((unint64_t)[v5 count] <= 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD4C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101083224();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD4E8);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    unsigned __int8 v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_concatenatePathDrawChildShapeReps:togetherInContext:]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:585 isFatal:0 description:"Should be drawing at least two shape reps here."];
  }
  double v9 = +[CRLBezierPath bezierPath];
  v10 = [v5 firstObject];
  memset(&v103, 0, sizeof(v103));
  v11 = [v10 layout];
  v12 = v11;
  CGContextRef c = a4;
  if (v11) {
    [v11 transformInRoot];
  }
  else {
    memset(&v103, 0, sizeof(v103));
  }

  uint64_t v13 = objc_opt_class();
  id v14 = [v10 shapeLayout];
  uint64_t v15 = [v14 stroke];
  unsigned int v16 = sub_1002469D0(v13, v15);

  if (v16)
  {
    objc_super v17 = [v16 strokeName];
    if ([v17 isEqualToString:@"Pencil"])
    {

LABEL_18:
      uint64_t v20 = +[NSMutableArray array];
      goto LABEL_20;
    }
    objc_super v18 = [v16 strokeName];
    unsigned int v19 = [v18 isEqualToString:@"Crayon"];

    if (v19) {
      goto LABEL_18;
    }
  }
  uint64_t v20 = 0;
LABEL_20:

  v86 = v10;
  [v10 opacity];
  if (v21 != 1.0 && fabs(v21 + -1.0) >= 0.000000999999997) {
    goto LABEL_24;
  }
  v22 = [v10 layout];
  uint64_t v23 = [v22 stroke];
  v24 = [v23 color];
  [v24 alphaComponent];
  double v26 = v25;

  uint64_t v27 = 0;
  if (v26 != 1.0 && fabs(v26 + -1.0) >= 0.000000999999997)
  {
LABEL_24:
    uint64_t v27 = +[NSMutableArray array];
  }
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id obj = v5;
  id v91 = [obj countByEnumeratingWithState:&v99 objects:v105 count:16];
  if (v91)
  {
    uint64_t v90 = *(void *)v100;
    BOOL v89 = (v20 | v27) != 0;
    v32 = &__kCFBooleanFalse;
    p_vtable = CRLiOSImageHUDSlider.vtable;
    v34 = v86;
    v85 = v9;
    while (1)
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v100 != v90) {
          objc_enumerationMutation(obj);
        }
        uint64_t v92 = v35;
        v36 = *(void **)(*((void *)&v99 + 1) + 8 * v35);
        v37 = [v36 shapeLayout];
        v38 = [v37 pathSource];
        v39 = [v38 bezierPath];
        id v94 = [v39 copy];

        [v36 clipRect];
        CGFloat v41 = v40;
        CGFloat v43 = v42;
        CGFloat v45 = v44;
        CGFloat v47 = v46;
        if (v36 != v34)
        {
          memset(&v104, 0, sizeof(v104));
          if (v37) {
            [v37 transformInRoot];
          }
          else {
            memset(&t1, 0, sizeof(t1));
          }
          CGAffineTransform v96 = v103;
          CGAffineTransformInvert(&t2, &v96);
          CGAffineTransformConcat(&v104, &t1, &t2);
          CGAffineTransform v96 = v104;
          [v94 transformUsingAffineTransform:&v96];
          CGAffineTransform v96 = v104;
          v106.origin.CGFloat x = v41;
          v106.origin.CGFloat y = v43;
          v106.size.CGFloat width = v45;
          v106.size.CGFloat height = v47;
          CGRect v107 = CGRectApplyAffineTransform(v106, &v96);
          CGFloat v41 = v107.origin.x;
          CGFloat v43 = v107.origin.y;
          CGFloat v45 = v107.size.width;
          CGFloat v47 = v107.size.height;
        }
        if (v89)
        {
          v48 = (char *)[v94 totalSubpathCountIncludingEffectivelyEmptySubpaths];
          if (v20)
          {
            objc_super v49 = [v37 stroke];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0)
            {
              unsigned int v51 = [p_vtable + 152 _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014DD508);
              }
              v52 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                LODWORD(v104.a) = 67109890;
                HIDWORD(v104.a) = v51;
                LOWORD(v104.b) = 2082;
                *(void *)((char *)&v104.b + 2) = "-[CRLFreehandDrawingRep p_concatenatePathDrawChildShapeReps:togetherInContext:]";
                WORD1(v104.c) = 2082;
                *(void *)((char *)&v104.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLF"
                                                   "reehandDrawingRep.m";
                WORD2(v104.d) = 1024;
                *(_DWORD *)((char *)&v104.d + 6) = 629;
                _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Trying to draw a shape without a brush stroke along with one with a brush stroke.", (uint8_t *)&v104, 0x22u);
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014DD528);
              }
              v53 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                v79 = v53;
                v80 = [p_vtable + 152 packedBacktraceString];
                LODWORD(v104.a) = 67109378;
                HIDWORD(v104.a) = v51;
                LOWORD(v104.b) = 2114;
                *(void *)((char *)&v104.b + 2) = v80;
                _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&v104, 0x12u);
              }
              v54 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_concatenatePathDrawChildShapeReps:togetherInContext:]");
              v55 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
              [p_vtable + 152 handleFailureInFunction:v54 file:v55 lineNumber:629 isFatal:0 description:"Trying to draw a shape without a brush stroke along with one with a brush stroke."];
            }
            double v88 = height;
            v56 = [v37 dynamicPatternOffsetsBySubpath];
            v57 = (char *)[v56 count];
            v58 = [v36 shapeInfo];
            [v58 strokePatternOffsetDistance];
            double v60 = v59;

            if (v48)
            {
              v61 = 0;
              v93 = v57;
              do
              {
                if (v56)
                {
                  if (v61 >= v57)
                  {
                    v64 = v37;
                    uint64_t v65 = v27;
                    v66 = v32;
                    uint64_t v67 = v20;
                    unsigned int v68 = [p_vtable + 152 _atomicIncrementAssertCount];
                    if (qword_101719A70 != -1) {
                      dispatch_once(&qword_101719A70, &stru_1014DD548);
                    }
                    v69 = off_10166B4A0;
                    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                    {
                      LODWORD(v104.a) = 67109890;
                      HIDWORD(v104.a) = v68;
                      LOWORD(v104.b) = 2082;
                      *(void *)((char *)&v104.b + 2) = "-[CRLFreehandDrawingRep p_concatenatePathDrawChildShapeReps:tog"
                                                         "etherInContext:]";
                      WORD1(v104.c) = 2082;
                      *(void *)((char *)&v104.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItem"
                                                         "s/CRLFreehandDrawingRep.m";
                      WORD2(v104.d) = 1024;
                      *(_DWORD *)((char *)&v104.d + 6) = 646;
                      _os_log_error_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Out of range of dynamicPatternOffsetsBySubpath. Falling back to info value.", (uint8_t *)&v104, 0x22u);
                    }
                    if (qword_101719A70 != -1) {
                      dispatch_once(&qword_101719A70, &stru_1014DD568);
                    }
                    v70 = off_10166B4A0;
                    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                    {
                      v74 = v70;
                      v75 = +[CRLAssertionHandler packedBacktraceString];
                      LODWORD(v104.a) = 67109378;
                      HIDWORD(v104.a) = v68;
                      LOWORD(v104.b) = 2114;
                      *(void *)((char *)&v104.b + 2) = v75;
                      _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&v104, 0x12u);

                      p_vtable = (void **)(CRLiOSImageHUDSlider + 24);
                    }
                    v71 = p_vtable + 152;
                    v72 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_concatenatePathDrawChildShapeReps:togetherInContext:]");
                    v73 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
                    [v71 handleFailureInFunction:v72 file:v73 lineNumber:646 isFatal:0 description:"Out of range of dynamicPatternOffsetsBySubpath. Falling back to info value."];

                    p_vtable = (void **)(CRLiOSImageHUDSlider + 24);
                    v63 = +[NSNumber numberWithDouble:v60];
                    uint64_t v20 = v67;
                    v32 = v66;
                    uint64_t v27 = v65;
                    v37 = v64;
                    v57 = v93;
                    goto LABEL_63;
                  }
                  uint64_t v62 = [v56 objectAtIndexedSubscript:v61];
                }
                else
                {
                  uint64_t v62 = +[NSNumber numberWithDouble:v60];
                }
                v63 = (void *)v62;
LABEL_63:
                [(id)v20 addObject:v63];

                ++v61;
              }
              while (v48 != v61);
            }

            double v9 = v85;
            v34 = v86;
            CGFloat height = v88;
          }
          if (v27 && v48)
          {
            for (i = 0; i != v48; ++i)
            {
              if (i) {
                goto LABEL_70;
              }
              v108.origin.CGFloat x = x;
              v108.origin.CGFloat y = y;
              v108.size.CGFloat width = width;
              v108.size.CGFloat height = height;
              v112.origin.CGFloat x = v41;
              v112.origin.CGFloat y = v43;
              v112.size.CGFloat width = v45;
              v112.size.CGFloat height = v47;
              BOOL v77 = CGRectIntersectsRect(v108, v112);
              v78 = &__kCFBooleanTrue;
              if (!v77) {
LABEL_70:
              }
                v78 = v32;
              [(id)v27 addObject:v78];
            }
          }
        }
        [v9 appendBezierPath:v94];
        v109.origin.CGFloat x = x;
        v109.origin.CGFloat y = y;
        v109.size.CGFloat width = width;
        v109.size.CGFloat height = height;
        v113.origin.CGFloat x = v41;
        v113.origin.CGFloat y = v43;
        v113.size.CGFloat width = v45;
        v113.size.CGFloat height = v47;
        CGRect v110 = CGRectUnion(v109, v113);
        CGFloat x = v110.origin.x;
        CGFloat y = v110.origin.y;
        CGFloat width = v110.size.width;
        CGFloat height = v110.size.height;

        uint64_t v35 = v92 + 1;
      }
      while ((id)(v92 + 1) != v91);
      id v91 = [obj countByEnumeratingWithState:&v99 objects:v105 count:16];
      if (!v91) {
        goto LABEL_76;
      }
    }
  }
  v34 = v86;
LABEL_76:

  CGContextSaveGState(c);
  v81 = [v34 layout];
  v82 = [v81 geometry];
  v83 = v82;
  if (v82) {
    [v82 transform];
  }
  else {
    memset(&transform, 0, sizeof(transform));
  }
  CGContextConcatCTM(c, &transform);

  v111.origin.CGFloat x = x;
  v111.origin.CGFloat y = y;
  v111.size.CGFloat width = width;
  v111.size.CGFloat height = height;
  CGContextClipToRect(c, v111);
  [v34 drawInContext:c usingPathOverride:v9 patternOffsetsBySubpathOverride:v20 transparencyLayersBySubpath:v27];
  CGContextRestoreGState(c);
}

- (CGRect)p_boundsInNaturalSpaceForMathView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  [v4 bounds];
  double v13 = sub_1000657F8(v9, v10, v11, v12);
  double v15 = v14;
  unsigned int v16 = [(CRLFreehandDrawingRep *)self p_baseMathView];
  [v16 convertPoint:v4 fromView:v6];
  double v18 = v17;
  double v20 = v19;

  double v21 = [(CRLFreehandDrawingRep *)self p_baseMathView];
  [v21 convertPoint:v4 fromView:v13];
  double v23 = v22;
  double v25 = v24;

  double v26 = [(CRLCanvasRep *)self interactiveCanvasController];
  uint64_t v27 = [v26 canvasView];
  v28 = [(CRLFreehandDrawingRep *)self p_baseMathView];
  [v27 convertPoint:v28 fromView:v18];
  double v30 = v29;
  double v32 = v31;

  v33 = [(CRLCanvasRep *)self interactiveCanvasController];
  v34 = [v33 canvasView];
  uint64_t v35 = [(CRLFreehandDrawingRep *)self p_baseMathView];
  [v34 convertPoint:v35 fromView:v23];
  double v37 = v36;
  double v39 = v38;

  double v40 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v40 convertBoundsToUnscaledPoint:v30, v32];
  double v42 = v41;
  double v44 = v43;

  CGFloat v45 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v45 convertBoundsToUnscaledPoint:v37, v39];
  double v47 = v46;
  double v49 = v48;

  -[CRLGroupRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", v42, v44);
  double v51 = v50;
  double v53 = v52;
  -[CRLGroupRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", v47, v49);

  double v55 = sub_100064044(v51, v53, v54);
  result.size.CGFloat height = v58;
  result.size.CGFloat width = v57;
  result.origin.CGFloat y = v56;
  result.origin.CGFloat x = v55;
  return result;
}

- (id)createAdditionalBoardItemsForCopyImaging
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if ([(CRLFreehandDrawingRep *)self p_hasMathResultViews])
  {
    id v4 = [(CRLCanvasRep *)self interactiveCanvasController];
    double v5 = [v4 canvas];
    [v5 contentsScale];
    double v7 = v6;

    double v8 = [(CRLCanvasRep *)self interactiveCanvasController];
    CGFloat v9 = [v8 canvas];
    [v9 viewScale];
    double v11 = v10;

    double v12 = v7 * v11;
    [(CRLCanvasRep *)self boundsForStandardKnobs];
    double v14 = v13;
    double v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    double v21 = sub_1000646A4(v17, v19, v12);
    double v23 = sub_100455AA8(11, v21, v22);
    CGContextScaleCTM(v23, v12, v12);
    *(double *)rect = v14;
    CGContextTranslateCTM(v23, -v14, -v16);
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    double v24 = [(CRLFreehandDrawingRep *)self p_baseMathView];
    double v25 = [v24 subviews];

    id v26 = [v25 countByEnumeratingWithState:&v65 objects:v69 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v66;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v66 != v28) {
            objc_enumerationMutation(v25);
          }
          double v30 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          [(CRLFreehandDrawingRep *)self p_boundsInNaturalSpaceForMathView:v30];
          CGFloat v32 = v31;
          CGFloat v34 = v33;
          double v36 = v35;
          double v38 = v37;
          CGContextSaveGState(v23);
          [v30 bounds];
          CGFloat v40 = -v39;
          [v30 bounds];
          CGContextTranslateCTM(v23, v40, -v41);
          CGContextTranslateCTM(v23, v32, v34);
          [v30 bounds];
          CGFloat v43 = v36 / v42;
          [v30 bounds];
          CGContextScaleCTM(v23, v43, v38 / v44);
          CGFloat v45 = [v30 layer];
          [v45 renderInContext:v23];

          CGContextRestoreGState(v23);
        }
        id v27 = [v25 countByEnumeratingWithState:&v65 objects:v69 count:16];
      }
      while (v27);
    }

    Image = CGBitmapContextCreateImage(v23);
    double v47 = sub_10047EC98(Image);
    CGImageRelease(Image);
    CGContextRelease(v23);
    double v48 = [(CRLCanvasRep *)self interactiveCanvasController];
    double v49 = [v48 editingCoordinator];
    double v50 = [v49 boardItemFactory];

    double v51 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
    double v52 = [v50 assetOwner];
    double v53 = [(CRLPreinsertionAssetWrapper *)v51 initWithData:v47 filename:@"freehand-drawing-math-solve-image-for-copying" owner:v52 error:0];

    double v54 = [(CRLPreinsertionAssetWrapper *)v53 synchronouslyCreateAsset];
    double v55 = [(CRLCanvasRep *)self layout];
    double v56 = v55;
    if (v55) {
      [v55 transformInRoot];
    }
    else {
      memset(&rect[8], 0, 48);
    }
    v71.origin.double x = *(CGFloat *)rect;
    v71.origin.double y = v16;
    v71.size.double width = v18;
    v71.size.double height = v20;
    CGRect v72 = CGRectApplyAffineTransform(v71, (CGAffineTransform *)&rect[8]);
    double x = v72.origin.x;
    double y = v72.origin.y;
    double width = v72.size.width;
    double height = v72.size.height;

    v61 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", x, y, width, height);
    uint64_t v62 = [v50 makeImageItemWithGeometry:v61 imageData:v54 thumbnailData:0];
    [v62 setStroke:0];
    [v62 setShadow:0];
    [v62 setMaskInfo:0];
    [v3 addObject:v62];
  }

  return v3;
}

- (void)viewScaleDidChange
{
  v24.receiver = self;
  v24.super_class = (Class)CRLFreehandDrawingRep;
  [(CRLCanvasRep *)&v24 viewScaleDidChange];
  if (![(CRLFreehandDrawingRep *)self p_hasMathResultViews])
  {
    id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
    [(CRLFreehandDrawingRep *)self p_getUnRotatedFrameWithoutMathResults];
    [v3 convertUnscaledToBoundsRect:];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    double v12 = [(CRLFreehandDrawingRep *)self p_baseMathView];
    long long v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v23[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v23[1] = v13;
    v23[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v12 setTransform:v23];

    double v14 = [(CRLFreehandDrawingRep *)self p_baseMathView];
    [v14 setFrame:v5, v7, v9, v11];

    double v15 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
    [v15 setFrameAtMathViewAttachment:v5, v7, v9, v11];

    double v16 = [(CRLCanvasRep *)self layout];
    double v17 = [v16 pureGeometryInRoot];
    CGFloat v18 = v17;
    if (v17) {
      [v17 transform];
    }
    else {
      memset(v22, 0, sizeof(v22));
    }
    double v19 = sub_10007F7C8((double *)v22);
    CGFloat v20 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
    [v20 setRotationAtMathViewAttachment:v19];

    double v21 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v21 invalidateContentLayersForRep:self];
  }
}

- (void)didEndZoomingOperation
{
  if ([(CRLFreehandDrawingRep *)self p_hasMathResultViews])
  {
    [(CRLFreehandDrawingRep *)self p_requestNewMathRecognitionHandler];
    id v3 = [(CRLCanvasRep *)self layout];
    [v3 invalidateFrame];

    [(CRLCanvasRep *)self invalidateKnobs];
  }
}

- (void)viewScrollDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CRLFreehandDrawingRep;
  [(CRLCanvasRep *)&v3 viewScrollDidChange];
  self->_isViewScrolling = 1;
}

- (void)viewScrollingEnded
{
  v3.receiver = self;
  v3.super_class = (Class)CRLFreehandDrawingRep;
  [(CRLCanvasRep *)&v3 viewScrollingEnded];
  self->_isViewScrolling = 0;
  if (self->_attachedMathResultViewDuringAViewScrollOrDynamicOperation)
  {
    self->_attachedMathResultViewDuringAViewScrollOrDynamicOperation = 0;
    [(CRLFreehandDrawingRep *)self p_requestNewMathRecognitionHandler];
  }
}

- (void)dynamicOperationDidEnd
{
  v3.receiver = self;
  v3.super_class = (Class)CRLFreehandDrawingRep;
  [(CRLCanvasRep *)&v3 dynamicOperationDidEnd];
  [(CRLFreehandDrawingRep *)self p_updateLayoutBoundsForMathResultView];
  if (self->_attachedMathResultViewDuringAViewScrollOrDynamicOperation)
  {
    self->_attachedMathResultViewDuringAViewScrollOrDynamicOperation = 0;
    [(CRLFreehandDrawingRep *)self p_requestNewMathRecognitionHandler];
  }
}

- (void)willEnterForeground
{
  v7.receiver = self;
  v7.super_class = (Class)CRLFreehandDrawingRep;
  [(CRLCanvasRep *)&v7 willEnterForeground];
  objc_super v3 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
  double v4 = [v3 pkRecognitionController];
  [v4 tagAsActive];

  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014DD588);
  }
  double v5 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Tagging recognition controller as active.", v6, 2u);
  }
}

- (void)didEnterBackground
{
  v7.receiver = self;
  v7.super_class = (Class)CRLFreehandDrawingRep;
  [(CRLCanvasRep *)&v7 didEnterBackground];
  objc_super v3 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
  double v4 = [v3 pkRecognitionController];
  [v4 tagAsIdle];

  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014DD5A8);
  }
  double v5 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Tagging recognition controller as idle.", v6, 2u);
  }
}

- (void)p_setupMathPaperAndDataRecognition
{
  if (+[CRLFeatureFlagGroup isMathPaperEnabled])
  {
    objc_super v3 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
    [v3 setupMathRecognitionHandler];

    self->_waitingForLayoutPass = 0;
    self->_allowedToToggleMathPopoverUI = 0;
    self->_isPresentingMathPopoverUI = 0;
    [(CRLFreehandDrawingRep *)self setupDrawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap];
    double v4 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v4 addDecorator:self];
  }
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:2])
  {
    double v5 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
    double v6 = [v5 pkRecognitionController];

    if (!v6)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD5C8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010832AC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD5E8);
      }
      objc_super v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v7);
      }
      double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_setupMathPaperAndDataRecognition]");
      double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 847, 0, "invalid nil value for '%{public}s'", "self.p_freehandDrawingInfo.pkRecognitionController");
    }
    double v10 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
    double v11 = [v10 pkRecognitionController];
    double v12 = [v11 dataDetectorController];
    [v12 setDelegate:self];
  }
}

- (void)p_initializePKRecognitionSessionAndSetupMathAndDataRecognitionWithDrawing:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
  [v5 setCachedPKDrawing:v4];

  id v6 = objc_alloc((Class)PKRecognitionController);
  objc_super v7 = [v4 strokes];
  id v8 = [v6 initWithDrawing:v4 visibleOnscreenStrokes:v7 useSessionCache:1];

  double v9 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
  [v9 setPkRecognitionController:v8];

  double v10 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
  double v11 = [v10 pkRecognitionController];
  double v12 = [v11 dataDetectorController];
  [v12 setDelegate:self];

  [(CRLFreehandDrawingRep *)self p_setupMathPaperAndDataRecognition];
  long long v13 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
  double v14 = [v13 pkRecognitionController];
  [v14 tagAsActive];

  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014DD608);
  }
  double v15 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Tagging recognition controller as active.", v16, 2u);
  }
}

- (void)p_updatePKRecognitionControllerWithStrokes:(id)a3 useCachedSession:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
  id v8 = [v7 pkRecognitionController];
  if (v8)
  {
  }
  else
  {
    double v9 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
    unsigned __int8 v10 = [v9 prohibitsClustering];

    if ((v10 & 1) == 0)
    {
      id v21 = objc_alloc_init((Class)PKDrawing);
      CGFloat v32 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
      double v33 = [v32 id];
      [v21 _setUUID:v33];

      id v34 = [v21 undoableAddNewStrokes:v6];
      [(CRLFreehandDrawingRep *)self p_initializePKRecognitionSessionAndSetupMathAndDataRecognitionWithDrawing:v21];
      goto LABEL_13;
    }
  }
  double v11 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
  double v12 = [v11 pkRecognitionController];

  if (!v12 || !v4)
  {
    double v16 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
    double v17 = [v16 pkRecognitionController];

    if (!v17) {
      goto LABEL_14;
    }
    CGFloat v18 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
    double v19 = [v18 pkRecognitionController];
    CGFloat v20 = [v19 drawing];
    id v21 = [v20 copy];

    double v22 = +[NSMutableArray array];
    [v21 _setAllStrokes:v22];

    [v21 invalidateVisibleStrokes];
    id v23 = [v21 undoableAddNewStrokes:v6];
    objc_super v24 = +[NSDate now];
    [v24 timeIntervalSince1970];
    double v26 = v25;
    id v27 = [(CRLFreehandDrawingRep *)self p_mathRecognitionHandler];
    [v27 setLastStrokeTimestamp:v26];

    uint64_t v28 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
    double v29 = [v28 pkRecognitionController];
    double v30 = [v21 strokes];
    [v29 setDrawing:v21 withVisibleOnscreenStrokes:v30];

    double v31 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
    [v31 setCachedPKDrawing:v21];

LABEL_13:
    goto LABEL_14;
  }
  [(CRLFreehandDrawingRep *)self p_setupMathPaperAndDataRecognition];
  long long v13 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
  double v14 = [v13 pkRecognitionController];
  [v14 tagAsActive];

  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014DD628);
  }
  double v15 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v35 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Tagging recognition controller as active.", v35, 2u);
  }
LABEL_14:
}

- (PKDrawing)pkDrawing
{
  v2 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
  objc_super v3 = [v2 pkRecognitionController];
  BOOL v4 = [v3 drawing];

  return (PKDrawing *)v4;
}

- (PKMathRecognitionController)pkMathRecognitionController
{
  v2 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
  objc_super v3 = [v2 pkRecognitionController];
  BOOL v4 = [v3 mathRecognitionController];

  return (PKMathRecognitionController *)v4;
}

- (PKRecognitionController)pkRecognitionController
{
  v2 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
  objc_super v3 = [v2 pkRecognitionController];

  return (PKRecognitionController *)v3;
}

- (void)didUpdateMathResultView
{
  objc_super v3 = [(CRLFreehandDrawingRep *)self p_baseMathView];
  BOOL v4 = [v3 subviews];
  [v4 setValue:&__kCFBooleanFalse forKey:@"hidden"];

  if (self->_isViewScrolling)
  {
    self->_attachedMathResultViewDuringAViewScrollOrDynamicOperation = 1;
  }
  else
  {
    BOOL v5 = [(CRLCanvasRep *)self isInDynamicOperation];
    self->_attachedMathResultViewDuringAViewScrollOrDynamicOperation = v5;
    if (!v5) {
      goto LABEL_5;
    }
  }
  id v6 = [(CRLFreehandDrawingRep *)self p_baseMathView];
  objc_super v7 = [v6 subviews];
  [v7 setValue:&__kCFBooleanTrue forKey:@"hidden"];

LABEL_5:
  id v8 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v8 invalidateContentLayersForRep:self];

  if (![(CRLCanvasRep *)self isInDynamicOperation])
  {
    [(CRLFreehandDrawingRep *)self p_updateLayoutBoundsForMathResultView];
    double v9 = [(CRLCanvasRep *)self layout];
    [v9 invalidateFrame];

    [(CRLCanvasRep *)self invalidateKnobs];
  }
}

- (BOOL)p_hasMathResultViews
{
  v2 = [(CRLFreehandDrawingRep *)self p_baseMathView];
  objc_super v3 = [v2 subviews];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)p_suspensionStatusChanged
{
}

- (void)p_requestNewMathRecognitionHandler
{
  self->_requestedNewMathRecognitionHandler = 1;
  [(CRLFreehandDrawingRep *)self p_resetMathRecognitionHandlerIfRequestedAndEnabled];
}

- (void)p_resetMathRecognitionHandlerIfRequestedAndEnabled
{
  objc_super v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  BOOL v4 = [v3 mathCalculationController];

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD648);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101083340();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD668);
    }
    BOOL v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_resetMathRecognitionHandlerIfRequestedAndEnabled]");
    objc_super v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 942, 0, "invalid nil value for '%{public}s'", "mathCalculationController");
  }
  if (self->_requestedNewMathRecognitionHandler && ([v4 isSolvingSuspended] & 1) == 0)
  {
    self->_requestedNewMathRecognitionHandler = 0;
    id v8 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
    [v8 resetMathRecognitionHandlerIfRequestedAndEnabled];
  }
}

- (NSArray)decoratorOverlayViews
{
  if (+[CRLFeatureFlagGroup isMathPaperEnabled]
    && ([(CRLFreehandDrawingRep *)self p_baseMathView],
        objc_super v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    [(CRLFreehandDrawingRep *)self p_updateBaseMathViewIfNeeded];
    BOOL v4 = [(CRLFreehandDrawingRep *)self p_baseMathView];
    objc_super v7 = v4;
    BOOL v5 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  else
  {
    BOOL v5 = &__NSArray0__struct;
  }

  return (NSArray *)v5;
}

- (CGRect)p_getUnRotatedFrameWithoutMathResults
{
  unsigned __int8 v3 = [(CRLCanvasRep *)self isInDynamicOperation];
  BOOL v4 = [(CRLCanvasRep *)self layout];
  BOOL v5 = v4;
  if (v3)
  {
    id v6 = [v4 dynamicGeometry];
    [v6 infoGeometry];
  }
  else
  {
    id v6 = [v4 info];
    [v6 geometry];
  objc_super v7 = };
  [v7 boundsBeforeRotation];
  double v9 = v8;
  double v11 = v10;

  double v12 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
  long long v13 = [v12 pureGeometryWithoutMathResults];
  [v13 size];
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  CGFloat v18 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
  double v19 = v18;
  if (v18)
  {
    [v18 pureTransformInRootWithoutMathResults];
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v26 = 0u;
  }

  long long v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v25.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v21 = *(_OWORD *)&v25.a;
  *(_OWORD *)&v25.CGContextRef c = v22;
  *(_OWORD *)&v25.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v20 = *(_OWORD *)&v25.tx;
  CGAffineTransformMakeTranslation(&t2, *(double *)&v28 - v9, *((double *)&v28 + 1) - v11);
  *(_OWORD *)&t1.a = v21;
  *(_OWORD *)&t1.CGContextRef c = v22;
  *(_OWORD *)&t1.tdouble x = v20;
  CGAffineTransformConcat(&v25, &t1, &t2);
  CGAffineTransform t1 = v25;
  v29.origin.double x = v9;
  v29.origin.double y = v11;
  v29.size.double width = v15;
  v29.size.double height = v17;
  return CGRectApplyAffineTransform(v29, &t1);
}

- (id)p_baseMathView
{
  v2 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
  unsigned __int8 v3 = [v2 baseMathView];

  return v3;
}

- (_TtC8Freeform30CRLMathRecognitionItemsHandler)p_mathRecognitionHandler
{
  v2 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
  unsigned __int8 v3 = [v2 mathRecognitionHandler];

  return (_TtC8Freeform30CRLMathRecognitionItemsHandler *)v3;
}

- (void)pkStrokesForFreehandItemsDidChange:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD688);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108345C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD6A8);
    }
    BOOL v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep pkStrokesForFreehandItemsDidChange:]");
    objc_super v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:1002 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  double v8 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
  double v9 = [v8 parentItem];

  if (v9)
  {
    double v10 = [v8 id];
    double v11 = [v4 objectForKeyedSubscript:v10];

    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD6C8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010833D4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD6E8);
      }
      double v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      long long v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep pkStrokesForFreehandItemsDidChange:]");
      double v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:1006 isFatal:0 description:"Unexpected nil freehandDrawingIDToPKStrokesMap returned from pkDrawingsForFreehandItemsDidChange"];
    }
    self->_waitingForLayoutPass = 1;
    [(CRLFreehandDrawingRep *)self p_updatePKRecognitionControllerWithStrokes:v11 useCachedSession:0];
  }
}

- (void)updateDrawingShapeItemUUIDToStrokeDataUUIDDict:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = [v4 forwardKeys];
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
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        double v11 = [v4 objectForKeyedSubscript:v10];
        [(CRLBidirectionalMap *)self->_drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap setObject:v11 forKeyedSubscript:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)removeDrawingShapeItemUUIDToStrokeDataUUIDPair:(id)a3
{
}

- (void)didUpdateShouldSolveMathForTriggerStroke:(id)a3 shouldSolveMath:(BOOL)a4 undoable:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap = self->_drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap;
  double v9 = [a3 path];
  uint64_t v10 = [v9 _strokeDataUUID];
  double v11 = [(CRLBidirectionalMap *)drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap objectForKeyedSubscript:v10];

  if (v11)
  {
    long long v12 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
    long long v13 = v12;
    if (!v12) {
      goto LABEL_10;
    }
    long long v14 = [v12 childItems];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1001A3D2C;
    v31[3] = &unk_1014DD710;
    v31[4] = v11;
    id v15 = [v14 indexOfObjectPassingTest:v31];

    if (v15 == (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_10;
    }
    uint64_t v16 = objc_opt_class();
    CGFloat v17 = [v13 childItems];
    CGFloat v18 = [v17 objectAtIndexedSubscript:v15];
    double v19 = sub_1002469D0(v16, v18);

    if (v19)
    {
      long long v20 = [(CRLCanvasRep *)self interactiveCanvasController];
      long long v21 = [v20 commandController];
      long long v22 = [v19 pencilKitStrokePathCompactData];
      [v22 setShouldSolveMath:v6];
      [v21 openGroup];
      id v23 = +[NSBundle mainBundle];
      objc_super v24 = v23;
      if (v6) {
        CFStringRef v25 = @"Insert Result";
      }
      else {
        CFStringRef v25 = @"Remove Result";
      }
      long long v26 = [v23 localizedStringForKey:v25 value:0 table:@"UndoStrings"];

      [v21 setCurrentGroupActionString:v26];
      long long v27 = [_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData alloc];
      long long v28 = [v19 maskPath];
      CGRect v29 = [(CRLCommandSetFreehandDrawingShapeItemPKData *)v27 initWithFreehandDrawingShapeItem:v19 strokePathCompactData:v22 maskPath:v28];

      [(CRLCommand *)v29 setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:0];
      if (v5) {
        [v21 enqueueCommand:v29];
      }
      else {
        [v21 enqueueWithNonUndoableCommand:v29];
      }
      [v21 closeGroup];
    }
    else
    {
LABEL_10:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD730);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010834E4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD750);
      }
      double v30 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v30);
      }
      double v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didUpdateShouldSolveMathForTriggerStroke:shouldSolveMath:undoable:]");
      long long v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:v19 file:v20 lineNumber:1055 isFatal:0 description:"Could not locate freehand drawing shapeItem for _strokeDataUUID given by trigger stroke"];
    }
  }
}

- (void)setupDrawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap
{
  if (self->_drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD770);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108356C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD790);
    }
    unsigned __int8 v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep setupDrawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap]");
    BOOL v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:1061 isFatal:0 description:"setupDrawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap has already been called for this rep"];
  }
  BOOL v6 = objc_alloc_init(CRLBidirectionalMap);
  drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap = self->_drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap;
  self->_drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap = v6;

  uint64_t v8 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
  if (v8)
  {
    double v9 = [(CRLCanvasRep *)self interactiveCanvasController];
    uint64_t v10 = [v9 pkDrawingProvider];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = v8;
    double v11 = [v8 childItems];
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          if (v10)
          {
            uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            CGFloat v17 = [v16 id];
            CGFloat v18 = [v10 strokeDataUUIDForDrawingShapeItemUUID:v17];

            if (v18)
            {
              double v19 = self->_drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap;
              long long v20 = [v16 id];
              [(CRLBidirectionalMap *)v19 setObject:v18 forKeyedSubscript:v20];
            }
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    uint64_t v8 = v21;
  }
}

- (void)updateFromLayout
{
  v47.receiver = self;
  v47.super_class = (Class)CRLFreehandDrawingRep;
  [(CRLGroupRep *)&v47 updateFromLayout];
  unsigned __int8 v3 = [(CRLCanvasRep *)self canvas];
  unsigned int v4 = [v3 isCanvasInteractive];

  if (!v4) {
    return;
  }
  BOOL v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  [(CRLFreehandDrawingRep *)self p_getUnRotatedFrameWithoutMathResults];
  [v5 convertUnscaledToBoundsRect:];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  uint64_t v14 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
  [v14 previousAspectRatio];
  double v16 = vabdd_f64(v11 / v13, v15);

  if (v16 <= 0.001)
  {
    self->_waitingForLayoutPass = 0;
    long long v24 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v24 invalidateContentLayersForRep:self];
  }
  else
  {
    if (![(CRLCanvasRep *)self isInDynamicOperation])
    {
      CGFloat v17 = [(CRLFreehandDrawingRep *)self p_baseMathView];
      long long v18 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v46[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v46[1] = v18;
      v46[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      [v17 setTransform:v46];

      double v19 = [(CRLFreehandDrawingRep *)self p_baseMathView];
      [v19 setFrame:v7, v9, v11, v13];

      long long v20 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
      [v20 setFrameAtMathViewAttachment:v7, v9, v11, v13];

      long long v21 = [(CRLCanvasRep *)self layout];
      long long v22 = [v21 pureGeometryInRoot];
      long long v23 = v22;
      if (v22)
      {
        [v22 transform];
      }
      else
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v43 = 0u;
      }
      double v33 = sub_10007F7C8((double *)&v43);
      id v34 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
      [v34 setRotationAtMathViewAttachment:v33];
    }
    self->_waitingForLayoutPass = 0;
    double v35 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v35 invalidateContentLayersForRep:self];

    double v36 = [(CRLCanvasRep *)self interactiveCanvasController];
    unsigned __int8 v37 = [v36 isInDynamicOperation];

    if ((v37 & 1) == 0)
    {
      CGFloat v40 = [(CRLFreehandDrawingRep *)self p_baseMathView];
      double v41 = [v40 subviews];
      [v41 setValue:&__kCFBooleanTrue forKey:@"hidden"];

      long long v25 = [(CRLFreehandDrawingRep *)self p_mathRecognitionHandler];
      [v25 redrawSubviews];
      goto LABEL_18;
    }
    double v38 = [(CRLCanvasRep *)self interactiveCanvasController];
    unsigned int v39 = [v38 isInDynamicOperation];

    if (v39)
    {
      long long v25 = [(CRLFreehandDrawingRep *)self p_baseMathView];
      double v31 = [v25 subviews];
      long long v26 = v31;
      CGFloat v32 = &__kCFBooleanTrue;
LABEL_15:
      [v31 setValue:v32 forKey:@"hidden"];
      goto LABEL_16;
    }
  }
  long long v25 = [(CRLFreehandDrawingRep *)self p_baseMathView];
  long long v26 = [v25 subviews];
  if ([v26 count])
  {
    long long v27 = [(CRLFreehandDrawingRep *)self p_baseMathView];
    long long v28 = [v27 subviews];
    CGRect v29 = [v28 firstObject];
    unsigned int v30 = [v29 isHidden];

    if (!v30) {
      goto LABEL_19;
    }
    long long v25 = [(CRLFreehandDrawingRep *)self p_baseMathView];
    double v31 = [v25 subviews];
    long long v26 = v31;
    CGFloat v32 = &__kCFBooleanFalse;
    goto LABEL_15;
  }
LABEL_16:

LABEL_18:
LABEL_19:
  double v42 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
  [v42 setPreviousAspectRatio:v11 / v13];

  if ([(CRLFreehandDrawingRep *)self p_hasMathResultViews])
  {
    [(CRLFreehandDrawingRep *)self p_updateBaseMathViewIfNeeded];
    if (![(CRLCanvasRep *)self isInDynamicOperation]) {
      [(CRLCanvasRep *)self invalidateKnobs];
    }
  }
}

- (void)p_updateBaseMathViewIfNeeded
{
  [(CRLFreehandDrawingRep *)self p_getUnRotatedFrameWithoutMathResults];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v11 convertUnscaledToBoundsRect:v4, v6, v8, v10];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v17 = v16;
  double v19 = v18;

  v61 = [(CRLFreehandDrawingRep *)self p_baseMathView];
  [v61 frame];
  if (sub_100064208(v20, v21, v22, v23, v13, v15, v17, v19)
    || ![(CRLFreehandDrawingRep *)self p_hasMathResultViews])
  {
  }
  else
  {
    BOOL waitingForLayoutPass = self->_waitingForLayoutPass;

    if (!waitingForLayoutPass)
    {
      long long v25 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
      [v25 frameAtMathViewAttachment];
      double v27 = v17 / v26;

      long long v28 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
      [v28 frameAtMathViewAttachment];
      double v30 = v19 / v29;

      double v31 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
      [v31 frameAtMathViewAttachment];
      double v36 = sub_100065738(v32, v33, v34, v35);

      double v37 = sub_100065738(v13, v15, v17, v19);
      double v39 = sub_100064680(v37, v38, v36);
      CGFloat v41 = v40;
      memset(&v76, 0, sizeof(v76));
      double v42 = [(CRLFreehandDrawingRep *)self p_baseMathView];
      [v42 bounds];
      CGFloat v44 = v27 * (v43 * 0.5);
      long long v45 = [(CRLFreehandDrawingRep *)self p_baseMathView];
      [v45 bounds];
      CGAffineTransformMakeTranslation(&v76, v44, v30 * (v46 * 0.5));

      memset(&v75, 0, sizeof(v75));
      objc_super v47 = [(CRLFreehandDrawingRep *)self p_baseMathView];
      [v47 bounds];
      CGFloat v49 = v27 * (v48 * -0.5);
      double v50 = [(CRLFreehandDrawingRep *)self p_baseMathView];
      [v50 bounds];
      CGAffineTransformMakeTranslation(&v75, v49, v30 * (v51 * -0.5));

      double v52 = [(CRLCanvasRep *)self layout];
      double v53 = [v52 pureGeometryInRoot];
      double v54 = v53;
      if (v53) {
        [v53 transform];
      }
      else {
        memset(v74, 0, sizeof(v74));
      }
      double v55 = sub_10007F7C8((double *)v74);

      memset(&v73, 0, sizeof(v73));
      double v56 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
      [v56 rotationAtMathViewAttachment];
      CGAffineTransformMakeRotation(&t2, v55 - v57);
      CGAffineTransform t1 = v76;
      CGAffineTransformConcat(&v72, &t1, &t2);
      CGAffineTransform t1 = v75;
      CGAffineTransformConcat(&v73, &v72, &t1);

      *(_OWORD *)uint64_t v62 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&t1.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      long long v60 = *(_OWORD *)&t1.a;
      *(_OWORD *)&t1.CGContextRef c = *(_OWORD *)v62;
      *(_OWORD *)&t1.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
      long long v59 = *(_OWORD *)&t1.tx;
      CGAffineTransformMakeScale(&v69, v27, v30);
      *(_OWORD *)&v68.a = v60;
      *(_OWORD *)&v68.CGContextRef c = *(_OWORD *)v62;
      *(_OWORD *)&v68.tdouble x = v59;
      CGAffineTransformConcat(&t1, &v68, &v69);
      CGAffineTransform v67 = t1;
      CGAffineTransform v66 = v73;
      CGAffineTransformConcat(&v68, &v67, &v66);
      CGAffineTransform t1 = v68;
      CGAffineTransformMakeTranslation(&v65, v39, v41);
      CGAffineTransform v67 = t1;
      CGAffineTransformConcat(&v68, &v67, &v65);
      CGAffineTransform t1 = v68;
      CGAffineTransform v64 = v68;
      double v58 = [(CRLFreehandDrawingRep *)self p_baseMathView];
      CGAffineTransform v63 = v64;
      [v58 setTransform:&v63];
    }
  }
}

- (CGRect)p_boundsForMathResultViews
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  double v7 = [(CRLFreehandDrawingRep *)self p_baseMathView];
  double v8 = [v7 subviews];

  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        CGFloat v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        double v14 = [v13 subviews];
        id v15 = [v14 count];

        if (v15)
        {
          [(CRLFreehandDrawingRep *)self p_boundsInNaturalSpaceForMathView:v13];
          v32.origin.CGFloat x = v16;
          v32.origin.CGFloat y = v17;
          v32.size.CGFloat width = v18;
          v32.size.CGFloat height = v19;
          v29.origin.CGFloat x = x;
          v29.origin.CGFloat y = y;
          v29.size.CGFloat width = width;
          v29.size.CGFloat height = height;
          CGRect v30 = CGRectUnion(v29, v32);
          CGFloat x = v30.origin.x;
          CGFloat y = v30.origin.y;
          CGFloat width = v30.size.width;
          CGFloat height = v30.size.height;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)p_updateLayoutBoundsForMathResultView
{
  [(CRLFreehandDrawingRep *)self p_boundsForMathResultViews];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
  [v11 setBoundsForMathResultViews:v4, v6, v8, v10];

  id v12 = [(CRLCanvasRep *)self layout];
  [v12 invalidateFrame];
}

- (void)p_drawChildShapeRepsWithPencilKitStrokes:(id)a3 togetherInContext:(CGContext *)a4
{
  id v4 = a3;
  if ((unint64_t)[v4 count] <= 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD7B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010835F4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD7D0);
    }
    double v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_drawChildShapeRepsWithPencilKitStrokes:togetherInContext:]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:1160 isFatal:0 description:"Should be drawing at least two shape reps here."];
  }
  double v8 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v41 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      CGFloat v13 = 0;
      do
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = [*(id *)(*((void *)&v27 + 1) + 8 * (void)v13) shapeLayout];
        id v15 = [v14 pencilKitStrokesInParentInfoSpace];
        if (v15)
        {
          [v8 addObjectsFromArray:v15];
        }
        else
        {
          unsigned int v16 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014DD7F0);
          }
          CGFloat v17 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v32 = v16;
            __int16 v33 = 2082;
            CGFloat v34 = "-[CRLFreehandDrawingRep p_drawChildShapeRepsWithPencilKitStrokes:togetherInContext:]";
            __int16 v35 = 2082;
            double v36 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m";
            __int16 v37 = 1024;
            int v38 = 1166;
            __int16 v39 = 2082;
            double v40 = "currentStrokesInDrawingSpace";
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014DD810);
          }
          CGFloat v18 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            double v21 = v18;
            double v22 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v32 = v16;
            __int16 v33 = 2114;
            CGFloat v34 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          CGFloat v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_drawChildShapeRepsWithPencilKitStrokes:togetherInContext:]");
          double v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 1166, 0, "invalid nil value for '%{public}s'", "currentStrokesInDrawingSpace");
        }
        CGFloat v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v41 count:16];
    }
    while (v11);
  }

  double v23 = [(CRLCanvasRep *)self canvas];
  long long v24 = [v23 backgroundColor];
  +[CRLPencilKitInkStroke drawStrokes:v8 inContext:a4 overTransparentCanvas:v24 == 0];
}

- (void)recursivelyDrawChildrenInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4
{
  id v6 = a4;
  if (![(CRLFreehandDrawingRep *)self p_isTrifurcatedRenderingEnabled])
  {
    ClipBoundingBoCGFloat x = CGContextGetClipBoundingBox(a3);
    CGFloat x = ClipBoundingBox.origin.x;
    CGFloat y = ClipBoundingBox.origin.y;
    CGFloat width = ClipBoundingBox.size.width;
    CGFloat height = ClipBoundingBox.size.height;
    id v11 = [(CRLFreehandDrawingRep *)self p_shapeChildrenForDrawingRecursively];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1001A53AC;
    v26[3] = &unk_1014DD838;
    id v12 = v6;
    id v27 = v12;
    CGFloat v28 = x;
    CGFloat v29 = y;
    CGFloat v30 = width;
    CGFloat v31 = height;
    uint64_t v13 = [v11 crl_arrayOfObjectsPassingTest:v26];

    double v21 = (void *)v13;
    [(CRLFreehandDrawingRep *)self p_drawShapeChildren:v13 inContext:a3];
    double v14 = [(CRLFreehandDrawingRep *)self p_childrenToExcludeFromFlattenedDrawing];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = [(CRLCanvasRep *)self childReps];
    id v16 = [v15 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          double v20 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v14 containsObject:v20]
            && (!v12 || (*((unsigned int (**)(id, void *))v12 + 2))(v12, v20)))
          {
            CGContextSaveGState(a3);
            [v20 recursivelyDrawInContext:a3 keepingChildrenPassingTest:v12];
            CGContextRestoreGState(a3);
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v22 objects:v32 count:16];
      }
      while (v17);
    }
  }
}

- (void)p_drawShapeChildren:(id)a3 inContext:(CGContext *)a4
{
  id v6 = a3;
  int v7 = sub_1004583EC((uint64_t)a4);
  if (v7)
  {
    [(CRLGroupRep *)self clipRect];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    ClipBoundingBodouble x = CGContextGetClipBoundingBox(a4);
    v57.origin.double x = v9;
    v57.origin.double y = v11;
    v57.size.double width = v13;
    v57.size.double height = v15;
    CGRect v58 = CGRectIntersection(v57, ClipBoundingBox);
    double x = v58.origin.x;
    double y = v58.origin.y;
    double width = v58.size.width;
    double height = v58.size.height;
    if (CGRectIsEmpty(v58)) {
      goto LABEL_23;
    }
    int v51 = v7;
    double v20 = sub_1000646A4(width, height, 3.0);
    double v22 = v21;
    double v23 = sub_100454A60();
    double v25 = sub_100067234(v20, v22, v23, v24);
    double v26 = v20 / v25;
    CGFloat v28 = sub_100455AA8(35, v25, v27);
    uint64_t v29 = sub_100458174((uint64_t)a4);
    uint64_t v30 = sub_1004583EC((uint64_t)a4);
    uint64_t v31 = sub_100458528((uint64_t)a4);
    double v32 = sub_100458664((uint64_t)a4);
    uint64_t v33 = sub_1004582B0((uint64_t)a4);
    sub_1004559A4((uint64_t)v28, v29, v30, v31, v33, v32);
    CGContextScaleCTM(v28, 1.0 / v26, 1.0 / v26);
    CGContextScaleCTM(v28, 3.0, 3.0);
    CGContextTranslateCTM(v28, -x, -y);
  }
  else
  {
    int v51 = 0;
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
    CGFloat v28 = a4;
  }
  CGFloat v34 = +[NSMutableArray array];
  if ([v6 count])
  {
    unint64_t v35 = 0;
    unint64_t v36 = 1;
    while (1)
    {
      __int16 v37 = [v6 objectAtIndexedSubscript:v36 - 1];
      if ((id)v36 == [v6 count]) {
        break;
      }
      int v38 = [v6 objectAtIndexedSubscript:v36];
      if (![(CRLFreehandDrawingRep *)self p_shouldDrawShapeRep:v37 withOtherShapeRep:v38])goto LABEL_10; {
LABEL_11:
      }

      if (v36++ >= (unint64_t)[v6 count]) {
        goto LABEL_13;
      }
    }
    int v38 = 0;
LABEL_10:
    __int16 v39 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v35, v36 - v35);
    [v34 addObject:v39];

    unint64_t v35 = v36;
    goto LABEL_11;
  }
LABEL_13:
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v41 = v34;
  id v42 = [v41 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v42)
  {
    id v43 = v42;
    uint64_t v44 = *(void *)v53;
    do
    {
      long long v45 = 0;
      do
      {
        if (*(void *)v53 != v44) {
          objc_enumerationMutation(v41);
        }
        id v46 = [*(id *)(*((void *)&v52 + 1) + 8 * (void)v45) rangeValue];
        double v48 = [v6 subarrayWithRange:v46, v47];
        [(CRLFreehandDrawingRep *)self p_drawChildShapeReps:v48 togetherInContext:v28];

        long long v45 = (char *)v45 + 1;
      }
      while (v43 != v45);
      id v43 = [v41 countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v43);
  }

  if (v51)
  {
    CGFloat v49 = sub_100457AE4((uint64_t)a4);
    [v49 beginFreehandDrawing:self];
    Image = CGBitmapContextCreateImage(v28);
    CGContextRelease(v28);
    v59.origin.double x = x;
    v59.origin.double y = y;
    v59.size.double width = width;
    v59.size.double height = height;
    CGContextDrawImage(a4, v59, Image);
    CGImageRelease(Image);
    [v49 endFreehandDrawing:self];
  }
LABEL_23:
}

- (void)didUpdateRenderable:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLFreehandDrawingRep;
  id v3 = a3;
  [(CRLCanvasRep *)&v5 didUpdateRenderable:v3];
  id v4 = [v3 layer];

  [v4 setDrawsAsynchronously:1];
}

- (CRLWidthLimitedQueue)queueForConcurrentlyDrawingChildrenIntoLayersIfSafe
{
  if (qword_1016A91D0 != -1) {
    dispatch_once(&qword_1016A91D0, &stru_1014DD858);
  }
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_safeForChildrenToDrawConcurrently);
  if (v3)
  {
    id v7 = (id)qword_1016A91C8;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD878);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108367C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD898);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    objc_super v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep queueForConcurrentlyDrawingChildrenIntoLayersIfSafe]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:1371 isFatal:0 description:"Trying to get the concurrent queue when it isn't safe to do so."];

    id v7 = 0;
  }

  return (CRLWidthLimitedQueue *)v7;
}

- (void)willUpdateChildLayers
{
}

- (void)didUpdateChildLayers
{
  unsigned __int8 v3 = [(CRLFreehandDrawingRep *)self queueForConcurrentlyDrawingChildrenIntoLayersIfSafe];
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD8B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101083704();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD8D8);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    objc_super v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didUpdateChildLayers]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1387, 0, "invalid nil value for '%{public}s'", "queue");
  }
  atomic_store(0, (unsigned __int8 *)&self->_safeForChildrenToDrawConcurrently);
  [v3 performSync:&stru_1014DD8F8];
}

- (id)additionalRenderablesOverRenderable
{
  v32.receiver = self;
  v32.super_class = (Class)CRLFreehandDrawingRep;
  unsigned __int8 v3 = [(CRLCanvasRep *)&v32 additionalRenderablesOverRenderable];
  if (![(CRLFreehandDrawingRep *)self p_isTrifurcatedRenderingEnabled])
  {
    [(CRLFreehandDrawingRepTrifurcationContainer *)self->_activeTrifurcationContainer tearDown];
    activeTrifurcationContainer = self->_activeTrifurcationContainer;
    self->_activeTrifurcationContainer = 0;
    goto LABEL_40;
  }
  activeTrifurcationContainer = [(CRLFreehandDrawingRep *)self p_trifurcationContainer];
  objc_super v5 = [activeTrifurcationContainer backRenderable];
  id v6 = [activeTrifurcationContainer middleRenderable];
  id v7 = [activeTrifurcationContainer frontRenderable];
  if (v5)
  {
    if (v6) {
      goto LABEL_4;
    }
LABEL_19:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD958);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108382C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD978);
    }
    CGFloat v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    double v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep additionalRenderablesOverRenderable]");
    CGFloat v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1405, 0, "invalid nil value for '%{public}s'", "middleRenderable");

    if (v7) {
      goto LABEL_5;
    }
LABEL_28:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD998);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101083798();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD9B8);
    }
    double v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v14);
    }
    CGFloat v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep additionalRenderablesOverRenderable]");
    id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 1406, 0, "invalid nil value for '%{public}s'", "frontRenderable");

    goto LABEL_39;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DD918);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010838C0();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DD938);
  }
  double v8 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v8);
  }
  CGFloat v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep additionalRenderablesOverRenderable]");
  double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1404, 0, "invalid nil value for '%{public}s'", "backRenderable");

  if (!v6) {
    goto LABEL_19;
  }
LABEL_4:
  if (!v7) {
    goto LABEL_28;
  }
LABEL_5:
  if (v5 && v6)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v29 = 0u;
    if (activeTrifurcationContainer)
    {
      [activeTrifurcationContainer transformForMiddleRenderable:0];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v26 = 0u;
      [activeTrifurcationContainer transformForMiddleRenderable:1];
    }
    else
    {
      long long v27 = 0uLL;
      long long v28 = 0uLL;
      long long v26 = 0uLL;
    }
    v25[0] = v29;
    v25[1] = v30;
    v25[2] = v31;
    [v5 setAffineTransform:v25];
    v24[0] = v26;
    v24[1] = v27;
    v24[2] = v28;
    [v6 setAffineTransform:v24];
    v23[0] = v29;
    v23[1] = v30;
    v23[2] = v31;
    [v7 setAffineTransform:v23];
    v33[0] = v5;
    v33[1] = v6;
    v33[2] = v7;
    id v17 = +[NSArray arrayWithObjects:v33 count:3];
    uint64_t v18 = [v3 arrayByAddingObjectsFromArray:v17];

    unsigned __int8 v3 = (void *)v18;
  }
LABEL_39:

LABEL_40:
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:2])
  {
    CGFloat v19 = [(CRLFreehandDrawingRep *)self p_makeDataDetectorRenderables:self->_drawingDetectionItems];
    dataDetectorRenderables = self->_dataDetectorRenderables;
    self->_dataDetectorRenderables = v19;

    uint64_t v21 = [v3 arrayByAddingObjectsFromArray:self->_dataDetectorRenderables];

    unsigned __int8 v3 = (void *)v21;
  }

  return v3;
}

- (void)beginTrifurcatedRenderForChildRep:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 parentRep];

  if (v5 != self)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD9D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010839DC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD9F8);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep beginTrifurcatedRenderForChildRep:]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1438, 0, "expected equality between %{public}s and %{public}s", "childRep.parentRep", "self");
  }
  if ([(NSMutableSet *)self->_childRepsForTrifurcation containsObject:v4])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDA18);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101083954();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDA38);
    }
    CGFloat v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep beginTrifurcatedRenderForChildRep:]");
    CGFloat v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:1439 isFatal:0 description:"Should not ask to begin trifurcated render for a child rep for which it has already begun."];
  }
  [(NSMutableSet *)self->_childRepsForTrifurcation addObject:v4];
  [(CRLFreehandDrawingRepTrifurcationContainer *)self->_activeTrifurcationContainer tearDown];
  activeTrifurcationContainer = self->_activeTrifurcationContainer;
  self->_activeTrifurcationContainer = 0;

  CGFloat v13 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v13 invalidateContentLayersForRep:self];

  if ([(NSMutableSet *)self->_childRepsForTrifurcation count] == (id)1) {
    [(CRLFreehandDrawingRep *)self setNeedsDisplay];
  }
}

- (void)endTrifurcatedRenderForChildRep:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 parentRep];

  if (v5 != self)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDA58);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101083B08();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDA78);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep endTrifurcatedRenderForChildRep:]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1457, 0, "expected equality between %{public}s and %{public}s", "childRep.parentRep", "self");
  }
  if (([(NSMutableSet *)self->_childRepsForTrifurcation containsObject:v4] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDA98);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101083A80();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDAB8);
    }
    CGFloat v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep endTrifurcatedRenderForChildRep:]");
    CGFloat v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:1458 isFatal:0 description:"Should not ask to end trifurcated render for a child rep that did not begin it."];
  }
  [(NSMutableSet *)self->_childRepsForTrifurcation removeObject:v4];
  double v12 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v12 invalidateContentLayersForRep:self];

  if (![(NSMutableSet *)self->_childRepsForTrifurcation count]) {
    [(CRLFreehandDrawingRep *)self setNeedsDisplay];
  }
}

- (BOOL)p_isTrifurcatedRenderingEnabled
{
  return [(NSMutableSet *)self->_childRepsForTrifurcation count] != 0;
}

- (id)p_trifurcationContainer
{
  if (![(CRLFreehandDrawingRep *)self p_isTrifurcatedRenderingEnabled])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDAD8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101083BAC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDAF8);
    }
    unsigned __int8 v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_trifurcationContainer]");
    objc_super v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:1477 isFatal:0 description:"Should not ask for the trifurcation container when rendering is not trifurcated."];
  }
  activeTrifurcationContainer = self->_activeTrifurcationContainer;
  if (activeTrifurcationContainer)
  {
    id v7 = activeTrifurcationContainer;
  }
  else
  {
    double v8 = +[NSMutableArray array];
    CGFloat v9 = +[NSMutableArray array];
    double v10 = +[NSMutableArray array];
    id v11 = [(NSMutableSet *)self->_childRepsForTrifurcation mutableCopy];
    double v12 = [(CRLFreehandDrawingRep *)self p_shapeChildrenForDrawingRecursively];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
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
          uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v18 = [v11 count];
          CGFloat v19 = v10;
          if (v18)
          {
            unsigned int v20 = [v11 containsObject:v17];
            CGFloat v19 = v8;
            if (v20)
            {
              [v11 removeObject:v17];
              CGFloat v19 = v9;
            }
          }
          [v19 addObject:v17];
        }
        id v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v14);
    }
    uint64_t v21 = [[CRLFreehandDrawingRepTrifurcationContainer alloc] initWithDelegate:self backReps:v8 middleReps:v9 frontReps:v10];
    double v22 = self->_activeTrifurcationContainer;
    self->_activeTrifurcationContainer = v21;

    id v7 = self->_activeTrifurcationContainer;
  }

  return v7;
}

- (void)didAddSixChannelEnabledChildRep:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CRLCanvasRep *)self canvas];
  unsigned __int8 v6 = [v5 isCanvasInteractive];

  if ((v6 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDB18);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101083D60();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDB38);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didAddSixChannelEnabledChildRep:]");
    CGFloat v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:1519 isFatal:0 description:"Should not call -didAddSixChannelEnabledChildRep: on a non-interactive canvas."];
  }
  if ([(NSMutableSet *)self->_childRepsWithSixChannelRenderEnabled containsObject:v4])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDB58);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101083CD8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDB78);
    }
    double v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didAddSixChannelEnabledChildRep:]");
    double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:1520 isFatal:0 description:"Should not report to add a six channel enabled child rep that is already added."];
  }
  id v13 = [v4 parentRep];

  if (v13 != self)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDB98);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101083C34();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDBB8);
    }
    id v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v14);
    }
    uint64_t v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didAddSixChannelEnabledChildRep:]");
    id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 1521, 0, "expected equality between %{public}s and %{public}s", "childRep.parentRep", "self");
  }
  [(NSMutableSet *)self->_childRepsWithSixChannelRenderEnabled addObject:v4];
  if ([(NSMutableSet *)self->_childRepsWithSixChannelRenderEnabled count] == (id)1)
  {
    uint64_t v17 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v17 invalidateContentLayersForRep:self];
  }
}

- (void)didRemoveSixChannelEnabledChildRep:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CRLCanvasRep *)self canvas];
  unsigned __int8 v6 = [v5 isCanvasInteractive];

  if ((v6 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDBD8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101083E70();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDBF8);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didRemoveSixChannelEnabledChildRep:]");
    CGFloat v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:1532 isFatal:0 description:"Should not call -didRemoveSixChannelEnabledChildRep: on a non-interactive canvas."];
  }
  if (([(NSMutableSet *)self->_childRepsWithSixChannelRenderEnabled containsObject:v4] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDC18);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101083DE8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDC38);
    }
    double v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didRemoveSixChannelEnabledChildRep:]");
    double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:1533 isFatal:0 description:"Should not report to remove a six channel enabled child rep that was not added."];
  }
  [(NSMutableSet *)self->_childRepsWithSixChannelRenderEnabled removeObject:v4];
  if (![(NSMutableSet *)self->_childRepsWithSixChannelRenderEnabled count])
  {
    id v13 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v13 invalidateContentLayersForRep:self];
  }
}

- (void)didAddSixChannelSuppressingChildRep:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CRLCanvasRep *)self canvas];
  unsigned __int8 v6 = [v5 isCanvasInteractive];

  if ((v6 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDC58);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101084024();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDC78);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didAddSixChannelSuppressingChildRep:]");
    CGFloat v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:1545 isFatal:0 description:"Should not call -didAddSixChannelSuppressingChildRep: on a non-interactive canvas."];
  }
  if ([(NSMutableSet *)self->_childRepsSuppressingSixChannelRender containsObject:v4])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDC98);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101083F9C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDCB8);
    }
    double v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didAddSixChannelSuppressingChildRep:]");
    double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:1546 isFatal:0 description:"Should not report to add a six channel suppressing child rep that is already added."];
  }
  id v13 = [v4 parentRep];

  if (v13 != self)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDCD8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101083EF8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDCF8);
    }
    id v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v14);
    }
    uint64_t v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didAddSixChannelSuppressingChildRep:]");
    id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 1547, 0, "expected equality between %{public}s and %{public}s", "childRep.parentRep", "self");
  }
  [(NSMutableSet *)self->_childRepsSuppressingSixChannelRender addObject:v4];
  if ([(NSMutableSet *)self->_childRepsSuppressingSixChannelRender count] == (id)1)
  {
    uint64_t v17 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v17 invalidateContentLayersForRep:self];
  }
}

- (void)didRemoveSixChannelSuppressingChildRep:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CRLCanvasRep *)self canvas];
  unsigned __int8 v6 = [v5 isCanvasInteractive];

  if ((v6 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDD18);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101084134();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDD38);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didRemoveSixChannelSuppressingChildRep:]");
    CGFloat v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:1558 isFatal:0 description:"Should not call -didRemoveSixChannelSuppressingChildRep: on a non-interactive canvas."];
  }
  if (([(NSMutableSet *)self->_childRepsSuppressingSixChannelRender containsObject:v4] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDD58);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010840AC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDD78);
    }
    double v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep didRemoveSixChannelSuppressingChildRep:]");
    double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:1559 isFatal:0 description:"Should not report to remove a six channel suppressing child rep that was not added."];
  }
  [(NSMutableSet *)self->_childRepsSuppressingSixChannelRender removeObject:v4];
  if (![(NSMutableSet *)self->_childRepsSuppressingSixChannelRender count])
  {
    id v13 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v13 invalidateContentLayersForRep:self];
  }
}

- (BOOL)p_wantsSixChannelLayer
{
  return ![(NSMutableSet *)self->_childRepsSuppressingSixChannelRender count]
      && [(NSMutableSet *)self->_childRepsWithSixChannelRenderEnabled count] != 0;
}

- (id)beginEditingChildrenIfAllowedAtUnscaledPoint:(CGPoint)a3 pickingDeepestChild:(BOOL)a4
{
  objc_super v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned __int8 v6 = [v5 freehandDrawingToolkit];
  unsigned int v7 = [v6 canBeginFreehandDrawingMode];

  if (v7)
  {
    double v8 = self;
    CGFloat v9 = [(CRLCanvasRep *)v8 interactiveCanvasController];
    double v10 = [v9 editorController];
    id v11 = [(CRLCanvasRep *)v8 interactiveCanvasController];
    double v12 = [v11 canvasEditor];
    id v13 = [(CRLCanvasRep *)v8 info];
    id v14 = [v12 selectionPathWithInfo:v13];
    [v10 setSelectionPath:v14];

    uint64_t v15 = [(CRLCanvasRep *)v8 interactiveCanvasController];
    id v16 = [v15 freehandDrawingToolkit];
    [v16 beginDrawingModeIfNeededForTouchType:1];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4 passingTest:(id)a5
{
  BOOL v5 = a4;
  double y = a3.y;
  double x = a3.x;
  CGFloat v9 = (unsigned int (**)(id, CRLFreehandDrawingRep *))a5;
  if (!-[CRLFreehandDrawingRep containsPoint:withPrecision:](self, "containsPoint:withPrecision:", v5, x, y)
    || v9 && !v9[2](v9, self)
    || (double v10 = self) == 0)
  {
    if (![(CRLFreehandDrawingRep *)self p_hasMathResultViews]
      || ([(CRLCanvasRep *)self boundsForStandardKnobs],
          v30.double x = x,
          v30.double y = y,
          !CGRectContainsPoint(v31, v30))
      || (double v10 = self) == 0)
    {
      if ([(NSArray *)self->_drawingDetectionItems count])
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v11 = self->_dataDetectorRenderables;
        double v10 = (CRLFreehandDrawingRep *)[(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v10)
        {
          uint64_t v12 = *(void *)v25;
          while (2)
          {
            for (i = 0; i != v10; i = (CRLFreehandDrawingRep *)((char *)i + 1))
            {
              if (*(void *)v25 != v12) {
                objc_enumerationMutation(v11);
              }
              id v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              uint64_t v15 = objc_opt_class();
              id v16 = sub_1002469D0(v15, v14);
              if (v16
                && -[CRLFreehandDrawingRep p_wasDataDetectorStrokeRenderable:hitAtNaturalPoint:](self, "p_wasDataDetectorStrokeRenderable:hitAtNaturalPoint:", v16, x, y))
              {
                double v10 = self;

                goto LABEL_21;
              }
            }
            double v10 = (CRLFreehandDrawingRep *)[(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
LABEL_21:
      }
      else
      {
        double v10 = 0;
      }
    }
  }
  uint64_t v17 = [(CRLCanvasRep *)self canvas];
  id v18 = [v17 canvasController];
  CGFloat v19 = [v18 freehandDrawingToolkit];
  unsigned int v20 = [v19 isInDrawingMode];

  if (v20)
  {
    v23.receiver = self;
    v23.super_class = (Class)CRLFreehandDrawingRep;
    uint64_t v21 = -[CRLCanvasRep hitRep:withPrecision:passingTest:](&v23, "hitRep:withPrecision:passingTest:", v5, v9, x, y);

    double v10 = (CRLFreehandDrawingRep *)v21;
  }

  return v10;
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  v21.receiver = self;
  v21.super_class = (Class)CRLFreehandDrawingRep;
  BOOL v7 = -[CRLGroupRep containsPoint:withPrecision:](&v21, "containsPoint:withPrecision:", a4);
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:2]
    && !v7)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v8 = self->_dataDetectorRenderables;
    id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
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
          id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v14 = objc_opt_class();
          uint64_t v15 = sub_1002469D0(v14, v13);
          if (v15) {
            BOOL v7 = -[CRLFreehandDrawingRep p_wasDataDetectorStrokeRenderable:hitAtNaturalPoint:](self, "p_wasDataDetectorStrokeRenderable:hitAtNaturalPoint:", v15, x, y, (void)v17);
          }

          if (v7)
          {
            BOOL v7 = 1;
            goto LABEL_15;
          }
        }
        id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      BOOL v7 = 0;
    }
LABEL_15:
  }
  return v7;
}

- (BOOL)containsPoint:(CGPoint)a3 withSlop:(CGSize)a4
{
  double y = a3.y;
  double x = a3.x;
  v21.receiver = self;
  v21.super_class = (Class)CRLFreehandDrawingRep;
  BOOL v7 = -[CRLGroupRep containsPoint:withSlop:](&v21, "containsPoint:withSlop:", a3.x, a3.y, a4.width, a4.height);
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:2]
    && !v7)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v8 = self->_dataDetectorRenderables;
    id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
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
          id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v14 = objc_opt_class();
          uint64_t v15 = sub_1002469D0(v14, v13);
          if (v15) {
            BOOL v7 = -[CRLFreehandDrawingRep p_wasDataDetectorStrokeRenderable:hitAtNaturalPoint:](self, "p_wasDataDetectorStrokeRenderable:hitAtNaturalPoint:", v15, x, y, (void)v17);
          }

          if (v7)
          {
            BOOL v7 = 1;
            goto LABEL_15;
          }
        }
        id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      BOOL v7 = 0;
    }
LABEL_15:
  }
  return v7;
}

- (CGRect)frameInUnscaledCanvasForMarqueeSelecting
{
  v19.receiver = self;
  v19.super_class = (Class)CRLFreehandDrawingRep;
  [(CRLGroupRep *)&v19 frameInUnscaledCanvasForMarqueeSelecting];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(CRLFreehandDrawingRep *)self p_hasMathResultViews])
  {
    [(CRLCanvasRep *)self boundsForStandardKnobs];
    -[CRLCanvasRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:");
    double v4 = v11;
    double v6 = v12;
    double v8 = v13;
    double v10 = v14;
  }
  double v15 = v4;
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (BOOL)intersectsUnscaledRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)CRLFreehandDrawingRep;
  if (-[CRLGroupRep intersectsUnscaledRect:](&v10, "intersectsUnscaledRect:"))
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    BOOL v8 = [(CRLFreehandDrawingRep *)self p_hasMathResultViews];
    if (v8)
    {
      [(CRLFreehandDrawingRep *)self frameInUnscaledCanvasForMarqueeSelecting];
      v13.origin.CGFloat x = x;
      v13.origin.CGFloat y = y;
      v13.size.CGFloat width = width;
      v13.size.CGFloat height = height;
      CGRect v12 = CGRectIntersection(v11, v13);
      v14.origin.CGFloat x = CGRectNull.origin.x;
      v14.origin.CGFloat y = CGRectNull.origin.y;
      v14.size.CGFloat width = CGRectNull.size.width;
      v14.size.CGFloat height = CGRectNull.size.height;
      LOBYTE(v8) = !CGRectEqualToRect(v12, v14);
    }
  }
  return v8;
}

- (BOOL)wantsToManuallyHandleEditMenuTapAtPoint:(CGPoint)a3
{
  if (+[CRLFeatureFlagGroup isMathPaperEnabled])
  {
    double v4 = [(CRLCanvasRep *)self interactiveCanvasController];
    unsigned int v5 = [v4 documentIsSharedReadOnly] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)handleEditMenuTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  if (+[CRLFeatureFlagGroup isMathPaperEnabled]&& [(CRLCanvasRep *)self isSelected])
  {
    double v7 = [(CRLFreehandDrawingRep *)self p_mathRecognitionHandler];
    [v7 setShouldCallEditMenuTapForRep:1];

    BOOL v8 = [(CRLCanvasRep *)self interactiveCanvasController];
    double v9 = [v8 layerHost];
    objc_super v10 = [v9 miniFormatterPresenter];

    CGRect v11 = [v10 asiOSPresenter];
    unsigned int v12 = [v11 isPresentingInFixedPosition];

    if (self->_allowedToToggleMathPopoverUI)
    {
      CGRect v13 = [(CRLFreehandDrawingRep *)self p_mathRecognitionHandler];
      CGRect v14 = [v13 mathViewController];
      unsigned int v15 = [v14 handleSingleTapAtDrawingLocation:x, y];

      double v16 = [(CRLFreehandDrawingRep *)self p_mathRecognitionHandler];
      self->_isPresentingMathPopoverUI = [v16 isPresentingPopoverUI];

      if (v15)
      {
        if ((([v10 isPresentingMiniFormatter] ^ 1 | v12) & 1) == 0) {
          [(CRLFreehandDrawingRep *)self p_hideMiniFormatter];
        }
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        double v17 = [(CRLFreehandDrawingRep *)self p_baseMathView];
        double v18 = [v17 subviews];

        id v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v28;
          while (2)
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v28 != v21) {
                objc_enumerationMutation(v18);
              }
              objc_super v23 = [*(id *)(*((void *)&v27 + 1) + 8 * i) subviews];
              id v24 = [v23 count];

              if (v24)
              {
                long long v25 = [(CRLCanvasRep *)self interactiveCanvasController];
                [v25 invalidateContentLayersForRep:self];

                goto LABEL_22;
              }
            }
            id v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }
LABEL_22:
      }
    }
    else
    {
      self->_allowedToToggleMathPopoverUI = 1;
    }
    if (self->_isPresentingMathPopoverUI) {
      char v26 = 1;
    }
    else {
      char v26 = v12;
    }
    if ((v26 & 1) == 0) {
      [(CRLFreehandDrawingRep *)self p_toggleMiniFormatter];
    }
  }
  else if ([(CRLGroupRep *)self isSelectedIgnoringLocking])
  {
    [(CRLFreehandDrawingRep *)self p_toggleMiniFormatter];
  }
}

- (BOOL)manuallyControlsMiniFormatter
{
  v4.receiver = self;
  v4.super_class = (Class)CRLFreehandDrawingRep;
  unsigned __int8 v2 = [(CRLCanvasRep *)&v4 manuallyControlsMiniFormatter];
  return +[CRLFeatureFlagGroup isMathPaperEnabled] | v2;
}

- (void)p_toggleMiniFormatter
{
  double v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  objc_super v4 = [v3 layerHost];
  unsigned int v5 = [v4 miniFormatterPresenter];
  unsigned int v6 = [v5 isPresentingMiniFormatter];

  if (v6)
  {
    [(CRLFreehandDrawingRep *)self p_hideMiniFormatter];
  }
  else
  {
    [(CRLFreehandDrawingRep *)self p_showMiniFormatter];
  }
}

- (void)p_showMiniFormatter
{
  id v6 = [(CRLCanvasRep *)self interactiveCanvasController];
  if (([v6 documentIsSharedReadOnly] & 1) == 0)
  {
    double v3 = [v6 layerHost];
    objc_super v4 = [v3 miniFormatterPresenter];
    unsigned int v5 = [(CRLFreehandDrawingRep *)self p_selectionPath];
    [v4 presentMiniFormatterForSelectionPath:v5];
  }
}

- (void)p_hideMiniFormatter
{
  id v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  double v3 = [v5 layerHost];
  objc_super v4 = [v3 miniFormatterPresenter];
  [v4 dismissMiniFormatterForRep:self];
}

- (id)p_selectionPath
{
  unsigned int v3 = [(CRLCanvasRep *)self isSelected];
  objc_super v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v5 = v4;
  if (v3)
  {
    id v6 = [v4 editorController];
    double v7 = [v6 selectionPath];
  }
  else
  {
    id v6 = [v4 canvasEditor];
    BOOL v8 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
    double v7 = [v6 selectionPathWithInfo:v8];
  }

  return v7;
}

- (BOOL)handledLassoTapAtPoint:(CGPoint)a3 withInputType:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)CRLFreehandDrawingRep;
  unsigned int v7 = -[CRLCanvasRep handledLassoTapAtPoint:withInputType:](&v9, "handledLassoTapAtPoint:withInputType:", a4);
  if (+[CRLFeatureFlagGroup isMathPaperEnabled]) {
    v7 |= -[CRLFreehandDrawingRep p_handledTapAtPoint:](self, "p_handledTapAtPoint:", x, y);
  }
  return v7;
}

- (BOOL)handledDirectTouchForDrawingModePencilOnlyAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingRep;
  unsigned int v6 = -[CRLCanvasRep handledDirectTouchForDrawingModePencilOnlyAtPoint:](&v8, "handledDirectTouchForDrawingModePencilOnlyAtPoint:");
  if (+[CRLFeatureFlagGroup isMathPaperEnabled]) {
    v6 |= -[CRLFreehandDrawingRep p_handledTapAtPoint:](self, "p_handledTapAtPoint:", x, y);
  }
  return v6;
}

- (BOOL)p_handledTapAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unsigned int v6 = [(CRLFreehandDrawingRep *)self p_mathRecognitionHandler];
  [v6 setShouldCallEditMenuTapForRep:0];

  if ([(CRLCanvasRep *)self isLocked]) {
    return 0;
  }
  objc_super v8 = [(CRLFreehandDrawingRep *)self p_mathRecognitionHandler];
  objc_super v9 = [v8 mathViewController];
  unsigned __int8 v10 = [v9 handleSingleTapAtDrawingLocation:x, y];

  return v10;
}

- (BOOL)directlyManagesLayerContent
{
  if ([(CRLFreehandDrawingRep *)self drawsDescendantsIntoLayer]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLFreehandDrawingRep;
  return [(CRLGroupRep *)&v4 directlyManagesLayerContent];
}

- (Class)layerClass
{
  if ([(CRLFreehandDrawingRep *)self drawsDescendantsIntoLayer])
  {
    [(CRLFreehandDrawingRep *)self p_wantsSixChannelLayer];
    unsigned int v3 = objc_opt_class();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLFreehandDrawingRep;
    unsigned int v3 = [(CRLGroupRep *)&v5 layerClass];
  }

  return (Class)v3;
}

- (BOOL)drawsDescendantsIntoLayer
{
  if (!self->_drawsDescendantsIntoLayer)
  {
    self->_drawsDescendantsIntoLayer = 1;
    [(CRLFreehandDrawingRep *)self setNeedsDisplay];
  }
  return 1;
}

- (CGRect)frameInUnscaledCanvas
{
  if ([(CRLFreehandDrawingRep *)self drawsDescendantsIntoLayer])
  {
    [(CRLGroupRep *)self clipRect];
    -[CRLCanvasRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLFreehandDrawingRep;
    [(CRLGroupRep *)&v7 frameInUnscaledCanvas];
  }
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)i_baseFrameInUnscaledCanvasForPositioningLayer
{
  if ([(CRLFreehandDrawingRep *)self drawsDescendantsIntoLayer])
  {
    [(CRLFreehandDrawingRep *)self frameInUnscaledCanvas];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLFreehandDrawingRep;
    [(CRLGroupRep *)&v7 i_baseFrameInUnscaledCanvasForPositioningLayer];
  }
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)skipsRerenderForTranslation
{
  unsigned __int8 v2 = [(CRLCanvasRep *)self canvas];
  double v3 = [v2 canvasController];
  unsigned __int8 v4 = [v3 shouldSupportedDynamicOperationsEnqueueCommandsInRealTime];

  return v4;
}

- (void)setNeedsDisplay
{
  if ([(CRLFreehandDrawingRep *)self p_shouldAllowSetNeedsDisplay])
  {
    v3.receiver = self;
    v3.super_class = (Class)CRLFreehandDrawingRep;
    [(CRLGroupRep *)&v3 setNeedsDisplay];
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(CRLFreehandDrawingRep *)self p_shouldAllowSetNeedsDisplay])
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLFreehandDrawingRep;
    -[CRLCanvasRep setNeedsDisplayInRect:](&v8, "setNeedsDisplayInRect:", x, y, width, height);
  }
}

- (void)updateRenderableGeometryFromLayout:(id)a3
{
  id v4 = a3;
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  v15.receiver = self;
  v15.super_class = (Class)CRLFreehandDrawingRep;
  [(CRLCanvasRep *)&v15 updateRenderableGeometryFromLayout:v4];
  [v4 frame];
  double v10 = v9;
  double v12 = v11;
  CGRect v13 = [(CRLCanvasRep *)self layout];
  unsigned int v14 = [v13 layoutState];

  if (v14 != 3
    && !sub_100064084(v6, v8, v10, v12)
    && [(CRLFreehandDrawingRep *)self drawsDescendantsIntoLayer]
    && ![(CRLFreehandDrawingRep *)self p_isTrifurcatedRenderingEnabled]
    && [(CRLFreehandDrawingRep *)self p_shouldAllowSetNeedsDisplay])
  {
    [v4 setNeedsDisplay];
  }
}

- (void)becameSelected
{
  v3.receiver = self;
  v3.super_class = (Class)CRLFreehandDrawingRep;
  [(CRLCanvasRep *)&v3 becameSelected];
  self->_allowedToToggleMathPopoverUI = 0;
  self->_isPresentingMathPopoverUI = 0;
}

- (void)becameNotSelected
{
  v3.receiver = self;
  v3.super_class = (Class)CRLFreehandDrawingRep;
  [(CRLCanvasRep *)&v3 becameNotSelected];
  [(_PKDataDetectorInteraction *)self->_pkDataDetectorInteraction setEnabled:0];
}

- (id)childRepsToInformForSelectabilityChanges
{
  return +[NSMutableSet set];
}

- (BOOL)shouldShowSelectionHighlight
{
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingRep;
  unsigned __int8 v3 = [(CRLGroupRep *)&v8 shouldShowSelectionHighlight];
  id v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  double v5 = [v4 freehandDrawingToolkit];
  unsigned __int8 v6 = [v5 isInDrawingMode];

  return v3 & ~v6;
}

- (double)p_zPositionForSelectionHighlightLayer
{
  unsigned __int8 v2 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned __int8 v3 = [v2 freehandDrawingToolkit];
  unsigned int v4 = [v3 isInDrawingMode];

  double result = 0.0;
  if (v4) {
    return 1.0;
  }
  return result;
}

- (BOOL)shouldShowKnobs
{
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingRep;
  unsigned __int8 v3 = [(CRLCanvasRep *)&v8 shouldShowKnobs];
  unsigned int v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  double v5 = [v4 freehandDrawingToolkit];
  unsigned __int8 v6 = [v5 isInDrawingMode];

  return v3 & ~v6;
}

- (BOOL)p_shouldHideDataDetectors:(id)a3
{
  id v4 = a3;
  if (-[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation") || ![v4 count])
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    double v5 = [(CRLCanvasRep *)self interactiveCanvasController];
    unsigned __int8 v6 = [v5 freehandDrawingToolkit];
    unsigned __int8 v7 = [v6 isInDrawingMode];
  }
  return v7;
}

- (id)p_makeDataDetectorRenderables:(id)a3
{
  id v4 = a3;
  if ([(CRLFreehandDrawingRep *)self p_shouldHideDataDetectors:v4])
  {
    id v30 = &__NSArray0__struct;
  }
  else
  {
    id v30 = objc_alloc_init((Class)NSMutableArray);
    double v5 = [(CRLCanvasRep *)self layout];
    unsigned __int8 v6 = [v5 parent];

    memset(&v45, 0, sizeof(v45));
    if (v6) {
      [v6 transformInRoot];
    }
    else {
      memset(&v44, 0, sizeof(v44));
    }
    CGAffineTransformInvert(&v45, &v44);
    unsigned __int8 v7 = [(CRLCanvasRep *)self parentRep];
    objc_super v8 = [(CRLCanvasRep *)self canvas];
    [v8 viewScale];
    CGFloat v10 = v9;

    memset(&v43, 0, sizeof(v43));
    char v26 = v7;
    long long v27 = v6;
    if (v7) {
      [v7 transformToConvertNaturalToLayerRelative:v7 layer:v6];
    }
    else {
      CGAffineTransformMakeScale(&v43, v10, v10);
    }
    CGAffineTransform t1 = v45;
    memset(&v42, 0, sizeof(v42));
    CGAffineTransform t2 = v43;
    CGAffineTransformConcat(&v42, &t1, &t2);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v28 = v4;
    id obj = v4;
    id v11 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v37;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(obj);
          }
          objc_super v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          double v16 = [v15 drawingDetectionItem:v26];
          memset(&t1, 0, sizeof(t1));
          if (v15) {
            [v15 drawingFullTransformInRoot];
          }
          else {
            memset(&v34, 0, sizeof(v34));
          }
          CGAffineTransformInvert(&v35, &v34);
          [(CRLFreehandDrawingRep *)self p_fullTransformInRoot];
          CGAffineTransformConcat(&t1, &v35, &v33);
          memset(&t2, 0, sizeof(t2));
          CGAffineTransform v32 = t1;
          CGAffineTransform v31 = v42;
          CGAffineTransformConcat(&t2, &v32, &v31);
          double v17 = +[CRLDataDetectorStrokeLayer layer];
          double v18 = [(CRLCanvasShapeRenderable *)[CRLCanvasDataDetectorStrokeRenderable alloc] initWithShapeLayer:v17];
          id v19 = [v16 _baselinePath];
          id v20 = CGPathCreateCopyByTransformingPath((CGPathRef)[v19 CGPath], &t2);
          [(CRLCanvasShapeRenderable *)v18 setPath:v20];
          CGPathRelease(v20);
          [v16 _strokeWidth];
          CGFloat v22 = v10 * sub_100407E48(v21 * 0.5, 1.0, 5.0);
          [(CRLCanvasShapeRenderable *)v18 setLineWidth:v22];
          [(CRLCanvasShapeRenderable *)v18 setMiterLimit:v22];
          [(CRLCanvasShapeRenderable *)v18 setLineCap:kCALineCapRound];
          [(CRLCanvasShapeRenderable *)v18 setLineJoin:kCALineCapRound];
          id v23 = +[UIColor tintColor];
          -[CRLCanvasShapeRenderable setStrokeColor:](v18, "setStrokeColor:", [v23 CGColor]);

          id v24 = +[UIColor clearColor];
          -[CRLCanvasShapeRenderable setFillColor:](v18, "setFillColor:", [v24 CGColor]);

          [v16 _frame];
          -[CRLCanvasDataDetectorStrokeRenderable setRecognitionFrame:](v18, "setRecognitionFrame:");
          [v30 addObject:v18];
        }
        id v12 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v12);
    }

    id v4 = v28;
  }

  return v30;
}

- (void)p_invokeDataDetectorIfDetectorRenderableIsTapped:(CGPoint)a3 detectorRenderables:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(NSArray *)self->_drawingDetectionItems count] && self->_pkDataDetectorInteraction)
  {
    -[CRLGroupRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", x, y);
    double v9 = v8;
    double v11 = v10;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v26 = v7;
    id v12 = v7;
    id v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v32;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          double v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v18 = objc_opt_class();
          id v19 = sub_1002469D0(v18, v17);
          if (v19)
          {
            if (-[CRLFreehandDrawingRep p_wasDataDetectorStrokeRenderable:hitAtNaturalPoint:](self, "p_wasDataDetectorStrokeRenderable:hitAtNaturalPoint:", v19, v9, v11))
            {
              [(_PKDataDetectorInteraction *)self->_pkDataDetectorInteraction setEnabled:1];
              id v20 = [(_PKDataDetectorInteraction *)self->_pkDataDetectorInteraction tapGestureRecognizer];
              [v20 setEnabled:0];

              memset(&v30, 0, sizeof(v30));
              double v21 = [(CRLCanvasRep *)self canvas];
              [v21 viewScale];
              CGFloat v23 = v22;
              id v24 = [(CRLCanvasRep *)self canvas];
              [v24 viewScale];
              CGAffineTransformMakeScale(&v30, v23, v25);

              [v19 recognitionFrame];
              CGAffineTransform v29 = v30;
              CGRect v37 = CGRectApplyAffineTransform(v36, &v29);
              -[_PKDataDetectorInteraction setSourceRect:](self->_pkDataDetectorInteraction, "setSourceRect:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
              CGAffineTransform v28 = v30;
              [(_PKDataDetectorInteraction *)self->_pkDataDetectorInteraction setHighlightTransform:&v28];
              CGAffineTransform v27 = v30;
              [(_PKDataDetectorInteraction *)self->_pkDataDetectorInteraction setHighlightPreviewTransform:&v27];
              if (-[_PKDataDetectorInteraction handleTapAtPoint:](self->_pkDataDetectorInteraction, "handleTapAtPoint:", x, y))
              {

                goto LABEL_15;
              }
            }
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    id v7 = v26;
  }
}

- (void)p_updateDataDetectionItemsAndInteraction
{
  unsigned __int8 v3 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
  id v4 = [v3 pkRecognitionController];
  double v5 = [v4 dataDetectorController];
  unsigned __int8 v6 = [v5 currentItems];

  id v7 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v21 = 0u;
        [(CRLFreehandDrawingRep *)self p_fullTransformInRoot];
        id v14 = [CRLFreehandDrawingRepDetectionItem alloc];
        v20[0] = v21;
        v20[1] = v22;
        v20[2] = v23;
        uint64_t v15 = [(CRLFreehandDrawingRepDetectionItem *)v14 initWithDrawingDetectionItem:v13 andDrawingFullTransformInRoot:v20];
        [(NSArray *)v7 addObject:v15];
      }
      id v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  drawingDetectionItems = self->_drawingDetectionItems;
  self->_drawingDetectionItems = v7;
  double v17 = v7;

  NSUInteger v18 = [(NSArray *)self->_drawingDetectionItems count];
  if (v18) {
    [(CRLFreehandDrawingRep *)self p_addDataDetectorInteractionIfNeeded];
  }
  else {
    [(CRLFreehandDrawingRep *)self p_removeDataDetectorInteraction];
  }
  id v19 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v19 invalidateContentLayersForRep:self];
}

- (CGAffineTransform)p_fullTransformInRoot
{
  double v5 = [(CRLCanvasRep *)self layout];
  unsigned __int8 v6 = [v5 geometry];
  id v7 = v6;
  if (v6) {
    [v6 fullTransform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  id v8 = [(CRLCanvasRep *)self layout];
  id v9 = [v8 parent];
  id v10 = v9;
  if (v9) {
    [v9 transformInRoot];
  }
  else {
    memset(&v12, 0, sizeof(v12));
  }
  CGAffineTransformConcat(retstr, &t1, &v12);

  return result;
}

- (void)p_addDataDetectorInteractionIfNeeded
{
  if (!self->_pkDataDetectorInteraction)
  {
    unsigned __int8 v3 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
    id v4 = [v3 pkRecognitionController];

    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DDD98);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010841BC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DDDB8);
      }
      double v5 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v5);
      }
      unsigned __int8 v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_addDataDetectorInteractionIfNeeded]");
      id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 2195, 0, "invalid nil value for '%{public}s'", "self.p_freehandDrawingInfo.pkRecognitionController");
    }
    id v8 = objc_alloc((Class)_PKDataDetectorInteraction);
    id v9 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
    id v10 = [v9 pkRecognitionController];
    uint64_t v11 = (_PKDataDetectorInteraction *)[v8 initWithRecognitionController:v10];
    pkDataDetectorInteraction = self->_pkDataDetectorInteraction;
    self->_pkDataDetectorInteraction = v11;

    uint64_t v13 = [(_PKDataDetectorInteraction *)self->_pkDataDetectorInteraction dataDetectorController];
    id v14 = [v13 delegate];

    if (!v14)
    {
      uint64_t v15 = [(_PKDataDetectorInteraction *)self->_pkDataDetectorInteraction dataDetectorController];
      [v15 setDelegate:self];
    }
    double v16 = [(CRLCanvasRep *)self interactiveCanvasController];
    double v17 = [v16 canvasView];
    [v17 addInteraction:self->_pkDataDetectorInteraction];

    [(_PKDataDetectorInteraction *)self->_pkDataDetectorInteraction setEnabled:0];
  }
}

- (void)p_removeDataDetectorInteraction
{
  if (self->_pkDataDetectorInteraction)
  {
    unsigned __int8 v3 = [(CRLCanvasRep *)self interactiveCanvasController];
    id v4 = [v3 canvasView];
    [v4 removeInteraction:self->_pkDataDetectorInteraction];

    pkDataDetectorInteraction = self->_pkDataDetectorInteraction;
    self->_pkDataDetectorInteraction = 0;
  }
}

- (void)processChangedProperty:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLFreehandDrawingRep;
  -[CRLGroupRep processChangedProperty:](&v5, "processChangedProperty:");
  if (a3 == 5)
  {
    if ([(CRLFreehandDrawingRep *)self drawsDescendantsIntoLayer]) {
      [(CRLFreehandDrawingRep *)self setNeedsDisplay];
    }
  }
}

- (id)p_ingestibleItemSourceForDragInfo:(id)a3
{
  unsigned __int8 v3 = [a3 itemSource];
  id v10 = sub_100246AC8(v3, 1, v4, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLIngestibleItemSource);

  return v10;
}

- (BOOL)p_canReceiveDropWithDragInfo:(id)a3
{
  return 0;
}

- (id)dragAndDropHighlightRenderable
{
  v5.receiver = self;
  v5.super_class = (Class)CRLFreehandDrawingRep;
  unsigned __int8 v3 = [(CRLCanvasRep *)&v5 dragAndDropHighlightRenderable];
  if ([(CRLFreehandDrawingRep *)self shouldShowSelectionHighlight])
  {
    [(CRLFreehandDrawingRep *)self p_zPositionForSelectionHighlightLayer];
    [v3 setZPosition:];
  }

  return v3;
}

- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLFreehandDrawingRep;
  unint64_t v8 = -[CRLCanvasRep dragOperationForDragInfo:atUnscaledPoint:](&v10, "dragOperationForDragInfo:atUnscaledPoint:", v7, x, y);
  if ([(CRLFreehandDrawingRep *)self p_canReceiveDropWithDragInfo:v7]) {
    unint64_t v8 = (unint64_t)[v7 dragOperationMask] & 1;
  }

  return v8;
}

- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a4;
  uint64_t v9 = [(CRLCanvasRep *)self interactiveCanvasController];
  objc_super v10 = [v9 editorController];
  uint64_t v11 = [v9 canvasEditor];
  CGAffineTransform v12 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
  uint64_t v13 = [v11 selectionPathWithInfo:v12];
  [v10 setSelectionPath:v13];

  id v14 = [v10 mostSpecificCurrentEditorOfClass:objc_opt_class()];
  uint64_t v15 = [(CRLFreehandDrawingRep *)self p_ingestibleItemSourceForDragInfo:v8];

  [v14 insertContentsOfFreehandDrawingsFromItemSource:v15 atUnscaledPoint:&stru_1014DDDF8 completionHandler:x, y];
  return 1;
}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLFreehandDrawingRep;
  [(CRLGroupRep *)&v5 dynamicResizeDidEndWithTracker:a3];
  v4.receiver = self;
  v4.super_class = (Class)CRLFreehandDrawingRep;
  [(CRLGroupRep *)&v4 setNeedsDisplay];
}

- (void)dynamicFreeTransformDidEndWithTracker:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLFreehandDrawingRep;
  [(CRLGroupRep *)&v5 dynamicFreeTransformDidEndWithTracker:a3];
  v4.receiver = self;
  v4.super_class = (Class)CRLFreehandDrawingRep;
  [(CRLGroupRep *)&v4 setNeedsDisplay];
}

- (double)canvasViewScaleForTrifurcationContainer:(id)a3
{
  unsigned __int8 v3 = [(CRLCanvasRep *)self canvas];
  [v3 viewScale];
  double v5 = v4;

  return v5;
}

- (double)canvasContentsScaleForTrifurcationContainer:(id)a3
{
  unsigned __int8 v3 = [(CRLCanvasRep *)self canvas];
  [v3 contentsScale];
  double v5 = v4;

  return v5;
}

- (CGPoint)parentScaledCanvasFrameOriginForTrifurcationContainer:(id)a3
{
  unsigned __int8 v3 = [(CRLCanvasRep *)self parentRep];
  double v4 = v3;
  if (v3)
  {
    [v3 layerFrameInScaledCanvas];
    CGFloat x = v5;
    CGFloat y = v7;
  }
  else
  {
    CGFloat x = CGPointZero.x;
    CGFloat y = CGPointZero.y;
  }

  double v9 = x;
  double v10 = y;
  result.CGFloat y = v10;
  result.CGFloat x = v9;
  return result;
}

- (CGRect)clipRectInScaledCanvasForTrifurcationContainer:(id)a3
{
  double v4 = [(CRLCanvasRep *)self canvas];
  [(CRLGroupRep *)self clipRect];
  -[CRLCanvasRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:");
  [v4 convertUnscaledToBoundsRect:];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (void)drawShapeReps:(id)a3 intoContext:(CGContext *)a4 forLayer:(id)a5 inTrifurcationContainer:(id)a6
{
  id v9 = a5;
  id v10 = a3;
  CGContextSaveGState(a4);
  [v9 frame];
  CGContextTranslateCTM(a4, -v11, -v12);
  [(CRLCanvasRep *)self layerFrameInScaledCanvasRelativeToParent];
  CGContextTranslateCTM(a4, v13, v14);
  [(CRLCanvasRep *)self setupForDrawingInLayer:v9 context:a4];
  [(CRLFreehandDrawingRep *)self p_drawShapeChildren:v10 inContext:a4];

  [(CRLCanvasRep *)self didDrawInLayer:v9 context:a4];

  CGContextRestoreGState(a4);
}

- (void)documentModeDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)CRLFreehandDrawingRep;
  [(CRLCanvasRep *)&v6 documentModeDidChange];
  [(CRLCanvasRep *)self invalidateKnobs];
  [(CRLCanvasRep *)self invalidateSelectionHighlightRenderable];
  [(CRLFreehandDrawingRep *)self drawsDescendantsIntoLayer];
  unsigned __int8 v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  double v4 = [v3 freehandDrawingToolkit];
  unsigned __int8 v5 = [v4 isInDrawingMode];

  if ((v5 & 1) == 0) {
    [(CRLFreehandDrawingRep *)self p_removeSubselectionAffordanceIfNeeded];
  }
}

- (void)suppressionOfFreehandContentDidChange
{
  if (![(CRLCanvasRep *)self isLocked])
  {
    unsigned __int8 v3 = [(CRLCanvasRep *)self interactiveCanvasController];
    id v4 = [v3 shouldSuppressFreehandContent];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unsigned __int8 v5 = [v3 containerRenderablesForRep:self];
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setHidden:v4];
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (id)dragItemsForBeginningDragOfChildRep:(id)a3
{
  if ([a3 isSelected])
  {
    id v4 = [(CRLCanvasRep *)self interactiveCanvasController];
    unsigned __int8 v5 = [v4 editorController];
    id v6 = [v5 mostSpecificCurrentEditorOfClass:objc_opt_class()];

    if ([v6 canCopySubselection])
    {
      uint64_t v25 = [v6 createFreehandDrawingsToCopyForSubselection];
      id v7 = +[NSMutableArray array];
      uint64_t v8 = [(CRLCanvasRep *)self interactiveCanvasController];
      id v9 = [v8 infosForCurrentSelectionPath];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v27;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(v9);
            }
            CGFloat v14 = [v8 repForInfo:*(void *)(*((void *)&v26 + 1) + 8 * i)];
            double v15 = [v14 unscaledPathToIncludeForSystemPreviewOutline];
            if (v15) {
              [v7 addObject:v15];
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v11);
      }
      double v16 = objc_alloc_init(CRLItemProviderItemWriter);
      double v17 = [(CRLCanvasRep *)self interactiveCanvasController];
      NSUInteger v18 = (void *)v25;
      id v19 = [(CRLItemProviderItemWriter *)v16 createItemProviderWithCopyOfBoardItems:v25 fromInteractiveCanvasController:v17 outCopiedBoardItems:0];

      if (v19)
      {
        id v20 = +[UIColor clearColor];
        long long v21 = [(CRLCanvasRep *)self dragItemsForBeginningDragWithItemProvider:v19 deepCopiedBoardItems:v25 withUnscaledTracedPaths:v7 previewBackgroundColor:v20 localObjectProvider:0];
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DDE18);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101084250();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DDE38);
        }
        long long v22 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v22);
        }
        id v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep dragItemsForBeginningDragOfChildRep:]");
        long long v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v23, 2415, 0, "invalid nil value for '%{public}s'", "itemProvider");

        long long v21 = &__NSArray0__struct;
        NSUInteger v18 = (void *)v25;
      }
    }
    else
    {
      long long v21 = &__NSArray0__struct;
    }
  }
  else
  {
    long long v21 = &__NSArray0__struct;
  }

  return v21;
}

- (BOOL)wantsToHandleTapsOnBehalfOfRepForSelecting
{
  return [(NSArray *)self->_drawingDetectionItems count] != 0;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return [(NSArray *)self->_drawingDetectionItems count] != 0;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:2])
  {
    id v7 = [(NSArray *)self->_dataDetectorRenderables copy];
    -[CRLFreehandDrawingRep p_invokeDataDetectorIfDetectorRenderableIsTapped:detectorRenderables:](self, "p_invokeDataDetectorIfDetectorRenderableIsTapped:detectorRenderables:", v7, x, y);
  }
  return 0;
}

- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3
{
  return -[CRLGroupRep i_childRepsWantContextMenuWhenEditingDisabledAtPoint:onlyNonGrouped:](self, "i_childRepsWantContextMenuWhenEditingDisabledAtPoint:onlyNonGrouped:", 1, a3.x, a3.y);
}

- (id)unscaledPathToIncludeForSystemPreviewOutline
{
  unsigned __int8 v3 = [(CRLCanvasRep *)self layout];
  id v4 = +[CRLBezierPath bezierPath];
  if (v3) {
    [v3 transformInRoot];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  if (sub_10007F7EC((double *)v12) && ![v4 isEmpty]
    || ([(CRLFreehandDrawingRep *)self p_freehandDrawingInfo],
        unsigned __int8 v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 shouldBeTreatedAsBoxForConnectionLinesForPerf],
        v5,
        (v6 & 1) != 0))
  {
    id v7 = 0;
  }
  else
  {
    id v9 = [v3 i_wrapPath];
    id v7 = [v9 copy];

    if (v7)
    {
      uint64_t v8 = v7;
      if (![v7 isEmpty]) {
        goto LABEL_9;
      }
    }
  }
  [(CRLCanvasRep *)self boundsForStandardKnobs];
  uint64_t v8 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:");

LABEL_9:
  if (v3) {
    [v3 transformInRoot];
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  [v8 transformUsingAffineTransform:v11];
  [v4 appendBezierPath:v8];

  return v4;
}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  id v10 = a4;
  if (-[NSSet containsObject:](self->_currentlySelectedInfosShowingAffordance, "containsObject:"))
  {
    unsigned __int8 v5 = (objc_class *)objc_opt_class();
    unsigned __int8 v6 = sub_10024715C(v5, v10);
    if (v6)
    {
      id v7 = [(CRLCanvasRep *)self layout];
      uint64_t v8 = [v7 layoutController];
      id v9 = [v8 layoutForInfo:v6];

      if ([v9 layoutState] != 2) {
        self->_shouldUpdateAffordanceOnNextDidProcessAllChanges = 1;
      }
    }
  }
}

- (void)didProcessAllChanges
{
  if (self->_shouldUpdateAffordanceOnNextDidProcessAllChanges)
  {
    self->_shouldUpdateAffordanceOnNextDidProcessAllChanges = 0;
    [(CRLFreehandDrawingRep *)self p_selectionOrSelectedInfosChanged];
  }
}

- (void)p_selectionOrSelectedInfosChanged
{
  unsigned __int8 v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v4 = [v3 freehandDrawingToolkit];
  unsigned int v5 = [v4 isInDrawingMode];

  if (v5)
  {
    unsigned __int8 v6 = [(CRLCanvasRep *)self interactiveCanvasController];
    id v7 = [v6 editorController];
    uint64_t v8 = [v7 selectionPath];
    id v12 = [v8 mostSpecificSelectionOfClass:objc_opt_class()];

    if (v12
      && ([v12 boardItems],
          id v9 = objc_claimAutoreleasedReturnValue(),
          [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo],
          id v10 = objc_claimAutoreleasedReturnValue(),
          unsigned int v11 = [v9 containsObject:v10],
          v10,
          v9,
          v11))
    {
      [(CRLFreehandDrawingRep *)self p_updateSubselectionAffordance];
    }
    else
    {
      [(CRLFreehandDrawingRep *)self p_removeSubselectionAffordanceIfNeeded];
    }
  }
}

- (void)p_updateSubselectionAffordance
{
  unsigned __int8 v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v4 = [v3 editorController];
  unsigned int v5 = [v4 selectionPath];
  unsigned __int8 v6 = [v5 mostSpecificSelectionOfClass:objc_opt_class()];

  id v7 = [v6 boardItems];
  id v20 = +[NSMutableSet set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v14 = objc_opt_class();
        double v15 = sub_1002469D0(v14, v13);
        double v16 = v15;
        if (v15)
        {
          double v17 = [v15 parentInfo];
          NSUInteger v18 = [(CRLGroupRep *)self containerInfo];
          unsigned int v19 = [v17 isEqual:v18];

          if (v19) {
            [v20 addObject:v16];
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  [(CRLFreehandDrawingRep *)self p_showSubselectionAffordanceForInfos:v20];
}

- (void)p_removeSubselectionAffordanceIfNeeded
{
  unsigned __int8 v3 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
  unsigned int v4 = [v3 showingSubselectionAffordance];

  if (v4)
  {
    id v5 = +[NSSet set];
    [(CRLFreehandDrawingRep *)self p_showSubselectionAffordanceForInfos:v5];
  }
}

- (void)p_showSubselectionAffordanceForInfos:(id)a3
{
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = self->_currentlySelectedInfosShowingAffordance;
  id v6 = [(NSSet *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v11 = [(CRLCanvasRep *)self interactiveCanvasController];
        id v12 = [v11 editingCoordinator];
        long long v13 = [v12 changeNotifier];
        [v13 removeObserver:self forChangeSource:v10];
      }
      id v7 = [(NSSet *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v7);
  }

  uint64_t v14 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
  [v14 showSubselectionAffordanceForSelectedInfos:v4];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v15 = (NSSet *)v4;
  id v16 = [(NSSet *)v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * (void)j);
        long long v21 = [(CRLCanvasRep *)self interactiveCanvasController];
        long long v22 = [v21 editingCoordinator];
        long long v23 = [v22 changeNotifier];
        [v23 addObserver:self forChangeSource:v20];
      }
      id v17 = [(NSSet *)v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v17);
  }

  currentlySelectedInfosShowingAffordance = self->_currentlySelectedInfosShowingAffordance;
  self->_currentlySelectedInfosShowingAffordance = v15;
}

- (CRLFreehandDrawingLayout)p_freehandDrawingLayout
{
  unsigned __int8 v3 = (objc_class *)objc_opt_class();
  id v4 = [(CRLCanvasRep *)self layout];
  id v5 = sub_10024715C(v3, v4);

  return (CRLFreehandDrawingLayout *)v5;
}

- (id)p_shapeChildrenForDrawingRecursively
{
  unsigned __int8 v3 = [(CRLCanvasRep *)self childReps];
  id v4 = [(CRLFreehandDrawingRep *)self p_childrenToExcludeFromFlattenedDrawing];
  if ([v4 count])
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001ABF30;
    _OWORD v23[3] = &unk_1014D0498;
    v23[4] = v4;
    uint64_t v5 = [v3 crl_arrayOfObjectsPassingTest:v23];

    unsigned __int8 v3 = (void *)v5;
  }
  id v6 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v13 = (objc_class *)objc_opt_class();
        uint64_t v14 = sub_10024715C(v13, v12);
        double v15 = v14;
        if (v14)
        {
          id v16 = [v14 shapeLayout];
          unsigned __int8 v17 = [v16 isInvisible];

          if ((v17 & 1) == 0) {
            [v6 addObject:v15];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)p_childrenToExcludeFromFlattenedDrawing
{
  unsigned __int8 v3 = +[NSMutableSet set];
  id v4 = [(CRLCanvasRep *)self canvas];
  unsigned int v5 = [v4 isCanvasInteractive];

  if (v5)
  {
    id v6 = [(CRLCanvasRep *)self interactiveCanvasController];
    id v7 = [(CRLFreehandDrawingRep *)self p_freehandDrawingLayout];
    id v8 = [v7 transformInfo];
    if (v8)
    {
      id v9 = [v6 repForInfo:v8];
      if (v9) {
        [v3 addObject:v9];
      }
    }
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v6 freehandDrawingToolkit];
    id v12 = [v11 currentTool];
    long long v13 = sub_1002469D0(v10, v12);

    if (v13)
    {
      uint64_t v14 = [v13 drawingReps];
      double v15 = [v14 allObjects];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1001AC11C;
      v18[3] = &unk_1014DDE60;
      v18[4] = self;
      id v16 = [v15 crl_arrayOfObjectsPassingTest:v18];

      [v3 addObjectsFromArray:v16];
    }
  }

  return v3;
}

- (BOOL)p_shouldAllowSetNeedsDisplay
{
  if ([(CRLCanvasRep *)self isBeingResized]
    || [(CRLCanvasRep *)self isBeingFreeTransformed])
  {
    unsigned __int8 v3 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
    if ([v3 aspectRatioLocked])
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      unsigned int v5 = [(CRLCanvasRep *)self layout];
      id v6 = [v5 geometryInRoot];
      id v7 = v6;
      if (v6) {
        [v6 transform];
      }
      else {
        memset(v9, 0, sizeof(v9));
      }
      BOOL v4 = !sub_10007F964((double *)v9);
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)p_wasDataDetectorStrokeRenderable:(id)a3 hitAtNaturalPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v9 = [v8 renderableForRep:self];
  if (v9)
  {
    -[CRLCanvasRep convertNaturalPointToLayerRelative:](self, "convertNaturalPointToLayerRelative:", x, y);
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = [v9 layer];
    [v7 convertPoint:v14 fromLayer:v11];
    double v16 = v15;
    double v18 = v17;

    long long v19 = +[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", [v7 path]);
    [v19 distanceToPoint:0 elementIndex:0 tValue:0 threshold:v16 findClosestMatch:40.0 * 0.5];
    BOOL v21 = v20 <= 40.0 * 0.5;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDE80);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010842E4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDEA0);
    }
    long long v22 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v22);
    }
    long long v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingRep p_wasDataDetectorStrokeRenderable:hitAtNaturalPoint:]");
    long long v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 2676, 0, "invalid nil value for '%{public}s'", "contentRenderable");

    BOOL v21 = 0;
  }

  return v21;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)crlaxChildren
{
  return 0;
}

- (BOOL)crlaxAllowedToEditChildren
{
  return 0;
}

- (id)accessibilityHint
{
  unsigned __int8 v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  BOOL v4 = [v3 freehandDrawingToolkit];
  unsigned int v5 = [v4 isInDrawingMode];

  if (v5)
  {
    id v6 = +[NSBundle mainBundle];
    id v7 = v6;
    CFStringRef v8 = @"Double tap and hold, then drag to draw.";
LABEL_5:
    id v9 = [v6 localizedStringForKey:v8 value:0 table:0];

    goto LABEL_7;
  }
  if ([(CRLCanvasRep *)self isSelected])
  {
    id v6 = +[NSBundle mainBundle];
    id v7 = v6;
    CFStringRef v8 = @"Double tap to edit drawing.";
    goto LABEL_5;
  }
  v11.receiver = self;
  v11.super_class = (Class)CRLFreehandDrawingRep;
  id v9 = [(CRLFreehandDrawingRep *)&v11 accessibilityHint];
LABEL_7:

  return v9;
}

- (BOOL)accessibilityActivate
{
  if ([(CRLCanvasRep *)self isSelected])
  {
    unsigned __int8 v3 = [(CRLCanvasRep *)self interactiveCanvasController];
    BOOL v4 = [v3 freehandDrawingToolkit];
    unsigned __int8 v5 = [v4 isInDrawingMode];

    if (v5)
    {
      return 0;
    }
    else
    {
      id v7 = [(CRLCanvasRep *)self interactiveCanvasController];
      CFStringRef v8 = [v7 freehandDrawingToolkit];
      BOOL v6 = 1;
      [v8 beginDrawingModeIfNeededForTouchType:1];
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLFreehandDrawingRep;
    return [(CRLFreehandDrawingRep *)&v10 accessibilityActivate];
  }
  return v6;
}

- (id)accessibilityDragSourceDescriptors
{
  unsigned __int8 v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  BOOL v4 = [v3 freehandDrawingToolkit];
  unsigned __int8 v5 = [v4 isInDrawingMode];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLFreehandDrawingRep;
    BOOL v6 = [(CRLFreehandDrawingRep *)&v8 accessibilityDragSourceDescriptors];
  }

  return v6;
}

- (id)accessibilityCustomActions
{
  unsigned __int8 v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  BOOL v4 = [v3 freehandDrawingToolkit];
  unsigned __int8 v5 = [v4 isInDrawingMode];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLFreehandDrawingRep;
    BOOL v6 = [(CRLFreehandDrawingRep *)&v8 accessibilityCustomActions];
  }

  return v6;
}

- (CGPoint)accessibilityActivationPoint
{
  unsigned __int8 v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  BOOL v4 = [v3 freehandDrawingToolkit];
  unsigned __int8 v5 = [v4 isInDrawingMode];

  CGFloat MidX = -1.0;
  double MidY = -1.0;
  if ((v5 & 1) == 0)
  {
    [(CRLFreehandDrawingRep *)self accessibilityFrame];
    CGFloat x = v14.origin.x;
    CGFloat y = v14.origin.y;
    CGFloat width = v14.size.width;
    CGFloat height = v14.size.height;
    CGFloat MidX = CGRectGetMidX(v14);
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v15);
  }
  double v12 = MidX;
  result.CGFloat y = MidY;
  result.CGFloat x = v12;
  return result;
}

- (BOOL)crlaxNeedsEditRotorMenu
{
  unsigned __int8 v3 = [(CRLCanvasRep *)self info];
  BOOL v4 = +[NSMutableArray arrayWithObject:v3];

  unsigned __int8 v5 = [(CRLFreehandDrawingRep *)self p_freehandDrawingInfo];
  BOOL v6 = [v5 childInfos];
  [v4 addObjectsFromArray:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        double v13 = [(CRLCanvasRep *)self interactiveCanvasController];
        LOBYTE(v12) = [v13 currentSelectionPathContainsInfo:v12];

        if (v12)
        {
          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (CGRect)crlaxAttachedMathResultViewFrame
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  BOOL v6 = [(CRLFreehandDrawingRep *)self p_baseMathView];
  id v7 = [v6 subviews];

  id v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v29;
    CGFloat v24 = height;
    CGFloat v25 = width;
    CGFloat v26 = y;
    CGFloat v27 = CGRectNull.origin.x;
    do
    {
      objc_super v11 = 0;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * (void)v11) accessibilityFrame:*(void *)&v24, *(void *)&v25, *(void *)&v26, *(void *)&v27];
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        v33.origin.CGFloat x = x;
        v33.origin.CGFloat y = y;
        v33.size.CGFloat width = width;
        v33.size.CGFloat height = height;
        v37.origin.CGFloat y = v26;
        v37.origin.CGFloat x = v27;
        v37.size.CGFloat height = v24;
        v37.size.CGFloat width = v25;
        if (CGRectEqualToRect(v33, v37))
        {
          CGFloat height = v19;
          CGFloat width = v17;
          CGFloat y = v15;
          CGFloat x = v13;
        }
        else
        {
          v34.origin.CGFloat x = x;
          v34.origin.CGFloat y = y;
          v34.size.CGFloat width = width;
          v34.size.CGFloat height = height;
          v38.origin.CGFloat x = v13;
          v38.origin.CGFloat y = v15;
          v38.size.CGFloat width = v17;
          v38.size.CGFloat height = v19;
          CGRect v35 = CGRectIntersection(v34, v38);
          CGFloat x = v35.origin.x;
          CGFloat y = v35.origin.y;
          CGFloat width = v35.size.width;
          CGFloat height = v35.size.height;
        }
        objc_super v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v9);
  }

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (NSString)crlaxRecognizedMathDescription
{
  unsigned __int8 v2 = [(CRLFreehandDrawingRep *)self p_mathRecognitionHandler];
  unsigned __int8 v3 = [v2 crlaxRecognizedMathDescription];

  return (NSString *)v3;
}

- (NSArray)decoratorOverlayRenderables
{
  return self->decoratorOverlayRenderables;
}

- (NSSet)subscribedFreehandDrawingIDs
{
  return self->_subscribedFreehandDrawingIDs;
}

- (CRLBidirectionalMap)drawingShapeItemUUIDToStrokeDataUUIBidirectionalMap
{
  return self->_drawingShapeItemUUIDToStrokeDataUUIBidirectionalMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingShapeItemUUIDToStrokeDataUUIBidirectionalMap, 0);
  objc_storeStrong((id *)&self->_subscribedFreehandDrawingIDs, 0);
  objc_storeStrong((id *)&self->decoratorOverlayRenderables, 0);
  objc_storeStrong((id *)&self->_drawingShapeItemUUIDToStrokeDataUUIDBidirectionalMap, 0);
  objc_storeStrong((id *)&self->_dataDetectorRenderables, 0);
  objc_storeStrong((id *)&self->_drawingDetectionItems, 0);
  objc_storeStrong((id *)&self->_pkDataDetectorInteraction, 0);
  objc_storeStrong((id *)&self->_pkDrawing, 0);
  objc_storeStrong((id *)&self->_childRepsSuppressingSixChannelRender, 0);
  objc_storeStrong((id *)&self->_childRepsWithSixChannelRenderEnabled, 0);
  objc_storeStrong((id *)&self->_activeTrifurcationContainer, 0);
  objc_storeStrong((id *)&self->_childRepsForTrifurcation, 0);

  objc_storeStrong((id *)&self->_currentlySelectedInfosShowingAffordance, 0);
}

@end