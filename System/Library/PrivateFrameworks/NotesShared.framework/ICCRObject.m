@interface ICCRObject
+ (BOOL)allowsUnknownProperties;
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (NSDictionary)CRProperties;
+ (id)keyFromSelector:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (ICCRDocument)document;
- (ICCRObject)initWithDocument:(id)a3 identity:(id)a4;
- (ICCRObject)initWithICCRCoder:(id)a3;
- (ICCRObject)initWithIdentity:(id)a3 fields:(id)a4;
- (NSDictionary)fields;
- (NSString)description;
- (NSUUID)identity;
- (id)deltaSince:(id)a3 in:(id)a4;
- (id)tombstone;
- (unint64_t)hash;
- (void)encodeWithICCRCoder:(id)a3;
- (void)mergeWith:(id)a3;
- (void)mergeWithObject:(id)a3;
- (void)setDocument:(id)a3;
- (void)setFieldKey:(id)a3 value:(id)a4;
- (void)walkGraph:(id)a3;
@end

@implementation ICCRObject

- (ICCRObject)initWithDocument:(id)a3 identity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() CRProperties];
  v9 = [(ICCRObject *)self initWithIdentity:v7 fields:v8];

  if (v9) {
    [(ICCRObject *)v9 setDocument:v6];
  }

  return v9;
}

- (ICCRObject)initWithIdentity:(id)a3 fields:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICCRObject;
  v9 = [(ICCRObject *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a3);
    objc_storeStrong((id *)&v10->_fields, a4);
  }

  return v10;
}

- (ICCRObject)initWithICCRCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(id)objc_opt_class() allowsUnknownProperties])
  {
    v5 = [v4 decodeKeys];
  }
  else
  {
    id v6 = [(id)objc_opt_class() CRProperties];
    v5 = [v6 allKeys];
  }
  id v7 = [v4 decodeUUIDForKey:@"identity"];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v15 = objc_msgSend(v4, "decodeObjectForKey:", v14, (void)v21);
        [v8 setObject:v15 forKeyedSubscript:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  v16 = [(ICCRObject *)self initWithIdentity:v7 fields:v8];
  if (v16)
  {
    v17 = [v4 document];
    v18 = [v17 objects];
    v19 = [(ICCRObject *)v16 identity];
    [v18 setObject:v16 forKeyedSubscript:v19];
  }
  return v16;
}

- (void)encodeWithICCRCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ICCRObject *)self identity];
  [v4 encodeUUID:v5 forKey:@"identity"];

  id v6 = [(ICCRObject *)self fields];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__ICCRObject_encodeWithICCRCoder___block_invoke;
  v8[3] = &unk_1E64A5C10;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

uint64_t __34__ICCRObject_encodeWithICCRCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) encodeObject:a3 forKey:a2];
}

+ (NSDictionary)CRProperties
{
  return (NSDictionary *)MEMORY[0x1E4F1CC08];
}

+ (BOOL)allowsUnknownProperties
{
  return 0;
}

- (void)setFieldKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICCRObject *)self fields];
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
      id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], @"Invalid ICCRObject merge, classes must be equal for merge.", 0 reason userInfo];
      objc_exception_throw(v4);
    }
    [(ICCRObject *)self mergeWithObject:v5];
  }
}

- (void)mergeWithObject:(id)a3
{
  id v4 = [a3 fields];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__ICCRObject_mergeWithObject___block_invoke;
  v5[3] = &unk_1E64A5C10;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __30__ICCRObject_mergeWithObject___block_invoke(uint64_t a1, void *a2, void *a3)
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
  objc_storeWeak((id *)&self->_document, v4);
  id v5 = [v4 objects];
  id v6 = [(ICCRObject *)self identity];
  [v5 setObject:self forKeyedSubscript:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v8 = [(ICCRObject *)self fields];
  id v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  uint64_t v10 = [(ICCRObject *)self fields];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __26__ICCRObject_setDocument___block_invoke;
  v15[3] = &unk_1E64A5C38;
  id v16 = v4;
  uint64_t v11 = v9;
  v17 = v11;
  v18 = self;
  id v12 = v4;
  [v10 enumerateKeysAndObjectsUsingBlock:v15];

  fields = self->_fields;
  self->_fields = v11;
  uint64_t v14 = v11;
}

void __26__ICCRObject_setDocument___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = [a1[4] localObject:a3];
  if (v5)
  {
    [a1[5] setObject:v5 forKeyedSubscript:v8];
  }
  else
  {
    id v6 = [a1[6] fields];
    id v7 = [v6 objectForKeyedSubscript:v8];
    [a1[5] setObject:v7 forKeyedSubscript:v8];
  }
  [v5 setDocument:a1[4]];
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = [(ICCRObject *)self fields];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __28__ICCRObject_deltaSince_in___block_invoke;
  v17[3] = &unk_1E64A5C60;
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
    uint64_t v14 = [(ICCRObject *)self identity];
    v15 = (void *)[v13 initWithIdentity:v14 fields:v10];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __28__ICCRObject_deltaSince_in___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v5 = [(ICCRObject *)self fields];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __24__ICCRObject_walkGraph___block_invoke;
  v7[3] = &unk_1E64A5C88;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __24__ICCRObject_walkGraph___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)tombstone
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id v4 = [(ICCRObject *)self identity];
  id v5 = (void *)[v3 initWithIdentity:v4 fields:MEMORY[0x1E4F1CC08]];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(ICCRObject *)self identity];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(ICCRObject *)self identity];
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
  unint64_t v3 = [(ICCRObject *)self fields];
  uint64_t v4 = [v3 count];

  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  char v7 = NSStringFromClass(v6);
  id v8 = [(ICCRObject *)self identity];
  uint64_t v9 = objc_msgSend(v8, "CR_shortDescription");
  id v10 = (void *)v9;
  if (v4)
  {
    id v11 = [(ICCRObject *)self fields];
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
  id v5 = +[ICCRObject keyFromSelector:](ICCRObject, "keyFromSelector:");
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

- (ICCRDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  return (ICCRDocument *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_document);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end