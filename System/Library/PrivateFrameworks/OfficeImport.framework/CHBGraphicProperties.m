@interface CHBGraphicProperties
+ (char)oaPresetDashTypeFromLinePatternEnum:(int)a3;
+ (float)widthFromLineWeightEnum:(int)a3;
+ (id)mapAssociatedEscherObjectstate:(id)a3;
+ (id)mapFillStyle:(const XlChartFillStyle *)a3 xlPictureFormat:(const XlChartPicF *)a4 state:(id)a5;
+ (id)mapFillStyleForMarker:(const XlChartMarkerStyle *)a3 complex:(BOOL)a4 state:(id)a5;
+ (id)mapPresetDashFromPattern:(int)a3;
+ (id)oadGraphicPropertiesFromShapePropsStream:(const char *)a3 size:(unsigned int)a4;
+ (id)oadGraphicPropertiesFromState:(id)a3 xlLineStyle:(const XlChartLineStyle *)a4 xlFillStyle:(const XlChartFillStyle *)a5;
+ (id)oadGraphicPropertiesFromXlChartFrameType:(XlChartFrameType *)a3 state:(id)a4;
+ (id)oadGraphicPropertiesFromXlChartSeriesFormat:(const XlChartSeriesFormat *)a3 state:(id)a4;
+ (id)oadGraphicPropertiesFromXlChartTextFrame:(void *)a3 state:(id)a4;
+ (id)oadGraphicPropertiesFromXlLeaderLineStyleInPlot:(const void *)a3 state:(id)a4;
+ (id)oadGraphicPropertiesFromXlMarkerStyle:(const XlChartMarkerStyle *)a3 complex:(BOOL)a4 state:(id)a5;
+ (id)oadStrokeFrom:(const XlChartLineStyle *)a3;
+ (int)lineWeightEnumFromWidth:(float)a3;
+ (int)presetLinePatternEnumFromDash:(id)a3;
@end

@implementation CHBGraphicProperties

+ (id)oadGraphicPropertiesFromXlChartFrameType:(XlChartFrameType *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = [v6 ebReaderSheetState];
  v8 = [v7 readerState];
  v9 = [v8 oaState];
  if ([v9 useXmlBlobs])
  {
    unsigned int var16 = a3->var16;

    if (var16)
    {
      v11 = [a1 oadGraphicPropertiesFromShapePropsStream:a3->var15 size:a3->var16];
      goto LABEL_6;
    }
  }
  else
  {
  }
  v11 = objc_alloc_init(OADGraphicProperties);
  v12 = [a1 mapFillStyle:a3->var10 xlPictureFormat:a3->var11 state:v6];
  [(OADGraphicProperties *)v11 setFill:v12];

  v13 = [a1 oadStrokeFrom:a3->var9];
  [(OADGraphicProperties *)v11 setStroke:v13];

  v14 = +[CHDChart binaryEffects:a3->var12];
  [(OADGraphicProperties *)v11 setEffects:v14];

LABEL_6:
  v15 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", a3->var1, a3->var2, a3->var3, a3->var4);
  [(OADDrawableProperties *)v11 setOrientedBounds:v15];

  return v11;
}

+ (id)mapFillStyle:(const XlChartFillStyle *)a3 xlPictureFormat:(const XlChartPicF *)a4 state:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (!a3)
  {
    v10 = 0;
    goto LABEL_23;
  }
  if (a3->var7)
  {
    uint64_t v9 = +[CHDAutomaticObject automaticFill];
LABEL_4:
    v10 = (OADSolidFill *)v9;
    goto LABEL_23;
  }
  if (!a3->var3)
  {
    uint64_t v9 = +[OADNullFill nullFill];
    goto LABEL_4;
  }
  v11 = [v7 ebReaderSheetState];
  v12 = [v11 readerState];
  v13 = +[EBEscher readRootObjectWithType:6 state:v12];

  if (v13)
  {
    uint64_t v14 = [v13 eshObject];
    if ((*(unsigned int (**)(uint64_t))(*(void *)v14 + 16))(v14) == 4)
    {
      v15 = objc_alloc_init(OADGraphicProperties);
      v16 = [v8 ebReaderSheetState];
      v17 = [v16 readerState];
      v18 = [v17 oaState];
      +[OABShape readGraphicDefaults:v13 to:v15 state:v18];

      v10 = [(OADGraphicProperties *)v15 fill];

      if (!a4) {
        goto LABEL_14;
      }
LABEL_12:
      if ((a4->var3 & 0xFFFFFFFE) == 2)
      {
        objc_opt_class();
        v19 = v10;
        v20 = objc_alloc_init(OADTileTechnique);
        [(OADSolidFill *)v19 setTechnique:v20];
      }
      goto LABEL_14;
    }
  }
  v10 = 0;
  if (a4) {
    goto LABEL_12;
  }
LABEL_14:
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && a3->var3 == 1) {
      [v8 xlReader];
    }
  }
  else if (a3->var3 == 1)
  {
    v10 = objc_alloc_init(OADSolidFill);
    v21 = +[OADIndexedColor indexedColorWithIndex:a3->var4];
    [(OADSolidFill *)v10 setColor:v21];
  }
  else
  {
    v10 = 0;
  }

LABEL_23:
  return v10;
}

+ (id)oadStrokeFrom:(const XlChartLineStyle *)a3
{
  if (!a3)
  {
    v5 = 0;
    goto LABEL_8;
  }
  if (a3->var5)
  {
    uint64_t v4 = +[CHDAutomaticObject automaticStroke];
LABEL_7:
    v5 = (OADStroke *)v4;
    goto LABEL_8;
  }
  if (a3->var2 == 5)
  {
    uint64_t v4 = +[OADStroke nullStroke];
    goto LABEL_7;
  }
  v5 = objc_alloc_init(OADStroke);
  v8 = objc_alloc_init(OADSolidFill);
  uint64_t v9 = +[OADIndexedColor indexedColorWithIndex:a3->var4];
  float var8 = a3->var8;
  if (var8 != 1.0)
  {
    v11 = [(OADColorTransform *)[OADValueColorTransform alloc] initWithType:6];
    *(float *)&double v12 = var8;
    [(OADValueColorTransform *)v11 setValue:v12];
    [v9 addTransform:v11];
  }
  [(OADSolidFill *)v8 setColor:v9];
  [(OADStroke *)v5 setFill:v8];
  [a1 widthFromLineWeightEnum:a3->var3];
  -[OADStroke setWidth:](v5, "setWidth:");
  int var9 = a3->var9;
  if (var9 >= 1)
  {
    *(float *)&double v13 = (float)var9;
    [(OADStroke *)v5 setWidth:v13];
  }
  v15 = [a1 mapPresetDashFromPattern:a3->var2];
  [(OADStroke *)v5 setDash:v15];

LABEL_8:
  return v5;
}

+ (float)widthFromLineWeightEnum:(int)a3
{
  if (a3 <= 1)
  {
    if (a3 == 1) {
      return 2.0;
    }
    return 1.0;
  }
  if (a3 != 2)
  {
    float result = 0.25;
    if (a3 == 0xFFFF) {
      return result;
    }
    return 1.0;
  }
  return 3.0;
}

+ (id)mapPresetDashFromPattern:(int)a3
{
  if (a3 == 5)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&a3;
    v3 = objc_alloc_init(OADPresetDash);
    -[OADPresetDash setType:](v3, "setType:", [a1 oaPresetDashTypeFromLinePatternEnum:v4]);
  }
  return v3;
}

+ (char)oaPresetDashTypeFromLinePatternEnum:(int)a3
{
  if (a3 > 8) {
    return -1;
  }
  else {
    return byte_238EDEECC[a3];
  }
}

+ (id)oadGraphicPropertiesFromState:(id)a3 xlLineStyle:(const XlChartLineStyle *)a4 xlFillStyle:(const XlChartFillStyle *)a5
{
  id v8 = a3;
  uint64_t v9 = objc_alloc_init(OADGraphicProperties);
  v10 = [a1 mapFillStyle:a5 xlPictureFormat:0 state:v8];
  [(OADGraphicProperties *)v9 setFill:v10];

  v11 = [a1 oadStrokeFrom:a4];
  [(OADGraphicProperties *)v9 setStroke:v11];

  double v12 = +[CHDChart binaryEffects:0];
  [(OADGraphicProperties *)v9 setEffects:v12];

  return v9;
}

+ (id)oadGraphicPropertiesFromXlChartSeriesFormat:(const XlChartSeriesFormat *)a3 state:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(OADGraphicProperties);
  if (a3)
  {
    var1 = a3->var1;
    var2 = a3->var2;
    var4 = a3->var4;
    a3 = (const XlChartSeriesFormat *)a3->var16;
  }
  else
  {
    var1 = 0;
    var2 = 0;
    var4 = 0;
  }
  v11 = [a1 mapFillStyle:var2 xlPictureFormat:var4 state:v6];
  [(OADGraphicProperties *)v7 setFill:v11];

  double v12 = [a1 oadStrokeFrom:var1];
  [(OADGraphicProperties *)v7 setStroke:v12];

  double v13 = +[CHDChart binaryEffects:a3];
  [(OADGraphicProperties *)v7 setEffects:v13];

  return v7;
}

+ (id)oadGraphicPropertiesFromXlMarkerStyle:(const XlChartMarkerStyle *)a3 complex:(BOOL)a4 state:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = objc_alloc_init(OADGraphicProperties);
  if (a3)
  {
    if (a3->var8)
    {
      if (a3->var9)
      {
        v10 = +[CHDAutomaticObject automaticStroke];
        [(OADGraphicProperties *)v9 setStroke:v10];
      }
      else
      {
        v10 = objc_alloc_init(OADStroke);
        v11 = objc_alloc_init(OADSolidFill);
        double v12 = +[OADIndexedColor indexedColorWithIndex:a3->var5];
        [(OADSolidFill *)v11 setColor:v12];

        [(OADStroke *)v10 setFill:v11];
        [a1 widthFromLineWeightEnum:1];
        -[OADStroke setWidth:](v10, "setWidth:");
        double v13 = [a1 mapPresetDashFromPattern:0];
        [(OADStroke *)v10 setDash:v13];

        [(OADGraphicProperties *)v9 setStroke:v10];
      }
    }
    if (a3->var7)
    {
      uint64_t v14 = [a1 mapFillStyleForMarker:a3 complex:v5 state:v8];
      [(OADGraphicProperties *)v9 setFill:v14];
    }
  }

  return v9;
}

+ (id)mapFillStyleForMarker:(const XlChartMarkerStyle *)a3 complex:(BOOL)a4 state:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (a3)
  {
    if (a3->var9)
    {
      uint64_t v9 = +[CHDAutomaticObject automaticFill];
    }
    else if (!v5 {
           || ([a1 mapAssociatedEscherObjectstate:v8],
    }
               (uint64_t v9 = (OADSolidFill *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v9 = objc_alloc_init(OADSolidFill);
      v10 = +[OADIndexedColor indexedColorWithIndex:a3->var6];
      [(OADSolidFill *)v9 setColor:v10];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)mapAssociatedEscherObjectstate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 ebReaderSheetState];
  BOOL v5 = [v4 readerState];
  id v6 = +[EBEscher readRootObjectWithType:6 state:v5];

  if (v6
    && (uint64_t v7 = [v6 eshObject], (*(unsigned int (**)(uint64_t))(*(void *)v7 + 16))(v7) == 4))
  {
    id v8 = objc_alloc_init(OADGraphicProperties);
    uint64_t v9 = [v3 ebReaderSheetState];
    v10 = [v9 readerState];
    v11 = [v10 oaState];
    +[OABShape readGraphicDefaults:v6 to:v8 state:v11];

    double v12 = [(OADGraphicProperties *)v8 fill];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

+ (id)oadGraphicPropertiesFromShapePropsStream:(const char *)a3 size:(unsigned int)a4
{
  xmlNodePtr v4 = CXGetRootElement((const unsigned __int8 *)a3, a4);
  xmlNodePtr v5 = v4;
  if (v4)
  {
    if (xmlStrEqual(v4->name, (const xmlChar *)"spPr"))
    {
      id v6 = objc_alloc_init(OADGraphicProperties);
      uint64_t v7 = [[OAXDrawingState alloc] initWithClient:0];
      +[OAXGraphic readPropertiesFromXmlNode:v5 graphicProperties:v6 drawingState:v7];
    }
    else
    {
      id v6 = 0;
    }
    xmlFreeDoc(v5->doc);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (id)oadGraphicPropertiesFromXlChartTextFrame:(void *)a3 state:(id)a4
{
  xmlNodePtr v4 = [a1 oadGraphicPropertiesFromXlChartFrameType:a3 state:a4];
  return v4;
}

+ (id)oadGraphicPropertiesFromXlLeaderLineStyleInPlot:(const void *)a3 state:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    if (*((_DWORD *)a3 + 27)
      && (+[CHBGraphicProperties oadGraphicPropertiesFromShapePropsStream:size:](CHBGraphicProperties, "oadGraphicPropertiesFromShapePropsStream:size:", *((void *)a3 + 11)), uint64_t v7 = (OADGraphicProperties *)objc_claimAutoreleasedReturnValue(), (v8 = v7) != 0))
    {
      uint64_t v9 = v7;
      if ([(OADGraphicProperties *)v7 hasStroke]) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v8 = objc_alloc_init(OADGraphicProperties);

    v10 = [a1 oadStrokeFrom:*((void *)a3 + 7)];
    [(OADGraphicProperties *)v8 setStroke:v10];

LABEL_8:
    v11 = v8;

    goto LABEL_10;
  }
  v11 = 0;
LABEL_10:

  return v11;
}

+ (int)presetLinePatternEnumFromDash:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = (int)[v3 type] + 1;
      if (v5 <= 0xF)
      {
        int v4 = dword_238EDEED8[v5];
        goto LABEL_8;
      }
    }
LABEL_7:
    int v4 = 5;
    goto LABEL_8;
  }
  int v4 = 1;
LABEL_8:

  return v4;
}

+ (int)lineWeightEnumFromWidth:(float)a3
{
  if (a3 >= 1.0 && a3 < 2.0) {
    return 0;
  }
  if (a3 >= 2.0 && a3 < 3.0) {
    return 1;
  }
  if (a3 >= 3.0) {
    return 2;
  }
  return 0xFFFF;
}

@end