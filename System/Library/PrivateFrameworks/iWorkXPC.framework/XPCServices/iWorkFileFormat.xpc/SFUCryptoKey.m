@interface SFUCryptoKey
- (BOOL)hasDecodedLength;
- (NSArray)blockInfos;
- (NSString)passphrase;
- (const)keyData;
- (id)initAes128Key:(const char *)a3 length:(unsigned int)a4 iterationCount:(unsigned int)a5;
- (id)initAes128KeyFromPassphrase:(const char *)a3 length:(unsigned int)a4 iterationCount:(unsigned int)a5;
- (id)initAes128KeyFromPassphrase:(const char *)a3 length:(unsigned int)a4 iterationCount:(unsigned int)a5 saltData:(id)a6;
- (id)initAes128KeyFromPassphrase:(id)a3 iterationCount:(unsigned int)a4;
- (id)initAes128KeyFromPassphrase:(id)a3 iterationCount:(unsigned int)a4 saltData:(id)a5;
- (id)initAes128KeyFromPassphrase:(id)a3 withIterationCountAndSaltDataFromCryptoKey:(id)a4;
- (id)saltData;
- (int)keyType;
- (unint64_t)decodedLength;
- (unint64_t)keyLength;
- (unint64_t)preferredBlockSize;
- (unsigned)iterationCount;
- (void)addBlockInfo:(id)a3;
- (void)dealloc;
- (void)incrementDecodedLengthBy:(unint64_t)a3;
@end

@implementation SFUCryptoKey

- (unint64_t)preferredBlockSize
{
  return -1;
}

- (NSArray)blockInfos
{
  return 0;
}

- (BOOL)hasDecodedLength
{
  return 0;
}

- (unint64_t)decodedLength
{
  return 0;
}

- (void)addBlockInfo:(id)a3
{
  if ([(SFUCryptoKey *)self preferredBlockSize] == -1)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C75A0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100163414();
    }
    v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUCryptoKey(TSPCryptoInfo) addBlockInfo:]");
    v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoInfo.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:140 isFatal:0 description:"We should not be adding a block info when the preferred block size is SIZE_T_MAX."];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
}

- (void)incrementDecodedLengthBy:(unint64_t)a3
{
  +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C75C0);
  }
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_10016349C();
  }
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUCryptoKey(TSPCryptoInfo) incrementDecodedLengthBy:]");
  v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoInfo.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:144 isFatal:0 description:"This is not a mutable crypto info."];

  +[TSUAssertionHandler logBacktraceThrottled];
}

- (id)initAes128KeyFromPassphrase:(id)a3 iterationCount:(unsigned int)a4
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = *(void *)&a4;
  v6 = (const char *)[a3 UTF8String];
  if (!v6) {
    return 0;
  }
  v7 = v6;
  size_t v8 = strlen(v6);
  id v9 = +[SFUCryptoUtils generateRandomSaltWithLength:16];
  return [(SFUCryptoKey *)self initAes128KeyFromPassphrase:v7 length:v8 iterationCount:v4 saltData:v9];
}

- (id)initAes128KeyFromPassphrase:(id)a3 withIterationCountAndSaltDataFromCryptoKey:(id)a4
{
  if (!a3) {
    return 0;
  }
  v6 = (const char *)[a3 UTF8String];
  size_t v7 = strlen(v6);
  id v8 = [a4 iterationCount];
  id v9 = [a4 saltData];
  return [(SFUCryptoKey *)self initAes128KeyFromPassphrase:v6 length:v7 iterationCount:v8 saltData:v9];
}

- (id)initAes128KeyFromPassphrase:(const char *)a3 length:(unsigned int)a4 iterationCount:(unsigned int)a5
{
  return [(SFUCryptoKey *)self initAes128KeyFromPassphrase:a3 length:*(void *)&a4 iterationCount:*(void *)&a5 saltData:0];
}

- (id)initAes128KeyFromPassphrase:(id)a3 iterationCount:(unsigned int)a4 saltData:(id)a5
{
  if (!a3) {
    return 0;
  }
  uint64_t v6 = *(void *)&a4;
  id v9 = [a3 UTF8String];
  size_t v10 = strlen((const char *)[a3 UTF8String]);
  return [(SFUCryptoKey *)self initAes128KeyFromPassphrase:v9 length:v10 iterationCount:v6 saltData:a5];
}

- (id)initAes128KeyFromPassphrase:(const char *)a3 length:(unsigned int)a4 iterationCount:(unsigned int)a5 saltData:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)SFUCryptoKey;
  size_t v10 = [(SFUCryptoKey *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->mIterationCount = a5;
    v10->mKeyLength = 16;
    v10->mKey = (char *)malloc_type_calloc(1uLL, 0x10uLL, 0xC59CDD89uLL);
    v11->_passphrase = (NSString *)[objc_alloc((Class)NSString) initWithBytes:a3 length:a4 encoding:4];
    v12 = (NSData *)[a6 copy];
    v11->mSaltData = v12;
    if ((SFUDeriveAes128Key((uint64_t)a3, a4, v11->mIterationCount, v11->mKey, v11->mKeyLength, (void *)[(NSData *)v12 bytes], [(NSData *)v11->mSaltData length]) & 1) == 0)
    {

      return 0;
    }
  }
  return v11;
}

- (id)initAes128Key:(const char *)a3 length:(unsigned int)a4 iterationCount:(unsigned int)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SFUCryptoKey;
  size_t v7 = [(SFUCryptoKey *)&v10 init];
  id v8 = v7;
  if (v7)
  {
    v7->mIterationCount = a5;
    v7->mKeyLength = 16;
    if (a4 == 16)
    {
      v7->mKey = (char *)malloc_type_calloc(1uLL, 0x10uLL, 0x769E0DEBuLL);
      __memcpy_chk();
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  mKey = self->mKey;
  if (mKey)
  {
    free(mKey);
    self->mKey = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)SFUCryptoKey;
  [(SFUCryptoKey *)&v4 dealloc];
}

- (int)keyType
{
  return 0;
}

- (unsigned)iterationCount
{
  return self->mIterationCount;
}

- (const)keyData
{
  return self->mKey;
}

- (unint64_t)keyLength
{
  return self->mKeyLength;
}

- (id)saltData
{
  return self->mSaltData;
}

- (NSString)passphrase
{
  return self->_passphrase;
}

@end