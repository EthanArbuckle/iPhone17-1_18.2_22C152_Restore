@interface CRLTraceableResourceToken
+ (id)callStackDescriptionWithAction:(id)a3 callStackSymbols:(id)a4 index:(id)a5;
+ (id)p_formattedDateStringFromTimeInterval:(double)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTimeoutPaused;
- (CRLTraceableResourceToken)init;
- (CRLTraceableResourceToken)initWithIntent:(id)a3 timeout:(unint64_t)a4 parent:(id)a5 context:(id)a6 acquireCallStack:(id)a7 acquireTime:(double)a8 logContext:(id)a9;
- (CRLTraceableResourceToken)parent;
- (NSArray)acquireCallStack;
- (NSArray)relinquishCallStack;
- (NSObject)context;
- (NSString)acquireCallStackDescription;
- (NSString)description;
- (NSString)intent;
- (NSString)relinquishCallStackDescription;
- (double)acquireTime;
- (double)relinquishTime;
- (id)acquireCallStackDescriptionWithIndex:(id)a3;
- (id)breadcrumbsDescriptionWithIndex:(id)a3;
- (id)metadataDescriptionWithIndex:(id)a3;
- (id)parentDescriptionWithIndex:(id)a3;
- (int64_t)state;
- (unint64_t)hash;
- (unint64_t)timeout;
- (void)addBreadcrumb:(id)a3;
- (void)dealloc;
- (void)didAcquire;
- (void)extendTimeout:(unint64_t)a3;
- (void)extendTimeout:(unint64_t)a3 updateParent:(BOOL)a4;
- (void)pauseTimeout;
- (void)resumeTimeout;
- (void)setRelinquishCallStackIfNeeded:(id)a3 relinquishTime:(double)a4;
@end

@implementation CRLTraceableResourceToken

- (CRLTraceableResourceToken)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F89A8);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLTraceableResourceToken init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m";
    __int16 v17 = 1024;
    int v18 = 509;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F89C8);
  }
  v4 = off_10166B4A0;
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
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResourceToken init]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:509 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLTraceableResourceToken init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (CRLTraceableResourceToken)initWithIntent:(id)a3 timeout:(unint64_t)a4 parent:(id)a5 context:(id)a6 acquireCallStack:(id)a7 acquireTime:(double)a8 logContext:(id)a9
{
  id v16 = a3;
  id v27 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v28.receiver = self;
  v28.super_class = (Class)CRLTraceableResourceToken;
  v20 = [(CRLTraceableResourceToken *)&v28 init];
  v21 = v20;
  if (v20)
  {
    atomic_store(0, (unint64_t *)&v20->_state);
    v22 = (NSString *)[v16 copy];
    intent = v21->_intent;
    v21->_intent = v22;

    objc_storeStrong((id *)&v21->_parent, a5);
    atomic_store(a4, &v21->_timeout);
    objc_storeStrong((id *)&v21->_context, a6);
    objc_storeStrong((id *)&v21->_acquireCallStack, a7);
    v21->_acquireTime = a8;
    uint64_t v24 = objc_opt_new();
    breadcrumbs = v21->_breadcrumbs;
    v21->_breadcrumbs = (NSMutableArray *)v24;

    objc_storeStrong((id *)&v21->_logContext, a9);
  }

  return v21;
}

- (void)dealloc
{
  if (!self->_relinquishCallStack)
  {
    sub_10041C054();
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F89E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B1270();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8A08);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResourceToken dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 529, 0, "Token was deallocated without getting relinquished: %{public}@", self);
  }
  int v6 = atomic_load((unsigned int *)&self->_timeoutPauseCount);
  if (v6 >= 1)
  {
    sub_10041C054();
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8A28);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B11E4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8A48);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResourceToken dealloc]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 530, 0, "Token was deallocated with paused timeout: %{public}@", self);
  }
  v10.receiver = self;
  v10.super_class = (Class)CRLTraceableResourceToken;
  [(CRLTraceableResourceToken *)&v10 dealloc];
}

- (int64_t)state
{
  return atomic_load((unint64_t *)&self->_state);
}

- (unint64_t)timeout
{
  return atomic_load(&self->_timeout);
}

- (BOOL)isTimeoutPaused
{
  __dmb(0xBu);
  signed int v2 = atomic_load((unsigned int *)&self->_timeoutPauseCount);
  return v2 > 0;
}

- (void)pauseTimeout
{
}

- (void)resumeTimeout
{
  int add = atomic_fetch_add(&self->_timeoutPauseCount, 0xFFFFFFFF);
  if (add <= 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8A68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B12FC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8A88);
    }
    v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResourceToken resumeTimeout]");
    int v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:553 isFatal:0 description:"Unbalanced -pauseTimeout and -resumeTimeout calls."];
  }
  else if (add == 1)
  {
    [(CRLTraceableResourceToken *)self extendTimeout:1 updateParent:0];
  }
  [(CRLTraceableResourceToken *)self->_parent resumeTimeout];
}

- (void)extendTimeout:(unint64_t)a3
{
}

- (void)extendTimeout:(unint64_t)a3 updateParent:(BOOL)a4
{
  if (a4) {
    [(CRLTraceableResourceToken *)self->_parent extendTimeout:"extendTimeout:"];
  }
}

- (void)addBreadcrumb:(id)a3
{
  id v4 = a3;
  if (qword_101719AA8 != -1) {
    dispatch_once(&qword_101719AA8, &stru_1014F8AA8);
  }
  v5 = off_10166B4D8;
  if (os_log_type_enabled((os_log_t)off_10166B4D8, OS_LOG_TYPE_INFO))
  {
    logContext = self->_logContext;
    v7 = v5;
    v8 = [(CRLLogContext *)logContext publicString];
    v9 = [(CRLLogContext *)self->_logContext privateString];
    objc_super v10 = [(CRLTraceableResourceToken *)self intent];
    int v11 = 138544386;
    unsigned int v12 = v8;
    __int16 v13 = 2112;
    v14 = v9;
    __int16 v15 = 2048;
    id v16 = self;
    __int16 v17 = 2114;
    id v18 = v10;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@ %@ Resource %p with '%{public}@' intent added breadcrumb: %{public}@", (uint8_t *)&v11, 0x34u);
  }
  [(NSMutableArray *)self->_breadcrumbs addObject:v4];
  [(CRLTraceableResourceToken *)self extendTimeout:1 updateParent:1];
}

- (NSArray)acquireCallStack
{
  copiedAcquireCallStack = self->_copiedAcquireCallStack;
  if (!copiedAcquireCallStack)
  {
    id v4 = (NSArray *)[(NSArray *)self->_acquireCallStack copy];
    v5 = self->_copiedAcquireCallStack;
    self->_copiedAcquireCallStack = v4;

    copiedAcquireCallStack = self->_copiedAcquireCallStack;
  }

  return copiedAcquireCallStack;
}

- (NSArray)relinquishCallStack
{
  copiedRelinquishCallStack = self->_copiedRelinquishCallStack;
  if (!copiedRelinquishCallStack)
  {
    id v4 = (NSArray *)[(NSArray *)self->_relinquishCallStack copy];
    v5 = self->_copiedRelinquishCallStack;
    self->_copiedRelinquishCallStack = v4;

    copiedRelinquishCallStack = self->_copiedRelinquishCallStack;
  }

  return copiedRelinquishCallStack;
}

- (void)didAcquire
{
  uint64_t v2 = 0;
  atomic_compare_exchange_strong(&self->_state, (unint64_t *)&v2, 1uLL);
  if (v2)
  {
    sub_10041C054();
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8AC8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B1384();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8AE8);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResourceToken didAcquire]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:602 isFatal:0 description:"Unexpected state."];
  }
}

- (void)setRelinquishCallStackIfNeeded:(id)a3 relinquishTime:(double)a4
{
  id v7 = a3;
  uint64_t v8 = 1;
  atomic_compare_exchange_strong(&self->_state, (unint64_t *)&v8, 2uLL);
  if (v8 != 1)
  {
    sub_10041C054();
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8B08);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B140C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8B28);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    objc_super v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResourceToken setRelinquishCallStackIfNeeded:relinquishTime:]");
    int v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:607 isFatal:0 description:"Unexpected state."];
  }
  if (!self->_relinquishCallStack)
  {
    objc_storeStrong((id *)&self->_relinquishCallStack, a3);
    self->_relinquishTime = a4;
  }
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)CRLTraceableResourceToken;
  return [(CRLTraceableResourceToken *)&v3 hash];
}

+ (id)p_formattedDateStringFromTimeInterval:(double)a3
{
  objc_super v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
  id v4 = objc_alloc_init((Class)NSDateFormatter);
  v5 = +[NSLocale currentLocale];
  [v4 setLocale:v5];

  [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSSSSZ"];
  int v6 = [v4 stringFromDate:v3];

  return v6;
}

- (id)metadataDescriptionWithIndex:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  [(CRLTraceableResourceToken *)self acquireTime];
  int v6 = [v5 p_formattedDateStringFromTimeInterval:];
  int64_t v7 = [(CRLTraceableResourceToken *)self state];
  uint64_t v8 = @"WAITING";
  if (v7 == 1) {
    uint64_t v8 = @"ACTIVE";
  }
  if (v7 == 2) {
    uint64_t v8 = @"DONE";
  }
  v9 = v8;
  uint64_t v10 = [(CRLTraceableResourceToken *)self intent];
  int v11 = (void *)v10;
  if (v4) {
    +[NSString stringWithFormat:@"[%@] %@ '%@' %@", v4, v9, v10, v6];
  }
  else {
  unsigned int v12 = +[NSString stringWithFormat:@"'%@' %@ %@", v9, v10, v6, v14];
  }

  return v12;
}

- (NSString)acquireCallStackDescription
{
  objc_super v3 = objc_opt_class();
  id v4 = [(CRLTraceableResourceToken *)self acquireCallStack];
  v5 = [v3 callStackDescriptionWithAction:&stru_101538650 callStackSymbols:v4 index:0];

  return (NSString *)v5;
}

- (NSString)relinquishCallStackDescription
{
  objc_super v3 = objc_opt_class();
  id v4 = [(CRLTraceableResourceToken *)self relinquishCallStack];
  v5 = [v3 callStackDescriptionWithAction:&stru_101538650 callStackSymbols:v4 index:0];

  return (NSString *)v5;
}

- (id)acquireCallStackDescriptionWithIndex:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  int v6 = [(CRLTraceableResourceToken *)self acquireCallStack];
  int64_t v7 = [v5 callStackDescriptionWithAction:&stru_101538650 callStackSymbols:v6 index:v4];

  return v7;
}

+ (id)callStackDescriptionWithAction:(id)a3 callStackSymbols:(id)a4 index:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_opt_new();
  id v11 = [v9 length];
  CFStringRef v12 = @" ";
  if (!v11) {
    CFStringRef v12 = &stru_101538650;
  }
  if (v7) {
    [v10 appendFormat:@"[%@] %@%@backtrace:", v7, v9, v12];
  }
  else {
    [v10 appendFormat:@"%@%@backtrace:", v9, v12, v15];
  }

  __int16 v13 = +[CRLAssertionHandler packedBacktraceStringWithReturnAddresses:v8];

  [v10 appendFormat:@" %@", v13];

  return v10;
}

- (id)breadcrumbsDescriptionWithIndex:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableArray *)self->_breadcrumbs count];
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_opt_new();
    id v8 = v7;
    if (v4) {
      [v7 appendFormat:@"[%@] %tu breadcrumb(s): ("], v4, v6;
    }
    else {
      [v7 appendFormat:@"%tu breadcrumb(s): ("], v6, v12;
    }
    breadcrumbs = self->_breadcrumbs;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100420CA8;
    v13[3] = &unk_1014CCFA8;
    id v9 = v8;
    uint64_t v14 = v9;
    [(NSMutableArray *)breadcrumbs enumerateObjectsWithOptions:2 usingBlock:v13];
    [(__CFString *)v9 appendString:@""]);
  }
  else
  {
    id v9 = &stru_101538650;
  }

  return v9;
}

- (id)parentDescriptionWithIndex:(id)a3
{
  id v4 = a3;
  if (self->_parent)
  {
    id v5 = objc_alloc((Class)NSString);
    parent = self->_parent;
    uint64_t v7 = [(CRLTraceableResourceToken *)parent intent];
    id v8 = (void *)v7;
    if (v4) {
      id v9 = (__CFString *)[v5 initWithFormat:@"[%@] parent: %p '%@'", v4, parent, v7];
    }
    else {
      id v9 = (__CFString *)[v5 initWithFormat:@"parent: %p '%@'", parent, v7, v12];
    }
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = &stru_101538650;
  }

  return v10;
}

- (NSString)description
{
  objc_super v3 = [(CRLTraceableResourceToken *)self relinquishCallStack];
  id v4 = [(CRLTraceableResourceToken *)self context];
  objc_super v28 = v4;
  if (v4)
  {
    id v5 = [v4 description];
    CFStringRef v27 = +[NSString stringWithFormat:@"context: %@\n", v5];

    if (v3)
    {
LABEL_3:
      id v6 = objc_opt_class();
      [(CRLTraceableResourceToken *)self acquireTime];
      uint64_t v7 = [v6 p_formattedDateStringFromTimeInterval:];
      id v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      uint64_t v10 = [(CRLTraceableResourceToken *)self metadataDescriptionWithIndex:0];
      id v11 = objc_opt_class();
      uint64_t v26 = [(CRLTraceableResourceToken *)self acquireCallStack];
      uint64_t v12 = [v11 callStackDescriptionWithAction:@"Acquire" callStackSymbols:v26 index:0];
      __int16 v13 = [(id)objc_opt_class() callStackDescriptionWithAction:@"Relinquish" callStackSymbols:v3 index:0];
      uint64_t v14 = [(CRLTraceableResourceToken *)self breadcrumbsDescriptionWithIndex:0];
      [(CRLTraceableResourceToken *)self parentDescriptionWithIndex:0];
      v16 = uint64_t v15 = v3;
      __int16 v17 = (__CFString *)v27;
      v25 = self;
      id v18 = (void *)v9;
      __int16 v19 = +[NSString stringWithFormat:@"<%@: %p>\n%@%@\n%@\n%@\n%@\n%@\n%@", v9, v25, v27, v10, v12, v7, v13, v14, v16];

      objc_super v3 = v15;
      id v20 = (void *)v26;

      v21 = v18;
      goto LABEL_6;
    }
  }
  else
  {
    CFStringRef v27 = &stru_101538650;
    if (v3) {
      goto LABEL_3;
    }
  }
  v22 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v22);
  v21 = [(CRLTraceableResourceToken *)self metadataDescriptionWithIndex:0];
  v23 = objc_opt_class();
  uint64_t v10 = [(CRLTraceableResourceToken *)self acquireCallStack];
  id v20 = [v23 callStackDescriptionWithAction:@"Acquire" callStackSymbols:v10 index:0];
  uint64_t v12 = [(CRLTraceableResourceToken *)self breadcrumbsDescriptionWithIndex:0];
  __int16 v13 = [(CRLTraceableResourceToken *)self parentDescriptionWithIndex:0];
  __int16 v17 = (__CFString *)v27;
  __int16 v19 = +[NSString stringWithFormat:@"<%@: %p>\n%@%@\n%@\n%@\n%@", v7, self, v27, v21, v20, v12, v13];
LABEL_6:

  return (NSString *)v19;
}

- (NSString)intent
{
  return self->_intent;
}

- (CRLTraceableResourceToken)parent
{
  return self->_parent;
}

- (NSObject)context
{
  return self->_context;
}

- (double)acquireTime
{
  return self->_acquireTime;
}

- (double)relinquishTime
{
  return self->_relinquishTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_logContext, 0);
  objc_storeStrong((id *)&self->_breadcrumbs, 0);
  objc_storeStrong((id *)&self->_copiedRelinquishCallStack, 0);
  objc_storeStrong((id *)&self->_relinquishCallStack, 0);
  objc_storeStrong((id *)&self->_copiedAcquireCallStack, 0);

  objc_storeStrong((id *)&self->_acquireCallStack, 0);
}

@end