@interface PMLTrackerMockAdapter
- (PMLTrackerMockAdapter)init;
- (id)trackedMessagesByClass:(Class)a3;
- (void)clearAllTrackedMessages;
- (void)postMetricId:(unsigned int)a3 message:(id)a4;
@end

@implementation PMLTrackerMockAdapter

- (void).cxx_destruct
{
}

- (id)trackedMessagesByClass:(Class)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_trackedMessages;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v4, "addObject:", v10, (void)v12);
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)clearAllTrackedMessages
{
}

- (void)postMetricId:(unsigned int)a3 message:(id)a4
{
}

- (PMLTrackerMockAdapter)init
{
  v6.receiver = self;
  v6.super_class = (Class)PMLTrackerMockAdapter;
  v2 = [(PMLTrackerMockAdapter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    trackedMessages = v2->_trackedMessages;
    v2->_trackedMessages = (NSMutableArray *)v3;
  }
  return v2;
}

@end