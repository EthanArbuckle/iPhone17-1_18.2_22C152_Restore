@interface EXCellFormatTable
+ (void)readCellFormatsFrom:(_xmlNode *)a3 isStyle:(BOOL)a4 state:(id)a5;
+ (void)readFromCellStyleXfsElement:(_xmlNode *)a3 state:(id)a4;
+ (void)readFromCellStylesElement:(_xmlNode *)a3 state:(id)a4;
+ (void)readFromCellXfsElement:(_xmlNode *)a3 state:(id)a4;
+ (void)setDefaultWithState:(id)a3;
@end

@implementation EXCellFormatTable

+ (void)readFromCellXfsElement:(_xmlNode *)a3 state:(id)a4
{
  id v8 = a4;
  if (a3)
  {
    v6 = [v8 EXSpreadsheetMLNamespace];
    uint64_t v7 = (int)CXCountChildren(a3, v6, (xmlChar *)"xf");

    [v8 setCellStyleXfsOffset:v7];
    [a1 readCellFormatsFrom:a3 isStyle:0 state:v8];
  }
}

+ (void)readCellFormatsFrom:(_xmlNode *)a3 isStyle:(BOOL)a4 state:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  if (a3)
  {
    id v14 = v7;
    id v8 = [v7 resources];
    v9 = [v8 styles];

    [v9 setDefaultWorkbookStyleIndex:0];
    v10 = [v14 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v10, "xf");

    while (Child)
    {
      v12 = +[EXCellFormat edCellFormatFromXmlCellFormatElement:Child isStyle:v5 state:v14];
      [v9 addObject:v12];

      v13 = [v14 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v13, (xmlChar *)"xf");
    }
    id v7 = v14;
  }
}

+ (void)readFromCellStyleXfsElement:(_xmlNode *)a3 state:(id)a4
{
}

+ (void)readFromCellStylesElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3)
  {
    uint64_t v7 = [v5 cellStyleXfsOffset];
    id v8 = [v6 resources];
    v9 = [v8 styles];

    v10 = [v6 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v10, "cellStyle");

    while (Child)
    {
      id v16 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"name", &v16);
      id v12 = v16;
      if (v12)
      {
        uint64_t v15 = 0;
        CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"xfId", &v15);
        v13 = [v9 objectAtIndex:v15 + v7];
        [v13 setName:v12];
      }
      id v14 = [v6 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v14, (xmlChar *)"cellStyle");
    }
  }
}

+ (void)setDefaultWithState:(id)a3
{
  id v9 = a3;
  v3 = [v9 resources];
  v4 = [v3 styles];

  [v4 setDefaultWorkbookStyleIndex:0];
  id v5 = [v9 resources];
  v6 = +[EDStyle styleWithResources:v5];

  [v6 setContentFormatId:0];
  [v6 setFontIndex:0];
  [v6 setFillIndex:0];
  [v6 setBordersIndex:0];
  [v6 setParentIndex:0];
  [v4 addObject:v6];
  uint64_t v7 = [v9 resources];
  id v8 = +[EDStyle styleWithResources:v7];

  [v8 setContentFormatId:0];
  [v8 setFontIndex:0];
  [v8 setFillIndex:0];
  [v8 setBordersIndex:0];
  [v8 setName:@"Normal"];
  [v4 addObject:v8];
}

@end