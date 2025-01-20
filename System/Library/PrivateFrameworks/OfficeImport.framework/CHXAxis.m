@interface CHXAxis
+ (Class)chxAxisClassWithChdAxis:(id)a3;
+ (Class)chxAxisClassWithXmlAxisElement:(_xmlNode *)a3 state:(id)a4;
+ (id)chdAxisFromXmlAxisElement:(_xmlNode *)a3 state:(id)a4;
+ (int)chdAxisPositionFromXmlAxisElement:(_xmlNode *)a3 state:(id)a4;
+ (int)chdCrossesFromXmlAxisElement:(_xmlNode *)a3 state:(id)a4;
+ (int)chdTickLabelPositionFromXmlTickLabelPositionElement:(_xmlNode *)a3;
+ (int)chdTickMarkFromXmlTickMarkElement:(_xmlNode *)a3;
+ (void)readScalingFromXmlScalingElement:(_xmlNode *)a3 axis:(id)a4 state:(id)a5;
@end

@implementation CHXAxis

+ (id)chdAxisFromXmlAxisElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = (void *)[a1 chxAxisClassWithXmlAxisElement:a3 state:v6];
  if (v7)
  {
    v8 = [v7 chdAxisFromXmlAxisElement:a3 state:v6];
    v9 = [v6 drawingState];
    v10 = [v9 OAXChartNamespace];
    v11 = OCXFindRequiredChild(a3, v10, (xmlChar *)"axId");

    objc_msgSend(v8, "setAxisId:", CXRequiredUnsignedLongAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
    v12 = [v6 drawingState];
    v13 = [v12 OAXChartNamespace];
    v14 = (_xmlNode *)OCXFindChild(a3, v13, "delete");

    if (v14)
    {
      objc_msgSend(v8, "setDeleted:", CXRequiredBoolAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
    }
    else
    {
      v15 = [v6 drawingState];
      v16 = [v15 appVersion];

      objc_msgSend(v8, "setDeleted:", objc_msgSend(v16, "hasPrefix:", @"12.") ^ 1);
    }
    v17 = [v6 drawingState];
    v18 = [v17 OAXChartNamespace];
    v19 = OCXFindRequiredChild(a3, v18, (xmlChar *)"scaling");

    [a1 readScalingFromXmlScalingElement:v19 axis:v8 state:v6];
    objc_msgSend(v8, "setAxisPosition:", objc_msgSend(a1, "chdAxisPositionFromXmlAxisElement:state:", a3, v6));
    v20 = [v6 drawingState];
    v21 = [v20 OAXChartNamespace];
    uint64_t v22 = OCXFindChild(a3, v21, "title");

    if (v22)
    {
      v23 = +[CHXTitle chdTitleFromXmlTitleElement:v22 isChartTitle:0 state:v6];
      [v8 setTitle:v23];
    }
    v24 = [v6 drawingState];
    v25 = [v24 OAXChartNamespace];
    v26 = (_xmlNode *)OCXFindChild(a3, v25, "numFmt");

    if (v26)
    {
      id v87 = 0;
      BOOL v27 = CXOptionalStringAttribute(v26, (void *)CXNoNamespace, (xmlChar *)"formatCode", &v87);
      id v28 = v87;
      if (v27)
      {
        v29 = +[EDString edStringWithString:v28];
        v30 = +[EDContentFormat contentFormatWithFormatString:v29];

        [v8 setContentFormat:v30];
      }
      double v86 = 0.0;
      if (CXOptionalDoubleAttribute(v26, (CXNamespace *)CXNoNamespace, (xmlChar *)"sourceLinked", &v86)) {
        objc_msgSend(v8, "setIsContentFormatDerivedFromDataPoints:", v86 == 1.0, v86);
      }
    }
    v31 = [v6 drawingState];
    v32 = [v31 OAXChartNamespace];
    uint64_t v33 = OCXFindChild(a3, v32, "majorTickMark");

    if (v33) {
      uint64_t v34 = [a1 chdTickMarkFromXmlTickMarkElement:v33];
    }
    else {
      uint64_t v34 = 2;
    }
    [v8 setMajorTickMark:v34];
    v35 = [v6 drawingState];
    v36 = [v35 OAXChartNamespace];
    uint64_t v37 = OCXFindChild(a3, v36, "minorTickMark");

    if (v37) {
      uint64_t v38 = [a1 chdTickMarkFromXmlTickMarkElement:v37];
    }
    else {
      uint64_t v38 = 0;
    }
    [v8 setMinorTickMark:v38];
    v39 = [v6 drawingState];
    v40 = [v39 OAXChartNamespace];
    uint64_t v41 = OCXFindChild(a3, v40, "tickLblPos");

    if (v41) {
      objc_msgSend(v8, "setTickLabelPosition:", objc_msgSend(a1, "chdTickLabelPositionFromXmlTickLabelPositionElement:", v41));
    }
    v42 = [v6 drawingState];
    v43 = [v42 OAXChartNamespace];
    v44 = (_xmlNode *)OCXFindChild(a3, v43, "crossBetween");

    if (v44)
    {
      v45 = CXRequiredStringAttribute(v44, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
      if ([v45 isEqualToString:@"between"]) {
        uint64_t v46 = 1;
      }
      else {
        uint64_t v46 = [v45 isEqualToString:@"midCat"] ^ 1;
      }
      [v8 setCrossBetween:v46];
    }
    objc_msgSend(v8, "setCrosses:", objc_msgSend(a1, "chdCrossesFromXmlAxisElement:state:", a3, v6));
    v47 = [v6 drawingState];
    v48 = [v47 OAXChartNamespace];
    v49 = (_xmlNode *)OCXFindChild(a3, v48, "crossesAt");

    if (v49)
    {
      double v86 = 0.0;
      if (CXOptionalDoubleAttribute(v49, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v86)) {
        [v8 setCrossesAt:v86];
      }
    }
    v50 = [v6 drawingState];
    v51 = [v50 OAXChartNamespace];
    uint64_t v52 = OCXFindChild(a3, v51, "txPr");

    if (v52)
    {
      v53 = objc_alloc_init(OADTextBody);
      v54 = [v6 drawingState];
      +[OAXTextBody readTextBodyFromXmlNode:v52 textBody:v53 drawingState:v54];

      v55 = +[CHXFont edFontWithOadTextBody:v53 state:v6];
      [v8 setFont:v55];
      if ([(OADTextBody *)v53 paragraphCount])
      {
        v56 = [(OADTextBody *)v53 firstParagraphEffects];
        v57 = +[OAXEffect updateIncomingEffects:v56];

        [v8 setLabelEffects:v57];
      }
      v58 = [(OADTextBody *)v53 properties];
      double v59 = 0.0;
      if (v58)
      {
        v60 = [(OADTextBody *)v53 properties];
        int v61 = [v60 hasRotation];

        if (v61)
        {
          v62 = [(OADTextBody *)v53 properties];
          [v62 rotation];
          float v64 = v63;
          double v65 = v63;

          if (v64 > -1000.0 || v64 <= -1001.0) {
            double v59 = v65;
          }
          else {
            double v59 = 0.0;
          }
        }
      }
      [v8 setTickLabelRotationAngle:v59];
    }
    v67 = [v6 drawingState];
    v68 = [v67 OAXChartNamespace];
    uint64_t v69 = OCXFindChild(a3, v68, "minorGridlines");

    v70 = objc_alloc_init(OADGraphicProperties);
    +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:v70 element:v69 state:v6];
    if (!v69)
    {
      v71 = +[OADStroke nullStroke];
      [(OADGraphicProperties *)v70 setStroke:v71];
    }
    v72 = [v6 autoStyling];
    [v72 resolveMinorGridLinesGraphicProperties:v70];

    [v8 setMinorGridLinesGraphicProperties:v70];
    v73 = [v6 drawingState];
    v74 = [v73 OAXChartNamespace];
    uint64_t v75 = OCXFindChild(a3, v74, "majorGridlines");

    v76 = objc_alloc_init(OADGraphicProperties);
    +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:v76 element:v75 state:v6];
    if (!v75)
    {
      v77 = +[OADStroke nullStroke];
      [(OADGraphicProperties *)v76 setStroke:v77];
    }
    v78 = [v6 autoStyling];
    [v78 resolveMajorGridLinesGraphicProperties:v76];

    [v8 setMajorGridLinesGraphicProperties:v76];
    v79 = objc_alloc_init(OADGraphicProperties);
    +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:v79 element:a3 state:v6];
    if ([(OADGraphicProperties *)v79 hasStroke])
    {
      v80 = [(OADGraphicProperties *)v79 stroke];
      if ([v80 isFillOverridden])
      {
        v81 = [(OADGraphicProperties *)v79 stroke];
        v82 = [v81 fill];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          [v8 setLineVisible:0];
        }
      }
      else
      {
      }
    }
    v84 = [v6 autoStyling];
    [v84 resolveAxisGraphicProperties:v79];

    [v8 setAxisGraphicProperties:v79];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (void)readScalingFromXmlScalingElement:(_xmlNode *)a3 axis:(id)a4 state:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [v8 drawingState];
  v10 = [v9 OAXChartNamespace];
  v11 = (_xmlNode *)OCXFindChild(a3, v10, "max");

  if (v11)
  {
    double v19 = 0.0;
    if (CXOptionalDoubleAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v19)) {
      [v7 setScalingMaximum:v19];
    }
  }
  v12 = [v8 drawingState];
  v13 = [v12 OAXChartNamespace];
  v14 = (_xmlNode *)OCXFindChild(a3, v13, "min");

  if (v14)
  {
    double v19 = 0.0;
    if (CXOptionalDoubleAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v19)) {
      [v7 setScalingMinimum:v19];
    }
  }
  v15 = [v8 drawingState];
  v16 = [v15 OAXChartNamespace];
  v17 = (_xmlNode *)OCXFindChild(a3, v16, "orientation");

  if (v17)
  {
    v18 = CXDefaultStringAttribute(v17, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", 0);
    if ([v18 isEqualToString:@"maxMin"])
    {
      [v7 setOrientation:1];
      [v7 setReverseOrder:1];
    }
  }
}

+ (int)chdTickLabelPositionFromXmlTickLabelPositionElement:(_xmlNode *)a3
{
  if (!a3) {
    return 3;
  }
  id v13 = 0;
  BOOL v3 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v13);
  id v4 = v13;
  v5 = v4;
  if (v3)
  {
    int v6 = [v4 isEqualToString:@"high"];
    int v7 = [v5 isEqualToString:@"low"];
    int v8 = [v5 isEqualToString:@"nextTo"];
    int v9 = [v5 isEqualToString:@"none"];
    if (v6) {
      int v10 = 2;
    }
    else {
      int v10 = 3;
    }
    if (v7) {
      int v10 = 1;
    }
    if (v8) {
      int v10 = 3;
    }
    if (v9) {
      int v11 = 0;
    }
    else {
      int v11 = v10;
    }
  }
  else
  {
    int v11 = 3;
  }

  return v11;
}

+ (int)chdTickMarkFromXmlTickMarkElement:(_xmlNode *)a3
{
  if (!a3) {
    return 3;
  }
  id v12 = 0;
  BOOL v3 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v12);
  id v4 = v12;
  v5 = v4;
  if (v3)
  {
    [v4 isEqualToString:@"cross"];
    int v6 = [v5 isEqualToString:@"in"];
    int v7 = [v5 isEqualToString:@"none"];
    int v8 = [v5 isEqualToString:@"out"];
    if (v6) {
      int v9 = 1;
    }
    else {
      int v9 = 3;
    }
    if (v7) {
      int v9 = 0;
    }
    if (v8) {
      int v10 = 2;
    }
    else {
      int v10 = v9;
    }
  }
  else
  {
    int v10 = 3;
  }

  return v10;
}

+ (Class)chxAxisClassWithXmlAxisElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  int v6 = [v5 drawingState];
  int v7 = [v6 OAXChartNamespace];
  BOOL HasName = CXNodeHasName(a3, v7, (xmlChar *)"valAx");

  if (HasName) {
    goto LABEL_5;
  }
  int v9 = [v5 drawingState];
  int v10 = [v9 OAXChartNamespace];
  BOOL v11 = CXNodeHasName(a3, v10, (xmlChar *)"catAx");

  if (v11) {
    goto LABEL_5;
  }
  id v12 = [v5 drawingState];
  id v13 = [v12 OAXChartNamespace];
  BOOL v14 = CXNodeHasName(a3, v13, (xmlChar *)"dateAx");

  if (v14
    || ([v5 drawingState],
        v15 = objc_claimAutoreleasedReturnValue(),
        [v15 OAXChartNamespace],
        v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        BOOL v17 = CXNodeHasName(a3, v16, (xmlChar *)"serAx"),
        v16,
        v15,
        v17))
  {
LABEL_5:
    v18 = objc_opt_class();
  }
  else
  {
    v18 = 0;
  }

  return (Class)v18;
}

+ (Class)chxAxisClassWithChdAxis:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }

  return (Class)v4;
}

+ (int)chdAxisPositionFromXmlAxisElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = [a4 drawingState];
  int v6 = [v5 OAXChartNamespace];
  int v7 = OCXFindRequiredChild(a3, v6, (xmlChar *)"axPos");

  int v8 = CXRequiredStringAttribute(v7, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  if ([v8 isEqualToString:@"b"])
  {
    int v9 = 0;
  }
  else if ([v8 isEqualToString:@"l"])
  {
    int v9 = 1;
  }
  else if ([v8 isEqualToString:@"r"])
  {
    int v9 = 2;
  }
  else if ([v8 isEqualToString:@"t"])
  {
    int v9 = 3;
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

+ (int)chdCrossesFromXmlAxisElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = [a4 drawingState];
  int v6 = [v5 OAXChartNamespace];
  int v7 = (_xmlNode *)OCXFindChild(a3, v6, "crosses");

  if (!v7) {
    return 0;
  }
  int v8 = CXRequiredStringAttribute(v7, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  if (([v8 isEqualToString:@"autoZero"] & 1) == 0)
  {
    if ([v8 isEqualToString:@"min"])
    {
      int v9 = 1;
      goto LABEL_6;
    }
    char v10 = [v8 isEqualToString:@"max"];

    if (v10) {
      return 2;
    }
    return 0;
  }
  int v9 = 0;
LABEL_6:

  return v9;
}

@end