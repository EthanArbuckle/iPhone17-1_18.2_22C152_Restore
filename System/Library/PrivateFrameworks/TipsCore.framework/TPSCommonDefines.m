@interface TPSCommonDefines
+ (BOOL)callerIsTipsdWithSource:(id)a3;
+ (BOOL)hardwareChanged;
+ (BOOL)isAppRestrictedWithBundleIdentifier:(id)a3;
+ (BOOL)isAppValidWithBundleIdentifier:(id)a3;
+ (BOOL)isChecklistCollectionWithIdentifier:(id)a3;
+ (BOOL)isGreenTeaDevice;
+ (BOOL)isInternalBuild;
+ (BOOL)isInternalDevice;
+ (BOOL)isMacUI;
+ (BOOL)isPadUI;
+ (BOOL)isPhoneUI;
+ (BOOL)isRecordValid:(id)a3;
+ (BOOL)isSavedTipsCollectionIdentifier:(id)a3;
+ (BOOL)isSeniorUser;
+ (BOOL)isVisionUI;
+ (BOOL)supportsCloudDeviceUserGuide;
+ (BOOL)supportsFaceID;
+ (BOOL)supportsUserGuide;
+ (double)displayScale;
+ (id)_tipStatusArchivalURL;
+ (id)appGroupIdentifier;
+ (id)checklistCollectionIdentifier;
+ (id)clientBundleIdentifier;
+ (id)deviceClass;
+ (id)deviceFamily;
+ (id)deviceGuideIdentifier;
+ (id)deviceMarketingName;
+ (id)deviceName;
+ (id)deviceSymbol;
+ (id)hardwareWelcomeCollectionIdentifier;
+ (id)mainBundleIdentifier;
+ (id)notificationBundleIdentifier;
+ (id)osBuild;
+ (id)productVersion;
+ (id)sharedInstance;
+ (id)softwareWelcomeCollectionIdentifier;
+ (id)switcherWelcomeCollectionIdentifier;
+ (id)tipsCoreFrameworkBundle;
+ (int)buttonType;
+ (int)maxRequestVersion;
- (BOOL)hasLocaleChanged;
- (BOOL)supportsUIApplication;
- (BOOL)tipsAccessAllowed;
- (NSDate)lastMajorVersionUpdateDate;
- (NSMutableDictionary)appBundleIDMap;
- (NSMutableDictionary)collectionStatusMap;
- (NSString)language;
- (NSString)majorVersion;
- (NSString)model;
- (NSString)userLanguage;
- (NSUserDefaults)appGroupDefaults;
- (OS_dispatch_queue)syncQueue;
- (TPSCommonDefines)init;
- (TPSTipStatusController)tipStatusController;
- (id)activateDateForCollectionIdentifier:(id)a3;
- (id)appBundleIDForInstalledAppWithIdentifier:(id)a3;
- (id)archivedTipStatuses;
- (id)collectionIdentifierForCurrentUserType;
- (id)collectionIdentifierToUseForCollectionIdentifiers:(id)a3;
- (id)collectionStatusForCollectionIdentifier:(id)a3;
- (id)dateForCollectionIdentifier:(id)a3 dateType:(unint64_t)a4;
- (id)reloadAppGroupDefaults;
- (int)maxVersion;
- (int64_t)assetRatioType;
- (int64_t)daysSinceLastMajorVersionUpdate;
- (int64_t)userType;
- (void)activatedCollection:(id)a3;
- (void)activatedCollections:(id)a3;
- (void)archivedTipStatuses;
- (void)clearDataCache;
- (void)deleteTipStatusArchivalDirectory;
- (void)featuredCollection:(id)a3;
- (void)notifiedCollection:(id)a3;
- (void)reloadModelInformation;
- (void)resetCollectionStatusMap;
- (void)setAppBundleIDMap:(id)a3;
- (void)setCollectionStatusMap:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLastMajorVersionUpdateDate:(id)a3;
- (void)setMajorVersion:(id)a3;
- (void)setMaxVersion:(int)a3;
- (void)setModel:(id)a3;
- (void)setSupportsUIApplication:(BOOL)a3;
- (void)setSyncQueue:(id)a3;
- (void)setTipStatusController:(id)a3;
- (void)setUserLanguage:(id)a3;
- (void)syncCollectionStatusMap;
- (void)updateCollectionStatus:(unint64_t)a3 collections:(id)a4;
- (void)viewedCollection:(id)a3;
@end

@implementation TPSCommonDefines

- (NSDate)lastMajorVersionUpdateDate
{
  v3 = +[TPSDefaultsManager lastMajorVersionUpdateDate];
  if (!v3)
  {
    v3 = [(NSUserDefaults *)self->_appGroupDefaults objectForKey:@"TPSLastMajorVersionUpdateDate"];
  }
  return (NSDate *)v3;
}

- (id)collectionIdentifierToUseForCollectionIdentifiers:(id)a3
{
  id v3 = a3;
  uint64_t v21 = 0;
  v22 = (id *)&v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v4 = +[TPSCommonDefines softwareWelcomeCollectionIdentifier];
  v5 = +[TPSCommonDefines checklistCollectionIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__TPSCommonDefines_collectionIdentifierToUseForCollectionIdentifiers___block_invoke;
  v11[3] = &unk_1E5907BE0;
  v15 = &v17;
  id v6 = v4;
  id v12 = v6;
  v16 = &v21;
  id v7 = v5;
  id v13 = v7;
  id v8 = v3;
  id v14 = v8;
  [v8 enumerateObjectsUsingBlock:v11];
  if (*((unsigned char *)v18 + 24)) {
    objc_storeStrong(v22 + 5, v4);
  }
  id v9 = v22[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

+ (id)checklistCollectionIdentifier
{
  return @"Checklist";
}

+ (id)softwareWelcomeCollectionIdentifier
{
  return @"WhatsNewInIOS";
}

+ (BOOL)isInternalDevice
{
  return +[TPSDefaultsManager isInternalDevice];
}

- (NSString)language
{
  return self->_language;
}

+ (id)clientBundleIdentifier
{
  return @"com.apple.tips";
}

+ (BOOL)isPadUI
{
  v2 = [(id)objc_opt_class() deviceClass];
  char v3 = [v2 isEqualToString:@"iPad"];

  return v3;
}

+ (BOOL)isPhoneUI
{
  v2 = [(id)objc_opt_class() deviceClass];
  char v3 = [v2 isEqualToString:@"iPhone"];

  return v3;
}

+ (id)deviceClass
{
  if (deviceClass_onceToken != -1) {
    dispatch_once(&deviceClass_onceToken, &__block_literal_global_96);
  }
  v2 = (void *)deviceClass_deviceClass;
  return v2;
}

uint64_t __43__TPSCommonDefines_syncCollectionStatusMap__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) collectionStatusMap];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

+ (BOOL)callerIsTipsdWithSource:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__TPSCommonDefines_callerIsTipsdWithSource___block_invoke;
  v9[3] = &unk_1E5907BB8;
  id v10 = v4;
  id v11 = a1;
  uint64_t v5 = callerIsTipsdWithSource__predicate;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&callerIsTipsdWithSource__predicate, v9);
  }
  char v7 = callerIsTipsdWithSource__gCallerIsTipsd;

  return v7;
}

- (void)syncCollectionStatusMap
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__3;
  id v9 = __Block_byref_object_dispose__3;
  id v10 = 0;
  uint64_t v3 = [(TPSCommonDefines *)self syncQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__TPSCommonDefines_syncCollectionStatusMap__block_invoke;
  v4[3] = &unk_1E5906768;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(v3, v4);

  +[TPSSecureArchivingUtilities archivedDataWithRootObject:v6[5] forKey:@"collectionStatusMap" userDefaults:self->_appGroupDefaults];
  _Block_object_dispose(&v5, 8);
}

- (void)updateCollectionStatus:(unint64_t)a3 collections:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (![v6 count]) {
    goto LABEL_27;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v8)
  {

    goto LABEL_27;
  }
  uint64_t v9 = v8;
  id v19 = v6;
  char v20 = 0;
  uint64_t v10 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
      uint64_t v13 = -[TPSCommonDefines dateForCollectionIdentifier:dateType:](self, "dateForCollectionIdentifier:dateType:", v12, a3, v19);
      if (v13)
      {
        id v14 = (void *)v13;
        goto LABEL_22;
      }
      v15 = [(TPSCommonDefines *)self collectionStatusForCollectionIdentifier:v12];
      if (v15)
      {
        id v14 = [MEMORY[0x1E4F1C9C8] date];
        if (a3 == 2)
        {
          v18 = [v15 featuredDate];

          if (!v18)
          {
            [v15 setFeaturedDate:v14];
            goto LABEL_20;
          }
        }
        else
        {
          if (a3 != 1)
          {
            if (a3) {
              goto LABEL_21;
            }
            v16 = [v15 activatedDate];

            if (v16) {
              goto LABEL_21;
            }
            [v15 setActivatedDate:v14];
            goto LABEL_20;
          }
          uint64_t v17 = [v15 firstViewedDate];

          if (!v17)
          {
            [v15 setFirstViewedDate:v14];
LABEL_20:
            char v20 = 1;
          }
        }
      }
      else
      {
        id v14 = 0;
      }
LABEL_21:

LABEL_22:
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v9);

  id v6 = v19;
  if (v20) {
    [(TPSCommonDefines *)self syncCollectionStatusMap];
  }
LABEL_27:
}

- (id)dateForCollectionIdentifier:(id)a3 dateType:(unint64_t)a4
{
  uint64_t v5 = [(TPSCommonDefines *)self collectionStatusForCollectionIdentifier:a3];
  id v6 = v5;
  if (!v5) {
    goto LABEL_6;
  }
  if (a4 == 2)
  {
    uint64_t v7 = [v5 featuredDate];
    goto LABEL_9;
  }
  if (a4 == 1)
  {
    uint64_t v7 = [v5 firstViewedDate];
    goto LABEL_9;
  }
  if (a4)
  {
LABEL_6:
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = [v5 activatedDate];
LABEL_9:
  uint64_t v8 = (void *)v7;
LABEL_10:

  return v8;
}

void __60__TPSCommonDefines_collectionStatusForCollectionIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v3 = [*(id *)(a1 + 32) collectionStatusMap];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __60__TPSCommonDefines_collectionStatusForCollectionIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) collectionStatusMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if ([*(id *)(a1 + 40) length])
    {
      id v6 = [[TPSCollectionStatus alloc] initWithIdentifier:*(void *)(a1 + 40)];
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      uint64_t v9 = [*(id *)(a1 + 32) syncQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__TPSCommonDefines_collectionStatusForCollectionIdentifier___block_invoke_2;
      block[3] = &unk_1E5907930;
      uint64_t v10 = *(void **)(a1 + 40);
      block[4] = *(void *)(a1 + 32);
      id v11 = v10;
      uint64_t v12 = *(void *)(a1 + 48);
      id v14 = v11;
      uint64_t v15 = v12;
      dispatch_async(v9, block);
    }
  }
}

- (NSMutableDictionary)collectionStatusMap
{
  collectionStatusMap = self->_collectionStatusMap;
  if (!collectionStatusMap)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
    uint64_t v9 = +[TPSSecureArchivingUtilities unarchivedObjectOfClasses:v8 forKey:@"collectionStatusMap" userDefaults:self->_appGroupDefaults];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = (NSMutableDictionary *)[MEMORY[0x1E4F1CC08] mutableCopy];
    }
    id v11 = self->_collectionStatusMap;
    self->_collectionStatusMap = v10;

    collectionStatusMap = self->_collectionStatusMap;
  }
  return collectionStatusMap;
}

- (id)collectionStatusForCollectionIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  uint64_t v5 = [(TPSCommonDefines *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__TPSCommonDefines_collectionStatusForCollectionIdentifier___block_invoke;
  block[3] = &unk_1E59073F8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (NSString)majorVersion
{
  return self->_majorVersion;
}

uint64_t __42__TPSCommonDefines_reloadAppGroupDefaults__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCollectionStatusMap:0];
}

- (void)setCollectionStatusMap:(id)a3
{
}

uint64_t __34__TPSCommonDefines_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(TPSCommonDefines);
  uint64_t v1 = sharedInstance_gTPSCommonDefines;
  sharedInstance_gTPSCommonDefines = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)hardwareChanged
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = (void *)MGCopyAnswer();
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [v2 objectForKey:@"CurrentProductHash"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  if (v6 != v4)
  {
    id v7 = [NSNumber numberWithUnsignedInteger:v4];
    [v2 setObject:v7 forKey:@"CurrentProductHash"];

    [v2 synchronize];
  }

  return v6 != v4;
}

- (void)clearDataCache
{
  +[TPSDataCacheController removeAllDataCache];
  uint64_t v3 = +[TPSJSONCacheController sharedInstance];
  [v3 removeAllDataCache];

  uint64_t v4 = +[TPSAssetCacheController sharedInstance];
  [v4 removeAllDataCache];

  [(NSUserDefaults *)self->_appGroupDefaults removeObjectForKey:@"TPSDataCacheIdentifier"];
  [(NSUserDefaults *)self->_appGroupDefaults removeObjectForKey:@"TPSAssetCacheIdentifier"];
  [(NSUserDefaults *)self->_appGroupDefaults removeObjectForKey:@"TPSJSONCacheIdentifier"];
  [(NSUserDefaults *)self->_appGroupDefaults removeObjectForKey:@"TPSStringCacheIdentifier"];
  appGroupDefaults = self->_appGroupDefaults;
  [(NSUserDefaults *)appGroupDefaults synchronize];
}

+ (id)appGroupIdentifier
{
  return @"group.com.apple.tips";
}

- (BOOL)tipsAccessAllowed
{
  return self->_tipsAccessAllowed;
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate_4 != -1) {
    dispatch_once(&sharedInstance_predicate_4, &__block_literal_global_13);
  }
  uint64_t v2 = (void *)sharedInstance_gTPSCommonDefines;
  return v2;
}

- (TPSTipStatusController)tipStatusController
{
  return self->_tipStatusController;
}

- (id)reloadAppGroupDefaults
{
  if (self->_tipsAccessAllowed)
  {
    if (!self->_appGroupDefaults)
    {
      uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v4 = (id)[v3 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.tips"];

      uint64_t v5 = (NSUserDefaults *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"group.com.apple.tips"];
      appGroupDefaults = self->_appGroupDefaults;
      self->_appGroupDefaults = v5;
    }
    if ([(TPSCommonDefines *)self hasLocaleChanged]) {
      [(TPSCommonDefines *)self clearDataCache];
    }
    id v7 = [(TPSCommonDefines *)self syncQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__TPSCommonDefines_reloadAppGroupDefaults__block_invoke;
    block[3] = &unk_1E5906740;
    block[4] = self;
    dispatch_async(v7, block);

    [(TPSTipStatusController *)self->_tipStatusController setAppGroupDefaults:self->_appGroupDefaults];
    uint64_t v8 = self->_appGroupDefaults;
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (BOOL)hasLocaleChanged
{
  uint64_t v3 = [(NSUserDefaults *)self->_appGroupDefaults objectForKey:@"lastViewedLocale"];
  id v4 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v5 = [v4 firstObject];

  char v6 = [v3 isEqualToString:v5];
  if ((v6 & 1) == 0)
  {
    [(NSUserDefaults *)self->_appGroupDefaults setObject:v5 forKey:@"lastViewedLocale"];
    [(NSUserDefaults *)self->_appGroupDefaults synchronize];
  }

  return v6 ^ 1;
}

- (void)setLanguage:(id)a3
{
}

- (TPSCommonDefines)init
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)TPSCommonDefines;
  uint64_t v2 = [(TPSCommonDefines *)&v43 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.TipsCore.TPSCommonDefine", v3);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v4;

    char v6 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    if (v6)
    {
      id v7 = v6;
      CFBooleanRef v8 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v6, @"com.apple.private.tips.allow", 0);
      if (v8)
      {
        CFBooleanRef v9 = v8;
        CFTypeID v10 = CFGetTypeID(v8);
        if (v10 == CFBooleanGetTypeID()) {
          v2->_tipsAccessAllowed = CFBooleanGetValue(v9) != 0;
        }
        CFRelease(v9);
      }
      CFRelease(v7);
    }
    v2->_uint64_t maxVersion = +[TPSCommonDefines maxRequestVersion];
    id v11 = (void *)MGCopyAnswer();
    uint64_t v12 = [v11 componentsSeparatedByString:@"."];
    uint64_t v13 = [v12 firstObject];
    majorVersion = v2->_majorVersion;
    v2->_majorVersion = (NSString *)v13;

    if ([(NSString *)v2->_majorVersion intValue] > v2->_maxVersion)
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v2->_maxVersion);
      v16 = v2->_majorVersion;
      v2->_majorVersion = (NSString *)v15;
    }
    if (!v2->_tipsAccessAllowed) {
      goto LABEL_32;
    }
    id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    v18 = [v17 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.tips"];

    id v19 = +[TPSLogger data];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v45 = (uint64_t)v18;
      _os_log_impl(&dword_19C8DC000, v19, OS_LOG_TYPE_DEFAULT, "App group path %@", buf, 0xCu);
    }

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"group.com.apple.tips"];
    appGroupDefaults = v2->_appGroupDefaults;
    v2->_appGroupDefaults = (NSUserDefaults *)v20;

    long long v22 = [[TPSTipStatusController alloc] initWithAppGroupDefaults:v2->_appGroupDefaults];
    tipStatusController = v2->_tipStatusController;
    v2->_tipStatusController = v22;

    long long v24 = (void *)MGCopyAnswer();
    v25 = [v24 componentsSeparatedByString:@"."];
    uint64_t v26 = [v25 firstObject];
    uint64_t v27 = [v26 integerValue];

    if (v27 >= v2->_maxVersion) {
      uint64_t maxVersion = v2->_maxVersion;
    }
    else {
      uint64_t maxVersion = v27;
    }
    uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
    appBundleIDMap = v2->_appBundleIDMap;
    v2->_appBundleIDMap = (NSMutableDictionary *)v29;

    [(TPSCommonDefines *)v2 reloadModelInformation];
    v31 = +[TPSDefaultsManager assetRatioIdentifier];
    v32 = v31;
    if (v31)
    {
      unint64_t v33 = [v31 integerValue];
      if (v33 <= 1) {
        uint64_t v34 = v33;
      }
      else {
        uint64_t v34 = 0;
      }
    }
    else
    {
      if (!MGGetBoolAnswer())
      {
        v2->_assetRatioType = 0;
        goto LABEL_23;
      }
      uint64_t v34 = 1;
    }
    v2->_assetRatioType = v34;
LABEL_23:
    uint64_t v35 = [(NSUserDefaults *)v2->_appGroupDefaults integerForKey:@"appGroupLastCleanupMajorVersion"];
    BOOL v36 = +[TPSDefaultsManager resetDataCache];
    if (v35 != maxVersion || v36)
    {
      v37 = +[TPSLogger data];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v45 = v35;
        __int16 v46 = 2048;
        uint64_t v47 = maxVersion;
        _os_log_impl(&dword_19C8DC000, v37, OS_LOG_TYPE_DEFAULT, "Clean up app group defaults as major version changed from version %zd to %zd", buf, 0x16u);
      }

      v38 = v2->_appGroupDefaults;
      v39 = objc_msgSend(MEMORY[0x1E4F1CA20], "tps_userLanguageCode");
      [(NSUserDefaults *)v38 setObject:v39 forKey:@"TPSUserLanguage"];

      v40 = v2->_appGroupDefaults;
      v41 = [NSNumber numberWithInteger:maxVersion];
      [(NSUserDefaults *)v40 setObject:v41 forKey:@"appGroupLastCleanupMajorVersion"];

      [(NSUserDefaults *)v2->_appGroupDefaults removeObjectForKey:@"collectionStatusMap"];
      [(NSUserDefaults *)v2->_appGroupDefaults removeObjectForKey:@"TPSLaunchedFromWidgetKey"];
      [(NSUserDefaults *)v2->_appGroupDefaults removeObjectForKey:@"TipsUserType"];
      [(NSUserDefaults *)v2->_appGroupDefaults removeObjectForKey:@"TPSWidgetDocument"];
      [(NSUserDefaults *)v2->_appGroupDefaults removeObjectForKey:@"TPSWidgetTip"];
      [(NSUserDefaults *)v2->_appGroupDefaults removeObjectForKey:@"specialTargetCacheMap"];
      [(NSUserDefaults *)v2->_appGroupDefaults removeObjectForKey:@"TPSViewedTipIdentifiers"];
      [(NSUserDefaults *)v2->_appGroupDefaults removeObjectForKey:@"TPSImageCacheIdentifier"];
      [(NSUserDefaults *)v2->_appGroupDefaults removeObjectForKey:@"TPSVideoCacheIdentifier"];
      [(NSUserDefaults *)v2->_appGroupDefaults removeObjectForKey:@"TPSFileCacheIdentifier"];
      [(NSUserDefaults *)v2->_appGroupDefaults removeObjectForKey:@"TPSExperimentCamp"];
      [(NSUserDefaults *)v2->_appGroupDefaults removeObjectForKey:@"TPSValidTipIdentifiers"];
      [(NSUserDefaults *)v2->_appGroupDefaults removeObjectForKey:@"collectionActivationMap"];
      [(NSUserDefaults *)v2->_appGroupDefaults removeObjectForKey:@"specialTargetCache"];
      [(NSUserDefaults *)v2->_appGroupDefaults removeObjectForKey:@"appGroupLastWipeMajorVersion"];
      [(NSUserDefaults *)v2->_appGroupDefaults synchronize];
    }
    else if (![(TPSCommonDefines *)v2 hasLocaleChanged])
    {
      goto LABEL_31;
    }
    [(TPSCommonDefines *)v2 clearDataCache];
LABEL_31:

LABEL_32:
  }
  return v2;
}

- (void)reloadModelInformation
{
  uint64_t v3 = +[TPSDefaultsManager deviceModel];
  id v8 = v3;
  if (v3)
  {
    dispatch_queue_t v4 = [v3 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1EED877F8];
    model = self->_model;
    self->_model = v4;

    uint64_t v3 = v8;
  }
  if (!self->_model)
  {
    char v6 = (NSString *)MGCopyAnswer();
    id v7 = self->_model;
    self->_model = v6;

    uint64_t v3 = v8;
  }
}

- (void)activatedCollections:(id)a3
{
}

+ (int)maxRequestVersion
{
  return 18;
}

uint64_t __70__TPSCommonDefines_collectionIdentifierToUseForCollectionIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    || ![v4 isEqualToString:*(void *)(a1 + 32)])
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)
      && (![0 isEqualToString:*(void *)(a1 + 40)]
       || (unint64_t)[*(id *)(a1 + 48) count] <= 1))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  return MEMORY[0x1F41817F8]();
}

+ (id)productVersion
{
  uint64_t v2 = (void *)MGCopyAnswer();
  return v2;
}

+ (id)deviceName
{
  uint64_t v2 = (void *)MGCopyAnswer();
  return v2;
}

- (int64_t)userType
{
  if (userType_onceToken != -1) {
    dispatch_once(&userType_onceToken, &__block_literal_global_221);
  }
  return userType_gUserType;
}

- (NSUserDefaults)appGroupDefaults
{
  return self->_appGroupDefaults;
}

void __31__TPSCommonDefines_deviceClass__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  uint64_t v1 = (void *)deviceClass_deviceClass;
  deviceClass_deviceClass = v0;

  if ([(id)deviceClass_deviceClass isEqualToString:@"RealityDevice"])
  {
    uint64_t v2 = (void *)deviceClass_deviceClass;
    deviceClass_deviceClass = @"apple-vision-pro";
  }
}

+ (id)tipsCoreFrameworkBundle
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__TPSCommonDefines_tipsCoreFrameworkBundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tipsCoreFrameworkBundle_predicate != -1) {
    dispatch_once(&tipsCoreFrameworkBundle_predicate, block);
  }
  uint64_t v2 = (void *)tipsCoreFrameworkBundle_gTipsCoreFrameworkBundle;
  return v2;
}

uint64_t __43__TPSCommonDefines_tipsCoreFrameworkBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v1 = tipsCoreFrameworkBundle_gTipsCoreFrameworkBundle;
  tipsCoreFrameworkBundle_gTipsCoreFrameworkBundle = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)isInternalBuild
{
  return MGGetBoolAnswer();
}

+ (BOOL)isMacUI
{
  uint64_t v2 = [(id)objc_opt_class() deviceClass];
  char v3 = [v2 isEqualToString:@"Mac"];

  return v3;
}

+ (BOOL)isVisionUI
{
  uint64_t v2 = [(id)objc_opt_class() deviceClass];
  char v3 = [v2 isEqualToString:@"apple-vision-pro"];

  return v3;
}

+ (BOOL)isGreenTeaDevice
{
  if (isGreenTeaDevice_onceToken != -1) {
    dispatch_once(&isGreenTeaDevice_onceToken, &__block_literal_global_35);
  }
  return isGreenTeaDevice_deviceIsGreenTea;
}

uint64_t __36__TPSCommonDefines_isGreenTeaDevice__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isGreenTeaDevice_deviceIsGreenTea = result;
  return result;
}

+ (id)osBuild
{
  if (osBuild_onceToken != -1) {
    dispatch_once(&osBuild_onceToken, &__block_literal_global_40);
  }
  uint64_t v2 = (void *)osBuild_gOSBuild;
  return v2;
}

void __27__TPSCommonDefines_osBuild__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  id v2 = (id)v0;
  if (v0)
  {
    uint64_t v0 = [@"iOS-" stringByAppendingString:v0];
  }
  uint64_t v1 = (void *)osBuild_gOSBuild;
  osBuild_gOSBuild = v0;
}

+ (id)deviceFamily
{
  id v2 = (void *)MGCopyAnswer();
  char v3 = [v2 stringByReplacingOccurrencesOfString:@" " withString:&stru_1EED877F8];

  return v3;
}

+ (id)deviceMarketingName
{
  id v2 = (void *)MGCopyAnswer();
  uint64_t v3 = objc_msgSend(v2, "rangeOfString:", @" (");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [v2 substringToIndex:v3];

    id v2 = (void *)v4;
  }
  return v2;
}

+ (id)notificationBundleIdentifier
{
  return @"com.apple.tips";
}

+ (double)displayScale
{
  MGGetFloat32Answer();
  return v2;
}

void __44__TPSCommonDefines_callerIsTipsdWithSource___block_invoke(uint64_t a1)
{
  float v2 = [*(id *)(a1 + 40) mainBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.tipsd"];
  callerIsTipsdWithSource__gCallerIsTipsd = v3;
  uint64_t v4 = +[TPSLogger default];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __44__TPSCommonDefines_callerIsTipsdWithSource___block_invoke_cold_1(a1, v4);
    }
  }
  else if (v5)
  {
    __44__TPSCommonDefines_callerIsTipsdWithSource___block_invoke_cold_2(a1, (uint64_t)v2, v4);
  }
}

+ (BOOL)isSeniorUser
{
  if (isSeniorUser_predicate != -1) {
    dispatch_once(&isSeniorUser_predicate, &__block_literal_global_81_1);
  }
  return isSeniorUser_kIsSeniorUser;
}

void __32__TPSCommonDefines_isSeniorUser__block_invoke()
{
  id v1 = [MEMORY[0x1E4F4EF40] sharedInstance];
  uint64_t v0 = [v1 primaryAuthKitAccount];
  isSeniorUser_kIsSeniorUser = [v1 userIsSeniorForAccount:v0];
}

+ (BOOL)isChecklistCollectionWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[TPSCommonDefines checklistCollectionIdentifier];
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

+ (BOOL)isSavedTipsCollectionIdentifier:(id)a3
{
  return [@"SavedTips" isEqualToString:a3];
}

+ (BOOL)supportsFaceID
{
  return MGGetBoolAnswer();
}

+ (BOOL)supportsUserGuide
{
  return 1;
}

+ (BOOL)supportsCloudDeviceUserGuide
{
  return 1;
}

+ (int)buttonType
{
  return MEMORY[0x1F417CE28](@"DeviceMesaType", 0);
}

+ (id)deviceGuideIdentifier
{
  float v2 = [a1 deviceClass];
  id v3 = [v2 lowercaseString];

  return v3;
}

+ (id)deviceSymbol
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = [a1 deviceGuideIdentifier];
  char v5 = [v3 stringWithString:v4];

  if ([a1 isPadUI] && (objc_msgSend(a1, "supportsFaceID") & 1) == 0)
  {
    unsigned int v6 = [a1 buttonType];
    if (v6 >= 2)
    {
      if (v6 != 2) {
        goto LABEL_8;
      }
      id v7 = @".gen2";
    }
    else
    {
      id v7 = @".gen1";
    }
    [v5 appendString:v7];
  }
LABEL_8:
  return v5;
}

+ (id)hardwareWelcomeCollectionIdentifier
{
  return @"WelcomeToIOS";
}

+ (id)switcherWelcomeCollectionIdentifier
{
  return @"WelcomeIOSSwitcher";
}

- (NSString)userLanguage
{
  userLanguage = self->_userLanguage;
  if (!userLanguage)
  {
    uint64_t v4 = [(NSUserDefaults *)self->_appGroupDefaults stringForKey:@"TPSUserLanguage"];
    char v5 = self->_userLanguage;
    self->_userLanguage = v4;

    userLanguage = self->_userLanguage;
  }
  return userLanguage;
}

- (void)setUserLanguage:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_userLanguage, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_userLanguage, a3);
    [(NSUserDefaults *)self->_appGroupDefaults setObject:self->_userLanguage forKey:@"TPSUserLanguage"];
    [(NSUserDefaults *)self->_appGroupDefaults synchronize];
  }
}

- (void)notifiedCollection:(id)a3
{
  if (a3)
  {
    uint64_t v4 = -[TPSCommonDefines collectionStatusForCollectionIdentifier:](self, "collectionStatusForCollectionIdentifier:");
    id v5 = v4;
    if (v4)
    {
      unsigned int v6 = v4;
      uint64_t v4 = (void *)[v4 canNotify];
      id v5 = v6;
      if (v4)
      {
        [v6 setCanNotify:0];
        uint64_t v4 = (void *)[(TPSCommonDefines *)self syncCollectionStatusMap];
        id v5 = v6;
      }
    }
    MEMORY[0x1F41817F8](v4, v5);
  }
}

- (void)featuredCollection:(id)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(TPSCommonDefines *)self updateCollectionStatus:2 collections:v4];
  }
}

- (void)viewedCollection:(id)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(TPSCommonDefines *)self updateCollectionStatus:1 collections:v4];
  }
}

- (void)activatedCollection:(id)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(TPSCommonDefines *)self updateCollectionStatus:0 collections:v4];
  }
}

- (void)resetCollectionStatusMap
{
  [(NSUserDefaults *)self->_appGroupDefaults removeObjectForKey:@"collectionStatusMap"];
  appGroupDefaults = self->_appGroupDefaults;
  [(NSUserDefaults *)appGroupDefaults synchronize];
}

- (id)activateDateForCollectionIdentifier:(id)a3
{
  return [(TPSCommonDefines *)self dateForCollectionIdentifier:a3 dateType:0];
}

- (id)appBundleIDForInstalledAppWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  id v5 = [(TPSCommonDefines *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__TPSCommonDefines_appBundleIDForInstalledAppWithIdentifier___block_invoke;
  block[3] = &unk_1E59073F8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __61__TPSCommonDefines_appBundleIDForInstalledAppWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && ([*(id *)(a1 + 40) hasPrefix:@"*"] & 1) == 0
    && [*(id *)(a1 + 40) length])
  {
    int v5 = [*(id *)(a1 + 40) hasPrefix:@"com.apple."];
    id v6 = *(void **)(a1 + 40);
    if (v5)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      id v8 = v6;
      CFBooleanRef v9 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v8;
    }
    else
    {
      uint64_t v10 = [@"com.apple." stringByAppendingString:v6];
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      CFBooleanRef v9 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }

    if ([(id)objc_opt_class() isAppValidWithBundleIdentifier:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)])
    {
      uint64_t v12 = [*(id *)(a1 + 32) syncQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__TPSCommonDefines_appBundleIDForInstalledAppWithIdentifier___block_invoke_2;
      block[3] = &unk_1E5907930;
      uint64_t v13 = *(void **)(a1 + 40);
      block[4] = *(void *)(a1 + 32);
      id v14 = v13;
      uint64_t v15 = *(void *)(a1 + 48);
      id v19 = v14;
      uint64_t v20 = v15;
      dispatch_async(v12, block);
    }
    else
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
      id v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = 0;
    }
  }
}

void __61__TPSCommonDefines_appBundleIDForInstalledAppWithIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v3 = [*(id *)(a1 + 32) appBundleIDMap];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __28__TPSCommonDefines_userType__block_invoke()
{
  unint64_t v0 = +[TPSUserTypeChecker userTypeOverride];
  if (v0 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v1 = +[TPSCommonDefines sharedInstance];
    uint64_t v2 = [v1 appGroupDefaults];

    id v3 = [v2 objectForKey:@"TipsUserType"];
    id v4 = v3;
    if (!v3 || (unint64_t v0 = [v3 integerValue], v0 >= 3))
    {
      unint64_t v0 = +[TPSUserTypeChecker userType];
      int v5 = [NSNumber numberWithInteger:v0];
      [v2 setObject:v5 forKey:@"TipsUserType"];

      [v2 synchronize];
    }
  }
  userType_gUserType = v0;
}

- (id)collectionIdentifierForCurrentUserType
{
  int64_t v2 = [(TPSCommonDefines *)self userType];
  if (v2 == 2)
  {
    id v3 = +[TPSCommonDefines switcherWelcomeCollectionIdentifier];
  }
  else
  {
    if (v2) {
      +[TPSCommonDefines softwareWelcomeCollectionIdentifier];
    }
    else {
    id v3 = +[TPSCommonDefines hardwareWelcomeCollectionIdentifier];
    }
  }
  return v3;
}

- (int64_t)daysSinceLastMajorVersionUpdate
{
  int64_t v2 = [(TPSCommonDefines *)self lastMajorVersionUpdateDate];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    int v5 = [v3 components:16 fromDate:v2 toDate:v4 options:0];

    int64_t v6 = [v5 day];
  }
  else
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (void)setLastMajorVersionUpdateDate:(id)a3
{
}

- (id)archivedTipStatuses
{
  v36[2] = *MEMORY[0x1E4F143B8];
  int64_t v2 = [(id)objc_opt_class() _tipStatusArchivalURL];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v4 = *MEMORY[0x1E4F1C628];
    v36[0] = *MEMORY[0x1E4F1C6E8];
    v36[1] = v4;
    int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    long long v21 = v2;
    int64_t v6 = [v3 enumeratorAtURL:v2 includingPropertiesForKeys:v5 options:4 errorHandler:&__block_literal_global_230];

    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v26 = 0;
          [v12 getResourceValue:&v26 forKey:v4 error:0];
          id v13 = v26;
          if (([v13 BOOLValue] & 1) == 0)
          {
            id v25 = v9;
            id v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v12 options:1 error:&v25];
            id v15 = v25;

            if (v14)
            {
              uint64_t v16 = (void *)MEMORY[0x1E4F28DC0];
              uint64_t v17 = objc_opt_class();
              id v24 = v15;
              v18 = [v16 unarchivedObjectOfClass:v17 fromData:v14 error:&v24];
              id v9 = v24;

              if (v18)
              {
                [v22 addObject:v18];
              }
              else
              {
                id v19 = +[TPSLogger default];
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
                  [(TPSCommonDefines *)v33 archivedTipStatuses];
                }
              }
            }
            else
            {
              v18 = +[TPSLogger default];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v32 = v15;
                _os_log_error_impl(&dword_19C8DC000, v18, OS_LOG_TYPE_ERROR, "Failed to unarchive tip status. Error: %@", buf, 0xCu);
              }
              id v9 = v15;
            }
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    int64_t v2 = v21;
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

uint64_t __39__TPSCommonDefines_archivedTipStatuses__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v5 code] != 260)
  {
    int64_t v6 = +[TPSLogger default];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __39__TPSCommonDefines_archivedTipStatuses__block_invoke_cold_1((uint64_t)v4, (uint64_t)v5, v6);
    }
  }
  return 1;
}

- (void)deleteTipStatusArchivalDirectory
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C8DC000, a2, OS_LOG_TYPE_ERROR, "Failed to remove item with error: %@", (uint8_t *)&v2, 0xCu);
}

+ (id)_tipStatusArchivalURL
{
  int v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [v2 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.tips"];

  uint64_t v4 = [v3 URLByAppendingPathComponent:@"Library/Archived" isDirectory:1];

  return v4;
}

+ (id)mainBundleIdentifier
{
  if (mainBundleIdentifier_onceToken != -1) {
    dispatch_once(&mainBundleIdentifier_onceToken, &__block_literal_global_239);
  }
  int v2 = (void *)mainBundleIdentifier_gMainBundleIdentifier;
  return v2;
}

void __40__TPSCommonDefines_mainBundleIdentifier__block_invoke()
{
  unint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = v0;
  if (v0)
  {
    uint64_t v1 = [v0 bundleIdentifier];
  }
  else
  {
    MainBundle = CFBundleGetMainBundle();
    if (!MainBundle) {
      goto LABEL_6;
    }
    uint64_t v1 = CFBundleGetValueForInfoDictionaryKey(MainBundle, (CFStringRef)*MEMORY[0x1E4F1CFF8]);
  }
  uint64_t v3 = (void *)mainBundleIdentifier_gMainBundleIdentifier;
  mainBundleIdentifier_gMainBundleIdentifier = v1;

LABEL_6:
}

- (int)maxVersion
{
  return self->_maxVersion;
}

- (void)setMaxVersion:(int)a3
{
  self->_uint64_t maxVersion = a3;
}

- (BOOL)supportsUIApplication
{
  return self->_supportsUIApplication;
}

- (void)setSupportsUIApplication:(BOOL)a3
{
  self->_supportsUIApplication = a3;
}

- (void)setMajorVersion:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSMutableDictionary)appBundleIDMap
{
  return self->_appBundleIDMap;
}

- (void)setAppBundleIDMap:(id)a3
{
}

- (int64_t)assetRatioType
{
  return self->_assetRatioType;
}

- (void)setTipStatusController:(id)a3
{
}

- (void)setSyncQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_tipStatusController, 0);
  objc_storeStrong((id *)&self->_appBundleIDMap, 0);
  objc_storeStrong((id *)&self->_collectionStatusMap, 0);
  objc_storeStrong((id *)&self->_appGroupDefaults, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_majorVersion, 0);
  objc_storeStrong((id *)&self->_userLanguage, 0);
  objc_storeStrong((id *)&self->_cloudDevices, 0);
}

+ (BOOL)isAppValidWithBundleIdentifier:(id)a3
{
  uint64_t v4 = sub_19C9768B0();
  uint64_t v6 = v5;
  objc_allocWithZone(MEMORY[0x1E4F223C8]);
  swift_bridgeObjectRetain();
  id v7 = sub_19C8DFBDC(v4, v6, 1);
  id v9 = v7;
  if (v7)
  {
    unsigned __int8 v10 = objc_msgSend(a1, sel_isRecordValid_, v7);
    swift_bridgeObjectRelease();

    return v10;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

+ (BOOL)isAppRestrictedWithBundleIdentifier:(id)a3
{
  uint64_t v3 = sub_19C9768B0();
  uint64_t v5 = v4;
  objc_allocWithZone(MEMORY[0x1E4F223C8]);
  swift_bridgeObjectRetain();
  id v6 = sub_19C8DFBDC(v3, v5, 1);
  uint64_t v8 = v6;
  if (v6)
  {
    id v9 = objc_msgSend(v6, sel_applicationState);
    unsigned __int8 v10 = objc_msgSend(v9, sel_isRestricted);
    swift_bridgeObjectRelease();

    return v10;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

+ (BOOL)isRecordValid:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, sel_applicationState);
  if (objc_msgSend(v4, sel_isRestricted))
  {
    unsigned __int8 v5 = 0;
  }
  else if (objc_msgSend(v4, sel_isInstalled))
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unsigned __int8 v5 = objc_msgSend(v4, sel_isPlaceholder);
  }

  return v5;
}

void __44__TPSCommonDefines_callerIsTipsdWithSource___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_19C8DC000, a2, OS_LOG_TYPE_DEBUG, "%@: Caller is tipsd.", (uint8_t *)&v3, 0xCu);
}

void __44__TPSCommonDefines_callerIsTipsdWithSource___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_19C8DC000, log, OS_LOG_TYPE_DEBUG, "%@: Caller is not tipsd. Caller is: %@", (uint8_t *)&v4, 0x16u);
}

- (void)archivedTipStatuses
{
  uint64_t v7 = [a2 path];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_19C8DC000, a4, OS_LOG_TYPE_DEBUG, "Skipping unrecognized archive: %@", a1, 0xCu);
}

void __39__TPSCommonDefines_archivedTipStatuses__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19C8DC000, log, OS_LOG_TYPE_ERROR, "Error enumerating archived tip status directory. URL: %@ Error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end