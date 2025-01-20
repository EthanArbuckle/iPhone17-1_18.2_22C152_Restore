@interface _UICollectionLayoutUpdateContainerOffsetResult
- (NSSet)invalidatedAuxillaryKinds;
- (_UICollectionLayoutUpdateContainerOffsetResult)init;
- (id)indexPathsForInvalidatedSupplementariesOfKind:(id)a3;
- (void)addInvalidatedSupplementaryForKind:(id)a3 indexPath:(id)a4;
@end

@implementation _UICollectionLayoutUpdateContainerOffsetResult

- (void)addInvalidatedSupplementaryForKind:(id)a3 indexPath:(id)a4
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UICollectionCompositionalLayoutSolver.m", 3633, @"Invalid parameter not satisfying: %@", @"kind" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"_UICollectionCompositionalLayoutSolver.m", 3634, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];

LABEL_3:
  v8 = [(NSMutableDictionary *)self->_invalidatedSupplementaryIndexesDict objectForKeyedSubscript:a3];
  if (!v8)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMutableDictionary *)self->_invalidatedSupplementaryIndexesDict setObject:v11 forKeyedSubscript:a3];
    v8 = v11;
  }
  id v12 = v8;
  [v8 addObject:a4];
}

- (NSSet)invalidatedAuxillaryKinds
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(NSMutableDictionary *)self->_invalidatedSupplementaryIndexesDict allKeys];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (id)indexPathsForInvalidatedSupplementariesOfKind:(id)a3
{
  if (!a3)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UICollectionCompositionalLayoutSolver.m", 3627, @"Invalid parameter not satisfying: %@", @"kind" object file lineNumber description];
  }
  uint64_t v5 = [(NSMutableDictionary *)self->_invalidatedSupplementaryIndexesDict objectForKeyedSubscript:a3];
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    v7 = (void *)v5;
  }
  id v8 = v7;

  return v8;
}

- (void).cxx_destruct
{
}

- (_UICollectionLayoutUpdateContainerOffsetResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UICollectionLayoutUpdateContainerOffsetResult;
  v2 = [(_UICollectionLayoutUpdateContainerOffsetResult *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    invalidatedSupplementaryIndexesDict = v2->_invalidatedSupplementaryIndexesDict;
    v2->_invalidatedSupplementaryIndexesDict = v3;
  }
  return v2;
}

@end