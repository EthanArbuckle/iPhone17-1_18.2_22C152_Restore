@interface CHDFormula
+ (CHDFormula)formulaWithReference:(id)a3;
+ (CHDFormula)formulaWithReferences:(id)a3;
- (BOOL)isConstantStringFormula;
- (CHDFormula)initWithReference:(id)a3;
- (CHDFormula)initWithReferences:(id)a3;
- (CHDFormula)initWithWorkbook:(id)a3;
- (id)constantValuesFromConstantStringFormula;
- (id)references;
- (id)referencesFromFormula;
- (unint64_t)countOfCellsBeingReferenced;
- (void)prepareTokens;
- (void)setReferences:(id)a3;
- (void)setWorkbook:(id)a3;
@end

@implementation CHDFormula

- (void)setWorkbook:(id)a3
{
}

- (id)references
{
  mReferences = self->mReferences;
  if (mReferences)
  {
LABEL_2:
    v3 = mReferences;
    goto LABEL_8;
  }
  if ([(EDFormula *)self isSupportedFormula] && [(EDFormula *)self isCleaned])
  {
    v5 = [(CHDFormula *)self referencesFromFormula];
    if ([v5 count])
    {
      [(CHDFormula *)self setReferences:v5];
    }
    else
    {
      [(EDFormula *)self removeAllTokens];
      [(EDFormula *)self setWarning:1];
    }

    mReferences = self->mReferences;
    goto LABEL_2;
  }
  v3 = 0;
LABEL_8:
  return v3;
}

- (id)referencesFromFormula
{
  if ([(EDFormula *)self isSupportedFormula] && [(EDFormula *)self tokenCount])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mWorkbook);
    v4 = [WeakRetained resources];
    v5 = [v4 links];

    v6 = +[EDReferenceCollection noCoalesceCollection];
    unsigned int v7 = [(EDFormula *)self tokenCount];
    if (v7)
    {
      uint64_t v8 = 0;
      do
      {
        int v9 = [(EDFormula *)self tokenTypeAtIndex:v8];
        if (v9 != 16)
        {
          int v20 = 0;
          unsigned int v21 = -1;
          int v18 = -1;
          int v19 = -1;
          int v16 = -1;
          int v17 = -1;
          if (v9 > 68)
          {
            if (v9 <= 99)
            {
              if (v9 == 69) {
                goto LABEL_25;
              }
              if (v9 != 90)
              {
                if (v9 != 91) {
                  goto LABEL_30;
                }
                goto LABEL_28;
              }
            }
            else
            {
              if (v9 <= 121)
              {
                if (v9 != 100)
                {
                  if (v9 == 101) {
                    goto LABEL_25;
                  }
                  goto LABEL_30;
                }
                goto LABEL_24;
              }
              if (v9 != 122)
              {
                if (v9 != 123) {
                  goto LABEL_30;
                }
                goto LABEL_28;
              }
            }
            goto LABEL_29;
          }
          if (v9 > 57)
          {
            if (v9 != 58)
            {
              if (v9 != 59)
              {
                if (v9 != 68) {
                  goto LABEL_30;
                }
                goto LABEL_24;
              }
LABEL_28:
              extractDataFromPtgArea3DBuffer((unsigned __int16 *)[(EDFormula *)self lastExtendedDataForTokenAtIndex:v8 length:&v20], &v21, &v19, &v17, &v18, &v16);
              goto LABEL_30;
            }
LABEL_29:
            extractDataFromPtgRef3DBuffer((unsigned __int16 *)[(EDFormula *)self lastExtendedDataForTokenAtIndex:v8 length:&v20], &v21, &v19, &v18);
            goto LABEL_30;
          }
          if (v9 > 35)
          {
            if (v9 != 36)
            {
              if (v9 != 37) {
                goto LABEL_30;
              }
LABEL_25:
              extractDataFromPtgAreaBuffer((unsigned __int16 *)[(EDFormula *)self lastExtendedDataForTokenAtIndex:v8 length:&v20], &v19, &v17, &v18, &v16);
LABEL_30:
              uint64_t v14 = 0;
              uint64_t v15 = 0;
              if ([v5 convertLinkReferenceIndex:v21 firstSheetIndex:&v15 lastSheetIndex:&v14]&& v15 == v14)
              {
                if (v17 < 0) {
                  int v17 = v19;
                }
                if (v16 < 0) {
                  int v16 = v18;
                }
                v10 = +[EDSheetReference referenceWithSheetIndex:firstRow:lastRow:firstColumn:lastColumn:](EDSheetReference, "referenceWithSheetIndex:firstRow:lastRow:firstColumn:lastColumn:");
                if ([v10 isValidAreaReference]) {
                  [v6 addObject:v10];
                }
              }
              goto LABEL_40;
            }
LABEL_24:
            extractDataFromPtgRefBuffer((unsigned __int16 *)[(EDFormula *)self lastExtendedDataForTokenAtIndex:v8 length:&v20], &v19, &v18);
            goto LABEL_30;
          }
          if (v9 != 21)
          {
            if (v9 == 23 || v9 == 30)
            {
              id v11 = 0;
              goto LABEL_50;
            }
            goto LABEL_30;
          }
        }
LABEL_40:
        uint64_t v8 = (v8 + 1);
      }
      while (v7 != v8);
    }
    if ([v6 count]) {
      v12 = v6;
    }
    else {
      v12 = 0;
    }
    id v11 = v12;
LABEL_50:
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

- (void)setReferences:(id)a3
{
  p_mReferences = &self->mReferences;
  v6 = (EDReferenceCollection *)a3;
  if (*p_mReferences != v6)
  {
    objc_storeStrong((id *)&self->mReferences, a3);
    if (*p_mReferences) {
      [(EDFormula *)self removeAllTokens];
    }
  }
}

- (unint64_t)countOfCellsBeingReferenced
{
  v2 = [(CHDFormula *)self references];
  unint64_t v3 = [v2 countOfCellsBeingReferenced];

  return v3;
}

+ (CHDFormula)formulaWithReferences:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithReferences:v3];

  return (CHDFormula *)v4;
}

- (CHDFormula)initWithReferences:(id)a3
{
  id v5 = a3;
  v6 = [(EDFormula *)self init];
  unsigned int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->mReferences, a3);
  }

  return v7;
}

+ (CHDFormula)formulaWithReference:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithReference:v3];

  return (CHDFormula *)v4;
}

- (CHDFormula)initWithReference:(id)a3
{
  id v4 = a3;
  id v5 = [(EDFormula *)self init];
  if (v5)
  {
    v6 = [(EDCollection *)[EDReferenceCollection alloc] initWithObject:v4];
    mReferences = v5->mReferences;
    v5->mReferences = v6;
  }
  return v5;
}

- (CHDFormula)initWithWorkbook:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CHDFormula;
  id v5 = [(EDFormula *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->mWorkbook, v4);
  }

  return v6;
}

- (void)prepareTokens
{
  mReferences = self->mReferences;
  if (!mReferences) {
    return;
  }
  if (![(EDCollection *)mReferences count])
  {
    id v35 = self->mReferences;
    self->mReferences = 0;
LABEL_47:

    return;
  }
  unint64_t v33 = [(EDCollection *)self->mReferences count];
  if (v33)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      int v9 = -[EDCollection objectAtIndex:](self->mReferences, "objectAtIndex:", v6, v33);
      if (v9)
      {
        id v34 = v9;
        int v10 = [v9 isCellReference];
        int v11 = [v34 isSheedIndexValid];
        v12 = v34;
        if (v10) {
          int v13 = 6;
        }
        else {
          int v13 = 10;
        }
        if (v10) {
          int v14 = 4;
        }
        else {
          int v14 = 8;
        }
        if (!v11) {
          int v13 = v14;
        }
        uint64_t v7 = (v13 + v7);
        uint64_t v5 = (v5 + 1);
        uint64_t v8 = (v8 + 1);
        if (v6) {
          int v15 = 2;
        }
        else {
          int v15 = 1;
        }
        uint64_t v4 = (v4 + v15);
      }
      else
      {
        v12 = 0;
      }

      ++v6;
    }
    while (v33 != v6);
    if (v4)
    {
      [(EDFormula *)self removeAllTokens];
      id WeakRetained = objc_loadWeakRetained((id *)&self->mWorkbook);
      int v17 = [WeakRetained resources];
      id v35 = [v17 links];

      [(EDFormula *)self setupTokensWithTokensCount:v4 tokensWithDataCount:v5 extendedDataLength:v7 extendedDataCount:v8];
      if (v33)
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          int v19 = [(EDCollection *)self->mReferences objectAtIndex:i];
          int v20 = v19;
          if (v19)
          {
            int v21 = [v19 firstRow];
            if (v21 == [v20 lastRow])
            {
              int v22 = [v20 firstColumn];
              BOOL v23 = v22 != [v20 lastColumn];
            }
            else
            {
              BOOL v23 = 1;
            }
            uint64_t v24 = [v20 sheetIndex];
            if ([v20 isSheedIndexValid]) {
              __int16 v25 = [v35 addOrEquivalentInternalLinkReferenceWithFirstSheetIndex:v24 lastSheetIndex:v24];
            }
            else {
              __int16 v25 = -1;
            }
            if ([v20 isSheedIndexValid])
            {
              if (v23)
              {
                v26 = [(EDFormula *)self addToken:59 extendedDataLength:10];
                v27 = v26;
                if (v26)
                {
                  *(_WORD *)v26 = v25;
                  *((_WORD *)v26 + 1) = [v20 firstRow];
                  *((_WORD *)v27 + 2) = [v20 lastRow];
                  *((_WORD *)v27 + 3) = [v20 firstColumn];
                  *((_WORD *)v27 + 4) = [v20 lastColumn];
                }
              }
              else
              {
                v29 = [(EDFormula *)self addToken:58 extendedDataLength:6];
                v30 = v29;
                if (v29)
                {
                  *(_WORD *)v29 = v25;
                  *((_WORD *)v29 + 1) = [v20 firstRow];
                  *((_WORD *)v30 + 2) = [v20 firstColumn];
                }
              }
            }
            else if (v23)
            {
              v28 = [(EDFormula *)self addToken:37 extendedDataLength:8];
              if (v28)
              {
                *(_WORD *)v28 = [v20 firstRow];
                *((_WORD *)v28 + 1) = [v20 lastRow];
                *((_WORD *)v28 + 2) = [v20 firstColumn];
                *((_WORD *)v28 + 3) = [v20 lastColumn];
              }
            }
            else
            {
              v31 = [(EDFormula *)self addToken:36 extendedDataLength:4];
              if (v31)
              {
                *(_WORD *)v31 = [v20 firstRow];
                *((_WORD *)v31 + 1) = [v20 firstColumn];
              }
            }
            if (i) {
              [(EDFormula *)self addToken:16 extendedDataLength:0];
            }
          }
        }
      }
      v32 = self->mReferences;
      self->mReferences = 0;

      goto LABEL_47;
    }
  }
}

- (BOOL)isConstantStringFormula
{
  unsigned int v3 = [(EDFormula *)self tokenCount];
  if (v3)
  {
    unsigned int v4 = v3;
    BOOL v5 = 0;
    int v6 = -v3;
    unsigned int v7 = 1;
    do
    {
      int v8 = [(EDFormula *)self tokenTypeAtIndex:v7 - 1];
      BOOL v9 = v8 == 16 || v8 == 23;
      if (!v9 && (v8 != 21 || v6 + v7)) {
        break;
      }
      BOOL v5 = v7++ >= v4;
    }
    while (v6 + v7 != 1);
  }
  else
  {
    return 0;
  }
  return v5;
}

- (id)constantValuesFromConstantStringFormula
{
  unsigned int v3 = [(EDFormula *)self tokenCount];
  if (v3)
  {
    unsigned int v4 = v3;
    uint64_t v5 = 0;
    int v6 = 0;
    while (1)
    {
      int v7 = [(EDFormula *)self tokenTypeAtIndex:v5];
      if (v7 != 16)
      {
        if (v7 != 23)
        {
          id v10 = 0;
          goto LABEL_14;
        }
        if (!v6)
        {
          int v6 = [MEMORY[0x263EFF980] array];
        }
        int v12 = 0;
        OcTextFromPtgStrBuffer = extractOcTextFromPtgStrBuffer((unsigned __int8 *)[(EDFormula *)self lastExtendedDataForTokenAtIndex:v5 length:&v12]);
        BOOL v9 = [NSString stringWithOcText:OcTextFromPtgStrBuffer];
        [v6 addObject:v9];

        if (OcTextFromPtgStrBuffer) {
          (*((void (**)(OcText *))OcTextFromPtgStrBuffer->var0 + 1))(OcTextFromPtgStrBuffer);
        }
      }
      uint64_t v5 = (v5 + 1);
      if (v4 == v5) {
        goto LABEL_12;
      }
    }
  }
  int v6 = 0;
LABEL_12:
  id v10 = v6;
  int v6 = v10;
LABEL_14:

  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mWorkbook);
  objc_storeStrong((id *)&self->mReferences, 0);
}

@end