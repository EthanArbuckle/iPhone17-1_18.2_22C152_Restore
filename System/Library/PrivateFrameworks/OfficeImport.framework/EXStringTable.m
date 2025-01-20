@interface EXStringTable
+ (void)readFromState:(id)a3;
+ (void)readStringsFrom:(_xmlNode *)a3 state:(id)a4;
@end

@implementation EXStringTable

+ (void)readFromState:(id)a3
{
  id v10 = a3;
  v4 = [v10 currentPart];
  v5 = (_xmlDoc *)[v4 xmlDocument];
  if (!v5) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  xmlNodePtr v6 = OCXGetRootElement(v5);
  xmlNodePtr v7 = v6;
  if (!v6
    || !xmlStrEqual(v6->name, (const xmlChar *)"sst")
    || ([v10 EXSpreadsheetMLNamespace],
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 containsNode:v7],
        v8,
        (v9 & 1) == 0))
  {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  [a1 readStringsFrom:v7 state:v10];
}

+ (void)readStringsFrom:(_xmlNode *)a3 state:(id)a4
{
  id v12 = a4;
  v5 = [v12 resources];
  xmlNodePtr v6 = [v5 strings];

  xmlNodePtr v7 = [v12 EXSpreadsheetMLNamespace];
  Child = (_xmlNode *)OCXFindChild(a3, v7, "si");

  while (Child)
  {
    char v9 = +[EXString edTextFromXmlStringElement:Child state:v12];
    if (v9)
    {
      [v6 addObject:v9];
    }
    else
    {
      uint64_t v10 = +[EXString edStringWithRunsFromXmlStringElement:Child state:v12];
      if (v10)
      {
        char v9 = (void *)v10;
        objc_msgSend(v6, "addObject:");
      }
      else
      {
        char v9 = 0;
      }
    }

    v11 = [v12 EXSpreadsheetMLNamespace];
    Child = OCXFindNextChild(Child, v11, (xmlChar *)"si");
  }
}

@end