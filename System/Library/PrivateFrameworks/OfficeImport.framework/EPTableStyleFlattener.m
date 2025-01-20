@interface EPTableStyleFlattener
- (BOOL)isObjectSupported:(id)a3;
- (id)collectionFromWorksheet:(id)a3;
- (id)keysInTheOrderTheyShouldBeApplied;
- (id)newExtractedCellStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5 column:(int)a6;
- (id)newExtractedGlobalStyleElements:(id)a3;
- (id)newExtractedRowStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5;
- (id)styleFromObject:(id)a3;
- (int)borderFlagsForStyleType:(int)a3 row:(int)a4 column:(int)a5;
- (int)stripeOffset:(int)a3 row:(BOOL)a4;
- (void)cacheSizes:(id)a3 inObject:(id)a4;
- (void)clearCache;
@end

@implementation EPTableStyleFlattener

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
  v15 = [NSNumber numberWithInt:14];
  id v3 = [NSNumber numberWithInt:10];
  v18 = [NSNumber numberWithInt:11];
  v17 = [NSNumber numberWithInt:12];
  v14 = [NSNumber numberWithInt:13];
  v16 = [NSNumber numberWithInt:2];
  v4 = [NSNumber numberWithInt:3];
  v13 = [NSNumber numberWithInt:4];
  v12 = [NSNumber numberWithInt:5];
  v11 = [NSNumber numberWithInt:7];
  v5 = [NSNumber numberWithInt:6];
  v6 = [NSNumber numberWithInt:9];
  v7 = [NSNumber numberWithInt:8];
  v8 = [NSNumber numberWithInt:1];
  objc_msgSend(v2, "arrayWithObjects:", v15, v3, v18, v17, v14, v16, v4, v13, v12, v11, v5, v6, v7, v8, 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)collectionFromWorksheet:(id)a3
{
  id v3 = [a3 tables];
  return v3;
}

- (id)styleFromObject:(id)a3
{
  id v4 = a3;
  v5 = [v4 style];
  v6 = [v4 tableBorderDxf];
  if (v6)
  {
    if (v5)
    {
      uint64_t v7 = [v5 copy];

      v5 = (void *)v7;
    }
    else
    {
      v5 = +[EDTableStyle tableStyle];
    }
    v8 = [v5 tableStyleElements];
    v9 = [(EPStyleFlattener *)self wrapDifferentialStyleInATableStyleElement:v6 type:14];
    [v8 addObject:v9];
  }
  return v5;
}

- (void)cacheSizes:(id)a3 inObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->mTable, a4);
  v8 = [(EDTable *)self->mTable tableRange];
  v10.receiver = self;
  v10.super_class = (Class)EPTableStyleFlattener;
  [(EPStyleFlattener *)&v10 cacheRange:v8];

  self->mHeaderRowCount = [(EDTable *)self->mTable headerRowCount];
  self->mTotalsRowCount = [(EDTable *)self->mTable totalsRowCount];
  v9.receiver = self;
  v9.super_class = (Class)EPTableStyleFlattener;
  [(EPStyleFlattener *)&v9 cacheSizes:v6 inObject:v7];
}

- (int)borderFlagsForStyleType:(int)a3 row:(int)a4 column:(int)a5
{
  int mFirstColumn = self->super.mFirstColumn;
  int mLastColumn = self->super.mLastColumn;
  int v7 = (mFirstColumn == a5) | 2;
  if (mLastColumn != a5) {
    int v7 = mFirstColumn == a5;
  }
  int mFirstRow = self->super.mFirstRow;
  int mLastRow = self->super.mLastRow;
  if (mFirstRow == a4) {
    int v10 = v7 | 4;
  }
  else {
    int v10 = v7;
  }
  if (mLastRow == a4) {
    int v11 = v10 | 8;
  }
  else {
    int v11 = v10;
  }
  switch(a3)
  {
    case 1:
    case 14:
      return v11;
    case 2:
      if (a4 - mFirstRow + 1 == LODWORD(self->mHeaderRowCount)) {
        int v11 = v10 | 8;
      }
      break;
    case 3:
      if (mLastRow - a4 + 1 == LODWORD(self->mTotalsRowCount)) {
        v11 |= 4u;
      }
      break;
    case 4:
      if (mFirstColumn == a5) {
        v11 |= 2u;
      }
      break;
    case 5:
      v11 |= mLastColumn == a5;
      break;
    case 6:
    case 7:
      int v14 = [(EPTableStyleFlattener *)self stripeOffset:*(void *)&a4 row:1];
      signed int mFirstRowStripeSize = self->super.mFirstRowStripeSize;
      int v16 = v14 - mFirstRowStripeSize;
      if (v14 >= mFirstRowStripeSize)
      {
        signed int mFirstRowStripeSize = self->super.mSecondRowStripeSize;
        int v14 = v16;
      }
      int v17 = v11 | 4;
      if (v14) {
        int v17 = v11;
      }
      if (v14 + 1 == mFirstRowStripeSize || self->super.mLastRow - a4 == LODWORD(self->mTotalsRowCount)) {
        int v11 = v17 | 8;
      }
      else {
        int v11 = v17;
      }
      break;
    case 8:
    case 9:
      int v19 = [(EPTableStyleFlattener *)self stripeOffset:*(void *)&a5 row:0];
      signed int mFirstColumnStripeSize = self->super.mFirstColumnStripeSize;
      int v21 = v19 - mFirstColumnStripeSize;
      if (v19 >= mFirstColumnStripeSize)
      {
        signed int mFirstColumnStripeSize = self->super.mSecondColumnStripeSize;
        int v19 = v21;
      }
      if (v19 + 1 == mFirstColumnStripeSize) {
        v11 |= (v19 == 0) | 2;
      }
      else {
        v11 |= v19 == 0;
      }
      break;
    default:
      int v11 = 15;
      break;
  }
  return v11;
}

- (int)stripeOffset:(int)a3 row:(BOOL)a4
{
  if (a4)
  {
    int mFirstColumn = self->super.mFirstRow + LODWORD(self->mHeaderRowCount);
    v5 = &OBJC_IVAR___EPStyleFlattener_mSecondRowStripeSize;
    id v6 = &OBJC_IVAR___EPStyleFlattener_mFirstRowStripeSize;
  }
  else
  {
    int mFirstColumn = self->super.mFirstColumn;
    v5 = &OBJC_IVAR___EPStyleFlattener_mSecondColumnStripeSize;
    id v6 = &OBJC_IVAR___EPStyleFlattener_mFirstColumnStripeSize;
  }
  return (a3 - mFirstColumn)
       % (*(_DWORD *)((char *)&self->super.super.super.isa + *v5)
                      + *(_DWORD *)((char *)&self->super.super.super.isa + *v6));
}

- (void)clearCache
{
  mTable = self->mTable;
  self->mTable = 0;

  self->mHeaderRowCount = 0;
  self->mTotalsRowCount = 0;
  self->super.signed int mFirstRowStripeSize = 0;
  self->super.mSecondRowStripeSize = 0;
  self->super.signed int mFirstColumnStripeSize = 0;
  self->super.mSecondColumnStripeSize = 0;
  v4.receiver = self;
  v4.super_class = (Class)EPTableStyleFlattener;
  [(EPStyleFlattener *)&v4 clearCache];
}

- (id)newExtractedGlobalStyleElements:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFF8C0]);
  id v6 = [NSNumber numberWithInt:1];
  int v7 = [NSNumber numberWithInt:14];
  v8 = objc_msgSend(v5, "initWithObjects:", v6, v7, 0);

  id v9 = [(EPStyleFlattener *)self newExtractedKeys:v8 from:v4 parent:0];
  return v9;
}

- (id)newExtractedRowStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ((int)v5 - self->super.mFirstRow >= SLODWORD(self->mHeaderRowCount))
  {
    if (self->super.mLastRow - (int)v5 >= SLODWORD(self->mTotalsRowCount))
    {
      if ([(EDTable *)self->mTable showRowStripes])
      {
        signed int v12 = [(EPTableStyleFlattener *)self stripeOffset:v5 row:1];
        id v13 = objc_alloc(NSNumber);
        if (v12 < (signed int)self->super.mFirstRowStripeSize) {
          uint64_t v14 = 6;
        }
        else {
          uint64_t v14 = 7;
        }
        int v11 = (void *)[v13 initWithInt:v14];
        [v10 addObject:v11];
      }
      else
      {
        int v11 = 0;
      }
    }
    else
    {
      int v11 = (void *)[objc_alloc(NSNumber) initWithInt:3];
      [v10 addObject:v11];
    }
  }
  else
  {
    int v11 = (void *)[objc_alloc(NSNumber) initWithInt:2];
    [v10 addObject:v11];
  }
  id v15 = [(EPStyleFlattener *)self newExtractedKeys:v10 from:v8 parent:v9];

  return v15;
}

- (id)newExtractedCellStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5 column:(int)a6
{
  id v29 = a3;
  id v28 = a4;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v10 = [(EDTable *)self->mTable showFirstColumn];
  BOOL v11 = [(EDTable *)self->mTable showLastColumn];
  BOOL v12 = v11;
  if (!self->mHeaderRowCount)
  {
    if (!self->mTotalsRowCount || self->super.mLastRow != a5)
    {
LABEL_11:
      int v17 = 0;
      BOOL v15 = 0;
      uint64_t v18 = 0;
      if (v10)
      {
LABEL_12:
        int v19 = (void *)v18;
        goto LABEL_19;
      }
LABEL_26:
      int v19 = (void *)v18;
      goto LABEL_27;
    }
    goto LABEL_8;
  }
  int mFirstRow = self->super.mFirstRow;
  if (!self->mTotalsRowCount)
  {
    int v17 = 0;
    if (mFirstRow != a5)
    {
      uint64_t v18 = 0;
      BOOL v15 = 0;
      if (v10) {
        goto LABEL_12;
      }
      goto LABEL_26;
    }
    BOOL v15 = 0;
    goto LABEL_15;
  }
  int mLastRow = self->super.mLastRow;
  BOOL v15 = mLastRow == a5;
  if (mFirstRow == a5)
  {
LABEL_15:
    if (!v10 || self->super.mFirstColumn != a6)
    {
      if (v11 && self->super.mLastColumn == a6)
      {
        uint64_t v18 = [objc_alloc(NSNumber) initWithInt:11];
        [v9 addObject:v18];
      }
      else
      {
        uint64_t v18 = 0;
      }
      int v17 = 1;
      if (v10) {
        goto LABEL_12;
      }
      goto LABEL_26;
    }
    uint64_t v16 = [objc_alloc(NSNumber) initWithInt:10];
    [v9 addObject:v16];
    int v17 = 1;
    goto LABEL_18;
  }
  if (mLastRow != a5) {
    goto LABEL_11;
  }
LABEL_8:
  if (!v10 || self->super.mFirstColumn != a6)
  {
    if (v11 && self->super.mLastColumn == a6)
    {
      uint64_t v18 = [objc_alloc(NSNumber) initWithInt:13];
      [v9 addObject:v18];
      int v17 = 0;
    }
    else
    {
      int v17 = 0;
      uint64_t v18 = 0;
    }
    BOOL v15 = 1;
    if (v10) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
  uint64_t v16 = [objc_alloc(NSNumber) initWithInt:12];
  [v9 addObject:v16];
  int v17 = 0;
  BOOL v15 = 1;
LABEL_18:
  int v19 = (void *)v16;
LABEL_19:
  if (self->super.mFirstColumn == a6)
  {
    uint64_t v20 = [objc_alloc(NSNumber) initWithInt:4];

    int v19 = (void *)v20;
    [v9 addObject:v20];
    goto LABEL_30;
  }
LABEL_27:
  if (v12 && self->super.mLastColumn == a6)
  {
    uint64_t v21 = [objc_alloc(NSNumber) initWithInt:5];

    int v19 = (void *)v21;
    [v9 addObject:v21];
  }
LABEL_30:
  if (((v17 | v15 | ![(EDTable *)self->mTable showColumnStripes]) & 1) == 0)
  {
    signed int v22 = [(EPTableStyleFlattener *)self stripeOffset:a6 row:0];
    id v23 = objc_alloc(NSNumber);
    if (v22 < (signed int)self->super.mFirstColumnStripeSize) {
      uint64_t v24 = 8;
    }
    else {
      uint64_t v24 = 9;
    }
    uint64_t v25 = [v23 initWithInt:v24];

    int v19 = (void *)v25;
    [v9 addObject:v25];
  }
  id v26 = [(EPStyleFlattener *)self newExtractedKeys:v9 from:v29 parent:v28];

  return v26;
}

- (void).cxx_destruct
{
}

@end