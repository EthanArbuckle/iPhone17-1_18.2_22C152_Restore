@interface CRLBoardItemEditor
- (BOOL)anyLayoutHasUnlockedAspectRatio;
- (BOOL)canShowPreview;
- (BOOL)currentSelectionContainsInfo:(id)a3;
- (BOOL)handleSpacebar;
- (BOOL)hasPreviewableInfos;
- (BOOL)hasSinglePreviewableInfo;
- (BOOL)isSingleBoardItemSelected;
- (BOOL)p_canEditAccessibilityDescription;
- (BOOL)p_canToggleAspectRatioLock;
- (BOOL)shouldRemainOnEditorStackForSelection:(id)a3 inSelectionPath:(id)a4 withNewEditors:(id)a5;
- (CRLBoardItemEditor)initWithInteractiveCanvasController:(id)a3;
- (CRLEditorController)editorController;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (NSSet)boardItems;
- (NSSet)layouts;
- (NSSet)selectedLayoutsSupportingRotation;
- (_TtC8Freeform12CRLBoardItem)anyBoardItem;
- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator;
- (id)aspectRatioLockControlState;
- (id)boardItemsOfClass:(Class)a3;
- (id)makeSelectionSpecificMenuElements;
- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5;
- (id)p_sortedBoardItemsOfClass:(Class)a3;
- (id)permittedActionsForReasons:(unint64_t)a3;
- (id)placeholderString:(id)a3;
- (id)selectionWillChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5 inSelectionPath:(id)a6 withNewEditors:(id)a7;
- (id)sortedBoardItemsOfClass:(Class)a3;
- (int64_t)canPerformAction:(SEL)a3;
- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (void)accessibilityDescriptionEditor:(id)a3 didEndEditingWithReason:(int64_t)a4;
- (void)addContextualMenuItemsToArray:(id)a3;
- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)crlaxAddContextualMenuOptionsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)didBecomeCurrentEditorForEditorController:(id)a3;
- (void)editAccessibilityDescription:(id)a3;
- (void)enterPreviewMode;
- (void)flipHorizontally:(id)a3;
- (void)flipVertically:(id)a3;
- (void)launchEditAccessibilityDescriptionWithBoardItem:(id)a3;
- (void)openItemURL:(id)a3;
- (void)p_flipInOrientation:(int)a3;
- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5;
- (void)setAccessibilityDescription:(id)a3;
- (void)setBoardItems:(id)a3;
- (void)setEditorController:(id)a3;
- (void)toggleAspectRatioLock:(id)a3;
- (void)willResignCurrentEditor;
@end

@implementation CRLBoardItemEditor

- (CRLBoardItemEditor)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLBoardItemEditor;
  v5 = [(CRLBoardItemEditor *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
  }

  return v6;
}

- (void)setBoardItems:(id)a3
{
  objc_storeStrong((id *)&self->_boardItems, a3);
  id v6 = a3;
  cachedSortedBoardItemsByClassName = self->_cachedSortedBoardItemsByClassName;
  self->_cachedSortedBoardItemsByClassName = 0;
}

- (id)boardItemsOfClass:(Class)a3
{
  boardItems = self->_boardItems;
  if (boardItems)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10042B298;
    v6[3] = &unk_1014F91F0;
    v6[4] = a3;
    id v4 = [(NSSet *)boardItems objectsPassingTest:v6];
  }
  else
  {
    id v4 = +[NSSet set];
  }

  return v4;
}

- (id)sortedBoardItemsOfClass:(Class)a3
{
  if (!self->_cachedSortedBoardItemsByClassName)
  {
    v5 = +[NSMutableDictionary dictionary];
    cachedSortedBoardItemsByClassName = self->_cachedSortedBoardItemsByClassName;
    self->_cachedSortedBoardItemsByClassName = v5;
  }
  v7 = NSStringFromClass(a3);
  objc_super v8 = [(NSMutableDictionary *)self->_cachedSortedBoardItemsByClassName objectForKeyedSubscript:v7];
  if (!v8)
  {
    objc_super v8 = [(CRLBoardItemEditor *)self p_sortedBoardItemsOfClass:a3];
    [(NSMutableDictionary *)self->_cachedSortedBoardItemsByClassName setObject:v8 forKeyedSubscript:v7];
  }

  return v8;
}

- (id)p_sortedBoardItemsOfClass:(Class)a3
{
  v3 = [(CRLBoardItemEditor *)self boardItemsOfClass:a3];
  id v4 = [v3 allObjects];
  v5 = [v4 sortedArrayUsingComparator:&stru_1014F9230];

  return v5;
}

- (_TtC8Freeform12CRLBoardItem)anyBoardItem
{
  v3 = self;
  id v4 = [(CRLBoardItemEditor *)self sortedBoardItemsOfClass:v3];
  v5 = [v4 firstObject];

  return (_TtC8Freeform12CRLBoardItem *)v5;
}

- (BOOL)currentSelectionContainsInfo:(id)a3
{
  id v4 = a3;
  v5 = [(CRLBoardItemEditor *)self boardItems];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)isSingleBoardItemSelected
{
  v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v3 = [v2 count] == (id)1;

  return v3;
}

- (NSSet)layouts
{
  BOOL v3 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v4 = [v3 layoutController];
  v5 = [(CRLBoardItemEditor *)self boardItems];
  unsigned __int8 v6 = [v4 layoutsForInfos:v5];

  return (NSSet *)v6;
}

- (int64_t)canPerformAction:(SEL)a3
{
  return 0;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("flipHorizontally:" != a3 && "flipVertically:" != a3)
  {
    if ("toggleAspectRatioLock:" == a3)
    {
      unsigned int v21 = [(CRLBoardItemEditor *)self p_canToggleAspectRatioLock];
    }
    else if ("showPreview:" == a3)
    {
      unsigned int v21 = [(CRLBoardItemEditor *)self canShowPreview];
    }
    else
    {
      if ("editAccessibilityDescription:" != a3 && "setAccessibilityDescription:" != a3)
      {
        if ("openItemURL:" == a3)
        {
          v23 = [(CRLBoardItemEditor *)self boardItems];
          if (+[CRLURLEditor canOpenItemURLFor:v23]) {
            int64_t v19 = 1;
          }
          else {
            int64_t v19 = -1;
          }
        }
        else
        {
          int64_t v19 = 0;
        }
        goto LABEL_32;
      }
      unsigned int v21 = [(CRLBoardItemEditor *)self p_canEditAccessibilityDescription];
    }
    if (v21) {
      int64_t v19 = 1;
    }
    else {
      int64_t v19 = -1;
    }
    goto LABEL_32;
  }
  objc_super v8 = [(CRLBoardItemEditor *)self boardItems];
  id v9 = [v8 count];

  if (v9)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v10 = [(CRLBoardItemEditor *)self layouts];
    id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v25;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v14);
          uint64_t v16 = objc_opt_class();
          v17 = [v15 info];
          v18 = sub_1002469D0(v16, v17);

          if ([v15 supportsFlipping] && !objc_msgSend(v18, "locked"))
          {

            int64_t v19 = 1;
            goto LABEL_32;
          }

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
  }
  int64_t v19 = -1;
LABEL_32:

  return v19;
}

- (id)permittedActionsForReasons:(unint64_t)a3
{
  return +[NSSet crl_setWithSelectors:](NSSet, "crl_setWithSelectors:", "showPreview:", 0);
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  v2 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  BOOL v3 = [v2 editingCoordinator];

  return (_TtC8Freeform21CRLEditingCoordinator *)v3;
}

- (void)didBecomeCurrentEditorForEditorController:(id)a3
{
  BOOL v3 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v4 = [v3 layerHost];
  id v5 = [v4 asiOSCVC];

  [v5 setContextMenuMightBeDisplayed:0];
}

- (CRLEditorController)editorController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  BOOL v3 = [WeakRetained editorController];

  return (CRLEditorController *)v3;
}

- (void)setEditorController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    id v6 = [WeakRetained editorController];

    if (v6 != v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F9250);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B1A6C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F9270);
      }
      v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v7);
      }
      objc_super v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemEditor setEditorController:]");
      id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemEditor.m"];
      +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:164 isFatal:0 description:"Unexpected editor controller!"];
    }
  }
}

- (BOOL)shouldRemainOnEditorStackForSelection:(id)a3 inSelectionPath:(id)a4 withNewEditors:(id)a5
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  objc_super v8 = sub_1002469D0(v7, v6);

  id v9 = [v8 boardItems];
  if (v8)
  {
    v10 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    id v11 = [v10 canvasEditor];
    id v12 = [v11 canvasEditorHelper];
    unsigned __int8 v13 = -[CRLBoardItemEditor isMemberOfClass:](self, "isMemberOfClass:", [v12 editorClassForInfos:v9]);
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  id v6 = a3;
  if ([(CRLBoardItemEditor *)self isMemberOfClass:objc_opt_class()])
  {
    int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9290);
    }
    objc_super v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B1B00((uint64_t)v6, v7, v8);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F92B0);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemEditor nextEditorForSelection:withNewEditorStack:selectionPath:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10, v11, 192, 0, "There is a more specific selection on top of a plain board item editor! %@", v6 file lineNumber isFatal description];
  }
  return 0;
}

- (id)selectionWillChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5 inSelectionPath:(id)a6 withNewEditors:(id)a7
{
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F92D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B1BBC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F92F0);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemEditor selectionWillChangeFromSelection:toSelection:withFlags:inSelectionPath:withNewEditors:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:198 isFatal:0 description:"Board item editor expects a board item selection!"];
  }
  return 0;
}

- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5
{
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  v37 = v6;
  objc_super v8 = sub_1002469D0(v7, v6);
  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9310);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B1C50();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9330);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemEditor selectionDidChangeFromSelection:toSelection:withFlags:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 204, 0, "invalid nil value for '%{public}s'", "boardItemSelection");
  }
  id v12 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  unsigned __int8 v13 = [v12 layerHost];
  v14 = [v13 asiOSCVC];

  v34 = v14;
  [v14 setContextMenuMightBeDisplayed:0];
  v36 = self;
  v15 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  uint64_t v16 = [v15 editingCoordinator];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v35 = v8;
  v17 = [v8 boardItems];
  id v18 = [v17 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v39;
    do
    {
      unsigned int v21 = 0;
      do
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v21);
        v23 = [v16 mainBoard];
        long long v24 = [v22 id];
        unsigned __int8 v25 = [v23 containsObject:v24];

        if ((v25 & 1) == 0)
        {
          unsigned int v26 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F9350);
          }
          long long v27 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v43 = v26;
            __int16 v44 = 2082;
            v45 = "-[CRLBoardItemEditor selectionDidChangeFromSelection:toSelection:withFlags:]";
            __int16 v46 = 2082;
            v47 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemEditor.m";
            __int16 v48 = 1024;
            int v49 = 226;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Selecting an object that isn't in the document!", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F9370);
          }
          v28 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v31 = v28;
            v32 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v43 = v26;
            __int16 v44 = 2114;
            v45 = v32;
            _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemEditor selectionDidChangeFromSelection:toSelection:withFlags:]");
          v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemEditor.m"];
          +[CRLAssertionHandler handleFailureInFunction:v29 file:v30 lineNumber:226 isFatal:0 description:"Selecting an object that isn't in the document!"];
        }
        unsigned int v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [v17 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v19);
  }

  v33 = [v35 boardItems];
  [(CRLBoardItemEditor *)v36 setBoardItems:v33];
}

- (NSSet)selectedLayoutsSupportingRotation
{
  v2 = [(CRLBoardItemEditor *)self layouts];
  BOOL v3 = [v2 objectsPassingTest:&stru_1014F93B0];

  return (NSSet *)v3;
}

- (BOOL)p_canToggleAspectRatioLock
{
  v2 = [(CRLBoardItemEditor *)self layouts];
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [v2 count] != 0;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "canAspectRatioLockBeChangedByUser", (void)v10))
        {
          BOOL v3 = 0;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)anyLayoutHasUnlockedAspectRatio
{
  [(CRLBoardItemEditor *)self layouts];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
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
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "resizeMayChangeAspectRatio", (void)v7))
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

- (void)toggleAspectRatioLock:(id)a3
{
  uint64_t v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v5 = [v4 commandController];
  id v6 = [(CRLBoardItemEditor *)self layouts];
  long long v7 = [CRLCanvasCommandSelectionBehavior alloc];
  long long v8 = [v4 canvasEditor];
  long long v9 = [(CRLCanvasCommandSelectionBehavior *)v7 initWithCanvasEditor:v8 type:2];

  [v5 openGroupWithSelectionBehavior:v9];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  long long v12 = v10;
  if (!v11) {
    goto LABEL_12;
  }
  id v13 = v11;
  char v14 = 0;
  uint64_t v15 = *(void *)v20;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v20 != v15) {
        objc_enumerationMutation(v10);
      }
      v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) commandForSettingAspectRatioLocked:[self anyLayoutHasUnlockedAspectRatio]];
      if (v17)
      {
        [v5 enqueueCommand:v17];
        char v14 = 1;
      }
    }
    id v13 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v13);

  if (v14)
  {
    long long v12 = +[NSBundle mainBundle];
    id v18 = [v12 localizedStringForKey:@"Constrain Proportions Setting" value:0 table:0];
    [v5 setCurrentGroupActionString:v18];

LABEL_12:
  }
  [v5 closeGroup];
}

- (void)willResignCurrentEditor
{
  id v2 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v3 = [v2 layerHost];
  id v14 = [v3 asiOSCVC];

  [v14 setContextMenuMightBeDisplayed:0];
  LODWORD(v3) = +[CRLFeatureFlagsHelper isOSFeatureEnabled:0];
  uint64_t v4 = objc_opt_class();
  id v5 = [v14 delegate];
  id v6 = [v5 currentDocumentMode];
  long long v7 = sub_1002469D0(v4, v6);

  if (v3 && v7) {
    [v7 hideEditMenuForLassoSelection];
  }
  uint64_t v8 = objc_opt_class();
  long long v9 = [v14 presentedViewController];
  id v10 = sub_1002469D0(v8, v9);

  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    long long v12 = [v10 topViewController];
    id v13 = sub_1002469D0(v11, v12);

    if (v13) {
      [v13 setIsCancelled:1];
    }
  }
}

- (BOOL)canShowPreview
{
  return [(CRLBoardItemEditor *)self hasSinglePreviewableInfo];
}

- (void)openItemURL:(id)a3
{
  uint64_t v4 = objc_opt_class();
  id v5 = [(CRLBoardItemEditor *)self boardItems];
  id v6 = [v5 anyObject];
  sub_1002469D0(v4, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  long long v7 = v8;
  if (v8)
  {
    +[CRLURLEditor openItemURLFor:v8];
    long long v7 = v8;
  }
}

- (BOOL)p_canEditAccessibilityDescription
{
  id v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v3 = [v2 count] == (id)1;

  return v3;
}

- (void)editAccessibilityDescription:(id)a3
{
  uint64_t v4 = [(CRLBoardItemEditor *)self boardItems];
  id v5 = [v4 anyObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    dispatch_time_t v6 = dispatch_time(0, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10042CE30;
    v7[3] = &unk_1014CBE78;
    v7[4] = self;
    id v8 = v5;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
  }
  else
  {
    [(CRLBoardItemEditor *)self launchEditAccessibilityDescriptionWithBoardItem:v5];
  }
}

- (void)setAccessibilityDescription:(id)a3
{
  id v18 = a3;
  uint64_t v4 = [(CRLBoardItemEditor *)self boardItems];
  id v5 = [v4 count];

  dispatch_time_t v6 = v18;
  if (v5 == (id)1)
  {
    long long v7 = [(CRLBoardItemEditor *)self anyBoardItem];
    id v8 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    long long v9 = [v8 commandController];

    if (v7)
    {
      id v10 = [v9 board];
      uint64_t v11 = [v7 id];
      long long v12 = [v10 getBoardItemForUUID:v11];

      if (v12)
      {
        id v13 = [v7 accessibilityDescription];
        unsigned __int8 v14 = [v18 isEqualToString:v13];

        if ((v14 & 1) == 0)
        {
          [v9 openGroup];
          uint64_t v15 = [[_TtC8Freeform37CRLCommandSetAccessibilityDescription alloc] initWithBoardItem:v7 accessibilityDescription:v18];
          [v9 enqueueCommand:v15];
          uint64_t v16 = +[NSBundle mainBundle];
          v17 = [v16 localizedStringForKey:@"Add Accessibility Description" value:0 table:0];
          [v9 setCurrentGroupActionString:v17];

          [v9 closeGroup];
        }
      }
    }

    dispatch_time_t v6 = v18;
  }
}

- (void)flipHorizontally:(id)a3
{
}

- (void)flipVertically:(id)a3
{
}

- (void)p_flipInOrientation:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  dispatch_time_t v6 = [v5 commandController];

  [v6 openGroup];
  if (v3 == 1)
  {
    long long v7 = +[NSBundle mainBundle];
    id v8 = v7;
    CFStringRef v9 = @"Flip Vertically";
    goto LABEL_5;
  }
  if (!v3)
  {
    long long v7 = +[NSBundle mainBundle];
    id v8 = v7;
    CFStringRef v9 = @"Flip Horizontally";
LABEL_5:
    id v10 = [v7 localizedStringForKey:v9 value:0 table:@"UndoStrings"];

    goto LABEL_7;
  }
  id v10 = 0;
LABEL_7:
  [v6 setCurrentGroupActionString:v10];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [(CRLBoardItemEditor *)self boardItems];
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v15);
        v17 = [(CRLBoardItemEditor *)self interactiveCanvasController];
        id v18 = [v17 layoutForInfo:v16];

        if ([v18 supportsFlipping])
        {
          long long v19 = [v18 commandToFlipWithOrientation:v3];
          [v6 enqueueCommand:v19];
        }
        uint64_t v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  [v6 closeGroup];
}

- (id)makeSelectionSpecificMenuElements
{
  return +[NSMutableArray array];
}

- (void)crlaxAddContextualMenuOptionsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = +[NSMutableArray array];
  -[CRLBoardItemEditor addContextualMenuElementsToArray:atPoint:](self, "addContextualMenuElementsToArray:atPoint:", v8, x, y);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v8;
  id v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v28;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v11 = [v10 crlaxValueForKey:@"children"];
        if ([v11 count])
        {
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v12 = v11;
          id v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (!v13) {
            goto LABEL_22;
          }
          uint64_t v14 = *(void *)v24;
          while (1)
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(v12);
              }
              uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
              v17 = [v16 title];
              if ([v17 length])
              {
                BOOL v18 = [v16 state] == (id)1;

                if (!v18) {
                  continue;
                }
                v17 = [v16 title];
                [v7 addObject:v17];
              }
            }
            id v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (!v13)
            {
LABEL_22:

              goto LABEL_23;
            }
          }
        }
        id v12 = [v10 title];
        if (![v12 length]) {
          goto LABEL_22;
        }
        BOOL v19 = [v10 state] == (id)1;

        if (v19)
        {
          id v12 = [v10 title];
          [v7 addObject:v12];
          goto LABEL_22;
        }
LABEL_23:
      }
      id v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v22);
  }
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  id v10 = a3;
  id v5 = [v10 count];
  if ([(CRLBoardItemEditor *)self p_canEditAccessibilityDescription])
  {
    dispatch_time_t v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"Description" value:0 table:0];
    id v8 = +[CRLImage crl_quickInspectorImageNamed:@"figure.walk.circle"];
    CFStringRef v9 = +[CRLQuickInspectorElement elementWithName:v7 image:v8 type:1 options:0x40000 action:"editAccessibilityDescription:" parent:0 children:0];

    [v10 insertObject:v9 atIndex:v5];
  }
}

- (void)addContextualMenuItemsToArray:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  unsigned int v5 = [v4 documentIsSharedReadOnly];

  if (v5)
  {
    id v6 = objc_alloc((Class)UIMenuItem);
    id v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"Preview" value:0 table:0];
    id v9 = [v6 initWithTitle:v8 action:"showPreview:"];
    [v10 addObject:v9];
  }
}

- (id)aspectRatioLockControlState
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = [(CRLBoardItemEditor *)self layouts];
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    char v5 = 0;
    char v6 = 0;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v2);
        }
        unsigned __int8 v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) resizeMayChangeAspectRatio];
        v5 |= v9 ^ 1;
        v6 |= v9;
        if (v5 & 1) != 0 && (v6)
        {

          uint64_t v10 = 2;
          goto LABEL_15;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }

    if (v5)
    {
      uint64_t v10 = 1;
      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v10 = 0;
LABEL_15:
  uint64_t v11 = +[CRLPlatformControlState stateWithValue:v10];

  return v11;
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (NSSet)boardItems
{
  return self->_boardItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boardItems, 0);
  objc_destroyWeak((id *)&self->_interactiveCanvasController);

  objc_storeStrong((id *)&self->_cachedSortedBoardItemsByClassName, 0);
}

- (void)enterPreviewMode
{
  id v2 = self;
  sub_1006090DC();
}

- (BOOL)hasSinglePreviewableInfo
{
  id v2 = self;
  unsigned __int8 v3 = sub_100609280();

  return v3 & 1;
}

- (BOOL)hasPreviewableInfos
{
  id v2 = self;
  unsigned __int8 v3 = [(CRLBoardItemEditor *)v2 boardItems];
  type metadata accessor for CRLBoardItem(0);
  sub_10060A334();
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  char v5 = v2;
  sub_100609E90(v4, v5);
  LOBYTE(v3) = v6;
  swift_bridgeObjectRelease();

  return v3 & 1;
}

- (void)accessibilityDescriptionEditor:(id)a3 didEndEditingWithReason:(int64_t)a4
{
  if (!a4)
  {
    swift_unknownObjectRetain();
    uint64_t v7 = self;
    id v8 = [a3 accessibilityDescriptionToSubmit];
    if (!v8)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v9 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v8 = v9;
    }
    id v10 = v8;
    -[CRLBoardItemEditor setAccessibilityDescription:](v7, "setAccessibilityDescription:");
    swift_unknownObjectRelease();
  }
}

- (void)launchEditAccessibilityDescriptionWithBoardItem:(id)a3
{
  id v5 = a3;
  char v6 = self;
  sub_100609560(a3);
}

- (id)placeholderString:(id)a3
{
  uint64_t v4 = a3;
  id v5 = self;
  sub_10060A1C4(v4);

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v6;
}

- (BOOL)handleSpacebar
{
  id v2 = self;
  if ([(CRLBoardItemEditor *)v2 canShowPreview]) {
    [(CRLBoardItemEditor *)v2 showPreview:v2];
  }
  unsigned __int8 v3 = [(CRLBoardItemEditor *)v2 canShowPreview];

  return v3;
}

@end