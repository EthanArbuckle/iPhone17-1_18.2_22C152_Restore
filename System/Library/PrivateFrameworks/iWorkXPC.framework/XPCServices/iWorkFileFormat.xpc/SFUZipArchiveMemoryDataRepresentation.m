@interface SFUZipArchiveMemoryDataRepresentation
- (BOOL)hasSameLocationAs:(id)a3;
- (BOOL)isReadable;
- (SFUZipArchiveMemoryDataRepresentation)initWithData:(id)a3;
- (id)bufferedInputStream;
- (id)bufferedInputStreamWithBufferSize:(unint64_t)a3;
- (id)bufferedInputStreamWithOffset:(int64_t)a3 length:(int64_t)a4;
- (id)data;
- (id)inputStream;
- (int64_t)dataLength;
- (void)dealloc;
@end

@implementation SFUZipArchiveMemoryDataRepresentation

- (SFUZipArchiveMemoryDataRepresentation)initWithData:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFUZipArchiveMemoryDataRepresentation;
  v4 = [(SFUZipArchiveMemoryDataRepresentation *)&v6 init];
  if (v4) {
    v4->mData = (NSData *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SFUZipArchiveMemoryDataRepresentation;
  [(SFUZipArchiveMemoryDataRepresentation *)&v3 dealloc];
}

- (id)data
{
  return self->mData;
}

- (BOOL)isReadable
{
  return 1;
}

- (int64_t)dataLength
{
  return [(NSData *)self->mData length];
}

- (id)inputStream
{
  int64_t v3 = [(SFUZipArchiveMemoryDataRepresentation *)self dataLength];
  return [(SFUZipArchiveMemoryDataRepresentation *)self bufferedInputStreamWithOffset:0 length:v3];
}

- (id)bufferedInputStream
{
  int64_t v3 = [(SFUZipArchiveMemoryDataRepresentation *)self dataLength];
  return [(SFUZipArchiveMemoryDataRepresentation *)self bufferedInputStreamWithOffset:0 length:v3];
}

- (id)bufferedInputStreamWithBufferSize:(unint64_t)a3
{
  int64_t v4 = [(SFUZipArchiveMemoryDataRepresentation *)self dataLength];
  return [(SFUZipArchiveMemoryDataRepresentation *)self bufferedInputStreamWithOffset:0 length:v4];
}

- (BOOL)hasSameLocationAs:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = [(SFUZipArchiveMemoryDataRepresentation *)self data];
  return v5 == [a3 data];
}

- (id)bufferedInputStreamWithOffset:(int64_t)a3 length:(int64_t)a4
{
  int64_t v7 = [(NSData *)self->mData length];
  if ((a4 | a3) < 0 || (v7 >= a4 ? (BOOL v8 = v7 - a4 < a3) : (BOOL v8 = 1), v8)) {
    +[NSException raise:NSInvalidArgumentException format:@"Bad input stream range."];
  }
  v9 = [[SFUMemoryInputStream alloc] initWithData:self->mData offset:a3 length:a4];
  return v9;
}

@end