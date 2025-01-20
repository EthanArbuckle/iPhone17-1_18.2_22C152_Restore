@interface CHXChart
+ (id)readFromXmlDocument:(_xmlDoc *)a3 chartStyleId:(int)a4 state:(id)a5;
+ (id)readFromXmlDocument:(_xmlDoc *)a3 state:(id)a4;
+ (int)chdDisplayBlanksAsEnumFromXmlElement:(_xmlNode *)a3;
+ (void)readChartFromXmlNode:(_xmlNode *)a3 chart:(id)a4 state:(id)a5;
+ (void)readDefaultTextPropertiesFromXmlNode:(_xmlNode *)a3 chart:(id)a4 state:(id)a5;
@end

@implementation CHXChart

+ (id)readFromXmlDocument:(_xmlDoc *)a3 state:(id)a4
{
  id v6 = a4;
  if (!a3) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  v7 = OCXGetRootElement(a3);
  v8 = [v6 drawingState];
  v9 = [v8 OAXChartNamespace];
  v10 = (_xmlNode *)OCXFindChild(v7, v9, "style");

  if (v10) {
    goto LABEL_4;
  }
  v12 = (_xmlNode *)OCXFindChild(v7, (CXNamespace *)OCXMarkupCompatibilityNamespace, "AlternateContent");
  v13 = v12;
  if (!v12) {
    goto LABEL_11;
  }
  v14 = (_xmlNode *)OCXFindChild(v12, (CXNamespace *)OCXMarkupCompatibilityNamespace, "Choice");
  if (v14)
  {
    v15 = [v6 drawingState];
    v16 = [v15 OAXChartNamespace];
    v10 = (_xmlNode *)OCXFindChild(v14, v16, "style");

    if (v10) {
      goto LABEL_4;
    }
  }
  v17 = (_xmlNode *)OCXFindChild(v13, (CXNamespace *)OCXMarkupCompatibilityNamespace, "Fallback");
  if (!v17) {
    goto LABEL_11;
  }
  v18 = [v6 drawingState];
  v19 = [v18 OAXChartNamespace];
  v10 = (_xmlNode *)OCXFindChild(v17, v19, "style");

  if (v10)
  {
LABEL_4:
    unint64_t v11 = CXDefaultUnsignedLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", 2);
    if (v11 - 49 <= 0xFFFFFFFFFFFFFFCFLL) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
  }
  else
  {
LABEL_11:
    unint64_t v11 = 2;
  }
  v20 = [a1 readFromXmlDocument:a3 chartStyleId:v11 state:v6];

  return v20;
}

+ (id)readFromXmlDocument:(_xmlDoc *)a3 chartStyleId:(int)a4 state:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  if (!a3) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  v9 = OCXGetRootElement(a3);
  v10 = objc_alloc_init(CHDChart);
  [(CHDChart *)v10 setStyleId:v5];
  [v8 setChart:v10];
  unint64_t v11 = [v8 drawingState];
  v12 = [v11 client];
  if (objc_opt_respondsToSelector())
  {
    v13 = [v8 autoStyling];
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0) {
      goto LABEL_7;
    }
    unint64_t v11 = [v8 autoStyling];
    v12 = [v8 drawingState];
    v15 = [v12 client];
    objc_msgSend(v11, "setAutoChartFillIsHollow:", objc_msgSend(v15, "chartAutoFillIsHollow"));
  }
LABEL_7:
  v16 = [v8 drawingState];
  v17 = [v16 client];
  if (objc_opt_respondsToSelector())
  {
    v18 = [v8 autoStyling];
    char v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) == 0) {
      goto LABEL_11;
    }
    v16 = [v8 autoStyling];
    v17 = [v8 drawingState];
    v20 = [v17 client];
    objc_msgSend(v16, "setAutoChartStrokeIsHollow:", objc_msgSend(v20, "chartAutoStrokeIsHollow"));
  }
LABEL_11:
  -[CHDChart setLogicalBounds:](v10, "setLogicalBounds:", 0.0, 0.0, 1.0, 1.0);
  v21 = [v8 drawingState];
  v22 = [v21 excelState];
  v23 = [v22 currentSheet];
  [(CHDChart *)v10 setSheet:v23];

  [a1 readDefaultTextPropertiesFromXmlNode:v9 chart:v10 state:v8];
  v24 = [v8 drawingState];
  v25 = [v24 OAXChartNamespace];
  v26 = OCXFindRequiredChild(v9, v25, (xmlChar *)"chart");

  [a1 readChartFromXmlNode:v26 chart:v10 state:v8];
  +[CHXUserShapes readFromCharSpaceNode:v9 state:v8];
  v27 = [v8 chartPart];
  v28 = v27;
  if (v27)
  {
    v29 = [v27 firstPartWithRelationshipOfType:@"http://schemas.openxmlformats.org/officeDocument/2006/relationships/themeOverride"];
    if (v29)
    {
      v30 = objc_alloc_init(OADThemeOverrides);
      v31 = [v8 drawingState];
      +[OAXThemeOverrides readFromPackagePart:v29 toThemeOverrides:v30 drawingState:v31];

      [(CHDChart *)v10 setThemeOverrides:v30];
    }
  }
  return v10;
}

+ (void)readDefaultTextPropertiesFromXmlNode:(_xmlNode *)a3 chart:(id)a4 state:(id)a5
{
  id v29 = a4;
  id v7 = a5;
  id v8 = [v7 resources];
  v9 = +[CHDDefaultTextProperty defaultTextPropertyWithResources:v8];

  [v9 setDefaultTextType:2];
  v10 = [v29 defaultTextProperties];
  [v10 addObject:v9];

  unint64_t v11 = +[CHXFont readParagraphPropertiesFromXmlTextPropertiesParentElement:a3 state:v7];
  v12 = [v7 drawingState];
  v13 = [v12 OAXChartNamespace];
  uint64_t v14 = OCXFindChild(a3, v13, "txPr");

  [v11 setMergedWithParent:0];
  if (([v11 hasLatinFont] & 1) == 0)
  {
    v15 = [v7 drawingState];
    v16 = [v15 fontScheme];
    v17 = [v16 minorFont];
    v18 = [v17 latinFont];

    [v11 setLatinFont:v18];
  }
  objc_msgSend(v7, "setDefaultTextPropertiesHaveExplicitFontSize:", objc_msgSend(v11, "hasSize"));
  if (([v11 hasSize] & 1) == 0)
  {
    LODWORD(v19) = 10.0;
    [v11 setSize:v19];
  }
  if (![v11 hasFill]
    || ([v11 fill],
        v20 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v20,
        (isKindOfClass & 1) == 0))
  {
    v22 = [v7 autoStyling];
    v23 = [v22 autoTextFill];

    [v11 setFill:v23];
  }
  [v11 setMergedWithParent:1];
  [v7 setDefaultTextProperties:v11];
  if (v14) {
    +[CHXFont edRunCollectionFromXmlTextPropertiesElement:v14 state:v7];
  }
  else {
  v24 = +[CHXFont defaultEdRunCollectionWithState:v7];
  }
  if (v24)
  {
    v25 = [v29 defaultTextProperties];
    v26 = [v25 allTextDefaultProperties];
    [v26 setRuns:v24];

    v27 = [v29 defaultTextProperties];
    v28 = [v27 allTextDefaultProperties];
    [v28 setContentFormatId:0];
  }
}

+ (void)readChartFromXmlNode:(_xmlNode *)a3 chart:(id)a4 state:(id)a5
{
  id v66 = a4;
  id v7 = a5;
  parent = a3->parent;
  v65 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:v65 element:parent state:v7];
  v9 = [v7 autoStyling];
  [v9 resolveChartAreaGraphicProperties:v65];

  [v66 setChartAreaGraphicProperties:v65];
  v10 = [v7 drawingState];
  unint64_t v11 = [v10 OAXChartNamespace];
  uint64_t v12 = OCXFindChild(a3, v11, "floor");

  v13 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:v13 element:v12 state:v7];
  uint64_t v14 = [v7 autoStyling];
  [v14 resolveFloorGraphicProperties:v13];

  [v66 setFloorGraphicProperties:v13];
  v15 = [v7 drawingState];
  v16 = [v15 OAXChartNamespace];
  uint64_t v17 = OCXFindChild(a3, v16, "backWall");

  v18 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:v18 element:v17 state:v7];
  double v19 = [v7 autoStyling];
  [v19 resolveWallGraphicProperties:v18];

  [v66 setBackWallGraphicProperties:v18];
  v20 = [v7 drawingState];
  v21 = [v20 OAXChartNamespace];
  uint64_t v22 = OCXFindChild(a3, v21, "sideWall");

  v23 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:v23 element:v22 state:v7];
  v24 = [v7 autoStyling];
  [v24 resolveWallGraphicProperties:v23];

  [v66 setSideWallGraphicProperties:v23];
  v25 = [v7 drawingState];
  v26 = [v25 OAXChartNamespace];
  uint64_t v27 = OCXFindChild(a3, v26, "view3D");

  if (v27)
  {
    v28 = +[CHXView3D chdView3DFromXmlView3DElement:v27 state:v7];
    [v66 setView3D:v28];
  }
  id v29 = [v7 drawingState];
  v30 = [v29 OAXChartNamespace];
  v31 = OCXFindRequiredChild(a3, v30, (xmlChar *)"plotArea");

  if (!v31) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  v63 = +[CHXPlotArea readFrom:v31 state:v7];
  objc_msgSend(v66, "setPlotArea:");
  v32 = [v7 drawingState];
  v33 = [v32 OAXChartNamespace];
  uint64_t v34 = OCXFindChild(a3, v33, "legend");

  if (v34)
  {
    v35 = +[CHXLegend chdLegendFromXmlLegendElement:v34 state:v7];
    [v66 setLegend:v35];
  }
  v36 = [v7 drawingState];
  v37 = [v36 OAXChartNamespace];
  uint64_t v38 = OCXFindChild(a3, v37, "title");

  if (v38)
  {
    [v66 setAutoTitleDeleted:0];
    v39 = +[CHXTitle chdTitleFromXmlTitleElement:v38 isChartTitle:1 state:v7];
    [v66 setTitle:v39];

    v40 = [v66 title];
    int v41 = [v40 isAutoGenerated];

    if (v41)
    {
      v42 = [v66 mainType];
      v43 = [v7 resources];
      v44 = [v42 defaultTitleWithResources:v43];

      if (v44)
      {
        v45 = [v66 title];
        [v45 setLastCachedName:v44];
      }
    }
    v46 = [v66 title];
    v47 = [v46 lastCachedName];

    if (!v47)
    {
      v48 = [v66 title];
      v49 = +[EDString string];
      [v48 setLastCachedName:v49];
    }
    v50 = [v66 title];
    v51 = [v50 lastCachedName];
    v52 = [v51 runs];

    if (!v52)
    {
      v53 = [v66 title];
      v54 = [v53 lastCachedName];
      v55 = [v66 title];
      v56 = +[CHXFont defaultEdRunCollectionForTitle:v55 titleElement:v38 state:v7];
      [v54 setRuns:v56];
    }
  }
  v57 = [v7 drawingState];
  v58 = [v57 OAXChartNamespace];
  v59 = (_xmlNode *)OCXFindChild(a3, v58, "plotVisOnly");

  if (v59) {
    objc_msgSend(v66, "setPlotVisibleCellsOnly:", CXRequiredBoolAttribute(v59, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }
  v60 = [v7 drawingState];
  v61 = [v60 OAXChartNamespace];
  uint64_t v62 = OCXFindChild(a3, v61, "dispBlanksAs");

  objc_msgSend(v66, "setDisplayBlankAs:", objc_msgSend(a1, "chdDisplayBlanksAsEnumFromXmlElement:", v62));
}

+ (int)chdDisplayBlanksAsEnumFromXmlElement:(_xmlNode *)a3
{
  if (a3)
  {
    v3 = CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
    if ([v3 isEqualToString:@"span"])
    {
      int v4 = 1;
LABEL_10:

      return v4;
    }
    if (([v3 isEqualToString:@"gap"] & 1) == 0)
    {
      if ([v3 isEqualToString:@"zero"])
      {
        int v4 = 2;
        goto LABEL_10;
      }
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    int v4 = 0;
    goto LABEL_10;
  }
  return 0;
}

@end