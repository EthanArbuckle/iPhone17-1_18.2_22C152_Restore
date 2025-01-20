@interface PXMagazineGrid
- (BOOL)_hasAnyEmptyTilesInArea:(PXMagazineRect *)a3;
- (BOOL)_hasAnyTilesUsedInArea:(PXMagazineRect *)a3;
- (BOOL)_isEmptyGrid;
- (BOOL)isGoodEnding;
- (BOOL)isPerfectEnding;
- (BOOL)nextEmptyTileX:(int64_t *)a3 Y:(int64_t *)a4 maxWidth:(int64_t *)a5;
- (PXMagazineGrid)initWithNumberOfColumns:(int64_t)a3 size:(unint64_t)a4;
- (int64_t)_numberOfEmptyTilesAtTheEnd;
- (int64_t)_numberOfEmptyTilesInArea:(PXMagazineRect *)a3;
- (unint64_t)_rowsUsed;
- (unint64_t)endingType;
- (void)clearArea:(PXMagazineRect *)a3;
- (void)dealloc;
- (void)enlargeTable;
- (void)resetWithSize:(unint64_t)a3;
- (void)setNumberOfColumns:(int64_t)a3;
- (void)setTileIdentifier:(unint64_t)a3 forArea:(PXMagazineRect *)a4;
@end

@implementation PXMagazineGrid

- (BOOL)_isEmptyGrid
{
  return *self->_table == -1;
}

- (unint64_t)_rowsUsed
{
  v8[1] = *MEMORY[0x1E4F143B8];
  size_t v3 = 8 * self->_numberOfColumns;
  memset((char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), 255, v3);
  unint64_t maxRows = self->_maxRows;
  if (!maxRows) {
    return 0;
  }
  unint64_t v5 = 0;
  table = self->_table;
  while (memcmp(table, (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v3))
  {
    ++v5;
    table = (int64_t *)((char *)table + v3);
    if (maxRows == v5) {
      return maxRows;
    }
  }
  return v5;
}

- (unint64_t)endingType
{
  if ([(PXMagazineGrid *)self _isEmptyGrid]) {
    return 2;
  }
  unint64_t v3 = [(PXMagazineGrid *)self _rowsUsed];
  unint64_t numberOfColumns = self->_numberOfColumns;
  v11[0] = 0;
  v11[1] = v3 - 1;
  v11[2] = numberOfColumns;
  v11[3] = 1;
  if (![(PXMagazineGrid *)self _hasAnyEmptyTilesInArea:v11]) {
    return 2;
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = 0;
  BOOL v5 = [(PXMagazineGrid *)self nextEmptyTileX:&v9 Y:&v8 maxWidth:&v10];
  unint64_t result = 0;
  if (v5)
  {
    if (v10 + v9 == self->_numberOfColumns)
    {
      unint64_t v7 = (v3 - v8) * v10;
      return v7 == [(PXMagazineGrid *)self _numberOfEmptyTilesAtTheEnd];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int64_t)_numberOfEmptyTilesAtTheEnd
{
  int64_t v3 = 0;
  unint64_t v4 = [(PXMagazineGrid *)self _rowsUsed] - 1;
  do
  {
    if ((v4 & 0x8000000000000000) != 0) {
      break;
    }
    unint64_t numberOfColumns = self->_numberOfColumns;
    v8[0] = 0;
    v8[1] = v4;
    void v8[2] = numberOfColumns;
    v8[3] = 1;
    int64_t v6 = [(PXMagazineGrid *)self _numberOfEmptyTilesInArea:v8];
    v3 += v6;
    --v4;
  }
  while (v6);
  return v3;
}

- (BOOL)_hasAnyEmptyTilesInArea:(PXMagazineRect *)a3
{
  int64_t var0 = a3->var1.var0;
  if (var0 < 1)
  {
    return 0;
  }
  else
  {
    uint64_t v4 = 0;
    BOOL v5 = 1;
    while (a3->var1.var1 < 1)
    {
LABEL_7:
      BOOL v5 = ++v4 < var0;
      if (v4 == var0) {
        return v5;
      }
    }
    unint64_t numberOfColumns = self->_numberOfColumns;
    unint64_t v7 = &self->_table[a3->var0.var0 + v4 + a3->var0.var1 * numberOfColumns];
    uint64_t v8 = 8 * numberOfColumns;
    int64_t var1 = a3->var1.var1;
    while (*v7 != -1)
    {
      unint64_t v7 = (int64_t *)((char *)v7 + v8);
      if (!--var1) {
        goto LABEL_7;
      }
    }
  }
  return v5;
}

- (int64_t)_numberOfEmptyTilesInArea:(PXMagazineRect *)a3
{
  int64_t var0 = a3->var1.var0;
  if (var0 < 1) {
    return 0;
  }
  uint64_t v4 = 0;
  int64_t v5 = 0;
  do
  {
    if (a3->var1.var1 >= 1)
    {
      unint64_t numberOfColumns = self->_numberOfColumns;
      unint64_t v7 = &self->_table[a3->var0.var0 + v4 + a3->var0.var1 * numberOfColumns];
      uint64_t v8 = 8 * numberOfColumns;
      int64_t var1 = a3->var1.var1;
      do
      {
        if (*v7 == -1) {
          ++v5;
        }
        unint64_t v7 = (int64_t *)((char *)v7 + v8);
        --var1;
      }
      while (var1);
    }
    ++v4;
  }
  while (v4 != var0);
  return v5;
}

- (BOOL)_hasAnyTilesUsedInArea:(PXMagazineRect *)a3
{
  int64_t var0 = a3->var1.var0;
  if (var0 < 1)
  {
    return 0;
  }
  else
  {
    uint64_t v4 = 0;
    BOOL v5 = 1;
    while (a3->var1.var1 < 1)
    {
LABEL_7:
      BOOL v5 = ++v4 < var0;
      if (v4 == var0) {
        return v5;
      }
    }
    unint64_t numberOfColumns = self->_numberOfColumns;
    unint64_t v7 = &self->_table[a3->var0.var0 + v4 + a3->var0.var1 * numberOfColumns];
    uint64_t v8 = 8 * numberOfColumns;
    int64_t var1 = a3->var1.var1;
    while (*v7 == -1)
    {
      unint64_t v7 = (int64_t *)((char *)v7 + v8);
      if (!--var1) {
        goto LABEL_7;
      }
    }
  }
  return v5;
}

- (BOOL)isGoodEnding
{
  return [(PXMagazineGrid *)self endingType] == 1;
}

- (BOOL)isPerfectEnding
{
  return [(PXMagazineGrid *)self endingType] == 2;
}

- (BOOL)nextEmptyTileX:(int64_t *)a3 Y:(int64_t *)a4 maxWidth:(int64_t *)a5
{
  if (a3) {
    BOOL v6 = a4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL result = !v6;
  if (v6) {
    return result;
  }
  *a4 = 0;
  *a3 = 0;
  unint64_t numberOfColumns = self->_numberOfColumns;
  table = self->_table;
  int64_t v10 = numberOfColumns * self->_maxRows;
  if (!v10)
  {
LABEL_12:
    unint64_t v12 = 0;
    if (!a5) {
      return result;
    }
    goto LABEL_15;
  }
  unint64_t v11 = 0;
  while (table[v11] != -1)
  {
    if (v10 == ++v11) {
      goto LABEL_12;
    }
  }
  *a4 = v11 / numberOfColumns;
  unint64_t v12 = v11 % self->_numberOfColumns;
  *a3 = v12;
  if (a5)
  {
LABEL_15:
    unint64_t v13 = self->_numberOfColumns;
    if (v12 + 1 >= v13)
    {
      int64_t v16 = 1;
    }
    else
    {
      int64_t v14 = v13 - v12;
      v15 = &table[v12 + *a4 * v13];
      int64_t v16 = 1;
      while (v15[v16] == -1)
      {
        if (v14 == ++v16)
        {
          int64_t v16 = v14;
          break;
        }
      }
    }
    *a5 = v16;
  }
  return result;
}

- (void)clearArea:(PXMagazineRect *)a3
{
  PXMagazineSize var1 = a3->var1;
  v4[0] = a3->var0;
  v4[1] = var1;
  [(PXMagazineGrid *)self setTileIdentifier:-1 forArea:v4];
}

- (void)setTileIdentifier:(unint64_t)a3 forArea:(PXMagazineRect *)a4
{
  if (a4->var1.var1 + a4->var0.var1 >= self->_maxRows) {
    [(PXMagazineGrid *)self enlargeTable];
  }
  int64_t var0 = a4->var1.var0;
  if (var0 >= 1)
  {
    int64_t v8 = 0;
    int64_t var1 = a4->var1.var1;
    do
    {
      if (var1 >= 1)
      {
        uint64_t v10 = 0;
        table = self->_table;
        do
        {
          table[a4->var0.var0 + v8 + (v10 + a4->var0.var1) * self->_numberOfColumns] = a3;
          ++v10;
          int64_t var1 = a4->var1.var1;
        }
        while (v10 < var1);
        int64_t var0 = a4->var1.var0;
      }
      ++v8;
    }
    while (v8 < var0);
  }
}

- (void)enlargeTable
{
  unint64_t numberOfColumns = self->_numberOfColumns;
  table = self->_table;
  unint64_t tableSizeInBytes = self->_tableSizeInBytes;
  int64_t v6 = self->_maxRows + 0x400 / (8 * numberOfColumns);
  unint64_t v7 = 8 * numberOfColumns * v6 + 8 * numberOfColumns;
  self->_unint64_t tableSizeInBytes = v7;
  self->_unint64_t maxRows = v6;
  int64_t v8 = (int64_t *)malloc_type_realloc(table, v7, 0xE41B0DCFuLL);
  self->_table = v8;
  uint64_t v9 = (char *)v8 + tableSizeInBytes;
  size_t v10 = self->_tableSizeInBytes - tableSizeInBytes;
  memset(v9, 255, v10);
}

- (void)resetWithSize:(unint64_t)a3
{
  unint64_t numberOfColumns = self->_numberOfColumns;
  int64_t maxRows = self->_maxRows;
  int64_t v6 = 16 * a3 / numberOfColumns;
  if (!maxRows || v6 > maxRows)
  {
    if (v6 <= 100) {
      int64_t v6 = 100;
    }
    unint64_t v7 = 8 * (numberOfColumns + numberOfColumns * v6);
    self->_size_t tableSizeInBytes = v7;
    self->_int64_t maxRows = v6;
    int64_t v8 = (int64_t *)malloc_type_realloc(self->_table, v7, 0x65992504uLL);
    self->_table = v8;
    size_t tableSizeInBytes = self->_tableSizeInBytes;
    memset(v8, 255, tableSizeInBytes);
  }
}

- (void)setNumberOfColumns:(int64_t)a3
{
  if (self->_numberOfColumns != a3)
  {
    if (a3 <= 0)
    {
      int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"PXMagazineGrid.m" lineNumber:46 description:@"We should have at least one column"];
    }
    self->_unint64_t numberOfColumns = a3;
  }
}

- (void)dealloc
{
  table = self->_table;
  if (table)
  {
    free(table);
    self->_table = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXMagazineGrid;
  [(PXMagazineGrid *)&v4 dealloc];
}

- (PXMagazineGrid)initWithNumberOfColumns:(int64_t)a3 size:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PXMagazineGrid;
  unint64_t v7 = [(PXMagazineGrid *)&v10 init];
  if (v7)
  {
    if (a3 <= 0)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:v7 file:@"PXMagazineGrid.m" lineNumber:27 description:@"We should have at least one column"];
    }
    v7->_unint64_t numberOfColumns = a3;
    v7->_table = 0;
    [(PXMagazineGrid *)v7 resetWithSize:a4];
  }
  return v7;
}

@end