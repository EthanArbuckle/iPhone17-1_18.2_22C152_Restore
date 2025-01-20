@interface WiFiAnalyticsManager
+ (id)sharedWiFiAnalyticsManager;
- (BOOL)copyHigherBandNetworksAvailableAtLocation:(id)a3 intoArray:(id *)a4;
- (BOOL)isHistoricallyBadLinkQualityNetwork:(__WiFiNetwork *)a3;
- (BOOL)isMovingNetwork:(__WiFiNetwork *)a3;
- (BOOL)isNetworkTraitsCacheValid;
- (BOOL)isOmnipresentNetwork:(__WiFiNetwork *)a3;
- (BOOL)roamParamsQueryPending;
- (BOOL)traitsCacheUpdateBusy;
- (NSDate)dateTraitCachesUpdated;
- (NSMutableArray)historicallyBadLinkQualityNetworkSsidsCache;
- (NSMutableArray)movingNetworkSsidsCache;
- (NSMutableArray)omnipresentNetworkSsidsCache;
- (NSMutableArray)usageCache;
- (WADeviceAnalyticsClient)deviceAnalyticsClient;
- (WiFiAnalyticsManager)init;
- (__WiFiManager)wifiManager;
- (__WiFiNetwork)_copyCreateEquivalentWiFiNetwork:(id)a3 authFlags:(int64_t)a4;
- (__WiFiNetwork)copyColocatedScopeTransitionNetwork:(__WiFiNetwork *)a3 minRssi:(int)a4 maxRssi:(int)a5 band:(unsigned int)a6;
- (double)managerInitTime;
- (id)copyAllStoredNetworkSsids;
- (id)copyAllStoredNetworkSsidsWithColocatedScopeId:(id)a3;
- (id)copyColocatedScopeIdForNetwork:(__WiFiNetwork *)a3;
- (id)copyGeoTagsForNetworkAtLocation:(__WiFiNetwork *)a3 location:(id)a4;
- (id)copyNetworksAvailableAtLocation:(id)a3;
- (id)copyPreferenceScoreDictionaryForNetwork:(__WiFiNetwork *)a3;
- (id)copyScoreSortedNetworksAvailableAtLocation:(id)a3;
- (id)copyStoredNetworksAvailableAtLocationWithinDistanceInBand:(id)a3 distance:(double)a4 band:(unsigned int)a5;
- (id)getNetworkUsageDictionary:(__WiFiNetwork *)a3;
- (unint64_t)isWithin:(double)a3 fromLocation:(id)a4 forNetwork:(__WiFiNetwork *)a5;
- (unsigned)getColocatedStateFromPreferenceScoreDictionary:(id)a3;
- (void)_cleanupExistingRetiredStores;
- (void)dealloc;
- (void)getAdaptiveRoamParams:(__CFString *)a3 ssid:(__CFString *)a4;
- (void)setDateTraitCachesUpdated:(id)a3;
- (void)setDeviceAnalyticsClient:(id)a3;
- (void)setHistoricallyBadLinkQualityNetworkSsidsCache:(id)a3;
- (void)setManagerInitTime:(double)a3;
- (void)setMovingNetworkSsidsCache:(id)a3;
- (void)setOmnipresentNetworkSsidsCache:(id)a3;
- (void)setRoamParamsQueryPending:(BOOL)a3;
- (void)setTraitsCacheUpdateBusy:(BOOL)a3;
- (void)setUsageCache:(id)a3;
- (void)setWiFiManager:(__WiFiManager *)a3;
- (void)setWifiManager:(__WiFiManager *)a3;
- (void)updateNetworkTraitsCache;
@end

@implementation WiFiAnalyticsManager

+ (id)sharedWiFiAnalyticsManager
{
  if (objc_opt_class())
  {
    if (qword_10027D5A8 != -1) {
      dispatch_once(&qword_10027D5A8, &stru_10023EC08);
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, "%s: failed in super-init", "+[WiFiAnalyticsManager sharedWiFiAnalyticsManager]"];
    }
  }
  return (id)qword_10027D5A0;
}

- (WiFiAnalyticsManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)WiFiAnalyticsManager;
  v2 = [(WiFiAnalyticsManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_deviceAnalyticsClient = 0;
    v2->_movingNetworkSsidsCache = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v3->_omnipresentNetworkSsidsCache = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v3->_historicallyBadLinkQualityNetworkSsidsCache = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v3->_dateTraitCachesUpdated = 0;
    v3->_traitsCacheUpdateBusy = 0;
    v3->_usageCache = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: failed in super-init", @"-[WiFiAnalyticsManager init]"];
    }
  }
  return v3;
}

- (void)dealloc
{
  deviceAnalyticsClient = self->_deviceAnalyticsClient;
  if (deviceAnalyticsClient)
  {

    self->_deviceAnalyticsClient = 0;
  }
  movingNetworkSsidsCache = self->_movingNetworkSsidsCache;
  if (movingNetworkSsidsCache) {

  }
  omnipresentNetworkSsidsCache = self->_omnipresentNetworkSsidsCache;
  if (omnipresentNetworkSsidsCache) {

  }
  historicallyBadLinkQualityNetworkSsidsCache = self->_historicallyBadLinkQualityNetworkSsidsCache;
  if (historicallyBadLinkQualityNetworkSsidsCache) {

  }
  dateTraitCachesUpdated = self->_dateTraitCachesUpdated;
  if (dateTraitCachesUpdated) {

  }
  usageCache = self->_usageCache;
  if (usageCache)
  {
    [(NSMutableArray *)usageCache removeAllObjects];
  }
  v9.receiver = self;
  v9.super_class = (Class)WiFiAnalyticsManager;
  [(WiFiAnalyticsManager *)&v9 dealloc];
}

- (void)setWiFiManager:(__WiFiManager *)a3
{
  if (a3)
  {
    -[WiFiAnalyticsManager setWifiManager:](self, "setWifiManager:");
    double Current = CFAbsoluteTimeGetCurrent();
    [(WiFiAnalyticsManager *)self setManagerInitTime:Current];
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: NULL WiFiManager", "-[WiFiAnalyticsManager setWiFiManager:]");
    }
  }
}

- (WADeviceAnalyticsClient)deviceAnalyticsClient
{
  if (objc_opt_class())
  {
    if (!self->_deviceAnalyticsClient)
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:message:3, "%s: attempting to initialize deviceAnalyticsClient", "-[WiFiAnalyticsManager deviceAnalyticsClient]"];
      }
      if (_os_feature_enabled_impl()) {
        v4 = (WADeviceAnalyticsClient *)+[WADeviceAnalyticsClient sharedDeviceAnalyticsClientWithPersist];
      }
      else {
        v4 = (WADeviceAnalyticsClient *)objc_alloc_init((Class)WADeviceAnalyticsClient);
      }
      self->_deviceAnalyticsClient = v4;
      if (v4)
      {
        [(WiFiAnalyticsManager *)self _cleanupExistingRetiredStores];
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: deviceAnalyticsClient initialized successfully", "-[WiFiAnalyticsManager deviceAnalyticsClient]");
        }
      }
      else
      {
        if (qword_10027DD68) {
          [((id)qword_10027DD68) WFLog:4, @"%s: unable to init deviceAnalyticsClient", @"-[WiFiAnalyticsManager deviceAnalyticsClient]"];
        }
      }
      self->_roamParamsQueryPending = 0;
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:4, "%s: WADeviceAnalyticsClient class not present", "-[WiFiAnalyticsManager deviceAnalyticsClient]"];
    }
  }
  return self->_deviceAnalyticsClient;
}

- (void)_cleanupExistingRetiredStores
{
  id v2 = +[NSMutableArray array];
  [v2 addObject:[NSURL URLWithString:@"/System/Library/PrivateFrameworks/MobileWiFi.framework/WiFiNetworkStoreModel.momd"]];
  [v2 addObject:[NSURL URLWithString:@"/usr/sbin/WiFiNetworkStoreModel.momd"]];
  v3 = &objc_retainAutoreleaseReturnValue_ptr;
  v4 = [+[NSFileManager defaultManager] URLForDirectory:14 inDomain:1 appropriateForURL:0 create:1 error:0];
  v36 = [(NSURL *)v4 URLByAppendingPathComponent:@"WiFiNetworkStoreModel.sqlite"];
  if (v36)
  {
    v5 = [(NSURL *)v4 URLByAppendingPathComponent:@"WiFiNetworkStoreModel.sqlite-wal"];
    if (v5)
    {
      objc_super v6 = v5;
      v7 = [(NSURL *)v4 URLByAppendingPathComponent:@"WiFiNetworkStoreModel.sqlite-shm"];
      if (v7)
      {
        v8 = v7;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v9 = [v2 countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (v9)
        {
          id v10 = v9;
          v33 = v8;
          v34 = v6;
          char v35 = 0;
          uint64_t v11 = *(void *)v43;
          do
          {
            v12 = 0;
            do
            {
              if (*(void *)v43 != v11) {
                objc_enumerationMutation(v2);
              }
              v13 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v12);
              if (v13
                && objc_msgSend(objc_msgSend(v3[271], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v13, "path")))
              {
                v14 = v3;
                id v15 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v13];
                if (v15)
                {
                  v16 = v15;
                  id v17 = [objc_alloc((Class)NSPersistentStoreCoordinator) initWithManagedObjectModel:v15];
                  if (v17)
                  {
                    v18 = v17;
                    uint64_t v41 = 0;
                    if ([v17 destroyPersistentStoreAtURL:v36 withType:NSSQLiteStoreType options:0 error:&v41])BOOL v19 = v41 == 0; {
                    else
                    }
                      BOOL v19 = 0;
                    if (v19)
                    {
                      char v35 = 1;
                    }
                    else
                    {
                      if (qword_10027DD68) {
                        [(id)qword_10027DD68 WFLog:3, "%s failed to destroy store at URL %@ %@", "-[WiFiAnalyticsManager _cleanupExistingRetiredStores]", v13, v41 message];
                      }
                    }
                  }
                  else
                  {
                    if (qword_10027DD68) {
                      [(id)qword_10027DD68 WFLog:3 message:"_persistenceCoordinator is nil"];
                    }
                  }
                }
                else
                {
                  if (qword_10027DD68) {
                    [(id)qword_10027DD68 WFLog:3 message:"failed to create managedObjectModel"];
                  }
                }
                v3 = v14;
              }
              v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            id v23 = [v2 countByEnumeratingWithState:&v42 objects:v47 count:16];
            id v10 = v23;
          }
          while (v23);
          if (v35)
          {
            id v24 = +[NSMutableArray array];
            [v24 addObject:v36];
            [v24 addObject:v33];
            [v24 addObject:v34];
            [v24 addObjectsFromArray:v2];
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v25 = [v24 countByEnumeratingWithState:&v37 objects:v46 count:16];
            if (v25)
            {
              id v26 = v25;
              uint64_t v27 = *(void *)v38;
              do
              {
                for (i = 0; i != v26; i = (char *)i + 1)
                {
                  if (*(void *)v38 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  v29 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                  if (v29
                    && objc_msgSend(objc_msgSend(v3[271], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v29, "path")))
                  {
                    uint64_t v41 = 0;
                    if (qword_10027DD68) {
                      [(id)qword_10027DD68 WFLog:4, "Will remove file at URL %@", v29 message];
                    }
                    [objc_msgSend(v3[271], "defaultManager") removeItemAtPath:[v29 path] error:&v41];
                    if (v41)
                    {
                      if (qword_10027DD68) {
                        [(id)qword_10027DD68 WFLog:4, "Failed to remove file at URL %@", v29 message];
                      }
                    }
                  }
                }
                id v26 = [v24 countByEnumeratingWithState:&v37 objects:v46 count:16];
              }
              while (v26);
            }
          }
        }
        return;
      }
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: Error getting storeShmURL", "-[WiFiAnalyticsManager _cleanupExistingRetiredStores]")
      }
    }
    else
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:4, @"%s: Error getting storeWalURL", @"-[WiFiAnalyticsManager _cleanupExistingRetiredStores]"];
      }
    }
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: Error getting storeURL", "-[WiFiAnalyticsManager _cleanupExistingRetiredStores]")
    }
  }
}

- (__WiFiNetwork)_copyCreateEquivalentWiFiNetwork:(id)a3 authFlags:(int64_t)a4
{
  if (!a3)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null ssid", "-[WiFiAnalyticsManager _copyCreateEquivalentWiFiNetwork:authFlags:]")];
    }
    goto LABEL_17;
  }
  char v4 = a4;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, "%s: null networkRecord", "-[WiFiAnalyticsManager _copyCreateEquivalentWiFiNetwork:authFlags:]"];
    }
LABEL_17:
    return 0;
  }
  v7 = Mutable;
  CFDictionarySetValue(Mutable, @"SSID_STR", a3);
  v8 = (__WiFiNetwork *)sub_100019658((int)kCFAllocatorDefault, v7);
  id v9 = v8;
  if ((v4 & 8) != 0)
  {
    sub_1000C8594((uint64_t)v8, 1);
  }
  else if (v4)
  {
    sub_1000C8448((uint64_t)v8, 1);
  }
  else if ((v4 & 4) != 0)
  {
    sub_1000C6FF8((int)v8, 1, v4 & 2);
  }
  else if ((v4 & 2) != 0)
  {
    sub_1000C7184((uint64_t)v8, 1);
  }
  sub_10001C6A4((uint64_t)v9, @"AP_MODE", +[NSNumber numberWithInt:2]);
  CFRelease(v7);
  return v9;
}

- (void)getAdaptiveRoamParams:(__CFString *)a3 ssid:(__CFString *)a4
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  if ([(WiFiAnalyticsManager *)self roamParamsQueryPending])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: query already pending", "-[WiFiAnalyticsManager getAdaptiveRoamParams:ssid:]");
    }
  }
  else
  {
    [(WiFiAnalyticsManager *)self setRoamParamsQueryPending:1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100028DEC;
    block[3] = &unk_10023EC58;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    block[7] = v9;
    dispatch_async((dispatch_queue_t)qword_10027DD88, block);
  }
  _Block_object_dispose(v9, 8);
}

- (id)copyStoredNetworksAvailableAtLocationWithinDistanceInBand:(id)a3 distance:(double)a4 band:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (![(WiFiAnalyticsManager *)self deviceAnalyticsClient])
  {
    if (qword_10027DD68) {
      [[(id)qword_10027DD68 WFLog:message:4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager copyStoredNetworksAvailableAtLocationWithinDistanceInBand:distance:band:]"];
    }
    goto LABEL_22;
  }
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s: location is nil" -[WiFiAnalyticsManager copyStoredNetworksAvailableAtLocationWithinDistanceInBand:distance:band:]];
    }
LABEL_22:
    id v10 = 0;
    return [v10 copy];
  }
  id v9 = [(WADeviceAnalyticsClient *)[(WiFiAnalyticsManager *)self deviceAnalyticsClient] copyNetworksAvailableAtLocationWithinDistanceInBand:a3 distance:v5 band:a4];
  if ([v9 count])
  {
    id v10 = +[NSMutableArray array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v25;
      uint64_t v14 = WADeviceAnalyticsNetworkInfo[0];
      uint64_t v15 = WADeviceAnalyticsNetworkInfo[1];
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v9);
          }
          id v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v18 = [v17 objectForKey:v14];
          signed int v19 = [[v17 objectForKey:v15] intValue];
          if (v18)
          {
            v20 = [(WiFiAnalyticsManager *)self _copyCreateEquivalentWiFiNetwork:v18 authFlags:v19];
            if (v20)
            {
              v21 = v20;
              [v10 addObject:v20];
              CFRelease(v21);
            }
          }
        }
        id v12 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v10 = 0;
  }

  return [v10 copy];
}

- (BOOL)copyHigherBandNetworksAvailableAtLocation:(id)a3 intoArray:(id *)a4
{
  if (![(WiFiAnalyticsManager *)self deviceAnalyticsClient])
  {
    uint64_t v13 = (void *)qword_10027DD68;
    if (!qword_10027DD68) {
      goto LABEL_24;
    }
    uint64_t v14 = "%s: deviceAnalyticsClient is nil";
LABEL_17:
    uint64_t v15 = 4;
LABEL_23:
    [v13 WFLog:v15 message:v14];
    goto LABEL_24;
  }
  if (!a3)
  {
    uint64_t v13 = (void *)qword_10027DD68;
    if (!qword_10027DD68) {
      goto LABEL_24;
    }
    uint64_t v14 = "%s: location is nil";
    goto LABEL_17;
  }
  id v7 = [a3 timestamp];
  if (!v7)
  {
    uint64_t v13 = (void *)qword_10027DD68;
    if (qword_10027DD68)
    {
      uint64_t v14 = "%s: location timestamp is nil";
LABEL_22:
      uint64_t v15 = 3;
      goto LABEL_23;
    }
LABEL_24:
    LOBYTE(v11) = 0;
    return (char)v11;
  }
  [v7 timeIntervalSinceNow];
  if (v8 <= -120.0)
  {
    uint64_t v13 = (void *)qword_10027DD68;
    if (qword_10027DD68)
    {
      uint64_t v14 = "%s: location is older than 120 secs";
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  BOOL v9 = v8 <= -60.0 && v8 <= -30.0;
  double v10 = 500.0;
  if (!v9) {
    double v10 = 300.0;
  }
  id v11 = [(WiFiAnalyticsManager *)self copyStoredNetworksAvailableAtLocationWithinDistanceInBand:a3 distance:2 band:v10];
  if (v11)
  {
    *a4 = v11;
    LOBYTE(v11) = 1;
  }
  return (char)v11;
}

- (unint64_t)isWithin:(double)a3 fromLocation:(id)a4 forNetwork:(__WiFiNetwork *)a5
{
  if (![(WiFiAnalyticsManager *)self deviceAnalyticsClient])
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: deviceAnalyticsClient is nil", @"-[WiFiAnalyticsManager isWithin:fromLocation:forNetwork:]"];
    }
    goto LABEL_13;
  }
  if (!a4)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: location is nil", @"-[WiFiAnalyticsManager isWithin:fromLocation:forNetwork:]"];
    }
    goto LABEL_13;
  }
  BOOL v9 = sub_10001A43C(a5);
  if (!v9)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s: ssid is nil" args:("-[WiFiAnalyticsManager isWithin:fromLocation:forNetwork:]")];
    }
LABEL_13:
    return 0;
  }
  double v10 = v9;
  id v11 = [(WiFiAnalyticsManager *)self deviceAnalyticsClient];

  return (unint64_t)[(WADeviceAnalyticsClient *)v11 isNetworkWithinRangeOfLocation:v10 range:a4 location:a3];
}

- (id)copyScoreSortedNetworksAvailableAtLocation:(id)a3
{
  if (![(WiFiAnalyticsManager *)self deviceAnalyticsClient])
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: deviceAnalyticsClient is nil", @"-[WiFiAnalyticsManager copyScoreSortedNetworksAvailableAtLocation:]"];
    }
    goto LABEL_25;
  }
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s: location is nil" args:("-[WiFiAnalyticsManager copyScoreSortedNetworksAvailableAtLocation:]")];
    }
LABEL_25:
    id v6 = 0;
    return [v6 copy];
  }
  id v5 = [(WADeviceAnalyticsClient *)[(WiFiAnalyticsManager *)self deviceAnalyticsClient] copyScoreSortedNetworksAvailableAtLocationWithinDistance:a3 distance:&stru_10023EC98 authComparator:300.0];
  if ([v5 count])
  {
    id v6 = +[NSMutableArray array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v22;
      uint64_t v10 = WADeviceAnalyticsNetworkInfo[0];
      uint64_t v11 = WADeviceAnalyticsNetworkInfo[1];
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v14 = [v13 objectForKey:v10];
          id v15 = [v13 objectForKey:v11];
          if (v14) {
            BOOL v16 = v15 == 0;
          }
          else {
            BOOL v16 = 1;
          }
          if (!v16)
          {
            id v17 = [(WiFiAnalyticsManager *)self _copyCreateEquivalentWiFiNetwork:v14 authFlags:v15];
            if (v17)
            {
              id v18 = v17;
              [v6 addObject:v17];
              CFRelease(v18);
            }
          }
        }
        id v8 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v6 = 0;
  }

  return [v6 copy];
}

- (id)copyPreferenceScoreDictionaryForNetwork:(__WiFiNetwork *)a3
{
  id v5 = [(WiFiAnalyticsManager *)self deviceAnalyticsClient];
  if (!a3) {
    return 0;
  }
  if (!v5) {
    return 0;
  }
  id v6 = sub_10001A43C(a3);
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  id v8 = [(WiFiAnalyticsManager *)self deviceAnalyticsClient];

  return [(WADeviceAnalyticsClient *)v8 copyPreferenceScoreDictionaryForNetwork:v7];
}

- (unsigned)getColocatedStateFromPreferenceScoreDictionary:(id)a3
{
  uint64_t v4 = 0;
  unsigned int v5 = 0;
  do
  {
    value = 0;
    int valuePtr = -1;
    if (v4 <= 4)
    {
      id v6 = *(const void **)*(&off_10023ED08 + v4);
      if (v6)
      {
        CFDictionaryGetValueIfPresent((CFDictionaryRef)a3, v6, (const void **)&value);
        if (value)
        {
          CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr);
          if ((valuePtr + 1) >= 2) {
            v5 |= 1 << v4;
          }
        }
      }
    }
    ++v4;
  }
  while (v4 != 5);
  return v5;
}

- (id)copyNetworksAvailableAtLocation:(id)a3
{
  if (![(WiFiAnalyticsManager *)self deviceAnalyticsClient])
  {
    if (qword_10027DD68) {
      [[(id)qword_10027DD68 WFLog:message:4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager copyNetworksAvailableAtLocation:]"];
    }
    goto LABEL_10;
  }
  if (!a3)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: location is nil", "-[WiFiAnalyticsManager copyNetworksAvailableAtLocation:]")
    }
LABEL_10:
    return 0;
  }

  return [(WiFiAnalyticsManager *)self copyStoredNetworksAvailableAtLocationWithinDistanceInBand:a3 distance:0 band:300.0];
}

- (id)copyGeoTagsForNetworkAtLocation:(__WiFiNetwork *)a3 location:(id)a4
{
  if (![(WiFiAnalyticsManager *)self deviceAnalyticsClient])
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: deviceAnalyticsClient is nil", @"-[WiFiAnalyticsManager copyGeoTagsForNetworkAtLocation:location:]"];
    }
    goto LABEL_16;
  }
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s: network is nil" args:("-[WiFiAnalyticsManager copyGeoTagsForNetworkAtLocation:location:]")];
    }
    goto LABEL_16;
  }
  if (!a4)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s: location is nil" arguments:("-[WiFiAnalyticsManager copyGeoTagsForNetworkAtLocation:location:]")];
    }
    goto LABEL_16;
  }
  id v7 = sub_10001A43C(a3);
  if (!v7)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: ssid is nil", @"-[WiFiAnalyticsManager copyGeoTagsForNetworkAtLocation:location:]"];
    }
LABEL_16:
    return 0;
  }
  id v8 = v7;
  uint64_t v9 = [(WiFiAnalyticsManager *)self deviceAnalyticsClient];

  return [(WADeviceAnalyticsClient *)v9 copyGeoTagsForNetwork:v8 location:a4];
}

- (void)updateNetworkTraitsCache
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3052000000;
  v5[3] = sub_100022CA8;
  v5[4] = sub_100022BC8;
  v5[5] = self;
  if (![(WiFiAnalyticsManager *)self deviceAnalyticsClient])
  {
    if (qword_10027DD68) {
      [[(id)qword_10027DD68 WFLog:message:4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager updateNetworkTraitsCache]"];
    }
    goto LABEL_9;
  }
  if ([(WiFiAnalyticsManager *)self traitsCacheUpdateBusy])
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s: cache updates already in progress" args:("-[WiFiAnalyticsManager updateNetworkTraitsCache"]);
    }
LABEL_9:
    goto LABEL_4;
  }
  [(WiFiAnalyticsManager *)self setTraitsCacheUpdateBusy:1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029D5C;
  block[3] = &unk_10023ECC0;
  block[4] = self;
  block[5] = v5;
  dispatch_async((dispatch_queue_t)qword_10027DD88, block);
LABEL_4:
  _Block_object_dispose(v5, 8);
}

- (BOOL)isNetworkTraitsCacheValid
{
  if (![(WiFiAnalyticsManager *)self dateTraitCachesUpdated]) {
    goto LABEL_8;
  }
  [+[NSDate date] timeIntervalSinceDate:[(WiFiAnalyticsManager *)self dateTraitCachesUpdated]];
  double v4 = v3;
  if (qword_10027DD68)
  {
    id v6 = "No";
    if (v4 > 600.0) {
      id v6 = "Yes";
    }
    [(id)qword_10027DD68 WFLog:3, "%s: Cache needs update: %s. Time difference %.2f", "-[WiFiAnalyticsManager isNetworkTraitsCacheValid]", v6, *(void *)&v4 message];
  }
  if (v4 <= 600.0)
  {
    char v7 = 1;
  }
  else
  {
LABEL_8:
    [(WiFiAnalyticsManager *)self updateNetworkTraitsCache];
    char v7 = 0;
  }
  return v7 & ![(WiFiAnalyticsManager *)self traitsCacheUpdateBusy];
}

- (BOOL)isMovingNetwork:(__WiFiNetwork *)a3
{
  if (![(WiFiAnalyticsManager *)self deviceAnalyticsClient])
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager isMovingNetwork:]"];
    }
    goto LABEL_11;
  }
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s: network is nil" arguments:@"-[WiFiAnalyticsManager isMovingNetwork:]"];
    }
LABEL_11:
    return 0;
  }
  unsigned int v5 = sub_10001A43C(a3);
  if (![(WiFiAnalyticsManager *)self isNetworkTraitsCacheValid]) {
    return 0;
  }
  id v6 = [(WiFiAnalyticsManager *)self movingNetworkSsidsCache];

  return [(NSMutableArray *)v6 containsObject:v5];
}

- (BOOL)isOmnipresentNetwork:(__WiFiNetwork *)a3
{
  if (![(WiFiAnalyticsManager *)self deviceAnalyticsClient])
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: deviceAnalyticsClient is nil", @"-[WiFiAnalyticsManager isOmnipresentNetwork:]"];
    }
    goto LABEL_11;
  }
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s: network is nil" args:("-[WiFiAnalyticsManager isOmnipresentNetwork:]")];
    }
LABEL_11:
    return 0;
  }
  unsigned int v5 = sub_10001A43C(a3);
  if (![(WiFiAnalyticsManager *)self isNetworkTraitsCacheValid]) {
    return 0;
  }
  id v6 = [(WiFiAnalyticsManager *)self omnipresentNetworkSsidsCache];

  return [(NSMutableArray *)v6 containsObject:v5];
}

- (BOOL)isHistoricallyBadLinkQualityNetwork:(__WiFiNetwork *)a3
{
  if (![(WiFiAnalyticsManager *)self deviceAnalyticsClient])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager isHistoricallyBadLinkQualityNetwork:]")
    }
    goto LABEL_11;
  }
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:4, "%s: network is nil", "-[WiFiAnalyticsManager isHistoricallyBadLinkQualityNetwork:]"];
    }
LABEL_11:
    return 0;
  }
  unsigned int v5 = sub_10001A43C(a3);
  if (![(WiFiAnalyticsManager *)self isNetworkTraitsCacheValid]) {
    return 0;
  }
  id v6 = [(WiFiAnalyticsManager *)self historicallyBadLinkQualityNetworkSsidsCache];

  return [(NSMutableArray *)v6 containsObject:v5];
}

- (id)copyAllStoredNetworkSsids
{
  if ([(WiFiAnalyticsManager *)self deviceAnalyticsClient])
  {
    double v3 = [(WiFiAnalyticsManager *)self deviceAnalyticsClient];
    return [(WADeviceAnalyticsClient *)v3 copyAllStoredNetworkSsids];
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: deviceAnalyticsClient is nil", @"-[WiFiAnalyticsManager copyAllStoredNetworkSsids]"];
    }
    return 0;
  }
}

- (id)copyAllStoredNetworkSsidsWithColocatedScopeId:(id)a3
{
  if (![(WiFiAnalyticsManager *)self deviceAnalyticsClient])
  {
    if (qword_10027DD68) {
      [[(id)qword_10027DD68 WFLog:message:4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager copyAllStoredNetworkSsidsWithColocatedScopeId:]"];
    }
    goto LABEL_10;
  }
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: colocatedScopeIdStr is nil", @"-[WiFiAnalyticsManager copyAllStoredNetworkSsidsWithColocatedScopeId:]"];
    }
LABEL_10:
    return 0;
  }
  unsigned int v5 = [(WiFiAnalyticsManager *)self deviceAnalyticsClient];

  return [(WADeviceAnalyticsClient *)v5 copyAllStoredNetworkSsidsWithColocatedScopeId:a3];
}

- (id)copyColocatedScopeIdForNetwork:(__WiFiNetwork *)a3
{
  if (![(WiFiAnalyticsManager *)self deviceAnalyticsClient])
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: deviceAnalyticsClient is nil", @"-[WiFiAnalyticsManager copyColocatedScopeIdForNetwork:]"];
    }
    goto LABEL_10;
  }
  unsigned int v5 = sub_10001A43C(a3);
  if (!a3)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: ssid is nil", "-[WiFiAnalyticsManager copyColocatedScopeIdForNetwork:]")
    }
LABEL_10:
    return 0;
  }
  id v6 = v5;
  char v7 = [(WiFiAnalyticsManager *)self deviceAnalyticsClient];

  return [(WADeviceAnalyticsClient *)v7 copyColocatedScopeIdForSsid:v6];
}

- (__WiFiNetwork)copyColocatedScopeTransitionNetwork:(__WiFiNetwork *)a3 minRssi:(int)a4 maxRssi:(int)a5 band:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  if (![(WiFiAnalyticsManager *)self deviceAnalyticsClient])
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: deviceAnalyticsClient is nil", @"-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]", v23, v24, v25, v26];
    }
    goto LABEL_23;
  }
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, "%s: network is nil", "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]", v23, v24, v25, v26];
    }
    goto LABEL_23;
  }
  uint64_t v11 = sub_10001A43C(a3);
  id v12 = sub_10001E404((uint64_t)a3, @"BSSID");
  if (!v12)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: bssid is nil", "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]", v23, v24, v25, v26)];
    }
    goto LABEL_23;
  }
  uint64_t v13 = v12;
  id v14 = [(WADeviceAnalyticsClient *)[(WiFiAnalyticsManager *)self deviceAnalyticsClient] copyColocatedScopeTransitionInfo:v11 bssid:v12 minRssi:v8 maxRssi:v7 band:v6];
  if (!v14)
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:4 message:"%s: No transition info for %@[%@] in [%d,%d]", "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]", v11, v13, v7, v8);
    }
LABEL_23:
    return 0;
  }
  id v15 = v14;
  uint64_t v16 = WADeviceAnalyticsNetworkTransitionInfo[0];
  if ([v14 objectForKey:WADeviceAnalyticsNetworkTransitionInfo[0]])
  {
    uint64_t v17 = WADeviceAnalyticsNetworkTransitionInfo[1];
    if ([v15 objectForKey:v17])
    {
      uint64_t v18 = WADeviceAnalyticsNetworkTransitionInfo[2];
      if ([v15 objectForKey:v18])
      {
        if ([v15 objectForKey:v16]) {
          signed int v19 = [[self _copyCreateEquivalentWiFiNetwork:authFlags:[v15 objectForKey:v16] intValue:[v15 objectForKey:v18]];
        }
        else {
          signed int v19 = 0;
        }
        sub_10001C6A4((uint64_t)v19, @"BSSID", [v15 objectForKey:v17]);
        if (qword_10027DD68) {
          [(id)qword_10027DD68 WFLog:3, "%s: Received %@", "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]", v19 message];
        }
        goto LABEL_13;
      }
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:4 message:"%s: No authFlags in transition info for %@[%@] in [%d,%d]", "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]", v11, v13, v8, v7);
      }
    }
    else
    {
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:4 message:"%s: No BSSID in transition info for %@[%@] in [%d,%d]", "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]", v11, v13, v8, v7);
      }
    }
  }
  else
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:4 message:"%s: No SSID in transition info for %@[%@] in [%d,%d]", "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]", v11, v13, v8, v7);
    }
  }
  signed int v19 = 0;
LABEL_13:
  CFRelease(v15);
  return v19;
}

- (id)getNetworkUsageDictionary:(__WiFiNetwork *)a3
{
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3052000000;
  v28 = sub_100022CA8;
  v29 = sub_100022BC8;
  uint64_t v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3052000000;
  long long v22 = sub_100022CA8;
  uint64_t v23 = sub_100022BC8;
  uint64_t v24 = 0;
  if (![(WiFiAnalyticsManager *)self deviceAnalyticsClient])
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager getNetworkUsageDictionary:]"];
    }
    goto LABEL_29;
  }
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s: network is nil" args:("-[WiFiAnalyticsManager getNetworkUsageDictionary:]", NULL)];
    }
    goto LABEL_29;
  }
  unsigned int v5 = sub_10001A43C(a3);
  if (!v5)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s: givenSsid is nil", @"-[WiFiAnalyticsManager getNetworkUsageDictionary:]"];
    }
LABEL_29:
    goto LABEL_22;
  }
  id v6 = +[NSMutableIndexSet indexSet];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002ADD8;
  v18[3] = &unk_10023ECE8;
  v18[6] = v31;
  v18[7] = &v32;
  v18[4] = v6;
  v18[5] = v5;
  v18[8] = &v19;
  v18[9] = &v36;
  v18[10] = &v25;
  [(NSMutableArray *)[(WiFiAnalyticsManager *)self usageCache] enumerateObjectsUsingBlock:v18];
  if (!*((unsigned char *)v37 + 24))
  {
    id v7 = [(WADeviceAnalyticsClient *)[(WiFiAnalyticsManager *)self deviceAnalyticsClient] copyNetworkUsageDictionary:sub_10001A43C(a3)];
    v26[5] = (uint64_t)v7;
    if (v7)
    {
      v41[0] = v5;
      v40[0] = @"cachedSsid";
      v40[1] = @"cachedDate";
      uint64_t v8 = +[NSDate now];
      v40[2] = @"cachedUsageDict";
      uint64_t v9 = v26[5];
      v41[1] = v8;
      v41[2] = v9;
      uint64_t v10 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
      if ((unint64_t)[(NSMutableArray *)[(WiFiAnalyticsManager *)self usageCache] count] >= 5)
      {
        if (([v6 containsIndex:v33[3]] & 1) == 0)
        {
          if (qword_10027DD68) {
            [(id)qword_10027DD68 WFLog:3, "%s: Will remove object from usageCache for ssid %@", "-[WiFiAnalyticsManager getNetworkUsageDictionary:]", v20[5] message];
          }
          [v6 addIndex:v33[3]];
        }
        if (![v6 count])
        {
          if (qword_10027DD68) {
            [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: No objects to remove from full usageCache!?", "-[WiFiAnalyticsManager getNetworkUsageDictionary:]")
          }
        }
        if ([v6 count])
        {
          [(NSMutableArray *)[(WiFiAnalyticsManager *)self usageCache] removeObjectsAtIndexes:v6];
          if (qword_10027DD68) {
            [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Removed %u objects from usageCache. CurrSize: %u ", "-[WiFiAnalyticsManager getNetworkUsageDictionary:]", objc_msgSend(v6, "count"), -[NSMutableArray count](-[WiFiAnalyticsManager usageCache](self, "usageCache"), "count"));
          }
        }
      }
      [(NSMutableArray *)[(WiFiAnalyticsManager *)self usageCache] addObject:v10];
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: Added usage for %@ to usageCache. CurrSize: %u", "-[WiFiAnalyticsManager getNetworkUsageDictionary:]", v5, -[NSMutableArray count](-[WiFiAnalyticsManager usageCache](self, "usageCache"), "count") message];
      }
    }
  }
LABEL_22:
  id v15 = (void *)v26[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  return v15;
}

- (BOOL)roamParamsQueryPending
{
  return self->_roamParamsQueryPending;
}

- (void)setRoamParamsQueryPending:(BOOL)a3
{
  self->_roamParamsQueryPending = a3;
}

- (__WiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(__WiFiManager *)a3
{
  self->_wifiManager = a3;
}

- (double)managerInitTime
{
  return self->_managerInitTime;
}

- (void)setManagerInitTime:(double)a3
{
  self->_managerInitTime = a3;
}

- (void)setDeviceAnalyticsClient:(id)a3
{
}

- (NSMutableArray)movingNetworkSsidsCache
{
  return self->_movingNetworkSsidsCache;
}

- (void)setMovingNetworkSsidsCache:(id)a3
{
}

- (NSMutableArray)omnipresentNetworkSsidsCache
{
  return self->_omnipresentNetworkSsidsCache;
}

- (void)setOmnipresentNetworkSsidsCache:(id)a3
{
}

- (NSMutableArray)historicallyBadLinkQualityNetworkSsidsCache
{
  return self->_historicallyBadLinkQualityNetworkSsidsCache;
}

- (void)setHistoricallyBadLinkQualityNetworkSsidsCache:(id)a3
{
}

- (NSMutableArray)usageCache
{
  return self->_usageCache;
}

- (void)setUsageCache:(id)a3
{
}

- (NSDate)dateTraitCachesUpdated
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDateTraitCachesUpdated:(id)a3
{
}

- (BOOL)traitsCacheUpdateBusy
{
  return self->_traitsCacheUpdateBusy;
}

- (void)setTraitsCacheUpdateBusy:(BOOL)a3
{
  self->_traitsCacheUpdateBusy = a3;
}

@end