@interface CHBData
+ (id)readFrom:(const void *)a3 state:(id)a4;
@end

@implementation CHBData

+ (id)readFrom:(const void *)a3 state:(id)a4
{
  id v5 = a4;
  if (a3 && XlChartLinkedData::hasEnteredData((XlChartLinkedData *)a3))
  {
    uint64_t v6 = *((unsigned int *)a3 + 12);
    v7 = [v5 resources];
    v8 = +[CHDData dataWithDataPointCount:v6 resources:v7];
  }
  else
  {
    v9 = [v5 resources];
    v8 = +[CHDData dataWithResources:v9];

    if (!a3)
    {
      id v36 = v8;
      goto LABEL_48;
    }
  }
  uint64_t v10 = *((void *)a3 + 2);
  if (v10)
  {
    uint64_t v11 = *((unsigned __int16 *)a3 + 12);
    uint64_t v12 = objc_opt_class();
    v13 = [v5 ebReaderSheetState];
    v14 = +[EBFormula edFormulaFromXlFmlaDefinition:v10 withFormulaLength:v11 formulaClass:v12 state:v13];

    v15 = [v5 workbook];
    [v14 setWorkbook:v15];

    v16 = [v5 chart];
    [v8 setFormula:v14 chart:v16];
  }
  else
  {
    v14 = 0;
  }
  if (XlChartLinkedData::hasEnteredData((XlChartLinkedData *)a3))
  {
    v40 = v14;
    id v41 = v5;
    v17 = [v8 dataValues];
    v18 = (char *)*((void *)a3 + 4);
    v39 = a3;
    v19 = (char *)a3 + 40;
    if (v18 != v19)
    {
      unsigned int v20 = 0;
      char v21 = 1;
      int v22 = 0xFFFF;
      while (1)
      {
        v23 = (unsigned __int16 *)*((void *)v18 + 5);
        CsData::CsData(&v44);
        if ((*(unsigned int (**)(unsigned __int16 *))(*(void *)v23 + 16))(v23)) {
          break;
        }
        if (!(*(unsigned int (**)(unsigned __int16 *))(*(void *)v23 + 24))(v23)) {
          goto LABEL_16;
        }
        v26 = +[CHBString nsStringWithHandlingMultilevelCategoryDataFromOCText:(*(uint64_t (**)(unsigned __int16 *))(*(void *)v23 + 40))(v23) chdFormula:v40 state:v41];
        if ([(EDValue *)v26 length])
        {
          EDValue::makeWithNSString(v26, (uint64_t)&v42);
          EDValue::operator=((uint64_t)&v44, &v42.type);
          EDValue::~EDValue(&v42);

          goto LABEL_16;
        }
        v32 = (char *)*((void *)v18 + 1);
        v33 = v18;
        if (v32)
        {
          do
          {
            v34 = v32;
            v32 = *(char **)v32;
          }
          while (v32);
        }
        else
        {
          do
          {
            v34 = (char *)*((void *)v33 + 2);
            BOOL v35 = *(void *)v34 == (void)v33;
            v33 = v34;
          }
          while (!v35);
        }
        unsigned int v20 = *((_DWORD *)v18 + 8);

        v18 = v34;
LABEL_29:
        EDValue::~EDValue((EDValue *)&v44);
        if (v18 == v19) {
          goto LABEL_40;
        }
      }
      v24 = (EDValue *)(*(uint64_t (**)(unsigned __int16 *))(*(void *)v23 + 32))(v23);
      EDValue::makeWithNumber(v24, v25, (uint64_t)&v42);
      EDValue::operator=((uint64_t)&v44, &v42.type);
      EDValue::~EDValue(&v42);
LABEL_16:
      int v27 = v23[4];
      if (v27 == (unsigned __int16)v22) {
        int v28 = v22;
      }
      else {
        int v28 = -1;
      }
      if (v21) {
        int v22 = v23[4];
      }
      else {
        int v22 = v28;
      }
      uint64_t v43 = *((unsigned int *)v18 + 8);
      uint64_t v45 = (__int16)v27;
      [v17 addDataPoint:&v43];
      unsigned int v29 = *((_DWORD *)v18 + 8);
      if (v29 <= v20) {
        unsigned int v29 = v20;
      }
      [v8 setDataValueIndexCount:v29 + 1];
      unsigned int v20 = *((_DWORD *)v18 + 8);
      v30 = (char *)*((void *)v18 + 1);
      if (v30)
      {
        do
        {
          v18 = v30;
          v30 = *(char **)v30;
        }
        while (v30);
      }
      else
      {
        do
        {
          v31 = v18;
          v18 = (char *)*((void *)v18 + 2);
        }
        while (*(char **)v18 != v31);
      }
      char v21 = 0;
      goto LABEL_29;
    }
    LOWORD(v22) = -1;
LABEL_40:
    [v17 finishReading];

    v14 = v40;
    id v5 = v41;
    a3 = v39;
  }
  else
  {
    LOWORD(v22) = -1;
  }
  int v37 = *((unsigned __int16 *)a3 + 13);
  if (*(unsigned char *)([v5 xlReader] + 1344))
  {
    if (v37 != 0x8000 && !*((unsigned char *)a3 + 28)) {
      LOWORD(v22) = v37;
    }
  }
  else
  {
    LOWORD(v22) = v37;
  }
  [v8 setContentFormatId:(__int16)v22];
  id v36 = v8;

LABEL_48:
  return v36;
}

@end