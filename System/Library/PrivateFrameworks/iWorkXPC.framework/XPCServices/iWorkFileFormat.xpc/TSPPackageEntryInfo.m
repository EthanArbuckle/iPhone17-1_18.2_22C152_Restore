@interface TSPPackageEntryInfo
- (NSDate)lastModificationDate;
- (TSPPackageEntryInfo)init;
- (TSPPackageEntryInfo)initWithEncodedLength:(unint64_t)a3 lastModificationDate:(id)a4 CRC:(unsigned int)a5;
- (unint64_t)encodedLength;
- (unsigned)CRC;
@end

@implementation TSPPackageEntryInfo

- (TSPPackageEntryInfo)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C7308);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSPPackageEntryInfo init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm";
    __int16 v14 = 1024;
    int v15 = 756;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPPackageEntryInfo init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPPackage.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:756 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPPackageEntryInfo init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSPPackageEntryInfo)initWithEncodedLength:(unint64_t)a3 lastModificationDate:(id)a4 CRC:(unsigned int)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TSPPackageEntryInfo;
  unsigned int v9 = [(TSPPackageEntryInfo *)&v14 init];
  __int16 v10 = v9;
  if (v9)
  {
    v9->_encodedLength = a3;
    v11 = (NSDate *)[v8 copy];
    lastModificationDate = v10->_lastModificationDate;
    v10->_lastModificationDate = v11;

    v10->_CRC = a5;
  }

  return v10;
}

- (unint64_t)encodedLength
{
  return self->_encodedLength;
}

- (NSDate)lastModificationDate
{
  return self->_lastModificationDate;
}

- (unsigned)CRC
{
  return self->_CRC;
}

- (void).cxx_destruct
{
}

@end