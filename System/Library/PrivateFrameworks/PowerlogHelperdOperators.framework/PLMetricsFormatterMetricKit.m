@interface PLMetricsFormatterMetricKit
+ (id)categorizeAppExits:(id)a3;
+ (id)decodeExitWithDomain:(unsigned int)a3 withCode:(unint64_t)a4;
- (BOOL)hangtracerEnabled:(id)a3;
- (BOOL)processHangs;
- (PLMetricsFormatterMetricKit)init;
- (id)constructCellularData:(id)a3;
- (id)constructCellularHistogram:(id)a3;
- (id)constructHistogramBucketsWithDuration:(int)a3 andData:(id)a4;
- (id)constructPayloadWithMetrics:(id)a3 andSignpostData:(id)a4 forDate:(id)a5;
- (id)constructSignpostIntervalDataWithDurations:(id)a3 withMetrics:(id)a4;
- (int)computeBucketEndWithDuration:(int)a3 andValue:(int)a4;
- (void)addBucketWithDuration:(int)a3 WithEnd:(int)a4 andCount:(unint64_t)a5 toList:(id)a6;
- (void)addBucketWithSignalBar:(signed __int16)a3 withTime:(id)a4 toList:(id)a5;
- (void)addPerfMetrics:(id)a3 toAppData:(id)a4;
- (void)addPowerMetrics:(id)a3 toAppData:(id)a4;
- (void)addSignpostData:(id)a3 forApp:(id)a4 toAppData:(id)a5;
- (void)addTelemetryForMetricInconsistencies:(id)a3;
- (void)analyticsLogSignpostsWithBundleId:(id)a3 withName:(id)a4 withCategory:(id)a5 withMetrics:(id)a6;
- (void)normalizeCellularData:(id)a3;
- (void)publishMetrics:(id)a3 andSignpostData:(id)a4 forDate:(id)a5;
- (void)setProcessHangs:(BOOL)a3;
@end

@implementation PLMetricsFormatterMetricKit

- (PLMetricsFormatterMetricKit)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLMetricsFormatterMetricKit;
  return [(PLMetricsFormatterMetricKit *)&v3 init];
}

- (void)publishMetrics:(id)a3 andSignpostData:(id)a4 forDate:(id)a5
{
  id v8 = a5;
  id v10 = [(PLMetricsFormatterMetricKit *)self constructPayloadWithMetrics:a3 andSignpostData:a4 forDate:v8];
  v9 = [MEMORY[0x1E4F77EC0] sharedManager];
  [v9 sendMetrics:v10 forDate:v8 andSourceID:2];
}

- (void)addTelemetryForMetricInconsistencies:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v53 = [v3 countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v53)
  {
    int v4 = 0;
    int v50 = 0;
    int v51 = 0;
    uint64_t v52 = *(void *)v60;
    id v48 = v3;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v60 != v52) {
          objc_enumerationMutation(v3);
        }
        v6 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v59 + 1) + 8 * i)];
        uint64_t v7 = [v6 signpostMetrics];
        if (v7)
        {
          id v8 = (void *)v7;
          uint64_t v54 = i;
          uint64_t v9 = [v6 cpuMetrics];
          if (v9)
          {
            id v10 = (void *)v9;
            v11 = [v6 diskIOMetrics];

            if (v11)
            {
              int v49 = v4;
              v12 = [v6 cpuMetrics];
              v13 = [v12 cumulativeCPUTime];
              v14 = [MEMORY[0x1E4F29180] milliseconds];
              v15 = [v13 measurementByConvertingToUnit:v14];
              [v15 doubleValue];
              double v17 = v16;

              v18 = [v6 diskIOMetrics];
              v19 = [v18 cumulativeLogicalWrites];
              v20 = [MEMORY[0x1E4F291D0] kilobytes];
              v21 = [v19 measurementByConvertingToUnit:v20];
              [v21 doubleValue];
              double v23 = v22;

              long long v57 = 0u;
              long long v58 = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              v24 = [v6 signpostMetrics];
              uint64_t v25 = [v24 countByEnumeratingWithState:&v55 objects:v63 count:16];
              if (v25)
              {
                uint64_t v26 = v25;
                uint64_t v27 = *(void *)v56;
                double v28 = 0.0;
                double v29 = 0.0;
                do
                {
                  for (uint64_t j = 0; j != v26; ++j)
                  {
                    if (*(void *)v56 != v27) {
                      objc_enumerationMutation(v24);
                    }
                    v31 = *(void **)(*((void *)&v55 + 1) + 8 * j);
                    v32 = [v31 signpostIntervalData];

                    if (v32)
                    {
                      v33 = [v31 signpostIntervalData];
                      v34 = [v33 cumulativeCPUTime];

                      if (v34)
                      {
                        v35 = [v31 signpostIntervalData];
                        v36 = [v35 cumulativeCPUTime];
                        v37 = [MEMORY[0x1E4F29180] milliseconds];
                        v38 = [v36 measurementByConvertingToUnit:v37];
                        [v38 doubleValue];
                        double v28 = v28 + v39;
                      }
                      v40 = [v31 signpostIntervalData];
                      v41 = [v40 cumulativeLogicalWrites];

                      if (v41)
                      {
                        v42 = [v31 signpostIntervalData];
                        v43 = [v42 cumulativeLogicalWrites];
                        v44 = [MEMORY[0x1E4F291D0] kilobytes];
                        v45 = [v43 measurementByConvertingToUnit:v44];
                        [v45 doubleValue];
                        double v29 = v29 + v46;
                      }
                    }
                  }
                  uint64_t v26 = [v24 countByEnumeratingWithState:&v55 objects:v63 count:16];
                }
                while (v26);
              }
              else
              {
                double v28 = 0.0;
                double v29 = 0.0;
              }
              ++v51;

              if (v17 >= v28) {
                int v47 = v50;
              }
              else {
                int v47 = v50 + 1;
              }
              int v50 = v47;
              if (v23 >= v29) {
                int v4 = v49;
              }
              else {
                int v4 = v49 + 1;
              }
              id v3 = v48;
            }
          }
          else
          {
          }
          uint64_t i = v54;
        }
      }
      uint64_t v53 = [v3 countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v53);
    if (v51 >= 1)
    {
      ADClientSetValueForScalarKey();
      ADClientSetValueForScalarKey();
      ADClientSetValueForScalarKey();
    }
  }
}

- (id)constructPayloadWithMetrics:(id)a3 andSignpostData:(id)a4 forDate:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v34 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v36 = self;
  self->_processHangs = [(PLMetricsFormatterMetricKit *)self hangtracerEnabled:v9];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v38;
    unint64_t v15 = 0x1E4F77000uLL;
    uint64_t v31 = *(void *)v38;
    id v32 = v11;
    v33 = v10;
    do
    {
      uint64_t v16 = 0;
      uint64_t v35 = v13;
      do
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * v16);
        if (objc_msgSend(*(id *)(v15 + 3784), "isMetricKitClient:", v17, v31))
        {
          id v18 = v9;
          v19 = [v11 objectForKeyedSubscript:v17];
          v20 = [v19 objectForKeyedSubscript:&unk_1F400CC40];

          v21 = [v11 objectForKeyedSubscript:v17];
          double v22 = [v21 objectForKeyedSubscript:&unk_1F400CC58];

          double v23 = [v11 objectForKeyedSubscript:v17];
          v24 = [v23 objectForKeyedSubscript:&unk_1F400CC70];

          if (v20)
          {
            uint64_t v25 = [v20 objectForKeyedSubscript:@"app_multiple_versions"];
            uint64_t v26 = [v25 BOOLValue];
          }
          else
          {
            uint64_t v26 = 0;
          }
          id v27 = objc_alloc(MEMORY[0x1E4F77EB8]);
          double v28 = [v34 dateByAddingTimeInterval:86400.0];
          double v29 = (void *)[v27 initPayloadDataWithMutipleAppVersions:v26 withTimeStampBegin:v34 withTimeStampEnd:v28 withMetrics:MEMORY[0x1E4F1CC08]];

          if (v22) {
            [(PLMetricsFormatterMetricKit *)v36 addPowerMetrics:v22 toAppData:v29];
          }
          id v9 = v18;
          uint64_t v14 = v31;
          if (v24) {
            [(PLMetricsFormatterMetricKit *)v36 addPerfMetrics:v24 toAppData:v29];
          }
          id v11 = v32;
          id v10 = v33;
          if (v9) {
            [(PLMetricsFormatterMetricKit *)v36 addSignpostData:v9 forApp:v17 toAppData:v29];
          }
          [v33 setObject:v29 forKey:v17];

          uint64_t v13 = v35;
          unint64_t v15 = 0x1E4F77000;
        }
        ++v16;
      }
      while (v13 != v16);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v13);
  }

  [(PLMetricsFormatterMetricKit *)v36 addTelemetryForMetricInconsistencies:v10];
  return v10;
}

- (void)addPowerMetrics:(id)a3 toAppData:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F28E28];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  id v9 = [v7 objectForKeyedSubscript:@"fgTime_Total"];
  [v9 doubleValue];
  double v11 = v10;
  uint64_t v12 = [MEMORY[0x1E4F29180] seconds];
  v123 = (void *)[v8 initWithDoubleValue:v12 unit:v11];

  id v13 = objc_alloc(MEMORY[0x1E4F28E28]);
  uint64_t v14 = [v7 objectForKeyedSubscript:@"bgTime_Total"];
  [v14 doubleValue];
  double v16 = v15;
  uint64_t v17 = [MEMORY[0x1E4F29180] seconds];
  v122 = (void *)[v13 initWithDoubleValue:v17 unit:v16];

  id v18 = objc_alloc(MEMORY[0x1E4F28E28]);
  v19 = [v7 objectForKeyedSubscript:@"bgTime_Audio"];
  [v19 doubleValue];
  double v21 = v20;
  double v22 = [MEMORY[0x1E4F29180] seconds];
  v120 = (void *)[v18 initWithDoubleValue:v22 unit:v21];

  id v23 = objc_alloc(MEMORY[0x1E4F28E28]);
  v24 = [v7 objectForKeyedSubscript:@"bgTime_Location"];
  [v24 doubleValue];
  double v26 = v25;
  id v27 = [MEMORY[0x1E4F29180] seconds];
  v119 = (void *)[v23 initWithDoubleValue:v27 unit:v26];

  id v121 = (id)[objc_alloc(MEMORY[0x1E4F35AB8]) initWithCumulativeForegroundTimeMeasurement:v123 cumulativeBackgroundTimeMeasurement:v122 cumulativeBackgroundAudioTimeMeasurement:v120 cumulativeBackgroundLocationTimeMeasurement:v119];
  [v6 setApplicationTimeMetrics:v121];
  id v28 = objc_alloc(MEMORY[0x1E4F28E28]);
  double v29 = [v7 objectForKeyedSubscript:@"CPUTime"];
  [v29 doubleValue];
  double v31 = v30;
  id v32 = [MEMORY[0x1E4F29180] seconds];
  v118 = (void *)[v28 initWithDoubleValue:v32 unit:v31];

  v33 = [v7 objectForKeyedSubscript:@"CPUInstructions"];
  unint64_t v34 = [v33 unsignedIntegerValue] / 0x3E8uLL;

  id v35 = objc_alloc(MEMORY[0x1E4F28E28]);
  double v36 = (double)v34;
  long long v37 = (void *)[objc_alloc(MEMORY[0x1E4F29148]) initWithSymbol:@"kiloinstructions"];
  v116 = (void *)[v35 initWithDoubleValue:v37 unit:v36];

  v117 = (void *)[objc_alloc(MEMORY[0x1E4F35AD0]) initWithCumulativeCPUTimeMeasurement:v118 withCumulativeCPUInstructions:v116];
  v125 = v6;
  [v6 setCpuMetrics:v117];
  id v38 = objc_alloc(MEMORY[0x1E4F28E28]);
  long long v39 = [v7 objectForKeyedSubscript:@"GPUTime"];
  [v39 doubleValue];
  double v41 = v40;
  uint64_t v42 = [MEMORY[0x1E4F29180] seconds];
  v115 = (void *)[v38 initWithDoubleValue:v42 unit:v41];

  v114 = (void *)[objc_alloc(MEMORY[0x1E4F35AF8]) initWithCumulativeGPUTimeMeasurement:v115];
  [v6 setGpuMetrics:v114];
  id v43 = objc_alloc(MEMORY[0x1E4F28E28]);
  v44 = [v7 objectForKeyedSubscript:@"bytesWifiOut"];
  double v45 = (double)((unint64_t)[v44 unsignedIntegerValue] >> 10);
  double v46 = [MEMORY[0x1E4F291D0] kilobytes];
  v113 = (void *)[v43 initWithDoubleValue:v46 unit:v45];

  id v47 = objc_alloc(MEMORY[0x1E4F28E28]);
  id v48 = [v7 objectForKeyedSubscript:@"bytesWifiIn"];
  double v49 = (double)((unint64_t)[v48 unsignedIntegerValue] >> 10);
  int v50 = [MEMORY[0x1E4F291D0] kilobytes];
  v112 = (void *)[v47 initWithDoubleValue:v50 unit:v49];

  id v51 = objc_alloc(MEMORY[0x1E4F28E28]);
  uint64_t v52 = [v7 objectForKeyedSubscript:@"bytesCellularOut"];
  double v53 = (double)((unint64_t)[v52 unsignedIntegerValue] >> 10);
  uint64_t v54 = [MEMORY[0x1E4F291D0] kilobytes];
  v110 = (void *)[v51 initWithDoubleValue:v54 unit:v53];

  id v55 = objc_alloc(MEMORY[0x1E4F28E28]);
  long long v56 = [v7 objectForKeyedSubscript:@"bytesCellularIn"];
  double v57 = (double)((unint64_t)[v56 unsignedIntegerValue] >> 10);
  long long v58 = [MEMORY[0x1E4F291D0] kilobytes];
  v109 = (void *)[v55 initWithDoubleValue:v58 unit:v57];

  v111 = (void *)[objc_alloc(MEMORY[0x1E4F35B18]) initWithCumulativeWifiUploadMeasurement:v113 cumulativeWifiDownloadMeasurement:v112 cumulativeCellularUploadMeasurement:v110 cumulativeCellularDownloadMeasurement:v109];
  [v6 setNetworkTransferMetrics:v111];
  id v59 = objc_alloc(MEMORY[0x1E4F28E28]);
  long long v60 = [v7 objectForKeyedSubscript:@"BestAccuracy"];
  [v60 doubleValue];
  double v62 = v61;
  v63 = [MEMORY[0x1E4F29180] seconds];
  v108 = (void *)[v59 initWithDoubleValue:v63 unit:v62];

  id v64 = objc_alloc(MEMORY[0x1E4F28E28]);
  uint64_t v65 = [v7 objectForKeyedSubscript:@"BestAccuracyForNavigation"];
  [v65 doubleValue];
  double v67 = v66;
  v68 = [MEMORY[0x1E4F29180] seconds];
  v107 = (void *)[v64 initWithDoubleValue:v68 unit:v67];

  id v69 = objc_alloc(MEMORY[0x1E4F28E28]);
  v70 = [v7 objectForKeyedSubscript:@"NearestTenMetersAccuracy"];
  [v70 doubleValue];
  double v72 = v71;
  v73 = [MEMORY[0x1E4F29180] seconds];
  v106 = (void *)[v69 initWithDoubleValue:v73 unit:v72];

  id v74 = objc_alloc(MEMORY[0x1E4F28E28]);
  v75 = [v7 objectForKeyedSubscript:@"HundredMetersAccuracy"];
  [v75 doubleValue];
  double v77 = v76;
  v78 = [MEMORY[0x1E4F29180] seconds];
  v105 = (void *)[v74 initWithDoubleValue:v78 unit:v77];

  id v79 = objc_alloc(MEMORY[0x1E4F28E28]);
  v80 = [v7 objectForKeyedSubscript:@"KilometerAccuracy"];
  [v80 doubleValue];
  double v82 = v81;
  v83 = [MEMORY[0x1E4F29180] seconds];
  v104 = (void *)[v79 initWithDoubleValue:v83 unit:v82];

  id v84 = objc_alloc(MEMORY[0x1E4F28E28]);
  v85 = [v7 objectForKeyedSubscript:@"ThreeKilometersAccuracy"];
  [v85 doubleValue];
  double v87 = v86;
  v88 = [MEMORY[0x1E4F29180] seconds];
  v89 = (void *)[v84 initWithDoubleValue:v88 unit:v87];

  v90 = (void *)[objc_alloc(MEMORY[0x1E4F35B08]) initWithCumulativeBestAccuracyTimeMeasurement:v108 cumulativeBestAccuracyForNavigationTimeMeasurement:v107 nearestTenMetersAccuracyTimeMeasurement:v106 hundredMetersAccuracyTimeMeasurement:v105 kilometerAccuracyTimeMeasurement:v104 threeKilometerAccuracyTimeMeasurement:v89];
  [v125 setLocationActivityMetrics:v90];
  id v91 = objc_alloc(MEMORY[0x1E4F28E28]);
  v92 = [v7 objectForKeyedSubscript:@"AveragePictureLevel"];
  [v92 doubleValue];
  double v94 = v93;
  v95 = [MEMORY[0x1E4F35B30] apl];
  v96 = (void *)[v91 initWithDoubleValue:v95 unit:v94];

  id v97 = objc_alloc(MEMORY[0x1E4F35AC0]);
  v98 = [v7 objectForKeyedSubscript:@"TotalFrameCount"];
  v99 = objc_msgSend(v97, "initWithMeasurement:sampleCount:standardDeviation:", v96, objc_msgSend(v98, "unsignedIntegerValue"), -1.0);

  v100 = (void *)[objc_alloc(MEMORY[0x1E4F35AE8]) initWithAveragePictureLevel:v99];
  [v125 setDisplayMetrics:v100];
  id v101 = objc_alloc(MEMORY[0x1E4F35AD8]);
  v102 = [(PLMetricsFormatterMetricKit *)self constructCellularHistogram:v7];

  v103 = (void *)[v101 initWithCellularConditionTime:v102];
  [v125 setCellularConditionMetrics:v103];
}

- (void)addPerfMetrics:(id)a3 toAppData:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F28E28];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  id v9 = [v7 objectForKeyedSubscript:@"byteswritten"];
  double v10 = (double)((unint64_t)[v9 unsignedIntegerValue] >> 10);
  double v11 = [MEMORY[0x1E4F291D0] kilobytes];
  uint64_t v12 = (void *)[v8 initWithDoubleValue:v11 unit:v10];

  id v30 = (id)[objc_alloc(MEMORY[0x1E4F35AE0]) initWithCumulativeLogicalWritesMeasurement:v12];
  [v6 setDiskIOMetrics:v30];
  id v13 = objc_alloc(MEMORY[0x1E4F28E28]);
  uint64_t v14 = [v7 objectForKeyedSubscript:@"PeakMemory"];
  double v15 = (double)((unint64_t)[v14 unsignedIntegerValue] >> 10);
  double v16 = [MEMORY[0x1E4F291D0] kilobytes];
  uint64_t v17 = (void *)[v13 initWithDoubleValue:v16 unit:v15];

  id v18 = objc_alloc(MEMORY[0x1E4F28E28]);
  v19 = [v7 objectForKeyedSubscript:@"AverageMemory"];
  double v20 = (double)((unint64_t)[v19 unsignedIntegerValue] >> 10);
  double v21 = [MEMORY[0x1E4F291D0] kilobytes];
  double v22 = (void *)[v18 initWithDoubleValue:v21 unit:v20];

  id v23 = [v7 objectForKeyedSubscript:@"AverageMemoryVariance"];
  [v23 doubleValue];
  double v25 = sqrt(v24) * 0.0009765625;

  id v26 = objc_alloc(MEMORY[0x1E4F35AC0]);
  id v27 = [v7 objectForKeyedSubscript:@"AverageMemoryCount"];

  id v28 = objc_msgSend(v26, "initWithMeasurement:sampleCount:standardDeviation:", v22, objc_msgSend(v27, "integerValue"), v25);
  double v29 = (void *)[objc_alloc(MEMORY[0x1E4F35B10]) initWithPeakMemoryUsageMeasurement:v17 averageMemoryUsageMeasurement:v28];
  [v6 setMemoryMetrics:v29];
}

- (void)addSignpostData:(id)a3 forApp:(id)a4 toAppData:(id)a5
{
  uint64_t v179 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 objectForKeyedSubscript:@"launchDurations"];
  id v156 = v7;
  id v157 = v9;
  if (v10)
  {
    double v11 = (void *)v10;
    uint64_t v12 = [v7 objectForKeyedSubscript:@"resumeDurations"];
    if (!v12)
    {
      uint64_t v14 = 0;
LABEL_26:

      goto LABEL_27;
    }
    id v13 = (void *)v12;
    uint64_t v14 = [v7 objectForKeyedSubscript:@"activationDurations"];
    if (!v14)
    {
LABEL_25:

      goto LABEL_26;
    }
    double v15 = [v7 objectForKeyedSubscript:@"extendedLaunchDurations"];

    if (v15)
    {
      double v16 = [v7 objectForKeyedSubscript:@"launchDurations"];
      uint64_t v17 = [v16 objectForKeyedSubscript:v8];
      id v18 = [v17 objectForKeyedSubscript:&unk_1F400CC88];
      if (v18)
      {
        v19 = [v7 objectForKeyedSubscript:@"launchDurations"];
        double v20 = [v19 objectForKeyedSubscript:v8];
        double v11 = [v20 objectForKeyedSubscript:&unk_1F400CC88];

        unint64_t v21 = 0x1E4F1C000;
      }
      else
      {
        unint64_t v21 = 0x1E4F1C000uLL;
        double v11 = [MEMORY[0x1E4F1C978] array];
      }

      double v22 = [v7 objectForKeyedSubscript:@"resumeDurations"];
      id v23 = [v22 objectForKeyedSubscript:v8];
      if (v23)
      {
        double v24 = [v7 objectForKeyedSubscript:@"resumeDurations"];
        id v13 = [v24 objectForKeyedSubscript:v8];
      }
      else
      {
        id v13 = [*(id *)(v21 + 2424) array];
      }

      double v25 = [v7 objectForKeyedSubscript:@"activationDurations"];
      id v26 = [v25 objectForKeyedSubscript:v8];
      id v27 = [v26 objectForKeyedSubscript:&unk_1F400CC88];
      id v28 = [v27 objectForKeyedSubscript:&unk_1F400CCA0];
      if (v28)
      {
        double v29 = [v7 objectForKeyedSubscript:@"activationDurations"];
        [v29 objectForKeyedSubscript:v8];
        id v30 = v160 = v26;
        [v30 objectForKeyedSubscript:&unk_1F400CC88];
        unint64_t v31 = v21;
        v33 = id v32 = v25;
        uint64_t v166 = [v33 objectForKeyedSubscript:&unk_1F400CCA0];

        double v25 = v32;
        unint64_t v21 = v31;

        id v26 = v160;
        id v7 = v156;
      }
      else
      {
        uint64_t v166 = [*(id *)(v21 + 2424) array];
      }

      unint64_t v34 = [v7 objectForKeyedSubscript:@"extendedLaunchDurations"];
      id v35 = [v34 objectForKeyedSubscript:v8];
      double v36 = [v35 objectForKeyedSubscript:&unk_1F400CC88];
      if (v36)
      {
        long long v37 = [v7 objectForKeyedSubscript:@"extendedLaunchDurations"];
        id v38 = [v37 objectForKeyedSubscript:v8];
        long long v39 = [v38 objectForKeyedSubscript:&unk_1F400CC88];

        id v7 = v156;
      }
      else
      {
        long long v39 = [*(id *)(v21 + 2424) array];
      }
      id v9 = v157;

      uint64_t v14 = 0;
      if (v11)
      {
        double v40 = (void *)v166;
        if (v13 && v166 && v39)
        {
          v161 = [(PLMetricsFormatterMetricKit *)self constructHistogramBucketsWithDuration:10 andData:v11];
          double v41 = [(PLMetricsFormatterMetricKit *)self constructHistogramBucketsWithDuration:10 andData:v13];
          uint64_t v42 = [(PLMetricsFormatterMetricKit *)self constructHistogramBucketsWithDuration:10 andData:v166];
          id v43 = [(PLMetricsFormatterMetricKit *)self constructHistogramBucketsWithDuration:10 andData:v39];
          uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F35AA8]) initWithLaunchTimeData:v161 withResumeTimeData:v41 withActivationTimeData:v42 withExtendedLaunchTimeData:v43];

          double v40 = (void *)v166;
          id v9 = v157;
        }
      }
      else
      {
        double v40 = (void *)v166;
      }

      goto LABEL_25;
    }
  }
  uint64_t v14 = 0;
LABEL_27:
  v154 = v14;
  [v9 setApplicationLaunchMetrics:v14];
  uint64_t v44 = [v7 objectForKeyedSubscript:@"hangDurations"];
  if (v44
    && (double v45 = (void *)v44,
        BOOL v46 = [(PLMetricsFormatterMetricKit *)self processHangs],
        v45,
        v46))
  {
    id v47 = [v7 objectForKeyedSubscript:@"hangDurations"];
    id v48 = [v47 objectForKeyedSubscript:v8];

    if (v48)
    {
      double v49 = [(PLMetricsFormatterMetricKit *)self constructHistogramBucketsWithDuration:10 andData:v48];
      int v50 = (void *)[objc_alloc(MEMORY[0x1E4F35AB0]) initWithAppResponsivenessData:v49];
    }
    else
    {
      int v50 = 0;
    }
  }
  else
  {
    int v50 = 0;
  }
  [v9 setApplicationResponsivenessMetrics:v50];
  id v51 = [v7 objectForKeyedSubscript:@"scrollGlitches"];

  if (v51)
  {
    uint64_t v52 = [v7 objectForKeyedSubscript:@"scrollGlitches"];
    double v53 = [v52 objectForKeyedSubscript:v8];

    if (v53
      && ([v53 objectForKeyedSubscript:@"glitchDuration"],
          (uint64_t v54 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v55 = (void *)v54;
      long long v56 = [v53 objectForKeyedSubscript:@"scrollDuration"];

      if (v56)
      {
        double v57 = [v53 objectForKeyedSubscript:@"glitchDuration"];
        [v57 doubleValue];
        double v59 = v58;

        long long v60 = [v53 objectForKeyedSubscript:@"scrollDuration"];
        [v60 doubleValue];
        double v62 = v61 / 1000.0;

        id v63 = objc_alloc(MEMORY[0x1E4F28E28]);
        id v64 = (void *)[objc_alloc(MEMORY[0x1E4F29148]) initWithSymbol:@"ms per s"];
        uint64_t v65 = (void *)[v63 initWithDoubleValue:v64 unit:v59 / v62];

        long long v56 = (void *)[objc_alloc(MEMORY[0x1E4F35A98]) initWithGlitchTimeRatio:v65];
      }
    }
    else
    {
      long long v56 = 0;
    }
  }
  else
  {
    long long v56 = 0;
  }
  v153 = v56;
  [v9 setAnimationMetrics:v56];
  uint64_t v66 = [v7 objectForKeyedSubscript:@"processExits"];
  v155 = v50;
  if (!v66) {
    goto LABEL_45;
  }
  double v67 = (void *)v66;
  v68 = [v7 objectForKeyedSubscript:@"processExits"];
  id v69 = [v68 objectForKeyedSubscript:v8];

  if (v69)
  {
    v70 = [v7 objectForKeyedSubscript:@"processExits"];
    double v71 = [v70 objectForKeyedSubscript:v8];
    v162 = [v71 objectForKeyedSubscript:&unk_1F400CC88];

    double v72 = [v7 objectForKeyedSubscript:@"processExits"];
    v73 = [v72 objectForKeyedSubscript:v8];
    v167 = [v73 objectForKeyedSubscript:&unk_1F400CCB8];

    id v74 = +[PLMetricsFormatterMetricKit categorizeAppExits:v162];
    id v149 = objc_alloc(MEMORY[0x1E4F35AF0]);
    v146 = [v74 objectForKeyedSubscript:@"cumulativeNormalAppExitCount"];
    uint64_t v142 = [v146 unsignedIntegerValue];
    v144 = [v74 objectForKeyedSubscript:@"cumulativeMemoryResourceLimitExitCount"];
    uint64_t v140 = [v144 unsignedIntegerValue];
    v75 = [v74 objectForKeyedSubscript:@"cumulativeCPUResourceLimitExitCount"];
    uint64_t v138 = [v75 unsignedIntegerValue];
    double v76 = [v74 objectForKeyedSubscript:@"cumulativeBadAccessExitCount"];
    uint64_t v77 = [v76 unsignedIntegerValue];
    v78 = [v74 objectForKeyedSubscript:@"cumulativeAbnormalExitCount"];
    uint64_t v79 = [v78 unsignedIntegerValue];
    v158 = v74;
    v80 = [v74 objectForKeyedSubscript:@"cumulativeIllegalInstructionExitCount"];
    uint64_t v81 = [v80 unsignedIntegerValue];
    double v82 = objc_msgSend(v74, "objectForKeyedSubscript:");
    v150 = objc_msgSend(v149, "initWithNormalAppExitCount:withMemoryResourceLimitExitCount:withCPUResourceLimitExitCount:withBadAccessExitCount:withAbnormalExitCount:withIllegalInstructionExitCount:withAppWatchDogExitCount:", v142, v140, v138, v77, v79, v81, objc_msgSend(v82, "unsignedIntegerValue"));

    v83 = +[PLMetricsFormatterMetricKit categorizeAppExits:v167];
    id v84 = objc_alloc(MEMORY[0x1E4F35AC8]);
    v147 = [v83 objectForKeyedSubscript:@"cumulativeNormalAppExitCount"];
    uint64_t v139 = [v147 unsignedIntegerValue];
    v145 = [v83 objectForKeyedSubscript:@"cumulativeMemoryResourceLimitExitCount"];
    uint64_t v136 = [v145 unsignedIntegerValue];
    v143 = [v83 objectForKeyedSubscript:@"cumulativeCPUResourceLimitExitCount"];
    uint64_t v134 = [v143 unsignedIntegerValue];
    v141 = [v83 objectForKeyedSubscript:@"cumulativeMemoryPressureExitCount"];
    uint64_t v133 = [v141 unsignedIntegerValue];
    v137 = [v83 objectForKeyedSubscript:@"cumulativeBadAccessExitCount"];
    uint64_t v131 = [v137 unsignedIntegerValue];
    v135 = [v83 objectForKeyedSubscript:@"cumulativeAbnormalExitCount"];
    uint64_t v129 = [v135 unsignedIntegerValue];
    v132 = [v83 objectForKeyedSubscript:@"cumulativeIllegalInstructionExitCount"];
    uint64_t v128 = [v132 unsignedIntegerValue];
    v130 = [v83 objectForKeyedSubscript:@"cumulativeAppWatchdogExitCount"];
    uint64_t v127 = [v130 unsignedIntegerValue];
    v85 = [v83 objectForKeyedSubscript:@"cumulativeSuspendedWithLockedFileExitCount"];
    uint64_t v86 = [v85 unsignedIntegerValue];
    double v87 = [v83 objectForKeyedSubscript:@"cumulativeBackgroundTaskAssertionTimeoutExitCount"];
    uint64_t v88 = [v87 unsignedIntegerValue];
    v89 = [v83 objectForKeyedSubscript:@"cumulativeBackgroundURLSessionCompletionTimeoutExitCount"];
    uint64_t v90 = [v89 unsignedIntegerValue];
    id v91 = [v83 objectForKeyedSubscript:@"cumulativeBackgroundFetchCompletionTimeoutExitCount"];
    v92 = objc_msgSend(v84, "initWithNormalAppExitCount:memoryResourceLimitExitCount:cpuResourceLimitExitCount:memoryPressureExitCount:badAccessExitCount:abnormalExitCount:illegalInstructionExitCount:appWatchDogExitCount:cumulativeSuspendedWithLockedFileExitCount:cumulativeBackgroundTaskAssertionTimeoutExitCount:cumulativeBackgroundURLSessionCompletionTimeoutExitCount:cumulativeBackgroundFetchCompletionTimeoutExitCount:", v139, v136, v134, v133, v131, v129, v128, v127, v86, v88, v90, objc_msgSend(v91, "unsignedIntegerValue"));

    int v50 = v155;
    id v9 = v157;

    id v7 = v156;
    double v93 = (void *)[objc_alloc(MEMORY[0x1E4F35AA0]) initWithForegroundExitData:v150 backgroundExitData:v92];
  }
  else
  {
LABEL_45:
    double v93 = 0;
  }
  [v9 setApplicationExitMetrics:v93];
  id v168 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v94 = [v7 objectForKeyedSubscript:@"signpostIntervals"];

  if (v94)
  {
    v95 = [v7 objectForKeyedSubscript:@"signpostIntervals"];
    v96 = [v95 objectForKeyedSubscript:v8];

    if (v96)
    {
      v151 = v93;
      id v97 = [v96 objectForKeyedSubscript:@"appSignpostDurations"];
      v148 = v96;
      uint64_t v98 = [v96 objectForKeyedSubscript:@"appSignpostMetrics"];
      v99 = (void *)MEMORY[0x1E4F1CC08];
      if (v98) {
        v99 = (void *)v98;
      }
      v163 = v99;
      long long v173 = 0u;
      long long v174 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      id v100 = v97;
      uint64_t v101 = [v100 countByEnumeratingWithState:&v173 objects:v178 count:16];
      if (v101)
      {
        uint64_t v102 = v101;
        uint64_t v103 = *(void *)v174;
        uint64_t v159 = *(void *)v174;
        do
        {
          for (uint64_t i = 0; i != v102; ++i)
          {
            if (*(void *)v174 != v103) {
              objc_enumerationMutation(v100);
            }
            v105 = *(void **)(*((void *)&v173 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v105 count] == 2)
            {
              v106 = [v105 objectAtIndexedSubscript:0];
              v107 = [v105 objectAtIndexedSubscript:1];
              v108 = [v100 objectForKeyedSubscript:v105];
              v109 = [v163 objectForKeyedSubscript:v105];
              [(PLMetricsFormatterMetricKit *)self analyticsLogSignpostsWithBundleId:v8 withName:v107 withCategory:v106 withMetrics:v109];
              v110 = [(PLMetricsFormatterMetricKit *)self constructSignpostIntervalDataWithDurations:v108 withMetrics:v109];
              id v111 = v8;
              v112 = objc_msgSend(objc_alloc(MEMORY[0x1E4F35B28]), "initWithSignpostName:withSignpostCategory:withTotalCount:withSignpostIntervalData:", v107, v106, objc_msgSend(v108, "count"), v110);
              [v168 addObject:v112];

              id v8 = v111;
              uint64_t v103 = v159;
            }
          }
          uint64_t v102 = [v100 countByEnumeratingWithState:&v173 objects:v178 count:16];
        }
        while (v102);
      }

      id v7 = v156;
      id v9 = v157;
      int v50 = v155;
      v96 = v148;
      double v93 = v151;
    }
  }
  v113 = [v7 objectForKeyedSubscript:@"signpostEvents"];

  if (v113)
  {
    v114 = [v7 objectForKeyedSubscript:@"signpostEvents"];
    id v165 = v8;
    v115 = [v114 objectForKeyedSubscript:v8];

    if (v115)
    {
      v152 = v93;
      long long v171 = 0u;
      long long v172 = 0u;
      long long v169 = 0u;
      long long v170 = 0u;
      id v116 = v115;
      uint64_t v117 = [v116 countByEnumeratingWithState:&v169 objects:v177 count:16];
      if (v117)
      {
        uint64_t v118 = v117;
        uint64_t v119 = *(void *)v170;
        do
        {
          for (uint64_t j = 0; j != v118; ++j)
          {
            if (*(void *)v170 != v119) {
              objc_enumerationMutation(v116);
            }
            id v121 = *(void **)(*((void *)&v169 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v121 count] == 2)
            {
              v122 = [v121 objectAtIndexedSubscript:0];
              v123 = [v121 objectAtIndexedSubscript:1];
              v124 = [v116 objectForKeyedSubscript:v121];
              if ([v124 integerValue] >= 1)
              {
                v125 = objc_msgSend(objc_alloc(MEMORY[0x1E4F35B28]), "initWithSignpostName:withSignpostCategory:withTotalCount:withSignpostIntervalData:", v123, v122, objc_msgSend(v124, "unsignedIntegerValue"), 0);
                [v168 addObject:v125];
              }
            }
          }
          uint64_t v118 = [v116 countByEnumeratingWithState:&v169 objects:v177 count:16];
        }
        while (v118);
      }

      id v7 = v156;
      id v9 = v157;
      int v50 = v155;
      double v93 = v152;
    }

    id v8 = v165;
  }
  v126 = [MEMORY[0x1E4F1C978] arrayWithArray:v168];
  [v9 setSignpostMetrics:v126];
}

- (id)constructSignpostIntervalDataWithDurations:(id)a3 withMetrics:(id)a4
{
  id v6 = a4;
  id v7 = [(PLMetricsFormatterMetricKit *)self constructHistogramBucketsWithDuration:100 andData:a3];
  if (v6)
  {
    id v8 = [v6 objectForKeyedSubscript:@"cpuTime"];
    [v8 doubleValue];
    double v10 = v9 * 1000.0;

    id v11 = objc_alloc(MEMORY[0x1E4F28E28]);
    uint64_t v12 = [MEMORY[0x1E4F29180] milliseconds];
    id v13 = (void *)[v11 initWithDoubleValue:v12 unit:(double)(unint64_t)v10];

    id v14 = objc_alloc(MEMORY[0x1E4F28E28]);
    double v15 = [v6 objectForKeyedSubscript:@"averageMemory"];
    [v15 doubleValue];
    double v17 = v16;
    id v18 = [MEMORY[0x1E4F291D0] kilobytes];
    v19 = (void *)[v14 initWithDoubleValue:v18 unit:v17];

    id v20 = objc_alloc(MEMORY[0x1E4F35AC0]);
    unint64_t v21 = [v6 objectForKeyedSubscript:@"countInstances"];
    double v22 = objc_msgSend(v20, "initWithMeasurement:sampleCount:standardDeviation:", v19, (int)objc_msgSend(v21, "intValue"), -1.0);

    id v23 = objc_alloc(MEMORY[0x1E4F28E28]);
    double v24 = [v6 objectForKeyedSubscript:@"diskIO"];
    [v24 doubleValue];
    double v26 = v25;
    id v27 = [MEMORY[0x1E4F291D0] kilobytes];
    id v28 = (void *)[v23 initWithDoubleValue:v27 unit:v26];

    double v29 = [v6 objectForKeyedSubscript:@"hitchDuration"];
    [v29 doubleValue];
    double v31 = v30;

    id v32 = [v6 objectForKeyedSubscript:@"animationDuration"];
    [v32 doubleValue];
    double v34 = v33;

    id v35 = 0;
    if (v31 >= 0.0)
    {
      double v36 = v34 / 1000.0;
      if (v36 > 0.0)
      {
        id v37 = objc_alloc(MEMORY[0x1E4F28E28]);
        id v38 = (void *)[objc_alloc(MEMORY[0x1E4F29148]) initWithSymbol:@"ms per s"];
        id v35 = (void *)[v37 initWithDoubleValue:v38 unit:v31 / v36];
      }
    }
  }
  else
  {
    id v35 = 0;
    id v28 = 0;
    double v22 = 0;
    id v13 = 0;
  }
  long long v39 = (void *)[objc_alloc(MEMORY[0x1E4F35B20]) initWithHistogramDurationData:v7 withCumulativeCPUTime:v13 withAverageMemory:v22 withCumulativeLogicalWrites:v28 withCumulativeHitchTimeRatio:v35];

  return v39;
}

- (void)analyticsLogSignpostsWithBundleId:(id)a3 withName:(id)a4 withCategory:(id)a5 withMetrics:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (v9 && v10 && v11 && v12)
  {
    id v14 = v9;
    id v15 = v10;
    id v16 = v11;
    id v17 = v13;
    AnalyticsSendEventLazy();
  }
}

id __99__PLMetricsFormatterMetricKit_analyticsLogSignpostsWithBundleId_withName_withCategory_withMetrics___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v28 = *(_OWORD *)(a1 + 32);
  v27[0] = @"BundleID";
  v27[1] = @"Name";
  uint64_t v3 = *(void *)(a1 + 48);
  v2 = *(void **)(a1 + 56);
  uint64_t v29 = v3;
  v27[2] = @"Category";
  v27[3] = @"cpuTime";
  uint64_t v4 = objc_msgSend(v2, "objectForKeyedSubscript:");
  v5 = (void *)v4;
  if (v4) {
    id v6 = (void *)v4;
  }
  else {
    id v6 = &unk_1F400CCB8;
  }
  double v30 = v6;
  v27[4] = @"diskIO";
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:");
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = &unk_1F400CCB8;
  }
  double v31 = v9;
  v27[5] = @"peakMemory";
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:");
  id v11 = (void *)v10;
  if (v10) {
    id v12 = (void *)v10;
  }
  else {
    id v12 = &unk_1F400CCB8;
  }
  id v32 = v12;
  v27[6] = @"averageMemory";
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:");
  id v14 = (void *)v13;
  if (v13) {
    id v15 = (void *)v13;
  }
  else {
    id v15 = &unk_1F400CCB8;
  }
  double v33 = v15;
  v27[7] = @"countInstances";
  uint64_t v16 = objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:");
  id v17 = (void *)v16;
  if (v16) {
    id v18 = (void *)v16;
  }
  else {
    id v18 = &unk_1F400CCB8;
  }
  double v34 = v18;
  v27[8] = @"hitchDuration";
  uint64_t v19 = objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:");
  id v20 = (void *)v19;
  if (v19) {
    unint64_t v21 = (void *)v19;
  }
  else {
    unint64_t v21 = &unk_1F400CCB8;
  }
  id v35 = v21;
  v27[9] = @"animationDuration";
  uint64_t v22 = objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:");
  id v23 = (void *)v22;
  if (v22) {
    double v24 = (void *)v22;
  }
  else {
    double v24 = &unk_1F400CCB8;
  }
  double v36 = v24;
  double v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:v27 count:10];

  return v25;
}

- (id)constructHistogramBucketsWithDuration:(int)a3 andData:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_16];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v18 = v6;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v21;
    uint64_t v12 = v4;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = -[PLMetricsFormatterMetricKit computeBucketEndWithDuration:andValue:](self, "computeBucketEndWithDuration:andValue:", v4, [v14 intValue]);
          if (v12 == v15)
          {
            ++v10;
          }
          else
          {
            uint64_t v16 = v15;
            if (v10) {
              [(PLMetricsFormatterMetricKit *)self addBucketWithDuration:v4 WithEnd:v12 andCount:v10 toList:v19];
            }
            uint64_t v12 = v16;
            uint64_t v10 = 1;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
    id v6 = v18;
    if (v10) {
      [(PLMetricsFormatterMetricKit *)self addBucketWithDuration:v4 WithEnd:v12 andCount:v10 toList:v19];
    }
  }

  return v19;
}

uint64_t __77__PLMetricsFormatterMetricKit_constructHistogramBucketsWithDuration_andData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (int)computeBucketEndWithDuration:(int)a3 andValue:(int)a4
{
  return ~(a4 % a3) + a3 + a4;
}

- (void)addBucketWithDuration:(int)a3 WithEnd:(int)a4 andCount:(unint64_t)a5 toList:(id)a6
{
  double v8 = (double)(a4 - a3 + 1);
  uint64_t v9 = (objc_class *)MEMORY[0x1E4F28E28];
  id v10 = a6;
  id v11 = [v9 alloc];
  uint64_t v12 = [MEMORY[0x1E4F29180] milliseconds];
  id v18 = (id)[v11 initWithDoubleValue:v12 unit:v8];

  id v13 = objc_alloc(MEMORY[0x1E4F28E28]);
  double v14 = (double)a4;
  uint64_t v15 = [MEMORY[0x1E4F29180] milliseconds];
  uint64_t v16 = (void *)[v13 initWithDoubleValue:v15 unit:v14];

  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F35B00]) initWithBucketStart:v18 bucketEnd:v16 bucketCount:a5];
  [v10 addObject:v17];
}

- (id)constructCellularHistogram:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [(PLMetricsFormatterMetricKit *)self constructCellularData:v5];

  [(PLMetricsFormatterMetricKit *)self normalizeCellularData:v7];
  double v8 = [v7 objectForKeyedSubscript:&unk_1F400CC40];
  [(PLMetricsFormatterMetricKit *)self addBucketWithSignalBar:0 withTime:v8 toList:v6];

  uint64_t v9 = [v7 objectForKeyedSubscript:&unk_1F400CC58];
  [(PLMetricsFormatterMetricKit *)self addBucketWithSignalBar:1 withTime:v9 toList:v6];

  id v10 = [v7 objectForKeyedSubscript:&unk_1F400CC70];
  [(PLMetricsFormatterMetricKit *)self addBucketWithSignalBar:2 withTime:v10 toList:v6];

  id v11 = [v7 objectForKeyedSubscript:&unk_1F400CCD0];
  [(PLMetricsFormatterMetricKit *)self addBucketWithSignalBar:3 withTime:v11 toList:v6];

  uint64_t v12 = [v7 objectForKeyedSubscript:&unk_1F400CCE8];
  [(PLMetricsFormatterMetricKit *)self addBucketWithSignalBar:4 withTime:v12 toList:v6];

  return v6;
}

- (void)addBucketWithSignalBar:(signed __int16)a3 withTime:(id)a4 toList:(id)a5
{
  int v6 = a3;
  id v13 = a4;
  id v7 = a5;
  if (v13 && [v13 unsignedIntegerValue])
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28E28]);
    double v9 = (double)v6;
    id v10 = [MEMORY[0x1E4F35B38] bars];
    id v11 = (void *)[v8 initWithDoubleValue:v10 unit:v9];

    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F35B00]), "initWithBucketStart:bucketEnd:bucketCount:", v11, v11, objc_msgSend(v13, "unsignedIntegerValue"));
    [v7 addObject:v12];
  }
}

- (void)normalizeCellularData:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v3);
        }
        double v9 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        v6 += [v9 unsignedIntegerValue];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v5);
    if (v6)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v10 = (void *)[v3 copy];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v33 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * j);
            uint64_t v16 = (void *)MEMORY[0x1E4F28ED0];
            id v17 = [v3 objectForKeyedSubscript:v15];
            id v18 = objc_msgSend(v16, "numberWithUnsignedLongLong:", 100 * objc_msgSend(v17, "unsignedIntegerValue") / v6);
            [v3 setObject:v18 forKeyedSubscript:v15];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v41 count:16];
        }
        while (v12);
      }

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v19 = v3;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        unint64_t v22 = 0;
        uint64_t v23 = *(void *)v29;
        do
        {
          for (uint64_t k = 0; k != v21; ++k)
          {
            if (*(void *)v29 != v23) {
              objc_enumerationMutation(v19);
            }
            uint64_t v25 = *(void **)(*((void *)&v28 + 1) + 8 * k);
            if (objc_msgSend(v25, "shortValue", (void)v28))
            {
              double v26 = [v19 objectForKeyedSubscript:v25];
              v22 += [v26 unsignedIntegerValue];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
        }
        while (v21);

        if (v22 > 0x63)
        {
          [v19 setObject:&unk_1F400CCB8 forKeyedSubscript:&unk_1F400CC40];
          goto LABEL_29;
        }
      }
      else
      {

        unint64_t v22 = 0;
      }
      id v27 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", 100 - v22, (void)v28);
      [v19 setObject:v27 forKeyedSubscript:&unk_1F400CC40];
    }
  }
LABEL_29:
}

- (id)constructCellularData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = [v3 objectForKeyedSubscript:@"SignalBar0"];

  if (v5)
  {
    unint64_t v6 = [v3 objectForKeyedSubscript:@"SignalBar0"];
    [v4 setObject:v6 forKeyedSubscript:&unk_1F400CC40];
  }
  uint64_t v7 = [v3 objectForKeyedSubscript:@"SignalBar1"];

  if (v7)
  {
    id v8 = [v3 objectForKeyedSubscript:@"SignalBar1"];
    [v4 setObject:v8 forKeyedSubscript:&unk_1F400CC58];
  }
  double v9 = [v3 objectForKeyedSubscript:@"SignalBar2"];

  if (v9)
  {
    id v10 = [v3 objectForKeyedSubscript:@"SignalBar2"];
    [v4 setObject:v10 forKeyedSubscript:&unk_1F400CC70];
  }
  uint64_t v11 = [v3 objectForKeyedSubscript:@"SignalBar3"];

  if (v11)
  {
    uint64_t v12 = [v3 objectForKeyedSubscript:@"SignalBar3"];
    [v4 setObject:v12 forKeyedSubscript:&unk_1F400CCD0];
  }
  uint64_t v13 = [v3 objectForKeyedSubscript:@"SignalBar4"];

  if (v13)
  {
    double v14 = [v3 objectForKeyedSubscript:@"SignalBar4"];
    [v4 setObject:v14 forKeyedSubscript:&unk_1F400CCE8];
  }
  return v4;
}

- (BOOL)hangtracerEnabled:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    BOOL v4 = 1;
  }
  else
  {
    if (!v3) {
      goto LABEL_7;
    }
    uint64_t v5 = [v3 objectForKeyedSubscript:@"hangtracer_enabled"];

    if (!v5
      || ([v3 objectForKeyedSubscript:@"hangtracer_enabled"],
          unint64_t v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = [v6 longValue],
          v6,
          BOOL v4 = 1,
          (unint64_t)(v7 - 100) >= 2)
      && v7 != 1000)
    {
LABEL_7:
      BOOL v4 = 0;
    }
  }

  return v4;
}

+ (id)categorizeAppExits:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__PLMetricsFormatterMetricKit_categorizeAppExits___block_invoke;
  v8[3] = &unk_1E6E49088;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __50__PLMetricsFormatterMetricKit_categorizeAppExits___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a3;
  id v5 = a2;
  id v6 = [v5 objectAtIndexedSubscript:0];
  uint64_t v7 = [v6 unsignedShortValue];

  id v8 = [v5 objectAtIndexedSubscript:1];

  uint64_t v9 = [v8 unsignedLongValue];
  id v10 = +[PLMetricsFormatterMetricKit decodeExitWithDomain:v7 withCode:v9];
  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
    uint64_t v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue") + objc_msgSend(v12, "unsignedIntegerValue"));
    [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v10];
  }
}

+ (id)decodeExitWithDomain:(unsigned int)a3 withCode:(unint64_t)a4
{
  if ((int)a3 <= 9)
  {
    if (a3 == 1)
    {
      if (a4 <= 0xC)
      {
        if (((1 << a4) & 0x1F78) != 0) {
          return @"cumulativeMemoryPressureExitCount";
        }
        if (((1 << a4) & 0x84) != 0) {
          return @"cumulativeMemoryResourceLimitExitCount";
        }
      }
      BOOL v6 = a4 == 100;
      id v5 = @"cumulativeCPUResourceLimitExitCount";
    }
    else
    {
      id v4 = @"cumulativeIllegalInstructionExitCount";
      if (a4 != 4) {
        id v4 = 0;
      }
      if (a4 == 6) {
        id v4 = @"cumulativeAbnormalExitCount";
      }
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 0xA) {
        id v5 = @"cumulativeBadAccessExitCount";
      }
      else {
        id v5 = v4;
      }
      BOOL v6 = a3 == 2;
    }
    goto LABEL_26;
  }
  if (a3 != 10)
  {
    if (a4 == 3735883980) {
      uint64_t v7 = @"cumulativeSuspendedWithLockedFileExitCount";
    }
    else {
      uint64_t v7 = 0;
    }
    if (a4 == 562215636) {
      id v8 = @"cumulativeBackgroundFetchCompletionTimeoutExitCount";
    }
    else {
      id v8 = v7;
    }
    uint64_t v9 = @"cumulativeBackgroundTaskAssertionTimeoutExitCount";
    id v10 = @"cumulativeBackgroundURLSessionCompletionTimeoutExitCount";
    if (a4 != 562215635) {
      id v10 = 0;
    }
    if (a4 != 562215634) {
      uint64_t v9 = v10;
    }
    if ((uint64_t)a4 <= 562215635) {
      id v5 = v9;
    }
    else {
      id v5 = v8;
    }
    BOOL v6 = a3 == 15;
LABEL_26:
    if (v6) {
      return v5;
    }
    else {
      return 0;
    }
  }
  if (a4 == 2343432205) {
    return @"cumulativeAppWatchdogExitCount";
  }
  if (a4 == 4227595259 || a4 == 3735943697) {
    return @"cumulativeNormalAppExitCount";
  }
  return 0;
}

- (BOOL)processHangs
{
  return self->_processHangs;
}

- (void)setProcessHangs:(BOOL)a3
{
  self->_processHangs = a3;
}

@end