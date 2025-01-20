@interface TSUZipFileDescriptorWrapper
- (TSUReadChannel)readChannel;
- (TSUZipFileDescriptorWrapper)init;
- (TSUZipFileDescriptorWrapper)initWithFileDescriptor:(int)a3;
- (int)fileDescriptor;
- (void)beginAccess;
- (void)dealloc;
- (void)endAccess;
- (void)waitForAccessToEnd;
@end

@implementation TSUZipFileDescriptorWrapper

- (TSUZipFileDescriptorWrapper)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CC608);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSUZipFileDescriptorWrapper init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipFileArchive.m";
    __int16 v14 = 1024;
    int v15 = 474;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipFileDescriptorWrapper init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipFileArchive.m"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:474 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSUZipFileDescriptorWrapper init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSUZipFileDescriptorWrapper)initWithFileDescriptor:(int)a3
{
  v3 = self;
  if ((a3 & 0x80000000) == 0)
  {
    uint64_t v4 = *(void *)&a3;
    v14.receiver = self;
    v14.super_class = (Class)TSUZipFileDescriptorWrapper;
    v5 = [(TSUZipFileDescriptorWrapper *)&v14 init];
    v3 = v5;
    if (!v5)
    {
      close(v4);
      goto LABEL_7;
    }
    v5->_fileDescriptor = v4;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100086F34;
    v12[3] = &unk_1001CC628;
    int v13 = v4;
    v6 = [[TSUFileIOChannel alloc] initForReadingDescriptor:v4 cleanupHandler:v12];
    readChannel = v3->_readChannel;
    v3->_readChannel = v6;

    if (v3->_readChannel)
    {
      dispatch_group_t v8 = dispatch_group_create();
      accessGroup = v3->_accessGroup;
      v3->_accessGroup = (OS_dispatch_group *)v8;

LABEL_7:
      v3 = v3;
      __int16 v10 = v3;
      goto LABEL_8;
    }
  }
  __int16 v10 = 0;
LABEL_8:

  return v10;
}

- (void)dealloc
{
  [(TSUReadChannel *)self->_readChannel close];
  v3.receiver = self;
  v3.super_class = (Class)TSUZipFileDescriptorWrapper;
  [(TSUZipFileDescriptorWrapper *)&v3 dealloc];
}

- (void)beginAccess
{
}

- (void)endAccess
{
}

- (void)waitForAccessToEnd
{
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (TSUReadChannel)readChannel
{
  return self->_readChannel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readChannel, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
}

@end