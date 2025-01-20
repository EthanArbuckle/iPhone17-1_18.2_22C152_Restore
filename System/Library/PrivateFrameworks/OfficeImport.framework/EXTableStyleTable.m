@interface EXTableStyleTable
+ (void)readFrom:(_xmlNode *)a3 state:(id)a4;
+ (void)readPredefinedTableStylesFrom:(_xmlNode *)a3 state:(id)a4;
+ (void)readPredefinedTableStylesWithState:(id)a3;
@end

@implementation EXTableStyleTable

+ (void)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3)
  {
    v7 = [v5 resources];
    v8 = [v7 tableStyles];

    v9 = [v6 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v9, "tableStyle");

    while (Child)
    {
      v11 = +[EXTableStyle edTableStyleFromXmlTableStyleElement:Child state:v6];
      [v8 addObject:v11];

      v12 = [v6 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v12, (xmlChar *)"tableStyle");
    }
    id v18 = 0;
    BOOL v13 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"defaultTableStyle", &v18);
    id v14 = v18;
    if (v13) {
      [v8 setDefaultTableStyleName:v14];
    }
    id v17 = 0;
    BOOL v15 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"defaultPivotStyle", &v17);
    id v16 = v17;
    if (v15) {
      [v8 setDefaultPivotStyleName:v16];
    }
  }
}

+ (void)readPredefinedTableStylesWithState:(id)a3
{
  id v8 = a3;
  if (([v8 isPredefinedTableStylesRead] & 1) == 0)
  {
    id v4 = +[TCXmlUtilities bundlePathForXmlResource:@"EXPredefinedTableStyleSheet"];
    id v5 = (xmlDoc *)sfaxmlParseFile([v4 fileSystemRepresentation]);
    if (!v5) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    xmlNodePtr v6 = OCXGetRootElement(v5);
    xmlNodePtr v7 = v6;
    if (!v6 || !xmlStrEqual(v6->name, (const xmlChar *)"predefinedTableStyleSheet")) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    [a1 readPredefinedTableStylesFrom:v7 state:v8];
    [v8 setPredefinedTableStylesRead:1];
    xmlFreeDoc(v5);
  }
}

+ (void)readPredefinedTableStylesFrom:(_xmlNode *)a3 state:(id)a4
{
  id v22 = a4;
  id v5 = [v22 workbook];
  xmlNodePtr v6 = [v22 resources];
  xmlNodePtr v7 = [v6 tableStyles];

  id v8 = OCXFirstChild(a3);
  if (v8)
  {
    do
    {
      v9 = objc_alloc_init(EXReadState);
      v10 = [[EDResources alloc] initWithStringOptimization:0];
      v11 = [v22 resources];
      v12 = [v11 colors];
      [(EDResources *)v10 setColors:v12];

      BOOL v13 = [v22 resources];
      id v14 = [v13 themes];
      [(EDResources *)v10 setThemes:v14];

      [(EXReadState *)v9 setResources:v10];
      [(EXReadState *)v9 setPredefinedDxfsBeingRead:1];
      BOOL v15 = [(EXReadState *)v9 EXSpreadsheetMLNamespace];
      uint64_t v16 = OCXFindChild(v8, v15, "dxfs");

      +[EXDifferentialStyleTable readFrom:v16 state:v9];
      id v17 = [(EXReadState *)v9 EXSpreadsheetMLNamespace];
      id v18 = (_xmlNode *)OCXFindChild(v8, v17, "tableStyles");

      if (!v18) {
        +[TCMessageException raise:TCInvalidFileFormatMessage];
      }
      v19 = [(EXReadState *)v9 EXSpreadsheetMLNamespace];
      uint64_t v20 = OCXFindChild(v18, v19, "tableStyle");

      v21 = +[EXTableStyle edTableStyleFromXmlTableStyleElement:v20 state:v9];
      [v7 addObject:v21];

      [v5 addOtherResources:v10];
      id v8 = OCXNextSibling(v8);
    }
    while (v8);
  }
  else
  {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
}

@end