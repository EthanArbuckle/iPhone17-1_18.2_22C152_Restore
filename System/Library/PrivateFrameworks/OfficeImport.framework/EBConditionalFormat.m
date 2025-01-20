@interface EBConditionalFormat
+ (BOOL)validXlCf:(XlCf *)a3;
+ (int)convertEDConditionalFmtOperatorEnumToXl:(int)a3;
+ (int)convertEDConditionalFmtTypeEnumToXl:(int)a3;
+ (int)convertXlConditionalFmtOperatorEnumToED:(int)a3;
+ (int)convertXlConditionalFmtTypeEnumToED:(int)a3;
+ (void)readXlConditionalFormat:(void *)a3 toEDConditionalFormatting:(id)a4 state:(id)a5;
@end

@implementation EBConditionalFormat

+ (void)readXlConditionalFormat:(void *)a3 toEDConditionalFormatting:(id)a4 state:(id)a5
{
  id v29 = a4;
  id v8 = a5;
  v9 = v8;
  if (a3)
  {
    v10 = [v8 resources];
    v11 = (XlCondFmt *)*((void *)a3 + 4);
    if (v11)
    {
      uint64_t v12 = (*((void *)v11 + 5) - *((void *)v11 + 4)) >> 3;
      if (v12)
      {
        unsigned int v13 = 0;
        do
        {
          uint64_t CellRange = XlCondFmt::getCellRange(v11, v13);
          if (CellRange)
          {
            v15 = +[EBReference edReferenceFromXlRef:CellRange];
            [v29 addRange:v15];
          }
          ++v13;
        }
        while (v12 != v13);
      }
    }
    v28 = (char *)a3 + 8;
    unint64_t v16 = *((void *)a3 + 2) - *((void *)a3 + 1);
    if ((v16 & 0x7FFFFFFF8) != 0)
    {
      unint64_t v17 = 0;
      uint64_t v18 = (v16 >> 3);
      do
      {
        uint64_t v19 = *((void *)a3 + 1);
        if (v17 >= ((unint64_t)(*((void *)a3 + 2) - v19) >> 3)) {
          std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
        }
        uint64_t v20 = *(void *)(v19 + 8 * v17);
        v21 = [[EDConditionalFormattingRule alloc] initWithResources:v10];
        [(EDConditionalFormattingRule *)v21 setStopIfTrue:1];
        uint64_t v22 = [a1 convertXlConditionalFmtTypeEnumToED:*(unsigned int *)(v20 + 16)];
        [(EDConditionalFormattingRule *)v21 setType:v22];
        if (v22 == 2) {
          -[EDConditionalFormattingRule setOperatorEnum:](v21, "setOperatorEnum:", [a1 convertXlConditionalFmtOperatorEnumToED:*(unsigned int *)(v20 + 20)]);
        }
        if (*(__int16 *)(v20 + 24) >= 1)
        {
          v23 = +[EBFormula edFormulaFromXlFmlaDefinition:*(void *)(v20 + 40) withFormulaLength:*(unsigned __int16 *)(v20 + 24) state:v9];
          v24 = [v9 edSheet];
          [(EDConditionalFormattingRule *)v21 addFormula:v23 worksheet:v24];
        }
        if (*(__int16 *)(v20 + 26) >= 1)
        {
          v25 = +[EBFormula edFormulaFromXlFmlaDefinition:*(void *)(v20 + 48) withFormulaLength:*(unsigned __int16 *)(v20 + 26) state:v9];
          v26 = [v9 edSheet];
          [(EDConditionalFormattingRule *)v21 addFormula:v25 worksheet:v26];
        }
        v27 = +[EBDifferentialStyle edDifferentialStyleFromXlDXf:edResources:](EBDifferentialStyle, "edDifferentialStyleFromXlDXf:edResources:", *(void *)(v20 + 32), v10, v28);
        [(EDConditionalFormattingRule *)v21 setDifferentialStyle:v27];

        [v29 addRule:v21];
        ++v17;
      }
      while (v18 != v17);
    }
  }
}

+ (int)convertXlConditionalFmtTypeEnumToED:(int)a3
{
  if (a3 == 2) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (int)convertXlConditionalFmtOperatorEnumToED:(int)a3
{
  if ((a3 - 1) > 7) {
    return 0;
  }
  else {
    return *(_DWORD *)&asc_238EDF388[4 * a3 - 4];
  }
}

+ (BOOL)validXlCf:(XlCf *)a3
{
  if (!a3) {
    return 0;
  }
  int var4 = a3->var4;
  BOOL v4 = var4 > 0;
  int var5 = a3->var5;
  if (var4 <= 0) {
    int v6 = 1;
  }
  else {
    int v6 = 2;
  }
  if (var5 > 0) {
    BOOL v4 = v6;
  }
  if (a3->var2 == 2) {
    return v4;
  }
  int var3 = a3->var3;
  if ((var3 - 3) < 6) {
    return v4;
  }
  if ((var3 - 1) >= 2)
  {
    if (!var3) {
      return !v4;
    }
    return 0;
  }
  return var5 > 0 && var4 > 0;
}

+ (int)convertEDConditionalFmtTypeEnumToXl:(int)a3
{
  if (a3 == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (int)convertEDConditionalFmtOperatorEnumToXl:(int)a3
{
  if ((a3 - 2) > 7) {
    return 0;
  }
  else {
    return dword_238EDF3A8[a3 - 2];
  }
}

@end