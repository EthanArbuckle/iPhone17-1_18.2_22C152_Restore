@interface CHXSeries
+ (Class)chxSeriesClassWithState:(id)a3;
+ (id)chdSeriesFromXmlSeriesElement:(_xmlNode *)a3 state:(id)a4;
+ (id)readFrom:(_xmlNode *)a3 state:(id)a4;
+ (void)resolveSeriesStyle:(id)a3 state:(id)a4;
@end

@implementation CHXSeries

+ (id)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  v6 = [(objc_class *)+[CHXSeries chxSeriesClassWithState:v5] chdSeriesFromXmlSeriesElement:a3 state:v5];
  [v5 setCurrentSeries:v6];
  v7 = [v5 drawingState];
  v8 = [v7 OAXChartNamespace];
  v9 = OCXFindRequiredChild(a3, v8, (xmlChar *)"idx");

  objc_msgSend(v6, "setStyleIndex:", CXRequiredUnsignedLongAttribute(v9, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  v10 = [v5 drawingState];
  v11 = [v10 OAXChartNamespace];
  v12 = OCXFindRequiredChild(a3, v11, (xmlChar *)"order");

  objc_msgSend(v6, "setOrder:", (int)CXRequiredLongAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  v13 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:v13 element:a3 state:v5];
  if ([(OADGraphicProperties *)v13 hasFill])
  {
    v14 = [(OADGraphicProperties *)v13 fill];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v16 = [(OADGraphicProperties *)v13 fill];
      v17 = [v5 drawingState];
      v18 = [v17 OAXChartNamespace];
      v19 = (_xmlNode *)OCXFindChild(a3, v18, "pictureOptions");

      if (v19)
      {
        v20 = [v5 drawingState];
        v21 = [v20 OAXChartNamespace];
        v22 = (_xmlNode *)OCXFindChild(v19, v21, "pictureFormat");

        if (v22)
        {
          id v81 = 0;
          BOOL v23 = CXOptionalStringAttribute(v22, (void *)CXNoNamespace, (xmlChar *)"val", &v81);
          id v24 = v81;
          v25 = v24;
          if (v23
            && (([v24 isEqualToString:@"stackScale"] & 1) != 0
             || [v25 isEqualToString:@"stack"]))
          {
            v26 = objc_alloc_init(OADTileTechnique);
            [v16 setTechnique:v26];
          }
        }
        else
        {
          v25 = 0;
        }
      }
    }
  }
  [v6 setGraphicProperties:v13];
  v27 = [v5 drawingState];
  v28 = [v27 OAXChartNamespace];
  uint64_t v29 = OCXFindChild(a3, v28, "val");

  if (v29
    || ([v5 drawingState],
        v30 = objc_claimAutoreleasedReturnValue(),
        [v30 OAXChartNamespace],
        v31 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        uint64_t v29 = OCXFindChild(a3, v31, "yVal"),
        v31,
        v30,
        v29))
  {
    v32 = +[CHXData chdDataFromXmlDataElement:v29 state:v5];
    [v6 setValueData:v32];
    v33 = [v32 dataValues];
    uint64_t v34 = [v33 count];

    if (!v34) {
      [v6 setHiddenFlag:1];
    }
  }
  v35 = [v5 drawingState];
  v36 = [v35 OAXChartNamespace];
  uint64_t v37 = OCXFindChild(a3, v36, "cat");

  if (v37
    || ([v5 drawingState],
        v38 = objc_claimAutoreleasedReturnValue(),
        [v38 OAXChartNamespace],
        v39 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        uint64_t v37 = OCXFindChild(a3, v39, "xVal"),
        v39,
        v38,
        v37))
  {
    v40 = +[CHXData chdDataFromXmlDataElement:v37 state:v5];
    [v6 setCategoryData:v40];
  }
  else
  {
    v40 = [v5 resources];
    v77 = +[CHDData dataWithResources:v40];
    [v6 setCategoryData:v77];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v41 = [v5 drawingState];
    v42 = [v41 OAXChartNamespace];
    uint64_t v43 = OCXFindChild(a3, v42, "bubbleSize");

    if (v43)
    {
      v44 = +[CHXData chdDataFromXmlDataElement:v43 state:v5];
      [v6 setSizeData:v44];
    }
  }
  v45 = OCXFirstChildNamed(a3, (xmlChar *)"dPt");
  while (v45)
  {
    v46 = +[CHXDataValueProperties readFrom:v45 state:v5];
    v47 = [v6 dataValuePropertiesCollection];
    [v47 addObject:v46];

    v45 = OCXNextSiblingNamed(v45, (xmlChar *)"dPt");
  }
  v48 = [v5 drawingState];
  v49 = [v48 OAXChartNamespace];
  uint64_t v50 = OCXFindChild(a3, v49, "dLbls");

  if (v50) {
    goto LABEL_27;
  }
  parent = a3->parent;
  v52 = [v5 drawingState];
  v53 = [v52 OAXChartNamespace];
  uint64_t v50 = OCXFindChild(parent, v53, "dLbls");

  if (v50)
  {
LABEL_27:
    v54 = [v6 dataValuePropertiesCollection];
    +[CHXDataLabel readFrom:v50 dataValuePropertiesCollection:v54 state:v5];
  }
  v55 = OCXFirstChildNamed(a3, (xmlChar *)"errBars");
  if (v55)
  {
    v56 = +[CHXErrorBar chdErrorBarFromXmlErrorBarElement:v55 state:v5];
    [v6 setErrorBar:v56];
    v57 = OCXNextSiblingNamed(v55, (xmlChar *)"errBars");
    if (v57)
    {
      uint64_t v58 = +[CHXErrorBar chdErrorBarFromXmlErrorBarElement:v57 state:v5];

      v56 = (void *)v58;
      [v6 setErrorBar:v58];
    }
  }
  v59 = OCXFirstChildNamed(a3, (xmlChar *)"trendline");
  while (v59)
  {
    v60 = +[CHXTrendline chdTrendlineFromXmlTrendlineElement:v59 state:v5];
    v61 = [v6 trendlineCollection];
    [v61 addObject:v60];

    v59 = OCXNextSiblingNamed(v59, (xmlChar *)"trendline");
  }
  v62 = [v5 drawingState];
  v63 = [v62 OAXChartNamespace];
  v64 = (_xmlNode *)OCXFindChild(a3, v63, "tx");

  if (v64)
  {
    v65 = [v5 drawingState];
    v66 = [v65 OAXChartNamespace];
    uint64_t v67 = OCXFindChild(v64, v66, "strRef");

    if (v67)
    {
      id v79 = 0;
      id v80 = 0;
      +[CHXString readFromXmlTxElement:v64 formula:&v80 lastCached:&v79 state:v5];
      v68 = (EDValue *)v80;
      id v69 = v79;
      if (v68) {
        [v6 setName:v68];
      }
      if (v69)
      {
        v70 = [v69 string];
        EDValue::makeWithNSString(v70, (uint64_t)&v78);

        v71 = [[CHDDataValue alloc] initWithIndex:-1 value:&v78];
        [v6 setLastCachedName:v71];

        EDValue::~EDValue(&v78);
      }
    }
    else
    {
      v72 = [v5 drawingState];
      v73 = [v72 OAXChartNamespace];
      uint64_t v74 = OCXFindChild(v64, v73, "v");

      if (!v74) {
        goto LABEL_44;
      }
      v68 = (EDValue *)objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", v74);
      EDValue::makeWithNSString(v68, (uint64_t)&v78);
      v75 = [[CHDDataValue alloc] initWithIndex:-1 value:&v78];
      [v6 setLastCachedName:v75];

      EDValue::~EDValue(&v78);
    }
  }
LABEL_44:

  return v6;
}

+ (Class)chxSeriesClassWithState:(id)a3
{
  v3 = [a3 currentChartType];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              objc_opt_isKindOfClass();
            }
          }
        }
      }
    }
  }
  v4 = objc_opt_class();

  return (Class)v4;
}

+ (id)chdSeriesFromXmlSeriesElement:(_xmlNode *)a3 state:(id)a4
{
  id v4 = a4;
  id v5 = [CHDSeries alloc];
  v6 = [v4 chart];
  v7 = [(CHDSeries *)v5 initWithChart:v6];

  return v7;
}

+ (void)resolveSeriesStyle:(id)a3 state:(id)a4
{
  id v34 = a3;
  id v5 = a4;
  v6 = [v34 graphicProperties];
  if (v6)
  {
    if ([v34 conformsToProtocol:&unk_26ECB7708])
    {
      v7 = [v5 autoStyling];
      objc_msgSend(v7, "resolveGraphicPropertiesOfSeries:forSeriesIndex:isLine:", v6, objc_msgSend(v34, "styleIndex"), 1);

      v8 = [v5 autoStyling];
      v9 = [v34 marker];
      uint64_t v10 = [v34 styleIndex];
      v11 = [v5 drawingState];
      v12 = [v11 clientChartGraphicPropertyDefaultsBlock];
      [v8 resolveMarker:v9 withSeriesGraphicProperties:v6 forSeriesIndex:v10 clientGraphicPropertyDefaults:v12];
    }
    else
    {
      v8 = [v5 autoStyling];
      objc_msgSend(v8, "resolveGraphicPropertiesOfSeries:forSeriesIndex:", v6, objc_msgSend(v34, "styleIndex"));
    }
  }
  v13 = [v34 dataValuePropertiesCollection];
  uint64_t v14 = [v13 count];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v14)
  {
    char v16 = isKindOfClass;
    for (uint64_t i = 0; i != v14; ++i)
    {
      v18 = [v13 objectAtIndex:i];
      v19 = [v18 graphicProperties];
      if (v19)
      {
        v20 = [v5 autoStyling];
        if (v16) {
          uint64_t v21 = [v18 dataValueIndex];
        }
        else {
          uint64_t v21 = [v34 styleIndex];
        }
        [v20 resolveGraphicPropertiesOfSeries:v19 forSeriesIndex:v21];
      }
    }
  }
  v22 = [v34 errorBarXAxis];
  if (v22)
  {
    BOOL v23 = [v5 autoStyling];
    id v24 = [v22 graphicProperties];
    objc_msgSend(v23, "resolveGraphicPropertiesOfErrorBar:forSeriesIndex:", v24, objc_msgSend(v34, "styleIndex"));
  }
  v25 = [v34 errorBarYAxis];

  if (v25)
  {
    v26 = [v5 autoStyling];
    v27 = [v25 graphicProperties];
    objc_msgSend(v26, "resolveGraphicPropertiesOfErrorBar:forSeriesIndex:", v27, objc_msgSend(v34, "styleIndex"));
  }
  v28 = [v34 trendlineCollection];
  uint64_t v29 = [v28 count];
  if (v29)
  {
    for (uint64_t j = 0; j != v29; ++j)
    {
      v31 = [v28 objectAtIndex:j];
      if (v31)
      {
        v32 = [v5 autoStyling];
        v33 = [v31 graphicProperties];
        objc_msgSend(v32, "resolveGraphicPropertiesOfTrendline:forSeriesIndex:", v33, objc_msgSend(v34, "styleIndex"));
      }
    }
  }
}

@end