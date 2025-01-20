@interface SPDictionaryDatastoreToken
- (BOOL)cancelled;
- (SPDictionaryDatastore)store;
- (SPDictionaryDatastoreToken)initWithStore:(id)a3;
- (unint64_t)type;
- (void)begin:(id)a3;
- (void)cancel;
- (void)finishWithClientID:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation SPDictionaryDatastoreToken

- (SPDictionaryDatastoreToken)initWithStore:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SPDictionaryDatastoreToken;
  v6 = [(SPDictionaryDatastoreToken *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v7->_type = 4;
    id v8 = objc_alloc((Class)SITracingObjcLifetimeSpan);
    uint64_t v9 = si_tracing_current_span();
    v14[0] = *(_OWORD *)v9;
    v14[1] = *(_OWORD *)(v9 + 16);
    uint64_t v15 = *(void *)(v9 + 32);
    v11 = (SITracingObjcLifetimeSpan *)[v10 init:v14 kind:111 what:"SPDictionaryDatastoreToken"];
    lifetimeSpan = v7->_lifetimeSpan;
    v7->_lifetimeSpan = v11;
  }
  return v7;
}

- (void)cancel
{
  self->_cancelled = 1;
}

- (void)begin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = si_tracing_current_span();
  long long v6 = *(_OWORD *)(v5 + 16);
  long long v50 = *(_OWORD *)v5;
  long long v51 = v6;
  uint64_t v52 = *(void *)(v5 + 32);
  uint64_t v7 = *(void *)v5;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v9 = *(void *)(v5 + 8);
  *(void *)uint64_t v5 = v7;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = v9;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "-[SPDictionaryDatastoreToken begin:]";
  si_tracing_log_span_begin();
  id v10 = [v4 queryContext];
  v11 = [v4 connection];
  uint64_t v12 = [v11 bundleID];

  id v13 = objc_alloc((Class)SFStartLocalSearchFeedback);
  v14 = [v10 searchString];
  uint64_t v15 = (SFStartSearchFeedback *)objc_msgSend(v13, "initWithInput:triggerEvent:indexType:queryId:", v14, objc_msgSend(v10, "whyQuery"), 6, objc_msgSend(v4, "queryIdent"));
  feedback = self->_feedback;
  self->_feedback = v15;

  v17 = +[SPFeedbackProxy sharedProxy];
  objc_msgSend(v17, "sendFeedbackType:feedback:queryId:clientID:", 5, self->_feedback, objc_msgSend(v4, "queryIdent"), v12);

  [v4 externalID];
  kdebug_trace();
  v18 = SPLogForSPLogCategoryTelemetry();
  unsigned int v19 = [v4 externalID];
  if (v19 && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v19, "dictionaryLatency", " enableTelemetry=YES ", buf, 2u);
  }

  v39 = +[NSCharacterSet whitespaceCharacterSet];
  v20 = [v10 getTrimmedSearchString];
  id v21 = [v20 mutableCopy];

  if (qword_1000A90C8 != -1) {
    dispatch_once(&qword_1000A90C8, &stru_100093AF0);
  }
  id v22 = objc_msgSend(v21, "length", v12);
  if (v22 > [(id)qword_1000A90D0 length]
    && [v21 hasPrefix:qword_1000A90D0]
    && (objc_msgSend(v39, "characterIsMember:", objc_msgSend(v21, "characterAtIndex:", objc_msgSend((id)qword_1000A90D0, "length"))) & 1) != 0)
  {
    v23 = &qword_1000A90D0;
  }
  else
  {
    if (v22 <= [(id)qword_1000A90D8 length]
      || ![v21 hasPrefix:qword_1000A90D8]
      || !objc_msgSend(v39, "characterIsMember:", objc_msgSend(v21, "characterAtIndex:", objc_msgSend((id)qword_1000A90D8, "length"))))
    {
      char v28 = 0;
      v25 = 0;
      goto LABEL_17;
    }
    v23 = &qword_1000A90D8;
  }
  id v24 = (id)*v23;
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v21, "deleteCharactersInRange:", 0, objc_msgSend(v24, "length"));
    v26 = [v21 stringByTrimmingCharactersInSet:v39];
    id v27 = [v26 mutableCopy];

    char v28 = 1;
    id v21 = v27;
  }
  else
  {
    char v28 = 0;
  }
LABEL_17:
  if (qword_1000A90E8 != -1) {
    dispatch_once(&qword_1000A90E8, &stru_100093B10);
  }
  v29 = (void *)clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  *(void *)buf = 0;
  v47 = buf;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  v30 = [(SPDictionaryDatastoreToken *)self store];
  v31 = [v30 dictionaries];

  if ([v31 count])
  {
    location[0] = 0;
    objc_initWeak(location, v4);
    objc_copyWeak(v43, location);
    id v32 = v21;
    char v44 = v28;
    v43[1] = v29;
    id v41 = v32;
    v33 = v38;
    id v42 = v38;
    md_tracing_dispatch_async_propagating();

    objc_destroyWeak(v43);
    objc_destroyWeak(location);
  }
  else
  {
    v34 = +[SDController workQueue];
    id v40 = v4;
    md_tracing_dispatch_async_propagating();

    [v40 externalID];
    kdebug_trace();
    v35 = SPLogForSPLogCategoryTelemetry();
    unsigned int v36 = [v40 externalID];
    if (v36 && os_signpost_enabled(v35))
    {
      LOWORD(location[0]) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_END, v36, "dictionaryLatency", " enableTelemetry=YES ", (uint8_t *)location, 2u);
    }

    [(SPDictionaryDatastoreToken *)self finishWithClientID:v38];
    v33 = v38;
  }

  _Block_object_dispose(buf, 8);
  si_tracing_log_span_end();
  long long v37 = v51;
  *(_OWORD *)uint64_t v5 = v50;
  *(_OWORD *)(v5 + 16) = v37;
  *(void *)(v5 + 32) = v52;
}

- (void)finishWithClientID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SPFeedbackProxy sharedProxy];
  id v6 = [objc_alloc((Class)SFEndLocalSearchFeedback) initWithStartSearch:self->_feedback];
  objc_msgSend(v5, "sendFeedbackType:feedback:queryId:clientID:", 6, v6, -[SFStartSearchFeedback queryId](self->_feedback, "queryId"), v4);

  feedback = self->_feedback;
  self->_feedback = 0;
}

- (SPDictionaryDatastore)store
{
  return (SPDictionaryDatastore *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_lifetimeSpan, 0);

  objc_storeStrong((id *)&self->_feedback, 0);
}

@end