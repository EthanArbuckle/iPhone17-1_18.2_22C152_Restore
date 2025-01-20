@interface CRLCanvasAnimation
- (CAMediaTimingFunction)timingFunction;
- (CRLCanvasAnimation)initWithAnimationID:(id)a3;
- (NSString)animationID;
- (double)duration;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)completionBlock;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setAnimation:(id)a3 forLayer:(id)a4 forKey:(id)a5;
- (void)setCompletionBlock:(id)a3;
- (void)setDuration:(double)a3;
- (void)setTimingFunction:(id)a3;
@end

@implementation CRLCanvasAnimation

- (CRLCanvasAnimation)initWithAnimationID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLCanvasAnimation;
  v6 = [(CRLCanvasAnimation *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_animationID, a3);
    v7->_duration = 0.2;
    uint64_t v8 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    timingFunction = v7->_timingFunction;
    v7->_timingFunction = (CAMediaTimingFunction *)v8;

    v7->_allAnimationsFinishedBeforeStopping = 1;
  }

  return v7;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v7 = [(NSMapTable *)self->_animationDictionariesForLayers objectForKeyedSubscript:a3];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];
  if (!v8)
  {
    if (self->_firstAnimationDidStart)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DE0A8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010847C0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DE0C8);
      }
      v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v9);
      }
      v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAnimation actionForLayer:forKey:]");
      objc_super v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAnimation.m"];
      +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:53 isFatal:0 description:"shouldn't be adding animations after we've started showing them"];
    }
    uint64_t v8 = +[CABasicAnimation animationWithKeyPath:v6];
    [v8 setDuration:self->_duration];
    [v8 setTimingFunction:self->_timingFunction];
  }
  [v8 setDelegate:self];
  ++self->_outstandingAnimationCount;

  return v8;
}

- (void)setAnimation:(id)a3 forLayer:(id)a4 forKey:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  animationDictionariesForLayers = self->_animationDictionariesForLayers;
  if (!animationDictionariesForLayers)
  {
    objc_super v11 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:5 valueOptions:0 capacity:0];
    v12 = self->_animationDictionariesForLayers;
    self->_animationDictionariesForLayers = v11;

    animationDictionariesForLayers = self->_animationDictionariesForLayers;
  }
  v13 = [(NSMapTable *)animationDictionariesForLayers objectForKeyedSubscript:v8];
  if (!v13)
  {
    v13 = +[NSMapTable strongToWeakObjectsMapTable];
    [(NSMapTable *)self->_animationDictionariesForLayers setObject:v13 forKeyedSubscript:v8];
  }
  [v13 setObject:v14 forKeyedSubscript:v9];
}

- (void)animationDidStart:(id)a3
{
  id v4 = a3;
  if (!self->_outstandingAnimationCount)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE0E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101084848();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE108);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAnimation animationDidStart:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAnimation.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:87 isFatal:0 description:"unexpected animation started"];
  }
  if (!self->_firstAnimationDidStart) {
    self->_firstAnimationDidStart = 1;
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v6 = a3;
  if (!self->_outstandingAnimationCount)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE128);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101084958();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE148);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAnimation animationDidStop:finished:]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAnimation.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:95 isFatal:0 description:"unexpected animation stopped"];
  }
  if (!self->_firstAnimationDidStart)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE168);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010848D0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE188);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    objc_super v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAnimation animationDidStop:finished:]");
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAnimation.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:96 isFatal:0 description:"animation stopped before starting"];
  }
  unsigned int outstandingAnimationCount = self->_outstandingAnimationCount;
  BOOL v14 = self->_allAnimationsFinishedBeforeStopping || a4;
  self->_allAnimationsFinishedBeforeStopping = v14;
  unsigned int v15 = outstandingAnimationCount - 1;
  self->_unsigned int outstandingAnimationCount = v15;
  if (!v15)
  {
    completionBlock = (void (**)(void))self->_completionBlock;
    if (completionBlock) {
      completionBlock[2]();
    }
  }
}

- (NSString)animationID
{
  return self->_animationID;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
  objc_storeStrong((id *)&self->_animationID, 0);

  objc_storeStrong((id *)&self->_animationDictionariesForLayers, 0);
}

@end