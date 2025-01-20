@interface SPWorldClockDatastoreToken
- (SPWorldClockDatastore)store;
- (SPWorldClockDatastoreToken)initWithStore:(id)a3;
- (unint64_t)type;
- (void)begin:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation SPWorldClockDatastoreToken

- (SPWorldClockDatastoreToken)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPWorldClockDatastoreToken;
  v6 = [(SPWorldClockDatastoreToken *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v7->_type = 7;
  }

  return v7;
}

- (void)begin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = si_tracing_current_span();
  long long v6 = *(_OWORD *)(v5 + 16);
  long long v36 = *(_OWORD *)v5;
  long long v37 = v6;
  uint64_t v38 = *(void *)(v5 + 32);
  uint64_t v7 = *(void *)v5;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v9 = *(void *)(v5 + 8);
  *(void *)uint64_t v5 = v7;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = v9;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "-[SPWorldClockDatastoreToken begin:]";
  si_tracing_log_span_begin();
  unsigned int v10 = [v4 externalID];
  v11 = SPLogForSPLogCategoryTelemetry();
  v12 = v11;
  if (v10 && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "worldClockLatency", " enableTelemetry=YES ", buf, 2u);
  }

  v13 = [v4 queryContext];
  v14 = [v13 searchString];

  id v15 = objc_alloc((Class)SFStartLocalSearchFeedback);
  v16 = [v4 queryContext];
  id v17 = objc_msgSend(v15, "initWithInput:triggerEvent:indexType:queryId:", v14, objc_msgSend(v16, "whyQuery"), 1, objc_msgSend(v4, "queryIdent"));

  v18 = +[SPFeedbackProxy sharedProxy];
  id v19 = [v4 queryIdent];
  v20 = [v4 connection];
  v21 = [v20 bundleID];
  [v18 sendFeedbackType:5 feedback:v17 queryId:v19 clientID:v21];

  *(_OWORD *)buf = *(_OWORD *)v5;
  long long v34 = *(_OWORD *)(v5 + 16);
  uint64_t v35 = *(void *)(v5 + 32);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10006448C;
  v25[3] = &unk_100093D68;
  id v22 = v4;
  long long v29 = *(_OWORD *)buf;
  long long v30 = v34;
  uint64_t v31 = v35;
  unsigned int v32 = v10;
  id v26 = v22;
  v27 = self;
  id v23 = v17;
  id v28 = v23;
  +[SSWorldClockUtilities getWorldClockResultsForQuery:v14 completionHandler:v25];

  si_tracing_log_span_end();
  long long v24 = v37;
  *(_OWORD *)uint64_t v5 = v36;
  *(_OWORD *)(v5 + 16) = v24;
  *(void *)(v5 + 32) = v38;
}

- (SPWorldClockDatastore)store
{
  return (SPWorldClockDatastore *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end