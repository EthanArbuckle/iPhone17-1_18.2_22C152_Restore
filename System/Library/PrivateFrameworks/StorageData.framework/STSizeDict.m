@interface STSizeDict
- (NSDictionary)dictionary;
- (STSizeDict)init;
- (STSizeDict)initWithDictionary:(id)a3;
- (STSizeVector)total;
- (id)get:(id)a3;
- (id)plus:(id)a3;
- (id)remapKeys:(id)a3 removeMissing:(BOOL)a4;
@end

@implementation STSizeDict

- (STSizeDict)init
{
  v6.receiver = self;
  v6.super_class = (Class)STSizeDict;
  v2 = [(STSizeDict *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    dictionary = v2->_dictionary;
    v2->_dictionary = (NSDictionary *)v3;
  }
  return v2;
}

- (STSizeDict)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSizeDict;
  objc_super v6 = [(STSizeDict *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dictionary, a3);
  }

  return v7;
}

- (id)remapKeys:(id)a3 removeMissing:(BOOL)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = objc_alloc_init(STMutableSizeDict);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = self->_dictionary;
  uint64_t v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v13, (void)v17);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        if (!v14 && !a4) {
          id v14 = v13;
        }
        if (v14)
        {
          v15 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:v13];
          [(STMutableSizeDict *)v7 addSize:v15 toKey:v14];
        }
      }
      uint64_t v10 = [(NSDictionary *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (STSizeVector)total
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(STSizeDict *)self dictionary];
  uint64_t v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v8 += [v11 fixed];
        v6 += [v11 docsAndData];
        v7 += [v11 purgeable];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }

  v12 = +[STSizeVector fixed:v8 docsAndData:v6 purgeable:v7];

  return (STSizeVector *)v12;
}

- (id)plus:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(STMutableSizeDict);
  [(STMutableSizeDict *)v5 plusEquals:self];
  [(STMutableSizeDict *)v5 plusEquals:v4];

  return v5;
}

- (id)get:(id)a3
{
  uint64_t v3 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[STSizeVector zero];
  }
  uint64_t v6 = v5;

  return v6;
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end