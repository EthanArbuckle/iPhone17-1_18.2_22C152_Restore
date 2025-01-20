@interface MTStorageReader
+ (BOOL)_dictionaryIsForSerializableObject:(id)a3;
+ (id)_unwrap:(id)a3;
- (BOOL)allowsKeyedCoding;
- (BOOL)decodeBoolForKey:(id)a3;
- (MTStorageReader)initWithEncodedDictionary:(id)a3;
- (NSMutableArray)stack;
- (double)decodeDoubleForKey:(id)a3;
- (float)decodeFloatForKey:(id)a3;
- (id)_decodeObject:(id)a3;
- (id)_objectForDictionary:(id)a3;
- (id)decodeObjectForKey:(id)a3;
- (int)decodeInt32ForKey:(id)a3;
- (int)decodeIntForKey:(id)a3;
- (int64_t)decodeInt64ForKey:(id)a3;
- (int64_t)decodeIntegerForKey:(id)a3;
- (unint64_t)mtType;
- (void)setStack:(id)a3;
@end

@implementation MTStorageReader

- (unint64_t)mtType
{
  return 3;
}

- (MTStorageReader)initWithEncodedDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTStorageReader;
  v5 = [(MTStorageReader *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithObject:v4];
    stack = v5->_stack;
    v5->_stack = (NSMutableArray *)v6;
  }
  return v5;
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
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  LOBYTE(v4) = [v6 BOOLValue];
  return (char)v4;
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  stack = self->_stack;
  id v4 = a3;
  v5 = [(NSMutableArray *)stack lastObject];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  int64_t v7 = [v6 integerValue];
  return v7;
}

- (int)decodeIntForKey:(id)a3
{
  stack = self->_stack;
  id v4 = a3;
  v5 = [(NSMutableArray *)stack lastObject];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  LODWORD(v4) = [v6 intValue];
  return (int)v4;
}

- (int)decodeInt32ForKey:(id)a3
{
  stack = self->_stack;
  id v4 = a3;
  v5 = [(NSMutableArray *)stack lastObject];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  LODWORD(v4) = [v6 intValue];
  return (int)v4;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  stack = self->_stack;
  id v4 = a3;
  v5 = [(NSMutableArray *)stack lastObject];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  int64_t v7 = [v6 longLongValue];
  return v7;
}

- (float)decodeFloatForKey:(id)a3
{
  stack = self->_stack;
  id v4 = a3;
  v5 = [(NSMutableArray *)stack lastObject];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  [v6 floatValue];
  float v8 = v7;

  return v8;
}

- (double)decodeDoubleForKey:(id)a3
{
  stack = self->_stack;
  id v4 = a3;
  v5 = [(NSMutableArray *)stack lastObject];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (id)decodeObjectForKey:(id)a3
{
  stack = self->_stack;
  id v5 = a3;
  uint64_t v6 = [(NSMutableArray *)stack lastObject];
  double v7 = [v6 objectForKeyedSubscript:v5];

  double v8 = [(MTStorageReader *)self _decodeObject:v7];

  return v8;
}

- (id)_decodeObject:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v6 = v4;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_22;
    }
    double v8 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = -[MTStorageReader _decodeObject:](self, "_decodeObject:", *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23);
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v11);
    }
    goto LABEL_20;
  }
  id v5 = v4;
  if (![(id)objc_opt_class() _dictionaryIsForSerializableObject:v5])
  {
    double v8 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = v5;
    uint64_t v15 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v9);
          }
          uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * j);
          v20 = [v9 objectForKeyedSubscript:v19];
          v21 = [(MTStorageReader *)self _decodeObject:v20];
          [v8 setObject:v21 forKeyedSubscript:v19];
        }
        uint64_t v16 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v16);
    }
LABEL_20:

    id v6 = (id)[v8 copy];
    goto LABEL_21;
  }
  id v6 = [(MTStorageReader *)self _objectForDictionary:v5];
LABEL_21:

LABEL_22:
  return v6;
}

+ (BOOL)_dictionaryIsForSerializableObject:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [v3 allKeys];
    id v5 = [v4 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v3 allKeys];
      double v7 = [v6 firstObject];
      char v8 = [v7 hasPrefix:@"$"];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (id)_unwrap:(id)a3
{
  id v4 = a3;
  if ([a1 _dictionaryIsForSerializableObject:v4])
  {
    id v5 = [v4 allKeys];
    id v6 = [v5 firstObject];

    id v7 = [v4 objectForKeyedSubscript:v6];
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (id)_objectForDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allKeys];
  id v6 = [v5 firstObject];

  id v7 = [v4 objectForKeyedSubscript:v6];

  [(NSMutableArray *)self->_stack addObject:v7];
  char v8 = [v6 substringFromIndex:1];
  id v9 = (void *)[objc_alloc(NSClassFromString(v8)) initWithCoder:self];
  [(NSMutableArray *)self->_stack removeObject:v7];

  return v9;
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (void)setStack:(id)a3
{
}

- (void).cxx_destruct
{
}

@end