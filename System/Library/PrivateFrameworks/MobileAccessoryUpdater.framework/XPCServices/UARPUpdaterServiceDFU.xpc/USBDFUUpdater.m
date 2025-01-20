@interface USBDFUUpdater
+ (id)matchingDictionaryForVendorID:(unsigned __int16)a3 productId:(unsigned __int16)a4 serialNumber:(id)a5;
+ (id)matchingDictionaryHIDForVendorID:(unsigned __int16)a3 productId:(unsigned __int16)a4 serialNumber:(id)a5;
- (BOOL)dfuMode;
- (BOOL)simulator;
- (NSString)serialNumber;
- (USBDFUUpdater)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4 serialNumber:(id)a5 dfuModeActive:(BOOL)a6 simulator:(BOOL)a7;
- (int)closeDfuDevice;
- (int)dfuDetachToAppCmd;
- (int)dfuDnLoadCmd:(unsigned __int16)a3 data:(void *)a4 length:(unsigned __int16)a5;
- (int)dfuGetStateCmd:(char *)a3;
- (int)dfuGetStatusCmd:(DFUStatus *)a3;
- (int)dfuGetVersionCmdMajor:(unsigned int *)a3 minor:(unsigned int *)a4 release:(unsigned int *)a5 build:(unsigned int *)a6;
- (int)dfuSetState:(unsigned __int8)a3;
- (int)dfuSetVersionCmdMajor:(unsigned int)a3 minor:(unsigned int)a4 release:(unsigned int)a5 build:(unsigned int)a6;
- (int)hvciAppDetachToDfuCmd;
- (int)initCurrentState;
- (int)openDfuDevice;
- (int)sendDfuBlockData:(char *)a3 length:(unsigned __int16)a4;
- (int)sendHIDReport:(unsigned int)a3 reportID:(int)a4 report:(char *)a5 length:(int)a6;
- (int)setDfuMode;
- (unsigned)pid;
- (unsigned)vid;
@end

@implementation USBDFUUpdater

+ (id)matchingDictionaryForVendorID:(unsigned __int16)a3 productId:(unsigned __int16)a4 serialNumber:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  id v7 = a5;
  CFMutableDictionaryRef v8 = IOServiceMatching("IOUSBDevice");
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  v10 = +[NSNumber numberWithUnsignedShort:v6];
  [v9 setObject:v10 forKeyedSubscript:@"idVendor"];

  v11 = +[NSNumber numberWithUnsignedShort:v5];
  [v9 setObject:v11 forKeyedSubscript:@"idProduct"];

  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:@"kUSBSerialNumberString"];
  }
  [(__CFDictionary *)v8 setObject:v9 forKeyedSubscript:@"IOPropertyMatch"];

  return v8;
}

+ (id)matchingDictionaryHIDForVendorID:(unsigned __int16)a3 productId:(unsigned __int16)a4 serialNumber:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  id v7 = a5;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  [v8 setObject:&off_100024C10 forKeyedSubscript:@"DeviceUsagePage"];
  [v8 setObject:&off_100024C28 forKeyedSubscript:@"DeviceUsage"];
  id v14 = v8;
  id v9 = +[NSArray arrayWithObjects:&v14 count:1];
  CFMutableDictionaryRef v10 = IOServiceMatching("IOHIDDevice");
  [(__CFDictionary *)v10 setObject:v9 forKeyedSubscript:@"DeviceUsagePairs"];
  v11 = +[NSNumber numberWithUnsignedShort:v6];
  [(__CFDictionary *)v10 setObject:v11 forKeyedSubscript:@"VendorID"];

  v12 = +[NSNumber numberWithUnsignedShort:v5];
  [(__CFDictionary *)v10 setObject:v12 forKeyedSubscript:@"ProductID"];

  if (v7) {
    [(__CFDictionary *)v10 setObject:v7 forKeyedSubscript:@"kUSBSerialNumberString"];
  }

  return v10;
}

- (USBDFUUpdater)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4 serialNumber:(id)a5 dfuModeActive:(BOOL)a6 simulator:(BOOL)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)USBDFUUpdater;
  v13 = [(USBDFUUpdater *)&v20 init];
  if (v13)
  {
    os_log_t v14 = os_log_create("com.apple.accessoryupdater.uarp", "dfuUpdater");
    log = v13->_log;
    v13->_log = (OS_os_log *)v14;

    v16 = v13->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_100016F24(v16);
    }
    v13->_dev = 0;
    v13->_vid = a3;
    v13->_pid = a4;
    v17 = (NSString *)[objc_alloc((Class)NSString) initWithString:v12];
    serialNumber = v13->_serialNumber;
    v13->_serialNumber = v17;

    v13->_dfuMode = v8;
    if (v8) {
      [(USBDFUUpdater *)v13 initCurrentState];
    }
    v13->_simulator = a7;
  }

  return v13;
}

- (int)initCurrentState
{
  int result = [(USBDFUUpdater *)self openDfuDevice];
  if (!result)
  {
    int v4 = [(USBDFUUpdater *)self dfuGetStateCmd:&self->_currentStatus.bState];
    [(USBDFUUpdater *)self closeDfuDevice];
    return v4;
  }
  return result;
}

- (int)openDfuDevice
{
  kern_return_t v10;
  OS_os_log *log;
  const char *v12;
  IOCFPlugInInterface **v13;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  CFUUIDRef v15;
  CFUUIDBytes v16;
  OS_os_log *v18;
  IOCFPlugInInterface **theInterface;
  SInt32 theScore;
  uint8_t buf[4];
  int v22;

  p_dev = &self->_dev;
  if (!self->_dev)
  {
    int v3 = -536870212;
    if (![(USBDFUUpdater *)self dfuMode]) {
      return v3;
    }
    CFDictionaryRef v5 = +[USBDFUUpdater matchingDictionaryForVendorID:self->_vid productId:self->_pid serialNumber:self->_serialNumber];
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
    if (MatchingService)
    {
      io_service_t v7 = MatchingService;
      theScore = 0;
      theInterface = 0;
      CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Du, 0xC7u, 0xB7u, 0x80u, 0x9Eu, 0xC0u, 0x11u, 0xD4u, 0xA5u, 0x4Fu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
      CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
      CFMutableDictionaryRef v10 = IOCreatePlugInInterfaceForService(v7, v8, v9, &theInterface, &theScore);
      if (v10)
      {
        int v3 = v10;
        log = self->_log;
        if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v22 = v3;
          id v12 = "Unable to create an intermediate plug-in (%08x)";
LABEL_11:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, v12, buf, 8u);
        }
      }
      else
      {
        v13 = theInterface;
        QueryInterface = (*theInterface)->QueryInterface;
        v15 = CFUUIDGetConstantUUIDWithBytes(0, 0x5Cu, 0x81u, 0x87u, 0xD0u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0x8Bu, 0x45u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
        v16 = CFUUIDGetUUIDBytes(v15);
        int v3 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, IOUSBDeviceStruct942 ***))QueryInterface)(v13, *(void *)&v16.byte0, *(void *)&v16.byte8, p_dev);
        ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
        if (!v3)
        {
          int v3 = ((uint64_t (*)(IOUSBDeviceStruct942 **))(**p_dev)->USBDeviceOpen)(*p_dev);
          if (v3)
          {
            v18 = self->_log;
            if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109120;
              v22 = v3;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_INFO, "Unable to open device: %08x\n", buf, 8u);
            }
            ((void (*)(IOUSBDeviceStruct942 **))(**p_dev)->Release)(*p_dev);
          }
          goto LABEL_12;
        }
        log = self->_log;
        if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v22 = v3;
          id v12 = "Couldn’t create a device interface (%08x)";
          goto LABEL_11;
        }
      }
    }
LABEL_12:

    return v3;
  }
  return 0;
}

- (int)closeDfuDevice
{
  dev = self->_dev;
  if (dev)
  {
    ((void (*)(IOUSBDeviceStruct942 **, SEL))(*dev)->USBDeviceClose)(dev, a2);
    ((void (*)(IOUSBDeviceStruct942 **))(*self->_dev)->Release)(self->_dev);
    self->_dev = 0;
  }
  return 0;
}

- (int)dfuGetStateCmd:(char *)a3
{
  if (!self->_dev) {
    return -536870195;
  }
  *a3 = 11;
  int v8 = 0;
  int v10 = 0;
  __int16 v4 = 1441;
  int v5 = 0;
  __int16 v6 = 1;
  io_service_t v7 = a3;
  uint64_t v9 = 0x3E800001388;
  return ((uint64_t (*)(IOUSBDeviceStruct942 **, __int16 *))(*self->_dev)->DeviceRequestTO)(self->_dev, &v4);
}

- (int)dfuSetState:(unsigned __int8)a3
{
  if (!self->_dev) {
    return -536870195;
  }
  int v3 = a3;
  if (a3 > 0xAu) {
    return -536870206;
  }
  p_bState = &self->_currentStatus.bState;
  unsigned int v7 = [(USBDFUUpdater *)self dfuGetStateCmd:&self->_currentStatus.bState];
  if (v7)
  {
    int v4 = v7;
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_100017038(v4, log);
    }
    return v4;
  }
  int v4 = -536870911;
  switch(v3)
  {
    case 0:
      int v10 = self->_log;
      if (self->_currentStatus.bState == 2)
      {
        if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
        {
          int v14 = 136315138;
          v15 = "-[USBDFUUpdater dfuSetState:]";
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_INFO, "%s: Change to kAPP_IDLE through DFU_DETACH_TO_APP", (uint8_t *)&v14, 0xCu);
        }
        return [(USBDFUUpdater *)self dfuDetachToAppCmd];
      }
      else
      {
        int v4 = -536870206;
        if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
          sub_100016FA8(p_bState, v10);
        }
      }
      return v4;
    case 2:
      int v11 = *p_bState;
      if (v11 == 2) {
        return 0;
      }
      if (v11 == 10)
      {
        id v12 = self->_log;
        if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
        {
          int v14 = 136315138;
          v15 = "-[USBDFUUpdater dfuSetState:]";
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_INFO, "%s: Change to kDFU_IDLE through DFU_CLRSTATUS", (uint8_t *)&v14, 0xCu);
        }
        return -536870212;
      }
      else
      {
        v13 = self->_log;
        if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
        {
          int v14 = 136315138;
          v15 = "-[USBDFUUpdater dfuSetState:]";
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_INFO, "%s: Change to kDFU_IDLE through DFU_ABORT", (uint8_t *)&v14, 0xCu);
        }
        int v4 = 0;
        self->_currentDataBlock = 0;
      }
      return v4;
    case 3:
    case 9:
      if (*p_bState == 2) {
        return -536870212;
      }
      else {
        return -536870206;
      }
    case 7:
      int v4 = -536870212;
      if (*p_bState != 6) {
        return v4;
      }
      int result = [(USBDFUUpdater *)self dfuGetStatusCmd:&self->_currentStatus];
      break;
    default:
      return v4;
  }
  return result;
}

- (int)dfuGetStatusCmd:(DFUStatus *)a3
{
  if (!self->_dev) {
    return -536870195;
  }
  int v5 = 5;
  do
  {
    a3->usableTimeoutMs = 0;
    *(void *)&a3->bStatus = 0;
    int v15 = 0;
    int v17 = 0;
    __int16 v11 = 929;
    int v12 = 0;
    __int16 v13 = 6;
    int v14 = a3;
    uint64_t v16 = 0x3E800001388;
    int v6 = ((uint64_t (*)(IOUSBDeviceStruct942 **, __int16 *))(*self->_dev)->DeviceRequestTO)(self->_dev, &v11);
    unsigned int v7 = *(unsigned __int16 *)a3->bwPollTimeout | (a3->bwPollTimeout[2] << 16);
    a3->usableTimeoutMs = v7;
    if (!v6) {
      break;
    }
    unsigned int v8 = v7 < 0x3E8 ? 1 : ((8589935 * (unint64_t)v7) >> 32) >> 1;
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Will retry dfuGetStatus in %d second(s)", buf, 8u);
    }
    sleep(v8);
    --v5;
  }
  while (v5);
  return v6;
}

- (int)dfuDnLoadCmd:(unsigned __int16)a3 data:(void *)a4 length:(unsigned __int16)a5
{
  dev = self->_dev;
  if (!dev) {
    return -536870195;
  }
  int v9 = 0;
  int v11 = 0;
  v7[0] = 289;
  v7[1] = a3;
  v7[2] = 0;
  v7[3] = a5;
  unsigned int v8 = a4;
  uint64_t v10 = 0x3E800001388;
  if (!a5) {
    unsigned int v8 = 0;
  }
  return ((uint64_t (*)(IOUSBDeviceStruct942 **, _WORD *))(*dev)->DeviceRequestTO)(dev, v7);
}

- (int)dfuDetachToAppCmd
{
  dev = self->_dev;
  if (!dev) {
    return -536870195;
  }
  int v5 = 0;
  int v7 = 0;
  v4[0] = 1825;
  memset(&v4[1], 0, 14);
  uint64_t v6 = 0x3E800001388;
  return ((uint64_t (*)(IOUSBDeviceStruct942 **, _WORD *))(*dev)->DeviceRequestTO)(dev, v4);
}

- (int)dfuSetVersionCmdMajor:(unsigned int)a3 minor:(unsigned int)a4 release:(unsigned int)a5 build:(unsigned int)a6
{
  dev = self->_dev;
  if (!dev) {
    return -536870195;
  }
  int v11 = 0;
  int v13 = 0;
  v8[0] = 2593;
  v8[1] = ((_WORD)a3 << 12) | ((a4 & 0xF) << 8) | (16 * (a5 & 0xF)) | a6 & 0xF;
  int v9 = 0;
  uint64_t v10 = 0;
  uint64_t v12 = 0x3E800001388;
  return ((uint64_t (*)(IOUSBDeviceStruct942 **, _WORD *))(*dev)->DeviceRequestTO)(dev, v8);
}

- (int)dfuGetVersionCmdMajor:(unsigned int *)a3 minor:(unsigned int *)a4 release:(unsigned int *)a5 build:(unsigned int *)a6
{
  dev = self->_dev;
  if (!dev) {
    return -536870195;
  }
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  int v17 = 0;
  int v19 = 0;
  __int16 v13 = 2977;
  int v14 = 0;
  __int16 v15 = 4;
  uint64_t v16 = v12;
  uint64_t v18 = 0x3E800001388;
  int result = ((uint64_t (*)(IOUSBDeviceStruct942 **, __int16 *))(*dev)->DeviceRequestTO)(dev, &v13);
  if (!result)
  {
    *a3 = v12[0];
    *a4 = v12[1];
    *a5 = v12[2];
    *a6 = v12[3];
  }
  return result;
}

- (int)sendHIDReport:(unsigned int)a3 reportID:(int)a4 report:(char *)a5 length:(int)a6
{
  int v9 = IOHIDDeviceCreate(kCFAllocatorDefault, a3);
  if (!v9) {
    return -536870212;
  }
  uint64_t v10 = v9;
  IOReturn v11 = IOHIDDeviceOpen(v9, 0);
  if (!v11)
  {
    IOReturn v11 = IOHIDDeviceSetReport(v10, kIOHIDReportTypeFeature, a4, (const uint8_t *)a5, a6);
    IOHIDDeviceClose(v10, 0);
  }
  CFRelease(v10);
  return v11;
}

- (int)hvciAppDetachToDfuCmd
{
  CFDictionaryRef v3 = +[USBDFUUpdater matchingDictionaryHIDForVendorID:self->_vid productId:self->_pid serialNumber:self->_serialNumber];
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  if (MatchingService)
  {
    io_object_t v5 = MatchingService;
    int v8 = 1129054721;
    int v6 = [(USBDFUUpdater *)self sendHIDReport:MatchingService reportID:1 report:&v8 length:4];
    IOObjectRelease(v5);
  }
  else
  {
    int v6 = -536870212;
  }

  return v6;
}

- (int)setDfuMode
{
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    int v8 = "-[USBDFUUpdater setDfuMode]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: Change to kDFU_IDLE through HVCI_APP_DETACH_TO_DFU", (uint8_t *)&v7, 0xCu);
  }
  int v4 = [(USBDFUUpdater *)self hvciAppDetachToDfuCmd];
  if (v4)
  {
    io_object_t v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_1000170C4((os_log_t)v5);
    }
  }
  return v4;
}

- (int)sendDfuBlockData:(char *)a3 length:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  int v7 = [(USBDFUUpdater *)self openDfuDevice];
  if (!v7)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
    {
      int currentDataBlock = self->_currentDataBlock;
      int v12 = 136315650;
      __int16 v13 = "-[USBDFUUpdater sendDfuBlockData:length:]";
      __int16 v14 = 1024;
      int v15 = currentDataBlock;
      __int16 v16 = 1024;
      int v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: Downloading data block %u [%hu byte(s)]", (uint8_t *)&v12, 0x18u);
    }
    unsigned int v10 = [(USBDFUUpdater *)self dfuDnLoadCmd:self->_currentDataBlock data:a3 length:v4];
    if (v10) {
      goto LABEL_5;
    }
    if (v4)
    {
      unsigned int v10 = [(USBDFUUpdater *)self dfuGetStatusCmd:&self->_currentStatus];
      if (v10)
      {
LABEL_5:
        int v7 = v10;
        [(USBDFUUpdater *)self closeDfuDevice];
        return v7;
      }
      if (self->_currentStatus.bStatus) {
        return -536870212;
      }
    }
    int v7 = 0;
    ++self->_currentDataBlock;
  }
  return v7;
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (unsigned)vid
{
  return self->_vid;
}

- (unsigned)pid
{
  return self->_pid;
}

- (BOOL)dfuMode
{
  return self->_dfuMode;
}

- (BOOL)simulator
{
  return self->_simulator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end