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
- (id)description;
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
  id v4 = [a3 ioObj];

  return [(SKIOObject *)self initWithIOObject:v4 retain:1];
}

- (SKIOObject)initWithClassName:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = IOServiceMatching((const char *)[v4 UTF8String]);
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  if (MatchingService)
  {
    self = [(SKIOObject *)self initWithIOObject:MatchingService];
    v7 = self;
  }
  else
  {
    v8 = sub_10000DD48();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Cannot find IO object of class %@", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (SKIOObject)initWithIteratorNext:(id)a3
{
  id v4 = [a3 copyNextObject];

  return [(SKIOObject *)self initWithIOObject:v4];
}

- (id)newIteratorWithOptions:(unsigned int)a3
{
  kern_return_t v3;
  kern_return_t v4;
  NSObject *v5;
  SKIOIterator *v7;
  io_iterator_t iterator;
  uint8_t buf[4];
  kern_return_t v10;

  iterator = 0;
  v3 = IORegistryEntryCreateIterator([(SKIOObject *)self ioObj], "IOService", a3, &iterator);
  if (v3)
  {
    id v4 = v3;
    CFDictionaryRef v5 = sub_10000DD48();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed creating IO iterator, err code %d", buf, 8u);
    }

    return 0;
  }
  else
  {
    v7 = [SKIOIterator alloc];
    return [(SKIOObject *)v7 initWithIOObject:iterator retain:0];
  }
}

- (NSString)ioClassName
{
  v2 = (__CFString *)IOObjectCopyClass([(SKIOObject *)self ioObj]);

  return (NSString *)v2;
}

- (id)description
{
  return [(SKIOObject *)self ioClassName];
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
  id v6 = a3;
  v7 = (const char *)[v6 UTF8String];
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
      id v11 = [[SKIOObject alloc] initWithIteratorNext:v9];

      if (!v11) {
        break;
      }
      int v10 = v11;
      if (IOObjectConformsTo([(SKIOObject *)v11 ioObj], v7)) {
        goto LABEL_13;
      }
    }
    v12 = sub_10000DD48();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Cannot find %@ entry", (uint8_t *)&v14, 0xCu);
    }
  }
  id v11 = 0;
LABEL_13:

  return v11;
}

- (id)copyPropertyWithClass:(Class)a3 key:(id)a4
{
  CFDictionaryRef v5 = (__CFString *)a4;
  CFProperty = (void *)IORegistryEntryCreateCFProperty([(SKIOObject *)self ioObj], v5, kCFAllocatorDefault, 0);

  if (CFProperty && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = CFProperty;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)copyParentPropertyWithClass:(Class)a3 key:(id)a4
{
  CFDictionaryRef v5 = (__CFString *)a4;
  id v6 = (void *)IORegistryEntrySearchCFProperty([(SKIOObject *)self ioObj], "IOService", v5, kCFAllocatorDefault, 3u);

  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)copyProperties
{
  CFMutableDictionaryRef properties = 0;
  IORegistryEntryCreateCFProperties([(SKIOObject *)self ioObj], &properties, kCFAllocatorDefault, 0);
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

  parent = 0;
  ParentEntry = IORegistryEntryGetParentEntry([(SKIOObject *)self ioObj], "IOService", &parent);
  if (ParentEntry)
  {
    v3 = ParentEntry;
    BOOL v4 = sub_10000DD48();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to get parent registry entry, err code %d", buf, 8u);
    }

    return 0;
  }
  else
  {
    id v6 = [SKIOObject alloc];
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