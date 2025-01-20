@interface EBReaderState
- (BOOL)importCSV;
- (EBReaderState)initWithXlReader:(void *)a3 cancelDelegate:(id)a4;
- (id)columnWidthConvertor;
- (id)oaState;
- (void)dealloc;
- (void)pauseReading;
- (void)readGlobalXlObjects;
- (void)reportWarning:(id)a3;
- (void)resumeReading;
- (void)setImportCSV:(BOOL)a3;
- (void)xlReader;
- (void)xlSheetInfoTable;
@end

@implementation EBReaderState

- (void)xlReader
{
  return self->mXlReader;
}

- (id)oaState
{
  return self->mOAState;
}

- (void)readGlobalXlObjects
{
  if (self->mXlReader) {
    operator new();
  }
}

- (void)xlSheetInfoTable
{
  return self->mXlSheetInfoTable;
}

- (void)pauseReading
{
  id v2 = +[ESDObjectFactory threadLocalFactory];
  [v2 restoreHostEshFactory];
}

- (void)resumeReading
{
  id v3 = +[ESDObjectFactory threadLocalFactory];
  [v3 replaceHostEshFactoryWith:self->mXlEshObjectFactory];
}

- (id)columnWidthConvertor
{
  mColumnWidthConvertor = self->mColumnWidthConvertor;
  if (!mColumnWidthConvertor)
  {
    v4 = objc_alloc_init(ECColumnWidthConvertor);
    v5 = self->mColumnWidthConvertor;
    self->mColumnWidthConvertor = v4;

    v6 = self->mColumnWidthConvertor;
    v7 = [(EDResources *)self->super.mResources styles];
    v8 = [v7 defaultWorkbookStyle];
    v9 = [v8 font];
    [(ECColumnWidthConvertor *)v6 setupWithEDFont:v9 state:0];

    mColumnWidthConvertor = self->mColumnWidthConvertor;
  }
  return mColumnWidthConvertor;
}

- (void)dealloc
{
  mXlSheetInfoTable = self->mXlSheetInfoTable;
  if (mXlSheetInfoTable) {
    (*(void (**)(void *, SEL))(*(void *)mXlSheetInfoTable + 8))(mXlSheetInfoTable, a2);
  }
  self->mXlSheetInfoTable = 0;
  mXlEshObjectFactory = self->mXlEshObjectFactory;
  if (mXlEshObjectFactory) {
    (*((void (**)(XlEshObjectFactory *, SEL))mXlEshObjectFactory->var0 + 1))(mXlEshObjectFactory, a2);
  }
  self->mXlEshObjectFactory = 0;
  v5.receiver = self;
  v5.super_class = (Class)EBReaderState;
  [(EBState *)&v5 dealloc];
}

- (void)reportWarning:(id)a3
{
  id v5 = a3;
  v4 = [(EDWorkbook *)self->super.mWorkbook warnings];
  [v4 addWarning:v5];
}

- (EBReaderState)initWithXlReader:(void *)a3 cancelDelegate:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EBReaderState;
  v7 = [(EBState *)&v14 initWithCancelDelegate:v6];
  v8 = v7;
  if (v7)
  {
    v7->mXlReader = a3;
    v7->mXlSheetInfoTable = 0;
    v9 = (XlEshObjectFactory *)operator new(0x10uLL);
    XlEshObjectFactory::XlEshObjectFactory(v9);
    v8->mXlEshObjectFactory = v9;
    v10 = +[ESDObjectFactory threadLocalFactory];
    [v10 replaceHostEshFactoryWith:v8->mXlEshObjectFactory];

    v11 = [[EBOfficeArtReaderState alloc] initWithReaderState:v8];
    mOAState = v8->mOAState;
    v8->mOAState = &v11->super;

    v8->mImportCSV = 0;
  }

  return v8;
}

- (BOOL)importCSV
{
  return self->mImportCSV;
}

- (void)setImportCSV:(BOOL)a3
{
  self->mImportCSV = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOAState, 0);
  objc_storeStrong((id *)&self->mColumnWidthConvertor, 0);
}

@end