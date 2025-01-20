BOOL sub_2D50(void *a1, uint64_t a2, __IOHIDServiceClient *a3)
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;

  if (IOHIDEventGetType() != 17) {
    return 0;
  }
  v5 = a1;
  v6 = (void *)IOHIDServiceClientCopyProperty(a3, @"VendorID");
  v7 = (void *)IOHIDServiceClientCopyProperty(a3, @"ProductID");
  v8 = [v6 intValue];
  if (v8 == [v5 vendorId])
  {
    v9 = [v7 intValue];
    v10 = v9 == [v5 productId];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_3A00(uint64_t a1)
{
  v3 = _SCROD_LOG();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = a1;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Device removed: %@", (uint8_t *)&v5, 0xCu);
  }

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"SCROBrailleDriverProtocolUnloadNotification" object:a1 userInfo:0];
}

void sub_3AE8(void *a1, uint64_t a2, uint64_t a3, __IOHIDValue *a4)
{
  id v5 = a1;
  Element = IOHIDValueGetElement(a4);
  uint32_t Usage = IOHIDElementGetUsage(Element);
  uint32_t UsagePage = IOHIDElementGetUsagePage(Element);
  v9 = _SCROD_LOG();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v38 = Usage;
    *(_WORD *)&v38[4] = 1024;
    *(_DWORD *)&v38[6] = UsagePage;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "value callback: %d %d", buf, 0xEu);
  }

  if (*((unsigned char *)v5 + 89) && UsagePage == 65)
  {
    if ((Usage & 0xFFFFFF00) == 0x100)
    {
      uint64_t v10 = ((Usage << 8) - 0x10000) & 0xFFFEFFFF | ((IOHIDValueGetIntegerValue(a4) > 0) << 16);
      goto LABEL_7;
    }
    goto LABEL_22;
  }
  if (!*((unsigned char *)v5 + 89) && UsagePage == 65)
  {
    if (Usage - 513 <= 7)
    {
      int v11 = (Usage << 8) - 131328;
LABEL_19:
      uint64_t v10 = v11 & 0xFFFEFFFF | ((IOHIDValueGetIntegerValue(a4) > 0) << 16) | 2;
LABEL_31:
      objc_msgSend(*((id *)v5 + 10), "lock", (void)v32);
      v13 = (void *)*((void *)v5 + 9);
      v14 = +[NSNumber numberWithUnsignedInt:v10];
      [v13 addObject:v14];

      [*((id *)v5 + 10) unlock];
      goto LABEL_32;
    }
    if (Usage - 521 > 2)
    {
      if ((Usage & 0xFFFFFFFE) == 0x21A)
      {
LABEL_22:
        if (IOHIDValueGetIntegerValue(a4) <= 0) {
          int v12 = 6;
        }
        else {
          int v12 = 65542;
        }
        uint64_t v10 = v12 | (16 * Usage);
        goto LABEL_31;
      }
      if (Usage - 528 <= 0xE) {
        goto LABEL_42;
      }
      if (Usage != 5)
      {
        if (Usage != 256) {
          goto LABEL_32;
        }
        Parent = IOHIDElementGetParent(Element);
        IOHIDElementGetChildren(Parent);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        id v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v33;
          while (2)
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v33 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = *(__IOHIDElement **)(*((void *)&v32 + 1) + 8 * i);
              IOHIDElementCookie Cookie = IOHIDElementGetCookie(v23);
              if (Cookie == IOHIDElementGetCookie(Element))
              {
                unsigned int v31 = (objc_msgSend(v18, "indexOfObject:", v23, (void)v32) << 8) & 0xFFFEFFFF;
                uint64_t v10 = v31 | ((IOHIDValueGetIntegerValue(a4) > 0) << 16);
                goto LABEL_60;
              }
            }
            id v20 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }
        uint64_t v10 = 0;
LABEL_60:

        goto LABEL_7;
      }
      CFIndex IntegerValue = IOHIDValueGetIntegerValue(a4);
      CFIndex v26 = IntegerValue;
      uint64_t v27 = 255;
      if (IntegerValue < 255) {
        uint64_t v27 = IntegerValue;
      }
      *((void *)v5 + 13) = v27 & ~(v27 >> 63);
      v28 = _SCROD_LOG();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = +[NSNumber numberWithLong:v26];
        *(_DWORD *)buf = 138412290;
        *(void *)v38 = v29;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "Number of Braille cells set to %@", buf, 0xCu);
      }
      v30 = +[NSNotificationCenter defaultCenter];
      [v30 postNotificationName:@"SCROBrailleDriverProtocolConfigurationChangeNotification" object:v5 userInfo:0];

      goto LABEL_32;
    }
LABEL_28:
    if (IOHIDValueGetIntegerValue(a4) <= 0) {
      uint64_t v10 = 2050;
    }
    else {
      uint64_t v10 = 67586;
    }
    goto LABEL_31;
  }
  if (UsagePage == 7)
  {
    if (!*((unsigned char *)v5 + 89) || Usage != 44) {
      goto LABEL_32;
    }
    goto LABEL_28;
  }
  if (UsagePage == 9)
  {
    if (*((unsigned char *)v5 + 89) && Usage && Usage <= 8)
    {
      int v11 = (Usage << 8) - 256;
      goto LABEL_19;
    }
    if (*((unsigned char *)v5 + 89)) {
      goto LABEL_32;
    }
    IOHIDElementRef v15 = IOHIDElementGetParent(Element);
    if (v15)
    {
      v16 = v15;
      while (IOHIDElementGetType(v16) != kIOHIDElementTypeCollection
           || IOHIDElementGetUsagePage(v16) != 65
           || IOHIDElementGetUsage(v16) != 6)
      {
        v16 = IOHIDElementGetParent(v16);
        if (!v16) {
          goto LABEL_42;
        }
      }
      uint64_t v10 = (uint64_t)[v5 _eventForScreenReaderControl:a4];
      if (v10) {
        goto LABEL_31;
      }
    }
LABEL_42:
    uint64_t v10 = (uint64_t)[v5 _eventForGenericControl:a4];
LABEL_7:
    if (!v10) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_32:
}

void sub_48B8(id a1)
{
  v1 = +[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", 768, 113);
  [v1 removeIndex:768];
  [v1 removeIndex:784];
  [v1 removeIndex:800];
  [v1 removeIndex:816];
  [v1 removeIndex:832];
  objc_msgSend(v1, "removeIndexesInRange:", 779, 5);
  objc_msgSend(v1, "removeIndexesInRange:", 796, 4);
  objc_msgSend(v1, "removeIndexesInRange:", 808, 8);
  objc_msgSend(v1, "removeIndexesInRange:", 822, 10);
  +[NSMutableArray array];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4A0C;
  v5[3] = &unk_82B8;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v2;
  [v1 enumerateIndexesUsingBlock:v5];
  v3 = (void *)qword_D230;
  qword_D230 = (uint64_t)v2;
  id v4 = v2;
}

void sub_4A0C(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[NSNumber numberWithUnsignedInteger:a2];
  [v2 addObject:v3];
}

id sub_4A6C(uint64_t a1, unint64_t a2, void *a3)
{
  id v4 = a3;
  if ((unint64_t)[v4 count] <= a2)
  {
    id v5 = [(id)qword_D230 mutableCopy];
    [v5 removeObjectsInArray:v4];
    v7 = objc_msgSend(v5, "objectAtIndexedSubscript:", a2 % (unint64_t)objc_msgSend(v5, "count"));
    id v6 = [v7 unsignedIntegerValue];
  }
  else
  {
    id v5 = [v4 objectAtIndexedSubscript:a2];
    id v6 = [v5 unsignedIntegerValue];
  }

  return v6;
}

BOOL sub_52A0(id a1, SCROGenericHIDControlInfo *a2, unint64_t a3, BOOL *a4)
{
  return [(SCROGenericHIDControlInfo *)a2 controlType] == 0;
}

BOOL sub_52C4(id a1, SCROGenericHIDControlInfo *a2, unint64_t a3, BOOL *a4)
{
  return (char *)[(SCROGenericHIDControlInfo *)a2 controlType] == (char *)&dword_0 + 1;
}

BOOL sub_52E8(id a1, SCROGenericHIDControlInfo *a2, unint64_t a3, BOOL *a4)
{
  return (char *)[(SCROGenericHIDControlInfo *)a2 controlType] == (char *)&dword_0 + 2;
}

uint64_t sub_56B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v5 collectionUsage]);
  v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [&off_8C68 indexOfObject:v7] != (id)0x7FFFFFFFFFFFFFFFLL);

  v9 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v6 collectionUsage]);
  uint64_t v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [&off_8C68 indexOfObject:v9] != (id)0x7FFFFFFFFFFFFFFFLL);

  uint64_t v11 = (uint64_t)[v8 compare:v10];
  if (v11) {
    goto LABEL_2;
  }
  unsigned int v13 = [v5 usagePage];
  if (v13 == [v6 usagePage])
  {
    if (objc_msgSend(*(id *)(a1 + 32), "usage:isSameClassAsUsage:forUsagePage:", objc_msgSend(v5, "usage"), objc_msgSend(v6, "usage"), objc_msgSend(v5, "usagePage")))
    {
      v14 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v6 instanceNumber]);
      IOHIDElementRef v15 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v5 instanceNumber]);
      uint64_t v11 = (uint64_t)[v14 compare:v15];

      if (v11) {
        goto LABEL_2;
      }
    }
  }
  if ([v5 controlType] != (char *)&dword_0 + 1)
  {
    if ([v5 controlType] != (char *)&dword_0 + 2)
    {
      if ([v5 controlType])
      {
LABEL_25:
        uint64_t v11 = 0;
        goto LABEL_2;
      }
      unsigned int v23 = [v5 usagePage];
      if (v23 != [v6 usagePage])
      {
        if ([v5 usagePage] == 65)
        {
          uint64_t v11 = 1;
          goto LABEL_2;
        }
        if ([v6 usagePage] == 65)
        {
          uint64_t v11 = -1;
          goto LABEL_2;
        }
      }
      CFIndex v26 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v5 usage]);
      if ([&off_8CB0 indexOfObject:v26] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v27 = +[NSNumber numberWithUnsignedInteger:0];
      }
      else
      {
        v28 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v5 usage]);
        uint64_t v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [&off_8CB0 indexOfObject:v28]);
      }
      v29 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v6 usage]);
      if ([&off_8CB0 indexOfObject:v29] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v30 = +[NSNumber numberWithUnsignedInteger:0];
      }
      else
      {
        unsigned int v31 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v6 usage]);
        v30 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [&off_8CB0 indexOfObject:v31]);
      }
      uint64_t v11 = (uint64_t)[v27 compare:v30];
      if (v11
        || [v5 usagePage] == 9
        && [v6 usagePage] == 9
        && (+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v6 usage]), v32 = objc_claimAutoreleasedReturnValue(), +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "usage")), v33 = objc_claimAutoreleasedReturnValue(), uint64_t v11 = (uint64_t)objc_msgSend(v32, "compare:", v33), v33, v32, v11))
      {

        goto LABEL_2;
      }

      goto LABEL_25;
    }
    id v18 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v5 usage]);
    if ([&off_8C98 indexOfObject:v18] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = +[NSNumber numberWithUnsignedInteger:0];
    }
    else
    {
      v24 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v5 usage]);
      v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [&off_8C98 indexOfObject:v24]);
    }
    id v20 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v6 usage]);
    if ([&off_8C98 indexOfObject:v20] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v6 usage]);
      v22 = &off_8C98;
      goto LABEL_23;
    }
LABEL_21:
    v25 = +[NSNumber numberWithUnsignedInteger:0];
    goto LABEL_24;
  }
  v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v5 usage]);
  if ([&off_8C80 indexOfObject:v16] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = +[NSNumber numberWithUnsignedInteger:0];
  }
  else
  {
    id v19 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v5 usage]);
    v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [&off_8C80 indexOfObject:v19]);
  }
  id v20 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v6 usage]);
  if ([&off_8C80 indexOfObject:v20] == (id)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_21;
  }
  uint64_t v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v6 usage]);
  v22 = &off_8C80;
LABEL_23:
  v25 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v22 indexOfObject:v21]);

LABEL_24:
  uint64_t v11 = (uint64_t)[v17 compare:v25];

  if (!v11) {
    goto LABEL_25;
  }
LABEL_2:

  return v11;
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return _IOHIDDeviceClose(device, options);
}

CFArrayRef IOHIDDeviceCopyMatchingElements(IOHIDDeviceRef device, CFDictionaryRef matching, IOOptionBits options)
{
  return _IOHIDDeviceCopyMatchingElements(device, matching, options);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return _IOHIDDeviceGetProperty(device, key);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return _IOHIDDeviceOpen(device, options);
}

void IOHIDDeviceRegisterInputValueCallback(IOHIDDeviceRef device, IOHIDValueCallback callback, void *context)
{
}

void IOHIDDeviceRegisterRemovalCallback(IOHIDDeviceRef device, IOHIDCallback callback, void *context)
{
}

void IOHIDDeviceScheduleWithRunLoop(IOHIDDeviceRef device, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

IOReturn IOHIDDeviceSetValue(IOHIDDeviceRef device, IOHIDElementRef element, IOHIDValueRef value)
{
  return _IOHIDDeviceSetValue(device, element, value);
}

CFArrayRef IOHIDElementGetChildren(IOHIDElementRef element)
{
  return _IOHIDElementGetChildren(element);
}

IOHIDElementCookie IOHIDElementGetCookie(IOHIDElementRef element)
{
  return _IOHIDElementGetCookie(element);
}

CFIndex IOHIDElementGetLogicalMax(IOHIDElementRef element)
{
  return _IOHIDElementGetLogicalMax(element);
}

CFIndex IOHIDElementGetLogicalMin(IOHIDElementRef element)
{
  return _IOHIDElementGetLogicalMin(element);
}

IOHIDElementRef IOHIDElementGetParent(IOHIDElementRef element)
{
  return _IOHIDElementGetParent(element);
}

uint32_t IOHIDElementGetReportCount(IOHIDElementRef element)
{
  return _IOHIDElementGetReportCount(element);
}

uint32_t IOHIDElementGetReportSize(IOHIDElementRef element)
{
  return _IOHIDElementGetReportSize(element);
}

IOHIDElementType IOHIDElementGetType(IOHIDElementRef element)
{
  return _IOHIDElementGetType(element);
}

uint32_t IOHIDElementGetUsage(IOHIDElementRef element)
{
  return _IOHIDElementGetUsage(element);
}

uint32_t IOHIDElementGetUsagePage(IOHIDElementRef element)
{
  return _IOHIDElementGetUsagePage(element);
}

Boolean IOHIDElementIsArray(IOHIDElementRef element)
{
  return _IOHIDElementIsArray(element);
}

uint64_t IOHIDEventGetType()
{
  return _IOHIDEventGetType();
}

uint64_t IOHIDEventSystemClientCreate()
{
  return _IOHIDEventSystemClientCreate();
}

uint64_t IOHIDEventSystemClientRegisterEventFilterCallbackWithPriority()
{
  return _IOHIDEventSystemClientRegisterEventFilterCallbackWithPriority();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return _IOHIDEventSystemClientScheduleWithRunLoop();
}

uint64_t IOHIDEventSystemClientUnregisterEventFilterCallback()
{
  return _IOHIDEventSystemClientUnregisterEventFilterCallback();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return _IOHIDServiceClientCopyProperty(service, key);
}

IOHIDValueRef IOHIDValueCreateWithBytes(CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, const uint8_t *bytes, CFIndex length)
{
  return _IOHIDValueCreateWithBytes(allocator, element, timeStamp, bytes, length);
}

IOHIDElementRef IOHIDValueGetElement(IOHIDValueRef value)
{
  return _IOHIDValueGetElement(value);
}

CFIndex IOHIDValueGetIntegerValue(IOHIDValueRef value)
{
  return _IOHIDValueGetIntegerValue(value);
}

uint64_t _SCROD_LOG()
{
  return __SCROD_LOG();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__buildRankingTable(void *a1, const char *a2, ...)
{
  return [a1 _buildRankingTable];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_collectionUsage(void *a1, const char *a2, ...)
{
  return [a1 collectionUsage];
}

id objc_msgSend_controlType(void *a1, const char *a2, ...)
{
  return [a1 controlType];
}

id objc_msgSend_cookie(void *a1, const char *a2, ...)
{
  return [a1 cookie];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_finalRank(void *a1, const char *a2, ...)
{
  return [a1 finalRank];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_genericControlRankComparator(void *a1, const char *a2, ...)
{
  return [a1 genericControlRankComparator];
}

id objc_msgSend_getRevelantHIDElementsFromRoot(void *a1, const char *a2, ...)
{
  return [a1 getRevelantHIDElementsFromRoot];
}

id objc_msgSend_hidDevice(void *a1, const char *a2, ...)
{
  return [a1 hidDevice];
}

id objc_msgSend_instanceNumber(void *a1, const char *a2, ...)
{
  return [a1 instanceNumber];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_manufacturerName(void *a1, const char *a2, ...)
{
  return [a1 manufacturerName];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_productId(void *a1, const char *a2, ...)
{
  return [a1 productId];
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return [a1 productName];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return [a1 transport];
}

id objc_msgSend_unloadDriver(void *a1, const char *a2, ...)
{
  return [a1 unloadDriver];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_usage(void *a1, const char *a2, ...)
{
  return [a1 usage];
}

id objc_msgSend_usagePage(void *a1, const char *a2, ...)
{
  return [a1 usagePage];
}

id objc_msgSend_vendorId(void *a1, const char *a2, ...)
{
  return [a1 vendorId];
}