@interface STRPPropertyListTypeEncoder
- (BOOL)allowsKeyedCoding;
- (STRPPropertyListTypeEncoder)init;
- (id)_encodeRawObject:(id)a3;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5;
- (void)encodeConditionalObject:(id)a3 forKey:(id)a4;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeFloat:(float)a3 forKey:(id)a4;
- (void)encodeInt32:(int)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeInt:(int)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3 forKey:(id)a4;
@end

@implementation STRPPropertyListTypeEncoder

- (STRPPropertyListTypeEncoder)init
{
  v6.receiver = self;
  v6.super_class = (Class)STRPPropertyListTypeEncoder;
  v2 = [(STRPPropertyListTypeEncoder *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    storage = v2->_storage;
    v2->_storage = v3;
  }
  return v2;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if ([v6 conformsToProtocol:&unk_2708E37B8])
    {
      v8 = [(STRPPropertyListTypeEncoder *)self _encodeRawObject:v6];
      [(NSMutableDictionary *)self->_storage setObject:v8 forKey:v7];
    }
    else
    {
      v9 = STRPLogCoding();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[STRPPropertyListTypeEncoder encodeObject:forKey:]((uint64_t)v7, v9);
      }
    }
  }
}

- (void)encodeConditionalObject:(id)a3 forKey:(id)a4
{
  id v4 = a4;
  v5 = STRPLogCoding();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[STRPPropertyListTypeEncoder encodeConditionalObject:forKey:]((uint64_t)v4, v5);
  }
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  storage = self->_storage;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(NSMutableDictionary *)storage setObject:v8 forKey:v7];
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  storage = self->_storage;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInt:v4];
  [(NSMutableDictionary *)storage setObject:v8 forKey:v7];
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  storage = self->_storage;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInt:v4];
  [(NSMutableDictionary *)storage setObject:v8 forKey:v7];
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  storage = self->_storage;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithLongLong:a3];
  [(NSMutableDictionary *)storage setObject:v8 forKey:v7];
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  storage = self->_storage;
  id v6 = NSNumber;
  id v7 = a4;
  *(float *)&double v8 = a3;
  id v9 = [v6 numberWithFloat:v8];
  [(NSMutableDictionary *)storage setObject:v9 forKey:v7];
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  storage = self->_storage;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithDouble:a3];
  [(NSMutableDictionary *)storage setObject:v8 forKey:v7];
}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  id v8 = (void *)MEMORY[0x263EFF8F8];
  id v9 = a5;
  id v10 = [v8 dataWithBytes:a3 length:a4];
  [(NSMutableDictionary *)self->_storage setObject:v10 forKey:v9];
}

- (id)_encodeRawObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
LABEL_6:
    id v6 = v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 UUIDString];
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = NSNumber;
    [v4 timeIntervalSinceReferenceDate];
    objc_msgSend(v8, "numberWithDouble:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v4;
    uint64_t v10 = [v9 count];
    id v6 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v10];
    if (v10)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        v12 = [v9 objectAtIndexedSubscript:i];
        v13 = [(STRPPropertyListTypeEncoder *)self _encodeRawObject:v12];
        [v6 setObject:v13 atIndexedSubscript:i];
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v4;
      uint64_t v15 = [v14 count];
      v16 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v15];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __48__STRPPropertyListTypeEncoder__encodeRawObject___block_invoke;
      v19[3] = &unk_265492B68;
      id v17 = v16;
      id v20 = v17;
      v21 = self;
      [v14 enumerateKeysAndObjectsUsingBlock:v19];

      id v6 = v17;
    }
    else
    {
      v18 = (id *)objc_alloc_init((Class)objc_opt_class());
      [v4 encodeWithCoder:v18];
      id v6 = (id)[v18[1] copy];
    }
  }
LABEL_7:

  return v6;
}

void __48__STRPPropertyListTypeEncoder__encodeRawObject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 _encodeRawObject:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (void).cxx_destruct
{
}

- (void)encodeObject:(uint64_t)a1 forKey:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_25B107000, a2, OS_LOG_TYPE_FAULT, "Must conform to secure coding. key='%{public}@'", (uint8_t *)&v2, 0xCu);
}

- (void)encodeConditionalObject:(uint64_t)a1 forKey:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_25B107000, a2, OS_LOG_TYPE_FAULT, "-encodeConditionalObject: is not supported. key='%{public}@'", (uint8_t *)&v2, 0xCu);
}

@end