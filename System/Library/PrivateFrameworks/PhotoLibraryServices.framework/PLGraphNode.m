@interface PLGraphNode
+ (PLGraphNode)graphNodeWithUUID:(id)a3 inManagedObjectContext:(id)a4;
+ (id)entityName;
+ (id)insertGraphNodeInContext:(id)a3 withPrimaryLabel:(id)a4;
+ (id)isEligibleForSearchIndexingPredicateForLibraryIdentifier:(int64_t)a3;
+ (id)propertiesToFetch;
+ (id)relationshipKeyPathsToPrefetch;
- (BOOL)isEligibleForSearchIndexing;
- (BOOL)needsPersistenceUpdate;
- (BOOL)shouldUpdatePersistence;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (Class)nodeContainerClass;
- (id)edgesIn;
- (id)edgesOut;
- (id)nodeValueWithName:(id)a3;
- (id)nodeValueWithName:(id)a3 createIfMissing:(BOOL)a4;
- (id)searchIdentifier;
- (unsigned)primaryLabelCode;
- (void)addNodeValue:(id)a3;
- (void)didSave;
- (void)implementsPLGraphEdgeReferenceObjectRecipient;
- (void)prepareForDeletion;
- (void)removeNodeValue:(id)a3;
- (void)setNeedsPersistenceUpdate:(BOOL)a3;
- (void)willSave;
@end

@implementation PLGraphNode

- (BOOL)isEligibleForSearchIndexing
{
  v2 = [(PLGraphNode *)self primaryLabel];
  BOOL v3 = [v2 code] == 1100;

  return v3;
}

- (id)searchIdentifier
{
  BOOL v3 = [(PLGraphNode *)self primaryLabel];
  int v4 = [v3 code];

  if (v4 == 1100)
  {
    id v5 = +[PLGraphNodeContainer newNodeContainerWithNode:self];
    v6 = [v5 encodedIdentifierString];
  }
  else
  {
    v6 = [(PLGraphNode *)self uuid];
  }
  return v6;
}

+ (id)relationshipKeyPathsToPrefetch
{
  return 0;
}

+ (id)propertiesToFetch
{
  return 0;
}

+ (id)isEligibleForSearchIndexingPredicateForLibraryIdentifier:(int64_t)a3
{
  return +[PLSearchEntity predicateForSearchEntitySourceNodes];
}

- (void)setNeedsPersistenceUpdate:(BOOL)a3
{
  *((unsigned char *)&self->super._willSaveCallCount + 2) = a3;
}

- (BOOL)needsPersistenceUpdate
{
  return *((unsigned char *)&self->super._willSaveCallCount + 2);
}

- (BOOL)shouldUpdatePersistence
{
  v2 = [(PLGraphNode *)self managedObjectContext];
  BOOL v3 = [v2 pathManager];

  if (v3)
  {
    if ([v3 isDCIM]) {
      char v4 = 1;
    }
    else {
      char v4 = MEMORY[0x19F38C0C0]();
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (Class)nodeContainerClass
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PLGraphNode *)self managedObjectContext];
  char v4 = objc_msgSend(v3, "pl_graphCache");
  id v5 = objc_msgSend(v4, "objectIDForLabelWithCode:inContext:", -[PLGraphNode primaryLabelCode](self, "primaryLabelCode"), v3);
  if (v5)
  {
    v6 = (void *)[v4 classFromLabelID:v5 withContext:v3];
    if (!v6)
    {
      v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v8 = +[PLGraphLabel labelNameFromCode:[(PLGraphNode *)self primaryLabelCode]];
        int v12 = 138412546;
        v13 = v8;
        __int16 v14 = 2112;
        v15 = v5;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_FAULT, "Expected a class for primary label %@ (object ID: %@)", (uint8_t *)&v12, 0x16u);
      }
    }
    id v9 = v6;
  }
  else
  {
    v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      v13 = self;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "No primary label code for node: %@", (uint8_t *)&v12, 0xCu);
    }

    id v9 = 0;
  }

  return (Class)v9;
}

- (id)nodeValueWithName:(id)a3
{
  return [(PLGraphNode *)self nodeValueWithName:a3 createIfMissing:0];
}

- (id)nodeValueWithName:(id)a3 createIfMissing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PLGraphNode.m", 184, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  if ([(PLGraphNode *)self hasFaultForRelationshipNamed:@"values"])
  {
    v8 = [(PLGraphNode *)self values];
    id v9 = (void *)MEMORY[0x1E4F28F60];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __49__PLGraphNode_nodeValueWithName_createIfMissing___block_invoke;
    v27[3] = &unk_1E586C9B8;
    id v28 = v7;
    v10 = [v9 predicateWithBlock:v27];
    v11 = [v8 filteredSetUsingPredicate:v10];

    id v12 = [v11 anyObject];

    v13 = v28;
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v13 = [(PLGraphNode *)self values];
    id v12 = (id)[v13 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v12)
    {
      uint64_t v14 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v13);
          }
          uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v17 = [v16 valueName];
          int v18 = [v17 isEqualToString:v7];

          if (v18)
          {
            id v12 = v16;
            goto LABEL_15;
          }
        }
        id v12 = (id)[v13 countByEnumeratingWithState:&v23 objects:v29 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
  }
LABEL_15:

  if (!v12 && v4)
  {
    v19 = +[PLGraphNodeValue entityName];
    v20 = [(PLGraphNode *)self managedObjectContext];
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v19, (uint64_t)v20, 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    [v12 setValueName:v7];
    [(PLGraphNode *)self addNodeValue:v12];
  }

  return v12;
}

uint64_t __49__PLGraphNode_nodeValueWithName_createIfMissing___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 valueName];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)implementsPLGraphEdgeReferenceObjectRecipient
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
}

- (id)edgesOut
{
  return +[PLGraphEdge edgesOutFromObject:self];
}

- (id)edgesIn
{
  return +[PLGraphEdge edgesInToObject:self];
}

- (void)prepareForDeletion
{
  v3.receiver = self;
  v3.super_class = (Class)PLGraphNode;
  [(PLManagedObject *)&v3 prepareForDeletion];
  [(objc_class *)[(PLGraphNode *)self nodeContainerClass] prepareForDeletionWithNode:self];
  if ((PLIsAssetsd() & 1) != 0 || MEMORY[0x19F38C0C0]()) {
    +[PLGraphEdge registerDeletedObjectForDanglingReferenceCleanup:self];
  }
}

- (void)didSave
{
  v3.receiver = self;
  v3.super_class = (Class)PLGraphNode;
  [(PLManagedObject *)&v3 didSave];
  [(objc_class *)[(PLGraphNode *)self nodeContainerClass] didSaveWithNode:self];
  [(PLGraphNode *)self setNeedsPersistenceUpdate:0];
}

- (void)willSave
{
  v8.receiver = self;
  v8.super_class = (Class)PLGraphNode;
  [(PLManagedObject *)&v8 willSave];
  if ([(PLGraphNode *)self isDeleted]
    && ((PLIsAssetsd() & 1) != 0 || MEMORY[0x19F38C0C0]()))
  {
    objc_super v3 = [(PLGraphNode *)self managedObjectContext];
    +[PLGraphEdge cleanupDanglingReferencesInManagedObjectContext:v3];
  }
  objc_opt_class();
  id v4 = [(PLGraphNode *)self managedObjectContext];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 || MEMORY[0x19F38C0C0]())
  {
    [(PLGraphNode *)self setNeedsPersistenceUpdate:0];
    [(objc_class *)[(PLGraphNode *)self nodeContainerClass] willSaveWithNode:self];
  }
}

- (void)removeNodeValue:(id)a3
{
  id v4 = a3;
  [(PLGraphNode *)self willAccessValueForKey:@"values"];
  id v5 = [(PLGraphNode *)self mutableSetValueForKey:@"values"];
  [v5 removeObject:v4];

  [(PLGraphNode *)self didAccessValueForKey:@"values"];
}

- (void)addNodeValue:(id)a3
{
  id v4 = a3;
  [(PLGraphNode *)self willAccessValueForKey:@"values"];
  id v5 = [(PLGraphNode *)self mutableSetValueForKey:@"values"];
  [v5 addObject:v4];

  [(PLGraphNode *)self didAccessValueForKey:@"values"];
}

- (BOOL)validateForUpdate:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLGraphNode;
  if (![(PLGraphNode *)&v7 validateForUpdate:a3]) {
    return 0;
  }
  id v4 = [(PLGraphNode *)self primaryLabel];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)validateForInsert:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLGraphNode;
  if (![(PLGraphNode *)&v7 validateForInsert:a3]) {
    return 0;
  }
  id v4 = [(PLGraphNode *)self primaryLabel];
  BOOL v5 = v4 != 0;

  return v5;
}

- (unsigned)primaryLabelCode
{
  [(PLGraphNode *)self willAccessValueForKey:@"primaryLabelCode"];
  objc_super v3 = [(PLGraphNode *)self primitiveValueForKey:@"primaryLabelCode"];
  unsigned int v4 = [v3 unsignedIntValue];

  if (!v4)
  {
    BOOL v5 = [(PLGraphNode *)self primaryLabel];
    unsigned int v4 = [v5 code];
  }
  [(PLGraphNode *)self didAccessValueForKey:@"primaryLabelCode"];
  return v4;
}

+ (PLGraphNode)graphNodeWithUUID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__63241;
  v20 = __Block_byref_object_dispose__63242;
  id v21 = 0;
  if (v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__PLGraphNode_graphNodeWithUUID_inManagedObjectContext___block_invoke;
    v11[3] = &unk_1E5873DC0;
    id v12 = v6;
    id v15 = a1;
    id v13 = v7;
    uint64_t v14 = &v16;
    [v13 performBlockAndWait:v11];

    objc_super v8 = (void *)v17[5];
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = v8;
  _Block_object_dispose(&v16, 8);

  return (PLGraphNode *)v9;
}

void __56__PLGraphNode_graphNodeWithUUID_inManagedObjectContext___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"uuid", *(void *)(a1 + 32)];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  objc_super v3 = [*(id *)(a1 + 56) entityName];
  unsigned int v4 = [v2 fetchRequestWithEntityName:v3];

  [v4 setPredicate:v9];
  [v4 setFetchLimit:1];
  BOOL v5 = [*(id *)(a1 + 40) executeFetchRequest:v4 error:0];
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  objc_super v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

+ (id)insertGraphNodeInContext:(id)a3 withPrimaryLabel:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PLGraphNode.m", 153, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, a1, @"PLGraphNode.m", 154, @"Invalid parameter not satisfying: %@", @"primaryLabel" object file lineNumber description];

LABEL_3:
  objc_super v8 = +[PLGraphNode entityName];
  id v9 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)v5, 0);

  [v9 setPrimaryLabel:v7];
  v10 = (void *)[v9 nodeContainerClass];
  if (!v10)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PLGraphNode.m", 159, @"Invalid parameter not satisfying: %@", @"containerClass != nil" object file lineNumber description];
  }
  v11 = [v10 requiredNodeValueKeys];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [v10 defaultValueForRequiredNodeValueKey:*(void *)(*((void *)&v25 + 1) + 8 * v15) forNode:v9];
        v17 = [v16 node];

        if (v17 != v9)
        {
          uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:a2, a1, @"PLGraphNode.m", 163, @"Invalid parameter not satisfying: %@", @"nodeValue.node == node" object file lineNumber description];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  return v9;
}

+ (id)entityName
{
  return @"GraphNode";
}

@end