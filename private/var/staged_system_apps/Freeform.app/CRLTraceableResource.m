@interface CRLTraceableResource
- (BOOL)printTimeoutAsError;
- (CRLLogContext)logContext;
- (CRLTraceableResource)init;
- (CRLTraceableResource)initWithName:(id)a3 logContext:(id)a4;
- (NSString)name;
- (id)description;
- (id)p_tokenSerializationDescriptionFromQueue;
- (id)tokenSerializationDescription;
- (id)willAcquireResourceWithIntent:(id)a3 timeout:(unint64_t)a4 parent:(id)a5;
- (id)willAcquireResourceWithIntent:(id)a3 timeout:(unint64_t)a4 parent:(id)a5 context:(id)a6;
- (void)addToken:(id)a3 isForTemporaryRelinquish:(BOOL)a4;
- (void)didAcquireResourceWithToken:(id)a3;
- (void)didRelinquishResourceWithToken:(id)a3;
- (void)logSerializationAsError;
- (void)logSerializationAsErrorWithPrefix:(id)a3;
- (void)p_logDebugTokenSerializationDescriptionFromQueue;
- (void)p_logErrorTokenSerializationDescriptionFromQueueWithPrefix:(id)a3;
- (void)removeToken:(id)a3 isForTemporaryRelinquish:(BOOL)a4;
- (void)scheduleRelinquishTimeoutForToken:(id)a3 timeout:(unint64_t)a4 isForTemporaryRelinquish:(BOOL)a5;
- (void)setLogContext:(id)a3;
- (void)setPrintTimeoutAsError:(BOOL)a3;
- (void)temporarilyRelinquishForToken:(id)a3 usingBlock:(id)a4;
@end

@implementation CRLTraceableResource

- (CRLTraceableResource)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F8510);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLTraceableResource init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m";
    __int16 v17 = 1024;
    int v18 = 103;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F8530);
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
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResource init]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:103 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLTraceableResource init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (CRLTraceableResource)initWithName:(id)a3 logContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CRLTraceableResource;
  v8 = [(CRLTraceableResource *)&v22 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    name = v8->_name;
    v8->_name = v9;

    v8->_printTimeoutAsError = 1;
    objc_storeStrong((id *)&v8->_logContext, a4);
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    tokens = v8->_tokens;
    v8->_tokens = v11;

    __int16 v13 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:512 capacity:0];
    timeoutBlocksMap = v8->_timeoutBlocksMap;
    v8->_timeoutBlocksMap = v13;

    id v15 = [objc_alloc((Class)NSString) initWithFormat:@"CRLTraceableResource.[%@]", v6];
    v16 = (const char *)[v15 UTF8String];
    __int16 v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create(v16, v17);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v18;

    v20 = +[CRLTraceableResourceManager sharedManager];
    [v20 registerTraceableResource:v8];
  }
  return v8;
}

- (id)willAcquireResourceWithIntent:(id)a3 timeout:(unint64_t)a4 parent:(id)a5 context:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  __int16 v13 = +[NSThread callStackReturnAddresses];
  +[NSDate timeIntervalSinceReferenceDate];
  id v15 = [[CRLTraceableResourceToken alloc] initWithIntent:v12 timeout:a4 parent:v11 context:v10 acquireCallStack:v13 acquireTime:self->_logContext logContext:v14];

  queue = self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10041BE5C;
  v21[3] = &unk_1014CBE78;
  v21[4] = self;
  __int16 v17 = v15;
  objc_super v22 = v17;
  dispatch_async(queue, v21);
  dispatch_queue_t v18 = v22;
  v19 = v17;

  return v19;
}

- (id)willAcquireResourceWithIntent:(id)a3 timeout:(unint64_t)a4 parent:(id)a5
{
  return [(CRLTraceableResource *)self willAcquireResourceWithIntent:a3 timeout:a4 parent:a5 context:0];
}

- (void)didAcquireResourceWithToken:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    sub_10041C054();
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8550);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B0928();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8570);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Token cannot be nil.", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[CRLTraceableResource didAcquireResourceWithToken:]");
    id v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResource didAcquireResourceWithToken:]");
    v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:149 isFatal:1 description:"Token cannot be nil."];

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v17, v18);
    abort();
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10041C124;
  block[3] = &unk_1014CBBB0;
  id v20 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)didRelinquishResourceWithToken:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    sub_10041C054();
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8590);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B09B0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F85B0);
    }
    uint64_t v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Token cannot be nil.", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[CRLTraceableResource didRelinquishResourceWithToken:]");
    v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResource didRelinquishResourceWithToken:]");
    id v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v19 file:v20 lineNumber:157 isFatal:1 description:"Token cannot be nil."];

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v21, v22);
    abort();
  }
  v5 = v4;
  id v6 = +[NSThread callStackReturnAddresses];
  +[NSDate timeIntervalSinceReferenceDate];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10041C3D4;
  block[3] = &unk_1014EB870;
  id v24 = v5;
  id v25 = v6;
  uint64_t v27 = v8;
  v26 = self;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(queue, block);
}

- (void)temporarilyRelinquishForToken:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    sub_10041C054();
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8610);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B0AE0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8630);
    }
    uint64_t v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B0A38(v14);
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Token cannot be nil.", v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[CRLTraceableResource temporarilyRelinquishForToken:usingBlock:]");
    Swift::String v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResource temporarilyRelinquishForToken:usingBlock:]");
    v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v22 file:v23 lineNumber:180 isFatal:1 description:"Token cannot be nil."];

LABEL_22:
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v24, *(Swift::String *)&v25);
    abort();
  }
  uint64_t v8 = (void (**)(void, void))v7;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10041CC20;
  block[3] = &unk_1014CBBB0;
  void block[4] = self;
  dispatch_sync(queue, block);
  if (([(NSMutableArray *)self->_tokens containsObject:v6] & 1) == 0)
  {
    sub_10041C054();
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8650);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B0C10();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8670);
    }
    uint64_t v27 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B0B68(v27);
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Attempted to temporarily relinquish token that has already been relinquished: %{public}@", v28, v29, v30, v31, v32, v33, v34, (uint64_t)"-[CRLTraceableResource temporarilyRelinquishForToken:usingBlock:]");
    v35 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResource temporarilyRelinquishForToken:usingBlock:]");
    v36 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, v36, 187, 1, "Attempted to temporarily relinquish token that has already been relinquished: %{public}@", v6, "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m", 187, v6);

    goto LABEL_22;
  }
  id v10 = [(NSMutableArray *)self->_tokens copy];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10041CCB4;
  v44[3] = &unk_1014F8698;
  v44[4] = self;
  [v10 enumerateObjectsWithOptions:2 usingBlock:v44];
  uint64_t v11 = objc_alloc_init(CRLTraceableResourceTemporaryRelinquishToken);
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10041CCC4;
  v37[3] = &unk_1014F8700;
  v41 = v42;
  id v12 = v10;
  id v38 = v12;
  v39 = self;
  uint64_t v13 = v11;
  v40 = v13;
  ((void (**)(void, void *))v8)[2](v8, v37);

  _Block_object_dispose(v42, 8);
}

- (void)addToken:(id)a3 isForTemporaryRelinquish:(BOOL)a4
{
  [(NSMutableArray *)self->_tokens addObject:a3];
  if (!a4)
  {
    id v6 = [(NSMutableArray *)self->_tokens firstObject];
    if (v6)
    {
      id v7 = v6;
      -[CRLTraceableResource scheduleRelinquishTimeoutForToken:timeout:isForTemporaryRelinquish:](self, "scheduleRelinquishTimeoutForToken:timeout:isForTemporaryRelinquish:", v6, [v6 timeout], 0);
      id v6 = v7;
    }
  }
}

- (void)removeToken:(id)a3 isForTemporaryRelinquish:(BOOL)a4
{
  tokens = self->_tokens;
  id v7 = a3;
  [(NSMutableArray *)tokens removeObject:v7];
  uint64_t v8 = [(NSMapTable *)self->_timeoutBlocksMap objectForKey:v7];
  [(NSMapTable *)self->_timeoutBlocksMap removeObjectForKey:v7];

  if (v8) {
    dispatch_block_cancel(v8);
  }
  if (!a4)
  {
    id v9 = [(NSMutableArray *)self->_tokens firstObject];
    id v10 = v9;
    if (v9) {
      -[CRLTraceableResource scheduleRelinquishTimeoutForToken:timeout:isForTemporaryRelinquish:](self, "scheduleRelinquishTimeoutForToken:timeout:isForTemporaryRelinquish:", v9, [v9 timeout], 0);
    }
  }
  if (![(NSMutableArray *)self->_tokens count] && [(NSMapTable *)self->_timeoutBlocksMap count])
  {
    sub_10041C054();
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8720);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B0D24();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8740);
    }
    uint64_t v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResource removeToken:isForTemporaryRelinquish:]");
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:254 isFatal:0 description:"Removing all tokens should also cancel all timeout blocks."];
  }
}

- (void)scheduleRelinquishTimeoutForToken:(id)a3 timeout:(unint64_t)a4 isForTemporaryRelinquish:(BOOL)a5
{
  id v8 = a3;
  id v9 = [(NSMapTable *)self->_timeoutBlocksMap objectForKey:v8];

  if (!v9)
  {
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    uint64_t v17 = sub_10041D3F8;
    uint64_t v18 = &unk_1014D9A00;
    uint64_t v19 = self;
    id v10 = v8;
    id v20 = v10;
    unint64_t v21 = a4;
    BOOL v22 = a5;
    dispatch_block_t v11 = dispatch_block_create((dispatch_block_flags_t)0, &v15);
    timeoutBlocksMap = self->_timeoutBlocksMap;
    id v13 = objc_retainBlock(v11);
    -[NSMapTable setObject:forKey:](timeoutBlocksMap, "setObject:forKey:", v13, v10, v15, v16, v17, v18, v19);

    dispatch_time_t v14 = dispatch_time(0, 1000000000 * a4);
    dispatch_after(v14, (dispatch_queue_t)self->_queue, v11);
  }
}

- (id)tokenSerializationDescription
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10041D834;
  id v10 = sub_10041D844;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10041D84C;
  v5[3] = &unk_1014CB090;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)logSerializationAsError
{
}

- (void)logSerializationAsErrorWithPrefix:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10041D93C;
  v7[3] = &unk_1014CBE78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)p_logErrorTokenSerializationDescriptionFromQueueWithPrefix:(id)a3
{
  id v53 = a3;
  unint64_t add = atomic_fetch_add(&qword_1016A9A98, 1uLL);
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014F87A0);
  }
  id v3 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR))
  {
    logContext = self->_logContext;
    v40 = v3;
    v41 = [(CRLLogContext *)logContext publicString];
    v42 = [(CRLLogContext *)self->_logContext privateString];
    name = self->_name;
    id v44 = [(NSMutableArray *)self->_tokens count];
    *(_DWORD *)buf = 138544642;
    v63 = v41;
    __int16 v64 = 2112;
    v65 = v42;
    __int16 v66 = 2114;
    id v67 = v53;
    __int16 v68 = 2048;
    unint64_t v69 = add;
    __int16 v70 = 2112;
    v71 = name;
    __int16 v72 = 2048;
    id v73 = v44;
    _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}@ %@ %{public}@┏ %llx '%@' pending resource requests (%tu total)", buf, 0x3Eu);
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v4 = self->_tokens;
  id v56 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v56)
  {
    uint64_t v6 = 0;
    uint64_t v55 = *(void *)v58;
    *(void *)&long long v5 = 138544642;
    long long v49 = v5;
    v50 = v4;
    do
    {
      id v7 = 0;
      uint64_t v54 = v6;
      do
      {
        if (*(void *)v58 != v55) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(id *)(*((void *)&v57 + 1) + 8 * (void)v7);
        if (qword_101719A68 != -1) {
          dispatch_once(&qword_101719A68, &stru_1014F87C0);
        }
        id v9 = (char *)v7 + v6;
        id v10 = off_10166B498;
        if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = self->_logContext;
          uint64_t v19 = v10;
          id v20 = [(CRLLogContext *)v18 publicString];
          unint64_t v21 = [(CRLLogContext *)self->_logContext privateString];
          BOOL v22 = +[NSNumber numberWithUnsignedInteger:v9];
          v23 = [v8 metadataDescriptionWithIndex:v22];
          *(_DWORD *)buf = v49;
          v63 = v20;
          __int16 v64 = 2112;
          v65 = v21;
          __int16 v66 = 2114;
          id v67 = v53;
          __int16 v68 = 2048;
          unint64_t v69 = add;
          __int16 v70 = 2048;
          v71 = (NSString *)v8;
          __int16 v72 = 2114;
          id v73 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@ %@ %{public}@  %llx %p %{public}@", buf, 0x3Eu);

          id v4 = v50;
          uint64_t v6 = v54;
        }
        if (qword_101719A68 != -1) {
          dispatch_once(&qword_101719A68, &stru_1014F87E0);
        }
        id v11 = off_10166B498;
        if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR))
        {
          CKRecordID v24 = self->_logContext;
          uint64_t v25 = v11;
          v26 = [(CRLLogContext *)v24 publicString];
          uint64_t v27 = [(CRLLogContext *)self->_logContext privateString];
          uint64_t v28 = +[NSNumber numberWithUnsignedInteger:v9];
          uint64_t v29 = [v8 acquireCallStackDescriptionWithIndex:v28];
          *(_DWORD *)buf = v49;
          v63 = v26;
          __int16 v64 = 2112;
          v65 = v27;
          __int16 v66 = 2114;
          id v67 = v53;
          __int16 v68 = 2048;
          unint64_t v69 = add;
          __int16 v70 = 2048;
          v71 = (NSString *)v8;
          __int16 v72 = 2114;
          id v73 = v29;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}@ %@ %{public}@  %llx %p %{public}@", buf, 0x3Eu);

          id v4 = v50;
          uint64_t v6 = v54;
        }
        id v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9, v49);
        id v13 = [v8 breadcrumbsDescriptionWithIndex:v12];

        if ([v13 length])
        {
          if (qword_101719A68 != -1) {
            dispatch_once(&qword_101719A68, &stru_1014F8800);
          }
          dispatch_time_t v14 = off_10166B498;
          if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR))
          {
            uint64_t v30 = self->_logContext;
            uint64_t v31 = v14;
            uint64_t v32 = [(CRLLogContext *)v30 publicString];
            uint64_t v33 = [(CRLLogContext *)self->_logContext privateString];
            *(_DWORD *)buf = v49;
            v63 = v32;
            __int16 v64 = 2112;
            v65 = v33;
            __int16 v66 = 2114;
            id v67 = v53;
            __int16 v68 = 2048;
            unint64_t v69 = add;
            __int16 v70 = 2048;
            v71 = (NSString *)v8;
            __int16 v72 = 2114;
            id v73 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}@ %@ %{public}@  %llx %p %{public}@", buf, 0x3Eu);

            uint64_t v6 = v54;
            id v4 = v50;
          }
        }
        uint64_t v15 = +[NSNumber numberWithUnsignedInteger:v9];
        uint64_t v16 = [v8 parentDescriptionWithIndex:v15];

        if ([v16 length])
        {
          if (qword_101719A68 != -1) {
            dispatch_once(&qword_101719A68, &stru_1014F8820);
          }
          uint64_t v17 = off_10166B498;
          if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR))
          {
            uint64_t v34 = self->_logContext;
            v35 = v17;
            v36 = [(CRLLogContext *)v34 publicString];
            v37 = [(CRLLogContext *)self->_logContext privateString];
            *(_DWORD *)buf = v49;
            v63 = v36;
            __int16 v64 = 2112;
            v65 = v37;
            __int16 v66 = 2114;
            id v67 = v53;
            __int16 v68 = 2048;
            unint64_t v69 = add;
            __int16 v70 = 2048;
            v71 = (NSString *)v8;
            __int16 v72 = 2114;
            id v73 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}@ %@ %{public}@  %llx %p %{public}@", buf, 0x3Eu);

            uint64_t v6 = v54;
            id v4 = v50;
          }
        }

        id v7 = (char *)v7 + 1;
      }
      while (v56 != v7);
      v6 += (uint64_t)v7;
      id v56 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v56);
  }

  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014F8840);
  }
  id v38 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR))
  {
    v45 = self->_logContext;
    v46 = v38;
    v47 = [(CRLLogContext *)v45 publicString];
    v48 = [(CRLLogContext *)self->_logContext privateString];
    *(_DWORD *)buf = 138544130;
    v63 = v47;
    __int16 v64 = 2112;
    v65 = v48;
    __int16 v66 = 2114;
    id v67 = v53;
    __int16 v68 = 2048;
    unint64_t v69 = add;
    _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%{public}@ %@ %{public}@┗ %llx", buf, 0x2Au);
  }
}

- (void)p_logDebugTokenSerializationDescriptionFromQueue
{
  uint64_t add = atomic_fetch_add(&qword_1016A9A98, 1uLL);
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014F8860);
  }
  unsigned int v2 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_DEBUG)) {
    sub_1010B0FEC((uint64_t)self, v2, add);
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v3 = self->_tokens;
  id v44 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v45 objects:v59 count:16];
  if (v44)
  {
    uint64_t v5 = 0;
    uint64_t v43 = *(void *)v46;
    *(void *)&long long v4 = 138544386;
    long long v38 = v4;
    v39 = v3;
    do
    {
      uint64_t v6 = 0;
      uint64_t v42 = v5;
      do
      {
        if (*(void *)v46 != v43) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(id *)(*((void *)&v45 + 1) + 8 * (void)v6);
        if (qword_101719A68 != -1) {
          dispatch_once(&qword_101719A68, &stru_1014F8880);
        }
        id v8 = (char *)v6 + v5;
        id v9 = off_10166B498;
        if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_DEBUG))
        {
          logContext = self->_logContext;
          uint64_t v18 = v9;
          uint64_t v19 = [(CRLLogContext *)logContext publicString];
          id v20 = [(CRLLogContext *)self->_logContext privateString];
          unint64_t v21 = +[NSNumber numberWithUnsignedInteger:v8];
          BOOL v22 = [v7 metadataDescriptionWithIndex:v21];
          *(_DWORD *)buf = v38;
          v50 = v19;
          __int16 v51 = 2112;
          v52 = v20;
          __int16 v53 = 2048;
          uint64_t v54 = add;
          __int16 v55 = 2048;
          id v56 = v7;
          __int16 v57 = 2114;
          long long v58 = v22;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%{public}@ %@   %llx %p %{public}@", buf, 0x34u);

          id v3 = v39;
          uint64_t v5 = v42;
        }
        if (qword_101719A68 != -1) {
          dispatch_once(&qword_101719A68, &stru_1014F88A0);
        }
        id v10 = off_10166B498;
        if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_DEBUG))
        {
          v23 = self->_logContext;
          CKRecordID v24 = v10;
          uint64_t v25 = [(CRLLogContext *)v23 publicString];
          v26 = [(CRLLogContext *)self->_logContext privateString];
          uint64_t v27 = +[NSNumber numberWithUnsignedInteger:v8];
          uint64_t v28 = [v7 acquireCallStackDescriptionWithIndex:v27];
          *(_DWORD *)buf = v38;
          v50 = v25;
          __int16 v51 = 2112;
          v52 = v26;
          __int16 v53 = 2048;
          uint64_t v54 = add;
          __int16 v55 = 2048;
          id v56 = v7;
          __int16 v57 = 2114;
          long long v58 = v28;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}@ %@   %llx %p %{public}@", buf, 0x34u);

          id v3 = v39;
          uint64_t v5 = v42;
        }
        id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8, v38);
        id v12 = [v7 breadcrumbsDescriptionWithIndex:v11];

        if ([v12 length])
        {
          if (qword_101719A68 != -1) {
            dispatch_once(&qword_101719A68, &stru_1014F88C0);
          }
          id v13 = off_10166B498;
          if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v29 = self->_logContext;
            uint64_t v30 = v13;
            uint64_t v31 = [(CRLLogContext *)v29 publicString];
            uint64_t v32 = [(CRLLogContext *)self->_logContext privateString];
            *(_DWORD *)buf = v38;
            v50 = v31;
            __int16 v51 = 2112;
            v52 = v32;
            __int16 v53 = 2048;
            uint64_t v54 = add;
            __int16 v55 = 2048;
            id v56 = v7;
            __int16 v57 = 2114;
            long long v58 = v12;
            _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%{public}@ %@   %llx %p %{public}@", buf, 0x34u);

            uint64_t v5 = v42;
            id v3 = v39;
          }
        }
        dispatch_time_t v14 = +[NSNumber numberWithUnsignedInteger:v8];
        uint64_t v15 = [v7 parentDescriptionWithIndex:v14];

        if ([v15 length])
        {
          if (qword_101719A68 != -1) {
            dispatch_once(&qword_101719A68, &stru_1014F88E0);
          }
          uint64_t v16 = off_10166B498;
          if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v33 = self->_logContext;
            uint64_t v34 = v16;
            v35 = [(CRLLogContext *)v33 publicString];
            v36 = [(CRLLogContext *)self->_logContext privateString];
            *(_DWORD *)buf = v38;
            v50 = v35;
            __int16 v51 = 2112;
            v52 = v36;
            __int16 v53 = 2048;
            uint64_t v54 = add;
            __int16 v55 = 2048;
            id v56 = v7;
            __int16 v57 = 2114;
            long long v58 = v15;
            _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%{public}@ %@   %llx %p %{public}@", buf, 0x34u);

            uint64_t v5 = v42;
            id v3 = v39;
          }
        }

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v44 != v6);
      v5 += (uint64_t)v6;
      id v44 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v45 objects:v59 count:16];
    }
    while (v44);
  }

  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014F8900);
  }
  v37 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_DEBUG)) {
    sub_1010B0F08((uint64_t)self, v37, add);
  }
}

- (id)p_tokenSerializationDescriptionFromQueue
{
  id v3 = objc_opt_new();
  [v3 appendFormat:@"'%@' pending resource requests (%tu total)", self->_name, -[NSMutableArray count](self->_tokens, "count")];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = self->_tokens;
  id v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v20 = *(void *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v20) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v3 appendString:@"\n"];
        id v9 = v8;
        id v10 = +[NSNumber numberWithUnsignedInteger:(char *)i + v6];
        id v11 = [v9 metadataDescriptionWithIndex:v10];
        [v3 appendString:v11];

        [v3 appendString:@"\n"];
        id v12 = +[NSNumber numberWithUnsignedInteger:(char *)i + v6];
        id v13 = [v9 acquireCallStackDescriptionWithIndex:v12];
        [v3 appendString:v13];

        dispatch_time_t v14 = +[NSNumber numberWithUnsignedInteger:(char *)i + v6];
        uint64_t v15 = [v9 breadcrumbsDescriptionWithIndex:v14];

        if ([v15 length])
        {
          [v3 appendString:@"\n"];
          [v3 appendString:v15];
        }
        uint64_t v16 = +[NSNumber numberWithUnsignedInteger:(char *)i + v6];
        uint64_t v17 = [v9 parentDescriptionWithIndex:v16];

        if ([v17 length])
        {
          [v3 appendString:@"\n"];
          [v3 appendString:v17];
        }
      }
      id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      v6 += (uint64_t)i;
    }
    while (v5);
  }

  return v3;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(CRLTraceableResource *)self name];
  uint64_t v6 = [(CRLTraceableResource *)self tokenSerializationDescription];
  id v7 = +[NSString stringWithFormat:@"<%@: %p name='%@'>\n%@", v4, self, v5, v6];

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (CRLLogContext)logContext
{
  return self->_logContext;
}

- (void)setLogContext:(id)a3
{
}

- (BOOL)printTimeoutAsError
{
  return self->_printTimeoutAsError;
}

- (void)setPrintTimeoutAsError:(BOOL)a3
{
  self->_printTimeoutAsError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logContext, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timeoutBlocksMap, 0);

  objc_storeStrong((id *)&self->_tokens, 0);
}

@end