@interface SPParsecSuggestionsDatastore
- (id)performQuery:(id)a3;
- (unsigned)domain;
@end

@implementation SPParsecSuggestionsDatastore

- (id)performQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = si_tracing_current_span();
  long long v6 = *(_OWORD *)(v5 + 16);
  long long v16 = *(_OWORD *)v5;
  long long v17 = v6;
  uint64_t v18 = *(void *)(v5 + 32);
  uint64_t v7 = *(void *)v5;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v9 = *(void *)(v5 + 8);
  *(void *)uint64_t v5 = v7;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = v9;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "-[SPParsecSuggestionsDatastore performQuery:]";
  si_tracing_log_span_begin();
  v10 = [v4 queryContext];
  v11 = (char *)[v10 queryKind];

  if ((unint64_t)(v11 - 1) > 1)
  {
    v12 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SPParsecSuggestionsDatastore;
    v12 = [(SPParsecDatastore *)&v15 performQuery:v4];
  }
  si_tracing_log_span_end();
  long long v13 = v17;
  *(_OWORD *)uint64_t v5 = v16;
  *(_OWORD *)(v5 + 16) = v13;
  *(void *)(v5 + 32) = v18;

  return v12;
}

- (unsigned)domain
{
  return 7;
}

@end