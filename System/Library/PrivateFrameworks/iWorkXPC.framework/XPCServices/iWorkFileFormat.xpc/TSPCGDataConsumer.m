@interface TSPCGDataConsumer
+ (CGDataConsumer)newCGDataConsumerForWriteChannel:(id)a3;
- (TSPCGDataConsumer)init;
- (TSPCGDataConsumer)initWithWriteChannel:(id)a3;
- (unint64_t)putBytes:(const void *)a3 count:(unint64_t)a4;
- (void)_close;
- (void)close;
@end

@implementation TSPCGDataConsumer

+ (CGDataConsumer)newCGDataConsumerForWriteChannel:(id)a3
{
  id v3 = a3;
  v4 = [[TSPCGDataConsumer alloc] initWithWriteChannel:v3];
  v5 = v4;
  if (v4) {
    v6 = CGDataConsumerCreate(v4, (const CGDataConsumerCallbacks *)&off_1001C6D20);
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (TSPCGDataConsumer)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C6D30);
  }
  id v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSPCGDataConsumer init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCGDataConsumer.mm";
    __int16 v14 = 1024;
    int v15 = 39;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCGDataConsumer init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCGDataConsumer.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:39 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPCGDataConsumer init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSPCGDataConsumer)initWithWriteChannel:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TSPCGDataConsumer;
  id v6 = [(TSPCGDataConsumer *)&v11 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("TSPCGDataConsumer.Write", v7);
    unsigned int v9 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v8;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v6 + 1), off_1001E9678, off_1001E9678, 0);
    objc_storeStrong((id *)v6 + 2, a3);
  }

  return (TSPCGDataConsumer *)v6;
}

- (unint64_t)putBytes:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v8 = 0;
  unsigned int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000284CC;
  block[3] = &unk_1001C6D80;
  block[4] = self;
  block[5] = &v12;
  block[7] = a3;
  block[8] = a4;
  block[6] = &v8;
  dispatch_sync(writeQueue, block);
  if (*((unsigned char *)v13 + 24)) {
    unint64_t v5 = v9[3];
  }
  else {
    unint64_t v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (void)close
{
  id v3 = off_1001E9678;
  if (dispatch_get_specific(off_1001E9678) == v3)
  {
    [(TSPCGDataConsumer *)self _close];
  }
  else
  {
    writeQueue = self->_writeQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100028774;
    block[3] = &unk_1001C56E8;
    block[4] = self;
    dispatch_sync(writeQueue, block);
  }
}

- (void)_close
{
  [(TSUStreamWriteChannel *)self->_writeChannel close];
  if (self->_error)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001C6DA0);
    }
    id v3 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = [(NSError *)self->_error domain];
      NSInteger v7 = [(NSError *)self->_error code];
      error = self->_error;
      int v9 = 138544130;
      id v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v6;
      __int16 v13 = 2048;
      NSInteger v14 = v7;
      __int16 v15 = 2112;
      v16 = error;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_ERROR, "Failed to write bytes. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", (uint8_t *)&v9, 0x2Au);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_writeChannel, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
}

@end