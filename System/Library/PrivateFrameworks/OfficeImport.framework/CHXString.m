@interface CHXString
+ (id)chdFormulaFromXmlStrRefElement:(_xmlNode *)a3 state:(id)a4;
+ (id)edStringFromXmlRichElement:(_xmlNode *)a3 state:(id)a4;
+ (id)edStringFromXmlStrCacheElement:(_xmlNode *)a3 state:(id)a4;
+ (void)readFromXmlTxElement:(_xmlNode *)a3 formula:(id *)a4 lastCached:(id *)a5 state:(id)a6;
@end

@implementation CHXString

+ (void)readFromXmlTxElement:(_xmlNode *)a3 formula:(id *)a4 lastCached:(id *)a5 state:(id)a6
{
  id v10 = a6;
  v11 = v10;
  *a4 = 0;
  *a5 = 0;
  if (!a3) {
    goto LABEL_13;
  }
  v31 = v10;
  v12 = [v10 drawingState];
  v13 = [v12 OAXChartNamespace];
  BOOL HasName = CXNodeHasName(a3, v13, (xmlChar *)"tx");

  v11 = v31;
  if (!HasName) {
    goto LABEL_13;
  }
  v15 = [v31 drawingState];
  v16 = [v15 OAXChartNamespace];
  v17 = (_xmlNode *)OCXFindChild(a3, v16, "strRef");

  if (v17)
  {
    if (([v31 ignoreFormulas] & 1) == 0)
    {
      *a4 = [a1 chdFormulaFromXmlStrRefElement:v17 state:v31];
    }
    v18 = [v31 drawingState];
    v19 = [v18 OAXChartNamespace];
    uint64_t v20 = OCXFindChild(v17, v19, "strCache");

    if (!v20) {
      goto LABEL_11;
    }
    v21 = [a1 edStringFromXmlStrCacheElement:v20 state:v31];
  }
  else
  {
    v22 = [v31 drawingState];
    v23 = [v22 OAXChartNamespace];
    uint64_t v24 = OCXFindChild(a3, v23, "rich");

    if (!v24) {
      goto LABEL_11;
    }
    v21 = [a1 edStringFromXmlRichElement:v24 state:v31];
  }
  *a5 = v21;
LABEL_11:
  parent = a3->parent;
  v26 = [v31 drawingState];
  v27 = [v26 OAXChartNamespace];
  uint64_t v28 = OCXFindChild(parent, v27, "txPr");

  v11 = v31;
  if (v28)
  {
    id v29 = *a5;
    v30 = +[CHXFont edRunCollectionFromXmlTextPropertiesElement:v28 state:v31];
    [v29 setRuns:v30];

    v11 = v31;
  }
LABEL_13:
}

+ (id)chdFormulaFromXmlStrRefElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  v6 = [v5 drawingState];
  v7 = [v6 OAXChartNamespace];
  v8 = OCXFindRequiredChild(a3, v7, (xmlChar *)"f");

  uint64_t v9 = objc_opt_class();
  id v10 = [v5 exState];
  v11 = +[EXFormula edFormulaFromXmlFormulaElement:v8 formulaClass:v9 state:v10];

  v12 = [v5 exState];
  v13 = [v12 workbook];
  [v11 setWorkbook:v13];

  return v11;
}

+ (id)edStringFromXmlStrCacheElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263F089D8]);
  for (i = OCXFirstChildNamed(a3, (xmlChar *)"pt"); i; i = OCXNextSiblingNamed(i, (xmlChar *)"pt"))
  {
    v8 = [v5 drawingState];
    uint64_t v9 = [v8 OAXChartNamespace];
    uint64_t v10 = OCXFindChild(i, v9, "v");

    if (v10)
    {
      v11 = +[EXString readStringWithAsciiCodeFromXmlStringElement:v10];
      [v6 appendString:v11];
    }
  }
  if ([v6 length])
  {
    v12 = +[EDString edStringWithString:v6];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)edStringFromXmlRichElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(OADTextBody);
  v7 = [v5 drawingState];
  +[OAXTextBody readTextBodyFromXmlNode:a3 textBody:v6 drawingState:v7];

  id v28 = objc_alloc_init(MEMORY[0x263F089D8]);
  v27 = objc_alloc_init(EDRunsCollection);
  unsigned int v8 = 0;
  v25 = v6;
  while ([(OADTextBody *)v6 paragraphCount] > v8)
  {
    if (v8) {
      [v28 appendString:@"\n"];
    }
    unsigned int v26 = v8;
    uint64_t v9 = [(OADTextBody *)v6 paragraphAtIndex:v8];
    for (unsigned int i = 0; ; unsigned int i = v11 + 1)
    {
      unsigned int v11 = i;
      if ([v9 textRunCount] <= (unint64_t)i) {
        break;
      }
      v12 = [v9 textRunAtIndex:i];
      v13 = [v12 properties];
      v14 = +[CHXFont edFontWithOadCharacterProperties:v13 state:v5];

      if (v14)
      {
        v15 = [v12 properties];
        v16 = [v15 effects];
        v17 = v5;

        v18 = +[OAXEffect updateIncomingEffects:v16];

        uint64_t v19 = [v28 length];
        uint64_t v20 = [v17 resources];
        v21 = +[EDRun runWithCharIndex:v19 font:v14 effects:v18 resources:v20];
        [(EDSortedCollection *)v27 addObject:v21];

        id v5 = v17;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        v22 = [v12 text];
        [v28 appendString:v22];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v28 appendString:@"\n"];
        }
      }
    }
    id v6 = v25;
    unsigned int v8 = v26 + 1;
  }
  if ([v28 length])
  {
    v23 = +[EDString edStringWithString:v28];
    if ([(EDCollection *)v27 count]) {
      [v23 setRuns:v27];
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

@end