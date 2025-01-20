@interface EBWorkbook
+ (id)readWithState:(id)a3 reader:(id)a4;
+ (int)xlSheetTypeEnumFromEDSheet:(id)a3;
+ (void)createSheetNamesFromWorkbook:(id)a3;
+ (void)readDocumentPresentation:(id)a3 state:(id)a4;
+ (void)readDocumentProperties:(id)a3 state:(id)a4;
+ (void)setupProcessors:(id)a3;
@end

@implementation EBWorkbook

+ (id)readWithState:(id)a3 reader:(id)a4
{
  id v35 = a3;
  id v6 = a4;
  v7 = [EDWorkbook alloc];
  v8 = [v6 fileName];
  v9 = -[EDWorkbook initWithFileName:andStringOptimization:](v7, "initWithFileName:andStringOptimization:", v8, [v6 useStringOptimization]);

  v10 = v35;
  [(OCDDocument *)v9 setReader:v6];
  v11 = [v6 temporaryDirectory];
  [(EDWorkbook *)v9 setTemporaryDirectory:v11];

  v12 = [(EDWorkbook *)v9 processors];
  [a1 setupProcessors:v12];

  +[TCProgressContext createStageWithSteps:@"read workbook globals" takingSteps:10.0 name:1.0];
  [v35 setWorkbook:v9];
  v13 = [(EDWorkbook *)v9 resources];
  [v35 setResources:v13];

  [a1 readDocumentProperties:v9 state:v35];
  [a1 readDocumentPresentation:v9 state:v35];
  +[TCProgressContext advanceProgress:1.0];
  +[EBFontTable readWithState:v35];
  +[EBContentFormatTable readWithState:v35];
  +[EBCellFormatTable readWithState:v35];
  +[TCProgressContext advanceProgress:2.0];
  v36 = &unk_26EBE2E20;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v14 = [v35 xlReader];
  (*(void (**)(uint64_t, void **))(*(void *)v14 + 352))(v14, &v36);
  if (((v38 - v37) & 0x7FFFFFFF8) != 0) {
    [v35 reportWarning:ECPivotTables];
  }
  +[EBColorTable readWithState:v35];
  +[TCProgressContext advanceProgress:1.0];
  [v35 readGlobalXlObjects];
  +[EBLinkTable readFromState:v35];
  +[EBNameTable readFromState:v35];
  +[TCProgressContext advanceProgress:1.0];
  +[EBStringTable readWithState:v35];
  +[TCProgressContext advanceProgress:3.0];
  if (*(int *)([v35 xlReader] + 200) >= 1)
  {
    v15 = +[EBEscher readRootObjectWithType:1 state:v35];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [v35 oaState];
      +[OABDrawingGroup readBlipsFromDrawingGroup:v15 toDocument:v9 state:v16];

      v17 = [(OCDDocument *)v9 theme];
      v18 = [v35 oaState];
      +[OABDrawingGroup readGraphicalDefaultsFromDrawingGroup:v15 toTheme:v17 state:v18];
    }
    v10 = v35;
  }
  +[TCProgressContext advanceProgress:1.0];
  unsigned int SheetCount = XlBinaryReader::getSheetCount((XlBinaryReader *)[v10 xlReader]);
  v20 = [v6 delegate];
  if (v20 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v20 readerDidStartDocument:v9 withElementCount:SheetCount];
  }
  if (SheetCount)
  {
    unint64_t v21 = 0;
    int v22 = 0;
    do
    {
      if ([v35 isCancelled]) {
        +[TCMessageException raiseUntaggedMessage:@"TCUserCancelled", 0];
      }
      +[EBSheet readSheetWithIndex:v21 state:v35];
      if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v23 = v9;
        v24 = [(EDWorkbook *)v9 sheetAtIndex:v21];
        v25 = v6;
        unsigned int v26 = [v6 isThumbnail];
        v27 = [v35 workbook];
        if (v21 >= SheetCount - 1) {
          uint64_t v28 = 1;
        }
        else {
          uint64_t v28 = v26;
        }
        [v20 readerDidReadElement:v24 atIndex:v21 inDocument:v27 isLastElement:v28];

        v22 |= [v24 isHidden] ^ 1;
        if (v22 & 1) != 0 && ([v25 isThumbnail])
        {

          id v6 = v25;
          v9 = v23;
          break;
        }

        id v6 = v25;
        v9 = v23;
      }
      ++v21;
    }
    while (SheetCount != v21);
  }
  +[TCProgressContext advanceProgress:1.0];
  +[TCProgressContext endStage];
  uint64_t v29 = [v35 xlReader];
  if ((*(uint64_t (**)(uint64_t))(*(void *)v29 + 88))(v29))
  {
    v30 = [(OCDDocument *)v9 summary];
    v31 = (void *)[v35 xlReader];
    if (v31) {
      v32 = (char *)v31 + *(void *)(*v31 - 24);
    }
    else {
      v32 = 0;
    }
    +[OCBSummary readSummary:v30 reader:v32];

    v33 = [(OCDDocument *)v9 theme];
    [v33 validateTheme];
  }
  if (v20 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v20 readerDidEndDocument:v9];
  }

  XlPivotInfoTable::~XlPivotInfoTable((XlPivotInfoTable *)&v36);
  return v9;
}

+ (void)setupProcessors:(id)a3
{
  id v3 = a3;
  [v3 removeAllObjects];
  [v3 addProcessorClass:objc_opt_class()];
}

+ (void)readDocumentProperties:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  XlDocumentProperties::XlDocumentProperties((XlDocumentProperties *)v17);
  uint64_t v7 = [v6 xlReader];
  (*(void (**)(uint64_t, unsigned char *))(*(void *)v7 + 152))(v7, v17);
  if (v18 == 1900) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [v5 setDateBase:v8];
  v9 = [v6 oaState];
  int v10 = [v9 useXmlBlobs];

  if (v10)
  {
    uint64_t v11 = v20;
    uint64_t v12 = v21;
    v13 = [v5 theme];
    uint64_t v14 = [v6 oaState];
    v15 = [v14 xmlDrawingState];
    +[OAXTheme readFromThemeData:v11 themeDataSize:v12 toTheme:v13 xmlDrawingState:v15];
  }
  if (v19[10])
  {
    v16 = +[EBReference edReferenceFromXlRef:v19];
    [v5 setVisibleRange:v16];
  }
  XlDocumentProperties::~XlDocumentProperties((XlDocumentProperties *)v17);
}

+ (void)readDocumentPresentation:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (*(unsigned char *)([v6 xlReader] + 1344))
  {
    [v5 setActiveSheetIndex:0];
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v7 = objc_msgSend(v6, "xlReader", &unk_26EBE25A0);
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v7 + 160))(v7, &v9);
    if (((v11 - v10) & 0x7FFFFFFF8) != 0)
    {
      uint64_t v8 = XlConditionalFormatTable::at((XlConditionalFormatTable *)&v9, 0);
      if (v8) {
        [v5 setActiveSheetIndex:*(__int16 *)(v8 + 8)];
      }
    }
    XlDocumentPresentationTable::~XlDocumentPresentationTable((XlDocumentPresentationTable *)&v9);
  }
}

+ (void)createSheetNamesFromWorkbook:(id)a3
{
  id v3 = a3;
  operator new();
}

+ (int)xlSheetTypeEnumFromEDSheet:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v4 = 2;
    }
    else {
      int v4 = 0;
    }
  }

  return v4;
}

@end