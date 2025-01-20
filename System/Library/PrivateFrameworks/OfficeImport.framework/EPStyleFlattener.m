@interface EPStyleFlattener
- (EDCellHeader)cellWithSetupStyleAtRowNumber:(int)a3 columnNumber:(int)a4;
- (id)collectionFromWorksheet:(id)a3;
- (id)copyFlattenBorder:(int)a3 borders:(id)a4 differentialBorders:(id)a5 flag:(BOOL)a6 precedence:(unint64_t)a7 row:(int)a8 column:(int)a9;
- (id)copyFlattenBorders:(id)a3 differentialBorders:(id)a4 borderFlags:(int)a5 precedence:(unint64_t)a6 row:(int)a7 column:(int)a8;
- (id)copyFlattenFont:(id)a3 differentialFont:(id)a4;
- (id)keysInTheOrderTheyShouldBeApplied;
- (id)newExtractedCellStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5 column:(int)a6;
- (id)newExtractedGlobalStyleElements:(id)a3;
- (id)newExtractedKeys:(id)a3 from:(id)a4 parent:(id)a5;
- (id)newExtractedRowStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5;
- (id)styleFromObject:(id)a3;
- (id)wrapDifferentialStyleInATableStyleElement:(id)a3 type:(int)a4;
- (int)borderFlagsForStyleType:(int)a3 row:(int)a4 column:(int)a5;
- (unint64_t)flattenFillIndex:(unint64_t)a3 differentialFill:(id)a4;
- (void)applyDifferentialStyle:(id)a3 borderFlags:(int)a4 precedence:(unint64_t)a5 toCell:(EDCellHeader *)a6 row:(int)a7 column:(int)a8;
- (void)applyProcessorToObject:(id)a3 sheet:(id)a4;
- (void)applyStyleElements:(id)a3 toCell:(EDCellHeader *)a4 row:(int)a5 column:(int)a6;
- (void)cacheRange:(id)a3;
- (void)cacheSizes:(id)a3 inObject:(id)a4;
- (void)clearCache;
- (void)processObject:(id)a3;
@end

@implementation EPStyleFlattener

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  id v14 = a3;
  p_mWorksheet = &self->mWorksheet;
  objc_storeStrong((id *)&self->mWorksheet, a3);
  if (!self->mKeys)
  {
    v7 = [(EPStyleFlattener *)self keysInTheOrderTheyShouldBeApplied];
    mKeys = self->mKeys;
    self->mKeys = v7;
  }
  v9 = [(EPStyleFlattener *)self collectionFromWorksheet:*p_mWorksheet];
  uint64_t v10 = [v9 count];
  if (v10)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      v12 = [v9 objectAtIndex:i];
      [(EPStyleFlattener *)self processObject:v12];
    }
  }
  v13 = *p_mWorksheet;
  *p_mWorksheet = 0;
}

- (void)processObject:(id)a3
{
  id v31 = a3;
  v4 = -[EPStyleFlattener styleFromObject:](self, "styleFromObject:");
  v5 = [v4 tableStyleElements];

  if (v5 && [v5 count])
  {
    v6 = [(EDWorksheet *)self->mWorksheet rowBlocks];
    mRowBlocks = self->mRowBlocks;
    self->mRowBlocks = v6;

    v8 = [(EDWorksheet *)self->mWorksheet columnInfos];
    mColumnInfos = self->mColumnInfos;
    self->mColumnInfos = v8;

    uint64_t v10 = [MEMORY[0x263EFF980] array];
    mRanges = self->mRanges;
    self->mRanges = v10;

    [(EPStyleFlattener *)self cacheSizes:v5 inObject:v31];
    id v35 = [(EPStyleFlattener *)self newExtractedGlobalStyleElements:v5];
    uint64_t v12 = [(NSMutableArray *)self->mRanges count];
    if (v12)
    {
      uint64_t v13 = 0;
      uint64_t v32 = v12;
      do
      {
        uint64_t v33 = v13;
        v34 = -[NSMutableArray objectAtIndex:](self->mRanges, "objectAtIndex:");
        uint64_t v14 = [v34 firstRow];
        signed int v15 = [v34 lastRow];
        uint64_t v16 = [v34 firstColumn];
        signed int v36 = [v34 lastColumn];
        BOOL v17 = (int)v14 <= 499999 && (int)v16 <= 499999;
        if (v17)
        {
          if (v15 > 500000) {
            signed int v15 = [(EDRowBlocks *)self->mRowBlocks maxPopulatedRow] + 1;
          }
          if (v36 > 500000) {
            signed int v36 = [(EDRowBlocks *)self->mRowBlocks maxPopulatedColumn] + 1;
          }
          v18 = [(EDRowBlocks *)self->mRowBlocks rowBlockForRowNumber:v14 currentRowBlock:0 createIfNil:1];
          mCurrentRowBlock = self->mCurrentRowBlock;
          self->mCurrentRowBlock = v18;

          if ((int)v14 <= v15)
          {
            if (v36 >= 500000) {
              int v20 = 500000;
            }
            else {
              int v20 = v36;
            }
            if (v15 >= 500000) {
              int v21 = 500000;
            }
            else {
              int v21 = v15;
            }
            do
            {
              id v22 = [(EPStyleFlattener *)self newExtractedRowStyleElements:v5 parentScope:v35 row:v14];
              v23 = [(EDRowBlocks *)self->mRowBlocks rowBlockForRowNumber:v14 currentRowBlock:self->mCurrentRowBlock createIfNil:1];
              v24 = self->mCurrentRowBlock;
              self->mCurrentRowBlock = v23;

              uint64_t v25 = v16;
              if ((int)v16 <= v36)
              {
                do
                {
                  id v26 = [(EPStyleFlattener *)self newExtractedCellStyleElements:v5 parentScope:v22 row:v14 column:v25];
                  if ([v26 count])
                  {
                    v27 = [(EPStyleFlattener *)self cellWithSetupStyleAtRowNumber:v14 columnNumber:v25];
                    if (v27) {
                      [(EPStyleFlattener *)self applyStyleElements:v26 toCell:v27 row:v14 column:v25];
                    }
                  }

                  BOOL v17 = (int)v25 < v20;
                  uint64_t v25 = (v25 + 1);
                }
                while (v17);
              }

              BOOL v17 = (int)v14 < v21;
              uint64_t v14 = (v14 + 1);
            }
            while (v17);
          }
        }

        uint64_t v13 = v33 + 1;
      }
      while (v33 + 1 != v32);
    }
    [(EPStyleFlattener *)self clearCache];
    v28 = self->mRanges;
    self->mRanges = 0;

    v29 = self->mColumnInfos;
    self->mColumnInfos = 0;

    [(EDRowBlocks *)self->mRowBlocks unlock];
    v30 = self->mRowBlocks;
    self->mRowBlocks = 0;
  }
}

- (void)cacheRange:(id)a3
{
  id v4 = a3;
  if (![(NSMutableArray *)self->mRanges count])
  {
    self->mFirstRow = [v4 firstRow];
    self->mLastRow = [v4 lastRow];
    self->mFirstColumn = [v4 firstColumn];
    self->mLastColumn = [v4 lastColumn];
  }
  [(NSMutableArray *)self->mRanges addObject:v4];
}

- (void)cacheSizes:(id)a3 inObject:(id)a4
{
  id v5 = a3;
  self->mFirstRowStripeSize = 1;
  self->mSecondRowStripeSize = 1;
  id v11 = v5;
  v6 = [v5 objectWithKey:6];
  v7 = v6;
  if (v6 && [v6 bandSize] != -1) {
    self->mFirstRowStripeSize = [v7 bandSize];
  }
  v8 = [v11 objectWithKey:7];

  if (v8 && [v8 bandSize] != -1) {
    self->mSecondRowStripeSize = [v8 bandSize];
  }
  self->mFirstColumnStripeSize = 1;
  self->mSecondColumnStripeSize = 1;
  v9 = [v11 objectWithKey:8];

  if (v9 && [v9 bandSize] != -1) {
    self->mFirstColumnStripeSize = [v9 bandSize];
  }
  uint64_t v10 = [v11 objectWithKey:9];

  if (v10 && [v10 bandSize] != -1) {
    self->mSecondColumnStripeSize = [v10 bandSize];
  }
}

- (EDCellHeader)cellWithSetupStyleAtRowNumber:(int)a3 columnNumber:(int)a4
{
  if (a3 > 500000 || a4 > 500000) {
    return 0;
  }
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  v9 = -[EDRowBlocks rowBlockForRowNumber:currentRowBlock:createIfNil:](self->mRowBlocks, "rowBlockForRowNumber:currentRowBlock:createIfNil:");
  uint64_t v10 = (EDRowInfo *)[v9 rowInfoWithRowNumber:v7 createIfNil:1];
  signed int v15 = v10;
  if (v10)
  {
    id v5 = (EDCellHeader *)[v9 cellWithColumnNumber:v6 rowInfo:v10];
    if (!v5)
    {
      id v5 = (EDCellHeader *)[v9 addCellWithColumnNumber:v6 type:0 isFormulaCell:0 rowInfo:&v15 rowBlocks:self->mRowBlocks];
      if (v5)
      {
        uint64_t v11 = styleIndexForEDRowInfo(v15);
        LODWORD(v12) = v11;
        if (v11 != -1
          || ([(EDColumnInfoCollection *)self->mColumnInfos columnInfoForColumnNumber:v6],
              uint64_t v13 = objc_claimAutoreleasedReturnValue(),
              uint64_t v12 = [v13 styleIndex],
              v13,
              v12 != -1))
        {
          setStyleIndexForEDCell((uint64_t)v5, v12);
        }
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)applyStyleElements:(id)a3 toCell:(EDCellHeader *)a4 row:(int)a5 column:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  v18 = a4;
  NSUInteger v11 = [(NSArray *)self->mKeys count];
  if (v11)
  {
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = [(NSArray *)self->mKeys objectAtIndex:v12];
      uint64_t v14 = [v13 intValue];

      signed int v15 = [v10 objectWithKey:v14];
      if (v15)
      {
        uint64_t v16 = [(EPStyleFlattener *)self borderFlagsForStyleType:v14 row:v7 column:v6];
        BOOL v17 = [v15 differentialStyle];
        [(EPStyleFlattener *)self applyDifferentialStyle:v17 borderFlags:v16 precedence:v12 toCell:&v18 row:v7 column:v6];
      }
      ++v12;
    }
    while (v11 != v12);
  }
}

- (void)applyDifferentialStyle:(id)a3 borderFlags:(int)a4 precedence:(unint64_t)a5 toCell:(EDCellHeader *)a6 row:(int)a7 column:(int)a8
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  uint64_t v13 = styleIndexForEDCell(*a6);
  unint64_t v40 = -1;
  uint64_t v14 = [v12 borders];

  if (v14) {
    goto LABEL_6;
  }
  mFlattenedStyleCache = self->mFlattenedStyleCache;
  if (!mFlattenedStyleCache)
  {
    uint64_t v16 = objc_alloc_init(ECIntToTwoIntKeyCache);
    BOOL v17 = self->mFlattenedStyleCache;
    self->mFlattenedStyleCache = v16;

    mFlattenedStyleCache = self->mFlattenedStyleCache;
  }
  if (![(ECIntToTwoIntKeyCache *)mFlattenedStyleCache integerIsPresentForKey1:v13 key2:v12 outValue:&v40])
  {
LABEL_6:
    v39 = v12;
    uint64_t v35 = v13;
    v18 = *a6;
    WeakRetained = (EDResources *)objc_loadWeakRetained((id *)&self->super.mResources);
    int v20 = styleForEDCell(v18, WeakRetained);

    int v21 = (EDStyle *)[v20 copy];
    if (!v21)
    {
      id v22 = [EDStyle alloc];
      id v23 = objc_loadWeakRetained((id *)&self->super.mResources);
      int v21 = [(EDStyle *)v22 initWithResources:v23];
    }
    v24 = [v20 borders];
    uint64_t v25 = [v39 borders];
    id v26 = [(EPStyleFlattener *)self copyFlattenBorders:v24 differentialBorders:v25 borderFlags:v10 precedence:a5 row:a7 column:a8];

    signed int v36 = v26;
    if (v26) {
      [(EDStyle *)v21 setBorders:v26];
    }
    uint64_t v27 = [v20 fillIndex];
    v28 = [v39 fill];
    unint64_t v29 = [(EPStyleFlattener *)self flattenFillIndex:v27 differentialFill:v28];

    if (v29 != -1) {
      [(EDStyle *)v21 setFillIndex:v29];
    }
    v30 = [v20 font];
    id v31 = [v39 font];
    id v32 = [(EPStyleFlattener *)self copyFlattenFont:v30 differentialFont:v31];

    if (v32) {
      [(EDStyle *)v21 setFont:v32];
    }
    uint64_t v33 = [(EPStyleFlattener *)self cellWithSetupStyleAtRowNumber:a7 columnNumber:a8];
    *a6 = v33;
    v34 = (EDResources *)objc_loadWeakRetained((id *)&self->super.mResources);
    setStyleForEDCell(v33, v21, v34);

    if (!v14)
    {
      unint64_t v40 = styleIndexForEDCell(*a6);
      [(ECIntToTwoIntKeyCache *)self->mFlattenedStyleCache setObject:v40 forKey1:v35 key2:v39];
    }

    id v12 = v39;
  }
  else
  {
    setStyleIndexForEDCell((uint64_t)*a6, v40);
  }
}

- (id)copyFlattenBorders:(id)a3 differentialBorders:(id)a4 borderFlags:(int)a5 precedence:(unint64_t)a6 row:(int)a7 column:(int)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = a4;
  if (v15)
  {
    LODWORD(v25) = a8;
    id v16 = [(EPStyleFlattener *)self copyFlattenBorder:0 borders:v14 differentialBorders:v15 flag:a5 & 1 precedence:a6 row:v9 column:v25];
    LODWORD(v26) = a8;
    id v17 = [(EPStyleFlattener *)self copyFlattenBorder:1 borders:v14 differentialBorders:v15 flag:(a5 >> 1) & 1 precedence:a6 row:v9 column:v26];
    LODWORD(v27) = a8;
    id v18 = [(EPStyleFlattener *)self copyFlattenBorder:2 borders:v14 differentialBorders:v15 flag:(a5 >> 2) & 1 precedence:a6 row:v9 column:v27];
    LODWORD(v28) = a8;
    id v19 = [(EPStyleFlattener *)self copyFlattenBorder:3 borders:v14 differentialBorders:v15 flag:(a5 >> 3) & 1 precedence:a6 row:v9 column:v28];
    LODWORD(v29) = a8;
    id v20 = [(EPStyleFlattener *)self copyFlattenBorder:4 borders:v14 differentialBorders:v15 flag:1 precedence:a6 row:v9 column:v29];
    int v21 = [EDBorders alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
    id v23 = [(EDBorders *)v21 initWithResources:WeakRetained];

    [(EDBorders *)v23 setLeftBorder:v16];
    [(EDBorders *)v23 setRightBorder:v17];
    [(EDBorders *)v23 setTopBorder:v18];
    [(EDBorders *)v23 setBottomBorder:v19];
    [(EDBorders *)v23 setDiagonalBorder:v20];
  }
  else
  {
    id v23 = (EDBorders *)v14;
  }

  return v23;
}

- (id)copyFlattenBorder:(int)a3 borders:(id)a4 differentialBorders:(id)a5 flag:(BOOL)a6 precedence:(unint64_t)a7 row:(int)a8 column:(int)a9
{
  uint64_t v9 = *(void *)&a8;
  unint64_t v32 = a7;
  BOOL v10 = a6;
  uint64_t v14 = a9;
  id v33 = a4;
  id v15 = a5;
  id v16 = 0;
  id v17 = 0;
  switch(a3)
  {
    case 0:
      uint64_t v14 = (a9 - 1);
      if (a9 >= 1) {
        goto LABEL_8;
      }
      id v16 = 0;
      id v17 = 0;
LABEL_9:
      objc_msgSend(v33, "leftBorder", v32);
      id v20 = (EPBorder *)objc_claimAutoreleasedReturnValue();
      int v21 = [v16 rightBorder];
      if (v10) {
        [v15 leftBorder];
      }
      else {
LABEL_19:
      }
        [v15 verticalBorder];
      goto LABEL_23;
    case 1:
      uint64_t v14 = (a9 + 1);
      goto LABEL_8;
    case 2:
      if ((int)v9 <= 0)
      {
        id v16 = 0;
        id v17 = 0;
LABEL_21:
        objc_msgSend(v33, "topBorder", v32);
        id v20 = (EPBorder *)objc_claimAutoreleasedReturnValue();
        int v21 = [v16 bottomBorder];
        if (v10) {
          [v15 topBorder];
        }
        else {
LABEL_24:
        }
          [v15 horizontalBorder];
      }
      else
      {
        uint64_t v9 = (v9 - 1);
LABEL_8:
        id v18 = -[EPStyleFlattener cellWithSetupStyleAtRowNumber:columnNumber:](self, "cellWithSetupStyleAtRowNumber:columnNumber:", v9, v14, v32);
        id WeakRetained = (EDResources *)objc_loadWeakRetained((id *)&self->super.mResources);
        id v17 = styleForEDCell(v18, WeakRetained);

        id v16 = [v17 borders];
        switch(a3)
        {
          case 0:
            goto LABEL_9;
          case 1:
            id v20 = [v33 rightBorder];
            int v21 = [v16 leftBorder];
            if (!v10) {
              goto LABEL_19;
            }
            [v15 rightBorder];
            break;
          case 2:
            goto LABEL_21;
          case 3:
            id v20 = [v33 bottomBorder];
            int v21 = [v16 topBorder];
            if (!v10) {
              goto LABEL_24;
            }
            [v15 bottomBorder];
            break;
          case 4:
            goto LABEL_11;
          default:
            id v22 = 0;
            goto LABEL_37;
        }
      }
      uint64_t v24 = LABEL_23:;
      id v23 = (void *)v24;
      uint64_t v25 = v20;
      id v22 = v21;
      if (v24)
      {
        if (v21 && [(EDBorder *)v21 type])
        {
          if (!v20 || ![(EDBorder *)v20 type])
          {
            id v20 = v21;

            id v22 = v20;
          }
        }
        else if (!v20)
        {
          goto LABEL_41;
        }
LABEL_39:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([(EPBorder *)v20 precedence] > v32)
          {
LABEL_41:
            uint64_t v29 = [EPBorder alloc];
            id v30 = objc_loadWeakRetained((id *)&self->super.mResources);
            uint64_t v26 = [(EPBorder *)v29 initWithBorder:v23 precedence:v32 resources:v30];

            goto LABEL_44;
          }
        }
        else if (![(EDBorder *)v20 type])
        {
          goto LABEL_41;
        }
        id v20 = v20;

        uint64_t v26 = v20;
      }
      else
      {
LABEL_35:
        if (v20)
        {
          id v20 = v20;
          uint64_t v26 = v20;
        }
        else
        {
LABEL_37:
          uint64_t v27 = [EDBorder alloc];
          id v28 = objc_loadWeakRetained((id *)&self->super.mResources);
          uint64_t v26 = [(EDBorder *)v27 initWithResources:v28];

          id v20 = 0;
        }
      }
LABEL_44:

      return v26;
    case 3:
      uint64_t v9 = (v9 + 1);
      goto LABEL_8;
    case 4:
LABEL_11:
      objc_msgSend(v33, "diagonalBorder", v32);
      id v20 = (EPBorder *)objc_claimAutoreleasedReturnValue();
      [v15 diagonalBorder];
      v23 = id v22 = 0;
      if (!v23) {
        goto LABEL_35;
      }
      if (!v20) {
        goto LABEL_41;
      }
      goto LABEL_39;
    default:
      goto LABEL_8;
  }
}

- (id)copyFlattenFont:(id)a3 differentialFont:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      id v8 = (id)[v6 copy];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
      BOOL v10 = [WeakRetained styles];
      NSUInteger v11 = [v10 defaultWorkbookStyle];
      id v12 = [v11 font];
      id v8 = (id)[v12 copy];
    }
    uint64_t v13 = [v7 color];
    uint64_t v14 = [v6 colorReference];
    id v15 = v14;
    if (v13 && (!v14 || [v14 themeIndex] == 1)) {
      [v8 setColor:v13];
    }
    if ([v7 isBoldOverridden] && objc_msgSend(v7, "isBold")) {
      [v8 setBold:1];
    }
    if ([v7 isItalicOverridden] && objc_msgSend(v7, "isItalic")) {
      [v8 setItalic:1];
    }
    if ([v7 isStrikeOverridden] && objc_msgSend(v7, "isStrike")) {
      [v8 setStrike:1];
    }
    if ([v7 isUnderlineOverridden]
      && (![v6 isUnderlineOverridden] || !objc_msgSend(v6, "underline")))
    {
      objc_msgSend(v8, "setUnderline:", objc_msgSend(v7, "underline"));
    }
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

- (void)clearCache
{
  mFlattenedStyleCache = self->mFlattenedStyleCache;
  self->mFlattenedStyleCache = 0;

  mFillCache = self->mFillCache;
  self->mFillCache = 0;

  self->mFirstRow = 0;
  self->mLastRow = 0;
  self->mFirstColumn = 0;
  self->mLastColumn = 0;
}

- (id)wrapDifferentialStyleInATableStyleElement:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  id v8 = +[EDTableStyleElement tableStyleElementWithResources:WeakRetained];

  [v8 setType:v4];
  [v8 setDifferentialStyle:v6];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFillCache, 0);
  objc_storeStrong((id *)&self->mFlattenedStyleCache, 0);
  objc_storeStrong((id *)&self->mRanges, 0);
  objc_storeStrong((id *)&self->mKeys, 0);
  objc_storeStrong((id *)&self->mColumnInfos, 0);
  objc_storeStrong((id *)&self->mCurrentRowBlock, 0);
  objc_storeStrong((id *)&self->mRowBlocks, 0);
  objc_storeStrong((id *)&self->mWorksheet, 0);
}

- (unint64_t)flattenFillIndex:(unint64_t)a3 differentialFill:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  id v8 = [WeakRetained fills];

  if (v6)
  {
    mFillCache = self->mFillCache;
    if (!mFillCache)
    {
      BOOL v10 = objc_alloc_init(ECIntToTwoIntKeyCache);
      NSUInteger v11 = self->mFillCache;
      self->mFillCache = v10;

      mFillCache = self->mFillCache;
    }
    uint64_t v24 = -1;
    if ([(ECIntToTwoIntKeyCache *)mFillCache integerIsPresentForKey1:v6 key2:a3 outValue:&v24])
    {
      goto LABEL_17;
    }
    if (a3 == -1) {
      goto LABEL_8;
    }
    id v12 = [v8 objectAtIndex:a3];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v13 = [v12 type];

      if (!v13)
      {
LABEL_8:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = v6;
          unsigned int v14 = [v23 type];
          id v15 = [EDPatternFill alloc];
          if (v14 <= 1) {
            uint64_t v16 = 1;
          }
          else {
            uint64_t v16 = v14;
          }
          id v22 = [v23 backColor];
          id v17 = [v23 foreColor];
          id v18 = objc_loadWeakRetained((id *)&self->super.mResources);
          id v19 = [(EDPatternFill *)v15 initWithType:v16 foreColor:v22 backColor:v17 resources:v18];

          uint64_t v24 = [v8 addOrEquivalentObject:v19];
          unint64_t v20 = v24;
        }
        else
        {
          unint64_t v20 = [v8 indexOfObject:v6];
          uint64_t v24 = v20;
        }
        goto LABEL_16;
      }
    }
    else
    {
      objc_opt_class();
      objc_opt_isKindOfClass();
    }
    uint64_t v24 = a3;
    unint64_t v20 = a3;
LABEL_16:
    [(ECIntToTwoIntKeyCache *)self->mFillCache setObject:v20 forKey1:v6 key2:a3];
LABEL_17:
    a3 = v24;
  }

  return a3;
}

- (id)collectionFromWorksheet:(id)a3
{
  return 0;
}

- (id)styleFromObject:(id)a3
{
  return 0;
}

- (id)newExtractedKeys:(id)a3 from:(id)a4 parent:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = v9;
  if (v9) {
    NSUInteger v11 = (EDKeyedCollection *)[v9 copy];
  }
  else {
    NSUInteger v11 = objc_alloc_init(EDKeyedCollection);
  }
  id v12 = v11;
  uint64_t v13 = [v7 count];
  if (v13)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      id v15 = [v7 objectAtIndex:i];
      uint64_t v16 = objc_msgSend(v8, "objectWithKey:", (int)objc_msgSend(v15, "intValue"));

      if (v16) {
        [(EDKeyedCollection *)v12 addObject:v16];
      }
    }
  }

  return v12;
}

- (id)newExtractedGlobalStyleElements:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = [NSNumber numberWithInt:1];
  id v7 = [v5 arrayWithObject:v6];

  id v8 = [(EPStyleFlattener *)self newExtractedKeys:v7 from:v4 parent:0];
  return v8;
}

- (id)newExtractedRowStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5
{
  return 0;
}

- (id)newExtractedCellStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5 column:(int)a6
{
  return 0;
}

- (id)keysInTheOrderTheyShouldBeApplied
{
  return 0;
}

- (int)borderFlagsForStyleType:(int)a3 row:(int)a4 column:(int)a5
{
  return 0;
}

@end