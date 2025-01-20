@interface SFUGZipFileInputStream
- (BOOL)canSeek;
- (SFUGZipFileInputStream)initWithPath:(id)a3;
- (id)closeLocalStream;
- (int64_t)offset;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (void)close;
- (void)dealloc;
- (void)disableSystemCaching;
- (void)enableSystemCaching;
- (void)seekToOffset:(int64_t)a3;
@end

@implementation SFUGZipFileInputStream

- (SFUGZipFileInputStream)initWithPath:(id)a3
{
  self->_fd = -1;
  v4 = [(SFUGZipFileInputStream *)self init];
  if (v4)
  {
    int v5 = SFUOpen(a3, 0, 0);
    gzFile v6 = gzdopen(v5, "r");
    v4->_file = v6;
    if (!v6)
    {
      close(v5);
      [MEMORY[0x263EFF940] errnoRaise:@"SFUFileOpenError", @"Could not gzdopen %@", a3 format];
    }
    v4->_fd = v5;
  }
  return v4;
}

- (void)dealloc
{
  [(SFUGZipFileInputStream *)self close];
  v3.receiver = self;
  v3.super_class = (Class)SFUGZipFileInputStream;
  [(SFUGZipFileInputStream *)&v3 dealloc];
}

- (int64_t)offset
{
  return self->_offset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  file = self->_file;
  if (!file)
  {
    id v8 = +[TSUAssertionHandler currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[SFUGZipFileInputStream readToBuffer:size:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUGZipFileInputStream.m"), 59, @"Using a closed stream");
    file = self->_file;
    if (!file)
    {
      [MEMORY[0x263EFF940] errnoRaise:@"SFUGZReadError" format:@"Closed stream"];
      file = self->_file;
    }
  }
  if (a4 >= 0xFFFFFFFF) {
    unsigned int v10 = -1;
  }
  else {
    unsigned int v10 = a4;
  }
  int v11 = gzread(file, a3, v10);
  if (v11 < 0) {
    [MEMORY[0x263EFF940] errnoRaise:@"SFUGZReadError" format:@"Could not gzread"];
  }
  unint64_t result = v11;
  self->_offset += v11;
  return result;
}

- (BOOL)canSeek
{
  return 0;
}

- (void)seekToOffset:(int64_t)a3
{
}

- (void)disableSystemCaching
{
  int fd = self->_fd;
  if (fd != -1)
  {
    if (fcntl(fd, 48, 1) == -1) {
      [MEMORY[0x263EFF940] errnoRaise:@"SFUFcntlError" format:@"Could not set F_NOCACHE on read stream."];
    }
    self->_isCachingDisabled = 1;
  }
}

- (void)enableSystemCaching
{
  int fd = self->_fd;
  if (fd != -1)
  {
    if (fcntl(fd, 48, 0) == -1) {
      [MEMORY[0x263EFF940] errnoRaise:@"SFUFcntlError" format:@"Could not unset F_NOCACHE on read stream."];
    }
    self->_isCachingDisabled = 0;
  }
}

- (void)close
{
  int fd = self->_fd;
  if (fd != -1)
  {
    if (self->_isCachingDisabled)
    {
      fcntl(fd, 48, 0);
      self->_isCachingDisabled = 0;
    }
    self->_int fd = -1;
  }
  file = self->_file;
  if (file)
  {
    gzclose(file);
    self->_file = 0;
  }
}

- (id)closeLocalStream
{
  return 0;
}

@end