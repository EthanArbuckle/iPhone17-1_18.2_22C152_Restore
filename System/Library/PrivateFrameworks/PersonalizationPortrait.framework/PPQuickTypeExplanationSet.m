@interface PPQuickTypeExplanationSet
+ (BOOL)supportsSecureCoding;
+ (id)stringFromExplanation:(unsigned __int8)a3;
+ (id)uniqueKeycodeFromExplanation:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToQuickTypeExplanationSet:(id)a3;
- (PPQuickTypeExplanationSet)init;
- (PPQuickTypeExplanationSet)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)count;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateWithBlock:(id)a3;
- (void)push:(unsigned __int8)a3;
@end

@implementation PPQuickTypeExplanationSet

- (void).cxx_destruct
{
}

- (BOOL)isEqualToQuickTypeExplanationSet:(id)a3
{
  v4 = (PPQuickTypeExplanationSet *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    BOOL v11 = 1;
    goto LABEL_7;
  }
  unint64_t v6 = [(PPQuickTypeExplanationSet *)self count];
  if (v6 == [(PPQuickTypeExplanationSet *)v5 count])
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__5768;
    v21 = __Block_byref_object_dispose__5769;
    id v22 = 0;
    set = self->_set;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__PPQuickTypeExplanationSet_isEqualToQuickTypeExplanationSet___block_invoke;
    v16[3] = &unk_1E550ED08;
    v16[4] = &v17;
    [(_PASLock *)set runWithLockAcquired:v16];
    id v8 = (id)v18[5];
    _Block_object_dispose(&v17, 8);

    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    LOBYTE(v20) = 0;
    v9 = v5->_set;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__PPQuickTypeExplanationSet_isEqualToQuickTypeExplanationSet___block_invoke_2;
    v13[3] = &unk_1E550ED80;
    v15 = &v17;
    id v10 = v8;
    id v14 = v10;
    [(_PASLock *)v9 runWithLockAcquired:v13];
    BOOL v11 = *((unsigned char *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
LABEL_5:
    BOOL v11 = 0;
  }
LABEL_7:

  return v11;
}

uint64_t __62__PPQuickTypeExplanationSet_isEqualToQuickTypeExplanationSet___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 copy];
  return MEMORY[0x1F41817F8]();
}

uint64_t __62__PPQuickTypeExplanationSet_isEqualToQuickTypeExplanationSet___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isEqual:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPQuickTypeExplanationSet *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPQuickTypeExplanationSet *)self isEqualToQuickTypeExplanationSet:v5];

  return v6;
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"<PPQuickTypeExplanationSet: (");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PPQuickTypeExplanationSet_description__block_invoke;
  v6[3] = &unk_1E550ED58;
  id v4 = v3;
  id v7 = v4;
  [(PPQuickTypeExplanationSet *)self enumerateWithBlock:v6];
  [v4 appendString:@">"]);

  return v4;
}

uint64_t __40__PPQuickTypeExplanationSet_description__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = +[PPQuickTypeExplanationSet stringFromExplanation:a2];
  [v3 appendString:v4];

  v5 = *(void **)(a1 + 32);
  return [v5 appendString:@"; "];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F93B70]);
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__5768;
    v16 = __Block_byref_object_dispose__5769;
    id v17 = 0;
    set = self->_set;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__PPQuickTypeExplanationSet_copyWithZone___block_invoke;
    v11[3] = &unk_1E550ED08;
    v11[4] = &v12;
    [(_PASLock *)set runWithLockAcquired:v11];
    id v7 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    uint64_t v8 = [v5 initWithGuardedData:v7];
    v9 = (void *)v4[1];
    v4[1] = v8;
  }
  return v4;
}

uint64_t __42__PPQuickTypeExplanationSet_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 mutableCopy];
  return MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  set = self->_set;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__PPQuickTypeExplanationSet_hash__block_invoke;
  v5[3] = &unk_1E550ED08;
  v5[4] = &v6;
  [(_PASLock *)set runWithLockAcquired:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__PPQuickTypeExplanationSet_hash__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 hash];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  set = self->_set;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PPQuickTypeExplanationSet_encodeWithCoder___block_invoke;
  v7[3] = &unk_1E550ED30;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)set runWithLockAcquired:v7];
}

uint64_t __45__PPQuickTypeExplanationSet_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) encodeObject:a2 forKey:@"iset"];
}

- (PPQuickTypeExplanationSet)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PPQuickTypeExplanationSet;
  id v5 = [(PPQuickTypeExplanationSet *)&v28 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x192F97350]();
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"iset"];
    uint64_t v9 = (void *)[v8 mutableCopy];

    if (!v9)
    {
      id v10 = (void *)MEMORY[0x192F97350]();
      id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_msgSend(v11, "initWithObjects:", v12, v13, objc_opt_class(), 0);
      v15 = [v4 decodeObjectOfClasses:v14 forKey:@"set"];

      uint64_t v9 = objc_opt_new();
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v25;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v16);
            }
            objc_msgSend(v9, "addIndex:", objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v20++), "unsignedIntegerValue"));
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v18);
      }
    }
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v9];
    set = v5->_set;
    v5->_set = (_PASLock *)v21;
  }
  return v5;
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  set = self->_set;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PPQuickTypeExplanationSet_count__block_invoke;
  v5[3] = &unk_1E550ED08;
  v5[4] = &v6;
  [(_PASLock *)set runWithLockAcquired:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__PPQuickTypeExplanationSet_count__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)enumerateWithBlock:(id)a3
{
  id v4 = a3;
  set = self->_set;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__PPQuickTypeExplanationSet_enumerateWithBlock___block_invoke;
  v7[3] = &unk_1E550ECE0;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)set runWithLockAcquired:v7];
}

void __48__PPQuickTypeExplanationSet_enumerateWithBlock___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__PPQuickTypeExplanationSet_enumerateWithBlock___block_invoke_2;
  v3[3] = &unk_1E550ECB8;
  id v4 = *(id *)(a1 + 32);
  [a2 enumerateIndexesUsingBlock:v3];
}

uint64_t __48__PPQuickTypeExplanationSet_enumerateWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)push:(unsigned __int8)a3
{
  set = self->_set;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__PPQuickTypeExplanationSet_push___block_invoke;
  v4[3] = &__block_descriptor_33_e27_v16__0__NSMutableIndexSet_8l;
  unsigned __int8 v5 = a3;
  [(_PASLock *)set runWithLockAcquired:v4];
}

uint64_t __34__PPQuickTypeExplanationSet_push___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addIndex:*(unsigned __int8 *)(a1 + 32)];
}

- (PPQuickTypeExplanationSet)init
{
  v8.receiver = self;
  v8.super_class = (Class)PPQuickTypeExplanationSet;
  v2 = [(PPQuickTypeExplanationSet *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    id v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    set = v2->_set;
    v2->_set = (_PASLock *)v5;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)uniqueKeycodeFromExplanation:(unsigned __int8)a3
{
  if ((a3 - 1) > 0x30) {
    return @"None";
  }
  else {
    return off_1E550EF28[(a3 - 1)];
  }
}

+ (id)stringFromExplanation:(unsigned __int8)a3
{
  if ((a3 - 1) > 0x30) {
    return @"None";
  }
  else {
    return off_1E550EDA0[(a3 - 1)];
  }
}

@end