@interface PLAggregateSummarizationService
+ (id)entryAggregateDefinitions;
+ (id)entryEventPointDefinitions;
+ (id)modelIdentifier;
+ (id)osVersion;
+ (signed)buildType;
+ (void)load;
- (BOOL)gmsOptInState;
- (NSArray)appList;
- (NSMutableArray)metrics;
- (NSMutableDictionary)summarizedData;
- (PLAggregateSummarizationService)init;
- (PLXPCResponderOperatorComposition)aggregationResponder;
- (double)maxTimestamp;
- (id)getAppMultipleVersionsData;
- (id)getCellularConditionSummarizer;
- (id)getDeviceMetadataInRange:(_PLTimeIntervalRange)a3 withSignpostData:(id)a4;
- (id)getDrainInfoInRange:(_PLTimeIntervalRange)a3;
- (id)getGenericSummarizer;
- (id)getInitCountInRange:(_PLTimeIntervalRange)a3;
- (id)getLocationActivitySummarizer;
- (id)getPluggedInDurationInRange:(_PLTimeIntervalRange)a3;
- (id)getQueryForAppMultipleVersions;
- (id)getQueryForAverageMemory;
- (id)getQueryForCellularCondition;
- (id)getQueryForCoalitionPowerData;
- (id)getQueryForDiskIO;
- (id)getQueryForDisplayAPL;
- (id)getQueryForLocationActivity;
- (id)getQueryForNetworkIOData;
- (id)getQueryForPeakMemory;
- (id)handleAggregationQueryWithPayload:(id)a3;
- (id)preformatMetricsForFormatter:(id)a3;
- (void)addMetrics:(id)a3 withType:(signed __int16)a4;
- (void)aggregateMetrics;
- (void)getAppList:(id)a3;
- (void)getAppMetadata;
- (void)initOperatorDependancies;
- (void)setAggregationResponder:(id)a3;
- (void)setAppList:(id)a3;
- (void)setGmsOptInState:(BOOL)a3;
- (void)setMaxTimestamp:(double)a3;
- (void)setMetrics:(id)a3;
- (void)setSummarizedData:(id)a3;
- (void)setupMetrics;
@end

@implementation PLAggregateSummarizationService

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAggregateSummarizationService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLAggregateSummarizationService)init
{
  if (+[PLUtilities isPowerlogHelperd])
  {
    v8.receiver = self;
    v8.super_class = (Class)PLAggregateSummarizationService;
    v3 = [(PLOperator *)&v8 init];
    if (v3)
    {
      v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      metrics = v3->_metrics;
      v3->_metrics = v4;
    }
    self = v3;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)initOperatorDependancies
{
  id v3 = objc_alloc(MEMORY[0x1E4F92AA8]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PLAggregateSummarizationService_initOperatorDependancies__block_invoke;
  v5[3] = &unk_1E6E47958;
  v5[4] = self;
  v4 = (void *)[v3 initWithOperator:self withRegistration:&unk_1F400EB88 withBlock:v5];
  [(PLAggregateSummarizationService *)self setAggregationResponder:v4];
}

uint64_t __59__PLAggregateSummarizationService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) handleAggregationQueryWithPayload:a5];
}

- (id)preformatMetricsForFormatter:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PLAggregateSummarizationService *)self getAppList:v4];
  appList = self->_appList;
  if (appList && [(NSArray *)appList count])
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    p_summarizedData = &self->_summarizedData;
    summarizedData = self->_summarizedData;
    self->_summarizedData = v6;

    [(PLAggregateSummarizationService *)self getAppMetadata];
    v9 = PLLogAggregateSummarizationService();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PLAggregateSummarizationService preformatMetricsForFormatter:]((uint64_t)p_summarizedData, v9, v10, v11, v12, v13, v14, v15);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v34 = v4;
    id obj = v4;
    uint64_t v16 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v38;
      do
      {
        uint64_t v19 = 0;
        uint64_t v35 = v17;
        do
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v37 + 1) + 8 * v19);
          v21 = [v20 objectForKey:@"PLBatteryUIAppBundleIDKey"];
          if (!v21
            || ([(NSMutableDictionary *)*p_summarizedData objectForKeyedSubscript:v21],
                v22 = objc_claimAutoreleasedReturnValue(),
                v22,
                !v22))
          {
            v28 = PLLogAggregateSummarizationService();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v21;
              _os_log_error_impl(&dword_1E4220000, v28, OS_LOG_TYPE_ERROR, "Bundle id error : %@", buf, 0xCu);
            }
            goto LABEL_18;
          }
          v23 = [v20 objectForKey:&unk_1F400C448];

          if (v23)
          {
            v24 = [(NSMutableDictionary *)*p_summarizedData objectForKeyedSubscript:v21];
            v25 = [v24 objectForKeyedSubscript:&unk_1F400C448];
            v26 = [v20 objectForKey:&unk_1F400C448];
            [v25 addEntriesFromDictionary:v26];

            uint64_t v17 = v35;
          }
          v27 = [v20 objectForKey:&unk_1F400C460];

          if (v27)
          {
            v28 = [(NSMutableDictionary *)*p_summarizedData objectForKeyedSubscript:v21];
            v29 = [v28 objectForKeyedSubscript:&unk_1F400C460];
            v30 = [v20 objectForKey:&unk_1F400C460];
            [v29 addEntriesFromDictionary:v30];

LABEL_18:
          }

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v17);
    }

    v31 = *p_summarizedData;
    id v4 = v34;
  }
  else
  {
    v32 = PLLogAggregateSummarizationService();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[PLAggregateSummarizationService preformatMetricsForFormatter:](v32);
    }

    v31 = 0;
  }

  return v31;
}

- (id)handleAggregationQueryWithPayload:(id)a3
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogAggregateSummarizationService();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLAggregateSummarizationService handleAggregationQueryWithPayload:].cold.5((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

  if ([MEMORY[0x1E4F92A38] hasGenerativeModelSystems])
  {
    v176[0] = MEMORY[0x1E4F143A8];
    v176[1] = 3221225472;
    v176[2] = __69__PLAggregateSummarizationService_handleAggregationQueryWithPayload___block_invoke;
    v176[3] = &unk_1E6E48478;
    v176[4] = self;
    [MEMORY[0x1E4F59BB8] getGMOptInToggleWithCompletion:v176];
  }
  v148 = self;
  uint64_t v12 = [v4 objectForKeyedSubscript:@"PLBatteryUIQueryTypeKey"];
  int v13 = [v12 intValue];

  uint64_t v14 = [v4 objectForKeyedSubscript:@"today"];
  int v15 = [v14 BOOLValue];

  uint64_t v16 = [v4 objectForKeyedSubscript:@"last24hrs"];
  int v17 = [v16 BOOLValue];

  uint64_t v18 = [v4 objectForKeyedSubscript:@"last1hr"];
  int v19 = [v18 BOOLValue];

  v20 = [v4 objectForKeyedSubscript:@"AppAnalyticsEnabled"];
  int v145 = [v20 BOOLValue];

  v150 = v4;
  v21 = [v4 objectForKeyedSubscript:@"MetrickitClientsAvailable"];
  unsigned int v147 = [v21 BOOLValue];

  v22 = PLLogAggregateSummarizationService();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    [(PLAggregateSummarizationService *)v15 handleAggregationQueryWithPayload:v22];
  }

  v149 = objc_alloc_init(PLBatteryBreakdownService);
  [(PLOperator *)v149 initOperatorDependancies];
  v151 = [MEMORY[0x1E4F1C9C8] date];
  v23 = objc_msgSend(MEMORY[0x1E4F1C9C8], "nearestMidnightBeforeDate:");
  if (v15)
  {
    v24 = PLLogAggregateSummarizationService();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v24, OS_LOG_TYPE_INFO, "Aggregating today", buf, 2u);
    }

    id v25 = [MEMORY[0x1E4F1C9C8] nearestMidnightAfterDate:v151];
LABEL_15:
    id v27 = v25;
    double v28 = 86400.0;
    goto LABEL_16;
  }
  if (v17)
  {
    v26 = PLLogAggregateSummarizationService();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v26, OS_LOG_TYPE_DEFAULT, "Aggregating last 24hrs", buf, 2u);
    }

    id v25 = v151;
    goto LABEL_15;
  }
  if (!v19)
  {
    double v28 = 86400.0;
    goto LABEL_17;
  }
  v140 = PLLogAggregateSummarizationService();
  if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v140, OS_LOG_TYPE_DEFAULT, "Aggregating last hour", buf, 2u);
  }

  id v27 = v151;
  double v28 = 3600.0;
LABEL_16:

  v23 = v27;
LABEL_17:
  uint64_t v29 = [v4 objectForKey:@"off1"];
  if (v29
    && (v30 = (void *)v29,
        [v4 objectForKey:@"off2"],
        v31 = objc_claimAutoreleasedReturnValue(),
        v31,
        v30,
        v31))
  {
    v32 = [v4 objectForKey:@"off1"];
    [v32 doubleValue];
    double v34 = v33;

    uint64_t v35 = [v4 objectForKey:@"off2"];
    [v35 doubleValue];
    double v28 = v36;

    long long v37 = [v151 dateByAddingTimeInterval:-v34];

    long long v38 = PLLogAggregateSummarizationService();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v178 = v34;
      __int16 v179 = 2048;
      *(double *)v180 = v28;
      _os_log_impl(&dword_1E4220000, v38, OS_LOG_TYPE_DEFAULT, "Overriding offsets: %f %f", buf, 0x16u);
    }

    long long v39 = PLLogAggregateSummarizationService();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      double v178 = v28;
      __int16 v179 = 2112;
      *(void *)v180 = v37;
      _os_log_impl(&dword_1E4220000, v39, OS_LOG_TYPE_DEFAULT, "New range: %f seconds before %@", buf, 0x16u);
    }
  }
  else
  {
    long long v37 = v23;
  }
  long long v40 = [v37 convertFromSystemToMonotonic];
  double v41 = -v28;
  v42 = [v40 dateByAddingTimeInterval:-v28];
  id v43 = v40;
  [v42 timeIntervalSince1970];
  double v45 = v44;
  [v43 timeIntervalSince1970];
  double v47 = v46;

  double v48 = v47 - v45;
  v144 = v43;
  [v43 timeIntervalSince1970];
  v148->_maxTimestamp = v49;
  v152 = v37;
  v146 = [v37 dateByAddingTimeInterval:v41];
  v50 = PLLogAggregateSummarizationService();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v178 = v45;
    __int16 v179 = 2048;
    *(double *)v180 = v45 + v48;
    _os_log_impl(&dword_1E4220000, v50, OS_LOG_TYPE_DEFAULT, "aggregation range: %f %f", buf, 0x16u);
  }

  double v141 = v48;
  double v142 = v45;
  v143 = -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:](v149, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:", 4, v45, v48, v45, v48, 3600.0, 0.0);
  v51 = [v143 objectForKey:@"PLBatteryUIAppArrayKey"];
  v154 = objc_opt_new();
  long long v172 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  id obj = v51;
  uint64_t v156 = [obj countByEnumeratingWithState:&v172 objects:v191 count:16];
  if (v156)
  {
    uint64_t v155 = *(void *)v173;
    do
    {
      for (uint64_t i = 0; i != v156; ++i)
      {
        if (*(void *)v173 != v155) {
          objc_enumerationMutation(obj);
        }
        v53 = *(void **)(*((void *)&v172 + 1) + 8 * i);
        v54 = [v53 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        if (v54)
        {
          uint64_t v158 = i;
          v55 = objc_opt_new();
          v56 = objc_opt_new();
          v157 = v55;
          v161 = v54;
          [v55 setObject:v54 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          v57 = [v53 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
          uint64_t v58 = [v57 intValue];

          v59 = [v53 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
          uint64_t v60 = [v59 intValue];

          v61 = [v53 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundAudioRuntimeKey"];
          unsigned int v166 = [v61 intValue];

          v62 = [v53 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundLocationRuntimeKey"];
          unsigned int v162 = [v62 intValue];

          v63 = [v53 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundLocationAudioRuntimeKey"];
          uint64_t v64 = [v63 intValue];

          v65 = [v53 objectForKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];
          LODWORD(v63) = [v65 intValue];

          v66 = [v53 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundPluggedInRuntimeKey"];
          int v67 = [v66 intValue];

          v68 = [v53 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundAudioPluggedInRuntimeKey"];
          int v69 = [v68 intValue];

          v70 = [v53 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundLocationPluggedInRuntimeKey"];
          LODWORD(v55) = [v70 intValue];

          v165 = v53;
          v71 = [v53 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundLocationAudioPluggedInRuntimeKey"];
          int v72 = [v71 intValue];

          int v164 = v60 - v67;
          uint64_t v73 = (v60 - v67) & ~(((int)v60 - v67) >> 31);
          int v168 = (v162 - v55) & ~((int)(v162 - v55) >> 31);
          int v170 = (v64 - v72) & ~(((int)v64 - v72) >> 31);
          v74 = [MEMORY[0x1E4F28ED0] numberWithInt:v58];
          [v56 setObject:v74 forKeyedSubscript:@"fgTime_Total"];

          v75 = [MEMORY[0x1E4F28ED0] numberWithInt:v60];
          [v56 setObject:v75 forKeyedSubscript:@"bgTime_Total"];

          v76 = [MEMORY[0x1E4F28ED0] numberWithInt:v166];
          [v56 setObject:v76 forKeyedSubscript:@"bgTime_Audio"];

          v77 = [MEMORY[0x1E4F28ED0] numberWithInt:v162];
          [v56 setObject:v77 forKeyedSubscript:@"bgTime_Location"];

          v78 = [MEMORY[0x1E4F28ED0] numberWithInt:v64];
          [v56 setObject:v78 forKeyedSubscript:@"bgLocationAudioTime"];

          v79 = [MEMORY[0x1E4F28ED0] numberWithInt:(v58 - v63) & ~(((int)v58 - (int)v63) >> 31)];
          [v56 setObject:v79 forKeyedSubscript:@"fgTime_Unplugged"];

          v80 = [MEMORY[0x1E4F28ED0] numberWithInt:v73];
          [v56 setObject:v80 forKeyedSubscript:@"bgTime_Unplugged"];

          LODWORD(v63) = (v166 - v69) & ~((int)(v166 - v69) >> 31);
          v81 = [MEMORY[0x1E4F28ED0] numberWithInt:v63];
          [v56 setObject:v81 forKeyedSubscript:@"bgAudioTime_Unplugged"];

          v82 = [MEMORY[0x1E4F28ED0] numberWithInt:v168];
          [v56 setObject:v82 forKeyedSubscript:@"bgLocationTime_Unplugged"];

          v83 = [MEMORY[0x1E4F28ED0] numberWithInt:v170];
          v167 = v56;
          [v56 setObject:v83 forKeyedSubscript:@"bgLocationAudioTime_Unplugged"];

          int v163 = (v60 - v67) & ~(((int)v60 - v67) >> 31);
          double v84 = (double)v170;
          double v159 = (double)v168;
          double v160 = (double)(int)v63;
          double v85 = (double)(int)v63 / (double)(int)v73;
          double v86 = (double)v170 / ((double)(int)v73 + (double)(int)v73);
          int v87 = 1;
          double v88 = (double)v168 / (double)(int)v73;
          do
          {
            v89 = NSString;
            v90 = [MEMORY[0x1E4F28ED0] numberWithShort:(__int16)v87];
            v91 = [v89 stringWithFormat:@"%@", v90];

            uint64_t v92 = [NSString stringWithFormat:@"%@%@", @"fg", v91];
            uint64_t v93 = [NSString stringWithFormat:@"%@%@", @"bg", v91];
            v94 = [NSString stringWithFormat:@"%@%@", @"bgAudio", v91];
            v95 = [NSString stringWithFormat:@"%@%@", @"bgLocation", v91];
            v96 = [v165 objectForKeyedSubscript:v91];
            uint64_t v97 = [v96 intValue];

            v171 = (void *)v92;
            v98 = [v165 objectForKeyedSubscript:v92];
            uint64_t v99 = [v98 intValue];

            v169 = (void *)v93;
            v100 = [v165 objectForKeyedSubscript:v93];
            uint64_t v101 = [v100 intValue];

            v102 = [v165 objectForKeyedSubscript:v94];
            uint64_t v103 = [v102 intValue];

            v104 = [v165 objectForKeyedSubscript:v95];
            uint64_t v105 = [v104 intValue];

            if (v164 <= 0)
            {
              v111 = PLLogAggregateSummarizationService();
              if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v178) = v163;
                _os_log_impl(&dword_1E4220000, v111, OS_LOG_TYPE_INFO, "Can't reweigh based on BG time: %d", buf, 8u);
              }
            }
            else
            {
              double v106 = (double)(int)v101;
              v107 = PLLogAggregateSummarizationService();
              if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                double v178 = *(double *)&v161;
                __int16 v179 = 1024;
                *(_DWORD *)v180 = v87;
                *(_WORD *)&v180[4] = 2048;
                *(double *)&v180[6] = (double)(int)v101;
                _os_log_debug_impl(&dword_1E4220000, v107, OS_LOG_TYPE_DEBUG, "%@: bucket:%d BEFORE E_B:%f", buf, 0x1Cu);
              }

              double v108 = v86 * v106 + v106 * v85;
              double v109 = v86 * v106 + v106 * v88;
              if (v106 - v108 - v109 >= 0.0) {
                double v110 = v106 - v108 - v109;
              }
              else {
                double v110 = 0.0;
              }
              uint64_t v101 = (int)v110;
              uint64_t v103 = (int)v108;
              uint64_t v105 = (int)v109;
              v111 = PLLogAggregateSummarizationService();
              if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138414082;
                double v178 = *(double *)&v161;
                __int16 v179 = 1024;
                *(_DWORD *)v180 = v87;
                *(_WORD *)&v180[4] = 2048;
                *(double *)&v180[6] = v110;
                __int16 v181 = 2048;
                double v182 = v108;
                __int16 v183 = 2048;
                double v184 = v109;
                __int16 v185 = 2048;
                double v186 = v160;
                __int16 v187 = 2048;
                double v188 = v159;
                __int16 v189 = 2048;
                double v190 = v84;
                _os_log_debug_impl(&dword_1E4220000, v111, OS_LOG_TYPE_DEBUG, "%@: bucket:%d AFTER E_B:%f E_BA:%f E_BL:%f T_BA:%f T_BL:%f T_BABL:%f", buf, 0x4Eu);
              }
            }

            if ((int)v97 >= 1)
            {
              v112 = [MEMORY[0x1E4F28ED0] numberWithInt:v97];
              [v167 setObject:v112 forKeyedSubscript:v91];
            }
            if ((int)v99 >= 1)
            {
              v113 = [MEMORY[0x1E4F28ED0] numberWithInt:v99];
              [v167 setObject:v113 forKeyedSubscript:v171];
            }
            if ((int)v101 >= 1)
            {
              v114 = [MEMORY[0x1E4F28ED0] numberWithInt:v101];
              [v167 setObject:v114 forKeyedSubscript:v169];
            }
            if ((int)v103 >= 1)
            {
              v115 = [MEMORY[0x1E4F28ED0] numberWithInt:v103];
              [v167 setObject:v115 forKeyedSubscript:v94];
            }
            if ((int)v105 >= 1)
            {
              v116 = [MEMORY[0x1E4F28ED0] numberWithInt:v105];
              [v167 setObject:v116 forKeyedSubscript:v95];
            }
            ++v87;
          }
          while (v87 != 18);
          [v157 setObject:v167 forKey:&unk_1F400C448];
          v117 = PLLogAggregateSummarizationService();
          if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            double v178 = *(double *)&v157;
            _os_log_debug_impl(&dword_1E4220000, v117, OS_LOG_TYPE_DEBUG, "Adding to newApps: %@", buf, 0xCu);
          }

          [v154 addObject:v157];
          uint64_t i = v158;
          v54 = v161;
        }
      }
      uint64_t v156 = [obj countByEnumeratingWithState:&v172 objects:v191 count:16];
    }
    while (v156);
  }

  v118 = objc_alloc_init(SignpostReaderHelper);
  v119 = [(SignpostReaderHelper *)v118 getSignpostMetricsWithStartDate:v146 withEndDate:v152 processMXSignpost:v147];
  v120 = [(PLAggregateSummarizationService *)v148 preformatMetricsForFormatter:v154];
  v121 = PLLogAggregateSummarizationService();
  if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG)) {
    -[PLAggregateSummarizationService handleAggregationQueryWithPayload:]((uint64_t)v120, v121, v122, v123, v124, v125, v126, v127);
  }

  [(PLAggregateSummarizationService *)v148 setupMetrics];
  [(PLAggregateSummarizationService *)v148 aggregateMetrics];
  if (v145)
  {
    v128 = -[PLAggregateSummarizationService getDeviceMetadataInRange:withSignpostData:](v148, "getDeviceMetadataInRange:withSignpostData:", v119, v142, v141);
    v129 = objc_alloc_init(PLMetricsFormatterJSON);
    [(PLMetricsFormatterJSON *)v129 addGlobalMetaData:v128];
    [(PLMetricsFormatterJSON *)v129 addAllMetrics:v120 signpostData:v119];
    uint64_t v130 = [(PLMetricsFormatterJSON *)v129 writeSessionFile];
    v131 = PLLogAggregateSummarizationService();
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG)) {
      -[PLAggregateSummarizationService handleAggregationQueryWithPayload:](v131);
    }
  }
  else
  {
    uint64_t v130 = 1;
  }
  if (v147)
  {
    v132 = PLLogAggregateSummarizationService();
    if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG)) {
      -[PLAggregateSummarizationService handleAggregationQueryWithPayload:](v132);
    }

    v133 = objc_alloc_init(PLMetricsFormatterMetricKit);
    v134 = [v152 dateByAddingTimeInterval:-86400.0];
    [(PLMetricsFormatterMetricKit *)v133 publishMetrics:v120 andSignpostData:v119 forDate:v134];
  }
  v135 = objc_opt_new();
  v136 = [MEMORY[0x1E4F28ED0] numberWithBool:v130];
  [v135 setObject:v136 forKeyedSubscript:@"success"];

  v137 = [v119 objectForKeyedSubscript:@"launchesTimeSeries"];

  if (v137)
  {
    v138 = [v119 objectForKeyedSubscript:@"launchesTimeSeries"];
    [v135 setObject:v138 forKeyedSubscript:@"launchesTimeSeries"];
  }
  return v135;
}

void __69__PLAggregateSummarizationService_handleAggregationQueryWithPayload___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PLLogAggregateSummarizationService();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1E4220000, v6, OS_LOG_TYPE_INFO, "Error retrieving opt-in state, %@", (uint8_t *)&v8, 0xCu);
    }
    a2 = 0;
  }
  else if (v7)
  {
    int v8 = 67109120;
    LODWORD(v9) = a2;
    _os_log_impl(&dword_1E4220000, v6, OS_LOG_TYPE_INFO, "GMS opt in state: %d", (uint8_t *)&v8, 8u);
  }

  [*(id *)(a1 + 32) setGmsOptInState:a2];
}

- (void)setupMetrics
{
  id v3 = [(PLAggregateSummarizationService *)self metrics];
  id v4 = [PLASMetric alloc];
  id v5 = [(PLAggregateSummarizationService *)self getQueryForNetworkIOData];
  uint64_t v6 = [(PLAggregateSummarizationService *)self getGenericSummarizer];
  id v7 = [(PLASMetric *)v4 initMetric:@"NetworkIOStats" withType:1 withProperties:&unk_1F4013078 withQuery:v5 andSummarizerBlock:v6];
  [v3 addObject:v7];

  int v8 = [(PLAggregateSummarizationService *)self metrics];
  id v9 = [PLASMetric alloc];
  uint64_t v10 = [(PLAggregateSummarizationService *)self getQueryForCoalitionPowerData];
  uint64_t v11 = [(PLAggregateSummarizationService *)self getGenericSummarizer];
  id v12 = [(PLASMetric *)v9 initMetric:@"CoalitionPowerStats" withType:1 withProperties:&unk_1F4013090 withQuery:v10 andSummarizerBlock:v11];
  [v8 addObject:v12];

  int v13 = [(PLAggregateSummarizationService *)self metrics];
  uint64_t v14 = [PLASMetric alloc];
  int v15 = [(PLAggregateSummarizationService *)self getQueryForAverageMemory];
  uint64_t v16 = [(PLAggregateSummarizationService *)self getGenericSummarizer];
  id v17 = [(PLASMetric *)v14 initMetric:@"AverageMemory" withType:2 withProperties:&unk_1F40130A8 withQuery:v15 andSummarizerBlock:v16];
  [v13 addObject:v17];

  uint64_t v18 = [(PLAggregateSummarizationService *)self metrics];
  int v19 = [PLASMetric alloc];
  v20 = [(PLAggregateSummarizationService *)self getQueryForPeakMemory];
  v21 = [(PLAggregateSummarizationService *)self getGenericSummarizer];
  id v22 = [(PLASMetric *)v19 initMetric:@"PeakMemory" withType:2 withProperties:&unk_1F40130C0 withQuery:v20 andSummarizerBlock:v21];
  [v18 addObject:v22];

  v23 = [(PLAggregateSummarizationService *)self metrics];
  v24 = [PLASMetric alloc];
  id v25 = [(PLAggregateSummarizationService *)self getQueryForDiskIO];
  v26 = [(PLAggregateSummarizationService *)self getGenericSummarizer];
  id v27 = [(PLASMetric *)v24 initMetric:@"DiskIO" withType:2 withProperties:&unk_1F40130D8 withQuery:v25 andSummarizerBlock:v26];
  [v23 addObject:v27];

  double v28 = [(PLAggregateSummarizationService *)self metrics];
  uint64_t v29 = [PLASMetric alloc];
  v30 = [(PLAggregateSummarizationService *)self getQueryForLocationActivity];
  v31 = [(PLAggregateSummarizationService *)self getLocationActivitySummarizer];
  id v32 = [(PLASMetric *)v29 initMetric:@"LocationActivity" withType:1 withProperties:&unk_1F40130F0 withQuery:v30 andSummarizerBlock:v31];
  [v28 addObject:v32];

  double v33 = [(PLAggregateSummarizationService *)self metrics];
  double v34 = [PLASMetric alloc];
  uint64_t v35 = [(PLAggregateSummarizationService *)self getQueryForDisplayAPL];
  double v36 = [(PLAggregateSummarizationService *)self getGenericSummarizer];
  id v37 = [(PLASMetric *)v34 initMetric:@"DisplayAPL" withType:1 withProperties:&unk_1F4013108 withQuery:v35 andSummarizerBlock:v36];
  [v33 addObject:v37];

  id v42 = [(PLAggregateSummarizationService *)self metrics];
  long long v38 = [PLASMetric alloc];
  long long v39 = [(PLAggregateSummarizationService *)self getQueryForCellularCondition];
  long long v40 = [(PLAggregateSummarizationService *)self getCellularConditionSummarizer];
  id v41 = [(PLASMetric *)v38 initMetric:@"CellularCondition" withType:1 withProperties:&unk_1F4013120 withQuery:v39 andSummarizerBlock:v40];
  [v42 addObject:v41];
}

- (void)aggregateMetrics
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(PLAggregateSummarizationService *)self metrics];
  uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    unint64_t v6 = 0x1EAE43000uLL;
    do
    {
      uint64_t v7 = 0;
      uint64_t v17 = v4;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x1E4E7EF70]();
        uint64_t v10 = [v8 query];
        uint64_t v11 = v10[2](*(double *)((char *)&self->super.super.super.isa + *(int *)(v6 + 2432)));

        if (v11 && [v11 count])
        {
          id v12 = [v8 summarizer];
          [v8 metricProperties];
          v14 = unint64_t v13 = v6;
          ((void (**)(void, void *, void *))v12)[2](v12, v11, v14);
          v16 = uint64_t v15 = v5;

          unint64_t v6 = v13;
          -[PLAggregateSummarizationService addMetrics:withType:](self, "addMetrics:withType:", v16, [v8 metricType]);

          uint64_t v5 = v15;
          uint64_t v4 = v17;
        }

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
  }
}

- (void)addMetrics:(id)a3 withType:(signed __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [(NSMutableDictionary *)self->_summarizedData objectForKeyedSubscript:v11];
        unint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithShort:v4];
        uint64_t v14 = [v12 objectForKeyedSubscript:v13];
        uint64_t v15 = [v6 objectForKeyedSubscript:v11];
        [v14 addEntriesFromDictionary:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)getAppList:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "objectForKey:", @"PLBatteryUIAppBundleIDKey", (void)v13);
        if (v11) {
          [(NSArray *)v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  appList = self->_appList;
  self->_appList = v5;
}

- (id)getDeviceMetadataInRange:(_PLTimeIntervalRange)a3 withSignpostData:(id)a4
{
  double length = a3.length;
  double location = a3.location;
  v36[12] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = (void *)CFPreferencesCopyValue(@"AppleLanguages", @"Apple Global Domain", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 count])
  {
    uint64_t v9 = [v8 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v9 = @"<unknown>";
  }
  uint64_t v10 = [MEMORY[0x1E4F1CA20] currentLocale];
  v30 = v8;
  double v28 = v10;
  if (v10)
  {
    uint64_t v11 = [v10 objectForKey:*MEMORY[0x1E4F1C400]];
  }
  else
  {
    uint64_t v11 = @"<unknown>";
  }
  id v12 = [v7 objectForKeyedSubscript:@"hangtracer_enabled"];
  v31 = v7;
  if (v12)
  {
    double v34 = [v7 objectForKeyedSubscript:@"hangtracer_enabled"];
  }
  else
  {
    double v34 = &unk_1F400C478;
  }

  double v33 = -[PLAggregateSummarizationService getPluggedInDurationInRange:](self, "getPluggedInDurationInRange:", location, length);
  long long v13 = -[PLAggregateSummarizationService getDrainInfoInRange:](self, "getDrainInfoInRange:", location, length);
  id v32 = [v13 objectAtIndexedSubscript:0];
  long long v14 = [v13 objectAtIndexedSubscript:1];
  long long v15 = -[PLAggregateSummarizationService getInitCountInRange:](self, "getInitCountInRange:", location, length);
  long long v16 = 0;
  if ([MEMORY[0x1E4F92A38] hasGenerativeModelSystems])
  {
    long long v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[PLAggregateSummarizationService gmsOptInState](self, "gmsOptInState"));
  }
  v35[0] = @"log_version";
  v35[1] = @"region_format";
  long long v17 = @"<none>";
  if (v11) {
    uint64_t v18 = v11;
  }
  else {
    uint64_t v18 = @"<none>";
  }
  v36[0] = &unk_1F400C490;
  v36[1] = v18;
  uint64_t v29 = v9;
  if (v9) {
    long long v17 = v9;
  }
  v36[2] = v17;
  v35[2] = @"language";
  v35[3] = @"os_version";
  long long v19 = [(id)objc_opt_class() osVersion];
  v26 = v11;
  if (v19)
  {
    objc_msgSend((id)objc_opt_class(), "osVersion", v11, v28, v29, v30, v31);
    long long v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v20 = @"<unknown>";
  }
  v36[3] = v20;
  v35[4] = @"machine_config";
  uint64_t v21 = [(id)objc_opt_class() modelIdentifier];
  v36[4] = v21;
  v35[5] = @"os_variant";
  long long v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithShort:", objc_msgSend((id)objc_opt_class(), "buildType"));
  v36[5] = v22;
  v36[6] = v34;
  v35[6] = @"hangtracer_enabled";
  v35[7] = @"plugged_in_duration";
  v35[8] = @"total_drain";
  v35[9] = @"energy_consumed";
  v36[7] = v33;
  v36[8] = v32;
  v36[9] = v14;
  v35[10] = @"init_count";
  v35[11] = @"gms_opt_in";
  v23 = v16;
  v36[10] = v15;
  if (!v16)
  {
    v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[PLAggregateSummarizationService gmsOptInState](self, "gmsOptInState"));
  }
  v36[11] = v23;
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v36, v35, 12, v26);
  if (!v16) {

  }
  if (v19) {
  return v24;
  }
}

- (id)getDrainInfoInRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"UILevel"];
  id v7 = [(PLOperator *)self storage];
  v23 = (void *)v6;
  uint64_t v8 = objc_msgSend(v7, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v6, 3600.0, location, length);

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    LODWORD(v11) = 0;
    LODWORD(v12) = 0;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(obj);
        }
        long long v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v16 = [v15 objectForKeyedSubscript:@"Level"];
        int v17 = [v16 intValue];

        uint64_t v12 = (v17 + v12);
        uint64_t v18 = [v15 objectForKeyedSubscript:@"energyConsumed"];
        LODWORD(v16) = [v18 intValue];

        uint64_t v11 = (v16 + v11);
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }

  long long v19 = [MEMORY[0x1E4F28ED0] numberWithInt:v12];
  v29[0] = v19;
  long long v20 = [MEMORY[0x1E4F28ED0] numberWithInt:v11];
  v29[1] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];

  return v21;
}

- (id)getPluggedInDurationInRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"UsageTime"];
  id v7 = [(PLOperator *)self storage];
  uint64_t v8 = objc_msgSend(v7, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v6, 3600.0, location, length);

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    LODWORD(v12) = 0;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v9);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "objectForKeyedSubscript:", @"PluggedIn", (void)v19);
        int v16 = [v15 intValue];

        uint64_t v12 = (v16 + v12);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  int v17 = [MEMORY[0x1E4F28ED0] numberWithInt:v12];

  return v17;
}

- (id)getInitCountInRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  uint64_t v6 = [MEMORY[0x1E4F92A60] entryKeyForType:*MEMORY[0x1E4F92D30] andName:*MEMORY[0x1E4F92D88]];
  id v7 = [(PLOperator *)self storage];
  uint64_t v8 = objc_msgSend(v7, "entriesForKey:inTimeRange:withFilters:", v6, 0, location, length);

  id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));

  return v9;
}

- (id)getQueryForAppMultipleVersions
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PLAggregateSummarizationService_getQueryForAppMultipleVersions__block_invoke;
  v5[3] = &unk_1E6E484A0;
  v5[4] = self;
  objc_super v2 = (void *)MEMORY[0x1E4E7F1C0](v5, a2);
  uint64_t v3 = (void *)MEMORY[0x1E4E7F1C0]();

  return v3;
}

id __65__PLAggregateSummarizationService_getQueryForAppMultipleVersions__block_invoke(uint64_t a1, double a2)
{
  objc_msgSend(NSString, "stringWithFormat:", @"                           SELECT AppBundleId AS %@, COUNT(DISTINCT AppBundleVersion) > 1 AS %@                           FROM PLApplicationAgent_EventNone_AllApps                           WHERE timestamp >= %f AND timestamp < %f GROUP BY %@;",
    @"BundleId",
    @"app_multiple_versions",
    a2 + -86400.0,
    *(void *)&a2,
  uint64_t v3 = @"BundleId");
  id v4 = [*(id *)(a1 + 32) storage];
  uint64_t v5 = [v4 connection];
  uint64_t v6 = [v5 performQuery:v3];

  return v6;
}

- (id)getQueryForNetworkIOData
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PLAggregateSummarizationService_getQueryForNetworkIOData__block_invoke;
  v5[3] = &unk_1E6E484A0;
  v5[4] = self;
  objc_super v2 = (void *)MEMORY[0x1E4E7F1C0](v5, a2);
  uint64_t v3 = (void *)MEMORY[0x1E4E7F1C0]();

  return v3;
}

id __59__PLAggregateSummarizationService_getQueryForNetworkIOData__block_invoke(uint64_t a1, double a2)
{
  objc_msgSend(NSString, "stringWithFormat:", @"                             SELECT BundleName AS %@, SUM(CellIn) %@, SUM(CellOut) %@, SUM(WifiIn) %@, SUM(WifiOut) %@                             FROM PLProcessNetworkAgent_EventInterval_UsageDiff                             WHERE timestamp >= %f AND timestamp < %f GROUP BY %@;",
    @"BundleId",
    @"bytesCellularIn",
    @"bytesCellularOut",
    @"bytesWifiIn",
    @"bytesWifiOut",
    a2 + -86400.0,
    *(void *)&a2,
  uint64_t v3 = @"BundleId");
  id v4 = [*(id *)(a1 + 32) storage];
  uint64_t v5 = [v4 connection];
  uint64_t v6 = [v5 performQuery:v3];

  return v6;
}

- (id)getQueryForCoalitionPowerData
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PLAggregateSummarizationService_getQueryForCoalitionPowerData__block_invoke;
  v5[3] = &unk_1E6E484A0;
  v5[4] = self;
  objc_super v2 = (void *)MEMORY[0x1E4E7F1C0](v5, a2);
  uint64_t v3 = (void *)MEMORY[0x1E4E7F1C0]();

  return v3;
}

id __64__PLAggregateSummarizationService_getQueryForCoalitionPowerData__block_invoke(uint64_t a1, double a2)
{
  objc_msgSend(NSString, "stringWithFormat:", @"                             SELECT BundleID AS %@, SUM(cpu_time) %@, SUM(gpu_time) %@, SUM(cpu_instructions) %@                             FROM PLCoalitionAgent_EventInterval_CoalitionInterval                             WHERE timestamp >= %f AND timestamp < %f GROUP BY %@;",
    @"BundleId",
    @"CPUTime",
    @"GPUTime",
    @"CPUInstructions",
    a2 + -86400.0,
    *(void *)&a2,
  uint64_t v3 = @"BundleId");
  id v4 = [*(id *)(a1 + 32) storage];
  uint64_t v5 = [v4 connection];
  uint64_t v6 = [v5 performQuery:v3];

  return v6;
}

- (id)getQueryForDiskIO
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PLAggregateSummarizationService_getQueryForDiskIO__block_invoke;
  v5[3] = &unk_1E6E484A0;
  v5[4] = self;
  objc_super v2 = (void *)MEMORY[0x1E4E7F1C0](v5, a2);
  uint64_t v3 = (void *)MEMORY[0x1E4E7F1C0]();

  return v3;
}

id __52__PLAggregateSummarizationService_getQueryForDiskIO__block_invoke(uint64_t a1)
{
  objc_super v2 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  uint64_t v3 = [v2 dateByAddingTimeInterval:-86400.0];
  id v4 = v2;
  [v3 timeIntervalSince1970];
  double v6 = v5;
  [v4 timeIntervalSince1970];
  double v8 = v7;

  id v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"Metrics"];
  uint64_t v10 = [*(id *)(a1 + 32) storage];
  uint64_t v11 = objc_msgSend(v10, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v9, 3600.0, v6, v8 - v6);

  uint64_t v12 = [MEMORY[0x1E4F929D0] summarizeAggregateEntries:v11];

  return v12;
}

- (id)getQueryForAverageMemory
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PLAggregateSummarizationService_getQueryForAverageMemory__block_invoke;
  v5[3] = &unk_1E6E484A0;
  v5[4] = self;
  objc_super v2 = (void *)MEMORY[0x1E4E7F1C0](v5, a2);
  uint64_t v3 = (void *)MEMORY[0x1E4E7F1C0]();

  return v3;
}

id __59__PLAggregateSummarizationService_getQueryForAverageMemory__block_invoke(uint64_t a1, double a2)
{
  objc_msgSend(NSString, "stringWithFormat:", @"                           SELECT Q.A %@, Q.B %@, Q.C %@, AVG((SuspendedMemory - Q.B)*(SuspendedMemory - Q.B)) %@ from PLApplicationAgent_EventBackward_ApplicationMemory as T,                            (SELECT AppBundleId AS A, AVG(SuspendedMemory) AS B, COUNT(SuspendedMemory) AS C from PLApplicationAgent_EventBackward_ApplicationMemory                              WHERE timestamp >= %f AND timestamp < %f GROUP BY AppBundleId                            ) AS Q WHERE Q.A = T.AppBundleId AND timestamp >= %f AND timestamp < %f GROUP BY %@;",
    @"BundleId",
    @"AverageMemory",
    @"AverageMemoryCount",
    @"AverageMemoryVariance",
    a2 + -86400.0,
    *(void *)&a2,
    a2 + -86400.0,
    *(void *)&a2,
  uint64_t v3 = @"BundleId");
  id v4 = [*(id *)(a1 + 32) storage];
  double v5 = [v4 connection];
  double v6 = [v5 performQuery:v3];

  return v6;
}

- (id)getQueryForPeakMemory
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PLAggregateSummarizationService_getQueryForPeakMemory__block_invoke;
  v5[3] = &unk_1E6E484A0;
  v5[4] = self;
  objc_super v2 = (void *)MEMORY[0x1E4E7F1C0](v5, a2);
  uint64_t v3 = (void *)MEMORY[0x1E4E7F1C0]();

  return v3;
}

id __56__PLAggregateSummarizationService_getQueryForPeakMemory__block_invoke(uint64_t a1, double a2)
{
  objc_msgSend(NSString, "stringWithFormat:", @"                           SELECT AppBundleId AS %@, MAX(PeakMemory) %@ from PLApplicationAgent_EventBackward_ApplicationMemory WHERE timestamp >= %f AND timestamp < %f                           GROUP BY %@;",
    @"BundleId",
    @"PeakMemory",
    a2 + -86400.0,
    *(void *)&a2,
  uint64_t v3 = @"BundleId");
  id v4 = [*(id *)(a1 + 32) storage];
  double v5 = [v4 connection];
  double v6 = [v5 performQuery:v3];

  return v6;
}

- (id)getQueryForLocationActivity
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__PLAggregateSummarizationService_getQueryForLocationActivity__block_invoke;
  v5[3] = &unk_1E6E484A0;
  v5[4] = self;
  objc_super v2 = (void *)MEMORY[0x1E4E7F1C0](v5, a2);
  uint64_t v3 = (void *)MEMORY[0x1E4E7F1C0]();

  return v3;
}

id __62__PLAggregateSummarizationService_getQueryForLocationActivity__block_invoke(uint64_t a1, double a2)
{
  objc_msgSend(NSString, "stringWithFormat:", @"                           SELECT Q.A %@, Q.B LocationDesiredAccuracy, SUM(tE - t) TotalTime FROM                             (SELECT BundleID AS A, LocationDesiredAccuracy AS B,                                    CASE WHEN (timestampEnd > %f OR timestampEnd is NULL) THEN %f ELSE timestampEnd END as tE,                                    CASE WHEN timestamp < %f THEN %f ELSE timestamp END as t                             FROM PLLocationAgent_EventForward_ClientStatus WHERE Type='Location' AND tE >= %f AND t < %f AND tE > t                           ) AS Q GROUP BY %@, LocationDesiredAccuracy;",
    @"BundleId",
    *(void *)&a2,
    *(void *)&a2,
    a2 + -86400.0,
    a2 + -86400.0,
    a2 + -86400.0,
    *(void *)&a2,
  uint64_t v3 = @"BundleId");
  id v4 = [*(id *)(a1 + 32) storage];
  double v5 = [v4 connection];
  double v6 = [v5 performQuery:v3];

  return v6;
}

- (id)getQueryForDisplayAPL
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PLAggregateSummarizationService_getQueryForDisplayAPL__block_invoke;
  v5[3] = &unk_1E6E484A0;
  v5[4] = self;
  objc_super v2 = (void *)MEMORY[0x1E4E7F1C0](v5, a2);
  uint64_t v3 = (void *)MEMORY[0x1E4E7F1C0]();

  return v3;
}

id __56__PLAggregateSummarizationService_getQueryForDisplayAPL__block_invoke(uint64_t a1, double a2)
{
  objc_msgSend(NSString, "stringWithFormat:", @"                           SELECT bundleID AS %@, SUM(%f * Frames * (%f*AvgRed + %f*AvgGreen + %f*AvgBlue))/SUM(Frames) %@, SUM(Frames) %@ FROM PLDisplayAgent_EventBackward_APLStats                           WHERE timestamp >= %f AND timestamp < %f                           GROUP BY %@;",
    @"BundleId",
    0x3FD9191919191919,
    0x3FD3D70A3D70A3D7,
    0x3FD0000000000000,
    0x3FDC28F5C28F5C29,
    @"AveragePictureLevel",
    @"TotalFrameCount",
    a2 + -86400.0,
    *(void *)&a2,
  uint64_t v3 = @"BundleId");
  id v4 = [*(id *)(a1 + 32) storage];
  double v5 = [v4 connection];
  double v6 = [v5 performQuery:v3];

  return v6;
}

- (id)getQueryForCellularCondition
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__PLAggregateSummarizationService_getQueryForCellularCondition__block_invoke;
  v5[3] = &unk_1E6E484A0;
  v5[4] = self;
  objc_super v2 = (void *)MEMORY[0x1E4E7F1C0](v5, a2);
  uint64_t v3 = (void *)MEMORY[0x1E4E7F1C0]();

  return v3;
}

id __63__PLAggregateSummarizationService_getQueryForCellularCondition__block_invoke(uint64_t a1, double a2)
{
  objc_msgSend(NSString, "stringWithFormat:", @"                           SELECT BundleID AS %@, SignalBars, SUM(CellUsageTime) AS TotalTime FROM PLAppTimeService_Aggregate_CellularCondition                           WHERE timestamp >= %f AND timestamp < %f                           GROUP BY %@, SignalBars;",
    @"BundleId",
    a2 + -86400.0,
    *(void *)&a2,
  uint64_t v3 = @"BundleId");
  id v4 = [*(id *)(a1 + 32) storage];
  double v5 = [v4 connection];
  double v6 = [v5 performQuery:v3];

  return v6;
}

- (void)getAppMetadata
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  [(PLAggregateSummarizationService *)self getAppMultipleVersionsData];
  v40 = long long v39 = self;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = [(PLAggregateSummarizationService *)self appList];
  uint64_t v41 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v41)
  {
    uint64_t v38 = *(void *)v63;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v63 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v61 = v3;
        uint64_t v4 = *(void *)(*((void *)&v62 + 1) + 8 * v3);
        uint64_t v5 = [objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"AppBundleId" withValue:v4 withComparisonOperation:0];
        double v6 = [MEMORY[0x1E4F92AD0] sharedCore];
        double v7 = [v6 storage];
        uint64_t v60 = (void *)v5;
        uint64_t v68 = v5;
        double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
        id v9 = [v7 lastEntryForKey:@"PLApplicationAgent_EventNone_AllApps" withComparisons:v8 isSingleton:1];

        v67[0] = v4;
        v66[0] = @"app_bundleid";
        v66[1] = @"app_is_clip";
        v53 = [v9 objectForKeyedSubscript:@"AppIsClip"];
        if ([v53 BOOLValue]) {
          uint64_t v10 = @"true";
        }
        else {
          uint64_t v10 = @"false";
        }
        v67[1] = v10;
        v66[2] = @"app_build_version";
        uint64_t v11 = [v9 objectForKeyedSubscript:@"AppBuildVersion"];
        if (v11)
        {
          v52 = [v9 objectForKeyedSubscript:@"AppBuildVersion"];
          uint64_t v12 = v52;
        }
        else
        {
          uint64_t v12 = &stru_1F3FCA098;
        }
        v67[2] = v12;
        v66[3] = @"app_version";
        uint64_t v58 = [v9 objectForKeyedSubscript:@"AppBundleVersion"];
        if (v58)
        {
          v51 = [v9 objectForKeyedSubscript:@"AppBundleVersion"];
          uint64_t v13 = v51;
        }
        else
        {
          uint64_t v13 = &stru_1F3FCA098;
        }
        v67[3] = v13;
        v66[4] = @"app_sessionreporter_key";
        v57 = [v9 objectForKeyedSubscript:@"AppVendorID"];
        if (v57)
        {
          v50 = [v9 objectForKeyedSubscript:@"AppVendorID"];
          long long v14 = v50;
        }
        else
        {
          long long v14 = &stru_1F3FCA098;
        }
        v67[4] = v14;
        v66[5] = @"app_adamid";
        v56 = [v9 objectForKeyedSubscript:@"AppItemID"];
        if (v56)
        {
          double v49 = [v9 objectForKeyedSubscript:@"AppItemID"];
          long long v15 = v49;
        }
        else
        {
          long long v15 = &stru_1F3FCA098;
        }
        v67[5] = v15;
        v66[6] = @"app_cohort";
        v55 = [v9 objectForKeyedSubscript:@"AppCohort"];
        if (v55)
        {
          double v48 = [v9 objectForKeyedSubscript:@"AppCohort"];
          int v16 = v48;
        }
        else
        {
          int v16 = &stru_1F3FCA098;
        }
        v67[6] = v16;
        v66[7] = @"app_storefront";
        int v17 = [v9 objectForKeyedSubscript:@"AppStoreFront"];
        if (v17)
        {
          double v47 = [v9 objectForKeyedSubscript:@"AppStoreFront"];
          uint64_t v18 = v47;
        }
        else
        {
          uint64_t v18 = &stru_1F3FCA098;
        }
        v67[7] = v18;
        v66[8] = @"app_is_beta";
        long long v19 = [v9 objectForKeyedSubscript:@"AppIsBeta"];
        if ([v19 BOOLValue]) {
          long long v20 = @"true";
        }
        else {
          long long v20 = @"false";
        }
        v67[8] = v20;
        v66[9] = @"app_arch";
        long long v21 = [v9 objectForKeyedSubscript:@"AppArchitecture"];
        v59 = (void *)v11;
        if (v21)
        {
          double v46 = [v9 objectForKeyedSubscript:@"AppArchitecture"];
          long long v22 = v46;
        }
        else
        {
          long long v22 = &stru_1F3FCA098;
        }
        v67[9] = v22;
        v66[10] = @"slice_uuid";
        v23 = [v9 objectForKeyedSubscript:@"AppUUID"];
        if (v23)
        {
          double v45 = [v9 objectForKeyedSubscript:@"AppUUID"];
          uint64_t v24 = v45;
        }
        else
        {
          uint64_t v24 = &stru_1F3FCA098;
        }
        v67[10] = v24;
        v66[11] = @"app_multiple_versions";
        long long v25 = [v40 objectForKeyedSubscript:v4];
        long long v26 = v53;
        if (v25)
        {
          double v44 = [v40 objectForKeyedSubscript:v4];
          id v42 = [v44 objectForKeyedSubscript:@"app_multiple_versions"];
          long long v27 = v42;
        }
        else
        {
          long long v27 = &unk_1F400C4A8;
        }
        v67[11] = v27;
        v66[12] = @"app_distributorid";
        long long v28 = [v9 objectForKeyedSubscript:@"AppDistributorID"];
        if (v28)
        {
          id v43 = [v9 objectForKeyedSubscript:@"AppDistributorID"];
          uint64_t v29 = v43;
        }
        else
        {
          uint64_t v29 = &stru_1F3FCA098;
        }
        v67[12] = v29;
        v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:13];
        if (v28) {

        }
        if (v25)
        {
        }
        if (v23) {

        }
        if (v21) {
        if (v17)
        }

        if (v55) {
        if (v56)
        }

        if (v57) {
        if (v58)
        }

        if (v59) {
        summarizedData = v39->_summarizedData;
        }
        id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [(NSMutableDictionary *)summarizedData setObject:v31 forKey:v4];

        id v32 = [(NSMutableDictionary *)v39->_summarizedData objectForKeyedSubscript:v4];
        id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v32 setObject:v33 forKey:&unk_1F400C448];

        double v34 = [(NSMutableDictionary *)v39->_summarizedData objectForKeyedSubscript:v4];
        id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v34 setObject:v35 forKey:&unk_1F400C460];

        double v36 = [(NSMutableDictionary *)v39->_summarizedData objectForKeyedSubscript:v4];
        [v36 setObject:v54 forKey:&unk_1F400C4C0];

        uint64_t v3 = v61 + 1;
      }
      while (v41 != v61 + 1);
      uint64_t v41 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v41);
  }
}

- (id)getAppMultipleVersionsData
{
  uint64_t v3 = [PLASMetric alloc];
  uint64_t v4 = [(PLAggregateSummarizationService *)self getQueryForAppMultipleVersions];
  uint64_t v5 = [(PLAggregateSummarizationService *)self getGenericSummarizer];
  id v6 = [(PLASMetric *)v3 initMetric:@"app_multiple_versions" withType:0 withProperties:&unk_1F4013138 withQuery:v4 andSummarizerBlock:v5];

  double v7 = [v6 query];
  double v8 = v7[2](self->_maxTimestamp);

  if (v8 && [v8 count])
  {
    id v9 = [v6 summarizer];
    uint64_t v10 = [v6 metricProperties];
    uint64_t v11 = ((void (**)(void, void *, void *))v9)[2](v9, v8, v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)getGenericSummarizer
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PLAggregateSummarizationService_getGenericSummarizer__block_invoke;
  v5[3] = &unk_1E6E484C8;
  v5[4] = self;
  objc_super v2 = (void *)MEMORY[0x1E4E7F1C0](v5, a2);
  uint64_t v3 = (void *)MEMORY[0x1E4E7F1C0]();

  return v3;
}

id __55__PLAggregateSummarizationService_getGenericSummarizer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v31 = a3;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v42;
    uint64_t v29 = *(void *)v42;
    uint64_t v30 = a1;
    do
    {
      uint64_t v9 = 0;
      uint64_t v33 = v7;
      do
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v41 + 1) + 8 * v9);
        if (v10)
        {
          uint64_t v11 = [*(id *)(*((void *)&v41 + 1) + 8 * v9) objectForKey:@"BundleId"];
          uint64_t v12 = [*(id *)(a1 + 32) appList];
          int v13 = [v12 containsObject:v11];

          if (v13)
          {
            id v35 = v11;
            uint64_t v36 = v9;
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            id v15 = v31;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v45 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v38;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v38 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v20 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                  uint64_t v21 = objc_msgSend(v10, "objectForKeyedSubscript:", v20, v29, v30);
                  if (v21)
                  {
                    long long v22 = (void *)v21;
                    v23 = [v10 objectForKeyedSubscript:v20];
                    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];

                    if (v23 != v24)
                    {
                      long long v25 = (void *)MEMORY[0x1E4F28ED0];
                      long long v26 = [v10 objectForKeyedSubscript:v20];
                      long long v27 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "unsignedIntegerValue"));
                      [v14 setObject:v27 forKey:v20];
                    }
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v45 count:16];
              }
              while (v17);
            }

            uint64_t v11 = v35;
            [v32 setObject:v14 forKey:v35];

            uint64_t v8 = v29;
            a1 = v30;
            uint64_t v7 = v33;
            uint64_t v9 = v36;
          }
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v7);
  }

  return v32;
}

- (id)getLocationActivitySummarizer
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PLAggregateSummarizationService_getLocationActivitySummarizer__block_invoke;
  v5[3] = &unk_1E6E484C8;
  v5[4] = self;
  objc_super v2 = (void *)MEMORY[0x1E4E7F1C0](v5, a2);
  uint64_t v3 = (void *)MEMORY[0x1E4E7F1C0]();

  return v3;
}

id __64__PLAggregateSummarizationService_getLocationActivitySummarizer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v46 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v57;
    double v10 = *MEMORY[0x1E4F1E6D8];
    double v11 = *MEMORY[0x1E4F1E6E0];
    double v12 = *MEMORY[0x1E4F1E718];
    double v13 = *MEMORY[0x1E4F1E6E8];
    double v14 = *MEMORY[0x1E4F1E6F8];
    double v15 = *MEMORY[0x1E4F1E748];
    uint64_t v50 = a1;
    uint64_t v48 = *(void *)v57;
    do
    {
      uint64_t v16 = 0;
      uint64_t v49 = v8;
      do
      {
        if (*(void *)v57 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v56 + 1) + 8 * v16);
        if (v17)
        {
          uint64_t v18 = [*(id *)(*((void *)&v56 + 1) + 8 * v16) objectForKey:@"BundleId"];
          long long v19 = [*(id *)(a1 + 32) appList];
          int v20 = [v19 containsObject:v18];

          if (v20)
          {
            uint64_t v21 = [v17 objectForKeyedSubscript:@"LocationDesiredAccuracy"];
            uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
            if (v21 == (void *)v22)
            {
              long long v41 = v21;
              a1 = v50;
              goto LABEL_33;
            }
            v23 = (void *)v22;
            uint64_t v24 = [v17 objectForKeyedSubscript:@"TotalTime"];
            long long v25 = [MEMORY[0x1E4F1CA98] null];

            BOOL v26 = v24 == v25;
            uint64_t v9 = v48;
            uint64_t v8 = v49;
            a1 = v50;
            if (!v26)
            {
              long long v27 = [v6 objectForKey:v18];

              if (!v27)
              {
                uint64_t v47 = v17;
                id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                [v6 setObject:v28 forKey:v18];

                long long v54 = 0u;
                long long v55 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                id v29 = v46;
                uint64_t v30 = [v29 countByEnumeratingWithState:&v52 objects:v60 count:16];
                if (v30)
                {
                  uint64_t v31 = v30;
                  uint64_t v32 = *(void *)v53;
                  do
                  {
                    for (uint64_t i = 0; i != v31; ++i)
                    {
                      if (*(void *)v53 != v32) {
                        objc_enumerationMutation(v29);
                      }
                      uint64_t v34 = *(void *)(*((void *)&v52 + 1) + 8 * i);
                      id v35 = objc_msgSend(v6, "objectForKeyedSubscript:", v18, v46);
                      [v35 setObject:&unk_1F400C4A8 forKey:v34];
                    }
                    uint64_t v31 = [v29 countByEnumeratingWithState:&v52 objects:v60 count:16];
                  }
                  while (v31);
                }

                a1 = v50;
                uint64_t v17 = v47;
              }
              uint64_t v36 = objc_msgSend(v17, "objectForKeyedSubscript:", @"LocationDesiredAccuracy", v46);
              [v36 doubleValue];
              double v38 = v37;

              long long v39 = (void *)MEMORY[0x1E4F28ED0];
              long long v40 = [v17 objectForKeyedSubscript:@"TotalTime"];
              long long v41 = objc_msgSend(v39, "numberWithUnsignedInteger:", objc_msgSend(v40, "unsignedIntegerValue"));

              if (v38 == v10)
              {
                uint64_t v21 = [v6 objectForKeyedSubscript:v18];
                [v21 setObject:v41 forKey:@"BestAccuracy"];
                uint64_t v9 = v48;
                uint64_t v8 = v49;
                goto LABEL_33;
              }
              uint64_t v9 = v48;
              uint64_t v8 = v49;
              if (v38 == v11)
              {
                long long v42 = [v6 objectForKeyedSubscript:v18];
                uint64_t v21 = v42;
                long long v43 = v41;
                long long v44 = @"BestAccuracyForNavigation";
                goto LABEL_32;
              }
              if (v38 == v12)
              {
                long long v42 = [v6 objectForKeyedSubscript:v18];
                uint64_t v21 = v42;
                long long v43 = v41;
                long long v44 = @"NearestTenMetersAccuracy";
                goto LABEL_32;
              }
              if (v38 == v13)
              {
                long long v42 = [v6 objectForKeyedSubscript:v18];
                uint64_t v21 = v42;
                long long v43 = v41;
                long long v44 = @"HundredMetersAccuracy";
                goto LABEL_32;
              }
              if (v38 == v14)
              {
                long long v42 = [v6 objectForKeyedSubscript:v18];
                uint64_t v21 = v42;
                long long v43 = v41;
                long long v44 = @"KilometerAccuracy";
                goto LABEL_32;
              }
              if (v38 == v15)
              {
                long long v42 = [v6 objectForKeyedSubscript:v18];
                uint64_t v21 = v42;
                long long v43 = v41;
                long long v44 = @"ThreeKilometersAccuracy";
LABEL_32:
                [v42 setObject:v43 forKey:v44];
LABEL_33:
              }
            }
          }
        }
        ++v16;
      }
      while (v16 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)getCellularConditionSummarizer
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PLAggregateSummarizationService_getCellularConditionSummarizer__block_invoke;
  v5[3] = &unk_1E6E484C8;
  v5[4] = self;
  objc_super v2 = (void *)MEMORY[0x1E4E7F1C0](v5, a2);
  uint64_t v3 = (void *)MEMORY[0x1E4E7F1C0]();

  return v3;
}

id __65__PLAggregateSummarizationService_getCellularConditionSummarizer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v42 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v53;
    *(void *)&long long v8 = 134218242;
    long long v41 = v8;
    uint64_t v46 = a1;
    uint64_t v44 = *(void *)v53;
    do
    {
      uint64_t v11 = 0;
      uint64_t v45 = v9;
      do
      {
        if (*(void *)v53 != v10) {
          objc_enumerationMutation(obj);
        }
        double v12 = *(void **)(*((void *)&v52 + 1) + 8 * v11);
        if (v12)
        {
          double v13 = [*(id *)(*((void *)&v52 + 1) + 8 * v11) objectForKey:@"BundleId"];
          double v14 = [*(id *)(a1 + 32) appList];
          int v15 = [v14 containsObject:v13];

          if (v15)
          {
            uint64_t v16 = [v12 objectForKeyedSubscript:@"SignalBars"];
            uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
            if (v16 == (void *)v17)
            {
              id v35 = v16;
              a1 = v46;
              goto LABEL_30;
            }
            uint64_t v18 = (void *)v17;
            long long v19 = [v12 objectForKeyedSubscript:@"TotalTime"];
            int v20 = [MEMORY[0x1E4F1CA98] null];

            BOOL v21 = v19 == v20;
            uint64_t v10 = v44;
            uint64_t v9 = v45;
            a1 = v46;
            if (!v21)
            {
              uint64_t v22 = [v6 objectForKey:v13];

              if (!v22)
              {
                long long v43 = v12;
                id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                [v6 setObject:v23 forKey:v13];

                long long v50 = 0u;
                long long v51 = 0u;
                long long v48 = 0u;
                long long v49 = 0u;
                id v24 = v42;
                uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v60 count:16];
                if (v25)
                {
                  uint64_t v26 = v25;
                  uint64_t v27 = *(void *)v49;
                  do
                  {
                    for (uint64_t i = 0; i != v26; ++i)
                    {
                      if (*(void *)v49 != v27) {
                        objc_enumerationMutation(v24);
                      }
                      uint64_t v29 = *(void *)(*((void *)&v48 + 1) + 8 * i);
                      uint64_t v30 = objc_msgSend(v6, "objectForKeyedSubscript:", v13, v41);
                      [v30 setObject:&unk_1F400C4A8 forKey:v29];
                    }
                    uint64_t v26 = [v24 countByEnumeratingWithState:&v48 objects:v60 count:16];
                  }
                  while (v26);
                }

                a1 = v46;
                double v12 = v43;
              }
              uint64_t v31 = objc_msgSend(v12, "objectForKeyedSubscript:", @"SignalBars", v41);
              uint64_t v32 = [v31 integerValue];

              uint64_t v33 = (void *)MEMORY[0x1E4F28ED0];
              uint64_t v34 = [v12 objectForKeyedSubscript:@"TotalTime"];
              id v35 = objc_msgSend(v33, "numberWithUnsignedInteger:", objc_msgSend(v34, "unsignedIntegerValue"));

              switch(v32)
              {
                case 0:
                  uint64_t v36 = [v6 objectForKeyedSubscript:v13];
                  uint64_t v16 = v36;
                  double v37 = v35;
                  double v38 = @"SignalBar0";
                  break;
                case 1:
                  uint64_t v36 = [v6 objectForKeyedSubscript:v13];
                  uint64_t v16 = v36;
                  double v37 = v35;
                  double v38 = @"SignalBar1";
                  break;
                case 2:
                  uint64_t v36 = [v6 objectForKeyedSubscript:v13];
                  uint64_t v16 = v36;
                  double v37 = v35;
                  double v38 = @"SignalBar2";
                  break;
                case 3:
                  uint64_t v36 = [v6 objectForKeyedSubscript:v13];
                  uint64_t v16 = v36;
                  double v37 = v35;
                  double v38 = @"SignalBar3";
                  break;
                case 4:
                  uint64_t v36 = [v6 objectForKeyedSubscript:v13];
                  uint64_t v16 = v36;
                  double v37 = v35;
                  double v38 = @"SignalBar4";
                  break;
                default:
                  long long v39 = PLLogAggregateSummarizationService();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = v41;
                    uint64_t v57 = v32;
                    __int16 v58 = 2112;
                    long long v59 = v13;
                    _os_log_error_impl(&dword_1E4220000, v39, OS_LOG_TYPE_ERROR, "Invalid signal bar: %ld for bundleID: %@", buf, 0x16u);
                  }

                  uint64_t v36 = [v6 objectForKeyedSubscript:v13];
                  uint64_t v16 = v36;
                  double v37 = v35;
                  double v38 = @"SignalBarUnknown";
                  break;
              }
              [v36 setObject:v37 forKey:v38];
              uint64_t v10 = v44;
              uint64_t v9 = v45;
LABEL_30:
            }
          }
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)osVersion
{
  if (osVersion_onceToken != -1) {
    dispatch_once(&osVersion_onceToken, &__block_literal_global_520);
  }
  objc_super v2 = (void *)osVersion_osVersion;
  return v2;
}

void __44__PLAggregateSummarizationService_osVersion__block_invoke()
{
  id v6 = (id)_CFCopySupplementalVersionDictionary();
  if (v6)
  {
    id v0 = [NSString alloc];
    v1 = [v6 objectForKeyedSubscript:@"ProductName"];
    objc_super v2 = [v6 objectForKeyedSubscript:@"ProductVersion"];
    uint64_t v3 = [v6 objectForKeyedSubscript:@"ProductBuildVersion"];
    uint64_t v4 = [v0 initWithFormat:@"%@ %@ (%@)", v1, v2, v3];
    id v5 = (void *)osVersion_osVersion;
    osVersion_osVersion = v4;
  }
  else
  {
    v1 = (void *)osVersion_osVersion;
    osVersion_osVersion = 0;
  }
}

+ (id)modelIdentifier
{
  if (modelIdentifier_onceToken != -1) {
    dispatch_once(&modelIdentifier_onceToken, &__block_literal_global_534);
  }
  objc_super v2 = (void *)modelIdentifier_modelIdentifier;
  return v2;
}

void __50__PLAggregateSummarizationService_modelIdentifier__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  *(void *)uint64_t v4 = 0x100000006;
  memset(v3, 0, sizeof(v3));
  size_t v2 = 64;
  sysctl(v4, 2u, v3, &v2, 0, 0);
  uint64_t v0 = [[NSString alloc] initWithCString:v3 encoding:1];
  v1 = (void *)modelIdentifier_modelIdentifier;
  modelIdentifier_modelIdentifier = v0;
}

+ (signed)buildType
{
  return [MEMORY[0x1E4F92A38] internalBuild];
}

- (NSMutableDictionary)summarizedData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSummarizedData:(id)a3
{
}

- (NSMutableArray)metrics
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMetrics:(id)a3
{
}

- (NSArray)appList
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAppList:(id)a3
{
}

- (double)maxTimestamp
{
  return self->_maxTimestamp;
}

- (void)setMaxTimestamp:(double)a3
{
  self->_maxTimestamp = a3;
}

- (BOOL)gmsOptInState
{
  return self->_gmsOptInState;
}

- (void)setGmsOptInState:(BOOL)a3
{
  self->_gmsOptInState = a3;
}

- (PLXPCResponderOperatorComposition)aggregationResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAggregationResponder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregationResponder, 0);
  objc_storeStrong((id *)&self->_appList, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_summarizedData, 0);
}

- (void)preformatMetricsForFormatter:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E4220000, log, OS_LOG_TYPE_ERROR, "app list error", v1, 2u);
}

- (void)preformatMetricsForFormatter:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleAggregationQueryWithPayload:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "Sending metrics to MetricKit", v1, 2u);
}

- (void)handleAggregationQueryWithPayload:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "Session File Writing Complete", v1, 2u);
}

- (void)handleAggregationQueryWithPayload:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleAggregationQueryWithPayload:(os_log_t)log .cold.4(char a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "handleAggregationQuery with queryType:%d today:%d", (uint8_t *)v3, 0xEu);
}

- (void)handleAggregationQueryWithPayload:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end