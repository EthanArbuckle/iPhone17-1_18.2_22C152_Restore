@interface CRLiOSContextMenuController
- (BOOL)shouldDismissOnChange;
- (CRLiOSContextMenuController)initWithDelegate:(id)a3;
- (CRLiOSContextMenuControllerDelegate)delegate;
- (NSBlockOperation)resetOperation;
- (NSSet)changeSources;
- (NSTimer)resumeCollaborationTimer;
- (void)dealloc;
- (void)p_contextMenuWillHide:(id)a3;
- (void)p_resumeCollaboration;
- (void)p_showContextMenuForChangeSources:(id)a3 withBlock:(id)a4;
- (void)processChanges:(id)a3 forChangeSource:(id)a4;
- (void)setChangeSources:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setResetOperation:(id)a3;
- (void)setResumeCollaborationTimer:(id)a3;
- (void)setShouldDismissOnChange:(BOOL)a3;
- (void)showContextMenuFromView:(id)a3 rect:(CGRect)a4 animated:(BOOL)a5 withChangeSources:(id)a6;
- (void)showContextMenuInPreviousLocationAnimated:(BOOL)a3 withChangeSources:(id)a4;
@end

@implementation CRLiOSContextMenuController

- (CRLiOSContextMenuController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSContextMenuController;
  v5 = [(CRLiOSContextMenuController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)dealloc
{
  [(NSBlockOperation *)self->_resetOperation cancel];
  if (self->_changeSources)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1F98);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101072240();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1FB8);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSContextMenuController dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSContextMenuController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 50, 0, "expected nil value for '%{public}s'", "_changeSources");
  }
  [(NSTimer *)self->_resumeCollaborationTimer invalidate];
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSContextMenuController;
  [(CRLiOSContextMenuController *)&v6 dealloc];
}

- (void)showContextMenuInPreviousLocationAnimated:(BOOL)a3 withChangeSources:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000AFC54;
  v4[3] = &unk_1014D1FD8;
  BOOL v5 = a3;
  [(CRLiOSContextMenuController *)self p_showContextMenuForChangeSources:a4 withBlock:v4];
}

- (void)showContextMenuFromView:(id)a3 rect:(CGRect)a4 animated:(BOOL)a5 withChangeSources:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000AFD84;
  v13[3] = &unk_1014D2000;
  BOOL v19 = a5;
  id v14 = a3;
  CGFloat v15 = x;
  CGFloat v16 = y;
  CGFloat v17 = width;
  CGFloat v18 = height;
  id v12 = v14;
  [(CRLiOSContextMenuController *)self p_showContextMenuForChangeSources:a6 withBlock:v13];
}

- (void)p_showContextMenuForChangeSources:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = [WeakRetained editingCoordinator];

  if (!v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2020);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010723FC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2040);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSContextMenuController p_showContextMenuForChangeSources:withBlock:]");
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSContextMenuController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 79, 0, "invalid nil value for '%{public}s'", "_delegate.editingCoordinator");
  }
  if (self->_changeSources)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2060);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101072368();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2080);
    }
    v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSContextMenuController p_showContextMenuForChangeSources:withBlock:]");
    CGFloat v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSContextMenuController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 82, 0, "expected nil value for '%{public}s'", "_changeSources");
  }
  id v16 = objc_loadWeakRetained((id *)&self->_delegate);
  CGFloat v17 = [v16 editingCoordinator];
  CGFloat v18 = [v17 changeNotifier];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v19 = v6;
  id v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        [v18 addObserver:self forChangeSource:*(void *)(*((void *)&v32 + 1) + 8 * i)];
      }
      id v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v21);
  }

  [(CRLiOSContextMenuController *)self setChangeSources:v19];
  if (self->_resumeCollaborationTimer)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D20A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010722D4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D20C0);
    }
    v24 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v24);
    }
    v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSContextMenuController p_showContextMenuForChangeSources:withBlock:]");
    v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSContextMenuController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 90, 0, "expected nil value for '%{public}s'", "_resumeCollaborationTimer");
  }
  v27 = +[NSTimer scheduledTimerWithTimeInterval:self target:"p_resumeCollaboration" selector:0 userInfo:0 repeats:15.0];
  [(CRLiOSContextMenuController *)self setResumeCollaborationTimer:v27];

  v28 = +[NSNotificationCenter defaultCenter];
  [v28 addObserver:self selector:"p_contextMenuWillHide:" name:UIMenuControllerWillHideMenuNotification object:0];

  id v29 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v30 = [v29 editingCoordinator];
  [(id)v30 suspendCollaborationWithReason:@"CRLiOSContextMenu"];

  v7[2](v7);
  v31 = +[UIMenuController sharedMenuController];
  LOBYTE(v30) = [v31 isMenuVisible];

  if ((v30 & 1) == 0) {
    [(CRLiOSContextMenuController *)self p_contextMenuWillHide:0];
  }
}

- (void)p_contextMenuWillHide:(id)a3
{
  id v4 = a3;
  resumeCollaborationTimer = self->_resumeCollaborationTimer;
  if (resumeCollaborationTimer)
  {
    [(NSTimer *)self->_resumeCollaborationTimer invalidate];
    [(CRLiOSContextMenuController *)self setResumeCollaborationTimer:0];
  }
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:UIMenuControllerWillHideMenuNotification object:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_super v8 = [WeakRetained editingCoordinator];
  v9 = [v8 changeNotifier];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v10 = self->_changeSources;
  id v11 = [(NSSet *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        [v9 removeObserver:self forChangeSource:*(void *)(*((void *)&v19 + 1) + 8 * (void)v14) change:v19];
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSSet *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  [(CRLiOSContextMenuController *)self setChangeSources:0];
  if (resumeCollaborationTimer)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    id v16 = [v15 editingCoordinator];
    [v16 resumeCollaborationWithReason:@"CRLiOSContextMenu"];
  }
  CGFloat v17 = [(CRLiOSContextMenuController *)self resetOperation];
  [v17 cancel];

  [(CRLiOSContextMenuController *)self setResetOperation:0];
  id v18 = objc_loadWeakRetained((id *)&self->_delegate);
  [v18 contextMenuDidHideForContextMenuController:self];
}

- (void)p_resumeCollaboration
{
  [(NSTimer *)self->_resumeCollaborationTimer invalidate];
  [(CRLiOSContextMenuController *)self setResumeCollaborationTimer:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained editingCoordinator];
  [v3 resumeCollaborationWithReason:@"CRLiOSContextMenu"];
}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CRLiOSContextMenuController *)self resetOperation];

  if (!v8)
  {
    objc_initWeak(&location, self);
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = sub_1000B09A8;
    id v15 = &unk_1014CBF60;
    objc_copyWeak(&v16, &location);
    v9 = +[NSBlockOperation blockOperationWithBlock:&v12];
    -[CRLiOSContextMenuController setResetOperation:](self, "setResetOperation:", v9, v12, v13, v14, v15);

    v10 = +[NSOperationQueue mainQueue];
    id v11 = [(CRLiOSContextMenuController *)self resetOperation];
    [v10 addOperation:v11];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (NSBlockOperation)resetOperation
{
  return self->_resetOperation;
}

- (void)setResetOperation:(id)a3
{
}

- (CRLiOSContextMenuControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRLiOSContextMenuControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldDismissOnChange
{
  return self->_shouldDismissOnChange;
}

- (void)setShouldDismissOnChange:(BOOL)a3
{
  self->_shouldDismissOnChange = a3;
}

- (NSSet)changeSources
{
  return self->_changeSources;
}

- (void)setChangeSources:(id)a3
{
}

- (NSTimer)resumeCollaborationTimer
{
  return self->_resumeCollaborationTimer;
}

- (void)setResumeCollaborationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resumeCollaborationTimer, 0);
  objc_storeStrong((id *)&self->_changeSources, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_resetOperation, 0);
}

@end