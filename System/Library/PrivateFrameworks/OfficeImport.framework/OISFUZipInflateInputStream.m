@interface OISFUZipInflateInputStream
- (BOOL)canSeek;
- (OISFUZipInflateInputStream)initWithInput:(id)a3;
- (OISFUZipInflateInputStream)initWithOffset:(int64_t)a3 end:(int64_t)a4 uncompressedSize:(unint64_t)a5 crc:(unint64_t)a6 dataRepresentation:(id)a7;
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

@implementation OISFUZipInflateInputStream

- (OISFUZipInflateInputStream)initWithOffset:(int64_t)a3 end:(int64_t)a4 uncompressedSize:(unint64_t)a5 crc:(unint64_t)a6 dataRepresentation:(id)a7
{
  v12 = [(OISFUZipInflateInputStream *)self init];
  v13 = v12;
  if (v12)
  {
    *(_WORD *)&v12->mReachedEnd = 256;
    v12->mOffset = a3;
    v12->mCheckCrc = a6;
    v12->mCalculatedCrc = crc32(0, 0, 0);
    v13->mInput = (OISFUBufferedInputStream *)(id)[a7 bufferedInputStreamWithOffset:a3 length:a4 - a3];
    unint64_t v14 = 0x40000;
    if (a5 < 0x40000) {
      unint64_t v14 = a5;
    }
    v13->mOutBufferSize = v14;
    [(OISFUZipInflateInputStream *)v13 setupInflateStream];
  }
  return v13;
}

- (OISFUZipInflateInputStream)initWithInput:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)OISFUZipInflateInputStream;
  v4 = [(OISFUZipInflateInputStream *)&v7 init];
  v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->mReachedEnd = 0;
    v4->mOffset = 0;
    v4->mInput = [[OISFUBufferedInputStream alloc] initWithStream:a3];
    v5->mOutBufferSize = 0x40000;
    [(OISFUZipInflateInputStream *)v5 setupInflateStream];
  }
  return v5;
}

- (void)dealloc
{
  inflateEnd(&self->mStream);

  free(self->mOutBuffer);
  v3.receiver = self;
  v3.super_class = (Class)OISFUZipInflateInputStream;
  [(OISFUZipInflateInputStream *)&v3 dealloc];
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
      +[OISFUZipException raise:@"SFUZipInflateError" format:@"Could not create inflate buffer"];
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
  return [(OISFUZipInflateInputStream *)self readToBuffer:v8 size:mOutBufferSize];
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  uInt v4 = a4;
  if (a4 >= 0xFFFFFFFF)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"-[OISFUZipInflateInputStream readToBuffer:size:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipInflateInputStream.m"], 117, 0, "overflow in readToBuffer:");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  self->mStream.avail_out = v4;
  self->mStream.next_out = (Bytef *)a3;
  next_out = a3;
  if (v4)
  {
    LODWORD(v9) = 0;
    do
    {
      if (self->mStream.avail_in)
      {
        if (v9) {
          break;
        }
      }
      else
      {
        if (v9 || self->mReachedEnd) {
          break;
        }
        unint64_t v10 = [(OISFUBufferedInputStream *)self->mInput readToOwnBuffer:&self->mStream size:0xFFFFFFFFLL];
        uInt v11 = v10;
        if (v10 >= 0xFFFFFFFF)
        {
          uint64_t v12 = [NSString stringWithUTF8String:"-[OISFUZipInflateInputStream readToBuffer:size:]"];
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipInflateInputStream.m"], 129, 0, "overflow in readToBuffer:size:");
          +[OITSUAssertionHandler logBacktraceThrottled];
        }
        self->mStream.avail_in = v11;
        self->mOffset += v11;
      }
      uint64_t v9 = inflate(&self->mStream, 0);
      if ((v9 + 5) > 6 || ((1 << (v9 + 5)) & 0x61) == 0) {
        +[OISFUZipException raise:@"SFUZipInflateError", @"inflate() failed: %d", v9 format];
      }
    }
    while (self->mStream.avail_out);
    next_out = (char *)self->mStream.next_out;
  }
  if ((unint64_t)(next_out - a3) >= 0xFFFFFFFF)
  {
    uint64_t v13 = [NSString stringWithUTF8String:"-[OISFUZipInflateInputStream readToBuffer:size:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipInflateInputStream.m"], 141, 0, "overflow in readToBuffer:");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  if (next_out == a3) {
    self->mReachedEnd = 1;
  }
  return next_out - a3;
}

- (void)seekToOffset:(int64_t)a3
{
  uint64_t v3 = [NSString stringWithUTF8String:"-[OISFUZipInflateInputStream seekToOffset:]"];
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipInflateInputStream.m"], 150, 0, "Not implemented.");
  +[OITSUAssertionHandler logBacktraceThrottled];
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
  [(OISFUZipInflateInputStream *)self closeLocalStream];
  mInput = self->mInput;
  [(OISFUBufferedInputStream *)mInput close];
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
    +[OISFUZipException raise:@"SFUZipInflateError", @"inflateInit2() failed: %d", v3 format];
  }
}

@end