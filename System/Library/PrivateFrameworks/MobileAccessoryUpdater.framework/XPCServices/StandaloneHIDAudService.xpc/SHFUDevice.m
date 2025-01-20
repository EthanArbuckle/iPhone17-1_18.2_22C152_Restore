@interface SHFUDevice
+ (BOOL)ignoreVersionCheck;
+ (id)getDevices:(id)a3 hasPowerSource:(BOOL)a4 logHandle:(id)a5 registryEntryID:(id)a6 errorDomain:(id)a7 error:(id *)a8;
+ (id)getDevices:(id)a3 hasPowerSource:(BOOL)a4 logHandle:(id)a5 withVendorID:(int)a6 productID:(int)a7 locationID:(unsigned int)a8 interfaceNumber:(unsigned int)a9 errorDomain:(id)a10 error:(id *)a11;
+ (id)getDevicesWithMatchingDict:(__CFDictionary *)a3 hasPowerSource:(BOOL)a4 errorDomain:(id)a5 error:(id *)a6 delegate:(id)a7 logHandle:(id)a8;
+ (id)getNumberPropertyFromService:(unsigned int)a3 withKey:(__CFString *)a4 recursive:(BOOL)a5;
+ (id)getStringPropertyFromService:(unsigned int)a3 withKey:(__CFString *)a4;
+ (id)sendAllFirmwaresToDeviceWithVendorID:(id)a3 productID:(id)a4 hasPowerSource:(BOOL)a5 parsers:(id)a6 totalPrepareBytes:(unint64_t)a7 bytesSent:(unint64_t *)a8 featureReportDelay:(id)a9 logHandle:(id)a10 pluginDelegate:(id)a11 errorDomain:(id)a12;
+ (id)sendAllFirmwaresToDeviceWithVendorID:(id)a3 productID:(id)a4 interfaceNum:(id)a5 hasPowerSource:(BOOL)a6 parsers:(id)a7 totalPrepareBytes:(unint64_t)a8 bytesSent:(unint64_t *)a9 featureReportDelay:(id)a10 waitForRenumeration:(BOOL)a11 logHandle:(id)a12 pluginDelegate:(id)a13 errorDomain:(id)a14;
+ (void)setIgnoreVersionCheck:(BOOL)a3;
- (BOOL)GATTServicesDiscoveryNeeded;
- (BOOL)batteryIsCharging;
- (BOOL)firmwareVersionsEqualTo:(id)a3;
- (BOOL)firmwareVersionsOlderThan:(id)a3;
- (BOOL)hardwareVersionSupportedBy:(id)a3;
- (BOOL)hasPowerSource;
- (BOOL)sendOffsets;
- (BOOL)sendUberInitAndCommit;
- (BOOL)shouldInstallFW:(id)a3 personalizationAllowed:(BOOL)a4;
- (BOOL)useFWUpdateReportIDs;
- (FudPluginDelegate)delegate;
- (NSDictionary)powerSource;
- (NSMutableDictionary)fwVersions;
- (NSNumber)R1FWVersion;
- (NSNumber)interfaceNum;
- (NSNumber)registryEntryID;
- (NSObject)personalizationObserver;
- (NSString)className;
- (NSString)deviceAddress;
- (NSString)errorDomain;
- (NSString)productName;
- (NSString)serialNumber;
- (NSString)transport;
- (OS_dispatch_queue)serialQueue;
- (OS_dispatch_semaphore)powerSemaphore;
- (OS_os_log)logHandle;
- (SHFUDevice)init;
- (SHFUDevice)initWithDeviceRef:(__IOHIDDevice *)a3 service:(unsigned int)a4 hasPowerSource:(BOOL)a5 delegate:(id)a6 logHandle:(id)a7 errorDomain:(id)a8 error:(id *)a9 buffer:(char *)a10 bufferLength:(unsigned int)a11;
- (SHFUDevice)initWithService:(unsigned int)a3 hasPowerSource:(BOOL)a4 delegate:(id)a5 logHandle:(id)a6 errorDomain:(id)a7 error:(id *)a8;
- (id)auErrorString:(unsigned __int8)a3;
- (id)commitAllFirmwares;
- (id)createPersonalizationRequest:(id)a3 error:(id *)a4;
- (id)description;
- (id)latestFirmwareForHardware:(id)a3;
- (id)sendAllFirmwaresToDevice:(id)a3 totalPrepareBytes:(unint64_t)a4 bytesSent:(unint64_t *)a5 featureReportDelay:(id)a6;
- (id)sendPersonalizedManifestsToDevice:(id)a3 featureReportDelay:(id)a4 manifestCount:(id)a5;
- (id)sendSingleFirmwareToDevice:(id)a3 totalPrepareBytes:(unint64_t)a4 bytesSent:(unint64_t *)a5 featureReportDelay:(id)a6;
- (id)sendUnsignedFWToDevice:(id)a3 featureReportDelay:(id)a4 sendPersonalizedManifests:(BOOL *)a5;
- (id)waitForSecureFWReenumeration;
- (int)batteryCapacity;
- (int)getReportID:(unsigned __int8)a3 buffer:(char *)a4 length:(unsigned int *)a5;
- (int)setReportID:(unsigned __int8)a3 buffer:(char *)a4 length:(unsigned int)a5;
- (int64_t)powerSourceTimedOut;
- (unint64_t)getTotalFirmwareBytes:(id)a3;
- (unsigned)hardwareVersion;
- (unsigned)initReportDelay;
- (unsigned)locationID;
- (unsigned)primaryUsage;
- (unsigned)primaryUsagePage;
- (unsigned)productID;
- (unsigned)protocolVersion;
- (unsigned)updateFlags;
- (unsigned)vendorID;
- (unsigned)writeBufferSize;
- (void)dealloc;
- (void)delayAfterInitReport;
- (void)logVersions:(id)a3;
- (void)reset;
- (void)resetSecureFW;
- (void)setClassName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setInterfaceNum:(id)a3;
- (void)setLocationID:(unsigned int)a3;
- (void)setLogHandle:(id)a3;
- (void)setPersonalizationObserver:(id)a3;
- (void)setPowerSource:(id)a3;
- (void)setPowerSourceTimedOut:(int64_t)a3;
- (void)setProductName:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation SHFUDevice

+ (id)getNumberPropertyFromService:(unsigned int)a3 withKey:(__CFString *)a4 recursive:(BOOL)a5
{
  v5 = 0;
  if (a3 && a4)
  {
    IOOptionBits v6 = a5 ? 3 : 0;
    CFTypeRef v7 = IORegistryEntrySearchCFProperty(a3, "IOService", a4, kCFAllocatorDefault, v6);
    v5 = (void *)v7;
    if (v7)
    {
      CFTypeID v8 = CFGetTypeID(v7);
      if (v8 != CFNumberGetTypeID())
      {
        CFRelease(v5);
        v5 = 0;
      }
    }
  }
  return v5;
}

+ (id)getStringPropertyFromService:(unsigned int)a3 withKey:(__CFString *)a4
{
  v4 = 0;
  if (a3)
  {
    if (a4)
    {
      CFTypeRef v5 = IORegistryEntrySearchCFProperty(a3, "IOService", a4, kCFAllocatorDefault, 0);
      v4 = (void *)v5;
      if (v5)
      {
        CFTypeID v6 = CFGetTypeID(v5);
        if (v6 != CFStringGetTypeID())
        {
          CFRelease(v4);
          v4 = 0;
        }
      }
    }
  }
  return v4;
}

+ (id)getDevicesWithMatchingDict:(__CFDictionary *)a3 hasPowerSource:(BOOL)a4 errorDomain:(id)a5 error:(id *)a6 delegate:(id)a7 logHandle:(id)a8
{
  kern_return_t MatchingServices;
  io_object_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  CFTypeRef v22;
  CFTypeID v23;
  SHFUDevice *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  BOOL v36;
  io_registry_entry_t parent;
  io_iterator_t existing;
  NSErrorUserInfoKey v39;
  uint64_t v40;
  NSErrorUserInfoKey v41;
  CFStringRef v42;
  uint64_t vars8;

  v36 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = a8;
  id v15 = objc_alloc_init((Class)NSMutableArray);
  existing = 0;
  CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, a3);
  MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, MutableCopy, &existing);
  v18 = existing;
  if (existing && !MatchingServices)
  {
    v19 = IOIteratorNext(existing);
    if (v19)
    {
      v20 = v19;
      v35 = v14;
      do
      {
        if (*a6) {
          break;
        }
        v21 = [(__CFDictionary *)a3 objectForKeyedSubscript:@"bInterfaceNumber"];
        if (!v21) {
          goto LABEL_12;
        }
        parent = 0;
        if (!IORegistryEntryGetParentEntry(v20, "IOService", &parent))
        {
          v22 = IORegistryEntrySearchCFProperty(parent, "IOService", @"bInterfaceNumber", kCFAllocatorDefault, 1u);
          IOObjectRelease(parent);
          if (v22)
          {
            v23 = CFGetTypeID(v22);
            if (v23 == CFNumberGetTypeID() && ([v21 isEqualToNumber:v22] & 1) != 0)
            {
              CFRelease(v22);
              id v14 = v35;
LABEL_12:
              v24 = [[SHFUDevice alloc] initWithService:v20 hasPowerSource:v36 delegate:v13 logHandle:v14 errorDomain:v12 error:a6];
              if (v24)
              {
                [v15 addObject:v24];
              }
              else if (!*a6)
              {
                v25 = objc_alloc((Class)NSError);
                v41 = NSLocalizedDescriptionKey;
                v42 = @"Failed to initialize SHFUDevice";
                +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
                v34 = v13;
                v27 = v26 = v12;
                v28 = v25;
                id v14 = v35;
                *a6 = [v28 initWithDomain:v26 code:1 userInfo:v27];

                id v12 = v26;
                id v13 = v34;
              }
              IOObjectRelease(v20);

              goto LABEL_19;
            }
            CFRelease(v22);
            id v14 = v35;
          }
        }
        IOObjectRelease(v20);
LABEL_19:

        v20 = IOIteratorNext(existing);
      }
      while (v20);
    }
    v18 = existing;
  }
  if (v18)
  {
    IOObjectRelease(v18);
    existing = 0;
  }
  if (*a6) {
    goto LABEL_24;
  }
  if (![v15 count])
  {
    +[NSString stringWithFormat:@"No standalone HID devices detected matching %@", a3];
    v31 = v30 = v12;
    v32 = objc_alloc((Class)NSError);
    v39 = NSLocalizedDescriptionKey;
    v40 = v31;
    v33 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    *a6 = [v32 initWithDomain:v30 code:0 userInfo:v33];

    id v15 = (id)v31;
    id v12 = v30;
LABEL_24:

    id v15 = 0;
  }

  return v15;
}

+ (id)getDevices:(id)a3 hasPowerSource:(BOOL)a4 logHandle:(id)a5 registryEntryID:(id)a6 errorDomain:(id)a7 error:(id *)a8
{
  BOOL v11 = a4;
  id v14 = a7;
  id v15 = a5;
  id v16 = a3;
  CFMutableDictionaryRef v17 = IORegistryEntryIDMatching((uint64_t)[a6 unsignedLongLongValue]);
  v18 = [a1 getDevicesWithMatchingDict:v17 hasPowerSource:v11 errorDomain:v14 error:a8 delegate:v16 logHandle:v15];

  CFRelease(v17);
  return v18;
}

+ (id)getDevices:(id)a3 hasPowerSource:(BOOL)a4 logHandle:(id)a5 withVendorID:(int)a6 productID:(int)a7 locationID:(unsigned int)a8 interfaceNumber:(unsigned int)a9 errorDomain:(id)a10 error:(id *)a11
{
  uint64_t v11 = *(void *)&a8;
  uint64_t v12 = *(void *)&a7;
  uint64_t v13 = *(void *)&a6;
  BOOL v31 = a4;
  v29 = a11;
  id v17 = a10;
  id v18 = a5;
  id v19 = a3;
  CFMutableDictionaryRef v20 = IOServiceMatching("IOHIDDevice");
  v21 = +[NSNumber numberWithInt:v13];
  [(__CFDictionary *)v20 setObject:v21 forKeyedSubscript:@"VendorID"];

  v22 = +[NSNumber numberWithInt:v12];
  [(__CFDictionary *)v20 setObject:v22 forKeyedSubscript:@"ProductID"];

  if (SHFU_UNKNOWN_LOCATION_ID != v11)
  {
    v23 = +[NSNumber numberWithUnsignedInt:v11];
    [(__CFDictionary *)v20 setObject:v23 forKeyedSubscript:@"LocationID"];
  }
  if (SHFU_UNKNOWN_INTERFACE_NUMBER != a9)
  {
    v24 = +[NSNumber numberWithUnsignedInt:a9];
    [(__CFDictionary *)v20 setObject:v24 forKeyedSubscript:@"bInterfaceNumber"];
  }
  if ((int)v12 > 612)
  {
    if (((v12 - 613) > 0x3A || ((1 << (v12 - 101)) & 0x4A06000001F01FFLL) == 0)
      && v12 != 786)
    {
      goto LABEL_16;
    }
LABEL_8:
    [(__CFDictionary *)v20 setObject:&off_100026A00, @"PrimaryUsagePage", a11 forKeyedSubscript];
    v25 = &off_100026A18;
    CFStringRef v26 = @"PrimaryUsage";
    goto LABEL_9;
  }
  if (v12 == 332 || v12 == 546) {
    goto LABEL_8;
  }
LABEL_16:
  v25 = &off_100026B40;
  CFStringRef v26 = @"DeviceUsagePairs";
LABEL_9:
  -[__CFDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v25, v26, v29);
  v27 = [a1 getDevicesWithMatchingDict:v20 hasPowerSource:v31 errorDomain:v17 error:v30 delegate:v19 logHandle:v18];

  return v27;
}

- (SHFUDevice)initWithService:(unsigned int)a3 hasPowerSource:(BOOL)a4 delegate:(id)a5 logHandle:(id)a6 errorDomain:(id)a7 error:(id *)a8
{
  uint64_t v11 = a4;
  uint64_t v12 = *(void *)&a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  memset(v46, 0, sizeof(v46));
  unsigned int v37 = 512;
  id v17 = IOHIDDeviceCreate(kCFAllocatorDefault, v12);
  unsigned int v36 = v11;
  if (!v17)
  {
    id v23 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    CFStringRef v45 = @"Failed to create IOHIDDevice";
    char v20 = 1;
    v24 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    id v22 = [v23 initWithDomain:v16 code:19 userInfo:v24];

    id v18 = 0;
    if (v22) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
  id v18 = v17;
  if (!IOHIDDeviceOpen(v17, 0))
  {
    uint64_t v26 = sub_10000ED1C(0xB8u, v46, &v37, v18, v15);
    if (v26)
    {
      v27 = SHFUIOReturnString(v26);
      v28 = +[NSString stringWithFormat:@"Update params feature report ID 0x%02X failed with %@", 184, v27];

      id v29 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
      v41 = v28;
      uint64_t v30 = &v41;
      BOOL v31 = &v40;
    }
    else
    {
      unsigned int v32 = v37;
      if (v37 > 1)
      {
LABEL_17:
        LODWORD(v35) = v32;
        v25 = [(SHFUDevice *)self initWithDeviceRef:v18 service:v12 hasPowerSource:v11 delegate:v14 logHandle:v15 errorDomain:v16 error:a8 buffer:v46 bufferLength:v35];
        goto LABEL_18;
      }
      v28 = +[NSString stringWithFormat:@"Update params feature report ID 0x%02X returned invalid payload length %d", 184, v37];
      id v29 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
      v39 = v28;
      uint64_t v30 = &v39;
      BOOL v31 = &v38;
    }
    v33 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v31 count:1];
    id v22 = [v29 initWithDomain:v16 code:21 userInfo:v33];

    char v20 = 0;
    if (v22) {
      goto LABEL_6;
    }
LABEL_16:
    uint64_t v11 = v36;
    unsigned int v32 = v37;
    goto LABEL_17;
  }
  id v19 = objc_alloc((Class)NSError);
  NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
  CFStringRef v43 = @"Failed to open IOHIDDevice";
  char v20 = 1;
  v21 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  id v22 = [v19 initWithDomain:v16 code:20 userInfo:v21];

  CFRelease(v18);
  id v18 = 0;
  if (!v22) {
    goto LABEL_16;
  }
LABEL_6:
  if (a8) {
    *a8 = v22;
  }
  if ((v20 & 1) == 0)
  {
    IOHIDDeviceClose(v18, 0);
    CFRelease(v18);
  }

  v25 = 0;
LABEL_18:

  return v25;
}

- (SHFUDevice)init
{
  +[NSException raise:NSInternalInconsistencyException format:@"use -initWithDeviceRef:service:hasPowerSource:delegate:logHandle:errorDomain:buffer:bufferLength:"];
  return [(SHFUDevice *)self initWithService:0 hasPowerSource:0 delegate:0 logHandle:0 errorDomain:&stru_1000249B8 error:0];
}

- (SHFUDevice)initWithDeviceRef:(__IOHIDDevice *)a3 service:(unsigned int)a4 hasPowerSource:(BOOL)a5 delegate:(id)a6 logHandle:(id)a7 errorDomain:(id)a8 error:(id *)a9 buffer:(char *)a10 bufferLength:(unsigned int)a11
{
  uint64_t v14 = *(void *)&a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (a9) {
    *a9 = 0;
  }
  if (a3 && v14)
  {
    v59.receiver = self;
    v59.super_class = (Class)SHFUDevice;
    char v20 = [(SHFUDevice *)&v59 init];
    v21 = v20;
    if (v20)
    {
      v20->_hasPowerSource = a5;
      dispatch_queue_t v22 = dispatch_queue_create("com.apple.StandaloneHIDFudPlugins.SHFUDevice", 0);
      serialQueue = v21->_serialQueue;
      v21->_serialQueue = (OS_dispatch_queue *)v22;

      dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
      powerSemaphore = v21->_powerSemaphore;
      v21->_powerSemaphore = (OS_dispatch_semaphore *)v24;

      uint64_t v26 = +[NSString stringWithString:v19];
      errorDomain = v21->_errorDomain;
      v21->_errorDomain = (NSString *)v26;

      v21->_deviceRef = a3;
      objc_storeWeak((id *)&v21->_delegate, v17);
      objc_storeWeak((id *)&v21->_logHandle, v18);
      uint64_t entryID = 0;
      IORegistryEntryGetRegistryEntryID(v14, &entryID);
      if (entryID)
      {
        uint64_t v28 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
        registryEntryID = v21->_registryEntryID;
        v21->_registryEntryID = (NSNumber *)v28;
      }
      memset(name, 0, 128);
      if (!IORegistryEntryGetName(v14, name))
      {
        uint64_t v30 = (NSString *)[objc_alloc((Class)NSString) initWithCString:name encoding:4];
        className = v21->_className;
        v21->_className = v30;
      }
      uint64_t v32 = +[SHFUDevice getStringPropertyFromService:v14 withKey:@"Product"];
      productName = v21->_productName;
      v21->_productName = (NSString *)v32;

      uint64_t v34 = +[SHFUDevice getStringPropertyFromService:v14 withKey:@"Transport"];
      transport = v21->_transport;
      v21->_transport = (NSString *)v34;

      unsigned int v36 = +[SHFUDevice getNumberPropertyFromService:v14 withKey:@"ProductID" recursive:0];
      v21->_int productID = (unsigned __int16)[v36 unsignedIntValue];
      unsigned int v37 = +[SHFUDevice getNumberPropertyFromService:v14 withKey:@"VendorID" recursive:0];

      v21->_vendorID = (unsigned __int16)[v37 unsignedIntValue];
      NSErrorUserInfoKey v38 = +[SHFUDevice getNumberPropertyFromService:v14 withKey:@"PrimaryUsage" recursive:0];

      v21->_primaryUsage = (unsigned __int16)[v38 unsignedIntValue];
      v39 = +[SHFUDevice getNumberPropertyFromService:v14 withKey:@"PrimaryUsagePage" recursive:0];

      v21->_primaryUsagePage = (unsigned __int16)[v39 unsignedIntValue];
      NSErrorUserInfoKey v40 = +[SHFUDevice getNumberPropertyFromService:v14 withKey:@"LocationID" recursive:0];

      v21->_locationID = [v40 unsignedIntValue];
      io_registry_entry_t parent = 0;
      if (!IORegistryEntryGetParentEntry(v14, "IOService", &parent) && parent)
      {
        uint64_t v41 = +[SHFUDevice getNumberPropertyFromService:withKey:recursive:](SHFUDevice, "getNumberPropertyFromService:withKey:recursive:");
        interfaceNum = v21->_interfaceNum;
        v21->_interfaceNum = (NSNumber *)v41;

        IOObjectRelease(parent);
      }
      if (!v21->_interfaceNum)
      {
        uint64_t v43 = +[SHFUDevice getNumberPropertyFromService:v14 withKey:@"bInterfaceNumber" recursive:1];
        NSErrorUserInfoKey v44 = v21->_interfaceNum;
        v21->_interfaceNum = (NSNumber *)v43;
      }
      if (v21->_vendorID == 76)
      {
        if ((int productID = v21->_productID, (productID - 613) <= 0x3A)
          && ((1 << (productID - 101)) & 0x4A0000000000095) != 0
          || (productID - 800) < 5)
        {
          uint64_t v46 = +[SHFUDevice getStringPropertyFromService:v14 withKey:@"SerialNumber"];
          deviceAddress = v21->_deviceAddress;
          v21->_deviceAddress = (NSString *)v46;
        }
      }
      uint64_t v48 = +[SHFUDevice getStringPropertyFromService:v14 withKey:@"SerialNumber"];
      serialNumber = v21->_serialNumber;
      v21->_serialNumber = (NSString *)v48;

      if (a11 == 2)
      {
        v21->_protocolVersion = 1;
LABEL_22:
        v21->_writeBufferSize = *(_WORD *)a10;
        __int16 v50 = 257;
LABEL_23:
        *(_WORD *)&v21->_useFWUpdateReportIDs = v50;
        v21->_sendUberInitAndCommit = 0;
      }
      else
      {
        uint64_t v51 = *a10;
        v21->_protocolVersion = v51;
        switch((int)v51)
        {
          case 1:
            goto LABEL_22;
          case 2:
            v21->_writeBufferSize = *(_WORD *)(a10 + 1);
            __int16 v50 = 256;
            goto LABEL_23;
          case 3:
            v21->_writeBufferSize = *(_WORD *)(a10 + 1);
            unsigned __int16 v55 = *(_WORD *)(a10 + 3);
            v21->_updateFlags = v55;
            v21->_useFWUpdateReportIDs = 0;
            goto LABEL_34;
          case 4:
            v21->_writeBufferSize = *(_WORD *)(a10 + 1);
            unsigned __int16 v55 = *(_WORD *)(a10 + 3);
            v21->_updateFlags = v55;
            goto LABEL_33;
          case 5:
            v21->_writeBufferSize = *(_WORD *)(a10 + 1);
            unsigned __int16 v55 = *(_WORD *)(a10 + 3);
            v21->_updateFlags = v55;
            v21->_initReportDelay = *(_WORD *)(a10 + 5);
LABEL_33:
            v21->_useFWUpdateReportIDs = 1;
LABEL_34:
            v21->_sendUberInitAndCommit = (v55 & 2) != 0;
            v21->_sendOffsets = (v55 & 1) == 0;
            break;
          default:
            if (a9)
            {
              v52 = +[NSString stringWithFormat:@"Invalid FW update protocol version %d", v51];
              id v53 = objc_alloc((Class)NSError);
              NSErrorUserInfoKey v60 = NSLocalizedDescriptionKey;
              v61 = v52;
              v54 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
              *a9 = [v53 initWithDomain:v19 code:22 userInfo:v54];
            }
            v21 = 0;
            break;
        }
      }
    }
  }
  else
  {

    v21 = 0;
  }

  return v21;
}

- (void)dealloc
{
  deviceRef = self->_deviceRef;
  if (deviceRef)
  {
    IOHIDDeviceClose(deviceRef, 0);
    CFRelease(self->_deviceRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)SHFUDevice;
  [(SHFUDevice *)&v4 dealloc];
}

- (id)description
{
  uint64_t v3 = [(SHFUDevice *)self className];
  uint64_t v4 = [(SHFUDevice *)self productName];
  uint64_t v5 = [(SHFUDevice *)self transport];
  uint64_t v33 = [(SHFUDevice *)self productID];
  uint64_t v31 = [(SHFUDevice *)self vendorID];
  uint64_t v30 = [(SHFUDevice *)self primaryUsage];
  uint64_t v29 = [(SHFUDevice *)self primaryUsagePage];
  uint64_t v28 = [(SHFUDevice *)self locationID];
  uint64_t v34 = [(SHFUDevice *)self interfaceNum];
  unsigned int v36 = (void *)v4;
  id obj = (id)v3;
  uint64_t v35 = (void *)v5;
  if (v34)
  {
    uint64_t v32 = [(SHFUDevice *)self interfaceNum];
  }
  else
  {
    uint64_t v32 = @"N/A";
  }
  unsigned int v27 = [(SHFUDevice *)self useFWUpdateReportIDs];
  unsigned int v26 = [(SHFUDevice *)self sendOffsets];
  unsigned int v6 = [(SHFUDevice *)self sendUberInitAndCommit];
  unsigned int v7 = [(SHFUDevice *)self writeBufferSize];
  unsigned int v8 = [(SHFUDevice *)self updateFlags];
  unsigned int v9 = [(SHFUDevice *)self initReportDelay];
  unsigned int v10 = [(SHFUDevice *)self hardwareVersion];
  uint64_t v11 = [(SHFUDevice *)self powerSource];
  uint64_t v12 = [(SHFUDevice *)self deviceAddress];
  uint64_t v13 = [(SHFUDevice *)self serialNumber];
  uint64_t v14 = [(SHFUDevice *)self registryEntryID];
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"class: %@, product: %@, transport: %@, PID 0x%x, VID 0x%x, primary usage 0x%x, primary usage page 0x%x, locationID 0x%x, interface %@, useFWUpdateReportIDs %d, sendOffsets %d, sendUberInitAndCommit %d, writeBufferSize %u, updateFlags %u, init report delay %u, hardware version 0x%02x, power source %@, deviceAddress %@, serial number %@ IORegistryEntryID 0x%016llX", obj, v36, v35, v33, v31, v30, v29, v28, v32, v27, v26, v6, v7, v8, v9, v10,
    v11,
    v12,
    v13,
  id v15 = [v14 unsignedLongLongValue]);

  if (v34) {
  long long v41 = 0u;
  }
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = self;
  id obja = [(SHFUDevice *)self fwVersions];
  id v17 = [obja countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(obja);
        }
        v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        dispatch_queue_t v22 = +[AUFileParser auTypeString:](AUFileParser, "auTypeString:", [v21 unsignedIntValue]);
        id v23 = [(SHFUDevice *)v16 fwVersions];
        dispatch_semaphore_t v24 = [v23 objectForKeyedSubscript:v21];
        [v15 appendFormat:@", %@ version 0x%02x", v22, objc_msgSend(v24, "unsignedIntValue")];
      }
      id v18 = [obja countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v18);
  }

  return v15;
}

- (void)logVersions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  long long v40 = v4;
  [v5 setObject:v4 forKeyedSubscript:@"deviceType"];
  unsigned int v6 = +[NSNumber numberWithUnsignedShort:[(SHFUDevice *)self hardwareVersion]];
  [v5 setObject:v6 forKeyedSubscript:@"hardwareVersion"];

  unsigned int v7 = +[NSString stringWithFormat:@"%u", [(SHFUDevice *)self hardwareVersion]];
  [v5 setObject:v7 forKeyedSubscript:@"hardwareVersionStr"];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  unsigned int v8 = [(SHFUDevice *)self fwVersions];
  id v9 = [v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v14 = +[AUFileParser auTypeString:](AUFileParser, "auTypeString:", [v13 unsignedIntValue]);
        id v15 = [(SHFUDevice *)self fwVersions];
        id v16 = [v15 objectForKeyedSubscript:v13];
        [v5 setObject:v16 forKeyedSubscript:v14];
      }
      id v10 = [v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v10);
  }

  id v17 = [(SHFUDevice *)self serialNumber];
  id v18 = [v17 length];

  if (v18)
  {
    id v19 = [(SHFUDevice *)self serialNumber];
  }
  else
  {
    id v19 = v40;
  }
  char v20 = v19;
  v21 = +[NSUserDefaults standardUserDefaults];
  dispatch_queue_t v22 = [v21 dictionaryForKey:@"CoreAnalyticsTimestamps"];
  id v23 = [v22 mutableCopy];

  dispatch_semaphore_t v24 = +[NSDate date];
  v25 = +[NSDate dateWithTimeIntervalSinceNow:-86400.0];
  id v26 = objc_alloc_init((Class)NSISO8601DateFormatter);
  unsigned int v27 = [(SHFUDevice *)self logHandle];
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
  if (!v23)
  {
    if (v28) {
      sub_100017838();
    }

    id v23 = objc_alloc_init((Class)NSMutableDictionary);
    goto LABEL_27;
  }
  if (v28) {
    sub_100017970();
  }

  uint64_t v29 = [v23 objectForKeyedSubscript:v20];
  if (!v29 || ([v26 dateFromString:v29], (uint64_t v30 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    long long v39 = v21;
    id v32 = v26;
    uint64_t v33 = v24;
    uint64_t v34 = v25;
    uint64_t v35 = [(SHFUDevice *)self logHandle];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      sub_100017838();
    }
    uint64_t v31 = 0;
    goto LABEL_22;
  }
  uint64_t v31 = v30;
  if ([v30 compare:v24] == (id)1)
  {
    long long v39 = v21;
    id v32 = v26;
    uint64_t v33 = v24;
    uint64_t v34 = v25;
    uint64_t v35 = [(SHFUDevice *)self logHandle];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      sub_1000178A0();
    }
LABEL_22:

    v25 = v34;
    dispatch_semaphore_t v24 = v33;
    id v26 = v32;
    v21 = v39;
LABEL_23:

LABEL_27:
    unsigned int v36 = [(SHFUDevice *)self logHandle];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      sub_100017804();
    }

    id v41 = v5;
    AnalyticsSendEventLazy();
    unsigned int v37 = [v26 stringFromDate:v24];
    [v23 setObject:v37 forKeyedSubscript:v20];
    [v21 setObject:v23 forKey:@"CoreAnalyticsTimestamps"];

    uint64_t v31 = v41;
    goto LABEL_30;
  }
  if ([v31 compare:v25] != (id)1) {
    goto LABEL_23;
  }
  NSErrorUserInfoKey v38 = [(SHFUDevice *)self logHandle];
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
    sub_100017908();
  }

LABEL_30:
}

- (BOOL)shouldInstallFW:(id)a3 personalizationAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [(SHFUDevice *)self fwVersions];
  unsigned int v8 = [v6 getFirmwareType];
  id v9 = [v7 objectForKeyedSubscript:v8];
  unsigned int v10 = [v9 unsignedIntValue];

  uint64_t v11 = [v6 getFirmwareVersion];
  unsigned int v12 = [v11 unsignedIntValue];

  uint64_t v13 = [v6 getFirmwareType];
  uint64_t v14 = +[AUFileParser auTypeString:](AUFileParser, "auTypeString:", [v13 unsignedIntValue]);

  if (v12 == v10 && !+[SHFUDevice ignoreVersionCheck])
  {
    if ([(SHFUDevice *)self productID] != 614
      || ([v6 getFirmwareType],
          id v15 = objc_claimAutoreleasedReturnValue(),
          unsigned int v16 = [v15 unsignedIntValue],
          v15,
          v16 != 48))
    {
      id v18 = [(SHFUDevice *)self logHandle];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_1000179D8();
      }
      BOOL v17 = 0;
      goto LABEL_16;
    }
  }
  if ((![v6 personalizationRequired] || v4)
    && (([v6 personalizationRequired] & 1) != 0 || !v4))
  {
    id v18 = [(SHFUDevice *)self logHandle];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 138412802;
      v21 = v14;
      __int16 v22 = 1024;
      unsigned int v23 = v10;
      __int16 v24 = 1024;
      unsigned int v25 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%@ has FW version 0x%X installed. Start installation of FW version 0x%X.", (uint8_t *)&v20, 0x18u);
    }
    BOOL v17 = 1;
LABEL_16:

    goto LABEL_17;
  }
  BOOL v17 = 0;
LABEL_17:

  return v17;
}

- (NSNumber)R1FWVersion
{
  fwVersions = self->_fwVersions;
  self->_fwVersions = 0;

  BOOL v4 = [(SHFUDevice *)self fwVersions];
  id v5 = [v4 objectForKeyedSubscript:&off_100026A30];

  return (NSNumber *)v5;
}

- (id)waitForSecureFWReenumeration
{
  uint64_t v3 = +[NSDate dateWithTimeIntervalSinceNow:450.0];
  BOOL v4 = [(SHFUDevice *)self logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100017A90(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  unsigned int v12 = +[NSDate date];
  id v13 = [v12 compare:v3];

  if (v13 == (id)-1)
  {
    while (1)
    {
      +[NSThread sleepForTimeInterval:5.0];
      uint64_t v14 = [(SHFUDevice *)self R1FWVersion];
      id v15 = v14;
      if (v14)
      {
        if ([v14 unsignedIntValue]) {
          break;
        }
      }

      unsigned int v16 = +[NSDate date];
      id v17 = [v16 compare:v3];

      if (v17 != (id)-1) {
        goto LABEL_7;
      }
    }
    id v19 = [(SHFUDevice *)self logHandle];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100017A5C();
    }
    id v21 = 0;
  }
  else
  {
LABEL_7:
    id v15 = +[NSString stringWithFormat:@"Timed out after %f seconds waiting for secure firmware", 0x407C200000000000];
    id v18 = objc_alloc((Class)NSError);
    id v19 = [(SHFUDevice *)self errorDomain];
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    __int16 v24 = v15;
    int v20 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v21 = [v18 initWithDomain:v19 code:52 userInfo:v20];
  }
  return v21;
}

- (id)createPersonalizationRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  int8x16_t v41 = 0u;
  long long v42 = 0u;
  int v31 = 512;
  int v7 = 11;
  long long v39 = 0u;
  int8x16_t v40 = 0u;
  while (1)
  {
    uint64_t v8 = [(SHFUDevice *)self getReportID:189 buffer:&v39 length:&v31];
    if (!v8) {
      break;
    }
    uint64_t v9 = v8;
    uint64_t v10 = [(SHFUDevice *)self logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100017B08(buf, v38, v10);
    }

    +[NSThread sleepForTimeInterval:5.0];
    if (!--v7)
    {
      id v18 = SHFUIOReturnString(v9);
      id v19 = +[NSString stringWithFormat:@"Personalization info feature report ID 0x%02X failed with %@ for device %@", 189, v18, self];

      id v20 = objc_alloc((Class)NSError);
      id v21 = [(SHFUDevice *)self errorDomain];
      NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
      id v36 = v19;
      __int16 v22 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      *a4 = [v20 initWithDomain:v21 code:53 userInfo:v22];

      id v23 = 0;
      goto LABEL_11;
    }
  }
  id v11 = [objc_alloc((Class)FudPersonalizationRequest) initWithName:@"com.apple.StandaloneHIDFudPlugins.personalization"];
  [v11 setResponseFormat:0];
  [v11 setRequestPrefix:@"Rap"];
  [v11 setSecurityDomain:BYTE1(v39)];
  [v11 setProductionMode:BYTE2(v39) != 0];
  [v11 setSecurityMode:BYTE3(v39) != 0];
  [v11 setBoardID:bswap32(WORD2(v39)) >> 16];
  [v11 setChipID:bswap32(WORD3(v39)) >> 16];
  [v11 setEcID:bswap64(*((unint64_t *)&v39 + 1))];
  int8x16_t v12 = vrev64q_s8(v40);
  int8x16_t v13 = vrev64q_s8(v41);
  v34[0] = vextq_s8(v13, v13, 8uLL);
  v34[1] = vextq_s8(v12, v12, 8uLL);
  uint64_t v14 = +[NSData dataWithBytes:v34 length:32];
  [v11 setNonceHash:v14];

  id v15 = objc_opt_new();
  unsigned int v16 = [v6 getFTABDigests];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100010A94;
  v28[3] = &unk_100024788;
  id v19 = v11;
  id v29 = v19;
  id v17 = v15;
  id v30 = v17;
  [v16 enumerateKeysAndObjectsUsingBlock:v28];
  if ([v17 count])
  {
    [v19 setObjectList:v17];
    id v23 = v19;
  }
  else
  {
    id v24 = objc_alloc((Class)NSError);
    unsigned int v25 = [(SHFUDevice *)self errorDomain];
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    CFStringRef v33 = @"Failed to create personalization request";
    id v26 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    *a4 = [v24 initWithDomain:v25 code:52 userInfo:v26];

    id v23 = 0;
  }

LABEL_11:
  return v23;
}

- (id)sendUnsignedFWToDevice:(id)a3 featureReportDelay:(id)a4 sendPersonalizedManifests:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(SHFUDevice *)self logHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100017B54(v10, v11, v12, v13, v14, v15, v16, v17);
  }

  *a5 = 0;
  if ([v8 personalizationRequired])
  {
    if ([(SHFUDevice *)self shouldInstallFW:v8 personalizationAllowed:1])
    {
      id v18 = [v8 payload];
      id v19 = [(SHFUDevice *)self sendSingleFirmwareToDevice:v18 totalPrepareBytes:0 bytesSent:0 featureReportDelay:v9];

      if (!v19) {
        *a5 = 1;
      }
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    id v20 = objc_alloc((Class)NSError);
    id v21 = [(SHFUDevice *)self errorDomain];
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    CFStringRef v25 = @"Personalization not required for AFU file parser";
    __int16 v22 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v19 = [v20 initWithDomain:v21 code:52 userInfo:v22];
  }
  return v19;
}

- (id)sendPersonalizedManifestsToDevice:(id)a3 featureReportDelay:(id)a4 manifestCount:(id)a5
{
  id v57 = a3;
  id v56 = a4;
  id v8 = a5;
  id v9 = [(SHFUDevice *)self logHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100017D18(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  if (!v8)
  {
    id v36 = objc_alloc((Class)NSError);
    unsigned int v37 = [(SHFUDevice *)self errorDomain];
    NSErrorUserInfoKey v83 = NSLocalizedDescriptionKey;
    CFStringRef v84 = @"Manifest count not specified";
    NSErrorUserInfoKey v38 = +[NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
    id v39 = [v36 initWithDomain:v37 code:52 userInfo:v38];

    goto LABEL_25;
  }
  if (([v57 personalizationRequired] & 1) == 0)
  {
    id v40 = objc_alloc((Class)NSError);
    int8x16_t v41 = [(SHFUDevice *)self errorDomain];
    NSErrorUserInfoKey v81 = NSLocalizedDescriptionKey;
    CFStringRef v82 = @"Personalization not required for AFU file parser";
    long long v42 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    id v39 = [v40 initWithDomain:v41 code:52 userInfo:v42];

    goto LABEL_25;
  }
  uint64_t v74 = 0;
  v75[0] = &v74;
  v75[1] = 0x3032000000;
  v75[2] = sub_10001143C;
  v75[3] = sub_10001144C;
  id v76 = 0;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3042000000;
  v72[3] = sub_100011454;
  v72[4] = sub_100011460;
  location = &v73;
  objc_initWeak(&v73, self);
  uint64_t v66 = 0;
  long long v67 = &v66;
  uint64_t v68 = 0x3032000000;
  long long v69 = sub_10001143C;
  long long v70 = sub_10001144C;
  id v71 = 0;
  uint64_t v17 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v18 = [v17 BOOLForKey:@"WriteManifests"];

  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_100011468;
  v59[3] = &unk_1000247B0;
  long long v62 = v72;
  id v19 = v57;
  unsigned __int8 v65 = v18;
  id v60 = v19;
  long long v63 = &v74;
  id v61 = v56;
  long long v64 = &v66;
  id v20 = objc_retainBlock(v59);
  int v21 = 0;
  long long v54 = v75;
  while (v21 < (int)[v8 intValue])
  {
    uint64_t v22 = v75[0];
    id obj = *(id *)(v75[0] + 40);
    id v23 = [(SHFUDevice *)self createPersonalizationRequest:v19 error:&obj];
    objc_storeStrong((id *)(v22 + 40), obj);
    if (*(void *)(v75[0] + 40)) {
      goto LABEL_18;
    }
    dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
    CFStringRef v25 = (void *)v67[5];
    v67[5] = (uint64_t)v24;

    id v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%llu", @"com.apple.StandaloneHIDFudPlugins.personalization", [v23 ecID], v54, location);
    unsigned int v27 = +[NSNotificationCenter defaultCenter];
    BOOL v28 = [v27 addObserverForName:v26 object:0 queue:0 usingBlock:v20];
    [(SHFUDevice *)self setPersonalizationObserver:v28];

    id v29 = [(SHFUDevice *)self delegate];
    [v29 personalizationRequest:v23];

    dispatch_time_t v30 = dispatch_time(0, 120000000000);
    int v31 = [(SHFUDevice *)self logHandle];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      sub_100017CCC(buf, &v80, v31);
    }

    intptr_t v32 = dispatch_semaphore_wait((dispatch_semaphore_t)v67[5], v30);
    CFStringRef v33 = (void *)v67[5];
    v67[5] = 0;

    if (*(void *)(v75[0] + 40)) {
      goto LABEL_17;
    }
    if (v32)
    {
      id v43 = objc_alloc((Class)NSError);
      long long v44 = [(SHFUDevice *)self errorDomain];
      NSErrorUserInfoKey v77 = NSLocalizedDescriptionKey;
      CFStringRef v78 = @"Timed out waiting for personalization response.";
      long long v45 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
      id v46 = [v43 initWithDomain:v44 code:52 userInfo:v45];
      long long v47 = *(void **)(v75[0] + 40);
      *(void *)(v75[0] + 40) = v46;

LABEL_17:
LABEL_18:

      break;
    }
    uint64_t v34 = [(SHFUDevice *)self waitForSecureFWReenumeration];
    NSErrorUserInfoKey v35 = *(void **)(v75[0] + 40);
    *(void *)(v75[0] + 40) = v34;

    if (*(void *)(v75[0] + 40)) {
      goto LABEL_17;
    }

    ++v21;
  }
  if (*(void *)(v75[0] + 40)) {
    goto LABEL_20;
  }
  long long v50 = [(SHFUDevice *)self R1FWVersion];
  BOOL v51 = [v50 unsignedIntValue] == 1;

  if (!v51) {
    goto LABEL_24;
  }
  if (*(void *)(v75[0] + 40))
  {
LABEL_20:
    long long v48 = [(SHFUDevice *)self logHandle];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_100017C4C((uint64_t)v54, v48);
    }
  }
  else
  {
    long long v52 = [(SHFUDevice *)self R1FWVersion];
    BOOL v53 = [v52 unsignedIntValue] == 1;

    if (!v53) {
      goto LABEL_23;
    }
    long long v48 = [(SHFUDevice *)self logHandle];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_100017BCC(v48);
    }
  }

LABEL_23:
  [(SHFUDevice *)self resetSecureFW];
LABEL_24:
  id v39 = *(id *)(v75[0] + 40);

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(v72, 8);
  objc_destroyWeak(location);
  _Block_object_dispose(&v74, 8);

LABEL_25:
  return v39;
}

- (void)delayAfterInitReport
{
  if ([(SHFUDevice *)self initReportDelay])
  {
    uint64_t v3 = [(SHFUDevice *)self logHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100017EB4(self);
    }

    +[NSThread sleepForTimeInterval:(double)[(SHFUDevice *)self initReportDelay]];
    BOOL v4 = [(SHFUDevice *)self logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100017E38(self);
    }
  }
}

- (id)sendAllFirmwaresToDevice:(id)a3 totalPrepareBytes:(unint64_t)a4 bytesSent:(unint64_t *)a5 featureReportDelay:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (![(SHFUDevice *)self sendUberInitAndCommit]) {
    goto LABEL_4;
  }
  __int16 v32 = -17213;
  uint64_t v12 = [(SHFUDevice *)self setReportID:176 buffer:&v32 length:2];
  if (!v12) {
    goto LABEL_4;
  }
  uint64_t v13 = SHFUIOReturnString(v12);
  uint64_t v14 = +[NSString stringWithFormat:@"Uber init report ID 0x%02X failed with %@ for device %@", 176, v13, self];

  id v15 = objc_alloc((Class)NSError);
  uint64_t v16 = [(SHFUDevice *)self errorDomain];
  NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
  NSErrorUserInfoKey v35 = v14;
  uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  id v18 = [v15 initWithDomain:v16 code:24 userInfo:v17];

  if (!v18)
  {
LABEL_4:
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v19 = v10;
    id v20 = [v19 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v20)
    {
      id v21 = v20;
      id v27 = v10;
      uint64_t v22 = *(void *)v29;
LABEL_6:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        dispatch_semaphore_t v24 = *(void **)(*((void *)&v28 + 1) + 8 * v23);
        if ([(SHFUDevice *)self shouldInstallFW:v24 personalizationAllowed:0])
        {
          CFStringRef v25 = [v24 payload];
          id v18 = [(SHFUDevice *)self sendSingleFirmwareToDevice:v25 totalPrepareBytes:a4 bytesSent:a5 featureReportDelay:v11];

          if (v18) {
            break;
          }
        }
        if (v21 == (id)++v23)
        {
          id v21 = [v19 countByEnumeratingWithState:&v28 objects:v33 count:16];
          if (v21) {
            goto LABEL_6;
          }
          id v18 = 0;
          break;
        }
      }
      id v10 = v27;
    }
    else
    {
      id v18 = 0;
    }
  }
  return v18;
}

+ (BOOL)ignoreVersionCheck
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"UpdateCurrentVersion"];

  return v3;
}

+ (void)setIgnoreVersionCheck:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  BOOL v4 = +[NSNumber numberWithBool:v3];
  [v5 setObject:v4 forKey:@"UpdateCurrentVersion"];
}

+ (id)sendAllFirmwaresToDeviceWithVendorID:(id)a3 productID:(id)a4 hasPowerSource:(BOOL)a5 parsers:(id)a6 totalPrepareBytes:(unint64_t)a7 bytesSent:(unint64_t *)a8 featureReportDelay:(id)a9 logHandle:(id)a10 pluginDelegate:(id)a11 errorDomain:(id)a12
{
  LOBYTE(v13) = 1;
  return +[SHFUDevice sendAllFirmwaresToDeviceWithVendorID:a3 productID:a4 interfaceNum:0 hasPowerSource:a5 parsers:a6 totalPrepareBytes:a7 bytesSent:a8 featureReportDelay:a9 waitForRenumeration:v13 logHandle:a10 pluginDelegate:a11 errorDomain:a12];
}

+ (id)sendAllFirmwaresToDeviceWithVendorID:(id)a3 productID:(id)a4 interfaceNum:(id)a5 hasPowerSource:(BOOL)a6 parsers:(id)a7 totalPrepareBytes:(unint64_t)a8 bytesSent:(unint64_t *)a9 featureReportDelay:(id)a10 waitForRenumeration:(BOOL)a11 logHandle:(id)a12 pluginDelegate:(id)a13 errorDomain:(id)a14
{
  BOOL v60 = a6;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a7;
  id v69 = a10;
  id v62 = a12;
  id v61 = a13;
  id v66 = a14;
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
  uint64_t v23 = IONotificationPortCreate(kIOMasterPortDefault);
  io_iterator_t notification = 0;
  dispatch_semaphore_t v24 = dispatch_queue_create("com.apple.StandaloneHIDFudPlugins.newDeviceMatch", 0);
  dispatch_set_context(v24, v22);
  dispatch_set_finalizer_f(v24, (dispatch_function_t)j__dispatch_semaphore_signal);
  IONotificationPortSetDispatchQueue(v23, v24);
  CFMutableDictionaryRef v25 = IOServiceMatching("IOHIDDevice");
  long long v64 = v17;
  [(__CFDictionary *)v25 setObject:v17 forKeyedSubscript:@"VendorID"];
  long long v63 = v18;
  [(__CFDictionary *)v25 setObject:v18 forKeyedSubscript:@"ProductID"];
  [(__CFDictionary *)v25 setObject:&off_100026A00 forKeyedSubscript:@"PrimaryUsagePage"];
  [(__CFDictionary *)v25 setObject:&off_100026A18 forKeyedSubscript:@"PrimaryUsage"];
  CFDictionaryRef v54 = v25;
  dsema = v21;
  if (!IOServiceAddMatchingNotification(v23, "IOServiceFirstMatch", v54, (IOServiceMatchingCallback)sub_1000121C8, v21, &notification)&& notification)
  {
    while (IOIteratorNext(notification))
      ;
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = v20;
  id v59 = [obj countByEnumeratingWithState:&v75 objects:v83 count:16];
  if (!v59)
  {
    NSErrorUserInfoKey v38 = 0;
    goto LABEL_39;
  }
  uint64_t v58 = *(void *)v76;
  id v55 = v19;
  long long v52 = v23;
  BOOL v53 = v22;
  BOOL v51 = v24;
  do
  {
    for (i = 0; i != v59; i = (char *)i + 1)
    {
      if (*(void *)v76 != v58) {
        objc_enumerationMutation(obj);
      }
      id v27 = *(void **)(*((void *)&v75 + 1) + 8 * i);
      id v28 = [v64 intValue];
      id v29 = [v63 intValue];
      uint64_t v30 = SHFU_UNKNOWN_LOCATION_ID;
      if (v19) {
        unsigned int v31 = [v19 unsignedIntValue];
      }
      else {
        unsigned int v31 = SHFU_UNKNOWN_INTERFACE_NUMBER;
      }
      id v74 = 0;
      LODWORD(v50) = v31;
      __int16 v32 = +[SHFUDevice getDevices:v61 hasPowerSource:v60 logHandle:v62 withVendorID:v28 productID:v29 locationID:v30 interfaceNumber:v50 errorDomain:v66 error:&v74];
      id v33 = v74;
      if (v33)
      {
        NSErrorUserInfoKey v38 = v33;
        id v56 = v32;
        goto LABEL_37;
      }
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v34 = v32;
      id v35 = [v34 countByEnumeratingWithState:&v70 objects:v82 count:16];
      if (!v35)
      {

        goto LABEL_33;
      }
      id v36 = v35;
      id v56 = v32;
      unsigned __int8 v65 = i;
      char v37 = 0;
      NSErrorUserInfoKey v38 = 0;
      uint64_t v39 = *(void *)v71;
      while (2)
      {
        for (j = 0; j != v36; j = (char *)j + 1)
        {
          if (*(void *)v71 != v39) {
            objc_enumerationMutation(v34);
          }
          int8x16_t v41 = *(void **)(*((void *)&v70 + 1) + 8 * (void)j);
          if ([v41 shouldInstallFW:v27 personalizationAllowed:0])
          {
            long long v42 = [v27 payload];
            id v43 = [v41 sendSingleFirmwareToDevice:v42 totalPrepareBytes:a8 bytesSent:a9 featureReportDelay:v69];

            if (v43)
            {
              if ((v37 & 1) == 0)
              {
                id v44 = v43;

                char v37 = 0;
                NSErrorUserInfoKey v38 = v44;
LABEL_25:

                continue;
              }
            }
            else
            {
              [v41 reset];
              if (a11)
              {
                dispatch_time_t v45 = dispatch_time(0, 60000000000);
                if (dispatch_semaphore_wait(dsema, v45))
                {
                  id v46 = objc_alloc((Class)NSError);
                  NSErrorUserInfoKey v80 = NSLocalizedDescriptionKey;
                  CFStringRef v81 = @"No devices enumerated";
                  long long v47 = +[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
                  id v48 = [v46 initWithDomain:v66 code:0 userInfo:v47];

                  NSErrorUserInfoKey v38 = v48;
                  goto LABEL_30;
                }
              }
            }
            char v37 = 1;
            goto LABEL_25;
          }
        }
        id v36 = [v34 countByEnumeratingWithState:&v70 objects:v82 count:16];
        if (v36) {
          continue;
        }
        break;
      }
LABEL_30:

      id v19 = v55;
      i = v65;
      if (v38)
      {
LABEL_37:

        uint64_t v23 = v52;
        dispatch_semaphore_t v22 = v53;
        dispatch_semaphore_t v24 = v51;
        goto LABEL_39;
      }
LABEL_33:
    }
    NSErrorUserInfoKey v38 = 0;
    uint64_t v23 = v52;
    dispatch_semaphore_t v22 = v53;
    dispatch_semaphore_t v24 = v51;
    id v59 = [obj countByEnumeratingWithState:&v75 objects:v83 count:16];
  }
  while (v59);
LABEL_39:

  +[NSThread sleepForTimeInterval:5.0];
  if (notification)
  {
    IOObjectRelease(notification);
    io_iterator_t notification = 0;
  }
  IONotificationPortSetDispatchQueue(v23, 0);
  if (v23) {
    IONotificationPortDestroy(v23);
  }

  dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  return v38;
}

- (unint64_t)getTotalFirmwareBytes:(id)a3
{
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 personalizationRequired] & 1) == 0)
        {
          id v10 = [v9 payload];
          v6 += (unint64_t)[v10 length];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)commitAllFirmwares
{
  if (![(SHFUDevice *)self sendUberInitAndCommit]) {
    goto LABEL_4;
  }
  __int16 v11 = -17213;
  uint64_t v3 = [(SHFUDevice *)self setReportID:178 buffer:&v11 length:2];
  if (!v3) {
    goto LABEL_4;
  }
  id v4 = SHFUIOReturnString(v3);
  id v5 = +[NSString stringWithFormat:@"Set uber commit report ID 0x%02X failed with %@ for device %@", 178, v4, self];

  id v6 = objc_alloc((Class)NSError);
  uint64_t v7 = [(SHFUDevice *)self errorDomain];
  NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
  long long v13 = v5;
  id v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v9 = [v6 initWithDomain:v7 code:26 userInfo:v8];

  if (!v9)
  {
LABEL_4:
    [(SHFUDevice *)self reset];
    id v9 = 0;
  }
  return v9;
}

- (void)reset
{
}

- (void)resetSecureFW
{
  v2[0] = 1;
  v2[1] = 1;
  [(SHFUDevice *)self setReportID:189 buffer:v2 length:4];
}

- (BOOL)GATTServicesDiscoveryNeeded
{
  uint64_t v3 = [(SHFUDevice *)self fwVersions];
  id v4 = [v3 objectForKeyedSubscript:&off_100026A48];
  unsigned __int16 v5 = (unsigned __int16)[v4 unsignedIntValue];

  BOOL v6 = [(SHFUDevice *)self productID] == 788 && v5 < 0x80u
    || [(SHFUDevice *)self productID] == 789 && v5 < 0x30u;
  id v8 = [(SHFUDevice *)self logHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109632;
    v10[1] = [(SHFUDevice *)self productID];
    __int16 v11 = 1024;
    int v12 = v5;
    __int16 v13 = 1024;
    BOOL v14 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "PID 0x%04X ST FW version 0x%04X GATT service discovery needed %d", (uint8_t *)v10, 0x14u);
  }

  return v6;
}

- (id)latestFirmwareForHardware:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = +[NSString stringWithFormat:@"%u", [(SHFUDevice *)self hardwareVersion]];
  BOOL v6 = +[NSString stringWithFormat:@"%u", 0xFFFFLL];
  uint64_t v7 = [v4 objectForKeyedSubscript:v5];
  if (v7)
  {
  }
  else
  {
    int v12 = [v4 objectForKeyedSubscript:v6];

    if (v12)
    {
      __int16 v11 = [v4 objectForKeyedSubscript:v6];
      id v8 = +[NSMutableDictionary dictionaryWithDictionary:v11];
      goto LABEL_8;
    }
  }
  id v8 = [v4 objectForKeyedSubscript:v5];

  if (v8)
  {
    id v9 = [v4 objectForKeyedSubscript:v5];
    id v8 = +[NSMutableDictionary dictionaryWithDictionary:v9];

    id v10 = [v4 objectForKeyedSubscript:v6];

    if (v10)
    {
      __int16 v11 = [v4 objectForKeyedSubscript:v6];
      [v8 addEntriesFromDictionary:v11];
LABEL_8:
    }
  }

  return v8;
}

- (BOOL)hardwareVersionSupportedBy:(id)a3
{
  uint64_t v3 = [(SHFUDevice *)self latestFirmwareForHardware:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)firmwareVersionsOlderThan:(id)a3
{
  BOOL v4 = [(SHFUDevice *)self latestFirmwareForHardware:a3];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (!v5) {
    goto LABEL_19;
  }
  id v7 = v5;
  char v26 = 0;
  uint64_t v8 = *(void *)v28;
  *(void *)&long long v6 = 138412546;
  long long v25 = v6;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v28 != v8) {
        objc_enumerationMutation(v4);
      }
      id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      __int16 v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v10, "intValue", v25));
      int v12 = [(SHFUDevice *)self fwVersions];
      __int16 v13 = [v12 objectForKeyedSubscript:v11];
      unsigned int v14 = [v13 unsignedIntValue];

      long long v15 = [v4 objectForKeyedSubscript:v10];
      unsigned int v16 = [v15 unsignedIntValue];

      if (v14)
      {
        id v17 = [(SHFUDevice *)self logHandle];
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
        if (v14 >= v16)
        {
          if (v18)
          {
            dispatch_semaphore_t v21 = +[AUFileParser auTypeString:](AUFileParser, "auTypeString:", [v11 unsignedIntValue]);
            *(_DWORD *)buf = 138412802;
            __int16 v32 = v21;
            __int16 v33 = 1024;
            LODWORD(v34[0]) = v14;
            WORD2(v34[0]) = 1024;
            *(_DWORD *)((char *)v34 + 6) = v16;
            _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%@ has version 0x%x equal (or newer) than version 0x%x", buf, 0x18u);
          }
        }
        else
        {
          if (v18)
          {
            id v20 = +[AUFileParser auTypeString:](AUFileParser, "auTypeString:", [v11 unsignedIntValue]);
            *(_DWORD *)buf = 138412802;
            __int16 v32 = v20;
            __int16 v33 = 1024;
            LODWORD(v34[0]) = v14;
            WORD2(v34[0]) = 1024;
            *(_DWORD *)((char *)v34 + 6) = v16;
            _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%@ has version 0x%x older than version 0x%x", buf, 0x18u);
          }
          char v26 = 1;
        }
      }
      else
      {
        id v17 = [(SHFUDevice *)self logHandle];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v19 = +[AUFileParser auTypeString:](AUFileParser, "auTypeString:", [v11 unsignedIntValue]);
          *(_DWORD *)buf = v25;
          __int16 v32 = v19;
          __int16 v33 = 2112;
          v34[0] = self;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ does not have a version number reported by %@", buf, 0x16u);
        }
      }
    }
    id v7 = [v4 countByEnumeratingWithState:&v27 objects:v35 count:16];
  }
  while (v7);
  if (v26)
  {
    BOOL v22 = 1;
  }
  else
  {
LABEL_19:
    uint64_t v23 = [(SHFUDevice *)self logHandle];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_100017F30();
    }

    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)firmwareVersionsEqualTo:(id)a3
{
  BOOL v4 = [(SHFUDevice *)self latestFirmwareForHardware:a3];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (!v5)
  {
LABEL_19:
    BOOL v21 = 1;
    goto LABEL_23;
  }
  id v7 = v5;
  uint64_t v8 = *(void *)v27;
  char v25 = 1;
  *(void *)&long long v6 = 138412546;
  long long v24 = v6;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v27 != v8) {
        objc_enumerationMutation(v4);
      }
      id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      __int16 v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v10, "intValue", v24));
      int v12 = [(SHFUDevice *)self fwVersions];
      __int16 v13 = [v12 objectForKeyedSubscript:v11];
      unsigned int v14 = [v13 unsignedIntValue];

      long long v15 = [v4 objectForKeyedSubscript:v10];
      unsigned int v16 = [v15 unsignedIntValue];

      if (!v14)
      {
        id v17 = [(SHFUDevice *)self logHandle];
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        id v19 = +[AUFileParser auTypeString:](AUFileParser, "auTypeString:", [v11 unsignedIntValue]);
        *(_DWORD *)buf = v24;
        unsigned int v31 = v19;
        __int16 v32 = 2112;
        v33[0] = self;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ does not have a version number reported by %@", buf, 0x16u);
        goto LABEL_12;
      }
      id v17 = [(SHFUDevice *)self logHandle];
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
      if (v14 == v16)
      {
        if (!v18) {
          goto LABEL_16;
        }
        id v19 = +[AUFileParser auTypeString:](AUFileParser, "auTypeString:", [v11 unsignedIntValue]);
        *(_DWORD *)buf = 138412802;
        unsigned int v31 = v19;
        __int16 v32 = 1024;
        LODWORD(v33[0]) = v14;
        WORD2(v33[0]) = 1024;
        *(_DWORD *)((char *)v33 + 6) = v14;
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%@ has version 0x%x equal to version 0x%x", buf, 0x18u);
LABEL_12:

        goto LABEL_16;
      }
      if (v18)
      {
        id v20 = +[AUFileParser auTypeString:](AUFileParser, "auTypeString:", [v11 unsignedIntValue]);
        *(_DWORD *)buf = 138412802;
        unsigned int v31 = v20;
        __int16 v32 = 1024;
        LODWORD(v33[0]) = v14;
        WORD2(v33[0]) = 1024;
        *(_DWORD *)((char *)v33 + 6) = v16;
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%@ has version 0x%x not equal to version 0x%x", buf, 0x18u);
      }
      char v25 = 0;
LABEL_16:
    }
    id v7 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
  }
  while (v7);
  if (v25) {
    goto LABEL_19;
  }
  BOOL v22 = [(SHFUDevice *)self logHandle];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_100017F64();
  }

  BOOL v21 = 0;
LABEL_23:

  return v21;
}

- (id)sendSingleFirmwareToDevice:(id)a3 totalPrepareBytes:(unint64_t)a4 bytesSent:(unint64_t *)a5 featureReportDelay:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  __int16 v11 = [(SHFUDevice *)self logHandle];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100017F98(v11, v12, v13, v14, v15, v16, v17, v18);
  }

  unsigned __int16 v19 = [(SHFUDevice *)self writeBufferSize] - 1;
  __int16 v105 = 29282;
  v103 = self;
  if ([(SHFUDevice *)self sendOffsets]) {
    uint64_t v20 = 3;
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v21 = 4096;
  if (v19) {
    uint64_t v21 = (unsigned __int16)(0x1000u / v19 * v19);
  }
  unint64_t v100 = v21;
  v101 = (char *)v19;
  uint64_t v102 = v20;
  v97 = v10;
  v98 = a5;
  if (v20 + v19 && (BOOL v22 = malloc_type_malloc(v20 + v19, 0xB202ADC8uLL)) != 0)
  {
    uint64_t v23 = v22;
    uint64_t v24 = [(SHFUDevice *)self setReportID:176 buffer:&v105 length:2];
    if (!v24)
    {
      [(SHFUDevice *)self delayAfterInitReport];
      char v33 = 0;
      goto LABEL_16;
    }
    char v25 = SHFUIOReturnString(v24);
    long long v26 = +[NSString stringWithFormat:@"Regular init report ID 0x%02X failed with %@ for device %@", 176, v25, self];

    id v27 = v9;
    id v28 = objc_alloc((Class)NSError);
    long long v29 = [(SHFUDevice *)self errorDomain];
    NSErrorUserInfoKey v149 = NSLocalizedDescriptionKey;
    v150 = v26;
    long long v30 = +[NSDictionary dictionaryWithObjects:&v150 forKeys:&v149 count:1];
    unsigned int v31 = v28;
    id v9 = v27;
    id v32 = [v31 initWithDomain:v29 code:25 userInfo:v30];
    char v33 = 0;
  }
  else
  {
    long long v26 = +[NSString stringWithFormat:@"Ran out of memory for device %@", self];
    id v34 = objc_alloc((Class)NSError);
    long long v29 = [(SHFUDevice *)self errorDomain];
    NSErrorUserInfoKey v151 = NSLocalizedDescriptionKey;
    v152 = v26;
    char v33 = 1;
    long long v30 = +[NSDictionary dictionaryWithObjects:&v152 forKeys:&v151 count:1];
    id v32 = [v34 initWithDomain:v29 code:31 userInfo:v30];
    uint64_t v23 = 0;
  }

  if (v32) {
    goto LABEL_55;
  }
LABEL_16:
  uint64_t v35 = 0;
  unint64_t v36 = 0;
  char v37 = v101;
  v99 = &v23[v102];
  NSErrorUserInfoKey v38 = v98;
  v95 = v23;
  id v96 = v9;
  while (v36 < (unint64_t)[v9 length])
  {
    if (!(v36 % v100))
    {
      uint64_t v39 = [(SHFUDevice *)v103 logHandle];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        id v40 = [v9 length];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v40;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "wrote %lu bytes out of %lu", buf, 0x16u);
      }

      if (v38)
      {
        double v41 = (double)(100 * *v38 / a4);
        long long v42 = [(SHFUDevice *)v103 delegate];
        [v42 progress:v41];
      }
    }
    if (&v37[v36] > [v9 length])
    {
      id v43 = (char *)[v9 length];
      if (v43 == (char *)v36) {
        break;
      }
      char v37 = &v43[v35];
    }
    if ([(SHFUDevice *)v103 sendOffsets])
    {
      unsigned char *v23 = BYTE2(v36);
      v23[1] = BYTE1(v36);
      v23[2] = v36;
    }
    objc_msgSend(v9, "getBytes:range:", v99, v36, v37);
    uint64_t v44 = [(SHFUDevice *)v103 setReportID:177 buffer:v23 length:&v37[v102]];
    if (v44)
    {
      uint64_t v45 = v44;
      id v46 = [(SHFUDevice *)v103 logHandle];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        id v61 = [v9 length];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v61;
        _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "wrote %lu bytes out of %lu", buf, 0x16u);
      }

      long long v47 = +[NSData dataWithBytes:v23 length:&v37[v102]];
      id v48 = [(SHFUDevice *)v103 logHandle];
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v47;
        _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Failed feature report buffer: %@", buf, 0xCu);
      }

      long long v147 = 0u;
      long long v148 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      long long v139 = 0u;
      long long v140 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      memset(buf, 0, sizeof(buf));
      unsigned int v104 = 512;
      unsigned int v49 = [(SHFUDevice *)v103 getReportID:178 buffer:buf length:&v104];
      unsigned int v50 = v104;
      int v51 = buf[0];
      uint64_t v52 = SHFUIOReturnString(v45);
      BOOL v53 = (void *)v52;
      if (v49 || v50 != 1 || v51 == 161 || v51 == 177)
      {
        CFDictionaryRef v54 = v103;
        id v56 = +[NSString stringWithFormat:@"Write report ID 0x%02X failed with %@ for device %@", 177, v52, v103];
      }
      else
      {
        CFDictionaryRef v54 = v103;
        id v55 = [(SHFUDevice *)v103 auErrorString:buf[0]];
        id v56 = +[NSString stringWithFormat:@"Write report ID 0x%02X failed with %@ (%@) for device %@", 177, v53, v55, v103];
      }
      id v58 = objc_alloc((Class)NSError);
      id v59 = [(SHFUDevice *)v54 errorDomain];
      NSErrorUserInfoKey v116 = NSLocalizedDescriptionKey;
      v117 = v56;
      BOOL v60 = +[NSDictionary dictionaryWithObjects:&v117 forKeys:&v116 count:1];
      id v32 = [v58 initWithDomain:v59 code:32 userInfo:v60];

      uint64_t v23 = v95;
      id v9 = v96;
      NSErrorUserInfoKey v38 = v98;
    }
    else
    {
      if (v38) {
        *v38 += (unint64_t)v37;
      }
      [v97 doubleValue];
      if (v57 > 0.0)
      {
        [v97 doubleValue];
        +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:");
      }
      id v32 = 0;
    }
    v36 += (unint64_t)v101;
    v35 -= (uint64_t)v101;
    if (v32) {
      goto LABEL_55;
    }
  }
  id v62 = [(SHFUDevice *)v103 logHandle];
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    id v63 = [v9 length];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v63;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "wrote %lu bytes successfully.", buf, 0xCu);
  }
  long long v64 = v23;

  unsigned int v65 = 0;
  do
  {
    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    memset(buf, 0, sizeof(buf));
    uint64_t v66 = [(SHFUDevice *)v103 setReportID:178 buffer:buf length:1];
    if (v65 > 2) {
      break;
    }
    ++v65;
  }
  while (v66 == -536870186);
  if (v66)
  {
    long long v67 = SHFUIOReturnString(v66);
    uint64_t v68 = +[NSString stringWithFormat:@"Set regular commit report ID 0x%02X failed with %@ for device %@", 178, v67, v103];

    id v69 = objc_alloc((Class)NSError);
    long long v70 = [(SHFUDevice *)v103 errorDomain];
    NSErrorUserInfoKey v114 = NSLocalizedDescriptionKey;
    v115 = v68;
    long long v71 = +[NSDictionary dictionaryWithObjects:&v115 forKeys:&v114 count:1];
    id v32 = [v69 initWithDomain:v70 code:27 userInfo:v71];

    if (v32)
    {
      uint64_t v23 = v64;
LABEL_55:
      if (v33) {
        goto LABEL_57;
      }
      goto LABEL_56;
    }
  }
  long long v73 = +[NSDate dateWithTimeIntervalSinceNow:300.0];
  while (1)
  {
    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    memset(buf, 0, sizeof(buf));
    unsigned int v104 = 512;
    uint64_t v74 = [(SHFUDevice *)v103 getReportID:178 buffer:buf length:&v104];
    if (v74)
    {
      NSErrorUserInfoKey v83 = SHFUIOReturnString(v74);
      CFStringRef v84 = +[NSString stringWithFormat:@"Get regular commit report ID 0x%02X failed with %@ for device %@", 178, v83, v103];

      id v85 = objc_alloc((Class)NSError);
      v86 = [(SHFUDevice *)v103 errorDomain];
      NSErrorUserInfoKey v108 = NSLocalizedDescriptionKey;
      v109 = v84;
      v87 = +[NSDictionary dictionaryWithObjects:&v109 forKeys:&v108 count:1];
      v88 = v85;
      v89 = v86;
      uint64_t v90 = 28;
      goto LABEL_71;
    }
    if (v104 != 1)
    {
      CFStringRef v84 = +[NSString stringWithFormat:@"Get regular commit report ID 0x%02X returned invalid payload length %u for device %@", 178, v104, v103];
      id v91 = objc_alloc((Class)NSError);
      v86 = [(SHFUDevice *)v103 errorDomain];
      NSErrorUserInfoKey v112 = NSLocalizedDescriptionKey;
      v113 = v84;
      v87 = +[NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
      v88 = v91;
      v89 = v86;
      uint64_t v90 = 29;
      goto LABEL_71;
    }
    uint64_t v75 = buf[0];
    if (buf[0] != 1) {
      break;
    }
    +[NSThread sleepForTimeInterval:1.0];
    long long v76 = +[NSDate date];
    id v77 = [v76 compare:v73];

    if (v77 != (id)-1)
    {
      long long v78 = [(SHFUDevice *)v103 auErrorString:1];
      v79 = +[NSString stringWithFormat:@"Get regular commit report ID 0x%02X returned invalid payload contents 0x%02X %@ for device %@", 178, 1, v78, v103];

      id v80 = objc_alloc((Class)NSError);
      CFStringRef v81 = [(SHFUDevice *)v103 errorDomain];
      NSErrorUserInfoKey v106 = NSLocalizedDescriptionKey;
      v107 = v79;
      CFStringRef v82 = +[NSDictionary dictionaryWithObjects:&v107 forKeys:&v106 count:1];
      id v32 = [v80 initWithDomain:v81 code:30 userInfo:v82];

      goto LABEL_72;
    }
  }
  if (buf[0] == 161)
  {
    id v32 = 0;
    goto LABEL_72;
  }
  v92 = [(SHFUDevice *)v103 auErrorString:buf[0]];
  CFStringRef v84 = +[NSString stringWithFormat:@"Get regular commit report ID 0x%02X returned invalid payload contents 0x%02X %@ for device %@", 178, v75, v92, v103];

  id v93 = objc_alloc((Class)NSError);
  v86 = [(SHFUDevice *)v103 errorDomain];
  NSErrorUserInfoKey v110 = NSLocalizedDescriptionKey;
  v111 = v84;
  v87 = +[NSDictionary dictionaryWithObjects:&v111 forKeys:&v110 count:1];
  v88 = v93;
  v89 = v86;
  uint64_t v90 = 30;
LABEL_71:
  id v32 = [v88 initWithDomain:v89 code:v90 userInfo:v87];

LABEL_72:
  uint64_t v23 = v64;
  if ((v33 & 1) == 0) {
LABEL_56:
  }
    free(v23);
LABEL_57:

  return v32;
}

- (int)getReportID:(unsigned __int8)a3 buffer:(char *)a4 length:(unsigned int *)a5
{
  unsigned int v7 = a3;
  deviceRef = self->_deviceRef;
  id v9 = [(SHFUDevice *)self logHandle];
  LODWORD(a5) = sub_10000ED1C(v7, a4, a5, deviceRef, v9);

  return (int)a5;
}

- (int)setReportID:(unsigned __int8)a3 buffer:(char *)a4 length:(unsigned int)a5
{
  unsigned int v6 = a3;
  uint64_t v8 = 3758097090;
  if (a4 || !a5)
  {
    if (a5 <= 0x200)
    {
      report[0] = a3;
      if (a4 && a5) {
        __memmove_chk();
      }
      uint64_t v8 = IOHIDDeviceSetReport(self->_deviceRef, kIOHIDReportTypeFeature, v6, report, a5 + 1);
    }
    else
    {
      uint64_t v8 = 3758097128;
    }
  }
  if (v6 != 179 && v8)
  {
    id v9 = +[NSData dataWithBytes:report length:a5 + 1];
    id v10 = [(SHFUDevice *)self logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = SHFUIOReturnString(v8);
      v13[0] = 67109890;
      v13[1] = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 1024;
      int v17 = v8;
      __int16 v18 = 2112;
      unsigned __int16 v19 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "reportID 0x%02X payload %@ error 0x%08X %@", (uint8_t *)v13, 0x22u);
    }
  }
  return v8;
}

- (id)auErrorString:(unsigned __int8)a3
{
  if ((int)a3 > 111)
  {
    if ((int)a3 > 160)
    {
      if ((int)a3 > 176)
      {
        if (a3 == 177) {
          return @"kAUErrorInvalidOperation";
        }
        if (a3 == 255) {
          return @"kAUErrorUnknown";
        }
      }
      else
      {
        if (a3 == 161) {
          return @"kAUErrorSuccessKey";
        }
        if (a3 == 176) {
          return @"kAUErrorInitKeyIncorrect";
        }
      }
      return @"Invalid Error";
    }
    else
    {
      switch(a3)
      {
        case 0x70u:
          id result = @"kAUErrorSigInvalid";
          break;
        case 0x71u:
          id result = @"kAUErrorSigDigestMismatch";
          break;
        case 0x72u:
          id result = @"kAUErrorSigInfoInvalid";
          break;
        case 0x73u:
          id result = @"kAUErrorSigBadMagic";
          break;
        case 0x74u:
          id result = @"kAUErrorSigVerUnsupported";
          break;
        case 0x75u:
          id result = @"kAUErrorSigBadDigestInfo";
          break;
        case 0x76u:
          id result = @"kAUErrorSigBadSigInfo";
          break;
        case 0x77u:
          id result = @"kAUErrorNotSigned";
          break;
        case 0x80u:
          id result = @"kAUErrorNotPersonalized";
          break;
        case 0x81u:
          id result = @"kAUErrorPersVerUnsupported";
          break;
        case 0x82u:
          id result = @"kAUErrorPersUDIDMismatch";
          break;
        case 0x83u:
          id result = @"kAUErrorPersBadMagic";
          break;
        default:
          return @"Invalid Error";
      }
    }
  }
  else
  {
    id result = @"kAUErrorNone";
    switch(a3)
    {
      case 0u:
        return result;
      case 1u:
        id result = @"kAUErrorAccessoryBusy";
        break;
      case 2u:
        id result = @"kAUErrorReadFailure";
        break;
      case 3u:
        id result = @"kAUErrorStoreFailure";
        break;
      case 4u:
        id result = @"kAUErrorEraseFailure";
        break;
      case 5u:
        id result = @"kAUErrorLowBattery";
        break;
      case 6u:
      case 7u:
      case 8u:
      case 9u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
      case 0xDu:
      case 0xEu:
      case 0xFu:
        return @"Invalid Error";
      case 0x10u:
        id result = @"kAUErrorHdrSigInvalid";
        break;
      case 0x11u:
        id result = @"kAUErrorHdrVerUnsupported";
        break;
      case 0x12u:
        id result = @"kAUErrorHdrCRCMismatch";
        break;
      case 0x13u:
        id result = @"kAUErrorPayloadTypeInvalid";
        break;
      case 0x14u:
        id result = @"kAUErrorPayloadVerDowngrade";
        break;
      case 0x15u:
        id result = @"kAUErrorPayloadSizeInvalid";
        break;
      case 0x16u:
        id result = @"kAUErrorPayloadCRCMismatch";
        break;
      case 0x17u:
        id result = @"kAUErrorPayloadPIDMismatch";
        break;
      case 0x18u:
        id result = @"kAUErrorPayloadHWIDMismatch";
        break;
      case 0x19u:
        id result = @"kAUErrorHeaderIncomplete";
        break;
      case 0x1Au:
        id result = @"kAUErrorPayloadMinVersion";
        break;
      default:
        if (a3 != 64) {
          return @"Invalid Error";
        }
        id result = @"kAUErrorInvalidRegion";
        break;
    }
  }
  return result;
}

- (NSMutableDictionary)fwVersions
{
  fwVersions = self->_fwVersions;
  if (!fwVersions)
  {
    unsigned int v24 = 512;
    memset(v33, 0, sizeof(v33));
    if ([(SHFUDevice *)self productID] == 629)
    {
      if (![(SHFUDevice *)self getReportID:16 buffer:v33 length:&v24]
        && v24 >= 9
        && LOBYTE(v33[0]) == 2)
      {
        BOOL v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v5 = self->_fwVersions;
        self->_fwVersions = v4;

        uint64_t v6 = *(unsigned __int16 *)((char *)v33 + 5);
        unsigned int v7 = +[NSNumber numberWithUnsignedShort:*(unsigned __int16 *)((char *)v33 + 5)];
        [(NSMutableDictionary *)self->_fwVersions setObject:v7 forKeyedSubscript:&off_100026A48];

        uint64_t v8 = [(SHFUDevice *)self logHandle];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          sub_100018010(v6, v8);
        }
      }
    }
    else
    {
      if ([(SHFUDevice *)self useFWUpdateReportIDs]) {
        uint64_t v9 = 187;
      }
      else {
        uint64_t v9 = 206;
      }
      if (![(SHFUDevice *)self getReportID:v9 buffer:v33 length:&v24])
      {
        id v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        __int16 v11 = self->_fwVersions;
        self->_fwVersions = v10;

        if ((v24 & 3) == 0)
        {
          unint64_t v14 = 4;
          *(void *)&long long v12 = 138413058;
          long long v23 = v12;
          do
          {
            uint64_t v15 = (unsigned __int16)v32[v14 / 2 + 1];
            int v16 = (unsigned __int16)v32[v14 / 2 + 2];
            int v17 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", (unsigned __int16)v32[v14 / 2 + 2], v23);
            __int16 v18 = self->_fwVersions;
            unsigned __int16 v19 = +[NSNumber numberWithUnsignedShort:v15];
            [(NSMutableDictionary *)v18 setObject:v17 forKeyedSubscript:v19];

            uint64_t v20 = [(SHFUDevice *)self logHandle];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              BOOL v22 = +[AUFileParser auTypeString:v15];
              *(_DWORD *)buf = v23;
              long long v26 = v22;
              __int16 v27 = 1024;
              int v28 = v15;
              __int16 v29 = 1024;
              int v30 = v16;
              __int16 v31 = 1024;
              *(_DWORD *)id v32 = v16;
              _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%@ (%d) version 0x%x (%d)", buf, 0x1Eu);
            }
            if ((v24 & 3) != 0) {
              break;
            }
            BOOL v21 = v14 > v24 - 4;
            v14 += 4;
          }
          while (!v21);
        }
      }
    }
    fwVersions = self->_fwVersions;
  }
  return fwVersions;
}

- (unsigned)hardwareVersion
{
  int hardwareVersion = self->_hardwareVersion;
  if (!hardwareVersion)
  {
    unsigned int v7 = 512;
    memset(v8, 0, sizeof(v8));
    if ([(SHFUDevice *)self productID] == 629)
    {
      if ([(SHFUDevice *)self getReportID:16 buffer:v8 length:&v7]
        || v7 < 9
        || LOBYTE(v8[0]) != 2)
      {
        goto LABEL_13;
      }
      BOOL v4 = (unsigned __int16 *)((char *)v8 + 7);
    }
    else
    {
      if ([(SHFUDevice *)self useFWUpdateReportIDs]) {
        uint64_t v5 = 188;
      }
      else {
        uint64_t v5 = 207;
      }
      BOOL v4 = (unsigned __int16 *)v8;
      if ([(SHFUDevice *)self getReportID:v5 buffer:v8 length:&v7] || v7 != 2) {
        goto LABEL_13;
      }
    }
    self->_int hardwareVersion = *v4;
LABEL_13:
    LOWORD(hardwareVersion) = self->_hardwareVersion;
  }
  return hardwareVersion;
}

- (BOOL)batteryIsCharging
{
  v2 = [(SHFUDevice *)self powerSource];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"Is Charging"];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (int)batteryCapacity
{
  v2 = [(SHFUDevice *)self powerSource];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"Current Capacity"];

  LODWORD(v2) = [v3 intValue];
  return (int)v2;
}

- (NSDictionary)powerSource
{
  BOOL v3 = [(SHFUDevice *)self productID] == 620
    || [(SHFUDevice *)self productID] == 615
    || [(SHFUDevice *)self productID] == 617
    || [(SHFUDevice *)self productID] == 613
    || [(SHFUDevice *)self productID] == 666
    || [(SHFUDevice *)self productID] == 668
    || [(SHFUDevice *)self productID] == 671
    || [(SHFUDevice *)self productID] == 803
    || [(SHFUDevice *)self productID] == 804
    || [(SHFUDevice *)self productID] == 800
    || [(SHFUDevice *)self productID] == 801
    || [(SHFUDevice *)self productID] == 802;
  if (![(SHFUDevice *)self hasPowerSource]
    || self->_powerSource
    || [(SHFUDevice *)self powerSourceTimedOut])
  {
    goto LABEL_16;
  }
  if (v3) {
    [(SHFUDevice *)self serialNumber];
  }
  else {
  uint64_t v6 = [(SHFUDevice *)self productName];
  }
  id v7 = [v6 length];

  if (!v7)
  {
LABEL_16:
    BOOL v4 = self->_powerSource;
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100014820;
    v19[3] = &unk_1000247D8;
    v19[4] = self;
    BOOL v20 = v3;
    uint64_t v8 = objc_retainBlock(v19);
    int out_token = 0;
    uint64_t v9 = [(SHFUDevice *)self serialQueue];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000149FC;
    handler[3] = &unk_100024800;
    handler[4] = self;
    id v10 = v8;
    id v17 = v10;
    uint32_t v11 = notify_register_dispatch("com.apple.system.accpowersources.attach", &out_token, v9, handler);

    if (!v11)
    {
      long long v12 = [(SHFUDevice *)self serialQueue];
      dispatch_async(v12, v10);

      dispatch_time_t v13 = dispatch_time(0, 15000000000);
      unint64_t v14 = [(SHFUDevice *)self powerSemaphore];
      [(SHFUDevice *)self setPowerSourceTimedOut:dispatch_semaphore_wait(v14, v13)];

      if ([(SHFUDevice *)self powerSourceTimedOut])
      {
        uint64_t v15 = [(SHFUDevice *)self logHandle];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_1000180E0();
        }
      }
      notify_cancel(out_token);
    }
    BOOL v4 = self->_powerSource;
  }
  return v4;
}

- (void)setPowerSource:(id)a3
{
}

- (FudPluginDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FudPluginDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_os_log)logHandle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logHandle);
  return (OS_os_log *)WeakRetained;
}

- (void)setLogHandle:(id)a3
{
}

- (unsigned)locationID
{
  return self->_locationID;
}

- (void)setLocationID:(unsigned int)a3
{
  self->_locationID = a3;
}

- (NSNumber)interfaceNum
{
  return self->_interfaceNum;
}

- (void)setInterfaceNum:(id)a3
{
}

- (NSString)deviceAddress
{
  return self->_deviceAddress;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSNumber)registryEntryID
{
  return self->_registryEntryID;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSString)className
{
  return self->_className;
}

- (void)setClassName:(id)a3
{
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
}

- (NSString)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (unsigned)productID
{
  return self->_productID;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)primaryUsage
{
  return self->_primaryUsage;
}

- (unsigned)primaryUsagePage
{
  return self->_primaryUsagePage;
}

- (BOOL)useFWUpdateReportIDs
{
  return self->_useFWUpdateReportIDs;
}

- (BOOL)sendOffsets
{
  return self->_sendOffsets;
}

- (BOOL)sendUberInitAndCommit
{
  return self->_sendUberInitAndCommit;
}

- (BOOL)hasPowerSource
{
  return self->_hasPowerSource;
}

- (unsigned)writeBufferSize
{
  return self->_writeBufferSize;
}

- (unsigned)updateFlags
{
  return self->_updateFlags;
}

- (unsigned)initReportDelay
{
  return self->_initReportDelay;
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 144, 1);
}

- (OS_dispatch_semaphore)powerSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 152, 1);
}

- (NSObject)personalizationObserver
{
  return self->_personalizationObserver;
}

- (void)setPersonalizationObserver:(id)a3
{
}

- (int64_t)powerSourceTimedOut
{
  return self->_powerSourceTimedOut;
}

- (void)setPowerSourceTimedOut:(int64_t)a3
{
  self->_powerSourceTimedOut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizationObserver, 0);
  objc_storeStrong((id *)&self->_powerSemaphore, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_registryEntryID, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
  objc_storeStrong((id *)&self->_interfaceNum, 0);
  objc_destroyWeak((id *)&self->_logHandle);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_powerSource, 0);
  objc_storeStrong((id *)&self->_fwVersions, 0);
}

@end