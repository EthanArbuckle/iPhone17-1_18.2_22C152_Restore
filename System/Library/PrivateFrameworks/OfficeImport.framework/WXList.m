@interface WXList
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5;
@end

@implementation WXList

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  v8 = [v7 WXMainNamespace];
  Child = (_xmlNode *)OCXFindChild(a3, v8, "lvlOverride");

  while (Child)
  {
    v10 = [v7 WXMainNamespace];
    unsigned __int8 v11 = CXRequiredLongAttribute(Child, v10, (xmlChar *)"ilvl");

    v12 = [v14 addLevelOverrideWithLevel:v11];
    +[WXListLevelOverride readFrom:Child to:v12 state:v7];
    v13 = [v7 WXMainNamespace];
    Child = OCXFindNextChild(Child, v13, (xmlChar *)"lvlOverride");
  }
}

@end