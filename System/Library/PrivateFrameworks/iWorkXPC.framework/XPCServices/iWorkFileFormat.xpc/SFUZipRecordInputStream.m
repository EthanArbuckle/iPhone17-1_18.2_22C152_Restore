@interface SFUZipRecordInputStream
- (SFUZipRecordInputStream)initWithDataRepresentation:(id)a3;
- (const)dataAtOffset:(int64_t)a3 size:(unint64_t)a4 end:(int64_t)a5;
- (void)dealloc;
@end

@implementation SFUZipRecordInputStream

- (SFUZipRecordInputStream)initWithDataRepresentation:(id)a3
{
  self->mInput = (SFUBufferedInputStream *)[a3 bufferedInputStream];
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SFUZipRecordInputStream;
  [(SFUZipRecordInputStream *)&v3 dealloc];
}

- (const)dataAtOffset:(int64_t)a3 size:(unint64_t)a4 end:(int64_t)a5
{
  if (a3 < 0 || (a4 ^ 0x7FFFFFFFFFFFFFFFLL) < a3) {
    +[NSException raise:@"SFUZipArchiveError" format:@"Size overflow."];
  }
  int64_t v9 = a4 + a3;
  if (a5)
  {
    if (v9 > a5)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001CDF20);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_10016911C();
      }
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUZipRecordInputStream dataAtOffset:size:end:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUZipArchive.m"), 692, 0, "End offset is too small.");
      +[TSUAssertionHandler logBacktraceThrottled];
    }
  }
  else
  {
    a5 = a4 + a3;
  }
  int64_t mBufferStart = self->mBufferStart;
  if (mBufferStart > a3 || v9 > self->mBufferEnd)
  {
    [(SFUBufferedInputStream *)self->mInput seekToOffset:a3];
    unint64_t v11 = [(SFUBufferedInputStream *)self->mInput readToOwnBuffer:&self->mBuffer size:a5 - a3];
    if (v11 < a4) {
      +[NSException raise:@"SFUZipArchiveError" format:@"Could not read Zip record."];
    }
    self->int64_t mBufferStart = a3;
    self->mBufferEnd = v11 + a3;
    int64_t mBufferStart = a3;
  }
  return &self->mBuffer[a3 - mBufferStart];
}

@end