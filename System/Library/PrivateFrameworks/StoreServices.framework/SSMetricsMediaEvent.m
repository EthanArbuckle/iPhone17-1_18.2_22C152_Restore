@interface SSMetricsMediaEvent
- (NSNumber)itemIdentifier;
- (NSString)locationDescription;
- (NSString)mediaEventType;
- (NSString)mediaURL;
- (SSMetricsMediaEvent)init;
- (void)setItemIdentifier:(id)a3;
- (void)setLocationDescription:(id)a3;
- (void)setLocationWithEventLocations:(id)a3;
- (void)setMediaEventType:(id)a3;
- (void)setMediaURL:(id)a3;
@end

@implementation SSMetricsMediaEvent

- (SSMetricsMediaEvent)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSMetricsMediaEvent;
  v2 = [(SSMetricsBaseEvent *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SSMetricsMutableEvent *)v2 setEventType:@"media"];
  }
  return v3;
}

- (NSNumber)itemIdentifier
{
  return (NSNumber *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"itemId"];
}

- (NSString)locationDescription
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"location"];
}

- (NSString)mediaEventType
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"type"];
}

- (NSString)mediaURL
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"url"];
}

- (void)setItemIdentifier:(id)a3
{
}

- (void)setLocationDescription:(id)a3
{
}

- (void)setLocationWithEventLocations:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "reportingDictionary", (void)v12);
        if (v11) {
          [v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(SSMetricsMutableEvent *)self setProperty:v5 forBodyKey:@"location"];
}

- (void)setMediaEventType:(id)a3
{
}

- (void)setMediaURL:(id)a3
{
}

@end