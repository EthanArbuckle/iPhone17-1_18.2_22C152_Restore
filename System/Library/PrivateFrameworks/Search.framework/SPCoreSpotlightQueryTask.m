@interface SPCoreSpotlightQueryTask
- (BOOL)canceled;
- (BOOL)done;
- (BOOL)live;
- (BOOL)priorityIndexEnabled;
- (BOOL)priorityIndexFinishedInTime;
- (NSArray)suggestionResults;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timeoutTimer;
- (PRSRankingConfiguration)rankingInfo;
- (SDSearchQuery)resultPipe;
- (SPCoreSpotlightDatastore)store;
- (SPCoreSpotlightQueryTask)initWithStore:(id)a3 resultPipe:(id)a4;
- (SPCoreSpotlightTask)job;
- (double)startTime;
- (unint64_t)type;
- (void)beginQuery:(id)a3;
- (void)cancel;
- (void)finish;
- (void)finishWithSections:(id)a3 suggestionResults:(id)a4;
- (void)progressWithSections:(id)a3 suggestionResults:(id)a4;
- (void)reset;
- (void)sendCompletions:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setDone:(BOOL)a3;
- (void)setJob:(id)a3;
- (void)setLive:(BOOL)a3;
- (void)setPriorityIndexEnabled:(BOOL)a3;
- (void)setPriorityIndexFinishedInTime:(BOOL)a3;
- (void)setRankingInfo:(id)a3;
- (void)setResultPipe:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setSuggestionResults:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation SPCoreSpotlightQueryTask

- (SPCoreSpotlightQueryTask)initWithStore:(id)a3 resultPipe:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SPCoreSpotlightQueryTask;
  v9 = [(SPCoreSpotlightQueryTask *)&v24 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeWeak((id *)&v10->_resultPipe, v8);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("Query Queue", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    v10->_type = 0;
    uint64_t v14 = objc_opt_new();
    rankingInfo = v10->_rankingInfo;
    v10->_rankingInfo = (PRSRankingConfiguration *)v14;

    id v16 = objc_alloc((Class)SITracingObjcLifetimeSpan);
    uint64_t v17 = si_tracing_current_span();
    v22[0] = *(_OWORD *)v17;
    v22[1] = *(_OWORD *)(v17 + 16);
    uint64_t v23 = *(void *)(v17 + 32);
    v19 = (SITracingObjcLifetimeSpan *)[v18 init:v22 kind:111 what:"SPCoreSpotlightQueryTask"];
    lifetimeSpan = v10->_lifetimeSpan;
    v10->_lifetimeSpan = v19;
  }
  return v10;
}

- (void)reset
{
  id v3 = objc_alloc((Class)SITracingObjcLifetimeSpan);
  uint64_t v4 = si_tracing_current_span();
  v14[0] = *(_OWORD *)v4;
  v14[1] = *(_OWORD *)(v4 + 16);
  uint64_t v15 = *(void *)(v4 + 32);
  v6 = (SITracingObjcLifetimeSpan *)[v5 init:v14 kind:111 what:"reused SPCoreSpotlightQueryTask"];
  lifetimeSpan = self->_lifetimeSpan;
  self->_lifetimeSpan = v6;

  [(SPCoreSpotlightQueryTask *)self setJob:0];
  [(SPCoreSpotlightQueryTask *)self setDone:0];
  [(SPCoreSpotlightQueryTask *)self setCanceled:0];
  if (self->_priorityIndexEnabled)
  {
    id v8 = [(SPCoreSpotlightQueryTask *)self timeoutTimer];
    v9 = v8;
    if (v8)
    {
      dispatch_source_cancel(v8);
      [(SPCoreSpotlightQueryTask *)self setTimeoutTimer:0];
    }
  }
  feedback = self->_feedback;
  self->_feedback = 0;

  atomic_fetch_add(&dword_1000A8EE0, 0xFFFFFFFF);
  v11 = SPLogForSPLogCategoryTelemetry();
  dispatch_queue_t v12 = (char *)[(SPCoreSpotlightTask *)self->_job queryID];
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = (os_signpost_id_t)v12;
    if (os_signpost_enabled(v11))
    {
      LOWORD(v14[0]) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, v13, "coreSpotlightReset", " enableTelemetry=YES ", (uint8_t *)v14, 2u);
    }
  }
}

- (void)cancel
{
  uint64_t v3 = si_tracing_current_span();
  long long v8 = *(_OWORD *)v3;
  long long v9 = *(_OWORD *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v6 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v4;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v6;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "-[SPCoreSpotlightQueryTask cancel]";
  si_tracing_log_span_begin();
  id v7 = [objc_alloc((Class)SFEndLocalSearchFeedback) initWithStartSearch:self->_feedback];
  md_tracing_dispatch_async_propagating();

  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v8;
  *(_OWORD *)(v3 + 16) = v9;
  *(void *)(v3 + 32) = v10;
}

- (void)beginQuery:(id)a3
{
  id v4 = a3;
  id v5 = [v4 queryContext];
  id v6 = [v5 queryKind];
  id v7 = [v4 connection];
  id v8 = [v7 bundleID];
  if (qword_1000A9020 != -1) {
    dispatch_once(&qword_1000A9020, &stru_100093820);
  }
  if (byte_1000A9019) {
    goto LABEL_4;
  }
  if (!byte_1000A9018)
  {

    goto LABEL_13;
  }
  if (([v8 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
    || ([v8 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
  {
LABEL_4:

    goto LABEL_5;
  }
  unsigned __int8 v9 = [v8 hasPrefix:@"com.apple.ondeviceeval"];

  if (v6 != (id)12 && (v9 & 1) == 0)
  {
LABEL_13:
    uint64_t v10 = si_tracing_current_span();
    long long v35 = *(_OWORD *)v10;
    long long v36 = *(_OWORD *)(v10 + 16);
    uint64_t v37 = *(void *)(v10 + 32);
    uint64_t v11 = *(void *)v10;
    uint64_t spanid = si_tracing_calc_next_spanid();
    uint64_t v13 = *(void *)(v10 + 8);
    *(void *)uint64_t v10 = v11;
    *(void *)(v10 + 8) = spanid;
    *(void *)(v10 + 16) = v13;
    *(unsigned char *)(v10 + 28) = 102;
    *(void *)(v10 + 32) = "-[SPCoreSpotlightQueryTask beginQuery:]";
    si_tracing_log_span_begin();
    uint64_t v14 = [v4 queryContext];
    uint64_t v15 = [v14 searchEntities];
    id v16 = [v15 firstObject];

    if (v16)
    {
      uint64_t v17 = [v16 currentSearchString];
      id v18 = [v16 command];
      if (v18)
      {
        v19 = [v16 command];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v21 = [v16 command];
          id v22 = [v21 copy];

          [v22 setSearchString:0];
          [v22 setTokenString:0];
          id v32 = objc_alloc((Class)SFStartLocalSearchFeedback);
          id v31 = [v14 whyQuery];
          id v23 = [v4 queryIdent];
          objc_super v24 = [v4 connection];
          v25 = [v24 bundleID];
          id v26 = [v32 initWithEntityQueryCommand:v22 triggerEvent:v31 searchType:3 indexType:1 queryId:v23 originatingApp:v25];

LABEL_24:
          id v33 = v26;
          id v34 = v4;
          md_tracing_dispatch_async_propagating();

          si_tracing_log_span_end();
          *(_OWORD *)uint64_t v10 = v35;
          *(_OWORD *)(v10 + 16) = v36;
          *(void *)(v10 + 32) = v37;
          goto LABEL_5;
        }
      }
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_resultPipe);
      v28 = [WeakRetained queryContext];
      uint64_t v17 = [v28 searchString];
    }
    id v29 = objc_alloc((Class)SFStartLocalSearchFeedback);
    if ([v16 isContactEntitySearch])
    {
      v30 = 0;
    }
    else if ([v16 isPhotosEntitySearch])
    {
      v30 = 0;
    }
    else
    {
      v30 = v17;
    }
    id v26 = objc_msgSend(v29, "initWithInput:triggerEvent:indexType:queryId:", v30, objc_msgSend(v14, "whyQuery"), 1, objc_msgSend(v4, "queryIdent"));
    goto LABEL_24;
  }
LABEL_5:
}

- (void)sendCompletions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = si_tracing_current_span();
  long long v6 = *(_OWORD *)(v5 + 16);
  long long v19 = *(_OWORD *)v5;
  long long v20 = v6;
  uint64_t v21 = *(void *)(v5 + 32);
  uint64_t v7 = *(void *)v5;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v9 = *(void *)(v5 + 8);
  *(void *)uint64_t v5 = v7;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = v9;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "-[SPCoreSpotlightQueryTask sendCompletions:]";
  si_tracing_log_span_begin();
  if (self->_canceled)
  {
    uint64_t v10 = SPLogForSPLogCategoryDefault();
    os_log_type_t v11 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v10, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Not sending completions --- canceled.", buf, 2u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_resultPipe);
    uint64_t v13 = +[SDController workQueue];
    uint64_t v10 = WeakRetained;
    id v17 = v4;
    tracing_dispatch_async();

    uint64_t v14 = SPLogForSPLogCategoryTelemetry();
    uint64_t v15 = (char *)[(SPCoreSpotlightTask *)self->_job queryID];
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, (os_signpost_id_t)v15, "coreSpotlightComplete", " enableTelemetry=YES ", buf, 2u);
    }
  }
  si_tracing_log_span_end();
  long long v16 = v20;
  *(_OWORD *)uint64_t v5 = v19;
  *(_OWORD *)(v5 + 16) = v16;
  *(void *)(v5 + 32) = v21;
}

- (void)progressWithSections:(id)a3 suggestionResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = si_tracing_current_span();
  long long v9 = *(_OWORD *)(v8 + 16);
  long long v27 = *(_OWORD *)v8;
  long long v28 = v9;
  uint64_t v29 = *(void *)(v8 + 32);
  uint64_t v10 = *(void *)v8;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v12 = *(void *)(v8 + 8);
  *(void *)uint64_t v8 = v10;
  *(void *)(v8 + 8) = spanid;
  *(void *)(v8 + 16) = v12;
  *(unsigned char *)(v8 + 28) = 102;
  *(void *)(v8 + 32) = "-[SPCoreSpotlightQueryTask progressWithSections:suggestionResults:]";
  si_tracing_log_span_begin();
  uint64_t v13 = SPLogForSPLogCategoryDefault();
  os_log_type_t v14 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v13, v14))
  {
    id v15 = (id)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    id v31 = v15;
    __int16 v32 = 1024;
    qos_class_t v33 = qos_class_self();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "QOS %@ progressWithSections: %d", buf, 0x12u);
  }
  if (!self->_canceled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_resultPipe);
    id v17 = +[SDController workQueue];
    qos_class_t v18 = qos_class_self();
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    _OWORD v22[2] = sub_100031EB8;
    v22[3] = &unk_1000931A8;
    id v19 = WeakRetained;
    id v23 = v19;
    objc_super v24 = self;
    id v25 = v6;
    id v26 = v7;
    dispatch_block_t v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v18, 0, v22);
    tracing_dispatch_async();
  }
  si_tracing_log_span_end();
  long long v21 = v28;
  *(_OWORD *)uint64_t v8 = v27;
  *(_OWORD *)(v8 + 16) = v21;
  *(void *)(v8 + 32) = v29;
}

- (void)finishWithSections:(id)a3 suggestionResults:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  uint64_t v7 = si_tracing_current_span();
  long long v43 = *(_OWORD *)v7;
  long long v44 = *(_OWORD *)(v7 + 16);
  uint64_t v45 = *(void *)(v7 + 32);
  uint64_t v8 = *(void *)v7;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v10 = *(void *)(v7 + 8);
  *(void *)uint64_t v7 = v8;
  *(void *)(v7 + 8) = spanid;
  *(void *)(v7 + 16) = v10;
  *(unsigned char *)(v7 + 28) = 102;
  *(void *)(v7 + 32) = "-[SPCoreSpotlightQueryTask finishWithSections:suggestionResults:]";
  si_tracing_log_span_begin();
  os_log_type_t v11 = SPLogForSPLogCategoryDefault();
  os_log_type_t v12 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v11, v12))
  {
    id v13 = (id)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    id v47 = v13;
    __int16 v48 = 1024;
    qos_class_t v49 = qos_class_self();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "QOS %@ finishWithSections: %d", buf, 0x12u);
  }
  if (!self->_done && !self->_canceled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_resultPipe);
    id v15 = [WeakRetained queryContext];
    long long v16 = [v15 queryUnderstandingOutput];
    uint64_t v29 = +[SSQueryUnderstandingUtilities queryUnderstandingParseWithQueryUnderstanding:v16];

    id v17 = [WeakRetained queryContext];
    id v18 = [v17 queryKind];
    id v19 = [WeakRetained connection];
    id v20 = [v19 bundleID];
    if (qword_1000A9020 != -1) {
      dispatch_once(&qword_1000A9020, &stru_100093820);
    }
    if (byte_1000A9019) {
      goto LABEL_8;
    }
    if (byte_1000A9018)
    {
      if (([v20 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
        || ([v20 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
      {
LABEL_8:

LABEL_9:
LABEL_10:
        long long v21 = +[SDController workQueue];
        qos_class_t v22 = qos_class_self();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10003243C;
        block[3] = &unk_1000931A8;
        id v23 = WeakRetained;
        id v32 = v23;
        qos_class_t v33 = self;
        id v34 = v30;
        id v35 = v6;
        dispatch_block_t v24 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v22, 0, block);
        tracing_dispatch_async();

        objc_storeWeak((id *)&self->_resultPipe, 0);
        self->_done = 1;
        atomic_fetch_add(&dword_1000A8EE0, 0xFFFFFFFF);

        goto LABEL_11;
      }
      unsigned __int8 v26 = [v20 hasPrefix:@"com.apple.ondeviceeval"];
      if (v18 == (id)12) {
        char v27 = 1;
      }
      else {
        char v27 = v26;
      }

      if (v27) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    id v28 = [objc_alloc((Class)SFEndLocalSearchFeedback) initWithStartSearch:self->_feedback queryUnderstandingParse:v29];
    long long v36 = _NSConcreteStackBlock;
    uint64_t v37 = 3221225472;
    v38 = sub_100032390;
    v39 = &unk_100093180;
    id v17 = v28;
    id v40 = v17;
    id v41 = WeakRetained;
    v42 = self;
    md_tracing_dispatch_async_propagating();

    id v19 = v17;
    goto LABEL_9;
  }
LABEL_11:
  si_tracing_log_span_end();
  long long v25 = v44;
  *(_OWORD *)uint64_t v7 = v43;
  *(_OWORD *)(v7 + 16) = v25;
  *(void *)(v7 + 32) = v45;
}

- (void)finish
{
}

- (SPCoreSpotlightTask)job
{
  return self->_job;
}

- (void)setJob:(id)a3
{
}

- (SPCoreSpotlightDatastore)store
{
  return (SPCoreSpotlightDatastore *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SDSearchQuery)resultPipe
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultPipe);

  return (SDSearchQuery *)WeakRetained;
}

- (void)setResultPipe:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (PRSRankingConfiguration)rankingInfo
{
  return (PRSRankingConfiguration *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRankingInfo:(id)a3
{
}

- (NSArray)suggestionResults
{
  return self->_suggestionResults;
}

- (void)setSuggestionResults:(id)a3
{
}

- (BOOL)done
{
  return self->_done;
}

- (void)setDone:(BOOL)a3
{
  self->_done = a3;
}

- (BOOL)live
{
  return self->_live;
}

- (void)setLive:(BOOL)a3
{
  self->_live = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (OS_dispatch_source)timeoutTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTimeoutTimer:(id)a3
{
}

- (BOOL)priorityIndexEnabled
{
  return self->_priorityIndexEnabled;
}

- (void)setPriorityIndexEnabled:(BOOL)a3
{
  self->_priorityIndexEnabled = a3;
}

- (BOOL)priorityIndexFinishedInTime
{
  return self->_priorityIndexFinishedInTime;
}

- (void)setPriorityIndexFinishedInTime:(BOOL)a3
{
  self->_priorityIndexFinishedInTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_suggestionResults, 0);
  objc_storeStrong((id *)&self->_rankingInfo, 0);
  objc_destroyWeak((id *)&self->_resultPipe);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_job, 0);
  objc_storeStrong((id *)&self->_lifetimeSpan, 0);

  objc_storeStrong((id *)&self->_feedback, 0);
}

@end