@interface TRAPreferencesTree
+ (TRAPreferencesTree)treeWithNodesSpecifications:(id)a3 traversalType:(int64_t)a4 debugName:(id)a5;
- (BOOL)isFlatTree;
- (NSString)debugDescription;
- (NSString)debugName;
- (id)_initWithRootChildren:(id)a3 traversalType:(int64_t)a4 debugName:(id)a5;
- (id)_recursiveDescriptionWithChildrenInZOrder:(BOOL)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)participantsTopologicalSort;
- (id)recursiveDescription;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)topologicalSort;
- (int64_t)traversalType;
- (void)setIsFlatTree:(BOOL)a3;
- (void)setTraversalType:(int64_t)a3;
@end

@implementation TRAPreferencesTree

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootChildren, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
}

- (id)participantsTopologicalSort
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(TRAPreferencesTree *)self topologicalSort];
  v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "participant", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)topologicalSort
{
  if (self->_isFlatTree)
  {
    v3 = self->_rootChildren;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_rootChildren, "count"));
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    preOrder(0, self->_rootChildren, v3, self->_traversalType);
  }
  return v3;
}

+ (TRAPreferencesTree)treeWithNodesSpecifications:(id)a3 traversalType:(int64_t)a4 debugName:(id)a5
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v43 = [MEMORY[0x263F08690] currentHandler];
    [v43 handleFailureInMethod:a2, a1, @"TRAPreferencesTree.m", 160, @"Invalid parameter not satisfying: %@", @"nodesSpecifications" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v44 = [MEMORY[0x263F08690] currentHandler];
  [v44 handleFailureInMethod:a2, a1, @"TRAPreferencesTree.m", 161, @"Invalid parameter not satisfying: %@", @"debugName" object file lineNumber description];

LABEL_3:
  v46 = v11;
  v55 = [MEMORY[0x263EFF9C0] setWithArray:v9];
  v49 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v48 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obuint64_t j = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v66;
    char v15 = 1;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v66 != v14) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        v18 = [v17 parentParticipant];

        if (v18)
        {
          char v15 = 0;
        }
        else
        {
          v19 = [TRAPreferencesTreeNode alloc];
          v20 = [v17 participant];
          v21 = [(TRAPreferencesTreeNode *)v19 initWithParticipant:v20];

          [v17 order];
          -[TRAPreferencesTreeNode setOrder:](v21, "setOrder:");
          [v49 addObject:v21];
          [v55 removeObject:v17];
          v22 = [(TRAPreferencesTreeNode *)v21 uniqueIdentifier];
          [v48 setObject:v21 forKey:v22];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v13);
  }
  else
  {
    char v15 = 1;
  }

  v23 = v46;
  id v24 = [[TRAPreferencesTree alloc] _initWithRootChildren:v49 traversalType:a4 debugName:v46];
  if ((v15 & 1) == 0 && [v49 count])
  {
    id v45 = v24;
    v25 = [MEMORY[0x263EFF980] arrayWithArray:v49];
    v53 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v25, "count"));
    v47 = v25;
    v26 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v25, "count"));
    do
    {
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v27 = v47;
      uint64_t v54 = [v27 countByEnumeratingWithState:&v61 objects:v70 count:16];
      if (v54)
      {
        uint64_t v51 = *(void *)v62;
        v52 = v27;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v62 != v51) {
              objc_enumerationMutation(v27);
            }
            uint64_t v56 = v28;
            v29 = *(void **)(*((void *)&v61 + 1) + 8 * v28);
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            id v30 = v55;
            uint64_t v31 = [v30 countByEnumeratingWithState:&v57 objects:v69 count:16];
            if (v31)
            {
              uint64_t v32 = v31;
              uint64_t v33 = *(void *)v58;
              do
              {
                for (uint64_t j = 0; j != v32; ++j)
                {
                  if (*(void *)v58 != v33) {
                    objc_enumerationMutation(v30);
                  }
                  v35 = *(void **)(*((void *)&v57 + 1) + 8 * j);
                  v36 = [v35 parentParticipant];
                  v37 = [v29 participant];

                  if (v36 == v37)
                  {
                    v38 = [TRAPreferencesTreeNode alloc];
                    v39 = [v35 participant];
                    v40 = [(TRAPreferencesTreeNode *)v38 initWithParticipant:v39];

                    [v35 order];
                    -[TRAPreferencesTreeNode setOrder:](v40, "setOrder:");
                    [v29 addChild:v40];
                    [v26 addObject:v40];
                  }
                }
                uint64_t v32 = [v30 countByEnumeratingWithState:&v57 objects:v69 count:16];
              }
              while (v32);
            }

            [v53 addObject:v29];
            uint64_t v28 = v56 + 1;
            id v27 = v52;
          }
          while (v56 + 1 != v54);
          uint64_t v54 = [v52 countByEnumeratingWithState:&v61 objects:v70 count:16];
        }
        while (v54);
      }

      [v27 removeObjectsInArray:v53];
      [v27 addObjectsFromArray:v26];
      [v26 removeAllObjects];
      [v53 removeAllObjects];
    }
    while ([v27 count]);

    id v24 = v45;
    v23 = v46;
  }
  v41 = TRALogCommon();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
    +[TRAPreferencesTree treeWithNodesSpecifications:traversalType:debugName:](v24, v41);
  }

  return (TRAPreferencesTree *)v24;
}

uint64_t __68__TRAPreferencesTree__initWithRootChildren_traversalType_debugName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 order];
  uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 order];
  double v9 = v8;

  id v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (id)_initWithRootChildren:(id)a3 traversalType:(int64_t)a4 debugName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TRAPreferencesTree;
  id v10 = [(TRAPreferencesTree *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 sortedArrayUsingComparator:&__block_literal_global_136];
    rootChildren = v10->_rootChildren;
    v10->_rootChildren = (NSArray *)v11;

    v10->_traversalType = a4;
    objc_storeStrong((id *)&v10->_debugName, a5);
  }

  return v10;
}

- (id)recursiveDescription
{
  return [(TRAPreferencesTree *)self _recursiveDescriptionWithChildrenInZOrder:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(TRAPreferencesTree *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(TRAPreferencesTree *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_debugName withName:@"name"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(TRAPreferencesTree *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)_recursiveDescriptionWithChildrenInZOrder:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x263F089D8] string];
  uint64_t v6 = NSString;
  uint64_t v7 = [(TRAPreferencesTree *)self debugName];
  id v8 = [v6 stringWithFormat:@"   ◼︎ %@ Root", v7];
  [v5 appendString:v8];

  appendDescription(0, self->_rootChildren, v5, 0, self->_traversalType, v3);
  [v5 appendString:@"   "];
  return v5;
}

- (NSString)debugName
{
  return self->_debugName;
}

- (int64_t)traversalType
{
  return self->_traversalType;
}

- (void)setTraversalType:(int64_t)a3
{
  self->_traversalType = a3;
}

- (BOOL)isFlatTree
{
  return self->_isFlatTree;
}

- (void)setIsFlatTree:(BOOL)a3
{
  self->_isFlatTree = a3;
}

+ (void)treeWithNodesSpecifications:(void *)a1 traversalType:(NSObject *)a2 debugName:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = [a1 debugName];
  id v5 = [a1 recursiveDescription];
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_debug_impl(&dword_2600B7000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@", (uint8_t *)&v6, 0x16u);
}

@end