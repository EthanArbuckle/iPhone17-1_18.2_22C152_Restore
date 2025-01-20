@interface EBCellFormatTable
+ (id)getStyleNameForCellFormatIndex:(unsigned int)a3 xlStyleTable:(const void *)a4 edResources:(id)a5;
+ (void)readWithState:(id)a3;
@end

@implementation EBCellFormatTable

+ (void)readWithState:(id)a3
{
  id v27 = a3;
  v3 = [v27 resources];
  v29 = [v3 styles];
  v36 = &unk_26EBDAEE8;
  v37 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v4 = [v27 xlReader];
  (*(void (**)(uint64_t, void **))(*(void *)v4 + 184))(v4, &v36);
  XlStyleTable::XlStyleTable((XlStyleTable *)v35);
  uint64_t v5 = [v27 xlReader];
  (*(void (**)(uint64_t, void **))(*(void *)v5 + 240))(v5, v35);
  [v29 setDefaultWorkbookStyleIndex:0];
  if (((v38 - (void)v37) & 0x7FFFFFFF8) != 0)
  {
    unint64_t v6 = 0;
    uint64_t v7 = ((unint64_t)(v38 - (void)v37) >> 3);
    do
    {
      int isStyle = XlCellFormatTable::isStyle((XlCellFormatTable *)&v36, v6);
      if (isStyle)
      {
        v9 = [(EDStyle *)[EDNamedStyle alloc] initWithResources:v3];
        v10 = [a1 getStyleNameForCellFormatIndex:v6 xlStyleTable:v35 edResources:v3];
        [(EDNamedStyle *)v9 setName:v10];

        v11 = v9;
        v12 = v11;
      }
      else
      {
        v12 = 0;
        v11 = [[EDStyle alloc] initWithResources:v3];
      }
      int ParentCellFormat = XlCellFormatTable::getParentCellFormat((XlCellFormatTable *)&v36, v6);
      if (ParentCellFormat == 4095) {
        int v14 = -1;
      }
      else {
        int v14 = ParentCellFormat;
      }
      if (v14) {
        char v15 = 0;
      }
      else {
        char v15 = isStyle;
      }
      if ((v15 & 1) == 0
        || ([(EDStyle *)v12 name],
            v16 = objc_claimAutoreleasedReturnValue(),
            uint64_t v17 = [v16 caseInsensitiveCompare:@"Normal"],
            v16,
            v17))
      {
        [(EDStyle *)v11 setParentIndex:v14];
      }
      if (v6 >= ((unint64_t)(v38 - (void)v37) >> 3)) {
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      }
      uint64_t v18 = v37[v6];
      XlRecord::XlRecord((uint64_t)v30, (const XlHeader *)v18);
      v30[0] = &unk_26EBE21F8;
      long long v31 = *(_OWORD *)(v18 + 16);
      long long v20 = *(_OWORD *)(v18 + 48);
      long long v19 = *(_OWORD *)(v18 + 64);
      long long v21 = *(_OWORD *)(v18 + 32);
      *(_OWORD *)&v34[10] = *(_OWORD *)(v18 + 74);
      long long v33 = v20;
      *(_OWORD *)v34 = v19;
      long long v32 = v21;
      [(EDStyle *)v11 setFontIndex:+[EBFontTable edFontIndexFromXlFontIndex:(__int16)v31]];
      v22 = +[EBAlignmentInfo edAlignmentInfoFromXlXf:v30];
      [(EDStyle *)v11 setAlignmentInfo:v22];

      v23 = +[EBBorders edBordersFromXlXf:v30 edResources:v3];
      [(EDStyle *)v11 setBorders:v23];

      v24 = +[EBFill edFillFromXlXf:v30 edResources:v3];
      [(EDStyle *)v11 setFill:v24];

      v25 = +[EBProtection edProtectionFromXlXf:v30];
      [(EDStyle *)v11 setProtection:v25];

      [(EDStyle *)v11 setContentFormatId:SWORD1(v31)];
      if (isStyle)
      {
        [(EDStyle *)v11 setFontOverridden:v34[20] == 0];
        [(EDStyle *)v11 setAlignmentInfoOverridden:v34[21] == 0];
        [(EDStyle *)v11 setBordersOverridden:v34[22] == 0];
        [(EDStyle *)v11 setFillOverridden:v34[23] == 0];
        [(EDStyle *)v11 setProtectionOverridden:v34[24] == 0];
        BOOL v26 = v34[19] == 0;
      }
      else
      {
        [(EDStyle *)v11 setFontOverridden:v34[20] != 0];
        [(EDStyle *)v11 setAlignmentInfoOverridden:v34[21]];
        [(EDStyle *)v11 setBordersOverridden:v34[22]];
        [(EDStyle *)v11 setFillOverridden:v34[23]];
        [(EDStyle *)v11 setProtectionOverridden:v34[24]];
        BOOL v26 = v34[19] != 0;
      }
      [(EDStyle *)v11 setContentFormatOverridden:v26];
      [v29 addObject:v11];

      ++v6;
    }
    while (v7 != v6);
  }
  XlStyleTable::~XlStyleTable(v35);
  v36 = &unk_26EBDAEE8;
  CsSimpleHeapVector<XlXf>::~CsSimpleHeapVector((void **)&v37);
}

+ (id)getStyleNameForCellFormatIndex:(unsigned int)a3 xlStyleTable:(const void *)a4 edResources:(id)a5
{
  id v7 = a5;
  uint64_t v8 = *((void *)a4 + 1);
  unint64_t v9 = *((void *)a4 + 2) - v8;
  if ((v9 & 0x7FFFFFFF8) != 0)
  {
    uint64_t v10 = 0;
    uint64_t v11 = (v9 >> 3);
    while (1)
    {
      if (v11 == v10) {
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      }
      uint64_t v12 = *(void *)(v8 + 8 * v10);
      if (*(__int16 *)(v12 + 24) == a3) {
        break;
      }
      if (v11 == ++v10) {
        goto LABEL_6;
      }
    }
    int v14 = NSString;
    if (*(unsigned char *)(v12 + 33)) {
      uint64_t Name = XlStyleTable::getName((XlStyleTable *)a4, v10);
    }
    else {
      uint64_t Name = *(void *)(v12 + 16) + 8;
    }
    v13 = [v14 stringWithOcText:Name];
  }
  else
  {
LABEL_6:
    v13 = 0;
  }

  return v13;
}

@end