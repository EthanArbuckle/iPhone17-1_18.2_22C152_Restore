@interface PLAggregateEntry
- (NSArray)otherAggregateKeys;
- (NSMutableDictionary)matchingKeyToValue;
- (NSString)aggregateKey;
- (NSString)entryKey;
- (double)aggregateValue;
- (id)aggregateOperationWithMatchingPairs:(id)a3;
- (id)description;
- (id)matchingPairs;
- (id)query;
- (signed)aggregateFunction;
- (void)setAggregateFunction:(signed __int16)a3;
- (void)setAggregateKey:(id)a3;
- (void)setAggregateValue:(double)a3;
- (void)setEntryKey:(id)a3;
- (void)setMatchingKeyToValue:(id)a3;
- (void)setOtherAggregateKeys:(id)a3;
- (void)updateWithValue:(double)a3;
@end

@implementation PLAggregateEntry

- (void)setAggregateValue:(double)a3
{
  self->_aggregateValue = a3;
}

- (void)setMatchingKeyToValue:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = (NSMutableDictionary *)a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(NSMutableDictionary *)v3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)v3 objectForKeyedSubscript:v9];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = [NSString stringWithFormat:@"'%@'", v10];
          [(NSMutableDictionary *)v3 setObject:v11 forKeyedSubscript:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  matchingKeyToValue = self->_matchingKeyToValue;
  self->_matchingKeyToValue = v3;
}

- (NSString)entryKey
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)aggregateKey
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)matchingKeyToValue
{
  return self->_matchingKeyToValue;
}

- (void)setOtherAggregateKeys:(id)a3
{
}

- (void)setAggregateKey:(id)a3
{
}

- (void)setAggregateFunction:(signed __int16)a3
{
  self->_aggregateFunction = a3;
}

- (void)setEntryKey:(id)a3
{
}

- (void)updateWithValue:(double)a3
{
  if ([(PLAggregateEntry *)self aggregateFunction])
  {
    if ([(PLAggregateEntry *)self aggregateFunction] == 2)
    {
      [(PLAggregateEntry *)self aggregateValue];
      if (v5 >= a3) {
        double v5 = a3;
      }
    }
    else
    {
      if ([(PLAggregateEntry *)self aggregateFunction] != 3) {
        return;
      }
      [(PLAggregateEntry *)self aggregateValue];
      if (v5 < a3) {
        double v5 = a3;
      }
    }
  }
  else
  {
    [(PLAggregateEntry *)self aggregateValue];
    double v5 = v6 + a3;
  }
  [(PLAggregateEntry *)self setAggregateValue:v5];
}

- (double)aggregateValue
{
  return self->_aggregateValue;
}

- (signed)aggregateFunction
{
  return self->_aggregateFunction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateKey, 0);
  objc_storeStrong((id *)&self->_otherAggregateKeys, 0);
  objc_storeStrong((id *)&self->_matchingKeyToValue, 0);
  objc_storeStrong((id *)&self->_entryKey, 0);
}

- (id)query
{
  v2 = self;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLAggregateEntry *)self matchingPairs];
  v4 = [MEMORY[0x1E4F1CA48] array];
  double v5 = [MEMORY[0x1E4F1CA48] array];
  [v4 addObject:@"ID"];
  double v6 = NSString;
  uint64_t v7 = [(PLAggregateEntry *)v2 entryKey];
  v46 = (void *)v3;
  v8 = [v6 stringWithFormat:@"(SELECT ID FROM '%@' WHERE %@)", v7, v3];
  [v5 addObject:v8];

  uint64_t v9 = [(PLAggregateEntry *)v2 matchingKeyToValue];
  v10 = [v9 allKeys];
  v11 = [v10 componentsJoinedByString:@", "];
  [v4 addObject:v11];

  v12 = [(PLAggregateEntry *)v2 matchingKeyToValue];
  v13 = [v12 allValues];
  long long v14 = [v13 componentsJoinedByString:@", "];
  [v5 addObject:v14];

  uint64_t v15 = [(PLAggregateEntry *)v2 otherAggregateKeys];
  if (v15)
  {
    long long v16 = (void *)v15;
    long long v17 = [(PLAggregateEntry *)v2 otherAggregateKeys];
    uint64_t v18 = [v17 count];

    if (v18)
    {
      v44 = v5;
      uint64_t v19 = [(PLAggregateEntry *)v2 otherAggregateKeys];
      v20 = [v19 componentsJoinedByString:@", "];
      v45 = v4;
      [v4 addObject:v20];

      v21 = [MEMORY[0x1E4F1CA48] array];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      v22 = [(PLAggregateEntry *)v2 otherAggregateKeys];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v48 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            v28 = NSString;
            [(PLAggregateEntry *)v2 entryKey];
            v30 = v29 = v2;
            v31 = [v28 stringWithFormat:@"COALESCE((SELECT %@ FROM '%@' WHERE %@),0)", v27, v30, v46];
            [v21 addObject:v31];

            v2 = v29;
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v24);
      }

      v32 = [v21 componentsJoinedByString:@", "];
      double v5 = v44;
      [v44 addObject:v32];

      v4 = v45;
    }
  }
  v33 = [(PLAggregateEntry *)v2 aggregateKey];
  [v4 addObject:v33];

  v34 = NSString;
  v35 = [(PLAggregateEntry *)v2 aggregateOperationWithMatchingPairs:v46];
  [(PLAggregateEntry *)v2 aggregateValue];
  v37 = [v34 stringWithFormat:@"COALESCE(%@,%f)", v35, v36];
  [v5 addObject:v37];

  v38 = NSString;
  v39 = [(PLAggregateEntry *)v2 entryKey];
  v40 = [v4 componentsJoinedByString:@", "];
  v41 = [v5 componentsJoinedByString:@", "];
  objc_msgSend(v38, "stringWithFormat:", @"            INSERT OR REPLACE INTO '%@'             (%@)             VALUES (%@);",
    v39,
    v40,
  v42 = v41);

  return v42;
}

- (id)matchingPairs
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(PLAggregateEntry *)self matchingKeyToValue];
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = NSString;
        v10 = [(PLAggregateEntry *)self matchingKeyToValue];
        v11 = [v10 objectForKeyedSubscript:v8];
        v12 = [v9 stringWithFormat:@"%@=%@", v8, v11];
        [v3 addObject:v12];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  v13 = [v3 componentsJoinedByString:@" AND "];

  return v13;
}

- (id)aggregateOperationWithMatchingPairs:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  uint64_t v6 = [(PLAggregateEntry *)self aggregateKey];
  uint64_t v7 = [(PLAggregateEntry *)self entryKey];
  uint64_t v8 = [v4 stringWithFormat:@"SELECT %@ FROM '%@' WHERE %@", v6, v7, v5];

  if (![(PLAggregateEntry *)self aggregateFunction])
  {
    uint64_t v9 = @"%f+(%@)";
    goto LABEL_7;
  }
  if ([(PLAggregateEntry *)self aggregateFunction] == 2)
  {
    uint64_t v9 = @"MIN(%f,%@)";
LABEL_7:
    v10 = NSString;
    [(PLAggregateEntry *)self aggregateValue];
    v12 = objc_msgSend(v10, "stringWithFormat:", v9, v11, v8);
    goto LABEL_8;
  }
  if ([(PLAggregateEntry *)self aggregateFunction] == 3)
  {
    uint64_t v9 = @"MAX(%f,%@)";
    goto LABEL_7;
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(PLAggregateEntry *)self entryKey];
  id v5 = [(PLAggregateEntry *)self matchingPairs];
  uint64_t v6 = [(PLAggregateEntry *)self aggregateKey];
  [(PLAggregateEntry *)self aggregateValue];
  uint64_t v8 = [v3 stringWithFormat:@"entryKey=%@, matchingPairs=%@, aggregateKey=%@, aggregateValue=%f", v4, v5, v6, v7];

  return v8;
}

- (NSArray)otherAggregateKeys
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

@end