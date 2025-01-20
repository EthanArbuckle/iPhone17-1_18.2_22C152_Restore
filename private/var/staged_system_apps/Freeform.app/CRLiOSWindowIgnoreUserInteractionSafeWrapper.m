@interface CRLiOSWindowIgnoreUserInteractionSafeWrapper
- (CRLiOSWindowIgnoreUserInteractionSafeWrapper)initWithWindowWrapper:(id)a3 token:(id)a4;
- (NSString)description;
- (void)addBreadcrumb:(id)a3;
- (void)dealloc;
- (void)endIgnoringUserInteractionSafely;
- (void)resumeIgnoringUserInteractionSafely;
@end

@implementation CRLiOSWindowIgnoreUserInteractionSafeWrapper

- (CRLiOSWindowIgnoreUserInteractionSafeWrapper)initWithWindowWrapper:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLiOSWindowIgnoreUserInteractionSafeWrapper;
  v8 = [(CRLiOSWindowIgnoreUserInteractionSafeWrapper *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_windowWrapper, v6);
    objc_storeStrong((id *)&v9->_token, a4);
  }

  return v9;
}

- (void)dealloc
{
  unint64_t v3 = self->_token;
  unint64_t v4 = (unint64_t)objc_retainBlock(self->_operationCompletionHandler);
  if (v3 | v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowWrapper);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    v9 = sub_1004CA644;
    v10 = &unk_1014D7D28;
    id v13 = (id)v4;
    objc_super v11 = (CRLTraceableResourceToken *)(id)v3;
    id v12 = WeakRetained;
    id v6 = WeakRetained;
    if (+[NSThread isMainThread]) {
      v9(block);
    }
    else {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSWindowIgnoreUserInteractionSafeWrapper;
  [(CRLiOSWindowIgnoreUserInteractionSafeWrapper *)&v7 dealloc];
}

- (void)endIgnoringUserInteractionSafely
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FFAB8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BC504();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FFAD8);
    }
    unint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v3);
    }
    unint64_t v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSWindowIgnoreUserInteractionSafeWrapper endIgnoringUserInteractionSafely]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSWindowIgnoreUserInteractionSafeWrapper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:50 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  [(CRLiOSWindowIgnoreUserInteractionSafeWrapper *)self resumeIgnoringUserInteractionSafely];
  if (self->_token)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowWrapper);
    [WeakRetained endIgnoringUserInteractionWithToken:self->_token];
    objc_storeWeak((id *)&self->_windowWrapper, 0);
    token = self->_token;
    self->_token = 0;
  }
}

- (void)resumeIgnoringUserInteractionSafely
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FFAF8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BC598();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FFB18);
    }
    unint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v3);
    }
    unint64_t v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSWindowIgnoreUserInteractionSafeWrapper resumeIgnoringUserInteractionSafely]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSWindowIgnoreUserInteractionSafeWrapper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:63 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  operationCompletionHandler = (void (**)(void))self->_operationCompletionHandler;
  if (operationCompletionHandler)
  {
    operationCompletionHandler[2]();
    id v7 = self->_operationCompletionHandler;
  }
  else
  {
    id v7 = 0;
  }
  self->_operationCompletionHandler = 0;
}

- (NSString)description
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  unint64_t v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@: %p> token=%@", v4, self, self->_token];

  return (NSString *)v5;
}

- (void)addBreadcrumb:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_operationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_destroyWeak((id *)&self->_windowWrapper);
}

@end