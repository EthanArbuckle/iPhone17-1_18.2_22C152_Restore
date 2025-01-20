@interface CRLiOSWindowWrapper
+ (id)windowWrapperForView:(id)a3 assert:(BOOL)a4;
- (BOOL)isInSplitViewMode;
- (CRLiOSWindowWrapper)initWithWindow:(id)a3;
- (UIWindow)window;
- (id)beginIgnoringUserInteraction;
- (id)newWrapperBeginningIgnoringUserInteractionSafely;
- (int64_t)interfaceOrientation;
- (void)endIgnoringUserInteractionWithToken:(id)a3;
@end

@implementation CRLiOSWindowWrapper

- (CRLiOSWindowWrapper)initWithWindow:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSWindowWrapper;
  v5 = [(CRLiOSWindowWrapper *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_window, v4);
    v7 = [[CRLTraceableResource alloc] initWithName:@"CRLiOSWindowWrapper.UserInteraction" logContext:0];
    userInteractionIgnoredTraceableResource = v6->_userInteractionIgnoredTraceableResource;
    v6->_userInteractionIgnoredTraceableResource = v7;
  }
  return v6;
}

+ (id)windowWrapperForView:(id)a3 assert:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D34D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101074D00();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D34F8);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLiOSWindowWrapper windowWrapperForView:assert:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSWindowWrapper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:33 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  v9 = [v5 window];
  if (!v9)
  {
    objc_super v10 = 0;
LABEL_18:
    if (v4)
    {
      int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D3538);
      }
      v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
        sub_101074BFC((uint64_t)v5, v11, v12);
      }

      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D3558);
      }
      v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v13);
      }
      v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLiOSWindowWrapper windowWrapperForView:assert:]");
      v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSWindowWrapper.m"];
      if (v5)
      {
        v16 = (objc_class *)objc_opt_class();
        v17 = NSStringFromClass(v16);
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 53, 0, "Could not find scene wrapper for view <%{public}@: %{public}p>", v17, v5);
      }
      else
      {
        +[CRLAssertionHandler handleFailureInFunction:v14, v15, 53, 0, "Could not find scene wrapper for view <%{public}@: %{public}p>", @"Nil", 0 file lineNumber isFatal description];
      }

      objc_super v10 = 0;
    }
    goto LABEL_31;
  }
  if (qword_1016A9030 != -1) {
    dispatch_once(&qword_1016A9030, &stru_1014D3518);
  }
  objc_super v10 = [(id)qword_1016A9028 objectForKey:v9];
  if (!v10)
  {
    objc_super v10 = [[CRLiOSWindowWrapper alloc] initWithWindow:v9];
    [(id)qword_1016A9028 setObject:v10 forKey:v9];
    if (!v10) {
      goto LABEL_18;
    }
  }
LABEL_31:

  return v10;
}

- (id)beginIgnoringUserInteraction
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3578);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101074E10();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3598);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    BOOL v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSWindowWrapper beginIgnoringUserInteraction]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSWindowWrapper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:60 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  v6 = [(CRLTraceableResource *)self->_userInteractionIgnoredTraceableResource willAcquireResourceWithIntent:@"IgnoreUserInteraction" timeout:10 parent:0 context:0];
  unint64_t userInteractionIgnoredCount = self->_userInteractionIgnoredCount;
  if (!userInteractionIgnoredCount)
  {
    if (self->_suspendUserInteractionIgnoredCount)
    {
      unint64_t userInteractionIgnoredCount = 0;
    }
    else
    {
      v8 = [(CRLiOSWindowWrapper *)self window];
      unsigned __int8 v9 = [v8 isUserInteractionEnabled];

      if ((v9 & 1) == 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D35B8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101074D88();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D35D8);
        }
        objc_super v10 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v10);
        }
        int v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSWindowWrapper beginIgnoringUserInteraction]");
        v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSWindowWrapper.m"];
        +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:67 isFatal:0 description:"userInteraction should be enabled when _userInteractionEnabledCount = 0"];
      }
      v13 = [(CRLiOSWindowWrapper *)self window];
      [v13 setUserInteractionEnabled:0];

      unint64_t userInteractionIgnoredCount = self->_userInteractionIgnoredCount;
    }
  }
  self->_unint64_t userInteractionIgnoredCount = userInteractionIgnoredCount + 1;
  [(CRLTraceableResource *)self->_userInteractionIgnoredTraceableResource didAcquireResourceWithToken:v6];

  return v6;
}

- (void)endIgnoringUserInteractionWithToken:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D35F8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101074F20();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3618);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSWindowWrapper endIgnoringUserInteractionWithToken:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSWindowWrapper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:80 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  unint64_t userInteractionIgnoredCount = self->_userInteractionIgnoredCount;
  if (userInteractionIgnoredCount)
  {
    unint64_t v9 = userInteractionIgnoredCount - 1;
    self->_unint64_t userInteractionIgnoredCount = v9;
    if (!v9)
    {
LABEL_13:
      objc_super v10 = [(CRLiOSWindowWrapper *)self window];
      [v10 setUserInteractionEnabled:1];
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3638);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101074E98();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3658);
    }
    int v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSWindowWrapper endIgnoringUserInteractionWithToken:]");
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSWindowWrapper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:85 isFatal:0 description:"Called endIgnoringUserInteractionWithToken without matching beginIgnoringUserInteraction"];

    if (!self->_userInteractionIgnoredCount) {
      goto LABEL_13;
    }
  }
  [(CRLTraceableResource *)self->_userInteractionIgnoredTraceableResource didRelinquishResourceWithToken:v4];
}

- (id)newWrapperBeginningIgnoringUserInteractionSafely
{
  v3 = [(CRLiOSWindowWrapper *)self beginIgnoringUserInteraction];
  id v4 = [[CRLiOSWindowIgnoreUserInteractionSafeWrapper alloc] initWithWindowWrapper:self token:v3];

  return v4;
}

- (BOOL)isInSplitViewMode
{
  v3 = [(CRLiOSWindowWrapper *)self window];
  id v4 = [v3 screen];
  [v4 bounds];
  double Width = CGRectGetWidth(v9);

  v6 = [(CRLiOSWindowWrapper *)self window];
  [v6 bounds];
  double v7 = CGRectGetWidth(v10);

  return Width - v7 >= 100.0;
}

- (int64_t)interfaceOrientation
{
  v2 = [(CRLiOSWindowWrapper *)self window];
  v3 = [v2 screen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if (v5 <= v7) {
    return 1;
  }
  else {
    return 4;
  }
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);

  return (UIWindow *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_window);

  objc_storeStrong((id *)&self->_userInteractionIgnoredTraceableResource, 0);
}

@end