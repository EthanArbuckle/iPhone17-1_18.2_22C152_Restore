@interface TSPPackageWriterCopyDataResult
- (NSString)filename;
- (TSPCryptoInfo)encryptionInfo;
- (TSPPackageWriterCopyDataResult)init;
- (TSPPackageWriterCopyDataResult)initWithFilename:(id)a3 encryptionInfo:(id)a4 encodedLength:(unint64_t)a5;
- (unint64_t)encodedLength;
@end

@implementation TSPPackageWriterCopyDataResult

- (TSPPackageWriterCopyDataResult)initWithFilename:(id)a3 encryptionInfo:(id)a4 encodedLength:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TSPPackageWriterCopyDataResult;
  v11 = [(TSPPackageWriterCopyDataResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_filename, a3);
    objc_storeStrong((id *)&v12->_encryptionInfo, a4);
    v12->_encodedLength = a5;
  }

  return v12;
}

- (TSPPackageWriterCopyDataResult)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C54D8);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSPPackageWriterCopyDataResult init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriter.mm";
    __int16 v14 = 1024;
    int v15 = 857;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackageWriterCopyDataResult init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackageWriter.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:857 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPPackageWriterCopyDataResult init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (NSString)filename
{
  return self->_filename;
}

- (TSPCryptoInfo)encryptionInfo
{
  return self->_encryptionInfo;
}

- (unint64_t)encodedLength
{
  return self->_encodedLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionInfo, 0);
  objc_storeStrong((id *)&self->_filename, 0);
}

@end