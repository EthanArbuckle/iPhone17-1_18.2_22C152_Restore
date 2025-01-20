@interface SiriAnalyticsPrivateLearningStorageProvider
- (BOOL)isAnyEventTypeAllowed:(int)a3;
- (SiriAnalyticsPrivateLearningStorageProvider)init;
- (void)storeMessages:(id)a3;
- (void)storeOrderedAnyEvent:(id)a3;
@end

@implementation SiriAnalyticsPrivateLearningStorageProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)storeOrderedAnyEvent:(id)a3
{
  id v15 = a3;
  v4 = [v15 event];
  BOOL v5 = -[SiriAnalyticsPrivateLearningStorageProvider isAnyEventTypeAllowed:](self, "isAnyEventTypeAllowed:", [v4 anyEventType]);

  v6 = v15;
  if (v5)
  {
    v7 = [v15 wrapAsAnyEvent];
    if (v7)
    {
      source = self->_source;
      id v9 = objc_alloc(MEMORY[0x1E4F50458]);
      v10 = [MEMORY[0x1E4F29128] UUID];
      v11 = [v10 UUIDString];
      double Current = CFAbsoluteTimeGetCurrent();
      v13 = [v7 data];
      v14 = (void *)[v9 initWithUniqueId:v11 absoluteTimestamp:v13 eventData:Current];
      [(BMSource *)source sendEvent:v14];
    }
    v6 = v15;
  }
}

- (void)storeMessages:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v9 = [v8 underlyingMessage];
        BOOL v10 = -[SiriAnalyticsPrivateLearningStorageProvider isAnyEventTypeAllowed:](self, "isAnyEventTypeAllowed:", [v9 getAnyEventType]);

        if (v10)
        {
          v11 = [v8 storageRepresentation];
          if (v11)
          {
            source = self->_source;
            id v13 = objc_alloc(MEMORY[0x1E4F50458]);
            v14 = [MEMORY[0x1E4F29128] UUID];
            id v15 = [v14 UUIDString];
            double Current = CFAbsoluteTimeGetCurrent();
            v17 = [v11 data];
            v18 = (void *)[v13 initWithUniqueId:v15 absoluteTimestamp:v17 eventData:Current];
            [(BMSource *)source sendEvent:v18];
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
}

- (SiriAnalyticsPrivateLearningStorageProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)SiriAnalyticsPrivateLearningStorageProvider;
  v2 = [(SiriAnalyticsPrivateLearningStorageProvider *)&v8 init];
  if (v2)
  {
    v3 = (BMSiriPrivateLearningSELFEventStream *)objc_alloc_init(MEMORY[0x1E4F50460]);
    stream = v2->_stream;
    v2->_stream = v3;

    uint64_t v5 = [(BMSiriPrivateLearningSELFEventStream *)v2->_stream source];
    source = v2->_source;
    v2->_source = (BMSource *)v5;
  }
  return v2;
}

- (BOOL)isAnyEventTypeAllowed:(int)a3
{
  return (a3 < 0x3E) & (0x2000004000DE2202uLL >> a3);
}

@end