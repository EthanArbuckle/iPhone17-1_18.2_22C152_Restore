@interface GQZArchiveFileInputStream
- (GQZArchiveFileInputStream)initWithPath:(id)a3;
- (const)dataAtOffset:(int64_t)a3 size:(unint64_t)a4 end:(int64_t)a5 readSize:(unint64_t *)a6;
- (int64_t)size;
- (void)dealloc;
- (void)readFromOffset:(int64_t)a3 size:(unint64_t)a4 buffer:(char *)a5;
@end

@implementation GQZArchiveFileInputStream

- (GQZArchiveFileInputStream)initWithPath:(id)a3
{
  v4 = [(GQZArchiveFileInputStream *)self init];
  if (v4)
  {
    v4->mFile = sub_45A08((uint64_t)a3, "r");
    v5 = (char *)malloc_type_malloc(0x40000uLL, 0xD8ECAF68uLL);
    v4->mBuffer = v5;
    if (!v5) {
      +[GQZException raise:@"GQZFileBufferError" format:@"Could not create read buffer"];
    }
    if (fseeko(v4->mFile, 0, 2))
    {
      v6 = __error();
      +[GQZException raise:@"GQZSeekError", @"Could not seek: %s", strerror(*v6) format];
    }
    off_t v7 = ftello(v4->mFile);
    if (v7 == -1)
    {
      v8 = __error();
      +[GQZException raise:@"GQZTellError", @"Could not tell: %s", strerror(*v8) format];
    }
    v4->mSize = v7;
  }
  return v4;
}

- (void)dealloc
{
  mFile = self->mFile;
  if (mFile) {
    fclose(mFile);
  }
  free(self->mBuffer);
  v4.receiver = self;
  v4.super_class = (Class)GQZArchiveFileInputStream;
  [(GQZArchiveFileInputStream *)&v4 dealloc];
}

- (const)dataAtOffset:(int64_t)a3 size:(unint64_t)a4 end:(int64_t)a5 readSize:(unint64_t *)a6
{
  if (((a3 | a4) & 0x8000000000000000) != 0 || (uint64_t)(a4 ^ 0x7FFFFFFFFFFFFFFFLL) < a3) {
    +[GQZException raise:@"GQZReadError" format:@"Size overflow."];
  }
  int64_t v11 = a4 + a3;
  if (a5)
  {
    if (v11 > a5) {
      +[GQZException raise:@"GQZReadError" format:@"Tried to read past end of chunk."];
    }
  }
  else
  {
    a5 = v11;
  }
  int64_t mBufferStart = self->mBufferStart;
  if (mBufferStart > a3 || (int64_t mBufferEnd = self->mBufferEnd, v11 > mBufferEnd))
  {
    if (fseeko(self->mFile, a3, 0))
    {
      v14 = __error();
      +[GQZException raise:@"GQZSeekError", @"Could not seek: %s", strerror(*v14) format];
    }
    if (a5 - a3 >= 0x40000) {
      size_t v15 = 0x40000;
    }
    else {
      size_t v15 = a5 - a3;
    }
    if (fread(self->mBuffer, 1uLL, v15, self->mFile) != v15)
    {
      v16 = __error();
      +[GQZException raise:@"GQZReadError", @"Could not read: %s", strerror(*v16) format];
    }
    int64_t mBufferEnd = v15 + a3;
    self->int64_t mBufferStart = a3;
    self->int64_t mBufferEnd = v15 + a3;
    int64_t mBufferStart = a3;
  }
  if (a6) {
    *a6 = mBufferEnd - a3;
  }
  return &self->mBuffer[a3 - mBufferStart];
}

- (void)readFromOffset:(int64_t)a3 size:(unint64_t)a4 buffer:(char *)a5
{
  if (fseeko(self->mFile, a3, 0))
  {
    v8 = __error();
    +[GQZException raise:@"GQZSeekError", @"Could not seek: %s", strerror(*v8) format];
  }
  if (fread(a5, 1uLL, a4, self->mFile) != a4)
  {
    v9 = __error();
    +[GQZException raise:@"GQZReadError", @"Could not read: %s", strerror(*v9) format];
  }
}

- (int64_t)size
{
  return self->mSize;
}

@end