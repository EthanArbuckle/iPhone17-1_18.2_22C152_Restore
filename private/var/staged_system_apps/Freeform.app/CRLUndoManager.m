@interface CRLUndoManager
- (BOOL)canRedo;
- (BOOL)canRedoDisregardingDelegates;
- (BOOL)canUndo;
- (BOOL)canUndoDisregardingDelegates;
- (BOOL)groupsByEvent;
- (BOOL)isRedoing;
- (BOOL)isUndoRegistrationEnabled;
- (BOOL)isUndoing;
- (CRLUndoManager)initWithCommandController:(id)a3;
- (CRLUndoManager)initWithCommandController:(id)a3 delegate:(id)a4;
- (id)prepareWithInvocationTarget:(id)a3;
- (id)redoActionName;
- (id)runLoopModes;
- (id)undoActionName;
- (int64_t)groupingLevel;
- (unint64_t)levelsOfUndo;
- (unint64_t)redoCount;
- (unint64_t)undoCount;
- (void)addDelegate:(id)a3;
- (void)beginUndoGrouping;
- (void)disableUndoRegistration;
- (void)enableUndoRegistration;
- (void)endUndoGrouping;
- (void)p_commandControllerDidCloseUndoGroup:(id)a3;
- (void)p_commandControllerDidOpenUndoGroup:(id)a3;
- (void)p_commandControllerDidRedo:(id)a3;
- (void)p_commandControllerDidUndo:(id)a3;
- (void)p_commandControllerHistoryStateChanged:(id)a3;
- (void)p_commandControllerWillCloseUndoGroup:(id)a3;
- (void)p_commandControllerWillRedo:(id)a3;
- (void)p_commandControllerWillUndo:(id)a3;
- (void)p_updateCanUndoAndRedo;
- (void)redo;
- (void)registerUndoWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5;
- (void)removeAllActionsWithTarget:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)setActionName:(id)a3;
- (void)setGroupsByEvent:(BOOL)a3;
- (void)setLevelsOfUndo:(unint64_t)a3;
- (void)setRunLoopModes:(id)a3;
- (void)undo;
- (void)undoNestedGroup;
@end

@implementation CRLUndoManager

- (CRLUndoManager)initWithCommandController:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CRLUndoManager;
  v5 = [(CRLUndoManager *)&v19 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_commandController, v4);
    uint64_t v7 = +[NSHashTable weakObjectsHashTable];
    delegates = v6->_delegates;
    v6->_delegates = (NSHashTable *)v7;

    v9 = +[NSNotificationCenter defaultCenter];
    v10 = +[NSNotification CRLCommandControllerDidOpenUndoGroup];
    [v9 addObserver:v6 selector:"p_commandControllerDidOpenUndoGroup:" name:v10 object:v4];

    v11 = +[NSNotification CRLCommandControllerWillCloseUndoGroup];
    [v9 addObserver:v6 selector:"p_commandControllerWillCloseUndoGroup:" name:v11 object:v4];

    v12 = +[NSNotification CRLCommandControllerDidCloseUndoGroup];
    [v9 addObserver:v6 selector:"p_commandControllerDidCloseUndoGroup:" name:v12 object:v4];

    v13 = +[NSNotification CRLCommandControllerHistoryStateDidChange];
    [v9 addObserver:v6 selector:"p_commandControllerHistoryStateChanged:" name:v13 object:v4];

    v14 = +[NSNotification CRLCommandControllerWillUndo];
    [v9 addObserver:v6 selector:"p_commandControllerWillUndo:" name:v14 object:v4];

    v15 = +[NSNotification CRLCommandControllerDidUndo];
    [v9 addObserver:v6 selector:"p_commandControllerDidUndo:" name:v15 object:v4];

    v16 = +[NSNotification CRLCommandControllerWillRedo];
    [v9 addObserver:v6 selector:"p_commandControllerWillRedo:" name:v16 object:v4];

    v17 = +[NSNotification CRLCommandControllerDidRedo];
    [v9 addObserver:v6 selector:"p_commandControllerDidRedo:" name:v17 object:v4];

    v6->_canUndo = [v4 canUndo];
    v6->_canRedo = [v4 canRedo];
  }
  return v6;
}

- (CRLUndoManager)initWithCommandController:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CRLUndoManager *)self initWithCommandController:a3];
  v8 = v7;
  if (v7) {
    [(CRLUndoManager *)v7 addDelegate:v6];
  }

  return v8;
}

- (void)beginUndoGrouping
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F7070);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010AE1D4();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F7090);
  }
  v2 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v2);
  }
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager beginUndoGrouping]");
  id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"];
  +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:54 isFatal:0 description:"CRLUndoManager: undo manager has been overridden. This call is unexpected: beginUndoGrouping"];
}

- (void)endUndoGrouping
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F70B0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010AE25C();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F70D0);
  }
  v2 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v2);
  }
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager endUndoGrouping]");
  id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"];
  +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:58 isFatal:0 description:"CRLUndoManager: undo manager has been overridden. This call is unexpected: endUndoGrouping"];
}

- (int64_t)groupingLevel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  id v3 = [WeakRetained groupingLevel];

  return (int64_t)v3;
}

- (void)disableUndoRegistration
{
}

- (void)enableUndoRegistration
{
  int64_t disableCount = self->_disableCount;
  if (disableCount > 0) {
    goto LABEL_11;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F70F0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010AE2E4();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F7110);
  }
  id v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v4);
  }
  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager enableUndoRegistration]");
  id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"];
  +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:74 isFatal:0 description:"Disable count underflow"];

  int64_t disableCount = self->_disableCount;
  if (disableCount >= 1) {
LABEL_11:
  }
    self->_int64_t disableCount = disableCount - 1;
}

- (BOOL)isUndoRegistrationEnabled
{
  return self->_disableCount == 0;
}

- (BOOL)groupsByEvent
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F7130);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010AE36C();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F7150);
  }
  v2 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v2);
  }
  id v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager groupsByEvent]");
  id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"];
  +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:87 isFatal:0 description:"CRLUndoManager: undo manager has been overridden. This call is unexpected: groupsByEvent"];

  return 0;
}

- (void)setGroupsByEvent:(BOOL)a3
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F7170);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010AE3F4();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F7190);
  }
  id v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v3);
  }
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager setGroupsByEvent:]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"];
  +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:92 isFatal:0 description:"CRLUndoManager: undo manager has been overridden. This call is unexpected: setGroupsByEvent:"];
}

- (void)setLevelsOfUndo:(unint64_t)a3
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F71B0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010AE47C();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F71D0);
  }
  id v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v3);
  }
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager setLevelsOfUndo:]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"];
  +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:96 isFatal:0 description:"CRLUndoManager: undo manager has been overridden. This call is unexpected: setLevelsOfUndo:"];
}

- (unint64_t)levelsOfUndo
{
  return 0;
}

- (unint64_t)undoCount
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  id v3 = [WeakRetained undoCount];

  return (unint64_t)v3;
}

- (unint64_t)redoCount
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  id v3 = [WeakRetained redoCount];

  return (unint64_t)v3;
}

- (void)setRunLoopModes:(id)a3
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F71F0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010AE504();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F7210);
  }
  id v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v3);
  }
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager setRunLoopModes:]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"];
  +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:112 isFatal:0 description:"CRLUndoManager: undo manager has been overridden. This call is unexpected: setRunLoopModes:"];
}

- (id)runLoopModes
{
  return &__NSArray0__struct;
}

- (void)undoNestedGroup
{
  p_commandController = &self->_commandController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  unsigned int v4 = [WeakRetained canUndo];

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_commandController);
    [v5 undo];
  }
}

- (BOOL)isUndoing
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F7230);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010AE58C();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F7250);
  }
  v2 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v2);
  }
  id v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager isUndoing]");
  unsigned int v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"];
  +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:128 isFatal:0 description:"CRLUndoManager: undo manager has been overridden. This call is unexpected."];

  return 0;
}

- (BOOL)isRedoing
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F7270);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010AE614();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F7290);
  }
  v2 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v2);
  }
  id v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager isRedoing]");
  unsigned int v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"];
  +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:133 isFatal:0 description:"CRLUndoManager: undo manager has been overridden. This call is unexpected."];

  return 0;
}

- (void)removeAllActionsWithTarget:(id)a3
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F72B0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010AE69C();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F72D0);
  }
  id v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v3);
  }
  unsigned int v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager removeAllActionsWithTarget:]");
  id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"];
  +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:145 isFatal:0 description:"CRLUndoManager: undo manager has been overridden. This call is unexpected: removeAllActionsWithTarget:"];
}

- (void)registerUndoWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F72F0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010AE724();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F7310);
  }
  id v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v5);
  }
  id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager registerUndoWithTarget:selector:object:]");
  uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"];
  +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:149 isFatal:0 description:"CRLUndoManager: undo manager has been overridden. This call is unexpected: registerUndoWithTarget"];
}

- (id)prepareWithInvocationTarget:(id)a3
{
  id v4 = a3;
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F7330);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010AE7AC();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F7350);
  }
  id v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v5);
  }
  id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager prepareWithInvocationTarget:]");
  uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"];
  +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:153 isFatal:0 description:"CRLUndoManager: undo manager has been overridden. This call is unexpected: prepareWithInvocationTarget"];

  v10.receiver = self;
  v10.super_class = (Class)CRLUndoManager;
  v8 = [(CRLUndoManager *)&v10 prepareWithInvocationTarget:v4];

  return v8;
}

- (id)undoActionName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  id v3 = [WeakRetained undoActionString];

  return v3;
}

- (id)redoActionName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  id v3 = [WeakRetained redoActionString];

  return v3;
}

- (void)setActionName:(id)a3
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F7370);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010AE834();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F7390);
  }
  id v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v3);
  }
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager setActionName:]");
  id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"];
  +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:168 isFatal:0 description:"CRLUndoManager: undo manager has been overridden. This call is unexpected: setActionName:"];
}

- (BOOL)canUndo
{
  if (![(CRLUndoManager *)self canUndoDisregardingDelegates]) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NSHashTable *)self->_delegates allObjects];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (![*(id *)(*((void *)&v10 + 1) + 8 * i) canUndo])
        {
          BOOL v8 = 0;
          goto LABEL_13;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_13:

  return v8;
}

- (BOOL)canRedo
{
  if (![(CRLUndoManager *)self canRedoDisregardingDelegates]) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NSHashTable *)self->_delegates allObjects];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (![*(id *)(*((void *)&v10 + 1) + 8 * i) canRedo])
        {
          BOOL v8 = 0;
          goto LABEL_13;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_13:

  return v8;
}

- (void)addDelegate:(id)a3
{
}

- (void)removeDelegate:(id)a3
{
}

- (BOOL)canUndoDisregardingDelegates
{
  return self->_canUndo;
}

- (BOOL)canRedoDisregardingDelegates
{
  return self->_canRedo;
}

- (void)undo
{
  p_commandController = &self->_commandController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  unsigned int v4 = [WeakRetained canUndo];

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_commandController);
    [v5 undo];
  }
}

- (void)redo
{
  p_commandController = &self->_commandController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  unsigned int v4 = [WeakRetained canRedo];

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_commandController);
    [v5 redo];
  }
}

- (void)p_commandControllerDidOpenUndoGroup:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:NSUndoManagerDidOpenUndoGroupNotification object:self];
}

- (void)p_commandControllerWillCloseUndoGroup:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:NSUndoManagerWillCloseUndoGroupNotification object:self];
}

- (void)p_commandControllerDidCloseUndoGroup:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:NSUndoManagerDidCloseUndoGroupNotification object:self];
}

- (void)p_commandControllerHistoryStateChanged:(id)a3
{
}

- (void)p_updateCanUndoAndRedo
{
  p_commandController = &self->_commandController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  self->_canUndo = [WeakRetained canUndo];

  id v5 = objc_loadWeakRetained((id *)p_commandController);
  self->_canRedo = [v5 canRedo];
}

- (void)p_commandControllerWillUndo:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:NSUndoManagerWillUndoChangeNotification object:self];
}

- (void)p_commandControllerDidUndo:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:NSUndoManagerDidUndoChangeNotification object:self];
}

- (void)p_commandControllerWillRedo:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:NSUndoManagerWillRedoChangeNotification object:self];
}

- (void)p_commandControllerDidRedo:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:NSUndoManagerDidRedoChangeNotification object:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);

  objc_destroyWeak((id *)&self->_commandController);
}

@end