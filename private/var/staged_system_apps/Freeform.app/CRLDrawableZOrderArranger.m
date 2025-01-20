@interface CRLDrawableZOrderArranger
- (BOOL)canBringDrawablesForward;
- (BOOL)canSendDrawablesBackward;
- (BOOL)isZOrderChangeRecord:(id)a3;
- (BOOL)p_usingRelativeZOrder;
- (BOOL)shouldShowTextFitOptionsForSelectedDrawables;
- (BOOL)shouldShowWrapOptionsForSelectedDrawables;
- (BOOL)shouldShowZOrderOptionsForSelectedDrawables;
- (CRLCanvasEditor)canvasEditor;
- (CRLDrawableZOrderArranger)init;
- (CRLDrawableZOrderArranger)initWithCanvasEditor:(id)a3;
- (id)commandToSetZOrderOfInfos:(id)a3 toIndexes:(id)a4 coalesceable:(BOOL)a5;
- (id)p_selectedInfos;
- (id)p_zOrderSiblings;
- (id)p_zOrderSiblingsForRelativeOrder;
- (id)p_zOrderedSelectedObjects;
- (unint64_t)currentZValueForArrangeInspector;
- (unint64_t)indexOfNextHigherCanvasObject;
- (unint64_t)indexOfNextLowerCanvasObject;
- (unint64_t)maxZValueForArrangeInspector;
- (unint64_t)minZValueForArrangeInspector;
- (unint64_t)p_indexOfChildren:(id)a3 inContainer:(id)a4;
- (unint64_t)p_maxIndex;
- (unint64_t)p_maxRelativeZValueOfChildrenInTopLevelContainer:(id)a3;
- (unint64_t)p_maxZValueOfChildren:(id)a3 inContainer:(id)a4;
- (unint64_t)p_minIndex;
- (unint64_t)p_minZValueOfChildren:(id)a3 inContainer:(id)a4;
- (unint64_t)p_relativeIndexOfChildrenInTopLevelContainer:(id)a3;
- (unint64_t)p_zOrderIndex;
- (void)arrangeInspectorDidEndChangingZValue;
- (void)arrangeInspectorDidSetZValue:(unint64_t)a3 forContainer:(id)a4;
- (void)arrangeInspectorWillBeginChangingZValue;
- (void)moveBackForArrangeInspector;
- (void)moveFrontForArrangeInspector;
- (void)moveToBackForArrangeInspector;
- (void)moveToFrontForArrangeInspector;
- (void)registerTargetForChanges:(id)a3;
- (void)unregisterTargetForChanges:(id)a3;
@end

@implementation CRLDrawableZOrderArranger

- (CRLDrawableZOrderArranger)initWithCanvasEditor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLDrawableZOrderArranger;
  v5 = [(CRLDrawableZOrderArranger *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->mCanvasEditor, v4);
  }

  return v6;
}

- (CRLDrawableZOrderArranger)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_101501C28);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLDrawableZOrderArranger init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m";
    __int16 v17 = 1024;
    int v18 = 28;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_101501C48);
  }
  id v4 = off_10166B4A0;
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
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger init]");
  objc_super v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:28 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLDrawableZOrderArranger init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)commandToSetZOrderOfInfos:(id)a3 toIndexes:(id)a4 coalesceable:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [_TtC8Freeform34CRLCommandReorderContainerChildren alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v11 = [WeakRetained interactiveCanvasController];
  unsigned int v12 = [v11 board];
  __int16 v13 = [v12 rootContainer];
  v14 = [(CRLCommandReorderContainerChildren *)v9 initWithParentContainer:v13 childrenToMove:v7 targetIndices:v8];

  return v14;
}

- (void)registerTargetForChanges:(id)a3
{
  id v4 = a3;
  id v7 = [(CRLDrawableZOrderArranger *)self canvasEditor];
  v5 = [v7 interactiveCanvasController];
  v6 = [v5 changeNotifier];
  [v6 addObserver:v4 forChangeSourceOfClass:objc_opt_class()];
}

- (void)unregisterTargetForChanges:(id)a3
{
  id v4 = a3;
  id v7 = [(CRLDrawableZOrderArranger *)self canvasEditor];
  v5 = [v7 interactiveCanvasController];
  v6 = [v5 changeNotifier];
  [v6 removeObserver:v4 forChangeSourceOfClass:objc_opt_class()];
}

- (BOOL)isZOrderChangeRecord:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if ([v3 kind] == 1)
  {
    id v4 = [v3 details];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1004FC6CC;
    v7[3] = &unk_101501C70;
    v7[4] = &v8;
    [v4 enumeratePropertiesUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (unint64_t)minZValueForArrangeInspector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  id v4 = [WeakRetained interactiveCanvasController];
  unsigned int v5 = [v4 hasSelectedInfosInMultipleContainers];

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501C90);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010C0410();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501CB0);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger minZValueForArrangeInspector]");
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:64 isFatal:0 description:"Cannot get the current min z-value for a cross-container selection"];
  }
  return [(CRLDrawableZOrderArranger *)self p_minIndex];
}

- (unint64_t)maxZValueForArrangeInspector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  id v4 = [WeakRetained interactiveCanvasController];
  unsigned int v5 = [v4 hasSelectedInfosInMultipleContainers];

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501CD0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010C0498();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501CF0);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger maxZValueForArrangeInspector]");
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:70 isFatal:0 description:"Cannot get the current max z-value for a cross-container selection"];
  }
  return [(CRLDrawableZOrderArranger *)self p_maxIndex];
}

- (unint64_t)currentZValueForArrangeInspector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  id v4 = [WeakRetained interactiveCanvasController];
  unsigned int v5 = [v4 hasSelectedInfosInMultipleContainers];

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501D10);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010C0520();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501D30);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger currentZValueForArrangeInspector]");
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:76 isFatal:0 description:"Cannot get the current z-value for a cross-container selection"];
  }
  unint64_t result = [(CRLDrawableZOrderArranger *)self p_zOrderIndex];
  if (result == 0x7FFFFFFFFFFFFFFFLL) {
    return [(CRLDrawableZOrderArranger *)self p_minIndex];
  }
  return result;
}

- (BOOL)canSendDrawablesBackward
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  id v4 = [WeakRetained interactiveCanvasController];

  if (![v4 hasSelectedInfosInMultipleContainers])
  {
    unint64_t v14 = [(CRLDrawableZOrderArranger *)self currentZValueForArrangeInspector];
    __int16 v15 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
    id v16 = [v15 count];

    if ((unint64_t)v16 < 2)
    {
      int v18 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
      id v19 = [v18 count];

      if (v19 == (id)1)
      {
        unint64_t v20 = [(CRLDrawableZOrderArranger *)self indexOfNextLowerCanvasObject];
        BOOL v17 = v14 != 0x7FFFFFFFFFFFFFFFLL && v14 > v20;
        goto LABEL_21;
      }
    }
    else if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v17 = v14 > [(CRLDrawableZOrderArranger *)self minZValueForArrangeInspector];
LABEL_21:
      BOOL v13 = v17;
      goto LABEL_25;
    }
    BOOL v13 = 0;
    goto LABEL_25;
  }
  unsigned int v5 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v6 = [v4 containersForSelection];
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        unint64_t v12 = [(CRLDrawableZOrderArranger *)self p_indexOfChildren:v5 inContainer:v11];
        if (v12 != 0x7FFFFFFFFFFFFFFFLL
          && v12 > [(CRLDrawableZOrderArranger *)self p_minZValueOfChildren:v5 inContainer:v11])
        {
          BOOL v13 = 1;
          goto LABEL_16;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_16:

LABEL_25:
  return v13;
}

- (BOOL)canBringDrawablesForward
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  id v4 = [WeakRetained interactiveCanvasController];

  if (![v4 hasSelectedInfosInMultipleContainers])
  {
    unint64_t v14 = [(CRLDrawableZOrderArranger *)self currentZValueForArrangeInspector];
    __int16 v15 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
    id v16 = [v15 count];

    if ((unint64_t)v16 < 2)
    {
      int v18 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
      id v19 = [v18 count];

      if (v19 == (id)1)
      {
        unint64_t v20 = [(CRLDrawableZOrderArranger *)self indexOfNextHigherCanvasObject];
        BOOL v17 = v14 == 0x7FFFFFFFFFFFFFFFLL || v14 >= v20;
        goto LABEL_21;
      }
    }
    else if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v17 = v14 >= [(CRLDrawableZOrderArranger *)self maxZValueForArrangeInspector];
LABEL_21:
      BOOL v13 = !v17;
      goto LABEL_25;
    }
    BOOL v13 = 0;
    goto LABEL_25;
  }
  unsigned int v5 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v6 = [v4 containersForSelection];
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        unint64_t v12 = [(CRLDrawableZOrderArranger *)self p_indexOfChildren:v5 inContainer:v11];
        if (v12 != 0x7FFFFFFFFFFFFFFFLL
          && v12 < [(CRLDrawableZOrderArranger *)self p_maxZValueOfChildren:v5 inContainer:v11])
        {
          BOOL v13 = 1;
          goto LABEL_16;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_16:

LABEL_25:
  return v13;
}

- (void)arrangeInspectorWillBeginChangingZValue
{
  self->mCanCoalesceZOrderCommand = 0;
  p_mCanvasEditor = &self->mCanvasEditor;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  [WeakRetained willChangeValueForKey:@"canBringDrawablesForward"];

  id v4 = objc_loadWeakRetained((id *)p_mCanvasEditor);
  [v4 willChangeValueForKey:@"canSendDrawablesBackward"];

  id v5 = objc_loadWeakRetained((id *)p_mCanvasEditor);
  v6 = [v5 interactiveCanvasController];
  id v7 = [v6 commandController];
  [v7 openGroup];

  id v10 = objc_loadWeakRetained((id *)p_mCanvasEditor);
  id v8 = [v10 interactiveCanvasController];
  uint64_t v9 = [v8 commandController];
  [v9 enableProgressiveEnqueuingInCurrentGroup];
}

- (void)arrangeInspectorDidSetZValue:(unint64_t)a3 forContainer:(id)a4
{
  id v6 = a4;
  p_mCanvasEditor = &self->mCanvasEditor;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  uint64_t v9 = [WeakRetained interactiveCanvasController];
  unsigned int v10 = [v9 hasSelectedInfosInMultipleContainers];

  if (!v6 && v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501D50);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010C0630();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501D70);
    }
    uint64_t v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    unint64_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger arrangeInspectorDidSetZValue:forContainer:]");
    BOOL v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 147, 0, "If we have a cross-container selection, the container whose z-order is being changed must be specified!");

    unint64_t v14 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
    goto LABEL_16;
  }
  unint64_t v14 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
  if (!v6)
  {
LABEL_16:
    v21 = [(CRLDrawableZOrderArranger *)self p_zOrderedSelectedObjects];
    goto LABEL_17;
  }
  uint64_t v15 = objc_opt_class();
  id v16 = [v6 childInfos];
  uint64_t v17 = sub_1002469D0(v15, v16);
  int v18 = (void *)v17;
  id v19 = &__NSArray0__struct;
  if (v17) {
    id v19 = (void *)v17;
  }
  id v20 = v19;

  v21 = [v20 crl_arrayWithObjectsInSet:v14];

LABEL_17:
  long long v22 = [v21 count];
  if (v22)
  {
    long long v23 = v22;
    unint64_t v24 = [(CRLDrawableZOrderArranger *)self p_minZValueOfChildren:v14 inContainer:v6];
    unint64_t v25 = [(CRLDrawableZOrderArranger *)self p_maxZValueOfChildren:v14 inContainer:v6];
    if (v25 < v24)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501D90);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010C05A8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501DB0);
      }
      v26 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v26);
      }
      +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger arrangeInspectorDidSetZValue:forContainer:]");
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"];
      +[CRLAssertionHandler handleFailureInFunction:v27 file:v28 lineNumber:166 isFatal:0 description:"Max index for z-order is below min index! This is not good. Skipping z-order operation entirely."];
LABEL_44:

      goto LABEL_45;
    }
    unint64_t v29 = v25;
    if ([(CRLDrawableZOrderArranger *)self p_usingRelativeZOrder])
    {
      v30 = [(CRLDrawableZOrderArranger *)self p_zOrderSiblingsForRelativeOrder];
      v31 = [v30 objectAtIndexedSubscript:a3];

      v32 = +[NSSet setWithObject:v31];
      a3 = [(CRLDrawableZOrderArranger *)self p_indexOfChildren:v32 inContainer:0];

      p_mCanvasEditor = &self->mCanvasEditor;
    }
    if (a3 >= v29) {
      unint64_t v33 = v29;
    }
    else {
      unint64_t v33 = a3;
    }
    if (a3 >= v24) {
      v34 = (char *)v33;
    }
    else {
      v34 = (char *)v24;
    }
    if (v34 != (char *)[(CRLDrawableZOrderArranger *)self p_indexOfChildren:v14 inContainer:v6])
    {
      id v27 = [objc_alloc((Class)NSIndexSet) initWithIndexesInRange:v34 - v23 + 1, v23];
      id v35 = objc_loadWeakRetained((id *)p_mCanvasEditor);
      v28 = [v35 interactiveCanvasController];

      v36 = [v28 commandController];
      if (!v6)
      {
        v37 = [v28 topLevelContainerInfoForEditing];
        v38 = (objc_class *)objc_opt_class();
        sub_100246E2C(v37, v38, 1, v39, v40, v41, v42, v43, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);
        id v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      v44 = [CRLCanvasCommandSelectionBehavior alloc];
      id v45 = objc_loadWeakRetained((id *)p_mCanvasEditor);
      v46 = [(CRLCanvasCommandSelectionBehavior *)v44 initWithCanvasEditor:v45 type:2];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v47 = (objc_class *)objc_opt_class();
        v48 = sub_10024715C(v47, v6);
        v52 = [v21 crl_arrayOfObjectsPassingTest:&stru_101501DF0];
        v49 = v46;
        v50 = v36;
        v51 = [[_TtC8Freeform34CRLCommandReorderContainerChildren alloc] initWithParentContainer:v48 childrenToMove:v52 targetIndices:v27];
        [v50 enqueueCommand:v51 withSelectionBehavior:v49];
        self->mCanCoalesceZOrderCommand = 1;

        v36 = v50;
        v46 = v49;
      }
      else
      {
        v48 = [(CRLDrawableZOrderArranger *)self commandToSetZOrderOfInfos:v21 toIndexes:v27 coalesceable:self->mCanCoalesceZOrderCommand];
        if (v48)
        {
          [v36 enqueueCommand:v48 withSelectionBehavior:v46];
          self->mCanCoalesceZOrderCommand = 1;
        }
      }

      goto LABEL_44;
    }
  }
LABEL_45:
}

- (void)arrangeInspectorDidEndChangingZValue
{
  p_mCanvasEditor = &self->mCanvasEditor;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  [WeakRetained didChangeValueForKey:@"canBringDrawablesForward"];

  id v4 = objc_loadWeakRetained((id *)p_mCanvasEditor);
  [v4 didChangeValueForKey:@"canSendDrawablesBackward"];

  id v7 = objc_loadWeakRetained((id *)p_mCanvasEditor);
  id v5 = [v7 interactiveCanvasController];
  id v6 = [v5 commandController];
  [v6 closeGroup];
}

- (void)moveToBackForArrangeInspector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  id v4 = [WeakRetained interactiveCanvasController];

  id v5 = [v4 commandController];
  [(CRLDrawableZOrderArranger *)self arrangeInspectorWillBeginChangingZValue];
  [v5 openGroup];
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"Send to Back" value:0 table:@"UndoStrings"];

  [v5 setCurrentGroupActionString:v7];
  if ([v4 hasSelectedInfosInMultipleContainers])
  {
    id v19 = v7;
    id v8 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = [v4 containersForSelection];
    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          unint64_t v15 = [(CRLDrawableZOrderArranger *)self p_indexOfChildren:v8 inContainer:v14];
          unint64_t v16 = [(CRLDrawableZOrderArranger *)self p_minZValueOfChildren:v8 inContainer:v14];
          if (v15 != v16) {
            [(CRLDrawableZOrderArranger *)self arrangeInspectorDidSetZValue:v16 forContainer:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    id v7 = v19;
  }
  else
  {
    unint64_t v17 = [(CRLDrawableZOrderArranger *)self currentZValueForArrangeInspector];
    unint64_t v18 = [(CRLDrawableZOrderArranger *)self minZValueForArrangeInspector];
    if (v17 != v18) {
      [(CRLDrawableZOrderArranger *)self arrangeInspectorDidSetZValue:v18 forContainer:0];
    }
  }
  [v5 closeGroup];
  [(CRLDrawableZOrderArranger *)self arrangeInspectorDidEndChangingZValue];
}

- (void)moveBackForArrangeInspector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  id v4 = [WeakRetained interactiveCanvasController];

  id v5 = [v4 commandController];
  [(CRLDrawableZOrderArranger *)self arrangeInspectorWillBeginChangingZValue];
  [v5 openGroup];
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"Send Backward" value:0 table:@"UndoStrings"];

  [v5 setCurrentGroupActionString:v7];
  if ([v4 hasSelectedInfosInMultipleContainers])
  {
    unint64_t v17 = v7;
    id v8 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = [v4 containersForSelection];
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          unint64_t v15 = [(CRLDrawableZOrderArranger *)self p_indexOfChildren:v8 inContainer:v14];
          if (v15 > [(CRLDrawableZOrderArranger *)self p_minZValueOfChildren:v8 inContainer:v14])[(CRLDrawableZOrderArranger *)self arrangeInspectorDidSetZValue:v15 - 1 forContainer:v14]; {
        }
          }
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    id v7 = v17;
  }
  else
  {
    unint64_t v16 = [(CRLDrawableZOrderArranger *)self currentZValueForArrangeInspector];
    if (v16 > [(CRLDrawableZOrderArranger *)self minZValueForArrangeInspector]) {
      [(CRLDrawableZOrderArranger *)self arrangeInspectorDidSetZValue:[(CRLDrawableZOrderArranger *)self indexOfNextLowerCanvasObject] forContainer:0];
    }
  }
  [v5 closeGroup];
  [(CRLDrawableZOrderArranger *)self arrangeInspectorDidEndChangingZValue];
}

- (void)moveFrontForArrangeInspector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  id v4 = [WeakRetained interactiveCanvasController];

  id v5 = [v4 commandController];
  [(CRLDrawableZOrderArranger *)self arrangeInspectorWillBeginChangingZValue];
  [v5 openGroup];
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"Bring Forward" value:0 table:@"UndoStrings"];

  [v5 setCurrentGroupActionString:v7];
  if ([v4 hasSelectedInfosInMultipleContainers])
  {
    unint64_t v17 = v7;
    id v8 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = [v4 containersForSelection];
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          unint64_t v15 = [(CRLDrawableZOrderArranger *)self p_indexOfChildren:v8 inContainer:v14];
          if (v15 < [(CRLDrawableZOrderArranger *)self p_maxZValueOfChildren:v8 inContainer:v14])[(CRLDrawableZOrderArranger *)self arrangeInspectorDidSetZValue:v15 + 1 forContainer:v14]; {
        }
          }
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    id v7 = v17;
  }
  else
  {
    unint64_t v16 = [(CRLDrawableZOrderArranger *)self currentZValueForArrangeInspector];
    if (v16 < [(CRLDrawableZOrderArranger *)self maxZValueForArrangeInspector]) {
      [(CRLDrawableZOrderArranger *)self arrangeInspectorDidSetZValue:[(CRLDrawableZOrderArranger *)self indexOfNextHigherCanvasObject] forContainer:0];
    }
  }
  [v5 closeGroup];
  [(CRLDrawableZOrderArranger *)self arrangeInspectorDidEndChangingZValue];
}

- (void)moveToFrontForArrangeInspector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  id v4 = [WeakRetained interactiveCanvasController];

  id v5 = [v4 commandController];
  [(CRLDrawableZOrderArranger *)self arrangeInspectorWillBeginChangingZValue];
  [v5 openGroup];
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"Bring to Front" value:0 table:@"UndoStrings"];

  [v5 setCurrentGroupActionString:v7];
  if ([v4 hasSelectedInfosInMultipleContainers])
  {
    long long v19 = v7;
    id v8 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = [v4 containersForSelection];
    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          unint64_t v15 = [(CRLDrawableZOrderArranger *)self p_indexOfChildren:v8 inContainer:v14];
          unint64_t v16 = [(CRLDrawableZOrderArranger *)self p_maxZValueOfChildren:v8 inContainer:v14];
          if (v15 != v16) {
            [(CRLDrawableZOrderArranger *)self arrangeInspectorDidSetZValue:v16 forContainer:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    id v7 = v19;
  }
  else
  {
    unint64_t v17 = [(CRLDrawableZOrderArranger *)self currentZValueForArrangeInspector];
    unint64_t v18 = [(CRLDrawableZOrderArranger *)self maxZValueForArrangeInspector];
    if (v17 != v18) {
      [(CRLDrawableZOrderArranger *)self arrangeInspectorDidSetZValue:v18 forContainer:0];
    }
  }
  [v5 closeGroup];
  [(CRLDrawableZOrderArranger *)self arrangeInspectorDidEndChangingZValue];
}

- (BOOL)shouldShowZOrderOptionsForSelectedDrawables
{
  return 1;
}

- (BOOL)shouldShowWrapOptionsForSelectedDrawables
{
  return 0;
}

- (BOOL)shouldShowTextFitOptionsForSelectedDrawables
{
  return 0;
}

- (unint64_t)indexOfNextHigherCanvasObject
{
  unint64_t v3 = [(CRLDrawableZOrderArranger *)self currentZValueForArrangeInspector];
  id v4 = [(CRLDrawableZOrderArranger *)self p_zOrderSiblings];
  id v5 = [v4 objectAtIndexedSubscript:v3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = [(CRLDrawableZOrderArranger *)self maxZValueForArrangeInspector];
  unint64_t v8 = v3 + 1;
  if (v3 + 1 <= v7)
  {
    unint64_t v9 = v7;
    do
    {
      id v10 = [v4 objectAtIndexedSubscript:v8];
      objc_opt_class();
      char v11 = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        if (v11) {
          goto LABEL_9;
        }
      }
      else if ((v11 & 1) == 0)
      {
LABEL_9:

        goto LABEL_10;
      }

      ++v8;
    }
    while (v8 <= v9);
  }
  unint64_t v8 = v3;
LABEL_10:

  return v8;
}

- (unint64_t)indexOfNextLowerCanvasObject
{
  unint64_t v3 = [(CRLDrawableZOrderArranger *)self currentZValueForArrangeInspector];
  id v4 = [(CRLDrawableZOrderArranger *)self p_zOrderSiblings];
  id v5 = [v4 objectAtIndexedSubscript:v3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = [(CRLDrawableZOrderArranger *)self minZValueForArrangeInspector];
  if (v3 != v7)
  {
    unint64_t v8 = v7;
    unint64_t v9 = v3 - 1;
    while (v9 >= v8)
    {
      id v10 = [v4 objectAtIndexedSubscript:v9];
      objc_opt_class();
      char v11 = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        if (v11) {
          goto LABEL_11;
        }
      }
      else if ((v11 & 1) == 0)
      {
LABEL_11:

        goto LABEL_10;
      }

      if (--v9 == -1) {
        break;
      }
    }
  }
  unint64_t v9 = v3;
LABEL_10:

  return v9;
}

- (id)p_zOrderSiblings
{
  p_mCanvasEditor = &self->mCanvasEditor;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  id v5 = [WeakRetained interactiveCanvasController];

  id v6 = [v5 topLevelContainerInfoForEditing];
  id v7 = objc_loadWeakRetained((id *)p_mCanvasEditor);
  unint64_t v8 = [v7 interactiveCanvasController];
  unsigned int v9 = [v8 hasSelectedInfosInMultipleContainers];

  if (v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501E10);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010C06B8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501E30);
    }
    id v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    char v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger p_zOrderSiblings]");
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:431 isFatal:0 description:"Should not get the generic z-order siblings for a cross-container selection"];
  }
  if (v6)
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [v6 childInfos];
    uint64_t v15 = sub_1002469D0(v13, v14);
    unint64_t v16 = (void *)v15;
    unint64_t v17 = &__NSArray0__struct;
    if (v15) {
      unint64_t v17 = (void *)v15;
    }
    id v18 = v17;
  }
  else
  {
    uint64_t v14 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
    id v18 = [v5 topLevelZOrderedSiblingsOfInfos:v14];
  }

  return v18;
}

- (BOOL)p_usingRelativeZOrder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  unint64_t v3 = [WeakRetained interactiveCanvasController];
  id v4 = [v3 topLevelContainerInfoForEditing];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)p_zOrderSiblingsForRelativeOrder
{
  id v55 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
  unint64_t v3 = [(CRLDrawableZOrderArranger *)self p_zOrderSiblings];
  id v4 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:[v3 count]];
  id v54 = objc_alloc_init((Class)NSMutableArray);
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  id v6 = [WeakRetained interactiveCanvasController];

  [v6 layoutIfNeeded];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = v3;
  id v7 = [obj countByEnumeratingWithState:&v69 objects:v83 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v70;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v70 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v69 + 1) + 8 * i);
        uint64_t v12 = [v6 layoutForInfo:v11];
        uint64_t v13 = v12;
        if (v12)
        {
          uint64_t v14 = [v12 geometry];
          [v14 frame];
          uint64_t v15 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:");
          [v4 setObject:v15 forKeyedSubscript:v11];
        }
        else
        {
          [v54 addObject:v11];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v69 objects:v83 count:16];
    }
    while (v8);
  }

  if ([v54 count])
  {
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_1004FEECC;
    v66[3] = &unk_101501E98;
    id v67 = v54;
    id v68 = v4;
    +[CRLCanvasLayoutController temporaryLayoutControllerForInfos:v67 useInBlock:v66];
  }
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v56 = v55;
  id v20 = [v56 countByEnumeratingWithState:&v62 objects:v82 count:16];
  if (v20)
  {
    id v22 = v20;
    uint64_t v23 = *(void *)v63;
    *(void *)&long long v21 = 67109378;
    long long v53 = v21;
    do
    {
      unint64_t v24 = 0;
      do
      {
        if (*(void *)v63 != v23) {
          objc_enumerationMutation(v56);
        }
        unint64_t v25 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v62 + 1) + 8 * (void)v24) v53];
        v26 = v25;
        if (v25)
        {
          [v25 CGRectValue];
          v88.origin.CGFloat x = v27;
          v88.origin.CGFloat y = v28;
          v88.size.CGFloat width = v29;
          v88.size.CGFloat height = v30;
          v85.origin.CGFloat x = x;
          v85.origin.CGFloat y = y;
          v85.size.CGFloat width = width;
          v85.size.CGFloat height = height;
          CGRect v86 = CGRectUnion(v85, v88);
          CGFloat x = v86.origin.x;
          CGFloat y = v86.origin.y;
          CGFloat width = v86.size.width;
          CGFloat height = v86.size.height;
        }
        else
        {
          unsigned int v31 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_101501EB8);
          }
          v32 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v75 = v31;
            __int16 v76 = 2082;
            v77 = "-[CRLDrawableZOrderArranger p_zOrderSiblingsForRelativeOrder]";
            __int16 v78 = 2082;
            v79 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m";
            __int16 v80 = 1024;
            int v81 = 490;
            _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d All of the selectedInfos should have been in the zOrderSiblings array that was used to create the rects.", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_101501ED8);
          }
          unint64_t v33 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v36 = v33;
            v37 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = v53;
            unsigned int v75 = v31;
            __int16 v76 = 2114;
            v77 = v37;
            _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v34 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger p_zOrderSiblingsForRelativeOrder]");
          id v35 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"];
          +[CRLAssertionHandler handleFailureInFunction:v34 file:v35 lineNumber:490 isFatal:0 description:"All of the selectedInfos should have been in the zOrderSiblings array that was used to create the rects."];
        }
        unint64_t v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v22 = [v56 countByEnumeratingWithState:&v62 objects:v82 count:16];
    }
    while (v22);
  }

  id v38 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(obj, "count"));
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v39 = obj;
  id v40 = [v39 countByEnumeratingWithState:&v58 objects:v73 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v59;
    do
    {
      for (j = 0; j != v41; j = (char *)j + 1)
      {
        if (*(void *)v59 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v44 = *(void *)(*((void *)&v58 + 1) + 8 * (void)j);
        id v45 = [v4 objectForKeyedSubscript:v44];
        [v45 CGRectValue];
        v89.origin.CGFloat x = v46;
        v89.origin.CGFloat y = v47;
        v89.size.CGFloat width = v48;
        v89.size.CGFloat height = v49;
        v87.origin.CGFloat x = x;
        v87.origin.CGFloat y = y;
        v87.size.CGFloat width = width;
        v87.size.CGFloat height = height;
        BOOL v50 = CGRectIntersectsRect(v87, v89);

        if (!v50) {
          [v38 addObject:v44];
        }
      }
      id v41 = [v39 countByEnumeratingWithState:&v58 objects:v73 count:16];
    }
    while (v41);
  }

  v51 = [v39 crl_arrayByRemovingObjectsIdenticalToObjectsInArray:v38];

  return v51;
}

- (id)p_zOrderedSelectedObjects
{
  unint64_t v3 = [(CRLDrawableZOrderArranger *)self p_zOrderSiblings];
  id v4 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
  id v5 = [v3 crl_arrayWithObjectsInSet:v4];

  return v5;
}

- (unint64_t)p_minIndex
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  id v4 = [WeakRetained interactiveCanvasController];
  unsigned int v5 = [v4 hasSelectedInfosInMultipleContainers];

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501EF8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010C0740();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501F18);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger p_minIndex]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:517 isFatal:0 description:"Cannot get the generic min index for a cross-container selection"];
  }
  uint64_t v9 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
  unint64_t v10 = [(CRLDrawableZOrderArranger *)self p_minZValueOfChildren:v9 inContainer:0];

  return v10;
}

- (unint64_t)p_minZValueOfChildren:(id)a3 inContainer:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    id v7 = [a4 childInfos];
    id v8 = [v7 crl_arrayWithObjectsInSet:v6];

    id v9 = [v8 count];
    id v6 = v7;
  }
  else
  {
    id v9 = [v5 count];
  }

  if (v9) {
    return (unint64_t)v9 - 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)p_maxIndex
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  id v4 = [WeakRetained interactiveCanvasController];
  unsigned int v5 = [v4 hasSelectedInfosInMultipleContainers];

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501F38);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010C07C8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501F58);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger p_maxIndex]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:532 isFatal:0 description:"Cannot get the generic max index for a cross-container selection"];
  }
  unsigned int v9 = [(CRLDrawableZOrderArranger *)self p_usingRelativeZOrder];
  unint64_t v10 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
  if (v9) {
    unint64_t v11 = [(CRLDrawableZOrderArranger *)self p_maxRelativeZValueOfChildrenInTopLevelContainer:v10];
  }
  else {
    unint64_t v11 = [(CRLDrawableZOrderArranger *)self p_maxZValueOfChildren:v10 inContainer:0];
  }
  unint64_t v12 = v11;

  return v12;
}

- (unint64_t)p_maxZValueOfChildren:(id)a3 inContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  unsigned int v9 = [WeakRetained interactiveCanvasController];

  if (v7) {
    [v7 childInfos];
  }
  else {
  unint64_t v10 = [v9 topLevelZOrderedSiblingsOfInfos:v6];
  }
  id v11 = [v10 count];

  if (v11) {
    unint64_t v12 = (unint64_t)v11 - 1;
  }
  else {
    unint64_t v12 = 0;
  }

  return v12;
}

- (unint64_t)p_maxRelativeZValueOfChildrenInTopLevelContainer:(id)a3
{
  unint64_t v3 = [(CRLDrawableZOrderArranger *)self p_zOrderSiblingsForRelativeOrder];
  id v4 = [v3 count];

  if (v4) {
    return (unint64_t)v4 - 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)p_indexOfChildren:(id)a3 inContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7) {
    [v7 childInfos];
  }
  else {
  unsigned int v9 = [(CRLDrawableZOrderArranger *)self p_zOrderSiblings];
  }
  unint64_t v10 = [v9 crl_arrayWithObjectsInSet:v6];
  if ([v10 count])
  {
    id v11 = [v10 lastObject];
    unint64_t v12 = (unint64_t)[v9 indexOfObjectIdenticalTo:v11];
  }
  else
  {
    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (unint64_t)p_relativeIndexOfChildrenInTopLevelContainer:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CRLDrawableZOrderArranger *)self p_zOrderSiblingsForRelativeOrder];
  id v6 = [v5 crl_arrayWithObjectsInSet:v4];

  if ([v6 count])
  {
    id v7 = [v6 lastObject];
    unint64_t v8 = (unint64_t)[v5 indexOfObjectIdenticalTo:v7];
  }
  else
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (unint64_t)p_zOrderIndex
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  id v4 = [WeakRetained interactiveCanvasController];
  unsigned int v5 = [v4 hasSelectedInfosInMultipleContainers];

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501F78);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010C0850();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501F98);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDrawableZOrderArranger p_zOrderIndex]");
    unint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLDrawableZOrderArranger.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:576 isFatal:0 description:"Cannot get the generic max index for a cross-container selection"];
  }
  unsigned int v9 = [(CRLDrawableZOrderArranger *)self p_usingRelativeZOrder];
  unint64_t v10 = [(CRLDrawableZOrderArranger *)self p_selectedInfos];
  if (v9) {
    unint64_t v11 = [(CRLDrawableZOrderArranger *)self p_relativeIndexOfChildrenInTopLevelContainer:v10];
  }
  else {
    unint64_t v11 = [(CRLDrawableZOrderArranger *)self p_indexOfChildren:v10 inContainer:0];
  }
  unint64_t v12 = v11;

  return v12;
}

- (id)p_selectedInfos
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  unint64_t v3 = [WeakRetained interactiveCanvasController];

  id v4 = [v3 infosForCurrentSelectionPath];

  return v4;
}

- (CRLCanvasEditor)canvasEditor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);

  return (CRLCanvasEditor *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end