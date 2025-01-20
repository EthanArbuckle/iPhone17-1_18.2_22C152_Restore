uint64_t sub_1000010AC(int a1, char *const *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *m;
  void *v31;
  void *v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  id v37;
  id v38;
  const char *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *n;
  void *v45;
  void *v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  void *v50;
  uint64_t v51;
  int *v52;
  int v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  void *j;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  void *k;
  void *v64;
  id v65;
  void *v67;
  id v68;
  long long v69;
  long long v70;
  long long v71;
  long long v72;
  long long v73;
  long long v74;
  long long v75;
  long long v76;
  long long v77;
  long long v78;
  long long v79;
  long long v80;
  long long v81;
  long long v82;
  long long v83;
  long long v84;
  long long v85;
  long long v86;
  long long v87;
  long long v88;
  unsigned char v89[128];
  unsigned char v90[128];
  int v91[16];
  unsigned char v92[128];
  unsigned char v93[128];
  unsigned char v94[128];

  v5 = a3;
  v6 = malloc_type_malloc(0x40uLL, 0x78C5A1BAuLL);
  if (!v6)
  {
    v25 = 3758097085;
    goto LABEL_76;
  }
  v7 = v6;
  v8 = 0;
  while (2)
  {
    v91[0] = 0;
    v9 = getopt_long(a1, a2, "VUPS", (const option *)&off_100021750, v91);
    switch(v9)
    {
      case 'P':
        v8 = 3;
        continue;
      case 'Q':
      case 'R':
      case 'T':
        goto LABEL_77;
      case 'S':
        v8 = 4;
        continue;
      case 'U':
        v8 = 2;
        continue;
      case 'V':
        v8 = 1;
        continue;
      default:
        if (!v9) {
          continue;
        }
        if (v9 != -1) {
LABEL_77:
        }
          exit(1);
        switch(v8)
        {
          case 1:
            v67 = v7;
            v68 = v5;
            v87 = 0u;
            v88 = 0u;
            v85 = 0u;
            v86 = 0u;
            v10 = v5;
            v11 = [v10 countByEnumeratingWithState:&v85 objects:v94 count:16];
            if (v11)
            {
              v12 = v11;
              v13 = *(void *)v86;
              do
              {
                for (i = 0; i != v12; i = (char *)i + 1)
                {
                  if (*(void *)v86 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  v15 = *(void **)(*((void *)&v85 + 1) + 8 * i);
                  v16 = [v15 userClient];
                  v17 = [v16 routeString];

                  if (!v17)
                  {
                    v18 = [v15 address];
                    v19 = [v15 userClient];
                    v20 = [v19 routerID];
                    v21 = [v15 address];
                    v22 = [v15 readFullVersionWithConfig];
                    v23 = [v22 UTF8String];
                    v24 = "R/D %d/0x%x = %s\n";
                    if (v18 < 0xA) {
                      v24 = "R/D %d/%d = %s\n";
                    }
                    printf(v24, v20, v21, v23);
                  }
                }
                v12 = [v10 countByEnumeratingWithState:&v85 objects:v94 count:16];
              }
              while (v12);
            }

            goto LABEL_54;
          case 2:
            v67 = v7;
            v68 = v5;
            v83 = 0u;
            v84 = 0u;
            v81 = 0u;
            v82 = 0u;
            v26 = v5;
            v27 = [v26 countByEnumeratingWithState:&v81 objects:v93 count:16];
            if (!v27) {
              goto LABEL_39;
            }
            v28 = v27;
            v29 = *(void *)v82;
            break;
          case 3:
            v75 = 0u;
            v76 = 0u;
            v73 = 0u;
            v74 = 0u;
            v54 = v5;
            v55 = [v54 countByEnumeratingWithState:&v73 objects:v90 count:16];
            if (!v55) {
              goto LABEL_73;
            }
            v56 = v55;
            v57 = *(void *)v74;
            do
            {
              for (j = 0; j != v56; j = (char *)j + 1)
              {
                if (*(void *)v74 != v57) {
                  objc_enumerationMutation(v54);
                }
                v59 = *(void **)(*((void *)&v73 + 1) + 8 * (void)j);
                putchar(10);
                v25 = (uint64_t)[v59 printAll];
                if (!v25) {
                  v25 = (uint64_t)[v59 printStateHistory];
                }
              }
              v56 = [v54 countByEnumeratingWithState:&v73 objects:v90 count:16];
            }
            while (v56);
            goto LABEL_74;
          case 4:
            v71 = 0u;
            v72 = 0u;
            v69 = 0u;
            v70 = 0u;
            v54 = v5;
            v60 = [v54 countByEnumeratingWithState:&v69 objects:v89 count:16];
            if (v60)
            {
              v61 = v60;
              v62 = *(void *)v70;
              do
              {
                for (k = 0; k != v61; k = (char *)k + 1)
                {
                  if (*(void *)v70 != v62) {
                    objc_enumerationMutation(v54);
                  }
                  v64 = *(void **)(*((void *)&v69 + 1) + 8 * (void)k);
                  putchar(10);
                  v65 = [v64 printAll];
                }
                v25 = (uint64_t)v65;
                v61 = [v54 countByEnumeratingWithState:&v69 objects:v89 count:16];
              }
              while (v61);
            }
            else
            {
LABEL_73:
              v25 = 0;
            }
LABEL_74:

            goto LABEL_75;
          default:
            v25 = 0;
            goto LABEL_75;
        }
        break;
    }
    break;
  }
  do
  {
    for (m = 0; m != v28; m = (char *)m + 1)
    {
      if (*(void *)v82 != v29) {
        objc_enumerationMutation(v26);
      }
      v31 = *(void **)(*((void *)&v81 + 1) + 8 * (void)m);
      v32 = [v31 userClient];
      if (![v32 routeString])
      {
        v33 = [v31 isSPIMaster];

        if (!v33) {
          continue;
        }
        v34 = [v31 address];
        v32 = [v31 userClient];
        v35 = [v32 routerID];
        v36 = [v31 address];
        v37 = [v31 readFullVersionWithConfig];
        v38 = [v37 UTF8String];
        v39 = "R/D %d/0x%x = %s\n";
        if (v34 < 0xA) {
          v39 = "R/D %d/%d = %s\n";
        }
        printf(v39, v35, v36, v38);
      }
    }
    v28 = [v26 countByEnumeratingWithState:&v81 objects:v93 count:16];
  }
  while (v28);
LABEL_39:

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v40 = v26;
  v41 = [v40 countByEnumeratingWithState:&v77 objects:v92 count:16];
  if (v41)
  {
    v42 = v41;
    v43 = *(void *)v78;
    do
    {
      for (n = 0; n != v42; n = (char *)n + 1)
      {
        if (*(void *)v78 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = *(void **)(*((void *)&v77 + 1) + 8 * (void)n);
        v46 = [v45 userClient];
        if ([v46 routeString])
        {
        }
        else
        {
          v47 = [v45 isSPIMaster];

          if (v47)
          {
            v48 = [v45 readUUIDIntoBuffer:v91 ofLength:64];
            if (v48)
            {
              v49 = v48;
              v50 = [v45 userClient];
              printf("UUID%d=", [v50 routerID]);

              v51 = v49;
              v52 = v91;
              do
              {
                v53 = *(unsigned __int8 *)v52;
                v52 = (int *)((char *)v52 + 1);
                printf("%02x", v53);
                --v51;
              }
              while (v51);
              putchar(32);
            }
          }
        }
      }
      v42 = [v40 countByEnumeratingWithState:&v77 objects:v92 count:16];
    }
    while (v42);
  }

  putchar(10);
LABEL_54:
  v25 = 0;
  v7 = v67;
  v5 = v68;
LABEL_75:
  free(v7);
LABEL_76:

  return v25;
}

uint64_t start(int a1, char *const *a2)
{
  v5 = +[PDController knownPDControllers:-1];
  if ([v5 count])
  {
    v6 = [v5 objectAtIndexedSubscript:0];
    [v6 address];
  }
  if (a1 < 2)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v11);
          putchar(10);
          [v12 printAll:v14];
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    sub_1000010AC(a1, a2, v5);
  }

  return 0;
}

id sub_100005380(uint64_t a1, unsigned __int16 *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained decodeGeneralPolicyConfigWithData:*a2];

  return v4;
}

NSString *__cdecl sub_1000053D4(id a1, NSArray *a2)
{
  v2 = a2;
  v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  unsigned int v4 = [v3 unsignedShortValue];

  v5 = [(NSArray *)v2 objectAtIndexedSubscript:1];

  LODWORD(v2) = [v5 unsignedCharValue];
  return +[NSString stringWithFormat:@"%0.3f %@", (float)((float)((float)v4 * (float)v2) * 1500.0) / 1000.0 / 4095.0, @"V"];
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

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

int bcmp(const void *a1, const void *a2, size_t a3)
{
  return _bcmp(a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_burstLimit(void *a1, const char *a2, ...)
{
  return [a1 burstLimit];
}

id objc_msgSend_commandMap(void *a1, const char *a2, ...)
{
  return [a1 commandMap];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_destroyUserClient(void *a1, const char *a2, ...)
{
  return [a1 destroyUserClient];
}

id objc_msgSend_did(void *a1, const char *a2, ...)
{
  return [a1 did];
}

id objc_msgSend_dpmrConfigs(void *a1, const char *a2, ...)
{
  return [a1 dpmrConfigs];
}

id objc_msgSend_expanderGpioMap(void *a1, const char *a2, ...)
{
  return [a1 expanderGpioMap];
}

id objc_msgSend_findUserClients(void *a1, const char *a2, ...)
{
  return [a1 findUserClients];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_gpioMap(void *a1, const char *a2, ...)
{
  return [a1 gpioMap];
}

id objc_msgSend_isSPIMaster(void *a1, const char *a2, ...)
{
  return [a1 isSPIMaster];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_majorVersionNumber(void *a1, const char *a2, ...)
{
  return [a1 majorVersionNumber];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_printAll(void *a1, const char *a2, ...)
{
  return [a1 printAll];
}

id objc_msgSend_printAllDPMrSubcommands(void *a1, const char *a2, ...)
{
  return [a1 printAllDPMrSubcommands];
}

id objc_msgSend_printCCRole(void *a1, const char *a2, ...)
{
  return [a1 printCCRole];
}

id objc_msgSend_printCCState(void *a1, const char *a2, ...)
{
  return [a1 printCCState];
}

id objc_msgSend_printDXState(void *a1, const char *a2, ...)
{
  return [a1 printDXState];
}

id objc_msgSend_printExpanderGPIOState(void *a1, const char *a2, ...)
{
  return [a1 printExpanderGPIOState];
}

id objc_msgSend_printGPIOState(void *a1, const char *a2, ...)
{
  return [a1 printGPIOState];
}

id objc_msgSend_printIECSPDControllerType1SpecificInfo(void *a1, const char *a2, ...)
{
  return [a1 printIECSPDControllerType1SpecificInfo];
}

id objc_msgSend_printIECSPDControllerType3SpecificInfo(void *a1, const char *a2, ...)
{
  return [a1 printIECSPDControllerType3SpecificInfo];
}

id objc_msgSend_printIECSStandardInfo(void *a1, const char *a2, ...)
{
  return [a1 printIECSStandardInfo];
}

id objc_msgSend_printInfo(void *a1, const char *a2, ...)
{
  return [a1 printInfo];
}

id objc_msgSend_printROMInfo(void *a1, const char *a2, ...)
{
  return [a1 printROMInfo];
}

id objc_msgSend_printSSState(void *a1, const char *a2, ...)
{
  return [a1 printSSState];
}

id objc_msgSend_printStateHistory(void *a1, const char *a2, ...)
{
  return [a1 printStateHistory];
}

id objc_msgSend_printTBRrIfIntelRetimerPresent(void *a1, const char *a2, ...)
{
  return [a1 printTBRrIfIntelRetimerPresent];
}

id objc_msgSend_printTitle(void *a1, const char *a2, ...)
{
  return [a1 printTitle];
}

id objc_msgSend_printUSBCInfo(void *a1, const char *a2, ...)
{
  return [a1 printUSBCInfo];
}

id objc_msgSend_printVBUSState(void *a1, const char *a2, ...)
{
  return [a1 printVBUSState];
}

id objc_msgSend_printVCONNState(void *a1, const char *a2, ...)
{
  return [a1 printVCONNState];
}

id objc_msgSend_printVDETState(void *a1, const char *a2, ...)
{
  return [a1 printVDETState];
}

id objc_msgSend_readFullVersion(void *a1, const char *a2, ...)
{
  return [a1 readFullVersion];
}

id objc_msgSend_readFullVersionWithConfig(void *a1, const char *a2, ...)
{
  return [a1 readFullVersionWithConfig];
}

id objc_msgSend_registerConfigs(void *a1, const char *a2, ...)
{
  return [a1 registerConfigs];
}

id objc_msgSend_registerMap(void *a1, const char *a2, ...)
{
  return [a1 registerMap];
}

id objc_msgSend_remote(void *a1, const char *a2, ...)
{
  return [a1 remote];
}

id objc_msgSend_routeString(void *a1, const char *a2, ...)
{
  return [a1 routeString];
}

id objc_msgSend_routerID(void *a1, const char *a2, ...)
{
  return [a1 routerID];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_setDPMrConfigs(void *a1, const char *a2, ...)
{
  return [a1 setDPMrConfigs];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_supportsRemote(void *a1, const char *a2, ...)
{
  return [a1 supportsRemote];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_userClient(void *a1, const char *a2, ...)
{
  return [a1 userClient];
}

id objc_msgSend_userClientSet(void *a1, const char *a2, ...)
{
  return [a1 userClientSet];
}

id objc_msgSend_vid(void *a1, const char *a2, ...)
{
  return [a1 vid];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_writeIECSRegister_ofLength_atRegister_(void *a1, const char *a2, ...)
{
  return [a1 writeIECSRegister:x0 ofLength:x1 atRegister:x2];
}