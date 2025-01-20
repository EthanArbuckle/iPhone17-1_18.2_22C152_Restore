@interface SFUCryptoInputStream
- (BOOL)canSeek;
- (id)closeLocalStream;
- (id)initForDecryptionWithInputStream:(id)a3 key:(id)a4;
- (int64_t)offset;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (void)close;
- (void)dealloc;
- (void)disableSystemCaching;
- (void)enableSystemCaching;
- (void)seekToOffset:(int64_t)a3;
@end

@implementation SFUCryptoInputStream

- (id)initForDecryptionWithInputStream:(id)a3 key:(id)a4
{
  v6 = [(SFUCryptoInputStream *)self init];
  if (v6)
  {
    v6->mBaseStream = (SFUInputStream *)a3;
    unsigned int v7 = +[SFUCryptoUtils ivLengthForKey:a4];
    v8 = (char *)&v11 - ((v7 + 15) & 0x1FFFFFFF0);
    if ([(SFUInputStream *)v6->mBaseStream readToBuffer:v8 size:v7] != (id)v7) {
      +[NSException raise:NSGenericException format:@"Failed to read IV"];
    }
    v9 = [[SFUCryptor alloc] initWithKey:a4 operation:1 iv:v8 ivLength:v7];
    v6->mCryptor = v9;
    if (!v9) {
      +[NSException raise:NSGenericException format:@"Failed to create SFUCryptor"];
    }
    if (v7)
    {
      if ((id)[(SFUCryptoInputStream *)v6 readToBuffer:v8 size:v7] != (id)v7) {
        +[NSException raise:NSGenericException format:@"Failed to read initial ciphertext"];
      }
      v6->mOffset = 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SFUCryptoInputStream;
  [(SFUCryptoInputStream *)&v3 dealloc];
}

- (int64_t)offset
{
  return self->mOffset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  unint64_t v7 = 0;
  id v8 = 0;
  if (![(SFUCryptor *)self->mCryptor cryptDataFromStream:self->mBaseStream toBuffer:a3 length:a4 bytesRead:&v7 error:&v8])
  {
    id v5 = [v8 localizedDescription];
    +[NSException raise:format:](NSException, "raise:format:", NSGenericException, @"SFUCryptor failed. %@: %@", v5, [v8 localizedFailureReason]);
  }
  unint64_t result = v7;
  self->mOffset += v7;
  return result;
}

- (BOOL)canSeek
{
  return 0;
}

- (void)seekToOffset:(int64_t)a3
{
  int v3 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CEB28);
  }
  v4 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_10016A7E4(v3, v4);
  }
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUCryptoInputStream *)NSString seekToOffset:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptoInputStream.m"], 85, 0, "SFUCryptoInputStream cannot seek."");
  +[TSUAssertionHandler logBacktraceThrottled];
}

- (void)disableSystemCaching
{
}

- (void)enableSystemCaching
{
}

- (void)close
{
}

- (id)closeLocalStream
{
  return self->mBaseStream;
}

@end