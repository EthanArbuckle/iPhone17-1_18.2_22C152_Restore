@interface EXBordersTable
+ (unint64_t)xlBordersIndexFromEDBordersIndex:(unint64_t)a3;
+ (void)readFrom:(_xmlNode *)a3 state:(id)a4;
+ (void)setDefaultWithState:(id)a3;
@end

@implementation EXBordersTable

+ (void)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v12 = v5;
    v6 = [v5 resources];
    v7 = [v6 borders];

    v8 = [v12 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v8, "border");

    while (Child)
    {
      v10 = +[EXBorders edBordersFromXmlBordersElement:Child state:v12];
      [v7 addObject:v10];

      v11 = [v12 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v11, (xmlChar *)"border");
    }
    id v5 = v12;
  }
}

+ (void)setDefaultWithState:(id)a3
{
  id v10 = [a3 resources];
  v3 = +[EDBorder borderWithType:resources:](EDBorder, "borderWithType:resources:", 0);
  v4 = +[EDBorder borderWithType:0 resources:v10];
  id v5 = +[EDBorder borderWithType:0 resources:v10];
  v6 = +[EDBorder borderWithType:0 resources:v10];
  v7 = +[EDBorder borderWithType:0 resources:v10];
  v8 = +[EDBorders bordersWithLeft:v3 right:v4 top:v5 bottom:v6 diagonal:v7 resources:v10];
  v9 = [v10 borders];
  [v9 addObject:v8];
}

+ (unint64_t)xlBordersIndexFromEDBordersIndex:(unint64_t)a3
{
  return a3 + 1;
}

@end