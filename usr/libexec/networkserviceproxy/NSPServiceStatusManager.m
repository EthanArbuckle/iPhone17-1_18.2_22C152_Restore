@interface NSPServiceStatusManager
+ (BOOL)supportsSecureCoding;
+ (void)removeFromPreferences;
- (BOOL)changePausedState:(BOOL)a3 forApp:(id)a4 path:(id)a5;
- (BOOL)hasPausedApps;
- (BOOL)isNetworkOutage;
- (BOOL)isServiceActive;
- (BOOL)isServiceOutage;
- (NSMutableArray)appStatuses;
- (NSMutableArray)serviceStatusTimeline;
- (NSPServiceStatusManager)initWithCoder:(id)a3;
- (NSPServiceStatusManager)initWithUserTier:(unint64_t)a3 effectiveUserTier:(unint64_t)a4 delegate:(id)a5;
- (PrivacyProxyServiceStatus)serviceStatus;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)diagnostics;
- (id)initFromPreferencesWithUserTier:(unint64_t)a3 effectiveUserTier:(unint64_t)a4 delegate:(id)a5;
- (id)pausedBundleIDs;
- (id)pausedProcessPaths;
- (void)clearAllPausedApps;
- (void)clearNetworkStatusForType:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleEffectiveUserTierChange:(unint64_t)a3;
- (void)publishDailyNetworkStatus;
- (void)publishDailyServiceStatus;
- (void)reportActiveOnCellularName:(id)a3;
- (void)reportActiveOnInterfaceName:(id)a3 displayName:(id)a4 type:(int)a5;
- (void)reportActiveOnWiFiName:(id)a3;
- (void)reportActivityForApp:(id)a3 path:(id)a4;
- (void)reportBlockedOnCellularName:(id)a3;
- (void)reportBlockedOnInterfaceName:(id)a3 displayName:(id)a4 type:(int)a5;
- (void)reportBlockedOnWiFiName:(id)a3;
- (void)reportDisabledOnCellularName:(id)a3;
- (void)reportDisabledOnInterfaceName:(id)a3 displayName:(id)a4 type:(int)a5;
- (void)reportDisabledOnWiFiName:(id)a3;
- (void)reportFraudAlert;
- (void)reportServiceActiveShouldReport:(BOOL)a3;
- (void)reportServiceDisabledShouldReport:(BOOL)a3;
- (void)reportServiceOutageWithType:(unint64_t)a3 outageReasonStats:(id)a4;
- (void)reportSubscriberUnsupportedRegion:(id)a3;
- (void)reportUnsupportedRegion:(id)a3;
@end

@implementation NSPServiceStatusManager

- (PrivacyProxyServiceStatus)serviceStatus
{
  return (PrivacyProxyServiceStatus *)objc_getProperty(self, a2, 8, 1);
}

- (id)diagnostics
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = [(NSPServiceStatusManager *)self serviceStatusTimeline];
  id v6 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v35 + 1) + 8 * i) diagnostics];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v7);
  }

  if ([v4 count]) {
    [v3 setObject:v4 forKeyedSubscript:@"ServiceStatus"];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v27 = v4;
  id v30 = objc_alloc_init((Class)NSMutableArray);
  if (self) {
    id Property = objc_getProperty(self, v11, 64, 1);
  }
  else {
    id Property = 0;
  }
  id obj = Property;
  id v13 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v16);
        if (v17)
        {
          id v18 = objc_alloc_init((Class)NSMutableDictionary);
          v19 = [[*(id *)(v17 + 8) networkStatusString:v27];
          [v18 setObject:v19 forKeyedSubscript:@"PrivacyProxyNetworkStatusTimeNetworkStatus"];

          v20 = [*(id *)(v17 + 8) networkTypeString];
          [v18 setObject:v20 forKeyedSubscript:@"PrivacyProxyNetworkStatusTimeNetworkInterfaceType"];

          v21 = +[NSDateFormatter localizedStringFromDate:*(void *)(v17 + 16) dateStyle:1 timeStyle:2];
          [v18 setObject:v21 forKeyedSubscript:@"PrivacyProxyNetworkStatusTimeNetworkStartTime"];

          v22 = +[NSDateFormatter localizedStringFromDate:*(void *)(v17 + 24) dateStyle:1 timeStyle:2];
          [v18 setObject:v22 forKeyedSubscript:@"PrivacyProxyNetworkStatusTimeNetworkEndTime"];

          if (v18) {
            [v30 addObject:v18];
          }
        }
        else
        {
          id v18 = 0;
        }

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v23 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      id v14 = v23;
    }
    while (v23);
  }

  if ([v30 count]) {
    [v3 setObject:v30 forKeyedSubscript:@"NetworkStatus"];
  }
  if (objc_msgSend(v3, "count", v27)) {
    v24 = v3;
  }
  else {
    v24 = 0;
  }
  id v25 = v24;

  return v25;
}

- (id)description
{
  if (self)
  {
    id v3 = [objc_alloc((Class)NSMutableString) initWithCapacity:0];
    id v4 = [(NSPServiceStatusManager *)self serviceStatus];
    sub_1000482D4(v3, v4, @"Service Status", 0, 14);

    v5 = [(NSPServiceStatusManager *)self serviceStatusTimeline];
    sub_1000482D4(v3, v5, @"Service Status Timeline", 0, 14);

    id Property = objc_getProperty(self, v6, 64, 1);
    sub_1000482D4(v3, Property, @"Network Status Timeline", 0, 14);
    uint64_t v8 = [(NSPServiceStatusManager *)self appStatuses];
    sub_1000482D4(v3, v8, @"App Statuses", 0, 14);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NSPServiceStatusManager allocWithZone:a3] init];
  v5 = v4;
  if (self)
  {
    unint64_t generation = self->_generation;
    v4->_diskVersion = self->_diskVersion;
    v4->_unint64_t generation = generation;
    id v7 = [(NSPServiceStatusManager *)self serviceStatus];
    objc_setProperty_atomic(v5, v8, v7, 8);

    v9 = [(NSPServiceStatusManager *)self serviceStatusTimeline];
    objc_setProperty_atomic(v5, v10, v9, 16);

    id Property = objc_getProperty(self, v11, 64, 1);
  }
  else
  {
    v4->_diskVersion = 0;
    v4->_unint64_t generation = 0;
    uint64_t v17 = [0 serviceStatus];
    objc_setProperty_atomic(v5, v18, v17, 8);

    v19 = [0 serviceStatusTimeline];
    objc_setProperty_atomic(v5, v20, v19, 16);

    id Property = 0;
  }
  objc_setProperty_atomic(v5, v12, Property, 64);
  id v14 = [(NSPServiceStatusManager *)self appStatuses];
  objc_setProperty_atomic(v5, v15, v14, 24);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPServiceStatusManager)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NSPServiceStatusManager;
  v5 = [(NSPServiceStatusManager *)&v20 init];
  if (v5)
  {
    v5->_diskVersion = (int64_t)[v4 decodeIntegerForKey:@"DiskVersion"];
    v5->_unint64_t generation = (unint64_t)[v4 decodeInt64ForKey:@"Generation"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServiceStatus"];
    serviceStatus = v5->_serviceStatus;
    v5->_serviceStatus = (PrivacyProxyServiceStatus *)v6;

    SEL v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"ServiceStatusTimeline"];
    if (v8)
    {
      uint64_t v9 = +[NSMutableArray arrayWithArray:v8];
      serviceStatusTimeline = v5->_serviceStatusTimeline;
      v5->_serviceStatusTimeline = (NSMutableArray *)v9;
    }
    SEL v11 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"NetworkStatusTimeline"];
    if (v11)
    {
      uint64_t v12 = +[NSMutableArray arrayWithArray:v11];
      networkStatusTimeline = v5->_networkStatusTimeline;
      v5->_networkStatusTimeline = (NSMutableArray *)v12;
    }
    id v14 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"AppStatuses"];
    if (v14)
    {
      uint64_t v15 = +[NSMutableArray arrayWithArray:v14];
      appStatuses = v5->_appStatuses;
      v5->_appStatuses = (NSMutableArray *)v15;
    }
    uint64_t v17 = v5;
  }
  else
  {
    SEL v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v19, 2u);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  [v11 encodeInteger:2 forKey:@"DiskVersion"];
  if (self)
  {
    [v11 encodeInt64:self->_generation forKey:@"Generation"];
    id v4 = [(NSPServiceStatusManager *)self serviceStatus];
    [v11 encodeObject:v4 forKey:@"ServiceStatus"];

    v5 = [(NSPServiceStatusManager *)self serviceStatusTimeline];
    [v11 encodeObject:v5 forKey:@"ServiceStatusTimeline"];

    id Property = objc_getProperty(self, v6, 64, 1);
  }
  else
  {
    [v11 encodeInt64:0 forKey:@"Generation"];
    uint64_t v9 = [0 serviceStatus];
    [v11 encodeObject:v9 forKey:@"ServiceStatus"];

    SEL v10 = [0 serviceStatusTimeline];
    [v11 encodeObject:v10 forKey:@"ServiceStatusTimeline"];

    id Property = 0;
  }
  [v11 encodeObject:Property forKey:@"NetworkStatusTimeline"];
  SEL v8 = [(NSPServiceStatusManager *)self appStatuses];
  [v11 encodeObject:v8 forKey:@"AppStatuses"];
}

- (NSPServiceStatusManager)initWithUserTier:(unint64_t)a3 effectiveUserTier:(unint64_t)a4 delegate:(id)a5
{
  id v8 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NSPServiceStatusManager;
  uint64_t v9 = [(NSPServiceStatusManager *)&v22 init];
  if (v9)
  {
    SEL v10 = (PrivacyProxyServiceStatus *)objc_alloc_init((Class)PrivacyProxyServiceStatus);
    serviceStatus = v9->_serviceStatus;
    v9->_serviceStatus = v10;

    [(PrivacyProxyServiceStatus *)v9->_serviceStatus setServiceStatus:0];
    [(PrivacyProxyServiceStatus *)v9->_serviceStatus setNetworkStatuses:0];
    [(PrivacyProxyServiceStatus *)v9->_serviceStatus setDetails:0];
    uint64_t v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    serviceStatusTimeline = v9->_serviceStatusTimeline;
    v9->_serviceStatusTimeline = v12;

    sub_1000A1F24(v9, 0);
    v9->_userTier = a3;
    v9->_effectiveTier = a4;
    objc_storeWeak((id *)&v9->_delegate, v8);
    id v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    networkStatusTimeline = v9->_networkStatusTimeline;
    v9->_networkStatusTimeline = v14;

    v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    appStatuses = v9->_appStatuses;
    v9->_appStatuses = v16;

    v9->_unint64_t generation = 1;
    SEL v18 = v9;
  }
  else
  {
    objc_super v20 = nplog_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "[super init] failed", v21, 2u);
    }
  }
  return v9;
}

- (id)initFromPreferencesWithUserTier:(unint64_t)a3 effectiveUserTier:(unint64_t)a4 delegate:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(NSPServiceStatusManager *)self initWithUserTier:a3 effectiveUserTier:a4 delegate:v8];
  if (v9)
  {
    CFPropertyListRef v10 = CFPreferencesCopyAppValue(@"NSPServiceStatusManagerInfo", kCFPreferencesCurrentApplication);
    if (v10)
    {
      id v11 = v10;
      id v24 = 0;
      uint64_t v12 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v10 error:&v24];
      id v13 = v24;
      id v14 = v13;
      if (v12) {
        BOOL v15 = v13 == 0;
      }
      else {
        BOOL v15 = 0;
      }
      if (!v15)
      {
        v16 = nplog_obj();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          int64_t v26 = (int64_t)v14;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to create a decoder for the NSP status manager info: %@", buf, 0xCu);
        }

        CFRelease(v11);
        uint64_t v17 = v9;
LABEL_22:
        v19 = v17;
LABEL_23:

        goto LABEL_24;
      }
      CFRelease(v11);
      SEL v18 = [(NSPServiceStatusManager *)v9 initWithCoder:v12];
      if (!v18)
      {
        objc_super v20 = nplog_obj();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to decode NSP status manager info", buf, 2u);
        }

        v19 = 0;
        goto LABEL_23;
      }
      uint64_t v9 = v18;
      if (v18->_diskVersion != 2)
      {
        v21 = nplog_obj();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int64_t diskVersion = v9->_diskVersion;
          *(_DWORD *)buf = 134218240;
          int64_t v26 = diskVersion;
          __int16 v27 = 2048;
          uint64_t v28 = 2;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Saved disk version of status manager info (%ld) does not match latest supported version (%ld)", buf, 0x16u);
        }

        uint64_t v17 = [(NSPServiceStatusManager *)v9 initWithUserTier:a3 effectiveUserTier:a4 delegate:v8];
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v12 = nplog_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "no saved status manager info", buf, 2u);
      }
    }
  }
  v19 = v9;
LABEL_24:

  return v19;
}

+ (void)removeFromPreferences
{
  _CFPreferencesSetFileProtectionClass();
  CFPreferencesSetAppValue(@"NSPServiceStatusManagerInfo", 0, kCFPreferencesCurrentApplication);
  int v2 = CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  id v3 = nplog_obj();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removed status manager info from preference file", v5, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to remove status manager info from preference file", buf, 2u);
  }
}

- (void)publishDailyServiceStatus
{
  id v3 = objc_alloc_init(NSPServiceStatusStats);
  if (self)
  {
    unint64_t effectiveTier = self->_effectiveTier;
    if (effectiveTier >= 3)
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_effectiveTier];
    }
    else
    {
      v5 = *(&off_100106C30 + (int)effectiveTier);
    }
  }
  else
  {
    v5 = @"UNKNOWN";
  }
  [(NSPServiceStatusStats *)v3 setTierType:v5];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  SEL v6 = [(NSPServiceStatusManager *)self serviceStatusTimeline];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      CFPropertyListRef v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v10);
        uint64_t v12 = [v11 serviceStatusEndTime];
        if (!v12) {
          goto LABEL_14;
        }
        id v13 = (void *)v12;
        id v14 = +[NSDate now];
        BOOL v15 = [v11 serviceStatusEndTime];
        [v14 timeIntervalSinceDate:v15];
        double v17 = v16;

        if (v17 <= 86400.0)
        {
LABEL_14:
          switch((unint64_t)[v11 serviceStatus])
          {
            case 0uLL:
              [(NSPServiceStatusStats *)v3 setServiceStatusDisabledCount:(char *)[(NSPServiceStatusStats *)v3 serviceStatusDisabledCount] + 1];
              break;
            case 1uLL:
              [(NSPServiceStatusStats *)v3 setServiceStatusActiveCount:(char *)[(NSPServiceStatusStats *)v3 serviceStatusActiveCount] + 1];
              break;
            case 2uLL:
              [(NSPServiceStatusStats *)v3 setServiceStatusOutageCount:(char *)[(NSPServiceStatusStats *)v3 serviceStatusOutageCount] + 1];
              break;
            case 3uLL:
              [(NSPServiceStatusStats *)v3 setServiceStatusFraudAlertCount:(char *)[(NSPServiceStatusStats *)v3 serviceStatusFraudAlertCount] + 1];
              break;
            case 4uLL:
              [(NSPServiceStatusStats *)v3 setServiceStatusUnsupportedRegionCount:(char *)[(NSPServiceStatusStats *)v3 serviceStatusUnsupportedRegionCount]+ 1];
              break;
            case 5uLL:
              [(NSPServiceStatusStats *)v3 setServiceStatusSystemIncompatibleCount:(char *)[(NSPServiceStatusStats *)v3 serviceStatusSystemIncompatibleCount]+ 1];
              break;
            case 6uLL:
              [(NSPServiceStatusStats *)v3 setServiceStatusSubscriberUnsupportedRegionCount:(char *)[(NSPServiceStatusStats *)v3 serviceStatusSubscriberUnsupportedRegionCount]+ 1];
              break;
            case 7uLL:
              [(NSPServiceStatusStats *)v3 setServiceStatusNetworkOutageCount:(char *)[(NSPServiceStatusStats *)v3 serviceStatusNetworkOutageCount]+ 1];
              break;
            default:
              break;
          }
        }
        CFPropertyListRef v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v18 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      id v8 = v18;
    }
    while (v18);
  }

  [(NSPProxyAnalytics *)v3 sendAnalytics];
}

- (void)publishDailyNetworkStatus
{
  id v3 = objc_alloc_init(NSPNetworkStatusStats);
  id v4 = v3;
  if (self)
  {
    unint64_t effectiveTier = self->_effectiveTier;
    if (effectiveTier >= 3)
    {
      SEL v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_effectiveTier];
    }
    else
    {
      SEL v6 = *(&off_100106C30 + (int)effectiveTier);
    }
    [(NSPNetworkStatusStats *)v4 setTierType:v6];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id Property = objc_getProperty(self, v7, 64, 1);
  }
  else
  {
    [(NSPNetworkStatusStats *)v3 setTierType:@"UNKNOWN"];

    id Property = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
  }
  id v9 = Property;
  id v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v13);
        if (v14)
        {
          id v15 = *(id *)(v14 + 24);
          if (v15)
          {
            double v16 = v15;
            double v17 = +[NSDate now];
            [v17 timeIntervalSinceDate:*(void *)(v14 + 24)];
            double v19 = v18;

            if (v19 > 86400.0) {
              goto LABEL_54;
            }
          }
          long long v20 = *(void **)(v14 + 8);
        }
        else
        {
          long long v20 = 0;
        }
        id v21 = [v20 networkStatus];
        if (v21 == (id)2)
        {
          if (v14) {
            id v24 = *(void **)(v14 + 8);
          }
          else {
            id v24 = 0;
          }
          if ([v24 networkType] == 1)
          {
            [(NSPNetworkStatusStats *)v4 setWifiStatusBlockedCount:(char *)[(NSPNetworkStatusStats *)v4 wifiStatusBlockedCount] + 1];
          }
          else
          {
            if (v14) {
              __int16 v27 = *(void **)(v14 + 8);
            }
            else {
              __int16 v27 = 0;
            }
            if ([v27 networkType] == 2)
            {
              [(NSPNetworkStatusStats *)v4 setCellStatusBlockedCount:(char *)[(NSPNetworkStatusStats *)v4 cellStatusBlockedCount] + 1];
            }
            else
            {
              if (v14) {
                id v30 = *(void **)(v14 + 8);
              }
              else {
                id v30 = 0;
              }
              if ([v30 networkType] == 3) {
                [(NSPNetworkStatusStats *)v4 setWiredStatusBlockedCount:(char *)[(NSPNetworkStatusStats *)v4 wiredStatusBlockedCount] + 1];
              }
            }
          }
        }
        else if (v21 == (id)1)
        {
          if (v14) {
            id v23 = *(void **)(v14 + 8);
          }
          else {
            id v23 = 0;
          }
          if ([v23 networkType] == 1)
          {
            [(NSPNetworkStatusStats *)v4 setWifiStatusActiveCount:(char *)[(NSPNetworkStatusStats *)v4 wifiStatusActiveCount] + 1];
          }
          else
          {
            if (v14) {
              id v25 = *(void **)(v14 + 8);
            }
            else {
              id v25 = 0;
            }
            if ([v25 networkType] == 2)
            {
              [(NSPNetworkStatusStats *)v4 setCellStatusActiveCount:(char *)[(NSPNetworkStatusStats *)v4 cellStatusActiveCount] + 1];
            }
            else
            {
              if (v14) {
                uint64_t v28 = *(void **)(v14 + 8);
              }
              else {
                uint64_t v28 = 0;
              }
              if ([v28 networkType] == 3) {
                [(NSPNetworkStatusStats *)v4 setWiredStatusActiveCount:(char *)[(NSPNetworkStatusStats *)v4 wiredStatusActiveCount] + 1];
              }
            }
          }
        }
        else if (!v21)
        {
          if (v14) {
            long long v22 = *(void **)(v14 + 8);
          }
          else {
            long long v22 = 0;
          }
          if ([v22 networkType] == 1)
          {
            [(NSPNetworkStatusStats *)v4 setWifiStatusDisabledCount:(char *)[(NSPNetworkStatusStats *)v4 wifiStatusDisabledCount] + 1];
          }
          else
          {
            if (v14) {
              int64_t v26 = *(void **)(v14 + 8);
            }
            else {
              int64_t v26 = 0;
            }
            if ([v26 networkType] == 2)
            {
              [(NSPNetworkStatusStats *)v4 setCellStatusDisabledCount:(char *)[(NSPNetworkStatusStats *)v4 cellStatusDisabledCount] + 1];
            }
            else
            {
              if (v14) {
                v29 = *(void **)(v14 + 8);
              }
              else {
                v29 = 0;
              }
              if ([v29 networkType] == 3) {
                [(NSPNetworkStatusStats *)v4 setWiredStatusDisabledCount:(char *)[(NSPNetworkStatusStats *)v4 wiredStatusDisabledCount] + 1];
              }
            }
          }
        }
LABEL_54:
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v31 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
      id v11 = v31;
    }
    while (v31);
  }

  [(NSPProxyAnalytics *)v4 sendAnalytics];
}

- (void)handleEffectiveUserTierChange:(unint64_t)a3
{
  if (self)
  {
    if (self->_effectiveTier != a3) {
      self->_unint64_t effectiveTier = a3;
    }
  }
}

- (void)reportServiceActiveShouldReport:(BOOL)a3
{
  if (self && self->_effectiveTier == 2)
  {
    v5 = [(NSPServiceStatusManager *)self serviceStatus];
    id v6 = [v5 serviceStatus];

    if (!v6)
    {
      id v8 = nplog_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = +[PrivacyProxyServiceStatus serviceStatusString:1];
        id v10 = [(NSPServiceStatusManager *)self serviceStatus];
        id v11 = +[PrivacyProxyServiceStatus serviceStatusString:](PrivacyProxyServiceStatus, "serviceStatusString:", [v10 serviceStatus]);
        int v24 = 138412546;
        id v25 = v9;
        __int16 v26 = 2112;
        __int16 v27 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting service status %@, previous service status %@", (uint8_t *)&v24, 0x16u);
      }
      if (!a3)
      {
        uint64_t v12 = [(NSPServiceStatusManager *)self serviceStatus];
        [v12 setServiceStatus:1];

        sub_1000A1F24(self, (id)1);
        ++self->_generation;
        +[NPUtilities postNotification:value:](NPUtilities, "postNotification:value:", @"com.apple.networkserviceproxy.privacy-proxy-service-status-changed");
        return;
      }
      goto LABEL_13;
    }
    if (self->_lastOutageType)
    {
      SEL v7 = [(NSPServiceStatusManager *)self serviceStatus];
      if ([v7 serviceStatus] == (id)2)
      {

LABEL_12:
        id v15 = [(NSPServiceStatusManager *)self serviceStatusTimeline];
        double v16 = [v15 lastObject];

        double v17 = [v16 serviceStatusStartTime];
        double v18 = +[NSDate now];
        [v18 timeIntervalSinceDate:v17];
        double v20 = v19;

        id v21 = objc_alloc_init(NSPOutageDurationStats);
        [(NSPOutageDurationStats *)v21 setOutageType:self->_lastOutageType];
        [(NSPOutageDurationStats *)v21 setOutageDurationSec:(unint64_t)v20];
        [(NSPProxyAnalytics *)v21 sendAnalytics];

        goto LABEL_13;
      }
      id v13 = [(NSPServiceStatusManager *)self serviceStatus];
      id v14 = [v13 serviceStatus];

      if (v14 == (id)7) {
        goto LABEL_12;
      }
    }
LABEL_13:
    long long v22 = (void *)sub_100041A64(@"RECOVERED_TITLE", @"RECOVERED_TITLE");
    id v23 = (void *)sub_100041A64(@"RECOVERED_SAFARI", @"RECOVERED_SAFARI");
    sub_1000A2DA4(self, (id)1, v22, v23, 0);
  }
}

- (void)reportServiceDisabledShouldReport:(BOOL)a3
{
  if (self && self->_effectiveTier == 2 || a3)
  {
    if (a3)
    {
      id v12 = (id)sub_100041A64(@"UNAVAILABLE_TITLE", @"UNAVAILABLE_TITLE");
      id v4 = (void *)sub_100041A64(@"UNAVAILABLE", @"UNAVAILABLE");
      sub_1000A2DA4(self, 0, v12, v4, 0);
    }
    else
    {
      v5 = [(NSPServiceStatusManager *)self serviceStatus];
      id v6 = [v5 serviceStatus];

      if (v6)
      {
        SEL v7 = nplog_obj();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = +[PrivacyProxyServiceStatus serviceStatusString:0];
          id v9 = [(NSPServiceStatusManager *)self serviceStatus];
          id v10 = +[PrivacyProxyServiceStatus serviceStatusString:](PrivacyProxyServiceStatus, "serviceStatusString:", [v9 serviceStatus]);
          *(_DWORD *)buf = 138412546;
          id v14 = v8;
          __int16 v15 = 2112;
          double v16 = v10;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting service status %@, previous service status %@", buf, 0x16u);
        }
        id v11 = [(NSPServiceStatusManager *)self serviceStatus];
        [v11 setServiceStatus:0];

        sub_1000A1F24(self, 0);
        if (self)
        {
          ++self->_generation;
          +[NPUtilities postNotification:value:](NPUtilities, "postNotification:value:", @"com.apple.networkserviceproxy.privacy-proxy-service-status-changed");
        }
      }
    }
  }
}

- (void)reportServiceOutageWithType:(unint64_t)a3 outageReasonStats:(id)a4
{
  id v6 = a4;
  if (self && self->_effectiveTier == 2)
  {
    if (a3 == 2) {
      unint64_t effectiveTier = 7;
    }
    else {
      unint64_t effectiveTier = self->_effectiveTier;
    }
    id v8 = [(NSPServiceStatusManager *)self serviceStatus];
    id v9 = [v8 serviceStatus];

    if (v9 != (id)effectiveTier)
    {
      self->_lastOutageType = a3;
      [v6 sendAnalytics];
    }
    if (a3 == 2)
    {
      id v10 = (void *)sub_100041A64(@"CAPTIVE_WARNING_NO_NETWORK", @"CAPTIVE_WARNING_NO_NETWORK");
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v11 = [(NSPServiceStatusManager *)self serviceStatus];
      id v12 = [v11 networkStatuses];

      id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v28;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            double v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if ([v17 networkType] == 1)
            {
              double v18 = [v17 networkName];

              if (v18)
              {
                int v24 = (void *)sub_100041A64(@"CAPTIVE_WARNING", @"CAPTIVE_WARNING");
                id v25 = [v17 networkName];
                uint64_t v26 = +[NSString stringWithValidatedFormat:v24, @"%@", 0, v25 validFormatSpecifiers error];

                id v10 = (void *)v26;
                goto LABEL_21;
              }
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
LABEL_21:

      double v19 = (void *)sub_100041A64(@"CAPTIVE_WARNING_TITLE", @"CAPTIVE_WARNING_TITLE");
      double v20 = self;
      uint64_t v21 = 7;
      long long v22 = v19;
      id v23 = v10;
    }
    else
    {
      id v10 = (void *)sub_100041A64(@"OUTAGE_WARNING_TITLE", @"OUTAGE_WARNING_TITLE");
      double v19 = (void *)sub_100041A64(@"OUTAGE_WARNING", @"OUTAGE_WARNING");
      double v20 = self;
      uint64_t v21 = 2;
      long long v22 = v10;
      id v23 = v19;
    }
    sub_1000A2DA4(v20, (id)v21, v22, v23, 0);
  }
}

- (BOOL)isServiceActive
{
  if (!self || self->_effectiveTier != 2) {
    return 0;
  }
  int v2 = [(NSPServiceStatusManager *)self serviceStatus];
  BOOL v3 = [v2 serviceStatus] == (id)1;

  return v3;
}

- (BOOL)isServiceOutage
{
  if (!self || self->_effectiveTier != 2) {
    return 0;
  }
  int v2 = [(NSPServiceStatusManager *)self serviceStatus];
  BOOL v3 = [v2 serviceStatus] == (id)2;

  return v3;
}

- (BOOL)isNetworkOutage
{
  if (!self || self->_effectiveTier != 2) {
    return 0;
  }
  int v2 = [(NSPServiceStatusManager *)self serviceStatus];
  BOOL v3 = [v2 serviceStatus] == (id)7;

  return v3;
}

- (void)reportFraudAlert
{
  if (self && self->_effectiveTier == 2)
  {
    id v6 = (id)sub_100041A64(@"FRAUD_WARNING_TITLE", @"FRAUD_WARNING_TITLE");
    BOOL v3 = (void *)sub_100041C00(@"FRAUD_WARNING");
    id v4 = (void *)sub_100041C00(@"FRAUD_WARNING");
    v5 = (void *)sub_100041A64(v3, v4);
    sub_1000A2DA4(self, (id)3, v6, v5, 0);
  }
}

- (void)reportUnsupportedRegion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self && self->_userTier == 2)
  {
    if (v4)
    {
      uint64_t v9 = kPrivacyProxyServiceStatusDetailsRegionIDKey;
      id v10 = v4;
      id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    }
    else
    {
      id v6 = 0;
    }
    SEL v7 = (void *)sub_100041A64(@"REGION_WARNING_TITLE", @"REGION_WARNING_TITLE");
    id v8 = (void *)sub_100041A64(@"REGION_WARNING", @"REGION_WARNING");
    sub_1000A2DA4(self, (id)4, v7, v8, v6);
  }
}

- (void)reportSubscriberUnsupportedRegion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self && self->_userTier == 2)
  {
    if (v4)
    {
      uint64_t v9 = kPrivacyProxyServiceStatusDetailsRegionIDKey;
      id v10 = v4;
      id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    }
    else
    {
      id v6 = 0;
    }
    SEL v7 = (void *)sub_100041A64(@"REGION_WARNING_TITLE", @"REGION_WARNING_TITLE");
    id v8 = (void *)sub_100041A64(@"REGION_WARNING", @"REGION_WARNING");
    sub_1000A2DA4(self, (id)6, v7, v8, v6);
  }
}

- (void)clearNetworkStatusForType:(int)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(NSPServiceStatusManager *)self serviceStatus];
  SEL v7 = [v6 networkStatuses];

  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 networkType] == a3) {
          char v10 = 1;
        }
        else {
          [v5 addObject:v13];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);

    id v14 = [(NSPServiceStatusManager *)self serviceStatus];
    [v14 setNetworkStatuses:v5];

    if (self != 0 && (v10 & 1) != 0)
    {
      ++self->_generation;
      +[NPUtilities postNotification:value:](NPUtilities, "postNotification:value:", @"com.apple.networkserviceproxy.privacy-proxy-service-status-changed");
    }
  }
  else
  {

    uint64_t v15 = [(NSPServiceStatusManager *)self serviceStatus];
    [v15 setNetworkStatuses:v5];
  }
}

- (void)reportActiveOnWiFiName:(id)a3
{
  id v4 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Wi-Fi network %@ is active", (uint8_t *)&v6, 0xCu);
  }

  sub_1000A3CF8(self, (id)1, 1, v4);
}

- (void)reportDisabledOnWiFiName:(id)a3
{
  id v4 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Wi-Fi network %@ is disabled", (uint8_t *)&v6, 0xCu);
  }

  sub_1000A3CF8(self, 0, 1, v4);
}

- (void)reportBlockedOnWiFiName:(id)a3
{
  id v4 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Wi-Fi network %@ is blocked", buf, 0xCu);
  }

  if (sub_1000A3CF8(self, (id)2, 1, v4))
  {
    if (self) {
      id Property = objc_getProperty(self, v6, 56, 1);
    }
    else {
      id Property = 0;
    }
    sub_1000B1480((uint64_t)Property);
    id v8 = (void *)sub_100041A64(@"WARNING_TITLE", @"WARNING_TITLE");
    id v9 = +[NSString stringWithValidatedFormat:v8, @"%@", 0, v4 validFormatSpecifiers error];

    char v10 = [NSPUserNotification alloc];
    uint64_t v11 = (void *)sub_100041A64(@"WIFI_WARNING", @"WIFI_WARNING");
    id v12 = (void *)sub_100041A64(@"USE_WITHOUT_PROXY", @"USE_WITHOUT_PROXY");
    id v13 = (void *)sub_100041A64(@"USE_OTHER_NETWORK", @"USE_OTHER_NETWORK");
    id v14 = sub_10005C174(self);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000A4958;
    v17[3] = &unk_100106270;
    v17[4] = self;
    id v18 = v4;
    id v16 = sub_1000B0F44(v10, v9, v11, v12, v13, 0, 0, v14, v17);
    if (self) {
      objc_setProperty_atomic(self, v15, v16, 56);
    }
  }
}

- (void)reportActiveOnCellularName:(id)a3
{
  id v4 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Cellular network %@ is active", (uint8_t *)&v6, 0xCu);
  }

  sub_1000A3CF8(self, (id)1, 2, v4);
}

- (void)reportDisabledOnCellularName:(id)a3
{
  id v4 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cellular network %@ is disabled", (uint8_t *)&v6, 0xCu);
  }

  sub_1000A3CF8(self, 0, 2, v4);
}

- (void)reportBlockedOnCellularName:(id)a3
{
  id v4 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cellular network %@ is blocked", buf, 0xCu);
  }

  if (sub_1000A3CF8(self, (id)2, 2, v4))
  {
    if (self) {
      id Property = objc_getProperty(self, v6, 56, 1);
    }
    else {
      id Property = 0;
    }
    sub_1000B1480((uint64_t)Property);
    id v8 = [NSPUserNotification alloc];
    id v9 = (void *)sub_100041A64(@"CELLULAR_WARNING_TITLE", @"CELLULAR_WARNING_TITLE");
    char v10 = (void *)sub_100041A64(@"CELLULAR_WARNING", @"CELLULAR_WARNING");
    uint64_t v11 = (void *)sub_100041A64(@"USE_WITHOUT_PROXY", @"USE_WITHOUT_PROXY");
    id v12 = (void *)sub_100041A64(@"CELLULAR_SETTINGS", @"CELLULAR_SETTINGS");
    id v13 = sub_10005C174(self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000A4E7C;
    v16[3] = &unk_100106270;
    v16[4] = self;
    id v17 = v4;
    id v15 = sub_1000B0F44(v8, v9, v10, v11, v12, 0, 0, v13, v16);
    if (self) {
      objc_setProperty_atomic(self, v14, v15, 56);
    }
  }
}

- (void)reportActiveOnInterfaceName:(id)a3 displayName:(id)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  char v10 = nplog_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Interface %@ (%@) is active", (uint8_t *)&v11, 0x16u);
  }

  sub_1000A3CF8(self, (id)1, v5, v8);
}

- (void)reportDisabledOnInterfaceName:(id)a3 displayName:(id)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  char v10 = nplog_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Interface %@ (%@) is disabled", (uint8_t *)&v11, 0x16u);
  }

  sub_1000A3CF8(self, 0, v5, v8);
}

- (void)reportBlockedOnInterfaceName:(id)a3 displayName:(id)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  char v10 = nplog_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Interface %@ (%@) is blocked", buf, 0x16u);
  }

  if (sub_1000A3CF8(self, (id)2, v5, v8))
  {
    if (self) {
      id Property = objc_getProperty(self, v11, 56, 1);
    }
    else {
      id Property = 0;
    }
    sub_1000B1480((uint64_t)Property);
    __int16 v13 = (void *)sub_100041A64(@"WARNING_TITLE", @"WARNING_TITLE");
    uint64_t v21 = +[NSString stringWithValidatedFormat:v13, @"%@", 0, v9 validFormatSpecifiers error];

    id v14 = [NSPUserNotification alloc];
    id v15 = (void *)sub_100041A64(@"WIFI_WARNING", @"WIFI_WARNING");
    id v16 = (void *)sub_100041A64(@"USE_WITHOUT_PROXY", @"USE_WITHOUT_PROXY");
    id v17 = (void *)sub_100041A64(@"USE_OTHER_NETWORK", @"USE_OTHER_NETWORK");
    id v18 = sub_10005C174(self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000A5458;
    v22[3] = &unk_100106BD0;
    v22[4] = self;
    id v23 = v8;
    id v24 = v9;
    int v25 = v5;
    id v20 = sub_1000B0F44(v14, v21, v15, v16, v17, 0, 0, v18, v22);
    if (self) {
      objc_setProperty_atomic(self, v19, v20, 56);
    }
  }
}

- (void)reportActivityForApp:(id)a3 path:(id)a4
{
  id v6 = a3;
  id v22 = a4;
  id v23 = objc_alloc_init((Class)NSMutableArray);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = [(NSPServiceStatusManager *)self appStatuses];
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (!v8)
  {

    if (!v6) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  id v9 = v8;
  uint64_t v21 = self;
  uint64_t v10 = *(void *)v25;
  char v11 = 1;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v25 != v10) {
        objc_enumerationMutation(v7);
      }
      __int16 v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      id v14 = [v13 bundleIdentifier];
      if ([v14 isEqualToString:v6])
      {
      }
      else
      {
        id v15 = [v13 path];
        unsigned int v16 = [v15 isEqualToString:v22];

        if (!v16) {
          goto LABEL_11;
        }
      }
      if ([v13 appStatus] != (id)2) {
        continue;
      }
      char v11 = 0;
LABEL_11:
      [v23 addObject:v13];
    }
    id v9 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
  }
  while (v9);

  self = v21;
  if (v11)
  {
    if (!v6) {
      goto LABEL_20;
    }
LABEL_18:
    if (v22
      || (+[LSApplicationWorkspace defaultWorkspace],
          id v17 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v18 = [v17 applicationIsInstalled:v6],
          v17,
          (v18 & 1) != 0))
    {
LABEL_20:
      id v19 = +[NSDate now];
      id v20 = [objc_alloc((Class)PrivacyProxyAppStatus) initWithStatus:1 bundleID:v6 path:v22 activeDate:v19];
      [v23 addObject:v20];
      sub_1000A54C4(self, v23, v19);
      if (self)
      {
        ++self->_generation;
        +[NPUtilities postNotification:value:](NPUtilities, "postNotification:value:", @"com.apple.networkserviceproxy.privacy-proxy-service-status-changed");
      }
    }
    else
    {
      id v19 = nplog_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v6;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Bundle ID %@ not known to launch services, ignoring", buf, 0xCu);
      }
    }
  }
}

- (BOOL)changePausedState:(BOOL)a3 forApp:(id)a4 path:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v35 = a5;
  if (v6) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  char v11 = [(NSPServiceStatusManager *)self appStatuses];
  id v12 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
  __int16 v13 = &AnalyticsSendEventLazy_ptr;
  if (!v12)
  {

    goto LABEL_22;
  }
  id v14 = v12;
  long long v33 = self;
  char v34 = 0;
  uint64_t v15 = *(void *)v39;
  int v16 = 1;
  do
  {
    id v17 = 0;
    id v36 = v14;
    do
    {
      if (*(void *)v39 != v15) {
        objc_enumerationMutation(v11);
      }
      unsigned __int8 v18 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v17);
      id v19 = [v18 bundleIdentifier];
      if ([v19 isEqualToString:v8])
      {
      }
      else
      {
        int v37 = v16;
        [v18 path];
        uint64_t v20 = v15;
        uint64_t v21 = v11;
        uint64_t v22 = v9;
        id v23 = v10;
        long long v25 = v24 = v8;
        unsigned int v26 = [v25 isEqualToString:v35];

        id v8 = v24;
        id v10 = v23;
        uint64_t v9 = v22;
        char v11 = v21;
        uint64_t v15 = v20;
        id v14 = v36;

        if (!v26)
        {
          int v16 = v37;
          goto LABEL_16;
        }
      }
      if ([v18 appStatus] == (id)v9)
      {
        int v16 = 0;
      }
      else
      {
        [v18 setAppStatus:v9];
        int v16 = 0;
        char v34 = 1;
      }
LABEL_16:
      [v10 addObject:v18];
      id v17 = (char *)v17 + 1;
    }
    while (v14 != v17);
    id v14 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
  }
  while (v14);

  self = v33;
  __int16 v13 = &AnalyticsSendEventLazy_ptr;
  if (v16)
  {
LABEL_22:
    id v28 = objc_alloc((Class)PrivacyProxyAppStatus);
    id v29 = [v13[446] now];
    id v30 = [v28 initWithStatus:v9 bundleID:v8 path:v35 activeDate:v29];

    [v10 addObject:v30];
    goto LABEL_23;
  }
  if ((v34 & 1) == 0)
  {
    BOOL v27 = 0;
    goto LABEL_26;
  }
LABEL_23:
  id v31 = [v13[446] now];
  sub_1000A54C4(self, v10, v31);

  if (self)
  {
    ++self->_generation;
    +[NPUtilities postNotification:value:](NPUtilities, "postNotification:value:", @"com.apple.networkserviceproxy.privacy-proxy-service-status-changed");
  }
  BOOL v27 = 1;
LABEL_26:

  return v27;
}

- (void)clearAllPausedApps
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSPServiceStatusManager *)self appStatuses];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 appStatus] == (id)2) {
          [v9 setAppStatus:1];
        }
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  id v10 = +[NSDate now];
  sub_1000A54C4(self, v3, v10);

  if (self)
  {
    ++self->_generation;
    +[NPUtilities postNotification:value:](NPUtilities, "postNotification:value:", @"com.apple.networkserviceproxy.privacy-proxy-service-status-changed");
  }
}

- (BOOL)hasPausedApps
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v2 = [(NSPServiceStatusManager *)self appStatuses];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) appStatus] == (id)2)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (id)pausedBundleIDs
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v2 = [(NSPServiceStatusManager *)self appStatuses];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        long long v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 appStatus] == (id)2)
        {
          long long v9 = [v8 bundleIdentifier];

          if (v9)
          {
            if (!v5) {
              id v5 = objc_alloc_init((Class)NSMutableArray);
            }
            long long v10 = [v8 bundleIdentifier];
            [v5 addObject:v10];
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)pausedProcessPaths
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v2 = [(NSPServiceStatusManager *)self appStatuses];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        long long v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 appStatus] == (id)2)
        {
          long long v9 = [v8 path];

          if (v9)
          {
            if (!v5) {
              id v5 = objc_alloc_init((Class)NSMutableArray);
            }
            long long v10 = [v8 path];
            [v5 addObject:v10];
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSMutableArray)serviceStatusTimeline
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableArray)appStatuses
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkStatusTimeline, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appStatuses, 0);
  objc_storeStrong((id *)&self->_serviceStatusTimeline, 0);

  objc_storeStrong((id *)&self->_serviceStatus, 0);
}

@end