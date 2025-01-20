@interface OISFUGZipFileOutputStream
+ (id)gzipExtension;
- (BOOL)canCreateInputStream;
- (BOOL)canSeek;
- (OISFUGZipFileOutputStream)initWithPath:(id)a3;
- (id)closeLocalStream;
- (id)inputStream;
- (id)path;
- (int64_t)offset;
- (void)close;
- (void)dealloc;
- (void)seekToOffset:(int64_t)a3 whence:(int)a4;
- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4;
@end

@implementation OISFUGZipFileOutputStream

+ (id)gzipExtension
{
  return @"gz";
}

- (OISFUGZipFileOutputStream)initWithPath:(id)a3
{
  v4 = [(OISFUGZipFileOutputStream *)self init];
  if (v4)
  {
    unlink((const char *)[a3 fileSystemRepresentation]);
    int v5 = SFUOpen(a3, 1537, 0x1B6u);
    gzFile v6 = gzdopen(v5, "w");
    v4->_file = v6;
    if (!v6)
    {
      close(v5);
      objc_msgSend(MEMORY[0x263EFF940], "sfu_errnoRaise:format:", @"SFUFileOpenError", @"Could not gzdopen %@", a3);
    }
    v4->_path = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  file = self->_file;
  if (file) {
    gzclose(file);
  }

  v4.receiver = self;
  v4.super_class = (Class)OISFUGZipFileOutputStream;
  [(OISFUGZipFileOutputStream *)&v4 dealloc];
}

- (id)path
{
  return self->_path;
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  file = self->_file;
  if (!file)
  {
    uint64_t v8 = [NSString stringWithUTF8String:"-[OISFUGZipFileOutputStream writeBuffer:size:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUGZipFileOutputStream.m"], 64, 0, "Using a closed stream");
    +[OITSUAssertionHandler logBacktraceThrottled];
    file = self->_file;
  }
  if (a4 && file)
  {
    do
    {
      if (a4 >= 0xFFFFFFFF) {
        unint64_t v9 = 0xFFFFFFFFLL;
      }
      else {
        unint64_t v9 = a4;
      }
      int v10 = gzwrite(self->_file, a3, v9);
      if (v9 != v10) {
        objc_msgSend(MEMORY[0x263EFF940], "sfu_errnoRaise:format:", @"SFUFileWriteError", @"Could not gzwrite");
      }
      self->_offset += v10;
      a3 += v10;
      a4 -= v10;
    }
    while (a4);
  }
}

- (int64_t)offset
{
  if (!self->_file)
  {
    uint64_t v3 = [NSString stringWithUTF8String:"-[OISFUGZipFileOutputStream offset]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUGZipFileOutputStream.m"], 80, 0, "Using a closed stream");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  return self->_offset;
}

- (BOOL)canSeek
{
  return 0;
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
}

- (BOOL)canCreateInputStream
{
  return 0;
}

- (id)inputStream
{
  return 0;
}

- (void)close
{
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