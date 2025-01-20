@interface CRLFreehandDrawingToolkit
- ($DFF4DC44DB28EA937F31517ED997C956)inputPointFromHoverGesture:(SEL)a3;
- ($DFF4DC44DB28EA937F31517ED997C956)inputPointInPKCanvasViewFromUnscaledSpace:(SEL)a3;
- (BOOL)canBeginFreehandDrawingMode;
- (BOOL)currentToolAllowsDragForTouchType:(int64_t)a3 atUnscaledPoint:(CGPoint)a4;
- (BOOL)isInDrawingMode;
- (BOOL)isLassoAbleToSelectMixedType;
- (BOOL)isLassoSelectionForMixedTypeEnabledInDrawingMode;
- (BOOL)isObjectEraser;
- (BOOL)isRulerToolShowing;
- (BOOL)supportsPencilHoverPreview;
- (BOOL)wantsToAnimateForObjectUUID:(id)a3 animation:(id)a4;
- (BOOL)wantsToSuppressKnobsOnTransformReps;
- (CRLColor)colorForCurrentTool;
- (CRLColor)defaultOutlineColor;
- (CRLFreehandDrawingTool)currentTool;
- (CRLFreehandDrawingToolkit)initWithDelegate:(id)a3 uiState:(id)a4;
- (CRLFreehandDrawingToolkitUIState)toolkitUIState;
- (PKCanvasView)pkCanvasView;
- (double)opacityForCurrentTool;
- (double)widthForCurrentTool;
- (id)animationCompletionHandlerForObjectUUID:(id)a3 animation:(id)a4;
- (unint64_t)freehandDrawingBehaviorForTouchType:(int64_t)a3 atUnscaledPoint:(CGPoint)a4;
- (void)addToolkitObserver:(id)a3;
- (void)beginDrawingModeIfNeededForTouchType:(int64_t)a3;
- (void)beginDrawingTransformModeIfNeeded;
- (void)containedToolDidSetWidth:(id)a3;
- (void)endDrawingModeIfNeeded;
- (void)enqueueAnimationForObjectUUID:(id)a3 animation:(id)a4;
- (void)enqueueAnimationForObjectUUID:(id)a3 animation:(id)a4 completion:(id)a5;
- (void)keepPencilShadowVisible;
- (void)p_notifyObserversOfWidthChange;
- (void)p_tearDownRunloopObserver;
- (void)removeToolkitObserver:(id)a3;
- (void)resetToMostRecentRestorableToolType;
- (void)setColorForCurrentTool:(id)a3;
- (void)setCurrentToolSelection:(unint64_t)a3;
- (void)setOpacityForCurrentTool:(double)a3;
- (void)setRulerToolShowing:(BOOL)a3;
- (void)setUpdatedToolkitUIStateFromArchive:(id)a3;
- (void)setWidthForCurrentTool:(double)a3;
- (void)updatePencilShadowToScribbleMode;
- (void)updatePencilShadowWithInputPoint:(id *)a3;
@end

@implementation CRLFreehandDrawingToolkit

- (CRLFreehandDrawingToolkit)initWithDelegate:(id)a3 uiState:(id)a4
{
  id v6 = a3;
  v7 = (CRLFreehandDrawingToolkitUIState *)a4;
  v24.receiver = self;
  v24.super_class = (Class)CRLFreehandDrawingToolkit;
  v8 = [(CRLFreehandDrawingToolkit *)&v24 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    uint64_t v10 = +[NSHashTable hashTableWithOptions:5];
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v10;

    if (!v7)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EC430);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109C280();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EC450);
      }
      v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkit initWithDelegate:uiState:]");
      v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkit.m"];
      +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:64 isFatal:0 description:"Expected to get a toolkit UI state from the document!"];

      v7 = objc_alloc_init(CRLFreehandDrawingToolkitUIState);
    }
    objc_storeStrong((id *)&v9->_toolkitUIState, v7);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.freeform.freehand-drawing.canvas-animation", 0);
    animationSerialQueue = v9->_animationSerialQueue;
    v9->_animationSerialQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    objectUUIDsToAnimate = v9->_objectUUIDsToAnimate;
    v9->_objectUUIDsToAnimate = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    animationCompletionHandlers = v9->_animationCompletionHandlers;
    v9->_animationCompletionHandlers = v19;

    uint64_t v21 = +[CRLColor colorWithHexString:@"#636366"];
    defaultOutlineColor = v9->_defaultOutlineColor;
    v9->_defaultOutlineColor = (CRLColor *)v21;
  }
  return v9;
}

- (void)addToolkitObserver:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC470);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109C390();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC490);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkit addToolkitObserver:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkit.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:78 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if ([(NSHashTable *)self->_observers containsObject:v4])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC4B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109C308();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC4D0);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkit addToolkitObserver:]");
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkit.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:79 isFatal:0 description:"Should not add a freehand drawing toolkit observer that's already added."];
  }
  [(NSHashTable *)self->_observers addObject:v4];
}

- (void)removeToolkitObserver:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC4F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109C4A0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC510);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkit removeToolkitObserver:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkit.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:85 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (![(NSHashTable *)self->_observers containsObject:v4])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC530);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109C418();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC550);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkit removeToolkitObserver:]");
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkit.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:86 isFatal:0 description:"Should not remove a freehand drawing toolkit observer that has not been added."];
  }
  [(NSHashTable *)self->_observers removeObject:v4];
}

- (CRLFreehandDrawingTool)currentTool
{
  cachedCurrentTool = self->_cachedCurrentTool;
  if (!cachedCurrentTool)
  {
    toolkitUIState = self->_toolkitUIState;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [WeakRetained interactiveCanvasControllerForFreehandDrawingTools];
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = [v7 pencilKitCanvasViewControllerForFreehandDrawingTools];
    v9 = [(CRLFreehandDrawingToolkitUIState *)toolkitUIState currentToolForInteractiveCanvasController:v6 pencilKitCanvasViewController:v8];
    uint64_t v10 = self->_cachedCurrentTool;
    self->_cachedCurrentTool = v9;

    cachedCurrentTool = self->_cachedCurrentTool;
  }

  return cachedCurrentTool;
}

- (void)setCurrentToolSelection:(unint64_t)a3
{
  unint64_t v5 = [(CRLFreehandDrawingToolkitUIState *)self->_toolkitUIState currentToolType];
  if (a3 == 8 || v5 != a3)
  {
    cachedCurrentTool = self->_cachedCurrentTool;
    self->_cachedCurrentTool = 0;

    self->_askedDelegateForSmartAnnotationTool = 0;
    [(CRLFreehandDrawingToolkitUIState *)self->_toolkitUIState setCurrentToolType:a3];
    id v7 = [(NSHashTable *)self->_observers copy];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) toolkitDidUpdateCurrentToolSelection:v13];
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)resetToMostRecentRestorableToolType
{
  v3 = [(CRLFreehandDrawingToolkitUIState *)self->_toolkitUIState mostRecentRestorableToolType];
  if (v3 != (void *)[(CRLFreehandDrawingToolkitUIState *)self->_toolkitUIState currentToolType])
  {
    unint64_t v4 = [(CRLFreehandDrawingToolkitUIState *)self->_toolkitUIState mostRecentRestorableToolType];
    [(CRLFreehandDrawingToolkit *)self setCurrentToolSelection:v4];
  }
}

- (CRLColor)colorForCurrentTool
{
  toolkitUIState = self->_toolkitUIState;
  v3 = [(CRLFreehandDrawingToolkit *)self currentTool];
  unint64_t v4 = -[CRLFreehandDrawingToolkitUIState colorForToolType:](toolkitUIState, "colorForToolType:", [v3 type]);

  return (CRLColor *)v4;
}

- (void)setColorForCurrentTool:(id)a3
{
  [(CRLFreehandDrawingToolkitUIState *)self->_toolkitUIState setCurrentToolColor:a3];
  cachedCurrentTool = self->_cachedCurrentTool;
  self->_cachedCurrentTool = 0;

  id v8 = [(CRLFreehandDrawingToolkit *)self currentTool];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained pencilKitCanvasViewControllerForFreehandDrawingTools];
  id v7 = [v6 pencilKitCanvasView];
  [v8 updatePencilKitToolIfAppropriateFor:v7];
}

- (double)opacityForCurrentTool
{
  toolkitUIState = self->_toolkitUIState;
  v3 = [(CRLFreehandDrawingToolkit *)self currentTool];
  -[CRLFreehandDrawingToolkitUIState opacityForToolType:](toolkitUIState, "opacityForToolType:", [v3 type]);
  double v5 = v4;

  return v5;
}

- (void)setOpacityForCurrentTool:(double)a3
{
  [(CRLFreehandDrawingToolkitUIState *)self->_toolkitUIState setCurrentToolOpacity:a3];
  cachedCurrentTool = self->_cachedCurrentTool;
  self->_cachedCurrentTool = 0;

  id v8 = [(CRLFreehandDrawingToolkit *)self currentTool];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained pencilKitCanvasViewControllerForFreehandDrawingTools];
  id v7 = [v6 pencilKitCanvasView];
  [v8 updatePencilKitToolIfAppropriateFor:v7];
}

- (double)widthForCurrentTool
{
  toolkitUIState = self->_toolkitUIState;
  v3 = [(CRLFreehandDrawingToolkit *)self currentTool];
  -[CRLFreehandDrawingToolkitUIState strokeWidthForToolType:](toolkitUIState, "strokeWidthForToolType:", [v3 type]);
  double v5 = v4;

  return v5;
}

- (void)setWidthForCurrentTool:(double)a3
{
  [(CRLFreehandDrawingToolkitUIState *)self->_toolkitUIState setCurrentToolWidth:a3];
  cachedCurrentTool = self->_cachedCurrentTool;
  self->_cachedCurrentTool = 0;

  double v5 = [(CRLFreehandDrawingToolkit *)self currentTool];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = [WeakRetained pencilKitCanvasViewControllerForFreehandDrawingTools];
  id v8 = [v7 pencilKitCanvasView];
  [v5 updatePencilKitToolIfAppropriateFor:v8];

  [(CRLFreehandDrawingToolkit *)self p_notifyObserversOfWidthChange];
}

- (void)containedToolDidSetWidth:(id)a3
{
  if (self->_cachedCurrentTool == a3) {
    [(CRLFreehandDrawingToolkit *)self p_notifyObserversOfWidthChange];
  }
}

- (void)p_notifyObserversOfWidthChange
{
  id v2 = [(NSHashTable *)self->_observers copy];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v2;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) toolkitDidUpdateCurrentToolWidth:v8];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setRulerToolShowing:(BOOL)a3
{
  if (self->_isRulerToolShowing != a3)
  {
    self->_isRulerToolShowing = a3;
    id v3 = [(NSHashTable *)self->_observers copy];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        long long v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) toolkitDidUpdateRulerVisibility:v9];
          long long v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (PKCanvasView)pkCanvasView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v3 = [WeakRetained pencilKitCanvasViewControllerForFreehandDrawingTools];
  id v4 = [v3 pencilKitCanvasView];

  return (PKCanvasView *)v4;
}

- (void)keepPencilShadowVisible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v2 = [WeakRetained pencilKitCanvasViewControllerForFreehandDrawingTools];
  id v3 = [v2 pencilKitCanvasView];
  [v3 _keepPencilShadowVisible];
}

- (void)updatePencilShadowWithInputPoint:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [WeakRetained pencilKitCanvasViewControllerForFreehandDrawingTools];
  id v6 = [v5 pencilKitCanvasView];
  long long v7 = *(_OWORD *)&a3->var9;
  v11[4] = *(_OWORD *)&a3->var7;
  v11[5] = v7;
  long long v8 = *(_OWORD *)&a3->var13;
  v11[6] = *(_OWORD *)&a3->var11;
  v11[7] = v8;
  long long v9 = *(_OWORD *)&a3->var1;
  v11[0] = a3->var0;
  v11[1] = v9;
  long long v10 = *(_OWORD *)&a3->var5;
  v11[2] = *(_OWORD *)&a3->var3;
  v11[3] = v10;
  [v6 _updatePencilShadowViewWithInputPoint:v11];
}

- (void)updatePencilShadowToScribbleMode
{
  id v6 = objc_alloc_init((Class)PKHandwritingTool);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained pencilKitCanvasViewControllerForFreehandDrawingTools];
  id v5 = [v4 pencilKitCanvasView];
  [v5 setTool:v6];
}

- (void)beginDrawingModeIfNeededForTouchType:(int64_t)a3
{
  if (![(CRLFreehandDrawingToolkit *)self canBeginFreehandDrawingMode])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC570);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109C528();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC590);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkit beginDrawingModeIfNeededForTouchType:]");
    long long v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkit.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:215 isFatal:0 description:"Should only try to begin drawing mode when it's allowed."];
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained beginDrawingModeIfNeeded];

  if (a3)
  {
    if (a3 == 1)
    {
      id v10 = objc_loadWeakRetained((id *)p_delegate);
      [v10 toolkitDidDrawWithIndirectTouch];
    }
    else
    {
      if (a3 != 2) {
        return;
      }
      id v10 = objc_loadWeakRetained((id *)p_delegate);
      [v10 toolkitDidDrawWithPencil];
    }
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    [v10 toolkitDidDrawWithFinger];
  }
}

- (void)endDrawingModeIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained endDrawingModeIfNeeded];
}

- (void)beginDrawingTransformModeIfNeeded
{
  if (![(CRLFreehandDrawingToolkit *)self isInDrawingMode])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC5B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109C5B0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC5D0);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkit beginDrawingTransformModeIfNeeded]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkit.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:232 isFatal:0 description:"Transform mode can only begin when drawing mode is already active."];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained beginDrawingTransformModeIfNeeded];
}

- (BOOL)canBeginFreehandDrawingMode
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained interactiveCanvasControllerForFreehandDrawingTools];
  if ([v4 documentIsSharedReadOnly])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    unsigned __int8 v5 = [v6 canBeginFreehandDrawingMode];
  }
  return v5;
}

- (BOOL)isInDrawingMode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v3 = [WeakRetained isInDrawingMode];

  return v3;
}

- (BOOL)isLassoSelectionForMixedTypeEnabledInDrawingMode
{
  unsigned int v3 = +[CRLFeatureFlagsHelper isOSFeatureEnabled:0];
  id v4 = [(CRLFreehandDrawingToolkit *)self currentTool];
  id v5 = [v4 type];

  if (!v3 || ![(CRLFreehandDrawingToolkit *)self isInDrawingMode] || v5 != (id)9) {
    return 0;
  }

  return [(CRLFreehandDrawingToolkit *)self isLassoAbleToSelectMixedType];
}

- (BOOL)isLassoAbleToSelectMixedType
{
  if (!+[CRLFeatureFlagsHelper isOSFeatureEnabled:0]) {
    return 0;
  }
  unsigned int v3 = [(CRLFreehandDrawingToolkit *)self toolkitUIState];
  BOOL v4 = [v3 currentLassoType] == 0;

  return v4;
}

- (BOOL)wantsToSuppressKnobsOnTransformReps
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v3 = [WeakRetained wantsToSuppressKnobsOnTransformReps];

  return v3;
}

- (unint64_t)freehandDrawingBehaviorForTouchType:(int64_t)a3 atUnscaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  unsigned int v8 = [(CRLFreehandDrawingToolkit *)self isInDrawingMode];
  unsigned int v9 = v8;
  if (a3 != 2 && !v8) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  long long v12 = [WeakRetained interactiveCanvasControllerForFreehandDrawingTools];

  if ([v12 documentIsSharedReadOnly])
  {
    unint64_t v10 = 0;
  }
  else
  {
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    long long v14 = [(char *)[v13 freehandDrawingBehaviorAtUnscaledPoint:x y:y]];

    long long v15 = [(CRLFreehandDrawingToolkit *)self currentTool];
    id v16 = [v15 type];

    if (v16 == (id)8 && (unint64_t)(v14 - 1) < 2)
    {
      unint64_t v10 = 3;
    }
    else
    {
      uint64_t v17 = 2;
      if (v9) {
        uint64_t v17 = 3;
      }
      if (v14 == (char *)2 && v16 == (id)9) {
        unint64_t v10 = v17;
      }
      else {
        unint64_t v10 = (unint64_t)v14;
      }
    }
  }

  return v10;
}

- (BOOL)currentToolAllowsDragForTouchType:(int64_t)a3 atUnscaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if (![(CRLFreehandDrawingToolkit *)self isInDrawingMode]) {
    return 1;
  }
  unsigned int v8 = [(CRLFreehandDrawingToolkit *)self currentTool];
  unsigned __int8 v9 = [v8 wantsDragForTouchType:a3 atUnscaledPoint:x, y];

  return v9;
}

- (void)enqueueAnimationForObjectUUID:(id)a3 animation:(id)a4
{
}

- (void)enqueueAnimationForObjectUUID:(id)a3 animation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  animationSerialQueue = self->_animationSerialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002FBF38;
  v15[3] = &unk_1014D39B8;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(animationSerialQueue, v15);
}

- (BOOL)wantsToAnimateForObjectUUID:(id)a3 animation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  animationSerialQueue = self->_animationSerialQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002FC0D0;
  v12[3] = &unk_1014D38F8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  long long v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(animationSerialQueue, v12);
  LOBYTE(animationSerialQueue) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)animationSerialQueue;
}

- (id)animationCompletionHandlerForObjectUUID:(id)a3 animation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  char v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_1002FC3A8;
  v22 = sub_1002FC3D4;
  id v23 = 0;
  animationSerialQueue = self->_animationSerialQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002FC3DC;
  v13[3] = &unk_1014D8120;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = self;
  id v17 = &v18;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(animationSerialQueue, v13);
  id v11 = objc_retainBlock((id)v19[5]);

  _Block_object_dispose(&v18, 8);

  return v11;
}

- (void)setUpdatedToolkitUIStateFromArchive:(id)a3
{
  objc_storeStrong((id *)&self->_toolkitUIState, a3);
  id v5 = a3;
  cachedCurrentTool = self->_cachedCurrentTool;
  self->_cachedCurrentTool = 0;

  id v10 = [(CRLFreehandDrawingToolkit *)self currentTool];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = [WeakRetained pencilKitCanvasViewControllerForFreehandDrawingTools];
  id v9 = [v8 pencilKitCanvasView];
  [v10 updatePencilKitToolIfAppropriateFor:v9];
}

- ($DFF4DC44DB28EA937F31517ED997C956)inputPointFromHoverGesture:(SEL)a3
{
  long long v5 = PKInputPointZero[5];
  *(_OWORD *)&retstr->var7 = PKInputPointZero[4];
  *(_OWORD *)&retstr->var9 = v5;
  long long v6 = PKInputPointZero[7];
  *(_OWORD *)&retstr->var11 = PKInputPointZero[6];
  *(_OWORD *)&retstr->var13 = v6;
  long long v7 = PKInputPointZero[1];
  retstr->var0 = ($B819F82C29202E081AA078F1B52C391D)PKInputPointZero[0];
  *(_OWORD *)&retstr->var1 = v7;
  long long v8 = PKInputPointZero[3];
  *(_OWORD *)&retstr->var3 = PKInputPointZero[2];
  *(_OWORD *)&retstr->var5 = v8;
  p_delegate = &self->_delegate;
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v12 = [WeakRetained pencilKitCanvasViewControllerForFreehandDrawingTools];
  id v23 = [v12 pencilKitCanvasView];

  [v10 locationInView:v23];
  retstr->var0.var0.double x = v13;
  retstr->var0.var0.double y = v14;
  [v10 zOffset];
  double v16 = v15;
  +[PKHoverSettings maxHoverHeight];
  retstr->var6 = v16 * v17;
  retstr->var7 = CACurrentMediaTime();
  [v10 altitudeAngle];
  retstr->var3 = sub_100407E48(1.57079633 - v18, 0.0, 1.57079633);
  [v10 azimuthAngleInView:v23];
  double v20 = v19;

  sub_100066410(v20 + -3.14159265);
  retstr->var2 = v21;
  retstr->var1 = 1.0;

  return result;
}

- ($DFF4DC44DB28EA937F31517ED997C956)inputPointInPKCanvasViewFromUnscaledSpace:(SEL)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  long long v8 = [WeakRetained interactiveCanvasControllerForFreehandDrawingTools];
  id v9 = [v8 canvasView];
  id v10 = [v9 unscaledCoordinateSpace];
  id v11 = objc_loadWeakRetained((id *)p_delegate);
  id v12 = [v11 pencilKitCanvasViewControllerForFreehandDrawingTools];
  CGFloat v13 = [v12 pencilKitCanvasView];
  CGFloat v14 = [v13 coordinateSpace];
  [v10 convertPoint:v14 toCoordinateSpace:a4->var0.var0.x, a4->var0.var0.y];
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  a4->var0.var0.double x = v16;
  a4->var0.var0.double y = v18;
  long long v20 = *(_OWORD *)&a4->var9;
  *(_OWORD *)&retstr->var7 = *(_OWORD *)&a4->var7;
  *(_OWORD *)&retstr->var9 = v20;
  long long v21 = *(_OWORD *)&a4->var13;
  *(_OWORD *)&retstr->var11 = *(_OWORD *)&a4->var11;
  *(_OWORD *)&retstr->var13 = v21;
  long long v22 = *(_OWORD *)&a4->var5;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&a4->var3;
  *(_OWORD *)&retstr->var5 = v22;
  long long v23 = *(_OWORD *)&a4->var1;
  retstr->var0 = a4->var0;
  *(_OWORD *)&retstr->var1 = v23;
  return result;
}

- (void)p_tearDownRunloopObserver
{
  animationSerialQueue = self->_animationSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FC7D4;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_sync(animationSerialQueue, block);
}

- (CRLFreehandDrawingToolkitUIState)toolkitUIState
{
  return self->_toolkitUIState;
}

- (CRLColor)defaultOutlineColor
{
  return self->_defaultOutlineColor;
}

- (BOOL)isRulerToolShowing
{
  return self->_isRulerToolShowing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultOutlineColor, 0);
  objc_storeStrong((id *)&self->_toolkitUIState, 0);
  objc_storeStrong((id *)&self->_animationCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_objectUUIDsToAnimate, 0);
  objc_storeStrong((id *)&self->_animationSerialQueue, 0);
  objc_storeStrong((id *)&self->_cachedCurrentTool, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)supportsPencilHoverPreview
{
  id v2 = self;
  int v3 = sub_100BE4D7C();

  return v3 != 8;
}

- (BOOL)isObjectEraser
{
  id v2 = self;
  int v3 = sub_100BE4D7C();

  return v3 == 5;
}

@end