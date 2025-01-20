id MergePersonalityDictionaryFromPathWithName(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id obj;
  id v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  unsigned char v39[128];

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = v9;
  v29 = +[NSFileManager defaultManager];
  [v29 contentsOfDirectoryAtPath:v7 error:0];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  v30 = v11;
  v34 = v11;
  if (v12)
  {
    v13 = v12;
    v14 = *(void *)v36;
    v34 = v11;
    v31 = *(void *)v36;
    do
    {
      v15 = 0;
      v32 = v13;
      do
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = [v7 stringByAppendingPathComponent:*(void *)(*((void *)&v35 + 1) + 8 * (void)v15)];
        v17 = [v16 pathExtension];
        v18 = [v17 isEqualToString:v8];

        if (v18)
        {
          v20 = +[NSDictionary dictionaryWithContentsOfFile:v16];
          v21 = [v20 objectForKey:v10];
          if (v21)
          {
            v22 = (const char *)[v10 UTF8String];
            v23 = v10;
            v24 = v8;
            v25 = v7;
            printf("found %s in %s\n", v22, (const char *)[v16 UTF8String]);
            v26 = recursiveMerge(v34, v21, 3);

            v34 = (id)v26;
            v7 = v25;
            v8 = v24;
            v10 = v23;
            v14 = v31;
            v13 = v32;
          }
        }

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v13);
  }

  v27 = v34;
  return v27;
}

id recursiveMerge(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      v8 = +[NSMutableDictionary dictionaryWithDictionary:v5];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __recursiveMerge_block_invoke;
      v14[3] = &unk_1000042B0;
      id v15 = v5;
      uint64_t v17 = a3;
      id v9 = v8;
      id v16 = v9;
      [v7 enumerateKeysAndObjectsUsingBlock:v14];
      v10 = v16;
      id v11 = v9;

      goto LABEL_7;
    }
    id v12 = v5;
  }
  else
  {
    id v12 = v6;
  }
  id v11 = v12;
LABEL_7:

  return v11;
}

id GetMergePersonalityNameForDriver(io_registry_entry_t a1)
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a1, @"mt-merge-personality", kCFAllocatorDefault, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = CFProperty;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

uint64_t CreateIteratorForDriverOfType(IONotificationPort *a1, CFAbsoluteTime *a2)
{
  io_iterator_t notification = 0;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v5 = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v5, @"HID Bootloadable", kCFBooleanTrue);
  CFDictionarySetValue(Mutable, @"IOPropertyMatch", v5);
  if (a2) {
    *a2 = CFAbsoluteTimeGetCurrent();
  }
  if (!IOServiceAddMatchingNotification(a1, "IOServiceMatched", Mutable, (IOServiceMatchingCallback)DriverAppeared, a2, &notification))return notification; {
  syslog(3, "Failed to create matching iterator\n");
  }
  return 0;
}

void DriverAppeared(double *a1, uint64_t a2)
{
  if (a1) {
    double v3 = CFAbsoluteTimeGetCurrent() - *a1;
  }
  else {
    double v3 = 0.0;
  }
  if (MergePropertiesWithIterator(a2))
  {
    syslog(5, "Found the mt driver after %f seconds. Exiting.\n", v3);
    Main = CFRunLoopGetMain();
    CFRunLoopStop(Main);
  }
}

void MergePropertiesForDriver(void *a1, io_service_t a2, void *a3)
{
  kern_return_t v7;
  long long v8;
  size_t outputStructCnt;
  io_connect_t connect;
  unsigned char __b[516];
  int inputStruct;
  long long v13;
  long long v14;
  long long v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;

  id v5 = a1;
  id v6 = a3;
  if (v5)
  {
    connect = 0;
    if (!IOServiceOpen(a2, mach_task_self_, 0, &connect))
    {
      v7 = IOConnectSetCFProperties(connect, v5);
      if (v7) {
        syslog(3, "Merge properties for %s returned error 0x%08x\n", (const char *)[v6 UTF8String], v7);
      }
      *(void *)&v8 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v43 = v8;
      v44 = v8;
      v41 = v8;
      v42 = v8;
      v39 = v8;
      v40 = v8;
      v37 = v8;
      v38 = v8;
      v35 = v8;
      v36 = v8;
      v33 = v8;
      v34 = v8;
      v31 = v8;
      v32 = v8;
      v29 = v8;
      v30 = v8;
      v28 = v8;
      v27 = v8;
      v26 = v8;
      v25 = v8;
      v24 = v8;
      v23 = v8;
      v22 = v8;
      v21 = v8;
      v20 = v8;
      v19 = v8;
      v18 = v8;
      uint64_t v17 = v8;
      id v16 = v8;
      id v15 = v8;
      v14 = v8;
      v13 = v8;
      memset(__b, 170, sizeof(__b));
      inputStruct = 1;
      outputStructCnt = 516;
      IOConnectCallStructMethod(connect, 4u, &inputStruct, 0x204uLL, __b, &outputStructCnt);
      IOServiceClose(connect);
    }
  }
}

uint64_t MergePropertiesWithIterator(uint64_t result)
{
  if (result)
  {
    io_iterator_t v1 = result;
    io_object_t v2 = IOIteratorNext(result);
    if (v2)
    {
      io_registry_entry_t v3 = v2;
      char v4 = 0;
      do
      {
        id v5 = GetMergePersonalityNameForDriver(v3);
        if (v5)
        {
          id v6 = +[NSDictionary dictionary];
          v7 = MergePersonalityDictionaryFromPathWithName(@"/usr/share/firmware/multitouch/", @"mtprops", v6, v5);

          v8 = MergePersonalityDictionaryFromPathWithName(@"/var/mobile/Library/Application Support/Multitouch/", @"dycal", v7, v5);

          MergePropertiesForDriver(v8, v3, v5);
          char v4 = 1;
        }
        IOObjectRelease(v3);

        io_registry_entry_t v3 = IOIteratorNext(v1);
      }
      while (v3);
    }
    else
    {
      char v4 = 0;
    }
    return v4 & 1;
  }
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  io_registry_entry_t v3 = (CFAbsoluteTime *)malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  IONotificationPortRef v4 = IONotificationPortCreate(0);
  if (v4)
  {
    id v5 = v4;
    id v6 = (void *)os_transaction_create();
    Current = CFRunLoopGetCurrent();
    RunLoopSource = IONotificationPortGetRunLoopSource(v5);
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
    uint64_t IteratorForDriverOfType = CreateIteratorForDriverOfType(v5, v3);
    io_object_t v10 = IteratorForDriverOfType;
    if (MergePropertiesWithIterator(IteratorForDriverOfType))
    {
      syslog(5, "Successfully merged properties. Exiting.\n");
      id v11 = 0;
    }
    else
    {
      id v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      if (v11)
      {
        dispatch_time_t v13 = dispatch_time(0, 60000000000);
        dispatch_source_set_timer(v11, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        dispatch_source_set_event_handler(v11, &__block_literal_global);
        dispatch_resume(v11);
        CFRunLoopRun();
      }
      else
      {
        syslog(3, "Failed to create dispatch timer. Exiting.\n");
      }
    }
    IONotificationPortDestroy(v5);
    if (v10) {
      IOObjectRelease(v10);
    }
    if (v11) {

    }
    if (v3) {
      free(v3);
    }

    return 0;
  }
  else
  {
    free(v3);
    syslog(3, "Failed to create IONotificationPort\n");
    return -1;
  }
}

void __main_block_invoke(id a1)
{
  syslog(3, "Driver did not appear after %d seconds. Exiting.\n", 60);
  Main = CFRunLoopGetMain();

  CFRunLoopStop(Main);
}

void __recursiveMerge_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  id v7 = a3;
  v8 = [*(id *)(a1 + 32) objectForKey:v12];
  if (!v8)
  {
LABEL_6:
    [*(id *)(a1 + 40) setObject:v7 forKey:v12];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = recursiveMerge(v8, v7, *(void *)(a1 + 48));
    [*(id *)(a1 + 40) setObject:v9 forKey:v12];

    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v11 = *(void *)(a1 + 48);
  if (isKindOfClass)
  {
    if ((v11 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ((v11 & 2) != 0)
  {
    [*(id *)(a1 + 40) removeAllObjects];
    *a4 = 1;
  }
LABEL_7:
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectSetCFProperties(io_connect_t connect, CFTypeRef properties)
{
  return _IOConnectSetCFProperties(connect, properties);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

void syslog(int a1, const char *a2, ...)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}