@interface TSPMutableCryptoInfoInternal
- (TSPMutableCryptoInfoInternal)initWithCryptoKey:(id)a3 preferredBlockSize:(unint64_t)a4 blockInfos:(id)a5 decodedLength:(unint64_t)a6;
- (void)addBlockInfo:(id)a3;
- (void)incrementDecodedLengthBy:(unint64_t)a3;
- (void)reset;
@end

@implementation TSPMutableCryptoInfoInternal

- (TSPMutableCryptoInfoInternal)initWithCryptoKey:(id)a3 preferredBlockSize:(unint64_t)a4 blockInfos:(id)a5 decodedLength:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TSPMutableCryptoInfoInternal;
  v12 = [(TSPCryptoInfoInternal *)&v15 initWithCryptoKey:v10 preferredBlockSize:a4 blockInfos:0 decodedLength:a6];
  if (v12)
  {
    id v13 = [v11 mutableCopy];
    [(TSPCryptoInfoInternal *)v12 setBlockInfos:v13];
  }
  return v12;
}

- (void)reset
{
  [(TSPCryptoInfoInternal *)self setBlockInfos:0];
  [(TSPCryptoInfoInternal *)self setDecodedLength:0];
}

- (void)addBlockInfo:(id)a3
{
  id v4 = a3;
  if ([(TSPCryptoInfoInternal *)self preferredBlockSize] == -1)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C7580);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016338C();
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPMutableCryptoInfoInternal addBlockInfo:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoInfo.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:97 isFatal:0 description:"We should not be adding a block info when the preferred block size is SIZE_T_MAX."];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  else
  {
    id v5 = [(TSPCryptoInfoInternal *)self blockInfos];
    if (!v5)
    {
      id v5 = objc_alloc_init((Class)NSMutableArray);
      [(TSPCryptoInfoInternal *)self setBlockInfos:v5];
    }
    [v5 addObject:v4];
  }
}

- (void)incrementDecodedLengthBy:(unint64_t)a3
{
  id v4 = (char *)[(TSPCryptoInfoInternal *)self decodedLength] + a3;
  [(TSPCryptoInfoInternal *)self setDecodedLength:v4];
}

@end