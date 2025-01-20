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
    v13->mInput = (SFUBufferedInputStream *)(id)[a7 bufferedInputStreamWithOffset:a3 length:a4 - a3];
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
    mOutBuffer = (char *)malloc_type_malloc(self->mOutBufferSize, 0x36C151DFuLL);
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
  unint64_t v7 = 0x264629000uLL;
  if (a4 >= 0xFFFFFFFF)
  {
    id v8 = +[TSUAssertionHandler currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[SFUZipInflateInputStream readToBuffer:size:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipInflateInputStream.m"), 130, @"overflow in readToBuffer:");
  }
  self->mStream.avail_out = v4;
  self->mStream.next_out = (Bytef *)a3;
  next_out = a3;
  if (v4)
  {
    LODWORD(v11) = 0;
    do
    {
      if (self->mStream.avail_in)
      {
        if (v11) {
          break;
        }
      }
      else
      {
        if (v11 || self->mReachedEnd) {
          break;
        }
        unint64_t v12 = [(SFUBufferedInputStream *)self->mInput readToOwnBuffer:&self->mStream size:0xFFFFFFFFLL];
        uInt v13 = v12;
        if (v12 >= 0xFFFFFFFF)
        {
          unint64_t v14 = v7;
          uint64_t v15 = [*(id *)(v7 + 3088) currentHandler];
          uint64_t v16 = [NSString stringWithUTF8String:"-[SFUZipInflateInputStream readToBuffer:size:]"];
          uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipInflateInputStream.m"];
          v18 = (void *)v15;
          unint64_t v7 = v14;
          [v18 handleFailureInFunction:v16 file:v17 lineNumber:144 description:@"overflow in readToBuffer:size:"];
        }
        self->mStream.avail_in = v13;
        self->mOffset += v13;
      }
      uint64_t v11 = inflate(&self->mStream, 0);
      if ((v11 + 5) > 6 || ((1 << (v11 + 5)) & 0x61) == 0) {
        +[SFUZipException raise:@"SFUZipInflateError", @"inflate() failed: %d", v11 format];
      }
    }
    while (self->mStream.avail_out);
    next_out = (char *)self->mStream.next_out;
  }
  if ((unint64_t)(next_out - a3) >= 0xFFFFFFFF)
  {
    v19 = (void *)[*(id *)(v7 + 3088) currentHandler];
    uint64_t v20 = [NSString stringWithUTF8String:"-[SFUZipInflateInputStream readToBuffer:size:]"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipInflateInputStream.m"), 157, @"overflow in readToBuffer:");
  }
  if (next_out == a3) {
    self->mReachedEnd = 1;
  }
  return next_out - a3;
}

- (void)seekToOffset:(int64_t)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"-[SFUZipInflateInputStream seekToOffset:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipInflateInputStream.m"];
  [v3 handleFailureInFunction:v4 file:v5 lineNumber:182 description:@"Not implemented."];
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