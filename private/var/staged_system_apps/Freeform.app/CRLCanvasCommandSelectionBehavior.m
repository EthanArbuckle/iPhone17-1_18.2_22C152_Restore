@interface CRLCanvasCommandSelectionBehavior
- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3;
- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3 type:(int64_t)a4;
- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3 type:(int64_t)a4 constructedInfos:(id)a5;
- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3 type:(int64_t)a4 selectionPath:(id)a5;
- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3 type:(int64_t)a4 selectionPath:(id)a5 selectionFlags:(unint64_t)a6;
- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3 type:(int64_t)a4 selectionPath:(id)a5 selectionFlags:(unint64_t)a6 commitSelectionFlags:(unint64_t)a7 forwardSelectionFlags:(unint64_t)a8 reverseSelectionFlags:(unint64_t)a9;
@end

@implementation CRLCanvasCommandSelectionBehavior

- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3 type:(int64_t)a4 selectionPath:(id)a5 selectionFlags:(unint64_t)a6 commitSelectionFlags:(unint64_t)a7 forwardSelectionFlags:(unint64_t)a8 reverseSelectionFlags:(unint64_t)a9
{
  unint64_t v14 = a9;
  id v15 = a3;
  id v16 = a5;
  if (!v15)
  {
    LODWORD(v35) = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD130);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101068BE8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD150);
    }
    v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v17);
    }
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:selectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:]");
    v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCommands/CRLCanvasCommandSelectionBehavior.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 26, 0, "invalid nil value for '%{public}s'", "editor", v35);
  }
  if ((unint64_t)(a4 - 2) < 2)
  {
    v22 = [v15 interactiveCanvasController];
    v23 = [v22 editorController];
    uint64_t v20 = [v23 selectionPath];

    goto LABEL_22;
  }
  if (a4 != 1)
  {
    if (!a4)
    {
      uint64_t v20 = [v15 selectionPathWithInfos:0];
      v21 = self;
LABEL_24:
      a7 |= 0x46uLL;
      a8 |= a7;
LABEL_25:
      v31 = v16;
      id v16 = (id)v20;
      goto LABEL_26;
    }
    uint64_t v20 = 0;
LABEL_22:
    v21 = self;
    if (a4 != 3 && a4) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  unint64_t v37 = a6;
  v24 = [v16 mostSpecificSelectionOfClass:objc_opt_class()];
  v36 = v24;
  if (!v24)
  {
    v29 = 0;
LABEL_32:
    char v30 = 1;
    goto LABEL_33;
  }
  v25 = [v24 infosOfClass:objc_opt_class()];
  v26 = [v25 anyObject];

  uint64_t v27 = objc_opt_class();
  v28 = [v26 parentInfo];
  v29 = sub_1002469D0(v27, v28);

  if (([v29 isSelectable] & 1) == 0)
  {

    v29 = 0;
  }

  if (!v29)
  {
    v24 = 0;
    goto LABEL_32;
  }
  v24 = +[NSSet setWithObject:v29];
  char v30 = 0;
LABEL_33:
  v31 = [v15 selectionPathWithInfos:v24];
  if ((v30 & 1) == 0) {

  }
  unint64_t v14 = a9 | 4;
  a6 = v37;
  v21 = self;
LABEL_26:
  if (a4 == 3) {
    unint64_t v32 = a8;
  }
  else {
    unint64_t v32 = 0;
  }
  v33 = [(CRLCommandSelectionBehavior *)v21 initWithForwardSelectionPath:v31 reverseSelectionPath:v16 selectionFlags:a6 commitSelectionFlags:a7 forwardSelectionFlags:a8 reverseSelectionFlags:v32 | v14];

  return v33;
}

- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3 type:(int64_t)a4 selectionPath:(id)a5 selectionFlags:(unint64_t)a6
{
  return [(CRLCanvasCommandSelectionBehavior *)self initWithCanvasEditor:a3 type:a4 selectionPath:a5 selectionFlags:a6 commitSelectionFlags:0 forwardSelectionFlags:0 reverseSelectionFlags:0];
}

- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3 type:(int64_t)a4 selectionPath:(id)a5
{
  return [(CRLCanvasCommandSelectionBehavior *)self initWithCanvasEditor:a3 type:a4 selectionPath:a5 selectionFlags:0];
}

- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3 type:(int64_t)a4 constructedInfos:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (v9 && [v9 count])
  {
    if (a4 && a4 != 3)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CD170);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101068C98();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CD190);
      }
      v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v11);
      }
      v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:]");
      v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCommands/CRLCanvasCommandSelectionBehavior.m"];
      +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:95 isFatal:0 description:"Constructed infos should not be provided for this selection type"];
    }
    unint64_t v14 = [v8 interactiveCanvasController];
    id v15 = [v14 editorController];
    id v16 = [v15 selectionPath];

    v17 = [v8 canvasEditorHelper];
    v18 = [v17 selectionPathForInsertingBoardItems:v10 byReplacingInfosInSelectionPath:v16 preservingMultipleContainers:a4 == 3];
  }
  else
  {
    v19 = [v8 interactiveCanvasController];
    uint64_t v20 = [v19 editorController];
    v18 = [v20 selectionPath];
  }
  v21 = [(CRLCanvasCommandSelectionBehavior *)self initWithCanvasEditor:v8 type:a4 selectionPath:v18];

  return v21;
}

- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3 type:(int64_t)a4
{
  return [(CRLCanvasCommandSelectionBehavior *)self initWithCanvasEditor:a3 type:a4 constructedInfos:0];
}

- (CRLCanvasCommandSelectionBehavior)initWithCanvasEditor:(id)a3
{
  return [(CRLCanvasCommandSelectionBehavior *)self initWithCanvasEditor:a3 type:2 constructedInfos:0];
}

@end