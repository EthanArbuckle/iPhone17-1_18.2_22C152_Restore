@interface FMDLocalActivationLockInfoManager
+ (id)sharedInstance;
- (BOOL)_isFeatureEnabled;
- (BOOL)_isWithinDaemonStartupThreshold;
- (BOOL)_readIODeviceSupportsFindMy;
- (FMDLocalActivationLockInfoManager)init;
- (FMDLocalActivationLockInfoStore)store;
- (NSData)offlineFindingInfo;
- (NSNumber)activationLockStatus;
- (NSNumber)offlineFindingStatus;
- (NSString)maskedAppleID;
- (OS_dispatch_queue)storeAccessQueue;
- (SPSettingsConfigurating)settingsConfig;
- (id)_fetchOfflineFindingInfoInternal;
- (id)_locKeyForALEnabled;
- (id)_locKeyForOfflineFindingEnabled;
- (id)maskedAppleIDValue;
- (void)_addLocalizedStrings:(id)a3;
- (void)_cacheLocalState;
- (void)_postLocalActivationLockInfoChangedNotification;
- (void)_setupSPStatusListener;
- (void)activationLockInfoWithCompletion:(id)a3;
- (void)clearAllState;
- (void)clearMaskedAppleIDValue;
- (void)clearOfflineFindingInfoWithCompletion:(id)a3;
- (void)fetchOfflineFindingInfoWithCompletion:(id)a3;
- (void)setActivationLockStatus:(id)a3;
- (void)setMaskedAppleID:(id)a3;
- (void)setOfflineFindingInfo:(id)a3;
- (void)setOfflineFindingStatus:(id)a3;
- (void)setSettingsConfig:(id)a3;
- (void)setStore:(id)a3;
- (void)setStoreAccessQueue:(id)a3;
- (void)storeOfflineFindingInfo:(id)a3 completion:(id)a4;
- (void)updateActivationLockStatus:(BOOL)a3;
- (void)updateMaskedAppleID:(id)a3;
- (void)updateOfflineFindingStatus:(BOOL)a3;
@end

@implementation FMDLocalActivationLockInfoManager

+ (id)sharedInstance
{
  if (qword_10031E7D8 != -1) {
    dispatch_once(&qword_10031E7D8, &stru_1002DA090);
  }
  v2 = (void *)qword_10031E7D0;

  return v2;
}

- (FMDLocalActivationLockInfoManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)FMDLocalActivationLockInfoManager;
  v2 = [(FMDLocalActivationLockInfoManager *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(FMDLocalActivationLockInfoNVRAMStore);
    store = v2->_store;
    v2->_store = (FMDLocalActivationLockInfoStore *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.icloud.findmydeviced.storeAccessQ", 0);
    storeAccessQueue = v2->_storeAccessQueue;
    v2->_storeAccessQueue = (OS_dispatch_queue *)v5;

    [(FMDLocalActivationLockInfoManager *)v2 _cacheLocalState];
    [(FMDLocalActivationLockInfoManager *)v2 _setupSPStatusListener];
  }
  return v2;
}

- (void)_cacheLocalState
{
  if ([(FMDLocalActivationLockInfoManager *)self _isFeatureEnabled])
  {
    v3 = [(FMDLocalActivationLockInfoManager *)self storeAccessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100026318;
    block[3] = &unk_1002D9378;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

- (void)_setupSPStatusListener
{
  if ([(FMDLocalActivationLockInfoManager *)self _isFeatureEnabled])
  {
    v3 = objc_opt_new();
    v4 = [v3 settingsConfiguration];
    settingsConfig = self->_settingsConfig;
    self->_settingsConfig = v4;

    v6 = [(FMDLocalActivationLockInfoManager *)self settingsConfig];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100026614;
    v7[3] = &unk_1002DA0B8;
    v7[4] = self;
    [v6 beginRefreshingServiceStateWithBlock:v7];
  }
}

- (void)updateActivationLockStatus:(BOOL)a3
{
  if ([(FMDLocalActivationLockInfoManager *)self _isFeatureEnabled])
  {
    dispatch_queue_t v5 = [(FMDLocalActivationLockInfoManager *)self storeAccessQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000267F0;
    v6[3] = &unk_1002DA0E0;
    v6[4] = self;
    BOOL v7 = a3;
    dispatch_async(v5, v6);
  }
}

- (void)updateOfflineFindingStatus:(BOOL)a3
{
  if ([(FMDLocalActivationLockInfoManager *)self _isFeatureEnabled])
  {
    dispatch_queue_t v5 = [(FMDLocalActivationLockInfoManager *)self storeAccessQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100026A10;
    v6[3] = &unk_1002DA0E0;
    BOOL v7 = a3;
    v6[4] = self;
    dispatch_async(v5, v6);
  }
}

- (void)updateMaskedAppleID:(id)a3
{
  id v4 = a3;
  if ([(FMDLocalActivationLockInfoManager *)self _isFeatureEnabled])
  {
    if (!v4)
    {
      dispatch_queue_t v5 = sub_100004238();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = [(FMDLocalActivationLockInfoManager *)self fm_logID];
        int v16 = 138412290;
        v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ cannot update maskedAppleID. Nil value provided", (uint8_t *)&v16, 0xCu);
      }
    }
    uint64_t v7 = [(FMDLocalActivationLockInfoManager *)self maskedAppleID];
    if (!v7) {
      goto LABEL_8;
    }
    objc_super v8 = (void *)v7;
    v9 = [(FMDLocalActivationLockInfoManager *)self maskedAppleID];
    v10 = [v9 lowercaseString];
    v11 = [v4 lowercaseString];
    unsigned __int8 v12 = [v10 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
LABEL_8:
      v13 = [(FMDLocalActivationLockInfoManager *)self store];
      [v13 updateMaskedAppleID:v4];

      [(FMDLocalActivationLockInfoManager *)self setMaskedAppleID:v4];
      [(FMDLocalActivationLockInfoManager *)self _postLocalActivationLockInfoChangedNotification];
      v14 = sub_100004238();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [(FMDLocalActivationLockInfoManager *)self fm_logID];
        int v16 = 138412546;
        v17 = v15;
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ Updating stored maskedAppleID with %@", (uint8_t *)&v16, 0x16u);
      }
    }
  }
}

- (void)clearMaskedAppleIDValue
{
  if ([(FMDLocalActivationLockInfoManager *)self _isFeatureEnabled])
  {
    v3 = [(FMDLocalActivationLockInfoManager *)self storeAccessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100026EAC;
    block[3] = &unk_1002D9378;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

- (id)maskedAppleIDValue
{
  if ([(FMDLocalActivationLockInfoManager *)self _isFeatureEnabled])
  {
    uint64_t v7 = 0;
    objc_super v8 = &v7;
    uint64_t v9 = 0x3032000000;
    v10 = sub_100027034;
    v11 = sub_100027044;
    id v12 = 0;
    v3 = [(FMDLocalActivationLockInfoManager *)self storeAccessQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002704C;
    v6[3] = &unk_1002D9210;
    v6[4] = self;
    void v6[5] = &v7;
    dispatch_sync(v3, v6);

    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)activationLockInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if (![(FMDLocalActivationLockInfoManager *)self _isFeatureEnabled]) {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
  objc_super v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_10002717C;
  v11 = &unk_1002DA108;
  id v12 = self;
  id v13 = v4;
  id v5 = v4;
  v6 = objc_retainBlock(&v8);
  uint64_t v7 = [(FMDLocalActivationLockInfoManager *)self storeAccessQueue];
  dispatch_async(v7, v6);
}

- (void)storeOfflineFindingInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(FMDLocalActivationLockInfoManager *)self _isFeatureEnabled])
  {
    objc_super v8 = [(FMDLocalActivationLockInfoManager *)self storeAccessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000273F4;
    block[3] = &unk_1002DA158;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)fetchOfflineFindingInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if (![(FMDLocalActivationLockInfoManager *)self _isFeatureEnabled]) {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
  id v5 = [(FMDLocalActivationLockInfoManager *)self storeAccessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000275B0;
  v7[3] = &unk_1002DA108;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)_fetchOfflineFindingInfoInternal
{
  v3 = [(FMDLocalActivationLockInfoManager *)self offlineFindingInfo];
  id v4 = v3;
  if (!v3 || ![v3 length])
  {
    id v5 = [(FMDLocalActivationLockInfoManager *)self store];
    uint64_t v6 = [v5 retrieveOfflineFindingInfo];

    [(FMDLocalActivationLockInfoManager *)self setOfflineFindingInfo:v6];
    id v4 = (void *)v6;
  }

  return v4;
}

- (void)clearOfflineFindingInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(FMDLocalActivationLockInfoManager *)self _isFeatureEnabled])
  {
    id v5 = [(FMDLocalActivationLockInfoManager *)self storeAccessQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100027A18;
    v6[3] = &unk_1002DA108;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)clearAllState
{
  if ([(FMDLocalActivationLockInfoManager *)self _isFeatureEnabled])
  {
    v3 = [(FMDLocalActivationLockInfoManager *)self storeAccessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100027B90;
    block[3] = &unk_1002D9378;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

- (void)_addLocalizedStrings:(id)a3
{
  id v4 = a3;
  v33 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/FindMyDevice.framework"];
  id v5 = [v33 localizations];
  uint64_t v6 = v5;
  if (v5 && [v5 count])
  {
    id v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(FMDLocalActivationLockInfoManager *)self fm_logID];
      id v9 = [v6 count];
      id v10 = [(FMDLocalActivationLockInfoManager *)self maskedAppleID];
      *(_DWORD *)buf = 138412802;
      v42 = v8;
      __int16 v43 = 2048;
      id v44 = v9;
      __int16 v45 = 2112;
      v46 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ - fetching strings for %lu localizations for id - %@", buf, 0x20u);
    }
    id v11 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    id v12 = +[NSMutableDictionary dictionary];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v27 = v6;
    id v13 = v6;
    id v35 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v35)
    {
      uint64_t v34 = *(void *)v37;
      uint64_t v31 = kFMDActivationLockInfoTitleKey;
      uint64_t v32 = kFMDActivationLockInfoDescriptionKey;
      v28 = self;
      v29 = v12;
      id v30 = v13;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v37 != v34) {
            objc_enumerationMutation(v13);
          }
          uint64_t v15 = *(void *)(*((void *)&v36 + 1) + 8 * (void)v14);
          int v16 = [v11[403] dictionary];
          if ([v4 isActivationLocked])
          {
            v17 = [(FMDLocalActivationLockInfoManager *)self _locKeyForALEnabled];
            __int16 v18 = [v33 localizedStringForKey:v17 value:&stru_1002E7428 table:0 localization:v15];
            if (v18) {
              [v16 setValue:v18 forKey:v31];
            }
          }
          if ([v4 isOfflineFindingEnabled]
            && ([v4 isRestrictedSKU] & 1) == 0)
          {
            v21 = v11;
            v20 = [(FMDLocalActivationLockInfoManager *)self _locKeyForOfflineFindingEnabled];
            v22 = [v33 localizedStringForKey:v20 value:&stru_1002E7428 table:0 localization:v15];
            if (v22)
            {
              v23 = [(FMDLocalActivationLockInfoManager *)self maskedAppleID];

              if (v23)
              {
                v24 = [(FMDLocalActivationLockInfoManager *)self maskedAppleID];
                v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v24);

                self = v28;
                id v12 = v29;
                [v16 setValue:v25 forKey:v32];
              }
            }

            id v11 = v21;
            id v13 = v30;
          }
          else
          {
            id v19 = [v4 maskedAppleID];

            if (!v19) {
              goto LABEL_23;
            }
            v20 = [v4 maskedAppleID];
            [v16 setValue:v20 forKey:v32];
          }

LABEL_23:
          if ([v16 count]) {
            [v12 setValue:v16 forKey:v15];
          }

          v14 = (char *)v14 + 1;
        }
        while (v35 != v14);
        id v35 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v35);
    }

    [v4 setLocaleStrings:v12];
    uint64_t v6 = v27;
  }
  else
  {
    id v12 = sub_100004238();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [(FMDLocalActivationLockInfoManager *)self fm_logID];
      *(_DWORD *)buf = 138412290;
      v42 = v26;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ - not adding localized strings since list of localizations is nil or empty", buf, 0xCu);
    }
  }
}

- (id)_locKeyForALEnabled
{
  v2 = +[FMDSystemConfig sharedInstance];
  id v3 = [v2 deviceClass];

  CFStringRef v4 = @"FM_ACTIVATION_LOCK_ENABLED_IPHONE_TEXT";
  if (v3 == (id)2) {
    CFStringRef v4 = @"FM_ACTIVATION_LOCK_ENABLED_IPAD_TEXT";
  }
  if (v3 == (id)3) {
    return @"FM_ACTIVATION_LOCK_ENABLED_IPOD_TEXT";
  }
  else {
    return (id)v4;
  }
}

- (id)_locKeyForOfflineFindingEnabled
{
  v2 = +[FMDSystemConfig sharedInstance];
  id v3 = [v2 deviceClass];

  CFStringRef v4 = @"FM_OFFLINE_FINDING_ENABLED_IPHONE_TEXT";
  if (v3 == (id)2) {
    CFStringRef v4 = @"FM_OFFLINE_FINDING_ENABLED_IPAD_TEXT";
  }
  if (v3 == (id)3) {
    return @"FM_OFFLINE_FINDING_ENABLED_IPOD_TEXT";
  }
  else {
    return (id)v4;
  }
}

- (BOOL)_readIODeviceSupportsFindMy
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000284C4;
  v20[3] = &unk_1002DA180;
  v20[4] = &v21;
  id v3 = objc_retainBlock(v20);
  CFDictionaryRef v4 = IOServiceNameMatching("AppleDialogSPMIPMU");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v4);
  *((_DWORD *)v22 + 6) = MatchingService;
  if (!MatchingService)
  {
    v14 = sub_100004238();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [(FMDLocalActivationLockInfoManager *)self fm_logID];
      *(_DWORD *)buf = 138412546;
      v26 = v16;
      __int16 v27 = 2080;
      v28 = "AppleDialogSPMIPMU";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ _readIODeviceSupportsFindMy: Could not find service: %s", buf, 0x16u);
    }
    goto LABEL_12;
  }
  CFProperty = (char *)IORegistryEntryCreateCFProperty(MatchingService, @"IOPMUBootLPMCtrl", 0, 0);
  id v7 = CFProperty;
  if (!CFProperty || (CFTypeID v8 = CFGetTypeID(CFProperty), v8 != CFDictionaryGetTypeID()))
  {
    v14 = sub_100004238();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [(FMDLocalActivationLockInfoManager *)self fm_logID];
      sub_10023C69C(v15, (uint64_t)v7, buf, v14);
    }
LABEL_12:

    ((void (*)(void *))v3[2])(v3);
    unsigned __int8 v13 = 0;
    goto LABEL_13;
  }
  id v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(FMDLocalActivationLockInfoManager *)self fm_logID];
    *(_DWORD *)buf = 138412546;
    v26 = v10;
    __int16 v27 = 2112;
    v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ _readIODeviceSupportsFindMy: PMU data == %@\n", buf, 0x16u);
  }
  id v11 = [v7 objectForKeyedSubscript:@"lpm2"];
  id v12 = v11;
  if (v11)
  {
    unsigned __int8 v13 = [v11 BOOLValue];
    ((void (*)(void *))v3[2])(v3);
  }
  else
  {
    __int16 v18 = sub_100004238();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [(FMDLocalActivationLockInfoManager *)self fm_logID];
      sub_10023C718(v19, (uint64_t)v7, buf, v18);
    }

    ((void (*)(void *))v3[2])(v3);
    unsigned __int8 v13 = 0;
  }

LABEL_13:
  _Block_object_dispose(&v21, 8);
  return v13;
}

- (void)_postLocalActivationLockInfoChangedNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v3 = (const __CFString *)kFMDLocalActivationLockInfoChangedNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 1u);
}

- (BOOL)_isFeatureEnabled
{
  return 1;
}

- (BOOL)_isWithinDaemonStartupThreshold
{
  CFStringRef v3 = +[FMDDaemon sharedInstance];
  CFDictionaryRef v4 = [v3 startTime];

  [v4 timeIntervalSinceNow];
  double v6 = v5;
  if (v5 >= -3.0)
  {
    id v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFTypeID v8 = [(FMDLocalActivationLockInfoManager *)self fm_logID];
      int v10 = 138412802;
      id v11 = v8;
      __int16 v12 = 2048;
      double v13 = -v6;
      __int16 v14 = 2112;
      uint64_t v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ - call is within startup threshold - will need to be delayed. startTimeDelta %f, daemonStartTime %@", (uint8_t *)&v10, 0x20u);
    }
  }

  return v6 >= -3.0;
}

- (NSString)maskedAppleID
{
  return self->_maskedAppleID;
}

- (void)setMaskedAppleID:(id)a3
{
}

- (NSNumber)activationLockStatus
{
  return self->_activationLockStatus;
}

- (void)setActivationLockStatus:(id)a3
{
}

- (NSNumber)offlineFindingStatus
{
  return self->_offlineFindingStatus;
}

- (void)setOfflineFindingStatus:(id)a3
{
}

- (NSData)offlineFindingInfo
{
  return self->_offlineFindingInfo;
}

- (void)setOfflineFindingInfo:(id)a3
{
}

- (FMDLocalActivationLockInfoStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (SPSettingsConfigurating)settingsConfig
{
  return self->_settingsConfig;
}

- (void)setSettingsConfig:(id)a3
{
}

- (OS_dispatch_queue)storeAccessQueue
{
  return self->_storeAccessQueue;
}

- (void)setStoreAccessQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAccessQueue, 0);
  objc_storeStrong((id *)&self->_settingsConfig, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_offlineFindingInfo, 0);
  objc_storeStrong((id *)&self->_offlineFindingStatus, 0);
  objc_storeStrong((id *)&self->_activationLockStatus, 0);

  objc_storeStrong((id *)&self->_maskedAppleID, 0);
}

@end