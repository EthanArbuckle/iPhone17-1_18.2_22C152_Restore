@interface SFUCryptoOutputStream
+ (unint64_t)encodedLengthForDataLength:(unint64_t)a3 key:(id)a4;
- (BOOL)canCreateInputStream;
- (BOOL)canSeek;
- (id)closeLocalStream;
- (id)initForEncryptionWithOutputStream:(id)a3 key:(id)a4;
- (id)initForEncryptionWithOutputStream:(id)a3 key:(id)a4 computeCrc32:(BOOL)a5;
- (id)inputStream;
- (int64_t)offset;
- (unsigned)crc32;
- (void)close;
- (void)dealloc;
- (void)seekToOffset:(int64_t)a3 whence:(int)a4;
- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4;
@end

@implementation SFUCryptoOutputStream

+ (unint64_t)encodedLengthForDataLength:(unint64_t)a3 key:(id)a4
{
  unsigned int v6 = 2 * +[SFUCryptoUtils ivLengthForKey:a4];
  unsigned int v7 = [a4 keyType];
  LODWORD(v8) = v6 - (a3 & 0xF) + 16;
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v8;
  }
  if (__CFADD__(v8, a3)) {
    uint64_t v8 = 0;
  }
  return v8 + a3;
}

- (id)initForEncryptionWithOutputStream:(id)a3 key:(id)a4
{
  return [(SFUCryptoOutputStream *)self initForEncryptionWithOutputStream:a3 key:a4 computeCrc32:0];
}

- (id)initForEncryptionWithOutputStream:(id)a3 key:(id)a4 computeCrc32:(BOOL)a5
{
  uint64_t v8 = [(SFUCryptoOutputStream *)self init];
  if (v8)
  {
    v8->mBaseStream = (SFUOutputStream *)a3;
    v8->mComputeCrc32 = a5;
    uInt v9 = +[SFUCryptoUtils ivLengthForKey:a4];
    v10 = (char *)&v14 - ((v9 + 15) & 0x1FFFFFFF0);
    if (SecRandomCopyBytes(kSecRandomDefault, v9, v10)) {
      +[NSException raise:NSGenericException format:@"Failed to generate IV"];
    }
    v11 = [[SFUCryptor alloc] initWithKey:a4 operation:0 iv:v10 ivLength:v9];
    v8->mCryptor = v11;
    if (!v11) {
      +[NSException raise:NSGenericException format:@"Failed to create SFUCryptor"];
    }
    [(SFUOutputStream *)v8->mBaseStream writeBuffer:v10 size:v9];
    if (v8->mComputeCrc32)
    {
      unsigned int v12 = crc32(0, 0, 0);
      v8->mCrc32 = v12;
      v8->mCrc32 = crc32(v12, (const Bytef *)v10, v9);
    }
    if (v9)
    {
      if (SecRandomCopyBytes(kSecRandomDefault, v9, v10)) {
        +[NSException raise:NSGenericException format:@"Failed to generate initial plaintext"];
      }
      [(SFUCryptoOutputStream *)v8 writeBuffer:v10 size:v9];
    }
  }
  return v8;
}

- (void)dealloc
{
  if (!self->mIsClosed) {
    [(SFUCryptoOutputStream *)self closeLocalStream];
  }

  v3.receiver = self;
  v3.super_class = (Class)SFUCryptoOutputStream;
  [(SFUCryptoOutputStream *)&v3 dealloc];
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  if (self->mIsClosed) {
    +[NSException raise:NSInternalInconsistencyException format:@"Tried to write data to a closed SFUCryptoOutputStream."];
  }
  id v9 = 0;
  if (self->mComputeCrc32) {
    p_mCrc32 = &self->mCrc32;
  }
  else {
    p_mCrc32 = 0;
  }
  if (![(SFUCryptor *)self->mCryptor cryptDataFromBuffer:a3 length:a4 toStream:self->mBaseStream finished:0 crc32:p_mCrc32 error:&v9])
  {
    id v8 = [v9 localizedDescription];
    +[NSException raise:format:](NSException, "raise:format:", NSGenericException, @"SFUCryptor failed. %@: %@", v8, [v9 localizedFailureReason]);
  }
}

- (BOOL)canSeek
{
  return 0;
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CBF88);
  }
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_1001647F0();
  }
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUCryptoOutputStream seekToOffset:whence:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptoOutputStream.mm"), 121, 0, "SFUCryptoOutputStream cannot seek.");
  +[TSUAssertionHandler logBacktraceThrottled];
}

- (int64_t)offset
{
  return (int64_t)[(SFUOutputStream *)self->mBaseStream offset];
}

- (BOOL)canCreateInputStream
{
  return 0;
}

- (id)inputStream
{
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CBFA8);
  }
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_100164878();
  }
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUCryptoOutputStream *)NSString inputStream], 133, 0, "SFUCryptoOutputStream cannot create an input stream."");
  +[TSUAssertionHandler logBacktraceThrottled];
  return 0;
}

- (unsigned)crc32
{
  if (!self->mComputeCrc32 || !self->mIsClosed)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CBFC8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100164900();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUCryptoOutputStream *)NSString crc32], 138, 0, "Can't call -crc32 unless the stream is closed and was asked to compute the CRC32."");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  return self->mCrc32;
}

- (void)close
{
  [(SFUCryptoOutputStream *)self closeLocalStream];
  mBaseStream = self->mBaseStream;
  [(SFUOutputStream *)mBaseStream close];
}

- (id)closeLocalStream
{
  if (!self->mIsClosed)
  {
    self->mIsClosed = 1;
    id v8 = 0;
    mBaseStream = self->mBaseStream;
    mCryptor = self->mCryptor;
    if (self->mComputeCrc32) {
      p_mCrc32 = &self->mCrc32;
    }
    else {
      p_mCrc32 = 0;
    }
    if (![(SFUCryptor *)mCryptor cryptDataFromBuffer:0 length:0 toStream:mBaseStream finished:1 crc32:p_mCrc32 error:&v8])
    {
      id v6 = [v8 localizedDescription];
      +[NSException raise:format:](NSException, "raise:format:", NSGenericException, @"SFUCryptor failed. %@: %@", v6, [v8 localizedFailureReason]);
    }
  }
  return self->mBaseStream;
}

@end