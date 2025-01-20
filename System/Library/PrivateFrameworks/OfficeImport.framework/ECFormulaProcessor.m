@interface ECFormulaProcessor
+ (id)formulaStringForEDFormula:(id)a3 edWorksheet:(id)a4 xlFormulaProcessor:(void *)a5;
- (ECFormulaProcessor)init;
- (void)dealloc;
- (void)setupWithWorkbook:(id)a3;
- (void)setupWithWorkbook:(id)a3 xlNameTable:(void *)a4 sheetNames:(void *)a5 xlLinkTable:(void *)a6 lassoSyntax:(BOOL)a7;
- (void)sheetNamesFromWorkbook:(id)a3;
- (void)xlFormulaProcessorLasso;
- (void)xlFormulaProcessorXl;
@end

@implementation ECFormulaProcessor

- (ECFormulaProcessor)init
{
  v3.receiver = self;
  v3.super_class = (Class)ECFormulaProcessor;
  result = [(ECFormulaProcessor *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->mXlSheetNames = 0u;
    *(_OWORD *)&result->mXlNameTable = 0u;
    *(_OWORD *)&result->mXlFormulaProcessorLasso = 0u;
  }
  return result;
}

- (void)dealloc
{
  mXlFormulaProcessorLasso = self->mXlFormulaProcessorLasso;
  if (mXlFormulaProcessorLasso) {
    (*(void (**)(void *, SEL))(*(void *)mXlFormulaProcessorLasso + 8))(mXlFormulaProcessorLasso, a2);
  }
  self->mXlFormulaProcessorLasso = 0;
  mXlFormulaProcessorXl = self->mXlFormulaProcessorXl;
  if (mXlFormulaProcessorXl) {
    (*(void (**)(void *, SEL))(*(void *)mXlFormulaProcessorXl + 8))(mXlFormulaProcessorXl, a2);
  }
  self->mXlFormulaProcessorXl = 0;
  mXlNameTable = self->mXlNameTable;
  if (mXlNameTable) {
    (*(void (**)(void *, SEL))(*(void *)mXlNameTable + 8))(mXlNameTable, a2);
  }
  self->mXlNameTable = 0;
  mLassoSheetNames = self->mLassoSheetNames;
  if (mLassoSheetNames)
  {
    v10 = (void **)self->mLassoSheetNames;
    std::vector<OcText,ChAllocator<OcText>>::__destroy_vector::operator()[abi:ne180100](&v10);
    MEMORY[0x23EC997B0](mLassoSheetNames, 0x20C40960023A9);
  }
  self->mLassoSheetNames = 0;
  mXlSheetNames = self->mXlSheetNames;
  if (mXlSheetNames)
  {
    v10 = (void **)self->mXlSheetNames;
    std::vector<OcText,ChAllocator<OcText>>::__destroy_vector::operator()[abi:ne180100](&v10);
    MEMORY[0x23EC997B0](mXlSheetNames, 0x20C40960023A9);
  }
  self->mXlSheetNames = 0;
  mXlLinkTable = self->mXlLinkTable;
  if (mXlLinkTable) {
    (*(void (**)(void *, SEL))(*(void *)mXlLinkTable + 8))(mXlLinkTable, a2);
  }
  self->mXlLinkTable = 0;
  v9.receiver = self;
  v9.super_class = (Class)ECFormulaProcessor;
  [(ECFormulaProcessor *)&v9 dealloc];
}

- (void)setupWithWorkbook:(id)a3
{
  id v8 = a3;
  v4 = [v8 resources];
  v5 = [v4 names];
  self->mXlNameTable = +[EBNameTable createXlNameTableFromNamesCollection:v5 state:0];

  v6 = [v4 links];
  self->mXlLinkTable = +[EBLinkTable createXlLinkTableFromLinksCollection:v6 workbook:v8 state:0];

  v7 = [v8 mappingContext];
  self->mLassoSheetNames = (void *)[v7 mappedSheetNames];

  self->mXlSheetNames = [(ECFormulaProcessor *)self sheetNamesFromWorkbook:v8];
  self->mXlFormulaProcessorLasso = [(ECFormulaProcessor *)self setupWithWorkbook:v8 xlNameTable:self->mXlNameTable sheetNames:self->mLassoSheetNames xlLinkTable:self->mXlLinkTable lassoSyntax:1];
  self->mXlFormulaProcessorXl = [(ECFormulaProcessor *)self setupWithWorkbook:v8 xlNameTable:self->mXlNameTable sheetNames:self->mXlSheetNames xlLinkTable:self->mXlLinkTable lassoSyntax:0];
}

- (void)xlFormulaProcessorLasso
{
  return self->mXlFormulaProcessorLasso;
}

- (void)xlFormulaProcessorXl
{
  return self->mXlFormulaProcessorXl;
}

+ (id)formulaStringForEDFormula:(id)a3 edWorksheet:(id)a4 xlFormulaProcessor:(void *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!a5) {
    goto LABEL_9;
  }
  if ([v7 isSharedFormula] && (objc_msgSend(v7, "isBaseFormula") & 1) == 0)
  {
    id v11 = v7;
    __int16 v9 = [v11 rowBaseOrOffset];
    __int16 v10 = [v11 columnBaseOrOffset];
    v12 = [v8 rowBlocks];
    id v7 = [v11 baseFormulaWithRowBlocks:v12];

    [v12 unlock];
  }
  else
  {
    __int16 v9 = 0;
    __int16 v10 = 0;
  }
  v13 = (void **)[v7 xlPtgs];
  v17 = v13;
  if (v13 && (v14 = XlFormulaProcessor::toString((uint64_t)a5, (uint64_t *)v13, v9, v10), clearXlPtgs(&v17), v14))
  {
    v15 = [NSString stringWithOcText:v14];
    (*((void (**)(OcText *))v14->var0 + 1))(v14);
  }
  else
  {
LABEL_9:
    v15 = 0;
  }

  return v15;
}

- (void)setupWithWorkbook:(id)a3 xlNameTable:(void *)a4 sheetNames:(void *)a5 xlLinkTable:(void *)a6 lassoSyntax:(BOOL)a7
{
}

- (void)sheetNamesFromWorkbook:(id)a3
{
  id v3 = a3;
  operator new();
}

@end