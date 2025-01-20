@interface REMStoreInvocationValueStorage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSMutableDictionary)valueStorage;
- (REMStoreInvocationValueStorage)init;
- (REMStoreInvocationValueStorage)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)storedPropertyForKey:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setValueStorage:(id)a3;
- (void)storeProperty:(id)a3 forKey:(id)a4;
@end

@implementation REMStoreInvocationValueStorage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMStoreInvocationValueStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)REMStoreInvocationValueStorage;
  v2 = [(REMStoreInvocationValueStorage *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    valueStorage = v2->_valueStorage;
    v2->_valueStorage = v3;
  }
  return v2;
}

- (REMStoreInvocationValueStorage)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMStoreInvocationValueStorage;
  v5 = [(REMStoreInvocationValueStorage *)&v9 init];
  if (v5)
  {
    if (initWithCoder__onceToken != -1) {
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_39);
    }
    uint64_t v6 = [v4 decodeObjectOfClasses:initWithCoder____sClasses forKey:@"valueStorage"];
    valueStorage = v5->_valueStorage;
    v5->_valueStorage = (NSMutableDictionary *)v6;
  }
  return v5;
}

uint64_t __48__REMStoreInvocationValueStorage_initWithCoder___block_invoke()
{
  v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v16, v15, v14, v13, v12, v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(),
  initWithCoder____sClasses = 0);

  return MEMORY[0x1F41817F8]();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMStoreInvocationValueStorage *)self valueStorage];
  [v4 encodeObject:v5 forKey:@"valueStorage"];
}

- (void)storeProperty:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(REMStoreInvocationValueStorage *)self valueStorage];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (id)storedPropertyForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(REMStoreInvocationValueStorage *)self valueStorage];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  id v6 = [(REMStoreInvocationValueStorage *)self valueStorage];
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setValueStorage:v7];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 valueStorage];
    uint64_t v6 = [(REMStoreInvocationValueStorage *)self valueStorage];
    if (v5 == (void *)v6)
    {
      char v10 = 1;
      id v7 = v5;
    }
    else
    {
      id v7 = (void *)v6;
      id v8 = [v4 valueStorage];
      uint64_t v9 = [(REMStoreInvocationValueStorage *)self valueStorage];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  id v4 = [(REMStoreInvocationValueStorage *)self valueStorage];
  unint64_t v5 = v3 ^ [v4 hash] ^ 0x1F;

  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(REMStoreInvocationValueStorage *)self valueStorage];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p valueStorage: %@>", v4, self, v5];

  return v6;
}

- (NSMutableDictionary)valueStorage
{
  return self->_valueStorage;
}

- (void)setValueStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end