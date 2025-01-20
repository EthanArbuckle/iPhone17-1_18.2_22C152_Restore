@interface SKIOObject
- (NSString)ioClassName;
- (SKIOObject)initWithClassName:(id)a3;
- (SKIOObject)initWithIOObject:(unsigned int)a3;
- (SKIOObject)initWithIOObject:(unsigned int)a3 retain:(BOOL)a4;
- (SKIOObject)initWithIteratorNext:(id)a3;
- (SKIOObject)initWithSKIOObject:(id)a3;
- (SKIOObject)ioObjectWithClassName:(id)a3 iterateParents:(BOOL)a4;
- (id)copyParent;
- (id)copyParentPropertyWithClass:(Class)a3 key:(id)a4;
- (id)copyProperties;
- (id)copyPropertyWithClass:(Class)a3 key:(id)a4;
- (id)newIteratorWithOptions:(unsigned int)a3;
- (unsigned)ioObj;
- (void)dealloc;
- (void)waitIOKitQuiet;
@end

@implementation SKIOObject

- (SKIOObject)initWithIOObject:(unsigned int)a3 retain:(BOOL)a4
{
  if (a3)
  {
    if (a4) {
      IOObjectRetain(a3);
    }
    v10.receiver = self;
    v10.super_class = (Class)SKIOObject;
    v6 = [(SKIOObject *)&v10 init];
    v7 = v6;
    if (v6) {
      v6->_ioObj = a3;
    }
    else {
      IOObjectRelease(a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SKIOObject)initWithIOObject:(unsigned int)a3
{
  return [(SKIOObject *)self initWithIOObject:*(void *)&a3 retain:0];
}

- (SKIOObject)initWithSKIOObject:(id)a3
{
  uint64_t v4 = [a3 ioObj];

  return [(SKIOObject *)self initWithIOObject:v4 retain:1];
}

- (SKIOObject)initWithClassName:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  mach_port_t v5 = *MEMORY[0x263F0EC88];
  id v6 = v4;
  CFDictionaryRef v7 = IOServiceMatching((const char *)[v6 UTF8String]);
  uint64_t MatchingService = IOServiceGetMatchingService(v5, v7);
  if (MatchingService)
  {
    self = [(SKIOObject *)self initWithIOObject:MatchingService];
    v9 = self;
  }
  else
  {
    objc_super v10 = SKGetOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_23F40C000, v10, OS_LOG_TYPE_ERROR, "Cannot find IO object of class %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (SKIOObject)initWithIteratorNext:(id)a3
{
  uint64_t v4 = [a3 copyNextObject];

  return [(SKIOObject *)self initWithIOObject:v4];
}

- (id)newIteratorWithOptions:(unsigned int)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unsigned int v8 = 0;
  int v3 = MEMORY[0x2455CAA20]([(SKIOObject *)self ioObj], "IOService", *(void *)&a3, &v8);
  if (v3)
  {
    int v4 = v3;
    mach_port_t v5 = SKGetOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v10 = v4;
      _os_log_impl(&dword_23F40C000, v5, OS_LOG_TYPE_ERROR, "Failed creating IO iterator, err code %d", buf, 8u);
    }

    return 0;
  }
  else
  {
    CFDictionaryRef v7 = [SKIOIterator alloc];
    return [(SKIOObject *)v7 initWithIOObject:v8 retain:0];
  }
}

- (NSString)ioClassName
{
  v2 = (__CFString *)IOObjectCopyClass([(SKIOObject *)self ioObj]);

  return (NSString *)v2;
}

- (void)dealloc
{
  io_object_t ioObj = self->_ioObj;
  if (ioObj) {
    IOObjectRelease(ioObj);
  }
  v4.receiver = self;
  v4.super_class = (Class)SKIOObject;
  [(SKIOObject *)&v4 dealloc];
}

- (SKIOObject)ioObjectWithClassName:(id)a3 iterateParents:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  CFDictionaryRef v7 = (const char *)[v6 UTF8String];
  if (v4) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 1;
  }
  id v9 = [(SKIOObject *)self newIteratorWithOptions:v8];
  if (v9)
  {
    int v10 = 0;
    while (1)
    {
      uint64_t v11 = [[SKIOObject alloc] initWithIteratorNext:v9];

      if (!v11) {
        break;
      }
      int v10 = v11;
      if (IOObjectConformsTo([(SKIOObject *)v11 ioObj], v7)) {
        goto LABEL_13;
      }
    }
    int v12 = SKGetOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_23F40C000, v12, OS_LOG_TYPE_ERROR, "Cannot find %@ entry", (uint8_t *)&v14, 0xCu);
    }
  }
  uint64_t v11 = 0;
LABEL_13:

  return v11;
}

- (id)copyPropertyWithClass:(Class)a3 key:(id)a4
{
  mach_port_t v5 = (__CFString *)a4;
  io_registry_entry_t v6 = [(SKIOObject *)self ioObj];
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v6, v5, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);

  if (CFProperty && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = CFProperty;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)copyParentPropertyWithClass:(Class)a3 key:(id)a4
{
  mach_port_t v5 = (__CFString *)a4;
  io_registry_entry_t v6 = [(SKIOObject *)self ioObj];
  CFDictionaryRef v7 = (void *)IORegistryEntrySearchCFProperty(v6, "IOService", v5, (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);

  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)copyProperties
{
  CFMutableDictionaryRef properties = 0;
  io_registry_entry_t v2 = [(SKIOObject *)self ioObj];
  IORegistryEntryCreateCFProperties(v2, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  return properties;
}

- (id)copyParent
{
  kern_return_t ParentEntry;
  kern_return_t v3;
  NSObject *v4;
  SKIOObject *v6;
  io_registry_entry_t parent;
  uint8_t buf[4];
  kern_return_t v9;
  uint64_t v10;

  int v10 = *MEMORY[0x263EF8340];
  parent = 0;
  ParentEntry = IORegistryEntryGetParentEntry([(SKIOObject *)self ioObj], "IOService", &parent);
  if (ParentEntry)
  {
    int v3 = ParentEntry;
    BOOL v4 = SKGetOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      id v9 = v3;
      _os_log_impl(&dword_23F40C000, v4, OS_LOG_TYPE_ERROR, "Failed to get parent registry entry, err code %d", buf, 8u);
    }

    return 0;
  }
  else
  {
    io_registry_entry_t v6 = [SKIOObject alloc];
    return [(SKIOObject *)v6 initWithIOObject:parent];
  }
}

- (void)waitIOKitQuiet
{
  mach_timespec_t waitTime = (mach_timespec_t)5;
  IOServiceWaitQuiet([(SKIOObject *)self ioObj], &waitTime);
}

- (unsigned)ioObj
{
  return self->_ioObj;
}

@end