@interface TLKKeyValueTuple
+ (id)tupleWithKey:(id)a3 value:(id)a4;
+ (id)tuplesForDictionary:(id)a3;
+ (id)tuplesForKeys:(id)a3 values:(id)a4;
- (NSString)key;
- (NSString)value;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation TLKKeyValueTuple

- (void)setKey:(id)a3
{
  v10 = (NSString *)a3;
  if (self->_key != v10)
  {
    objc_storeStrong((id *)&self->_key, a3);
    uint64_t v5 = [(TLKObject *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(TLKObject *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        v9 = [(TLKObject *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setValue:(id)a3
{
  v10 = (NSString *)a3;
  if (self->_value != v10)
  {
    objc_storeStrong((id *)&self->_value, a3);
    uint64_t v5 = [(TLKObject *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(TLKObject *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        v9 = [(TLKObject *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

+ (id)tupleWithKey:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(TLKKeyValueTuple);
  [(TLKKeyValueTuple *)v7 setKey:v6];

  [(TLKKeyValueTuple *)v7 setValue:v5];
  return v7;
}

+ (id)tuplesForDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v3 valueForKey:v10];
        v12 = +[TLKKeyValueTuple tupleWithKey:v10 value:v11];
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v13 = (void *)[v4 copy];
  return v13;
}

+ (id)tuplesForKeys:(id)a3 values:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  if ([v5 count])
  {
    unint64_t v8 = 0;
    do
    {
      v9 = [v5 objectAtIndexedSubscript:v8];
      uint64_t v10 = [v6 objectAtIndexedSubscript:v8];
      v11 = +[TLKKeyValueTuple tupleWithKey:v9 value:v10];
      [v7 addObject:v11];

      ++v8;
    }
    while (v8 < [v5 count]);
  }
  v12 = (void *)[v7 copy];

  return v12;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end