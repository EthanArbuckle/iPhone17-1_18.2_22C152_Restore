@interface CRLConnectionLineEditor
- (BOOL)canHandleInsertAndConnectBoardItem:(id)a3;
- (BOOL)currentSelectionIsValidForInsertAndConnectBoardItem;
- (BOOL)p_canSaveDefaultInsertionPreset;
- (CGPoint)p_unscaledOffsetWhenInsertItem:(id)a3 atEnd:(id)a4;
- (double)leftOutset;
- (double)p_outsetOnLeft:(BOOL)a3;
- (double)rightOutset;
- (id)anyConnectionLine;
- (id)connectionLines;
- (id)p_insertionContextForInsertAndConnectBoardItem:(id)a3;
- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (unint64_t)p_getMagnetTypeOppositeFromType:(unint64_t)a3;
- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)beginChangingConnectionOutset;
- (void)didChangeConnectionLeftOutset:(double)a3;
- (void)didChangeConnectionRightOutset:(double)a3;
- (void)endChangingConnectionOutset;
- (void)insertAndConnectBoardItem:(id)a3 postProcessBlock:(id)a4;
- (void)p_didChangeConnectionOutset:(double)a3 onLeft:(BOOL)a4;
- (void)p_setDynamicOutsetFrom:(id)a3;
- (void)saveDefaultInsertionPreset:(id)a3;
- (void)setConnectionLineType:(int64_t)a3;
- (void)toggleLineType:(id)a3;
@end

@implementation CRLConnectionLineEditor

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("toggleLineType:" == a3 || "setConnectionLineType:" == a3)
  {
    int64_t v8 = 1;
  }
  else if ("saveDefaultInsertionPreset:" == a3)
  {
    if ([(CRLConnectionLineEditor *)self p_canSaveDefaultInsertionPreset]) {
      int64_t v8 = 1;
    }
    else {
      int64_t v8 = -1;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLConnectionLineEditor;
    int64_t v8 = [(CRLShapeEditor *)&v10 canPerformEditorAction:a3 withSender:v6];
  }

  return v8;
}

- (void)toggleLineType:(id)a3
{
  v4 = [(CRLBoardItemEditor *)self editingCoordinator];
  v5 = [v4 commandController];

  id v6 = [CRLCanvasCommandSelectionBehavior alloc];
  v7 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  int64_t v8 = [v7 canvasEditor];
  v9 = [(CRLCanvasCommandSelectionBehavior *)v6 initWithCanvasEditor:v8];

  [v5 openGroupWithSelectionBehavior:v9];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v10 = [(CRLBoardItemEditor *)self layouts];
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v16 = [v15 commandToToggleConnectionType];
          [v5 enqueueCommand:v16];
        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  [v5 closeGroup];
}

- (void)setConnectionLineType:(int64_t)a3
{
  v5 = [(CRLBoardItemEditor *)self editingCoordinator];
  id v6 = [v5 commandController];

  v7 = [CRLCanvasCommandSelectionBehavior alloc];
  int64_t v8 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  v9 = [v8 canvasEditor];
  objc_super v10 = [(CRLCanvasCommandSelectionBehavior *)v7 initWithCanvasEditor:v9];

  [v6 openGroupWithSelectionBehavior:v10];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = [(CRLBoardItemEditor *)self layouts];
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v17 = [v16 commandForSettingConnectionType:a3];
          [v6 enqueueCommand:v17];
        }
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  [v6 closeGroup];
}

- (id)anyConnectionLine
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(CRLBoardItemEditor *)self layouts];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v3)
  {
LABEL_9:

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v8, v9);
    abort();
  }
  id v4 = v3;
  uint64_t v5 = *(void *)v13;
LABEL_3:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v13 != v5) {
      objc_enumerationMutation(v2);
    }
    v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    if (v4 == (id)++v6)
    {
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (!v4) {
        goto LABEL_9;
      }
      goto LABEL_3;
    }
  }
  id v10 = v7;

  return v10;
}

- (id)connectionLines
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(CRLBoardItemEditor *)self layouts];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (double)p_outsetOnLeft:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(CRLBoardItemEditor *)self layouts];
  uint64_t v7 = [v6 anyObject];
  CKRecordID v8 = sub_1002469D0(v5, v7);

  [(CRLConnectionLineEditor *)self p_setDynamicOutsetFrom:v8];
  id v9 = [v8 dynamicOutsetType];
  if (v3)
  {
    if (v9 == (id)1 || [v8 dynamicOutsetType] != (id)2) {
      goto LABEL_4;
    }
LABEL_6:
    [v8 outsetTo];
    goto LABEL_7;
  }
  if (v9 == (id)1) {
    goto LABEL_6;
  }
LABEL_4:
  [v8 outsetFrom];
LABEL_7:
  double v11 = v10;

  return v11;
}

- (double)leftOutset
{
  [(CRLConnectionLineEditor *)self p_outsetOnLeft:1];
  return result;
}

- (double)rightOutset
{
  [(CRLConnectionLineEditor *)self p_outsetOnLeft:0];
  return result;
}

- (void)beginChangingConnectionOutset
{
  if (!BYTE3(self->super.mNextPathEditor))
  {
    BYTE3(self->super.mNextPathEditor) = 1;
    BOOL v3 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    [v3 beginDynamicOperation];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [(CRLBoardItemEditor *)self boardItems];
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = objc_opt_class();
          double v11 = [v3 layoutForInfo:v9];
          long long v12 = sub_1002469D0(v10, v11);

          [v12 beginDynamicOutsetChange];
        }
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
}

- (void)p_didChangeConnectionOutset:(double)a3 onLeft:(BOOL)a4
{
  if (BYTE3(self->super.mNextPathEditor))
  {
    BOOL v4 = a4;
    uint64_t v7 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v18 = self;
    CKRecordID v8 = [(CRLBoardItemEditor *)self boardItems];
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (!v9) {
      goto LABEL_19;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = objc_opt_class();
        long long v15 = [v7 layoutForInfo:v13];
        long long v16 = sub_1002469D0(v14, v15);

        if (v16)
        {
          if (![v16 dynamicOutsetType]) {
            [(CRLConnectionLineEditor *)v18 p_setDynamicOutsetFrom:v16];
          }
          id v17 = [v16 dynamicOutsetType];
          if (v4)
          {
            if (v17 == (id)1 || [v16 dynamicOutsetType] != (id)2)
            {
LABEL_13:
              [v16 setDynamicOutsetFrom:a3];
LABEL_16:
              [v16 invalidatePath];
              goto LABEL_17;
            }
          }
          else if (v17 != (id)1)
          {
            goto LABEL_13;
          }
          [v16 setDynamicOutsetTo:a3];
          goto LABEL_16;
        }
LABEL_17:
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (!v10)
      {
LABEL_19:

        return;
      }
    }
  }
}

- (void)p_setDynamicOutsetFrom:(id)a3
{
  id v4 = a3;
  if ([v4 isTailEndOnLeft]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [v4 setDynamicOutsetType:v3];
}

- (void)didChangeConnectionLeftOutset:(double)a3
{
}

- (void)didChangeConnectionRightOutset:(double)a3
{
}

- (void)endChangingConnectionOutset
{
  if (BYTE3(self->super.mNextPathEditor))
  {
    uint64_t v3 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = [(CRLBoardItemEditor *)self boardItems];
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = objc_opt_class();
          uint64_t v11 = [v3 layoutForInfo:v9];
          long long v12 = sub_1002469D0(v10, v11);

          [v12 endDynamicOutsetChange];
        }
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    [v3 willEndDynamicOperation];
    [v3 endDynamicOperation];
    BYTE3(self->super.mNextPathEditor) = 0;
  }
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v13.receiver = self;
  v13.super_class = (Class)CRLConnectionLineEditor;
  id v6 = a3;
  -[CRLShapeEditor addMiniFormatterElementsToArray:atPoint:](&v13, "addMiniFormatterElementsToArray:atPoint:", v6, x, y);
  uint64_t v7 = +[NSBundle mainBundle];
  CKRecordID v8 = [v7 localizedStringForKey:@"Set Connection Line Style" value:0 table:0];
  uint64_t v9 = +[CRLImage crl_quickInspectorImageNamed:@"app.connected.to.app.below.fill"];
  uint64_t v10 = +[CRLQuickInspectorElement elementWithName:v8 image:v9 type:2 options:64];

  [v10 setTag:7];
  uint64_t v11 = +[NSBundle mainBundle];
  long long v12 = [v11 localizedStringForKey:@"Choose a connection style" value:0 table:0];
  [v10 setToolTip:v12];

  [v6 insertObject:v10 atIndex:[v6 count]];
}

- (id)p_insertionContextForInsertAndConnectBoardItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLConnectionLineEditor *)self connectionLines];
  if ([v5 count] == (id)1)
  {
    id v6 = [v5 firstObject];
    uint64_t v7 = v6;
    if (!v6
      || ([v6 connectedFrom], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0)
      || (uint64_t v9 = (void *)v8,
          [v7 connectedTo],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      uint64_t v11 = 0;
LABEL_6:

      goto LABEL_8;
    }
    objc_super v13 = [v7 connectionLineInfo];
    if (v13)
    {
      long long v14 = (objc_class *)objc_opt_class();
      long long v15 = [(CRLBoardItemEditor *)self interactiveCanvasController];
      long long v16 = [v15 repForInfo:v13];
      id v17 = sub_10024715C(v14, v16);

      if (!v17)
      {
        uint64_t v11 = 0;
LABEL_38:

        goto LABEL_6;
      }
      long long v18 = [v17 knobForTag:11];
      long long v19 = v18;
      if (v18)
      {
        [v18 position];
        [v7 convertNaturalPointToUnscaledCanvas:];
        double v21 = v20;
        double v23 = v22;
        if (v4)
        {
          [(CRLConnectionLineEditor *)self p_unscaledOffsetWhenInsertItem:v4 atEnd:v7];
          double v20 = sub_100064698(v21, v23, v24);
        }
        uint64_t v11 = +[CRLInsertionContext dragInsertionContextWithPreferredCenter:1 required:0 fromDragToInsertController:0 insertFloating:0 targetZOrder:v20];
        goto LABEL_37;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F2260);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A58FC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F2280);
      }
      v26 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v26);
      }
      v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor p_insertionContextForInsertAndConnectBoardItem:]");
      v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 270, 0, "invalid nil value for '%{public}s'", "lineHeadKnob");
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F2220);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A5868();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F2240);
      }
      v25 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v25);
      }
      id v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor p_insertionContextForInsertAndConnectBoardItem:]");
      long long v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v19, 259, 0, "invalid nil value for '%{public}s'", "connectionLineItem");
    }
    uint64_t v11 = 0;
LABEL_37:

    goto LABEL_38;
  }
  uint64_t v11 = 0;
LABEL_8:

  return v11;
}

- (CGPoint)p_unscaledOffsetWhenInsertItem:(id)a3 atEnd:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 connectedFrom];
  uint64_t v9 = [v8 geometry];
  [v9 size];
  double v11 = v10;
  double v13 = v12;

  if (v11 >= v13) {
    double v14 = v11;
  }
  else {
    double v14 = v13;
  }
  long long v15 = [v7 geometry];

  [v15 size];
  double v17 = v16;
  double v19 = v18;

  if (v17 >= v19) {
    double v20 = v17;
  }
  else {
    double v20 = v19;
  }
  double v21 = v14 + v20;
  double v22 = (objc_class *)objc_opt_class();
  double v23 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  double v24 = [v6 info];
  v25 = [v23 repForInfo:v24];
  v26 = sub_10024715C(v22, v25);

  v27 = [v26 knobForTag:11];
  [v27 position];
  [v6 convertNaturalPointToUnscaledCanvas:];
  double v29 = v28;
  double v31 = v30;
  v32 = [v26 knobForTag:10];
  [v32 position];
  [v6 convertNaturalPointToUnscaledCanvas:];
  double v34 = v33;

  double v35 = sub_100064680(v29, v31, v34);
  double v37 = sub_100064660(v35, v36);
  double v39 = sub_1000646A4(v37, v38, v21);
  double v41 = v40;

  double v42 = v39;
  double v43 = v41;
  result.double y = v43;
  result.double x = v42;
  return result;
}

- (BOOL)currentSelectionIsValidForInsertAndConnectBoardItem
{
  v2 = [(CRLConnectionLineEditor *)self p_insertionContextForInsertAndConnectBoardItem:0];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)canHandleInsertAndConnectBoardItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLConnectionLineEditor *)self p_insertionContextForInsertAndConnectBoardItem:v4];
  if (v5)
  {
    id v6 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    id v7 = [v6 canvasEditor];
    id v11 = v4;
    uint64_t v8 = +[NSArray arrayWithObjects:&v11 count:1];
    unsigned __int8 v9 = [v7 canHandleInsertionOfBoardItems:v8 insertionContext:v5];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)insertAndConnectBoardItem:(id)a3 postProcessBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  uint64_t v8 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  v64 = v7;
  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F22A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A5C74();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F22C0);
    }
    unsigned __int8 v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor insertAndConnectBoardItem:postProcessBlock:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 331, 0, "invalid nil value for '%{public}s'", "icc");

    id v7 = v64;
  }
  v63 = [v8 canvasEditor];
  if (!v63)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F22E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A5BE0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2300);
    }
    double v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    double v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor insertAndConnectBoardItem:postProcessBlock:]");
    double v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 334, 0, "invalid nil value for '%{public}s'", "canvasEditor");
  }
  long long v15 = [(CRLConnectionLineEditor *)self anyConnectionLine];
  if (!v15)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2320);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A5B4C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2340);
    }
    double v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v16);
    }
    double v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor insertAndConnectBoardItem:postProcessBlock:]");
    double v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 337, 0, "invalid nil value for '%{public}s'", "connectionLineLayout");
  }
  double v19 = [v15 connectedTo];

  if (v19)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2360);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A5AB8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2380);
    }
    double v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v20);
    }
    double v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor insertAndConnectBoardItem:postProcessBlock:]");
    double v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:338 isFatal:0 description:"Connection line already has something connected to its to-end."];
  }
  double v23 = [v15 connectionLineInfo];
  if (v23)
  {
    double v24 = [v8 commandController];
    [v24 openGroup];

    v25 = [v8 commandController];
    [v25 enableProgressiveEnqueuingInCurrentGroup];

    v26 = [(CRLConnectionLineEditor *)self p_insertionContextForInsertAndConnectBoardItem:v6];
    if (!v26)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F23E0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A5A24();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F2400);
      }
      v27 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v27);
      }
      double v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor insertAndConnectBoardItem:postProcessBlock:]");
      double v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 353, 0, "invalid nil value for '%{public}s'", "insertionContext");
    }
    id v66 = v6;
    double v30 = +[NSArray arrayWithObjects:&v66 count:1];
    [v63 prepareGeometryForInsertingBoardItems:v30 withInsertionContext:v26 ignoreCanvasBackgroundAlignmentProvidedSnapping:1];

    id v65 = v6;
    double v31 = +[NSArray arrayWithObjects:&v65 count:1];
    [v63 insertBoardItems:v31 withInsertionContext:v26 postProcessBlock:0];

    v32 = [v23 connectionLinePathSource];
    id v33 = [v32 copy];

    double v34 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", 1, 0.5, 0.5);
    [v33 setHeadMagnet:v34];

    double v35 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v23 connectedItem:v6 chirality:1 pathSource:v33];
    double v36 = [v8 commandController];
    [v36 enqueueCommand:v35];

    [v8 layoutIfNeeded];
    [v15 headPoint];
    [v15 convertNaturalPointToUnscaledCanvas:];
    double v38 = v37;
    [v15 unclippedHeadPoint];
    [v15 convertNaturalPointToUnscaledCanvas:];
    double v41 = sub_100064680(v39, v40, v38);
    [(CRLConnectionLineEditor *)self p_unscaledOffsetWhenInsertItem:v6 atEnd:v15];
    double v44 = sub_1000646A4(v42, v43, -1.0);
    double v46 = sub_100064698(v44, v45, v41);
    double v48 = v47;
    v49 = [v8 layoutForInfo:v6];
    [v49 centerForConnecting];
    double v51 = sub_100064698(v46, v48, v50);
    double v53 = v52;

    v54 = [CRLCanvasInfoGeometry alloc];
    v55 = [v6 geometry];
    [v55 size];
    v58 = -[CRLCanvasInfoGeometry initWithCenter:size:](v54, "initWithCenter:size:", v51, v53, v56, v57);

    v59 = [[_TtC8Freeform25CRLCommandSetInfoGeometry alloc] initWithBoardItem:v6 geometry:v58];
    v60 = [v8 commandController];
    [v60 enqueueCommand:v59];

    if (v64) {
      v64[2]();
    }
    v61 = [v8 commandController];
    [v61 closeGroup];

    id v7 = v64;
    [v8 layoutIfNeeded];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F23A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A5990();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F23C0);
    }
    v62 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v62);
    }
    v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor insertAndConnectBoardItem:postProcessBlock:]");
    id v33 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v33, 341, 0, "invalid nil value for '%{public}s'", "connectionLineItem");
  }
}

- (unint64_t)p_getMagnetTypeOppositeFromType:(unint64_t)a3
{
  if (a3 - 2 > 3) {
    return 1;
  }
  else {
    return qword_101178048[a3 - 2];
  }
}

- (BOOL)p_canSaveDefaultInsertionPreset
{
  v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v3 = [v2 count] == (id)1;

  return v3;
}

- (void)saveDefaultInsertionPreset:(id)a3
{
  id v4 = [(CRLBoardItemEditor *)self boardItems];
  id v5 = [v4 count];

  if (v5 != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2420);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A5D08();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2440);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor saveDefaultInsertionPreset:]");
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:423 isFatal:0 description:"Only should save default style with a single object selected!"];
  }
  unsigned __int8 v9 = (objc_class *)objc_opt_class();
  double v10 = [(CRLBoardItemEditor *)self boardItems];
  id v11 = [v10 anyObject];
  double v12 = sub_10024715C(v9, v11);

  if (v12)
  {
    double v13 = (objc_class *)objc_opt_class();
    double v14 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    long long v15 = [v14 editingCoordinator];
    double v16 = [v15 boardItemFactory];
    double v17 = [v16 makeShapeItemWithShapeType:1];
    double v18 = sub_10024715C(v13, v17);

    if (v18)
    {
      double v19 = [v12 stroke];
      [v18 setStroke:v19];

      double v20 = [v12 fill];
      [v18 setFill:v20];

      double v21 = [v12 shadow];
      [v18 setShadow:v21];

      double v22 = [[_TtC8Freeform40CRLCommandSetDefaultShapeInsertionPreset alloc] initWithShapeItem:v18 shapeType:2];
      double v23 = [(CRLBoardItemEditor *)self interactiveCanvasController];
      double v24 = [v23 commandController];
      [v24 enqueueCommand:v22];
    }
  }
}

@end