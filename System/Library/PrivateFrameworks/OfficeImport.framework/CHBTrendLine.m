@interface CHBTrendLine
+ (id)readTrendlineGraphicProperties:(const XlChartSeriesFormat *)a3 forStyleIndex:(unint64_t)a4 state:(id)a5;
+ (int)edTrendLineTypeFrom:(int)a3 order:(int)a4;
+ (int)xlTrendLineRegressionTypeFrom:(int)a3;
+ (void)readFrom:(void *)a3 toSeries:(id)a4 state:(id)a5;
@end

@implementation CHBTrendLine

+ (void)readFrom:(void *)a3 toSeries:(id)a4 state:(id)a5
{
  id v21 = a4;
  id v8 = a5;
  if (a3)
  {
    v9 = [v21 objectWithKey:(*(unsigned int (**)(void *))(*(void *)a3 + 24))(a3)];
    uint64_t v10 = [a1 edTrendLineTypeFrom:*((unsigned int *)a3 + 60) order:*((unsigned __int8 *)a3 + 244)];
    v11 = objc_alloc_init(CHDTrendline);
    [(CHDTrendline *)v11 setType:v10];
    v12 = +[CHBTrendLineLabel readFrom:a3 state:v8];
    [(CHDTrendline *)v11 setLabel:v12];

    [(CHDTrendline *)v11 setDisplayEquation:*((unsigned char *)a3 + 245) != 0];
    [(CHDTrendline *)v11 setDisplayRSquaredValue:*((unsigned char *)a3 + 246) != 0];
    [(CHDTrendline *)v11 setBackward:*((double *)a3 + 29)];
    [(CHDTrendline *)v11 setForward:*((double *)a3 + 28)];
    [(CHDTrendline *)v11 setInterceptYAxis:*((double *)a3 + 27)];
    if (v10 == 3)
    {
      [(CHDTrendline *)v11 setMovingAveragePeriod:*((unsigned __int8 *)a3 + 244)];
    }
    else if (v10 == 4)
    {
      [(CHDTrendline *)v11 setPolynomialOrder:*((unsigned __int8 *)a3 + 244)];
    }
    v13 = +[CHBData readFrom:*((void *)a3 + 18) state:v8];
    v14 = [v13 dataValues];
    if ([v14 count])
    {
      uint64_t v15 = [v14 dataPointAtIndex:0];
      if (v15)
      {
        v16 = (EDValue *)(v15 + 8);
        if (EDValue::isStringType((EDValue *)(v15 + 8)))
        {
          v17 = [v8 resources];
          v18 = EDValue::resolvedEDStringValue(v16, v17);
          [(CHDTrendline *)v11 setName:v18];
        }
      }
    }
    v19 = objc_msgSend(a1, "readTrendlineGraphicProperties:forStyleIndex:state:", objc_msgSend(v8, "defaultFormatForXlSeries:", a3), objc_msgSend(v9, "styleIndex"), v8);
    [(CHDTrendline *)v11 setGraphicProperties:v19];

    v20 = [v9 trendlineCollection];
    [v20 addObject:v11];
  }
}

+ (int)edTrendLineTypeFrom:(int)a3 order:(int)a4
{
  switch(a3)
  {
    case 1:
      char v4 = 0;
      int v5 = 0;
      break;
    case 2:
      char v4 = 0;
      int v5 = 2;
      break;
    case 3:
      char v4 = 0;
      int v5 = 5;
      break;
    case 4:
      char v4 = 0;
      int v5 = 3;
      break;
    default:
      int v5 = 4;
      char v4 = 1;
      break;
  }
  if (((a4 == 1) & v4) != 0) {
    return 1;
  }
  else {
    return v5;
  }
}

+ (id)readTrendlineGraphicProperties:(const XlChartSeriesFormat *)a3 forStyleIndex:(unint64_t)a4 state:(id)a5
{
  id v7 = a5;
  id v8 = +[CHBGraphicProperties oadGraphicPropertiesFromXlChartSeriesFormat:a3 state:v7];
  v9 = [v7 autoStyling];
  [v9 resolveGraphicPropertiesOfTrendline:v8 forSeriesIndex:a4];

  return v8;
}

+ (int)xlTrendLineRegressionTypeFrom:(int)a3
{
  if (a3 > 5) {
    return 0;
  }
  else {
    return dword_238EDEFD0[a3];
  }
}

@end