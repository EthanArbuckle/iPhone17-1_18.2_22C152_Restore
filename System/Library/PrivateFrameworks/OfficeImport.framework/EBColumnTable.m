@interface EBColumnTable
+ (void)readWithState:(id)a3;
@end

@implementation EBColumnTable

+ (void)readWithState:(id)a3
{
  id v3 = a3;
  v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  v14 = &unk_26EBDAFA8;
  uint64_t v4 = [v3 xlReader];
  (*(void (**)(uint64_t, void **))(*(void *)v4 + 392))(v4, &v14);
  v5 = [v3 edSheet];
  v6 = [v5 columnInfos];
  v7 = [v3 resources];
  if (((v16 - (void)v15) & 0x7FFFFFFF8) != 0)
  {
    unint64_t v8 = 0;
    uint64_t v9 = ((unint64_t)(v16 - (void)v15) >> 3);
    do
    {
      uint64_t ColumnFirst = XlColumnTable::getColumnFirst((XlColumnTable *)&v14, v8);
      uint64_t ColumnLast = XlColumnTable::getColumnLast((XlColumnTable *)&v14, v8);
      if (ColumnFirst <= 0xFF)
      {
        uint64_t v12 = ColumnLast;
        if ((ColumnLast & 0x80000000) == 0 && (int)ColumnLast <= 255)
        {
          v13 = [[EDColumnInfo alloc] initWithResources:v7 worksheet:v5];
          [(EDColumnInfo *)v13 setWidthInXlUnits:XlColumnTable::getWidth((XlColumnTable *)&v14, v8)];
          [(EDColumnInfo *)v13 setHidden:XlColumnTable::isHidden((XlColumnTable *)&v14, v8)];
          [(EDColumnInfo *)v13 setRangeWithFirstColumn:ColumnFirst lastColumn:v12];
          if (XlColumnTable::getCellFormat((XlColumnTable *)&v14, v8) != -1) {
            [(EDColumnInfo *)v13 setStyleIndex:(int)XlColumnTable::getCellFormat((XlColumnTable *)&v14, v8)];
          }
          if (v8 >= ((unint64_t)(v16 - (void)v15) >> 3)) {
            std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
          }
          [(EDColumnInfo *)v13 setOutlineLevel:*(unsigned __int8 *)(v15[v8] + 28)];
          [v6 addObject:v13];
        }
      }
      ++v8;
    }
    while (v9 != v8);
  }

  v14 = &unk_26EBDAF88;
  CsSimpleHeapVector<XlRecord>::~CsSimpleHeapVector((void **)&v15);
}

@end