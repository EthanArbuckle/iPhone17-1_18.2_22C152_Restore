@interface EBState
- (BOOL)isCancelled;
- (EBState)initWithCancelDelegate:(id)a3;
- (TCCancelDelegate)cancelDelegate;
- (id)resources;
- (id)workbook;
- (void)dealloc;
- (void)setResources:(id)a3;
- (void)setWorkbook:(id)a3;
- (void)sheetNames;
- (void)xlFormulaProcessor;
- (void)xlLinkTable;
- (void)xlNameTable;
@end

@implementation EBState

- (void)setWorkbook:(id)a3
{
}

- (void)setResources:(id)a3
{
  v5 = (EDResources *)a3;
  mResources = self->mResources;
  p_mResources = &self->mResources;
  if (mResources != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mResources, a3);
    v5 = v8;
  }
}

- (id)resources
{
  return self->mResources;
}

- (void)xlLinkTable
{
  return self->mXlLinkTable;
}

- (void)xlNameTable
{
  return self->mXlNameTable;
}

- (BOOL)isCancelled
{
  return [(TCCancelDelegate *)self->mCancelDelegate isCancelled];
}

- (id)workbook
{
  return self->mWorkbook;
}

- (void)xlFormulaProcessor
{
  return self->mXlFormulaProcessor;
}

- (void)dealloc
{
  mXlLinkTable = self->mXlLinkTable;
  if (mXlLinkTable) {
    (*(void (**)(void *, SEL))(*(void *)mXlLinkTable + 8))(mXlLinkTable, a2);
  }
  self->mXlLinkTable = 0;
  mXlNameTable = self->mXlNameTable;
  if (mXlNameTable) {
    (*(void (**)(void *, SEL))(*(void *)mXlNameTable + 8))(mXlNameTable, a2);
  }
  self->mXlNameTable = 0;
  mXlFormulaProcessor = self->mXlFormulaProcessor;
  if (mXlFormulaProcessor) {
    (*(void (**)(void *, SEL))(*(void *)mXlFormulaProcessor + 8))(mXlFormulaProcessor, a2);
  }
  self->mXlFormulaProcessor = 0;
  mSheetNames = self->mSheetNames;
  if (mSheetNames)
  {
    v8 = (void **)self->mSheetNames;
    std::vector<OcText,ChAllocator<OcText>>::__destroy_vector::operator()[abi:ne180100](&v8);
    MEMORY[0x23EC997B0](mSheetNames, 0x20C40960023A9);
  }
  self->mSheetNames = 0;
  v7.receiver = self;
  v7.super_class = (Class)EBState;
  [(EBState *)&v7 dealloc];
}

- (TCCancelDelegate)cancelDelegate
{
  return self->mCancelDelegate;
}

- (EBState)initWithCancelDelegate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EBState;
  v6 = [(EBState *)&v9 init];
  objc_super v7 = (EBState *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 8) = 0u;
    objc_storeStrong((id *)v6 + 7, a3);
  }

  return v7;
}

- (void)sheetNames
{
  return self->mSheetNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCancelDelegate, 0);
  objc_storeStrong((id *)&self->mResources, 0);
  objc_storeStrong((id *)&self->mWorkbook, 0);
}

@end