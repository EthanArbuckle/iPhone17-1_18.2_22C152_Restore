@interface REExportedDictionaryValue
- (REExportedDictionaryValue)initWithDictionary:(id)a3;
- (id)dictionaryValue;
- (id)exportedValueForKey:(id)a3;
- (unint64_t)propertyCount;
- (unint64_t)type;
- (void)enumerateValuesUsingBlock:(id)a3;
@end

@implementation REExportedDictionaryValue

- (REExportedDictionaryValue)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REExportedDictionaryValue;
  v6 = [(REExportedDictionaryValue *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dictionary, a3);
  }

  return v7;
}

- (id)dictionaryValue
{
  return self->_dictionary;
}

- (unint64_t)propertyCount
{
  return [(NSDictionary *)self->_dictionary count];
}

- (unint64_t)type
{
  return 1;
}

- (void)enumerateValuesUsingBlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_dictionary allKeys];
    v6 = (void *)[v5 mutableCopy];

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __55__REExportedDictionaryValue_enumerateValuesUsingBlock___block_invoke_2;
    v19[3] = &unk_2644BD700;
    id v20 = &__block_literal_global_72;
    [v6 sortUsingComparator:v19];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v13 = -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", v12, (void)v15);
          v14 = __55__REExportedDictionaryValue_enumerateValuesUsingBlock___block_invoke((uint64_t)v13, v12);
          v4[2](v4, v14, v13);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v9);
    }
  }
}

id __55__REExportedDictionaryValue_enumerateValuesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [v2 description];
  }
  v4 = v3;

  return v4;
}

uint64_t __55__REExportedDictionaryValue_enumerateValuesUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a3;
  uint64_t v8 = v6(v5, a2);
  uint64_t v9 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  uint64_t v10 = [v8 compare:v9];
  return v10;
}

- (id)exportedValueForKey:(id)a3
{
  id v3 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:a3];
  v4 = +[REExportedValue exportedValueForObject:v3];

  return v4;
}

- (void).cxx_destruct
{
}

@end