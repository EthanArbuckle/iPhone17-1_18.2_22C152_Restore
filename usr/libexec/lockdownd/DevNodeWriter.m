@interface DevNodeWriter
- (BOOL)finished;
- (BOOL)isAvailable;
- (DevNodeWriter)init;
- (DevNodeWriter)initWithIOMedia:(unsigned int)a3;
- (DevNodeWriter)initWithService:(unsigned int)a3;
- (DevNodeWriter)initWithServiceNamed:(id)a3 parent:(unsigned int)a4;
- (NSString)devicePath;
- (int)eraseBytes:(unsigned int)a3 ofLength:(unsigned int)a4;
- (int)nodeDescriptor;
- (int)preferredBlockSize;
- (int)writeBytes:(const void *)a3 ofLength:(unint64_t)a4 withError:(id *)a5;
- (int)writeData:(id)a3 withError:(id *)a4;
- (unint64_t)numberOfBytesRemainingInBlock;
- (unsigned)service;
- (void)_setupFileDescriptor;
- (void)_waitForDeviceNode:(id)a3 withTimeout:(unsigned int)a4;
- (void)dealloc;
- (void)setNodeDescriptor:(int)a3;
- (void)setPreferredBlockSize:(int)a3;
- (void)setService:(unsigned int)a3;
@end

@implementation DevNodeWriter

- (DevNodeWriter)init
{
  return [(DevNodeWriter *)self initWithIOMedia:0];
}

- (DevNodeWriter)initWithIOMedia:(unsigned int)a3
{
  v13.receiver = self;
  v13.super_class = (Class)DevNodeWriter;
  v4 = [(DevNodeWriter *)&v13 init];
  if (v4)
  {
    if (IOObjectConformsTo(a3, "IOMedia"))
    {
      IOServiceWaitQuiet(a3, 0);
      IOObjectRetain(a3);
      *((_DWORD *)v4 + 2) = a3;
      *(void *)(v4 + 12) = 0xFFFFFFFFLL;
      if ([v4 isAvailable])
      {
        [v4 _setupFileDescriptor];
        return (DevNodeWriter *)v4;
      }
      CFProperty = (void *)IORegistryEntryCreateCFProperty(*((_DWORD *)v4 + 2), @"BSD Name", kCFAllocatorDefault, 0);
      iBU_LOG_real(@"File descriptor %@ wasn't available at init time.", "-[DevNodeWriter initWithIOMedia:]", v6, v7, v8, v9, v10, v11, (uint64_t)CFProperty);
    }
    return 0;
  }
  return (DevNodeWriter *)v4;
}

- (DevNodeWriter)initWithService:(unsigned int)a3
{
  uint64_t entryID = 0;
  IORegistryEntryGetRegistryEntryID(a3, &entryID);
  IOServiceWaitQuiet(a3, 0);
  v15[0] = @"IOParentMatch";
  CFMutableDictionaryRef v5 = IORegistryEntryIDMatching(entryID);
  v16[0] = (id)CFMakeCollectable(v5);
  v16[1] = @"IOMedia";
  v15[1] = @"IOProviderClass";
  v15[2] = @"IOPropertyMatch";
  CFStringRef v13 = @"Whole";
  v14 = +[NSNumber numberWithBool:1];
  v16[2] = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  if (v6) {
    CFDictionaryRef v7 = (const __CFDictionary *)CFRetain(v6);
  }
  else {
    CFDictionaryRef v7 = 0;
  }
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v7);
  uint64_t v9 = [(DevNodeWriter *)self initWithIOMedia:MatchingService];
  if (MatchingService && IOObjectRelease(MatchingService)) {
    sub_100105014(&v12, v17);
  }
  return v9;
}

- (DevNodeWriter)initWithServiceNamed:(id)a3 parent:(unsigned int)a4
{
  uint64_t Namespace = MSUBootFirmwareFindNamespace(a4, (uint64_t)a3);
  uint64_t v6 = [(DevNodeWriter *)self initWithService:Namespace];
  if (Namespace && IOObjectRelease(Namespace)) {
    sub_100105148(&v8, v9);
  }
  return v6;
}

- (BOOL)isAvailable
{
  if (self->_nodeDescriptor != -1) {
    return 1;
  }
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty([(DevNodeWriter *)self service], @"BSD Name", kCFAllocatorDefault, 0);
  [(DevNodeWriter *)self _waitForDeviceNode:CFProperty withTimeout:60];
  BOOL v2 = self->_nodeDescriptor != -1;
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  return v2;
}

- (void)_waitForDeviceNode:(id)a3 withTimeout:(unsigned int)a4
{
  uint64_t v6 = [(NSString *)[(DevNodeWriter *)self devicePath] UTF8String];
  iBU_LOG_real(@"Attempting to open dev node at path: %s", "-[DevNodeWriter _waitForDeviceNode:withTimeout:]", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  do
  {
    int v13 = open(v6, 16777217);
    if (v13 != -1) {
      break;
    }
    v14 = __error();
    if (*v14 != 2)
    {
      strerror(*v14);
      iBU_LOG_real(@"open(2) on %s failed with error %d: %s. Not trying agin.", "-[DevNodeWriter _waitForDeviceNode:withTimeout:]", v21, v22, v23, v24, v25, v26, (uint64_t)v6);
      break;
    }
    iBU_LOG_real(@"Dev node %s doesn't yet exist. Waiting to try again...", "-[DevNodeWriter _waitForDeviceNode:withTimeout:]", v15, v16, v17, v18, v19, v20, (uint64_t)v6);
    sleep(1u);
    --a4;
  }
  while (a4);
  self->_nodeDescriptor = v13;
}

- (NSString)devicePath
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty([(DevNodeWriter *)self service], @"BSD Name", kCFAllocatorDefault, 0);
  CFTypeRef v3 = (id)CFMakeCollectable(CFProperty);

  return (NSString *)[@"/dev/" stringByAppendingPathComponent:v3];
}

- (void)dealloc
{
  io_object_t service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_io_object_t service = 0;
  }
  int nodeDescriptor = self->_nodeDescriptor;
  if (nodeDescriptor != -1) {
    close(nodeDescriptor);
  }
  v5.receiver = self;
  v5.super_class = (Class)DevNodeWriter;
  [(DevNodeWriter *)&v5 dealloc];
}

- (BOOL)finished
{
  fsync(self->_nodeDescriptor);
  io_object_t service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_io_object_t service = 0;
  }
  int nodeDescriptor = self->_nodeDescriptor;
  if (nodeDescriptor != -1)
  {
    close(nodeDescriptor);
    self->_int nodeDescriptor = -1;
  }
  return 1;
}

- (void)_setupFileDescriptor
{
  int nodeDescriptor = self->_nodeDescriptor;
  if (nodeDescriptor != -1)
  {
    if (fcntl(nodeDescriptor, 48)) {
      iBU_LOG_real(@"Failed to set F_NOCACHE on descriptor.", "-[DevNodeWriter _setupFileDescriptor]", v4, v5, v6, v7, v8, v9, 1);
    }
    blksize_t v12 = 0;
    memset(&v11, 0, sizeof(v11));
    if (ioctl(self->_nodeDescriptor, 0x40046418uLL, &v12))
    {
      if (fstat(self->_nodeDescriptor, &v11)) {
        blksize_t st_blksize = 0;
      }
      else {
        blksize_t st_blksize = v11.st_blksize;
      }
    }
    else
    {
      blksize_t st_blksize = v12;
    }
    self->_preferredBlockSize = st_blksize;
  }
}

- (int)writeBytes:(const void *)a3 ofLength:(unint64_t)a4 withError:(id *)a5
{
  unsigned int v9 = [(DevNodeWriter *)self nodeDescriptor];
  if (!a4) {
    return 0;
  }
  int v10 = v9;
  while (1)
  {
    ssize_t v11 = write(v10, a3, a4);
    if (v11 == -1) {
      break;
    }
    a3 = (char *)a3 + v11;
    a4 -= v11;
    if (!a4) {
      return 0;
    }
  }
  int v13 = *__error();
  v14 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v13 userInfo:0];
  [(DevNodeWriter *)self devicePath];
  iBU_LOG_real(@"Failed to write %lu bytes to %@", "-[DevNodeWriter writeBytes:ofLength:withError:]", v15, v16, v17, v18, v19, v20, a4);
  if (a5)
  {
    [(DevNodeWriter *)self devicePath];
    *a5 = MSUBootFirmwareError(3, (uint64_t)v14, @"Failed to write %lu bytes to %@", v27, v28, v29, v30, v31, a4);
  }
  iBU_LOG_real(@"There are %lu bytes left to write.", "-[DevNodeWriter writeBytes:ofLength:withError:]", v21, v22, v23, v24, v25, v26, a4);
  return v13 | 0xC000;
}

- (int)writeData:(id)a3 withError:(id *)a4
{
  id v7 = [a3 bytes];
  id v8 = [a3 length];

  return [(DevNodeWriter *)self writeBytes:v7 ofLength:v8 withError:a4];
}

- (unint64_t)numberOfBytesRemainingInBlock
{
  int v3 = [(DevNodeWriter *)self preferredBlockSize];
  if (v3 < 1) {
    return 0;
  }
  unsigned int v4 = v3;
  unint64_t v5 = lseek([(DevNodeWriter *)self nodeDescriptor], 0, 1);
  if ((v5 & 0x8000000000000000) != 0) {
    return 0;
  }
  int v6 = v5 % v4;
  if (v6) {
    return (int)(v4 - v6);
  }
  else {
    return 0;
  }
}

- (int)eraseBytes:(unsigned int)a3 ofLength:(unsigned int)a4
{
  return -536870201;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_io_object_t service = a3;
}

- (int)nodeDescriptor
{
  return self->_nodeDescriptor;
}

- (void)setNodeDescriptor:(int)a3
{
  self->_int nodeDescriptor = a3;
}

- (int)preferredBlockSize
{
  return self->_preferredBlockSize;
}

- (void)setPreferredBlockSize:(int)a3
{
  self->_preferredBlockSize = a3;
}

@end