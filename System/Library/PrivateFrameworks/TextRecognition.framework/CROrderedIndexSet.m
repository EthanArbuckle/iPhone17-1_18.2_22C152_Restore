@interface CROrderedIndexSet
- (CROrderedIndexSet)initWithArray:(id)a3;
- (NSArray)indices;
- (NSArray)sourceArray;
- (NSMutableArray)indexedObjects;
- (NSMutableOrderedSet)indicesSet;
- (id)objects;
- (id)subIndexSetWithRange:(_NSRange)a3;
- (unint64_t)count;
- (void)addAllIndices;
- (void)addIndex:(unint64_t)a3;
- (void)addIndexSet:(id)a3;
- (void)addIndices:(id)a3;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)setIndexedObjects:(id)a3;
- (void)setIndicesSet:(id)a3;
- (void)setSourceArray:(id)a3;
@end

@implementation CROrderedIndexSet

- (CROrderedIndexSet)initWithArray:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CROrderedIndexSet;
  v6 = [(CROrderedIndexSet *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceArray, a3);
    uint64_t v8 = objc_opt_new();
    indexedObjects = v7->_indexedObjects;
    v7->_indexedObjects = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_new();
    indicesSet = v7->_indicesSet;
    v7->_indicesSet = (NSMutableOrderedSet *)v10;
  }
  return v7;
}

- (id)subIndexSetWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6 = [(CROrderedIndexSet *)self indices];
  v7 = objc_msgSend(v6, "subarrayWithRange:", location, length);

  if (v7)
  {
    uint64_t v8 = [CROrderedIndexSet alloc];
    v9 = [(CROrderedIndexSet *)self sourceArray];
    uint64_t v10 = [(CROrderedIndexSet *)v8 initWithArray:v9];

    [(CROrderedIndexSet *)v10 addIndices:v7];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (NSArray)indices
{
  v2 = [(CROrderedIndexSet *)self indicesSet];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (id)objects
{
  v2 = [(CROrderedIndexSet *)self indexedObjects];
  v3 = (void *)[v2 copy];

  return v3;
}

- (unint64_t)count
{
  v2 = [(CROrderedIndexSet *)self indices];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)addIndex:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = [(CROrderedIndexSet *)self sourceArray];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    v14 = CROSLogForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v17 = a3;
      _os_log_impl(&dword_1DD733000, v14, OS_LOG_TYPE_FAULT, "Attempting to add an out-of-bounds index %lu to ordered index set", buf, 0xCu);
    }
  }
  else
  {
    v7 = [(CROrderedIndexSet *)self indicesSet];
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
    char v9 = [v7 containsObject:v8];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [(CROrderedIndexSet *)self indicesSet];
      v11 = [NSNumber numberWithUnsignedInteger:a3];
      [v10 addObject:v11];

      id v15 = [(CROrderedIndexSet *)self indexedObjects];
      v12 = [(CROrderedIndexSet *)self sourceArray];
      objc_super v13 = [v12 objectAtIndexedSubscript:a3];
      [v15 addObject:v13];
    }
  }
}

- (void)addIndices:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[CROrderedIndexSet addIndex:](self, "addIndex:", [*(id *)(*((void *)&v9 + 1) + 8 * v8++) unsignedIntegerValue]);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addIndexSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 sourceArray];
  uint64_t v6 = [(CROrderedIndexSet *)self sourceArray];

  if (v5 == v6)
  {
    uint64_t v8 = [v4 indices];
    [(CROrderedIndexSet *)self addIndices:v8];
  }
  else
  {
    uint64_t v7 = CROSLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long v9 = 0;
      _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_FAULT, "Attempting to combine two index sets with different backing arrays", v9, 2u);
    }
  }
}

- (void)addAllIndices
{
  unint64_t v3 = [(CROrderedIndexSet *)self sourceArray];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      [(CROrderedIndexSet *)self addIndex:v5++];
      uint64_t v6 = [(CROrderedIndexSet *)self sourceArray];
      unint64_t v7 = [v6 count];
    }
    while (v5 < v7);
  }
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CROrderedIndexSet *)self indices];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CROrderedIndexSet_enumerateObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E6CDBAD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __48__CROrderedIndexSet_enumerateObjectsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = [a2 unsignedIntegerValue];
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) sourceArray];
  long long v9 = [v10 objectAtIndexedSubscript:v7];
  (*(void (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v9, v7, a3, a4);
}

- (NSArray)sourceArray
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSourceArray:(id)a3
{
}

- (NSMutableArray)indexedObjects
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIndexedObjects:(id)a3
{
}

- (NSMutableOrderedSet)indicesSet
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIndicesSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicesSet, 0);
  objc_storeStrong((id *)&self->_indexedObjects, 0);
  objc_storeStrong((id *)&self->_sourceArray, 0);
}

@end