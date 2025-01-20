@interface OISFUGZipFileInputStream
- (BOOL)canSeek;
- (OISFUGZipFileInputStream)initWithPath:(id)a3;
- (id)closeLocalStream;
- (int64_t)offset;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (void)close;
- (void)dealloc;
- (void)disableSystemCaching;
- (void)enableSystemCaching;
- (void)seekToOffset:(int64_t)a3;
@end

@implementation OISFUGZipFileInputStream

- (OISFUGZipFileInputStream)initWithPath:(id)a3
{
  self->_fd = -1;
  v4 = [(OISFUGZipFileInputStream *)self init];
  if (v4)
  {
    int v5 = SFUOpen(a3, 0, 0);
    gzFile v6 = gzdopen(v5, "r");
    v4->_file = v6;
    if (!v6)
    {
      close(v5);
      objc_msgSend(MEMORY[0x263EFF940], "sfu_errnoRaise:format:", @"SFUFileOpenError", @"Could not gzdopen %@", a3);
    }
    v4->_fd = v5;
  }
  return v4;
}

- (void)dealloc
{
  [(OISFUGZipFileInputStream *)self close];
  v3.receiver = self;
  v3.super_class = (Class)OISFUGZipFileInputStream;
  [(OISFUGZipFileInputStream *)&v3 dealloc];
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
    uint64_t v8 = [NSString stringWithUTF8String:"-[OISFUGZipFileInputStream readToBuffer:size:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUGZipFileInputStream.m"], 54, 0, "Using a closed stream");
    +[OITSUAssertionHandler logBacktraceThrottled];
    file = self->_file;
    if (!file)
    {
      objc_msgSend(MEMORY[0x263EFF940], "sfu_errnoRaise:format:", @"SFUGZReadError", @"Closed stream");
      file = self->_file;
    }
  }
  if (a4 >= 0xFFFFFFFF) {
    unsigned int v9 = -1;
  }
  else {
    unsigned int v9 = a4;
  }
  int v10 = gzread(file, a3, v9);
  if (v10 < 0) {
    objc_msgSend(MEMORY[0x263EFF940], "sfu_errnoRaise:format:", @"SFUGZReadError", @"Could not gzread");
  }
  unint64_t result = v10;
  self->_offset += v10;
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
      objc_msgSend(MEMORY[0x263EFF940], "sfu_errnoRaise:format:", @"SFUFcntlError", @"Could not set F_NOCACHE on read stream.");
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
      objc_msgSend(MEMORY[0x263EFF940], "sfu_errnoRaise:format:", @"SFUFcntlError", @"Could not unset F_NOCACHE on read stream.");
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