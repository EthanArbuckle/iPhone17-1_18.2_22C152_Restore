@interface SFUMemoryOutputStream
- (BOOL)canCreateInputStream;
- (BOOL)canSeek;
- (SFUMemoryOutputStream)initWithData:(id)a3;
- (id)closeLocalStream;
- (id)inputStream;
- (int64_t)offset;
- (void)dealloc;
- (void)seekToOffset:(int64_t)a3 whence:(int)a4;
- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4;
@end

@implementation SFUMemoryOutputStream

- (SFUMemoryOutputStream)initWithData:(id)a3
{
  v4 = [(SFUMemoryOutputStream *)self init];
  if (v4) {
    v4->mData = (NSMutableData *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SFUMemoryOutputStream;
  [(SFUMemoryOutputStream *)&v3 dealloc];
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
  id v4 = +[TSUAssertionHandler currentHandler];
  uint64_t v5 = [NSString stringWithUTF8String:"-[SFUMemoryOutputStream seekToOffset:whence:]"];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUMemoryOutputStream.m"];
  [v4 handleFailureInFunction:v5 file:v6 lineNumber:45 description:@"Not implemented"];
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