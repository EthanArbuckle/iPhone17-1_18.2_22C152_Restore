void *AHTRestoreCreateDeviceList()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;
  long long v13;
  long long v14;
  long long v15;
  long long v16;
  void v17[4];
  void v18[4];
  unsigned char v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x263EF8340];
  v0 = +[AHTLoader allDevices];
  v1 = objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = v0;
  v2 = [obj countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v2)
  {
    v3 = v2;
    v4 = *(void *)v14;
    do
    {
      v5 = 0;
      do
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v13 + 1) + 8 * v5);
        v17[0] = @"DeviceName";
        v7 = [v6 name];
        v18[0] = v7;
        v17[1] = @"ImageTag";
        v8 = [NSNumber numberWithUnsignedInt:[v6 imageTag]];
        v18[1] = v8;
        v18[2] = MEMORY[0x263EFFA88];
        v17[2] = @"NeedsUpdate";
        v17[3] = @"LoadingGroup";
        v9 = [NSNumber numberWithUnsignedInt:[v6 loadingGroup]];
        v18[3] = v9;
        v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
        [v1 addObject:v10];

        ++v5;
      }
      while (v3 != v5);
      v3 = [obj countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v3);
  }

  return v1;
}

uint64_t AHTRestoreUpdateDevice(uint64_t a1, uint64_t a2, char a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v8 = @"LockChip";
    v9[0] = *MEMORY[0x263EFFB40];
    v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    v5 = 0;
  }
  uint64_t updated = AHTRestoreUpdateDeviceWithOverrides(a1, a2, v5);

  return updated;
}

uint64_t AHTRestoreUpdateDeviceWithOverrides(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2) {
    return 3758097090;
  }
  v5 = (void *)MEMORY[0x263EFFA78];
  if (a3) {
    v5 = a3;
  }
  id v6 = v5;
  v7 = [v6 objectForKeyedSubscript:@"SkipUpdate"];
  char v8 = [v7 isEqual:MEMORY[0x263EFFA88]];

  if (v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    v10 = [v6 objectForKeyedSubscript:@"IgnoreFailures"];
    int v11 = [v10 isEqual:MEMORY[0x263EFFA88]];

    v12 = [NSString stringWithUTF8String:a1];
    v13 = +[AHTLoader withName:v12];

    if (v13)
    {
      v14 = [v6 objectForKeyedSubscript:@"LockChip"];
      uint64_t v15 = MEMORY[0x263EFFA88];
      int v16 = [v14 isEqual:MEMORY[0x263EFFA88]];

      if (v16) {
        uint64_t v17 = 9;
      }
      else {
        uint64_t v17 = 1;
      }
      v18 = [v6 objectForKeyedSubscript:@"AHT_PRE_FDR_CHECKPOINT"];
      int v19 = [v18 isEqual:v15];

      if (v19) {
        uint64_t v20 = v17 | 0x80;
      }
      else {
        uint64_t v20 = v17;
      }
      id v26 = 0;
      int v21 = [v13 loadImage:a2 payloadOnly:0 options:v20 error:&v26];
      id v22 = v26;
      v23 = v22;
      if (v22)
      {
        unsigned int v24 = [v22 code];
      }
      else if (v21)
      {
        unsigned int v24 = 0;
      }
      else
      {
        unsigned int v24 = -536870212;
      }
      if (v11) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = v24;
      }
    }
    else if (v11)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = 3758097088;
    }
  }
  return v9;
}

uint64_t AHTRestoreFailureCleanup(uint64_t a1)
{
  v1 = [NSString stringWithUTF8String:a1];
  v2 = +[AHTLoader withName:v1];

  if (v2)
  {
    id v8 = 0;
    char v3 = [v2 overrideNextLoadOptions:65 error:&v8];
    id v4 = v8;
    v5 = v4;
    if (v3) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = [v4 code];
    }
  }
  else
  {
    uint64_t v6 = 3758097088;
  }

  return v6;
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x270EF4A60](*(void *)&entry, propertyName, property);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}