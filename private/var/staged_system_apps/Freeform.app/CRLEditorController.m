@interface CRLEditorController
- (BOOL)anyEditorProhibitsAction:(SEL)a3;
- (BOOL)isChangingSelection;
- (BOOL)selectionChangeDisabled;
- (CRLEditorController)init;
- (CRLEditorController)initWithEditingCoordinator:(id)a3 rootEditor:(id)a4 debugName:(id)a5;
- (CRLSelectionPath)selectionPath;
- (CRLTextInputEditor)textInputEditor;
- (NSArray)currentEditors;
- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator;
- (id)currentEditorsConformingToProtocol:(id)a3;
- (id)currentEditorsOfClass:(Class)a3;
- (id)description;
- (id)editorForEditAction:(SEL)a3 withSender:(id)a4;
- (id)editorForEditAction:(SEL)a3 withSender:(id)a4 response:(int64_t *)a5;
- (id)mostSpecificCurrentEditorOfClass:(Class)a3;
- (id)mostSpecificCurrentEditorOfClass:(Class)a3 conformingToProtocol:(id)a4;
- (id)mostSpecificEditorConformingToProtocol:(id)a3;
- (id)objectForInspectorPropertyKey:(id)a3;
- (id)selectionForEditor:(id)a3;
- (id)selectionPathToPopEditor:(id)a3;
- (unint64_t)editingDisabledReasons;
- (void)editorDidChangeSelectionAndWantsKeyboard:(id)a3;
- (void)enumerateEditorsOnStackLeastToMostSpecificUsingBlock:(id)a3;
- (void)enumerateEditorsOnStackUsingBlock:(id)a3;
- (void)notifyResignedTextInputEditors;
- (void)p_beginTransaction;
- (void)p_didChangeCurrentEditors;
- (void)p_didChangeTextInputEditor;
- (void)p_endTransaction;
- (void)p_enumerateEditorsWithEnumerator:(id)a3 usingBlock:(id)a4;
- (void)p_popEditor:(id)a3;
- (void)p_pushEditor:(id)a3;
- (void)p_refreshTextInputEditorWithFlags:(unint64_t)a3;
- (void)performBlockAfterSettingSelection:(id)a3;
- (void)pushSelection:(id)a3;
- (void)refreshTextInputEditor;
- (void)removeObjectForInspectorPropertyKey:(id)a3;
- (void)setEditingDisabledReasons:(unint64_t)a3;
- (void)setObject:(id)a3 forInspectorPropertyKey:(id)a4;
- (void)setSelection:(id)a3 forEditor:(id)a4;
- (void)setSelection:(id)a3 forEditor:(id)a4 withFlags:(unint64_t)a5;
- (void)setSelectionChangeDisabled:(BOOL)a3;
- (void)setSelectionPath:(id)a3;
- (void)setSelectionPath:(id)a3 withFlags:(unint64_t)a4;
- (void)setSelectionPathToPopEditor:(id)a3;
- (void)setSelectionPathToPopToEditor:(id)a3;
- (void)teardown;
@end

@implementation CRLEditorController

- (CRLEditorController)initWithEditingCoordinator:(id)a3 rootEditor:(id)a4 debugName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)CRLEditorController;
  v11 = [(CRLEditorController *)&v34 init];
  if (v11)
  {
    if (v8)
    {
      if (v9) {
        goto LABEL_4;
      }
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DC930);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101081D08();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DC950);
      }
      v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController initWithEditingCoordinator:rootEditor:debugName:]");
      v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 68, 0, "invalid nil value for '%{public}s'", "editingCoordinator");

      if (v9)
      {
LABEL_4:
        if (v10)
        {
LABEL_33:
          objc_storeWeak((id *)&v11->mEditingCoordinator, v8);
          v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
          mEditorStack = v11->mEditorStack;
          v11->mEditorStack = v21;

          v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
          mResignedTextInputEditors = v11->mResignedTextInputEditors;
          v11->mResignedTextInputEditors = v23;

          v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          mInspectorPropertyValueMap = v11->mInspectorPropertyValueMap;
          v11->mInspectorPropertyValueMap = v25;

          v27 = (NSString *)[v10 copy];
          mDebugName = v11->mDebugName;
          v11->mDebugName = v27;

          v29 = objc_alloc_init(_TtC8Freeform17CRLBoardSelection);
          v35 = v29;
          v30 = +[NSArray arrayWithObjects:&v35 count:1];
          uint64_t v31 = +[CRLSelectionPath selectionPathWithSelectionArray:v30];
          mSelectionPath = v11->mSelectionPath;
          v11->mSelectionPath = (CRLSelectionPath *)v31;

          [v9 setEditorController:v11];
          [(CRLEditorController *)v11 p_pushEditor:v9];
          goto LABEL_34;
        }
LABEL_24:
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DC9B0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101081BE0();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DC9D0);
        }
        v18 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v18);
        }
        v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController initWithEditingCoordinator:rootEditor:debugName:]");
        v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 70, 0, "invalid nil value for '%{public}s'", "debugName");

        goto LABEL_33;
      }
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC970);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101081C74();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC990);
    }
    v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController initWithEditingCoordinator:rootEditor:debugName:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 69, 0, "invalid nil value for '%{public}s'", "rootEditor");

    if (v10) {
      goto LABEL_33;
    }
    goto LABEL_24;
  }
LABEL_34:

  return v11;
}

- (CRLEditorController)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DC9F0);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLEditorController init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m";
    __int16 v17 = 1024;
    int v18 = 85;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DCA10);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController init]");
  id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:85 isFatal:0 description:"Do not call method"];

  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLEditorController init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  mDebugName = self->mDebugName;
  id v6 = [(NSMutableArray *)self->mEditorStack count];
  CFStringRef v7 = &stru_101538650;
  if (!v6) {
    CFStringRef v7 = @" TORN DOWN";
  }
  id v8 = +[NSString stringWithFormat:@"%@<%p>: %@%@", v4, self, mDebugName, v7];

  return v8;
}

- (void)teardown
{
  [(CRLEditorController *)self p_beginTransaction];
  v3 = [(NSMutableArray *)self->mEditorStack firstObject];
  id v4 = [(NSMutableArray *)self->mEditorStack copy];
  [(CRLEditorController *)self p_popEditor:v3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
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
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 tearDown:v11];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(CRLEditorController *)self p_endTransaction];
}

- (NSArray)currentEditors
{
  return +[NSArray arrayWithArray:self->mEditorStack];
}

- (CRLTextInputEditor)textInputEditor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mTextInputEditor);

  return (CRLTextInputEditor *)WeakRetained;
}

- (CRLSelectionPath)selectionPath
{
  if (![(NSMutableArray *)self->mEditorStack count])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCA30);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101081D9C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCA50);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController selectionPath]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:123 isFatal:0 description:"Asking a torn-down editor controller for its current selection."];
  }
  mSelectionPath = self->mSelectionPath;

  return mSelectionPath;
}

- (BOOL)isChangingSelection
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCA70);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101081E24();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCA90);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController isChangingSelection]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:129 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  return self->mReentrancyValue > 0;
}

- (void)setSelectionPath:(id)a3
{
}

- (void)setSelectionPath:(id)a3 withFlags:(unint64_t)a4
{
  id v5 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCAB0);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      sub_1010823B0();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCAD0);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_101082044();
    }

    uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:138 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if ([(CRLEditorController *)self selectionChangeDisabled])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCAF0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101081EAC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCB10);
    }
    id v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    long long v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]");
    long long v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
    long long v13 = "Cannot set the selection while the canvas is doing background layout!";
    long long v14 = v11;
    __int16 v15 = v12;
    uint64_t v16 = 141;
LABEL_21:
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:v16 isFatal:0 description:v13];

    goto LABEL_197;
  }
  if (v5)
  {
    if (![(NSMutableArray *)self->mEditorStack count])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DCB70);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101081FBC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DCB90);
      }
      v35 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v35);
      }
      long long v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]");
      long long v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
      long long v13 = "Should never set a selection on an editor controller that has already been torn down! It won't work.";
      long long v14 = v11;
      __int16 v15 = v12;
      uint64_t v16 = 153;
      goto LABEL_21;
    }
    if (self->mReentrancyValue)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DCBB0);
      }
      __int16 v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
        sub_101082328();
      }

      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DCBD0);
      }
      int v18 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR)) {
        sub_101082044();
      }

      v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]");
      v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v19 file:v20 lineNumber:157 isFatal:0 description:"re-entrant call to CRLEditorController"];

      int64_t mReentrancyValue = self->mReentrancyValue;
      self->int64_t mReentrancyValue = mReentrancyValue + 1;
      if (mReentrancyValue)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DCBF0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010822A0();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DCC10);
        }
        v22 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v22);
        }
        sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Intentionally crashing for reentrant setSelectionPath: call to avoid mangled state", v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[CRLEditorController setSelectionPath:withFlags:]");
        v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]");
        uint64_t v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
        +[CRLAssertionHandler handleFailureInFunction:v30 file:v31 lineNumber:169 isFatal:1 description:"Intentionally crashing for reentrant setSelectionPath: call to avoid mangled state"];

        SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v32, v33);
        abort();
      }
    }
    else
    {
      self->int64_t mReentrancyValue = 1;
    }
    long long v11 = +[NSMutableArray array];
    v36 = self->mSelectionPath;
    v37 = [(CRLEditorController *)self selectionPath];
    unsigned __int8 v38 = [v5 isEqual:v37];

    if (a4 & 0x400) == 0 && (v38)
    {
      int v39 = 0;
LABEL_194:
      --self->mReentrancyValue;
      [(CRLEditorController *)self notifyResignedTextInputEditors];
      if (v39)
      {
        id v129 = objc_alloc((Class)NSDictionary);
        v130 = +[NSNumber numberWithUnsignedInteger:a4];
        id v131 = [v129 initWithObjectsAndKeys:v130, @"CRLEditorControllerSelectionFlagsKey", v11, @"CRLEditorControllerEditorsKey", v36, @"CRLEditorControllerOldSelectionPathKey", 0];

        v132 = +[NSNotificationCenter defaultCenter];
        [v132 postNotificationName:@"CRLEditorControllerSelectionPathDidChangeNotification" object:self userInfo:v131];
      }
      id v133 = [(NSMutableArray *)self->mBlocksToPerform copy];
      mBlocksToPerform = self->mBlocksToPerform;
      self->mBlocksToPerform = 0;

      [v133 makeObjectsPerformSelector:"invoke"];
      goto LABEL_197;
    }
    v40 = [(CRLEditorController *)self selectionPath];
    unsigned int v41 = [v5 isEqual:v40];

    if (qword_101719C98 != -1) {
      dispatch_once(&qword_101719C98, &stru_1014DCC30);
    }
    v42 = off_10166C4D8;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEBUG)) {
      sub_101082180(self, v5, v42);
    }
    int v139 = v41 ^ 1;

    v146 = +[NSMutableArray array];
    v43 = [(CRLSelectionPath *)v36 orderedSelections];
    if (![v43 count])
    {
      v70 = [v5 orderedSelections];
      id v71 = [v70 count];

      if (!v71) {
        goto LABEL_71;
      }
      v43 = [v5 selectionAtIndex:0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DCC50);
        }
        v72 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v72, OS_LOG_TYPE_ERROR)) {
          sub_1010820F0();
        }

        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DCC70);
        }
        v73 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v73, OS_LOG_TYPE_ERROR)) {
          sub_101082044();
        }

        v74 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]");
        v75 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
        +[CRLAssertionHandler handleFailureInFunction:v74, v75, 218, 0, "Least specific selection MUST be a board selection. Selection path is malformed. %@", v5 file lineNumber isFatal description];
      }
    }

LABEL_71:
    location = (id *)&self->mSelectionPath;
    v142 = v11;
    v44 = v5;
    v45 = [v5 orderedSelections];
    v46 = [v45 objectEnumerator];

    v47 = [v46 nextObject];
    long long v168 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    v48 = [(CRLEditorController *)self currentEditors];
    v49 = [v48 objectEnumerator];

    id obj = v49;
    id v50 = [v49 countByEnumeratingWithState:&v168 objects:v183 count:16];
    v141 = self;
    v138 = v36;
    id v151 = v46;
    if (v50)
    {
      id v51 = v50;
      id v52 = 0;
      uint64_t v53 = *(void *)v169;
      uint64_t v54 = (uint64_t)v47;
LABEL_73:
      uint64_t v55 = 0;
      while (1)
      {
        v56 = v52;
        v47 = (void *)v54;
        if (*(void *)v169 != v53) {
          objc_enumerationMutation(obj);
        }
        v57 = *(void **)(*((void *)&v168 + 1) + 8 * v55);
        v58 = [(CRLEditorController *)v141 currentEditors];
        v59 = [v58 objectAtIndex:0];

        if (v57 == v59)
        {
          if (v47)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              unsigned int v62 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014DCC90);
              }
              v63 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67110146;
                *(_DWORD *)v176 = v62;
                *(_WORD *)&v176[4] = 2082;
                *(void *)&v176[6] = "-[CRLEditorController setSelectionPath:withFlags:]";
                *(_WORD *)&v176[14] = 2082;
                *(void *)&v176[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m";
                *(_WORD *)&v176[24] = 1024;
                *(_DWORD *)&v176[26] = 234;
                __int16 v177 = 2112;
                id v178 = v44;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v63, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Least specific selection MUST be a board selection. Selection path is malformed. %@", buf, 0x2Cu);
              }

              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014DCCB0);
              }
              v64 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_ERROR))
              {
                id v67 = +[CRLAssertionHandler packedBacktraceString];
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v176 = v62;
                *(_WORD *)&v176[4] = 2114;
                *(void *)&v176[6] = v67;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v64, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
              }
              v65 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]");
              v66 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
              +[CRLAssertionHandler handleFailureInFunction:v65, v66, 234, 0, "Least specific selection MUST be a board selection. Selection path is malformed. %@", v44 file lineNumber isFatal description];
            }
          }
        }
        else if (!v47 {
               || ([v57 shouldRemainOnEditorStackForSelection:v47 inSelectionPath:v44 withNewEditors:v146] & 1) == 0)
        }
        {
          id v137 = v57;
          int v69 = 1;
          self = v141;
          v36 = v138;
          id v52 = v56;
          v46 = v151;
          goto LABEL_108;
        }
        id v60 = v57;
        v61 = v56;

        v46 = v151;
        uint64_t v54 = [v151 nextObject];

        id v52 = v60;
        [v146 addObject:v52];
        if (v51 == (id)++v55)
        {
          id v68 = [obj countByEnumeratingWithState:&v168 objects:v183 count:16];
          id v51 = v68;
          if (!v68)
          {
            id v137 = 0;
            v47 = (void *)v54;
            self = v141;
            v36 = v138;
            goto LABEL_107;
          }
          goto LABEL_73;
        }
      }
    }
    id v137 = 0;
    id v52 = 0;
LABEL_107:
    int v69 = v139;
LABEL_108:

    id v5 = v44;
    id obja = v52;
    if (v47)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [v52 shouldDiscardAllSubselectionsStartingWithSelection:v47 withNewEditorStack:v146 selectionPath:v44])
      {
        [v44 selectionPathPoppingOffSelection:v47];
        id v76 = v44;
        id v5 = (id)objc_claimAutoreleasedReturnValue();
        long long v11 = v142;
      }
      else
      {
        uint64_t v77 = [v52 nextEditorForSelection:v47 withNewEditorStack:v146 selectionPath:v44];
        if (v77)
        {
          v78 = (void *)v77;
          long long v11 = v142;
          while (1)
          {
            [v146 addObject:v78];
            if (v46)
            {
              uint64_t v79 = [v46 nextObject];

              v47 = (void *)v79;
              if (!v79)
              {
                id v76 = v78;
                goto LABEL_141;
              }
            }
            if ((objc_opt_respondsToSelector() & 1) != 0
              && [v78 shouldDiscardAllSubselectionsStartingWithSelection:v47 withNewEditorStack:v146 selectionPath:v5])
            {
              uint64_t v89 = [v5 selectionPathPoppingOffSelection:v47];

              id v76 = v78;
              id v5 = (id)v89;
              goto LABEL_141;
            }
            id v76 = v78;
            v78 = [v76 nextEditorForSelection:v47 withNewEditorStack:v146 selectionPath:v5];

            if (!v78) {
              break;
            }

            v46 = v151;
          }
          unsigned int v84 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014DCD10);
          }
          v85 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v85, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110658;
            *(_DWORD *)v176 = v84;
            *(_WORD *)&v176[4] = 2082;
            *(void *)&v176[6] = "-[CRLEditorController setSelectionPath:withFlags:]";
            *(_WORD *)&v176[14] = 2082;
            *(void *)&v176[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m";
            *(_WORD *)&v176[24] = 1024;
            *(_DWORD *)&v176[26] = 307;
            __int16 v177 = 2112;
            id v178 = v76;
            __int16 v179 = 2112;
            v180 = v47;
            __int16 v181 = 2112;
            id v182 = v5;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v85, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d oldEditor %@ didn't push editor for selection %@ in selection path %@", buf, 0x40u);
          }

          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014DCD30);
          }
          v86 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v86, OS_LOG_TYPE_ERROR))
          {
            id v135 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v176 = v84;
            *(_WORD *)&v176[4] = 2114;
            *(void *)&v176[6] = v135;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v86, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v87 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]");
          v88 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
          +[CRLAssertionHandler handleFailureInFunction:v87, v88, 307, 0, "oldEditor %@ didn't push editor for selection %@ in selection path %@", v76, v47, v5 file lineNumber isFatal description];

LABEL_141:
          id v52 = obja;
        }
        else
        {
          unsigned int v80 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          long long v11 = v142;
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014DCCD0);
          }
          v81 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v81, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110658;
            *(_DWORD *)v176 = v80;
            *(_WORD *)&v176[4] = 2082;
            *(void *)&v176[6] = "-[CRLEditorController setSelectionPath:withFlags:]";
            *(_WORD *)&v176[14] = 2082;
            *(void *)&v176[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m";
            *(_WORD *)&v176[24] = 1024;
            *(_DWORD *)&v176[26] = 277;
            __int16 v177 = 2112;
            id v178 = obja;
            __int16 v179 = 2112;
            v180 = v47;
            __int16 v181 = 2112;
            id v182 = v5;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v81, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d oldEditor %@ didn't push editor for selection %@ in selection path %@", buf, 0x40u);
          }

          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014DCCF0);
          }
          v82 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v82, OS_LOG_TYPE_ERROR)) {
            sub_101082044();
          }

          +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]");
          id v76 = (id)objc_claimAutoreleasedReturnValue();
          v83 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
          +[CRLAssertionHandler handleFailureInFunction:v76, v83, 277, 0, "oldEditor %@ didn't push editor for selection %@ in selection path %@", obja, v47, v5 file lineNumber isFatal description];

          id v52 = obja;
        }
      }

      v46 = v151;
    }
    else
    {
      long long v11 = v142;
    }

    int v140 = v69;
    if (v52)
    {
      v90 = [(CRLSelectionPath *)v36 orderedSelections];
      v91 = [v90 objectEnumerator];

      v92 = [v91 nextObject];
      v93 = [v5 orderedSelections];
      v94 = [v93 objectEnumerator];

      id v152 = v94;
      v95 = [v94 nextObject];
      long long v164 = 0u;
      long long v165 = 0u;
      long long v166 = 0u;
      long long v167 = 0u;
      v147 = [v146 objectEnumerator];
      id v96 = [v147 countByEnumeratingWithState:&v164 objects:v174 count:16];
      if (v96)
      {
        id v97 = v96;
        uint64_t v143 = 0;
        uint64_t v149 = *(void *)v165;
        do
        {
          v98 = 0;
          unint64_t v99 = (unint64_t)v92;
          unint64_t v100 = (unint64_t)v95;
          do
          {
            if (*(void *)v165 != v149) {
              objc_enumerationMutation(v147);
            }
            id v101 = *(id *)(*((void *)&v164 + 1) + 8 * (void)v98);
            if (v99 | v100 && ([(id)v99 isEqual:v100] & 1) == 0)
            {
              v102 = [v101 selectionWillChangeFromSelection:v99 toSelection:v100 withFlags:a4 inSelectionPath:v5 withNewEditors:v146];
              v103 = v102;
              if (v102 && ([v102 isEqual:v100] & 1) == 0)
              {
                if (qword_101719CA0 != -1) {
                  dispatch_once(&qword_101719CA0, &stru_1014DCD50);
                }
                v104 = off_10166C4E0;
                if (os_log_type_enabled((os_log_t)v104, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412802;
                  *(void *)v176 = v101;
                  *(_WORD *)&v176[8] = 2112;
                  *(void *)&v176[10] = v100;
                  *(_WORD *)&v176[18] = 2112;
                  *(void *)&v176[20] = v103;
                  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v104, OS_LOG_TYPE_DEBUG, "editor %@ modified its selection component from %@ to %@", buf, 0x20u);
                }

                v105 = [v5 orderedSelections];
                v144 = v5;
                id v106 = [v105 mutableCopy];

                [v106 replaceObjectAtIndex:(char *)v98 + v143 withObject:v103];
                id v107 = +[CRLSelectionPath selectionPathWithSelectionArray:v106];

                id v5 = v107;
                long long v11 = v142;
                id v52 = obja;
              }
              [v11 addObject:v101];
            }
            if (v101 == v52)
            {

              v91 = 0;
              v92 = 0;
            }
            else
            {
              v92 = [v91 nextObject];
            }

            v95 = [v152 nextObject];

            v98 = (char *)v98 + 1;
            unint64_t v99 = (unint64_t)v92;
            unint64_t v100 = (unint64_t)v95;
          }
          while (v97 != v98);
          id v97 = [v147 countByEnumeratingWithState:&v164 objects:v174 count:16];
          v143 += (uint64_t)v98;
        }
        while (v97);
      }

      self = v141;
      v36 = v138;
    }
    v108 = v137;
    BOOL v150 = v137 != 0;
    if (v137) {
      [(CRLEditorController *)self p_popEditor:v137];
    }
    objc_storeStrong(location, v5);
    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    id v153 = v146;
    id v109 = [v153 countByEnumeratingWithState:&v160 objects:v173 count:16];
    if (v109)
    {
      id v110 = v109;
      uint64_t v111 = *(void *)v161;
      do
      {
        for (i = 0; i != v110; i = (char *)i + 1)
        {
          if (*(void *)v161 != v111) {
            objc_enumerationMutation(v153);
          }
          uint64_t v113 = *(void *)(*((void *)&v160 + 1) + 8 * i);
          if (([(NSMutableArray *)self->mEditorStack containsObject:v113] & 1) == 0)
          {
            [(CRLEditorController *)self p_pushEditor:v113];
            BOOL v150 = 1;
          }
        }
        id v110 = [v153 countByEnumeratingWithState:&v160 objects:v173 count:16];
      }
      while (v110);
    }

    v114 = obja;
    if (obja)
    {
      id v145 = v5;
      v115 = [(CRLSelectionPath *)v36 orderedSelections];
      v116 = [v115 objectEnumerator];

      v117 = [v116 nextObject];
      v118 = [*location orderedSelections];
      v119 = [v118 objectEnumerator];

      v120 = [v119 nextObject];
      long long v156 = 0u;
      long long v157 = 0u;
      long long v158 = 0u;
      long long v159 = 0u;
      v121 = [v153 objectEnumerator];
      id v122 = [v121 countByEnumeratingWithState:&v156 objects:v172 count:16];
      if (v122)
      {
        id v123 = v122;
        uint64_t v124 = *(void *)v157;
        do
        {
          v125 = 0;
          unint64_t v126 = (unint64_t)v117;
          unint64_t v127 = (unint64_t)v120;
          do
          {
            if (*(void *)v157 != v124) {
              objc_enumerationMutation(v121);
            }
            id v128 = *(id *)(*((void *)&v156 + 1) + 8 * (void)v125);
            if (v126 | v127 && ([(id)v126 isEqual:v127] & 1) == 0) {
              [v128 selectionDidChangeFromSelection:v126 toSelection:v127 withFlags:a4];
            }
            if (v128 == obja)
            {

              v116 = 0;
              v117 = 0;
            }
            else
            {
              v117 = [v116 nextObject];
            }

            v120 = [v119 nextObject];

            v125 = (char *)v125 + 1;
            unint64_t v126 = (unint64_t)v117;
            unint64_t v127 = (unint64_t)v120;
          }
          while (v123 != v125);
          id v123 = [v121 countByEnumeratingWithState:&v156 objects:v172 count:16];
        }
        while (v123);
      }

      id v5 = v145;
      self = v141;
      long long v11 = v142;
      v108 = v137;
      v36 = v138;
      v114 = obja;
    }
    [(CRLEditorController *)self p_refreshTextInputEditorWithFlags:a4];
    if (v150) {
      [(CRLEditorController *)self p_didChangeCurrentEditors];
    }

    int v39 = v140;
    goto LABEL_194;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DCB30);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101081F34();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DCB50);
  }
  objc_super v34 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v34);
  }
  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController setSelectionPath:withFlags:]");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  long long v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
  +[CRLAssertionHandler handleFailureInFunction:v5 file:v11 lineNumber:146 isFatal:0 description:"Should never set a nil selection path on the editor controller!"];
LABEL_197:
}

- (void)performBlockAfterSettingSelection:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCD70);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010824C0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCD90);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController performBlockAfterSettingSelection:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:424 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCDB0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101082438();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCDD0);
    }
    id v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController performBlockAfterSettingSelection:]");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    long long v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:425 isFatal:0 description:"Should send in a non-nil block to this method."];
    goto LABEL_27;
  }
  if (self->mReentrancyValue)
  {
    mBlocksToPerform = self->mBlocksToPerform;
    if (mBlocksToPerform) {
      id v9 = mBlocksToPerform;
    }
    else {
      id v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    }
    long long v13 = self->mBlocksToPerform;
    self->mBlocksToPerform = v9;

    long long v14 = self->mBlocksToPerform;
    id v11 = [v4 copy];
    long long v12 = objc_retainBlock(v11);
    [(NSMutableArray *)v14 addObject:v12];
LABEL_27:

    goto LABEL_28;
  }
  v4[2](v4);
LABEL_28:
}

- (void)setSelection:(id)a3 forEditor:(id)a4
{
}

- (void)setSelection:(id)a3 forEditor:(id)a4 withFlags:(unint64_t)a5
{
  id v8 = a3;
  id v12 = [(CRLEditorController *)self selectionForEditor:a4];
  id v9 = [(CRLEditorController *)self selectionPath];
  id v10 = [v9 selectionPathPoppingOffSelection:v12];

  id v11 = [v10 selectionPathWithAppendedSelection:v8];

  [(CRLEditorController *)self setSelectionPath:v11 withFlags:a5];
}

- (void)setSelectionPathToPopEditor:(id)a3
{
  id v4 = [(CRLEditorController *)self selectionPathToPopEditor:a3];
  [(CRLEditorController *)self setSelectionPath:v4];
}

- (void)setSelectionPathToPopToEditor:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLEditorController *)self selectionPath];
  id v11 = [v5 orderedSelections];

  id v6 = [(CRLEditorController *)self selectionForEditor:v4];

  id v7 = (char *)[v11 indexOfObject:v6];
  if (v7 < (char *)[v11 count] - 1)
  {
    id v8 = [v11 objectAtIndex:v7 + 1];
    id v9 = [(CRLEditorController *)self selectionPath];
    id v10 = [v9 selectionPathPoppingOffSelection:v8];

    [(CRLEditorController *)self setSelectionPath:v10];
  }
}

- (void)pushSelection:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCDF0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101082548();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCE10);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController pushSelection:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 466, 0, "invalid nil value for '%{public}s'", "selection");
  }
  id v8 = [(CRLEditorController *)self selectionPath];
  id v9 = [v8 selectionPathWithAppendedSelection:v4];
  [(CRLEditorController *)self setSelectionPath:v9];
}

- (id)selectionForEditor:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_12:
    id v9 = 0;
    goto LABEL_14;
  }
  id v5 = [(NSMutableArray *)self->mEditorStack indexOfObject:v4];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCE30);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010825DC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCE50);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController selectionForEditor:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7, v8, 475, 0, "Editor %@ must be on the stack to retrieve its associated selection", v4 file lineNumber isFatal description];

    goto LABEL_12;
  }
  id v10 = v5;
  id v11 = [(CRLEditorController *)self selectionPath];
  id v9 = [v11 selectionAtIndex:v10];

LABEL_14:

  return v9;
}

- (id)selectionPathToPopEditor:(id)a3
{
  id v4 = [(CRLEditorController *)self selectionForEditor:a3];
  if (v4)
  {
    id v5 = [(CRLEditorController *)self selectionPath];
    id v6 = [v5 selectionPathPoppingOffSelection:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)refreshTextInputEditor
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCE70);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108266C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCE90);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController refreshTextInputEditor]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:495 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  [(CRLEditorController *)self p_refreshTextInputEditorWithFlags:0];
}

- (id)editorForEditAction:(SEL)a3 withSender:(id)a4
{
  return [(CRLEditorController *)self editorForEditAction:a3 withSender:a4 response:0];
}

- (id)editorForEditAction:(SEL)a3 withSender:(id)a4 response:(int64_t *)a5
{
  id v25 = a4;
  unint64_t v8 = [(CRLEditorController *)self editingDisabledReasons];
  id v9 = [(CRLEditorController *)self editingCoordinator];
  unsigned int v10 = [v9 canPerformUserAction];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(NSMutableArray *)self->mEditorStack reverseObjectEnumerator];
  id v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v24 = a5;
    unint64_t v13 = v8 | v10 ^ 1;
    uint64_t v14 = *(void *)v28;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v28 != v14) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * v15);
      if (objc_opt_respondsToSelector())
      {
        if (!v13
          || ((objc_opt_respondsToSelector() & 1) == 0
            ? (__int16 v17 = 0)
            : ([v16 permittedActionsForReasons:v13], __int16 v17 = objc_claimAutoreleasedReturnValue()),
              NSStringFromSelector(a3),
              int v18 = objc_claimAutoreleasedReturnValue(),
              unsigned int v19 = [v17 containsObject:v18],
              v18,
              v17,
              v19))
        {
          id v20 = [v16 canPerformEditorAction:a3 withSender:v25];
          if (v20) {
            break;
          }
        }
      }
      if (v12 == (id)++v15)
      {
        id v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v12) {
          goto LABEL_3;
        }
        int64_t v21 = 0;
        goto LABEL_19;
      }
    }
    int64_t v21 = (int64_t)v20;
    if (v20 == (id)1)
    {
      id v22 = v16;
      goto LABEL_20;
    }
LABEL_19:
    id v22 = 0;
LABEL_20:
    a5 = v24;
  }
  else
  {
    int64_t v21 = 0;
    id v22 = 0;
  }

  if (a5) {
    *a5 = v21;
  }

  return v22;
}

- (BOOL)anyEditorProhibitsAction:(SEL)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSMutableArray *)self->mEditorStack reverseObjectEnumerator];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ([v9 shouldProhibitAction:a3] & 1) != 0)
        {
          BOOL v10 = 1;
          goto LABEL_12;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (void)p_pushEditor:(id)a3
{
  id v4 = a3;
  if (qword_101719CA0 != -1) {
    dispatch_once(&qword_101719CA0, &stru_1014DCEB0);
  }
  id v5 = off_10166C4E0;
  if (os_log_type_enabled((os_log_t)off_10166C4E0, OS_LOG_TYPE_DEBUG))
  {
    sub_101082810((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    if (v4) {
      goto LABEL_5;
    }
  }
  else if (v4)
  {
LABEL_5:
    if ([(NSMutableArray *)self->mEditorStack indexOfObjectIdenticalTo:v4] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DCF10);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101082788();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DCF30);
      }
      long long v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      long long v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController p_pushEditor:]");
      long long v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:603 isFatal:0 description:"shouldn't push the same editor twice"];
    }
    if ([(NSMutableArray *)self->mEditorStack indexOfObjectIdenticalTo:v4] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSMutableArray *)self->mEditorStack addObject:v4];
      if (objc_opt_respondsToSelector()) {
        [v4 didBecomeCurrentEditorForEditorController:self];
      }
    }
    goto LABEL_28;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DCED0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010826F4();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DCEF0);
  }
  long long v15 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v15);
  }
  uint64_t v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController p_pushEditor:]");
  __int16 v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 599, 0, "invalid nil value for '%{public}s'", "newEditor");

LABEL_28:
}

- (void)p_popEditor:(id)a3
{
  id v4 = a3;
  if (qword_101719CA0 != -1) {
    dispatch_once(&qword_101719CA0, &stru_1014DCF50);
  }
  id v5 = off_10166C4E0;
  if (os_log_type_enabled((os_log_t)off_10166C4E0, OS_LOG_TYPE_DEBUG))
  {
    sub_101082998((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    if (v4) {
      goto LABEL_14;
    }
  }
  else if (v4)
  {
    goto LABEL_14;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DCF70);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101082904();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DCF90);
  }
  long long v12 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v12);
  }
  long long v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController p_popEditor:]");
  long long v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 619, 0, "invalid nil value for '%{public}s'", "poppedEditor");

LABEL_14:
  if ([(NSMutableArray *)self->mEditorStack indexOfObjectIdenticalTo:v4] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCFB0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108287C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DCFD0);
    }
    long long v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    uint64_t v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController p_popEditor:]");
    __int16 v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:620 isFatal:0 description:"shouldn't pop an editor that isn't on the stack"];
  }
  if (v4
    && [(NSMutableArray *)self->mEditorStack indexOfObjectIdenticalTo:v4] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    int v18 = (char *)[(NSMutableArray *)self->mEditorStack count] + 1;
    do
    {
      if (!--v18) {
        break;
      }
      id v19 = [(NSMutableArray *)self->mEditorStack lastObject];
      id WeakRetained = objc_loadWeakRetained((id *)&self->mTextInputEditor);

      if (v19 == WeakRetained)
      {
        if (objc_opt_respondsToSelector()) {
          [v19 willResignTextInputEditor];
        }
        id v21 = objc_loadWeakRetained((id *)&self->mTextInputEditor);

        if (v21)
        {
          mResignedTextInputEditors = self->mResignedTextInputEditors;
          id v23 = objc_loadWeakRetained((id *)&self->mTextInputEditor);
          [(NSMutableArray *)mResignedTextInputEditors addObject:v23];
        }
        objc_storeWeak((id *)&self->mTextInputEditor, 0);
      }
      if (objc_opt_respondsToSelector()) {
        [v19 willResignCurrentEditor];
      }
      [(NSMutableArray *)self->mEditorStack removeLastObject];
    }
    while (v19 != v4);
  }
}

- (void)p_beginTransaction
{
}

- (void)p_endTransaction
{
  unint64_t mTransactionLevel = self->mTransactionLevel;
  if (mTransactionLevel) {
    goto LABEL_11;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DCFF0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101082A04();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DD010);
  }
  id v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v4);
  }
  id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController p_endTransaction]");
  uint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
  +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:660 isFatal:0 description:"unbalanced endTransaction"];

  unint64_t mTransactionLevel = self->mTransactionLevel;
  if (mTransactionLevel)
  {
LABEL_11:
    unint64_t v7 = mTransactionLevel - 1;
    self->unint64_t mTransactionLevel = v7;
    if (!v7)
    {
      if (self->mDidChangeTextInputEditor)
      {
        [(CRLEditorController *)self p_didChangeTextInputEditor];
        self->mDidChangeTextInputEditor = 0;
      }
      if (self->mDidChangeCurrentEditors)
      {
        [(CRLEditorController *)self p_didChangeCurrentEditors];
        self->mDidChangeCurrentEditors = 0;
      }
    }
  }
}

- (void)notifyResignedTextInputEditors
{
  if (!self->mIsReentrantResigningTextInputEditors)
  {
    self->mIsReentrantResigningTextInputEditors = 1;
    if ([(NSMutableArray *)self->mResignedTextInputEditors count])
    {
      unint64_t v3 = 0;
      do
      {
        id v4 = [(NSMutableArray *)self->mResignedTextInputEditors objectAtIndex:v3];
        if (objc_opt_respondsToSelector()) {
          [v4 didResignTextInputEditor];
        }

        ++v3;
      }
      while (v3 < (unint64_t)[(NSMutableArray *)self->mResignedTextInputEditors count]);
    }
    [(NSMutableArray *)self->mResignedTextInputEditors removeAllObjects];
    self->mIsReentrantResigningTextInputEditors = 0;
  }
}

- (void)enumerateEditorsOnStackUsingBlock:(id)a3
{
  mEditorStack = self->mEditorStack;
  id v5 = a3;
  id v6 = [(NSMutableArray *)mEditorStack reverseObjectEnumerator];
  [(CRLEditorController *)self p_enumerateEditorsWithEnumerator:v6 usingBlock:v5];
}

- (void)enumerateEditorsOnStackLeastToMostSpecificUsingBlock:(id)a3
{
  mEditorStack = self->mEditorStack;
  id v5 = a3;
  id v6 = [(NSMutableArray *)mEditorStack objectEnumerator];
  [(CRLEditorController *)self p_enumerateEditorsWithEnumerator:v6 usingBlock:v5];
}

- (void)p_enumerateEditorsWithEnumerator:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, char *))a4;
  char v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v13 != v10) {
        objc_enumerationMutation(v7);
      }
      v6[2](v6, *(void *)(*((void *)&v12 + 1) + 8 * v11), &v16);
      if (v16) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)currentEditorsOfClass:(Class)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->mEditorStack;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        if (objc_opt_isKindOfClass()) {
          [v4 addObject:v10];
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)mostSpecificCurrentEditorOfClass:(Class)a3
{
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    unint64_t v3 = [(NSMutableArray *)self->mEditorStack reverseObjectEnumerator];
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            id v9 = v8;

            goto LABEL_13;
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    id v9 = 0;
  }
  else
  {
    id v9 = [(NSMutableArray *)self->mEditorStack lastObject];
  }
LABEL_13:

  return v9;
}

- (id)mostSpecificCurrentEditorOfClass:(Class)a3 conformingToProtocol:(id)a4
{
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [(NSMutableArray *)self->mEditorStack reverseObjectEnumerator];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (!a3 || (objc_opt_isKindOfClass())
          && ([v12 conformsToProtocol:v6] & 1) != 0)
        {
          id v13 = v12;
          goto LABEL_13;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_13:

  return v13;
}

- (id)currentEditorsConformingToProtocol:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = self->mEditorStack;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "conformsToProtocol:", v4, (void)v13)) {
          [v5 addObject:v11];
        }
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)mostSpecificEditorConformingToProtocol:(id)a3
{
  return [(CRLEditorController *)self mostSpecificCurrentEditorOfClass:0 conformingToProtocol:a3];
}

- (void)setObject:(id)a3 forInspectorPropertyKey:(id)a4
{
}

- (void)removeObjectForInspectorPropertyKey:(id)a3
{
}

- (id)objectForInspectorPropertyKey:(id)a3
{
  return [(NSMutableDictionary *)self->mInspectorPropertyValueMap objectForKey:a3];
}

- (void)editorDidChangeSelectionAndWantsKeyboard:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD030);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101082AF8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD050);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditorController editorDidChangeSelectionAndWantsKeyboard:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditorController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 789, 0, "invalid nil value for '%{public}s'", "editor");
  }
  if (qword_101719CA0 != -1) {
    dispatch_once(&qword_101719CA0, &stru_1014DD070);
  }
  id v8 = off_10166C4E0;
  if (os_log_type_enabled((os_log_t)off_10166C4E0, OS_LOG_TYPE_DEBUG)) {
    sub_101082A8C((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
  }
  long long v15 = +[NSNotificationCenter defaultCenter];
  [v15 postNotificationName:@"CRLEditorControllerSelectionDidChangeAndWantsKeyboard" object:self userInfo:0];
}

- (void)p_refreshTextInputEditorWithFlags:(unint64_t)a3
{
  p_mTextInputEditor = &self->mTextInputEditor;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mTextInputEditor);
  objc_storeWeak((id *)p_mTextInputEditor, 0);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  Swift::String v33 = self;
  id v6 = [(NSMutableArray *)self->mEditorStack reverseObjectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v35;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && [v11 shouldBecomeTextInputEditor]
          && [v11 conformsToProtocol:&OBJC_PROTOCOL____TtP8Freeform18CRLTextInputEditor_])
        {
          uint64_t v12 = objc_opt_class();
          long long v18 = sub_100246DEC(v11, v12, 1, v13, v14, v15, v16, v17, (uint64_t)&OBJC_PROTOCOL____TtP8Freeform18CRLTextInputEditor_);
          objc_storeWeak((id *)p_mTextInputEditor, v18);

          goto LABEL_13;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  id v19 = objc_loadWeakRetained((id *)p_mTextInputEditor);
  if (WeakRetained != v19)
  {
    if (qword_101719CA0 != -1) {
      dispatch_once(&qword_101719CA0, &stru_1014DD090);
    }
    id v20 = off_10166C4E0;
    if (os_log_type_enabled((os_log_t)off_10166C4E0, OS_LOG_TYPE_DEBUG))
    {
      long long v30 = v20;
      id v31 = objc_loadWeakRetained((id *)p_mTextInputEditor);
      *(_DWORD *)buf = 134218498;
      unsigned int v41 = v33;
      __int16 v42 = 2112;
      id v43 = WeakRetained;
      __int16 v44 = 2112;
      id v45 = v31;
      _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%p Change text input editor from %@ to %@", buf, 0x20u);
    }
    if (objc_opt_respondsToSelector()) {
      [WeakRetained willResignTextInputEditor];
    }
    if (WeakRetained) {
      [(NSMutableArray *)v33->mResignedTextInputEditors addObject:WeakRetained];
    }
    id v21 = objc_loadWeakRetained((id *)p_mTextInputEditor);
    char v22 = objc_opt_respondsToSelector();

    if (v22)
    {
      id v23 = objc_loadWeakRetained((id *)p_mTextInputEditor);
      [v23 didBecomeTextInputEditor];

      id v24 = objc_loadWeakRetained((id *)p_mTextInputEditor);
      if (v24)
      {
        mResignedTextInputEditors = v33->mResignedTextInputEditors;
        id v26 = objc_loadWeakRetained((id *)p_mTextInputEditor);
        [(NSMutableArray *)mResignedTextInputEditors removeObject:v26];
      }
    }
    CFStringRef v38 = @"CRLEditorControllerSelectionFlagsKey";
    long long v27 = +[NSNumber numberWithUnsignedLongLong:a3];
    int v39 = v27;
    long long v28 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];

    long long v29 = +[NSNotificationCenter defaultCenter];
    [v29 postNotificationName:@"CRLEditorControllerDidChangeTextInputEditor" object:v33 userInfo:v28];
  }
}

- (void)p_didChangeTextInputEditor
{
  if (self->mTransactionLevel)
  {
    self->mDidChangeTextInputEditor = 1;
  }
  else
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 postNotificationName:@"CRLEditorControllerDidChangeTextInputEditor" object:self];
  }
}

- (void)p_didChangeCurrentEditors
{
  if (self->mTransactionLevel)
  {
    self->mDidChangeCurrentEditors = 1;
  }
  else
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 postNotificationName:@"CRLEditorControllerDidChangeCurrentEditors" object:self];
  }
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mEditingCoordinator);

  return (_TtC8Freeform21CRLEditingCoordinator *)WeakRetained;
}

- (BOOL)selectionChangeDisabled
{
  return self->mSelectionChangeDisabled;
}

- (void)setSelectionChangeDisabled:(BOOL)a3
{
  self->mSelectionChangeDisabled = a3;
}

- (unint64_t)editingDisabledReasons
{
  return self->mEditingDisabledReasons;
}

- (void)setEditingDisabledReasons:(unint64_t)a3
{
  self->mEditingDisabledReasons = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBlocksToPerform, 0);
  objc_storeStrong((id *)&self->mInspectorPropertyValueMap, 0);
  objc_storeStrong((id *)&self->mResignedTextInputEditors, 0);
  objc_destroyWeak((id *)&self->mTextInputEditor);
  objc_storeStrong((id *)&self->mSelectionPath, 0);
  objc_storeStrong((id *)&self->mEditorStack, 0);
  objc_storeStrong((id *)&self->mDebugName, 0);

  objc_destroyWeak((id *)&self->mEditingCoordinator);
}

@end