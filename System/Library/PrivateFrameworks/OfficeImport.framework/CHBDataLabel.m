@interface CHBDataLabel
+ (id)chdDataLabelFromXlChartCustomLabelText:(void *)a3 state:(id)a4;
+ (id)chdDataLabelFromXlChartSeriesFormat:(const XlChartSeriesFormat *)a3 state:(id)a4;
+ (int)chdLabelPositionEnumFromXlLabelPosition:(int)a3;
+ (int)xlLabelPositionEnumFromCHDDataLabelPosition:(int)a3;
@end

@implementation CHBDataLabel

+ (id)chdDataLabelFromXlChartSeriesFormat:(const XlChartSeriesFormat *)a3 state:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 xlCurrentPlot];
  v7 = 0;
  if (a3)
  {
    uint64_t v8 = v6;
    if (v6)
    {
      v9 = [v5 resources];
      v7 = +[CHDDataLabel dataLabelWithResources:v9];

      [v7 setShowLeaderLines:*(unsigned __int8 *)(v8 + 143)];
      [v7 setShowCategoryName:a3->var19];
      [v7 setShowPercent:a3->var18];
      [v7 setShowBubbleSize:a3->var21];
      [v7 setShowValue:a3->var17];
      v10 = +[CHBGraphicProperties oadGraphicPropertiesFromXlChartSeriesFormat:a3 state:v5];
      [v7 setGraphicProperties:v10];

      v11 = +[CHBGraphicProperties oadGraphicPropertiesFromXlLeaderLineStyleInPlot:v8 state:v5];
      [v7 setLeaderlineGraphicProperties:v11];
    }
  }

  return v7;
}

+ (id)chdDataLabelFromXlChartCustomLabelText:(void *)a3 state:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 xlCurrentPlot];
  v7 = 0;
  if (a3)
  {
    uint64_t v8 = v6;
    if (v6)
    {
      v9 = [v5 resources];
      v7 = +[CHDDataLabel dataLabelWithResources:v9];

      [v7 setShowLeaderLines:*(unsigned __int8 *)(v8 + 143)];
      [v7 setShowCategoryName:*((unsigned __int8 *)a3 + 197)];
      [v7 setShowPercent:*((unsigned __int8 *)a3 + 199)];
      [v7 setShowBubbleSize:*((unsigned __int8 *)a3 + 200)];
      [v7 setShowValue:*((unsigned __int8 *)a3 + 196)];
      [v7 setShowLegendKey:*((unsigned __int8 *)a3 + 195)];
      [v7 setShowSeriesName:*((unsigned __int8 *)a3 + 198)];
      objc_msgSend(v7, "setPosition:", +[CHBDataLabel chdLabelPositionEnumFromXlLabelPosition:](CHBDataLabel, "chdLabelPositionEnumFromXlLabelPosition:", *((unsigned int *)a3 + 34)));
      if (*((unsigned char *)a3 + 202)) {
        [v7 setIsContentFormatDerivedFromDataPoints:1];
      }
      else {
        [v7 setContentFormatId:*((__int16 *)a3 + 92)];
      }
      v10 = +[CHBGraphicProperties oadGraphicPropertiesFromXlChartTextFrame:a3 state:v5];
      [v7 setGraphicProperties:v10];

      v11 = +[CHBGraphicProperties oadGraphicPropertiesFromXlLeaderLineStyleInPlot:v8 state:v5];
      [v7 setLeaderlineGraphicProperties:v11];

      v12 = +[CHBString edStringFromXlChartTextFrame:a3 state:v5];
      [v7 setString:v12];

      [v7 setRotationAngle:(double)*((__int16 *)a3 + 88)];
    }
  }

  return v7;
}

+ (int)chdLabelPositionEnumFromXlLabelPosition:(int)a3
{
  if ((a3 - 1) >= 0xA) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int)xlLabelPositionEnumFromCHDDataLabelPosition:(int)a3
{
  if ((a3 - 1) >= 0xA) {
    return 0;
  }
  else {
    return a3;
  }
}

@end