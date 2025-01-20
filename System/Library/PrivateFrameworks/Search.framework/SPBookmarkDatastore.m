@interface SPBookmarkDatastore
- (BOOL)coolDown;
- (id)performQuery:(id)a3;
- (unsigned)domain;
@end

@implementation SPBookmarkDatastore

- (BOOL)coolDown
{
  return 1;
}

- (id)performQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = si_tracing_current_span();
  long long v6 = *(_OWORD *)(v5 + 16);
  long long v18 = *(_OWORD *)v5;
  long long v19 = v6;
  uint64_t v20 = *(void *)(v5 + 32);
  uint64_t v7 = *(void *)v5;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v9 = *(void *)(v5 + 8);
  *(void *)uint64_t v5 = v7;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = v9;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "-[SPBookmarkDatastore performQuery:]";
  si_tracing_log_span_begin();
  if (([v4 isPeopleSearch] & 1) != 0
    || ([v4 isScopedAppSearch] & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v11 = SPLogForSPLogCategoryTelemetry();
    unsigned int v12 = [v4 externalID];
    if (v12 && os_signpost_enabled(v11))
    {
      *(_WORD *)v17 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "bookmarkSpotlightLatency", " enableTelemetry=YES ", v17, 2u);
    }

    v10 = [[SPBookmarkDatastoreToken alloc] initWithStore:self];
    [(SPBookmarkDatastoreToken *)v10 begin:v4];
    v13 = SPLogForSPLogCategoryTelemetry();
    unsigned int v14 = [v4 externalID];
    if (v14 && os_signpost_enabled(v13))
    {
      *(_WORD *)v17 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v14, "bookmarkSpotlightLatency", " enableTelemetry=YES ", v17, 2u);
    }
  }
  si_tracing_log_span_end();
  long long v15 = v19;
  *(_OWORD *)uint64_t v5 = v18;
  *(_OWORD *)(v5 + 16) = v15;
  *(void *)(v5 + 32) = v20;

  return v10;
}

- (unsigned)domain
{
  return 4;
}

@end