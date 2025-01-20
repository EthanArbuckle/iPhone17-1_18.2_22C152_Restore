@interface REOrderingArray
- (BOOL)containsObject:(id)a3;
- (NSArray)comparators;
- (REOrderingArray)initWithComparators:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)indexOfObject:(id)a3;
- (void)_createDependenciesForObject:(id)a3;
- (void)_performOrMarkUpdate;
- (void)_updateContentOrder;
- (void)addObject:(id)a3;
- (void)performBatchUpdates:(id)a3;
- (void)removeObject:(id)a3;
- (void)updateObject:(id)a3;
@end

@implementation REOrderingArray

- (REOrderingArray)initWithComparators:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)REOrderingArray;
  v6 = [(REOrderingArray *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_comparators, a3);
    orderedObjects = v7->_orderedObjects;
    v7->_orderedObjects = (NSArray *)MEMORY[0x263EFFA68];

    v9 = [[REDependencyGraph alloc] initWithPointerFunctions:0];
    dependencyGraph = v7->_dependencyGraph;
    v7->_dependencyGraph = v9;
  }
  return v7;
}

- (unint64_t)count
{
  return [(NSArray *)self->_orderedObjects count];
}

- (BOOL)containsObject:(id)a3
{
  return [(REDependencyGraph *)self->_dependencyGraph containsItem:a3];
}

- (unint64_t)indexOfObject:(id)a3
{
  return [(NSArray *)self->_orderedObjects indexOfObject:a3];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_orderedObjects objectAtIndexedSubscript:a3];
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return [(NSArray *)self->_orderedObjects objectAtIndexedSubscript:a3];
}

- (void)_createDependenciesForObject:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_comparators count] >= 2)
  {
    unint64_t v5 = 1;
    do
    {
      v6 = [(NSArray *)self->_comparators objectAtIndexedSubscript:v5];
      dependencyGraph = self->_dependencyGraph;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __48__REOrderingArray__createDependenciesForObject___block_invoke;
      v10[3] = &unk_2644BD6D8;
      id v8 = v4;
      objc_super v12 = self;
      id v13 = v6;
      id v11 = v8;
      id v9 = v6;
      [(REDependencyGraph *)dependencyGraph enumerateObjectsUsingBlock:v10];

      ++v5;
    }
    while (v5 < [(NSArray *)self->_comparators count]);
  }
}

uint64_t __48__REOrderingArray__createDependenciesForObject___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if ((id)a1[4] != v3)
  {
    id v8 = v3;
    id v3 = (id)(*(uint64_t (**)(void))(a1[6] + 16))();
    if (v3 == (id)-1)
    {
      id v6 = (id)a1[4];
      id v5 = v8;
    }
    else
    {
      id v4 = v8;
      if (v3 != (id)1) {
        goto LABEL_7;
      }
      id v5 = (id)a1[4];
      id v6 = v8;
    }
    id v3 = (id)[*(id *)(a1[5] + 16) markItem:v6 dependentOnItem:v5];
    id v4 = v8;
  }
LABEL_7:
  return MEMORY[0x270F9A758](v3, v4);
}

- (void)addObject:(id)a3
{
  dependencyGraph = self->_dependencyGraph;
  id v5 = a3;
  [(REDependencyGraph *)dependencyGraph addItem:v5];
  [(REOrderingArray *)self _createDependenciesForObject:v5];

  [(REOrderingArray *)self _performOrMarkUpdate];
}

- (void)removeObject:(id)a3
{
  [(REDependencyGraph *)self->_dependencyGraph removeItem:a3];
  [(REOrderingArray *)self _performOrMarkUpdate];
}

- (void)updateObject:(id)a3
{
  dependencyGraph = self->_dependencyGraph;
  id v5 = a3;
  [(REDependencyGraph *)dependencyGraph removeItem:v5];
  [(REDependencyGraph *)self->_dependencyGraph addItem:v5];
  [(REOrderingArray *)self _createDependenciesForObject:v5];

  [(REOrderingArray *)self _performOrMarkUpdate];
}

- (void)performBatchUpdates:(id)a3
{
  id v4 = a3;
  unint64_t batchCount = self->_batchCount;
  self->_unint64_t batchCount = batchCount + 1;
  id v6 = v4;
  if (v4)
  {
    (*((void (**)(void))v4 + 2))();
    unint64_t batchCount = self->_batchCount - 1;
  }
  self->_unint64_t batchCount = batchCount;
  if (!batchCount && self->_needsUpdate) {
    [(REOrderingArray *)self _updateContentOrder];
  }
}

- (void)_performOrMarkUpdate
{
  if (self->_batchCount) {
    self->_needsUpdate = 1;
  }
  else {
    [(REOrderingArray *)self _updateContentOrder];
  }
}

- (void)_updateContentOrder
{
  self->_needsUpdate = 0;
  id v3 = [(NSArray *)self->_comparators firstObject];
  dependencyGraph = self->_dependencyGraph;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__REOrderingArray__updateContentOrder__block_invoke;
  v8[3] = &unk_2644BD700;
  id v9 = v3;
  id v5 = v3;
  id v6 = [(REDependencyGraph *)dependencyGraph topologicalSortedItemsWithComparator:v8];
  orderedObjects = self->_orderedObjects;
  self->_orderedObjects = v6;
}

uint64_t __38__REOrderingArray__updateContentOrder__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSArray)comparators
{
  return self->_comparators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparators, 0);
  objc_storeStrong((id *)&self->_dependencyGraph, 0);
  objc_storeStrong((id *)&self->_orderedObjects, 0);
}

@end