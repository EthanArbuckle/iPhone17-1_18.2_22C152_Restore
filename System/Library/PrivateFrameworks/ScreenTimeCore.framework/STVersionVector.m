@interface STVersionVector
- (BOOL)isConcurrentWithVersionVector:(id)a3;
- (BOOL)isEqualToVersionVector:(id)a3;
- (BOOL)precedesVersionVector:(id)a3;
- (NSArray)nodes;
- (NSData)dataRepresentation;
- (NSMutableDictionary)nodeByIdentifier;
- (NSString)editorIdentifier;
- (STVersionVector)init;
- (STVersionVector)initWithDataRepresentation:(id)a3;
- (STVersionVector)initWithNode:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)evaluateCausality:(id)a3;
- (void)dataRepresentation;
- (void)incrementNodeWithIdentifier:(id)a3;
- (void)join:(id)a3;
- (void)setEditorIdentifier:(id)a3;
- (void)setNodeByIdentifier:(id)a3;
@end

@implementation STVersionVector

- (STVersionVector)init
{
  v6.receiver = self;
  v6.super_class = (Class)STVersionVector;
  v2 = [(STVersionVector *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    nodeByIdentifier = v2->_nodeByIdentifier;
    v2->_nodeByIdentifier = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (STVersionVector)initWithNode:(id)a3
{
  id v4 = a3;
  v5 = [(STVersionVector *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    editorIdentifier = v5->_editorIdentifier;
    v5->_editorIdentifier = (NSString *)v6;

    [(NSMutableDictionary *)v5->_nodeByIdentifier setObject:v4 forKeyedSubscript:v5->_editorIdentifier];
  }

  return v5;
}

- (STVersionVector)initWithDataRepresentation:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(STVersionVector *)self init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    id v31 = 0;
    v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v31];
    id v8 = v31;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = v7;
      v10 = [v9 objectForKeyedSubscript:@"e"];
      v11 = [v9 objectForKeyedSubscript:@"n"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v24 = v9;
          id v25 = v8;
          v26 = v7;
          v23 = v10;
          [(STVersionVector *)v6 setEditorIdentifier:v10];
          v12 = v6->_nodeByIdentifier;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v13 = v11;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v28;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v28 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v19 = [[STVersionVectorNode alloc] initWithDictionaryRepresentation:v18];
                  v20 = [(STVersionVectorNode *)v19 identifier];
                  [(NSMutableDictionary *)v12 setObject:v19 forKeyedSubscript:v20];
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
            }
            while (v15);
          }

          v7 = v26;
          v21 = v24;
          id v8 = v25;
LABEL_19:

          goto LABEL_20;
        }
      }
    }
    v21 = +[STLog versionVector];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      [(STVersionVector *)(uint64_t)v7 initWithDataRepresentation:v21];
    }
    goto LABEL_19;
  }
LABEL_20:

  return v6;
}

- (NSData)dataRepresentation
{
  v17[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(STVersionVector *)self nodes];
  id v4 = [v3 valueForKeyPath:@"dictionaryRepresentation"];

  v16[0] = @"e";
  uint64_t v5 = [(STVersionVector *)self editorIdentifier];
  uint64_t v6 = (void *)v5;
  v7 = &stru_1F3487700;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  v16[1] = @"n";
  v17[0] = v7;
  v17[1] = v4;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  id v15 = 0;
  v9 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:0 error:&v15];
  id v10 = v15;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v12 = +[STLog versionVector];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      [(STVersionVector *)(uint64_t)v10 dataRepresentation];
    }

    id v11 = (id)objc_opt_new();
  }
  id v13 = v11;

  return (NSData *)v13;
}

- (NSArray)nodes
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"identifier" ascending:1];
  id v4 = [(STVersionVector *)self nodeByIdentifier];
  uint64_t v5 = [v4 allValues];
  v9[0] = v3;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7 = [v5 sortedArrayUsingDescriptors:v6];

  return (NSArray *)v7;
}

- (unint64_t)evaluateCausality:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [(STVersionVector *)self nodeByIdentifier];
  v7 = [v6 allKeys];
  [v5 addObjectsFromArray:v7];

  v35 = v4;
  id v8 = [v4 nodeByIdentifier];
  v9 = [v8 allKeys];
  [v5 addObjectsFromArray:v9];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v37;
    id obj = v10;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v18 = [(STVersionVector *)self nodeByIdentifier];
        v19 = [v18 objectForKeyedSubscript:v17];
        v20 = v19;
        if (v19) {
          v21 = v19;
        }
        else {
          v21 = [[STVersionVectorNode alloc] initWithIdentifier:v17];
        }
        v22 = v21;

        v23 = [v35 nodeByIdentifier];
        v24 = [v23 objectForKeyedSubscript:v17];
        id v25 = v24;
        if (v24) {
          v26 = v24;
        }
        else {
          v26 = [[STVersionVectorNode alloc] initWithIdentifier:v17];
        }
        long long v27 = v26;

        unint64_t v28 = [(STVersionVectorNode *)v22 count];
        if (v28 >= [(STVersionVectorNode *)v27 count])
        {
          unint64_t v29 = [(STVersionVectorNode *)v22 count];
          if (v29 > [(STVersionVectorNode *)v27 count]) {
            ++v13;
          }
        }
        else
        {
          ++v14;
        }
      }
      id v10 = obj;
      uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v12);

    BOOL v30 = v13 == 0;
    if (v14 && !v13)
    {
      unint64_t v31 = 0;
      goto LABEL_28;
    }
    BOOL v32 = v14 == 0;
    if (v13 && !v14)
    {
      unint64_t v31 = 1;
      goto LABEL_28;
    }
  }
  else
  {

    BOOL v32 = 1;
    BOOL v30 = 1;
  }
  if (v30 && v32) {
    unint64_t v31 = 3;
  }
  else {
    unint64_t v31 = 2;
  }
LABEL_28:

  return v31;
}

- (void)incrementNodeWithIdentifier:(id)a3
{
  id v8 = a3;
  id v4 = (void *)[v8 copy];
  [(STVersionVector *)self setEditorIdentifier:v4];

  uint64_t v5 = [(STVersionVector *)self nodeByIdentifier];
  uint64_t v6 = [v5 objectForKeyedSubscript:v8];

  if (!v6)
  {
    uint64_t v6 = [[STVersionVectorNode alloc] initWithIdentifier:v8];
    v7 = [(STVersionVector *)self nodeByIdentifier];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
  [(STVersionVectorNode *)v6 increment];
}

- (void)join:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 editorIdentifier];
  [(STVersionVector *)self setEditorIdentifier:v5];

  uint64_t v6 = objc_opt_new();
  v7 = [(STVersionVector *)self nodeByIdentifier];
  id v8 = [v7 allKeys];
  [v6 addObjectsFromArray:v8];

  v9 = [v4 nodeByIdentifier];
  id v10 = [v9 allKeys];
  [v6 addObjectsFromArray:v10];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v15);
        uint64_t v17 = [(STVersionVector *)self nodeByIdentifier];
        uint64_t v18 = [v17 objectForKeyedSubscript:v16];

        if (!v18)
        {
          uint64_t v18 = [[STVersionVectorNode alloc] initWithIdentifier:v16];
          v19 = [(STVersionVector *)self nodeByIdentifier];
          [v19 setObject:v18 forKeyedSubscript:v16];
        }
        v20 = [v4 nodeByIdentifier];
        v21 = [v20 objectForKeyedSubscript:v16];

        if (v21) {
          [(STVersionVectorNode *)v18 join:v21];
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }
}

- (BOOL)precedesVersionVector:(id)a3
{
  return [(STVersionVector *)self evaluateCausality:a3] == 0;
}

- (BOOL)isConcurrentWithVersionVector:(id)a3
{
  return [(STVersionVector *)self evaluateCausality:a3] == 2;
}

- (BOOL)isEqualToVersionVector:(id)a3
{
  return [(STVersionVector *)self evaluateCausality:a3] == 3;
}

- (id)description
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"identifier" ascending:1];
  id v4 = [(STVersionVector *)self nodes];
  v9[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  uint64_t v6 = [v4 sortedArrayUsingDescriptors:v5];

  v7 = [v6 description];

  return v7;
}

- (id)debugDescription
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"identifier" ascending:1];
  id v4 = [(STVersionVector *)self nodes];
  v12[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v6 = [v4 sortedArrayUsingDescriptors:v5];

  v7 = NSString;
  uint64_t v8 = objc_opt_class();
  v9 = [(STVersionVector *)self editorIdentifier];
  id v10 = [v7 stringWithFormat:@"<%@: %p { editorIdentifier = %@, nodes = %@ }>", v8, self, v9, v6];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  uint64_t v5 = [v4 nodeByIdentifier];
  uint64_t v6 = [(STVersionVector *)self nodeByIdentifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __32__STVersionVector_copyWithZone___block_invoke;
  v9[3] = &unk_1E6BC8260;
  id v10 = v5;
  id v7 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];

  return v4;
}

void __32__STVersionVector_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (NSMutableDictionary)nodeByIdentifier
{
  return self->_nodeByIdentifier;
}

- (void)setNodeByIdentifier:(id)a3
{
}

- (NSString)editorIdentifier
{
  return self->_editorIdentifier;
}

- (void)setEditorIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorIdentifier, 0);
  objc_storeStrong((id *)&self->_nodeByIdentifier, 0);
}

- (void)initWithDataRepresentation:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "Malformed version vector: %{public}@ %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)dataRepresentation
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DA519000, a2, OS_LOG_TYPE_FAULT, "Failed to serialize version vector: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end