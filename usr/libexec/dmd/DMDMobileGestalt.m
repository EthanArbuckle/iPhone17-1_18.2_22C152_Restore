@interface DMDMobileGestalt
+ (BOOL)hasAppleInternalInstallCapability;
+ (BOOL)hasCellularDataCapability;
+ (BOOL)hasPersonalHotspotCapability;
+ (BOOL)hasTelephonyCapability;
+ (NSData)wifiAddressData;
+ (NSNumber)dataAvailable;
+ (NSNumber)dataCapacity;
+ (NSString)bluetoothAddress;
+ (NSString)buildVersion;
+ (NSString)deviceClass;
+ (NSString)ethernetMacAddress;
+ (NSString)marketingName;
+ (NSString)mobileSubscriberCountryCode;
+ (NSString)mobileSubscriberNetworkCode;
+ (NSString)modelNumber;
+ (NSString)phoneNumber;
+ (NSString)productType;
+ (NSString)productVersion;
+ (NSString)serialNumber;
+ (NSString)uniqueDeviceID;
+ (NSString)userAssignedDeviceName;
+ (NSString)wifiAddress;
+ (unint64_t)deviceType;
@end

@implementation DMDMobileGestalt

+ (unint64_t)deviceType
{
  v2 = [a1 deviceClass];
  if ([v2 isEqualToString:@"iPhone"])
  {
    unint64_t v3 = 1;
  }
  else if ([v2 isEqualToString:@"iPod"])
  {
    unint64_t v3 = 2;
  }
  else if ([v2 isEqualToString:@"iPad"])
  {
    unint64_t v3 = 3;
  }
  else if ([v2 isEqualToString:@"AppleTV"])
  {
    unint64_t v3 = 4;
  }
  else if ([v2 isEqualToString:@"Watch"])
  {
    unint64_t v3 = 5;
  }
  else if ([v2 isEqualToString:@"AudioAccessory"])
  {
    unint64_t v3 = 6;
  }
  else if ([v2 isEqualToString:@"RealityDevice"])
  {
    unint64_t v3 = 8;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138477827;
      v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unknown device type %{private}@", (uint8_t *)&v5, 0xCu);
    }
    unint64_t v3 = 0;
  }

  return v3;
}

+ (BOOL)hasAppleInternalInstallCapability
{
  return _MGGetBoolAnswer(@"apple-internal-install", a2);
}

+ (NSString)deviceClass
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

+ (NSString)productType
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

+ (NSString)productVersion
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

+ (NSString)buildVersion
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

+ (NSString)marketingName
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

+ (NSString)serialNumber
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

+ (NSString)modelNumber
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

+ (NSString)uniqueDeviceID
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

+ (NSString)userAssignedDeviceName
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

+ (NSNumber)dataCapacity
{
  v2 = (void *)MGCopyAnswer();
  unint64_t v3 = [v2 objectForKeyedSubscript:kMGQDiskUsageTotalDataCapacity];
  if (v3)
  {
    v4 = v3;
    [v3 floatValue];
    v6 = +[NSNumber numberWithDouble:v5 * 9.31322575e-10];
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

+ (NSNumber)dataAvailable
{
  v2 = (void *)MGCopyAnswer();
  unint64_t v3 = [v2 objectForKeyedSubscript:kMGQDiskUsageAmountDataAvailable];
  if (v3)
  {
    v4 = v3;
    [v3 floatValue];
    v6 = +[NSNumber numberWithDouble:v5 * 9.31322575e-10];
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

+ (NSString)ethernetMacAddress
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

+ (NSString)bluetoothAddress
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

+ (NSString)wifiAddress
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

+ (NSData)wifiAddressData
{
  v2 = (void *)MGCopyAnswer();

  return (NSData *)v2;
}

+ (BOOL)hasTelephonyCapability
{
  return _MGGetBoolAnswer(@"telephony", a2);
}

+ (BOOL)hasCellularDataCapability
{
  return _MGGetBoolAnswer(@"cellular-data", a2);
}

+ (BOOL)hasPersonalHotspotCapability
{
  return _MGGetBoolAnswer(@"personal-hotspot", a2);
}

+ (NSString)phoneNumber
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

+ (NSString)mobileSubscriberCountryCode
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

+ (NSString)mobileSubscriberNetworkCode
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

@end