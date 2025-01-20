@interface SSMetricsClickEvent
- (NSNumber)positionX;
- (NSNumber)positionY;
- (NSString)actionType;
- (NSString)locationDescription;
- (NSString)targetIdentifier;
- (NSString)targetType;
- (NSString)targetURL;
- (SSMetricsClickEvent)init;
- (id)actionDetails;
- (id)description;
- (id)impressions;
- (void)setActionDetails:(id)a3;
- (void)setActionType:(id)a3;
- (void)setImpressions:(id)a3;
- (void)setLocationDescription:(id)a3;
- (void)setLocationWithEventLocations:(id)a3;
- (void)setPositionX:(id)a3;
- (void)setPositionY:(id)a3;
- (void)setTargetIdentifier:(id)a3;
- (void)setTargetType:(id)a3;
- (void)setTargetURL:(id)a3;
@end

@implementation SSMetricsClickEvent

- (SSMetricsClickEvent)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSMetricsClickEvent;
  v2 = [(SSMetricsBaseEvent *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SSMetricsMutableEvent *)v2 setEventType:@"click"];
  }
  return v3;
}

- (id)actionDetails
{
  return [(SSMetricsMutableEvent *)self propertyForBodyKey:@"actionDetails"];
}

- (NSString)actionType
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"actionType"];
}

- (id)impressions
{
  return [(SSMetricsMutableEvent *)self propertyForBodyKey:@"impressions"];
}

- (NSString)locationDescription
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"location"];
}

- (NSNumber)positionX
{
  return (NSNumber *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"positionX"];
}

- (NSNumber)positionY
{
  return (NSNumber *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"positionY"];
}

- (void)setActionDetails:(id)a3
{
}

- (void)setActionType:(id)a3
{
}

- (void)setImpressions:(id)a3
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

- (void)setPositionX:(id)a3
{
}

- (void)setPositionY:(id)a3
{
}

- (void)setTargetIdentifier:(id)a3
{
}

- (void)setTargetType:(id)a3
{
}

- (void)setTargetURL:(id)a3
{
}

- (NSString)targetIdentifier
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"targetId"];
}

- (NSString)targetType
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"targetType"];
}

- (NSString)targetURL
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"actionUrl"];
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)SSMetricsClickEvent;
  id v4 = [(SSMetricsBaseEvent *)&v13 description];
  id v5 = [(SSMetricsClickEvent *)self actionType];
  id v6 = [(SSMetricsClickEvent *)self targetType];
  uint64_t v7 = [(SSMetricsClickEvent *)self targetIdentifier];
  uint64_t v8 = [(SSMetricsClickEvent *)self positionX];
  uint64_t v9 = [(SSMetricsClickEvent *)self positionY];
  uint64_t v10 = [(SSMetricsClickEvent *)self impressions];
  v11 = [v3 stringWithFormat:@"%@: %@; [%@, %@]; [%@, %@]; %@", v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

@end