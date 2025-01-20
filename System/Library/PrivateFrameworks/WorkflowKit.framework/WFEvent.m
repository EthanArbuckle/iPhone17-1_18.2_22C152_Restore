@interface WFEvent
+ (Class)codableEventClass;
+ (id)serializablePropertyTransformers;
- (Class)codableEventClass;
- (id)coreAnalyticsKey;
- (id)debugDescription;
- (id)description;
- (id)dictionaryRepresentation;
- (id)propertyNames;
- (id)serializableEvent;
- (void)track;
@end

@implementation WFEvent

+ (id)serializablePropertyTransformers
{
  return 0;
}

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (id)debugDescription
{
  v2 = [(WFEvent *)self serializableEvent];
  v3 = [v2 debugDescription];

  return v3;
}

- (id)description
{
  v2 = [(WFEvent *)self serializableEvent];
  v3 = [v2 description];

  return v3;
}

- (void)track
{
  id v3 = +[WFEventTracker sharedTracker];
  [v3 trackEvent:self];
}

- (Class)codableEventClass
{
  v2 = objc_opt_class();
  return (Class)[v2 codableEventClass];
}

- (id)propertyNames
{
  unsigned int outCount = 0;
  v2 = (objc_class *)objc_opt_class();
  id v3 = class_copyPropertyList(v2, &outCount);
  v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:outCount];
  if (v3)
  {
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        v6 = [NSString stringWithUTF8String:property_getName(v3[i])];
        [v4 addObject:v6];
      }
    }
    free(v3);
  }
  return v4;
}

- (id)coreAnalyticsKey
{
  v2 = [(WFEvent *)self dictionaryRepresentation];
  id v3 = [v2 objectForKey:@"key"];

  if (v3)
  {
    v4 = [@"com.apple.shortcuts." stringByAppendingString:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)dictionaryRepresentation
{
  v2 = [(WFEvent *)self serializableEvent];
  id v3 = [v2 dictionaryRepresentation];

  return v3;
}

- (id)serializableEvent
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init([(WFEvent *)self codableEventClass]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = [(WFEvent *)self propertyNames];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v10 = [(WFEvent *)self valueForKey:v9];
        v11 = [(id)objc_opt_class() serializablePropertyTransformers];
        v12 = [v11 objectForKey:v9];

        if (v12)
        {
          uint64_t v13 = [v12 transformedValue:v10];

          v10 = (void *)v13;
        }
        if (!v10)
        {
          v10 = [v3 valueForKey:v9];
        }
        [v3 setValue:v10 forKey:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

@end