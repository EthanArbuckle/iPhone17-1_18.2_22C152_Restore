@interface WiFiUsageLQMWindowAnalysis
+ (BOOL)isInCallAnalysisDue:(id)a3;
+ (BOOL)isKernerlParsingEnabled;
+ (id)config;
+ (unint64_t)canCreateAnalysisFor:(id)a3;
+ (unint64_t)maxConcurrentAnalysis;
+ (void)computeFeatures:(id)a3 For:(id)a4 WithLogLabel:(id)a5;
+ (void)initialize;
+ (void)updateConfig;
- (BOOL)canSubmitToCA;
- (BOOL)getBeforeKernelWindowWithLikelyhood;
- (BOOL)hasKernel;
- (BOOL)inA2dp;
- (BOOL)inCall;
- (BOOL)inEsco;
- (BOOL)isAnalysisTodo;
- (BOOL)isDone;
- (NSArray)preceedingTriggers;
- (NSDate)timestamp;
- (NSDictionary)summary;
- (NSMutableArray)subsequentTriggers;
- (NSMutableDictionary)lqmWindowsFeatures;
- (NSString)fgApp;
- (NSString)firstSubsequentLinkDownReason;
- (NSString)metricNameCDF;
- (NSString)metricNameSankey;
- (NSString)reason;
- (OS_dispatch_queue)analysisQueue;
- (OS_dispatch_source)analysisTimer;
- (WiFiUsageLQMRollingWindow)windowAfterTrigger;
- (WiFiUsageLQMRollingWindow)windowBeforeTrigger;
- (WiFiUsageLQMWindowAnalysis)initWithRollingWindow:(id)a3 andReason:(id)a4 andContext:(context)a5 andTimestamp:(id)a6 onQueue:(id)a7;
- (id)addDimensionsTo:(id)a3;
- (id)completionHandler;
- (id)description;
- (id)dumpAnalysis:(id)a3;
- (id)dumpDimensions:(id)a3;
- (id)fetchKernelLQMRollingWindowForInterface:(id)a3 into:(id)a4;
- (id)metricCallbackForMetric:(id)a3 AndField:(id)a4;
- (unint64_t)diceRoll;
- (void)computeBins:(id)a3 WithSampleKind:(Class)a4;
- (void)computeFeaturesFor:(id)a3 WithLogLabel:(id)a4;
- (void)dealloc;
- (void)performAnalysis;
- (void)setAnalysisQueue:(id)a3;
- (void)setAnalysisTimer:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDiceRoll:(unint64_t)a3;
- (void)setFgApp:(id)a3;
- (void)setFirstSubsequentLinkDownReason:(id)a3;
- (void)setHasKernel:(BOOL)a3;
- (void)setInA2dp:(BOOL)a3;
- (void)setInCall:(BOOL)a3;
- (void)setInEsco:(BOOL)a3;
- (void)setIsDone:(BOOL)a3;
- (void)setLqmWindowsFeatures:(id)a3;
- (void)setMetricNameCDF:(id)a3;
- (void)setMetricNameSankey:(id)a3;
- (void)setPreceedingTriggers:(id)a3;
- (void)setReason:(id)a3;
- (void)setSubsequentTriggers:(id)a3;
- (void)setSummary:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setWindowAfterTrigger:(id)a3;
- (void)setWindowBeforeTrigger:(id)a3;
- (void)updateWithLQMSample:(id)a3;
- (void)updateWithSubsequentTrigger:(id)a3;
@end

@implementation WiFiUsageLQMWindowAnalysis

+ (BOOL)isInCallAnalysisDue:(id)a3
{
  if (_inCallAnalysisIntervalSecEnabled != 1) {
    return 0;
  }
  [a3 timeIntervalSinceNow];
  return *(double *)&_inCallAnalysisIntervalSec <= -v3;
}

+ (BOOL)isKernerlParsingEnabled
{
  return _isKernelParsingEnabled;
}

+ (unint64_t)maxConcurrentAnalysis
{
  return _maxConcurrentAnalysis;
}

+ (id)config
{
  if (_isKernelParsingEnabled)
  {
    v2 = [NSString stringWithFormat:@"with likelyhood of fetching in-kernel LQM rolling window: %@", _fetchKernelWindowSamplingRates];
  }
  else
  {
    v2 = &stru_1F2B5AC50;
  }
  if (_inCallAnalysisIntervalSecEnabled == 1)
  {
    double v3 = NSString;
    v4 = [NSNumber numberWithDouble:*(double *)&_inCallAnalysisIntervalSec];
    v5 = +[WiFiUsagePrivacyFilter getHumanSecondsFromObject:v4];
    v6 = [v3 stringWithFormat:@"every %@", v5];
  }
  else
  {
    v6 = &stru_1F2B5AC50;
  }
  v7 = @"YES";
  if (_isKernelParsingEnabled) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if (!_inCallAnalysisIntervalSecEnabled) {
    v7 = @"NO";
  }
  objc_msgSend(NSString, "stringWithFormat:", @"metricPrefix set to '%@' ; cdfMetricName set to '%@' ; sankeyMetricName set to '%@' ; maxConcurrentAnalysis set to %u\nLikelyhood of creating an analsyis: %@\nLikelyhood of sending analsyis to CA: %@\nKernel window parsing enabled: %@ %@\nInCall LQMAnalysis enabled: %@ %@",
    _metricPrefix,
    _cdfMetricName,
    _sankeyMetricName,
    _maxConcurrentAnalysis,
    _createAnalysisSamplingRates,
    _submitToCASamplingRates,
    v8,
    v2,
    v7,
  v9 = v6);

  return v9;
}

+ (void)initialize
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = (void *)_metricPrefix;
    _metricPrefix = @"com.apple.wifi.lqmanalysis";

    v5 = (void *)_cdfMetricName;
    _cdfMetricName = @"featuresbyfield";

    v6 = (void *)_sankeyMetricName;
    _sankeyMetricName = @"allfeatures";

    uint64_t v7 = objc_opt_new();
    v8 = (void *)_createAnalysisSamplingRates;
    _createAnalysisSamplingRates = v7;

    uint64_t v9 = objc_opt_new();
    v10 = (void *)_submitToCASamplingRates;
    _submitToCASamplingRates = v9;

    uint64_t v11 = objc_opt_new();
    v12 = (void *)_fetchKernelWindowSamplingRates;
    _fetchKernelWindowSamplingRates = v11;

    id v13 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v14 = (void *)_dateFormatter_1;
    _dateFormatter_1 = (uint64_t)v13;

    [(id)_dateFormatter_1 setDateFormat:@"HH:mm:ss"];
    _isKernelParsingEnabled = 0;
    _maxConcurrentAnalysis = 1;
    _inCallAnalysisIntervalSecEnabled = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v15 = [a1 config];
      int v16 = 136315394;
      v17 = "+[WiFiUsageLQMWindowAnalysis initialize]";
      __int16 v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

+ (void)updateConfig
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_class();
  if ([v3 isEqual:objc_opt_class()])
  {
    v4 = +[WiFiUsageLQMConfiguration getConfigForKey:@"LQMWindowAnalysis"];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = [v4 objectForKey:@"MetricPrefix"];
        if (v5)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && ([(id)_metricPrefix isEqualToString:v5] & 1) == 0) {
            objc_storeStrong((id *)&_metricPrefix, v5);
          }
        }
        v6 = [v4 objectForKey:@"CDFMetricName"];

        if (v6)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ([(id)_cdfMetricName isEqualToString:v6] & 1) == 0)
          {
            objc_storeStrong((id *)&_cdfMetricName, v6);
          }
        }
        uint64_t v7 = [v4 objectForKey:@"SanKeyMetricName"];

        if (v7)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ([(id)_sankeyMetricName isEqualToString:v7] & 1) == 0)
          {
            objc_storeStrong((id *)&_sankeyMetricName, v7);
          }
        }
        v8 = [v4 objectForKey:@"MaxConcurrentAnalysis"];

        if (v8)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            _maxConcurrentAnalysis = [v8 unsignedIntValue];
          }
        }
        uint64_t v9 = [v4 objectForKey:@"AnalysisCreationSampling"];

        v50 = v4;
        id v51 = a1;
        if (v9)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v47 = v9;
            id v10 = v9;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            uint64_t v11 = [v10 allKeys];
            uint64_t v12 = [v11 countByEnumeratingWithState:&v60 objects:v68 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v61;
              do
              {
                for (uint64_t i = 0; i != v13; ++i)
                {
                  if (*(void *)v61 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  uint64_t v16 = *(void *)(*((void *)&v60 + 1) + 8 * i);
                  v17 = [v10 objectForKeyedSubscript:v16];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      __int16 v18 = [[WiFiUsageLQMAnalysisSamplingRate alloc] initWithValue:v17];
                      [(id)_createAnalysisSamplingRates setObject:v18 forKeyedSubscript:v16];
                    }
                  }
                }
                uint64_t v13 = [v11 countByEnumeratingWithState:&v60 objects:v68 count:16];
              }
              while (v13);
            }

            v4 = v50;
            a1 = v51;
            uint64_t v9 = v47;
          }
        }
        v19 = [v4 objectForKey:@"EventSubmissionSampling"];

        if (v19)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v48 = v19;
            id v20 = v19;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            v21 = [v20 allKeys];
            uint64_t v22 = [v21 countByEnumeratingWithState:&v56 objects:v67 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = *(void *)v57;
              do
              {
                for (uint64_t j = 0; j != v23; ++j)
                {
                  if (*(void *)v57 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  uint64_t v26 = *(void *)(*((void *)&v56 + 1) + 8 * j);
                  v27 = [v20 objectForKeyedSubscript:v26];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v28 = [[WiFiUsageLQMAnalysisSamplingRate alloc] initWithValue:v27];
                      [(id)_submitToCASamplingRates setObject:v28 forKeyedSubscript:v26];
                    }
                  }
                }
                uint64_t v23 = [v21 countByEnumeratingWithState:&v56 objects:v67 count:16];
              }
              while (v23);
            }

            v4 = v50;
            a1 = v51;
            v19 = v48;
          }
        }
        v29 = [v4 objectForKey:@"KernelWindowParsingEnabled"];

        if (v29)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            _isKernelParsingEnabled = [v29 BOOLValue];
          }
        }
        v30 = [v4 objectForKey:@"KernelWindowSamplingRatePercentages"];

        if (v30)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v49 = v30;
            id v31 = v30;
            long long v52 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            v32 = [v31 allKeys];
            uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v66 count:16];
            if (v33)
            {
              uint64_t v34 = v33;
              uint64_t v35 = *(void *)v53;
              do
              {
                for (uint64_t k = 0; k != v34; ++k)
                {
                  if (*(void *)v53 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  uint64_t v37 = *(void *)(*((void *)&v52 + 1) + 8 * k);
                  v38 = [v31 objectForKeyedSubscript:v37];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v39 = [[WiFiUsageLQMAnalysisSamplingRate alloc] initWithValue:v38];
                      [(id)_fetchKernelWindowSamplingRates setObject:v39 forKeyedSubscript:v37];
                    }
                  }
                }
                uint64_t v34 = [v32 countByEnumeratingWithState:&v52 objects:v66 count:16];
              }
              while (v34);
            }

            v4 = v50;
            a1 = v51;
            v30 = v49;
          }
        }
        v40 = [v4 objectForKey:@"InCallAnalysisIntervalSec"];

        if (v40)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v40 doubleValue];
            _inCallAnalysisIntervalSec = v41;
            _inCallAnalysisIntervalSecEnabled = 1;
          }
        }
      }
    }
  }
  v42 = NSString;
  v43 = [a1 config];
  v44 = [v42 stringWithFormat:@"%s: %@", "+[WiFiUsageLQMWindowAnalysis updateConfig]", v43];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v44, "UTF8String"));
    id v45 = objc_claimAutoreleasedReturnValue();
    uint64_t v46 = [v45 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v65 = v46;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (WiFiUsageLQMWindowAnalysis)initWithRollingWindow:(id)a3 andReason:(id)a4 andContext:(context)a5 andTimestamp:(id)a6 onQueue:(id)a7
{
  int v9 = *(_DWORD *)&a5.var0;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v72 = a6;
  uint64_t v14 = a7;
  uint64_t v15 = [(id)objc_opt_class() canCreateAnalysisFor:v13];
  if (!v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:]";
      __int16 v77 = 2112;
      id v78 = v13;
      v66 = MEMORY[0x1E4F14500];
      v67 = "%s - Won't Create Analysis (downsampling) for reason %@";
LABEL_11:
      _os_log_impl(&dword_1D3CCD000, v66, OS_LOG_TYPE_DEFAULT, v67, location, 0x16u);
    }
LABEL_12:
    uint64_t v65 = 0;
    goto LABEL_13;
  }
  if (!v12)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:]";
      __int16 v77 = 2112;
      id v78 = 0;
      v66 = MEMORY[0x1E4F14500];
      v67 = "%s - Cannot init Analysis (invalid current rolling window: %@)";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  uint64_t v16 = v15;
  v17 = [v12 interfaceName];

  if (!v17)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v69 = [v12 interfaceName];
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:]";
      __int16 v77 = 2112;
      id v78 = v69;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Cannot init Analysis (invalid interfaceName on current rolling window: %@)", location, 0x16u);
    }
    goto LABEL_12;
  }
  v75.receiver = self;
  v75.super_class = (Class)WiFiUsageLQMWindowAnalysis;
  id v18 = [(WiFiUsageLQMWindowAnalysis *)&v75 init];
  *((void *)v18 + 14) = v16;
  uint64_t v19 = [v13 copy];
  id v20 = (void *)*((void *)v18 + 3);
  *((void *)v18 + 3) = v19;

  objc_storeStrong((id *)v18 + 4, a6);
  *((unsigned char *)v18 + 17) = v9 & 1;
  *((unsigned char *)v18 + 19) = BYTE1(v9) & 1;
  *((unsigned char *)v18 + 20) = BYTE2(v9) & 1;
  v21 = [v12 samples];
  uint64_t v22 = [v21 lastObject];
  uint64_t v23 = [v22 networkDetails];
  uint64_t v24 = [v23 connectedBss];
  v71 = [v24 bssid];

  v25 = [v12 samples];
  uint64_t v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"networkDetails.connectedBss.bssid == %@", v71];
  v70 = [v25 filteredArrayUsingPredicate:v26];

  v27 = [WiFiUsageLQMRollingWindow alloc];
  v28 = [v12 interfaceName];
  [v12 duration];
  double v30 = v29;
  id v31 = [v12 capabilities];
  uint64_t v32 = [(WiFiUsageLQMRollingWindow *)v27 initWithInterfaceName:v28 andDuration:v31 andInterfaceCapabilities:v30];
  uint64_t v33 = (void *)*((void *)v18 + 17);
  *((void *)v18 + 17) = v32;

  [*((id *)v18 + 17) addSamples:v70];
  [*((id *)v18 + 17) setLabel:@"before"];
  uint64_t v34 = (void *)*((void *)v18 + 17);
  uint64_t v35 = [v12 capabilities];
  [v34 setCapabilities:v35];

  v36 = [WiFiUsageLQMRollingWindow alloc];
  uint64_t v37 = [v12 interfaceName];
  [v12 duration];
  double v39 = v38;
  v40 = [v12 capabilities];
  uint64_t v41 = [(WiFiUsageLQMRollingWindow *)v36 initWithInterfaceName:v37 andDuration:v40 andInterfaceCapabilities:v39];
  v42 = (void *)*((void *)v18 + 18);
  *((void *)v18 + 18) = v41;

  [*((id *)v18 + 18) setLabel:@"after"];
  uint64_t v43 = [v12 fgApp];
  v44 = (void *)*((void *)v18 + 10);
  *((void *)v18 + 10) = v43;

  id v45 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v46 = [v12 preceedingTriggers];
  uint64_t v47 = [v45 arrayWithArray:v46];
  v48 = (void *)*((void *)v18 + 9);
  *((void *)v18 + 9) = v47;

  v49 = (__CFString *)*((id *)v18 + 3);
  if ([v18 isMemberOfClass:objc_opt_class()])
  {

    v49 = @"GenericTrigger";
  }
  uint64_t v50 = [NSString stringWithFormat:@"%@.%@.%@", _metricPrefix, _cdfMetricName, v49];
  id v51 = (void *)*((void *)v18 + 11);
  *((void *)v18 + 11) = v50;

  uint64_t v52 = [NSString stringWithFormat:@"%@.%@.%@", _metricPrefix, _sankeyMetricName, v49];
  long long v53 = (void *)*((void *)v18 + 12);
  *((void *)v18 + 12) = v52;

  long long v54 = (void *)*((void *)v18 + 6);
  *((void *)v18 + 6) = 0;

  uint64_t v55 = objc_opt_new();
  long long v56 = (void *)*((void *)v18 + 7);
  *((void *)v18 + 7) = v55;

  uint64_t v57 = objc_opt_new();
  long long v58 = (void *)*((void *)v18 + 13);
  *((void *)v18 + 13) = v57;

  objc_storeStrong((id *)v18 + 16, a7);
  dispatch_source_t v59 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v14);
  long long v60 = (void *)*((void *)v18 + 15);
  *((void *)v18 + 15) = v59;

  [v18 getBeforeKernelWindowWithLikelyhood];
  objc_initWeak((id *)location, v18);
  long long v61 = *((void *)v18 + 15);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __94__WiFiUsageLQMWindowAnalysis_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue___block_invoke;
  handler[3] = &unk_1E69BCBA0;
  objc_copyWeak(&v74, (id *)location);
  dispatch_source_set_event_handler(v61, handler);
  long long v62 = *((void *)v18 + 15);
  [v12 duration];
  dispatch_time_t v64 = dispatch_time(0, (uint64_t)(v63 * 1000000000.0));
  dispatch_source_set_timer(v62, v64, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(*((dispatch_object_t *)v18 + 15));
  *((unsigned char *)v18 + 16) = 0;
  self = (WiFiUsageLQMWindowAnalysis *)v18;
  objc_destroyWeak(&v74);
  objc_destroyWeak((id *)location);

  uint64_t v65 = self;
LABEL_13:

  return v65;
}

void __94__WiFiUsageLQMWindowAnalysis_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isAnalysisTodo]) {
    [WeakRetained performAnalysis];
  }
}

- (void)dealloc
{
  analysisTimer = self->_analysisTimer;
  if (analysisTimer)
  {
    dispatch_source_cancel(analysisTimer);
    v4 = self->_analysisTimer;
  }
  else
  {
    v4 = 0;
  }
  self->_analysisTimer = 0;

  v5.receiver = self;
  v5.super_class = (Class)WiFiUsageLQMWindowAnalysis;
  [(WiFiUsageLQMWindowAnalysis *)&v5 dealloc];
}

- (void)updateWithLQMSample:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = [(WiFiUsageLQMRollingWindow *)self->_windowAfterTrigger samples];
    if (v5)
    {
      v6 = [(WiFiUsageLQMRollingWindow *)self->_windowAfterTrigger samples];
      if ([v6 count])
      {
        uint64_t v7 = [(WiFiUsageLQMRollingWindow *)self->_windowAfterTrigger samples];
        v8 = [v7 firstObject];
        int v9 = [v8 networkDetails];
        id v10 = [v9 connectedBss];
        uint64_t v11 = [v10 bssid];
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }

    id v12 = [v4 networkDetails];
    id v13 = [v12 connectedBss];
    uint64_t v14 = [v13 bssid];

    if (v11 && ([v11 isEqualToString:v14] & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136316418;
        uint64_t v16 = "-[WiFiUsageLQMWindowAnalysis updateWithLQMSample:]";
        __int16 v17 = 2112;
        id v18 = self;
        __int16 v19 = 2160;
        uint64_t v20 = 1752392040;
        __int16 v21 = 2112;
        uint64_t v22 = v11;
        __int16 v23 = 2160;
        uint64_t v24 = 1752392040;
        __int16 v25 = 2112;
        uint64_t v26 = v14;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: performing LQM window analysis for reason %@ (ending this analysis early because the BSSID has changed (%{mask.hash}@ -> %{mask.hash}@)", (uint8_t *)&v15, 0x3Eu);
      }
      [(WiFiUsageLQMWindowAnalysis *)self performAnalysis];
    }
    else
    {
      [(WiFiUsageLQMRollingWindow *)self->_windowAfterTrigger addSample:v4];
    }
  }
}

- (void)updateWithSubsequentTrigger:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4)
  {
    int v9 = v4;
    id v4 = (id)[(NSMutableArray *)self->_subsequentTriggers addObject:v4];
    id v6 = v9;
    if (!self->_firstSubsequentLinkDownReason)
    {
      uint64_t v7 = [v9 trigger];

      id v6 = v9;
      if (v7 == @"LinkDown")
      {
        v8 = [v9 reason];
        [(WiFiUsageLQMWindowAnalysis *)self setFirstSubsequentLinkDownReason:v8];

        id v6 = v9;
      }
    }
  }

  MEMORY[0x1F41817F8](v4, v6, v5);
}

- (void)computeFeaturesFor:(id)a3 WithLogLabel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_class();
  lqmWindowsFeatures = self->_lqmWindowsFeatures;
  id v10 = [v7 samples];

  [v8 computeFeatures:lqmWindowsFeatures For:v10 WithLogLabel:v6];
}

+ (void)computeFeatures:(id)a3 For:(id)a4 WithLogLabel:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v37 = a4;
  id v38 = a5;
  v36 = [v37 firstObject];
  v8 = objc_opt_class();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = [v8 allLQMProperties];
  uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v40 = *(void *)v44;
    unint64_t v11 = 0x1E4F29000uLL;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v44 != v40) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v14 = [v8 isPerSecond:v13];
        int v15 = [v8 featureFromFieldName:v13];
        uint64_t v16 = &stru_1F2B5AC50;
        if (v14) {
          uint64_t v16 = @"PerSecond";
        }
        uint64_t v17 = [*(id *)(v11 + 24) stringWithFormat:@"%@_%@%@", v15, v13, v16, v36];
        v42 = (void *)v17;
        if (v15)
        {
          uint64_t v18 = v17;
          if ([v15 isEqualToString:@"mode"]) {
            __int16 v19 = @"%@ValueForField:ScaledByDuration:OnSamples:";
          }
          else {
            __int16 v19 = @"%@IntegerValueForField:ScaledByDuration:OnSamples:";
          }
          objc_msgSend(*(id *)(v11 + 24), "stringWithFormat:", v19, v15);
          uint64_t v20 = (NSString *)objc_claimAutoreleasedReturnValue();
          aSelector = NSSelectorFromString(v20);

          uint64_t v21 = [v7 objectForKeyedSubscript:v18];
          if (!v21) {
            goto LABEL_14;
          }
          uint64_t v22 = (void *)v21;
          [v7 objectForKeyedSubscript:v42];
          uint64_t v23 = v10;
          uint64_t v24 = v8;
          uint64_t v26 = v25 = v7;
          uint64_t v27 = [v26 objectForKeyedSubscript:v38];

          id v7 = v25;
          v8 = v24;
          uint64_t v10 = v23;

          if (!v27)
          {
LABEL_14:
            if (objc_opt_respondsToSelector())
            {
              v28 = (void (*)(uint64_t, const char *, void *, uint64_t, id))+[WiFiUsageLQMRollingWindow methodForSelector:aSelector];
              uint64_t v29 = objc_opt_class();
              uint64_t v30 = v28(v29, aSelector, v13, v14, v37);
              if (v30)
              {
                id v31 = (void *)v30;
                uint64_t v32 = [v7 valueForKey:v42];

                if (!v32)
                {
                  uint64_t v33 = objc_opt_new();
                  [v7 setObject:v33 forKeyedSubscript:v42];
                }
                uint64_t v34 = [v7 objectForKeyedSubscript:v42];
                [v34 setObject:v31 forKeyedSubscript:v38];
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v35 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 136316162;
              v48 = "+[WiFiUsageLQMWindowAnalysis computeFeatures:For:WithLogLabel:]";
              __int16 v49 = 2112;
              uint64_t v50 = v35;
              __int16 v51 = 2112;
              uint64_t v52 = v15;
              __int16 v53 = 2112;
              long long v54 = v13;
              __int16 v55 = 2112;
              long long v56 = v8;
              _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Undefined selector %@ for feature type %@ for %@ on sample %@", buf, 0x34u);
            }
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v48 = "+[WiFiUsageLQMWindowAnalysis computeFeatures:For:WithLogLabel:]";
          __int16 v49 = 2112;
          uint64_t v50 = 0;
          __int16 v51 = 2112;
          uint64_t v52 = v13;
          __int16 v53 = 2112;
          long long v54 = v8;
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Undefined feature type %@ for %@ on sample %@", buf, 0x2Au);
        }

        unint64_t v11 = 0x1E4F29000;
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
    }
    while (v10);
  }
}

- (void)computeBins:(id)a3 WithSampleKind:(Class)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = [v4 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v37;
    *(void *)&long long v6 = 136315394;
    long long v23 = v6;
    uint64_t v24 = *(void *)v37;
    do
    {
      uint64_t v9 = 0;
      uint64_t v25 = v7;
      do
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
        unint64_t v11 = objc_msgSend(v10, "componentsSeparatedByString:", @"_", v23);
        if ((unint64_t)[v11 count] > 1)
        {
          uint64_t v27 = v11;
          uint64_t v28 = v9;
          id v31 = [v11 objectAtIndex:1];
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v12 = [v4 objectForKeyedSubscript:v10];
          id v13 = [v12 allKeys];

          id v29 = v13;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v33 != v16) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * i);
                __int16 v19 = [v4 objectForKeyedSubscript:v10];
                uint64_t v20 = [v19 objectForKeyedSubscript:v18];
                uint64_t v21 = -[objc_class binLabelfromFieldName:value:](a4, "binLabelfromFieldName:value:", v31, [v20 integerValue]);
                uint64_t v22 = [v4 objectForKeyedSubscript:v10];
                [v22 setObject:v21 forKeyedSubscript:v18];
              }
              uint64_t v15 = [v29 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v15);
          }

          uint64_t v8 = v24;
          uint64_t v7 = v25;
          unint64_t v11 = v27;
          uint64_t v9 = v28;
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v23;
          v42 = "-[WiFiUsageLQMWindowAnalysis computeBins:WithSampleKind:]";
          __int16 v43 = 2112;
          long long v44 = v10;
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - FeatureFieldName:%@ Unable to extract binFieldName", buf, 0x16u);
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v7);
  }
}

- (BOOL)isAnalysisTodo
{
  return self->_summary == 0;
}

- (void)performAnalysis
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v3 = [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger samples];
  if (v3)
  {
    id v4 = [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger samples];
    uint64_t v5 = [v4 firstObject];
  }
  else
  {
    uint64_t v5 = 0;
  }

  long long v6 = [(WiFiUsageLQMRollingWindow *)self->_windowAfterTrigger samples];
  if (v6)
  {
    uint64_t v7 = [(WiFiUsageLQMRollingWindow *)self->_windowAfterTrigger samples];
    uint64_t v8 = [v7 lastObject];
  }
  else
  {
    uint64_t v8 = 0;
  }

  if (!v5) {
    goto LABEL_32;
  }
  long long v56 = v8;
  if ([(NSMutableDictionary *)self->_lqmWindowsFeatures count]
    && !+[WiFiUsageLQMKernelRollingWindow isOngoing])
  {
    uint64_t v9 = [(WiFiUsageLQMRollingWindow *)self->_windowAfterTrigger interfaceName];

    BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v10)
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v58 = (WiFiUsageLQMWindowAnalysis *)"-[WiFiUsageLQMWindowAnalysis performAnalysis]";
        __int16 v59 = 2112;
        long long v60 = self;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Fetching \"after\" kernel rolling window for analysis: %@", buf, 0x16u);
      }
      unint64_t v11 = (WiFiUsageLQMWindowAnalysis *)objc_opt_new();
      id v12 = [(WiFiUsageLQMRollingWindow *)self->_windowAfterTrigger interfaceName];
      id v13 = [(WiFiUsageLQMWindowAnalysis *)self fetchKernelLQMRollingWindowForInterface:v12 into:v11];

      if (v13)
      {
        uint64_t v14 = +[WiFiUsageLQMKernelRollingWindow kernelLQMRollingWindow:v13 withReferenceWindow:self->_windowAfterTrigger andLqmFeatures:self->_lqmWindowsFeatures];
        lqmWindowsFeatures = self->_lqmWindowsFeatures;
        self->_lqmWindowsFeatures = v14;
      }
      goto LABEL_18;
    }
    if (v10)
    {
      unint64_t v11 = [(WiFiUsageLQMRollingWindow *)self->_windowAfterTrigger interfaceName];
      *(_DWORD *)buf = 136315394;
      uint64_t v58 = (WiFiUsageLQMWindowAnalysis *)"-[WiFiUsageLQMWindowAnalysis performAnalysis]";
      __int16 v59 = 2112;
      long long v60 = v11;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Cannot fetch the kernel rolling window (invalid interface name on windowAfterTrigger: %@)", buf, 0x16u);
LABEL_18:
    }
  }
  [(WiFiUsageLQMWindowAnalysis *)self computeFeaturesFor:self->_windowBeforeTrigger WithLogLabel:@"before"];
  [(WiFiUsageLQMWindowAnalysis *)self computeFeaturesFor:self->_windowAfterTrigger WithLogLabel:@"after"];
  uint64_t v16 = (NSMutableDictionary *)objc_opt_new();
  dimensions = self->dimensions;
  self->dimensions = v16;

  id v18 = [(WiFiUsageLQMWindowAnalysis *)self addDimensionsTo:self->dimensions];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v19 = (void *)_dateFormatter_1;
    uint64_t v50 = [v5 timestamp];
    __int16 v55 = objc_msgSend(v19, "stringFromDate:");
    uint64_t v20 = (void *)_dateFormatter_1;
    __int16 v49 = [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger samples];
    v48 = [v49 lastObject];
    uint64_t v47 = [v48 timestamp];
    long long v54 = objc_msgSend(v20, "stringFromDate:");
    uint64_t v21 = (void *)_dateFormatter_1;
    uint64_t v46 = [(WiFiUsageLQMRollingWindow *)self->_windowAfterTrigger samples];
    long long v45 = [v46 firstObject];
    uint64_t v22 = [v45 timestamp];
    __int16 v53 = [v21 stringFromDate:v22];
    long long v23 = (void *)_dateFormatter_1;
    uint64_t v24 = [(WiFiUsageLQMRollingWindow *)self->_windowAfterTrigger samples];
    uint64_t v25 = [v24 lastObject];
    [v25 timestamp];
    v27 = uint64_t v26 = v5;
    [v23 stringFromDate:v27];
    v52 = __int16 v51 = v26;
    uint64_t v28 = [v26 networkDetails];
    if (v56)
    {
      id v29 = [v56 networkDetails];
    }
    else
    {
      id v29 = 0;
    }
    uint64_t v30 = [(WiFiUsageLQMWindowAnalysis *)self dumpDimensions:self->dimensions];
    id v31 = [(WiFiUsageLQMWindowAnalysis *)self dumpAnalysis:self->_lqmWindowsFeatures];
    *(_DWORD *)buf = 138414851;
    uint64_t v58 = self;
    __int16 v59 = 2112;
    long long v60 = (WiFiUsageLQMWindowAnalysis *)@"before";
    __int16 v61 = 2112;
    long long v62 = v55;
    __int16 v63 = 2112;
    dispatch_time_t v64 = v54;
    __int16 v65 = 2112;
    v66 = @"after";
    __int16 v67 = 2112;
    v68 = v53;
    __int16 v69 = 2112;
    v70 = v52;
    __int16 v71 = 2113;
    id v72 = v28;
    __int16 v73 = 2113;
    id v74 = v29;
    __int16 v75 = 2112;
    v76 = v30;
    __int16 v77 = 2112;
    id v78 = v31;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LQM_RW - LQM window analysis for %@ (%@: %@ - %@ ; %@: %@ - %@)\n"
      " Network at trigger        : %{private}@\n"
      " Network at end of analysis: %{private}@\n"
      " Context:\n"
      "%@\n"
      " Features: %@",
      buf,
      0x70u);
    if (v56) {

    }
    uint64_t v5 = v51;
  }
  [(WiFiUsageLQMWindowAnalysis *)self computeBins:self->_lqmWindowsFeatures WithSampleKind:objc_opt_class()];
  id v32 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v33 = 0x1E4F1C000uLL;
  long long v34 = (void *)MEMORY[0x1E4F1CA48];
  long long v35 = [(NSMutableDictionary *)self->_lqmWindowsFeatures allKeys];
  long long v36 = [v34 arrayWithArray:v35];
  metricNameCDF = self->_metricNameCDF;
  long long v38 = [(NSMutableDictionary *)self->_lqmWindowsFeatures allKeys];
  uint64_t v39 = [v38 count];
  uint64_t v40 = (void *)MEMORY[0x1E4F1CA48];
  if (v39)
  {
    uint64_t v33 = objc_opt_new();
    uint64_t v41 = [v40 arrayWithObject:v33];
  }
  else
  {
    uint64_t v41 = objc_opt_new();
  }
  v42 = (NSDictionary *)objc_msgSend(v32, "initWithObjectsAndKeys:", v36, metricNameCDF, v41, self->_metricNameSankey, 0);
  summary = self->_summary;
  self->_summary = v42;

  if (v39)
  {

    uint64_t v41 = (void *)v33;
  }

  uint64_t v8 = v56;
LABEL_32:
  if (!self->_isDone)
  {
    completionHandler = (void (**)(id, WiFiUsageLQMWindowAnalysis *))self->_completionHandler;
    if (completionHandler)
    {
      self->_isDone = 1;
      completionHandler[2](completionHandler, self);
    }
  }
}

+ (unint64_t)canCreateAnalysisFor:(id)a3
{
  id v3 = a3;
  if ([(id)_createAnalysisSamplingRates count])
  {
    id v4 = [(id)_createAnalysisSamplingRates objectForKeyedSubscript:v3];
    LODWORD(v5) = arc4random_uniform([v4 samplingBase]);

    long long v6 = [(id)_createAnalysisSamplingRates objectForKeyedSubscript:v3];
    if (v6)
    {
      uint64_t v7 = [(id)_createAnalysisSamplingRates objectForKeyedSubscript:v3];
      if (v5 >= [v7 samplingRate]) {
        unint64_t v5 = 0;
      }
      else {
        unint64_t v5 = v5;
      }
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  else
  {
    unint64_t v5 = 1;
  }

  return v5;
}

- (BOOL)canSubmitToCA
{
  unint64_t diceRoll = self->_diceRoll;
  if (![(id)_submitToCASamplingRates count]) {
    return 1;
  }
  id v4 = [(id)_createAnalysisSamplingRates objectForKeyedSubscript:self->_reason];
  int v5 = [v4 samplingBase];
  long long v6 = [(id)_submitToCASamplingRates objectForKeyedSubscript:self->_reason];
  int v7 = [v6 samplingBase];

  if (v5 != v7)
  {
    uint64_t v8 = [(id)_submitToCASamplingRates objectForKeyedSubscript:self->_reason];
    unint64_t diceRoll = arc4random_uniform([v8 samplingBase]);
  }
  uint64_t v9 = [(id)_submitToCASamplingRates objectForKeyedSubscript:self->_reason];
  if (v9)
  {
    BOOL v10 = [(id)_submitToCASamplingRates objectForKeyedSubscript:self->_reason];
    BOOL v11 = diceRoll < [v10 samplingRate];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)metricCallbackForMetric:(id)a3 AndField:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  if ([v6 hasPrefix:self->_metricNameSankey])
  {
    id v27 = v7;
    id v28 = v6;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = self->_lqmWindowsFeatures;
    uint64_t v9 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v30 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          id v13 = [(NSMutableDictionary *)self->_lqmWindowsFeatures objectForKeyedSubscript:v12];
          uint64_t v14 = [v13 objectForKeyedSubscript:@"before"];
          uint64_t v15 = [NSString stringWithFormat:@"%@_%@", v12, @"before"];
          [v8 setObject:v14 forKeyedSubscript:v15];

          uint64_t v16 = [(NSMutableDictionary *)self->_lqmWindowsFeatures objectForKeyedSubscript:v12];
          uint64_t v17 = [v16 objectForKeyedSubscript:@"after"];
          id v18 = [NSString stringWithFormat:@"%@_%@", v12, @"after"];
          [v8 setObject:v17 forKeyedSubscript:v18];
        }
        uint64_t v10 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v10);
    }

    id v7 = v27;
    id v6 = v28;
  }
  else
  {
    int v19 = [v6 hasPrefix:self->_metricNameCDF];
    if (v7 && v19)
    {
      [v8 setObject:v7 forKeyedSubscript:@"fieldName"];
      uint64_t v20 = [(NSMutableDictionary *)self->_lqmWindowsFeatures objectForKeyedSubscript:v7];
      uint64_t v21 = [v20 objectForKeyedSubscript:@"before"];
      [v8 setObject:v21 forKeyedSubscript:@"before"];

      uint64_t v22 = [(NSMutableDictionary *)self->_lqmWindowsFeatures objectForKeyedSubscript:v7];
      long long v23 = [v22 objectForKeyedSubscript:@"after"];
      [v8 setObject:v23 forKeyedSubscript:@"after"];
    }
  }
  uint64_t v24 = [v8 allKeys];
  uint64_t v25 = [v24 count];

  if (v25) {
    [v8 addEntriesFromDictionary:self->dimensions];
  }

  return v8;
}

- (id)addDimensionsTo:(id)a3
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setObject:self->_reason forKeyedSubscript:@"trigger"];
  int v5 = NSString;
  [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger duration];
  id v7 = objc_msgSend(v5, "stringWithFormat:", @"%lu", (uint64_t)v6);
  [v4 setObject:v7 forKeyedSubscript:@"duration"];

  [v4 setObject:self->_fgApp forKeyedSubscript:@"fgApp"];
  uint64_t v8 = NSString;
  uint64_t v9 = [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger capabilities];
  uint64_t v10 = objc_msgSend(v8, "stringWithFormat:", @"%lu", objc_msgSend(v9, "maxInterfacePHYRate"));
  [v4 setObject:v10 forKeyedSubscript:@"deviceTheoreticalMaxRate"];

  BOOL v11 = [NSNumber numberWithBool:self->_inCall];
  [v4 setObject:v11 forKeyedSubscript:@"inCall"];

  uint64_t v12 = [NSNumber numberWithBool:self->_hasKernel];
  [v4 setObject:v12 forKeyedSubscript:@"hasKernelStats"];

  id v13 = [NSNumber numberWithBool:self->_inA2dp];
  [v4 setObject:v13 forKeyedSubscript:@"inA2DP"];

  uint64_t v14 = [NSNumber numberWithBool:self->_inEsco];
  [v4 setObject:v14 forKeyedSubscript:@"ineSCO"];

  uint64_t v15 = [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger samples];
  uint64_t v16 = [v15 lastObject];
  uint64_t v17 = [v16 networkDetails];

  id v18 = NSString;
  int v19 = [v17 connectedBss];
  uint64_t v20 = objc_msgSend(v18, "stringWithFormat:", @"%ld", objc_msgSend(v19, "channel"));
  [v4 setObject:v20 forKeyedSubscript:@"channel"];

  uint64_t v21 = [v17 connectedBss];
  uint64_t v22 = +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", [v21 band]);
  [v4 setObject:v22 forKeyedSubscript:@"band"];

  long long v23 = NSString;
  uint64_t v24 = [v17 connectedBss];
  uint64_t v25 = objc_msgSend(v23, "stringWithFormat:", @"%ld", objc_msgSend(v24, "channelWidth"));
  [v4 setObject:v25 forKeyedSubscript:@"channelWidth"];

  uint64_t v26 = [v17 connectedBss];
  id v27 = [v26 apProfile];
  [v4 setObject:v27 forKeyedSubscript:@"apProfile"];

  id v28 = [v17 connectedBss];
  id v29 = [v28 bssid];
  uint64_t v30 = +[WiFiUsagePrivacyFilter sanitizedOUI:v29];
  [v4 setObject:v30 forKeyedSubscript:@"oui"];

  v146 = v17;
  long long v31 = [v17 connectedBss];
  long long v32 = [v31 bssid];
  long long v33 = [(WiFiUsageLQMRollingWindow *)self->_windowAfterTrigger samples];
  long long v34 = [v33 lastObject];
  long long v35 = [v34 networkDetails];
  uint64_t v36 = [v35 connectedBss];
  long long v37 = [v36 bssid];
  uint64_t v38 = [v32 isEqualToString:v37];
  uint64_t v39 = [NSNumber numberWithBool:v38];
  [v4 setObject:v39 forKeyedSubscript:@"sameBSSID"];

  uint64_t v40 = objc_msgSend(NSNumber, "numberWithBool:", -[WiFiUsageLQMRollingWindow hasChanged:](self->_windowBeforeTrigger, "hasChanged:", @"networkDetails.connectedBss.channel"));
  [v4 setObject:v40 forKeyedSubscript:@"channel_hasChanged_inBefore"];

  uint64_t v41 = objc_msgSend(NSNumber, "numberWithBool:", -[WiFiUsageLQMRollingWindow hasChanged:](self->_windowAfterTrigger, "hasChanged:", @"networkDetails.connectedBss.channel"));
  [v4 setObject:v41 forKeyedSubscript:@"channel_hasChanged_inAfter"];

  v42 = objc_msgSend(NSNumber, "numberWithBool:", -[WiFiUsageLQMRollingWindow hasChanged:](self->_windowBeforeTrigger, "hasChanged:", @"networkDetails.connectedBss.band"));
  [v4 setObject:v42 forKeyedSubscript:@"band_hasChanged_inBefore"];

  __int16 v43 = objc_msgSend(NSNumber, "numberWithBool:", -[WiFiUsageLQMRollingWindow hasChanged:](self->_windowAfterTrigger, "hasChanged:", @"networkDetails.connectedBss.band"));
  v147 = v4;
  [v4 setObject:v43 forKeyedSubscript:@"band_hasChanged_inAfter"];

  long long v44 = objc_opt_new();
  long long v153 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v45 = self->_preceedingTriggers;
  uint64_t v46 = [(NSArray *)v45 countByEnumeratingWithState:&v153 objects:v158 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v154;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v154 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v50 = [*(id *)(*((void *)&v153 + 1) + 8 * i) trigger];
        [v44 appendFormat:@"&%@", v50];
      }
      uint64_t v47 = [(NSArray *)v45 countByEnumeratingWithState:&v153 objects:v158 count:16];
    }
    while (v47);
  }

  v145 = v44;
  [v4 setObject:v44 forKeyedSubscript:@"preceedingTriggers"];
  v148 = objc_opt_new();
  long long v149 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  __int16 v51 = self->_subsequentTriggers;
  uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v149 objects:v157 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v150;
    do
    {
      for (uint64_t j = 0; j != v53; ++j)
      {
        if (*(void *)v150 != v54) {
          objc_enumerationMutation(v51);
        }
        long long v56 = *(void **)(*((void *)&v149 + 1) + 8 * j);
        uint64_t v57 = [v56 timestamp];
        timestamp = self->_timestamp;
        [(WiFiUsageLQMRollingWindow *)self->_windowAfterTrigger duration];
        __int16 v59 = -[NSDate dateByAddingTimeInterval:](timestamp, "dateByAddingTimeInterval:");
        uint64_t v60 = [v57 compare:v59];

        if (v60 != 1)
        {
          __int16 v61 = [v56 trigger];
          [v148 appendFormat:@"&%@", v61];
        }
      }
      uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v149 objects:v157 count:16];
    }
    while (v53);
  }

  [v147 setObject:v148 forKeyedSubscript:@"subsequentTriggers"];
  [v147 setObject:self->_firstSubsequentLinkDownReason forKeyedSubscript:@"firstSubsequentLinkDownReason"];
  long long v62 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v146, "hasEnterpriseSecurity"));
  [v147 setObject:v62 forKeyedSubscript:@"isEnterprise"];

  __int16 v63 = +[WiFiUsagePrivacyFilter getLabelsForNetworkProperties:v146];
  [v147 addEntriesFromDictionary:v63];

  dispatch_time_t v64 = [v146 bssEnvironment];
  [v147 setObject:v64 forKeyedSubscript:@"bssEnvironment"];

  __int16 v65 = [v146 privateMacType];
  [v147 setObject:v65 forKeyedSubscript:@"privateMacType"];

  v66 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v146, "privateRelayEnabled"));
  [v147 setObject:v66 forKeyedSubscript:@"privacyProxyEnabled"];

  __int16 v67 = [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger samples];
  v68 = [v67 lastObject];
  __int16 v69 = [v68 motionState];
  [v147 setObject:v69 forKeyedSubscript:@"motionStatus"];

  v70 = NSNumber;
  __int16 v71 = [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger samples];
  id v72 = [v71 lastObject];
  __int16 v73 = objc_msgSend(v70, "numberWithBool:", objc_msgSend(v72, "isAnyAppInFG"));
  [v147 setObject:v73 forKeyedSubscript:@"isAnyAppInFG"];

  id v74 = NSNumber;
  __int16 v75 = [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger samples];
  v76 = [v75 lastObject];
  __int16 v77 = objc_msgSend(v74, "numberWithBool:", objc_msgSend(v76, "isFTactive"));
  [v147 setObject:v77 forKeyedSubscript:@"isFTactive"];

  id v78 = NSNumber;
  uint64_t v79 = [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger samples];
  v80 = [v79 lastObject];
  v81 = objc_msgSend(v78, "numberWithBool:", objc_msgSend(v80, "isTimeSensitiveAppRunning"));
  [v147 setObject:v81 forKeyedSubscript:@"isTimeSensitiveAppRunning"];

  v82 = [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger samples];
  v83 = [v82 lastObject];
  v84 = +[WiFiUsageLQMTransformations getLabelTrafficState:](WiFiUsageLQMTransformations, "getLabelTrafficState:", [v83 trafficState]);
  [v147 setObject:v84 forKeyedSubscript:@"last_trafficState_before"];

  if (+[WiFiUsagePrivacyFilter isInternalInstall]
    && [v146 isInternal])
  {
    v85 = [v146 networkName];
    [v147 setObject:v85 forKeyedSubscript:@"NetworkName"];

    v86 = [v146 connectedBss];
    v87 = [v86 bssid];
    v88 = +[WiFiUsageAccessPointProfile apNameForBSSID:v87];

    v89 = [[WiFiUsageAppleWiFiNameBlocks alloc] initWithAPName:v88];
    [v147 setObject:v88 forKeyedSubscript:@"apName"];
    if (v89)
    {
      v90 = [(WiFiUsageAppleWiFiNameBlocks *)v89 building];
      [v147 setObject:v90 forKeyedSubscript:@"apNamePortionA"];

      v91 = [(WiFiUsageAppleWiFiNameBlocks *)v89 section];
      [v147 setObject:v91 forKeyedSubscript:@"apNamePortionB"];

      v92 = [(WiFiUsageAppleWiFiNameBlocks *)v89 floor];
      [v147 setObject:v92 forKeyedSubscript:@"apNamePortionC"];

      v93 = [(WiFiUsageAppleWiFiNameBlocks *)v89 pod];
      [v147 setObject:v93 forKeyedSubscript:@"apNamePortionD"];

      v94 = [(WiFiUsageAppleWiFiNameBlocks *)v89 other];
      [v147 setObject:v94 forKeyedSubscript:@"apNamePortionE"];
    }
  }
  v95 = [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger samples];
  v96 = [v95 lastObject];
  v97 = [v96 timestamp];
  v98 = [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger samples];
  v99 = [v98 firstObject];
  v100 = [v99 timestamp];
  [v97 timeIntervalSinceDate:v100];
  v102 = +[WiFiUsagePrivacyFilter getBinEvery10Over100:(unint64_t)v101 As:0];
  [v147 setObject:v102 forKeyedSubscript:@"windowSpan_before"];

  v103 = [(WiFiUsageLQMRollingWindow *)self->_windowAfterTrigger samples];
  v104 = [v103 lastObject];
  v105 = [v104 timestamp];
  v106 = [(WiFiUsageLQMRollingWindow *)self->_windowAfterTrigger samples];
  v107 = [v106 firstObject];
  v108 = [v107 timestamp];
  [v105 timeIntervalSinceDate:v108];
  v110 = +[WiFiUsagePrivacyFilter getBinEvery10Over100:(unint64_t)v109 As:0];
  [v147 setObject:v110 forKeyedSubscript:@"windowSpan_after"];

  v111 = [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger samples];
  v112 = +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:](WiFiUsagePrivacyFilter, "getBinEvery10Over100:As:", [v111 count], 0);
  [v147 setObject:v112 forKeyedSubscript:@"samplesCount_before"];

  v113 = [(WiFiUsageLQMRollingWindow *)self->_windowAfterTrigger samples];
  v114 = +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:](WiFiUsagePrivacyFilter, "getBinEvery10Over100:As:", [v113 count], 0);
  [v147 setObject:v114 forKeyedSubscript:@"samplesCount_after"];

  v115 = [(WiFiUsageLQMRollingWindow *)self->_windowAfterTrigger samples];
  v116 = [v115 lastObject];
  v117 = [v116 networkDetails];

  v118 = NSString;
  v119 = [v117 connectedBss];
  v120 = objc_msgSend(v118, "stringWithFormat:", @"%ld", objc_msgSend(v119, "channel"));
  [v147 setObject:v120 forKeyedSubscript:@"channel_after"];

  v121 = [v117 connectedBss];
  v122 = +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", [v121 band]);
  [v147 setObject:v122 forKeyedSubscript:@"band_after"];

  v123 = NSString;
  v124 = [v117 connectedBss];
  v125 = objc_msgSend(v123, "stringWithFormat:", @"%ld", objc_msgSend(v124, "channelWidth"));
  [v147 setObject:v125 forKeyedSubscript:@"channelWidth_after"];

  v126 = [v117 connectedBss];
  v127 = [v126 apProfile];
  [v147 setObject:v127 forKeyedSubscript:@"apProfile_after"];

  v128 = [v117 connectedBss];
  v129 = [v128 bssid];
  v130 = +[WiFiUsagePrivacyFilter sanitizedOUI:v129];
  [v147 setObject:v130 forKeyedSubscript:@"oui_after"];

  v131 = +[WiFiUsagePrivacyFilter getLabelsForNetworkProperties:v117];
  [v147 addEntriesFromDictionary:v131];

  v132 = [v117 bssEnvironment];
  [v147 setObject:v132 forKeyedSubscript:@"bssEnvironment_after"];

  v133 = [v117 privateMacType];
  [v147 setObject:v133 forKeyedSubscript:@"privateMacType_after"];

  v134 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v117, "privateRelayEnabled"));
  [v147 setObject:v134 forKeyedSubscript:@"privacyProxyEnabled_after"];

  if (+[WiFiUsagePrivacyFilter isInternalInstall]
    && [v117 isInternal])
  {
    v135 = [v117 connectedBss];
    v136 = [v135 bssid];
    v137 = +[WiFiUsageAccessPointProfile apNameForBSSID:v136];

    v138 = [[WiFiUsageAppleWiFiNameBlocks alloc] initWithAPName:v137];
    [v147 setObject:v137 forKeyedSubscript:@"apName_after"];
    if (v138)
    {
      v139 = [(WiFiUsageAppleWiFiNameBlocks *)v138 building];
      [v147 setObject:v139 forKeyedSubscript:@"apNamePortionA_after"];

      v140 = [(WiFiUsageAppleWiFiNameBlocks *)v138 section];
      [v147 setObject:v140 forKeyedSubscript:@"apNamePortionB_after"];

      v141 = [(WiFiUsageAppleWiFiNameBlocks *)v138 floor];
      [v147 setObject:v141 forKeyedSubscript:@"apNamePortionC_after"];

      v142 = [(WiFiUsageAppleWiFiNameBlocks *)v138 pod];
      [v147 setObject:v142 forKeyedSubscript:@"apNamePortionD_after"];

      v143 = [(WiFiUsageAppleWiFiNameBlocks *)v138 other];
      [v147 setObject:v143 forKeyedSubscript:@"apNamePortionE_after"];
    }
  }

  return v147;
}

- (id)dumpAnalysis:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28E78] stringWithFormat:@"(format: fieldName=<feature %@>|<feature %@>|<median change>)\n", @"before", @"after"];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  int v5 = [v3 allKeys];
  double v6 = [v5 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

  obuint64_t j = v6;
  uint64_t v27 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v31;
    id v22 = v3;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        [v4 appendFormat:@"%@=", v8];
        id v29 = [v3 objectForKeyedSubscript:v8];
        uint64_t v9 = [v29 objectForKeyedSubscript:@"before"];
        id v28 = [v3 objectForKeyedSubscript:v8];
        uint64_t v10 = [v28 objectForKeyedSubscript:@"after"];
        BOOL v11 = [v3 objectForKeyedSubscript:v8];
        uint64_t v12 = [v11 objectForKeyedSubscript:@"after"];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v24 = NSNumber;
          uint64_t v25 = [v3 objectForKeyedSubscript:v8];
          id v13 = [v25 objectForKeyedSubscript:@"after"];
          [v13 doubleValue];
          double v15 = v14;
          uint64_t v16 = [v3 objectForKeyedSubscript:v8];
          uint64_t v17 = [v16 objectForKeyedSubscript:@"before"];
          [v17 doubleValue];
          [v24 numberWithDouble:v15 - v18];
          uint64_t v20 = v19 = v4;
          [v19 appendFormat:@"%@|%@|%@", v9, v10, v20];

          id v4 = v19;
          id v3 = v22;
        }
        else
        {
          [v4 appendFormat:@"%@|%@|%@", v9, v10, &stru_1F2B5AC50];
        }

        [v4 appendString:@";"];
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v27);
  }

  return v4;
}

- (id)dumpDimensions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v5 = [v3 allKeys];
  double v6 = [v5 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = [v3 objectForKeyedSubscript:v11];
        [v4 appendFormat:@"%@=%@;", v11, v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ @ %@", self->_reason, self->_timestamp];
}

- (id)fetchKernelLQMRollingWindowForInterface:(id)a3 into:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = Apple80211Open();
  if (v7)
  {
    int v13 = v7;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v20 = "-[WiFiUsageLQMWindowAnalysis fetchKernelLQMRollingWindowForInterface:into:]";
    __int16 v21 = 1024;
    *(_DWORD *)id v22 = v13;
    *(_WORD *)&v22[4] = 2080;
    *(void *)&v22[6] = strerror(v13);
    long long v14 = MEMORY[0x1E4F14500];
    long long v15 = "%s: Apple80211Open returned err %d (%s)";
    goto LABEL_15;
  }
  int v8 = Apple80211BindToInterface();
  if (v8)
  {
    int v16 = v8;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v20 = "-[WiFiUsageLQMWindowAnalysis fetchKernelLQMRollingWindowForInterface:into:]";
    __int16 v21 = 2112;
    *(void *)id v22 = v5;
    *(_WORD *)&v22[8] = 1024;
    *(_DWORD *)&v22[10] = v16;
    __int16 v23 = 2080;
    uint64_t v24 = strerror(v16);
    long long v14 = MEMORY[0x1E4F14500];
    long long v15 = "%s: Apple80211BindToInterface on (%@) returned err %d (%s)";
    uint32_t v17 = 38;
LABEL_18:
    _os_log_impl(&dword_1D3CCD000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    goto LABEL_19;
  }
  int v9 = Apple80211Get();
  if (v9)
  {
    int v18 = v9;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v20 = "-[WiFiUsageLQMWindowAnalysis fetchKernelLQMRollingWindowForInterface:into:]";
    __int16 v21 = 1024;
    *(_DWORD *)id v22 = v18;
    *(_WORD *)&v22[4] = 2080;
    *(void *)&v22[6] = strerror(v18);
    long long v14 = MEMORY[0x1E4F14500];
    long long v15 = "%s: Apple80211Get(APPLE80211_IOC_LQM_RING_BUFFER_DATA) failed: %d (%s)";
LABEL_15:
    uint32_t v17 = 28;
    goto LABEL_18;
  }
  uint64_t v10 = [v6 objectForKeyedSubscript:&unk_1F2B94DC8];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = "-[WiFiUsageLQMWindowAnalysis fetchKernelLQMRollingWindowForInterface:into:]";
    long long v14 = MEMORY[0x1E4F14500];
    long long v15 = "%s - No LQM binary tag represented in APPLE80211_IOC_LQM_RING_BUFFER_DATA dictionary, skipping.";
    uint32_t v17 = 12;
    goto LABEL_18;
  }
LABEL_19:
  uint64_t v11 = 0;
LABEL_6:

  return v11;
}

- (BOOL)getBeforeKernelWindowWithLikelyhood
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  unint64_t diceRoll = self->_diceRoll;
  id v4 = [(id)_createAnalysisSamplingRates objectForKeyedSubscript:self->_reason];
  int v5 = [v4 samplingBase];
  id v6 = [(id)_fetchKernelWindowSamplingRates objectForKeyedSubscript:self->_reason];
  int v7 = [v6 samplingBase];

  if (v5 != v7)
  {
    int v8 = [(id)_fetchKernelWindowSamplingRates objectForKeyedSubscript:self->_reason];
    unint64_t diceRoll = arc4random_uniform([v8 samplingBase]);
  }
  uint64_t v9 = [(id)_fetchKernelWindowSamplingRates objectForKeyedSubscript:self->_reason];
  if (!v9)
  {
    BOOL v13 = 0;
    goto LABEL_9;
  }
  uint64_t v10 = (void *)v9;
  uint64_t v11 = [(id)_fetchKernelWindowSamplingRates objectForKeyedSubscript:self->_reason];
  unsigned int v12 = [v11 samplingRate];
  BOOL v13 = diceRoll < v12;

  if (!_isKernelParsingEnabled || diceRoll >= v12)
  {
LABEL_9:
    BOOL v14 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    LOBYTE(v15) = 0;
    if (v14)
    {
      if (_isKernelParsingEnabled) {
        int v16 = @"YES";
      }
      else {
        int v16 = @"NO";
      }
      if (v13) {
        uint32_t v17 = @"YES";
      }
      else {
        uint32_t v17 = @"NO";
      }
      unint64_t v18 = self->_diceRoll;
      uint64_t v19 = [(id)_fetchKernelWindowSamplingRates objectForKeyedSubscript:self->_reason];
      int v20 = [v19 samplingRate];
      int v31 = 136316674;
      long long v32 = "-[WiFiUsageLQMWindowAnalysis getBeforeKernelWindowWithLikelyhood]";
      if (+[WiFiUsageLQMKernelRollingWindow isOngoing]) {
        __int16 v21 = @"YES";
      }
      else {
        __int16 v21 = @"NO";
      }
      __int16 v33 = 2112;
      long long v34 = self;
      __int16 v35 = 2112;
      uint64_t v36 = v16;
      __int16 v37 = 2112;
      uint64_t v38 = v17;
      __int16 v39 = 2048;
      unint64_t v40 = v18;
      __int16 v41 = 1024;
      int v42 = v20;
      __int16 v43 = 2112;
      long long v44 = v21;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Not fetching \"before\" kernel rolling window for analysis: %@ (enabled: %@ - sampling:%@(%lu>=%u) - ongoing kernel window parsing:%@)", (uint8_t *)&v31, 0x44u);

LABEL_20:
      LOBYTE(v15) = 0;
      return v15;
    }
    return v15;
  }
  if (+[WiFiUsageLQMKernelRollingWindow isOngoing])
  {
    BOOL v13 = 1;
    goto LABEL_9;
  }
  id v22 = [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger interfaceName];

  BOOL v15 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (!v22)
  {
    if (!v15) {
      return v15;
    }
    id v29 = [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger interfaceName];
    int v31 = 136315394;
    long long v32 = "-[WiFiUsageLQMWindowAnalysis getBeforeKernelWindowWithLikelyhood]";
    __int16 v33 = 2112;
    long long v34 = v29;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Cannot fetch the kernel rolling window (invalid interface name on windowBeforeTrigger: %@)", (uint8_t *)&v31, 0x16u);

    goto LABEL_20;
  }
  if (v15)
  {
    __int16 v23 = [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger interfaceName];
    int v31 = 136315650;
    long long v32 = "-[WiFiUsageLQMWindowAnalysis getBeforeKernelWindowWithLikelyhood]";
    __int16 v33 = 2112;
    long long v34 = self;
    __int16 v35 = 2112;
    uint64_t v36 = v23;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Fetching \"before\" kernel rolling window for analysis %@ on interface %@", (uint8_t *)&v31, 0x20u);
  }
  uint64_t v24 = objc_opt_new();
  uint64_t v25 = [(WiFiUsageLQMRollingWindow *)self->_windowBeforeTrigger interfaceName];
  uint64_t v26 = [(WiFiUsageLQMWindowAnalysis *)self fetchKernelLQMRollingWindowForInterface:v25 into:v24];

  if (v26)
  {
    uint64_t v27 = +[WiFiUsageLQMKernelRollingWindow kernelLQMRollingWindow:v26 withReferenceWindow:self->_windowBeforeTrigger andLqmFeatures:self->_lqmWindowsFeatures];
    lqmWindowsFeatures = self->_lqmWindowsFeatures;
    self->_lqmWindowsFeatures = v27;
  }
  if ([(NSMutableDictionary *)self->_lqmWindowsFeatures count]) {
    self->_hasKernel = 1;
  }

  LOBYTE(v15) = 1;
  return v15;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)setIsDone:(BOOL)a3
{
  self->_isDone = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSDictionary)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (NSMutableArray)subsequentTriggers
{
  return self->_subsequentTriggers;
}

- (void)setSubsequentTriggers:(id)a3
{
}

- (NSString)firstSubsequentLinkDownReason
{
  return self->_firstSubsequentLinkDownReason;
}

- (void)setFirstSubsequentLinkDownReason:(id)a3
{
  self->_firstSubsequentLinkDownReason = (NSString *)a3;
}

- (NSArray)preceedingTriggers
{
  return self->_preceedingTriggers;
}

- (void)setPreceedingTriggers:(id)a3
{
}

- (NSString)fgApp
{
  return self->_fgApp;
}

- (void)setFgApp:(id)a3
{
}

- (BOOL)inCall
{
  return self->_inCall;
}

- (void)setInCall:(BOOL)a3
{
  self->_inCall = a3;
}

- (NSString)metricNameCDF
{
  return self->_metricNameCDF;
}

- (void)setMetricNameCDF:(id)a3
{
}

- (NSString)metricNameSankey
{
  return self->_metricNameSankey;
}

- (void)setMetricNameSankey:(id)a3
{
}

- (NSMutableDictionary)lqmWindowsFeatures
{
  return self->_lqmWindowsFeatures;
}

- (void)setLqmWindowsFeatures:(id)a3
{
}

- (unint64_t)diceRoll
{
  return self->_diceRoll;
}

- (void)setDiceRoll:(unint64_t)a3
{
  self->_unint64_t diceRoll = a3;
}

- (BOOL)hasKernel
{
  return self->_hasKernel;
}

- (void)setHasKernel:(BOOL)a3
{
  self->_hasKernel = a3;
}

- (BOOL)inA2dp
{
  return self->_inA2dp;
}

- (void)setInA2dp:(BOOL)a3
{
  self->_inA2dp = a3;
}

- (BOOL)inEsco
{
  return self->_inEsco;
}

- (void)setInEsco:(BOOL)a3
{
  self->_inEsco = a3;
}

- (OS_dispatch_source)analysisTimer
{
  return self->_analysisTimer;
}

- (void)setAnalysisTimer:(id)a3
{
}

- (OS_dispatch_queue)analysisQueue
{
  return self->_analysisQueue;
}

- (void)setAnalysisQueue:(id)a3
{
}

- (WiFiUsageLQMRollingWindow)windowBeforeTrigger
{
  return self->_windowBeforeTrigger;
}

- (void)setWindowBeforeTrigger:(id)a3
{
}

- (WiFiUsageLQMRollingWindow)windowAfterTrigger
{
  return self->_windowAfterTrigger;
}

- (void)setWindowAfterTrigger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowAfterTrigger, 0);
  objc_storeStrong((id *)&self->_windowBeforeTrigger, 0);
  objc_storeStrong((id *)&self->_analysisQueue, 0);
  objc_storeStrong((id *)&self->_analysisTimer, 0);
  objc_storeStrong((id *)&self->_lqmWindowsFeatures, 0);
  objc_storeStrong((id *)&self->_metricNameSankey, 0);
  objc_storeStrong((id *)&self->_metricNameCDF, 0);
  objc_storeStrong((id *)&self->_fgApp, 0);
  objc_storeStrong((id *)&self->_preceedingTriggers, 0);
  objc_storeStrong((id *)&self->_subsequentTriggers, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->dimensions, 0);
}

@end