@interface EXContentFormatTable
+ (void)readFrom:(_xmlNode *)a3 state:(id)a4;
@end

@implementation EXContentFormatTable

+ (void)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v12 = v5;
    v6 = [v5 resources];
    v7 = [v6 contentFormats];

    v8 = [v12 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v8, "numFmt");

    while (Child)
    {
      v10 = +[EXContentFormat edContentFormatFromXmlContentFormatElement:Child];
      [v7 addOrEquivalentObject:v10];

      v11 = [v12 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v11, (xmlChar *)"numFmt");
    }
    id v5 = v12;
  }
}

@end