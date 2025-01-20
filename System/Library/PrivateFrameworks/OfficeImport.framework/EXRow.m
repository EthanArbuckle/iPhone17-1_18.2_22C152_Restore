@interface EXRow
+ (id)createFormulaReferenceRangeForRowBlocks:(id)a3;
+ (void)edRowFrom:(_xmlTextReader *)a3 edRowInfo:(EDRowInfo *)a4 edRowBlock:(id)a5 edRowBlocks:(id)a6 state:(id)a7;
+ (void)readRowsFrom:(_xmlTextReader *)a3 state:(id)a4;
@end

@implementation EXRow

+ (void)readRowsFrom:(_xmlTextReader *)a3 state:(id)a4
{
  id v6 = a4;
  if (!xmlTextReaderIsEmptyElement(a3))
  {
    v7 = [v6 currentSheet];
    v36 = [v7 rowBlocks];

    v8 = [v6 sheetDimension];
    int v9 = [v8 lastRow];

    +[TCProgressContext createStageWithSteps:@"read rows" takingSteps:(double)((v9 & ~(v9 >> 31)) + 1) name:1.0];
    id v32 = a1;
    v10 = objc_alloc_init(OCXSStream);
    uint64_t v11 = xmlTextReaderDepth(a3);
    [(OCXSStream *)v10 pushLevel:v11 name:xmlTextReaderConstLocalName(a3)];
    uint64_t v12 = 0;
    int v33 = 0;
    v13 = 0;
    while (+[OCXStreamUtility readStream:a3 streamState:v10])
    {
      [v6 setCurrentRowMinColumnIndex:0];
      [v6 setCurrentRowMaxColumnIndex:0];
      v14 = xmlTextReaderConstLocalName(a3);
      if (xmlStrEqual(v14, (const xmlChar *)"row"))
      {
        uint64_t v37 = v12;
        v35 = v13;
        Attribute = (char *)xmlTextReaderGetAttribute(a3, (const xmlChar *)"r");
        v16 = Attribute;
        if (Attribute && sfaxmlXmlCharToLong(Attribute, &v37)) {
          uint64_t v17 = v37--;
        }
        else {
          uint64_t v17 = v12 + 1;
        }
        ((void (*)(char *))*MEMORY[0x263F8C880])(v16);
        uint64_t v34 = v17;
        v18 = xmlTextReaderGetAttribute(a3, (const xmlChar *)"spans");
        if (v18
          && (objc_msgSend(NSString, "tc_stringWithXmlString:", v18),
              v19 = objc_claimAutoreleasedReturnValue(),
              (v20 = v19) != 0))
        {
          uint64_t v22 = [v19 rangeOfString:@":"];
          if (v22 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v23 = 0;
          }
          else
          {
            uint64_t v25 = v21;
            v26 = [v20 substringToIndex:v22];
            int v31 = [v26 intValue];

            v23 = [v20 substringFromIndex:v22 + v25];
            int v27 = [v23 intValue];

            if (v31) {
              [v6 setCurrentRowMinColumnIndex:(v31 - 1)];
            }
            LODWORD(v23) = vcvtpd_u64_f64((double)(v27 - v31) * 0.25);
            if (v27) {
              [v6 setCurrentRowMaxColumnIndex:(v27 - 1)];
            }
          }
          v24 = v20;
        }
        else
        {
          v23 = 0;
          v24 = 0;
        }
        ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v18);
        if (v37 < 0)
        {

          uint64_t v12 = v34;
          v13 = v35;
        }
        else
        {
          objc_msgSend(v36, "rowBlockForRowNumber:currentRowBlock:createIfNil:");
          v28 = uint64_t v12 = v34;

          uint64_t v29 = [v28 addRowInfoWithRowNumber:v37 cellCountHint:v23];
          if (v29) {
            [v32 edRowFrom:a3 edRowInfo:v29 edRowBlock:v28 edRowBlocks:v36 state:v6];
          }
          +[TCProgressContext advanceProgress:1.0];
          ++v33;
          HIDWORD(v30) = -1030792151 * v33;
          LODWORD(v30) = -1030792151 * v33;
          if ((v30 >> 1) <= 0x51EB851)
          {
            if ([v6 isCancelled]) {
              +[TCMessageException raiseUntaggedMessage:@"TCUserCancelled", 0];
            }
          }

          v13 = v28;
        }
      }
    }

    [v36 unlock];
    +[TCProgressContext endStage];
  }
}

+ (void)edRowFrom:(_xmlTextReader *)a3 edRowInfo:(EDRowInfo *)a4 edRowBlock:(id)a5 edRowBlocks:(id)a6 state:(id)a7
{
  v39 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  char v38 = 0;
  Attribute = xmlTextReaderGetAttribute(a3, (const xmlChar *)"customFormat");
  v15 = Attribute;
  v16 = (void (**)(xmlChar *))MEMORY[0x263F8C880];
  if (Attribute)
  {
    int v17 = sfaxmlXmlCharToBool(Attribute, &v38);
    int v18 = v38 ? v17 : 0;
    if (v18 == 1)
    {
      unint64_t v37 = 0;
      v19 = xmlTextReaderGetAttribute(a3, (const xmlChar *)"s");
      v20 = v19;
      if (v19 && sfaxmlXmlCharToUnsignedLong((const char *)v19, &v37)) {
        setStyleIndexForEDRowInfo(a4, v37);
      }
      (*v16)(v20);
    }
  }
  (*v16)(v15);
  unint64_t v37 = 0;
  uint64_t v21 = xmlTextReaderGetAttribute(a3, (const xmlChar *)"outlineLevel");
  uint64_t v22 = v21;
  if (v21 && sfaxmlXmlCharToUnsignedLong((const char *)v21, &v37)) {
    a4->var6 = v37;
  }
  (*v16)(v22);
  [v13 defaultRowHeight];
  double v36 = v23;
  v24 = xmlTextReaderGetAttribute(a3, (const xmlChar *)"ht");
  uint64_t v25 = v24;
  if (v24 && sfaxmlXmlCharToDouble((uint64_t)v24, &v36))
  {
    double v36 = v36 * 20.0;
    char v26 = 1;
  }
  else
  {
    char v26 = 0;
  }
  (*v16)(v25);
  a4->var5 = (int)v36;
  *((unsigned char *)a4 + 23) = *((unsigned char *)a4 + 23) & 0xFE | v26;
  char v35 = 0;
  int v27 = xmlTextReaderGetAttribute(a3, (const xmlChar *)"customHeight");
  v28 = v27;
  if (v27 && sfaxmlXmlCharToBool(v27, &v35)) {
    *((unsigned char *)a4 + 23) = *((unsigned char *)a4 + 23) & 0xFE | v35;
  }
  (*v16)(v28);
  char v34 = 0;
  uint64_t v29 = xmlTextReaderGetAttribute(a3, (const xmlChar *)"hidden");
  unint64_t v30 = v29;
  if (v29 && sfaxmlXmlCharToBool(v29, &v34)) {
    *((unsigned char *)a4 + 23) = *((unsigned char *)a4 + 23) & 0xFD | (2 * v34);
  }
  (*v16)(v30);
  if (!xmlTextReaderIsEmptyElement(a3))
  {
    int v31 = objc_alloc_init(OCXSStream);
    uint64_t v32 = xmlTextReaderDepth(a3);
    [(OCXSStream *)v31 pushLevel:v32 name:xmlTextReaderConstLocalName(a3)];
    while (+[OCXStreamUtility readStream:a3 streamState:v31])
    {
      int v33 = xmlTextReaderConstLocalName(a3);
      if (xmlStrEqual(v33, (const xmlChar *)"c")) {
        +[EXCell edCellFromXmlCellElement:xmlTextReaderExpand(a3) edRowInfo:&v39 edRowBlock:v11 edRowBlocks:v12 state:v13];
      }
    }
  }
}

+ (id)createFormulaReferenceRangeForRowBlocks:(id)a3
{
  v3 = (EDRowBlocks *)a3;
  v4 = [(EDRowBlocks *)v3 formulas];
  std::vector<EDReference * {__strong}>::vector(v29, [v4 count]);

  if (v3)
  {
    for (unsigned int i = 0; [(EDRowBlocks *)v3 rowBlockCount] > i; unsigned int i = v28 + 1)
    {
      unsigned int v28 = i;
      id v6 = -[EDRowBlocks rowBlockAtIndex:](v3, "rowBlockAtIndex:");
      for (uint64_t j = 0; j < [v6 rowCount]; uint64_t j = (j + 1))
      {
        uint64_t v8 = [v6 rowInfoAtIndex:j];
        uint64_t v9 = v8;
        if (*(_DWORD *)(v8 + 8))
        {
          uint64_t v10 = 0;
          uint64_t v11 = *(unsigned int *)(v8 + 4);
          do
          {
            id v12 = (EDCellHeader *)[v6 cellAtIndex:v10 rowInfo:v9];
            if (isFormulaCell(v12))
            {
              uint64_t v13 = formulaIndexForEDCell(v12);
              uint64_t v14 = columnNumberForEDCell(v12);
              if (v13 != -1)
              {
                uint64_t v15 = v14;
                v16 = formulaForEDCell(v12, v3);
                if ([v16 isSharedFormula])
                {
                  if (([v16 isBaseFormula] & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      id v17 = v16;
                      uint64_t v13 = [v17 baseFormulaIndex];
                    }
                  }
                }
                int v18 = *(void **)(v29[0] + 8 * v13);
                if (v18)
                {
                  id v19 = v18;
                  v20 = [[EDReference alloc] initWithFirstRow:v11 lastRow:v11 firstColumn:v15 lastColumn:v15];
                  [v19 unionWithReference:v20];
                }
                else
                {
                  uint64_t v21 = [[EDReference alloc] initWithFirstRow:v11 lastRow:v11 firstColumn:v15 lastColumn:v15];
                  id v19 = *(id *)(v29[0] + 8 * v13);
                  *(void *)(v29[0] + 8 * v13) = v21;
                }
              }
            }
            uint64_t v10 = (v10 + 1);
          }
          while (v10 < *(_DWORD *)(v9 + 8));
        }
      }
    }
  }
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  for (unsigned int k = 0; ; ++k)
  {
    v24 = [(EDRowBlocks *)v3 formulas];
    unint64_t v25 = [v24 count];

    if (v25 <= k) {
      break;
    }
    if (*(void *)(v29[0] + 8 * k))
    {
      objc_msgSend(v22, "addObject:");
    }
    else
    {
      char v26 = [[EDReference alloc] initWithFirstRow:0xFFFFFFFFLL lastRow:0xFFFFFFFFLL firstColumn:0xFFFFFFFFLL lastColumn:0xFFFFFFFFLL];
      [v22 addObject:v26];
    }
  }
  unint64_t v30 = (void **)v29;
  std::vector<OADTableCell * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v30);

  return v22;
}

@end