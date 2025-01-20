@interface OISFUMemoryOutputStream
- (BOOL)canCreateInputStream;
- (BOOL)canSeek;
- (OISFUMemoryOutputStream)initWithData:(id)a3;
- (id)closeLocalStream;
- (id)inputStream;
- (int64_t)offset;
- (void)dealloc;
- (void)seekToOffset:(int64_t)a3 whence:(int)a4;
- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4;
@end

@implementation OISFUMemoryOutputStream

- (OISFUMemoryOutputStream)initWithData:(id)a3
{
  v4 = [(OISFUMemoryOutputStream *)self init];
  if (v4) {
    v4->mData = (NSMutableData *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OISFUMemoryOutputStream;
  [(OISFUMemoryOutputStream *)&v3 dealloc];
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
}

- (BOOL)canSeek
{
  return 0;
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
  uint64_t v4 = objc_msgSend(NSString, "stringWithUTF8String:", "-[OISFUMemoryOutputStream seekToOffset:whence:]", *(void *)&a4);
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUMemoryOutputStream.m"], 42, 0, "Not implemented");
  +[OITSUAssertionHandler logBacktraceThrottled];
}

- (int64_t)offset
{
  return [(NSMutableData *)self->mData length];
}

- (BOOL)canCreateInputStream
{
  return 0;
}

- (id)inputStream
{
  return 0;
}

- (id)closeLocalStream
{
  return 0;
}

@end