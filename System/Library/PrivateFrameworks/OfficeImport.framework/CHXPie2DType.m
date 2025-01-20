@interface CHXPie2DType
+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4;
+ (void)readFrom:(_xmlNode *)a3 chartType:(id)a4 state:(id)a5;
@end

@implementation CHXPie2DType

+ (void)readFrom:(_xmlNode *)a3 chartType:(id)a4 state:(id)a5
{
  id v43 = a4;
  id v7 = a5;
  v8 = [v7 drawingState];
  v9 = [v8 OAXChartNamespace];
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "firstSliceAng");

  if (v10)
  {
    uint64_t v11 = (uint64_t)CXRequiredUnsignedLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  }
  else
  {
    v34 = [v7 chart];
    v35 = [v34 view3D];

    if (v35)
    {
      parent = a3->parent->parent;
      v37 = [v7 drawingState];
      v38 = [v37 OAXChartNamespace];
      uint64_t v11 = OCXFindChild(parent, v38, "view3D");

      if (v11)
      {
        v39 = [v7 drawingState];
        v40 = [v39 OAXChartNamespace];
        uint64_t v11 = OCXFindChild((_xmlNode *)v11, v40, "rotY");

        if (v11)
        {
          v41 = [v7 chart];
          v42 = [v41 view3D];
          uint64_t v11 = [v42 rotationY];
        }
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  [v43 setFirstSliceAngle:v11];
  v12 = [v7 chart];
  v13 = [v12 plotArea];
  v14 = [v13 graphicProperties];

  if (!v14)
  {
    v15 = [v7 chart];
    v16 = [v15 plotArea];
    v17 = objc_alloc_init(OADGraphicProperties);
    [v16 setGraphicProperties:v17];
  }
  v18 = [v7 chart];
  v19 = [v18 plotArea];
  v20 = [v19 graphicProperties];
  int v21 = [v20 hasOrientedBounds];

  if (v21)
  {
    v22 = [v7 chart];
    v23 = [v22 plotArea];
    v24 = [v23 graphicProperties];
    v25 = [v24 orientedBounds];
    [v25 bounds];
    double v27 = v26;
    double v29 = v28;

    if (v27 == 0.0 && v29 == 0.0)
    {
      v30 = [v7 chart];
      v31 = [v30 plotArea];
      v32 = [v31 graphicProperties];
      v33 = [v32 orientedBounds];
      objc_msgSend(v33, "setBounds:", 0.191593176, 0.0509259259, 0.538888889, 0.898148148);
    }
  }
}

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  id v7 = [v6 chart];
  v8 = +[CHDChartType chartTypeWithChart:v7];

  [a1 readFrom:a3 chartType:v8 state:v6];
  return v8;
}

@end