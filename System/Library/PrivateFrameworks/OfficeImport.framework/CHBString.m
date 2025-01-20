@interface CHBString
+ (id)edRunsFromXlChartTextFrame:(const void *)a3 state:(id)a4;
+ (id)edStringFromXlChartTextFrame:(const void *)a3 state:(id)a4;
+ (id)nsStringWithHandlingMultilevelCategoryDataFromOCText:(const OcText *)a3 chdFormula:(id)a4 state:(id)a5;
+ (unint64_t)edFontIndexForXlChartTextFrame:(void *)a3 state:(id)a4;
@end

@implementation CHBString

+ (id)edRunsFromXlChartTextFrame:(const void *)a3 state:(id)a4
{
  id v19 = a4;
  v5 = [v19 resources];
  if (((*((_DWORD *)a3 + 38) - *((_DWORD *)a3 + 36)) & 0x3FFFC) != 0)
  {
    v6 = +[EDCollection collection];
    uint64_t v7 = *((void *)a3 + 18);
    unint64_t v8 = *((void *)a3 + 19) - v7;
    if ((v8 & 0x3FFFC) != 0)
    {
      unsigned int v9 = 0;
      unint64_t v10 = v8 >> 2;
      do
      {
        if ((unsigned __int16)v9 >= v10) {
          std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
        }
        v11 = (unsigned __int16 *)(v7 + 4 * (unsigned __int16)v9);
        if ((v8 & 0x3FFFC) != 4 || *((__int16 *)a3 + 93) < 0)
        {
          v16 = +[EDRun runWithCharIndex:fontIndex:resources:](EDRun, "runWithCharIndex:fontIndex:resources:", *v11, +[EBFontTable edFontIndexFromXlFontIndex:*(unsigned __int16 *)(v7 + 4 * (unsigned __int16)v9 + 2)], v5);
        }
        else
        {
          v12 = [v5 fonts];
          v13 = objc_msgSend(v12, "objectAtIndex:", +[EBFontTable edFontIndexFromXlFontIndex:](EBFontTable, "edFontIndexFromXlFontIndex:", *(unsigned __int16 *)(v7 + 4 * (unsigned __int16)v9 + 2)));
          v14 = (void *)[v13 copy];
          if (*(unsigned char *)([v19 xlReader] + 1344) && *((__int16 *)a3 + 93) >= 64)
          {
            uint64_t v20 = *((void *)a3 + 12);
            v15 = +[OITSUColor colorWithCsColour:&v20];
          }
          else
          {
            v17 = [v5 colors];
            v15 = [v17 colorWithIndex:*((__int16 *)a3 + 93)];
          }
          [v14 setColor:v15];
          v16 = +[EDRun runWithCharIndex:*v11 font:v14 resources:v5];
        }
        [v6 addObject:v16];

        ++v9;
        uint64_t v7 = *((void *)a3 + 18);
        unint64_t v8 = *((void *)a3 + 19) - v7;
        unint64_t v10 = v8 >> 2;
      }
      while (v9 < (unsigned __int16)(v8 >> 2));
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)edStringFromXlChartTextFrame:(const void *)a3 state:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    uint64_t v7 = objc_alloc_init(EDString);
    xmlNodePtr v8 = CXGetRootElement(*((const unsigned __int8 **)a3 + 14), *((_DWORD *)a3 + 45));
    xmlNodePtr v9 = v8;
    if (v8)
    {
      if (xmlStrEqual(v8->name, (const xmlChar *)"txPr") || xmlStrEqual(v9->name, (const xmlChar *)"richFrt"))
      {
        unint64_t v10 = [(OAXDrawingState *)[EXOfficeArtState alloc] initWithClient:0];
        v11 = [[CHXReadState alloc] initWithDrawingState:v10];
        v12 = [v6 resources];
        [(CHXReadState *)v11 setResources:v12];

        v13 = +[CHXFont edRunCollectionFromXmlTextPropertiesElement:v9 state:v11];
        if (v13) {
          [(EDString *)v7 setRuns:v13];
        }
      }
      else
      {
        v13 = 0;
      }
      xmlFreeDoc(v9->doc);
    }
    else
    {
      v13 = 0;
    }
    if (*((void *)a3 + 11))
    {
      v14 = objc_msgSend(NSString, "stringWithOcText:");
      [(EDString *)v7 setString:v14];
    }
    if (v13)
    {
      v15 = [a1 edRunsFromXlChartTextFrame:a3 state:v6];
      unint64_t v16 = [v15 count];
      if (v16 >= [v13 count])
      {
        uint64_t v17 = [v13 count];
        if (v17)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            id v19 = [v13 objectAtIndex:i];
            uint64_t v20 = [v15 objectAtIndex:i];
            v21 = [v20 font];
            [v19 overrideFont:v21];
          }
        }
      }
    }
    else
    {
      v15 = [a1 edRunsFromXlChartTextFrame:a3 state:v6];
      [(EDString *)v7 setRuns:v15];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (unint64_t)edFontIndexForXlChartTextFrame:(void *)a3 state:(id)a4
{
  id v5 = a4;
  id v6 = +[CHBString edStringFromXlChartTextFrame:a3 state:v5];
  if ([v6 areThereRuns])
  {
    uint64_t v7 = [v6 runs];
    xmlNodePtr v8 = [v7 objectAtIndex:0];
    unint64_t v9 = [v8 fontIndex];
  }
  else
  {
    uint64_t v7 = [v5 chart];
    unint64_t v9 = [v7 defaultFontIndex];
  }

  return v9;
}

+ (id)nsStringWithHandlingMultilevelCategoryDataFromOCText:(const OcText *)a3 chdFormula:(id)a4 state:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (!v7 || [v7 tokenCount] != 1) {
    goto LABEL_18;
  }
  unsigned int v26 = 0;
  uint64_t v9 = [v7 lastExtendedDataForTokenAtIndex:0 length:&v26];
  BOOL v10 = 0;
  if (!v9 || v26 < 8) {
    goto LABEL_19;
  }
  int v11 = [v7 tokenTypeAtIndex:0];
  uint64_t v12 = 1;
  unsigned int v13 = 1;
  uint64_t v14 = 3;
  uint64_t v15 = 2;
  if (v11 > 90)
  {
    if (v11 != 91)
    {
      unint64_t v16 = (unsigned __int16 *)v9;
      if (v11 == 101) {
        goto LABEL_15;
      }
      unsigned int v17 = 1;
      unsigned int v18 = 1;
      unsigned int v19 = 1;
      if (v11 != 123) {
        goto LABEL_16;
      }
    }
LABEL_13:
    unint64_t v16 = (unsigned __int16 *)(v9 + 2);
    uint64_t v14 = 4;
    uint64_t v15 = 3;
    uint64_t v12 = 2;
    goto LABEL_15;
  }
  if (v11 == 37)
  {
    unint64_t v16 = (unsigned __int16 *)v9;
    goto LABEL_15;
  }
  if (v11 == 59) {
    goto LABEL_13;
  }
  unint64_t v16 = (unsigned __int16 *)v9;
  unsigned int v17 = 1;
  unsigned int v18 = 1;
  unsigned int v19 = 1;
  if (v11 == 69)
  {
LABEL_15:
    unsigned int v13 = *v16;
    unsigned int v18 = *(unsigned __int16 *)(v9 + 2 * v12);
    unsigned int v17 = *(unsigned __int16 *)(v9 + 2 * v15);
    unsigned int v19 = *(unsigned __int16 *)(v9 + 2 * v14);
  }
LABEL_16:
  if (v13 == v18 && v17 <= v19)
  {
LABEL_18:
    BOOL v10 = 0;
    goto LABEL_19;
  }
  BOOL v10 = v13 > v18 || v17 != v19;
LABEL_19:
  uint64_t v20 = [NSString stringWithOcText:a3];
  v21 = v20;
  if (v10)
  {
    v22 = [v20 componentsSeparatedByString:@"\n"];
    if ([v22 count])
    {
      uint64_t v23 = objc_msgSend(v22, "objectAtIndex:", objc_msgSend(v22, "count") - 1);

      v21 = (void *)v23;
    }
  }
  return v21;
}

@end