@interface CRLFreehandDrawingPKSelectionManager
- (BOOL)canTranslate;
- (BOOL)doesCurrentSmartSelectedDrawingShapeItemsContainDrawingShapeItem:(id)a3;
- (BOOL)handleSmartSelectionTapAtUnscaledLocation:(CGPoint)a3 inAttachment:(id)a4;
- (BOOL)hasSmartSelectedDrawingShapeItems;
- (BOOL)p_shouldSyncStrokeSelection;
- (BOOL)shouldSuppressToolPickerVisibilityDidChangeUpdate;
- (CRLFreehandDrawingPKSelectionManager)initWithDelegate:(id)a3;
- (CRLFreehandDrawingSelectionDecorator)selectionDecorator;
- (id)drawingForHandwritingDebugging;
- (id)freehandDrawingItemsFromCacheForPKQueryItems:(id)a3;
- (id)interactiveCanvasController;
- (id)makeFreehandDrawingItemsSearchTargetForCurrentlyCachedDrawing;
- (id)p_cachedDrawingShapeItemsForStrokes:(id)a3;
- (id)p_cachedStrokesForDrawingShapeItems:(id)a3;
- (id)p_windowScene;
- (id)smartSelectionControllerForAttachment:(id)a3;
- (id)strokeUUIDsToDrawingItems;
- (id)strokeUUIDsToDrawingShapeItems;
- (id)strokeUUIDsToStrokes;
- (void)beginSuppressingSmartSelection;
- (void)clearSmartSelectionIfNecessary;
- (void)copyAsText:(id)a3;
- (void)dealloc;
- (void)didSelectStrokes:(id)a3 selectionType:(int64_t)a4 inAttachment:(id)a5;
- (void)dynamicOperationDidBeginWithRealTimeCommands:(BOOL)a3;
- (void)dynamicOperationDidEnd;
- (void)endSuppressingSmartSelection;
- (void)handleDoubleTapInputAtUnscaledPoint:(CGPoint)a3;
- (void)handleDoubleTapInputAtUnscaledPoint:(CGPoint)a3 inSelectionView:(id)a4;
- (void)handleSingleTapInputAtUnscaledPoint:(CGPoint)a3;
- (void)installSelectionView:(id)a3 fromView:(id)a4;
- (void)installSmartSelectionViewForCurrentSelection;
- (void)installTranslationViewController:(id)a3;
- (void)p_canvasDidScroll:(id)a3;
- (void)p_canvasDidZoom:(id)a3;
- (void)p_canvasWillZoom:(id)a3;
- (void)p_didEnterBackground:(id)a3;
- (void)p_dismissEditMenuIfNecessary;
- (void)p_editorControllerSelectionPathDidChanged:(id)a3;
- (void)p_indexHandwrittenTextsFromDrawing;
- (void)p_recursivelyAddFreehandDrawingItemsFromGroup:(id)a3 drawingItems:(id)a4;
- (void)p_removeCurrentSelectionView;
- (void)p_sceneDidActivate:(id)a3;
- (void)p_sceneWillDeactivate:(id)a3;
- (void)p_selectStrokesInDrawingShapeItems:(id)a3;
- (void)p_setDrawingsAttachmentToSmartSelectionController;
- (void)p_willEnterForeground:(id)a3;
- (void)pencilKitDidSmartSelectPreviouslySelectedStrokes:(id)a3;
- (void)pkStrokesContainingUnlockedDrawingsForEntireCanvasDidChange:(id)a3;
- (void)removeSelectedShapeItemFromSmartSelectionBookkeeping:(id)a3;
- (void)replacingCurrentlySmartSelectedItems:(id)a3 withNewItemsToSmartSelect:(id)a4;
- (void)setCurrentSelectedDrawingItemsAsSmartSelected;
- (void)straighten:(id)a3;
- (void)teardown;
- (void)translate:(id)a3;
- (void)updatePKStrokesFromAllFreehandDrawingItemsOnCanvas;
@end

@implementation CRLFreehandDrawingPKSelectionManager

- (CRLFreehandDrawingPKSelectionManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CRLFreehandDrawingPKSelectionManager;
  v5 = [(CRLFreehandDrawingPKSelectionManager *)&v38 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_delegate, v4);
    v8 = [v4 interactiveCanvasControllerForPKSelectionManager:v6];

    uint64_t v9 = +[NSTimer scheduledTimerWithTimeInterval:v6 target:"p_indexHandwrittenTextsFromDrawing" selector:0 userInfo:1 repeats:25.0];
    drawingIndexingTimer = v6->_drawingIndexingTimer;
    v6->_drawingIndexingTimer = (NSTimer *)v9;

    v11 = [v8 pkDrawingProvider];
    objc_storeWeak((id *)&v6->_drawingProvider, v11);

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_drawingProvider);
    if (!WeakRetained)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CCD58);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101068668();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CCD78);
      }
      v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v13);
      }
      v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager initWithDelegate:]");
      v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 93, 0, "invalid nil value for '%{public}s'", "_drawingProvider");
    }
    id v16 = objc_loadWeakRetained((id *)&v6->_drawingProvider);
    [v16 addConsolidatedPKDrawingObserver:v6];

    v17 = (PKDrawing *)objc_alloc_init((Class)PKDrawing);
    drawing = v6->_drawing;
    v6->_drawing = v17;

    v19 = v6->_drawing;
    id v20 = objc_loadWeakRetained((id *)&v6->_drawingProvider);
    v21 = [v20 pkStrokesContainingUnlockedDrawingsForEntireCanvas];
    id v22 = [(PKDrawing *)v19 undoableAddNewStrokes:v21];

    v23 = +[NSNotificationCenter defaultCenter];
    v24 = [v8 editorController];
    [v23 addObserver:v6 selector:"p_editorControllerSelectionPathDidChanged:" name:@"CRLEditorControllerSelectionPathDidChangeNotification" object:v24];

    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v6 selector:"p_canvasWillZoom:" name:@"CRLCanvasWillZoomNotification" object:v8];

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v6 selector:"p_canvasDidZoom:" name:@"CRLCanvasDidZoomNotification" object:v8];

    v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v6 selector:"p_canvasDidScroll:" name:@"CRLCanvasDidScrollNotification" object:v8];

    v28 = [(CRLFreehandDrawingPKSelectionManager *)v6 p_windowScene];
    if (v28)
    {
      v29 = +[NSNotificationCenter defaultCenter];
      v30 = +[NSNotification CRLiOSSceneWillEnterForeground];
      [v29 addObserver:v6 selector:"p_willEnterForeground:" name:v30 object:v28];

      v31 = +[NSNotificationCenter defaultCenter];
      v32 = +[NSNotification CRLiOSSceneDidEnterBackground];
      [v31 addObserver:v6 selector:"p_didEnterBackground:" name:v32 object:v28];

      v33 = +[NSNotificationCenter defaultCenter];
      [v33 addObserver:v6 selector:"p_sceneDidActivate:" name:UISceneDidActivateNotification object:v28];

      v34 = +[NSNotificationCenter defaultCenter];
      [v34 addObserver:v6 selector:"p_sceneWillDeactivate:" name:UISceneWillDeactivateNotification object:v28];
    }
    __dmb(0xBu);
    uint64_t v35 = +[CRLLastSubmittedTaskQueue taskQueueWithQoSAsBackgroundWithLabel:@"com.apple.freeform.pk-selection-manager.on-board-indexing.queue"];
    onBoardIndexingQueue = v6->_onBoardIndexingQueue;
    v6->_onBoardIndexingQueue = (_TtC8Freeform25CRLLastSubmittedTaskQueue *)v35;
  }
  return v6;
}

- (void)teardown
{
  if (self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CCDD8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101068790();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CCDF8);
    }
    v2 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v2);
    }
    v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager teardown]");
    id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:166 isFatal:0 description:"attempting to call teardown on an instance of CRLFreehandDrawingPKSelectionManager that has already been torn down."];
  }
  else
  {
    self->_isTornDown = 1;
    smartSelectionController = self->_smartSelectionController;
    self->_smartSelectionController = 0;

    drawing = self->_drawing;
    self->_drawing = 0;

    [(CRLFreehandDrawingsAttachment *)self->_drawingsAttachment teardown];
    drawingsAttachment = self->_drawingsAttachment;
    self->_drawingsAttachment = 0;

    [(CRLFreehandDrawingSelectionDecorator *)self->_selectionDecorator tearDown];
    selectionDecorator = self->_selectionDecorator;
    self->_selectionDecorator = 0;

    objc_storeWeak((id *)&self->_drawingProvider, 0);
    objc_storeWeak((id *)&self->_translationViewController, 0);
    [(NSTimer *)self->_drawingIndexingTimer invalidate];
    drawingIndexingTimer = self->_drawingIndexingTimer;
    self->_drawingIndexingTimer = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v3 = [WeakRetained interactiveCanvasControllerForPKSelectionManager:self];

    id v4 = [v3 pkDrawingProvider];
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CCD98);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010686FC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CCDB8);
      }
      v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager teardown]");
      v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 154, 0, "invalid nil value for '%{public}s'", "drawingProvider");
    }
    [v4 removeConsolidatedPKDrawingObserver:self];
    v15 = +[NSNotificationCenter defaultCenter];
    id v16 = [v3 editorController];
    [v15 removeObserver:self name:@"CRLEditorControllerSelectionPathDidChangeNotification" object:v16];

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 removeObserver:self name:@"CRLCanvasWillZoomNotification" object:v3];

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 removeObserver:self name:@"CRLCanvasDidZoomNotification" object:v3];

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 removeObserver:self name:@"CRLCanvasDidScrollNotification" object:v3];

    id v20 = +[NSNotificationCenter defaultCenter];
    v21 = +[NSNotification CRLiOSSceneWillEnterForeground];
    [v20 removeObserver:self name:v21 object:0];

    id v22 = +[NSNotificationCenter defaultCenter];
    v23 = +[NSNotification CRLiOSSceneDidEnterBackground];
    [v22 removeObserver:self name:v23 object:0];

    v24 = +[NSNotificationCenter defaultCenter];
    [v24 removeObserver:self name:UISceneDidActivateNotification object:0];

    v25 = +[NSNotificationCenter defaultCenter];
    [v25 removeObserver:self name:UISceneWillDeactivateNotification object:0];
  }
}

- (void)dealloc
{
  if (!self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CCE18);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101068818();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CCE38);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:171 isFatal:0 description:"teardown not called for CRLFreehandDrawingPKSelectionManager."];
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLFreehandDrawingPKSelectionManager;
  [(CRLFreehandDrawingPKSelectionManager *)&v6 dealloc];
}

- (id)strokeUUIDsToDrawingItems
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_drawingProvider);
  v3 = [WeakRetained strokeUUIDsToDrawingItems];

  return v3;
}

- (id)strokeUUIDsToDrawingShapeItems
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_drawingProvider);
  v3 = [WeakRetained strokeUUIDsToDrawingShapeItems];

  return v3;
}

- (id)strokeUUIDsToStrokes
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_drawingProvider);
  v3 = [WeakRetained strokeUUIDsToStrokes];

  return v3;
}

- (CRLFreehandDrawingSelectionDecorator)selectionDecorator
{
  selectionDecorator = self->_selectionDecorator;
  if (!selectionDecorator)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = [WeakRetained interactiveCanvasControllerForPKSelectionManager:self];

    objc_super v6 = [[CRLFreehandDrawingSelectionDecorator alloc] initWithInteractiveCanvasController:v5];
    id v7 = self->_selectionDecorator;
    self->_selectionDecorator = v6;

    selectionDecorator = self->_selectionDecorator;
  }

  return selectionDecorator;
}

- (BOOL)hasSmartSelectedDrawingShapeItems
{
  return [(NSMutableArray *)self->_smartSelectedDrawingShapeItems count] != 0;
}

- (BOOL)shouldSuppressToolPickerVisibilityDidChangeUpdate
{
  uint64_t v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = sub_1002469D0(v3, WeakRetained);

  p_translationViewController = &self->_translationViewController;
  id v7 = objc_loadWeakRetained((id *)&self->_translationViewController);
  if (v7)
  {
    id v8 = [v5 presentedViewController];
    id v9 = objc_loadWeakRetained((id *)p_translationViewController);
    BOOL v10 = v8 == v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)updatePKStrokesFromAllFreehandDrawingItemsOnCanvas
{
  [(CRLFreehandDrawingPKSelectionManager *)self p_setDrawingsAttachmentToSmartSelectionController];
  uint64_t v3 = [(PKSmartSelectionController *)self->_smartSelectionController recognitionController];
  [v3 tagAsActive];

  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014CCE58);
  }
  id v4 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Setting recognition controller as active.", v5, 2u);
  }
}

- (id)freehandDrawingItemsFromCacheForPKQueryItems:(id)a3
{
  id v4 = a3;
  id v19 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  id v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v27;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        objc_super v6 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v7 = +[NSMutableSet set];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v8 = [v6 strokes];
        id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v23;
          do
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)j) _strokeUUID];
              v14 = [(CRLFreehandDrawingPKSelectionManager *)self strokeUUIDsToDrawingItems];
              v15 = [v14 objectForKey:v13];
              [v7 crl_addNonNilObject:v15];
            }
            id v10 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v10);
        }

        if ([v7 count])
        {
          id v16 = [v7 copy];
          [v19 addObject:v16];
        }
      }
      id v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }

  return v19;
}

- (id)makeFreehandDrawingItemsSearchTargetForCurrentlyCachedDrawing
{
  p_drawingProvider = &self->_drawingProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_drawingProvider);
  v5 = [WeakRetained strokeUUIDsToDrawingItems];
  objc_super v6 = [v5 allValues];

  if ([v6 count])
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = [v7 interactiveCanvasControllerForPKSelectionManager:self];

    id v9 = objc_alloc_init((Class)PKDrawing);
    id v10 = objc_loadWeakRetained((id *)p_drawingProvider);
    uint64_t v11 = [v10 pkStrokesContainingUnlockedDrawingsForEntireCanvas];
    id v12 = [v9 undoableAddNewStrokes:v11];

    v13 = [[CRLiOSFreehandDrawingItemsSearchTarget alloc] initWithDrawing:v9 interactiveCanvasController:v8];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)handleSingleTapInputAtUnscaledPoint:(CGPoint)a3
{
}

- (void)handleDoubleTapInputAtUnscaledPoint:(CGPoint)a3
{
}

- (void)handleDoubleTapInputAtUnscaledPoint:(CGPoint)a3 inSelectionView:(id)a4
{
}

- (void)clearSmartSelectionIfNecessary
{
}

- (BOOL)doesCurrentSmartSelectedDrawingShapeItemsContainDrawingShapeItem:(id)a3
{
  return [(NSMutableArray *)self->_smartSelectedDrawingShapeItems containsObject:a3];
}

- (void)removeSelectedShapeItemFromSmartSelectionBookkeeping:(id)a3
{
}

- (void)setCurrentSelectedDrawingItemsAsSmartSelected
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained interactiveCanvasControllerForPKSelectionManager:self];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v16 = v4;
  v5 = [v4 infosForCurrentSelectionPath];
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v9);
        uint64_t v11 = objc_opt_class();
        id v12 = sub_1002469D0(v11, v10);
        if (v12)
        {
          v13 = [(CRLFreehandDrawingPKSelectionManager *)self strokeUUIDsToDrawingShapeItems];
          v14 = [v13 allValues];
          unsigned int v15 = [v14 containsObject:v12];

          if (v15) {
            [(NSMutableArray *)self->_smartSelectedDrawingShapeItems addObject:v12];
          }
        }

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
}

- (void)installSmartSelectionViewForCurrentSelection
{
}

- (void)straighten:(id)a3
{
  id v4 = a3;
  [(CRLFreehandDrawingPKSelectionManager *)self p_dismissEditMenuIfNecessary];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained interactiveCanvasControllerForPKSelectionManager:self];

  id v7 = [v6 layerHost];
  uint64_t v8 = [v7 asiOSCVC];

  id v9 = [v8 crl_windowWrapper];
  id v10 = (CRLiOSWindowIgnoreUserInteractionSafeWrapper *)[v9 newWrapperBeginningIgnoringUserInteractionSafely];
  strokeStraighteningIgnoreInteractionWrapper = self->_strokeStraighteningIgnoreInteractionWrapper;
  self->_strokeStraighteningIgnoreInteractionWrapper = v10;

  id v12 = [v6 editingCoordinator];
  [v12 suspendCollaborationWithReason:@"CRLFreehandDrawingAsyncStraightenStrokes"];

  smartSelectionController = self->_smartSelectionController;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100034254;
  v14[3] = &unk_1014CCEA0;
  v14[4] = self;
  v14[5] = v6;
  [(PKSmartSelectionController *)smartSelectionController straighten:v4 completion:v14];
}

- (void)copyAsText:(id)a3
{
  [(CRLFreehandDrawingPKSelectionManager *)self p_dismissEditMenuIfNecessary];
  smartSelectionController = self->_smartSelectionController;

  [(PKSmartSelectionController *)smartSelectionController copyAsText:self];
}

- (void)translate:(id)a3
{
  [(CRLFreehandDrawingPKSelectionManager *)self p_dismissEditMenuIfNecessary];
  smartSelectionController = self->_smartSelectionController;

  [(PKSmartSelectionController *)smartSelectionController translate:self];
}

- (BOOL)canTranslate
{
  return [(PKSmartSelectionController *)self->_smartSelectionController canTranslate];
}

- (void)dynamicOperationDidBeginWithRealTimeCommands:(BOOL)a3
{
  if (a3) {
    self->_isInDynamicOperationWithRealTimeCommands = 1;
  }
  [(CRLFreehandDrawingPKSelectionManager *)self p_removeCurrentSelectionView];
}

- (void)dynamicOperationDidEnd
{
  if (self->_isInDynamicOperationWithRealTimeCommands)
  {
    self->_isInDynamicOperationWithRealTimeCommands = 0;
    [(PKSmartSelectionController *)self->_smartSelectionController installSelectionViewForCurrentSelection];
  }
}

- (void)replacingCurrentlySmartSelectedItems:(id)a3 withNewItemsToSmartSelect:(id)a4
{
  id v6 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = [a3 allObjects];
  id v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v31 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = sub_1002469D0(v13, v12);
      if (!v14) {
        break;
      }
      unsigned int v15 = (void *)v14;
      unsigned int v16 = [(NSMutableArray *)self->_smartSelectedDrawingShapeItems containsObject:v14];

      if (!v16) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    id v7 = +[NSMutableArray array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v6;
    id v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        id v21 = 0;
        do
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v21);
          uint64_t v23 = objc_opt_class();
          long long v24 = sub_1002469D0(v23, v22);
          if (v24) {
            [v7 addObject:v24];
          }

          id v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v19);
    }

    id v25 = [v7 count];
    if (v25 == [v17 count])
    {
      objc_storeStrong((id *)&self->_smartSelectedDrawingShapeItems, v7);
      self->_keepSmartSelectedDrawingShapeItemAfterSelectionPathUpdated = 1;
    }
  }
}

- (void)beginSuppressingSmartSelection
{
  if (self->_isSmartSelectionSuppressed)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CCEC0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010688A0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CCEE0);
    }
    v2 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v2);
    }
    uint64_t v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager beginSuppressingSmartSelection]");
    id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:412 isFatal:0 description:"Should not begin suppressing smart selection when it is already suppressed."];
  }
  else
  {
    self->_isSmartSelectionSuppressed = 1;
    [(CRLFreehandDrawingPKSelectionManager *)self p_removeCurrentSelectionView];
  }
}

- (void)endSuppressingSmartSelection
{
  if (self->_isSmartSelectionSuppressed)
  {
    self->_isSmartSelectionSuppressed = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v4 = [WeakRetained interactiveCanvasControllerForPKSelectionManager:self];

    [v4 infosForCurrentSelectionPath];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = objc_opt_class();
          id v12 = sub_1002469D0(v11, v10);
          if (!v12
            || (-[NSMutableArray containsObject:](self->_smartSelectedDrawingShapeItems, "containsObject:", v12, (void)v14) & 1) == 0)
          {

            goto LABEL_23;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    if ([(NSArray *)self->_selectedStrokes count]) {
      [(CRLFreehandDrawingPKSelectionManager *)self installSmartSelectionViewForCurrentSelection];
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CCF00);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101068928();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CCF20);
    }
    uint64_t v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager endSuppressingSmartSelection]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:424 isFatal:0 description:"Should not end suppressing smart selection when it is not suppressed."];
  }
LABEL_23:
}

- (id)drawingForHandwritingDebugging
{
  return self->_drawing;
}

- (void)p_setDrawingsAttachmentToSmartSelectionController
{
  if (!self->_smartSelectionController)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v4 = [WeakRetained pencilKitCanvasViewForPKSelectionManager:self];

    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [v5 interactiveCanvasControllerForPKSelectionManager:self];

    id v7 = [v6 layerHost];
    uint64_t v8 = [v7 asiOSCVC];

    id v9 = [v8 doubleTapGestureRecognizer];
    uint64_t v10 = (PKSmartSelectionController *)[objc_alloc((Class)PKSmartSelectionController) initWithDelegate:self canvasView:v4 drawing:self->_drawing gestureRecognizer:v9];
    smartSelectionController = self->_smartSelectionController;
    self->_smartSelectionController = v10;
  }
  id v12 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v13 = [v12 interactiveCanvasControllerForPKSelectionManager:self];

  [(CRLFreehandDrawingsAttachment *)self->_drawingsAttachment teardown];
  drawingsAttachment = self->_drawingsAttachment;
  self->_drawingsAttachment = 0;

  if (self->_drawing)
  {
    long long v15 = [[CRLFreehandDrawingsAttachment alloc] initWithDelegate:self drawing:self->_drawing];
    long long v16 = self->_drawingsAttachment;
    self->_drawingsAttachment = v15;

    long long v17 = [(CRLFreehandDrawingsAttachment *)self->_drawingsAttachment drawing];

    if (v17)
    {
      [(PKSmartSelectionController *)self->_smartSelectionController setExternalAttachment:self->_drawingsAttachment];
      id v18 = self->_smartSelectionController;
      [v13 visibleUnscaledRect];
      -[PKSmartSelectionController invalidateCacheForBounds:inDrawing:](v18, "invalidateCacheForBounds:inDrawing:", self->_drawing);
      id v19 = +[NSNotificationCenter defaultCenter];
      [v19 postNotificationName:@"CRLActiveBoardDidOpenToCacheAllDrawingIndexedContents" object:self];

      [(CRLFreehandDrawingPKSelectionManager *)self p_indexHandwrittenTextsFromDrawing];
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CCF40);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010689B0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CCF60);
      }
      uint64_t v20 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v20);
      }
      id v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager p_setDrawingsAttachmentToSmartSelectionController]");
      long long v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"];
      +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:473 isFatal:0 description:"Drawing attachment has no drawing."];
    }
  }
}

- (void)p_recursivelyAddFreehandDrawingItemsFromGroup:(id)a3 drawingItems:(id)a4
{
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [a3 childItems];
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = objc_opt_class();
        long long v14 = sub_1002469D0(v13, v12);
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = sub_1002469D0(v15, v12);
        long long v17 = (void *)v16;
        if (v14)
        {
          [v6 addObject:v14];
        }
        else if (v16)
        {
          [(CRLFreehandDrawingPKSelectionManager *)self p_recursivelyAddFreehandDrawingItemsFromGroup:v16 drawingItems:v6];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)p_editorControllerSelectionPathDidChanged:(id)a3
{
  if ([(CRLFreehandDrawingPKSelectionManager *)self p_shouldSyncStrokeSelection])
  {
    id v4 = +[NSMutableSet set];
    id v25 = self;
    id v5 = [(CRLFreehandDrawingPKSelectionManager *)self interactiveCanvasController];
    id v6 = [v5 freehandDrawingToolkit];
    unsigned int v7 = [v6 isInDrawingMode];

    id v8 = [v5 editorController];
    id v9 = [v8 selectionPath];

    long long v24 = v5;
    uint64_t v10 = [v5 selectionModelTranslator];
    uint64_t v11 = [v10 infosForSelectionPath:v9];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v18 = objc_opt_class();
          long long v19 = sub_1002469D0(v18, v17);
          if (v7)
          {
            [v4 crl_addNonNilObject:v19];
          }
          else
          {
            uint64_t v20 = objc_opt_class();
            long long v21 = [v19 childItems];
            long long v22 = sub_1002469D0(v20, v21);

            [v4 crl_addObjectsFromNonNilArray:v22];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v14);
    }

    uint64_t v23 = [v4 allObjects];
    [(CRLFreehandDrawingPKSelectionManager *)v25 p_selectStrokesInDrawingShapeItems:v23];
  }
}

- (void)p_canvasWillZoom:(id)a3
{
  uint64_t v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = sub_1002469D0(v4, WeakRetained);

  unsigned int v7 = [v6 smartSelectionView];

  if (v7)
  {
    id v8 = [v6 smartSelectionView];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000357FC;
    v9[3] = &unk_1014CBBB0;
    v9[4] = v6;
    +[UIView transitionWithView:v8 duration:0 options:v9 animations:0 completion:0.25];
  }
}

- (void)p_canvasDidZoom:(id)a3
{
  [(CRLFreehandDrawingsAttachment *)self->_drawingsAttachment updateVisibleUnscaledBoundsAfterDrawingChanged];
  uint64_t v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  sub_1002469D0(v4, WeakRetained);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [v10 smartSelectionView];

  if (v6)
  {
    [v10 removeSmartSelectionViewIfNecessary];
    [(PKSmartSelectionController *)self->_smartSelectionController installSelectionViewForCurrentSelection];
  }
  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = [v7 interactiveCanvasControllerForPKSelectionManager:self];

  smartSelectionController = self->_smartSelectionController;
  [v8 visibleUnscaledRect];
  -[PKSmartSelectionController invalidateCacheForBounds:inDrawing:](smartSelectionController, "invalidateCacheForBounds:inDrawing:", self->_drawing);
}

- (void)p_canvasDidScroll:(id)a3
{
  [(CRLFreehandDrawingsAttachment *)self->_drawingsAttachment updateVisibleUnscaledBoundsAfterDrawingChanged];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained interactiveCanvasControllerForPKSelectionManager:self];

  smartSelectionController = self->_smartSelectionController;
  [v6 visibleUnscaledRect];
  -[PKSmartSelectionController invalidateCacheForBounds:inDrawing:](smartSelectionController, "invalidateCacheForBounds:inDrawing:", self->_drawing);
}

- (void)p_selectStrokesInDrawingShapeItems:(id)a3
{
  id v5 = a3;
  [(CRLFreehandDrawingPKSelectionManager *)self p_removeCurrentSelectionView];
  uint64_t v4 = [(CRLFreehandDrawingPKSelectionManager *)self p_cachedStrokesForDrawingShapeItems:v5];
  if ([v4 count] || objc_msgSend(v5, "count"))
  {
    if ([v4 count]) {
      [(PKSmartSelectionController *)self->_smartSelectionController selectStrokesWithoutDidSelectStrokesUpdate:v4 inDrawing:self->_drawing];
    }
  }
  else
  {
    [(PKSmartSelectionController *)self->_smartSelectionController clearSelectionIfNecessaryWithCompletion:&stru_1014CCF80];
  }
  objc_storeStrong((id *)&self->_selectedStrokes, v4);
  if (self->_keepSmartSelectedDrawingShapeItemAfterSelectionPathUpdated) {
    self->_keepSmartSelectedDrawingShapeItemAfterSelectionPathUpdated = 0;
  }
  else {
    [(NSMutableArray *)self->_smartSelectedDrawingShapeItems removeAllObjects];
  }
}

- (id)p_cachedStrokesForDrawingShapeItems:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained interactiveCanvasControllerForPKSelectionManager:self];

  id v7 = [v6 pkDrawingProvider];
  if (v7)
  {
    long long v21 = v6;
    id v8 = +[NSMutableArray array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v4;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v15 = [v7 drawingShapeItemUUIDToStrokeUUIDBidirectionalMap];
          uint64_t v16 = [v14 id];
          long long v17 = [v15 objectForKeyedSubscript:v16];

          if (v17)
          {
            uint64_t v18 = [(CRLFreehandDrawingPKSelectionManager *)self strokeUUIDsToStrokes];
            long long v19 = [v18 objectForKey:v17];

            [v8 crl_addNonNilObject:v19];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }

    id v6 = v21;
    id v4 = v22;
  }
  else
  {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

- (id)p_cachedDrawingShapeItemsForStrokes:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [(CRLFreehandDrawingPKSelectionManager *)self strokeUUIDsToDrawingShapeItems];
        id v13 = [v11 _strokeUUID];
        id v14 = [v12 objectForKeyedSubscript:v13];

        if (v14) {
          [v5 addObject:v14];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v15 = [v5 allObjects];

  return v15;
}

- (void)p_removeCurrentSelectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained installSmartSelectionView:0 forPKSelectionManager:self];
}

- (void)p_indexHandwrittenTextsFromDrawing
{
  uint64_t v3 = [(PKDrawing *)self->_drawing strokes];
  id v4 = [v3 count];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [WeakRetained interactiveCanvasControllerForPKSelectionManager:self];

    id v7 = [v6 editingCoordinator];
    id v8 = [v7 mainBoard];

    uint64_t v9 = [v8 boardIdentifierStringRepresentation];
    id v10 = [(PKDrawing *)self->_drawing copy];
    objc_initWeak(&location, self);
    uint64_t v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = sub_100035FC8;
    uint64_t v15 = &unk_1014CCFD0;
    objc_copyWeak(&v18, &location);
    id v16 = v10;
    long long v17 = v9;
    id v11 = objc_retainBlock(&v12);
    -[CRLLastSubmittedTaskQueue performAsync:](self->_onBoardIndexingQueue, "performAsync:", v11, v12, v13, v14, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (void)p_willEnterForeground:(id)a3
{
  id v4 = a3;
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014CCFF0);
  }
  id v5 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting recognition controller as active.", v7, 2u);
  }
  id v6 = [(PKSmartSelectionController *)self->_smartSelectionController recognitionController];
  [v6 tagAsActive];
}

- (void)p_didEnterBackground:(id)a3
{
  id v4 = a3;
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014CD010);
  }
  id v5 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting recognition controller as idle.", v7, 2u);
  }
  id v6 = [(PKSmartSelectionController *)self->_smartSelectionController recognitionController];
  [v6 tagAsIdle];
}

- (void)p_sceneDidActivate:(id)a3
{
  if ([(NSMutableArray *)self->_smartSelectedDrawingShapeItems count])
  {
    id v10 = [(CRLFreehandDrawingPKSelectionManager *)self p_cachedStrokesForDrawingShapeItems:self->_smartSelectedDrawingShapeItems];
    [(PKSmartSelectionController *)self->_smartSelectionController selectStrokesWithoutDidSelectStrokesUpdate:v10 inDrawing:self->_drawing];
    [(CRLFreehandDrawingPKSelectionManager *)self installSmartSelectionViewForCurrentSelection];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v5 = [WeakRetained interactiveCanvasControllerForPKSelectionManager:self];

    id v6 = [v5 layerHost];
    id v7 = [v6 asiOSCVC];

    id v8 = [v7 delegate];
    uint64_t v9 = [v8 currentDocumentMode];

    [v9 pencilKitDidSmartSelectStrokesInDrawingShapeItems:self->_smartSelectedDrawingShapeItems];
  }
}

- (void)p_sceneWillDeactivate:(id)a3
{
  if ([(NSMutableArray *)self->_smartSelectedDrawingShapeItems count])
  {
    self->_keepSmartSelectedDrawingShapeItemAfterSelectionPathUpdated = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v9 = [WeakRetained interactiveCanvasControllerForPKSelectionManager:self];

    id v5 = [v9 layerHost];
    id v6 = [v5 asiOSCVC];

    id v7 = [v6 delegate];
    id v8 = [v7 currentDocumentMode];

    [v8 pencilKitDidSmartSelectStrokesInDrawingShapeItems:&__NSArray0__struct];
  }
}

- (id)p_windowScene
{
  uint64_t v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = sub_1002469D0(v3, WeakRetained);

  id v6 = [v5 view];
  id v7 = [v6 window];
  id v8 = [v7 windowScene];

  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD030);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101068A38();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD050);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager p_windowScene]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 685, 0, "invalid nil value for '%{public}s'", "windowScene");
  }

  return v8;
}

- (void)p_dismissEditMenuIfNecessary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained interactiveCanvasControllerForPKSelectionManager:self];

  id v5 = [v4 layerHost];
  id v6 = [v5 asiOSCVC];

  id v7 = [v6 delegate];
  id v8 = [v7 currentDocumentMode];

  uint64_t v9 = objc_opt_class();
  id v10 = sub_1002469D0(v9, v8);
  if (!v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD070);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101068ACC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD090);
    }
    id v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    uint64_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager p_dismissEditMenuIfNecessary]");
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 695, 0, "invalid nil value for '%{public}s'", "drawingMode");
  }
  [v10 hideEditMenuForLassoSelection];
}

- (BOOL)p_shouldSyncStrokeSelection
{
  uint64_t v3 = +[NSMutableArray array];
  uint64_t v35 = self;
  id v4 = [(CRLFreehandDrawingPKSelectionManager *)self interactiveCanvasController];
  id v5 = [v4 freehandDrawingToolkit];
  id v6 = [v5 isInDrawingMode];

  id v7 = [v4 editorController];
  uint64_t v8 = [v7 selectionPath];

  uint64_t v9 = [v4 selectionModelTranslator];
  v36 = (void *)v8;
  id v10 = [v9 infosForSelectionPath:v8];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v45;
    uint64_t v37 = *(void *)v45;
    do
    {
      id v14 = 0;
      id v38 = v12;
      do
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v14);
        if (v6)
        {
          uint64_t v16 = objc_opt_class();
          long long v17 = sub_1002469D0(v16, v15);
          [v3 crl_addNonNilObject:v17];
        }
        else
        {
          id v18 = v6;
          uint64_t v19 = objc_opt_class();
          long long v17 = sub_1002469D0(v19, v15);
          long long v20 = [v17 childItems];
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v21 = [v20 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v41;
            do
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v41 != v23) {
                  objc_enumerationMutation(v20);
                }
                long long v25 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                uint64_t v26 = objc_opt_class();
                long long v27 = sub_1002469D0(v26, v25);
                [v3 crl_addNonNilObject:v27];
              }
              id v22 = [v20 countByEnumeratingWithState:&v40 objects:v48 count:16];
            }
            while (v22);
          }

          id v6 = v18;
          uint64_t v13 = v37;
          id v12 = v38;
        }

        id v14 = (char *)v14 + 1;
      }
      while (v14 != v12);
      id v12 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v12);
  }

  long long v28 = [(CRLFreehandDrawingPKSelectionManager *)v35 p_cachedStrokesForDrawingShapeItems:v3];
  long long v29 = [(PKSmartSelectionController *)v35->_smartSelectionController currentSelectedStrokes];
  id v30 = [v28 count];
  if (v30 == [v29 count])
  {
    long long v31 = +[NSSet setWithArray:v28];
    long long v32 = +[NSSet setWithArray:v29];
    unsigned int v33 = [v31 isEqualToSet:v32] ^ 1;
  }
  else
  {
    LOBYTE(v33) = 1;
  }

  return v33;
}

- (void)pkStrokesContainingUnlockedDrawingsForEntireCanvasDidChange:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD0B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101068B60();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD0D0);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager pkStrokesContainingUnlockedDrawingsForEntireCanvasDidChange:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:732 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  drawing = self->_drawing;
  uint64_t v9 = +[NSMutableArray array];
  [(PKDrawing *)drawing _setAllStrokes:v9];

  [(PKDrawing *)self->_drawing invalidateVisibleStrokes];
  uint64_t v35 = v4;
  id v10 = [(PKDrawing *)self->_drawing undoableAddNewStrokes:v4];
  [(CRLFreehandDrawingsAttachment *)self->_drawingsAttachment updateVisibleUnscaledBoundsAfterDrawingChanged];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v12 = [WeakRetained interactiveCanvasControllerForPKSelectionManager:self];

  uint64_t v13 = +[NSMutableSet set];
  id v14 = [v12 editorController];
  uint64_t v15 = [v14 selectionPath];

  uint64_t v16 = [v12 selectionModelTranslator];
  long long v17 = [v16 infosForSelectionPath:v15];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v18 = v17;
  id v19 = [v18 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v41;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v24 = objc_opt_class();
        long long v25 = sub_1002469D0(v24, v23);
        if (v25) {
          [v13 addObject:v25];
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v20);
  }

  uint64_t v26 = [v13 allObjects];
  long long v27 = [(CRLFreehandDrawingPKSelectionManager *)self p_cachedStrokesForDrawingShapeItems:v26];
  selectedStrokes = self->_selectedStrokes;
  self->_selectedStrokes = v27;

  smartSelectionController = self->_smartSelectionController;
  [v12 visibleUnscaledRect];
  -[PKSmartSelectionController invalidateCacheForBounds:inDrawing:](smartSelectionController, "invalidateCacheForBounds:inDrawing:", self->_drawing);
  [(PKSmartSelectionController *)self->_smartSelectionController selectStrokesWithoutDidSelectStrokesUpdate:self->_selectedStrokes inDrawing:self->_drawing];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v30 = [v13 allObjects];
  id v31 = [v30 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v37;
    while (2)
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v37 != v33) {
          objc_enumerationMutation(v30);
        }
        if (![(NSMutableArray *)self->_smartSelectedDrawingShapeItems containsObject:*(void *)(*((void *)&v36 + 1) + 8 * (void)j)])
        {

          goto LABEL_32;
        }
      }
      id v32 = [v30 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v32) {
        continue;
      }
      break;
    }
  }

  if (!self->_isSmartSelectionSuppressed && !self->_isInDynamicOperationWithRealTimeCommands) {
    [(PKSmartSelectionController *)self->_smartSelectionController installSelectionViewForCurrentSelection];
  }
LABEL_32:
}

- (void)installSelectionView:(id)a3 fromView:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained installSmartSelectionView:v6 forPKSelectionManager:self];
}

- (void)installTranslationViewController:(id)a3
{
  if (a3)
  {
    p_translationViewController = &self->_translationViewController;
    id v5 = a3;
    objc_storeWeak((id *)p_translationViewController, v5);
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v38 = [WeakRetained interactiveCanvasControllerForPKSelectionManager:self];

    uint64_t v8 = [v38 layerHost];
    uint64_t v9 = [v8 asiOSCVC];

    uint64_t v10 = objc_opt_class();
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    id v12 = sub_1002469D0(v10, v11);

    uint64_t v13 = [v38 editorController];
    id v14 = [v13 selectionPath];

    [v9 targetRectForEditMenu:v14];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    uint64_t v23 = [v12 view];
    uint64_t v24 = [v23 coordinateSpace];
    long long v25 = [v38 canvasView];
    uint64_t v26 = [v25 coordinateSpace];
    [v24 convertRect:v26 fromCoordinateSpace:v16, v18, v20, v22];
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;

    uint64_t v35 = [v5 popoverPresentationController];
    [v35 setSourceRect:v28, v30, v32, v34];

    long long v36 = [v12 view];
    long long v37 = [v5 popoverPresentationController];
    [v37 setSourceView:v36];

    [v12 presentViewController:v5 animated:1 completion:0];
  }
}

- (id)interactiveCanvasController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained interactiveCanvasControllerForPKSelectionManager:self];

  return v4;
}

- (id)smartSelectionControllerForAttachment:(id)a3
{
  return self->_smartSelectionController;
}

- (void)pencilKitDidSmartSelectPreviouslySelectedStrokes:(id)a3
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!-[NSArray containsObject:](self->_selectedStrokes, "containsObject:", *(void *)(*((void *)&v18 + 1) + 8 * (void)v8), (void)v18))
        {
          uint64_t v13 = v4;
          goto LABEL_11;
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  uint64_t v9 = [(CRLFreehandDrawingPKSelectionManager *)self p_cachedDrawingShapeItemsForStrokes:v4];
  uint64_t v10 = (NSMutableArray *)[v9 mutableCopy];
  smartSelectedDrawingShapeItems = self->_smartSelectedDrawingShapeItems;
  self->_smartSelectedDrawingShapeItems = v10;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v13 = [WeakRetained interactiveCanvasControllerForPKSelectionManager:self];

  id v14 = [v13 layerHost];
  double v15 = [v14 asiOSCVC];

  double v16 = [v15 delegate];
  double v17 = [v16 currentDocumentMode];

  self->_keepSmartSelectedDrawingShapeItemAfterSelectionPathUpdated = 1;
  [v17 pencilKitDidSmartSelectStrokesInDrawingShapeItems:self->_smartSelectedDrawingShapeItems];
  [v13 invalidateAllLayers];
  [(PKSmartSelectionController *)self->_smartSelectionController installSelectionViewForCurrentSelection];

LABEL_11:
}

- (void)didSelectStrokes:(id)a3 selectionType:(int64_t)a4 inAttachment:(id)a5
{
  id v6 = a3;
  uint64_t v7 = +[NSMutableSet set];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v12);
        id v14 = [(CRLFreehandDrawingPKSelectionManager *)self strokeUUIDsToDrawingShapeItems];
        double v15 = [v13 _strokeUUID];
        double v16 = [v14 objectForKey:v15];

        if (v16) {
          [v7 addObject:v16];
        }

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);
  }

  double v17 = [v7 allObjects];
  long long v18 = (NSMutableArray *)[v17 mutableCopy];
  smartSelectedDrawingShapeItems = self->_smartSelectedDrawingShapeItems;
  self->_smartSelectedDrawingShapeItems = v18;

  long long v20 = (NSArray *)[v8 copy];
  selectedStrokes = self->_selectedStrokes;
  self->_selectedStrokes = v20;

  if ([(CRLFreehandDrawingPKSelectionManager *)self p_shouldSyncStrokeSelection])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v23 = [WeakRetained interactiveCanvasControllerForPKSelectionManager:self];

    uint64_t v24 = [v23 layerHost];
    long long v25 = [v24 asiOSCVC];

    uint64_t v26 = [v25 delegate];
    double v27 = [v26 currentDocumentMode];

    [v27 pencilKitDidSmartSelectStrokesInDrawingShapeItems:self->_smartSelectedDrawingShapeItems];
  }
}

- (BOOL)handleSmartSelectionTapAtUnscaledLocation:(CGPoint)a3 inAttachment:(id)a4
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onBoardIndexingQueue, 0);
  objc_storeStrong((id *)&self->_drawingIndexingTimer, 0);
  objc_destroyWeak((id *)&self->_translationViewController);
  objc_storeStrong((id *)&self->_strokeStraighteningIgnoreInteractionWrapper, 0);
  objc_storeStrong((id *)&self->_selectedStrokes, 0);
  objc_storeStrong((id *)&self->_smartSelectedDrawingShapeItems, 0);
  objc_storeStrong((id *)&self->_selectionDecorator, 0);
  objc_storeStrong((id *)&self->_drawingsAttachment, 0);
  objc_storeStrong((id *)&self->_smartSelectionController, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_destroyWeak((id *)&self->_drawingProvider);

  objc_destroyWeak((id *)&self->_delegate);
}

@end