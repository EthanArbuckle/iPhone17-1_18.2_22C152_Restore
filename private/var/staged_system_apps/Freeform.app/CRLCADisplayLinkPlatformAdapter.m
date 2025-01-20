@interface CRLCADisplayLinkPlatformAdapter
- (BOOL)paused;
- (CRLCADisplayLinkPlatformAdapter)initWithTarget:(id)a3 action:(SEL)a4;
- (void)dealloc;
- (void)invalidate;
- (void)p_displayLinkDidTrigger:(id)a3;
- (void)setPaused:(BOOL)a3;
@end

@implementation CRLCADisplayLinkPlatformAdapter

- (CRLCADisplayLinkPlatformAdapter)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLCADisplayLinkPlatformAdapter;
  v7 = [(CRLCADisplayLinkPlatformAdapter *)&v15 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    if (a4) {
      SEL v9 = a4;
    }
    else {
      SEL v9 = 0;
    }
    v8->_action = v9;
    uint64_t v10 = +[CADisplayLink displayLinkWithTarget:v8 selector:"p_displayLinkDidTrigger:"];
    displayLink = v8->_displayLink;
    v8->_displayLink = (CADisplayLink *)v10;

    [(CADisplayLink *)v8->_displayLink setPaused:1];
    v12 = v8->_displayLink;
    v13 = +[NSRunLoop mainRunLoop];
    [(CADisplayLink *)v12 addToRunLoop:v13 forMode:NSRunLoopCommonModes];
  }
  return v8;
}

- (void)dealloc
{
  if (self->_displayLink)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE408);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101084DA0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE428);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCADisplayLinkPlatformAdapter dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDisplayLinkPlatformAdapter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 40, 0, "expected nil value for '%{public}s'", "_displayLink");
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLCADisplayLinkPlatformAdapter;
  [(CRLCADisplayLinkPlatformAdapter *)&v6 dealloc];
}

- (void)invalidate
{
  displayLink = self->_displayLink;
  if (displayLink) {
    goto LABEL_11;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DE448);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101084E50();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DE468);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v4);
  }
  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCADisplayLinkPlatformAdapter invalidate]");
  objc_super v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDisplayLinkPlatformAdapter.m"];
  +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:44 isFatal:0 description:"Trying to manipulate an invalid display link"];

  displayLink = self->_displayLink;
  if (displayLink)
  {
LABEL_11:
    [(CADisplayLink *)displayLink invalidate];
    v7 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (BOOL)paused
{
  displayLink = self->_displayLink;
  if (displayLink) {
    goto LABEL_11;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DE488);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101084ED8();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DE4A8);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v4);
  }
  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCADisplayLinkPlatformAdapter paused]");
  objc_super v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDisplayLinkPlatformAdapter.m"];
  +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:54 isFatal:0 description:"Trying to manipulate an invalid display link"];

  displayLink = self->_displayLink;
  if (displayLink) {
LABEL_11:
  }
    LOBYTE(displayLink) = [(CADisplayLink *)displayLink isPaused];
  return (char)displayLink;
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  displayLink = self->_displayLink;
  if (displayLink) {
    goto LABEL_11;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DE4C8);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101084F60();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DE4E8);
  }
  objc_super v6 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v6);
  }
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCADisplayLinkPlatformAdapter setPaused:]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDisplayLinkPlatformAdapter.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:63 isFatal:0 description:"Trying to manipulate an invalid display link"];

  displayLink = self->_displayLink;
  if (displayLink) {
LABEL_11:
  }
    [(CADisplayLink *)displayLink setPaused:v3];
}

- (void)p_displayLinkDidTrigger:(id)a3
{
  p_target = &self->_target;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(p_target);
  if (self->_action) {
    action = self->_action;
  }
  else {
    action = 0;
  }
  [v5 timestamp];
  double v8 = v7;
  [v5 targetTimestamp];
  [WeakRetained action:v8 v9];
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end