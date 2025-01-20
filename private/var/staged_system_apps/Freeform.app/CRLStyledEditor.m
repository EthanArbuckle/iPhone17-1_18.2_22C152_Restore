@interface CRLStyledEditor
+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingOpacity;
+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingReflection;
+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingShadow;
+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingStroke;
+ (id)keyPathsForValuesAffectingStyledItems;
- (BOOL)isChangingStrokeWidth;
- (BOOL)p_anyItemHasStroke;
- (BOOL)p_canCopyStyle;
- (BOOL)p_canPasteStyle;
- (CRLColor)strokeColor;
- (CRLStroke)stroke;
- (NSArray)strokeSwatches;
- (NSSet)selectedObjectsSupportingFill;
- (NSString)currentGroupActionStringForStrokeSetting;
- (NSString)strokeColorPickerTitle;
- (_TtC8Freeform13CRLStyledItem)anyStyledItem;
- (double)defaultStrokeWidth;
- (double)strokeWidth;
- (id)defaultStrokeColor;
- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (void)applyStroke:(id)a3;
- (void)applyStrokeColor:(id)a3;
- (void)applyStrokePattern:(id)a3;
- (void)applyStrokeWidth:(double)a3;
- (void)beginChangingStrokeWidth:(double)a3;
- (void)copyStyle:(id)a3;
- (void)didChangeStrokeWidth:(double)a3;
- (void)endChangingStrokeWidth:(double)a3;
- (void)p_enqueueCommandsToAdjustCustomMagnetsForInfo:(id)a3;
- (void)pasteStyle:(id)a3;
- (void)takePatternFromStroke:(id)a3 withDefaultStroke:(id)a4;
@end

@implementation CRLStyledEditor

- (_TtC8Freeform13CRLStyledItem)anyStyledItem
{
  v2 = [(CRLStyledEditor *)self styledItems];
  v3 = [v2 anyObject];

  return (_TtC8Freeform13CRLStyledItem *)v3;
}

+ (id)keyPathsForValuesAffectingStyledItems
{
  return +[NSSet setWithObject:@"boardItems"];
}

- (BOOL)p_canPasteStyle
{
  v3 = [(CRLBoardItemEditor *)self editorController];
  v4 = [v3 mostSpecificCurrentEditorOfClass:objc_opt_class()];

  if (v4 == self)
  {
    v6 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    v7 = [v6 canvasEditor];
    v8 = [v7 pasteboardController];

    v9 = [(CRLStyledEditor *)self styledItems];
    v10 = +[CRLPasteboard stylePasteboard];
    unsigned int v11 = [v8 containsStylesRelevantTo:v9 on:v10];

    if (v11)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v12 = [(CRLStyledEditor *)self styledItems];
      id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v20;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v12);
            }
            v16 = [*(id *)(*((void *)&v19 + 1) + 8 * i) parentInfo];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              LOBYTE(v13) = 1;
              goto LABEL_15;
            }
          }
          id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    else
    {
      LOBYTE(v13) = 0;
    }
    char v5 = v11 & (v13 ^ 1);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingStroke
{
  return +[NSSet setWithObject:@"styledItems"];
}

+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingShadow
{
  return +[NSSet setWithObject:@"styledItems"];
}

+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingReflection
{
  return +[NSSet setWithObject:@"styledItems"];
}

+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingOpacity
{
  return +[NSSet setWithObject:@"styledItems"];
}

- (NSSet)selectedObjectsSupportingFill
{
  return 0;
}

- (BOOL)p_canCopyStyle
{
  v3 = [(CRLBoardItemEditor *)self editorController];
  v4 = [v3 mostSpecificCurrentEditorOfClass:objc_opt_class()];

  if (v4 == self
    && ([(CRLStyledEditor *)self styledItems],
        char v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 count],
        v5,
        v6 == (id)1))
  {
    v7 = [(CRLStyledEditor *)self styledItems];
    v8 = [v7 anyObject];

    if (v8) {
      unsigned __int8 v9 = [v8 canCopyStyle];
    }
    else {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  BOOL v10 = "applyStroke:" == a3
     || "takePatternFromStroke:withDefaultStroke:" == a3
     || "applyStrokeColor:" == a3
     || "applyStrokeWidth:" == a3
     || "applyStrokePattern:" == a3;
  if (v10
    || "copyStyle:" == a3 && [(CRLStyledEditor *)self p_canCopyStyle]
    || sel_isEqual(a3, "pasteStyle:") && [(CRLStyledEditor *)self p_canPasteStyle])
  {
    int64_t v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLStyledEditor;
    int64_t v11 = [(CRLBoardItemEditor *)&v13 canPerformEditorAction:a3 withSender:v6];
  }

  return v11;
}

- (void)copyStyle:(id)a3
{
  v4 = +[CRLPasteboard stylePasteboard];
  char v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v6 = [v5 canvasEditor];
  v7 = [v6 pasteboardController];

  v8 = [(CRLStyledEditor *)self styledItems];
  id v9 = [v8 count];

  if (v9 != (id)1)
  {
    int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFF90);
    }
    int64_t v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106E6D4(v10, v11);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFFB0);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v12, v10);
    }
    objc_super v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyledEditor copyStyle:]");
    uint64_t v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:160 isFatal:0 description:"Should only copy style with a single object selected"];
  }
  v15 = [(CRLStyledEditor *)self styledItems];
  v16 = [v15 anyObject];

  [v7 copyStyleFromItem:v16 to:v4];
}

- (void)pasteStyle:(id)a3
{
  id v18 = +[CRLPasteboard stylePasteboard];
  v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  char v5 = [v4 canvasEditor];
  id v6 = [v5 pasteboardController];

  v7 = [(CRLStyledEditor *)self styledItems];
  v8 = [v6 commandsToPasteStyleTo:v7 from:v18];

  if ([v8 count])
  {
    id v9 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    int v10 = [v9 commandController];

    int64_t v11 = [CRLCanvasCommandSelectionBehavior alloc];
    v12 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    objc_super v13 = [v12 canvasEditor];
    uint64_t v14 = [(CRLCanvasCommandSelectionBehavior *)v11 initWithCanvasEditor:v13];

    [v10 openGroupWithSelectionBehavior:v14];
    v15 = +[NSBundle mainBundle];
    v16 = [v15 localizedStringForKey:@"Paste Style" value:0 table:@"UndoStrings"];
    [v10 setCurrentGroupActionString:v16];

    v17 = [[_TtC8Freeform15CRLCommandGroup alloc] initWithCommands:v8];
    [v10 enqueueCommand:v17];

    [v10 closeGroup];
  }
}

- (NSArray)strokeSwatches
{
  return (NSArray *)&__NSArray0__struct;
}

- (double)defaultStrokeWidth
{
  return 1.0;
}

- (id)defaultStrokeColor
{
  return +[CRLColor blackColor];
}

- (CRLStroke)stroke
{
  v2 = [(CRLStyledEditor *)self anyStyledItem];
  v3 = [v2 stroke];

  return (CRLStroke *)v3;
}

- (CRLColor)strokeColor
{
  v2 = [(CRLStyledEditor *)self stroke];
  v3 = [v2 color];

  return (CRLColor *)v3;
}

- (BOOL)isChangingStrokeWidth
{
  return self->mIsChangingStrokeWidth;
}

- (double)strokeWidth
{
  v2 = [(CRLStyledEditor *)self stroke];
  [v2 width];
  double v4 = v3;

  return v4;
}

- (NSString)strokeColorPickerTitle
{
  v2 = +[NSBundle mainBundle];
  double v3 = [v2 localizedStringForKey:@"Border Color" value:0 table:0];

  return (NSString *)v3;
}

- (NSString)currentGroupActionStringForStrokeSetting
{
  v2 = +[NSBundle mainBundle];
  double v3 = [v2 localizedStringForKey:@"Border Setting" value:0 table:@"UndoStrings"];

  return (NSString *)v3;
}

- (void)applyStroke:(id)a3
{
  id v4 = a3;
  char v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v6 = [v5 commandController];
  v7 = [CRLCanvasCommandSelectionBehavior alloc];
  long long v19 = v5;
  v8 = [v5 canvasEditor];
  id v9 = [(CRLCanvasCommandSelectionBehavior *)v7 initWithCanvasEditor:v8 type:2];

  id v18 = v9;
  [v6 openGroupWithSelectionBehavior:v9];
  [v6 enableProgressiveEnqueuingInCurrentGroup];
  int v10 = [(CRLStyledEditor *)self currentGroupActionStringForStrokeSetting];
  [v6 setCurrentGroupActionString:v10];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int64_t v11 = [(CRLStyledEditor *)self styledItems];
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v15);
        v17 = [[_TtC8Freeform19CRLCommandSetStroke alloc] initWithStyledItem:v16 stroke:v4];
        [v6 enqueueCommand:v17];
        [(CRLStyledEditor *)self p_enqueueCommandsToAdjustCustomMagnetsForInfo:v16];

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  [v6 closeGroup];
}

- (void)applyStrokeColor:(id)a3
{
  id v4 = a3;
  char v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v6 = [v5 commandController];
  v7 = [CRLCanvasCommandSelectionBehavior alloc];
  v29 = v5;
  v8 = [v5 canvasEditor];
  id v9 = [(CRLCanvasCommandSelectionBehavior *)v7 initWithCanvasEditor:v8 type:2];

  v28 = v9;
  [v6 openGroupWithSelectionBehavior:v9];
  int v10 = [(CRLStyledEditor *)self currentGroupActionStringForStrokeSetting];
  v31 = v6;
  [v6 setCurrentGroupActionString:v10];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  int64_t v11 = self;
  id obj = [(CRLStyledEditor *)self styledItems];
  id v12 = [obj countByEnumeratingWithState:&v32 objects:v46 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v33;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v15);
        v17 = [v16 stroke];
        id v18 = v17;
        if (v17 && ![v17 isNullStroke])
        {
          id v20 = [v18 mutableCopy];
          [v20 setColor:v4];
          if (v20)
          {
LABEL_9:
            long long v21 = [[_TtC8Freeform19CRLCommandSetStroke alloc] initWithStyledItem:v16 stroke:v20];
            [v31 enqueueCommand:v21];
            goto LABEL_20;
          }
        }
        else
        {
          [(CRLStyledEditor *)v11 defaultStrokeWidth];
          long long v19 = +[CRLStroke strokeWithColor:width:](CRLStroke, "strokeWithColor:width:", v4);
          id v20 = [v19 mutableCopy];

          if (v20) {
            goto LABEL_9;
          }
        }
        unsigned int v22 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CFFD0);
        }
        long long v23 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67110146;
          unsigned int v37 = v22;
          __int16 v38 = 2082;
          v39 = "-[CRLStyledEditor applyStrokeColor:]";
          __int16 v40 = 2082;
          v41 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledEditor.m";
          __int16 v42 = 1024;
          int v43 = 256;
          __int16 v44 = 2082;
          v45 = "newStroke";
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CFFF0);
        }
        v24 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          v26 = v24;
          v27 = +[CRLAssertionHandler packedBacktraceString];
          *(_DWORD *)buf = 67109378;
          unsigned int v37 = v22;
          __int16 v38 = 2114;
          v39 = v27;
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
        }
        +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyledEditor applyStrokeColor:]");
        long long v21 = (_TtC8Freeform19CRLCommandSetStroke *)objc_claimAutoreleasedReturnValue();
        v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledEditor.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v25, 256, 0, "invalid nil value for '%{public}s'", "newStroke");

LABEL_20:
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [obj countByEnumeratingWithState:&v32 objects:v46 count:16];
    }
    while (v13);
  }

  [v31 closeGroup];
}

- (void)applyStrokeWidth:(double)a3
{
  char v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v6 = [v5 commandController];
  v7 = [CRLCanvasCommandSelectionBehavior alloc];
  v29 = v5;
  v8 = [v5 canvasEditor];
  id v9 = [(CRLCanvasCommandSelectionBehavior *)v7 initWithCanvasEditor:v8 type:2];

  v28 = v9;
  [v6 openGroupWithSelectionBehavior:v9];
  [v6 enableProgressiveEnqueuingInCurrentGroup];
  int v10 = [(CRLStyledEditor *)self currentGroupActionStringForStrokeSetting];
  v31 = v6;
  [v6 setCurrentGroupActionString:v10];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(CRLStyledEditor *)self styledItems];
  id v11 = [obj countByEnumeratingWithState:&v32 objects:v46 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v33;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v14);
        uint64_t v16 = [v15 stroke];
        v17 = v16;
        if (v16 && ![v16 isNullStroke])
        {
          id v20 = [v17 mutableCopy];
          [v20 setWidth:a3];
          if (v20)
          {
LABEL_9:
            long long v21 = [[_TtC8Freeform19CRLCommandSetStroke alloc] initWithStyledItem:v15 stroke:v20];
            [v31 enqueueCommand:v21];
            goto LABEL_20;
          }
        }
        else
        {
          id v18 = [(CRLStyledEditor *)self defaultStrokeColor];
          long long v19 = +[CRLStroke strokeWithColor:v18 width:a3];
          id v20 = [v19 mutableCopy];

          if (v20) {
            goto LABEL_9;
          }
        }
        unsigned int v22 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D0010);
        }
        long long v23 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67110146;
          unsigned int v37 = v22;
          __int16 v38 = 2082;
          v39 = "-[CRLStyledEditor applyStrokeWidth:]";
          __int16 v40 = 2082;
          v41 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledEditor.m";
          __int16 v42 = 1024;
          int v43 = 285;
          __int16 v44 = 2082;
          v45 = "newStroke";
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D0030);
        }
        v24 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          v26 = v24;
          v27 = +[CRLAssertionHandler packedBacktraceString];
          *(_DWORD *)buf = 67109378;
          unsigned int v37 = v22;
          __int16 v38 = 2114;
          v39 = v27;
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
        }
        +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyledEditor applyStrokeWidth:]");
        long long v21 = (_TtC8Freeform19CRLCommandSetStroke *)objc_claimAutoreleasedReturnValue();
        v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledEditor.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v25, 285, 0, "invalid nil value for '%{public}s'", "newStroke");

LABEL_20:
        [(CRLStyledEditor *)self p_enqueueCommandsToAdjustCustomMagnetsForInfo:v15];

        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v32 objects:v46 count:16];
    }
    while (v12);
  }

  [v31 closeGroup];
}

- (void)p_enqueueCommandsToAdjustCustomMagnetsForInfo:(id)a3
{
  id v4 = a3;
  char v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v6 = [v5 layoutForInfo:v4];
  v7 = v6;
  if (v6)
  {
    [v6 adjustCustomMagnetPositions];
    v8 = [v7 commandsForAdjustingMagnetsFromClineLayouts];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v12);
          uint64_t v14 = [v5 commandController];
          [v14 enqueueCommand:v13];

          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (void)beginChangingStrokeWidth:(double)a3
{
  id v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  self->mIsChangingStrokeWidth = 1;
  [v4 beginDynamicOperation];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v5 = [(CRLStyledEditor *)self styledItems];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [v4 layoutForInfo:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9)];
        [v10 dynamicStrokeWidthChangeDidBegin];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)didChangeStrokeWidth:(double)a3
{
  char v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(CRLStyledEditor *)self styledItems];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [v5 layoutForInfo:*(void *)(*((void *)&v12 + 1) + 8 * (void)v10)];
        [v11 dynamicStrokeWidthUpdateToValue:a3];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)endChangingStrokeWidth:(double)a3
{
  char v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(CRLStyledEditor *)self styledItems];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [v5 layoutForInfo:*(void *)(*((void *)&v12 + 1) + 8 * (void)v10)];
        [v11 dynamicStrokeWidthChangeDidEnd];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [v5 willEndDynamicOperation];
  [v5 endDynamicOperation];
  self->mIsChangingStrokeWidth = 0;
  [(CRLStyledEditor *)self applyStrokeWidth:a3];
}

- (void)takePatternFromStroke:(id)a3 withDefaultStroke:(id)a4
{
  id v6 = a3;
  id v26 = a4;
  id v7 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v8 = [v7 commandController];
  uint64_t v9 = [CRLCanvasCommandSelectionBehavior alloc];
  v24 = v7;
  id v10 = [v7 canvasEditor];
  long long v11 = [(CRLCanvasCommandSelectionBehavior *)v9 initWithCanvasEditor:v10 type:2];

  [v8 openGroupWithSelectionBehavior:v11];
  long long v12 = [(CRLStyledEditor *)self currentGroupActionStringForStrokeSetting];
  [v8 setCurrentGroupActionString:v12];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(CRLStyledEditor *)self styledItems];
  id v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v18 = [v17 stroke];
        id v19 = [v6 mutableCopy];
        if (v18 && ([v18 isNullStroke] & 1) == 0)
        {
          id v20 = v19;
          id v21 = v18;
        }
        else
        {
          id v20 = v19;
          id v21 = v26;
        }
        [v20 setPropertiesFromStroke:v21];
        unsigned int v22 = [v6 pattern];
        [v19 setPattern:v22];

        objc_msgSend(v19, "setCap:", objc_msgSend(v6, "cap"));
        long long v23 = [[_TtC8Freeform19CRLCommandSetStroke alloc] initWithStyledItem:v17 stroke:v19];
        [v8 enqueueCommand:v23];
      }
      id v14 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }

  [v8 closeGroup];
}

- (void)applyStrokePattern:(id)a3
{
  id v4 = a3;
  char v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v6 = [v5 commandController];
  id v7 = [CRLCanvasCommandSelectionBehavior alloc];
  long long v29 = v5;
  id v8 = [v5 canvasEditor];
  uint64_t v9 = [(CRLCanvasCommandSelectionBehavior *)v7 initWithCanvasEditor:v8 type:2];

  long long v28 = v9;
  [v6 openGroupWithSelectionBehavior:v9];
  id v10 = [(CRLStyledEditor *)self currentGroupActionStringForStrokeSetting];
  long long v11 = v6;
  [v6 setCurrentGroupActionString:v10];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(CRLStyledEditor *)self styledItems];
  id v12 = [obj countByEnumeratingWithState:&v31 objects:v45 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v15);
        long long v17 = [v16 stroke];
        long long v18 = v17;
        if (v17 && ![v17 isNullStroke])
        {
          id v20 = [v18 mutableCopy];
        }
        else
        {
          id v19 = objc_alloc_init(CRLStroke);
          id v20 = [(CRLStroke *)v19 mutableCopy];
        }
        [v20 setPattern:v4];
        if (v20)
        {
          id v21 = [[_TtC8Freeform19CRLCommandSetStroke alloc] initWithStyledItem:v16 stroke:v20];
          [v11 enqueueCommand:v21];
        }
        else
        {
          unsigned int v22 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D0050);
          }
          long long v23 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v36 = v22;
            __int16 v37 = 2082;
            __int16 v38 = "-[CRLStyledEditor applyStrokePattern:]";
            __int16 v39 = 2082;
            __int16 v40 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledEditor.m";
            __int16 v41 = 1024;
            int v42 = 410;
            __int16 v43 = 2082;
            __int16 v44 = "newStroke";
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D0070);
          }
          v24 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            id v26 = v24;
            long long v27 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v36 = v22;
            __int16 v37 = 2114;
            __int16 v38 = v27;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyledEditor applyStrokePattern:]");
          id v21 = (_TtC8Freeform19CRLCommandSetStroke *)objc_claimAutoreleasedReturnValue();
          v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledEditor.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v25, 410, 0, "invalid nil value for '%{public}s'", "newStroke");
        }
        uint64_t v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [obj countByEnumeratingWithState:&v31 objects:v45 count:16];
    }
    while (v13);
  }

  [v11 closeGroup];
}

- (BOOL)p_anyItemHasStroke
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(CRLStyledEditor *)self styledItems];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) stroke];
        id v7 = v6;
        if (v6 && ![v6 isNullStroke])
        {

          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

@end