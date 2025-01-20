@interface ICDeviceInfo
+ (ICDeviceInfo)currentDeviceInfo;
- (BOOL)has1080pCapability;
- (BOOL)has720pCapability;
- (BOOL)hasCellularDataCapability;
- (BOOL)hasTelephonyCapability;
- (BOOL)hasWAPICapability;
- (BOOL)hasWiFiCapability;
- (BOOL)isAppleTV;
- (BOOL)isAudioAccessory;
- (BOOL)isIPad;
- (BOOL)isIPhone;
- (BOOL)isIPod;
- (BOOL)isInternalBuild;
- (BOOL)isMac;
- (BOOL)isPhoneNumberAccessRestricted;
- (BOOL)isROSDevice;
- (BOOL)isSeedBuild;
- (BOOL)isWatch;
- (BOOL)supportsMultipleITunesAccounts;
- (BOOL)supportsMusicStreaming;
- (BOOL)supportsSideLoadedMediaContent;
- (CGSize)mainScreenSize;
- (NSData)deviceFairPlayGUIDData;
- (NSData)macAddressData;
- (NSString)buildVersion;
- (NSString)currentLocale;
- (NSString)deviceClassName;
- (NSString)deviceGUID;
- (NSString)deviceModel;
- (NSString)deviceName;
- (NSString)hardwarePlatform;
- (NSString)macAddress;
- (NSString)name;
- (NSString)productPlatform;
- (NSString)productVersion;
- (NSString)rawDeviceModel;
- (NSString)serialNumber;
- (NSString)systemReleaseType;
- (id)_init;
- (int)_gestaltDeviceClass;
- (int)deviceClass;
- (int)screenClass;
- (unsigned)fairPlayDeviceType;
- (void)dealloc;
@end

@implementation ICDeviceInfo

+ (ICDeviceInfo)currentDeviceInfo
{
  if (currentDeviceInfo_onceToken != -1) {
    dispatch_once(&currentDeviceInfo_onceToken, &__block_literal_global_13861);
  }
  v2 = (void *)currentDeviceInfo___deviceInfo;

  return (ICDeviceInfo *)v2;
}

- (BOOL)isMac
{
  return [(ICDeviceInfo *)self _gestaltDeviceClass] == 9;
}

- (BOOL)isWatch
{
  return [(ICDeviceInfo *)self _gestaltDeviceClass] == 6;
}

- (int)_gestaltDeviceClass
{
  int result = self->_deviceClass;
  if (result == -1)
  {
    int result = MGGetSInt32Answer();
    self->_deviceClass = result;
    if (result == -1)
    {
      v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to obtain device class from MobileGestalt", v5, 2u);
      }

      return self->_deviceClass;
    }
  }
  return result;
}

- (NSString)productPlatform
{
  v3 = +[ICDefaults standardDefaults];
  v4 = [v3 productPlatformOverride];

  if (!v4)
  {
    if ([(ICDeviceInfo *)self isWatch])
    {
      v4 = @"watchOS";
    }
    else if ([(ICDeviceInfo *)self isMac])
    {
      v4 = @"macOS";
    }
    else if ([(ICDeviceInfo *)self isAppleTV])
    {
      v4 = @"tvOS";
    }
    else
    {
      v4 = @"iOS";
    }
  }

  return (NSString *)v4;
}

- (BOOL)supportsMultipleITunesAccounts
{
  if ([(ICDeviceInfo *)self isAppleTV]) {
    return 1;
  }

  return [(ICDeviceInfo *)self isAudioAccessory];
}

- (BOOL)isAppleTV
{
  return [(ICDeviceInfo *)self _gestaltDeviceClass] == 4;
}

- (NSString)currentLocale
{
  currentLocale = self->_currentLocale;
  if (!currentLocale)
  {
    v4 = (NSString *)CFPreferencesCopyValue(@"AppleLocale", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    v5 = self->_currentLocale;
    self->_currentLocale = v4;

    currentLocale = self->_currentLocale;
  }

  return currentLocale;
}

- (BOOL)isPhoneNumberAccessRestricted
{
  isPhoneNumberAccessRestrictedValue = self->_isPhoneNumberAccessRestrictedValue;
  if (!isPhoneNumberAccessRestrictedValue)
  {
    v4 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    v5 = self->_isPhoneNumberAccessRestrictedValue;
    self->_isPhoneNumberAccessRestrictedValue = v4;

    isPhoneNumberAccessRestrictedValue = self->_isPhoneNumberAccessRestrictedValue;
  }

  return [(NSNumber *)isPhoneNumberAccessRestrictedValue BOOLValue];
}

- (NSString)rawDeviceModel
{
  rawDeviceModel = self->_rawDeviceModel;
  if (!rawDeviceModel)
  {
    v4 = (NSString *)MGCopyAnswer();
    v5 = self->_rawDeviceModel;
    self->_rawDeviceModel = v4;

    rawDeviceModel = self->_rawDeviceModel;
  }

  return rawDeviceModel;
}

- (BOOL)isAudioAccessory
{
  return [(ICDeviceInfo *)self _gestaltDeviceClass] == 7;
}

- (BOOL)isInternalBuild
{
  isInternalBuildNumber = self->_isInternalBuildNumber;
  if (!isInternalBuildNumber)
  {
    v4 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    v5 = self->_isInternalBuildNumber;
    self->_isInternalBuildNumber = v4;

    isInternalBuildNumber = self->_isInternalBuildNumber;
  }

  return [(NSNumber *)isInternalBuildNumber BOOLValue];
}

- (BOOL)hasWiFiCapability
{
  hasWiFiCapabilityValue = self->_hasWiFiCapabilityValue;
  if (!hasWiFiCapabilityValue)
  {
    v4 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    v5 = self->_hasWiFiCapabilityValue;
    self->_hasWiFiCapabilityValue = v4;

    hasWiFiCapabilityValue = self->_hasWiFiCapabilityValue;
  }

  return [(NSNumber *)hasWiFiCapabilityValue BOOLValue];
}

- (BOOL)isROSDevice
{
  return 0;
}

uint64_t __33__ICDeviceInfo_currentDeviceInfo__block_invoke()
{
  currentDeviceInfo___deviceInfo = [[ICDeviceInfo alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)ICDeviceInfo;
  v2 = [(ICDeviceInfo *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_deviceClass = -1;
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iTunesCloud.ICDeviceInfo.deviceNameUpdateQueue", v4);
    deviceNameUpdateQueue = v3->_deviceNameUpdateQueue;
    v3->_deviceNameUpdateQueue = (OS_dispatch_queue *)v5;
  }
  return v3;
}

- (NSString)buildVersion
{
  buildVersion = self->_buildVersion;
  if (!buildVersion)
  {
    v4 = (NSString *)MGCopyAnswer();
    dispatch_queue_t v5 = self->_buildVersion;
    self->_buildVersion = v4;

    buildVersion = self->_buildVersion;
  }

  return buildVersion;
}

- (NSString)deviceModel
{
  v3 = +[ICDefaults standardDefaults];
  v4 = [v3 deviceModelOverride];

  deviceModel = v4;
  if (!v4)
  {
    deviceModel = self->_deviceModel;
    if (!deviceModel)
    {
      v6 = (NSString *)MGCopyAnswer();
      v7 = self->_deviceModel;
      self->_deviceModel = v6;

      deviceModel = self->_deviceModel;
    }
  }
  objc_super v8 = deviceModel;

  return v8;
}

- (NSString)productVersion
{
  v3 = +[ICDefaults standardDefaults];
  v4 = [v3 productVersionOverride];

  productVersion = v4;
  if (!v4)
  {
    productVersion = self->_productVersion;
    if (!productVersion)
    {
      v6 = (void *)_CFCopySystemVersionDictionary();
      v7 = [v6 objectForKey:*MEMORY[0x1E4F1CD30]];
      objc_super v8 = self->_productVersion;
      self->_productVersion = v7;

      productVersion = self->_productVersion;
    }
  }
  v9 = productVersion;

  return v9;
}

- (NSString)hardwarePlatform
{
  v3 = +[ICDefaults standardDefaults];
  v4 = [v3 hardwarePlatformOverride];

  hardwarePlatform = v4;
  if (!v4)
  {
    hardwarePlatform = self->_hardwarePlatform;
    if (!hardwarePlatform)
    {
      v6 = (NSString *)MGCopyAnswer();
      v7 = self->_hardwarePlatform;
      self->_hardwarePlatform = v6;

      hardwarePlatform = self->_hardwarePlatform;
    }
  }
  objc_super v8 = hardwarePlatform;

  return v8;
}

- (unsigned)fairPlayDeviceType
{
  v3 = +[ICDefaults standardDefaults];
  v4 = [v3 fairPlayDeviceTypeOverride];

  if (v4)
  {
    unsigned int v5 = [v4 unsignedIntValue];
  }
  else
  {
    unsigned int fairPlayDeviceType = self->_fairPlayDeviceType;
    p_unsigned int fairPlayDeviceType = &self->_fairPlayDeviceType;
    unsigned int v5 = fairPlayDeviceType;
    if (!fairPlayDeviceType)
    {
      int v9 = 0;
      CjHbHx((uint64_t)p_fairPlayDeviceType, (uint64_t)&v9);
      unsigned int v5 = *p_fairPlayDeviceType;
    }
  }

  return v5;
}

- (int)deviceClass
{
  v3 = +[ICDefaults standardDefaults];
  v4 = [v3 deviceClassOverride];

  if (v4) {
    int v5 = [v4 intValue];
  }
  else {
    int v5 = [(ICDeviceInfo *)self _gestaltDeviceClass];
  }
  int v6 = v5;

  return v6;
}

- (BOOL)hasCellularDataCapability
{
  hasCellularDataCapabilityNumber = self->_hasCellularDataCapabilityNumber;
  if (!hasCellularDataCapabilityNumber)
  {
    v4 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    int v5 = self->_hasCellularDataCapabilityNumber;
    self->_hasCellularDataCapabilityNumber = v4;

    hasCellularDataCapabilityNumber = self->_hasCellularDataCapabilityNumber;
  }

  return [(NSNumber *)hasCellularDataCapabilityNumber BOOLValue];
}

- (NSString)deviceName
{
  if (deviceName_onceToken != -1) {
    dispatch_once(&deviceName_onceToken, &__block_literal_global_53);
  }
  v2 = (void *)deviceName_deviceName;

  return (NSString *)v2;
}

- (BOOL)supportsSideLoadedMediaContent
{
  return [(ICDeviceInfo *)self _gestaltDeviceClass] - 1 < 3;
}

void __26__ICDeviceInfo_deviceName__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  v1 = (void *)deviceName_deviceName;
  deviceName_deviceName = v0;

  if (!deviceName_deviceName)
  {
    deviceName_deviceName = @"Unknown";
  }
}

- (BOOL)hasTelephonyCapability
{
  hasTelephonyCapabilityNumber = self->_hasTelephonyCapabilityNumber;
  if (!hasTelephonyCapabilityNumber)
  {
    v4 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    int v5 = self->_hasTelephonyCapabilityNumber;
    self->_hasTelephonyCapabilityNumber = v4;

    hasTelephonyCapabilityNumber = self->_hasTelephonyCapabilityNumber;
  }

  return [(NSNumber *)hasTelephonyCapabilityNumber BOOLValue];
}

- (NSString)deviceGUID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  deviceGUID = self->_deviceGUID;
  if (!deviceGUID)
  {
    int v5 = (NSString *)MGCopyAnswer();
    int v6 = self->_deviceGUID;
    self->_deviceGUID = v5;

    deviceGUID = self->_deviceGUID;
  }
  v7 = deviceGUID;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceNameUpdateQueue, 0);
  objc_storeStrong((id *)&self->_systemReleaseType, 0);
  objc_storeStrong((id *)&self->_supportsMusicStreamingValue, 0);
  objc_storeStrong((id *)&self->_isInternalBuildNumber, 0);
  objc_storeStrong((id *)&self->_screenClassValue, 0);
  objc_storeStrong((id *)&self->_isPhoneNumberAccessRestrictedValue, 0);
  objc_storeStrong((id *)&self->_has1080pCapabilityValue, 0);
  objc_storeStrong((id *)&self->_has720pCapabilityValue, 0);
  objc_storeStrong((id *)&self->_hasWAPICapabilityValue, 0);
  objc_storeStrong((id *)&self->_hasWiFiCapabilityValue, 0);
  objc_storeStrong((id *)&self->_hasTelephonyCapabilityNumber, 0);
  objc_storeStrong((id *)&self->_hasCellularDataCapabilityNumber, 0);
  objc_storeStrong((id *)&self->_macAddressData, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_deviceGUIDData, 0);
  objc_storeStrong((id *)&self->_currentLocale, 0);
  objc_storeStrong((id *)&self->_deviceClassName, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_hardwarePlatform, 0);
  objc_storeStrong((id *)&self->_rawDeviceModel, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);

  objc_storeStrong((id *)&self->_productVersion, 0);
}

- (BOOL)supportsMusicStreaming
{
  supportsMusicStreamingValue = self->_supportsMusicStreamingValue;
  if (!supportsMusicStreamingValue)
  {
    if ([(ICDeviceInfo *)self isWatch])
    {
      v4 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    }
    else
    {
      v4 = (NSNumber *)MEMORY[0x1E4F1CC38];
    }
    int v5 = self->_supportsMusicStreamingValue;
    self->_supportsMusicStreamingValue = v4;

    supportsMusicStreamingValue = self->_supportsMusicStreamingValue;
  }

  return [(NSNumber *)supportsMusicStreamingValue BOOLValue];
}

- (BOOL)isSeedBuild
{
  return 0;
}

- (NSString)deviceClassName
{
  deviceClassName = self->_deviceClassName;
  if (!deviceClassName)
  {
    v4 = (NSString *)MGCopyAnswer();
    int v5 = self->_deviceClassName;
    self->_deviceClassName = v4;

    deviceClassName = self->_deviceClassName;
  }
  if (deviceClassName) {
    int v6 = (__CFString *)deviceClassName;
  }
  else {
    int v6 = @"unknown";
  }

  return (NSString *)v6;
}

- (BOOL)isIPod
{
  return [(ICDeviceInfo *)self _gestaltDeviceClass] == 2;
}

- (BOOL)isIPad
{
  return [(ICDeviceInfo *)self _gestaltDeviceClass] == 3;
}

- (BOOL)isIPhone
{
  return [(ICDeviceInfo *)self _gestaltDeviceClass] == 1;
}

- (int)screenClass
{
  screenClassValue = self->_screenClassValue;
  if (!screenClassValue)
  {
    v4 = (NSNumber *)MGCopyAnswer();
    int v5 = self->_screenClassValue;
    self->_screenClassValue = v4;

    char v6 = objc_opt_respondsToSelector();
    screenClassValue = self->_screenClassValue;
    if ((v6 & 1) == 0)
    {
      self->_screenClassValue = (NSNumber *)&unk_1EF640930;

      screenClassValue = self->_screenClassValue;
    }
  }

  return [(NSNumber *)screenClassValue intValue];
}

- (BOOL)has1080pCapability
{
  has1080pCapabilityValue = self->_has1080pCapabilityValue;
  if (!has1080pCapabilityValue)
  {
    v4 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    int v5 = self->_has1080pCapabilityValue;
    self->_has1080pCapabilityValue = v4;

    has1080pCapabilityValue = self->_has1080pCapabilityValue;
  }

  return [(NSNumber *)has1080pCapabilityValue BOOLValue];
}

- (BOOL)has720pCapability
{
  has720pCapabilityValue = self->_has720pCapabilityValue;
  if (!has720pCapabilityValue)
  {
    v4 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    int v5 = self->_has720pCapabilityValue;
    self->_has720pCapabilityValue = v4;

    has720pCapabilityValue = self->_has720pCapabilityValue;
  }

  return [(NSNumber *)has720pCapabilityValue BOOLValue];
}

- (BOOL)hasWAPICapability
{
  hasWAPICapabilityValue = self->_hasWAPICapabilityValue;
  if (!hasWAPICapabilityValue)
  {
    v4 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    int v5 = self->_hasWAPICapabilityValue;
    self->_hasWAPICapabilityValue = v4;

    hasWAPICapabilityValue = self->_hasWAPICapabilityValue;
  }

  return [(NSNumber *)hasWAPICapabilityValue BOOLValue];
}

- (CGSize)mainScreenSize
{
  double height = self->_mainScreenSize.height;
  if (height == 0.0 || (double width = self->_mainScreenSize.width, width == 0.0))
  {
    int v5 = (void *)MGCopyAnswer();
    char v6 = (void *)MGCopyAnswer();
    [v5 floatValue];
    self->_mainScreenSize.double width = v7;
    [v6 floatValue];
    self->_mainScreenSize.double height = v8;

    double width = self->_mainScreenSize.width;
    double height = self->_mainScreenSize.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSData)macAddressData
{
  if (!self->_macAddressData)
  {
    if (![(ICDeviceInfo *)self isMac])
    {
      macAddressData = (NSData *)os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (!os_log_type_enabled(&macAddressData->super, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        goto LABEL_21;
      }
      *(_WORD *)buf = 0;
      char v6 = "Getting MAC address is not supported on this platform";
LABEL_13:
      _os_log_impl(&dword_1A2D01000, &macAddressData->super, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      goto LABEL_20;
    }
    __int16 v12 = 0;
    int v11 = 0;
    io_iterator_t v15 = 0;
    __int16 v14 = 0;
    *(_DWORD *)buf = 0;
    int EthernetInterfacesMatchingBSDName = FindEthernetInterfacesMatchingBSDName(&v15, "en0");
    if (!EthernetInterfacesMatchingBSDName) {
      int EthernetInterfacesMatchingBSDName = GetFirstEthernetAddress(v15, 1, buf);
    }
    IOObjectRelease(v15);
    io_iterator_t v15 = 0;
    if (EthernetInterfacesMatchingBSDName)
    {
      int FirstEthernetAddress = FindEthernetInterfacesMatchingBSDName(&v15, "en1");
      if (!FirstEthernetAddress) {
        int FirstEthernetAddress = GetFirstEthernetAddress(v15, 0, buf);
      }
      IOObjectRelease(v15);
      io_iterator_t v15 = 0;
      if (FirstEthernetAddress)
      {
        if (FindEthernetInterfacesMatchingBSDName(&v15, "en0"))
        {
          IOObjectRelease(v15);
          goto LABEL_15;
        }
        int v7 = GetFirstEthernetAddress(v15, 0, buf);
        IOObjectRelease(v15);
        if (v7)
        {
LABEL_15:
          int v11 = GetFirstInterfaceMACAddress_sMACAddress;
          __int16 v12 = word_1E95A76C5;
          if (GetFirstInterfaceMACAddress_sAddressIsValid != 1)
          {
            macAddressData = (NSData *)os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (!os_log_type_enabled(&macAddressData->super, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_20;
            }
            *(_WORD *)buf = 0;
            char v6 = "Failed to obtain device MAC address";
            goto LABEL_13;
          }
LABEL_19:
          float v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v11 length:6];
          macAddressData = self->_macAddressData;
          self->_macAddressData = v8;
          goto LABEL_20;
        }
      }
    }
    GetFirstInterfaceMACAddress_sAddressIsValid = 1;
    GetFirstInterfaceMACAddress_sMACAddress = *(_DWORD *)buf;
    word_1E95A76C5 = v14;
    int v11 = *(_DWORD *)buf;
    __int16 v12 = v14;
    goto LABEL_19;
  }
LABEL_21:
  int v9 = self->_macAddressData;

  return v9;
}

- (NSString)macAddress
{
  v2 = [(ICDeviceInfo *)self macAddressData];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28E78] string];
    id v4 = v2;
    uint64_t v5 = [v4 bytes];
    if ([v4 length])
    {
      unint64_t v6 = 0;
      do
        objc_msgSend(v3, "appendFormat:", @"%02X", *(unsigned __int8 *)(v5 + v6++));
      while ([v4 length] > v6);
    }
    int v7 = (void *)[v3 copy];
  }
  else
  {
    int v7 = 0;
  }

  return (NSString *)v7;
}

- (NSString)serialNumber
{
  serialNumber = self->_serialNumber;
  if (!serialNumber)
  {
    id v4 = (NSString *)MGCopyAnswer();
    uint64_t v5 = self->_serialNumber;
    self->_serialNumber = v4;

    serialNumber = self->_serialNumber;
  }

  return serialNumber;
}

- (NSString)name
{
  if ([MEMORY[0x1E4F77990] hasBoolEntitlement:@"com.apple.developer.device-information.user-assigned-device-name"])
  {
    *(void *)buf = 0;
    int v9 = buf;
    uint64_t v10 = 0x3032000000;
    int v11 = __Block_byref_object_copy__13828;
    __int16 v12 = __Block_byref_object_dispose__13829;
    id v13 = 0;
    deviceNameUpdateQueue = self->_deviceNameUpdateQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __20__ICDeviceInfo_name__block_invoke;
    v7[3] = &unk_1E5ACD880;
    v7[4] = self;
    v7[5] = buf;
    dispatch_sync(deviceNameUpdateQueue, v7);
    id v4 = *((id *)v9 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "User assigned name requested without entitlement. Returning generic device name.", buf, 2u);
    }

    id v4 = [(ICDeviceInfo *)self deviceName];
  }

  return (NSString *)v4;
}

void __20__ICDeviceInfo_name__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[14])
  {
    uint64_t v3 = MGCopyAnswer();
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 112);
    *(void *)(v4 + 112) = v3;

    unsigned __int8 v6 = atomic_exchange((atomic_uchar *volatile)(*(void *)(a1 + 32) + 8), 1u);
    v2 = *(void **)(a1 + 32);
    if ((v6 & 1) == 0)
    {
      objc_initWeak(&location, v2);
      uint64_t v7 = *(void *)(a1 + 32);
      float v8 = *(NSObject **)(v7 + 240);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __20__ICDeviceInfo_name__block_invoke_2;
      block[3] = &unk_1E5ACB5C8;
      block[4] = v7;
      objc_copyWeak(&v11, &location);
      dispatch_async(v8, block);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
      v2 = *(void **)(a1 + 32);
    }
  }
  if (v2[14]) {
    int v9 = (__CFString *)v2[14];
  }
  else {
    int v9 = @"Unknown";
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v9);
}

void __20__ICDeviceInfo_name__block_invoke_2(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"UserAssignedDeviceName";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  objc_copyWeak(&v2, (id *)(a1 + 40));
  *(void *)(*(void *)(a1 + 32) + 16) = MGRegisterForUpdates();
  objc_destroyWeak(&v2);
}

void __20__ICDeviceInfo_name__block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[14];
    WeakRetained[14] = 0;
    uint64_t v3 = WeakRetained;

    WeakRetained = v3;
  }
}

- (NSData)deviceFairPlayGUIDData
{
  v10[3] = *MEMORY[0x1E4F143B8];
  deviceGUIDData = self->_deviceGUIDData;
  if (!deviceGUIDData)
  {
    uint64_t v4 = [(ICDeviceInfo *)self deviceGUID];
    uint64_t v5 = v4;
    if (v4)
    {
      memset(v10, 0, 24);
      ICFairPlayGetHardwareInfoFromDeviceUDID(v4, (uint64_t)v10);
      if (!v6)
      {
        uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:(char *)v10 + 4 length:LODWORD(v10[0])];
        float v8 = self->_deviceGUIDData;
        self->_deviceGUIDData = v7;
      }
    }

    deviceGUIDData = self->_deviceGUIDData;
  }

  return deviceGUIDData;
}

- (NSString)systemReleaseType
{
  systemReleaseType = self->_systemReleaseType;
  if (!systemReleaseType)
  {
    uint64_t v4 = (NSString *)MGCopyAnswer();
    uint64_t v5 = self->_systemReleaseType;
    self->_systemReleaseType = v4;

    systemReleaseType = self->_systemReleaseType;
  }

  return systemReleaseType;
}

- (void)dealloc
{
  if ((atomic_exchange(&self->_hasRegisteredForNameNotifications._Value, 1u) & 1) != 0 && self->_nameNotificationToken) {
    MGCancelNotifications();
  }
  v3.receiver = self;
  v3.super_class = (Class)ICDeviceInfo;
  [(ICDeviceInfo *)&v3 dealloc];
}

@end