@interface SFUBufferedInputStream
- (BOOL)canSeek;
- (BOOL)seekWithinBufferToOffset:(int64_t)a3;
- (SFUBufferedInputStream)initWithStream:(id)a3;
- (SFUBufferedInputStream)initWithStream:(id)a3 bufferSize:(unint64_t)a4;
- (SFUBufferedInputStream)initWithStream:(id)a3 dataLength:(int64_t)a4;
- (id)closeLocalStream;
- (int64_t)offset;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (unint64_t)readToOwnBuffer:(const char *)a3 size:(unint64_t)a4;
- (void)close;
- (void)dealloc;
- (void)disableSystemCaching;
- (void)enableSystemCaching;
- (void)seekToOffset:(int64_t)a3;
@end

@implementation SFUBufferedInputStream

- (SFUBufferedInputStream)initWithStream:(id)a3
{
  return [(SFUBufferedInputStream *)self initWithStream:a3 bufferSize:0x40000];
}

- (SFUBufferedInputStream)initWithStream:(id)a3 bufferSize:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SFUBufferedInputStream;
  v6 = [(SFUBufferedInputStream *)&v11 init];
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      v6->mStream = (SFUInputStream *)a3;
      v7->mBufferSize = a4;
      v8 = (char *)malloc_type_malloc(a4, 0x22AE73CEuLL);
      v7->mBuffer = v8;
      if (!v8)
      {

        +[NSException raise:@"SFUBufferedInputStreamError" format:@"Could not create read buffer"];
      }
      id v9 = [(SFUInputStream *)v7->mStream offset];
      v7->mBufferStart = (int64_t)v9;
      v7->mBufferEnd = (int64_t)v9;
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (SFUBufferedInputStream)initWithStream:(id)a3 dataLength:(int64_t)a4
{
  if ((unint64_t)a4 >= 0x40000) {
    a4 = 0x40000;
  }
  return [(SFUBufferedInputStream *)self initWithStream:a3 bufferSize:a4];
}

- (void)dealloc
{
  free(self->mBuffer);

  v3.receiver = self;
  v3.super_class = (Class)SFUBufferedInputStream;
  [(SFUBufferedInputStream *)&v3 dealloc];
}

- (int64_t)offset
{
  return self->mBufferOffset + self->mBufferStart;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  __src = 0;
  size_t v5 = [(SFUBufferedInputStream *)self readToOwnBuffer:&__src size:a4];
  memcpy(a3, __src, v5);
  return v5;
}

- (unint64_t)readToOwnBuffer:(const char *)a3 size:(unint64_t)a4
{
  if (!a3)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CCEF0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166388();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUBufferedInputStream readToOwnBuffer:size:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUBufferedInputStream.m"), 81, 0, "No buffer parameter");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  int64_t mBufferStart = self->mBufferStart;
  int64_t mBufferEnd = self->mBufferEnd;
  if (self->mBufferOffset + mBufferStart > mBufferEnd)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CCF10);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166300();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUBufferedInputStream readToOwnBuffer:size:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUBufferedInputStream.m"), 82, 0, "Bad invariant");
    +[TSUAssertionHandler logBacktraceThrottled];
    int64_t mBufferStart = self->mBufferStart;
    int64_t mBufferEnd = self->mBufferEnd;
  }
  unint64_t mBufferSize = self->mBufferSize;
  if (mBufferEnd - mBufferStart > (uint64_t)mBufferSize)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CCF30);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166278();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUBufferedInputStream readToOwnBuffer:size:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUBufferedInputStream.m"), 83, 0, "Bad invariant");
    +[TSUAssertionHandler logBacktraceThrottled];
    unint64_t mBufferSize = self->mBufferSize;
    int64_t mBufferStart = self->mBufferStart;
    int64_t mBufferEnd = self->mBufferEnd;
  }
  if (mBufferSize >= a4) {
    unint64_t v10 = a4;
  }
  else {
    unint64_t v10 = mBufferSize;
  }
  int64_t mBufferOffset = self->mBufferOffset;
  int64_t v12 = mBufferEnd - mBufferStart;
  unint64_t v13 = v12 - mBufferOffset;
  if (v10 > v12 - mBufferOffset)
  {
    memmove(self->mBuffer, &self->mBuffer[mBufferOffset], v12 - mBufferOffset);
    int64_t v14 = self->mBufferStart + self->mBufferOffset;
    self->int64_t mBufferOffset = 0;
    self->int64_t mBufferStart = v14;
    if ([(SFUInputStream *)self->mStream offset] != self->mBufferEnd)
    {
      if ([(SFUInputStream *)self->mStream canSeek])
      {
        [(SFUInputStream *)self->mStream seekToOffset:self->mBufferEnd];
      }
      else
      {
        +[TSUAssertionHandler _atomicIncrementAssertCount];
        if (TSUAssertCat_init_token != -1) {
          dispatch_once(&TSUAssertCat_init_token, &stru_1001CCF50);
        }
        if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
          sub_1001661F0();
        }
        +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUBufferedInputStream readToOwnBuffer:size:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUBufferedInputStream.m"), 104, 0, "Detected a read from the stream beneath a buffered stream.");
        +[TSUAssertionHandler logBacktraceThrottled];
      }
    }
    id v15 = [(SFUInputStream *)self->mStream readToBuffer:&self->mBuffer[v13] size:self->mBufferSize - v13];
    int64_t v16 = self->mBufferStart;
    int64_t v17 = (int64_t)v15 + self->mBufferEnd;
    self->int64_t mBufferEnd = v17;
    int64_t mBufferOffset = self->mBufferOffset;
    unint64_t v13 = v17 - (v16 + mBufferOffset);
  }
  if (v10 >= v13) {
    unint64_t result = v13;
  }
  else {
    unint64_t result = v10;
  }
  *a3 = &self->mBuffer[mBufferOffset];
  self->int64_t mBufferOffset = result + mBufferOffset;
  return result;
}

- (BOOL)seekWithinBufferToOffset:(int64_t)a3
{
  int64_t mBufferStart = self->mBufferStart;
  BOOL v4 = __OFSUB__(a3, mBufferStart);
  int64_t v5 = a3 - mBufferStart;
  if (v5 < 0 != v4 || self->mBufferEnd < a3) {
    return 0;
  }
  self->int64_t mBufferOffset = v5;
  return 1;
}

- (BOOL)canSeek
{
  return [(SFUInputStream *)self->mStream canSeek];
}

- (void)seekToOffset:(int64_t)a3
{
  if (![(SFUBufferedInputStream *)self canSeek]) {
    +[NSException raise:@"SFUBufferedInputStreamError" format:@"Can't seek"];
  }
  int64_t mBufferStart = self->mBufferStart;
  BOOL v6 = __OFSUB__(a3, mBufferStart);
  int64_t v7 = a3 - mBufferStart;
  if (v7 < 0 != v6 || self->mBufferEnd < a3)
  {
    self->int64_t mBufferOffset = 0;
    self->int64_t mBufferStart = a3;
    uint64_t v8 = 48;
  }
  else
  {
    uint64_t v8 = 32;
    a3 = v7;
  }
  *(Class *)((char *)&self->super.isa + v8) = (Class)a3;
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
  return self->mStream;
}

@end