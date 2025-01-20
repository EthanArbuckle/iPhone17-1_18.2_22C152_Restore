@interface UARPMagSafeCable
+ (BOOL)isActive:(unsigned int)a3;
+ (BOOL)isAuthenticated:(unsigned int)a3;
+ (BOOL)needsAuthentication:(unsigned int)a3;
+ (const)authenticationStatusToString:(int)a3;
+ (id)matchingDictionary:(BOOL)a3;
+ (id)matchingDictionaryUSBCLightning:(id)a3 launchStream:(BOOL)a4;
+ (id)matchingDictionaryUSBCLightningDisconnectLaunchStream:(BOOL)a3;
+ (int)authenticationStatus:(unsigned int)a3;
+ (unint64_t)rid:(unsigned int)a3;
+ (unint64_t)sopPID:(unsigned int)a3;
+ (unint64_t)sopPrimePID:(unsigned int)a3;
+ (unint64_t)sopPrimeVID:(unsigned int)a3;
+ (unint64_t)sopVID:(unsigned int)a3;
+ (unint64_t)valueForService:(unsigned int)a3 key:(id)a4;
- (BOOL)accMode7AddressSpaceRead:(unsigned int)a3 buffer:(void *)a4 bufferLength:(unsigned int)a5 lengthRead:(unsigned int *)a6 error:(id *)a7;
- (BOOL)accMode7AddressSpaceWrite:(unsigned int)a3 buffer:(void *)a4 bufferLength:(unsigned int)a5 error:(id *)a6;
- (BOOL)accMode7FirmwareUpdateGetState:(accMode7FirmwareUpdateState2 *)a3 error:(id *)a4;
- (BOOL)accMode7FirmwareUpdateSendCommand:(unsigned int)a3 error:(id *)a4;
- (BOOL)clearLogs:(id *)a3;
- (BOOL)firmwareApply:(id *)a3;
- (BOOL)firmwareHasStagedAssets:(id *)a3;
- (BOOL)firmwareRescind:(id *)a3;
- (BOOL)firmwareUpdateAllowed:(id *)a3;
- (BOOL)firmwareUpdateCleanup:(id *)a3;
- (BOOL)firmwareUpdateInitialize:(id *)a3;
- (BOOL)firmwareUpdateWriteData:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (BOOL)firmwareVerifyStagedAsset:(id *)a3;
- (BOOL)isActive;
- (BOOL)isAuthenticated;
- (BOOL)isConnected;
- (BOOL)requiresAuthentication;
- (BOOL)setLogLevel:(unint64_t)a3 error:(id *)a4;
- (BOOL)solicitAnalytics:(id)a3 error:(id *)a4;
- (BOOL)solicitLogs:(id)a3 error:(id *)a4;
- (NSString)description;
- (UARPMagSafeCable)init;
- (UARPMagSafeCable)initWithHPM:(id)a3 service:(unsigned int)a4 location:(int64_t)a5;
- (id)activeFwVersion;
- (id)modelName;
- (id)querySerialNumber:(id *)a3;
- (id)serialNumber;
- (id)stagedFwVersion;
- (int)authenticationStatus;
- (unint64_t)productID;
- (unint64_t)routerID;
- (unint64_t)uarpMaxPayloadSize;
- (unint64_t)uarpPayloadWindowSize;
- (unint64_t)vendorID;
- (void)updateWithService:(unsigned int)a3;
@end

@implementation UARPMagSafeCable

- (UARPMagSafeCable)init
{
  return 0;
}

- (UARPMagSafeCable)initWithHPM:(id)a3 service:(unsigned int)a4 location:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UARPMagSafeCable;
  v10 = [(UARPMagSafeCable *)&v15 init];
  if (!v10) {
    goto LABEL_5;
  }
  os_log_t v11 = os_log_create("com.apple.accessoryupdater.uarp", "magSafeCable");
  log = v10->_log;
  v10->_log = (OS_os_log *)v11;

  objc_storeStrong((id *)&v10->_hpm, a3);
  v10->_location = a5;
  if (a5 != 2)
  {
    [(UARPMagSafeCable *)v10 updateWithService:v6];
LABEL_5:
    v13 = v10;
    goto LABEL_6;
  }
  v13 = 0;
LABEL_6:

  return v13;
}

- (void)updateWithService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_isActive = +[UARPMagSafeCable isActive:](UARPMagSafeCable, "isActive:");
  self->_routerID = (unsigned __int16)+[UARPMagSafeCable rid:v3];
  int64_t location = self->_location;
  if (location == 1)
  {
    self->_vendorID = (unsigned __int16)+[UARPMagSafeCable sopPrimeVID:v3];
    unsigned __int16 v6 = (unsigned __int16)+[UARPMagSafeCable sopPrimePID:v3];
    goto LABEL_5;
  }
  if (!location)
  {
    self->_vendorID = (unsigned __int16)+[UARPMagSafeCable sopVID:v3];
    unsigned __int16 v6 = (unsigned __int16)+[UARPMagSafeCable sopPID:v3];
LABEL_5:
    self->_productID = v6;
  }
  self->_requiresAuthentication = +[UARPMagSafeCable needsAuthentication:v3];
  self->_isAuthenticated = +[UARPMagSafeCable isAuthenticated:v3];
  self->_authenticationStatus = +[UARPMagSafeCable authenticationStatus:v3];
}

- (NSString)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", @"isActive = <%d>", self->_isActive);
  [v3 appendFormat:@", Router ID = <%lu>", self->_routerID];
  [v3 appendFormat:@", Location = <%s>", UARPAccessoryUSBPDLocationTypeToString()];
  [v3 appendFormat:@", Vendor ID = <0x%lx>", self->_vendorID];
  [v3 appendFormat:@", Product ID = <0x%lx>", self->_productID];
  [v3 appendFormat:@", Needs Auth = <%d>", self->_requiresAuthentication];
  [v3 appendFormat:@", Is Auth'd = <%d>", self->_isAuthenticated];
  [v3 appendFormat:@", Auth Status = <%s>", +[UARPMagSafeCable authenticationStatusToString:](UARPMagSafeCable, "authenticationStatusToString:", self->_authenticationStatus)];
  v4 = +[NSString stringWithString:v3];

  return (NSString *)v4;
}

- (BOOL)isConnected
{
  return [(UARPAppleHPM *)self->_hpm connected];
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (unint64_t)routerID
{
  return self->_routerID;
}

- (unint64_t)vendorID
{
  return self->_vendorID;
}

- (unint64_t)productID
{
  return self->_productID;
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (int)authenticationStatus
{
  return self->_authenticationStatus;
}

- (id)activeFwVersion
{
  int v13 = 0;
  if ([(UARPAppleHPM *)self->_hpm readCFUa:0 remoteEndpoint:1 offset:10240 buffer:&v14 bufferLength:24 lengthRead:&v13 error:0])
  {
    unint64_t v2 = ((unint64_t)v14 >> 24) & 0x7F;
    uint64_t v3 = BYTE2(v14);
    uint64_t v4 = BYTE1(v14);
    uint64_t v5 = v14 & 0x80000000;
    id v6 = objc_alloc((Class)UARPAssetVersion);
    unint64_t v7 = v2;
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    uint64_t v10 = v5;
  }
  else
  {
    id v6 = objc_alloc((Class)UARPAssetVersion);
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  id v11 = [v6 initWithMajorVersion:v7 minorVersion:v8 releaseVersion:v9 buildVersion:v10];
  return v11;
}

- (id)stagedFwVersion
{
  return [(UARPAppleHPM *)self->_hpm accMode7StagedFwVersion:0];
}

- (id)serialNumber
{
  serialNumber = self->_serialNumber;
  if (serialNumber) {
    goto LABEL_5;
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Querying serial number", v10, 2u);
  }
  uint64_t v5 = [(UARPMagSafeCable *)self querySerialNumber:0];
  id v6 = self->_serialNumber;
  self->_serialNumber = v5;

  serialNumber = self->_serialNumber;
  if (serialNumber)
  {
LABEL_5:
    unint64_t v7 = (__CFString *)[(NSString *)serialNumber copy];
  }
  else
  {
    uint64_t v9 = self->_log;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      sub_1000243C4((os_log_t)v9);
    }
    unint64_t v7 = @"Unknown";
  }
  return v7;
}

- (id)modelName
{
  id v2 = [objc_alloc((Class)UARPAccessoryHardwareUSBPD) initWithVendorID:LOWORD(self->_vendorID) productID:LOWORD(self->_productID) usbpdClass:0 locationType:self->_location supportsAccMode7:1];
  uint64_t v3 = +[UARPSupportedAccessory findByHardwareID:v2];
  uint64_t v4 = [v3 appleModelNumber];

  return v4;
}

- (unint64_t)uarpMaxPayloadSize
{
  return 60;
}

- (unint64_t)uarpPayloadWindowSize
{
  return 120;
}

- (id)querySerialNumber:(id *)a3
{
  id v5 = objc_alloc_init((Class)NSMutableString);
  int v6 = 0;
  unsigned int v11 = 0;
  while ([(UARPAppleHPM *)self->_hpm readCFUa:0 remoteEndpoint:1 offset:0x2000 buffer:v14 bufferLength:24 lengthRead:&v11 error:a3])
  {
    objc_msgSend(v5, "appendFormat:", @"%.*s", v11, v14);
    v6 += v11;
    if (v6 >= 1025)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
        sub_100024408(v6, log);
      }
      goto LABEL_10;
    }
    if (v11 != 24)
    {
      id v7 = [v5 copy];
      goto LABEL_11;
    }
  }
  uint64_t v8 = self->_log;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v13 = "-[UARPMagSafeCable querySerialNumber:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_INFO, "%s: readCFUa failed", buf, 0xCu);
  }
LABEL_10:
  id v7 = 0;
LABEL_11:

  return v7;
}

- (BOOL)firmwareUpdateAllowed:(id *)a3
{
  return [(UARPAppleHPM *)self->_hpm accMode7FirmwareUpdateAllowed:a3];
}

- (BOOL)firmwareUpdateInitialize:(id *)a3
{
  return [(UARPAppleHPM *)self->_hpm accMode7FirmwareUpdateInitialize:a3];
}

- (BOOL)firmwareUpdateWriteData:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  return [(UARPAppleHPM *)self->_hpm accMode7FirmwareUpdateWriteData:a3 offset:a4 error:a5];
}

- (BOOL)firmwareVerifyStagedAsset:(id *)a3
{
  return [(UARPAppleHPM *)self->_hpm accMode7FirmwareVerifyStagedAsset:a3];
}

- (BOOL)firmwareUpdateCleanup:(id *)a3
{
  return [(UARPAppleHPM *)self->_hpm accMode7FirmwareUpdateCleanup:a3];
}

- (BOOL)firmwareApply:(id *)a3
{
  return [(UARPAppleHPM *)self->_hpm accMode7FirmwareApply:a3];
}

- (BOOL)firmwareHasStagedAssets:(id *)a3
{
  return [(UARPAppleHPM *)self->_hpm accMode7FirmwareHasStagedAssets:a3];
}

- (BOOL)firmwareRescind:(id *)a3
{
  return [(UARPAppleHPM *)self->_hpm accMode7FirmwareRescind:a3];
}

- (BOOL)solicitLogs:(id)a3 error:(id *)a4
{
  hpm = self->_hpm;
  id v7 = a3;
  uint64_t v8 = [(UARPMagSafeCable *)self modelName];
  uint64_t v9 = [(UARPMagSafeCable *)self serialNumber];
  LOBYTE(a4) = [(UARPAppleHPM *)hpm accMode7SolicitLogs:v7 modelName:v8 serialNumber:v9 error:a4];

  return (char)a4;
}

- (BOOL)setLogLevel:(unint64_t)a3 error:(id *)a4
{
  return [(UARPAppleHPM *)self->_hpm accMode7SetLogLevel:a3 error:a4];
}

- (BOOL)clearLogs:(id *)a3
{
  return [(UARPAppleHPM *)self->_hpm accMode7ClearLogs:a3];
}

- (BOOL)solicitAnalytics:(id)a3 error:(id *)a4
{
  return [(UARPAppleHPM *)self->_hpm accMode7SolicitAnalytics:a3 error:a4];
}

- (BOOL)accMode7FirmwareUpdateGetState:(accMode7FirmwareUpdateState2 *)a3 error:(id *)a4
{
  return [(UARPAppleHPM *)self->_hpm accMode7FirmwareUpdateGetState:a3 error:a4];
}

- (BOOL)accMode7FirmwareUpdateSendCommand:(unsigned int)a3 error:(id *)a4
{
  return [(UARPAppleHPM *)self->_hpm accMode7FirmwareUpdateSendCommand:*(void *)&a3 error:a4];
}

- (BOOL)accMode7AddressSpaceRead:(unsigned int)a3 buffer:(void *)a4 bufferLength:(unsigned int)a5 lengthRead:(unsigned int *)a6 error:(id *)a7
{
  return [(UARPAppleHPM *)self->_hpm accMode7AddressSpaceRead:*(void *)&a3 buffer:a4 bufferLength:*(void *)&a5 lengthRead:a6 error:a7];
}

- (BOOL)accMode7AddressSpaceWrite:(unsigned int)a3 buffer:(void *)a4 bufferLength:(unsigned int)a5 error:(id *)a6
{
  return [(UARPAppleHPM *)self->_hpm accMode7AddressSpaceWrite:*(void *)&a3 buffer:a4 bufferLength:*(void *)&a5 error:a6];
}

+ (id)matchingDictionary:(BOOL)a3
{
  BOOL v3 = a3;
  CFMutableDictionaryRef v4 = IOServiceMatching("IOPortTransportStateCC");
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  [v5 setObject:&off_100039250 forKeyedSubscript:@"TransportType"];
  [v5 setObject:&off_100039268 forKeyedSubscript:@"ParentPortType"];
  [(__CFDictionary *)v4 setObject:v5 forKeyedSubscript:@"IOPropertyMatch"];
  if (v3)
  {
    [(__CFDictionary *)v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IOMatchLaunchStream"];
    [(__CFDictionary *)v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IOMatchAll"];
  }
  int v6 = +[NSDictionary dictionaryWithDictionary:v4];

  return v6;
}

+ (id)matchingDictionaryUSBCLightning:(id)a3 launchStream:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  CFMutableDictionaryRef v6 = IOServiceMatching("IOPortTransportStateCC");
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  [v7 setObject:&off_100039250 forKeyedSubscript:@"TransportType"];
  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Active"];
  uint64_t v8 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v5 vendorID]);
  [v7 setObject:v8 forKeyedSubscript:@"Vendor ID (SOP)"];

  id v9 = [v5 productID];
  uint64_t v10 = +[NSNumber numberWithUnsignedShort:v9];
  [v7 setObject:v10 forKeyedSubscript:@"Product ID (SOP)"];

  [(__CFDictionary *)v6 setObject:v7 forKeyedSubscript:@"IOPropertyMatch"];
  if (v4)
  {
    [(__CFDictionary *)v6 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IOMatchLaunchStream"];
    [(__CFDictionary *)v6 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IOMatchAll"];
  }
  unsigned int v11 = +[NSDictionary dictionaryWithDictionary:v6];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100024494((uint64_t)v6);
  }

  return v11;
}

+ (id)matchingDictionaryUSBCLightningDisconnectLaunchStream:(BOOL)a3
{
  BOOL v3 = a3;
  CFMutableDictionaryRef v4 = IOServiceMatching("IOPortTransportStateCC");
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  [v5 setObject:&off_100039250 forKeyedSubscript:@"TransportType"];
  [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Active"];
  [(__CFDictionary *)v4 setObject:v5 forKeyedSubscript:@"IOPropertyMatch"];
  if (v3)
  {
    [(__CFDictionary *)v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IOMatchLaunchStream"];
    [(__CFDictionary *)v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IOMatchAll"];
  }
  CFMutableDictionaryRef v6 = +[NSDictionary dictionaryWithDictionary:v4];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100024494((uint64_t)v4);
  }

  return v6;
}

+ (BOOL)needsAuthentication:(unsigned int)a3
{
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(a3, @"AuthenticationRequired", kCFAllocatorDefault, 0);
  if (!CFProperty) {
    return 1;
  }
  CFBooleanRef v4 = CFProperty;
  CFTypeID v5 = CFGetTypeID(CFProperty);
  BOOL v6 = v5 != CFBooleanGetTypeID() || CFBooleanGetValue(v4) != 0;
  CFRelease(v4);
  return v6;
}

+ (BOOL)isAuthenticated:(unsigned int)a3
{
  return +[UARPMagSafeCable authenticationStatus:*(void *)&a3] == 4;
}

+ (int)authenticationStatus:(unsigned int)a3
{
  int valuePtr = 0;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a3, @"AuthenticationStatus", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFNumberRef v4 = CFProperty;
    CFTypeID v5 = CFGetTypeID(CFProperty);
    if (v5 == CFNumberGetTypeID()) {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
    }
    CFRelease(v4);
    LODWORD(CFProperty) = valuePtr;
  }
  return (int)CFProperty;
}

+ (unint64_t)valueForService:(unsigned int)a3 key:(id)a4
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a3, (CFStringRef)a4, kCFAllocatorDefault, 0);
  if (!CFProperty) {
    return -1;
  }
  CFTypeID v5 = (void *)CFProperty;
  CFTypeID v6 = CFGetTypeID(CFProperty);
  if (v6 == CFNumberGetTypeID()) {
    unint64_t v7 = (unint64_t)[v5 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = -1;
  }
  CFRelease(v5);
  return v7;
}

+ (unint64_t)rid:(unsigned int)a3
{
  io_registry_entry_t parent = 0;
  if (IORegistryEntryGetParentEntry(a3, "IOService", &parent)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = parent == 0;
  }
  if (v3) {
    return -1;
  }
  io_registry_entry_t object = 0;
  if (IORegistryEntryGetParentEntry(parent, "IOService", &object)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = object == 0;
  }
  if (v5)
  {
    unint64_t v4 = -1;
  }
  else
  {
    unint64_t v4 = +[UARPMagSafeCable valueForService:key:](UARPMagSafeCable, "valueForService:key:");
    IOObjectRelease(object);
  }
  IOObjectRelease(parent);
  return v4;
}

+ (unint64_t)sopPrimeVID:(unsigned int)a3
{
  return +[UARPMagSafeCable valueForService:*(void *)&a3 key:@"Vendor ID (SOP1)"];
}

+ (unint64_t)sopPrimePID:(unsigned int)a3
{
  return +[UARPMagSafeCable valueForService:*(void *)&a3 key:@"Product ID (SOP1)"];
}

+ (unint64_t)sopVID:(unsigned int)a3
{
  return +[UARPMagSafeCable valueForService:*(void *)&a3 key:@"Vendor ID (SOP)"];
}

+ (unint64_t)sopPID:(unsigned int)a3
{
  return +[UARPMagSafeCable valueForService:*(void *)&a3 key:@"Product ID (SOP)"];
}

+ (BOOL)isActive:(unsigned int)a3
{
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(a3, @"Active", kCFAllocatorDefault, 0);
  if (!CFProperty) {
    return 0;
  }
  CFBooleanRef v4 = CFProperty;
  CFTypeID v5 = CFGetTypeID(CFProperty);
  BOOL v6 = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) != 0;
  CFRelease(v4);
  return v6;
}

+ (const)authenticationStatusToString:(int)a3
{
  if (a3 > 5) {
    return "authentication unknown";
  }
  else {
    return off_100038768[a3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hpm, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end