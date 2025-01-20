@interface AppleHPMManager
+ (id)create;
- (NSMutableDictionary)_analyticsDict;
- (int)_rid;
- (int)collectAllAnalytics;
- (int)getAppLoaded;
- (int)getBootFlags;
- (int)getFWVersion;
- (int)getHealthCheck;
- (int)getMode;
- (int)initialize:(unsigned int)a3 withLogger:(id)a4;
- (void)set_analyticsDict:(id)a3;
- (void)set_rid:(int)a3;
@end

@implementation AppleHPMManager

+ (id)create
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (int)initialize:(unsigned int)a3 withLogger:(id)a4
{
  kern_return_t matched;
  io_service_t v16;
  io_registry_entry_t appleHPMDeviceService;
  CFNumberRef v19;
  CFNumberRef v20;
  int v21;
  uint8_t v23[4];
  int valuePtr;
  BOOLean_t matches;
  io_registry_entry_t child;

  int v6 = -536870212;
  v7 = a4;
  v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  analyticsDict = self->_analyticsDict;
  self->_analyticsDict = v8;

  if (self->_analyticsDict)
  {
    CFDictionaryRef v10 = IOServiceMatching("AppleTCController");
    CFDictionaryRef v11 = IOServiceMatching("AppleHPMDevice");
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a3, @"RID", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      CFNumberRef v13 = CFProperty;
      CFNumberGetValue(CFProperty, kCFNumberIntType, &self->_rid);
      CFRelease(v13);
    }
    child = 0;
    IORegistryEntryGetChildEntry(a3, "IOService", &child);
    io_service_t v14 = child;
    if (child)
    {
      while (1)
      {
        matches = 0;
        matched = IOServiceMatchPropertyTable(v14, v11, &matches);
        v16 = child;
        if (!matched && matches)
        {
          IOObjectRetain(child);
          v16 = child;
          self->appleHPMDeviceService = child;
        }
        if (!IOServiceMatchPropertyTable(v16, v10, &matches) && matches != 0) {
          break;
        }
        IOObjectRelease(child);
        IORegistryEntryGetChildEntry(child, "IOService", &child);
        io_service_t v14 = child;
        if (!child) {
          goto LABEL_14;
        }
      }
      IOObjectRetain(child);
      self->appleHPMInterfaceService = child;
    }
LABEL_14:
    CFRelease(v10);
    CFRelease(v11);
    if (self->appleHPMInterfaceService)
    {
      appleHPMDeviceService = self->appleHPMDeviceService;
      if (appleHPMDeviceService)
      {
        v19 = (const __CFNumber *)IORegistryEntryCreateCFProperty(appleHPMDeviceService, @"Device ID", kCFAllocatorDefault, 0);
        if (v19)
        {
          v20 = v19;
          valuePtr = 0;
          CFNumberGetValue(v19, kCFNumberIntType, &valuePtr);
          CFRelease(v20);
          v21 = 0;
          if ((valuePtr - 33628200) <= 0xFFFFFFFB)
          {
            v21 = -536870201;
            if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v23 = 0;
              _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Not matching on non Type-3 Devices!\n", v23, 2u);
            }
          }
          int v6 = v21;
        }
        else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          sub_100003468();
        }
      }
    }
  }

  return v6;
}

- (int)getFWVersion
{
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(self->appleHPMDeviceService, @"Version", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFNumberRef v4 = CFProperty;
    valuePtr[0] = 0;
    CFNumberGetValue(CFProperty, kCFNumberIntType, valuePtr);
    CFRelease(v4);
    v5 = +[NSMutableString stringWithFormat:@"%x.%x.%x", ((v9 << 16) | (v10 << 24)) >> 20, (((v9 << 16) | (valuePtr[1] << 8)) >> 8) & 0xFFF, valuePtr[0]];
    [(NSMutableDictionary *)self->_analyticsDict setObject:v5 forKeyedSubscript:@"FWVersion"];

    return 0;
  }
  else
  {
    int v6 = -536870212;
    if (os_log_type_enabled((os_log_t)self->logger, OS_LOG_TYPE_ERROR)) {
      sub_10000349C();
    }
  }
  return v6;
}

- (int)getBootFlags
{
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(self->appleHPMInterfaceService, @"Boot Flags", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFDataRef v4 = CFProperty;
    BytePtr = CFDataGetBytePtr(CFProperty);
    if (BytePtr)
    {
      int v6 = BytePtr;
      v7 = +[NSNumber numberWithUnsignedChar:BytePtr[1] >> 3];
      [(NSMutableDictionary *)self->_analyticsDict setObject:v7 forKeyedSubscript:@"DFUReason"];

      v8 = +[NSNumber numberWithBool:v6[2] & 1];
      [(NSMutableDictionary *)self->_analyticsDict setObject:v8 forKeyedSubscript:@"NoVINFlag"];

      unsigned __int8 v9 = +[NSNumber numberWithBool:v6[2] >> 7];
      [(NSMutableDictionary *)self->_analyticsDict setObject:v9 forKeyedSubscript:@"MainThermalShutdown"];

      unsigned __int8 v10 = +[NSNumber numberWithUnsignedChar:v6[4] & 3];
      [(NSMutableDictionary *)self->_analyticsDict setObject:v10 forKeyedSubscript:@"TrustEvaluationStatus"];

      CFDictionaryRef v11 = +[NSNumber numberWithUnsignedChar:(v6[4] >> 3) & 0xF];
      [(NSMutableDictionary *)self->_analyticsDict setObject:v11 forKeyedSubscript:@"Img4DecodeError"];

      v12 = +[NSNumber numberWithUnsignedChar:v6[5] & 0x1F];
      [(NSMutableDictionary *)self->_analyticsDict setObject:v12 forKeyedSubscript:@"Img4PropertyErrorCode"];

      CFNumberRef v13 = +[NSNumber numberWithBool:(v6[7] >> 1) & 1];
      [(NSMutableDictionary *)self->_analyticsDict setObject:v13 forKeyedSubscript:@"PatchPresent"];

      io_service_t v14 = +[NSNumber numberWithBool:(v6[7] >> 2) & 1];
      [(NSMutableDictionary *)self->_analyticsDict setObject:v14 forKeyedSubscript:@"PatchValid"];

      v15 = +[NSNumber numberWithBool:(v6[7] >> 3) & 1];
      [(NSMutableDictionary *)self->_analyticsDict setObject:v15 forKeyedSubscript:@"ACSRAMPresent"];

      v16 = +[NSNumber numberWithBool:(v6[7] >> 4) & 1];
      [(NSMutableDictionary *)self->_analyticsDict setObject:v16 forKeyedSubscript:@"ACSRAMValid"];

      v17 = +[NSNumber numberWithBool:(v6[7] >> 5) & 1];
      [(NSMutableDictionary *)self->_analyticsDict setObject:v17 forKeyedSubscript:@"ACOTPPresent"];

      v18 = +[NSNumber numberWithBool:(v6[7] >> 6) & 1];
      [(NSMutableDictionary *)self->_analyticsDict setObject:v18 forKeyedSubscript:@"ACOTPValid"];

      CFRelease(v4);
      return 0;
    }
    else
    {
      int v19 = -536870212;
      CFRelease(v4);
    }
  }
  else
  {
    int v19 = -536870212;
    if (os_log_type_enabled((os_log_t)self->logger, OS_LOG_TYPE_ERROR)) {
      sub_1000034D0();
    }
  }
  return v19;
}

- (int)getHealthCheck
{
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(self->appleHPMInterfaceService, @"HChk", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFDataRef v4 = CFProperty;
    BytePtr = CFDataGetBytePtr(CFProperty);
    if (BytePtr)
    {
      int v6 = (unsigned __int8 *)BytePtr;
      v7 = +[NSNumber numberWithUnsignedInt:*BytePtr];
      [(NSMutableDictionary *)self->_analyticsDict setObject:v7 forKeyedSubscript:@"SoftWDTCount"];

      v8 = +[NSNumber numberWithUnsignedInt:v6[1]];
      [(NSMutableDictionary *)self->_analyticsDict setObject:v8 forKeyedSubscript:@"HardWDTCount"];

      BOOL v9 = v6[2] || v6[3] || v6[4] || v6[5] != 0;
      unsigned __int8 v10 = +[NSNumber numberWithBool:v9];
      [(NSMutableDictionary *)self->_analyticsDict setObject:v10 forKeyedSubscript:@"ParityFailureFound"];

      CFRelease(v4);
      return 0;
    }
    else
    {
      int v11 = -536870212;
      CFRelease(v4);
    }
  }
  else
  {
    int v11 = -536870212;
    if (os_log_type_enabled((os_log_t)self->logger, OS_LOG_TYPE_ERROR)) {
      sub_100003504();
    }
  }
  return v11;
}

- (int)getAppLoaded
{
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(self->appleHPMInterfaceService, @"AppLoaded Count", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFNumberRef v4 = CFProperty;
    unsigned int valuePtr = 0;
    CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
    CFRelease(v4);
    v5 = +[NSNumber numberWithUnsignedInt:valuePtr];
    [(NSMutableDictionary *)self->_analyticsDict setObject:v5 forKeyedSubscript:@"AppLoaded"];

    return 0;
  }
  else
  {
    int v6 = -536870212;
    if (os_log_type_enabled((os_log_t)self->logger, OS_LOG_TYPE_ERROR)) {
      sub_100003538();
    }
  }
  return v6;
}

- (int)getMode
{
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(self->appleHPMDeviceService, @"HPM Mode Register on Boot", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFDataRef v4 = CFProperty;
    v9.location = 0;
    v9.length = 4;
    CFDataGetBytes(CFProperty, v9, buffer);
    CFRelease(v4);
    id v5 = [objc_alloc((Class)NSString) initWithBytes:buffer length:4 encoding:1];
    [(NSMutableDictionary *)self->_analyticsDict setObject:v5 forKeyedSubscript:@"Mode"];

    return 0;
  }
  else
  {
    int v6 = -536870212;
    if (os_log_type_enabled((os_log_t)self->logger, OS_LOG_TYPE_ERROR)) {
      sub_10000356C();
    }
  }
  return v6;
}

- (int)collectAllAnalytics
{
  unsigned int v3 = [(AppleHPMManager *)self getMode];
  unsigned int v4 = [(AppleHPMManager *)self getAppLoaded] | v3;
  unsigned int v5 = [(AppleHPMManager *)self getFWVersion];
  unsigned int v6 = v4 | v5 | [(AppleHPMManager *)self getBootFlags];
  if (v6 | [(AppleHPMManager *)self getHealthCheck]) {
    return -536870212;
  }
  else {
    return 0;
  }
}

- (NSMutableDictionary)_analyticsDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)set_analyticsDict:(id)a3
{
}

- (int)_rid
{
  return self->_rid;
}

- (void)set_rid:(int)a3
{
  self->_rid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->logger, 0);
  objc_storeStrong((id *)&self->dataDict, 0);

  objc_storeStrong((id *)&self->_analyticsDict, 0);
}

@end