@interface CRLGroupEditor
- (BOOL)canPasteIntoCurrentlySelectedGroups;
- (BOOL)canPasteWithPasteboard:(id)a3;
- (BOOL)canPasteWithPasteboard:(id)a3 sender:(id)a4;
- (BOOL)p_canDuplicateWithSender:(id)a3;
- (BOOL)p_currentlyEditingInGroup;
- (BOOL)p_shouldAllowKeyCommands;
- (NSSet)groupItems;
- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5;
- (id)pasteNativeInfosFromPasteboard:(id)a3;
- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (int64_t)editorResponseForCanPasteContentsOfItemSource:(id)a3;
- (void)duplicate:(id)a3;
- (void)insertNewline:(id)a3;
- (void)p_pasteBoardItems:(id)a3 inGroup:(id)a4 atIndex:(unint64_t)a5 forceMatchStyle:(BOOL)a6 isCrossDocument:(BOOL)a7;
- (void)paste:(id)a3;
- (void)pasteAsPlainText:(id)a3;
- (void)pasteValues:(id)a3;
- (void)pasteWithPasteboard:(id)a3 atIndex:(unint64_t)a4 completionHandler:(id)a5;
- (void)pasteWithPasteboard:(id)a3 atIndex:(unint64_t)a4 forceMatchStyle:(BOOL)a5 bakeFormulas:(BOOL)a6 completionHandler:(id)a7;
- (void)pasteWithPasteboard:(id)a3 completionHandler:(id)a4;
- (void)pasteWithPasteboard:(id)a3 sender:(id)a4;
- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5;
@end

@implementation CRLGroupEditor

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  v12 = sub_1002469D0(v11, v8);
  if (v12)
  {
    v13 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    v14 = [v13 canvasEditor];
    v15 = [v14 canvasEditorHelper];
    v16 = [v12 boardItems];
    v17 = (objc_class *)[v15 editorClassForInfos:v16];

    if (v17)
    {
      if ([(objc_class *)v17 isSubclassOfClass:objc_opt_class()])
      {
        id v18 = [v17 alloc];
        v19 = [(CRLBoardItemEditor *)self interactiveCanvasController];
        id v20 = [v18 initWithInteractiveCanvasController:v19];

        v21 = [v12 boardItems];
        [v20 setBoardItems:v21];

        goto LABEL_16;
      }
      int v22 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FFCE0);
      }
      v23 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BC95C((uint64_t)v8, v22, v23);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FFD00);
      }
      v24 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v24);
      }
      v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupEditor nextEditorForSelection:withNewEditorStack:selectionPath:]");
      v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupEditor.m"];
      +[CRLAssertionHandler handleFailureInFunction:v25, v26, 46, 0, "Unknown editor class for selection %@", v8 file lineNumber isFatal description];
    }
    id v20 = 0;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)CRLGroupEditor;
    id v20 = [(CRLBoardItemEditor *)&v28 nextEditorForSelection:v8 withNewEditorStack:v9 selectionPath:v10];
  }
LABEL_16:

  return v20;
}

- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRLGroupEditor;
  id v9 = a4;
  [(CRLBoardItemEditor *)&v16 selectionDidChangeFromSelection:v8 toSelection:v9 withFlags:a5];
  objc_opt_class();
  LOBYTE(a5) = objc_opt_isKindOfClass();

  if (a5 & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v10 = [(CRLGroupEditor *)self groupItems];
    uint64_t v11 = [v10 anyObject];

    uint64_t v12 = objc_opt_class();
    v13 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    v14 = [v13 repForInfo:v11];
    v15 = sub_1002469D0(v12, v14);

    [v15 invalidateKnobs];
  }
}

- (NSSet)groupItems
{
  uint64_t v3 = objc_opt_class();

  return (NSSet *)[(CRLBoardItemEditor *)self boardItemsOfClass:v3];
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(CRLGroupEditor *)self p_currentlyEditingInGroup];
  id v8 = +[NSSet crl_setWithSelectors:](NSSet, "crl_setWithSelectors:", "group:", 0);
  uint64_t v9 = objc_opt_class();
  id v10 = [(CRLBoardItemEditor *)self editorController];
  uint64_t v11 = [v10 selectionForEditor:self];
  uint64_t v12 = sub_1002469D0(v9, v11);

  if (v12)
  {
    if ([v12 isCrossContainerSelection])
    {
      v13 = NSStringFromSelector(a3);
      unsigned __int8 v14 = [v8 containsObject:v13];

      if (v14)
      {
        int64_t v15 = -1;
        goto LABEL_31;
      }
    }
  }
  if ("insertNewline:" == a3)
  {
    if (v7) {
      goto LABEL_26;
    }
    v17 = [(CRLBoardItemEditor *)self boardItems];
    if ([v17 count] == (id)1) {
      int64_t v15 = 1;
    }
    else {
      int64_t v15 = -1;
    }
  }
  else
  {
    if ("paste:" != a3 && "pasteAsPlainText:" != a3 && "pasteValues:" != a3)
    {
      if ("duplicate:" == a3) {
        unsigned int v16 = v7;
      }
      else {
        unsigned int v16 = 0;
      }
      if (v16 == 1
        && [(CRLGroupEditor *)self canPasteIntoCurrentlySelectedGroups])
      {
        if ([(CRLGroupEditor *)self p_canDuplicateWithSender:v6]) {
          int64_t v15 = 1;
        }
        else {
          int64_t v15 = -1;
        }
        goto LABEL_31;
      }
LABEL_26:
      v25.receiver = self;
      v25.super_class = (Class)CRLGroupEditor;
      int64_t v15 = [(CRLBoardItemEditor *)&v25 canPerformEditorAction:a3 withSender:v6];
      goto LABEL_31;
    }
    id v18 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    v19 = [v18 canvasEditor];
    id v20 = [v19 pasteboardController];

    v21 = +[CRLPasteboard generalPasteboard];
    int v22 = [v20 ingestibleItemSourceForPasteboard:v21];

    int64_t v23 = [(CRLGroupEditor *)self editorResponseForCanPasteContentsOfItemSource:v22];
    if (v23 != 1)
    {
      int64_t v15 = v23;

      if (v15) {
        goto LABEL_31;
      }
      goto LABEL_26;
    }
    if ([(CRLGroupEditor *)self p_shouldAllowKeyCommands])
    {
      int64_t v15 = 1;
    }
    else if (+[CRLCanvasEditor physicalKeyboardIsSender:v6])
    {
      int64_t v15 = -1;
    }
    else
    {
      int64_t v15 = 1;
    }
  }
LABEL_31:

  return v15;
}

- (BOOL)canPasteWithPasteboard:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CRLGroupEditor *)self p_shouldAllowKeyCommands]
    || !+[CRLCanvasEditor physicalKeyboardIsSender:v7])
  {
    BOOL v8 = [(CRLGroupEditor *)self canPasteWithPasteboard:v6];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)pasteWithPasteboard:(id)a3 sender:(id)a4
{
}

- (BOOL)p_currentlyEditingInGroup
{
  uint64_t v3 = [(CRLBoardItemEditor *)self editorController];
  v4 = [(id)v3 selectionForEditor:self];

  objc_opt_class();
  LOBYTE(v3) = objc_opt_isKindOfClass();

  return v3 & 1;
}

- (void)insertNewline:(id)a3
{
  v4 = [(CRLGroupEditor *)self groupItems];
  id v21 = [v4 anyObject];

  v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v6 = [v5 canvasEditor];

  id v7 = [v21 childItems];
  BOOL v8 = +[CRLCanvasEditor spatialInfoComparator];
  uint64_t v9 = [v7 sortedArrayUsingComparator:v8];
  id v10 = [v9 firstObject];
  v17 = sub_100246AC8(v10, 1, v11, v12, v13, v14, v15, v16, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);

  if (v17)
  {
    id v18 = +[NSSet setWithObject:v17];
  }
  else
  {
    id v18 = 0;
  }
  v19 = [v6 selectionPathWithInfos:v18];
  id v20 = [(CRLBoardItemEditor *)self editorController];
  [v20 setSelectionPath:v19];
}

- (BOOL)p_shouldAllowKeyCommands
{
  v2 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  unsigned __int8 v3 = [v2 shouldAllowKeyCommands];

  return v3;
}

- (BOOL)canPasteIntoCurrentlySelectedGroups
{
  return 1;
}

- (int64_t)editorResponseForCanPasteContentsOfItemSource:(id)a3
{
  id v4 = a3;
  if ([(CRLGroupEditor *)self p_currentlyEditingInGroup]
    && [(CRLGroupEditor *)self canPasteIntoCurrentlySelectedGroups])
  {
    v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    id v6 = [v5 selectionModelTranslator];
    id v7 = [(CRLBoardItemEditor *)self editorController];
    BOOL v8 = [v7 selectionPath];
    uint64_t v9 = [v6 containerToInsertIntoForSelectionPath:v8];

    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if ([v4 canProduceBoardItems]) {
        int64_t v10 = 1;
      }
      else {
        int64_t v10 = -1;
      }
    }
    else
    {
      int64_t v10 = 0;
    }
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (BOOL)p_canDuplicateWithSender:(id)a3
{
  id v4 = a3;
  v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v6 = [v5 canvasEditor];

  id v7 = [v6 canvasEditorHelper];
  id v8 = [v7 canvasEditorCanPerformDuplicateAction:"duplicate:" withSender:v4];

  return v8 != 0;
}

- (BOOL)canPasteWithPasteboard:(id)a3
{
  id v4 = a3;
  v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v6 = [v5 canvasEditor];
  id v7 = [v6 pasteboardController];

  id v8 = [v7 ingestibleItemSourceForPasteboard:v4];

  LOBYTE(self) = (id)[(CRLGroupEditor *)self editorResponseForCanPasteContentsOfItemSource:v8] == (id)1;
  return (char)self;
}

- (void)paste:(id)a3
{
  id v4 = +[CRLPasteboard generalPasteboard];
  [(CRLGroupEditor *)self pasteWithPasteboard:v4 completionHandler:&stru_1014FFD40];

  id v6 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  v5 = [v6 canvasEditor];
  [v5 hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected];
}

- (void)pasteAsPlainText:(id)a3
{
  id v4 = +[CRLPasteboard generalPasteboard];
  [(CRLGroupEditor *)self pasteWithPasteboard:v4 atIndex:0x7FFFFFFFFFFFFFFFLL forceMatchStyle:1 bakeFormulas:0 completionHandler:&stru_1014FFD60];
}

- (void)pasteValues:(id)a3
{
  id v4 = +[CRLPasteboard generalPasteboard];
  [(CRLGroupEditor *)self pasteWithPasteboard:v4 atIndex:0x7FFFFFFFFFFFFFFFLL forceMatchStyle:1 bakeFormulas:1 completionHandler:&stru_1014FFD80];
}

- (void)pasteWithPasteboard:(id)a3 completionHandler:(id)a4
{
}

- (void)pasteWithPasteboard:(id)a3 atIndex:(unint64_t)a4 completionHandler:(id)a5
{
}

- (void)pasteWithPasteboard:(id)a3 atIndex:(unint64_t)a4 forceMatchStyle:(BOOL)a5 bakeFormulas:(BOOL)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  uint64_t v13 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  uint64_t v14 = [v13 editingCoordinator];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1004CDAA8;
  v17[3] = &unk_1014FFE10;
  v17[4] = self;
  id v18 = v11;
  BOOL v21 = a5;
  id v19 = v12;
  unint64_t v20 = a4;
  id v15 = v12;
  id v16 = v11;
  [v14 canPerformUserActionUsingBlock:v17];
}

- (void)p_pasteBoardItems:(id)a3 inGroup:(id)a4 atIndex:(unint64_t)a5 forceMatchStyle:(BOOL)a6 isCrossDocument:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = +[CRLInsertionContext nonInteractiveInsertionContext];
  uint64_t v14 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v15 = [v14 commandController];

  id v16 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  v17 = [v16 canvasEditor];

  id v18 = [v17 canvasEditorHelper];
  unsigned int v19 = [v18 canInsertBoardItems:v11 intoGroup:v12];

  if (v19)
  {
    unint64_t v34 = a5;
    unint64_t v20 = [v17 canvasEditorHelper];
    BOOL v21 = [(CRLBoardItemEditor *)self editorController];
    int v22 = [v21 selectionPath];
    id v35 = 0;
    int64_t v23 = [v20 commandForReplacingImagePlaceholderInSelection:v22 withBoardItems:v11 isCrossDocument:v7 withSender:0 outSelectionBehavior:&v35];
    id v24 = v35;

    if (v23)
    {
      [v15 enqueueCommand:v23 withSelectionBehavior:v24];
    }
    else if (v12)
    {
      if (v34 == 0x7FFFFFFFFFFFFFFFLL
        || ([v12 childInfos],
            objc_super v25 = objc_claimAutoreleasedReturnValue(),
            id v26 = [v25 count],
            v25,
            id v27 = (id)v34,
            (unint64_t)v26 < v34))
      {
        objc_super v28 = [v12 childInfos];
        id v29 = [v28 count];

        id v27 = v29;
      }
      v30 = [[_TtC8Freeform26CRLCommandInsertBoardItems alloc] initWithParentContainer:v12 boardItems:v11 index:v27];
      v31 = [CRLCanvasCommandSelectionBehavior alloc];
      v32 = +[NSSet setWithArray:v11];
      v33 = [(CRLCanvasCommandSelectionBehavior *)v31 initWithCanvasEditor:v17 type:0 constructedInfos:v32];

      [v15 enqueueCommand:v30 withSelectionBehavior:v33];
    }
    else
    {
      [v17 insertBoardItems:v11 withInsertionContext:v13 postProcessBlock:&stru_1014FFE30];
    }
  }
  else
  {
    [v17 prepareGeometryForInsertingBoardItems:v11 withInsertionContext:v13];
    [v17 insertBoardItems:v11 withInsertionContext:v13 postProcessBlock:&stru_1014FFE50];
  }
}

- (id)pasteNativeInfosFromPasteboard:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  id v6 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  BOOL v7 = [v6 selectionModelTranslator];
  id v8 = [(CRLBoardItemEditor *)self editorController];
  uint64_t v9 = [v8 selectionPath];
  int64_t v10 = [v7 containerToInsertIntoForSelectionPath:v9];

  uint64_t v11 = objc_opt_class();
  uint64_t v12 = sub_1002469D0(v11, v10);
  uint64_t v13 = (void *)v12;
  if (v12)
  {
    v38 = self;
    v40 = (void *)v12;
    v41 = v10;
    uint64_t v14 = [v6 canvasEditor];
    id v15 = [v14 pasteboardController];

    v39 = v15;
    id v42 = v4;
    id v16 = [v15 providersForBoardItemsFromPasteboard:v4];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v17 = [v16 countByEnumeratingWithState:&v43 objects:v57 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v44;
      do
      {
        unint64_t v20 = v16;
        BOOL v21 = 0;
        do
        {
          if (*(void *)v44 != v19) {
            objc_enumerationMutation(v20);
          }
          int v22 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v21);
          int64_t v23 = [v6 editingCoordinator];
          id v24 = [v23 boardItemFactory];
          id v25 = [v22 newBoardItemWithFactory:v24 bakedSize:0];

          if (v25)
          {
            [v5 addObject:v25];
          }
          else
          {
            unsigned int v26 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014FFEB0);
            }
            id v27 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              unsigned int v48 = v26;
              __int16 v49 = 2082;
              v50 = "-[CRLGroupEditor pasteNativeInfosFromPasteboard:]";
              __int16 v51 = 2082;
              v52 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupEditor.m";
              __int16 v53 = 1024;
              int v54 = 361;
              __int16 v55 = 2082;
              v56 = "boardItem";
              _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014FFED0);
            }
            objc_super v28 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v31 = v28;
              v32 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v48 = v26;
              __int16 v49 = 2114;
              v50 = v32;
              _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            id v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupEditor pasteNativeInfosFromPasteboard:]");
            v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupEditor.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 361, 0, "invalid nil value for '%{public}s'", "boardItem");
          }
          BOOL v21 = (char *)v21 + 1;
        }
        while (v18 != v21);
        id v16 = v20;
        id v18 = [v20 countByEnumeratingWithState:&v43 objects:v57 count:16];
      }
      while (v18);
    }
    if ([v5 count])
    {
      v33 = [v6 canvasEditor];
      unint64_t v34 = [v33 canvasEditorHelper];
      id v4 = v42;
      uint64_t v13 = v40;
      [v34 prepareGeometryForPastingBoardItems:v5 fromPasteboard:v42 intoContainer:v40 useOriginalPositions:1];

      [(CRLGroupEditor *)v38 p_pasteBoardItems:v5 inGroup:v40 atIndex:0x7FFFFFFFFFFFFFFFLL forceMatchStyle:0 isCrossDocument:0];
      int64_t v10 = v41;
    }
    else
    {
      int64_t v10 = v41;
      id v4 = v42;
      uint64_t v13 = v40;
    }
    v36 = v39;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FFE70);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BCAC8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FFE90);
    }
    id v35 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v35);
    }
    v36 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupEditor pasteNativeInfosFromPasteboard:]");
    id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v36, v16, 355, 0, "invalid nil value for '%{public}s'", "groupToInsertInto");
  }

  return v5;
}

- (void)duplicate:(id)a3
{
  id v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  v5 = [v4 editingCoordinator];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1004CED60;
  v6[3] = &unk_1014CE260;
  v6[4] = self;
  [v5 canPerformUserActionUsingBlock:v6];
}

@end