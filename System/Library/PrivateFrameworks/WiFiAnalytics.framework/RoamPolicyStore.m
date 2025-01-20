@interface RoamPolicyStore
+ (id)bandFromChInfo:(id)a3;
+ (id)cleanChannelFlagsIn:(id)a3;
+ (id)convertChannelList:(id)a3 log:(BOOL)a4 For:(const char *)a5;
+ (id)extractChannelList:(id)a3 channelKeyPath:(id)a4 channelFlagsKeyPath:(id)a5 logFor:(const char *)a6;
+ (id)makeChanInfoFromChannel:(int64_t)a3 andFlags:(int64_t)a4;
+ (id)neighborChannelsAsArray:(id)a3 log:(BOOL)a4 For:(const char *)a5;
+ (id)rangeStringWithRssiLevel:(unint64_t)a3;
- (AnalyticsStoreMOHandler)roamPolicyMOHandler;
- (BOOL)buildRoamCacheInfoForNetwork:(id)a3 bssid:(id)a4 numRoamSamples:(unint64_t)a5;
- (BOOL)buildRoamPoliciesForNetwork:(id)a3 bssid:(id)a4 numRoamSamples:(unint64_t)a5 deploymentStatus:(BOOL)a6;
- (BOOL)checkForNewBSSAddition:(id)a3 bssid:(id)a4;
- (BOOL)doWeHaveEnoughSamplesToBuildChanList:(unint64_t)a3 numRoamSamples:(unint64_t)a4;
- (BOOL)doWeHaveEnoughSamplesToBuildRoamCache:(unint64_t)a3 numRoamSamples:(unint64_t)a4;
- (BOOL)doWeHaveEnoughSamplesToDeriveRSSITrigger:(unint64_t)a3 numRoamSamples:(unint64_t)a4;
- (BOOL)enabled;
- (BOOL)inRange:(int64_t)a3 high:(int64_t)a4 value:(int64_t)a5;
- (BOOL)isHomeEnvironment:(id)a3;
- (BOOL)isNetworkQualifiedForAdaptiveRoaming:(id)a3;
- (BOOL)isWorkEnvironment:(id)a3;
- (BOOL)monitorDeploymentChanges:(id)a3 ssid:(id)a4 roamStatus:(unint64_t)a5 originBssid:(id)a6 targetBssid:(id)a7;
- (RoamPolicyStore)initWithAnalyticsStore:(id)a3;
- (id)collectRoamCandidates:(id)a3 roamSamplesToCollect:(unint64_t)a4;
- (id)deriveRoamInfo:(id)a3 ssid:(id)a4 numRoamSamplesCollectedSoFar:(unint64_t)a5;
- (void)checkForFrequentRoams:(unint64_t)a3 date:(id)a4 motionState:(int64_t)a5;
- (void)deriveRoamDeltaFromRoamCacheInfo:(id)a3 neighborCount:(unint64_t)a4;
- (void)listOutBTMRoams:(unint64_t)a3;
- (void)listOutLazyRoamScanInfo:(id)a3 neighborCount:(unint64_t)a4 sourceRssi:(int64_t)a5;
- (void)listOutMostUsedRoamReasons:(unint64_t)a3 roamReason:(unint64_t)a4;
- (void)listOutMostUsedSourceRssi:(id)a3 neighborCount:(unint64_t)a4 sourceRssi:(int64_t)a5;
- (void)listOutReassocRoams:(id)a3 neighborCount:(unint64_t)a4 sourceRssi:(int64_t)a5;
- (void)listOutTimeSpentOnBss:(unint64_t)a3 timeSpentOnBss:(unint64_t)a4 motionState:(int64_t)a5;
- (void)locateTheNeighbor:(unint64_t)a3 cacheRssi:(int64_t)a4;
- (void)resetAdaptiveRoamingStateMachine:(id)a3 bssid:(id)a4;
- (void)setDeploymentFromRoamCacheInfo:(id)a3 neighborCount:(unint64_t)a4;
- (void)setDeploymentFromRoamInfo:(id)a3 neighborCount:(unint64_t)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setRoamPolicyMOHandler:(id)a3;
- (void)storeNeighborsInfoLearningsFromRoamCacheInfo:(id)a3 neighborCount:(unint64_t)a4;
- (void)storeNeighborsInfoLearningsFromRoamInfo:(id)a3 neighborCount:(unint64_t)a4;
- (void)updateNeighborChannelsFromRoamTargetsChannels:(id)a3 bssid:(id)a4 ssid:(id)a5;
- (void)updateNeighborChannelsInCoreDataWith:(id)a3 bssid:(id)a4 ssid:(id)a5;
@end

@implementation RoamPolicyStore

- (RoamPolicyStore)initWithAnalyticsStore:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RoamPolicyStore;
  v6 = [(RoamPolicyStore *)&v11 init];
  v7 = v6;
  if (!v6)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v6->_roamPolicyMOHandler, a3);
  if (!v7->_roamPolicyMOHandler)
  {
    v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v13 = "-[RoamPolicyStore initWithAnalyticsStore:]";
      __int16 v14 = 1024;
      int v15 = 97;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error getting _roamPolicyMOHandler", buf, 0x12u);
    }

    goto LABEL_7;
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (BOOL)isHomeEnvironment:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x223C0F2E0]();
  v6 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  v7 = [v6 managedObjectContext];
  v8 = +[NetworkMO getInstance:v4 moc:v7];

  if (!v8)
  {
    v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446722;
      v13 = "-[RoamPolicyStore isHomeEnvironment:]";
      __int16 v14 = 1024;
      int v15 = 112;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", (uint8_t *)&v12, 0x1Cu);
    }

    goto LABEL_7;
  }
  if (([v8 isHome] & 1) == 0)
  {
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)isWorkEnvironment:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x223C0F2E0]();
  v6 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  v7 = [v6 managedObjectContext];
  v8 = +[NetworkMO getInstance:v4 moc:v7];

  if (!v8)
  {
    v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446722;
      v13 = "-[RoamPolicyStore isWorkEnvironment:]";
      __int16 v14 = 1024;
      int v15 = 126;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", (uint8_t *)&v12, 0x1Cu);
    }

    goto LABEL_7;
  }
  if (([v8 isWork] & 1) == 0)
  {
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)isNetworkQualifiedForAdaptiveRoaming:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x223C0F2E0]();
  v6 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  v7 = [v6 managedObjectContext];
  v8 = +[NetworkMO getInstance:v4 moc:v7];

  if (!v8)
  {
    v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446722;
      v13 = "-[RoamPolicyStore isNetworkQualifiedForAdaptiveRoaming:]";
      __int16 v14 = 1024;
      int v15 = 139;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", (uint8_t *)&v12, 0x1Cu);
    }

    goto LABEL_8;
  }
  if ([v8 numBSS] < 3 || objc_msgSend(v8, "numBSS") >= 10)
  {
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_9;
  }
  BOOL v9 = 1;
LABEL_9:

  return v9;
}

- (BOOL)doWeHaveEnoughSamplesToBuildChanList:(unint64_t)a3 numRoamSamples:(unint64_t)a4
{
  unint64_t v4 = a4 >> 1;
  if (!a4) {
    unint64_t v4 = 50;
  }
  return v4 <= a3;
}

- (BOOL)doWeHaveEnoughSamplesToBuildRoamCache:(unint64_t)a3 numRoamSamples:(unint64_t)a4
{
  unint64_t v4 = 100;
  if (a4) {
    unint64_t v4 = a4;
  }
  return v4 <= a3;
}

- (BOOL)doWeHaveEnoughSamplesToDeriveRSSITrigger:(unint64_t)a3 numRoamSamples:(unint64_t)a4
{
  unint64_t v4 = 100;
  if (a4) {
    unint64_t v4 = a4;
  }
  return v4 <= a3;
}

- (BOOL)buildRoamPoliciesForNetwork:(id)a3 bssid:(id)a4 numRoamSamples:(unint64_t)a5 deploymentStatus:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  int v12 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies buildRoamPoliciesForNetwork", "", buf, 2u);
  }

  v13 = (void *)MEMORY[0x223C0F2E0]();
  if (+[WAUtil isWildcardMacAddress:v11])
  {
    v21 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v41 = "-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]";
      __int16 v42 = 1024;
      int v43 = 187;
      __int16 v44 = 2112;
      unint64_t v45 = (unint64_t)v11;
      _os_log_impl(&dword_21D96D000, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssid(%@) is the wildcard address!! bailing", buf, 0x1Cu);
    }
    goto LABEL_48;
  }
  if (a5) {
    unint64_t v14 = a5;
  }
  else {
    unint64_t v14 = 100;
  }
  if (v6)
  {
    int v15 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v41 = "-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]";
      __int16 v42 = 1024;
      int v43 = 196;
      __int16 v44 = 2048;
      unint64_t v45 = 0;
      _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Deployment has changed, Accumulating more roam objects, CurCnt=%lu", buf, 0x1Cu);
    }

    __int16 v16 = WALogCategoryDeviceStoreHandle();
    if (!os_signpost_enabled(v16)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    goto LABEL_29;
  }
  v38 = v13;
  id v17 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  uint64_t v18 = [v17 managedObjectContext];
  unint64_t v19 = +[RoamMO roamsCount:v11 fetchLimit:v14 moc:v18];

  v20 = WALogCategoryDeviceStoreHandle();
  v21 = v20;
  if (!v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v41 = "-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]";
      __int16 v42 = 1024;
      int v43 = 205;
      _os_log_impl(&dword_21D96D000, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:numRoamSamplesCollectedSoFar is 0", buf, 0x12u);
    }
    goto LABEL_48;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v41 = "-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]";
    __int16 v42 = 1024;
    int v43 = 208;
    __int16 v44 = 2048;
    unint64_t v45 = v14;
    __int16 v46 = 2048;
    unint64_t v47 = v19;
    _os_log_impl(&dword_21D96D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Building Roam Policies: NumRoamSamples to collect = %lu numRoamSamplesCollectedSoFar = %lu", buf, 0x26u);
  }

  if (![(RoamPolicyStore *)self doWeHaveEnoughSamplesToBuildChanList:v19 numRoamSamples:a5])
  {
    v32 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v41 = "-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]";
      __int16 v42 = 1024;
      int v43 = 231;
      __int16 v44 = 2048;
      unint64_t v45 = v19;
      _os_log_impl(&dword_21D96D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Not enough samples to run the show for Adaptive roaming, Bail out. RoamSamplesCollectedSoFar %lu", buf, 0x1Cu);
    }

    __int16 v16 = WALogCategoryDeviceStoreHandle();
    if (!os_signpost_enabled(v16)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    goto LABEL_29;
  }
  id v37 = v10;
  v21 = objc_opt_new();
  v39[0] = @"target.bssid";
  v39[1] = @"target.channel";
  v39[2] = @"target.channelFlags";
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:3];
  v23 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  v24 = [v23 managedObjectContext];
  v25 = +[RoamMO fetchRoamProperties:v11 lookForRoamStatus:0 fetchLimit:v19 properties:v22 moc:v24];

  if (!v25)
  {
    v36 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v41 = "-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]";
      __int16 v42 = 1024;
      int v43 = 220;
      __int16 v44 = 2112;
      unint64_t v45 = (unint64_t)v11;
      _os_log_impl(&dword_21D96D000, v36, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetchRoamProperties returned nil for %@", buf, 0x1Cu);
    }
    goto LABEL_47;
  }
  v26 = [(id)objc_opt_class() extractChannelList:v25 channelKeyPath:@"target.channel" channelFlagsKeyPath:@"target.channelFlags" logFor:"-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]"];

  if (![v26 count])
  {
    v36 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v41 = "-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]";
      __int16 v42 = 1024;
      int v43 = 226;
      _os_log_impl(&dword_21D96D000, v36, OS_LOG_TYPE_ERROR, "%{public}s::%d:resultChannelList empty", buf, 0x12u);
    }
    v21 = v26;
LABEL_47:
    v13 = v38;

    id v10 = v37;
LABEL_48:

    __int16 v16 = WALogCategoryDeviceStoreHandle();
    if (!os_signpost_enabled(v16)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
LABEL_29:
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies buildRoamPoliciesForNetwork", "No", buf, 2u);
LABEL_30:
    BOOL v33 = 0;
    goto LABEL_36;
  }
  [(RoamPolicyStore *)self updateNeighborChannelsFromRoamTargetsChannels:v26 bssid:v11 ssid:v37];

  if ([(RoamPolicyStore *)self doWeHaveEnoughSamplesToDeriveRSSITrigger:v19 numRoamSamples:a5])
  {
    __int16 v16 = [(RoamPolicyStore *)self deriveRoamInfo:v11 ssid:v37 numRoamSamplesCollectedSoFar:v19];
    if ([v16 count])
    {
      unint64_t v27 = 0;
      v28 = &qword_267D1AF98;
      do
      {
        v29 = [v16 objectAtIndex:v27];
        v30 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v31 = *v28;
          *(_DWORD *)buf = 136446978;
          v41 = "-[RoamPolicyStore buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:]";
          __int16 v42 = 1024;
          int v43 = 245;
          __int16 v44 = 2112;
          unint64_t v45 = (unint64_t)v29;
          __int16 v46 = 2048;
          unint64_t v47 = v31;
          _os_log_impl(&dword_21D96D000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d: BSSID: %@ Occurences: %ld", buf, 0x26u);
        }

        ++v27;
        v28 += 44;
      }
      while (v27 < [v16 count]);
      id v10 = v37;
      goto LABEL_33;
    }
  }
  else
  {
    __int16 v16 = 0;
  }
  id v10 = v37;
LABEL_33:
  v34 = WALogCategoryDeviceStoreHandle();
  v13 = v38;
  if (os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies buildRoamPoliciesForNetwork", "", buf, 2u);
  }

  BOOL v33 = 1;
LABEL_36:

  return v33;
}

- (void)updateNeighborChannelsFromRoamTargetsChannels:(id)a3 bssid:(id)a4 ssid:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x223C0F2E0]();
  if (!v8)
  {
    unint64_t v14 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v20 = 136446466;
    v21 = "-[RoamPolicyStore updateNeighborChannelsFromRoamTargetsChannels:bssid:ssid:]";
    __int16 v22 = 1024;
    int v23 = 275;
    id v17 = "%{public}s::%d:targetChannels nil";
    goto LABEL_12;
  }
  if (![v8 count])
  {
    unint64_t v14 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v20 = 136446466;
    v21 = "-[RoamPolicyStore updateNeighborChannelsFromRoamTargetsChannels:bssid:ssid:]";
    __int16 v22 = 1024;
    int v23 = 276;
    id v17 = "%{public}s::%d:targetChannels is empty";
LABEL_12:
    uint64_t v18 = v14;
    uint32_t v19 = 18;
    goto LABEL_15;
  }
  int v12 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  v13 = [v12 managedObjectContext];
  unint64_t v14 = +[BSSMO getInstance:v9 ssid:v10 moc:v13];

  if (!v14)
  {
    unint64_t v14 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v20 = 136446978;
    v21 = "-[RoamPolicyStore updateNeighborChannelsFromRoamTargetsChannels:bssid:ssid:]";
    __int16 v22 = 1024;
    int v23 = 280;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v9;
    id v17 = "%{public}s::%d:bssMO nil for %@[%@]";
    uint64_t v18 = v14;
    uint32_t v19 = 38;
LABEL_15:
    _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v20, v19);
    goto LABEL_7;
  }
  [v14 setNeighborChannels:v8];
  int v15 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 136447234;
    v21 = "-[RoamPolicyStore updateNeighborChannelsFromRoamTargetsChannels:bssid:ssid:]";
    __int16 v22 = 1024;
    int v23 = 284;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:[BSS:%@ SSID:%@] Updated neighborChannels: %@", (uint8_t *)&v20, 0x30u);
  }

  __int16 v16 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  [v16 updateManagedObjectContextWithoutSave];

LABEL_7:
}

- (id)deriveRoamInfo:(id)a3 ssid:(id)a4 numRoamSamplesCollectedSoFar:(unint64_t)a5
{
  v90[6] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:", "", buf, 2u);
  }

  id v9 = (void *)MEMORY[0x223C0F2E0]();
  id v10 = [MEMORY[0x263EFF980] array];
  v75 = [MEMORY[0x263EFF980] array];
  v72 = [MEMORY[0x263EFF980] array];
  v71 = [MEMORY[0x263EFF980] array];
  bzero(&roamInfo, 0xDC0uLL);
  id v11 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  int v12 = [v11 managedObjectContext];
  v13 = +[BSSMO getInstance:v6 ssid:v7 moc:v12];

  v90[0] = @"target.bssid";
  v90[1] = @"fwReason";
  v90[2] = @"sourceRssi";
  v90[3] = @"sourceTimeSpentSecs";
  v90[4] = @"motionState";
  v90[5] = @"date";
  unint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v90 count:6];
  int v15 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  __int16 v16 = [v15 managedObjectContext];
  id v17 = +[RoamMO fetchRoamProperties:v6 lookForRoamStatus:1 fetchLimit:a5 properties:v14 moc:v16];

  uint64_t v18 = v17;
  if (!v17)
  {
    int v43 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v81 = "-[RoamPolicyStore deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:]";
      __int16 v82 = 1024;
      int v83 = 323;
      __int16 v84 = 2112;
      size_t v85 = (size_t)v6;
      _os_log_impl(&dword_21D96D000, v43, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetchRoamProperties returned nil for bssid:%@", buf, 0x1Cu);
    }
LABEL_65:

    v63 = WALogCategoryDeviceStoreHandle();
    if (os_signpost_enabled(v63))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21D96D000, v63, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:", "failed", buf, 2u);
    }

    id v60 = 0;
    goto LABEL_59;
  }
  v65 = v14;
  v66 = v13;
  v67 = v9;
  id v68 = v7;
  id v69 = v6;
  v74 = v10;
  v70 = v17;
  if ([v17 count])
  {
    uint64_t v20 = 0;
    unint64_t v21 = 0;
    *(void *)&long long v19 = 136446722;
    long long v64 = v19;
    unint64_t v22 = 0x263F08000uLL;
    while (1)
    {
      int v23 = objc_msgSend(v18, "objectAtIndex:", v20, v64);
      __int16 v24 = [v23 valueForKey:@"target.bssid"];
      if (v24) {
        break;
      }
LABEL_26:

      if (++v20 >= (unint64_t)[v18 count]) {
        goto LABEL_31;
      }
    }
    uint64_t v73 = v20;
    if (v21 <= 9)
    {
      if ([v10 containsObject:v24])
      {
        if (!v21)
        {
LABEL_25:
          uint64_t v20 = v73;
          goto LABEL_26;
        }
      }
      else
      {
        [v10 addObject:v24];
        id v25 = (const char *)[v24 UTF8String];
        size_t v26 = strlen(v25);
        if (v26 >= 0x14)
        {
          v38 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v64;
            v81 = "-[RoamPolicyStore deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:]";
            __int16 v82 = 1024;
            int v83 = 340;
            __int16 v84 = 2048;
            size_t v85 = v26;
            _os_log_impl(&dword_21D96D000, v38, OS_LOG_TYPE_ERROR, "%{public}s::%d:Length exceeded limit:%lu", buf, 0x1Cu);
          }

          goto LABEL_25;
        }
        memcpy((char *)&roamInfo + 352 * v21++, v25, v26);
      }
    }
    uint64_t v27 = 0;
    __int16 v28 = &roamInfo;
    v76 = v24;
    do
    {
      id v29 = [*(id *)(v22 + 2880) stringWithUTF8String:v28];
      if ([v24 isEqual:v29])
      {
        uint64_t v30 = [v23 valueForKey:@"fwReason"];
        uint64_t v31 = [v30 unsignedIntegerValue];

        v32 = [v23 valueForKey:@"sourceRssi"];
        uint64_t v78 = [v32 integerValue];

        BOOL v33 = [v23 valueForKey:@"sourceTimeSpentSecs"];
        uint64_t v34 = [v33 unsignedIntegerValue];

        v35 = [v23 valueForKey:@"motionState"];
        uint64_t v36 = [v35 integerValue];

        id v37 = [v23 valueForKey:@"date"];
        ++v28[39];
        [(RoamPolicyStore *)self listOutMostUsedRoamReasons:v27 roamReason:v31];
        [(RoamPolicyStore *)self listOutTimeSpentOnBss:v27 timeSpentOnBss:v34 motionState:v36];
        [(RoamPolicyStore *)self checkForFrequentRoams:v27 date:v37 motionState:v36];
        switch(v31)
        {
          case 0xE0820C01:
            [(RoamPolicyStore *)self listOutMostUsedSourceRssi:v75 neighborCount:v27 sourceRssi:v78];
            break;
          case 0xE0820C02:
          case 0xE0820C03:
            [(RoamPolicyStore *)self listOutLinkLossSuppressionRoams:v27];
            break;
          case 0xE0820C04:
          case 0xE0820C05:
          case 0xE0820C07:
          case 0xE0820C09:
          case 0xE0820C0A:
            break;
          case 0xE0820C06:
          case 0xE0820C0B:
            [(RoamPolicyStore *)self listOutBTMRoams:v27];
            break;
          case 0xE0820C08:
            [(RoamPolicyStore *)self listOutLazyRoamScanInfo:v72 neighborCount:v27 sourceRssi:v78];
            break;
          default:
            if (v31 == -528348141) {
              [(RoamPolicyStore *)self listOutReassocRoams:v71 neighborCount:v27 sourceRssi:v78];
            }
            break;
        }

        unint64_t v22 = 0x263F08000;
        __int16 v24 = v76;
      }

      ++v27;
      v28 += 44;
    }
    while (v21 != v27);
    id v10 = v74;
    uint64_t v18 = v70;
    goto LABEL_25;
  }
LABEL_31:
  v39 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v81 = "-[RoamPolicyStore deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:]";
    __int16 v82 = 1024;
    int v83 = 406;
    __int16 v84 = 2112;
    size_t v85 = (size_t)v69;
    _os_log_impl(&dword_21D96D000, v39, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Neighbors of BSS %@:", buf, 0x1Cu);
  }

  if ([v10 count])
  {
    v40 = v10;
    unint64_t v41 = 0;
    __int16 v42 = &qword_267D1AF98;
    while (1)
    {
      int v43 = [v40 objectAtIndex:v41];
      __int16 v44 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = *v42;
        *(_DWORD *)buf = 136446978;
        v81 = "-[RoamPolicyStore deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:]";
        __int16 v82 = 1024;
        int v83 = 409;
        __int16 v84 = 2112;
        size_t v85 = (size_t)v43;
        __int16 v86 = 2048;
        uint64_t v87 = v45;
        _os_log_impl(&dword_21D96D000, v44, OS_LOG_TYPE_DEFAULT, "%{public}s::%d: BSSID: %@ Occurences: %ld", buf, 0x26u);
      }

      if (*v42 <= 19 && !self->_roamPolicyMOHandler) {
        break;
      }

      ++v41;
      v40 = v74;
      v42 += 44;
      if (v41 >= [v74 count]) {
        goto LABEL_40;
      }
    }
    v62 = WALogCategoryDeviceStoreHandle();
    id v6 = v69;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v81 = "-[RoamPolicyStore deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:]";
      __int16 v82 = 1024;
      int v83 = 411;
      __int16 v84 = 2112;
      size_t v85 = (size_t)v43;
      _os_log_impl(&dword_21D96D000, v62, OS_LOG_TYPE_ERROR, "%{public}s::%d:Not enough roam samples with %@", buf, 0x1Cu);
    }

    id v9 = v67;
    id v7 = v68;
    id v10 = v74;
    unint64_t v14 = v65;
    v13 = v66;
    uint64_t v18 = v70;
    goto LABEL_65;
  }
LABEL_40:
  __int16 v46 = v75;
  uint64_t v47 = [v75 count];
  if (v47)
  {
    uint64_t v48 = v47;
    while (1)
    {
      v49 = [v46 valueForKeyPath:@"@max.self"];
      uint64_t v50 = (int)[v49 intValue];

      v51 = [NSNumber numberWithInteger:v50];
      v52 = (void *)[objc_alloc(MEMORY[0x263F08760]) initWithArray:v46];
      unint64_t v53 = [v52 countForObject:v51];
      if (v50 <= -77) {
        uint64_t v50 = -77;
      }
      v54 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447234;
        v81 = "-[RoamPolicyStore deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:]";
        __int16 v82 = 1024;
        int v83 = 429;
        __int16 v84 = 2048;
        size_t v85 = v48;
        __int16 v86 = 2048;
        uint64_t v87 = v50;
        __int16 v88 = 2048;
        unint64_t v89 = v53;
        _os_log_impl(&dword_21D96D000, v54, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:RssiObjects =%ld RSSI value =%ld numOccurances =%lu", buf, 0x30u);
      }

      if (v53 > (unint64_t)(((((unint64_t)(5 * v48) >> 1) & 0x3FFFFFFFFFFFFFFFLL)
                                   * (unsigned __int128)0x28F5C28F5C28F5C3uLL) >> 64) >> 2)
        break;
      __int16 v46 = v75;
      [v75 removeObject:v51];
      uint64_t v48 = [v75 count];

      if (!v48) {
        goto LABEL_54;
      }
    }
    v55 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447234;
      v81 = "-[RoamPolicyStore deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:]";
      __int16 v82 = 1024;
      int v83 = 432;
      __int16 v84 = 2048;
      size_t v85 = v48;
      __int16 v86 = 2048;
      uint64_t v87 = v50;
      __int16 v88 = 2048;
      unint64_t v89 = v53;
      _os_log_impl(&dword_21D96D000, v55, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:RssiObjects =%ld Best RSSI value =%ld numOccurances =%lu", buf, 0x30u);
    }

    if (v48 == 1) {
      uint64_t v50 = -70;
    }
  }
  else
  {
    uint64_t v50 = -128;
  }
LABEL_54:
  v56 = WALogCategoryDeviceStoreHandle();
  id v6 = v69;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v81 = "-[RoamPolicyStore deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:]";
    __int16 v82 = 1024;
    int v83 = 445;
    __int16 v84 = 2112;
    size_t v85 = (size_t)v69;
    __int16 v86 = 2048;
    uint64_t v87 = v50;
    _os_log_impl(&dword_21D96D000, v56, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:BSSID %@ Derived RSSI =%ld", buf, 0x26u);
  }

  v13 = v66;
  [v66 setRoamTriggerRssi:(__int16)v50];
  id v10 = v74;
  v57 = [MEMORY[0x263EFF8C0] arrayWithArray:v74];
  [v66 setNeighborBSSIDs:v57];

  v58 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  [v58 updateManagedObjectContextWithoutSave];

  -[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:](self, "storeNeighborsInfoLearningsFromRoamInfo:neighborCount:", v66, [v74 count]);
  v59 = WALogCategoryDeviceStoreHandle();
  id v9 = v67;
  id v7 = v68;
  unint64_t v14 = v65;
  uint64_t v18 = v70;
  if (os_signpost_enabled(v59))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v59, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies deriveRoamInfo:ssid:numRoamSamplesCollectedSoFar:", "", buf, 2u);
  }

  id v60 = v74;
LABEL_59:

  return v60;
}

- (void)listOutMostUsedRoamReasons:(unint64_t)a3 roamReason:(unint64_t)a4
{
  int v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  switch(a4)
  {
    case 0xE0820C00:
      break;
    case 0xE0820C01:
      ++*((void *)&roamInfo + 44 * a3 + 3);
      break;
    case 0xE0820C02:
    case 0xE0820C03:
    case 0xE0820C13:
      ++*((void *)&roamInfo + 44 * a3 + 7);
      break;
    case 0xE0820C04:
    case 0xE0820C05:
      ++*((void *)&roamInfo + 44 * a3 + 6);
      break;
    case 0xE0820C06:
    case 0xE0820C0B:
      ++*((void *)&roamInfo + 44 * a3 + 4);
      break;
    case 0xE0820C07:
      ++*((void *)&roamInfo + 44 * a3 + 9);
      break;
    case 0xE0820C08:
      ++*((void *)&roamInfo + 44 * a3 + 5);
      break;
    case 0xE0820C09:
      ++*((void *)&roamInfo + 44 * a3 + 10);
      break;
    case 0xE0820C0A:
      ++*((void *)&roamInfo + 44 * a3 + 11);
      break;
    case 0xE0820C0C:
      ++*((void *)&roamInfo + 44 * a3 + 12);
      break;
    case 0xE0820C0D:
      ++*((void *)&roamInfo + 44 * a3 + 13);
      break;
    case 0xE0820C0E:
      ++*((void *)&roamInfo + 44 * a3 + 14);
      break;
    case 0xE0820C0F:
      ++*((void *)&roamInfo + 44 * a3 + 15);
      break;
    case 0xE0820C10:
      ++*((void *)&roamInfo + 44 * a3 + 16);
      break;
    case 0xE0820C11:
      ++*((void *)&roamInfo + 44 * a3 + 17);
      break;
    case 0xE0820C12:
      ++*((void *)&roamInfo + 44 * a3 + 18);
      break;
    default:
      id v6 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136446722;
        int v15 = "-[RoamPolicyStore listOutMostUsedRoamReasons:roamReason:]";
        __int16 v16 = 1024;
        int v17 = 534;
        __int16 v18 = 1024;
        int v19 = v4;
        _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:This Roam reason %u is not categorized", (uint8_t *)&v14, 0x18u);
      }

      break;
  }
  id v7 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (void *)((char *)&roamInfo + 352 * a3);
    uint64_t v10 = v8[6];
    uint64_t v9 = v8[7];
    uint64_t v11 = v8[3];
    uint64_t v12 = v8[4];
    uint64_t v13 = v8[5];
    int v14 = 136448002;
    int v15 = "-[RoamPolicyStore listOutMostUsedRoamReasons:roamReason:]";
    __int16 v16 = 1024;
    int v17 = 538;
    __int16 v18 = 1024;
    int v19 = v4;
    __int16 v20 = 2048;
    uint64_t v21 = v11;
    __int16 v22 = 2048;
    uint64_t v23 = v9;
    __int16 v24 = 2048;
    uint64_t v25 = v10;
    __int16 v26 = 2048;
    uint64_t v27 = v12;
    __int16 v28 = 2048;
    uint64_t v29 = v13;
    _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_INFO, "%{public}s::%d:Roam Reason = %u, LowRSSI = %ld LinkLossSuppression = %ld BeaconsLost = %ld roamDueToBTM = %ld LazyRoamScan = %ld", (uint8_t *)&v14, 0x4Au);
  }
}

- (BOOL)inRange:(int64_t)a3 high:(int64_t)a4 value:(int64_t)a5
{
  return (a5 - a4) * (a5 - a3) < 1;
}

- (void)listOutMostUsedSourceRssi:(id)a3 neighborCount:(unint64_t)a4 sourceRssi:(int64_t)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = v8;
  if (a5 <= -70)
  {
    uint64_t v10 = 0;
    uint64_t v11 = (char *)&roamInfo + 352 * a4;
    uint64_t v12 = v11 + 200;
    uint64_t v13 = v11 + 152;
    uint64_t v31 = v11 + 192;
    uint64_t v29 = v8;
    uint64_t v30 = v11 + 184;
    int v14 = v11 + 176;
    int v15 = v11 + 168;
    __int16 v16 = v11 + 160;
    int v17 = -70;
    do
    {
      uint64_t v18 = v17;
      int v17 = roamOriginRssiLevels[v10 + 1];
      [(RoamPolicyStore *)self inRange:v18 high:v17 value:a5];
      int v19 = v13;
      switch(v10)
      {
        case 0:
          goto LABEL_10;
        case 1:
          int v19 = v16;
          goto LABEL_10;
        case 2:
          int v19 = v15;
          goto LABEL_10;
        case 3:
          int v19 = v14;
          goto LABEL_10;
        case 4:
          int v19 = v30;
          goto LABEL_10;
        case 5:
          int v19 = v31;
          goto LABEL_10;
        case 6:
        case 7:
          int v19 = v12;
LABEL_10:
          ++*v19;
          break;
        default:
          break;
      }
      ++v10;
    }
    while (v10 != 8);
    __int16 v20 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *v13;
      uint64_t v22 = *v16;
      uint64_t v23 = *v15;
      uint64_t v24 = *v14;
      uint64_t v25 = *v30;
      uint64_t v26 = *v31;
      uint64_t v27 = *v12;
      *(_DWORD *)buf = 136448514;
      BOOL v33 = "-[RoamPolicyStore listOutMostUsedSourceRssi:neighborCount:sourceRssi:]";
      __int16 v34 = 1024;
      int v35 = 581;
      __int16 v36 = 2048;
      int64_t v37 = a5;
      __int16 v38 = 2048;
      uint64_t v39 = v21;
      __int16 v40 = 2048;
      uint64_t v41 = v22;
      __int16 v42 = 2048;
      uint64_t v43 = v23;
      __int16 v44 = 2048;
      uint64_t v45 = v24;
      __int16 v46 = 2048;
      uint64_t v47 = v25;
      __int16 v48 = 2048;
      uint64_t v49 = v26;
      __int16 v50 = 2048;
      uint64_t v51 = v27;
      _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_INFO, "%{public}s::%d:Source RSSI %ld HighRSSI %ld UpperHigh %ld Optimum %ld UpperOptimim %ld Mid %ld UpperMid %ld Low %ld", buf, 0x62u);
    }

    __int16 v28 = [NSNumber numberWithInt:a5];
    uint64_t v9 = v29;
    [v29 addObject:v28];
  }
}

- (void)listOutTimeSpentOnBss:(unint64_t)a3 timeSpentOnBss:(unint64_t)a4 motionState:(int64_t)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (a4 > 0x14)
  {
    if (a4 > 0x3C)
    {
      if (a4 > 0x78)
      {
        if (a4 > 0x1F4)
        {
          if (a4 > 0x258) {
            goto LABEL_13;
          }
          id v7 = (char *)&roamInfo + 352 * a3 + 288;
        }
        else
        {
          id v7 = (char *)&roamInfo + 352 * a3 + 280;
        }
      }
      else
      {
        id v7 = (char *)&roamInfo + 352 * a3 + 272;
      }
    }
    else
    {
      id v7 = (char *)&roamInfo + 352 * a3 + 264;
    }
  }
  else
  {
    if (a5) {
      goto LABEL_13;
    }
    id v7 = (char *)&roamInfo + 352 * a3 + 256;
  }
  ++*(void *)v7;
LABEL_13:
  id v8 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = (void *)((char *)&roamInfo + 352 * a3);
    uint64_t v10 = v9[32];
    uint64_t v11 = v9[33];
    uint64_t v12 = v9[34];
    uint64_t v13 = v9[35];
    uint64_t v14 = v9[36];
    int v15 = 136448002;
    __int16 v16 = "-[RoamPolicyStore listOutTimeSpentOnBss:timeSpentOnBss:motionState:]";
    __int16 v17 = 1024;
    int v18 = 606;
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    __int16 v21 = 2048;
    uint64_t v22 = v10;
    __int16 v23 = 2048;
    uint64_t v24 = v11;
    __int16 v25 = 2048;
    uint64_t v26 = v12;
    __int16 v27 = 2048;
    uint64_t v28 = v13;
    __int16 v29 = 2048;
    uint64_t v30 = v14;
    _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_DEBUG, "%{public}s::%d:TimeSpent in Seconds %ld numRoamDurLow %ld  numRoamDurUpperLow %ld numRoamDurMid %ld numRoamDurUpperMid %ld numRoamDurHigh %ld", (uint8_t *)&v15, 0x4Eu);
  }
}

- (id)collectRoamCandidates:(id)a3 roamSamplesToCollect:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  id v8 = [v7 managedObjectContext];
  uint64_t v9 = +[RoamMO fetchRoamObjects:v6 fetchLimit:a4 moc:v8];

  return v9;
}

- (void)checkForFrequentRoams:(unint64_t)a3 date:(id)a4 motionState:(int64_t)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  [a4 timeIntervalSinceReferenceDate];
  id v8 = (char *)&roamInfo + 352 * a3;
  uint64_t v9 = (double *)(v8 + 296);
  *((void *)v8 + 38) = v7;
  if ((unint64_t)a5 <= 1 && *v9 != 0.0)
  {
    uint64_t v10 = (uint64_t *)(v8 + 304);
    uint64_t v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:*v9];
    uint64_t v12 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:*((double *)v8 + 38)];
    [v11 timeIntervalSinceDate:v12];
    double v14 = v13;
    int v15 = [NSString stringWithUTF8String:v8];
    __int16 v16 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v19 = 136447490;
      unint64_t v20 = "-[RoamPolicyStore checkForFrequentRoams:date:motionState:]";
      __int16 v21 = 1024;
      int v22 = 634;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      __int16 v27 = 2112;
      uint64_t v28 = v12;
      __int16 v29 = 2048;
      double v30 = v14;
      _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_INFO, "%{public}s::%d:BSS %@ PrevDate %@ newDate %@ Difference %f", (uint8_t *)&v19, 0x3Au);
    }

    int v17 = checkForFrequentRoams_date_motionState__frequentRoamCount;
    if (v14 < 15.0) {
      int v17 = ++checkForFrequentRoams_date_motionState__frequentRoamCount;
    }
    if (v17 >= 11)
    {
      int v18 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = 136446722;
        unint64_t v20 = "-[RoamPolicyStore checkForFrequentRoams:date:motionState:]";
        __int16 v21 = 1024;
        int v22 = 640;
        __int16 v23 = 2112;
        uint64_t v24 = v15;
        _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_INFO, "%{public}s::%d:Frequent RoamCandidate %@", (uint8_t *)&v19, 0x1Cu);
      }

      checkForFrequentRoams_date_motionState__frequentRoamCount = 0;
    }

    uint64_t v7 = *v10;
  }
  *(void *)uint64_t v9 = v7;
}

- (void)listOutLazyRoamScanInfo:(id)a3 neighborCount:(unint64_t)a4 sourceRssi:(int64_t)a5
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = v8;
  if (a5 && a5 >= -70)
  {
    __int16 v40 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = (char *)&roamInfo + 352 * a4;
    uint64_t v41 = v11 + 248;
    uint64_t v12 = v11 + 208;
    double v13 = v11 + 240;
    double v14 = v11 + 232;
    int v15 = v11 + 224;
    __int16 v16 = v11 + 216;
    int v17 = -10;
    do
    {
      uint64_t v18 = v17;
      int v17 = lazyRoamOriginRssiLevels[v10 + 1];
      -[RoamPolicyStore inRange:high:value:](self, "inRange:high:value:", v18, v17, a5, v40);
      int v19 = v12;
      switch((int)v10)
      {
        case 0:
          goto LABEL_10;
        case 1:
          int v19 = v16;
          goto LABEL_10;
        case 2:
          int v19 = v15;
          goto LABEL_10;
        case 3:
          int v19 = v14;
          goto LABEL_10;
        case 4:
          int v19 = v13;
          goto LABEL_10;
        case 5:
          int v19 = v41;
LABEL_10:
          ++*v19;
          break;
        default:
          break;
      }
      ++v10;
    }
    while (v10 != 6);
    unint64_t v20 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *v12;
      uint64_t v22 = *v16;
      uint64_t v23 = *v15;
      uint64_t v24 = *v14;
      uint64_t v25 = *v13;
      uint64_t v26 = *v41;
      *(_DWORD *)buf = 136448258;
      uint64_t v43 = "-[RoamPolicyStore listOutLazyRoamScanInfo:neighborCount:sourceRssi:]";
      __int16 v44 = 1024;
      int v45 = 680;
      __int16 v46 = 2048;
      int64_t v47 = a5;
      __int16 v48 = 2048;
      uint64_t v49 = v21;
      __int16 v50 = 2048;
      uint64_t v51 = v22;
      __int16 v52 = 2048;
      uint64_t v53 = v23;
      __int16 v54 = 2048;
      uint64_t v55 = v24;
      __int16 v56 = 2048;
      uint64_t v57 = v25;
      __int16 v58 = 2048;
      uint64_t v59 = v26;
      _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_INFO, "%{public}s::%d:Lazy Roam: Source RSSI %ld HighRSSI %ld UpperHigh %ld Optimum %ld UpperOptimim %ld Mid %ld UpperMid %ld", buf, 0x58u);
    }

    __int16 v27 = [NSNumber numberWithInt:a5];
    uint64_t v9 = v40;
    [v40 addObject:v27];

    uint64_t v28 = *v12;
    uint64_t v29 = *v16;
    uint64_t v30 = *v15;
    uint64_t v31 = *v14;
    uint64_t v32 = *v13;
    uint64_t v33 = *v41;
    __int16 v34 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      if (v28 <= v29) {
        uint64_t v35 = v29;
      }
      else {
        uint64_t v35 = v28;
      }
      if (v35 <= v30) {
        uint64_t v35 = v30;
      }
      if (v35 <= v31) {
        uint64_t v35 = v31;
      }
      if (v35 <= v32) {
        uint64_t v35 = v32;
      }
      if (v35 <= v33) {
        uint64_t v35 = v33;
      }
      *(_DWORD *)buf = 136446722;
      uint64_t v43 = "-[RoamPolicyStore listOutLazyRoamScanInfo:neighborCount:sourceRssi:]";
      __int16 v44 = 1024;
      int v45 = 712;
      __int16 v46 = 2048;
      int64_t v47 = v35 & ~(v35 >> 63);
      __int16 v36 = "%{public}s::%d:Largest LazyRoam Bin is %ld\n";
      int64_t v37 = v34;
      os_log_type_t v38 = OS_LOG_TYPE_INFO;
      uint32_t v39 = 28;
      goto LABEL_29;
    }
  }
  else
  {
    __int16 v34 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v43 = "-[RoamPolicyStore listOutLazyRoamScanInfo:neighborCount:sourceRssi:]";
      __int16 v44 = 1024;
      int v45 = 651;
      __int16 v36 = "%{public}s::%d:Continue";
      int64_t v37 = v34;
      os_log_type_t v38 = OS_LOG_TYPE_DEBUG;
      uint32_t v39 = 18;
LABEL_29:
      _os_log_impl(&dword_21D96D000, v37, v38, v36, buf, v39);
    }
  }
}

- (void)listOutReassocRoams:(id)a3 neighborCount:(unint64_t)a4 sourceRssi:(int64_t)a5
{
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithInt:a5];
  [v7 addObject:v8];
}

- (void)listOutBTMRoams:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = (char *)&roamInfo + 352 * a3;
  if (*((void *)v3 + 4) > 50 * a3 / 0x64)
  {
    int v4 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [NSString stringWithUTF8String:v3];
      int v6 = 136446722;
      id v7 = "-[RoamPolicyStore listOutBTMRoams:]";
      __int16 v8 = 1024;
      int v9 = 749;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_INFO, "%{public}s::%d:This BSS %@ Object experieces too many BTM's", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (BOOL)monitorDeploymentChanges:(id)a3 ssid:(id)a4 roamStatus:(unint64_t)a5 originBssid:(id)a6 targetBssid:(id)a7
{
  v150[4] = *MEMORY[0x263EF8340];
  id v95 = a3;
  id v113 = a4;
  id v11 = a6;
  id v12 = a7;
  uint64_t v94 = MEMORY[0x223C0F2E0]();
  unint64_t v13 = 0x264465000uLL;
  v97 = v11;
  if (+[WAUtil isWildcardMacAddress:v11])
  {
    unint64_t v89 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v138 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
      __int16 v139 = 1024;
      int v140 = 770;
      __int16 v141 = 2112;
      id v142 = v11;
      _os_log_impl(&dword_21D96D000, v89, OS_LOG_TYPE_ERROR, "%{public}s::%d:originBSS(%@) is the wildcard address!! bailing", buf, 0x1Cu);
    }
    __int16 v86 = 0;
    char v87 = 0;
    size_t v85 = v12;
    goto LABEL_108;
  }
  id v96 = v12;
  if (+[WAUtil isWildcardMacAddress:v12])
  {
    unint64_t v89 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v138 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
      __int16 v139 = 1024;
      int v140 = 771;
      __int16 v141 = 2112;
      size_t v85 = v12;
      id v142 = v12;
      _os_log_impl(&dword_21D96D000, v89, OS_LOG_TYPE_ERROR, "%{public}s::%d:targetBSS(%@) is the wildcard address!! bailing", buf, 0x1Cu);
      __int16 v86 = 0;
      char v87 = 0;
    }
    else
    {
      __int16 v86 = 0;
      char v87 = 0;
      size_t v85 = v12;
    }
LABEL_108:
    __int16 v88 = (void *)v94;
LABEL_95:

    goto LABEL_98;
  }
  v122 = self;
  BOOL v14 = [(RoamPolicyStore *)self isHomeEnvironment:v113];
  int v15 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v138 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
    __int16 v139 = 1024;
    int v140 = 776;
    __int16 v141 = 1024;
    LODWORD(v142) = v14;
    _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:isHome Network %d", buf, 0x18u);
  }

  v150[0] = @"neighborCache";
  v150[1] = @"cacheChannel";
  v150[2] = @"cacheChannelFlags";
  v150[3] = @"cacheRssiBin";
  __int16 v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v150 count:4];
  int v17 = [(RoamPolicyStore *)v122 roamPolicyMOHandler];
  uint64_t v18 = [v17 managedObjectContext];
  v93 = v16;
  uint64_t v19 = +[RoamMO fetchRoamProperties:v97 lookForRoamStatus:0 fetchLimit:100 properties:v16 moc:v18];

  v99 = (void *)v19;
  if (!v19)
  {
    v91 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v138 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
      __int16 v139 = 1024;
      int v140 = 790;
      __int16 v141 = 2112;
      id v142 = v97;
      _os_log_impl(&dword_21D96D000, v91, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetchRoamProperties returned nil for originBSS:%@", buf, 0x1Cu);
    }

    __int16 v86 = 0;
    char v87 = 0;
    size_t v85 = v96;
    unint64_t v89 = v93;
    __int16 v88 = (void *)v94;
    goto LABEL_95;
  }
  unint64_t v20 = [(RoamPolicyStore *)v122 roamPolicyMOHandler];
  uint64_t v21 = [v20 managedObjectContext];
  unint64_t v22 = +[RoamMO roamsCount:v96 fetchLimit:100 moc:v21];

  if (v22)
  {
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id obj = v95;
    uint64_t v23 = [obj countByEnumeratingWithState:&v131 objects:v149 count:16];
    if (v23)
    {
      uint64_t v25 = v23;
      v117 = 0;
      v121 = 0;
      char v98 = 0;
      uint64_t v26 = *(void *)v132;
      *(void *)&long long v24 = 136446466;
      long long v92 = v24;
      uint64_t v104 = *(void *)v132;
      while (2)
      {
        uint64_t v27 = 0;
        uint64_t v108 = v25;
        do
        {
          if (*(void *)v132 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v131 + 1) + 8 * v27);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v109 = v27;
            uint64_t v29 = [(id)objc_opt_class() cleanChannelFlagsIn:v28];
            uint64_t v30 = [v29 objectForKey:@"bssid"];
            uint64_t v31 = [v29 objectForKey:@"rssi"];
            uint64_t v32 = [v29 objectForKey:@"roamDelta"];
            uint64_t v33 = [v31 integerValue];
            id v119 = (id)[v32 integerValue];
            __int16 v34 = objc_opt_class();
            uint64_t v35 = [v29 objectForKey:@"channel"];
            uint64_t v36 = [v35 integerValue];
            int64_t v37 = [v29 objectForKey:@"channelFlags"];
            os_log_type_t v38 = objc_msgSend(v34, "makeChanInfoFromChannel:andFlags:", v36, objc_msgSend(v37, "integerValue"));

            if ([*(id *)(v13 + 3192) isWildcardMacAddress:v30])
            {

              uint64_t v26 = v104;
              uint64_t v25 = v108;
              uint64_t v27 = v109;
            }
            else
            {
              v100 = v32;
              v101 = v31;
              v102 = v29;
              uint32_t v39 = WALogCategoryDeviceStoreHandle();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136447490;
                v138 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
                __int16 v139 = 1024;
                int v140 = 819;
                __int16 v141 = 2112;
                id v142 = v30;
                __int16 v143 = 2048;
                uint64_t v144 = v33;
                __int16 v145 = 2112;
                unint64_t v146 = (unint64_t)v38;
                __int16 v147 = 2048;
                id v148 = v119;
                _os_log_impl(&dword_21D96D000, v39, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:currentCacheBssid  %@ currentRssi %ld currentChannel: %@ currentRoamDelta %ld", buf, 0x3Au);
              }
              v114 = v38;

              __int16 v40 = v122;
              uint64_t v41 = [(RoamPolicyStore *)v122 roamPolicyMOHandler];
              __int16 v42 = [v41 managedObjectContext];
              uint64_t v43 = +[BSSMO getInstance:v30 ssid:v113 moc:v42];

              uint64_t v44 = v108;
              if (v43)
              {
                int v45 = objc_msgSend((id)objc_opt_class(), "makeChanInfoFromChannel:andFlags:", (int)objc_msgSend(v43, "channel"), (int)objc_msgSend(v43, "channelFlags"));
                __int16 v46 = WALogCategoryDeviceStoreHandle();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136447234;
                  v138 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
                  __int16 v139 = 1024;
                  int v140 = 827;
                  __int16 v141 = 2112;
                  id v142 = v30;
                  __int16 v143 = 2112;
                  uint64_t v144 = (uint64_t)v113;
                  __int16 v145 = 2112;
                  unint64_t v146 = (unint64_t)v45;
                  _os_log_impl(&dword_21D96D000, v46, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:MyChannel for bssid[%@] ssid[%@] : %@", buf, 0x30u);
                }

                if (([v45 isEqualToDictionary:v114] & 1) == 0)
                {
                  int64_t v47 = WALogCategoryDeviceStoreHandle();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136447234;
                    v138 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
                    __int16 v139 = 1024;
                    int v140 = 830;
                    __int16 v141 = 2112;
                    id v142 = v30;
                    __int16 v143 = 2112;
                    uint64_t v144 = (uint64_t)v114;
                    __int16 v145 = 2112;
                    unint64_t v146 = (unint64_t)v45;
                    _os_log_impl(&dword_21D96D000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Change in Channel for BSSID =%@, currentChannel = %@, bssChannel = %@", buf, 0x30u);
                  }

                  [(RoamPolicyStore *)v122 updateNeighborChannelsInCoreDataWith:v45 bssid:v30 ssid:v113];
                }
              }
              else
              {
                int v45 = 0;
              }
              long long v129 = 0u;
              long long v130 = 0u;
              long long v127 = 0u;
              long long v128 = 0u;
              id v107 = v99;
              v115 = v30;
              uint64_t v110 = [v107 countByEnumeratingWithState:&v127 objects:v136 count:16];
              v103 = v43;
              if (v110)
              {
                uint64_t v111 = *(void *)v128;
                __int16 v48 = v107;
                v118 = v45;
                do
                {
                  uint64_t v49 = 0;
                  do
                  {
                    if (*(void *)v128 != v111)
                    {
                      uint64_t v50 = v49;
                      objc_enumerationMutation(v48);
                      uint64_t v49 = v50;
                    }
                    uint64_t v112 = v49;
                    uint64_t v51 = *(void **)(*((void *)&v127 + 1) + 8 * v49);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      __int16 v52 = [v51 valueForKey:@"neighborCache"];
                      if (v52)
                      {
                        long long v125 = 0u;
                        long long v126 = 0u;
                        long long v123 = 0u;
                        long long v124 = 0u;
                        id v105 = v52;
                        id v120 = v52;
                        uint64_t v53 = [v120 countByEnumeratingWithState:&v123 objects:v135 count:16];
                        if (v53)
                        {
                          uint64_t v54 = v53;
                          uint64_t v55 = *(void *)v124;
                          uint64_t v116 = *(void *)v124;
                          while (2)
                          {
                            uint64_t v56 = 0;
                            do
                            {
                              if (*(void *)v124 != v55) {
                                objc_enumerationMutation(v120);
                              }
                              uint64_t v57 = objc_msgSend(*(id *)(*((void *)&v123 + 1) + 8 * v56), "objectForKey:", @"bssid", v92);
                              if (([*(id *)(v13 + 3192) isWildcardMacAddress:v57] & 1) == 0)
                              {
                                __int16 v58 = [(RoamPolicyStore *)v40 roamPolicyMOHandler];
                                uint64_t v59 = [v58 managedObjectContext];
                                uint64_t v60 = +[RoamMO fetchRoamObjects:v57 fetchLimit:1 moc:v59];

                                if (!v60)
                                {
                                  uint64_t v60 = WALogCategoryDeviceStoreHandle();
                                  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_DWORD *)buf = v92;
                                    v138 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
                                    __int16 v139 = 1024;
                                    int v140 = 850;
                                    _os_log_impl(&dword_21D96D000, v60, OS_LOG_TYPE_ERROR, "%{public}s::%d:roamManagedObject is nil", buf, 0x12u);
                                  }
                                  int v82 = 4;
LABEL_78:
                                  uint64_t v26 = v104;
                                  uint64_t v27 = v109;
                                  v79 = v101;
                                  uint64_t v78 = v102;
                                  v80 = v100;

                                  uint64_t v76 = v108;
                                  int v45 = v118;
                                  int v77 = v82;
                                  goto LABEL_79;
                                }
                                v61 = [v60 objectAtIndex:0];
                                if ([v61 cacheChannel])
                                {
                                  v62 = objc_msgSend((id)objc_opt_class(), "makeChanInfoFromChannel:andFlags:", (int)objc_msgSend(v61, "cacheChannel"), (int)objc_msgSend(v61, "cacheChannelFlags"));
                                  unint64_t v63 = (int)[v61 cacheRssiBin];
                                  int v64 = [v61 roamDelta];
                                  v65 = WALogCategoryDeviceStoreHandle();
                                  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                                  {
                                    *(_DWORD *)buf = 136447490;
                                    v138 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
                                    __int16 v139 = 1024;
                                    int v140 = 860;
                                    __int16 v141 = 2112;
                                    id v142 = v57;
                                    __int16 v143 = 2048;
                                    uint64_t v144 = v63;
                                    __int16 v145 = 2112;
                                    unint64_t v146 = (unint64_t)v62;
                                    __int16 v147 = 2048;
                                    id v148 = (id)v64;
                                    _os_log_impl(&dword_21D96D000, v65, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:CacheBssid  %@ CacheRssiBin %ld CacheChannel %@ CacheRoamDelta %ld", buf, 0x3Au);
                                  }

                                  if ([v115 isEqualToString:v57])
                                  {
                                    if (![v62 isEqualToDictionary:v114])
                                    {
                                      v66 = WALogCategoryDeviceStoreHandle();
                                      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                                      {
                                        *(_DWORD *)buf = 136447234;
                                        v138 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
                                        __int16 v139 = 1024;
                                        int v140 = 866;
                                        __int16 v141 = 2112;
                                        id v142 = v57;
                                        __int16 v143 = 2112;
                                        uint64_t v144 = (uint64_t)v62;
                                        __int16 v145 = 2112;
                                        unint64_t v146 = (unint64_t)v118;
                                        _os_log_impl(&dword_21D96D000, v66, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Change in Channel for BSSID %@: CurrentCacheChannel = %@ cacheChannel = %@", buf, 0x30u);
                                      }

                                      [(RoamPolicyStore *)v122 updateNeighborChannelsInCoreDataWith:v114 bssid:v57 ssid:v113];
                                    }
                                    v67 = 0;
                                    int v68 = -10;
                                    while (2)
                                    {
                                      uint64_t v69 = v68;
                                      int v68 = roamCacheRssiLevels[(void)v67 + 1];
                                      [(RoamPolicyStore *)v122 inRange:v69 high:v68 value:v33];
                                      switch((unint64_t)v67)
                                      {
                                        case 0uLL:
                                        case 1uLL:
                                        case 2uLL:
                                        case 3uLL:
                                          v121 = v67;
                                          goto LABEL_50;
                                        case 4uLL:
                                          v121 = v67;
                                          goto LABEL_51;
                                        default:
LABEL_50:
                                          if (++v67 != (char *)5) {
                                            continue;
                                          }
LABEL_51:
                                          if (v121 == (unsigned char *)v63)
                                          {
                                            v70 = WALogCategoryDeviceStoreHandle();
                                            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                                            {
                                              *(_DWORD *)buf = 136447234;
                                              v138 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBs"
                                                     "sid:targetBssid:]";
                                              __int16 v139 = 1024;
                                              int v140 = 893;
                                              __int16 v141 = 2112;
                                              id v142 = v57;
                                              __int16 v143 = 2048;
                                              uint64_t v144 = v63;
                                              __int16 v145 = 2048;
                                              unint64_t v146 = v63;
                                              v71 = v70;
                                              v72 = "%{public}s::%d:No Change in location of the BSS = %@ CurrentRssiLeve"
                                                    "l = %lu cacheRssiBin = %ld";
                                              uint32_t v73 = 48;
                                              goto LABEL_60;
                                            }
                                            goto LABEL_62;
                                          }
                                          uint64_t v74 = v63 - (void)v121;
                                          if ((unint64_t)v121 > v63) {
                                            uint64_t v74 = (uint64_t)&v121[-v63];
                                          }
                                          if (v74 >= 2)
                                          {
                                            v81 = WALogCategoryDeviceStoreHandle();
                                            unint64_t v13 = 0x264465000;
                                            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                                            {
                                              *(_DWORD *)buf = 136447234;
                                              v138 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBs"
                                                     "sid:targetBssid:]";
                                              __int16 v139 = 1024;
                                              int v140 = 897;
                                              __int16 v141 = 2112;
                                              id v142 = v57;
                                              __int16 v143 = 2048;
                                              uint64_t v144 = (uint64_t)v121;
                                              __int16 v145 = 2112;
                                              unint64_t v146 = (unint64_t)v62;
                                              _os_log_impl(&dword_21D96D000, v81, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Deployment Changed: Network %@ is signicantly moved in or an obstacle is taken out.CurrentRssiLevel = %lu cacheChannel = %@", buf, 0x30u);
                                            }

                                            int v82 = 1;
                                            char v98 = 1;
                                            goto LABEL_78;
                                          }
                                          unint64_t v13 = 0x264465000;
                                          if (v74 == 1)
                                          {
                                            v70 = WALogCategoryDeviceStoreHandle();
                                            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                                            {
                                              *(_DWORD *)buf = 136446978;
                                              v138 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBs"
                                                     "sid:targetBssid:]";
                                              __int16 v139 = 1024;
                                              int v140 = 901;
                                              __int16 v141 = 2048;
                                              unint64_t v63 = (unint64_t)v121;
                                              id v142 = v121;
                                              __int16 v143 = 2112;
                                              uint64_t v144 = (uint64_t)v62;
                                              v71 = v70;
                                              v72 = "%{public}s::%d:Deployment did Change but the change is not significa"
                                                    "nt, CurrentRssiLevel = %lu cacheChannel = %@";
                                              uint32_t v73 = 38;
LABEL_60:
                                              _os_log_impl(&dword_21D96D000, v71, OS_LOG_TYPE_DEFAULT, v72, buf, v73);
                                            }
                                            else
                                            {
                                              unint64_t v63 = (unint64_t)v121;
                                            }
LABEL_62:

                                            v121 = (unsigned char *)v63;
                                            goto LABEL_63;
                                          }
                                          break;
                                      }
                                      break;
                                    }
                                  }
                                  else
                                  {
LABEL_63:
                                    unint64_t v13 = 0x264465000;
                                  }
                                }
                                __int16 v40 = v122;

                                uint64_t v55 = v116;
                                int v45 = v118;
                              }

                              ++v56;
                            }
                            while (v56 != v54);
                            uint64_t v75 = [v120 countByEnumeratingWithState:&v123 objects:v135 count:16];
                            uint64_t v54 = v75;
                            if (v75) {
                              continue;
                            }
                            break;
                          }
                        }

                        __int16 v48 = v107;
                        uint64_t v44 = v108;
                        __int16 v52 = v105;
                      }
                    }
                    uint64_t v49 = v112 + 1;
                  }
                  while (v112 + 1 != v110);
                  uint64_t v110 = [v48 countByEnumeratingWithState:&v127 objects:v136 count:16];
                }
                while (v110);
              }
              uint64_t v76 = v44;
              int v77 = 0;
              uint64_t v26 = v104;
              uint64_t v27 = v109;
              v79 = v101;
              uint64_t v78 = v102;
              v80 = v100;
LABEL_79:

              if (v77)
              {

                if (v77 == 4)
                {
                  size_t v85 = v96;
                  __int16 v88 = (void *)v94;
                  char v87 = v98;
                }
                else
                {
                  char v87 = 1;
                  size_t v85 = v96;
                  __int16 v88 = (void *)v94;
                }
                __int16 v86 = v103;
                goto LABEL_98;
              }
              v117 = v103;
              uint64_t v25 = v76;
            }
          }
          ++v27;
        }
        while (v27 != v25);
        uint64_t v83 = [obj countByEnumeratingWithState:&v131 objects:v149 count:16];
        uint64_t v25 = v83;
        if (v83) {
          continue;
        }
        break;
      }
    }
    else
    {
      v117 = 0;
      char v98 = 0;
    }

    __int16 v86 = v117;
    size_t v85 = v96;
    unint64_t v89 = v93;
    __int16 v88 = (void *)v94;
    char v87 = v98;
    goto LABEL_95;
  }
  __int16 v84 = WALogCategoryDeviceStoreHandle();
  size_t v85 = v96;
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v138 = "-[RoamPolicyStore monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:]";
    __int16 v139 = 1024;
    int v140 = 796;
    __int16 v141 = 2112;
    id v142 = v96;
    _os_log_impl(&dword_21D96D000, v84, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:New BSS  %@ Added to the deployment", buf, 0x1Cu);
  }

  __int16 v86 = 0;
  char v87 = 1;
  __int16 v88 = (void *)v94;
LABEL_98:

  return v87 & 1;
}

- (BOOL)buildRoamCacheInfoForNetwork:(id)a3 bssid:(id)a4 numRoamSamples:(unint64_t)a5
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v94 = a3;
  id v8 = a4;
  int v9 = (void *)MEMORY[0x223C0F2E0]();
  __int16 v10 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies buildRoamCacheInfoForNetwork", "", buf, 2u);
  }

  if (+[WAUtil isWildcardMacAddress:v8])
  {
    char v87 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
      __int16 v123 = 1024;
      int v124 = 918;
      __int16 v125 = 2112;
      size_t v126 = (size_t)v8;
      _os_log_impl(&dword_21D96D000, v87, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssid(%@) is the wildcard address!! bailing", buf, 0x1Cu);
    }
    goto LABEL_116;
  }
  v93 = v9;
  bzero(&roamCacheInfo, 0x410uLL);
  id v120 = @"neighborCache";
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v120 count:1];
  v99 = self;
  id v12 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  unint64_t v13 = [v12 managedObjectContext];
  long long v92 = v11;
  BOOL v14 = +[RoamMO fetchRoamProperties:v8 lookForRoamStatus:0 fetchLimit:100 properties:v11 moc:v13];

  id v95 = v14;
  if (!v14)
  {
    int v17 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
      __int16 v123 = 1024;
      int v124 = 936;
      __int16 v125 = 2112;
      size_t v126 = (size_t)v8;
      __int16 v88 = "%{public}s::%d:fetchRoamProperties returned nil for bssid:%@";
      unint64_t v89 = v17;
      uint32_t v90 = 28;
LABEL_113:
      _os_log_impl(&dword_21D96D000, v89, OS_LOG_TYPE_ERROR, v88, buf, v90);
    }
LABEL_114:
    char v87 = v11;
    int v9 = v93;
    goto LABEL_115;
  }
  uint64_t v15 = [v14 count];
  __int16 v16 = WALogCategoryDeviceStoreHandle();
  int v17 = v16;
  if (!v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
      __int16 v123 = 1024;
      int v124 = 940;
      __int16 v88 = "%{public}s::%d:numRoamSamplesCollectedSoFar is 0";
      unint64_t v89 = v17;
      uint32_t v90 = 18;
      goto LABEL_113;
    }
    goto LABEL_114;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
    __int16 v123 = 1024;
    int v124 = 943;
    __int16 v125 = 2048;
    size_t v126 = v15;
    _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Roam Cache Policy: numRoamSamplesCollectedSoFar =%lu", buf, 0x1Cu);
  }

  uint64_t v18 = v99;
  BOOL v91 = [(RoamPolicyStore *)v99 doWeHaveEnoughSamplesToBuildRoamCache:v15 numRoamSamples:a5];
  if (!v91)
  {
    v79 = WALogCategoryDeviceStoreHandle();
    v80 = v11;
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
      __int16 v123 = 1024;
      int v124 = 947;
      __int16 v125 = 2048;
      size_t v126 = v15;
      _os_log_impl(&dword_21D96D000, v79, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Not enough samples to derive policies on RoamCache, Bail out. RoamSamplesCollectedSoFar %lu", buf, 0x1Cu);
    }
    int v9 = v93;
    goto LABEL_102;
  }
  if (![v14 count])
  {
    uint64_t v78 = 0;
    int v77 = v99;
LABEL_97:
    v81 = [(RoamPolicyStore *)v77 roamPolicyMOHandler];
    int v82 = [v81 managedObjectContext];
    v79 = +[BSSMO getInstance:v8 ssid:v94 moc:v82];

    if (v79) {
      [(RoamPolicyStore *)v77 storeNeighborsInfoLearningsFromRoamCacheInfo:v79 neighborCount:v78];
    }
    uint64_t v83 = WALogCategoryDeviceStoreHandle();
    int v9 = v93;
    if (os_signpost_enabled(v83))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21D96D000, v83, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies buildRoamCacheInfoForNetwork", "", buf, 2u);
    }

    v80 = v92;
LABEL_102:
    BOOL v84 = v91;

    goto LABEL_103;
  }
  int v101 = 0;
  uint64_t v102 = 0;
  unint64_t v19 = 0;
  id v20 = v8;
  id v98 = v8;
  do
  {
    uint64_t v21 = [v14 objectAtIndex:v19];
    unint64_t v22 = [v21 valueForKey:@"neighborCache"];
    if (v22)
    {
      id v96 = v21;
      unint64_t v97 = v19;
      v100 = [MEMORY[0x263F089D8] string];
      long long v115 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id obj = v22;
      uint64_t v23 = [obj countByEnumeratingWithState:&v115 objects:v119 count:16];
      if (!v23)
      {
        uint64_t v26 = v18;
        goto LABEL_53;
      }
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v116;
      uint64_t v26 = v18;
      uint64_t v103 = *(void *)v116;
      uint64_t v104 = v22;
      while (1)
      {
        uint64_t v27 = 0;
        uint64_t v105 = v24;
        do
        {
          if (*(void *)v116 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v115 + 1) + 8 * v27);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v29 = v26;
            uint64_t v30 = [(id)objc_opt_class() cleanChannelFlagsIn:v28];
            uint64_t v31 = [v30 objectForKey:@"channel"];
            uint64_t v32 = [v30 objectForKey:@"rssi"];
            uint64_t v33 = [v30 objectForKey:@"bssid"];
            uint64_t v109 = [v30 objectForKey:@"roamDelta"];
            uint64_t v113 = [v31 integerValue];
            __int16 v34 = [v30 objectForKey:@"channelFlags"];
            uint64_t v111 = [v34 integerValue];

            uint64_t v35 = [v32 integerValue];
            if (v20)
            {
              uint64_t v26 = v29;
              if (!v31) {
                goto LABEL_46;
              }
              if (!v32) {
                goto LABEL_46;
              }
              uint64_t v36 = v35;
              if (+[WAUtil isWildcardMacAddress:v33]) {
                goto LABEL_46;
              }
              [v100 appendFormat:@" {%@, %@, %@, %@} ", v33, v32, v31, v109];
              int64_t v37 = WALogCategoryDeviceStoreHandle();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136446722;
                v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
                __int16 v123 = 1024;
                int v124 = 980;
                __int16 v125 = 2112;
                size_t v126 = (size_t)v100;
                _os_log_impl(&dword_21D96D000, v37, OS_LOG_TYPE_DEBUG, "%{public}s::%d:roamCacheStr:%@", buf, 0x1Cu);
              }

              uint64_t v38 = v102;
              if (v102)
              {
                uint32_t v39 = (char *)&roamCacheInfo;
                while (1)
                {
                  __int16 v40 = [NSString stringWithUTF8String:v39];
                  char v41 = [v40 isEqualToString:v33];

                  if (v41) {
                    break;
                  }
                  v39 += 104;
                  if (!--v38) {
                    goto LABEL_33;
                  }
                }
                int v101 = 1;
                uint64_t v44 = v102;
LABEL_36:
                uint64_t v26 = v99;
                if (v44)
                {
                  uint64_t v45 = 0;
                  __int16 v46 = &roamCacheInfo;
                  do
                  {
                    int64_t v47 = [NSString stringWithUTF8String:v46];
                    if ([v33 isEqual:v47])
                    {
                      [(RoamPolicyStore *)v99 locateTheNeighbor:v45 cacheRssi:v36];
                      v46[8] = v113;
                      v46[9] = v111;
                    }

                    ++v45;
                    v46 += 13;
                  }
                  while (v44 != v45);
                  uint64_t v102 = v44;
                  id v20 = v98;
                  uint64_t v26 = v99;
                }
                else
                {
                  uint64_t v102 = 0;
                  id v20 = v98;
                }
                goto LABEL_46;
              }
              if (!v101)
              {
LABEL_33:
                __int16 v42 = (const char *)[v33 UTF8String];
                size_t v43 = strlen(v42);
                if (v43 >= 0x14)
                {
                  __int16 v48 = WALogCategoryDeviceStoreHandle();
                  id v20 = v98;
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136446722;
                    v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
                    __int16 v123 = 1024;
                    int v124 = 1000;
                    __int16 v125 = 2048;
                    size_t v126 = v43;
                    _os_log_impl(&dword_21D96D000, v48, OS_LOG_TYPE_ERROR, "%{public}s::%d:Length exceeded limit:%lu", buf, 0x1Cu);
                  }

                  int v101 = 0;
                  uint64_t v26 = v99;
                  goto LABEL_46;
                }
                memcpy((char *)&roamCacheInfo + 104 * v102, v42, v43);
                int v101 = 0;
                uint64_t v44 = v102 + 1;
                goto LABEL_36;
              }
              uint64_t v102 = 0;
              int v101 = 1;
              id v20 = v98;
              uint64_t v26 = v99;
            }
            else
            {
              uint64_t v26 = v29;
            }
LABEL_46:

            uint64_t v25 = v103;
            unint64_t v22 = v104;
            uint64_t v24 = v105;
          }
          ++v27;
        }
        while (v27 != v24);
        uint64_t v24 = [obj countByEnumeratingWithState:&v115 objects:v119 count:16];
        if (!v24)
        {
LABEL_53:
          uint64_t v18 = v26;

          BOOL v14 = v95;
          uint64_t v21 = v96;
          unint64_t v19 = v97;
          goto LABEL_54;
        }
      }
    }
    uint64_t v49 = WALogCategoryDeviceStoreHandle();
    v100 = v49;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
      __int16 v123 = 1024;
      int v124 = 958;
      _os_log_impl(&dword_21D96D000, v49, OS_LOG_TYPE_INFO, "%{public}s::%d:RoamCache is nil", buf, 0x12u);
    }
LABEL_54:

    ++v19;
  }
  while (v19 < [v14 count]);
  uint64_t v50 = v102;
  if (!v102)
  {
    uint64_t v78 = 0;
    int v77 = v18;
    id v8 = v20;
    goto LABEL_97;
  }
  uint64_t v51 = &roamCacheInfo;
  __int16 v52 = v18;
  while (1)
  {
    uint64_t v110 = v50;
    unint64_t v54 = v51[3];
    unint64_t v53 = v51[4];
    int v55 = v53 > v54;
    if (v53 <= v54) {
      uint64_t v56 = (void *)v51[3];
    }
    else {
      uint64_t v56 = (void *)v51[4];
    }
    unint64_t v58 = v51[5];
    unint64_t v57 = v51[6];
    if (v58 <= (unint64_t)v56) {
      uint64_t v59 = v56;
    }
    else {
      uint64_t v59 = (void *)v51[5];
    }
    if (v58 > (unint64_t)v56) {
      int v55 = 2;
    }
    if (v57 <= (unint64_t)v59) {
      uint64_t v60 = v59;
    }
    else {
      uint64_t v60 = (void *)v51[6];
    }
    if (v57 > (unint64_t)v59) {
      int v55 = 3;
    }
    unint64_t v61 = v51[7];
    id obja = v60;
    if (v61 > (unint64_t)v60) {
      int v55 = 4;
    }
    unsigned int v106 = v55;
    uint64_t v62 = [NSString stringWithUTF8String:v51];
    uint64_t v112 = [(RoamPolicyStore *)v52 roamPolicyMOHandler];
    unint64_t v63 = [v112 managedObjectContext];
    v114 = v62;
    int v64 = +[RoamMO fetchRoamObjects:v62 fetchLimit:1 moc:v63];

    if (!v64) {
      break;
    }
    if (v53 <= v54) {
      unint64_t v65 = 0;
    }
    else {
      unint64_t v65 = v53;
    }
    unint64_t v66 = v65 + v54;
    if (v58 <= (unint64_t)v56) {
      unint64_t v67 = 0;
    }
    else {
      unint64_t v67 = v58;
    }
    unint64_t v68 = v66 + v67;
    if (v57 <= (unint64_t)v59) {
      unint64_t v69 = 0;
    }
    else {
      unint64_t v69 = v57;
    }
    unint64_t v70 = v68 + v69;
    if (v61 <= (unint64_t)obja) {
      unint64_t v71 = 0;
    }
    else {
      unint64_t v71 = v61;
    }
    unint64_t v72 = v70 + v71;
    if (v61 <= (unint64_t)obja) {
      unint64_t v73 = (unint64_t)obja;
    }
    else {
      unint64_t v73 = v61;
    }
    uint64_t v74 = [v64 objectAtIndex:0];
    uint64_t v75 = v74;
    if (v73 >= 50 * v72 / 0x64) {
      [v74 setCacheRssiBin:v106];
    }
    [v75 setCacheChannel:*((__int16 *)v51 + 32)];
    [v75 setCacheChannelFlags:*((__int16 *)v51 + 36)];
    __int16 v52 = v99;
    uint64_t v76 = [(RoamPolicyStore *)v99 roamPolicyMOHandler];
    [v76 updateManagedObjectContextWithoutSave];

    v51 += 13;
    uint64_t v50 = v110 - 1;
    if (v110 == 1)
    {
      id v8 = v98;
      int v77 = v99;
      uint64_t v78 = v102;
      goto LABEL_97;
    }
  }
  __int16 v86 = WALogCategoryDeviceStoreHandle();
  id v8 = v98;
  if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v122 = "-[RoamPolicyStore buildRoamCacheInfoForNetwork:bssid:numRoamSamples:]";
    __int16 v123 = 1024;
    int v124 = 1055;
    _os_log_impl(&dword_21D96D000, v86, OS_LOG_TYPE_ERROR, "%{public}s::%d:roamManagedObject is nil", buf, 0x12u);
  }

  char v87 = v92;
  int v9 = v93;
  int v17 = v114;
LABEL_115:

LABEL_116:
  v80 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v80))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v80, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RoamingPolicies buildRoamCacheInfoForNetwork", "", buf, 2u);
  }
  BOOL v84 = 0;
LABEL_103:

  return v84;
}

- (void)locateTheNeighbor:(unint64_t)a3 cacheRssi:(int64_t)a4
{
  uint64_t v6 = 0;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = (char *)&roamCacheInfo + 104 * a3;
  id v8 = v7 + 56;
  int v9 = v7 + 24;
  __int16 v10 = v7 + 48;
  uint64_t v11 = v7 + 40;
  id v12 = v7 + 32;
  int v13 = -10;
  do
  {
    uint64_t v14 = v13;
    int v13 = roamCacheRssiLevels[v6 + 1];
    [(RoamPolicyStore *)self inRange:v14 high:v13 value:a4];
    uint64_t v15 = v9;
    switch(v6)
    {
      case 0:
        goto LABEL_7;
      case 1:
        uint64_t v15 = v12;
        goto LABEL_7;
      case 2:
        uint64_t v15 = v11;
        goto LABEL_7;
      case 3:
        uint64_t v15 = v10;
        goto LABEL_7;
      case 4:
        uint64_t v15 = v8;
LABEL_7:
        ++*v15;
        break;
      default:
        break;
    }
    ++v6;
  }
  while (v6 != 8);
  __int16 v16 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = [NSString stringWithUTF8String:(char *)&roamCacheInfo + 104 * a3];
    uint64_t v18 = *v9;
    uint64_t v19 = *v12;
    uint64_t v20 = *v11;
    uint64_t v21 = *v10;
    uint64_t v22 = *v8;
    *(_DWORD *)buf = 136448258;
    uint64_t v25 = "-[RoamPolicyStore locateTheNeighbor:cacheRssi:]";
    __int16 v26 = 1024;
    int v27 = 1110;
    __int16 v28 = 2112;
    uint64_t v29 = v17;
    __int16 v30 = 2048;
    int64_t v31 = a4;
    __int16 v32 = 2048;
    uint64_t v33 = v18;
    __int16 v34 = 2048;
    uint64_t v35 = v19;
    __int16 v36 = 2048;
    uint64_t v37 = v20;
    __int16 v38 = 2048;
    uint64_t v39 = v21;
    __int16 v40 = 2048;
    uint64_t v41 = v22;
    _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_INFO, "%{public}s::%d:BSS =%@ BSSCacheRSSI =%ld HighRSSI =%ld MidRssi =%ld UpperMid =%ld LowRssi =%ld ReallyLow =%ld", buf, 0x58u);
  }
}

- (void)resetAdaptiveRoamingStateMachine:(id)a3 bssid:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x223C0F2E0]();
  int v9 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  __int16 v10 = [v9 managedObjectContext];
  uint64_t v11 = +[BSSMO getInstance:v7 ssid:v6 moc:v10];

  if (v11)
  {
    [v11 setRoamTriggerRssi:4294967168];
    [v11 setNeighborChannels:0];
    id v12 = [(RoamPolicyStore *)self roamPolicyMOHandler];
    [v12 updateManagedObjectContextWithoutSave];
  }
  else
  {
    id v12 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      uint64_t v14 = "-[RoamPolicyStore resetAdaptiveRoamingStateMachine:bssid:]";
      __int16 v15 = 1024;
      int v16 = 1120;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for %@[%@]", (uint8_t *)&v13, 0x26u);
    }
  }
}

- (void)updateNeighborChannelsInCoreDataWith:(id)a3 bssid:(id)a4 ssid:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x223C0F2E0]();
  id v12 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  int v13 = [v12 managedObjectContext];
  uint64_t v14 = +[BSSMO getInstance:v9 ssid:v10 moc:v13];

  if (v14)
  {
    __int16 v15 = (void *)MEMORY[0x263EFF9C0];
    int v16 = +[RoamPolicyStore neighborChannelsAsArray:log:For:](RoamPolicyStore, "neighborChannelsAsArray:log:For:", v14, 0, "-[RoamPolicyStore updateNeighborChannelsInCoreDataWith:bssid:ssid:]");
    __int16 v17 = [v15 setWithArray:v16];

    [v17 addObject:v8];
    id v18 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      [v8 objectForKeyedSubscript:@"channel"];
      __int16 v19 = v22 = v11;
      id v20 = [(id)objc_opt_class() bandFromChInfo:v8];
      *(_DWORD *)buf = 136447490;
      uint64_t v24 = "-[RoamPolicyStore updateNeighborChannelsInCoreDataWith:bssid:ssid:]";
      __int16 v25 = 1024;
      int v26 = 1148;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      id v30 = v10;
      __int16 v31 = 2112;
      __int16 v32 = v19;
      __int16 v33 = 2112;
      __int16 v34 = v20;
      _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:[BSS:%@ SSID:%@] Added Channel %@ Band %@", buf, 0x3Au);

      uint64_t v11 = v22;
    }

    [v14 setNeighborChannels:v17];
    uint64_t v21 = [(RoamPolicyStore *)self roamPolicyMOHandler];
    [v21 updateManagedObjectContextWithoutSave];
  }
  else
  {
    __int16 v17 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v24 = "-[RoamPolicyStore updateNeighborChannelsInCoreDataWith:bssid:ssid:]";
      __int16 v25 = 1024;
      int v26 = 1144;
      __int16 v27 = 2112;
      id v28 = v10;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for %@[%@]", buf, 0x26u);
    }
  }
}

- (BOOL)checkForNewBSSAddition:(id)a3 bssid:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  id v9 = [v8 managedObjectContext];
  id v10 = +[BSSMO getInstance:v6 ssid:v7 moc:v9];

  return v10 == 0;
}

- (void)storeNeighborsInfoLearningsFromRoamInfo:(id)a3 neighborCount:(unint64_t)a4
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v68 = a3;
  uint64_t v59 = (void *)MEMORY[0x223C0F2E0]();
  id v5 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
    __int16 v82 = 1024;
    int v83 = 1177;
    __int16 v84 = 2048;
    unint64_t v85 = a4;
    _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:neighborCount: %lu", buf, 0x1Cu);
  }
  unint64_t v62 = a4;

  if (!v68)
  {
    int v55 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136446466;
    v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
    __int16 v82 = 1024;
    int v83 = 1179;
    uint64_t v56 = "%{public}s::%d:bssMO nil";
    goto LABEL_34;
  }
  if (!a4)
  {
    int v55 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136446466;
    v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
    __int16 v82 = 1024;
    int v83 = 1180;
    uint64_t v56 = "%{public}s::%d:neighborCount is 0";
LABEL_34:
    unint64_t v57 = v55;
    uint32_t v58 = 18;
    goto LABEL_37;
  }
  if (a4 >= 0xA)
  {
    int v55 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136446722;
    v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
    __int16 v82 = 1024;
    int v83 = 1181;
    __int16 v84 = 2048;
    unint64_t v85 = a4;
    uint64_t v56 = "%{public}s::%d:neighborCount %lu greater than kMaxNumOfNeighbors.. bailing";
    unint64_t v57 = v55;
    uint32_t v58 = 28;
LABEL_37:
    _os_log_impl(&dword_21D96D000, v57, OS_LOG_TYPE_ERROR, v56, buf, v58);
    goto LABEL_29;
  }
  unint64_t v69 = objc_msgSend(MEMORY[0x263EFF980], "array", v59);
  unint64_t v61 = +[BSSMO bssManagedObjectPropertyValue:v68 forKey:@"NeighborInfo"];
  if (v61)
  {
    unint64_t v72 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:");
    if (!v72)
    {
      unint64_t v72 = 0;
      goto LABEL_14;
    }
    id v6 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [v72 count];
      id v8 = [v68 bssid];
      *(_DWORD *)buf = 136446978;
      v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
      __int16 v82 = 1024;
      int v83 = 1189;
      __int16 v84 = 2048;
      unint64_t v85 = v7;
      __int16 v86 = 2112;
      id v87 = v8;
      _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Prev Neighbor count:%lu for BSSID:%@", buf, 0x26u);
    }
  }
  else
  {
    unint64_t v72 = [MEMORY[0x263EFF980] array];
    id v6 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [v68 bssid];
      *(_DWORD *)buf = 136446722;
      v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
      __int16 v82 = 1024;
      int v83 = 1193;
      __int16 v84 = 2112;
      unint64_t v85 = (unint64_t)v9;
      _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:No Neighbor Info for BSSID:%@", buf, 0x1Cu);
    }
  }

LABEL_14:
  id v10 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [v68 bssid];
    *(_DWORD *)buf = 136446978;
    v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
    __int16 v82 = 1024;
    int v83 = 1196;
    __int16 v84 = 2048;
    unint64_t v85 = v62;
    __int16 v86 = 2112;
    id v87 = v11;
    _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_DEBUG, "%{public}s::%d:new Neighbor count:%lu  Info for BSSID:%@", buf, 0x26u);
  }
  id v12 = &roamInfo;
  unint64_t v71 = v62;
  do
  {
    context = (void *)MEMORY[0x223C0F2E0]();
    int v13 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v14 = [NSString stringWithUTF8String:v12];
    [v13 setValue:v14 forKey:@"NeighborBssid"];

    __int16 v15 = [NSNumber numberWithUnsignedInteger:v12[3]];
    [v13 setValue:v15 forKey:@"NeighborBssNumRoamDueToLowRssi"];

    int v16 = [NSNumber numberWithUnsignedInteger:v12[4]];
    [v13 setValue:v16 forKey:@"NeighborBssNumRoamDueToBTM"];

    __int16 v17 = [NSNumber numberWithUnsignedInteger:v12[5]];
    [v13 setValue:v17 forKey:@"NeighborBssNumRoamDueToLazyScan"];

    id v18 = [NSNumber numberWithUnsignedInteger:v12[6]];
    [v13 setValue:v18 forKey:@"NeighborBssNumRoamDueToBeaconLoss"];

    __int16 v19 = [NSNumber numberWithUnsignedInteger:v12[7]];
    [v13 setValue:v19 forKey:@"NeighborBssNumRoamDueToLinkLossSuppression"];

    id v20 = [NSNumber numberWithUnsignedInteger:v12[8]];
    [v13 setValue:v20 forKey:@"NeighborBssNumRoamDueToFastRoamFailure"];

    uint64_t v21 = [NSNumber numberWithUnsignedInteger:v12[9]];
    [v13 setValue:v21 forKey:@"NeighborBssNumRoamDueToTSpecRejection"];

    uint64_t v22 = [NSNumber numberWithUnsignedInteger:v12[10]];
    [v13 setValue:v22 forKey:@"NeighborBssNumRoamDueToMinTxRate"];

    uint64_t v23 = [NSNumber numberWithUnsignedInteger:v12[11]];
    [v13 setValue:v23 forKey:@"NeighborBssNumRoamDueToAsymmetricChannel"];

    uint64_t v24 = [NSNumber numberWithUnsignedInteger:v12[12]];
    [v13 setValue:v24 forKey:@"NeighborBssNumRoamDueToLowRssiAndChannelUsage"];

    __int16 v25 = [NSNumber numberWithUnsignedInteger:v12[13]];
    [v13 setValue:v25 forKey:@"NeighborBssNumRoamDueToRadar"];

    int v26 = [NSNumber numberWithUnsignedInteger:v12[14]];
    [v13 setValue:v26 forKey:@"NeighborBssNumRoamDueToCSA"];

    __int16 v27 = [NSNumber numberWithUnsignedInteger:v12[15]];
    [v13 setValue:v27 forKey:@"NeighborBssNumRoamDueToEstimatedTPutLow"];

    id v28 = [NSNumber numberWithUnsignedInteger:v12[16]];
    [v13 setValue:v28 forKey:@"NeighborBssNumRoamDueToSilentRoam"];

    __int16 v29 = [NSNumber numberWithUnsignedInteger:v12[17]];
    [v13 setValue:v29 forKey:@"NeighborBssNumRoamDueToInactivity"];

    id v30 = [NSNumber numberWithUnsignedInteger:v12[18]];
    [v13 setValue:v30 forKey:@"NeighborBssNumRoamDueToRoamScanTimeout"];

    __int16 v31 = [NSNumber numberWithInteger:v12[19]];
    [v13 setValue:v31 forKey:@"NeighborBssNumRoamOriginRssiHigh"];

    __int16 v32 = [NSNumber numberWithInteger:v12[20]];
    [v13 setValue:v32 forKey:@"NeighborBssNumRoamOriginRssiUpperHigh"];

    __int16 v33 = [NSNumber numberWithInteger:v12[21]];
    [v13 setValue:v33 forKey:@"NeighborBssNumRoamOriginRssiOptimum"];

    __int16 v34 = [NSNumber numberWithInteger:v12[22]];
    [v13 setValue:v34 forKey:@"NeighborBssNumRoamOriginRssiUpperOptimum"];

    uint64_t v35 = [NSNumber numberWithInteger:v12[23]];
    [v13 setValue:v35 forKey:@"NeighborBssNumRoamOriginRssiMid"];

    __int16 v36 = [NSNumber numberWithInteger:v12[24]];
    [v13 setValue:v36 forKey:@"NeighborBssNumRoamOriginRssiUpperMid"];

    uint64_t v37 = [NSNumber numberWithInteger:v12[25]];
    [v13 setValue:v37 forKey:@"NeighborBssNumRoamOriginRssiLow"];

    __int16 v38 = [NSNumber numberWithInteger:v12[26]];
    [v13 setValue:v38 forKey:@"NeighborBssNumLazyRoamOriginRssiHigh"];

    uint64_t v39 = [NSNumber numberWithInteger:v12[27]];
    [v13 setValue:v39 forKey:@"NeighborBssNumLazyRoamOriginRssiUpperHigh"];

    __int16 v40 = [NSNumber numberWithInteger:v12[28]];
    [v13 setValue:v40 forKey:@"NeighborBssNumLazyRoamOriginRssiOptimum"];

    uint64_t v41 = [NSNumber numberWithInteger:v12[29]];
    [v13 setValue:v41 forKey:@"NeighborBssNumLazyRoamOriginRssiUpperOptimum"];

    uint64_t v42 = [NSNumber numberWithInteger:v12[30]];
    [v13 setValue:v42 forKey:@"NeighborBssNumLazyRoamOriginRssiMid"];

    size_t v43 = [NSString stringWithUTF8String:v12];
    if (v72 && [v72 count])
    {
      uint64_t v76 = 0;
      int v77 = &v76;
      uint64_t v78 = 0x2020000000;
      uint64_t v79 = -1;
      v73[0] = MEMORY[0x263EF8330];
      v73[1] = 3221225472;
      v73[2] = __73__RoamPolicyStore_storeNeighborsInfoLearningsFromRoamInfo_neighborCount___block_invoke;
      v73[3] = &unk_264467598;
      id v44 = v43;
      id v74 = v44;
      uint64_t v75 = &v76;
      [v72 enumerateObjectsUsingBlock:v73];
      if (v77[3] != -1)
      {
        unint64_t v67 = objc_msgSend(v72, "objectAtIndex:");
        uint64_t v45 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:");
        [v45 addEntriesFromDictionary:v13];
        [v72 replaceObjectAtIndex:v77[3] withObject:v45];
        __int16 v46 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v64 = v77[3];
          log = v46;
          id v63 = [v45 valueForKey:@"NeighborBssNumRoamOriginRssiHigh"];
          id v66 = [v45 valueForKey:@"NeighborBssNumRoamOriginRssiUpperHigh"];
          id v47 = [v45 valueForKey:@"NeighborBssNumRoamOriginRssiOptimum"];
          id v48 = [v45 valueForKey:@"NeighborBssNumRoamOriginRssiMid"];
          id v49 = [v45 valueForKey:@"NeighborBssNumRoamOriginRssiUpperMid"];
          uint64_t v50 = [v45 valueForKey:@"NeighborBssNumRoamOriginRssiLow"];
          *(_DWORD *)buf = 136448514;
          v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
          __int16 v82 = 1024;
          int v83 = 1265;
          __int16 v84 = 2048;
          unint64_t v85 = v64;
          __int16 v86 = 2112;
          id v87 = v44;
          __int16 v88 = 2112;
          id v89 = v63;
          __int16 v90 = 2112;
          id v91 = v66;
          __int16 v92 = 2112;
          id v93 = v47;
          __int16 v94 = 2112;
          id v95 = v48;
          __int16 v96 = 2112;
          id v97 = v49;
          __int16 v98 = 2112;
          v99 = v50;
          _os_log_impl(&dword_21D96D000, log, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Replaced index %lu with Neighbor:%@ LowRssiRoam (High:%@ UpperHigh:%@ Opt:%@ Mid:%@ UpperMid:%@ Low:%@)", buf, 0x62u);

          __int16 v46 = log;
        }

        _Block_object_dispose(&v76, 8);
        goto LABEL_27;
      }

      _Block_object_dispose(&v76, 8);
    }
    uint64_t v51 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      __int16 v52 = [v68 bssid];
      *(_DWORD *)buf = 136446978;
      v81 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamInfo:neighborCount:]";
      __int16 v82 = 1024;
      int v83 = 1270;
      __int16 v84 = 2112;
      unint64_t v85 = (unint64_t)v52;
      __int16 v86 = 2112;
      id v87 = v43;
      _os_log_impl(&dword_21D96D000, v51, OS_LOG_TYPE_DEBUG, "%{public}s::%d:New Neighbor for BSSID:%@ --- %@", buf, 0x26u);
    }
    [v69 addObject:v13];
LABEL_27:

    v12 += 44;
    --v71;
  }
  while (v71);
  [v72 addObjectsFromArray:v69];
  unint64_t v53 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  [v53 setBssManagedObjectPropertyValueForKeyWithoutSave:v68 forKey:@"NeighborInfo" withValue:v72];

  unint64_t v54 = [v68 bssid];
  [(RoamPolicyStore *)self setDeploymentFromRoamInfo:v54 neighborCount:v62];

  int v55 = v69;
LABEL_29:
}

void __73__RoamPolicyStore_storeNeighborsInfoLearningsFromRoamInfo_neighborCount___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a2)
  {
    id v7 = [a2 valueForKey:@"NeighborBssid"];
    if ([v7 isEqualToString:*(void *)(a1 + 32)])
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
  }
}

- (void)storeNeighborsInfoLearningsFromRoamCacheInfo:(id)a3 neighborCount:(unint64_t)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v40 = a3;
  context = (void *)MEMORY[0x223C0F2E0]();
  id v5 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
    __int16 v52 = 1024;
    int v53 = 1291;
    __int16 v54 = 2048;
    unint64_t v55 = a4;
    _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:neighborCount: %lu", buf, 0x1Cu);
  }
  unint64_t v39 = a4;

  if (!v40)
  {
    __int16 v32 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
    __int16 v52 = 1024;
    int v53 = 1293;
    __int16 v33 = "%{public}s::%d:bssMO nil";
    goto LABEL_34;
  }
  if (!a4)
  {
    __int16 v32 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
    __int16 v52 = 1024;
    int v53 = 1294;
    __int16 v33 = "%{public}s::%d:neighborCount is 0";
LABEL_34:
    __int16 v34 = v32;
    uint32_t v35 = 18;
    goto LABEL_37;
  }
  if (a4 >= 0xA)
  {
    __int16 v32 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136446722;
    uint64_t v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
    __int16 v52 = 1024;
    int v53 = 1295;
    __int16 v54 = 2048;
    unint64_t v55 = a4;
    __int16 v33 = "%{public}s::%d:neighborCount %lu greater than kMaxNumOfNeighbors.. bailing";
    __int16 v34 = v32;
    uint32_t v35 = 28;
LABEL_37:
    _os_log_impl(&dword_21D96D000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
    goto LABEL_29;
  }
  uint64_t v41 = [MEMORY[0x263EFF980] array];
  uint64_t v37 = +[BSSMO bssManagedObjectPropertyValue:v40 forKey:@"NeighborInfo"];
  if (v37)
  {
    uint64_t v42 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:");
    if (!v42)
    {
      uint64_t v42 = 0;
      goto LABEL_14;
    }
    id v6 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [v42 count];
      id v8 = [v40 bssid];
      *(_DWORD *)buf = 136447234;
      uint64_t v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
      __int16 v52 = 1024;
      int v53 = 1303;
      __int16 v54 = 2048;
      unint64_t v55 = v7;
      __int16 v56 = 2112;
      unint64_t v57 = v8;
      __int16 v58 = 2112;
      uint64_t v59 = v42;
      _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Prev Neighbor count:%lu  Info for BSSID:%@ --- %@", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v42 = [MEMORY[0x263EFF980] array];
    id v6 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [v40 bssid];
      *(_DWORD *)buf = 136446722;
      uint64_t v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
      __int16 v52 = 1024;
      int v53 = 1307;
      __int16 v54 = 2112;
      unint64_t v55 = (unint64_t)v9;
      _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:No Neighbor Info for BSSID:%@", buf, 0x1Cu);
    }
  }

LABEL_14:
  id v10 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v40 bssid];
    *(_DWORD *)buf = 136446978;
    uint64_t v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
    __int16 v52 = 1024;
    int v53 = 1310;
    __int16 v54 = 2048;
    unint64_t v55 = v39;
    __int16 v56 = 2112;
    unint64_t v57 = v11;
    _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:new Neighbor count:%lu  Info for BSSID:%@", buf, 0x26u);
  }
  id v12 = &roamCacheInfo;
  unint64_t v13 = v39;
  do
  {
    uint64_t v14 = (void *)MEMORY[0x223C0F2E0]();
    __int16 v15 = [MEMORY[0x263EFF9A0] dictionary];
    int v16 = [NSString stringWithUTF8String:v12];
    [v15 setValue:v16 forKey:@"NeighborBssid"];

    __int16 v17 = [NSNumber numberWithUnsignedInteger:v12[3]];
    [v15 setValue:v17 forKey:@"NeighborBssNumRoamCacheRssiHigh"];

    id v18 = [NSNumber numberWithUnsignedInteger:v12[4]];
    [v15 setValue:v18 forKey:@"NeighborBssNumRoamCacheRssiMid"];

    __int16 v19 = [NSNumber numberWithUnsignedInteger:v12[5]];
    [v15 setValue:v19 forKey:@"NeighborBssNumRoamCacheRssiUpperMid"];

    id v20 = [NSNumber numberWithUnsignedInteger:v12[6]];
    [v15 setValue:v20 forKey:@"NeighborBssNumRoamCacheRssiLow"];

    uint64_t v21 = [NSNumber numberWithUnsignedInteger:v12[7]];
    [v15 setValue:v21 forKey:@"NeighborBssNumRoamCacheRssiReallyLow"];

    uint64_t v22 = [NSString stringWithUTF8String:v12];
    if (v42 && [v42 count])
    {
      uint64_t v46 = 0;
      id v47 = &v46;
      uint64_t v48 = 0x2020000000;
      uint64_t v49 = -1;
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __78__RoamPolicyStore_storeNeighborsInfoLearningsFromRoamCacheInfo_neighborCount___block_invoke;
      v43[3] = &unk_264467598;
      id v23 = v22;
      id v44 = v23;
      uint64_t v45 = &v46;
      [v42 enumerateObjectsUsingBlock:v43];
      if (v47[3] != -1)
      {
        uint64_t v24 = objc_msgSend(v42, "objectAtIndex:");
        __int16 v25 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v24];
        [v25 addEntriesFromDictionary:v15];
        [v42 replaceObjectAtIndex:v47[3] withObject:v25];
        int v26 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          __int16 v27 = (void *)v47[3];
          *(_DWORD *)buf = 136446978;
          uint64_t v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
          __int16 v52 = 1024;
          int v53 = 1347;
          __int16 v54 = 2112;
          unint64_t v55 = (unint64_t)v23;
          __int16 v56 = 2048;
          unint64_t v57 = v27;
          _os_log_impl(&dword_21D96D000, v26, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Replaced neighbor %@ dict at existing array index %lu", buf, 0x26u);
        }

        _Block_object_dispose(&v46, 8);
        goto LABEL_27;
      }

      _Block_object_dispose(&v46, 8);
    }
    id v28 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v29 = [v40 bssid];
      *(_DWORD *)buf = 136446978;
      uint64_t v51 = "-[RoamPolicyStore storeNeighborsInfoLearningsFromRoamCacheInfo:neighborCount:]";
      __int16 v52 = 1024;
      int v53 = 1352;
      __int16 v54 = 2112;
      unint64_t v55 = (unint64_t)v29;
      __int16 v56 = 2112;
      unint64_t v57 = v22;
      _os_log_impl(&dword_21D96D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:New Neighbor for BSSID:%@ --- %@", buf, 0x26u);
    }
    [v41 addObject:v15];
LABEL_27:

    v12 += 13;
    --v13;
  }
  while (v13);
  [v42 addObjectsFromArray:v41];
  id v30 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  [v30 setBssManagedObjectPropertyValueForKeyWithoutSave:v40 forKey:@"NeighborInfo" withValue:v42];

  __int16 v31 = [v40 bssid];
  [(RoamPolicyStore *)self setDeploymentFromRoamCacheInfo:v31 neighborCount:v39];

  __int16 v32 = v41;
LABEL_29:
}

void __78__RoamPolicyStore_storeNeighborsInfoLearningsFromRoamCacheInfo_neighborCount___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a2)
  {
    id v7 = [a2 valueForKey:@"NeighborBssid"];
    if ([v7 isEqualToString:*(void *)(a1 + 32)])
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
  }
}

- (void)setDeploymentFromRoamInfo:(id)a3 neighborCount:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x223C0F2E0]();
  if (!v6)
  {
    id v8 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v19 = 136446466;
    id v20 = "-[RoamPolicyStore setDeploymentFromRoamInfo:neighborCount:]";
    __int16 v21 = 1024;
    int v22 = 1371;
    int v16 = "%{public}s::%d:bssid nil";
    __int16 v17 = v8;
    uint32_t v18 = 18;
LABEL_16:
    _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v19, v18);
    goto LABEL_11;
  }
  if (a4 >= 0xA)
  {
    id v8 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v19 = 136446722;
    id v20 = "-[RoamPolicyStore setDeploymentFromRoamInfo:neighborCount:]";
    __int16 v21 = 1024;
    int v22 = 1372;
    __int16 v23 = 2048;
    unint64_t v24 = a4;
    int v16 = "%{public}s::%d:neighborCount %lu greater than kMaxNumOfNeighbors.. bailing";
    __int16 v17 = v8;
    uint32_t v18 = 28;
    goto LABEL_16;
  }
  id v8 = [MEMORY[0x263EFF9C0] set];
  [v8 addObject:v6];
  if (a4)
  {
    id v9 = (char *)&roamInfo;
    unint64_t v10 = a4;
    do
    {
      uint64_t v11 = [NSString stringWithUTF8String:v9];
      if (v11) {
        [v8 addObject:v11];
      }

      v9 += 352;
      --v10;
    }
    while (v10);
  }
  id v12 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 136447234;
    id v20 = "-[RoamPolicyStore setDeploymentFromRoamInfo:neighborCount:]";
    __int16 v21 = 1024;
    int v22 = 1384;
    __int16 v23 = 2112;
    unint64_t v24 = (unint64_t)v6;
    __int16 v25 = 2048;
    unint64_t v26 = a4;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:bssid:%@ neighborCount: %lu neigbors: %@", (uint8_t *)&v19, 0x30u);
  }

  unint64_t v13 = [v8 allObjects];
  uint64_t v14 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  __int16 v15 = [v14 managedObjectContext];
  +[BSSMO coalesceBssidsIntoDeployment:v13 moc:v15];

LABEL_11:
}

- (void)setDeploymentFromRoamCacheInfo:(id)a3 neighborCount:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x223C0F2E0]();
  if (!v6)
  {
    id v8 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v19 = 136446466;
    id v20 = "-[RoamPolicyStore setDeploymentFromRoamCacheInfo:neighborCount:]";
    __int16 v21 = 1024;
    int v22 = 1396;
    int v16 = "%{public}s::%d:bssid nil";
    __int16 v17 = v8;
    uint32_t v18 = 18;
LABEL_16:
    _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v19, v18);
    goto LABEL_11;
  }
  if (a4 >= 0xA)
  {
    id v8 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v19 = 136446722;
    id v20 = "-[RoamPolicyStore setDeploymentFromRoamCacheInfo:neighborCount:]";
    __int16 v21 = 1024;
    int v22 = 1397;
    __int16 v23 = 2048;
    unint64_t v24 = a4;
    int v16 = "%{public}s::%d:neighborCount %lu greater than kMaxNumOfNeighbors.. bailing";
    __int16 v17 = v8;
    uint32_t v18 = 28;
    goto LABEL_16;
  }
  id v8 = [MEMORY[0x263EFF9C0] set];
  [v8 addObject:v6];
  if (a4)
  {
    id v9 = (char *)&roamCacheInfo;
    unint64_t v10 = a4;
    do
    {
      uint64_t v11 = [NSString stringWithUTF8String:v9];
      if (v11) {
        [v8 addObject:v11];
      }

      v9 += 104;
      --v10;
    }
    while (v10);
  }
  id v12 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 136446978;
    id v20 = "-[RoamPolicyStore setDeploymentFromRoamCacheInfo:neighborCount:]";
    __int16 v21 = 1024;
    int v22 = 1409;
    __int16 v23 = 2048;
    unint64_t v24 = a4;
    __int16 v25 = 2112;
    unint64_t v26 = v8;
    _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:neighborCount: %lu neigbors: %@", (uint8_t *)&v19, 0x26u);
  }

  unint64_t v13 = [v8 allObjects];
  uint64_t v14 = [(RoamPolicyStore *)self roamPolicyMOHandler];
  __int16 v15 = [v14 managedObjectContext];
  +[BSSMO coalesceBssidsIntoDeployment:v13 moc:v15];

LABEL_11:
}

+ (id)rangeStringWithRssiLevel:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3 >= 8)
  {
    id v12 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v14 = "+[RoamPolicyStore rangeStringWithRssiLevel:]";
      __int16 v15 = 1024;
      int v16 = 1422;
      _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:invalid level nil", buf, 0x12u);
    }

    unint64_t v10 = 0;
  }
  else
  {
    v3 = &roamOriginRssiLevels[a3];
    uint64_t v4 = *v3;
    id v5 = NSString;
    id v6 = [NSNumber numberWithInteger:v3[1]];
    id v7 = [v6 stringValue];
    id v8 = [NSNumber numberWithInteger:v4];
    id v9 = [v8 stringValue];
    unint64_t v10 = [v5 stringWithFormat:@"[%@,%@]", v7, v9];
  }
  return v10;
}

- (void)deriveRoamDeltaFromRoamCacheInfo:(id)a3 neighborCount:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x223C0F2E0]();
  if (!v5)
  {
    id v7 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v15 = 136446466;
    int v16 = "-[RoamPolicyStore deriveRoamDeltaFromRoamCacheInfo:neighborCount:]";
    __int16 v17 = 1024;
    int v18 = 1438;
    id v12 = "%{public}s::%d:bssid nil";
    unint64_t v13 = v7;
    uint32_t v14 = 18;
LABEL_16:
    _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v15, v14);
    goto LABEL_11;
  }
  if (a4 >= 0xA)
  {
    id v7 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v15 = 136446722;
    int v16 = "-[RoamPolicyStore deriveRoamDeltaFromRoamCacheInfo:neighborCount:]";
    __int16 v17 = 1024;
    int v18 = 1439;
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    id v12 = "%{public}s::%d:neighborCount %lu greater than kMaxNumOfNeighbors.. bailing";
    unint64_t v13 = v7;
    uint32_t v14 = 28;
    goto LABEL_16;
  }
  id v7 = [MEMORY[0x263EFF9C0] set];
  [v7 addObject:v5];
  if (a4)
  {
    id v8 = (char *)&roamCacheInfo;
    unint64_t v9 = a4;
    do
    {
      unint64_t v10 = [NSString stringWithUTF8String:v8];
      if (v10) {
        [v7 addObject:v10];
      }

      v8 += 104;
      --v9;
    }
    while (v9);
  }
  uint64_t v11 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136446978;
    int v16 = "-[RoamPolicyStore deriveRoamDeltaFromRoamCacheInfo:neighborCount:]";
    __int16 v17 = 1024;
    int v18 = 1451;
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    __int16 v21 = 2112;
    int v22 = v7;
    _os_log_impl(&dword_21D96D000, v11, OS_LOG_TYPE_DEBUG, "%{public}s::%d:neighborCount: %lu neigbors: %@", (uint8_t *)&v15, 0x26u);
  }

LABEL_11:
}

+ (id)cleanChannelFlagsIn:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = [v3 dictionaryWithDictionary:v4];
  id v6 = [v4 objectForKeyedSubscript:@"channelFlags"];

  LODWORD(v4) = [v6 unsignedIntValue] & 0x2018;
  id v7 = [NSNumber numberWithUnsignedInt:v4 | 2];
  [v5 setObject:v7 forKeyedSubscript:@"channelFlags"];

  return v5;
}

+ (id)makeChanInfoFromChannel:(int64_t)a3 andFlags:(int64_t)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = 18;
  if (a3 < 15) {
    uint64_t v5 = 10;
  }
  if (a4) {
    int64_t v6 = a4;
  }
  else {
    int64_t v6 = v5;
  }
  v12[0] = @"channel";
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:");
  v13[0] = v7;
  v12[1] = @"channelFlags";
  id v8 = [NSNumber numberWithInteger:v6];
  v13[1] = v8;
  unint64_t v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  unint64_t v10 = [a1 cleanChannelFlagsIn:v9];

  return v10;
}

+ (id)convertChannelList:(id)a3 log:(BOOL)a4 For:(const char *)a5
{
  BOOL v5 = a4;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v45 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v32;
    *(void *)&long long v11 = 136446978;
    long long v28 = v11;
    do
    {
      uint64_t v14 = 0;
      uint64_t v29 = v12;
      do
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v9);
        }
        int v15 = *(void **)(*((void *)&v31 + 1) + 8 * v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = objc_msgSend((id)objc_opt_class(), "makeChanInfoFromChannel:andFlags:", objc_msgSend(v15, "integerValue"), 0);
LABEL_10:
          __int16 v17 = v16;
          if (v5)
          {
            int v18 = WALogCategoryDeviceStoreHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v19 = [v17 objectForKeyedSubscript:@"channel"];
              [a1 bandFromChInfo:v17];
              uint64_t v20 = v13;
              id v21 = a1;
              int v22 = v8;
              BOOL v23 = v5;
              v25 = id v24 = v9;
              *(_DWORD *)buf = 136447234;
              __int16 v36 = "+[RoamPolicyStore convertChannelList:log:For:]";
              __int16 v37 = 1024;
              int v38 = 1519;
              __int16 v39 = 2080;
              id v40 = a5;
              __int16 v41 = 2112;
              uint64_t v42 = v19;
              __int16 v43 = 2112;
              id v44 = v25;
              _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:[%s] - Channel %@ Band %@", buf, 0x30u);

              id v9 = v24;
              BOOL v5 = v23;
              id v8 = v22;
              a1 = v21;
              uint64_t v13 = v20;
              uint64_t v12 = v29;
            }
          }
          objc_msgSend(v8, "addObject:", v17, v28);
          goto LABEL_15;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = [(id)objc_opt_class() cleanChannelFlagsIn:v15];
          goto LABEL_10;
        }
        __int16 v17 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v28;
          __int16 v36 = "+[RoamPolicyStore convertChannelList:log:For:]";
          __int16 v37 = 1024;
          int v38 = 1514;
          __int16 v39 = 2080;
          id v40 = a5;
          __int16 v41 = 2112;
          uint64_t v42 = v15;
          _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:[%s] Channel is neither a number nor a dictionary: %@", buf, 0x26u);
        }
LABEL_15:

        ++v14;
      }
      while (v12 != v14);
      uint64_t v26 = [v9 countByEnumeratingWithState:&v31 objects:v45 count:16];
      uint64_t v12 = v26;
    }
    while (v26);
  }

  return v8;
}

+ (id)extractChannelList:(id)a3 channelKeyPath:(id)a4 channelFlagsKeyPath:(id)a5 logFor:(const char *)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v32 = a5;
  id v33 = (id)objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v35;
    *(void *)&long long v13 = 136446978;
    long long v31 = v13;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v11);
        }
        __int16 v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend(v17, "valueForKey:", v10, v31);
        if (v18)
        {
          __int16 v19 = (void *)v18;
          uint64_t v20 = [v17 valueForKey:v10];
          uint64_t v21 = [v20 integerValue];

          if (v21)
          {
            int v22 = objc_opt_class();
            BOOL v23 = [v17 valueForKey:v10];
            uint64_t v24 = [v23 integerValue];
            __int16 v25 = [v17 valueForKey:v32];
            uint64_t v26 = objc_msgSend(v22, "makeChanInfoFromChannel:andFlags:", v24, objc_msgSend(v25, "integerValue"));

            uint64_t v27 = WALogCategoryDeviceStoreHandle();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              long long v28 = [v26 objectForKeyedSubscript:@"channel"];
              uint64_t v29 = [a1 bandFromChInfo:v26];
              *(_DWORD *)buf = v31;
              __int16 v39 = "+[RoamPolicyStore extractChannelList:channelKeyPath:channelFlagsKeyPath:logFor:]";
              __int16 v40 = 1024;
              int v41 = 1540;
              __int16 v42 = 2112;
              __int16 v43 = v28;
              __int16 v44 = 2112;
              uint64_t v45 = v29;
              _os_log_impl(&dword_21D96D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Channel %@ Band %@", buf, 0x26u);
            }
            [v33 addObject:v26];
          }
        }
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v14);
  }

  return v33;
}

+ (id)bandFromChInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"channelFlags"];
  char v5 = [v4 unsignedIntValue];

  if ((v5 & 8) != 0)
  {
    id v10 = @"2.4Ghz";
  }
  else
  {
    int64_t v6 = [v3 objectForKeyedSubscript:@"channelFlags"];
    char v7 = [v6 unsignedIntValue];

    if ((v7 & 0x10) != 0)
    {
      id v10 = @"5Ghz";
    }
    else
    {
      id v8 = [v3 objectForKeyedSubscript:@"channelFlags"];
      __int16 v9 = [v8 unsignedIntValue];

      if ((v9 & 0x2000) != 0) {
        id v10 = @"6Ghz";
      }
      else {
        id v10 = @"N/A";
      }
    }
  }

  return v10;
}

+ (id)neighborChannelsAsArray:(id)a3 log:(BOOL)a4 For:(const char *)a5
{
  BOOL v6 = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = 0;
    goto LABEL_13;
  }
  id v8 = v7;
  __int16 v9 = [v8 neighborChannels];

  if (!v9) {
    goto LABEL_11;
  }
  id v10 = [v8 neighborChannels];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v16 = [v8 neighborChannels];
    objc_opt_class();
    char v17 = objc_opt_isKindOfClass();

    if (v17)
    {
      uint64_t v18 = [v8 neighborChannels];
      uint64_t v15 = [v18 allObjects];

      goto LABEL_12;
    }
    __int16 v19 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v8 neighborChannels];
      int v23 = 136446978;
      uint64_t v24 = "+[RoamPolicyStore neighborChannelsAsArray:log:For:]";
      __int16 v25 = 1024;
      int v26 = 1573;
      __int16 v27 = 2080;
      long long v28 = a5;
      __int16 v29 = 2112;
      id v30 = (id)objc_opt_class();
      id v21 = v30;
      _os_log_impl(&dword_21D96D000, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:[%s] bssMO.neighborChannels is neither Array nor Set! (%@)", (uint8_t *)&v23, 0x26u);
    }
LABEL_11:
    uint64_t v15 = 0;
    goto LABEL_12;
  }
  uint64_t v12 = objc_opt_class();
  long long v13 = [v8 neighborChannels];
  uint64_t v14 = [v12 convertChannelList:v13 log:v6 For:a5];
  uint64_t v15 = [v14 allObjects];

LABEL_12:
LABEL_13:

  return v15;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (AnalyticsStoreMOHandler)roamPolicyMOHandler
{
  return self->_roamPolicyMOHandler;
}

- (void)setRoamPolicyMOHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end