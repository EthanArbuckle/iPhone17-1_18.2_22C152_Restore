@interface CRLiOSDocumentModeFreehandDrawing
- (BOOL)allowGestureInRestrictedGestureMode:(id)a3;
- (BOOL)allowedToEnterQuickSelectModeForCanvasViewController:(id)a3;
- (BOOL)allowsFingerDrawing;
- (BOOL)currentlyDisplayingLassoSelectionMenu;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4;
- (BOOL)handleTapOnCanvasBackgroundAtUnscaledPoint:(CGPoint)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidForEditorController:(id)a3;
- (BOOL)p_gestureRecognizer:(id)a3 shouldReceiveTouchAtLocation:(CGPoint)a4 touchType:(int64_t)a5;
- (BOOL)p_shouldPresentHandwritingIntelligenceActionsForCurrentSelectionPath;
- (BOOL)shouldHandleDoubleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4;
- (BOOL)shouldProhibitAction:(SEL)a3 withSender:(id)a4;
- (BOOL)wantsAlternateContextMenuBehaviorAtPoint:(CGPoint)a3;
- (BOOL)wantsCanvasInRestrictedGestureMode;
- (BOOL)wantsDoneButtonInCompact;
- (BOOL)wantsLegacyEditMenu;
- (BOOL)wantsToEndForDragAndDropInteractions;
- (BOOL)wantsToEndForNonPopoverPresentations;
- (BOOL)wantsToSuppressBottomToolbarInCompact;
- (BOOL)wantsToSuppressMediaReplacementKnobs;
- (BOOL)wantsToSuppressMiniFormatter;
- (BOOL)wantsToSuppressMultiselectionWithSingleBounds;
- (BOOL)wantsToSuppressSelectionKnobs;
- (BOOL)wantsToSuppressZoomInResponseToSelectionChange;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (CRLiOSDocumentModeFreehandDrawing)initWithBoardViewController:(id)a3 andInteractiveCanvasController:(id)a4;
- (id)allowedKeyCommandsFromKeyCommands:(id)a3;
- (id)contextMenuConfigurationForContextMenuInteraction:(id)a3 atPoint:(CGPoint)a4 onInteractiveCanvasController:(id)a5;
- (id)cursorAtPoint:(CGPoint)a3 withCursorPlatformObject:(id)a4;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)gesturesToAdjustIfPencilShouldSelectAndScrollFromGestures:(id)a3;
- (id)p_menuElementsToDisplayForLassoSelectionAtPoint:(CGPoint)a3 menuType:(unint64_t)a4;
- (id)p_sortedMenuElementsFromMenuElements:(id)a3 withMenuType:(unint64_t)a4;
- (id)p_windowScene;
- (id)toolTray;
- (id)validateSelectionPathIfNeededFromPersistableSelectionPath:(id)a3 withSelectionPathValidator:(id)a4;
- (unint64_t)hash;
- (unint64_t)p_currentLassoSelectionType;
- (unint64_t)p_currentLockedInfosCount;
- (unint64_t)pencilModeType;
- (void)beginDrawingTransformMode;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)hideEditMenuForLassoSelection;
- (void)modeDidBeginFromMode:(id)a3 forced:(BOOL)a4;
- (void)modeDidEndForMode:(id)a3 forced:(BOOL)a4;
- (void)modeDidPresentBottomToolTray;
- (void)modeWillBeginFromMode:(id)a3 forced:(BOOL)a4;
- (void)modeWillEndForMode:(id)a3 forced:(BOOL)a4;
- (void)p_addObservationOfInteractiveCanvasController:(id)a3;
- (void)p_deselectAllInfosNotInDrawingsOrDrawings;
- (void)p_editMenuTapReceived:(id)a3;
- (void)p_handleMarqueeTapWithInput:(id)a3 afterDelay:(double)a4;
- (void)p_removeObservationOfInteractiveCanvasController:(id)a3;
- (void)p_sceneWillDeactivate:(id)a3;
- (void)p_updatePanAndDrawingGestureRecognizersForState;
- (void)pencilKitDidSmartSelectStrokesInDrawingShapeItems:(id)a3;
- (void)prefersPencilOnlyDrawingDidChange;
- (void)presentEditMenuForLassoSelection;
- (void)selectionPathDidChange:(id)a3;
- (void)setInteractiveCanvasController:(id)a3;
- (void)toolkitDidUpdateCurrentToolSelection;
- (void)toolkitDidUpdateRulerVisibility;
@end

@implementation CRLiOSDocumentModeFreehandDrawing

- (CRLiOSDocumentModeFreehandDrawing)initWithBoardViewController:(id)a3 andInteractiveCanvasController:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSDocumentModeFreehandDrawing;
  v7 = [(CRLiOSDocumentMode *)&v10 initWithBoardViewController:a3];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_icc, v6);
    v8->_previousCanvasScrollMinTouchCount = 1;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  return 5;
}

- (BOOL)shouldProhibitAction:(SEL)a3 withSender:(id)a4
{
  return "paste:" != a3
      && "copy:" != a3
      && "cut:" != a3
      && "selectAll:" != a3
      && "transform:" != a3
      && "duplicate:" != a3
      && "separate:" != a3
      && "mergeDrawings:" != a3
      && "delete:" != a3;
}

- (unint64_t)pencilModeType
{
  return 1;
}

- (BOOL)wantsCanvasInRestrictedGestureMode
{
  return 1;
}

- (BOOL)allowGestureInRestrictedGestureMode:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v6 = [WeakRetained layerHost];
  v7 = [v6 asiOSCVC];

  uint64_t v8 = [v7 allTouchesDoneGestureRecognizer];
  if ((id)v8 == v4)
  {
    unsigned __int8 v23 = 1;
    v9 = v4;
    goto LABEL_22;
  }
  v9 = (void *)v8;
  uint64_t v10 = [v7 preventScrollGestureRecognizer];
  if ((id)v10 == v4)
  {

LABEL_21:
    unsigned __int8 v23 = 1;
    goto LABEL_22;
  }
  v11 = (void *)v10;
  uint64_t v12 = [v7 zoomGestureRecognizer];
  if ((id)v12 == v4)
  {

LABEL_20:
    goto LABEL_21;
  }
  v13 = (void *)v12;
  uint64_t v14 = [v7 freehandDrawingGestureRecognizer];
  if ((id)v14 == v4)
  {

LABEL_19:
    goto LABEL_20;
  }
  v15 = (void *)v14;
  uint64_t v16 = [v7 knobDragGestureRecognizer];
  if ((id)v16 == v4)
  {

LABEL_18:
    goto LABEL_19;
  }
  v17 = (void *)v16;
  uint64_t v18 = [v7 singleTapGestureRecognizer];
  if ((id)v18 == v4)
  {

LABEL_17:
    goto LABEL_18;
  }
  v19 = (void *)v18;
  uint64_t v20 = [v7 repDragGestureRecognizer];
  if ((id)v20 == v4)
  {

    goto LABEL_17;
  }
  v21 = (void *)v20;
  id v22 = [v7 doubleTapGestureRecognizer];

  if (v22 == v4)
  {
    unsigned __int8 v23 = 1;
    goto LABEL_23;
  }
  v9 = [v7 appSpecificGestureRecognizersAllowedDuringFreehandDrawing];
  unsigned __int8 v23 = [v9 containsObject:v4];
LABEL_22:

LABEL_23:
  return v23;
}

- (id)gesturesToAdjustIfPencilShouldSelectAndScrollFromGestures:(id)a3
{
  id v4 = [a3 mutableCopy];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v6 = [WeakRetained layerHost];
  v7 = [v6 asiOSCVC];

  uint64_t v8 = [v7 singleTapGestureRecognizer];
  [v4 removeObject:v8];

  v9 = [v7 repDragGestureRecognizer];
  [v4 removeObject:v9];

  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:1])
  {
    uint64_t v10 = [v7 doubleTapGestureRecognizer];
    [v4 removeObject:v10];
  }

  return v4;
}

- (id)allowedKeyCommandsFromKeyCommands:(id)a3
{
  return 0;
}

- (BOOL)wantsToSuppressZoomInResponseToSelectionChange
{
  return 1;
}

- (BOOL)wantsToSuppressMiniFormatter
{
  return 1;
}

- (BOOL)wantsToSuppressBottomToolbarInCompact
{
  return 1;
}

- (BOOL)wantsToEndForNonPopoverPresentations
{
  return 1;
}

- (BOOL)wantsToEndForDragAndDropInteractions
{
  return 1;
}

- (id)validateSelectionPathIfNeededFromPersistableSelectionPath:(id)a3 withSelectionPathValidator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v9 = [WeakRetained freehandDrawingToolkit];

  uint64_t v10 = [v9 currentTool];
  id v11 = [v10 type];

  unsigned int v12 = [v9 isLassoAbleToSelectMixedType];
  if (v11 != (id)9 || v12 == 0)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = [v7 selectionPathFromPersistableSelectionPath:v6 selectableBoardItemsFromParentMapAndSiblings:&stru_1014DBBD8];
  }

  return v14;
}

- (BOOL)wantsLegacyEditMenu
{
  return 1;
}

- (void)setInteractiveCanvasController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);

  v5 = obj;
  if (WeakRetained != obj)
  {
    if (self->_isObservingICCNotifications)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_icc);
      [(CRLiOSDocumentModeFreehandDrawing *)self p_removeObservationOfInteractiveCanvasController:v6];

      [(CRLiOSDocumentModeFreehandDrawing *)self p_addObservationOfInteractiveCanvasController:obj];
    }
    objc_storeWeak((id *)&self->_icc, obj);
    v5 = obj;
  }
}

- (void)p_addObservationOfInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  id v6 = +[NSNotificationCenter defaultCenter];
  v5 = [v4 editorController];

  [v6 addObserver:self selector:"selectionPathDidChange:" name:@"CRLEditorControllerSelectionPathDidChangeNotification" object:v5];
  self->_isObservingICCNotifications = 1;
}

- (void)p_removeObservationOfInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  id v6 = +[NSNotificationCenter defaultCenter];
  v5 = [v4 editorController];

  [v6 removeObserver:self name:@"CRLEditorControllerSelectionPathDidChangeNotification" object:v5];
  self->_isObservingICCNotifications = 0;
}

- (BOOL)wantsDoneButtonInCompact
{
  return 1;
}

- (void)selectionPathDidChange:(id)a3
{
  id v4 = [a3 object];
  v5 = [(CRLiOSDocumentModeFreehandDrawing *)self interactiveCanvasController];
  id v6 = [v5 editorController];

  if (v4 != v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBBF8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101080830();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBC18);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing selectionPathDidChange:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:248 isFatal:0 description:"The observed editor controller does not match the editor controller owned by self.interactiveCanvasController. You probably forgot to update observation in -setInteractiveCanvasController:"];
  }
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  unsigned int v12 = [WeakRetained freehandDrawingToolkit];

  v13 = [v12 currentTool];
  id v14 = [v13 type];

  if (v14 != (id)9)
  {
    id v15 = objc_loadWeakRetained((id *)p_icc);
    uint64_t v16 = [v15 editorController];
    v17 = [v16 mostSpecificCurrentEditorOfClass:objc_opt_class()];

    if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:0])
    {
      id v18 = objc_loadWeakRetained((id *)p_icc);
      v19 = [v18 editorController];
      uint64_t v20 = [v19 mostSpecificCurrentEditorOfClass:objc_opt_class()];

      id v21 = objc_loadWeakRetained((id *)p_icc);
      id v22 = [v21 editorController];
      unsigned __int8 v23 = [v22 mostSpecificCurrentEditorOfClass:objc_opt_class()];

      if (v20 && v23)
      {
        [v12 setCurrentToolSelection:9];
      }
      else
      {
        id v24 = objc_loadWeakRetained((id *)p_icc);
        v25 = [v24 editorController];
        v26 = [v25 mostSpecificCurrentEditorOfClass:objc_opt_class()];

        if (v26)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [v12 setCurrentToolSelection:9];
          }
        }
      }
    }
    else if (v17)
    {
      [v12 setCurrentToolSelection:9];
    }
  }
}

- (void)modeWillBeginFromMode:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CRLiOSDocumentModeFreehandDrawing;
  id v6 = a3;
  [(CRLiOSDocumentMode *)&v22 modeWillBeginFromMode:v6 forced:v4];
  id v7 = [(CRLiOSDocumentMode *)self boardViewController];
  uint64_t v8 = [v7 presentedViewController];

  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 dismissPresentedViewController];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  [(CRLiOSDocumentModeFreehandDrawing *)self p_addObservationOfInteractiveCanvasController:WeakRetained];

  id v10 = objc_loadWeakRetained((id *)&self->_icc);
  id v11 = [v10 freehandDrawingToolkit];

  if (!v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBC38);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010808B8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBC58);
    }
    unsigned int v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing modeWillBeginFromMode:forced:]");
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 292, 0, "invalid nil value for '%{public}s'", "toolkit");
  }
  [v11 addToolkitObserver:self];
  id v15 = [v6 toolTray];
  uint64_t v16 = [(CRLiOSDocumentModeFreehandDrawing *)self toolTray];

  if (v15 == v16) {
    self->_didFinishPresentingBottomToolTray = 1;
  }
  id v17 = [v6 pencilModeType];

  if (v17 != (id)1) {
    +[CRLAnalyticsFeatureUsed logFeatureUsedWithName:6];
  }
  id v18 = (UIEditMenuInteraction *)[objc_alloc((Class)UIEditMenuInteraction) initWithDelegate:self];
  lassoSelectionEditMenuInteraction = self->_lassoSelectionEditMenuInteraction;
  self->_lassoSelectionEditMenuInteraction = v18;

  [(UIEditMenuInteraction *)self->_lassoSelectionEditMenuInteraction setPresentsContextMenuAsSecondaryAction:0];
  id v20 = objc_loadWeakRetained((id *)&self->_icc);
  id v21 = [v20 canvasView];
  [v21 addInteraction:self->_lassoSelectionEditMenuInteraction];
}

- (void)modeDidBeginFromMode:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  v34.receiver = self;
  v34.super_class = (Class)CRLiOSDocumentModeFreehandDrawing;
  id v6 = a3;
  [(CRLiOSDocumentMode *)&v34 modeDidBeginFromMode:v6 forced:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  [WeakRetained invalidateAllLayers];

  id v8 = objc_loadWeakRetained((id *)&self->_icc);
  v9 = [v8 layerHost];
  id v10 = [v9 asiOSCVC];

  id v11 = [v10 canvasView];
  uint64_t v12 = objc_opt_class();
  sub_1002469D0(v12, v6);
  v13 = (unint64_t *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    self->_previousCanvasScrollMinTouchCount = v13[3];
  }
  else
  {
    id v14 = [v11 enclosingScrollView];
    id v15 = [v14 panGestureRecognizer];

    self->_previousCanvasScrollMinTouchCount = (unint64_t)[v15 minimumNumberOfTouches];
  }
  uint64_t v16 = [v10 freehandDrawingGestureRecognizer];
  id v17 = [v16 allowedTouchTypes];
  previousFreehandGestureTouchTypes = self->_previousFreehandGestureTouchTypes;
  self->_previousFreehandGestureTouchTypes = v17;

  v19 = [v10 repDragGestureRecognizer];
  [v19 setAllowedTouchTypes:&off_10155C290];

  id v20 = [v10 singleTapGestureRecognizer];
  [v20 setAllowedTouchTypes:&off_10155C290];

  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:1])
  {
    id v21 = [v10 doubleTapGestureRecognizer];
    [v21 setAllowedTouchTypes:&off_10155C2A8];
  }
  objc_super v22 = [[CRLiOSTapGestureRecognizer alloc] initWithTarget:self action:"p_editMenuTapReceived:"];
  editMenuTapGR = self->_editMenuTapGR;
  self->_editMenuTapGR = &v22->super;

  [(UITapGestureRecognizer *)self->_editMenuTapGR setName:@"freehand edit tap GR"];
  [(UITapGestureRecognizer *)self->_editMenuTapGR setDelegate:self];
  [(UITapGestureRecognizer *)self->_editMenuTapGR setAllowedTouchTypes:&off_10155C2C0];
  [v11 addGestureRecognizer:self->_editMenuTapGR];
  [(CRLiOSDocumentModeFreehandDrawing *)self p_updatePanAndDrawingGestureRecognizersForState];
  if (!v4) {
    [(CRLiOSDocumentModeFreehandDrawing *)self p_deselectAllInfosNotInDrawingsOrDrawings];
  }
  id v24 = objc_loadWeakRetained((id *)&self->_icc);
  v25 = [v24 freehandDrawingToolkit];

  if (!v25)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBC78);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108094C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBC98);
    }
    v26 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v26);
    }
    v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing modeDidBeginFromMode:forced:]");
    v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 363, 0, "invalid nil value for '%{public}s'", "toolkit");
  }
  id v29 = [v25 isRulerToolShowing];
  v30 = [(CRLiOSDocumentMode *)self boardViewController];
  v31 = [v30 pencilKitCanvasView];
  [v31 setRulerActive:v29];

  v32 = +[NSNotificationCenter defaultCenter];
  v33 = [(CRLiOSDocumentModeFreehandDrawing *)self p_windowScene];
  [v32 addObserver:self selector:"p_sceneWillDeactivate:" name:UISceneWillDeactivateNotification object:v33];
}

- (void)modeWillEndForMode:(id)a3 forced:(BOOL)a4
{
  BOOL v64 = a4;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  [(CRLiOSDocumentModeFreehandDrawing *)self p_removeObservationOfInteractiveCanvasController:WeakRetained];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_24;
  }
  id v7 = objc_loadWeakRetained((id *)&self->_icc);
  id v8 = [v7 layerHost];
  v9 = [v8 asiOSCVC];

  [v9 hideEditMenu];
  id v10 = [v9 delegate];
  id v11 = [v10 pencilKitCanvasViewControllerForCanvasViewController:v9];

  [v11 removeSmartSelectionViewIfNecessary];
  id v12 = objc_loadWeakRetained((id *)&self->_icc);
  v13 = [v12 freehandDrawingToolkit];

  if (!v13)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBCB8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101080A74();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBCD8);
    }
    id v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v14);
    }
    id v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing modeWillEndForMode:forced:]");
    uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 382, 0, "invalid nil value for '%{public}s'", "toolkit");
  }
  id v17 = [v13 currentTool];
  id v18 = [v17 type];

  if ([v13 isLassoAbleToSelectMixedType])
  {
    if (!v64)
    {
      id v62 = v5;
      id v19 = objc_loadWeakRetained((id *)&self->_icc);
      id v20 = v19;
      if (v18 == (id)9)
      {
        v63 = v11;
        id v21 = [v19 editorController];
        uint64_t v22 = [v21 selectionPath];

        id v23 = objc_loadWeakRetained((id *)&self->_icc);
        id v24 = [v23 selectionModelTranslator];

        v61 = (void *)v22;
        v25 = [v24 selectionPathRemovingCrossContainerSelectionsForSelectionPath:v22];
        v26 = [v25 mostSpecificSelectionOfClass:objc_opt_class()];
        id v27 = v25;
        v28 = v27;
        if ([v26 containsKindOfClass:objc_opt_class()])
        {
          id v29 = [v26 boardItems];
          v28 = [v24 selectionPathForInfos:v29];
        }
        v30 = v26;
        id v31 = objc_loadWeakRetained((id *)&self->_icc);
        v32 = [v31 editorController];
        [v32 setSelectionPath:v28 withFlags:0x2000];

        id v11 = v63;
        v33 = v61;
        goto LABEL_22;
      }
      v37 = [v19 canvasEditor];
      +[NSSet set];
      v39 = v38 = v11;
      uint64_t v40 = [v37 selectionPathWithInfos:v39];

      id v11 = v38;
      v33 = (void *)v40;

LABEL_21:
      id v24 = objc_loadWeakRetained((id *)&self->_icc);
      id v27 = [v24 editorController];
      [v27 setSelectionPath:v33 withFlags:0x2000];
LABEL_22:

      id v5 = v62;
    }
  }
  else if (!v64)
  {
    id v62 = v5;
    id v34 = objc_loadWeakRetained((id *)&self->_icc);
    v35 = [v34 canvasEditor];
    v36 = +[NSSet set];
    v33 = [v35 selectionPathWithInfos:v36];

    goto LABEL_21;
  }

LABEL_24:
  id v41 = objc_loadWeakRetained((id *)&self->_icc);
  v42 = [v41 canvasView];
  v43 = [v42 enclosingScrollView];
  v44 = [v43 panGestureRecognizer];

  [v44 setMinimumNumberOfTouches:self->_previousCanvasScrollMinTouchCount];
  id v45 = objc_loadWeakRetained((id *)&self->_icc);
  v46 = [v45 layerHost];
  v47 = [v46 asiOSCVC];

  v48 = [v47 freehandDrawingGestureRecognizer];
  [v48 setAllowedTouchTypes:self->_previousFreehandGestureTouchTypes];
  if ([(CRLiOSDocumentMode *)self shouldSelectAndScrollWithApplePencil]) {
    v49 = &off_10155C2D8;
  }
  else {
    v49 = &off_10155C2F0;
  }
  v50 = [v47 repDragGestureRecognizer];
  [v50 setAllowedTouchTypes:v49];

  v51 = [v47 singleTapGestureRecognizer];
  [v51 setAllowedTouchTypes:v49];

  v52 = [(UITapGestureRecognizer *)self->_editMenuTapGR view];
  [v52 removeGestureRecognizer:self->_editMenuTapGR];

  editMenuTapGR = self->_editMenuTapGR;
  self->_editMenuTapGR = 0;

  id v54 = objc_loadWeakRetained((id *)&self->_icc);
  v55 = [v54 freehandDrawingToolkit];

  if (!v55)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBCF8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010809E0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBD18);
    }
    v56 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v56);
    }
    v57 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing modeWillEndForMode:forced:]");
    v58 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v57, v58, 444, 0, "invalid nil value for '%{public}s'", "toolkit");
  }
  [v55 setRulerToolShowing:0];
  [v55 removeToolkitObserver:self];
  v59 = +[NSNotificationCenter defaultCenter];
  v60 = [(CRLiOSDocumentModeFreehandDrawing *)self p_windowScene];
  [v59 removeObserver:self name:UISceneWillDeactivateNotification object:v60];

  v65.receiver = self;
  v65.super_class = (Class)CRLiOSDocumentModeFreehandDrawing;
  [(CRLiOSDocumentMode *)&v65 modeWillEndForMode:v5 forced:v64];
}

- (void)modeDidEndForMode:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  [WeakRetained invalidateAllLayers];

  if (self->_lassoSelectionEditMenuInteraction)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_icc);
    v9 = [v8 canvasView];
    [v9 removeInteraction:self->_lassoSelectionEditMenuInteraction];

    lassoSelectionEditMenuInteraction = self->_lassoSelectionEditMenuInteraction;
    self->_lassoSelectionEditMenuInteraction = 0;
  }
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:1])
  {
    id v11 = objc_loadWeakRetained((id *)&self->_icc);
    id v12 = [v11 layerHost];
    v13 = [v12 asiOSCVC];

    id v14 = [v13 doubleTapGestureRecognizer];
    [v14 setAllowedTouchTypes:&off_10155C308];
  }
  v15.receiver = self;
  v15.super_class = (Class)CRLiOSDocumentModeFreehandDrawing;
  [(CRLiOSDocumentMode *)&v15 modeDidEndForMode:v6 forced:v4];
}

- (void)modeDidPresentBottomToolTray
{
  self->_didFinishPresentingBottomToolTray = 1;
}

- (BOOL)wantsAlternateContextMenuBehaviorAtPoint:(CGPoint)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  BOOL v4 = [WeakRetained freehandDrawingToolkit];
  id v5 = [v4 currentTool];
  BOOL v6 = [v5 type] != (id)9;

  return v6;
}

- (id)cursorAtPoint:(CGPoint)a3 withCursorPlatformObject:(id)a4
{
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  BOOL v6 = [WeakRetained freehandDrawingToolkit];
  id v7 = [v6 currentTool];

  id v8 = [v7 type];
  if ((unint64_t)v8 < 7)
  {
    v9 = (objc_class *)objc_opt_class();
    id v10 = sub_10024715C(v9, v7);
    [v10 unscaledWidth];
    double v12 = v11;
    id v13 = objc_loadWeakRetained((id *)p_icc);
    [v13 viewScale];
    double v15 = v12 * v14;

    uint64_t v16 = +[UIBezierPath bezierPathWithOvalInRect:sub_10006402C(CGPointZero.x, CGPointZero.y, fmax(v15, 10.0))];
    id v17 = +[UIPointerShape shapeWithPath:v16];

    id v18 = objc_loadWeakRetained((id *)p_icc);
    [v18 visibleBoundsRect];
    id v19 = +[CRLCursor cursorWithShape:activeScaledRect:](CRLCursor, "cursorWithShape:activeScaledRect:", v17);

LABEL_3:
    goto LABEL_4;
  }
  if (v8 == (id)8)
  {
    id v21 = objc_loadWeakRetained((id *)p_icc);
    uint64_t v22 = [v21 freehandDrawingToolkit];
    id v23 = [v22 toolkitUIState];
    unsigned int v24 = [v23 eraserToolErasesWholeObjects];

    v25 = (objc_class *)objc_opt_class();
    v26 = sub_10024715C(v25, v7);
    if (v24) {
      [v26 currentScaledEraserDiameter];
    }
    else {
      [v26 scaledWidthForSlicingEraser];
    }
    double v28 = v27;

    id v29 = +[UIBezierPath bezierPathWithOvalInRect:sub_10006402C(CGPointZero.x, CGPointZero.y, fmax(v28, 10.0))];
    id v10 = +[UIPointerShape shapeWithPath:v29];

    id v17 = objc_loadWeakRetained((id *)p_icc);
    [v17 visibleBoundsRect];
    id v19 = +[CRLCursor cursorWithShape:activeScaledRect:](CRLCursor, "cursorWithShape:activeScaledRect:", v10);
    goto LABEL_3;
  }
  id v19 = 0;
LABEL_4:

  return v19;
}

- (BOOL)allowsFingerDrawing
{
  id v3 = [(CRLiOSDocumentModeFreehandDrawing *)self toolTray];
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBD38);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101080B9C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBD58);
    }
    BOOL v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing allowsFingerDrawing]");
    BOOL v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 532, 0, "invalid nil value for '%{public}s'", "toolTray");
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v8 = [WeakRetained layerHost];
  v9 = [v8 asiOSCVC];
  id v10 = [v9 pencilMediator];

  if (!v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBD78);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101080B08();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBD98);
    }
    double v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    double v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing allowsFingerDrawing]");
    id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 534, 0, "invalid nil value for '%{public}s'", "pencilMediator");
  }
  if ([v3 hidden]) {
    LOBYTE(v14) = 0;
  }
  else {
    unsigned int v14 = [v10 prefersPencilOnlyDrawing] ^ 1;
  }

  return v14;
}

- (BOOL)allowedToEnterQuickSelectModeForCanvasViewController:(id)a3
{
  return 0;
}

- (BOOL)wantsToSuppressMultiselectionWithSingleBounds
{
  v2 = [(CRLiOSDocumentModeFreehandDrawing *)self interactiveCanvasController];
  id v3 = [v2 freehandDrawingToolkit];
  BOOL v4 = [v3 currentTool];
  BOOL v5 = [v4 type] != (id)9;

  return v5;
}

- (BOOL)currentlyDisplayingLassoSelectionMenu
{
  return self->_lassoSelectionEditMenuDisplayed;
}

- (void)presentEditMenuForLassoSelection
{
  if (!+[CRLAccessibility isVoiceOverEnabled])
  {
    if (self->_lassoSelectionEditMenuInteraction)
    {
      id v11 = [(CRLiOSDocumentModeFreehandDrawing *)self interactiveCanvasController];
      id v3 = [v11 layerHost];
      BOOL v4 = [v3 asiOSCVC];

      BOOL v5 = [v11 editorController];
      BOOL v6 = [v5 selectionPath];

      id v7 = [v4 editMenuConfigrationForSelectionPath:v6 withConfigurationIdentifier:@"CRLFreehandDrawingModeLassoSelectionMenuIdentifier"];
      [(UIEditMenuInteraction *)self->_lassoSelectionEditMenuInteraction presentEditMenuWithConfiguration:v7];
      self->_lassoSelectionEditMenuDisplayed = 1;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DBDB8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101080C30();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DBDD8);
      }
      id v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v8);
      }
      v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing presentEditMenuForLassoSelection]");
      id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"];
      +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:560 isFatal:0 description:"_lassoSelectionMenuInteraction should not be nil."];
    }
  }
}

- (void)hideEditMenuForLassoSelection
{
  lassoSelectionEditMenuInteraction = self->_lassoSelectionEditMenuInteraction;
  if (lassoSelectionEditMenuInteraction)
  {
    [(UIEditMenuInteraction *)lassoSelectionEditMenuInteraction dismissMenu];
    self->_lassoSelectionEditMenuDisplayed = 0;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBDF8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101080CB8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBE18);
    }
    BOOL v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    BOOL v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing hideEditMenuForLassoSelection]");
    BOOL v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:576 isFatal:0 description:"_lassoSelectionMenuInteraction should not be nil."];
  }
}

- (void)toolkitDidUpdateCurrentToolSelection
{
  id v12 = [(CRLiOSDocumentModeFreehandDrawing *)self interactiveCanvasController];
  id v3 = [v12 freehandDrawingToolkit];
  BOOL v4 = [v3 currentTool];
  id v5 = [v4 type];

  if (v5 != (id)9)
  {
    BOOL v6 = [v12 editorController];
    id v7 = [v6 mostSpecificCurrentEditorOfClass:objc_opt_class()];

    if (v7)
    {
      id v8 = [v12 canvasEditor];
      v9 = [v7 boardItems];
      id v10 = [v8 selectionPathWithInfos:v9];
      id v11 = [v12 editorController];
      [v11 setSelectionPath:v10];
    }
    [(UIEditMenuInteraction *)self->_lassoSelectionEditMenuInteraction dismissMenu];
  }
}

- (void)toolkitDidUpdateRulerVisibility
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  BOOL v4 = [WeakRetained freehandDrawingToolkit];

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBE38);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101080DD4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBE58);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    BOOL v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing toolkitDidUpdateRulerVisibility]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 615, 0, "invalid nil value for '%{public}s'", "toolkit");
  }
  id v8 = [(CRLiOSDocumentMode *)self boardViewController];
  v9 = [v8 pencilKitCanvasView];

  if (!v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBE78);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101080D40();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBE98);
    }
    id v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing toolkitDidUpdateRulerVisibility]");
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 617, 0, "invalid nil value for '%{public}s'", "pkCanvasView");
  }
  unsigned int v13 = [v9 isRulerActive];
  if (v13 != [v4 isRulerToolShowing]) {
    [v9 setRulerActive:[v4 isRulerToolShowing]];
  }
}

- (BOOL)wantsToSuppressSelectionKnobs
{
  return 1;
}

- (BOOL)wantsToSuppressMediaReplacementKnobs
{
  return 1;
}

- (BOOL)isValidForEditorController:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSDocumentModeFreehandDrawing *)self interactiveCanvasController];
  BOOL v6 = [v5 freehandDrawingToolkit];
  unsigned int v7 = [v6 isLassoAbleToSelectMixedType];

  id v8 = [v4 mostSpecificCurrentEditorOfClass:objc_opt_class()];
  BOOL v9 = v8 != 0;

  if (v7)
  {
    id v10 = [v4 mostSpecificCurrentEditorOfClass:objc_opt_class()];
    if (v10) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v8 == 0;
    }
    BOOL v9 = !v11;
  }
  id v12 = [v4 selectionPath];
  uint64_t v13 = objc_opt_class();
  unsigned int v14 = [v12 mostSpecificSelectionOfClass:0];
  double v15 = sub_1002469D0(v13, v14);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v17 = [WeakRetained infosForCurrentSelectionPath];
  id v18 = [v17 count];

  if (v15) {
    char v19 = 1;
  }
  else {
    char v19 = v9;
  }
  if (v18) {
    BOOL v20 = v19;
  }
  else {
    BOOL v20 = 1;
  }

  return v20;
}

- (void)prefersPencilOnlyDrawingDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSDocumentModeFreehandDrawing;
  [(CRLiOSDocumentMode *)&v3 prefersPencilOnlyDrawingDidChange];
  [(CRLiOSDocumentModeFreehandDrawing *)self p_updatePanAndDrawingGestureRecognizersForState];
}

- (void)p_deselectAllInfosNotInDrawingsOrDrawings
{
  objc_super v3 = +[NSMutableSet set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  location = (id *)&self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v5 = [WeakRetained infosForCurrentSelectionPath];

  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = objc_opt_class();
        id v12 = sub_1002469D0(v11, v10);
        uint64_t v13 = v12;
        if (v12
          && ([v12 parentInfo],
              unsigned int v14 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char isKindOfClass = objc_opt_isKindOfClass(),
              v14,
              (isKindOfClass & 1) != 0))
        {
          uint64_t v16 = v3;
          id v17 = v13;
        }
        else
        {
          uint64_t v18 = objc_opt_class();
          char v19 = sub_1002469D0(v18, v10);

          if (!v19) {
            goto LABEL_12;
          }
          uint64_t v16 = v3;
          id v17 = v10;
        }
        [v16 addObject:v17 location];
LABEL_12:
      }
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  id v20 = objc_loadWeakRetained(location);
  id v21 = [v20 canvasEditor];
  uint64_t v22 = [v21 selectionPathWithInfos:v3];

  id v23 = objc_loadWeakRetained(location);
  [v23 setSelectionPath:v22 withSelectionFlags:0];
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v10 = [WeakRetained hitRep:x, y];

  uint64_t v11 = objc_opt_class();
  id v12 = objc_loadWeakRetained((id *)p_icc);
  uint64_t v13 = [v12 freehandDrawingToolkit];
  unsigned int v14 = [v13 currentTool];
  double v15 = sub_1002469D0(v11, v14);

  uint64_t v16 = -[CRLFreehandDrawingToolMarqueeInput initWithUnscaledTapPoint:inputType:]([CRLFreehandDrawingToolMarqueeInput alloc], "initWithUnscaledTapPoint:inputType:", sub_10036FEA4(a4), x, y);
  if (v10)
  {
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = [v10 info];
    char v19 = sub_1002469D0(v17, v18);

    id v20 = [v19 containingGroup];
    id v21 = [v10 layout];
    if ([v21 isInGroup])
    {
      unsigned __int8 v22 = [v20 isFreehandDrawing];

      if (v22) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    unsigned __int8 v25 = [(CRLiOSDocumentModeFreehandDrawing *)self allowsFingerDrawing];
    if (a4 == 2 || (v25 & 1) != 0)
    {
      id v26 = objc_loadWeakRetained((id *)p_icc);
      long long v27 = [v26 freehandDrawingToolkit];
      unsigned int v28 = [v27 isLassoAbleToSelectMixedType];

      if (v15) {
        unsigned int v24 = v28;
      }
      else {
        unsigned int v24 = 0;
      }
      goto LABEL_26;
    }
    if (+[CRLFeatureFlagGroup isMathPaperEnabled])
    {
      if (v15)
      {
        if ([v15 handleMarqueeOrFingerTapOnMathResultStrokesInDrawingModeWithInput:v16])
        {
LABEL_14:
          unsigned int v24 = 1;
LABEL_26:

          goto LABEL_27;
        }
      }
      else
      {
        uint64_t v29 = objc_opt_class();
        v30 = sub_1002469D0(v29, v10);
        id v31 = v30;
        if (v30) {
          unsigned int v32 = [v30 handledDirectTouchForDrawingModePencilOnlyAtPoint:x, y];
        }
        else {
          unsigned int v32 = 0;
        }

        if (v32) {
          goto LABEL_14;
        }
      }
    }
    v33 = [(CRLiOSDocumentMode *)self boardViewController];
    id v34 = [v33 documentModeController];
    [v34 resetToDefaultModeAnimated:1];

    v35 = [v10 repForSelecting];
    v36 = [v35 info];

    if (v36 && [v36 isSelectable])
    {
      v37 = [(CRLiOSDocumentModeFreehandDrawing *)self interactiveCanvasController];
      v38 = [v37 canvasEditor];
      id v45 = [v38 selectionPathWithInfo:v36];

      v39 = [(CRLiOSDocumentModeFreehandDrawing *)self interactiveCanvasController];
      uint64_t v40 = [v39 editorController];
      [v40 setSelectionPath:v45];

      id v41 = [(CRLiOSDocumentModeFreehandDrawing *)self interactiveCanvasController];
      v42 = [v41 layerHost];
      v43 = [v42 asiOSCVC];
      [v43 toggleDefaultEditUIForCurrentSelection];
    }
    unsigned int v24 = 0;
    goto LABEL_26;
  }
  BOOL v23 = 0;
  if (!+[CRLFeatureFlagGroup isMathPaperEnabled]|| !v15)
  {
    goto LABEL_30;
  }
  unsigned int v24 = [v15 handleMarqueeOrFingerTapOnMathResultStrokesInDrawingModeWithInput:v16];
LABEL_27:
  BOOL v23 = 0;
  if (v24 && v15)
  {
    [(CRLiOSDocumentModeFreehandDrawing *)self p_handleMarqueeTapWithInput:v16 afterDelay:0.3];
    BOOL v23 = 1;
  }
LABEL_30:

  return v23;
}

- (BOOL)handleTapOnCanvasBackgroundAtUnscaledPoint:(CGPoint)a3
{
  BOOL v4 = +[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1, a3.x, a3.y);
  if (v4)
  {
    if ([(CRLiOSDocumentModeFreehandDrawing *)self currentlyDisplayingLassoSelectionMenu])
    {
      [(CRLiOSDocumentModeFreehandDrawing *)self hideEditMenuForLassoSelection];
    }
    else
    {
      id v5 = [(CRLiOSDocumentMode *)self boardViewController];
      id v6 = [v5 interactiveCanvasController];

      id v7 = [v6 canvasEditor];
      uint64_t v8 = +[NSSet set];
      BOOL v9 = [v7 selectionPathWithInfos:v8];

      id v10 = [v6 editorController];
      [v10 setSelectionPath:v9];

      [(CRLiOSDocumentModeFreehandDrawing *)self presentEditMenuForLassoSelection];
    }
  }
  return v4;
}

- (BOOL)shouldHandleDoubleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  if (!+[CRLFeatureFlagsHelper isOSFeatureEnabled:1]) {
    return 0;
  }
  uint64_t v7 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  BOOL v9 = [WeakRetained freehandDrawingToolkit];
  id v10 = [v9 currentTool];
  uint64_t v11 = sub_1002469D0(v7, v10);

  if (v11) {
    [v11 cancelCommitSelectionForHandlingMarqueeTapForSmartSelection];
  }
  v48 = v11;
  id v12 = [(CRLiOSDocumentMode *)self boardViewController];
  uint64_t v13 = [v12 interactiveCanvasController];

  unsigned int v14 = [v13 layerHost];
  double v15 = [v14 asiOSCVC];

  uint64_t v16 = [v15 delegate];
  uint64_t v17 = [v16 pencilKitCanvasViewControllerForCanvasViewController:v15];

  uint64_t v18 = [v13 hitRep:x, y];
  char v19 = [v18 repForSelecting];

  uint64_t v20 = objc_opt_class();
  v47 = sub_1002469D0(v20, v19);
  v46 = [v47 shapeInfo];
  unsigned int v21 = [v46 isFreehandDrawingShape];
  id v22 = objc_loadWeakRetained((id *)&self->_icc);
  BOOL v23 = [v22 freehandDrawingToolkit];

  id v45 = v23;
  unsigned int v24 = [v23 currentTool];
  id v25 = [v24 type];

  id v26 = [v13 freehandDrawingToolkit];
  unsigned __int8 v27 = [v26 isLassoAbleToSelectMixedType];

  if (v19) {
    int v28 = v21;
  }
  else {
    int v28 = 1;
  }
  if (v25 != (id)9) {
    int v28 = 1;
  }
  if (v28) {
    char v29 = v21;
  }
  else {
    char v29 = v27 ^ 1 | v21;
  }
  if ([(CRLiOSDocumentModeFreehandDrawing *)self currentlyDisplayingLassoSelectionMenu])
  {
    [(CRLiOSDocumentModeFreehandDrawing *)self hideEditMenuForLassoSelection];
  }
  v30 = [v15 canvasView];
  id v31 = [v30 unscaledCoordinateSpace];
  unsigned int v32 = [v15 canvasView];
  v33 = [v32 window];
  id v34 = [v33 coordinateSpace];
  [v31 convertPoint:v34 toCoordinateSpace:x, y];
  double v36 = v35;
  double v38 = v37;

  v39 = [v15 smartSelectionManager];
  uint64_t v40 = [v17 smartSelectionView];
  [v40 frame];
  [v13 convertBoundsToUnscaledRect:];
  v49.double x = x;
  v49.double y = y;
  BOOL v41 = CGRectContainsPoint(v50, v49);

  v42 = [v17 smartSelectionView];

  if (v42 && v39 && v41)
  {
    v43 = [v17 smartSelectionView];
    [v39 handleDoubleTapInputAtUnscaledPoint:v43 inSelectionView:v36];
  }
  else
  {
    [v39 handleDoubleTapInputAtUnscaledPoint:v36, v38];
  }

  return v29;
}

- (void)pencilKitDidSmartSelectStrokesInDrawingShapeItems:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSDocumentMode *)self boardViewController];
  id v10 = [v5 interactiveCanvasController];

  id v6 = [v10 canvasEditor];
  uint64_t v7 = +[NSSet setWithArray:v4];

  uint64_t v8 = [v6 selectionPathWithInfos:v7];

  BOOL v9 = [v10 editorController];
  [v9 setSelectionPath:v8];

  if ([(CRLiOSDocumentModeFreehandDrawing *)self currentlyDisplayingLassoSelectionMenu])
  {
    [(CRLiOSDocumentModeFreehandDrawing *)self hideEditMenuForLassoSelection];
  }
  else
  {
    [(CRLiOSDocumentModeFreehandDrawing *)self presentEditMenuForLassoSelection];
  }
}

- (void)p_editMenuTapReceived:(id)a3
{
  id v4 = a3;
  p_icc = &self->_icc;
  id v6 = objc_loadWeakRetained((id *)&self->_icc);
  uint64_t v7 = [v6 canvasView];
  [v4 locationInView:v7];
  [v6 convertBoundsToUnscaledPoint:];
  double v9 = v8;
  double v11 = v10;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  uint64_t v13 = [WeakRetained layerHost];
  unsigned int v14 = [v13 asiOSCVC];

  [v14 setLastTapPoint:v9, v11];
  if (+[CRLFeatureFlagGroup isMathPaperEnabled])
  {
    id v15 = objc_loadWeakRetained((id *)&self->_icc);
    uint64_t v16 = [v15 freehandDrawingToolkit];
    uint64_t v17 = [v16 currentTool];
    if ([v17 type] == (id)9)
    {
    }
    else
    {
      unsigned __int8 v18 = [(CRLiOSDocumentModeFreehandDrawing *)self allowsFingerDrawing];

      if ((v18 & 1) == 0)
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v19 = objc_loadWeakRetained((id *)p_icc);
        uint64_t v20 = [v19 canvas];
        unsigned int v21 = [v20 topLevelReps];

        id v22 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v31;
          while (2)
          {
            id v25 = 0;
            do
            {
              if (*(void *)v31 != v24) {
                objc_enumerationMutation(v21);
              }
              id v26 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v25);
              uint64_t v27 = objc_opt_class();
              int v28 = sub_1002469D0(v27, v26);
              char v29 = v28;
              if (v28 && objc_msgSend(v28, "handledDirectTouchForDrawingModePencilOnlyAtPoint:", v9, v11))
              {

                goto LABEL_16;
              }

              id v25 = (char *)v25 + 1;
            }
            while (v23 != v25);
            id v23 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }
      }
    }
  }
  [v14 toggleEditMenuForCurrentSelection];
LABEL_16:
}

- (void)p_updatePanAndDrawingGestureRecognizersForState
{
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v5 = [WeakRetained canvasView];
  id v6 = [v5 enclosingScrollView];
  uint64_t v7 = [v6 panGestureRecognizer];

  id v8 = objc_loadWeakRetained((id *)p_icc);
  double v9 = [v8 layerHost];
  double v10 = [v9 asiOSCVC];
  double v11 = [v10 freehandDrawingGestureRecognizer];

  if ([(CRLiOSDocumentModeFreehandDrawing *)self allowsFingerDrawing])
  {
    id v12 = &off_10155C320;
    unint64_t previousCanvasScrollMinTouchCount = 2;
  }
  else
  {
    unint64_t previousCanvasScrollMinTouchCount = self->_previousCanvasScrollMinTouchCount;
    id v12 = &off_10155C338;
  }
  [v7 setMinimumNumberOfTouches:previousCanvasScrollMinTouchCount];
  [v11 setAllowedTouchTypes:v12];
  unsigned int v14 = [v11 allowedTouchTypes];
  id v15 = [v14 arrayByAddingObject:&off_10155D1C0];
  [v11 setAllowedTouchTypes:v15];

  if (!self->_editMenuTapGR)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBEB8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101080E68();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBED8);
    }
    uint64_t v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v16);
    }
    uint64_t v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing p_updatePanAndDrawingGestureRecognizersForState]");
    unsigned __int8 v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 857, 0, "invalid nil value for '%{public}s'", "_editMenuTapGR");
  }
  -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_editMenuTapGR, "setNumberOfTouchesRequired:", [v7 minimumNumberOfTouches]);
}

- (id)p_sortedMenuElementsFromMenuElements:(id)a3 withMenuType:(unint64_t)a4
{
  id v5 = a3;
  v112 = self;
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v8 = [WeakRetained selectionModelTranslator];
  location = (id *)p_icc;
  id v9 = objc_loadWeakRetained((id *)p_icc);
  double v10 = [v9 editorController];
  double v11 = [v10 selectionPath];
  v109 = [v8 boardItemsForSelectionPath:v11];

  v114 = +[NSMutableArray array];
  id v12 = +[NSMutableArray array];
  uint64_t v13 = +[NSBundle mainBundle];
  unsigned int v14 = [v13 localizedStringForKey:@"Edit" value:0 table:0];
  id v15 = +[UIImage systemImageNamed:@"paintbrush"];
  v124 = +[UICommand commandWithTitle:v14 image:v15 action:"showMiniFormatterToExitDrawingMode:" propertyList:0];

  uint64_t v16 = +[NSBundle mainBundle];
  uint64_t v17 = [v16 localizedStringForKey:@"Select All" value:0 table:0];
  unsigned __int8 v18 = +[UIImage systemImageNamed:@"square.dashed"];
  v123 = +[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v17, v18);

  id v19 = +[NSBundle mainBundle];
  uint64_t v20 = [v19 localizedStringForKey:@"Merge" value:0 table:0];
  v111 = +[UICommand commandWithTitle:v20 image:0 action:"mergeDrawings:" propertyList:0];

  unsigned int v21 = +[NSBundle mainBundle];
  id v22 = [v21 localizedStringForKey:@"Group" value:0 table:0];
  v110 = +[UICommand commandWithTitle:v22 image:0 action:"group:" propertyList:0];

  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  id obj = v5;
  id v23 = [obj countByEnumeratingWithState:&v155 objects:v164 count:16];
  if (!v23)
  {
    id v133 = 0;
    goto LABEL_25;
  }
  id v24 = v23;
  id v133 = 0;
  uint64_t v137 = *(void *)v156;
  do
  {
    for (i = 0; i != v24; i = (char *)i + 1)
    {
      if (*(void *)v156 != v137) {
        objc_enumerationMutation(obj);
      }
      id v26 = *(void **)(*((void *)&v155 + 1) + 8 * i);
      uint64_t v27 = objc_opt_class();
      int v28 = sub_1002469D0(v27, v26);
      char v29 = v28;
      if (!v28)
      {
        uint64_t v40 = objc_opt_class();
        v39 = sub_1002469D0(v40, v26);
        if (v39) {
          [v12 addObject:v39];
        }
        goto LABEL_20;
      }
      long long v153 = 0u;
      long long v154 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      long long v30 = [v28 children];
      id v31 = [v30 countByEnumeratingWithState:&v151 objects:v163 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v152;
        do
        {
          for (j = 0; j != v32; j = (char *)j + 1)
          {
            if (*(void *)v152 != v33) {
              objc_enumerationMutation(v30);
            }
            double v35 = *(void **)(*((void *)&v151 + 1) + 8 * (void)j);
            uint64_t v36 = objc_opt_class();
            double v37 = sub_1002469D0(v36, v35);
            if (v37) {
              [v12 addObject:v37];
            }
          }
          id v32 = [v30 countByEnumeratingWithState:&v151 objects:v163 count:16];
        }
        while (v32);
      }

      double v38 = [v29 identifier];

      if (v38 == @"CRLCutCopyPasteMenuIdentifier")
      {
        v39 = v133;
        id v133 = v29;
LABEL_20:
      }
    }
    id v24 = [obj countByEnumeratingWithState:&v155 objects:v164 count:16];
  }
  while (v24);
LABEL_25:

  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id v136 = v12;
  id v41 = [v136 countByEnumeratingWithState:&v147 objects:v162 count:16];
  if (!v41)
  {
    v115 = 0;
    v116 = 0;
    v43 = 0;
    v117 = 0;
    v118 = 0;
    v119 = 0;
    v120 = 0;
    v122 = 0;
    v125 = 0;
    v121 = 0;
    v126 = 0;
    v129 = 0;
    v131 = 0;
    v134 = 0;
    v138 = 0;
    goto LABEL_66;
  }
  id v42 = v41;
  v115 = 0;
  v116 = 0;
  v43 = 0;
  v117 = 0;
  v118 = 0;
  v119 = 0;
  v120 = 0;
  v122 = 0;
  v125 = 0;
  v121 = 0;
  v126 = 0;
  v129 = 0;
  v131 = 0;
  v134 = 0;
  v138 = 0;
  uint64_t v44 = *(void *)v148;
  while (2)
  {
    uint64_t v45 = 0;
    while (2)
    {
      if (*(void *)v148 != v44) {
        objc_enumerationMutation(v136);
      }
      v46 = *(void **)(*((void *)&v147 + 1) + 8 * v45);
      if (objc_msgSend(v46, "action", location) == "cut:")
      {
        v47 = v138;
        v48 = v43;
        v138 = v46;
        goto LABEL_61;
      }
      if ([v46 action] == "copy:")
      {
        v47 = v134;
        v48 = v43;
        v134 = v46;
        goto LABEL_61;
      }
      if ([v46 action] == "paste:")
      {
        v47 = v131;
        v48 = v43;
        v131 = v46;
        goto LABEL_61;
      }
      if ([v46 action] == "duplicate:")
      {
        v47 = v129;
        v48 = v43;
        v129 = v46;
        goto LABEL_61;
      }
      if ([v46 action] == "delete:")
      {
        v47 = v126;
        v48 = v43;
        v126 = v46;
        goto LABEL_61;
      }
      if ([v46 action] == "lock:")
      {
        v47 = v125;
        v48 = v43;
        v125 = v46;
        goto LABEL_61;
      }
      if ([v46 action] == "unlock:")
      {
        v47 = v122;
        v48 = v43;
        v122 = v46;
        goto LABEL_61;
      }
      if ([v46 action] == "transform:")
      {
        v47 = v121;
        v48 = v43;
        v121 = v46;
        goto LABEL_61;
      }
      if ([v46 action] == "separate:")
      {
        v47 = v120;
        v48 = v43;
        v120 = v46;
        goto LABEL_61;
      }
      if ([v46 action] == "snapToShape:")
      {
        v47 = v119;
        v48 = v43;
        v119 = v46;
        goto LABEL_61;
      }
      if ([v46 action] == "straighten:")
      {
        v47 = v118;
        v48 = v43;
        v118 = v46;
        goto LABEL_61;
      }
      if ([v46 action] == "copyAsText:")
      {
        v47 = v117;
        v48 = v43;
        v117 = v46;
        goto LABEL_61;
      }
      if ([v46 action] == "translateHandwrittenText:")
      {
        v47 = v116;
        v116 = v46;
LABEL_60:
        v48 = v43;
        goto LABEL_61;
      }
      if ([v46 action] == "connectWithConnectionLine:")
      {
        v47 = v115;
        v115 = v46;
        goto LABEL_60;
      }
      v47 = v43;
      v48 = v46;
      if ([v46 action] == "editAccessibilityDescription:")
      {
LABEL_61:
        id v49 = v46;

        v43 = v48;
      }
      if (v42 != (id)++v45) {
        continue;
      }
      break;
    }
    id v42 = [v136 countByEnumeratingWithState:&v147 objects:v162 count:16];
    if (v42) {
      continue;
    }
    break;
  }
LABEL_66:

  id v50 = [(CRLiOSDocumentModeFreehandDrawing *)v112 p_currentLassoSelectionType];
  unint64_t v51 = [(CRLiOSDocumentModeFreehandDrawing *)v112 p_currentLockedInfosCount];
  unint64_t v52 = v51;
  unint64_t v54 = a4;
  v53 = v114;
  v55 = v111;
  v56 = v133;
  if (v50 != (id)2)
  {
LABEL_100:
    v84 = v109;
    if (v52 < (unint64_t)objc_msgSend(v109, "count", location) && v50 != (id)3)
    {
      [v53 crl_addNonNilObject:v138];
      [v53 crl_addNonNilObject:v134];
    }
    [v53 crl_addNonNilObject:v131];
    if (!v54 && (v89 = v126, v50 != (id)3) || v50 == (id)2 && v54 == 1 && (v89 = v124, v52))
    {
      [v53 crl_addNonNilObject:v89];
    }
    else if (v50 == (id)3)
    {
      [v53 crl_addNonNilObject:v123];
      if (!v52 || v54)
      {
        if (v54 == 1)
        {
          if (v52) {
            v91 = v122;
          }
          else {
            v91 = v125;
          }
          [v53 crl_addNonNilObject:v91];
          goto LABEL_130;
        }
      }
      else
      {
        [v53 crl_addNonNilObject:v122];
      }
      v92 = v126;
      if (!v54)
      {
LABEL_158:
        [v53 crl_addNonNilObject:v92];
LABEL_159:
        id v132 = v53;
        goto LABEL_160;
      }
LABEL_130:
      char v90 = 1;
      if (v54 != 1) {
        goto LABEL_132;
      }
      goto LABEL_131;
    }
    if (v50 == (id)2 && v52)
    {
      if (v52 < (unint64_t)[v109 count]) {
        [v53 crl_addNonNilObject:v125];
      }
      [v53 crl_addNonNilObject:v122];
    }
    [v53 crl_addNonNilObject:v123];
    if (v50 == (id)2 && v54 == 1 && v52)
    {
      if (v52 < (unint64_t)[v109 count]) {
        [v53 crl_addNonNilObject:v115];
      }
      char v90 = 0;
LABEL_131:
      [v53 crl_addNonNilObject:v126];
LABEL_132:
      if (v50 == (id)1)
      {
        [v53 crl_addNonNilObject:v121];
        [v53 crl_addNonNilObject:v129];
        id v93 = objc_loadWeakRetained(locationa);
        v94 = [v93 canvasEditor];
        v95 = [v94 editorController];
        v96 = [v95 mostSpecificCurrentEditorOfClass:objc_opt_class()];

        v53 = v114;
        if (v119 && objc_msgSend(v96, "canPerformEditorAction:withSender:", objc_msgSend(v119, "action"), 0) == (id)1) {
          [v114 crl_addNonNilObject:v119];
        }
        if (v111)
        {
          id v97 = [v96 canPerformEditorAction:[v111 action] withSender:0];
          if (!a4 && v97 == (id)1) {
            [v114 crl_addNonNilObject:v111];
          }
        }
        if (v120)
        {
          id v98 = [v96 canPerformEditorAction:[v120 action] withSender:0];
          if (!a4 && v98 == (id)1) {
            [v114 crl_addNonNilObject:v120];
          }
        }
        if ([(CRLiOSDocumentModeFreehandDrawing *)v112 p_shouldPresentHandwritingIntelligenceActionsForCurrentSelectionPath])
        {
          [v114 crl_addNonNilObject:v117];
          [v114 crl_addNonNilObject:v116];
          [v114 crl_addNonNilObject:v118];
        }

LABEL_156:
        if (v90) {
          goto LABEL_159;
        }
        id v105 = [v109 count];
        v92 = v43;
        if ((id)v52 != v105) {
          goto LABEL_159;
        }
        goto LABEL_158;
      }
      if (v50 == (id)2)
      {
        if ((unint64_t)[v109 count] >= 2)
        {
          id v99 = objc_loadWeakRetained(locationa);
          v100 = [v99 canvasEditor];
          v101 = [v100 canvasEditorHelper];
          id v102 = [v101 canvasEditorCanPerformGroupActionWithSender:0];

          v53 = v114;
          if (v102 != (id)1 || v52) {
            goto LABEL_156;
          }
          v103 = v114;
          v104 = v110;
LABEL_155:
          [v103 crl_addNonNilObject:v104];
          goto LABEL_156;
        }
      }
      else if (v50 == (id)3)
      {
        goto LABEL_156;
      }
      v103 = v53;
      v104 = v129;
      goto LABEL_155;
    }
    goto LABEL_130;
  }
  if (a4 != 1 || v51 || !v133)
  {
    if (!a4)
    {
      id v85 = objc_loadWeakRetained(location);
      v86 = [v85 canvasEditor];
      v87 = [v86 canvasEditorHelper];
      id v88 = [v87 canvasEditorCanPerformShowMiniFormatterToExitDrawingModeActionWithSender:0];

      unint64_t v54 = 0;
      v53 = v114;
      if (v88 == (id)1) {
        [v114 crl_addNonNilObject:v124];
      }
    }
    goto LABEL_100;
  }
  v57 = [v133 children];
  v58 = +[NSMutableArray array];
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  id v130 = v57;
  id v59 = [v130 countByEnumeratingWithState:&v143 objects:v161 count:16];
  if (v59)
  {
    id v60 = v59;
    uint64_t v61 = *(void *)v144;
    do
    {
      for (k = 0; k != v60; k = (char *)k + 1)
      {
        if (*(void *)v144 != v61) {
          objc_enumerationMutation(v130);
        }
        v63 = *(void **)(*((void *)&v143 + 1) + 8 * (void)k);
        [v58 addObject:v63, location];
        uint64_t v64 = objc_opt_class();
        objc_super v65 = sub_1002469D0(v64, v63);
        v66 = v65;
        if (v65 && [v65 action] == "paste:") {
          [v58 addObject:v124];
        }
      }
      id v60 = [v130 countByEnumeratingWithState:&v143 objects:v161 count:16];
    }
    while (v60);
  }
  v127 = v58;

  id v132 = +[NSMutableArray array];
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id v128 = obj;
  id v67 = [v128 countByEnumeratingWithState:&v139 objects:v160 count:16];
  if (v67)
  {
    id v68 = v67;
    uint64_t v69 = *(void *)v140;
    do
    {
      v70 = 0;
      do
      {
        if (*(void *)v140 != v69) {
          objc_enumerationMutation(v128);
        }
        v71 = *(void **)(*((void *)&v139 + 1) + 8 * (void)v70);
        uint64_t v72 = objc_opt_class();
        v73 = sub_1002469D0(v72, v71);
        v74 = v73;
        if (v73)
        {
          v75 = [v73 identifier];

          if (v75 == @"CRLCutCopyPasteMenuIdentifier")
          {
            v78 = +[UIMenu menuWithTitle:&stru_101538650 image:0 identifier:@"CRLCutCopyPasteMenuIdentifier" options:1 children:v127];
            v79 = v132;
            v80 = v78;
            goto LABEL_91;
          }
        }
        uint64_t v76 = objc_opt_class();
        v77 = sub_1002469D0(v76, v71);
        v78 = v77;
        if (!v77 || [v77 action] != "selectAll:")
        {
          v79 = v132;
          v80 = v71;
LABEL_91:
          [v79 addObject:v80];
          goto LABEL_92;
        }
        v159 = v123;
        v81 = +[NSArray arrayWithObjects:&v159 count:1];
        v82 = +[UIMenu menuWithTitle:&stru_101538650 image:0 identifier:0 options:1 children:v81];

        [v132 addObject:v82];
LABEL_92:

        v70 = (char *)v70 + 1;
      }
      while (v68 != v70);
      id v83 = [v128 countByEnumeratingWithState:&v139 objects:v160 count:16];
      id v68 = v83;
    }
    while (v83);
  }

  v84 = v109;
  v53 = v114;
  v55 = v111;
  v56 = v133;
LABEL_160:

  return v132;
}

- (id)p_menuElementsToDisplayForLassoSelectionAtPoint:(CGPoint)a3 menuType:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  double v10 = [WeakRetained editorController];
  double v11 = [v10 currentEditors];

  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v16 addContextualMenuElementsToArray:v8 atPoint:CGPointMake(x, y)];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  id v17 = [v8 copy];
  unsigned __int8 v18 = [(CRLiOSDocumentModeFreehandDrawing *)self p_sortedMenuElementsFromMenuElements:v17 withMenuType:a4];

  return v18;
}

- (unint64_t)p_currentLassoSelectionType
{
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v4 = [WeakRetained selectionModelTranslator];
  id v5 = objc_loadWeakRetained((id *)p_icc);
  id v6 = [v5 editorController];
  uint64_t v7 = [v6 selectionPath];
  id v8 = [v4 boardItemsForSelectionPath:v7];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v8;
  double v10 = (char *)[v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    double v11 = v10;
    char v12 = 0;
    char v13 = 0;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v9);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v13 = 1;
        }
        else
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          v12 |= isKindOfClass ^ 1;
          v13 |= isKindOfClass;
        }
      }
      double v11 = (char *)[v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
  else
  {
    char v12 = 0;
    char v13 = 0;
  }

  uint64_t v17 = 2;
  if (v13 & 1 | ((v12 & 1) == 0)) {
    uint64_t v17 = 3;
  }
  if (v12 & 1 | ((v13 & 1) == 0)) {
    unint64_t v18 = v17;
  }
  else {
    unint64_t v18 = 1;
  }

  return v18;
}

- (unint64_t)p_currentLockedInfosCount
{
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v4 = [WeakRetained editorController];
  id v5 = [v4 selectionPath];

  id v6 = objc_loadWeakRetained((id *)p_icc);
  uint64_t v7 = [v6 selectionModelTranslator];
  id v8 = objc_loadWeakRetained((id *)p_icc);
  id v9 = [v8 editorController];
  double v10 = [v9 selectionPath];
  double v11 = [v7 boardItemsForSelectionPath:v10];

  id v12 = objc_loadWeakRetained((id *)p_icc);
  char v13 = [v12 selectionModelTranslator];
  uint64_t v14 = [v13 unlockedBoardItemsForSelectionPath:v5];

  id v15 = [v11 count];
  if (v15 < [v14 count])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBEF8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101080EFC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBF18);
    }
    uint64_t v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v16);
    }
    uint64_t v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing p_currentLockedInfosCount]");
    unint64_t v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"];
    +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:1164 isFatal:0 description:"unlockedItems should not have more items than selectedItems."];
  }
  id v19 = [v11 count];
  unint64_t v20 = v19 - (unsigned char *)[v14 count];

  return v20;
}

- (BOOL)p_shouldPresentHandwritingIntelligenceActionsForCurrentSelectionPath
{
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v4 = [WeakRetained selectionModelTranslator];
  id v5 = objc_loadWeakRetained((id *)p_icc);
  id v6 = [v5 editorController];
  uint64_t v7 = [v6 selectionPath];
  id v8 = [v4 boardItemsForSelectionPath:v7];

  id v9 = +[NSMutableArray array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v16 = objc_opt_class();
        uint64_t v17 = sub_1002469D0(v16, v15);
        if (v17) {
          [v9 addObject:v17];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v18 = v9;
    id v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v19)
    {
      id v20 = v19;
      char v21 = 0;
      int v22 = 0;
      uint64_t v23 = *(void *)v31;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v18);
          }
          id v25 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
          if ((objc_msgSend(v25, "isTreatedAsFillForFreehandDrawing", (void)v30) & ((v21 & 1) == 0)) != 0) {
            char v21 = 1;
          }
          unsigned int v26 = [v25 isTreatedAsFillForFreehandDrawing];
          if (v22) {
            int v27 = v22;
          }
          else {
            int v27 = 1;
          }
          if (!v26) {
            int v22 = v27;
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v20);
      uint64_t v28 = (((v21 & 1) == 0) | v22);
    }
    else
    {
      LOBYTE(v28) = 1;
    }
  }
  else
  {
    LOBYTE(v28) = 0;
  }

  return v28 & 1;
}

- (void)p_handleMarqueeTapWithInput:(id)a3 afterDelay:(double)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v9 = [WeakRetained freehandDrawingToolkit];
  id v10 = [v9 currentTool];
  sub_1002469D0(v7, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  [v11 performSelector:"handleMarqueeTapWithInput:" withObject:v6 afterDelay:a4];
}

- (void)p_sceneWillDeactivate:(id)a3
{
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:1])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    id v5 = [WeakRetained layerHost];
    id v7 = [v5 asiOSCVC];

    id v6 = [v7 smartSelectionManager];
    if ([v6 hasSmartSelectedDrawingShapeItems]) {
      [(CRLiOSDocumentModeFreehandDrawing *)self hideEditMenuForLassoSelection];
    }
  }
}

- (id)p_windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  objc_super v3 = [WeakRetained layerHost];
  id v4 = [v3 asiOSCVC];

  id v5 = [v4 view];
  id v6 = [v5 window];
  id v7 = [v6 windowScene];

  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBF38);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101080F84();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DBF58);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing p_windowScene]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1226, 0, "invalid nil value for '%{public}s'", "windowScene");
  }

  return v7;
}

- (void)beginDrawingTransformMode
{
  objc_super v3 = [CRLiOSDocumentModeFreehandDrawingTransform alloc];
  id v4 = [(CRLiOSDocumentMode *)self boardViewController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v8 = [(CRLiOSDocumentModeFreehandDrawingTransform *)v3 initWithBoardViewController:v4 andInteractiveCanvasController:WeakRetained];

  id v6 = [(CRLiOSDocumentMode *)self boardViewController];
  id v7 = [v6 documentModeController];
  [v7 setMode:v8 animated:0];
}

- (id)toolTray
{
  v2 = [(CRLiOSDocumentMode *)self boardViewController];
  objc_super v3 = [v2 sharedPencilTray];

  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = self;
  p_icc = &self->_icc;
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_loadWeakRetained((id *)p_icc);
  id v10 = [v9 canvasView];
  [v7 locationInView:v10];
  [v9 convertBoundsToUnscaledPoint:];
  double v12 = v11;
  double v14 = v13;

  id v15 = [v7 type];
  LOBYTE(v5) = -[CRLiOSDocumentModeFreehandDrawing p_gestureRecognizer:shouldReceiveTouchAtLocation:touchType:](v5, "p_gestureRecognizer:shouldReceiveTouchAtLocation:touchType:", v8, v15, v12, v14);

  return (char)v5;
}

- (BOOL)p_gestureRecognizer:(id)a3 shouldReceiveTouchAtLocation:(CGPoint)a4 touchType:(int64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = (UITapGestureRecognizer *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  double v11 = [WeakRetained layerHost];
  double v12 = [v11 asiOSCVC];

  double v13 = [v12 delegate];
  uint64_t v14 = objc_opt_class();
  id v15 = sub_1002469D0(v14, v13);
  uint64_t v16 = [v15 presentedViewController];

  if (v16) {
    goto LABEL_2;
  }
  if (self->_editMenuTapGR != v9) {
    goto LABEL_4;
  }
  id v19 = objc_loadWeakRetained((id *)&self->_icc);
  id v20 = [v19 freehandDrawingToolkit];
  char v21 = [v20 currentTool];
  id v33 = [v21 type];

  if (v33 == (id)9)
  {
LABEL_2:
    BOOL v17 = 0;
    goto LABEL_5;
  }
  if (a5 || [(CRLiOSDocumentModeFreehandDrawing *)self allowsFingerDrawing])
  {
LABEL_4:
    BOOL v17 = 1;
    goto LABEL_5;
  }
  id v22 = objc_loadWeakRetained((id *)&self->_icc);
  uint64_t v23 = [v22 hitRep:x, y];

  if (v23)
  {
    uint64_t v24 = objc_opt_class();
    id v25 = [v23 info];
    unsigned int v26 = sub_1002469D0(v24, v25);

    int v27 = [v26 containingGroup];
    if (([v27 isFreehandDrawing] & 1) != 0
      || ([v23 repForSelecting],
          uint64_t v28 = objc_claimAutoreleasedReturnValue(),
          v28,
          !v28))
    {
      char v29 = [v23 parentRep];

      if (v29)
      {
        uint64_t v30 = objc_opt_class();
        long long v31 = [v23 parentRep];
        long long v32 = sub_1002469D0(v30, v31);
      }
      BOOL v17 = 1;
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 1;
  }

LABEL_5:
  return v17;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v6 = a4;
  id v7 = [v6 identifier];

  if (v7 == @"CRLFreehandDrawingModeLassoSelectionMenuIdentifier")
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    [v6 sourcePoint];
    [WeakRetained convertBoundsToUnscaledPoint:];
    double v15 = v14;
    double v17 = v16;

    id v18 = -[CRLiOSDocumentModeFreehandDrawing p_menuElementsToDisplayForLassoSelectionAtPoint:menuType:](self, "p_menuElementsToDisplayForLassoSelectionAtPoint:menuType:", 0, v15, v17);
    double v12 = +[UIMenu menuWithTitle:&stru_101538650 children:v18];
  }
  else
  {
    id v8 = [v6 identifier];

    if (v8 != @"CRLFreehandDrawingModeLassoSelectionMenuIdentifier")
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DBF78);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101081018();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DBF98);
      }
      id v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v9);
      }
      id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing editMenuInteraction:menuForConfiguration:suggestedActions:]");
      double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"];
      +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:1290 isFatal:0 description:"Freehand drawing mode should only accept CRLFreehandDrawingModeLassoSelectionEditMenuIdentifier now for lasso selection feature."];
    }
    double v12 = 0;
  }

  return v12;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v12 = +[NSNotificationCenter defaultCenter];
  id v6 = +[NSNotification CRLCommandControllerWillUndo];
  id v7 = [(CRLiOSDocumentModeFreehandDrawing *)self interactiveCanvasController];
  id v8 = [v7 commandController];
  [v12 addObserver:self selector:"p_commandControllerWillUndoOrRedo:" name:v6 object:v8];

  id v9 = +[NSNotification CRLCommandControllerWillRedo];
  id v10 = [(CRLiOSDocumentModeFreehandDrawing *)self interactiveCanvasController];
  double v11 = [v10 commandController];
  [v12 addObserver:self selector:"p_commandControllerWillUndoOrRedo:" name:v9 object:v11];
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v12 = +[NSNotificationCenter defaultCenter];
  id v6 = +[NSNotification CRLCommandControllerWillRedo];
  id v7 = [(CRLiOSDocumentModeFreehandDrawing *)self interactiveCanvasController];
  id v8 = [v7 commandController];
  [v12 removeObserver:self name:v6 object:v8];

  id v9 = +[NSNotification CRLCommandControllerWillUndo];
  id v10 = [(CRLiOSDocumentModeFreehandDrawing *)self interactiveCanvasController];
  double v11 = [v10 commandController];
  [v12 removeObserver:self name:v9 object:v11];
}

- (id)contextMenuConfigurationForContextMenuInteraction:(id)a3 atPoint:(CGPoint)a4 onInteractiveCanvasController:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  if ([a3 menuAppearance] == (id)1)
  {
    id v8 = 0;
  }
  else
  {
    id v9 = -[CRLiOSDocumentModeFreehandDrawing p_menuElementsToDisplayForLassoSelectionAtPoint:menuType:](self, "p_menuElementsToDisplayForLassoSelectionAtPoint:menuType:", 1, x, y);
    if ([v9 count])
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10017AD6C;
      v12[3] = &unk_1014DBFC0;
      v12[4] = v9;
      id v10 = objc_retainBlock(v12);
      id v8 = +[UIContextMenuConfiguration configurationWithIdentifier:@"CRLFreehandDrawingModeLassoSelectionMenuIdentifier" previewProvider:0 actionProvider:v10];
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v10 = [WeakRetained layerHost];
  double v11 = [v10 asiOSCVC];

  if (!+[CRLFeatureFlagsHelper isOSFeatureEnabled:1]) {
    goto LABEL_5;
  }
  id v12 = [v11 freehandDrawingGestureRecognizer];
  if (v12 != v6) {
    goto LABEL_3;
  }
  id v13 = [v11 doubleTapGestureRecognizer];

  if (v13 != v7) {
    goto LABEL_5;
  }
  id v16 = objc_loadWeakRetained((id *)p_icc);
  id v12 = [v16 freehandDrawingToolkit];

  double v17 = [v11 pencilMediator];
  id v18 = [v12 currentTool];
  id v19 = [v18 type];

  if (v19 == (id)9 || ([v17 prefersPencilOnlyDrawing] & 1) == 0)
  {

LABEL_3:
    goto LABEL_5;
  }
  id v20 = [v11 freehandDrawingGestureRecognizer];
  id v21 = [v20 inputType];

  if (v21 == (id)1)
  {
    BOOL v14 = 1;
    goto LABEL_6;
  }
LABEL_5:
  BOOL v14 = 0;
LABEL_6:

  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v10 = [WeakRetained layerHost];
  double v11 = [v10 asiOSCVC];

  if (!+[CRLFeatureFlagsHelper isOSFeatureEnabled:1]) {
    goto LABEL_12;
  }
  id v12 = [v11 freehandDrawingGestureRecognizer];
  if (v12 == v6)
  {
    id WeakRetained = [v11 doubleTapGestureRecognizer];
    if (WeakRetained == v7)
    {

      goto LABEL_13;
    }
  }
  id v13 = [v11 doubleTapGestureRecognizer];
  if (v13 != v6)
  {

    BOOL v14 = 0;
    BOOL v15 = 0;
    id v16 = v6;
    if (v12 != v6)
    {
LABEL_15:

      goto LABEL_16;
    }
LABEL_14:

    id v12 = v16;
    BOOL v15 = v14;
    goto LABEL_15;
  }
  id v17 = [v11 freehandDrawingGestureRecognizer];

  if (v12 == v6)
  {
  }
  else
  {
  }
  if (v17 == v7)
  {
LABEL_13:
    id v18 = objc_loadWeakRetained((id *)p_icc);
    id v16 = [v18 freehandDrawingToolkit];

    id WeakRetained = [v16 currentTool];
    BOOL v14 = [WeakRetained type] == (id)9;
    goto LABEL_14;
  }
LABEL_12:
  BOOL v15 = 0;
LABEL_16:

  return v15;
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_icc);
  objc_storeStrong((id *)&self->_lassoSelectionEditMenuInteraction, 0);
  objc_storeStrong((id *)&self->_editMenuTapGR, 0);

  objc_storeStrong((id *)&self->_previousFreehandGestureTouchTypes, 0);
}

@end