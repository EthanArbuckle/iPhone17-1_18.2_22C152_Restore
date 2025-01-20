@interface WXListDefinitionTable
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5;
@end

@implementation WXListDefinitionTable

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v18 = a4;
  id v7 = a5;
  v8 = [v7 WXMainNamespace];
  Child = (_xmlNode *)OCXFindChild(a3, v8, "abstractNum");

  while (Child)
  {
    v10 = [v7 WXMainNamespace];
    v11 = CXRequiredLongAttribute(Child, v10, (xmlChar *)"abstractNumId");

    v12 = [v7 WXMainNamespace];
    v13 = (_xmlNode *)OCXFindChild(Child, v12, "styleLink");

    if (v13)
    {
      v14 = [v7 WXMainNamespace];
      v15 = CXDefaultStringAttribute(v13, v14, (xmlChar *)"val", 0);
    }
    else
    {
      v15 = 0;
    }
    v16 = [v18 addDefinitionWithDefinitionId:v11 styleId:v15];
    +[WXListDefinition readFrom:Child to:v16 state:v7];
    v17 = [v7 WXMainNamespace];
    Child = OCXFindNextChild(Child, v17, (xmlChar *)"abstractNum");
  }
}

@end