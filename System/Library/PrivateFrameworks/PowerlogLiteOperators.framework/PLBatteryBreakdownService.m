@interface PLBatteryBreakdownService
+ (BOOL)canSetQualifier:(int64_t)a3 forBundleID:(id)a4;
+ (id)appNameForBundleID:(id)a3;
+ (id)combineQualifiers:(id)a3;
+ (id)defaults;
+ (id)installedPlugins;
+ (id)pluginEntryFromRecord:(id)a3;
+ (id)rootNodeQualificationNameWithQualificationName:(id)a3 withRootNodeName:(id)a4;
+ (id)whereValidName;
+ (void)load;
- (BOOL)checkHomeKitEvents;
- (BOOL)hasHomeKitActivity;
- (BOOL)inDemoMode;
- (BOOL)isBackgroundLocationUsageAlwaysEnabled:(id)a3 withLocationDict:(id)a4;
- (BOOL)isBackgroundRefreshEnabled:(id)a3;
- (BOOL)isForegroundOnlyBucket:(signed __int16)a3;
- (BOOL)shouldShowBatteryBreakdownWithTotalSumEnergy:(double)a3 withtotalSumEnergyRatioCutOff:(double)a4;
- (BOOL)shouldShowOngoingRestoreInsight;
- (BOOL)shouldShowUpgradeInsightWithQueryType:(int)a3;
- (BOOL)shouldSuggestAutoBrightnessWithEnergyEntries:(id)a3 andSavedEnergyPercent:(double *)a4;
- (BOOL)shouldSuggestAutoLockWithEnergyEntries:(id)a3 andSavedEnergyPercent:(double *)a4;
- (BOOL)shouldSuggestReduceBrightnessWithEnergyEntries:(id)a3 andSavedEnergyPercent:(double *)a4;
- (BOOL)showGizmoQualifier;
- (BOOL)showRootNodesInInternal;
- (BOOL)wasGizmoConnectedInRange:(_PLTimeIntervalRange)a3;
- (NSDictionary)givenNameToMappedName;
- (NSDictionary)gizmoDaemonToAppBundleID;
- (NSDictionary)gizmoIDSTopicToAppBundleID;
- (NSDictionary)installedBundleIDToDisplayName;
- (NSDictionary)installedPluginBundleIDToPluginEntry;
- (NSDictionary)nodeIDToNodeName;
- (NSDictionary)rootNodeNameToRootNodeEnergyKey;
- (NSSet)deletedAppClipNames;
- (NSSet)deletedAppNames;
- (NSSet)intermediateRootNodes;
- (NSSet)nonAppNames;
- (NSSet)rootNodeNames;
- (NSSet)webAppNames;
- (double)computeTotalBackgroundDuration:(id)a3;
- (double)computeTotalForegroundDuration:(id)a3;
- (double)getLastUpgradeTimestamp;
- (double)getfirstEntryTimestampFromDb;
- (double)nonAppRuntimeWithEventForwardTableName:(id)a3 withRange:(_PLTimeIntervalRange)a4 andIdentificationKey:(id)a5;
- (double)totalEnergyDay;
- (double)totalEnergyWeek;
- (double)totalSumEnergyRatioCutOff;
- (id)addForegroundAndBackgroundDurations:(id)a3 withRange:(_PLTimeIntervalRange)a4 withQueryType:(int)a5;
- (id)addNotificationValues:(id)a3 withRange:(_PLTimeIntervalRange)a4 withQueryType:(int)a5;
- (id)adjustBackgroundTimesWithEnergyEntries:(id)a3;
- (id)adjustExtensionBackgroundTimeWithEnergyEntries:(id)a3;
- (id)adjustFGBGTimeForNonAppEnergyEntry:(id)a3;
- (id)adjustForegroundTimesWithEnergyEntries:(id)a3;
- (id)applyDynamicNameTransformationsWithEnergyEntries:(id)a3;
- (id)applyStaticNameTransformationsWithEnergyEntries:(id)a3;
- (id)batteryBreakdownWithTimeRange:(_PLTimeIntervalRange)a3 withDataRange:(_PLTimeIntervalRange)a4 withEntryTimeInterval:(double)a5 withQueryType:(int)a6;
- (id)batteryBreakdownWithTimeRange:(_PLTimeIntervalRange)a3 withDataRange:(_PLTimeIntervalRange)a4 withEntryTimeInterval:(double)a5 withQueryType:(int)a6 withTotalSumEnergyRatioCutOff:(double)a7;
- (id)bundleIDsForMappedName:(id)a3;
- (id)combineDuplicatesWithEnergyEntries:(id)a3;
- (id)determineDisplayNamesWithEnergyEntries:(id)a3;
- (id)energyEntriesWithRange:(_PLTimeIntervalRange)a3 withEntryTimeInterval:(double)a4 withQueryType:(int)a5;
- (id)filterEnergyEntriesBasedOnTime:(id)a3 withQueryType:(int)a4;
- (id)filterWithEnergyEntries:(id)a3 withQueryType:(int)a4;
- (id)getUpgradeDataWithLastUpgradeTimestamp:(double)a3 withFirstEntryTimestampFromDB:(double)a4 withNow:(id)a5 withBeforeUpgrade:(BOOL)a6 withRange:(_PLTimeIntervalRange)a7;
- (id)getUsageDataWithStartTime:(double)a3 withMidTime:(double)a4 withEndTime:(id)a5;
- (id)mapCloudDocsToAppsWithEnergyEntries:(id)a3;
- (id)mapDeletedAppsWithEnergyEntries:(id)a3;
- (id)mapGizmoToAppsWithEnergyEntries:(id)a3;
- (id)mapPluginsToAppsWithEnergyEntries:(id)a3;
- (id)nonAppsRuntimesWithRange:(_PLTimeIntervalRange)a3;
- (id)nonNullValue:(id)a3 withKey:(id)a4;
- (id)pluginBundleIDsforBundleID:(id)a3;
- (id)populateBLDKeysWithEnergyEntries:(id)a3;
- (id)populateEnergyBucketKeysWithEntries:(id)a3;
- (id)populateRootNodeEnergyKeysWithEnergyEntries:(id)a3;
- (id)qualifiersWithEnergyEntry:(id)a3 bucketSize:(double)a4 andTotalEnergy:(double)a5;
- (id)reaccountBackupRestoreWithEnergyEntries:(id)a3;
- (id)reaccountExchangeEntriesWithEnergyEntries:(id)a3;
- (id)removeNodesNotToShowInInternalUI:(id)a3 withQueryType:(int)a4;
- (id)shouldSuggestBackgroundCPUWithEnergyEntries:(id)a3;
- (id)shouldSuggestBackgroundLocationWithEnergyEntries:(id)a3;
- (id)suggestionsWithEnergyEntries:(id)a3;
- (int)appTypeForName:(id)a3;
- (int)minimumRequiredQueryTypeForAppType:(int)a3;
- (signed)energyMetricBucketForRootNodeID:(id)a3;
- (void)clearState;
- (void)setDeletedAppClipNames:(id)a3;
- (void)setDeletedAppNames:(id)a3;
- (void)setGivenNameToMappedName:(id)a3;
- (void)setGizmoDaemonToAppBundleID:(id)a3;
- (void)setGizmoIDSTopicToAppBundleID:(id)a3;
- (void)setHasHomeKitActivity:(BOOL)a3;
- (void)setInstalledBundleIDToDisplayName:(id)a3;
- (void)setInstalledPluginBundleIDToPluginEntry:(id)a3;
- (void)setIntermediateRootNodes:(id)a3;
- (void)setNodeIDToNodeName:(id)a3;
- (void)setNonAppNames:(id)a3;
- (void)setRootNodeNameToRootNodeEnergyKey:(id)a3;
- (void)setRootNodeNames:(id)a3;
- (void)setShowGizmoQualifier:(BOOL)a3;
- (void)setTotalEnergyDay:(double)a3;
- (void)setTotalEnergyWeek:(double)a3;
- (void)setWebAppNames:(id)a3;
@end

@implementation PLBatteryBreakdownService

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBatteryBreakdownService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)clearState
{
  [(PLBatteryBreakdownService *)self setRootNodeNames:0];
  [(PLBatteryBreakdownService *)self setNonAppNames:0];
  [(PLBatteryBreakdownService *)self setDeletedAppNames:0];
  [(PLBatteryBreakdownService *)self setDeletedAppClipNames:0];
  [(PLBatteryBreakdownService *)self setWebAppNames:0];
  [(PLBatteryBreakdownService *)self setNodeIDToNodeName:0];
  [(PLBatteryBreakdownService *)self setInstalledBundleIDToDisplayName:0];
  [(PLBatteryBreakdownService *)self setInstalledPluginBundleIDToPluginEntry:0];
  [(PLBatteryBreakdownService *)self setRootNodeNameToRootNodeEnergyKey:0];
  [(PLBatteryBreakdownService *)self setGivenNameToMappedName:0];
  [(PLBatteryBreakdownService *)self setGizmoDaemonToAppBundleID:0];
  [(PLBatteryBreakdownService *)self setGizmoIDSTopicToAppBundleID:0];
  [(PLBatteryBreakdownService *)self setHasHomeKitActivity:0];
}

- (NSSet)rootNodeNames
{
  rootNodeNames = self->_rootNodeNames;
  if (!rootNodeNames)
  {
    v4 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F29EEE10];
    v5 = self->_rootNodeNames;
    self->_rootNodeNames = v4;

    rootNodeNames = self->_rootNodeNames;
  }
  return rootNodeNames;
}

- (NSSet)nonAppNames
{
  nonAppNames = self->_nonAppNames;
  if (!nonAppNames)
  {
    v4 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F29EEE28];
    v5 = self->_nonAppNames;
    self->_nonAppNames = v4;

    nonAppNames = self->_nonAppNames;
  }
  return nonAppNames;
}

- (NSSet)intermediateRootNodes
{
  intermediateRootNodes = self->_intermediateRootNodes;
  if (!intermediateRootNodes)
  {
    v4 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F29EEE40];
    v5 = self->_intermediateRootNodes;
    self->_intermediateRootNodes = v4;

    intermediateRootNodes = self->_intermediateRootNodes;
  }
  return intermediateRootNodes;
}

- (NSSet)deletedAppNames
{
  objc_super v2 = self;
  v58[1] = *MEMORY[0x1E4F143B8];
  p_deletedAppNames = &self->_deletedAppNames;
  deletedAppNames = self->_deletedAppNames;
  if (!deletedAppNames)
  {
    location = (id *)p_deletedAppNames;
    uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"AppDeletedDate" withValue:&unk_1F29E7510 withComparisonOperation:1];
    v7 = [(PLOperator *)v2 storage];
    v40 = (void *)v6;
    v58[0] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
    v41 = (void *)v5;
    v9 = [v7 entriesForKey:v5 withComparisons:v8];

    v10 = PLLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v9;
      _os_log_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEFAULT, "DeletedAppEntries = %@", buf, 0xCu);
    }

    unint64_t v11 = 0x1E4F92000uLL;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v12 = objc_opt_class();
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __44__PLBatteryBreakdownService_deletedAppNames__block_invoke;
      v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v52[4] = v12;
      if (qword_1EBD5A2A8 != -1) {
        dispatch_once(&qword_1EBD5A2A8, v52);
      }
      if (_MergedGlobals_1_54)
      {
        v13 = [NSString stringWithFormat:@"deletedAppEntries=%@", v9];
        v14 = (void *)MEMORY[0x1E4F929B8];
        v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
        v16 = [v15 lastPathComponent];
        v17 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService deletedAppNames]"];
        [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:241];

        v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v54 = v13;
          _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    id v44 = [MEMORY[0x1E4F1CA80] set];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v9;
    uint64_t v19 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v49;
      uint64_t v43 = *(void *)v49;
      do
      {
        uint64_t v22 = 0;
        uint64_t v45 = v20;
        do
        {
          if (*(void *)v49 != v21) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v48 + 1) + 8 * v22);
          v24 = [v23 objectForKeyedSubscript:@"AppBundleId"];
          v25 = [v23 objectForKeyedSubscript:@"AppIsClip"];
          if ([*(id *)(v11 + 2496) debugEnabled])
          {
            uint64_t v26 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __44__PLBatteryBreakdownService_deletedAppNames__block_invoke_295;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v26;
            if (qword_1EBD5A2B0 != -1) {
              dispatch_once(&qword_1EBD5A2B0, block);
            }
            if (byte_1EBD5A261)
            {
              unint64_t v27 = v11;
              v28 = v2;
              v29 = [NSString stringWithFormat:@"bundleID=%@", v24];
              v30 = (void *)MEMORY[0x1E4F929B8];
              v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
              v32 = [v31 lastPathComponent];
              v33 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService deletedAppNames]"];
              [v30 logMessage:v29 fromFile:v32 fromFunction:v33 fromLineNumber:247];

              v34 = PLLogCommon();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                id v54 = v29;
                _os_log_debug_impl(&dword_1D2690000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              objc_super v2 = v28;
              unint64_t v11 = v27;
              uint64_t v20 = v45;
              uint64_t v21 = v43;
            }
          }
          v35 = PLLogCommon();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            int v36 = [v25 intValue];
            *(_DWORD *)buf = 138412546;
            id v54 = v24;
            __int16 v55 = 1024;
            int v56 = v36;
            _os_log_impl(&dword_1D2690000, v35, OS_LOG_TYPE_DEFAULT, "bundleID=%@, appIsClip=%d", buf, 0x12u);
          }

          if (v24 && ([v25 BOOLValue] & 1) == 0) {
            [v44 addObject:v24];
          }

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v20);
    }

    objc_storeStrong(location, v44);
    v37 = PLLogCommon();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      id v38 = *location;
      *(_DWORD *)buf = 138412290;
      id v54 = v38;
      _os_log_impl(&dword_1D2690000, v37, OS_LOG_TYPE_DEFAULT, "DeletedAppNames = %@", buf, 0xCu);
    }

    deletedAppNames = (NSSet *)*location;
  }
  return deletedAppNames;
}

uint64_t __44__PLBatteryBreakdownService_deletedAppNames__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_54 = result;
  return result;
}

uint64_t __44__PLBatteryBreakdownService_deletedAppNames__block_invoke_295(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A261 = result;
  return result;
}

- (NSSet)deletedAppClipNames
{
  objc_super v2 = self;
  v51[1] = *MEMORY[0x1E4F143B8];
  p_deletedAppClipNames = &self->_deletedAppClipNames;
  deletedAppClipNames = self->_deletedAppClipNames;
  if (!deletedAppClipNames)
  {
    location = (id *)p_deletedAppClipNames;
    uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"AppDeletedDate" withValue:&unk_1F29E7510 withComparisonOperation:1];
    v7 = [(PLOperator *)v2 storage];
    v34 = (void *)v6;
    v51[0] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
    v35 = (void *)v5;
    v9 = [v7 entriesForKey:v5 withComparisons:v8];

    v10 = PLLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v9;
      _os_log_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEFAULT, "DeletedAppEntries = %@", buf, 0xCu);
    }

    id v38 = [MEMORY[0x1E4F1CA80] set];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v9;
    uint64_t v11 = [(NSSet *)obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      v13 = @"AppBundleId";
      uint64_t v14 = *(void *)v43;
      unint64_t v15 = 0x1E4F92000uLL;
      uint64_t v37 = *(void *)v43;
      do
      {
        uint64_t v16 = 0;
        uint64_t v39 = v12;
        do
        {
          if (*(void *)v43 != v14) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v42 + 1) + 8 * v16);
          v18 = [v17 objectForKeyedSubscript:v13];
          uint64_t v19 = [v17 objectForKeyedSubscript:@"AppIsClip"];
          if ([*(id *)(v15 + 2496) debugEnabled])
          {
            uint64_t v20 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __48__PLBatteryBreakdownService_deletedAppClipNames__block_invoke;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v20;
            if (qword_1EBD5A2B8 != -1) {
              dispatch_once(&qword_1EBD5A2B8, block);
            }
            if (byte_1EBD5A262)
            {
              uint64_t v21 = v13;
              uint64_t v22 = v2;
              [NSString stringWithFormat:@"bundleID=%@", v18];
              v23 = (NSSet *)objc_claimAutoreleasedReturnValue();
              v24 = (void *)MEMORY[0x1E4F929B8];
              v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
              uint64_t v26 = [v25 lastPathComponent];
              unint64_t v27 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService deletedAppClipNames]"];
              [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:274];

              v28 = PLLogCommon();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v47 = v23;
                _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              objc_super v2 = v22;
              v13 = v21;
              uint64_t v12 = v39;
              uint64_t v14 = v37;
              unint64_t v15 = 0x1E4F92000;
            }
          }
          v29 = PLLogCommon();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            int v30 = [v19 intValue];
            *(_DWORD *)buf = 138412546;
            v47 = v18;
            __int16 v48 = 1024;
            int v49 = v30;
            _os_log_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEFAULT, "bundleID=%@, appIsClip=%d", buf, 0x12u);
          }

          if (v18 && [v19 BOOLValue]) {
            [v38 addObject:v18];
          }

          ++v16;
        }
        while (v12 != v16);
        uint64_t v12 = [(NSSet *)obj countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v12);
    }

    objc_storeStrong(location, v38);
    v31 = PLLogCommon();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      deletedAppNames = v2->_deletedAppNames;
      *(_DWORD *)buf = 138412290;
      v47 = deletedAppNames;
      _os_log_impl(&dword_1D2690000, v31, OS_LOG_TYPE_DEFAULT, "DeletedAppNames = %@", buf, 0xCu);
    }

    deletedAppClipNames = (NSSet *)*location;
  }
  return deletedAppClipNames;
}

uint64_t __48__PLBatteryBreakdownService_deletedAppClipNames__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A262 = result;
  return result;
}

- (NSSet)webAppNames
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  webAppNames = self->_webAppNames;
  if (!webAppNames)
  {
    v4 = [MEMORY[0x1E4F929E0] entryKeyForOperatorName:@"PLXPCAgent" withType:*MEMORY[0x1E4F92D30] withName:@"WebApp"];
    uint64_t v5 = [(PLOperator *)self storage];
    uint64_t v6 = [v5 entriesForKey:v4];

    v7 = [MEMORY[0x1E4F1CA80] set];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "objectForKeyedSubscript:", @"identifier", (void)v16);
          if (v13) {
            [(NSSet *)v7 addObject:v13];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    uint64_t v14 = self->_webAppNames;
    self->_webAppNames = v7;

    webAppNames = self->_webAppNames;
  }
  return webAppNames;
}

- (NSDictionary)nodeIDToNodeName
{
  v28[1] = *MEMORY[0x1E4F143B8];
  nodeIDToNodeName = self->_nodeIDToNodeName;
  if (!nodeIDToNodeName)
  {
    v4 = [(PLOperator *)self storage];
    uint64_t v5 = [MEMORY[0x1E4F92908] entryKey];
    unint64_t v27 = @"where";
    uint64_t v6 = [(id)objc_opt_class() whereValidName];
    uint64_t v26 = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    v28[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    uint64_t v9 = [v4 entriesForKey:v5 withProperties:v8];

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v17 = [v16 name];
          long long v18 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "entryID"));
          [(NSDictionary *)v10 setObject:v17 forKeyedSubscript:v18];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }

    long long v19 = self->_nodeIDToNodeName;
    self->_nodeIDToNodeName = v10;

    nodeIDToNodeName = self->_nodeIDToNodeName;
  }
  return nodeIDToNodeName;
}

- (NSDictionary)installedBundleIDToDisplayName
{
  objc_super v2 = self;
  v80[1] = *MEMORY[0x1E4F143B8];
  installedBundleIDToDisplayName = self->_installedBundleIDToDisplayName;
  if (!installedBundleIDToDisplayName)
  {
    uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"AppDeletedDate" withValue:&unk_1F29E7510 withComparisonOperation:0];
    uint64_t v6 = [(PLOperator *)v2 storage];
    v58 = (void *)v5;
    v80[0] = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:1];
    v59 = (void *)v4;
    id v8 = [v6 entriesForKey:v4 withComparisons:v7];

    unint64_t v9 = 0x1E4F92000uLL;
    v61 = v2;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v10 = objc_opt_class();
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __59__PLBatteryBreakdownService_installedBundleIDToDisplayName__block_invoke;
      v75[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v75[4] = v10;
      if (qword_1EBD5A2C0 != -1) {
        dispatch_once(&qword_1EBD5A2C0, v75);
      }
      if (byte_1EBD5A263)
      {
        id v11 = [NSString stringWithFormat:@"installedAppEntries=%@", v8];
        uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
        uint64_t v14 = [v13 lastPathComponent];
        unint64_t v15 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService installedBundleIDToDisplayName]"];
        [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:324];

        long long v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v79 = v11;
          _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        objc_super v2 = v61;
      }
    }
    long long v17 = PLLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v79 = v8;
      _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "installedAppEntries=%@", buf, 0xCu);
    }

    v64 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v18 = v8;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v71 objects:v77 count:16];
    v60 = v18;
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v72;
      long long v22 = @"AppType";
      do
      {
        uint64_t v23 = 0;
        uint64_t v62 = v20;
        do
        {
          if (*(void *)v72 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v24 = *(void **)(*((void *)&v71 + 1) + 8 * v23);
          v25 = [v24 objectForKeyedSubscript:v22];
          int v26 = [v25 intValue];

          if (v26 == 101)
          {
            unint64_t v27 = v22;
            v28 = [v24 objectForKeyedSubscript:@"AppBundleId"];
            v29 = [v24 objectForKeyedSubscript:@"AppName"];
            if ([*(id *)(v9 + 2496) debugEnabled])
            {
              uint64_t v30 = objc_opt_class();
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __59__PLBatteryBreakdownService_installedBundleIDToDisplayName__block_invoke_327;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v30;
              if (qword_1EBD5A2C8 != -1) {
                dispatch_once(&qword_1EBD5A2C8, block);
              }
              if (byte_1EBD5A264)
              {
                v31 = [NSString stringWithFormat:@"bundleID=%@, displayName=%@", v28, v29];
                v32 = (void *)MEMORY[0x1E4F929B8];
                v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
                v34 = [v33 lastPathComponent];
                v35 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService installedBundleIDToDisplayName]"];
                [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:334];

                int v36 = PLLogCommon();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v79 = v31;
                  _os_log_debug_impl(&dword_1D2690000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                id v18 = v60;
                objc_super v2 = v61;
                unint64_t v9 = 0x1E4F92000;
              }
            }
            [(NSDictionary *)v64 setObject:v29 forKeyedSubscript:v28];

            long long v22 = v27;
            uint64_t v20 = v62;
          }
          else
          {
            v28 = PLLogCommon();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v37 = [v24 objectForKeyedSubscript:@"AppBundleId"];
              *(_DWORD *)buf = 138412290;
              v79 = v37;
              _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "Skipping non system / non user bundleID=%@", buf, 0xCu);
            }
          }

          ++v23;
        }
        while (v20 != v23);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v71 objects:v77 count:16];
      }
      while (v20);
    }

    id v38 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v66 objects:v76 count:16];
    unint64_t v40 = 0x1E6928000uLL;
    if (v39)
    {
      uint64_t v41 = v39;
      uint64_t v42 = *(void *)v67;
      do
      {
        uint64_t v43 = 0;
        do
        {
          if (*(void *)v67 != v42) {
            objc_enumerationMutation(v38);
          }
          long long v44 = *(void **)(*((void *)&v66 + 1) + 8 * v43);
          if ([v44 mayBeBUIVisible])
          {
            if (![*(id *)(v40 + 3328) hasScreenPresence:v44]) {
              goto LABEL_48;
            }
            long long v45 = [v44 bundleIdentifier];
            v46 = [(NSDictionary *)v64 objectForKeyedSubscript:v45];

            if (!v46)
            {
              v47 = [v44 localizedName];
              if ([MEMORY[0x1E4F929C0] debugEnabled])
              {
                uint64_t v48 = objc_opt_class();
                v65[0] = MEMORY[0x1E4F143A8];
                v65[1] = 3221225472;
                v65[2] = __59__PLBatteryBreakdownService_installedBundleIDToDisplayName__block_invoke_334;
                v65[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v65[4] = v48;
                if (qword_1EBD5A2D0 != -1) {
                  dispatch_once(&qword_1EBD5A2D0, v65);
                }
                if (byte_1EBD5A265)
                {
                  uint64_t v49 = [NSString stringWithFormat:@"bundleID=%@, displayName=%@", v45, v47];
                  v63 = (void *)MEMORY[0x1E4F929B8];
                  long long v50 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
                  long long v51 = [v50 lastPathComponent];
                  v52 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService installedBundleIDToDisplayName]"];
                  [v63 logMessage:v49 fromFile:v51 fromFunction:v52 fromLineNumber:352];

                  v53 = (void *)v49;
                  id v54 = PLLogCommon();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v79 = v53;
                    _os_log_debug_impl(&dword_1D2690000, v54, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  objc_super v2 = v61;
                  unint64_t v40 = 0x1E6928000;
                }
              }
              [(NSDictionary *)v64 setObject:v47 forKeyedSubscript:v45];
            }
          }
          else
          {
            long long v45 = PLLogCommon();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              __int16 v55 = [v44 bundleIdentifier];
              *(_DWORD *)buf = 138412290;
              v79 = v55;
              _os_log_debug_impl(&dword_1D2690000, v45, OS_LOG_TYPE_DEBUG, "LSApplicationRecord Skipping non system / non user bundleID=%@", buf, 0xCu);
            }
          }

LABEL_48:
          ++v43;
        }
        while (v41 != v43);
        uint64_t v41 = [v38 countByEnumeratingWithState:&v66 objects:v76 count:16];
      }
      while (v41);
    }
    int v56 = v2->_installedBundleIDToDisplayName;
    v2->_installedBundleIDToDisplayName = v64;

    installedBundleIDToDisplayName = v2->_installedBundleIDToDisplayName;
  }
  return installedBundleIDToDisplayName;
}

uint64_t __59__PLBatteryBreakdownService_installedBundleIDToDisplayName__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A263 = result;
  return result;
}

uint64_t __59__PLBatteryBreakdownService_installedBundleIDToDisplayName__block_invoke_327(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A264 = result;
  return result;
}

uint64_t __59__PLBatteryBreakdownService_installedBundleIDToDisplayName__block_invoke_334(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A265 = result;
  return result;
}

- (NSDictionary)installedPluginBundleIDToPluginEntry
{
  objc_super v2 = self;
  v78[1] = *MEMORY[0x1E4F143B8];
  installedPluginBundleIDToPluginEntry = self->_installedPluginBundleIDToPluginEntry;
  if (!installedPluginBundleIDToPluginEntry)
  {
    uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllPlugins"];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"PluginDeletedDate" withValue:&unk_1F29E7510 withComparisonOperation:0];
    uint64_t v6 = [(PLOperator *)v2 storage];
    id v54 = (void *)v5;
    v78[0] = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:1];
    __int16 v55 = (void *)v4;
    id v8 = [v6 entriesForKey:v4 withComparisons:v7];

    unint64_t v9 = 0x1E4F92000uLL;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v10 = objc_opt_class();
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __65__PLBatteryBreakdownService_installedPluginBundleIDToPluginEntry__block_invoke;
      v73[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v73[4] = v10;
      if (qword_1EBD5A2D8 != -1) {
        dispatch_once(&qword_1EBD5A2D8, v73);
      }
      if (byte_1EBD5A266)
      {
        id v11 = [NSString stringWithFormat:@"installedPluginEntries=%@", v8];
        uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
        uint64_t v14 = [v13 lastPathComponent];
        unint64_t v15 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService installedPluginBundleIDToPluginEntry]"];
        [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:374];

        long long v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v77 = v11;
          _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        unint64_t v9 = 0x1E4F92000uLL;
      }
    }
    long long v17 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id obj = v8;
    uint64_t v18 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
    v59 = v17;
    v60 = v2;
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v70;
      uint64_t v21 = @"PluginId";
      do
      {
        uint64_t v22 = 0;
        uint64_t v58 = v19;
        do
        {
          if (*(void *)v70 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void **)(*((void *)&v69 + 1) + 8 * v22);
          long long v24 = [v23 objectForKeyedSubscript:v21];
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v25 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __65__PLBatteryBreakdownService_installedPluginBundleIDToPluginEntry__block_invoke_346;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v25;
            if (qword_1EBD5A2E0 != -1) {
              dispatch_once(&qword_1EBD5A2E0, block);
            }
            if (byte_1EBD5A267)
            {
              uint64_t v26 = v20;
              unint64_t v27 = v21;
              v28 = [NSString stringWithFormat:@"pluginBundleID=%@", v24];
              v29 = (void *)MEMORY[0x1E4F929B8];
              uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
              v31 = [v30 lastPathComponent];
              v32 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService installedPluginBundleIDToPluginEntry]"];
              [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:379];

              v33 = PLLogCommon();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v77 = v28;
                _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              long long v17 = v59;
              objc_super v2 = v60;
              unint64_t v9 = 0x1E4F92000uLL;
              uint64_t v21 = v27;
              uint64_t v20 = v26;
              uint64_t v19 = v58;
            }
          }
          [(NSDictionary *)v17 setObject:v23 forKeyedSubscript:v24];

          ++v22;
        }
        while (v19 != v22);
        uint64_t v19 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
      }
      while (v19);
    }

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v34 = +[PLBatteryBreakdownService installedPlugins];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v64 objects:v74 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v62 = *(void *)v65;
      int v56 = v34;
      do
      {
        uint64_t v37 = 0;
        uint64_t v57 = v36;
        do
        {
          if (*(void *)v65 != v62) {
            objc_enumerationMutation(v34);
          }
          id v38 = *(void **)(*((void *)&v64 + 1) + 8 * v37);
          uint64_t v39 = [v38 objectForKeyedSubscript:@"PluginId"];
          unint64_t v40 = [v38 objectForKeyedSubscript:@"PluginParentApp"];
          uint64_t v41 = [(NSDictionary *)v17 objectForKeyedSubscript:v39];

          if (!v41)
          {
            if ([*(id *)(v9 + 2496) debugEnabled])
            {
              uint64_t v42 = objc_opt_class();
              v63[0] = MEMORY[0x1E4F143A8];
              v63[1] = 3221225472;
              v63[2] = __65__PLBatteryBreakdownService_installedPluginBundleIDToPluginEntry__block_invoke_356;
              v63[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v63[4] = v42;
              if (qword_1EBD5A2E8 != -1) {
                dispatch_once(&qword_1EBD5A2E8, v63);
              }
              if (byte_1EBD5A268)
              {
                uint64_t v43 = NSString;
                long long v44 = [v38 objectForKeyedSubscript:@"PluginExecutableName"];
                long long v45 = [v38 objectForKeyedSubscript:@"PluginType"];
                v46 = [v43 stringWithFormat:@"pluginExecutableName=%@, pluginBundleID=%@, pluginParentApp=%@, pluginType=%@", v44, v39, v40, v45];

                v47 = (void *)MEMORY[0x1E4F929B8];
                uint64_t v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
                uint64_t v49 = [v48 lastPathComponent];
                long long v50 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService installedPluginBundleIDToPluginEntry]"];
                [v47 logMessage:v46 fromFile:v49 fromFunction:v50 fromLineNumber:390];

                long long v51 = PLLogCommon();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v77 = v46;
                  _os_log_debug_impl(&dword_1D2690000, v51, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                long long v17 = v59;
                objc_super v2 = v60;
                unint64_t v9 = 0x1E4F92000;
                v34 = v56;
                uint64_t v36 = v57;
              }
            }
            [(NSDictionary *)v17 setObject:v38 forKeyedSubscript:v39];
          }

          ++v37;
        }
        while (v36 != v37);
        uint64_t v36 = [v34 countByEnumeratingWithState:&v64 objects:v74 count:16];
      }
      while (v36);
    }

    v52 = v2->_installedPluginBundleIDToPluginEntry;
    v2->_installedPluginBundleIDToPluginEntry = v17;

    installedPluginBundleIDToPluginEntry = v2->_installedPluginBundleIDToPluginEntry;
  }
  return installedPluginBundleIDToPluginEntry;
}

uint64_t __65__PLBatteryBreakdownService_installedPluginBundleIDToPluginEntry__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A266 = result;
  return result;
}

uint64_t __65__PLBatteryBreakdownService_installedPluginBundleIDToPluginEntry__block_invoke_346(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A267 = result;
  return result;
}

uint64_t __65__PLBatteryBreakdownService_installedPluginBundleIDToPluginEntry__block_invoke_356(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A268 = result;
  return result;
}

- (id)pluginBundleIDsforBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLBatteryBreakdownService *)self installedPluginBundleIDToPluginEntry];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__PLBatteryBreakdownService_pluginBundleIDsforBundleID___block_invoke;
  v10[3] = &unk_1E6930DD0;
  id v11 = v4;
  id v6 = v4;
  v7 = [v5 keysOfEntriesPassingTest:v10];

  id v8 = [v7 allObjects];

  return v8;
}

uint64_t __56__PLBatteryBreakdownService_pluginBundleIDsforBundleID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 objectForKeyedSubscript:@"PluginParentApp"];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

+ (id)appNameForBundleID:(id)a3
{
  v3 = (void *)SBSCopyLocalizedApplicationNameForDisplayIdentifier();
  return v3;
}

+ (id)installedPlugins
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v2 = (void *)MEMORY[0x1D942A350](a1, a2);
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(MEMORY[0x1E4F223A0], "enumeratorWithOptions:", 0, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = +[PLBatteryBreakdownService pluginEntryFromRecord:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)pluginEntryFromRecord:(id)a3
{
  id v3 = a3;
  id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllPlugins"];
  uint64_t v5 = [v3 bundleIdentifier];
  if (v5)
  {
    uint64_t v6 = [v3 containingBundleRecord];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      id v8 = [v3 containingBundleRecord];
      uint64_t v9 = [v8 bundleIdentifier];
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        long long v11 = [v3 executableURL];

        if (v11)
        {
          uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4];
          long long v12 = [v3 bundleIdentifier];
          [v5 setObject:v12 forKeyedSubscript:@"PluginId"];

          long long v13 = [v3 containingBundleRecord];
          long long v14 = [v13 bundleIdentifier];
          [v5 setObject:v14 forKeyedSubscript:@"PluginParentApp"];

          unint64_t v15 = [v3 extensionPointRecord];
          uint64_t v16 = [v15 identifier];
          [v5 setObject:v16 forKeyedSubscript:@"PluginType"];

          long long v17 = [v3 executableURL];
          uint64_t v18 = [v17 path];
          [v5 setObject:v18 forKeyedSubscript:@"PluginExecutableName"];

          [v5 setObject:&unk_1F29E7510 forKeyedSubscript:@"PluginDeletedDate"];
          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
LABEL_8:
    uint64_t v5 = 0;
  }
LABEL_9:

  return v5;
}

- (NSDictionary)gizmoDaemonToAppBundleID
{
  gizmoDaemonToAppBundleID = self->_gizmoDaemonToAppBundleID;
  if (!gizmoDaemonToAppBundleID)
  {
    self->_gizmoDaemonToAppBundleID = (NSDictionary *)&unk_1F29EADF0;
    gizmoDaemonToAppBundleID = self->_gizmoDaemonToAppBundleID;
  }
  return gizmoDaemonToAppBundleID;
}

- (NSDictionary)gizmoIDSTopicToAppBundleID
{
  gizmoIDSTopicToAppBundleID = self->_gizmoIDSTopicToAppBundleID;
  if (!gizmoIDSTopicToAppBundleID)
  {
    self->_gizmoIDSTopicToAppBundleID = (NSDictionary *)&unk_1F29EAE18;
    gizmoIDSTopicToAppBundleID = self->_gizmoIDSTopicToAppBundleID;
  }
  return gizmoIDSTopicToAppBundleID;
}

- (NSDictionary)rootNodeNameToRootNodeEnergyKey
{
  v25[17] = *MEMORY[0x1E4F143B8];
  rootNodeNameToRootNodeEnergyKey = self->_rootNodeNameToRootNodeEnergyKey;
  if (!rootNodeNameToRootNodeEnergyKey)
  {
    uint64_t v23 = [&unk_1F29EEE58 objectAtIndexedSubscript:2];
    v24[0] = v23;
    v25[0] = @"PLBatteryUIAppCPUEnergyKey";
    uint64_t v22 = [&unk_1F29EEE70 objectAtIndexedSubscript:4];
    v24[1] = v22;
    v25[1] = @"PLBatteryUIAppVENCEnergyKey";
    uint64_t v21 = [&unk_1F29EEE88 objectAtIndexedSubscript:5];
    v24[2] = v21;
    v25[2] = @"PLBatteryUIAppVDECEnergyKey";
    uint64_t v20 = [&unk_1F29EEEA0 objectAtIndexedSubscript:6];
    v24[3] = v20;
    v25[3] = @"PLBatteryUIAppISPEnergyKey";
    uint64_t v19 = [&unk_1F29EEEB8 objectAtIndexedSubscript:7];
    v24[4] = v19;
    v25[4] = @"PLBatteryUIAppRestOfSOCEnergyKey";
    uint64_t v18 = [&unk_1F29EEED0 objectAtIndexedSubscript:8];
    v24[5] = v18;
    v25[5] = @"PLBatteryUIAppGPUEnergyKey";
    long long v17 = [&unk_1F29EEEE8 objectAtIndexedSubscript:9];
    v24[6] = v17;
    v25[6] = @"PLBatteryUIAppDRAMEnergyKey";
    uint64_t v16 = [&unk_1F29EEF00 objectAtIndexedSubscript:10];
    v24[7] = v16;
    v25[7] = @"PLBatteryUIAppDisplayEnergyKey";
    unint64_t v15 = [&unk_1F29EEF18 objectAtIndexedSubscript:11];
    v24[8] = v15;
    v25[8] = @"PLBatteryUIAppWIFIEnergyKey";
    id v4 = [&unk_1F29EEF30 objectAtIndexedSubscript:15];
    v24[9] = v4;
    v25[9] = @"PLBatteryUIAppAUDIOEnergyKey";
    uint64_t v5 = [&unk_1F29EEF48 objectAtIndexedSubscript:37];
    v24[10] = v5;
    v25[10] = @"PLBatteryUIAppBBEnergyKey";
    uint64_t v6 = [&unk_1F29EEF60 objectAtIndexedSubscript:48];
    v24[11] = v6;
    v25[11] = @"BLMEnergyGPS";
    uint64_t v7 = [&unk_1F29EEF78 objectAtIndexedSubscript:12];
    v24[12] = v7;
    v25[12] = @"PLBatteryUIAppWifiLocationEnergyKey";
    id v8 = [&unk_1F29EEF90 objectAtIndexedSubscript:13];
    v24[13] = v8;
    v25[13] = @"PLBatteryUIAppWifiPipelineEnergyKey";
    uint64_t v9 = [&unk_1F29EEFA8 objectAtIndexedSubscript:50];
    v24[14] = v9;
    v25[14] = @"PLBatteryUIAppBluetoothEnergyKey";
    uint64_t v10 = [&unk_1F29EEFC0 objectAtIndexedSubscript:20];
    v24[15] = v10;
    v25[15] = @"PLBatteryUIAppAccessoryEnergyKey";
    long long v11 = [&unk_1F29EEFD8 objectAtIndexedSubscript:16];
    v24[16] = v11;
    v25[16] = @"PLBatteryUIAppNfcEnergyKey";
    long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:17];
    long long v13 = self->_rootNodeNameToRootNodeEnergyKey;
    self->_rootNodeNameToRootNodeEnergyKey = v12;

    rootNodeNameToRootNodeEnergyKey = self->_rootNodeNameToRootNodeEnergyKey;
  }
  return rootNodeNameToRootNodeEnergyKey;
}

- (NSDictionary)givenNameToMappedName
{
  v11[73] = *MEMORY[0x1E4F143B8];
  givenNameToMappedName = self->_givenNameToMappedName;
  if (!givenNameToMappedName)
  {
    v10[0] = @"IMRemoteURLConn";
    v10[1] = @"IMRemoteURLConne";
    v11[0] = @"com.apple.MobileSMS";
    v11[1] = @"com.apple.MobileSMS";
    v10[2] = @"com.apple.mobilesms.notification";
    v10[3] = @"mstreamd";
    v11[2] = @"com.apple.MobileSMS";
    v11[3] = @"com.apple.mobileslideshow";
    void v10[4] = @"mediastream.mstreamd";
    v10[5] = @"assetsd";
    v11[4] = @"com.apple.mobileslideshow";
    v11[5] = @"com.apple.mobileslideshow";
    v10[6] = @"cloudphotod";
    v10[7] = @"com.apple.mobileslideshow.Discretionary";
    v11[6] = @"com.apple.mobileslideshow";
    v11[7] = @"com.apple.mobileslideshow";
    v10[8] = @"com.apple.icloud-container.com.apple.photos.cloud";
    v10[9] = @"com.apple.photoanalysisd";
    v11[8] = @"com.apple.mobileslideshow";
    v11[9] = @"com.apple.mobileslideshow";
    v10[10] = @"com.apple.photoanalysisd.backgroundanalysis";
    v10[11] = @"com.apple.mediaanalysisd";
    v11[10] = @"com.apple.mobileslideshow";
    v11[11] = @"com.apple.mobileslideshow";
    v10[12] = @"com.apple.mediaanalysisd.fullanalysis";
    v10[13] = @"com.apple.photos.cloud";
    v11[12] = @"com.apple.mobileslideshow";
    v11[13] = @"com.apple.mobileslideshow";
    v10[14] = @"WirelessRadioManager";
    v10[15] = @"WirelessRadioManagerd";
    v11[14] = @"com.apple.mobilephone";
    v11[15] = @"com.apple.mobilephone";
    v10[16] = @"WirelessRadioMa";
    v10[17] = @"vmd";
    v11[16] = @"com.apple.mobilephone";
    v11[17] = @"com.apple.mobilephone";
    v10[18] = @"ipTelephony";
    v10[19] = @"com.apple.MailCompositionService";
    v11[18] = @"com.apple.mobilephone";
    v11[19] = @"com.apple.mobilemail";
    v10[20] = @"MailCompositionService";
    v10[21] = @"suggestd";
    v11[20] = @"com.apple.mobilemail";
    v11[21] = @"com.apple.mobilemail";
    v10[22] = @"email.maild";
    v10[23] = @"com.apple.email.maild";
    v11[22] = @"com.apple.mobilemail";
    v11[23] = @"com.apple.mobilemail";
    v10[24] = @"com.apple.springboard.lockscreen.navigation";
    v10[25] = @"com.apple.Siri";
    v11[24] = @"com.apple.Maps";
    v11[25] = @"Siri";
    v10[26] = *MEMORY[0x1E4F625C0];
    v10[27] = @"assistantd";
    v11[26] = @"Siri";
    v11[27] = @"Siri";
    v10[28] = @"com.apple.WebKit.Networking";
    v10[29] = @"com.apple.WebKit.WebContent";
    v11[28] = @"com.apple.mobilesafari";
    v11[29] = @"com.apple.mobilesafari";
    v10[30] = @"com.apple.WebKit";
    v10[31] = @"com.apple.WebKi";
    v11[30] = @"com.apple.mobilesafari";
    v11[31] = @"com.apple.mobilesafari";
    v10[32] = @"com.apple.SafariViewService";
    v10[33] = @"safarifetcherd";
    v11[32] = @"com.apple.mobilesafari";
    v11[33] = @"com.apple.mobilesafari";
    v10[34] = @"com.apple.WebKit.WebContent.CaptivePortal";
    v10[35] = @"com.apple.WebKit.WebContent.Development";
    v11[34] = @"com.apple.mobilesafari";
    v11[35] = @"com.apple.mobilesafari";
    v10[36] = @"com.apple.WebKit.GPU";
    v10[37] = @"com.apple.WebKit.GPU.Development";
    v11[36] = @"com.apple.mobilesafari";
    v11[37] = @"com.apple.mobilesafari";
    v10[38] = @"com.apple.PassKitCore";
    v10[39] = @"passd";
    v11[38] = @"com.apple.Passbook";
    v11[39] = @"com.apple.Passbook";
    v10[40] = @"PassbookUIService";
    v10[41] = @"com.apple.PassbookUIService";
    v11[40] = @"com.apple.Passbook";
    v11[41] = @"com.apple.Passbook";
    v10[42] = @"com.apple.calendar";
    v10[43] = @"calaccessd";
    v11[42] = @"com.apple.mobilecal";
    v11[43] = @"com.apple.mobilecal";
    uint64_t v4 = *MEMORY[0x1E4FA6F68];
    v10[44] = *MEMORY[0x1E4FA6F40];
    v10[45] = v4;
    v11[44] = @"HLS";
    v11[45] = @"HLS";
    uint64_t v5 = *MEMORY[0x1E4FA6F78];
    v10[46] = *MEMORY[0x1E4FA6F30];
    v10[47] = v5;
    v11[46] = @"HLS";
    v11[47] = @"HLS";
    uint64_t v6 = *MEMORY[0x1E4F625A8];
    v10[48] = *MEMORY[0x1E4F625B0];
    v10[49] = v6;
    v11[48] = @"HLS";
    v11[49] = @"HLS";
    v10[50] = *MEMORY[0x1E4F625B8];
    v10[51] = @"LockScreen";
    v11[50] = @"HLS";
    v11[51] = @"HLS";
    v10[52] = @"com.apple.MobileBackup.framework";
    v10[53] = @"backupd";
    v11[52] = @"Backup";
    v11[53] = @"Backup";
    v10[54] = @"com.apple.Restore";
    v10[55] = @"com.apple.atc";
    v11[54] = @"com.apple.AppStore";
    v11[55] = @"com.apple.AppStore";
    v10[56] = @"installd";
    v10[57] = @"com.apple.StreamingUnzipService";
    v11[56] = @"com.apple.AppStore";
    v11[57] = @"com.apple.AppStore";
    v10[58] = @"containermanagerd";
    v10[59] = @"appstored";
    v11[58] = @"com.apple.AppStore";
    v11[59] = @"com.apple.AppStore";
    v10[60] = @"OOS";
    v10[61] = @"healthd";
    v11[60] = @"PoorCellCondition";
    v11[61] = @"com.apple.Health";
    v10[62] = @"com.apple.healthappd";
    v10[63] = @"misd";
    v11[62] = @"com.apple.Health";
    v11[63] = @"Hotspot";
    v10[64] = @"RadarComposeUIService";
    v11[64] = @"com.apple.ist.radar";
    v10[65] = @"remindd";
    v11[65] = @"com.apple.reminders";
    v10[66] = @"homed";
    v11[66] = @"HomeKit";
    v10[67] = @"com.apple.private.alloy.willow";
    v11[67] = @"HomeKit";
    v10[68] = @"atc";
    v11[68] = @"com.apple.Music";
    v10[69] = @"siriactionsd";
    v11[69] = @"com.apple.shortcuts";
    v10[70] = @"com.apple.WorkflowKit.BackgroundShortcutRunner";
    v11[70] = @"com.apple.shortcuts";
    v10[71] = @"weatherd";
    v11[71] = @"com.apple.weather";
    v10[72] = @"synapse.contentlinkingd";
    v11[72] = @"com.apple.mobilenotes";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:73];
    id v8 = self->_givenNameToMappedName;
    self->_givenNameToMappedName = v7;

    givenNameToMappedName = self->_givenNameToMappedName;
  }
  return givenNameToMappedName;
}

+ (id)whereValidName
{
  return (id)[NSString stringWithFormat:@"(%@ NOT NULL) AND (%@ NOT LIKE '%%%@%%') AND (%@ NOT LIKE '%%%@%%')", *MEMORY[0x1E4F92BA0], *MEMORY[0x1E4F92BA0], @"null", *MEMORY[0x1E4F92BA0], @"unknown"];
}

- (BOOL)inDemoMode
{
  if (qword_1EBD5A2F0 != -1) {
    dispatch_once(&qword_1EBD5A2F0, &__block_literal_global_42);
  }
  return byte_1EBD5A269;
}

void __39__PLBatteryBreakdownService_inDemoMode__block_invoke()
{
  v0 = [MEMORY[0x1E4F929C0] objectForKey:@"BUI_DEMO_MODE" forApplicationID:@"com.apple.powerlogd" synchronize:1];
  byte_1EBD5A269 = v0 != 0;
}

- (id)batteryBreakdownWithTimeRange:(_PLTimeIntervalRange)a3 withDataRange:(_PLTimeIntervalRange)a4 withEntryTimeInterval:(double)a5 withQueryType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  double var1 = a4.var1;
  double var0 = a4.var0;
  double v10 = a3.var1;
  double v11 = a3.var0;
  [(PLBatteryBreakdownService *)self totalSumEnergyRatioCutOff];
  return -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:", v6, v11, v10, var0, var1, a5, v13);
}

- (id)batteryBreakdownWithTimeRange:(_PLTimeIntervalRange)a3 withDataRange:(_PLTimeIntervalRange)a4 withEntryTimeInterval:(double)a5 withQueryType:(int)a6 withTotalSumEnergyRatioCutOff:(double)a7
{
  uint64_t v8 = *(void *)&a6;
  double var1 = a4.var1;
  double var0 = a4.var0;
  double v12 = a3.var1;
  double v13 = a3.var0;
  uint64_t v239 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D942A350](self, a2);
  unint64_t v15 = PLLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    double v232 = a5;
    __int16 v233 = 1024;
    LODWORD(v234) = v8;
    _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "entryTimeInterval=%f, queryType=%i", buf, 0x12u);
  }

  double v202 = a7;
  if (var0 == 0.0 && var1 == 0.0)
  {
    double v16 = v12;
    double v17 = v12;
    double v18 = v13;
    goto LABEL_60;
  }
  uint64_t v19 = PLLogCommon();
  double v20 = v13 + v12;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    double v232 = v13;
    __int16 v233 = 2048;
    double v234 = v13 + v12;
    __int16 v235 = 2048;
    double v236 = var0;
    __int16 v237 = 2048;
    double v238 = var0 + var1;
    _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "range=(%f, %f), dataRange=(%f, %f)", buf, 0x2Au);
  }

  if (v13 >= var0 || v20 <= var0)
  {
    double v21 = var0 + var1;
    if (var0 >= v13 || v21 <= v13)
    {
      double v18 = 0.0;
      if (v13 != var0 || v12 <= 0.0)
      {
        double v17 = 0.0;
        goto LABEL_22;
      }
      double v17 = 0.0;
      if (var1 <= 0.0) {
        goto LABEL_22;
      }
    }
  }
  else
  {
    double v21 = var0 + var1;
  }
  if (v13 >= var0) {
    double v18 = v13;
  }
  else {
    double v18 = var0;
  }
  if (v20 < v21) {
    double v21 = v13 + v12;
  }
  double v17 = v21 - v18;
LABEL_22:
  double v22 = v13 + -1800.0;
  BOOL v23 = v13 + -1800.0 < var0;
  double v24 = v12 + v13 + -1800.0;
  if (v24 <= var0) {
    BOOL v23 = 0;
  }
  if (v8 != 4)
  {
    if (v23)
    {
      double v26 = var0 + var1;
    }
    else
    {
      double v26 = var0 + var1;
      if (var0 >= v22 || v26 <= v22)
      {
        double v13 = 0.0;
        if (v22 != var0 || v12 <= 0.0) {
          goto LABEL_209;
        }
        BOOL v27 = var1 <= 0.0;
        double v16 = 0.0;
        if (v27) {
          goto LABEL_57;
        }
      }
    }
    if (v22 >= var0) {
      double v13 = v22;
    }
    else {
      double v13 = var0;
    }
    if (v24 >= v26) {
      double v24 = v26;
    }
    goto LABEL_56;
  }
  if (v23)
  {
    double v25 = var0 + var1;
    goto LABEL_37;
  }
  double v25 = var0 + var1;
  BOOL v27 = var0 >= v22 || v25 <= v22;
  if (!v27)
  {
LABEL_37:
    if (v22 >= var0) {
      double v13 = var0;
    }
    else {
      double v13 = v22;
    }
    if (v24 < v25) {
      double v24 = v25;
    }
LABEL_56:
    double v16 = v24 - v13;
    goto LABEL_57;
  }
  double v13 = 0.0;
  if (v22 != var0 || v12 <= 0.0)
  {
LABEL_209:
    double v16 = 0.0;
    goto LABEL_57;
  }
  BOOL v27 = var1 <= 0.0;
  double v16 = 0.0;
  if (!v27) {
    goto LABEL_37;
  }
LABEL_57:
  v29 = PLLogCommon();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    double v232 = v13;
    __int16 v233 = 2048;
    double v234 = v13 + v16;
    _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "aggregateQueryRange=(%f, %f)", buf, 0x16u);
  }

LABEL_60:
  -[PLBatteryBreakdownService setShowGizmoQualifier:](self, "setShowGizmoQualifier:", -[PLBatteryBreakdownService wasGizmoConnectedInRange:](self, "wasGizmoConnectedInRange:", v18, v17));
  uint64_t v30 = -[PLBatteryBreakdownService energyEntriesWithRange:withEntryTimeInterval:withQueryType:](self, "energyEntriesWithRange:withEntryTimeInterval:withQueryType:", v8, v13, v16, a5);
  unint64_t v31 = 0x1E4F92000uLL;
  unsigned int v204 = v8;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v32 = objc_opt_class();
    v228[0] = MEMORY[0x1E4F143A8];
    v228[1] = 3221225472;
    v228[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke;
    v228[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v228[4] = v32;
    v33 = v228;
    if (qword_1EBD5A2F8 != -1) {
      dispatch_once(&qword_1EBD5A2F8, v33);
    }

    if (byte_1EBD5A26A)
    {
      [NSString stringWithFormat:@"energyEntries=%@", v30];
      double v34 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      uint64_t v35 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      uint64_t v37 = [v36 lastPathComponent];
      id v38 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]"];
      [v35 logMessage:*(void *)&v34 fromFile:v37 fromFunction:v38 fromLineNumber:755];

      uint64_t v39 = PLLogCommon();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v232 = v34;
        _os_log_debug_impl(&dword_1D2690000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      uint64_t v8 = v8;
      unint64_t v31 = 0x1E4F92000uLL;
    }
  }
  unint64_t v40 = -[PLBatteryBreakdownService addForegroundAndBackgroundDurations:withRange:withQueryType:](self, "addForegroundAndBackgroundDurations:withRange:withQueryType:", v30, v8, v13, v16);

  -[PLBatteryBreakdownService addNotificationValues:withRange:withQueryType:](self, "addNotificationValues:withRange:withQueryType:", v40, v8, v13, v16);
  double v41 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

  if (v8 == 4)
  {
    uint64_t v42 = [(PLBatteryBreakdownService *)self populateEnergyBucketKeysWithEntries:*(void *)&v41];
LABEL_69:

LABEL_70:
    double v41 = *(double *)&v42;
    goto LABEL_71;
  }
  if (v8 < 2)
  {
    if (v8 != 1) {
      goto LABEL_71;
    }
    uint64_t v42 = [(PLBatteryBreakdownService *)self populateBLDKeysWithEnergyEntries:*(void *)&v41];

    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_70;
    }
    uint64_t v186 = objc_opt_class();
    v226[0] = MEMORY[0x1E4F143A8];
    v226[1] = 3221225472;
    v226[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1086;
    v226[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v226[4] = v186;
    v187 = v226;
    if (qword_1EBD5A308 != -1) {
      dispatch_once(&qword_1EBD5A308, v187);
    }

    if (byte_1EBD5A26C)
    {
      [NSString stringWithFormat:@"after populating BLD keys: energyEntries=%@", v42];
      double v41 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v188 = (void *)MEMORY[0x1E4F929B8];
      v189 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      v190 = [v189 lastPathComponent];
      v191 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]"];
      [v188 logMessage:*(void *)&v41 fromFile:v190 fromFunction:v191 fromLineNumber:789];

      v123 = PLLogCommon();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v232 = v41;
        goto LABEL_211;
      }
LABEL_195:

      uint64_t v8 = v8;
      unint64_t v31 = 0x1E4F92000;
      goto LABEL_69;
    }
  }
  else
  {
    uint64_t v42 = [(PLBatteryBreakdownService *)self populateRootNodeEnergyKeysWithEnergyEntries:*(void *)&v41];

    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_70;
    }
    uint64_t v117 = objc_opt_class();
    v227[0] = MEMORY[0x1E4F143A8];
    v227[1] = 3221225472;
    v227[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1080;
    v227[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v227[4] = v117;
    v118 = v227;
    if (qword_1EBD5A300 != -1) {
      dispatch_once(&qword_1EBD5A300, v118);
    }

    if (byte_1EBD5A26B)
    {
      [NSString stringWithFormat:@"after populating root node energy keys: energyEntries=%@", v42];
      double v41 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v119 = (void *)MEMORY[0x1E4F929B8];
      v120 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      v121 = [v120 lastPathComponent];
      v122 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]"];
      [v119 logMessage:*(void *)&v41 fromFile:v121 fromFunction:v122 fromLineNumber:785];

      v123 = PLLogCommon();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v232 = v41;
LABEL_211:
        _os_log_debug_impl(&dword_1D2690000, v123, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        goto LABEL_195;
      }
      goto LABEL_195;
    }
  }
  double v41 = *(double *)&v42;
  uint64_t v8 = v8;
LABEL_71:
  uint64_t v43 = [(PLBatteryBreakdownService *)self applyStaticNameTransformationsWithEnergyEntries:*(void *)&v41];

  if ([*(id *)(v31 + 2496) debugEnabled])
  {
    uint64_t v44 = objc_opt_class();
    v225[0] = MEMORY[0x1E4F143A8];
    v225[1] = 3221225472;
    v225[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1092;
    v225[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v225[4] = v44;
    long long v45 = v225;
    if (qword_1EBD5A310 != -1) {
      dispatch_once(&qword_1EBD5A310, v45);
    }

    if (byte_1EBD5A26D)
    {
      [NSString stringWithFormat:@"after static transformations: energyEntries=%@", v43];
      double v46 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v47 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      uint64_t v49 = [v48 lastPathComponent];
      long long v50 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]"];
      [v47 logMessage:*(void *)&v46 fromFile:v49 fromFunction:v50 fromLineNumber:794];

      long long v51 = PLLogCommon();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v232 = v46;
        _os_log_debug_impl(&dword_1D2690000, v51, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      uint64_t v8 = v8;
      unint64_t v31 = 0x1E4F92000uLL;
    }
  }
  v52 = [(PLBatteryBreakdownService *)self combineDuplicatesWithEnergyEntries:v43];

  if ([*(id *)(v31 + 2496) debugEnabled])
  {
    uint64_t v53 = objc_opt_class();
    v224[0] = MEMORY[0x1E4F143A8];
    v224[1] = 3221225472;
    v224[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1098;
    v224[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v224[4] = v53;
    id v54 = v224;
    if (qword_1EBD5A318 != -1) {
      dispatch_once(&qword_1EBD5A318, v54);
    }

    if (byte_1EBD5A26E)
    {
      [NSString stringWithFormat:@"after combining duplicates: energyEntries=%@", v52];
      double v55 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      int v56 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      uint64_t v58 = [v57 lastPathComponent];
      v59 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]"];
      [v56 logMessage:*(void *)&v55 fromFile:v58 fromFunction:v59 fromLineNumber:798];

      v60 = PLLogCommon();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v232 = v55;
        _os_log_debug_impl(&dword_1D2690000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      uint64_t v8 = v8;
      unint64_t v31 = 0x1E4F92000uLL;
    }
  }
  v61 = [(PLBatteryBreakdownService *)self adjustExtensionBackgroundTimeWithEnergyEntries:v52];

  if ([*(id *)(v31 + 2496) debugEnabled])
  {
    uint64_t v62 = objc_opt_class();
    v223[0] = MEMORY[0x1E4F143A8];
    v223[1] = 3221225472;
    v223[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1104;
    v223[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v223[4] = v62;
    v63 = v223;
    if (qword_1EBD5A320 != -1) {
      dispatch_once(&qword_1EBD5A320, v63);
    }

    if (byte_1EBD5A26F)
    {
      [NSString stringWithFormat:@"After background time adjustment to extensions: energyEntries=%@", v61];
      double v64 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      long long v65 = (void *)MEMORY[0x1E4F929B8];
      long long v66 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      long long v67 = [v66 lastPathComponent];
      long long v68 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]"];
      [v65 logMessage:*(void *)&v64 fromFile:v67 fromFunction:v68 fromLineNumber:802];

      long long v69 = PLLogCommon();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v232 = v64;
        _os_log_debug_impl(&dword_1D2690000, v69, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      uint64_t v8 = v8;
      unint64_t v31 = 0x1E4F92000uLL;
    }
  }
  long long v70 = [(PLBatteryBreakdownService *)self applyDynamicNameTransformationsWithEnergyEntries:v61];

  if ([*(id *)(v31 + 2496) debugEnabled])
  {
    uint64_t v71 = objc_opt_class();
    v222[0] = MEMORY[0x1E4F143A8];
    v222[1] = 3221225472;
    v222[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1110;
    v222[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v222[4] = v71;
    long long v72 = v222;
    if (qword_1EBD5A328 != -1) {
      dispatch_once(&qword_1EBD5A328, v72);
    }

    if (byte_1EBD5A270)
    {
      [NSString stringWithFormat:@"after dynamic transformations: energyEntries=%@", v70];
      double v73 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      long long v74 = (void *)MEMORY[0x1E4F929B8];
      v75 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      v76 = [v75 lastPathComponent];
      v77 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]"];
      [v74 logMessage:*(void *)&v73 fromFile:v76 fromFunction:v77 fromLineNumber:807];

      v78 = PLLogCommon();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v232 = v73;
        _os_log_debug_impl(&dword_1D2690000, v78, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      uint64_t v8 = v8;
      unint64_t v31 = 0x1E4F92000uLL;
    }
  }
  v79 = [(PLBatteryBreakdownService *)self combineDuplicatesWithEnergyEntries:v70];

  if ([*(id *)(v31 + 2496) debugEnabled])
  {
    uint64_t v80 = objc_opt_class();
    v221[0] = MEMORY[0x1E4F143A8];
    v221[1] = 3221225472;
    v221[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1116;
    v221[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v221[4] = v80;
    v81 = v221;
    if (qword_1EBD5A330 != -1) {
      dispatch_once(&qword_1EBD5A330, v81);
    }

    if (byte_1EBD5A271)
    {
      [NSString stringWithFormat:@"after combining duplicates: energyEntries=%@", v79];
      double v82 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v83 = (void *)MEMORY[0x1E4F929B8];
      v84 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      v85 = [v84 lastPathComponent];
      v86 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]"];
      [v83 logMessage:*(void *)&v82 fromFile:v85 fromFunction:v86 fromLineNumber:811];

      v87 = PLLogCommon();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v232 = v82;
        _os_log_debug_impl(&dword_1D2690000, v87, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      uint64_t v8 = v8;
      unint64_t v31 = 0x1E4F92000uLL;
    }
  }
  if (v8 != 4)
  {
    v88 = [(PLBatteryBreakdownService *)self adjustForegroundTimesWithEnergyEntries:v79];

    v79 = [(PLBatteryBreakdownService *)self adjustBackgroundTimesWithEnergyEntries:v88];
  }
  v89 = [(PLBatteryBreakdownService *)self determineDisplayNamesWithEnergyEntries:v79];

  if ([*(id *)(v31 + 2496) debugEnabled])
  {
    uint64_t v90 = objc_opt_class();
    v220[0] = MEMORY[0x1E4F143A8];
    v220[1] = 3221225472;
    v220[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1119;
    v220[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v220[4] = v90;
    v91 = v220;
    if (qword_1EBD5A338 != -1) {
      dispatch_once(&qword_1EBD5A338, v91);
    }

    if (byte_1EBD5A272)
    {
      [NSString stringWithFormat:@"after determining display names: energyEntries=%@", v89];
      double v92 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v93 = (void *)MEMORY[0x1E4F929B8];
      v94 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      v95 = [v94 lastPathComponent];
      v96 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]"];
      [v93 logMessage:*(void *)&v92 fromFile:v95 fromFunction:v96 fromLineNumber:821];

      v97 = PLLogCommon();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v232 = v92;
        _os_log_debug_impl(&dword_1D2690000, v97, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      uint64_t v8 = v8;
      unint64_t v31 = 0x1E4F92000uLL;
    }
  }
  v98 = [(PLBatteryBreakdownService *)self filterWithEnergyEntries:v89 withQueryType:v8];

  if ([*(id *)(v31 + 2496) debugEnabled])
  {
    uint64_t v99 = objc_opt_class();
    v219[0] = MEMORY[0x1E4F143A8];
    v219[1] = 3221225472;
    v219[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1125;
    v219[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v219[4] = v99;
    v100 = v219;
    if (qword_1EBD5A340 != -1) {
      dispatch_once(&qword_1EBD5A340, v100);
    }

    if (byte_1EBD5A273)
    {
      [NSString stringWithFormat:@"after filtering based on query type: energyEntries=%@", v98];
      double v101 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v102 = (void *)MEMORY[0x1E4F929B8];
      v103 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      v104 = [v103 lastPathComponent];
      v105 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]"];
      [v102 logMessage:*(void *)&v101 fromFile:v104 fromFunction:v105 fromLineNumber:826];

      v106 = PLLogCommon();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v232 = v101;
        _os_log_debug_impl(&dword_1D2690000, v106, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      uint64_t v8 = v8;
      unint64_t v31 = 0x1E4F92000uLL;
    }
  }
  v107 = [(PLBatteryBreakdownService *)self filterEnergyEntriesBasedOnTime:v98 withQueryType:v8];

  v108 = [(PLBatteryBreakdownService *)self removeNodesNotToShowInInternalUI:v107 withQueryType:v8];

  long long v217 = 0u;
  long long v218 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  id v109 = v108;
  uint64_t v110 = [v109 countByEnumeratingWithState:&v215 objects:v230 count:16];
  if (v110)
  {
    uint64_t v111 = v110;
    uint64_t v112 = *(void *)v216;
    double v113 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v111; ++i)
      {
        if (*(void *)v216 != v112) {
          objc_enumerationMutation(v109);
        }
        v115 = [*(id *)(*((void *)&v215 + 1) + 8 * i) objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
        [v115 doubleValue];
        double v113 = v113 + v116;
      }
      uint64_t v111 = [v109 countByEnumeratingWithState:&v215 objects:v230 count:16];
    }
    while (v111);
  }
  else
  {
    double v113 = 0.0;
  }

  if ([*(id *)(v31 + 2496) debugEnabled])
  {
    uint64_t v124 = objc_opt_class();
    v214[0] = MEMORY[0x1E4F143A8];
    v214[1] = 3221225472;
    v214[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1134;
    v214[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v214[4] = v124;
    v125 = v214;
    if (qword_1EBD5A348 != -1) {
      dispatch_once(&qword_1EBD5A348, v125);
    }

    if (byte_1EBD5A274)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"totalEnergySum=%f", *(void *)&v113);
      double v126 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v127 = (void *)MEMORY[0x1E4F929B8];
      v128 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      v129 = [v128 lastPathComponent];
      v130 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]"];
      [v127 logMessage:*(void *)&v126 fromFile:v129 fromFunction:v130 fromLineNumber:838];

      v131 = PLLogCommon();
      if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v232 = v126;
        _os_log_debug_impl(&dword_1D2690000, v131, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v17 == 86400.0)
  {
    [(PLBatteryBreakdownService *)self setTotalEnergyDay:v113];
  }
  else if (v17 == 604800.0)
  {
    [(PLBatteryBreakdownService *)self setTotalEnergyWeek:v113];
  }
  v206 = self;
  long long v212 = 0u;
  long long v213 = 0u;
  long long v211 = 0u;
  long long v210 = 0u;
  id obj = v109;
  uint64_t v132 = [obj countByEnumeratingWithState:&v210 objects:v229 count:16];
  if (v132)
  {
    uint64_t v133 = v132;
    id v134 = 0;
    LODWORD(v135) = 0;
    uint64_t v136 = *(void *)v211;
    do
    {
      for (uint64_t j = 0; j != v133; ++j)
      {
        if (*(void *)v211 != v136) {
          objc_enumerationMutation(obj);
        }
        v138 = *(void **)(*((void *)&v210 + 1) + 8 * j);
        v139 = [(PLBatteryBreakdownService *)v206 qualifiersWithEnergyEntry:v138 bucketSize:v12 andTotalEnergy:v113];
        [v138 setObject:v139 forKeyedSubscript:@"PLBatteryUIAppQualifiersKey"];

        v140 = [v138 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
        [v140 doubleValue];
        double v142 = v141;

        v143 = [NSNumber numberWithDouble:v142];
        [v138 setObject:v143 forKeyedSubscript:@"PLBatteryUIAppEnergyUsedKey"];

        unsigned int v144 = llround(v142 * 100.0 / v113);
        if (v142 >= 2.0) {
          uint64_t v145 = v144;
        }
        else {
          uint64_t v145 = 0;
        }
        v146 = [NSNumber numberWithInt:v145];
        [v138 setObject:v146 forKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];

        v147 = v134;
        if (!v134
          || ([v134 objectForKeyedSubscript:@"PLBatteryUIAppEnergyUsedKey"],
              v148 = objc_claimAutoreleasedReturnValue(),
              [v148 doubleValue],
              double v150 = v149,
              v148,
              v142 > v150))
        {
          id v134 = v138;
        }
        uint64_t v135 = (v145 + v135);
      }
      uint64_t v133 = [obj countByEnumeratingWithState:&v210 objects:v229 count:16];
    }
    while (v133);
  }
  else
  {
    id v134 = 0;
    uint64_t v135 = 0;
  }
  v151 = obj;

  unsigned int v152 = v204;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v153 = objc_opt_class();
    v209[0] = MEMORY[0x1E4F143A8];
    v209[1] = 3221225472;
    v209[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1146;
    v209[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v209[4] = v153;
    v154 = v209;
    if (qword_1EBD5A350 != -1) {
      dispatch_once(&qword_1EBD5A350, v154);
    }

    if (byte_1EBD5A275)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"totalEnergyPercentSum=%i", v135);
      double v155 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v156 = (void *)MEMORY[0x1E4F929B8];
      v157 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      v158 = [v157 lastPathComponent];
      v159 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]"];
      [v156 logMessage:*(void *)&v155 fromFile:v158 fromFunction:v159 fromLineNumber:870];

      v160 = PLLogCommon();
      if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v232 = v155;
        _os_log_debug_impl(&dword_1D2690000, v160, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      unsigned int v152 = v204;
      v151 = obj;
    }
  }
  if (v135 != 100 && (int)v135 >= 1)
  {
    v161 = NSNumber;
    v162 = [v134 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
    [v162 doubleValue];
    v164 = [v161 numberWithDouble:v163 + 100.0 - (double)(int)v135];
    [v134 setObject:v164 forKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
  }
  [(PLBatteryBreakdownService *)v206 computeTotalForegroundDuration:v151];
  double v166 = v165;
  [(PLBatteryBreakdownService *)v206 computeTotalBackgroundDuration:v151];
  double v168 = v167;
  v169 = [MEMORY[0x1E4F1CA60] dictionary];
  v170 = [NSNumber numberWithDouble:v166];
  [v169 setObject:v170 forKeyedSubscript:@"PLBatteryUIForegroundTimeKey"];

  v171 = [NSNumber numberWithDouble:v168];
  [v169 setObject:v171 forKeyedSubscript:@"PLBatteryUIBackgroundTimeKey"];

  v172 = [NSNumber numberWithDouble:v113];
  [v169 setObject:v172 forKeyedSubscript:@"PLBatteryUITotalEnergyKey"];

  if (v152)
  {
    [MEMORY[0x1E4F92A88] defaultBatteryEnergyCapacity];
    v174 = objc_msgSend(NSString, "stringWithFormat:", @"%.00f%% of Battery", v113 * 100.0 / v173);
    [v169 setObject:v174 forKeyedSubscript:@"PLBatteryUIBatteryCyclesKey"];
  }
  [v151 enumerateObjectsUsingBlock:&__block_literal_global_1169];
  BOOL v175 = [(PLBatteryBreakdownService *)v206 shouldShowBatteryBreakdownWithTotalSumEnergy:v113 withtotalSumEnergyRatioCutOff:v202];
  if (v152 > 1 || v175 || v166 >= 60.0 || v168 >= 60.0 || [(PLOperator *)v206 isDebugEnabled])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v176 = objc_opt_class();
      v208[0] = MEMORY[0x1E4F143A8];
      v208[1] = 3221225472;
      v208[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_2;
      v208[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v208[4] = v176;
      v177 = v208;
      if (qword_1EBD5A358 != -1) {
        dispatch_once(&qword_1EBD5A358, v177);
      }

      if (byte_1EBD5A276)
      {
        double v178 = [NSString stringWithFormat:@"displaying battery breakdown"];
        v179 = (void *)MEMORY[0x1E4F929B8];
        v180 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
        v181 = [v180 lastPathComponent];
        v182 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]"];
        [v179 logMessage:*(void *)&v178 fromFile:v181 fromFunction:v182 fromLineNumber:905];

        v183 = PLLogCommon();
        if (os_log_type_enabled(v183, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          double v232 = v178;
          _os_log_debug_impl(&dword_1D2690000, v183, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v151 = obj;
      }
    }
    [v169 setObject:&unk_1F29E7510 forKeyedSubscript:@"PLBatteryUIErrorCodeKey"];
    v184 = v169;
    v185 = v151;
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v192 = objc_opt_class();
      v207[0] = MEMORY[0x1E4F143A8];
      v207[1] = 3221225472;
      v207[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1186;
      v207[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v207[4] = v192;
      v193 = v207;
      if (qword_1EBD5A360 != -1) {
        dispatch_once(&qword_1EBD5A360, v193);
      }

      if (byte_1EBD5A277)
      {
        double v194 = [NSString stringWithFormat:@"not enough energy consumed"];
        v195 = (void *)MEMORY[0x1E4F929B8];
        v196 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
        v197 = [v196 lastPathComponent];
        v198 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]"];
        [v195 logMessage:*(void *)&v194 fromFile:v197 fromFunction:v198 fromLineNumber:910];

        v199 = PLLogCommon();
        if (os_log_type_enabled(v199, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          double v232 = v194;
          _os_log_debug_impl(&dword_1D2690000, v199, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v151 = obj;
      }
    }
    [v169 setObject:&unk_1F29E7528 forKeyedSubscript:@"PLBatteryUIErrorCodeKey"];
    v185 = (void *)MEMORY[0x1E4F1CBF0];
    v184 = v169;
  }
  [v184 setObject:v185 forKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  id v200 = v169;

  return v200;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A26A = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1080(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A26B = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1086(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A26C = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1092(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A26D = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1098(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A26E = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1104(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A26F = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1110(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A270 = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1116(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A271 = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1119(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A272 = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1125(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A273 = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1134(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A274 = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1146(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A275 = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1166(uint64_t a1, void *a2)
{
  return [a2 removeObjectForKey:@"NotificationInfo"];
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A276 = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_1186(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A277 = result;
  return result;
}

- (id)nonNullValue:(id)a3 withKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:v6];
  }
  else
  {
    uint64_t v8 = &stru_1F294E108;
  }

  return v8;
}

- (id)suggestionsWithEnergyEntries:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = objc_opt_new();
  double v60 = 0.0;
  unint64_t v7 = 0x1E4F1C000;
  if ([(PLBatteryBreakdownService *)self shouldSuggestAutoLockWithEnergyEntries:v4 andSavedEnergyPercent:&v60])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v8 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v8;
      if (qword_1EBD5A368 != -1) {
        dispatch_once(&qword_1EBD5A368, block);
      }
      if (byte_1EBD5A278)
      {
        uint64_t v9 = [NSString stringWithFormat:@"suggesting autolock"];
        double v10 = (void *)MEMORY[0x1E4F929B8];
        double v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
        double v12 = [v11 lastPathComponent];
        double v13 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService suggestionsWithEnergyEntries:]"];
        [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:935];

        long long v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          long long v68 = v9;
          _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        unint64_t v7 = 0x1E4F1C000uLL;
      }
    }
    v65[0] = @"PLBatteryUISuggestionTypeKey";
    v65[1] = @"PLBatteryUISuggestionEnergyPercentKey";
    v66[0] = &unk_1F29E7528;
    unint64_t v15 = [NSNumber numberWithDouble:v60];
    v66[1] = v15;
    double v16 = [*(id *)(v7 + 2536) dictionaryWithObjects:v66 forKeys:v65 count:2];
    [v5 addObject:v16];

    ADClientSetValueForScalarKey();
    [v6 setObject:@"suggestion" forKeyedSubscript:@"category"];
    [v6 setObject:@"autoLock" forKeyedSubscript:@"type"];
    v57[5] = MEMORY[0x1E4F143A8];
    v57[6] = 3221225472;
    v57[7] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_1222;
    v57[8] = &unk_1E692A2A0;
    id v58 = v6;
    AnalyticsSendEventLazy();
  }
  if ([(PLBatteryBreakdownService *)self shouldSuggestAutoBrightnessWithEnergyEntries:v4 andSavedEnergyPercent:&v60])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v17 = objc_opt_class();
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_2;
      v57[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v57[4] = v17;
      if (qword_1EBD5A370 != -1) {
        dispatch_once(&qword_1EBD5A370, v57);
      }
      if (byte_1EBD5A279)
      {
        double v18 = [NSString stringWithFormat:@"suggesting autobrightness"];
        uint64_t v19 = (void *)MEMORY[0x1E4F929B8];
        double v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
        double v21 = [v20 lastPathComponent];
        double v22 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService suggestionsWithEnergyEntries:]"];
        [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:948];

        BOOL v23 = PLLogCommon();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          long long v68 = v18;
          _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        unint64_t v7 = 0x1E4F1C000uLL;
      }
    }
    v63[0] = @"PLBatteryUISuggestionTypeKey";
    v63[1] = @"PLBatteryUISuggestionEnergyPercentKey";
    v64[0] = &unk_1F29E7510;
    double v24 = [NSNumber numberWithDouble:v60];
    v64[1] = v24;
    double v25 = [*(id *)(v7 + 2536) dictionaryWithObjects:v64 forKeys:v63 count:2];
    [v5 addObject:v25];

    ADClientSetValueForScalarKey();
    [v6 setObject:@"suggestion" forKeyedSubscript:@"category"];
    [v6 setObject:@"autoBrightness" forKeyedSubscript:@"type"];
    v55[5] = MEMORY[0x1E4F143A8];
    v55[6] = 3221225472;
    v55[7] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_1235;
    v55[8] = &unk_1E692A2A0;
    id v56 = v6;
    AnalyticsSendEventLazy();
  }
  if ([(PLBatteryBreakdownService *)self shouldSuggestReduceBrightnessWithEnergyEntries:v4 andSavedEnergyPercent:&v60])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v26 = objc_opt_class();
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_2_1238;
      v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v55[4] = v26;
      if (qword_1EBD5A378 != -1) {
        dispatch_once(&qword_1EBD5A378, v55);
      }
      if (byte_1EBD5A27A)
      {
        BOOL v27 = [NSString stringWithFormat:@"suggesting reduce brightness"];
        v28 = (void *)MEMORY[0x1E4F929B8];
        v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
        uint64_t v30 = [v29 lastPathComponent];
        unint64_t v31 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService suggestionsWithEnergyEntries:]"];
        [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:961];

        uint64_t v32 = PLLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          long long v68 = v27;
          _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        unint64_t v7 = 0x1E4F1C000uLL;
      }
    }
    v61[0] = @"PLBatteryUISuggestionTypeKey";
    v61[1] = @"PLBatteryUISuggestionEnergyPercentKey";
    v62[0] = &unk_1F29E7540;
    v33 = [NSNumber numberWithDouble:v60];
    v62[1] = v33;
    double v34 = [*(id *)(v7 + 2536) dictionaryWithObjects:v62 forKeys:v61 count:2];
    [v5 addObject:v34];

    ADClientSetValueForScalarKey();
    [v6 setObject:@"suggestion" forKeyedSubscript:@"category"];
    [v6 setObject:@"reduceBrightness" forKeyedSubscript:@"type"];
    v53[5] = MEMORY[0x1E4F143A8];
    v53[6] = 3221225472;
    v53[7] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_1250;
    v53[8] = &unk_1E692A2A0;
    id v54 = v6;
    AnalyticsSendEventLazy();
  }
  if ([(PLBatteryBreakdownService *)self shouldShowOngoingRestoreInsight])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v35 = objc_opt_class();
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_2_1253;
      v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v53[4] = v35;
      if (qword_1EBD5A380 != -1) {
        dispatch_once(&qword_1EBD5A380, v53);
      }
      if (byte_1EBD5A27B)
      {
        uint64_t v36 = [NSString stringWithFormat:@"showing restore in progress"];
        uint64_t v37 = (void *)MEMORY[0x1E4F929B8];
        id v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
        uint64_t v39 = [v38 lastPathComponent];
        unint64_t v40 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService suggestionsWithEnergyEntries:]"];
        [v37 logMessage:v36 fromFile:v39 fromFunction:v40 fromLineNumber:974];

        double v41 = PLLogCommon();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          long long v68 = v36;
          _os_log_debug_impl(&dword_1D2690000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    ADClientSetValueForScalarKey();
    [v6 setObject:@"insight" forKeyedSubscript:@"category"];
    [v6 setObject:@"ongoingRestore" forKeyedSubscript:@"type"];
    v51[5] = MEMORY[0x1E4F143A8];
    v51[6] = 3221225472;
    v51[7] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_1266;
    v51[8] = &unk_1E692A2A0;
    id v52 = v6;
    AnalyticsSendEventLazy();
    [v5 addObject:&unk_1F29EAE40];
  }
  if ([(PLBatteryBreakdownService *)self shouldShowUpgradeInsightWithQueryType:0])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v42 = objc_opt_class();
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_1275;
      void v51[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v51[4] = v42;
      if (qword_1EBD5A388 != -1) {
        dispatch_once(&qword_1EBD5A388, v51);
      }
      if (byte_1EBD5A27C)
      {
        uint64_t v43 = [NSString stringWithFormat:@"suggesting high activity after upgrade"];
        uint64_t v44 = (void *)MEMORY[0x1E4F929B8];
        long long v45 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
        double v46 = [v45 lastPathComponent];
        v47 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService suggestionsWithEnergyEntries:]"];
        [v44 logMessage:v43 fromFile:v46 fromFunction:v47 fromLineNumber:1050];

        uint64_t v48 = PLLogCommon();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          long long v68 = v43;
          _os_log_debug_impl(&dword_1D2690000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    ADClientSetValueForScalarKey();
    [v6 setObject:@"insight" forKeyedSubscript:@"category"];
    [v6 setObject:@"upgradeUsage" forKeyedSubscript:@"type"];
    id v50 = v6;
    AnalyticsSendEventLazy();
    [v5 addObject:&unk_1F29EAE68];
  }
  return v5;
}

uint64_t __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A278 = result;
  return result;
}

id __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_1222(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A279 = result;
  return result;
}

id __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_1235(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_2_1238(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A27A = result;
  return result;
}

id __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_1250(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_2_1253(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A27B = result;
  return result;
}

id __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_1266(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_1275(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A27C = result;
  return result;
}

id __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_1285(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)shouldShowOngoingRestoreInsight
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F92A88] containerPath];
  objc_super v2 = (void *)_CFPreferencesCopyValueWithContainer();
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    long long v14 = __60__PLBatteryBreakdownService_shouldShowOngoingRestoreInsight__block_invoke;
    unint64_t v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v3;
    if (qword_1EBD5A390 != -1) {
      dispatch_once(&qword_1EBD5A390, &block);
    }
    if (byte_1EBD5A27D)
    {
      id v4 = [NSString stringWithFormat:@"shouldShowOngoingRestoreInsight = %@", v2, block, v13, v14, v15, v16];
      id v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      unint64_t v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService shouldShowOngoingRestoreInsight]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1073];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v18 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v2) {
    char v10 = [v2 BOOLValue];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

uint64_t __60__PLBatteryBreakdownService_shouldShowOngoingRestoreInsight__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A27D = result;
  return result;
}

- (BOOL)isBackgroundRefreshEnabled:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28F80] processInfo];
  char v5 = [v4 isLowPowerModeEnabled];

  if (v5)
  {
    char v6 = 1;
  }
  else
  {
    unint64_t v7 = (void *)CFPreferencesCopyAppValue(@"KeepAppsUpToDateAppList", @"com.apple.mt");
    uint64_t v8 = [v7 objectForKey:v3];
    uint64_t v9 = v8;
    if (v8) {
      char v6 = [v8 BOOLValue];
    }
    else {
      char v6 = 1;
    }
  }
  return v6;
}

- (BOOL)isBackgroundLocationUsageAlwaysEnabled:(id)a3 withLocationDict:(id)a4
{
  id v4 = [a4 objectForKeyedSubscript:a3];
  BOOL v5 = [MEMORY[0x1E4F1E600] entityAuthorizationForLocationDictionary:v4] == 4;

  return v5;
}

- (id)shouldSuggestBackgroundCPUWithEnergyEntries:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = 160;
  if (self->_totalEnergyDay == 0.0)
  {
    id v6 = 0;
  }
  else
  {
    unint64_t v7 = objc_opt_class();
    uint64_t v8 = [&unk_1F29EEFF0 objectAtIndexedSubscript:14];
    uint64_t v9 = [&unk_1F29EF008 objectAtIndexedSubscript:2];
    uint64_t v10 = [v7 rootNodeQualificationNameWithQualificationName:v8 withRootNodeName:v9];

    double v11 = (void *)v10;
    id v34 = v4;
    uint64_t v35 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v12 = v4;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          double v18 = [&unk_1F29EF020 objectAtIndexedSubscript:2];
          uint64_t v19 = [v17 objectForKeyedSubscript:v18];
          [v19 doubleValue];
          double v21 = v20;

          if (v21 != 0.0)
          {
            double v22 = [v17 objectForKeyedSubscript:v11];
            [v22 doubleValue];
            double v24 = v23;

            if (v24 / v21 * 100.0 > 5.0)
            {
              double v25 = v24 / *(double *)((char *)&self->super.super.super.isa + v5) * 100.0;
              if (v25 > 5.0)
              {
                v41[0] = @"PLBatteryUISuggestionEnergyKey";
                uint64_t v36 = [NSNumber numberWithDouble:v24];
                v41[1] = @"PLBatteryUISuggestionPercentKey";
                v42[0] = v36;
                uint64_t v26 = [NSNumber numberWithDouble:v25];
                v42[1] = v26;
                [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
                id v27 = v12;
                v28 = v11;
                uint64_t v29 = v5;
                v31 = uint64_t v30 = self;
                uint64_t v32 = [v17 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                [v35 setObject:v31 forKeyedSubscript:v32];

                self = v30;
                uint64_t v5 = v29;
                double v11 = v28;
                id v12 = v27;
              }
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v14);
    }

    if ([v35 count]) {
      id v6 = v35;
    }
    else {
      id v6 = 0;
    }

    id v4 = v34;
  }

  return v6;
}

- (id)shouldSuggestBackgroundLocationWithEnergyEntries:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_totalEnergyDay == 0.0)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = objc_opt_class();
    [&unk_1F29EF038 objectAtIndexedSubscript:2];
    unint64_t v7 = v52 = self;
    uint64_t v8 = [&unk_1F29EF050 objectAtIndexedSubscript:48];
    double v55 = [v6 rootNodeQualificationNameWithQualificationName:v7 withRootNodeName:v8];

    uint64_t v9 = self;
    uint64_t v10 = objc_opt_class();
    double v11 = [&unk_1F29EF068 objectAtIndexedSubscript:2];
    id v12 = [&unk_1F29EF080 objectAtIndexedSubscript:12];
    id v54 = [v10 rootNodeQualificationNameWithQualificationName:v11 withRootNodeName:v12];

    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [&unk_1F29EF098 objectAtIndexedSubscript:2];
    uint64_t v15 = [&unk_1F29EF0B0 objectAtIndexedSubscript:13];
    uint64_t v53 = [v13 rootNodeQualificationNameWithQualificationName:v14 withRootNodeName:v15];

    id v50 = v4;
    long long v51 = objc_opt_new();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v16 = v4;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v57 != v19) {
            objc_enumerationMutation(v16);
          }
          double v21 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          double v22 = [&unk_1F29EF0C8 objectAtIndexedSubscript:48];
          double v23 = [v21 objectForKeyedSubscript:v22];
          [v23 doubleValue];
          double v25 = v24;

          uint64_t v26 = [&unk_1F29EF0E0 objectAtIndexedSubscript:12];
          id v27 = [v21 objectForKeyedSubscript:v26];
          [v27 doubleValue];
          double v29 = v25 + v28;

          uint64_t v30 = [&unk_1F29EF0F8 objectAtIndexedSubscript:13];
          unint64_t v31 = [v21 objectForKeyedSubscript:v30];
          [v31 doubleValue];
          double v33 = v29 + v32;

          if (v33 != 0.0)
          {
            id v34 = [v21 objectForKeyedSubscript:v55];
            [v34 doubleValue];
            double v36 = v35;

            long long v37 = [v21 objectForKeyedSubscript:v54];
            [v37 doubleValue];
            double v39 = v36 + v38;

            long long v40 = [v21 objectForKeyedSubscript:v53];
            [v40 doubleValue];
            double v42 = v39 + v41;

            double v43 = v33 - v42;
            if (v33 - v42 < 0.0) {
              double v43 = 0.0;
            }
            if (v43 / v33 * 100.0 > 33.0)
            {
              double v44 = v43 / v9->_totalEnergyDay * 100.0;
              if (v44 > 5.0)
              {
                v60[0] = @"PLBatteryUISuggestionEnergyKey";
                long long v45 = objc_msgSend(NSNumber, "numberWithDouble:");
                v60[1] = @"PLBatteryUISuggestionPercentKey";
                v61[0] = v45;
                double v46 = [NSNumber numberWithDouble:v44];
                v61[1] = v46;
                v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
                uint64_t v48 = [v21 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                [v51 setObject:v47 forKeyedSubscript:v48];

                uint64_t v9 = v52;
              }
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v56 objects:v62 count:16];
      }
      while (v18);
    }

    if ([v51 count]) {
      id v5 = v51;
    }
    else {
      id v5 = 0;
    }
    id v4 = v50;
  }
  return v5;
}

- (BOOL)shouldSuggestAutoLockWithEnergyEntries:(id)a3 andSavedEnergyPercent:(double *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F74230] sharedConnection];
  unint64_t v7 = [v6 effectiveValueForSetting:*MEMORY[0x1E4F73F60]];

  if ([v7 intValue] == 0x7FFFFFFF)
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [&unk_1F29EF110 objectAtIndexedSubscript:9];
    uint64_t v10 = [&unk_1F29EF128 objectAtIndexedSubscript:10];
    double v11 = [v8 rootNodeQualificationNameWithQualificationName:v9 withRootNodeName:v10];

    id v12 = objc_opt_class();
    uint64_t v13 = [&unk_1F29EF140 objectAtIndexedSubscript:9];
    uint64_t v14 = [&unk_1F29EF158 objectAtIndexedSubscript:56];
    uint64_t v15 = [v12 rootNodeQualificationNameWithQualificationName:v13 withRootNodeName:v14];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v16 = v5;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
    double v32 = a4;
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v34;
      double v20 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(v16);
          }
          double v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          double v23 = [v22 objectForKeyedSubscript:v11];
          [v23 doubleValue];
          double v25 = v24;
          uint64_t v26 = [v22 objectForKeyedSubscript:v15];
          [v26 doubleValue];
          double v20 = v20 + v25 + v27;
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v18);
    }
    else
    {
      double v20 = 0.0;
    }

    [MEMORY[0x1E4F92A88] defaultBatteryEnergyCapacity];
    double *v32 = v20 * 100.0 / v29;
    [MEMORY[0x1E4F92A88] defaultBatteryEnergyCapacity];
    BOOL v28 = v20 > v30 * 0.01;
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

- (BOOL)shouldSuggestAutoBrightnessWithEnergyEntries:(id)a3 andSavedEnergyPercent:(double *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (+[PLDisplayAgent shouldLogALSPowerSaved])
  {
    id v6 = [MEMORY[0x1E4F929C0] objectForKey:@"BKEnableALS" forApplicationID:@"com.apple.backboardd" synchronize:1];
    unint64_t v7 = v6;
    if (!v6 || ([v6 BOOLValue] & 1) != 0)
    {
      BOOL v8 = 0;
LABEL_21:

      return v8;
    }
    uint64_t v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ALSPowerSaved"];
    uint64_t v10 = [(PLOperator *)self storage];
    double v11 = [v10 entriesForKey:v9];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v38 = v9;
      double v39 = a4;
      id v15 = 0;
      uint64_t v16 = *(void *)v41;
      double v17 = 0.0;
      do
      {
        uint64_t v18 = 0;
        uint64_t v19 = v15;
        do
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(v12);
          }
          double v20 = *(void **)(*((void *)&v40 + 1) + 8 * v18);
          if (v19)
          {
            double v21 = [v19 objectForKeyedSubscript:@"Power"];
            [v21 doubleValue];
            double v23 = v22;

            double v24 = [v20 entryDate];
            double v25 = [v19 entryDate];
            [v24 timeIntervalSinceDate:v25];
            double v27 = v26;

            double v17 = v17 + v23 * (v27 / 3600.0);
          }
          id v15 = v20;

          ++v18;
          uint64_t v19 = v15;
        }
        while (v14 != v18);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v14);

      if (!v15)
      {
        uint64_t v9 = v38;
        a4 = v39;
        goto LABEL_20;
      }
      BOOL v28 = [v15 objectForKeyedSubscript:@"Power"];
      [v28 doubleValue];
      double v30 = v29;

      unint64_t v31 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      double v32 = [v15 entryDate];
      [v31 timeIntervalSinceDate:v32];
      double v34 = v33;

      double v17 = v17 + v30 * (v34 / 3600.0);
      uint64_t v9 = v38;
      a4 = v39;
    }
    else
    {
      double v17 = 0.0;
      id v15 = v12;
    }

LABEL_20:
    objc_msgSend(MEMORY[0x1E4F92A88], "defaultBatteryEnergyCapacity", v38, v39, (void)v40);
    *a4 = v17 * 100.0 / v35;
    [MEMORY[0x1E4F92A88] defaultBatteryEnergyCapacity];
    BOOL v8 = v17 > v36 * 0.01;

    goto LABEL_21;
  }
  return 0;
}

- (BOOL)shouldSuggestReduceBrightnessWithEnergyEntries:(id)a3 andSavedEnergyPercent:(double *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([MEMORY[0x1E4F92A88] isALSCurveHigherThanDefault])
  {
    double v21 = a4;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      double v10 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v13 = [&unk_1F29EF170 objectAtIndexedSubscript:6];
          uint64_t v14 = [v12 objectForKeyedSubscript:v13];
          [v14 doubleValue];
          double v10 = v10 + v15;

          uint64_t v16 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
          [v16 doubleValue];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }
    else
    {
      double v10 = 0.0;
    }

    [MEMORY[0x1E4F92A88] defaultBatteryEnergyCapacity];
    *double v21 = v10 * 100.0 / v18;
    [MEMORY[0x1E4F92A88] defaultBatteryEnergyCapacity];
    BOOL v17 = v10 > v19 * 0.05;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (double)getLastUpgradeTimestamp
{
  objc_super v2 = [MEMORY[0x1E4F929C0] objectForKey:@"LastUpgradeTimestamp" forApplicationID:@"com.apple.powerlogd" synchronize:1];
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)getfirstEntryTimestampFromDb
{
  uint64_t v3 = *MEMORY[0x1E4F92D20];
  double v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"AppRunTime"];
  double v5 = [MEMORY[0x1E4F92968] entryKeyForType:v3 andName:*MEMORY[0x1E4F92B48]];
  id v6 = [MEMORY[0x1E4F92968] entryKeyForType:v3 andName:*MEMORY[0x1E4F92B20]];
  uint64_t v7 = [(PLOperator *)self storage];
  uint64_t v8 = [v7 entryForKey:v4 withID:1];

  uint64_t v9 = [(PLOperator *)self storage];
  double v10 = [v9 entryForKey:v5 withID:1];

  double v11 = [(PLOperator *)self storage];
  id v12 = [v11 entryForKey:v6 withID:1];

  if (v8) {
    BOOL v13 = v10 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13 || v12 == 0)
  {
    double v23 = 9.22337204e18;
  }
  else
  {
    double v15 = [v8 objectForKeyedSubscript:@"timestamp"];
    [v15 doubleValue];
    double v17 = v16;
    double v18 = [v10 objectForKeyedSubscript:@"timestamp"];
    [v18 doubleValue];
    double v20 = fmax(v17, v19);
    double v21 = [v12 objectForKeyedSubscript:@"timestamp"];
    [v21 doubleValue];
    double v23 = fmax(v20, v22);
  }
  return v23;
}

- (id)getUsageDataWithStartTime:(double)a3 withMidTime:(double)a4 withEndTime:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  double v9 = COERCE_DOUBLE(objc_alloc_init(MEMORY[0x1E4F1CA60]));
  [v8 timeIntervalSince1970];
  double v53 = v10;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v8 timeIntervalSince1970];
  double v14 = v13 - a4;
  [MEMORY[0x1E4F92A88] containerPath];
  double v15 = (void *)_CFPreferencesCopyValueWithContainer();
  double v16 = v15;
  if (v15)
  {
    [v15 doubleValue];
    double v18 = v17;
  }
  else
  {
    double v18 = 86400.0;
  }

  double v54 = a4;
  if (v14 <= v18)
  {
    [v8 timeIntervalSince1970];
    double v36 = v35;
    double v37 = a4 + -86400.0;
    double v19 = 0.0;
    double v38 = a3;
    BOOL v39 = v37 <= a3;
    double v28 = 0.0;
    double v25 = 0.0;
    double v34 = 0.0;
    double v31 = 0.0;
    if (!v39)
    {
      double v40 = v38;
      do
      {
        double v36 = v36 + -86400.0;
        long long v41 = -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 0, v37, v36 - v37, 0.0, 0.0, 3600.0);
        long long v42 = [v41 objectForKeyedSubscript:@"PLBatteryUITotalEnergyKey"];
        [v42 doubleValue];
        double v31 = v31 + v43;

        double v44 = [v41 objectForKeyedSubscript:@"PLBatteryUIForegroundTimeKey"];
        [v44 doubleValue];
        double v34 = v34 + v45;

        double v19 = v19 + v36 - v37;
        double v37 = v37 + -86400.0;
      }
      while (v37 > v40);
      double v25 = 0.0;
      double v28 = 0.0;
    }
  }
  else
  {
    double v19 = a4 - a3;
    [v8 timeIntervalSince1970];
    double v21 = -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 0, a4, v20 - a4, 0.0, 0.0, 3600.0);
    double v22 = -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 0, a3, a4 - a3, 0.0, 0.0, 3600.0);
    double v23 = [v21 objectForKeyedSubscript:@"PLBatteryUITotalEnergyKey"];
    [v23 doubleValue];
    double v25 = v24;

    double v26 = [v21 objectForKeyedSubscript:@"PLBatteryUIForegroundTimeKey"];
    [v26 doubleValue];
    double v28 = v27;

    double v29 = [v22 objectForKeyedSubscript:@"PLBatteryUITotalEnergyKey"];
    [v29 doubleValue];
    double v31 = v30;

    double v32 = [v22 objectForKeyedSubscript:@"PLBatteryUIForegroundTimeKey"];
    [v32 doubleValue];
    double v34 = v33;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    double v56 = v25;
    __int16 v57 = 2048;
    double v58 = v28;
    __int16 v59 = 2048;
    double v60 = v31;
    __int16 v61 = 2048;
    double v62 = v34;
    _os_log_impl(&dword_1D2690000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "afterUpgradeTotalEnergy: %f afterUpgradeDataTotalForeGroundTime: %f beforeUpgradeDataTotalEnergy: %f beforeUpgradeDataTotalForeGroundTime: %f", buf, 0x2Au);
  }
  double v46 = v28;
  double v47 = v53 - v54;
  if (v19 == 0.0)
  {
    [v11 setObject:0 forKeyedSubscript:@"AvgPower"];
    [v11 setObject:0 forKeyedSubscript:@"AvgForegroundTime"];
  }
  else
  {
    uint64_t v48 = [NSNumber numberWithDouble:v31 / v19];
    [v11 setObject:v48 forKeyedSubscript:@"AvgPower"];

    uint64_t v49 = [NSNumber numberWithDouble:v34 / v19];
    [v11 setObject:v49 forKeyedSubscript:@"AvgForegroundTime"];
  }
  if (v47 == 0.0)
  {
    [v12 setObject:0 forKeyedSubscript:@"AvgPower"];
    [v12 setObject:0 forKeyedSubscript:@"AvgForegroundTime"];
  }
  else
  {
    id v50 = [NSNumber numberWithDouble:v25 / v47];
    [v12 setObject:v50 forKeyedSubscript:@"AvgPower"];

    long long v51 = [NSNumber numberWithDouble:v46 / v47];
    [v12 setObject:v51 forKeyedSubscript:@"AvgForegroundTime"];
  }
  [*(id *)&v9 setObject:v11 forKeyedSubscript:@"beforeUpgradeData"];
  [*(id *)&v9 setObject:v12 forKeyedSubscript:@"afterUpgradeData"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v56 = v9;
    _os_log_impl(&dword_1D2690000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "-----Usage data--- %@", buf, 0xCu);
  }

  return *(id *)&v9;
}

- (id)getUpgradeDataWithLastUpgradeTimestamp:(double)a3 withFirstEntryTimestampFromDB:(double)a4 withNow:(id)a5 withBeforeUpgrade:(BOOL)a6 withRange:(_PLTimeIntervalRange)a7
{
  double var1 = a7.var1;
  double var0 = a7.var0;
  BOOL v9 = a6;
  id v13 = a5;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v9) {
    goto LABEL_6;
  }
  [v13 timeIntervalSince1970];
  double v16 = v15 - a3;
  [MEMORY[0x1E4F92A88] containerPath];
  double v17 = (void *)_CFPreferencesCopyValueWithContainer();
  double v18 = v17;
  if (v17)
  {
    [v17 doubleValue];
    double v20 = v19;
  }
  else
  {
    double v20 = 86400.0;
  }

  if (v16 <= v20)
  {
    [v13 timeIntervalSince1970];
    double v32 = a3 + -86400.0;
    double v27 = 0.0;
    double v24 = 0.0;
    if (v32 > a4)
    {
      double v33 = v31;
      do
      {
        double v33 = v33 + -86400.0;
        double v34 = -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 0, v32, v33 - v32, 0.0, 0.0, 3600.0);
        double v35 = [v34 objectForKeyedSubscript:@"PLBatteryUITotalEnergyKey"];
        [v35 doubleValue];
        double v37 = v24 + v36;

        double v38 = [v34 objectForKeyedSubscript:@"PLBatteryUIForegroundTimeKey"];
        [v38 doubleValue];
        double v24 = v37 + v39;

        double v32 = v32 + -86400.0;
      }
      while (v32 > a4);
    }
  }
  else
  {
LABEL_6:
    double v21 = -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 0, var0, var1, 0.0, 0.0, 3600.0);
    double v22 = [v21 objectForKeyedSubscript:@"PLBatteryUITotalEnergyKey"];
    [v22 doubleValue];
    double v24 = v23;

    double v25 = [v21 objectForKeyedSubscript:@"PLBatteryUIForegroundTimeKey"];
    [v25 doubleValue];
    double v27 = v26;
  }
  double v28 = [NSNumber numberWithDouble:v24];
  [v14 setObject:v28 forKey:@"TotalEnergy"];

  double v29 = [NSNumber numberWithDouble:v27];
  [v14 setObject:v29 forKey:@"TotalForeGroundTime"];

  return v14;
}

- (BOOL)shouldShowUpgradeInsightWithQueryType:(int)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  [(PLBatteryBreakdownService *)self getLastUpgradeTimestamp];
  if (v4 != 0.0)
  {
    double v6 = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v7 timeIntervalSince1970];
    double v9 = v8 - v6;
    [MEMORY[0x1E4F92A88] containerPath];
    double v10 = (void *)_CFPreferencesCopyValueWithContainer();
    id v11 = v10;
    if (v10)
    {
      [v10 doubleValue];
      double v13 = v12;
    }
    else
    {
      double v13 = 864000.0;
    }

    if (v9 >= v13
      || (([MEMORY[0x1E4F92A88] containerPath],
           id v14 = (void *)_CFPreferencesCopyValueWithContainer(),
           (double v15 = v14) == 0)
        ? (double v17 = 86400.0)
        : ([v14 doubleValue], double v17 = v16),
          v15,
          v9 <= v17))
    {
      BOOL v5 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v66) = 0;
        double v25 = MEMORY[0x1E4F14500];
        double v26 = "After upgrade time criteria not satisfied";
LABEL_16:
        _os_log_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v66, 2u);
        BOOL v5 = 0;
      }
    }
    else
    {
      [(PLBatteryBreakdownService *)self getfirstEntryTimestampFromDb];
      double v19 = v18;
      double v20 = v6 - v18;
      [MEMORY[0x1E4F92A88] containerPath];
      double v21 = (void *)_CFPreferencesCopyValueWithContainer();
      double v22 = v21;
      if (v21)
      {
        [v21 doubleValue];
        double v24 = v23;
      }
      else
      {
        double v24 = 259200.0;
      }

      if (v20 > v24)
      {
        [MEMORY[0x1E4F92A88] containerPath];
        double v27 = (void *)_CFPreferencesCopyValueWithContainer();
        double v28 = v27;
        if (v27)
        {
          [v27 doubleValue];
          double v30 = v29;
        }
        else
        {
          double v30 = 864000.0;
        }

        if (v20 >= v30)
        {
          [MEMORY[0x1E4F92A88] containerPath];
          double v31 = (void *)_CFPreferencesCopyValueWithContainer();
          double v32 = v31;
          if (v31)
          {
            [v31 doubleValue];
            double v34 = v33;
          }
          else
          {
            double v34 = 864000.0;
          }

          double v19 = v6 - v34;
        }
        double v35 = [(PLBatteryBreakdownService *)self getUsageDataWithStartTime:v7 withMidTime:v19 withEndTime:v6];
        double v36 = [v35 objectForKeyedSubscript:@"beforeUpgradeData"];
        double v37 = [v35 objectForKeyedSubscript:@"afterUpgradeData"];
        double v38 = [v36 objectForKeyedSubscript:@"AvgPower"];
        [v38 doubleValue];
        double v40 = v39;

        [MEMORY[0x1E4F92A10] defaultBatteryEnergyCapacity];
        double v42 = v40 * 86400.0 / v41;
        [MEMORY[0x1E4F92A88] containerPath];
        double v43 = (void *)_CFPreferencesCopyValueWithContainer();
        double v44 = v43;
        if (v43)
        {
          [v43 doubleValue];
          double v46 = v45;
        }
        else
        {
          double v46 = 0.3;
        }

        if (v42 >= v46)
        {
          double v47 = [v37 objectForKeyedSubscript:@"AvgPower"];
          [v47 doubleValue];
          double v49 = v48;

          id v50 = [v37 objectForKeyedSubscript:@"AvgForegroundTime"];
          [v50 doubleValue];
          double v52 = v51;

          [MEMORY[0x1E4F92A88] containerPath];
          double v53 = (void *)_CFPreferencesCopyValueWithContainer();
          double v54 = v53;
          double v55 = 1.3;
          double v56 = 1.3;
          if (v53)
          {
            [v53 doubleValue];
            double v56 = v57;
          }

          double v58 = v40 * v56;
          __int16 v59 = [v36 objectForKeyedSubscript:@"AvgForegroundTime"];
          [v59 doubleValue];
          double v61 = v60;
          [MEMORY[0x1E4F92A88] containerPath];
          double v62 = (void *)_CFPreferencesCopyValueWithContainer();
          uint64_t v63 = v62;
          if (v62)
          {
            [v62 doubleValue];
            double v55 = v64;
          }

          BOOL v5 = v52 >= v61 * v55 && v49 >= v58;
        }
        else
        {
          BOOL v5 = 0;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            int v66 = 134217984;
            double v67 = v42 * 100.0;
            _os_log_impl(&dword_1D2690000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Drain prior to upgrade: %f", (uint8_t *)&v66, 0xCu);
            BOOL v5 = 0;
          }
        }

        goto LABEL_43;
      }
      BOOL v5 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v66) = 0;
        double v25 = MEMORY[0x1E4F14500];
        double v26 = "There is not enough data pre-upgrade";
        goto LABEL_16;
      }
    }
LABEL_43:

    return v5;
  }
  BOOL v5 = 0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v66) = 0;
    _os_log_impl(&dword_1D2690000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Last upgrade timestamp not available", (uint8_t *)&v66, 2u);
    return 0;
  }
  return v5;
}

+ (id)defaults
{
  return &unk_1F29EAE90;
}

- (id)energyEntriesWithRange:(_PLTimeIntervalRange)a3 withEntryTimeInterval:(double)a4 withQueryType:(int)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  double v8 = self;
  uint64_t v181 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    v177[0] = MEMORY[0x1E4F143A8];
    v177[1] = 3221225472;
    v177[2] = __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke;
    v177[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v177[4] = v9;
    if (qword_1EBD5A398 != -1) {
      dispatch_once(&qword_1EBD5A398, v177);
    }
    if (byte_1EBD5A27E)
    {
      double v10 = objc_msgSend(NSString, "stringWithFormat:", @"entryTimeInterval=%f", *(void *)&a4);
      id v11 = (void *)MEMORY[0x1E4F929B8];
      double v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      double v13 = [v12 lastPathComponent];
      id v14 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService energyEntriesWithRange:withEntryTimeInterval:withQueryType:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:1504];

      double v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v179 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v16 = *MEMORY[0x1E4F92D20];
  uint64_t v17 = [MEMORY[0x1E4F92968] entryKeyForType:*MEMORY[0x1E4F92D20] andName:*MEMORY[0x1E4F92B48]];
  uint64_t v18 = [MEMORY[0x1E4F92968] entryKeyForType:v16 andName:*MEMORY[0x1E4F92B20]];
  double v19 = NSString;
  uint64_t v20 = *MEMORY[0x1E4F92B30];
  double v21 = [MEMORY[0x1E4F92908] entryKey];
  double v22 = [(id)objc_opt_class() whereValidName];
  uint64_t v23 = [v19 stringWithFormat:@"%@ IN (SELECT ID FROM '%@' WHERE %@)", v20, v21, v22];

  double v24 = var0 + var1;
  double v25 = [NSString stringWithFormat:@"timestamp>%f AND timestamp<%f AND timeInterval=%f AND (%@)", *(void *)&var0, *(void *)&v24, *(void *)&a4, v23];
  v161 = (void *)v17;
  double v150 = [NSString stringWithFormat:@"SELECT * FROM '%@' WHERE (%@);", v17, v25];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v26 = objc_opt_class();
    v176[0] = MEMORY[0x1E4F143A8];
    v176[1] = 3221225472;
    v176[2] = __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1550;
    v176[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v176[4] = v26;
    if (qword_1EBD5A3A0 != -1) {
      dispatch_once(&qword_1EBD5A3A0, v176);
    }
    if (byte_1EBD5A27F)
    {
      double v27 = [NSString stringWithFormat:@"aggregateRootNodeEnergyQuery=%@", v150];
      double v28 = (void *)MEMORY[0x1E4F929B8];
      double v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      double v30 = [v29 lastPathComponent];
      double v31 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService energyEntriesWithRange:withEntryTimeInterval:withQueryType:]"];
      [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:1517];

      double v32 = PLLogCommon();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v179 = v27;
        _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  double v33 = [(PLOperator *)v8 storage];
  double v149 = [v33 entriesForKey:v161 withQuery:v150];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v34 = objc_opt_class();
    v175[0] = MEMORY[0x1E4F143A8];
    v175[1] = 3221225472;
    v175[2] = __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1556;
    v175[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v175[4] = v34;
    if (qword_1EBD5A3A8 != -1) {
      dispatch_once(&qword_1EBD5A3A8, v175);
    }
    if (byte_1EBD5A280)
    {
      double v35 = [NSString stringWithFormat:@"aggregateRootNodeEnergyEntries=%@", v149];
      double v36 = (void *)MEMORY[0x1E4F929B8];
      double v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      double v38 = [v37 lastPathComponent];
      double v39 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService energyEntriesWithRange:withEntryTimeInterval:withQueryType:]"];
      [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:1521];

      double v40 = PLLogCommon();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v179 = v35;
        _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v41 = [NSString stringWithFormat:@"timestamp>%f AND timestamp<%f AND timeInterval=%f AND (%@)", *(void *)&var0, *(void *)&v24, *(void *)&a4, v23];

  unsigned int v144 = (void *)v41;
  uint64_t v42 = [NSString stringWithFormat:@"SELECT * FROM '%@' WHERE (%@);", v18, v41];
  v148 = (void *)v42;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v43 = objc_opt_class();
    v174[0] = MEMORY[0x1E4F143A8];
    v174[1] = 3221225472;
    v174[2] = __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1562;
    v174[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v174[4] = v43;
    if (qword_1EBD5A3B0 != -1) {
      dispatch_once(&qword_1EBD5A3B0, v174);
    }
    if (byte_1EBD5A281)
    {
      double v44 = [NSString stringWithFormat:@"aggregateQualificationEnergyQuery=%@", v42];
      double v45 = (void *)MEMORY[0x1E4F929B8];
      double v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      double v47 = [v46 lastPathComponent];
      double v48 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService energyEntriesWithRange:withEntryTimeInterval:withQueryType:]"];
      [v45 logMessage:v44 fromFile:v47 fromFunction:v48 fromLineNumber:1526];

      double v49 = PLLogCommon();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v179 = v44;
        _os_log_debug_impl(&dword_1D2690000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      uint64_t v42 = (uint64_t)v148;
    }
  }
  uint64_t v145 = (void *)v23;
  id v50 = [(PLOperator *)v8 storage];
  uint64_t v51 = [v50 entriesForKey:v18 withQuery:v42];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v52 = objc_opt_class();
    v173[0] = MEMORY[0x1E4F143A8];
    v173[1] = 3221225472;
    v173[2] = __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1568;
    v173[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v173[4] = v52;
    if (qword_1EBD5A3B8 != -1) {
      dispatch_once(&qword_1EBD5A3B8, v173);
    }
    if (byte_1EBD5A282)
    {
      double v53 = [NSString stringWithFormat:@"aggregateQualificationEnergyEntries=%@", v51];
      double v54 = (void *)MEMORY[0x1E4F929B8];
      double v55 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      double v56 = [v55 lastPathComponent];
      double v57 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService energyEntriesWithRange:withEntryTimeInterval:withQueryType:]"];
      [v54 logMessage:v53 fromFile:v56 fromFunction:v57 fromLineNumber:1530];

      double v58 = PLLogCommon();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v179 = v53;
        _os_log_debug_impl(&dword_1D2690000, v58, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v146 = (void *)v18;
  __int16 v59 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v169 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  v143 = (void *)v51;
  id obj = [v149 arrayByAddingObjectsFromArray:v51];
  uint64_t v166 = [obj countByEnumeratingWithState:&v169 objects:v180 count:16];
  if (v166)
  {
    uint64_t v164 = *MEMORY[0x1E4F92B58];
    uint64_t v165 = *(void *)v170;
    uint64_t v157 = *MEMORY[0x1E4F92B40];
    uint64_t v155 = *MEMORY[0x1E4F92B28];
    uint64_t v156 = *MEMORY[0x1E4F92B38];
    uint64_t v153 = *MEMORY[0x1E4F92B50];
    uint64_t v154 = *MEMORY[0x1E4F92B60];
    v159 = v59;
    double v163 = v8;
    do
    {
      uint64_t v60 = 0;
      unint64_t v61 = 0x1E4F92000uLL;
      do
      {
        if (*(void *)v170 != v165) {
          objc_enumerationMutation(obj);
        }
        double v62 = *(void **)(*((void *)&v169 + 1) + 8 * v60);
        if ([*(id *)(v61 + 2496) debugEnabled])
        {
          uint64_t v63 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1574;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v63;
          if (qword_1EBD5A3C0 != -1) {
            dispatch_once(&qword_1EBD5A3C0, block);
          }
          if (byte_1EBD5A283)
          {
            double v64 = [NSString stringWithFormat:@"aggregateEnergyEntry=%@", v62];
            long long v65 = (void *)MEMORY[0x1E4F929B8];
            int v66 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
            double v67 = [v66 lastPathComponent];
            uint64_t v68 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService energyEntriesWithRange:withEntryTimeInterval:withQueryType:]"];
            [v65 logMessage:v64 fromFile:v67 fromFunction:v68 fromLineNumber:1535];

            uint64_t v69 = PLLogCommon();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v179 = v64;
              _os_log_debug_impl(&dword_1D2690000, v69, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        long long v70 = [v62 objectForKeyedSubscript:v164];
        if (v70)
        {
          uint64_t v71 = [v59 objectForKeyedSubscript:v70];
          if (v71) {
            goto LABEL_52;
          }
          long long v72 = [MEMORY[0x1E4F1CA60] dictionary];
          [v59 setObject:v72 forKeyedSubscript:v70];

          uint64_t v71 = [v59 objectForKeyedSubscript:v70];
          double v73 = [(PLBatteryBreakdownService *)v8 nodeIDToNodeName];
          long long v74 = [v73 objectForKeyedSubscript:v70];

          if (v74)
          {
            [v71 setObject:v74 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];

LABEL_52:
            v75 = [v62 entryKey];
            int v76 = [v75 isEqualToString:v161];

            if (!v76)
            {
              v162 = [v62 objectForKeyedSubscript:v157];
              uint64_t v86 = objc_msgSend(&unk_1F29EF1A0, "objectAtIndexedSubscript:", (int)objc_msgSend(v162, "intValue"));
              v79 = [v62 objectForKeyedSubscript:v156];
              v87 = objc_msgSend(&unk_1F29EF1B8, "objectAtIndexedSubscript:", (int)objc_msgSend(v79, "intValue"));
              double v167 = (void *)v86;
              v88 = [(id)objc_opt_class() rootNodeQualificationNameWithQualificationName:v87 withRootNodeName:v86];
              v89 = [v62 objectForKeyedSubscript:v155];
              uint64_t v90 = NSNumber;
              v91 = [v71 objectForKeyedSubscript:v88];
              [v91 doubleValue];
              double v93 = v92;
              [v89 doubleValue];
              v95 = [v90 numberWithDouble:v93 + v94 / 1000.0];
              [v71 setObject:v95 forKeyedSubscript:v88];

              v96 = NSNumber;
              v97 = [v71 objectForKeyedSubscript:v87];
              [v97 doubleValue];
              double v99 = v98;
              [v89 doubleValue];
              double v101 = [v96 numberWithDouble:v99 + v100 / 1000.0];
              [v71 setObject:v101 forKeyedSubscript:v87];

              if (a5 == 4 && [v79 intValue] == 2)
              {
                uint64_t v102 = [(PLBatteryBreakdownService *)v163 energyMetricBucketForRootNodeID:v162];
                v103 = NSString;
                v104 = [NSNumber numberWithShort:v102];
                v105 = [v103 stringWithFormat:@"%@", v104];

                if (v105)
                {
                  v106 = [NSString stringWithFormat:@"%@%@", @"fg", v105];
                  int v107 = [v89 intValue];
                  if (v107 >= 1)
                  {
                    int v108 = v107;
                    v151 = NSNumber;
                    unsigned int v152 = [v71 objectForKeyedSubscript:v106];
                    id v109 = objc_msgSend(v151, "numberWithInt:", objc_msgSend(v152, "intValue") + v108);
                    [v71 setObject:v109 forKeyedSubscript:v106];
                  }
                }
              }
              double v8 = v163;
              uint64_t v77 = 0x1E4F92000;
LABEL_66:

              uint64_t v110 = v162;
              goto LABEL_79;
            }
            uint64_t v77 = v61;
            v78 = [v62 objectForKeyedSubscript:v154];
            double v167 = objc_msgSend(&unk_1F29EF188, "objectAtIndexedSubscript:", (int)objc_msgSend(v78, "intValue"));
            v79 = [v62 objectForKeyedSubscript:v153];
            if ([v78 intValue] == 58)
            {
              uint64_t v80 = PLLogCommon();
              unint64_t v81 = 0x1E4F28000uLL;
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
              {
                int v134 = [v78 intValue];
                [v79 doubleValue];
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v179 = v134;
                unint64_t v81 = 0x1E4F28000;
                *(_WORD *)&v179[4] = 2048;
                *(void *)&v179[6] = v135;
                _os_log_debug_impl(&dword_1D2690000, v80, OS_LOG_TYPE_DEBUG, "before clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
              }

              double v82 = *(void **)(v81 + 3792);
              [v79 doubleValue];
              v84 = objc_msgSend(v82, "numberWithDouble:", fmin(v83, 9000.0));

              v85 = PLLogCommon();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_84;
              }
              goto LABEL_71;
            }
            unint64_t v111 = 0x1E4F28000uLL;
            if ([v78 intValue] == 59)
            {
              uint64_t v112 = PLLogCommon();
              if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
              {
                int v136 = [v78 intValue];
                [v79 doubleValue];
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v179 = v136;
                *(_WORD *)&v179[4] = 2048;
                *(void *)&v179[6] = v137;
                _os_log_debug_impl(&dword_1D2690000, v112, OS_LOG_TYPE_DEBUG, "before clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
              }

              double v113 = NSNumber;
              [v79 doubleValue];
              v84 = objc_msgSend(v113, "numberWithDouble:", fmin(v114, 5500.0));

              v85 = PLLogCommon();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
              {
LABEL_84:
                int v138 = [v78 intValue];
                [v84 doubleValue];
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v179 = v138;
                *(_WORD *)&v179[4] = 2048;
                *(void *)&v179[6] = v139;
                _os_log_debug_impl(&dword_1D2690000, v85, OS_LOG_TYPE_DEBUG, "after clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
              }
LABEL_71:
              v115 = v78;

              v79 = v84;
              unint64_t v111 = 0x1E4F28000;
            }
            else
            {
              v115 = v78;
            }
            double v116 = *(void **)(v111 + 3792);
            uint64_t v117 = [v71 objectForKeyedSubscript:v167];
            [v117 doubleValue];
            double v119 = v118;
            [v79 doubleValue];
            v121 = [v116 numberWithDouble:v119 + v120 / 1000.0];
            [v71 setObject:v121 forKeyedSubscript:v167];

            v122 = *(void **)(v111 + 3792);
            v123 = [v71 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
            [v123 doubleValue];
            double v125 = v124;
            [v79 doubleValue];
            v127 = [v122 numberWithDouble:v125 + v126 / 1000.0];
            [v71 setObject:v127 forKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];

            if (a5 == 4)
            {
              uint64_t v110 = v115;
              uint64_t v128 = [(PLBatteryBreakdownService *)v163 energyMetricBucketForRootNodeID:v115];
              v129 = NSString;
              v130 = [*(id *)(v111 + 3792) numberWithShort:v128];
              v87 = [v129 stringWithFormat:@"%@", v130];

              if (v87)
              {
                int v131 = [v79 intValue];
                if (v131 >= 1)
                {
                  int v132 = v131;
                  v162 = v110;
                  uint64_t v133 = NSNumber;
                  v88 = [v71 objectForKeyedSubscript:v87];
                  uint64_t v77 = 0x1E4F92000;
                  v89 = objc_msgSend(v133, "numberWithInt:", objc_msgSend(v88, "intValue") + v132);
                  [v71 setObject:v89 forKeyedSubscript:v87];
                  double v8 = v163;
                  goto LABEL_66;
                }
              }
              double v8 = v163;
LABEL_79:
            }
            else
            {
              double v8 = v163;
              uint64_t v110 = v115;
            }
            __int16 v59 = v159;

            unint64_t v61 = v77;
          }
        }
        ++v60;
      }
      while (v166 != v60);
      uint64_t v140 = [obj countByEnumeratingWithState:&v169 objects:v180 count:16];
      uint64_t v166 = v140;
    }
    while (v140);
  }

  double v141 = [v59 allValues];

  return v141;
}

uint64_t __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A27E = result;
  return result;
}

uint64_t __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1550(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A27F = result;
  return result;
}

uint64_t __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1556(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A280 = result;
  return result;
}

uint64_t __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1562(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A281 = result;
  return result;
}

uint64_t __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1568(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A282 = result;
  return result;
}

uint64_t __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1574(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A283 = result;
  return result;
}

- (BOOL)isForegroundOnlyBucket:(signed __int16)a3
{
  return (a3 < 9) & (0x10Au >> a3);
}

- (signed)energyMetricBucketForRootNodeID:(id)a3
{
  unsigned int v3 = [a3 intValue] - 2;
  if (v3 > 0x3C) {
    return 0;
  }
  else {
    return word_1D2B032D0[v3];
  }
}

- (id)populateEnergyBucketKeysWithEntries:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = a3;
  uint64_t v31 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v36;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v3;
        double v4 = *(void **)(*((void *)&v35 + 1) + 8 * v3);
        __int16 v5 = 1;
        do
        {
          double v6 = NSString;
          uint64_t v7 = [NSNumber numberWithShort:v5];
          double v8 = [v6 stringWithFormat:@"%@", v7];

          uint64_t v9 = [NSString stringWithFormat:@"%@%@", @"fg", v8];
          double v10 = [NSString stringWithFormat:@"%@%@", @"bg", v8];
          id v11 = [v4 objectForKeyedSubscript:v8];
          uint64_t v12 = [v11 intValue];

          double v13 = [v4 objectForKeyedSubscript:v9];
          int v14 = [v13 intValue];

          if ([(PLBatteryBreakdownService *)self isForegroundOnlyBucket:v5])
          {
            int v14 = v12;
            if ((int)v12 >= 1)
            {
              double v15 = [NSNumber numberWithInt:v12];
              [v4 setObject:v15 forKeyedSubscript:v9];

              int v14 = v12;
            }
          }
          uint64_t v16 = (v12 - v14);
          if ((int)v16 >= 1)
          {
            uint64_t v17 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
            [v17 doubleValue];
            double v19 = v18;

            uint64_t v20 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
            [v20 doubleValue];
            double v22 = v21;

            double v23 = v19 + v22;
            if (v19 + v22 <= 0.0
              || ((double v23 = v19 / v23 * (double)(int)v12, (int)v16 >= (int)v23)
                ? (uint64_t v16 = (int)v23)
                : (uint64_t v16 = v16),
                  (int)v16 >= 1))
            {
              double v24 = objc_msgSend(NSNumber, "numberWithInt:", v16, v23);
              [v4 setObject:v24 forKeyedSubscript:v10];

              int v14 = v12 - v16;
              double v25 = [NSNumber numberWithInt:(v12 - v16)];
              [v4 setObject:v25 forKeyedSubscript:v9];
            }
          }
          uint64_t v26 = PLLogCommon();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            double v33 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            *(_DWORD *)buf = 138413314;
            double v40 = v33;
            __int16 v41 = 2112;
            uint64_t v42 = v8;
            __int16 v43 = 1024;
            int v44 = v12;
            __int16 v45 = 1024;
            int v46 = v14;
            __int16 v47 = 1024;
            int v48 = v16;
            _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@: %@ total:%d fg:%d bg:%d", buf, 0x28u);
          }
          unsigned int v27 = (unsigned __int16)v5++;
        }
        while (v27 < 0x11);
        uint64_t v3 = v32 + 1;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
    }
    while (v31);
  }
  return obj;
}

- (id)populateRootNodeEnergyKeysWithEnergyEntries:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = a3;
  uint64_t v40 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v40)
  {
    long long v37 = v52;
    uint64_t v39 = *(void *)v54;
    unint64_t v4 = 0x1E4F92000uLL;
    __int16 v43 = self;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v54 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v5;
        double v6 = *(void **)(*((void *)&v53 + 1) + 8 * v5);
        if ([*(id *)(v4 + 2496) debugEnabled])
        {
          uint64_t v7 = objc_opt_class();
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v52[0] = __73__PLBatteryBreakdownService_populateRootNodeEnergyKeysWithEnergyEntries___block_invoke;
          v52[1] = &__block_descriptor_40_e5_v8__0lu32l8;
          v52[2] = v7;
          if (qword_1EBD5A3C8 != -1) {
            dispatch_once(&qword_1EBD5A3C8, v51);
          }
          if (byte_1EBD5A284)
          {
            double v8 = [NSString stringWithFormat:@"energyEntry=%@", v6, v37];
            uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
            double v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
            id v11 = [v10 lastPathComponent];
            uint64_t v12 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService populateRootNodeEnergyKeysWithEnergyEntries:]"];
            [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:1753];

            double v13 = PLLogCommon();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              __int16 v59 = v8;
              _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v42 = [(PLBatteryBreakdownService *)self rootNodeNameToRootNodeEnergyKey];
        uint64_t v14 = [v42 countByEnumeratingWithState:&v47 objects:v57 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v44 = *(void *)v48;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v48 != v44) {
                objc_enumerationMutation(v42);
              }
              uint64_t v17 = *(void *)(*((void *)&v47 + 1) + 8 * v16);
              if ([*(id *)(v4 + 2496) debugEnabled])
              {
                uint64_t v18 = objc_opt_class();
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __73__PLBatteryBreakdownService_populateRootNodeEnergyKeysWithEnergyEntries___block_invoke_1607;
                block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                block[4] = v18;
                if (qword_1EBD5A3D0 != -1) {
                  dispatch_once(&qword_1EBD5A3D0, block);
                }
                if (byte_1EBD5A285)
                {
                  double v19 = [NSString stringWithFormat:@"rootNodeName=%@", v17];
                  uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
                  double v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
                  double v22 = [v21 lastPathComponent];
                  double v23 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService populateRootNodeEnergyKeysWithEnergyEntries:]"];
                  [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:1755];

                  double v24 = PLLogCommon();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    __int16 v59 = v19;
                    _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  self = v43;
                  unint64_t v4 = 0x1E4F92000uLL;
                }
              }
              double v25 = [(PLBatteryBreakdownService *)self rootNodeNameToRootNodeEnergyKey];
              uint64_t v26 = [v25 objectForKeyedSubscript:v17];

              if ([*(id *)(v4 + 2496) debugEnabled])
              {
                uint64_t v27 = objc_opt_class();
                v45[0] = MEMORY[0x1E4F143A8];
                v45[1] = 3221225472;
                v45[2] = __73__PLBatteryBreakdownService_populateRootNodeEnergyKeysWithEnergyEntries___block_invoke_1613;
                v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v45[4] = v27;
                if (qword_1EBD5A3D8 != -1) {
                  dispatch_once(&qword_1EBD5A3D8, v45);
                }
                if (byte_1EBD5A286)
                {
                  double v28 = [NSString stringWithFormat:@"rootNodeEnergyKey=%@", v26];
                  double v29 = (void *)MEMORY[0x1E4F929B8];
                  uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
                  uint64_t v31 = [v30 lastPathComponent];
                  uint64_t v32 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService populateRootNodeEnergyKeysWithEnergyEntries:]"];
                  [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:1758];

                  double v33 = PLLogCommon();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    __int16 v59 = v28;
                    _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  self = v43;
                  unint64_t v4 = 0x1E4F92000;
                }
              }
              uint64_t v34 = [v6 objectForKeyedSubscript:v17];
              if (v34) {
                long long v35 = (void *)v34;
              }
              else {
                long long v35 = &unk_1F29E7510;
              }
              [v6 setObject:v35 forKeyedSubscript:v26];

              ++v16;
            }
            while (v15 != v16);
            uint64_t v15 = [v42 countByEnumeratingWithState:&v47 objects:v57 count:16];
          }
          while (v15);
        }

        uint64_t v5 = v41 + 1;
      }
      while (v41 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v40);
  }
  return obj;
}

uint64_t __73__PLBatteryBreakdownService_populateRootNodeEnergyKeysWithEnergyEntries___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A284 = result;
  return result;
}

uint64_t __73__PLBatteryBreakdownService_populateRootNodeEnergyKeysWithEnergyEntries___block_invoke_1607(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A285 = result;
  return result;
}

uint64_t __73__PLBatteryBreakdownService_populateRootNodeEnergyKeysWithEnergyEntries___block_invoke_1613(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A286 = result;
  return result;
}

- (id)populateBLDKeysWithEnergyEntries:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = a3;
  uint64_t v62 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
  if (v62)
  {
    uint64_t v61 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v62; ++i)
      {
        if (*(void *)v71 != v61) {
          objc_enumerationMutation(obj);
        }
        unint64_t v4 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        uint64_t v5 = [&unk_1F29EF1D0 objectAtIndexedSubscript:15];
        double v6 = [v4 objectForKeyedSubscript:v5];

        if (v6) {
          uint64_t v7 = v6;
        }
        else {
          uint64_t v7 = &unk_1F29E7510;
        }
        [v4 setObject:v7 forKeyedSubscript:@"BLDEnergyAudio"];
        double v8 = [&unk_1F29EF1E8 objectAtIndexedSubscript:50];
        uint64_t v9 = [v4 objectForKeyedSubscript:v8];

        uint64_t v69 = (void *)v9;
        if (v9) {
          double v10 = (void *)v9;
        }
        else {
          double v10 = &unk_1F29E7510;
        }
        [v4 setObject:v10 forKeyedSubscript:@"BLDEnergyBluetooth"];
        id v11 = [&unk_1F29EF200 objectAtIndexedSubscript:37];
        uint64_t v12 = [v4 objectForKeyedSubscript:v11];

        uint64_t v68 = (void *)v12;
        if (v12) {
          double v13 = (void *)v12;
        }
        else {
          double v13 = &unk_1F29E7510;
        }
        [v4 setObject:v13 forKeyedSubscript:@"BLDEnergyCellData"];
        uint64_t v14 = [&unk_1F29EF218 objectAtIndexedSubscript:10];
        uint64_t v15 = [v4 objectForKeyedSubscript:v14];

        double v67 = (void *)v15;
        if (v15) {
          uint64_t v16 = (void *)v15;
        }
        else {
          uint64_t v16 = &unk_1F29E7510;
        }
        [v4 setObject:v16 forKeyedSubscript:@"BLDEnergyDisplay"];
        uint64_t v17 = [&unk_1F29EF230 objectAtIndexedSubscript:38];
        uint64_t v18 = [v4 objectForKeyedSubscript:v17];

        int v66 = (void *)v18;
        if (v18) {
          double v19 = (void *)v18;
        }
        else {
          double v19 = &unk_1F29E7510;
        }
        [v4 setObject:v19 forKeyedSubscript:@"BLDEnergyVoice"];
        uint64_t v20 = [&unk_1F29EF248 objectAtIndexedSubscript:11];
        uint64_t v21 = [v4 objectForKeyedSubscript:v20];

        long long v65 = (void *)v21;
        if (v21) {
          double v22 = (void *)v21;
        }
        else {
          double v22 = &unk_1F29E7510;
        }
        [v4 setObject:v22 forKeyedSubscript:@"BLDEnergyWiFi"];
        double v23 = [&unk_1F29EF260 objectAtIndexedSubscript:1];
        uint64_t v24 = [v4 objectForKeyedSubscript:v23];

        double v64 = (void *)v24;
        if (v24) {
          double v25 = (void *)v24;
        }
        else {
          double v25 = &unk_1F29E7510;
        }
        [v4 setObject:v25 forKeyedSubscript:@"BBCondition"];
        uint64_t v26 = objc_opt_class();
        uint64_t v27 = [&unk_1F29EF278 objectAtIndexedSubscript:2];
        double v28 = [&unk_1F29EF290 objectAtIndexedSubscript:2];
        uint64_t v63 = [v26 rootNodeQualificationNameWithQualificationName:v27 withRootNodeName:v28];

        uint64_t v29 = [v4 objectForKeyedSubscript:v63];
        uint64_t v30 = (void *)v29;
        if (v29) {
          uint64_t v31 = (void *)v29;
        }
        else {
          uint64_t v31 = &unk_1F29E7510;
        }
        [v4 setObject:v31 forKeyedSubscript:@"BLDEnergyFGCPU"];
        uint64_t v32 = [&unk_1F29EF2A8 objectAtIndexedSubscript:2];
        double v33 = [v4 objectForKeyedSubscript:v32];

        if (v33) {
          uint64_t v34 = v33;
        }
        else {
          uint64_t v34 = &unk_1F29E7510;
        }
        id v35 = v34;

        long long v36 = NSNumber;
        [v35 doubleValue];
        double v38 = v37;
        [v30 doubleValue];
        double v40 = v38 - v39;
        if (v40 < 0.0) {
          double v40 = 0.0;
        }
        uint64_t v41 = [v36 numberWithDouble:v40];
        [v4 setObject:v41 forKeyedSubscript:@"BLDEnergyBGCPU"];
        id v42 = objc_opt_class();
        __int16 v43 = [&unk_1F29EF2C0 objectAtIndexedSubscript:2];
        uint64_t v44 = [&unk_1F29EF2D8 objectAtIndexedSubscript:48];
        __int16 v45 = [v42 rootNodeQualificationNameWithQualificationName:v43 withRootNodeName:v44];

        uint64_t v46 = [v4 objectForKeyedSubscript:v45];
        long long v47 = (void *)v46;
        if (v46) {
          long long v48 = (void *)v46;
        }
        else {
          long long v48 = &unk_1F29E7510;
        }
        [v4 setObject:v48 forKeyedSubscript:@"BLDEnergyFGLocation"];
        long long v49 = [&unk_1F29EF2F0 objectAtIndexedSubscript:48];
        long long v50 = [v4 objectForKeyedSubscript:v49];

        if (v50) {
          uint64_t v51 = v50;
        }
        else {
          uint64_t v51 = &unk_1F29E7510;
        }
        id v52 = v51;

        long long v53 = NSNumber;
        [v52 doubleValue];
        double v55 = v54;
        [v47 doubleValue];
        double v57 = v55 - v56;
        if (v57 < 0.0) {
          double v57 = 0.0;
        }
        double v58 = [v53 numberWithDouble:v57];
        [v4 setObject:v58 forKeyedSubscript:@"BLDEnergyBGLocation"];
      }
      uint64_t v62 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
    }
    while (v62);
  }
  return obj;
}

- (id)addForegroundAndBackgroundDurations:(id)a3 withRange:(_PLTimeIntervalRange)a4 withQueryType:(int)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  id v122 = a3;
  uint64_t v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"AppRunTime"];
  double v141 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v140 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v139 = [MEMORY[0x1E4F1CA60] dictionary];
  int v138 = [MEMORY[0x1E4F1CA60] dictionary];
  int v137 = a5;
  if (a5 == 4)
  {
    int v136 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v135 = [MEMORY[0x1E4F1CA60] dictionary];
    int v134 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v133 = [MEMORY[0x1E4F1CA60] dictionary];
    int v132 = [MEMORY[0x1E4F1CA60] dictionary];
    int v131 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  else
  {
    int v131 = 0;
    int v132 = 0;
    uint64_t v133 = 0;
    int v134 = 0;
    uint64_t v135 = 0;
    int v136 = 0;
  }
  v121 = self;
  double v10 = [(PLOperator *)self storage];
  double v125 = (void *)v9;
  id v11 = objc_msgSend(v10, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v9, 3600.0, var0, var1);

  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v158 objects:v166 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v159;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v159 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v158 + 1) + 8 * i);
        id v19 = [v18 entryDate];
        if (v19)
        {
          uint64_t v20 = v19;
          [v19 timeIntervalSince1970];
          double v22 = v21;

          if (var0 <= v22 && v22 < var0 + var1) {
            [v12 addObject:v18];
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v158 objects:v166 count:16];
    }
    while (v15);
  }
  v123 = v13;

  double v124 = v12;
  uint64_t v24 = [MEMORY[0x1E4F929D0] summarizeAggregateEntries:v12];
  double v25 = [MEMORY[0x1E4F1CA80] set];
  long long v154 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  id obj = v24;
  uint64_t v26 = [obj countByEnumeratingWithState:&v154 objects:v165 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    id v128 = *(id *)v155;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(id *)v155 != v128) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void **)(*((void *)&v154 + 1) + 8 * j);
        uint64_t v30 = [v29 objectForKeyedSubscript:@"BundleID"];
        [v25 addObject:v30];
        uint64_t v31 = [v29 objectForKeyedSubscript:@"ScreenOnTime"];
        [v141 setObject:v31 forKeyedSubscript:v30];

        uint64_t v32 = [v29 objectForKeyedSubscript:@"BackgroundTime"];
        [v140 setObject:v32 forKeyedSubscript:v30];

        double v33 = [v29 objectForKeyedSubscript:@"ScreenOnPluggedInTime"];
        [v139 setObject:v33 forKeyedSubscript:v30];

        uint64_t v34 = [v29 objectForKeyedSubscript:@"BackgroundPluggedInTime"];
        [v138 setObject:v34 forKeyedSubscript:v30];

        if (v137 == 4)
        {
          id v35 = [v29 objectForKeyedSubscript:@"BackgroundLocationTime"];
          [v136 setObject:v35 forKeyedSubscript:v30];

          long long v36 = [v29 objectForKeyedSubscript:@"BackgroundLocationPluggedInTime"];
          [v135 setObject:v36 forKeyedSubscript:v30];

          double v37 = [v29 objectForKeyedSubscript:@"BackgroundAudioPlayingTime"];
          [v134 setObject:v37 forKeyedSubscript:v30];

          double v38 = [v29 objectForKeyedSubscript:@"BackgroundAudioPlayingTimePluggedIn"];
          [v133 setObject:v38 forKeyedSubscript:v30];

          double v39 = [v29 objectForKeyedSubscript:@"BackgroundLocationAudioTime"];
          [v132 setObject:v39 forKeyedSubscript:v30];

          double v40 = [v29 objectForKeyedSubscript:@"BackgroundLocationAudioPluggedInTime"];
          [v131 setObject:v40 forKeyedSubscript:v30];
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v154 objects:v165 count:16];
    }
    while (v27);
  }

  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  -[PLBatteryBreakdownService nonAppsRuntimesWithRange:](v121, "nonAppsRuntimesWithRange:", var0, var1);
  id v129 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = [v129 countByEnumeratingWithState:&v150 objects:v164 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v151;
    do
    {
      for (uint64_t k = 0; k != v42; ++k)
      {
        if (*(void *)v151 != v43) {
          objc_enumerationMutation(v129);
        }
        __int16 v45 = *(void **)(*((void *)&v150 + 1) + 8 * k);
        uint64_t v46 = [v45 objectForKeyedSubscript:@"BundleID"];
        [v25 addObject:v46];

        long long v47 = [v45 objectForKeyedSubscript:@"ScreenOnTime"];
        long long v48 = [v45 objectForKeyedSubscript:@"BundleID"];
        [v141 setObject:v47 forKeyedSubscript:v48];

        long long v49 = [v45 objectForKeyedSubscript:@"BackgroundTime"];
        long long v50 = [v45 objectForKeyedSubscript:@"BundleID"];
        [v140 setObject:v49 forKeyedSubscript:v50];
      }
      uint64_t v42 = [v129 countByEnumeratingWithState:&v150 objects:v164 count:16];
    }
    while (v42);
  }

  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  id v130 = v122;
  uint64_t v51 = [v130 countByEnumeratingWithState:&v146 objects:v163 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v147;
    do
    {
      for (uint64_t m = 0; m != v52; ++m)
      {
        if (*(void *)v147 != v53) {
          objc_enumerationMutation(v130);
        }
        double v55 = *(void **)(*((void *)&v146 + 1) + 8 * m);
        double v56 = [v55 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        int v57 = [v25 containsObject:v56];

        if (v57)
        {
          double v58 = [v55 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          [v25 removeObject:v58];
        }
        __int16 v59 = [v55 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        uint64_t v60 = NSNumber;
        uint64_t v61 = [v141 objectForKeyedSubscript:v59];
        [v61 doubleValue];
        uint64_t v62 = objc_msgSend(v60, "numberWithDouble:");
        [v55 setObject:v62 forKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];

        uint64_t v63 = NSNumber;
        double v64 = [v140 objectForKeyedSubscript:v59];
        [v64 doubleValue];
        long long v65 = objc_msgSend(v63, "numberWithDouble:");
        [v55 setObject:v65 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];

        int v66 = NSNumber;
        double v67 = [v139 objectForKeyedSubscript:v59];
        [v67 doubleValue];
        uint64_t v68 = objc_msgSend(v66, "numberWithDouble:");
        [v55 setObject:v68 forKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];

        uint64_t v69 = NSNumber;
        long long v70 = [v138 objectForKeyedSubscript:v59];
        [v70 doubleValue];
        long long v71 = objc_msgSend(v69, "numberWithDouble:");
        [v55 setObject:v71 forKeyedSubscript:@"PLBatteryUIAppBackgroundPluggedInRuntimeKey"];

        if (v137 == 4)
        {
          long long v72 = NSNumber;
          long long v73 = [v136 objectForKeyedSubscript:v59];
          [v73 doubleValue];
          long long v74 = objc_msgSend(v72, "numberWithDouble:");
          [v55 setObject:v74 forKeyedSubscript:@"PLBatteryUIAppBackgroundLocationRuntimeKey"];

          uint64_t v75 = NSNumber;
          int v76 = [v135 objectForKeyedSubscript:v59];
          [v76 doubleValue];
          uint64_t v77 = objc_msgSend(v75, "numberWithDouble:");
          [v55 setObject:v77 forKeyedSubscript:@"PLBatteryUIAppBackgroundLocationPluggedInRuntimeKey"];

          v78 = NSNumber;
          v79 = [v134 objectForKeyedSubscript:v59];
          [v79 doubleValue];
          uint64_t v80 = objc_msgSend(v78, "numberWithDouble:");
          [v55 setObject:v80 forKeyedSubscript:@"PLBatteryUIAppBackgroundAudioRuntimeKey"];

          unint64_t v81 = NSNumber;
          double v82 = [v133 objectForKeyedSubscript:v59];
          [v82 doubleValue];
          double v83 = objc_msgSend(v81, "numberWithDouble:");
          [v55 setObject:v83 forKeyedSubscript:@"PLBatteryUIAppBackgroundAudioPluggedInRuntimeKey"];

          v84 = NSNumber;
          v85 = [v132 objectForKeyedSubscript:v59];
          [v85 doubleValue];
          uint64_t v86 = objc_msgSend(v84, "numberWithDouble:");
          [v55 setObject:v86 forKeyedSubscript:@"PLBatteryUIAppBackgroundLocationAudioRuntimeKey"];

          v87 = NSNumber;
          v88 = [v131 objectForKeyedSubscript:v59];
          [v88 doubleValue];
          v89 = objc_msgSend(v87, "numberWithDouble:");
          [v55 setObject:v89 forKeyedSubscript:@"PLBatteryUIAppBackgroundLocationAudioPluggedInRuntimeKey"];
        }
      }
      uint64_t v52 = [v130 countByEnumeratingWithState:&v146 objects:v163 count:16];
    }
    while (v52);
  }

  uint64_t v90 = (void *)[v130 mutableCopy];
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  id v127 = v25;
  uint64_t v91 = [v127 countByEnumeratingWithState:&v142 objects:v162 count:16];
  unint64_t v92 = 0x1E4F1C000uLL;
  if (v91)
  {
    uint64_t v93 = v91;
    uint64_t v94 = *(void *)v143;
    do
    {
      for (uint64_t n = 0; n != v93; ++n)
      {
        if (*(void *)v143 != v94) {
          objc_enumerationMutation(v127);
        }
        uint64_t v96 = *(void *)(*((void *)&v142 + 1) + 8 * n);
        v97 = [*(id *)(v92 + 2656) dictionary];
        [v97 setObject:v96 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        [v97 setObject:&unk_1F29E7510 forKeyedSubscript:@"PLBatteryUIAppTypeKey"];
        double v98 = [v141 objectForKeyedSubscript:v96];
        [v97 setObject:v98 forKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];

        double v99 = [v140 objectForKeyedSubscript:v96];
        [v97 setObject:v99 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];

        double v100 = [v139 objectForKeyedSubscript:v96];
        [v97 setObject:v100 forKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];

        double v101 = [v138 objectForKeyedSubscript:v96];
        [v97 setObject:v101 forKeyedSubscript:@"PLBatteryUIAppBackgroundPluggedInRuntimeKey"];

        if (v137 == 4)
        {
          uint64_t v102 = NSNumber;
          v103 = [v136 objectForKeyedSubscript:v96];
          [v103 doubleValue];
          v104 = objc_msgSend(v102, "numberWithDouble:");
          [v97 setObject:v104 forKeyedSubscript:@"PLBatteryUIAppBackgroundLocationRuntimeKey"];

          v105 = NSNumber;
          v106 = [v135 objectForKeyedSubscript:v96];
          [v106 doubleValue];
          int v107 = objc_msgSend(v105, "numberWithDouble:");
          [v97 setObject:v107 forKeyedSubscript:@"PLBatteryUIAppBackgroundLocationPluggedInRuntimeKey"];

          int v108 = NSNumber;
          id v109 = [v134 objectForKeyedSubscript:v96];
          [v109 doubleValue];
          uint64_t v110 = objc_msgSend(v108, "numberWithDouble:");
          [v97 setObject:v110 forKeyedSubscript:@"PLBatteryUIAppBackgroundAudioRuntimeKey"];

          unint64_t v111 = NSNumber;
          uint64_t v112 = [v133 objectForKeyedSubscript:v96];
          [v112 doubleValue];
          double v113 = objc_msgSend(v111, "numberWithDouble:");
          [v97 setObject:v113 forKeyedSubscript:@"PLBatteryUIAppBackgroundAudioPluggedInRuntimeKey"];

          double v114 = NSNumber;
          v115 = [v132 objectForKeyedSubscript:v96];
          [v115 doubleValue];
          double v116 = objc_msgSend(v114, "numberWithDouble:");
          [v97 setObject:v116 forKeyedSubscript:@"PLBatteryUIAppBackgroundLocationAudioRuntimeKey"];

          unint64_t v92 = 0x1E4F1C000;
          uint64_t v117 = NSNumber;
          double v118 = [v131 objectForKeyedSubscript:v96];
          [v118 doubleValue];
          double v119 = objc_msgSend(v117, "numberWithDouble:");
          [v97 setObject:v119 forKeyedSubscript:@"PLBatteryUIAppBackgroundLocationAudioPluggedInRuntimeKey"];
        }
        [v97 setObject:&unk_1F29E7510 forKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
        [v90 addObject:v97];
      }
      uint64_t v93 = [v127 countByEnumeratingWithState:&v142 objects:v162 count:16];
    }
    while (v93);
  }

  return v90;
}

- (id)addNotificationValues:(id)a3 withRange:(_PLTimeIntervalRange)a4 withQueryType:(int)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v8 = a3;
  uint64_t v9 = [(PLOperator *)self storage];
  double v10 = objc_msgSend(v9, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", @"PLSpringBoardAgent_Aggregate_SBNotifications_Aggregate", 3600.0, var0, var1);

  id v11 = objc_opt_new();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__PLBatteryBreakdownService_addNotificationValues_withRange_withQueryType___block_invoke;
  v22[3] = &unk_1E6930E18;
  double v24 = var0;
  double v25 = var1;
  id v23 = v11;
  id v12 = v11;
  [v10 enumerateObjectsUsingBlock:v22];
  id v13 = [MEMORY[0x1E4F929D0] summarizeAggregateEntries:v12 withPrimaryKeys:&unk_1F29EF308];
  uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __75__PLBatteryBreakdownService_addNotificationValues_withRange_withQueryType___block_invoke_2;
  v20[3] = &unk_1E6930E40;
  id v15 = v14;
  id v21 = v15;
  [v13 enumerateObjectsUsingBlock:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__PLBatteryBreakdownService_addNotificationValues_withRange_withQueryType___block_invoke_1730;
  v18[3] = &unk_1E6930E68;
  id v19 = v15;
  id v16 = v15;
  [v8 enumerateObjectsUsingBlock:v18];

  return v8;
}

void __75__PLBatteryBreakdownService_addNotificationValues_withRange_withQueryType___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 entryDate];
  double v4 = *(double *)(a1 + 40);
  double v5 = *(double *)(a1 + 48);
  id v6 = v3;
  if (v6)
  {
    uint64_t v7 = v6;
    [v6 timeIntervalSince1970];
    double v9 = v8;
    double v10 = v4 + v5;

    if (v4 <= v9 && v9 < v10) {
      [*(id *)(a1 + 32) addObject:v12];
    }
  }
}

void __75__PLBatteryBreakdownService_addNotificationValues_withRange_withQueryType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = [(PLBatteryBreakdownNotificationInfo *)v3 objectForKeyedSubscript:@"NotificationType"];
  if (v4)
  {
    double v5 = (void *)v4;
    id v6 = [(PLBatteryBreakdownNotificationInfo *)v3 objectForKeyedSubscript:@"NotificationType"];
    if (![v6 intValue])
    {
LABEL_5:

      goto LABEL_6;
    }
    uint64_t v7 = [(PLBatteryBreakdownNotificationInfo *)v3 objectForKeyedSubscript:@"NotificationType"];
    if ([v7 intValue] == 3)
    {

      goto LABEL_5;
    }
    id v13 = [(PLBatteryBreakdownNotificationInfo *)v3 objectForKeyedSubscript:@"NotificationType"];
    int v14 = [v13 intValue];

    if (v14 == -1)
    {
LABEL_6:
      double v8 = [(PLBatteryBreakdownNotificationInfo *)v3 objectForKeyedSubscript:@"NotificationBundleID"];
      if (!v8)
      {
LABEL_17:

        goto LABEL_18;
      }
      double v9 = [[PLBatteryBreakdownNotificationInfo alloc] initWithEntry:v3];
      if (v9)
      {
        double v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];

        id v11 = *(void **)(a1 + 32);
        if (v10)
        {
          id v12 = [v11 objectForKeyedSubscript:v8];
          [v12 combineWith:v9];
        }
        else
        {
          [v11 setObject:v9 forKeyedSubscript:v8];
        }
        id v15 = PLLogCommon();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_16;
        }
        int v17 = 138412546;
        uint64_t v18 = v8;
        __int16 v19 = 2112;
        uint64_t v20 = v9;
        id v16 = "notification: %@ -> %@";
      }
      else
      {
        id v15 = PLLogCommon();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
LABEL_16:

          goto LABEL_17;
        }
        int v17 = 138412546;
        uint64_t v18 = v8;
        __int16 v19 = 2112;
        uint64_t v20 = v3;
        id v16 = "failed to init notification info for %@ %@";
      }
      _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v17, 0x16u);
      goto LABEL_16;
    }
  }
LABEL_18:
}

void __75__PLBatteryBreakdownService_addNotificationValues_withRange_withQueryType___block_invoke_1730(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (![*(id *)(a1 + 32) count]) {
    *a4 = 1;
  }
  id v6 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  if (v7)
  {
    [v8 setObject:v7 forKeyedSubscript:@"NotificationInfo"];
    [*(id *)(a1 + 32) removeObjectForKey:v6];
  }
}

- (id)nonAppsRuntimesWithRange:(_PLTimeIntervalRange)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  v12[3] = *MEMORY[0x1E4F143B8];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Torch"];
  [(PLBatteryBreakdownService *)self nonAppRuntimeWithEventForwardTableName:v7, @"Level", var0, var1 withRange andIdentificationKey];
  v11[0] = @"BundleID";
  v11[1] = @"ScreenOnTime";
  v12[0] = @"Flashlight";
  v12[1] = &unk_1F29E7510;
  v11[2] = @"BackgroundTime";
  id v8 = objc_msgSend(NSNumber, "numberWithDouble:");
  v12[2] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  [v6 addObject:v9];
  return v6;
}

- (double)nonAppRuntimeWithEventForwardTableName:(id)a3 withRange:(_PLTimeIntervalRange)a4 andIdentificationKey:(id)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  v45[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = objc_alloc(MEMORY[0x1E4F92A90]);
  id v12 = [NSNumber numberWithDouble:var0];
  uint64_t v13 = [v11 initWithKey:@"timestamp" withValue:v12 withComparisonOperation:5];

  int v14 = [(PLOperator *)self storage];
  double v38 = (void *)v13;
  v45[0] = v13;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  id v16 = [v14 lastEntryForKey:v9 withComparisons:v15 isSingleton:0];

  if (v16)
  {
    int v17 = [v16 objectForKeyedSubscript:v10];
    int v18 = [v17 BOOLValue];

    if (v18) {
      double v19 = var0;
    }
    else {
      double v19 = -1.0;
    }
  }
  else
  {
    double v19 = -1.0;
  }
  uint64_t v20 = [(PLOperator *)self storage];
  double v39 = v9;
  uint64_t v21 = objc_msgSend(v20, "entriesForKey:inTimeRange:withFilters:", v9, 0, var0, var1);

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  double v22 = [v21 reverseObjectEnumerator];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v41;
    double v26 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v41 != v25) {
          objc_enumerationMutation(v22);
        }
        double v28 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v29 = [v28 objectForKeyedSubscript:v10];
        int v30 = [v29 BOOLValue];

        if (v30)
        {
          if (v19 == -1.0)
          {
            uint64_t v31 = [v28 entryDate];
            [v31 timeIntervalSince1970];
            double v19 = v32;
          }
        }
        else
        {
          if (v19 != -1.0)
          {
            double v33 = [v28 entryDate];
            [v33 timeIntervalSince1970];
            double v35 = v34 - v19;

            double v26 = v26 + v35;
          }
          double v19 = -1.0;
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v24);
  }
  else
  {
    double v26 = 0.0;
  }

  if (v19 == -1.0) {
    double v36 = -0.0;
  }
  else {
    double v36 = var0 + var1 - v19;
  }

  return v26 + v36;
}

- (id)removeNodesNotToShowInInternalUI:(id)a3 withQueryType:(int)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 == 2 && ![(PLBatteryBreakdownService *)self showRootNodesInInternal])
  {
    id v19 = v6;
    id v20 = (id)objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "objectForKeyedSubscript:", @"PLBatteryUIAppTypeKey", v19);
          int v14 = [v13 intValue];

          if (v14 != 5)
          {
            id v15 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            id v16 = [(PLBatteryBreakdownService *)self intermediateRootNodes];
            char v17 = [v16 containsObject:v15];

            if ((v17 & 1) == 0 && [v15 rangeOfString:@"AssertionPID"] == 0x7FFFFFFFFFFFFFFFLL) {
              [v20 addObject:v12];
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    id v6 = v19;
  }
  else
  {
    id v20 = v6;
  }

  return v20;
}

- (id)filterEnergyEntriesBasedOnTime:(id)a3 withQueryType:(int)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  unsigned int v68 = a4;
  if (a4 == 4)
  {
    id v8 = v6;
    goto LABEL_62;
  }
  id v8 = (id)objc_opt_new();
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  int v66 = v7;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
  if (!v9) {
    goto LABEL_61;
  }
  uint64_t v10 = v9;
  uint64_t v70 = *(void *)v77;
  unint64_t v11 = 0x1E4F92000uLL;
  id v67 = v8;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v77 != v70) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v76 + 1) + 8 * v12);
      int v14 = [v13 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
      if ([*(id *)(v11 + 2496) debugEnabled])
      {
        uint64_t v15 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v15;
        if (qword_1EBD5A3E0 != -1) {
          dispatch_once(&qword_1EBD5A3E0, block);
        }
        if (byte_1EBD5A287)
        {
          [NSString stringWithFormat:@"Entry: %@ ========= %@", v14, v13];
          id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          char v17 = (void *)MEMORY[0x1E4F929B8];
          int v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
          id v19 = [v18 lastPathComponent];
          id v20 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService filterEnergyEntriesBasedOnTime:withQueryType:]"];
          [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:2102];

          long long v21 = PLLogCommon();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v81 = v16;
            _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          id v8 = v67;
          unint64_t v11 = 0x1E4F92000uLL;
        }
      }
      if ([(PLBatteryBreakdownService *)self appTypeForName:v14] == 1)
      {
        long long v22 = [(PLBatteryBreakdownService *)self adjustFGBGTimeForNonAppEnergyEntry:v13];
        [v8 addObject:v22];

        if ([*(id *)(v11 + 2496) debugEnabled])
        {
          uint64_t v23 = objc_opt_class();
          v74[0] = MEMORY[0x1E4F143A8];
          v74[1] = 3221225472;
          v74[2] = __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke_1740;
          v74[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v74[4] = v23;
          if (qword_1EBD5A3E8 != -1) {
            dispatch_once(&qword_1EBD5A3E8, v74);
          }
          if (byte_1EBD5A288)
          {
            long long v24 = [NSString stringWithFormat:@"Adding: NON APP"];
            uint64_t v25 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
            uint64_t v27 = [v26 lastPathComponent];
            double v28 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService filterEnergyEntriesBasedOnTime:withQueryType:]"];
            [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:2108];

            uint64_t v29 = PLLogCommon();
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
LABEL_48:

              unint64_t v11 = 0x1E4F92000;
              goto LABEL_56;
            }
LABEL_58:
            *(_DWORD *)buf = 138412290;
            unint64_t v81 = v24;
            _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            goto LABEL_48;
          }
        }
      }
      else
      {
        int v30 = [v13 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
        [v30 doubleValue];
        double v32 = v31;

        double v33 = [v13 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
        [v33 doubleValue];
        double v35 = v34;

        if (v68 > 1 || (v32 == 0.0 ? (BOOL v36 = v35 < 60.0) : (BOOL v36 = 0), !v36))
        {
          if (v32 > 0.0 && v32 < 60.0)
          {
            double v55 = [v13 objectForKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];
            [v55 doubleValue];
            double v57 = v56;

            double v58 = [NSNumber numberWithDouble:60.0 / v32 * v57];
            [v13 setObject:v58 forKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];

            [v13 setObject:&unk_1F29E75D0 forKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
            if ([*(id *)(v11 + 2496) debugEnabled])
            {
              uint64_t v59 = objc_opt_class();
              v72[0] = MEMORY[0x1E4F143A8];
              v72[1] = 3221225472;
              v72[2] = __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke_1760;
              v72[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v72[4] = v59;
              if (qword_1EBD5A3F8 != -1) {
                dispatch_once(&qword_1EBD5A3F8, v72);
              }
              if (byte_1EBD5A28A)
              {
                uint64_t v44 = [NSString stringWithFormat:@"Adding with Corrected FGTime"];
                uint64_t v60 = (void *)MEMORY[0x1E4F929B8];
                uint64_t v61 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
                uint64_t v62 = [v61 lastPathComponent];
                uint64_t v63 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService filterEnergyEntriesBasedOnTime:withQueryType:]"];
                [v60 logMessage:v44 fromFile:v62 fromFunction:v63 fromLineNumber:2140];

                long long v49 = PLLogCommon();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_59;
                }
                goto LABEL_54;
              }
            }
          }
          else if ([*(id *)(v11 + 2496) debugEnabled])
          {
            uint64_t v43 = objc_opt_class();
            v71[0] = MEMORY[0x1E4F143A8];
            v71[1] = 3221225472;
            v71[2] = __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke_1766;
            v71[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v71[4] = v43;
            if (qword_1EBD5A400 != -1) {
              dispatch_once(&qword_1EBD5A400, v71);
            }
            if (byte_1EBD5A28B)
            {
              uint64_t v44 = [NSString stringWithFormat:@"Adding without any changes"];
              __int16 v45 = (void *)MEMORY[0x1E4F929B8];
              uint64_t v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
              long long v47 = [v46 lastPathComponent];
              long long v48 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService filterEnergyEntriesBasedOnTime:withQueryType:]"];
              [v45 logMessage:v44 fromFile:v47 fromFunction:v48 fromLineNumber:2142];

              long long v49 = PLLogCommon();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
              {
LABEL_59:
                *(_DWORD *)buf = 138412290;
                unint64_t v81 = v44;
                _os_log_debug_impl(&dword_1D2690000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
LABEL_54:
              unint64_t v11 = 0x1E4F92000;

              id v8 = v67;
            }
          }
          [v8 addObject:v13];
          goto LABEL_56;
        }
        if (![v14 isEqualToString:@"com.apple.findmy"]) {
          goto LABEL_46;
        }
        double v37 = [&unk_1F29EF320 objectAtIndexedSubscript:59];
        double v38 = [v13 objectForKeyedSubscript:v37];
        [v38 doubleValue];
        double v40 = v39;

        if (v40 > 0.0)
        {
          [v8 addObject:v13];
          long long v41 = PLLogCommon();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v81 = @"com.apple.findmy";
            _os_log_debug_impl(&dword_1D2690000, v41, OS_LOG_TYPE_DEBUG, "skipping runtime filter for %@", buf, 0xCu);
          }
        }
        else
        {
LABEL_46:
          if ([*(id *)(v11 + 2496) debugEnabled])
          {
            uint64_t v50 = objc_opt_class();
            v73[0] = MEMORY[0x1E4F143A8];
            v73[1] = 3221225472;
            v73[2] = __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke_1752;
            v73[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v73[4] = v50;
            if (qword_1EBD5A3F0 != -1) {
              dispatch_once(&qword_1EBD5A3F0, v73);
            }
            if (byte_1EBD5A289)
            {
              long long v24 = [NSString stringWithFormat:@"Dropping: Low FG BG Time"];
              uint64_t v51 = (void *)MEMORY[0x1E4F929B8];
              uint64_t v52 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
              uint64_t v53 = [v52 lastPathComponent];
              double v54 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService filterEnergyEntriesBasedOnTime:withQueryType:]"];
              [v51 logMessage:v24 fromFile:v53 fromFunction:v54 fromLineNumber:2124];

              uint64_t v29 = PLLogCommon();
              if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_48;
              }
              goto LABEL_58;
            }
          }
        }
      }
LABEL_56:

      ++v12;
    }
    while (v10 != v12);
    uint64_t v64 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
    uint64_t v10 = v64;
  }
  while (v64);
LABEL_61:

  id v7 = v66;
LABEL_62:

  return v8;
}

uint64_t __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A287 = result;
  return result;
}

uint64_t __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke_1740(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A288 = result;
  return result;
}

uint64_t __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke_1752(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A289 = result;
  return result;
}

uint64_t __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke_1760(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A28A = result;
  return result;
}

uint64_t __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke_1766(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A28B = result;
  return result;
}

- (id)adjustFGBGTimeForNonAppEnergyEntry:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
  if (([v4 isEqualToString:@"HLS"] & 1) != 0
    || ([v4 isEqualToString:@"Siri"] & 1) != 0
    || ([v4 isEqualToString:@"DeletedApp"] & 1) != 0
    || ([v4 isEqualToString:@"DeletedAppClip"] & 1) != 0
    || [v4 isEqualToString:@"DeletedAppAndAppClip"])
  {
    double v5 = @"PLBatteryUIAppForegroundRuntimeKey";
  }
  else
  {
    if (![v4 isEqualToString:@"Flashlight"]) {
      goto LABEL_10;
    }
    double v5 = @"PLBatteryUIAppBackgroundRuntimeKey";
  }
  id v6 = [v3 objectForKeyedSubscript:v5];
  [v6 doubleValue];
  double v8 = v7;

  if (v8 < 60.0 && v8 > 0.0) {
    [v3 setObject:&unk_1F29E75D0 forKeyedSubscript:v5];
  }
LABEL_10:

  return v3;
}

- (double)computeTotalForegroundDuration:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
        [v9 doubleValue];
        double v7 = v7 + v10;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (double)computeTotalBackgroundDuration:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
        [v9 doubleValue];
        double v7 = v7 + v10;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (BOOL)checkHomeKitEvents
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F929E0] entryKeyForOperatorName:@"PLHomeKitAgent" withType:*MEMORY[0x1E4F92D48] withName:@"HomeKitEvents"];
  uint64_t v4 = [(PLOperator *)self storage];
  uint64_t v5 = [v4 countOfEntriesForKey:v3];

  uint64_t v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134217984;
    uint64_t v9 = v5;
    _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "Count of HomeKit events: %ld", (uint8_t *)&v8, 0xCu);
  }

  return v5 > 0;
}

- (id)applyStaticNameTransformationsWithEnergyEntries:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(PLBatteryBreakdownService *)self hasHomeKitActivity]) {
    [(PLBatteryBreakdownService *)self setHasHomeKitActivity:[(PLBatteryBreakdownService *)self checkHomeKitEvents]];
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v5 = v4;
  uint64_t v55 = [v5 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v55)
  {
    uint64_t v54 = *(void *)v61;
    unint64_t v6 = 0x1E4F92000uLL;
    id obj = v5;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v61 != v54) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v60 + 1) + 8 * v7);
        uint64_t v9 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        if ([*(id *)(v6 + 2496) debugEnabled])
        {
          uint64_t v10 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __77__PLBatteryBreakdownService_applyStaticNameTransformationsWithEnergyEntries___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v10;
          if (qword_1EBD5A408 != -1) {
            dispatch_once(&qword_1EBD5A408, block);
          }
          if (byte_1EBD5A28C)
          {
            unint64_t v11 = [NSString stringWithFormat:@"givenName=%@", v9];
            long long v12 = (void *)MEMORY[0x1E4F929B8];
            long long v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
            long long v14 = [v13 lastPathComponent];
            long long v15 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService applyStaticNameTransformationsWithEnergyEntries:]"];
            [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:2211];

            id v16 = PLLogCommon();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v65 = v11;
              _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v6 = 0x1E4F92000uLL;
          }
        }
        if ([v9 isEqualToString:@"com.apple.springboard.lockscreen.navigation"])
        {
          uint64_t v17 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];

          if (v17)
          {
            if ([*(id *)(v6 + 2496) debugEnabled])
            {
              uint64_t v18 = objc_opt_class();
              v58[0] = MEMORY[0x1E4F143A8];
              v58[1] = 3221225472;
              v58[2] = __77__PLBatteryBreakdownService_applyStaticNameTransformationsWithEnergyEntries___block_invoke_1781;
              v58[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              void v58[4] = v18;
              if (qword_1EBD5A410 != -1) {
                dispatch_once(&qword_1EBD5A410, v58);
              }
              if (byte_1EBD5A28D)
              {
                id v19 = [NSString stringWithFormat:@"Error lockscreen-navigation background time not zero"];
                id v20 = (void *)MEMORY[0x1E4F929B8];
                long long v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
                long long v22 = [v21 lastPathComponent];
                uint64_t v23 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService applyStaticNameTransformationsWithEnergyEntries:]"];
                [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:2215];

                long long v24 = PLLogCommon();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  long long v65 = v19;
                  _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                unint64_t v6 = 0x1E4F92000uLL;
              }
            }
            if ([*(id *)(v6 + 2496) debugEnabled])
            {
              uint64_t v25 = objc_opt_class();
              v57[0] = MEMORY[0x1E4F143A8];
              v57[1] = 3221225472;
              v57[2] = __77__PLBatteryBreakdownService_applyStaticNameTransformationsWithEnergyEntries___block_invoke_1787;
              v57[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v57[4] = v25;
              if (qword_1EBD5A418 != -1) {
                dispatch_once(&qword_1EBD5A418, v57);
              }
              if (byte_1EBD5A28E)
              {
                uint64_t v26 = [NSString stringWithFormat:@"lockscreen-navigation energyEntry = %@", v8];
                uint64_t v27 = (void *)MEMORY[0x1E4F929B8];
                double v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
                uint64_t v29 = [v28 lastPathComponent];
                int v30 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService applyStaticNameTransformationsWithEnergyEntries:]"];
                [v27 logMessage:v26 fromFile:v29 fromFunction:v30 fromLineNumber:2216];

                double v31 = PLLogCommon();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  long long v65 = v26;
                  _os_log_debug_impl(&dword_1D2690000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                unint64_t v6 = 0x1E4F92000;
              }
            }
          }
          double v32 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
          double v33 = NSNumber;
          [v32 doubleValue];
          double v35 = [v33 numberWithDouble:-v34];
          [v8 setObject:v35 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
        }
        else if ([v9 isEqualToString:@"com.apple.PassbookUIService"])
        {
          [v8 setObject:&unk_1F29F1090 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
        }
        BOOL v36 = [(PLBatteryBreakdownService *)self givenNameToMappedName];
        double v37 = [v36 objectForKeyedSubscript:v9];

        if ([*(id *)(v6 + 2496) debugEnabled])
        {
          uint64_t v38 = objc_opt_class();
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __77__PLBatteryBreakdownService_applyStaticNameTransformationsWithEnergyEntries___block_invoke_1795;
          v56[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v56[4] = v38;
          if (qword_1EBD5A420 != -1) {
            dispatch_once(&qword_1EBD5A420, v56);
          }
          if (byte_1EBD5A28F)
          {
            double v39 = [NSString stringWithFormat:@"mappedName=%@", v37];
            double v40 = (void *)MEMORY[0x1E4F929B8];
            long long v41 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
            long long v42 = [v41 lastPathComponent];
            uint64_t v43 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService applyStaticNameTransformationsWithEnergyEntries:]"];
            [v40 logMessage:v39 fromFile:v42 fromFunction:v43 fromLineNumber:2226];

            uint64_t v44 = PLLogCommon();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v65 = v39;
              _os_log_debug_impl(&dword_1D2690000, v44, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v6 = 0x1E4F92000;
          }
        }
        if (v37) {
          [v8 setObject:v37 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        }
        if ([(PLBatteryBreakdownService *)self hasHomeKitActivity])
        {
          __int16 v45 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          int v46 = [v45 isEqualToString:@"HomeKit"];

          if (v46)
          {
            long long v47 = PLLogCommon();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v65 = v8;
              _os_log_debug_impl(&dword_1D2690000, v47, OS_LOG_TYPE_DEBUG, "Energy Entry before mapping: %@", buf, 0xCu);
            }

            long long v48 = [(PLBatteryBreakdownService *)self installedBundleIDToDisplayName];
            long long v49 = [v48 objectForKeyedSubscript:@"com.apple.Home"];

            if (v49) {
              [v8 setObject:@"com.apple.Home" forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            }
            uint64_t v50 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
            [v8 setObject:v50 forKeyedSubscript:@"HomeKitEnergy"];

            uint64_t v51 = PLLogCommon();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v65 = v8;
              _os_log_debug_impl(&dword_1D2690000, v51, OS_LOG_TYPE_DEBUG, "Energy Entry after mapping: %@", buf, 0xCu);
            }
          }
        }

        ++v7;
      }
      while (v55 != v7);
      id v5 = obj;
      uint64_t v55 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    }
    while (v55);
  }

  return v5;
}

uint64_t __77__PLBatteryBreakdownService_applyStaticNameTransformationsWithEnergyEntries___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A28C = result;
  return result;
}

uint64_t __77__PLBatteryBreakdownService_applyStaticNameTransformationsWithEnergyEntries___block_invoke_1781(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A28D = result;
  return result;
}

uint64_t __77__PLBatteryBreakdownService_applyStaticNameTransformationsWithEnergyEntries___block_invoke_1787(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A28E = result;
  return result;
}

uint64_t __77__PLBatteryBreakdownService_applyStaticNameTransformationsWithEnergyEntries___block_invoke_1795(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A28F = result;
  return result;
}

- (id)bundleIDsForMappedName:(id)a3
{
  id v4 = a3;
  id v5 = [(PLBatteryBreakdownService *)self givenNameToMappedName];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__PLBatteryBreakdownService_bundleIDsForMappedName___block_invoke;
  v10[3] = &unk_1E6930E90;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 keysOfEntriesPassingTest:v10];

  int v8 = [v7 allObjects];

  return v8;
}

uint64_t __52__PLBatteryBreakdownService_bundleIDsForMappedName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isEqualToString:*(void *)(a1 + 32)];
}

- (id)adjustExtensionBackgroundTimeWithEnergyEntries:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        if (([v9 isEqualToString:@"com.apple.store.Jolly.spotlightindex"] & 1) != 0
          || [v9 isEqualToString:@"com.apple.mobilemail.DiagnosticExtension"])
        {
          [v8 setObject:&unk_1F29E7510 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
          [v8 setObject:&unk_1F29E7510 forKeyedSubscript:@"PLBatteryUIAppBackgroundPluggedInRuntimeKey"];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)applyDynamicNameTransformationsWithEnergyEntries:(id)a3
{
  uint64_t v4 = [(PLBatteryBreakdownService *)self mapDeletedAppsWithEnergyEntries:a3];
  uint64_t v5 = [(PLBatteryBreakdownService *)self mapPluginsToAppsWithEnergyEntries:v4];

  uint64_t v6 = [(PLBatteryBreakdownService *)self mapGizmoToAppsWithEnergyEntries:v5];

  uint64_t v7 = [(PLBatteryBreakdownService *)self reaccountExchangeEntriesWithEnergyEntries:v6];

  int v8 = [(PLBatteryBreakdownService *)self reaccountBackupRestoreWithEnergyEntries:v7];

  uint64_t v9 = [(PLBatteryBreakdownService *)self mapCloudDocsToAppsWithEnergyEntries:v8];

  return v9;
}

- (id)mapDeletedAppsWithEnergyEntries:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLBatteryBreakdownService *)self deletedAppNames];
  if ([v5 count])
  {
  }
  else
  {
    uint64_t v6 = [(PLBatteryBreakdownService *)self deletedAppClipNames];
    uint64_t v7 = [v6 count];

    if (!v7) {
      goto LABEL_46;
    }
  }
  int v8 = [(PLBatteryBreakdownService *)self deletedAppClipNames];
  if (![v8 count])
  {

LABEL_8:
    long long v12 = [(PLBatteryBreakdownService *)self deletedAppNames];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      long long v11 = @"DeletedApp";
    }
    else
    {
      long long v14 = [(PLBatteryBreakdownService *)self deletedAppClipNames];
      uint64_t v15 = [v14 count];

      long long v11 = @"DeletedAppClip";
      if (!v15) {
        long long v11 = 0;
      }
    }
    goto LABEL_12;
  }
  uint64_t v9 = [(PLBatteryBreakdownService *)self deletedAppNames];
  uint64_t v10 = [v9 count];

  if (!v10) {
    goto LABEL_8;
  }
  long long v11 = @"DeletedAppAndAppClip";
LABEL_12:
  long long v47 = v11;
  uint64_t v16 = PLLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    double v57 = v47;
    _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "Display Name for Deleted entry: %@", buf, 0xCu);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v45 = v4;
  id obj = v4;
  uint64_t v17 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v48 = *(void *)v52;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v52 != v48) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v51 + 1) + 8 * v19);
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v21 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __61__PLBatteryBreakdownService_mapDeletedAppsWithEnergyEntries___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v21;
          if (qword_1EBD5A428 != -1) {
            dispatch_once(&qword_1EBD5A428, block);
          }
          if (byte_1EBD5A290)
          {
            [NSString stringWithFormat:@"energyEntry=%@", v20];
            long long v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v23 = (void *)MEMORY[0x1E4F929B8];
            long long v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
            uint64_t v25 = [v24 lastPathComponent];
            uint64_t v26 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService mapDeletedAppsWithEnergyEntries:]"];
            [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:2291];

            uint64_t v27 = PLLogCommon();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              double v57 = v22;
              _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        double v28 = [(PLBatteryBreakdownService *)self deletedAppNames];
        uint64_t v29 = [v20 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        if ([v28 containsObject:v29])
        {
        }
        else
        {
          int v30 = [(PLBatteryBreakdownService *)self deletedAppClipNames];
          double v31 = [v20 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          int v32 = [v30 containsObject:v31];

          if (!v32) {
            goto LABEL_39;
          }
        }
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v33 = objc_opt_class();
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __61__PLBatteryBreakdownService_mapDeletedAppsWithEnergyEntries___block_invoke_1814;
          v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v49[4] = v33;
          if (qword_1EBD5A430 != -1) {
            dispatch_once(&qword_1EBD5A430, v49);
          }
          if (byte_1EBD5A291)
          {
            double v34 = [NSString stringWithFormat:@"this is a deleted app"];
            double v35 = (void *)MEMORY[0x1E4F929B8];
            BOOL v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
            double v37 = [v36 lastPathComponent];
            uint64_t v38 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService mapDeletedAppsWithEnergyEntries:]"];
            [v35 logMessage:v34 fromFile:v37 fromFunction:v38 fromLineNumber:2294];

            double v39 = PLLogCommon();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              double v57 = v34;
              _os_log_debug_impl(&dword_1D2690000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        double v40 = PLLogCommon();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "This is a deleted entity", buf, 2u);
        }

        [v20 setObject:v47 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
LABEL_39:
        long long v41 = [v20 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        int v42 = [v41 containsString:@"Unspecified"];

        if (v42)
        {
          uint64_t v43 = PLLogCommon();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D2690000, v43, OS_LOG_TYPE_DEFAULT, "AppDeletion : Found an unspecified entry so refactoring", buf, 2u);
          }

          [v20 setObject:@"DeletedApp" forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        }
        ++v19;
      }
      while (v18 != v19);
      uint64_t v18 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v18);
  }

  id v4 = v45;
LABEL_46:
  return v4;
}

uint64_t __61__PLBatteryBreakdownService_mapDeletedAppsWithEnergyEntries___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A290 = result;
  return result;
}

uint64_t __61__PLBatteryBreakdownService_mapDeletedAppsWithEnergyEntries___block_invoke_1814(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A291 = result;
  return result;
}

- (id)mapPluginsToAppsWithEnergyEntries:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = a3;
  uint64_t v41 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v41)
  {
    uint64_t v40 = *(void *)v45;
    unint64_t v4 = 0x1E4F92000uLL;
    uint64_t v5 = @"PluginType";
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v45 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = v5;
        int v8 = *(void **)(*((void *)&v44 + 1) + 8 * v6);
        if ([*(id *)(v4 + 2496) debugEnabled])
        {
          uint64_t v9 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __63__PLBatteryBreakdownService_mapPluginsToAppsWithEnergyEntries___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v9;
          if (qword_1EBD5A438 != -1) {
            dispatch_once(&qword_1EBD5A438, block);
          }
          if (byte_1EBD5A292)
          {
            uint64_t v10 = [NSString stringWithFormat:@"energyEntry=%@", v8];
            long long v11 = (void *)MEMORY[0x1E4F929B8];
            long long v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
            uint64_t v13 = [v12 lastPathComponent];
            long long v14 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService mapPluginsToAppsWithEnergyEntries:]"];
            [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:2317];

            uint64_t v15 = PLLogCommon();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v49 = v10;
              _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v4 = 0x1E4F92000uLL;
          }
        }
        uint64_t v16 = [(PLBatteryBreakdownService *)self installedPluginBundleIDToPluginEntry];
        uint64_t v17 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        uint64_t v18 = [v16 objectForKeyedSubscript:v17];

        uint64_t v5 = v7;
        if (v18)
        {
          if ([*(id *)(v4 + 2496) debugEnabled])
          {
            uint64_t v19 = objc_opt_class();
            v42[0] = MEMORY[0x1E4F143A8];
            v42[1] = 3221225472;
            void v42[2] = __63__PLBatteryBreakdownService_mapPluginsToAppsWithEnergyEntries___block_invoke_1823;
            v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v42[4] = v19;
            if (qword_1EBD5A440 != -1) {
              dispatch_once(&qword_1EBD5A440, v42);
            }
            if (byte_1EBD5A293)
            {
              id v20 = [NSString stringWithFormat:@"this is a plugin"];
              uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
              long long v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
              uint64_t v23 = [v22 lastPathComponent];
              long long v24 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService mapPluginsToAppsWithEnergyEntries:]"];
              [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:2322];

              uint64_t v25 = PLLogCommon();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                long long v49 = v20;
                _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v4 = 0x1E4F92000;
              uint64_t v5 = v7;
            }
          }
          uint64_t v26 = [v18 objectForKeyedSubscript:@"PluginId"];
          char v27 = [v26 isEqualToString:@"com.apple.AppStore.ProductPageExtension"];

          if ((v27 & 1) == 0)
          {
            double v28 = [v18 objectForKeyedSubscript:@"PluginParentApp"];
            [v8 setObject:v28 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];

            uint64_t v29 = [v18 objectForKeyedSubscript:v5];
            int v30 = [v29 isEqualToString:@"com.apple.watchkit"];

            if (v30)
            {
              double v31 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
              [v8 setObject:v31 forKeyedSubscript:@"WatchEnergy"];
            }
            else
            {
              int v32 = [v18 objectForKeyedSubscript:v5];
              int v33 = [v32 isEqualToString:@"com.apple.widgetkit-extension"];

              if (!v33) {
                goto LABEL_28;
              }
              double v34 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
              [v8 setObject:v34 forKeyedSubscript:@"ChronoWidgetEnergy"];

              double v31 = PLLogCommon();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                double v35 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                BOOL v36 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
                [v36 doubleValue];
                *(_DWORD *)buf = 138412546;
                long long v49 = v35;
                __int16 v50 = 2048;
                uint64_t v51 = v37;
                _os_log_debug_impl(&dword_1D2690000, v31, OS_LOG_TYPE_DEBUG, "Widget Energy for %@ : %f", buf, 0x16u);

                uint64_t v5 = v7;
              }
            }
          }
        }
LABEL_28:

        ++v6;
      }
      while (v41 != v6);
      uint64_t v41 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v41);
  }
  return obj;
}

uint64_t __63__PLBatteryBreakdownService_mapPluginsToAppsWithEnergyEntries___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A292 = result;
  return result;
}

uint64_t __63__PLBatteryBreakdownService_mapPluginsToAppsWithEnergyEntries___block_invoke_1823(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A293 = result;
  return result;
}

- (id)mapGizmoToAppsWithEnergyEntries:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v56 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v10 = [(PLBatteryBreakdownService *)self gizmoDaemonToAppBundleID];
        long long v11 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        long long v12 = [v10 objectForKeyedSubscript:v11];

        if (v12)
        {
          [v9 setObject:v12 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          uint64_t v13 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
          [v9 setObject:v13 forKeyedSubscript:@"WatchEnergy"];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v6);
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v52 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v51 + 1) + 8 * j);
        id v20 = [v19 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        if ([v20 hasSuffix:@"/watch"])
        {
          uint64_t v21 = objc_msgSend(v20, "substringWithRange:", 0, objc_msgSend(v20, "length") - 6);
          [v19 setObject:v21 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];

          long long v22 = [v19 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
          [v19 setObject:v22 forKeyedSubscript:@"WatchEnergy"];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v16);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v23 = v14;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v48 != v26) {
          objc_enumerationMutation(v23);
        }
        double v28 = *(void **)(*((void *)&v47 + 1) + 8 * k);
        uint64_t v29 = [v28 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        if ([v29 hasSuffix:@".watchkitextension"])
        {
          int v30 = objc_msgSend(v29, "substringWithRange:", 0, objc_msgSend(v29, "length") - 18);
          [v28 setObject:v30 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];

          double v31 = [v28 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
          [v28 setObject:v31 forKeyedSubscript:@"WatchEnergy"];
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v47 objects:v60 count:16];
    }
    while (v25);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v32 = v23;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v59 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v34; ++m)
      {
        if (*(void *)v44 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void **)(*((void *)&v43 + 1) + 8 * m);
        uint64_t v38 = [(PLBatteryBreakdownService *)self gizmoIDSTopicToAppBundleID];
        double v39 = [v37 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        uint64_t v40 = [v38 objectForKeyedSubscript:v39];

        if (v40)
        {
          [v37 setObject:v40 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          uint64_t v41 = [v37 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
          [v37 setObject:v41 forKeyedSubscript:@"WatchEnergy"];
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v43 objects:v59 count:16];
    }
    while (v34);
  }

  return v32;
}

- (id)mapCloudDocsToAppsWithEnergyEntries:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    uint64_t v7 = @"com.apple.clouddocs.";
    int v8 = @".";
    do
    {
      uint64_t v9 = 0;
      uint64_t v21 = v5;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
        long long v11 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        if ([v11 hasPrefix:v7])
        {
          long long v12 = objc_msgSend(v11, "substringFromIndex:", -[__CFString length](v7, "length"));
          uint64_t v13 = [v12 rangeOfString:v8];
          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v15 = v6;
            uint64_t v16 = v7;
            id v17 = v3;
            uint64_t v18 = v8;
            uint64_t v19 = [v12 substringFromIndex:v13 + v14];
            if (v19) {
              [v10 setObject:v19 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            }

            int v8 = v18;
            id v3 = v17;
            uint64_t v7 = v16;
            uint64_t v6 = v15;
            uint64_t v5 = v21;
          }
        }
        ++v9;
      }
      while (v5 != v9);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)reaccountExchangeEntriesWithEnergyEntries:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v53 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          long long v12 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];

          if (v12)
          {
            uint64_t v13 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            [v5 setObject:v11 forKeyedSubscript:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v8);
    }

    uint64_t v14 = [v5 objectForKeyedSubscript:@"com.apple.activesync"];
    uint64_t v15 = v14;
    if (v14
      && ([v14 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          [v16 doubleValue],
          double v18 = v17,
          v16,
          v18 != 0.0))
    {
      uint64_t v38 = v15;
      double v39 = v4;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v49 = 0u;
      long long v48 = 0u;
      uint64_t v20 = [&unk_1F29EF338 countByEnumeratingWithState:&v48 objects:v57 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v49;
        double v23 = 0.0;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v49 != v22) {
              objc_enumerationMutation(&unk_1F29EF338);
            }
            long long v25 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v48 + 1) + 8 * j)];
            uint64_t v26 = v25;
            if (v25)
            {
              uint64_t v27 = [v25 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
              [v27 doubleValue];
              double v29 = v28;

              if (v29 >= 0.0) {
                double v30 = v29;
              }
              else {
                double v30 = 0.0;
              }
              double v23 = v23 + v30;
            }
          }
          uint64_t v21 = [&unk_1F29EF338 countByEnumeratingWithState:&v48 objects:v57 count:16];
        }
        while (v21);
      }
      else
      {
        double v23 = 0.0;
      }
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      uint64_t v31 = [&unk_1F29EF338 countByEnumeratingWithState:&v44 objects:v56 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v45;
        do
        {
          for (uint64_t k = 0; k != v32; ++k)
          {
            if (*(void *)v45 != v33) {
              objc_enumerationMutation(&unk_1F29EF338);
            }
            uint64_t v35 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v44 + 1) + 8 * k)];
            BOOL v36 = v35;
            if (v35)
            {
              v40[0] = MEMORY[0x1E4F143A8];
              v40[1] = 3221225472;
              v40[2] = __71__PLBatteryBreakdownService_reaccountExchangeEntriesWithEnergyEntries___block_invoke;
              v40[3] = &unk_1E6930EB8;
              id v41 = v35;
              double v42 = v18;
              double v43 = v23;
              [v41 enumerateKeysAndObjectsUsingBlock:v40];
            }
          }
          uint64_t v32 = [&unk_1F29EF338 countByEnumeratingWithState:&v44 objects:v56 count:16];
        }
        while (v32);
      }
      id v19 = (id)[v6 mutableCopy];
      uint64_t v15 = v38;
      [v19 removeObject:v38];
      uint64_t v4 = v39;
    }
    else
    {
      id v19 = v6;
    }
  }
  else
  {
    id v19 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

void __71__PLBatteryBreakdownService_reaccountExchangeEntriesWithEnergyEntries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v9 rangeOfString:@"AppTypeKey"] == 0x7FFFFFFFFFFFFFFFLL
    && [v9 rangeOfString:@"time"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = NSNumber;
    [v5 doubleValue];
    uint64_t v8 = [v6 numberWithDouble:v7 * (*(double *)(a1 + 40) / *(double *)(a1 + 48) + 1.0)];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
  }
}

- (id)reaccountBackupRestoreWithEnergyEntries:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v41 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          long long v12 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];

          if (v12)
          {
            uint64_t v13 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            [v5 setObject:v11 forKeyedSubscript:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v8);
    }

    uint64_t v14 = [v5 objectForKeyedSubscript:@"Backup"];
    uint64_t v15 = [v5 objectForKeyedSubscript:@"Restore"];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__PLBatteryBreakdownService_reaccountBackupRestoreWithEnergyEntries___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v16;
      if (qword_1EBD5A448 != -1) {
        dispatch_once(&qword_1EBD5A448, block);
      }
      if (byte_1EBD5A294)
      {
        double v17 = [NSString stringWithFormat:@"backupEnergyEntry=%@, restoreEnergyEntry=%@", v14, v15];
        double v18 = (void *)MEMORY[0x1E4F929B8];
        id v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
        uint64_t v20 = [v19 lastPathComponent];
        uint64_t v21 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService reaccountBackupRestoreWithEnergyEntries:]"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:2485];

        uint64_t v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          long long v45 = v17;
          _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    if (v14 && v15)
    {
      [v14 setObject:@"Backup & Restore" forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
      [v14 setObject:@"Backup & Restore" forKeyedSubscript:@"PLBatteryUIAppNameKey"];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __69__PLBatteryBreakdownService_reaccountBackupRestoreWithEnergyEntries___block_invoke_1876;
      v36[3] = &unk_1E692B3A8;
      id v23 = v14;
      id v37 = v23;
      id v24 = v15;
      id v38 = v24;
      [v23 enumerateKeysAndObjectsUsingBlock:v36];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v25 = objc_opt_class();
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __69__PLBatteryBreakdownService_reaccountBackupRestoreWithEnergyEntries___block_invoke_2;
        v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v35[4] = v25;
        if (qword_1EBD5A450 != -1) {
          dispatch_once(&qword_1EBD5A450, v35);
        }
        if (byte_1EBD5A295)
        {
          uint64_t v26 = [NSString stringWithFormat:@"combined backupEnergyEntry=%@", v23];
          uint64_t v34 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
          double v28 = [v27 lastPathComponent];
          double v29 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService reaccountBackupRestoreWithEnergyEntries:]"];
          [v34 logMessage:v26 fromFile:v28 fromFunction:v29 fromLineNumber:2497];

          double v30 = (void *)v26;
          uint64_t v31 = PLLogCommon();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            long long v45 = v30;
            _os_log_debug_impl(&dword_1D2690000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      id v32 = (id)[v6 mutableCopy];
      [v32 removeObject:v24];
    }
    else
    {
      id v32 = v6;
    }
  }
  else
  {
    id v32 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v32;
}

uint64_t __69__PLBatteryBreakdownService_reaccountBackupRestoreWithEnergyEntries___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A294 = result;
  return result;
}

void __69__PLBatteryBreakdownService_reaccountBackupRestoreWithEnergyEntries___block_invoke_1876(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v12 rangeOfString:@"AppTypeKey"] == 0x7FFFFFFFFFFFFFFFLL
    && [v12 rangeOfString:@"time"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = NSNumber;
    [v5 doubleValue];
    double v8 = v7;
    uint64_t v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v12];
    [v9 doubleValue];
    long long v11 = [v6 numberWithDouble:v8 + v10];
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v12];
  }
}

uint64_t __69__PLBatteryBreakdownService_reaccountBackupRestoreWithEnergyEntries___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A295 = result;
  return result;
}

- (id)combineDuplicatesWithEnergyEntries:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v3;
  uint64_t v37 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v44;
    uint64_t v34 = v4;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v44 != v36) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v43 + 1) + 8 * v5);
        double v7 = [v6 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v8 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __64__PLBatteryBreakdownService_combineDuplicatesWithEnergyEntries___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v8;
          if (qword_1EBD5A458 != -1) {
            dispatch_once(&qword_1EBD5A458, block);
          }
          if (byte_1EBD5A296)
          {
            uint64_t v9 = [NSString stringWithFormat:@"name=%@", v7];
            double v10 = (void *)MEMORY[0x1E4F929B8];
            long long v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
            id v12 = [v11 lastPathComponent];
            uint64_t v13 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService combineDuplicatesWithEnergyEntries:]"];
            [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:2508];

            uint64_t v14 = PLLogCommon();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v48 = v9;
              _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            uint64_t v4 = v34;
          }
        }
        if (v7)
        {
          uint64_t v15 = [v4 objectForKeyedSubscript:v7];
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v16 = objc_opt_class();
            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            void v41[2] = __64__PLBatteryBreakdownService_combineDuplicatesWithEnergyEntries___block_invoke_1887;
            v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v41[4] = v16;
            if (qword_1EBD5A460 != -1) {
              dispatch_once(&qword_1EBD5A460, v41);
            }
            if (byte_1EBD5A297)
            {
              double v17 = [NSString stringWithFormat:@"storedEnergyEntry=%@", v15];
              double v18 = (void *)MEMORY[0x1E4F929B8];
              id v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
              uint64_t v20 = [v19 lastPathComponent];
              uint64_t v21 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService combineDuplicatesWithEnergyEntries:]"];
              [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:2512];

              uint64_t v22 = PLLogCommon();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                long long v48 = v17;
                _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              uint64_t v4 = v34;
            }
          }
          if (v15)
          {
            v39[0] = MEMORY[0x1E4F143A8];
            v39[1] = 3221225472;
            v39[2] = __64__PLBatteryBreakdownService_combineDuplicatesWithEnergyEntries___block_invoke_1891;
            v39[3] = &unk_1E6930EE0;
            id v40 = v15;
            [v6 enumerateKeysAndObjectsUsingBlock:v39];
          }
          else
          {
            [v4 setObject:v6 forKeyedSubscript:v7];
          }
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v23 = objc_opt_class();
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v38[2] = __64__PLBatteryBreakdownService_combineDuplicatesWithEnergyEntries___block_invoke_2;
            v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v38[4] = v23;
            if (qword_1EBD5A468 != -1) {
              dispatch_once(&qword_1EBD5A468, v38);
            }
            if (byte_1EBD5A298)
            {
              id v24 = NSString;
              uint64_t v25 = [v4 objectForKeyedSubscript:v7];
              uint64_t v26 = [v24 stringWithFormat:@"nameToEnergyEntry[name]=%@", v25];

              uint64_t v27 = (void *)MEMORY[0x1E4F929B8];
              double v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
              double v29 = [v28 lastPathComponent];
              double v30 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService combineDuplicatesWithEnergyEntries:]"];
              [v27 logMessage:v26 fromFile:v29 fromFunction:v30 fromLineNumber:2540];

              uint64_t v31 = PLLogCommon();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                long long v48 = v26;
                _os_log_debug_impl(&dword_1D2690000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
            }
          }
        }
        ++v5;
      }
      while (v37 != v5);
      uint64_t v37 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v37);
  }

  id v32 = [v4 allValues];

  return v32;
}

uint64_t __64__PLBatteryBreakdownService_combineDuplicatesWithEnergyEntries___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A296 = result;
  return result;
}

uint64_t __64__PLBatteryBreakdownService_combineDuplicatesWithEnergyEntries___block_invoke_1887(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A297 = result;
  return result;
}

void __64__PLBatteryBreakdownService_combineDuplicatesWithEnergyEntries___block_invoke_1891(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if ([v13 isEqualToString:@"NotificationInfo"])
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"NotificationInfo"];
    double v7 = v6;
    if (!v5 || v6) {
      [v6 combineWith:v5];
    }
    else {
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"NotificationInfo"];
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v13 rangeOfString:@"AppTypeKey"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = NSNumber;
    [v5 doubleValue];
    double v10 = v9;
    double v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
    [v7 doubleValue];
    id v12 = [v8 numberWithDouble:v10 + v11];
    [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v13];

LABEL_9:
  }
}

uint64_t __64__PLBatteryBreakdownService_combineDuplicatesWithEnergyEntries___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A298 = result;
  return result;
}

- (id)determineDisplayNamesWithEnergyEntries:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v31 = *(void *)v35;
    unint64_t v6 = 0x1E4F92000uLL;
    double v29 = self;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v35 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v34 + 1) + 8 * v7);
        double v9 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        if ([*(id *)(v6 + 2496) debugEnabled])
        {
          uint64_t v10 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __68__PLBatteryBreakdownService_determineDisplayNamesWithEnergyEntries___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v10;
          if (qword_1EBD5A470 != -1) {
            dispatch_once(&qword_1EBD5A470, block);
          }
          if (byte_1EBD5A299)
          {
            double v11 = [NSString stringWithFormat:@"bundleID=%@", v9];
            id v12 = (void *)MEMORY[0x1E4F929B8];
            id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
            uint64_t v14 = [v13 lastPathComponent];
            uint64_t v15 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService determineDisplayNamesWithEnergyEntries:]"];
            [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:2548];

            uint64_t v16 = PLLogCommon();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              double v39 = v11;
              _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v6 = 0x1E4F92000uLL;
          }
        }
        double v17 = [(PLBatteryBreakdownService *)self installedBundleIDToDisplayName];
        double v18 = [v17 objectForKeyedSubscript:v9];

        if ([(__CFString *)v9 isEqualToString:@"com.apple.Bridge"])
        {

          double v18 = @"Apple Watch";
        }
        if ([*(id *)(v6 + 2496) debugEnabled])
        {
          uint64_t v19 = objc_opt_class();
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __68__PLBatteryBreakdownService_determineDisplayNamesWithEnergyEntries___block_invoke_1902;
          v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v32[4] = v19;
          if (qword_1EBD5A478 != -1) {
            dispatch_once(&qword_1EBD5A478, v32);
          }
          if (byte_1EBD5A29A)
          {
            uint64_t v20 = v5;
            uint64_t v21 = [NSString stringWithFormat:@"displayName=%@", v18];
            uint64_t v22 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
            id v24 = [v23 lastPathComponent];
            uint64_t v25 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService determineDisplayNamesWithEnergyEntries:]"];
            [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:2554];

            uint64_t v26 = PLLogCommon();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              double v39 = v21;
              _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            uint64_t v5 = v20;
            self = v29;
            unint64_t v6 = 0x1E4F92000;
          }
        }
        if (v18) {
          uint64_t v27 = v18;
        }
        else {
          uint64_t v27 = v9;
        }
        [v8 setObject:v27 forKeyedSubscript:@"PLBatteryUIAppNameKey"];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v5);
  }
  return obj;
}

uint64_t __68__PLBatteryBreakdownService_determineDisplayNamesWithEnergyEntries___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A299 = result;
  return result;
}

uint64_t __68__PLBatteryBreakdownService_determineDisplayNamesWithEnergyEntries___block_invoke_1902(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A29A = result;
  return result;
}

- (id)filterWithEnergyEntries:(id)a3 withQueryType:(int)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v43 = [MEMORY[0x1E4F1CA48] array];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v6;
  uint64_t v47 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v53;
    int v42 = a4;
    long long v45 = self;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v53 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v52 + 1) + 8 * v7);
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v9 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __67__PLBatteryBreakdownService_filterWithEnergyEntries_withQueryType___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v9;
          if (qword_1EBD5A480 != -1) {
            dispatch_once(&qword_1EBD5A480, block);
          }
          if (byte_1EBD5A29B)
          {
            uint64_t v10 = [NSString stringWithFormat:@"energyEntry=%@", v8];
            double v11 = (void *)MEMORY[0x1E4F929B8];
            id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
            id v13 = [v12 lastPathComponent];
            uint64_t v14 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService filterWithEnergyEntries:withQueryType:]"];
            [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:2564];

            uint64_t v15 = PLLogCommon();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v57 = v10;
              _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        uint64_t v16 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        uint64_t v17 = [(PLBatteryBreakdownService *)self appTypeForName:v16];
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v18 = objc_opt_class();
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __67__PLBatteryBreakdownService_filterWithEnergyEntries_withQueryType___block_invoke_1908;
          v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v50[4] = v18;
          if (qword_1EBD5A488 != -1) {
            dispatch_once(&qword_1EBD5A488, v50);
          }
          if (byte_1EBD5A29C)
          {
            uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"appType=%i", v17);
            uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
            uint64_t v22 = [v21 lastPathComponent];
            uint64_t v23 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService filterWithEnergyEntries:withQueryType:]"];
            [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:2570];

            id v24 = PLLogCommon();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v57 = v19;
              _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            self = v45;
          }
        }
        uint64_t v25 = [NSNumber numberWithUnsignedInt:v17];
        [v8 setObject:v25 forKeyedSubscript:@"PLBatteryUIAppTypeKey"];

        uint64_t v26 = [(PLBatteryBreakdownService *)self minimumRequiredQueryTypeForAppType:v17];
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v27 = objc_opt_class();
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __67__PLBatteryBreakdownService_filterWithEnergyEntries_withQueryType___block_invoke_1914;
          v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v49[4] = v27;
          if (qword_1EBD5A490 != -1) {
            dispatch_once(&qword_1EBD5A490, v49);
          }
          if (byte_1EBD5A29D)
          {
            double v28 = objc_msgSend(NSString, "stringWithFormat:", @"minimumRequiredQueryType=%i", v26);
            double v29 = (void *)MEMORY[0x1E4F929B8];
            double v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
            uint64_t v31 = [v30 lastPathComponent];
            id v32 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService filterWithEnergyEntries:withQueryType:]"];
            [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:2576];

            uint64_t v33 = PLLogCommon();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v57 = v28;
              _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            a4 = v42;
            self = v45;
          }
        }
        if (a4 == 4)
        {
          if ((v17 & 0xFFFFFFFB) != 0) {
            goto LABEL_39;
          }
        }
        else
        {
          if (v26 > a4) {
            goto LABEL_39;
          }
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v34 = objc_opt_class();
            v48[0] = MEMORY[0x1E4F143A8];
            v48[1] = 3221225472;
            v48[2] = __67__PLBatteryBreakdownService_filterWithEnergyEntries_withQueryType___block_invoke_1920;
            v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v48[4] = v34;
            if (qword_1EBD5A498 != -1) {
              dispatch_once(&qword_1EBD5A498, v48);
            }
            if (byte_1EBD5A29E)
            {
              long long v35 = [NSString stringWithFormat:@"adding entry"];
              long long v36 = (void *)MEMORY[0x1E4F929B8];
              long long v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
              id v38 = [v37 lastPathComponent];
              double v39 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService filterWithEnergyEntries:withQueryType:]"];
              [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:2587];

              id v40 = PLLogCommon();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                long long v57 = v35;
                _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              a4 = v42;
              self = v45;
            }
          }
        }
        [v43 addObject:v8];
LABEL_39:

        ++v7;
      }
      while (v47 != v7);
      uint64_t v47 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v47);
  }

  return v43;
}

uint64_t __67__PLBatteryBreakdownService_filterWithEnergyEntries_withQueryType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A29B = result;
  return result;
}

uint64_t __67__PLBatteryBreakdownService_filterWithEnergyEntries_withQueryType___block_invoke_1908(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A29C = result;
  return result;
}

uint64_t __67__PLBatteryBreakdownService_filterWithEnergyEntries_withQueryType___block_invoke_1914(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A29D = result;
  return result;
}

uint64_t __67__PLBatteryBreakdownService_filterWithEnergyEntries_withQueryType___block_invoke_1920(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A29E = result;
  return result;
}

- (int)appTypeForName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLBatteryBreakdownService *)self rootNodeNames];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    int v7 = 5;
  }
  else
  {
    uint64_t v8 = [(PLBatteryBreakdownService *)self nonAppNames];
    char v9 = [v8 containsObject:v4];

    if (v9)
    {
      int v7 = 1;
    }
    else
    {
      uint64_t v10 = [(PLBatteryBreakdownService *)self webAppNames];
      char v11 = [v10 containsObject:v4];

      if (v11)
      {
        int v7 = 4;
      }
      else
      {
        id v12 = [(PLBatteryBreakdownService *)self installedBundleIDToDisplayName];
        id v13 = [v12 objectForKeyedSubscript:v4];
        BOOL v14 = v13 == 0;

        int v7 = 2 * v14;
      }
    }
  }

  return v7;
}

- (int)minimumRequiredQueryTypeForAppType:(int)a3
{
  if (a3 == 5) {
    return 3;
  }
  else {
    return 2 * (a3 == 2);
  }
}

- (id)adjustForegroundTimesWithEnergyEntries:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        char v9 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        uint64_t v10 = [&unk_1F29EAEB8 objectForKeyedSubscript:v9];
        if (v10) {
          [v8 setObject:v10 forKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)adjustBackgroundTimesWithEnergyEntries:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        char v9 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        uint64_t v10 = [&unk_1F29EAEE0 objectForKeyedSubscript:v9];
        if (v10) {
          [v8 setObject:v10 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)qualifiersWithEnergyEntry:(id)a3 bucketSize:(double)a4 andTotalEnergy:(double)a5
{
  uint64_t v229 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    v220[0] = MEMORY[0x1E4F143A8];
    v220[1] = 3221225472;
    v220[2] = __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke;
    v220[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v220[4] = v8;
    char v9 = v220;
    if (qword_1EBD5A4A0 != -1) {
      dispatch_once(&qword_1EBD5A4A0, v9);
    }

    if (byte_1EBD5A29F)
    {
      uint64_t v10 = [NSString stringWithFormat:@"energyEntry=%@", v7];
      char v11 = (void *)MEMORY[0x1E4F929B8];
      long long v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      long long v13 = [v12 lastPathComponent];
      long long v14 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService qualifiersWithEnergyEntry:bucketSize:andTotalEnergy:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:2714];

      long long v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v222 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v17 = [v7 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
    uint64_t v18 = [v7 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
    [v18 doubleValue];
    double v20 = v19;

    uint64_t v21 = [v7 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
    [v21 doubleValue];
    double v23 = v22;

    id v24 = [v7 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
    [v24 doubleValue];
    double v26 = v25;

    uint64_t v27 = [v7 objectForKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];
    [v27 doubleValue];
    double v29 = v28;

    double v30 = [v7 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundPluggedInRuntimeKey"];
    [v30 doubleValue];
    double v32 = v31;

    double v33 = v23 + v26;
    [MEMORY[0x1E4F92A10] defaultBatteryEnergyCapacity];
    BOOL v35 = v34 <= 0.0 || v20 / v34 <= dbl_1D2B032C0[a4 > 3600.0];
    if (v33 > 0.0)
    {
      double v37 = (v29 + v32) / v33;
      [MEMORY[0x1E4F92A88] containerPath];
      id v38 = (void *)_CFPreferencesCopyValueWithContainer();
      double v39 = v38;
      if (v38)
      {
        [v38 doubleValue];
        double v41 = v40;
      }
      else
      {
        double v41 = 0.8;
      }

      if (v37 >= v41 && v35)
      {
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v43 = objc_opt_class();
          v219[0] = MEMORY[0x1E4F143A8];
          v219[1] = 3221225472;
          v219[2] = __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1943;
          v219[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v219[4] = v43;
          long long v44 = v219;
          if (qword_1EBD5A4A8 != -1) {
            dispatch_once(&qword_1EBD5A4A8, v44);
          }

          if (byte_1EBD5A2A0)
          {
            long long v45 = NSString;
            uint64_t v46 = [NSNumber numberWithDouble:v23];
            uint64_t v47 = [NSNumber numberWithDouble:v26];
            long long v48 = [NSNumber numberWithDouble:v32];
            long long v49 = [NSNumber numberWithDouble:v29];
            uint64_t v50 = [v45 stringWithFormat:@"PluggedInQualifier: Adding plugged in qualifier based on BGTime %@, FGTime %@, BGPluggedInTime %@, FGPluggedInTime %@", v46, v47, v48, v49];

            long long v51 = (void *)MEMORY[0x1E4F929B8];
            long long v52 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
            long long v53 = [v52 lastPathComponent];
            long long v54 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService qualifiersWithEnergyEntry:bucketSize:andTotalEnergy:]"];
            [v51 logMessage:v50 fromFile:v53 fromFunction:v54 fromLineNumber:2744];

            long long v55 = PLLogCommon();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v222 = v50;
              _os_log_debug_impl(&dword_1D2690000, v55, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        [v16 addObject:&unk_1F29E75E8];
      }
    }
    if (v20 == 0.0)
    {
      id v36 = v16;
    }
    else
    {
      long long v56 = [&unk_1F29EF350 objectAtIndexedSubscript:1];
      long long v57 = [v7 objectForKeyedSubscript:v56];
      [v57 doubleValue];
      double v59 = v58;

      double v60 = v59 / v20;
      if (v59 / v20 > 0.33
        && [(id)objc_opt_class() canSetQualifier:1 forBundleID:v17])
      {
        [v16 addObject:&unk_1F29E7600];
      }
      long long v61 = objc_msgSend(&unk_1F29EF368, "objectAtIndexedSubscript:", 2, v60);
      long long v62 = [v7 objectForKeyedSubscript:v61];
      [v62 doubleValue];
      double v64 = v63;

      double v65 = v20 - v64;
      double v66 = v65 / v20;
      if (v65 / v20 > 0.5 && [(id)objc_opt_class() canSetQualifier:2 forBundleID:v17])
      {
        int v67 = [MEMORY[0x1E4F929C0] debugEnabled];
        if (v23 < 300.0 || (double v68 = v23 / v26, v23 / v26 < 0.33))
        {
          if (v67)
          {
            uint64_t v80 = objc_opt_class();
            v217[0] = MEMORY[0x1E4F143A8];
            v217[1] = 3221225472;
            v217[2] = __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1968;
            v217[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v217[4] = v80;
            unint64_t v81 = v217;
            if (qword_1EBD5A4B8 != -1) {
              dispatch_once(&qword_1EBD5A4B8, v81);
            }

            if (byte_1EBD5A2A2)
            {
              double v82 = NSString;
              uint64_t v83 = [NSNumber numberWithDouble:v23];
              v84 = [NSNumber numberWithDouble:v26];
              v85 = [v82 stringWithFormat:@"BGQualifier: Removing qualifier based on BGTime %@, FGTime %@", v83, v84];

              uint64_t v86 = (void *)MEMORY[0x1E4F929B8];
              v87 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
              v88 = [v87 lastPathComponent];
              v89 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService qualifiersWithEnergyEntry:bucketSize:andTotalEnergy:]"];
              [v86 logMessage:v85 fromFile:v88 fromFunction:v89 fromLineNumber:2766];

              uint64_t v90 = PLLogCommon();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v222 = v85;
                _os_log_debug_impl(&dword_1D2690000, v90, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
            }
          }
        }
        else
        {
          if (v67)
          {
            uint64_t v69 = objc_opt_class();
            v218[0] = MEMORY[0x1E4F143A8];
            v218[1] = 3221225472;
            v218[2] = __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1960;
            v218[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v218[4] = v69;
            uint64_t v70 = v218;
            if (qword_1EBD5A4B0 != -1) {
              dispatch_once(&qword_1EBD5A4B0, v70);
            }

            if (byte_1EBD5A2A1)
            {
              long long v71 = NSString;
              long long v72 = [NSNumber numberWithDouble:v23];
              long long v73 = [NSNumber numberWithDouble:v26];
              long long v74 = [v71 stringWithFormat:@"BGQualifier: Adding qualifier based on BGTime %@, FGTime %@", v72, v73];

              uint64_t v75 = (void *)MEMORY[0x1E4F929B8];
              long long v76 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
              long long v77 = [v76 lastPathComponent];
              long long v78 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService qualifiersWithEnergyEntry:bucketSize:andTotalEnergy:]"];
              [v75 logMessage:v74 fromFile:v77 fromFunction:v78 fromLineNumber:2763];

              long long v79 = PLLogCommon();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v222 = v74;
                _os_log_debug_impl(&dword_1D2690000, v79, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
            }
          }
          objc_msgSend(v16, "addObject:", &unk_1F29E7618, v68);
        }
      }
      if ([v17 isEqualToString:@"com.apple.findmy"])
      {
        uint64_t v91 = +[PLBatteryBreakdownService defaults];
        unint64_t v92 = [v91 objectForKeyedSubscript:@"energyRatioIT"];
        [v92 doubleValue];
        double v94 = v93;

        v95 = [&unk_1F29EF380 objectAtIndexedSubscript:59];
        uint64_t v96 = [v7 objectForKeyedSubscript:v95];
        [v96 doubleValue];
        double v98 = v97;

        if (v98 / v20 > v94 && (objc_msgSend(v16, "containsObject:", &unk_1F29E7618, v98 / v20) & 1) == 0) {
          [v16 addObject:&unk_1F29E7618];
        }
        double v99 = PLLogCommon();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v222 = v16;
          _os_log_debug_impl(&dword_1D2690000, v99, OS_LOG_TYPE_DEBUG, "IT Qualifier: %@", buf, 0xCu);
        }
      }
      v216[0] = MEMORY[0x1E4F143A8];
      v216[1] = 3221225472;
      v216[2] = __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1976;
      v216[3] = &unk_1E692A250;
      v216[4] = self;
      double v100 = v216;
      if (qword_1EBD5A4C0 != -1) {
        dispatch_once(&qword_1EBD5A4C0, v100);
      }

      double v101 = *(double *)&qword_1EBD5A4C8;
      uint64_t v102 = [&unk_1F29EF398 objectAtIndexedSubscript:48];
      v103 = [v7 objectForKeyedSubscript:v102];
      [v103 doubleValue];
      double v105 = v104;

      v106 = [&unk_1F29EF3B0 objectAtIndexedSubscript:12];
      int v107 = [v7 objectForKeyedSubscript:v106];
      [v107 doubleValue];
      double v109 = v105 + v108;

      uint64_t v110 = [&unk_1F29EF3C8 objectAtIndexedSubscript:13];
      unint64_t v111 = [v7 objectForKeyedSubscript:v110];
      [v111 doubleValue];
      double v113 = v109 + v112;

      double v114 = [&unk_1F29EF3E0 objectAtIndexedSubscript:15];
      v115 = [&unk_1F29EF3F8 objectAtIndexedSubscript:2];
      double v116 = +[PLBatteryBreakdownService rootNodeQualificationNameWithQualificationName:v114 withRootNodeName:v115];

      uint64_t v117 = [v7 objectForKeyedSubscript:v116];
      [v117 doubleValue];
      double v119 = v113 + v118;

      double v120 = [&unk_1F29EF410 objectAtIndexedSubscript:15];
      v121 = [&unk_1F29EF428 objectAtIndexedSubscript:7];
      id v122 = +[PLBatteryBreakdownService rootNodeQualificationNameWithQualificationName:v120 withRootNodeName:v121];

      v123 = [v7 objectForKeyedSubscript:v122];
      [v123 doubleValue];
      double v125 = v119 + v124;

      double v126 = [&unk_1F29EF440 objectAtIndexedSubscript:15];
      id v127 = [&unk_1F29EF458 objectAtIndexedSubscript:9];
      id v128 = +[PLBatteryBreakdownService rootNodeQualificationNameWithQualificationName:v126 withRootNodeName:v127];

      id v129 = [v7 objectForKeyedSubscript:v128];
      [v129 doubleValue];
      double v131 = v125 + v130;

      int v132 = [&unk_1F29EF470 objectAtIndexedSubscript:15];
      uint64_t v133 = [&unk_1F29EF488 objectAtIndexedSubscript:52];
      int v134 = +[PLBatteryBreakdownService rootNodeQualificationNameWithQualificationName:v132 withRootNodeName:v133];

      uint64_t v135 = [v7 objectForKeyedSubscript:v134];
      [v135 doubleValue];
      double v137 = v131 + v136;

      int v138 = [&unk_1F29EF4A0 objectAtIndexedSubscript:15];
      uint64_t v139 = [&unk_1F29EF4B8 objectAtIndexedSubscript:54];
      uint64_t v140 = +[PLBatteryBreakdownService rootNodeQualificationNameWithQualificationName:v138 withRootNodeName:v139];

      double v141 = [v7 objectForKeyedSubscript:v140];
      [v141 doubleValue];
      double v143 = v137 + v142;

      long long v144 = PLLogCommon();
      if (os_log_type_enabled(v144, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v222 = v17;
        __int16 v223 = 2048;
        double v224 = v143;
        _os_log_debug_impl(&dword_1D2690000, v144, OS_LOG_TYPE_DEBUG, "%@ locEnergy: %.3f", buf, 0x16u);
      }

      if (v143 / v20 > v101
        && [(id)objc_opt_class() canSetQualifier:3 forBundleID:v17])
      {
        v215[0] = MEMORY[0x1E4F143A8];
        v215[1] = 3221225472;
        v215[2] = __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_2018;
        v215[3] = &unk_1E692A250;
        v215[4] = self;
        long long v145 = v215;
        if (qword_1EBD5A4D0 != -1) {
          dispatch_once(&qword_1EBD5A4D0, v145);
        }

        double v146 = *(double *)&qword_1EBD5A4D8;
        long long v147 = [&unk_1F29EF4D0 objectAtIndexedSubscript:15];
        long long v148 = [v7 objectForKeyedSubscript:v147];
        [v148 doubleValue];
        double v150 = v149;

        long long v151 = PLLogCommon();
        if (os_log_type_enabled(v151, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v222 = v17;
          __int16 v223 = 2048;
          double v224 = v150;
          _os_log_debug_impl(&dword_1D2690000, v151, OS_LOG_TYPE_DEBUG, "%@ bgLocEnergy: %.3f", buf, 0x16u);
        }

        if (v150 / v65 > v146 && objc_msgSend(v16, "containsObject:", &unk_1F29E7618, v150 / v65))
        {
          [v16 removeObject:&unk_1F29E7618];
          long long v152 = &unk_1F29E7630;
        }
        else
        {
          long long v152 = &unk_1F29E7648;
        }
        [v16 addObject:v152];
      }
      v214[0] = MEMORY[0x1E4F143A8];
      v214[1] = 3221225472;
      v214[2] = __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_2028;
      v214[3] = &unk_1E692A250;
      v214[4] = self;
      long long v153 = v214;
      if (qword_1EBD5A4E0 != -1) {
        dispatch_once(&qword_1EBD5A4E0, v153);
      }

      double v154 = *(double *)&qword_1EBD5A4E8;
      v213[0] = MEMORY[0x1E4F143A8];
      v213[1] = 3221225472;
      v213[2] = __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_2;
      v213[3] = &unk_1E692A250;
      v213[4] = self;
      long long v155 = v213;
      if (qword_1EBD5A4F0 != -1) {
        dispatch_once(&qword_1EBD5A4F0, v155);
      }

      double v156 = *(double *)&qword_1EBD5A4F8;
      long long v157 = [v7 objectForKeyedSubscript:@"NotificationInfo"];

      if (v157 && [(id)objc_opt_class() canSetQualifier:9 forBundleID:v17])
      {
        long long v158 = [v7 objectForKeyedSubscript:@"NotificationInfo"];
        [v158 notificationEnergy];
        double v160 = v159;
        [MEMORY[0x1E4F92A88] defaultBatteryEnergyCapacity];
        double v162 = v160 * 100.0 / v161;
        double v163 = PLLogCommon();
        if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          v222 = v17;
          __int16 v223 = 2112;
          double v224 = *(double *)&v158;
          __int16 v225 = 2048;
          double v226 = v160;
          __int16 v227 = 2048;
          double v228 = v162;
          _os_log_debug_impl(&dword_1D2690000, v163, OS_LOG_TYPE_DEBUG, "%@ notificationInfo: %@, energy: %.3f, batteryPercent %.3f", buf, 0x2Au);
        }

        if (v160 / v20 > v154 || v162 > v156) {
          objc_msgSend(v16, "addObject:", &unk_1F29E7660, v160 / v20);
        }
      }
      uint64_t v164 = [&unk_1F29EF4E8 objectAtIndexedSubscript:3];
      uint64_t v165 = [v7 objectForKeyedSubscript:v164];
      [v165 doubleValue];
      double v167 = v166;

      double v168 = v167 / v20;
      if (v167 / v20 > 0.33
        && [(id)objc_opt_class() canSetQualifier:4 forBundleID:v17])
      {
        [v16 addObject:&unk_1F29E7678];
      }
      long long v169 = objc_msgSend(&unk_1F29EF500, "objectAtIndexedSubscript:", 4, v168);
      long long v170 = [v7 objectForKeyedSubscript:v169];
      [v170 doubleValue];
      double v172 = v171;

      double v173 = v172 / v20;
      if (v172 / v20 > 0.33
        && [(id)objc_opt_class() canSetQualifier:5 forBundleID:v17])
      {
        [v16 addObject:&unk_1F29E7690];
      }
      v174 = objc_msgSend(&unk_1F29EF518, "objectAtIndexedSubscript:", 14, v173);
      BOOL v175 = [v7 objectForKeyedSubscript:v174];
      [v175 doubleValue];
      double v177 = v176;

      double v178 = [&unk_1F29EF530 objectAtIndexedSubscript:15];
      v179 = [v7 objectForKeyedSubscript:v178];
      [v179 doubleValue];
      double v181 = v180;

      v182 = [&unk_1F29EF548 objectAtIndexedSubscript:55];
      v183 = [v7 objectForKeyedSubscript:v182];
      [v183 doubleValue];
      double v185 = v184;

      if ((v177 + v181 + v185) / v20 > 0.03
        && [(id)objc_opt_class() canSetQualifier:7 forBundleID:v17])
      {
        [v16 addObject:&unk_1F29E76A8];
      }
      uint64_t v186 = [v7 objectForKeyedSubscript:@"WatchEnergy"];
      [v186 doubleValue];
      double v188 = v187;

      if ([(PLBatteryBreakdownService *)self showGizmoQualifier])
      {
        double v189 = v188 / v20;
        if (v188 / v20 > 0.33)
        {
          if ([(id)objc_opt_class() canSetQualifier:10 forBundleID:v17]) {
            [v16 addObject:&unk_1F29E76C0];
          }
        }
      }
      v190 = objc_msgSend(v7, "objectForKeyedSubscript:", @"ChronoWidgetEnergy", v189);
      [v190 doubleValue];
      double v192 = v191;

      double v193 = v192 / v20;
      if (v192 / v20 > 0.33
        && [(id)objc_opt_class() canSetQualifier:12 forBundleID:v17])
      {
        [v16 addObject:&unk_1F29E76D8];
      }
      double v194 = objc_msgSend(&unk_1F29EF560, "objectAtIndexedSubscript:", 10, v193);
      v195 = [v7 objectForKeyedSubscript:v194];
      [v195 doubleValue];
      double v197 = v196;

      double v198 = v197 / v20;
      if (v197 / v20 > 0.33
        && [(id)objc_opt_class() canSetQualifier:9 forBundleID:v17])
      {
        [v16 addObject:&unk_1F29E7660];
      }
      v199 = objc_msgSend(v7, "objectForKeyedSubscript:", @"PLBatteryUIAppBundleIDKey", v198);
      int v200 = [v199 isEqualToString:@"com.apple.Home"];

      if (v200)
      {
        v201 = [v7 objectForKeyedSubscript:@"HomeKitEnergy"];
        [v201 doubleValue];
        double v203 = v202;

        if (v203 / v20 > 0.33)
        {
          if ([(id)objc_opt_class() canSetQualifier:13 forBundleID:v17]) {
            [v16 addObject:&unk_1F29E76F0];
          }
        }
      }
      unsigned int v204 = [(id)objc_opt_class() combineQualifiers:v16];
      if ([v16 containsObject:&unk_1F29E76A8])
      {
        int v205 = [v16 containsObject:&unk_1F29E7618];
        if (v66 > 0.5 && v205 && ([v204 containsObject:&unk_1F29E75E8] & 1) == 0)
        {
          uint64_t v206 = [v204 arrayByAddingObject:&unk_1F29E7618];

          unsigned int v204 = (void *)v206;
        }
      }
      v207 = [MEMORY[0x1E4F1CA48] array];
      if ([v204 containsObject:&unk_1F29E75E8]) {
        [v207 addObject:&unk_1F29E75E8];
      }
      if ([v204 count])
      {
        unint64_t v208 = 0;
        do
        {
          v209 = [v204 objectAtIndexedSubscript:v208];
          int v210 = [v209 intValue];

          if (v210 != 11)
          {
            long long v211 = [v204 objectAtIndexedSubscript:v208];
            [v207 addObject:v211];
          }
          if ([v207 count] == 2) {
            break;
          }
          ++v208;
        }
        while ([v204 count] > v208);
      }
      id v36 = v207;
    }
  }
  else
  {
    id v36 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v36;
}

uint64_t __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A29F = result;
  return result;
}

uint64_t __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1943(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A2A0 = result;
  return result;
}

uint64_t __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1960(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A2A1 = result;
  return result;
}

uint64_t __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1968(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A2A2 = result;
  return result;
}

uint64_t __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1976(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"energyRatioLocation"];
  qword_1EBD5A4C8 = v2;
  return result;
}

uint64_t __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_2018(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"energyRatioBackgroundLocation"];
  qword_1EBD5A4D8 = v2;
  return result;
}

uint64_t __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_2028(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"energyRatioNotifications"];
  qword_1EBD5A4E8 = v2;
  return result;
}

uint64_t __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"energyAbsoluteNotifications"];
  qword_1EBD5A4F8 = v2;
  return result;
}

+ (BOOL)canSetQualifier:(int64_t)a3 forBundleID:(id)a4
{
  id v5 = a4;
  char v6 = [v5 isEqualToString:@"com.apple.mobilephone"];
  if (a3 == 2 && (v6 & 1) != 0) {
    goto LABEL_9;
  }
  char v7 = [v5 isEqualToString:@"com.apple.facetime"];
  if (a3 == 2 && (v7 & 1) != 0) {
    goto LABEL_9;
  }
  char v8 = [v5 isEqualToString:@"HLS"];
  if (a3 == 2 && (v8 & 1) != 0) {
    goto LABEL_9;
  }
  char v9 = [v5 isEqualToString:@"Flashlight"];
  if (a3 == 2 && (v9 & 1) != 0) {
    goto LABEL_9;
  }
  if (([v5 isEqualToString:@"Backup & Restore"] & 1) == 0
    && ([v5 isEqualToString:@"Backup"] & 1) == 0
    && ![v5 isEqualToString:@"Restore"])
  {
    char v13 = [v5 isEqualToString:@"com.apple.mobilesafari"];
    if (a3 != 2 || (v13 & 1) == 0)
    {
      char v14 = [v5 isEqualToString:@"Hotspot"];
      if (a3 != 2 || (v14 & 1) == 0)
      {
        char v15 = [v5 isEqualToString:@"com.apple.Maps"];
        if (a3 != 2 || (v15 & 1) == 0)
        {
          char v16 = [v5 isEqualToString:@"Siri"];
          if ((a3 != 2 || (v16 & 1) == 0)
            && ([v5 isEqualToString:@"Flashlight"] & 1) == 0
            && ([v5 isEqualToString:@"PowerOutAccessories"] & 1) == 0
            && ([v5 isEqualToString:@"DeletedApp"] & 1) == 0
            && ([v5 isEqualToString:@"DeletedAppClip"] & 1) == 0
            && ([v5 isEqualToString:@"DeletedAppAndAppClip"] & 1) == 0
            && ([v5 isEqualToString:@"EN"] & 1) == 0)
          {
            if ([v5 isEqualToString:@"com.apple.Bridge"])
            {
              if ((unint64_t)a3 < 0xB)
              {
                unsigned int v10 = (0x2FBu >> a3) & 1;
                goto LABEL_10;
              }
LABEL_41:
              LOBYTE(v10) = 1;
              goto LABEL_10;
            }
            char v17 = [v5 isEqualToString:@"com.apple.camera"];
            if ((a3 != 10 || (v17 & 1) == 0)
              && ([v5 isEqualToString:@"PoorCellCondition"] & 1) == 0
              && ([v5 isEqualToString:@"com.apple.Preferences"] & 1) == 0)
            {
              goto LABEL_41;
            }
          }
        }
      }
    }
LABEL_9:
    LOBYTE(v10) = 0;
    goto LABEL_10;
  }
  LOBYTE(v10) = a3 != 7 && a3 != 2;
LABEL_10:

  return v10;
}

+ (id)combineQualifiers:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
    if ([v5 containsObject:&unk_1F29E7618]
      && [v5 containsObject:&unk_1F29E76A8])
    {
      [v5 removeObject:&unk_1F29E7618];
    }
    if ([v5 containsObject:&unk_1F29E7618]
      && [v5 containsObject:&unk_1F29E75E8])
    {
      [v5 removeObject:&unk_1F29E7618];
    }
    if ([v5 containsObject:&unk_1F29E7630]
      && [v5 containsObject:&unk_1F29E75E8])
    {
      [v5 removeObject:&unk_1F29E7630];
    }
    if ([v5 containsObject:&unk_1F29E7618]
      && [v5 containsObject:&unk_1F29E7600])
    {
      [v5 removeObject:&unk_1F29E7618];
    }
    if ([v5 containsObject:&unk_1F29E76A8]
      && [v5 containsObject:&unk_1F29E7678])
    {
      [v5 removeObject:&unk_1F29E76A8];
    }
    if ([v5 containsObject:&unk_1F29E7618]
      && [v5 containsObject:&unk_1F29E7690])
    {
      [v5 removeObject:&unk_1F29E7618];
    }
    if ([v5 containsObject:&unk_1F29E7690]
      && [v5 containsObject:&unk_1F29E7678])
    {
      [v5 removeObject:&unk_1F29E7690];
    }
    if ([v5 containsObject:&unk_1F29E7618]
      && [v5 containsObject:&unk_1F29E76C0])
    {
      [v5 removeObject:&unk_1F29E7618];
    }
    if ([v5 containsObject:&unk_1F29E7618]
      && [v5 containsObject:&unk_1F29E76F0])
    {
      [v5 removeObject:&unk_1F29E7618];
    }
    if ([v5 containsObject:&unk_1F29E7618]
      && [v5 containsObject:&unk_1F29E7660])
    {
      [v5 removeObject:&unk_1F29E7618];
    }
    char v6 = [v5 allObjects];
  }
  else
  {
    char v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (BOOL)shouldShowBatteryBreakdownWithTotalSumEnergy:(double)a3 withtotalSumEnergyRatioCutOff:(double)a4
{
  char v7 = [MEMORY[0x1E4F929E0] entryKeyForOperatorName:@"PLBatteryAgent" withType:*MEMORY[0x1E4F92D28] withName:@"Battery"];
  char v8 = [(PLOperator *)self storage];
  char v9 = [v8 lastEntryForKey:v7];

  if (v9)
  {
    unsigned int v10 = [v9 objectForKeyedSubscript:@"DesignCapacity"];
    [v10 doubleValue];
    double v12 = v11;

    char v13 = [v9 objectForKeyedSubscript:@"Voltage"];
    [v13 doubleValue];
    double v15 = v14 / 1000.0;

    BOOL v16 = v12 * v15 * a4 < a3;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

+ (id)rootNodeQualificationNameWithQualificationName:(id)a3 withRootNodeName:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@-%@", a3, a4];
}

- (BOOL)wasGizmoConnectedInRange:(_PLTimeIntervalRange)a3
{
  double var0 = a3.var0;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v4 = a3.var0 + a3.var1;
  id v5 = [MEMORY[0x1E4F929E0] entryKeyForOperatorName:@"PLIdentityServicesAgent" withType:*MEMORY[0x1E4F92D30] withName:@"LocalLinkType"];
  char v6 = [NSString stringWithFormat:@"select * from %@ where linkType=1 and timestamp>=%f and timestamp<=%f limit 1", v5, *(void *)&var0, *(void *)&v4];
  char v7 = [MEMORY[0x1E4F92AD0] sharedCore];
  char v8 = [v7 storage];
  char v9 = [v8 entriesForKey:v5 withQuery:v6];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__PLBatteryBreakdownService_wasGizmoConnectedInRange___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1EBD5A500 != -1) {
      dispatch_once(&qword_1EBD5A500, block);
    }
    if (byte_1EBD5A2A3)
    {
      double v11 = [NSString stringWithFormat:@"Query Result %@", v9];
      double v12 = (void *)MEMORY[0x1E4F929B8];
      char v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m"];
      double v14 = [v13 lastPathComponent];
      double v15 = [NSString stringWithUTF8String:"-[PLBatteryBreakdownService wasGizmoConnectedInRange:]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:3076];

      BOOL v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v11;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  BOOL v17 = v9 && [v9 count];

  return v17;
}

uint64_t __54__PLBatteryBreakdownService_wasGizmoConnectedInRange___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A2A3 = result;
  return result;
}

- (BOOL)showRootNodesInInternal
{
  if (qword_1EBD5A508 != -1) {
    dispatch_once(&qword_1EBD5A508, &__block_literal_global_2098);
  }
  uint64_t v2 = (void *)qword_1EBD5A510;
  if (qword_1EBD5A510)
  {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

uint64_t __52__PLBatteryBreakdownService_showRootNodesInInternal__block_invoke()
{
  [MEMORY[0x1E4F92A88] containerPath];
  qword_1EBD5A510 = _CFPreferencesCopyValueWithContainer();
  return MEMORY[0x1F41817F8]();
}

- (double)totalSumEnergyRatioCutOff
{
  return 0.001;
}

- (void)setRootNodeNames:(id)a3
{
}

- (void)setNonAppNames:(id)a3
{
}

- (void)setIntermediateRootNodes:(id)a3
{
}

- (void)setDeletedAppNames:(id)a3
{
}

- (void)setDeletedAppClipNames:(id)a3
{
}

- (void)setWebAppNames:(id)a3
{
}

- (void)setNodeIDToNodeName:(id)a3
{
}

- (void)setInstalledBundleIDToDisplayName:(id)a3
{
}

- (void)setInstalledPluginBundleIDToPluginEntry:(id)a3
{
}

- (void)setGizmoDaemonToAppBundleID:(id)a3
{
}

- (void)setGizmoIDSTopicToAppBundleID:(id)a3
{
}

- (void)setRootNodeNameToRootNodeEnergyKey:(id)a3
{
}

- (void)setGivenNameToMappedName:(id)a3
{
}

- (BOOL)showGizmoQualifier
{
  return self->_showGizmoQualifier;
}

- (void)setShowGizmoQualifier:(BOOL)a3
{
  self->_showGizmoQualifier = a3;
}

- (double)totalEnergyDay
{
  return self->_totalEnergyDay;
}

- (void)setTotalEnergyDay:(double)a3
{
  self->_totalEnergyDay = a3;
}

- (double)totalEnergyWeek
{
  return self->_totalEnergyWeek;
}

- (void)setTotalEnergyWeek:(double)a3
{
  self->_totalEnergyWeeuint64_t k = a3;
}

- (BOOL)hasHomeKitActivity
{
  return self->_hasHomeKitActivity;
}

- (void)setHasHomeKitActivity:(BOOL)a3
{
  self->_hasHomeKitActivity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_givenNameToMappedName, 0);
  objc_storeStrong((id *)&self->_rootNodeNameToRootNodeEnergyKey, 0);
  objc_storeStrong((id *)&self->_gizmoIDSTopicToAppBundleID, 0);
  objc_storeStrong((id *)&self->_gizmoDaemonToAppBundleID, 0);
  objc_storeStrong((id *)&self->_installedPluginBundleIDToPluginEntry, 0);
  objc_storeStrong((id *)&self->_installedBundleIDToDisplayName, 0);
  objc_storeStrong((id *)&self->_nodeIDToNodeName, 0);
  objc_storeStrong((id *)&self->_webAppNames, 0);
  objc_storeStrong((id *)&self->_deletedAppClipNames, 0);
  objc_storeStrong((id *)&self->_deletedAppNames, 0);
  objc_storeStrong((id *)&self->_intermediateRootNodes, 0);
  objc_storeStrong((id *)&self->_nonAppNames, 0);
  objc_storeStrong((id *)&self->_rootNodeNames, 0);
}

@end