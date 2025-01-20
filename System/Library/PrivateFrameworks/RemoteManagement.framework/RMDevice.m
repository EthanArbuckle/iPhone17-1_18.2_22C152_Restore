@interface RMDevice
+ (RMDevice)currentDevice;
- (BOOL)hasSEP;
- (BOOL)locked;
- (NSNumber)chipID;
- (NSString)UDID;
- (NSString)modelFamily;
- (NSString)modelIdentifier;
- (NSString)modelMarketingName;
- (NSString)modelNumber;
- (NSString)operatingSystem;
- (NSString)operatingSystemBuildVersion;
- (NSString)operatingSystemMarketingName;
- (NSString)operatingSystemSupplementalBuildVersion;
- (NSString)operatingSystemSupplementalExtraVersion;
- (NSString)operatingSystemVersion;
- (NSString)serialNumber;
- (void)locked;
@end

@implementation RMDevice

+ (RMDevice)currentDevice
{
  if (currentDevice_onceToken != -1) {
    dispatch_once(&currentDevice_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)currentDevice_currentDevice;

  return (RMDevice *)v2;
}

uint64_t __25__RMDevice_currentDevice__block_invoke()
{
  currentDevice_currentDevice = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (NSString)UDID
{
  v2 = queryGestalt(@"UniqueDeviceID");
  v3 = +[RMFeatureOverrides internalStatusForKey:@"UniqueDeviceID" defaultValue:v2];

  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &stru_26D79D728;
  }
  v5 = v4;

  return v5;
}

- (NSString)serialNumber
{
  v2 = queryGestalt(@"SerialNumber");
  v3 = +[RMFeatureOverrides internalStatusForKey:@"SerialNumber" defaultValue:v2];

  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &stru_26D79D728;
  }
  v5 = v4;

  return v5;
}

- (NSNumber)chipID
{
  v2 = queryGestalt(@"ChipID");
  v3 = +[RMFeatureOverrides internalStatusForKey:@"ChipID" defaultValue:v2];

  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &unk_26D7A1AC0;
  }
  v5 = v4;

  return v5;
}

- (NSString)modelFamily
{
  v2 = queryGestalt(@"DeviceClass");
  v3 = +[RMFeatureOverrides internalStatusForKey:@"DeviceClass" defaultValue:v2];

  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &stru_26D79D728;
  }
  v5 = v4;

  return v5;
}

- (NSString)modelIdentifier
{
  v2 = queryGestalt(@"ProductType");
  v3 = +[RMFeatureOverrides internalStatusForKey:@"ProductType" defaultValue:v2];

  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &stru_26D79D728;
  }
  v5 = v4;

  return v5;
}

- (NSString)modelMarketingName
{
  v2 = queryGestalt(@"marketing-name");
  v3 = +[RMFeatureOverrides internalStatusForKey:@"marketing-name" defaultValue:v2];

  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &stru_26D79D728;
  }
  v5 = v4;

  return v5;
}

- (NSString)modelNumber
{
  v2 = queryGestalt(@"ModelNumber");
  v3 = +[RMFeatureOverrides internalStatusForKey:@"ModelNumber" defaultValue:v2];

  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &stru_26D79D728;
  }
  v5 = v4;

  v6 = queryGestalt(@"RegionInfo");
  v7 = +[RMFeatureOverrides internalStatusForKey:@"RegionInfo" defaultValue:v6];

  if (v7) {
    v8 = v7;
  }
  else {
    v8 = &stru_26D79D728;
  }
  v9 = v8;

  v10 = [NSString stringWithFormat:@"%@%@", v5, v9];

  return (NSString *)v10;
}

- (NSString)operatingSystem
{
  v2 = queryGestalt(@"j9Th5smJpdztHwc+i39zIg");
  v3 = +[RMFeatureOverrides internalStatusForKey:@"j9Th5smJpdztHwc+i39zIg" defaultValue:v2];

  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &stru_26D79D728;
  }
  v5 = v4;

  return v5;
}

- (NSString)operatingSystemMarketingName
{
  v3 = NSString;
  v4 = [(RMDevice *)self operatingSystem];
  v5 = [(RMDevice *)self operatingSystemVersion];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (NSString)operatingSystemVersion
{
  v2 = queryGestalt(@"ProductVersion");
  v3 = +[RMFeatureOverrides internalStatusForKey:@"ProductVersion" defaultValue:v2];

  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &stru_26D79D728;
  }
  v5 = v4;

  return v5;
}

- (NSString)operatingSystemSupplementalExtraVersion
{
  v2 = queryGestalt(@"ProductVersionExtra");
  v3 = +[RMFeatureOverrides internalStatusForKey:@"ProductVersionExtra" defaultValue:v2];

  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &stru_26D79D728;
  }
  v5 = v4;

  return v5;
}

- (NSString)operatingSystemBuildVersion
{
  v2 = queryGestalt(@"BuildVersion");
  v3 = +[RMFeatureOverrides internalStatusForKey:@"BuildVersion" defaultValue:v2];

  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &stru_26D79D728;
  }
  v5 = v4;

  return v5;
}

- (NSString)operatingSystemSupplementalBuildVersion
{
  v2 = queryGestalt(@"SupplementalBuildVersion");
  v3 = +[RMFeatureOverrides internalStatusForKey:@"SupplementalBuildVersion" defaultValue:v2];

  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &stru_26D79D728;
  }
  v5 = v4;

  return v5;
}

- (BOOL)hasSEP
{
  uint64_t v2 = MGGetBoolAnswer();

  return +[RMFeatureOverrides internalStatusForKey:@"HasSEP" defaultBool:v2];
}

- (BOOL)locked
{
  int v2 = MKBGetDeviceLockState();
  v3 = +[RMLog device];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(RMDevice *)v2 locked];
  }

  if (v2) {
    BOOL v4 = v2 == 3;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

- (void)locked
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_224784000, a2, OS_LOG_TYPE_DEBUG, "Lock state %d", (uint8_t *)v2, 8u);
}

@end