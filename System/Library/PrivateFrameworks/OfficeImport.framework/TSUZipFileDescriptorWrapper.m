@interface TSUZipFileDescriptorWrapper
- (TSUReadChannel)readChannel;
- (TSUZipFileDescriptorWrapper)init;
- (TSUZipFileDescriptorWrapper)initWithFileDescriptor:(int)a3 queue:(id)a4;
- (int)fileDescriptor;
- (void)beginAccess;
- (void)dealloc;
- (void)endAccess;
- (void)waitForAccessToEnd;
@end

@implementation TSUZipFileDescriptorWrapper

- (TSUZipFileDescriptorWrapper)init
{
  v2 = [NSString stringWithUTF8String:"-[TSUZipFileDescriptorWrapper init]"];
  v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileArchive.m"];
  +[OITSUAssertionHandler handleFailureInFunction:v2 file:v3 lineNumber:443 isFatal:0 description:"Do not call method"];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSUZipFileDescriptorWrapper init]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSUZipFileDescriptorWrapper)initWithFileDescriptor:(int)a3 queue:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ((v4 & 0x80000000) == 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)TSUZipFileDescriptorWrapper;
    id v7 = [(TSUZipFileDescriptorWrapper *)&v17 init];
    self = v7;
    if (!v7)
    {
      close(v4);
      goto LABEL_7;
    }
    v7->_fileDescriptor = v4;
    v8 = [TSUFileIOChannel alloc];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __60__TSUZipFileDescriptorWrapper_initWithFileDescriptor_queue___block_invoke;
    v15[3] = &__block_descriptor_36_e8_v12__0i8l;
    int v16 = v4;
    v9 = [(TSUFileIOChannel *)v8 initForReadingDescriptor:v4 queue:v6 cleanupHandler:v15];
    readChannel = self->_readChannel;
    self->_readChannel = v9;

    if (self->_readChannel)
    {
      v11 = (OS_dispatch_group *)dispatch_group_create();
      accessGroup = self->_accessGroup;
      self->_accessGroup = v11;

LABEL_7:
      self = self;
      v13 = self;
      goto LABEL_8;
    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

uint64_t __60__TSUZipFileDescriptorWrapper_initWithFileDescriptor_queue___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)dealloc
{
  [(TSUReadChannel *)self->_readChannel close];
  v3.receiver = self;
  v3.super_class = (Class)TSUZipFileDescriptorWrapper;
  [(TSUZipFileDescriptorWrapper *)&v3 dealloc];
}

- (void)beginAccess
{
}

- (void)endAccess
{
}

- (void)waitForAccessToEnd
{
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (TSUReadChannel)readChannel
{
  return self->_readChannel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readChannel, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
}

@end