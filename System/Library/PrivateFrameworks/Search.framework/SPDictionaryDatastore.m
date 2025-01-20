@interface SPDictionaryDatastore
- (BOOL)coolDown;
- (NSArray)dictionaries;
- (SPDictionaryDatastore)init;
- (id)performQuery:(id)a3;
- (unsigned)domain;
- (void)activate;
- (void)deactivate;
- (void)setDictionaries:(id)a3;
@end

@implementation SPDictionaryDatastore

- (SPDictionaryDatastore)init
{
  v6.receiver = self;
  v6.super_class = (Class)SPDictionaryDatastore;
  v2 = [(SPDictionaryDatastore *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("SPDictionaryDatastore.activation", 0);
    activationQueue = v2->_activationQueue;
    v2->_activationQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)activate
{
}

- (void)deactivate
{
}

- (BOOL)coolDown
{
  return 1;
}

- (id)performQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = si_tracing_current_span();
  long long v6 = *(_OWORD *)(v5 + 16);
  long long v15 = *(_OWORD *)v5;
  long long v16 = v6;
  uint64_t v17 = *(void *)(v5 + 32);
  uint64_t v7 = *(void *)v5;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v9 = *(void *)(v5 + 8);
  *(void *)uint64_t v5 = v7;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = v9;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "-[SPDictionaryDatastore performQuery:]";
  si_tracing_log_span_begin();
  if (([v4 isPeopleSearch] & 1) != 0
    || ([v4 isScopedAppSearch] & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v11 = SPLogForSPLogCategoryQuery();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#query dictionary start", v14, 2u);
    }

    v10 = [[SPDictionaryDatastoreToken alloc] initWithStore:self];
    [(SPDictionaryDatastoreToken *)v10 begin:v4];
  }
  si_tracing_log_span_end();
  long long v12 = v16;
  *(_OWORD *)uint64_t v5 = v15;
  *(_OWORD *)(v5 + 16) = v12;
  *(void *)(v5 + 32) = v17;

  return v10;
}

- (unsigned)domain
{
  return 6;
}

- (NSArray)dictionaries
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDictionaries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaries, 0);

  objc_storeStrong((id *)&self->_activationQueue, 0);
}

@end