@interface GQZArchiveMemoryInputStream
- (GQZArchiveMemoryInputStream)initWithData:(id)a3;
- (const)dataAtOffset:(int64_t)a3 size:(unint64_t)a4 end:(int64_t)a5 readSize:(unint64_t *)a6;
- (int64_t)size;
- (void)dealloc;
- (void)readFromOffset:(int64_t)a3 size:(unint64_t)a4 buffer:(char *)a5;
@end

@implementation GQZArchiveMemoryInputStream

- (GQZArchiveMemoryInputStream)initWithData:(id)a3
{
  v4 = [(GQZArchiveMemoryInputStream *)self init];
  if (v4)
  {
    v5 = (NSData *)a3;
    v4->mData = v5;
    v4->mBytes = (const char *)[(NSData *)v5 bytes];
    v4->mSize = [(NSData *)v4->mData length];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQZArchiveMemoryInputStream;
  [(GQZArchiveMemoryInputStream *)&v3 dealloc];
}

- (const)dataAtOffset:(int64_t)a3 size:(unint64_t)a4 end:(int64_t)a5 readSize:(unint64_t *)a6
{
  if (((a3 | a4) & 0x8000000000000000) != 0 || (uint64_t)(a4 ^ 0x7FFFFFFFFFFFFFFFLL) < a3) {
    +[GQZException raise:@"GQZReadError" format:@"Size overflow."];
  }
  if (a5)
  {
    if ((uint64_t)(a4 + a3) > a5) {
      +[GQZException raise:@"GQZReadError" format:@"Tried to read past end of chunk."];
    }
  }
  else
  {
    a5 = a4 + a3;
  }
  if (a5 > self->mSize) {
    +[GQZException raise:@"GQZReadError" format:@"Tried to read past end of the stream."];
  }
  if (a6) {
    *a6 = a5 - a3;
  }
  return &self->mBytes[a3];
}

- (void)readFromOffset:(int64_t)a3 size:(unint64_t)a4 buffer:(char *)a5
{
  int64_t v9 = a4 + a3;
  if (((a3 | a4) & 0x8000000000000000) != 0 || (uint64_t)(a4 ^ 0x7FFFFFFFFFFFFFFFLL) < a3) {
    +[GQZException raise:@"GQZReadError" format:@"Size overflow."];
  }
  if (v9 > self->mSize) {
    +[GQZException raise:@"GQZReadError" format:@"Tried to read past end of the stream."];
  }
  v10 = &self->mBytes[a3];
  memcpy(a5, v10, a4);
}

- (int64_t)size
{
  return self->mSize;
}

@end