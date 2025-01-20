@interface PLCoreAnalyticsEvent
- (NSDictionary)payload;
- (PLCoreAnalyticsEvent)initWithEvent:(id)a3 payload:(id)a4;
- (id)debugDescription;
- (id)description;
- (void)addKey:(id)a3 value:(id)a4;
- (void)mergePayload:(id)a3;
- (void)publish;
- (void)removeKey:(id)a3;
@end

@implementation PLCoreAnalyticsEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonConverter, 0);
  objc_storeStrong((id *)&self->_mutablePayload, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

- (void)publish
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(PLCoreAnalyticsEvent *)self payload];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    event = self->_event;
    v6 = [(PLCoreAnalyticsEvent *)self payload];
    PLSendCoreAnalyticEvent(event, v6);

    v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_event;
      v9 = [(PLCoreAnalyticsEvent *)self payload];
      int v10 = 138543618;
      v11 = v8;
      __int16 v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_DEFAULT, "CoreAnalytics published event: %{public}@ payload: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)removeKey:(id)a3
{
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_mutablePayload, "removeObjectForKey:");
  }
}

- (void)mergePayload:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    mutablePayload = self->_mutablePayload;
    id v8 = v4;
    if (!mutablePayload)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v7 = self->_mutablePayload;
      self->_mutablePayload = v6;

      mutablePayload = self->_mutablePayload;
    }
    [(NSMutableDictionary *)mutablePayload addEntriesFromDictionary:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)addKey:(id)a3 value:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10 && v6)
  {
    mutablePayload = self->_mutablePayload;
    if (!mutablePayload)
    {
      id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v9 = self->_mutablePayload;
      self->_mutablePayload = v8;

      mutablePayload = self->_mutablePayload;
    }
    [(NSMutableDictionary *)mutablePayload setObject:v6 forKeyedSubscript:v10];
  }
}

- (NSDictionary)payload
{
  return (NSDictionary *)self->_mutablePayload;
}

- (id)debugDescription
{
  jsonConverter = self->_jsonConverter;
  id v4 = [(PLCoreAnalyticsEvent *)self payload];
  v5 = [(PFJSONDebugDumpConverter *)jsonConverter JSONForObject:v4 error:0];

  if (v5) {
    id v6 = (__CFString *)[[NSString alloc] initWithData:v5 encoding:4];
  }
  else {
    id v6 = @"unknown";
  }
  v7 = [NSString stringWithFormat:@" event: %@, payload: %@", self->_event, v6];

  return v7;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PLCoreAnalyticsEvent;
  v3 = [(PLCoreAnalyticsEvent *)&v8 description];
  event = self->_event;
  v5 = [(PLCoreAnalyticsEvent *)self payload];
  id v6 = [v3 stringByAppendingFormat:@" event: %@, payload: %@", event, v5];

  return v6;
}

- (PLCoreAnalyticsEvent)initWithEvent:(id)a3 payload:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PLCoreAnalyticsEvent;
  v9 = [(PLCoreAnalyticsEvent *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_event, a3);
    uint64_t v11 = [v8 mutableCopy];
    mutablePayload = v10->_mutablePayload;
    v10->_mutablePayload = (NSMutableDictionary *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F8CC18]) initWithUnknownTypeHandler:0];
    jsonConverter = v10->_jsonConverter;
    v10->_jsonConverter = (PFJSONDebugDumpConverter *)v13;

    [(PFJSONDebugDumpConverter *)v10->_jsonConverter setEnablePretty:0];
  }

  return v10;
}

@end