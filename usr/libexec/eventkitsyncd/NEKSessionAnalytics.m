@interface NEKSessionAnalytics
- (NDTSQFile)storeFile;
- (NEKSessionAnalytics)initWithFileManager:(id)a3;
- (NEKSessionAnalyticsStore)store;
- (void)flush;
- (void)recordSessionType:(int)a3;
- (void)setStore:(id)a3;
- (void)setStoreFile:(id)a3;
@end

@implementation NEKSessionAnalytics

- (NEKSessionAnalytics)initWithFileManager:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEKSessionAnalytics;
  v5 = [(NEKSessionAnalytics *)&v13 init];
  if (v5)
  {
    v6 = [NDTSQFile alloc];
    v7 = [v4 syncStateDBPathFor:@"Analytics.sqlite"];
    v8 = [(NDTSQFile *)v6 initWithPath:v7];
    storeFile = v5->_storeFile;
    v5->_storeFile = v8;

    v10 = objc_alloc_init(NEKSessionAnalyticsStore);
    store = v5->_store;
    v5->_store = v10;

    [(NDTSQFile *)v5->_storeFile addSchema:v5->_store];
  }

  return v5;
}

- (void)flush
{
  v3 = *(NSObject **)(qword_1000C6CB8 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Flushing to CoreAnalytics", (uint8_t *)&v16, 2u);
  }
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:4];
  uint64_t v5 = 0;
  int v6 = 0;
  unsigned int v7 = 0;
  int v8 = 0;
  do
  {
    uint64_t v18 = 0;
    v9 = [(NEKSessionAnalytics *)self store];
    [v9 fetchHourlyTallies:&v16 hour:v5];

    v10 = +[NSNumber numberWithInt:v16];
    [v4 setValue:v10 forKey:@"hour"];

    v11 = +[NSNumber numberWithInt:v18];
    [v4 setValue:v11 forKey:@"deltas"];

    v12 = +[NSNumber numberWithInt:v17];
    [v4 setValue:v12 forKey:@"resets"];

    objc_super v13 = +[NSNumber numberWithInt:HIDWORD(v18)];
    [v4 setValue:v13 forKey:@"failures"];

    AnalyticsSendEvent();
    v14 = [(NEKSessionAnalytics *)self store];
    [v14 clearHour:v5];

    v7 += v18;
    v8 += v17;
    v6 += HIDWORD(v18);
    [v4 removeAllObjects];
    uint64_t v5 = (v5 + 1);
  }
  while (v5 != 24);
  v15 = *(NSObject **)(qword_1000C6CB8 + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v16 = 67109632;
    unsigned int v17 = v7;
    LOWORD(v18) = 1024;
    *(_DWORD *)((char *)&v18 + 2) = v8;
    HIWORD(v18) = 1024;
    int v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Daily tally: D: %d R: %d F: %d", (uint8_t *)&v16, 0x14u);
  }
}

- (void)recordSessionType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(NEKSessionAnalytics *)self store];
  [v4 countSessionType:v3];
}

- (NEKSessionAnalyticsStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (NDTSQFile)storeFile
{
  return self->_storeFile;
}

- (void)setStoreFile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeFile, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

@end