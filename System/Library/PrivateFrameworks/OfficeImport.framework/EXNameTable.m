@interface EXNameTable
+ (id)edNameFromXmlNameElement:(_xmlNode *)a3 state:(id)a4;
+ (void)readFrom:(_xmlNode *)a3 state:(id)a4;
@end

@implementation EXNameTable

+ (void)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v13 = v6;
    v7 = [v6 resources];
    v8 = [v7 names];

    v9 = [v13 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v9, "definedName");

    while (Child)
    {
      v11 = [a1 edNameFromXmlNameElement:Child state:v13];
      [v8 addObject:v11];

      v12 = [v13 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v12, (xmlChar *)"definedName");
    }
    id v6 = v13;
  }
}

+ (id)edNameFromXmlNameElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v6 = objc_alloc_init(EDName);
    id v15 = 0;
    BOOL v7 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"name", &v15);
    id v8 = v15;
    if (v7)
    {
      v9 = +[EDString edStringWithString:v8];
      [(EDName *)v6 setNameString:v9];
    }
    uint64_t v14 = 0;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"localSheetId", &v14)) {
      [(EDName *)v6 setSheetIndex:v14];
    }
    v10 = objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", a3);
    v11 = [@"=" stringByAppendingString:v10];
    v12 = [v5 workbook];
    [(EDName *)v6 setFormulaString:v11 workbook:v12];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end