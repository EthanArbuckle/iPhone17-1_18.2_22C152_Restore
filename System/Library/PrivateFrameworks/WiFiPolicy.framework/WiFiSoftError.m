@interface WiFiSoftError
+ (void)_cloudAssetsFetchHandler:(id)a3;
+ (void)_submitSummaryReportMetric;
+ (void)_updateHUDWithMessage:(id)a3;
- (BOOL)_maxNonUIActionsReachedFor:(id)a3;
- (BOOL)_maxUIActionsReachedFor:(id)a3;
- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3;
- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3 completionHandler:(id)a4;
- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3 timeout:(double)a4;
- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (NSMutableArray)abcSubmissionTimestamps;
- (NSMutableArray)askToLaunchTapToRadarTimestamps;
- (NSMutableArray)hudTimestamps;
- (NSMutableArray)occurrenceTimestamps;
- (NSMutableArray)simulateCrashTimestamps;
- (NSMutableArray)tapToRadarTimestamps;
- (NSMutableString)logMessage;
- (NSNumber)lastTimestamp;
- (NSString)metricEventName;
- (NSString)name;
- (SDRDiagnosticReporter)abcReporter;
- (WiFiSoftError)initWithName:(id)a3;
- (WiFiSoftError)initWithName:(id)a3 andParams:(id)a4;
- (double)creationDate;
- (id)appendLogMessage:(id)a3 includeTimestamp:(BOOL)a4;
- (id)incrementCount;
- (id)submitABCReportWithReason:(id)a3;
- (id)submitMetric;
- (id)submitMetricWithData:(id)a3;
- (id)tapToRadarWithURL:(id)a3 completionHandler:(id)a4;
- (id)updateHUDWithMessage:(id)a3;
- (int64_t)_countOf:(id)a3 withinInterval:(double)a4;
- (int64_t)count;
- (int64_t)enabled;
- (int64_t)intervalForMaxNonUIActions;
- (int64_t)intervalForMaxUIActions;
- (int64_t)maxLogMessageLength;
- (int64_t)maxNonUIActions;
- (int64_t)maxOccurrences;
- (int64_t)maxUIActions;
- (int64_t)metricSubmissionSamplingRate;
- (int64_t)metricsEnabled;
- (int64_t)recentCountWithinTimeInterval:(double)a3;
- (void)_addConfigurationData:(id)a3;
- (void)_addGenericMetricData:(id)a3;
- (void)_recordCurrentTimestampIn:(id)a3;
- (void)_resetCount;
- (void)clearLogMessage;
- (void)dealloc;
- (void)resetCount;
- (void)setAbcReporter:(id)a3;
- (void)setAbcSubmissionTimestamps:(id)a3;
- (void)setAskToLaunchTapToRadarTimestamps:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setEnabled:(int64_t)a3;
- (void)setHudTimestamps:(id)a3;
- (void)setLastTimestamp:(id)a3;
- (void)setLogMessage:(id)a3;
- (void)setMetricEventName:(id)a3;
- (void)setMetricsEnabled:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setOccurrenceTimestamps:(id)a3;
- (void)setSimulateCrashTimestamps:(id)a3;
- (void)setTapToRadarTimestamps:(id)a3;
- (void)writeLogMessage;
@end

@implementation WiFiSoftError

- (WiFiSoftError)initWithName:(id)a3
{
  return [(WiFiSoftError *)self initWithName:a3 andParams:0];
}

- (WiFiSoftError)initWithName:(id)a3 andParams:(id)a4
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    BOOL v17 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v17) {
      -[WiFiSoftError initWithName:andParams:].cold.6(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_9;
  }
  if ((os_variant_is_recovery() & 1) != 0 || (os_variant_is_darwinos() & 1) != 0 || MGGetBoolAnswer())
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v9) {
      -[WiFiSoftError initWithName:andParams:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
LABEL_9:
    v25 = 0;
    v26 = self;
    goto LABEL_10;
  }
  v113 = v8;
  id v114 = v7;
  if (!queue)
  {
    v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v29 = dispatch_queue_create("com.apple.wifi.softerror", v28);
    v30 = (void *)queue;
    queue = (uint64_t)v29;
  }
  if (!logPtr)
  {
    os_log_t v31 = os_log_create("com.apple.wifi.softerror", "");
    v32 = (void *)logPtr;
    logPtr = (uint64_t)v31;
  }
  v33 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
  if (!currentSoftErrors)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA80] set];
    v35 = (void *)currentSoftErrors;
    currentSoftErrors = v34;
  }
  if (!metricTimer)
  {
    dispatch_source_t v36 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)queue);
    v37 = (void *)metricTimer;
    metricTimer = (uint64_t)v36;

    dispatch_source_set_event_handler((dispatch_source_t)metricTimer, &__block_literal_global_10);
    v38 = metricTimer;
    dispatch_time_t v39 = dispatch_time(0, 86400000000000);
    dispatch_source_set_timer(v38, v39, 0x4E94914F0000uLL, 0);
    dispatch_activate((dispatch_object_t)metricTimer);
  }
  objc_storeStrong((id *)&self->_name, a3);
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  v26 = (WiFiSoftError *)(id)[(id)currentSoftErrors copy];
  uint64_t v40 = [(WiFiSoftError *)v26 countByEnumeratingWithState:&v116 objects:v142 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    char v42 = 0;
    uint64_t v43 = *(void *)v117;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v117 != v43) {
          objc_enumerationMutation(v26);
        }
        v45 = [*(id *)(*((void *)&v116 + 1) + 8 * i) pointerValue];
        v46 = [v45 name];
        char v47 = [v46 isEqualToString:self->_name];

        v42 |= v47;
      }
      uint64_t v41 = [(WiFiSoftError *)v26 countByEnumeratingWithState:&v116 objects:v142 count:16];
    }
    while (v41);

    v33 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
    if (v42)
    {
      id v8 = v113;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[WiFiSoftError initWithName:andParams:].cold.5();
      }

      v25 = 0;
      v26 = self;
      id v7 = v114;
      goto LABEL_10;
    }
  }
  else
  {
  }
  v115.receiver = self;
  v115.super_class = (Class)WiFiSoftError;
  v25 = [(WiFiSoftError *)&v115 init];
  id v8 = v113;
  v48 = [v113 objectForKeyedSubscript:@"maxOccurrences"];
  uint64_t v49 = [v48 integerValue];
  BOOL v50 = v49 <= -1 || v48 == 0;
  uint64_t v51 = 100;
  if (!v50) {
    uint64_t v51 = v49;
  }
  v25->_int64_t maxOccurrences = v51;
  v52 = [v113 objectForKeyedSubscript:@"metricSubmissionSamplingRate"];

  uint64_t v53 = [v52 integerValue];
  BOOL v55 = v53 >= 101 || v53 <= -1 || v52 == 0;
  uint64_t v56 = 30;
  if (!v55) {
    uint64_t v56 = v53;
  }
  v25->_int64_t metricSubmissionSamplingRate = v56;
  v57 = [v113 objectForKeyedSubscript:@"maxNonUIActions"];

  uint64_t v58 = [v57 integerValue];
  BOOL v59 = v58 <= -1 || v57 == 0;
  uint64_t v60 = 5;
  if (!v59) {
    uint64_t v60 = v58;
  }
  v25->_int64_t maxNonUIActions = v60;
  v61 = [v113 objectForKeyedSubscript:@"intervalForMaxNonUIActions"];

  uint64_t v62 = [v61 integerValue];
  BOOL v63 = v62 <= -1 || v61 == 0;
  uint64_t v64 = 120;
  if (!v63) {
    uint64_t v64 = v62;
  }
  v25->_int64_t intervalForMaxNonUIActions = v64;
  v65 = [v113 objectForKeyedSubscript:@"maxUIActions"];

  uint64_t v66 = [v65 integerValue];
  BOOL v67 = v66 <= -1 || v65 == 0;
  uint64_t v68 = 2;
  if (!v67) {
    uint64_t v68 = v66;
  }
  v25->_int64_t maxUIActions = v68;
  v69 = [v113 objectForKeyedSubscript:@"intervalForMaxUIActions"];

  uint64_t v70 = [v69 integerValue];
  BOOL v71 = v70 <= -1 || v69 == 0;
  uint64_t v72 = 86400;
  if (!v71) {
    uint64_t v72 = v70;
  }
  v25->_int64_t intervalForMaxUIActions = v72;
  v73 = [v113 objectForKeyedSubscript:@"maxLogMessageLength"];

  uint64_t v74 = [v73 integerValue];
  BOOL v75 = v74 <= -1 || v73 == 0;
  uint64_t v76 = 1000;
  if (!v75) {
    uint64_t v76 = v74;
  }
  v25->_int64_t maxLogMessageLength = v76;
  info = v33[43].info;
  v78 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v25];
  [(__objc2_class_ro *)info addObject:v78];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v25->_creationDate = v79;
  *(int64x2_t *)&v25->_int64_t enabled = vdupq_n_s64(1uLL);
  p_int64_t enabled = &v25->_enabled;
  v81 = NSString;
  name = v25->_name;
  v83 = [MEMORY[0x1E4F28B88] URLUserAllowedCharacterSet];
  v84 = [(NSString *)name stringByAddingPercentEncodingWithAllowedCharacters:v83];
  uint64_t v85 = [v81 stringWithFormat:@"%@.%@", @"com.apple.wifi.softerror", v84];
  metricEventName = v25->_metricEventName;
  v25->_metricEventName = (NSString *)v85;

  if ((cloudAssetsQueried & 1) == 0)
  {
    BOOL v87 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v87) {
      -[WiFiSoftError initWithName:andParams:].cold.4(v87, v88, v89, v90, v91, v92, v93, v94);
    }
    +[WCAFetchWiFiBehaviorParameters fetchWiFiBehaviorWithCompletion:&__block_literal_global_48];
    cloudAssetsQueried = 1;
  }
  id v7 = v114;
  if (cloudAssets)
  {
    v95 = [(id)cloudAssets objectForKey:v25->_name];
    v96 = v95;
    if (v95)
    {
      v97 = [v95 objectForKey:@"enabled"];
      unint64_t v98 = [v97 integerValue];
      if (v97)
      {
        unint64_t v99 = v98;
        if (v98 <= 1 && *p_enabled != v98)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[WiFiSoftError initWithName:andParams:]();
          }
          void *p_enabled = v99;
        }
      }
      v100 = [v96 objectForKey:@"metricsEnabled"];

      unint64_t v101 = [v100 integerValue];
      if (v100)
      {
        unint64_t v102 = v101;
        if (v101 <= 1 && v25->_metricsEnabled != v101)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[WiFiSoftError initWithName:andParams:]();
          }
          v25->_int64_t metricsEnabled = v102;
        }
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int64_t enabled = v25->_enabled;
    int64_t metricsEnabled = v25->_metricsEnabled;
    int64_t maxOccurrences = v25->_maxOccurrences;
    int64_t metricSubmissionSamplingRate = v25->_metricSubmissionSamplingRate;
    int64_t maxNonUIActions = v25->_maxNonUIActions;
    int64_t intervalForMaxNonUIActions = v25->_intervalForMaxNonUIActions;
    int64_t maxUIActions = v25->_maxUIActions;
    int64_t intervalForMaxUIActions = v25->_intervalForMaxUIActions;
    int64_t maxLogMessageLength = v25->_maxLogMessageLength;
    v112 = v25->_name;
    *(_DWORD *)buf = 136317698;
    v121 = "-[WiFiSoftError initWithName:andParams:]";
    __int16 v122 = 2112;
    v123 = v112;
    __int16 v124 = 2048;
    int64_t v125 = enabled;
    __int16 v126 = 2048;
    int64_t v127 = metricsEnabled;
    __int16 v128 = 2048;
    int64_t v129 = maxOccurrences;
    __int16 v130 = 2048;
    int64_t v131 = metricSubmissionSamplingRate;
    __int16 v132 = 2048;
    int64_t v133 = maxNonUIActions;
    __int16 v134 = 2048;
    int64_t v135 = intervalForMaxNonUIActions;
    __int16 v136 = 2048;
    int64_t v137 = maxUIActions;
    __int16 v138 = 2048;
    int64_t v139 = intervalForMaxUIActions;
    __int16 v140 = 2048;
    int64_t v141 = maxLogMessageLength;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Created SoftError <%@>, enabled <%ld>, metricsEnabled <%ld>, params <%ld, %ld, %ld, %ld, %ld, %ld, %ld>", buf, 0x70u);
  }

LABEL_10:
  return v25;
}

uint64_t __40__WiFiSoftError_initWithName_andParams___block_invoke()
{
  return +[WiFiSoftError _submitSummaryReportMetric];
}

uint64_t __40__WiFiSoftError_initWithName_andParams___block_invoke_45(uint64_t a1, uint64_t a2)
{
  return +[WiFiSoftError _cloudAssetsFetchHandler:a2];
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    *(_DWORD *)buf = 136315394;
    uint64_t v10 = "-[WiFiSoftError dealloc]";
    __int16 v11 = 2112;
    uint64_t v12 = name;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Dealloc SoftError <%@>", buf, 0x16u);
  }
  if (self->_hudTimestamps)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = "-[WiFiSoftError dealloc]";
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Clearing HUD...", buf, 0xCu);
    }
    +[WiFiSoftError _updateHUDWithMessage:0];
  }
  v4 = (void *)currentSoftErrors;
  v5 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
  [v4 removeObject:v5];

  if (![(id)currentSoftErrors count])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = "-[WiFiSoftError dealloc]";
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Final dealloc", buf, 0xCu);
    }
    if (metricTimer)
    {
      dispatch_source_cancel((dispatch_source_t)metricTimer);
      v6 = (void *)metricTimer;
      metricTimer = 0;
    }
    if (hudTimer)
    {
      dispatch_source_cancel((dispatch_source_t)hudTimer);
      id v7 = (void *)hudTimer;
      hudTimer = 0;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)WiFiSoftError;
  [(WiFiSoftError *)&v8 dealloc];
}

- (id)incrementCount
{
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000;
  __int16 v11 = __Block_byref_object_copy__6;
  uint64_t v12 = __Block_byref_object_dispose__6;
  id v13 = 0;
  if (_os_feature_enabled_impl() && !MGGetBoolAnswer())
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __31__WiFiSoftError_incrementCount__block_invoke;
    v7[3] = &unk_1E69BD5B0;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync((dispatch_queue_t)queue, v7);
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:0];
    v4 = (void *)v9[5];
    v9[5] = v3;
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __31__WiFiSoftError_incrementCount__block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 72))
  {
    unint64_t v4 = [*(id *)(v2 + 96) count];
    id v5 = *(void **)v3;
    if (v4 >= *(void *)(*(void *)v3 + 8))
    {
      uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:12 userInfo:0];
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __31__WiFiSoftError_incrementCount__block_invoke_cold_1();
      }
    }
    else
    {
      uint64_t v6 = v5[12];
      if (!v6)
      {
        uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v8 = *(void **)(*(void *)v3 + 96);
        *(void *)(*(void *)v3 + 96) = v7;

        id v5 = *(void **)v3;
        uint64_t v6 = *(void *)(*(void *)v3 + 96);
      }
      [v5 _recordCurrentTimestampIn:v6];
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:82 userInfo:0];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void *)(v11 + 40);
    *(void *)(v11 + 40) = v9;
    MEMORY[0x1F41817F8](v9, v12, v10);
  }
}

- (void)resetCount
{
  if (_os_feature_enabled_impl())
  {
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __27__WiFiSoftError_resetCount__block_invoke;
      block[3] = &unk_1E69BC8D8;
      block[4] = self;
      dispatch_sync((dispatch_queue_t)queue, block);
    }
  }
}

uint64_t __27__WiFiSoftError_resetCount__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetCount];
}

- (int64_t)count
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = -1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __22__WiFiSoftError_count__block_invoke;
  v4[3] = &unk_1E69BD5B0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)queue, v4);
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void *__22__WiFiSoftError_count__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[9])
  {
    result = (void *)[result _countOf:result[12] withinInterval:9.22337204e18];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (int64_t)recentCountWithinTimeInterval:(double)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = -1;
  if (_os_feature_enabled_impl() && !MGGetBoolAnswer())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__WiFiSoftError_recentCountWithinTimeInterval___block_invoke;
    block[3] = &unk_1E69BDE48;
    block[4] = self;
    void block[5] = &v8;
    *(double *)&block[6] = a3;
    dispatch_sync((dispatch_queue_t)queue, block);
  }
  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void *__47__WiFiSoftError_recentCountWithinTimeInterval___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[9])
  {
    result = (void *)[result _countOf:result[12] withinInterval:*(double *)(a1 + 48)];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (id)appendLogMessage:(id)a3 includeTimestamp:(BOOL)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__6;
  uint64_t v20 = __Block_byref_object_dispose__6;
  id v21 = 0;
  if (_os_feature_enabled_impl() && !MGGetBoolAnswer())
  {
    uint64_t v10 = queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__WiFiSoftError_appendLogMessage_includeTimestamp___block_invoke;
    v12[3] = &unk_1E69BDE70;
    v12[4] = self;
    BOOL v15 = a4;
    id v13 = v6;
    uint64_t v14 = &v16;
    dispatch_sync(v10, v12);
    id v9 = (id)v17[5];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:0];
    uint64_t v8 = (void *)v17[5];
    v17[5] = v7;

    id v9 = (id)v17[5];
  }
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __51__WiFiSoftError_appendLogMessage_includeTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  int64_t v2 = *(void **)(a1 + 32);
  if (v2[9])
  {
    unint64_t v4 = (void *)v2[14];
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F28E78] stringWithFormat:@"[name <%@>] ", v2[8]];
      id v6 = *(void **)(*(void *)v3 + 112);
      *(void *)(*(void *)v3 + 112) = v5;

      unint64_t v4 = *(void **)(*(void *)v3 + 112);
    }
    uint64_t v7 = [v4 length];
    uint64_t v8 = [*(id *)(a1 + 40) length];
    uint64_t v9 = *(void *)(a1 + 32);
    if ((unint64_t)(v8 + v7) >= *(void *)(v9 + 56))
    {
      uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:12 userInfo:0];
      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __51__WiFiSoftError_appendLogMessage_includeTimestamp___block_invoke_cold_1();
      }
    }
    else if (*(unsigned char *)(a1 + 56))
    {
      id v17 = [MEMORY[0x1E4F1C9C8] date];
      [*(id *)(*(void *)(a1 + 32) + 112) appendFormat:@"[date <%@> logStr <%@>] ", v17, *(void *)(a1 + 40)];
    }
    else
    {
      [*(id *)(v9 + 112) appendFormat:@"[logStr <%@>] ", *(void *)(a1 + 40)];
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:82 userInfo:0];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v13 = *(void *)(v12 + 40);
    *(void *)(v12 + 40) = v10;
    MEMORY[0x1F41817F8](v10, v13, v11);
  }
}

- (NSMutableString)logMessage
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  if (_os_feature_enabled_impl() && !MGGetBoolAnswer())
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __27__WiFiSoftError_logMessage__block_invoke;
    v5[3] = &unk_1E69BD5B0;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync((dispatch_queue_t)queue, v5);
  }
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableString *)v3;
}

uint64_t __27__WiFiSoftError_logMessage__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 72))
  {
    uint64_t v2 = result;
    uint64_t v3 = [*(id *)(v1 + 112) copy];
    uint64_t v5 = *(void *)(*(void *)(v2 + 40) + 8);
    uint64_t v6 = *(void *)(v5 + 40);
    *(void *)(v5 + 40) = v3;
    return MEMORY[0x1F41817F8](v3, v6, v4);
  }
  return result;
}

- (void)clearLogMessage
{
  if (_os_feature_enabled_impl())
  {
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __32__WiFiSoftError_clearLogMessage__block_invoke;
      block[3] = &unk_1E69BC8D8;
      block[4] = self;
      dispatch_sync((dispatch_queue_t)queue, block);
    }
  }
}

void __32__WiFiSoftError_clearLogMessage__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 72))
  {
    uint64_t v2 = *(void **)(v1 + 112);
    *(void *)(v1 + 112) = 0;
  }
}

- (void)writeLogMessage
{
  if (_os_feature_enabled_impl())
  {
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __32__WiFiSoftError_writeLogMessage__block_invoke;
      block[3] = &unk_1E69BC8D8;
      block[4] = self;
      dispatch_sync((dispatch_queue_t)queue, block);
    }
  }
}

void __32__WiFiSoftError_writeLogMessage__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 72))
  {
    uint64_t v2 = (void *)logPtr;
    if (os_log_type_enabled((os_log_t)logPtr, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(v3 + 112);
      uint64_t v5 = *(void **)(v3 + 96);
      uint64_t v6 = v2;
      int v7 = 138412546;
      uint64_t v8 = v4;
      __int16 v9 = 2048;
      uint64_t v10 = [v5 count];
      _os_log_impl(&dword_1D3CCD000, v6, OS_LOG_TYPE_DEFAULT, "%@ [count <%ld>]", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (id)submitMetric
{
  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__6;
  uint64_t v12 = __Block_byref_object_dispose__6;
  id v13 = 0;
  if (_os_feature_enabled_impl()
    && ((MEMORY[0x1E4F5B1E8] != 0) & ~MGGetBoolAnswer()) != 0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __29__WiFiSoftError_submitMetric__block_invoke;
    v7[3] = &unk_1E69BD5B0;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync((dispatch_queue_t)queue, v7);
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:0];
    uint64_t v4 = (void *)v9[5];
    v9[5] = v3;
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __29__WiFiSoftError_submitMetric__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (id *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 72) && *(void *)(v2 + 80))
  {
    if (*((void *)*v3 + 2) <= (uint64_t)arc4random_uniform(0x64u))
    {
      uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:35 userInfo:0];
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __29__WiFiSoftError_submitMetric__block_invoke_cold_1();
      }
    }
    else
    {
      uint64_t v4 = [NSString stringWithFormat:@"%@.%@", @"com.apple.wifi.softerror", @"generic"];
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [*v3 _addGenericMetricData:v5];
      if ([v5 count])
      {
        [v5 setObject:*((void *)*v3 + 8) forKey:@"name"];
        id v14 = v5;
        AnalyticsSendEventLazy();
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = (void *)*((void *)*v3 + 8);
          *(_DWORD *)buf = 136315650;
          uint64_t v16 = "-[WiFiSoftError submitMetric]_block_invoke_2";
          __int16 v17 = 2112;
          id v18 = v6;
          __int16 v19 = 2112;
          uint64_t v20 = v4;
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: SoftError <%@> submitted metric <%@>", buf, 0x20u);
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14508], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v16 = "-[WiFiSoftError submitMetric]_block_invoke";
        __int16 v17 = 2112;
        id v18 = v5;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14508], OS_LOG_TYPE_DEFAULT, "%s: SoftError metric dictionary <%@>", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:82 userInfo:0];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void *)(v9 + 40);
    *(void *)(v9 + 40) = v7;
    MEMORY[0x1F41817F8](v7, v10, v8);
  }
}

id __29__WiFiSoftError_submitMetric__block_invoke_76(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)submitMetricWithData:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__6;
  __int16 v17 = __Block_byref_object_dispose__6;
  id v18 = 0;
  if (_os_feature_enabled_impl()
    && ((MEMORY[0x1E4F5B1E8] != 0) & ~MGGetBoolAnswer()) != 0)
  {
    uint64_t v8 = queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__WiFiSoftError_submitMetricWithData___block_invoke;
    block[3] = &unk_1E69BDE98;
    block[4] = self;
    uint64_t v12 = &v13;
    id v11 = v4;
    dispatch_sync(v8, block);
    id v7 = (id)v14[5];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:0];
    uint64_t v6 = (void *)v14[5];
    v14[5] = v5;

    id v7 = (id)v14[5];
  }
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __38__WiFiSoftError_submitMetricWithData___block_invoke(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (id *)(a1 + 4);
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 72) && *(void *)(v2 + 80))
  {
    if (*((void *)*v3 + 2) <= (uint64_t)arc4random_uniform(0x64u))
    {
      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:35 userInfo:0];
      uint64_t v10 = *(void *)(a1[6] + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __38__WiFiSoftError_submitMetricWithData___block_invoke_cold_1();
      }
    }
    else
    {
      if (a1[5]) {
        id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:a1[5]];
      }
      else {
        id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      uint64_t v12 = v4;
      [*v3 _addGenericMetricData:v4];
      if ([v12 count])
      {
        [v12 setObject:*((void *)*v3 + 8) forKey:@"name"];
        id v15 = v12;
        AnalyticsSendEventLazy();
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = (void *)*((void *)*v3 + 8);
          uint64_t v14 = *((void *)*v3 + 15);
          *(_DWORD *)buf = 136315650;
          __int16 v17 = "-[WiFiSoftError submitMetricWithData:]_block_invoke_2";
          __int16 v18 = 2112;
          __int16 v19 = v13;
          __int16 v20 = 2112;
          uint64_t v21 = v14;
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: SoftError <%@> submitted metric <%@>", buf, 0x20u);
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14508], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v17 = "-[WiFiSoftError submitMetricWithData:]_block_invoke";
        __int16 v18 = 2112;
        __int16 v19 = v12;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14508], OS_LOG_TYPE_DEFAULT, "%s: SoftError metric dictionary <%@>", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:82 userInfo:0];
    uint64_t v7 = *(void *)(a1[6] + 8);
    uint64_t v8 = *(void *)(v7 + 40);
    *(void *)(v7 + 40) = v5;
    MEMORY[0x1F41817F8](v5, v8, v6);
  }
}

id __38__WiFiSoftError_submitMetricWithData___block_invoke_79(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)submitABCReportWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__6;
  __int16 v17 = __Block_byref_object_dispose__6;
  id v18 = 0;
  if (_os_feature_enabled_impl() && (MGGetBoolAnswer() & 1) == 0 && objc_opt_class())
  {
    uint64_t v5 = queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__WiFiSoftError_submitABCReportWithReason___block_invoke;
    block[3] = &unk_1E69BDE98;
    block[4] = self;
    uint64_t v12 = &v13;
    id v11 = v4;
    dispatch_sync(v5, block);
    id v6 = (id)v14[5];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:0];
    uint64_t v8 = (void *)v14[5];
    v14[5] = v7;

    id v6 = (id)v14[5];
  }
  _Block_object_dispose(&v13, 8);

  return v6;
}

void __43__WiFiSoftError_submitABCReportWithReason___block_invoke(void *a1)
{
  uint64_t v3 = a1 + 4;
  uint64_t v2 = (void *)a1[4];
  if (v2[9])
  {
    if ([v2 _maxNonUIActionsReachedFor:v2[17]])
    {
      uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:35 userInfo:0];
      uint64_t v5 = *(void *)(a1[6] + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __43__WiFiSoftError_submitABCReportWithReason___block_invoke_cold_1();
      }
    }
    else
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void **)(*v3 + 128);
      if (!v12)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4FA8AE8]);
        uint64_t v14 = *(void **)(*v3 + 128);
        *(void *)(*v3 + 128) = v13;

        uint64_t v11 = *v3;
        uint64_t v12 = *(void **)(*v3 + 128);
      }
      uint64_t v15 = *(void *)(v11 + 64);
      uint64_t v16 = a1[5];
      __int16 v17 = [MEMORY[0x1E4F28F80] processInfo];
      id v18 = [v17 processName];
      __int16 v19 = [v12 signatureWithDomain:@"WiFi" type:@"SoftError" subType:v15 subtypeContext:v16 detectedProcess:v18 triggerThresholdValues:0];

      uint64_t v20 = a1[4];
      uint64_t v21 = *(void **)(v20 + 128);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __43__WiFiSoftError_submitABCReportWithReason___block_invoke_89;
      v26[3] = &unk_1E69BDEC0;
      v26[4] = v20;
      if (([v21 snapshotWithSignature:v19 duration:0 events:0 payload:0 actions:v26 reply:0.0] & 1) == 0&& os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        __43__WiFiSoftError_submitABCReportWithReason___block_invoke_cold_2();
      }
      uint64_t v22 = (void *)*v3;
      uint64_t v23 = *(void *)(*v3 + 136);
      if (!v23)
      {
        uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
        v25 = *(void **)(*v3 + 136);
        *(void *)(*v3 + 136) = v24;

        uint64_t v22 = (void *)*v3;
        uint64_t v23 = *(void *)(*v3 + 136);
      }
      [v22 _recordCurrentTimestampIn:v23];
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:82 userInfo:0];
    uint64_t v9 = *(void *)(a1[6] + 8);
    uint64_t v10 = *(void *)(v9 + 40);
    *(void *)(v9 + 40) = v7;
    MEMORY[0x1F41817F8](v7, v10, v8);
  }
}

void __43__WiFiSoftError_submitABCReportWithReason___block_invoke_89(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 64);
    int v3 = 136315394;
    uint64_t v4 = "-[WiFiSoftError submitABCReportWithReason:]_block_invoke";
    __int16 v5 = 2112;
    uint64_t v6 = v2;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: SoftError <%@> submitted an ABC report", (uint8_t *)&v3, 0x16u);
  }
}

- (id)updateHUDWithMessage:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  dispatch_source_t v36 = __Block_byref_object_copy__6;
  v37 = __Block_byref_object_dispose__6;
  id v38 = 0;
  if (!_os_feature_enabled_impl()
    || (MGGetBoolAnswer() & 1) != 0
    || !MGGetBoolAnswer()
    || !MGGetBoolAnswer()
    || !MEMORY[0x1E4F39B08]
    || isDisplayOff())
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:0];
    uint64_t v6 = (void *)v34[5];
    v34[5] = v5;

LABEL_8:
    uint64_t v7 = v34;
LABEL_9:
    id v8 = (id)v7[5];
    goto LABEL_10;
  }
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v40 = "-[WiFiSoftError updateHUDWithMessage:]";
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Clearing HUD and HUD timer...", buf, 0xCu);
    }
    +[WiFiSoftError _updateHUDWithMessage:0];
    if (hudTimer) {
      dispatch_source_set_timer((dispatch_source_t)hudTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
    uint64_t v7 = v34;
    goto LABEL_9;
  }
  uint64_t v10 = hudTimer;
  if (!hudTimer)
  {
    dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)queue);
    uint64_t v12 = (void *)hudTimer;
    hudTimer = (uint64_t)v11;

    dispatch_source_set_event_handler((dispatch_source_t)hudTimer, &__block_literal_global_98);
    dispatch_activate((dispatch_object_t)hudTimer);
    uint64_t v10 = hudTimer;
  }
  dispatch_time_t v13 = dispatch_time(0, 2000000000);
  dispatch_source_set_timer(v10, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
  CFStringRef v14 = (const __CFString *)CFPreferencesCopyValue(@"kWiFiSoftErrorHUDPreference", @"com.apple.settings.airport", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFStringRef v15 = v14;
  if (!v14
    || ((CFTypeID v16 = CFGetTypeID(v14), v16 != CFStringGetTypeID())
      ? (int v17 = 0)
      : CFEqual(v15, @"Limited")
      ? (int v17 = 1)
      : (int v17 = 2 * (CFEqual(v15, @"Unlimited"))),
        CFRelease(v15),
        !v17))
  {
    BOOL v19 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v19) {
      -[WiFiSoftError updateHUDWithMessage:](v19, v20, v21, v22, v23, v24, v25, v26);
    }
    uint64_t v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:1 userInfo:0];
    v28 = (void *)v34[5];
    v34[5] = v27;

    goto LABEL_8;
  }
  id v18 = queue;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __38__WiFiSoftError_updateHUDWithMessage___block_invoke_114;
  v29[3] = &unk_1E69BDEE8;
  int v32 = v17;
  v29[4] = self;
  os_log_t v31 = &v33;
  id v30 = v4;
  dispatch_sync(v18, v29);
  id v8 = (id)v34[5];

LABEL_10:
  _Block_object_dispose(&v33, 8);

  return v8;
}

uint64_t __38__WiFiSoftError_updateHUDWithMessage___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    uint64_t v2 = "-[WiFiSoftError updateHUDWithMessage:]_block_invoke";
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Clearing HUD...", (uint8_t *)&v1, 0xCu);
  }
  return +[WiFiSoftError _updateHUDWithMessage:0];
}

void __38__WiFiSoftError_updateHUDWithMessage___block_invoke_114(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[9])
  {
    if ([v2 _maxUIActionsReachedFor:v2[19]] && *(_DWORD *)(a1 + 56) == 1)
    {
      uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:35 userInfo:0];
      uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __38__WiFiSoftError_updateHUDWithMessage___block_invoke_114_cold_1();
      }
    }
    else
    {
      +[WiFiSoftError _updateHUDWithMessage:*(void *)(a1 + 40)];
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = v7[19];
      if (!v8)
      {
        uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v10 = *(void **)(*(void *)v3 + 152);
        *(void *)(*(void *)v3 + 152) = v9;

        uint64_t v7 = *(void **)v3;
        uint64_t v8 = *(void *)(*(void *)v3 + 152);
      }
      [v7 _recordCurrentTimestampIn:v8];
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:82 userInfo:0];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v14 = *(void *)(v13 + 40);
    *(void *)(v13 + 40) = v11;
    MEMORY[0x1F41817F8](v11, v14, v12);
  }
}

- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  CFTypeID v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  if (!_os_feature_enabled_impl()
    || (MGGetBoolAnswer() & 1) != 0
    || !MGGetBoolAnswer()
    || !MGGetBoolAnswer()
    || !objc_opt_class()
    || MKBGetDeviceLockState() == 1)
  {
    goto LABEL_10;
  }
  int v7 = isDisplayOff() ^ 1;
  if (!v6) {
    LOBYTE(v7) = 0;
  }
  if (v7)
  {
    uint64_t v10 = queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__WiFiSoftError_askToLaunchTapToRadarWithMessage_timeout___block_invoke;
    v11[3] = &unk_1E69BD408;
    v11[4] = self;
    double v14 = a4;
    id v12 = v6;
    uint64_t v13 = &v15;
    dispatch_sync(v10, v11);
    int v8 = *((unsigned __int8 *)v16 + 24);
  }
  else
  {
LABEL_10:
    int v8 = *((unsigned __int8 *)v16 + 24);
  }
  _Block_object_dispose(&v15, 8);

  return v8 != 0;
}

void __58__WiFiSoftError_askToLaunchTapToRadarWithMessage_timeout___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[9])
  {
    if ([v2 _maxUIActionsReachedFor:v2[20]])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __58__WiFiSoftError_askToLaunchTapToRadarWithMessage_timeout___block_invoke_cold_1();
      }
    }
    else
    {
      CFOptionFlags v8 = 0;
      CFUserNotificationDisplayAlert(*(CFTimeInterval *)(a1 + 56), 0, 0, 0, 0, *(CFStringRef *)(a1 + 40), @"File a radar now?", @"No", @"Yes", 0, &v8);
      if (v8 == 1) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
      uint64_t v4 = *(void **)v3;
      uint64_t v5 = *(void *)(*(void *)v3 + 160);
      if (!v5)
      {
        uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
        int v7 = *(void **)(*(void *)v3 + 160);
        *(void *)(*(void *)v3 + 160) = v6;

        uint64_t v4 = *(void **)v3;
        uint64_t v5 = *(void *)(*(void *)v3 + 160);
      }
      [v4 _recordCurrentTimestampIn:v5];
    }
  }
}

- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3
{
  return [(WiFiSoftError *)self askToLaunchTapToRadarWithMessage:a3 timeout:30.0];
}

- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  if (MKBGetDeviceLockState() == 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = isDisplayOff();
  }
  if (!_os_feature_enabled_impl() || !MGGetBoolAnswer() || !MGGetBoolAnswer()) {
    goto LABEL_14;
  }
  char v11 = objc_opt_class() ? v10 : 1;
  if (v11) {
    goto LABEL_14;
  }
  int v12 = MGGetBoolAnswer() ^ 1;
  if (!v8) {
    LOBYTE(v12) = 0;
  }
  if (v12)
  {
    BOOL v19 = queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__WiFiSoftError_askToLaunchTapToRadarWithMessage_timeout_completionHandler___block_invoke;
    block[3] = &unk_1E69BD408;
    block[4] = self;
    double v23 = a4;
    id v21 = v8;
    uint64_t v22 = &v24;
    dispatch_sync(v19, block);
    if (v9) {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
    int v17 = *((unsigned __int8 *)v25 + 24);
  }
  else
  {
LABEL_14:
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    v28 = @"deviceNotInteractive";
    double v14 = [NSNumber numberWithBool:v10];
    v29[0] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    CFTypeID v16 = [v13 errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:v15];

    if (v9) {
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v16);
    }
    int v17 = *((unsigned __int8 *)v25 + 24);
  }
  _Block_object_dispose(&v24, 8);

  return v17 != 0;
}

void __76__WiFiSoftError_askToLaunchTapToRadarWithMessage_timeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[9])
  {
    if ([v2 _maxUIActionsReachedFor:v2[20]])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __76__WiFiSoftError_askToLaunchTapToRadarWithMessage_timeout_completionHandler___block_invoke_cold_1();
      }
    }
    else
    {
      CFOptionFlags v8 = 0;
      CFUserNotificationDisplayAlert(*(CFTimeInterval *)(a1 + 56), 0, 0, 0, 0, *(CFStringRef *)(a1 + 40), @"File a radar now?", @"No", @"Yes", 0, &v8);
      if (v8 == 1) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
      uint64_t v4 = *(void **)v3;
      uint64_t v5 = *(void *)(*(void *)v3 + 160);
      if (!v5)
      {
        uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
        int v7 = *(void **)(*(void *)v3 + 160);
        *(void *)(*(void *)v3 + 160) = v6;

        uint64_t v4 = *(void **)v3;
        uint64_t v5 = *(void *)(*(void *)v3 + 160);
      }
      [v4 _recordCurrentTimestampIn:v5];
    }
  }
}

- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3 completionHandler:(id)a4
{
  return [(WiFiSoftError *)self askToLaunchTapToRadarWithMessage:a3 timeout:a4 completionHandler:30.0];
}

- (id)tapToRadarWithURL:(id)a3 completionHandler:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  double v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__6;
  uint64_t v26 = __Block_byref_object_dispose__6;
  id v27 = 0;
  if (MKBGetDeviceLockState() == 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = isDisplayOff();
  }
  if (_os_feature_enabled_impl()
    && ((MGGetBoolAnswer() | v8) & 1) == 0
    && MGGetBoolAnswer()
    && MGGetBoolAnswer()
    && (uint64_t v9 = objc_opt_class(), v6)
    && v9)
  {
    uint64_t v10 = queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__WiFiSoftError_tapToRadarWithURL_completionHandler___block_invoke;
    block[3] = &unk_1E69BDF38;
    block[4] = self;
    id v21 = &v22;
    id v20 = v7;
    id v19 = v6;
    dispatch_sync(v10, block);
    id v11 = (id)v23[5];
  }
  else
  {
    int v12 = (void *)MEMORY[0x1E4F28C58];
    v28 = @"deviceNotInteractive";
    uint64_t v13 = [NSNumber numberWithBool:v8];
    v29[0] = v13;
    double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    uint64_t v15 = [v12 errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:v14];
    CFTypeID v16 = (void *)v23[5];
    v23[5] = v15;

    if (v7) {
      (*((void (**)(id, void, uint64_t))v7 + 2))(v7, 0, v23[5]);
    }
    id v11 = (id)v23[5];
  }
  _Block_object_dispose(&v22, 8);

  return v11;
}

void __53__WiFiSoftError_tapToRadarWithURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[9])
  {
    if ([v2 _maxUIActionsReachedFor:v2[21]])
    {
      uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:35 userInfo:0];
      uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __53__WiFiSoftError_tapToRadarWithURL_completionHandler___block_invoke_cold_1();
      }
      uint64_t v7 = *(void *)(a1 + 48);
      if (v7) {
        (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, 0, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
      }
    }
    else
    {
      int v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      id v20 = __53__WiFiSoftError_tapToRadarWithURL_completionHandler___block_invoke_130;
      id v21 = &unk_1E69BDF10;
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v22 = *(void *)(a1 + 32);
      id v23 = *(id *)(a1 + 48);
      [v12 openURL:v13 configuration:0 completionHandler:&v18];

      double v14 = *(void **)(a1 + 32);
      uint64_t v15 = v14[21];
      if (!v15)
      {
        uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v18, v19, v20, v21, v22);
        int v17 = *(void **)(*(void *)v3 + 168);
        *(void *)(*(void *)v3 + 168) = v16;

        double v14 = *(void **)v3;
        uint64_t v15 = *(void *)(*(void *)v3 + 168);
      }
      objc_msgSend(v14, "_recordCurrentTimestampIn:", v15, v18, v19, v20, v21, v22);
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:82 userInfo:0];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void *)(v10 + 40);
    *(void *)(v10 + 40) = v8;
    MEMORY[0x1F41817F8](v8, v11, v9);
  }
}

void __53__WiFiSoftError_tapToRadarWithURL_completionHandler___block_invoke_130(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __53__WiFiSoftError_tapToRadarWithURL_completionHandler___block_invoke_130_cold_1();
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
}

- (void)_recordCurrentTimestampIn:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  [v4 timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "numberWithDouble:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 addObject:v6];
}

- (int64_t)_countOf:(id)a3 withinInterval:(double)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    if (a4 == 9.22337204e18)
    {
      int64_t v7 = [v5 count];
    }
    else
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v9 = v8;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        int64_t v7 = 0;
        uint64_t v13 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "doubleValue", (void)v17);
            if (v9 - v15 < a4) {
              ++v7;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }
      else
      {
        int64_t v7 = 0;
      }
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (BOOL)_maxNonUIActionsReachedFor:(id)a3
{
  id v4 = a3;
  BOOL v7 = 0;
  if (v4)
  {
    int64_t v5 = [(WiFiSoftError *)self _countOf:v4 withinInterval:(double)self->_intervalForMaxNonUIActions];
    int64_t v6 = [(WiFiSoftError *)self _countOf:v4 withinInterval:9.22337204e18];
    if (v5 >= self->_maxNonUIActions || v6 >= self->_maxOccurrences) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (BOOL)_maxUIActionsReachedFor:(id)a3
{
  id v4 = a3;
  BOOL v7 = 0;
  if (v4)
  {
    int64_t v5 = [(WiFiSoftError *)self _countOf:v4 withinInterval:(double)self->_intervalForMaxUIActions];
    int64_t v6 = [(WiFiSoftError *)self _countOf:v4 withinInterval:9.22337204e18];
    if (v5 >= self->_maxUIActions || v6 >= self->_maxOccurrences) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (void)_resetCount
{
  if (self->_enabled) {
    [(NSMutableArray *)self->_occurrenceTimestamps removeAllObjects];
  }
}

- (void)_addConfigurationData:(id)a3
{
  id v4 = NSNumber;
  int64_t metricSubmissionSamplingRate = self->_metricSubmissionSamplingRate;
  id v6 = a3;
  BOOL v7 = [v4 numberWithInteger:metricSubmissionSamplingRate];
  [v6 setObject:v7 forKey:@"samplingRate"];

  double v8 = [NSNumber numberWithInteger:self->_maxOccurrences];
  [v6 setObject:v8 forKey:@"maxOccurrences"];

  objc_msgSend(NSNumber, "numberWithBool:", -[NSMutableArray count](self->_occurrenceTimestamps, "count") == self->_maxOccurrences);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v9 forKey:@"reachedMaxDailyOccurrences"];
}

- (void)_addGenericMetricData:(id)a3
{
  id v15 = a3;
  uint64_t v4 = [(WiFiSoftError *)self _countOf:self->_occurrenceTimestamps withinInterval:9.22337204e18];
  uint64_t v5 = v4;
  if (v4 > 1 || v4 == 1 && self->_lastTimestamp)
  {
    id v6 = [(NSMutableArray *)self->_occurrenceTimestamps objectAtIndexedSubscript:v4 - 1];
    [v6 doubleValue];
    double v8 = v7;

    if (v5 <= 1)
    {
      [(NSNumber *)self->_lastTimestamp doubleValue];
      double v11 = v12;
    }
    else
    {
      id v9 = [(NSMutableArray *)self->_occurrenceTimestamps objectAtIndexedSubscript:v5 - 2];
      [v9 doubleValue];
      double v11 = v10;
    }
    uint64_t v13 = +[WiFiUsagePrivacyFilter getBinTimeInterval:1 As:v8 - v11];
    if (v13)
    {
      double v14 = (void *)v13;
      [v15 setObject:v13 forKey:@"timeSinceLastOccurrenceBin"];
      [(WiFiSoftError *)self _addConfigurationData:v15];
    }
  }
}

+ (void)_submitSummaryReportMetric
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl() && (MGGetBoolAnswer() & 1) == 0 && MEMORY[0x1E4F5B1E8])
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v3 = v2;
    uint64_t v4 = [NSString stringWithFormat:@"%@.%@", @"com.apple.wifi.softerror", @"generic"];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = (id)currentSoftErrors;
    uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v32;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(obj);
          }
          double v10 = [*(id *)(*((void *)&v31 + 1) + 8 * i) pointerValue];
          [v10 creationDate];
          if (v3 - v11 >= 86400.0 && [v10 metricsEnabled])
          {
            double v12 = [v10 name];
            [v5 setObject:v12 forKey:@"name"];

            long long v29 = 0u;
            long long v30 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            uint64_t v13 = [v10 occurrenceTimestamps];
            uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v41 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = 0;
              uint64_t v17 = *(void *)v28;
              do
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v28 != v17) {
                    objc_enumerationMutation(v13);
                  }
                  [*(id *)(*((void *)&v27 + 1) + 8 * j) doubleValue];
                  if (v3 - v19 < 86400.0) {
                    ++v16;
                  }
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v41 count:16];
              }
              while (v15);
            }
            else
            {
              uint64_t v16 = 0;
            }

            long long v20 = [NSNumber numberWithInteger:v16];
            [v5 setObject:v20 forKey:@"occurrenceCountIn24hr"];

            [v10 _addConfigurationData:v5];
            id v21 = [v10 occurrenceTimestamps];
            uint64_t v22 = [v21 lastObject];
            [v10 setLastTimestamp:v22];

            [v10 _resetCount];
            id v23 = v5;
            AnalyticsSendEventLazy();
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v24 = [v10 name];
              *(_DWORD *)buf = 136315650;
              dispatch_source_t v36 = "+[WiFiSoftError _submitSummaryReportMetric]";
              __int16 v37 = 2112;
              id v38 = v24;
              __int16 v39 = 2112;
              uint64_t v40 = v4;
              _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: SoftError <%@> submitted a summary in metric <%@>", buf, 0x20u);
            }
            uint64_t v8 = v25;
            if (os_log_type_enabled(MEMORY[0x1E4F14508], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              dispatch_source_t v36 = "+[WiFiSoftError _submitSummaryReportMetric]";
              __int16 v37 = 2112;
              id v38 = v5;
              _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14508], OS_LOG_TYPE_DEFAULT, "%s: SoftError metric dictionary <%@>", buf, 0x16u);
            }
            [v23 removeAllObjects];
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:0];
  }
}

id __43__WiFiSoftError__submitSummaryReportMetric__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)_cloudAssetsFetchHandler:(id)a3
{
  id v3 = a3;
  uint64_t v4 = queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__WiFiSoftError__cloudAssetsFetchHandler___block_invoke;
  block[3] = &unk_1E69BC8D8;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

void __42__WiFiSoftError__cloudAssetsFetchHandler___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v2) {
    __42__WiFiSoftError__cloudAssetsFetchHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  double v10 = *(void **)(a1 + 32);
  if (v10)
  {
    double v11 = [v10 softErrors];
    uint64_t v12 = [v11 copy];
    uint64_t v13 = (void *)cloudAssets;
    cloudAssets = v12;
  }
  if (cloudAssets)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v14 = (id)currentSoftErrors;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v15)
    {
      uint64_t v17 = v15;
      uint64_t v18 = *(void *)v38;
      *(void *)&long long v16 = 136315906;
      long long v34 = v16;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v14);
          }
          long long v20 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v19), "pointerValue", v34);
          id v21 = (void *)cloudAssets;
          uint64_t v22 = [v20 name];
          id v23 = [v21 objectForKey:v22];

          if (v23)
          {
            uint64_t v24 = [v23 objectForKey:@"enabled"];
            unint64_t v25 = [v24 integerValue];
            if (v24) {
              BOOL v26 = v25 > 1;
            }
            else {
              BOOL v26 = 1;
            }
            if (!v26)
            {
              unint64_t v27 = v25;
              if ([v20 enabled] != v25)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                {
                  uint64_t v35 = [v20 name];
                  uint64_t v32 = [v20 enabled];
                  *(_DWORD *)buf = v34;
                  char v42 = "+[WiFiSoftError _cloudAssetsFetchHandler:]_block_invoke";
                  __int16 v43 = 2112;
                  v44 = v35;
                  __int16 v45 = 2048;
                  uint64_t v46 = v32;
                  __int16 v47 = 2048;
                  unint64_t v48 = v27;
                  _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: Updating SoftError <%@> property <enabled> from %ld => %ld", buf, 0x2Au);
                }
                [v20 setEnabled:v27];
              }
            }
            long long v28 = [v23 objectForKey:@"metricsEnabled"];

            unint64_t v29 = [v28 integerValue];
            if (v28) {
              BOOL v30 = v29 > 1;
            }
            else {
              BOOL v30 = 1;
            }
            if (!v30)
            {
              unint64_t v31 = v29;
              if ([v20 metricsEnabled] != v29)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                {
                  dispatch_source_t v36 = [v20 name];
                  uint64_t v33 = [v20 metricsEnabled];
                  *(_DWORD *)buf = v34;
                  char v42 = "+[WiFiSoftError _cloudAssetsFetchHandler:]_block_invoke";
                  __int16 v43 = 2112;
                  v44 = v36;
                  __int16 v45 = 2048;
                  uint64_t v46 = v33;
                  __int16 v47 = 2048;
                  unint64_t v48 = v31;
                  _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: Updating SoftError <%@> property <metricsEnabled> from %ld => %ld", buf, 0x2Au);
                }
                [v20 setMetricsEnabled:v31];
              }
            }
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v14 countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v17);
    }
  }
}

+ (void)_updateHUDWithMessage:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v3;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[HUD]: HUD message info: %@", buf, 0xCu);
    }
    id v4 = v3;
    if (objc_opt_class() && objc_opt_class() && objc_opt_class() && objc_opt_class())
    {
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"content" value:v4];
      id v6 = objc_alloc_init(MEMORY[0x1E4F29088]);
      [v6 setScheme:@"wifiapp"];
      [v6 setHost:@"banner"];
      id v23 = v5;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
      [v6 setQueryItems:v7];

      uint64_t v8 = [v6 URL];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = [v8 absoluteString];
        *(_DWORD *)buf = 138412290;
        id v25 = v9;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[HUD]: attempted to open url: %@", buf, 0xCu);
      }
      id v10 = objc_alloc_init(MEMORY[0x1E4F224A0]);
      double v11 = objc_opt_new();
      [v11 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F62600]];
      [v10 setFrontBoardOptions:v11];
      uint64_t v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      id v22 = 0;
      id v13 = (id)[v12 openURL:v8 configuration:v10 error:&v22];
      id v14 = v22;

      if (v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        +[WiFiSoftError _updateHUDWithMessage:]((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      +[WiFiSoftError _updateHUDWithMessage:]();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[WiFiSoftError _updateHUDWithMessage:]();
  }
}

- (int64_t)maxOccurrences
{
  return self->_maxOccurrences;
}

- (int64_t)metricSubmissionSamplingRate
{
  return self->_metricSubmissionSamplingRate;
}

- (int64_t)maxNonUIActions
{
  return self->_maxNonUIActions;
}

- (int64_t)intervalForMaxNonUIActions
{
  return self->_intervalForMaxNonUIActions;
}

- (int64_t)maxUIActions
{
  return self->_maxUIActions;
}

- (int64_t)intervalForMaxUIActions
{
  return self->_intervalForMaxUIActions;
}

- (int64_t)maxLogMessageLength
{
  return self->_maxLogMessageLength;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(int64_t)a3
{
  self->_int64_t enabled = a3;
}

- (int64_t)metricsEnabled
{
  return self->_metricsEnabled;
}

- (void)setMetricsEnabled:(int64_t)a3
{
  self->_int64_t metricsEnabled = a3;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(double)a3
{
  self->_creationDate = a3;
}

- (NSMutableArray)occurrenceTimestamps
{
  return self->_occurrenceTimestamps;
}

- (void)setOccurrenceTimestamps:(id)a3
{
}

- (NSNumber)lastTimestamp
{
  return self->_lastTimestamp;
}

- (void)setLastTimestamp:(id)a3
{
}

- (void)setLogMessage:(id)a3
{
}

- (NSString)metricEventName
{
  return self->_metricEventName;
}

- (void)setMetricEventName:(id)a3
{
}

- (SDRDiagnosticReporter)abcReporter
{
  return self->_abcReporter;
}

- (void)setAbcReporter:(id)a3
{
}

- (NSMutableArray)abcSubmissionTimestamps
{
  return self->_abcSubmissionTimestamps;
}

- (void)setAbcSubmissionTimestamps:(id)a3
{
}

- (NSMutableArray)simulateCrashTimestamps
{
  return self->_simulateCrashTimestamps;
}

- (void)setSimulateCrashTimestamps:(id)a3
{
}

- (NSMutableArray)hudTimestamps
{
  return self->_hudTimestamps;
}

- (void)setHudTimestamps:(id)a3
{
}

- (NSMutableArray)askToLaunchTapToRadarTimestamps
{
  return self->_askToLaunchTapToRadarTimestamps;
}

- (void)setAskToLaunchTapToRadarTimestamps:(id)a3
{
}

- (NSMutableArray)tapToRadarTimestamps
{
  return self->_tapToRadarTimestamps;
}

- (void)setTapToRadarTimestamps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToRadarTimestamps, 0);
  objc_storeStrong((id *)&self->_askToLaunchTapToRadarTimestamps, 0);
  objc_storeStrong((id *)&self->_hudTimestamps, 0);
  objc_storeStrong((id *)&self->_simulateCrashTimestamps, 0);
  objc_storeStrong((id *)&self->_abcSubmissionTimestamps, 0);
  objc_storeStrong((id *)&self->_abcReporter, 0);
  objc_storeStrong((id *)&self->_metricEventName, 0);
  objc_storeStrong((id *)&self->_logMessage, 0);
  objc_storeStrong((id *)&self->_lastTimestamp, 0);
  objc_storeStrong((id *)&self->_occurrenceTimestamps, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithName:(uint64_t)a3 andParams:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithName:andParams:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1D3CCD000, MEMORY[0x1E4F14500], v0, "%s: Updating SoftError <%@> property <metricsEnabled> from %ld => %ld", v1, v2, v3, v4, 2u);
}

- (void)initWithName:andParams:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1D3CCD000, MEMORY[0x1E4F14500], v0, "%s: Updating SoftError <%@> property <enabled> from %ld => %ld", v1, v2, v3, v4, 2u);
}

- (void)initWithName:(uint64_t)a3 andParams:(uint64_t)a4 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithName:andParams:.cold.5()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_1D3CCD000, MEMORY[0x1E4F14500], v0, "%s: Error: SoftError <%@> already present, ignoring", v1, v2, v3, v4, 2u);
}

- (void)initWithName:(uint64_t)a3 andParams:(uint64_t)a4 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __31__WiFiSoftError_incrementCount__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1D3CCD000, MEMORY[0x1E4F14500], v0, "%s: Error: SoftError <%@> has reached its max occurrence count %ld, ignoring", v1, v2, v3, v4, 2u);
}

void __51__WiFiSoftError_appendLogMessage_includeTimestamp___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1D3CCD000, MEMORY[0x1E4F14500], v0, "%s: Error: SoftError <%@> has reached its max log length %ld, ignoring", v1, v2, v3, v4, 2u);
}

void __29__WiFiSoftError_submitMetric__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1D3CCD000, MEMORY[0x1E4F14500], v0, "%s: Error: SoftError <%@> metric submission dropped, sampling rate applied was %ld percent", v1, v2, v3, v4, 2u);
}

void __38__WiFiSoftError_submitMetricWithData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1D3CCD000, MEMORY[0x1E4F14500], v0, "%s: Error: SoftError <%@> metric submission dropped, sampling rate applied was %ld percent", v1, v2, v3, v4, 2u);
}

void __43__WiFiSoftError_submitABCReportWithReason___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_1D3CCD000, MEMORY[0x1E4F14500], v0, "%s: Error: SoftError <%@> has reached its max count of submitting %ld ABC reports within the last %ld seconds, ignoring", v1, v2, v3, v4, 2u);
}

void __43__WiFiSoftError_submitABCReportWithReason___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_1D3CCD000, MEMORY[0x1E4F14500], v0, "%s: Error: SoftError <%@> ABC report parameters invalid", v1, v2, v3, v4, 2u);
}

- (void)updateHUDWithMessage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __38__WiFiSoftError_updateHUDWithMessage___block_invoke_114_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_1D3CCD000, MEMORY[0x1E4F14500], v0, "%s: Error: SoftError <%@> has reached its max count of generating %ld HUD messages within the last %ld seconds, ignoring", v1, v2, v3, v4, 2u);
}

void __58__WiFiSoftError_askToLaunchTapToRadarWithMessage_timeout___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_1D3CCD000, MEMORY[0x1E4F14500], v0, "%s: Error: SoftError <%@> has reached its max count of %ld Tap-to-Radar alerts within the last %ld seconds, ignoring", v1, v2, v3, v4, 2u);
}

void __76__WiFiSoftError_askToLaunchTapToRadarWithMessage_timeout_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_1D3CCD000, MEMORY[0x1E4F14500], v0, "%s: Error: SoftError <%@> has reached its max count of %ld Tap-to-Radar alerts within the last %ld seconds, ignoring", v1, v2, v3, v4, 2u);
}

void __53__WiFiSoftError_tapToRadarWithURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_1D3CCD000, MEMORY[0x1E4F14500], v0, "%s: Error: SoftError <%@> has reached its max count of %ld Tap-to-Radar app launches within the last %ld seconds, ignoring", v1, v2, v3, v4, 2u);
}

void __53__WiFiSoftError_tapToRadarWithURL_completionHandler___block_invoke_130_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D3CCD000, MEMORY[0x1E4F14500], v0, "%s: Error: SoftError <%@> tap-to-radar returned error <%@>", v1, v2, v3, v4, 2u);
}

void __42__WiFiSoftError__cloudAssetsFetchHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_updateHUDWithMessage:.cold.1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[HUD]: ignoring empty HUD message info", v0, 2u);
}

+ (void)_updateHUDWithMessage:.cold.2()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[HUD]: Missing required class symbols for posting banner, early return with no operation", v0, 2u);
}

+ (void)_updateHUDWithMessage:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end