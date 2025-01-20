@interface CHXDateAxis
+ (id)chdAxisFromXmlAxisElement:(_xmlNode *)a3 state:(id)a4;
+ (id)stringFromTimeUnit:(int)a3;
+ (int)chdTimeUnitFromXmlTimeUnitElement:(_xmlNode *)a3;
@end

@implementation CHXDateAxis

+ (id)chdAxisFromXmlAxisElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = [CHDDateAxis alloc];
  v8 = [v6 resources];
  v9 = [(CHDDateAxis *)v7 initWithResources:v8];

  v10 = [v6 drawingState];
  v11 = [v10 OAXChartNamespace];
  v12 = (_xmlNode *)OCXFindChild(a3, v11, "auto");

  if (v12) {
    [(CHDDateAxis *)v9 setAutomatic:CXRequiredBoolAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"val")];
  }
  v13 = [v6 drawingState];
  v14 = [v13 OAXChartNamespace];
  v15 = (_xmlNode *)OCXFindChild(a3, v14, "majorUnit");

  if (v15)
  {
    double v29 = 0.0;
    if (CXOptionalDoubleAttribute(v15, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v29)) {
      [(CHDDateAxis *)v9 setMajorUnitValue:v29];
    }
  }
  v16 = [v6 drawingState];
  v17 = [v16 OAXChartNamespace];
  v18 = (_xmlNode *)OCXFindChild(a3, v17, "minorUnit");

  if (v18)
  {
    double v29 = 0.0;
    if (CXOptionalDoubleAttribute(v18, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v29)) {
      [(CHDDateAxis *)v9 setMinorUnitValue:v29];
    }
  }
  v19 = [v6 drawingState];
  v20 = [v19 OAXChartNamespace];
  uint64_t v21 = OCXFindChild(a3, v20, "majorTimeUnit");

  -[CHDDateAxis setMajorTimeUnit:](v9, "setMajorTimeUnit:", [a1 chdTimeUnitFromXmlTimeUnitElement:v21]);
  v22 = [v6 drawingState];
  v23 = [v22 OAXChartNamespace];
  uint64_t v24 = OCXFindChild(a3, v23, "minorTimeUnit");

  -[CHDDateAxis setMinorTimeUnit:](v9, "setMinorTimeUnit:", [a1 chdTimeUnitFromXmlTimeUnitElement:v24]);
  v25 = [v6 drawingState];
  v26 = [v25 OAXChartNamespace];
  uint64_t v27 = OCXFindChild(a3, v26, "baseTimeUnit");

  -[CHDDateAxis setBaseTimeUnit:](v9, "setBaseTimeUnit:", [a1 chdTimeUnitFromXmlTimeUnitElement:v27]);
  return v9;
}

+ (int)chdTimeUnitFromXmlTimeUnitElement:(_xmlNode *)a3
{
  if (!a3) {
    return 0;
  }
  id v7 = 0;
  int v3 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v7);
  id v4 = v7;
  v5 = v4;
  if (v3)
  {
    if ([v4 isEqualToString:@"days"])
    {
      int v3 = 0;
    }
    else if ([v5 isEqualToString:@"months"])
    {
      int v3 = 1;
    }
    else if ([v5 isEqualToString:@"years"])
    {
      int v3 = 2;
    }
    else
    {
      int v3 = 0;
    }
  }

  return v3;
}

+ (id)stringFromTimeUnit:(int)a3
{
  int v3 = @"days";
  if (a3 == 1) {
    int v3 = @"months";
  }
  if (a3 == 2) {
    return @"years";
  }
  else {
    return v3;
  }
}

@end