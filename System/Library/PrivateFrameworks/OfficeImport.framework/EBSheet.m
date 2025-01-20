@interface EBSheet
+ (Class)ebSheetClassFromEDSheet:(id)a3;
+ (Class)edSheetClassFromXlSheetTypeEnum:(int)a3;
+ (void)readDelayedSheetWithIndex:(unsigned int)a3 state:(id)a4;
+ (void)readSheetWithIndex:(unsigned int)a3 state:(id)a4;
@end

@implementation EBSheet

+ (void)readSheetWithIndex:(unsigned int)a3 state:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v18 = a4;
  v6 = (XlSheetInfoTable *)[v18 xlSheetInfoTable];
  v7 = (objc_class *)objc_msgSend(a1, "edSheetClassFromXlSheetTypeEnum:", XlSheetInfoTable::getSheetType(v6, v4));
  if (v7)
  {
    uint64_t v8 = *((void *)v6 + 1);
    if (((unint64_t)(*((void *)v6 + 2) - v8) >> 3) <= v4) {
      std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
    }
    uint64_t v9 = *(void *)(v8 + 8 * v4);
    id v10 = [v7 alloc];
    v11 = [v18 workbook];
    v12 = (void *)[v10 initWithWorkbook:v11];

    uint64_t v13 = *(void *)(v9 + 16);
    v14 = [v18 resources];
    v15 = +[EBString edStringFromXlString:v13 edResources:v14];
    [v12 setName:v15];

    objc_msgSend(v12, "setHidden:", XlSheetInfoTable::getSheetHiddenState(v6, v4) != 0);
    v16 = [[EBSheetContext alloc] initWithSheetIndex:v4 state:v18];
    [v12 setDelayedContext:v16];
    v17 = [v18 workbook];
    [v17 addSheet:v12];
  }
}

+ (Class)edSheetClassFromXlSheetTypeEnum:(int)a3
{
  v3 = objc_opt_class();
  return (Class)v3;
}

+ (void)readDelayedSheetWithIndex:(unsigned int)a3 state:(id)a4
{
  id v6 = a4;
  XlBinaryReader::setSheet((_DWORD *)[v6 xlReader], a3);
  v7 = [v6 readerState];
  XlFormulaProcessor::clearBaseFormulas((XlFormulaProcessor *)[v7 xlFormulaProcessor]);

  uint64_t v8 = [v6 edSheet];
  uint64_t v9 = (void *)[a1 ebSheetClassFromEDSheet:v8];

  [v9 readWithState:v6];
  +[EBPageProperties readWithState:v6];
  [v9 readChildrenWithState:v6];
  XlWorksheetProtection::XlWorksheetProtection((XlWorksheetProtection *)v12);
  uint64_t v10 = [v6 xlReader];
  (*(void (**)(uint64_t, _WORD *))(*(void *)v10 + 520))(v10, v12);
  if (v12[4] || v13)
  {
    v11 = [v6 readerState];
    [v11 reportWarning:ECPasswordProtectedSheet];
  }
}

+ (Class)ebSheetClassFromEDSheet:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v4 = objc_opt_class();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (Class)v4;
}

@end