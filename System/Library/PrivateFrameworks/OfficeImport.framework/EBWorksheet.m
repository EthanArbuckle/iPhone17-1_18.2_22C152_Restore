@interface EBWorksheet
+ (void)readChildrenWithState:(id)a3;
+ (void)readSheetPresentationInfoWithState:(id)a3;
+ (void)readWithState:(id)a3;
+ (void)setupProcessors:(id)a3;
@end

@implementation EBWorksheet

+ (void)readWithState:(id)a3
{
  id v4 = a3;
  v5 = [v4 edSheet];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 processors];
    [a1 setupProcessors:v6];

    XlWorksheetProperties::XlWorksheetProperties((XlWorksheetProperties *)v13);
    uint64_t v7 = [v4 xlReader];
    (*(void (**)(uint64_t, _WORD *))(*(void *)v7 + 376))(v7, v13);
    if (v14 == -1)
    {
      v8 = [v4 readerState];
      v9 = [v8 columnWidthConvertor];
      LOWORD(v10) = v13[4];
      [v9 xlColumnWidthFromXlBaseColumnWidth:(double)v10];
      objc_msgSend(v5, "setDefaultColumnWidth:");
    }
    else
    {
      [v5 setDefaultColumnWidth:(double)v14 * 0.00390625];
    }
    [v5 setDefaultRowHeight:v15];
    [v5 setFitToPage:v19];
    if (v16) {
      uint64_t v11 = v16 - 1;
    }
    else {
      uint64_t v11 = 0;
    }
    [v5 setMaxRowOutlineLevel:v11];
    if (v17) {
      uint64_t v12 = v17 - 1;
    }
    else {
      uint64_t v12 = 0;
    }
    [v5 setMaxColumnOutlineLevel:v12];
    [v5 setIsDialogSheet:v18];
    XlWorksheetProperties::~XlWorksheetProperties((XlWorksheetProperties *)v13);
  }
}

+ (void)setupProcessors:(id)a3
{
  id v3 = a3;
  [v3 removeAllObjects];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
}

+ (void)readChildrenWithState:(id)a3
{
  id v4 = a3;
  +[EBColumnTable readWithState:](EBColumnTable, "readWithState:");
  +[EBRowBlocks readWithState:v4];
  +[EBGraphic readGraphicsWithState:v4];
  [a1 readSheetPresentationInfoWithState:v4];
  +[EBMergeTable readWithState:v4];
  +[EBConditionalFormatTable readWithState:v4];
  +[EBHyperlinkTable readWithState:v4];
}

+ (void)readSheetPresentationInfoWithState:(id)a3
{
  id v3 = a3;
  XlSheetPresentationTable::XlSheetPresentationTable((XlSheetPresentationTable *)v12);
  uint64_t v4 = [v3 xlReader];
  (*(void (**)(uint64_t, unsigned char *))(*(void *)v4 + 384))(v4, v12);
  if (((v14 - v13) & 0x7FFFFFFF8) != 0)
  {
    uint64_t v5 = XlConditionalFormatTable::at((XlConditionalFormatTable *)v12, 0);
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = *(void *)(v5 + 8);
      if (v7)
      {
        v8 = [v3 edSheet];
        +[EBPane readXlPaneFrom:v6 state:v3];
        [v8 setDisplayFormulas:*(unsigned __int8 *)(v7 + 24)];
        [v8 setDisplayGridlines:*(unsigned __int8 *)(v7 + 25)];
        uint64_t v9 = *(unsigned int *)(v7 + 16);
        if (+[EDColorsCollection isSystemColorId:(int)v9])
        {
          if (+[EDColorsCollection systemColorIdFromIndex:(int)v9])
          {
            uint64_t v9 = v9;
          }
          else
          {
            uint64_t v9 = 64;
          }
        }
        unint64_t v10 = [v3 resources];
        uint64_t v11 = +[EBColorReference edColorReferenceFromXlColorIndex:v9 edResources:v10];
        [v8 setDefaultGridlineColorReference:v11];
      }
    }
  }
  XlSheetPresentationTable::~XlSheetPresentationTable((XlSheetPresentationTable *)v12);
}

@end