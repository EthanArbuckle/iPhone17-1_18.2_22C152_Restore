@interface CRLDisplayLink
- (BOOL)paused;
- (CRLDisplayLink)initWithHandler:(id)a3;
- (id)p_initWithHandler:(id)a3 manager:(id)a4;
- (id)p_manager;
- (void)i_triggerHandlerAtTime:(double)a3 targetTime:(double)a4;
- (void)invalidate;
- (void)setPaused:(BOOL)a3;
@end

@implementation CRLDisplayLink

- (id)p_initWithHandler:(id)a3 manager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLDisplayLink;
  v8 = [(CRLDisplayLink *)&v12 init];
  if (v8)
  {
    id v9 = [v6 copy];
    id handler = v8->_handler;
    v8->_id handler = v9;

    *(_WORD *)&v8->_paused = 257;
    [v7 addLink:v8];
  }

  return v8;
}

- (CRLDisplayLink)initWithHandler:(id)a3
{
  id v4 = a3;
  v5 = +[CRLDisplayLinkManager sharedManager];
  id v6 = [(CRLDisplayLink *)self p_initWithHandler:v4 manager:v5];

  return v6;
}

- (id)p_manager
{
  return +[CRLDisplayLinkManager sharedManager];
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_valid) {
    goto LABEL_11;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E6530);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010924B0();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E6550);
  }
  v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010668E0(v5);
  }
  id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDisplayLink setPaused:]");
  id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDisplayLink.m"];
  +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:71 isFatal:0 description:"Can't pause an invalid display link."];

  if (self->_valid)
  {
LABEL_11:
    if (self->_paused != v3)
    {
      self->_paused = v3;
      v8 = [(CRLDisplayLink *)self p_manager];
      [v8 updatePausedForLink:self];
    }
  }
}

- (void)invalidate
{
  BOOL v3 = [(CRLDisplayLink *)self p_manager];
  [v3 removeLink:self];

  self->_valid = 0;
}

- (void)i_triggerHandlerAtTime:(double)a3 targetTime:(double)a4
{
}

- (BOOL)paused
{
  return self->_paused;
}

- (void).cxx_destruct
{
}

@end