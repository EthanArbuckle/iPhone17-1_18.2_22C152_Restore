@interface SBHIconGridContiguousRegion
- (BOOL)containsGridCellIndex:(unint64_t)a3;
- (BOOL)hasEmptyGridCells;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGridCellIndexInternal:(unint64_t)a3;
- (BOOL)isGridCellIndexInternal:(unint64_t)a3 directions:(unint64_t)a4;
- (NSString)description;
- (SBHIconGridContiguousRegion)init;
- (SBHIconGridContiguousRegion)initWithGridCellIndexes:(id)a3 inGridRange:(SBHIconGridRange)a4 gridSize:(SBHIconGridSize)a5;
- (SBHIconGridRange)gridRange;
- (SBHIconGridSize)gridSize;
- (id)contiguousRegionByRemovingGridCellIndexes:(id)a3;
- (id)layoutDescription;
- (id)subcontiguousRegionWithGridRange:(SBHIconGridRange)a3;
- (unint64_t)count;
- (unint64_t)endGridCellIndex;
- (unint64_t)hash;
- (unint64_t)startGridCellIndex;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)enumerateEmptyGridCellIndexesUsingBlock:(id)a3;
- (void)enumerateGridCellIndexesUsingBlock:(id)a3;
- (void)enumerateGridCellIndexesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
@end

@implementation SBHIconGridContiguousRegion

- (SBHIconGridContiguousRegion)initWithGridCellIndexes:(id)a3 inGridRange:(SBHIconGridRange)a4 gridSize:(SBHIconGridSize)a5
{
  uint64_t v6 = *(void *)&a4.size.columns;
  unint64_t cellIndex = a4.cellIndex;
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBHIconGridContiguousRegion;
  v10 = [(SBHIconGridContiguousRegion *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    gridCellIndexes = v10->_gridCellIndexes;
    v10->_gridCellIndexes = (NSIndexSet *)v11;

    v10->_gridRange.unint64_t cellIndex = cellIndex;
    *(void *)&v10->_gridRange.size.columns = v6;
    v10->_gridSize = a5;
  }

  return v10;
}

- (SBHIconGridContiguousRegion)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  v4 = -[SBHIconGridContiguousRegion initWithGridCellIndexes:inGridRange:gridSize:](self, "initWithGridCellIndexes:inGridRange:gridSize:", v3, 0x7FFFFFFFFFFFFFFFLL, 0, 0);

  return v4;
}

- (unint64_t)count
{
  if (self) {
    self = (SBHIconGridContiguousRegion *)self->_gridCellIndexes;
  }
  return [(SBHIconGridContiguousRegion *)self count];
}

- (BOOL)isEmpty
{
  return [(SBHIconGridContiguousRegion *)self count] == 0;
}

- (BOOL)hasEmptyGridCells
{
  unint64_t v3 = [(SBHIconGridContiguousRegion *)self startGridCellIndex];
  unint64_t v4 = [(SBHIconGridContiguousRegion *)self endGridCellIndex];
  unint64_t v5 = v3 + 1;
  do
  {
    unint64_t v6 = v5;
    if (v5 >= v4) {
      break;
    }
    BOOL v7 = [(SBHIconGridContiguousRegion *)self containsGridCellIndex:v5];
    unint64_t v5 = v6 + 1;
  }
  while (v7);
  return v6 < v4;
}

- (unint64_t)startGridCellIndex
{
  if (self) {
    self = (SBHIconGridContiguousRegion *)self->_gridCellIndexes;
  }
  return [(SBHIconGridContiguousRegion *)self firstIndex];
}

- (unint64_t)endGridCellIndex
{
  if (self) {
    self = (SBHIconGridContiguousRegion *)self->_gridCellIndexes;
  }
  return [(SBHIconGridContiguousRegion *)self lastIndex];
}

- (BOOL)containsGridCellIndex:(unint64_t)a3
{
  if (self) {
    self = (SBHIconGridContiguousRegion *)self->_gridCellIndexes;
  }
  return [(SBHIconGridContiguousRegion *)self containsIndex:a3];
}

- (BOOL)isGridCellIndexInternal:(unint64_t)a3
{
  return [(SBHIconGridContiguousRegion *)self isGridCellIndexInternal:a3 directions:15];
}

- (BOOL)isGridCellIndexInternal:(unint64_t)a3 directions:(unint64_t)a4
{
  BOOL v8 = 0;
  unint64_t v9 = 0;
  uint64_t v10 = [(SBHIconGridContiguousRegion *)self gridSize];
  while (1)
  {
    uint64_t v11 = qword_1D81E71E8[v9];
    if ((a4 >> v11)) {
      break;
    }
LABEL_7:
    BOOL v8 = v9++ > 2;
    if (v9 == 4) {
      return 1;
    }
  }
  v16[0] = a3;
  v16[1] = 65537;
  unint64_t v5 = v5 & 0xFFFFFFFF00000000 | v10;
  uint64_t v12 = v11;
  for (int i = v5; SBHIconGridRangeOffset(v16, v12, 1, i); int i = v4)
  {
    if ([(SBHIconGridContiguousRegion *)self containsGridCellIndex:v16[0]]) {
      goto LABEL_7;
    }
    unint64_t v4 = v4 & 0xFFFFFFFF00000000 | v10;
    uint64_t v12 = v11;
  }
  return v8;
}

- (void)enumerateGridCellIndexesUsingBlock:(id)a3
{
  if (self) {
    self = (SBHIconGridContiguousRegion *)self->_gridCellIndexes;
  }
  [(SBHIconGridContiguousRegion *)self enumerateIndexesUsingBlock:a3];
}

- (void)enumerateGridCellIndexesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  if (self) {
    self = (SBHIconGridContiguousRegion *)self->_gridCellIndexes;
  }
  [(SBHIconGridContiguousRegion *)self enumerateIndexesWithOptions:a3 usingBlock:a4];
}

- (void)enumerateEmptyGridCellIndexesUsingBlock:(id)a3
{
  id v4 = a3;
  if (self) {
    gridCellIndexes = self->_gridCellIndexes;
  }
  else {
    gridCellIndexes = 0;
  }
  unint64_t v6 = gridCellIndexes;
  uint64_t v7 = [(SBHIconGridContiguousRegion *)self gridRange];
  int v9 = v8;
  unsigned __int16 v10 = (unsigned __int16)[(SBHIconGridContiguousRegion *)self gridSize];
  unint64_t v11 = [(SBHIconGridContiguousRegion *)self startGridCellIndex];
  unint64_t v12 = [(SBHIconGridContiguousRegion *)self endGridCellIndex];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__SBHIconGridContiguousRegion_enumerateEmptyGridCellIndexesUsingBlock___block_invoke;
  v15[3] = &unk_1E6AB28E8;
  unint64_t v18 = v11;
  unint64_t v19 = v12;
  v16 = v6;
  id v17 = v4;
  id v13 = v4;
  objc_super v14 = v6;
  SBHIconGridRangeEnumerateCellIndexes(v7, v9, v10, v15);
}

uint64_t __71__SBHIconGridContiguousRegion_enumerateEmptyGridCellIndexesUsingBlock___block_invoke(uint64_t result, unint64_t a2)
{
  if (*(void *)(result + 48) <= a2)
  {
    uint64_t v2 = result;
    if (*(void *)(result + 56) >= a2)
    {
      result = [*(id *)(result + 32) containsIndex:a2];
      if ((result & 1) == 0)
      {
        unint64_t v3 = *(uint64_t (**)(void))(*(void *)(v2 + 40) + 16);
        return v3();
      }
    }
  }
  return result;
}

- (id)subcontiguousRegionWithGridRange:(SBHIconGridRange)a3
{
  uint64_t v3 = *(void *)&a3.size.columns;
  unint64_t cellIndex = a3.cellIndex;
  SBHIconGridSize v6 = (SBHIconGridSize)[(SBHIconGridContiguousRegion *)self gridSize];
  unint64_t v7 = [(SBHIconGridContiguousRegion *)self gridRange];
  int v9 = v8;
  uint64_t v10 = v6;
  if (!SBHIconGridRangeContainsIconGridRange(cellIndex, v3, v7, v8, v6.columns))
  {
    unint64_t cellIndex = SBHIconGridRangeIntersection(v7, v9, cellIndex, v3, v6.columns);
    uint64_t v3 = v11;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  unint64_t v19 = __64__SBHIconGridContiguousRegion_subcontiguousRegionWithGridRange___block_invoke;
  v20 = &unk_1E6AB2910;
  unint64_t v22 = cellIndex;
  uint64_t v23 = v3;
  SBHIconGridSize v24 = v6;
  id v21 = v12;
  id v13 = v12;
  [(SBHIconGridContiguousRegion *)self enumerateGridCellIndexesUsingBlock:&v17];
  id v14 = objc_alloc((Class)objc_opt_class());
  v15 = objc_msgSend(v14, "initWithGridCellIndexes:inGridRange:gridSize:", v13, cellIndex, v3, v10, v17, v18, v19, v20);

  return v15;
}

uint64_t __64__SBHIconGridContiguousRegion_subcontiguousRegionWithGridRange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = SBHIconGridRangeContainsCellIndex(*(void *)(a1 + 40), *(void *)(a1 + 48), a2, *(_DWORD *)(a1 + 56));
  if (result)
  {
    unint64_t v5 = *(void **)(a1 + 32);
    return [v5 addIndex:a2];
  }
  return result;
}

- (id)contiguousRegionByRemovingGridCellIndexes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    SBHIconGridSize v5 = (SBHIconGridSize)[(SBHIconGridContiguousRegion *)self gridSize];
    if (self) {
      gridCellIndexes = self->_gridCellIndexes;
    }
    else {
      gridCellIndexes = 0;
    }
    unint64_t v7 = (void *)[(NSIndexSet *)gridCellIndexes mutableCopy];
    [v7 removeIndexes:v4];
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3010000000;
    v16 = &unk_1D821E08B;
    long long v17 = xmmword_1D81E5560;
    DWORD2(v17) = 65537;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__SBHIconGridContiguousRegion_contiguousRegionByRemovingGridCellIndexes___block_invoke;
    v11[3] = &unk_1E6AB2938;
    v11[4] = &v13;
    SBHIconGridSize v12 = v5;
    [v7 enumerateIndexesUsingBlock:v11];
    id v8 = objc_alloc((Class)objc_opt_class());
    int v9 = (SBHIconGridContiguousRegion *)objc_msgSend(v8, "initWithGridCellIndexes:inGridRange:gridSize:", v7, v14[4], v14[5], *(unsigned int *)&v5);
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    int v9 = self;
  }

  return v9;
}

unint64_t __73__SBHIconGridContiguousRegion_contiguousRegionByRemovingGridCellIndexes___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t result = *(void *)(v3 + 32);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(v3 + 32) = a2;
  }
  else
  {
    unint64_t result = SBHIconGridRangeUnion(result, *(void *)(v3 + 40), a2, 65537, *(_DWORD *)(a1 + 40));
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    *(void *)(v5 + 32) = result;
    *(void *)(v5 + 40) = v6;
  }
  return result;
}

- (id)layoutDescription
{
  id v4 = [MEMORY[0x1E4F28E78] string];
  uint64_t v15 = [(SBHIconGridContiguousRegion *)self gridRange];
  uint64_t v6 = v5;
  SBHIconGridSize v7 = (SBHIconGridSize)[(SBHIconGridContiguousRegion *)self gridSize];
  if (v6 >= 0x10000)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v7;
    do
    {
      unint64_t v2 = v2 & 0xFFFFFFFF00000000 | v9;
      uint64_t v10 = SBHIconGridRangeMinCellIndexOnRow(v15, v6, v2, v8);
      if ((_WORD)v6)
      {
        uint64_t v11 = v10;
        int v12 = (unsigned __int16)v6;
        do
        {
          if ([(SBHIconGridContiguousRegion *)self containsGridCellIndex:v11]) {
            uint64_t v13 = @"*\t";
          }
          else {
            uint64_t v13 = @"-\t";
          }
          [v4 appendString:v13];
          ++v11;
          --v12;
        }
        while (v12);
      }
      [v4 appendString:@"\n"];
      ++v8;
    }
    while (v8 != WORD1(v6));
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBHIconGridContiguousRegion *)a3;
  if (self == v4)
  {
    BOOL v16 = 1;
  }
  else
  {
    uint64_t v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      SBHIconGridSize v7 = v4;
      if (self) {
        gridCellIndexes = self->_gridCellIndexes;
      }
      else {
        gridCellIndexes = 0;
      }
      uint64_t v9 = gridCellIndexes;
      int v10 = BSEqualObjects();

      if (v10)
      {
        uint64_t v11 = [(SBHIconGridContiguousRegion *)self gridRange];
        int v13 = v12;
        uint64_t v14 = [(SBHIconGridContiguousRegion *)v7 gridRange];
        BOOL v16 = SBHIconGridRangeEqualToIconGridRange(v11, v13, v14, v15);
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  if (self) {
    self = (SBHIconGridContiguousRegion *)self->_gridCellIndexes;
  }
  return [(SBHIconGridContiguousRegion *)self hash];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  [(SBHIconGridContiguousRegion *)self appendDescriptionToFormatter:v3];
  id v4 = [v3 description];

  return (NSString *)v4;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  if (self) {
    gridCellIndexes = self->_gridCellIndexes;
  }
  else {
    gridCellIndexes = 0;
  }
  id v11 = v4;
  id v6 = (id)[v4 appendObject:gridCellIndexes withName:@"gridCellIndexes"];
  uint64_t v7 = [(SBHIconGridContiguousRegion *)self gridRange];
  uint64_t v9 = SBHStringForIconGridRange(v7, v8);
  id v10 = (id)[v11 appendObject:v9 withName:@"gridRange"];
}

- (SBHIconGridRange)gridRange
{
  uint64_t v2 = *(void *)&self->_gridRange.size.columns;
  unint64_t cellIndex = self->_gridRange.cellIndex;
  result.size = (SBHIconGridSize)v2;
  result.unint64_t cellIndex = cellIndex;
  return result;
}

- (SBHIconGridSize)gridSize
{
  return self->_gridSize;
}

- (void).cxx_destruct
{
}

@end