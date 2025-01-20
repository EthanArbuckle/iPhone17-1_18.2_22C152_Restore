@interface EBFormula
+ (XlFormulaInfo)xlFormulaInfoFromEDFormula:(id)a3 state:(id)a4;
+ (XlFormulaInfo)xlFormulaInfoFromEDSharedFormula:(id)a3 state:(id)a4;
+ (char)edFormulaToParsedExpression:(id)a3 tokenLength:(unsigned __int16 *)a4 formulaLength:(unsigned __int16 *)a5 state:(id)a6;
+ (id)edFormulaFromXlFmlaDefinition:(const void *)a3 withFormulaLength:(int)a4 formulaClass:(Class)a5 state:(id)a6;
+ (id)edFormulaFromXlFmlaDefinition:(const void *)a3 withFormulaLength:(int)a4 state:(id)a5;
+ (id)edFormulaFromXlFmlaDefinition:(const void *)a3 withTokenLength:(int)a4 formulaLength:(int)a5 formulaClass:(Class)a6 edSheet:(id)a7 state:(id)a8;
+ (unsigned)writeToken:(id)a3 tokenIndex:(unsigned int)a4 tokenStream:(XLFormulaStream *)a5 extendedStream:(XLFormulaStream *)a6 state:(id)a7;
+ (void)readFormulaFromXlCell:(XlCell *)a3 edCell:(EDCellHeader *)a4 edRowBlocks:(id)a5 state:(id)a6;
+ (void)setupTokensInEDFormulaFromXlFormulaProcessor:(void *)a3 length:(int)a4 edFormula:(id)a5 edSheet:(id)a6;
@end

@implementation EBFormula

+ (void)setupTokensInEDFormulaFromXlFormulaProcessor:(void *)a3 length:(int)a4 edFormula:(id)a5 edSheet:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v12 = a5;
  id v9 = a6;
  [v12 setupTokensWithTokensCount:1 tokensWithDataCount:1 extendedDataLength:v7 extendedDataCount:1];
  XlFormulaProcessor::startTokenEnum((XlFormulaParser **)a3);
  while (1)
  {
    Token = XlFormulaProcessor::nextToken((XlFormulaParser **)a3);
    v11 = Token;
    if (!Token) {
      break;
    }
    if (Token->var1 == 28)
    {
      [v12 setWarning:1];
      [v12 removeAllTokens];
      XlPtg::~XlPtg(v11);
      MEMORY[0x23EC997B0]();
      break;
    }
    [v12 copyTokenFromXlPtg:Token];
    XlPtg::~XlPtg(v11);
    MEMORY[0x23EC997B0]();
  }
}

+ (void)readFormulaFromXlCell:(XlCell *)a3 edCell:(EDCellHeader *)a4 edRowBlocks:(id)a5 state:(id)a6
{
  v10 = (EDRowBlocks *)a5;
  id v11 = a6;
  if (!a3) {
    goto LABEL_21;
  }
  var8 = a3->var8;
  if (!var8) {
    goto LABEL_21;
  }
  int var1 = var8->var1;
  v14 = objc_opt_class();
  if (var1 == 1) {
    v14 = objc_opt_class();
  }
  v15 = [v14 formula];
  v16 = [v11 readerState];
  v17 = (XlFormulaProcessor *)[v16 xlFormulaProcessor];

  if (var8->var6) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = var8->var7 != 0;
  }
  unsigned __int16 v28 = -1;
  __int16 v27 = -1;
  if (var1 != 1) {
    goto LABEL_11;
  }
  XlFormulaProcessor::getShareBase(v17, var8, &v28, &v27);
  v19 = v15;
  BOOL v20 = v18;
  v21 = v19;
  BOOL v26 = v20;
  if (v20)
  {
    [(EDFormula *)v19 setRowBaseOrOffset:v28];
    [(EDFormula *)v21 setColumnBaseOrOffset:v27];

    BOOL v18 = v26;
LABEL_11:
    XlFormulaProcessor::setFormula((SsrwOOStream **)v17, (void **)var8->var3, var8->var5, (void **)var8->var4);
    if (var1 == 1) {
      XlFormulaProcessor::convertToRegularFormula(v17, var8, a3->var1, (unsigned __int16)a3->var2);
    }
    uint64_t var4 = var8->var4;
    v23 = [v11 edSheet];
    [a1 setupTokensInEDFormulaFromXlFormulaProcessor:v17 length:var4 edFormula:v15 edSheet:v23];

    XlFormulaProcessor::releaseFormula((XlFormulaParser **)v17);
    goto LABEL_15;
  }
  -[EDFormula setBaseFormulaIndex:](v19, "setBaseFormulaIndex:", [v11 sharedFormulaIndexForRowCol:v27 | (v28 << 16)]);
  [(EDFormula *)v21 setRowBaseOrOffset:a3->var1 - v28];
  [(EDFormula *)v21 setColumnBaseOrOffset:(a3->var2 - v27)];

  BOOL v18 = 0;
LABEL_15:
  setFormulaForEDCell(a4, v15, v10);
  if (var1 == 1 && v18)
  {
    uint64_t v25 = formulaIndexForEDCell(a4);
    [v11 setSharedFormulaIndex:v25 forRowCol:v27 | (v28 << 16)];
  }

LABEL_21:
}

+ (id)edFormulaFromXlFmlaDefinition:(const void *)a3 withFormulaLength:(int)a4 state:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = [a1 edFormulaFromXlFmlaDefinition:a3 withFormulaLength:v5 formulaClass:objc_opt_class() state:v8];

  return v9;
}

+ (id)edFormulaFromXlFmlaDefinition:(const void *)a3 withFormulaLength:(int)a4 formulaClass:(Class)a5 state:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = [v10 edSheet];
  id v12 = [v10 readerState];
  v13 = [a1 edFormulaFromXlFmlaDefinition:a3 withTokenLength:v7 formulaLength:v7 formulaClass:a5 edSheet:v11 state:v12];

  return v13;
}

+ (id)edFormulaFromXlFmlaDefinition:(const void *)a3 withTokenLength:(int)a4 formulaLength:(int)a5 formulaClass:(Class)a6 edSheet:(id)a7 state:(id)a8
{
  id v10 = *(void ***)&a5;
  id v14 = a7;
  id v15 = a8;
  v16 = v15;
  v17 = 0;
  if ((int)v10 >= a4 && a3 && a4 >= 1 && (int)v10 >= 1)
  {
    BOOL v18 = (SsrwOOStream **)[v15 xlFormulaProcessor];
    XlFormulaProcessor::setFormula(v18, (void **)a3, a4, v10);
    v17 = [(objc_class *)a6 formula];
    [a1 setupTokensInEDFormulaFromXlFormulaProcessor:v18 length:v10 edFormula:v17 edSheet:v14];
    XlFormulaProcessor::releaseFormula((XlFormulaParser **)v18);
  }

  return v17;
}

+ (XlFormulaInfo)xlFormulaInfoFromEDFormula:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
LABEL_10:
    id v10 = 0;
    goto LABEL_11;
  }
  id v8 = [v6 warning];

  if (v8)
  {
    id v9 = &ECUnsupportedExportFormula;
    if (!v7) {
      id v9 = &ECUnsupportedImportFormula;
    }
    +[TCMessageContext reportWarning:*v9];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ([v6 tokenCount]) {
      operator new();
    }
    goto LABEL_10;
  }
  id v10 = (XlFormulaInfo *)[a1 xlFormulaInfoFromEDSharedFormula:v6 state:v7];
LABEL_11:

  return v10;
}

+ (char)edFormulaToParsedExpression:(id)a3 tokenLength:(unsigned __int16 *)a4 formulaLength:(unsigned __int16 *)a5 state:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  *a4 = 0;
  *a5 = 0;
  unsigned int v12 = [v10 tokenCount];
  if (!v12) {
    goto LABEL_8;
  }
  uint64_t v13 = 0;
  v24 = &unk_26EBDB068;
  int v25 = 0;
  v22 = &unk_26EBDB068;
  int v23 = 0;
  do
    LODWORD(v13) = v13
                 + [a1 writeToken:v10 tokenIndex:v13 tokenStream:&v24 extendedStream:&v22 state:v11]+ 1;
  while (v13 < v12);
  __int16 v14 = v25;
  *a4 = v25;
  unsigned __int16 v15 = v23 + v14;
  *a5 = v15;
  if (v15)
  {
    v16 = (char *)operator new[](v15);
    uint64_t v17 = 0;
    v21[0] = &unk_26EBDB100;
    v21[1] = v16;
    BOOL v18 = &v16[*a4];
    v20[0] = &unk_26EBDB100;
    v20[1] = v18;
    do
      LODWORD(v17) = v17
                   + [a1 writeToken:v10 tokenIndex:v17 tokenStream:v21 extendedStream:v20 state:v11]+ 1;
    while (v17 < v12);
  }
  else
  {
LABEL_8:
    v16 = 0;
  }

  return v16;
}

+ (unsigned)writeToken:(id)a3 tokenIndex:(unsigned int)a4 tokenStream:(XLFormulaStream *)a5 extendedStream:(XLFormulaStream *)a6 state:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a7;
  if ([v12 tokenCount] <= v10)
  {
    unsigned int v18 = 0;
  }
  else
  {
    XlPtg::XlPtg(&v23);
    [v12 populateXlPtg:&v23 index:v10];
    if (v23.var1 == 38 || v23.var1 == 102 || v23.var1 == 70)
    {
      (*((void (**)(XLFormulaStream *, uint64_t))a5->var0 + 2))(a5, 4);
      LastExtendedData = XlPtg::getLastExtendedData(&v23);
      uint64_t v15 = (*((uint64_t (**)(XLFormulaStream *))a5->var0 + 8))(a5);
      (*((void (**)(XLFormulaStream *, uint64_t))a5->var0 + 2))(a5, 2);
      int v16 = *(unsigned __int16 *)LastExtendedData;
      if (*(_WORD *)LastExtendedData)
      {
        int v17 = *(unsigned __int16 *)LastExtendedData;
        do
        {
          uint64_t v10 = (v10 + 1);
          [a1 writeToken:v12 tokenIndex:v10 tokenStream:a5 extendedStream:a6 state:v13];
          --v17;
        }
        while (v17);
        unsigned int v18 = v16 + 1;
      }
      else
      {
        unsigned int v18 = 1;
      }
      __int16 v19 = (*(uint64_t (**)(uint64_t, XLFormulaStream *))(*(void *)v15 + 72))(v15, a5);
      (*(void (**)(uint64_t, void))(*(void *)v15 + 32))(v15, (unsigned __int16)(v19 - 2));
      (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
      [a1 writeToken:v12 tokenIndex:(v10 + 1) tokenStream:a5 extendedStream:a6 state:v13];
      uint64_t v20 = *((unsigned __int16 *)LastExtendedData + 1);
      (*((void (**)(XLFormulaStream *, uint64_t))a6->var0 + 4))(a6, v20);
      if (v20)
      {
        v21 = (unsigned __int16 *)(LastExtendedData + 10);
        do
        {
          (*((void (**)(XLFormulaStream *, void))a6->var0 + 4))(a6, *(v21 - 3));
          (*((void (**)(XLFormulaStream *, void))a6->var0 + 4))(a6, *(v21 - 2));
          (*((void (**)(XLFormulaStream *, void))a6->var0 + 4))(a6, *(v21 - 1));
          (*((void (**)(XLFormulaStream *, void))a6->var0 + 4))(a6, *v21);
          v21 += 4;
          --v20;
        }
        while (v20);
      }
    }
    else
    {
      unsigned int v18 = 0;
    }
    XlPtg::XlPtg(&v23);
    XlPtg::~XlPtg(&v23);
  }

  return v18;
}

+ (XlFormulaInfo)xlFormulaInfoFromEDSharedFormula:(id)a3 state:(id)a4
{
  return 0;
}

@end