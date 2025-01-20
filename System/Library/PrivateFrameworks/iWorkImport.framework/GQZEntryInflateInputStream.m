@interface GQZEntryInflateInputStream
- (GQZEntryInflateInputStream)initWithOffset:(int64_t)a3 end:(int64_t)a4 uncompressedSize:(unint64_t)a5 crc:(unint64_t)a6 input:(id)a7;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (void)dealloc;
- (void)readToOwnBuffer:(const char *)a3 size:(unint64_t *)a4;
@end

@implementation GQZEntryInflateInputStream

- (GQZEntryInflateInputStream)initWithOffset:(int64_t)a3 end:(int64_t)a4 uncompressedSize:(unint64_t)a5 crc:(unint64_t)a6 input:(id)a7
{
  v12 = [(GQZEntryInflateInputStream *)self init];
  v13 = v12;
  if (v12)
  {
    v12->mOffset = a3;
    v12->mEnd = a4;
    v12->mCheckCrc = a6;
    v12->mCalculatedCrc = crc32(0, 0, 0);
    v14 = (GQZArchiveInputStream *)a7;
    v13->mStream.next_in = 0;
    v13->mInput = v14;
    unint64_t v15 = 0x40000;
    if (a5 < 0x40000) {
      unint64_t v15 = a5;
    }
    v13->mOutBufferSize = v15;
    v13->mStream.avail_in = 0;
    v13->mStream.zfree = 0;
    v13->mStream.opaque = 0;
    v13->mStream.zalloc = 0;
    uint64_t v16 = inflateInit2_(&v13->mStream, -15, "1.2.12", 112);
    if (v16) {
      +[GQZException raise:@"GQZInflateError", @"inflateInit2() failed: %d", v16 format];
    }
  }
  return v13;
}

- (void)dealloc
{
  inflateEnd(&self->mStream);

  free(self->mOutBuffer);
  v3.receiver = self;
  v3.super_class = (Class)GQZEntryInflateInputStream;
  [(GQZEntryInflateInputStream *)&v3 dealloc];
}

- (void)readToOwnBuffer:(const char *)a3 size:(unint64_t *)a4
{
  mOutBuffer = self->mOutBuffer;
  if (!mOutBuffer)
  {
    mOutBuffer = (char *)malloc_type_malloc(self->mOutBufferSize, 0x142F5F01uLL);
    self->mOutBuffer = mOutBuffer;
    if (!mOutBuffer)
    {
      +[GQZException raise:@"GQZInflateError" format:@"Could not create inflate buffer"];
      mOutBuffer = self->mOutBuffer;
    }
  }
  *a4 = [(GQZEntryInflateInputStream *)self readToBuffer:mOutBuffer size:self->mOutBufferSize];
  *a3 = self->mOutBuffer;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  self->mStream.avail_out = a4;
  self->mStream.next_out = (Bytef *)a3;
  next_out = a3;
  if (a4)
  {
    LODWORD(v7) = 0;
    p_mStream = &self->mStream;
    while (1)
    {
      int64_t mOffset = self->mOffset;
      if (mOffset >= self->mEnd) {
        break;
      }
      if (v7) {
        goto LABEL_13;
      }
      uint64_t avail_in = self->mStream.avail_in;
      if (avail_in) {
        goto LABEL_9;
      }
      v11 = (Bytef *)-[GQZArchiveInputStream dataAtOffset:size:end:readSize:](self->mInput, "dataAtOffset:size:end:readSize:");
      self->mStream.uint64_t avail_in = 0;
      self->int64_t mOffset = self->mOffset;
LABEL_10:
      p_mStream->next_in = v11;
      uint64_t v7 = inflate(&self->mStream, 0);
      if (v7 >= 2) {
        +[GQZException raise:@"GQZInflateError", @"inflate() failed: %d", v7 format];
      }
      if (!self->mStream.avail_out)
      {
LABEL_13:
        next_out = self->mStream.next_out;
        goto LABEL_14;
      }
    }
    if (v7) {
      goto LABEL_13;
    }
    uint64_t avail_in = self->mStream.avail_in;
    if (!self->mStream.avail_in) {
      goto LABEL_13;
    }
LABEL_9:
    v11 = (Bytef *)-[GQZArchiveInputStream dataAtOffset:size:end:readSize:](self->mInput, "dataAtOffset:size:end:readSize:", mOffset - avail_in);
    goto LABEL_10;
  }
LABEL_14:
  unint64_t v12 = next_out - a3;
  uLong v13 = crc32(self->mCalculatedCrc, (const Bytef *)a3, (int)next_out - (int)a3);
  self->mCalculatedCrc = v13;
  if (self->mOffset == self->mEnd && !self->mStream.avail_in && v13 != self->mCheckCrc) {
    +[GQZException raise:@"GQZInflateError" format:@"CRC error"];
  }
  return v12;
}

@end