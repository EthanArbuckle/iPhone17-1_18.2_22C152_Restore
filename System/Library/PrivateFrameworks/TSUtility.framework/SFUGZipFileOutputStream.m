@interface SFUGZipFileOutputStream
+ (id)gzipExtension;
- (BOOL)canCreateInputStream;
- (BOOL)canSeek;
- (SFUGZipFileOutputStream)initWithPath:(id)a3;
- (id)closeLocalStream;
- (id)inputStream;
- (id)path;
- (int64_t)offset;
- (void)close;
- (void)dealloc;
- (void)seekToOffset:(int64_t)a3 whence:(int)a4;
- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4;
@end

@implementation SFUGZipFileOutputStream

+ (id)gzipExtension
{
  return @"gz";
}

- (SFUGZipFileOutputStream)initWithPath:(id)a3
{
  v4 = [(SFUGZipFileOutputStream *)self init];
  if (v4)
  {
    unlink((const char *)[a3 fileSystemRepresentation]);
    int v5 = TSUOpen(a3, 1537, 0x1B6u);
    gzFile v6 = gzdopen(v5, "w");
    v4->_file = v6;
    if (!v6)
    {
      close(v5);
      [MEMORY[0x263EFF940] errnoRaise:@"SFUFileOpenError", @"Could not gzdopen %@", a3 format];
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
  v4.super_class = (Class)SFUGZipFileOutputStream;
  [(SFUGZipFileOutputStream *)&v4 dealloc];
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
    id v8 = +[TSUAssertionHandler currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[SFUGZipFileOutputStream writeBuffer:size:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUGZipFileOutputStream.m"), 72, @"Using a closed stream");
    file = self->_file;
  }
  if (a4 && file)
  {
    do
    {
      if (a4 >= 0xFFFFFFFF) {
        unint64_t v10 = 0xFFFFFFFFLL;
      }
      else {
        unint64_t v10 = a4;
      }
      int v11 = gzwrite(self->_file, a3, v10);
      if (v10 != v11) {
        [MEMORY[0x263EFF940] errnoRaise:@"SFUFileWriteError" format:@"Could not gzwrite"];
      }
      self->_offset += v11;
      a3 += v11;
      a4 -= v11;
    }
    while (a4);
  }
}

- (int64_t)offset
{
  if (!self->_file)
  {
    id v3 = +[TSUAssertionHandler currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[SFUGZipFileOutputStream offset]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUGZipFileOutputStream.m"), 92, @"Using a closed stream");
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