@interface STDictionaryDataDiff
+ (BOOL)supportsSecureCoding;
+ (id)diffFromDictionaryData:(id)a3 toDictionaryData:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOrthogonalToDiff:(id)a3;
- (NSString)description;
- (STDictionaryDataDiff)init;
- (STDictionaryDataDiff)initWithCoder:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)dictionaryDataByApplyingToDictionaryData:(id)a3;
- (id)diffByApplyingDiff:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)applyToMutableDictionaryData:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)initWithObjectsAndKeysAdded:(void *)a3 objectsAndKeysRemoved:;
@end

@implementation STDictionaryDataDiff

+ (id)diffFromDictionaryData:(id)a3 toDictionaryData:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [a3 objectsAndKeys];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  v9 = v8;

  v10 = [v5 objectsAndKeys];
  v11 = v10;
  v38 = v5;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  v13 = v12;

  v14 = (void *)[v13 mutableCopy];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v15 = [v9 allKeys];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v44 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        v21 = [v9 objectForKey:v20];
        v22 = [v13 objectForKey:v20];
        if ([v21 isEqual:v22]) {
          [v14 removeObjectForKey:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v17);
  }
  v37 = v14;

  v23 = (void *)[v9 mutableCopy];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v24 = [v13 allKeys];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v39 + 1) + 8 * j);
        v30 = objc_msgSend(v9, "objectForKey:", v29, v37, v38);
        v31 = [v13 objectForKey:v29];
        if ([v31 isEqual:v30]) {
          [v23 removeObjectForKey:v29];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v26);
  }

  v32 = v37;
  if ([v37 count]) {
    v33 = [[STDictionaryData alloc] initWithObjectsAndKeys:v37];
  }
  else {
    v33 = 0;
  }
  if (objc_msgSend(v23, "count", v37)) {
    v34 = [[STDictionaryData alloc] initWithObjectsAndKeys:v23];
  }
  else {
    v34 = 0;
  }
  v35 = -[STDictionaryDataDiff initWithObjectsAndKeysAdded:objectsAndKeysRemoved:]([STDictionaryDataDiff alloc], v33, v34);

  return v35;
}

- (void)initWithObjectsAndKeysAdded:(void *)a3 objectsAndKeysRemoved:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)STDictionaryDataDiff;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 copy];
      id v8 = (void *)a1[1];
      a1[1] = v7;

      uint64_t v9 = [v6 copy];
      v10 = (void *)a1[2];
      a1[2] = v9;
    }
  }

  return a1;
}

- (STDictionaryDataDiff)init
{
  return (STDictionaryDataDiff *)-[STDictionaryDataDiff initWithObjectsAndKeysAdded:objectsAndKeysRemoved:](self, 0, 0);
}

- (id)dictionaryDataByApplyingToDictionaryData:(id)a3
{
  v4 = (void *)[a3 mutableCopy];
  [(STDictionaryDataDiff *)self applyToMutableDictionaryData:v4];

  return v4;
}

- (void)applyToMutableDictionaryData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    objectsAndKeysAdded = self->_objectsAndKeysAdded;
  }
  else {
    objectsAndKeysAdded = 0;
  }
  uint64_t v6 = [(STDictionaryData *)objectsAndKeysAdded objectsAndKeys];
  uint64_t v7 = [v4 objectsAndKeys];
  id v8 = (void *)[v7 mutableCopy];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v11 = v10;

  [v11 addEntriesFromDictionary:v6];
  v22 = (void *)v6;
  if (self) {
    objectsAndKeysRemoved = self->_objectsAndKeysRemoved;
  }
  else {
    objectsAndKeysRemoved = 0;
  }
  v13 = [(STDictionaryData *)objectsAndKeysRemoved objectsAndKeys];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v14 = [v13 allKeys];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v20 = [v11 objectForKey:v19];
        v21 = [v13 objectForKey:v19];
        if ([v20 isEqual:v21]) {
          [v11 removeObjectForKey:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  [v4 setObjectsAndKeys:v11];
}

- (BOOL)isEmpty
{
  if (self) {
    objectsAndKeysAdded = self->_objectsAndKeysAdded;
  }
  else {
    objectsAndKeysAdded = 0;
  }
  id v4 = objectsAndKeysAdded;
  if ([(STDictionaryData *)v4 count])
  {
    BOOL v5 = 0;
  }
  else
  {
    if (self) {
      objectsAndKeysRemoved = self->_objectsAndKeysRemoved;
    }
    else {
      objectsAndKeysRemoved = 0;
    }
    BOOL v5 = [(STDictionaryData *)objectsAndKeysRemoved count] == 0;
  }

  return v5;
}

- (id)diffByApplyingDiff:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = (id *)v4;
    id v42 = v4;
    if (self) {
      objectsAndKeysAdded = self->_objectsAndKeysAdded;
    }
    else {
      objectsAndKeysAdded = 0;
    }
    uint64_t v7 = (void *)[(STDictionaryData *)objectsAndKeysAdded mutableCopy];
    id v8 = v7;
    if (v7) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = objc_alloc_init(STMutableDictionaryData);
    }
    v11 = v9;

    if (self) {
      objectsAndKeysRemoved = self->_objectsAndKeysRemoved;
    }
    else {
      objectsAndKeysRemoved = 0;
    }
    v13 = (void *)[(STDictionaryData *)objectsAndKeysRemoved mutableCopy];
    v14 = v13;
    if (v13) {
      uint64_t v15 = v13;
    }
    else {
      uint64_t v15 = objc_alloc_init(STMutableDictionaryData);
    }
    uint64_t v16 = v15;

    long long v41 = v5;
    if (v5)
    {
      id v43 = v5[1];
      id v17 = v5[2];
    }
    else
    {
      id v43 = 0;
      id v17 = 0;
    }
    id v40 = v17;
    uint64_t v18 = [v40 objectsAndKeys];
    uint64_t v19 = (void *)[v18 mutableCopy];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v45 = v19;
    uint64_t v20 = [v19 allKeys];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v51 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v50 + 1) + 8 * i);
          long long v26 = [(STDictionaryData *)v11 objectsAndKeys];
          uint64_t v27 = [v26 objectForKey:v25];
          uint64_t v28 = [v45 objectForKey:v25];
          if ([v28 isEqual:v27]) {
            [(STMutableDictionaryData *)v11 removeObjectForKey:v25];
          }
          else {
            [(STMutableDictionaryData *)v16 setObject:v28 forKey:v25];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v22);
    }

    uint64_t v29 = [v43 objectsAndKeys];
    v30 = (void *)[v29 mutableCopy];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obuint64_t j = [v30 allKeys];
    uint64_t v31 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v47 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = *(void *)(*((void *)&v46 + 1) + 8 * j);
          v36 = [(STDictionaryData *)v16 objectsAndKeys];
          v37 = [v36 objectForKey:v35];
          v38 = [v30 objectForKey:v35];
          if ([v38 isEqual:v37]) {
            [(STMutableDictionaryData *)v16 removeObjectForKey:v35];
          }
          else {
            [(STMutableDictionaryData *)v11 setObject:v38 forKey:v35];
          }
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v32);
    }

    if (![(STDictionaryData *)v11 count])
    {

      v11 = 0;
    }
    id v4 = v42;
    if (![(STDictionaryData *)v16 count])
    {

      uint64_t v16 = 0;
    }
    id v10 = -[STDictionaryDataDiff initWithObjectsAndKeysAdded:objectsAndKeysRemoved:]([STDictionaryDataDiff alloc], v11, v16);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4 = a3;
  if ([(STDictionaryDataDiff *)self isEmpty]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEmpty];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  if (self) {
    objectsAndKeysAdded = self->_objectsAndKeysAdded;
  }
  else {
    objectsAndKeysAdded = 0;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __32__STDictionaryDataDiff_isEqual___block_invoke;
  v19[3] = &unk_1E6B63058;
  id v8 = v6;
  id v20 = v8;
  id v9 = (id)[v5 appendObject:objectsAndKeysAdded counterpart:v19];
  if (self) {
    self = (STDictionaryDataDiff *)self->_objectsAndKeysRemoved;
  }
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __32__STDictionaryDataDiff_isEqual___block_invoke_2;
  id v17 = &unk_1E6B63058;
  id v18 = v8;
  id v10 = v8;
  id v11 = (id)[v5 appendObject:self counterpart:&v14];
  char v12 = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return v12;
}

id __32__STDictionaryDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 8);
  }
  else {
    return 0;
  }
}

id __32__STDictionaryDataDiff_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 16);
  }
  else {
    return 0;
  }
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = v3;
  if (self)
  {
    id v5 = (id)[v3 appendObject:self->_objectsAndKeysAdded];
    objectsAndKeysRemoved = self->_objectsAndKeysRemoved;
  }
  else
  {
    id v10 = (id)[v3 appendObject:0];
    objectsAndKeysRemoved = 0;
  }
  id v7 = (id)[v4 appendObject:objectsAndKeysRemoved];
  unint64_t v8 = [v4 hash];

  return v8;
}

- (NSString)description
{
  return (NSString *)[(STDictionaryDataDiff *)self descriptionWithMultilinePrefix:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self)
  {
    [a3 encodeObject:self->_objectsAndKeysAdded forKey:@"objectsAndKeysAdded"];
    objectsAndKeysRemoved = self->_objectsAndKeysRemoved;
  }
  else
  {
    [a3 encodeObject:0 forKey:@"objectsAndKeysAdded"];
    objectsAndKeysRemoved = 0;
  }
  [a3 encodeObject:objectsAndKeysRemoved forKey:@"objectsAndKeysRemoved"];
}

- (STDictionaryDataDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectsAndKeysAdded"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectsAndKeysRemoved"];
  id v7 = [v4 error];

  if (v7)
  {
    unint64_t v8 = 0;
  }
  else
  {
    self = -[STDictionaryDataDiff initWithObjectsAndKeysAdded:objectsAndKeysRemoved:](self, v5, v6);
    unint64_t v8 = self;
  }

  return v8;
}

- (id)succinctDescription
{
  v2 = [(STDictionaryDataDiff *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STDictionaryDataDiff *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v3 = self;
  if (self)
  {
    id v4 = a3;
    id v5 = [(STDictionaryDataDiff *)v3 succinctDescriptionBuilder];
    [v5 setUseDebugDescription:0];
    [v5 setActiveMultilinePrefix:v4];

    id v6 = [v5 activeMultilinePrefix];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__STDictionaryDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v9[3] = &unk_1E6B63080;
    id v7 = v5;
    id v10 = v7;
    id v11 = v3;
    [v7 appendBodySectionWithName:0 multilinePrefix:v6 block:v9];

    v3 = (STDictionaryDataDiff *)v7;
  }

  return v3;
}

id __72__STDictionaryDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"objects and keys added" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"objects and keys removed" skipIfNil:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectsAndKeysRemoved, 0);

  objc_storeStrong((id *)&self->_objectsAndKeysAdded, 0);
}

@end