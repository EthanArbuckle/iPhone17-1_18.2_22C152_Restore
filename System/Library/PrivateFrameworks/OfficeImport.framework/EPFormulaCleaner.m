@interface EPFormulaCleaner
- (BOOL)checkCustomFunction:(unsigned int)a3;
- (BOOL)checkFunctionId:(int)a3 tokenIndex:(unsigned int)a4;
- (BOOL)checkSupportedAddInName:(id)a3 externalLink:(BOOL)a4;
- (BOOL)cleanArea3D:(unsigned int)a3;
- (BOOL)cleanArea:(unsigned int)a3 updateSheet:(BOOL)a4;
- (BOOL)cleanArray:(unsigned int)a3;
- (BOOL)cleanFunc:(unsigned int)a3;
- (BOOL)cleanFuncVar:(unsigned int)a3;
- (BOOL)cleanName:(unsigned int)a3 nameIndex:(unsigned int)a4 sheetIndex:(unint64_t)a5 tokenOffset:(int *)a6;
- (BOOL)cleanName:(unsigned int)a3 tokenOffset:(int *)a4;
- (BOOL)cleanNameX:(unsigned int)a3 tokenOffset:(int *)a4;
- (BOOL)cleanRange:(unsigned int)a3 tokenOffset:(int *)a4;
- (BOOL)cleanRef3D:(unsigned int)a3;
- (BOOL)cleanRef:(unsigned int)a3 updateSheet:(BOOL)a4;
- (BOOL)cleanTokenAtIndex:(unsigned int)a3 tokenOffset:(int *)a4;
- (BOOL)cleanUnion:(unsigned int)a3;
- (BOOL)combineCellReferences:(unsigned int)a3 tokenOffset:(int *)a4;
- (BOOL)doesNameIndexContainCircularReferences:(unsigned int)a3 sheetIndex:(unint64_t)a4 previousNameIndexes:(void *)a5;
- (BOOL)isArrayedFormulaSupported:(id)a3 allowSimpleRanges:(BOOL)a4 formulasBeingEvaluated:(id)a5;
- (BOOL)isLinkReferenceIndexSupported:(unsigned int)a3 allowExternal:(BOOL)a4;
- (BOOL)isObjectSupported:(id)a3;
- (BOOL)isReferenceValidInLassoForRow:(int)a3 rowRelative:(BOOL)a4 column:(int)a5 columnRelative:(BOOL)a6;
- (BOOL)isReferenceValidInLassoForSheet:(id)a3 rowMin:(int)a4 rowMinRelative:(BOOL)a5 rowMax:(int)a6 rowMaxRelative:(BOOL)a7 columnMin:(int)a8 columnMinRelative:(BOOL)a9 columnMax:(int)a10 columnMaxRelative:(BOOL)a11;
- (BOOL)isThereContentOutsideOfLassoBoundsForSheet:(id)a3 rowMin:(int)a4 rowMax:(int)a5 columnMin:(int)a6 columnMax:(int)a7;
- (BOOL)useEvaluationStackToCheckFunctionId:(int)a3 functionName:(id)a4 tokenIndex:(unsigned int)a5;
- (id)newFormulaToCleanFromSharedFormula:(id)a3;
- (id)useEvaluationStackToGetParameter:(unsigned int)a3 tokenIndex:(unsigned int)a4 allReferencesAllowed:(BOOL)a5 success:(BOOL *)a6;
- (id)worksheetFromLinkReferenceIndex:(unsigned int)a3;
- (id)worksheetsFromLinkReferenceIndex:(unsigned int)a3;
- (int)useEvaluationStackToGetParameterTokenType:(unsigned int)a3 tokenIndex:(unsigned int)a4 success:(BOOL *)a5;
- (unsigned)useEvaluationStackToGetParameter:(unsigned int)a3 tokenIndex:(unsigned int)a4;
- (void)addOffsetsToRow:(int *)a3 rowRelative:(BOOL)a4 column:(int *)a5 columnRelative:(BOOL)a6;
- (void)applyMaxCellsInName:(id)a3;
- (void)cleanFormula:(id)a3 name:(id)a4;
- (void)cleanFormula:(id)a3 sheet:(id)a4;
- (void)cleanFormula:(id)a3 sheet:(id)a4 name:(id)a5;
- (void)prepareToProcessFormula:(id)a3 sheet:(id)a4 name:(id)a5;
- (void)reportWarning:(int)a3;
- (void)reportWarning:(int)a3 parameter:(id)a4;
- (void)reset;
- (void)updateSheet:(id)a3 row:(int)a4 rowRelative:(BOOL)a5 column:(int)a6 columnRelative:(BOOL)a7;
- (void)updateSheet:(id)a3 rowMin:(int)a4 rowMinRelative:(BOOL)a5 rowMax:(int)a6 rowMaxRelative:(BOOL)a7 columnMin:(int)a8 columnMinRelative:(BOOL)a9 columnMax:(int)a10 columnMaxRelative:(BOOL)a11;
- (void)updateWorksheet:(id)a3 row:(int)a4 column:(int)a5 inDictionary:(id)a6;
@end

@implementation EPFormulaCleaner

- (void)cleanFormula:(id)a3 sheet:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v6) {
    [(EPFormulaCleaner *)self cleanFormula:v7 sheet:v6 name:0];
  }
}

- (void)cleanFormula:(id)a3 sheet:(id)a4 name:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [(EPFormulaCleaner *)self prepareToProcessFormula:v9 sheet:v10 name:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [(EPFormulaCleaner *)self newFormulaToCleanFromSharedFormula:v9];
    mTokensToClean = self->mTokensToClean;
    self->mTokensToClean = v12;

    v14 = self->mTokensToClean;
    if (!v14) {
      goto LABEL_12;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->mTokensToClean, a3);
    v14 = self->mTokensToClean;
  }
  if (-[EDFormula tokenCount](v14, "tokenCount") || [v11 isInternalFunction])
  {
    for (uint64_t i = 0;
          i < [(EDFormula *)self->mTokensToClean tokenCount];
          uint64_t i = (i + v16 + 1))
    {
      int v16 = 0;
      if (![(EPFormulaCleaner *)self cleanTokenAtIndex:i tokenOffset:&v16]) {
        goto LABEL_12;
      }
    }
    [v9 setCleaned:1];
    [(EPFormulaCleaner *)self reset];
  }
LABEL_12:
}

- (void)prepareToProcessFormula:(id)a3 sheet:(id)a4 name:(id)a5
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  [(EPFormulaCleaner *)self reset];
  objc_storeStrong((id *)&self->mFormula, a3);
  mTokensToClean = self->mTokensToClean;
  self->mTokensToClean = 0;

  objc_storeStrong((id *)&self->mCurrentSheet, a4);
  objc_storeStrong((id *)&self->mParentName, a5);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v13;
    if (([v12 isBaseFormula] & 1) == 0)
    {
      self->mRowOffset = [v12 rowBaseOrOffset];
      self->mColumnOffset = [v12 columnBaseOrOffset];
    }
  }
}

- (void)reset
{
  mCurrentSheet = self->mCurrentSheet;
  self->mCurrentSheet = 0;

  mFormula = self->mFormula;
  self->mFormula = 0;

  mTokensToClean = self->mTokensToClean;
  self->mTokensToClean = 0;

  mParentName = self->mParentName;
  self->mParentName = 0;

  self->mRowOffset = 0;
  self->mColumnOffset = 0;
  [(EDRowBlocks *)self->mBaseFormulaRowBlocks unlock];
  mBaseFormulaRowBlocks = self->mBaseFormulaRowBlocks;
  self->mBaseFormulaRowBlocks = 0;
}

- (BOOL)cleanRef:(unsigned int)a3 updateSheet:(BOOL)a4
{
  BOOL v4 = a4;
  *(void *)id v10 = 0;
  *(_WORD *)id v9 = 0;
  int v8 = 0;
  extractDataFromPtgRefBuffer((unsigned __int16 *)[(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:*(void *)&a3 length:&v8], &v10[1], &v9[1], v10, v9);
  BOOL v6 = [(EPFormulaCleaner *)self isReferenceValidInLassoForRow:v10[1] rowRelative:v9[1] column:v10[0] columnRelative:v9[0]];
  if (v6 && v4) {
    [(EPFormulaCleaner *)self updateSheet:self->mCurrentSheet row:v10[1] rowRelative:v9[1] column:v10[0] columnRelative:v9[0]];
  }
  return v6;
}

- (BOOL)isReferenceValidInLassoForRow:(int)a3 rowRelative:(BOOL)a4 column:(int)a5 columnRelative:(BOOL)a6
{
  int v10 = a5;
  int v11 = a3;
  [(EPFormulaCleaner *)self addOffsetsToRow:&v11 rowRelative:a4 column:&v10 columnRelative:a6];
  BOOL v7 = v11 < 500001 && v10 < 500001;
  BOOL v8 = v7;
  if (!v7) {
    [(EPFormulaCleaner *)self reportWarning:10];
  }
  return v8;
}

- (void)addOffsetsToRow:(int *)a3 rowRelative:(BOOL)a4 column:(int *)a5 columnRelative:(BOOL)a6
{
  if (!a4)
  {
    if (!a6) {
      return;
    }
LABEL_5:
    *a5 += self->mColumnOffset;
    return;
  }
  *a3 += self->mRowOffset;
  if (a6) {
    goto LABEL_5;
  }
}

- (void)updateSheet:(id)a3 row:(int)a4 rowRelative:(BOOL)a5 column:(int)a6 columnRelative:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a5;
  unsigned int v15 = a6;
  unsigned int v16 = a4;
  id v10 = a3;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(EPFormulaCleaner *)self addOffsetsToRow:&v16 rowRelative:v8 column:&v15 columnRelative:v7];
      [(EDFormula *)self->mFormula updateContainsRelativeReferences:v8 | v7];
      mParentName = self->mParentName;
      if (mParentName)
      {
        uint64_t v13 = v15;
        uint64_t v12 = v16;
        v14 = [(EDName *)mParentName maxWorksheetReferences];
        [(EPFormulaCleaner *)self updateWorksheet:v10 row:v12 column:v13 inDictionary:v14];
      }
      else
      {
        v14 = [v10 maxCellReferencedInFormulas];
        [v14 unionWithRow:v16 column:v15];
      }
    }
  }
}

- (BOOL)cleanFuncVar:(unsigned int)a3
{
  int v4 = 0;
  return [(EPFormulaCleaner *)self checkFunctionId:*(unsigned __int16 *)([(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:*(void *)&a3 length:&v4]+ 4) tokenIndex:*(void *)&a3];
}

- (BOOL)checkFunctionId:(int)a3 tokenIndex:(unsigned int)a4
{
  return 1;
}

- (id)newFormulaToCleanFromSharedFormula:(id)a3
{
  id v4 = a3;
  v5 = [(EDSheet *)self->mCurrentSheet rowBlocks];
  BOOL v6 = [v4 warningWithRowBlocks:v5];

  [v5 unlock];
  if (v6)
  {
    BOOL v7 = 0;
  }
  else if ([v4 isBaseFormula])
  {
    BOOL v7 = (EDFormula *)v4;
  }
  else
  {
    BOOL v8 = [(EDSheet *)self->mCurrentSheet rowBlocks];
    id v9 = [v4 baseFormulaWithRowBlocks:v8];
    if (([v9 isContainsRelativeReferences] & 1) != 0
      || [v9 isCleanedWithEvaluationStack])
    {
      objc_storeStrong((id *)&self->mBaseFormulaRowBlocks, v8);
      id v10 = [[EDFormula alloc] initWithFormula:v9];

      BOOL v7 = v10;
      id v9 = v7;
    }
    else
    {
      [v8 unlock];
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (BOOL)cleanArea:(unsigned int)a3 updateSheet:(BOOL)a4
{
  BOOL v4 = a4;
  int v17 = 0;
  int v16 = 0;
  *(void *)unsigned int v15 = 0;
  *(_WORD *)v14 = 0;
  *(_WORD *)uint64_t v13 = 0;
  int v12 = 0;
  extractDataFromPtgAreaBuffer((unsigned __int16 *)[(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:*(void *)&a3 length:&v12], &v17, &v14[1], &v16, v14, &v15[1], &v13[1], v15, v13);
  LOBYTE(v10) = v13[0];
  HIDWORD(v8) = v15[0];
  LOBYTE(v8) = v13[1];
  BOOL v6 = -[EPFormulaCleaner isReferenceValidInLassoForSheet:rowMin:rowMinRelative:rowMax:rowMaxRelative:columnMin:columnMinRelative:columnMax:columnMaxRelative:](self, "isReferenceValidInLassoForSheet:rowMin:rowMinRelative:rowMax:rowMaxRelative:columnMin:columnMinRelative:columnMax:columnMaxRelative:", self->mCurrentSheet, v17, v14[1], v16, v14[0], v15[1], v8, v10);
  if (v6 && v4)
  {
    LOBYTE(v11) = v13[0];
    HIDWORD(v9) = v15[0];
    LOBYTE(v9) = v13[1];
    -[EPFormulaCleaner updateSheet:rowMin:rowMinRelative:rowMax:rowMaxRelative:columnMin:columnMinRelative:columnMax:columnMaxRelative:](self, "updateSheet:rowMin:rowMinRelative:rowMax:rowMaxRelative:columnMin:columnMinRelative:columnMax:columnMaxRelative:", self->mCurrentSheet, v17, v14[1], v16, v14[0], v15[1], v9, v11);
  }
  return v6;
}

- (BOOL)isThereContentOutsideOfLassoBoundsForSheet:(id)a3 rowMin:(int)a4 rowMax:(int)a5 columnMin:(int)a6 columnMax:(int)a7
{
  return 0;
}

- (BOOL)cleanFunc:(unsigned int)a3
{
  int v4 = 0;
  return [(EPFormulaCleaner *)self checkFunctionId:*(unsigned __int16 *)[(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:*(void *)&a3 length:&v4] tokenIndex:*(void *)&a3];
}

- (BOOL)isObjectSupported:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if ([v4 isSupportedFormula]) {
      int v5 = [v4 isCleaned] ^ 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)cleanArea3D:(unsigned int)a3
{
  *(void *)v19 = 0;
  *(void *)v20 = 0;
  int v18 = 0;
  *(_WORD *)int v17 = 0;
  *(_WORD *)int v16 = 0;
  int v15 = 0;
  extractDataFromPtgArea3DBuffer((unsigned __int16 *)[(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:*(void *)&a3 length:&v15], &v20[1], (int *)v20, &v17[1], &v19[1], v17, v19, &v16[1], &v18, v16);
  BOOL v4 = 0;
  if ([(EPFormulaCleaner *)self isLinkReferenceIndexSupported:v20[1] allowExternal:0])
  {
    int v5 = [(EPFormulaCleaner *)self worksheetsFromLinkReferenceIndex:v20[1]];
    BOOL v6 = v5;
    if (v5 && [v5 count])
    {
      unint64_t v7 = [v6 count];
      if (v7)
      {
        BOOL v4 = 0;
        uint64_t v8 = 0;
        while (1)
        {
          id v9 = [v6 objectAtIndex:v8];
          LOBYTE(v13) = v16[0];
          HIDWORD(v11) = v18;
          LOBYTE(v11) = v16[1];
          if (!-[EPFormulaCleaner isReferenceValidInLassoForSheet:rowMin:rowMinRelative:rowMax:rowMaxRelative:columnMin:columnMinRelative:columnMax:columnMaxRelative:](self, "isReferenceValidInLassoForSheet:rowMin:rowMinRelative:rowMax:rowMaxRelative:columnMin:columnMinRelative:columnMax:columnMaxRelative:", v9, v20[0], v17[1], v19[1], v17[0], v19[0], v11, v13))break; {
          LOBYTE(v14) = v16[0];
          }
          HIDWORD(v12) = v18;
          LOBYTE(v12) = v16[1];
          -[EPFormulaCleaner updateSheet:rowMin:rowMinRelative:rowMax:rowMaxRelative:columnMin:columnMinRelative:columnMax:columnMaxRelative:](self, "updateSheet:rowMin:rowMinRelative:rowMax:rowMaxRelative:columnMin:columnMinRelative:columnMax:columnMaxRelative:", v9, v20[0], v17[1], v19[1], v17[0], v19[0], v12, v14);

          BOOL v4 = ++v8 >= v7;
          if (v7 == v8) {
            goto LABEL_8;
          }
        }
      }
      else
      {
LABEL_8:
        BOOL v4 = 1;
      }
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (BOOL)isLinkReferenceIndexSupported:(unsigned int)a3 allowExternal:(BOOL)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  uint64_t v8 = [WeakRetained links];

  id v9 = [v8 referenceAtIndex:a3];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = objc_msgSend(v8, "linkAtIndex:", objc_msgSend(v9, "linkIndex"));
    int v12 = [v11 type];
    BOOL v13 = v12 == 2 && a4;
    if ((v12 & 0xFFFFFFFD) == 1 || v13)
    {
      unint64_t v15 = [v10 firstSheetIndex];
      uint64_t v16 = [v10 lastSheetIndex];
      unint64_t v17 = v16;
      if (v15 != -1 && v16 != -1)
      {
        if ([v10 isWorkbookLevelReference])
        {
          BOOL v14 = 1;
LABEL_24:

          goto LABEL_25;
        }
        id v19 = objc_loadWeakRetained((id *)&self->super.mWorkbook);
        v20 = [v19 mappingContext];
        unint64_t v21 = [v20 mappingInfoCount];

        if (v12 != 1 || v15 <= v21)
        {
          BOOL v14 = 1;
          if (v12 != 1 || v15 == v17 || v17 <= v21) {
            goto LABEL_24;
          }
        }
      }
      [(EPFormulaCleaner *)self reportWarning:6];
    }
    else
    {
      [(EPFormulaCleaner *)self reportWarning:5];
    }
    BOOL v14 = 0;
    goto LABEL_24;
  }
  [(EPFormulaCleaner *)self reportWarning:5];
  BOOL v14 = 0;
LABEL_25:

  return v14;
}

- (void)reportWarning:(int)a3
{
}

- (void)reportWarning:(int)a3 parameter:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  [(EDFormula *)self->mFormula setWarning:v4];
  if (v6) {
    [(EDFormula *)self->mFormula setWarningParameter:v6];
  }
}

- (BOOL)cleanRef3D:(unsigned int)a3
{
  *(void *)unint64_t v15 = 0;
  int v14 = 0;
  *(_WORD *)BOOL v13 = 0;
  int v12 = 0;
  extractDataFromPtgRef3DBuffer((unsigned __int16 *)[(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:*(void *)&a3 length:&v12], &v15[1], (int *)v15, &v13[1], &v14, v13);
  BOOL v4 = [(EPFormulaCleaner *)self isLinkReferenceIndexSupported:v15[1] allowExternal:0];
  LOBYTE(v5) = 0;
  if (v4)
  {
    BOOL v5 = [(EPFormulaCleaner *)self isReferenceValidInLassoForRow:v15[0] rowRelative:v13[1] column:v14 columnRelative:v13[0]];
    if (v5)
    {
      id v6 = [(EPFormulaCleaner *)self worksheetsFromLinkReferenceIndex:v15[1]];
      unint64_t v7 = v6;
      if (v6)
      {
        if ([v6 count])
        {
          uint64_t v8 = [v7 count];
          if (v8)
          {
            uint64_t v9 = 0;
            do
            {
              uint64_t v10 = [v7 objectAtIndex:v9];
              [(EPFormulaCleaner *)self updateSheet:v10 row:v15[0] rowRelative:v13[1] column:v14 columnRelative:v13[0]];

              ++v9;
            }
            while (v8 != v9);
          }
        }
      }

      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)applyMaxCellsInName:(id)a3
{
  id v10 = [a3 maxWorksheetReferences];
  id v3 = [v10 allKeys];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      id v6 = [v3 objectAtIndex:i];
      unint64_t v7 = v6;
      if (v6)
      {
        uint64_t v8 = [v6 maxCellReferencedInFormulas];
        uint64_t v9 = [v10 objectForKey:v7];
        [v8 unionWithReference:v9];
      }
    }
  }
  [v10 removeAllObjects];
}

- (BOOL)checkSupportedAddInName:(id)a3 externalLink:(BOOL)a4
{
  return 1;
}

- (BOOL)cleanUnion:(unsigned int)a3
{
  if (a3 >= 2)
  {
    uint64_t v6 = *(void *)&a3;
    BOOL v4 = 0;
    uint64_t v7 = 0;
    char v8 = 0;
    char v9 = 0;
    for (char i = 1; ; char i = 0)
    {
      char v11 = i;
      uint64_t v12 = [(EPFormulaCleaner *)self useEvaluationStackToGetParameter:v4 tokenIndex:v6];
      if (v12 == -1) {
        goto LABEL_2;
      }
      uint64_t v13 = v12;
      int v14 = [(EDFormula *)self->mTokensToClean tokenTypeAtIndex:v12];
      int v15 = v14;
      char v16 = v14 - 16;
      if ((v14 - 16) > 0x3D) {
        goto LABEL_10;
      }
      if (((1 << v16) & 0x3030000030300000) != 0) {
        goto LABEL_16;
      }
      if (((1 << v16) & 0xC0000000000) == 0) {
        break;
      }
LABEL_13:
      if (v8) {
        goto LABEL_2;
      }
      *(void *)v24 = 0;
      *(void *)v25 = 0;
      int v23 = 0;
      *(_WORD *)v22 = 0;
      *(_WORD *)unint64_t v21 = 0;
      int v20 = 0;
      int v18 = [(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:v13 length:&v20];
      if (v15 == 58) {
        extractDataFromPtgRef3DBuffer((unsigned __int16 *)v18, &v25[1], (int *)v25, &v22[1], v24, &v21[1]);
      }
      else {
        extractDataFromPtgArea3DBuffer((unsigned __int16 *)v18, &v25[1], (int *)v25, &v22[1], &v24[1], v22, v24, &v21[1], &v23, v21);
      }
      uint64_t v19 = v25[1];
      if (v9)
      {
        uint64_t v19 = v7;
        if (v7 != v25[1]) {
          goto LABEL_2;
        }
      }
      char v8 = 0;
      char v9 = 1;
      uint64_t v7 = v19;
LABEL_22:
      BOOL v4 = 1;
      if ((v11 & 1) == 0) {
        return v4;
      }
    }
    if (v14 == 16) {
      goto LABEL_22;
    }
LABEL_10:
    char v17 = v14 - 90;
    if ((v14 - 90) > 0x21) {
      goto LABEL_2;
    }
    if (((1 << v17) & 0xC0C00) != 0)
    {
LABEL_16:
      if (v9) {
        goto LABEL_2;
      }
      char v9 = 0;
      char v8 = 1;
      goto LABEL_22;
    }
    if (((1 << v17) & 0x300000003) == 0) {
      goto LABEL_2;
    }
    goto LABEL_13;
  }
LABEL_2:
  [(EPFormulaCleaner *)self reportWarning:1];
  LOBYTE(v4) = 0;
  return v4;
}

- (unsigned)useEvaluationStackToGetParameter:(unsigned int)a3 tokenIndex:(unsigned int)a4
{
  BOOL v5 = +[EDTokenTree buildSubtree:*(void *)&a4 formula:self->mTokensToClean];
  uint64_t v6 = [v5 firstChild];

  if (v6)
  {
    unsigned int v7 = a3 + 1;
    char v8 = (void *)v6;
    while (--v7)
    {
      uint64_t v9 = [v8 sibling];

      char v8 = (void *)v9;
      if (!v9) {
        goto LABEL_7;
      }
    }
    unsigned int v10 = [v8 tokenIndex];
  }
  else
  {
    char v8 = 0;
LABEL_7:
    unsigned int v10 = -1;
  }

  return v10;
}

- (BOOL)cleanArray:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v10 = 0;
  BOOL v5 = [(EDFormula *)self->mFormula extendedDataForTokenAtIndex:*(void *)&a3 extendedDataIndex:0 length:&v10];
  if (!v5) {
    return 1;
  }
  int v6 = *(_DWORD *)v5;
  if (*(int *)v5 < 1) {
    return 1;
  }
  int v7 = 0;
  while (1)
  {
    char v8 = [(EDFormula *)self->mFormula extendedDataForTokenAtIndex:v3 extendedDataIndex:(v7 + 2) length:&v10];
    if (v8)
    {
      if (*v8 == 16) {
        break;
      }
    }
    if (v6 == ++v7) {
      return 1;
    }
  }
  [(EPFormulaCleaner *)self reportWarning:6];
  return 0;
}

- (void)cleanFormula:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v6) {
    [(EPFormulaCleaner *)self cleanFormula:v7 sheet:0 name:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNameCircularReferenceTestCache, 0);
  objc_storeStrong((id *)&self->mNameArrayedTestCache, 0);
  objc_storeStrong((id *)&self->mBaseFormulaRowBlocks, 0);
  objc_storeStrong((id *)&self->mParentName, 0);
  objc_storeStrong((id *)&self->mTokensToClean, 0);
  objc_storeStrong((id *)&self->mFormula, 0);
  objc_storeStrong((id *)&self->mCurrentSheet, 0);
}

- (BOOL)cleanTokenAtIndex:(unsigned int)a3 tokenOffset:(int *)a4
{
  uint64_t v5 = *(void *)&a3;
  *a4 = 0;
  int v7 = -[EDFormula tokenTypeAtIndex:](self->mTokensToClean, "tokenTypeAtIndex:") - 1;
  BOOL result = 1;
  switch(v7)
  {
    case 0:
    case 1:
    case 45:
    case 46:
    case 77:
    case 78:
    case 109:
    case 110:
      uint64_t v9 = self;
      uint64_t v10 = 2;
      goto LABEL_4;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 24:
    case 28:
    case 29:
    case 30:
    case 37:
    case 38:
    case 39:
    case 40:
    case 69:
    case 70:
    case 71:
    case 72:
    case 87:
    case 101:
    case 102:
    case 103:
    case 104:
    case 119:
      return result;
    case 15:
      return [(EPFormulaCleaner *)self cleanUnion:v5];
    case 16:
      return [(EPFormulaCleaner *)self cleanRange:v5 tokenOffset:a4];
    case 23:
      uint64_t v9 = self;
      uint64_t v10 = 3;
      goto LABEL_4;
    case 27:
    case 41:
    case 42:
    case 59:
    case 60:
    case 73:
    case 74:
    case 91:
    case 92:
    case 105:
    case 106:
    case 123:
    case 124:
      uint64_t v9 = self;
      uint64_t v10 = 6;
      goto LABEL_4;
    case 31:
    case 63:
    case 95:
      return [(EPFormulaCleaner *)self cleanArray:v5];
    case 32:
    case 64:
    case 96:
      return [(EPFormulaCleaner *)self cleanFunc:v5];
    case 33:
    case 65:
    case 97:
      return [(EPFormulaCleaner *)self cleanFuncVar:v5];
    case 34:
    case 66:
    case 98:
      return [(EPFormulaCleaner *)self cleanName:v5 tokenOffset:a4];
    case 35:
    case 67:
    case 99:
      char v11 = self;
      uint64_t v12 = v5;
      uint64_t v13 = 1;
      goto LABEL_29;
    case 36:
    case 68:
    case 100:
      int v14 = self;
      uint64_t v15 = v5;
      uint64_t v16 = 1;
      goto LABEL_33;
    case 43:
    case 75:
    case 107:
      char v11 = self;
      uint64_t v12 = v5;
      uint64_t v13 = 0;
LABEL_29:
      BOOL result = [(EPFormulaCleaner *)v11 cleanRef:v12 updateSheet:v13];
      break;
    case 44:
    case 76:
    case 108:
      int v14 = self;
      uint64_t v15 = v5;
      uint64_t v16 = 0;
LABEL_33:
      BOOL result = [(EPFormulaCleaner *)v14 cleanArea:v15 updateSheet:v16];
      break;
    case 56:
    case 88:
    case 120:
      BOOL result = [(EPFormulaCleaner *)self cleanNameX:v5 tokenOffset:a4];
      break;
    case 57:
    case 89:
    case 121:
      BOOL result = [(EPFormulaCleaner *)self cleanRef3D:v5];
      break;
    case 58:
    case 90:
    case 122:
      BOOL result = [(EPFormulaCleaner *)self cleanArea3D:v5];
      break;
    default:
      uint64_t v9 = self;
      uint64_t v10 = 1;
LABEL_4:
      [(EPFormulaCleaner *)v9 reportWarning:v10];
      BOOL result = 0;
      break;
  }
  return result;
}

- (BOOL)isReferenceValidInLassoForSheet:(id)a3 rowMin:(int)a4 rowMinRelative:(BOOL)a5 rowMax:(int)a6 rowMaxRelative:(BOOL)a7 columnMin:(int)a8 columnMinRelative:(BOOL)a9 columnMax:(int)a10 columnMaxRelative:(BOOL)a11
{
  BOOL v12 = a7;
  uint64_t v13 = *(void *)&a6;
  BOOL v14 = a5;
  uint64_t v17 = a10;
  id v18 = a3;
  int v24 = v13;
  int v25 = a4;
  int v23 = a8;
  BOOL v19 = isRowReference(a8, v17);
  BOOL v20 = a11;
  if (v19 || isColumnReference(a4, v13))
  {
    [(EPFormulaCleaner *)self addOffsetsToRow:&v25 rowRelative:v14 column:&v23 columnRelative:a9];
    [(EPFormulaCleaner *)self addOffsetsToRow:&v24 rowRelative:v12 column:&a10 columnRelative:v20];
    if (v25 >= 500001 && v23 >= 500001
      || -[EPFormulaCleaner isThereContentOutsideOfLassoBoundsForSheet:rowMin:rowMax:columnMin:columnMax:](self, "isThereContentOutsideOfLassoBoundsForSheet:rowMin:rowMax:columnMin:columnMax:", v18))
    {
      [(EPFormulaCleaner *)self reportWarning:10];
      BOOL v21 = 0;
    }
    else
    {
      BOOL v21 = 1;
    }
  }
  else
  {
    BOOL v21 = [(EPFormulaCleaner *)self isReferenceValidInLassoForRow:v13 rowRelative:v12 column:v17 columnRelative:v20];
  }

  return v21;
}

- (void)updateSheet:(id)a3 rowMin:(int)a4 rowMinRelative:(BOOL)a5 rowMax:(int)a6 rowMaxRelative:(BOOL)a7 columnMin:(int)a8 columnMinRelative:(BOOL)a9 columnMax:(int)a10 columnMaxRelative:(BOOL)a11
{
  BOOL v12 = a7;
  id v24 = a3;
  BOOL v16 = isRowReference(a8, a10);
  BOOL v17 = isColumnReference(a4, a6);
  if (a10 >= 500000) {
    unsigned int v18 = 500000;
  }
  else {
    unsigned int v18 = a10;
  }
  if (v16) {
    int v19 = a6;
  }
  else {
    int v19 = 0;
  }
  if (v17) {
    unsigned int v20 = v18;
  }
  else {
    unsigned int v20 = a10;
  }
  if (!v17)
  {
    int v19 = a6;
    unsigned int v18 = 0;
  }
  if (v19 >= 500000) {
    unsigned int v21 = 500000;
  }
  else {
    unsigned int v21 = v19;
  }
  if (v16) {
    uint64_t v22 = v18;
  }
  else {
    uint64_t v22 = v20;
  }
  if (v16) {
    uint64_t v23 = v21;
  }
  else {
    uint64_t v23 = v19;
  }
  [(EPFormulaCleaner *)self updateSheet:v24 row:v23 rowRelative:v12 column:v22 columnRelative:a11];
}

- (BOOL)cleanName:(unsigned int)a3 tokenOffset:(int *)a4
{
  uint64_t v5 = *(void *)&a3;
  int v11 = 0;
  uint64_t v7 = *(unsigned int *)[(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:*(void *)&a3 length:&v11];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.mWorkbook);
  uint64_t v9 = [WeakRetained indexOfSheet:self->mCurrentSheet];

  return [(EPFormulaCleaner *)self cleanName:v5 nameIndex:v7 sheetIndex:v9 tokenOffset:a4];
}

- (BOOL)cleanNameX:(unsigned int)a3 tokenOffset:(int *)a4
{
  uint64_t v5 = *(void *)&a3;
  int v21 = 0;
  uint64_t v7 = [(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:*(void *)&a3 length:&v21];
  uint64_t v8 = *(unsigned __int16 *)v7;
  unint64_t v9 = *((unsigned __int16 *)v7 + 1);
  BOOL v10 = 0;
  if ([(EPFormulaCleaner *)self isLinkReferenceIndexSupported:v8 allowExternal:1])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
    BOOL v12 = [WeakRetained links];

    uint64_t v13 = [v12 referenceAtIndex:v8];
    BOOL v14 = objc_msgSend(v12, "linkAtIndex:", objc_msgSend(v13, "linkIndex"));
    int v15 = [v14 type];
    int v16 = v15;
    if (v15 == 1)
    {
      BOOL v10 = -[EPFormulaCleaner cleanName:nameIndex:sheetIndex:tokenOffset:](self, "cleanName:nameIndex:sheetIndex:tokenOffset:", v5, v9, [v13 firstSheetIndex], a4);
    }
    else if ((v15 & 0xFFFFFFFE) == 2)
    {
      BOOL v17 = [v14 externalNames];
      if ([v17 count] <= v9)
      {
        [(EPFormulaCleaner *)self reportWarning:5];
        BOOL v10 = 0;
      }
      else
      {
        unsigned int v18 = [v17 objectAtIndex:v9];
        int v19 = [v18 string];
        BOOL v10 = [(EPFormulaCleaner *)self checkSupportedAddInName:v19 externalLink:v16 == 2];
      }
    }
    else
    {
      [(EPFormulaCleaner *)self reportWarning:5];
      BOOL v10 = 0;
    }
  }
  return v10;
}

- (BOOL)cleanRange:(unsigned int)a3 tokenOffset:(int *)a4
{
  *a4 = 0;
  if (a3 >= 2)
  {
    uint64_t v8 = *(void *)&a3;
    BOOL v5 = 0;
LABEL_6:
    for (uint64_t i = v5; ; uint64_t i = 1)
    {
      int v10 = i;
      uint64_t v11 = [(EPFormulaCleaner *)self useEvaluationStackToGetParameter:i tokenIndex:v8];
      if (v11 == -1) {
        break;
      }
      uint64_t v12 = v11;
      int v13 = [(EDFormula *)self->mTokensToClean tokenTypeAtIndex:v11];
      char v14 = v13 - 17;
      if ((v13 - 17) > 0x3C) {
        goto LABEL_14;
      }
      if (((1 << v14) & 0x1818000018180000) == 0)
      {
        if (v13 != 17)
        {
          if (((1 << v14) & 0x3000000030000) != 0) {
            goto LABEL_19;
          }
LABEL_14:
          if ((v13 - 97) > 0xC) {
            break;
          }
          int v15 = 1 << (v13 - 97);
          if ((v15 & 0x1818) == 0)
          {
            if ((v15 & 3) == 0) {
              break;
            }
LABEL_19:
            BOOL v5 = 1;
            if (!v10) {
              goto LABEL_6;
            }
            return v5;
          }
          goto LABEL_16;
        }
        if (![(EPFormulaCleaner *)self combineCellReferences:v12 tokenOffset:a4])goto LABEL_3; {
      }
        }
LABEL_16:
      if (v10)
      {
        if (v5)
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        uint64_t v16 = (*a4 + v8);
        return [(EPFormulaCleaner *)self combineCellReferences:v16 tokenOffset:a4];
      }
    }
  }
  [(EPFormulaCleaner *)self reportWarning:1];
LABEL_3:
  LOBYTE(v5) = 0;
  return v5;
}

- (BOOL)combineCellReferences:(unsigned int)a3 tokenOffset:(int *)a4
{
  if (a3 >= 2)
  {
    uint64_t v6 = *(void *)&a3;
    if ([(EDFormula *)self->mTokensToClean tokenCount] > a3)
    {
      uint64_t v7 = [(EPFormulaCleaner *)self useEvaluationStackToGetParameter:0 tokenIndex:v6];
      uint64_t v8 = [(EPFormulaCleaner *)self useEvaluationStackToGetParameter:1 tokenIndex:v6];
      if (v7 != -1)
      {
        uint64_t v9 = v8;
        if (v8 != -1)
        {
          int v10 = [(EDFormula *)self->mTokensToClean tokenTypeAtIndex:v7];
          int v11 = [(EDFormula *)self->mTokensToClean tokenTypeAtIndex:v9];
          int v12 = v11;
          BOOL v13 = (v10 - 37) > 0x27 || ((1 << (v10 - 37)) & 0x8100000101) == 0;
          BOOL v34 = !v13 || v10 == 109 || v10 == 101;
          BOOL v14 = (v11 - 37) > 0x27 || ((1 << (v11 - 37)) & 0x8100000101) == 0;
          BOOL v15 = !v14 || v11 == 109 || v11 == 101;
          if ((unsigned int v16 = v10 - 36, (v10 - 36) <= 0x29) && ((1 << v16) & 0x20100000101) != 0
            || v10 == 100
            || v10 == 108
            || v34)
          {
            if ((unsigned int v17 = v11 - 36, (v11 - 36) <= 0x29) && ((1 << v17) & 0x20100000101) != 0
              || v11 == 100
              || v11 == 108
              || v15)
            {
              if (v16 <= 0x29 && ((1 << v16) & 0x20100000101) != 0 || v10 == 108 || (unsigned int v35 = v7, v10 == 100))
              {
                if (v15) {
                  unsigned int v18 = v9;
                }
                else {
                  unsigned int v18 = v7;
                }
                unsigned int v35 = v18;
              }
              v36 = +[EDFormula formula];
              uint64_t v19 = [v36 addToken:37 extendedDataLength:8];
              if (v19)
              {
                v31 = (_WORD *)v19;
                int v44 = -1;
                int v45 = 0;
                int v42 = -1;
                int v43 = -1;
                int v40 = -1;
                int v41 = -1;
                int v38 = -1;
                int v39 = -1;
                int v37 = -1;
                if (v16 <= 0x29 && ((1 << v16) & 0x20100000101) != 0 || v10 == 108 || v10 == 100)
                {
                  extractDataFromPtgRefBuffer((unsigned __int16 *)[(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:v7 length:&v45], &v44, &v43);
                  unsigned __int16 v20 = v43 & 0xC000;
                  int v21 = v43;
                  int v42 = v44;
                  int v43 = v43;
                  unsigned __int16 v32 = v20;
                  unsigned __int16 v33 = v20;
                }
                else
                {
                  extractDataFromPtgAreaBuffer((unsigned __int16 *)[(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:v7 length:&v45], &v44, &v42, &v43, &v41);
                  unsigned __int16 v32 = v41 & 0xC000;
                  unsigned __int16 v33 = v43 & 0xC000;
                  int v43 = v43;
                  int v21 = v41;
                }
                int v41 = v21;
                if (v17 <= 0x29 && ((1 << v17) & 0x20100000101) != 0 || v12 == 108 || v12 == 100)
                {
                  extractDataFromPtgRefBuffer((unsigned __int16 *)[(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:v9 length:&v45], &v40, &v39);
                  unsigned __int16 v22 = v33;
                  if ((v39 & 0xC000) != v33) {
                    goto LABEL_66;
                  }
                  int v23 = v40;
                  int v24 = v39;
                  int v38 = v40;
                  int v39 = v24;
                  int v25 = v40;
                  int v26 = v24;
                }
                else
                {
                  extractDataFromPtgAreaBuffer((unsigned __int16 *)[(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:v9 length:&v45], &v40, &v38, &v39, &v37);
                  unsigned __int16 v22 = v33;
                  if ((v39 & 0xC000) != v33) {
                    goto LABEL_66;
                  }
                  char v30 = !v34;
                  if ((v37 & 0xC000) == v32) {
                    char v30 = 1;
                  }
                  if ((v30 & 1) == 0) {
                    goto LABEL_66;
                  }
                  if (v16 <= 0x29 && ((1 << v16) & 0x20100000101) != 0 || v10 == 108 || v10 == 100) {
                    unsigned __int16 v32 = v37 & 0xC000;
                  }
                  int v24 = v39;
                  int v39 = v39;
                  int v26 = v37;
                  int v25 = v40;
                  int v23 = v38;
                }
                v46.origin.x = (double)v43;
                v46.origin.y = (double)v44;
                v46.size.width = (double)(v41 - v43 + 1);
                int v37 = v26;
                v46.size.height = (double)(v42 - v44 + 1);
                v48.origin.x = (double)v24;
                v48.origin.y = (double)v25;
                v48.size.width = (double)(v26 - v24 + 1);
                v48.size.height = (double)(v23 - v25 + 1);
                CGRect v47 = CGRectUnion(v46, v48);
                _WORD *v31 = (int)v47.origin.y;
                v31[1] = (int)(v47.origin.y + v47.size.height + -1.0);
                v31[2] = v22 | (int)v47.origin.x;
                v31[3] = v32 | (int)(v47.origin.x + v47.size.width + -1.0);
              }
              if ([(EDFormula *)self->mTokensToClean replaceTokenAtIndex:v35 withFormula:v36 formulaTokenIndex:0])
              {
                [(EDFormula *)self->mTokensToClean removeTokenAtIndex:v6];
                if (v35 == v7) {
                  uint64_t v27 = v9;
                }
                else {
                  uint64_t v27 = v7;
                }
                [(EDFormula *)self->mTokensToClean removeTokenAtIndex:v27];
                *a4 -= 2;
                BOOL v28 = 1;
                goto LABEL_67;
              }
LABEL_66:
              [(EPFormulaCleaner *)self reportWarning:1];
              BOOL v28 = 0;
LABEL_67:

              return v28;
            }
          }
        }
      }
    }
  }
  [(EPFormulaCleaner *)self reportWarning:1];
  return 0;
}

- (id)worksheetFromLinkReferenceIndex:(unsigned int)a3
{
  uint64_t v12 = -1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  uint64_t v6 = objc_msgSend(WeakRetained, "links", -1);
  [v6 convertLinkReferenceIndex:a3 firstSheetIndex:&v12 lastSheetIndex:&v11];

  id v7 = objc_loadWeakRetained((id *)&self->super.mWorkbook);
  uint64_t v8 = [v7 sheetAtIndex:v12 loadIfNeeded:1];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (id)worksheetsFromLinkReferenceIndex:(unsigned int)a3
{
  BOOL v5 = [MEMORY[0x263EFF980] array];
  unint64_t v14 = -1;
  unint64_t v15 = -1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  id v7 = [WeakRetained links];
  [v7 convertLinkReferenceIndex:a3 firstSheetIndex:&v15 lastSheetIndex:&v14];

  unint64_t v8 = v15;
  if (v15 > v14)
  {
LABEL_5:
    id v12 = v5;
  }
  else
  {
    p_mWorkbook = &self->super.mWorkbook;
    while (1)
    {
      id v10 = objc_loadWeakRetained((id *)p_mWorkbook);
      uint64_t v11 = [v10 sheetAtIndex:v15 loadIfNeeded:1];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      [v5 addObject:v11];

      if (++v8 > v14) {
        goto LABEL_5;
      }
    }

    id v12 = 0;
  }

  return v12;
}

- (BOOL)cleanName:(unsigned int)a3 nameIndex:(unsigned int)a4 sheetIndex:(unint64_t)a5 tokenOffset:(int *)a6
{
  uint64_t v7 = *(void *)&a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  id v10 = [WeakRetained names];
  uint64_t v11 = [v10 objectAtIndex:v7];

  uint64_t v12 = [v11 sheetIndex];
  if (v12 != a5 && v12 != 0)
  {
    unsigned __int16 v22 = objc_msgSend(v11, "nameString", a6);
    int v23 = [v22 string];
    [(EPFormulaCleaner *)self reportWarning:8 parameter:v23];
LABEL_29:

    goto LABEL_30;
  }
  unsigned __int16 v22 = [v11 formula];
  if ([v11 isInternalFunction] && !objc_msgSend(v22, "tokenCount"))
  {
LABEL_35:
    BOOL v29 = 1;
    goto LABEL_31;
  }
  mNameArrayedTestCache = self->mNameArrayedTestCache;
  if (!mNameArrayedTestCache)
  {
    unint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    unsigned int v16 = self->mNameArrayedTestCache;
    self->mNameArrayedTestCache = v15;

    mNameArrayedTestCache = self->mNameArrayedTestCache;
  }
  unsigned int v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", (v7 + 1), a6);
  unsigned int v18 = [(NSMutableDictionary *)mNameArrayedTestCache objectForKey:v17];
  int v19 = [v18 unsignedLongValue];

  if (v19)
  {
    uint64_t v20 = (v19 - 1);
    if (v19 != 1)
    {
LABEL_12:
      int v23 = [v11 nameString];
      int v21 = [v23 string];
      [(EPFormulaCleaner *)self reportWarning:v20 parameter:v21];
LABEL_28:

      goto LABEL_29;
    }
  }
  else
  {
    if (v22
      && [v22 isSupportedFormula]
      && ([v22 isContainsRelativeReferences] & 1) == 0
      && [v22 tokenTypeAtIndex:0])
    {
      if ([v22 tokenCount] < 2)
      {
        uint64_t v20 = 0;
      }
      else
      {
        int v24 = [MEMORY[0x263EFF9C0] set];
        BOOL v25 = [(EPFormulaCleaner *)self isArrayedFormulaSupported:v22 allowSimpleRanges:1 formulasBeingEvaluated:v24];

        if (v25) {
          uint64_t v20 = 0;
        }
        else {
          uint64_t v20 = 9;
        }
      }
    }
    else
    {
      uint64_t v20 = 9;
    }
    int v26 = self->mNameArrayedTestCache;
    uint64_t v27 = [NSNumber numberWithInt:(v20 + 1)];
    BOOL v28 = [NSNumber numberWithUnsignedInt:(v7 + 1)];
    [(NSMutableDictionary *)v26 setObject:v27 forKey:v28];

    if (v20) {
      goto LABEL_12;
    }
  }
  if ([(EPFormulaCleaner *)self doesNameIndexContainCircularReferences:v7 sheetIndex:a5 previousNameIndexes:0]|| ![(EDFormula *)self->mTokensToClean replaceTokenAtIndex:a3 withFormula:v22])
  {
    int v23 = [v11 nameString];
    int v21 = [v23 string];
    [(EPFormulaCleaner *)self reportWarning:9 parameter:v21];
    goto LABEL_28;
  }
  if ([(EDFormula *)self->mTokensToClean tokenCount] < 0x7D1)
  {
    if (*v32 >= 1) {
      --*v32;
    }
    [(EPFormulaCleaner *)self applyMaxCellsInName:v11];
    -[EDFormula updateContainsRelativeReferences:](self->mFormula, "updateContainsRelativeReferences:", [v22 isContainsRelativeReferences]);
    -[EDFormula updateCleanedWithEvaluationStack:](self->mFormula, "updateCleanedWithEvaluationStack:", [v22 isCleanedWithEvaluationStack]);
    goto LABEL_35;
  }
  [(EPFormulaCleaner *)self reportWarning:10];
LABEL_30:
  BOOL v29 = 0;
LABEL_31:

  return v29;
}

- (BOOL)checkCustomFunction:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(EPFormulaCleaner *)self useEvaluationStackToGetParameter:0 tokenIndex:*(void *)&a3];
  if (v5 == -1) {
    return 1;
  }
  uint64_t v6 = v5;
  int v7 = [(EDFormula *)self->mTokensToClean tokenTypeAtIndex:v5];
  if (v7 != 57 && v7 != 121 && v7 != 89) {
    return 1;
  }
  int v22 = 0;
  unint64_t v8 = [(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:v6 length:&v22];
  uint64_t v9 = *(unsigned __int16 *)v8;
  unint64_t v10 = *((unsigned __int16 *)v8 + 1);
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  uint64_t v12 = [WeakRetained links];

  BOOL v13 = [v12 referenceAtIndex:v9];
  unint64_t v14 = objc_msgSend(v12, "linkAtIndex:", objc_msgSend(v13, "linkIndex"));
  unint64_t v15 = v14;
  if (v14 && ([v14 type] == 3 || objc_msgSend(v15, "type") == 2))
  {
    unsigned int v16 = [v15 externalNames];
    if ([v16 count] <= v10)
    {
      BOOL v20 = 1;
    }
    else
    {
      unsigned int v17 = [v16 objectAtIndex:v10];
      unsigned int v18 = [v17 string];
      int v19 = [v18 uppercaseString];

      if ([v19 isEqualToString:@"CONVERT"]
        && ([(EDFormula *)self->mTokensToClean updateCleanedWithEvaluationStack:1], ![(EPFormulaCleaner *)self useEvaluationStackToCheckFunctionId:255 functionName:v19 tokenIndex:v3]))
      {
        [(EPFormulaCleaner *)self reportWarning:11 parameter:v19];
        BOOL v20 = 0;
      }
      else
      {
        BOOL v20 = 1;
      }
    }
  }
  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

- (void)updateWorksheet:(id)a3 row:(int)a4 column:(int)a5 inDictionary:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v11 = a3;
  id v9 = a6;
  unint64_t v10 = [v9 objectForKey:v11];
  if (!v10)
  {
    unint64_t v10 = +[EDReference reference];
    [v9 setObject:v10 forUncopiedKey:v11];
  }
  [v10 unionWithRow:v8 column:v7];
}

- (BOOL)useEvaluationStackToCheckFunctionId:(int)a3 functionName:(id)a4 tokenIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = v8;
  id v10 = 0;
  BOOL v11 = 1;
  char v32 = 1;
  if (a3 <= 147)
  {
    if ((a3 - 76) >= 2)
    {
      if (a3 == 111)
      {
        id v10 = [(EPFormulaCleaner *)self useEvaluationStackToGetParameter:0 tokenIndex:v5 allReferencesAllowed:0 success:&v32];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          BOOL v11 = (int)[v10 intValue] < 127;
          goto LABEL_68;
        }
      }
      else
      {
        if (a3 != 121) {
          goto LABEL_68;
        }
        id v10 = [(EPFormulaCleaner *)self useEvaluationStackToGetParameter:0 tokenIndex:v5 allReferencesAllowed:0 success:&v32];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v10;
          if ([v10 length])
          {
            uint64_t v12 = objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 0, 127);
            uint64_t v13 = [v10 rangeOfCharacterFromSet:v12];
            uint64_t v15 = v14;

            if (v13) {
              BOOL v11 = 0;
            }
            else {
              BOOL v11 = v15 == [v10 length];
            }

            goto LABEL_68;
          }
          goto LABEL_54;
        }
      }
LABEL_67:
      BOOL v11 = v32 != 0;
      goto LABEL_68;
    }
    goto LABEL_22;
  }
  if (a3 > 254)
  {
    if (a3 != 255)
    {
      if (a3 != 347) {
        goto LABEL_68;
      }
LABEL_22:
      id v10 = [(EPFormulaCleaner *)self useEvaluationStackToGetParameter:0 tokenIndex:v5 allReferencesAllowed:1 success:&v32];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_67;
      }
      id v10 = v10;
      if (!isRowReference([v10 firstColumn], objc_msgSend(v10, "lastColumn"))
        && !isColumnReference([v10 firstRow], objc_msgSend(v10, "lastRow")))
      {
LABEL_54:
        id v23 = v10;
LABEL_55:

        id v10 = v23;
        goto LABEL_67;
      }

LABEL_51:
      BOOL v11 = 0;
      goto LABEL_68;
    }
    if (![v8 isEqualToString:@"CONVERT"])
    {
      id v10 = 0;
      goto LABEL_67;
    }
    char v31 = 0;
    char v30 = 0;
    id v10 = [(EPFormulaCleaner *)self useEvaluationStackToGetParameter:2 tokenIndex:v5 allReferencesAllowed:0 success:&v31];
    BOOL v20 = [(EPFormulaCleaner *)self useEvaluationStackToGetParameter:3 tokenIndex:v5 allReferencesAllowed:0 success:&v30];
    if (v31) {
      BOOL v21 = v30 == 0;
    }
    else {
      BOOL v21 = 1;
    }
    char v22 = !v21;
    char v32 = v22;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ([v10 isEqualToString:@"Pica"] & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ([v20 isEqualToString:@"Pica"] & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || ([v10 isEqualToString:@"p"] & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || ([v20 isEqualToString:@"p"] & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || ([v10 isEqualToString:@"at"] & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || ([v20 isEqualToString:@"at"] & 1) == 0)
              {

                id v23 = 0;
                goto LABEL_55;
              }
            }
          }
        }
      }
    }

LABEL_50:
    id v10 = 0;
    goto LABEL_51;
  }
  if (a3 != 148)
  {
    if (a3 != 219) {
      goto LABEL_68;
    }
    uint64_t v16 = [(EPFormulaCleaner *)self useEvaluationStackToGetParameter:4 tokenIndex:v5];
    if (v16 == -1 || [(EDFormula *)self->mTokensToClean tokenTypeAtIndex:v16] == 22)
    {
      id v10 = [(EPFormulaCleaner *)self useEvaluationStackToGetParameter:3 tokenIndex:v5 allReferencesAllowed:0 success:&v32];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v17 = [v10 BOOLValue];
        if (v32) {
          char v18 = v17;
        }
        else {
          char v18 = 0;
        }
        if ((v18 & 1) == 0) {
          goto LABEL_51;
        }
      }
      else if (!v32)
      {
        goto LABEL_51;
      }
      uint64_t v27 = [(EPFormulaCleaner *)self useEvaluationStackToGetParameter:2 tokenIndex:v5 allReferencesAllowed:0 success:&v32];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v11 = (int)[v27 intValue] < 5;
        id v10 = v27;
        goto LABEL_68;
      }
      id v10 = v27;
      goto LABEL_67;
    }
    goto LABEL_50;
  }
  int v19 = [(EPFormulaCleaner *)self useEvaluationStackToGetParameterTokenType:0 tokenIndex:v5 success:&v32];
  id v10 = 0;
  if (v19 <= 35)
  {
    BOOL v11 = 0;
    if (v19 == 8 || v19 == 23) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }
  if (v19 != 36 && v19 != 68) {
    goto LABEL_67;
  }
  unsigned __int8 v29 = 1;
  uint64_t v24 = [(EPFormulaCleaner *)self useEvaluationStackToGetParameter:0 tokenIndex:v5 allReferencesAllowed:0 success:&v29];
  BOOL v25 = (void *)v24;
  int v26 = v29;
  if (v29 && v24)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v26 = [v25 rangeOfString:@"!"] == 0x7FFFFFFFFFFFFFFFLL;
      unsigned __int8 v29 = v26;
    }
    else
    {
      int v26 = v29;
    }
  }
  BOOL v11 = v26 != 0;

  id v10 = 0;
LABEL_68:

  return v11;
}

- (int)useEvaluationStackToGetParameterTokenType:(unsigned int)a3 tokenIndex:(unsigned int)a4 success:(BOOL *)a5
{
  *a5 = 1;
  uint64_t v7 = [(EPFormulaCleaner *)self useEvaluationStackToGetParameter:*(void *)&a3 tokenIndex:*(void *)&a4];
  if (v7 == -1)
  {
    *a5 = 0;
    return 0;
  }
  else
  {
    uint64_t v8 = v7;
    mTokensToClean = self->mTokensToClean;
    return [(EDFormula *)mTokensToClean tokenTypeAtIndex:v8];
  }
}

- (id)useEvaluationStackToGetParameter:(unsigned int)a3 tokenIndex:(unsigned int)a4 allReferencesAllowed:(BOOL)a5 success:(BOOL *)a6
{
  *a6 = 1;
  uint64_t v9 = [(EPFormulaCleaner *)self useEvaluationStackToGetParameter:*(void *)&a3 tokenIndex:*(void *)&a4];
  if (v9 == -1
    || (uint64_t v10 = v9, [(EDFormula *)self->mTokensToClean tokenTypeAtIndex:v9] == 22))
  {
LABEL_3:
    BOOL v11 = 0;
    goto LABEL_6;
  }
  int v35 = 0;
  int v12 = [(EDFormula *)self->mTokensToClean tokenTypeAtIndex:v10];
  BOOL v11 = 0;
  switch(v12)
  {
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 33:
    case 34:
    case 65:
    case 66:
    case 97:
    case 98:
      goto LABEL_5;
    case 22:
    case 24:
    case 26:
    case 27:
    case 28:
    case 32:
    case 35:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 67:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 99:
      goto LABEL_6;
    case 23:
      OcTextFromPtgStrBuffer = extractOcTextFromPtgStrBuffer((unsigned __int8 *)[(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:v10 length:&v35]);
      BOOL v11 = [NSString stringWithOcText:OcTextFromPtgStrBuffer];
      if (OcTextFromPtgStrBuffer) {
        (*((void (**)(OcText *))OcTextFromPtgStrBuffer->var0 + 1))(OcTextFromPtgStrBuffer);
      }
      goto LABEL_6;
    case 25:
      if ((*(_WORD *)[(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:v10 length:&v35] & 0x10) == 0)goto LABEL_3; {
      goto LABEL_5;
      }
    case 29:
      uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", *-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", v10, &v35) != 0);
      goto LABEL_30;
    case 30:
      uint64_t v20 = objc_msgSend(NSNumber, "numberWithInt:", *(unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", v10, &v35));
      goto LABEL_30;
    case 31:
      id v23 = [(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:v10 length:&v35];
      uint64_t v20 = [NSNumber numberWithDouble:*(double *)v23];
      goto LABEL_30;
    case 36:
    case 68:
    case 100:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_5;
      }
      *(_DWORD *)&v33[4] = 0;
      unsigned int v34 = 0;
      v33[0] = 0;
      v32[0] = 0;
      extractDataFromPtgRefBuffer((unsigned __int16 *)[(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:v10 length:&v35], (int *)&v34, v33, (int *)&v33[4], v32);
      [(EPFormulaCleaner *)self addOffsetsToRow:&v34 rowRelative:v33[0] column:&v33[4] columnRelative:v32[0]];
      uint64_t v14 = [(EDSheet *)self->mCurrentSheet rowBlocks];
      uint64_t v15 = (EDCellHeader *)[v14 cellWithRowNumber:v34 columnNumber:*(unsigned int *)&v33[4]];
      goto LABEL_19;
    case 37:
    case 69:
    case 101:
      if (!a5) {
        goto LABEL_5;
      }
      unsigned int v34 = 0;
      *(void *)unsigned __int16 v33 = 0;
      *(_DWORD *)char v32 = 0;
      v29[0] = 0;
      *(_WORD *)char v31 = 0;
      BOOL v30 = 0;
      extractDataFromPtgAreaBuffer((unsigned __int16 *)[(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:v10 length:&v35], (int *)&v34, v29, (int *)&v33[4], &v31[1], (int *)v33, v31, (int *)v32, &v30);
      [(EPFormulaCleaner *)self addOffsetsToRow:&v34 rowRelative:v29[0] column:v33 columnRelative:v31[0]];
      [(EPFormulaCleaner *)self addOffsetsToRow:&v33[4] rowRelative:v31[1] column:v32 columnRelative:v30];
      uint64_t v17 = *(unsigned int *)&v33[4];
      uint64_t v16 = v34;
      uint64_t v19 = *(unsigned int *)v32;
      uint64_t v18 = *(unsigned int *)v33;
      goto LABEL_17;
    case 58:
    case 90:
      goto LABEL_18;
    case 59:
    case 91:
      goto LABEL_15;
    default:
      if (v12 == 122)
      {
LABEL_18:
        unsigned int v34 = 0;
        *(void *)unsigned __int16 v33 = 0;
        v32[0] = 0;
        v29[0] = 0;
        extractDataFromPtgRef3DBuffer((unsigned __int16 *)[(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:v10 length:&v35], &v34, (int *)&v33[4], v32, (int *)v33, v29);
        [(EPFormulaCleaner *)self addOffsetsToRow:&v33[4] rowRelative:v32[0] column:v33 columnRelative:v29[0]];
        BOOL v21 = [(EPFormulaCleaner *)self worksheetFromLinkReferenceIndex:v34];
        uint64_t v14 = [v21 rowBlocks];
        uint64_t v15 = (EDCellHeader *)[v14 cellWithRowNumber:*(unsigned int *)&v33[4] columnNumber:*(unsigned int *)v33];

LABEL_19:
        BOOL v11 = 0;
        if (!v15 || a5) {
          goto LABEL_38;
        }
        if (formulaIndexForEDCell(v15) != -1) {
          goto LABEL_22;
        }
        unsigned int v24 = typeForEDCell(v15);
        switch(v24)
        {
          case 3u:
            id WeakRetained = (EDResources *)objc_loadWeakRetained((id *)&self->super.mResources);
            uint64_t v27 = stringValueForEDCell(v15, WeakRetained);
            BOOL v11 = [v27 string];

            goto LABEL_38;
          case 2u:
            uint64_t v25 = [NSNumber numberWithDouble:numberValueForEDCell(v15)];
            break;
          case 1u:
            uint64_t v25 = [NSNumber numberWithBool:BOOLValueForEDCell((BOOL)v15)];
            break;
          default:
LABEL_22:
            BOOL v11 = 0;
            *a6 = 0;
LABEL_38:
            [v14 unlock];

            goto LABEL_6;
        }
        BOOL v11 = (void *)v25;
        goto LABEL_38;
      }
      if (v12 == 123)
      {
LABEL_15:
        if (a5)
        {
          unsigned int v34 = 0;
          *(void *)unsigned __int16 v33 = 0;
          *(_DWORD *)char v32 = 0;
          *(_DWORD *)unsigned __int8 v29 = 0;
          *(_WORD *)char v31 = 0;
          BOOL v30 = 0;
          BOOL v28 = 0;
          extractDataFromPtgArea3DBuffer((unsigned __int16 *)[(EDFormula *)self->mTokensToClean lastExtendedDataForTokenAtIndex:v10 length:&v35], &v34, (int *)&v33[4], &v31[1], (int *)v33, v31, (int *)v32, &v30, (int *)v29, &v28);
          [(EPFormulaCleaner *)self addOffsetsToRow:&v33[4] rowRelative:v31[1] column:v32 columnRelative:v30];
          [(EPFormulaCleaner *)self addOffsetsToRow:v33 rowRelative:v31[0] column:v29 columnRelative:v28];
          uint64_t v17 = *(unsigned int *)v33;
          uint64_t v16 = *(unsigned int *)&v33[4];
          uint64_t v18 = *(unsigned int *)v32;
          uint64_t v19 = *(unsigned int *)v29;
LABEL_17:
          uint64_t v20 = +[EDReference referenceWithFirstRow:v16 lastRow:v17 firstColumn:v18 lastColumn:v19];
LABEL_30:
          BOOL v11 = (void *)v20;
        }
        else
        {
LABEL_5:
          BOOL v11 = 0;
          *a6 = 0;
        }
      }
LABEL_6:
      return v11;
  }
}

- (BOOL)isArrayedFormulaSupported:(id)a3 allowSimpleRanges:(BOOL)a4 formulasBeingEvaluated:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([v9 containsObject:v8])
  {
    BOOL v10 = 0;
    goto LABEL_41;
  }
  if (!v8)
  {
    BOOL v10 = 1;
    goto LABEL_41;
  }
  [v9 addObject:v8];
  id v32 = v9;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  while (2)
  {
    unsigned int v14 = [v8 tokenCount];
    if (v13 >= v14) {
      goto LABEL_40;
    }
    int v15 = [v8 tokenTypeAtIndex:v13];
    int v16 = v15;
    uint64_t v17 = 0;
    switch(v15)
    {
      case 1:
      case 2:
      case 46:
      case 47:
      case 57:
      case 78:
      case 79:
        goto LABEL_40;
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
        uint64_t v12 = 1;
        goto LABEL_33;
      case 15:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 36:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 58:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      case 68:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
        goto LABEL_33;
      case 16:
      case 17:
        if (!v6) {
          goto LABEL_40;
        }
        uint64_t v11 = 1;
        goto LABEL_33;
      case 33:
      case 65:
        goto LABEL_10;
      case 34:
      case 66:
LABEL_9:
        uint64_t v17 = 2;
LABEL_10:
        HIDWORD(v37) = 0;
        int v18 = *(unsigned __int16 *)([v8 lastExtendedDataForTokenAtIndex:v13 length:(char *)&v37 + 12]
                                  + 2 * v17);
        if (v18 != 78 && v18 != 148) {
          uint64_t v12 = 1;
        }
        if (v18 == 78 || v18 == 148) {
          goto LABEL_40;
        }
        goto LABEL_33;
      case 35:
      case 67:
LABEL_16:
        uint64_t v19 = v12;
        BOOL v20 = v6;
        uint64_t v21 = v11;
        HIDWORD(v37) = 0;
        uint64_t v22 = *(unsigned int *)[v8 lastExtendedDataForTokenAtIndex:v13 length:(char *)&v37 + 12];
        id v23 = self;
        id WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
        uint64_t v25 = [WeakRetained names];
        int v26 = [(id)v25 objectAtIndex:v22];

        uint64_t v27 = [v26 formula];
        LOBYTE(v25) = [(EPFormulaCleaner *)v23 isArrayedFormulaSupported:v27 allowSimpleRanges:0 formulasBeingEvaluated:v32];

        if (v25)
        {
          self = v23;
          uint64_t v11 = v21;
          BOOL v6 = v20;
          uint64_t v12 = v19;
LABEL_33:
          uint64_t v13 = (v13 + 1);
          continue;
        }
        LOBYTE(v11) = v21;
        LOBYTE(v12) = v19;
LABEL_40:
        BOOL v10 = (v13 >= v14) & (v12 & v11 ^ 1);
        id v9 = v32;
LABEL_41:

        return v10;
      case 37:
      case 45:
      case 59:
      case 69:
      case 77:
LABEL_20:
        long long v37 = 0uLL;
        *(_WORD *)v36 = 0;
        *(_WORD *)int v35 = 0;
        int v34 = 0;
        unsigned __int8 v29 = (unsigned __int16 *)[v8 lastExtendedDataForTokenAtIndex:v13 length:&v34];
        if (v16 == 59 || v16 == 123 || v16 == 91)
        {
          unsigned int v33 = 0;
          extractDataFromPtgArea3DBuffer(v29, &v33, (int *)&v37 + 3, &v36[1], (int *)&v37 + 2, v36, (int *)&v37 + 1, &v35[1], (int *)&v37, v35);
        }
        else
        {
          extractDataFromPtgAreaBuffer(v29, (int *)&v37 + 3, &v36[1], (int *)&v37 + 2, v36, (int *)&v37 + 1, &v35[1], (int *)&v37, v35);
        }
        if (__PAIR64__(HIDWORD(v37), v37) == *(void *)((char *)&v37 + 4) && v36[1] == v36[0])
        {
          uint64_t v30 = (v35[1] != v35[0]) | v11;
          if (v35[1] != v35[0] && !v6) {
            goto LABEL_40;
          }
        }
        else
        {
          if (!v6) {
            goto LABEL_40;
          }
          uint64_t v30 = 1;
        }
        uint64_t v11 = v30;
        goto LABEL_33;
      default:
        switch(v15)
        {
          case 'Y':
            goto LABEL_40;
          case 'Z':
          case '\\':
          case ']':
          case '^':
          case '_':
          case 'd':
            goto LABEL_33;
          case '[':
          case 'e':
            goto LABEL_20;
          case 'a':
            goto LABEL_10;
          case 'b':
            goto LABEL_9;
          case 'c':
            goto LABEL_16;
          default:
            if ((v15 - 109) > 0xE) {
              goto LABEL_33;
            }
            int v28 = 1 << (v15 - 109);
            if ((v28 & 0x4001) != 0) {
              goto LABEL_20;
            }
            if ((v28 & 0x1006) != 0) {
              goto LABEL_40;
            }
            goto LABEL_33;
        }
    }
  }
}

- (BOOL)doesNameIndexContainCircularReferences:(unsigned int)a3 sheetIndex:(unint64_t)a4 previousNameIndexes:(void *)a5
{
  mNameCircularReferenceTestCache = self->mNameCircularReferenceTestCache;
  if (!mNameCircularReferenceTestCache)
  {
    BOOL v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v11 = self->mNameCircularReferenceTestCache;
    self->mNameCircularReferenceTestCache = v10;

    mNameCircularReferenceTestCache = self->mNameCircularReferenceTestCache;
  }
  unsigned int v34 = a3 + 1;
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  uint64_t v13 = [(NSMutableDictionary *)mNameCircularReferenceTestCache objectForKey:v12];
  uint64_t v14 = [v13 unsignedLongValue];

  if (v14) {
    return v14 == 2;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  uint64_t v17 = [WeakRetained names];
  int v18 = [v17 objectAtIndex:a3];

  uint64_t v19 = [v18 sheetIndex];
  if (v19 != a4 && v19 != 0)
  {
    BOOL v15 = 0;
    int v28 = self->mNameCircularReferenceTestCache;
    unsigned __int8 v29 = NSNumber;
LABEL_23:
    uint64_t v30 = 1;
    goto LABEL_25;
  }
  uint64_t v21 = [v18 formula];
  uint64_t v22 = 0;
  id v23 = (uint64_t **)((char *)a5 + 8);
  while (1)
  {
    if (v22 >= [v21 tokenCount])
    {

      int v28 = self->mNameCircularReferenceTestCache;
      unsigned __int8 v29 = NSNumber;
      BOOL v15 = 0;
      goto LABEL_23;
    }
    int v24 = [v21 tokenTypeAtIndex:v22];
    if (v24 == 35 || v24 == 67 || v24 == 99) {
      break;
    }
    uint64_t v22 = (v22 + 1);
  }
  int v35 = 0;
  unsigned int v25 = *(_DWORD *)[v21 lastExtendedDataForTokenAtIndex:v22 length:&v35];
  if (!a5 || (int v26 = *v23) == 0) {
LABEL_21:
  }
    operator new();
  while (2)
  {
    unsigned int v27 = *((_DWORD *)v26 + 7);
    if (v25 < v27)
    {
LABEL_20:
      int v26 = (uint64_t *)*v26;
      if (!v26) {
        goto LABEL_21;
      }
      continue;
    }
    break;
  }
  if (v27 < v25)
  {
    ++v26;
    goto LABEL_20;
  }

  int v28 = self->mNameCircularReferenceTestCache;
  unsigned __int8 v29 = NSNumber;
  uint64_t v30 = 2;
  BOOL v15 = 1;
LABEL_25:
  char v31 = [v29 numberWithInt:v30];
  id v32 = [NSNumber numberWithUnsignedInt:v34];
  [(NSMutableDictionary *)v28 setObject:v31 forKey:v32];

  return v15;
}

@end