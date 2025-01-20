@interface SPParsecResultsDatastore
- (id)performQuery:(id)a3;
@end

@implementation SPParsecResultsDatastore

- (id)performQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = si_tracing_current_span();
  long long v6 = *(_OWORD *)(v5 + 16);
  long long v14 = *(_OWORD *)v5;
  long long v15 = v6;
  uint64_t v16 = *(void *)(v5 + 32);
  uint64_t v7 = *(void *)v5;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v9 = *(void *)(v5 + 8);
  *(void *)uint64_t v5 = v7;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = v9;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "-[SPParsecResultsDatastore performQuery:]";
  si_tracing_log_span_begin();
  v13.receiver = self;
  v13.super_class = (Class)SPParsecResultsDatastore;
  v10 = [(SPParsecDatastore *)&v13 performQuery:v4];
  si_tracing_log_span_end();
  long long v11 = v15;
  *(_OWORD *)uint64_t v5 = v14;
  *(_OWORD *)(v5 + 16) = v11;
  *(void *)(v5 + 32) = v16;

  return v10;
}

@end