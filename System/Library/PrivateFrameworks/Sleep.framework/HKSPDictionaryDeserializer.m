@interface HKSPDictionaryDeserializer
- (BOOL)allowsKeyedCoding;
- (BOOL)decodeBoolForKey:(id)a3;
- (HKSPDictionaryDeserializer)initWithAllowedClasses:(id)a3 serializedDictionary:(id)a4;
- (HKSPDictionaryDeserializer)initWithAllowedClasses:(id)a3 serializedDictionary:(id)a4 serializationOptions:(unint64_t)a5;
- (NSDictionary)serializedDictionary;
- (NSMutableArray)stack;
- (NSSet)allowedClasses;
- (double)decodeDoubleForKey:(id)a3;
- (float)decodeFloatForKey:(id)a3;
- (id)_decodeDeserializable:(id)a3 error:(id *)a4;
- (id)_decodeObject:(id)a3 error:(id *)a4;
- (id)decodeObjectForKey:(id)a3;
- (id)decodeTopLevelObjectOfClass:(Class)a3 forKey:(id)a4 error:(id *)a5;
- (id)deserializeObjectOfClass:(Class)a3 error:(id *)a4;
- (int)decodeInt32ForKey:(id)a3;
- (int)decodeIntForKey:(id)a3;
- (int64_t)decodeInt64ForKey:(id)a3;
- (int64_t)decodeIntegerForKey:(id)a3;
- (unint64_t)hksp_serializationOptions;
- (unint64_t)serializationOptions;
@end

@implementation HKSPDictionaryDeserializer

- (HKSPDictionaryDeserializer)initWithAllowedClasses:(id)a3 serializedDictionary:(id)a4
{
  return [(HKSPDictionaryDeserializer *)self initWithAllowedClasses:a3 serializedDictionary:a4 serializationOptions:1];
}

- (HKSPDictionaryDeserializer)initWithAllowedClasses:(id)a3 serializedDictionary:(id)a4 serializationOptions:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HKSPDictionaryDeserializer;
  v11 = [(HKSPDictionaryDeserializer *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_allowedClasses, a3);
    objc_storeStrong((id *)&v12->_serializedDictionary, a4);
    v12->_serializationOptions = a5;
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    stack = v12->_stack;
    v12->_stack = v13;

    v15 = v12;
  }

  return v12;
}

- (id)deserializeObjectOfClass:(Class)a3 error:(id *)a4
{
  v7 = HKSPSerializableKeyForClass((uint64_t)a3);
  v8 = [(HKSPDictionaryDeserializer *)self decodeTopLevelObjectOfClass:a3 forKey:v7 error:a4];

  return v8;
}

- (id)decodeTopLevelObjectOfClass:(Class)a3 forKey:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([(NSDictionary *)self->_serializedDictionary hksp_isSerialized])
  {
    v8 = [v7 substringFromIndex:1];
    id v9 = [(NSDictionary *)self->_serializedDictionary hksp_serializedClassName];
    if ([v8 isEqualToString:v9])
    {
      id v10 = [(HKSPDictionaryDeserializer *)self _decodeObject:self->_serializedDictionary error:a5];
    }
    else
    {
      if (a5)
      {
        v12 = (void *)MEMORY[0x1E4F28C58];
        v13 = [NSString stringWithFormat:@"Unexpected class %@", v9, *MEMORY[0x1E4F28568]];
        objc_super v17 = v13;
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
        *a5 = [v12 errorWithDomain:@"com.apple.sleep.serialization" code:2 userInfo:v14];
      }
      id v10 = 0;
    }

    goto LABEL_10;
  }
  if (a5)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"Invalid serialized dictionary";
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    [v11 errorWithDomain:@"com.apple.sleep.serialization" code:1 userInfo:v8];
    id v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_11;
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  stack = self->_stack;
  id v4 = a3;
  v5 = [(NSMutableArray *)stack lastObject];
  v6 = [v5 objectForKeyedSubscript:v4];

  LOBYTE(v4) = [v6 BOOLValue];
  return (char)v4;
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  stack = self->_stack;
  id v4 = a3;
  v5 = [(NSMutableArray *)stack lastObject];
  v6 = [v5 objectForKeyedSubscript:v4];

  int64_t v7 = [v6 integerValue];
  return v7;
}

- (int)decodeIntForKey:(id)a3
{
  stack = self->_stack;
  id v4 = a3;
  v5 = [(NSMutableArray *)stack lastObject];
  v6 = [v5 objectForKeyedSubscript:v4];

  LODWORD(v4) = [v6 intValue];
  return (int)v4;
}

- (int)decodeInt32ForKey:(id)a3
{
  stack = self->_stack;
  id v4 = a3;
  v5 = [(NSMutableArray *)stack lastObject];
  v6 = [v5 objectForKeyedSubscript:v4];

  LODWORD(v4) = [v6 intValue];
  return (int)v4;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  stack = self->_stack;
  id v4 = a3;
  v5 = [(NSMutableArray *)stack lastObject];
  v6 = [v5 objectForKeyedSubscript:v4];

  int64_t v7 = [v6 longLongValue];
  return v7;
}

- (float)decodeFloatForKey:(id)a3
{
  stack = self->_stack;
  id v4 = a3;
  v5 = [(NSMutableArray *)stack lastObject];
  v6 = [v5 objectForKeyedSubscript:v4];

  [v6 floatValue];
  float v8 = v7;

  return v8;
}

- (double)decodeDoubleForKey:(id)a3
{
  stack = self->_stack;
  id v4 = a3;
  v5 = [(NSMutableArray *)stack lastObject];
  v6 = [v5 objectForKeyedSubscript:v4];

  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (id)decodeObjectForKey:(id)a3
{
  stack = self->_stack;
  id v5 = a3;
  v6 = [(NSMutableArray *)stack lastObject];
  double v7 = [v6 objectForKeyedSubscript:v5];

  double v8 = [(HKSPDictionaryDeserializer *)self _decodeObject:v7 error:0];

  return v8;
}

- (id)_decodeObject:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if (objc_msgSend(v7, "hksp_isSerialized"))
    {
      id v8 = [(HKSPDictionaryDeserializer *)self _decodeDeserializable:v7 error:a4];
    }
    else
    {
      id v27 = v6;
      objc_super v17 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v18 = v7;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            v24 = [v18 objectForKeyedSubscript:v23];
            v25 = [(HKSPDictionaryDeserializer *)self _decodeObject:v24 error:a4];
            [v17 setObject:v25 forKeyedSubscript:v23];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v20);
      }

      id v8 = (id)[v17 copy];
      id v6 = v27;
    }
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v8 = v6;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_22;
    }
    id v10 = [MEMORY[0x1E4F1CA48] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = [(HKSPDictionaryDeserializer *)self _decodeObject:*(void *)(*((void *)&v28 + 1) + 8 * j) error:a4];
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v13);
    }

    id v8 = (id)[v10 copy];
  }

LABEL_22:
  return v8;
}

- (id)_decodeDeserializable:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_msgSend(v6, "hksp_serializedKey");
  id v8 = [v6 objectForKeyedSubscript:v7];
  [(NSMutableArray *)self->_stack addObject:v8];
  objc_msgSend(v6, "hksp_serializedClassName");
  id v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  if ([(NSSet *)self->_allowedClasses containsObject:NSClassFromString(v9)])
  {
    a4 = (id *)[objc_alloc(NSClassFromString(v9)) initWithCoder:self];
    [(NSMutableArray *)self->_stack removeObject:v8];
  }
  else if (a4)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    id v11 = [NSString stringWithFormat:@"Disallowed class %@", v9, *MEMORY[0x1E4F28568]];
    v15[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    *a4 = [v10 errorWithDomain:@"com.apple.sleep.serialization" code:2 userInfo:v12];

    a4 = 0;
  }

  return a4;
}

- (unint64_t)hksp_serializationOptions
{
  return self->_serializationOptions;
}

- (NSSet)allowedClasses
{
  return self->_allowedClasses;
}

- (unint64_t)serializationOptions
{
  return self->_serializationOptions;
}

- (NSDictionary)serializedDictionary
{
  return self->_serializedDictionary;
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_serializedDictionary, 0);
  objc_storeStrong((id *)&self->_allowedClasses, 0);
}

@end