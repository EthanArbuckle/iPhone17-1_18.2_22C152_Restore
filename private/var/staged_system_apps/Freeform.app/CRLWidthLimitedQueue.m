@interface CRLWidthLimitedQueue
- (CRLWidthLimitedQueue)init;
- (CRLWidthLimitedQueue)initWithLimit:(unint64_t)a3;
- (CRLWidthLimitedQueue)initWithLimit:(unint64_t)a3 name:(id)a4;
- (CRLWidthLimitedQueue)initWithLimit:(unint64_t)a3 name:(id)a4 targetQueue:(id)a5;
- (void)performAsync:(id)a3;
- (void)performSync:(id)a3;
@end

@implementation CRLWidthLimitedQueue

- (CRLWidthLimitedQueue)init
{
  return [(CRLWidthLimitedQueue *)self initWithLimit:qword_101719D08];
}

- (CRLWidthLimitedQueue)initWithLimit:(unint64_t)a3
{
  return [(CRLWidthLimitedQueue *)self initWithLimit:a3 name:0 targetQueue:0];
}

- (CRLWidthLimitedQueue)initWithLimit:(unint64_t)a3 name:(id)a4
{
  return [(CRLWidthLimitedQueue *)self initWithLimit:a3 name:a4 targetQueue:0];
}

- (CRLWidthLimitedQueue)initWithLimit:(unint64_t)a3 name:(id)a4 targetQueue:(id)a5
{
  v8 = (__CFString *)a4;
  v9 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CRLWidthLimitedQueue;
  v10 = [(CRLWidthLimitedQueue *)&v29 init];
  if (!v10) {
    goto LABEL_30;
  }
  if (qword_101719D08 != a3)
  {
    if (a3) {
      goto LABEL_4;
    }
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA310);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B3144();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA330);
    }
    v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v15);
    }
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWidthLimitedQueue initWithLimit:name:targetQueue:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLWidthLimitedQueue.m"];
    +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:48 isFatal:0 description:"Queue limit should be at least one."];

    a3 = 1;
    if (!v8) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  v11 = +[NSProcessInfo processInfo];
  id v12 = [v11 processorCount];

  if ((unint64_t)v12 <= 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = (uint64_t)v12;
  }
  unint64_t v14 = 2 * v13;
  if (v14 >= 0x18) {
    a3 = 24;
  }
  else {
    a3 = v14;
  }
  if (!a3) {
    goto LABEL_13;
  }
LABEL_4:
  if (!v8) {
    goto LABEL_23;
  }
LABEL_22:
  if (![(__CFString *)v8 length])
  {
LABEL_23:

    v8 = @"com.apple.freeform.limitedqueue";
  }
  if (a3 >> 31)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA350);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B30B0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA370);
    }
    v26 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v26);
    }
    v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWidthLimitedQueue initWithLimit:name:targetQueue:]");
    v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLWidthLimitedQueue.m"];
    +[CRLAssertionHandler handleFailureInFunction:v27 file:v28 lineNumber:56 isFatal:0 description:"Out-of-bounds type assignment was clamped to max"];

    LODWORD(a3) = 0x7FFFFFFF;
  }
  v10->mReaderCount = 0;
  v10->mLimit = a3;
  id v18 = [(__CFString *)v8 stringByAppendingString:@".manager"];
  v19 = (const char *)[v18 UTF8String];
  if (!v19) {
    v19 = "com.apple.freeform.limitedqueue.manager";
  }
  dispatch_queue_t v20 = dispatch_queue_create(v19, 0);
  mManagerQueue = v10->mManagerQueue;
  v10->mManagerQueue = (OS_dispatch_queue *)v20;

  v8 = v8;
  v22 = (const char *)[(__CFString *)v8 UTF8String];
  if (!v22) {
    v22 = "com.apple.freeform.limitedqueue";
  }
  dispatch_queue_t v23 = dispatch_queue_create_with_target_V2(v22, (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, v9);
  mTargetQueue = v10->mTargetQueue;
  v10->mTargetQueue = (OS_dispatch_queue *)v23;

  v10->mUnfairLock._os_unfair_lock_opaque = 0;
  __dmb(0xBu);
LABEL_30:

  return v10;
}

- (void)performAsync:(id)a3
{
  id v4 = a3;
  mManagerQueue = self->mManagerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004469A0;
  v7[3] = &unk_1014D0AB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(mManagerQueue, v7);
}

- (void)performSync:(id)a3
{
  id v4 = a3;
  mManagerQueue = self->mManagerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100446B90;
  v7[3] = &unk_1014D0AB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(mManagerQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTargetQueue, 0);

  objc_storeStrong((id *)&self->mManagerQueue, 0);
}

@end