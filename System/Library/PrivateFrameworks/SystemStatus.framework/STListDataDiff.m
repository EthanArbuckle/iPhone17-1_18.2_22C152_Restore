@interface STListDataDiff
+ (BOOL)supportsSecureCoding;
+ (id)diffFromListData:(id)a3 toListData:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOrthogonalToDiff:(id)a3;
- (NSString)description;
- (STListDataDiff)init;
- (STListDataDiff)initWithCoder:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffByApplyingDiff:(id)a3;
- (id)listDataByApplyingToListData:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)applyToMutableListData:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)initWithObjectsAdded:(void *)a3 objectsRemoved:;
@end

@implementation STListDataDiff

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectsRemoved, 0);

  objc_storeStrong((id *)&self->_objectsAdded, 0);
}

- (STListDataDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectsAdded"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectsRemoved"];
  v7 = [v4 error];

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[STListDataDiff initWithObjectsAdded:objectsRemoved:](self, v5, v6);
    v8 = self;
  }

  return v8;
}

- (void)applyToMutableListData:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    objectsAdded = self->_objectsAdded;
  }
  else {
    objectsAdded = 0;
  }
  v6 = [(STListData *)objectsAdded objects];
  v7 = [v4 objects];
  v8 = (void *)[v7 mutableCopy];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA48] array];
  }
  v11 = v10;

  [v11 addObjectsFromArray:v6];
  if (self) {
    objectsRemoved = self->_objectsRemoved;
  }
  else {
    objectsRemoved = 0;
  }
  [(STListData *)objectsRemoved objects];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = objc_msgSend(v11, "indexOfObject:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        if (v18 != 0x7FFFFFFFFFFFFFFFLL) {
          [v11 removeObjectAtIndex:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }

  [v4 setObjects:v11];
}

- (id)diffByApplyingDiff:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (id *)v4;
    if (self) {
      objectsAdded = self->_objectsAdded;
    }
    else {
      objectsAdded = 0;
    }
    v7 = (void *)[(STListData *)objectsAdded mutableCopy];
    v8 = v7;
    if (v7) {
      v9 = v7;
    }
    else {
      v9 = objc_alloc_init(STMutableListData);
    }
    v11 = v9;

    if (self) {
      objectsRemoved = self->_objectsRemoved;
    }
    else {
      objectsRemoved = 0;
    }
    id v13 = (void *)[(STListData *)objectsRemoved mutableCopy];
    uint64_t v14 = v13;
    if (v13) {
      uint64_t v15 = v13;
    }
    else {
      uint64_t v15 = objc_alloc_init(STMutableListData);
    }
    uint64_t v16 = v15;

    v39 = v5;
    id v40 = v4;
    if (v5)
    {
      id v17 = v5[1];
      id v18 = v5[2];
    }
    else
    {
      id v17 = 0;
      id v18 = 0;
    }
    id v41 = v18;
    long long v19 = [v41 objects];
    long long v20 = (void *)[v19 mutableCopy];

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v48 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          v27 = [(STListData *)v11 objects];
          if ([v27 indexOfObject:v26] == 0x7FFFFFFFFFFFFFFFLL) {
            [(STMutableListData *)v16 addObject:v26];
          }
          else {
            [(STMutableListData *)v11 removeObject:v26];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v23);
    }

    v42 = v17;
    v28 = [v17 objects];
    v29 = (void *)[v28 mutableCopy];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v30 = v29;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v44 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v43 + 1) + 8 * j);
          v36 = [(STListData *)v16 objects];
          if ([v36 indexOfObject:v35] == 0x7FFFFFFFFFFFFFFFLL) {
            [(STMutableListData *)v11 addObject:v35];
          }
          else {
            [(STMutableListData *)v16 removeObject:v35];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v32);
    }

    if (![(STListData *)v11 count])
    {

      v11 = 0;
    }
    v37 = v39;
    id v4 = v40;
    if (![(STListData *)v16 count])
    {

      uint64_t v16 = 0;
    }
    id v10 = -[STListDataDiff initWithObjectsAdded:objectsRemoved:]([STListDataDiff alloc], v11, v16);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)diffFromListData:(id)a3 toListData:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [a3 objects];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1C978] array];
  }
  v9 = v8;

  id v10 = [v5 objects];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1C978] array];
  }
  id v13 = v12;

  uint64_t v14 = (void *)[v13 mutableCopy];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v15 = v9;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [v14 indexOfObject:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        if (v20 != 0x7FFFFFFFFFFFFFFFLL) {
          [v14 removeObjectAtIndex:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v17);
  }

  id v21 = (void *)[v15 mutableCopy];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v22 = v13;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = objc_msgSend(v21, "indexOfObject:", *(void *)(*((void *)&v32 + 1) + 8 * j), (void)v32);
        if (v27 != 0x7FFFFFFFFFFFFFFFLL) {
          [v21 removeObjectAtIndex:v27];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v24);
  }

  if ([v14 count]) {
    v28 = [[STListData alloc] initWithObjects:v14];
  }
  else {
    v28 = 0;
  }
  if (objc_msgSend(v21, "count", (void)v32)) {
    v29 = [[STListData alloc] initWithObjects:v21];
  }
  else {
    v29 = 0;
  }
  id v30 = -[STListDataDiff initWithObjectsAdded:objectsRemoved:]([STListDataDiff alloc], v28, v29);

  return v30;
}

- (void)initWithObjectsAdded:(void *)a3 objectsRemoved:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)STListDataDiff;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 copy];
      id v8 = (void *)a1[1];
      a1[1] = v7;

      uint64_t v9 = [v6 copy];
      id v10 = (void *)a1[2];
      a1[2] = v9;
    }
  }

  return a1;
}

- (BOOL)isEmpty
{
  if (self) {
    objectsAdded = self->_objectsAdded;
  }
  else {
    objectsAdded = 0;
  }
  id v4 = objectsAdded;
  if ([(STListData *)v4 count])
  {
    BOOL v5 = 0;
  }
  else
  {
    if (self) {
      objectsRemoved = self->_objectsRemoved;
    }
    else {
      objectsRemoved = 0;
    }
    BOOL v5 = [(STListData *)objectsRemoved count] == 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  if (self)
  {
    [a3 encodeObject:self->_objectsAdded forKey:@"objectsAdded"];
    objectsRemoved = self->_objectsRemoved;
  }
  else
  {
    [a3 encodeObject:0 forKey:@"objectsAdded"];
    objectsRemoved = 0;
  }
  [a3 encodeObject:objectsRemoved forKey:@"objectsRemoved"];
}

- (STListDataDiff)init
{
  return (STListDataDiff *)-[STListDataDiff initWithObjectsAdded:objectsRemoved:](self, 0, 0);
}

- (id)listDataByApplyingToListData:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  [(STListDataDiff *)self applyToMutableListData:v4];

  return v4;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4 = a3;
  if ([(STListDataDiff *)self isEmpty]) {
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
  if (self) {
    objectsAdded = self->_objectsAdded;
  }
  else {
    objectsAdded = 0;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __26__STListDataDiff_isEqual___block_invoke;
  v18[3] = &unk_1E6B63058;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:objectsAdded counterpart:v18];
  if (self) {
    self = (STListDataDiff *)self->_objectsRemoved;
  }
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __26__STListDataDiff_isEqual___block_invoke_2;
  uint64_t v16 = &unk_1E6B63058;
  id v17 = v7;
  id v9 = v7;
  id v10 = (id)[v5 appendObject:self counterpart:&v13];
  char v11 = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return v11;
}

id __26__STListDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(id *)(v1 + 8);
  }
  else {
    return 0;
  }
}

id __26__STListDataDiff_isEqual___block_invoke_2(uint64_t a1)
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
    id v5 = (id)[v3 appendObject:self->_objectsAdded];
    objectsRemoved = self->_objectsRemoved;
  }
  else
  {
    id v10 = (id)[v3 appendObject:0];
    objectsRemoved = 0;
  }
  id v7 = (id)[v4 appendObject:objectsRemoved];
  unint64_t v8 = [v4 hash];

  return v8;
}

- (NSString)description
{
  return (NSString *)[(STListDataDiff *)self descriptionWithMultilinePrefix:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)succinctDescription
{
  v2 = [(STListDataDiff *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STListDataDiff *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v3 = self;
  if (self)
  {
    id v4 = a3;
    id v5 = [(STListDataDiff *)v3 succinctDescriptionBuilder];
    [v5 setUseDebugDescription:0];
    [v5 setActiveMultilinePrefix:v4];

    id v6 = [v5 activeMultilinePrefix];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__STListDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v9[3] = &unk_1E6B63080;
    id v7 = v5;
    id v10 = v7;
    char v11 = v3;
    [v7 appendBodySectionWithName:0 multilinePrefix:v6 block:v9];

    v3 = (STListDataDiff *)v7;
  }

  return v3;
}

id __66__STListDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"objects added" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"objects removed" skipIfNil:1];
}

@end