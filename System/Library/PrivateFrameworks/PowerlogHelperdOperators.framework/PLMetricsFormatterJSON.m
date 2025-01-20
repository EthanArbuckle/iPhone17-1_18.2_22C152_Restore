@interface PLMetricsFormatterJSON
+ (id)pruneDictionary:(id)a3 withAllowlist:(id)a4;
- (BOOL)checkKeyExistence:(id)a3 secondLevel:(id)a4 dictToCheck:(id)a5;
- (BOOL)moveLogFile;
- (BOOL)testAllMetrics;
- (BOOL)writeSessionFile;
- (NSDate)logFileTimeStamp;
- (PLMetricsFormatterJSON)init;
- (id)createHeaderForSessionsFile;
- (id)customRound:(int)a3 precision:(int)a4;
- (id)getCurrentTimeFormatted:(BOOL)a3;
- (id)getFileHandle;
- (id)getOSVersion;
- (id)metricsToStringAsJSON;
- (id)roundArrayValuesToNearestX:(id)a3 precision:(int)a4;
- (id)sanitizeDictionary:(id)a3;
- (void)addAllMetrics:(id)a3 signpostData:(id)a4;
- (void)addAppEnergy:(id)a3 userData:(id)a4;
- (void)addAppMemoryKeys:(id)a3 userData:(id)a4;
- (void)addAppMetaData:(id)a3 userData:(id)a4;
- (void)addAppMetric:(id)a3;
- (void)addAppPerformanceKeysActivations:(id)a3 activationData:(id)a4;
- (void)addAppPerformanceKeysExits:(id)a3 processExitData:(id)a4;
- (void)addAppPerformanceKeysGlitch:(id)a3 scrollGlitchData:(id)a4;
- (void)addAppPerformanceKeysHang:(id)a3 userData:(id)a4 hangTimeData:(id)a5;
- (void)addAppPerformanceKeysLaunch:(id)a3 userData:(id)a4 launchTimeData:(id)a5;
- (void)addAppPerformanceKeysResume:(id)a3 userData:(id)a4 resumeTimeData:(id)a5;
- (void)addAppTime:(id)a3 userData:(id)a4;
- (void)addDiskIO:(id)a3 userData:(id)a4;
- (void)addDisplayAPL:(id)a3 userData:(id)a4;
- (void)addGlobalMetaData:(id)a3;
- (void)addNetworkIO:(id)a3 userData:(id)a4;
- (void)addPerformanceMetrics:(id)a3 userData:(id)a4 signpostData:(id)a5;
- (void)addPowerMetrics:(id)a3 userData:(id)a4;
- (void)addSubKeys:(id)a3 extractFromHere:(id)a4 deviceFirstLevelMetric:(id)a5 firstLevelKey:(id)a6 secondLevelKey:(id)a7 subKeyMap:(id)a8;
- (void)addSubKeysThirdLevel:(id)a3 extractFromHere:(id)a4 deviceFirstLevelMetric:(id)a5 firstLevelKey:(id)a6 secondLevelKey:(id)a7 thirdLevelKey:(id)a8 subKeyMap:(id)a9;
- (void)getFileHandle;
- (void)moveLogFile;
- (void)printAllMetricsToConsole;
- (void)pruneJSONData;
- (void)sendAppMetricToCoreAnalytics:(id)a3;
- (void)setLogFileTimeStamp:(id)a3;
- (void)test;
@end

@implementation PLMetricsFormatterJSON

- (PLMetricsFormatterJSON)init
{
  v98.receiver = self;
  v98.super_class = (Class)PLMetricsFormatterJSON;
  v2 = [(PLMetricsFormatterJSON *)&v98 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    [(PLMetricsFormatterJSON *)v2 setLogFileTimeStamp:v3];

    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    allMetrics = v2->allMetrics;
    v2->allMetrics = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    metricArray = v2->metricArray;
    v2->metricArray = v6;

    [(NSMutableDictionary *)v2->allMetrics setObject:v2->metricArray forKey:@"metrics"];
    v8 = (void *)MEMORY[0x1E4F1C978];
    v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"CPU", @"CPUTime", 0);
    v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"GPU", @"GPUTime", 0);
    v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"fg_total", @"fgTime_Total", 0);
    uint64_t v12 = objc_msgSend(v8, "arrayWithObjects:", v9, v10, v11, 0);
    appTimeMapping = v2->appTimeMapping;
    v2->appTimeMapping = (NSArray *)v12;

    v14 = (void *)MEMORY[0x1E4F1C978];
    v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"CPU", @"CPUTime", 0);
    v16 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"GPU", @"GPUTime", 0);
    v17 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"fg_unplugged", @"fgTime_Unplugged", 0);
    uint64_t v18 = objc_msgSend(v14, "arrayWithObjects:", v15, v16, v17, 0);
    appTimeUnpluggedMapping = v2->appTimeUnpluggedMapping;
    v2->appTimeUnpluggedMapping = (NSArray *)v18;

    v20 = (void *)MEMORY[0x1E4F1C978];
    v21 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"total", @"bgTime_Total", 0);
    v22 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"audio", @"bgTime_Audio", 0);
    v23 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"location", @"bgTime_Location", 0);
    v24 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"location_audio", @"bgLocationAudioTime", 0);
    uint64_t v25 = objc_msgSend(v20, "arrayWithObjects:", v21, v22, v23, v24, 0);
    appBGTimeMapping = v2->appBGTimeMapping;
    v2->appBGTimeMapping = (NSArray *)v25;

    v27 = (void *)MEMORY[0x1E4F1C978];
    v28 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"total", @"bgTime_Unplugged", 0);
    v29 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"audio", @"bgAudioTime_Unplugged", 0);
    v30 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"location", @"bgLocationTime_Unplugged", 0);
    v31 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"location_audio", @"bgLocationAudioTime_Unplugged", 0);
    uint64_t v32 = objc_msgSend(v27, "arrayWithObjects:", v28, v29, v30, v31, 0);
    appBGTimeUpMapping = v2->appBGTimeUpMapping;
    v2->appBGTimeUpMapping = (NSArray *)v32;

    v34 = (void *)MEMORY[0x1E4F1C978];
    v35 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"bestAccuracy", @"BestAccuracy", 0);
    v36 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"bestAccuracyForNavigation", @"BestAccuracyForNavigation", 0);
    v37 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"nearestTenMetersAccuracy", @"NearestTenMetersAccuracy", 0);
    v38 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"hundredMetersAccuracy", @"HundredMetersAccuracy", 0);
    v39 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"kilometerAccuracy", @"KilometerAccuracy", 0);
    v40 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"threeKilometersAccuracy", @"ThreeKilometersAccuracy", 0);
    uint64_t v41 = objc_msgSend(v34, "arrayWithObjects:", v35, v36, v37, v38, v39, v40, 0);
    appTimeLocationActivityMapping = v2->appTimeLocationActivityMapping;
    v2->appTimeLocationActivityMapping = (NSArray *)v41;

    v43 = (void *)MEMORY[0x1E4F1C978];
    v44 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"signalBar0", @"SignalBar0", 0);
    v45 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"signalBar1", @"SignalBar1", 0);
    v46 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"signalBar2", @"SignalBar2", 0);
    v47 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"signalBar3", @"SignalBar3", 0);
    v48 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"signalBar4", @"SignalBar4", 0);
    v49 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"signalBar5", @"SignalBar5", 0);
    v50 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"signalBarUnknown", @"SignalBarUnknown", 0);
    uint64_t v51 = objc_msgSend(v43, "arrayWithObjects:", v44, v45, v46, v47, v48, v49, v50, 0);
    appTimeCellularConditionMapping = v2->appTimeCellularConditionMapping;
    v2->appTimeCellularConditionMapping = (NSArray *)v51;

    v53 = (void *)MEMORY[0x1E4F1C978];
    v54 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"totalDownload", @"bytesWifiIn", 0);
    v55 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"totalUpload", @"bytesWifiOut", 0);
    uint64_t v56 = objc_msgSend(v53, "arrayWithObjects:", v54, v55, 0);
    appNetworkIOWifiMapping = v2->appNetworkIOWifiMapping;
    v2->appNetworkIOWifiMapping = (NSArray *)v56;

    v58 = (void *)MEMORY[0x1E4F1C978];
    v59 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"totalDownload", @"bytesCellularIn", 0);
    v60 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"totalUpload", @"bytesCellularOut", 0);
    uint64_t v61 = objc_msgSend(v58, "arrayWithObjects:", v59, v60, 0);
    appNetworkIOCellularMapping = v2->appNetworkIOCellularMapping;
    v2->appNetworkIOCellularMapping = (NSArray *)v61;

    v63 = (void *)MEMORY[0x1E4F1C978];
    v64 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"averagePixelLuminance", @"AveragePictureLevel", 0);
    v65 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"totalFrameCount", @"TotalFrameCount", 0);
    uint64_t v66 = objc_msgSend(v63, "arrayWithObjects:", v64, v65, 0);
    appDisplayAPLMapping = v2->appDisplayAPLMapping;
    v2->appDisplayAPLMapping = (NSArray *)v66;

    v68 = [MEMORY[0x1E4F1CA48] array];
    int v69 = 1;
    do
    {
      v70 = NSString;
      v71 = [MEMORY[0x1E4F28ED0] numberWithShort:(__int16)v69];
      unsigned int v72 = (unsigned __int16)v69;
      v73 = [v70 stringWithFormat:@"%@", v71];
      [v68 addObject:v73];

      ++v69;
    }
    while (v72 < 0x11);
    uint64_t v74 = [MEMORY[0x1E4F1CA48] array];
    appEnergyFGMapping = v2->appEnergyFGMapping;
    v2->appEnergyFGMapping = (NSMutableArray *)v74;

    uint64_t v76 = [MEMORY[0x1E4F1CA48] array];
    appEnergyBGMapping = v2->appEnergyBGMapping;
    v2->appEnergyBGMapping = (NSMutableArray *)v76;

    uint64_t v78 = [MEMORY[0x1E4F1CA48] array];
    appEnergyTotalMapping = v2->appEnergyTotalMapping;
    v2->appEnergyTotalMapping = (NSMutableArray *)v78;

    uint64_t v80 = [MEMORY[0x1E4F1CA48] array];
    appEnergyBGAudioMapping = v2->appEnergyBGAudioMapping;
    v2->appEnergyBGAudioMapping = (NSMutableArray *)v80;

    uint64_t v82 = [MEMORY[0x1E4F1CA48] array];
    appEnergyBGLocationMapping = v2->appEnergyBGLocationMapping;
    v2->appEnergyBGLocationMapping = (NSMutableArray *)v82;

    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __30__PLMetricsFormatterJSON_init__block_invoke;
    v96[3] = &unk_1E6E47E18;
    v84 = v2;
    v97 = v84;
    [v68 enumerateObjectsUsingBlock:v96];
    v85 = (void *)MEMORY[0x1E4F1C978];
    v86 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"totalWrites", @"byteswritten", 0);
    v87 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"totalReads", @"bytesread", 0);
    uint64_t v88 = objc_msgSend(v85, "arrayWithObjects:", v86, v87, 0);
    diskIOMapping = v84->diskIOMapping;
    v84->diskIOMapping = (NSArray *)v88;

    v90 = (void *)MEMORY[0x1E4F1C978];
    v91 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"peak", @"PeakMemory", 0);
    v92 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"average", @"AverageMemory", 0);
    uint64_t v93 = objc_msgSend(v90, "arrayWithObjects:", v91, v92, 0);
    memoryMapping = v84->memoryMapping;
    v84->memoryMapping = (NSArray *)v93;
  }
  return v2;
}

void __30__PLMetricsFormatterJSON_init__block_invoke(uint64_t a1, void *a2)
{
  v3 = NSString;
  id v4 = a2;
  id v13 = [v3 stringWithFormat:@"%@%@", @"fg", v4];
  v5 = [NSString stringWithFormat:@"%@%@", @"bg", v4];
  v6 = [NSString stringWithFormat:@"%@%@", @"bgAudio", v4];
  v7 = [NSString stringWithFormat:@"%@%@", @"bgLocation", v4];
  v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, v13, 0);
  v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, v5, 0);
  v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, v4, 0);
  v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, v6, 0);
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, v7, 0);

  [*(id *)(*(void *)(a1 + 32) + 96) addObject:v8];
  [*(id *)(*(void *)(a1 + 32) + 104) addObject:v9];
  [*(id *)(*(void *)(a1 + 32) + 112) addObject:v10];
  [*(id *)(*(void *)(a1 + 32) + 120) addObject:v11];
  [*(id *)(*(void *)(a1 + 32) + 128) addObject:v12];
}

- (id)customRound:(int)a3 precision:(int)a4
{
  if (a3 >= a4)
  {
    uint64_t v5 = (a3 / a4 * a4);
    id v4 = (void *)MEMORY[0x1E4F28ED0];
    if (a3 - (int)v5 > (int)v5 + a4 - a3) {
      uint64_t v5 = (v5 + a4);
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v5 = *(void *)&a4;
  }
  v7 = [v4 numberWithInt:v5];
  return v7;
}

- (id)roundArrayValuesToNearestX:(id)a3 precision:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
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
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = -[PLMetricsFormatterJSON customRound:precision:](self, "customRound:precision:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "intValue", (void)v16), v4);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v14 = [v7 sortedArrayUsingSelector:sel_compare_];

  return v14;
}

- (BOOL)checkKeyExistence:(id)a3 secondLevel:(id)a4 dictToCheck:(id)a5
{
  id v7 = a4;
  id v8 = [a5 objectForKeyedSubscript:a3];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  return v9 != 0;
}

- (void)addSubKeysThirdLevel:(id)a3 extractFromHere:(id)a4 deviceFirstLevelMetric:(id)a5 firstLevelKey:(id)a6 secondLevelKey:(id)a7 thirdLevelKey:(id)a8 subKeyMap:(id)a9
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v15 = a4;
  id v16 = a5;
  id v35 = a6;
  id v34 = a7;
  id v33 = a8;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = a9;
  uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v41;
    uint64_t v32 = self;
    do
    {
      uint64_t v20 = 0;
      uint64_t v37 = v18;
      do
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v40 + 1) + 8 * v20);
        v22 = objc_msgSend(v21, "objectAtIndexedSubscript:", 1, v32);
        BOOL v23 = [(PLMetricsFormatterJSON *)self checkKeyExistence:v16 secondLevel:v22 dictToCheck:v15];

        if (v23)
        {
          v24 = [v21 objectAtIndexedSubscript:0];
          v39 = [v36 objectForKeyedSubscript:v35];
          uint64_t v25 = [v39 objectForKeyedSubscript:v34];
          v26 = [v25 objectForKeyedSubscript:v33];
          [v15 objectForKeyedSubscript:v16];
          v28 = id v27 = v15;
          v29 = [v21 objectAtIndexedSubscript:1];
          [v28 objectForKeyedSubscript:v29];
          v31 = uint64_t v30 = v19;
          [v26 setObject:v31 forKey:v24];

          uint64_t v19 = v30;
          id v15 = v27;

          self = v32;
          uint64_t v18 = v37;
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v18);
  }
}

- (void)addSubKeys:(id)a3 extractFromHere:(id)a4 deviceFirstLevelMetric:(id)a5 firstLevelKey:(id)a6 secondLevelKey:(id)a7 subKeyMap:(id)a8
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v13 = a4;
  id v14 = a5;
  id v33 = a6;
  id v15 = a7;
  id v16 = v13;
  id v32 = v15;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = a8;
  uint64_t v17 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v39;
    do
    {
      uint64_t v20 = 0;
      uint64_t v35 = v18;
      do
      {
        if (*(void *)v39 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v38 + 1) + 8 * v20);
        v22 = objc_msgSend(v21, "objectAtIndexedSubscript:", 1, v32);
        BOOL v23 = [(PLMetricsFormatterJSON *)self checkKeyExistence:v14 secondLevel:v22 dictToCheck:v16];

        if (v23)
        {
          v24 = [v21 objectAtIndexedSubscript:0];
          uint64_t v25 = [v34 objectForKeyedSubscript:v33];
          [v25 objectForKeyedSubscript:v32];
          id v27 = v26 = v19;
          [v16 objectForKeyedSubscript:v14];
          v29 = v28 = v16;
          uint64_t v30 = [v21 objectAtIndexedSubscript:1];
          v31 = [v29 objectForKeyedSubscript:v30];
          [v27 setObject:v31 forKey:v24];

          id v16 = v28;
          uint64_t v19 = v26;
          uint64_t v18 = v35;
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v18);
  }
}

- (void)addAppTime:(id)a3 userData:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  id v24 = [v6 dictionary];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"power_metrics"];
  [v9 setObject:v24 forKey:@"app_time"];

  -[PLMetricsFormatterJSON addSubKeys:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:subKeyMap:](self, "addSubKeys:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:subKeyMap:", v8, v7);
  BOOL v23 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [v8 objectForKeyedSubscript:@"power_metrics"];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"app_time"];
  [v11 setObject:v23 forKey:@"bg_total"];

  [(PLMetricsFormatterJSON *)self addSubKeysThirdLevel:v8 extractFromHere:v7 deviceFirstLevelMetric:&unk_1F400CD48 firstLevelKey:@"power_metrics" secondLevelKey:@"app_time" thirdLevelKey:@"bg_total" subKeyMap:self->appBGTimeMapping];
  v22 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v12 = [v8 objectForKeyedSubscript:@"power_metrics"];
  [v12 setObject:v22 forKey:@"fg_unplugged"];

  [(PLMetricsFormatterJSON *)self addSubKeys:v8 extractFromHere:v7 deviceFirstLevelMetric:&unk_1F400CD48 firstLevelKey:@"power_metrics" secondLevelKey:@"app_time" subKeyMap:self->appTimeUnpluggedMapping];
  uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
  id v13 = [v8 objectForKeyedSubscript:@"power_metrics"];
  id v14 = [v13 objectForKeyedSubscript:@"app_time"];
  [v14 setObject:v21 forKey:@"bg_unplugged"];

  [(PLMetricsFormatterJSON *)self addSubKeysThirdLevel:v8 extractFromHere:v7 deviceFirstLevelMetric:&unk_1F400CD48 firstLevelKey:@"power_metrics" secondLevelKey:@"app_time" thirdLevelKey:@"bg_unplugged" subKeyMap:self->appBGTimeUpMapping];
  id v15 = [MEMORY[0x1E4F1CA60] dictionary];
  id v16 = [v8 objectForKeyedSubscript:@"power_metrics"];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"app_time"];
  [v17 setObject:v15 forKey:@"location_activity"];

  [(PLMetricsFormatterJSON *)self addSubKeysThirdLevel:v8 extractFromHere:v7 deviceFirstLevelMetric:&unk_1F400CD48 firstLevelKey:@"power_metrics" secondLevelKey:@"app_time" thirdLevelKey:@"location_activity" subKeyMap:self->appTimeLocationActivityMapping];
  uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v19 = [v8 objectForKeyedSubscript:@"power_metrics"];
  uint64_t v20 = [v19 objectForKeyedSubscript:@"app_time"];
  [v20 setObject:v18 forKey:@"cellular_condition"];

  [(PLMetricsFormatterJSON *)self addSubKeysThirdLevel:v8 extractFromHere:v7 deviceFirstLevelMetric:&unk_1F400CD48 firstLevelKey:@"power_metrics" secondLevelKey:@"app_time" thirdLevelKey:@"cellular_condition" subKeyMap:self->appTimeCellularConditionMapping];
}

- (void)addNetworkIO:(id)a3 userData:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  id v16 = [v6 dictionary];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"power_metrics"];
  [v9 setObject:v16 forKey:@"network_io"];

  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v11 = [v8 objectForKeyedSubscript:@"power_metrics"];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"network_io"];
  [v12 setObject:v10 forKey:@"wifi"];

  id v13 = [MEMORY[0x1E4F1CA60] dictionary];
  id v14 = [v8 objectForKeyedSubscript:@"power_metrics"];
  id v15 = [v14 objectForKeyedSubscript:@"network_io"];
  [v15 setObject:v13 forKey:@"cellular"];

  [(PLMetricsFormatterJSON *)self addSubKeysThirdLevel:v8 extractFromHere:v7 deviceFirstLevelMetric:&unk_1F400CD48 firstLevelKey:@"power_metrics" secondLevelKey:@"network_io" thirdLevelKey:@"wifi" subKeyMap:self->appNetworkIOWifiMapping];
  [(PLMetricsFormatterJSON *)self addSubKeysThirdLevel:v8 extractFromHere:v7 deviceFirstLevelMetric:&unk_1F400CD48 firstLevelKey:@"power_metrics" secondLevelKey:@"network_io" thirdLevelKey:@"cellular" subKeyMap:self->appNetworkIOCellularMapping];
}

- (void)addDisplayAPL:(id)a3 userData:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  id v10 = [v6 dictionary];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"power_metrics"];
  [v9 setObject:v10 forKey:@"display_apl"];

  [(PLMetricsFormatterJSON *)self addSubKeys:v8 extractFromHere:v7 deviceFirstLevelMetric:&unk_1F400CD48 firstLevelKey:@"power_metrics" secondLevelKey:@"display_apl" subKeyMap:self->appDisplayAPLMapping];
}

- (void)addAppEnergy:(id)a3 userData:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  id v25 = [v6 dictionary];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"power_metrics"];
  [v9 setObject:v25 forKey:@"app_energy"];

  id v24 = [MEMORY[0x1E4F1CA60] dictionary];
  id v10 = [v8 objectForKeyedSubscript:@"power_metrics"];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"app_energy"];
  [v11 setObject:v24 forKey:@"bg"];

  -[PLMetricsFormatterJSON addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:](self, "addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:", v8, v7, self->appEnergyBGMapping);
  BOOL v23 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v12 = [v8 objectForKeyedSubscript:@"power_metrics"];
  id v13 = [v12 objectForKeyedSubscript:@"app_energy"];
  [v13 setObject:v23 forKey:@"fg"];

  [(PLMetricsFormatterJSON *)self addSubKeysThirdLevel:v8 extractFromHere:v7 deviceFirstLevelMetric:&unk_1F400CD48 firstLevelKey:@"power_metrics" secondLevelKey:@"app_energy" thirdLevelKey:@"fg" subKeyMap:self->appEnergyFGMapping];
  v22 = [MEMORY[0x1E4F1CA60] dictionary];
  id v14 = [v8 objectForKeyedSubscript:@"power_metrics"];
  id v15 = [v14 objectForKeyedSubscript:@"app_energy"];
  [v15 setObject:v22 forKey:@"total"];

  [(PLMetricsFormatterJSON *)self addSubKeysThirdLevel:v8 extractFromHere:v7 deviceFirstLevelMetric:&unk_1F400CD48 firstLevelKey:@"power_metrics" secondLevelKey:@"app_energy" thirdLevelKey:@"total" subKeyMap:self->appEnergyTotalMapping];
  id v16 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v17 = [v8 objectForKeyedSubscript:@"power_metrics"];
  uint64_t v18 = [v17 objectForKeyedSubscript:@"app_energy"];
  [v18 setObject:v16 forKey:@"bg_audio"];

  [(PLMetricsFormatterJSON *)self addSubKeysThirdLevel:v8 extractFromHere:v7 deviceFirstLevelMetric:&unk_1F400CD48 firstLevelKey:@"power_metrics" secondLevelKey:@"app_energy" thirdLevelKey:@"bg_audio" subKeyMap:self->appEnergyBGAudioMapping];
  uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v20 = [v8 objectForKeyedSubscript:@"power_metrics"];
  uint64_t v21 = [v20 objectForKeyedSubscript:@"app_energy"];
  [v21 setObject:v19 forKey:@"bg_location"];

  [(PLMetricsFormatterJSON *)self addSubKeysThirdLevel:v8 extractFromHere:v7 deviceFirstLevelMetric:&unk_1F400CD48 firstLevelKey:@"power_metrics" secondLevelKey:@"app_energy" thirdLevelKey:@"bg_location" subKeyMap:self->appEnergyBGLocationMapping];
}

- (void)addDiskIO:(id)a3 userData:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  id v10 = [v6 dictionary];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"performance_metrics"];
  [v9 setObject:v10 forKey:@"disk_io"];

  [(PLMetricsFormatterJSON *)self addSubKeys:v8 extractFromHere:v7 deviceFirstLevelMetric:&unk_1F400CD60 firstLevelKey:@"performance_metrics" secondLevelKey:@"disk_io" subKeyMap:self->diskIOMapping];
}

- (void)addAppPerformanceKeysLaunch:(id)a3 userData:(id)a4 launchTimeData:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  id v10 = [v7 objectForKeyedSubscript:@"performance_metrics"];
  [v10 setObject:v9 forKey:@"app_performance"];

  uint64_t v11 = [v7 objectForKeyedSubscript:@"app_bundleid"];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    id v13 = [v7 objectForKeyedSubscript:@"app_bundleid"];
    id v14 = [v8 objectForKeyedSubscript:v13];

    if (v14)
    {
      v48 = [MEMORY[0x1E4F1CA60] dictionary];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v15 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __78__PLMetricsFormatterJSON_addAppPerformanceKeysLaunch_userData_launchTimeData___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v15;
        if (addAppPerformanceKeysLaunch_userData_launchTimeData__defaultOnce != -1) {
          dispatch_once(&addAppPerformanceKeysLaunch_userData_launchTimeData__defaultOnce, block);
        }
        if (addAppPerformanceKeysLaunch_userData_launchTimeData__classDebugEnabled)
        {
          id v16 = NSString;
          uint64_t v17 = [v7 objectForKeyedSubscript:@"app_bundleid"];
          uint64_t v18 = [v8 objectForKeyedSubscript:v17];
          uint64_t v19 = [v16 stringWithFormat:@"This is the data object: %@ %@", @"app_bundleid", v18];

          uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m"];
          v22 = [v21 lastPathComponent];
          BOOL v23 = [NSString stringWithUTF8String:"-[PLMetricsFormatterJSON addAppPerformanceKeysLaunch:userData:launchTimeData:]"];
          [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:482];

          id v24 = PLLogCommon();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      id v25 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v26 = [v7 objectForKeyedSubscript:@"app_bundleid"];
      id v27 = [v8 objectForKeyedSubscript:v26];
      v28 = [v27 objectForKeyedSubscript:&unk_1F400CD78];
      [(PLMetricsFormatterJSON *)self roundArrayValuesToNearestX:v28 precision:50];
      uint64_t v30 = v29 = self;
      [v25 setObject:v30 forKeyedSubscript:@"sessions"];

      v31 = (void *)MEMORY[0x1E4F28ED0];
      id v32 = [v7 objectForKeyedSubscript:@"app_bundleid"];
      id v33 = [v8 objectForKeyedSubscript:v32];
      id v34 = [v33 objectForKeyedSubscript:&unk_1F400CD78];
      uint64_t v35 = objc_msgSend(v31, "numberWithLong:", objc_msgSend(v34, "count"));
      [v25 setObject:v35 forKeyedSubscript:@"count"];

      id v36 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v37 = [v7 objectForKeyedSubscript:@"app_bundleid"];
      long long v38 = [v8 objectForKeyedSubscript:v37];
      long long v39 = [v38 objectForKeyedSubscript:&unk_1F400CD90];
      long long v40 = [(PLMetricsFormatterJSON *)v29 roundArrayValuesToNearestX:v39 precision:50];
      [v36 setObject:v40 forKeyedSubscript:@"sessions"];

      long long v41 = (void *)MEMORY[0x1E4F28ED0];
      long long v42 = [v7 objectForKeyedSubscript:@"app_bundleid"];
      uint64_t v43 = [v8 objectForKeyedSubscript:v42];
      v44 = [v43 objectForKeyedSubscript:&unk_1F400CD90];
      uint64_t v45 = objc_msgSend(v41, "numberWithLong:", objc_msgSend(v44, "count"));
      [v36 setObject:v45 forKeyedSubscript:@"count"];

      [v48 setObject:v25 forKeyedSubscript:@"fg"];
      [v48 setObject:v36 forKeyedSubscript:@"bg"];
      v46 = [v7 objectForKeyedSubscript:@"performance_metrics"];
      v47 = [v46 objectForKeyedSubscript:@"app_performance"];
      [v47 setObject:v48 forKey:@"launch"];
    }
  }
}

uint64_t __78__PLMetricsFormatterJSON_addAppPerformanceKeysLaunch_userData_launchTimeData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  addAppPerformanceKeysLaunch_userData_launchTimeData__classDebugEnabled = result;
  return result;
}

- (void)addAppPerformanceKeysActivations:(id)a3 activationData:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"app_bundleid"];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    id v10 = [v6 objectForKeyedSubscript:@"app_bundleid"];
    uint64_t v11 = [v7 objectForKeyedSubscript:v10];

    if (v11)
    {
      v58 = v6;
      uint64_t v12 = [v6 objectForKeyedSubscript:@"app_bundleid"];
      id v57 = v7;
      id v13 = [v7 objectForKeyedSubscript:v12];
      id v14 = (void *)[v13 mutableCopy];

      v60 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v61 = v14;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      uint64_t v15 = [v14 objectForKeyedSubscript:&unk_1F400CD78];
      id v16 = [v15 allKeys];

      uint64_t v17 = [v16 countByEnumeratingWithState:&v68 objects:v73 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v69 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            v22 = [v61 objectForKeyedSubscript:&unk_1F400CD78];
            BOOL v23 = [v22 objectForKeyedSubscript:v21];
            id v24 = [(PLMetricsFormatterJSON *)self roundArrayValuesToNearestX:v23 precision:50];
            id v25 = [v21 stringValue];
            [v60 setObject:v24 forKeyedSubscript:v25];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v68 objects:v73 count:16];
        }
        while (v18);
      }

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v26 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __74__PLMetricsFormatterJSON_addAppPerformanceKeysActivations_activationData___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v26;
        if (addAppPerformanceKeysActivations_activationData__defaultOnce != -1) {
          dispatch_once(&addAppPerformanceKeysActivations_activationData__defaultOnce, block);
        }
        if (addAppPerformanceKeysActivations_activationData__classDebugEnabled)
        {
          id v27 = NSString;
          v28 = [v58 objectForKeyedSubscript:@"app_bundleid"];
          v29 = [v27 stringWithFormat:@"%@ FG Activation Data: %@", v28, v60];

          uint64_t v30 = (void *)MEMORY[0x1E4F929B8];
          v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m"];
          id v32 = [v31 lastPathComponent];
          id v33 = [NSString stringWithUTF8String:"-[PLMetricsFormatterJSON addAppPerformanceKeysActivations:activationData:]"];
          [v30 logMessage:v29 fromFile:v32 fromFunction:v33 fromLineNumber:517];

          id v34 = PLLogCommon();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      v59 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      uint64_t v35 = [v61 objectForKeyedSubscript:&unk_1F400CD90];
      id v36 = [v35 allKeys];

      uint64_t v37 = [v36 countByEnumeratingWithState:&v63 objects:v72 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v64;
        do
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v64 != v39) {
              objc_enumerationMutation(v36);
            }
            long long v41 = *(void **)(*((void *)&v63 + 1) + 8 * j);
            long long v42 = [v61 objectForKeyedSubscript:&unk_1F400CD90];
            uint64_t v43 = [v42 objectForKeyedSubscript:v41];
            v44 = [(PLMetricsFormatterJSON *)self roundArrayValuesToNearestX:v43 precision:50];
            uint64_t v45 = [v41 stringValue];
            [v59 setObject:v44 forKeyedSubscript:v45];
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v63 objects:v72 count:16];
        }
        while (v38);
      }

      id v6 = v58;
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v46 = objc_opt_class();
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __74__PLMetricsFormatterJSON_addAppPerformanceKeysActivations_activationData___block_invoke_308;
        v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v62[4] = v46;
        if (addAppPerformanceKeysActivations_activationData__defaultOnce_306 != -1) {
          dispatch_once(&addAppPerformanceKeysActivations_activationData__defaultOnce_306, v62);
        }
        if (addAppPerformanceKeysActivations_activationData__classDebugEnabled_307)
        {
          v47 = NSString;
          v48 = [v58 objectForKeyedSubscript:@"app_bundleid"];
          v49 = [v47 stringWithFormat:@"%@ BG Activation Data: %@", v48, v59];

          v50 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v51 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m"];
          v52 = [v51 lastPathComponent];
          v53 = [NSString stringWithUTF8String:"-[PLMetricsFormatterJSON addAppPerformanceKeysActivations:activationData:]"];
          [v50 logMessage:v49 fromFile:v52 fromFunction:v53 fromLineNumber:522];

          v54 = PLLogCommon();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      [v61 removeObjectsForKeys:&unk_1F4013480];
      [v61 setObject:v60 forKeyedSubscript:@"fg"];
      [v61 setObject:v59 forKeyedSubscript:@"bg"];
      v55 = [v58 objectForKeyedSubscript:@"performance_metrics"];
      uint64_t v56 = [v55 objectForKeyedSubscript:@"app_performance"];
      [v56 setObject:v61 forKeyedSubscript:@"activation"];

      id v7 = v57;
    }
  }
}

uint64_t __74__PLMetricsFormatterJSON_addAppPerformanceKeysActivations_activationData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  addAppPerformanceKeysActivations_activationData__classDebugEnabled = result;
  return result;
}

uint64_t __74__PLMetricsFormatterJSON_addAppPerformanceKeysActivations_activationData___block_invoke_308(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  addAppPerformanceKeysActivations_activationData__classDebugEnabled_307 = result;
  return result;
}

- (void)addAppPerformanceKeysResume:(id)a3 userData:(id)a4 resumeTimeData:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 objectForKeyedSubscript:@"app_bundleid"];
  if (v9)
  {
    id v10 = (void *)v9;
    uint64_t v11 = [v7 objectForKeyedSubscript:@"app_bundleid"];
    uint64_t v12 = [v8 objectForKeyedSubscript:v11];

    if (v12)
    {
      id v13 = [MEMORY[0x1E4F1CA60] dictionary];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v14 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __78__PLMetricsFormatterJSON_addAppPerformanceKeysResume_userData_resumeTimeData___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v14;
        if (addAppPerformanceKeysResume_userData_resumeTimeData__defaultOnce != -1) {
          dispatch_once(&addAppPerformanceKeysResume_userData_resumeTimeData__defaultOnce, block);
        }
        if (addAppPerformanceKeysResume_userData_resumeTimeData__classDebugEnabled)
        {
          uint64_t v15 = NSString;
          id v16 = [v7 objectForKeyedSubscript:@"app_bundleid"];
          uint64_t v17 = [v8 objectForKeyedSubscript:v16];
          uint64_t v18 = [v15 stringWithFormat:@"This is the data object: %@ %@", @"app_bundleid", v17];

          uint64_t v19 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m"];
          uint64_t v21 = [v20 lastPathComponent];
          v22 = [NSString stringWithUTF8String:"-[PLMetricsFormatterJSON addAppPerformanceKeysResume:userData:resumeTimeData:]"];
          [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:550];

          BOOL v23 = PLLogCommon();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      id v24 = [v7 objectForKeyedSubscript:@"app_bundleid"];
      id v25 = [v8 objectForKeyedSubscript:v24];
      uint64_t v26 = [(PLMetricsFormatterJSON *)self roundArrayValuesToNearestX:v25 precision:5];
      [v13 setObject:v26 forKeyedSubscript:@"sessions"];

      id v27 = (void *)MEMORY[0x1E4F28ED0];
      v28 = [v7 objectForKeyedSubscript:@"app_bundleid"];
      v29 = [v8 objectForKeyedSubscript:v28];
      uint64_t v30 = objc_msgSend(v27, "numberWithLong:", objc_msgSend(v29, "count"));
      [v13 setObject:v30 forKeyedSubscript:@"count"];

      v31 = [v7 objectForKeyedSubscript:@"performance_metrics"];
      id v32 = [v31 objectForKeyedSubscript:@"app_performance"];
      [v32 setObject:v13 forKey:@"resume"];
    }
  }
}

uint64_t __78__PLMetricsFormatterJSON_addAppPerformanceKeysResume_userData_resumeTimeData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  addAppPerformanceKeysResume_userData_resumeTimeData__classDebugEnabled = result;
  return result;
}

- (void)addAppPerformanceKeysHang:(id)a3 userData:(id)a4 hangTimeData:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 objectForKeyedSubscript:@"app_bundleid"];
  if (v9)
  {
    id v10 = (void *)v9;
    uint64_t v11 = [v7 objectForKeyedSubscript:@"app_bundleid"];
    uint64_t v12 = [v8 objectForKeyedSubscript:v11];

    if (v12)
    {
      id v13 = [MEMORY[0x1E4F1CA60] dictionary];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v14 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __74__PLMetricsFormatterJSON_addAppPerformanceKeysHang_userData_hangTimeData___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v14;
        if (addAppPerformanceKeysHang_userData_hangTimeData__defaultOnce != -1) {
          dispatch_once(&addAppPerformanceKeysHang_userData_hangTimeData__defaultOnce, block);
        }
        if (addAppPerformanceKeysHang_userData_hangTimeData__classDebugEnabled)
        {
          uint64_t v15 = NSString;
          id v16 = [v7 objectForKeyedSubscript:@"app_bundleid"];
          uint64_t v17 = [v8 objectForKeyedSubscript:v16];
          uint64_t v18 = [v15 stringWithFormat:@"This is the data object: %@ %@", @"app_bundleid", v17];

          uint64_t v19 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m"];
          uint64_t v21 = [v20 lastPathComponent];
          v22 = [NSString stringWithUTF8String:"-[PLMetricsFormatterJSON addAppPerformanceKeysHang:userData:hangTimeData:]"];
          [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:578];

          BOOL v23 = PLLogCommon();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      id v24 = [v7 objectForKeyedSubscript:@"app_bundleid"];
      id v25 = [v8 objectForKeyedSubscript:v24];
      uint64_t v26 = [(PLMetricsFormatterJSON *)self roundArrayValuesToNearestX:v25 precision:10];
      [v13 setObject:v26 forKeyedSubscript:@"sessions"];

      id v27 = (void *)MEMORY[0x1E4F28ED0];
      v28 = [v7 objectForKeyedSubscript:@"app_bundleid"];
      v29 = [v8 objectForKeyedSubscript:v28];
      uint64_t v30 = objc_msgSend(v27, "numberWithLong:", objc_msgSend(v29, "count"));
      [v13 setObject:v30 forKeyedSubscript:@"count"];

      v31 = [v7 objectForKeyedSubscript:@"performance_metrics"];
      id v32 = [v31 objectForKeyedSubscript:@"app_performance"];
      [v32 setObject:v13 forKey:@"hang"];
    }
  }
}

uint64_t __74__PLMetricsFormatterJSON_addAppPerformanceKeysHang_userData_hangTimeData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  addAppPerformanceKeysHang_userData_hangTimeData__classDebugEnabled = result;
  return result;
}

- (void)addAppPerformanceKeysGlitch:(id)a3 scrollGlitchData:(id)a4
{
  id v16 = a3;
  id v5 = a4;
  uint64_t v6 = [v16 objectForKeyedSubscript:@"app_bundleid"];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [v16 objectForKeyedSubscript:@"app_bundleid"];
    uint64_t v9 = [v5 objectForKeyedSubscript:v8];

    if (v9)
    {
      id v10 = (void *)MEMORY[0x1E4F1CA60];
      uint64_t v11 = [v16 objectForKeyedSubscript:@"app_bundleid"];
      uint64_t v12 = [v5 objectForKeyedSubscript:v11];
      id v13 = [v10 dictionaryWithDictionary:v12];

      uint64_t v14 = [v16 objectForKeyedSubscript:@"performance_metrics"];
      uint64_t v15 = [v14 objectForKeyedSubscript:@"app_performance"];
      [v15 setObject:v13 forKey:@"animation"];
    }
  }
}

- (void)addAppPerformanceKeysExits:(id)a3 processExitData:(id)a4
{
  id v19 = a3;
  id v5 = a4;
  uint64_t v6 = [v19 objectForKeyedSubscript:@"app_bundleid"];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [v19 objectForKeyedSubscript:@"app_bundleid"];
    uint64_t v9 = [v5 objectForKeyedSubscript:v8];

    if (v9)
    {
      id v10 = [v19 objectForKeyedSubscript:@"app_bundleid"];
      uint64_t v11 = [v5 objectForKeyedSubscript:v10];
      uint64_t v12 = (void *)[v11 mutableCopy];

      id v13 = [v12 objectForKeyedSubscript:&unk_1F400CD78];
      uint64_t v14 = +[PLMetricsFormatterMetricKit categorizeAppExits:v13];

      uint64_t v15 = [v12 objectForKeyedSubscript:&unk_1F400CD90];
      id v16 = +[PLMetricsFormatterMetricKit categorizeAppExits:v15];

      [v12 removeObjectsForKeys:&unk_1F4013498];
      [v12 setObject:v14 forKey:@"fg"];
      [v12 setObject:v16 forKey:@"bg"];
      uint64_t v17 = [v19 objectForKeyedSubscript:@"performance_metrics"];
      uint64_t v18 = [v17 objectForKeyedSubscript:@"app_performance"];
      [v18 setObject:v12 forKeyedSubscript:@"processExits"];
    }
  }
}

- (void)addAppMemoryKeys:(id)a3 userData:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  id v10 = [v6 dictionary];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"performance_metrics"];
  [v9 setObject:v10 forKey:@"memory"];

  [(PLMetricsFormatterJSON *)self addSubKeys:v8 extractFromHere:v7 deviceFirstLevelMetric:&unk_1F400CD60 firstLevelKey:@"performance_metrics" secondLevelKey:@"memory" subKeyMap:self->memoryMapping];
}

- (void)addPowerMetrics:(id)a3 userData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PLMetricsFormatterJSON *)self addAppTime:v7 userData:v6];
  [(PLMetricsFormatterJSON *)self addNetworkIO:v7 userData:v6];
  [(PLMetricsFormatterJSON *)self addDisplayAPL:v7 userData:v6];
  [(PLMetricsFormatterJSON *)self addAppEnergy:v7 userData:v6];
}

- (void)addPerformanceMetrics:(id)a3 userData:(id)a4 signpostData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v16 = a3;
  [(PLMetricsFormatterJSON *)self addDiskIO:v16 userData:v9];
  id v10 = [v8 objectForKeyedSubscript:@"launchDurations"];
  [(PLMetricsFormatterJSON *)self addAppPerformanceKeysLaunch:v16 userData:v9 launchTimeData:v10];

  uint64_t v11 = [v8 objectForKeyedSubscript:@"resumeDurations"];
  [(PLMetricsFormatterJSON *)self addAppPerformanceKeysResume:v16 userData:v9 resumeTimeData:v11];

  uint64_t v12 = [v8 objectForKeyedSubscript:@"hangDurations"];
  [(PLMetricsFormatterJSON *)self addAppPerformanceKeysHang:v16 userData:v9 hangTimeData:v12];

  id v13 = [v8 objectForKeyedSubscript:@"scrollGlitches"];
  [(PLMetricsFormatterJSON *)self addAppPerformanceKeysGlitch:v16 scrollGlitchData:v13];

  uint64_t v14 = [v8 objectForKeyedSubscript:@"processExits"];
  [(PLMetricsFormatterJSON *)self addAppPerformanceKeysExits:v16 processExitData:v14];

  uint64_t v15 = [v8 objectForKeyedSubscript:@"activationDurations"];

  [(PLMetricsFormatterJSON *)self addAppPerformanceKeysActivations:v16 activationData:v15];
  [(PLMetricsFormatterJSON *)self addAppMemoryKeys:v16 userData:v9];
}

- (void)addAppMetaData:(id)a3 userData:(id)a4
{
  id v5 = a3;
  id v6 = [a4 objectForKeyedSubscript:&unk_1F400CDA8];
  [v5 addEntriesFromDictionary:v6];
}

- (void)addAllMetrics:(id)a3 signpostData:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v19 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v6;
  uint64_t v20 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v7);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x1E4E7EF70]();
        uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
        id v13 = [MEMORY[0x1E4F1CA60] dictionary];
        [v11 setObject:v12 forKey:@"power_metrics"];
        [v11 setObject:v13 forKey:@"performance_metrics"];
        uint64_t v14 = [v7 objectForKeyedSubscript:v9];
        [(PLMetricsFormatterJSON *)self addAppMetaData:v11 userData:v14];

        uint64_t v15 = [v7 objectForKeyedSubscript:v9];
        [(PLMetricsFormatterJSON *)self addPowerMetrics:v11 userData:v15];

        id v16 = [v7 objectForKeyedSubscript:v9];
        [(PLMetricsFormatterJSON *)self addPerformanceMetrics:v11 userData:v16 signpostData:v19];

        uint64_t v17 = [(PLMetricsFormatterJSON *)self sanitizeDictionary:v11];
        [(PLMetricsFormatterJSON *)self addAppMetric:v17];
        [(PLMetricsFormatterJSON *)self sendAppMetricToCoreAnalytics:v17];

        ++v8;
      }
      while (v20 != v8);
      uint64_t v20 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v20);
  }
}

- (void)addGlobalMetaData:(id)a3
{
}

- (id)sanitizeDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = [v3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v10 = [v3 objectForKeyedSubscript:v9];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v3 objectForKeyedSubscript:v9];
          uint64_t v12 = [v11 count];

          if (!v12) {
            goto LABEL_10;
          }
          id v10 = [v3 objectForKeyedSubscript:v9];
          id v13 = [(PLMetricsFormatterJSON *)self sanitizeDictionary:v10];
          [v3 setObject:v13 forKeyedSubscript:v9];
        }
LABEL_10:
        uint64_t v14 = [v3 objectForKeyedSubscript:v9];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = [v3 objectForKeyedSubscript:v9];
          uint64_t v16 = [v15 count];

          if (!v16) {
            [v3 removeObjectForKey:v9];
          }
        }
        else
        {
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)getOSVersion
{
  if (getOSVersion_onceToken != -1) {
    dispatch_once(&getOSVersion_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)getOSVersion_osVersion;
  return v2;
}

void __38__PLMetricsFormatterJSON_getOSVersion__block_invoke()
{
  id v6 = (id)_CFCopySupplementalVersionDictionary();
  if (v6)
  {
    id v0 = [NSString alloc];
    v1 = [v6 objectForKeyedSubscript:@"ProductName"];
    v2 = [v6 objectForKeyedSubscript:@"ProductVersion"];
    id v3 = [v6 objectForKeyedSubscript:@"ProductBuildVersion"];
    uint64_t v4 = [v0 initWithFormat:@"%@ %@ (%@)", v1, v2, v3];
    uint64_t v5 = (void *)getOSVersion_osVersion;
    getOSVersion_osVersion = v4;
  }
  else
  {
    v1 = (void *)getOSVersion_osVersion;
    getOSVersion_osVersion = 0;
  }
}

- (id)createHeaderForSessionsFile
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PLMetricsFormatterJSON *)self getOSVersion];
  id v3 = (void *)v2;
  v7[0] = @"bug_type";
  v7[1] = @"os_version";
  uint64_t v4 = @"<unknown>";
  if (v2) {
    uint64_t v4 = (__CFString *)v2;
  }
  v8[0] = @"278";
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (BOOL)writeSessionFile
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(PLMetricsFormatterJSON *)self setLogFileTimeStamp:v3];

  uint64_t v4 = [(PLMetricsFormatterJSON *)self getCurrentTimeFormatted:1];
  [(NSMutableDictionary *)self->allMetrics setObject:v4 forKey:@"log_timestamp"];
  uint64_t v5 = [(PLMetricsFormatterJSON *)self createHeaderForSessionsFile];
  id v6 = [(PLMetricsFormatterJSON *)self getFileHandle];
  id v16 = 0;
  uint64_t v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:&v16];
  id v8 = v16;
  [v6 writeData:v7];

  uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"\n" length:1];
  [v6 writeData:v9];

  [(PLMetricsFormatterJSON *)self pruneJSONData];
  allMetrics = self->allMetrics;
  id v15 = v8;
  uint64_t v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:allMetrics options:1 error:&v15];
  id v12 = v15;

  [v6 writeData:v11];
  id v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"\n" length:1];
  [v6 writeData:v13];

  [v6 closeFile];
  LOBYTE(self) = [(PLMetricsFormatterJSON *)self moveLogFile];

  return (char)self;
}

- (BOOL)moveLogFile
{
  id v3 = [(PLMetricsFormatterJSON *)self getCurrentTimeFormatted:0];
  uint64_t v4 = [@"/tmp/powerlog/" stringByAppendingFormat:@"log-power-%@.session", v3];

  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [NSString stringWithUTF8String:self->tmpFilePath];
  id v21 = 0;
  [v5 moveItemAtPath:v6 toPath:v4 error:&v21];
  id v7 = v21;

  id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
  int v9 = OSAMoveFileForSubmissions();

  if (!v9)
  {
    id v13 = PLLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PLMetricsFormatterJSON moveLogFile]();
    }
    goto LABEL_11;
  }
  id v10 = [v4 lastPathComponent];
  uint64_t v11 = [@"/var/mobile/Library/Logs/CrashReporter/" stringByAppendingPathComponent:v10];
  +[PLUtilities markFileAsPurgeable:v11 withUrgency:512];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PLMetricsFormatterJSON_moveLogFile__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v12;
    if (moveLogFile_defaultOnce != -1) {
      dispatch_once(&moveLogFile_defaultOnce, block);
    }
    if (moveLogFile_classDebugEnabled)
    {
      id v13 = [NSString stringWithFormat:@"Power log: written to %@", v4];
      uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
      id v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m"];
      id v16 = [v15 lastPathComponent];
      uint64_t v17 = [NSString stringWithUTF8String:"-[PLMetricsFormatterJSON moveLogFile]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:819];

      uint64_t v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }

LABEL_11:
    }
  }

  return v9;
}

uint64_t __37__PLMetricsFormatterJSON_moveLogFile__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  moveLogFile_classDebugEnabled = result;
  return result;
}

- (void)addAppMetric:(id)a3
{
  allMetrics = self->allMetrics;
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)allMetrics objectForKeyedSubscript:@"metrics"];
  [v5 addObject:v4];
}

- (void)sendAppMetricToCoreAnalytics:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"power_metrics"];

  if (v4)
  {
    id v5 = objc_opt_new();
    id v6 = [v3 objectForKeyedSubscript:@"app_bundleid"];
    [v5 setObject:v6 forKeyedSubscript:@"app_bundleid"];

    id v7 = [v3 objectForKeyedSubscript:@"power_metrics"];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"app_time"];
    if (v8)
    {
      int v9 = (void *)v8;
      id v10 = [v3 objectForKeyedSubscript:@"power_metrics"];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"app_time"];
      uint64_t v12 = [v11 objectForKeyedSubscript:@"cellular_condition"];

      if (v12)
      {
        id v13 = v5;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v14 = [v3 objectForKeyedSubscript:@"power_metrics"];
        id v15 = [v14 objectForKeyedSubscript:@"app_time"];
        id v16 = [v15 objectForKeyedSubscript:@"cellular_condition"];

        id obj = v16;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v61 objects:v66 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v62;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v62 != v19) {
                objc_enumerationMutation(obj);
              }
              uint64_t v21 = *(void *)(*((void *)&v61 + 1) + 8 * v20);
              [v3 objectForKeyedSubscript:@"power_metrics"];
              long long v23 = v22 = v3;
              uint64_t v24 = [v23 objectForKeyedSubscript:@"app_time"];
              id v25 = [v24 objectForKeyedSubscript:@"cellular_condition"];
              uint64_t v26 = [v25 objectForKeyedSubscript:v21];
              [v13 setObject:v26 forKeyedSubscript:v21];

              id v3 = v22;
              ++v20;
            }
            while (v18 != v20);
            uint64_t v18 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
          }
          while (v18);
        }

        id v5 = v13;
      }
    }
    else
    {
    }
    id v27 = [v3 objectForKeyedSubscript:@"power_metrics"];
    v28 = [v27 objectForKeyedSubscript:@"network_io"];

    if (v28)
    {
      v29 = [v3 objectForKeyedSubscript:@"power_metrics"];
      uint64_t v30 = [v29 objectForKeyedSubscript:@"network_io"];
      v31 = v5;
      id v32 = [v30 objectForKeyedSubscript:@"cellular"];
      [v32 objectForKeyedSubscript:@"totalDownload"];
      id v33 = obja = v3;
      id v34 = [NSString stringWithFormat:@"%@_%@", @"cellular", @"totalDownload"];
      [v5 setObject:v33 forKeyedSubscript:v34];

      uint64_t v35 = [obja objectForKeyedSubscript:@"power_metrics"];
      id v36 = [v35 objectForKeyedSubscript:@"network_io"];
      uint64_t v37 = [v36 objectForKeyedSubscript:@"cellular"];
      uint64_t v38 = [v37 objectForKeyedSubscript:@"totalUpload"];
      uint64_t v39 = [NSString stringWithFormat:@"%@_%@", @"cellular", @"totalUpload"];
      [v31 setObject:v38 forKeyedSubscript:v39];

      long long v40 = [obja objectForKeyedSubscript:@"power_metrics"];
      long long v41 = [v40 objectForKeyedSubscript:@"network_io"];
      long long v42 = [v41 objectForKeyedSubscript:@"wifi"];
      uint64_t v43 = [v42 objectForKeyedSubscript:@"totalDownload"];
      v44 = [NSString stringWithFormat:@"%@_%@", @"wifi", @"totalDownload"];
      [v31 setObject:v43 forKeyedSubscript:v44];

      id v3 = obja;
      uint64_t v45 = [obja objectForKeyedSubscript:@"power_metrics"];
      uint64_t v46 = [v45 objectForKeyedSubscript:@"network_io"];
      v47 = [v46 objectForKeyedSubscript:@"wifi"];
      v48 = [v47 objectForKeyedSubscript:@"totalUpload"];
      id v5 = v31;
      v49 = [NSString stringWithFormat:@"%@_%@", @"wifi", @"totalUpload"];
      [v5 setObject:v48 forKeyedSubscript:v49];
    }
    v50 = [v3 objectForKeyedSubscript:@"power_metrics"];
    uint64_t v51 = [v50 objectForKeyedSubscript:@"display_apl"];

    if (v51)
    {
      v52 = [v3 objectForKeyedSubscript:@"power_metrics"];
      v53 = [v52 objectForKeyedSubscript:@"display_apl"];
      v54 = [v53 objectForKeyedSubscript:@"averagePixelLuminance"];
      [v5 setObject:v54 forKeyedSubscript:@"averagePixelLuminance"];

      v55 = [v3 objectForKeyedSubscript:@"power_metrics"];
      uint64_t v56 = [v55 objectForKeyedSubscript:@"display_apl"];
      id v57 = [v56 objectForKeyedSubscript:@"totalFrameCount"];
      [v5 setObject:v57 forKeyedSubscript:@"totalFrameCount"];
    }
    v58 = PLLogAggregateSummarizationService();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
      -[PLMetricsFormatterJSON sendAppMetricToCoreAnalytics:]();
    }

    AnalyticsSendEvent();
  }
  else
  {
    id v5 = PLLogAggregateSummarizationService();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_INFO, "No power_metrics to report to Core Analytics", buf, 2u);
    }
  }
}

- (id)getCurrentTimeFormatted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PLMetricsFormatterJSON *)self logFileTimeStamp];

  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    [(PLMetricsFormatterJSON *)self setLogFileTimeStamp:v6];
  }
  id v7 = [(PLMetricsFormatterJSON *)self logFileTimeStamp];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  int v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v8 setLocale:v9];
  if (v3)
  {
    id v10 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
    [v8 setTimeZone:v10];

    [v8 setDateFormat:@"yyyy-MM-dd'T'HH':'mm':'ssZZ"];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    [v8 setTimeZone:v11];
    [v8 setDateFormat:@"yyyy-MM-dd-HHmmss"];
  }
  uint64_t v12 = [v8 stringFromDate:v7];

  return v12;
}

- (id)getFileHandle
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!confstr(65537, __s, 0x400uLL)) {
    goto LABEL_10;
  }
  strlen(__s);
  __strncat_chk();
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLMetricsFormatterJSON_getFileHandle__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (getFileHandle_defaultOnce != -1) {
      dispatch_once(&getFileHandle_defaultOnce, block);
    }
    if (getFileHandle_classDebugEnabled)
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"\n\n\n\n\n%s\n\n\n", __s);
      id v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLMetricsFormatterJSON getFileHandle]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:921];

      int v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v10 = mkstemp(__s);
  if ((v10 + 1) >= 2
    && (uint64_t v13 = [objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v10]) != 0)
  {
    uint64_t v14 = (void *)v13;
    id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v23 = *MEMORY[0x1E4F28330];
    uint64_t v24 = &unk_1F400CDC0;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v17 = [NSString stringWithUTF8String:__s];
    id v21 = 0;
    char v18 = [v15 setAttributes:v16 ofItemAtPath:v17 error:&v21];
    id v19 = v21;

    if ((v18 & 1) == 0)
    {
      uint64_t v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[PLMetricsFormatterJSON getFileHandle]();
      }
    }
    strncpy(self->tmpFilePath, __s, 0x400uLL);
    id v11 = v14;
  }
  else
  {
LABEL_10:
    id v11 = 0;
  }
  return v11;
}

uint64_t __39__PLMetricsFormatterJSON_getFileHandle__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  getFileHandle_classDebugEnabled = result;
  return result;
}

- (void)test
{
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__PLMetricsFormatterJSON_test__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (test_defaultOnce != -1) {
      dispatch_once(&test_defaultOnce, block);
    }
    if (test_classDebugEnabled)
    {
      id v4 = [NSString stringWithFormat:@"Object has been successfully created (PLMetricsFormatterJSON)."];
      id v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLMetricsFormatterJSON test]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:950];

      int v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __30__PLMetricsFormatterJSON_test__block_invoke_430;
    v17[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v17[4] = v10;
    if (test_defaultOnce_428 != -1) {
      dispatch_once(&test_defaultOnce_428, v17);
    }
    if (test_classDebugEnabled_429)
    {
      id v11 = [NSString stringWithFormat:@"%@", self->allMetrics];
      uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m"];
      uint64_t v14 = [v13 lastPathComponent];
      id v15 = [NSString stringWithUTF8String:"-[PLMetricsFormatterJSON test]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:951];

      id v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __30__PLMetricsFormatterJSON_test__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  test_classDebugEnabled = result;
  return result;
}

uint64_t __30__PLMetricsFormatterJSON_test__block_invoke_430(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  test_classDebugEnabled_429 = result;
  return result;
}

- (id)metricsToStringAsJSON
{
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLMetricsFormatterJSON_metricsToStringAsJSON__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (metricsToStringAsJSON_defaultOnce != -1) {
      dispatch_once(&metricsToStringAsJSON_defaultOnce, block);
    }
    if (metricsToStringAsJSON_classDebugEnabled)
    {
      id v4 = [NSString stringWithFormat:@"Printing each key."];
      id v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLMetricsFormatterJSON metricsToStringAsJSON]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:956];

      int v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  allMetrics = self->allMetrics;
  id v29 = 0;
  id v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:allMetrics options:1 error:&v29];
  id v12 = v29;
  if (v11)
  {
    uint64_t v13 = (__CFString *)[[NSString alloc] initWithData:v11 encoding:4];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __47__PLMetricsFormatterJSON_metricsToStringAsJSON__block_invoke_445;
      v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v27[4] = v14;
      if (metricsToStringAsJSON_defaultOnce_443 != -1) {
        dispatch_once(&metricsToStringAsJSON_defaultOnce_443, v27);
      }
      if (metricsToStringAsJSON_classDebugEnabled_444)
      {
        id v15 = [NSString stringWithFormat:@"\n"];
        id v16 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m"];
        char v18 = [v17 lastPathComponent];
        id v19 = [NSString stringWithUTF8String:"-[PLMetricsFormatterJSON metricsToStringAsJSON]"];
        [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:966];

        uint64_t v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
LABEL_22:
      }
    }
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v21 = objc_opt_class();
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __47__PLMetricsFormatterJSON_metricsToStringAsJSON__block_invoke_436;
      v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v28[4] = v21;
      if (metricsToStringAsJSON_defaultOnce_434 != -1) {
        dispatch_once(&metricsToStringAsJSON_defaultOnce_434, v28);
      }
      if (metricsToStringAsJSON_classDebugEnabled_435)
      {
        id v15 = [NSString stringWithFormat:@"Got an error: %@", v12];
        id v22 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m"];
        uint64_t v24 = [v23 lastPathComponent];
        id v25 = [NSString stringWithUTF8String:"-[PLMetricsFormatterJSON metricsToStringAsJSON]"];
        [v22 logMessage:v15 fromFile:v24 fromFunction:v25 fromLineNumber:962];

        uint64_t v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
        uint64_t v13 = @"{}";
        goto LABEL_22;
      }
    }
    uint64_t v13 = @"{}";
  }

  return v13;
}

uint64_t __47__PLMetricsFormatterJSON_metricsToStringAsJSON__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  metricsToStringAsJSON_classDebugEnabled = result;
  return result;
}

uint64_t __47__PLMetricsFormatterJSON_metricsToStringAsJSON__block_invoke_436(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  metricsToStringAsJSON_classDebugEnabled_435 = result;
  return result;
}

uint64_t __47__PLMetricsFormatterJSON_metricsToStringAsJSON__block_invoke_445(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  metricsToStringAsJSON_classDebugEnabled_444 = result;
  return result;
}

- (void)printAllMetricsToConsole
{
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __50__PLMetricsFormatterJSON_printAllMetricsToConsole__block_invoke;
    id v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v3;
    if (printAllMetricsToConsole_defaultOnce != -1) {
      dispatch_once(&printAllMetricsToConsole_defaultOnce, &block);
    }
    if (printAllMetricsToConsole_classDebugEnabled)
    {
      id v4 = NSString;
      id v5 = [(PLMetricsFormatterJSON *)self metricsToStringAsJSON];
      id v6 = [v4 stringWithFormat:@"%@", v5, block, v13, v14, v15, v16];

      id v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m"];
      int v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLMetricsFormatterJSON printAllMetricsToConsole]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:973];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __50__PLMetricsFormatterJSON_printAllMetricsToConsole__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  printAllMetricsToConsole_classDebugEnabled = result;
  return result;
}

- (void)pruneJSONData
{
  if (![(PLMetricsFormatterJSON *)self testAllMetrics])
  {
    uint64_t v3 = +[PLUtilities getSessionsAllowlist];
    if (v3)
    {
      id v4 = [(NSMutableDictionary *)self->allMetrics allKeys];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __39__PLMetricsFormatterJSON_pruneJSONData__block_invoke;
      v5[3] = &unk_1E6E49128;
      id v6 = v3;
      id v7 = self;
      [v4 enumerateObjectsUsingBlock:v5];
    }
  }
}

void __39__PLMetricsFormatterJSON_pruneJSONData__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    int v6 = [v4 isEqualToString:@"metrics"];

    if (!v6) {
      return;
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = *(void **)(*(void *)(a1 + 40) + 16);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __39__PLMetricsFormatterJSON_pruneJSONData__block_invoke_2;
    id v12 = &unk_1E6E49100;
    id v13 = *(id *)(a1 + 32);
    id v14 = v7;
    id v4 = v7;
    [v8 enumerateObjectsUsingBlock:&v9];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "setObject:forKey:", v4, @"metrics", v9, v10, v11, v12);
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 8) removeObjectForKey:v4];
  }
}

void __39__PLMetricsFormatterJSON_pruneJSONData__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 mutableCopy];
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"metrics"];
  id v5 = +[PLMetricsFormatterJSON pruneDictionary:v3 withAllowlist:v4];

  [*(id *)(a1 + 40) addObject:v5];
}

+ (id)pruneDictionary:(id)a3 withAllowlist:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 allKeys];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__PLMetricsFormatterJSON_pruneDictionary_withAllowlist___block_invoke;
  v14[3] = &unk_1E6E49150;
  id v15 = v7;
  id v9 = v6;
  id v16 = v9;
  id v17 = a1;
  id v10 = v7;
  [v8 enumerateObjectsUsingBlock:v14];

  id v11 = v16;
  id v12 = v9;

  return v12;
}

void __56__PLMetricsFormatterJSON_pruneDictionary_withAllowlist___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  uint64_t v3 = (void *)MEMORY[0x1E4E7EF70]();
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v15];

  id v5 = *(void **)(a1 + 40);
  if (v4)
  {
    id v6 = [v5 objectForKeyedSubscript:v15];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v15];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_9;
      }
      id v9 = *(void **)(a1 + 48);
      id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v15];
      id v11 = (void *)[v10 mutableCopy];
      id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v15];
      id v6 = [v9 pruneDictionary:v11 withAllowlist:v12];

      uint64_t v13 = [v6 count];
      id v14 = *(void **)(a1 + 40);
      if (v13) {
        [v14 setObject:v6 forKey:v15];
      }
      else {
        [v14 removeObjectForKey:v15];
      }
    }
  }
  else
  {
    [v5 removeObjectForKey:v15];
  }
LABEL_9:
}

- (BOOL)testAllMetrics
{
  if (testAllMetrics_defaultOnce != -1) {
    dispatch_once(&testAllMetrics_defaultOnce, &__block_literal_global_452);
  }
  return testAllMetrics_allowMetrics;
}

void __40__PLMetricsFormatterJSON_testAllMetrics__block_invoke()
{
  id v0 = [MEMORY[0x1E4F929C0] objectForKey:@"TestAllMetricsJSON" forApplicationID:@"com.apple.powerlogd" synchronize:1];
  testAllMetrics_allowMetrics = [v0 BOOLValue];
}

- (NSDate)logFileTimeStamp
{
  return (NSDate *)objc_getProperty(self, a2, 1176, 1);
}

- (void)setLogFileTimeStamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logFileTimeStamp, 0);
  objc_storeStrong((id *)&self->memoryMapping, 0);
  objc_storeStrong((id *)&self->diskIOMapping, 0);
  objc_storeStrong((id *)&self->appEnergyBGLocationMapping, 0);
  objc_storeStrong((id *)&self->appEnergyBGAudioMapping, 0);
  objc_storeStrong((id *)&self->appEnergyTotalMapping, 0);
  objc_storeStrong((id *)&self->appEnergyBGMapping, 0);
  objc_storeStrong((id *)&self->appEnergyFGMapping, 0);
  objc_storeStrong((id *)&self->appDisplayAPLMapping, 0);
  objc_storeStrong((id *)&self->appNetworkIOCellularMapping, 0);
  objc_storeStrong((id *)&self->appNetworkIOWifiMapping, 0);
  objc_storeStrong((id *)&self->appTimeCellularConditionMapping, 0);
  objc_storeStrong((id *)&self->appTimeLocationActivityMapping, 0);
  objc_storeStrong((id *)&self->appTimeUnpluggedMapping, 0);
  objc_storeStrong((id *)&self->appBGTimeUpMapping, 0);
  objc_storeStrong((id *)&self->appBGTimeMapping, 0);
  objc_storeStrong((id *)&self->appTimeMapping, 0);
  objc_storeStrong((id *)&self->metricArray, 0);
  objc_storeStrong((id *)&self->allMetrics, 0);
}

- (void)moveLogFile
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1E4220000, v0, OS_LOG_TYPE_ERROR, "Couldn't move tempSession from %@ using OSAMoveFileForSubmissions", v1, 0xCu);
}

- (void)sendAppMetricToCoreAnalytics:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Sending saniztized app metric data to Core Analytics: %@", v2, v3, v4, v5, v6);
}

- (void)getFileHandle
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1E4220000, v1, OS_LOG_TYPE_ERROR, "Couldn't change the permissions of tempSession log at %s. Error: %@", v2, 0x16u);
}

@end