@interface SSDevice
+ (BOOL)deviceIsAppleTV;
+ (BOOL)deviceIsAppleWatch;
+ (BOOL)deviceIsAudioAccessory;
+ (BOOL)deviceIsInternalBuild;
+ (BOOL)deviceIsSeedBuild;
+ (BOOL)deviceIsiPad;
+ (BOOL)deviceIsiPhone;
+ (BOOL)deviceIsiPod;
+ (BOOL)promptNeedsDisplay:(id)a3;
+ (BOOL)setCachedAvailableItemKinds:(id)a3;
+ (id)copyCachedAvailableItemKinds;
+ (id)currentDevice;
+ (void)setLastPromptAttemptDate:(id)a3 forPromptWithIdentifier:(id)a4;
+ (void)setPromptWithIdentifier:(id)a3 needsDisplay:(BOOL)a4;
- (BOOL)_getDeviceType:(unsigned int *)a3 error:(id *)a4;
- (BOOL)_is1080pCapable;
- (BOOL)_is720pCapable;
- (BOOL)getMachineIdentifier:(id *)a3 otp:(id *)a4 forAccountIdentifier:(id)a5;
- (BOOL)isPluggedIn;
- (BOOL)isStoreFrontIdentifierTransient;
- (BOOL)supportsDeviceCapability:(int64_t)a3;
- (NSSet)automaticDownloadKinds;
- (NSString)clientName;
- (NSString)clientVersion;
- (NSString)cloudMediaLibraryIdentifier;
- (NSString)compatibleProductType;
- (NSString)legacyUserAgent;
- (NSString)mediaLibraryIdentifier;
- (NSString)phoneNumber;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)serialNumber;
- (NSString)softwareLibraryIdentifier;
- (NSString)storeFrontIdentifier;
- (NSString)thinnedApplicationVariantIdentifier;
- (NSString)uniqueDeviceIdentifier;
- (NSString)userAgent;
- (SSDevice)init;
- (SSPromise)storeFrontIdentifierPromise;
- (double)batteryLevel;
- (float)screenScale;
- (id)_appleTVProductVersion;
- (id)_copyCarrierBundleEligibilityWithStatus:(id)a3;
- (id)_copyKeyValueStoreValueForDomain:(id)a3 key:(id)a4;
- (id)_copyProductType;
- (id)_diskCapacityString;
- (id)_fairPlayDeviceTypeString;
- (id)_newLegacyUserAgent:(BOOL *)a3;
- (id)_newModernUserAgentWithClientName:(id)a3 version:(id)a4 isCachable:(BOOL *)a5;
- (id)_productVersion;
- (id)_userAgentClientNameForAppleTVBundleID:(id)a3;
- (id)_userAgentClientNameForBundleID:(id)a3;
- (id)_userAgentClientNameForInfoPlist:(id)a3;
- (id)_userAgentClientVersionForInfoPlist:(id)a3 clientName:(id)a4;
- (id)carrierBundleStatusForService:(int64_t)a3;
- (id)copyStoreFrontRequestHeaders;
- (id)synchedStoreFrontIdentifier;
- (id)userAgentWithBundleIdentifier:(id)a3 version:(id)a4;
- (id)userAgentWithBundleRef:(__CFBundle *)a3 isCachable:(BOOL *)a4;
- (id)userAgentWithClientName:(id)a3 version:(id)a4;
- (int)_deviceClass;
- (int)_screenClass;
- (int64_t)_deviceType;
- (int64_t)_deviceTypeForProductType:(id)a3;
- (int64_t)_deviceTypeForUnknownAppleTV:(id)a3;
- (int64_t)_deviceTypeForUnknownIPad:(id)a3;
- (int64_t)_deviceTypeForUnknownIPhone:(id)a3;
- (int64_t)_deviceTypeForUnknownIPod:(id)a3;
- (int64_t)deviceBiometricStyle;
- (int64_t)deviceType;
- (unsigned)deviceTypeIdentifier;
- (void)_cacheKeyValueStoreValues;
- (void)_invalidateAutomaticDownloadKinds;
- (void)_invalidatePhoneNumber;
- (void)_invalidateSoftwareCUID;
- (void)_postStoreFrontDidChangeNotification;
- (void)_reloadPluggedInState;
- (void)_updateAutomaticDownloadKinds:(id)a3 withValue:(id)a4 completionBlock:(id)a5;
- (void)_updateBatteryLevelFromService:(unsigned int)a3;
- (void)dealloc;
- (void)enableAllAutomaticDownloadKindsWithCompletionBlock:(id)a3;
- (void)getAvailableItemKindsWithBlock:(id)a3;
- (void)getCarrierBundleStatusForService:(int64_t)a3 completionHandler:(id)a4;
- (void)getCellularNetworkingAllowedWithBlock:(id)a3;
- (void)loadStoreFrontWithCompletionHandler:(id)a3;
- (void)minusAutomaticDownloadKinds:(id)a3 withCompletionBlock:(id)a4;
- (void)sdk_loadStoreFrontIdentifier:(id)a3;
- (void)sdk_loadStorefrontCountryCode:(id)a3;
- (void)setAutomaticDownloadKinds:(id)a3 withCompletionBlock:(id)a4;
- (void)setCellularNetworkingAllowed:(BOOL)a3;
- (void)setCloudMediaLibraryIdentifier:(id)a3;
- (void)setMediaLibraryIdentifier:(id)a3;
- (void)setSoftwareLibraryIdentifier:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3 account:(id)a4;
- (void)setStoreFrontIdentifier:(id)a3 accountIdentifier:(id)a4;
- (void)setStoreFrontIdentifier:(id)a3 forRequest:(id)a4 response:(id)a5 account:(id)a6;
- (void)setStoreFrontWithResponseHeaders:(id)a3;
- (void)showPromptWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)startPowerMonitoring;
- (void)stopPowerMonitoring;
- (void)synchronizeAutomaticDownloadKinds;
- (void)unionAutomaticDownloadKinds:(id)a3 withCompletionBlock:(id)a4;
@end

@implementation SSDevice

SSPromise *__39__SSDevice_storeFrontIdentifierPromise__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 storeFrontIdentifier];
  if (v2)
  {
    return +[SSPromise promiseWithResult:v2];
  }
  else
  {
    uint64_t v4 = SSError(@"SSErrorDomain", 106, @"Missing Storefront Identifier", @"The local account doesn't have a storefront identifier.");
    return +[SSPromise promiseWithError:v4];
  }
}

+ (BOOL)deviceIsInternalBuild
{
  return MGGetBoolAnswer();
}

SSDevice *__25__SSDevice_currentDevice__block_invoke()
{
  result = objc_alloc_init(SSDevice);
  currentDevice_sCurrentDevice = (uint64_t)result;
  return result;
}

- (SSDevice)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSDevice;
  uint64_t v2 = [(SSDevice *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_biometricStyle = 0;
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.storeservices.SSDevice", 0);
    v3->_keyValueStore = objc_alloc_init(SSKeyValueStore);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__SoftwareCUIDChangedNotification, @"com.apple.StoreServices.SoftwareCUIDChanged", 0, CFNotificationSuspensionBehaviorCoalesce);
    if ((SSIsDaemon() & 1) == 0)
    {
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__AutoDownloadsChangedNotification, @"com.apple.itunesstored.autodownloadschanged", 0, CFNotificationSuspensionBehaviorCoalesce);
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__CellularNetworkingChangedNotification, @"com.apple.itunesstored.autodownloaddefaultschange", 0, CFNotificationSuspensionBehaviorCoalesce);
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__StoreFrontChangedNotification, @"com.apple.StoreServices.StorefrontChanged", 0, CFNotificationSuspensionBehaviorCoalesce);
    }
  }
  return v3;
}

+ (id)currentDevice
{
  if (currentDevice_sInstanceGuard != -1) {
    dispatch_once(&currentDevice_sInstanceGuard, &__block_literal_global_57);
  }
  return (id)currentDevice_sCurrentDevice;
}

- (NSString)storeFrontIdentifier
{
  uint64_t v2 = [(SSDevice *)self storeFrontIdentifierPromise];
  return (NSString *)[(SSPromise *)v2 resultWithError:0];
}

- (SSPromise)storeFrontIdentifierPromise
{
  uint64_t v2 = objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "localAccount");
  return (SSPromise *)[v2 thenWithBlock:&__block_literal_global_92];
}

- (NSString)productVersion
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__SSDevice_productVersion__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_newModernUserAgentWithClientName:(id)a3 version:(id)a4 isCachable:(BOOL *)a5
{
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@/%@", a3, a4];
  id v8 = [(SSDevice *)self _productVersion];
  if ([v8 length])
  {
    if (MGGetSInt32Answer() == 6) {
      v9 = @" watchOS/%@";
    }
    else {
      v9 = @" iOS/%@";
    }
    objc_msgSend(v7, "appendFormat:", v9, v8);
  }
  if (MGGetSInt32Answer() == 4)
  {
    id v10 = [(SSDevice *)self _appleTVProductVersion];
    if ([v10 length]) {
      [v7 appendFormat:@" AppleTV/%@", v10];
    }
  }
  id v11 = (id)MGCopyAnswer();
  CFPropertyListRef v12 = (id)CFPreferencesCopyAppValue(@"OverrideProductType", @"com.apple.itunesstored");
  if (v12) {
    id v11 = (id)v12;
  }
  if ([v11 length]) {
    [v7 appendFormat:@" model/%@", v11];
  }
  id v13 = (id)MGCopyAnswer();
  if ([v13 length]) {
    [v7 appendFormat:@" hwp/%@", v13];
  }
  v14 = (void *)MGCopyAnswer();
  if ([v14 length]) {
    [v7 appendFormat:@" build/%@", v14];
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v16 = [(SSDevice *)self _deviceType];
  uint64_t v17 = 0;
  v18 = &qword_1E5BAA468;
  while (*(v18 - 2) != v16)
  {
    ++v17;
    v18 += 3;
    if (v17 == 27) {
      goto LABEL_23;
    }
  }
  if (((0x20201uLL >> v17) & 1) == 0) {
    [v15 addObject:*v18];
  }
LABEL_23:
  id v19 = [(SSDevice *)self _fairPlayDeviceTypeString];
  if (v19) {
    [v15 addObject:v19];
  }
  if ([v15 count]) {
    [v7 appendFormat:@" (%@)", objc_msgSend(v15, "componentsJoinedByString:", @"; "];
  }

  if (a5) {
    *a5 = v19 != 0;
  }
  return v7;
}

- (id)_productVersion
{
  id result = self->_productVersion;
  if (!result)
  {
    uint64_t v4 = (void *)_CFCopySystemVersionDictionary();
    self->_productVersion = (NSString *)(id)[v4 objectForKey:*MEMORY[0x1E4F1CD30]];

    return self->_productVersion;
  }
  return result;
}

- (id)_fairPlayDeviceTypeString
{
  unsigned int v4 = 0;
  BOOL v2 = [(SSDevice *)self _getDeviceType:&v4 error:0];
  id result = 0;
  if (v2) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"dt:%lu", v4);
  }
  return result;
}

- (BOOL)_getDeviceType:(unsigned int *)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MGCopyAnswer();
  uint64_t v6 = (void *)MGCopyAnswer();
  v7 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v8 = (void *)[v7 objectForKey:@"SSDeviceType"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9 = (void *)[v8 objectForKey:@"hardwareModel"],
        id v10 = (void *)[v8 objectForKey:@"buildVersion"],
        id v11 = (void *)[v8 objectForKey:@"deviceTypeNumber"],
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0)
    && [v9 isEqualToString:v5]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v10 isEqualToString:v6]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v12 = [v11 intValue];
    id v13 = 0;
    BOOL v14 = 1;
  }
  else
  {
    uint64_t v35 = 0;
    CjHbHx((uint64_t)&v35 + 4, (uint64_t)&v35);
    BOOL v14 = v15 == 0;
    if (v15)
    {
      int v16 = v15;
      id v17 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v17) {
        id v17 = +[SSLogConfig sharedConfig];
      }
      int v18 = [v17 shouldLog];
      if ([v17 shouldLogToDisk]) {
        v18 |= 2u;
      }
      if (!os_log_type_enabled((os_log_t)[v17 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v18 &= 2u;
      }
      if (v18)
      {
        uint64_t v19 = objc_opt_class();
        uint64_t v20 = v16;
        int v38 = 138412546;
        uint64_t v39 = v19;
        __int16 v40 = 2048;
        uint64_t v41 = v16;
        LODWORD(v33) = 22;
        v32 = &v38;
        uint64_t v21 = _os_log_send_and_compose_impl();
        if (v21)
        {
          v22 = (void *)v21;
          uint64_t v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v38, v33);
          free(v22);
          SSFileLog(v17, @"%@", v24, v25, v26, v27, v28, v29, v23);
        }
      }
      else
      {
        uint64_t v20 = v16;
      }
      id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28798], v20, 0, v32);
      [v7 removeObjectForKey:@"SSDeviceType"];
      [v7 synchronize];
      unsigned int v12 = 0;
    }
    else
    {
      v36[0] = @"hardwareModel";
      v36[1] = @"buildVersion";
      v37[0] = v5;
      v37[1] = v6;
      v36[2] = @"deviceTypeNumber";
      v37[2] = [NSNumber numberWithUnsignedInt:HIDWORD(v35)];
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v37, v36, 3), @"SSDeviceType");
      [v7 synchronize];
      id v13 = 0;
      unsigned int v12 = HIDWORD(v35);
    }
  }

  if (a3 && v14) {
    *a3 = v12;
  }
  if (a4) {
    char v30 = v14;
  }
  else {
    char v30 = 1;
  }
  if ((v30 & 1) == 0) {
    *a4 = v13;
  }
  return v14;
}

- (int64_t)_deviceType
{
  if (self->_productType) {
    return self->_deviceType;
  }
  unsigned int v4 = [(SSDevice *)self _copyProductType];
  self->_productType = v4;
  int64_t result = [(SSDevice *)self _deviceTypeForProductType:v4];
  self->_deviceType = result;
  return result;
}

- (id)userAgentWithBundleRef:(__CFBundle *)a3 isCachable:(BOOL *)a4
{
  CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(a3);
  v7 = [(SSDevice *)self _userAgentClientNameForInfoPlist:InfoDictionary];
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = @"itunesstored";
  }
  v9 = [(SSDevice *)self _userAgentClientVersionForInfoPlist:InfoDictionary clientName:v8];
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = @"1.0";
  }
  id v11 = [(SSDevice *)self _newModernUserAgentWithClientName:v8 version:v10 isCachable:a4];
  return v11;
}

- (id)_userAgentClientVersionForInfoPlist:(id)a3 clientName:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F1CC70];
  v7 = (__CFString *)[a3 objectForKey:*MEMORY[0x1E4F1CC70]];
  if (!v7) {
    v7 = (__CFString *)[a3 objectForKey:*MEMORY[0x1E4F1D020]];
  }
  if ([a4 isEqualToString:@"Music"])
  {
    id v8 = (void *)CFPreferencesCopyAppValue(@"UseNewMusicApp2", @"com.apple.mobileipod");
    v9 = v8;
    if (v8 && ![v8 BOOLValue]) {
      v7 = @"2.0";
    }
  }
  if ([a4 isEqualToString:@"TVMusic"]
    && CFPreferencesGetAppBooleanValue(@"UseNewMusicApp", @"com.apple.TVMusic", 0))
  {
    v7 = @"10.0";
  }
  if (![a4 isEqualToString:@"Messages"]) {
    return v7;
  }
  id v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithPath:", @"/System/Library/Messages/iMessageBalloons/ASMessagesProvider.bundle"), "infoDictionary");
  if (!v10) {
    return v7;
  }
  return (id)[v10 objectForKey:v6];
}

- (id)_userAgentClientNameForInfoPlist:(id)a3
{
  v5 = (void *)[a3 objectForKey:*MEMORY[0x1E4F1CFF8]];
  if (MGGetSInt32Answer() == 4)
  {
    id result = [(SSDevice *)self _userAgentClientNameForAppleTVBundleID:v5];
    if (result) {
      return result;
    }
  }
  else
  {
    id result = [(SSDevice *)self _userAgentClientNameForBundleID:v5];
    if (result) {
      return result;
    }
  }
  id result = v5;
  if (!v5)
  {
    uint64_t v7 = *MEMORY[0x1E4F1CFF0];
    return (id)[a3 objectForKey:v7];
  }
  return result;
}

- (id)_userAgentClientNameForBundleID:(id)a3
{
  if (([a3 isEqualToString:@"com.apple.AppStore"] & 1) != 0
    || ([a3 isEqualToString:@"com.apple.AppStore2"] & 1) != 0
    || ([a3 isEqualToString:@"com.apple.AppStore3"] & 1) != 0)
  {
    return @"AppStore";
  }
  if ([a3 isEqualToString:@"com.apple.MobileStore"]) {
    return @"MobileStore";
  }
  if ([a3 isEqualToString:@"com.apple.itunesstored"]) {
    return @"itunesstored";
  }
  if (([a3 isEqualToString:@"com.apple.Music"] & 1) != 0
    || ([a3 hasPrefix:@"com.apple.Music."] & 1) != 0)
  {
    return @"Music";
  }
  if ([a3 isEqualToString:@"com.apple.lowtide"]) {
    return @"AppleTV";
  }
  if ([a3 isEqualToString:@"com.apple.ios.StoreKitUIService"]) {
    return @"StoreKitUIService";
  }
  if ([a3 isEqualToString:@"com.apple.iBooks"]) {
    return @"iBooks";
  }
  if ([a3 isEqualToString:@"com.apple.itunesu"]) {
    return @"iTunesU";
  }
  if ([a3 isEqualToString:@"com.apple.podcasts"]) {
    return @"Podcasts";
  }
  if ([a3 isEqualToString:@"com.apple.Maps"]) {
    return @"Maps";
  }
  if (([a3 isEqualToString:@"com.apple.Bridge"] & 1) != 0
    || ([a3 isEqualToString:@"com.apple.AppStore.BridgeStoreExtension"] & 1) != 0
    || ([a3 isEqualToString:@"com.apple.AppStore3.BridgeStoreExtension"] & 1) != 0)
  {
    return @"Watch";
  }
  if (([a3 isEqualToString:@"com.apple.Music.MediaSocialShareService"] & 1) != 0
    || ([a3 isEqualToString:@"com.apple.Music.MediaPicker"] & 1) != 0)
  {
    return @"Music";
  }
  if ([a3 isEqualToString:@"com.apple.WelcomeKit"]) {
    return @"matd";
  }
  if (([a3 isEqualToString:@"com.apple.MobileSMS"] & 1) != 0
    || ([a3 isEqualToString:@"com.apple.AppStore.MessagesStoreExtension"] & 1) != 0
    || [a3 isEqualToString:@"com.apple.AppStore3.MessagesStoreExtension"])
  {
    return @"Messages";
  }
  return 0;
}

id __26__SSDevice_productVersion__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) _productVersion];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.itunesstored.autodownloadschanged", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.itunesstored.autodownloaddefaultschange", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.StoreServices.SoftwareCUIDChanged", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.StoreServices.StorefrontChanged", 0);
  notify_cancel(self->_pluggedInToken);
  batteryMonitorPort = self->_batteryMonitorPort;
  if (batteryMonitorPort)
  {
    IONotificationPortDestroy(batteryMonitorPort);
    self->_batteryMonitorPort = 0;
  }
  io_object_t batteryMonitorNotification = self->_batteryMonitorNotification;
  if (batteryMonitorNotification)
  {
    IOObjectRelease(batteryMonitorNotification);
    self->_io_object_t batteryMonitorNotification = 0;
  }
  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  v6.receiver = self;
  v6.super_class = (Class)SSDevice;
  [(SSDevice *)&v6 dealloc];
}

- (NSString)clientVersion
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__22;
  id v10 = __Block_byref_object_dispose__22;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__SSDevice_clientVersion__block_invoke;
  v5[3] = &unk_1E5BAA0A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  if ([(id)v7[5] length])
  {
    v3 = (__CFString *)v7[5];
  }
  else
  {
    v3 = @"1.0";
    v7[5] = @"1.0";
  }
  _Block_object_dispose(&v6, 8);
  return &v3->isa;
}

uint64_t __25__SSDevice_clientVersion__block_invoke(uint64_t a1)
{
  MainBundle = CFBundleGetMainBundle();
  CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(MainBundle);
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_userAgentClientVersionForInfoPlist:clientName:", InfoDictionary, objc_msgSend(*(id *)(a1 + 32), "_userAgentClientNameForInfoPlist:", InfoDictionary));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)clientName
{
  uint64_t result = self->_clientName;
  if (!result)
  {
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x3052000000;
    v9 = __Block_byref_object_copy__22;
    id v10 = __Block_byref_object_dispose__22;
    uint64_t v11 = 0;
    dispatchQueue = self->_dispatchQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __22__SSDevice_clientName__block_invoke;
    v5[3] = &unk_1E5BA7688;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(dispatchQueue, v5);
    self->_clientName = (NSString *)[(id)v7[5] copy];
    _Block_object_dispose(&v6, 8);
    return self->_clientName;
  }
  return result;
}

uint64_t __22__SSDevice_clientName__block_invoke(uint64_t a1)
{
  MainBundle = CFBundleGetMainBundle();
  uint64_t result = [*(id *)(a1 + 32) _userAgentClientNameForInfoPlist:CFBundleGetInfoDictionary(MainBundle)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSSet)automaticDownloadKinds
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (MGGetBoolAnswer() && _os_feature_enabled_impl())
  {
    id v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v6 = v5;
    }
    else {
      int v6 = v5 & 2;
    }
    if (v6)
    {
      LODWORD(v21) = 136446210;
      *(void *)((char *)&v21 + 4) = "-[SSDevice automaticDownloadKinds]";
      LODWORD(v19) = 12;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v21, v19);
        free(v8);
        SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  *(void *)&long long v21 = 0;
  *((void *)&v21 + 1) = &v21;
  uint64_t v22 = 0x3052000000;
  uint64_t v23 = __Block_byref_object_copy__22;
  uint64_t v24 = __Block_byref_object_dispose__22;
  uint64_t v25 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SSDevice_automaticDownloadKinds__block_invoke;
  block[3] = &unk_1E5BAA0A8;
  block[4] = self;
  block[5] = &v21;
  dispatch_sync(dispatchQueue, block);
  id v17 = (NSSet *)*(id *)(*((void *)&v21 + 1) + 40);
  _Block_object_dispose(&v21, 8);
  return v17;
}

uint64_t __34__SSDevice_automaticDownloadKinds__block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, "0", 74);
    int v4 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__SSDevice_automaticDownloadKinds__block_invoke_2;
    v6[3] = &unk_1E5BAA290;
    v6[4] = *(void *)(a1 + 32);
    [(SSXPCConnection *)v4 sendSynchronousMessage:v3 withReply:v6];

    xpc_release(v3);
    BOOL v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t result = [v2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __34__SSDevice_automaticDownloadKinds__block_invoke_2(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590])
  {
    objc_opt_class();
    CFArrayRef v4 = SSXPCDictionaryCopyCFObjectWithClass(a2, "0");
    CFArrayRef v5 = v4;
    if (v4)
    {
      CFArrayRef v6 = v4;
      CFArrayRef v4 = (CFArrayRef)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];
      CFArrayRef v5 = v6;
    }
    *(void *)(*(void *)(a1 + 32) + 16) = v4;
  }
}

- (NSString)cloudMediaLibraryIdentifier
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__22;
  uint64_t v10 = __Block_byref_object_dispose__22;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SSDevice_cloudMediaLibraryIdentifier__block_invoke;
  v5[3] = &unk_1E5BAA0A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  xpc_object_t v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __39__SSDevice_cloudMediaLibraryIdentifier__block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = (id)v2[4];
  if (!v3)
  {
    [v2 _cacheKeyValueStoreValues];
    id v3 = *(id *)(*(void *)(a1 + 32) + 32);
  }
  id result = (id)[MEMORY[0x1E4F1CA98] null];
  if (v3 != result)
  {
    id result = *(id *)(*(void *)(a1 + 32) + 32);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (id)copyStoreFrontRequestHeaders
{
  id result = [(SSDevice *)self storeFrontIdentifier];
  if (result) {
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", result, @"X-Apple-Store-Front", 0);
  }
  return result;
}

- (unsigned)deviceTypeIdentifier
{
  unsigned int v3 = 0;
  if ([(SSDevice *)self _getDeviceType:&v3 error:0]) {
    return v3;
  }
  else {
    return 0;
  }
}

- (void)getAvailableItemKindsWithBlock:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"block is nil"];
  }
  CFPreferencesAppSynchronize(@"com.apple.itunesstored");
  uint64_t v4 = [(id)objc_opt_class() copyCachedAvailableItemKinds];
  if (v4)
  {
    id v21 = (id)v4;
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    if (MGGetBoolAnswer() && _os_feature_enabled_impl())
    {
      id v5 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v5) {
        id v5 = +[SSLogConfig sharedConfig];
      }
      int v6 = [v5 shouldLog];
      if ([v5 shouldLogToDisk]) {
        int v7 = v6 | 2;
      }
      else {
        int v7 = v6;
      }
      if (os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        int v8 = v7;
      }
      else {
        int v8 = v7 & 2;
      }
      if (v8)
      {
        int v23 = 136446210;
        uint64_t v24 = "-[SSDevice getAvailableItemKindsWithBlock:]";
        LODWORD(v20) = 12;
        uint64_t v9 = _os_log_send_and_compose_impl();
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v23, v20);
          free(v10);
          SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, v11);
        }
      }
    }
    xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v18, "0", 68);
    uint64_t v19 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __43__SSDevice_getAvailableItemKindsWithBlock___block_invoke;
    v22[3] = &unk_1E5BA7750;
    v22[4] = v19;
    v22[5] = a3;
    [(SSXPCConnection *)v19 sendMessage:v18 withReply:v22];
    xpc_release(v18);
  }
}

void __43__SSDevice_getAvailableItemKindsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2 == (void *)MEMORY[0x1E4F14520])
  {
    uint64_t v4 = 121;
  }
  else
  {
    if (a2 && MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590])
    {
      objc_opt_class();
      CFArrayRef v9 = SSXPCDictionaryCopyCFObjectWithClass(a2, "1");
      uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
      if (v9) {
        uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v9];
      }
      else {
        uint64_t v6 = 0;
      }

      goto LABEL_7;
    }
    uint64_t v4 = 111;
  }
  uint64_t v5 = (uint64_t)(id)SSError(@"SSErrorDomain", v4, 0, 0);
  uint64_t v6 = 0;
LABEL_7:
  if (!(v5 | v6)) {
    uint64_t v5 = (uint64_t)(id)SSError(@"SSErrorDomain", 100, 0, 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SSDevice_getAvailableItemKindsWithBlock___block_invoke_2;
  block[3] = &unk_1E5BA8608;
  uint64_t v8 = *(void *)(a1 + 40);
  block[5] = v5;
  void block[6] = v8;
  block[4] = v6;
  dispatch_async(global_queue, block);
}

uint64_t __43__SSDevice_getAvailableItemKindsWithBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getCellularNetworkingAllowedWithBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (MGGetBoolAnswer() && _os_feature_enabled_impl())
  {
    id v4 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v4) {
      id v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    if (os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v7 = v6;
    }
    else {
      int v7 = v6 & 2;
    }
    if (v7)
    {
      int v21 = 136446210;
      uint64_t v22 = "-[SSDevice getCellularNetworkingAllowedWithBlock:]";
      LODWORD(v19) = 12;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        CFArrayRef v9 = (void *)v8;
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v21, v19);
        free(v9);
        SSFileLog(v4, @"%@", v11, v12, v13, v14, v15, v16, v10);
      }
    }
  }
  xpc_object_t v17 = SSXPCCreateMessageDictionary(87);
  xpc_object_t v18 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __50__SSDevice_getCellularNetworkingAllowedWithBlock___block_invoke;
  v20[3] = &unk_1E5BA7750;
  v20[4] = v18;
  v20[5] = a3;
  [(SSXPCConnection *)v18 sendMessage:v17 withReply:v20];
  xpc_release(v17);
}

void __50__SSDevice_getCellularNetworkingAllowedWithBlock___block_invoke(uint64_t a1, void *a2)
{
  if (MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590]) {
    xpc_dictionary_get_BOOL(a2, "1");
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = *(void **)(a1 + 32);
}

- (void)loadStoreFrontWithCompletionHandler:(id)a3
{
  if ([(NSString *)[(SSDevice *)self storeFrontIdentifier] length])
  {
    if (a3)
    {
      int v5 = (void (*)(id, void))*((void *)a3 + 2);
      v5(a3, 0);
    }
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__SSDevice_loadStoreFrontWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E5BAA2E0;
    v7[4] = self;
    v7[5] = a3;
    dispatch_async(dispatchQueue, v7);
  }
}

uint64_t __48__SSDevice_loadStoreFrontWithCompletionHandler___block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.StoreServices.SSDevice.completion", 0);
  unsigned int v3 = *(void **)(*(void *)(a1 + 32) + 128);
  if (!v3)
  {
    id v4 = objc_alloc_init(SSURLBagContext);
    [(SSURLBagContext *)v4 setBagType:0];
    [(SSURLBagContext *)v4 setIgnoresCaches:1];
    *(void *)(*(void *)(a1 + 32) + 128) = [[SSURLBag alloc] initWithURLBagContext:v4];

    unsigned int v3 = *(void **)(*(void *)(a1 + 32) + 128);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SSDevice_loadStoreFrontWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E5BAA2B8;
  uint64_t v5 = *(void *)(a1 + 40);
  v7[4] = v2;
  v7[5] = v5;
  return [v3 loadWithCompletionBlock:v7];
}

void __48__SSDevice_loadStoreFrontWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SSDevice_loadStoreFrontWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_1E5BA7728;
  uint64_t v5 = *(void *)(a1 + 40);
  v6[4] = a3;
  void v6[5] = v5;
  dispatch_async(v4, v6);
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

uint64_t __48__SSDevice_loadStoreFrontWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)sdk_loadStorefrontCountryCode:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (MGGetBoolAnswer() && _os_feature_enabled_impl())
  {
    id v4 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v4) {
      id v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    if (os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v7 = v6;
    }
    else {
      int v7 = v6 & 2;
    }
    if (v7)
    {
      int v21 = 136446210;
      uint64_t v22 = "-[SSDevice sdk_loadStorefrontCountryCode:]";
      LODWORD(v19) = 12;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        CFArrayRef v9 = (void *)v8;
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v21, v19);
        free(v9);
        SSFileLog(v4, @"%@", v11, v12, v13, v14, v15, v16, v10);
      }
    }
  }
  xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v17, "0", 173);
  xpc_object_t v18 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __42__SSDevice_sdk_loadStorefrontCountryCode___block_invoke;
  v20[3] = &unk_1E5BA7750;
  v20[4] = v18;
  v20[5] = a3;
  [(SSXPCConnection *)v18 sendMessage:v17 withReply:v20];
  xpc_release(v17);
}

void __42__SSDevice_sdk_loadStorefrontCountryCode___block_invoke(uint64_t a1, void *a2)
{
  if (a2 == (void *)MEMORY[0x1E4F14520])
  {
    uint64_t v4 = 121;
    goto LABEL_6;
  }
  if (!a2 || MEMORY[0x1A62689E0](a2) != MEMORY[0x1E4F14590])
  {
    uint64_t v4 = 111;
LABEL_6:
    uint64_t v5 = (uint64_t)(id)SSError(@"SSErrorDomain", v4, 0, 0);
    CFArrayRef v6 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  CFArrayRef v6 = SSXPCDictionaryCopyCFObjectWithClass(a2, "1");
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
LABEL_7:
  if (!(v5 | (unint64_t)v6)) {
    uint64_t v5 = (uint64_t)(id)SSError(@"SSErrorDomain", 100, 0, 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SSDevice_sdk_loadStorefrontCountryCode___block_invoke_2;
  block[3] = &unk_1E5BA8608;
  uint64_t v8 = *(void *)(a1 + 40);
  block[5] = v5;
  void block[6] = v8;
  block[4] = v6;
  dispatch_async(global_queue, block);
}

uint64_t __42__SSDevice_sdk_loadStorefrontCountryCode___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)sdk_loadStoreFrontIdentifier:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3052000000;
  uint64_t v29 = __Block_byref_object_copy__22;
  char v30 = __Block_byref_object_dispose__22;
  uint64_t v31 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SSDevice_sdk_loadStoreFrontIdentifier___block_invoke;
  block[3] = &unk_1E5BA7688;
  block[4] = self;
  block[5] = &v26;
  dispatch_sync(dispatchQueue, block);
  if ([(id)v27[5] length])
  {
    if (a3) {
      (*((void (**)(id, uint64_t, void))a3 + 2))(a3, v27[5], 0);
    }
  }
  else
  {
    if (MGGetBoolAnswer() && _os_feature_enabled_impl())
    {
      id v6 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v6) {
        id v6 = +[SSLogConfig sharedConfig];
      }
      int v7 = [v6 shouldLog];
      int v8 = [v6 shouldLogToDisk];
      CFArrayRef v9 = [v6 OSLogObject];
      if (v8) {
        v7 |= 2u;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        int v10 = v7;
      }
      else {
        int v10 = v7 & 2;
      }
      if (v10)
      {
        int v32 = 136446210;
        uint64_t v33 = "-[SSDevice sdk_loadStoreFrontIdentifier:]";
        LODWORD(v23) = 12;
        uint64_t v11 = _os_log_send_and_compose_impl();
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v32, v23);
          free(v12);
          SSFileLog(v6, @"%@", v14, v15, v16, v17, v18, v19, v13);
        }
      }
    }
    uint64_t v20 = objc_alloc_init(SSURLBagContext);
    [(SSURLBagContext *)v20 setBagType:0];
    [(SSURLBagContext *)v20 setIgnoresCaches:1];
    xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v21, "0", 174);
    SSXPCDictionarySetCFObject(v21, "1", (__CFString *)v20);

    uint64_t v22 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __41__SSDevice_sdk_loadStoreFrontIdentifier___block_invoke_85;
    v24[3] = &unk_1E5BAA308;
    v24[5] = v22;
    v24[6] = a3;
    v24[4] = self;
    [(SSXPCConnection *)v22 sendMessage:v21 withReply:v24];
    xpc_release(v21);
  }

  _Block_object_dispose(&v26, 8);
}

uint64_t __41__SSDevice_sdk_loadStoreFrontIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __41__SSDevice_sdk_loadStoreFrontIdentifier___block_invoke_85(uint64_t a1, void *a2)
{
  dispatch_queue_t v2 = a2;
  if (a2)
  {
    if (MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590])
    {
      CFArrayRef v4 = SSXPCDictionaryCopyCFObject(v2, "0");
      dispatch_queue_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(v2, "1"));
    }
    else
    {
      CFArrayRef v4 = 0;
      dispatch_queue_t v2 = 0;
    }
  }
  else
  {
    CFArrayRef v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SSDevice_sdk_loadStoreFrontIdentifier___block_invoke_2;
  block[3] = &unk_1E5BA7448;
  block[4] = v5;
  block[5] = v4;
  dispatch_sync(v6, block);
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__SSDevice_sdk_loadStoreFrontIdentifier___block_invoke_3;
    v9[3] = &unk_1E5BA8608;
    v9[5] = v2;
    v9[6] = v7;
    v9[4] = v4;
    dispatch_async(global_queue, v9);
  }
}

uint64_t __41__SSDevice_sdk_loadStoreFrontIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) copy];
  *(void *)(*(void *)(a1 + 32) + 72) = result;
  return result;
}

uint64_t __41__SSDevice_sdk_loadStoreFrontIdentifier___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSString)mediaLibraryIdentifier
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  CFArrayRef v9 = __Block_byref_object_copy__22;
  int v10 = __Block_byref_object_dispose__22;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SSDevice_mediaLibraryIdentifier__block_invoke;
  v5[3] = &unk_1E5BAA0A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  unsigned int v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __34__SSDevice_mediaLibraryIdentifier__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  id v3 = (id)v2[10];
  if (!v3)
  {
    [v2 _cacheKeyValueStoreValues];
    id v3 = *(id *)(*(void *)(a1 + 32) + 80);
  }
  id result = (id)[MEMORY[0x1E4F1CA98] null];
  if (v3 != result)
  {
    id result = *(id *)(*(void *)(a1 + 32) + 80);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (void)setCellularNetworkingAllowed:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (MGGetBoolAnswer() && _os_feature_enabled_impl())
  {
    id v4 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v4) {
      id v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    if (os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v7 = v6;
    }
    else {
      int v7 = v6 & 2;
    }
    if (v7)
    {
      int v20 = 136446210;
      xpc_object_t v21 = "-[SSDevice setCellularNetworkingAllowed:]";
      LODWORD(v19) = 12;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        CFArrayRef v9 = (void *)v8;
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v20, v19);
        free(v9);
        SSFileLog(v4, @"%@", v11, v12, v13, v14, v15, v16, v10);
      }
    }
  }
  uint64_t v17 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  xpc_object_t v18 = SSXPCCreateMessageDictionary(88);
  xpc_dictionary_set_BOOL(v18, "1", a3);
  [(SSXPCConnection *)v17 sendMessage:v18];
  xpc_release(v18);
}

- (void)setStoreFrontWithResponseHeaders:(id)a3
{
  id v4 = (void *)[a3 objectForKey:@"X-Set-Apple-Store-Front"];
  if ([v4 length])
  {
    [(SSDevice *)self setStoreFrontIdentifier:v4];
  }
}

- (void)showPromptWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"promptIdentifier is nil"];
  }
  CFPreferencesAppSynchronize(@"com.apple.itunesstored");
  if ([(id)objc_opt_class() promptNeedsDisplay:a3])
  {
    if (MGGetBoolAnswer() && _os_feature_enabled_impl())
    {
      id v6 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v6) {
        id v6 = +[SSLogConfig sharedConfig];
      }
      int v7 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v8 = v7 | 2;
      }
      else {
        int v8 = v7;
      }
      if (os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_FAULT)) {
        int v9 = v8;
      }
      else {
        int v9 = v8 & 2;
      }
      if (v9)
      {
        int v24 = 136446210;
        uint64_t v25 = "-[SSDevice showPromptWithIdentifier:completionHandler:]";
        LODWORD(v22) = 12;
        uint64_t v10 = _os_log_send_and_compose_impl();
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v24, v22);
          free(v11);
          SSFileLog(v6, @"%@", v13, v14, v15, v16, v17, v18, v12);
        }
      }
    }
    xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v19, "0", 69);
    SSXPCDictionarySetCFObject(v19, "1", (__CFString *)a3);
    int v20 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __55__SSDevice_showPromptWithIdentifier_completionHandler___block_invoke;
    v23[3] = &unk_1E5BA7750;
    v23[4] = v20;
    v23[5] = a4;
    [(SSXPCConnection *)v20 sendMessage:v19 withReply:v23];
    xpc_release(v19);
  }
  else if (a4)
  {
    xpc_object_t v21 = (void (*)(id, void))*((void *)a4 + 2);
    v21(a4, 0);
  }
}

void __55__SSDevice_showPromptWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 40))
  {
    if (a2 == (void *)MEMORY[0x1E4F14520])
    {
      uint64_t v4 = 121;
    }
    else
    {
      if (a2 && MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590])
      {
        id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "1"));
        goto LABEL_8;
      }
      uint64_t v4 = 111;
    }
    id v5 = (id)SSError(@"SSErrorDomain", v4, 0, 0);
LABEL_8:
    id v6 = v5;
    global_queue = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__SSDevice_showPromptWithIdentifier_completionHandler___block_invoke_2;
    v9[3] = &unk_1E5BA7728;
    uint64_t v8 = *(void *)(a1 + 40);
    v9[4] = v6;
    v9[5] = v8;
    dispatch_async(global_queue, v9);
  }
}

uint64_t __55__SSDevice_showPromptWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (NSString)softwareLibraryIdentifier
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = __Block_byref_object_copy__22;
  uint64_t v10 = __Block_byref_object_dispose__22;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__SSDevice_softwareLibraryIdentifier__block_invoke;
  v5[3] = &unk_1E5BAA0A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __37__SSDevice_softwareLibraryIdentifier__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  id v3 = (id)v2[14];
  if (!v3)
  {
    [v2 _cacheKeyValueStoreValues];
    id v3 = *(id *)(*(void *)(a1 + 32) + 112);
  }
  id result = (id)[MEMORY[0x1E4F1CA98] null];
  if (v3 != result)
  {
    id result = *(id *)(*(void *)(a1 + 32) + 112);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (NSString)legacyUserAgent
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = __Block_byref_object_copy__22;
  uint64_t v10 = __Block_byref_object_dispose__22;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__SSDevice_legacyUserAgent__block_invoke;
  v5[3] = &unk_1E5BAA0A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __27__SSDevice_legacyUserAgent__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v2;
  }
  else
  {
    id v3 = (void *)CFPreferencesCopyAppValue(@"UserAgent", @"com.apple.itunesstored");
    if (v3)
    {
      id v6 = v3;
      *(void *)(*(void *)(a1 + 32) + 64) = v3;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(id *)(*(void *)(a1 + 32) + 64);
    }
    else
    {
      char v7 = 1;
      uint64_t v4 = (void *)[*(id *)(a1 + 32) _newLegacyUserAgent:&v7];
      id v5 = v4;
      if (v7) {
        *(void *)(*(void *)(a1 + 32) + 64) = v4;
      }
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v5;
    }
  }
}

- (NSString)userAgent
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = __Block_byref_object_copy__22;
  uint64_t v10 = __Block_byref_object_dispose__22;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __21__SSDevice_userAgent__block_invoke;
  v5[3] = &unk_1E5BAA0A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __21__SSDevice_userAgent__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = *(void **)(*(void *)(a1 + 32) + 136);
  if (v2)
  {
    id v3 = v2;
LABEL_3:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v3;
    return;
  }
  uint64_t v4 = (void *)CFPreferencesCopyAppValue(@"UserAgent", @"com.apple.itunesstored");
  if (!v4)
  {
    char v8 = 1;
    id v5 = (void *)[*(id *)(a1 + 32) userAgentWithBundleRef:CFBundleGetMainBundle() isCachable:&v8];
    uint64_t v6 = v5;
    if (v8) {
      *(void *)(*(void *)(a1 + 32) + 136) = v5;
    }
    id v3 = v6;
    goto LABEL_3;
  }
  id v7 = v4;
  *(void *)(*(void *)(a1 + 32) + 136) = v4;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(id *)(*(void *)(a1 + 32) + 136);
}

- (id)userAgentWithClientName:(id)a3 version:(id)a4
{
  id v4 = [(SSDevice *)self _newModernUserAgentWithClientName:a3 version:a4 isCachable:0];
  return v4;
}

+ (id)copyCachedAvailableItemKinds
{
  dispatch_queue_t v2 = (void *)CFPreferencesCopyAppValue(@"AvailableItemKinds", @"com.apple.itunesstored");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

+ (BOOL)promptNeedsDisplay:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = +[SSAccountStore defaultStore];
  id v5 = (void *)[v4 activeAccount];
  if (!v5)
  {
    id v5 = objc_msgSend((id)objc_msgSend(v4, "localAccount"), "resultWithError:", 0);
    if (!v5)
    {
      id v9 = +[SSLogConfig sharedAccountsConfig];
      if (!v9) {
        id v9 = +[SSLogConfig sharedConfig];
      }
      int v10 = [v9 shouldLog];
      if ([v9 shouldLogToDisk]) {
        int v11 = v10 | 2;
      }
      else {
        int v11 = v10;
      }
      if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v11 &= 2u;
      }
      if (v11)
      {
        int v22 = 138543618;
        uint64_t v23 = objc_opt_class();
        __int16 v24 = 2114;
        id v25 = a3;
        LODWORD(v21) = 22;
        uint64_t v6 = _os_log_send_and_compose_impl();
        if (!v6) {
          return v6;
        }
        uint64_t v12 = (void *)v6;
        uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v6, 4, &v22, v21);
        free(v12);
        SSFileLog(v9, @"%@", v14, v15, v16, v17, v18, v19, v13);
      }
      goto LABEL_4;
    }
  }
  if ([v5 displayedServerPromptWithIdentifier:a3])
  {
LABEL_4:
    LOBYTE(v6) = 0;
    return v6;
  }
  id v7 = (void *)[v5 lastAttemptDateForServerPromptWithIdentifier:a3];
  if (v7)
  {
    [v7 timeIntervalSinceNow];
    LOBYTE(v6) = fabs(v8) >= 86400.0;
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

+ (BOOL)setCachedAvailableItemKinds:(id)a3
{
  int v4 = SSIsDaemon();
  if (v4) {
    CFPreferencesSetAppValue(@"AvailableItemKinds", (CFPropertyListRef)[a3 allObjects], @"com.apple.itunesstored");
  }
  return v4;
}

+ (void)setLastPromptAttemptDate:(id)a3 forPromptWithIdentifier:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = +[SSAccountStore defaultStore];
  id v7 = (void *)[v6 activeAccount];
  if (v7 || (id v7 = objc_msgSend((id)objc_msgSend(v6, "localAccount"), "resultWithError:", 0)) != 0)
  {
    [v7 setLastAttemptDate:a3 forServerPromptWithIdentifier:a4];
    uint64_t v25 = 0;
    if (([v6 saveAccount:v7 verifyCredentials:0 error:&v25] & 1) == 0)
    {
      id v8 = +[SSLogConfig sharedAccountsConfig];
      if (!v8) {
        id v8 = +[SSLogConfig sharedConfig];
      }
      int v9 = [v8 shouldLog];
      int v10 = [v8 shouldLogToDisk] ? v9 | 2 : v9;
      if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v10 &= 2u;
      }
      if (v10)
      {
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = [v7 hashedDescription];
        int v26 = 138544130;
        uint64_t v27 = v11;
        __int16 v28 = 2114;
        uint64_t v29 = v12;
        __int16 v30 = 2114;
        id v31 = a4;
        __int16 v32 = 2114;
        uint64_t v33 = v25;
        LODWORD(v24) = 42;
        goto LABEL_22;
      }
    }
  }
  else
  {
    id v8 = +[SSLogConfig sharedAccountsConfig];
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v13 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v14 &= 2u;
    }
    if (v14)
    {
      int v26 = 138543618;
      uint64_t v27 = objc_opt_class();
      __int16 v28 = 2114;
      uint64_t v29 = (uint64_t)a4;
      LODWORD(v24) = 22;
LABEL_22:
      uint64_t v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        uint64_t v16 = (void *)v15;
        uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v26, v24);
        free(v16);
        SSFileLog(v8, @"%@", v18, v19, v20, v21, v22, v23, v17);
      }
    }
  }
}

+ (void)setPromptWithIdentifier:(id)a3 needsDisplay:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = +[SSAccountStore defaultStore];
  id v7 = (void *)[v6 activeAccount];
  if (v7 || (id v7 = objc_msgSend((id)objc_msgSend(v6, "localAccount"), "resultWithError:", 0)) != 0)
  {
    if (v4)
    {
      [v7 setDisplayedServerPrompt:0 withIdentifier:a3];
    }
    else
    {
      [v7 setDisplayedServerPrompt:1 withIdentifier:a3];
      [v7 setLastAttemptDate:0 forServerPromptWithIdentifier:a3];
    }
    uint64_t v35 = 0;
    if (([v6 saveAccount:v7 verifyCredentials:0 error:&v35] & 1) == 0)
    {
      id v8 = +[SSLogConfig sharedAccountsConfig];
      if (!v8) {
        id v8 = +[SSLogConfig sharedConfig];
      }
      int v9 = [v8 shouldLog];
      if ([v8 shouldLogToDisk]) {
        int v10 = v9 | 2;
      }
      else {
        int v10 = v9;
      }
      if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v10 &= 2u;
      }
      if (v10)
      {
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = [v7 hashedDescription];
        int v36 = 138544130;
        uint64_t v37 = v11;
        __int16 v38 = 2114;
        uint64_t v39 = v12;
        __int16 v40 = 2114;
        id v41 = a3;
        __int16 v42 = 2114;
        uint64_t v43 = v35;
        LODWORD(v34) = 42;
        uint64_t v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          int v14 = (void *)v13;
          uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v36, v34);
          free(v14);
          SSFileLog(v8, @"%@", v16, v17, v18, v19, v20, v21, v15);
        }
      }
    }
  }
  else
  {
    id v22 = +[SSLogConfig sharedAccountsConfig];
    if (!v22) {
      id v22 = +[SSLogConfig sharedConfig];
    }
    int v23 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      int v24 = v23 | 2;
    }
    else {
      int v24 = v23;
    }
    if (!os_log_type_enabled((os_log_t)[v22 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v24 &= 2u;
    }
    if (v24)
    {
      int v36 = 138543618;
      uint64_t v37 = objc_opt_class();
      __int16 v38 = 2114;
      uint64_t v39 = (uint64_t)a3;
      LODWORD(v34) = 22;
      uint64_t v25 = _os_log_send_and_compose_impl();
      if (v25)
      {
        int v26 = (void *)v25;
        uint64_t v27 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v36, v34);
        free(v26);
        SSFileLog(v22, @"%@", v28, v29, v30, v31, v32, v33, v27);
      }
    }
  }
}

- (double)batteryLevel
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  unint64_t v9 = 0xBFF0000000000000;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__SSDevice_batteryLevel__block_invoke;
  v5[3] = &unk_1E5BAA0A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __24__SSDevice_batteryLevel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(uint64_t *)(v1 + 184) >= 1)
  {
    double result = *(double *)(v1 + 152);
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (id)carrierBundleStatusForService:(int64_t)a3
{
  if (a3
    || (CFPreferencesAppSynchronize(@"com.apple.itunesstored"),
        (CFPropertyListRef v5 = CFPreferencesCopyAppValue(@"FuseSubscriptionStatus", @"com.apple.itunesstored")) == 0))
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v6 = v5;
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == CFDictionaryGetTypeID())
    {
      uint64_t v8 = [[SSVSubscriptionStatus alloc] initWithUserDefaultsRepresentation:v6];
      id v3 = [(SSDevice *)self _copyCarrierBundleEligibilityWithStatus:v8];
    }
    else
    {
      id v3 = 0;
    }
    CFRelease(v6);
  }
  return v3;
}

- (NSString)compatibleProductType
{
  CFDictionaryRef v2 = (const __CFDictionary *)MGCopyAnswer();
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v2, @"CompatibleDeviceFallback");
    Copy = (__CFString *)Value;
    if (Value)
    {
      if (CFStringCompare(Value, @"0", 0)) {
        Copy = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Copy);
      }
      else {
        Copy = 0;
      }
    }
    CFRelease(v3);
  }
  else
  {
    Copy = 0;
  }
  return (NSString *)Copy;
}

- (int64_t)deviceType
{
  uint64_t v6 = 0;
  CFTypeID v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__SSDevice_deviceType__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __22__SSDevice_deviceType__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _deviceType];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)getCarrierBundleStatusForService:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v6 = objc_alloc_init(SSVSubscriptionStatusRequest);
  [(SSVSubscriptionStatusRequest *)v6 setCarrierBundleProvisioningStyle:2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__SSDevice_getCarrierBundleStatusForService_completionHandler___block_invoke;
  v7[3] = &unk_1E5BAA350;
  v7[4] = self;
  v7[5] = a4;
  [(SSVSubscriptionStatusRequest *)v6 startWithStatusResponseBlock:v7];
}

void __63__SSDevice_getCarrierBundleStatusForService_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (*(void *)(a1 + 40)) {
    BOOL v3 = a3 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    id v5 = (id)[*(id *)(a1 + 32) _copyCarrierBundleEligibilityWithStatus:a2];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)getMachineIdentifier:(id *)a3 otp:(id *)a4 forAccountIdentifier:(id)a5
{
  uint64_t v18 = 0;
  unsigned int v17 = 0;
  uint64_t v16 = 0;
  unsigned int v15 = 0;
  if (a5) {
    uint64_t v7 = [a5 unsignedLongLongValue];
  }
  else {
    uint64_t v7 = -1;
  }
  qi864985u0(v7, (uint64_t)&v16, (uint64_t)&v15, (uint64_t)&v18, (uint64_t)&v17);
  int v9 = v8;
  if (!v8)
  {
    if (a3 && v16)
    {
      CFDataRef v10 = SSVCreateDataWithADIBytes(v16, v15);
      *a3 = v10;
      CFDataRef v11 = v10;
    }
    if (a4 && v18)
    {
      CFDataRef v12 = SSVCreateDataWithADIBytes(v18, v17);
      *a4 = v12;
      CFDataRef v13 = v12;
    }
  }
  return v9 == 0;
}

- (BOOL)isPluggedIn
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__SSDevice_isPluggedIn__block_invoke;
  v5[3] = &unk_1E5BAA0A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __23__SSDevice_isPluggedIn__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  if (*(uint64_t *)(v2 + 184) >= 1) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(v2 + 176);
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t result = MGGetSInt32Answer();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = result == 4;
  }
  return result;
}

- (void)enableAllAutomaticDownloadKindsWithCompletionBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v5) {
    id v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_INFO)) {
    v7 &= 2u;
  }
  if (v7)
  {
    int v19 = 138412290;
    uint64_t v20 = objc_opt_class();
    LODWORD(v18) = 12;
    unsigned int v17 = &v19;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      char v9 = (void *)v8;
      uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v19, v18);
      free(v9);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, v10);
    }
  }
  [(SSDevice *)self _updateAutomaticDownloadKinds:0, @"all", a3, v17 withValue completionBlock];
}

- (void)minusAutomaticDownloadKinds:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig];
  }
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_INFO)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v21 = 138412546;
    uint64_t v22 = objc_opt_class();
    __int16 v23 = 2112;
    id v24 = a3;
    LODWORD(v20) = 22;
    int v19 = &v21;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v21, v20);
      free(v11);
      SSFileLog(v7, @"%@", v13, v14, v15, v16, v17, v18, v12);
    }
  }
  [(SSDevice *)self _updateAutomaticDownloadKinds:a3, @"minus", a4, v19 withValue completionBlock];
}

- (NSString)phoneNumber
{
  uint64_t v2 = +[SSVTelephonyController sharedController];
  return [(SSVTelephonyController *)v2 phoneNumber];
}

- (NSString)productType
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = __Block_byref_object_copy__22;
  uint64_t v10 = __Block_byref_object_dispose__22;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__SSDevice_productType__block_invoke;
  v5[3] = &unk_1E5BAA0A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __23__SSDevice_productType__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  char v3 = (void *)v2[12];
  if (!v3)
  {
    *(void *)(*(void *)(a1 + 32) + 96) = [v2 _copyProductType];
    *(void *)(*(void *)(a1 + 32) + 40) = [*(id *)(a1 + 32) _deviceTypeForProductType:*(void *)(*(void *)(a1 + 32) + 96)];
    char v3 = *(void **)(*(void *)(a1 + 32) + 96);
  }
  id result = v3;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (BOOL)deviceIsAppleTV
{
  return MGGetSInt32Answer() == 4;
}

+ (BOOL)deviceIsAppleWatch
{
  return MGGetSInt32Answer() == 6;
}

+ (BOOL)deviceIsAudioAccessory
{
  return MGGetSInt32Answer() == 7;
}

+ (BOOL)deviceIsiPad
{
  return MGGetSInt32Answer() == 3;
}

+ (BOOL)deviceIsiPhone
{
  return MGGetSInt32Answer() == 1;
}

+ (BOOL)deviceIsiPod
{
  return MGGetSInt32Answer() == 2;
}

+ (BOOL)deviceIsSeedBuild
{
  return 0;
}

- (float)screenScale
{
  MEMORY[0x1F417CE10](@"main-screen-scale", a2, 1.0);
  return result;
}

- (NSString)serialNumber
{
  uint64_t v2 = (void *)MGCopyAnswer();
  return (NSString *)v2;
}

- (void)setAutomaticDownloadKinds:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig];
  }
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_INFO)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v21 = 138412546;
    uint64_t v22 = objc_opt_class();
    __int16 v23 = 2112;
    id v24 = a3;
    LODWORD(v20) = 22;
    int v19 = &v21;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v21, v20);
      free(v11);
      SSFileLog(v7, @"%@", v13, v14, v15, v16, v17, v18, v12);
    }
  }
  [(SSDevice *)self _updateAutomaticDownloadKinds:a3, @"set", a4, v19 withValue completionBlock];
}

- (void)setCloudMediaLibraryIdentifier:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__SSDevice_setCloudMediaLibraryIdentifier___block_invoke;
  v6[3] = &unk_1E5BA7448;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_sync(dispatchQueue, v6);
  [(SSKeyValueStore *)self->_keyValueStore setValue:a3 forDomain:@"com.apple.itunesstored" key:@"CloudLibraryCUID" completionBlock:0];
}

void *__43__SSDevice_setCloudMediaLibraryIdentifier___block_invoke(void *result)
{
  uint64_t v1 = *(void **)(result[4] + 32);
  if (v1 != (void *)result[5])
  {
    uint64_t v2 = result;

    char v3 = (void *)v2[5];
    if (v3) {
      float result = (void *)[v3 copy];
    }
    else {
      float result = (id)[MEMORY[0x1E4F1CA98] null];
    }
    *(void *)(v2[4] + 32) = result;
  }
  return result;
}

- (void)setMediaLibraryIdentifier:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__SSDevice_setMediaLibraryIdentifier___block_invoke;
  v6[3] = &unk_1E5BA7448;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_sync(dispatchQueue, v6);
  [(SSKeyValueStore *)self->_keyValueStore setValue:a3 forDomain:@"com.apple.itunesstored" key:@"LibraryCUID" completionBlock:0];
}

void *__38__SSDevice_setMediaLibraryIdentifier___block_invoke(void *result)
{
  uint64_t v1 = *(void **)(result[4] + 80);
  if (v1 != (void *)result[5])
  {
    uint64_t v2 = result;

    char v3 = (void *)v2[5];
    if (v3) {
      float result = (void *)[v3 copy];
    }
    else {
      float result = (id)[MEMORY[0x1E4F1CA98] null];
    }
    *(void *)(v2[4] + 80) = result;
  }
  return result;
}

- (void)setSoftwareLibraryIdentifier:(id)a3
{
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SSDevice_setSoftwareLibraryIdentifier___block_invoke;
  block[3] = &unk_1E5BA77A0;
  block[4] = self;
  block[5] = a3;
  void block[6] = &v8;
  dispatch_sync(dispatchQueue, block);
  [(SSKeyValueStore *)self->_keyValueStore setValue:a3 forDomain:@"com.apple.itunesstored" key:@"SoftwareCUID" completionBlock:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.StoreServices.SoftwareCUIDChanged", 0, 0, 1u);
  if (*((unsigned char *)v9 + 24)) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"SSDeviceSoftwareLibraryIdentifierChangedNotification", self);
  }
  _Block_object_dispose(&v8, 8);
}

void *__41__SSDevice_setSoftwareLibraryIdentifier___block_invoke(void *result)
{
  uint64_t v1 = *(void **)(result[4] + 112);
  if (v1 != (void *)result[5])
  {
    uint64_t v2 = result;

    char v3 = (void *)v2[5];
    if (v3) {
      float result = (void *)[v3 copy];
    }
    else {
      float result = (id)[MEMORY[0x1E4F1CA98] null];
    }
    *(void *)(v2[4] + 112) = result;
    *(unsigned char *)(*(void *)(v2[6] + 8) + 24) = 1;
  }
  return result;
}

- (void)setStoreFrontIdentifier:(id)a3
{
  BOOL v4 = objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "localAccount");
  [v4 addErrorBlock:&__block_literal_global_143];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__SSDevice_setStoreFrontIdentifier___block_invoke_144;
  v5[3] = &unk_1E5BAA398;
  v5[4] = a3;
  [v4 addSuccessBlock:v5];
}

void __36__SSDevice_setStoreFrontIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = +[SSLogConfig sharedAccountsConfig];
  if (!v3) {
    id v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  if (os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_ERROR)) {
    int v6 = v5;
  }
  else {
    int v6 = v5 & 2;
  }
  if (v6)
  {
    int v17 = 138412290;
    uint64_t v18 = a2;
    LODWORD(v16) = 12;
    uint64_t v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v17, v16);
      free(v8);
      SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, v9);
    }
  }
}

uint64_t __36__SSDevice_setStoreFrontIdentifier___block_invoke_144(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "storeFrontIdentifier"), "isEqualToString:", *(void *)(a1 + 32));
  if ((result & 1) == 0)
  {
    [a2 setStoreFrontIdentifier:*(void *)(a1 + 32)];
    id v5 = +[SSAccountStore defaultStore];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__SSDevice_setStoreFrontIdentifier___block_invoke_2;
    v6[3] = &unk_1E5BA8C10;
    v6[4] = *(void *)(a1 + 32);
    return [v5 saveAccount:a2 verifyCredentials:0 completion:v6];
  }
  return result;
}

void __36__SSDevice_setStoreFrontIdentifier___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = +[SSLogConfig sharedAccountsConfig];
  id v7 = v6;
  if (a2)
  {
    if (!v6) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      id v10 = SSHashIfNeeded(*(void **)(a1 + 32));
      LODWORD(v23) = 138543362;
      *(void *)((char *)&v23 + 4) = v10;
      LODWORD(v22) = 12;
      goto LABEL_21;
    }
  }
  else
  {
    if (!v6) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    int v11 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    if (os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_ERROR)) {
      int v13 = v12;
    }
    else {
      int v13 = v12 & 2;
    }
    if (v13)
    {
      LODWORD(v23) = 138412290;
      *(void *)((char *)&v23 + 4) = a3;
      LODWORD(v22) = 12;
LABEL_21:
      uint64_t v14 = (void *)_os_log_send_and_compose_impl();
      if (v14)
      {
        uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v23, v22, v23);
        free(v14);
        SSFileLog(v7, @"%@", v16, v17, v18, v19, v20, v21, v15);
      }
    }
  }
}

- (void)startPowerMonitoring
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SSDevice_startPowerMonitoring__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__SSDevice_startPowerMonitoring__block_invoke(uint64_t result)
{
  if (++*(void *)(*(void *)(result + 32) + 184) == 1)
  {
    uint64_t v1 = result;
    mach_port_t v2 = *MEMORY[0x1E4F2EF00];
    *(void *)(*(void *)(result + 32) + 168) = IONotificationPortCreate(*MEMORY[0x1E4F2EF00]);
    IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(*(void *)(v1 + 32) + 168), *(dispatch_queue_t *)(*(void *)(v1 + 32) + 48));
    CFDictionaryRef v3 = IOServiceMatching("IOPMPowerSource");
    uint64_t MatchingService = IOServiceGetMatchingService(v2, v3);
    if (MatchingService)
    {
      uint64_t v5 = MatchingService;
      if (!IOServiceAddInterestNotification(*(IONotificationPortRef *)(*(void *)(v1 + 32) + 168), MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)__BatteryLevelChanged, *(void **)(v1 + 32), (io_object_t *)(*(void *)(v1 + 32) + 160)))[*(id *)(v1 + 32) _updateBatteryLevelFromService:v5]; {
      IOObjectRelease(v5);
      }
    }
    id v6 = +[SSWeakReference weakReferenceWithObject:*(void *)(v1 + 32)];
    uint64_t v7 = *(void *)(v1 + 32);
    int v8 = *(NSObject **)(v7 + 48);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __32__SSDevice_startPowerMonitoring__block_invoke_2;
    handler[3] = &unk_1E5BAA3C0;
    handler[4] = v6;
    uint64_t result = notify_register_dispatch("com.apple.springboard.pluggedin", (int *)(v7 + 180), v8, handler);
    if (result)
    {
      *(unsigned char *)(*(void *)(v1 + 32) + 176) = 0;
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t result = notify_get_state(*(_DWORD *)(*(void *)(v1 + 32) + 180), &v9);
      *(unsigned char *)(*(void *)(v1 + 32) + 176) = v9 != 0;
    }
  }
  return result;
}

void __32__SSDevice_startPowerMonitoring__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(a1 + 32) object];
  [v1 _reloadPluggedInState];
  mach_port_t v2 = dispatch_queue_create("com.apple.StoreServices.SSDevice.notify", 0);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__SSDevice_startPowerMonitoring__block_invoke_3;
  v3[3] = &unk_1E5BA7448;
  v3[4] = v1;
  v3[5] = v2;
  dispatch_async(v2, v3);
}

void __32__SSDevice_startPowerMonitoring__block_invoke_3(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"SSDevicePluggedInStateChangedNotification", *(void *)(a1 + 32));
  mach_port_t v2 = *(NSObject **)(a1 + 40);
  dispatch_release(v2);
}

- (void)stopPowerMonitoring
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SSDevice_stopPowerMonitoring__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__SSDevice_stopPowerMonitoring__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 184);
  BOOL v3 = v2 < 1;
  uint64_t v4 = v2 - 1;
  if (!v3)
  {
    uint64_t v5 = result;
    *(void *)(v1 + 184) = v4;
    uint64_t v6 = *(void *)(result + 32);
    if (!*(void *)(v6 + 184))
    {
      uint64_t v7 = *(IONotificationPort **)(v6 + 168);
      if (v7)
      {
        IONotificationPortDestroy(v7);
        *(void *)(*(void *)(v5 + 32) + 168) = 0;
        uint64_t v6 = *(void *)(v5 + 32);
      }
      uint64_t result = *(unsigned int *)(v6 + 160);
      if (result)
      {
        uint64_t result = IOObjectRelease(result);
        *(_DWORD *)(*(void *)(v5 + 32) + 160) = 0;
      }
    }
  }
  return result;
}

- (BOOL)supportsDeviceCapability:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      return MGGetBoolAnswer();
    case 2:
      return [(SSDevice *)self _is1080pCapable];
    case 1:
      return [(SSDevice *)self _is720pCapable];
  }
  return 1;
}

- (int64_t)deviceBiometricStyle
{
  if (!self->_biometricStyle)
  {
    BOOL v3 = (const void *)MGCopyAnswer();
    uint64_t v4 = (const void *)*MEMORY[0x1E4F1CFD0];
    if (v3 == (const void *)*MEMORY[0x1E4F1CFD0])
    {
      uint64_t v5 = 0;
      int64_t v6 = 3;
    }
    else
    {
      uint64_t v5 = (const void *)MGCopyAnswer();
      int64_t v6 = 1;
      if (v5 == v4) {
        int64_t v6 = 2;
      }
    }
    self->_biometricStyle = v6;
    if (v3) {
      CFRelease(v3);
    }
    if (v5) {
      CFRelease(v5);
    }
  }
  return self->_biometricStyle;
}

- (void)synchronizeAutomaticDownloadKinds
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (MGGetBoolAnswer() && _os_feature_enabled_impl())
  {
    id v2 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v2) {
      id v2 = +[SSLogConfig sharedConfig];
    }
    int v3 = [v2 shouldLog];
    if ([v2 shouldLogToDisk]) {
      int v4 = v3 | 2;
    }
    else {
      int v4 = v3;
    }
    if (os_log_type_enabled((os_log_t)[v2 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v5 = v4;
    }
    else {
      int v5 = v4 & 2;
    }
    if (v5)
    {
      int v18 = 136446210;
      uint64_t v19 = "-[SSDevice synchronizeAutomaticDownloadKinds]";
      LODWORD(v17) = 12;
      uint64_t v6 = _os_log_send_and_compose_impl();
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v6, 4, &v18, v17);
        free(v7);
        SSFileLog(v2, @"%@", v9, v10, v11, v12, v13, v14, v8);
      }
    }
  }
  uint64_t v15 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v16, "0", 76);
  [(SSXPCConnection *)v15 sendSynchronousMessage:v16 withReply:&__block_literal_global_163];
  xpc_release(v16);
}

- (NSString)thinnedApplicationVariantIdentifier
{
  CFPreferencesAppSynchronize(@"com.apple.itunesstored");
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"ThinnedAppVariantID", @"com.apple.itunesstored");
  if (v3)
  {
    int v4 = (void *)v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
    {
      uint64_t v6 = v4;
      CFRelease(v4);
      if (v6) {
        return v6;
      }
    }
    else
    {
      CFRelease(v4);
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [(SSDevice *)self productType];
  if (v9) {
    [v8 addObject:v9];
  }
  uint64_t v10 = [(SSDevice *)self compatibleProductType];
  if (v10) {
    [v8 addObject:v10];
  }
  uint64_t v11 = (NSString *)[v8 componentsJoinedByString:@" "];

  return v11;
}

- (void)unionAutomaticDownloadKinds:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig];
  }
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_INFO)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v21 = 138412546;
    uint64_t v22 = objc_opt_class();
    __int16 v23 = 2112;
    id v24 = a3;
    LODWORD(v20) = 22;
    uint64_t v19 = &v21;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v21, v20);
      free(v11);
      SSFileLog(v7, @"%@", v13, v14, v15, v16, v17, v18, v12);
    }
  }
  [(SSDevice *)self _updateAutomaticDownloadKinds:a3, @"union", a4, v19 withValue completionBlock];
}

- (NSString)uniqueDeviceIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = __Block_byref_object_copy__22;
  uint64_t v10 = __Block_byref_object_dispose__22;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SSDevice_uniqueDeviceIdentifier__block_invoke;
  v5[3] = &unk_1E5BAA0A8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  CFPropertyListRef v3 = (NSString *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __34__SSDevice_uniqueDeviceIdentifier__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120);
  if (!v2)
  {
    *(void *)(*(void *)(a1 + 32) + 120) = [+[SSLockdown sharedInstance] copyDeviceGUID];
    id v2 = *(void **)(*(void *)(a1 + 32) + 120);
  }
  id result = v2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)userAgentWithBundleIdentifier:(id)a3 version:(id)a4
{
  id v7 = -[SSDevice _userAgentClientNameForBundleID:](self, "_userAgentClientNameForBundleID:");
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = a3;
  }
  return [(SSDevice *)self userAgentWithClientName:v8 version:a4];
}

- (void)setStoreFrontIdentifier:(id)a3 account:(id)a4
{
}

- (void)setStoreFrontIdentifier:(id)a3 accountIdentifier:(id)a4
{
  id v7 = +[SSAccountStore defaultStore];
  if (a4) {
    uint64_t v8 = [v7 accountWithUniqueIdentifier:a4];
  }
  else {
    uint64_t v8 = [v7 activeAccount];
  }
  [(SSDevice *)self setStoreFrontIdentifier:a3 account:v8];
}

- (void)setStoreFrontIdentifier:(id)a3 forRequest:(id)a4 response:(id)a5 account:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = +[SSAccountStore defaultStore];
  if (!a6) {
    goto LABEL_40;
  }
  uint64_t v12 = v11;
  if ((objc_msgSend((id)objc_msgSend(a6, "storeFrontIdentifier"), "isEqualToString:", a3) & 1) != 0
    || ([a6 isLocalAccount] & 1) != 0)
  {
    goto LABEL_38;
  }
  id v13 = SSGenerateLogCorrelationString();
  uint64_t v14 = (void *)[a6 copy];
  [v14 setStoreFrontIdentifier:a3 forRequest:a4 response:a5];
  int v15 = objc_msgSend(+[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig"), "debugLogsEnabled");
  id v16 = +[SSLogConfig sharedAccountsStorefrontConfig];
  id v17 = v16;
  if (v15)
  {
    if (!v16) {
      id v17 = +[SSLogConfig sharedConfig];
    }
    int v18 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    if (os_log_type_enabled((os_log_t)[v17 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v20 = v19;
    }
    else {
      int v20 = v19 & 2;
    }
    if (!v20) {
      goto LABEL_26;
    }
    int v47 = 138544130;
    uint64_t v48 = objc_opt_class();
    __int16 v49 = 2114;
    id v50 = v13;
    __int16 v51 = 2114;
    uint64_t v52 = [a6 hashedDescription];
    __int16 v53 = 2114;
    id v54 = +[SSStackShot generateSymbolicatedStackShot];
    LODWORD(v45) = 42;
    uint64_t v44 = &v47;
  }
  else
  {
    if (!v16) {
      id v17 = +[SSLogConfig sharedConfig];
    }
    int v21 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      v21 |= 2u;
    }
    if (os_log_type_enabled((os_log_t)[v17 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      int v22 = v21;
    }
    else {
      int v22 = v21 & 2;
    }
    if (!v22) {
      goto LABEL_26;
    }
    int v47 = 138543874;
    uint64_t v48 = objc_opt_class();
    __int16 v49 = 2114;
    id v50 = v13;
    __int16 v51 = 2114;
    uint64_t v52 = [a6 hashedDescription];
    LODWORD(v45) = 32;
    uint64_t v44 = &v47;
  }
  __int16 v23 = (void *)_os_log_send_and_compose_impl();
  if (v23)
  {
    uint64_t v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v47, v45);
    free(v23);
    SSFileLog(v17, @"%@", v25, v26, v27, v28, v29, v30, v24);
  }
LABEL_26:
  uint64_t v46 = 0;
  if ((objc_msgSend(v12, "saveAccount:verifyCredentials:error:", v14, 0, &v46, v44) & 1) == 0)
  {
    id v31 = +[SSLogConfig sharedAccountsStorefrontConfig];
    if (!v31) {
      id v31 = +[SSLogConfig sharedConfig];
    }
    int v32 = [v31 shouldLog];
    if ([v31 shouldLogToDisk]) {
      v32 |= 2u;
    }
    if (os_log_type_enabled((os_log_t)[v31 OSLogObject], OS_LOG_TYPE_ERROR)) {
      int v33 = v32;
    }
    else {
      int v33 = v32 & 2;
    }
    if (v33)
    {
      uint64_t v34 = objc_opt_class();
      int v47 = 138543618;
      uint64_t v48 = v34;
      __int16 v49 = 2114;
      id v50 = v13;
      LODWORD(v45) = 22;
      uint64_t v44 = &v47;
      uint64_t v35 = _os_log_send_and_compose_impl();
      if (v35)
      {
        int v36 = (void *)v35;
        uint64_t v37 = objc_msgSend(NSString, "stringWithCString:encoding:", v35, 4, &v47, v45);
        free(v36);
        SSFileLog(v31, @"%@", v38, v39, v40, v41, v42, v43, v37);
      }
    }
  }

LABEL_38:
  if (!objc_msgSend(v12, "activeAccount", v44) || objc_msgSend(a6, "isActive")) {
LABEL_40:
  }
    [(SSDevice *)self setStoreFrontIdentifier:a3];
}

- (id)_appleTVProductVersion
{
  id result = self->_appleTVProductVersion;
  if (!result)
  {
    if (MGGetSInt32Answer() == 4)
    {
      id result = [(SSDevice *)self _productVersion];
      self->_appleTVProductVersion = (NSString *)result;
    }
    else
    {
      return self->_appleTVProductVersion;
    }
  }
  return result;
}

- (void)_cacheKeyValueStoreValues
{
  v34[3] = *MEMORY[0x1E4F143B8];
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3052000000;
  uint64_t v30 = __Block_byref_object_copy__22;
  id v31 = __Block_byref_object_dispose__22;
  uint64_t v32 = 0;
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = __Block_byref_object_copy__22;
  uint64_t v25 = __Block_byref_object_dispose__22;
  uint64_t v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3052000000;
  int v18 = __Block_byref_object_copy__22;
  int v19 = __Block_byref_object_dispose__22;
  uint64_t v20 = 0;
  v34[0] = @"CloudLibraryCUID";
  v34[1] = @"LibraryCUID";
  v34[2] = @"SoftwareCUID";
  CFPropertyListRef v3 = dispatch_semaphore_create(0);
  keyValueStore = self->_keyValueStore;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__SSDevice__cacheKeyValueStoreValues__block_invoke;
  v14[3] = &unk_1E5BAA3E8;
  v14[6] = &v21;
  v14[7] = &v15;
  v14[4] = v3;
  v14[5] = &v27;
  [(SSKeyValueStore *)keyValueStore getValuesForDomain:@"com.apple.itunesstored" keys:v34 count:3 usingBlock:v14];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
  v33[0] = @"LibraryCUID";
  v33[1] = @"SoftwareCUID";
  CFTypeID v5 = dispatch_semaphore_create(0);
  uint64_t v6 = self->_keyValueStore;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __37__SSDevice__cacheKeyValueStoreValues__block_invoke_2;
  v13[3] = &unk_1E5BAA410;
  v13[5] = &v21;
  v13[6] = &v15;
  v13[4] = v5;
  [(SSKeyValueStore *)v6 getValuesForDomain:@"com.apple.mobile.iTunes.store" keys:v33 count:2 usingBlock:v13];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v5);

  id v7 = (void *)v28[5];
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = (id)[MEMORY[0x1E4F1CA98] null];
  }
  self->_cloudMediaLibraryIdentifier = v8;

  int v9 = (void *)v22[5];
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = (id)[MEMORY[0x1E4F1CA98] null];
  }
  self->_mediaLibraryIdentifier = v10;

  id v11 = (void *)v16[5];
  if (v11) {
    id v12 = v11;
  }
  else {
    id v12 = (id)[MEMORY[0x1E4F1CA98] null];
  }
  self->_softwareLibraryIdentifier = v12;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
}

intptr_t __37__SSDevice__cacheKeyValueStoreValues__block_invoke(void *a1, id *a2)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = *a2;
  *(void *)(*(void *)(a1[6] + 8) + 40) = a2[1];
  *(void *)(*(void *)(a1[7] + 8) + 40) = a2[2];
  int v4 = a1[4];
  return dispatch_semaphore_signal(v4);
}

intptr_t __37__SSDevice__cacheKeyValueStoreValues__block_invoke_2(void *a1, id *a2)
{
  if (!*(void *)(*(void *)(a1[5] + 8) + 40)) {
    *(void *)(*(void *)(a1[5] + 8) + 40) = *a2;
  }
  if (!*(void *)(*(void *)(a1[6] + 8) + 40)) {
    *(void *)(*(void *)(a1[6] + 8) + 40) = a2[1];
  }
  int v4 = a1[4];
  return dispatch_semaphore_signal(v4);
}

- (id)_copyCarrierBundleEligibilityWithStatus:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = [a3 carrierBundlingStatus];
  uint64_t v4 = 1;
  if (v3 != 1 && v3 != 4)
  {
    if (v3 == 2)
    {
      uint64_t v4 = 0;
      goto LABEL_6;
    }
    return 0;
  }
LABEL_6:
  id v5 = objc_alloc(NSNumber);
  return (id)[v5 initWithInteger:v4];
}

- (id)_copyKeyValueStoreValueForDomain:(id)a3 key:(id)a4
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = __Block_byref_object_copy__22;
  id v16 = __Block_byref_object_dispose__22;
  uint64_t v17 = 0;
  id v7 = dispatch_semaphore_create(0);
  keyValueStore = self->_keyValueStore;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__SSDevice__copyKeyValueStoreValueForDomain_key___block_invoke;
  v11[3] = &unk_1E5BAA438;
  v11[4] = v7;
  v11[5] = &v12;
  [(SSKeyValueStore *)keyValueStore getValueForDomain:a3 key:a4 usingBlock:v11];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v7);
  int v9 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

intptr_t __49__SSDevice__copyKeyValueStoreValueForDomain_key___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  uint64_t v3 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v3);
}

- (id)_copyProductType
{
  return (id)MGCopyAnswer();
}

- (int)_deviceClass
{
  id v2 = (void *)MGCopyAnswer();
  if (objc_opt_respondsToSelector()) {
    int v3 = [v2 intValue];
  }
  else {
    int v3 = -1;
  }

  return v3;
}

- (int64_t)_deviceTypeForProductType:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = 0;
  int64_t v6 = 0;
  do
  {
    if ([(id)__DeviceProperties[v5 + 1] isEqualToString:a3]) {
      int64_t v6 = __DeviceProperties[v5];
    }
    v5 += 3;
  }
  while (v5 != 81);
  if (v6) {
    return v6;
  }
  if ([a3 hasPrefix:@"iPad"])
  {
    return [(SSDevice *)self _deviceTypeForUnknownIPad:a3];
  }
  if ([a3 hasPrefix:@"iPhone"])
  {
    return [(SSDevice *)self _deviceTypeForUnknownIPhone:a3];
  }
  if ([a3 hasPrefix:@"iPod"])
  {
    return [(SSDevice *)self _deviceTypeForUnknownIPod:a3];
  }
  if (![a3 hasPrefix:@"AppleTV"])
  {
    if ([a3 hasPrefix:@"Watch"]) {
      return 2007;
    }
    if ([a3 hasPrefix:@"iProd"]) {
      return 4002;
    }
    return 0;
  }
  return [(SSDevice *)self _deviceTypeForUnknownAppleTV:a3];
}

- (int64_t)_deviceTypeForUnknownAppleTV:(id)a3
{
  int v3 = objc_msgSend((id)objc_msgSend(a3, "substringFromIndex:", 7), "componentsSeparatedByString:", @",");
  if ([v3 count] != 2) {
    return 4;
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 0), "integerValue");
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 1), "integerValue");
  if (v4 > 3) {
    return 4002;
  }
  uint64_t v6 = v5;
  int64_t result = 4;
  if (v4 == 3 && v6 >= 2) {
    return 4002;
  }
  return result;
}

- (int64_t)_deviceTypeForUnknownIPad:(id)a3
{
  int v3 = objc_msgSend((id)objc_msgSend(a3, "substringFromIndex:", 4), "componentsSeparatedByString:", @",");
  if ([v3 count] != 2) {
    return 1;
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 0), "integerValue");
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 1), "integerValue");
  if (v4 > 2) {
    return 1008;
  }
  uint64_t v6 = v5;
  int64_t result = 1;
  if (v4 == 2 && v6 >= 5) {
    return 1008;
  }
  return result;
}

- (int64_t)_deviceTypeForUnknownIPhone:(id)a3
{
  int v3 = objc_msgSend((id)objc_msgSend(a3, "substringFromIndex:", 6), "componentsSeparatedByString:", @",");
  if ([v3 count] != 2) {
    return 2;
  }
  if (objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 0), "integerValue") <= 4) {
    return 2;
  }
  return 2007;
}

- (int64_t)_deviceTypeForUnknownIPod:(id)a3
{
  int v3 = objc_msgSend((id)objc_msgSend(a3, "substringFromIndex:", 4), "componentsSeparatedByString:", @",");
  if ([v3 count] != 2) {
    return 3;
  }
  if (objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 0), "integerValue") <= 4) {
    return 3;
  }
  return 3006;
}

- (id)_diskCapacityString
{
  id v2 = (void *)MGCopyAnswer();
  int v3 = (void *)[v2 objectForKey:*MEMORY[0x1E4FBA0F8]];
  if (v3)
  {
    [v3 doubleValue];
    long double v5 = v4;
  }
  else
  {
    long double v5 = 1.79769313e308;
  }

  double v6 = log2(v5);
  double v7 = exp2(ceil(v6));
  uint64_t v8 = 0;
  double v9 = 1024.0;
  while (1)
  {
    if (v7 < v9) {
      return (id)[NSString stringWithFormat:@"%.0f%@", v7 / (v9 * 0.0009765625), *(__CFString **)((char *)&off_1E5BAA708 + v8)];
    }
    if (v7 == v9) {
      break;
    }
    double v9 = v9 * 1024.0;
    v8 += 8;
    if (v8 == 56) {
      return 0;
    }
  }
  return (id)[NSString stringWithFormat:@"1%@", *(__CFString **)((char *)&off_1E5BAA708 + v8 + 8), v11];
}

- (void)_invalidateAutomaticDownloadKinds
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SSDevice__invalidateAutomaticDownloadKinds__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __45__SSDevice__invalidateAutomaticDownloadKinds__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 16);
  if (v2)
  {

    *(void *)(*(void *)(a1 + 32) + 16) = 0;
    uint64_t v1 = *(void *)(a1 + 32);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SSDevice__invalidateAutomaticDownloadKinds__block_invoke_2;
  block[3] = &unk_1E5BA73F8;
  block[4] = v1;
  dispatch_async(global_queue, block);
}

uint64_t __45__SSDevice__invalidateAutomaticDownloadKinds__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"SSDeviceAutomaticDownloadKindsChangedNotification" object:v3];
}

- (void)_invalidatePhoneNumber
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SSDevice__invalidatePhoneNumber__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __34__SSDevice__invalidatePhoneNumber__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 88) = 0;
}

- (void)_invalidateSoftwareCUID
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SSDevice__invalidateSoftwareCUID__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __35__SSDevice__invalidateSoftwareCUID__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 112);
  if (v1)
  {

    *(void *)(*(void *)(a1 + 32) + 112) = 0;
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__SSDevice__invalidateSoftwareCUID__block_invoke_2;
    block[3] = &unk_1E5BA73F8;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(global_queue, block);
  }
}

uint64_t __35__SSDevice__invalidateSoftwareCUID__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"SSDeviceSoftwareLibraryIdentifierChangedNotification" object:v3];
}

- (BOOL)_is720pCapable
{
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswer();
  if (!v2) {
    return 0;
  }
  CFBooleanRef v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  BOOL v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
  CFRelease(v3);
  return v5;
}

- (BOOL)_is1080pCapable
{
  int v3 = [(SSDevice *)self _screenClass];
  if ([(SSDevice *)self _deviceClass] != 3 && v3 != 9 && v3 != 15 && v3 != 18 && v3 != 19) {
    return 0;
  }
  GSMainScreenScaleFactor();
  if (v4 <= 1.0) {
    return 0;
  }
  CFBooleanRef v5 = (const __CFBoolean *)MGCopyAnswer();
  if (!v5) {
    return 0;
  }
  CFBooleanRef v6 = v5;
  CFTypeID v7 = CFGetTypeID(v5);
  BOOL v8 = v7 == CFBooleanGetTypeID() && CFBooleanGetValue(v6) != 0;
  CFRelease(v6);
  return v8;
}

- (id)_newLegacyUserAgent:(BOOL *)a3
{
  CFBooleanRef v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"iTunes-"];
  int v6 = MGGetSInt32Answer();
  switch(v6)
  {
    case 4:
      CFTypeID v7 = @"AppleTV";
      break;
    case 3:
      CFBooleanRef v8 = (const __CFBoolean *)MGCopyAnswer();
      if (v8)
      {
        CFBooleanRef v9 = v8;
        CFTypeID v10 = CFGetTypeID(v8);
        if (v10 == CFBooleanGetTypeID() && CFBooleanGetValue(v9)) {
          uint64_t v11 = @"iPad-M";
        }
        else {
          uint64_t v11 = @"iPad";
        }
        [v5 appendString:v11];
        CFRelease(v9);
        goto LABEL_15;
      }
      CFTypeID v7 = @"iPad";
      break;
    case 1:
      CFTypeID v7 = @"iPhone";
      break;
    default:
      CFTypeID v7 = @"iPod";
      break;
  }
  [v5 appendString:v7];
LABEL_15:
  id v12 = [(SSDevice *)self _productVersion];
  if ([v12 length]) {
    [v5 appendFormat:@"/%@", v12];
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v14 = [(SSDevice *)self _deviceType];
  uint64_t v15 = 0;
  id v16 = &qword_1E5BAA468;
  while (*(v16 - 2) != v14)
  {
    ++v15;
    v16 += 3;
    if (v15 == 27) {
      goto LABEL_23;
    }
  }
  if (((0x20201uLL >> v15) & 1) == 0) {
    [v13 addObject:*v16];
  }
LABEL_23:
  id v17 = [(SSDevice *)self _diskCapacityString];
  if (v17) {
    [v13 addObject:v17];
  }
  id v18 = [(SSDevice *)self _fairPlayDeviceTypeString];
  if (v18) {
    [v13 addObject:v18];
  }
  if ([v13 count]) {
    [v5 appendFormat:@" (%@)", objc_msgSend(v13, "componentsJoinedByString:", @"; "];
  }

  if (a3) {
    *a3 = v18 != 0;
  }
  return v5;
}

- (void)_postStoreFrontDidChangeNotification
{
  if (+[SSDevice setCachedAvailableItemKinds:0]) {
    CFPreferencesAppSynchronize(@"com.apple.itunesstored");
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SSDevice__postStoreFrontDidChangeNotification__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __48__SSDevice__postStoreFrontDidChangeNotification__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 72) = 0;
  CFBooleanRef v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SSDeviceAvailableItemKindsChangedNotification" object:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"SSDeviceStoreFrontChangedNotification" object:v3];
}

- (void)_reloadPluggedInState
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  notify_get_state(self->_pluggedInToken, &state64);
  id v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3) {
    id v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    int v18 = 138412546;
    uint64_t v19 = v6;
    __int16 v20 = 2048;
    uint64_t v21 = state64;
    LODWORD(v16) = 22;
    uint64_t v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      CFBooleanRef v8 = (void *)v7;
      uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v18, v16);
      free(v8);
      SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, v9);
    }
  }
  self->_pluggedIn = state64 != 0;
}

- (int)_screenClass
{
  CFBooleanRef v2 = (void *)MGCopyAnswer();
  if (objc_opt_respondsToSelector()) {
    int v3 = [v2 intValue];
  }
  else {
    int v3 = -1;
  }

  return v3;
}

- (void)_updateAutomaticDownloadKinds:(id)a3 withValue:(id)a4 completionBlock:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (MGGetBoolAnswer() && _os_feature_enabled_impl())
  {
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    if (os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v11 = v10;
    }
    else {
      int v11 = v10 & 2;
    }
    if (v11)
    {
      int v25 = 136446210;
      uint64_t v26 = "-[SSDevice _updateAutomaticDownloadKinds:withValue:completionBlock:]";
      LODWORD(v23) = 12;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v25, v23);
        free(v13);
        SSFileLog(v8, @"%@", v15, v16, v17, v18, v19, v20, v14);
      }
    }
  }
  xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v21, "0", 75);
  SSXPCDictionarySetCFObject(v21, "1", (__CFString *)[a3 allObjects]);
  SSXPCDictionarySetCFObject(v21, "2", (__CFString *)a4);
  uint64_t v22 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __68__SSDevice__updateAutomaticDownloadKinds_withValue_completionBlock___block_invoke;
  v24[3] = &unk_1E5BA7750;
  v24[4] = v22;
  v24[5] = a5;
  [(SSXPCConnection *)v22 sendMessage:v21 withReply:v24];
  xpc_release(v21);
}

void __68__SSDevice__updateAutomaticDownloadKinds_withValue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 40))
  {
    int v3 = a2;
    if (a2) {
      LOBYTE(v3) = MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590] && xpc_dictionary_get_BOOL(v3, "0");
    }
    global_queue = dispatch_get_global_queue(0, 0);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__SSDevice__updateAutomaticDownloadKinds_withValue_completionBlock___block_invoke_2;
    v5[3] = &unk_1E5BAA6E8;
    v5[4] = *(void *)(a1 + 40);
    char v6 = (char)v3;
    dispatch_async(global_queue, v5);
  }
}

uint64_t __68__SSDevice__updateAutomaticDownloadKinds_withValue_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_updateBatteryLevelFromService:(unsigned int)a3
{
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"MaxCapacity", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  uint64_t v7 = (void *)IORegistryEntryCreateCFProperty(a3, @"CurrentCapacity", v5, 0);
  id v8 = v7;
  if (CFProperty) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (!CFProperty)
    {
      if (!v7) {
        return;
      }
      goto LABEL_8;
    }
  }
  else
  {
    [v7 doubleValue];
    double v11 = v10;
    [CFProperty doubleValue];
    self->_batteryLevel = v11 / v12;
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__SSDevice__updateBatteryLevelFromService___block_invoke;
    block[3] = &unk_1E5BA73F8;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
  CFRelease(CFProperty);
  if (!v8) {
    return;
  }
LABEL_8:
  CFRelease(v8);
}

uint64_t __43__SSDevice__updateBatteryLevelFromService___block_invoke(uint64_t a1)
{
  CFBooleanRef v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"SSDeviceBatteryLevelChangedNotification" object:v3];
}

- (id)_userAgentClientNameForAppleTVBundleID:(id)a3
{
  if ([a3 hasPrefix:@"com.apple."]) {
    int v4 = (void *)[a3 substringFromIndex:objc_msgSend(@"com.apple.", "length")];
  }
  else {
    int v4 = 0;
  }
  if ([v4 isEqualToString:@"lowtide"]) {
    return @"AppleTV";
  }
  else {
    return v4;
  }
}

- (BOOL)isStoreFrontIdentifierTransient
{
  return 0;
}

- (id)synchedStoreFrontIdentifier
{
  return 0;
}

@end