@interface EXCell
+ (BOOL)edBoolFromXmlBoolString:(id)a3;
+ (double)dateTimeNumberFromXmlDateString:(id)a3 state:(id)a4;
+ (id)xmlErrorStringValueEnumMap;
+ (int)edCellTypeFromXmlCellElement:(_xmlNode *)a3 isDate:(BOOL *)a4 isFmlaStr:(BOOL *)a5 stringIndex:(BOOL *)a6;
+ (int)edErrorFromXmlErrorString:(id)a3;
+ (void)edCellFromXmlCellElement:(_xmlNode *)a3 edRowInfo:(EDRowInfo *)a4 edRowBlock:(id)a5 edRowBlocks:(id)a6 state:(id)a7;
@end

@implementation EXCell

+ (void)edCellFromXmlCellElement:(_xmlNode *)a3 edRowInfo:(EDRowInfo *)a4 edRowBlock:(id)a5 edRowBlocks:(id)a6 state:(id)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  if (a3)
  {
    id v38 = 0;
    BOOL v14 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"r", &v38);
    id v15 = v38;
    if (v14)
    {
      if (+[EXReference edAreaReferenceFromXmlReference:v15 areaReference:v37])
      {
        uint64_t v16 = HIDWORD(v37[0]);
        if ((v37[0] & 0x8000000000000000) != 0)
        {
          unsigned int v17 = [v13 currentRowMinColumnIndex];
          if (v17 <= [v13 currentRowMaxColumnIndex]) {
            uint64_t v16 = [v13 currentRowMinColumnIndex];
          }
        }
        [v13 setCurrentRowMinColumnIndex:(v16 + 1)];
      }
      else
      {
        uint64_t v16 = 0xFFFFFFFFLL;
      }
    }
    else
    {
      uint64_t v16 = [v13 currentRowMinColumnIndex];
      [v13 setCurrentRowMinColumnIndex:(v16 + 1)];
    }
    __int16 v36 = 0;
    char v35 = 0;
    uint64_t v18 = [a1 edCellTypeFromXmlCellElement:a3 isDate:(char *)&v36 + 1 isFmlaStr:&v35 stringIndex:&v36];
    uint64_t v19 = v18;
    if ((int)v16 <= 255 && (*a4)->var1 < 0x10000)
    {
      id v32 = v15;
      v33 = v11;
      int v20 = 0;
    }
    else
    {
      if (!v18)
      {
LABEL_40:

        goto LABEL_41;
      }
      id v32 = v15;
      v33 = v11;
      uint64_t v19 = 4;
      int v20 = 1;
    }
    v21 = [v13 EXSpreadsheetMLNamespace];
    uint64_t v22 = OCXFindChild(a3, v21, "v");

    if (!v22 && v19 == 3)
    {
      v23 = [v13 EXSpreadsheetMLNamespace];
      uint64_t v22 = OCXFindChild(a3, v23, "is");
    }
    if (v22)
    {
      v24 = (NSString *)objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", v22);
      if (v19) {
        int v25 = v20;
      }
      else {
        int v25 = 0;
      }
      if (v25 == 1)
      {
        v26 = (unsigned char *)+[EXCell edCellFromXmlCellElement:edRowInfo:edRowBlock:edRowBlocks:state:]::hadOutOfBoundaryWarning();
        if (!*v26)
        {
          unsigned char *v26 = 1;
          +[TCMessageContext reportWarning:ECCellsOutsideLassoBoundary];
        }
      }
    }
    else
    {
      v24 = 0;
      uint64_t v19 = 0;
    }
    v27 = [v13 EXSpreadsheetMLNamespace];
    uint64_t v28 = OCXFindChild(a3, v27, "f");

    v29 = (EDCellHeader *)[v33 addCellWithColumnNumber:v16 type:v19 isFormulaCell:v28 != 0 rowInfo:a4 rowBlocks:v12];
    if (!v29)
    {
LABEL_39:

      id v15 = v32;
      id v11 = v33;
      goto LABEL_40;
    }
    if (v24)
    {
      if (v19 == 1)
      {
        setBoolValueForEDCell((uint64_t)v29, [a1 edBoolFromXmlBoolString:v24]);
      }
      else
      {
        if (v19 != 2 || HIBYTE(v36))
        {
          if (v19 != 2 || !HIBYTE(v36))
          {
            if (v19 == 5)
            {
              setErrorValueForEDCell(v29, [a1 edErrorFromXmlErrorString:v24]);
            }
            else if (v19 == 3 && (_BYTE)v36)
            {
              setStringIndexValueForEDCell(v29, [(NSString *)v24 intValue]);
            }
            else if (v19 == 3 && !(_BYTE)v36)
            {
              v31 = [v13 resources];
              setInlineNSStringValueForEDCell(v29, v24, v31);
            }
            goto LABEL_37;
          }
          [a1 dateTimeNumberFromXmlDateString:v24 state:v13];
        }
        else
        {
          [(NSString *)v24 doubleValue];
        }
        setNumberValueForEDCell((uint64_t)v29, v30);
      }
    }
LABEL_37:
    v37[0] = 0;
    CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"s", (uint64_t *)v37);
    setStyleIndexForEDCell((uint64_t)v29, v37[0]);
    if (v28) {
      +[EXFormula readFrom:v28 rowNumber:(*a4)->var1 columnNumber:v16 edCell:v29 edRowBlocks:v12 state:v13];
    }
    goto LABEL_39;
  }
LABEL_41:
}

+ (BOOL)edBoolFromXmlBoolString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  int v5 = [v3 intValue];
  if (!v5)
  {
LABEL_6:
    BOOL v6 = 0;
    goto LABEL_7;
  }
  if (v5 != 1)
  {
LABEL_5:
    +[TCMessageException raise:TCInvalidFileFormatMessage];
    goto LABEL_6;
  }
  BOOL v6 = 1;
LABEL_7:

  return v6;
}

+ (int)edErrorFromXmlErrorString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [a1 xmlErrorStringValueEnumMap];
    uint64_t v6 = [v5 valueForString:v4];

    if (v6 == -130883970) {
      int v7 = 7;
    }
    else {
      int v7 = v6;
    }
  }
  else
  {
    int v7 = 7;
  }

  return v7;
}

+ (id)xmlErrorStringValueEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_22, 0, &dword_238A75000);
  }
  if (+[EXCell xmlErrorStringValueEnumMap]::once != -1) {
    dispatch_once(&+[EXCell xmlErrorStringValueEnumMap]::once, &__block_literal_global_72);
  }
  v2 = (void *)+[EXCell xmlErrorStringValueEnumMap]::sXmlErrorStringValueEnumMap;
  return v2;
}

void __36__EXCell_xmlErrorStringValueEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[EXCell xmlErrorStringValueEnumMap]::sXmlErrorStringValueStructs count:8 caseSensitive:1];
  v1 = (void *)+[EXCell xmlErrorStringValueEnumMap]::sXmlErrorStringValueEnumMap;
  +[EXCell xmlErrorStringValueEnumMap]::sXmlErrorStringValueEnumMap = (uint64_t)v0;
}

+ (int)edCellTypeFromXmlCellElement:(_xmlNode *)a3 isDate:(BOOL *)a4 isFmlaStr:(BOOL *)a5 stringIndex:(BOOL *)a6
{
  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  id v14 = 0;
  BOOL v9 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"t", &v14);
  id v10 = v14;
  id v11 = v10;
  if (!v9) {
    goto LABEL_5;
  }
  if ([v10 isEqualToString:@"b"])
  {
    int v12 = 1;
    goto LABEL_6;
  }
  if ([v11 isEqualToString:@"n"])
  {
LABEL_5:
    int v12 = 2;
    goto LABEL_6;
  }
  if ([v11 isEqualToString:@"e"])
  {
    int v12 = 5;
    goto LABEL_6;
  }
  if ([v11 isEqualToString:@"str"])
  {
    *a5 = 1;
LABEL_11:
    int v12 = 3;
    goto LABEL_6;
  }
  if ([v11 isEqualToString:@"d"])
  {
    *a4 = 1;
    goto LABEL_5;
  }
  if ([v11 isEqualToString:@"s"])
  {
    *a6 = 1;
    goto LABEL_11;
  }
  if ([v11 isEqualToString:@"inlineStr"]) {
    int v12 = 3;
  }
  else {
    int v12 = 0;
  }
LABEL_6:

  return v12;
}

+ (double)dateTimeNumberFromXmlDateString:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    int v7 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:v5];
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v27 = 0;
    if ([v7 scanInteger:&v29]
      && [v7 scanString:@"-" intoString:0]
      && [v7 scanInteger:&v28]
      && [v7 scanString:@"-" intoString:0])
    {
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      double v23 = 0.0;
      uint64_t v24 = 0;
      if ([v7 scanInteger:&v27]
        && [v7 scanString:@"T" intoString:0]
        && [v7 scanInteger:&v26]
        && [v7 scanString:@":" intoString:0]
        && [v7 scanInteger:&v25]
        && [v7 scanString:@":" intoString:0]
        && [v7 scanInteger:&v24])
      {
        [v7 scanDouble:&v23];
      }
    }
    else
    {
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      double v23 = 0.0;
      uint64_t v24 = 0;
    }
    int v8 = [v7 scanString:@"P" intoString:0];
    if (v8)
    {
      LOBYTE(v9) = 0;
      uint64_t v22 = 0;
      while ((objc_msgSend(v7, "isAtEnd", v22) & 1) == 0)
      {
        int v9 = (v9 & 1) != 0 ? 1 : [v7 scanString:@"T" intoString:0];
        if (![v7 scanInteger:&v22]) {
          break;
        }
        if (v9)
        {
          if ([v7 scanString:@"H" intoString:0])
          {
            uint64_t v26 = v22;
          }
          else if ([v7 scanString:@"M" intoString:0])
          {
            uint64_t v25 = v22;
          }
          else
          {
            if ([v7 scanString:@"." intoString:0]) {
              [v7 scanDouble:&v23];
            }
            if (![v7 scanString:@"S" intoString:0]) {
              break;
            }
            uint64_t v24 = v22;
          }
        }
        else if ([v7 scanString:@"Y" intoString:0])
        {
          uint64_t v29 = v22;
        }
        else if ([v7 scanString:@"M" intoString:0])
        {
          uint64_t v28 = v22;
        }
        else
        {
          if (![v7 scanString:@"D" intoString:0]) {
            break;
          }
          uint64_t v27 = v22;
        }
      }
    }
    id v10 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v10 setYear:v29];
    [v10 setMonth:v28];
    [v10 setDay:v27];
    [v10 setHour:v26];
    [v10 setMinute:v25];
    [v10 setSecond:v24];
    id v11 = objc_alloc(MEMORY[0x263EFF8F0]);
    int v12 = (void *)[v11 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
    id v13 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
    [v12 setTimeZone:v13];

    if (v8)
    {
      id v14 = [v6 workbook];
      id v15 = [v14 dateBaseDate];
      uint64_t v16 = [v12 dateByAddingComponents:v10 toDate:v15 options:0];
    }
    else
    {
      uint64_t v16 = [v12 dateFromComponents:v10];
    }
    uint64_t v18 = [v16 dateByAddingTimeInterval:v23];

    uint64_t v19 = [v6 workbook];
    +[ECUtils dateTimeNumberFromNSDate:v18 edWorkbook:v19];
    double v17 = v20;
  }
  else
  {
    double v17 = 0.0;
  }

  return v17;
}

@end