@interface TSTCellIterator
- (BOOL)dontExpandCellRefs;
- (BOOL)getNext:(id *)a3;
- (BOOL)p_getData:(id *)a3 forCellID:(id)a4;
- (TSTCellIterator)initWithTableModel:(id)a3;
- (TSTCellIterator)initWithTableModel:(id)a3 flags:(unint64_t)a4;
- (TSTCellIterator)initWithTableModel:(id)a3 range:(id)a4;
- (TSTCellIterator)initWithTableModel:(id)a3 range:(id)a4 flags:(unint64_t)a5;
- (TSTCellIterator)initWithTableModel:(id)a3 region:(id)a4;
- (TSTCellIterator)initWithTableModel:(id)a3 region:(id)a4 flags:(unint64_t)a5;
- (int)rowWalkDirection;
- (void)dealloc;
- (void)p_resetIterData:(id *)a3;
- (void)terminate;
@end

@implementation TSTCellIterator

- (TSTCellIterator)initWithTableModel:(id)a3 region:(id)a4 flags:(unint64_t)a5
{
  unsigned int v5 = a5;
  id v9 = +[TSTConfiguration sharedTableConfiguration];
  if ((v5 & 8) == 0)
  {
    uint64_t v10 = [a4 boundingCellRange];
    if ([v9 maxNumberOfRows] <= (unsigned __int16)(v10 + HIWORD(v10) - 1))
    {
      v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[TSTCellIterator initWithTableModel:region:flags:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellIterator.mm"), 33, @"Tried to create iterator with range larger than is possible.");
    }
    uint64_t v13 = [a4 boundingCellRange];
    if ([v9 maxNumberOfColumns] <= (BYTE4(v13) + BYTE2(v13) - 1))
    {
      v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v15 = [NSString stringWithUTF8String:"-[TSTCellIterator initWithTableModel:region:flags:]"];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellIterator.mm"), 34, @"Tried to create iterator with range larger than is possible.");
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)TSTCellIterator;
  v16 = [(TSTCellIterator *)&v27 init];
  v17 = v16;
  if (v16)
  {
    v16->mDontCheckSize = (v5 & 8) >> 3;
    if ((v5 & 8) != 0
      || (uint64_t v18 = [a4 boundingCellRange],
          [v9 maxNumberOfRows] > (unsigned __int16)(v18 + HIWORD(v18) - 1))
      && (uint64_t v19 = [a4 boundingCellRange],
          [v9 maxNumberOfColumns] > (BYTE4(v19) + BYTE2(v19) - 1)))
    {
      int v20 = (v5 >> 2) & 1;
      v17->mSkipStyleOnlyCells = v5 & 1;
      v17->mSkipCommentStorageOnlyCells = BYTE1(v5) & 1;
      v17->mDontExpandCellRefs = (v5 & 2) != 0;
      v17->mRowWalkDirection = v20;
      if ((v5 & 0x10) != 0)
      {
        unint64_t v22 = TSTTableRangeOfTableWithMerges((uint64_t)a3);
        BOOL v21 = 0;
        if ((_WORD)v22 != 0xFFFF && (v22 & 0xFF0000) != 0xFF0000) {
          BOOL v21 = (v22 & 0xFFFF00000000) != 0 && HIWORD(v22) != 0;
        }
      }
      else
      {
        BOOL v21 = 0;
      }
      v17->mDontReturnMergeRegions = v21;
      v17->mReturnHiddenCells = (v5 & 0x20) != 0;
      v17->mDontInflateFormulas = (v5 & 0x40) != 0;
      v17->mReturnEmptyCells = (v5 & 0x80) != 0;
      v17->mTableModel = (TSTTableModel *)a3;
      v17->mTableDataStore = (TSTTableDataStore *)*((id *)a3 + 6);
      v24 = (TSTCellRegion *)[a4 copy];
      v17->mModelRegion = v24;
      if (v20) {
        uint64_t v25 = [(TSTCellRegion *)v24 rightToLeftIterator];
      }
      else {
        uint64_t v25 = [(TSTCellRegion *)v24 iterator];
      }
      v17->mModelRegionIterator = (TSTCellRegionIterating *)v25;
      v17->mPreviousCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)0xFFFFFF;
      v17->mCurRow = 0;
      v17->mCurTile = 0;
      v17->mCurTileRange = (_NSRange)NSRangeEmpty;
      v17->mCurRowID = -1;
      v17->mCell = objc_alloc_init(TSTCell);
      [a4 boundingCellRange];
    }
    else
    {
      NSLog((NSString *)@"The crash you are probably about to encounter is because you provided bad arguments to the cell iterator.");
      return 0;
    }
  }
  return v17;
}

- (TSTCellIterator)initWithTableModel:(id)a3 region:(id)a4
{
  return [(TSTCellIterator *)self initWithTableModel:a3 region:a4 flags:0];
}

- (TSTCellIterator)initWithTableModel:(id)a3 range:(id)a4
{
  id v6 = +[TSTCellRegion regionFromRange:a4];

  return [(TSTCellIterator *)self initWithTableModel:a3 region:v6 flags:0];
}

- (TSTCellIterator)initWithTableModel:(id)a3 range:(id)a4 flags:(unint64_t)a5
{
  id v8 = +[TSTCellRegion regionFromRange:a4];

  return [(TSTCellIterator *)self initWithTableModel:a3 region:v8 flags:a5];
}

- (TSTCellIterator)initWithTableModel:(id)a3
{
  uint64_t v5 = [a3 range];

  return [(TSTCellIterator *)self initWithTableModel:a3 range:v5];
}

- (TSTCellIterator)initWithTableModel:(id)a3 flags:(unint64_t)a4
{
  id v7 = +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", [a3 range]);

  return [(TSTCellIterator *)self initWithTableModel:a3 region:v7 flags:a4];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTCellIterator;
  [(TSTCellIterator *)&v3 dealloc];
}

- (void)p_resetIterData:(id *)a3
{
  a3->var2 = 0;
  a3->var3 = 0;
  a3->var4 = ($CA3468F20078D5D2DB35E78E73CA60DA)0xFFFFFFLL;
  *(void *)&a3->var0.var0 = 0xFFFFFF00FFFFFFLL;
  *(_WORD *)&a3->var5 = 0;
  a3->var7 = 0;
}

- (BOOL)p_getData:(id *)a3 forCellID:(id)a4
{
  uint64_t v7 = *(void *)&a4.var0 >> 16;
  unsigned __int16 v34 = 0;
  NSUInteger var0 = a4.var0;
  NSUInteger location = self->mCurTileRange.location;
  BOOL v11 = a4.var0 >= location;
  NSUInteger v10 = a4.var0 - location;
  BOOL v11 = !v11 || v10 >= self->mCurTileRange.length;
  if (v11)
  {
    self->mCurTile = 0;
    self->mCurTileRange = (_NSRange)NSRangeEmpty;
    TileForRow = (TSTTableTile *)TSTDataStoreGetTileForRow(self->mTableDataStore, a4.var0, &v34);
    self->mCurTile = TileForRow;
    if (TileForRow
      || (uint64_t v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
          uint64_t v14 = [NSString stringWithUTF8String:"-[TSTCellIterator p_getData:forCellID:]"],
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellIterator.mm"), 149, @"Failed to get a tile while iterating!"), (TileForRow = self->mCurTile) != 0))
    {
      int v15 = v34;
      if ([(TSTTableTile *)TileForRow maxRow] + v15 < a4.var0) {
        self->mCurTile = (TSTTableTile *)TSTDataStoreGetTileAtOrAfterRow(self->mTableDataStore, a4.var0, &v34);
      }
    }
    if (!self->mReturnEmptyCells && self->mDontReturnMergeRegions)
    {
      if (!self->mCurTile
        || ($CA3468F20078D5D2DB35E78E73CA60DA v16 = [(TSTCellRegion *)self->mModelRegion boundingCellRange],
            v34 > (unsigned __int16)(v16.var0.var0 + v16.var1.var1 - 1)))
      {
        [(TSTCellRegionIterating *)self->mModelRegionIterator terminate];
      }
    }
    mCurTile = self->mCurTile;
    if (mCurTile)
    {
      NSUInteger v18 = v34;
      unsigned int v19 = [(TSTTableTile *)mCurTile maxRow];
      self->mCurTileRange.NSUInteger location = v18;
      self->mCurTileRange.length = v19 + 1;
    }
  }
  if (self->mCurRowID != a4.var0)
  {
    self->mCurRow = 0;
    self->mCurRowID = -1;
    NSUInteger v20 = self->mCurTileRange.location;
    if (var0 >= v20 && var0 - v20 < self->mCurTileRange.length)
    {
      unint64_t v22 = TSTTableTileRowInfoForTileRowIndex(self->mCurTile, (unsigned __int16)(a4.var0 - v20), 0);
      self->mCurRow = v22;
      if (v22) {
        self->mCurRowID = a4.var0;
      }
    }
  }
  a3->var8 = TSTHidingActionForRow((uint64_t)self->mTableModel, a4.var0) != 0;
  int v23 = TSTHidingActionForColumn((uint64_t)self->mTableModel, v7);
  a3->var9 = v23 != 0;
  int v24 = a3->var8 | v23;
  a3->var7 = v24 != 0;
  if (v24 && !self->mReturnHiddenCells) {
    return 0;
  }
  if ((__int16)self->mCurRowID == -1
    || (uint64_t v25 = TSTTableTileRowInfoCellStorageRefAtTileColumnIndex((uint64_t)self->mCurRow, v7),
        (a3->var3 = (TSTCellStorage *)v25) == 0))
  {
    BOOL v28 = 0;
    int v26 = 1;
    BOOL v29 = 1;
LABEL_45:
    if (self->mReturnEmptyCells && v26 && v29 && !a3->var2)
    {
      TSTCellClear((uint64_t)self->mCell);
      mCell = self->mCell;
      TSTCellClearValue((uint64_t)mCell);
      *(_DWORD *)&mCell->mPrivate &= 0xFFFF00FF;
      a3->var2 = self->mCell;
      a3->NSUInteger var0 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mPreviousCellID;
      a3->var1.NSUInteger var0 = a4.var0;
      a3->var1.var1 = v7;
      a3->var1.var2 = a4.var2;
      BOOL v28 = 1;
    }
    goto LABEL_50;
  }
  if (*(unsigned __int16 *)(v25 + 1) > 0xFFu)
  {
    a3->var5 = 0;
  }
  else
  {
    a3->var5 = (TSTCellStorageHeaderFlagsForStorage((uint64_t)v25) & 2) != 0;
    if ((TSTCellStorageHeaderFlagsForStorage((uint64_t)a3->var3) & 0x1000) != 0)
    {
      int v26 = 0;
      BOOL v27 = 1;
      goto LABEL_35;
    }
  }
  BOOL v27 = 0;
  int v26 = 1;
LABEL_35:
  a3->var6 = v27;
  BOOL v29 = !self->mSkipStyleOnlyCells || !a3->var5;
  if (!self->mSkipCommentStorageOnlyCells)
  {
    int v26 = 1;
    goto LABEL_42;
  }
  if ((v29 | v26) == 1)
  {
LABEL_42:
    if (!self->mDontExpandCellRefs)
    {
      [(TSTCell *)self->mCell inflateFromStorageRef:a3->var3 dataStore:self->mTableDataStore suppressingFormulaInflation:self->mDontInflateFormulas];
      a3->var2 = self->mCell;
    }
    a3->var1.NSUInteger var0 = a4.var0;
    a3->var1.var1 = v7;
    a3->var1.var2 = a4.var2;
    a3->NSUInteger var0 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mPreviousCellID;
    BOOL v28 = 1;
    goto LABEL_45;
  }
  BOOL v28 = 0;
LABEL_50:
  if (!self->mDontReturnMergeRegions)
  {
    a3->var1.NSUInteger var0 = a4.var0;
    a3->var1.var1 = v7;
    a3->var1.var2 = a4.var2;
    unint64_t v31 = TSTTableMergeRangeAtCellID((uint64_t)self->mTableModel, *(_DWORD *)&a4);
    a3->var4 = ($CA3468F20078D5D2DB35E78E73CA60DA)v31;
    if (v28)
    {
      return 1;
    }
    else
    {
      BOOL v28 = 0;
      if ((_WORD)v31 != 0xFFFF && (v31 & 0xFF0000) != 0xFF0000) {
        return (v31 & 0xFFFF00000000) != 0 && HIWORD(v31) != 0;
      }
    }
  }
  return v28;
}

- (BOOL)getNext:(id *)a3
{
  -[TSTCellIterator p_resetIterData:](self, "p_resetIterData:");
  $5CFCD363C99B2F51819B67AD7AD2E060 v6 = ($5CFCD363C99B2F51819B67AD7AD2E060)[(TSTCellRegionIterating *)self->mModelRegionIterator getNext];
  $5CFCD363C99B2F51819B67AD7AD2E060 v7 = v6;
  LOBYTE(v8) = 0;
  if (v6.row != 0xFFFF)
  {
    uint64_t v9 = v6;
    if ((*(_DWORD *)&v6 & 0xFF0000) != 0xFF0000)
    {
      do
      {
        unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v9;
        BOOL v8 = [(TSTCellIterator *)self p_getData:a3 forCellID:v3];
        if (!v8) {
          $5CFCD363C99B2F51819B67AD7AD2E060 v7 = ($5CFCD363C99B2F51819B67AD7AD2E060)[(TSTCellRegionIterating *)self->mModelRegionIterator getNext];
        }
        if (v7.row == 0xFFFF) {
          break;
        }
        uint64_t v9 = v7;
        if ((*(_DWORD *)&v7 & 0xFF0000) == 0xFF0000) {
          break;
        }
      }
      while (!v8);
    }
  }
  self->mPreviousCellID = v7;
  return v8;
}

- (void)terminate
{
}

- (BOOL)dontExpandCellRefs
{
  return self->mDontExpandCellRefs;
}

- (int)rowWalkDirection
{
  return self->mRowWalkDirection;
}

@end