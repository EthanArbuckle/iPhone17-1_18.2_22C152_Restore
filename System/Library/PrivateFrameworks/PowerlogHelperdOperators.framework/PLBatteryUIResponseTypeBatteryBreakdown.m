@interface PLBatteryUIResponseTypeBatteryBreakdown
- (BOOL)canSetQualifier:(int64_t)a3 forBundleID:(id)a4;
- (BOOL)filterFgBg:(id)a3 filterArray:(id)a4;
- (BOOL)gizmoConnected;
- (BOOL)gizmoConnectedInRange:(_PLTimeIntervalRange)a3;
- (BOOL)hasHomeKit;
- (BOOL)hasHomeKitEvents;
- (BOOL)isSlopAdjustmentEnabled;
- (BOOL)shouldShowBreakdown:(id)a3;
- (NSDate)end;
- (NSDate)monotonicNow;
- (NSDate)start;
- (NSDictionary)bundleIDsToBackgroundTimes;
- (NSDictionary)bundleIDsToDisplayNames;
- (NSDictionary)bundleIDsToEnergyKeyForSlopAdjustment;
- (NSDictionary)bundleIDsToForegroundTimes;
- (NSDictionary)bundleIDsToReplacementBundleIDs;
- (NSDictionary)lastBatteryEntry;
- (NSDictionary)nodeIDsToNodeNames;
- (NSDictionary)pluginBundleIDsToEntries;
- (NSDictionary)rootNodeIDToRootNodeEnergyKeys;
- (NSMutableArray)buckets;
- (NSSet)deletedAppBundleIDs;
- (NSSet)deletedAppClipBundleIDs;
- (NSSet)exchangeBundleIDs;
- (NSSet)intermediateRootNodes;
- (NSSet)nonAppBundleIDs;
- (NSSet)rootNodeBundleIDs;
- (NSSet)webAppBundleIDs;
- (PLBatteryUIResponderService)responderService;
- (_PLTimeIntervalRange)generateRange:(_PLTimeIntervalRange)result withDataRange:(_PLTimeIntervalRange)a4;
- (_PLTimeIntervalRange)getDataRange:(id)a3;
- (double)bucketSize;
- (double)dataDuration;
- (double)getDataDurationFromRange:(_PLTimeIntervalRange)a3;
- (double)getEnergyToRemoveForSlopAdjustment:(id)a3 withEnergyKey:(id)a4 forBucket:(id)a5;
- (double)getNonAppRuntimesWith:(id)a3 identificationKey:(id)a4 andRange:(_PLTimeIntervalRange)a5 withNow:(id)a6;
- (double)lastUpgradeTimestamp;
- (id)buildBucketWithEnergyEntries:(id)a3 andRange:(_PLTimeIntervalRange)a4;
- (id)buildEnergyEntriesWithRootNodes:(id)a3 andQualificationNodes:(id)a4 andRange:(_PLTimeIntervalRange)a5;
- (id)combineQualifiers:(id)a3;
- (id)dependencies;
- (id)getAppRuntimesInRange:(_PLTimeIntervalRange)a3;
- (id)getBundleIDToBackgroundTimeMap;
- (id)getBundleIDToDisplayNameMap;
- (id)getBundleIDToForegroundTimeMap;
- (id)getBundleIDToReplacementBundleIDMap;
- (id)getBundleIDsToEnergyKeyForSlopAdjustmentMap;
- (id)getDeletedAppBundleIDs;
- (id)getDeletedAppClipBundleIDs;
- (id)getEnergyEntry:(id)a3 forBundleID:(id)a4;
- (id)getExchangeBundleIDs;
- (id)getInstalledPluginEntries;
- (id)getIntermediateRootNodes;
- (id)getLastBatteryEntry;
- (id)getNodeEntriesForEntryKey:(id)a3 withRange:(_PLTimeIntervalRange)a4 andTimeInterval:(double)a5;
- (id)getNodeIDToNodeNameMap;
- (id)getNonAppBundleIDs;
- (id)getNonAppRuntimesInRange:(_PLTimeIntervalRange)a3 withNow:(id)a4;
- (id)getNotificationEntriesInRange:(_PLTimeIntervalRange)a3;
- (id)getPluginBundleIDToEntryMap;
- (id)getQualificationNodeEntriesInRange:(_PLTimeIntervalRange)a3 withTimeInterval:(double)a4;
- (id)getRootNodeBundleIDs;
- (id)getRootNodeEntriesInRange:(_PLTimeIntervalRange)a3 withTimeInterval:(double)a4;
- (id)getRootNodeIDToRootNodeEnergyKeys;
- (id)getWebAppBundleIDs;
- (id)getWidgetUpdateTypeToCount:(id)a3 inRange:(_PLTimeIntervalRange)a4;
- (id)ongoingUpdateRestoreEntryInitializer;
- (id)processAppTimeEntries:(id)a3 inRange:(_PLTimeIntervalRange)a4 withAppArray:(id)a5;
- (id)processNotificationEntries:(id)a3 inRange:(_PLTimeIntervalRange)a4 withAppArray:(id)a5;
- (id)processQualificationNodes:(id)a3 inRange:(_PLTimeIntervalRange)a4;
- (id)processRootNodes:(id)a3 inRange:(_PLTimeIntervalRange)a4;
- (id)result;
- (id)stringifyKeysForDict:(id)a3;
- (int)computeNumberOfBuckets;
- (signed)getEnergyMetricBucketForRootNodeID:(id)a3;
- (signed)getWidgetTypeForEnergyEntry:(id)a3;
- (signed)getWidgetTypeForHostName:(id)a3;
- (void)addEntryTypes:(id)a3;
- (void)addErrorCode:(id)a3;
- (void)addQualifiers:(id)a3;
- (void)addTotalEnergy:(id)a3;
- (void)addTotals:(id)a3;
- (void)adjustEnergyValues:(id)a3;
- (void)adjustExtensionBackgroundTimeWithEnergyEntries:(id)a3;
- (void)adjustRuntimes:(id)a3;
- (void)applyDisplayNameTransformation:(id)a3;
- (void)applyDynamicNameTransformation:(id)a3;
- (void)applySlopAdjustment:(id)a3;
- (void)applyStaticNameTransformation:(id)a3;
- (void)buildBucketsForRange:(_PLTimeIntervalRange)a3;
- (void)buildUtilityCache;
- (void)cleanEntries:(id)a3;
- (void)coalesce;
- (void)collapseEnergyEntries:(id)a3;
- (void)configure:(id)a3;
- (void)enumerateBucketsUsingBlock:(id)a3;
- (void)filterEnergyEntries:(id)a3;
- (void)filterEnergyEntriesWithRuntimes:(id)a3;
- (void)getStaticData;
- (void)identifyBucket:(id)a3 withRange:(_PLTimeIntervalRange)a4;
- (void)initializeBucketsWithRange:(_PLTimeIntervalRange)a3;
- (void)ongoingUpdateRestoreTransformations:(id)a3;
- (void)prepareBucketsWithRange:(_PLTimeIntervalRange)a3;
- (void)reaccountBackupRestore:(id)a3;
- (void)reaccountExchangeEntries:(id)a3;
- (void)setBucketSize:(double)a3;
- (void)setBuckets:(id)a3;
- (void)setBundleIDsToBackgroundTimes:(id)a3;
- (void)setBundleIDsToDisplayNames:(id)a3;
- (void)setBundleIDsToEnergyKeyForSlopAdjustment:(id)a3;
- (void)setBundleIDsToForegroundTimes:(id)a3;
- (void)setBundleIDsToReplacementBundleIDs:(id)a3;
- (void)setDataDuration:(double)a3;
- (void)setDeletedAppBundleIDs:(id)a3;
- (void)setDeletedAppClipBundleIDs:(id)a3;
- (void)setEnd:(id)a3;
- (void)setExchangeBundleIDs:(id)a3;
- (void)setGizmoConnected:(BOOL)a3;
- (void)setHasHomeKit:(BOOL)a3;
- (void)setIntermediateRootNodes:(id)a3;
- (void)setIsSlopAdjustmentEnabled:(BOOL)a3;
- (void)setLastBatteryEntry:(id)a3;
- (void)setLastUpgradeTimestamp:(double)a3;
- (void)setMonotonicNow:(id)a3;
- (void)setNodeIDsToNodeNames:(id)a3;
- (void)setNonAppBundleIDs:(id)a3;
- (void)setPluginBundleIDsToEntries:(id)a3;
- (void)setResponderService:(id)a3;
- (void)setRootNodeBundleIDs:(id)a3;
- (void)setRootNodeIDToRootNodeEnergyKeys:(id)a3;
- (void)setStart:(id)a3;
- (void)setWebAppBundleIDs:(id)a3;
- (void)transformCloudDocs:(id)a3;
- (void)transformDeletedApps:(id)a3;
- (void)transformGizmoDaemons:(id)a3;
- (void)transformPlugins:(id)a3 withBucket:(id)a4;
@end

@implementation PLBatteryUIResponseTypeBatteryBreakdown

- (id)getRootNodeIDToRootNodeEnergyKeys
{
  v22[17] = *MEMORY[0x1E4F143B8];
  v20 = [&unk_1F40126D0 objectAtIndexedSubscript:2];
  v21[0] = v20;
  v22[0] = @"PLBatteryUIAppCPUEnergyKey";
  v19 = [&unk_1F40126E8 objectAtIndexedSubscript:4];
  v21[1] = v19;
  v22[1] = @"PLBatteryUIAppVENCEnergyKey";
  v18 = [&unk_1F4012700 objectAtIndexedSubscript:5];
  v21[2] = v18;
  v22[2] = @"PLBatteryUIAppVDECEnergyKey";
  v17 = [&unk_1F4012718 objectAtIndexedSubscript:6];
  v21[3] = v17;
  v22[3] = @"PLBatteryUIAppISPEnergyKey";
  v16 = [&unk_1F4012730 objectAtIndexedSubscript:7];
  v21[4] = v16;
  v22[4] = @"PLBatteryUIAppRestOfSOCEnergyKey";
  v15 = [&unk_1F4012748 objectAtIndexedSubscript:8];
  v21[5] = v15;
  v22[5] = @"PLBatteryUIAppGPUEnergyKey";
  v14 = [&unk_1F4012760 objectAtIndexedSubscript:9];
  v21[6] = v14;
  v22[6] = @"PLBatteryUIAppDRAMEnergyKey";
  v13 = [&unk_1F4012778 objectAtIndexedSubscript:10];
  v21[7] = v13;
  v22[7] = @"PLBatteryUIAppDisplayEnergyKey";
  v2 = [&unk_1F4012790 objectAtIndexedSubscript:11];
  v21[8] = v2;
  v22[8] = @"PLBatteryUIAppWIFIEnergyKey";
  v3 = [&unk_1F40127A8 objectAtIndexedSubscript:15];
  v21[9] = v3;
  v22[9] = @"PLBatteryUIAppAUDIOEnergyKey";
  v4 = [&unk_1F40127C0 objectAtIndexedSubscript:37];
  v21[10] = v4;
  v22[10] = @"PLBatteryUIAppBBEnergyKey";
  v5 = [&unk_1F40127D8 objectAtIndexedSubscript:48];
  v21[11] = v5;
  v22[11] = @"BLMEnergyGPS";
  v6 = [&unk_1F40127F0 objectAtIndexedSubscript:12];
  v21[12] = v6;
  v22[12] = @"PLBatteryUIAppWifiLocationEnergyKey";
  v7 = [&unk_1F4012808 objectAtIndexedSubscript:13];
  v21[13] = v7;
  v22[13] = @"PLBatteryUIAppWifiPipelineEnergyKey";
  v8 = [&unk_1F4012820 objectAtIndexedSubscript:50];
  v21[14] = v8;
  v22[14] = @"PLBatteryUIAppBluetoothEnergyKey";
  v9 = [&unk_1F4012838 objectAtIndexedSubscript:20];
  v21[15] = v9;
  v22[15] = @"PLBatteryUIAppAccessoryEnergyKey";
  v10 = [&unk_1F4012850 objectAtIndexedSubscript:16];
  v21[16] = v10;
  v22[16] = @"PLBatteryUIAppNfcEnergyKey";
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:17];

  return v11;
}

- (id)getIntermediateRootNodes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F4012868];
}

- (signed)getEnergyMetricBucketForRootNodeID:(id)a3
{
  unsigned int v3 = [a3 intValue] - 2;
  if (v3 > 0x3C) {
    return 0;
  }
  else {
    return word_1E44044A0[v3];
  }
}

- (_PLTimeIntervalRange)getDataRange:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F92D20];
  v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"UsageTime"];
  v37 = [MEMORY[0x1E4F92968] entryKeyForType:v5 andName:*MEMORY[0x1E4F92B48]];
  v7 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  v8 = [v7 storage];
  v9 = [v8 firstEntryForKey:v6];

  if (v9)
  {
    id v10 = [v9 entryDate];
    v11 = PLLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIService getDataRangeWithNow:].cold.4();
    }
  }
  else
  {
    v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getDataRange:](v12);
    }

    id v10 = v4;
  }
  v13 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  v14 = [v13 storage];
  v15 = [v14 firstEntryForKey:v37];

  if (v15)
  {
    id v16 = [v15 entryDate];
    v17 = PLLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIService getDataRangeWithNow:]();
    }
  }
  else
  {
    v18 = PLLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getDataRange:](v18);
    }

    id v16 = v4;
  }
  v19 = [v16 laterDate:v10];
  id v20 = v4;
  [v19 timeIntervalSince1970];
  double v22 = v21;
  [v20 timeIntervalSince1970];
  double v24 = v23;

  double v25 = v24 - v22;
  v26 = PLLogCommon();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = NSString;
    v36 = v15;
    v28 = v9;
    [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v22];
    id v29 = v10;
    v31 = v30 = v6;
    v32 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v22 + v25];
    v33 = [v27 stringWithFormat:@"Start: %@, End %@", v31, v32];

    v9 = v28;
    v15 = v36;

    v6 = v30;
    id v10 = v29;
    *(_DWORD *)buf = 138412290;
    v39 = v33;
    _os_log_impl(&dword_1E4220000, v26, OS_LOG_TYPE_INFO, "dataRange: %@", buf, 0xCu);
  }
  double v34 = v22;
  double v35 = v25;
  result.length = v35;
  result.location = v34;
  return result;
}

- (double)getDataDurationFromRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9C8];
  v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  v7 = [v6 convertFromMonotonicToSystem];
  v8 = [v5 nearestMidnightBeforeDate:v7];

  v9 = (void *)MEMORY[0x1E4F1C9C8];
  id v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:location + length];
  v11 = [v10 convertFromMonotonicToSystem];
  v12 = [v9 nearestMidnightAfterDate:v11];

  [v12 timeIntervalSinceDate:v8];
  double v14 = v13;

  return v14;
}

- (id)getNodeEntriesForEntryKey:(id)a3 withRange:(_PLTimeIntervalRange)a4 andTimeInterval:(double)a5
{
  double length = a4.length;
  double location = a4.location;
  id v9 = a3;
  id v10 = [NSString stringWithFormat:@"(%@ NOT NULL) AND (%@ NOT LIKE '%%%@%%') AND (%@ NOT LIKE '%%%@%%')", *MEMORY[0x1E4F92BA0], *MEMORY[0x1E4F92BA0], @"null", *MEMORY[0x1E4F92BA0], @"unknown"];
  v11 = NSString;
  uint64_t v12 = *MEMORY[0x1E4F92B30];
  double v13 = [MEMORY[0x1E4F92908] entryKey];
  double v14 = [v11 stringWithFormat:@"%@ IN (SELECT ID FROM '%@' WHERE %@)", v12, v13, v10];

  v15 = [NSString stringWithFormat:@"%@ > %d", *MEMORY[0x1E4F92B50], 100];
  objc_msgSend(NSString, "stringWithFormat:", @"SELECT * FROM '%@' WHERE (timestamp>%f AND timestamp<%f AND timeInterval=%f AND (%@) AND (%@));",
    v9,
    *(void *)&location,
    location + length,
    *(void *)&a5,
    v14,
  id v16 = v15);
  v17 = PLLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getNodeEntriesForEntryKey:withRange:andTimeInterval:]();
  }

  v18 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  v19 = [v18 storage];
  id v20 = [v19 entriesForKey:v9 withQuery:v16];

  return v20;
}

- (id)getAppRuntimesInRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  uint64_t v5 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  v6 = [v5 storage];
  v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"AppRunTime"];
  v8 = objc_msgSend(v6, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v7, 3600.0, location, length);

  return v8;
}

- (id)getNonAppRuntimesInRange:(_PLTimeIntervalRange)a3 withNow:(id)a4
{
  double length = a3.length;
  double location = a3.location;
  v16[3] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  if (v8)
  {
    [(PLBatteryUIResponseTypeBatteryBreakdown *)self getNonAppRuntimesWith:@"PLCameraAgent_EventForward_Torch", @"Level", v7, location, length identificationKey andRange withNow];
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }

  v11 = [MEMORY[0x1E4F1CA48] array];
  if (v10 > 0.0)
  {
    v15[0] = @"BundleID";
    v15[1] = @"ScreenOnTime";
    v16[0] = @"Flashlight";
    v16[1] = &unk_1F400C190;
    v15[2] = @"BackgroundTime";
    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:v10];
    v16[2] = v12;
    double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

    [v11 addObject:v13];
  }

  return v11;
}

- (double)getNonAppRuntimesWith:(id)a3 identificationKey:(id)a4 andRange:(_PLTimeIntervalRange)a5 withNow:(id)a6
{
  double length = a5.length;
  double location = a5.location;
  v53[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v46 = a6;
  double v13 = location + 1800.0;
  id v14 = objc_alloc(MEMORY[0x1E4F92A90]);
  v15 = [MEMORY[0x1E4F28ED0] numberWithDouble:v13];
  uint64_t v16 = [v14 initWithKey:@"timestamp" withValue:v15 withComparisonOperation:5];

  v17 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  v18 = [v17 storage];
  v45 = (void *)v16;
  v53[0] = v16;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
  id v20 = [v18 lastEntryForKey:v11 withComparisons:v19 isSingleton:0];

  if (v20)
  {
    double v21 = [v20 objectForKeyedSubscript:v12];
    int v22 = [v21 BOOLValue];

    if (v22) {
      double v23 = v13;
    }
    else {
      double v23 = -1.0;
    }
  }
  else
  {
    double v23 = -1.0;
  }
  double v24 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  double v25 = [v24 storage];
  id v47 = v11;
  v26 = objc_msgSend(v25, "entriesForKey:inTimeRange:withFilters:", v11, 0, v13, length);

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v27 = [v26 reverseObjectEnumerator];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v49;
    double v31 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v49 != v30) {
          objc_enumerationMutation(v27);
        }
        v33 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        double v34 = [v33 objectForKeyedSubscript:v12];
        int v35 = [v34 BOOLValue];

        if (v35)
        {
          if (v23 == -1.0)
          {
            v36 = [v33 entryDate];
            [v36 timeIntervalSince1970];
            double v23 = v37;
          }
        }
        else
        {
          if (v23 != -1.0)
          {
            v38 = [v33 entryDate];
            [v38 timeIntervalSince1970];
            double v40 = v39 - v23;

            double v31 = v31 + v40;
          }
          double v23 = -1.0;
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v29);
  }
  else
  {
    double v31 = 0.0;
  }

  if (v23 == -1.0)
  {
    v41 = v46;
    v43 = v47;
  }
  else
  {
    v41 = v46;
    [v46 timeIntervalSince1970];
    if (v42 >= length + v13) {
      double v42 = length + v13;
    }
    double v31 = v31 + v42 - v23;
    v43 = v47;
  }

  return v31;
}

- (id)getDeletedAppBundleIDs
{
  v35[1] = *MEMORY[0x1E4F143B8];
  unsigned int v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v3, OS_LOG_TYPE_DEFAULT, "Searching for deleted app names", buf, 2u);
  }

  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"AppDeletedDate" withValue:&unk_1F400C190 withComparisonOperation:1];
  v6 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  id v7 = [v6 storage];
  v35[0] = v5;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  double v24 = (void *)v4;
  double v9 = [v7 entriesForKey:v4 withComparisons:v8];

  double v10 = PLLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v31 = v9;
    _os_log_impl(&dword_1E4220000, v10, OS_LOG_TYPE_DEFAULT, "DeletedAppEntries = %@", buf, 0xCu);
  }

  double v25 = [MEMORY[0x1E4F1CA80] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v17 = [v16 objectForKeyedSubscript:@"AppBundleId"];
        v18 = [v16 objectForKeyedSubscript:@"AppIsClip"];
        v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = [v18 intValue];
          *(_DWORD *)buf = 138412546;
          double v31 = v17;
          __int16 v32 = 1024;
          int v33 = v20;
          _os_log_impl(&dword_1E4220000, v19, OS_LOG_TYPE_DEFAULT, "bundleID=%@, appIsClip=%d", buf, 0x12u);
        }

        if (v17 && ([v18 BOOLValue] & 1) == 0) {
          [v25 addObject:v17];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v13);
  }

  double v21 = PLLogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v31 = v25;
    _os_log_impl(&dword_1E4220000, v21, OS_LOG_TYPE_DEFAULT, "DeletedAppNames = %@", buf, 0xCu);
  }

  int v22 = (void *)[v25 copy];
  return v22;
}

- (id)getDeletedAppClipBundleIDs
{
  v35[1] = *MEMORY[0x1E4F143B8];
  unsigned int v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v3, OS_LOG_TYPE_DEFAULT, "Searching for deleted app clip names", buf, 2u);
  }

  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"AppDeletedDate" withValue:&unk_1F400C190 withComparisonOperation:1];
  v6 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  id v7 = [v6 storage];
  v35[0] = v5;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  double v24 = (void *)v4;
  double v9 = [v7 entriesForKey:v4 withComparisons:v8];

  double v10 = PLLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v31 = v9;
    _os_log_impl(&dword_1E4220000, v10, OS_LOG_TYPE_DEFAULT, "DeletedAppEntries = %@", buf, 0xCu);
  }

  double v25 = [MEMORY[0x1E4F1CA80] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v17 = [v16 objectForKeyedSubscript:@"AppBundleId"];
        v18 = [v16 objectForKeyedSubscript:@"AppIsClip"];
        v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = [v18 intValue];
          *(_DWORD *)buf = 138412546;
          double v31 = v17;
          __int16 v32 = 1024;
          int v33 = v20;
          _os_log_impl(&dword_1E4220000, v19, OS_LOG_TYPE_DEFAULT, "bundleID=%@, appIsClip=%d", buf, 0x12u);
        }

        if (v17 && [v18 BOOLValue]) {
          [v25 addObject:v17];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v13);
  }

  double v21 = PLLogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v31 = v25;
    _os_log_impl(&dword_1E4220000, v21, OS_LOG_TYPE_DEFAULT, "DeletedAppNames = %@", buf, 0xCu);
  }

  int v22 = (void *)[v25 copy];
  return v22;
}

- (id)getWebAppBundleIDs
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [MEMORY[0x1E4F929E0] entryKeyForOperatorName:@"PLXPCAgent" withType:*MEMORY[0x1E4F92D30] withName:@"WebApp"];
  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  v6 = [v5 storage];
  id v7 = [v6 entriesForKey:v3];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = [v12 objectForKeyedSubscript:@"identifier"];

        if (v13)
        {
          uint64_t v14 = [v12 objectForKeyedSubscript:@"identifier"];
          [v4 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  v15 = (void *)[v4 copy];
  return v15;
}

- (id)getBundleIDToDisplayNameMap
{
  v80[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"AppDeletedDate" withValue:&unk_1F400C190 withComparisonOperation:0];
  uint64_t v5 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  v6 = [v5 storage];
  v56 = (void *)v4;
  v80[0] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:1];
  v57 = (void *)v3;
  uint64_t v8 = [v6 entriesForKey:v3 withComparisons:v7];

  v61 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getBundleIDToDisplayNameMap]();
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v68 objects:v79 count:16];
  unint64_t v12 = 0x1E4F92000uLL;
  v58 = v10;
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v69;
    v15 = @"AppType";
    do
    {
      uint64_t v16 = 0;
      uint64_t v59 = v13;
      do
      {
        if (*(void *)v69 != v14) {
          objc_enumerationMutation(v10);
        }
        long long v17 = *(void **)(*((void *)&v68 + 1) + 8 * v16);
        long long v18 = [v17 objectForKeyedSubscript:v15];
        int v19 = [v18 intValue];

        if (v19 == 101
          || ([v17 objectForKeyedSubscript:@"AppBundleId"],
              long long v20 = objc_claimAutoreleasedReturnValue(),
              int v21 = [v20 isEqualToString:@"com.apple.NanoUniverse.AegirProxyApp"],
              v20,
              v21))
        {
          uint64_t v22 = [v17 objectForKeyedSubscript:@"AppBundleId"];
          double v23 = [v17 objectForKeyedSubscript:@"AppName"];
          if ([*(id *)(v12 + 2496) debugEnabled])
          {
            uint64_t v24 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getBundleIDToDisplayNameMap__block_invoke;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v24;
            if (getBundleIDToDisplayNameMap_defaultOnce != -1) {
              dispatch_once(&getBundleIDToDisplayNameMap_defaultOnce, block);
            }
            if (getBundleIDToDisplayNameMap_classDebugEnabled)
            {
              uint64_t v25 = v14;
              long long v26 = v15;
              long long v27 = [NSString stringWithFormat:@"bundleID=%@, displayName=%@", v22, v23];
              long long v28 = (void *)MEMORY[0x1E4F929B8];
              long long v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown+Utilities.m"];
              uint64_t v30 = [v29 lastPathComponent];
              double v31 = [NSString stringWithUTF8String:"-[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getBundleIDToDisplayNameMap]"];
              [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:338];

              __int16 v32 = PLLogCommon();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v78 = v27;
                _os_log_debug_impl(&dword_1E4220000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v12 = 0x1E4F92000;
              v15 = v26;
              uint64_t v14 = v25;
              id v10 = v58;
              uint64_t v13 = v59;
            }
          }
          [v61 setObject:v23 forKeyedSubscript:v22];
        }
        else
        {
          uint64_t v22 = PLLogCommon();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            [(PLBatteryUIResponseTypeBatteryBreakdown(Utilities) *)&v75 getBundleIDToDisplayNameMap];
          }
        }

        ++v16;
      }
      while (v13 != v16);
      uint64_t v13 = [v10 countByEnumeratingWithState:&v68 objects:v79 count:16];
    }
    while (v13);
  }

  int v33 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v63 objects:v74 count:16];
  unint64_t v35 = 0x1E6E46000uLL;
  if (v34)
  {
    uint64_t v36 = v34;
    uint64_t v37 = *(void *)v64;
    v60 = v33;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v64 != v37) {
          objc_enumerationMutation(v33);
        }
        double v39 = *(void **)(*((void *)&v63 + 1) + 8 * v38);
        if (([v39 mayBeBUIVisible] & 1) == 0)
        {
          double v40 = [v39 bundleIdentifier];
          int v41 = [v40 isEqualToString:@"com.apple.NanoUniverse.AegirProxyApp"];

          if (!v41)
          {
            v44 = PLLogCommon();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
              [(PLBatteryUIResponseTypeBatteryBreakdown(Utilities) *)&v72 getBundleIDToDisplayNameMap];
            }
            goto LABEL_42;
          }
        }
        if (([*(id *)(v35 + 2984) hasScreenPresence:v39] & 1) != 0
          || ([v39 bundleIdentifier],
              double v42 = objc_claimAutoreleasedReturnValue(),
              int v43 = [v42 isEqualToString:@"com.apple.NanoUniverse.AegirProxyApp"],
              v42,
              v43))
        {
          v44 = [v39 bundleIdentifier];
          v45 = [v61 objectForKeyedSubscript:v44];

          if (!v45)
          {
            id v46 = [v39 localizedName];
            if ([MEMORY[0x1E4F929C0] debugEnabled])
            {
              uint64_t v47 = objc_opt_class();
              v62[0] = MEMORY[0x1E4F143A8];
              v62[1] = 3221225472;
              v62[2] = __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getBundleIDToDisplayNameMap__block_invoke_401;
              v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v62[4] = v47;
              if (getBundleIDToDisplayNameMap_defaultOnce_399 != -1) {
                dispatch_once(&getBundleIDToDisplayNameMap_defaultOnce_399, v62);
              }
              if (getBundleIDToDisplayNameMap_classDebugEnabled_400)
              {
                long long v48 = [NSString stringWithFormat:@"bundleID=%@, displayName=%@", v44, v46];
                long long v49 = (void *)MEMORY[0x1E4F929B8];
                long long v50 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown+Utilities.m"];
                long long v51 = [v50 lastPathComponent];
                v52 = [NSString stringWithUTF8String:"-[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getBundleIDToDisplayNameMap]"];
                [v49 logMessage:v48 fromFile:v51 fromFunction:v52 fromLineNumber:356];

                v53 = PLLogCommon();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v48;
                  _os_log_debug_impl(&dword_1E4220000, v53, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                unint64_t v35 = 0x1E6E46000;
                int v33 = v60;
              }
            }
            [v61 setObject:v46 forKeyedSubscript:v44];
          }
LABEL_42:
        }
        ++v38;
      }
      while (v36 != v38);
      uint64_t v36 = [v33 countByEnumeratingWithState:&v63 objects:v74 count:16];
    }
    while (v36);
  }
  [v61 setObject:@"Apple Watch" forKeyedSubscript:@"com.apple.Bridge"];
  v54 = (void *)[v61 copy];

  return v54;
}

uint64_t __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getBundleIDToDisplayNameMap__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  getBundleIDToDisplayNameMap_classDebugEnabled = result;
  return result;
}

uint64_t __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getBundleIDToDisplayNameMap__block_invoke_401(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  getBundleIDToDisplayNameMap_classDebugEnabled_400 = result;
  return result;
}

- (id)getNodeIDToNodeNameMap
{
  v31[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [NSString stringWithFormat:@"(%@ NOT NULL) AND (%@ NOT LIKE '%%%@%%') AND (%@ NOT LIKE '%%%@%%')", *MEMORY[0x1E4F92BA0], *MEMORY[0x1E4F92BA0], @"null", *MEMORY[0x1E4F92BA0], @"unknown"];
  uint64_t v4 = NSString;
  uint64_t v5 = *MEMORY[0x1E4F92B30];
  v6 = [MEMORY[0x1E4F92908] entryKey];
  uint64_t v24 = (void *)v3;
  id v7 = [v4 stringWithFormat:@"%@ IN (SELECT ID FROM '%@' WHERE %@)", v5, v6, v3];

  uint64_t v8 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  uint64_t v9 = [v8 storage];
  id v10 = [MEMORY[0x1E4F92968] entryKeyForType:*MEMORY[0x1E4F92D40] andName:*MEMORY[0x1E4F92B98]];
  uint64_t v30 = @"WHERE";
  v31[0] = v7;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  unint64_t v12 = [v9 entriesForKey:v10 withProperties:v11];

  uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        int v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v20 = [v19 name];
        int v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v19, "entryID"));
        [v13 setObject:v20 forKeyedSubscript:v21];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  uint64_t v22 = (void *)[v13 copy];
  return v22;
}

- (id)getPluginBundleIDToEntryMap
{
  v78[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllPlugins"];
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"PluginDeletedDate" withValue:&unk_1F400C190 withComparisonOperation:0];
  v62 = self;
  uint64_t v5 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  v6 = [v5 storage];
  v54 = (void *)v4;
  v78[0] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:1];
  v55 = (void *)v3;
  uint64_t v8 = [v6 entriesForKey:v3 withComparisons:v7];

  unint64_t v9 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getPluginBundleIDToEntryMap__block_invoke;
    v73[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v73[4] = v10;
    if (getPluginBundleIDToEntryMap_defaultOnce != -1) {
      dispatch_once(&getPluginBundleIDToEntryMap_defaultOnce, v73);
    }
    if (getPluginBundleIDToEntryMap_classDebugEnabled)
    {
      uint64_t v11 = [NSString stringWithFormat:@"installedPluginEntries=%@", v8];
      unint64_t v12 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown+Utilities.m"];
      id v14 = [v13 lastPathComponent];
      uint64_t v15 = [NSString stringWithUTF8String:"-[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getPluginBundleIDToEntryMap]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:396];

      uint64_t v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = v8;
  uint64_t v18 = [obj countByEnumeratingWithState:&v69 objects:v77 count:16];
  v60 = v17;
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v70;
    int v21 = @"PluginId";
    do
    {
      uint64_t v22 = 0;
      uint64_t v58 = v19;
      do
      {
        if (*(void *)v70 != v20) {
          objc_enumerationMutation(obj);
        }
        double v23 = *(void **)(*((void *)&v69 + 1) + 8 * v22);
        uint64_t v24 = [v23 objectForKeyedSubscript:v21];
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v25 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getPluginBundleIDToEntryMap__block_invoke_422;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v25;
          if (getPluginBundleIDToEntryMap_defaultOnce_420 != -1) {
            dispatch_once(&getPluginBundleIDToEntryMap_defaultOnce_420, block);
          }
          if (getPluginBundleIDToEntryMap_classDebugEnabled_421)
          {
            uint64_t v26 = v20;
            long long v27 = v21;
            long long v28 = [NSString stringWithFormat:@"pluginBundleID=%@", v24];
            long long v29 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown+Utilities.m"];
            double v31 = [v30 lastPathComponent];
            __int16 v32 = [NSString stringWithUTF8String:"-[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getPluginBundleIDToEntryMap]"];
            [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:401];

            int v33 = PLLogCommon();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v76 = v28;
              _os_log_debug_impl(&dword_1E4220000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v9 = 0x1E4F92000uLL;
            int v21 = v27;
            uint64_t v20 = v26;
            uint64_t v19 = v58;
            uint64_t v17 = v60;
          }
        }
        [v17 setObject:v23 forKeyedSubscript:v24];

        ++v22;
      }
      while (v19 != v22);
      uint64_t v19 = [obj countByEnumeratingWithState:&v69 objects:v77 count:16];
    }
    while (v19);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v34 = [(PLBatteryUIResponseTypeBatteryBreakdown *)v62 getInstalledPluginEntries];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v65;
    uint64_t v56 = *(void *)v65;
    v57 = v34;
    do
    {
      uint64_t v38 = 0;
      uint64_t v59 = v36;
      do
      {
        if (*(void *)v65 != v37) {
          objc_enumerationMutation(v34);
        }
        double v39 = *(void **)(*((void *)&v64 + 1) + 8 * v38);
        double v40 = [v39 objectForKeyedSubscript:@"PluginId"];
        int v41 = [v39 objectForKeyedSubscript:@"PluginParentApp"];
        double v42 = [v17 objectForKeyedSubscript:v40];

        if (!v42)
        {
          if ([*(id *)(v9 + 2496) debugEnabled])
          {
            uint64_t v43 = objc_opt_class();
            v63[0] = MEMORY[0x1E4F143A8];
            v63[1] = 3221225472;
            v63[2] = __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getPluginBundleIDToEntryMap__block_invoke_431;
            v63[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v63[4] = v43;
            if (getPluginBundleIDToEntryMap_defaultOnce_429 != -1) {
              dispatch_once(&getPluginBundleIDToEntryMap_defaultOnce_429, v63);
            }
            if (getPluginBundleIDToEntryMap_classDebugEnabled_430)
            {
              v44 = NSString;
              v45 = [v39 objectForKeyedSubscript:@"PluginExecutableName"];
              id v46 = [v39 objectForKeyedSubscript:@"PluginType"];
              uint64_t v47 = [v44 stringWithFormat:@"pluginExecutableName=%@, pluginBundleID=%@, pluginParentApp=%@, pluginType=%@", v45, v40, v41, v46];

              long long v48 = (void *)MEMORY[0x1E4F929B8];
              long long v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown+Utilities.m"];
              long long v50 = [v49 lastPathComponent];
              long long v51 = [NSString stringWithUTF8String:"-[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getPluginBundleIDToEntryMap]"];
              [v48 logMessage:v47 fromFile:v50 fromFunction:v51 fromLineNumber:412];

              v52 = PLLogCommon();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v76 = v47;
                _os_log_debug_impl(&dword_1E4220000, v52, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v9 = 0x1E4F92000;
              uint64_t v36 = v59;
              uint64_t v17 = v60;
              uint64_t v37 = v56;
              uint64_t v34 = v57;
            }
          }
          [v17 setObject:v39 forKeyedSubscript:v40];
        }

        ++v38;
      }
      while (v36 != v38);
      uint64_t v36 = [v34 countByEnumeratingWithState:&v64 objects:v74 count:16];
    }
    while (v36);
  }

  return v17;
}

uint64_t __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getPluginBundleIDToEntryMap__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  getPluginBundleIDToEntryMap_classDebugEnabled = result;
  return result;
}

uint64_t __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getPluginBundleIDToEntryMap__block_invoke_422(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  getPluginBundleIDToEntryMap_classDebugEnabled_421 = result;
  return result;
}

uint64_t __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getPluginBundleIDToEntryMap__block_invoke_431(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  getPluginBundleIDToEntryMap_classDebugEnabled_430 = result;
  return result;
}

- (id)getNotificationEntriesInRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  uint64_t v5 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  v6 = [v5 storage];
  id v7 = objc_msgSend(v6, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", @"PLSpringBoardAgent_Aggregate_SBNotifications_Aggregate", 3600.0, location, length);

  uint64_t v8 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getNotificationEntriesInRange___block_invoke;
  v12[3] = &unk_1E6E47CE8;
  double v14 = location;
  double v15 = length;
  id v13 = v8;
  id v9 = v8;
  [v7 enumerateObjectsUsingBlock:v12];
  uint64_t v10 = [MEMORY[0x1E4F929D0] summarizeAggregateEntries:v9 withPrimaryKeys:&unk_1F4012880];

  return v10;
}

void __84__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getNotificationEntriesInRange___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 entryDate];
  double v4 = *(double *)(a1 + 40);
  double v5 = *(double *)(a1 + 48);
  id v6 = v3;
  if (v6)
  {
    id v7 = v6;
    [v6 timeIntervalSince1970];
    double v9 = v8;
    double v10 = v4 + v5;

    if (v4 <= v9 && v9 < v10) {
      [*(id *)(a1 + 32) addObject:v12];
    }
  }
}

- (id)getInstalledPluginEntries
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v29 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v2 = [MEMORY[0x1E4F223A0] enumeratorWithOptions:0];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v35;
    uint64_t v30 = *MEMORY[0x1E4F92D40];
    do
    {
      uint64_t v6 = 0;
      uint64_t v31 = v4;
      do
      {
        if (*(void *)v35 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v34 + 1) + 8 * v6);
        uint64_t v8 = [v7 bundleIdentifier];
        if (!v8) {
          goto LABEL_20;
        }
        double v9 = (void *)v8;
        uint64_t v10 = [v7 executableURL];
        if (!v10) {
          goto LABEL_19;
        }
        uint64_t v11 = (void *)v10;
        id v12 = [v7 containingBundleRecord];
        if (!v12) {
          goto LABEL_12;
        }
        int v33 = [v7 containingBundleRecord];
        id v13 = [v33 bundleIdentifier];
        if (!v13)
        {
          __int16 v32 = 0;
LABEL_12:
          uint64_t v15 = v5;
          uint64_t v16 = v2;
          uint64_t v17 = [v7 extensionPointRecord];
          uint64_t v18 = [v17 identifier];
          int v14 = [v18 isEqualToString:@"com.apple.posterkit.provider"];

          if (!v12)
          {

            v2 = v16;
            uint64_t v5 = v15;
            uint64_t v4 = v31;
            if (!v14) {
              goto LABEL_20;
            }
LABEL_17:
            id v19 = objc_alloc(MEMORY[0x1E4F929D0]);
            uint64_t v20 = +[PLOperator entryKeyForType:v30 andName:@"AllPlugins"];
            double v9 = (void *)[v19 initWithEntryKey:v20];

            int v21 = [v7 bundleIdentifier];
            [v9 setObject:v21 forKeyedSubscript:@"PluginId"];

            uint64_t v22 = [v7 containingBundleRecord];
            double v23 = [v22 bundleIdentifier];
            [v9 setObject:v23 forKeyedSubscript:@"PluginParentApp"];

            uint64_t v24 = [v7 extensionPointRecord];
            uint64_t v25 = [v24 identifier];
            [v9 setObject:v25 forKeyedSubscript:@"PluginType"];

            uint64_t v26 = [v7 executableURL];
            long long v27 = [v26 path];
            [v9 setObject:v27 forKeyedSubscript:@"PluginExecutableName"];

            [v9 setObject:&unk_1F400C190 forKeyedSubscript:@"PluginDeletedDate"];
            if (!v9) {
              goto LABEL_20;
            }
            [v29 addObject:v9];
LABEL_19:

            goto LABEL_20;
          }
          v2 = v16;
          uint64_t v5 = v15;
          uint64_t v4 = v31;
          id v13 = v32;
          goto LABEL_14;
        }
        LOBYTE(v14) = 1;
LABEL_14:
        __int16 v32 = v13;

        if (v14) {
          goto LABEL_17;
        }
LABEL_20:
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v4);
  }

  return v29;
}

- (id)getLastBatteryEntry
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F929E0] entryKeyForOperatorName:@"PLBatteryAgent" withType:*MEMORY[0x1E4F92D28] withName:@"Battery"];
  uint64_t v4 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  uint64_t v5 = [v4 storage];
  uint64_t v6 = [v5 lastEntryForKey:v3];

  if (v6)
  {
    id v7 = [v6 objectForKeyedSubscript:@"DesignCapacity"];
    [v7 doubleValue];
    double v9 = v8;

    uint64_t v10 = [v6 objectForKeyedSubscript:@"Voltage"];
    [v10 doubleValue];
    double v12 = v11 / 1000.0;
  }
  else
  {
    double v12 = 0.0;
    double v9 = 0.0;
  }
  v17[0] = @"DesignCapacity";
  id v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9];
  v17[1] = @"Voltage";
  v18[0] = v13;
  int v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:v12];
  v18[1] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v15;
}

- (BOOL)gizmoConnectedInRange:(_PLTimeIntervalRange)a3
{
  double location = a3.location;
  double v5 = a3.location + a3.length;
  uint64_t v6 = [MEMORY[0x1E4F929E0] entryKeyForOperatorName:@"PLIdentityServicesAgent" withType:*MEMORY[0x1E4F92D30] withName:@"LocalLinkType"];
  id v7 = [NSString stringWithFormat:@"select * from %@ where linkType=1 and timestamp>=%f and timestamp<=%f limit 1", v6, *(void *)&location, *(void *)&v5];
  double v8 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  double v9 = [v8 storage];
  uint64_t v10 = [v9 entriesForKey:v6 withQuery:v7];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__gizmoConnectedInRange___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (gizmoConnectedInRange__defaultOnce != -1) {
      dispatch_once(&gizmoConnectedInRange__defaultOnce, block);
    }
    if (gizmoConnectedInRange__classDebugEnabled)
    {
      double v12 = [NSString stringWithFormat:@"Query Result %@", v10];
      id v13 = (void *)MEMORY[0x1E4F929B8];
      int v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown+Utilities.m"];
      uint64_t v15 = [v14 lastPathComponent];
      uint64_t v16 = [NSString stringWithUTF8String:"-[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) gizmoConnectedInRange:]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:493];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  BOOL v18 = v10 && [v10 count];

  return v18;
}

uint64_t __76__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__gizmoConnectedInRange___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  gizmoConnectedInRange__classDebugEnabled = result;
  return result;
}

- (BOOL)hasHomeKitEvents
{
  uint64_t v3 = [MEMORY[0x1E4F929E0] entryKeyForOperatorName:@"PLHomeKitAgent" withType:*MEMORY[0x1E4F92D48] withName:@"HomeKitEvents"];
  uint64_t v4 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  double v5 = [v4 storage];
  BOOL v6 = [v5 countOfEntriesForKey:v3] > 0;

  return v6;
}

- (id)getRootNodeBundleIDs
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F4012898];
}

- (id)getNonAppBundleIDs
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F40128B0];
}

- (id)getExchangeBundleIDs
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F40128C8];
}

- (id)getBundleIDToReplacementBundleIDMap
{
  v152[171] = *MEMORY[0x1E4F143B8];
  v10[0] = @"IMRemoteURLConn";
  v10[1] = @"IMRemoteURLConne";
  v152[0] = @"com.apple.MobileSMS";
  v152[1] = @"com.apple.MobileSMS";
  v10[2] = @"com.apple.mobilesms.notification";
  v10[3] = @"GenerativePlaygroundApp.MessagesExtension";
  v152[2] = @"com.apple.MobileSMS";
  v152[3] = @"com.apple.MobileSMS";
  v10[4] = @"com.apple.GenerativePlaygroundApp.MessagesExtension";
  v10[5] = @"mstreamd";
  v152[4] = @"com.apple.MobileSMS";
  v152[5] = @"com.apple.mobileslideshow";
  v10[6] = @"mediastream.mstreamd";
  v10[7] = @"assetsd";
  v152[6] = @"com.apple.mobileslideshow";
  v152[7] = @"com.apple.mobileslideshow";
  v10[8] = @"cloudphotod";
  v10[9] = @"com.apple.mobileslideshow.Discretionary";
  v152[8] = @"com.apple.mobileslideshow";
  v152[9] = @"com.apple.mobileslideshow";
  v10[10] = @"com.apple.icloud-container.com.apple.photos.cloud";
  v10[11] = @"com.apple.photoanalysisd";
  v152[10] = @"com.apple.mobileslideshow";
  v152[11] = @"com.apple.mobileslideshow";
  v10[12] = @"com.apple.photoanalysisd.backgroundanalysis";
  v10[13] = @"com.apple.photos.cloud";
  v152[12] = @"com.apple.mobileslideshow";
  v152[13] = @"com.apple.mobileslideshow";
  v10[14] = @"WirelessRadioManager";
  v10[15] = @"WirelessRadioManagerd";
  v152[14] = @"com.apple.mobilephone";
  v152[15] = @"com.apple.mobilephone";
  v10[16] = @"WirelessRadioMa";
  v10[17] = @"vmd";
  v152[16] = @"com.apple.mobilephone";
  v152[17] = @"com.apple.mobilephone";
  v10[18] = @"ipTelephony";
  v10[19] = @"ContactsUI.MonogramPosterExtension";
  v152[18] = @"com.apple.mobilephone";
  v152[19] = @"com.apple.mobilephone";
  v10[20] = @"com.apple.ContactsUI.MonogramPosterExtension";
  v10[21] = @"com.apple.MailCompositionService";
  v152[20] = @"com.apple.mobilephone";
  v152[21] = @"com.apple.mobilemail";
  v10[22] = @"MailCompositionService";
  v10[23] = @"suggestd";
  v152[22] = @"com.apple.mobilemail";
  v152[23] = @"com.apple.mobilemail";
  v10[24] = @"email.maild";
  v10[25] = @"com.apple.email.maild";
  v152[24] = @"com.apple.mobilemail";
  v152[25] = @"com.apple.mobilemail";
  v10[26] = @"maild";
  v10[27] = @"com.apple.springboard.lockscreen.navigation";
  v152[26] = @"com.apple.mobilemail";
  v152[27] = @"com.apple.Maps";
  uint64_t v2 = *MEMORY[0x1E4F625C0];
  v10[28] = @"com.apple.Siri";
  uint64_t v11 = v2;
  v152[28] = @"Siri";
  v152[29] = @"Siri";
  double v12 = @"assistantd";
  id v13 = @"com.apple.WebKit.Networking";
  v152[30] = @"Siri";
  v152[31] = @"com.apple.mobilesafari";
  int v14 = @"com.apple.WebKit.WebContent";
  uint64_t v15 = @"com.apple.WebKit";
  v152[32] = @"com.apple.mobilesafari";
  v152[33] = @"com.apple.mobilesafari";
  uint64_t v16 = @"com.apple.WebKi";
  uint64_t v17 = @"com.apple.SafariViewService";
  v152[34] = @"com.apple.mobilesafari";
  v152[35] = @"com.apple.mobilesafari";
  BOOL v18 = @"safarifetcherd";
  id v19 = @"com.apple.WebKit.WebContent.CaptivePortal";
  v152[36] = @"com.apple.mobilesafari";
  v152[37] = @"com.apple.mobilesafari";
  uint64_t v20 = @"com.apple.WebKit.WebContent.Development";
  int v21 = @"com.apple.WebKit.GPU";
  v152[38] = @"com.apple.mobilesafari";
  v152[39] = @"com.apple.mobilesafari";
  uint64_t v22 = @"com.apple.WebKit.GPU.Development";
  double v23 = @"com.apple.PassKitCore";
  v152[40] = @"com.apple.mobilesafari";
  v152[41] = @"com.apple.Passbook";
  uint64_t v24 = @"passd";
  uint64_t v25 = @"PassbookUIService";
  v152[42] = @"com.apple.Passbook";
  v152[43] = @"com.apple.Passbook";
  uint64_t v26 = @"com.apple.PassbookUIService";
  long long v27 = @"com.apple.calendar";
  v152[44] = @"com.apple.Passbook";
  v152[45] = @"com.apple.mobilecal";
  uint64_t v3 = *MEMORY[0x1E4FA6F40];
  long long v28 = @"calaccessd";
  uint64_t v29 = v3;
  v152[46] = @"com.apple.mobilecal";
  v152[47] = @"HLS";
  uint64_t v4 = *MEMORY[0x1E4FA6F30];
  uint64_t v30 = *MEMORY[0x1E4FA6F68];
  uint64_t v31 = v4;
  v152[48] = @"HLS";
  v152[49] = @"HLS";
  uint64_t v5 = *MEMORY[0x1E4F625B0];
  uint64_t v32 = *MEMORY[0x1E4FA6F78];
  v152[50] = @"HLS";
  v152[51] = @"HLS";
  objc_msgSend(NSString, "stringWithFormat:", @"%@.%@", v5, @"aod", @"IMRemoteURLConn", @"IMRemoteURLConne", @"com.apple.mobilesms.notification", @"GenerativePlaygroundApp.MessagesExtension", @"com.apple.GenerativePlaygroundApp.MessagesExtension", @"mstreamd", @"mediastream.mstreamd", @"assetsd", @"cloudphotod", @"com.apple.mobileslideshow.Discretionary", @"com.apple.icloud-container.com.apple.photos.cloud", @"com.apple.photoanalysisd", @"com.apple.photoanalysisd.backgroundanalysis", @"com.apple.photos.cloud",
    @"WirelessRadioManager",
    @"WirelessRadioManagerd",
    @"WirelessRadioMa",
    @"vmd",
    @"ipTelephony",
    @"ContactsUI.MonogramPosterExtension",
    @"com.apple.ContactsUI.MonogramPosterExtension",
    @"com.apple.MailCompositionService",
    @"MailCompositionService",
    @"suggestd",
    @"email.maild",
    @"com.apple.email.maild",
    @"maild",
    @"com.apple.springboard.lockscreen.navigation",
    @"com.apple.Siri",
    v11,
    @"assistantd",
    @"com.apple.WebKit.Networking",
    @"com.apple.WebKit.WebContent",
    @"com.apple.WebKit",
    @"com.apple.WebKi",
    @"com.apple.SafariViewService",
    @"safarifetcherd",
    @"com.apple.WebKit.WebContent.CaptivePortal",
    @"com.apple.WebKit.WebContent.Development",
    @"com.apple.WebKit.GPU",
    @"com.apple.WebKit.GPU.Development",
    @"com.apple.PassKitCore",
    @"passd",
    @"PassbookUIService",
    @"com.apple.PassbookUIService",
    @"com.apple.calendar",
    @"calaccessd",
    v29,
    v30,
    v31,
    v32,
  BOOL v6 = v5);
  uint64_t v7 = *MEMORY[0x1E4F625A8];
  int v33 = v6;
  uint64_t v34 = v7;
  v152[52] = @"HLS";
  v152[53] = @"HLS";
  uint64_t v35 = *MEMORY[0x1E4F625B8];
  long long v36 = @"LockScreen";
  v152[54] = @"HLS";
  v152[55] = @"HLS";
  long long v37 = @"com.apple.PosterBoard";
  uint64_t v38 = @"PosterBoard";
  v152[56] = @"HLS";
  v152[57] = @"HLS";
  uint64_t v39 = @"com.apple.MobileBackup.framework";
  double v40 = @"backupd";
  v152[58] = @"Backup";
  v152[59] = @"Backup";
  int v41 = @"com.apple.backupd";
  double v42 = @"softwareupdateservicesd";
  v152[60] = @"Backup";
  v152[61] = @"Backup";
  uint64_t v43 = @"mobile.softwareupdated";
  v44 = @"com.apple.Restore";
  v152[62] = @"Backup";
  v152[63] = @"com.apple.AppStore";
  v45 = @"com.apple.atc";
  v152[64] = @"com.apple.AppStore";
  id v46 = @"installd";
  v152[65] = @"com.apple.AppStore";
  uint64_t v47 = @"com.apple.StreamingUnzipService";
  v152[66] = @"com.apple.AppStore";
  long long v48 = @"containermanagerd";
  v152[67] = @"com.apple.AppStore";
  long long v49 = @"appstored";
  v152[68] = @"com.apple.AppStore";
  long long v50 = @"OOS";
  v152[69] = @"PoorCellCondition";
  long long v51 = @"healthd";
  v152[70] = @"com.apple.Health";
  v52 = @"com.apple.healthappd";
  v152[71] = @"com.apple.Health";
  v53 = @"misd";
  v152[72] = @"Hotspot";
  v54 = @"RadarComposeUIService";
  v152[73] = @"com.apple.ist.radar";
  v55 = @"remindd";
  v152[74] = @"com.apple.reminders";
  uint64_t v56 = @"homed";
  v152[75] = @"HomeKit";
  v57 = @"com.apple.private.alloy.willow";
  v152[76] = @"HomeKit";
  uint64_t v58 = @"atc";
  v152[77] = @"com.apple.Music";
  uint64_t v59 = @"siriactionsd";
  v152[78] = @"com.apple.shortcuts";
  v60 = @"com.apple.WorkflowKit.BackgroundShortcutRunner";
  v152[79] = @"com.apple.shortcuts";
  v61 = @"weatherd";
  v152[80] = @"com.apple.weather";
  v62 = @"synapse.contentlinkingd";
  v152[81] = @"com.apple.mobilenotes";
  long long v63 = @"com.apple.sportsd";
  v152[82] = @"com.apple.tv";
  long long v64 = @"sportsd";
  v152[83] = @"com.apple.tv";
  long long v65 = @"com.apple.continuitycaptured";
  v152[84] = @"com.apple.sidecar.extension.capture";
  long long v66 = @"com.apple.ContinuityCaptureShieldUI";
  v152[85] = @"com.apple.sidecar.extension.capture";
  long long v67 = @"com.apple.ScreenContinuityShell";
  v152[86] = @"ScreenContinuityShell";
  long long v68 = @"GenerativePlaygroundApp";
  v152[87] = @"com.apple.GenerativePlaygroundApp";
  long long v69 = @"eventkitsyncd";
  v152[88] = @"com.apple.mobilecal";
  long long v70 = @"companioncamerad";
  v152[89] = @"com.apple.camera";
  long long v71 = @"nanomailbootstrapd";
  v152[90] = @"com.apple.mobilemail";
  long long v72 = @"nanomapscd";
  v152[91] = @"com.apple.Maps";
  uint64_t v73 = @"companionmessagesd";
  v152[92] = @"com.apple.MobileSMS";
  v74 = @"NPKCompanionAgent";
  v152[93] = @"com.apple.Passbook";
  int v75 = @"tursd";
  v152[94] = @"com.apple.mobilephone";
  uint64_t v76 = @"nptocompaniond";
  v152[95] = @"com.apple.mobileslideshow";
  v77 = @"remotemediaservicesd";
  v152[96] = @"com.apple.RemoteMediaServices";
  v78 = @"companionfindlocallyd";
  v152[97] = @"com.apple.companionfindlocallyd";
  v79 = @"pairedunlockd";
  v152[98] = @"com.apple.pairedunlockd";
  v80 = @"nanoweatherprefsd";
  v152[99] = @"com.apple.weather";
  v81 = @"com.apple.ess";
  v152[100] = @"com.apple.mobilephone";
  v82 = @"com.apple.madrid";
  v152[101] = @"com.apple.MobileSMS";
  v83 = @"com.apple.private.alloy.accountssync";
  v152[102] = @"accountsd";
  v84 = @"com.apple.private.alloy.addressbooksync";
  v152[103] = @"addressbooksyncd";
  v85 = @"com.apple.private.alloy.appregistrysync";
  v152[104] = @"nanoappregistryd";
  v86 = @"com.apple.private.alloy.audiocontrol.bridge";
  v152[105] = @"com.apple.Bridge";
  v87 = @"com.apple.private.alloy.audiocontrol.music";
  v152[106] = @"com.apple.Music";
  v88 = @"com.apple.private.alloy.bluetoothregistry";
  v152[107] = @"nanoregistryd";
  v89 = @"com.apple.private.alloy.bulletindistributor.settings";
  v152[108] = @"bulletindistributord";
  v90 = @"com.apple.private.alloy.bulletindistributor";
  v152[109] = @"bulletindistributord";
  v91 = @"com.apple.private.alloy.callhistorysync";
  v152[110] = @"CallHistorySyncHelper";
  v92 = @"com.apple.private.alloy.camera.proxy";
  v152[111] = @"com.apple.camera";
  v93 = @"com.apple.private.alloy.continuity.activity";
  v152[112] = @"sharingd";
  v94 = @"com.apple.private.alloy.continuity.auth";
  v152[113] = @"sharingd";
  v95 = @"com.apple.private.alloy.continuity.encryption";
  v152[114] = @"sharingd";
  v96 = @"com.apple.private.alloy.continuity.tethering";
  v152[115] = @"sharingd";
  v97 = @"com.apple.private.alloy.coreduet";
  v152[116] = @"coreduetd";
  v98 = @"com.apple.private.alloy.eventkitsync";
  v152[117] = @"com.apple.mobilecal";
  v99 = @"com.apple.private.alloy.fignero";
  v152[118] = @"mediaserverd";
  v100 = @"com.apple.private.alloy.findmylocaldevice";
  v152[119] = @"com.apple.companionfindlocallyd";
  v101 = @"com.apple.private.alloy.fmf";
  v152[120] = @"fmfd";
  v102 = @"com.apple.private.alloy.health.general";
  v152[121] = @"com.apple.Health";
  v103 = @"com.apple.private.alloy.health.sync";
  v152[122] = @"com.apple.Health";
  v104 = @"com.apple.private.alloy.icloudpairing";
  v152[123] = @"bluetoothd";
  v105 = @"com.apple.private.alloy.idscredentials";
  v152[124] = @"IDSCredentialsAgent";
  v106 = @"com.apple.private.alloy.idsremoteurlconnection";
  v152[125] = @"IDSRemoteURLConnectionAgent";
  v107 = @"com.apple.private.alloy.idstransfers";
  v152[126] = @"IMTransferAgent";
  v108 = @"com.apple.private.alloy.iosdiagnostics";
  v152[127] = @"Diagnostics";
  v109 = @"com.apple.private.alloy.location.auth";
  v152[128] = @"locationd";
  v110 = @"com.apple.private.alloy.location.motion";
  v152[129] = @"locationd";
  v111 = @"com.apple.private.alloy.location.usage";
  v152[130] = @"locationd";
  v112 = @"com.apple.private.alloy.location.wifitilesync";
  v152[131] = @"locationd";
  v113 = @"com.apple.private.alloy.mail.fetches";
  v152[132] = @"com.apple.mobilemail";
  v114 = @"com.apple.private.alloy.mail.sync.accounts";
  v152[133] = @"com.apple.mobilemail";
  v115 = @"com.apple.private.alloy.mail.sync.content";
  v152[134] = @"com.apple.mobilemail";
  v116 = @"com.apple.private.alloy.mail.sync.messages";
  v152[135] = @"com.apple.mobilemail";
  v117 = @"com.apple.private.alloy.maps.proxy";
  v152[136] = @"com.apple.Maps";
  v118 = @"com.apple.private.alloy.maps.sync";
  v152[137] = @"com.apple.Maps";
  v119 = @"com.apple.private.alloy.maps";
  v152[138] = @"com.apple.Maps";
  v120 = @"com.apple.private.alloy.messages";
  v152[139] = @"com.apple.MobileSMS";
  v121 = @"com.apple.private.alloy.nsurlsessionproxy";
  v152[140] = @"sharingd";
  v122 = @"com.apple.private.alloy.otaupdate";
  v152[141] = @"Restore";
  v123 = @"com.apple.private.alloy.pairedunlock";
  v152[142] = @"com.apple.pairedunlockd";
  v124 = @"com.apple.private.alloy.passbook.general";
  v152[143] = @"com.apple.Passbook";
  v125 = @"com.apple.private.alloy.passbook.maintenance";
  v152[144] = @"com.apple.Passbook";
  v126 = @"com.apple.private.alloy.passbook.provisioning";
  v152[145] = @"com.apple.Passbook";
  v127 = @"com.apple.private.alloy.passbook.relevancy";
  v152[146] = @"com.apple.Passbook";
  v128 = @"com.apple.private.alloy.passbook.remoteadmin";
  v152[147] = @"com.apple.Passbook";
  v129 = @"com.apple.private.alloy.pbbridge";
  v152[148] = @"com.apple.Bridge";
  v130 = @"com.apple.private.alloy.phonecontinuity";
  v152[149] = @"com.apple.mobilephone";
  v131 = @"com.apple.private.alloy.photos.proxy";
  v152[150] = @"com.apple.mobileslideshow";
  v132 = @"com.apple.private.alloy.photostream";
  v152[151] = @"com.apple.mobileslideshow";
  v133 = @"com.apple.private.alloy.preferencessync";
  v152[152] = @"nanoprefsyncd";
  v134 = @"com.apple.private.alloy.proxiedcrashcopier";
  v152[153] = @"ProxiedCrashCopier";
  v135 = @"com.apple.private.alloy.pushproxy";
  v152[154] = @"apsd";
  v136 = @"com.apple.private.alloy.remotemediaservices";
  v152[155] = @"com.apple.RemoteMediaServices";
  v137 = @"com.apple.private.alloy.resourcegrabber";
  v152[156] = @"resourcegrabberd";
  v138 = @"com.apple.private.alloy.screenshotter";
  v152[157] = @"screenshotsyncd";
  v139 = @"com.apple.private.alloy.siri.device";
  v152[158] = @"Siri";
  v140 = @"com.apple.private.alloy.siri.location";
  v152[159] = @"Siri";
  v141 = @"com.apple.private.alloy.siri.proxy";
  v152[160] = @"Siri";
  v142 = @"com.apple.private.alloy.sms";
  v152[161] = @"com.apple.MobileSMS";
  v143 = @"com.apple.private.alloy.sockpuppet";
  v152[162] = @"companionappd";
  v144 = @"com.apple.private.alloy.systemsettings";
  v152[163] = @"nanosystemsettingsd";
  v145 = @"com.apple.private.alloy.telephonyutilitiestemporary";
  v152[164] = @"com.apple.mobilephone";
  v146 = @"com.apple.private.alloy.timesync";
  v152[165] = @"timed";
  v147 = @"com.apple.private.alloy.timezonesync";
  v152[166] = @"tzd";
  v148 = @"com.apple.private.alloy.utilitybelt";
  v152[167] = @"com.apple.Bridge";
  v149 = @"com.apple.private.alloy.voicemailsync";
  v152[168] = @"com.apple.mobilephone";
  v150 = @"com.apple.private.alloy.wifi.networksync";
  v152[169] = @"wifid";
  v151 = @"com.apple.private.alloy.continuity.notifications";
  v152[170] = @"ScreenContinuityShell";
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v152 forKeys:v10 count:171];

  return v8;
}

- (id)getBundleIDToForegroundTimeMap
{
  return &unk_1F400E890;
}

- (id)getBundleIDToBackgroundTimeMap
{
  return &unk_1F400E8B8;
}

- (id)getEnergyEntry:(id)a3 forBundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__5;
  uint64_t v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getEnergyEntry_forBundleID___block_invoke;
  v10[3] = &unk_1E6E47BF8;
  id v7 = v6;
  id v11 = v7;
  double v12 = &v13;
  [v5 enumerateObjectsUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getEnergyEntry_forBundleID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)getBundleIDsToEnergyKeyForSlopAdjustmentMap
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = [&unk_1F40128E0 objectAtIndexedSubscript:58];
  [v2 setObject:v3 forKeyedSubscript:@"EN"];

  uint64_t v4 = [&unk_1F40128F8 objectAtIndexedSubscript:59];
  [v2 setObject:v4 forKeyedSubscript:@"com.apple.findmy"];

  if ([MEMORY[0x1E4F92A38] hasAOD]) {
    [v2 setObject:@"AlwaysOnEnergy" forKeyedSubscript:@"HLS"];
  }
  return v2;
}

- (id)dependencies
{
  return 0;
}

- (void)configure:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"timestamp"];
  [v5 doubleValue];
  double v7 = v6;

  int v8 = [v4 objectForKeyedSubscript:@"start"];
  [v8 doubleValue];
  double v10 = v9;

  id v11 = [v4 objectForKeyedSubscript:@"end"];
  [v11 doubleValue];
  double v13 = v12;

  int v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v10];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setStart:v14];

  uint64_t v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v13];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setEnd:v15];

  uint64_t v16 = [v4 objectForKeyedSubscript:@"bucket"];

  [v16 doubleValue];
  -[PLBatteryUIResponseTypeBatteryBreakdown setBucketSize:](self, "setBucketSize:");

  uint64_t v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v7];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setMonotonicNow:v17];

  id v18 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self getNodeIDToNodeNameMap];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setNodeIDsToNodeNames:v18];

  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setHasHomeKit:[(PLBatteryUIResponseTypeBatteryBreakdown *)self hasHomeKitEvents]];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setIsSlopAdjustmentEnabled:1];
  id v19 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self getLastBatteryEntry];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setLastBatteryEntry:v19];

  uint64_t v20 = [MEMORY[0x1E4F929C0] objectForKey:@"LastUpgradeTimestamp" forApplicationID:@"com.apple.powerlogd" synchronize:1];
  [v20 doubleValue];
  -[PLBatteryUIResponseTypeBatteryBreakdown setLastUpgradeTimestamp:](self, "setLastUpgradeTimestamp:");

  [(PLBatteryUIResponseTypeBatteryBreakdown *)self buildUtilityCache];
  int v21 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self start];
  uint64_t v22 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self end];
  [v21 timeIntervalSince1970];
  double v24 = v23;
  [v22 timeIntervalSince1970];
  double v26 = v25 - v24;

  long long v27 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self monotonicNow];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self getDataRange:v27];
  double v29 = v28;
  double v31 = v30;

  -[PLBatteryUIResponseTypeBatteryBreakdown generateRange:withDataRange:](self, "generateRange:withDataRange:", v24 + -1800.0, v26 + 1800.0, v29, v31);
  double v33 = v32;
  double v35 = v34;
  -[PLBatteryUIResponseTypeBatteryBreakdown setGizmoConnected:](self, "setGizmoConnected:", -[PLBatteryUIResponseTypeBatteryBreakdown gizmoConnectedInRange:](self, "gizmoConnectedInRange:"));
  -[PLBatteryUIResponseTypeBatteryBreakdown getDataDurationFromRange:](self, "getDataDurationFromRange:", v33, v35);
  -[PLBatteryUIResponseTypeBatteryBreakdown setDataDuration:](self, "setDataDuration:");
  -[PLBatteryUIResponseTypeBatteryBreakdown buildBucketsForRange:](self, "buildBucketsForRange:", v33, v35);
}

- (void)coalesce
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self buckets];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(PLBatteryUIResponseTypeBatteryBreakdown *)self getStaticData];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self buckets];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          [(PLBatteryUIResponseTypeBatteryBreakdown *)self populateEnergyBucketKeysWithEntries:v10];
          [(PLBatteryUIResponseTypeBatteryBreakdown *)self populateInternalRootNodeEnergyKeys:v10];
          [(PLBatteryUIResponseTypeBatteryBreakdown *)self populateBLDKeysWithEnergyEntries:v10];
          [(PLBatteryUIResponseTypeBatteryBreakdown *)self applyStaticNameTransformation:v10];
          [(PLBatteryUIResponseTypeBatteryBreakdown *)self adjustExtensionBackgroundTimeWithEnergyEntries:v10];
          [(PLBatteryUIResponseTypeBatteryBreakdown *)self applyDynamicNameTransformation:v10];
          [(PLBatteryUIResponseTypeBatteryBreakdown *)self adjustRuntimes:v10];
          [(PLBatteryUIResponseTypeBatteryBreakdown *)self applyDisplayNameTransformation:v10];
          [(PLBatteryUIResponseTypeBatteryBreakdown *)self addEntryTypes:v10];
          [(PLBatteryUIResponseTypeBatteryBreakdown *)self filterEnergyEntries:v10];
          [(PLBatteryUIResponseTypeBatteryBreakdown *)self filterEnergyEntriesWithRuntimes:v10];
          [(PLBatteryUIResponseTypeBatteryBreakdown *)self addTotalEnergy:v10];
          [(PLBatteryUIResponseTypeBatteryBreakdown *)self addTotals:v10];
          [(PLBatteryUIResponseTypeBatteryBreakdown *)self adjustEnergyValues:v10];
          [(PLBatteryUIResponseTypeBatteryBreakdown *)self addQualifiers:v10];
          [(PLBatteryUIResponseTypeBatteryBreakdown *)self addErrorCode:v10];
          [(PLBatteryUIResponseTypeBatteryBreakdown *)self cleanEntries:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (id)result
{
  v11[2] = *MEMORY[0x1E4F143B8];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setBundleIDsToDisplayNames:0];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setDeletedAppBundleIDs:0];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setDeletedAppClipBundleIDs:0];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setPluginBundleIDsToEntries:0];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setWebAppBundleIDs:0];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setRootNodeBundleIDs:0];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setNonAppBundleIDs:0];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setExchangeBundleIDs:0];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setBundleIDsToReplacementBundleIDs:0];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setBundleIDsToForegroundTimes:0];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setBundleIDsToBackgroundTimes:0];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setRootNodeIDToRootNodeEnergyKeys:0];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setIntermediateRootNodes:0];
  v10[0] = @"PLBatteryUIBreakdownKey";
  uint64_t v3 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self buckets];
  uint64_t v4 = [v3 reverseObjectEnumerator];
  id v5 = [v4 allObjects];
  v10[1] = @"PLBatteryUIDataDurationKey";
  v11[0] = v5;
  uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self dataDuration];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  v11[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (_PLTimeIntervalRange)generateRange:(_PLTimeIntervalRange)result withDataRange:(_PLTimeIntervalRange)a4
{
  if (a4.location == 0.0 && a4.length == 0.0)
  {
    double location = result.location;
    goto LABEL_21;
  }
  double v5 = result.location + result.length;
  if (result.location < a4.location)
  {
    BOOL v6 = v5 == a4.location;
    BOOL v7 = v5 < a4.location;
  }
  else
  {
    BOOL v6 = 1;
    BOOL v7 = 0;
  }
  if (!v7 && !v6)
  {
    double v8 = a4.location + a4.length;
LABEL_14:
    if (result.location >= a4.location) {
      double location = result.location;
    }
    else {
      double location = a4.location;
    }
    if (v5 >= v8) {
      double v9 = v8;
    }
    else {
      double v9 = v5;
    }
    result.double length = v9 - location;
    goto LABEL_21;
  }
  double v8 = a4.location + a4.length;
  if (a4.location < result.location && v8 > result.location) {
    goto LABEL_14;
  }
  double location = 0.0;
  if (result.location != a4.location || result.length <= 0.0)
  {
    result.double length = 0.0;
    goto LABEL_21;
  }
  result.double length = 0.0;
  if (a4.length > 0.0) {
    goto LABEL_14;
  }
LABEL_21:
  double v10 = location;
  result.double location = v10;
  return result;
}

- (void)addTotalEnergy:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        double v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
        [v10 doubleValue];
        double v8 = v8 + v11;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
    double v12 = v8 * 100.0;
  }
  else
  {
    double v12 = 0.0;
  }

  +[PLUtilities defaultBatteryEnergyCapacity];
  long long v14 = objc_msgSend(NSString, "stringWithFormat:", @"%.00f%% of Battery", v12 / v13);
  [v3 setObject:v14 forKeyedSubscript:@"PLBatteryUIBatteryCyclesKey"];
}

- (BOOL)filterFgBg:(id)a3 filterArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
  double v8 = [v5 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
  [v8 doubleValue];
  double v10 = v9;

  double v11 = [v5 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
  [v11 doubleValue];
  double v13 = v12;

  long long v14 = [v5 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];
  [v14 doubleValue];
  double v16 = v15;

  BOOL v17 = 0;
  if (v16 <= 0.0 && v10 == 0.0 && v13 < 60.0)
  {
    if ([v7 isEqualToString:@"com.apple.findmy"])
    {
      long long v18 = [&unk_1F4013F48 objectAtIndexedSubscript:59];
      id v19 = [v5 objectForKeyedSubscript:v18];
      [v19 doubleValue];
      double v21 = v20;

      if (v21 > 0.0)
      {
        uint64_t v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          +[PLBatteryUIResponseTypeUtilities energyEntryHasNegligibleEnergyDrain:filterArray:](v22, v23, v24, v25, v26, v27, v28, v29);
        }

        [v6 addObject:v5];
      }
    }
    BOOL v17 = 1;
  }

  return v17;
}

- (id)getRootNodeEntriesInRange:(_PLTimeIntervalRange)a3 withTimeInterval:(double)a4
{
  double length = a3.length;
  double location = a3.location;
  double v8 = [MEMORY[0x1E4F92968] entryKeyForType:*MEMORY[0x1E4F92D20] andName:*MEMORY[0x1E4F92B48]];
  double v9 = -[PLBatteryUIResponseTypeBatteryBreakdown getNodeEntriesForEntryKey:withRange:andTimeInterval:](self, "getNodeEntriesForEntryKey:withRange:andTimeInterval:", v8, location, length, a4);

  return v9;
}

- (id)getQualificationNodeEntriesInRange:(_PLTimeIntervalRange)a3 withTimeInterval:(double)a4
{
  double length = a3.length;
  double location = a3.location;
  double v8 = [MEMORY[0x1E4F92968] entryKeyForType:*MEMORY[0x1E4F92D20] andName:*MEMORY[0x1E4F92B20]];
  double v9 = -[PLBatteryUIResponseTypeBatteryBreakdown getNodeEntriesForEntryKey:withRange:andTimeInterval:](self, "getNodeEntriesForEntryKey:withRange:andTimeInterval:", v8, location, length, a4);

  return v9;
}

- (void)getStaticData
{
  id v3 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self rootNodeBundleIDs];

  if (!v3)
  {
    uint64_t v4 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self getRootNodeBundleIDs];
    [(PLBatteryUIResponseTypeBatteryBreakdown *)self setRootNodeBundleIDs:v4];
  }
  id v5 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self nonAppBundleIDs];

  if (!v5)
  {
    id v6 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self getNonAppBundleIDs];
    [(PLBatteryUIResponseTypeBatteryBreakdown *)self setNonAppBundleIDs:v6];
  }
  uint64_t v7 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self exchangeBundleIDs];

  if (!v7)
  {
    double v8 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self getExchangeBundleIDs];
    [(PLBatteryUIResponseTypeBatteryBreakdown *)self setExchangeBundleIDs:v8];
  }
  double v9 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToReplacementBundleIDs];

  if (!v9)
  {
    double v10 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self getBundleIDToReplacementBundleIDMap];
    [(PLBatteryUIResponseTypeBatteryBreakdown *)self setBundleIDsToReplacementBundleIDs:v10];
  }
  double v11 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToForegroundTimes];

  if (!v11)
  {
    double v12 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self getBundleIDToForegroundTimeMap];
    [(PLBatteryUIResponseTypeBatteryBreakdown *)self setBundleIDsToForegroundTimes:v12];
  }
  double v13 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToBackgroundTimes];

  if (!v13)
  {
    long long v14 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self getBundleIDToBackgroundTimeMap];
    [(PLBatteryUIResponseTypeBatteryBreakdown *)self setBundleIDsToBackgroundTimes:v14];
  }
  double v15 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToEnergyKeyForSlopAdjustment];

  if (!v15)
  {
    double v16 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self getBundleIDsToEnergyKeyForSlopAdjustmentMap];
    [(PLBatteryUIResponseTypeBatteryBreakdown *)self setBundleIDsToEnergyKeyForSlopAdjustment:v16];
  }
  BOOL v17 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self rootNodeIDToRootNodeEnergyKeys];

  if (!v17)
  {
    long long v18 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self getRootNodeIDToRootNodeEnergyKeys];
    [(PLBatteryUIResponseTypeBatteryBreakdown *)self setRootNodeIDToRootNodeEnergyKeys:v18];
  }
  id v19 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self intermediateRootNodes];

  if (!v19)
  {
    id v20 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self getIntermediateRootNodes];
    [(PLBatteryUIResponseTypeBatteryBreakdown *)self setIntermediateRootNodes:v20];
  }
}

- (void)addEntryTypes:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self rootNodeBundleIDs];

  if (v5)
  {
    id v6 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self nonAppBundleIDs];

    if (v6)
    {
      uint64_t v7 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self webAppBundleIDs];

      if (v7)
      {
        double v8 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToDisplayNames];

        if (v8)
        {
          [v4 setObject:&unk_1F400D7E0 forKeyedSubscript:@"PLBatteryUITotalAccountedEnergyKey"];
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id obj = [v4 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
          uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v33 = *(void *)v35;
            do
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v35 != v33) {
                  objc_enumerationMutation(obj);
                }
                double v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                double v13 = (void *)MEMORY[0x1E4F28ED0];
                long long v14 = [v4 objectForKeyedSubscript:@"PLBatteryUITotalAccountedEnergyKey"];
                [v14 doubleValue];
                double v16 = v15;
                uint64_t v17 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
                [(id)v17 doubleValue];
                id v19 = [v13 numberWithDouble:v16 + v18];
                [v4 setObject:v19 forKeyedSubscript:@"PLBatteryUITotalAccountedEnergyKey"];

                id v20 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self rootNodeBundleIDs];
                double v21 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                LOBYTE(v17) = [v20 containsObject:v21];

                uint64_t v22 = &unk_1F400D7F8;
                if ((v17 & 1) == 0)
                {
                  uint64_t v23 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self nonAppBundleIDs];
                  uint64_t v24 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                  char v25 = [v23 containsObject:v24];

                  uint64_t v22 = &unk_1F400D810;
                  if ((v25 & 1) == 0)
                  {
                    uint64_t v26 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self webAppBundleIDs];
                    uint64_t v27 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                    char v28 = [v26 containsObject:v27];

                    uint64_t v22 = &unk_1F400D828;
                    if ((v28 & 1) == 0)
                    {
                      uint64_t v29 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToDisplayNames];
                      double v30 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                      double v31 = [v29 objectForKeyedSubscript:v30];

                      if (v31) {
                        uint64_t v22 = &unk_1F400D7E0;
                      }
                      else {
                        uint64_t v22 = &unk_1F400D840;
                      }
                    }
                  }
                }
                [v12 setObject:v22 forKeyedSubscript:@"PLBatteryUIAppTypeKey"];
              }
              uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
            }
            while (v10);
          }
        }
        else
        {
          id obj = PLLogCommon();
          if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG)) {
            -[PLBatteryUIResponseTypeBatteryBreakdown addEntryTypes:].cold.4();
          }
        }
      }
      else
      {
        id obj = PLLogCommon();
        if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG)) {
          -[PLBatteryUIResponseTypeBatteryBreakdown addEntryTypes:]();
        }
      }
    }
    else
    {
      id obj = PLLogCommon();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIResponseTypeBatteryBreakdown addEntryTypes:]();
      }
    }
  }
  else
  {
    id obj = PLLogCommon();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeBatteryBreakdown addEntryTypes:]();
    }
  }
}

- (void)addQualifiers:(id)a3
{
  uint64_t v237 = *MEMORY[0x1E4F143B8];
  long long v224 = 0u;
  long long v225 = 0u;
  long long v226 = 0u;
  long long v227 = 0u;
  id v209 = a3;
  id obj = [v209 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  uint64_t v4 = [obj countByEnumeratingWithState:&v224 objects:v236 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v225;
    unint64_t v7 = 0x1E4F1C000uLL;
    double v8 = 0.33;
    v210 = self;
    uint64_t v211 = *(void *)v225;
    do
    {
      uint64_t v9 = 0;
      uint64_t v212 = v5;
      do
      {
        if (*(void *)v225 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v224 + 1) + 8 * v9);
        v221 = [*(id *)(v7 + 2632) array];
        double v11 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        double v12 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppEnergyUsedKey"];
        [v12 doubleValue];
        double v14 = v13;

        double v15 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
        [v15 doubleValue];
        double v17 = v16;

        if (v17 >= 1.0
          || [v11 isEqualToString:@"com.apple.NanoUniverse.AegirProxyApp"])
        {
          double v18 = v8;
          id v19 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
          [v19 doubleValue];
          double v21 = v20;

          uint64_t v22 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
          [v22 doubleValue];
          double v24 = v23;

          char v25 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];
          [v25 doubleValue];
          double v27 = v26;

          char v28 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundPluggedInRuntimeKey"];
          [v28 doubleValue];
          double v30 = v29;

          [(PLBatteryUIResponseTypeBatteryBreakdown *)self bgLocationAudioTimeRuntimes:v10 bundleID:v11];
          double v219 = v24;
          double v31 = v21 + v24;
          double v32 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeOriginalKey"];
          [v32 doubleValue];
          double v34 = v33;

          long long v35 = PLLogCommon();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218240;
            double v229 = v34;
            __int16 v230 = 2048;
            double v231 = v31;
            _os_log_debug_impl(&dword_1E4220000, v35, OS_LOG_TYPE_DEBUG, "adding AlwaysOnTimeInSecs=%f to totalRuntime=%f for AppQualifierPluggedIn calculation", buf, 0x16u);
          }

          [(PLBatteryUIResponseTypeBatteryBreakdown *)self bucketSize];
          double v37 = v36;
          [MEMORY[0x1E4F92A10] defaultBatteryEnergyCapacity];
          BOOL v39 = v38 <= 0.0 || v14 / v38 <= dbl_1E44045A0[v37 > 3600.0];
          double v40 = v31 + v34;
          if (v40 > 0.0)
          {
            double v41 = v27 + v30;
            if (v41 / v40 >= 0.8 && v39)
            {
              uint64_t v43 = PLLogCommon();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218240;
                double v229 = v41;
                __int16 v230 = 2048;
                double v231 = v40;
                _os_log_debug_impl(&dword_1E4220000, v43, OS_LOG_TYPE_DEBUG, "adding AppQualifierPluggedIn pluggedInSecs=%f, totalRuntime=%f", buf, 0x16u);
              }

              [v221 addObject:&unk_1F400D858];
            }
          }
          if (v14 == 0.0)
          {
            [v10 setObject:&unk_1F400D7E0 forKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];
            [v10 setObject:v221 forKeyedSubscript:@"PLBatteryUIAppQualifiersKey"];
            double v8 = v18;
          }
          else
          {
            v44 = [&unk_1F4013F60 objectAtIndexedSubscript:1];
            v45 = [v10 objectForKeyedSubscript:v44];
            [v45 doubleValue];
            double v47 = v46;

            double v48 = v47 / v14;
            double v8 = v18;
            if (v47 / v14 > v18
              && -[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](self, "canSetQualifier:forBundleID:", 1, v11, v48))
            {
              [v221 addObject:&unk_1F400D870];
            }
            long long v49 = objc_msgSend(&unk_1F4013F78, "objectAtIndexedSubscript:", 2, v48);
            long long v50 = [v10 objectForKeyedSubscript:v49];
            [v50 doubleValue];
            double v52 = v51;

            double v53 = v14 - v52;
            double v54 = v53 / v14;
            if (v53 / v14 > 0.5
              && [(PLBatteryUIResponseTypeBatteryBreakdown *)self canSetQualifier:2 forBundleID:v11])
            {
              int v55 = [MEMORY[0x1E4F929C0] debugEnabled];
              if (v21 < 300.0 || (double v56 = v21 / v219, v21 / v219 < v18))
              {
                if (v55)
                {
                  uint64_t v68 = objc_opt_class();
                  v222[0] = MEMORY[0x1E4F143A8];
                  v222[1] = 3221225472;
                  v222[2] = __57__PLBatteryUIResponseTypeBatteryBreakdown_addQualifiers___block_invoke_360;
                  v222[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                  v222[4] = v68;
                  long long v69 = v222;
                  if (addQualifiers__defaultOnce_358 != -1) {
                    dispatch_once(&addQualifiers__defaultOnce_358, v69);
                  }

                  if (addQualifiers__classDebugEnabled_359)
                  {
                    long long v70 = NSString;
                    long long v71 = [MEMORY[0x1E4F28ED0] numberWithDouble:v21];
                    long long v72 = [MEMORY[0x1E4F28ED0] numberWithDouble:v219];
                    uint64_t v73 = [v70 stringWithFormat:@"BGQualifier: Removing qualifier based on BGTime %@, FGTime %@", v71, v72];

                    v74 = (void *)MEMORY[0x1E4F929B8];
                    int v75 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown.m"];
                    uint64_t v76 = [v75 lastPathComponent];
                    v77 = [NSString stringWithUTF8String:"-[PLBatteryUIResponseTypeBatteryBreakdown addQualifiers:]"];
                    [v74 logMessage:v73 fromFile:v76 fromFunction:v77 fromLineNumber:435];

                    v78 = PLLogCommon();
                    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      double v229 = *(double *)&v73;
                      _os_log_debug_impl(&dword_1E4220000, v78, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }
                  }
                }
              }
              else
              {
                if (v55)
                {
                  uint64_t v57 = objc_opt_class();
                  v223[0] = MEMORY[0x1E4F143A8];
                  v223[1] = 3221225472;
                  v223[2] = __57__PLBatteryUIResponseTypeBatteryBreakdown_addQualifiers___block_invoke;
                  v223[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                  v223[4] = v57;
                  uint64_t v58 = v223;
                  if (addQualifiers__defaultOnce != -1) {
                    dispatch_once(&addQualifiers__defaultOnce, v58);
                  }

                  if (addQualifiers__classDebugEnabled)
                  {
                    uint64_t v59 = NSString;
                    v60 = [MEMORY[0x1E4F28ED0] numberWithDouble:v21];
                    v61 = [MEMORY[0x1E4F28ED0] numberWithDouble:v219];
                    v62 = [v59 stringWithFormat:@"BGQualifier: Adding qualifier based on BGTime %@, FGTime %@", v60, v61];

                    long long v63 = (void *)MEMORY[0x1E4F929B8];
                    long long v64 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown.m"];
                    long long v65 = [v64 lastPathComponent];
                    long long v66 = [NSString stringWithUTF8String:"-[PLBatteryUIResponseTypeBatteryBreakdown addQualifiers:]"];
                    [v63 logMessage:v62 fromFile:v65 fromFunction:v66 fromLineNumber:432];

                    long long v67 = PLLogCommon();
                    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      double v229 = *(double *)&v62;
                      _os_log_debug_impl(&dword_1E4220000, v67, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }
                  }
                }
                objc_msgSend(v221, "addObject:", &unk_1F400D888, v56);
              }
            }
            if ([v11 isEqualToString:@"com.apple.findmy"])
            {
              v79 = [&unk_1F4013F90 objectAtIndexedSubscript:59];
              v80 = [v10 objectForKeyedSubscript:v79];
              [v80 doubleValue];
              double v82 = v81;

              if (v82 / v14 > v18 && (objc_msgSend(v221, "containsObject:", &unk_1F400D888, v82 / v14) & 1) == 0) {
                [v221 addObject:&unk_1F400D888];
              }
              v83 = PLLogCommon();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                double v229 = *(double *)&v221;
                _os_log_debug_impl(&dword_1E4220000, v83, OS_LOG_TYPE_DEBUG, "IT Qualifier: %@", buf, 0xCu);
              }
            }
            uint64_t v216 = v9;
            v84 = [&unk_1F4013FA8 objectAtIndexedSubscript:48];
            v85 = [v10 objectForKeyedSubscript:v84];
            [v85 doubleValue];
            double v87 = v86;

            v88 = [&unk_1F4013FC0 objectAtIndexedSubscript:12];
            v89 = [v10 objectForKeyedSubscript:v88];
            [v89 doubleValue];
            double v91 = v87 + v90;

            v92 = [&unk_1F4013FD8 objectAtIndexedSubscript:13];
            v93 = [v10 objectForKeyedSubscript:v92];
            [v93 doubleValue];
            double v95 = v91 + v94;

            v96 = NSString;
            v97 = [&unk_1F4013FF0 objectAtIndexedSubscript:15];
            v98 = [&unk_1F4014008 objectAtIndexedSubscript:2];
            [v96 stringWithFormat:@"%@-%@", v97, v98];
            uint64_t v99 = v218 = v11;

            v100 = NSString;
            v101 = [&unk_1F4014020 objectAtIndexedSubscript:15];
            v102 = [&unk_1F4014038 objectAtIndexedSubscript:7];
            uint64_t v103 = [v100 stringWithFormat:@"%@-%@", v101, v102];

            v104 = NSString;
            v105 = [&unk_1F4014050 objectAtIndexedSubscript:15];
            v106 = [&unk_1F4014068 objectAtIndexedSubscript:9];
            uint64_t v107 = [v104 stringWithFormat:@"%@-%@", v105, v106];

            v108 = NSString;
            v109 = [&unk_1F4014080 objectAtIndexedSubscript:15];
            v110 = [&unk_1F4014098 objectAtIndexedSubscript:52];
            uint64_t v111 = [v108 stringWithFormat:@"%@-%@", v109, v110];

            v112 = NSString;
            v113 = [&unk_1F40140B0 objectAtIndexedSubscript:15];
            v114 = [&unk_1F40140C8 objectAtIndexedSubscript:54];
            v115 = [v112 stringWithFormat:@"%@-%@", v113, v114];

            v220 = (void *)v99;
            uint64_t v116 = v99;
            double v11 = v218;
            v117 = [v10 objectForKeyedSubscript:v116];
            [v117 doubleValue];
            double v119 = v95 + v118;

            v217 = (void *)v103;
            v120 = [v10 objectForKeyedSubscript:v103];
            [v120 doubleValue];
            double v122 = v119 + v121;

            v215 = (void *)v107;
            v123 = [v10 objectForKeyedSubscript:v107];
            [v123 doubleValue];
            double v125 = v122 + v124;

            v214 = (void *)v111;
            v126 = [v10 objectForKeyedSubscript:v111];
            [v126 doubleValue];
            double v128 = v125 + v127;

            v129 = [v10 objectForKeyedSubscript:v115];
            [v129 doubleValue];
            double v131 = v128 + v130;

            v132 = PLLogCommon();
            if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              double v229 = *(double *)&v218;
              __int16 v230 = 2048;
              double v231 = v131;
              _os_log_debug_impl(&dword_1E4220000, v132, OS_LOG_TYPE_DEBUG, "%@ locEnergy: %.3f", buf, 0x16u);
            }

            double v133 = v131 / v14;
            uint64_t v9 = v216;
            if (v131 / v14 > v18
              && -[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 3, v218, v133))
            {
              v134 = [&unk_1F40140E0 objectAtIndexedSubscript:15];
              v135 = [v10 objectForKeyedSubscript:v134];
              [v135 doubleValue];
              double v137 = v136;

              v138 = PLLogCommon();
              if (os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                double v229 = *(double *)&v218;
                __int16 v230 = 2048;
                double v231 = v137;
                _os_log_debug_impl(&dword_1E4220000, v138, OS_LOG_TYPE_DEBUG, "%@ bgLocEnergy: %.3f", buf, 0x16u);
              }

              double v139 = v137 / v53;
              v140 = &unk_1F400D8B8;
              if (v137 / v53 > v18)
              {
                int v141 = objc_msgSend(v221, "containsObject:", &unk_1F400D888, v139);
                v140 = &unk_1F400D8B8;
                if (v141)
                {
                  [v221 removeObject:&unk_1F400D888];
                  v140 = &unk_1F400D8A0;
                }
              }
              objc_msgSend(v221, "addObject:", v140, v139);
            }
            v142 = objc_msgSend(&unk_1F40140F8, "objectAtIndexedSubscript:", 17, v133);
            v143 = [v10 objectForKeyedSubscript:v142];
            [v143 doubleValue];
            double v145 = v144;

            double v146 = v145 + 0.0;
            v147 = [v10 objectForKeyedSubscript:@"NotificationInfo"];

            if (v147)
            {
              v148 = [v10 objectForKeyedSubscript:@"NotificationInfo"];
              [v148 notificationEnergy];
              double v146 = v146 + v149;
            }
            v150 = PLLogCommon();
            if (os_log_type_enabled(v150, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              double v229 = v146;
              _os_log_debug_impl(&dword_1E4220000, v150, OS_LOG_TYPE_DEBUG, "Notification energy: %.3f", buf, 0xCu);
            }

            if (v146 > 0.0
              && [(PLBatteryUIResponseTypeBatteryBreakdown *)v210 canSetQualifier:9 forBundleID:v218])
            {
              +[PLUtilities defaultBatteryEnergyCapacity];
              double v152 = v146 * 100.0 / v151;
              v153 = PLLogCommon();
              if (os_log_type_enabled(v153, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                double v229 = *(double *)&v218;
                __int16 v230 = 2048;
                double v231 = v146;
                __int16 v232 = 2048;
                double v233 = v152;
                _os_log_debug_impl(&dword_1E4220000, v153, OS_LOG_TYPE_DEBUG, "%@, energy: %.3f, batteryPercent %.3f", buf, 0x20u);
              }

              double v154 = v146 / v14;
              if (v146 / v14 > v8 || (double v154 = 1.0, v152 > 1.0)) {
                objc_msgSend(v221, "addObject:", &unk_1F400D8D0, v154);
              }
            }
            v155 = [&unk_1F4014110 objectAtIndexedSubscript:3];
            v156 = [v10 objectForKeyedSubscript:v155];
            [v156 doubleValue];
            double v158 = v157;

            double v159 = v158 / v14;
            if (v158 / v14 > v8
              && -[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 4, v218, v159))
            {
              [v221 addObject:&unk_1F400D8E8];
            }
            v160 = objc_msgSend(&unk_1F4014128, "objectAtIndexedSubscript:", 4, v159);
            v161 = [v10 objectForKeyedSubscript:v160];
            [v161 doubleValue];
            double v163 = v162;

            double v164 = v163 / v14;
            if (v163 / v14 > v8
              && -[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 5, v218, v164))
            {
              [v221 addObject:&unk_1F400D900];
            }
            v165 = objc_msgSend(&unk_1F4014140, "objectAtIndexedSubscript:", 14, v164);
            v166 = [v10 objectForKeyedSubscript:v165];
            [v166 doubleValue];
            double v168 = v167;

            v169 = [&unk_1F4014158 objectAtIndexedSubscript:15];
            v170 = [v10 objectForKeyedSubscript:v169];
            [v170 doubleValue];
            double v172 = v171;

            v173 = [&unk_1F4014170 objectAtIndexedSubscript:55];
            v174 = [v10 objectForKeyedSubscript:v173];
            [v174 doubleValue];
            double v176 = v175;

            if ((v168 + v172 + v176) / v14 > v8
              && [(PLBatteryUIResponseTypeBatteryBreakdown *)v210 canSetQualifier:7 forBundleID:v218])
            {
              [v221 addObject:&unk_1F400D918];
            }
            v177 = [v10 objectForKeyedSubscript:@"WatchEnergy"];
            [v177 doubleValue];
            double v179 = v178;

            if ([(PLBatteryUIResponseTypeBatteryBreakdown *)v210 gizmoConnected])
            {
              double v180 = v179 / v14;
              if (v179 / v14 > v8)
              {
                if (-[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 10, v218, v180))
                {
                  [v221 addObject:&unk_1F400D930];
                }
              }
            }
            v181 = objc_msgSend(v10, "objectForKeyedSubscript:", @"PosterEnergy", v180);
            [v181 doubleValue];
            double v183 = v182;

            double v184 = v183 / v14;
            if (v183 / v14 > v8
              && -[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 14, v218, v184)|| objc_msgSend(v218, "isEqualToString:", @"com.apple.NanoUniverse.AegirProxyApp", v184))
            {
              v185 = PLLogCommon();
              if (os_log_type_enabled(v185, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138413058;
                double v229 = *(double *)&v10;
                __int16 v230 = 2048;
                double v231 = v183;
                __int16 v232 = 2048;
                double v233 = v14;
                __int16 v234 = 2112;
                v235 = v218;
                _os_log_debug_impl(&dword_1E4220000, v185, OS_LOG_TYPE_DEBUG, "Adding Poster Qualifer: energyEntry=%@, posterEnergy=%f, energy=%f, bundleID=%@", buf, 0x2Au);
              }

              [v221 addObject:&unk_1F400D948];
            }
            v186 = [v10 objectForKeyedSubscript:@"ChronoWidgetEnergy"];
            [v186 doubleValue];
            double v188 = v187;

            double v189 = v188 / v14;
            if (v188 / v14 > v8)
            {
              if (-[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 12, v218, v189))
              {
                [v221 addObject:&unk_1F400D960];
                if ([(PLBatteryUIResponseTypeBatteryBreakdown *)v210 getWidgetTypeForEnergyEntry:v10] == 2)
                {
                  if ([(PLBatteryUIResponseTypeBatteryBreakdown *)v210 canSetQualifier:16 forBundleID:v218])
                  {
                    [v221 removeObject:&unk_1F400D960];
                    [v221 addObject:&unk_1F400D978];
                  }
                }
              }
            }
            v190 = objc_msgSend(&unk_1F4014188, "objectAtIndexedSubscript:", 10, v189);
            v191 = [v10 objectForKeyedSubscript:v190];
            [v191 doubleValue];
            double v193 = v192;

            double v194 = v193 / v14;
            if (v193 / v14 > v8
              && -[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 9, v218, v194))
            {
              [v221 addObject:&unk_1F400D8D0];
            }
            v195 = objc_msgSend(v10, "objectForKeyedSubscript:", @"PLBatteryUIAppBundleIDKey", v194);
            int v196 = [v195 isEqualToString:@"com.apple.Home"];

            if (v196)
            {
              v198 = [v10 objectForKeyedSubscript:@"HomeKitEnergy"];
              [v198 doubleValue];
              double v200 = v199;

              double v197 = v200 / v14;
              if (v200 / v14 > v8)
              {
                if (-[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 13, v218, v197))
                {
                  [v221 addObject:&unk_1F400D990];
                }
              }
            }
            v201 = -[PLBatteryUIResponseTypeBatteryBreakdown combineQualifiers:](v210, "combineQualifiers:", v221, v197);
            if ([v221 containsObject:&unk_1F400D918])
            {
              int v202 = [v221 containsObject:&unk_1F400D888];
              if (v54 > 0.5 && v202 && ([v201 containsObject:&unk_1F400D858] & 1) == 0)
              {
                uint64_t v203 = [v201 arrayByAddingObject:&unk_1F400D888];

                v201 = (void *)v203;
              }
            }
            v204 = [MEMORY[0x1E4F1CA48] array];
            if ([v201 containsObject:&unk_1F400D858]) {
              [v204 addObject:&unk_1F400D858];
            }
            if ([v201 count])
            {
              unint64_t v205 = 0;
              do
              {
                v206 = [v201 objectAtIndexedSubscript:v205];
                int v207 = [v206 intValue];

                if (v207 != 11)
                {
                  v208 = [v201 objectAtIndexedSubscript:v205];
                  [v204 addObject:v208];
                }
                if ([v204 count] == 2) {
                  break;
                }
                ++v205;
              }
              while ([v201 count] > v205);
            }
            [v10 setObject:v204 forKeyedSubscript:@"PLBatteryUIAppQualifiersKey"];

            self = v210;
            uint64_t v6 = v211;
            uint64_t v5 = v212;
            unint64_t v7 = 0x1E4F1C000;
          }
        }

        ++v9;
      }
      while (v9 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v224 objects:v236 count:16];
    }
    while (v5);
  }
}

uint64_t __57__PLBatteryUIResponseTypeBatteryBreakdown_addQualifiers___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  addQualifiers__classDebugEnabled = result;
  return result;
}

uint64_t __57__PLBatteryUIResponseTypeBatteryBreakdown_addQualifiers___block_invoke_360(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  addQualifiers__classDebugEnabled_359 = result;
  return result;
}

- (void)applyStaticNameTransformation:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToReplacementBundleIDs];

  if (!v5)
  {
    long long v63 = PLLogCommon();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeBatteryBreakdown applyStaticNameTransformation:]();
    }
    goto LABEL_50;
  }
  uint64_t v6 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToDisplayNames];

  if (!v6)
  {
    long long v63 = PLLogCommon();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeBatteryBreakdown addEntryTypes:].cold.4();
    }
LABEL_50:

    goto LABEL_51;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v64 = v4;
  id obj = [v4 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  uint64_t v7 = [obj countByEnumeratingWithState:&v69 objects:v79 count:16];
  if (!v7) {
    goto LABEL_45;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v70;
  uint64_t v66 = *MEMORY[0x1E4F625B0];
  unint64_t v10 = 0x1E4F28000uLL;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v70 != v9) {
        objc_enumerationMutation(obj);
      }
      double v12 = *(void **)(*((void *)&v69 + 1) + 8 * i);
      double v13 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
      uint64_t v68 = v13;
      if ([v13 isEqualToString:@"com.apple.springboard.lockscreen.navigation"])
      {
        double v14 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
        double v15 = *(void **)(v10 + 3792);
        [v14 doubleValue];
        double v17 = [v15 numberWithDouble:-v16];
        [v12 setObject:v17 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];

LABEL_10:
        goto LABEL_34;
      }
      if ([v13 isEqualToString:@"com.apple.PassbookUIService"])
      {
        [v12 setObject:&unk_1F4012118 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
      }
      else if (_os_feature_enabled_impl())
      {
        double v18 = [NSString stringWithFormat:@"%@.%@", v66, @"aod"];
        int v19 = [v13 isEqualToString:v18];

        if (v19)
        {
          double v20 = PLLogCommon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            double v74 = *(double *)&v13;
            __int16 v75 = 2112;
            double v76 = *(double *)&v12;
            _os_log_debug_impl(&dword_1E4220000, v20, OS_LOG_TYPE_DEBUG, "processing aod entry with bundleID=%@, energyEntry=%@", buf, 0x16u);
          }

          double v21 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
          [v12 setObject:v21 forKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];

          uint64_t v22 = *(void **)(v10 + 3792);
          double v23 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];
          [v23 doubleValue];
          double v24 = objc_msgSend(v22, "numberWithDouble:");
          [v12 setObject:v24 forKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeOriginalKey"];

          char v25 = *(void **)(v10 + 3792);
          double v26 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
          [v26 doubleValue];
          double v27 = objc_msgSend(v25, "numberWithDouble:");
          [v12 setObject:v27 forKeyedSubscript:@"AlwaysOnEnergyBeforeClamp"];

          [v12 setObject:&unk_1F4012118 forKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
          char v28 = PLLogCommon();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            long long v65 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];
            uint64_t v59 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];
            *(_DWORD *)buf = 138412802;
            double v74 = *(double *)&v65;
            __int16 v75 = 2112;
            double v76 = *(double *)&v59;
            v60 = (void *)v59;
            __int16 v77 = 2112;
            uint64_t v78 = (uint64_t)v13;
            _os_log_debug_impl(&dword_1E4220000, v28, OS_LOG_TYPE_DEBUG, "Subtracting foregroundPluggedInTime=%@ from alwaysOnRuntime=%@ for bundleID=%@", buf, 0x20u);
          }
          double v29 = *(void **)(v10 + 3792);
          double v30 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];
          [v30 doubleValue];
          double v32 = v31;
          double v33 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];
          [v33 doubleValue];
          double v35 = v32 - v34;

          if (v35 >= 0.0) {
            double v36 = v35;
          }
          else {
            double v36 = 0.0;
          }
          double v37 = [v29 numberWithDouble:v36];
          [v12 setObject:v37 forKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];

          double v38 = PLLogCommon();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            v61 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];
            v62 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeOriginalKey"];
            *(_DWORD *)buf = 138412546;
            double v74 = *(double *)&v61;
            __int16 v75 = 2112;
            double v76 = *(double *)&v62;
            _os_log_debug_impl(&dword_1E4220000, v38, OS_LOG_TYPE_DEBUG, "After subtracting plugged in time, alwaysOnRuntime=%@, alwaysOnRuntimeOriginal=%@", buf, 0x16u);
          }
          BOOL v39 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
          [v39 doubleValue];
          double v41 = v40;

          double v42 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];
          [v42 doubleValue];
          double v44 = v43 / 3600.0;

          v45 = PLLogCommon();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218496;
            double v74 = v41;
            __int16 v75 = 2048;
            double v76 = v44;
            __int16 v77 = 2048;
            uint64_t v78 = 0x4075E00000000000;
            _os_log_debug_impl(&dword_1E4220000, v45, OS_LOG_TYPE_DEBUG, "AODEnergy=%f, AODUnpluggedTime=%f, kAODModeledPowerUpperBound=%f", buf, 0x20u);
          }

          double v13 = v68;
          if (v44 > 0.0)
          {
            double v46 = v41 / v44;
            if (v41 / v44 > 350.0)
            {
              double v47 = PLLogCommon();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
                -[PLBatteryUIResponseTypeBatteryBreakdown applyStaticNameTransformation:].cold.4();
              }

              double v48 = [*(id *)(v10 + 3792) numberWithDouble:v44 * 350.0];
              [v12 setObject:v48 forKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];

              long long v49 = PLLogCommon();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
                -[PLBatteryUIResponseTypeBatteryBreakdown applyStaticNameTransformation:]();
              }
            }
          }
          double v14 = objc_msgSend(v12, "objectForKeyedSubscript:", @"PLBatteryUIAppEnergyValueKey", v46);
          [v12 setObject:v14 forKeyedSubscript:@"AlwaysOnEnergy"];
          goto LABEL_10;
        }
      }
LABEL_34:
      long long v50 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToReplacementBundleIDs];
      double v51 = [v50 objectForKeyedSubscript:v13];

      if (v51)
      {
        double v52 = PLLogCommon();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v58 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          *(_DWORD *)buf = 138412546;
          double v74 = *(double *)&v58;
          __int16 v75 = 2112;
          double v76 = *(double *)&v51;
          _os_log_debug_impl(&dword_1E4220000, v52, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);
        }
        [v12 setObject:v51 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
      }
      if ([(PLBatteryUIResponseTypeBatteryBreakdown *)self hasHomeKit])
      {
        double v53 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        int v54 = [v53 isEqualToString:@"HomeKit"];

        if (v54)
        {
          int v55 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToDisplayNames];
          double v56 = [v55 objectForKeyedSubscript:@"com.apple.Home"];

          if (v56) {
            [v12 setObject:@"com.apple.Home" forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          }
          uint64_t v57 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
          [v12 setObject:v57 forKeyedSubscript:@"HomeKitEnergy"];

          unint64_t v10 = 0x1E4F28000;
        }
      }
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v69 objects:v79 count:16];
  }
  while (v8);
LABEL_45:

  id v4 = v64;
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self collapseEnergyEntries:v64];
LABEL_51:
}

- (void)applyDynamicNameTransformation:(id)a3
{
  id v10 = a3;
  id v4 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self transformDeletedApps:v4];

  uint64_t v5 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self transformPlugins:v5 withBucket:v10];

  uint64_t v6 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self transformGizmoDaemons:v6];

  uint64_t v7 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self reaccountExchangeEntries:v7];

  uint64_t v8 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self reaccountBackupRestore:v8];

  if (_os_feature_enabled_impl())
  {
    uint64_t v9 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
    [(PLBatteryUIResponseTypeBatteryBreakdown *)self ongoingUpdateRestoreTransformations:v9];
  }
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self collapseEnergyEntries:v10];
}

- (void)applyDisplayNameTransformation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToDisplayNames];

  if (v5)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = [v4 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
    uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v16 = v4;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          double v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"PLBatteryUIAppBundleIDKey", v16);
          double v12 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToDisplayNames];
          double v13 = [v12 objectForKeyedSubscript:v11];
          if (v13)
          {
            double v14 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToDisplayNames];
            double v15 = [v14 objectForKeyedSubscript:v11];
            [v10 setObject:v15 forKeyedSubscript:@"PLBatteryUIAppNameKey"];
          }
          else
          {
            [v10 setObject:v11 forKeyedSubscript:@"PLBatteryUIAppNameKey"];
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
      id v4 = v16;
    }
  }
  else
  {
    id obj = PLLogCommon();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeBatteryBreakdown addEntryTypes:].cold.4();
    }
  }
}

- (void)filterEnergyEntries:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = objc_msgSend(v3, "objectForKeyedSubscript:", @"PLBatteryUIAppArrayKey", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v11 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppTypeKey"];
        int v12 = [v11 intValue];

        if (v12 != 2 && v12 != 5) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [v3 setObject:v4 forKeyedSubscript:@"PLBatteryUIAppArrayKey"];
}

- (void)filterEnergyEntriesWithRuntimes:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  double v40 = v3;
  id obj = [v3 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  uint64_t v5 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v44;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v44 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v43 + 1) + 8 * v8);
        id v10 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        double v11 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppTypeKey"];
        if ([v11 intValue] == 1)
        {

LABEL_9:
          if (([v10 isEqualToString:@"HLS"] & 1) != 0
            || ([v10 isEqualToString:@"Siri"] & 1) != 0
            || ([v10 isEqualToString:@"DeletedApp"] & 1) != 0
            || ([v10 isEqualToString:@"DeletedAppClip"] & 1) != 0
            || [v10 isEqualToString:@"DeletedAppAndAppClip"])
          {
            double v13 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
            [v13 doubleValue];
            double v15 = v14;

            if (v15 < 60.0)
            {
              long long v16 = @"PLBatteryUIAppForegroundRuntimeKey";
              if (v15 > 0.0) {
                goto LABEL_16;
              }
            }
          }
          else
          {
            if ([v10 isEqualToString:@"Flashlight"])
            {
              double v29 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
              [v29 doubleValue];
              double v31 = v30;

              if (v31 >= 60.0) {
                goto LABEL_17;
              }
              BOOL v32 = v31 <= 0.0;
            }
            else
            {
              if (![v10 isEqualToString:@"com.apple.NanoUniverse.AegirProxyApp"]) {
                goto LABEL_17;
              }
              double v33 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
              [v33 doubleValue];
              double v35 = v34;

              double v36 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
              [v36 doubleValue];
              double v38 = v37;

              if (v35 >= 60.0) {
                goto LABEL_17;
              }
              BOOL v32 = v38 <= 2.0;
            }
            long long v16 = @"PLBatteryUIAppBackgroundRuntimeKey";
            if (!v32) {
              goto LABEL_16;
            }
          }
LABEL_17:
          objc_msgSend(v4, "addObject:", v9, v16);
          goto LABEL_18;
        }
        char v12 = [v10 isEqualToString:@"com.apple.NanoUniverse.AegirProxyApp"];

        if (v12) {
          goto LABEL_9;
        }
        long long v17 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
        [v17 doubleValue];
        double v19 = v18;

        if (![(PLBatteryUIResponseTypeBatteryBreakdown *)self filterFgBg:v9 filterArray:v4])
        {
          if (v19 > 0.0 && v19 < 60.0)
          {
            long long v21 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];
            [v21 doubleValue];
            double v23 = v22;

            double v24 = [MEMORY[0x1E4F28ED0] numberWithDouble:60.0 / v19 * v23];
            [v9 setObject:v24 forKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];

            [v9 setObject:&unk_1F400D9A8 forKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
          }
          char v25 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];
          [v25 doubleValue];
          double v27 = v26;

          BOOL v28 = v27 > 0.0 && v27 < 60.0;
          long long v16 = @"PLBatteryUIAppAlwaysOnRuntimeKey";
          if (!v28) {
            goto LABEL_17;
          }
LABEL_16:
          objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1F400D9A8);
          goto LABEL_17;
        }
LABEL_18:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v39 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      uint64_t v6 = v39;
    }
    while (v39);
  }

  [v40 setObject:v4 forKeyedSubscript:@"PLBatteryUIAppArrayKey"];
}

- (void)adjustEnergyValues:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLBatteryUIResponseTypeBatteryBreakdown *)self isSlopAdjustmentEnabled]) {
    [(PLBatteryUIResponseTypeBatteryBreakdown *)self applySlopAdjustment:v4];
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = [v4 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v5)
  {
    uint64_t v7 = 0;
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  int v8 = 0;
  uint64_t v41 = *(void *)v43;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v43 != v41) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      double v11 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
      [v11 doubleValue];
      double v13 = v12;

      double v14 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppEnergyToRemoveForPercentageAdjustmentKey"];
      [v14 doubleValue];
      double v16 = v13 - v15;

      double v17 = 0.0;
      if (v16 >= 0.0) {
        double v18 = v16;
      }
      else {
        double v18 = 0.0;
      }
      double v19 = [v4 objectForKeyedSubscript:@"PLBatteryUITotalEnergyKey"];
      [v19 doubleValue];
      double v21 = v20;
      double v22 = [v4 objectForKeyedSubscript:@"PLBatteryUITotalEnergyToRemoveForPercentageAdjustmentKey"];
      [v22 doubleValue];
      double v24 = v23;

      if (v13 > 2.0)
      {
        double v25 = v21 - v24;
        if (v21 - v24 < 0.0) {
          double v25 = 0.0;
        }
        double v17 = round(v18 * 100.0 / v25);
      }
      double v26 = [MEMORY[0x1E4F28ED0] numberWithDouble:v13];
      [v10 setObject:v26 forKeyedSubscript:@"PLBatteryUIAppEnergyUsedKey"];

      double v27 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)v17];
      [v10 setObject:v27 forKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];

      BOOL v28 = [v7 objectForKeyedSubscript:@"PLBatteryUIAppEnergyUsedKey"];
      [v28 doubleValue];
      double v30 = v29;
      double v31 = [v7 objectForKeyedSubscript:@"PLBatteryUIAppEnergyToRemoveForPercentageAdjustmentKey"];
      [v31 doubleValue];
      double v33 = v32;

      if (!v7) {
        goto LABEL_19;
      }
      double v34 = v30 - v33;
      if (v30 - v33 < 0.0) {
        double v34 = 0.0;
      }
      if (v34 < v18)
      {
LABEL_19:
        id v35 = v10;

        uint64_t v7 = v35;
      }
      v8 += (int)v17;
    }
    uint64_t v6 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  }
  while (v6);

  if (v8 >= 1 && v8 != 100)
  {
    double v36 = (void *)MEMORY[0x1E4F28ED0];
    double v37 = [v7 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
    [v37 doubleValue];
    uint64_t v39 = [v36 numberWithDouble:v38 + (double)(100 - v8)];
    [v7 setObject:v39 forKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];

    if (v8 >= 0x65)
    {
      id obj = PLLogCommon();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
        -[PLBatteryUIResponseTypeBatteryBreakdown adjustEnergyValues:](v8, obj);
      }
      goto LABEL_28;
    }
  }
LABEL_29:
}

- (void)applySlopAdjustment:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"PLBatteryUITotalEnergyKey"];
  [v5 doubleValue];
  double v7 = v6;

  double v40 = v4;
  int v8 = [v4 objectForKeyedSubscript:@"PLBatteryUITotalAccountedEnergyKey"];
  [v8 doubleValue];
  double v10 = v9;

  double v11 = PLLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeBatteryBreakdown applySlopAdjustment:]();
  }

  if (v10 > 0.0 && v7 <= v10)
  {
    double v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:v7 / v10];
    [v4 setObject:v14 forKeyedSubscript:@"PLBatteryUIExternalDrainRatio"];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = [v4 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
    uint64_t v15 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v15)
    {
      uint64_t v17 = v15;
      uint64_t v18 = *(void *)v42;
      double v19 = 0.0;
      *(void *)&long long v16 = 138412802;
      long long v38 = v16;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v42 != v18) {
            objc_enumerationMutation(obj);
          }
          double v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          double v22 = objc_msgSend(v21, "objectForKeyedSubscript:", @"PLBatteryUIAppBundleIDKey", v38);
          double v23 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToEnergyKeyForSlopAdjustment];
          double v24 = [v21 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          double v25 = [v23 objectForKey:v24];

          if (v25)
          {
            double v26 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToEnergyKeyForSlopAdjustment];
            double v27 = [v26 objectForKeyedSubscript:v22];

            [(PLBatteryUIResponseTypeBatteryBreakdown *)self getEnergyToRemoveForSlopAdjustment:v21 withEnergyKey:v27 forBucket:v40];
            double v29 = v28;
            double v30 = PLLogCommon();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v38;
              long long v46 = v22;
              __int16 v47 = 2112;
              uint64_t v48 = v27;
              __int16 v49 = 2048;
              double v50 = v29;
              _os_log_debug_impl(&dword_1E4220000, v30, OS_LOG_TYPE_DEBUG, "bundleIDKey=%@, energyKey=%@, energyToRemove=%f", buf, 0x20u);
            }
            double v19 = v19 + v29;
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
      }
      while (v17);
    }

    double v13 = PLLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeBatteryBreakdown applySlopAdjustment:](v13, v31, v32, v33, v34, v35, v36, v37);
    }
  }
  else
  {
    double v13 = PLLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PLBatteryUIResponseTypeBatteryBreakdown applySlopAdjustment:]();
    }
  }
}

- (double)getEnergyToRemoveForSlopAdjustment:(id)a3 withEnergyKey:(id)a4 forBucket:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToEnergyKeyForSlopAdjustment];
  double v12 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
  uint64_t v13 = [v11 objectForKey:v12];
  if (v13)
  {
    double v14 = (void *)v13;
    uint64_t v15 = [v8 objectForKeyedSubscript:v9];
    [v15 doubleValue];
    double v17 = v16;

    if (v17 > 0.0)
    {
      uint64_t v18 = [v8 objectForKeyedSubscript:v9];
      [v18 doubleValue];
      double v20 = v19;

      double v21 = [v10 objectForKeyedSubscript:@"PLBatteryUIExternalDrainRatio"];
      [v21 doubleValue];
      double v23 = v22;

      if (v20 - v20 * v23 >= 0.0) {
        double v24 = v20 - v20 * v23;
      }
      else {
        double v24 = 0.0;
      }
      double v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        int v32 = 134218752;
        double v33 = v20;
        __int16 v34 = 2048;
        double v35 = v23;
        __int16 v36 = 2048;
        double v37 = v20 * v23;
        __int16 v38 = 2048;
        double v39 = v24;
        _os_log_debug_impl(&dword_1E4220000, v25, OS_LOG_TYPE_DEBUG, "energyToAdjust=%f, adjustmentFactor=%f, adjustedEnergy=%f, energyToRemove=%f", (uint8_t *)&v32, 0x2Au);
      }

      double v26 = [MEMORY[0x1E4F28ED0] numberWithDouble:v24];
      [v8 setObject:v26 forKeyedSubscript:@"PLBatteryUIAppEnergyToRemoveForPercentageAdjustmentKey"];

      double v27 = (void *)MEMORY[0x1E4F28ED0];
      double v28 = [v10 objectForKeyedSubscript:@"PLBatteryUITotalEnergyToRemoveForPercentageAdjustmentKey"];
      [v28 doubleValue];
      double v30 = [v27 numberWithDouble:v24 + v29];
      [v10 setObject:v30 forKeyedSubscript:@"PLBatteryUITotalEnergyToRemoveForPercentageAdjustmentKey"];

      goto LABEL_12;
    }
  }
  else
  {
  }
  double v28 = PLLogCommon();
  double v24 = 0.0;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeBatteryBreakdown getEnergyToRemoveForSlopAdjustment:withEnergyKey:forBucket:](v8, (uint64_t)v9, v28);
  }
LABEL_12:

  return v24;
}

- (void)adjustRuntimes:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToForegroundTimes];

  if (v5)
  {
    double v6 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToBackgroundTimes];

    if (v6)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      double v7 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        id v22 = v4;
        uint64_t v10 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(v7);
            }
            double v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            uint64_t v13 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            if (v13)
            {
              double v14 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToForegroundTimes];
              uint64_t v15 = [v14 objectForKeyedSubscript:v13];

              if (v15)
              {
                double v16 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToForegroundTimes];
                double v17 = [v16 objectForKeyedSubscript:v13];
                [v12 setObject:v17 forKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
              }
              uint64_t v18 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToBackgroundTimes];
              double v19 = [v18 objectForKeyedSubscript:v13];

              if (v19)
              {
                double v20 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToBackgroundTimes];
                double v21 = [v20 objectForKeyedSubscript:v13];
                [v12 setObject:v21 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
              }
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v9);
        id v4 = v22;
      }
    }
    else
    {
      double v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIResponseTypeBatteryBreakdown adjustRuntimes:]();
      }
    }
  }
  else
  {
    double v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeBatteryBreakdown adjustRuntimes:]();
    }
  }
}

- (void)adjustExtensionBackgroundTimeWithEnergyEntries:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(a3, "objectForKeyedSubscript:", @"PLBatteryUIAppArrayKey", 0);
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
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = [v8 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        uint64_t v10 = v9;
        if (v9
          && (([v9 isEqualToString:@"com.apple.store.Jolly.spotlightindex"] & 1) != 0
           || [v10 isEqualToString:@"com.apple.mobilemail.DiagnosticExtension"]))
        {
          [v8 setObject:&unk_1F400D7E0 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
          [v8 setObject:&unk_1F400D7E0 forKeyedSubscript:@"PLBatteryUIAppBackgroundPluggedInRuntimeKey"];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)addTotals:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 setObject:&unk_1F400D7E0 forKeyedSubscript:@"PLBatteryUIForegroundTimeKey"];
  [v3 setObject:&unk_1F400D7E0 forKeyedSubscript:@"PLBatteryUIBackgroundTimeKey"];
  [v3 setObject:&unk_1F400D7E0 forKeyedSubscript:@"PLBatteryUITotalEnergyKey"];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [v3 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v30 = *(void *)v32;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v32 != v30) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(void **)(*((void *)&v31 + 1) + 8 * v6);
        uint64_t v8 = (void *)MEMORY[0x1E4F28ED0];
        uint64_t v9 = [v3 objectForKeyedSubscript:@"PLBatteryUIForegroundTimeKey"];
        [v9 doubleValue];
        double v11 = v10;
        long long v12 = [v7 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
        [v12 doubleValue];
        long long v14 = [v8 numberWithDouble:v11 + v13];
        [v3 setObject:v14 forKeyedSubscript:@"PLBatteryUIForegroundTimeKey"];

        uint64_t v15 = (void *)MEMORY[0x1E4F28ED0];
        uint64_t v16 = [v3 objectForKeyedSubscript:@"PLBatteryUIBackgroundTimeKey"];
        [v16 doubleValue];
        double v18 = v17;
        double v19 = [v7 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
        [v19 doubleValue];
        double v21 = [v15 numberWithDouble:v18 + v20];
        [v3 setObject:v21 forKeyedSubscript:@"PLBatteryUIBackgroundTimeKey"];

        id v22 = (void *)MEMORY[0x1E4F28ED0];
        long long v23 = [v3 objectForKeyedSubscript:@"PLBatteryUITotalEnergyKey"];
        [v23 doubleValue];
        double v25 = v24;
        long long v26 = [v7 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
        [v26 doubleValue];
        uint64_t v28 = [v22 numberWithDouble:v25 + v27];
        [v3 setObject:v28 forKeyedSubscript:@"PLBatteryUITotalEnergyKey"];

        ++v6;
      }
      while (v5 != v6);
      uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v5);
  }
}

- (void)addErrorCode:(id)a3
{
  id v14 = a3;
  BOOL v4 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self shouldShowBreakdown:v14];
  id v5 = v14;
  if (!v4)
  {
    uint64_t v6 = [v14 objectForKeyedSubscript:@"PLBatteryUIForegroundTimeKey"];
    [v6 doubleValue];
    if (v7 >= 60.0)
    {

      id v5 = v14;
    }
    else
    {
      uint64_t v8 = [v14 objectForKeyedSubscript:@"PLBatteryUIBackgroundTimeKey"];
      [v8 doubleValue];
      double v10 = v9;

      id v5 = v14;
      if (v10 < 60.0)
      {
        [v14 setObject:&unk_1F400D810 forKeyedSubscript:@"PLBatteryUIErrorCodeKey"];
        double v11 = (void *)MEMORY[0x1E4F1CBF0];
        long long v12 = @"PLBatteryUIAppArrayKey";
        double v13 = v14;
        goto LABEL_7;
      }
    }
  }
  double v11 = &unk_1F400D7E0;
  long long v12 = @"PLBatteryUIErrorCodeKey";
  double v13 = v5;
LABEL_7:
  [v13 setObject:v11 forKeyedSubscript:v12];
}

- (BOOL)shouldShowBreakdown:(id)a3
{
  id v4 = a3;
  id v5 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self lastBatteryEntry];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"DesignCapacity"];
  [v6 doubleValue];
  double v8 = v7;

  double v9 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self lastBatteryEntry];
  double v10 = [v9 objectForKeyedSubscript:@"Voltage"];
  [v10 doubleValue];
  double v12 = v11 / 1000.0;

  double v13 = [v4 objectForKeyedSubscript:@"PLBatteryUITotalEnergyKey"];

  [v13 doubleValue];
  LOBYTE(v4) = v14 > v8 * v12 * 0.001;

  return (char)v4;
}

- (void)cleanEntries:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PLBatteryUIResponseTypeBatteryBreakdown_cleanEntries___block_invoke;
  v5[3] = &unk_1E6E47D80;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __56__PLBatteryUIResponseTypeBatteryBreakdown_cleanEntries___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 removeObjectForKey:@"NotificationInfo"];
  id v3 = [v5 objectForKeyedSubscript:@"WidgetUpdateTypeToCount"];
  if ([v3 count])
  {
    id v4 = [*(id *)(a1 + 32) stringifyKeysForDict:v3];
    [v5 setObject:v4 forKeyedSubscript:@"WidgetUpdateTypeToCount"];
  }
}

- (void)collapseEnergyEntries:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [v3 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        double v11 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        if (v11)
        {
          double v12 = [v4 objectForKeyedSubscript:v11];

          if (v12)
          {
            v15[0] = MEMORY[0x1E4F143A8];
            v15[1] = 3221225472;
            v15[2] = __65__PLBatteryUIResponseTypeBatteryBreakdown_collapseEnergyEntries___block_invoke;
            void v15[3] = &unk_1E6E47BD0;
            id v16 = v4;
            id v17 = v11;
            [v10 enumerateKeysAndObjectsUsingBlock:v15];
          }
          else
          {
            [v4 setObject:v10 forKeyedSubscript:v11];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  double v13 = [v4 allValues];
  double v14 = (void *)[v13 mutableCopy];
  [v3 setObject:v14 forKeyedSubscript:@"PLBatteryUIAppArrayKey"];
}

void __65__PLBatteryUIResponseTypeBatteryBreakdown_collapseEnergyEntries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqualToString:@"NotificationInfo"])
  {
    uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"NotificationInfo"];

    id v9 = v6;
    if (!v9 || v8)
    {
      [v8 combineWith:v9];
    }
    else
    {
      double v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
      [v10 setObject:v9 forKeyedSubscript:@"NotificationInfo"];
    }
LABEL_19:

    goto LABEL_20;
  }
  if ([v5 isEqualToString:@"WidgetUpdateTypeToCount"])
  {
    double v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v8 = [v11 objectForKeyedSubscript:@"WidgetUpdateTypeToCount"];

    id v9 = v6;
    double v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __65__PLBatteryUIResponseTypeBatteryBreakdown_collapseEnergyEntries___block_invoke_cold_2();
    }

    if ([v8 count] || !objc_msgSend(v9, "count"))
    {
      double v13 = (void *)[v8 mutableCopy];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __65__PLBatteryUIResponseTypeBatteryBreakdown_collapseEnergyEntries___block_invoke_558;
      v25[3] = &unk_1E6E49F78;
      id v14 = v13;
      id v26 = v14;
      [v9 enumerateKeysAndObjectsUsingBlock:v25];
      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __65__PLBatteryUIResponseTypeBatteryBreakdown_collapseEnergyEntries___block_invoke_cold_1();
      }

      id v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
      [v16 setObject:v14 forKeyedSubscript:@"WidgetUpdateTypeToCount"];
    }
    else
    {
      id v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
      [v14 setObject:v9 forKeyedSubscript:@"WidgetUpdateTypeToCount"];
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v5 rangeOfString:@"AppTypeKey"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v17 = (void *)MEMORY[0x1E4F28ED0];
    [v6 doubleValue];
    double v19 = v18;
    long long v20 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    long long v21 = [v20 objectForKeyedSubscript:v5];
    [v21 doubleValue];
    uint64_t v23 = [v17 numberWithDouble:v19 + v22];
    double v24 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    [v24 setObject:v23 forKeyedSubscript:v5];
  }
LABEL_20:
}

void __65__PLBatteryUIResponseTypeBatteryBreakdown_collapseEnergyEntries___block_invoke_558(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  uint64_t v8 = (void *)MEMORY[0x1E4F28ED0];
  if (v7)
  {
    id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
    uint64_t v10 = objc_msgSend(v8, "numberWithInt:", objc_msgSend(v11, "intValue") + objc_msgSend(v9, "intValue"));
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v6];

    id v6 = (id)v10;
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v11, "intValue"));
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v6];
  }
}

- (id)combineQualifiers:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
    if ([v5 containsObject:&unk_1F400D888]
      && [v5 containsObject:&unk_1F400D918])
    {
      [v5 removeObject:&unk_1F400D888];
    }
    if ([v5 containsObject:&unk_1F400D888]
      && [v5 containsObject:&unk_1F400D858])
    {
      [v5 removeObject:&unk_1F400D888];
    }
    if ([v5 containsObject:&unk_1F400D8A0]
      && [v5 containsObject:&unk_1F400D858])
    {
      [v5 removeObject:&unk_1F400D8A0];
    }
    if ([v5 containsObject:&unk_1F400D888]
      && [v5 containsObject:&unk_1F400D870])
    {
      [v5 removeObject:&unk_1F400D888];
    }
    if ([v5 containsObject:&unk_1F400D918]
      && [v5 containsObject:&unk_1F400D8E8])
    {
      [v5 removeObject:&unk_1F400D918];
    }
    if ([v5 containsObject:&unk_1F400D888]
      && [v5 containsObject:&unk_1F400D900])
    {
      [v5 removeObject:&unk_1F400D888];
    }
    if ([v5 containsObject:&unk_1F400D900]
      && [v5 containsObject:&unk_1F400D8E8])
    {
      [v5 removeObject:&unk_1F400D900];
    }
    if ([v5 containsObject:&unk_1F400D888]
      && [v5 containsObject:&unk_1F400D930])
    {
      [v5 removeObject:&unk_1F400D888];
    }
    if ([v5 containsObject:&unk_1F400D888]
      && [v5 containsObject:&unk_1F400D990])
    {
      [v5 removeObject:&unk_1F400D888];
    }
    if ([v5 containsObject:&unk_1F400D888]
      && [v5 containsObject:&unk_1F400D8D0])
    {
      [v5 removeObject:&unk_1F400D888];
    }
    id v6 = [v5 allObjects];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (void)reaccountExchangeEntries:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self exchangeBundleIDs];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v40 = v4;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v54 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          double v13 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];

          if (v13)
          {
            id v14 = [v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            [v6 setObject:v12 forKeyedSubscript:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v9);
    }

    uint64_t v15 = [v6 objectForKeyedSubscript:@"com.apple.activesync"];
    id v16 = v15;
    if (v15)
    {
      id v17 = [v15 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
      [v17 doubleValue];
      double v19 = v18;

      if (v19 != 0.0)
      {
        double v39 = v16;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v50 = 0u;
        long long v49 = 0u;
        long long v20 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self exchangeBundleIDs];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v49 objects:v58 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v50;
          double v24 = 0.0;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v50 != v23) {
                objc_enumerationMutation(v20);
              }
              id v26 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v49 + 1) + 8 * j)];
              double v27 = v26;
              if (v26)
              {
                uint64_t v28 = [v26 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
                [v28 doubleValue];
                double v30 = v29;

                if (v30 >= 0.0) {
                  double v31 = v30;
                }
                else {
                  double v31 = 0.0;
                }
                double v24 = v24 + v31;
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v49 objects:v58 count:16];
          }
          while (v22);
        }
        else
        {
          double v24 = 0.0;
        }

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v32 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self exchangeBundleIDs];
        uint64_t v33 = [v32 countByEnumeratingWithState:&v45 objects:v57 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v46;
          do
          {
            for (uint64_t k = 0; k != v34; ++k)
            {
              if (*(void *)v46 != v35) {
                objc_enumerationMutation(v32);
              }
              double v37 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v45 + 1) + 8 * k)];
              __int16 v38 = v37;
              if (v37)
              {
                v41[0] = MEMORY[0x1E4F143A8];
                v41[1] = 3221225472;
                v41[2] = __68__PLBatteryUIResponseTypeBatteryBreakdown_reaccountExchangeEntries___block_invoke;
                v41[3] = &unk_1E6E47B80;
                id v42 = v37;
                double v43 = v19;
                double v44 = v24;
                [v42 enumerateKeysAndObjectsUsingBlock:v41];
              }
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v45 objects:v57 count:16];
          }
          while (v34);
        }

        id v16 = v39;
        [v7 removeObject:v39];
      }
    }

    id v4 = v40;
  }
  else
  {
    id v6 = PLLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeBatteryBreakdown applyStaticNameTransformation:]();
    }
  }
}

void __68__PLBatteryUIResponseTypeBatteryBreakdown_reaccountExchangeEntries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v9 rangeOfString:@"AppTypeKey"] == 0x7FFFFFFFFFFFFFFFLL
    && [v9 rangeOfString:@"time"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = (void *)MEMORY[0x1E4F28ED0];
    [v5 doubleValue];
    uint64_t v8 = [v6 numberWithDouble:v7 * (*(double *)(a1 + 40) / *(double *)(a1 + 48) + 1.0)];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
  }
}

- (id)ongoingUpdateRestoreEntryInitializer
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  [v2 setObject:@"DeviceSetup" forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
  [v2 setObject:&unk_1F400D810 forKeyedSubscript:@"PLBatteryUIAppTypeKey"];
  [v2 setObject:&unk_1F400D7E0 forKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
  [v2 setObject:&unk_1F400D7E0 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
  [v2 setObject:&unk_1F400D7E0 forKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];
  [v2 setObject:&unk_1F400D7E0 forKeyedSubscript:@"PLBatteryUIAppBackgroundPluggedInRuntimeKey"];
  [v2 setObject:&unk_1F400D7E0 forKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
  return v2;
}

- (void)ongoingUpdateRestoreTransformations:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (!v5)
  {
    double v7 = 0;
    goto LABEL_36;
  }
  uint64_t v6 = v5;
  double v43 = self;
  double v7 = 0;
  uint64_t v8 = *(void *)v48;
  double v9 = 0.0;
  id v44 = v4;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v48 != v8) {
        objc_enumerationMutation(v4);
      }
      id v11 = *(void **)(*((void *)&v47 + 1) + 8 * v10);
      double v12 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
      if ([v12 rangeOfString:@"Backup"] != 0x7FFFFFFFFFFFFFFFLL
        || [v12 rangeOfString:@"Restore"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          [(PLBatteryUIResponseTypeBatteryBreakdown *)&v45 ongoingUpdateRestoreTransformations:v22];
        }

        [v11 setObject:@"DeviceSetup" forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        id v23 = v11;

        uint64_t v21 = [v23 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
        [v21 doubleValue];
        double v9 = v24;
        double v7 = v23;
        goto LABEL_18;
      }
      double v13 = [&unk_1F40141A0 objectAtIndexedSubscript:16];
      id v14 = [v11 objectForKeyedSubscript:v13];
      [v14 doubleValue];
      double v16 = v15;

      if (v16 > 0.0)
      {
        id v17 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
        [v17 doubleValue];
        double v19 = v18;

        long long v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          double v27 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          *(_DWORD *)buf = 134218498;
          double v52 = v16;
          __int16 v53 = 2048;
          double v54 = v19;
          __int16 v55 = 2112;
          double v56 = *(double *)&v27;
          _os_log_debug_impl(&dword_1E4220000, v20, OS_LOG_TYPE_DEBUG, "Ongoing Restore: energyEntryOngoingRestoreEnergy is %f and energy is %f for Bundle ID is %@", buf, 0x20u);
        }
        if (v16 <= v19)
        {
          double v25 = [MEMORY[0x1E4F28ED0] numberWithDouble:v19 - v16];
          [v11 setObject:v25 forKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];

          id v26 = PLLogCommon();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            -[PLBatteryUIResponseTypeBatteryBreakdown ongoingUpdateRestoreTransformations:]();
          }

          double v9 = v9 + v16;
          uint64_t v21 = PLLogCommon();
          id v4 = v44;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            double v52 = v9;
            _os_log_debug_impl(&dword_1E4220000, v21, OS_LOG_TYPE_DEBUG, "Ongoing Restore: Total ongoing restore energy is %f", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v21 = PLLogCommon();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            uint64_t v28 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            *(_DWORD *)buf = 138412802;
            double v52 = *(double *)&v28;
            __int16 v53 = 2048;
            double v54 = v16;
            __int16 v55 = 2048;
            double v56 = v19;
            _os_log_error_impl(&dword_1E4220000, v21, OS_LOG_TYPE_ERROR, "Ongoing Restore: qualified ongoing restore energy for Bundle ID %@ is %f but total energy is %f", buf, 0x20u);
          }
          id v4 = v44;
        }
LABEL_18:

        goto LABEL_19;
      }
      id v4 = v44;
LABEL_19:

      ++v10;
    }
    while (v6 != v10);
    uint64_t v29 = [v4 countByEnumeratingWithState:&v47 objects:v57 count:16];
    uint64_t v6 = v29;
  }
  while (v29);
  if (v9 != 0.0)
  {
    if (!v7)
    {
      double v7 = [(PLBatteryUIResponseTypeBatteryBreakdown *)v43 ongoingUpdateRestoreEntryInitializer];
      [v4 addObject:v7];
      double v30 = PLLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIResponseTypeBatteryBreakdown ongoingUpdateRestoreTransformations:]();
      }
    }
    double v31 = (void *)MEMORY[0x1E4F28ED0];
    long long v32 = [v7 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
    [v32 doubleValue];
    uint64_t v34 = [v31 numberWithDouble:v9 + v33];
    [v7 setObject:v34 forKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];

    uint64_t v35 = PLLogCommon();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeBatteryBreakdown ongoingUpdateRestoreTransformations:](v35, v36, v37, v38, v39, v40, v41, v42);
    }

    id v4 = v44;
  }
LABEL_36:
}

- (void)reaccountBackupRestore:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v39 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          double v12 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];

          if (v12)
          {
            double v13 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            [v5 setObject:v11 forKeyedSubscript:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v8);
    }

    id v14 = [v5 objectForKeyedSubscript:@"Backup"];
    double v15 = [v5 objectForKeyedSubscript:@"Restore"];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__PLBatteryUIResponseTypeBatteryBreakdown_reaccountBackupRestore___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v16;
      if (reaccountBackupRestore__defaultOnce != -1) {
        dispatch_once(&reaccountBackupRestore__defaultOnce, block);
      }
      if (reaccountBackupRestore__classDebugEnabled)
      {
        id v17 = [NSString stringWithFormat:@"backupEnergyEntry=%@, restoreEnergyEntry=%@", v14, v15];
        double v18 = (void *)MEMORY[0x1E4F929B8];
        double v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown.m"];
        long long v20 = [v19 lastPathComponent];
        uint64_t v21 = [NSString stringWithUTF8String:"-[PLBatteryUIResponseTypeBatteryBreakdown reaccountBackupRestore:]"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:1210];

        uint64_t v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    if (v14 && v15)
    {
      [v14 setObject:@"Backup & Restore" forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
      [v14 setObject:@"Backup & Restore" forKeyedSubscript:@"PLBatteryUIAppNameKey"];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __66__PLBatteryUIResponseTypeBatteryBreakdown_reaccountBackupRestore___block_invoke_590;
      v34[3] = &unk_1E6E47BA8;
      id v23 = v14;
      id v35 = v23;
      id v24 = v15;
      id v36 = v24;
      [v23 enumerateKeysAndObjectsUsingBlock:v34];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v25 = objc_opt_class();
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __66__PLBatteryUIResponseTypeBatteryBreakdown_reaccountBackupRestore___block_invoke_2;
        v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v33[4] = v25;
        if (reaccountBackupRestore__defaultOnce_591 != -1) {
          dispatch_once(&reaccountBackupRestore__defaultOnce_591, v33);
        }
        if (reaccountBackupRestore__classDebugEnabled_592)
        {
          uint64_t v26 = [NSString stringWithFormat:@"combined backupEnergyEntry=%@", v23];
          long long v32 = (void *)MEMORY[0x1E4F929B8];
          double v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown.m"];
          uint64_t v28 = [v27 lastPathComponent];
          uint64_t v29 = [NSString stringWithUTF8String:"-[PLBatteryUIResponseTypeBatteryBreakdown reaccountBackupRestore:]"];
          [v32 logMessage:v26 fromFile:v28 fromFunction:v29 fromLineNumber:1224];

          double v30 = (void *)v26;
          double v31 = PLLogCommon();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      [v6 removeObject:v24];
    }
  }
}

uint64_t __66__PLBatteryUIResponseTypeBatteryBreakdown_reaccountBackupRestore___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  reaccountBackupRestore__classDebugEnabled = result;
  return result;
}

void __66__PLBatteryUIResponseTypeBatteryBreakdown_reaccountBackupRestore___block_invoke_590(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v12 rangeOfString:@"AppTypeKey"] == 0x7FFFFFFFFFFFFFFFLL
    && [v12 rangeOfString:@"time"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = (void *)MEMORY[0x1E4F28ED0];
    [v5 doubleValue];
    double v8 = v7;
    uint64_t v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v12];
    [v9 doubleValue];
    id v11 = [v6 numberWithDouble:v8 + v10];
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v12];
  }
}

uint64_t __66__PLBatteryUIResponseTypeBatteryBreakdown_reaccountBackupRestore___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  reaccountBackupRestore__classDebugEnabled_592 = result;
  return result;
}

- (void)transformDeletedApps:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self deletedAppBundleIDs];
  if ([v5 count])
  {
  }
  else
  {
    id v6 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self deletedAppClipBundleIDs];
    uint64_t v7 = [v6 count];

    if (!v7)
    {
      id obj = PLLogCommon();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIResponseTypeBatteryBreakdown transformDeletedApps:]();
      }
      goto LABEL_39;
    }
  }
  double v8 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self deletedAppClipBundleIDs];
  if ([v8 count])
  {
    uint64_t v9 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self deletedAppBundleIDs];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      id v11 = @"DeletedAppAndAppClip";
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v12 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self deletedAppBundleIDs];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    id v11 = @"DeletedApp";
  }
  else
  {
    id v14 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self deletedAppClipBundleIDs];
    uint64_t v15 = [v14 count];

    id v11 = @"DeletedAppClip";
    if (!v15) {
      id v11 = 0;
    }
  }
LABEL_12:
  long long v39 = v11;
  uint64_t v16 = PLLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeBatteryBreakdown transformDeletedApps:]();
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v4;
  uint64_t v17 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    id v37 = v4;
    uint64_t v40 = *(void *)v45;
    while (1)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v45 != v40) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v44 + 1) + 8 * v19);
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v21 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __64__PLBatteryUIResponseTypeBatteryBreakdown_transformDeletedApps___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v21;
          if (transformDeletedApps__defaultOnce != -1) {
            dispatch_once(&transformDeletedApps__defaultOnce, block);
          }
          if (transformDeletedApps__classDebugEnabled)
          {
            uint64_t v22 = [NSString stringWithFormat:@"energyEntry=%@", v20];
            id v23 = (void *)MEMORY[0x1E4F929B8];
            id v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown.m"];
            uint64_t v25 = [v24 lastPathComponent];
            uint64_t v26 = [NSString stringWithUTF8String:"-[PLBatteryUIResponseTypeBatteryBreakdown transformDeletedApps:]"];
            [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:1250];

            double v27 = PLLogCommon();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v49 = v22;
              _os_log_debug_impl(&dword_1E4220000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        uint64_t v28 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self deletedAppBundleIDs];
        uint64_t v29 = [v20 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        if ([v28 containsObject:v29])
        {
        }
        else
        {
          double v30 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self deletedAppClipBundleIDs];
          double v31 = [v20 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          int v32 = [v30 containsObject:v31];

          if (!v32) {
            goto LABEL_32;
          }
        }
        double v33 = PLLogCommon();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          [(PLBatteryBreakdownService *)&v41 mapDeletedAppsWithEnergyEntries:v33];
        }

        [v20 setObject:v39 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
LABEL_32:
        uint64_t v34 = [v20 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        int v35 = [v34 containsString:@"Unspecified"];

        if (v35)
        {
          id v36 = PLLogCommon();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E4220000, v36, OS_LOG_TYPE_DEFAULT, "AppDeletion : Found an unspecified entry so refactoring", buf, 2u);
          }

          [v20 setObject:@"DeletedApp" forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        }
        ++v19;
      }
      while (v18 != v19);
      uint64_t v18 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (!v18)
      {
        id v4 = v37;
        break;
      }
    }
  }
LABEL_39:
}

uint64_t __64__PLBatteryUIResponseTypeBatteryBreakdown_transformDeletedApps___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  transformDeletedApps__classDebugEnabled = result;
  return result;
}

- (void)transformPlugins:(id)a3 withBucket:(id)a4
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v94 = a4;
  uint64_t v7 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self pluginBundleIDsToEntries];

  if (v7)
  {
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    double v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v101 objects:v115 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v90 = v6;
      uint64_t v98 = *(void *)v102;
      uint64_t v93 = *MEMORY[0x1E4F625B0];
      double v95 = v8;
      while (1)
      {
        uint64_t v11 = 0;
        uint64_t v96 = v10;
        do
        {
          if (*(void *)v102 != v98) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(__CFString **)(*((void *)&v101 + 1) + 8 * v11);
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v13 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __71__PLBatteryUIResponseTypeBatteryBreakdown_transformPlugins_withBucket___block_invoke;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v13;
            if (transformPlugins_withBucket__defaultOnce != -1) {
              dispatch_once(&transformPlugins_withBucket__defaultOnce, block);
            }
            if (transformPlugins_withBucket__classDebugEnabled)
            {
              [NSString stringWithFormat:@"energyEntry=%@", v12];
              id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
              uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown.m"];
              uint64_t v17 = [v16 lastPathComponent];
              uint64_t v18 = [NSString stringWithUTF8String:"-[PLBatteryUIResponseTypeBatteryBreakdown transformPlugins:withBucket:]"];
              [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:1273];

              uint64_t v19 = PLLogCommon();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v106 = v14;
                _os_log_debug_impl(&dword_1E4220000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
            }
          }
          long long v20 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self pluginBundleIDsToEntries];
          uint64_t v21 = [(__CFString *)v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          uint64_t v22 = [v20 objectForKeyedSubscript:v21];

          if (v22)
          {
            if ([MEMORY[0x1E4F929C0] debugEnabled])
            {
              uint64_t v23 = objc_opt_class();
              v99[0] = MEMORY[0x1E4F143A8];
              v99[1] = 3221225472;
              v99[2] = __71__PLBatteryUIResponseTypeBatteryBreakdown_transformPlugins_withBucket___block_invoke_604;
              v99[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v99[4] = v23;
              if (transformPlugins_withBucket__defaultOnce_602 != -1) {
                dispatch_once(&transformPlugins_withBucket__defaultOnce_602, v99);
              }
              if (transformPlugins_withBucket__classDebugEnabled_603)
              {
                id v24 = [NSString stringWithFormat:@"this is a plugin"];
                uint64_t v25 = (void *)MEMORY[0x1E4F929B8];
                uint64_t v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown.m"];
                double v27 = [v26 lastPathComponent];
                uint64_t v28 = [NSString stringWithUTF8String:"-[PLBatteryUIResponseTypeBatteryBreakdown transformPlugins:withBucket:]"];
                [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:1278];

                uint64_t v29 = PLLogCommon();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v106 = v24;
                  _os_log_debug_impl(&dword_1E4220000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                uint64_t v10 = v96;
              }
            }
            double v30 = [v22 objectForKeyedSubscript:@"PluginId"];
            char v31 = [v30 isEqualToString:@"com.apple.AppStore.ProductPageExtension"];

            if ((v31 & 1) == 0)
            {
              int v32 = [(__CFString *)v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
              uint64_t v33 = [v22 objectForKeyedSubscript:@"PluginParentApp"];
              if ([(__CFString *)v32 isEqualToString:@"com.apple.sidecar.extension.capture"])
              {
                uint64_t v34 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self getEnergyEntry:v8 forBundleID:v33];
              }
              else
              {
                uint64_t v34 = 0;
              }
              int v35 = PLLogCommon();
              v97 = (__CFString *)v33;
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v80 = [(__CFString *)v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                *(_DWORD *)buf = 138412546;
                v106 = v80;
                __int16 v107 = 2112;
                v108 = v97;
                _os_log_debug_impl(&dword_1E4220000, v35, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);

                uint64_t v33 = (uint64_t)v97;
              }

              [(__CFString *)v12 setObject:v33 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
              id v36 = [v22 objectForKeyedSubscript:@"PluginType"];
              int v37 = [v36 isEqualToString:@"com.apple.watchkit"];

              if (v37)
              {
                long long v38 = [(__CFString *)v12 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
                [(__CFString *)v12 setObject:v38 forKeyedSubscript:@"WatchEnergy"];
                goto LABEL_37;
              }
              long long v39 = [v22 objectForKeyedSubscript:@"PluginType"];
              int v40 = [v39 isEqualToString:@"com.apple.widgetkit-extension"];

              if (v40)
              {
                uint8_t v41 = [(__CFString *)v12 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
                [(__CFString *)v12 setObject:v41 forKeyedSubscript:@"ChronoWidgetEnergy"];

                uint64_t v42 = PLLogCommon();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                {
                  double v82 = [(__CFString *)v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                  v92 = [(__CFString *)v12 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
                  [v92 doubleValue];
                  *(_DWORD *)buf = 138412546;
                  v106 = v82;
                  __int16 v107 = 2048;
                  v108 = v83;
                  _os_log_debug_impl(&dword_1E4220000, v42, OS_LOG_TYPE_DEBUG, "Widget Energy for %@ : %f", buf, 0x16u);
                }
                uint64_t v43 = [(__CFString *)v12 objectForKeyedSubscript:@"ChronoWidgetEnergy"];
                [v43 doubleValue];
                double v45 = v44;

                long long v46 = (__CFString *)v34;
                if (v45 > 0.0)
                {
                  long long v47 = [v94 objectForKeyedSubscript:@"PLBatteryUIBucketStartKey"];
                  [v47 doubleValue];
                  double v49 = v48;
                  long long v50 = [v94 objectForKeyedSubscript:@"PLBatteryUIBucketEndKey"];
                  [v50 doubleValue];
                  double v52 = v51;
                  __int16 v53 = [v94 objectForKeyedSubscript:@"PLBatteryUIBucketStartKey"];
                  [v53 doubleValue];
                  double v55 = v52 - v54;

                  long long v38 = -[PLBatteryUIResponseTypeBatteryBreakdown getWidgetUpdateTypeToCount:inRange:](self, "getWidgetUpdateTypeToCount:inRange:", v32, v49, v55);
                  if ([v38 count]) {
                    [(__CFString *)v12 setObject:v38 forKeyedSubscript:@"WidgetUpdateTypeToCount"];
                  }
                  double v8 = v95;
LABEL_37:
                  long long v46 = (__CFString *)v34;
LABEL_38:
                }
              }
              else
              {
                v62 = [v22 objectForKeyedSubscript:@"PluginType"];
                int v63 = [v62 isEqualToString:@"com.apple.posterkit.provider"];

                double v8 = v95;
                long long v46 = (__CFString *)v34;
                if (v63)
                {
                  id v64 = [(__CFString *)v12 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
                  [(__CFString *)v12 setObject:v64 forKeyedSubscript:@"PosterEnergy"];

                  long long v65 = PLLogCommon();
                  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
                  {
                    v84 = [(__CFString *)v12 objectForKeyedSubscript:@"PosterEnergy"];
                    *(_DWORD *)buf = 138412802;
                    v106 = v32;
                    __int16 v107 = 2112;
                    v108 = v84;
                    __int16 v109 = 2112;
                    v110 = v97;
                    _os_log_debug_impl(&dword_1E4220000, v65, OS_LOG_TYPE_DEBUG, "bundleID=%@, posterEnergy=%@, parentApp=%@", buf, 0x20u);
                  }
                  double v8 = v95;
                  if (!v97)
                  {
                    uint64_t v66 = PLLogCommon();
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
                    {
                      double v86 = [(__CFString *)v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                      double v87 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToReplacementBundleIDs];
                      v88 = [v87 objectForKeyedSubscript:v93];
                      *(_DWORD *)buf = 138412546;
                      v106 = v86;
                      __int16 v107 = 2112;
                      v108 = v88;
                      _os_log_debug_impl(&dword_1E4220000, v66, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);
                    }
                    long long v67 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToReplacementBundleIDs];
                    uint64_t v68 = [v67 objectForKeyedSubscript:v93];
                    [(__CFString *)v12 setObject:v68 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];

                    double v8 = v95;
                  }
                  if ([(__CFString *)v32 isEqualToString:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"])int v69 = 1; {
                  else
                  }
                    int v69 = [(__CFString *)v32 isEqualToString:@"com.apple.PhotosUIPrivate.PhotosAmbientPosterProvider"];
                  long long v70 = PLLogCommon();
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 67109120;
                    LODWORD(v106) = v69;
                    _os_log_debug_impl(&dword_1E4220000, v70, OS_LOG_TYPE_DEBUG, "isPhotosPoster=%d", buf, 8u);
                  }

                  if (v69)
                  {
                    long long v71 = PLLogCommon();
                    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                    {
                      v85 = [(__CFString *)v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                      *(_DWORD *)buf = 138412546;
                      v106 = v85;
                      __int16 v107 = 2112;
                      v108 = @"com.apple.mobileslideshow";
                      _os_log_debug_impl(&dword_1E4220000, v71, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);

                      double v8 = v95;
                    }

                    [(__CFString *)v12 setObject:@"com.apple.mobileslideshow" forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                  }
                  long long v38 = PLLogCommon();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                  {
                    long long v72 = [(__CFString *)v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                    double v91 = [(__CFString *)v12 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
                    [v91 doubleValue];
                    double v74 = v73;
                    __int16 v75 = [(__CFString *)v12 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
                    [v75 doubleValue];
                    uint64_t v77 = v76;
                    uint64_t v78 = [(__CFString *)v12 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
                    [v78 doubleValue];
                    *(_DWORD *)buf = 138413314;
                    v106 = v32;
                    __int16 v107 = 2112;
                    v108 = v72;
                    __int16 v109 = 2048;
                    v110 = v74;
                    __int16 v111 = 2048;
                    uint64_t v112 = v77;
                    __int16 v113 = 2048;
                    uint64_t v114 = v79;
                    _os_log_debug_impl(&dword_1E4220000, v38, OS_LOG_TYPE_DEBUG, "Mapping Poster %@ to %@ – energy:%f, foregroundRunTime:%f, bgRunTime:%f", buf, 0x34u);

                    double v8 = v95;
                  }
                  goto LABEL_38;
                }
              }
              if ([(__CFString *)v32 isEqualToString:@"com.apple.sidecar.extension.capture"])
              {
                double v56 = PLLogCommon();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                {
                  double v81 = [(__CFString *)v12 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                  *(_DWORD *)buf = 138412546;
                  v106 = v81;
                  __int16 v107 = 2112;
                  v108 = @"ContinuityCamera";
                  _os_log_debug_impl(&dword_1E4220000, v56, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);

                  double v8 = v95;
                }

                [(__CFString *)v12 setObject:@"ContinuityCamera" forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                uint64_t v57 = PLLogCommon();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  v106 = v46;
                  __int16 v107 = 2112;
                  v108 = v12;
                  _os_log_debug_impl(&dword_1E4220000, v57, OS_LOG_TYPE_DEBUG, "continuityParentAppEnergyEntry=%@, energyEntry=%@", buf, 0x16u);
                }

                if (v46)
                {
                  uint64_t v58 = [(__CFString *)v46 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
                  [v58 doubleValue];
                  double v60 = v59;

                  double v8 = v95;
                  if (v60 > 0.0)
                  {
                    [(__CFString *)v46 setObject:@"ContinuityCamera" forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                    [(__CFString *)v46 setObject:&unk_1F400D7E0 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
                  }
                }
                v61 = PLLogCommon();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v106 = v12;
                  _os_log_debug_impl(&dword_1E4220000, v61, OS_LOG_TYPE_DEBUG, "After adjusting Continuity Camera extension energyEntry=%@", buf, 0xCu);
                }
              }
              uint64_t v10 = v96;
            }
          }

          ++v11;
        }
        while (v10 != v11);
        uint64_t v89 = [v8 countByEnumeratingWithState:&v101 objects:v115 count:16];
        uint64_t v10 = v89;
        if (!v89)
        {
          id v6 = v90;
          break;
        }
      }
    }
  }
  else
  {
    double v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeBatteryBreakdown transformPlugins:withBucket:]();
    }
  }
}

uint64_t __71__PLBatteryUIResponseTypeBatteryBreakdown_transformPlugins_withBucket___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  transformPlugins_withBucket__classDebugEnabled = result;
  return result;
}

uint64_t __71__PLBatteryUIResponseTypeBatteryBreakdown_transformPlugins_withBucket___block_invoke_604(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  transformPlugins_withBucket__classDebugEnabled_603 = result;
  return result;
}

- (void)transformGizmoDaemons:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToReplacementBundleIDs];

  if (v5)
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v66 objects:v77 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v67 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          id v12 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToReplacementBundleIDs];
          uint64_t v13 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          id v14 = [v12 objectForKeyedSubscript:v13];

          if (v14)
          {
            uint64_t v15 = PLLogCommon();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v17 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
              *(_DWORD *)buf = 138412546;
              double v74 = v17;
              __int16 v75 = 2112;
              uint64_t v76 = v14;
              _os_log_debug_impl(&dword_1E4220000, v15, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);
            }
            [v11 setObject:v14 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            uint64_t v16 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
            [v11 setObject:v16 forKeyedSubscript:@"WatchEnergy"];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v66 objects:v77 count:16];
      }
      while (v8);
    }

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v18 = v6;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v62 objects:v72 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v63;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v63 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v62 + 1) + 8 * j);
          id v24 = [v23 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          if ([v24 hasSuffix:@"/watch"])
          {
            uint64_t v25 = PLLogCommon();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              double v52 = [v23 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
              long long v50 = objc_msgSend(v24, "substringWithRange:", 0, objc_msgSend(v24, "length") - 6);
              *(_DWORD *)buf = 138412546;
              double v74 = v52;
              __int16 v75 = 2112;
              uint64_t v76 = v50;
              _os_log_debug_impl(&dword_1E4220000, v25, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);
            }
            uint64_t v26 = objc_msgSend(v24, "substringWithRange:", 0, objc_msgSend(v24, "length") - 6);
            [v23 setObject:v26 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];

            double v27 = [v23 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
            [v23 setObject:v27 forKeyedSubscript:@"WatchEnergy"];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v62 objects:v72 count:16];
      }
      while (v20);
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v28 = v18;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v58 objects:v71 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v59;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v59 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void **)(*((void *)&v58 + 1) + 8 * k);
          uint64_t v34 = [v33 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          if ([v34 hasSuffix:@".watchkitextension"])
          {
            int v35 = PLLogCommon();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              __int16 v53 = [v33 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
              double v51 = objc_msgSend(v34, "substringWithRange:", 0, objc_msgSend(v34, "length") - 18);
              *(_DWORD *)buf = 138412546;
              double v74 = v53;
              __int16 v75 = 2112;
              uint64_t v76 = v51;
              _os_log_debug_impl(&dword_1E4220000, v35, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);
            }
            id v36 = objc_msgSend(v34, "substringWithRange:", 0, objc_msgSend(v34, "length") - 18);
            [v33 setObject:v36 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];

            int v37 = [v33 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
            [v33 setObject:v37 forKeyedSubscript:@"WatchEnergy"];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v58 objects:v71 count:16];
      }
      while (v30);
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v38 = v28;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v54 objects:v70 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v55;
      do
      {
        for (uint64_t m = 0; m != v40; ++m)
        {
          if (*(void *)v55 != v41) {
            objc_enumerationMutation(v38);
          }
          uint64_t v43 = *(void **)(*((void *)&v54 + 1) + 8 * m);
          double v44 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self bundleIDsToReplacementBundleIDs];
          double v45 = [v43 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          long long v46 = [v44 objectForKeyedSubscript:v45];

          if (v46)
          {
            long long v47 = PLLogCommon();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              double v49 = [v43 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
              *(_DWORD *)buf = 138412546;
              double v74 = v49;
              __int16 v75 = 2112;
              uint64_t v76 = v46;
              _os_log_debug_impl(&dword_1E4220000, v47, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);
            }
            [v43 setObject:v46 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            double v48 = [v43 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
            [v43 setObject:v48 forKeyedSubscript:@"WatchEnergy"];
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v54 objects:v70 count:16];
      }
      while (v40);
    }
  }
  else
  {
    long long v38 = PLLogCommon();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeBatteryBreakdown applyStaticNameTransformation:]();
    }
  }
}

- (void)transformCloudDocs:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    uint64_t v7 = @"com.apple.clouddocs.";
    uint64_t v8 = @".";
    do
    {
      uint64_t v9 = 0;
      uint64_t v20 = v5;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        if ([v11 hasPrefix:v7])
        {
          id v12 = objc_msgSend(v11, "substringFromIndex:", -[__CFString length](v7, "length"));
          uint64_t v13 = [v12 rangeOfString:v8];
          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v15 = v6;
            uint64_t v16 = v7;
            id v17 = v3;
            id v18 = v8;
            uint64_t v19 = [v12 substringFromIndex:v13 + v14];
            if (v19) {
              [v10 setObject:v19 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            }

            uint64_t v8 = v18;
            id v3 = v17;
            uint64_t v7 = v16;
            uint64_t v6 = v15;
            uint64_t v5 = v20;
          }
        }
        ++v9;
      }
      while (v5 != v9);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
}

- (BOOL)canSetQualifier:(int64_t)a3 forBundleID:(id)a4
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
    && ([v5 isEqualToString:@"Restore"] & 1) == 0
    && ![v5 isEqualToString:@"SoundRecognition"])
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
LABEL_42:
              LOBYTE(v10) = 1;
              goto LABEL_10;
            }
            char v17 = [v5 isEqualToString:@"com.apple.camera"];
            if ((a3 != 10 || (v17 & 1) == 0)
              && ([v5 isEqualToString:@"PoorCellCondition"] & 1) == 0
              && ([v5 isEqualToString:@"com.apple.Preferences"] & 1) == 0)
            {
              goto LABEL_42;
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

- (int)computeNumberOfBuckets
{
  uint64_t v2 = self;
  id v3 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self end];
  uint64_t v4 = [(PLBatteryUIResponseTypeBatteryBreakdown *)v2 start];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;
  [(PLBatteryUIResponseTypeBatteryBreakdown *)v2 bucketSize];
  LODWORD(v2) = llround(v6 / v7);

  return (int)v2;
}

- (void)enumerateBucketsUsingBlock:(id)a3
{
  id v18 = (void (**)(id, void, void *, id, double, double))a3;
  int v4 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self computeNumberOfBuckets];
  if (v4 >= 1)
  {
    int v5 = v4;
    uint64_t v6 = 0;
    double v7 = 0.0;
    do
    {
      char v8 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self end];
      [(PLBatteryUIResponseTypeBatteryBreakdown *)self bucketSize];
      unsigned int v10 = [v8 dateByAddingTimeInterval:-(v9 * v7)];

      [(PLBatteryUIResponseTypeBatteryBreakdown *)self bucketSize];
      id v12 = [v10 dateByAddingTimeInterval:-v11];
      id v13 = v10;
      [v12 timeIntervalSince1970];
      double v15 = v14;
      [v13 timeIntervalSince1970];
      double v17 = v16;

      v18[2](v18, v6, v12, v13, v15 + -1800.0, v17 - v15);
      double v7 = v7 + 1.0;
      uint64_t v6 = (v6 + 1);
    }
    while (v5 != v6);
  }
}

- (void)buildUtilityCache
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Responder Service: Battery Breakdown is storing data in temp...", v2, v3, v4, v5, v6);
}

- (void)buildBucketsForRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  int v6 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self computeNumberOfBuckets];
  double v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeBatteryBreakdown buildBucketsForRange:](v6, v7);
  }

  char v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self setBuckets:v8];

  -[PLBatteryUIResponseTypeBatteryBreakdown initializeBucketsWithRange:](self, "initializeBucketsWithRange:", location, length);
  -[PLBatteryUIResponseTypeBatteryBreakdown prepareBucketsWithRange:](self, "prepareBucketsWithRange:", location, length);
}

- (void)identifyBucket:(id)a3 withRange:(_PLTimeIntervalRange)a4
{
  double length = a4.length;
  double location = a4.location;
  id v11 = a3;
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self lastUpgradeTimestamp];
  if (location <= v7 && location + length >= v7)
  {
    double v9 = (void *)MEMORY[0x1E4F28ED0];
    [(PLBatteryUIResponseTypeBatteryBreakdown *)self lastUpgradeTimestamp];
    unsigned int v10 = objc_msgSend(v9, "numberWithDouble:");
    [v11 setObject:v10 forKeyedSubscript:@"PLBatteryUIHasUpgradeKey"];
  }
}

- (void)initializeBucketsWithRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  int v6 = -[PLBatteryUIResponseTypeBatteryBreakdown getRootNodeEntriesInRange:withTimeInterval:](self, "getRootNodeEntriesInRange:withTimeInterval:", a3.location, a3.length, 3600.0);
  double v7 = -[PLBatteryUIResponseTypeBatteryBreakdown getQualificationNodeEntriesInRange:withTimeInterval:](self, "getQualificationNodeEntriesInRange:withTimeInterval:", location, length, 3600.0);
  char v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeBatteryBreakdown initializeBucketsWithRange:](v6);
  }

  double v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeBatteryBreakdown initializeBucketsWithRange:](v7);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PLBatteryUIResponseTypeBatteryBreakdown_initializeBucketsWithRange___block_invoke;
  v12[3] = &unk_1E6E490D8;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self enumerateBucketsUsingBlock:v12];
}

void __70__PLBatteryUIResponseTypeBatteryBreakdown_initializeBucketsWithRange___block_invoke(uint64_t a1, int a2, double a3, double a4)
{
  double v7 = (id *)(a1 + 32);
  char v8 = objc_msgSend(*(id *)(a1 + 32), "buildEnergyEntriesWithRootNodes:andQualificationNodes:andRange:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  double v9 = objc_msgSend(*v7, "buildBucketWithEnergyEntries:andRange:", v8, a3, a4);
  id v10 = [*v7 buckets];
  [v10 setObject:v9 atIndexedSubscript:a2];

  id v11 = *v7;
  id v12 = [*v7 buckets];
  id v13 = [v12 objectAtIndexedSubscript:a2];
  [v11 collapseEnergyEntries:v13];

  id v14 = PLLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __70__PLBatteryUIResponseTypeBatteryBreakdown_initializeBucketsWithRange___block_invoke_cold_1(v7);
  }
}

- (void)prepareBucketsWithRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  int v6 = -[PLBatteryUIResponseTypeBatteryBreakdown getAppRuntimesInRange:](self, "getAppRuntimesInRange:");
  double v7 = -[PLBatteryUIResponseTypeBatteryBreakdown getNotificationEntriesInRange:](self, "getNotificationEntriesInRange:", location, length);
  char v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeBatteryBreakdown prepareBucketsWithRange:](v6);
  }

  double v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeBatteryBreakdown prepareBucketsWithRange:](v7);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__PLBatteryUIResponseTypeBatteryBreakdown_prepareBucketsWithRange___block_invoke;
  v12[3] = &unk_1E6E490D8;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self enumerateBucketsUsingBlock:v12];
}

void __67__PLBatteryUIResponseTypeBatteryBreakdown_prepareBucketsWithRange___block_invoke(uint64_t a1, int a2, void *a3, void *a4, double a5, double a6)
{
  uint64_t v11 = a1 + 32;
  id v12 = *(void **)(a1 + 32);
  id v13 = a4;
  id v14 = a3;
  double v15 = [v12 buckets];
  uint64_t v16 = a2;
  double v17 = [v15 objectAtIndexedSubscript:a2];
  id v18 = [v17 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];

  uint64_t v19 = objc_msgSend(*(id *)v11, "processAppTimeEntries:inRange:withAppArray:", *(void *)(v11 + 8), v18, a5, a6);

  uint64_t v20 = PLLogCommon();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    __67__PLBatteryUIResponseTypeBatteryBreakdown_prepareBucketsWithRange___block_invoke_cold_2((id *)v11);
  }

  long long v21 = objc_msgSend(*(id *)(a1 + 32), "processNotificationEntries:inRange:withAppArray:", *(void *)(a1 + 48), v19, a5, a6);

  long long v22 = PLLogCommon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    __67__PLBatteryUIResponseTypeBatteryBreakdown_prepareBucketsWithRange___block_invoke_cold_1((id *)v11);
  }

  long long v23 = (void *)MEMORY[0x1E4F28ED0];
  [v14 timeIntervalSince1970];
  double v25 = v24;

  uint64_t v26 = [v23 numberWithDouble:v25];
  double v27 = [*(id *)v11 buckets];
  id v28 = [v27 objectAtIndexedSubscript:v16];
  [v28 setObject:v26 forKeyedSubscript:@"PLBatteryUIBucketStartKey"];

  uint64_t v29 = (void *)MEMORY[0x1E4F28ED0];
  [v13 timeIntervalSince1970];
  double v31 = v30;

  int v32 = [v29 numberWithDouble:v31];
  uint64_t v33 = [*(id *)v11 buckets];
  uint64_t v34 = [v33 objectAtIndexedSubscript:v16];
  [v34 setObject:v32 forKeyedSubscript:@"PLBatteryUIBucketEndKey"];

  int v35 = [*(id *)v11 buckets];
  id v36 = [v35 objectAtIndexedSubscript:v16];
  [v36 setObject:v21 forKeyedSubscript:@"PLBatteryUIAppArrayKey"];
}

- (id)buildBucketWithEnergyEntries:(id)a3 andRange:(_PLTimeIntervalRange)a4
{
  double length = a4.length;
  double location = a4.location;
  double v7 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:a3 forKey:@"PLBatteryUIAppArrayKey"];
  -[PLBatteryUIResponseTypeBatteryBreakdown identifyBucket:withRange:](self, "identifyBucket:withRange:", v7, location, length);
  return v7;
}

- (id)buildEnergyEntriesWithRootNodes:(id)a3 andQualificationNodes:(id)a4 andRange:(_PLTimeIntervalRange)a5
{
  double length = a5.length;
  double location = a5.location;
  id v9 = a4;
  id v10 = -[PLBatteryUIResponseTypeBatteryBreakdown processRootNodes:inRange:](self, "processRootNodes:inRange:", a3, location, length);
  uint64_t v11 = -[PLBatteryUIResponseTypeBatteryBreakdown processQualificationNodes:inRange:](self, "processQualificationNodes:inRange:", v9, location, length);

  id v12 = [v10 arrayByAddingObjectsFromArray:v11];
  id v13 = (void *)[v12 mutableCopy];

  return v13;
}

- (id)processRootNodes:(id)a3 inRange:(_PLTimeIntervalRange)a4
{
  double length = a4.length;
  double location = a4.location;
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  char v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v80 objects:v86 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v81;
    double v13 = location + length;
    uint64_t v78 = *MEMORY[0x1E4F92B58];
    uint64_t v75 = *MEMORY[0x1E4F92B60];
    uint64_t v70 = *MEMORY[0x1E4F92B50];
    uint64_t v69 = *MEMORY[0x1E4F625B0];
    long long v71 = v8;
    uint64_t v76 = *(void *)v81;
    id v77 = v9;
    long long v68 = self;
    do
    {
      uint64_t v14 = 0;
      uint64_t v72 = v11;
      do
      {
        if (*(void *)v81 != v12) {
          objc_enumerationMutation(v9);
        }
        double v15 = *(void **)(*((void *)&v80 + 1) + 8 * v14);
        uint64_t v16 = (void *)MEMORY[0x1E4E7EF70]();
        double v17 = [v15 entryDate];
        id v18 = v17;
        if (v17)
        {
          [v17 timeIntervalSince1970];
          if (location <= v19)
          {
            double v20 = v19;

            if (v13 < v20) {
              goto LABEL_36;
            }
            id v18 = [v15 objectForKeyedSubscript:v78];
            if (v18)
            {
              long long v21 = [v8 objectForKeyedSubscript:v18];

              if (v21) {
                goto LABEL_13;
              }
              long long v22 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self nodeIDsToNodeNames];
              long long v23 = [v22 objectForKeyedSubscript:v18];

              if (v23)
              {
                double v24 = (void *)MEMORY[0x1E4F1CA60];
                double v25 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self nodeIDsToNodeNames];
                uint64_t v26 = [v25 objectForKeyedSubscript:v18];
                double v27 = [v24 dictionaryWithObject:v26 forKey:@"PLBatteryUIAppBundleIDKey"];
                [v8 setObject:v27 forKeyedSubscript:v18];

LABEL_13:
                id v28 = [v8 objectForKeyedSubscript:v18];
                uint64_t v29 = [v15 objectForKeyedSubscript:v75];
                int v30 = [v29 intValue];
                if ([&unk_1F40141B8 count] <= (unint64_t)v30)
                {
                  log = PLLogCommon();
                  id v9 = v77;
                  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
                  {
                    int v37 = [v29 intValue];
                    uint64_t v38 = [&unk_1F40141D0 count];
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)v85 = v37;
                    *(_WORD *)&v85[4] = 2048;
                    *(void *)&v85[6] = v38;
                    _os_log_error_impl(&dword_1E4220000, log, OS_LOG_TYPE_ERROR, "rootNodeID=%d out of bounds=%lu", buf, 0x12u);
                  }
                }
                else
                {
                  log = objc_msgSend(&unk_1F40141E8, "objectAtIndexedSubscript:", (int)objc_msgSend(v29, "intValue"));
                  double v31 = [v15 objectForKeyedSubscript:v70];
                  if ([v29 intValue] == 58)
                  {
                    int v32 = PLLogCommon();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                    {
                      int v59 = [v29 intValue];
                      [v31 doubleValue];
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)v85 = v59;
                      *(_WORD *)&v85[4] = 2048;
                      *(void *)&v85[6] = v60;
                      _os_log_debug_impl(&dword_1E4220000, v32, OS_LOG_TYPE_DEBUG, "before clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
                    }

                    uint64_t v33 = (void *)MEMORY[0x1E4F28ED0];
                    [v31 doubleValue];
                    int v35 = objc_msgSend(v33, "numberWithDouble:", fmin(v34, 9000.0));

                    id v36 = PLLogCommon();
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
                      goto LABEL_42;
                    }
                    goto LABEL_25;
                  }
                  if ([v29 intValue] == 59)
                  {
                    uint64_t v39 = PLLogCommon();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                    {
                      int v61 = [v29 intValue];
                      [v31 doubleValue];
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)v85 = v61;
                      *(_WORD *)&v85[4] = 2048;
                      *(void *)&v85[6] = v62;
                      _os_log_debug_impl(&dword_1E4220000, v39, OS_LOG_TYPE_DEBUG, "before clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
                    }

                    uint64_t v40 = (void *)MEMORY[0x1E4F28ED0];
                    [v31 doubleValue];
                    int v35 = objc_msgSend(v40, "numberWithDouble:", fmin(v41, 5500.0));

                    id v36 = PLLogCommon();
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                    {
LABEL_42:
                      int v63 = [v29 intValue];
                      [v35 doubleValue];
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)v85 = v63;
                      *(_WORD *)&v85[4] = 2048;
                      *(void *)&v85[6] = v64;
                      _os_log_debug_impl(&dword_1E4220000, v36, OS_LOG_TYPE_DEBUG, "after clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
                    }
LABEL_25:

                    double v31 = v35;
                  }
                  uint64_t v42 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self nodeIDsToNodeNames];
                  uint64_t v43 = [v42 objectForKeyedSubscript:v18];

                  uint64_t v73 = [NSString stringWithFormat:@"%@.%@", v69, @"aod"];
                  double v74 = v43;
                  if (!objc_msgSend(v43, "isEqualToString:")) {
                    goto LABEL_31;
                  }
                  double v44 = PLLogCommon();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)v85 = log;
                    _os_log_impl(&dword_1E4220000, v44, OS_LOG_TYPE_DEFAULT, "found AOD in root node %@", buf, 0xCu);
                  }

                  if ([v29 intValue] == 56
                    || [v29 intValue] == 57)
                  {
LABEL_31:
                    double v45 = (void *)MEMORY[0x1E4F28ED0];
                    long long v46 = [v28 objectForKeyedSubscript:log];
                    [v46 doubleValue];
                    double v48 = v47;
                    [v31 doubleValue];
                    long long v50 = [v45 numberWithDouble:v48 + v49 / 1000.0];
                    [v28 setObject:v50 forKeyedSubscript:log];

                    double v51 = (void *)MEMORY[0x1E4F28ED0];
                    double v52 = [v28 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
                    [v52 doubleValue];
                    double v54 = v53;
                    [v31 doubleValue];
                    long long v56 = [v51 numberWithDouble:v54 + v55 / 1000.0];
                    uint64_t v11 = v72;
                    [v28 setObject:v56 forKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];

                    self = v68;
                    [(PLBatteryUIResponseTypeBatteryBreakdown *)v68 addRNEForMetrics:v29 rootNodeEnergy:v31 energyEntry:v28];
                  }
                  else
                  {
                    long long v57 = PLLogCommon();
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                    {
                      [v31 doubleValue];
                      *(_DWORD *)buf = 138412546;
                      *(void *)v85 = log;
                      *(_WORD *)&v85[8] = 2048;
                      *(double *)&v85[10] = v58 / 1000.0;
                      _os_log_impl(&dword_1E4220000, v57, OS_LOG_TYPE_DEFAULT, "Adjusting %@ root node energy of %f mWh", buf, 0x16u);
                    }
                  }
                  char v8 = v71;
                  id v9 = v77;
                }
              }
              else
              {
                id v9 = v77;
              }
              uint64_t v12 = v76;
            }
          }
        }

LABEL_36:
        ++v14;
      }
      while (v11 != v14);
      uint64_t v65 = [v9 countByEnumeratingWithState:&v80 objects:v86 count:16];
      uint64_t v11 = v65;
    }
    while (v65);
  }

  long long v66 = [v8 allValues];

  return v66;
}

- (id)processQualificationNodes:(id)a3 inRange:(_PLTimeIntervalRange)a4
{
  double length = a4.length;
  double location = a4.location;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  char v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v76 objects:v82 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v77;
    double v13 = location + length;
    uint64_t v74 = *MEMORY[0x1E4F92B58];
    uint64_t v70 = *MEMORY[0x1E4F92B40];
    uint64_t v66 = *MEMORY[0x1E4F92B38];
    uint64_t v61 = *MEMORY[0x1E4F625B0];
    uint64_t v62 = *MEMORY[0x1E4F92B28];
    uint64_t v73 = v8;
    uint64_t v69 = self;
    id v71 = v9;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v77 != v12) {
          objc_enumerationMutation(v9);
        }
        double v15 = *(void **)(*((void *)&v76 + 1) + 8 * v14);
        uint64_t v16 = (void *)MEMORY[0x1E4E7EF70]();
        double v17 = [v15 entryDate];
        id v18 = v17;
        if (v17)
        {
          [v17 timeIntervalSince1970];
          if (location <= v19)
          {
            double v20 = v19;

            if (v13 < v20) {
              goto LABEL_32;
            }
            id v18 = [v15 objectForKeyedSubscript:v74];
            if (v18)
            {
              long long v21 = [v8 objectForKeyedSubscript:v18];

              if (v21) {
                goto LABEL_13;
              }
              long long v22 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self nodeIDsToNodeNames];
              long long v23 = [v22 objectForKeyedSubscript:v18];

              if (v23)
              {
                double v24 = (void *)MEMORY[0x1E4F1CA60];
                double v25 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self nodeIDsToNodeNames];
                uint64_t v26 = [v25 objectForKeyedSubscript:v18];
                double v27 = [v24 dictionaryWithObject:v26 forKey:@"PLBatteryUIAppBundleIDKey"];
                [v73 setObject:v27 forKeyedSubscript:v18];

                char v8 = v73;
LABEL_13:
                uint64_t v75 = [v8 objectForKeyedSubscript:v18];
                id v28 = [v15 objectForKeyedSubscript:v70];
                int v29 = [v28 intValue];
                if ([&unk_1F4014200 count] <= (unint64_t)v29)
                {
                  int v30 = PLLogCommon();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    int v54 = [v28 intValue];
                    uint64_t v55 = [&unk_1F4014218 count];
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)long long v81 = v54;
                    *(_WORD *)&v81[4] = 2048;
                    *(void *)&v81[6] = v55;
                    _os_log_error_impl(&dword_1E4220000, v30, OS_LOG_TYPE_ERROR, "rootNodeID=%d out of bounds=%lu", buf, 0x12u);
                  }
                  double v51 = v75;
                }
                else
                {
                  int v30 = objc_msgSend(&unk_1F4014230, "objectAtIndexedSubscript:", (int)objc_msgSend(v28, "intValue"));
                  double v31 = [v15 objectForKeyedSubscript:v66];
                  int v32 = [v31 intValue];
                  uint64_t v72 = v31;
                  if ([&unk_1F4014248 count] <= (unint64_t)v32)
                  {
                    uint64_t v33 = PLLogCommon();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                    {
                      int v56 = [v31 intValue];
                      uint64_t v57 = [&unk_1F4014260 count];
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)long long v81 = v56;
                      *(_WORD *)&v81[4] = 2048;
                      *(void *)&v81[6] = v57;
                      _os_log_error_impl(&dword_1E4220000, v33, OS_LOG_TYPE_ERROR, "qualificationID=%d out of bounds=%lu", buf, 0x12u);
                    }
                    double v51 = v75;
                  }
                  else
                  {
                    uint64_t v33 = objc_msgSend(&unk_1F4014278, "objectAtIndexedSubscript:", (int)objc_msgSend(v31, "intValue"));
                    uint64_t v65 = [NSString stringWithFormat:@"%@-%@", v33, v30];
                    long long v67 = [v15 objectForKeyedSubscript:v62];
                    double v34 = [(PLBatteryUIResponseTypeBatteryBreakdown *)v69 nodeIDsToNodeNames];
                    int v35 = [v34 objectForKeyedSubscript:v18];

                    int v63 = [NSString stringWithFormat:@"%@.%@", v61, @"aod"];
                    uint64_t v64 = v35;
                    long long v68 = v28;
                    if (!objc_msgSend(v35, "isEqualToString:")) {
                      goto LABEL_20;
                    }
                    id v36 = PLLogCommon();
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)long long v81 = v30;
                      _os_log_impl(&dword_1E4220000, v36, OS_LOG_TYPE_DEFAULT, "found AOD in qual for root node %@", buf, 0xCu);
                    }

                    if ([v28 intValue] == 56
                      || [v28 intValue] == 57)
                    {
LABEL_20:
                      int v37 = (void *)MEMORY[0x1E4F28ED0];
                      uint64_t v38 = [v75 objectForKeyedSubscript:v65];
                      [v38 doubleValue];
                      double v40 = v39;
                      double v41 = v67;
                      [v67 doubleValue];
                      uint64_t v43 = [v37 numberWithDouble:v40 + v42 / 1000.0];
                      [v75 setObject:v43 forKeyedSubscript:v65];

                      double v44 = (void *)MEMORY[0x1E4F28ED0];
                      double v45 = [v75 objectForKeyedSubscript:v33];
                      [v45 doubleValue];
                      double v47 = v46;
                      [v67 doubleValue];
                      double v49 = [v44 numberWithDouble:v47 + v48 / 1000.0];
                      [v75 setObject:v49 forKeyedSubscript:v33];

                      long long v50 = (void *)v65;
                      double v51 = v75;
                      [(PLBatteryUIResponseTypeBatteryBreakdown *)v69 addFgEnergyForMetrics:v68 qualificationID:v72 rootNodeQualificationEnergy:v67 energyEntry:v75];
                    }
                    else
                    {
                      double v52 = PLLogCommon();
                      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                      {
                        [v67 doubleValue];
                        *(_DWORD *)buf = 138412546;
                        *(void *)long long v81 = v30;
                        *(_WORD *)&v81[8] = 2048;
                        *(double *)&v81[10] = v53 / 1000.0;
                        _os_log_impl(&dword_1E4220000, v52, OS_LOG_TYPE_DEFAULT, "Adjusting %@ root node qual energy of %f mWh", buf, 0x16u);
                      }

                      double v51 = v75;
                      long long v50 = (void *)v65;
                      double v41 = v67;
                    }

                    id v28 = v68;
                  }

                  self = v69;
                }

                char v8 = v73;
              }
              id v9 = v71;
            }
          }
        }

LABEL_32:
        ++v14;
      }
      while (v11 != v14);
      uint64_t v58 = [v9 countByEnumeratingWithState:&v76 objects:v82 count:16];
      uint64_t v11 = v58;
    }
    while (v58);
  }

  int v59 = [v8 allValues];

  return v59;
}

- (id)processAppTimeEntries:(id)a3 inRange:(_PLTimeIntervalRange)a4 withAppArray:(id)a5
{
  double length = a4.length;
  double location = a4.location;
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v98 = a5;
  __int16 v113 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v112 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v109 = [MEMORY[0x1E4F1CA60] dictionary];
  v108 = [MEMORY[0x1E4F1CA60] dictionary];
  [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v107 = v106 = self;
  [(PLBatteryUIResponseTypeBatteryBreakdown *)self initBackgroundLocationAudioTime];
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v130 objects:v138 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v131;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v131 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v130 + 1) + 8 * i);
        id v17 = [v16 entryDate];
        if (v17)
        {
          id v18 = v17;
          [v17 timeIntervalSince1970];
          double v20 = v19;

          if (location <= v20 && v20 < location + length) {
            [v10 addObject:v16];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v130 objects:v138 count:16];
    }
    while (v13);
  }
  v100 = v11;

  id v110 = [MEMORY[0x1E4F1CA80] set];
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  uint64_t v99 = v10;
  id obj = [MEMORY[0x1E4F929D0] summarizeAggregateEntries:v10];
  uint64_t v22 = [obj countByEnumeratingWithState:&v126 objects:v137 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    id v103 = *(id *)v127;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(id *)v127 != v103) {
          objc_enumerationMutation(obj);
        }
        double v25 = *(void **)(*((void *)&v126 + 1) + 8 * j);
        uint64_t v26 = [v25 objectForKeyedSubscript:@"BundleID"];
        [v110 addObject:v26];
        double v27 = (void *)MEMORY[0x1E4F28ED0];
        id v28 = [v25 objectForKeyedSubscript:@"ScreenOnTime"];
        [v28 doubleValue];
        double v30 = v29;
        double v31 = [v25 objectForKeyedSubscript:@"InCallScreenOnTime"];
        [v31 doubleValue];
        double v33 = v30 + v32;
        double v34 = [v25 objectForKeyedSubscript:@"InCallBackgroundTime"];
        [v34 doubleValue];
        id v36 = [v27 numberWithDouble:v33 + v35];
        [v113 setObject:v36 forKeyedSubscript:v26];

        int v37 = [v25 objectForKeyedSubscript:@"BackgroundTime"];
        [v112 setObject:v37 forKeyedSubscript:v26];

        uint64_t v38 = [v25 objectForKeyedSubscript:@"InCallBackgroundTime"];
        [v109 setObject:v38 forKeyedSubscript:v26];

        double v39 = [v25 objectForKeyedSubscript:@"ScreenOnPluggedInTime"];
        [v108 setObject:v39 forKeyedSubscript:v26];

        double v40 = [v25 objectForKeyedSubscript:@"BackgroundPluggedInTime"];
        [v107 setObject:v40 forKeyedSubscript:v26];

        [(PLBatteryUIResponseTypeBatteryBreakdown *)v106 populateBackgroundLocationAudioTime:v25 bundleID:v26];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v126 objects:v137 count:16];
    }
    while (v23);
  }

  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  double v41 = [(PLBatteryUIResponseTypeBatteryBreakdown *)v106 monotonicNow];
  double v42 = -[PLBatteryUIResponseTypeBatteryBreakdown getNonAppRuntimesInRange:withNow:](v106, "getNonAppRuntimesInRange:withNow:", v41, location, length);

  id v102 = v42;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v122 objects:v136 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    id v104 = *(id *)v123;
    do
    {
      for (uint64_t k = 0; k != v44; ++k)
      {
        if (*(id *)v123 != v104) {
          objc_enumerationMutation(v102);
        }
        double v46 = *(void **)(*((void *)&v122 + 1) + 8 * k);
        double v47 = [v46 objectForKeyedSubscript:@"BundleID"];
        [v110 addObject:v47];

        double v48 = (void *)MEMORY[0x1E4F28ED0];
        double v49 = [v46 objectForKeyedSubscript:@"ScreenOnTime"];
        [v49 doubleValue];
        double v51 = v50;
        double v52 = [v46 objectForKeyedSubscript:@"InCallScreenOnTime"];
        [v52 doubleValue];
        double v54 = v51 + v53;
        uint64_t v55 = [v46 objectForKeyedSubscript:@"InCallBackgroundTime"];
        [v55 doubleValue];
        uint64_t v57 = [v48 numberWithDouble:v54 + v56];
        uint64_t v58 = [v46 objectForKeyedSubscript:@"BundleID"];
        [v113 setObject:v57 forKeyedSubscript:v58];

        int v59 = [v46 objectForKeyedSubscript:@"BackgroundTime"];
        uint64_t v60 = [v46 objectForKeyedSubscript:@"BundleID"];
        [v112 setObject:v59 forKeyedSubscript:v60];
      }
      uint64_t v44 = [v102 countByEnumeratingWithState:&v122 objects:v136 count:16];
    }
    while (v44);
  }

  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v105 = v98;
  uint64_t v61 = [v105 countByEnumeratingWithState:&v118 objects:v135 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v119;
    do
    {
      for (uint64_t m = 0; m != v62; ++m)
      {
        if (*(void *)v119 != v63) {
          objc_enumerationMutation(v105);
        }
        uint64_t v65 = *(void **)(*((void *)&v118 + 1) + 8 * m);
        uint64_t v66 = [v65 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        int v67 = [v110 containsObject:v66];

        if (v67)
        {
          long long v68 = [v65 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          [v110 removeObject:v68];
        }
        uint64_t v69 = [v65 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        uint64_t v70 = (void *)MEMORY[0x1E4F28ED0];
        id v71 = [v113 objectForKeyedSubscript:v69];
        [v71 doubleValue];
        uint64_t v72 = objc_msgSend(v70, "numberWithDouble:");
        [v65 setObject:v72 forKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];

        uint64_t v73 = (void *)MEMORY[0x1E4F28ED0];
        uint64_t v74 = [v112 objectForKeyedSubscript:v69];
        [v74 doubleValue];
        uint64_t v75 = objc_msgSend(v73, "numberWithDouble:");
        [v65 setObject:v75 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];

        long long v76 = (void *)MEMORY[0x1E4F28ED0];
        long long v77 = [v109 objectForKeyedSubscript:v69];
        [v77 doubleValue];
        long long v78 = objc_msgSend(v76, "numberWithDouble:");
        [v65 setObject:v78 forKeyedSubscript:@"PLBatteryUIAppCallOffScreenTimeKey"];

        long long v79 = (void *)MEMORY[0x1E4F28ED0];
        long long v80 = [v108 objectForKeyedSubscript:v69];
        [v80 doubleValue];
        long long v81 = objc_msgSend(v79, "numberWithDouble:");
        [v65 setObject:v81 forKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];

        long long v82 = (void *)MEMORY[0x1E4F28ED0];
        uint64_t v83 = [v107 objectForKeyedSubscript:v69];
        [v83 doubleValue];
        v84 = objc_msgSend(v82, "numberWithDouble:");
        [v65 setObject:v84 forKeyedSubscript:@"PLBatteryUIAppBackgroundPluggedInRuntimeKey"];
      }
      uint64_t v62 = [v105 countByEnumeratingWithState:&v118 objects:v135 count:16];
    }
    while (v62);
  }

  v85 = (void *)[v105 mutableCopy];
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v111 = v110;
  uint64_t v86 = [v111 countByEnumeratingWithState:&v114 objects:v134 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v115;
    do
    {
      for (uint64_t n = 0; n != v87; ++n)
      {
        if (*(void *)v115 != v88) {
          objc_enumerationMutation(v111);
        }
        uint64_t v90 = *(void *)(*((void *)&v114 + 1) + 8 * n);
        double v91 = [MEMORY[0x1E4F1CA60] dictionary];
        [v91 setObject:v90 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        [v91 setObject:&unk_1F400D7E0 forKeyedSubscript:@"PLBatteryUIAppTypeKey"];
        v92 = [v113 objectForKeyedSubscript:v90];
        [v91 setObject:v92 forKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];

        uint64_t v93 = [v112 objectForKeyedSubscript:v90];
        [v91 setObject:v93 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];

        id v94 = [v109 objectForKeyedSubscript:v90];
        [v91 setObject:v94 forKeyedSubscript:@"PLBatteryUIAppCallOffScreenTimeKey"];

        double v95 = [v108 objectForKeyedSubscript:v90];
        [v91 setObject:v95 forKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];

        uint64_t v96 = [v107 objectForKeyedSubscript:v90];
        [v91 setObject:v96 forKeyedSubscript:@"PLBatteryUIAppBackgroundPluggedInRuntimeKey"];

        [(PLBatteryUIResponseTypeBatteryBreakdown *)v106 bgLocationAudioTimeApps:v91];
        [v91 setObject:&unk_1F400D7E0 forKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
        [v85 addObject:v91];
      }
      uint64_t v87 = [v111 countByEnumeratingWithState:&v114 objects:v134 count:16];
    }
    while (v87);
  }

  return v85;
}

- (id)processNotificationEntries:(id)a3 inRange:(_PLTimeIntervalRange)a4 withAppArray:(id)a5
{
  double length = a4.length;
  double location = a4.location;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v44 = a5;
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v50 objects:v59 count:16];
  double v45 = v9;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v51;
    double v14 = location + length;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v51 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(PLBatteryBreakdownNotificationInfo **)(*((void *)&v50 + 1) + 8 * v15);
        id v17 = [(PLBatteryBreakdownNotificationInfo *)v16 entryDate];
        id v18 = v17;
        if (!v17) {
          goto LABEL_8;
        }
        [v17 timeIntervalSince1970];
        if (location > v19) {
          goto LABEL_8;
        }
        double v20 = v19;

        if (v14 >= v20)
        {
          uint64_t v21 = [(PLBatteryBreakdownNotificationInfo *)v16 objectForKeyedSubscript:@"NotificationType"];
          if (v21)
          {
            uint64_t v22 = (void *)v21;
            uint64_t v23 = [(PLBatteryBreakdownNotificationInfo *)v16 objectForKeyedSubscript:@"NotificationType"];
            if (![v23 intValue]) {
              goto LABEL_16;
            }
            double v24 = [(PLBatteryBreakdownNotificationInfo *)v16 objectForKeyedSubscript:@"NotificationType"];
            if ([v24 intValue] == 3)
            {

LABEL_16:
LABEL_17:
              id v18 = [(PLBatteryBreakdownNotificationInfo *)v16 objectForKeyedSubscript:@"NotificationBundleID"];
              if (v18)
              {
                double v25 = [[PLBatteryBreakdownNotificationInfo alloc] initWithEntry:v16];
                if (v25)
                {
                  uint64_t v26 = [v9 objectForKeyedSubscript:v18];

                  if (v26)
                  {
                    double v27 = [v9 objectForKeyedSubscript:v18];
                    [v27 combineWith:v25];
                  }
                  else
                  {
                    [v9 setObject:v25 forKeyedSubscript:v18];
                  }
                  double v31 = PLLogCommon();
                  if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                  {
LABEL_28:

                    goto LABEL_8;
                  }
                  *(_DWORD *)buf = 138412546;
                  double v56 = v18;
                  __int16 v57 = 2112;
                  uint64_t v58 = v25;
                  double v32 = v31;
                  double v33 = "notification: %@ -> %@";
                }
                else
                {
                  double v31 = PLLogCommon();
                  if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
                    goto LABEL_28;
                  }
                  *(_DWORD *)buf = 138412546;
                  double v56 = v18;
                  __int16 v57 = 2112;
                  uint64_t v58 = v16;
                  double v32 = v31;
                  double v33 = "failed to init notification info for %@ %@";
                }
                _os_log_debug_impl(&dword_1E4220000, v32, OS_LOG_TYPE_DEBUG, v33, buf, 0x16u);
                goto LABEL_28;
              }
LABEL_8:

              goto LABEL_9;
            }
            id v28 = [(PLBatteryBreakdownNotificationInfo *)v16 objectForKeyedSubscript:@"NotificationType"];
            int v29 = [v28 intValue];

            BOOL v30 = v29 == -1;
            id v9 = v45;
            if (v30) {
              goto LABEL_17;
            }
          }
        }
LABEL_9:
        ++v15;
      }
      while (v12 != v15);
      uint64_t v34 = [v10 countByEnumeratingWithState:&v50 objects:v59 count:16];
      uint64_t v12 = v34;
    }
    while (v34);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v35 = v44;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v47;
LABEL_34:
    uint64_t v39 = 0;
    while (1)
    {
      if (*(void *)v47 != v38) {
        objc_enumerationMutation(v35);
      }
      double v40 = *(void **)(*((void *)&v46 + 1) + 8 * v39);
      id v9 = v45;
      if (![v45 count]) {
        break;
      }
      double v41 = [v40 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
      double v42 = [v45 objectForKeyedSubscript:v41];
      if (v42)
      {
        [v40 setObject:v42 forKeyedSubscript:@"NotificationInfo"];
        [v45 removeObjectForKey:v41];
      }

      if (v37 == ++v39)
      {
        uint64_t v37 = [v35 countByEnumeratingWithState:&v46 objects:v54 count:16];
        id v9 = v45;
        if (v37) {
          goto LABEL_34;
        }
        break;
      }
    }
  }

  return v35;
}

- (id)getWidgetUpdateTypeToCount:(id)a3 inRange:(_PLTimeIntervalRange)a4
{
  double length = a4.length;
  double location = a4.location;
  v25[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"WidgetUpdates"];
  id v9 = [NSString stringWithFormat:@"%@='%@'", @"bundleID", v7];
  id v10 = [NSString stringWithFormat:@"%@=%f", @"timeInterval", 0x40AC200000000000];
  uint64_t v11 = [(PLBatteryUIResponseTypeBatteryBreakdown *)self responderService];
  uint64_t v12 = [v11 storage];
  v25[0] = v9;
  v25[1] = v10;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  double v14 = objc_msgSend(v12, "entriesForKey:inTimeRange:withFilters:", v8, v13, location, length);

  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__13;
  uint64_t v23 = __Block_byref_object_dispose__13;
  id v24 = (id)objc_opt_new();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__PLBatteryUIResponseTypeBatteryBreakdown_getWidgetUpdateTypeToCount_inRange___block_invoke;
  void v18[3] = &unk_1E6E49FA0;
  v18[4] = self;
  v18[5] = &v19;
  [v14 enumerateObjectsUsingBlock:v18];
  uint64_t v15 = PLLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeBatteryBreakdown getWidgetUpdateTypeToCount:inRange:]();
  }

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

void __78__PLBatteryUIResponseTypeBatteryBreakdown_getWidgetUpdateTypeToCount_inRange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v18 = [v3 objectForKeyedSubscript:@"host"];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "getWidgetTypeForHostName:");
  uint64_t v5 = [v3 objectForKeyedSubscript:@"Count"];

  uint64_t v6 = [v5 intValue];
  id v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v8 = [MEMORY[0x1E4F28ED0] numberWithShort:v4];
  id v9 = [v7 objectForKey:v8];

  id v10 = (void *)MEMORY[0x1E4F28ED0];
  if (v9)
  {
    uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithShort:v4];
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];
    double v14 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v13, "intValue") + v6);
    uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v16 = [MEMORY[0x1E4F28ED0] numberWithShort:v4];
    [v15 setObject:v14 forKeyedSubscript:v16];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
    id v17 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithShort:v4];
    [v17 setObject:v12 forKeyedSubscript:v13];
  }
}

- (signed)getWidgetTypeForEnergyEntry:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"WidgetUpdateTypeToCount"];
  uint64_t v5 = [v4 allValues];
  uint64_t v6 = [v5 valueForKeyPath:@"@max.self"];

  id v7 = [v4 allKeysForObject:v6];
  id v8 = [v7 firstObject];
  id v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    [(PLBatteryUIResponseTypeBatteryBreakdown *)v3 getWidgetTypeForEnergyEntry:v9];
  }

  if ([v7 containsObject:&unk_1F400D9C0])
  {

    id v8 = &unk_1F400D9C0;
  }
  if ((int)[v6 intValue] < 1) {
    signed __int16 v10 = 0;
  }
  else {
    signed __int16 v10 = [v8 intValue];
  }

  return v10;
}

- (signed)getWidgetTypeForHostName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Local"])
  {
    signed __int16 v4 = 1;
  }
  else if ([v3 isEqualToString:@"Remote-NotificationCenter"])
  {
    signed __int16 v4 = 2;
  }
  else
  {
    signed __int16 v4 = 0;
  }

  return v4;
}

- (id)stringifyKeysForDict:(id)a3
{
  id v3 = a3;
  signed __int16 v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PLBatteryUIResponseTypeBatteryBreakdown_stringifyKeysForDict___block_invoke;
  v7[3] = &unk_1E6E49F78;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __64__PLBatteryUIResponseTypeBatteryBreakdown_stringifyKeysForDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 stringValue];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResponderService:(id)a3
{
}

- (NSMutableArray)buckets
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBuckets:(id)a3
{
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStart:(id)a3
{
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEnd:(id)a3
{
}

- (NSDate)monotonicNow
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMonotonicNow:(id)a3
{
}

- (double)bucketSize
{
  return self->_bucketSize;
}

- (void)setBucketSize:(double)a3
{
  self->_bucketSize = a3;
}

- (NSSet)rootNodeBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRootNodeBundleIDs:(id)a3
{
}

- (NSSet)nonAppBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNonAppBundleIDs:(id)a3
{
}

- (NSSet)webAppBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWebAppBundleIDs:(id)a3
{
}

- (NSSet)deletedAppBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDeletedAppBundleIDs:(id)a3
{
}

- (NSSet)deletedAppClipBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDeletedAppClipBundleIDs:(id)a3
{
}

- (NSSet)exchangeBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setExchangeBundleIDs:(id)a3
{
}

- (NSDictionary)nodeIDsToNodeNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setNodeIDsToNodeNames:(id)a3
{
}

- (NSDictionary)bundleIDsToDisplayNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setBundleIDsToDisplayNames:(id)a3
{
}

- (NSDictionary)bundleIDsToReplacementBundleIDs
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBundleIDsToReplacementBundleIDs:(id)a3
{
}

- (NSDictionary)bundleIDsToForegroundTimes
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBundleIDsToForegroundTimes:(id)a3
{
}

- (NSDictionary)bundleIDsToBackgroundTimes
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBundleIDsToBackgroundTimes:(id)a3
{
}

- (NSDictionary)bundleIDsToEnergyKeyForSlopAdjustment
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setBundleIDsToEnergyKeyForSlopAdjustment:(id)a3
{
}

- (NSDictionary)pluginBundleIDsToEntries
{
  return (NSDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPluginBundleIDsToEntries:(id)a3
{
}

- (NSDictionary)lastBatteryEntry
{
  return (NSDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLastBatteryEntry:(id)a3
{
}

- (NSSet)intermediateRootNodes
{
  return (NSSet *)objc_getProperty(self, a2, 176, 1);
}

- (void)setIntermediateRootNodes:(id)a3
{
}

- (NSDictionary)rootNodeIDToRootNodeEnergyKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void)setRootNodeIDToRootNodeEnergyKeys:(id)a3
{
}

- (BOOL)hasHomeKit
{
  return self->_hasHomeKit;
}

- (void)setHasHomeKit:(BOOL)a3
{
  self->_hasHomeKit = a3;
}

- (BOOL)gizmoConnected
{
  return self->_gizmoConnected;
}

- (void)setGizmoConnected:(BOOL)a3
{
  self->_gizmoConnected = a3;
}

- (BOOL)isSlopAdjustmentEnabled
{
  return self->_isSlopAdjustmentEnabled;
}

- (void)setIsSlopAdjustmentEnabled:(BOOL)a3
{
  self->_isSlopAdjustmentEnabled = a3;
}

- (double)lastUpgradeTimestamp
{
  return self->_lastUpgradeTimestamp;
}

- (void)setLastUpgradeTimestamp:(double)a3
{
  self->_lastUpgradeTimestamp = a3;
}

- (double)dataDuration
{
  return self->_dataDuration;
}

- (void)setDataDuration:(double)a3
{
  self->_dataDuratiouint64_t n = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootNodeIDToRootNodeEnergyKeys, 0);
  objc_storeStrong((id *)&self->_intermediateRootNodes, 0);
  objc_storeStrong((id *)&self->_lastBatteryEntry, 0);
  objc_storeStrong((id *)&self->_pluginBundleIDsToEntries, 0);
  objc_storeStrong((id *)&self->_bundleIDsToEnergyKeyForSlopAdjustment, 0);
  objc_storeStrong((id *)&self->_bundleIDsToBackgroundTimes, 0);
  objc_storeStrong((id *)&self->_bundleIDsToForegroundTimes, 0);
  objc_storeStrong((id *)&self->_bundleIDsToReplacementBundleIDs, 0);
  objc_storeStrong((id *)&self->_bundleIDsToDisplayNames, 0);
  objc_storeStrong((id *)&self->_nodeIDsToNodeNames, 0);
  objc_storeStrong((id *)&self->_exchangeBundleIDs, 0);
  objc_storeStrong((id *)&self->_deletedAppClipBundleIDs, 0);
  objc_storeStrong((id *)&self->_deletedAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_webAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_nonAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_rootNodeBundleIDs, 0);
  objc_storeStrong((id *)&self->_monotonicNow, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_buckets, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

- (void)addEntryTypes:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Battery Usage Breakdown: rootNodeBundleIDs is nil", v2, v3, v4, v5, v6);
}

- (void)addEntryTypes:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Battery Usage Breakdown: nonAppBundleIDs is nil", v2, v3, v4, v5, v6);
}

- (void)addEntryTypes:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Battery Usage Breakdown: webAppBundleIDs is nil", v2, v3, v4, v5, v6);
}

- (void)addEntryTypes:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Battery Usage Breakdown: bundleIDsToDisplayNames is nil", v2, v3, v4, v5, v6);
}

- (void)applyStaticNameTransformation:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Battery Usage Breakdown: bundleIDsToReplacementBundleIDs is nil", v2, v3, v4, v5, v6);
}

- (void)applyStaticNameTransformation:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v3 = [v2 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
  [v3 doubleValue];
  *uint64_t v1 = 134217984;
  void *v0 = v4;
  OUTLINED_FUNCTION_7(&dword_1E4220000, v5, v6, "After clamping: energyEntry[PLBatteryUIAppEnergyValueKey]=%f");
}

- (void)applyStaticNameTransformation:.cold.4()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v3 = [v2 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
  [v3 doubleValue];
  *uint64_t v1 = 134217984;
  void *v0 = v4;
  OUTLINED_FUNCTION_7(&dword_1E4220000, v5, v6, "Before clamping: energyEntry[PLBatteryUIAppEnergyValueKey]=%f");
}

- (void)adjustEnergyValues:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1E4220000, a2, OS_LOG_TYPE_ERROR, "totalEnergyPercent=%d", (uint8_t *)v2, 8u);
}

- (void)applySlopAdjustment:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8_0();
  _os_log_error_impl(&dword_1E4220000, v0, OS_LOG_TYPE_ERROR, "Bailing: totalAccountedEnergySum=%f, externalEnergySum=%f", v1, 0x16u);
}

- (void)applySlopAdjustment:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1E4220000, a1, a3, "totalEnergyToRemove for slop adjustment = %f", a5, a6, a7, a8, 0);
}

- (void)applySlopAdjustment:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_2(&dword_1E4220000, v0, v1, "totalEnergySum=%f, externalEnergySum=%f", v2);
}

- (void)getEnergyToRemoveForSlopAdjustment:(void *)a1 withEnergyKey:(uint64_t)a2 forBucket:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
  id v7 = [a1 objectForKeyedSubscript:a2];
  [v7 doubleValue];
  int v9 = 138412802;
  signed __int16 v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  __int16 v13 = 2048;
  uint64_t v14 = v8;
  _os_log_debug_impl(&dword_1E4220000, a3, OS_LOG_TYPE_DEBUG, "not a relevant entry for slopAdjustment, bundleID=%@, energyEntry value for energyKey=%@ is %f", (uint8_t *)&v9, 0x20u);
}

- (void)adjustRuntimes:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Battery Usage Breakdown: bundleIDsToForegroundTimes is nil", v2, v3, v4, v5, v6);
}

- (void)adjustRuntimes:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Battery Usage Breakdown: bundleIDsToBackgroundTimes is nil", v2, v3, v4, v5, v6);
}

void __65__PLBatteryUIResponseTypeBatteryBreakdown_collapseEnergyEntries___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "combinedWidgetUpdateTypeToCount=%@", v2, v3, v4, v5, v6);
}

void __65__PLBatteryUIResponseTypeBatteryBreakdown_collapseEnergyEntries___block_invoke_cold_2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_10_5();
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_3_2(&dword_1E4220000, v1, (uint64_t)v1, "storedDict=%@, otherDict=%@", v2);
}

- (void)ongoingUpdateRestoreTransformations:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)ongoingUpdateRestoreTransformations:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Ongoing Restore: Created a new ongoing restore energy entry and added it to current list of energy entries", v2, v3, v4, v5, v6);
}

- (void)ongoingUpdateRestoreTransformations:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v3 = [v2 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
  [v3 doubleValue];
  *uint64_t v1 = 134217984;
  void *v0 = v4;
  OUTLINED_FUNCTION_7(&dword_1E4220000, v5, v6, "Ongoing Restore: After adjustments, energy in entry is %f");
}

- (void)ongoingUpdateRestoreTransformations:(os_log_t)log .cold.4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "Ongoing Restore: Currently have a Backup, Restore, or Backup & Restore entity", buf, 2u);
}

- (void)transformDeletedApps:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Battery Usage Breakdown: deletedAppBundleIDs and deletedAppClipBundleIDs are empty", v2, v3, v4, v5, v6);
}

- (void)transformDeletedApps:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Display Name for Deleted entry: %@", v2, v3, v4, v5, v6);
}

- (void)transformPlugins:withBucket:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Battery Usage Breakdown: pluginBundleIDsToEntries is nil", v2, v3, v4, v5, v6);
}

- (void)buildBucketsForRange:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "Battery Breakdown: bucket count = %d", (uint8_t *)v2, 8u);
}

- (void)initializeBucketsWithRange:(void *)a1 .cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v1, v2, "Battery Breakdown: gathered %d qualification nodes...", v3, v4, v5, v6, v7);
}

- (void)initializeBucketsWithRange:(void *)a1 .cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v1, v2, "Battery Breakdown: gathered %d root nodes...", v3, v4, v5, v6, v7);
}

void __70__PLBatteryUIResponseTypeBatteryBreakdown_initializeBucketsWithRange___block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 buckets];
  [v1 count];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v2, v3, "Battery Breakdown: prepared %d buckets", v4, v5, v6, v7, v8);
}

- (void)prepareBucketsWithRange:(void *)a1 .cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v1, v2, "Battery Breakdown: gathered %d notification entries...", v3, v4, v5, v6, v7);
}

- (void)prepareBucketsWithRange:(void *)a1 .cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v1, v2, "Battery Breakdown: gathered %d app runtime entries...", v3, v4, v5, v6, v7);
}

void __67__PLBatteryUIResponseTypeBatteryBreakdown_prepareBucketsWithRange___block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 buckets];
  [v1 count];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v2, v3, "Battery Breakdown: applied notification runtimes to %d buckets", v4, v5, v6, v7, v8);
}

void __67__PLBatteryUIResponseTypeBatteryBreakdown_prepareBucketsWithRange___block_invoke_cold_2(id *a1)
{
  uint64_t v1 = [*a1 buckets];
  [v1 count];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v2, v3, "Battery Breakdown: applied app runtimes to %d buckets", v4, v5, v6, v7, v8);
}

- (void)getWidgetUpdateTypeToCount:inRange:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_3_2(&dword_1E4220000, v1, (uint64_t)v1, "in getWidgetUpdate identifier=%@, widgetTypeToCount=%@", v2);
}

- (void)getWidgetTypeForEnergyEntry:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
  OUTLINED_FUNCTION_10_5();
  uint64_t v8 = a2;
  OUTLINED_FUNCTION_3_2(&dword_1E4220000, a3, v6, "identifier=%@, widgetTypeToCount=%@", v7);
}

@end