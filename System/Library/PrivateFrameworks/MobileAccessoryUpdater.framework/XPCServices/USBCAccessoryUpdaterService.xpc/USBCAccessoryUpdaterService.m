void sub_1000060FC(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t vars8;

  v5 = a2;
  v3 = [*(id *)(*(void *)(a1 + 32) + 112) asset];

  v4 = *(void *)(a1 + 48);
  if (v4)
  {
    (*(void (**)(uint64_t, BOOL, void, void, id))(v4 + 16))(v4, v3 != 0, [*(id *)(*(void *)(a1 + 32) + 112) assetDownloaded] ^ 1, 0, v5);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

intptr_t sub_100006390(uint64_t a1, uint64_t a2)
{
  intptr_t result = *(void *)(a1 + 40);
  if (result)
  {
    (*(void (**)(intptr_t, void, uint64_t))(result + 16))(result, 0, a2);
    v4 = *(NSObject **)(a1 + 32);
    return dispatch_semaphore_signal(v4);
  }
  return result;
}

void sub_100007ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Block_object_dispose((const void *)(v31 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007F18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007F28(uint64_t a1)
{
}

void sub_100007F30(void *a1, char a2, char a3, int a4, id obj)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
}

void sub_100007F5C(uint64_t a1, char a2, int a3, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

id sub_100007F7C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "progress:");
}

id sub_1000080C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) didDownload:1 info:*(void *)(*(void *)(a1 + 32) + 48) error:a3];
}

id sub_1000080D8(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "progress:");
}

void sub_100008208(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v5) {
    CFStringRef v6 = @"NOT successful";
  }
  else {
    CFStringRef v6 = @"successful";
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "log:format:", 7, @"%s - success = %u", "-[USBCAccessoryFirmwareUpdater prepareFirmwareWithOptions:]_block_invoke", v5 == 0);
  v7 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:@"Hardware Device Class"];
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 8);
  v10 = [*(id *)(v8 + 16) DeviceSerialNumber];
  [v9 log:6, @"%@ %@ firmware prepare was %@", v7, v10, v6 format];

  if (v5 || ([*(id *)(*(void *)(a1 + 32) + 16) updaterOperational] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) log:7, @"%s - returned error: %@", "-[USBCAccessoryFirmwareUpdater prepareFirmwareWithOptions:]_block_invoke", v5 format];
    [*(id *)(a1 + 32) attemptErrorRecovery:v5 delegate:*(void *)(*(void *)(a1 + 32) + 8)];
  }
  [*(id *)(*(void *)(a1 + 32) + 8) didPrepare:v5 == 0 info:v11 error:v5];
}

id sub_100008364(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "progress:");
}

void sub_100008494(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v5) {
    CFStringRef v6 = @"FAILED to apply";
  }
  else {
    CFStringRef v6 = @"successfully updated";
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "log:format:", 7, @"%s - success = %u", "-[USBCAccessoryFirmwareUpdater applyFirmwareWithOptions:]_block_invoke", v5 == 0);
  v7 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:@"Hardware Device Class"];
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 8);
  v10 = [*(id *)(v8 + 16) DeviceSerialNumber];
  [v9 log:6, @"%@ %@ firmware %@", v7, v10, v6 format];

  if (v5 || ([*(id *)(*(void *)(a1 + 32) + 16) updaterOperational] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) log:7, @"%s - returned error: %@", "-[USBCAccessoryFirmwareUpdater applyFirmwareWithOptions:]_block_invoke", v5 format];
    [*(id *)(a1 + 32) attemptErrorRecovery:v5 delegate:*(void *)(*(void *)(a1 + 32) + 8)];
  }
  [*(id *)(*(void *)(a1 + 32) + 8) didApply:v5 == 0 info:v11 error:v5];
}

id sub_1000085F0(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "progress:");
}

void sub_100008720(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (v5) {
    CFStringRef v6 = @"FAILED to finish";
  }
  else {
    CFStringRef v6 = @"finished successfully";
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "log:format:", 7, @"%s - success = %u", "-[USBCAccessoryFirmwareUpdater finishWithOptions:]_block_invoke", v5 == 0);
  v7 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:@"Hardware Device Class"];
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 8);
  v10 = [*(id *)(v8 + 16) DeviceSerialNumber];
  [v9 log:1, @"%@ %@ firmware %@", v7, v10, v6 format];

  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(v11 + 8);
  v13 = [*(id *)(v11 + 16) DeviceSerialNumber];
  v14 = [v15 description];
  [v12 log:1, @"%@ %@ **** returned dict: %@", v7, v13, v14 format];

  if (v5 || ([*(id *)(*(void *)(a1 + 32) + 16) updaterOperational] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) log:7, @"%s - returned error: %@", "-[USBCAccessoryFirmwareUpdater finishWithOptions:]_block_invoke", v5 format];
    [*(id *)(a1 + 32) attemptErrorRecovery:v5 delegate:*(void *)(*(void *)(a1 + 32) + 8)];
  }
  [*(id *)(*(void *)(a1 + 32) + 8) didFinish:v5 == 0 info:v15 error:v5];
}

id sub_1000088C4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "progress:");
}

void sub_10000CB2C(uint64_t a1, uint64_t a2)
{
  NSLog(@"Got the download meta data reply: %ld", a2);
  v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[2];
  if (a2)
  {
    id v8 = [v5 results];
    [v4 queryComplete:v8 remote:*(unsigned __int8 *)(a1 + 48) status:a2 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v5 returnTypes:0];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000CC48;
    v9[3] = &unk_1000244F0;
    v9[4] = v6;
    char v11 = *(unsigned char *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    [v7 queryMetaData:v9];
  }
}

void sub_10000CC48(uint64_t a1, uint64_t a2)
{
  v4 = *(id **)(a1 + 32);
  id v5 = [v4[2] results];
  [v4 queryComplete:v5 remote:*(unsigned __int8 *)(a1 + 48) status:a2 completion:*(void *)(a1 + 40)];
}

void sub_10000CCBC(uint64_t a1, uint64_t a2)
{
  v4 = *(id **)(a1 + 32);
  id v5 = [v4[2] results];
  [v4 queryComplete:v5 remote:*(unsigned __int8 *)(a1 + 48) status:a2 completion:*(void *)(a1 + 40)];
}

id sub_10000CE84(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) downloadComplete:a2 completion:*(void *)(a1 + 40)];
}

id sub_10000F084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) logv:a2 format:a3 arguments:&a9];
}

void sub_100012030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 152), 8);
  _Block_object_dispose((const void *)(v26 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012064(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100012074(uint64_t a1)
{
}

void sub_10001207C(uint64_t a1, void *a2)
{
  id v14 = a2;
  v3 = [*(id *)(*(void *)(a1 + 32) + 112) asset];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3 != 0;

  LOBYTE(v4) = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if ((_BYTE)v4) {
    unsigned int v4 = [*(id *)(*(void *)(a1 + 32) + 112) assetDownloaded] ^ 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v4;
  id v5 = [*(id *)(a1 + 32) getAccessoryFWStagedInfoForSerialNum:*(void *)(a1 + 40)];
  if (v5)
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 112) fwVersion];

      if (v6)
      {
        uint64_t v7 = [v5 objectForKey:@"StagedFW"];
        uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
        v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;

        id v10 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        if (v10)
        {
          char v11 = [*(id *)(*(void *)(a1 + 32) + 112) fwVersion];
          unsigned int v12 = [v10 isEqualToString:v11];

          if (v12)
          {
            [*(id *)(*(void *)(a1 + 32) + 40) log:7, @"Accessory already has the same version staged, update not required" format];
            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
          }
        }
      }
    }
  }
  uint64_t v13 = *(void *)(a1 + 56);
  if (v13)
  {
    (*(void (**)(uint64_t, void, void, void, id))(v13 + 16))(v13, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), 0, v14);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

intptr_t sub_100012430(uint64_t a1, uint64_t a2)
{
  intptr_t result = *(void *)(a1 + 40);
  if (result)
  {
    (*(void (**)(intptr_t, void, uint64_t))(result + 16))(result, 0, a2);
    unsigned int v4 = *(NSObject **)(a1 + 32);
    return dispatch_semaphore_signal(v4);
  }
  return result;
}

void sub_1000138B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000173A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) logv:a2 format:a3 arguments:&a9];
}

uint64_t sub_100018160(uint64_t a1, void *a2)
{
  v3 = [a2 attributes];
  unsigned int v4 = v3;
  if (!v3) {
    goto LABEL_11;
  }
  id v5 = [v3 objectForKey:@"FirmwareVersionMajor"];
  uint64_t v6 = v5;
  if (!v5)
  {
LABEL_12:
    uint64_t v15 = 0;
    goto LABEL_13;
  }
  id v7 = [v5 unsignedLongLongValue];
  uint64_t v8 = [v4 objectForKey:@"FirmwareVersionMinor"];

  if (!v8)
  {
LABEL_11:
    uint64_t v6 = 0;
    goto LABEL_12;
  }
  id v9 = [v8 unsignedLongLongValue];
  uint64_t v6 = [v4 objectForKey:@"FirmwareVersionRelease"];

  if (!v6) {
    goto LABEL_12;
  }
  id v10 = [v6 unsignedLongLongValue];
  uint64_t v11 = *(void *)(a1 + 32);
  objc_msgSend(*(id *)(v11 + 40), "log:format:", 7, @"Applying Predicate:((majorVersion > %llu) || ((majorVersion == %llu) && ((minorVersion > %llu) || ((minorVersion == %llu) && (releaseVersion > %llu)))))", *(unsigned int *)(v11 + 120), *(unsigned int *)(v11 + 120), *(unsigned int *)(v11 + 124), *(unsigned int *)(v11 + 124), *(unsigned int *)(v11 + 128));
  unsigned int v12 = *(unsigned int **)(a1 + 32);
  unint64_t v13 = v12[30];
  if ((unint64_t)v7 <= v13)
  {
    if (v7 != (id)v13) {
      goto LABEL_12;
    }
    unint64_t v14 = v12[31];
    if ((unint64_t)v9 <= v14 && (v9 != (id)v14 || (unint64_t)v10 <= v12[32])) {
      goto LABEL_12;
    }
  }
  uint64_t v15 = 1;
LABEL_13:

  return v15;
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  if (!buf) {
    return 0;
  }
  unsigned int v3 = -1;
  do
  {
    unsigned int v4 = *(unsigned __int8 *)crc++;
    unsigned int v5 = dword_100023B70[(v3 ^ v4) & 0xF] ^ (v3 >> 4);
    unsigned int v3 = dword_100023B70[v5 & 0xF ^ (v4 >> 4)] ^ (v5 >> 4);
    --buf;
  }
  while (buf);
  return ~v3;
}

id readACEReg(void *a1, uint64_t a2, unsigned int a3, uint64_t a4, void *a5)
{
  uint64_t v7 = 0;
  id result = [a1 registerRead:a4 ofLength:a3 atAddress:a2 andOutReadLength:&v7];
  *a5 = v7;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return +[AUServiceManager startServiceInSandbox];
}

void sub_100019884()
{
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return _IOCreatePlugInInterfaceForService(service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return _IODestroyPlugInInterface(interface);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithName(AssertionType, AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return _IORegistryEntryIDMatching(entryID);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

FILE *__cdecl freopen(const char *a1, const char *a2, FILE *a3)
{
  return _freopen(a1, a2, a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

int system(const char *a1)
{
  return _system(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_DeviceAlternateFirmwareVersion(void *a1, const char *a2, ...)
{
  return [a1 DeviceAlternateFirmwareVersion];
}

id objc_msgSend_DeviceAlternateFirmwareVersionString(void *a1, const char *a2, ...)
{
  return [a1 DeviceAlternateFirmwareVersionString];
}

id objc_msgSend_DeviceFirmwareVersion(void *a1, const char *a2, ...)
{
  return [a1 DeviceFirmwareVersion];
}

id objc_msgSend_DeviceFirmwareVersionString(void *a1, const char *a2, ...)
{
  return [a1 DeviceFirmwareVersionString];
}

id objc_msgSend_DeviceSerialNumber(void *a1, const char *a2, ...)
{
  return [a1 DeviceSerialNumber];
}

id objc_msgSend_EnterUpdateMode(void *a1, const char *a2, ...)
{
  return [a1 EnterUpdateMode];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_VerifyPowerRole(void *a1, const char *a2, ...)
{
  return [a1 VerifyPowerRole];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return [a1 asset];
}

id objc_msgSend_assetDownloaded(void *a1, const char *a2, ...)
{
  return [a1 assetDownloaded];
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return [a1 assetType];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buildFirmwareUpdaterObject(void *a1, const char *a2, ...)
{
  return [a1 buildFirmwareUpdaterObject];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createUSBDevice(void *a1, const char *a2, ...)
{
  return [a1 createUSBDevice];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destroyUserClient(void *a1, const char *a2, ...)
{
  return [a1 destroyUserClient];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_enableFirmwareUpdate(void *a1, const char *a2, ...)
{
  return [a1 enableFirmwareUpdate];
}

id objc_msgSend_filePathURL(void *a1, const char *a2, ...)
{
  return [a1 filePathURL];
}

id objc_msgSend_findUserClients(void *a1, const char *a2, ...)
{
  return [a1 findUserClients];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fwBundleFileName(void *a1, const char *a2, ...)
{
  return [a1 fwBundleFileName];
}

id objc_msgSend_fwVersion(void *a1, const char *a2, ...)
{
  return [a1 fwVersion];
}

id objc_msgSend_getFWAssetInfo(void *a1, const char *a2, ...)
{
  return [a1 getFWAssetInfo];
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalFileUrl];
}

id objc_msgSend_holdSleepAssertion(void *a1, const char *a2, ...)
{
  return [a1 holdSleepAssertion];
}

id objc_msgSend_knownPDControllers(void *a1, const char *a2, ...)
{
  return [a1 knownPDControllers];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localPollForIdle(void *a1, const char *a2, ...)
{
  return [a1 localPollForIdle];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nonUserInitiatedDownloadsAllowed(void *a1, const char *a2, ...)
{
  return [a1 nonUserInitiatedDownloadsAllowed];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pdAccess(void *a1, const char *a2, ...)
{
  return [a1 pdAccess];
}

id objc_msgSend_pdController(void *a1, const char *a2, ...)
{
  return [a1 pdController];
}

id objc_msgSend_queryPredicate(void *a1, const char *a2, ...)
{
  return [a1 queryPredicate];
}

id objc_msgSend_registryEntryID(void *a1, const char *a2, ...)
{
  return [a1 registryEntryID];
}

id objc_msgSend_releaseSleepAssertion(void *a1, const char *a2, ...)
{
  return [a1 releaseSleepAssertion];
}

id objc_msgSend_remotePollForIdle(void *a1, const char *a2, ...)
{
  return [a1 remotePollForIdle];
}

id objc_msgSend_resourcePath(void *a1, const char *a2, ...)
{
  return [a1 resourcePath];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_routeString(void *a1, const char *a2, ...)
{
  return [a1 routeString];
}

id objc_msgSend_routerID(void *a1, const char *a2, ...)
{
  return [a1 routerID];
}

id objc_msgSend_saveAccessoryFWStagedInfo(void *a1, const char *a2, ...)
{
  return [a1 saveAccessoryFWStagedInfo];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_updaterOperational(void *a1, const char *a2, ...)
{
  return [a1 updaterOperational];
}

id objc_msgSend_userClient(void *a1, const char *a2, ...)
{
  return [a1 userClient];
}

id objc_msgSend_userClientSet(void *a1, const char *a2, ...)
{
  return [a1 userClientSet];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_validateThunderboltSwitch(void *a1, const char *a2, ...)
{
  return [a1 validateThunderboltSwitch];
}

id objc_msgSend_validateUSBCBillboard(void *a1, const char *a2, ...)
{
  return [a1 validateUSBCBillboard];
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}