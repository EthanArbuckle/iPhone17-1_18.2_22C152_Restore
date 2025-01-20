@interface EXTableStyle
+ (id)edTableStyleFromXmlTableStyleElement:(_xmlNode *)a3 state:(id)a4;
@end

@implementation EXTableStyle

+ (id)edTableStyleFromXmlTableStyleElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    v6 = +[EDTableStyle tableStyle];
    id v15 = 0;
    BOOL v7 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"name", &v15);
    id v8 = v15;
    if (v7) {
      [v6 setName:v8];
    }
    v9 = [v6 tableStyleElements];
    v10 = [v5 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v10, "tableStyleElement");

    while (Child)
    {
      v12 = +[EXTableStyleElement edTableStyleElementFromXmlTableStyleElement:Child state:v5];
      [v9 addObject:v12];

      v13 = [v5 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v13, (xmlChar *)"tableStyleElement");
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end