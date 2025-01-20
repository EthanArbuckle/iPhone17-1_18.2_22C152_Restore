@interface SFUZipInflateInputStream
- (BOOL)canSeek;
- (SFUZipInflateInputStream)initWithInput:(id)a3;
- (SFUZipInflateInputStream)initWithOffset:(int64_t)a3 end:(int64_t)a4 uncompressedSize:(unint64_t)a5 crc:(unint64_t)a6 dataRepresentation:(id)a7;
- (id)closeLocalStream;
- (int64_t)offset;
- (int64_t)totalCompressedBytesConsumed;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (unint64_t)readToOwnBuffer:(const char *)a3 size:(unint64_t)a4;
- (void)close;
- (void)dealloc;
- (void)disableSystemCaching;
- (void)enableSystemCaching;
- (void)seekToOffset:(int64_t)a3;
- (void)setupInflateStream;
@end

@implementation SFUZipInflateInputStream

- (SFUZipInflateInputStream)initWithOffset:(int64_t)a3 end:(int64_t)a4 uncompressedSize:(unint64_t)a5 crc:(unint64_t)a6 dataRepresentation:(id)a7
{
  v12 = [(SFUZipInflateInputStream *)self init];
  v13 = v12;
  if (v12)
  {
    *(_WORD *)&v12->mReachedEnd = 256;
    v12->mOffset = a3;
    v12->mCheckCrc = a6;
    v12->mCalculatedCrc = crc32(0, 0, 0);
    v13->mInput = (SFUBufferedInputStream *)[a7 bufferedInputStreamWithOffset:a3 length:a4 - a3];
    unint64_t v14 = 0x40000;
    if (a5 < 0x40000) {
      unint64_t v14 = a5;
    }
    v13->mOutBufferSize = v14;
    [(SFUZipInflateInputStream *)v13 setupInflateStream];
  }
  return v13;
}

- (SFUZipInflateInputStream)initWithInput:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFUZipInflateInputStream;
  v4 = [(SFUZipInflateInputStream *)&v7 init];
  v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->mReachedEnd = 0;
    v4->mOffset = 0;
    v4->mInput = [[SFUBufferedInputStream alloc] initWithStream:a3];
    v5->mOutBufferSize = 0x40000;
    [(SFUZipInflateInputStream *)v5 setupInflateStream];
  }
  return v5;
}

- (void)dealloc
{
  inflateEnd(&self->mStream);

  free(self->mOutBuffer);
  v3.receiver = self;
  v3.super_class = (Class)SFUZipInflateInputStream;
  [(SFUZipInflateInputStream *)&v3 dealloc];
}

- (unint64_t)readToOwnBuffer:(const char *)a3 size:(unint64_t)a4
{
  mOutBuffer = self->mOutBuffer;
  if (!mOutBuffer)
  {
    mOutBuffer = (char *)malloc_type_malloc(self->mOutBufferSize, 0x8B2E508uLL);
    self->mOutBuffer = mOutBuffer;
    if (!mOutBuffer)
    {
      +[SFUZipException raise:@"SFUZipInflateError" format:@"Could not create inflate buffer"];
      mOutBuffer = self->mOutBuffer;
    }
  }
  *a3 = mOutBuffer;
  v8 = self->mOutBuffer;
  if (a4 - 1 >= self->mOutBufferSize) {
    unint64_t mOutBufferSize = self->mOutBufferSize;
  }
  else {
    unint64_t mOutBufferSize = a4;
  }
  return [(SFUZipInflateInputStream *)self readToBuffer:v8 size:mOutBufferSize];
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  uInt v4 = a4;
  if (a4 >= 0xFFFFFFFF)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CDDC0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100168CD8();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUZipInflateInputStream readToBuffer:size:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUZipInflateInputStream.m"), 117, 0, "overflow in readToBuffer:");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  self->mStream.avail_out = v4;
  self->mStream.next_out = (Bytef *)a3;
  next_out = a3;
  if (v4)
  {
    LODWORD(v8) = 0;
    do
    {
      if (self->mStream.avail_in)
      {
        if (v8) {
          break;
        }
      }
      else
      {
        if (v8 || self->mReachedEnd) {
          break;
        }
        unint64_t v9 = [(SFUBufferedInputStream *)self->mInput readToOwnBuffer:&self->mStream size:0xFFFFFFFFLL];
        uInt v10 = v9;
        if (v9 >= 0xFFFFFFFF)
        {
          unsigned int v11 = +[TSUAssertionHandler _atomicIncrementAssertCount];
          if (TSUAssertCat_init_token != -1) {
            dispatch_once(&TSUAssertCat_init_token, &stru_1001CDDE0);
          }
          v12 = TSUAssertCat_log_t;
          if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v15 = v11;
            __int16 v16 = 2082;
            v17 = "-[SFUZipInflateInputStream readToBuffer:size:]";
            __int16 v18 = 2082;
            v19 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUZipInflateInputStream.m";
            __int16 v20 = 1024;
            int v21 = 129;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d overflow in readToBuffer:size:", buf, 0x22u);
          }
          +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUZipInflateInputStream readToBuffer:size:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUZipInflateInputStream.m"), 129, 0, "overflow in readToBuffer:size:");
          +[TSUAssertionHandler logBacktraceThrottled];
        }
        self->mStream.avail_in = v10;
        self->mOffset += v10;
      }
      uint64_t v8 = inflate(&self->mStream, 0);
      if ((v8 + 5) > 6 || ((1 << (v8 + 5)) & 0x61) == 0) {
        +[SFUZipException raise:@"SFUZipInflateError", @"inflate() failed: %d", v8 format];
      }
    }
    while (self->mStream.avail_out);
    next_out = (char *)self->mStream.next_out;
  }
  if ((unint64_t)(next_out - a3) >= 0xFFFFFFFF)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CDE00);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100168C50();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUZipInflateInputStream readToBuffer:size:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUZipInflateInputStream.m"), 141, 0, "overflow in readToBuffer:");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  if (next_out == a3) {
    self->mReachedEnd = 1;
  }
  return next_out - a3;
}

- (void)seekToOffset:(int64_t)a3
{
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CDE20);
  }
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_100168D60();
  }
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUZipInflateInputStream *)NSString seekToOffset:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUZipInflateInputStream.m"], 150, 0, "Not implemented."");
  +[TSUAssertionHandler logBacktraceThrottled];
}

- (BOOL)canSeek
{
  return 0;
}

- (int64_t)offset
{
  return self->mStream.total_out;
}

- (void)disableSystemCaching
{
}

- (void)enableSystemCaching
{
}

- (void)close
{
  [(SFUZipInflateInputStream *)self closeLocalStream];
  mInput = self->mInput;
  [(SFUBufferedInputStream *)mInput close];
}

- (id)closeLocalStream
{
  return self->mInput;
}

- (int64_t)totalCompressedBytesConsumed
{
  return self->mStream.total_in;
}

- (void)setupInflateStream
{
  self->mStream.next_in = 0;
  p_mStream = &self->mStream;
  p_mStream->avail_in = 0;
  p_mStream->zfree = 0;
  p_mStream->opaque = 0;
  p_mStream->zalloc = 0;
  uint64_t v3 = inflateInit2_(p_mStream, -15, "1.2.12", 112);
  if (v3) {
    +[SFUZipException raise:@"SFUZipInflateError", @"inflateInit2() failed: %d", v3 format];
  }
}

@end