@interface ATSIORegCapture
- (ATSIORegCapture)initWithLogger:(id)a3;
- (__CFArray)_copyPropertiesOfIOService:(const char *)a3;
- (__CFData)_serializeIOMFBAGXServices;
- (id)_fullySerializeService:(unsigned int)a3 planeName:(const char *)a4;
- (id)_removeSetsFromArray:(id)a3;
- (id)_removeSetsFromDict:(id)a3;
- (id)_serializeFullIOKitPlane:(const char *)a3;
- (id)_serializeServicePlaneRecursively:(unsigned int)a3 planeName:(const char *)a4;
- (id)describeChunkWithTag:(unsigned int)a3;
- (void)_mergeIOServicePropertiesIntoDictionary:(__CFDictionary *)a3 name:(const char *)a4;
- (void)addChunksToFile:(ktrace_file *)a3;
@end

@implementation ATSIORegCapture

- (ATSIORegCapture)initWithLogger:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATSIORegCapture;
  v6 = [(ATSIORegCapture *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_logger, a3);
  }

  return v7;
}

- (void)addChunksToFile:(ktrace_file *)a3
{
  v4 = [(ATSIORegCapture *)self _serializeFullIOKitPlane:"IODeviceTree"];
  id v13 = v4;
  if (v4)
  {
    id v5 = v4;
    [v5 bytes];
    [v5 length];
    if (!ktrace_file_append_chunk())
    {
      v6 = __error();
      v7 = +[NSString stringWithFormat:@"Failed to append device plane chunk. Error: %s", strerror(*v6)];
      [(KTProviderLogger *)self->_logger failWithReason:v7];
    }
  }
  else
  {
    [(KTProviderLogger *)self->_logger failWithReason:@"Failed to serialize device plane data"];
  }
  v8 = [(ATSIORegCapture *)self _serializeIOMFBAGXServices];
  objc_super v9 = v8;
  if (v8)
  {
    v10 = v8;
    [(__CFData *)v10 bytes];
    [(__CFData *)v10 length];
    if (!ktrace_file_append_chunk())
    {
      v11 = __error();
      v12 = +[NSString stringWithFormat:@"Failed to append IO Reg chunk. Error: %s", strerror(*v11)];
      [(KTProviderLogger *)self->_logger failWithReason:v12];
    }
  }
  else
  {
    [(KTProviderLogger *)self->_logger failWithReason:@"Failed to serialize IOMFB and AGX metadata"];
  }
}

- (id)describeChunkWithTag:(unsigned int)a3
{
  CFStringRef v3 = @"device tree plane";
  if (a3 != 20991) {
    CFStringRef v3 = 0;
  }
  if (a3 == 32776) {
    return @"libktrace ioreg";
  }
  else {
    return (id)v3;
  }
}

- (id)_removeSetsFromDict:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 mutableCopy];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v18 = v4;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (!v7) {
      goto LABEL_17;
    }
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, v18);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = [v12 allObjects];
          v14 = [(ATSIORegCapture *)self _removeSetsFromArray:v13];
          [v5 setObject:v14 forKeyedSubscript:v11];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v15 = [(ATSIORegCapture *)self _removeSetsFromArray:v12];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_15;
            }
            uint64_t v15 = [(ATSIORegCapture *)self _removeSetsFromDict:v12];
          }
          id v13 = (void *)v15;
          [v5 setObject:v15 forKeyedSubscript:v11];
        }

LABEL_15:
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (!v8)
      {
LABEL_17:

        id v16 = [v5 copy];
        v4 = v18;
        goto LABEL_19;
      }
    }
  }
  id v16 = 0;
LABEL_19:

  return v16;
}

- (id)_removeSetsFromArray:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 mutableCopy];
    if ([v5 count])
    {
      uint64_t v7 = 0;
      while (1)
      {
        id v8 = [v5 objectAtIndexedSubscript:v7];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [(ATSIORegCapture *)self _removeSetsFromArray:v8];
          goto LABEL_10;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [(ATSIORegCapture *)self _removeSetsFromDict:v8];
LABEL_10:
          uint64_t v9 = (void *)v11;
          [v6 setObject:v11 atIndexedSubscript:v7];
LABEL_11:
        }
        if (++v7 >= (unint64_t)[v5 count]) {
          goto LABEL_15;
        }
      }
      uint64_t v9 = [v8 allObjects];
      v10 = [(ATSIORegCapture *)self _removeSetsFromArray:v9];
      [v6 setObject:v10 atIndexedSubscript:v7];

      goto LABEL_11;
    }
  }
  else
  {
    id v6 = 0;
  }
LABEL_15:

  return v6;
}

- (id)_fullySerializeService:(unsigned int)a3 planeName:(const char *)a4
{
  memset(v16, 0, sizeof(v16));
  memset(v15, 0, sizeof(v15));
  memset(v14, 0, sizeof(v14));
  uint64_t entryID = 0;
  id v6 = +[NSMutableDictionary dictionary];
  if (!IORegistryEntryGetNameInPlane(a3, a4, (char *)v16))
  {
    uint64_t v7 = +[NSString stringWithUTF8String:v16];
    [v6 setObject:v7 forKeyedSubscript:@"IORegistryEntryName"];
  }
  if (!IORegistryEntryGetLocationInPlane(a3, a4, (char *)v15))
  {
    id v8 = +[NSString stringWithUTF8String:v15];
    [v6 setObject:v8 forKeyedSubscript:@"IORegistryEntryLocation"];
  }
  if (!IORegistryEntryGetRegistryEntryID(a3, &entryID))
  {
    uint64_t v9 = +[NSNumber numberWithUnsignedLongLong:entryID];
    [v6 setObject:v9 forKeyedSubscript:@"IORegistryEntryID"];
  }
  if (!_IOObjectGetClass(a3, (unsigned char *)&def_704C + 1))
  {
    v10 = +[NSString stringWithUTF8String:v14];
    [v6 setObject:v10 forKeyedSubscript:@"IOObjectClass"];
  }
  CFTypeRef cf = 0;
  IORegistryEntryCreateCFProperties(a3, (CFMutableDictionaryRef *)&cf, kCFAllocatorDefault, 0);
  if (cf)
  {
    [v6 setObject:cf forKeyedSubscript:@"IORegistryEntryProperties"];
    CFRelease(cf);
  }

  return v6;
}

- (id)_serializeServicePlaneRecursively:(unsigned int)a3 planeName:(const char *)a4
{
  uint64_t v5 = *(void *)&a3;
  io_iterator_t iterator = 0;
  if (IORegistryEntryGetChildIterator(a3, a4, &iterator))
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = IOIteratorNext(iterator);
    uint64_t v7 = [(ATSIORegCapture *)self _fullySerializeService:v5 planeName:a4];
    if (v8)
    {
      uint64_t v9 = +[NSMutableArray array];
      do
      {
        uint64_t v11 = [(ATSIORegCapture *)self _serializeServicePlaneRecursively:v8 planeName:a4];
        [v9 addObject:v11];

        uint64_t v12 = IOIteratorNext(iterator);
        IOObjectRelease(v8);
        uint64_t v8 = v12;
      }
      while (v12);
      [v7 setObject:v9 forKeyedSubscript:@"IORegistryEntryChildren"];
    }
    IOObjectRelease(iterator);
  }

  return v7;
}

- (id)_serializeFullIOKitPlane:(const char *)a3
{
  uint64_t RootEntry = IORegistryGetRootEntry(kIOMainPortDefault);
  uint64_t v7 = [(ATSIORegCapture *)self _serializeServicePlaneRecursively:RootEntry planeName:a3];
  if (v7)
  {
    IOObjectRelease(RootEntry);
    uint64_t v8 = +[NSPropertyListSerialization dataWithPropertyList:v7 format:200 options:0 error:0];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (__CFArray)_copyPropertiesOfIOService:(const char *)a3
{
  io_iterator_t existing = 0;
  CFDictionaryRef v5 = IOServiceMatching(a3);
  mach_error_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v5, &existing);
  if (MatchingServices)
  {
    uint64_t v7 = +[NSString stringWithFormat:@"Failed to get service matching %s: %s", a3, mach_error_string(MatchingServices)];
    [(KTProviderLogger *)self->_logger failWithReason:v7];

    uint64_t v8 = 0;
  }
  else
  {
    Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    while (1)
    {
      io_registry_entry_t v10 = IOIteratorNext(existing);
      if (!v10)
      {
        uint64_t v8 = 0;
        goto LABEL_9;
      }
      CFMutableDictionaryRef properties = 0;
      mach_error_t v11 = IORegistryEntryCreateCFProperties(v10, &properties, 0, 0);
      if (v11) {
        break;
      }
      uint64_t v12 = [(ATSIORegCapture *)self _removeSetsFromDict:properties];
      CFArrayAppendValue(Mutable, v12);
      CFRelease(properties);
    }
    v14 = +[NSString stringWithFormat:@"Failed to create properties for service %s: %s", a3, mach_error_string(v11)];
    [(KTProviderLogger *)self->_logger failWithReason:v14];

    uint64_t v8 = Mutable;
  }
  Mutable = 0;
LABEL_9:
  if (existing) {
    IOObjectRelease(existing);
  }
  if (v8) {
    CFRelease(v8);
  }
  return Mutable;
}

- (void)_mergeIOServicePropertiesIntoDictionary:(__CFDictionary *)a3 name:(const char *)a4
{
  id v6 = [(ATSIORegCapture *)self _copyPropertiesOfIOService:a4];
  if (v6)
  {
    uint64_t v7 = v6;
    CFStringRef v8 = CFStringCreateWithCString(0, a4, 0x8000100u);
    CFAutorelease(v8);
    CFDictionarySetValue(a3, v8, v7);
    CFRelease(v7);
  }
}

- (__CFData)_serializeIOMFBAGXServices
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  [(ATSIORegCapture *)self _mergeIOServicePropertiesIntoDictionary:Mutable name:"IOMobileFramebuffer"];
  [(ATSIORegCapture *)self _mergeIOServicePropertiesIntoDictionary:Mutable name:"AGXAccelerator"];
  if (!Mutable) {
    return 0;
  }
  CFErrorRef error = 0;
  id v4 = CFPropertyListCreateData(0, Mutable, kCFPropertyListBinaryFormat_v1_0, 0, &error);
  if (error)
  {
    CFDictionaryRef v5 = +[NSString stringWithFormat:@"Failed to serialize AGX and IOMFB metadata dictionary: %@", error];
    [(KTProviderLogger *)self->_logger failWithReason:v5];
  }
  CFRelease(Mutable);
  return v4;
}

- (void).cxx_destruct
{
}

@end