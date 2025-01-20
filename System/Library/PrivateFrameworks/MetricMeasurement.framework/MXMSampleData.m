@interface MXMSampleData
+ (BOOL)supportsSecureCoding;
+ (id)data;
- (MXMSampleData)init;
- (MXMSampleData)initWithCoder:(id)a3;
- (MXMSampleData)initWithSet:(id)a3;
- (MXMSampleData)initWithSets:(id)a3;
- (NSArray)enumSet;
- (NSArray)samples;
- (NSMutableDictionary)tagsToSampleSets;
- (NSSet)tags;
- (id)_dataMatchingFilter:(id)a3;
- (id)_sampleSetsWithTag:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)sampleSetWithTag:(id)a3 attribute:(id)a4;
- (id)sampleSetWithTag:(id)a3 attributes:(id)a4;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)numberOfSamples;
- (unint64_t)numberOfSets;
- (void)_appendAttribute:(id)a3;
- (void)_appendData:(id)a3;
- (void)_appendSet:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEnumSet:(id)a3;
- (void)setTagsToSampleSets:(id)a3;
@end

@implementation MXMSampleData

- (NSSet)tags
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9C0] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(NSMutableDictionary *)self->_tagsToSampleSets allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (([v3 containsObject:v9] & 1) == 0) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (NSArray)samples
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = [(MXMSampleData *)self tags];
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v9 = [(MXMSampleData *)self sampleSetsWithTag:v8];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v18 != v12) {
                objc_enumerationMutation(v9);
              }
              long long v14 = [*(id *)(*((void *)&v17 + 1) + 8 * j) samples];
              [v3 addObjectsFromArray:v14];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v11);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (unint64_t)numberOfSets
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(MXMSampleData *)self tags];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [(NSMutableDictionary *)self->_tagsToSampleSets objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        v6 += [v9 count];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)numberOfSamples
{
  v2 = [(MXMSampleData *)self samples];
  unint64_t v3 = [v2 count];

  return v3;
}

+ (id)data
{
  v2 = (void *)[objc_alloc((Class)a1) init];
  return v2;
}

- (MXMSampleData)init
{
  v5.receiver = self;
  v5.super_class = (Class)MXMSampleData;
  v2 = [(MXMSampleData *)&v5 init];
  if (v2)
  {
    unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    [(MXMSampleData *)v2 setTagsToSampleSets:v3];

    [(MXMSampleData *)v2 setEnumSet:0];
  }
  return v2;
}

- (MXMSampleData)initWithSet:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v9 = a3;
  uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  unint64_t v6 = [v4 arrayWithObjects:&v9 count:1];

  uint64_t v7 = -[MXMSampleData initWithSets:](self, "initWithSets:", v6, v9, v10);
  return v7;
}

- (MXMSampleData)initWithSets:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MXMSampleData *)self init];
  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
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
          -[MXMSampleData _appendSet:](v5, "_appendSet:", *(void *)(*((void *)&v12 + 1) + 8 * v10++), (void)v12);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (id)sampleSetWithTag:(id)a3 attribute:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a3;
  uint64_t v8 = [v6 setWithObject:a4];
  uint64_t v9 = [(MXMSampleData *)self sampleSetWithTag:v7 attributes:v8];

  return v9;
}

- (id)sampleSetWithTag:(id)a3 attributes:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [(MXMSampleData *)self sampleSetsWithTag:a3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v13 = objc_msgSend(v12, "attributes", (void)v18);
        if ([v6 isEqualToSet:v13])
        {

LABEL_13:
          id v16 = v12;
          goto LABEL_14;
        }
        long long v14 = [v12 attributes];
        char v15 = [v6 isSubsetOfSet:v14];

        if (v15) {
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      id v16 = 0;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v16 = 0;
  }
LABEL_14:

  return v16;
}

- (id)_sampleSetsWithTag:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_tagsToSampleSets objectForKeyedSubscript:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MXMSampleData)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MXMSampleData;
  id v5 = [(MXMSampleData *)&v14 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"tagsToSampleSets"];
    tagsToSampleSets = v5->_tagsToSampleSets;
    v5->_tagsToSampleSets = (NSMutableDictionary *)v11;
  }
  return v5;
}

- (id)copy
{
  return [(MXMSampleData *)self copyWithZone:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MXMSampleData alloc];
  id v5 = [(NSMutableDictionary *)self->_tagsToSampleSets allValues];
  id v6 = [v5 flattenArray];
  uint64_t v7 = [(MXMSampleData *)v4 initWithSets:v6];

  return v7;
}

- (id)mutableCopy
{
  return [(MXMSampleData *)self mutableCopyWithZone:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [MXMMutableSampleData alloc];
  id v5 = [(NSMutableDictionary *)self->_tagsToSampleSets allValues];
  id v6 = [v5 flattenArray];
  uint64_t v7 = [(MXMSampleData *)v4 initWithSets:v6];

  return v7;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v9 = [(MXMSampleData *)self enumSet];

  if (!v9)
  {
    long long v24 = a4;
    unint64_t v25 = a5;
    uint64_t v10 = [MEMORY[0x263EFF980] array];
    enumSet = self->_enumSet;
    self->_enumSet = v10;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v12 = [(MXMSampleData *)self tags];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * v16);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v18 = [(MXMSampleData *)self sampleSetsWithTag:v17];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v27;
            do
            {
              uint64_t v22 = 0;
              do
              {
                if (*(void *)v27 != v21) {
                  objc_enumerationMutation(v18);
                }
                [(NSArray *)self->_enumSet addObject:*(void *)(*((void *)&v26 + 1) + 8 * v22++)];
              }
              while (v20 != v22);
              uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v20);
          }

          ++v16;
        }
        while (v16 != v14);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v14);
    }

    a4 = v24;
    a5 = v25;
  }
  return [(NSArray *)self->_enumSet countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void)_appendAttribute:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NSMutableDictionary *)self->_tagsToSampleSets allValues];
  id v6 = [v5 flattenArray];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) appendAttribute:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_appendSet:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = (id)[v4 mutableCopy];
  }
  id v6 = v5;
  tagsToSampleSets = self->_tagsToSampleSets;
  uint64_t v8 = [v4 tag];
  uint64_t v9 = [(NSMutableDictionary *)tagsToSampleSets objectForKeyedSubscript:v8];

  if (v9)
  {
    long long v27 = v6;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v10 = self->_tagsToSampleSets;
    long long v11 = [v4 tag];
    long long v12 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v11];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v18 = [v17 attributes];
          uint64_t v19 = [v4 attributes];
          int v20 = [v18 isEqualToSet:v19];

          if (v20)
          {
            [v17 appendSet:v4];

            id v6 = v27;
            goto LABEL_17;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    uint64_t v21 = self->_tagsToSampleSets;
    uint64_t v22 = [v4 tag];
    uint64_t v23 = [(NSMutableDictionary *)v21 objectForKeyedSubscript:v22];
    id v6 = v27;
    [v23 addObject:v27];
  }
  else
  {
    long long v24 = [MEMORY[0x263EFF980] arrayWithObject:v6];
    unint64_t v25 = self->_tagsToSampleSets;
    long long v26 = [v4 tag];
    [(NSMutableDictionary *)v25 setObject:v24 forKeyedSubscript:v26];
  }
  [(MXMSampleData *)self setEnumSet:0];
LABEL_17:
}

- (void)_appendData:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a3)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = [*((id *)a3 + 2) allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v16;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v16 != v13) {
                  objc_enumerationMutation(v10);
                }
                [(MXMSampleData *)self _appendSet:*(void *)(*((void *)&v15 + 1) + 8 * v14++)];
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v6);
    }
  }
}

- (id)_dataMatchingFilter:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(MXMSampleData *)self samples];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ([v4 matchesSample:v11]) {
          id v12 = (id)[v5 appendSample:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (NSArray)enumSet
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEnumSet:(id)a3
{
}

- (NSMutableDictionary)tagsToSampleSets
{
  return self->_tagsToSampleSets;
}

- (void)setTagsToSampleSets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagsToSampleSets, 0);
  objc_storeStrong((id *)&self->_enumSet, 0);
}

@end