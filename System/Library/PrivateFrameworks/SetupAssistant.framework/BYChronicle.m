@interface BYChronicle
- (BYChronicle)init;
- (BYChronicle)initWithDictionary:(id)a3;
- (NSMutableDictionary)featureEntries;
- (id)dictionaryRepresentation;
- (id)entryForFeature:(unint64_t)a3;
- (void)addEntry:(id)a3 forFeature:(unint64_t)a4;
- (void)recordFeatureShown:(unint64_t)a3;
- (void)setFeatureEntries:(id)a3;
@end

@implementation BYChronicle

- (BYChronicle)init
{
  v6.receiver = self;
  v6.super_class = (Class)BYChronicle;
  v2 = [(BYChronicle *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    featureEntries = v2->_featureEntries;
    v2->_featureEntries = v3;
  }
  return v2;
}

- (BYChronicle)initWithDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(BYChronicle *)self init];
  if (v5)
  {
    [v4 objectForKeyedSubscript:@"features"];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v11 = [v10 objectForKeyedSubscript:@"type"];
          v12 = [v10 objectForKeyedSubscript:@"data"];
          v13 = [[BYChronicleEntry alloc] initWithDictionary:v12];
          [(NSMutableDictionary *)v5->_featureEntries setObject:v13 forKeyedSubscript:v11];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

- (void)recordFeatureShown:(unint64_t)a3
{
  v5 = objc_alloc_init(BYChronicleEntry);
  [(BYChronicle *)self addEntry:v5 forFeature:a3];
}

- (void)addEntry:(id)a3 forFeature:(unint64_t)a4
{
  id v6 = a3;
  id v8 = [(BYChronicle *)self featureEntries];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a4];
  [v8 setObject:v6 forKeyedSubscript:v7];
}

- (id)entryForFeature:(unint64_t)a3
{
  id v4 = [(BYChronicle *)self featureEntries];
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(BYChronicle *)self featureEntries];
  v5 = [v4 allKeys];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v11 = [(BYChronicle *)self featureEntries];
        v12 = [v11 objectForKeyedSubscript:v10];

        v21[1] = @"data";
        v22[0] = v10;
        v21[0] = @"type";
        v13 = [v12 dictionaryRepresentation];
        v22[1] = v13;
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
        [v3 addObject:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  [v16 setObject:v3 forKeyedSubscript:@"features"];
  return v16;
}

- (NSMutableDictionary)featureEntries
{
  return self->_featureEntries;
}

- (void)setFeatureEntries:(id)a3
{
}

- (void).cxx_destruct
{
}

@end