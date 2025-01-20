@interface SBIconListGridCellInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isLayoutOutOfBounds;
- (BOOL)isOutOfBoundsAtIconIndex:(unint64_t)a3;
- (BOOL)isValidGridRange:(SBHIconGridRange)a3;
- (NSIndexSet)indexesOfOutOfBoundsIcons;
- (NSString)description;
- (NSString)layoutDescription;
- (SBHIconGridRange)gridRangeForGridCellIndex:(unint64_t)a3;
- (SBHIconGridRange)usedGridRange;
- (SBHIconGridSize)gridSize;
- (SBHIconGridSize)gridSizeForGridCellIndex:(unint64_t)a3;
- (SBHIconGridSize)usedGridSize;
- (SBIconApproximateLayoutPosition)approximateLayoutPositionForCoordinate:(SBIconCoordinate)a3;
- (SBIconApproximateLayoutPosition)approximateLayoutPositionForGridCellIndex:(unint64_t)a3;
- (SBIconCoordinate)coordinateForGridCellIndex:(unint64_t)a3;
- (SBIconListGridCellInfo)init;
- (SBIconListGridCellInfo)initWithGridSize:(SBHIconGridSize)a3;
- (id)contiguousRegionForGridCellIndex:(unint64_t)a3;
- (id)contiguousRegionsForGridRange:(SBHIconGridRange)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)iconIndexesForContiguousRegion:(id)a3;
- (id)indexesOfOutOfBoundsIconInRange:(_NSRange)a3;
- (id)subgridCellInfoForGridRange:(SBHIconGridRange)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)countOfIconsOfSize:(SBHIconGridSize)a3;
- (unint64_t)firstEmptyGridCellIndex;
- (unint64_t)firstTrailingEmptyGridCellIndex;
- (unint64_t)getIconIndexes:(unint64_t *)a3 inGridRange:(SBHIconGridRange)a4;
- (unint64_t)getUniqueIconIndexes:(unint64_t *)a3 inGridRange:(SBHIconGridRange)a4;
- (unint64_t)gridCellIndexForCoordinate:(SBIconCoordinate)a3;
- (unint64_t)gridCellIndexForIconIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)iconIndexForCoordinate:(SBIconCoordinate)a3;
- (unint64_t)iconIndexForGridCellIndex:(unint64_t)a3;
- (unint64_t)indexOfFirstEmptyGridCellRangeOfSize:(SBHIconGridSize)a3;
- (unint64_t)indexOfFirstEmptyGridCellRangeOfSize:(SBHIconGridSize)a3 flipped:(BOOL)a4;
- (unint64_t)indexOfFirstEmptyGridCellRangeOfSize:(SBHIconGridSize)a3 inGridCellIndexRange:(_NSRange)a4;
- (unint64_t)indexOfFirstEmptyGridCellRangeOfSize:(SBHIconGridSize)a3 inGridRange:(SBHIconGridRange)a4 flipped:(BOOL)a5;
- (unint64_t)indexOfFirstGridCellRangeOfSize:(SBHIconGridSize)a3 inGridCellIndexRange:(_NSRange)a4 passingTest:(id)a5;
- (unint64_t)indexOfFirstGridCellRangeOfSize:(SBHIconGridSize)a3 inGridRange:(SBHIconGridRange)a4 passingTest:(id)a5;
- (unint64_t)indexOfFirstUsedGridCellInGridRange:(SBHIconGridRange)a3;
- (unint64_t)indexOfLastUsedGridCellInGridRange:(SBHIconGridRange)a3;
- (unint64_t)indexOfOutOfBoundsIconInRange:(_NSRange)a3;
- (unint64_t)lastUsedGridCellIndex;
- (unint64_t)maxGridCellIndexForIconIndex:(unint64_t)a3;
- (unint64_t)numberOfEmptyGridCells;
- (unint64_t)numberOfUsedColumns;
- (unint64_t)numberOfUsedGridCellsInColumn:(unint64_t)a3;
- (unint64_t)numberOfUsedGridCellsInColumn:(unint64_t)a3 rowRange:(_NSRange)a4;
- (unint64_t)numberOfUsedGridCellsInGridRange:(SBHIconGridRange)a3;
- (unint64_t)numberOfUsedGridCellsInRow:(unint64_t)a3;
- (unint64_t)numberOfUsedGridCellsInRow:(unint64_t)a3 columnRange:(_NSRange)a4;
- (unint64_t)numberOfUsedRows;
- (void)addEmptyColumns:(unint64_t)a3;
- (void)addEmptyRows:(unint64_t)a3;
- (void)clearAllIconAndGridCellIndexes;
- (void)dealloc;
- (void)enumerateEmptyGridCellIndexesUsingBlock:(id)a3;
- (void)enumerateEmptyGridCellRangesOfSize:(SBHIconGridSize)a3 inGridRange:(SBHIconGridRange)a4 flipped:(BOOL)a5 usingBlock:(id)a6;
- (void)enumerateOutOfBoundsIconIndexesInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)markIconIndexAsOutOfBounds:(unint64_t)a3;
- (void)setFirstEmptyGridCellIndex:(unint64_t)a3;
- (void)setFirstTrailingEmptyGridCellIndex:(unint64_t)a3;
- (void)setGridCellIndex:(unint64_t)a3 forIconIndex:(unint64_t)a4;
- (void)setIconIndex:(unint64_t)a3 forGridCellIndex:(unint64_t)a4;
- (void)setIconIndex:(unint64_t)a3 inContiguousRegion:(id)a4;
- (void)setIconIndex:(unint64_t)a3 inGridRange:(SBHIconGridRange)a4;
- (void)setIconIndexes:(unint64_t *)a3 inGridRange:(SBHIconGridRange)a4;
- (void)setLastUsedGridCellIndex:(unint64_t)a3;
- (void)setLayoutFromGridCellInfo:(id)a3 fromGridRange:(SBHIconGridRange)a4 toGridRange:(SBHIconGridRange)a5;
@end

@implementation SBIconListGridCellInfo

- (unint64_t)gridCellIndexForCoordinate:(SBIconCoordinate)a3
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  unsigned __int16 v5 = (unsigned __int16)[(SBIconListGridCellInfo *)self gridSize];
  return SBIconCoordinateGetGridCellIndex(column, row, v5);
}

- (SBIconCoordinate)coordinateForGridCellIndex:(unint64_t)a3
{
  unsigned __int16 v4 = (unsigned __int16)[(SBIconListGridCellInfo *)self gridSize];
  unint64_t v5 = SBIconCoordinateMakeWithGridCellIndex(a3, v4);
  result.int64_t row = v6;
  result.int64_t column = v5;
  return result;
}

- (unint64_t)gridCellIndexForIconIndex:(unint64_t)a3
{
  if (a3 > 0x3F)
  {
    extraGridCellIndexes = self->_extraGridCellIndexes;
    if (!extraGridCellIndexes || a3 - 64 >= self->_extraGridCellIndexesSize) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    v3 = &extraGridCellIndexes[a3 - 64];
  }
  else
  {
    v3 = &self->_indexes[a3 + 64];
  }
  unint64_t result = *v3;
  if (!*v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (result == 0xFFFF) {
    return 0;
  }
  return result;
}

- (SBIconApproximateLayoutPosition)approximateLayoutPositionForCoordinate:(SBIconCoordinate)a3
{
  unint64_t row = a3.row;
  unint64_t column = a3.column;
  SBHIconGridSize v5 = (SBHIconGridSize)[(SBIconListGridCellInfo *)self gridSize];
  uint64_t v6 = v5.rows / 3u;
  if (HIWORD(*(unsigned int *)&v5) <= 4u && v5.rows % 3u)
  {
    if (row > *(unsigned int *)&v5 >> 17)
    {
      unint64_t v7 = 3;
      goto LABEL_10;
    }
LABEL_9:
    unint64_t v7 = 1;
    goto LABEL_10;
  }
  if (row <= v6) {
    goto LABEL_9;
  }
  if (row <= 2 * v6) {
    unint64_t v7 = 2;
  }
  else {
    unint64_t v7 = 3;
  }
LABEL_10:
  uint64_t v8 = v5.columns / 3u;
  if (v5.columns <= 4u && v5.columns % 3u)
  {
    if (column > v5.columns >> 1)
    {
      unint64_t v9 = 3;
      goto LABEL_19;
    }
LABEL_18:
    unint64_t v9 = 1;
    goto LABEL_19;
  }
  if (column <= v8) {
    goto LABEL_18;
  }
  if (column <= 2 * v8) {
    unint64_t v9 = 2;
  }
  else {
    unint64_t v9 = 3;
  }
LABEL_19:
  result.vertical = v7;
  result.horizontal = v9;
  return result;
}

- (unint64_t)indexOfFirstUsedGridCellInGridRange:(SBHIconGridRange)a3
{
  int size = (int)a3.size;
  unint64_t cellIndex = a3.cellIndex;
  unsigned __int16 v6 = (unsigned __int16)[(SBIconListGridCellInfo *)self gridSize];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__SBIconListGridCellInfo_indexOfFirstUsedGridCellInGridRange___block_invoke;
  v9[3] = &unk_1E6AB2210;
  v9[4] = self;
  v9[5] = &v10;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, size, v6, v9);
  unint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (SBHIconGridSize)gridSize
{
  return self->_gridSize;
}

uint64_t __62__SBIconListGridCellInfo_indexOfFirstUsedGridCellInGridRange___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

- (unint64_t)iconIndexForGridCellIndex:(unint64_t)a3
{
  if (a3 > 0x3F)
  {
    extraIconIndexes = self->_extraIconIndexes;
    if (!extraIconIndexes || a3 - 64 >= self->_extraIconIndexesSize) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    v3 = &extraIconIndexes[a3 - 64];
  }
  else
  {
    v3 = &self->_indexes[a3];
  }
  unint64_t result = *v3;
  if (!*v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (result == 0xFFFF) {
    return 0;
  }
  return result;
}

uint64_t __51__SBIconListGridCellInfo_setIconIndex_inGridRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setIconIndex:*(void *)(a1 + 40) forGridCellIndex:a2];
}

- (void)setIconIndex:(unint64_t)a3 inGridRange:(SBHIconGridRange)a4
{
  int size = (int)a4.size;
  unint64_t cellIndex = a4.cellIndex;
  unsigned __int16 v8 = (unsigned __int16)[(SBIconListGridCellInfo *)self gridSize];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__SBIconListGridCellInfo_setIconIndex_inGridRange___block_invoke;
  v9[3] = &unk_1E6AB1AB8;
  v9[4] = self;
  v9[5] = a3;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, size, v8, v9);
}

- (void)setIconIndex:(unint64_t)a3 forGridCellIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  setIndex(a4, a3, (uint64_t)self->_indexes, 0, (void **)&self->_extraIconIndexes, &self->_extraIconIndexesSize);
  if (self) {
    unint64_t maxGridCellIndex = self->_maxGridCellIndex;
  }
  else {
    unint64_t maxGridCellIndex = 0;
  }
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v9 = maxGridCellIndex >= v4 && maxGridCellIndex != 0x7FFFFFFFFFFFFFFFLL;
    if (!self || v9) {
      return;
    }
LABEL_16:
    self->_unint64_t maxGridCellIndex = v4;
    return;
  }
  if (maxGridCellIndex <= v4)
  {
    while (maxGridCellIndex)
    {
      if ([(SBIconListGridCellInfo *)self iconIndexForGridCellIndex:--maxGridCellIndex] != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_19;
      }
    }
    unint64_t maxGridCellIndex = 0x7FFFFFFFFFFFFFFFLL;
LABEL_19:
    unint64_t v4 = maxGridCellIndex;
    if (self) {
      goto LABEL_16;
    }
  }
}

- (void)setGridCellIndex:(unint64_t)a3 forIconIndex:(unint64_t)a4
{
}

uint64_t __45__SBIconListGridCellInfo_numberOfUsedColumns__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void).cxx_destruct
{
}

- (SBIconListGridCellInfo)initWithGridSize:(SBHIconGridSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBIconListGridCellInfo;
  uint64_t result = [(SBIconListGridCellInfo *)&v5 init];
  if (result)
  {
    result->_gridSize = a3;
    result->_unint64_t maxGridCellIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (unint64_t)numberOfUsedColumns
{
  unint64_t v3 = (unint64_t)[(SBIconListGridCellInfo *)self gridSize];
  unint64_t v4 = (unsigned __int16)v3;
  unsigned int v5 = ([(SBIconListGridCellInfo *)self numberOfUsedRows] << 16) | 1;
  uint64_t v6 = v3;
  do
  {
    unint64_t v7 = v4;
    if (!v4) {
      break;
    }
    --v4;
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__SBIconListGridCellInfo_numberOfUsedColumns__block_invoke;
    v10[3] = &unk_1E6AB2210;
    v10[4] = self;
    v10[5] = &v11;
    unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v6;
    SBHIconGridRangeEnumerateCellIndexes(v7 - 1, v5, v3, v10);
    int v8 = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  while (!v8);
  return v7;
}

- (unint64_t)numberOfUsedRows
{
  unsigned __int16 v3 = (unsigned __int16)[(SBIconListGridCellInfo *)self gridSize];
  if (self)
  {
    unint64_t maxGridCellIndex = self->_maxGridCellIndex;
    if (maxGridCellIndex == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
  }
  else
  {
    unint64_t maxGridCellIndex = 0;
  }
  return maxGridCellIndex / v3 + 1;
}

- (void)dealloc
{
  free(self->_extraGridCellIndexes);
  free(self->_extraIconIndexes);
  v3.receiver = self;
  v3.super_class = (Class)SBIconListGridCellInfo;
  [(SBIconListGridCellInfo *)&v3 dealloc];
}

- (SBIconListGridCellInfo)init
{
  return [(SBIconListGridCellInfo *)self initWithGridSize:0];
}

- (void)setIconIndex:(unint64_t)a3 inContiguousRegion:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SBIconListGridCellInfo_setIconIndex_inContiguousRegion___block_invoke;
  v4[3] = &unk_1E6AB1AB8;
  v4[4] = self;
  v4[5] = a3;
  [a4 enumerateGridCellIndexesUsingBlock:v4];
}

uint64_t __58__SBIconListGridCellInfo_setIconIndex_inContiguousRegion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setIconIndex:*(void *)(a1 + 40) forGridCellIndex:a2];
}

- (SBHIconGridSize)usedGridSize
{
  unsigned __int16 v3 = [(SBIconListGridCellInfo *)self numberOfUsedColumns];
  return (SBHIconGridSize)(v3 | ((unsigned __int16)[(SBIconListGridCellInfo *)self numberOfUsedRows] << 16));
}

- (SBHIconGridRange)usedGridRange
{
  if (self)
  {
    unint64_t maxGridCellIndex = self->_maxGridCellIndex;
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
    if (maxGridCellIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t maxGridCellIndex = 0;
  }
  uint64_t v4 = 0;
  unint64_t v7 = 0;
  unint64_t v8 = (unsigned __int16)[(SBIconListGridCellInfo *)self gridSize];
  unint64_t v9 = maxGridCellIndex / v8;
  while (![(SBIconListGridCellInfo *)self numberOfUsedGridCellsInRow:v7])
  {
    ++v7;
    v4 += v8;
    if (v7 > v9) {
      goto LABEL_10;
    }
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_10:
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_12;
  }
  unsigned __int16 v10 = [(SBIconListGridCellInfo *)self numberOfUsedColumns];
  uint64_t v5 = (((v9 - v7) << 16) + 0x10000);
  uint64_t v6 = v10;
LABEL_12:
  uint64_t v11 = v6 | v5;
  unint64_t v12 = v4;
  result.int size = (SBHIconGridSize)v11;
  result.unint64_t cellIndex = v12;
  return result;
}

- (void)clearAllIconAndGridCellIndexes
{
  extraGridCellIndexes = self->_extraGridCellIndexes;
  if (extraGridCellIndexes)
  {
    free(extraGridCellIndexes);
    self->_extraGridCellIndexes = 0;
    self->_extraGridCellIndexesSize = 0;
  }
  extraIconIndexes = self->_extraIconIndexes;
  if (extraIconIndexes)
  {
    free(extraIconIndexes);
    self->_extraIconIndexes = 0;
    self->_extraIconIndexesSize = 0;
  }
  *(_OWORD *)&self->_indexes[120] = 0u;
  *(_OWORD *)&self->_indexes[112] = 0u;
  *(_OWORD *)&self->_indexes[104] = 0u;
  *(_OWORD *)&self->_indexes[96] = 0u;
  *(_OWORD *)&self->_indexes[88] = 0u;
  *(_OWORD *)&self->_indexes[80] = 0u;
  *(_OWORD *)&self->_indexes[72] = 0u;
  *(_OWORD *)&self->_indexes[64] = 0u;
  *(_OWORD *)&self->_indexes[56] = 0u;
  *(_OWORD *)&self->_indexes[48] = 0u;
  *(_OWORD *)&self->_indexes[40] = 0u;
  *(_OWORD *)&self->_indexes[32] = 0u;
  *(_OWORD *)&self->_indexes[24] = 0u;
  *(_OWORD *)&self->_indexes[16] = 0u;
  *(_OWORD *)&self->_indexes[8] = 0u;
  *(_OWORD *)self->_indexes = 0u;
}

- (unint64_t)getIconIndexes:(unint64_t *)a3 inGridRange:(SBHIconGridRange)a4
{
  int size = (int)a4.size;
  unint64_t cellIndex = a4.cellIndex;
  unsigned __int16 v8 = (unsigned __int16)[(SBIconListGridCellInfo *)self gridSize];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__SBIconListGridCellInfo_getIconIndexes_inGridRange___block_invoke;
  v11[3] = &unk_1E6AB29D8;
  v11[4] = self;
  v11[5] = v16;
  v11[6] = &v12;
  v11[7] = a3;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, size, v8, v11);
  unint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v16, 8);
  return v9;
}

uint64_t __53__SBIconListGridCellInfo_getIconIndexes_inGridRange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void *)(v5 + 24);
  *(void *)(v5 + 24) = v6 + 1;
  *(void *)(v4 + 8 * v6) = result;
  if (result != 0x7FFFFFFFFFFFFFFFLL) {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  return result;
}

- (unint64_t)getUniqueIconIndexes:(unint64_t *)a3 inGridRange:(SBHIconGridRange)a4
{
  uint64_t v4 = *(void *)&a4.size.columns;
  unint64_t cellIndex = a4.cellIndex;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int Area = SBHIconGridSizeGetArea(*(_DWORD *)&a4.size);
  unint64_t v8 = Area;
  if (Area >= 0x20)
  {
    unint64_t v9 = malloc_type_calloc(Area, 8uLL, 0x100004000313F17uLL);
    unint64_t v10 = -[SBIconListGridCellInfo getIconIndexes:inGridRange:](self, "getIconIndexes:inGridRange:", v9, cellIndex, v4, v9);
  }
  else
  {
    unint64_t v9 = v21;
    unint64_t v10 = -[SBIconListGridCellInfo getIconIndexes:inGridRange:](self, "getIconIndexes:inGridRange:", v21, cellIndex, v4, 0);
  }
  unint64_t v11 = v10;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unint64_t v13 = 0;
  if (v8 && v11)
  {
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    unint64_t v13 = 0;
    do
    {
      unint64_t v16 = *(void *)&v9[8 * v14];
      v17 = [NSNumber numberWithUnsignedInteger:v16];
      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        ++v15;
        if (([v12 containsObject:v17] & 1) == 0)
        {
          [v12 addObject:v17];
          a3[v13++] = v16;
        }
      }

      ++v14;
    }
    while (v14 < v8 && v15 < v11);
  }
  free(v19);

  return v13;
}

- (void)setIconIndexes:(unint64_t *)a3 inGridRange:(SBHIconGridRange)a4
{
  int size = (int)a4.size;
  unint64_t cellIndex = a4.cellIndex;
  unsigned __int16 v8 = (unsigned __int16)[(SBIconListGridCellInfo *)self gridSize];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__SBIconListGridCellInfo_setIconIndexes_inGridRange___block_invoke;
  v9[3] = &unk_1E6AB2A00;
  v9[5] = v10;
  void v9[6] = a3;
  v9[4] = self;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, size, v8, v9);
  _Block_object_dispose(v10, 8);
}

uint64_t __53__SBIconListGridCellInfo_setIconIndexes_inGridRange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  return [*(id *)(a1 + 32) setIconIndex:*(void *)(v2 + 8 * v4) forGridCellIndex:a2];
}

- (unint64_t)iconIndexForCoordinate:(SBIconCoordinate)a3
{
  unint64_t v4 = -[SBIconListGridCellInfo gridCellIndexForCoordinate:](self, "gridCellIndexForCoordinate:", a3.column, a3.row);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [(SBIconListGridCellInfo *)self iconIndexForGridCellIndex:v4];
}

- (unint64_t)numberOfUsedGridCellsInRow:(unint64_t)a3
{
  unint64_t v5 = [(SBIconListGridCellInfo *)self numberOfUsedColumns];
  return -[SBIconListGridCellInfo numberOfUsedGridCellsInRow:columnRange:](self, "numberOfUsedGridCellsInRow:columnRange:", a3, 0, v5);
}

- (unint64_t)numberOfUsedGridCellsInRow:(unint64_t)a3 columnRange:(_NSRange)a4
{
  if (!a4.length) {
    return 0;
  }
  NSUInteger length = a4.length;
  unint64_t v6 = 0;
  uint64_t v7 = 0;
  unint64_t v8 = a3 + 1;
  do
  {
    if (-[SBIconListGridCellInfo iconIndexForGridCellIndex:](self, "iconIndexForGridCellIndex:", -[SBIconListGridCellInfo gridCellIndexForCoordinate:](self, "gridCellIndexForCoordinate:", ++v7, v8)) != 0x7FFFFFFFFFFFFFFFLL)++v6; {
  }
    }
  while (length != v7);
  return v6;
}

- (unint64_t)numberOfUsedGridCellsInColumn:(unint64_t)a3
{
  uint64_t v5 = [(SBIconListGridCellInfo *)self gridSize] >> 16;
  return -[SBIconListGridCellInfo numberOfUsedGridCellsInColumn:rowRange:](self, "numberOfUsedGridCellsInColumn:rowRange:", a3, 0, v5);
}

- (unint64_t)numberOfUsedGridCellsInColumn:(unint64_t)a3 rowRange:(_NSRange)a4
{
  if (!a4.length) {
    return 0;
  }
  NSUInteger length = a4.length;
  unint64_t v6 = 0;
  uint64_t v7 = 0;
  unint64_t v8 = a3 + 1;
  do
  {
    if (-[SBIconListGridCellInfo iconIndexForGridCellIndex:](self, "iconIndexForGridCellIndex:", -[SBIconListGridCellInfo gridCellIndexForCoordinate:](self, "gridCellIndexForCoordinate:", v8, ++v7)) != 0x7FFFFFFFFFFFFFFFLL)++v6; {
  }
    }
  while (length != v7);
  return v6;
}

- (unint64_t)numberOfUsedGridCellsInGridRange:(SBHIconGridRange)a3
{
  int size = (int)a3.size;
  unint64_t cellIndex = a3.cellIndex;
  unsigned __int16 v6 = (unsigned __int16)[(SBIconListGridCellInfo *)self gridSize];
  uint64_t v10 = 0;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__SBIconListGridCellInfo_numberOfUsedGridCellsInGridRange___block_invoke;
  v9[3] = &unk_1E6AB2210;
  v9[4] = self;
  v9[5] = &v10;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, size, v6, v9);
  unint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __59__SBIconListGridCellInfo_numberOfUsedGridCellsInGridRange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

- (unint64_t)maxGridCellIndexForIconIndex:(unint64_t)a3
{
  unint64_t v4 = [(SBIconListGridCellInfo *)self gridCellIndexForIconIndex:a3];
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = v4;
    do
    {
      unint64_t v5 = v4;
      unint64_t v7 = [(SBIconListGridCellInfo *)self iconIndexForGridCellIndex:v6];
      unint64_t v4 = v6++;
    }
    while (v7 != 0x7FFFFFFFFFFFFFFFLL);
  }
  return v5;
}

- (SBHIconGridSize)gridSizeForGridCellIndex:(unint64_t)a3
{
  [(SBIconListGridCellInfo *)self gridRangeForGridCellIndex:a3];
  return v3;
}

- (SBHIconGridRange)gridRangeForGridCellIndex:(unint64_t)a3
{
  unint64_t v5 = -[SBIconListGridCellInfo iconIndexForGridCellIndex:](self, "iconIndexForGridCellIndex:");
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0;
  }
  else
  {
    unint64_t v8 = v5;
    unsigned __int16 v9 = (unsigned __int16)[(SBIconListGridCellInfo *)self gridSize];
    unint64_t v10 = [(SBIconListGridCellInfo *)self numberOfUsedRows];
    unint64_t v11 = [(SBIconListGridCellInfo *)self numberOfUsedColumns];
    uint64_t v12 = [(SBIconListGridCellInfo *)self coordinateForGridCellIndex:a3];
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3010000000;
    unint64_t v22 = a3;
    v21 = &unk_1D821E08B;
    uint64_t v23 = 65537;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__SBIconListGridCellInfo_gridRangeForGridCellIndex___block_invoke;
    aBlock[3] = &unk_1E6AB2A28;
    aBlock[6] = v12;
    aBlock[7] = v13;
    aBlock[8] = v10;
    aBlock[9] = v11;
    aBlock[10] = v8;
    aBlock[4] = self;
    aBlock[5] = &v18;
    unint64_t v14 = _Block_copy(aBlock);
    (*((void (**)(void *, void, uint64_t, uint64_t, void))v14 + 2))(v14, 0, -1, 0x10000, -v9);
    (*((void (**)(void *, void, uint64_t, uint64_t, void))v14 + 2))(v14, 0, 1, 0x10000, 0);
    (*((void (**)(void *, uint64_t, void, uint64_t, uint64_t))v14 + 2))(v14, -1, 0, 1, -1);
    (*((void (**)(void *, uint64_t, void, uint64_t, void))v14 + 2))(v14, 1, 0, 1, 0);
    uint64_t v6 = v19[4];
    uint64_t v7 = v19[5];

    _Block_object_dispose(&v18, 8);
  }
  unint64_t v15 = v6;
  uint64_t v16 = v7;
  result.int size = (SBHIconGridSize)v16;
  result.unint64_t cellIndex = v15;
  return result;
}

uint64_t __52__SBIconListGridCellInfo_gridRangeForGridCellIndex___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v5 = *(void *)(result + 48);
  uint64_t v6 = *(void *)(result + 56);
  if (v6 + a3 >= 1 && v5 + a2 >= 1)
  {
    uint64_t v12 = result;
    uint64_t v13 = 2 * a3;
    uint64_t v14 = 2 * a2;
    do
    {
      if ((unint64_t)(a3 + v6) > *(void *)(v12 + 64)) {
        break;
      }
      if ((unint64_t)(a2 + v5) > *(void *)(v12 + 72)) {
        break;
      }
      SBHIconGridRange result = objc_msgSend(*(id *)(v12 + 32), "iconIndexForGridCellIndex:", objc_msgSend(*(id *)(v12 + 32), "gridCellIndexForCoordinate:"));
      if (result != *(void *)(v12 + 80)) {
        break;
      }
      *(void *)(*(void *)(*(void *)(v12 + 40) + 8) + 32) += a5;
      *(_WORD *)(*(void *)(*(void *)(v12 + 40) + 8) + 42) += HIWORD(a4);
      *(_WORD *)(*(void *)(*(void *)(v12 + 40) + 8) + 40) += a4;
      if (v13 + v6 < 1) {
        break;
      }
      uint64_t v15 = v14 + v5;
      v6 += a3;
      v5 += a2;
    }
    while (v15 > 0);
  }
  return result;
}

- (BOOL)isLayoutOutOfBounds
{
  SBHIconGridSize v3 = (SBHIconGridSize)[(SBIconListGridCellInfo *)self gridSize];
  unsigned __int16 columns = v3.columns;
  unint64_t v5 = HIWORD(*(unsigned int *)&v3);
  unint64_t v6 = [(SBIconListGridCellInfo *)self numberOfUsedRows];
  unint64_t v7 = [(SBIconListGridCellInfo *)self numberOfUsedColumns];
  return v6 > v5 || v7 > columns || [(NSMutableIndexSet *)self->_outOfBoundsIconIndexes count] != 0;
}

- (unint64_t)indexOfOutOfBoundsIconInRange:(_NSRange)a3
{
  if (!a3.length) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v6 = 0;
  while (![(SBIconListGridCellInfo *)self isOutOfBoundsAtIconIndex:location + v6])
  {
    if (length == ++v6) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v6;
}

- (id)indexesOfOutOfBoundsIconInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  for (id i = objc_alloc_init(MEMORY[0x1E4F28E60]); length; --length)
  {
    if ([(SBIconListGridCellInfo *)self isOutOfBoundsAtIconIndex:location]) {
      [i addIndex:location];
    }
    ++location;
  }
  return i;
}

- (NSIndexSet)indexesOfOutOfBoundsIcons
{
  return (NSIndexSet *)self->_outOfBoundsIconIndexes;
}

- (BOOL)isOutOfBoundsAtIconIndex:(unint64_t)a3
{
  if (-[NSMutableIndexSet containsIndex:](self->_outOfBoundsIconIndexes, "containsIndex:")) {
    return 1;
  }
  SBHIconGridSize v6 = (SBHIconGridSize)[(SBIconListGridCellInfo *)self gridSize];
  unsigned __int16 columns = v6.columns;
  unint64_t v8 = HIWORD(*(unsigned int *)&v6);
  unint64_t v9 = [(SBIconListGridCellInfo *)self gridCellIndexForIconIndex:a3];
  [(SBIconListGridCellInfo *)self gridRangeForGridCellIndex:v9];
  unsigned __int16 v11 = v10;
  unint64_t v14 = [(SBIconListGridCellInfo *)self coordinateForGridCellIndex:v9] + v13 - 2;
  return v12 + (unint64_t)v11 - 2 >= v8 || v14 >= columns;
}

- (void)enumerateOutOfBoundsIconIndexesInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  char v5 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v9 = (void (**)(id, unint64_t, unsigned char *))a5;
  if ((v5 & 2) != 0)
  {
    if (location + length > location)
    {
      for (unint64_t i = location + length - 1; ; --i)
      {
        if ([(SBIconListGridCellInfo *)self isOutOfBoundsAtIconIndex:i])
        {
          char v15 = 0;
          v9[2](v9, i, &v15);
          if (v15) {
            BOOL v13 = 0;
          }
          else {
            BOOL v13 = i > location;
          }
          if (!v13) {
            break;
          }
        }
        else if (i <= location)
        {
          break;
        }
      }
    }
  }
  else if (length)
  {
    unint64_t v10 = 0;
    do
    {
      while (![(SBIconListGridCellInfo *)self isOutOfBoundsAtIconIndex:v10 + location])
      {
        if (++v10 >= length) {
          goto LABEL_23;
        }
      }
      char v14 = 0;
      v9[2](v9, v10 + location, &v14);
      ++v10;
      if (v14) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = v10 >= length;
      }
    }
    while (!v11);
  }
LABEL_23:
}

- (unint64_t)firstEmptyGridCellIndex
{
  return [(SBIconListGridCellInfo *)self indexOfFirstEmptyGridCellRangeOfSize:65537];
}

- (unint64_t)indexOfFirstEmptyGridCellRangeOfSize:(SBHIconGridSize)a3
{
  return [(SBIconListGridCellInfo *)self indexOfFirstEmptyGridCellRangeOfSize:*(unsigned int *)&a3 flipped:0];
}

- (unint64_t)indexOfFirstEmptyGridCellRangeOfSize:(SBHIconGridSize)a3 flipped:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(SBIconListGridCellInfo *)self gridSize];
  return -[SBIconListGridCellInfo indexOfFirstEmptyGridCellRangeOfSize:inGridRange:flipped:](self, "indexOfFirstEmptyGridCellRangeOfSize:inGridRange:flipped:", *(unsigned int *)&a3, 0, v7, v4);
}

- (unint64_t)indexOfFirstEmptyGridCellRangeOfSize:(SBHIconGridSize)a3 inGridRange:(SBHIconGridRange)a4 flipped:(BOOL)a5
{
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__SBIconListGridCellInfo_indexOfFirstEmptyGridCellRangeOfSize_inGridRange_flipped___block_invoke;
  v7[3] = &unk_1E6AB2A50;
  v7[4] = &v8;
  -[SBIconListGridCellInfo enumerateEmptyGridCellRangesOfSize:inGridRange:flipped:usingBlock:](self, "enumerateEmptyGridCellRangesOfSize:inGridRange:flipped:usingBlock:", *(unsigned int *)&a3, a4.cellIndex, *(void *)&a4.size.columns, a5, v7);
  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __83__SBIconListGridCellInfo_indexOfFirstEmptyGridCellRangeOfSize_inGridRange_flipped___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

- (unint64_t)indexOfFirstEmptyGridCellRangeOfSize:(SBHIconGridSize)a3 inGridCellIndexRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  SBHIconGridSize v8 = (SBHIconGridSize)[(SBIconListGridCellInfo *)self gridSize];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__SBIconListGridCellInfo_indexOfFirstEmptyGridCellRangeOfSize_inGridCellIndexRange___block_invoke;
  v10[3] = &__block_descriptor_48_e51_B32__0_SBHIconGridRange_Q_SBHIconGridSize_SS__8_Q24l;
  void v10[4] = location;
  v10[5] = length;
  return -[SBIconListGridCellInfo indexOfFirstGridCellRangeOfSize:inGridRange:passingTest:](self, "indexOfFirstGridCellRangeOfSize:inGridRange:passingTest:", *(unsigned int *)&a3, 0, *(unsigned int *)&v8, v10);
}

BOOL __84__SBIconListGridCellInfo_indexOfFirstEmptyGridCellRangeOfSize_inGridCellIndexRange___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  unint64_t v4 = *(void *)(a1 + 32);
  BOOL v6 = a2 >= v4;
  unint64_t v5 = a2 - v4;
  BOOL v6 = !v6 || v5 >= *(void *)(a1 + 40);
  return !v6 && *a4 == 0x7FFFFFFFFFFFFFFFLL;
}

- (void)enumerateEmptyGridCellRangesOfSize:(SBHIconGridSize)a3 inGridRange:(SBHIconGridRange)a4 flipped:(BOOL)a5 usingBlock:(id)a6
{
  BOOL v6 = a5;
  int size = (int)a4.size;
  unint64_t cellIndex = a4.cellIndex;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  unsigned __int16 v12 = (unsigned __int16)[(SBIconListGridCellInfo *)self gridSize];
  unsigned int Area = SBHIconGridSizeGetArea(*(_DWORD *)&a3);
  unsigned int v14 = Area;
  if (Area >= 0x20)
  {
    char v15 = (char *)malloc_type_calloc(Area, 8uLL, 0x100004000313F17uLL);
    uint64_t v16 = v15;
  }
  else
  {
    char v15 = 0;
    uint64_t v16 = &v23;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__SBIconListGridCellInfo_enumerateEmptyGridCellRangesOfSize_inGridRange_flipped_usingBlock___block_invoke;
  v19[3] = &unk_1E6AB2A98;
  if (v6) {
    char v17 = 3;
  }
  else {
    char v17 = 1;
  }
  id v20 = v11;
  v21 = v16;
  unsigned int v22 = v14;
  v19[4] = self;
  id v18 = v11;
  SBHIconGridRangeEnumerateSubranges(cellIndex, size, *(_DWORD *)&a3, v12, v17, v19);
  free(v15);
}

uint64_t __92__SBIconListGridCellInfo_enumerateEmptyGridCellRangesOfSize_inGridRange_flipped_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "getIconIndexes:inGridRange:", *(void *)(a1 + 48), a2, a3);
  uint64_t v5 = *(unsigned int *)(a1 + 56);
  if (v5)
  {
    BOOL v6 = *(uint64_t **)(a1 + 48);
    while (1)
    {
      uint64_t v7 = *v6++;
      if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (!--v5) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    SBHIconGridSize v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v8();
  }
  return result;
}

- (unint64_t)numberOfEmptyGridCells
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SBIconListGridCellInfo_numberOfEmptyGridCells__block_invoke;
  v4[3] = &unk_1E6AB2AC0;
  v4[4] = &v5;
  [(SBIconListGridCellInfo *)self enumerateEmptyGridCellIndexesUsingBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __48__SBIconListGridCellInfo_numberOfEmptyGridCells__block_invoke(uint64_t result)
{
  return result;
}

- (unint64_t)indexOfFirstGridCellRangeOfSize:(SBHIconGridSize)a3 inGridRange:(SBHIconGridRange)a4 passingTest:(id)a5
{
  unint64_t cellIndex = a4.cellIndex;
  id v8 = a5;
  unint64_t v9 = -[SBIconListGridCellInfo indexOfFirstGridCellRangeOfSize:inGridCellIndexRange:passingTest:](self, "indexOfFirstGridCellRangeOfSize:inGridCellIndexRange:passingTest:", *(unsigned int *)&a3, cellIndex, SBHIconGridSizeGetArea([(SBIconListGridCellInfo *)self gridSize]) - cellIndex, v8);

  return v9;
}

- (unint64_t)indexOfFirstGridCellRangeOfSize:(SBHIconGridSize)a3 inGridCellIndexRange:(_NSRange)a4 passingTest:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  unint64_t v6 = *(void *)&a3.columns;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = (uint64_t (**)(id, unint64_t, uint64_t, unsigned char *))a5;
  SBHIconGridSize v9 = (SBHIconGridSize)[(SBIconListGridCellInfo *)self gridSize];
  v28 = self;
  NSUInteger v30 = location;
  int v10 = [(SBIconListGridCellInfo *)self coordinateForGridCellIndex:location];
  int v12 = v11;
  uint64_t v13 = v6;
  unsigned int Area = SBHIconGridSizeGetArea(v6);
  if (Area >= 0x20) {
    char v15 = (char *)malloc_type_calloc(Area, 8uLL, 0x100004000313F17uLL);
  }
  else {
    char v15 = &v31;
  }
  int v16 = v12 - 1;
  unsigned int v27 = (unsigned __int16)(v9.rows - WORD1(v6) + 1);
  if (v27 > (unsigned __int16)(v12 - 1))
  {
    uint64_t v17 = v9;
    unsigned int v18 = (unsigned __int16)(v9.columns - v6 + 1);
    int columns = v9.columns;
    unsigned int v26 = (unsigned __int16)(v10 - 1);
    int v24 = v10 - 1;
    unsigned int v19 = (unsigned __int16)v16 * v9.columns + v26;
    do
    {
      if (v18 > v26)
      {
        unsigned int v20 = v19;
        for (int i = v24; v18 > (unsigned __int16)i; ++i)
        {
          unint64_t v22 = v20;
          unint64_t v6 = v6 & 0xFFFFFFFF00000000 | v17;
          if (SBHIconGridRangeContainsIconGridRange(0, v17, v20, v13, v6))
          {
            if (v22 < v30 || v22 - v30 >= length) {
              break;
            }
            -[SBIconListGridCellInfo getIconIndexes:inGridRange:](v28, "getIconIndexes:inGridRange:", v15, v22, v13);
            if (v8[2](v8, v22, v13, v15)) {
              goto LABEL_15;
            }
          }
          unsigned int v20 = v22 + 1;
        }
      }
      ++v16;
      v19 += columns;
    }
    while (v27 > (unsigned __int16)v16);
  }
  unint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:

  return v22;
}

- (unint64_t)indexOfLastUsedGridCellInGridRange:(SBHIconGridRange)a3
{
  int size = (int)a3.size;
  unint64_t cellIndex = a3.cellIndex;
  unsigned __int16 v6 = (unsigned __int16)[(SBIconListGridCellInfo *)self gridSize];
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SBIconListGridCellInfo_indexOfLastUsedGridCellInGridRange___block_invoke;
  v9[3] = &unk_1E6AB2AE8;
  v9[4] = self;
  v9[5] = &v10;
  SBHIconGridRangeEnumerateSubranges(cellIndex, size, 65537, v6, 4, v9);
  unint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __61__SBIconListGridCellInfo_indexOfLastUsedGridCellInGridRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)lastUsedGridCellIndex
{
  unint64_t v3 = [(SBIconListGridCellInfo *)self numberOfUsedRows];
  unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3)
  {
    unint64_t v5 = v3;
    unsigned __int16 v6 = (unsigned __int16)[(SBIconListGridCellInfo *)self gridSize];
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__SBIconListGridCellInfo_lastUsedGridCellIndex__block_invoke;
    v8[3] = &unk_1E6AB2210;
    v8[4] = self;
    v8[5] = &v9;
    SBHIconGridRangeEnumerateCellIndexes((v5 - 1) * v6, v6 | 0x10000, v6, v8);
    unint64_t v4 = v10[3];
    _Block_object_dispose(&v9, 8);
  }
  return v4;
}

uint64_t __47__SBIconListGridCellInfo_lastUsedGridCellIndex__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  }
  return result;
}

- (unint64_t)firstTrailingEmptyGridCellIndex
{
  unint64_t v3 = [(SBIconListGridCellInfo *)self lastUsedGridCellIndex];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v5 = v3;
  unint64_t v6 = v3 + 1;
  SBHIconGridSize v7 = (SBHIconGridSize)[(SBIconListGridCellInfo *)self gridSize];
  if (v6 < HIWORD(*(unsigned int *)&v7) * v7.columns) {
    return v5 + 1;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)enumerateEmptyGridCellIndexesUsingBlock:(id)a3
{
  unint64_t v4 = (void (**)(id, unint64_t, unsigned char *))a3;
  SBHIconGridSize v5 = (SBHIconGridSize)[(SBIconListGridCellInfo *)self gridSize];
  if (*(unsigned int *)&v5 <= 0xFFFEFFFF)
  {
    unsigned int Area = SBHIconGridSizeGetArea(*(_DWORD *)&v5);
    unint64_t maxGridCellIndex = Area;
    if (!Area) {
      goto LABEL_15;
    }
  }
  else
  {
    if (!self) {
      goto LABEL_15;
    }
    unint64_t maxGridCellIndex = self->_maxGridCellIndex;
    if (!maxGridCellIndex) {
      goto LABEL_15;
    }
  }
  unint64_t v8 = 0;
  do
  {
    while ([(SBIconListGridCellInfo *)self iconIndexForGridCellIndex:v8] != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (++v8 >= maxGridCellIndex) {
        goto LABEL_15;
      }
    }
    char v10 = 0;
    v4[2](v4, v8++, &v10);
    if (v10) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v8 >= maxGridCellIndex;
    }
  }
  while (!v9);
LABEL_15:
}

- (unint64_t)countOfIconsOfSize:(SBHIconGridSize)a3
{
  if (self)
  {
    unint64_t maxGridCellIndex = self->_maxGridCellIndex;
    if (maxGridCellIndex == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    unint64_t v7 = *(void *)&a3.columns;
    id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    if (maxGridCellIndex)
    {
      unint64_t v9 = 0;
      uint64_t v10 = v7;
      do
      {
        unint64_t v11 = [(SBIconListGridCellInfo *)self iconIndexForGridCellIndex:v9];
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v12 = v11;
          if (([v8 containsIndex:v11] & 1) == 0
            && [(SBIconListGridCellInfo *)self gridRangeForGridCellIndex:v9] != 0x7FFFFFFFFFFFFFFFLL)
          {
            unsigned __int16 v14 = v13;
            unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v13;
            unint64_t v7 = v7 & 0xFFFFFFFF00000000 | v10;
            if (SBHIconGridSizeEqualToIconGridSize(v3, v7))
            {
              [v8 addIndex:v12];
              unint64_t v9 = v9 + v14 - 1;
            }
          }
        }
        ++v9;
      }
      while (v9 < maxGridCellIndex);
    }
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  }
  unint64_t v15 = [v8 count];

  return v15;
}

- (void)addEmptyColumns:(unint64_t)a3
{
  if (a3)
  {
    SBHIconGridSize v5 = (SBHIconGridSize)[(SBIconListGridCellInfo *)self gridSize];
    uint64_t columns = v5.columns;
    unint64_t v7 = v5.columns + a3;
    if (__CFADD__(v5.columns, a3) || v7 >= 0x10000)
    {
      v21 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v22 = *MEMORY[0x1E4F1C3C8];
      char v23 = objc_msgSend(NSString, "stringWithFormat:", @"Too many columns to addEmptyColumns: %lu (prior: %lu)", a3, v5.columns);
      id v24 = [v21 exceptionWithName:v22 reason:v23 userInfo:0];

      objc_exception_throw(v24);
    }
    unsigned int v8 = v5;
    unsigned int Area = SBHIconGridSizeGetArea(*(_DWORD *)&v5);
    if (Area)
    {
      uint64_t v10 = Area - 1;
      do
      {
        [(SBIconListGridCellInfo *)self coordinateForGridCellIndex:v10];
        unint64_t v12 = v10 + (v11 - 1) * a3;
        unint64_t v13 = [(SBIconListGridCellInfo *)self iconIndexForGridCellIndex:v10];
        [(SBIconListGridCellInfo *)self setIconIndex:v13 forGridCellIndex:v12];
        if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
          [(SBIconListGridCellInfo *)self setGridCellIndex:v12 forIconIndex:v13];
        }
        --v10;
      }
      while (v10 != -1);
    }
    self->_gridSize.uint64_t columns = v7;
    if (v8 >= 0x10000)
    {
      uint64_t v14 = 0;
      unsigned int v15 = HIWORD(v8);
      if (a3 <= 1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = a3;
      }
      if (v15 <= 1) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = v15;
      }
      uint64_t v18 = columns + 1;
      do
      {
        ++v14;
        uint64_t v19 = v18;
        unint64_t v20 = v16;
        do
        {
          -[SBIconListGridCellInfo setIconIndex:forGridCellIndex:](self, "setIconIndex:forGridCellIndex:", 0x7FFFFFFFFFFFFFFFLL, -[SBIconListGridCellInfo gridCellIndexForCoordinate:](self, "gridCellIndexForCoordinate:", v19++, v14));
          --v20;
        }
        while (v20);
      }
      while (v14 != v17);
    }
  }
}

- (void)addEmptyRows:(unint64_t)a3
{
  uint64_t rows = self->_gridSize.rows;
  unint64_t v4 = rows + a3;
  if (__CFADD__(rows, a3) || v4 >= 0x10000)
  {
    SBHIconGridSize v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Too many rows to addEmptyRows: %lu (prior: %lu)", a3, rows);
    id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

    objc_exception_throw(v8);
  }
  self->_gridSize.uint64_t rows = v4;
}

- (SBIconApproximateLayoutPosition)approximateLayoutPositionForGridCellIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBIconListGridCellInfo *)self coordinateForGridCellIndex:a3];
  unint64_t v6 = -[SBIconListGridCellInfo approximateLayoutPositionForCoordinate:](self, "approximateLayoutPositionForCoordinate:", v5, v4);
  result.vertical = v7;
  result.horizontal = v6;
  return result;
}

- (void)setLayoutFromGridCellInfo:(id)a3 fromGridRange:(SBHIconGridRange)a4 toGridRange:(SBHIconGridRange)a5
{
  uint64_t v5 = *(void *)&a5.size.columns;
  unint64_t cellIndex = a5.cellIndex;
  uint64_t v7 = *(void *)&a4.size.columns;
  unint64_t v8 = a4.cellIndex;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  unsigned int Area = SBHIconGridSizeGetArea(v7);
  if (Area >= 0x20)
  {
    unint64_t v12 = (uint64_t *)malloc_type_calloc(Area, 8uLL, 0x100004000313F17uLL);
    id v24 = v12;
  }
  else
  {
    id v24 = 0;
    unint64_t v12 = (uint64_t *)&v27;
  }
  objc_msgSend(v10, "getIconIndexes:inGridRange:", v12, v8, v7);
  -[SBIconListGridCellInfo setIconIndexes:inGridRange:](self, "setIconIndexes:inGridRange:", v12, cellIndex, v5);
  unint64_t v13 = (unint64_t)[(SBIconListGridCellInfo *)self gridSize];
  unint64_t v14 = [v10 gridSize];
  uint64_t v15 = objc_msgSend(v10, "getUniqueIconIndexes:inGridRange:", v12, v8, v7);
  unsigned __int16 v25 = v7;
  unsigned int v26 = v10;
  if (v15)
  {
    uint64_t v16 = v15;
    unsigned __int16 v17 = v5;
    unint64_t v18 = cellIndex;
    uint64_t v19 = v14;
    uint64_t v20 = v13;
    do
    {
      unint64_t v14 = v14 & 0xFFFFFFFF00000000 | v19;
      unint64_t v21 = SBHIconGridRangeRelativeCellIndexForCellIndex(v8, v25, [v26 gridCellIndexForIconIndex:*v12], v14);
      unint64_t v13 = v13 & 0xFFFFFFFF00000000 | v20;
      unint64_t v22 = SBHIconGridRangeCellIndexForRelativeCellIndex(v18, v17, v21, v13);
      uint64_t v23 = *v12++;
      [(SBIconListGridCellInfo *)self setGridCellIndex:v22 forIconIndex:v23];
      --v16;
    }
    while (v16);
  }
  free(v24);
}

- (void)markIconIndexAsOutOfBounds:(unint64_t)a3
{
  outOfBoundsIconIndexes = self->_outOfBoundsIconIndexes;
  if (!outOfBoundsIconIndexes)
  {
    unint64_t v6 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    uint64_t v7 = self->_outOfBoundsIconIndexes;
    self->_outOfBoundsIconIndexes = v6;

    outOfBoundsIconIndexes = self->_outOfBoundsIconIndexes;
  }
  [(NSMutableIndexSet *)outOfBoundsIconIndexes addIndex:a3];
}

- (id)contiguousRegionForGridCellIndex:(unint64_t)a3
{
  [(SBIconListGridCellInfo *)self gridSize];
  unint64_t v8 = 0x1E4F28000uLL;
  id v24 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  unsigned __int16 v25 = self;
  SBHIconGridSize v9 = (SBHIconGridSize)[(SBIconListGridCellInfo *)self gridSize];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
  [v10 addObject:v11];

  id v12 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  SBHIconGridSize v23 = v9;
  if ([v10 count])
  {
    unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v27 = 0;
    uint64_t v13 = v9;
    do
    {
      unint64_t v14 = [v10 lastObject];
      unint64_t v15 = [v14 unsignedIntegerValue];

      [v10 removeLastObject];
      if (([v12 containsIndex:v15] & 1) == 0)
      {
        [v12 addIndex:v15];
        if ([(SBIconListGridCellInfo *)v25 iconIndexForGridCellIndex:v15] != 0x7FFFFFFFFFFFFFFFLL)
        {
          [v24 addIndex:v15];
          unint64_t v11 = v11 & 0xFFFFFFFF00000000 | v13;
          unint64_t v26 = SBHIconGridRangeAddCellIndex(v26, v27, v15, v11);
          uint64_t v27 = v16;
          v31[0] = v15;
          v31[1] = 65537;
          unint64_t v8 = v8 & 0xFFFFFFFF00000000 | v13;
          if (SBHIconGridRangeOffset(v31, 0, 1, v8))
          {
            unsigned __int16 v17 = [NSNumber numberWithUnsignedInteger:v31[0]];
            [v10 addObject:v17];
          }
          v30[0] = v15;
          v30[1] = 65537;
          unint64_t v5 = v5 & 0xFFFFFFFF00000000 | v13;
          if (SBHIconGridRangeOffset(v30, 1, 1, v5))
          {
            unint64_t v18 = [NSNumber numberWithUnsignedInteger:v30[0]];
            [v10 addObject:v18];
          }
          v29[0] = v15;
          v29[1] = 65537;
          unint64_t v4 = v4 & 0xFFFFFFFF00000000 | v13;
          if (SBHIconGridRangeOffset(v29, 2, 1, v4))
          {
            uint64_t v19 = [NSNumber numberWithUnsignedInteger:v29[0]];
            [v10 addObject:v19];
          }
          v28[0] = v15;
          v28[1] = 65537;
          unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v13;
          if (SBHIconGridRangeOffset(v28, 3, 1, v3))
          {
            uint64_t v20 = [NSNumber numberWithUnsignedInteger:v28[0]];
            [v10 addObject:v20];
          }
        }
      }
    }
    while ([v10 count]);
  }
  else
  {
    unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v27 = 0;
  }
  if ([v24 count]) {
    unint64_t v21 = -[SBHIconGridContiguousRegion initWithGridCellIndexes:inGridRange:gridSize:]([SBHIconGridContiguousRegion alloc], "initWithGridCellIndexes:inGridRange:gridSize:", v24, v26, v27, *(unsigned int *)&v23);
  }
  else {
    unint64_t v21 = 0;
  }

  return v21;
}

- (id)contiguousRegionsForGridRange:(SBHIconGridRange)a3
{
  int size = (int)a3.size;
  unint64_t cellIndex = a3.cellIndex;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unsigned __int16 v7 = (unsigned __int16)[(SBIconListGridCellInfo *)self gridSize];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__SBIconListGridCellInfo_contiguousRegionsForGridRange___block_invoke;
  v11[3] = &unk_1E6AB0BF8;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = self;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, size, v7, v11);
  id v9 = v8;

  return v9;
}

void __56__SBIconListGridCellInfo_contiguousRegionsForGridRange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v10 != v7) {
        objc_enumerationMutation(v4);
      }
      if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8), "containsGridCellIndex:", a2, (void)v9)) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    id v4 = [*(id *)(a1 + 40) contiguousRegionForGridCellIndex:a2];
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
}

- (id)iconIndexesForContiguousRegion:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28E60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__SBIconListGridCellInfo_iconIndexesForContiguousRegion___block_invoke;
  v11[3] = &unk_1E6AB0BF8;
  void v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v5 enumerateGridCellIndexesUsingBlock:v11];

  uint64_t v8 = v12;
  id v9 = v7;

  return v9;
}

uint64_t __57__SBIconListGridCellInfo_iconIndexesForContiguousRegion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = result;
    id v5 = *(void **)(a1 + 40);
    return [v5 addIndex:v4];
  }
  return result;
}

- (id)subgridCellInfoForGridRange:(SBHIconGridRange)a3
{
  uint64_t v3 = *(void *)&a3.size.columns;
  unint64_t cellIndex = a3.cellIndex;
  id v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGridSize:*(_DWORD *)&a3.size];
  SBHIconGridSize v7 = (SBHIconGridSize)[(SBIconListGridCellInfo *)self gridSize];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__SBIconListGridCellInfo_subgridCellInfoForGridRange___block_invoke;
  v14[3] = &unk_1E6AB2B10;
  v14[4] = self;
  unint64_t v17 = cellIndex;
  uint64_t v18 = v3;
  SBHIconGridSize v19 = v7;
  id v9 = v6;
  id v15 = v9;
  id v16 = v8;
  LOWORD(v6) = v7.columns;
  id v10 = v8;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, v3, (unsigned __int16)v6, v14);
  long long v11 = v16;
  id v12 = v9;

  return v12;
}

uint64_t __54__SBIconListGridCellInfo_subgridCellInfoForGridRange___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = result;
    unint64_t v6 = SBHIconGridRangeRelativeCellIndexForCellIndex(*(void *)(a1 + 56), *(void *)(a1 + 64), a2, *(_DWORD *)(a1 + 72));
    [*(id *)(a1 + 40) setIconIndex:v5 forGridCellIndex:v6];
    uint64_t result = [*(id *)(a1 + 48) containsIndex:v5];
    if ((result & 1) == 0)
    {
      [*(id *)(a1 + 40) setGridCellIndex:v6 forIconIndex:v5];
      SBHIconGridSize v7 = *(void **)(a1 + 48);
      return [v7 addIndex:v5];
    }
  }
  return result;
}

- (BOOL)isValidGridRange:(SBHIconGridRange)a3
{
  int size = (int)a3.size;
  unint64_t cellIndex = a3.cellIndex;
  SBHIconGridSize v5 = (SBHIconGridSize)[(SBIconListGridCellInfo *)self gridSize];
  return SBHIconGridRangeContainsIconGridRange(0, *(_DWORD *)&v5, cellIndex, size, v5.columns);
}

- (NSString)layoutDescription
{
  SBHIconGridSize v3 = (SBHIconGridSize)[(SBIconListGridCellInfo *)self gridSize];
  unsigned __int16 columns = v3.columns;
  unint64_t v5 = HIWORD(*(unsigned int *)&v3);
  unint64_t v6 = [(SBIconListGridCellInfo *)self numberOfUsedRows];
  unint64_t v7 = [(SBIconListGridCellInfo *)self numberOfUsedColumns];
  id v8 = [MEMORY[0x1E4F28E78] string];
  if (v6 <= v5) {
    unint64_t v9 = v5;
  }
  else {
    unint64_t v9 = v6;
  }
  if (v7 <= columns) {
    unint64_t v7 = columns;
  }
  unint64_t v10 = v7 * v6;
  int v26 = columns;
  unint64_t v27 = v9;
  BOOL v11 = v5 > 2 * columns || columns > (2 * v5);
  char v12 = v11;
  char v28 = v12;
  BOOL v13 = v11 || v7 * v6 != 0;
  unint64_t v14 = v9 * v7;
  if (v5 == 0xFFFF) {
    unint64_t v14 = 0;
  }
  uint64_t v15 = (v7 * v6 != 0) ^ v13;
  if (!v13) {
    unint64_t v10 = v14;
  }
  if (v10)
  {
    do
    {
      uint64_t v15 = (v15 + 1);
      BOOL v16 = v10 >= 0xA;
      v10 /= 0xAuLL;
    }
    while (v16);
  }
  if (!v27) {
    goto LABEL_36;
  }
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  for (unsigned __int16 i = 0; i < v27; ++i)
  {
    objc_msgSend(v8, "appendFormat:", @"%*lu|\t", v15, v26 * i);
    if (!v7) {
      goto LABEL_35;
    }
    int v20 = 0;
    while (1)
    {
      unint64_t v21 = [(SBIconListGridCellInfo *)self iconIndexForGridCellIndex:v17];
      if (v21 != 65534) {
        break;
      }
      [v8 appendString:@"X\t"];
LABEL_34:
      ++v17;
      if (v7 <= (unsigned __int16)++v20) {
        goto LABEL_35;
      }
    }
    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v8, "appendFormat:", @"%lu\t", v21);
      uint64_t v18 = 0;
      goto LABEL_34;
    }
    objc_msgSend(v8, "appendFormat:", @"-\t", 0x7FFFFFFFFFFFFFFFLL);
    if (++v18 == 2 * v26) {
      char v22 = v28;
    }
    else {
      char v22 = 0;
    }
    if ((v22 & 1) == 0) {
      goto LABEL_34;
    }
    unsigned __int16 i = v5 - 1;
    uint64_t v18 = (2 * v26);
LABEL_35:
    [v8 appendString:@"\n"];
  }
LABEL_36:
  if ([(NSMutableIndexSet *)self->_outOfBoundsIconIndexes count])
  {
    [v8 appendString:@"OOB: "];
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    char v33 = 1;
    outOfBoundsIconIndexes = self->_outOfBoundsIconIndexes;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    unint64_t v29[2] = __43__SBIconListGridCellInfo_layoutDescription__block_invoke;
    v29[3] = &unk_1E6AB2B38;
    char v31 = v32;
    id v24 = v8;
    id v30 = v24;
    [(NSMutableIndexSet *)outOfBoundsIconIndexes enumerateIndexesUsingBlock:v29];
    [v24 appendString:@"\n"];

    _Block_object_dispose(v32, 8);
  }
  return (NSString *)v8;
}

uint64_t __43__SBIconListGridCellInfo_layoutDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 32;
  SBHIconGridSize v3 = *(void **)(a1 + 32);
  if (!*(unsigned char *)(*(void *)(*(void *)(v4 + 8) + 8) + 24)) {
    return [v3 appendFormat:@", %lu", a2];
  }
  uint64_t result = objc_msgSend(v3, "appendFormat:", @"%lu", a2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SBIconListGridCellInfo *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    unint64_t v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      unint64_t v7 = v4;
      BOOL v8 = 0;
      if (SBHIconGridSizeEqualToIconGridSize(*(_DWORD *)&self->_gridSize, *(_DWORD *)&v7->_gridSize)
        && self->_maxGridCellIndex == v7->_maxGridCellIndex
        && self->_extraGridCellIndexesSize == v7->_extraGridCellIndexesSize
        && self->_extraIconIndexesSize == v7->_extraIconIndexesSize
        && !bcmp(self->_indexes, v7->_indexes, 0x100uLL))
      {
        extraGridCellIndexes = self->_extraGridCellIndexes;
        if (!extraGridCellIndexes
          || (BOOL v11 = v7->_extraGridCellIndexes) == 0
          || !bcmp(extraGridCellIndexes, v11, self->_extraGridCellIndexesSize))
        {
          extraIconIndexes = self->_extraIconIndexes;
          if (!extraIconIndexes
            || (BOOL v13 = v7->_extraIconIndexes) == 0
            || !bcmp(extraIconIndexes, v13, self->_extraIconIndexesSize))
          {
            BOOL v8 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint32x4_t v2 = vmovl_u16(*(uint16x4_t *)&self->_indexes[64]);
  uint32x4_t v3 = vmovl_u16(*(uint16x4_t *)self->_indexes);
  return vaddvq_s64(vaddq_s64((int64x2_t)vaddl_u32(*(uint32x2_t *)v3.i8, *(uint32x2_t *)v2.i8), (int64x2_t)vaddl_high_u32(v3, v2)))+ self->_gridSize.columns+ self->_maxGridCellIndex+ self->_gridSize.rows+ self->_extraGridCellIndexesSize+ self->_extraIconIndexesSize;
}

- (NSString)description
{
  return (NSString *)[(SBIconListGridCellInfo *)self descriptionWithMultilinePrefix:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  memmove((void *)(v4 + 8), self->_indexes, 0x100uLL);
  if (self->_extraGridCellIndexes)
  {
    size_t extraGridCellIndexesSize = self->_extraGridCellIndexesSize;
    if (extraGridCellIndexesSize)
    {
      unint64_t v7 = malloc_type_calloc(extraGridCellIndexesSize, 2uLL, 0x1000040BDFB0063uLL);
      *(void *)(v5 + 264) = v7;
      if (!v7) {
        goto LABEL_11;
      }
      memmove(v7, self->_extraGridCellIndexes, self->_extraGridCellIndexesSize);
      *(void *)(v5 + 272) = self->_extraGridCellIndexesSize;
    }
  }
  if (!self->_extraIconIndexes) {
    goto LABEL_10;
  }
  size_t extraIconIndexesSize = self->_extraIconIndexesSize;
  if (!extraIconIndexesSize) {
    goto LABEL_10;
  }
  unint64_t v9 = malloc_type_calloc(extraIconIndexesSize, 2uLL, 0x1000040BDFB0063uLL);
  *(void *)(v5 + 280) = v9;
  if (!v9)
  {
LABEL_11:
    id v12 = 0;
    goto LABEL_12;
  }
  memmove(v9, self->_extraIconIndexes, self->_extraIconIndexesSize);
  *(void *)(v5 + 288) = self->_extraIconIndexesSize;
LABEL_10:
  *(SBHIconGridSize *)(v5 + 304) = self->_gridSize;
  *(void *)(v5 + 336) = self->_maxGridCellIndex;
  uint64_t v10 = [(NSMutableIndexSet *)self->_outOfBoundsIconIndexes mutableCopy];
  BOOL v11 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v10;

  id v12 = (id)v5;
LABEL_12:

  return v12;
}

- (id)succinctDescription
{
  uint32x4_t v2 = [(SBIconListGridCellInfo *)self succinctDescriptionBuilder];
  uint32x4_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint32x4_t v3 = [(SBIconListGridCellInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [(SBIconListGridCellInfo *)self succinctDescriptionBuilder];
  uint64_t v5 = SBHStringForIconGridSize(*(_DWORD *)&self->_gridSize);
  id v6 = (id)[v4 appendObject:v5 withName:@"gridSize"];

  id v7 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBIconListGridCellInfo numberOfUsedRows](self, "numberOfUsedRows"), @"numberOfUsedRows");
  id v8 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBIconListGridCellInfo numberOfUsedColumns](self, "numberOfUsedColumns"), @"numberOfUsedColumns");
  id v9 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBIconListGridCellInfo isLayoutOutOfBounds](self, "isLayoutOutOfBounds"), @"isLayoutOutOfBounds", 1);
  return v4;
}

- (void)setFirstEmptyGridCellIndex:(unint64_t)a3
{
  self->_firstEmptyGridCellIndex = a3;
}

- (void)setLastUsedGridCellIndex:(unint64_t)a3
{
  self->_lastUsedGridCellIndex = a3;
}

- (void)setFirstTrailingEmptyGridCellIndex:(unint64_t)a3
{
  self->_firstTrailingEmptyGridCellIndex = a3;
}

@end