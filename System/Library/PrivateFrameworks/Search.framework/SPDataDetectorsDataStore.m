@interface SPDataDetectorsDataStore
- (id)performQuery:(id)a3;
- (unsigned)domain;
- (void)cancel;
@end

@implementation SPDataDetectorsDataStore

- (void)cancel
{
}

- (id)performQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = si_tracing_current_span();
  long long v6 = *(_OWORD *)(v5 + 16);
  long long v33 = *(_OWORD *)v5;
  long long v34 = v6;
  uint64_t v35 = *(void *)(v5 + 32);
  uint64_t v7 = *(void *)v5;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v9 = *(void *)(v5 + 8);
  *(void *)uint64_t v5 = v7;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = v9;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "-[SPDataDetectorsDataStore performQuery:]";
  si_tracing_log_span_begin();
  v10 = SPLogForSPLogCategoryTelemetry();
  unsigned int v11 = [v4 externalID];
  if (v11 && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "dataDetectorsLatency", " enableTelemetry=YES ", buf, 2u);
  }

  v12 = [v4 queryContext];
  v13 = [v12 searchString];
  id v14 = [v13 mutableCopy];

  id location = 0;
  objc_initWeak(&location, v4);
  v15 = [[DDStoreToken alloc] initWithStore:self];
  v16 = (SSDataDetectorResultGenerator *)objc_alloc_init((Class)SSDataDetectorResultGenerator);
  generator = self->_generator;
  self->_generator = v16;

  *(_OWORD *)buf = *(_OWORD *)v5;
  long long v30 = *(_OWORD *)(v5 + 16);
  uint64_t v31 = *(void *)(v5 + 32);
  v18 = self->_generator;
  id v19 = [v4 queryIdent];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100058764;
  v23[3] = &unk_100093AD0;
  long long v26 = *(_OWORD *)buf;
  long long v27 = v30;
  uint64_t v28 = v31;
  objc_copyWeak(&v25, &location);
  v20 = v15;
  v24 = v20;
  [(SSDataDetectorResultGenerator *)v18 getResultSections:v14 queryId:v19 completion:v23];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  si_tracing_log_span_end();
  long long v21 = v34;
  *(_OWORD *)uint64_t v5 = v33;
  *(_OWORD *)(v5 + 16) = v21;
  *(void *)(v5 + 32) = v35;

  return v20;
}

- (unsigned)domain
{
  return 10;
}

- (void).cxx_destruct
{
}

@end