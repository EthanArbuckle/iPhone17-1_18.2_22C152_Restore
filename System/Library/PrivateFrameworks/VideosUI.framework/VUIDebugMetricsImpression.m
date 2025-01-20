@interface VUIDebugMetricsImpression
- (NSArray)orderedOtherKeys;
- (NSDictionary)mainValues;
- (NSDictionary)otherValues;
- (NSString)idType;
- (NSString)identifier;
- (NSString)impressionId;
- (NSString)impressionIndex;
- (NSString)name;
- (NSString)parentId;
- (NSString)type;
- (VUIDebugMetricsImpression)initWithDictionary:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)setMainValues:(id)a3;
- (void)setOrderedOtherKeys:(id)a3;
- (void)setOtherValues:(id)a3;
@end

@implementation VUIDebugMetricsImpression

- (VUIDebugMetricsImpression)initWithDictionary:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)VUIDebugMetricsImpression;
  v5 = [(VUIDebugMetricsImpression *)&v35 init];
  if (v5)
  {
    v6 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v7 = [&unk_1F3F3E510 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(&unk_1F3F3E510);
          }
          uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          v12 = [v4 objectForKeyedSubscript:v11];
          [v6 setObject:v12 forKeyedSubscript:v11];
        }
        uint64_t v8 = [&unk_1F3F3E510 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v8);
    }
    objc_storeStrong((id *)&v5->_mainValues, v6);
    v13 = [v4 allKeys];
    v14 = (void *)[v13 mutableCopy];

    [v14 removeObjectsInArray:&unk_1F3F3E510];
    v15 = (NSDictionary *)objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v16 = v14;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * j);
          v22 = objc_msgSend(v4, "objectForKeyedSubscript:", v21, (void)v27);
          [(NSDictionary *)v15 setObject:v22 forKeyedSubscript:v21];
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v18);
    }

    otherValues = v5->_otherValues;
    v5->_otherValues = v15;
    v24 = v15;

    [(NSArray *)v16 sortUsingSelector:sel_compare_];
    orderedOtherKeys = v5->_orderedOtherKeys;
    v5->_orderedOtherKeys = v16;
  }
  return v5;
}

- (NSString)name
{
  v2 = [(NSDictionary *)self->_mainValues objectForKeyedSubscript:@"name"];
  v3 = [v2 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

  return (NSString *)v3;
}

- (NSString)type
{
  return (NSString *)[(NSDictionary *)self->_mainValues objectForKeyedSubscript:@"impressionType"];
}

- (NSString)identifier
{
  v2 = [(NSDictionary *)self->_mainValues objectForKeyedSubscript:@"id"];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)impressionId
{
  v2 = [(NSDictionary *)self->_mainValues objectForKeyedSubscript:@"impressionId"];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)impressionIndex
{
  v2 = [(NSDictionary *)self->_mainValues objectForKeyedSubscript:@"impressionIndex"];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)parentId
{
  v2 = [(NSDictionary *)self->_mainValues objectForKeyedSubscript:@"impressionParentId"];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return [(NSDictionary *)self->_otherValues objectForKeyedSubscript:a3];
}

- (NSString)idType
{
  return self->_idType;
}

- (NSArray)orderedOtherKeys
{
  return self->_orderedOtherKeys;
}

- (void)setOrderedOtherKeys:(id)a3
{
}

- (NSDictionary)mainValues
{
  return self->_mainValues;
}

- (void)setMainValues:(id)a3
{
}

- (NSDictionary)otherValues
{
  return self->_otherValues;
}

- (void)setOtherValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherValues, 0);
  objc_storeStrong((id *)&self->_mainValues, 0);
  objc_storeStrong((id *)&self->_orderedOtherKeys, 0);
  objc_storeStrong((id *)&self->_idType, 0);
}

@end