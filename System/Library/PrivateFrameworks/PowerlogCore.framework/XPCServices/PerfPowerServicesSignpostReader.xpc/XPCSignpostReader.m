@interface XPCSignpostReader
- (BOOL)createTagFile:(id)a3 withTagConfig:(id)a4 withFileCount:(int)a5;
- (BOOL)isiPad;
- (BOOL)uploadFile:(id)a3 withTagConfig:(id)a4;
- (NSMutableArray)launchTimeSeries;
- (NSMutableDictionary)activations;
- (NSMutableDictionary)extendedLaunches;
- (NSMutableDictionary)glitches;
- (NSMutableDictionary)hangs;
- (NSMutableDictionary)launches;
- (NSMutableDictionary)numAppSignposts;
- (NSMutableDictionary)processExits;
- (NSMutableDictionary)resumes;
- (NSMutableDictionary)summarizedSignpostDurations;
- (NSMutableDictionary)summarizedSignpostEvents;
- (NSMutableDictionary)summarizedSignpostMetrics;
- (OS_dispatch_queue)sigterm_queue;
- (OS_dispatch_source)sigterm_source;
- (XPCSignpostReader)init;
- (double)secondsFromMachTime:(unint64_t)a3;
- (id)createSignpostFile:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5 withallowlist:(id)a6 withTagConfig:(id)a7;
- (id)getBundleIDFromEvent:(id)a3;
- (id)getBundleIDFromInterval:(id)a3;
- (id)getScrollDirectionForSignpostInterval:(id)a3;
- (id)gzipDeflate:(id)a3;
- (id)mxSignpostIntervalDataForTasking:(id)a3;
- (id)packageMXSignpostData;
- (id)processSignpostMetricsWithStartDate:(id)a3 withEndDate:(id)a4 processMXSignpost:(BOOL)a5;
- (id)signpostIntervalData:(id)a3 forTaskingConfig:(id)a4;
- (id)signpostIntervalData:(id)a3 withBundleID:(id)a4;
- (id)subsystemCategoryAllowlist:(id)a3;
- (id)workflowDataForEventTracker:(id)a3;
- (id)workflowDataForSignpostTracker:(id)a3;
- (id)workflowDataForWREvent:(id)a3;
- (id)workflowDataForWRIncompleteInterval:(id)a3;
- (id)workflowDataForWRInterval:(id)a3;
- (int)writeSignpostFile:(id)a3 withOrder:(int)a4 withData:(id)a5;
- (void)aggregateSignpostData:(id)a3 withReply:(id)a4;
- (void)clearSACaches;
- (void)generateMSSReport:(id)a3 withReply:(id)a4 andOptions:(id)a5;
- (void)generateMSSReportForRAPID:(id)a3 withReply:(id)a4;
- (void)generateMSSReportForTasking:(id)a3 withReply:(id)a4;
- (void)initializeMetrics;
- (void)logAggdTelemetry;
- (void)processSignpostAnimationInterval:(id)a3;
- (void)processSignpostEvent:(id)a3;
- (void)processSignpostInterval:(id)a3;
- (void)readRawSignpostData:(id)a3 withReply:(id)a4;
- (void)removeFile:(id)a3;
- (void)setActivations:(id)a3;
- (void)setExtendedLaunches:(id)a3;
- (void)setGlitches:(id)a3;
- (void)setHangs:(id)a3;
- (void)setLaunchTimeSeries:(id)a3;
- (void)setLaunches:(id)a3;
- (void)setNumAppSignposts:(id)a3;
- (void)setProcessExits:(id)a3;
- (void)setResumes:(id)a3;
- (void)setSigterm_queue:(id)a3;
- (void)setSigterm_source:(id)a3;
- (void)setSummarizedSignpostDurations:(id)a3;
- (void)setSummarizedSignpostEvents:(id)a3;
- (void)setSummarizedSignpostMetrics:(id)a3;
- (void)submitSignpostDataWithConfig:(id)a3 withReply:(id)a4;
- (void)summarizeSignpostMetrics:(id)a3 withReply:(id)a4;
- (void)updateActivationsForProcess:(id)a3 withInterval:(id)a4;
- (void)updateExtendedLaunchesForProcess:(id)a3 withInterval:(id)a4;
- (void)updateGlitchesForProcess:(id)a3 withAnimationInterval:(id)a4;
- (void)updateHangsData:(id)a3 withInterval:(id)a4;
- (void)updateHangsForProcess:(id)a3 withInterval:(id)a4;
- (void)updateLaunchesForProcess:(id)a3 withInterval:(id)a4;
- (void)updateMXSignpostEventsForProcess:(id)a3 withEvent:(id)a4;
- (void)updateMXSignpostsForProcess:(id)a3 withInterval:(id)a4;
- (void)updateProcessExitsForProcess:(id)a3 withEvent:(id)a4;
- (void)updateResumesForProcess:(id)a3 withInterval:(id)a4;
- (void)updateTimeSeriesLaunches:(id)a3 withBundleID:(id)a4;
@end

@implementation XPCSignpostReader

- (XPCSignpostReader)init
{
  v9.receiver = self;
  v9.super_class = (Class)XPCSignpostReader;
  v2 = [(XPCSignpostReader *)&v9 init];
  if (v2)
  {
    signal(15, (void (__cdecl *)(int))1);
    v3 = dispatch_get_global_queue(21, 0);
    [(XPCSignpostReader *)v2 setSigterm_queue:v3];

    v4 = [(XPCSignpostReader *)v2 sigterm_queue];
    dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v4);
    [(XPCSignpostReader *)v2 setSigterm_source:v5];

    v6 = [(XPCSignpostReader *)v2 sigterm_source];
    dispatch_source_set_event_handler(v6, &stru_100014458);

    v7 = [(XPCSignpostReader *)v2 sigterm_source];
    dispatch_activate(v7);
  }
  return v2;
}

- (void)updateProcessExitsForProcess:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PLLogSignpostReader();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000CC64();
  }

  objc_super v9 = [v7 string1Value];
  v10 = [v7 number1Value];
  v11 = [v7 number2Value];

  if (v9 && v10 && v11)
  {
    v29 = v9;
    uint64_t v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isEqualToString:@"YES"]);
    v13 = [(NSMutableDictionary *)self->_processExits objectForKeyedSubscript:v6];

    if (!v13)
    {
      processExits = self->_processExits;
      id v15 = objc_alloc_init((Class)NSMutableDictionary);
      [(NSMutableDictionary *)processExits setObject:v15 forKey:v6];
    }
    v16 = [(NSMutableDictionary *)self->_processExits objectForKeyedSubscript:v6];
    v17 = [v16 objectForKeyedSubscript:v12];

    if (!v17)
    {
      v18 = [(NSMutableDictionary *)self->_processExits objectForKeyedSubscript:v6];
      id v19 = objc_alloc_init((Class)NSMutableDictionary);
      [v18 setObject:v19 forKey:v12];
    }
    v30[0] = v10;
    v30[1] = v11;
    v20 = +[NSArray arrayWithObjects:v30 count:2];
    v21 = [(NSMutableDictionary *)self->_processExits objectForKeyedSubscript:v6];
    v22 = [v21 objectForKeyedSubscript:v12];
    [v22 objectForKeyedSubscript:v20];
    v28 = v10;
    v24 = v23 = (void *)v12;
    v25 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v24 unsignedIntegerValue] + 1);
    v26 = [(NSMutableDictionary *)self->_processExits objectForKeyedSubscript:v6];
    v27 = [v26 objectForKeyedSubscript:v23];
    [v27 setObject:v25 forKeyedSubscript:v20];

    v10 = v28;
    objc_super v9 = v29;
  }
}

- (void)updateLaunchesForProcess:(id)a3 withInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PLLogSignpostReader();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000CCCC(v7);
  }

  objc_super v9 = [v7 number1Value];
  if (v9)
  {
    [v7 durationSeconds];
    unint64_t v11 = (unint64_t)(float)(v10 * 1000.0);
    uint64_t v12 = [(NSMutableDictionary *)self->_launches objectForKeyedSubscript:v6];
    if (v12)
    {
      v13 = (void *)v12;
      v14 = [(NSMutableDictionary *)self->_launches objectForKeyedSubscript:v6];
      id v15 = [v14 objectForKeyedSubscript:v9];

      if (v15)
      {
        v16 = [(NSMutableDictionary *)self->_launches objectForKeyedSubscript:v6];
        v17 = [v16 objectForKeyedSubscript:v9];
        v18 = +[NSNumber numberWithUnsignedLongLong:v11];
        [v17 addObject:v18];

LABEL_11:
        goto LABEL_12;
      }
    }
    id v19 = [(NSMutableDictionary *)self->_launches objectForKeyedSubscript:v6];

    if (!v19)
    {
      v20 = +[NSMutableDictionary dictionary];
      [(NSMutableDictionary *)self->_launches setObject:v20 forKeyedSubscript:v6];
    }
    v21 = [(NSMutableDictionary *)self->_launches objectForKeyedSubscript:v6];
    v22 = [v21 objectForKeyedSubscript:v9];

    if (!v22)
    {
      v16 = +[NSMutableArray array];
      v23 = +[NSNumber numberWithUnsignedLongLong:v11];
      [v16 addObject:v23];

      v17 = [(NSMutableDictionary *)self->_launches objectForKeyedSubscript:v6];
      [v17 setObject:v16 forKeyedSubscript:v9];
      goto LABEL_11;
    }
  }
LABEL_12:
}

- (void)updateExtendedLaunchesForProcess:(id)a3 withInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PLLogSignpostReader();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000CD80(v7);
  }

  objc_super v9 = [v7 string2Value];
  float v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isEqualToString:@"YES"]);
  [v7 durationSeconds];
  unint64_t v12 = (unint64_t)(float)(v11 * 1000.0);
  uint64_t v13 = [(NSMutableDictionary *)self->_extendedLaunches objectForKeyedSubscript:v6];
  if (v13)
  {
    v14 = (void *)v13;
    id v15 = [(NSMutableDictionary *)self->_extendedLaunches objectForKeyedSubscript:v6];
    v16 = [v15 objectForKeyedSubscript:v10];

    if (v16)
    {
      v17 = [(NSMutableDictionary *)self->_extendedLaunches objectForKeyedSubscript:v6];
      v18 = [v17 objectForKeyedSubscript:v10];
      id v19 = +[NSNumber numberWithUnsignedLongLong:v12];
      [v18 addObject:v19];

LABEL_10:
      goto LABEL_11;
    }
  }
  v20 = [(NSMutableDictionary *)self->_extendedLaunches objectForKeyedSubscript:v6];

  if (!v20)
  {
    v21 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)self->_extendedLaunches setObject:v21 forKeyedSubscript:v6];
  }
  v22 = [(NSMutableDictionary *)self->_extendedLaunches objectForKeyedSubscript:v6];
  v23 = [v22 objectForKeyedSubscript:v10];

  if (!v23)
  {
    v17 = +[NSMutableArray array];
    v24 = +[NSNumber numberWithUnsignedLongLong:v12];
    [v17 addObject:v24];

    v18 = [(NSMutableDictionary *)self->_extendedLaunches objectForKeyedSubscript:v6];
    [v18 setObject:v17 forKeyedSubscript:v10];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)updateActivationsForProcess:(id)a3 withInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PLLogSignpostReader();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000CE68(v7);
  }

  objc_super v9 = [v7 number1Value];
  float v10 = [v7 string2Value];
  float v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 isEqualToString:@"YES"]);

  [v7 durationSeconds];
  float v13 = v12;
  v14 = [(NSMutableDictionary *)self->_activations objectForKeyedSubscript:v6];

  if (!v14)
  {
    id v15 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)self->_activations setObject:v15 forKeyedSubscript:v6];
  }
  v16 = [(NSMutableDictionary *)self->_activations objectForKeyedSubscript:v6];
  v17 = [v16 objectForKeyedSubscript:v11];

  if (!v17)
  {
    v18 = +[NSMutableDictionary dictionary];
    id v19 = [(NSMutableDictionary *)self->_activations objectForKeyedSubscript:v6];
    [v19 setObject:v18 forKeyedSubscript:v11];
  }
  v20 = [(NSMutableDictionary *)self->_activations objectForKeyedSubscript:v6];
  v21 = [v20 objectForKeyedSubscript:v11];
  v22 = [v21 objectForKeyedSubscript:v9];

  if (!v22)
  {
    v23 = +[NSMutableArray array];
    v24 = [(NSMutableDictionary *)self->_activations objectForKeyedSubscript:v6];
    v25 = [v24 objectForKeyedSubscript:v11];
    [v25 setObject:v23 forKeyedSubscript:v9];
  }
  v26 = [(NSMutableDictionary *)self->_activations objectForKeyedSubscript:v6];
  v27 = [v26 objectForKeyedSubscript:v11];
  v28 = [v27 objectForKeyedSubscript:v9];
  v29 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)(float)(v13 * 1000.0)];
  [v28 addObject:v29];
}

- (void)updateResumesForProcess:(id)a3 withInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PLLogSignpostReader();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000CF1C(v7, v8);
  }

  [v7 durationSeconds];
  unint64_t v10 = (unint64_t)(float)(v9 * 1000.0);
  float v11 = [(NSMutableDictionary *)self->_resumes objectForKeyedSubscript:v6];

  if (v11)
  {
    id v12 = [(NSMutableDictionary *)self->_resumes objectForKeyedSubscript:v6];
    float v13 = +[NSNumber numberWithUnsignedLongLong:v10];
    [v12 addObject:v13];
  }
  else
  {
    id v12 = objc_alloc_init((Class)NSMutableArray);
    v14 = +[NSNumber numberWithUnsignedLongLong:v10];
    [v12 addObject:v14];

    [(NSMutableDictionary *)self->_resumes setObject:v12 forKey:v6];
  }
}

- (void)updateHangsForProcess:(id)a3 withInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PLLogSignpostReader();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000CFC0(v7, v8);
  }

  [v7 durationSeconds];
  unint64_t v10 = (unint64_t)(float)(v9 * 1000.0);
  float v11 = [(NSMutableDictionary *)self->_hangs objectForKeyedSubscript:v6];

  if (v11)
  {
    id v12 = [(NSMutableDictionary *)self->_hangs objectForKeyedSubscript:v6];
    float v13 = +[NSNumber numberWithUnsignedLongLong:v10];
    [v12 addObject:v13];
  }
  else
  {
    id v12 = objc_alloc_init((Class)NSMutableArray);
    v14 = +[NSNumber numberWithUnsignedLongLong:v10];
    [v12 addObject:v14];

    [(NSMutableDictionary *)self->_hangs setObject:v12 forKey:v6];
  }
}

- (void)updateGlitchesForProcess:(id)a3 withAnimationInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSMutableDictionary *)self->_glitches objectForKeyedSubscript:v6];

  if (!v8)
  {
    glitches = self->_glitches;
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    [(NSMutableDictionary *)glitches setObject:v10 forKey:v6];
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  float v11 = [v7 glitches];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100004FAC;
  v35[3] = &unk_1000144A0;
  v35[4] = &v36;
  [v11 enumerateObjectsUsingBlock:v35];

  [v7 durationSeconds];
  float v13 = v12;
  uint64_t v14 = v37[3];
  id v15 = [(NSMutableDictionary *)self->_glitches objectForKeyedSubscript:v6];
  v16 = [v15 objectForKeyedSubscript:@"glitchDuration"];
  v17 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v14 + [v16 unsignedIntValue]);
  v18 = [(NSMutableDictionary *)self->_glitches objectForKeyedSubscript:v6];
  [v18 setObject:v17 forKeyedSubscript:@"glitchDuration"];

  id v19 = [v7 glitches];
  v20 = (char *)[v19 count];
  v21 = [(NSMutableDictionary *)self->_glitches objectForKeyedSubscript:v6];
  v22 = [v21 objectForKeyedSubscript:@"glitchCount"];
  v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", &v20[[v22 unsignedIntValue]]);
  v24 = [(NSMutableDictionary *)self->_glitches objectForKeyedSubscript:v6];
  [v24 setObject:v23 forKeyedSubscript:@"glitchCount"];

  v25 = [(NSMutableDictionary *)self->_glitches objectForKeyedSubscript:v6];
  v26 = [v25 objectForKeyedSubscript:@"scrollDuration"];
  v27 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)(float)(v13 * 1000.0) + [v26 unsignedIntValue]);
  v28 = [(NSMutableDictionary *)self->_glitches objectForKeyedSubscript:v6];
  [v28 setObject:v27 forKeyedSubscript:@"scrollDuration"];

  v29 = [v7 beginEvent];
  v30 = [v29 name];
  LODWORD(v27) = [v30 isEqualToString:@"Scroll_Dragging"];

  if (v27)
  {
    v31 = [(NSMutableDictionary *)self->_glitches objectForKeyedSubscript:v6];
    v32 = [v31 objectForKeyedSubscript:@"scrollCount"];
    v33 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v32 unsignedIntValue] + 1);
    v34 = [(NSMutableDictionary *)self->_glitches objectForKeyedSubscript:v6];
    [v34 setObject:v33 forKeyedSubscript:@"scrollCount"];
  }
  _Block_object_dispose(&v36, 8);
}

- (void)updateMXSignpostsForProcess:(id)a3 withInterval:(id)a4
{
  id v41 = a3;
  id v6 = a4;
  uint64_t v7 = qword_100019640++;
  if (v7 <= 49999)
  {
    v8 = [(NSMutableDictionary *)self->_summarizedSignpostDurations objectForKeyedSubscript:v41];

    if (!v8)
    {
      summarizedSignpostDurations = self->_summarizedSignpostDurations;
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
      [(NSMutableDictionary *)summarizedSignpostDurations setObject:v10 forKey:v41];

      summarizedSignpostMetrics = self->_summarizedSignpostMetrics;
      id v12 = objc_alloc_init((Class)NSMutableDictionary);
      [(NSMutableDictionary *)summarizedSignpostMetrics setObject:v12 forKey:v41];

      numAppSignposts = self->_numAppSignposts;
      uint64_t v14 = objc_alloc_init(SignpostCounter);
      [(NSMutableDictionary *)numAppSignposts setObject:v14 forKey:v41];
    }
    id v15 = [(NSMutableDictionary *)self->_numAppSignposts objectForKeyedSubscript:v41];
    uint64_t v16 = v15[1];
    v15[1] = v16 + 1;
    if (v16 > 999) {
      goto LABEL_26;
    }
    v17 = [v6 category];
    if (v17)
    {
      v18 = [v6 category];
    }
    else
    {
      v18 = &stru_1000149C0;
    }
    id v19 = [v6 name];
    if (v19)
    {
      v20 = [v6 name];
      v21 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v18, v20, 0);
    }
    else
    {
      v21 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v18, &stru_1000149C0, 0);
    }

    if (v17) {
    v22 = [(NSMutableDictionary *)self->_summarizedSignpostDurations objectForKeyedSubscript:v41];
    }
    id v23 = [v22 objectForKeyedSubscript:v21];

    if (!v23)
    {
      id v23 = objc_alloc_init((Class)NSMutableArray);
      v24 = [(NSMutableDictionary *)self->_summarizedSignpostDurations objectForKeyedSubscript:v41];
      [v24 setObject:v23 forKey:v21];
    }
    [v6 durationSeconds];
    v26 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)(float)(v25 * 1000.0)];
    [v23 addObject:v26];

    v27 = [v6 beginEvent];
    uint64_t v28 = [v27 metrics];
    if (v28)
    {
      v29 = (void *)v28;
      v30 = [v6 endEvent];
      v31 = [v30 metrics];

      if (!v31)
      {
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
      v32 = [(NSMutableDictionary *)self->_summarizedSignpostMetrics objectForKeyedSubscript:v41];
      v27 = [v32 objectForKeyedSubscript:v21];

      [v15 updateMxSignpostOverlapStatistics:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v33 = v6;
      }
      else {
        v33 = 0;
      }
      if (v27)
      {
        id v34 = v33;
        v35 = [v6 beginEvent];
        uint64_t v36 = [v6 endEvent];
        [v27 updateSummary:v35 endSnapshot:v36 animationInterval:v34];
      }
      else
      {
        v37 = self->_summarizedSignpostMetrics;
        id v38 = v33;
        v35 = [(NSMutableDictionary *)v37 objectForKeyedSubscript:v41];
        uint64_t v39 = [SignpostIntervalMetrics alloc];
        uint64_t v36 = [v6 beginEvent];
        id v34 = [v6 endEvent];
        v40 = [(SignpostIntervalMetrics *)v39 initWithBeginSnapshot:v36 endSnapshot:v34 animationInterval:v38];

        [v35 setObject:v40 forKey:v21];
      }
    }
    goto LABEL_25;
  }
LABEL_27:
}

- (void)updateMXSignpostEventsForProcess:(id)a3 withEvent:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  uint64_t v7 = qword_100019640++;
  if (v7 <= 49999)
  {
    v8 = [(NSMutableDictionary *)self->_summarizedSignpostEvents objectForKeyedSubscript:v25];

    if (!v8)
    {
      summarizedSignpostEvents = self->_summarizedSignpostEvents;
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
      [(NSMutableDictionary *)summarizedSignpostEvents setObject:v10 forKey:v25];

      numAppSignposts = self->_numAppSignposts;
      id v12 = objc_alloc_init(SignpostCounter);
      [(NSMutableDictionary *)numAppSignposts setObject:v12 forKey:v25];
    }
    float v13 = [(NSMutableDictionary *)self->_numAppSignposts objectForKeyedSubscript:v25];
    uint64_t v14 = v13[1];
    v13[1] = v14 + 1;
    if (v14 <= 999)
    {
      id v15 = [v6 category];
      if (v15)
      {
        uint64_t v16 = [v6 category];
      }
      else
      {
        uint64_t v16 = &stru_1000149C0;
      }
      v17 = [v6 name];
      if (v17)
      {
        v18 = [v6 name];
        id v19 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v16, v18, 0);
      }
      else
      {
        id v19 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v16, &stru_1000149C0, 0);
      }

      if (v15) {
      v20 = [(NSMutableDictionary *)self->_summarizedSignpostEvents objectForKeyedSubscript:v25];
      }
      v21 = [v20 objectForKeyedSubscript:v19];

      v22 = [(NSMutableDictionary *)self->_summarizedSignpostEvents objectForKeyedSubscript:v25];
      id v23 = v22;
      if (v21)
      {
        v24 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v21 integerValue] + 1);
        [v23 setObject:v24 forKey:v19];
      }
      else
      {
        [v22 setObject:&off_100015C00 forKey:v19];
      }
    }
  }
}

- (id)signpostIntervalData:(id)a3 withBundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  [v7 setObject:v6 forKeyedSubscript:@"bundleID"];

  v8 = [v5 number1Value];
  [v7 setObject:v8 forKeyedSubscript:@"IsForeground"];

  float v9 = [v5 beginDate];
  [v7 setObject:v9 forKeyedSubscript:@"beginDate"];

  [v5 durationSeconds];
  float v11 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)(float)(v10 * 1000.0)];
  [v7 setObject:v11 forKeyedSubscript:@"duration"];

  id v12 = PLLogSignpostReader();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10000D064(v5);
  }

  return v7;
}

- (void)updateTimeSeriesLaunches:(id)a3 withBundleID:(id)a4
{
  id v5 = [(XPCSignpostReader *)self signpostIntervalData:a3 withBundleID:a4];
  [(NSMutableArray *)self->_launchTimeSeries addObject:v5];
}

- (void)processSignpostEvent:(id)a3
{
  id v10 = a3;
  v4 = [v10 name];
  unsigned int v5 = [v4 isEqualToString:@"ProcessExited"];

  if (v5)
  {
    id v6 = [v10 attributes];
    uint64_t v7 = [v6 objectForKey:@"BundleIdOverride"];

    if (v7) {
      [(XPCSignpostReader *)self updateProcessExitsForProcess:v7 withEvent:v10];
    }
  }
  else
  {
    v8 = [v10 subsystem];
    unsigned int v9 = [v8 isEqualToString:@"com.apple.metrickit.log"];

    if (!v9) {
      goto LABEL_8;
    }
    uint64_t v7 = [(XPCSignpostReader *)self getBundleIDFromEvent:v10];
    if (v7) {
      [(XPCSignpostReader *)self updateMXSignpostEventsForProcess:v7 withEvent:v10];
    }
  }

LABEL_8:
  _objc_release_x2();
}

- (void)processSignpostInterval:(id)a3
{
  id v27 = a3;
  v4 = -[XPCSignpostReader getBundleIDFromInterval:](self, "getBundleIDFromInterval:");
  if (!v4) {
    goto LABEL_20;
  }
  unsigned int v5 = [v27 name];
  unsigned int v6 = [v5 isEqualToString:@"ApplicationFirstFramePresentation"];

  if (v6) {
    [(XPCSignpostReader *)self updateLaunchesForProcess:v4 withInterval:v27];
  }
  uint64_t v7 = [v27 name];
  unsigned int v8 = [v7 isEqualToString:@"ApplicationLaunchExtendedResponsive"];

  if (v8) {
    [(XPCSignpostReader *)self updateTimeSeriesLaunches:v27 withBundleID:v4];
  }
  unsigned int v9 = [v27 beginEvent];
  uint64_t v10 = [v9 string2Value];
  if (v10)
  {
    float v11 = (void *)v10;
    id v12 = [v27 endEvent];
    float v13 = [v12 number1Value];
    if ([v13 intValue] == 1)
    {
      uint64_t v14 = [v27 beginEvent];
      id v15 = [v14 name];
      unsigned int v16 = [v15 isEqualToString:@"AppLaunch"];

      if (v16)
      {
        [(XPCSignpostReader *)self updateExtendedLaunchesForProcess:v4 withInterval:v27];
        goto LABEL_20;
      }
      goto LABEL_12;
    }
  }
LABEL_12:
  v17 = [v27 beginEvent];
  v18 = [v17 name];
  unsigned int v19 = [v18 isEqualToString:@"AppResume"];

  if (v19)
  {
    [(XPCSignpostReader *)self updateResumesForProcess:v4 withInterval:v27];
  }
  else
  {
    v20 = [v27 name];
    unsigned int v21 = [v20 isEqualToString:@"ApplicationActivationFirstFramePresentation"];

    if (v21)
    {
      [(XPCSignpostReader *)self updateActivationsForProcess:v4 withInterval:v27];
    }
    else
    {
      v22 = [v27 beginEvent];
      id v23 = [v22 name];
      unsigned int v24 = [v23 isEqualToString:@"HangInterval"];

      if (v24)
      {
        [(XPCSignpostReader *)self updateHangsForProcess:v4 withInterval:v27];
      }
      else
      {
        id v25 = [v27 subsystem];
        unsigned int v26 = [v25 isEqualToString:@"com.apple.metrickit.log"];

        if (v26) {
          [(XPCSignpostReader *)self updateMXSignpostsForProcess:v4 withInterval:v27];
        }
      }
    }
  }
LABEL_20:
}

- (void)processSignpostAnimationInterval:(id)a3
{
  id v12 = a3;
  v4 = -[XPCSignpostReader getBundleIDFromInterval:](self, "getBundleIDFromInterval:");
  if (v4)
  {
    unsigned int v5 = [v12 subsystem];
    unsigned int v6 = [v5 isEqualToString:@"com.apple.metrickit.log"];

    if (v6)
    {
      [(XPCSignpostReader *)self updateMXSignpostsForProcess:v4 withInterval:v12];
      goto LABEL_8;
    }
    uint64_t v7 = [v12 beginEvent];
    unsigned int v8 = [v7 name];
    if ([v8 isEqualToString:@"Scroll_Dragging"])
    {
    }
    else
    {
      unsigned int v9 = [v12 beginEvent];
      uint64_t v10 = [v9 name];
      unsigned int v11 = [v10 isEqualToString:@"Scroll_Deceleration"];

      if (!v11) {
        goto LABEL_8;
      }
    }
    [(XPCSignpostReader *)self updateGlitchesForProcess:v4 withAnimationInterval:v12];
  }
LABEL_8:
}

- (void)summarizeSignpostMetrics:(id)a3 withReply:(id)a4
{
  unsigned int v6 = (void (**)(id, void *))a4;
  id v7 = a3;
  unsigned int v8 = PLLogSignpostReader();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "spun up xpc svc", v17, 2u);
  }

  unsigned int v9 = [v7 objectForKeyedSubscript:@"process_mxsignpost"];
  id v10 = [v9 BOOLValue];

  unsigned int v11 = [v7 objectForKey:@"end_date"];
  id v12 = [v7 objectForKey:@"start_date"];

  if (v11
    && v12
    && ([v12 timeIntervalSince1970], double v14 = v13, objc_msgSend(v11, "timeIntervalSince1970"), v14 <= v15))
  {
    unsigned int v16 = [(XPCSignpostReader *)self processSignpostMetricsWithStartDate:v12 withEndDate:v11 processMXSignpost:v10];
    [v16 setObject:v11 forKey:@"EndDate"];
    v6[2](v6, v16);
  }
  else
  {
    v6[2](v6, &__NSDictionary0__struct);
  }
}

- (id)processSignpostMetricsWithStartDate:(id)a3 withEndDate:(id)a4 processMXSignpost:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  [(XPCSignpostReader *)self initializeMetrics];
  id v10 = objc_alloc_init((Class)SignpostSupportObjectExtractor);
  id v11 = objc_alloc_init((Class)SignpostSupportSubsystemCategoryAllowlist);
  [v11 addSubsystem:@"com.apple.FrontBoard" category:@"AppLaunch"];
  [v11 addSubsystem:@"com.apple.UIKit" category:@"AppLifecycle"];
  [v11 addSubsystem:@"com.apple.hangtracer" category:@"always_on_hang"];
  [v11 addSubsystem:@"com.apple.UIKit" category:@"ScrollView"];
  [v11 addSubsystem:@"com.apple.runningboard" category:@"sp_telemetry"];
  [v11 addSubsystem:@"com.apple.app_launch_measurement" category:@"ApplicationLaunch"];
  if (v5) {
    [v11 addSubsystem:@"com.apple.metrickit.log" category:0];
  }
  [v10 setSubsystemCategoryFilter:v11];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100006228;
  v21[3] = &unk_1000144C8;
  v21[4] = self;
  [v10 setEmitEventProcessingBlock:v21];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000624C;
  v20[3] = &unk_1000144F0;
  v20[4] = self;
  [v10 setIntervalCompletionProcessingBlock:v20];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100006270;
  v19[3] = &unk_100014518;
  v19[4] = self;
  [v10 setAnimationIntervalCompletionProcessingBlock:v19];
  id v18 = 0;
  unsigned __int8 v12 = [v10 processLogArchiveWithPath:0 startDate:v9 endDate:v8 errorOut:&v18];

  id v13 = v18;
  if ((v12 & 1) == 0)
  {
    double v14 = PLLogSignpostReader();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000D104(v13);
    }
  }
  double v15 = +[NSMutableDictionary dictionary];
  [v15 setObject:self->_processExits forKey:@"processExits"];
  [v15 setObject:self->_launches forKey:@"launchDurations"];
  [v15 setObject:self->_extendedLaunches forKey:@"extendedLaunchDurations"];
  [v15 setObject:self->_resumes forKey:@"resumeDurations"];
  [v15 setObject:self->_glitches forKey:@"scrollGlitches"];
  [v15 setObject:self->_activations forKey:@"activationDurations"];
  [v15 setObject:self->_summarizedSignpostEvents forKey:@"signpostEvents"];
  unsigned int v16 = [(XPCSignpostReader *)self packageMXSignpostData];
  [v15 setObject:v16 forKey:@"signpostIntervals"];

  [v15 setValue:&off_100015C18 forKey:@"hangtracer_enabled"];
  [v15 setValue:self->_hangs forKey:@"hangDurations"];
  [v15 setValue:self->_launchTimeSeries forKey:@"launchesTimeSeries"];
  [(XPCSignpostReader *)self logAggdTelemetry];

  return v15;
}

- (id)packageMXSignpostData
{
  v3 = +[NSMutableDictionary dictionary];
  summarizedSignpostDurations = self->_summarizedSignpostDurations;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000634C;
  v9[3] = &unk_100014568;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [(NSMutableDictionary *)summarizedSignpostDurations enumerateKeysAndObjectsUsingBlock:v9];
  unsigned int v6 = v10;
  id v7 = v5;

  return v7;
}

- (void)logAggdTelemetry
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_numAppSignposts;
  id v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    int v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v3);
        }
        -[NSMutableDictionary objectForKey:](self->_numAppSignposts, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        id v11 = (uint64_t *)objc_claimAutoreleasedReturnValue();
        if (v11[1] > 1000) {
          ++v8;
        }
        v7 += v11[2];
        v6 += v11[3];
      }
      id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  ADClientSetValueForScalarKey();
  ADClientSetValueForScalarKey();
  ADClientSetValueForScalarKey();
  if (qword_100019640 >= 50001) {
    ADClientSetValueForScalarKey();
  }
}

- (void)initializeMetrics
{
  v3 = +[NSMutableDictionary dictionary];
  launches = self->_launches;
  self->_launches = v3;

  id v5 = +[NSMutableDictionary dictionary];
  extendedLaunches = self->_extendedLaunches;
  self->_extendedLaunches = v5;

  uint64_t v7 = +[NSMutableDictionary dictionary];
  resumes = self->_resumes;
  self->_resumes = v7;

  uint64_t v9 = +[NSMutableDictionary dictionary];
  hangs = self->_hangs;
  self->_hangs = v9;

  id v11 = +[NSMutableDictionary dictionary];
  glitches = self->_glitches;
  self->_glitches = v11;

  long long v13 = +[NSMutableDictionary dictionary];
  processExits = self->_processExits;
  self->_processExits = v13;

  long long v15 = +[NSMutableDictionary dictionary];
  activations = self->_activations;
  self->_activations = v15;

  v17 = +[NSMutableDictionary dictionary];
  summarizedSignpostDurations = self->_summarizedSignpostDurations;
  self->_summarizedSignpostDurations = v17;

  unsigned int v19 = +[NSMutableDictionary dictionary];
  summarizedSignpostMetrics = self->_summarizedSignpostMetrics;
  self->_summarizedSignpostMetrics = v19;

  unsigned int v21 = +[NSMutableDictionary dictionary];
  summarizedSignpostEvents = self->_summarizedSignpostEvents;
  self->_summarizedSignpostEvents = v21;

  id v23 = +[NSMutableDictionary dictionary];
  numAppSignposts = self->_numAppSignposts;
  self->_numAppSignposts = v23;

  self->_launchTimeSeries = +[NSMutableArray array];
  _objc_release_x1();
}

- (id)getBundleIDFromInterval:(id)a3
{
  id v3 = a3;
  id v4 = [v3 beginEvent];
  id v5 = [v4 name];
  unsigned int v6 = [v5 isEqualToString:@"HangInterval"];

  if (!v6) {
    goto LABEL_3;
  }
  uint64_t v7 = [v3 beginEvent];
  int v8 = [v7 attributes];
  uint64_t v9 = [v8 objectForKey:@"BundleIdOverride"];

  if (!v9)
  {
LABEL_3:
    id v10 = [v3 endEvent];
    id v11 = [v10 processImagePath];
    long long v12 = [v11 stringByDeletingLastPathComponent];

    long long v13 = +[NSBundle bundleWithPath:v12];
    uint64_t v9 = [v13 bundleIdentifier];
  }
  return v9;
}

- (id)getBundleIDFromEvent:(id)a3
{
  id v3 = [a3 processImagePath];
  id v4 = [v3 stringByDeletingLastPathComponent];

  id v5 = +[NSBundle bundleWithPath:v4];
  unsigned int v6 = [v5 bundleIdentifier];

  return v6;
}

- (id)subsystemCategoryAllowlist:(id)a3
{
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006A60;
  v6[3] = &unk_100014590;
  id v4 = objc_alloc_init((Class)SignpostSupportSubsystemCategoryAllowlist);
  id v7 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

- (id)getScrollDirectionForSignpostInterval:(id)a3
{
  id v3 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_100006F8C;
  uint64_t v28 = sub_100006F9C;
  id v29 = 0;
  uint64_t v18 = 0;
  unsigned int v19 = &v18;
  uint64_t v20 = 0x3032000000;
  unsigned int v21 = sub_100006F8C;
  v22 = sub_100006F9C;
  id v23 = 0;
  id v4 = [v3 name];
  unsigned __int8 v5 = [v4 isEqualToString:@"Scroll_Zooming"];

  if (v5)
  {
    unsigned int v6 = @"Diagonal";
  }
  else
  {
    unsigned int v6 = [v3 endEvent];

    if (v6)
    {
      id v7 = [v3 endEvent];
      int v8 = [v7 metadataSegments];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100006FA4;
      v17[3] = &unk_1000145E0;
      v17[4] = &v24;
      v17[5] = &v18;
      [v8 enumerateObjectsUsingBlock:v17];

      [(id)v25[5] doubleValue];
      if (v9 != 0.0 || ([(id)v19[5] doubleValue], v10 == 0.0))
      {
        [(id)v25[5] doubleValue];
        if (v11 == 0.0 || ([(id)v19[5] doubleValue], v12 != 0.0)) {
          unsigned int v6 = @"Diagonal";
        }
        else {
          unsigned int v6 = @"Horizontal";
        }
      }
      else
      {
        unsigned int v6 = @"Vertical";
      }
      long long v13 = PLLogSignpostReader();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = v25[5];
        uint64_t v16 = v19[5];
        *(_DWORD *)buf = 138412802;
        v31 = v6;
        __int16 v32 = 2112;
        uint64_t v33 = v15;
        __int16 v34 = 2112;
        uint64_t v35 = v16;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Scroll direction %@ (dx=%@, dy=%@)", buf, 0x20u);
      }
    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v6;
}

- (void)aggregateSignpostData:(id)a3 withReply:(id)a4
{
  unsigned int v6 = (void (**)(id, id))a4;
  id v7 = a3;
  int v8 = PLLogSignpostReader();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Signpost data aggregation start", buf, 2u);
  }

  double v9 = [v7 objectForKeyedSubscript:@"taskingAllowlist"];
  double v10 = [v7 objectForKeyedSubscript:@"taskingStartDate"];
  double v11 = [v7 objectForKeyedSubscript:@"taskingEndDate"];

  double v12 = PLLogSignpostReader();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10000D39C();
  }

  long long v13 = PLLogSignpostReader();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10000D334();
  }

  long long v14 = PLLogSignpostReader();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10000D2CC();
  }

  id v15 = objc_alloc_init((Class)NSMutableDictionary);
  if (v11
    && v10
    && ([v10 timeIntervalSince1970], double v17 = v16, objc_msgSend(v11, "timeIntervalSince1970"), v17 <= v18))
  {
    id v19 = objc_alloc_init((Class)SignpostSupportObjectExtractor);
    uint64_t v20 = [(XPCSignpostReader *)self subsystemCategoryAllowlist:v9];
    [v19 setSubsystemCategoryFilter:v20];

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000074CC;
    v27[3] = &unk_100014608;
    id v21 = v15;
    id v28 = v21;
    id v29 = self;
    [v19 setIntervalCompletionProcessingBlock:v27];
    id v26 = 0;
    unsigned __int8 v22 = [v19 processLogArchiveWithPath:0 startDate:v10 endDate:v11 errorOut:&v26];
    id v23 = v26;
    if ((v22 & 1) == 0)
    {
      uint64_t v24 = PLLogSignpostReader();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10000D21C(v23);
      }
    }
    id v25 = PLLogSignpostReader();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v21;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Signpost data aggregation end: reply = %@", buf, 0xCu);
    }

    v6[2](v6, v21);
  }
  else
  {
    v6[2](v6, v15);
  }
}

- (void)submitSignpostDataWithConfig:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  unsigned int v6 = (void (**)(id, void))a4;
  id v7 = PLLogSignpostReader();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Signpost data submission start", buf, 2u);
  }

  int v8 = +[NSMutableDictionary dictionary];
  double v9 = [v5 objectForKeyedSubscript:@"taskingAllowlist"];
  double v10 = [v5 objectForKeyedSubscript:@"taskingStartDate"];
  double v11 = [v5 objectForKeyedSubscript:@"taskingEndDate"];
  double v12 = [v5 objectForKeyedSubscript:@"taskingTagConfig"];
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v13 = v12;
    long long v14 = [v13 objectForKeyedSubscript:@"TagUUID"];
  }
  else
  {
    long long v14 = 0;
    id v13 = 0;
  }
  id v15 = PLLogSignpostReader();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10000D6D0();
  }

  double v16 = PLLogSignpostReader();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10000D39C();
  }

  double v17 = PLLogSignpostReader();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10000D334();
  }

  double v18 = PLLogSignpostReader();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_10000D2CC();
  }

  id v19 = PLLogSignpostReader();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_10000D668();
  }

  id v20 = [objc_alloc((Class)NSUUID) initWithUUIDString:v14];
  if (v20)
  {
    v48 = v13;
    BOOL v21 = 1;
    if (v10 && v11 && v9 && v14)
    {
      v43 = v9;
      v44 = v10;
      v45 = +[NSString stringWithFormat:@"%@Powerlog_%@/", @"/tmp/powerlog/cloud/", v14];
      unsigned __int8 v22 = [v5 objectForKeyedSubscript:@"taskingSubmitSP"];
      unsigned int v23 = [v22 BOOLValue];

      v42 = v8;
      if (v23)
      {
        uint64_t v24 = [v48 objectForKeyedSubscript:@"Date"];
        id v25 = v11;
        if (v24)
        {
          id v26 = [v48 objectForKeyedSubscript:@"Date"];
          id v27 = +[NSString stringWithFormat:@"Signpost_%@", v26];
        }
        else
        {
          id v27 = +[NSString stringWithFormat:@"Signpost_%@", v14];
        }

        id v29 = v45;
        v30 = +[NSString stringWithFormat:@"%@%@/", v45, v27];
        id v31 = [(XPCSignpostReader *)self createSignpostFile:v30 withStartDate:v44 withEndDate:v25 withallowlist:v9 withTagConfig:v12];
        BOOL v21 = v31 != 0;
      }
      else
      {
        id v25 = v11;
        id v29 = v45;
      }
      __int16 v32 = +[NSFileManager defaultManager];
      uint64_t v33 = [v32 contentsOfDirectoryAtPath:v29 error:0];

      double v10 = v44;
      double v11 = v25;
      int v8 = v42;
      if (v33 && [v33 count])
      {
        __int16 v34 = +[NSURL fileURLWithPath:v45];
        uint64_t v35 = +[DEArchiver archiveDirectoryAt:v34 deleteOriginal:1];

        v47 = v35;
        uint64_t v36 = [v35 path];
        [v42 setObject:v36 forKeyedSubscript:@"tarballPath"];

        v37 = PLLogSignpostReader();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          id v38 = [v47 path];
          unsigned int v39 = [v33 count];
          *(_DWORD *)buf = 138412546;
          v50 = v38;
          __int16 v51 = 1024;
          unsigned int v52 = v39;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "File to upload generated at %@ with %d files included.", buf, 0x12u);
        }
        double v10 = v44;
      }

      double v9 = v43;
    }
    v40 = +[NSNumber numberWithBool:v21];
    [v8 setObject:v40 forKey:@"success"];

    id v41 = PLLogSignpostReader();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v8;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Signpost data submission end: reply = %@", buf, 0xCu);
    }

    id v28 = v8;
    id v13 = v48;
  }
  else
  {
    id v28 = 0;
  }
  ((void (**)(id, void *))v6)[2](v6, v28);
}

- (id)createSignpostFile:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5 withallowlist:(id)a6 withTagConfig:(id)a7
{
  id v11 = a3;
  id v58 = a4;
  id v59 = a5;
  id v60 = a6;
  id v61 = a7;
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x2020000000;
  int v95 = 0;
  double v12 = &ADClientSetValueForScalarKey_ptr;
  id v13 = +[NSFileManager defaultManager];
  LOBYTE(a6) = [v13 fileExistsAtPath:v11];

  if ((a6 & 1) == 0)
  {
    double v16 = +[NSFileManager defaultManager];
    id v91 = 0;
    unsigned int v17 = [v16 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v91];
    v55 = v91;

    if (v17)
    {
      id v57 = objc_alloc_init((Class)SignpostSupportObjectExtractor);
      v56 = [(XPCSignpostReader *)self subsystemCategoryAllowlist:v60];
      double v18 = objc_opt_new();
      v86[0] = _NSConcreteStackBlock;
      v86[1] = 3221225472;
      v86[2] = sub_100008E98;
      v86[3] = &unk_100014630;
      v86[4] = self;
      id v87 = v61;
      id v64 = v18;
      id v88 = v64;
      v90 = &v92;
      id v52 = v11;
      id v89 = v52;
      v53 = objc_retainBlock(v86);
      [v57 setIntervalCompletionProcessingBlock:v53];
      v54 = +[WRWorkflow allWorkflows];
      if ([v54 count])
      {
        id v63 = objc_alloc_init((Class)SignpostSupportSubsystemCategoryAllowlist);
        v62 = +[NSMutableArray array];
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v19 = v54;
        id v20 = [v19 countByEnumeratingWithState:&v82 objects:v102 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v83;
          do
          {
            unsigned __int8 v22 = 0;
            do
            {
              if (*(void *)v83 != v21) {
                objc_enumerationMutation(v19);
              }
              unsigned int v23 = *(void **)(*((void *)&v82 + 1) + 8 * (void)v22);
              uint64_t v24 = PLLogSignpostReader();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                id v25 = [v23 name];
                sub_10000D870(v25, v100, &v101, v24);
              }

              unsigned __int8 v26 = [v23 contextualTelemetryEnabled];
              id v27 = PLLogSignpostReader();
              BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
              if (v26)
              {
                if (v28)
                {
                  id v32 = v11;
                  uint64_t v33 = [v23 name];
                  __int16 v34 = [v23 allowListForAllSignposts];
                  *(_DWORD *)buf = 138412546;
                  v97 = v33;
                  __int16 v98 = 2112;
                  v99 = v34;
                  _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "[WR] Appending allowlist for workflow '%@': %@", buf, 0x16u);

                  id v11 = v32;
                }

                id v29 = [v23 allowListForAllSignposts];
                [v63 addAllowlist:v29];

                v80[0] = _NSConcreteStackBlock;
                v80[1] = 3221225472;
                v80[2] = sub_100008F18;
                v80[3] = &unk_100014658;
                v80[4] = v23;
                v80[5] = self;
                id v81 = v64;
                v30 = objc_retainBlock(v80);
                id v31 = [objc_alloc((Class)WRWorkflowEventTracker) initForReadbackWithWorkflow:v23 eventCompletionCallback:v30];
                [v62 addObject:v31];
              }
              else
              {
                if (v28)
                {
                  uint64_t v35 = [v23 name];
                  unsigned int v36 = [v23 contextualTelemetryEnabled];
                  *(_DWORD *)buf = 138412546;
                  v97 = v35;
                  __int16 v98 = 1024;
                  LODWORD(v99) = v36;
                  _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "[WR] workflow %@ does not have contextualTelemetryEnabled (=%d), skipping to next workflow", buf, 0x12u);
                }
              }
              unsigned __int8 v22 = (char *)v22 + 1;
            }
            while (v20 != v22);
            id v20 = [v19 countByEnumeratingWithState:&v82 objects:v102 count:16];
          }
          while (v20);
        }

        v37 = PLLogSignpostReader();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          sub_10000D808();
        }

        [v56 addAllowlist:v63];
        v74[0] = _NSConcreteStackBlock;
        v74[1] = 3221225472;
        v74[2] = sub_1000094B0;
        v74[3] = &unk_100014680;
        id v38 = v62;
        id v75 = v38;
        v79 = &v92;
        id v76 = v64;
        v77 = self;
        id v78 = v52;
        unsigned int v39 = objc_retainBlock(v74);
        [v57 setEmitEventProcessingBlock:v39];
        [v57 setBeginEventProcessingBlock:v39];
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 3221225472;
        v69[2] = sub_100009748;
        v69[3] = &unk_1000146A8;
        id v40 = v63;
        id v70 = v40;
        double v12 = v39;
        id v72 = v12;
        id v71 = v56;
        v73 = v53;
        [v57 setIntervalCompletionProcessingBlock:v69];
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472;
        v67[2] = sub_100009834;
        v67[3] = &unk_1000146D0;
        id v41 = v38;
        id v68 = v41;
        [v57 setDeviceRebootProcessingBlock:v67];
      }
      v42 = PLLogSignpostReader();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        sub_10000D7A0();
      }

      [v57 setSubsystemCategoryFilter:v56];
      id v66 = 0;
      unsigned __int8 v43 = [v57 processLogArchiveWithPath:0 startDate:v58 endDate:v59 errorOut:&v66];
      id v44 = v66;
      if ((v43 & 1) == 0)
      {
        v45 = PLLogSignpostReader();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          if (v44)
          {
            double v12 = [v44 localizedDescription];
            __int16 v51 = (const char *)[v12 UTF8String];
          }
          else
          {
            __int16 v51 = "Unknown error";
          }
          *(_DWORD *)buf = 136315138;
          v97 = v51;
          _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Unable to serialize signpost: %s", buf, 0xCu);
          if (v44) {
        }
          }
      }
      unsigned int v46 = [(XPCSignpostReader *)self writeSignpostFile:v52 withOrder:*((unsigned int *)v93 + 6) withData:v64];
      *((_DWORD *)v93 + 6) = v46;
    }
    if (*((_DWORD *)v93 + 6))
    {
      v47 = +[NSString stringWithFormat:@"%@%@", v11, @"tag.json"];
      if ([(XPCSignpostReader *)self createTagFile:v47 withTagConfig:v61 withFileCount:*((unsigned int *)v93 + 6)])
      {
        v48 = +[NSURL fileURLWithPath:v11];
        id v15 = +[DEArchiver archiveDirectoryAt:v48 deleteOriginal:1];

        v49 = PLLogSignpostReader();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v97 = v15;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Signpost tarball generated at %@", buf, 0xCu);
        }

        goto LABEL_40;
      }
    }
    id v15 = 0;
LABEL_40:
    long long v14 = v55;
    goto LABEL_41;
  }
  long long v14 = PLLogSignpostReader();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_10000D738();
  }
  id v15 = 0;
LABEL_41:

  _Block_object_dispose(&v92, 8);
  return v15;
}

- (id)gzipDeflate:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    memset(&v12.total_out, 0, 72);
    id v4 = v3;
    v12.avail_in = objc_msgSend(v4, "length", objc_msgSend(v4, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
    id v5 = 0;
    if (!deflateInit2_(&v12, -1, 8, 31, 8, 0, "1.2.12", 112))
    {
      unsigned int v6 = +[NSMutableData dataWithLength:0x4000];
      do
      {
        uLong total_out = v12.total_out;
        if (total_out >= (unint64_t)[v6 length]) {
          [v6 increaseLengthBy:0x4000];
        }
        id v8 = v6;
        double v9 = (char *)[v8 mutableBytes];
        v12.next_out = (Bytef *)&v9[v12.total_out];
        unsigned int v10 = [v8 length];
        v12.avail_out = v10 - LODWORD(v12.total_out);
        deflate(&v12, 4);
      }
      while (!v12.avail_out);
      deflateEnd(&v12);
      [v8 setLength:v12.total_out];
      id v5 = +[NSData dataWithData:v8];
    }
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

- (int)writeSignpostFile:(id)a3 withOrder:(int)a4 withData:(id)a5
{
  LODWORD(v6) = a4;
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = PLLogSignpostReader();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v29 = [v9 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "writing to signpost file for %lu records.", buf, 0xCu);
  }

  id v11 = +[NSFileManager defaultManager];
  if (![v11 fileExistsAtPath:v8]) {
    goto LABEL_13;
  }
  id v12 = [v9 count];

  if (v12)
  {
    id v11 = +[NSJSONSerialization dataWithJSONObject:v9 options:0 error:0];
    id v13 = PLLogSignpostReader();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [v11 length];
      *(_DWORD *)buf = 134217984;
      id v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "\t Original JSON size = %lu", buf, 0xCu);
    }

    id v15 = [(XPCSignpostReader *)self gzipDeflate:v11];
    double v16 = PLLogSignpostReader();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [v15 length];
      *(_DWORD *)buf = 134217984;
      id v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "\t Compressed size = %lu", buf, 0xCu);
    }

    double v18 = &ADClientSetValueForScalarKey_ptr;
    uint64_t v6 = (v6 + 1);
    id v19 = +[NSString stringWithFormat:@"%@signpost.%d.json.gz", v8, v6];
    id v27 = 0;
    unsigned __int8 v20 = [v15 writeToFile:v19 options:1 error:&v27];
    id v21 = v27;

    if ((v20 & 1) == 0)
    {
      unsigned __int8 v22 = PLLogSignpostReader();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v24 = +[NSString stringWithFormat:@"%@%d.json.gz", v8, v6];
        id v25 = [v24 UTF8String];
        if (v21)
        {
          double v18 = [v21 localizedDescription];
          unsigned __int8 v26 = (const char *)[v18 UTF8String];
        }
        else
        {
          unsigned __int8 v26 = "Unknown error";
        }
        *(_DWORD *)buf = 136315394;
        id v29 = v25;
        __int16 v30 = 2080;
        id v31 = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Unable to write to %s: %s", buf, 0x16u);
        if (v21) {
      }
        }
    }
    [v9 removeAllObjects];

LABEL_13:
  }

  return v6;
}

- (id)workflowDataForEventTracker:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setObject:@"WorkflowResponsiveness" forKeyedSubscript:@"CollectionType"];
  id v5 = [v3 workflow];
  uint64_t v6 = [v5 name];
  [v4 setObject:v6 forKeyedSubscript:@"WorkflowName"];

  id v7 = [v3 eventStart];
  id v8 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v7 machContTimeNs]);
  [v4 setObject:v8 forKeyedSubscript:@"OverallStartTime"];

  id v9 = [v3 eventEnd];
  unsigned int v10 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 machContTimeNs]);
  [v4 setObject:v10 forKeyedSubscript:@"OverallEndTime"];

  id v11 = [v3 error];

  if (v11)
  {
    id v12 = [v3 error];
    if (v12)
    {
      id v13 = [v3 error];
      id v14 = [v13 domain];
      if ([v14 isEqualToString:WRErrorDomain])
      {
        id v15 = [v3 error];
        double v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v15 code]);
        [v4 setObject:v16 forKeyedSubscript:@"ErrorCode"];
      }
      else
      {
        [v4 setObject:&off_100015C30 forKeyedSubscript:@"ErrorCode"];
      }
    }
    else
    {
      [v4 setObject:&off_100015C30 forKeyedSubscript:@"ErrorCode"];
    }
  }
  return v4;
}

- (id)workflowDataForSignpostTracker:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 signpost];
  uint64_t v6 = [v5 name];
  [v4 setObject:v6 forKeyedSubscript:@"Name"];

  id v7 = [v3 signpost];
  id v8 = [v7 subsystem];
  [v4 setObject:v8 forKeyedSubscript:@"Subsystem"];

  id v9 = [v3 signpost];
  unsigned int v10 = [v9 category];
  [v4 setObject:v10 forKeyedSubscript:@"Category"];

  id v11 = [v3 individuationIdentifier];
  id v12 = [v11 length];

  if (v12)
  {
    id v13 = [v3 individuationIdentifier];
    [v4 setObject:v13 forKeyedSubscript:@"IndividuationIdentifier"];
  }
  id v24 = v3;
  id v14 = [v3 environment];
  id v15 = v14;
  if (v14)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v21 = +[NSString stringWithFormat:@"@env_%@", v20];
          unsigned __int8 v22 = [v15 objectForKey:v20];
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
            [v4 setObject:v22 forKeyedSubscript:v21];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v17);
    }
  }

  return v4;
}

- (id)workflowDataForWREvent:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 machContTimeNs];

  uint64_t v6 = +[NSNumber numberWithUnsignedLongLong:v5];
  [v4 setObject:v6 forKeyedSubscript:@"startMachContinuousTime"];

  return v4;
}

- (id)workflowDataForWRInterval:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 start];
  uint64_t v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v5 machContTimeNs]);
  [v4 setObject:v6 forKeyedSubscript:@"startMachContinuousTime"];

  id v7 = [v3 end];

  id v8 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v7 machContTimeNs]);
  [v4 setObject:v8 forKeyedSubscript:@"endMachContinuousTime"];

  return v4;
}

- (id)workflowDataForWRIncompleteInterval:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 machContTimeNs];

  uint64_t v6 = +[NSNumber numberWithUnsignedLongLong:v5];
  [v4 setObject:v6 forKeyedSubscript:@"startMachContinuousTime"];

  [v4 setObject:&off_100015C00 forKeyedSubscript:@"endMachContinuousTime"];
  return v4;
}

- (id)signpostIntervalData:(id)a3 forTaskingConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  [v8 setObject:@"Powerlog" forKeyedSubscript:@"CollectionType"];
  id v9 = [v6 category];
  [v8 setObject:v9 forKeyedSubscript:@"Category"];

  unsigned int v10 = [v6 name];
  [v8 setObject:v10 forKeyedSubscript:@"Name"];

  id v11 = [v6 subsystem];
  [v8 setObject:v11 forKeyedSubscript:@"Subsystem"];

  [v6 timebaseRatio];
  id v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v8 setObject:v12 forKeyedSubscript:@"TimebaseRatio"];

  id v13 = [v6 string1Name];
  [v8 setObject:v13 forKeyedSubscript:@"String1Name"];

  id v14 = [v6 string1Value];
  [v8 setObject:v14 forKeyedSubscript:@"String1Value"];

  id v15 = [v6 string2Name];
  [v8 setObject:v15 forKeyedSubscript:@"String2Name"];

  id v16 = [v6 string2Value];
  [v8 setObject:v16 forKeyedSubscript:@"String2Value"];

  id v17 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 startMachContinuousTime]);
  [v8 setObject:v17 forKeyedSubscript:@"startMachContinuousTime"];

  uint64_t v18 = [v6 beginWallTimeStringWithTimeZoneName:0];
  [v8 setObject:v18 forKeyedSubscript:@"beginWallTime"];

  id v19 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 endMachContinuousTime]);
  [v8 setObject:v19 forKeyedSubscript:@"endMachContinuousTime"];

  uint64_t v20 = [v6 endWallTimeStringWithTimeZoneName:0];
  [v8 setObject:v20 forKeyedSubscript:@"endWallTime"];

  id v21 = [v6 beginEvent];

  if (v21)
  {
    unsigned __int8 v22 = [v6 beginEvent];
    unsigned int v23 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v22 processID]);
    [v8 setObject:v23 forKeyedSubscript:@"BeginPid"];

    id v24 = [v6 beginEvent];
    long long v25 = [v24 processName];
    [v8 setObject:v25 forKeyedSubscript:@"BeginProcessName"];
  }
  long long v26 = [v6 endEvent];

  if (v26)
  {
    long long v27 = [v6 endEvent];
    long long v28 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v27 processID]);
    [v8 setObject:v28 forKeyedSubscript:@"EndPid"];

    id v29 = [v6 endEvent];
    __int16 v30 = [v29 processName];
    [v8 setObject:v30 forKeyedSubscript:@"EndProcessName"];
  }
  uint64_t v31 = [v6 number1Name];
  if (v31)
  {
    id v32 = (void *)v31;
    uint64_t v33 = [v6 number1Value];

    if (v33)
    {
      __int16 v34 = [v6 number1Name];
      [v8 setObject:v34 forKeyedSubscript:@"Number1Name"];

      uint64_t v35 = [v6 number1Value];
      [v8 setObject:v35 forKeyedSubscript:@"Number1Value"];
    }
  }
  uint64_t v36 = [v6 number2Name];
  if (v36)
  {
    v37 = (void *)v36;
    id v38 = [v6 number2Value];

    if (v38)
    {
      unsigned int v39 = [v6 number2Name];
      [v8 setObject:v39 forKeyedSubscript:@"Number2Name"];

      id v40 = [v6 number2Value];
      [v8 setObject:v40 forKeyedSubscript:@"Number2Value"];
    }
  }
  id v41 = [v7 objectForKeyedSubscript:@"Internal"];
  unsigned int v42 = [v41 BOOLValue];

  if (v42)
  {
    unsigned __int8 v43 = [v6 subsystem];
    unsigned int v44 = [v43 isEqualToString:@"com.apple.metrickit.log"];

    if (v44)
    {
      v45 = [(XPCSignpostReader *)self mxSignpostIntervalDataForTasking:v6];
      [v8 addEntriesFromDictionary:v45];
    }
  }
  unsigned int v46 = PLLogSignpostReader();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
    sub_10000D954(v8, v46);
  }

  return v8;
}

- (id)mxSignpostIntervalDataForTasking:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 beginEvent];
  id v6 = [v5 metrics];

  if (v6)
  {
    id v7 = [v3 beginEvent];
    id v8 = [v7 metrics];
    id v9 = [v8 cpuTimeNsec];
    [v9 doubleValue];
    id v11 = +[NSNumber numberWithDouble:v10 / 1000000000.0];
    [v4 setObject:v11 forKeyedSubscript:@"BeginCPUTime"];

    id v12 = [v3 beginEvent];
    id v13 = [v12 metrics];
    id v14 = [v13 dirtyMemoryLifetimePeakKB];
    [v4 setObject:v14 forKeyedSubscript:@"BeginPeakMemory"];

    id v15 = [v3 beginEvent];
    id v16 = [v15 metrics];
    id v17 = [v16 dirtyMemoryKB];
    [v4 setObject:v17 forKeyedSubscript:@"BeginDirtyMemory"];

    uint64_t v18 = [v3 beginEvent];
    id v19 = [v18 metrics];
    uint64_t v20 = [v19 storageDirtiedKB];
    [v4 setObject:v20 forKeyedSubscript:@"BeginDiskLogicalWrites"];
  }
  id v21 = [v3 endEvent];
  unsigned __int8 v22 = [v21 metrics];

  if (v22)
  {
    unsigned int v23 = [v3 endEvent];
    id v24 = [v23 metrics];
    long long v25 = [v24 cpuTimeNsec];
    [v25 doubleValue];
    long long v27 = +[NSNumber numberWithDouble:v26 / 1000000000.0];
    [v4 setObject:v27 forKeyedSubscript:@"EndCPUTime"];

    long long v28 = [v3 endEvent];
    id v29 = [v28 metrics];
    __int16 v30 = [v29 dirtyMemoryLifetimePeakKB];
    [v4 setObject:v30 forKeyedSubscript:@"EndPeakMemory"];

    uint64_t v31 = [v3 endEvent];
    id v32 = [v31 metrics];
    uint64_t v33 = [v32 dirtyMemoryKB];
    [v4 setObject:v33 forKeyedSubscript:@"EndDirtyMemory"];

    __int16 v34 = [v3 endEvent];
    uint64_t v35 = [v34 metrics];
    uint64_t v36 = [v35 storageDirtiedKB];
    [v4 setObject:v36 forKeyedSubscript:@"EndDiskLogicalWrites"];
  }
  return v4;
}

- (BOOL)createTagFile:(id)a3 withTagConfig:(id)a4 withFileCount:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 objectForKeyedSubscript:@"TagUUID"];

  if (!v5 || !v9)
  {
    double v10 = PLLogSignpostReader();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10000DB1C(v10);
    }
    goto LABEL_10;
  }
  double v10 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v8];
  id v11 = +[NSNumber numberWithInt:v5];
  [v10 setObject:v11 forKeyedSubscript:@"FileCount"];

  if (!+[NSJSONSerialization isValidJSONObject:v10])
  {
    id v19 = 0;
    id v15 = +[NSJSONSerialization dataWithJSONObject:v10 options:0 error:&v19];
    id v16 = v19;
    id v17 = PLLogSignpostReader();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10000DA7C(v16, (uint64_t)v15, v17);
    }

LABEL_10:
    unsigned __int8 v14 = 0;
    goto LABEL_11;
  }
  id v12 = +[NSJSONSerialization dataWithJSONObject:v10 options:0 error:0];
  id v13 = [objc_alloc((Class)NSString) initWithData:v12 encoding:4];
  unsigned __int8 v14 = [v13 writeToFile:v7 atomically:0 encoding:4 error:0];

LABEL_11:
  return v14;
}

- (void)removeFile:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  id v9 = 0;
  unsigned __int8 v5 = [v4 removeItemAtPath:v3 error:&v9];
  id v6 = v9;

  id v7 = PLLogSignpostReader();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10000DB60();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_10000DBC8((uint64_t)v3, v6, v8);
  }
}

- (BOOL)uploadFile:(id)a3 withTagConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  BOOL v8 = 1;
  char v50 = 1;
  if (v6)
  {
    id v9 = PLLogSignpostReader();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Upload file to iCloud: %@", buf, 0xCu);
    }

    id v10 = [objc_alloc((Class)CKContainerID) initWithContainerIdentifier:@"com.apple.perfpowerservices.tasking" environment:1];
    id v11 = [objc_alloc((Class)CKContainer) initWithContainerID:v10];
    id v41 = [v11 publicCloudDatabase];
    id v12 = [objc_alloc((Class)CKRecord) initWithRecordType:@"Attachment"];
    id v13 = [v6 path];
    id v14 = [objc_alloc((Class)CKAsset) initWithFileURL:v6];
    if (v14)
    {
      [v12 setObject:v14 forKeyedSubscript:@"asset"];
      id v15 = [v6 lastPathComponent];
      [v12 setObject:v15 forKeyedSubscript:@"fileName"];

      id v16 = [v7 objectForKeyedSubscript:@"Internal"];
      if ([v16 isEqualToString:@"true"]) {
        id v17 = &off_100015C48;
      }
      else {
        id v17 = &off_100015C00;
      }
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, @"internal", self);

      uint64_t v18 = [v7 objectForKeyedSubscript:@"Beta"];
      if ([v18 isEqualToString:@"true"]) {
        id v19 = &off_100015C48;
      }
      else {
        id v19 = &off_100015C00;
      }
      [v12 setObject:v19 forKeyedSubscript:@"seed"];

      [v12 setObject:@"iOS" forKeyedSubscript:@"machineType"];
      uint64_t v20 = [v12 objectForKeyedSubscript:@"machineType"];
      unsigned int v21 = [v20 isEqualToString:@"iOS"];

      if (v21 && [v40 isiPad]) {
        [v12 setObject:@"iPadOS" forKeyedSubscript:@"machineType"];
      }
      unsigned __int8 v22 = [v7 objectForKeyedSubscript:@"Model"];

      if (v22)
      {
        unsigned int v23 = [v7 objectForKeyedSubscript:@"Model"];
        [v12 setObject:v23 forKeyedSubscript:@"deviceModel"];
      }
      id v24 = [v7 objectForKeyedSubscript:@"TagUUID"];

      if (v24)
      {
        long long v25 = [v7 objectForKeyedSubscript:@"TagUUID"];
        [v12 setObject:v25 forKeyedSubscript:@"UUID"];
      }
      double v26 = [v7 objectForKeyedSubscript:@"Reason"];

      if (v26)
      {
        long long v27 = [v7 objectForKeyedSubscript:@"Reason"];
        [v12 setObject:v27 forKeyedSubscript:@"reason"];
      }
      long long v28 = [v7 objectForKeyedSubscript:@"Build"];

      if (v28)
      {
        id v29 = [v7 objectForKeyedSubscript:@"Build"];
        [v12 setObject:v29 forKeyedSubscript:@"build"];
      }
      __int16 v30 = [v7 objectForKeyedSubscript:@"Date"];

      if (v30)
      {
        uint64_t v31 = [v7 objectForKeyedSubscript:@"Date"];
        [v12 setObject:v31 forKeyedSubscript:@"date"];
      }
      id v32 = objc_alloc_init((Class)NSMutableArray);
      [v32 addObject:v12];
      id v33 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v32 recordIDsToDelete:0];
      __int16 v34 = [v33 configuration];
      [v34 setAllowsCellularAccess:0];

      uint64_t v35 = [v33 configuration];
      [v35 setAutomaticallyRetryNetworkFailures:1];

      uint64_t v36 = [v33 configuration];
      [v36 setDiscretionaryNetworkBehavior:0];

      v37 = [v33 configuration];
      [v37 setPreferAnonymousRequests:1];

      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_10000B6AC;
      v42[3] = &unk_1000146F8;
      unsigned int v46 = &v47;
      id v43 = v6;
      unsigned int v44 = v40;
      id v45 = v13;
      [v33 setPerRecordCompletionBlock:v42];
      [v41 addOperation:v33];
    }
    else
    {
      id v38 = PLLogSignpostReader();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_10000DC80();
      }

      [(XPCSignpostReader *)self removeFile:v13];
      *((unsigned char *)v48 + 24) = 0;
    }

    BOOL v8 = *((unsigned char *)v48 + 24) != 0;
  }
  _Block_object_dispose(&v47, 8);

  return v8;
}

- (BOOL)isiPad
{
  if (qword_100019650 != -1) {
    dispatch_once(&qword_100019650, &stru_100014718);
  }
  return byte_100019648;
}

- (void)readRawSignpostData:(id)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v7 = a3;
  BOOL v8 = [v7 objectForKeyedSubscript:@"start_date"];
  id v9 = [v7 objectForKeyedSubscript:@"end_date"];

  id v10 = PLLogSignpostReader();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    unsigned __int8 v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[RAPID] readRawSignpostData: %@ %@", buf, 0x16u);
  }

  id v11 = objc_alloc_init((Class)SignpostSupportObjectExtractor);
  id v12 = objc_alloc_init((Class)SignpostSupportSubsystemCategoryAllowlist);
  [v12 addSubsystem:@"com.apple.hangtracer" category:@"always_on_hang"];
  [v11 setSubsystemCategoryFilter:v12];
  id v13 = objc_opt_new();
  uint64_t v14 = objc_opt_new();
  [v13 setObject:v14 forKeyedSubscript:@"hangDurations"];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000BB64;
  v19[3] = &unk_100014608;
  v19[4] = self;
  id v15 = v13;
  id v20 = v15;
  [v11 setIntervalCompletionProcessingBlock:v19];
  id v18 = 0;
  LOBYTE(v14) = [v11 processLogArchiveWithPath:0 startDate:v8 endDate:v9 errorOut:&v18];
  id v16 = v18;
  if ((v14 & 1) == 0)
  {
    id v17 = PLLogSignpostReader();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10000DDB8(v16);
    }
  }
  v6[2](v6, v15);
}

- (void)updateHangsData:(id)a3 withInterval:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = [(XPCSignpostReader *)self getBundleIDFromInterval:v6];
  if (v7)
  {
    uint64_t v8 = [v6 beginDate];
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = [v6 string2Value];

      if (v10)
      {
        [v6 durationSeconds];
        unint64_t v12 = (unint64_t)(float)(v11 * 1000.0);
        id v13 = objc_opt_new();
        uint64_t v14 = [v6 beginDate];
        [v13 setObject:v14 forKeyedSubscript:@"startDate"];

        [v13 setObject:v7 forKeyedSubscript:@"bundleID"];
        id v15 = +[NSNumber numberWithUnsignedLongLong:v12];
        [v13 setObject:v15 forKeyedSubscript:@"duration"];

        id v16 = [v6 string2Value];
        [v13 setObject:v16 forKeyedSubscript:@"type"];

        [v17 addObject:v13];
      }
    }
  }
}

- (void)generateMSSReportForRAPID:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PLLogSignpostReader();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[RAPID] generateMSSReport: %@", (uint8_t *)&v9, 0xCu);
  }

  [(XPCSignpostReader *)self generateMSSReport:v6 withReply:v7 andOptions:0];
}

- (void)generateMSSReportForTasking:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PLLogSignpostReader();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Tasking] generateMSSReport: %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = objc_alloc_init((Class)SASamplePrintOptions);
  [v9 setDisplayOnBehalfOfInCallTrees:1];
  [v9 setDisplayTimestampsInCallTrees:1];
  [v9 setIncludeUserIdleAndBatteryStateInStacks:1];
  [v9 setSystemstatsFormat:1];
  [v9 setTaskAggregation:3];
  [(XPCSignpostReader *)self generateMSSReport:v6 withReply:v7 andOptions:v9];
}

- (void)generateMSSReport:(id)a3 withReply:(id)a4 andOptions:(id)a5
{
  id v8 = a3;
  uint64_t v49 = (void (**)(id, void *))a4;
  id v50 = a5;
  +[SABinary enableImmediateCleanupOfCSSymbolOwners];
  id v9 = [v8 objectForKeyedSubscript:@"start_date"];
  [v9 timeIntervalSince1970];
  double v11 = v10;

  unint64_t v12 = [v8 objectForKeyedSubscript:@"end_date"];
  [v12 timeIntervalSince1970];

  id v13 = [v8 objectForKeyedSubscript:@"mss_filepath"];
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "time", (unint64_t)v11);
  uint64_t v56 = 0;
  id v57 = &v56;
  uint64_t v58 = 0x2020000000;
  int v59 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  int v55 = 0;
  id v14 = [objc_alloc((Class)SASampleStore) initForLiveSampling];
  objc_msgSend(v14, "setDataGatheringOptions:", (unint64_t)objc_msgSend(v14, "dataGatheringOptions") & 0xFFFFFFFFFFFFFF8FLL);
  [v14 setEvent:@"powerstats"];
  uint64_t v15 = mach_absolute_time();
  _os_feature_enabled_impl();
  id v16 = v14;
  systemstats_get_microstackshots();
  id v17 = PLLogSignpostReader();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = *((_DWORD *)v57 + 6);
    int v19 = *((_DWORD *)v53 + 6);
    id v20 = [v16 numSamples];
    *(_DWORD *)buf = 67109632;
    int v63 = v18;
    __int16 v64 = 1024;
    int v65 = v19;
    __int16 v66 = 2048;
    id v67 = v20;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "MSS TotalCount = %u, AddedSampleCount = %u, FinalSampleCount = %lu", buf, 0x18u);
  }

  [(XPCSignpostReader *)self secondsFromMachTime:mach_absolute_time()];
  double v22 = v21;
  [(XPCSignpostReader *)self secondsFromMachTime:(unint64_t)(double)v15];
  double v24 = v23;
  uint64_t v25 = mach_absolute_time();
  [v16 postprocess];
  [(XPCSignpostReader *)self secondsFromMachTime:mach_absolute_time()];
  double v27 = v26;
  [(XPCSignpostReader *)self secondsFromMachTime:(unint64_t)(double)v25];
  double v29 = v28;
  uint64_t v30 = mach_absolute_time();
  id v31 = [objc_alloc((Class)SASamplePrinter) initWithSampleStore:v16];
  id v32 = v31;
  if (v50)
  {
    objc_msgSend(v31, "setOptions:");
  }
  else
  {
    id v33 = [v31 options];
    [v33 setDisplayTimestampsInCallTrees:1];

    __int16 v34 = [v32 options];
    [v34 setSystemstatsFormat:1];

    uint64_t v35 = [v32 options];
    [v35 setOmitAbsoluteWallTimes:1];
  }
  id v36 = v13;
  v37 = fopen((const char *)[v36 UTF8String], "w");
  if (v37)
  {
    [v32 printToStream:v37];
    fclose(v37);
    [(XPCSignpostReader *)self secondsFromMachTime:mach_absolute_time()];
    double v39 = v38;
    [(XPCSignpostReader *)self secondsFromMachTime:(unint64_t)(double)v30];
    double v41 = v40;
    v60[0] = @"sample_count";
    unsigned int v42 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v53 + 6)];
    v61[0] = v42;
    v61[1] = &__kCFBooleanTrue;
    v60[1] = @"success";
    v60[2] = @"time_processing";
    id v43 = +[NSNumber numberWithDouble:v27 - v29];
    v61[2] = v43;
    v60[3] = @"time_printing";
    unsigned int v44 = +[NSNumber numberWithDouble:v39 - v41];
    v61[3] = v44;
    v60[4] = @"time_reading";
    id v45 = +[NSNumber numberWithDouble:v22 - v24];
    v61[4] = v45;
    unsigned int v46 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:5];
    v49[2](v49, v46);

    [(XPCSignpostReader *)self clearSACaches];
  }
  else
  {
    uint64_t v47 = PLLogSignpostReader();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_10000DE68();
    }

    v49[2](v49, &off_100015C90);
    fclose(0);
    [(XPCSignpostReader *)self clearSACaches];
  }

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
}

- (void)clearSACaches
{
  v2 = PLLogSignpostReader();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Clearing SampleAnalysis caches...", buf, 2u);
  }

  +[SABinary clearCaches];
  +[SASharedCache clearCaches];
  id v3 = PLLogSignpostReader();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cleared SampleAnalysis caches!", v4, 2u);
  }
}

- (double)secondsFromMachTime:(unint64_t)a3
{
  if (qword_100019658 != -1) {
    dispatch_once(&qword_100019658, &stru_100014760);
  }
  return *(double *)&qword_100019660 * (double)a3 / 1000000000.0;
}

- (NSMutableDictionary)launches
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLaunches:(id)a3
{
}

- (NSMutableDictionary)extendedLaunches
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExtendedLaunches:(id)a3
{
}

- (NSMutableDictionary)resumes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResumes:(id)a3
{
}

- (NSMutableDictionary)hangs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHangs:(id)a3
{
}

- (NSMutableDictionary)glitches
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setGlitches:(id)a3
{
}

- (NSMutableDictionary)processExits
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProcessExits:(id)a3
{
}

- (NSMutableDictionary)activations
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setActivations:(id)a3
{
}

- (NSMutableDictionary)summarizedSignpostDurations
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSummarizedSignpostDurations:(id)a3
{
}

- (NSMutableDictionary)summarizedSignpostMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSummarizedSignpostMetrics:(id)a3
{
}

- (NSMutableDictionary)summarizedSignpostEvents
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSummarizedSignpostEvents:(id)a3
{
}

- (NSMutableDictionary)numAppSignposts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setNumAppSignposts:(id)a3
{
}

- (NSMutableArray)launchTimeSeries
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLaunchTimeSeries:(id)a3
{
}

- (OS_dispatch_queue)sigterm_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSigterm_queue:(id)a3
{
}

- (OS_dispatch_source)sigterm_source
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSigterm_source:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigterm_source, 0);
  objc_storeStrong((id *)&self->_sigterm_queue, 0);
  objc_storeStrong((id *)&self->_launchTimeSeries, 0);
  objc_storeStrong((id *)&self->_numAppSignposts, 0);
  objc_storeStrong((id *)&self->_summarizedSignpostEvents, 0);
  objc_storeStrong((id *)&self->_summarizedSignpostMetrics, 0);
  objc_storeStrong((id *)&self->_summarizedSignpostDurations, 0);
  objc_storeStrong((id *)&self->_activations, 0);
  objc_storeStrong((id *)&self->_processExits, 0);
  objc_storeStrong((id *)&self->_glitches, 0);
  objc_storeStrong((id *)&self->_hangs, 0);
  objc_storeStrong((id *)&self->_resumes, 0);
  objc_storeStrong((id *)&self->_extendedLaunches, 0);
  objc_storeStrong((id *)&self->_launches, 0);
}

@end