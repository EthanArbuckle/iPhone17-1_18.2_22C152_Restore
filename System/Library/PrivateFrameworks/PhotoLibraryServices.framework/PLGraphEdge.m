@interface PLGraphEdge
+ (BOOL)managedObjectConformsToProtocolPLGraphEdgeReferenceRecipient:(id)a3;
+ (id)_edgeReferenceRelationshipNames;
+ (id)_edgeReferenceSourceRelationshipNames;
+ (id)_edgeReferenceTargetRelationshipNames;
+ (id)_edgesForObject:(id)a3 relationshipPrefix:(id)a4;
+ (id)_entityNameFromRelationshipName:(id)a3;
+ (id)_sourceRelationshipNameForEntity:(id)a3;
+ (id)_targetRelationshipNameForEntity:(id)a3;
+ (id)edgesInToObject:(id)a3;
+ (id)edgesOutFromObject:(id)a3;
+ (id)entityName;
+ (id)insertGraphEdgeInContext:(id)a3 withPrimaryLabel:(id)a4;
+ (id)objectIDsPendingDanglingReferenceCleanupForManagedObjectContext:(id)a3;
+ (void)cleanupDanglingReferencesInManagedObjectContext:(id)a3;
+ (void)registerDeletedObjectForDanglingReferenceCleanup:(id)a3;
- (BOOL)hasLabel:(id)a3;
- (BOOL)hasLabelWithCode:(unsigned int)a3;
- (BOOL)validateForInsert:(id *)a3;
- (id)edgeValueWithName:(id)a3;
- (id)edgeValueWithName:(id)a3 createIfMissing:(BOOL)a4;
- (void)addEdgeValue:(id)a3;
- (void)addLabel:(id)a3;
- (void)prepareForDeletion;
- (void)removeEdgeValue:(id)a3;
- (void)removeLabel:(id)a3;
- (void)willSave;
@end

@implementation PLGraphEdge

- (id)edgeValueWithName:(id)a3
{
  return [(PLGraphEdge *)self edgeValueWithName:a3 createIfMissing:0];
}

- (id)edgeValueWithName:(id)a3 createIfMissing:(BOOL)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PLGraphEdge.m", 286, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  if (![(PLGraphEdge *)self hasFaultForRelationshipNamed:@"values"])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v12 = [(PLGraphEdge *)self values];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v18 = [v17 valueName];
          int v19 = [v18 isEqualToString:v6];

          if (v19)
          {
            id v11 = v17;
            goto LABEL_15;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    goto LABEL_16;
  }
  v7 = [(PLGraphEdge *)self values];
  v8 = (void *)MEMORY[0x1E4F28F60];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __49__PLGraphEdge_edgeValueWithName_createIfMissing___block_invoke;
  v28[3] = &unk_1E5871DE0;
  id v29 = v6;
  v9 = [v8 predicateWithBlock:v28];
  v10 = [v7 filteredSetUsingPredicate:v9];

  id v11 = [v10 anyObject];

  v12 = v29;
LABEL_15:

  if (!v11)
  {
LABEL_16:
    v20 = +[PLGraphEdgeValue entityName];
    v21 = [(PLGraphEdge *)self managedObjectContext];
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v20, (uint64_t)v21, 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    [v11 setValueName:v6];
    [(PLGraphEdge *)self addEdgeValue:v11];
  }

  return v11;
}

uint64_t __49__PLGraphEdge_edgeValueWithName_createIfMissing___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 valueName];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)hasLabel:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [(PLGraphEdge *)self objectIDsForRelationshipNamed:@"labels"];
  id v6 = [v4 objectID];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (BOOL)hasLabelWithCode:(unsigned int)a3
{
  id v4 = [(PLGraphEdge *)self labels];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__PLGraphEdge_hasLabelWithCode___block_invoke;
  v8[3] = &__block_descriptor_36_e39_B24__0__PLGraphLabel_8__NSDictionary_16l;
  unsigned int v9 = a3;
  v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:v8];
  id v6 = [v4 filteredSetUsingPredicate:v5];

  LOBYTE(v5) = [v6 count] != 0;
  return (char)v5;
}

BOOL __32__PLGraphEdge_hasLabelWithCode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 code] == *(_DWORD *)(a1 + 32);
}

- (void)prepareForDeletion
{
  v7.receiver = self;
  v7.super_class = (Class)PLGraphEdge;
  [(PLManagedObject *)&v7 prepareForDeletion];
  v3 = [(PLGraphEdge *)self sourceNode];

  if (v3)
  {
    id v4 = [(PLGraphEdge *)self sourceNode];
    objc_msgSend((id)objc_msgSend(v4, "nodeContainerClass"), "prepareForDeletingOutgoingEdge:", self);
  }
  v5 = [(PLGraphEdge *)self targetNode];

  if (v5)
  {
    id v6 = [(PLGraphEdge *)self targetNode];
    objc_msgSend((id)objc_msgSend(v6, "nodeContainerClass"), "prepareForDeletingIncomingEdge:", self);
  }
}

- (void)willSave
{
  v7.receiver = self;
  v7.super_class = (Class)PLGraphEdge;
  [(PLManagedObject *)&v7 willSave];
  objc_opt_class();
  v3 = [(PLGraphEdge *)self managedObjectContext];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4 && [(PLGraphEdge *)self isInserted])
  {
    v5 = [(PLGraphEdge *)self sourceNode];

    if (v5)
    {
      id v6 = [(PLGraphEdge *)self sourceNode];
      objc_msgSend((id)objc_msgSend(v6, "nodeContainerClass"), "willInsertOutgoingEdge:", self);
    }
  }
}

- (void)removeEdgeValue:(id)a3
{
  id v4 = a3;
  [(PLGraphEdge *)self willAccessValueForKey:@"values"];
  id v5 = [(PLGraphEdge *)self mutableSetValueForKey:@"values"];
  [v5 removeObject:v4];

  [(PLGraphEdge *)self didAccessValueForKey:@"values"];
}

- (void)addEdgeValue:(id)a3
{
  id v4 = a3;
  [(PLGraphEdge *)self willAccessValueForKey:@"values"];
  id v5 = [(PLGraphEdge *)self mutableSetValueForKey:@"values"];
  [v5 addObject:v4];

  [(PLGraphEdge *)self didAccessValueForKey:@"values"];
}

- (void)removeLabel:(id)a3
{
  id v4 = a3;
  [(PLGraphEdge *)self willAccessValueForKey:@"labels"];
  id v5 = [(PLGraphEdge *)self mutableSetValueForKey:@"labels"];
  [v5 removeObject:v4];

  [(PLGraphEdge *)self didAccessValueForKey:@"labels"];
}

- (void)addLabel:(id)a3
{
  id v4 = a3;
  [(PLGraphEdge *)self willAccessValueForKey:@"labels"];
  id v5 = [(PLGraphEdge *)self mutableSetValueForKey:@"labels"];
  [v5 addObject:v4];

  [(PLGraphEdge *)self didAccessValueForKey:@"labels"];
}

- (BOOL)validateForInsert:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x19F38C0C0](self, a2)) {
    return 1;
  }
  v46.receiver = self;
  v46.super_class = (Class)PLGraphEdge;
  v37 = a3;
  BOOL v5 = [(PLGraphEdge *)&v46 validateForInsert:a3];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v6 = +[PLGraphEdge _edgeReferenceSourceRelationshipNames];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = [(PLGraphEdge *)self valueForKey:*(void *)(*((void *)&v42 + 1) + 8 * i)];
        uint64_t v13 = [v12 objectID];

        if (v13) {
          ++v9;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v14 = +[PLGraphEdge _edgeReferenceTargetRelationshipNames];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    unint64_t v17 = 0;
    uint64_t v18 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v14);
        }
        v20 = [(PLGraphEdge *)self valueForKey:*(void *)(*((void *)&v38 + 1) + 8 * j)];
        v21 = [v20 objectID];

        if (v21) {
          ++v17;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v16);
    BOOL v22 = v17 > 1;
  }
  else
  {
    BOOL v22 = 0;
  }

  if (v9 > 1 || v22)
  {
    v23 = NSString;
    uint64_t v24 = [(PLGraphEdge *)self sourceNode];
    long long v25 = [(PLGraphEdge *)self sourceAsset];
    long long v26 = [(PLGraphEdge *)self sourcePerson];
    long long v27 = [(PLGraphEdge *)self sourceMoment];
    v28 = [(PLGraphEdge *)self targetNode];
    id v29 = [(PLGraphEdge *)self targetAsset];
    v30 = [(PLGraphEdge *)self targetPerson];
    uint64_t v31 = [(PLGraphEdge *)self targetMoment];
    v36 = (void *)v24;
    v32 = [v23 stringWithFormat:@"There must be no more then one source and one target set (sourceNode: %p, sourceAsset: %p, sourcePerson: %p, sourceMoment: %p, targetNode: %p, targetAsset: %p, targetPerson: %p, targetMoment: %p)", v24, v25, v26, v27, v28, v29, v30, v31];
    v33 = (void *)PLErrorCreate();
    v34 = v33;
    if (v37) {
      id *v37 = v33;
    }

    return 0;
  }
  return v5;
}

+ (id)edgesOutFromObject:(id)a3
{
  return (id)[a1 _edgesForObject:a3 relationshipPrefix:@"source"];
}

+ (id)edgesInToObject:(id)a3
{
  return (id)[a1 _edgesForObject:a3 relationshipPrefix:@"target"];
}

+ (id)objectIDsPendingDanglingReferenceCleanupForManagedObjectContext:(id)a3
{
  v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"pl_objectsPendingCleanup"];

  return v4;
}

+ (void)cleanupDanglingReferencesInManagedObjectContext:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"pl_objectsPendingCleanup"];

  long long v27 = v6;
  if ([v6 count])
  {
    uint64_t v24 = v4;
    long long v26 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obuint64_t j = [a1 _edgeReferenceRelationshipNames];
    uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __63__PLGraphEdge_cleanupDanglingReferencesInManagedObjectContext___block_invoke;
          v33[3] = &unk_1E5871D98;
          v33[4] = v11;
          v33[5] = a1;
          v12 = objc_msgSend(v27, "_pl_filter:", v33);
          uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", v11, v12];
          [v26 addObject:v13];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v8);
    }

    uint64_t v14 = +[PLGraphEdge fetchRequest];
    uint64_t v15 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v26];
    [v14 setPredicate:v15];

    [v14 setFetchBatchSize:100];
    id v32 = 0;
    id v4 = v24;
    uint64_t v16 = [v24 executeFetchRequest:v14 error:&v32];
    id v17 = v32;
    if (v16)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v18 = v16;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v29;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v29 != v21) {
              objc_enumerationMutation(v18);
            }
            [v24 deleteObject:*(void *)(*((void *)&v28 + 1) + 8 * j)];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v40 count:16];
        }
        while (v20);
      }

      [v27 removeAllObjects];
    }
    else
    {
      v23 = PLBackendGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v17;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Failed to fetch edges with error: %@", buf, 0xCu);
      }
    }
  }
}

uint64_t __63__PLGraphEdge_cleanupDanglingReferencesInManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v4 = a2;
  BOOL v5 = [v2 _entityNameFromRelationshipName:v3];
  id v6 = [v4 entity];

  uint64_t v7 = [v6 name];
  uint64_t v8 = [v7 isEqualToString:v5];

  return v8;
}

+ (id)_entityNameFromRelationshipName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"PLGraphEdge.m", 207, @"Invalid parameter not satisfying: %@", @"relationshipName" object file lineNumber description];
  }
  if ([v5 hasPrefix:@"source"]) {
    id v6 = @"source";
  }
  else {
    id v6 = @"target";
  }
  objc_msgSend(v5, "substringFromIndex:", -[__CFString length](v6, "length"));
  uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v7 isEqualToString:@"Node"])
  {

    uint64_t v7 = @"GraphNode";
  }

  return v7;
}

+ (void)registerDeletedObjectForDanglingReferenceCleanup:(id)a3
{
  id v11 = a3;
  id v5 = [v11 managedObjectContext];
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"PLGraphEdge.m" lineNumber:195 description:@"must have a moc to registerDeletedObjectForDanglingReferenceCleanup"];
  }
  id v6 = [v5 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"pl_objectsPendingCleanup"];

  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v8 = [v5 userInfo];
    [v8 setObject:v7 forKeyedSubscript:@"pl_objectsPendingCleanup"];
  }
  uint64_t v9 = [v11 objectID];
  [v7 addObject:v9];
}

+ (BOOL)managedObjectConformsToProtocolPLGraphEdgeReferenceRecipient:(id)a3
{
  return objc_opt_respondsToSelector() & 1;
}

+ (id)entityName
{
  return @"GraphEdge";
}

+ (id)insertGraphEdgeInContext:(id)a3 withPrimaryLabel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PLGraphEdge.m", 117, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, a1, @"PLGraphEdge.m", 118, @"Invalid parameter not satisfying: %@", @"primaryLabel" object file lineNumber description];

LABEL_3:
  uint64_t v10 = +[PLGraphEdge entityName];
  id v11 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v10, (uint64_t)v7, 0);

  [v11 setPrimaryLabel:v9];
  return v11;
}

+ (id)_sourceRelationshipNameForEntity:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = [a3 name];
  id v5 = [v3 stringWithFormat:@"source%@", v4];

  return v5;
}

+ (id)_targetRelationshipNameForEntity:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = [a3 name];
  id v5 = [v3 stringWithFormat:@"target%@", v4];

  return v5;
}

+ (id)_edgesForObject:(id)a3 relationshipPrefix:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 managedObjectContext];
  id v8 = +[PLGraphEdge fetchRequest];
  uint64_t v9 = [v5 entity];
  uint64_t v10 = [v9 name];

  id v11 = [v5 entity];
  v12 = [v11 name];
  uint64_t v13 = +[PLGraphNode entityName];
  int v14 = [v12 isEqualToString:v13];

  if (v14)
  {

    uint64_t v10 = @"Node";
  }
  uint64_t v15 = [NSString stringWithFormat:@"%@%@", v6, v10];
  uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", v15, v5];
  [v8 setPredicate:v16];

  uint64_t v20 = 0;
  id v17 = [v7 executeFetchRequest:v8 error:&v20];
  id v18 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];

  return v18;
}

+ (id)_edgeReferenceTargetRelationshipNames
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"targetNode";
  v4[1] = @"targetAsset";
  v4[2] = @"targetMoment";
  v4[3] = @"targetPerson";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  return v2;
}

+ (id)_edgeReferenceSourceRelationshipNames
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"sourceNode";
  v4[1] = @"sourceAsset";
  v4[2] = @"sourceMoment";
  v4[3] = @"sourcePerson";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  return v2;
}

+ (id)_edgeReferenceRelationshipNames
{
  uint64_t v3 = [a1 _edgeReferenceSourceRelationshipNames];
  id v4 = [a1 _edgeReferenceTargetRelationshipNames];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

@end