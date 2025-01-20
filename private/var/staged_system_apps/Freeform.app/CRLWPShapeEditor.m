@interface CRLWPShapeEditor
- (BOOL)p_canSaveDefaultInsertionPreset;
- (BOOL)p_shapesAreDifferent;
- (BOOL)shouldAddAutosizeTextMenuItem;
- (CRLPlatformControlState)shrinkToFitControlState;
- (NSArray)wpEditors;
- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5;
- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)alignCenter:(id)a3;
- (void)alignJustified:(id)a3;
- (void)alignLeft:(id)a3;
- (void)alignRight:(id)a3;
- (void)decreaseFontSizeByOne:(id)a3;
- (void)decreaseSize:(id)a3;
- (void)increaseFontSizeByOne:(id)a3;
- (void)increaseSize:(id)a3;
- (void)saveDefaultInsertionPreset:(id)a3;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleShrinkToFit:(id)a3;
- (void)toggleStrikethrough:(id)a3;
- (void)toggleUnderline:(id)a3;
@end

@implementation CRLWPShapeEditor

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    v24 = [v11 selectionModelTranslator];

    v12 = [v24 infosForSelectionPath:v10];
    v13 = (objc_class *)objc_opt_class();
    v14 = [v12 crl_onlyObject];
    v15 = sub_10024715C(v13, v14);

    v16 = (objc_class *)objc_opt_class();
    v17 = [v15 parentInfo];
    v18 = sub_10024715C(v16, v17);

    v19 = [_TtC8Freeform11CRLWPEditor alloc];
    v20 = [(CRLBoardItemEditor *)self editingCoordinator];
    v21 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    v22 = [(CRLWPEditor *)v19 initWithEditingCoordinator:v20 enclosingShape:v18 icc:v21];
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)CRLWPShapeEditor;
    v22 = [(CRLShapeEditor *)&v25 nextEditorForSelection:v8 withNewEditorStack:v9 selectionPath:v10];
  }

  return v22;
}

- (NSArray)wpEditors
{
  id v20 = (id)objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = self;
  v4 = [(CRLBoardItemEditor *)self sortedBoardItemsOfClass:v3];

  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = objc_opt_class();
        v11 = sub_1002469D0(v10, v9);
        if (v11)
        {
          v12 = [_TtC8Freeform11CRLWPEditor alloc];
          v13 = [(CRLBoardItemEditor *)self editingCoordinator];
          v14 = [(CRLBoardItemEditor *)self interactiveCanvasController];
          v15 = [(CRLWPEditor *)v12 initWithEditingCoordinator:v13 enclosingShape:v11 icc:v14];

          if (v15)
          {
            v16 = [(CRLWPEditor *)v15 storage];
            v17 = +[CRLTextRange textRangeForAllOf:v16];
            v18 = [(CRLWPEditor *)v15 textSelectionDelegate];
            [v18 setSelectedTextRange:v17];

            [v20 addObject:v15];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  return (NSArray *)v20;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("saveDefaultInsertionPreset:" == a3)
  {
    unsigned int v10 = [(CRLWPShapeEditor *)self p_canSaveDefaultInsertionPreset];
    goto LABEL_32;
  }
  if ("alignTop:" == a3 || "alignBottom:" == a3 || "alignMiddle:" == a3 || "alignJustify:" == a3)
  {
    unsigned int v10 = [(CRLShapeEditor *)self anyInfoSupportsVerticalAlignment];
    goto LABEL_32;
  }
  if ("toggleBoldface:" == a3
    || "toggleUnderline:" == a3
    || "toggleItalics:" == a3
    || "toggleStrikethrough:" == a3
    || "alignLeft:" == a3
    || "alignRight:" == a3
    || "alignCenter:" == a3
    || "alignJustified:" == a3
    || "decreaseFontSizeByOne:" == a3
    || "increaseFontSizeByOne:" == a3
    || "decreaseSize:" == a3
    || "increaseSize:" == a3)
  {
    unsigned int v10 = [(CRLShapeEditor *)self anyInfoSupportsTextInspection];
LABEL_32:
    if (v10) {
      int64_t v11 = 1;
    }
    else {
      int64_t v11 = -1;
    }
    goto LABEL_35;
  }
  if ("toggleShrinkToFit:" == a3
    && [(CRLShapeEditor *)self anyInfoSupportsTextInspection]
    && [(CRLWPShapeEditor *)self shouldAddAutosizeTextMenuItem])
  {
    int64_t v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLWPShapeEditor;
    int64_t v11 = [(CRLShapeEditor *)&v13 canPerformEditorAction:a3 withSender:v6];
  }
LABEL_35:

  return v11;
}

- (BOOL)p_shapesAreDifferent
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v3 = self;
  v4 = [(CRLBoardItemEditor *)self sortedBoardItemsOfClass:v3];

  id obj = v4;
  id v29 = [v4 countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v29)
  {
    char v5 = 0;
    unsigned int v6 = 0;
    unsigned int v7 = 0;
    unsigned int v8 = 0;
    uint64_t v28 = *(void *)v31;
    while (2)
    {
      id v9 = 0;
      unsigned int v10 = v6;
      unsigned int v11 = v7;
      unsigned int v12 = v8;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(obj);
        }
        objc_super v13 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v9);
        uint64_t v14 = objc_opt_class();
        v15 = sub_1002469D0(v14, v13);
        if (!v15)
        {
          unsigned int v16 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FE110);
          }
          v17 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v35 = v16;
            __int16 v36 = 2082;
            v37 = "-[CRLWPShapeEditor p_shapesAreDifferent]";
            __int16 v38 = 2082;
            v39 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeEditor.m";
            __int16 v40 = 1024;
            int v41 = 93;
            __int16 v42 = 2082;
            v43 = "shapeItem";
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FE130);
          }
          v18 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            long long v23 = v18;
            long long v24 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v35 = v16;
            __int16 v36 = 2114;
            v37 = v24;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeEditor p_shapesAreDifferent]");
          id v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeEditor.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 93, 0, "invalid nil value for '%{public}s'", "shapeItem");
        }
        long long v21 = +[NSSet setWithObject:v15];
        unsigned int v8 = +[CRLShapeEditor infosAreLines:v21];
        unsigned int v7 = +[CRLShapeEditor infosAreStickyNotes:v21];
        unsigned int v22 = [v15 isAutogrowingTextBox];
        unsigned int v6 = v22;
        if (v5 & 1) != 0 && (((v12 ^ v8) & 1) != 0 || ((v11 ^ v7) & 1) != 0 || ((v10 ^ v22)))
        {

          BOOL v25 = 1;
          goto LABEL_24;
        }

        id v9 = (char *)v9 + 1;
        char v5 = 1;
        unsigned int v10 = v6;
        unsigned int v11 = v7;
        unsigned int v12 = v8;
      }
      while (v29 != v9);
      id v29 = [obj countByEnumeratingWithState:&v30 objects:v44 count:16];
      if (v29) {
        continue;
      }
      break;
    }
  }
  BOOL v25 = 0;
LABEL_24:

  return v25;
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CRLWPShapeEditor;
  -[CRLShapeEditor addMiniFormatterElementsToArray:atPoint:](&v38, "addMiniFormatterElementsToArray:atPoint:", v7, x, y);
  unsigned int v8 = [(CRLBoardItemEditor *)self boardItems];
  if ((unint64_t)[v8 count] >= 2)
  {
    unsigned __int8 v9 = [(CRLWPShapeEditor *)self p_shapesAreDifferent];

    if (v9) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  unsigned int v10 = [(CRLBoardItemEditor *)self boardItems];
  if (+[CRLShapeEditor infosAreStickyNotes:v10])
  {
LABEL_13:

    goto LABEL_14;
  }
  unsigned int v11 = [(CRLBoardItemEditor *)self boardItems];
  unsigned __int8 v12 = +[CRLShapeEditor infosAreLines:v11];

  if ((v12 & 1) == 0)
  {
    objc_super v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = [(CRLBoardItemEditor *)self boardItems];
    v15 = [v14 anyObject];
    unsigned int v10 = sub_10024715C(v13, v15);

    unsigned int v16 = [v10 isAutogrowingTextBox];
    char v17 = v16;
    if (v16)
    {
      v18 = +[NSBundle mainBundle];
      v19 = [v18 localizedStringForKey:@"Set Text Color" value:0 table:0];
      id v20 = +[CRLImage crl_quickInspectorImageNamed:@"circle.fill"];
      long long v21 = +[CRLQuickInspectorElement elementWithName:v19 image:v20 type:2 options:0x80000];

      [v21 setTag:4];
      unsigned int v22 = +[NSBundle mainBundle];
      long long v23 = [v22 localizedStringForKey:@"Choose a text color" value:0 table:0];
      [v21 setToolTip:v23];

      [v7 addObject:v21];
      uint64_t v24 = 0x20000;
    }
    else
    {
      uint64_t v24 = 16;
    }
    BOOL v25 = +[NSBundle mainBundle];
    v26 = [v25 localizedStringForKey:@"Modify Text" value:0 table:0];
    v27 = +[CRLImage crl_quickInspectorImageNamed:@"textformat"];
    uint64_t v28 = +[CRLQuickInspectorElement elementWithName:v26 image:v27 type:2 options:v24];

    [v28 setTag:3];
    id v29 = +[NSBundle mainBundle];
    long long v30 = v29;
    if (v17)
    {
      long long v31 = [v29 localizedStringForKey:@"Format text, change alignment, or choose a list style", 0, 0 value table];
      [v28 setToolTip:v31];

      [v7 addObject:v28];
      long long v32 = +[NSBundle mainBundle];
      long long v33 = [v32 localizedStringForKey:@"Set Font Size" value:0 table:0];
      v34 = +[CRLQuickInspectorElement elementWithName:v33 image:0 type:2 options:0x100000];

      [v34 setTag:5];
      unsigned int v35 = +[NSBundle mainBundle];
      __int16 v36 = [v35 localizedStringForKey:@"Choose a font size" value:0 table:0];
      [v34 setToolTip:v36];

      [v7 addObject:v34];
    }
    else
    {
      v37 = [v29 localizedStringForKey:@"Format text" value:0 table:0];
      [v28 setToolTip:v37];

      [v7 addObject:v28];
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (BOOL)p_canSaveDefaultInsertionPreset
{
  v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v3 = [v2 count] == (id)1;

  return v3;
}

- (void)saveDefaultInsertionPreset:(id)a3
{
  v4 = [(CRLBoardItemEditor *)self boardItems];
  id v5 = [v4 count];

  if (v5 != (id)1)
  {
    int v6 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE150);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B9818(v6, v7);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE170);
    }
    unsigned int v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v8, v6);
    }
    unsigned __int8 v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeEditor saveDefaultInsertionPreset:]");
    unsigned int v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:166 isFatal:0 description:"Only should save default style with a single object selected!"];
  }
  unsigned int v11 = (objc_class *)objc_opt_class();
  unsigned __int8 v12 = [(CRLBoardItemEditor *)self boardItems];
  objc_super v13 = [v12 anyObject];
  uint64_t v14 = sub_10024715C(v11, v13);

  if (v14)
  {
    if ([v14 isAutogrowingTextBox])
    {
      uint64_t v15 = 1;
    }
    else if ([v14 pathIsOpen])
    {
      uint64_t v15 = 2;
    }
    else
    {
      uint64_t v15 = 0;
    }
    unsigned int v16 = [[_TtC8Freeform40CRLCommandSetDefaultShapeInsertionPreset alloc] initWithShapeItem:v14 shapeType:v15];
    char v17 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    v18 = [v17 commandController];
    [v18 enqueueCommand:v16];
  }
}

- (void)increaseSize:(id)a3
{
}

- (void)decreaseSize:(id)a3
{
}

- (void)toggleBoldface:(id)a3
{
}

- (void)toggleItalics:(id)a3
{
}

- (void)toggleUnderline:(id)a3
{
}

- (void)toggleStrikethrough:(id)a3
{
}

- (void)alignLeft:(id)a3
{
}

- (void)alignRight:(id)a3
{
}

- (void)alignCenter:(id)a3
{
}

- (void)alignJustified:(id)a3
{
}

- (void)decreaseFontSizeByOne:(id)a3
{
}

- (void)increaseFontSizeByOne:(id)a3
{
}

- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  id v5 = a3;
  int v6 = self;
  CRLWPShapeEditor.addContextualMenuElements(to:at:)(v5);
}

- (BOOL)shouldAddAutosizeTextMenuItem
{
  v2 = self;
  char v3 = sub_1010446D4();

  return v3 & 1;
}

- (void)toggleShrinkToFit:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  swift_getKeyPath();
  sub_101042D80();
  char v7 = v6;
  swift_release();
  if (v7 != 2) {
    sub_100929A68((v7 & 1) == 0);
  }

  sub_100522F00((uint64_t)v8, &qword_101672BF0);
}

- (CRLPlatformControlState)shrinkToFitControlState
{
  v2 = self;
  id v3 = sub_101044A20();

  return (CRLPlatformControlState *)v3;
}

@end