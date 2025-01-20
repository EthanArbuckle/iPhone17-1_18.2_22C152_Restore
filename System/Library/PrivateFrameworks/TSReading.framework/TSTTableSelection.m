@interface TSTTableSelection
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)anchorCellID;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cursorCellID;
- (BOOL)areCellsInTheSameRegionInTable:(id)a3;
- (BOOL)containsCell:(id)a3;
- (BOOL)containsSelection:(id)a3;
- (BOOL)intersectsPartialMergeRangeInTable:(id)a3;
- (BOOL)isAtEndOfLine;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSelection:(id)a3;
- (NSString)description;
- (TSTCellRegion)baseRegion;
- (TSTCellRegion)cellRegion;
- (TSTTableSelection)initWithTableModel:(id)a3 andCellID:(id)a4;
- (TSTTableSelection)initWithTableModel:(id)a3 andCellRange:(id)a4;
- (TSTTableSelection)initWithTableModel:(id)a3 andPreviousSelection:(id)a4 offsetBy:(id)a5;
- (TSTTableSelection)initWithTableModel:(id)a3 cellID:(id)a4 selectionType:(int)a5;
- (TSTTableSelection)initWithTableModel:(id)a3 cellRange:(id)a4 type:(int)a5 anchorCellID:(id)a6 cursorCellID:(id)a7;
- (TSTTableSelection)initWithTableModel:(id)a3 cellRegion:(id)a4;
- (TSTTableSelection)initWithTableModel:(id)a3 cellRegion:(id)a4 anchorCellID:(id)a5 cursorCellID:(id)a6;
- (TSTTableSelection)initWithTableModel:(id)a3 cellRegion:(id)a4 anchorCellID:(id)a5 cursorCellID:(id)a6 baseRegion:(id)a7;
- (TSTTableSelection)initWithTableModel:(id)a3 cellRegion:(id)a4 anchorCellID:(id)a5 cursorCellID:(id)a6 baseRegion:(id)a7 selectionType:(int)a8;
- (TSTTableSelection)initWithTableModel:(id)a3 cellRegion:(id)a4 anchorCellID:(id)a5 cursorCellID:(id)a6 selectionType:(int)a7;
- (TSTTableSelection)initWithTableModel:(id)a3 rowOrColumn:(int)a4 index:(unsigned int)a5 count:(unsigned int)a6;
- (TSTTableSelection)initWithTableModel:(id)a3 selectionType:(int)a4;
- (TSTTableSelection)initWithTableModel:(id)a3 startingColumnIndex:(unsigned __int16)a4 numberOfColumns:(unsigned __int16)a5;
- (TSTTableSelection)initWithTableModel:(id)a3 startingRowIndex:(unsigned __int16)a4 numberOfRows:(unsigned __int16)a5;
- (_NSRange)range;
- (_NSRange)searchReferenceRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)selectionByAddingCellRange:(id)a3 inTable:(id)a4 withAnchor:(id)a5 cursor:(id)a6 selectionType:(int)a7;
- (id)selectionByExtendingWithCellRange:(id)a3 inTable:(id)a4 selectionType:(int)a5 cursorCell:(id)a6;
- (id)selectionByMovingInTableInfo:(id)a3 inDirection:(int)a4 withModifierKeys:(int)a5 forReferenceMove:(BOOL)a6;
- (id)selectionByMovingInTableInfo:(id)a3 inDirection:(int)a4 withModifierKeys:(int)a5 forReferenceMove:(BOOL)a6 suppressWrap:(BOOL)a7;
- (id)selectionByRemovingCellRange:(id)a3 inTable:(id)a4 withAnchor:(id)a5 cursor:(id)a6 selectionType:(int)a7;
- (int)selectionType;
- (void)dealloc;
- (void)enumerateSelectedCellsInTable:(id)a3 usingBlock:(id)a4;
- (void)enumerateSelectedCellsInTable:(id)a3 withFlags:(unint64_t)a4 usingBlock:(id)a5;
- (void)insert:(int)a3 atIndex:(unsigned __int16)a4 count:(unsigned __int16)a5;
- (void)remove:(int)a3 atIndex:(unsigned __int16)a4 count:(unsigned __int16)a5;
- (void)setSearchReferenceRange:(_NSRange)a3;
@end

@implementation TSTTableSelection

- (TSTTableSelection)initWithTableModel:(id)a3 cellRegion:(id)a4 anchorCellID:(id)a5 cursorCellID:(id)a6 baseRegion:(id)a7 selectionType:(int)a8
{
  if (!a3)
  {
    v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[TSTTableSelection initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:]"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableSelection.mm"), 56, @"invalid nil value for '%s'", "table");
  }
  v18.receiver = self;
  v18.super_class = (Class)TSTTableSelection;
  v16 = [(TSTTableSelection *)&v18 init];
  if (v16)
  {
    v16->mCellRegion = (TSTCellRegion *)a4;
    v16->mAnchorCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a5;
    v16->mCursorCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a6;
    v16->mBaseRegion = (TSTCellRegion *)a7;
    v16->mSelectionType = a8;
    v16->mSearchReferenceRange.location = 0;
    v16->mSearchReferenceRange.length = 0;
  }
  return v16;
}

- (TSTTableSelection)initWithTableModel:(id)a3 cellRegion:(id)a4 anchorCellID:(id)a5 cursorCellID:(id)a6 baseRegion:(id)a7
{
  return [(TSTTableSelection *)self initWithTableModel:a3 cellRegion:a4 anchorCellID:*(unsigned int *)&a5 cursorCellID:*(unsigned int *)&a6 baseRegion:a7 selectionType:0];
}

- (TSTTableSelection)initWithTableModel:(id)a3 cellRegion:(id)a4 anchorCellID:(id)a5 cursorCellID:(id)a6 selectionType:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v13 = +[TSTCellRegion regionFromRange:0];

  return [(TSTTableSelection *)self initWithTableModel:a3 cellRegion:a4 anchorCellID:*(unsigned int *)&a5 cursorCellID:*(unsigned int *)&a6 baseRegion:v13 selectionType:v7];
}

- (TSTTableSelection)initWithTableModel:(id)a3 cellRegion:(id)a4 anchorCellID:(id)a5 cursorCellID:(id)a6
{
  id v11 = +[TSTCellRegion regionFromRange:0];

  return [(TSTTableSelection *)self initWithTableModel:a3 cellRegion:a4 anchorCellID:*(unsigned int *)&a5 cursorCellID:*(unsigned int *)&a6 baseRegion:v11];
}

- (TSTTableSelection)initWithTableModel:(id)a3 cellRange:(id)a4 type:(int)a5 anchorCellID:(id)a6 cursorCellID:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  if (a3 && (a5 - 3) <= 0xFFFFFFFD) {
    a4 = ($CA3468F20078D5D2DB35E78E73CA60DA)TSTTableExpandCellRangeToCoverMergedCells((uint64_t)a3, *(void *)&a4);
  }
  id v12 = +[TSTCellRegion regionFromRange:a4];
  id v13 = +[TSTCellRegion regionFromRange:0];

  return [(TSTTableSelection *)self initWithTableModel:a3 cellRegion:v12 anchorCellID:*(unsigned int *)&a6 cursorCellID:*(unsigned int *)&a7 baseRegion:v13 selectionType:v9];
}

- (TSTTableSelection)initWithTableModel:(id)a3 selectionType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a4 != 4)
  {
    if (a4 == 5)
    {
      unint64_t v7 = [a3 range];
      id v8 = +[TSTCellRegion regionFromRange:v7];
      uint64_t v9 = (v7 + ((v7 >> 16) & 0xFF0000) + 16711680) & 0xFF0000 | (unsigned __int16)(v7 + HIWORD(v7) - 1);
      uint64_t v10 = v7;
      id v11 = self;
      id v12 = a3;
      uint64_t v13 = 5;
      goto LABEL_6;
    }
    v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[TSTTableSelection initWithTableModel:selectionType:]"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableSelection.mm"), 148, @"expected equality between %s and %s", "selectionType", "kTableNameSelection");
  }
  id v8 = +[TSTCellRegion invalidRegion];
  id v11 = self;
  id v12 = a3;
  uint64_t v10 = 0xFFFFFFLL;
  uint64_t v9 = 0xFFFFFFLL;
  uint64_t v13 = v4;
LABEL_6:

  return [(TSTTableSelection *)v11 initWithTableModel:v12 cellRegion:v8 anchorCellID:v10 cursorCellID:v9 selectionType:v13];
}

- (TSTTableSelection)initWithTableModel:(id)a3 andCellRange:(id)a4
{
  return [(TSTTableSelection *)self initWithTableModel:a3 cellRange:a4 type:0 anchorCellID:*(_DWORD *)&a4.var0 cursorCellID:*(_DWORD *)&a4.var0];
}

- (TSTTableSelection)initWithTableModel:(id)a3 cellID:(id)a4 selectionType:(int)a5
{
  return [(TSTTableSelection *)self initWithTableModel:a3 cellRange:*(unsigned int *)&a4 | 0x1000100000000 type:*(void *)&a5 anchorCellID:*(unsigned int *)&a4 cursorCellID:*(unsigned int *)&a4];
}

- (TSTTableSelection)initWithTableModel:(id)a3 andCellID:(id)a4
{
  return [(TSTTableSelection *)self initWithTableModel:a3 cellRange:*(unsigned int *)&a4 | 0x1000100000000 type:0 anchorCellID:*(unsigned int *)&a4 cursorCellID:*(unsigned int *)&a4];
}

- (TSTTableSelection)initWithTableModel:(id)a3 startingRowIndex:(unsigned __int16)a4 numberOfRows:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  unsigned int v6 = a4;
  int v9 = [a3 numberOfColumns];
  if ((int)([a3 numberOfRows] - v6) <= (int)v5) {
    uint64_t v5 = [a3 numberOfRows] - v6;
  }

  return [(TSTTableSelection *)self initWithTableModel:a3 cellRange:((unint64_t)v9 << 32) | (v5 << 48) | v6 type:1 anchorCellID:v6 cursorCellID:((v9 << 16) - 1) & 0xFF0000 | (unsigned __int16)(v6 + v5 - 1)];
}

- (TSTTableSelection)initWithTableModel:(id)a3 startingColumnIndex:(unsigned __int16)a4 numberOfColumns:(unsigned __int16)a5
{
  unsigned __int16 v5 = a5;
  if ((int)([a3 numberOfColumns] - a4) <= a5) {
    unsigned __int16 v5 = [a3 numberOfColumns] - a4;
  }
  uint64_t v9 = [a3 numberOfRows];
  if (v5 >= 0xFFu) {
    uint64_t v10 = 255;
  }
  else {
    uint64_t v10 = v5;
  }

  return [(TSTTableSelection *)self initWithTableModel:a3 cellRange:(v10 << 32) | (v9 << 48) | ((unint64_t)a4 << 16) type:2 anchorCellID:(unint64_t)a4 << 16 cursorCellID:((a4 << 16) + (v10 << 16) + 16711680) & 0xFF0000 | (unsigned __int16)(v9 - 1)];
}

- (TSTTableSelection)initWithTableModel:(id)a3 rowOrColumn:(int)a4 index:(unsigned int)a5 count:(unsigned int)a6
{
  if (a4 == 2)
  {
    return [(TSTTableSelection *)self initWithTableModel:a3 startingColumnIndex:a5 numberOfColumns:(unsigned __int16)a6];
  }
  else if (a4 == 1)
  {
    return [(TSTTableSelection *)self initWithTableModel:a3 startingRowIndex:(unsigned __int16)a5 numberOfRows:(unsigned __int16)a6];
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, *(void *)&a4, *(void *)&a5, *(void *)&a6);
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSTTableSelection initWithTableModel:rowOrColumn:index:count:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableSelection.mm"), 218, @"Invalid selection type used with rowOrColumn initializer.");
    return 0;
  }
}

- (TSTTableSelection)initWithTableModel:(id)a3 andPreviousSelection:(id)a4 offsetBy:(id)a5
{
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "cellRegion"), "regionOffsetBy:", a5);
  uint64_t v9 = [a4 anchorCellID];
  int v10 = a5.var0 + BYTE2(v9);
  int v11 = a5.var1 + (unsigned __int16)v9;
  int v12 = [a4 cursorCellID];
  uint64_t v13 = objc_msgSend((id)objc_msgSend(a4, "baseRegion"), "regionOffsetBy:", a5);
  uint64_t v14 = [a4 selectionType];
  BOOL v16 = v11 <= 0xFFFF && v11 >= 0 && (v10 & 0xFFFF0000) == 0;
  int v17 = a5.var1 + (unsigned __int16)v12;
  if (v16) {
    uint64_t v18 = (v10 << 16) | v11;
  }
  else {
    uint64_t v18 = 0xFFFFFFLL;
  }
  if (v17 <= 0xFFFF && v17 >= 0 && ((a5.var0 + BYTE2(v12)) & 0xFFFF0000) == 0) {
    uint64_t v21 = ((LOBYTE(a5.var0) + BYTE2(v12)) << 16) | v17;
  }
  else {
    uint64_t v21 = 0xFFFFFFLL;
  }

  return [(TSTTableSelection *)self initWithTableModel:a3 cellRegion:v8 anchorCellID:v18 cursorCellID:v21 baseRegion:v13 selectionType:v14];
}

- (TSTTableSelection)initWithTableModel:(id)a3 cellRegion:(id)a4
{
  unsigned int v7 = [a4 suitableAnchor];
  unsigned int v8 = [a4 suitableCursor];
  id v9 = +[TSTCellRegion regionFromRange:0];

  return [(TSTTableSelection *)self initWithTableModel:a3 cellRegion:a4 anchorCellID:v7 cursorCellID:v8 baseRegion:v9 selectionType:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableSelection;
  [(TSTTableSelection *)&v3 dealloc];
}

- (id)selectionByExtendingWithCellRange:(id)a3 inTable:(id)a4 selectionType:(int)a5 cursorCell:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  if (a3.var0.var0 == 0xFFFF
    || (*(void *)&a3 & 0xFF0000) == 0xFF0000
    || !a3.var1.var1
    || (*(void *)&a3 & 0xFFFF00000000) == 0)
  {
    int v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSTTableSelection selectionByExtendingWithCellRange:inTable:selectionType:cursorCell:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableSelection.mm"), 372, @"Can't extend a selection with an invalid cell range");
  }
  BOOL v13 = [(TSTCellRegion *)[(TSTTableSelection *)self cellRegion] containsCellID:[(TSTTableSelection *)self anchorCellID]];
  uint64_t v14 = [(TSTTableSelection *)self baseRegion];
  if (v13) {
    uint64_t v15 = [(TSTCellRegion *)v14 regionByAddingRange:a3];
  }
  else {
    uint64_t v15 = [(TSTCellRegion *)v14 regionBySubtractingRange:a3];
  }
  BOOL v16 = [[TSTTableSelection alloc] initWithTableModel:a4 cellRegion:v15 anchorCellID:[(TSTTableSelection *)self anchorCellID] cursorCellID:*(unsigned int *)&a6 baseRegion:[(TSTTableSelection *)self baseRegion] selectionType:v7];

  return v16;
}

- (id)selectionByAddingCellRange:(id)a3 inTable:(id)a4 withAnchor:(id)a5 cursor:(id)a6 selectionType:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  if (a3.var0.var0 == 0xFFFF
    || (*(void *)&a3 & 0xFF0000) == 0xFF0000
    || !a3.var1.var1
    || (*(void *)&a3 & 0xFFFF00000000) == 0)
  {
    BOOL v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"-[TSTTableSelection selectionByAddingCellRange:inTable:withAnchor:cursor:selectionType:]"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableSelection.mm"), 396, @"Can't extend a selection with an invalid cell range");
  }
  uint64_t v15 = [[TSTTableSelection alloc] initWithTableModel:a4 cellRegion:[(TSTCellRegion *)[(TSTTableSelection *)self cellRegion] regionByAddingRange:a3] anchorCellID:*(unsigned int *)&a5 cursorCellID:*(unsigned int *)&a6 baseRegion:[(TSTTableSelection *)self cellRegion] selectionType:v7];

  return v15;
}

- (id)selectionByRemovingCellRange:(id)a3 inTable:(id)a4 withAnchor:(id)a5 cursor:(id)a6 selectionType:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  if (a3.var0.var0 == 0xFFFF
    || (*(void *)&a3 & 0xFF0000) == 0xFF0000
    || !a3.var1.var1
    || (*(void *)&a3 & 0xFFFF00000000) == 0)
  {
    BOOL v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"-[TSTTableSelection selectionByRemovingCellRange:inTable:withAnchor:cursor:selectionType:]"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableSelection.mm"), 410, @"Can't remove an invalid cell range");
  }
  uint64_t v15 = [[TSTTableSelection alloc] initWithTableModel:a4 cellRegion:[(TSTCellRegion *)[(TSTTableSelection *)self cellRegion] regionBySubtractingRange:a3] anchorCellID:*(unsigned int *)&a5 cursorCellID:*(unsigned int *)&a6 baseRegion:[(TSTTableSelection *)self cellRegion] selectionType:v7];

  return v15;
}

- (id)selectionByMovingInTableInfo:(id)a3 inDirection:(int)a4 withModifierKeys:(int)a5 forReferenceMove:(BOOL)a6
{
  return [(TSTTableSelection *)self selectionByMovingInTableInfo:a3 inDirection:*(void *)&a4 withModifierKeys:*(void *)&a5 forReferenceMove:a6 suppressWrap:0];
}

- (id)selectionByMovingInTableInfo:(id)a3 inDirection:(int)a4 withModifierKeys:(int)a5 forReferenceMove:(BOOL)a6 suppressWrap:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  char v9 = a5;
  v88 = (void *)[a3 tableModel];
  unint64_t v13 = [v88 range];
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v14 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)[(TSTTableSelection *)self cursorCellID];
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v87 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)[(TSTTableSelection *)self anchorCellID];
  int v15 = v9 & 0xC;
  int v16 = [(TSTTableSelection *)self selectionType];
  v86 = self;
  if ((v9 & 1) != 0 || v16 != 1)
  {
    int v20 = [(TSTTableSelection *)self selectionType];
    char v19 = v9;
    if ((v9 & 1) == 0 && v20 == 2)
    {
      $CA3468F20078D5D2DB35E78E73CA60DA v21 = [(TSTCellRegion *)[(TSTTableSelection *)self cellRegion] boundingCellRange];
      if (v8) {
        unsigned __int16 v22 = (LOBYTE(v21.var1.var0) + v21.var0.var1 - 1) - v21.var0.var1 + 1;
      }
      else {
        unsigned __int16 v22 = 1;
      }
      if (a4 == 2)
      {
        if (v15) {
          unsigned int v43 = HIDWORD(v13) + WORD1(v13) + 255;
        }
        else {
          LOBYTE(v43) = TSTTableColumnRightOfColumn(v88, LOBYTE(v21.var1.var0) + v21.var0.var1 - 1);
        }
        if ((_BYTE)v43 == 0xFF) {
          char v58 = -1;
        }
        else {
          char v58 = v43 - v22 + 1;
        }
        if (v8) {
          LOBYTE(v23) = v58;
        }
        else {
          LOBYTE(v23) = v43;
        }
      }
      else
      {
        if (a4 != 1) {
          goto LABEL_19;
        }
        if (v15) {
          unint64_t v23 = v13 >> 16;
        }
        else {
          LOBYTE(v23) = TSTTableColumnLeftOfColumn(v88, v21.var0.var1);
        }
      }
      if ((_BYTE)v23 != 0xFF)
      {
        v56 = [[TSTTableSelection alloc] initWithTableModel:v88 startingColumnIndex:v23 numberOfColumns:v22];
        goto LABEL_183;
      }
      return 0;
    }
  }
  else
  {
    $CA3468F20078D5D2DB35E78E73CA60DA v17 = [(TSTCellRegion *)[(TSTTableSelection *)self cellRegion] boundingCellRange];
    if (v8) {
      uint64_t v18 = *(unsigned int *)&v17.var1.var1;
    }
    else {
      uint64_t v18 = 1;
    }
    if (a4 == 4)
    {
      if ((v9 & 0xC) != 0) {
        int v34 = v13 + HIWORD(v13) - 1;
      }
      else {
        LOWORD(v34) = TSTTableRowBelowRow(v88, v17.var0.var0 + v17.var1.var1 - 1);
      }
      if ((_WORD)v34 == 0xFFFF) {
        __int16 v55 = -1;
      }
      else {
        __int16 v55 = v34 - v18 + 1;
      }
      if (v8) {
        LOWORD(v13) = v55;
      }
      else {
        LOWORD(v13) = v34;
      }
      goto LABEL_76;
    }
    char v19 = v9;
    if (a4 == 3)
    {
      if ((v9 & 0xC) == 0) {
        LOWORD(v13) = TSTTableRowAboveRow(v88, v17.var0.var0);
      }
LABEL_76:
      if ((_WORD)v13 != 0xFFFF)
      {
        v56 = [[TSTTableSelection alloc] initWithTableModel:v88 startingRowIndex:(unsigned __int16)v13 numberOfRows:v18];
LABEL_183:
        return v56;
      }
      return 0;
    }
  }
LABEL_19:
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
  unsigned int v25 = HIWORD(*(unsigned int *)&v87);
  if (v15)
  {
    unsigned int v26 = HIBYTE(*(unsigned int *)&v87);
    unsigned int v27 = HIBYTE(*(unsigned int *)&v14);
    char v28 = v19;
    switch(a4)
    {
      case 1:
        if (v8)
        {
          if (v14.var1 >= v87.var1) {
            unsigned __int8 var1 = v87.var1;
          }
          else {
            unsigned __int8 var1 = v14.var1;
          }
          char v30 = var1 - BYTE2(v13);
          LOBYTE(v31) = v14.var1 - v30;
          LOBYTE(v25) = v87.var1 - v30;
LABEL_94:
          LOWORD(v42) = v87.var0;
          LOWORD(v50) = v14.var0;
        }
        else
        {
          unsigned int v27 = 0;
          unint64_t v31 = v13 >> 16;
          LOWORD(v42) = v87.var0;
          LOWORD(v50) = v14.var0;
        }
        break;
      case 2:
        if (v8)
        {
          if (v14.var1 <= v87.var1) {
            unsigned __int8 v44 = v87.var1;
          }
          else {
            unsigned __int8 v44 = v14.var1;
          }
          char v45 = BYTE4(v13) + BYTE2(v13) - 1 - v44;
          LOBYTE(v31) = v45 + v14.var1;
          LOBYTE(v25) = v45 + v87.var1;
        }
        else
        {
          unsigned int v27 = 0;
          LODWORD(v31) = HIDWORD(v13) + WORD1(v13) + 255;
        }
        goto LABEL_94;
      case 3:
        if (v14.var0 >= v87.var0) {
          unsigned __int16 var0 = v87.var0;
        }
        else {
          unsigned __int16 var0 = v14.var0;
        }
        __int16 v47 = var0 - v13;
        __int16 v48 = v14.var0 - v47;
        __int16 v49 = v87.var0 - v47;
        if (v8) {
          LOWORD(v42) = v49;
        }
        else {
          LOWORD(v42) = v87.var0;
        }
        if (v8) {
          LOWORD(v50) = v48;
        }
        else {
          LOWORD(v50) = v13;
        }
        goto LABEL_67;
      case 4:
        if (v14.var0 <= v87.var0) {
          unsigned __int16 v51 = v87.var0;
        }
        else {
          unsigned __int16 v51 = v14.var0;
        }
        __int16 v52 = ~v51 + v13 + HIWORD(v13);
        __int16 v53 = v52 + v14.var0;
        __int16 v54 = v52 + v87.var0;
        if (v8) {
          LOWORD(v42) = v54;
        }
        else {
          LOWORD(v42) = v87.var0;
        }
        if (v8) {
          LOWORD(v50) = v53;
        }
        else {
          LOWORD(v50) = v13 + HIWORD(v13) - 1;
        }
LABEL_67:
        LOBYTE(v31) = v14.var1;
        if (!v8) {
          unsigned int v27 = 0;
        }
        break;
      default:
        goto LABEL_159;
    }
    goto LABEL_160;
  }
  char v28 = v19;
  if (v19)
  {
    unint64_t v32 = v13;
    if ([(TSTTableSelection *)v86 selectionType] == 1)
    {
      if (a4 == 4)
      {
        unsigned int v33 = TSTTableCellBelowCell((uint64_t *)v88, *(unsigned int *)&v14);
      }
      else
      {
        if (a4 != 3)
        {
          unsigned int v27 = HIBYTE(*(unsigned int *)&v14);
          LOWORD(v50) = v14.var0;
          goto LABEL_108;
        }
        unsigned int v33 = TSTTableCellAboveCell((uint64_t *)v88, *(unsigned int *)&v14);
      }
      LOWORD(v50) = v33;
      unsigned int v27 = HIBYTE(v33);
LABEL_108:
      $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
      LOBYTE(v25) = v87.var1;
      unsigned int v26 = HIBYTE(*(unsigned int *)&v87);
      LODWORD(v31) = HIDWORD(v13) + WORD1(v13) + 255;
LABEL_135:
      LOWORD(v42) = v24.var0;
      goto LABEL_160;
    }
    if ([(TSTTableSelection *)v86 selectionType] == 2)
    {
      if (a4 == 2)
      {
        unsigned int v57 = TSTTableCellRightOfCell((uint64_t *)v88, *(unsigned int *)&v14);
      }
      else
      {
        if (a4 != 1)
        {
          unsigned int v27 = HIBYTE(*(unsigned int *)&v14);
          LODWORD(v31) = HIWORD(*(unsigned int *)&v14);
          goto LABEL_134;
        }
        unsigned int v57 = TSTTableCellLeftOfCell((uint64_t *)v88, *(unsigned int *)&v14);
      }
      LODWORD(v31) = HIWORD(v57);
      unsigned int v27 = HIBYTE(v57);
LABEL_134:
      $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
      LOBYTE(v25) = v87.var1;
      unsigned int v26 = HIBYTE(*(unsigned int *)&v87);
      int v50 = v13 + HIWORD(v13) - 1;
      goto LABEL_135;
    }
    int v59 = a4 - 1;
    unint64_t v84 = v32;
    switch(a4)
    {
      case 1:
        unint64_t v60 = v14;
        unsigned int v61 = TSTTableCellLeftOfCell((uint64_t *)v88, *(unsigned int *)&v14);
        goto LABEL_137;
      case 2:
        unint64_t v60 = v14;
        unsigned int v61 = TSTTableCellRightOfCell((uint64_t *)v88, *(unsigned int *)&v14);
LABEL_137:
        LOWORD(v50) = v61;
        unsigned int v85 = HIBYTE(v61);
        LODWORD(v31) = HIWORD(v61);
        $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v65 = v87;
        unint64_t v66 = TSTCellRangeUnionCellID(*(unsigned int *)&v87 | 0x1000100000000, v60);
        unint64_t v67 = v66 & 0xFFFF000000000000;
        unint64_t v68 = 0x100000000;
        LODWORD(v69) = HIWORD(*(unsigned int *)&v14);
        goto LABEL_142;
      case 3:
        unint64_t v70 = v14;
        unsigned int v71 = TSTTableCellAboveCell((uint64_t *)v88, *(unsigned int *)&v14);
        goto LABEL_140;
      case 4:
        unint64_t v70 = v14;
        unsigned int v71 = TSTTableCellBelowCell((uint64_t *)v88, *(unsigned int *)&v14);
LABEL_140:
        LOWORD(v50) = v71;
        unsigned int v85 = HIBYTE(v71);
        LODWORD(v31) = HIWORD(v71);
        $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v65 = v87;
        unint64_t v66 = TSTCellRangeUnionCellID(*(unsigned int *)&v87 | 0x1000100000000, v70);
        unint64_t v69 = v66 >> 16;
        unint64_t v68 = v66 & 0xFFFFFFFF00000000;
        unint64_t v67 = 0x1000000000000;
        unsigned __int16 v72 = v14.var0;
        break;
      default:
        unsigned int v85 = HIBYTE(*(unsigned int *)&v14);
        $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v65 = v87;
        unint64_t v66 = TSTCellRangeUnionCellID(*(unsigned int *)&v87 | 0x1000100000000, *(unsigned int *)&v14);
        unint64_t v69 = v66 >> 16;
        unint64_t v68 = v66 & 0xFFFFFFFF00000000;
        unint64_t v67 = v66 & 0xFFFF000000000000;
        LODWORD(v31) = HIWORD(*(unsigned int *)&v14);
        LOWORD(v50) = v14.var0;
LABEL_142:
        unsigned __int16 v72 = v66;
        break;
    }
    unsigned int v73 = HIBYTE(*(unsigned int *)&v65);
    unint64_t v74 = TSTTableExpandCellRangeToCoverMergedCells((uint64_t)v88, v67 | v66 & 0xFF000000 | v68 & 0xFFFF00000000 | ((unint64_t)v69 << 16) | v72);
    if (HIWORD(v74))
    {
      unsigned int v27 = v85;
      if ((v74 & 0xFFFF00000000) != 0)
      {
        unsigned int v26 = v73;
        if ((unsigned __int16)v50 >= (unsigned __int16)v74
          && (unsigned __int16)(v74 - 1 + HIWORD(v74)) >= (unsigned __int16)v50
          && v31 >= BYTE2(v74)
          && (unsigned int v75 = HIDWORD(v74) + WORD1(v74) + 255,
              v31 <= (BYTE4(v74) + BYTE2(v74) - 1)))
        {
          switch(v59)
          {
            case 0:
              if (BYTE2(v74) == BYTE2(v84)) {
                goto LABEL_189;
              }
              LOBYTE(v31) = BYTE2(v74) - 1;
              goto LABEL_149;
            case 1:
              LOBYTE(v25) = v87.var1;
              if (v75 != (BYTE4(v84) + BYTE2(v84) - 1))
              {
                LOBYTE(v31) = v75 + 1;
                $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
                goto LABEL_135;
              }
              unsigned int v27 = HIBYTE(*(unsigned int *)&v14);
              $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
LABEL_159:
              LOWORD(v42) = v24.var0;
              LOWORD(v50) = v14.var0;
              LODWORD(v31) = HIWORD(*(unsigned int *)&v14);
              break;
            case 2:
              if ((unsigned __int16)v74 == (unsigned __int16)v84) {
                goto LABEL_189;
              }
              $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
              LOWORD(v42) = v87.var0;
              LOWORD(v50) = v74 - 1;
              goto LABEL_150;
            case 3:
              LOWORD(v50) = HIWORD(v74) + v74;
              if ((unsigned __int16)(HIWORD(v74) + v74) != (unsigned __int16)(v84 + HIWORD(v84))) {
                goto LABEL_149;
              }
LABEL_189:
              unsigned int v27 = HIBYTE(*(unsigned int *)&v14);
              $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
              goto LABEL_104;
            default:
              goto LABEL_149;
          }
        }
        else
        {
LABEL_149:
          $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
          LOWORD(v42) = v87.var0;
LABEL_150:
          LOBYTE(v25) = v87.var1;
        }
        goto LABEL_160;
      }
      $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
      LOWORD(v42) = v87.var0;
      LOBYTE(v25) = v87.var1;
    }
    else
    {
      $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
      LOWORD(v42) = v87.var0;
      LOBYTE(v25) = v87.var1;
      unsigned int v27 = v85;
    }
    unsigned int v26 = v73;
    goto LABEL_160;
  }
  int v35 = objc_msgSend(+[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration"), "arrowKeysWrap") & !v7;
  uint64_t v36 = [a3 masterLayout];
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
  if (((*(_DWORD *)&v87 ^ *(_DWORD *)&v14) & 0xFFFFFF) != 0) {
    int v37 = 0;
  }
  else {
    int v37 = v35;
  }
  if (v8) {
    int v38 = v37;
  }
  else {
    int v38 = v35;
  }
  unsigned int v26 = HIBYTE(*(unsigned int *)&v87);
  unint64_t v39 = v13;
  switch(a4)
  {
    case 1:
      v40 = (void *)v36;
      if (v8)
      {
        unsigned int v41 = TSTTableCellLeftOfCell((uint64_t *)v88, *(unsigned int *)&v14);
        unsigned int v42 = TSTTableCellLeftOfCell((uint64_t *)v88, *(unsigned int *)&v87);
        $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
        unsigned int v25 = HIWORD(v42);
        unsigned int v26 = HIBYTE(v42);
      }
      else
      {
        unsigned int v25 = TSTTableCellLeftOfCell((uint64_t *)v88, *(unsigned int *)&v87);
        unsigned int v26 = HIBYTE(*(unsigned int *)&v87);
        unsigned int v41 = v25;
        $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
        LOWORD(v42) = v87.var0;
        LOBYTE(v25) = v87.var1;
      }
      unsigned int v27 = HIBYTE(v41);
      LODWORD(v31) = HIWORD(v41);
      if ((_WORD)v41 != 0xFFFF && (*(void *)&v41 & 0xFF0000) != 0xFF0000 || !v38) {
        goto LABEL_130;
      }
      LOWORD(v42) = TSTTableRowAboveRow(v88, v24.var0);
      LOBYTE(v25) = TSTMasterLayoutPreviousVisibleColumn(v40, (BYTE4(v39) + BYTE2(v39) - 1));
      goto LABEL_129;
    case 2:
      v62 = (void *)v36;
      if (v8)
      {
        unsigned int v41 = TSTTableCellRightOfCell((uint64_t *)v88, *(unsigned int *)&v14);
        unsigned int v42 = TSTTableCellRightOfCell((uint64_t *)v88, *(unsigned int *)&v87);
        $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
        unsigned int v25 = HIWORD(v42);
        unsigned int v26 = HIBYTE(v42);
      }
      else
      {
        unsigned int v25 = TSTTableCellRightOfCell((uint64_t *)v88, *(unsigned int *)&v87);
        unsigned int v26 = HIBYTE(*(unsigned int *)&v87);
        unsigned int v41 = v25;
        $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
        LOWORD(v42) = v87.var0;
        LOBYTE(v25) = v87.var1;
      }
      unsigned int v27 = HIBYTE(v41);
      LODWORD(v31) = HIWORD(v41);
      if ((_WORD)v41 != 0xFFFF && (*(void *)&v41 & 0xFF0000) != 0xFF0000 || !v38) {
        goto LABEL_130;
      }
      LOWORD(v42) = TSTTableRowBelowRow(v88, v24.var0);
      LOBYTE(v25) = TSTMasterLayoutNextVisibleColumn(v62, 0);
      goto LABEL_129;
    case 3:
      v63 = (void *)v36;
      if (v8)
      {
        unsigned int v41 = TSTTableCellAboveCell((uint64_t *)v88, *(unsigned int *)&v14);
        unsigned int v42 = TSTTableCellAboveCell((uint64_t *)v88, *(unsigned int *)&v87);
        $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
        unsigned int v25 = HIWORD(v42);
        unsigned int v26 = HIBYTE(v42);
      }
      else
      {
        unsigned int v25 = TSTTableCellAboveCell((uint64_t *)v88, *(unsigned int *)&v87);
        unsigned int v26 = HIBYTE(*(unsigned int *)&v87);
        unsigned int v41 = v25;
        $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
        LOWORD(v42) = v87.var0;
        LOBYTE(v25) = v87.var1;
      }
      unsigned int v27 = HIBYTE(v41);
      LODWORD(v31) = HIWORD(v41);
      if ((_WORD)v41 != 0xFFFF && (*(void *)&v41 & 0xFF0000) != 0xFF0000 || !v38) {
        goto LABEL_130;
      }
      LOWORD(v42) = TSTMasterLayoutPreviousVisibleRow(v63, (unsigned __int16)(v39 + HIWORD(v39) - 1));
      LOBYTE(v25) = TSTTableColumnLeftOfColumn(v88, v87.var1);
      goto LABEL_129;
    case 4:
      v64 = (void *)v36;
      if (v8)
      {
        unsigned int v41 = TSTTableCellBelowCell((uint64_t *)v88, *(unsigned int *)&v14);
        unsigned int v42 = TSTTableCellBelowCell((uint64_t *)v88, *(unsigned int *)&v87);
        $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
        unsigned int v25 = HIWORD(v42);
        unsigned int v26 = HIBYTE(v42);
      }
      else
      {
        unsigned int v25 = TSTTableCellBelowCell((uint64_t *)v88, *(unsigned int *)&v87);
        unsigned int v26 = HIBYTE(*(unsigned int *)&v87);
        unsigned int v41 = v25;
        $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
        LOWORD(v42) = v87.var0;
        LOBYTE(v25) = v87.var1;
      }
      unsigned int v27 = HIBYTE(v41);
      LODWORD(v31) = HIWORD(v41);
      if (((_WORD)v41 == 0xFFFF || (*(void *)&v41 & 0xFF0000) == 0xFF0000) && v38)
      {
        LOWORD(v42) = TSTMasterLayoutNextVisibleRow(v64, 0);
        LOBYTE(v25) = TSTTableColumnRightOfColumn(v88, v87.var1);
LABEL_129:
        $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = v87;
        unsigned int v26 = v27;
        LOWORD(v50) = v42;
        LOBYTE(v31) = v25;
      }
      else
      {
LABEL_130:
        LOWORD(v50) = v41;
      }
      break;
    default:
      unsigned int v27 = HIBYTE(*(unsigned int *)&v14);
LABEL_104:
      LOWORD(v42) = v24.var0;
      LOWORD(v50) = v14.var0;
      LODWORD(v31) = HIWORD(*(unsigned int *)&v14);
      goto LABEL_150;
  }
LABEL_160:
  if ((_WORD)v50 == 0xFFFF || (_BYTE)v31 == 0xFF) {
    return 0;
  }
  unint64_t v76 = (unsigned __int16)v50 | ((unint64_t)v27 << 24) | ((unint64_t)v31 << 16);
  if ((v28 & 1) == 0)
  {
    if (!v8)
    {
      v56 = [[TSTTableSelection alloc] initWithTableModel:v88 andCellID:(unsigned __int16)v50 | ((unint64_t)v27 << 24) | ((unint64_t)v31 << 16)];
      goto LABEL_183;
    }
    if ((_WORD)v42 != 0xFFFF && (_BYTE)v25 != 0xFF)
    {
      unint64_t v79 = (unsigned __int16)v42 | ((unint64_t)v26 << 24) | ((unint64_t)v25 << 16);
      unint64_t v80 = TSTCellRangeUnionCellID(v79 | 0x1000100000000, (unsigned __int16)v50 | ((unint64_t)v27 << 24) | ((unint64_t)v31 << 16));
      if ([(TSTTableSelection *)v86 selectionType] == 1)
      {
        v81 = v86;
      }
      else
      {
        v81 = v86;
        if ([(TSTTableSelection *)v86 selectionType] != 2) {
          unint64_t v80 = TSTTableExpandCellRangeToCoverMergedCells((uint64_t)v88, v80);
        }
      }
      if (![(TSTCellRegion *)[(TSTTableSelection *)v81 cellRegion] equalsCellRange:v80])
      {
        v56 = [[TSTTableSelection alloc] initWithTableModel:v88 cellRange:v80 type:[(TSTTableSelection *)v81 selectionType] anchorCellID:v79 cursorCellID:v76];
        goto LABEL_183;
      }
    }
    return 0;
  }
  unint64_t v77 = TSTCellRangeUnionCellID(*(unsigned int *)&v24 | 0x1000100000000, (unsigned __int16)v50 | ((unint64_t)v27 << 24) | ((unint64_t)v31 << 16));
  if ([(TSTTableSelection *)v86 selectionType] == 1)
  {
    v78 = v86;
  }
  else
  {
    v78 = v86;
    if ([(TSTTableSelection *)v86 selectionType] != 2) {
      unint64_t v77 = TSTTableExpandCellRangeToCoverMergedCells((uint64_t)v88, v77);
    }
  }
  if ([(TSTCellRegion *)[(TSTTableSelection *)v78 cellRegion] equalsCellRange:v77]&& ((v76 ^ [(TSTTableSelection *)v78 cursorCellID]) & 0xFFFFFFLL) == 0)
  {
    return 0;
  }
  uint64_t v82 = [(TSTTableSelection *)v78 selectionType];

  return [(TSTTableSelection *)v78 selectionByExtendingWithCellRange:v77 inTable:v88 selectionType:v82 cursorCell:v76];
}

- (void)enumerateSelectedCellsInTable:(id)a3 usingBlock:(id)a4
{
}

- (void)enumerateSelectedCellsInTable:(id)a3 withFlags:(unint64_t)a4 usingBlock:(id)a5
{
  unint64_t v6 = (unint64_t)a3;
  BOOL v7 = [[TSTCellIterator alloc] initWithTableModel:a3 region:self->mCellRegion flags:a4];
  char v8 = 0;
  do
  {
    if (![(TSTCellIterator *)v7 getNext:v9]) {
      break;
    }
    unint64_t v6 = v6 & 0xFFFFFFFF00000000 | v10;
    (*((void (**)(id, unint64_t, uint64_t, char *, uint64_t))a5 + 2))(a5, v6, v11, &v8, v12);
  }
  while (!v8);
}

- (void)insert:(int)a3 atIndex:(unsigned __int16)a4 count:(unsigned __int16)a5
{
  unsigned int v5 = a5;
  unsigned int v6 = a4;
  $CA3468F20078D5D2DB35E78E73CA60DA v9 = [(TSTCellRegion *)self->mCellRegion boundingCellRange];
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 var0 = v9.var0;
  unint64_t v11 = HIDWORD(*(unint64_t *)&v9);
  unint64_t v12 = HIWORD(*(unint64_t *)&v9);
  if (!a3)
  {
    int mSelectionType = self->mSelectionType;
    if (mSelectionType)
    {
      if (mSelectionType == 2)
      {
        v12 += v5;
        goto LABEL_26;
      }
      if (mSelectionType != 1 || *(unint64_t *)&v9 >> 49 == 0) {
        goto LABEL_26;
      }
    }
    else if (!(*(unint64_t *)&v9 >> 49))
    {
      goto LABEL_26;
    }
    if (v9.var0.var0 <= v6 && v5 + v6 <= v9.var0.var0 + v12) {
      unint64_t v12 = v12 + v5;
    }
    goto LABEL_26;
  }
  int v13 = self->mSelectionType;
  if (!v13)
  {
    if ((*(void *)&v9 & 0xFFFE00000000) == 0) {
      goto LABEL_26;
    }
LABEL_14:
    if (v9.var0.var1 <= v6 && v5 + v6 <= v9.var0.var1 + v9.var1.var0) {
      LOWORD(v11) = v9.var1.var0 + v5;
    }
    goto LABEL_26;
  }
  if (v13 == 1)
  {
    LOWORD(v11) = v9.var1.var0 + v5;
    goto LABEL_26;
  }
  if (v13 == 2 && (*(void *)&v9 & 0xFFFE00000000) != 0) {
    goto LABEL_14;
  }
LABEL_26:

  self->mCellRegion = 0;
  self->mCellRegion = (TSTCellRegion *)+[TSTCellRegion regionFromRange:((unint64_t)(unsigned __int16)v11 << 32) | (v12 << 48) | *(unsigned int *)&var0];
}

- (void)remove:(int)a3 atIndex:(unsigned __int16)a4 count:(unsigned __int16)a5
{
  int v5 = a5;
  unsigned int v6 = a4;
  $CA3468F20078D5D2DB35E78E73CA60DA v9 = [(TSTCellRegion *)self->mCellRegion boundingCellRange];
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 var0 = v9.var0;
  unsigned __int16 v11 = v9.var0.var0;
  unint64_t v12 = *(unint64_t *)&v9 >> 16;
  unint64_t v13 = HIDWORD(*(unint64_t *)&v9);
  uint64_t v14 = HIWORD(*(unint64_t *)&v9);
  if (a3) {
    unsigned __int16 var1 = v9.var0.var1;
  }
  else {
    unsigned __int16 var1 = v9.var0.var0;
  }
  if ((self->mSelectionType - 3) < 0xFFFFFFFE || v6 < var1)
  {
    unsigned int v16 = var1;
    goto LABEL_15;
  }
  unsigned int v16 = var1;
  if (a3) {
    $201E9A47BE70A2B12CCA2F48B75AA2F7 v17 = v9.var1;
  }
  else {
    $201E9A47BE70A2B12CCA2F48B75AA2F7 v17 = *($201E9A47BE70A2B12CCA2F48B75AA2F7 *)&v9.var1.var1;
  }
  if (v5 + v6 > var1 + v17.var0)
  {
LABEL_15:
    if (v6 >= var1)
    {
      if (a3) {
        $201E9A47BE70A2B12CCA2F48B75AA2F7 v29 = v9.var1;
      }
      else {
        $201E9A47BE70A2B12CCA2F48B75AA2F7 v29 = *($201E9A47BE70A2B12CCA2F48B75AA2F7 *)&v9.var1.var1;
      }
      unsigned int v30 = v16 + v29.var0;
      unsigned int v31 = v6 - v30 + *(_DWORD *)&v29;
      if (a3) {
        unsigned __int16 v32 = v31;
      }
      else {
        unsigned __int16 v32 = v9.var1.var0;
      }
      if (a3) {
        unsigned int v31 = *(_DWORD *)&v9.var1.var1;
      }
      BOOL v33 = v30 >= v6 && v6 + v5 >= v30;
      if (v33) {
        LOWORD(v13) = v32;
      }
      if (v33) {
        uint64_t v14 = v31;
      }
      else {
        uint64_t v14 = v14;
      }
    }
    else
    {
      unsigned int v18 = v6 + v5;
      if (a3) {
        $201E9A47BE70A2B12CCA2F48B75AA2F7 v19 = v9.var1;
      }
      else {
        $201E9A47BE70A2B12CCA2F48B75AA2F7 v19 = *($201E9A47BE70A2B12CCA2F48B75AA2F7 *)&v9.var1.var1;
      }
      unsigned int v20 = v16 + v19.var0;
      unsigned int v21 = *(_DWORD *)&v19 - (v18 - v16);
      unsigned __int16 v22 = v9.var0.var0 - (v18 - v16);
      LOBYTE(v23) = v9.var0.var1 - (v18 - v16);
      if (a3) {
        unsigned __int16 v24 = v21;
      }
      else {
        unsigned __int16 v24 = v9.var1.var0;
      }
      if (a3)
      {
        unsigned int v21 = *(_DWORD *)&v9.var1.var1;
        unsigned __int16 v22 = v9.var0.var0;
      }
      else
      {
        unint64_t v23 = *(unint64_t *)&v9 >> 16;
      }
      BOOL v25 = v18 >= v16;
      if (v18 >= v16) {
        unsigned __int16 v26 = v24;
      }
      else {
        unsigned __int16 v26 = v9.var1.var0;
      }
      if (!v25)
      {
        unsigned int v21 = *(_DWORD *)&v9.var1.var1;
        unsigned __int16 v22 = v9.var0.var0;
        unint64_t v23 = *(unint64_t *)&v9 >> 16;
      }
      if (a3) {
        unsigned __int16 v27 = 0;
      }
      else {
        unsigned __int16 v27 = v9.var1.var0;
      }
      if (a3) {
        unsigned int v28 = *(_DWORD *)&v9.var1.var1;
      }
      else {
        unsigned int v28 = 0;
      }
      if (v18 > v20) {
        LOWORD(v13) = v27;
      }
      else {
        LOWORD(v13) = v26;
      }
      if (v18 > v20) {
        uint64_t v14 = v28;
      }
      else {
        uint64_t v14 = v21;
      }
      if (v18 > v20) {
        unsigned __int16 v11 = v9.var0.var0;
      }
      else {
        unsigned __int16 v11 = v22;
      }
      if (v18 <= v20) {
        LOBYTE(v12) = v23;
      }
    }
    goto LABEL_72;
  }
  if (v5 == v17.var0)
  {
    if (var1)
    {
      if (a3)
      {
        LOBYTE(v12) = v9.var0.var1 - 1;
LABEL_69:
        LOWORD(v13) = 1;
        goto LABEL_72;
      }
      unsigned __int16 v11 = v9.var0.var0 - 1;
    }
    else if (a3)
    {
      goto LABEL_69;
    }
    uint64_t v14 = 1;
    goto LABEL_72;
  }
  if (a3)
  {
    LOWORD(v13) = v17.var0 - v5;
    uint64_t v14 = v14;
  }
  else
  {
    uint64_t v14 = (*(_DWORD *)&v17 - v5);
  }
LABEL_72:

  self->mCellRegion = 0;
  self->mCellRegion = (TSTCellRegion *)+[TSTCellRegion regionFromRange:((unint64_t)(unsigned __int16)v13 << 32) | (v14 << 48) | *(_DWORD *)&var0 & 0xFF000000 | ((unint64_t)v12 << 16) | v11];
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[TSTTableSelection allocWithZone:](TSTTableSelection, "allocWithZone:") init];
  v5->mCellRegion = (TSTCellRegion *)[(TSTCellRegion *)self->mCellRegion copyWithZone:a3];
  v5->int mSelectionType = self->mSelectionType;
  v5->mAnchorCellID = self->mAnchorCellID;
  v5->mBaseRegion = (TSTCellRegion *)[(TSTCellRegion *)self->mBaseRegion copyWithZone:a3];
  v5->mCursorCellID = self->mCursorCellID;
  v5->mSearchReferenceRange = self->mSearchReferenceRange;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    LOBYTE(v5) = [(TSTTableSelection *)self isEqualToSelection:a3];
  }
  return v5;
}

- (BOOL)isEqualToSelection:(id)a3
{
  if (![a3 isMemberOfClass:objc_opt_class()]
    || [a3 selectionType] != self->mSelectionType
    || !objc_msgSend((id)objc_msgSend(a3, "cellRegion"), "equalsCellRegion:", self->mCellRegion)
    || ((*(_DWORD *)&self->mAnchorCellID ^ [a3 anchorCellID]) & 0xFFFFFF) != 0
    || ((*(_DWORD *)&self->mCursorCellID ^ [a3 cursorCellID]) & 0xFFFFFF) != 0)
  {
    return 0;
  }
  unsigned int v6 = (void *)[a3 baseRegion];
  mBaseRegion = self->mBaseRegion;

  return [v6 equalsCellRegion:mBaseRegion];
}

- (BOOL)areCellsInTheSameRegionInTable:(id)a3
{
  $CA3468F20078D5D2DB35E78E73CA60DA v4 = [(TSTCellRegion *)self->mCellRegion boundingCellRange];
  int v5 = [a3 tableAreaForCellID:*(_DWORD *)&v4.var0];
  int v6 = [a3 tableAreaForCellID:(*(_DWORD *)&v4.var0 + (*(_DWORD *)&v4.var0.var1 & 0xFF0000u) + 16711680) & 0xFF0000 | (unsigned __int16)(v4.var0.var0 + v4.var1.var1 - 1)];
  if (v5 == 4 && v6 == 1) {
    return 1;
  }
  return v5 == 5 && v6 == 3 || v5 == v6;
}

- (BOOL)containsSelection:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    mCellRegion = self->mCellRegion;
    uint64_t v7 = [a3 cellRegion];
    LOBYTE(v5) = [(TSTCellRegion *)mCellRegion containsCellRegion:v7];
  }
  return v5;
}

- (BOOL)containsCell:(id)a3
{
  $CA3468F20078D5D2DB35E78E73CA60DA v4 = [(TSTTableSelection *)self cellRegion];

  return [(TSTCellRegion *)v4 containsCellID:*(unsigned int *)&a3];
}

- (NSString)description
{
  objc_super v3 = NSString;
  $CA3468F20078D5D2DB35E78E73CA60DA v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  uint64_t mSelectionType = self->mSelectionType;
  if (mSelectionType > 5) {
    uint64_t v7 = @"<unknown>";
  }
  else {
    uint64_t v7 = off_2646B33B8[mSelectionType];
  }
  id v8 = [(TSTCellRegion *)self->mCellRegion description];
  id v9 = [(TSTCellRegion *)self->mBaseRegion description];
  uint64_t v10 = [NSString stringWithFormat:@"(%hu, %hu)", BYTE2(*(_DWORD *)&self->mAnchorCellID), (unsigned __int16)*(_DWORD *)&self->mAnchorCellID];
  return (NSString *)[v3 stringWithFormat:@"<%@: %p type: %@ region: %@ base region: %@ anchor: %@ cursor: %@>", v5, self, v7, v8, v9, v10, objc_msgSend(NSString, "stringWithFormat:", @"(%hu, %hu)", BYTE2(*(_DWORD *)&self->mCursorCellID), (unsigned __int16)*(_DWORD *)&self->mCursorCellID)];
}

- (BOOL)intersectsPartialMergeRangeInTable:(id)a3
{
  if ((self->mSelectionType - 1) > 1)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    id v4 = TSTTableMergeRangesForCellRange((uint64_t)a3, [(TSTCellRegion *)self->mCellRegion boundingCellRange]);
    uint64_t v5 = [v4 count];
    if (v5)
    {
      int v6 = (void *)[v4 iterator];
      for (i = v6; ; int v6 = i)
      {
        unint64_t v8 = [v6 nextMergeRegion];
        LOBYTE(v5) = 0;
        if ((_WORD)v8 == 0xFFFF) {
          break;
        }
        if ((v8 & 0xFF0000) == 0xFF0000) {
          break;
        }
        LOBYTE(v5) = 0;
        if (!HIWORD(v8) || (v8 & 0xFFFF00000000) == 0) {
          break;
        }
        if ([(TSTCellRegion *)self->mCellRegion intersectsCellRange:v8]
          && ![(TSTCellRegion *)self->mCellRegion containsCellRange:v8])
        {
          LOBYTE(v5) = 1;
          return v5;
        }
      }
    }
  }
  return v5;
}

- (_NSRange)range
{
  NSUInteger v2 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)isAtEndOfLine
{
  return 0;
}

- (TSTCellRegion)cellRegion
{
  return self->mCellRegion;
}

- (int)selectionType
{
  return self->mSelectionType;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)anchorCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mAnchorCellID;
}

- (TSTCellRegion)baseRegion
{
  return self->mBaseRegion;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cursorCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mCursorCellID;
}

- (_NSRange)searchReferenceRange
{
  p_mSearchReferenceRange = &self->mSearchReferenceRange;
  NSUInteger location = self->mSearchReferenceRange.location;
  NSUInteger length = p_mSearchReferenceRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSearchReferenceRange:(_NSRange)a3
{
  self->mSearchReferenceRange = a3;
}

@end