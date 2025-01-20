@interface CRLiOSDocumentModeController
- (BOOL)setToPreviousModeAnimated:(BOOL)a3;
- (CRLiOSDocumentMode)mode;
- (CRLiOSDocumentModeController)initWithDelegate:(id)a3;
- (CRLiOSDocumentModeControllerDelegate)delegate;
- (void)addModeObserver:(id)a3;
- (void)p_editorControllerSelectionPathDidChange:(id)a3;
- (void)p_notifyAllObserversOfModeChangeTo:(id)a3 from:(id)a4 animated:(BOOL)a5 didChange:(BOOL)a6;
- (void)p_setMode:(id)a3 animated:(BOOL)a4 forced:(BOOL)a5;
- (void)removeModeObserver:(id)a3;
- (void)resetToDefaultModeAnimated:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setMode:(id)a3;
- (void)setMode:(id)a3 animated:(BOOL)a4;
- (void)willTeardownEditorController:(id)a3;
@end

@implementation CRLiOSDocumentModeController

- (CRLiOSDocumentModeController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRLiOSDocumentModeController;
  v5 = [(CRLiOSDocumentModeController *)&v17 init];
  if (v5)
  {
    if (!+[NSThread isMainThread])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA958);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B3AE4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA978);
      }
      v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v6);
      }
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController initWithDelegate:]");
      v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:35 isFatal:0 description:"This operation must only be performed on the main thread."];
    }
    uint64_t v9 = [v4 defaultDocumentMode];
    mode = v5->_mode;
    v5->_mode = (CRLiOSDocumentMode *)v9;

    if (!v5->_mode)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA998);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B3A34();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA9B8);
      }
      v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v11);
      }
      v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController initWithDelegate:]");
      v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 37, 0, "invalid nil value for '%{public}s'", "_mode");
    }
    uint64_t v14 = +[NSHashTable hashTableWithOptions:5];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v14;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)p_editorControllerSelectionPathDidChange:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = [v4 object];

  sub_10024715C(v5, v6);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!self->_currentlyChangingMode)
  {
    if (![(CRLiOSDocumentMode *)self->_mode isValidForEditorController:v14]
      || (id v7 = objc_loadWeakRetained((id *)&self->_delegate),
          unsigned __int8 v8 = [v7 isValidMode:self->_mode forEditorController:v14],
          v7,
          (v8 & 1) == 0))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v10 = [WeakRetained modeForEditorController:v14];
      v11 = v10;
      if (v10)
      {
        id v12 = v10;
      }
      else
      {
        id v13 = objc_loadWeakRetained((id *)&self->_delegate);
        id v12 = [v13 defaultDocumentMode];
      }
      [(CRLiOSDocumentModeController *)self p_setMode:v12 animated:1 forced:1];
    }
  }
}

- (void)addModeObserver:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA9D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B3BF4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA9F8);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController addModeObserver:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:54 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if ([(NSHashTable *)self->_observers containsObject:v4])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FAA18);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B3B6C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FAA38);
    }
    unsigned __int8 v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController addModeObserver:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:55 isFatal:0 description:"Trying to add a document mode observer that's already added"];
  }
  [(NSHashTable *)self->_observers addObject:v4];
}

- (void)removeModeObserver:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FAA58);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B3D04();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FAA78);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController removeModeObserver:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:61 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (![(NSHashTable *)self->_observers containsObject:v4])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FAA98);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B3C7C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FAAB8);
    }
    unsigned __int8 v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController removeModeObserver:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:62 isFatal:0 description:"Trying to remove a document mode observer that has not been added"];
  }
  [(NSHashTable *)self->_observers removeObject:v4];
}

- (void)setMode:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FAAD8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B3D8C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FAAF8);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController setMode:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:68 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  [(CRLiOSDocumentModeController *)self setMode:v4 animated:1];
}

- (void)setMode:(id)a3 animated:(BOOL)a4
{
}

- (void)p_setMode:(id)a3 animated:(BOOL)a4 forced:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v46 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FAB18);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B3E9C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FAB38);
    }
    unsigned __int8 v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController p_setMode:animated:forced:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:77 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (self->_currentlyChangingMode)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FAB58);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B3E14();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FAB78);
    }
    v31 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v31);
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Should not change mode while we are already changing the mode.", v32, v33, v34, v35, v36, v37, v38, (uint64_t)"-[CRLiOSDocumentModeController p_setMode:animated:forced:]");
    v39 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController p_setMode:animated:forced:]");
    v40 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v39 file:v40 lineNumber:81 isFatal:1 description:"Should not change mode while we are already changing the mode."];

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v41, v42);
    abort();
  }
  BOOL v43 = v5;
  BOOL v44 = v6;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v11 = self->_observedEditorControllers;
  id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v52;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v52 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        objc_super v17 = +[NSNotificationCenter defaultCenter];
        [v17 removeObserver:self name:@"CRLEditorControllerSelectionPathDidChangeNotification" object:v16];
      }
      id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v13);
  }

  v18 = [v46 editorControllersToObserve];
  v19 = (NSArray *)[v18 copy];
  observedEditorControllers = self->_observedEditorControllers;
  self->_observedEditorControllers = v19;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v21 = self->_observedEditorControllers;
  id v22 = [(NSArray *)v21 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v48;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v48 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v47 + 1) + 8 * (void)j);
        v27 = +[NSNotificationCenter defaultCenter];
        [v27 addObserver:self selector:"p_editorControllerSelectionPathDidChange:" name:@"CRLEditorControllerSelectionPathDidChangeNotification" object:v26];
      }
      id v23 = [(NSArray *)v21 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v23);
  }

  mode = self->_mode;
  v29 = mode;
  id v30 = v46;
  if (([v30 isEqual:v29] & 1) == 0)
  {
    self->_currentlyChangingMode = 1;
    [(CRLiOSDocumentMode *)v29 modeWillEndForMode:v30 forced:v43];
    [v30 modeWillBeginFromMode:v29 forced:v43];
    [(CRLiOSDocumentModeController *)self p_notifyAllObserversOfModeChangeTo:v30 from:v29 animated:v44 didChange:0];
    objc_storeStrong((id *)&self->_mode, a3);
    objc_storeStrong((id *)&self->_previousMode, mode);
    [(CRLiOSDocumentMode *)v29 modeDidEndForMode:v30 forced:v43];
    [v30 modeDidBeginFromMode:v29 forced:v43];
    [(CRLiOSDocumentModeController *)self p_notifyAllObserversOfModeChangeTo:v30 from:v29 animated:v44 didChange:1];
    self->_currentlyChangingMode = 0;
  }
}

- (BOOL)setToPreviousModeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FAB98);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B3F24();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FABB8);
    }
    BOOL v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    BOOL v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController setToPreviousModeAnimated:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:120 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  previousMode = self->_previousMode;
  if (previousMode) {
    [(CRLiOSDocumentModeController *)self setMode:self->_previousMode animated:v3];
  }
  return previousMode != 0;
}

- (void)resetToDefaultModeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FABD8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B3FAC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FABF8);
    }
    BOOL v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    BOOL v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController resetToDefaultModeAnimated:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:132 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v9 = [WeakRetained defaultDocumentMode];
  [(CRLiOSDocumentModeController *)self setMode:v9 animated:v3];
}

- (void)willTeardownEditorController:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_observedEditorControllers containsObject:v4])
  {
    BOOL v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:@"CRLEditorControllerSelectionPathDidChangeNotification" object:v4];

    observedEditorControllers = self->_observedEditorControllers;
    id v10 = v4;
    id v7 = +[NSArray arrayWithObjects:&v10 count:1];
    unsigned __int8 v8 = [(NSArray *)observedEditorControllers crl_arrayByRemovingObjectsIdenticalToObjectsInArray:v7];
    uint64_t v9 = self->_observedEditorControllers;
    self->_observedEditorControllers = v8;
  }
}

- (void)p_notifyAllObserversOfModeChangeTo:(id)a3 from:(id)a4 animated:(BOOL)a5 didChange:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = [(NSHashTable *)self->_observers copy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (v6) {
          [v18 didSetDocumentToMode:v10 fromMode:v11 animated:v7];
        }
        else {
          [v18 willSetDocumentToMode:v10 fromMode:v11 animated:v7 v19];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }
}

- (CRLiOSDocumentMode)mode
{
  return self->_mode;
}

- (CRLiOSDocumentModeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRLiOSDocumentModeControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observedEditorControllers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_previousMode, 0);

  objc_storeStrong((id *)&self->_mode, 0);
}

@end