@interface HKSPDictionarySerializer
- (BOOL)allowsKeyedCoding;
- (BOOL)serialize:(id)a3 error:(id *)a4;
- (HKSPDictionarySerializer)init;
- (HKSPDictionarySerializer)initWithSerializationOptions:(unint64_t)a3;
- (NSDictionary)serializedDictionary;
- (NSError)internalError;
- (NSMutableArray)stack;
- (NSMutableSet)mutableSerializedClasses;
- (NSSet)serializedClasses;
- (id)_dictionaryForProtocolObject:(id)a3;
- (unint64_t)hksp_serializationOptions;
- (unint64_t)serializationOptions;
- (void)_encodeObject:(id)a3 forKey:(id)a4;
- (void)_encodeProtocolObject:(id)a3 forKey:(id)a4;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeFloat:(float)a3 forKey:(id)a4;
- (void)encodeInt32:(int)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeInt:(int)a3 forKey:(id)a4;
- (void)encodeInteger:(int64_t)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3 forKey:(id)a4;
- (void)encodeRootObject:(id)a3;
@end

@implementation HKSPDictionarySerializer

- (HKSPDictionarySerializer)init
{
  return [(HKSPDictionarySerializer *)self initWithSerializationOptions:1];
}

- (HKSPDictionarySerializer)initWithSerializationOptions:(unint64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)HKSPDictionarySerializer;
  v4 = [(HKSPDictionarySerializer *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->_serializationOptions = a3;
    v6 = (void *)MEMORY[0x1E4F1CA48];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = [v6 arrayWithObject:v7];
    stack = v5->_stack;
    v5->_stack = (NSMutableArray *)v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    mutableSerializedClasses = v5->_mutableSerializedClasses;
    v5->_mutableSerializedClasses = v10;

    v12 = v5;
  }

  return v5;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (BOOL)serialize:(id)a3 error:(id *)a4
{
  [(HKSPDictionarySerializer *)self encodeRootObject:a3];
  if (a4) {
    *a4 = (id)[(NSError *)self->_internalError copy];
  }
  v6 = [(HKSPDictionarySerializer *)self internalError];
  BOOL v7 = v6 == 0;

  return v7;
}

- (NSSet)serializedClasses
{
  v2 = (void *)[(NSMutableSet *)self->_mutableSerializedClasses copy];
  return (NSSet *)v2;
}

- (void)encodeRootObject:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 conformsToProtocol:&unk_1EFE6B4A8])
  {
    v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = @"Root object not serializable";
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    BOOL v7 = [v5 errorWithDomain:@"com.apple.sleep.serialization" code:3 userInfo:v6];
    internalError = self->_internalError;
    self->_internalError = v7;
  }
  if (!self->_internalError)
  {
    v9 = [(HKSPDictionarySerializer *)self _dictionaryForProtocolObject:v4];
    serializedDictionary = self->_serializedDictionary;
    self->_serializedDictionary = v9;
  }
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(HKSPDictionarySerializer *)self _encodeObject:v8 forKey:v7];
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [(HKSPDictionarySerializer *)self _encodeObject:v8 forKey:v7];
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithInt:v4];
  [(HKSPDictionarySerializer *)self _encodeObject:v8 forKey:v7];
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithInt:v4];
  [(HKSPDictionarySerializer *)self _encodeObject:v8 forKey:v7];
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithLongLong:a3];
  [(HKSPDictionarySerializer *)self _encodeObject:v8 forKey:v7];
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  *(float *)&double v8 = a3;
  id v9 = [v6 numberWithFloat:v8];
  [(HKSPDictionarySerializer *)self _encodeObject:v9 forKey:v7];
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithDouble:a3];
  [(HKSPDictionarySerializer *)self _encodeObject:v8 forKey:v7];
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    id v9 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if ([v15 conformsToProtocol:&unk_1EFE6B4A8])
          {
            v16 = [(HKSPDictionarySerializer *)self _dictionaryForProtocolObject:v15];
            [v9 addObject:v16];
          }
          else
          {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v12);
    }

    [(HKSPDictionarySerializer *)self _encodeObject:v9 forKey:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v27 = v7;
      id v28 = v6;
      id v17 = v6;
      v18 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v19 = v17;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v30 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * j);
            v25 = objc_msgSend(v19, "objectForKeyedSubscript:", v24, v27);
            if ([v25 conformsToProtocol:&unk_1EFE6B4A8])
            {
              v26 = [(HKSPDictionarySerializer *)self _dictionaryForProtocolObject:v25];
              [v18 setObject:v26 forKeyedSubscript:v24];
            }
            else
            {
              [v18 setObject:v25 forKeyedSubscript:v24];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v21);
      }

      id v7 = v27;
      [(HKSPDictionarySerializer *)self _encodeObject:v18 forKey:v27];

      id v6 = v28;
    }
    else if ([v6 conformsToProtocol:&unk_1EFE6B4A8])
    {
      [(HKSPDictionarySerializer *)self _encodeProtocolObject:v6 forKey:v7];
    }
    else
    {
      [(HKSPDictionarySerializer *)self _encodeObject:v6 forKey:v7];
    }
  }
}

- (void)_encodeProtocolObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [(HKSPDictionarySerializer *)self _dictionaryForProtocolObject:a3];
  [(HKSPDictionarySerializer *)self _encodeObject:v7 forKey:v6];
}

- (void)_encodeObject:(id)a3 forKey:(id)a4
{
  stack = self->_stack;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSMutableArray *)stack lastObject];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (id)_dictionaryForProtocolObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 copy];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(NSMutableArray *)self->_stack addObject:v7];
  [v5 encodeWithCoder:self];
  [(NSMutableArray *)self->_stack removeLastObject];
  id v8 = [NSString stringWithFormat:@"%@%@", @"$", objc_opt_class()];
  [v6 setObject:v7 forKeyedSubscript:v8];
  mutableSerializedClasses = self->_mutableSerializedClasses;
  uint64_t v10 = objc_opt_class();

  [(NSMutableSet *)mutableSerializedClasses addObject:v10];
  return v6;
}

- (unint64_t)hksp_serializationOptions
{
  return self->_serializationOptions;
}

- (NSDictionary)serializedDictionary
{
  return self->_serializedDictionary;
}

- (unint64_t)serializationOptions
{
  return self->_serializationOptions;
}

- (NSError)internalError
{
  return self->_internalError;
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (NSMutableSet)mutableSerializedClasses
{
  return self->_mutableSerializedClasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSerializedClasses, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_internalError, 0);
  objc_storeStrong((id *)&self->_serializedDictionary, 0);
}

@end