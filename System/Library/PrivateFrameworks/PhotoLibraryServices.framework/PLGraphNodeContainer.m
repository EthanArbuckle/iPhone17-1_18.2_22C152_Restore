@interface PLGraphNodeContainer
+ (NSSet)requiredNodeValueKeys;
+ (NSSet)sortableKeys;
+ (id)changeFlagKeysForNodeContainerKey:(id)a3;
+ (id)changeFlagsKeysByNodeContainerKey;
+ (id)defaultValueForRequiredNodeValueKey:(id)a3 forNode:(id)a4;
+ (id)newNodeContainerWithManagedObjectContext:(id)a3;
+ (id)newNodeContainerWithNode:(id)a3;
+ (id)newNodeContainerWithNode:(id)a3 containerClass:(Class)a4;
+ (id)nodeContainerKeysByChangeFlagKey;
+ (void)validateAllKnownSubclassesWithManagedObjectContext:(id)a3;
- (NSString)uuid;
- (PLGraphNode)sourceNode;
- (PLGraphNodeContainer)initWithNode:(id)a3;
- (signed)cloudDeleteState;
- (signed)cloudLocalState;
- (void)setCloudDeleteState:(signed __int16)a3;
- (void)setCloudLocalState:(signed __int16)a3;
- (void)setSourceNode:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateChangeFlagsForNodeContainerKey:(id)a3;
@end

@implementation PLGraphNodeContainer

- (void).cxx_destruct
{
}

- (void)setSourceNode:(id)a3
{
}

- (PLGraphNode)sourceNode
{
  return self->_sourceNode;
}

- (void)updateChangeFlagsForNodeContainerKey:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() changeFlagsKeysByNodeContainerKey];
  v6 = [v5 objectForKeyedSubscript:v4];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__PLGraphNodeContainer_updateChangeFlagsForNodeContainerKey___block_invoke;
  v7[3] = &unk_1E5863E80;
  v7[4] = self;
  [v6 enumerateObjectsUsingBlock:v7];
}

void __61__PLGraphNodeContainer_updateChangeFlagsForNodeContainerKey___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 sourceNode];
  v6 = [v5 valueForKey:v4];
  int v7 = [v6 integerValue];

  id v9 = [*(id *)(a1 + 32) sourceNode];
  v8 = [NSNumber numberWithInt:(v7 + 1)];
  [v9 setValue:v8 forKey:v4];
}

- (void)setCloudDeleteState:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(PLGraphNodeContainer *)self sourceNode];
  [v4 setCloudDeleteState:v3];
}

- (signed)cloudDeleteState
{
  v2 = [(PLGraphNodeContainer *)self sourceNode];
  signed __int16 v3 = [v2 cloudDeleteState];

  return v3;
}

- (void)setCloudLocalState:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(PLGraphNodeContainer *)self sourceNode];
  [v4 setCloudLocalState:v3];
}

- (signed)cloudLocalState
{
  v2 = [(PLGraphNodeContainer *)self sourceNode];
  signed __int16 v3 = [v2 cloudLocalState];

  return v3;
}

- (void)setUuid:(id)a3
{
  id v4 = a3;
  id v5 = [(PLGraphNodeContainer *)self sourceNode];
  [v5 setUuid:v4];
}

- (NSString)uuid
{
  v2 = [(PLGraphNodeContainer *)self sourceNode];
  signed __int16 v3 = [v2 uuid];

  return (NSString *)v3;
}

- (PLGraphNodeContainer)initWithNode:(id)a3
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLGraphNodeContainer;
  int v7 = [(PLGraphNodeContainer *)&v10 init];
  if (v7)
  {
    if (!v6)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v7, @"PLGraphNodeContainer.m", 26, @"Invalid parameter not satisfying: %@", @"node" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_sourceNode, a3);
  }

  return v7;
}

+ (id)newNodeContainerWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  PFAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

+ (void)validateAllKnownSubclassesWithManagedObjectContext:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v5 = v3;
  id v4 = v3;
  PFObjc_enumerateSubclassesForHeader();
}

void __75__PLGraphNodeContainer_validateAllKnownSubclassesWithManagedObjectContext___block_invoke(uint64_t a1, Class aClass)
{
  id v4 = NSStringFromClass(aClass);
  id v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PLGraphNodeContainer_validateAllKnownSubclassesWithManagedObjectContext___block_invoke_2;
  v7[3] = &unk_1E586A490;
  Class v10 = aClass;
  id v8 = v5;
  id v9 = v4;
  id v6 = v4;
  [v8 performBlockAndWait:v7];
}

void __75__PLGraphNodeContainer_validateAllKnownSubclassesWithManagedObjectContext___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v23 = (void *)[*(id *)(a1 + 48) newNodeContainerWithManagedObjectContext:*(void *)(a1 + 32)];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [*(id *)(a1 + 48) requiredNodeValueKeys];
  uint64_t v2 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v22 = *(void *)v26;
    uint64_t v20 = *MEMORY[0x1E4F1C3B8];
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v25 + 1) + 8 * v4);
        id v6 = (void *)MEMORY[0x1E4F1C0D0];
        int v7 = +[PLGraphNodeValue entityName];
        id v8 = [v6 fetchRequestWithEntityName:v7];

        id v9 = (void *)MEMORY[0x1E4F28BA0];
        Class v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"valueName", v5];
        v29[0] = v10;
        v11 = (void *)MEMORY[0x1E4F28F60];
        v12 = [v23 sourceNode];
        v13 = [v11 predicateWithFormat:@"%K = %@", @"node", v12];
        v29[1] = v13;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
        v15 = [v9 andPredicateWithSubpredicates:v14];
        [v8 setPredicate:v15];

        v16 = *(void **)(a1 + 32);
        id v24 = 0;
        v17 = [v16 executeFetchRequest:v8 error:&v24];
        id v18 = v24;
        uint64_t v19 = [v17 count];

        if (!v19) {
          [MEMORY[0x1E4F1CA00] raise:v20, @"failed validation for class %@ error: %@", *(void *)(a1 + 40), v18 format];
        }

        ++v4;
      }
      while (v3 != v4);
      uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v3);
  }
}

+ (id)defaultValueForRequiredNodeValueKey:(id)a3 forNode:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [v5 managedObjectContext];
  id v8 = +[PLManagedObject insertInManagedObjectContext:v7];

  [v8 setNode:v5];
  [v8 setValueName:v6];

  return v8;
}

+ (id)nodeContainerKeysByChangeFlagKey
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [a1 changeFlagsKeysByNodeContainerKey];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__PLGraphNodeContainer_nodeContainerKeysByChangeFlagKey__block_invoke;
  v7[3] = &unk_1E5876060;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __56__PLGraphNodeContainer_nodeContainerKeysByChangeFlagKey__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__PLGraphNodeContainer_nodeContainerKeysByChangeFlagKey__block_invoke_2;
  v7[3] = &unk_1E586A2D8;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a3 enumerateObjectsUsingBlock:v7];
}

void __56__PLGraphNodeContainer_nodeContainerKeysByChangeFlagKey__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
  }
  [v3 addObject:*(void *)(a1 + 40)];
}

+ (id)changeFlagKeysForNodeContainerKey:(id)a3
{
  id v4 = a3;
  id v5 = [a1 changeFlagsKeysByNodeContainerKey];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

+ (id)changeFlagsKeysByNodeContainerKey
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (NSSet)sortableKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"uuid";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  id v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (NSSet)requiredNodeValueKeys
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:MEMORY[0x1E4F1CBF0]];
}

+ (id)newNodeContainerWithNode:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "newNodeContainerWithNode:containerClass:", v4, objc_msgSend(v4, "nodeContainerClass"));

  return v5;
}

+ (id)newNodeContainerWithNode:(id)a3 containerClass:(Class)a4
{
  id v7 = a3;
  if (!a4)
  {
    Class v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PLGraphNodeContainer.m", 35, @"Couldn't find container class for node: %@", v7 object file lineNumber description];
  }
  id v8 = [[(objc_class *)a4 alloc] initWithNode:v7];

  return v8;
}

@end