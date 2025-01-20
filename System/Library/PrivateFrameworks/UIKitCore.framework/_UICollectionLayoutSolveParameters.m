@interface _UICollectionLayoutSolveParameters
+ (id)parametersForFullResolve;
- (BOOL)isEqual:(id)a3;
- (_UICollectionLayoutAuxillaryOffsets)invalidatedAuxillaryOffsets;
- (_UICollectionLayoutSolveParameters)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)indexesForInvalidatedAuxillariesOfKind:(id *)a1;
- (id)initWithInvalidatedIndexes:(double)a3 scrollOffset:(double)a4 visibleBounds:(double)a5;
- (id)initWithInvalidatedIndexes:(void *)a3 invalidatedAuxillaryDict:(char)a4 isFullResolve:(double)a5 scrollOffset:(double)a6 visibleBounds:(double)a7;
- (void)addAuxillaryIndex:(void *)a3 elementKind:;
@end

@implementation _UICollectionLayoutSolveParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidatedAuxillaryDict, 0);
  objc_storeStrong((id *)&self->_invalidatedIndexes, 0);
}

- (_UICollectionLayoutSolveParameters)init
{
  v3 = [MEMORY[0x1E4F28E60] indexSet];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v5 = (_UICollectionLayoutSolveParameters *)-[_UICollectionLayoutSolveParameters initWithInvalidatedIndexes:invalidatedAuxillaryDict:isFullResolve:scrollOffset:visibleBounds:](self, v3, v4, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v5;
}

+ (id)parametersForFullResolve
{
  self;
  v0 = [_UICollectionLayoutSolveParameters alloc];
  v1 = [MEMORY[0x1E4F28E60] indexSet];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = -[_UICollectionLayoutSolveParameters initWithInvalidatedIndexes:invalidatedAuxillaryDict:isFullResolve:scrollOffset:visibleBounds:](v0, v1, v2, 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v3;
}

- (id)initWithInvalidatedIndexes:(void *)a3 invalidatedAuxillaryDict:(char)a4 isFullResolve:(double)a5 scrollOffset:(double)a6 visibleBounds:(double)a7
{
  if (!a1) {
    return 0;
  }
  v22.receiver = a1;
  v22.super_class = (Class)_UICollectionLayoutSolveParameters;
  v19 = (id *)objc_msgSendSuper2(&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong(v19 + 1, a2);
    objc_storeStrong(v20 + 2, a3);
    *((unsigned char *)v20 + 24) = a4;
    *((double *)v20 + 4) = a5;
    *((double *)v20 + 5) = a6;
    *((double *)v20 + 6) = a7;
    *((double *)v20 + 7) = a8;
    *((double *)v20 + 8) = a9;
    *((double *)v20 + 9) = a10;
  }
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_UICollectionLayoutSolveParameters alloc];
  v5 = (void *)[(NSMutableIndexSet *)self->_invalidatedIndexes mutableCopy];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_invalidatedAuxillaryDict copyItems:1];
  v7 = -[_UICollectionLayoutSolveParameters initWithInvalidatedIndexes:invalidatedAuxillaryDict:isFullResolve:scrollOffset:visibleBounds:](v4, v5, v6, self->_isFullResolve, self->_scrollOffset.x, self->_scrollOffset.y, self->_visibleBounds.origin.x, self->_visibleBounds.origin.y, self->_visibleBounds.size.width, self->_visibleBounds.size.height);

  return v7;
}

- (void)addAuxillaryIndex:(void *)a3 elementKind:
{
  if (a1)
  {
    if (![a3 length])
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel_addAuxillaryIndex_elementKind_, a1, @"_UICollectionLayoutHelpers.m", 1545, @"Invalid parameter not satisfying: %@", @"elementKind.length" object file lineNumber description];
    }
    v6 = [*(id *)(a1 + 16) objectForKeyedSubscript:a3];
    if (!v6)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      [*(id *)(a1 + 16) setObject:v8 forKeyedSubscript:a3];
      v6 = v8;
    }
    id v9 = v6;
    [v6 addIndex:a2];
  }
}

- (id)initWithInvalidatedIndexes:(double)a3 scrollOffset:(double)a4 visibleBounds:(double)a5
{
  id v8 = a1;
  if (a1)
  {
    v15 = (void *)[a2 mutableCopy];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v8 = -[_UICollectionLayoutSolveParameters initWithInvalidatedIndexes:invalidatedAuxillaryDict:isFullResolve:scrollOffset:visibleBounds:](v8, v15, v16, 1, a3, a4, a5, a6, a7, a8);
  }
  return v8;
}

- (_UICollectionLayoutAuxillaryOffsets)invalidatedAuxillaryOffsets
{
  v1 = (_UICollectionLayoutAuxillaryOffsets *)a1;
  if (a1)
  {
    if ([a1[2] count])
    {
      uint64_t v5 = 0;
      v6 = &v5;
      uint64_t v7 = 0x3032000000;
      id v8 = __Block_byref_object_copy__31;
      id v9 = __Block_byref_object_dispose__31;
      v10 = objc_alloc_init(_UICollectionLayoutAuxillaryOffsets);
      Class isa = v1[1].super.isa;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __65___UICollectionLayoutSolveParameters_invalidatedAuxillaryOffsets__block_invoke;
      v4[3] = &unk_1E52E11E0;
      v4[4] = &v5;
      [(objc_class *)isa enumerateKeysAndObjectsUsingBlock:v4];
      v1 = (_UICollectionLayoutAuxillaryOffsets *)(id)v6[5];
      _Block_object_dispose(&v5, 8);
    }
    else
    {
      v1 = objc_alloc_init(_UICollectionLayoutAuxillaryOffsets);
    }
  }
  return v1;
}

- (id)indexesForInvalidatedAuxillariesOfKind:(id *)a1
{
  id v2 = a1;
  if (a1)
  {
    if (![a2 length])
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_indexesForInvalidatedAuxillariesOfKind_, v2, @"_UICollectionLayoutHelpers.m", 1536, @"Invalid parameter not satisfying: %@", @"kind.length" object file lineNumber description];
    }
    id v4 = [v2[2] objectForKeyedSubscript:a2];
    uint64_t v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      v6 = [MEMORY[0x1E4F28D60] indexSet];
    }
    id v2 = v6;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (a3)
  {
    id v4 = (char *)a3;
    uint64_t v5 = v4;
    if (self)
    {
      if (self->_isFullResolve != (v4[24] != 0)) {
        goto LABEL_19;
      }
      double x = self->_scrollOffset.x;
      double y = self->_scrollOffset.y;
    }
    else
    {
      if (v4[24]) {
        goto LABEL_19;
      }
      double y = 0.0;
      double x = 0.0;
    }
    if (*((double *)v4 + 4) == x && *((double *)v4 + 5) == y)
    {
      if (self)
      {
        CGFloat v9 = self->_visibleBounds.origin.x;
        CGFloat v10 = self->_visibleBounds.origin.y;
        CGFloat width = self->_visibleBounds.size.width;
        CGFloat height = self->_visibleBounds.size.height;
      }
      else
      {
        CGFloat v10 = 0.0;
        CGFloat width = 0.0;
        CGFloat height = 0.0;
        CGFloat v9 = 0.0;
      }
      if (CGRectEqualToRect(*(CGRect *)(v4 + 48), *(CGRect *)&v9))
      {
        v13 = -[UIBarButtonItemGroup _items]((id *)&self->super.isa);
        int v14 = [v13 isEqualToIndexSet:v5[1]];

        if (v14)
        {
          char v15 = [(NSMutableDictionary *)self->_invalidatedAuxillaryDict isEqualToDictionary:v5[2]];
LABEL_20:

          return v15;
        }
      }
    }
LABEL_19:
    char v15 = 0;
    goto LABEL_20;
  }
  return 0;
}

@end