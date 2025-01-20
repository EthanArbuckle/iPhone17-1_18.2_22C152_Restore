@interface EXFormula
+ (Class)formulaClassFromXmlFormulaElement:(_xmlNode *)a3 state:(id)a4;
+ (id)edFormulaFromXmlFormulaElement:(_xmlNode *)a3 formulaClass:(Class)a4 state:(id)a5;
+ (id)edFormulaFromXmlFormulaElement:(_xmlNode *)a3 state:(id)a4;
+ (id)edTokensForFormulaString:(id)a3 formulaClass:(Class)a4 rowNumber:(int)a5 columnNumber:(int)a6 sheet:(id)a7 workbook:(id)a8;
+ (id)edTokensForFormulaString:(id)a3 sheet:(id)a4 workbook:(id)a5;
+ (id)readFrom:(_xmlNode *)a3 formulaClass:(Class)a4 rowNumber:(int)a5 columnNumber:(int)a6 edCell:(EDCellHeader *)a7 edRowBlocks:(id)a8 state:(id)a9;
+ (void)applyArrayedFormula:(id)a3 edReference:(id)a4 edWorksheet:(id)a5 state:(id)a6;
+ (void)applyArrayedFormulasToSheet:(id)a3 state:(id)a4;
+ (void)readFrom:(_xmlNode *)a3 rowNumber:(int)a4 columnNumber:(int)a5 edCell:(EDCellHeader *)a6 edRowBlocks:(id)a7 state:(id)a8;
@end

@implementation EXFormula

+ (void)applyArrayedFormulasToSheet:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v14 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v7 arrayedFormulas];
    uint64_t v9 = [v8 count];
    if (v9)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        v11 = [v8 objectAtIndex:i];
        v12 = [v11 first];
        v13 = [v11 second];
        [a1 applyArrayedFormula:v12 edReference:v13 edWorksheet:v14 state:v7];
      }
    }
    [v8 removeAllObjects];
  }
}

+ (void)readFrom:(_xmlNode *)a3 rowNumber:(int)a4 columnNumber:(int)a5 edCell:(EDCellHeader *)a6 edRowBlocks:(id)a7 state:(id)a8
{
  uint64_t v10 = *(void *)&a5;
  uint64_t v11 = *(void *)&a4;
  id v16 = a7;
  id v14 = a8;
  id v15 = (id)objc_msgSend(a1, "readFrom:formulaClass:rowNumber:columnNumber:edCell:edRowBlocks:state:", a3, objc_msgSend(a1, "formulaClassFromXmlFormulaElement:state:", a3, v14), v11, v10, a6, v16, v14);
}

+ (Class)formulaClassFromXmlFormulaElement:(_xmlNode *)a3 state:(id)a4
{
  id v13 = 0;
  BOOL v5 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"type", &v13);
  id v6 = v13;
  id v7 = v6;
  if (!v5)
  {
    id v12 = v6;
    CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"t", &v12);
    id v8 = v12;

    id v7 = v8;
  }
  uint64_t v9 = objc_opt_class();
  if ([v7 isEqualToString:@"shared"]) {
    uint64_t v9 = objc_opt_class();
  }
  if ([v7 isEqualToString:@"array"])
  {
    uint64_t v9 = objc_opt_class();
  }
  else if (([v7 isEqualToString:@"dataTable"] & 1) != 0 {
         || [v7 isEqualToString:@"table"])
  }
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v9;

  return v10;
}

+ (id)readFrom:(_xmlNode *)a3 formulaClass:(Class)a4 rowNumber:(int)a5 columnNumber:(int)a6 edCell:(EDCellHeader *)a7 edRowBlocks:(id)a8 state:(id)a9
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  v30 = (EDRowBlocks *)a8;
  id v15 = a9;
  id v16 = 0;
  if (a3 && a4)
  {
    v29 = objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", a3);
    if (v29 && [v29 length])
    {
      v17 = [@"=" stringByAppendingString:v29];
      id v27 = v15;
      v18 = [v15 currentSheet];
      v19 = [v15 workbook];
      id v16 = [a1 edTokensForFormulaString:v17 formulaClass:a4 rowNumber:v11 columnNumber:v10 sheet:v18 workbook:v19];

      id v15 = v27;
      if (!a7) {
        goto LABEL_19;
      }
    }
    else
    {
      id v16 = [(objc_class *)a4 formula];
      if (!a7) {
        goto LABEL_19;
      }
    }
    if (((v10 | v11) & 0x80000000) == 0)
    {
      setFormulaForEDCell(a7, v16, v30);
      id v28 = v15;
      id v32 = 0;
      CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"ref", &v32);
      id v20 = v32;
      if ((Class)objc_opt_class() == a4)
      {
        v21 = v16;
        uint64_t v31 = -1;
        CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"si", &v31);
        if (v20)
        {
          [(EDFormula *)v21 setRowBaseOrOffset:v11];
          [(EDFormula *)v21 setColumnBaseOrOffset:v10];
          uint64_t v24 = formulaIndexForEDCell(a7);
          [v15 addSharedBaseFormulaIndex:v24 withIndex:v31];
        }
        else
        {
          -[EDFormula setBaseFormulaIndex:](v21, "setBaseFormulaIndex:", [v15 sharedBaseFormulaIndexWithIndex:v31]);
          v25 = [(EDFormula *)v21 baseFormulaWithRowBlocks:v30];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            -[EDFormula setRowBaseOrOffset:](v21, "setRowBaseOrOffset:", v11 - [v25 rowBaseOrOffset]);
            -[EDFormula setColumnBaseOrOffset:](v21, "setColumnBaseOrOffset:", v10 - [v25 columnBaseOrOffset]);
          }
        }
      }
      else
      {
        if ((Class)objc_opt_class() != a4)
        {
LABEL_18:

          goto LABEL_19;
        }
        v21 = [v15 arrayedFormulas];
        v22 = +[EXReference edReferenceFromXmlReference:v20];
        v23 = +[OITSUPair pairWithFirst:v16 second:v22];
        [(EDFormula *)v21 addObject:v23];

        id v15 = v28;
      }

      goto LABEL_18;
    }
LABEL_19:
  }
  return v16;
}

+ (id)edTokensForFormulaString:(id)a3 formulaClass:(Class)a4 rowNumber:(int)a5 columnNumber:(int)a6 sheet:(id)a7 workbook:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  id v13 = a3;
  id v14 = a7;
  id v15 = a8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v16 = v14;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;
  v18 = [[EDFormulaHelper alloc] initWithWorkbook:v15 worksheet:v17 rowNumber:v11 columnNumber:v10];
  v19 = +[EFormula stringToFormula:v13 formulaHelper:v18 formulaClass:a4];
  [v19 setOriginalFormulaString:v13];

  return v19;
}

+ (id)edFormulaFromXmlFormulaElement:(_xmlNode *)a3 formulaClass:(Class)a4 state:(id)a5
{
  BOOL v5 = [a1 readFrom:a3 formulaClass:a4 rowNumber:0xFFFFFFFFLL columnNumber:0xFFFFFFFFLL edCell:0 edRowBlocks:0 state:a5];
  return v5;
}

+ (void)applyArrayedFormula:(id)a3 edReference:(id)a4 edWorksheet:(id)a5 state:(id)a6
{
  id v9 = a3;
  id v40 = a4;
  id v10 = a5;
  id v35 = a6;
  v37 = v9;
  v38 = v10;
  v39 = [v9 originalFormulaString];
  if (v10)
  {
    if (v40)
    {
      if (v39)
      {
        int v43 = [v40 firstRow];
        int v11 = [v40 lastRow];
        int v50 = [v40 firstColumn];
        int v12 = [v40 lastColumn];
        if (v43 <= 0x10000 && v50 <= 256)
        {
          int v13 = v11 >= 0x10000 ? 0x10000 : v11;
          int v14 = v12 >= 256 ? 256 : v12;
          unsigned int v48 = v14;
          int v42 = v13;
          if (v43 <= v13)
          {
            id v15 = [v10 rowBlocks];
            id v16 = [v15 formulas];
            int v45 = [v16 indexOfObject:v9];

            unint64_t v17 = [v15 expectedIndexOfRowBlockForRowNumber:v43];
            unint64_t v36 = [v15 expectedIndexOfRowBlockForRowNumber:v42];
            if (v17 <= v36)
            {
              v46 = v15;
              do
              {
                unint64_t v41 = v17;
                v18 = [v15 rowBlockAtIndex:v17];
                v19 = v18;
                if (v18)
                {
                  int v44 = [v18 rowCount];
                  if (v44)
                  {
                    uint64_t v20 = 0;
                    v47 = v19;
                    do
                    {
                      uint64_t v51 = 0;
                      uint64_t v21 = [v19 rowInfoAtIndex:v20];
                      uint64_t v51 = v21;
                      if (v21)
                      {
                        int v22 = *(_DWORD *)(v21 + 4);
                        if (v22 >= v43)
                        {
                          if (v22 > v42) {
                            break;
                          }
                          unsigned int v23 = *(_DWORD *)(v21 + 8);
                          uint64_t v24 = objc_msgSend(v19, "expectedIndexOfCellWithColumnNumber:rowInfo:", v50);
                          for (unsigned int i = v23; v24 < i; v24 = (v24 + 1))
                          {
                            v25 = (EDCellHeader *)[v19 cellAtIndex:v24 rowInfo:v51];
                            uint64_t v26 = columnNumberForEDCell(v25);
                            uint64_t v27 = v26;
                            if (v26 >= v50)
                            {
                              if (v26 > v48) {
                                break;
                              }
                              if ((isFormulaCell(v25) & 1) == 0)
                              {
                                id v28 = typeForEDCell(v25);
                                int v29 = styleIndexForEDCell(v25);
                                char v30 = 0;
                                double v31 = 0.0;
                                int v32 = -1;
                                int v33 = 0;
                                switch((int)v28)
                                {
                                  case 1:
                                    char v30 = BOOLValueForEDCell((BOOL)v25);
                                    goto LABEL_30;
                                  case 2:
                                    double v31 = numberValueForEDCell(v25);
                                    goto LABEL_29;
                                  case 3:
                                    int v32 = stringIndexValueForEDCell(v25);
LABEL_29:
                                    char v30 = 0;
LABEL_30:
                                    int v33 = 0;
                                    break;
                                  case 5:
                                    int v33 = errorValueForEDCell(v25);
                                    char v30 = 0;
                                    break;
                                  default:
                                    break;
                                }
                                v34 = (EDCellHeader *)[v47 addCellWithColumnNumber:v27 type:v28 isFormulaCell:1 rowInfo:&v51 rowBlocks:v46];
                                v25 = v34;
                                switch((int)v28)
                                {
                                  case 1:
                                    setBoolValueForEDCell((uint64_t)v34, v30);
                                    break;
                                  case 2:
                                    setNumberValueForEDCell((uint64_t)v34, v31);
                                    break;
                                  case 3:
                                    setStringIndexValueForEDCell(v34, v32);
                                    break;
                                  case 5:
                                    setErrorValueForEDCell(v34, v33);
                                    break;
                                  default:
                                    break;
                                }
                                setStyleIndexForEDCell((uint64_t)v25, v29);
                              }
                              id v15 = v46;
                              v19 = v47;
                              setFormulaIndexForEDCell((uint64_t)v25, v45);
                              if (v27 == v48) {
                                break;
                              }
                            }
                          }
                        }
                      }
                      uint64_t v20 = (v20 + 1);
                    }
                    while (v20 != v44);
                  }
                }

                unint64_t v17 = v41 + 1;
              }
              while (v41 + 1 <= v36);
            }
            [v15 unlock];
          }
        }
      }
    }
  }
}

+ (id)edFormulaFromXmlFormulaElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a1, "edFormulaFromXmlFormulaElement:formulaClass:state:", a3, objc_msgSend(a1, "formulaClassFromXmlFormulaElement:state:", a3, v6), v6);

  return v7;
}

+ (id)edTokensForFormulaString:(id)a3 sheet:(id)a4 workbook:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [a1 edTokensForFormulaString:v8 formulaClass:objc_opt_class() rowNumber:0xFFFFFFFFLL columnNumber:0xFFFFFFFFLL sheet:v9 workbook:v10];

  return v11;
}

@end