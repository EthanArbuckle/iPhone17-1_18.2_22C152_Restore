@interface MTStorageWriter
- (MTStorageWriter)init;
- (NSMutableArray)stack;
- (id)_dictionaryForProtocolObject:(id)a3;
- (id)_serializingProtocol;
- (id)encodedDictionary;
- (unint64_t)mtType;
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
- (void)setStack:(id)a3;
@end

@implementation MTStorageWriter

- (unint64_t)mtType
{
  return 2;
}

- (MTStorageWriter)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTStorageWriter;
  v2 = [(MTStorageWriter *)&v8 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F1CA48];
    v4 = objc_opt_new();
    uint64_t v5 = [v3 arrayWithObject:v4];
    stack = v2->_stack;
    v2->_stack = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)_encodeObject:(id)a3 forKey:(id)a4
{
  stack = self->_stack;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSMutableArray *)stack lastObject];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(MTStorageWriter *)self _encodeObject:v8 forKey:v7];
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [(MTStorageWriter *)self _encodeObject:v8 forKey:v7];
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithInt:v4];
  [(MTStorageWriter *)self _encodeObject:v8 forKey:v7];
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithInt:v4];
  [(MTStorageWriter *)self _encodeObject:v8 forKey:v7];
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithLongLong:a3];
  [(MTStorageWriter *)self _encodeObject:v8 forKey:v7];
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  *(float *)&double v8 = a3;
  id v9 = [v6 numberWithFloat:v8];
  [(MTStorageWriter *)self _encodeObject:v9 forKey:v7];
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithDouble:a3];
  [(MTStorageWriter *)self _encodeObject:v8 forKey:v7];
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v34 = v6;
    id v8 = v6;
    id v9 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v40 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v16 = [(MTStorageWriter *)self _serializingProtocol];
          int v17 = [v15 conformsToProtocol:v16];

          if (v17)
          {
            v18 = [(MTStorageWriter *)self _dictionaryForProtocolObject:v15];
            [v9 addObject:v18];
          }
          else
          {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v12);
    }

    v19 = self;
    v20 = v9;
LABEL_25:
    -[MTStorageWriter _encodeObject:forKey:](v19, "_encodeObject:forKey:", v20, v7, v33);

    id v6 = v34;
    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = v7;
    id v34 = v6;
    id v21 = v6;
    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v10 = v21;
    uint64_t v22 = [v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v10);
          }
          uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 8 * j);
          v27 = objc_msgSend(v10, "objectForKeyedSubscript:", v26, v33);
          v28 = [(MTStorageWriter *)self _serializingProtocol];
          int v29 = [v27 conformsToProtocol:v28];

          if (v29)
          {
            v30 = [(MTStorageWriter *)self _dictionaryForProtocolObject:v27];
            [v9 setObject:v30 forKeyedSubscript:v26];
          }
          else
          {
            [v9 setObject:v27 forKeyedSubscript:v26];
          }
        }
        uint64_t v23 = [v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v23);
    }

    v19 = self;
    v20 = v9;
    id v7 = v33;
    goto LABEL_25;
  }
  v31 = [(MTStorageWriter *)self _serializingProtocol];
  int v32 = [v6 conformsToProtocol:v31];

  if (v32) {
    [(MTStorageWriter *)self _encodeProtocolObject:v6 forKey:v7];
  }
  else {
    [(MTStorageWriter *)self _encodeObject:v6 forKey:v7];
  }
LABEL_26:
}

- (void)_encodeProtocolObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [(MTStorageWriter *)self _dictionaryForProtocolObject:a3];
  [(MTStorageWriter *)self _encodeObject:v7 forKey:v6];
}

- (id)_serializingProtocol
{
  return &unk_1EEE20F78;
}

- (id)_dictionaryForProtocolObject:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  uint64_t v5 = objc_opt_new();
  id v6 = objc_opt_new();
  [(NSMutableArray *)self->_stack addObject:v6];
  [v4 encodeWithCoder:self];
  [(NSMutableArray *)self->_stack removeLastObject];
  id v7 = NSString;
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  id v10 = [v7 stringWithFormat:@"%@%@", @"$", v9];

  [v5 setObject:v6 forKeyedSubscript:v10];
  return v5;
}

- (id)encodedDictionary
{
  v2 = [(NSMutableArray *)self->_stack lastObject];
  v3 = (void *)[v2 copy];

  return v3;
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