@interface CHXPlotArea
+ (BOOL)isAxisElement:(_xmlNode *)a3 state:(id)a4;
+ (id)readFrom:(_xmlNode *)a3 state:(id)a4;
@end

@implementation CHXPlotArea

+ (id)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  v6 = [v5 chart];
  id v36 = [v6 plotArea];

  v34 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:");
  v7 = [v5 autoStyling];
  [v7 resolvePlotAreaGraphicProperties:v34];

  [v36 setGraphicProperties:v34];
  v8 = OCXFirstChild(a3);
  v37 = v5;
  while (v8)
  {
    if ([a1 isAxisElement:v8 state:v5])
    {
      v9 = +[CHXAxis chdAxisFromXmlAxisElement:v8 state:v5];
      v10 = [v36 axes];
      [v10 addObject:v9];

      v11 = [v36 axes];
      unint64_t v12 = [v11 count];

      if (v12 >= 3) {
        [v9 setSecondary:1];
      }
      v13 = [v37 drawingState];
      v14 = [v13 OAXChartNamespace];
      if (CXNodeHasName(v8, v14, (xmlChar *)"catAx"))
      {
LABEL_9:
      }
      else
      {
        v15 = [v37 drawingState];
        v16 = [v15 OAXChartNamespace];
        if (CXNodeHasName(v8, v16, (xmlChar *)"dateAx"))
        {

          goto LABEL_9;
        }
        v22 = [v37 drawingState];
        v23 = [v22 OAXChartNamespace];
        BOOL HasName = CXNodeHasName(v8, v23, (xmlChar *)"valAx");

        if (!HasName)
        {
          if (v12 <= 2) {
            uint64_t v17 = 2;
          }
          else {
            uint64_t v17 = 5;
          }
          goto LABEL_26;
        }
      }
      if ([v9 isHorizontalPosition])
      {
        if (v12 <= 2) {
          uint64_t v17 = 0;
        }
        else {
          uint64_t v17 = 3;
        }
      }
      else if (v12 <= 2)
      {
        uint64_t v17 = 1;
      }
      else
      {
        uint64_t v17 = 4;
      }
LABEL_26:
      [v9 setAxisType:v17];
      id v5 = v37;
      goto LABEL_27;
    }
    v9 = [v5 drawingState];
    v18 = [v9 OAXChartNamespace];
    if (CXNodeHasName(v8, v18, (xmlChar *)"spPr")) {
      goto LABEL_18;
    }
    v19 = [v5 drawingState];
    v20 = [v19 OAXChartNamespace];
    BOOL v21 = CXNodeHasName(v8, v20, (xmlChar *)"layout");

    if (v21) {
      goto LABEL_28;
    }
    v9 = +[CHXChartType chdChartTypeFromXmlChartTypeElement:v8 state:v5];
    if (v9)
    {
      v18 = [v36 chartTypes];
      [(CXNamespace *)v18 addObject:v9];
LABEL_18:
    }
LABEL_27:

LABEL_28:
    v8 = OCXNextSibling(v8);
  }
  v25 = [v36 chartTypes];
  for (unint64_t i = 0; i < [v25 count]; ++i)
  {
    v27 = [v25 objectAtIndex:i];
    +[CHXChartType resolveStyle:v27 state:v5];
  }
  for (unint64_t j = 0; j < [v25 count]; ++j)
  {
    v29 = [v25 objectAtIndex:j];
    v30 = [v29 axisForClass:objc_opt_class()];
    v31 = [v29 axisForClass:objc_opt_class()];
    v32 = v31;
    if (v31 && v30) {
      objc_msgSend(v30, "setCrossBetween:", objc_msgSend(v31, "crossBetween"));
    }
  }
  return v36;
}

+ (BOOL)isAxisElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  v6 = [v5 drawingState];
  v7 = [v6 OAXChartNamespace];
  if (CXNodeHasName(a3, v7, (xmlChar *)"valAx"))
  {
    BOOL HasName = 1;
  }
  else
  {
    v9 = [v5 drawingState];
    v10 = [v9 OAXChartNamespace];
    if (CXNodeHasName(a3, v10, (xmlChar *)"catAx"))
    {
      BOOL HasName = 1;
    }
    else
    {
      v11 = [v5 drawingState];
      unint64_t v12 = [v11 OAXChartNamespace];
      if (CXNodeHasName(a3, v12, (xmlChar *)"dateAx"))
      {
        BOOL HasName = 1;
      }
      else
      {
        v13 = [v5 drawingState];
        v14 = [v13 OAXChartNamespace];
        BOOL HasName = CXNodeHasName(a3, v14, (xmlChar *)"serAx");
      }
    }
  }
  return HasName;
}

@end