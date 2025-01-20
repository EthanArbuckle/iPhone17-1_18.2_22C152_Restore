@interface TrimmedMean
- (TrimmedMean)initWithSize:(unint64_t)a3 withTrimAt:(float)a4;
- (float)getTrimmedMean;
- (void)add:(id)a3;
@end

@implementation TrimmedMean

- (TrimmedMean)initWithSize:(unint64_t)a3 withTrimAt:(float)a4
{
  v11.receiver = self;
  v11.super_class = (Class)TrimmedMean;
  v6 = [(TrimmedMean *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_arraySize = a3;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    values = v7->_values;
    v7->_values = v8;

    v7->_currentAverage = 0.0;
    v7->_trimAt = a4;
  }
  return v7;
}

- (void)add:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_values count] == self->_arraySize) {
    [(NSMutableArray *)self->_values removeLastObject];
  }
  [(NSMutableArray *)self->_values insertObject:v4 atIndex:0];
}

- (float)getTrimmedMean
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = self->_values;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObjectsFromArray:*(void *)(*((void *)&v26 + 1) + 8 * i)];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"self" ascending:1];
  v10 = [MEMORY[0x263EFF8C0] arrayWithObject:v9];
  [v3 sortUsingDescriptors:v10];

  objc_super v11 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", (int)(float)(self->_trimAt * (float)(unint64_t)objc_msgSend(v3, "count")), objc_msgSend(v3, "count") - (int)(float)(self->_trimAt * (float)(unint64_t)objc_msgSend(v3, "count")));
  [v3 removeObjectsAtIndexes:v11];

  if ([v3 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v3;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      double v16 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * j) doubleValue:v22];
          double v16 = v16 + v18;
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v14);
      float v19 = v16;
    }
    else
    {
      float v19 = 0.0;
    }

    float v20 = v19 / (float)(unint64_t)[v12 count];
  }
  else
  {
    float v20 = 0.0;
  }

  return v20;
}

- (void).cxx_destruct
{
}

@end