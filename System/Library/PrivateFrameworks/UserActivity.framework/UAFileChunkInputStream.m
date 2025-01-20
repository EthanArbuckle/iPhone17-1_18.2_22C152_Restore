@interface UAFileChunkInputStream
- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4;
- (BOOL)hasBytesAvailable;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (NSFileHandle)file;
- (NSNumber)chunkOffset;
- (NSNumber)currentOffset;
- (UAFileChunkInputStream)initWithFileHandle:(id)a3 offsetInFile:(id)a4 size:(int64_t)a5;
- (id)propertyForKey:(id)a3;
- (id)streamError;
- (int64_t)chunkSize;
- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4;
- (int64_t)readSize;
- (unint64_t)status;
- (void)close;
- (void)open;
- (void)setChunkOffset:(id)a3;
- (void)setChunkSize:(int64_t)a3;
- (void)setCurrentOffset:(id)a3;
- (void)setFile:(id)a3;
- (void)setReadSize:(int64_t)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation UAFileChunkInputStream

- (UAFileChunkInputStream)initWithFileHandle:(id)a3 offsetInFile:(id)a4 size:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UAFileChunkInputStream;
  v10 = [(UAFileChunkInputStream *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(UAFileChunkInputStream *)v10 setFile:v8];
    [(UAFileChunkInputStream *)v11 setChunkOffset:v9];
    [(UAFileChunkInputStream *)v11 setChunkSize:a5];
    [(UAFileChunkInputStream *)v11 setCurrentOffset:v9];
    [(UAFileChunkInputStream *)v11 setReadSize:0];
    [(UAFileChunkInputStream *)v11 setStatus:0];
  }

  return v11;
}

- (BOOL)hasBytesAvailable
{
  unint64_t v3 = [(UAFileChunkInputStream *)self status];
  if (v3 > 3 || v3 == 1) {
    return 0;
  }
  int64_t v5 = [(UAFileChunkInputStream *)self readSize];
  return v5 < [(UAFileChunkInputStream *)self chunkSize];
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  if ([(UAFileChunkInputStream *)self status] == 5
    || [(UAFileChunkInputStream *)self status] == 6
    || [(UAFileChunkInputStream *)self status] == 7)
  {
    return 0;
  }
  int64_t v7 = [(UAFileChunkInputStream *)self readSize];
  if (v7 >= [(UAFileChunkInputStream *)self chunkSize])
  {
    [(UAFileChunkInputStream *)self setStatus:5];
    return 0;
  }
  [(UAFileChunkInputStream *)self setStatus:3];
  int64_t v8 = [(UAFileChunkInputStream *)self chunkSize];
  int64_t v9 = [(UAFileChunkInputStream *)self readSize];
  if (v8 - v9 >= a4) {
    size_t v10 = a4;
  }
  else {
    size_t v10 = v8 - v9;
  }
  v11 = [(UAFileChunkInputStream *)self file];
  objc_sync_enter(v11);
  v12 = [(UAFileChunkInputStream *)self currentOffset];
  uint64_t v13 = [v12 unsignedLongLongValue];

  v14 = [(UAFileChunkInputStream *)self file];
  uint64_t v15 = [v14 offsetInFile];

  if (v13 != v15)
  {
    v16 = [(UAFileChunkInputStream *)self file];
    [v16 seekToFileOffset:v13];
  }
  v17 = [(UAFileChunkInputStream *)self file];
  int v18 = [v17 fileDescriptor];

  ssize_t v19 = read(v18, a3, v10);
  [(UAFileChunkInputStream *)self setReadSize:[(UAFileChunkInputStream *)self readSize] + v19];
  v20 = [NSNumber numberWithUnsignedLongLong:v19 + v13];
  [(UAFileChunkInputStream *)self setCurrentOffset:v20];

  if (a4 && !v19)
  {
    [(UAFileChunkInputStream *)self setStatus:5];
    [(UAFileChunkInputStream *)self setReadSize:[(UAFileChunkInputStream *)self chunkSize]];
    ssize_t v19 = 0;
  }
  objc_sync_exit(v11);

  return v19;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (id)propertyForKey:(id)a3
{
  return 0;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return 0;
}

- (void)open
{
  if ([(UAFileChunkInputStream *)self status] != 6)
  {
    [(UAFileChunkInputStream *)self setStatus:2];
  }
}

- (void)close
{
}

- (id)streamError
{
  return 0;
}

- (NSFileHandle)file
{
  return (NSFileHandle *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFile:(id)a3
{
}

- (NSNumber)chunkOffset
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setChunkOffset:(id)a3
{
}

- (int64_t)chunkSize
{
  return self->_chunkSize;
}

- (void)setChunkSize:(int64_t)a3
{
  self->_chunkSize = a3;
}

- (NSNumber)currentOffset
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCurrentOffset:(id)a3
{
}

- (int64_t)readSize
{
  return self->_readSize;
}

- (void)setReadSize:(int64_t)a3
{
  self->_readSize = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentOffset, 0);
  objc_storeStrong((id *)&self->_chunkOffset, 0);

  objc_storeStrong((id *)&self->_file, 0);
}

@end