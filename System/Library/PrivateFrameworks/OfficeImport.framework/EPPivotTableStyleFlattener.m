@interface EPPivotTableStyleFlattener
- (BOOL)isObjectSupported:(id)a3;
- (id)collectionFromWorksheet:(id)a3;
- (id)keysInTheOrderTheyShouldBeApplied;
- (id)newExtractedCellStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5 column:(int)a6;
- (id)newExtractedRowStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5;
- (id)styleFromObject:(id)a3;
- (int)borderFlagsForStyleType:(int)a3 row:(int)a4 column:(int)a5;
- (int)stripeOffset:(int)a3 row:(BOOL)a4;
- (unsigned)constrainLevel:(unsigned int)a3;
- (void)addColumnSubheadingLevel:(unsigned int)a3 to:(id)a4;
- (void)addRowSubheadingLevel:(unsigned int)a3 to:(id)a4;
- (void)addSubtotalColumnLevel:(unsigned int)a3 to:(id)a4;
- (void)addSubtotalRowLevel:(unsigned int)a3 to:(id)a4;
- (void)cacheSizes:(id)a3 inObject:(id)a4;
- (void)clearCache;
@end

@implementation EPPivotTableStyleFlattener

- (BOOL)isObjectSupported:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)keysInTheOrderTheyShouldBeApplied
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  v20 = [NSNumber numberWithInt:10];
  uint64_t v3 = [NSNumber numberWithInt:11];
  v4 = [NSNumber numberWithInt:12];
  v33 = [NSNumber numberWithInt:13];
  v32 = [NSNumber numberWithInt:3];
  v31 = [NSNumber numberWithInt:5];
  v19 = [NSNumber numberWithInt:27];
  v30 = [NSNumber numberWithInt:26];
  v5 = [NSNumber numberWithInt:25];
  v29 = [NSNumber numberWithInt:20];
  v6 = [NSNumber numberWithInt:19];
  v28 = [NSNumber numberWithInt:18];
  v7 = [NSNumber numberWithInt:24];
  v8 = [NSNumber numberWithInt:23];
  v18 = [NSNumber numberWithInt:22];
  v17 = [NSNumber numberWithInt:17];
  v27 = [NSNumber numberWithInt:16];
  v26 = [NSNumber numberWithInt:15];
  v25 = [NSNumber numberWithInt:21];
  v24 = [NSNumber numberWithInt:2];
  v23 = [NSNumber numberWithInt:4];
  v16 = [NSNumber numberWithInt:7];
  v22 = [NSNumber numberWithInt:6];
  v15 = [NSNumber numberWithInt:9];
  v14 = [NSNumber numberWithInt:8];
  v13 = [NSNumber numberWithInt:29];
  v21 = (void *)v3;
  v12 = [NSNumber numberWithInt:28];
  v9 = [NSNumber numberWithInt:1];
  objc_msgSend(v2, "arrayWithObjects:", v20, v21, v4, v33, v32, v31, v19, v30, v5, v29, v6, v28, v7, v8, v18, v17, v27,
    v26,
    v25,
    v24,
    v23,
    v16,
    v22,
    v15,
    v14,
    v13,
    v12,
    v9,
    0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)collectionFromWorksheet:(id)a3
{
  uint64_t v3 = [a3 pivotTables];
  return v3;
}

- (id)styleFromObject:(id)a3
{
  uint64_t v3 = [a3 style];
  return v3;
}

- (void)cacheSizes:(id)a3 inObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->mPivotTable, a4);
  v8 = [(EDPivotTable *)self->mPivotTable pivotTableRange];
  v18.receiver = self;
  v18.super_class = (Class)EPPivotTableStyleFlattener;
  [(EPStyleFlattener *)&v18 cacheRange:v8];

  self->mFirstHeaderRow = [(EDPivotTable *)self->mPivotTable firstHeaderRow];
  self->mFirstDataRow = [(EDPivotTable *)self->mPivotTable firstDataRow];
  self->mFirstDataColumn = [(EDPivotTable *)self->mPivotTable firstDataColumn];
  v9 = [(EDPivotTable *)self->mPivotTable rowFields];
  self->mRowFieldsCount = [v9 count];

  v10 = [(EDPivotTable *)self->mPivotTable columnFields];
  self->mColumnFieldsCount = [v10 count];

  id v11 = [(EDPivotTable *)self->mPivotTable pageFields];
  self->unint64_t mPageFieldsCount = [v11 count];

  unint64_t mPageFieldsCount = self->mPageFieldsCount;
  if (mPageFieldsCount)
  {
    int mFirstRow = self->super.mFirstRow;
    int v14 = ~mPageFieldsCount;
    if (mFirstRow + v14 >= 0)
    {
      v15 = +[EDReference referenceWithFirstRow:(mFirstRow + v14) lastRow:(mFirstRow - 2) firstColumn:self->super.mFirstColumn lastColumn:(self->super.mFirstColumn + 1)];
      v17.receiver = self;
      v17.super_class = (Class)EPPivotTableStyleFlattener;
      [(EPStyleFlattener *)&v17 cacheRange:v15];
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)EPPivotTableStyleFlattener;
  [(EPStyleFlattener *)&v16 cacheSizes:v6 inObject:v7];
}

- (int)borderFlagsForStyleType:(int)a3 row:(int)a4 column:(int)a5
{
  int v52 = a5 - self->super.mFirstColumn;
  int v7 = a5 == self->super.mFirstColumn;
  int mFirstRow = self->super.mFirstRow;
  if (self->super.mLastColumn == a5) {
    v7 |= 2u;
  }
  int v9 = a4 - mFirstRow;
  if (a4 == mFirstRow) {
    v7 |= 4u;
  }
  int v47 = v7 | 8;
  if (self->super.mLastRow == a4) {
    int v10 = v7 | 8;
  }
  else {
    int v10 = v7;
  }
  int mFirstDataRow = self->mFirstDataRow;
  int mFirstDataColumn = self->mFirstDataColumn;
  v49 = [(EDPivotTable *)self->mPivotTable rowItems];
  v54 = [(EDPivotTable *)self->mPivotTable columnItems];
  int v48 = v9;
  int v45 = v9 - mFirstDataRow;
  v50 = [v49 objectAtIndex:v9 - mFirstDataRow];
  v53 = [v54 objectAtIndex:v52 - mFirstDataColumn];
  int v12 = 15;
  switch(a3)
  {
    case 1:
      int v12 = v10;
      if (v48 < 0)
      {
        int v35 = self->super.mFirstRow;
        if (v35 + ~LODWORD(self->mPageFieldsCount) == a4) {
          int v36 = v10 | 4;
        }
        else {
          int v36 = v10;
        }
        if (v35 - 2 == a4) {
          int v37 = v36 | 8;
        }
        else {
          int v37 = v36;
        }
        if (v52 == 1) {
          int v12 = v37 | 2;
        }
        else {
          int v12 = v37;
        }
      }
      break;
    case 2:
      if (self->mFirstDataRow == v48 + 1) {
        int v12 = v47;
      }
      else {
        int v12 = v10;
      }
      break;
    case 3:
      if (*(_DWORD *)((char *)&self->super.super.super.isa + v43) == a4) {
        int v12 = v10 | 4;
      }
      else {
        int v12 = v10;
      }
      break;
    case 4:
      if (self->mFirstDataColumn == v52 + 1) {
        int v12 = v10 | 2;
      }
      else {
        int v12 = v10;
      }
      break;
    case 5:
      if (v48 == 1) {
        int v38 = 5;
      }
      else {
        int v38 = 1;
      }
      int v12 = v10 | v38;
      break;
    case 6:
    case 7:
      int v19 = [(EPPivotTableStyleFlattener *)self stripeOffset:v48 row:1];
      signed int mFirstRowStripeSize = self->super.mFirstRowStripeSize;
      int v21 = v19 - mFirstRowStripeSize;
      if (v19 >= mFirstRowStripeSize)
      {
        signed int mFirstRowStripeSize = self->super.mSecondRowStripeSize;
        int v19 = v21;
      }
      int v22 = v10 | 4;
      if (v19) {
        int v22 = v10;
      }
      int v23 = v19 + 1;
      int v24 = v22 | 8;
      goto LABEL_36;
    case 8:
    case 9:
      int v25 = [(EPPivotTableStyleFlattener *)self stripeOffset:v52 row:0];
      signed int mFirstRowStripeSize = self->super.mFirstColumnStripeSize;
      int v26 = v25 - mFirstRowStripeSize;
      if (v25 >= mFirstRowStripeSize)
      {
        signed int mFirstRowStripeSize = self->super.mSecondColumnStripeSize;
        int v25 = v26;
      }
      int v22 = v10 | (v25 == 0);
      int v23 = v25 + 1;
      int v24 = v22 | 2;
LABEL_36:
      if (v23 == mFirstRowStripeSize) {
        int v12 = v24;
      }
      else {
        int v12 = v22;
      }
      break;
    case 10:
      if (self->mFirstDataColumn == v52 + 1) {
        int v12 = v10 | 0xA;
      }
      else {
        int v12 = v47;
      }
      break;
    case 15:
    case 16:
    case 17:
      if (v48 - 1 == [v53 repeatedItemCounts]) {
        int v13 = 7;
      }
      else {
        int v13 = 3;
      }
      goto LABEL_12;
    case 18:
    case 19:
    case 20:
      int v12 = v10 | 0xC;
      if ((v45 & 0x80000000) == 0 && v52 == [v50 repeatedItemCounts]) {
        int v12 = v10 | 0xD;
      }
      break;
    case 21:
      goto LABEL_18;
    case 22:
    case 23:
    case 24:
      if (v48 <= (int)[v53 repeatedItemCounts])
      {
        int v18 = v10 | 0xC;
      }
      else
      {
        int v14 = [v53 itemIndexes];
        int v15 = [v14 count];
        int v16 = [v53 repeatedItemCounts];

        if (v48 == v16 + v15) {
          int v17 = v10 | 4;
        }
        else {
          int v17 = v10;
        }
        if (v48 <= v16 + v15 - 1) {
          int v17 = v10 | 0xC;
        }
        if (v48 == LODWORD(self->mColumnFieldsCount)) {
          int v18 = v17 | 8;
        }
        else {
          int v18 = v17;
        }
      }
      BOOL v31 = v52 == mFirstDataColumn || v48 > (int)[v53 repeatedItemCounts];
      int v32 = v18 | v31;
      if (self->super.mLastColumn == a5)
      {
        int v12 = v32 | 2;
      }
      else
      {
        v33 = [v54 objectAtIndex:v52 - mFirstDataColumn + 1];
        int v34 = [v33 repeatedItemCounts];

        if (v48 <= v34) {
          int v12 = v32;
        }
        else {
          int v12 = v32 | 2;
        }
      }
      break;
    case 25:
    case 26:
    case 27:
      if ([(EDPivotTable *)self->mPivotTable compact])
      {
LABEL_18:
        int v12 = v10 | 0xC;
      }
      else if ([(EDPivotTable *)self->mPivotTable outline])
      {
        if (v52 == [v50 repeatedItemCounts]) {
          int v13 = 13;
        }
        else {
          int v13 = 12;
        }
LABEL_12:
        int v12 = v13 | v10;
      }
      else if ([(EDPivotTable *)self->mPivotTable compact])
      {
        int v12 = v10;
      }
      else
      {
        int v12 = v10;
        if (![(EDPivotTable *)self->mPivotTable outline])
        {
          if (v48 == mFirstDataRow)
          {
            int v12 = v10 | 7;
            v39 = v49;
          }
          else
          {
            v39 = v49;
            v40 = [v49 objectAtIndex:v45 - 1];
            int v12 = v10 | 3;
            if ([v40 type] != 4 && v52 >= (int)objc_msgSend(v40, "repeatedItemCounts")) {
              int v12 = v10 | 7;
            }
          }
          if (*(_DWORD *)((char *)&self->super.super.super.isa + v43) == a4)
          {
            v12 |= 8u;
          }
          else
          {
            v41 = [v39 objectAtIndex:v45 + 1];
            if ([v41 type] != 4 && v52 >= (int)objc_msgSend(v41, "repeatedItemCounts")) {
              v12 |= 8u;
            }
          }
        }
      }
      break;
    case 28:
    case 29:
      int v27 = self->super.mFirstRow;
      if (v27 + ~LODWORD(self->mPageFieldsCount) == a4) {
        int v28 = 7;
      }
      else {
        int v28 = 3;
      }
      BOOL v29 = v27 - 2 == a4;
      int v30 = v47;
      if (!v29) {
        int v30 = v10;
      }
      int v12 = v28 | v30;
      break;
    default:
      break;
  }

  return v12;
}

- (void)clearCache
{
  mPivotTable = self->mPivotTable;
  self->mPivotTable = 0;

  self->mFirstHeaderRow = 0;
  self->int mFirstDataRow = 0;
  self->int mFirstDataColumn = 0;
  self->mRowFieldsCount = 0;
  self->mColumnFieldsCount = 0;
  self->unint64_t mPageFieldsCount = 0;
  v4.receiver = self;
  v4.super_class = (Class)EPPivotTableStyleFlattener;
  [(EPStyleFlattener *)&v4 clearCache];
}

- (void)addColumnSubheadingLevel:(unsigned int)a3 to:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  unsigned int v6 = [(EPPivotTableStyleFlattener *)self constrainLevel:v4];
  if (v6 == 2)
  {
    int v7 = [NSNumber numberWithInt:24];
    [v8 addObject:v7];
  }
  else if (v6 == 1)
  {
    int v7 = [NSNumber numberWithInt:23];
    [v8 addObject:v7];
  }
  else
  {
    if (v6) {
      goto LABEL_8;
    }
    int v7 = [NSNumber numberWithInt:22];
    [v8 addObject:v7];
  }

LABEL_8:
}

- (unsigned)constrainLevel:(unsigned int)a3
{
  if (a3 >= 3) {
    return 2 - (a3 & 1);
  }
  else {
    return a3;
  }
}

- (void)addRowSubheadingLevel:(unsigned int)a3 to:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  unsigned int v6 = [(EPPivotTableStyleFlattener *)self constrainLevel:v4];
  if (v6 == 2)
  {
    int v7 = [NSNumber numberWithInt:27];
    [v8 addObject:v7];
  }
  else if (v6 == 1)
  {
    int v7 = [NSNumber numberWithInt:26];
    [v8 addObject:v7];
  }
  else
  {
    if (v6) {
      goto LABEL_8;
    }
    int v7 = [NSNumber numberWithInt:25];
    [v8 addObject:v7];
  }

LABEL_8:
}

- (id)newExtractedRowStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t mFirstRow = self->super.mFirstRow;
  BOOL v12 = [(EDPivotTable *)self->mPivotTable showColumnHeaders];
  int64_t v13 = a5 - mFirstRow;
  BOOL v14 = (int)v13 >= 0 && v12;
  if (v14 && self->mFirstDataRow > v13)
  {
    int v15 = [NSNumber numberWithInt:2];
    [v10 addObject:v15];
LABEL_13:

    goto LABEL_14;
  }
  if ([(EDPivotTable *)self->mPivotTable showRowStripes] && self->mFirstDataRow <= v13)
  {
    if ([(EPPivotTableStyleFlattener *)self stripeOffset:v13 row:1] < (signed int)self->super.mFirstRowStripeSize) {
      uint64_t v16 = 6;
    }
    else {
      uint64_t v16 = 7;
    }
    int v15 = [NSNumber numberWithInt:v16];
    [v10 addObject:v15];
    goto LABEL_13;
  }
LABEL_14:
  id v17 = [(EPStyleFlattener *)self newExtractedKeys:v10 from:v8 parent:v9];

  return v17;
}

- (id)newExtractedCellStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5 column:(int)a6
{
  id v43 = a3;
  id v42 = a4;
  id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
  int mFirstRow = self->super.mFirstRow;
  int mFirstColumn = self->super.mFirstColumn;
  int mFirstDataRow = self->mFirstDataRow;
  int mFirstDataColumn = self->mFirstDataColumn;
  BOOL v11 = [(EDPivotTable *)self->mPivotTable showRowHeaders];
  BOOL v39 = [(EDPivotTable *)self->mPivotTable showColumnHeaders];
  int v44 = a5 - mFirstRow;
  int v40 = a6 - mFirstColumn;
  int v48 = a6 - mFirstColumn;
  BOOL v12 = a5 - mFirstRow >= 0 && v11;
  if (v12 && self->mFirstDataColumn > v40)
  {
    int64_t v13 = [NSNumber numberWithInt:4];
    [v47 addObject:v13];
  }
  BOOL v14 = a5 == mFirstRow && v11;
  if (v14 && self->mFirstDataColumn > v40)
  {
    int v15 = [NSNumber numberWithInt:10];
    [v47 addObject:v15];
  }
  if ([(EDPivotTable *)self->mPivotTable showColumnStripes]
    && self->mFirstDataColumn <= v40
    && self->mFirstDataRow <= v44)
  {
    if ([(EPPivotTableStyleFlattener *)self stripeOffset:v40 row:0] < (signed int)self->super.mFirstColumnStripeSize) {
      uint64_t v16 = 8;
    }
    else {
      uint64_t v16 = 9;
    }
    id v17 = [NSNumber numberWithInt:v16];
    [v47 addObject:v17];
  }
  int v18 = [(EDPivotTable *)self->mPivotTable rowItems];
  int v19 = v18;
  uint64_t v20 = (v44 - mFirstDataRow);
  if ((v20 & 0x80000000) == 0 && (int)v20 < (int)[v18 count])
  {
    int v21 = [v19 objectAtIndex:v20];
    uint64_t v22 = [v21 repeatedItemCounts];
    int v23 = [v21 type];
    int v24 = v23;
    if (v23 == 1)
    {
      int v25 = [NSNumber numberWithInt:21];
      [v47 addObject:v25];
    }
    else
    {
      if (v23 != 6) {
        goto LABEL_27;
      }
      int v25 = [NSNumber numberWithInt:3];
      [v47 addObject:v25];
    }

LABEL_27:
    if ([(EDPivotTable *)self->mPivotTable compact])
    {
      BOOL v26 = v24 == 4 && v11;
      if (!v26 || self->mRowFieldsCount <= (v22 + 1)) {
        goto LABEL_54;
      }
    }
    else
    {
      if (![(EDPivotTable *)self->mPivotTable outline])
      {
        if (![(EDPivotTable *)self->mPivotTable compact]
          && ![(EDPivotTable *)self->mPivotTable outline])
        {
          if (v11 && v48 + 1 < SLODWORD(self->mRowFieldsCount) && (v24 == 4 || v40 < (int)v22)) {
            [(EPPivotTableStyleFlattener *)self addRowSubheadingLevel:v40 to:v47];
          }
          if (v24 == 5 && v40 >= (int)v22) {
            [(EPPivotTableStyleFlattener *)self addSubtotalRowLevel:v22 to:v47];
          }
        }
        goto LABEL_54;
      }
      BOOL v27 = v24 == 4 && v11;
      if (!v27 || (self->mRowFieldsCount > (v22 + 1) ? (BOOL v28 = v48 < (int)v22) : (BOOL v28 = 1), v28))
      {
LABEL_54:

        goto LABEL_55;
      }
    }
    [(EPPivotTableStyleFlattener *)self addRowSubheadingLevel:v22 to:v47];
    goto LABEL_54;
  }
LABEL_55:
  BOOL v29 = [(EDPivotTable *)self->mPivotTable columnItems];
  int v30 = v29;
  if (v44 < 1)
  {
    if (v44 < 0)
    {
      if (a6 == mFirstColumn) {
        [NSNumber numberWithInt:28];
      }
      else {
      int v32 = [NSNumber numberWithInt:29];
      }
      [v47 addObject:v32];
      goto LABEL_77;
    }
  }
  else
  {
    int v31 = v40 - mFirstDataColumn;
    if (v40 - mFirstDataColumn < (int)[v29 count])
    {
      int v32 = [v30 objectAtIndex:v31];
      uint64_t v33 = [v32 repeatedItemCounts];
      int v34 = [v32 type];
      if (v34 == 6)
      {
        int v35 = [NSNumber numberWithInt:5];
        [v47 addObject:v35];
      }
      if (v39 && v44 <= SLODWORD(self->mColumnFieldsCount) && (v31 & 0x80000000) == 0 && v34 != 6)
      {
        uint64_t v36 = (v44 - 1);
        if (v34 == 4)
        {
          [(EPPivotTableStyleFlattener *)self addColumnSubheadingLevel:v36 to:v47];
LABEL_77:

          goto LABEL_78;
        }
        if (v44 <= (int)v33) {
          uint64_t v36 = v36;
        }
        else {
          uint64_t v36 = v33;
        }
        [(EPPivotTableStyleFlattener *)self addColumnSubheadingLevel:v36 to:v47];
      }
      if (v44 > (int)v33 && v34 == 5) {
        [(EPPivotTableStyleFlattener *)self addSubtotalColumnLevel:v33 to:v47];
      }
      goto LABEL_77;
    }
  }
LABEL_78:
  id v37 = [(EPStyleFlattener *)self newExtractedKeys:v47 from:v43 parent:v42];

  return v37;
}

- (void).cxx_destruct
{
}

- (int)stripeOffset:(int)a3 row:(BOOL)a4
{
  uint64_t v4 = &OBJC_IVAR___EPPivotTableStyleFlattener_mFirstDataColumn;
  if (a4) {
    uint64_t v4 = &OBJC_IVAR___EPPivotTableStyleFlattener_mFirstDataRow;
  }
  v5 = &OBJC_IVAR___EPStyleFlattener_mFirstColumnStripeSize;
  if (a4) {
    v5 = &OBJC_IVAR___EPStyleFlattener_mFirstRowStripeSize;
  }
  unsigned int v6 = &OBJC_IVAR___EPStyleFlattener_mSecondRowStripeSize;
  int v7 = *(_DWORD *)((char *)&self->super.super.super.isa + *v4);
  if (!a4) {
    unsigned int v6 = &OBJC_IVAR___EPStyleFlattener_mSecondColumnStripeSize;
  }
  return (a3 - v7)
       % (*(_DWORD *)((char *)&self->super.super.super.isa + *v6)
                      + *(_DWORD *)((char *)&self->super.super.super.isa + *v5));
}

- (void)addSubtotalRowLevel:(unsigned int)a3 to:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  unsigned int v6 = [(EPPivotTableStyleFlattener *)self constrainLevel:v4];
  if (v6 == 2)
  {
    int v7 = [NSNumber numberWithInt:20];
    [v8 addObject:v7];
  }
  else if (v6 == 1)
  {
    int v7 = [NSNumber numberWithInt:19];
    [v8 addObject:v7];
  }
  else
  {
    if (v6) {
      goto LABEL_8;
    }
    int v7 = [NSNumber numberWithInt:18];
    [v8 addObject:v7];
  }

LABEL_8:
}

- (void)addSubtotalColumnLevel:(unsigned int)a3 to:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  unsigned int v6 = [(EPPivotTableStyleFlattener *)self constrainLevel:v4];
  if (v6 == 2)
  {
    int v7 = [NSNumber numberWithInt:17];
    [v8 addObject:v7];
  }
  else if (v6 == 1)
  {
    int v7 = [NSNumber numberWithInt:16];
    [v8 addObject:v7];
  }
  else
  {
    if (v6) {
      goto LABEL_8;
    }
    int v7 = [NSNumber numberWithInt:15];
    [v8 addObject:v7];
  }

LABEL_8:
}

@end