@interface CRLiOSGestureDispatcherLogger
- (BOOL)gestureSessionStarted;
- (BOOL)logNextGesture;
- (NSMutableDictionary)gestureLogDictionary;
- (void)endGestureLoggingSession;
- (void)logEndStateForGesture:(id)a3;
- (void)logGesture:(id)a3 atUnscaledLocation:(CGPoint)a4;
- (void)logStartStateForGesture:(id)a3;
- (void)setGestureLogDictionary:(id)a3;
- (void)setGestureSessionStarted:(BOOL)a3;
- (void)setLogNextGesture:(BOOL)a3;
- (void)startGestureLoggingSession;
@end

@implementation CRLiOSGestureDispatcherLogger

- (void)setLogNextGesture:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:v3 forKey:@"TSDDebugDumpNextTextGesture"];
}

- (BOOL)logNextGesture
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"TSDDebugDumpNextTextGesture"];

  return v3;
}

- (void)startGestureLoggingSession
{
  if ([(CRLiOSGestureDispatcherLogger *)self logNextGesture])
  {
    unsigned __int8 v3 = objc_opt_new();
    [(CRLiOSGestureDispatcherLogger *)self setGestureLogDictionary:v3];

    [(CRLiOSGestureDispatcherLogger *)self setGestureSessionStarted:1];
  }
}

- (void)logStartStateForGesture:(id)a3
{
  id v4 = a3;
  if ([(CRLiOSGestureDispatcherLogger *)self logNextGesture])
  {
    if (![(CRLiOSGestureDispatcherLogger *)self gestureSessionStarted])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1E68);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108B0E8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1E88);
      }
      v5 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v5);
      }
      v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSGestureDispatcherLogger logStartStateForGesture:]");
      v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSGestureDispatcherLogger.m"];
      +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:59 isFatal:0 description:"The gesture session should have been started before logging"];
    }
    v8 = [(CRLiOSGestureDispatcherLogger *)self gestureLogDictionary];
    v9 = [v4 gestureKind];
    v10 = [v8 objectForKeyedSubscript:v9];

    if (!v10)
    {
      v10 = objc_opt_new();
      v11 = [v4 gestureKind];
      [v10 setObject:v11 forKeyedSubscript:@"gestureKind"];

      v12 = objc_opt_new();
      [v10 setObject:v12 forKeyedSubscript:@"allTouchesArray"];

      v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 inputType]);
      [v10 setObject:v13 forKeyedSubscript:@"inputType"];

      v14 = [v4 cachedGestureTarget];
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        v16 = [v4 cachedGestureTarget];
        v17 = [v16 targetStateForGestureLog];
        [v10 setObject:v17 forKeyedSubscript:@"targetStartState"];
      }
      v18 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 tsdModifierFlags]);
      [v10 setObject:v18 forKeyedSubscript:@"modifierFlags"];

      v19 = [(CRLiOSGestureDispatcherLogger *)self gestureLogDictionary];
      v20 = [v4 gestureKind];
      [v19 setObject:v10 forKeyedSubscript:v20];
    }
  }
}

- (void)logGesture:(id)a3 atUnscaledLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  if ([(CRLiOSGestureDispatcherLogger *)self logNextGesture])
  {
    if (![(CRLiOSGestureDispatcherLogger *)self gestureSessionStarted])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1EA8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108B220();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1EC8);
      }
      v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v8);
      }
      v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSGestureDispatcherLogger logGesture:atUnscaledLocation:]");
      v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSGestureDispatcherLogger.m"];
      +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:80 isFatal:0 description:"The gesture session should have been started before logging"];
    }
    v11 = [(CRLiOSGestureDispatcherLogger *)self gestureLogDictionary];
    v12 = [v7 gestureKind];
    v13 = [v11 objectForKeyedSubscript:v12];

    if (v13)
    {
      v14 = objc_opt_new();
      char v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 gestureState]);
      [v14 setObject:v15 forKeyedSubscript:@"gestureState"];

      v16 = +[NSNumber numberWithDouble:x];
      v21[0] = v16;
      v17 = +[NSNumber numberWithDouble:y];
      v21[1] = v17;
      v18 = +[NSArray arrayWithObjects:v21 count:2];
      [v14 setObject:v18 forKeyedSubscript:@"locationInView"];

      v19 = [v13 objectForKeyedSubscript:@"allTouchesArray"];
      [v19 addObject:v14];
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1EE8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108B170();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1F08);
      }
      v20 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v20);
      }
      v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSGestureDispatcherLogger logGesture:atUnscaledLocation:]");
      v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSGestureDispatcherLogger.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v19, 83, 0, "invalid nil value for '%{public}s'", "singleGestureStateDictionary");
    }
  }
}

- (void)logEndStateForGesture:(id)a3
{
  id v4 = a3;
  if ([(CRLiOSGestureDispatcherLogger *)self logNextGesture])
  {
    if (![(CRLiOSGestureDispatcherLogger *)self gestureSessionStarted])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1F28);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108B358();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1F48);
      }
      v5 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v5);
      }
      v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSGestureDispatcherLogger logEndStateForGesture:]");
      id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSGestureDispatcherLogger.m"];
      +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:96 isFatal:0 description:"The gesture session should have been started before logging"];
    }
    v8 = [(CRLiOSGestureDispatcherLogger *)self gestureLogDictionary];
    v9 = [v4 gestureKind];
    v10 = [v8 objectForKeyedSubscript:v9];

    if (v10)
    {
      v11 = [v4 cachedGestureTarget];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        v13 = [v4 cachedGestureTarget];
        v14 = [v13 targetStateForGestureLog];
        [v10 setObject:v14 forKeyedSubscript:@"targetEndState"];
      }
      char v15 = [(CRLiOSGestureDispatcherLogger *)self gestureLogDictionary];
      v16 = [v4 gestureKind];
      [v15 setObject:v10 forKeyedSubscript:v16];
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1F68);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108B2A8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1F88);
      }
      v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v17);
      }
      char v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSGestureDispatcherLogger logEndStateForGesture:]");
      v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSGestureDispatcherLogger.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 98, 0, "invalid nil value for '%{public}s'", "singleGestureStateDictionary");
    }
  }
}

- (void)endGestureLoggingSession
{
  if ([(CRLiOSGestureDispatcherLogger *)self logNextGesture])
  {
    unsigned __int8 v3 = [(CRLiOSGestureDispatcherLogger *)self gestureLogDictionary];
    uint64_t v9 = 0;
    id v4 = +[NSJSONSerialization dataWithJSONObject:v3 options:1 error:&v9];

    v5 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    v6 = [v5 objectAtIndex:0];
    id v7 = [v6 stringByAppendingPathComponent:@"CRLGestureDispatcherLog.json"];
    v8 = +[NSFileManager defaultManager];
    [v8 createFileAtPath:v7 contents:v4 attributes:0];

    [(CRLiOSGestureDispatcherLogger *)self setGestureLogDictionary:0];
    [(CRLiOSGestureDispatcherLogger *)self setLogNextGesture:0];
    [(CRLiOSGestureDispatcherLogger *)self setGestureSessionStarted:0];
  }
}

- (BOOL)gestureSessionStarted
{
  return self->_gestureSessionStarted;
}

- (void)setGestureSessionStarted:(BOOL)a3
{
  self->_gestureSessionStarted = a3;
}

- (NSMutableDictionary)gestureLogDictionary
{
  return self->_gestureLogDictionary;
}

- (void)setGestureLogDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end