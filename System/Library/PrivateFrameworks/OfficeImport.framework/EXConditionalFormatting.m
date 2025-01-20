@interface EXConditionalFormatting
+ (void)readConditionalFormattingsFrom:(_xmlNode *)a3 x14:(BOOL)a4 state:(id)a5;
+ (void)readFrom:(_xmlNode *)a3 x14:(BOOL)a4 state:(id)a5;
@end

@implementation EXConditionalFormatting

+ (void)readConditionalFormattingsFrom:(_xmlNode *)a3 x14:(BOOL)a4 state:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v12 = v8;
  if (v5)
  {
    id v9 = (id)EXXL2010Namespace;
  }
  else
  {
    id v9 = [v8 EXSpreadsheetMLNamespace];
  }
  v10 = v9;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type == XML_ELEMENT_NODE && [v10 containsNode:i])
    {
      if (xmlStrEqual(i->name, (const xmlChar *)"conditionalFormatting")) {
        [a1 readFrom:i x14:v5 state:v12];
      }
    }
  }
}

+ (void)readFrom:(_xmlNode *)a3 x14:(BOOL)a4 state:(id)a5
{
  BOOL v5 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v23 = a5;
  if (a3)
  {
    if (v5)
    {
      v7 = (CXNamespace *)(id)EXXL2010Namespace;
    }
    else
    {
      v7 = [v23 EXSpreadsheetMLNamespace];
    }
    id v8 = v7;
    id v9 = objc_alloc_init(EDConditionalFormatting);
    if (v5)
    {
      uint64_t v10 = OCXFindChild(a3, (CXNamespace *)EXMainNamespace, "sqref");
      if (!v10) {
        goto LABEL_21;
      }
      id v11 = (id)objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", v10);
    }
    else
    {
      id v28 = 0;
      CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"sqref", &v28);
      id v11 = v28;
    }
    if (v11)
    {
      v22 = v11;
      +[EXReference edDiscontinousReferencesFromXmlRanges:](EXReference, "edDiscontinousReferencesFromXmlRanges:");
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
      v21 = a3;
      v14 = 0;
      if (v13)
      {
        uint64_t v15 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            if (v14)
            {
              [v14 unionWithReference:*(void *)(*((void *)&v24 + 1) + 8 * i)];
            }
            else
            {
              v14 = +[EDReference referenceWithReference:*(void *)(*((void *)&v24 + 1) + 8 * i)];
            }
            [(EDConditionalFormatting *)v9 addRange:v17];
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v13);
      }

      a3 = v21;
      goto LABEL_22;
    }
LABEL_21:
    v22 = 0;
    v14 = 0;
LABEL_22:
    for (j = (_xmlNode *)OCXFindChild(a3, v8, "cfRule"); j; j = OCXFindNextChild(j, v8, (xmlChar *)"cfRule"))
      +[EXConditionalFormattingRule readFrom:j x14:v5 edConditionalFormatting:v9 edReference:v14 state:v23];
    v19 = [v23 currentSheet];
    v20 = [v19 conditionalFormattings];

    [v20 addObject:v9];
  }
}

@end