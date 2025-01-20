@interface PLDuplicateGroup
- (BOOL)hasExcludedItems;
- (BOOL)hasSubGroups;
- (NSSet)excludedGroup;
- (NSSet)group;
- (NSSet)subGroups;
- (PLDuplicateGroup)init;
- (PLDuplicateGroup)initWithGroupResults:(id)a3;
- (id)debugDescription;
- (id)printStringListFromOIDs:(id)a3;
- (void)addManagedObjectID:(id)a3;
- (void)addSubGroup:(id)a3;
- (void)compactSubGroups;
- (void)excludeManagedObjectID:(id)a3;
- (void)replaceSubGroups:(id)a3;
@end

@implementation PLDuplicateGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSubGroups, 0);
  objc_storeStrong((id *)&self->_mutableExcludedGroup, 0);
  objc_storeStrong((id *)&self->_mutableGroup, 0);
}

- (void)compactSubGroups
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_mutableSubGroups = &self->_mutableSubGroups;
  v4 = self->_mutableSubGroups;
  if ([(NSMutableSet *)v4 count] == 1)
  {
    [(NSMutableSet *)*p_mutableSubGroups removeAllObjects];
  }
  else if ((unint64_t)[(NSMutableSet *)v4 count] >= 2)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v6 = v4;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v11, "count", (void)v16) == 1)
          {
            mutableExcludedGroup = self->_mutableExcludedGroup;
            v13 = [v11 anyObject];
            [(NSMutableSet *)mutableExcludedGroup addObject:v13];
          }
          else
          {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v8);
    }

    objc_storeStrong((id *)p_mutableSubGroups, v5);
    if (![(NSMutableSet *)*p_mutableSubGroups count]) {
      [(NSMutableSet *)self->_mutableGroup minusSet:self->_mutableExcludedGroup];
    }
  }
  v14 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = [(PLDuplicateGroup *)self debugDescription];
    *(_DWORD *)buf = 138543362;
    v21 = v15;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "Duplicate Grouping: Compact results: %{public}@", buf, 0xCu);
  }
}

- (void)excludeManagedObjectID:(id)a3
{
  id v4 = a3;
  [(PLDuplicateGroup *)self addManagedObjectID:v4];
  [(NSMutableSet *)self->_mutableExcludedGroup addObject:v4];
}

- (void)replaceSubGroups:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PLDuplicateGroup.m", 95, @"Invalid parameter not satisfying: %@", @"subGroups" object file lineNumber description];

    id v5 = 0;
  }
  v6 = (NSMutableSet *)[v5 mutableCopy];
  mutableSubGroups = self->_mutableSubGroups;
  self->_mutableSubGroups = v6;
}

- (void)addSubGroup:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PLDuplicateGroup.m", 90, @"Invalid parameter not satisfying: %@", @"subGroup" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableSet *)self->_mutableSubGroups addObject:v5];
}

- (void)addManagedObjectID:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PLDuplicateGroup.m", 85, @"Invalid parameter not satisfying: %@", @"objectID" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableSet *)self->_mutableGroup addObject:v5];
}

- (BOOL)hasSubGroups
{
  return [(NSMutableSet *)self->_mutableSubGroups count] != 0;
}

- (BOOL)hasExcludedItems
{
  return [(NSMutableSet *)self->_mutableExcludedGroup count] != 0;
}

- (NSSet)subGroups
{
  v2 = (void *)[(NSMutableSet *)self->_mutableSubGroups copy];
  return (NSSet *)v2;
}

- (NSSet)excludedGroup
{
  v2 = (void *)[(NSMutableSet *)self->_mutableExcludedGroup copy];
  return (NSSet *)v2;
}

- (NSSet)group
{
  v2 = (void *)[(NSMutableSet *)self->_mutableGroup copy];
  return (NSSet *)v2;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v20.receiver = self;
  v20.super_class = (Class)PLDuplicateGroup;
  id v4 = [(PLDuplicateGroup *)&v20 description];
  id v5 = (void *)[v3 initWithString:v4];

  [v5 appendString:@" Group:{ "];
  v6 = [(PLDuplicateGroup *)self group];
  id v7 = [(PLDuplicateGroup *)self printStringListFromOIDs:v6];
  [v5 appendString:v7];

  [v5 appendString:@" }, SubGroup:{ "];
  uint64_t v8 = [(PLDuplicateGroup *)self subGroups];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  long long v16 = __36__PLDuplicateGroup_debugDescription__block_invoke;
  long long v17 = &unk_1E586C450;
  id v9 = v5;
  id v18 = v9;
  long long v19 = self;
  [v8 enumerateObjectsUsingBlock:&v14];

  [v9 appendString:@" }, Excluded Group:{ ", v14, v15, v16, v17];
  v10 = [(PLDuplicateGroup *)self excludedGroup];
  v11 = [(PLDuplicateGroup *)self printStringListFromOIDs:v10];
  [v9 appendString:v11];

  [v9 appendString:@" }"];
  id v12 = v9;

  return v12;
}

uint64_t __36__PLDuplicateGroup_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 appendString:@"{ "];
  id v5 = *(void **)(a1 + 32);
  v6 = [*(id *)(a1 + 40) printStringListFromOIDs:v4];

  [v5 appendString:v6];
  id v7 = *(void **)(a1 + 32);
  return [v7 appendString:@" }"];
}

- (id)printStringListFromOIDs:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    char v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((v9 & 1) == 0) {
          [v4 appendString:@", "];
        }
        id v12 = [v11 URIRepresentation];
        v13 = [v12 relativePath];
        [v4 appendFormat:@"%@", v13];

        char v9 = 0;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      char v9 = 0;
    }
    while (v7);
  }

  return v4;
}

- (PLDuplicateGroup)initWithGroupResults:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLDuplicateGroup;
  id v5 = [(PLDuplicateGroup *)&v13 init];
  if (v5)
  {
    if (v4) {
      uint64_t v6 = (NSMutableSet *)[v4 mutableCopy];
    }
    else {
      uint64_t v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    mutableGroup = v5->_mutableGroup;
    v5->_mutableGroup = v6;

    uint64_t v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    mutableExcludedGroup = v5->_mutableExcludedGroup;
    v5->_mutableExcludedGroup = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    mutableSubGroups = v5->_mutableSubGroups;
    v5->_mutableSubGroups = v10;
  }
  return v5;
}

- (PLDuplicateGroup)init
{
  return [(PLDuplicateGroup *)self initWithGroupResults:0];
}

@end