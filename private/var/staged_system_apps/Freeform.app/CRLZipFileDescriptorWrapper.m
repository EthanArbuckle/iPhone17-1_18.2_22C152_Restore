@interface CRLZipFileDescriptorWrapper
- (CRLReadChannel)readChannel;
- (CRLZipFileDescriptorWrapper)init;
- (CRLZipFileDescriptorWrapper)initWithFileDescriptor:(int)a3;
- (int)fileDescriptor;
- (void)beginAccess;
- (void)dealloc;
- (void)endAccess;
- (void)waitForAccessToEnd;
@end

@implementation CRLZipFileDescriptorWrapper

- (CRLZipFileDescriptorWrapper)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CB160);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLZipFileDescriptorWrapper init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileArchive.m";
    __int16 v17 = 1024;
    int v18 = 471;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CB180);
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
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipFileDescriptorWrapper init]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipFileArchive.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:471 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLZipFileDescriptorWrapper init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (CRLZipFileDescriptorWrapper)initWithFileDescriptor:(int)a3
{
  v3 = self;
  if ((a3 & 0x80000000) == 0)
  {
    uint64_t v4 = *(void *)&a3;
    v14.receiver = self;
    v14.super_class = (Class)CRLZipFileDescriptorWrapper;
    v5 = [(CRLZipFileDescriptorWrapper *)&v14 init];
    v3 = v5;
    if (!v5)
    {
      close(v4);
      goto LABEL_7;
    }
    v5->_fileDescriptor = v4;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000BC00;
    v12[3] = &unk_1014CB1A0;
    int v13 = v4;
    v6 = [[CRLFileIOChannel alloc] initForReadingDescriptor:v4 cleanupHandler:v12];
    readChannel = v3->_readChannel;
    v3->_readChannel = v6;

    if (v3->_readChannel)
    {
      dispatch_group_t v8 = dispatch_group_create();
      accessGroup = v3->_accessGroup;
      v3->_accessGroup = (OS_dispatch_group *)v8;

LABEL_7:
      v3 = v3;
      id v10 = v3;
      goto LABEL_8;
    }
  }
  id v10 = 0;
LABEL_8:

  return v10;
}

- (void)dealloc
{
  [(CRLReadChannel *)self->_readChannel close];
  v3.receiver = self;
  v3.super_class = (Class)CRLZipFileDescriptorWrapper;
  [(CRLZipFileDescriptorWrapper *)&v3 dealloc];
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

- (CRLReadChannel)readChannel
{
  return self->_readChannel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readChannel, 0);

  objc_storeStrong((id *)&self->_accessGroup, 0);
}

@end