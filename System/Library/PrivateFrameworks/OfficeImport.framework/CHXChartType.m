@interface CHXChartType
+ (Class)chxChartTypeClassWithXmlElement:(_xmlNode *)a3 state:(id)a4;
+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4;
+ (id)stringWithGroupingEnum:(int)a3;
+ (int)chdGroupingFromXmlGroupingElement:(_xmlNode *)a3;
+ (int)chdShapeTypeFromXmlShapeTypeElement:(_xmlNode *)a3;
+ (void)prepareChartTypeForWriting:(id)a3;
+ (void)resolveStyle:(id)a3 state:(id)a4;
@end

@implementation CHXChartType

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  v6 = +[CHXChartType chxChartTypeClassWithXmlElement:a3 state:v5];
  if (v6)
  {
    v7 = [(objc_class *)v6 chdChartTypeFromXmlChartTypeElement:a3 state:v5];
    [v5 setCurrentChartType:v7];
    v8 = [v5 drawingState];
    v9 = [v8 OAXChartNamespace];
    v10 = (_xmlNode *)OCXFindChild(a3, v9, "varyColors");

    if (v10) {
      objc_msgSend(v7, "setVaryColors:", CXRequiredBoolAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
    }
    v11 = OCXFirstChildNamed(a3, (xmlChar *)"ser");
    while (v11)
    {
      v12 = +[CHXSeries readFrom:v11 state:v5];
      [v12 setChartType:v7];
      v13 = [v7 seriesCollection];
      [v13 addObject:v12];

      v11 = OCXNextSiblingNamed(v11, (xmlChar *)"ser");
    }
    for (i = OCXFirstChildNamed(a3, (xmlChar *)"axId"); i; i = OCXNextSiblingNamed(i, (xmlChar *)"axId"))
    {
      v15 = CXRequiredUnsignedLongAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
      v16 = [v7 axisIds];
      v17 = [NSNumber numberWithUnsignedLong:v15];
      [v16 addObject:v17];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (int)chdGroupingFromXmlGroupingElement:(_xmlNode *)a3
{
  if (!a3) {
    return 0;
  }
  id v7 = 0;
  int v3 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v7);
  id v4 = v7;
  id v5 = v4;
  if (v3)
  {
    if ([v4 isEqualToString:@"percentStacked"])
    {
      int v3 = 1;
    }
    else if ([v5 isEqualToString:@"clustered"])
    {
      int v3 = 0;
    }
    else if ([v5 isEqualToString:@"standard"])
    {
      int v3 = 3;
    }
    else if ([v5 isEqualToString:@"stacked"])
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

+ (void)resolveStyle:(id)a3 state:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  if (v10)
  {
    v6 = [v10 seriesCollection];
    uint64_t v7 = [v6 count];
    if (v7)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        v9 = [v6 objectAtIndex:i];
        if (v9) {
          +[CHXSeries resolveSeriesStyle:v9 state:v5];
        }
      }
    }
  }
}

+ (int)chdShapeTypeFromXmlShapeTypeElement:(_xmlNode *)a3
{
  if (!a3) {
    return 0;
  }
  id v7 = 0;
  int v3 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v7);
  id v4 = v7;
  id v5 = v4;
  if (v3)
  {
    if ([v4 isEqualToString:@"cone"])
    {
      int v3 = 1;
    }
    else if ([v5 isEqualToString:@"coneToMax"])
    {
      int v3 = 2;
    }
    else if ([v5 isEqualToString:@"box"])
    {
      int v3 = 0;
    }
    else if ([v5 isEqualToString:@"cylinder"])
    {
      int v3 = 3;
    }
    else if ([v5 isEqualToString:@"pyramid"])
    {
      int v3 = 4;
    }
    else if ([v5 isEqualToString:@"pyramidToMax"])
    {
      int v3 = 5;
    }
    else
    {
      int v3 = 0;
    }
  }

  return v3;
}

+ (id)stringWithGroupingEnum:(int)a3
{
  if ((a3 - 1) > 2) {
    return @"clustered";
  }
  else {
    return off_264D67C98[a3 - 1];
  }
}

+ (Class)chxChartTypeClassWithXmlElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  v6 = [v5 drawingState];
  id v7 = [v6 OAXChartNamespace];
  BOOL HasName = CXNodeHasName(a3, v7, (xmlChar *)"pieChart");

  if (HasName) {
    goto LABEL_18;
  }
  v9 = [v5 drawingState];
  id v10 = [v9 OAXChartNamespace];
  BOOL v11 = CXNodeHasName(a3, v10, (xmlChar *)"doughnutChart");

  if (v11) {
    goto LABEL_18;
  }
  v12 = [v5 drawingState];
  v13 = [v12 OAXChartNamespace];
  BOOL v14 = CXNodeHasName(a3, v13, (xmlChar *)"ofPieChart");

  if (v14) {
    goto LABEL_18;
  }
  v15 = [v5 drawingState];
  v16 = [v15 OAXChartNamespace];
  BOOL v17 = CXNodeHasName(a3, v16, (xmlChar *)"pie3DChart");

  if (v17) {
    goto LABEL_18;
  }
  v18 = [v5 drawingState];
  v19 = [v18 OAXChartNamespace];
  BOOL v20 = CXNodeHasName(a3, v19, (xmlChar *)"barChart");

  if (v20) {
    goto LABEL_18;
  }
  v21 = [v5 drawingState];
  v22 = [v21 OAXChartNamespace];
  BOOL v23 = CXNodeHasName(a3, v22, (xmlChar *)"bar3DChart");

  if (v23) {
    goto LABEL_18;
  }
  v24 = [v5 drawingState];
  v25 = [v24 OAXChartNamespace];
  BOOL v26 = CXNodeHasName(a3, v25, (xmlChar *)"areaChart");

  if (v26) {
    goto LABEL_18;
  }
  v27 = [v5 drawingState];
  v28 = [v27 OAXChartNamespace];
  BOOL v29 = CXNodeHasName(a3, v28, (xmlChar *)"area3DChart");

  if (v29) {
    goto LABEL_18;
  }
  v30 = [v5 drawingState];
  v31 = [v30 OAXChartNamespace];
  BOOL v32 = CXNodeHasName(a3, v31, (xmlChar *)"lineChart");

  if (v32) {
    goto LABEL_18;
  }
  v33 = [v5 drawingState];
  v34 = [v33 OAXChartNamespace];
  BOOL v35 = CXNodeHasName(a3, v34, (xmlChar *)"stockChart");

  if (v35) {
    goto LABEL_18;
  }
  v36 = [v5 drawingState];
  v37 = [v36 OAXChartNamespace];
  BOOL v38 = CXNodeHasName(a3, v37, (xmlChar *)"line3DChart");

  if (v38) {
    goto LABEL_18;
  }
  v39 = [v5 drawingState];
  v40 = [v39 OAXChartNamespace];
  BOOL v41 = CXNodeHasName(a3, v40, (xmlChar *)"scatterChart");

  if (v41) {
    goto LABEL_18;
  }
  v42 = [v5 drawingState];
  v43 = [v42 OAXChartNamespace];
  BOOL v44 = CXNodeHasName(a3, v43, (xmlChar *)"bubbleChart");

  if (v44) {
    goto LABEL_18;
  }
  v53 = [v5 drawingState];
  v45 = [v53 OAXChartNamespace];
  if (CXNodeHasName(a3, v45, (xmlChar *)"radarChart")) {
    goto LABEL_17;
  }
  v46 = [v5 drawingState];
  v47 = [v46 OAXChartNamespace];
  if (CXNodeHasName(a3, v47, (xmlChar *)"surfaceChart"))
  {

LABEL_17:
LABEL_18:
    v48 = objc_opt_class();
    goto LABEL_19;
  }
  v50 = [v5 drawingState];
  v51 = [v50 OAXChartNamespace];
  BOOL v52 = CXNodeHasName(a3, v51, (xmlChar *)"surface3DChart");

  if (v52) {
    goto LABEL_18;
  }
  v48 = 0;
LABEL_19:

  return (Class)v48;
}

+ (void)prepareChartTypeForWriting:(id)a3
{
  id v24 = a3;
  int v3 = [v24 axes];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [v24 axes];
    v6 = [v5 objectAtIndex:0];
    unsigned int v7 = [v6 axisId];

    BOOL v8 = v7 > 2;
  }
  else
  {
    BOOL v8 = 0;
  }
  v9 = [v24 axisIds];
  [v9 removeAllObjects];

  id v10 = [v24 chart];
  BOOL v11 = [v10 plotArea];
  v12 = [v11 axes];

  for (unint64_t i = 0; i < [v12 count]; ++i)
  {
    BOOL v14 = [v12 objectAtIndex:i];
    uint64_t v15 = [v14 axisId];

    if (((v8 ^ ((int)v15 > 2)) & 1) == 0)
    {
      v16 = [v24 axisIds];
      BOOL v17 = [NSNumber numberWithInt:v15];
      [v16 addObject:v17];
    }
  }
  v18 = [v24 axes];
  for (unint64_t j = 0; j < [v18 count]; ++j)
  {
    BOOL v20 = [v18 objectAtIndex:j];
    int v21 = [v20 axisId];
    if (v21) {
      BOOL v22 = v21 == 3;
    }
    else {
      BOOL v22 = 1;
    }
    if (v22) {
      uint64_t v23 = v21 + 1;
    }
    else {
      uint64_t v23 = v21 - 1;
    }
    [v20 setCrossAxisId:(double)(unint64_t)v23];
  }
}

@end