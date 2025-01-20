@interface GQZEntryUncompressedInputStream
- (GQZEntryUncompressedInputStream)initWithOffset:(int64_t)a3 end:(int64_t)a4 input:(id)a5;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (void)dealloc;
- (void)readToOwnBuffer:(const char *)a3 size:(unint64_t *)a4;
@end

@implementation GQZEntryUncompressedInputStream

- (GQZEntryUncompressedInputStream)initWithOffset:(int64_t)a3 end:(int64_t)a4 input:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)GQZEntryUncompressedInputStream;
  v8 = [(GQZEntryUncompressedInputStream *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->mOffset = a3;
    v8->mEnd = a4;
    v8->mInput = (GQZArchiveInputStream *)a5;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQZEntryUncompressedInputStream;
  [(GQZEntryUncompressedInputStream *)&v3 dealloc];
}

- (void)readToOwnBuffer:(const char *)a3 size:(unint64_t *)a4
{
  *a3 = (const char *)[(GQZArchiveInputStream *)self->mInput dataAtOffset:self->mOffset size:self->mEnd - self->mOffset end:self->mEnd readSize:a4];
  self->mOffset += *a4;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  int64_t mOffset = self->mOffset;
  if (self->mEnd - mOffset >= (uint64_t)a4) {
    unint64_t v5 = a4;
  }
  else {
    unint64_t v5 = self->mEnd - mOffset;
  }
  -[GQZArchiveInputStream readFromOffset:size:buffer:](self->mInput, "readFromOffset:size:buffer:");
  return v5;
}

@end