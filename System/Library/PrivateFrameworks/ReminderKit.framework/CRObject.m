@interface CRObject
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (id)CRProperties;
+ (id)keyFromSelector:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (CRObject)init;
- (CRObject)initWithCRCoder:(id)a3;
- (CRObject)initWithIdentity:(id)a3 fields:(id)a4;
- (NSDictionary)fields;
- (NSString)description;
- (NSUUID)identity;
- (id)deltaSince:(id)a3 in:(id)a4;
- (id)tombstone;
- (unint64_t)hash;
- (void)encodeWithCRCoder:(id)a3;
- (void)mergeWith:(id)a3;
- (void)mergeWithObject:(id)a3;
- (void)setDocument:(id)a3;
- (void)setFieldKey:(id)a3 value:(id)a4;
- (void)setupConstraintsFor:(id)a3 in:(id)a4;
- (void)walkGraph:(id)a3;
@end

@implementation CRObject

- (CRObject)init
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() CRProperties];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v10 = [v4 objectForKeyedSubscript:v9];
        if ([v10 isEqual:CRPropertyRegisterLatest])
        {
          v11 = +[CRRegister registerWithType:0 contents:0];
LABEL_10:
          v12 = v11;
          [v3 setObject:v11 forKeyedSubscript:v9];

          goto LABEL_12;
        }
        if ([v10 isEqual:CRPropertySet])
        {
          v11 = objc_alloc_init(CRSet);
          goto LABEL_10;
        }
        [v3 setObject:v10 forKeyedSubscript:v9];
LABEL_12:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  [(CRObject *)self setupConstraintsFor:v4 in:v3];
  v13 = [MEMORY[0x1E4F29128] UUID];
  v14 = [(CRObject *)self initWithIdentity:v13 fields:v3];

  return v14;
}

- (CRObject)initWithIdentity:(id)a3 fields:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRObject;
  uint64_t v9 = [(CRObject *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a3);
    objc_storeStrong((id *)&v10->_fields, a4);
  }

  return v10;
}

- (CRObject)initWithCRCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeUUIDForKey:@"identity"];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = [(id)objc_opt_class() CRProperties];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v13 = [v4 decodeObjectForKey:v12];
        [v6 setObject:v13 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  [(CRObject *)self setupConstraintsFor:v7 in:v6];
  v14 = [(CRObject *)self initWithIdentity:v5 fields:v6];
  if (v14)
  {
    v15 = [v4 document];
    v16 = [v15 objects];
    long long v17 = [(CRObject *)v14 identity];
    [v16 setObject:v14 forKeyedSubscript:v17];
  }
  return v14;
}

- (void)encodeWithCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRObject *)self identity];
  [v4 encodeUUID:v5 forKey:@"identity"];

  id v6 = [(CRObject *)self fields];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__CRObject_encodeWithCRCoder___block_invoke;
  v8[3] = &unk_1E61DE4B0;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

uint64_t __30__CRObject_encodeWithCRCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) encodeObject:a3 forKey:a2];
}

- (void)setupConstraintsFor:(id)a3 in:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 objectAtIndexedSubscript:0];
          [v10 isEqual:CRPropertyOneOfKey];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

+ (id)CRProperties
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (void)setFieldKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CRObject *)self fields];
  id v9 = (NSDictionary *)[v8 mutableCopy];

  [(NSDictionary *)v9 setObject:v6 forKeyedSubscript:v7];
  fields = self->_fields;
  self->_fields = v9;
}

- (void)mergeWith:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], @"Invalid CRObject merge, classes must be equal for merge.", 0 reason userInfo];
      objc_exception_throw(v4);
    }
    [(CRObject *)self mergeWithObject:v5];
  }
}

- (void)mergeWithObject:(id)a3
{
  id v4 = [a3 fields];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__CRObject_mergeWithObject___block_invoke;
  v5[3] = &unk_1E61DE4B0;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __28__CRObject_mergeWithObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = [v4 fields];
  id v7 = [v8 objectForKeyedSubscript:v6];

  [v7 mergeWith:v5];
}

- (void)setDocument:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objects];
  id v6 = [(CRObject *)self identity];
  [v5 setObject:self forKeyedSubscript:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v8 = [(CRObject *)self fields];
  id v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  uint64_t v10 = [(CRObject *)self fields];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __24__CRObject_setDocument___block_invoke;
  v15[3] = &unk_1E61DE4D8;
  id v16 = v4;
  long long v11 = v9;
  long long v17 = v11;
  id v12 = v4;
  [v10 enumerateKeysAndObjectsUsingBlock:v15];

  fields = self->_fields;
  self->_fields = v11;
  long long v14 = v11;
}

void __24__CRObject_setDocument___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 localObject:a3];
  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v6];

  [v7 setDocument:*(void *)(a1 + 32)];
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = [(CRObject *)self fields];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __26__CRObject_deltaSince_in___block_invoke;
  v17[3] = &unk_1E61DE500;
  id v18 = v6;
  id v19 = v7;
  id v10 = v8;
  id v20 = v10;
  id v11 = v7;
  id v12 = v6;
  [v9 enumerateKeysAndObjectsUsingBlock:v17];

  if ([v10 count])
  {
    id v13 = objc_alloc((Class)objc_opt_class());
    long long v14 = [(CRObject *)self identity];
    v15 = (void *)[v13 initWithIdentity:v14 fields:v10];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __26__CRObject_deltaSince_in___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = [a3 deltaSince:*(void *)(a1 + 32) in:*(void *)(a1 + 40)];
  if (v5) {
    [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:v6];
  }
}

- (void)walkGraph:(id)a3
{
  id v4 = a3;
  id v5 = [(CRObject *)self fields];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __22__CRObject_walkGraph___block_invoke;
  v7[3] = &unk_1E61DE528;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __22__CRObject_walkGraph___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)tombstone
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id v4 = [(CRObject *)self identity];
  id v5 = (void *)[v3 initWithIdentity:v4 fields:MEMORY[0x1E4F1CC08]];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(CRObject *)self identity];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(CRObject *)self identity];
    id v6 = [v4 identity];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  unint64_t v3 = [(CRObject *)self fields];
  uint64_t v4 = [v3 count];

  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  char v7 = NSStringFromClass(v6);
  id v8 = [(CRObject *)self identity];
  uint64_t v9 = objc_msgSend(v8, "CR_shortDescription");
  id v10 = (void *)v9;
  if (v4)
  {
    id v11 = [(CRObject *)self fields];
    id v12 = [v5 stringWithFormat:@"<%@ %p %@ %@>", v7, self, v10, v11];
  }
  else
  {
    id v12 = [v5 stringWithFormat:@"<%@ %p %@>", v7, self, v9];
  }

  return (NSString *)v12;
}

+ (id)keyFromSelector:(SEL)a3
{
  unint64_t v3 = NSStringFromSelector(a3);
  if ([v3 hasPrefix:@"set"])
  {
    uint64_t v4 = objc_msgSend(v3, "substringWithRange:", 3, objc_msgSend(v3, "length") - 4);

    id v5 = [v4 substringToIndex:1];
    id v6 = [v5 lowercaseString];
    char v7 = [v4 substringFromIndex:1];
    unint64_t v3 = [v6 stringByAppendingString:v7];
  }

  return v3;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  id v5 = +[CRObject keyFromSelector:](CRObject, "keyFromSelector:");
  if (v5
    && ([a1 CRProperties],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 objectForKey:v5],
        char v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    id v8 = NSStringFromSelector(a3);
    int v9 = [v8 hasPrefix:@"set"];

    id v10 = (objc_class *)objc_opt_class();
    if (v9)
    {
      id v11 = "v@:@";
      id v12 = (void (*)(void))setPropertyIMP;
    }
    else
    {
      id v11 = "@@:";
      id v12 = (void (*)(void))propertyIMP;
    }
    class_addMethod(v10, a3, v12, v11);
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (NSUUID)identity
{
  return self->_identity;
}

- (NSDictionary)fields
{
  return self->_fields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

@end