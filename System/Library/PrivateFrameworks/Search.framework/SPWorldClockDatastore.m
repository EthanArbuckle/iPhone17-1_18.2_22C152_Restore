@interface SPWorldClockDatastore
- (BOOL)coolDown;
- (id)performQuery:(id)a3;
- (unsigned)domain;
@end

@implementation SPWorldClockDatastore

- (BOOL)coolDown
{
  return 1;
}

- (id)performQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = si_tracing_current_span();
  long long v11 = *(_OWORD *)v5;
  long long v12 = *(_OWORD *)(v5 + 16);
  uint64_t v13 = *(void *)(v5 + 32);
  uint64_t v6 = *(void *)v5;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v5 + 8);
  *(void *)uint64_t v5 = v6;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = v8;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "-[SPWorldClockDatastore performQuery:]";
  si_tracing_log_span_begin();
  v9 = [[SPWorldClockDatastoreToken alloc] initWithStore:self];
  [(SPWorldClockDatastoreToken *)v9 begin:v4];
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v5 = v11;
  *(_OWORD *)(v5 + 16) = v12;
  *(void *)(v5 + 32) = v13;

  return v9;
}

- (unsigned)domain
{
  return 9;
}

@end