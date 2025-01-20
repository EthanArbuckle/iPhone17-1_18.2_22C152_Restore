@interface TSPDataStorageWriteResult
- (BOOL)isMissingData;
- (NSString)filename;
- (TSPCryptoInfo)encryptionInfo;
- (TSPDataStorageWriteResult)init;
- (TSPDataStorageWriteResult)initWithFilename:(id)a3 encryptionInfo:(id)a4 packageStorageType:(int64_t)a5 encodedLength:(unint64_t)a6 isMissingData:(BOOL)a7 changeCount:(unint64_t)a8;
- (int64_t)packageStorageType;
- (unint64_t)changeCount;
- (unint64_t)encodedLength;
@end

@implementation TSPDataStorageWriteResult

- (TSPDataStorageWriteResult)initWithFilename:(id)a3 encryptionInfo:(id)a4 packageStorageType:(int64_t)a5 encodedLength:(unint64_t)a6 isMissingData:(BOOL)a7 changeCount:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TSPDataStorageWriteResult;
  v17 = [(TSPDataStorageWriteResult *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_filename, a3);
    objc_storeStrong((id *)&v18->_encryptionInfo, a4);
    v18->_packageStorageType = a5;
    v18->_encodedLength = a6;
    v18->_isMissingData = a7;
    v18->_changeCount = a8;
  }

  return v18;
}

- (TSPDataStorageWriteResult)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CBBE8);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSPDataStorageWriteResult init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDataStorageWriteResult.m";
    __int16 v14 = 1024;
    int v15 = 27;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDataStorageWriteResult init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDataStorageWriteResult.m"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:27 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPDataStorageWriteResult init]");
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

- (int64_t)packageStorageType
{
  return self->_packageStorageType;
}

- (unint64_t)encodedLength
{
  return self->_encodedLength;
}

- (BOOL)isMissingData
{
  return self->_isMissingData;
}

- (unint64_t)changeCount
{
  return self->_changeCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionInfo, 0);
  objc_storeStrong((id *)&self->_filename, 0);
}

@end