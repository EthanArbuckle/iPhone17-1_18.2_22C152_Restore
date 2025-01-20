uint64_t start()
{
  NSObject *v0;
  uint64_t v1;
  const void *v2;
  io_registry_entry_t v3;
  io_object_t v4;
  __CFDictionary *CFProperty;
  __CFDictionary *v6;
  CFTypeID TypeID;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  integer_t policy_info[2];

  if (!setiopolicy_np(9, 0, 1))
  {
    v0 = _IOHIDLogCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      sub_100003D1C(v0);
    }
  }
  v1 = IOHIDEventSystemCreate();
  if (!v1)
  {
    v9 = _IOHIDLogCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100003C74(v9, v10, v11, v12, v13, v14, v15, v16);
    }
LABEL_21:
    exit(1);
  }
  v2 = (const void *)v1;
  if (!IOHIDEventSystemOpen())
  {
    v17 = _IOHIDLogCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100003CAC(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_20;
  }
  v3 = IORegistryEntryFromPath(kIOMainPortDefault, "IOService:/IOResources/IOHIDSystem");
  if (v3)
  {
    v4 = v3;
    CFProperty = (__CFDictionary *)IORegistryEntryCreateCFProperty(v3, @"HIDParameters", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      v6 = CFProperty;
      TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(v6))
      {
        CFDictionaryRemoveValue(v6, @"HIDKeyboardModifierMappingPairs");
        IOHIDEventSystemSetProperty();
      }
      CFRelease(v6);
    }
    IOObjectRelease(v4);
  }
  *(void *)policy_info = 0xFE000100FF0001;
  if (task_policy_set(mach_task_self_, 8u, policy_info, 2u))
  {
    v25 = _IOHIDLogCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100003CE4(v25, v26, v27, v28, v29, v30, v31, v32);
    }
LABEL_20:
    CFRelease(v2);
    goto LABEL_21;
  }
  CFRunLoopRun();
  return 0;
}

void sub_100003C58(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100003C74(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003CAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003CE4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003D1C(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "setiopolicy_np returned error: %#x\n", (uint8_t *)v1, 8u);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

uint64_t IOHIDEventSystemCreate()
{
  return _IOHIDEventSystemCreate();
}

uint64_t IOHIDEventSystemOpen()
{
  return _IOHIDEventSystemOpen();
}

uint64_t IOHIDEventSystemSetProperty()
{
  return _IOHIDEventSystemSetProperty();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

uint64_t _IOHIDLogCategory()
{
  return __IOHIDLogCategory();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void exit(int a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return _setiopolicy_np(a1, a2, a3);
}

kern_return_t task_policy_set(task_policy_set_t task, task_policy_flavor_t flavor, task_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return _task_policy_set(task, flavor, policy_info, policy_infoCnt);
}