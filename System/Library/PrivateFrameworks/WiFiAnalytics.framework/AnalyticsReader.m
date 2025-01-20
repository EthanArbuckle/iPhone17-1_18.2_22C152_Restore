@interface AnalyticsReader
- (AnalyticsReader)initWithAnalyticsStore:(id)a3;
- (AnalyticsStoreMOHandler)managedObjectHandler;
- (BOOL)isHistoricallyBadLinkQualityNetwork:(id)a3;
- (BOOL)isMovingNetwork:(id)a3;
- (BOOL)isNetworkWithinRangeOfLocation:(id)a3 range:(double)a4 location:(id)a5 count:(unint64_t *)a6;
- (BOOL)isOmnipresentNetwork:(id)a3;
- (BOOL)parsedBeaconInfoIsStored:(id)a3 ssid:(id)a4;
- (NSManagedObjectContext)backgroundReadingMOC;
- (id)_copyNetworkUsageDictionaryWithMOC:(id)a3 moc:(id)a4;
- (id)copyAllStoredNetworkSsids;
- (id)copyAllStoredNetworkSsidsWithColocatedScopeId:(id)a3;
- (id)copyAllStoredNetworkSsidsWithTrait:(unint64_t)a3;
- (id)copyColocatedScopeIdForSsid:(id)a3;
- (id)copyColocatedScopeTransitionInfo:(id)a3 bssid:(id)a4 minRssi:(int)a5 maxRssi:(int)a6 band:(unsigned int)a7;
- (id)copyGeoTagsForNetwork:(id)a3 location:(id)a4;
- (id)copyLocationsForNetwork:(id)a3;
- (id)copyNetworkUsageDictionary:(id)a3;
- (id)copyNetworksAvailableAtLocationWithinDistanceInBand:(id)a3 distance:(double)a4 band:(unsigned int)a5;
- (id)copyPreferenceScoreDictionaryForNetwork:(id)a3;
- (id)copyScoreSortedNetworksAvailableAtLocationWithinDistance:(id)a3 distance:(double)a4 authComparator:(id)a5;
- (id)neighborChannelsForBSS:(id)a3 ssid:(id)a4;
- (id)neighborsForBSS:(id)a3 ssid:(id)a4;
- (int64_t)autoLeaveRssiForBss:(id)a3 ssid:(id)a4;
- (int64_t)rssiRoamTriggerForBSS:(id)a3 ssid:(id)a4;
- (unint64_t)manualLeaveCountForBss:(id)a3 ssid:(id)a4;
- (void)setManagedObjectHandler:(id)a3;
@end

@implementation AnalyticsReader

- (AnalyticsReader)initWithAnalyticsStore:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AnalyticsReader;
  v6 = [(AnalyticsReader *)&v15 init];
  if (v6)
  {
    if (v5)
    {
      v7 = [v5 persistenceManager];

      if (v7)
      {
        v8 = [v5 persistenceManager];
        v9 = [v8 persistenceCoordinator];

        if (v9)
        {
          objc_storeStrong((id *)&v6->_managedObjectHandler, a3);
          v10 = [(AnalyticsReader *)v6 managedObjectHandler];
          v11 = [v10 persistenceManager];
          v12 = [v11 persistenceCoordinator];
          [(NSManagedObjectContext *)v6->_backgroundReadingMOC setPersistentStoreCoordinator:v12];

LABEL_6:
          goto LABEL_7;
        }
        v11 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v17 = "-[AnalyticsReader initWithAnalyticsStore:]";
          __int16 v18 = 1024;
          int v19 = 47;
          v14 = "%{public}s::%d:persistenceCoordinator nil";
          goto LABEL_14;
        }
LABEL_15:
        v10 = v6;
        v6 = 0;
        goto LABEL_6;
      }
      v11 = WALogCategoryDeviceStoreHandle();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136446466;
      v17 = "-[AnalyticsReader initWithAnalyticsStore:]";
      __int16 v18 = 1024;
      int v19 = 46;
      v14 = "%{public}s::%d:persistenceManager nil";
    }
    else
    {
      v11 = WALogCategoryDeviceStoreHandle();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136446466;
      v17 = "-[AnalyticsReader initWithAnalyticsStore:]";
      __int16 v18 = 1024;
      int v19 = 45;
      v14 = "%{public}s::%d:storeMOHandler nil managedObjectHandler";
    }
LABEL_14:
    _os_log_impl(&dword_21D96D000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0x12u);
    goto LABEL_15;
  }
LABEL_7:

  return v6;
}

- (id)neighborsForBSS:(id)a3 ssid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  id v24 = 0;
  v8 = [(AnalyticsReader *)self managedObjectHandler];
  v9 = [v8 managedObjectContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __40__AnalyticsReader_neighborsForBSS_ssid___block_invoke;
  v14[3] = &unk_2644660C0;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  v17 = self;
  __int16 v18 = &v19;
  [v9 performBlockAndWait:v14];

  id v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __40__AnalyticsReader_neighborsForBSS_ssid___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32))
  {
    v14 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136446466;
      __int16 v18 = "-[AnalyticsReader neighborsForBSS:ssid:]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 74;
      id v15 = "%{public}s::%d:bssid nil";
LABEL_12:
      _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0x12u);
    }
LABEL_13:
    v2 = 0;
LABEL_14:

    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;
    goto LABEL_7;
  }
  if (!*(void *)(a1 + 40))
  {
    v14 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136446466;
      __int16 v18 = "-[AnalyticsReader neighborsForBSS:ssid:]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 75;
      id v15 = "%{public}s::%d:ssid nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v2 = [(id)objc_opt_class() formattedMACAddressNotation:*(void *)(a1 + 32) octetCount:6];
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 48) managedObjectHandler];
  id v5 = [v4 managedObjectContext];
  id v6 = +[BSSMO getInstance:v2 ssid:v3 moc:v5];

  if (!v6)
  {
    v14 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136446722;
      __int16 v18 = "-[AnalyticsReader neighborsForBSS:ssid:]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 80;
      __int16 v21 = 2112;
      v22 = v2;
      _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for bssid:%@", (uint8_t *)&v17, 0x1Cu);
    }
    goto LABEL_14;
  }
  id v7 = [v6 neighborBSSIDs];
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    int v17 = 136447234;
    __int16 v18 = "-[AnalyticsReader neighborsForBSS:ssid:]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 84;
    __int16 v21 = 2112;
    v22 = v2;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    __int16 v25 = 2112;
    uint64_t v26 = v13;
    _os_log_impl(&dword_21D96D000, v11, OS_LOG_TYPE_DEBUG, "%{public}s::%d:neighborBSSIDs for bssid[%@] ssid[%@] : %@", (uint8_t *)&v17, 0x30u);
  }

LABEL_7:
}

- (id)neighborChannelsForBSS:(id)a3 ssid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  __int16 v23 = __Block_byref_object_dispose__6;
  id v24 = 0;
  uint64_t v8 = [(AnalyticsReader *)self managedObjectHandler];
  uint64_t v9 = [v8 managedObjectContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__AnalyticsReader_neighborChannelsForBSS_ssid___block_invoke;
  v14[3] = &unk_2644660C0;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  int v17 = self;
  __int16 v18 = &v19;
  [v9 performBlockAndWait:v14];

  id v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __47__AnalyticsReader_neighborChannelsForBSS_ssid___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32))
  {
    v2 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v15 = 136446466;
    id v16 = "-[AnalyticsReader neighborChannelsForBSS:ssid:]_block_invoke";
    __int16 v17 = 1024;
    int v18 = 103;
    uint64_t v13 = "%{public}s::%d:bssid nil";
LABEL_12:
    _os_log_impl(&dword_21D96D000, v2, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x12u);
    goto LABEL_7;
  }
  if (!*(void *)(a1 + 40))
  {
    v2 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v15 = 136446466;
    id v16 = "-[AnalyticsReader neighborChannelsForBSS:ssid:]_block_invoke";
    __int16 v17 = 1024;
    int v18 = 104;
    uint64_t v13 = "%{public}s::%d:ssid nil";
    goto LABEL_12;
  }
  v2 = [(id)objc_opt_class() formattedMACAddressNotation:*(void *)(a1 + 32) octetCount:6];
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 48) managedObjectHandler];
  id v5 = [v4 managedObjectContext];
  uint64_t v6 = +[BSSMO getInstance:v2 ssid:v3 moc:v5];

  if (v6)
  {
    uint64_t v7 = +[RoamPolicyStore neighborChannelsAsArray:log:For:](RoamPolicyStore, "neighborChannelsAsArray:log:For:", v6, 0, "-[AnalyticsReader neighborChannelsForBSS:ssid:]_block_invoke");
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v15 = 136447234;
      id v16 = "-[AnalyticsReader neighborChannelsForBSS:ssid:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 112;
      __int16 v19 = 2112;
      int v20 = v2;
      __int16 v21 = 2112;
      uint64_t v22 = v11;
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_DEBUG, "%{public}s::%d:neighborChannels for bssid[%@] ssid[%@] : %@", (uint8_t *)&v15, 0x30u);
    }

    v2 = v6;
  }
  else
  {
    v14 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446722;
      id v16 = "-[AnalyticsReader neighborChannelsForBSS:ssid:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 109;
      __int16 v19 = 2112;
      int v20 = v2;
      _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for bssid:%@", (uint8_t *)&v15, 0x1Cu);
    }
  }
LABEL_7:
}

- (int64_t)rssiRoamTriggerForBSS:(id)a3 ssid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v8 = [(AnalyticsReader *)self managedObjectHandler];
  uint64_t v9 = [v8 managedObjectContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__AnalyticsReader_rssiRoamTriggerForBSS_ssid___block_invoke;
  v14[3] = &unk_2644660C0;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  __int16 v17 = self;
  int v18 = &v19;
  [v9 performBlockAndWait:v14];

  int64_t v12 = v20[3];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __46__AnalyticsReader_rssiRoamTriggerForBSS_ssid___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32))
  {
    id v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446466;
      uint64_t v13 = "-[AnalyticsReader rssiRoamTriggerForBSS:ssid:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 129;
      id v11 = "%{public}s::%d:bssid nil";
LABEL_12:
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 0x12u);
    }
LABEL_13:
    v2 = 0;
LABEL_14:

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    goto LABEL_7;
  }
  if (!*(void *)(a1 + 40))
  {
    id v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446466;
      uint64_t v13 = "-[AnalyticsReader rssiRoamTriggerForBSS:ssid:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 130;
      id v11 = "%{public}s::%d:ssid nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v2 = [(id)objc_opt_class() formattedMACAddressNotation:*(void *)(a1 + 32) octetCount:6];
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 48) managedObjectHandler];
  id v5 = [v4 managedObjectContext];
  id v6 = +[BSSMO getInstance:v2 ssid:v3 moc:v5];

  if (!v6)
  {
    id v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446722;
      uint64_t v13 = "-[AnalyticsReader rssiRoamTriggerForBSS:ssid:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 135;
      __int16 v16 = 2112;
      __int16 v17 = v2;
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for bssid:%@", (uint8_t *)&v12, 0x1Cu);
    }
    goto LABEL_14;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (int)[v6 roamTriggerRssi];
  id v7 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v12 = 136447234;
    uint64_t v13 = "-[AnalyticsReader rssiRoamTriggerForBSS:ssid:]_block_invoke";
    __int16 v14 = 1024;
    int v15 = 139;
    __int16 v16 = 2112;
    __int16 v17 = v2;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    __int16 v20 = 2048;
    uint64_t v21 = v9;
    _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:triggerRssi for bssid[%@] ssid[%@] : %ld", (uint8_t *)&v12, 0x30u);
  }

LABEL_7:
}

- (int64_t)autoLeaveRssiForBss:(id)a3 ssid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v8 = [(AnalyticsReader *)self managedObjectHandler];
  uint64_t v9 = [v8 managedObjectContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44__AnalyticsReader_autoLeaveRssiForBss_ssid___block_invoke;
  v14[3] = &unk_2644660C0;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  __int16 v17 = self;
  __int16 v18 = &v19;
  [v9 performBlockAndWait:v14];

  int64_t v12 = v20[3];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __44__AnalyticsReader_autoLeaveRssiForBss_ssid___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32))
  {
    id v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446466;
      __int16 v14 = "-[AnalyticsReader autoLeaveRssiForBss:ssid:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 157;
      id v11 = "%{public}s::%d:bssid nil";
LABEL_14:
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0x12u);
    }
LABEL_15:
    v2 = 0;
LABEL_16:

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    goto LABEL_9;
  }
  if (!*(void *)(a1 + 40))
  {
    id v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446466;
      __int16 v14 = "-[AnalyticsReader autoLeaveRssiForBss:ssid:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 158;
      id v11 = "%{public}s::%d:ssid nil";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v2 = [(id)objc_opt_class() formattedMACAddressNotation:*(void *)(a1 + 32) octetCount:6];
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 48) managedObjectHandler];
  id v5 = [v4 managedObjectContext];
  id v6 = +[BSSMO getInstance:v2 ssid:v3 moc:v5];

  if (!v6)
  {
    id v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446722;
      __int16 v14 = "-[AnalyticsReader autoLeaveRssiForBss:ssid:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 163;
      __int16 v17 = 2112;
      __int16 v18 = v2;
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for bssid:%@", (uint8_t *)&v13, 0x1Cu);
    }
    goto LABEL_16;
  }
  if ([v6 isEdgeForLeave])
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (int)[v6 autoLeaveRssi];
    id v7 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      int v13 = 136447234;
      __int16 v14 = "-[AnalyticsReader autoLeaveRssiForBss:ssid:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 169;
      __int16 v17 = 2112;
      __int16 v18 = v2;
      __int16 v19 = 2112;
      uint64_t v20 = v8;
      __int16 v21 = 2048;
      uint64_t v22 = v9;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:autoLeaveRssi for bssid[%@] ssid[%@] : %ld", (uint8_t *)&v13, 0x30u);
    }
  }
  else
  {
    int64_t v12 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446722;
      __int16 v14 = "-[AnalyticsReader autoLeaveRssiForBss:ssid:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 165;
      __int16 v17 = 2112;
      __int16 v18 = v2;
      _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssid:%@ is not an edgeBSS for leave", (uint8_t *)&v13, 0x1Cu);
    }
  }
LABEL_9:
}

- (unint64_t)manualLeaveCountForBss:(id)a3 ssid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v8 = [(AnalyticsReader *)self managedObjectHandler];
  uint64_t v9 = [v8 managedObjectContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__AnalyticsReader_manualLeaveCountForBss_ssid___block_invoke;
  v14[3] = &unk_2644660C0;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  __int16 v17 = self;
  __int16 v18 = &v19;
  [v9 performBlockAndWait:v14];

  unint64_t v12 = v20[3];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __47__AnalyticsReader_manualLeaveCountForBss_ssid___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32))
  {
    id v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446466;
      int v13 = "-[AnalyticsReader manualLeaveCountForBss:ssid:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 187;
      id v11 = "%{public}s::%d:bssid nil";
LABEL_12:
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 0x12u);
    }
LABEL_13:
    v2 = 0;
LABEL_14:

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    goto LABEL_7;
  }
  if (!*(void *)(a1 + 40))
  {
    id v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446466;
      int v13 = "-[AnalyticsReader manualLeaveCountForBss:ssid:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 188;
      id v11 = "%{public}s::%d:ssid nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v2 = [(id)objc_opt_class() formattedMACAddressNotation:*(void *)(a1 + 32) octetCount:6];
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 48) managedObjectHandler];
  id v5 = [v4 managedObjectContext];
  id v6 = +[BSSMO getInstance:v2 ssid:v3 moc:v5];

  if (!v6)
  {
    id v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446722;
      int v13 = "-[AnalyticsReader manualLeaveCountForBss:ssid:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 193;
      __int16 v16 = 2112;
      __int16 v17 = v2;
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for bssid:%@", (uint8_t *)&v12, 0x1Cu);
    }
    goto LABEL_14;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (int)[v6 disUsrForcedInWeakRssiCount];
  id v7 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v12 = 136447234;
    int v13 = "-[AnalyticsReader manualLeaveCountForBss:ssid:]_block_invoke";
    __int16 v14 = 1024;
    int v15 = 197;
    __int16 v16 = 2112;
    __int16 v17 = v2;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    __int16 v20 = 2048;
    uint64_t v21 = v9;
    _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:manualLeaveCount for bssid[%@] ssid[%@] : %ld", (uint8_t *)&v12, 0x30u);
  }

LABEL_7:
}

- (BOOL)parsedBeaconInfoIsStored:(id)a3 ssid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  uint64_t v8 = [(AnalyticsReader *)self managedObjectHandler];
  uint64_t v9 = [v8 managedObjectContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__AnalyticsReader_parsedBeaconInfoIsStored_ssid___block_invoke;
  v13[3] = &unk_2644660C0;
  id v10 = v6;
  id v14 = v10;
  id v11 = v7;
  id v15 = v11;
  __int16 v16 = self;
  __int16 v17 = &v18;
  [v9 performBlockAndWait:v13];

  LOBYTE(self) = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)self;
}

void __49__AnalyticsReader_parsedBeaconInfoIsStored_ssid___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32))
  {
    uint64_t v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446466;
      int v12 = "-[AnalyticsReader parsedBeaconInfoIsStored:ssid:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 216;
      id v10 = "%{public}s::%d:bssid nil";
LABEL_12:
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0x12u);
    }
LABEL_13:
    v2 = 0;
LABEL_14:

    id v6 = 0;
    char v8 = 1;
    goto LABEL_6;
  }
  if (!*(void *)(a1 + 40))
  {
    uint64_t v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446466;
      int v12 = "-[AnalyticsReader parsedBeaconInfoIsStored:ssid:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 217;
      id v10 = "%{public}s::%d:ssid nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v2 = [(id)objc_opt_class() formattedMACAddressNotation:*(void *)(a1 + 32) octetCount:6];
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 48) managedObjectHandler];
  id v5 = [v4 managedObjectContext];
  id v6 = +[BSSMO getInstance:v2 ssid:v3 moc:v5];

  if (!v6)
  {
    uint64_t v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446722;
      int v12 = "-[AnalyticsReader parsedBeaconInfoIsStored:ssid:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 222;
      __int16 v15 = 2112;
      __int16 v16 = v2;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for bssid:%@", (uint8_t *)&v11, 0x1Cu);
    }
    goto LABEL_14;
  }
  id v7 = [v6 parsedBeacon];
  if (!v7)
  {
    char v8 = 0;
LABEL_6:
    id v7 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
  }
}

- (BOOL)isNetworkWithinRangeOfLocation:(id)a3 range:(double)a4 location:(id)a5 count:(unint64_t *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  int v12 = [(AnalyticsReader *)self managedObjectHandler];
  __int16 v13 = [v12 managedObjectContext];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __71__AnalyticsReader_isNetworkWithinRangeOfLocation_range_location_count___block_invoke;
  v18[3] = &unk_264467698;
  id v14 = v10;
  id v19 = v14;
  id v15 = v11;
  double v24 = a4;
  id v20 = v15;
  char v21 = self;
  uint64_t v22 = &v29;
  uint64_t v23 = &v25;
  [v13 performBlockAndWait:v18];

  if (a6) {
    *a6 = v26[3];
  }
  char v16 = *((unsigned char *)v30 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v16;
}

void __71__AnalyticsReader_isNetworkWithinRangeOfLocation_range_location_count___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      double v4 = *(double *)(a1 + 72);
      id v5 = [*(id *)(a1 + 48) managedObjectHandler];
      id v6 = [v5 managedObjectContext];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = +[GeoTagMO isNetworkWithinRangeOfLocation:v2 range:v3 location:v6 moc:*(void *)(*(void *)(a1 + 64) + 8) + 24 count:v4];

      goto LABEL_4;
    }
    id v11 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446466;
      id v14 = "-[AnalyticsReader isNetworkWithinRangeOfLocation:range:location:count:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 245;
      int v12 = "%{public}s::%d:location nil";
      goto LABEL_14;
    }
  }
  else
  {
    id v11 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446466;
      id v14 = "-[AnalyticsReader isNetworkWithinRangeOfLocation:range:location:count:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 244;
      int v12 = "%{public}s::%d:ssid nil";
LABEL_14:
      _os_log_impl(&dword_21D96D000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v13, 0x12u);
    }
  }

LABEL_4:
  id v7 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      uint64_t v9 = "IS";
    }
    else {
      uint64_t v9 = "NOT";
    }
    uint64_t v10 = *(void *)(a1 + 72);
    int v13 = 136447234;
    id v14 = "-[AnalyticsReader isNetworkWithinRangeOfLocation:range:location:count:]_block_invoke";
    __int16 v15 = 1024;
    int v16 = 250;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2080;
    id v20 = v9;
    __int16 v21 = 2048;
    uint64_t v22 = v10;
    _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_DEBUG, "%{public}s::%d:%@ %s within %f of given location", (uint8_t *)&v13, 0x30u);
  }
}

- (id)copyGeoTagsForNetwork:(id)a3 location:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__6;
  uint64_t v23 = __Block_byref_object_dispose__6;
  id v24 = [MEMORY[0x263EFF980] array];
  uint64_t v8 = [(AnalyticsReader *)self managedObjectHandler];
  uint64_t v9 = [v8 managedObjectContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__AnalyticsReader_copyGeoTagsForNetwork_location___block_invoke;
  v14[3] = &unk_2644660C0;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  __int16 v17 = self;
  uint64_t v18 = &v19;
  [v9 performBlockAndWait:v14];

  id v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __50__AnalyticsReader_copyGeoTagsForNetwork_location___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v69 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    id v6 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136446466;
    v61 = "-[AnalyticsReader copyGeoTagsForNetwork:location:]_block_invoke";
    __int16 v62 = 1024;
    int v63 = 267;
    v47 = "%{public}s::%d:ssid nil";
    goto LABEL_35;
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = [*(id *)(a1 + 48) managedObjectHandler];
    double v4 = [v3 managedObjectContext];
    id v5 = +[GeoTagMO geoTagsForNetwork:v2 moc:v4];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v54 objects:v68 count:16];
    if (!v7) {
      goto LABEL_27;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v55;
    v53 = v6;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v55 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v54 + 1) + 8 * v10);
        if (v11)
        {
          [*(id *)(*((void *)&v54 + 1) + 8 * v10) latitude];
          if (v12 == 0.0
            || ([v11 longitude], v13 == 0.0)
            || ([v11 date], id v20 = objc_claimAutoreleasedReturnValue(), v20, !v20))
          {
            id v14 = WALogCategoryDeviceStoreHandle();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              goto LABEL_16;
            }
            [v11 latitude];
            id v16 = v15;
            [v11 longitude];
            uint64_t v18 = v17;
            uint64_t v19 = [v11 date];
            *(_DWORD *)buf = 136447234;
            v61 = "-[AnalyticsReader copyGeoTagsForNetwork:location:]_block_invoke";
            __int16 v62 = 1024;
            int v63 = 279;
            __int16 v64 = 2048;
            v65 = v16;
            __int16 v66 = 2048;
            *(void *)v67 = v18;
            *(_WORD *)&v67[8] = 2112;
            *(void *)&v67[10] = v19;
            _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Nil - geoTag.latitude %f  geoTag.longitude %f geoTag.date %@", buf, 0x30u);
            goto LABEL_13;
          }
          uint64_t v21 = [v11 bss];
          if (v21)
          {
            uint64_t v22 = (void *)v21;
            uint64_t v23 = [v11 bss];
            if ([v23 channel])
            {
              id v24 = [v11 bss];
              uint64_t v25 = [v24 bssid];

              if (v25)
              {
                id v26 = objc_alloc(MEMORY[0x263F00A58]);
                [v11 latitude];
                double v28 = v27;
                [v11 longitude];
                id v14 = [v26 initWithLatitude:v28 longitude:v29];
                [v14 distanceFromLocation:*(void *)(a1 + 40)];
                double v31 = v30;
                char v32 = [v11 bss];
                BOOL v33 = (int)[v32 channel] < 15;

                v58[0] = @"bssid";
                v51 = [v11 bss];
                v50 = [v51 bssid];
                v59[0] = v50;
                v58[1] = @"is5Ghz";
                v49 = [NSNumber numberWithBool:v33];
                v59[1] = v49;
                v58[2] = @"date";
                v48 = [v11 date];
                v59[2] = v48;
                v58[3] = @"latitude";
                v34 = NSNumber;
                [v11 latitude];
                v35 = objc_msgSend(v34, "numberWithDouble:");
                v59[3] = v35;
                v58[4] = @"longitude";
                v36 = NSNumber;
                [v11 longitude];
                v37 = objc_msgSend(v36, "numberWithDouble:");
                v59[4] = v37;
                v58[5] = @"distance";
                v38 = [NSNumber numberWithInt:(int)v31];
                v59[5] = v38;
                v39 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:6];

                id v6 = v53;
                [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v39];

                goto LABEL_16;
              }
            }
            else
            {
            }
          }
          id v14 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            uint64_t v19 = [v11 bss];
            v40 = [v11 bss];
            int v41 = [v40 channel];
            v42 = [v11 bss];
            v43 = [v42 bssid];
            *(_DWORD *)buf = 136447234;
            v61 = "-[AnalyticsReader copyGeoTagsForNetwork:location:]_block_invoke";
            __int16 v62 = 1024;
            int v63 = 284;
            __int16 v64 = 2112;
            v65 = v19;
            __int16 v66 = 1024;
            *(_DWORD *)v67 = v41;
            *(_WORD *)&v67[4] = 2112;
            *(void *)&v67[6] = v43;
            _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Nil - geoTag.bss  %@ geoTag.bss.channel %d geoTag.bss.bssid %@", buf, 0x2Cu);

            id v6 = v53;
LABEL_13:
          }
        }
        else
        {
          id v14 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v61 = "-[AnalyticsReader copyGeoTagsForNetwork:location:]_block_invoke";
            __int16 v62 = 1024;
            int v63 = 274;
            _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:geoTag nil", buf, 0x12u);
          }
        }
LABEL_16:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v44 = [v6 countByEnumeratingWithState:&v54 objects:v68 count:16];
      uint64_t v8 = v44;
      if (!v44)
      {
LABEL_27:

        uint64_t v1 = a1;
        goto LABEL_28;
      }
    }
  }
  id v6 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v61 = "-[AnalyticsReader copyGeoTagsForNetwork:location:]_block_invoke";
    __int16 v62 = 1024;
    int v63 = 268;
    v47 = "%{public}s::%d:location nil";
LABEL_35:
    _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_ERROR, v47, buf, 0x12u);
  }
LABEL_28:

  if (![*(id *)(*(void *)(*(void *)(v1 + 56) + 8) + 40) count])
  {
    uint64_t v45 = *(void *)(*(void *)(v1 + 56) + 8);
    v46 = *(void **)(v45 + 40);
    *(void *)(v45 + 40) = 0;
  }
}

- (id)copyNetworksAvailableAtLocationWithinDistanceInBand:(id)a3 distance:(double)a4 band:(unsigned int)a5
{
  id v8 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__6;
  id v24 = __Block_byref_object_dispose__6;
  id v25 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = [(AnalyticsReader *)self managedObjectHandler];
  uint64_t v10 = [v9 managedObjectContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85__AnalyticsReader_copyNetworksAvailableAtLocationWithinDistanceInBand_distance_band___block_invoke;
  v14[3] = &unk_2644676C0;
  id v11 = v8;
  double v18 = a4;
  unsigned int v19 = a5;
  id v15 = v11;
  id v16 = self;
  uint64_t v17 = &v20;
  [v10 performBlockAndWait:v14];

  id v12 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __85__AnalyticsReader_copyNetworksAvailableAtLocationWithinDistanceInBand_distance_band___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    v37 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v48 = "-[AnalyticsReader copyNetworksAvailableAtLocationWithinDistanceInBand:distance:band:]_block_invoke";
      __int16 v49 = 1024;
      int v50 = 319;
      _os_log_impl(&dword_21D96D000, v37, OS_LOG_TYPE_ERROR, "%{public}s::%d:location nil", buf, 0x12u);
    }
    uint64_t v7 = 0;
    goto LABEL_30;
  }
  double v3 = *(double *)(a1 + 56);
  uint64_t v4 = *(unsigned int *)(a1 + 64);
  id v5 = [*(id *)(a1 + 40) managedObjectHandler];
  id v6 = [v5 managedObjectContext];
  uint64_t v7 = +[GeoTagMO geoTagsAtLocationInBand:v2 distance:v4 band:v6 moc:v3];

  if (!v7) {
    goto LABEL_21;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v38 = v7;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v57 count:16];
  if (!v8) {
    goto LABEL_20;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v42;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v42 != v10) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      if (v12)
      {
        uint64_t v13 = [*(id *)(*((void *)&v41 + 1) + 8 * i) bss];
        if (v13)
        {
          id v14 = (void *)v13;
          id v15 = [v12 bss];
          uint64_t v16 = [v15 network];
          if (v16)
          {
            uint64_t v17 = (void *)v16;
            double v18 = [v12 bss];
            unsigned int v19 = [v18 network];
            uint64_t v20 = [v19 ssid];

            if (v20)
            {
              v45[0] = @"ssid";
              uint64_t v21 = [v12 bss];
              uint64_t v22 = [v21 network];
              uint64_t v23 = [v22 ssid];
              v45[1] = @"authFlags";
              v46[0] = v23;
              id v24 = NSNumber;
              id v25 = [v12 bss];
              id v26 = [v25 network];
              double v27 = objc_msgSend(v24, "numberWithInt:", objc_msgSend(v26, "authFlags"));
              v46[1] = v27;
              double v28 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];

              [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v28];
              goto LABEL_18;
            }
          }
          else
          {
          }
        }
        double v28 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          double v29 = [v12 bss];
          double v30 = [v12 bss];
          double v31 = [v30 network];
          char v32 = [v12 bss];
          BOOL v33 = [v32 network];
          v34 = [v33 ssid];
          *(_DWORD *)buf = 136447234;
          v48 = "-[AnalyticsReader copyNetworksAvailableAtLocationWithinDistanceInBand:distance:band:]_block_invoke";
          __int16 v49 = 1024;
          int v50 = 331;
          __int16 v51 = 2112;
          v52 = v29;
          __int16 v53 = 2112;
          long long v54 = v31;
          __int16 v55 = 2112;
          long long v56 = v34;
          _os_log_impl(&dword_21D96D000, v28, OS_LOG_TYPE_ERROR, "%{public}s::%d:Nil - geoTag.bss  %@ geoTag.bss.network %@ geoTag.bss.network.ssid %@", buf, 0x30u);
        }
      }
      else
      {
        double v28 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v48 = "-[AnalyticsReader copyNetworksAvailableAtLocationWithinDistanceInBand:distance:band:]_block_invoke";
          __int16 v49 = 1024;
          int v50 = 326;
          _os_log_impl(&dword_21D96D000, v28, OS_LOG_TYPE_ERROR, "%{public}s::%d:geoTag nil", buf, 0x12u);
        }
      }
LABEL_18:
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v41 objects:v57 count:16];
  }
  while (v9);
LABEL_20:

  uint64_t v7 = v38;
LABEL_21:
  uint64_t v1 = a1;
  if (!objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "count", v38))
  {
    v37 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v48 = "-[AnalyticsReader copyNetworksAvailableAtLocationWithinDistanceInBand:distance:band:]_block_invoke";
      __int16 v49 = 1024;
      int v50 = 341;
      _os_log_impl(&dword_21D96D000, v37, OS_LOG_TYPE_ERROR, "%{public}s::%d:No networks", buf, 0x12u);
    }
LABEL_30:
  }
  if (![*(id *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) count])
  {
    uint64_t v35 = *(void *)(*(void *)(v1 + 48) + 8);
    v36 = *(void **)(v35 + 40);
    *(void *)(v35 + 40) = 0;
  }
}

- (id)copyScoreSortedNetworksAvailableAtLocationWithinDistance:(id)a3 distance:(double)a4 authComparator:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v26 = 0;
  double v27 = &v26;
  uint64_t v28 = 0x3032000000;
  double v29 = __Block_byref_object_copy__6;
  double v30 = __Block_byref_object_dispose__6;
  id v31 = [MEMORY[0x263EFF980] array];
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__60;
  v24[4] = __Block_byref_object_dispose__61;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __100__AnalyticsReader_copyScoreSortedNetworksAvailableAtLocationWithinDistance_distance_authComparator___block_invoke;
  v22[3] = &unk_2644676E8;
  id v10 = v9;
  id v23 = v10;
  id v25 = (id)MEMORY[0x223C0F530](v22);
  id v11 = [(AnalyticsReader *)self managedObjectHandler];
  id v12 = [v11 managedObjectContext];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __100__AnalyticsReader_copyScoreSortedNetworksAvailableAtLocationWithinDistance_distance_authComparator___block_invoke_75;
  v16[3] = &unk_264467738;
  id v13 = v8;
  double v21 = a4;
  id v17 = v13;
  double v18 = self;
  unsigned int v19 = v24;
  uint64_t v20 = &v26;
  [v12 performBlockAndWait:v16];

  id v14 = (id)v27[5];
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(&v26, 8);
  return v14;
}

uint64_t __100__AnalyticsReader_copyScoreSortedNetworksAvailableAtLocationWithinDistance_distance_authComparator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (a2) {
    uint64_t v3 = -1;
  }
  else {
    uint64_t v3 = a3 != 0;
  }
  if (a2 && a3)
  {
    id v6 = a3;
    id v7 = a2;
    id v8 = [v7 objectForKey:@"score"];
    uint64_t v9 = [v8 longLongValue];

    id v10 = [v6 objectForKey:@"score"];
    uint64_t v11 = [v10 longLongValue];

    id v12 = [v7 objectForKey:@"ssid"];
    id v13 = [v6 objectForKey:@"ssid"];
    id v14 = [v7 objectForKey:@"authFlags"];
    int v15 = [v14 intValue];

    uint64_t v16 = [v6 objectForKey:@"authFlags"];
    int v17 = [v16 intValue];

    uint64_t v27 = [v7 objectForKey:@"geoTagDate"];

    double v18 = [v6 objectForKey:@"geoTagDate"];

    unsigned int v19 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446978;
      double v29 = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:]_block_invoke";
      __int16 v30 = 1024;
      int v31 = 379;
      __int16 v32 = 2112;
      BOOL v33 = v12;
      __int16 v34 = 2112;
      *(void *)uint64_t v35 = v13;
      _os_log_impl(&dword_21D96D000, v19, OS_LOG_TYPE_INFO, "%{public}s::%d:Comparing %@ %@", buf, 0x26u);
    }

    if (v9 == v11)
    {
      uint64_t v20 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136447490;
        double v29 = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:]_block_invoke";
        __int16 v30 = 1024;
        int v31 = 382;
        __int16 v32 = 2112;
        BOOL v33 = v12;
        __int16 v34 = 1024;
        *(_DWORD *)uint64_t v35 = v15;
        *(_WORD *)&v35[4] = 2112;
        *(void *)&v35[6] = v13;
        *(_WORD *)&v35[14] = 1024;
        *(_DWORD *)&v35[16] = v17;
        _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_INFO, "%{public}s::%d:Using security type as tie breaker between %@ (%d) and %@ (%d)", buf, 0x32u);
      }

      int v21 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
      uint64_t v22 = (void *)v27;
      if (v21 == -1)
      {
        uint64_t v3 = 1;
      }
      else if (v21 == 1)
      {
        uint64_t v3 = -1;
      }
      else
      {
        id v25 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136447490;
          double v29 = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:]_block_invoke";
          __int16 v30 = 1024;
          int v31 = 391;
          __int16 v32 = 2112;
          BOOL v33 = v12;
          __int16 v34 = 2112;
          *(void *)uint64_t v35 = v27;
          *(_WORD *)&v35[8] = 2112;
          *(void *)&v35[10] = v13;
          *(_WORD *)&v35[18] = 2112;
          uint64_t v36 = (uint64_t)v18;
          _os_log_impl(&dword_21D96D000, v25, OS_LOG_TYPE_INFO, "%{public}s::%d:Using last geotag date as tie breaker between %@ (%@) and %@ (%@)", buf, 0x3Au);
        }

        uint64_t v3 = [v18 compare:v27];
      }
    }
    else
    {
      id v23 = WALogCategoryDeviceStoreHandle();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
      if (v9 >= v11)
      {
        if (v24)
        {
          *(_DWORD *)buf = 136447490;
          double v29 = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:]_block_invoke";
          __int16 v30 = 1024;
          int v31 = 399;
          __int16 v32 = 2112;
          BOOL v33 = v12;
          __int16 v34 = 2048;
          *(void *)uint64_t v35 = v9;
          *(_WORD *)&v35[8] = 2112;
          *(void *)&v35[10] = v13;
          *(_WORD *)&v35[18] = 2048;
          uint64_t v36 = v11;
          _os_log_impl(&dword_21D96D000, v23, OS_LOG_TYPE_INFO, "%{public}s::%d:%@ (%lld) > %@ (%lld)", buf, 0x3Au);
        }

        uint64_t v3 = -1;
      }
      else
      {
        if (v24)
        {
          *(_DWORD *)buf = 136447490;
          double v29 = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:]_block_invoke";
          __int16 v30 = 1024;
          int v31 = 396;
          __int16 v32 = 2112;
          BOOL v33 = v12;
          __int16 v34 = 2048;
          *(void *)uint64_t v35 = v9;
          *(_WORD *)&v35[8] = 2112;
          *(void *)&v35[10] = v13;
          *(_WORD *)&v35[18] = 2048;
          uint64_t v36 = v11;
          _os_log_impl(&dword_21D96D000, v23, OS_LOG_TYPE_INFO, "%{public}s::%d:%@ (%lld) < %@ (%lld)", buf, 0x3Au);
        }

        uint64_t v3 = 1;
      }
      uint64_t v22 = (void *)v27;
    }
  }
  return v3;
}

void __100__AnalyticsReader_copyScoreSortedNetworksAvailableAtLocationWithinDistance_distance_authComparator___block_invoke_75(uint64_t a1)
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  long long v43 = [MEMORY[0x263EFF980] array];
  uint64_t v57 = 0;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__6;
  v61 = __Block_byref_object_dispose__6;
  id v62 = [MEMORY[0x263F089D8] string];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1)
  {
    v39 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authCompa"
                           "rator:]_block_invoke";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 410;
      _os_log_impl(&dword_21D96D000, v39, OS_LOG_TYPE_ERROR, "%{public}s::%d:location nil", buf, 0x12u);
    }
    long long v42 = 0;
    uint64_t v27 = 0;
    goto LABEL_36;
  }
  double v2 = *(double *)(a1 + 64);
  uint64_t v3 = [*(id *)(a1 + 40) managedObjectHandler];
  uint64_t v4 = [v3 managedObjectContext];
  long long v42 = +[GeoTagMO geoTagsAtLocationInBand:v1 distance:0 band:v4 moc:v2];

  if (!v42)
  {
LABEL_33:
    uint64_t v27 = 0;
    goto LABEL_34;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v42;
  uint64_t v5 = [obj countByEnumeratingWithState:&v53 objects:v77 count:16];
  if (!v5) {
    goto LABEL_18;
  }
  uint64_t v6 = *(void *)v54;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v54 != v6) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v53 + 1) + 8 * i);
      if (v8)
      {
        uint64_t v9 = [*(id *)(*((void *)&v53 + 1) + 8 * i) date];
        if (v9)
        {
          id v10 = [v8 bss];
          if (v10)
          {
            uint64_t v11 = [v8 bss];
            id v12 = [v11 network];
            BOOL v13 = v12 == 0;

            if (!v13)
            {
              id v14 = [v8 bss];
              int v15 = [v14 network];

              uint64_t v16 = [v15 ssid];
              int v17 = [*(id *)(a1 + 40) managedObjectHandler];
              double v18 = [v17 managedObjectContext];
              int64_t v19 = +[NetworkMO getTotalScore:v16 moc:v18];

              v75[0] = @"ssid";
              uint64_t v20 = [v15 ssid];
              v76[0] = v20;
              v75[1] = @"authFlags";
              int v21 = objc_msgSend(NSNumber, "numberWithInt:", -[NSObject authFlags](v15, "authFlags"));
              v76[1] = v21;
              v75[2] = @"geoTagDate";
              uint64_t v22 = [v8 date];
              v76[2] = v22;
              v75[3] = @"score";
              id v23 = [NSNumber numberWithLongLong:v19];
              v76[3] = v23;
              BOOL v24 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:4];

              [v43 addObject:v24];
              goto LABEL_16;
            }
          }
          else
          {
          }
        }
      }
      int v15 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authCom"
                             "parator:]_block_invoke";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 417;
        _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:geoTag/geoTag.date nil or geoTag.bss nil or geoTag.bss.network nil", buf, 0x12u);
      }
LABEL_16:
    }
    uint64_t v5 = [obj countByEnumeratingWithState:&v53 objects:v77 count:16];
  }
  while (v5);
LABEL_18:

  if (!v43) {
    goto LABEL_33;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__6;
  v73 = __Block_byref_object_dispose__6;
  id v74 = [MEMORY[0x263F089D8] string];
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __100__AnalyticsReader_copyScoreSortedNetworksAvailableAtLocationWithinDistance_distance_authComparator___block_invoke_78;
  v52[3] = &unk_264467710;
  v52[4] = buf;
  [v43 enumerateObjectsUsingBlock:v52];
  id v25 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)__int16 v66 = 136446722;
    v67 = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:]_block_invoke_2";
    __int16 v68 = 1024;
    int v69 = 439;
    __int16 v70 = 2112;
    uint64_t v71 = v26;
    _os_log_impl(&dword_21D96D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Unsorted networks: %@", v66, 0x1Cu);
  }

  uint64_t v27 = [v43 sortedArrayUsingComparator:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  _Block_object_dispose(buf, 8);

  if (v27 && [v27 count])
  {
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __100__AnalyticsReader_copyScoreSortedNetworksAvailableAtLocationWithinDistance_distance_authComparator___block_invoke_83;
    v51[3] = &unk_264467710;
    v51[4] = &v57;
    [v27 enumerateObjectsUsingBlock:v51];
    uint64_t v28 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = v58[5];
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authCompa"
                           "rator:]_block_invoke_2";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 452;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v29;
      _os_log_impl(&dword_21D96D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Score sorted networks: %@", buf, 0x1Cu);
    }

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v44 = v27;
    uint64_t v30 = [v44 countByEnumeratingWithState:&v47 objects:v65 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v48 != v31) {
            objc_enumerationMutation(v44);
          }
          BOOL v33 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          __int16 v34 = objc_msgSend(v33, "objectForKey:", @"ssid", v42);
          uint64_t v35 = [v33 objectForKey:@"authFlags"];
          uint64_t v36 = [v35 intValue];

          v63[1] = @"authFlags";
          v64[0] = v34;
          v63[0] = @"ssid";
          uint64_t v37 = [NSNumber numberWithUnsignedInt:v36];
          v64[1] = v37;
          v38 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];

          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v38];
        }
        uint64_t v30 = [v44 countByEnumeratingWithState:&v47 objects:v65 count:16];
      }
      while (v30);
    }

    uint64_t v27 = 0;
    long long v42 = obj;
    v39 = v44;
    goto LABEL_36;
  }
LABEL_34:
  v39 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authCompara"
                         "tor:]_block_invoke";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 445;
    _os_log_impl(&dword_21D96D000, v39, OS_LOG_TYPE_ERROR, "%{public}s::%d:No score sorted networks", buf, 0x12u);
  }
LABEL_36:

  if (![*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  {
    uint64_t v40 = *(void *)(*(void *)(a1 + 56) + 8);
    long long v41 = *(void **)(v40 + 40);
    *(void *)(v40 + 40) = 0;
  }
  _Block_object_dispose(&v57, 8);
}

void __100__AnalyticsReader_copyScoreSortedNetworksAvailableAtLocationWithinDistance_distance_authComparator___block_invoke_78(uint64_t a1, void *a2)
{
  double v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  id v9 = [v3 objectForKey:@"ssid"];
  uint64_t v4 = [v3 objectForKey:@"authFlags"];
  uint64_t v5 = [v4 intValue];
  uint64_t v6 = [v3 objectForKey:@"score"];
  uint64_t v7 = [v6 longLongValue];
  id v8 = [v3 objectForKey:@"geoTagDate"];

  [v2 appendFormat:@"%@ {%d, %lld, %@}, ", v9, v5, v7, v8];
}

void __100__AnalyticsReader_copyScoreSortedNetworksAvailableAtLocationWithinDistance_distance_authComparator___block_invoke_83(uint64_t a1, void *a2)
{
  double v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  id v9 = [v3 objectForKey:@"ssid"];
  uint64_t v4 = [v3 objectForKey:@"authFlags"];
  uint64_t v5 = [v4 intValue];
  uint64_t v6 = [v3 objectForKey:@"score"];
  uint64_t v7 = [v6 longLongValue];
  id v8 = [v3 objectForKey:@"geoTagDate"];

  [v2 appendFormat:@"%@ {%d, %lld, %@}, ", v9, v5, v7, v8];
}

- (id)copyPreferenceScoreDictionaryForNetwork:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  int v17 = __Block_byref_object_copy__6;
  double v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  uint64_t v5 = [(AnalyticsReader *)self managedObjectHandler];
  uint64_t v6 = [v5 managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__AnalyticsReader_copyPreferenceScoreDictionaryForNetwork___block_invoke;
  v10[3] = &unk_264466070;
  id v7 = v4;
  id v11 = v7;
  id v12 = self;
  BOOL v13 = &v14;
  [v6 performBlockAndWait:v10];

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __59__AnalyticsReader_copyPreferenceScoreDictionaryForNetwork___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectHandler];
  id v4 = [v3 managedObjectContext];
  uint64_t v5 = +[NetworkMO getInstance:v2 moc:v4];

  if (v5)
  {
    id v23 = objc_alloc(NSDictionary);
    uint64_t v6 = NSNumber;
    id v25 = [v5 ssid];
    uint64_t v26 = [*(id *)(a1 + 40) managedObjectHandler];
    BOOL v24 = [v26 managedObjectContext];
    uint64_t v22 = objc_msgSend(v6, "numberWithLongLong:", +[NetworkMO getTotalScore:moc:](NetworkMO, "getTotalScore:moc:", v25, v24));
    int v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isMoving"));
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isOmnipresent"));
    id v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "switchedAwayFromCount"));
    id v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "switchedToCount"));
    id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "authFlags") != 0);
    id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isTCPGood"));
    id v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isLongTermNetwork"));
    uint64_t v12 = objc_msgSend(v23, "initWithObjectsAndKeys:", v22, @"TotalScore", v21, @"isMoving", v20, @"isOmniPresent", v7, @"switchedAwayFromCount", v8, @"switchedToCount", v9, @"isSecured", v10, @"isTCPGood", v11, @"isLongTermNetwork", 0);
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  else
  {
    double v18 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136446722;
      uint64_t v28 = "-[AnalyticsReader copyPreferenceScoreDictionaryForNetwork:]_block_invoke";
      __int16 v29 = 1024;
      int v30 = 479;
      __int16 v31 = 2112;
      uint64_t v32 = v19;
      _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_DEBUG, "%{public}s::%d:networkMO nil for ssid %@", buf, 0x1Cu);
    }
  }
  int v15 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      int v17 = "available";
    }
    else {
      int v17 = "NOT available";
    }
    *(_DWORD *)buf = 136446978;
    uint64_t v28 = "-[AnalyticsReader copyPreferenceScoreDictionaryForNetwork:]_block_invoke";
    __int16 v29 = 1024;
    int v30 = 493;
    __int16 v31 = 2112;
    uint64_t v32 = v16;
    __int16 v33 = 2080;
    __int16 v34 = v17;
    _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:%@ prefscores: %s", buf, 0x26u);
  }
}

- (BOOL)isMovingNetwork:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v5 = [(AnalyticsReader *)self managedObjectHandler];
  uint64_t v6 = [v5 managedObjectContext];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__AnalyticsReader_isMovingNetwork___block_invoke;
  v9[3] = &unk_264466070;
  id v7 = v4;
  id v10 = v7;
  id v11 = self;
  uint64_t v12 = &v13;
  [v6 performBlockAndWait:v9];

  LOBYTE(self) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)self;
}

void __35__AnalyticsReader_isMovingNetwork___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectHandler];
  id v4 = [v3 managedObjectContext];
  uint64_t v5 = +[NetworkMO getInstance:v2 moc:v4];

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 isMoving];
  }
  else
  {
    id v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 136446722;
      uint64_t v12 = "-[AnalyticsReader isMovingNetwork:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 506;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", (uint8_t *)&v11, 0x1Cu);
    }
  }
  uint64_t v6 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      id v8 = "Moving";
    }
    else {
      id v8 = "NOT Moving";
    }
    int v11 = 136446978;
    uint64_t v12 = "-[AnalyticsReader isMovingNetwork:]_block_invoke";
    __int16 v13 = 1024;
    int v14 = 511;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2080;
    double v18 = v8;
    _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ trait: %s", (uint8_t *)&v11, 0x26u);
  }
}

- (BOOL)isOmnipresentNetwork:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v5 = [(AnalyticsReader *)self managedObjectHandler];
  uint64_t v6 = [v5 managedObjectContext];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__AnalyticsReader_isOmnipresentNetwork___block_invoke;
  v9[3] = &unk_264466070;
  id v7 = v4;
  id v10 = v7;
  int v11 = self;
  uint64_t v12 = &v13;
  [v6 performBlockAndWait:v9];

  LOBYTE(self) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)self;
}

void __40__AnalyticsReader_isOmnipresentNetwork___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectHandler];
  id v4 = [v3 managedObjectContext];
  uint64_t v5 = +[NetworkMO getInstance:v2 moc:v4];

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 isOmnipresent];
  }
  else
  {
    id v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 136446722;
      uint64_t v12 = "-[AnalyticsReader isOmnipresentNetwork:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 524;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", (uint8_t *)&v11, 0x1Cu);
    }
  }
  uint64_t v6 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      id v8 = "Omnipresent";
    }
    else {
      id v8 = "NOT Omnipresent";
    }
    int v11 = 136446978;
    uint64_t v12 = "-[AnalyticsReader isOmnipresentNetwork:]_block_invoke";
    __int16 v13 = 1024;
    int v14 = 529;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2080;
    double v18 = v8;
    _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ trait: %s", (uint8_t *)&v11, 0x26u);
  }
}

- (BOOL)isHistoricallyBadLinkQualityNetwork:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v5 = [(AnalyticsReader *)self managedObjectHandler];
  uint64_t v6 = [v5 managedObjectContext];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__AnalyticsReader_isHistoricallyBadLinkQualityNetwork___block_invoke;
  v9[3] = &unk_264466070;
  id v7 = v4;
  id v10 = v7;
  int v11 = self;
  uint64_t v12 = &v13;
  [v6 performBlockAndWait:v9];

  LOBYTE(self) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)self;
}

void __55__AnalyticsReader_isHistoricallyBadLinkQualityNetwork___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectHandler];
  id v4 = [v3 managedObjectContext];
  uint64_t v5 = +[NetworkMO getInstance:v2 moc:v4];

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 isTCPGood] ^ 1;
  }
  else
  {
    id v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 136446722;
      uint64_t v12 = "-[AnalyticsReader isHistoricallyBadLinkQualityNetwork:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 542;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", (uint8_t *)&v11, 0x1Cu);
    }
  }
  uint64_t v6 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      id v8 = "HistoricallyBad";
    }
    else {
      id v8 = "NOT HistoricallyBad";
    }
    int v11 = 136446978;
    uint64_t v12 = "-[AnalyticsReader isHistoricallyBadLinkQualityNetwork:]_block_invoke";
    __int16 v13 = 1024;
    int v14 = 547;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2080;
    double v18 = v8;
    _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ trait: %s", (uint8_t *)&v11, 0x26u);
  }
}

- (id)copyLocationsForNetwork:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x3032000000;
  __int16 v17 = __Block_byref_object_copy__6;
  double v18 = __Block_byref_object_dispose__6;
  id v19 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = [(AnalyticsReader *)self managedObjectHandler];
  uint64_t v6 = [v5 managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__AnalyticsReader_copyLocationsForNetwork___block_invoke;
  v10[3] = &unk_264466070;
  id v7 = v4;
  id v11 = v7;
  uint64_t v12 = self;
  __int16 v13 = &v14;
  [v6 performBlockAndWait:v10];

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __43__AnalyticsReader_copyLocationsForNetwork___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) managedObjectHandler];
    id v4 = [v3 managedObjectContext];
    uint64_t v5 = +[GeoTagMO geoTagsForNetwork:v2 moc:v4];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (v11)
          {
            id v12 = objc_alloc(MEMORY[0x263F00A58]);
            [v11 latitude];
            double v14 = v13;
            [v11 longitude];
            uint64_t v16 = [v12 initWithLatitude:v14 longitude:v15];
            if (v16)
            {
              __int16 v17 = v16;
              [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v16];
            }
            else
            {
              double v18 = WALogCategoryDeviceStoreHandle();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446466;
                uint64_t v27 = "-[AnalyticsReader copyLocationsForNetwork:]_block_invoke";
                __int16 v28 = 1024;
                int v29 = 572;
                _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:location nil", buf, 0x12u);
              }

              __int16 v17 = 0;
            }
          }
          else
          {
            __int16 v17 = WALogCategoryDeviceStoreHandle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              uint64_t v27 = "-[AnalyticsReader copyLocationsForNetwork:]_block_invoke";
              __int16 v28 = 1024;
              int v29 = 566;
              _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:geoTag nil", buf, 0x12u);
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v6 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v27 = "-[AnalyticsReader copyLocationsForNetwork:]_block_invoke";
      __int16 v28 = 1024;
      int v29 = 560;
      _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid nil", buf, 0x12u);
    }
  }

  if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = 0;
  }
}

- (id)copyAllStoredNetworkSsids
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__6;
  id v12 = __Block_byref_object_dispose__6;
  id v13 = 0;
  id v3 = [(AnalyticsReader *)self managedObjectHandler];
  id v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__AnalyticsReader_copyAllStoredNetworkSsids__block_invoke;
  v7[3] = &unk_2644673F8;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __44__AnalyticsReader_copyAllStoredNetworkSsids__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectHandler];
  id v3 = [v2 managedObjectContext];
  uint64_t v4 = +[NetworkMO allStoredSsids:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v7 || ![v7 count])
  {
    uint64_t v8 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446466;
      uint64_t v10 = "-[AnalyticsReader copyAllStoredNetworkSsids]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 595;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:No known network SSIDs", (uint8_t *)&v9, 0x12u);
    }
  }
}

- (id)copyAllStoredNetworkSsidsWithTrait:(unint64_t)a3
{
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__6;
  double v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  uint64_t v5 = [(AnalyticsReader *)self managedObjectHandler];
  uint64_t v6 = [v5 managedObjectContext];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__AnalyticsReader_copyAllStoredNetworkSsidsWithTrait___block_invoke;
  v9[3] = &unk_264467760;
  void v9[4] = self;
  v9[5] = &v10;
  v9[6] = a3;
  [v6 performBlockAndWait:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __54__AnalyticsReader_copyAllStoredNetworkSsidsWithTrait___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectHandler];
  id v3 = [v2 managedObjectContext];
  id v4 = +[NetworkMO copyAllSsidsWithTrait:v3 trait:*(void *)(a1 + 48)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v7 || ![v7 count])
  {
    uint64_t v8 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 136446722;
      __int16 v11 = "-[AnalyticsReader copyAllStoredNetworkSsidsWithTrait:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 611;
      __int16 v14 = 2048;
      uint64_t v15 = v9;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:No known network SSIDs with trait: %lu", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (id)copyAllStoredNetworkSsidsWithColocatedScopeId:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  __int16 v17 = __Block_byref_object_copy__6;
  double v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  uint64_t v5 = [(AnalyticsReader *)self managedObjectHandler];
  uint64_t v6 = [v5 managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__AnalyticsReader_copyAllStoredNetworkSsidsWithColocatedScopeId___block_invoke;
  v10[3] = &unk_264467788;
  id v7 = v4;
  __int16 v12 = self;
  int v13 = &v14;
  id v11 = v7;
  [v6 performBlockAndWait:v10];

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __65__AnalyticsReader_copyAllStoredNetworkSsidsWithColocatedScopeId___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) managedObjectHandler];
    id v4 = [v3 managedObjectContext];
    id v5 = +[NetworkMO copyAllSsidsWithColocatedScopeIdStr:v2 moc:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id v11 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446466;
      int v13 = "-[AnalyticsReader copyAllStoredNetworkSsidsWithColocatedScopeId:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 624;
      _os_log_impl(&dword_21D96D000, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:colocatedScopeIdStr nil", (uint8_t *)&v12, 0x12u);
    }
  }
  id v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v8 || ![v8 count])
  {
    uint64_t v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v12 = 136446722;
      int v13 = "-[AnalyticsReader copyAllStoredNetworkSsidsWithColocatedScopeId:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 630;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:No known network SSIDs for colocatedScopeIdStr:%@", (uint8_t *)&v12, 0x1Cu);
    }
  }
}

- (id)copyColocatedScopeIdForSsid:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__6;
  uint64_t v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  id v5 = [(AnalyticsReader *)self managedObjectHandler];
  uint64_t v6 = [v5 managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__AnalyticsReader_copyColocatedScopeIdForSsid___block_invoke;
  v10[3] = &unk_264466070;
  id v7 = v4;
  id v11 = v7;
  int v12 = self;
  int v13 = &v14;
  [v6 performBlockAndWait:v10];

  id v8 = (void *)[(id)v15[5] copy];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __47__AnalyticsReader_copyColocatedScopeIdForSsid___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    uint64_t v16 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136446466;
      long long v22 = "-[AnalyticsReader copyColocatedScopeIdForSsid:]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 646;
      uint64_t v17 = "%{public}s::%d:ssid nil";
      uint64_t v18 = v16;
      uint32_t v19 = 18;
LABEL_12:
      _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v21, v19);
    }
LABEL_13:

    id v5 = 0;
    id v7 = 0;
    goto LABEL_5;
  }
  id v3 = [*(id *)(a1 + 40) managedObjectHandler];
  id v4 = [v3 managedObjectContext];
  id v5 = +[NetworkMO getInstance:v2 moc:v4];

  if (!v5)
  {
    uint64_t v16 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      int v21 = 136446722;
      long long v22 = "-[AnalyticsReader copyColocatedScopeIdForSsid:]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 649;
      __int16 v25 = 2112;
      uint64_t v26 = v20;
      uint64_t v17 = "%{public}s::%d:networkMO nil for ssid %@";
      uint64_t v18 = v16;
      uint32_t v19 = 28;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  uint64_t v6 = [v5 colocatedScopeId];
  id v7 = v6;
  if (v6)
  {
    id v8 = NSString;
    uint64_t v9 = [v6 UUIDString];
    uint64_t v10 = [v8 stringWithString:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
LABEL_5:
  int v13 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v21 = 136446978;
    long long v22 = "-[AnalyticsReader copyColocatedScopeIdForSsid:]_block_invoke";
    __int16 v23 = 1024;
    int v24 = 658;
    __int16 v25 = 2112;
    uint64_t v26 = v14;
    __int16 v27 = 2112;
    uint64_t v28 = v15;
    _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ colocatedScopeIdStr: %@", (uint8_t *)&v21, 0x26u);
  }
}

- (id)copyColocatedScopeTransitionInfo:(id)a3 bssid:(id)a4 minRssi:(int)a5 maxRssi:(int)a6 band:(unsigned int)a7
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  __int16 v31 = __Block_byref_object_copy__6;
  uint64_t v32 = __Block_byref_object_dispose__6;
  id v33 = 0;
  uint64_t v14 = [(AnalyticsReader *)self managedObjectHandler];
  uint64_t v15 = [v14 managedObjectContext];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __79__AnalyticsReader_copyColocatedScopeTransitionInfo_bssid_minRssi_maxRssi_band___block_invoke;
  v20[3] = &unk_2644677B0;
  id v16 = v12;
  id v21 = v16;
  id v17 = v13;
  int v25 = a5;
  int v26 = a6;
  unsigned int v27 = a7;
  id v22 = v17;
  __int16 v23 = self;
  int v24 = &v28;
  [v15 performBlockAndWait:v20];

  id v18 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v18;
}

void __79__AnalyticsReader_copyColocatedScopeTransitionInfo_bssid_minRssi_maxRssi_band___block_invoke(uint64_t a1)
{
  v50[3] = *MEMORY[0x263EF8340];
  int v29 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    uint64_t v15 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v31 = "-[AnalyticsReader copyColocatedScopeTransitionInfo:bssid:minRssi:maxRssi:band:]_block_invoke";
      __int16 v32 = 1024;
      int v33 = 676;
      int v25 = "%{public}s::%d:ssid nil";
LABEL_16:
      _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_ERROR, v25, buf, 0x12u);
    }
LABEL_17:
    id v11 = 0;
    id v10 = 0;
    id v9 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (!v3)
  {
    uint64_t v15 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v31 = "-[AnalyticsReader copyColocatedScopeTransitionInfo:bssid:minRssi:maxRssi:band:]_block_invoke";
      __int16 v32 = 1024;
      int v33 = 677;
      int v25 = "%{public}s::%d:bssid nil";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  uint64_t v4 = *(unsigned int *)(a1 + 64);
  uint64_t v5 = *(unsigned int *)(a1 + 68);
  uint64_t v6 = *(unsigned int *)(a1 + 72);
  id v27 = 0;
  id v28 = 0;
  id v26 = 0;
  id v7 = [*(id *)(a1 + 48) managedObjectHandler];
  id v8 = [v7 managedObjectContext];
  LODWORD(v4) = +[ScanMO getSsidAndBssidWithinRangeForColocatedScopeTransition:v2 bssid:v3 minRssi:v4 maxRssi:v5 band:v6 transitionSsid:&v28 transitionBssid:&v27 transitionRssi:&v29 authFlags:&v26 moc:v8];
  id v9 = v28;
  id v10 = v27;
  id v11 = v26;

  if (!v4) {
    goto LABEL_7;
  }
  long long v48 = WADeviceAnalyticsNetworkTransitionInfo;
  v50[0] = v9;
  v50[1] = v10;
  long long v49 = @"authFlags";
  v50[2] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v50 forKeys:&v48 count:3];
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  uint64_t v15 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    int v19 = *(_DWORD *)(a1 + 64);
    int v18 = *(_DWORD *)(a1 + 68);
    *(_DWORD *)buf = 136448258;
    __int16 v31 = "-[AnalyticsReader copyColocatedScopeTransitionInfo:bssid:minRssi:maxRssi:band:]_block_invoke";
    __int16 v32 = 1024;
    int v33 = 692;
    __int16 v34 = 2112;
    id v35 = v9;
    __int16 v36 = 2112;
    id v37 = v10;
    __int16 v38 = 1024;
    int v39 = v29;
    __int16 v40 = 2112;
    uint64_t v41 = v16;
    __int16 v42 = 2112;
    uint64_t v43 = v17;
    __int16 v44 = 1024;
    int v45 = v18;
    __int16 v46 = 1024;
    int v47 = v19;
    _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Results contains %@[%@ (%d)] for %@[%@] in [%d,%d)", buf, 0x4Cu);
  }
LABEL_6:

LABEL_7:
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v20 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      id v21 = *(void **)(a1 + 32);
      id v22 = *(void **)(a1 + 40);
      int v24 = *(_DWORD *)(a1 + 64);
      int v23 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 136447490;
      __int16 v31 = "-[AnalyticsReader copyColocatedScopeTransitionInfo:bssid:minRssi:maxRssi:band:]_block_invoke";
      __int16 v32 = 1024;
      int v33 = 697;
      __int16 v34 = 2112;
      id v35 = v21;
      __int16 v36 = 2112;
      id v37 = v22;
      __int16 v38 = 1024;
      int v39 = v23;
      __int16 v40 = 1024;
      LODWORD(v41) = v24;
      _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Nothing to transition away from %@[%@] in [%d,%d)", buf, 0x32u);
    }
  }
}

- (id)copyNetworkUsageDictionary:(id)a3
{
  return [(AnalyticsReader *)self _copyNetworkUsageDictionaryWithMOC:a3 moc:0];
}

- (id)_copyNetworkUsageDictionaryWithMOC:(id)a3 moc:(id)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__6;
  id v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  id v7 = a4;
  id v8 = v7;
  if (!v7)
  {
    id v8 = [(AnalyticsReader *)self backgroundReadingMOC];
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__AnalyticsReader__copyNetworkUsageDictionaryWithMOC_moc___block_invoke;
  v13[3] = &unk_264466070;
  id v9 = v6;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  uint64_t v16 = &v17;
  [v10 performBlockAndWait:v13];
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __58__AnalyticsReader__copyNetworkUsageDictionaryWithMOC_moc___block_invoke(void *a1)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26CE65E18, &unk_26CE65E30, &unk_26CE65E48, 0);
  uint64_t v3 = a1[4];
  if (!v3)
  {
    uint64_t v30 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136446466;
    long long v49 = "-[AnalyticsReader _copyNetworkUsageDictionaryWithMOC:moc:]_block_invoke";
    __int16 v50 = 1024;
    int v51 = 725;
    __int16 v36 = "%{public}s::%d:ssid nil";
    id v37 = v30;
    uint32_t v38 = 18;
    goto LABEL_27;
  }
  uint64_t v4 = +[NetworkMO getInstance:v3 moc:a1[5]];
  if (v4)
  {
    __int16 v40 = v4;
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v6 = *(void *)(a1[6] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v41 = v2;
    id obj = v2;
    uint64_t v8 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (!v8) {
      goto LABEL_17;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v44;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = [*(id *)(*((void *)&v43 + 1) + 8 * i) unsignedIntegerValue];
        uint64_t v13 = (void *)MEMORY[0x223C0F2E0]();
        unint64_t v14 = +[JoinMO joinCount:a1[4] bssid:0 maxAgeInDays:v12 success:1 moc:a1[5]];
        unint64_t v15 = +[JoinMO joinCount:a1[4] bssid:0 maxAgeInDays:v12 success:0 moc:a1[5]];
        switch(v12)
        {
          case 30:
            id v26 = *(void **)(*(void *)(a1[6] + 8) + 40);
            id v27 = [NSNumber numberWithInteger:v14];
            [v26 setValue:v27 forKey:@"joinSuccessCountInLastMonth"];

            id v28 = *(void **)(*(void *)(a1[6] + 8) + 40);
            uint64_t v19 = [NSNumber numberWithInteger:v15];
            uint64_t v20 = v28;
            id v21 = v19;
            id v22 = @"joinFailCountInLastMonth";
            break;
          case 7:
            int v23 = *(void **)(*(void *)(a1[6] + 8) + 40);
            int v24 = [NSNumber numberWithInteger:v14];
            [v23 setValue:v24 forKey:@"joinSuccessCountInLastWeek"];

            int v25 = *(void **)(*(void *)(a1[6] + 8) + 40);
            uint64_t v19 = [NSNumber numberWithInteger:v15];
            uint64_t v20 = v25;
            id v21 = v19;
            id v22 = @"joinFailCountInLastWeek";
            break;
          case 1:
            uint64_t v16 = *(void **)(*(void *)(a1[6] + 8) + 40);
            uint64_t v17 = [NSNumber numberWithInteger:v14];
            [v16 setValue:v17 forKey:@"joinSuccessCountInLastDay"];

            int v18 = *(void **)(*(void *)(a1[6] + 8) + 40);
            uint64_t v19 = [NSNumber numberWithInteger:v15];
            uint64_t v20 = v18;
            id v21 = v19;
            id v22 = @"joinFailCountInLastDay";
            break;
          default:
            goto LABEL_15;
        }
        [v20 setValue:v21 forKey:v22];

LABEL_15:
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (!v9)
      {
LABEL_17:

        int v29 = *(void **)(*(void *)(a1[6] + 8) + 40);
        uint64_t v30 = v40;
        __int16 v31 = [v40 ssid];
        [v29 setValue:v31 forKey:@"ssid"];

        __int16 v32 = *(void **)(*(void *)(a1[6] + 8) + 40);
        int v33 = objc_msgSend(NSNumber, "numberWithInt:", -[NSObject authFlags](v40, "authFlags"));
        [v32 setValue:v33 forKey:@"authFlags"];

        uint64_t v2 = v41;
        goto LABEL_18;
      }
    }
  }
  uint64_t v30 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    uint64_t v39 = a1[4];
    *(_DWORD *)buf = 136446722;
    long long v49 = "-[AnalyticsReader _copyNetworkUsageDictionaryWithMOC:moc:]_block_invoke";
    __int16 v50 = 1024;
    int v51 = 728;
    __int16 v52 = 2112;
    uint64_t v53 = v39;
    __int16 v36 = "%{public}s::%d:networkMO nil for ssid %@";
    id v37 = v30;
    uint32_t v38 = 28;
LABEL_27:
    _os_log_impl(&dword_21D96D000, v37, OS_LOG_TYPE_ERROR, v36, buf, v38);
  }
LABEL_18:

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    __int16 v34 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = a1[4];
      *(_DWORD *)buf = 136446722;
      long long v49 = "-[AnalyticsReader _copyNetworkUsageDictionaryWithMOC:moc:]_block_invoke";
      __int16 v50 = 1024;
      int v51 = 829;
      __int16 v52 = 2112;
      uint64_t v53 = v35;
      _os_log_impl(&dword_21D96D000, v34, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:No usage info for %@", buf, 0x1Cu);
    }
  }
}

- (AnalyticsStoreMOHandler)managedObjectHandler
{
  return self->_managedObjectHandler;
}

- (void)setManagedObjectHandler:(id)a3
{
}

- (NSManagedObjectContext)backgroundReadingMOC
{
  return self->_backgroundReadingMOC;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundReadingMOC, 0);
  objc_storeStrong((id *)&self->_managedObjectHandler, 0);
}

@end