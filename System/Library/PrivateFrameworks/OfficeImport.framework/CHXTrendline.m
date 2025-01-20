@interface CHXTrendline
+ (id)chdTrendlineFromXmlTrendlineElement:(_xmlNode *)a3 state:(id)a4;
+ (id)stringFromTrendlineTypeEnum:(int)a3;
+ (int)chdTrendlineTypeFromXmlTrendlineTypeElement:(_xmlNode *)a3;
@end

@implementation CHXTrendline

+ (id)chdTrendlineFromXmlTrendlineElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = +[CHDTrendline trendline];
  v8 = [v6 drawingState];
  v9 = [v8 OAXChartNamespace];
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "dispEq");

  if (v10) {
    objc_msgSend(v7, "setDisplayEquation:", CXRequiredBoolAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }
  v11 = [v6 drawingState];
  v12 = [v11 OAXChartNamespace];
  v13 = (_xmlNode *)OCXFindChild(a3, v12, "dispRSqr");

  if (v13) {
    objc_msgSend(v7, "setDisplayRSquaredValue:", CXRequiredBoolAttribute(v13, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }
  v14 = [v6 drawingState];
  v15 = [v14 OAXChartNamespace];
  v16 = (_xmlNode *)OCXFindChild(a3, v15, "backward");

  if (v16)
  {
    double v43 = 0.0;
    if (CXOptionalDoubleAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v43)) {
      [v7 setBackward:v43];
    }
  }
  v17 = [v6 drawingState];
  v18 = [v17 OAXChartNamespace];
  v19 = (_xmlNode *)OCXFindChild(a3, v18, "forward");

  if (v19)
  {
    double v43 = 0.0;
    if (CXOptionalDoubleAttribute(v19, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v43)) {
      [v7 setForward:v43];
    }
  }
  v20 = [v6 drawingState];
  v21 = [v20 OAXChartNamespace];
  v22 = (_xmlNode *)OCXFindChild(a3, v21, "intercept");

  if (v22)
  {
    double v43 = 0.0;
    if (CXOptionalDoubleAttribute(v22, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v43)) {
      [v7 setInterceptYAxis:v43];
    }
  }
  v23 = [v6 drawingState];
  v24 = [v23 OAXChartNamespace];
  v25 = (_xmlNode *)OCXFindChild(a3, v24, "order");

  if (v25) {
    objc_msgSend(v7, "setPolynomialOrder:", CXRequiredLongAttribute(v25, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }
  v26 = [v6 drawingState];
  v27 = [v26 OAXChartNamespace];
  v28 = (_xmlNode *)OCXFindChild(a3, v27, "period");

  if (v28) {
    objc_msgSend(v7, "setMovingAveragePeriod:", CXRequiredLongAttribute(v28, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }
  v29 = [v6 drawingState];
  v30 = [v29 OAXChartNamespace];
  objc_msgSend(v7, "setType:", objc_msgSend(a1, "chdTrendlineTypeFromXmlTrendlineTypeElement:", OCXFindChild(a3, v30, "trendlineType")));

  v31 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:v31 element:a3 state:v6];
  [v7 setGraphicProperties:v31];
  v32 = [v6 drawingState];
  v33 = [v32 OAXChartNamespace];
  uint64_t v34 = OCXFindChild(a3, v33, "trendlineLbl");

  if (v34)
  {
    v35 = +[CHXTrendlineLabel chdTrendlineLabelFromXmlTrendlineLabelElement:v34 state:v6];
    [v7 setLabel:v35];
  }
  v36 = [v6 drawingState];
  v37 = [v36 OAXChartNamespace];
  uint64_t v38 = OCXFindChild(a3, v37, "name");

  if (v38)
  {
    v39 = objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", v38);
    v40 = v39;
    if (v39 && [v39 length])
    {
      v41 = +[EDString edStringWithString:v40];
      [v7 setName:v41];
    }
  }

  return v7;
}

+ (int)chdTrendlineTypeFromXmlTrendlineTypeElement:(_xmlNode *)a3
{
  if (a3)
  {
    id v8 = 0;
    BOOL v3 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v8);
    id v4 = v8;
    v5 = v4;
    if (v3)
    {
      if ([v4 isEqualToString:@"exp"])
      {
        int v6 = 0;
LABEL_8:

        return v6;
      }
      if (([v5 isEqualToString:@"linear"] & 1) == 0)
      {
        if ([v5 isEqualToString:@"log"])
        {
          int v6 = 2;
          goto LABEL_8;
        }
        if ([v5 isEqualToString:@"movingAvg"])
        {
          int v6 = 3;
          goto LABEL_8;
        }
        if ([v5 isEqualToString:@"poly"])
        {
          int v6 = 4;
          goto LABEL_8;
        }
        if ([v5 isEqualToString:@"power"])
        {
          int v6 = 5;
          goto LABEL_8;
        }
      }
    }
    int v6 = 1;
    goto LABEL_8;
  }
  return 1;
}

+ (id)stringFromTrendlineTypeEnum:(int)a3
{
  if (a3 > 5) {
    return @"linear";
  }
  else {
    return off_264D67D88[a3];
  }
}

@end