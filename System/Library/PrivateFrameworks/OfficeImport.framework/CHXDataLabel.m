@interface CHXDataLabel
+ (Class)chdDataValuePropertiesClassWithState:(id)a3;
+ (id)chdDataLabelFromXmlDataLabelElement:(_xmlNode *)a3 state:(id)a4;
+ (id)stringFromDataLabelPosition:(int)a3;
+ (int)chdDataLabelPositionFromXmlDataLabelElement:(_xmlNode *)a3 state:(id)a4;
+ (void)readFrom:(_xmlNode *)a3 dataValuePropertiesCollection:(id)a4 state:(id)a5;
@end

@implementation CHXDataLabel

+ (void)readFrom:(_xmlNode *)a3 dataValuePropertiesCollection:(id)a4 state:(id)a5
{
  id v36 = a4;
  id v8 = a5;
  v34 = +[CHXFont readParagraphPropertiesFromXmlTextPropertiesParentElement:a3 state:v8];
  v9 = [v8 drawingState];
  v10 = [v9 OAXChartNamespace];
  v11 = (_xmlNode *)OCXFindChild(a3, v10, "showLeaderLines");

  if (v11 && CXRequiredBoolAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"))
  {
    v12 = [v8 drawingState];
    v13 = [v12 OAXChartNamespace];
    uint64_t v14 = OCXFindChild(a3, v13, "leaderLines");

    if (v14)
    {
      v15 = objc_alloc_init(OADGraphicProperties);
      +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:v15 element:v14 state:v8];
      v32 = v15;
    }
    else
    {
      v32 = 0;
    }
    uint64_t v16 = 1;
    objc_msgSend(a1, "chdDataLabelFromXmlDataLabelElement:state:", a3, v8, v32);
  }
  else
  {
    uint64_t v16 = 0;
    objc_msgSend(a1, "chdDataLabelFromXmlDataLabelElement:state:", a3, v8, 0);
  v35 = };
  [v35 setShowLeaderLines:v16];
  if (v33) {
    int v17 = v16;
  }
  else {
    int v17 = 0;
  }
  if (v17 == 1) {
    [v35 setLeaderlineGraphicProperties:v33];
  }
  v18 = [v8 currentSeries];
  [v18 setDefaultDataLabel:v35];

  v19 = [v8 drawingState];
  v20 = [v19 OAXChartNamespace];
  v21 = (_xmlNode *)OCXFindChild(a3, v20, "dLbl");

  while (v21)
  {
    v22 = [v8 drawingState];
    v23 = [v22 OAXChartNamespace];
    uint64_t v24 = OCXFindChild(v21, v23, "spPr");

    if (!v24) {
      [v8 pushDefaultTextProperties:v34];
    }
    v25 = [a1 chdDataLabelFromXmlDataLabelElement:v21 state:v8];
    if (!v24) {
      [v8 popDefaultTextProperties];
    }
    [v25 setShowLeaderLines:v16];
    if (v16)
    {
      v26 = [v35 leaderlineGraphicProperties];
      [v25 setLeaderlineGraphicProperties:v26];
    }
    v27 = [v8 drawingState];
    v28 = [v27 OAXChartNamespace];
    v29 = OCXFindRequiredChild(v21, v28, (xmlChar *)"idx");

    uint64_t v30 = CXRequiredUnsignedLongAttribute(v29, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
    id v31 = [v36 objectWithKey:v30];
    if (!v31)
    {
      id v31 = objc_alloc_init((Class)[a1 chdDataValuePropertiesClassWithState:v8]);
      [v31 setDataValueIndex:v30];
      [v36 addObject:v31];
    }
    [v31 setDataLabel:v25];
    v21 = OCXNextSiblingNamed(v21, (xmlChar *)"dLbl");
  }
}

+ (id)chdDataLabelFromXmlDataLabelElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = [v6 resources];
  id v8 = +[CHDDataLabel dataLabelWithResources:v7];

  v9 = [v6 currentSeries];
  v10 = [v9 defaultDataLabel];

  if (v10)
  {
    v11 = [v6 currentSeries];
    v12 = [v11 defaultDataLabel];

    objc_msgSend(v8, "setPosition:", objc_msgSend(v12, "position"));
    objc_msgSend(v8, "setShowValue:", objc_msgSend(v12, "isShowValue"));
    objc_msgSend(v8, "setShowPercent:", objc_msgSend(v12, "isShowPercent"));
    objc_msgSend(v8, "setShowBubbleSize:", objc_msgSend(v12, "isShowBubbleSize"));
    objc_msgSend(v8, "setShowCategoryName:", objc_msgSend(v12, "isShowCategoryName"));
    objc_msgSend(v8, "setShowSeriesName:", objc_msgSend(v12, "isShowSeriesName"));
    objc_msgSend(v8, "setShowLegendKey:", objc_msgSend(v12, "isShowLegendKey"));
    objc_msgSend(v8, "setIsPositionAffineTransform:", objc_msgSend(v12, "isPositionAffineTransform"));
  }
  v13 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:v13 element:a3 state:v6];
  [v8 setGraphicProperties:v13];
  if ([(OADDrawableProperties *)v13 hasOrientedBounds]) {
    [v8 setIsPositionAffineTransform:1];
  }
  if ([(OADDrawableProperties *)v13 hasOrientedBounds]) {
    uint64_t v14 = 10;
  }
  else {
    uint64_t v14 = [a1 chdDataLabelPositionFromXmlDataLabelElement:a3 state:v6];
  }
  [v8 setPosition:v14];
  v15 = [v6 drawingState];
  uint64_t v16 = [v15 OAXChartNamespace];
  int v17 = (_xmlNode *)OCXFindChild(a3, v16, "showVal");

  if (v17) {
    objc_msgSend(v8, "setShowValue:", CXRequiredBoolAttribute(v17, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }
  v18 = [v6 drawingState];
  v19 = [v18 OAXChartNamespace];
  v20 = (_xmlNode *)OCXFindChild(a3, v19, "showPercent");

  if (v20) {
    objc_msgSend(v8, "setShowPercent:", CXRequiredBoolAttribute(v20, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }
  v21 = [v6 drawingState];
  v22 = [v21 OAXChartNamespace];
  v23 = (_xmlNode *)OCXFindChild(a3, v22, "showBubbleSize");

  if (v23) {
    objc_msgSend(v8, "setShowBubbleSize:", CXRequiredBoolAttribute(v23, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }
  uint64_t v24 = [v6 drawingState];
  v25 = [v24 OAXChartNamespace];
  v26 = (_xmlNode *)OCXFindChild(a3, v25, "showCatName");

  if (v26) {
    objc_msgSend(v8, "setShowCategoryName:", CXRequiredBoolAttribute(v26, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }
  v27 = [v6 drawingState];
  v28 = [v27 OAXChartNamespace];
  v29 = (_xmlNode *)OCXFindChild(a3, v28, "showLegendKey");

  if (v29) {
    objc_msgSend(v8, "setShowLegendKey:", CXRequiredBoolAttribute(v29, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }
  uint64_t v30 = [v6 drawingState];
  id v31 = [v30 OAXChartNamespace];
  v32 = (_xmlNode *)OCXFindChild(a3, v31, "showSerName");

  if (v32) {
    objc_msgSend(v8, "setShowSeriesName:", CXRequiredBoolAttribute(v32, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }
  v33 = [v6 drawingState];
  v34 = [v33 OAXChartNamespace];
  v35 = (_xmlNode *)OCXFindChild(a3, v34, "numFmt");

  if (v35)
  {
    id v62 = 0;
    BOOL v36 = CXOptionalStringAttribute(v35, (void *)CXNoNamespace, (xmlChar *)"formatCode", &v62);
    id v37 = v62;
    if (v36)
    {
      v38 = +[EDString edStringWithString:v37];
      v39 = +[EDContentFormat contentFormatWithFormatString:v38];

      [v8 setContentFormat:v39];
    }
    double v61 = 0.0;
    if (CXOptionalDoubleAttribute(v35, (CXNamespace *)CXNoNamespace, (xmlChar *)"sourceLinked", &v61)) {
      objc_msgSend(v8, "setIsContentFormatDerivedFromDataPoints:", v61 == 1.0, v61);
    }
  }
  v40 = [v6 drawingState];
  v41 = [v40 OAXChartNamespace];
  uint64_t v42 = OCXFindChild(a3, v41, "txPr");

  if (v42)
  {
    id v43 = +[CHXString edStringFromXmlRichElement:v42 state:v6];
    if (!v43)
    {
      v44 = +[CHXFont edRunCollectionFromXmlTextPropertiesElement:v42 state:v6];
      if (v44)
      {
        id v43 = +[EDString string];
        [v43 setRuns:v44];
      }
      else
      {
        id v43 = 0;
      }
    }
    [v8 setString:v43];
    goto LABEL_35;
  }
  v45 = [v6 drawingState];
  v46 = [v45 OAXChartNamespace];
  uint64_t v47 = OCXFindChild(a3, v46, "tx");

  if (v47)
  {
    id v59 = 0;
    id v60 = 0;
    +[CHXString readFromXmlTxElement:v47 formula:&v60 lastCached:&v59 state:v6];
    id v43 = v60;
    id v48 = v59;
    [v8 setString:v48];

LABEL_35:
  }
  v49 = [v6 drawingState];
  v50 = [v49 OAXChartNamespace];
  v51 = (_xmlNode *)OCXFindChild(a3, v50, "delete");

  if (v51 && CXRequiredBoolAttribute(v51, (CXNamespace *)CXNoNamespace, (xmlChar *)"val")) {
    [v8 setDeleted:1];
  }
  v52 = [v6 drawingState];
  v53 = [v52 OAXChartNamespace];
  v54 = (_xmlNode *)OCXFindChild(a3, v53, "extLst");

  if (v54)
  {
    v55 = [v6 drawingState];
    v56 = [v55 OAXChartNamespace];
    uint64_t v57 = OCXFindChild(v54, v56, "ext");

    if (v57) {
      [v8 setExtensionDetected:1];
    }
  }

  return v8;
}

+ (Class)chdDataValuePropertiesClassWithState:(id)a3
{
  v3 = [a3 currentChartType];
  objc_opt_class();
  objc_opt_isKindOfClass();
  v4 = objc_opt_class();

  return (Class)v4;
}

+ (int)chdDataLabelPositionFromXmlDataLabelElement:(_xmlNode *)a3 state:(id)a4
{
  v5 = [a4 drawingState];
  id v6 = [v5 OAXChartNamespace];
  v7 = (_xmlNode *)OCXFindChild(a3, v6, "dLblPos");

  if (!v7) {
    return 0;
  }
  id v8 = CXRequiredStringAttribute(v7, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  if ([v8 isEqualToString:@"bestFit"])
  {
    int v9 = 9;
  }
  else if ([v8 isEqualToString:@"b"])
  {
    int v9 = 6;
  }
  else if ([v8 isEqualToString:@"ctr"])
  {
    int v9 = 3;
  }
  else if ([v8 isEqualToString:@"inBase"])
  {
    int v9 = 4;
  }
  else if ([v8 isEqualToString:@"inEnd"])
  {
    int v9 = 2;
  }
  else if ([v8 isEqualToString:@"l"])
  {
    int v9 = 7;
  }
  else if ([v8 isEqualToString:@"outEnd"])
  {
    int v9 = 1;
  }
  else if ([v8 isEqualToString:@"r"])
  {
    int v9 = 8;
  }
  else if ([v8 isEqualToString:@"t"])
  {
    int v9 = 5;
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

+ (id)stringFromDataLabelPosition:(int)a3
{
  if ((a3 - 1) > 9) {
    return @"ctr";
  }
  else {
    return off_264D67CB0[a3 - 1];
  }
}

@end