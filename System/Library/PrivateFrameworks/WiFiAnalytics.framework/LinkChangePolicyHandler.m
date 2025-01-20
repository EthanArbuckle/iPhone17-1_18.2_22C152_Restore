@interface LinkChangePolicyHandler
- (AnalyticsStoreMOHandler)storeMOHandler;
- (BOOL)checkIpConfigChangeAndInvalidateScope:(id)a3 bssid:(id)a4 ipAddr:(int)a5 routerIp:(int)a6 routerMAC:(id)a7;
- (LinkChangePolicyHandler)initWithAnalyticsStore:(id)a3;
- (void)checkAndApplyColocatedNetworkScope:(id)a3 bssid:(id)a4 ipAddr:(int)a5 routerIp:(int)a6 routerMAC:(id)a7;
- (void)pruneNetworksFailingBssidPatternAndIpConfigChangeChecks:(id)a3 ipAddr:(int)a4 routerIp:(int)a5 routerMAC:(id)a6;
- (void)pruneNetworksNotInRangeOf:(id)a3 networks:(id)a4;
- (void)pruneNetworksWithMoreThanOneBssidFromSet:(id)a3;
- (void)setLinkChange:(BOOL)a3 ssid:(id)a4 bssid:(id)a5 reason:(unint64_t)a6 subReason:(unint64_t)a7 rssi:(int64_t)a8;
- (void)setStoreMOHandler:(id)a3;
@end

@implementation LinkChangePolicyHandler

- (LinkChangePolicyHandler)initWithAnalyticsStore:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LinkChangePolicyHandler;
  v6 = [(LinkChangePolicyHandler *)&v11 init];
  v7 = v6;
  if (!v6)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v6->_storeMOHandler, a3);
  if (!v7->_storeMOHandler)
  {
    v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v13 = "-[LinkChangePolicyHandler initWithAnalyticsStore:]";
      __int16 v14 = 1024;
      int v15 = 46;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error getting _roamPolicyMOHandler", buf, 0x12u);
    }

    goto LABEL_7;
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (void)setLinkChange:(BOOL)a3 ssid:(id)a4 bssid:(id)a5 reason:(unint64_t)a6 subReason:(unint64_t)a7 rssi:(int64_t)a8
{
  v54[3] = *MEMORY[0x263EF8340];
  id v14 = a5;
  id v15 = a4;
  uint64_t v16 = [(LinkChangePolicyHandler *)self storeMOHandler];
  v17 = [v16 managedObjectContext];
  v18 = +[BSSMO getInstance:v14 ssid:v15 moc:v17];

  if (!v18)
  {
    v30 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 136446466;
    v36 = "-[LinkChangePolicyHandler setLinkChange:ssid:bssid:reason:subReason:rssi:]";
    __int16 v37 = 1024;
    int v38 = 59;
    v31 = "%{public}s::%d:Error getting bssMo";
    v32 = v30;
    os_log_type_t v33 = OS_LOG_TYPE_ERROR;
    uint32_t v34 = 18;
    goto LABEL_36;
  }
  if (!a3)
  {
    if ((uint64_t)a6 > 999)
    {
      if (a6 == 1000)
      {
        if ([v18 disTrgDisCount] == 0x7FFF)
        {
          v28 = v18;
          uint64_t v29 = 5;
        }
        else
        {
          uint64_t v29 = (__int16)([v18 disTrgDisCount] + 1);
          v28 = v18;
        }
        [v28 setDisTrgDisCount:v29];
        goto LABEL_29;
      }
      if (a6 != 1011) {
        goto LABEL_29;
      }
    }
    else
    {
      if (a6 == 2)
      {
        if ([v18 disBcnLossCount] == 0x7FFF)
        {
          v26 = v18;
          uint64_t v27 = 5;
        }
        else
        {
          uint64_t v27 = (__int16)([v18 disBcnLossCount] + 1);
          v26 = v18;
        }
        [v26 setDisBcnLossCount:v27];
        goto LABEL_29;
      }
      if (a6 != 5)
      {
LABEL_29:
        if ((int)[v18 disBcnLossCount] > 4
          || (int)[v18 disTrgDisCount] > 4
          || (int)[v18 disUsrForcedInWeakRssiCount] >= 1)
        {
          [v18 setIsEdgeForLeave:1];
        }
        goto LABEL_33;
      }
    }
    if (a8 <= -75)
    {
      if ([v18 disUsrForcedInWeakRssiCount] == 0x7FFF) {
        LOWORD(v25) = 5;
      }
      else {
        int v25 = [v18 disUsrForcedInWeakRssiCount] + 1;
      }
      [v18 setDisUsrForcedInWeakRssiCount:(__int16)v25];
      if ((int)[v18 disUsrForcedInWeakRssiCount] >= 1) {
        [v18 setAutoLeaveRssi:(__int16)a8];
      }
    }
    goto LABEL_29;
  }
  if (a6 == 1 && (a7 == 0x80000 || a7 == 0x40000))
  {
    if ([v18 autoLeaveRssi])
    {
      v53[0] = @"autoLeaveRssi";
      v19 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v18, "autoLeaveRssi"));
      v54[0] = v19;
      v53[1] = @"reason";
      int v20 = 1;
      v21 = [NSNumber numberWithUnsignedInteger:1];
      v54[1] = v21;
      v53[2] = @"subReason";
      v22 = [NSNumber numberWithUnsignedInteger:a7];
      v54[2] = v22;
      v23 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:3];

      id v24 = v23;
      AnalyticsSendEventLazy();

      [v18 setManualJoinAfterAutoLeave:1];
      [v18 setAutoLeaveRssi:0];
      [v18 setIsEdgeForLeave:0];
      goto LABEL_34;
    }
    [v18 setManualJoinAfterAutoLeave:0];
  }
LABEL_33:
  int v20 = 0;
LABEL_34:
  v30 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136448258;
    v36 = "-[LinkChangePolicyHandler setLinkChange:ssid:bssid:reason:subReason:rssi:]";
    __int16 v37 = 1024;
    int v38 = 130;
    __int16 v39 = 1024;
    int v40 = [v18 disBcnLossCount];
    __int16 v41 = 1024;
    int v42 = [v18 disTrgDisCount];
    __int16 v43 = 1024;
    int v44 = [v18 disUsrForcedInWeakRssiCount];
    __int16 v45 = 1024;
    int v46 = [v18 autoLeaveRssi];
    __int16 v47 = 1024;
    int v48 = [v18 isEdgeForLeave];
    __int16 v49 = 1024;
    int v50 = [v18 manualJoinAfterAutoLeave];
    __int16 v51 = 1024;
    int v52 = v20;
    v31 = "%{public}s::%d:disBcnLossCount:%d disTrgDisCount:%d disUsrForcedInWeakRssiCount:%d autoLeaveRssi:%d isEdgeForL"
          "eave:%d, manualJoinAfterAutoLeave:%d (cleared:%d)";
    v32 = v30;
    os_log_type_t v33 = OS_LOG_TYPE_DEBUG;
    uint32_t v34 = 60;
LABEL_36:
    _os_log_impl(&dword_21D96D000, v32, v33, v31, buf, v34);
  }
LABEL_37:
}

id __74__LinkChangePolicyHandler_setLinkChange_ssid_bssid_reason_subReason_rssi___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)checkIpConfigChangeAndInvalidateScope:(id)a3 bssid:(id)a4 ipAddr:(int)a5 routerIp:(int)a6 routerMAC:(id)a7
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v60 = a7;
  v12 = [(LinkChangePolicyHandler *)self storeMOHandler];
  v13 = [v12 managedObjectContext];
  id v14 = +[JoinMO mostRecentJoinsWithBatchSize:10 bssid:v11 ssid:v10 moc:v13];

  if (!v14)
  {
    id v15 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 136446466;
    v66 = "-[LinkChangePolicyHandler checkIpConfigChangeAndInvalidateScope:bssid:ipAddr:routerIp:routerMAC:]";
    __int16 v67 = 1024;
    int v68 = 159;
    int v50 = "%{public}s::%d:joinMos nil";
    __int16 v51 = v15;
    uint32_t v52 = 18;
LABEL_45:
    _os_log_impl(&dword_21D96D000, v51, OS_LOG_TYPE_ERROR, v50, buf, v52);
    goto LABEL_46;
  }
  if ((unint64_t)[v14 count] <= 9)
  {
    id v15 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 136446722;
    v66 = "-[LinkChangePolicyHandler checkIpConfigChangeAndInvalidateScope:bssid:ipAddr:routerIp:routerMAC:]";
    __int16 v67 = 1024;
    int v68 = 160;
    __int16 v69 = 2048;
    uint64_t v70 = [v14 count];
    int v50 = "%{public}s::%d:Insufficient joins: %lu. Bailing";
    __int16 v51 = v15;
    uint32_t v52 = 28;
    goto LABEL_45;
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v61 objects:v87 count:16];
  if (!v16)
  {
LABEL_46:
    BOOL v26 = 0;
    goto LABEL_47;
  }
  uint64_t v17 = v16;
  v54 = self;
  id v55 = v11;
  id v56 = v10;
  uint64_t v18 = *(void *)v62;
  uint64_t v19 = 10;
LABEL_5:
  uint64_t v20 = 0;
  while (1)
  {
    if (*(void *)v62 != v18) {
      objc_enumerationMutation(v15);
    }
    if (!v19) {
      goto LABEL_21;
    }
    v21 = *(void **)(*((void *)&v61 + 1) + 8 * v20);
    v22 = [v21 routerMAC];
    if (!v22 || ![v21 ipv4Addr])
    {

      goto LABEL_19;
    }
    int v23 = [v21 ipv4routerAddr];

    if (!v23
      || (unsigned __int16)[v21 ipv4Addr] == 65193
      || (unsigned __int16)[v21 ipv4routerAddr] == 65193)
    {
      goto LABEL_19;
    }
    id v24 = [v21 routerMAC];
    int v25 = [v60 isEqualToString:v24];

    if (!v25
      || (([v21 ipv4Addr] ^ a5) & 0xFFFFFF) != 0
      || (([v21 ipv4routerAddr] ^ a6) & 0xFFFFFF) != 0)
    {
      break;
    }
    --v19;
LABEL_19:
    if (v17 == ++v20)
    {
      uint64_t v17 = [v15 countByEnumeratingWithState:&v61 objects:v87 count:16];
      if (v17) {
        goto LABEL_5;
      }
LABEL_21:
      BOOL v26 = 0;
      goto LABEL_22;
    }
  }
  uint64_t v27 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v28 = [v21 routerMAC];
    int v29 = [v21 ipv4Addr];
    int v30 = [v21 ipv4routerAddr];
    *(_DWORD *)buf = 136448770;
    v66 = "-[LinkChangePolicyHandler checkIpConfigChangeAndInvalidateScope:bssid:ipAddr:routerIp:routerMAC:]";
    __int16 v67 = 1024;
    int v68 = 182;
    __int16 v69 = 2048;
    uint64_t v70 = v19;
    __int16 v71 = 2112;
    id v72 = v56;
    __int16 v73 = 2112;
    v74 = v55;
    __int16 v75 = 2112;
    id v76 = v60;
    __int16 v77 = 2112;
    v78 = v28;
    __int16 v79 = 1024;
    int v80 = a5;
    __int16 v81 = 1024;
    int v82 = v29;
    __int16 v83 = 1024;
    int v84 = a6;
    __int16 v85 = 1024;
    int v86 = v30;
    _os_log_impl(&dword_21D96D000, v27, OS_LOG_TYPE_DEBUG, "%{public}s::%d:At idx:%lu for %@[%@] RouterMAC:%@ existing:%@ IPv4 Addr:0x%x existing:0x%x RouterIP:0x%x existing:0x%x", buf, 0x5Cu);
  }
  v31 = [(LinkChangePolicyHandler *)v54 storeMOHandler];
  v32 = [v31 managedObjectContext];
  id v15 = +[NetworkMO getInstance:v56 moc:v32];

  if (v15)
  {
    os_log_type_t v33 = [v15 colocatedScopeId];
    uint64_t v34 = [v33 UUIDString];
    v35 = (void *)v34;
    if (v33 && v34)
    {
      v36 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136447234;
        v66 = "-[LinkChangePolicyHandler checkIpConfigChangeAndInvalidateScope:bssid:ipAddr:routerIp:routerMAC:]";
        __int16 v67 = 1024;
        int v68 = 199;
        __int16 v69 = 2112;
        uint64_t v70 = (uint64_t)v56;
        __int16 v71 = 2112;
        id v72 = v55;
        __int16 v73 = 2112;
        v74 = v35;
        _os_log_impl(&dword_21D96D000, v36, OS_LOG_TYPE_INFO, "%{public}s::%d:IP Configuration changed for %@[%@]. Will invalidate colocatedScopeId %@", buf, 0x30u);
      }

      uint64_t v37 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v35];
      int v38 = [(LinkChangePolicyHandler *)v54 storeMOHandler];
      __int16 v39 = [v38 managedObjectContext];
      v59 = (void *)v37;
      id v40 = +[NetworkMO copyAllSsidsWithColocatedScopeId:v37 moc:v39];

      if ([v40 count])
      {
        __int16 v41 = [(LinkChangePolicyHandler *)v54 storeMOHandler];
        int v42 = [v41 managedObjectContext];
        BOOL v43 = +[NetworkMO invalidateColocatedScopeForSsidArray:v40 moc:v42];

        int v44 = WALogCategoryDeviceStoreHandle();
        __int16 v45 = v44;
        if (v43)
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136446978;
            v66 = "-[LinkChangePolicyHandler checkIpConfigChangeAndInvalidateScope:bssid:ipAddr:routerIp:routerMAC:]";
            __int16 v67 = 1024;
            int v68 = 208;
            __int16 v69 = 2112;
            uint64_t v70 = (uint64_t)v35;
            __int16 v71 = 2112;
            id v72 = v40;
            int v46 = "%{public}s::%d:invalidated colocatedScopeId %@ for %@";
            __int16 v47 = v45;
            os_log_type_t v48 = OS_LOG_TYPE_INFO;
            uint32_t v49 = 38;
            goto LABEL_36;
          }
        }
        else if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v66 = "-[LinkChangePolicyHandler checkIpConfigChangeAndInvalidateScope:bssid:ipAddr:routerIp:routerMAC:]";
          __int16 v67 = 1024;
          int v68 = 206;
          __int16 v69 = 2112;
          uint64_t v70 = (uint64_t)v35;
          int v46 = "%{public}s::%d:Failed to invalidate %@";
          __int16 v47 = v45;
          os_log_type_t v48 = OS_LOG_TYPE_ERROR;
          uint32_t v49 = 28;
LABEL_36:
          _os_log_impl(&dword_21D96D000, v47, v48, v46, buf, v49);
        }
      }
    }
  }
  else
  {
    os_log_type_t v33 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v66 = "-[LinkChangePolicyHandler checkIpConfigChangeAndInvalidateScope:bssid:ipAddr:routerIp:routerMAC:]";
      __int16 v67 = 1024;
      int v68 = 194;
      __int16 v69 = 2112;
      uint64_t v70 = (uint64_t)v56;
      _os_log_impl(&dword_21D96D000, v33, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", buf, 0x1Cu);
    }
  }

  BOOL v26 = 1;
LABEL_22:
  id v11 = v55;
  id v10 = v56;
LABEL_47:

  return v26;
}

- (void)checkAndApplyColocatedNetworkScope:(id)a3 bssid:(id)a4 ipAddr:(int)a5 routerIp:(int)a6 routerMAC:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a7;
  v13 = [MEMORY[0x263EFF9C0] set];
  id v14 = [(LinkChangePolicyHandler *)self storeMOHandler];
  id v15 = [v14 managedObjectContext];
  uint64_t v16 = +[JoinMO ssidsWithRouterMAC:v12 moc:v15];

  if (!v16 || ![v16 count])
  {
    id v24 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v28 = 136446722;
      int v29 = "-[LinkChangePolicyHandler checkAndApplyColocatedNetworkScope:bssid:ipAddr:routerIp:routerMAC:]";
      __int16 v30 = 1024;
      int v31 = 225;
      __int16 v32 = 2112;
      id v33 = v12;
      int v25 = "%{public}s::%d:No ssids using routerMAC:%@";
LABEL_18:
      BOOL v26 = v24;
      uint32_t v27 = 28;
      goto LABEL_19;
    }
LABEL_20:

    goto LABEL_8;
  }
  [v13 addObjectsFromArray:v16];
  uint64_t v17 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = [v13 allObjects];
    uint64_t v19 = [v18 componentsJoinedByString:@", "];
    int v28 = 136446722;
    int v29 = "-[LinkChangePolicyHandler checkAndApplyColocatedNetworkScope:bssid:ipAddr:routerIp:routerMAC:]";
    __int16 v30 = 1024;
    int v31 = 230;
    __int16 v32 = 2112;
    id v33 = v19;
    _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:Matching SSIDs with routerMAC:%@", (uint8_t *)&v28, 0x1Cu);
  }
  [v13 addObject:v11];
  if ((unint64_t)[v13 count] <= 1)
  {
    id v24 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    int v28 = 136446466;
    int v29 = "-[LinkChangePolicyHandler checkAndApplyColocatedNetworkScope:bssid:ipAddr:routerIp:routerMAC:]";
    __int16 v30 = 1024;
    int v31 = 235;
    int v25 = "%{public}s::%d:Not enough matching ssids before prune checks";
LABEL_15:
    BOOL v26 = v24;
    uint32_t v27 = 18;
LABEL_19:
    _os_log_impl(&dword_21D96D000, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v28, v27);
    goto LABEL_20;
  }
  [(LinkChangePolicyHandler *)self pruneNetworksNotInRangeOf:v11 networks:v13];
  [(LinkChangePolicyHandler *)self pruneNetworksWithMoreThanOneBssidFromSet:v13];
  [(LinkChangePolicyHandler *)self pruneNetworksFailingBssidPatternAndIpConfigChangeChecks:v13 ipAddr:v9 routerIp:v8 routerMAC:v12];
  if ((unint64_t)[v13 count] <= 1)
  {
    id v24 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    int v28 = 136446466;
    int v29 = "-[LinkChangePolicyHandler checkAndApplyColocatedNetworkScope:bssid:ipAddr:routerIp:routerMAC:]";
    __int16 v30 = 1024;
    int v31 = 243;
    int v25 = "%{public}s::%d:Not enough matching ssids after prune checks";
    goto LABEL_15;
  }
  uint64_t v20 = [v13 allObjects];
  v21 = [(LinkChangePolicyHandler *)self storeMOHandler];
  v22 = [v21 managedObjectContext];
  BOOL v23 = +[NetworkMO coalesceSsidsIntoColocatedScope:v20 moc:v22];

  if (!v23)
  {
    id v24 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v28 = 136446722;
      int v29 = "-[LinkChangePolicyHandler checkAndApplyColocatedNetworkScope:bssid:ipAddr:routerIp:routerMAC:]";
      __int16 v30 = 1024;
      int v31 = 246;
      __int16 v32 = 2112;
      id v33 = v13;
      int v25 = "%{public}s::%d:Failed to coalesce ssids into colocatedScope: %@";
      goto LABEL_18;
    }
    goto LABEL_20;
  }
LABEL_8:
}

- (void)pruneNetworksNotInRangeOf:(id)a3 networks:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF9C0] set];
  uint64_t v9 = [(LinkChangePolicyHandler *)self storeMOHandler];
  id v10 = [v9 managedObjectContext];
  id v11 = +[GeoTagMO geoTagsForNetwork:v6 moc:v10];

  if (v11)
  {
    if ([v11 count] != 1)
    {
      uint64_t v17 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        __int16 v45 = "-[LinkChangePolicyHandler pruneNetworksNotInRangeOf:networks:]";
        __int16 v46 = 1024;
        int v47 = 261;
        __int16 v48 = 2112;
        id v49 = v6;
        __int16 v50 = 2048;
        uint64_t v51 = [v11 count];
        uint64_t v18 = "%{public}s::%d:More than one geoTag for network:%@ count: %lu";
        uint64_t v19 = v17;
        uint32_t v20 = 38;
        goto LABEL_25;
      }
      goto LABEL_20;
    }
    memset(v41, 0, sizeof(v41));
    if ([v11 countByEnumeratingWithState:v41 objects:v43 count:16])
    {
      id v12 = (void *)**((void **)&v41[0] + 1);
      id v13 = objc_alloc(MEMORY[0x263F00A58]);
      [v12 latitude];
      double v15 = v14;
      [v12 longitude];
      uint64_t v17 = [v13 initWithLatitude:v15 longitude:v16];
      if (!v17)
      {
        uint64_t v17 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          __int16 v45 = "-[LinkChangePolicyHandler pruneNetworksNotInRangeOf:networks:]";
          __int16 v46 = 1024;
          int v47 = 265;
          uint64_t v18 = "%{public}s::%d:location nil";
          uint64_t v19 = v17;
          uint32_t v20 = 18;
LABEL_25:
          _os_log_impl(&dword_21D96D000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
          goto LABEL_20;
        }
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
    id v33 = v11;
    id v34 = v7;
    v21 = v8;
    id v35 = v6;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = v7;
    uint64_t v22 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v38 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          uint32_t v27 = [(LinkChangePolicyHandler *)self storeMOHandler];
          int v28 = [v27 managedObjectContext];
          BOOL v29 = +[GeoTagMO isNetworkWithinRangeOfLocation:v26 range:v17 location:v28 moc:0 count:300.0];

          if (!v29) {
            [v21 addObject:v26];
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v23);
    }

    __int16 v30 = WALogCategoryDeviceStoreHandle();
    uint64_t v8 = v21;
    id v11 = v33;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      int v31 = [v21 allObjects];
      __int16 v32 = [v31 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 136446722;
      __int16 v45 = "-[LinkChangePolicyHandler pruneNetworksNotInRangeOf:networks:]";
      __int16 v46 = 1024;
      int v47 = 278;
      __int16 v48 = 2112;
      id v49 = v32;
      _os_log_impl(&dword_21D96D000, v30, OS_LOG_TYPE_INFO, "%{public}s::%d:Pruning ssids: %@", buf, 0x1Cu);
    }
    [obj minusSet:v21];
    id v7 = v34;
    id v6 = v35;
    goto LABEL_20;
  }
  uint64_t v17 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v45 = "-[LinkChangePolicyHandler pruneNetworksNotInRangeOf:networks:]";
    __int16 v46 = 1024;
    int v47 = 260;
    __int16 v48 = 2112;
    id v49 = v6;
    uint64_t v18 = "%{public}s::%d:Error getting geoTags for network:%@";
    uint64_t v19 = v17;
    uint32_t v20 = 28;
    goto LABEL_25;
  }
LABEL_20:
}

- (void)pruneNetworksWithMoreThanOneBssidFromSet:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v23 = [MEMORY[0x263EFF9C0] set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
        if (v10)
        {
          id v11 = [(LinkChangePolicyHandler *)self storeMOHandler];
          id v12 = [v11 managedObjectContext];
          id v13 = +[NetworkMO getInstance:v10 moc:v12];

          if (v13)
          {
            if ([v13 numBSS] == 1)
            {
LABEL_9:

              goto LABEL_10;
            }
            double v14 = WALogCategoryDeviceStoreHandle();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              uint64_t v18 = [v13 numBSS];
              *(_DWORD *)buf = 136446978;
              BOOL v29 = "-[LinkChangePolicyHandler pruneNetworksWithMoreThanOneBssidFromSet:]";
              __int16 v30 = 1024;
              int v31 = 295;
              __int16 v32 = 2112;
              id v33 = v10;
              __int16 v34 = 2048;
              uint64_t v35 = v18;
              double v15 = v14;
              double v16 = "%{public}s::%d:%@ has %lld bssids";
              uint32_t v17 = 38;
LABEL_16:
              _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_ERROR, v16, buf, v17);
            }
          }
          else
          {
            double v14 = WALogCategoryDeviceStoreHandle();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              BOOL v29 = "-[LinkChangePolicyHandler pruneNetworksWithMoreThanOneBssidFromSet:]";
              __int16 v30 = 1024;
              int v31 = 294;
              __int16 v32 = 2112;
              id v33 = v10;
              double v15 = v14;
              double v16 = "%{public}s::%d:networkMO nil for ssid %@";
              uint32_t v17 = 28;
              goto LABEL_16;
            }
          }

          [v23 addObject:v10];
          goto LABEL_9;
        }
LABEL_10:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v19 = [v5 countByEnumeratingWithState:&v24 objects:v36 count:16];
      uint64_t v7 = v19;
    }
    while (v19);
  }

  uint32_t v20 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = [v23 allObjects];
    uint64_t v22 = [v21 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 136446722;
    BOOL v29 = "-[LinkChangePolicyHandler pruneNetworksWithMoreThanOneBssidFromSet:]";
    __int16 v30 = 1024;
    int v31 = 306;
    __int16 v32 = 2112;
    id v33 = v22;
    _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_INFO, "%{public}s::%d:Pruning ssids: %@", buf, 0x1Cu);
  }
  [v5 minusSet:v23];
}

- (void)pruneNetworksFailingBssidPatternAndIpConfigChangeChecks:(id)a3 ipAddr:(int)a4 routerIp:(int)a5 routerMAC:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v71 = a6;
  long long v63 = [MEMORY[0x263EFF9C0] set];
  uint64_t v70 = [MEMORY[0x263EFF9C0] set];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v84 objects:v99 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v85 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v84 + 1) + 8 * i);
        double v16 = [(LinkChangePolicyHandler *)self storeMOHandler];
        uint32_t v17 = [v16 managedObjectContext];
        uint64_t v18 = +[BSSMO allBssidsForSsid:v15 moc:v17];

        if (v18) {
          [v63 addObjectsFromArray:v18];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v84 objects:v99 count:16];
    }
    while (v12);
  }

  uint64_t v19 = [v63 allObjects];
  uint32_t v20 = [v19 firstObject];
  v21 = (void *)[v20 copy];

  uint64_t v22 = [v63 count];
  uint64_t v23 = 0;
  v59 = v21;
  if (v22 && v21)
  {
    if (+[WAUtil isMacAddress:v21])
    {
      long long v64 = objc_msgSend(v21, "substringToIndex:", objc_msgSend(v21, "length") - 1);
      uint64_t v24 = [v64 stringByAppendingString:@"?"];
      v58 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF LIKE[cd] %@", v24];
      uint64_t v25 = objc_msgSend(v63, "filteredSetUsingPredicate:");
      long long v26 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        long long v27 = [v63 allObjects];
        int v28 = [v27 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 136446722;
        v92 = "-[LinkChangePolicyHandler pruneNetworksFailingBssidPatternAndIpConfigChangeChecks:ipAddr:routerIp:routerMAC:]";
        __int16 v93 = 1024;
        int v94 = 335;
        __int16 v95 = 2112;
        uint64_t v96 = (uint64_t)v28;
        _os_log_impl(&dword_21D96D000, v26, OS_LOG_TYPE_INFO, "%{public}s::%d:All bssids: %@", buf, 0x1Cu);
      }
      v66 = (void *)v25;
      [v63 minusSet:v25];
      BOOL v29 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        __int16 v30 = [v63 allObjects];
        int v31 = [v30 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 136446978;
        v92 = "-[LinkChangePolicyHandler pruneNetworksFailingBssidPatternAndIpConfigChangeChecks:ipAddr:routerIp:routerMAC:]";
        __int16 v93 = 1024;
        int v94 = 338;
        __int16 v95 = 2112;
        uint64_t v96 = v24;
        __int16 v97 = 2112;
        v98 = v31;
        _os_log_impl(&dword_21D96D000, v29, OS_LOG_TYPE_INFO, "%{public}s::%d:seachStr: %@, unqualifiedBssids: %@", buf, 0x26u);
      }
      id v60 = (id)v24;

      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v32 = v63;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v80 objects:v90 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v69 = *(void *)v81;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v81 != v69) {
              objc_enumerationMutation(v32);
            }
            uint64_t v36 = *(void *)(*((void *)&v80 + 1) + 8 * j);
            uint64_t v37 = [(LinkChangePolicyHandler *)self storeMOHandler];
            long long v38 = [v37 managedObjectContext];
            long long v39 = +[BSSMO allSsidsForBssid:v36 moc:v38];

            long long v40 = WALogCategoryDeviceStoreHandle();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              __int16 v41 = [v70 allObjects];
              int v42 = [v41 componentsJoinedByString:@", "];
              *(_DWORD *)buf = 136446722;
              v92 = "-[LinkChangePolicyHandler pruneNetworksFailingBssidPatternAndIpConfigChangeChecks:ipAddr:routerIp:routerMAC:]";
              __int16 v93 = 1024;
              int v94 = 343;
              __int16 v95 = 2112;
              uint64_t v96 = (uint64_t)v42;
              _os_log_impl(&dword_21D96D000, v40, OS_LOG_TYPE_INFO, "%{public}s::%d:Will prune ssids with unqualified bssids: %@", buf, 0x1Cu);
            }
            [v70 addObjectsFromArray:v39];
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v80 objects:v90 count:16];
        }
        while (v34);
      }

      uint64_t v23 = v66;
    }
    else
    {
      uint64_t v23 = 0;
    }
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v61 = v23;
  uint64_t v67 = [v61 countByEnumeratingWithState:&v76 objects:v89 count:16];
  if (v67)
  {
    uint64_t v65 = *(void *)v77;
    do
    {
      uint64_t v43 = 0;
      do
      {
        if (*(void *)v77 != v65) {
          objc_enumerationMutation(v61);
        }
        uint64_t v68 = v43;
        int v44 = *(void **)(*((void *)&v76 + 1) + 8 * v43);
        __int16 v45 = [(LinkChangePolicyHandler *)self storeMOHandler];
        __int16 v46 = [v45 managedObjectContext];
        int v47 = +[BSSMO allSsidsForBssid:v44 moc:v46];

        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v48 = v47;
        uint64_t v49 = [v48 countByEnumeratingWithState:&v72 objects:v88 count:16];
        if (v49)
        {
          uint64_t v50 = v49;
          uint64_t v51 = *(void *)v73;
          do
          {
            for (uint64_t k = 0; k != v50; ++k)
            {
              if (*(void *)v73 != v51) {
                objc_enumerationMutation(v48);
              }
              v53 = *(void **)(*((void *)&v72 + 1) + 8 * k);
              if ([(LinkChangePolicyHandler *)self checkIpConfigChangeAndInvalidateScope:v53 bssid:v44 ipAddr:v8 routerIp:v7 routerMAC:v71])
              {
                v54 = WALogCategoryDeviceStoreHandle();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136446978;
                  v92 = "-[LinkChangePolicyHandler pruneNetworksFailingBssidPatternAndIpConfigChangeChecks:ipAddr:routerIp:routerMAC:]";
                  __int16 v93 = 1024;
                  int v94 = 355;
                  __int16 v95 = 2112;
                  uint64_t v96 = (uint64_t)v53;
                  __int16 v97 = 2112;
                  v98 = v44;
                  _os_log_impl(&dword_21D96D000, v54, OS_LOG_TYPE_INFO, "%{public}s::%d:checkIpConfigChange failed for ssid:%@[%@]. Will prune", buf, 0x26u);
                }

                [v70 addObjectsFromArray:v48];
              }
            }
            uint64_t v50 = [v48 countByEnumeratingWithState:&v72 objects:v88 count:16];
          }
          while (v50);
        }

        uint64_t v43 = v68 + 1;
      }
      while (v68 + 1 != v67);
      uint64_t v67 = [v61 countByEnumeratingWithState:&v76 objects:v89 count:16];
    }
    while (v67);
  }

  id v55 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    id v56 = [v70 allObjects];
    v57 = [v56 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 136446722;
    v92 = "-[LinkChangePolicyHandler pruneNetworksFailingBssidPatternAndIpConfigChangeChecks:ipAddr:routerIp:routerMAC:]";
    __int16 v93 = 1024;
    int v94 = 361;
    __int16 v95 = 2112;
    uint64_t v96 = (uint64_t)v57;
    _os_log_impl(&dword_21D96D000, v55, OS_LOG_TYPE_INFO, "%{public}s::%d:Pruning ssids: %@", buf, 0x1Cu);
  }
  [obj minusSet:v70];
}

- (AnalyticsStoreMOHandler)storeMOHandler
{
  return self->_storeMOHandler;
}

- (void)setStoreMOHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end